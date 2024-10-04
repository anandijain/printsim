import FreeCAD as App
import Part
import Sketcher

# Create a new document
doc = App.newDocument("ShapeBinderExample")

# Create a PartDesign body
body = doc.addObject("PartDesign::Body", "Body")

# Create a line segment (Edge 1) and a vertex (Vertex 1) as geometry
point1 = App.Vector(1, 2, 3)
point2 = App.Vector(-3, 6, 4)

line = Part.LineSegment(point1, point2)
line_shape = line.toShape()

# Add the line to a feature in the document
line_feature = doc.addObject("Part::Feature", "LineSegment")
line_feature.Shape = line_shape

# Create the first ShapeBinder for Edge 1
shape_binder_edge = doc.addObject("PartDesign::ShapeBinder", "ShapeBinderEdge")
edge1 = line_feature.Shape.Edge1
shape_binder_edge.Support = [(line_feature, 'Edge1')]
body.addObject(shape_binder_edge)

# Create the second ShapeBinder for Vertex 1
shape_binder_vertex = doc.addObject("PartDesign::ShapeBinder", "ShapeBinderVertex")
vertex1 = line_feature.Shape.Vertex1
shape_binder_vertex.Support = [(line_feature, 'Vertex1')]
body.addObject(shape_binder_vertex)

# Create the Datum Plane
datum_plane = doc.addObject("PartDesign::Plane", "DatumPlane")

# Attach the plane as part of the body
body.addObject(datum_plane)

# Set the plane to be normal to the edge
datum_plane.MapMode = "NormalToEdge"

# Use both the ShapeBinders as references for attachment
datum_plane.Support = [(shape_binder_edge, ""), (shape_binder_vertex, "")]

# Recompute the document to update the plane creation
doc.recompute()

# Create a sketch on the Datum Plane
sketch = doc.addObject("Sketcher::SketchObject", "Sketch")
sketch.Support = [(datum_plane, [''])]  # Attach the sketch to the datum plane
sketch.MapMode = "FlatFace"
body.addObject(sketch)

# Define the rectangle dimensions (width 4mm, height 2mm)
width = 4
height = 2

# Create the rectangle centered around the origin (0,0) on the Datum Plane
p1 = App.Vector(-width/2, -height/2, 0)
p2 = App.Vector(width/2, -height/2, 0)
p3 = App.Vector(width/2, height/2, 0)
p4 = App.Vector(-width/2, height/2, 0)

# Add the lines to the sketch to form the rectangle
sketch.addGeometry(Part.LineSegment(p1, p2))  # Bottom line
sketch.addGeometry(Part.LineSegment(p2, p3))  # Right line
sketch.addGeometry(Part.LineSegment(p3, p4))  # Top line
sketch.addGeometry(Part.LineSegment(p4, p1))  # Left line

# Recompute the document to see the changes
ap = body.newObject('PartDesign::AdditivePipe','AdditivePipe')
ap.Profile = doc.getObject('Sketch')
ap.Spine = (shape_binder_edge, ["Edge1"])
doc.recompute()
# >>> # Gui.Selection.clearSelection()
# >>> App.getDocument('ShapeBinderExample4').getObject('AdditivePipe').Spine = (FreeCAD.getDocument('ShapeBinderExample4').getObject('ShapeBinderEdge'),['Edge1',])
# >>> App.getDocument('ShapeBinderExample4').recompute()