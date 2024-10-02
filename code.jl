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

gs = filter(startswith("G1"), readlines("gsq.gcode"))
function doesit(gs)
    i = 1
    cur_pos = [0.0, 0.0, 0.0, 0.0, 0.0]
    last_pos = [0.0, 0.0, 0.0, 0.0, 0.0]
    all_ps = []
    cur_path = []

    for g in first(gs, 40)
        as = split(find_first_part(g))[2:end]
        (cur_pos, efound) = update_cur_pos!(cur_pos, as)

        # Determine if extrusion is happening
        extruding = (last_pos[4] + cur_pos[4]) > 0

        if extruding
            # Starting or continuing an extrusion path
            if isempty(cur_path)
                p = [last_pos, cur_pos]
                @show "starting a new path" p
                append!(cur_path, p)
            else
                @show "adding to existing path" cur_pos, cur_path
                push!(cur_path, copy(cur_pos))
            end
        else
            # No extrusion or finished, check for new path
            if efound
                cur_pos[4] = last_pos[4] + cur_pos[4]
            end
            if !isempty(cur_path)
                @show "adding cur path to all_ps" cur_path
                push!(all_ps, copy(cur_path))
                cur_path = []
            end
        end

        @info i, (last_pos, cur_pos)
        cur_pos[4] = min(0, cur_pos[4])  # Reset E if needed

        last_pos = copy(cur_pos)
        i += 1
    end

    # If any remaining path, add to all_ps
    if !isempty(cur_path)
        push!(all_ps, copy(cur_path))
    end

    all_ps
end

ps = doesit(gs)