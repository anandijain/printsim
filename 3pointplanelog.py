>>> b = doc.addObject('PartDesign::Body','Body')
>>> p = doc.getObject('Body').newObject('PartDesign::Plane','p')# Gui.runCommand('Std_OrthographicCamera',1)
>>> import FreeCAD as App
>>> import Part
>>> import PartDesignGui
>>> import Sketcher
>>> import FreeCAD as App
>>> import Part
>>> from FreeCAD import Vector
>>> import Draft
>>> doc = App.newDocument("DatumPlaneExample")
>>> # App.setActiveDocument("DatumPlaneExample1")
>>> # App.ActiveDocument=App.getDocument("DatumPlaneExample1")
>>> # Gui.ActiveDocument=Gui.getDocument("DatumPlaneExample1")
>>> A = App.Vector(1,2,3)
>>> B = App.Vector(-3,6,4)
>>> O = App.Vector(0,0,0)
>>> Ap = Draft.make_point(A)
>>> Bp = Draft.make_point(B)
>>> Op = Draft.make_point(O)
>>> # Draft.make_line(O, B)
>>> # Draft.make_line(O, A)
>>> # Draft.make_line(A, B)
>>> b = doc.addObject('PartDesign::Body','Body')
>>> p = doc.getObject('Body').newObject('PartDesign::Plane','p')
>>> # Gui.Selection.clearSelection()
>>> # Gui.Selection.addSelection('DatumPlaneExample1','Body','p.')
>>> # Gui.getDocument('DatumPlaneExample1').ActiveView.setActiveObject('pdbody',App.getDocument('DatumPlaneExample1').getObject('Body'),'')
>>> # Gui.ActiveDocument.ActiveView.setActiveObject('pdbody',App.getDocument('DatumPlaneExample1').getObject('Body'))
>>> # Gui.getDocument('DatumPlaneExample1').setEdit(App.getDocument('DatumPlaneExample1').getObject('Body'), 0, 'p.')
>>> # Gui.activateWorkbench('PartDesignWorkbench')
>>> # import Show
>>> # from Show.Containers import isAContainer
>>> # _tv_p = Show.TempoVis(App.ActiveDocument, tag= 'PartGui::TaskAttacher')
>>> # tvObj = App.getDocument('DatumPlaneExample1').getObject('p')
>>> # dep_features = _tv_p.get_all_dependent(App.getDocument('DatumPlaneExample1').getObject('Body'), 'p.')
>>> # dep_features = [o for o in dep_features if not isAContainer(o)]
>>> # if tvObj.isDerivedFrom('PartDesign::CoordinateSystem'):
>>> # 	visible_features = [feat for feat in tvObj.InList if feat.isDerivedFrom('PartDesign::FeaturePrimitive')]
>>> # 	dep_features = [feat for feat in dep_features if feat not in visible_features]
>>> # 	del(visible_features)
>>> # _tv_p.hide(dep_features)
>>> # del(dep_features)
>>> # if not tvObj.isDerivedFrom('PartDesign::CoordinateSystem'):
>>> # 		if len(tvObj.Support) > 0:
>>> # 			_tv_p.show([lnk[0] for lnk in tvObj.Support])
>>> # del(tvObj)
>>> # Gui.Selection.clearSelection()
>>> # Gui.Selection.addSelection('DatumPlaneExample1','Point')
>>> # Gui.ActiveDocument.resetEdit()
>>> # Gui.activateWorkbench('StartWorkbench')
>>> import PartDesignGui
>>> App.ActiveDocument.recompute()
>>> # _tv_p.restore()
>>> # del(_tv_p)
>>> # Gui.Selection.clearSelection()
>>> # Gui.Selection.addSelection('DatumPlaneExample1','Body','p.')
>>> # Gui.getDocument('DatumPlaneExample1').setEdit(App.getDocument('DatumPlaneExample1').getObject('Body'), 0, 'p.')
>>> # Gui.activateWorkbench('PartDesignWorkbench')
>>> # import Show
>>> # from Show.Containers import isAContainer
>>> # _tv_p = Show.TempoVis(App.ActiveDocument, tag= 'PartGui::TaskAttacher')
>>> # tvObj = App.getDocument('DatumPlaneExample1').getObject('p')
>>> # dep_features = _tv_p.get_all_dependent(App.getDocument('DatumPlaneExample1').getObject('Body'), 'p.')
>>> # dep_features = [o for o in dep_features if not isAContainer(o)]
>>> # if tvObj.isDerivedFrom('PartDesign::CoordinateSystem'):
>>> # 	visible_features = [feat for feat in tvObj.InList if feat.isDerivedFrom('PartDesign::FeaturePrimitive')]
>>> # 	dep_features = [feat for feat in dep_features if feat not in visible_features]
>>> # 	del(visible_features)
>>> # _tv_p.hide(dep_features)
>>> # del(dep_features)
>>> # if not tvObj.isDerivedFrom('PartDesign::CoordinateSystem'):
>>> # 		if len(tvObj.Support) > 0:
>>> # 			_tv_p.show([lnk[0] for lnk in tvObj.Support])
>>> # del(tvObj)
>>> # Gui.Selection.clearSelection()
>>> # Gui.Selection.addSelection('DatumPlaneExample1','Point')
>>> # Gui.Selection.clearSelection()
>>> # Gui.Selection.addSelection('DatumPlaneExample1','Point001')
>>> # Gui.Selection.clearSelection()
>>> # Gui.Selection.addSelection('DatumPlaneExample1','Point002')
>>> App.getDocument('DatumPlaneExample1').getObject('p').AttachmentOffset = App.Placement(App.Vector(0.0000000000, 0.0000000000, 0.0000000000),  App.Rotation(0.0000000000, 0.0000000000, 0.0000000000))
>>> App.getDocument('DatumPlaneExample1').getObject('p').MapReversed = False
>>> App.getDocument('DatumPlaneExample1').getObject('p').Support = [(App.getDocument('DatumPlaneExample1').getObject('CopyPoint'),''),(App.getDocument('DatumPlaneExample1').getObject('CopyPoint001'),''),(App.getDocument('DatumPlaneExample1').getObject('CopyPoint002'),'')]
>>> App.getDocument('DatumPlaneExample1').getObject('p').MapPathParameter = 0.000000
>>> App.getDocument('DatumPlaneExample1').getObject('p').MapMode = 'ThreePointsPlane'
>>> App.getDocument('DatumPlaneExample1').getObject('p').recompute()
>>> # Gui.getDocument('DatumPlaneExample1').resetEdit()
>>> # Gui.activateWorkbench('StartWorkbench')
>>> import PartDesignGui
>>> # _tv_p.restore()
>>> # del(_tv_p)