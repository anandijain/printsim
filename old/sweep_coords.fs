FeatureScript 2473;
import(path : "onshape/std/common.fs", version : "2473.0");

Coords::import(path : "9a69d720ea0c9ee3ebd179eb", version : "387b3cdae621ec202d5a1fdd");
CCS::import(path : "f94d8394d380a03e86e25166", version : "0c553f8e54d91e523e6a049d");
// ccs2::import(path : "7db0a29a79478b0feac041fb", version : "cd66d501e98b9a888325f668");
FirstLayer::import(path : "45d3883843bb960b56f456d8", version : "5cd3e5233ccca9fee5a2b179");

annotation { "Feature Type Name" : "sweep_coords", "Feature Type Description" : "" }
export const sweep_coords = defineFeature(function(context is Context, id is Id, definition is map)
    precondition
    {
        // Define the parameters of the feature type
    }
    {
        const cs = Coords::BLOB_DATA.jsonData;
        // const cs = FirstLayer::BLOB_DATA.jsonData;
        println(cs);
        var arr = [1., 2., 3.];
        var v = vector(arr);

        var cp = cs[0];
        var i = 0;
        var last_a = vector(0, 0, 0);
        var last_b = vector(0, 0, 0);

        var to_join = [];

        for (var cp in cs)
        {
            var a = vector(cp[0]) * millimeter;
            var b = vector(cp[1]) * millimeter;
            try
            {


                // break;
                opPolyline(context, id + ("polyline" ~ i), {
                            "points" : [a, b]
                        });
                const sketch1 = newSketchOnPlane(context, id + ("sketch" ~ i), {
                            "sketchPlane" : plane(a, normalize(b - a), vector(0, 0, 1))
                            // "sketchPlane" : plane(a, normalize(b - a))
                        });
                skRectangle(sketch1, "rectangle" ~ i, {
                            "firstCorner" : vector(0, .1+0.139) * millimeter,
                            "secondCorner" : vector(-.21, -.1-0.139) * millimeter

                        });
                skSolve(sketch1);
                opSweep(context, id + ("sweep" ~ i), {
                            "profiles" : qCreatedBy(id + ("sketch" ~ i), EntityType.FACE),
                            "path" : qCreatedBy(id + ("polyline" ~ i), EntityType.EDGE),
                        });
            }
            catch (e)
            {

            }

            i = i + 1;
            if (a == last_b)
            {
                to_join = append(to_join, [i - 1, i]);
            }
            last_a = a;
            last_b = b;
        }
        // println(to_join);
        // const ccs = CCS::BLOB_DATA.jsonData;
        // println(ccs);
        // var cci = 0;
        // for (var cc in ccs)  {
        //     var to_j = [];
        //     for (var idx in cc) {
        //         var qcb = qCreatedBy(id + ("sweep" ~ idx-1), EntityType.BODY);
        //         to_j = append(to_j, qcb);
        //     }
        //     var q = qUnion(to_j);
        //     opBoolean(context, id + ("boolean"~cci), {
        //             "tools" : q,
        //             "operationType" : BooleanOperationType.UNION
        //     });
        //     cci += 1;
            
        // }

    });
