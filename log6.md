>>> doc = App.newDocument("LineSegment")
>>> # App.setActiveDocument("LineSegment1")
>>> # App.ActiveDocument=App.getDocument("LineSegment1")
>>> # Gui.ActiveDocument=Gui.getDocument("LineSegment1")
>>> 
>>> # Define the two points
>>> point1 = App.Vector(1, 2, 3)  # First point (x1, y1, z1)
>>> point2 = App.Vector(-3, 6, 4)  # Second point (x2, y2, z2)
>>> 
>>> # Create a line segment between the points
>>> line = Part.LineSegment(point1, point2)
>>> 
>>> # Convert the line to a shape
>>> line_shape = line.toShape()
>>> 
>>> # Add the shape to the document
>>> part = doc.addObject("Part::Feature", "LineSegment")
>>> part.Shape = line_shape
>>> 
>>> # Recompute the document to see the result
>>> doc.recompute()
1
>>> # Gui.getDocument("LineSegment").resetEdit()
>>> App.getDocument("LineSegment").recompute()
>>> # _tv_DatumPlane.restore()
>>> # del(_tv_DatumPlane)
>>> import FreeCAD as App
>>> import Part
>>> 
>>> # Create a new document
>>> doc = App.newDocument("LineSegment")
>>> # App.setActiveDocument("LineSegment2")
>>> # App.ActiveDocument=App.getDocument("LineSegment2")
>>> # Gui.ActiveDocument=Gui.getDocument("LineSegment2")
>>> 
>>> # Define the two points
>>> point1 = App.Vector(1, 2, 3)  # First point (x1, y1, z1)
>>> point2 = App.Vector(-3, 6, 4)  # Second point (x2, y2, z2)
>>> 
>>> # Create a line segment between the points
>>> line = Part.LineSegment(point1, point2)
>>> 
>>> # Convert the line to a shape
>>> line_shape = line.toShape()
>>> 
>>> # Add the shape to the document
>>> part = doc.addObject("Part::Feature", "LineSegment")
>>> part.Shape = line_shape
>>> 
>>> # Recompute the document to see the result
>>> doc.recompute()
1
>>> ### Begin command PartDesign_Plane
>>> App.getDocument('LineSegment2').addObject('PartDesign::Body','Body')
>>> # Gui.getDocument('LineSegment2').ActiveView.setActiveObject('pdbody',App.getDocument('LineSegment2').getObject('Body'),'')
>>> App.getDocument('LineSegment2').getObject('Body').newObject('PartDesign::Plane','DatumPlane')
>>> App.activeDocument().recompute()
>>> # Gui.getDocument('LineSegment2').setEdit(App.getDocument('LineSegment2').getObject('Body'), 0, 'DatumPlane.')
>>> # import Show
>>> # from Show.Containers import isAContainer
>>> # _tv_DatumPlane = Show.TempoVis(App.ActiveDocument, tag= 'PartGui::TaskAttacher')
>>> # tvObj = App.getDocument('LineSegment2').getObject('DatumPlane')
>>> # dep_features = _tv_DatumPlane.get_all_dependent(App.getDocument('LineSegment2').getObject('Body'), 'DatumPlane.')
>>> # dep_features = [o for o in dep_features if not isAContainer(o)]
>>> # if tvObj.isDerivedFrom('PartDesign::CoordinateSystem'):
>>> # 	visible_features = [feat for feat in tvObj.InList if feat.isDerivedFrom('PartDesign::FeaturePrimitive')]
>>> # 	dep_features = [feat for feat in dep_features if feat not in visible_features]
>>> # 	del(visible_features)
>>> # _tv_DatumPlane.hide(dep_features)
>>> # del(dep_features)
>>> # if not tvObj.isDerivedFrom('PartDesign::CoordinateSystem'):
>>> # 		if len(tvObj.Support) > 0:
>>> # 			_tv_DatumPlane.show([lnk[0] for lnk in tvObj.Support])
>>> # del(tvObj)
>>> ### End command PartDesign_Plane
>>> # Gui.Selection.addSelection('LineSegment2','LineSegment','Edge1',-0.378742,3.37874,3.34469)
>>> # Gui.Selection.clearSelection()
>>> # Gui.Selection.addSelection('LineSegment2','LineSegment','Vertex1',1,2,3)
>>> App.getDocument('LineSegment2').getObject('DatumPlane').AttachmentOffset = App.Placement(App.Vector(0.0000000000, 0.0000000000, 0.0000000000),  App.Rotation(0.0000000000, 0.0000000000, 0.0000000000))
>>> App.getDocument('LineSegment2').getObject('DatumPlane').MapReversed = False
>>> App.getDocument('LineSegment2').getObject('DatumPlane').Support = [(App.getDocument('LineSegment2').getObject('CopyLineSegment'),''),(App.getDocument('LineSegment2').getObject('CopyLineSegment001'),'')]
>>> App.getDocument('LineSegment2').getObject('DatumPlane').MapPathParameter = 0.000000
>>> App.getDocument('LineSegment2').getObject('DatumPlane').MapMode = 'NormalToEdge'
>>> App.getDocument('LineSegment2').getObject('DatumPlane').recompute()
>>> # Gui.getDocument('LineSegment2').resetEdit()
>>> # _tv_DatumPlane.restore()
>>> # del(_tv_DatumPlane)
>>>             