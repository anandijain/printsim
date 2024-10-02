use std::{fmt::Error, fs::{read_to_string, File}, io::{self, BufRead}};
use anyhow;
use std::str::FromStr;

// Define a struct to represent a parsed G1 command
#[derive(Debug)]
struct G1Command {
    x: Option<f64>,
    y: Option<f64>,
    z: Option<f64>,
    e: Option<f64>,
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
            x = f64::from_str(value).ok();
        } else if let Some(value) = part.strip_prefix('Y') {
            y = f64::from_str(value).ok();
        } else if let Some(value) = part.strip_prefix('Z') {
            z = f64::from_str(value).ok();
        } else if let Some(value) = part.strip_prefix('E') {
            e = f64::from_str(value).ok();
        }
    }

    Some(G1Command { x, y, z, e })
}
fn find_no_extrusion_moves(commands: &[G1Command]) -> Vec<&G1Command> {
    commands.iter().filter(|cmd| cmd.e.is_none()).collect()
}
fn find_x_without_y(commands: &[G1Command]) -> Vec<&G1Command> {
    commands
        .iter()
        .filter(|cmd| cmd.x.is_some() && cmd.y.is_none())
        .collect()
}

fn find_y_without_x(commands: &[G1Command]) -> Vec<&G1Command> {
    commands
        .iter()
        .filter(|cmd| cmd.y.is_some() && cmd.x.is_none())
        .collect()
}

fn find_moves_without_extrusion_but_with_xy(commands: &[G1Command]) -> Vec<&G1Command> {
    commands
        .iter()
        .filter(|cmd| cmd.e.is_none() && cmd.x.is_some() && cmd.y.is_some())
        .collect()
}


fn main() ->Result<(), anyhow::Error> {
    let path = "C:\\Users\\anand\\.rust\\printsim\\straight_line_test\\plate_1.gcode";
    let s= read_to_string(path)?;
    let mut parsed_commands = vec![];
    for line in io::BufReader::new(File::open(path)?).lines().flatten() {
        if line.starts_with("G1") {
            let g1 = parse_g1(&line).unwrap();
            // println!("{:?}", g1);
            // prin
            parsed_commands.push(g1);
        }
        
    }
    // Find all moves where X is specified but Y is None
    let x_without_y = find_x_without_y(&parsed_commands);
    println!("Moves with X specified but Y is None:");
    for cmd in x_without_y {
        println!("{:?}", cmd);
    }

    // Find all moves where Y is specified but X is None
    let y_without_x = find_y_without_x(&parsed_commands);
    println!("\nMoves with Y specified but X is None:");
    for cmd in y_without_x {
        println!("{:?}", cmd);
    }
    let no_extrusion_moves = find_no_extrusion_moves(&parsed_commands);
    // println!("Moves with no extrusion (E = None):");
    // for cmd in no_extrusion_moves {
    // }
    // println!("Hello, world! {s}");
        // Find all moves where E is None but both X and Y are Some
    let no_extrusion_xy_moves = find_moves_without_extrusion_but_with_xy(&parsed_commands);

    println!("Moves with no extrusion (E = None) but X and Y are specified:");
    for cmd in no_extrusion_xy_moves {
        println!("{:?}", cmd);
    }
    
    
    Ok(())
    
}
