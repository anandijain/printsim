import FreeCAD as App
import Part

# Create a new document in FreeCAD
doc = App.newDocument()

# Define the list of coordinates (your path)
coords = [
    [92.034, 92.699, 0.2],
    [93.079, 91.83, 0.2],
    [94.0, 91.643, 0.2],
    [106.0, 91.643, 0.2],
    [107.301, 92.034, 0.2],
    [108.17, 93.079, 0.2],
    [108.357, 94.0, 0.2],
    [108.357, 106.0, 0.2],
    [107.966, 107.301, 0.2],
    [106.921, 108.17, 0.2],
    [106.0, 108.357, 0.2],
    [94.0, 108.357, 0.2],
    [92.699, 107.966, 0.2],
    [91.83, 106.921, 0.2],
    [91.643, 106.0, 0.2],
    [91.643, 94.0, 0.2],
    [92.017, 92.757, 0.2]
]

# Convert the list of coordinates into FreeCAD vertices
vertices = [App.Vector(*coord) for coord in coords]

# Create a series of edges between the vertices to form a wire
edges = []
for i in range(len(vertices) - 1):
    edge = Part.LineSegment(vertices[i], vertices[i+1]).toShape()
    edges.append(edge)

# Create a wire from the edges
wire = Part.Wire(edges)

# Add the wire to the document
doc.addObject("Part::Feature", "SweepPath").Shape = wire

# Now let's create the rectangular profile
# Height = 0.2 mm, Width = 0.4 mm, with top edge at Y=0 and center of top edge at the path
height = 0.2
width = 0.4

# Define the points for the rectangle
rect_points = [
    App.Vector(-width / 2, 0, 0),    # Top-left
    App.Vector(width / 2, 0, 0),     # Top-right
    App.Vector(width / 2, -height, 0),  # Bottom-right
    App.Vector(-width / 2, -height, 0), # Bottom-left
    App.Vector(-width / 2, 0, 0)     # Closing back to top-left
]

# Create lines between the rectangle points
rect_edges = [Part.LineSegment(rect_points[i], rect_points[i+1]).toShape() for i in range(len(rect_points) - 1)]
rect_wire = Part.Wire(rect_edges)

# Add the rectangular profile to the document
doc.addObject("Part::Feature", "Profile").Shape = rect_wire

# Now perform the sweep using the wire path and the rectangular profile
sweep = Part.makeSweep(rect_wire, wire)

# Add the sweep to the document
doc.addObject("Part::Feature", "Sweep").Shape = sweep

# Recompute the document to see the result
doc.recompute()
