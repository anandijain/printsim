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