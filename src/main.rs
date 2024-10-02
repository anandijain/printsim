use std::fs::File;
use std::io::{self, BufRead, Write};
use std::path::Path;

use serde::Serialize; // Keep this import for working with file paths

// Define a struct to represent a parsed G1 command
#[derive(Debug, Clone, Serialize)]
struct G1Command {
    x: Option<f64>,
    y: Option<f64>,
    z: Option<f64>,
    e: Option<f64>,
}

// Define a struct to represent a path (a series of G1 movements with extrusion)
#[derive(Debug, Serialize)]
struct ExtrusionPath {
    movements: Vec<G1Command>,
}

// Define a struct to represent a layer (a collection of paths)
#[derive(Debug, Serialize)]
struct Layer {
    paths: Vec<ExtrusionPath>,
}

fn parse_g1(line: &str) -> Option<G1Command> {
    if !line.starts_with("G1") {
        return None;
    }

    let mut x = None;
    let mut y = None;
    let mut z = None;
    let mut e = None;

    for part in line.split_whitespace().skip(1) {
        if let Some(value) = part.strip_prefix('X') {
            x = value.parse().ok();
        } else if let Some(value) = part.strip_prefix('Y') {
            y = value.parse().ok();
        } else if let Some(value) = part.strip_prefix('Z') {
            z = value.parse().ok();
        } else if let Some(value) = part.strip_prefix('E') {
            e = value.parse().ok();
        }
    }

    Some(G1Command { x, y, z, e })
}

fn read_gcode_file(filename: &str) -> io::Result<Vec<Layer>> {
    let file = File::open(Path::new(filename))?;
    let reader = io::BufReader::new(file);

    let mut layers: Vec<Layer> = Vec::new();
    let mut current_layer = Layer { paths: Vec::new() };
    let mut current_path = ExtrusionPath { movements: Vec::new() };
    let mut current_z = None;

    for line in reader.lines().flatten() {
        if let Some(g1) = parse_g1(&line) {
            // Check for layer change
            if let Some(z_value) = g1.z {
                if current_z != Some(z_value) {
                    // New layer detected
                    if !current_path.movements.is_empty() {
                        current_layer.paths.push(current_path);
                        current_path = ExtrusionPath { movements: Vec::new() };
                    }

                    if !current_layer.paths.is_empty() {
                        layers.push(current_layer);
                        current_layer = Layer { paths: Vec::new() };
                    }

                    current_z = Some(z_value);
                }
            }

            // If E is not None, it's an extrusion move
            if g1.e.is_some() {
                current_path.movements.push(g1);
            } else if !current_path.movements.is_empty() {
                // Non-extrusion move after an extrusion path means the path is complete
                current_layer.paths.push(current_path);
                current_path = ExtrusionPath { movements: Vec::new() };
            }
        }
    }

    // Add the last path and layer if they have any movements
    if !current_path.movements.is_empty() {
        current_layer.paths.push(current_path);
    }

    if !current_layer.paths.is_empty() {
        layers.push(current_layer);
    }

    Ok(layers)
}
fn export_to_json(layers: &[Layer], filename: &str) -> std::io::Result<()> {
    let json_data = serde_json::to_string(layers).expect("Failed to serialize data");
    let mut file = File::create(filename)?;
    file.write_all(json_data.as_bytes())?;
    Ok(())
}

fn main() {
    let filename = "C:\\Users\\anand\\.rust\\printsim\\straight_line_test\\plate_1.gcode";
    let gc = read_gcode_file(filename);
    export_to_json(gc.unwrap().as_ref(), "my_json.json");
    // match gc {
    //     Ok(layers) => {
    //         for (i, layer) in layers.iter().enumerate() {
    //             println!("Layer {}: {} paths", i + 1, layer.paths.len());
    //             for (j, path) in layer.paths.iter().enumerate() {
    //                 println!("  Path {}: {} movements", j + 1, path.movements.len());
    //                 for movement in &path.movements {
    //                     println!("    {:?}", movement);
    //                 }
    //             }
    //         }
    //     }
    //     Err(e) => eprintln!("Error reading file: {}", e),
    // }
}
