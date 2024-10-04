# import App
import FreeCAD as App
import Part
import PartDesignGui
import Sketcher

App.newDocument()
App.getDocument('Unnamed').addObject('PartDesign::Body','Body')
App.getDocument('Unnamed').getObject('Body').newObject('Sketcher::SketchObject','Sketch')
App.getDocument('Unnamed').getObject('Sketch').Support = (App.getDocument('Unnamed').getObject('XY_Plane'),[''])
App.getDocument('Unnamed').getObject('Sketch').MapMode = 'FlatFace'
App.ActiveDocument.recompute()

geoList = []
geoList.append(Part.LineSegment(App.Vector(-65.174675,33.624451,0),App.Vector(64.956329,33.624451,0)))
geoList.append(Part.LineSegment(App.Vector(64.956329,33.624451,0),App.Vector(64.956329,-32.314411,0)))
geoList.append(Part.LineSegment(App.Vector(64.956329,-32.314411,0),App.Vector(-65.174675,-32.314411,0)))
geoList.append(Part.LineSegment(App.Vector(-65.174675,-32.314411,0),App.Vector(-65.174675,33.624451,0)))
App.getDocument('Unnamed').getObject('Sketch').addGeometry(geoList,False)

conList = []
conList.append(Sketcher.Constraint('Coincident',0,2,1,1))
conList.append(Sketcher.Constraint('Coincident',1,2,2,1))
conList.append(Sketcher.Constraint('Coincident',2,2,3,1))
conList.append(Sketcher.Constraint('Coincident',3,2,0,1))
conList.append(Sketcher.Constraint('Horizontal',0))
conList.append(Sketcher.Constraint('Horizontal',2))
conList.append(Sketcher.Constraint('Vertical',1))
conList.append(Sketcher.Constraint('Vertical',3))
App.getDocument('Unnamed').getObject('Sketch').addConstraint(conList)
del geoList, conList

App.ActiveDocument.recompute()

App.getDocument('Unnamed').getObject('Body').newObject('Sketcher::SketchObject','Sketch001')
App.getDocument('Unnamed').getObject('Sketch001').Support = (App.getDocument('Unnamed').getObject('YZ_Plane'),[''])
App.getDocument('Unnamed').getObject('Sketch001').MapMode = 'FlatFace'
App.ActiveDocument.recompute()

App.getDocument('Unnamed').getObject('Sketch001').addExternal("Sketch","Edge3")
App.getDocument('Unnamed').getObject('Sketch001').addGeometry(Part.Circle(App.Vector(-32.314411,-0.000000,0),App.Vector(0,0,1),9.743056),False)
App.getDocument('Unnamed').getObject('Sketch001').addConstraint(Sketcher.Constraint('Coincident',0,3,-3,1)) 
App.ActiveDocument.recompute()

App.getDocument('Unnamed').getObject('Body').newObject('PartDesign::AdditivePipe','AdditivePipe')
App.getDocument('Unnamed').getObject('AdditivePipe').Profile = App.getDocument('Unnamed').getObject('Sketch001')
App.ActiveDocument.recompute()
App.getDocument('Unnamed').getObject('Sketch001').Visibility = False
App.ActiveDocument.recompute()
