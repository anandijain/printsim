import FreeCAD as App
import Part
import Sketcher

# Create a new document
doc = App.newDocument()

def create_body(doc, name="Body"):
    """Creates a new PartDesign Body."""
    body = doc.addObject('PartDesign::Body', name)
    return body

def create_sketch(body, support_plane, name="Sketch"):
    """Creates a new sketch attached to a specified plane."""
    sketch = body.newObject('Sketcher::SketchObject', name)
    sketch.Support = (doc.getObject(support_plane), [''])
    sketch.MapMode = 'FlatFace'
    return sketch

def add_line_to_sketch(sketch, start_point, end_point):
    """Adds a line to the given sketch."""
    line = Part.LineSegment(App.Vector(*start_point), App.Vector(*end_point))
    sketch.addGeometry(line, False)

def add_rectangle_profile(sketch, center, width, height):
    """Adds a rectangle to the given sketch with the specified width and height."""
    x, y, z = center
    sketch.addGeometry(Part.LineSegment(App.Vector(x - width/2, y - height/2, z),
                                        App.Vector(x + width/2, y - height/2, z)), False)
    sketch.addGeometry(Part.LineSegment(App.Vector(x + width/2, y - height/2, z),
                                        App.Vector(x + width/2, y + height/2, z)), False)
    sketch.addGeometry(Part.LineSegment(App.Vector(x + width/2, y + height/2, z),
                                        App.Vector(x - width/2, y + height/2, z)), False)
    sketch.addGeometry(Part.LineSegment(App.Vector(x - width/2, y + height/2, z),
                                        App.Vector(x - width/2, y - height/2, z)), False)

def add_circle_profile(sketch, center, radius):
    """Adds a circle to the given sketch."""
    sketch.addGeometry(Part.Circle(App.Vector(*center), App.Vector(0, 0, 1), radius), False)

def create_sweep(body, profile_sketch, path_sketch):
    """Creates a sweep (Additive Pipe) with the given profile and path sketches."""
    pipe = body.newObject('PartDesign::AdditivePipe', 'AdditivePipe')
    pipe.Profile = profile_sketch
    pipe.Spine = [(path_sketch, 'Edge1')]
    pipe.Mode = 0  # Standard sweep mode
    pipe.SectionTransformation = False
    doc.recompute()

def run_sweep(path_points, profile_type="rectangle", profile_size=(10, 5), profile_center=(0, 0, 0)):
    """
    General function to create a sweep.
    
    :param path_points: List of points for the sweep path [(x1, y1, z1), (x2, y2, z2), ...]
    :param profile_type: Type of profile ('rectangle' or 'circle')
    :param profile_size: Size of the profile (width, height) for rectangle, (radius,) for circle
    :param profile_center: Center point of the profile
    """
    # Step 1: Create a body
    body = create_body(doc)

    # Step 2: Create the path sketch
    path_sketch = create_sketch(body, 'XY_Plane', 'PathSketch')

    # Add the lines for the path
    for i in range(len(path_points) - 1):
        add_line_to_sketch(path_sketch, path_points[i], path_points[i + 1])
    
    doc.recompute()

    # Step 3: Create the profile sketch on the YZ_Plane, or align based on the path
    profile_sketch = create_sketch(body, 'YZ_Plane', 'ProfileSketch')
    
    if profile_type == "rectangle":
        width, height = profile_size
        add_rectangle_profile(profile_sketch, profile_center, width, height)
    elif profile_type == "circle":
        radius, = profile_size
        add_circle_profile(profile_sketch, profile_center, radius)
    
    doc.recompute()

    # Step 4: Create the sweep (Additive Pipe)
    create_sweep(body, profile_sketch, path_sketch)

# Example Usage
path_points = [(0, 0, 0), (10, 10, 0), (20, 0, 0)]  # Define your path points
profile_type = "rectangle"  # or "circle"
profile_size = (5, 3)  # Rectangle: (width, height); Circle: (radius,)
profile_center = (0, 0, 0)

# Call the function to create the sweep
run_sweep(path_points, profile_type, profile_size, profile_center)

doc.recompute()
