# printsim

this repo aims to recreate this paper:
https://www.sciencedirect.com/science/article/pii/S2214785322063271


which takes a step file, calls a standard slicer, then uses the outputted gcode to reconstruct a 3d model
using a sequence of sweeps with a specified profile. effectively:

STEP -> gcode -> STEP 

the aim is to improve the quality of FEA simuations of FDM 3D printed parts.
the goal is to allow users to use pretty much any slicer, and pretty much any cad
since the method is pretty agnostic to which cad you use.

todo:
* fix the LineSegment generation from gcode to have contiguous paths 
* see if we can get the test cases to work in freecad
* add the combining of the individual sweeps (as they generate separate bodies) into signle body 
* add the freecad code to export the single body/part as a step file. 
* benchmarking and improving performance
* load the step into fusion
* do a simulatino 



--- mahh stuffzzzzzzz ----

C:\Program` Files\Bambu` Studio\bambu-studio.exe --outputdir straight_line_test --export-slicedata straight_line_test/ --slice 0 --debug 2 --export-3mf output.3mf "straight_line_test.step"

project structure is 


PROJECT_ROOT/tests/ 

test_name/
in this has ./XXX.step 
and /sliced_output/
which is where bambu/julia should put it

points A B ::Vector
p1 = Plane(0, 0, A)
p2 = Plane(0, 0, B)

here actually get sketch points Ap Bp 


ls = LineSegment(A, B)
p = plane that intersects A and is perpendicular to ls