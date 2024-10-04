import FreeCAD
import PartDesign
import Part 

# Create a new document
doc = FreeCAD.newDocument("MyDocument")

# Create a new PartDesign body
body = doc.addObject('PartDesign::Body', 'Body')

# Add the body to the document
doc.recompute()

# Define the points as FreeCAD vectors
O = FreeCAD.Vector(0, 0, 0)
A = FreeCAD.Vector(1, 2, 3)
B = FreeCAD.Vector(-3, 6, 4)

# Create Datum Points in the body
datum_O = body.newObject('PartDesign::Point', 'Point_O')
datum_O.Support = None
datum_O.Label = "Origin Point"
datum_O.Shape = Part.Vertex(O)
datum_O.Placement.Base = O

datum_A = body.newObject('PartDesign::Point', 'Point_A')
datum_A.Support = None
datum_A.Label = "Point A"
datum_A.Shape = Part.Vertex(A)
datum_A.Placement.Base = A

datum_B = body.newObject('PartDesign::Point', 'Point_B')
datum_B.Support = None
datum_B.Label = "Point B"
datum_B.Shape = Part.Vertex(B)
datum_B.Placement.Base = B

# Recompute the document to make the changes visible
doc.recompute()

# Optionally save the document
# doc.saveAs('path/to/your/file.FCStd')

# make datum plane from 3 points

# sketch on there 
# draw the line from A to B 