import bpy
import json 

# with open("C:/Users/anand/.rust/printsim/test_hook_cuboids.json") as f: data = json.load(f)
with open("C:/Users/anand/.rust/printsim/square_ring_cuboids.json") as f: data = json.load(f)
# Define the 6 faces of the cuboid using the vertices
faces = [
    (0, 1, 3, 2),  # Front face
    (4, 5, 7, 6),  # Back face
    (0, 1, 5, 4),  # Bottom face
    (2, 3, 7, 6),  # Top face
    (0, 2, 6, 4),  # Left face
    (1, 3, 7, 5),  # Right face
]

for i, c in enumerate(data):
    vertices =  c["vertices"]
    # Create a new mesh and object
    mesh = bpy.data.meshes.new(name=f"CustomCuboid{i}")
    obj = bpy.data.objects.new(f"CustomCuboid{i}", mesh)
    # Link the object to the active collection
    bpy.context.collection.objects.link(obj)
    # Create the mesh from vertices and faces
    mesh.from_pydata(vertices, [], faces)
    mesh.update()
    # Select and activate the new object
    bpy.context.view_layer.objects.active = obj
    obj.select_set(True)
    if i % 1000 == 0:
        print(i)
