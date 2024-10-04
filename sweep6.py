import FreeCAD as App
import Part

# Create a new document
doc = App.newDocument("LineSegment")

# Define the two points
point1 = App.Vector(1, 2, 3)  # First point (x1, y1, z1)
point2 = App.Vector(-3, 6, 4)  # Second point (x2, y2, z2)

# Create a line segment between the points
line = Part.LineSegment(point1, point2)

# Convert the line to a shape
line_shape = line.toShape()

# Add the shape to the document
part = doc.addObject("Part::Feature", "LineSegment")
part.Shape = line_shape
# b.addObject(line_shape)

# Recompute the document to see the result
doc.recompute()
b = doc.addObject("PartDesign::Body", "Body")
sb = doc.addObject("PartDesign::ShapeBinder", "sb")
