# print sim 

https://www.sciencedirect.com/science/article/pii/S2214785322063271

STEP -> gcode -> STEP 

C:\Program` Files\Bambu` Studio\bambu-studio.exe --outputdir straight_line_test --export-slicedata straight_line_test/ --slice 0 --debug 2 --export-3mf output.3mf "straight_line_test.step"

project structure is 


PROJECT_ROOT/tests/ 

test_name/
in this has ./XXX.step 
and /sliced_output/
which is where bambu/julia should put it
