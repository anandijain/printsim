use std::{
    env,
    f64::consts::PI,
    fs::{read_to_string, File},
    io::Write,
};

use anyhow;

const LAYER_HEIGHT: f64 = 0.2;
const LINE_WIDTH: f64 = 0.4;
const FILAMENT_DIAMETER: f64 = 1.75;
// const FILAMENT_AREA: f64 = (FILAMENT_DIAMETER/2.0).powi(2)*PI;

fn extrusion_distance_to_volume(x: f64) -> f64 {
    (FILAMENT_DIAMETER / 2.0).powi(2) * PI * x
}

fn calculate_linewidth_given_extrusion_volume(seg_dist: f64, vol: f64) -> f64 {
    vol / (LAYER_HEIGHT * seg_dist)
}


#[derive(Debug, Clone, Copy, PartialEq)]
struct G1 {
    x: Option<f64>,
    y: Option<f64>,
    z: Option<f64>,
    e: Option<f64>,
}

#[derive(Debug, Clone, PartialEq)]
struct Cuboid {
    vertices: [(f64, f64, f64); 8],  // 8 vertices, each with (x, y, z)
}

impl Cuboid {
    // Constructor that takes an array of 8 vertices
    fn new(vertices: [(f64, f64, f64); 8]) -> Self {
        Self { vertices }
    }

    // Example: Calculate the volume of the cuboid using the vertices
    fn volume(&self) -> f64 {
        // Calculate two adjacent edges and the normal vector (cross product)
        let v0 = self.vertices[0];
        let v1 = self.vertices[1];
        let v3 = self.vertices[3];

        let edge1 = (
            v1.0 - v0.0,
            v1.1 - v0.1,
            v1.2 - v0.2,
        );

        let edge2 = (
            v3.0 - v0.0,
            v3.1 - v0.1,
            v3.2 - v0.2,
        );

        // Cross product of two edges gives the area of the base
        let normal = (
            edge1.1 * edge2.2 - edge1.2 * edge2.1,
            edge1.2 * edge2.0 - edge1.0 * edge2.2,
            edge1.0 * edge2.1 - edge1.1 * edge2.0,
        );

        let base_area = (normal.0.powi(2) + normal.1.powi(2) + normal.2.powi(2)).sqrt();

        // Height is the distance between two parallel faces
        let v4 = self.vertices[4];
        let height = ((v4.0 - v0.0).powi(2) + (v4.1 - v0.1).powi(2) + (v4.2 - v0.2).powi(2)).sqrt();

        base_area * height
    }
}


// fn cuboid_from_coords(coords: Vec<Vec<f64>>) -> Cuboid {
//     // Ensure there are 8 corners (each with 3 coordinates)
//     assert!(coords.len() == 8 && coords.iter().all(|c| c.len() == 3));

//     // Initialize min and max with the first coordinate
//     let mut min = coords[0].clone();
//     let mut max = coords[0].clone();

//     // Iterate over the remaining coordinates to find the true min and max
//     for coord in &coords[1..] {
//         for i in 0..3 {
//             min[i] = min[i].min(coord[i]); // Find minimum for each axis
//             max[i] = max[i].max(coord[i]); // Find maximum for each axis
//         }
//     }

//     Cuboid::new((min[0], min[1], min[2]), (max[0], max[1], max[2]))
// }

// s is the string of the whole gcode
fn cuboid_from_seg(seg: &Vec<Vec<f64>>) -> Result<Cuboid, anyhow::Error> {
    let (a, b) = (seg[0].clone(), seg[1].clone());
    assert!(a[2] == b[2]);
    
    let hyp = vec![b[0] - a[0], b[1] - a[1]];
    let opp = vec![b[0], a[1]];

    let hyp_dist = (hyp[0].powi(2) + hyp[1].powi(2)).sqrt();
    let opp_dist = (opp[0].powi(2) + opp[1].powi(2)).sqrt();

    let dx = b[0] - a[0];
    let dy = b[1] - a[1];

    let angle = dy.atan2(dx); // Angle in radians

    let angle2 = (180. - 90. - angle).to_radians();
    let hyp2 = LINE_WIDTH / 2.0; // average linewidth/2
    let x_comp = angle2.cos() * hyp2;
    let y_comp = angle2.sin() * hyp2;
    let cuboid_coords = vec![
        // front_top_left
        (a[0] + x_comp, a[1] + y_comp, a[2]),
        // front_top_right
        (a[0] - x_comp, a[1] - y_comp, a[2]),
        // front_bot_left
        (a[0] + x_comp, a[1] + y_comp, a[2] - LAYER_HEIGHT),
        // front_bot_right
        (a[0] - x_comp, a[1] - y_comp, a[2] - LAYER_HEIGHT),
        // back_top_left
        (b[0] + x_comp, b[1] + y_comp, b[2]),
        // back_top_right
        (b[0] - x_comp, b[1] - y_comp, b[2]),
        // back_bot_left
        (b[0] + x_comp, b[1] + y_comp, b[2] - LAYER_HEIGHT),
        // back_bot_right
        (b[0] - x_comp, b[1] - y_comp, b[2] - LAYER_HEIGHT),
    ];
    Ok(Cuboid::new(cuboid_coords.try_into().unwrap()))
}

// no F
// assume g1 f exclusive with xyze
//ex G1 X1 Y2 Z3 E.5
fn parse_g1(s: &str) -> G1 {
    // Initialize variables as mutable Options
    let (mut x, mut y, mut z, mut e) = (None, None, None, None);

    // Split the string, skipping the first element
    let cs = s.split_whitespace().skip(1);

    // Parse each token and update the corresponding variable
    for c in cs {
        if c.starts_with('X') {
            x = Some(c[1..].parse::<f64>().unwrap());
        } else if c.starts_with('Y') {
            y = Some(c[1..].parse::<f64>().unwrap());
        } else if c.starts_with('Z') {
            z = Some(c[1..].parse::<f64>().unwrap());
        } else if c.starts_with('E') {
            e = Some(c[1..].parse::<f64>().unwrap());
        }
    }

    // Use field shorthand to create the G1 struct
    G1 { x, y, z, e }
}

fn update_position(last: &Vec<f64>, g1: G1) -> Vec<f64> {
    vec![
        g1.x.unwrap_or(last[0]), // If g1.x is Some, use it; otherwise, use last[0]
        g1.y.unwrap_or(last[1]), // If g1.y is Some, use it; otherwise, use last[1]
        g1.z.unwrap_or(last[2]), // If g1.z is Some, use it; otherwise, use last[2]
    ]
}

fn main() {
    // todo in featurescipt make 2 cuboids that share a single edge, and see if union fails
    // this is the def of non manifold in cad

    let filename = "tests/wormdrive/sliced/plate_1.gcode";
    // Attempt to get the current working directory
    let current_dir = env::current_dir().unwrap();

    // Print the current directory as a string
    println!("Current working directory: {}", current_dir.display());

    let binding = read_to_string(filename).unwrap();
    let ls = binding.split("\n");
    let mut g1s = vec![];
    for l in ls {
        if l.starts_with("G1") && !l.starts_with("G1 F") {
            let g1 = parse_g1(&l);
            g1s.push(g1);
        }
    }
    let mut cur_pos = vec![0., 0., 0.];
    let mut cur_ext = 0.;

    let mut exts = vec![];

    let mut coords = vec![];
    for g in g1s {
        let pos = update_position(&cur_pos, g);
        if let Some(e) = g.e {
            if cur_ext + e > 0. {
                coords.push(vec![cur_pos.clone(), pos.clone()]);
                exts.push(cur_ext + e);
                cur_ext = 0.;
            } else {
                cur_ext += e;
            }
        }
        cur_pos = pos;
    }

    // let cuboid = cuboid_from_seg(coords[0].clone()).unwrap();
    let cs = coords
        .iter()
        .map(|x| cuboid_from_seg(x).unwrap())
        .collect::<Vec<_>>();
    let cuboid = cs[0].clone();
    println!("{:?}", cuboid);
    // Example usage
    println!("Cuboid: {:?}", cuboid);
    println!("Volume: {}", cuboid.volume());
    // println!("Surface Area: {}", cuboid.surface_area());
    // println!("Is Cube: {}", cuboid.is_cube());

    // let point = (2.0, 2.0, 2.0);
    // println!("Contains point {:?}: {}", point, cuboid.contains(point));

    let vol: f64 = cs.iter().map(|x| x.volume()).sum();
    // PLA DENSITY IS 1.24 g/cm³
    println!("volume of print assuming .4x.2xl boxes: {}", vol);
    println!("n cuboids: {}", cs.len());
    println!("mm extruded: {}", exts.clone().into_iter().sum::<f64>());

    let json = serde_json::to_string_pretty(&exts.clone()).unwrap();
    let mut file = File::create("wormdrive_extsrusion_distances.json").unwrap();
    file.write_all(json.as_bytes()).unwrap();
    // println!("{}",coords.len());
    println!("{}", coords.len());
}
