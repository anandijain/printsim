using StatsBase

function slice_with_bambu(executable::String, outputdir::String, slicefile::String;
    slice::Int=0, debug::Int=2, export_3mf::String="output.3mf")
    cmd = `$(executable) --outputdir $(outputdir) --export-slicedata $(outputdir)/ --slice $(slice) --debug $(debug) --export-3mf $(export_3mf) $(slicefile)`
    run(cmd)
end

function writelines(fn, vec)
    open(fn, "w") do file
        for line in vec
            write(file, line * "\n")
        end
    end
end


executable = "C:\\Program Files\\Bambu Studio\\bambu-studio.exe"
outputdir = "./tests/wormdrive/sliced"
!ispath(outputdir) && mkdir(outputdir)
slicefile = "./tests/wormdrive/wormdrive.step"

slice_with_bambu(executable, outputdir, slicefile; slice=0, debug=2, export_3mf="output.3mf")


gcode_fn(name) = "./tests/$name/sliced/plate_1.gcode"
filtf(g) = filter(x -> !startswith(x, ";") && !isempty(x), g)

function filt_gcode(name)
    fn = gcode_fn(name)
    g = readlines(fn)
    filtf(g)
end

gs = filt_gcode("square_ring")
g1s = filter(startswith("G1"), gs)
writelines("gs_square.gcode", gs)
gt = tally(map(first ∘ split, gs)) 
gt|> map(println);

function split_paths(gcodes::Vector{String})
    paths = Vector{Vector{String}}()  # List of all paths
    current_path = Vector{String}()   # Current path being constructed

    extruding = false  # Flag to check if extruding material

    for line in gcodes
        # Split the line into parts
        commands = split(line)

        # Look for G1 commands with extrusion (E)
        if startswith(line, "G1")
            extrusion_found = false

            for part in commands
                if startswith(part, "E")
                    e_val = parse(Float64, part[2:end])
                    if e_val > 0
                        extrusion_found = true
                    end
                end
            end

            if extrusion_found
                # Add this line to the current path
                push!(current_path, line)
                extruding = true
            else
                # If we're done extruding, save the current path and start a new one
                if extruding && !isempty(current_path)
                    push!(paths, current_path)
                    current_path = Vector{String}()
                end
                extruding = false
            end
        end
    end

    # Add the last path if it's still valid
    if !isempty(current_path)
        push!(paths, current_path)
    end

    return paths
end

ps = split_paths(gs)
extract_xy(path) = [(parse(Float64, mX[1]), parse(Float64, mY[1])) for line in path for mX in [match(r"X([\d\.-]+)", line)], mY in [match(r"Y([\d\.-]+)", line)]]
xy_coordinates = extract_xy(ps[2])
println(xy_coordinates)
layerh = 0.2

check_move(l) = !occursin(r"Z", l) || !(occursin(r"X|Y", l))
all(check_move, gs)

for l in g1s
    if occursin(r"Z", l) && occursin(r"X|Y", l)
        error("Z move combined with X/Y found in line: $l")
    end
end

for l in g1s
    if occursin(r"Z", l) && occursin(r"E", l)
        error("Extrusion while moving in Z detected in line: $l")
    end
end
