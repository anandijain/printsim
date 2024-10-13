import FreeCAD as App
import Part

# Create a new document
def create_document(name):
    return App.newDocument(name)

# Create a PartDesign body
def create_body(doc, body_name="Body"):
    body = doc.addObject("PartDesign::Body", body_name)
    return body

# Create a multi-segment path (wire) from a list of points
def create_path_from_points(doc, points, feature_name="Path"):
    edges = []
    for i in range(len(points) - 1):
        line = Part.LineSegment(points[i], points[i+1]).toShape()
        edges.append(line)
    
    # Create a wire from the edges (path with multiple line segments)
    wire = Part.Wire(edges)
    
    # Add wire to the document as a Part Feature
    path_feature = doc.addObject("Part::Feature", feature_name)
    path_feature.Shape = wire
    return path_feature

# Create a sketch for the sweep profile (e.g., a rectangle)
def create_profile_sketch(doc, body, sketch_name="Sketch", width=4, height=2):
    sketch = doc.addObject("Sketcher::SketchObject", sketch_name)
    body.addObject(sketch)
    
    # Define a rectangle centered around the origin
    p1 = App.Vector(-width/2, -height/2, 0)
    p2 = App.Vector(width/2, -height/2, 0)
    p3 = App.Vector(width/2, height/2, 0)
    p4 = App.Vector(-width/2, height/2, 0)
    
    # Add the rectangle geometry to the sketch
    sketch.addGeometry(Part.LineSegment(p1, p2))  # Bottom line
    sketch.addGeometry(Part.LineSegment(p2, p3))  # Right line
    sketch.addGeometry(Part.LineSegment(p3, p4))  # Top line
    sketch.addGeometry(Part.LineSegment(p4, p1))  # Left line
    
    return sketch

# Create an additive pipe (sweep) along the multi-segment path
def create_additive_pipe(doc, body, profile_sketch, path_feature, pipe_name="AdditivePipe"):
    additive_pipe = body.newObject('PartDesign::AdditivePipe', pipe_name)
    additive_pipe.Profile = profile_sketch
    additive_pipe.Spine = (path_feature, [])
    return additive_pipe

# Main logic
doc = create_document("MultiSegmentSweepExample")

# Create body
body = create_body(doc)

# Define points for the path (multi-segment path)
points = [
    App.Vector(0, 0, 0),
    App.Vector(10, 5, 0),
    App.Vector(15, 10, 5),
    App.Vector(20, 5, 10)
]

# Create path (multi-segment line)
path_feature = create_path_from_points(doc, points)

# Create a profile sketch (rectangle for the sweep)
profile_sketch = create_profile_sketch(doc, body)

# Create the additive pipe (sweep) along the multi-segment path
create_additive_pipe(doc, body, profile_sketch, path_feature)

# Recompute the document to see the changes
doc.recompute()
