import FreeCAD as App
import Part

# Create a new document
doc = App.newDocument()

# Define the points A and B
pointA = App.Vector(3, -2, -1)
pointB = App.Vector(1, 2, 3)

# Create a line (edge) between point A and point B
line = Part.LineSegment(pointA, pointB).toShape()
line_obj = doc.addObject("Part::Feature", "Line")
line_obj.Shape = line

# Recompute the document to visualize the line
doc.recompute()

# Step 2: Create the rectangular profile at point A
width = 5
height = 5
rect_points = [
    App.Vector(-width / 2, -height / 2, 0),
    App.Vector(width / 2, -height / 2, 0),
    App.Vector(width / 2, height / 2, 0),
    App.Vector(-width / 2, height / 2, 0),
    App.Vector(-width / 2, -height / 2, 0)  # Closing the rectangle
]
rect_edges = [Part.LineSegment(rect_points[i], rect_points[i + 1]).toShape() for i in range(len(rect_points) - 1)]
rect_wire = Part.Wire(rect_edges)
rect_obj = doc.addObject("Part::Feature", "Rectangle")
rect_obj.Shape = rect_wire

# Calculate the direction vector from A to B
direction = pointB.sub(pointA)
direction.normalize()  # Normalize the direction vector

# Step 3: Align the rectangle profile to be perpendicular to the line A-B
# Use the direction vector to define the rotation for the profile to be perpendicular

z_axis = App.Vector(0, 0, 1)  # Original Z-axis of the rectangle
rotation = App.Rotation(z_axis, direction)  # Create a rotation from Z-axis to direction vector

# Apply the rotation to the profile and place it at point A
rect_obj.Placement = App.Placement(pointA, rotation)

# Recompute the document
doc.recompute()


# Step 4: Sweep the rectangular profile along the line
sweep = Part.makeSweep(rect_wire, line)
sweep_obj = doc.addObject("Part::Feature", "Sweep")
sweep_obj.Shape = sweep

# Recompute the document to see the sweep
doc.recompute()
