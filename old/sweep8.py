import FreeCAD as App
import Part
import Sketcher

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

# Create a ShapeBinder for a specific shape element (e.g., Edge, Vertex)
def create_shape_binder(doc, body, feature, shape_element, binder_name):
    shape_binder = doc.addObject("PartDesign::ShapeBinder", binder_name)
    shape_binder.Support = [(feature, shape_element)]
    body.addObject(shape_binder)
    return shape_binder

# Create a Datum Plane and attach it to references
def create_datum_plane(doc, body, shape_binders, map_mode="NormalToEdge"):
    datum_plane = doc.addObject("PartDesign::Plane", "DatumPlane")
    datum_plane.Support = [(binder, "") for binder in shape_binders]
    datum_plane.MapMode = map_mode
    body.addObject(datum_plane)
    return datum_plane

# Create a Sketch on a given Datum Plane and attach it to the body
def create_sketch_on_plane(doc, body, datum_plane, sketch_name="Sketch"):
    sketch = doc.addObject("Sketcher::SketchObject", sketch_name)
    sketch.Support = [(datum_plane, [''])]
    sketch.MapMode = "FlatFace"
    body.addObject(sketch)
    return sketch

# Add a rectangle to the sketch, centered around the origin
def add_rectangle_to_sketch(sketch, width, height):
    p1 = App.Vector(-width/2, -height/2, 0)
    p2 = App.Vector(width/2, -height/2, 0)
    p3 = App.Vector(width/2, height/2, 0)
    p4 = App.Vector(-width/2, height/2, 0)
    
    sketch.addGeometry(Part.LineSegment(p1, p2))  # Bottom line
    sketch.addGeometry(Part.LineSegment(p2, p3))  # Right line
    sketch.addGeometry(Part.LineSegment(p3, p4))  # Top line
    sketch.addGeometry(Part.LineSegment(p4, p1))  # Left line

# Create an additive pipe along an edge
def create_additive_pipe(doc, body, sketch, spine):
    additive_pipe = body.newObject('PartDesign::AdditivePipe', 'AdditivePipe')
    additive_pipe.Profile = sketch
    additive_pipe.Spine = (spine, [])
    return additive_pipe

def make_pipe(doc, points, width=.4, height=.2):
    body = create_body(doc)
    # Create line feature
    line_feature = create_path_from_points(doc, points)

    # Create ShapeBinders for the edge and vertex
    shape_binder_edge = create_shape_binder(doc, body, line_feature, 'Edge1', "ShapeBinderEdge")
    shape_binder_vertex = create_shape_binder(doc, body, line_feature, 'Vertex1', "ShapeBinderVertex")

    # Create a Datum Plane normal to the edge and using both ShapeBinders as references
    datum_plane = create_datum_plane(doc, body, [shape_binder_edge, shape_binder_vertex])
    datum_plane.Visibility=False
    # Create a sketch on the Datum Plane and add a rectangle
    sketch = create_sketch_on_plane(doc, body, datum_plane)
    add_rectangle_to_sketch(sketch, width, height)

    # Create an additive pipe along the edge (spine)
    create_additive_pipe(doc, body, sketch, line_feature)


import json 
data = json.load(open('C:\\Users\\anand\\.rust\\printsim\\coords.json'))
gcs = json.load(open('C:\\Users\\anand\\.rust\\printsim\\wires.json'))

def coords_list_to_points_list(gcs):
    xs = [x[0] for x in gcs]
    xs.append(gcs[len(gcs)-1][1])
    return xs

ps = coords_list_to_points_list(gcs[0])
# points = [data[0][0]]
# points = []
# for d in data:
#     points.append()

# Main logic
doc = create_document("ShapeBinderExample")

# Create body
body = create_body(doc)

pss =list(map(App.Vector, ps))
path = create_path_from_points(doc, pss)

# Define line segment points
# point1 = App.Vector(1, 2, 3)
# point2 = App.Vector(-3, 6, 4)
# point3 = App.Vector(0, 0, 0)
make_pipe(doc, list(map(App.Vector, ps)))

# for d in data[0:5]:

# make_pipe(doc, point1, point2)
# make_pipe(doc, point2, point3)
# Recompute the document to update the model
doc.recompute()
