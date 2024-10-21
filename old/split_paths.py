# %%
# Function to parse a line manually without regex
def parse_gcode_line(line):
    parsed_data = {}
    tokens = line.split()
    
    for token in tokens:
        if token.startswith(('X', 'Y', 'Z', 'E')):
            axis = token[0]
            value = float(token[1:])  # Convert the numeric part to float
            parsed_data[axis] = value
    
    return parsed_data

# Function to process the G-code content and split extrusions into paths
def process_gcode_lines(lines):
    paths = []
    current_path = []
    extruding = False  # Flag to track if material is being extruded
    current_extruder_position = 0  # Track the extruder's position

    for line in lines:
        if line.startswith('G1'):
            g_data = parse_gcode_line(line)

            # Debugging: print parsed data
            print(f"Parsed line: {g_data}")

            # Handle the extrusion 'E' value
            if 'E' in g_data:
                # Calculate the extruder's relative change
                extruder_change = g_data['E'] - current_extruder_position
                current_extruder_position = g_data['E']  # Update the current extruder position
                
                # Check if extruder is moving forward (extruding material)
                if extruder_change > 0:
                    extruding = True
                else:
                    extruding = False

            if extruding and ('X' in g_data or 'Y' in g_data or 'Z' in g_data):
                # Add current position to the current path
                current_path.append(g_data)

            # If the extruder is retracting or missing 'E', finish the current path
            if 'E' in g_data and extruder_change <= 0:
                if current_path:
                    paths.append(current_path)
                    current_path = []
                extruding = False

    # Add the last path if it hasn't been added
    if current_path:
        paths.append(current_path)

    return paths

# Function to read G-code file content
def read_gcode_file(file_path):
    with open(file_path, 'r') as f:
        lines = f.readlines()
    
    # Debugging: print the content of the file
    print("G-code file content:")
    for line in lines:
        print(line.strip())
    
    return lines

# %%
# Example usage
gcode_file_path = './tests/square_ring/sliced/plate_1.gcode'  # Replace with the actual G-code file path

# Read the G-code file
gcode_lines = read_gcode_file(gcode_file_path)

# Process the G-code lines to get extrusion paths
extrusion_paths = process_gcode_lines(gcode_lines)

# Print the paths (each path is a list of positions where material was extruded)
print("\nExtrusion paths:")
for i, path in enumerate(extrusion_paths):
    print(f"Path {i+1}:")
    for point in path:
        print(point)

# %%
