use std::{env, fs::{read_to_string, File}, io::Write};

use anyhow;

/// Rectangular Cuboid
#[derive(Debug, Clone, Copy, PartialEq)]
struct Cuboid {
    min: (f64, f64, f64), // Minimum corner (x_min, y_min, z_min)
    max: (f64, f64, f64), // Maximum corner (x_max, y_max, z_max)
}

#[derive(Debug, Clone, Copy, PartialEq)]
struct G1 {
    x: Option<f64>,
    y: Option<f64>,
    z: Option<f64>,
    e: Option<f64>,
}

impl Cuboid {
    // Constructor
    fn new(min: (f64, f64, f64), max: (f64, f64, f64)) -> Self {
        assert!(
            min.0 <= max.0 && min.1 <= max.1 && min.2 <= max.2,
            "Invalid cuboid dimensions: min must be <= max on all axes"
        );
        Self { min, max }
    }

    // Calculate the volume of the cuboid
    fn volume(&self) -> f64 {
        let (x_min, y_min, z_min) = self.min;
        let (x_max, y_max, z_max) = self.max;
        (x_max - x_min) * (y_max - y_min) * (z_max - z_min)
    }

    // Calculate the surface area of the cuboid
    fn surface_area(&self) -> f64 {
        let (x_min, y_min, z_min) = self.min;
        let (x_max, y_max, z_max) = self.max;
        let dx = x_max - x_min;
        let dy = y_max - y_min;
        let dz = z_max - z_min;
        2.0 * (dx * dy + dy * dz + dx * dz)
    }

    // Check if the cuboid is a cube
    fn is_cube(&self) -> bool {
        let (x_min, y_min, z_min) = self.min;
        let (x_max, y_max, z_max) = self.max;
        (x_max - x_min) == (y_max - y_min) && (y_max - y_min) == (z_max - z_min)
    }

    // Check if a point is inside the cuboid
    fn contains(&self, point: (f64, f64, f64)) -> bool {
        let (x, y, z) = point;
        let (x_min, y_min, z_min) = self.min;
        let (x_max, y_max, z_max) = self.max;
        x >= x_min && x <= x_max && y >= y_min && y <= y_max && z >= z_min && z <= z_max
    }
}

// s is the string of the whole gcode
fn cuboids_from_gcode(s: &str) -> Result<Vec<Cuboid>, anyhow::Error> {
    Ok(vec![])
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
    // Example usage
    let cuboid = Cuboid::new((0.0, 0.0, 0.0), (3.0, 4.0, 5.0));
    println!("Cuboid: {:?}", cuboid);
    println!("Volume: {}", cuboid.volume());
    println!("Surface Area: {}", cuboid.surface_area());
    println!("Is Cube: {}", cuboid.is_cube());

    let point = (2.0, 2.0, 2.0);
    println!("Contains point {:?}: {}", point, cuboid.contains(point));

    // todo in featurescipt make 2 cuboids that share a single edge, and see if union fails
    // this is the def of non manifold in cad

    let filename = "tests/square_ring/sliced/plate_1.gcode";
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
    let mut cur_pos = vec![0.,0.,0.];
    let mut cur_ext = 0.;

    let mut coords = vec![];
    for g in g1s {
        let pos = update_position(&cur_pos, g);
        if let Some(e) = g.e {
            if cur_ext + e > 0. {
                coords.push(vec![cur_pos.clone(), pos.clone()]);
                cur_ext = 0.;
            } else {
                cur_ext += e;
            }

        }
        cur_pos = pos;
    }
    let json = serde_json::to_string_pretty(&coords).unwrap();
    let mut file = File::create("sq_coords.json").unwrap();
    file.write_all(json.as_bytes()).unwrap();
    // println!("{}",coords.len());
    println!("{}",coords.len());
}
