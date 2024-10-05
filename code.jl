using JSON3
function find_first_part(s::String)
    idx = findfirst(==(';'), s)
    return isnothing(idx) ? s : s[1:idx-1]
end

function update_cur_pos!(cur_pos, as)
    e_found = false  # Flag to check if E was found
    for a in as
        # @info a
        if startswith(a, "X")
            cur_pos[1] = parse(Float64, a[2:end])
        elseif startswith(a, "Y")
            cur_pos[2] = parse(Float64, a[2:end])
        elseif startswith(a, "Z")
            cur_pos[3] = parse(Float64, a[2:end])
        elseif startswith(a, "E")
            cur_pos[4] = parse(Float64, a[2:end])
            e_found = true  # Mark that E was found
        elseif startswith(a, "F")
            cur_pos[5] = parse(Float64, a[2:end])
        else
            error("Unexpected command")
        end
    end

    (cur_pos, e_found)
end

function doesit(gs)
    cur_pos = [0.0, 0.0, 0.0, 0.0, 0.0]  # [X, Y, Z, E, F]
    last_pos = [0.0, 0.0, 0.0, 0.0, 0.0]  # Track the last position
    all_ps = []  # Store all paths
    cur_path = []  # Current path

    for g in gs
        as = split(find_first_part(g))[2:end]
        (cur_pos, efound) = update_cur_pos!(cur_pos, as)

        # Determine if extrusion is happening (extrusion > 0)
        extruding = (cur_pos[4] > 0)

        if extruding
            # Add to the current path or start a new path if it's empty
            if isempty(cur_path)
                append!(cur_path, [copy(last_pos), copy(cur_pos)])
            else
                push!(cur_path, copy(cur_pos))
            end
        else
            # If not extruding, finalize the current path and start a new one
            if !isempty(cur_path)
                push!(all_ps, copy(cur_path))
                cur_path = []
            end
        end

        # Update last_pos for next iteration
        last_pos = copy(cur_pos)

        # Reset the extrusion position to handle relative values properly
        cur_pos[4] = 0
    end

    # Add any remaining path to all_ps
    if !isempty(cur_path)
        push!(all_ps, copy(cur_path))
    end

    all_ps
end
gs = filter(startswith("G1"), readlines("gsq.gcode"))
gst = filter(!startswith("G1 F"), gs)
ps = doesit(gs)

g = gst[1]
g = gst[2]

function doit2(gs)
    cur_pos = [0.0, 0.0, 0.0, 0.0, 0.0]  # [X, Y, Z, E, F]
    last_pos = [0.0, 0.0, 0.0, 0.0, 0.0]  # Track the last position
    all_ps = []  # Store all paths

    for g in gs
        as = split(find_first_part(g))[2:end]
        (cur_pos, efound) = update_cur_pos!(cur_pos, as)

        if efound
            extruding = (last_pos[4] + cur_pos[4]) > 0
            cur_pos[4] = 0
        else
            extruding = false
        end

        if extruding
            push!(all_ps, (copy(last_pos), copy(cur_pos)))
        end

        last_pos = copy(cur_pos)
    end
    all_ps

end

ps = doit2(gst)
extract_coords(g) = first(g, 3)
cs = map(x -> extract_coords.(x), ps)
# for c in cs
#     if c[1] == c[2]
csreal = filter(x->x[1]!=x[2], cs)

# multipaths = []
# for i in eachindex(csreal)
#     if i == length(csreal)
#         break
#     end
#     if csreal[i][2] == csreal[i+1][1]
        

function group_contiguous_paths(paths::Vector{Tuple{Vector{Float64},Vector{Float64}}})
    grouped_paths = []
    current_group = [paths[1]] # Start with the first path

    for i in 2:length(paths)
        # If the "after" position of the previous path matches the "before" position of the current path
        if paths[i-1][2] == paths[i][1]
            push!(current_group, paths[i]) # Add to the current group
        else
            push!(grouped_paths, current_group) # Save the current group
            current_group = [paths[i]] # Start a new group
        end
    end

    # Push the last group
    push!(grouped_paths, current_group)

    return grouped_paths
end

# {
#     [A, B],
#     [A2, B2]
# }
group_contiguous_paths(csreal)
foo = JSON3.read(JSON3.write(csreal))
JSON3.write("coords.json", csreal)