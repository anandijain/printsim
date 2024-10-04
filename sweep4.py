import FreeCAD as App
import Part
import PartDesignGui
import Sketcher
import FreeCAD as App
import Part
from FreeCAD import Vector
import Draft
# points A B ::Vector
# p1 = Plane(0, 0, A)
# p2 = Plane(0, 0, B)

# here actually get sketch points Ap Bp 


# ls = LineSegment(A, B)
# p = plane that intersects A and is perpendicular to ls


doc = App.newDocument("DatumPlaneExample")
A = App.Vector(1,2,3)
B = App.Vector(-3,6,4)
O = App.Vector(0,0,0)

b = App.getDocument('Unnamed').addObject('PartDesign::Body','Body')

# Create points in 3D space (optional, for visualization purposes)
point_obj1 = b.addObject("Part::Vertex", "Point1")
point_obj1.Shape = Part.Vertex(O)

point_obj2 = doc.addObject("Part::Vertex", "Point2")
point_obj2.Shape = Part.Vertex(A)

point_obj3 = doc.addObject("Part::Vertex", "Point3")
point_obj3.Shape = Part.Vertex(B)


import FreeCAD as App
import Part
import PartDesignGui
import Sketcher
import FreeCAD as App
import Part
from FreeCAD import Vector
import Draft
doc = App.newDocument("DatumPlaneExample")
b = doc.addObject('PartDesign::Body','Body')

A = App.Vector(1,2,3)
B = App.Vector(-3,6,4)
O = App.Vector(0,0,0)
Ap = Draft.make_point(A)
Bp = Draft.make_point(B)
Op = Draft.make_point(O)
# Draft.make_line(O, B)
# Draft.make_line(O, A)
# Draft.make_line(A, B)
p = doc.getObject('Body').newObject('PartDesign::Plane','p')