using Graphs, JSON3

j = JSON3.read(read("coords.json"))

n_v = length(j)

g = SimpleGraph(n_v)

es = []
last_a = [0,0,0]
last_b = [0,0,0]
for (i, (a, b)) in enumerate(j)
    if a == last_b
        push!(es, (i-1, i))
    end
    last_a = a
    last_b = b
end

for e in es
    add_edge!(g, e)
end
ccs = connected_components(g)

first_layer = filter(x->x[1][3]==.2, j)
mat = reduce(hcat, ab)
x = mat[1, :]

# function export_