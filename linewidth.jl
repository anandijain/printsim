using Plots
Base.parse(T) = x -> Base.parse(T, x)
s = readlines("./tests/wormdrive/sliced/plate_1.gcode")
lws_strs = filter(startswith("; LINE_WIDTH"), s)
lws = map(parse(Float64) ∘ last ∘ split, lws_strs)

extrema(lws)
histogram(lws)

# assume g1 f exclusive with xyze


# coords.json
# Vec<Vec<Tuple<Coord, Coord>>>
# 