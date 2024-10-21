using Plots, JSON3, LinearAlgebra
Base.parse(T) = x -> Base.parse(T, x)
s = readlines("./tests/wormdrive/sliced/plate_1.gcode")
lws_strs = filter(startswith("; LINE_WIDTH"), s)
lws = map(parse(Float64) ∘ last ∘ split, lws_strs)

extrema(lws)
histogram(lws)

# assume g1 f exclusive with xyze

# basic calculation of extruded material 
j = JSON3.read(read("wormdrive_extsrusion_distances.json"))
histogram(j)

j2 = JSON3.read(read("wormdrive_coords.json"))
seg = j2[1]
norm(seg[2]-seg[1])
dists = map(x->norm(x[2]-x[1]), j2)
histogram(dists)
sum(dists)

fila_area = ((1.75/2)^2)*π
areas = fila_area .* j # mm^2 * mm 
# vols = dists .* areas
f(d, v) = v/(.2*d) 

widths = map(x-> f(x[1], x[2]), zip(dists, areas))
histogram(widths)


a = [0, 0]
b = [1, 1]
angle = π/4
lw = 1
sind(45) ≈ 1/sqrt(2)
dy = sind(45)*(lw/2)
dx = cosd(45)*(lw/2)
d = [dx, dy]


front_left = a + d # front left should be [-.35, .35] front_right = a - d
back_left = b + d
back_right = b - d

coords = [front_left, front_right, back_left, back_right]

mini = copy(coords[1])
maxi = copy(coords[1])

for coord in coords[2:end]
    for i in 1:2
        mini[i] = min(mini[i], coord[i])
        maxi[i] = max(maxi[i], coord[i])
    end
end


.4*.2*norm(b-a)