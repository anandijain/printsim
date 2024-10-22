; HEADER_BLOCK_START
; BambuStudio 01.09.07.52
; model printing time: 14m 40s; total estimated time: 20m 23s
; total layer number: 45
; total filament length [mm] : 2336.91
; total filament volume [cm^3] : 5620.93
; total filament weight [g] : 7.08
; filament_density: 1.26
; filament_diameter: 1.75
; max_z_height: 9.00
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 70
; auxiliary_fan = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0
; change_filament_gcode = ;===== machine: A1 =========================\n;===== date: 20240830 =======================\nM1007 S0 ; turn off mass estimation\nG392 S0\nM620 S[next_extruder]A\nM204 S9000\n{if toolchange_count > 1}\nG17\nG2 Z{max_layer_z + 0.4} I0.86 J0.86 P1 F10000 ; spiral lift a little from second lift\n{endif}\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n\nG1 X267 F18000\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nM620.10 A0 F[old_filament_e_feedrate]\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\nM620.10 A1 F[new_filament_e_feedrate] L[flush_length] H[nozzle_diameter] T[nozzle_temperature_range_high]\n\nG1 Y128 F9000\n\n{if next_extruder < 255}\nM400\n\nG92 E0\nM628 S0\n\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S[nozzle_temperature_range_high]\nM106 P1 S60\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\nM400\nM1002 set_filament_type:{filament_type[next_extruder]}\n{endif}\n\n{if flush_length_1 > 45 && flush_length_2 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_2 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 45 && flush_length_3 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_3 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 45 && flush_length_4 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_4 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM629\n\nM400\nM106 P1 S60\nM109 S[new_filament_temp]\nG1 E6 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nG1 Z{max_layer_z + 3.0} F3000\nM106 P1 S0\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\n\nM622.1 S0\nM9833 F{outer_wall_volumetric_speed/2.4} A0.3 ; cali dynamic extrusion compensation\nM1002 judge_flag filament_need_cali_flag\nM622 J1\n  G92 E0\n  G1 E-[new_retract_length_toolchange] F1800\n  M400\n  \n  M106 P1 S178\n  M400 S4\n  G1 X-38.2 F18000\n  G1 X-48.2 F3000\n  G1 X-38.2 F18000 ;wipe and shake\n  G1 X-48.2 F3000\n  G1 X-38.2 F12000 ;wipe and shake\n  G1 X-48.2 F3000\n  M400\n  M106 P1 S0 \n  \n\nM623\n\nM621 S[next_extruder]A\nG392 S0\n\nM1007 S1\n
; close_fan_the_first_x_layers = 1
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; curr_bed_type = Textured PEI Plate
; default_acceleration = 6000
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL A1"
; default_jerk = 0
; default_print_profile = 0.20mm Standard @BBL A1
; deretraction_speed = 30
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0.075
; enable_arc_fitting = 1
; enable_long_retraction_when_cut = 0
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pressure_advance = 0
; enable_prime_tower = 0
; enable_support = 0
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
; ensure_vertical_shell_thickness = 1
; exclude_object = 1
; extruder_clearance_height_to_lid = 256
; extruder_clearance_height_to_rod = 25
; extruder_clearance_max_radius = 73
; extruder_clearance_radius = 73
; extruder_colour = #018001
; extruder_offset = 0x0
; extruder_type = DirectDrive
; fan_cooling_layer_time = 80
; fan_max_speed = 80
; fan_min_speed = 60
; filament_colour = #00AE42
; filament_cost = 24.99
; filament_density = 1.26
; filament_diameter = 1.75
; filament_end_gcode = "; filament end gcode \nM106 P3 S0\n"
; filament_flow_ratio = 0.98
; filament_ids = GFA00
; filament_is_support = 0
; filament_max_volumetric_speed = 21
; filament_minimal_purge_on_wipe_tower = 15
; filament_notes = 
; filament_settings_id = "Bambu PLA Basic @BBL A1"
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA
; filament_vendor = "Bambu Lab"
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 226x224,256x224,256x256,226x256
; host_type = octoprint
; hot_plate_temp = 65
; hot_plate_temp_initial_layer = 65
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_jerk = 9
; infill_wall_overlap = 15%
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_flow = 10%
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; long_retractions_when_cut = 0
; machine_end_gcode = ;===== date: 20231229 =====================\nG392 S0 ;turn off nozzle clog detect\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\n{if !spiral_mode && print_sequence != "by object"}\nM1002 judge_flag timelapse_record_flag\nM622 J1\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM991 S0 P-1 ;end timelapse at safe pos\nM623\n{endif}\n\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n;G1 X27 F15000 ; wipe\n\n; pull back filament to AMS\nM620 S255\nG1 X267 F15000\nT255\nG1 X-28.5 F18000\nG1 X-48.2 F3000\nG1 X-28.5 F18000\nG1 X-48.2 F3000\nM621 S255\n\nM104 S0 ; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 256}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z256 F600\n    G1 Z256\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X-48 Y180 F3600\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A0 B20 L100 C37 D20 M40 E42 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C46 D10 M80 E46 F10 N80\nM1006 A44 B20 L100 C39 D20 M60 E48 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C48 D10 M60 E44 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10  N80\nM1006 A44 B20 L100 C49 D20 M80 E41 F20 N80\nM1006 A0 B20 L100 C0 D20 M60 E0 F20 N80\nM1006 A0 B20 L100 C37 D20 M30 E37 F20 N60\nM1006 W\n;=====printer finish  sound=========\n\n;M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\nM400\nM18 X Y Z\n\n
; machine_load_filament_time = 25
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 12000,12000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 12000,12000
; machine_max_acceleration_y = 12000,12000
; machine_max_acceleration_z = 1500,1500
; machine_max_jerk_e = 3,3
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 30,30
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_start_gcode = ;===== machine: A1 =========================\n;===== date: 20240620 =====================\nG392 S0\nM9833.2\n;M400\n;M73 P1.717\n\n;===== start to heat heatbead&hotend==========\nM1002 gcode_claim_action : 2\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM104 S140\nM140 S[bed_temperature_initial_layer_single]\n\n;=====start printer sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A0 B10 L100 C37 D10 M60 E37 F10 N60\nM1006 A0 B10 L100 C41 D10 M60 E41 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A43 B10 L100 C46 D10 M70 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C43 D10 M60 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C41 D10 M80 E41 F10 N80\nM1006 A0 B10 L100 C44 D10 M80 E44 F10 N80\nM1006 A0 B10 L100 C49 D10 M80 E49 F10 N80\nM1006 A0 B10 L100 C0 D10 M80 E0 F10 N80\nM1006 A44 B10 L100 C48 D10 M60 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C44 D10 M80 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A43 B10 L100 C46 D10 M60 E39 F10 N80\nM1006 W\nM18 \n;=====start printer sound ===================\n\n;=====avoid end stop =================\nG91\nG380 S2 Z40 F1200\nG380 S3 Z-15 F1200\nG90\n\n;===== reset machine status =================\n;M290 X39 Y39 Z8\nM204 S6000\n\nM630 S0 P0\nG91\nM17 Z0.3 ; lower the z-motor current\n\nG90\nM17 X0.65 Y1.2 Z0.6 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\n;M211 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\n\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\nM1002 gcode_claim_action : 13\n\nG28 X\nG91\nG1 Z5 F1200\nG90\nG0 X128 F30000\nG0 Y254 F3000\nG91\nG1 Z-5 F1200\n\nM109 S25 H140\n\nM17 E0.3\nM83\nG1 E10 F1200\nG1 E-0.5 F30\nM17 D\n\nG28 Z P0 T140; home z with low precision,permit 300deg temperature\nM104 S{nozzle_temperature_initial_layer[initial_extruder]}\n\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n  G39.4\n  G90\n  G1 Z5 F1200\nM623\n\n;M400\n;M73 P1.717\n\n;===== prepare print temperature and material ==========\nM1002 gcode_claim_action : 24\n\nM400\n;G392 S1\nM211 X0 Y0 Z0 ;turn off soft endstop\nM975 S1 ; turn on\n\nG90\nG1 X-28.5 F30000\nG1 X-48.2 F3000\n\nM620 M ;enable remap\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    M1002 gcode_claim_action : 4\n    M400\n    M1002 set_filament_type:UNKNOWN\n    M109 S[nozzle_temperature_initial_layer]\n    M104 S250\n    M400\n    T[initial_no_support_extruder]\n    G1 X-48.2 F3000\n    M400\n\n    M620.1 E F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60} T{nozzle_temperature_range_high[initial_no_support_extruder]}\n    M109 S250 ;set nozzle to common flush temp\n    M106 P1 S0\n    G92 E0\n    G1 E50 F200\n    M400\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM621 S[initial_no_support_extruder]A\n\nM109 S{nozzle_temperature_range_high[initial_no_support_extruder]} H300\nG92 E0\nG1 E50 F200 ; lower extrusion speed to avoid clog\nM400\nM106 P1 S178\nG92 E0\nG1 E5 F200\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nG92 E0\nG1 E-0.5 F300\n\nG1 X-28.5 F30000\nG1 X-48.2 F3000\nG1 X-28.5 F30000 ;wipe and shake\nG1 X-48.2 F3000\nG1 X-28.5 F30000 ;wipe and shake\nG1 X-48.2 F3000\n\n;G392 S0\n\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n;M400\n;M73 P1.717\n\n;===== auto extrude cali start =========================\nM975 S1\n;G392 S1\n\nG90\nM83\nT1000\nG1 X-48.2 Y0 Z10 F10000\nM400\nM1002 set_filament_type:UNKNOWN\n\nM412 S1 ;  ===turn on  filament runout detection===\nM400 P10\nM620.3 W1; === turn on filament tangle detection===\nM400 S2\n\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n\n;M1002 set_flag extrude_cali_flag=1\nM1002 judge_flag extrude_cali_flag\n\nM622 J1\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_extruder]}\n    G1 E10 F{outer_wall_volumetric_speed/2.4*60}\n    M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n\n    M106 P1 S255\n    M400 S5\n    G1 X-28.5 F18000\n    G1 X-48.2 F3000\n    G1 X-28.5 F18000 ;wipe and shake\n    G1 X-48.2 F3000\n    G1 X-28.5 F12000 ;wipe and shake\n    G1 X-48.2 F3000\n    M400\n    M106 P1 S0\n\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n        M106 P1 S255\n        M400 S5\n        G1 X-28.5 F18000\n        G1 X-48.2 F3000\n        G1 X-28.5 F18000 ;wipe and shake\n        G1 X-48.2 F3000\n        G1 X-28.5 F12000 ;wipe and shake\n        M400\n        M106 P1 S0\n    M623\n    \n    G1 X-48.2 F3000\n    M400\n    M984 A0.1 E1 S1 F{outer_wall_volumetric_speed/2.4} H[nozzle_diameter]\n    M106 P1 S178\n    M400 S7\n    G1 X-28.5 F18000\n    G1 X-48.2 F3000\n    G1 X-28.5 F18000 ;wipe and shake\n    G1 X-48.2 F3000\n    G1 X-28.5 F12000 ;wipe and shake\n    G1 X-48.2 F3000\n    M400\n    M106 P1 S0\nM623 ; end of "draw extrinsic para cali paint"\n\n;G392 S0\n;===== auto extrude cali end ========================\n\n;M400\n;M73 P1.717\n\nM104 S170 ; prepare to wipe nozzle\nM106 S255 ; turn on fan\n\n;===== mech mode fast check start =====================\nM1002 gcode_claim_action : 3\n\nG1 X128 Y128 F20000\nG1 Z5 F1200\nM400 P200\nM970.3 Q1 A5 K0 O3\nM974 Q1 S2 P0\n\nM970.2 Q1 K1 W58 Z0.1\nM974 S2\n\nG1 X128 Y128 F20000\nG1 Z5 F1200\nM400 P200\nM970.3 Q0 A10 K0 O1\nM974 Q0 S2 P0\n\nM970.2 Q0 K1 W78 Z0.1\nM974 S2\n\nM975 S1\nG1 F30000\nG1 X0 Y5\nG28 X ; re-home XY\n\nG1 Z4 F1200\n\n;===== mech mode fast check end =======================\n\n;M400\n;M73 P1.717\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\n\nM975 S1\nM106 S255 ; turn on fan (G28 has turn off fan)\nM211 S; push soft endstop status\nM211 X0 Y0 Z0 ;turn off Z axis endstop\n\n;===== remove waste by touching start =====\n\nM104 S170 ; set temp down to heatbed acceptable\n\nM83\nG1 E-1 F500\nG90\nM83\n\nM109 S170\nG0 X108 Y-0.5 F30000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X110 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X112 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X114 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X116 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X118 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X120 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X122 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X124 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X126 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X128 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X130 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X132 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X134 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X136 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X138 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X140 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X142 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X144 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X146 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X148 F10000\nG380 S3 Z-5 F1200\n\nG1 Z5 F30000\n;===== remove waste by touching end =====\n\nG1 Z10 F1200\nG0 X118 Y261 F30000\nG1 Z5 F1200\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-50}\n\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nM104 S140 ; prepare to abl\nG0 Z5 F20000\n\nG0 X128 Y261 F20000  ; move to exposed steel surface\nG0 Z-1.01 F1200      ; stop the nozzle\n\nG91\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nG90\nG1 Z10 F1200\n\n;===== brush material wipe nozzle =====\n\nG90\nG1 Y250 F30000\nG1 X55\nG1 Z1.300 F1200\nG1 Y262.5 F6000\nG91\nG1 X-35 F30000\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Z5.000 F1200\n\nG90\nG1 X30 Y250.000 F30000\nG1 Z1.300 F1200\nG1 Y262.5 F6000\nG91\nG1 X35 F30000\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Z10.000 F1200\n\n;===== brush material wipe nozzle end =====\n\nG90\n;G0 X128 Y261 F20000  ; move to exposed steel surface\nG1 Y250 F30000\nG1 X138\nG1 Y261\nG0 Z-1.01 F1200      ; stop the nozzle\n\nG91\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nM109 S140\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM211 R; pop softend status\n\n;===== wipe nozzle end ================================\n\n;M400\n;M73 P1.717\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\n\nG90\nG1 Z5 F1200\nG1 X0 Y0 F30000\nG29.2 S1 ; turn on ABL\n\nM190 S[bed_temperature_initial_layer_single]; ensure bed temp\nM109 S140\nM106 S0 ; turn off fan , too noisy\n\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29 A1 X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n\n;===== home after wipe mouth end =======================\n\n;M400\n;M73 P1.717\n\nG1 X108.000 Y-0.500 F30000\nG1 Z0.300 F1200\nM400\nG2814 Z0.32\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; prepare to print\n\n;===== nozzle load line ===============================\n;G90\n;M83\n;G1 Z5 F1200\n;G1 X88 Y-0.5 F20000\n;G1 Z0.3 F1200\n\n;M109 S{nozzle_temperature_initial_layer[initial_extruder]}\n\n;G1 E2 F300\n;G1 X168 E4.989 F6000\n;G1 Z1 F1200\n;===== nozzle load line end ===========================\n\n;===== extrude cali test ===============================\n\nM400\n    M900 S\n    M900 C\n    G90\n    M83\n\n    M109 S{nozzle_temperature_initial_layer[initial_extruder]}\n    G0 X128 E8  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X133 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X138 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X143 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X148 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X153 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G91\n    G1 X1 Z-0.300\n    G1 X4\n    G1 Z1 F1200\n    G90\n    M400\n\nM900 R\n\nM1002 judge_flag extrude_cali_flag\nM622 J1\n    G90\n    G1 X108.000 Y1.000 F30000\n    G91\n    G1 Z-0.700 F1200\n    G90\n    M83\n    G0 X128 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X133 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X138 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X143 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X148 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X153 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G91\n    G1 X1 Z-0.300\n    G1 X4\n    G1 Z1 F1200\n    G90\n    M400\nM623\n\nG1 Z0.2\n\n;M400\n;M73 P1.717\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.02} ; for Textured PEI Plate\n{endif}\n\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n\nM211 X0 Y0 Z0 ;turn off soft endstop\n;G392 S1 ; turn on clog detection\nM1007 S1 ; turn on mass estimation\nG29.4\n
; machine_unload_filament_time = 29
; max_bridge_length = 10
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; nozzle_diameter = 0.4
; nozzle_height = 4.76
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
; nozzle_type = stainless_steel
; nozzle_volume = 92
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
; overhang_totally_speed = 19
; post_process = 
; precise_z_height = 0
; pressure_advance = 0.02
; prime_tower_brim_width = 3
; prime_tower_width = 35
; prime_volume = 45
; print_compatible_printers = "Bambu Lab A1 0.4 nozzle"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL A1
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 256
; printer_model = Bambu Lab A1
; printer_notes = 
; printer_settings_id = Bambu Lab A1 0.4 nozzle
; printer_structure = i3
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = 2
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 255
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 50%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 6
; slow_down_min_speed = 20
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 80
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 1
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = normal(auto)
; temperature_vitrification = 45
; template_custom_gcode = 
; textured_plate_temp = 65
; textured_plate_temp_initial_layer = 65
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;===================== date: 20240606 =====================\n{if !spiral_mode && print_sequence != "by object"}\n; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\nG92 E0\nG17\nG2 Z{layer_z + 0.4} I0.86 J0.86 P1 F20000 ; spiral lift a little\nG1 Z{max_layer_z + 0.4}\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-48.2 F3000 ; move to safe pos\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X0 F18000\nM623\n\nM622.1 S1\nM1002 judge_flag g39_3rd_layer_detect_flag\nM622 J1\n    ; enable nozzle clog detect at 3rd layer\n    {if layer_num == 2}\n      M400\n      G90\n      M83\n      M204 S5000\n      G0 Z2 F4000\n      G0 X261 Y250 F20000\n      M400 P200\n      G39 S1\n      G0 Z2 F4000\n    {endif}\n\n\n    M622.1 S1\n    M1002 judge_flag g39_detection_flag\n    M622 J1\n      {if !in_head_wrap_detect_zone}\n        M622.1 S0\n        M1002 judge_flag g39_mass_exceed_flag\n        M622 J1\n        {if layer_num > 2}\n            G392 S0\n            M400\n            G90\n            M83\n            M204 S5000\n            G0 Z{max_layer_z + 0.4} F4000\n            G39.3 S1\n            G0 Z{max_layer_z + 0.4} F4000\n            G392 S0\n          {endif}\n        M623\n    {endif}\n    M623\nM623\n{endif}\n
; timelapse_type = 0
; top_area_threshold = 100%
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; travel_jerk = 9
; travel_speed = 700
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_distance = 5
; tree_support_wall_count = 0
; upward_compatible_machine = 
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = classic
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 0
; wipe_tower_y = 250
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R20
M201 X12000 Y12000 Z1500 E5000
M203 X500 Y500 Z30 E30
M204 P12000 R5000 T12000
M205 X9.00 Y9.00 Z3.00 E3.00
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: A1 =========================
;===== date: 20240620 =====================
G392 S0
M9833.2
;M400
;M73 P1.717

;===== start to heat heatbead&hotend==========
M1002 gcode_claim_action : 2
M1002 set_filament_type:PLA
M104 S140
M140 S65

;=====start printer sound ===================
M17
M400 S1
M1006 S1
M1006 A0 B10 L100 C37 D10 M60 E37 F10 N60
M1006 A0 B10 L100 C41 D10 M60 E41 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A43 B10 L100 C46 D10 M70 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C43 D10 M60 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C41 D10 M80 E41 F10 N80
M1006 A0 B10 L100 C44 D10 M80 E44 F10 N80
M1006 A0 B10 L100 C49 D10 M80 E49 F10 N80
M1006 A0 B10 L100 C0 D10 M80 E0 F10 N80
M1006 A44 B10 L100 C48 D10 M60 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C44 D10 M80 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A43 B10 L100 C46 D10 M60 E39 F10 N80
M1006 W
M18 
;=====start printer sound ===================

;=====avoid end stop =================
G91
G380 S2 Z40 F1200
G380 S3 Z-15 F1200
G90

;===== reset machine status =================
;M290 X39 Y39 Z8
M204 S6000

M630 S0 P0
G91
M17 Z0.3 ; lower the z-motor current

G90
M17 X0.65 Y1.2 Z0.6 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
;M211 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem

;====== cog noise reduction=================
M982.2 S1 ; turn on cog noise reduction

M1002 gcode_claim_action : 13

G28 X
G91
G1 Z5 F1200
G90
G0 X128 F30000
G0 Y254 F3000
G91
G1 Z-5 F1200

M109 S25 H140

M17 E0.3
M83
G1 E10 F1200
G1 E-0.5 F30
M17 D

G28 Z P0 T140; home z with low precision,permit 300deg temperature
M104 S220

M1002 judge_flag build_plate_detect_flag
M622 S1
  G39.4
  G90
  G1 Z5 F1200
M623

;M400
;M73 P1.717

;===== prepare print temperature and material ==========
M1002 gcode_claim_action : 24

M400
;G392 S1
M211 X0 Y0 Z0 ;turn off soft endstop
M975 S1 ; turn on

G90
G1 X-28.5 F30000
G1 X-48.2 F3000

M620 M ;enable remap
M620 S0A   ; switch material if AMS exist
    M1002 gcode_claim_action : 4
    M400
    M1002 set_filament_type:UNKNOWN
    M109 S220
    M104 S250
    M400
    T0
    G1 X-48.2 F3000
    M400

    M620.1 E F523.843 T240
    M109 S250 ;set nozzle to common flush temp
    M106 P1 S0
    G92 E0
    G1 E50 F200
    M400
    M1002 set_filament_type:PLA
M621 S0A

M109 S240 H300
G92 E0
G1 E50 F200 ; lower extrusion speed to avoid clog
M400
M106 P1 S178
G92 E0
G1 E5 F200
M104 S220
G92 E0
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P1 R20
G1 X-48.2 F3000
M73 P3 R19
G1 X-28.5 F30000 ;wipe and shake
G1 X-48.2 F3000
G1 X-28.5 F30000 ;wipe and shake
G1 X-48.2 F3000

;G392 S0

M400
M106 P1 S0
;===== prepare print temperature and material end =====

;M400
;M73 P1.717

;===== auto extrude cali start =========================
M975 S1
;G392 S1

G90
M83
T1000
G1 X-48.2 Y0 Z10 F10000
M400
M1002 set_filament_type:UNKNOWN

M412 S1 ;  ===turn on  filament runout detection===
M400 P10
M620.3 W1; === turn on filament tangle detection===
M400 S2

M1002 set_filament_type:PLA

;M1002 set_flag extrude_cali_flag=1
M1002 judge_flag extrude_cali_flag

M622 J1
    M1002 gcode_claim_action : 8

    M109 S220
    G1 E10 F377.08
    M983 F6.28466 A0.3 H0.4; cali dynamic extrusion compensation

    M106 P1 S255
    M400 S5
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
M73 P4 R19
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F6.28466 A0.3 H0.4; cali dynamic extrusion compensation
        M106 P1 S255
        M400 S5
        G1 X-28.5 F18000
        G1 X-48.2 F3000
        G1 X-28.5 F18000 ;wipe and shake
        G1 X-48.2 F3000
        G1 X-28.5 F12000 ;wipe and shake
        M400
        M106 P1 S0
    M623
    
    G1 X-48.2 F3000
    M400
    M984 A0.1 E1 S1 F6.28466 H0.4
    M106 P1 S178
    M400 S7
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0
M623 ; end of "draw extrinsic para cali paint"

;G392 S0
;===== auto extrude cali end ========================

;M400
;M73 P1.717

M104 S170 ; prepare to wipe nozzle
M106 S255 ; turn on fan

;===== mech mode fast check start =====================
M1002 gcode_claim_action : 3

G1 X128 Y128 F20000
G1 Z5 F1200
M400 P200
M970.3 Q1 A5 K0 O3
M974 Q1 S2 P0

M970.2 Q1 K1 W58 Z0.1
M974 S2

G1 X128 Y128 F20000
M73 P5 R19
G1 Z5 F1200
M400 P200
M970.3 Q0 A10 K0 O1
M974 Q0 S2 P0

M970.2 Q0 K1 W78 Z0.1
M974 S2

M975 S1
G1 F30000
G1 X0 Y5
G28 X ; re-home XY

G1 Z4 F1200

;===== mech mode fast check end =======================

;M400
;M73 P1.717

;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14

M975 S1
M106 S255 ; turn on fan (G28 has turn off fan)
M211 S; push soft endstop status
M211 X0 Y0 Z0 ;turn off Z axis endstop

;===== remove waste by touching start =====

M104 S170 ; set temp down to heatbed acceptable

M83
G1 E-1 F500
G90
M83

M109 S170
G0 X108 Y-0.5 F30000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X110 F10000
G380 S3 Z-5 F1200
M73 P26 R15
G1 Z2 F1200
G1 X112 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X114 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X116 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X118 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X120 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X122 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X124 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X126 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X128 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X130 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X132 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X134 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X136 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X138 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X140 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X142 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X144 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X146 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X148 F10000
G380 S3 Z-5 F1200

G1 Z5 F30000
;===== remove waste by touching end =====

G1 Z10 F1200
G0 X118 Y261 F30000
G1 Z5 F1200
M109 S170

G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
M104 S140 ; prepare to abl
G0 Z5 F20000

G0 X128 Y261 F20000  ; move to exposed steel surface
G0 Z-1.01 F1200      ; stop the nozzle

G91
G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
M73 P26 R14
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

G90
G1 Z10 F1200

;===== brush material wipe nozzle =====

G90
G1 Y250 F30000
G1 X55
G1 Z1.300 F1200
G1 Y262.5 F6000
G91
G1 X-35 F30000
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Z5.000 F1200

G90
G1 X30 Y250.000 F30000
G1 Z1.300 F1200
G1 Y262.5 F6000
G91
G1 X35 F30000
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
M73 P27 R14
G1 X45
G1 Y-0.5
G1 X-45
G1 Z10.000 F1200

;===== brush material wipe nozzle end =====

G90
;G0 X128 Y261 F20000  ; move to exposed steel surface
G1 Y250 F30000
G1 X138
G1 Y261
G0 Z-1.01 F1200      ; stop the nozzle

G91
G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

M109 S140
M106 S255 ; turn on fan (G28 has turn off fan)

M211 R; pop softend status

;===== wipe nozzle end ================================

;M400
;M73 P1.717

;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag

G90
G1 Z5 F1200
G1 X0 Y0 F30000
G29.2 S1 ; turn on ABL

M190 S65; ensure bed temp
M109 S140
M106 S0 ; turn off fan , too noisy

M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X110.5 Y93 I35 J70
    M400
    M500 ; save cali data
M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623

;===== home after wipe mouth end =======================

;M400
;M73 P1.717

G1 X108.000 Y-0.500 F30000
G1 Z0.300 F1200
M400
G2814 Z0.32

M104 S220 ; prepare to print

;===== nozzle load line ===============================
;G90
;M83
;G1 Z5 F1200
;G1 X88 Y-0.5 F20000
;G1 Z0.3 F1200

;M109 S220

;G1 E2 F300
;G1 X168 E4.989 F6000
;G1 Z1 F1200
;===== nozzle load line end ===========================

;===== extrude cali test ===============================

M400
    M900 S
    M900 C
    G90
    M83

    M109 S220
    G0 X128 E8  F904.991
    G0 X133 E.3742  F1508.32
    G0 X138 E.3742  F6033.27
    G0 X143 E.3742  F1508.32
    G0 X148 E.3742  F6033.27
    G0 X153 E.3742  F1508.32
    G91
    G1 X1 Z-0.300
    G1 X4
    G1 Z1 F1200
    G90
    M400

M900 R

M1002 judge_flag extrude_cali_flag
M622 J1
    G90
    G1 X108.000 Y1.000 F30000
    G91
    G1 Z-0.700 F1200
    G90
    M83
    G0 X128 E10  F904.991
    G0 X133 E.3742  F1508.32
    G0 X138 E.3742  F6033.27
    G0 X143 E.3742  F1508.32
    G0 X148 E.3742  F6033.27
    G0 X153 E.3742  F1508.32
    G91
    G1 X1 Z-0.300
    G1 X4
    G1 Z1 F1200
    G90
    M400
M623

G1 Z0.2

;M400
;M73 P1.717

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.02 ; for Textured PEI Plate


M960 S1 P0 ; turn off laser
M960 S2 P0 ; turn off laser
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
M83
T1000

M211 X0 Y0 Z0 ;turn off soft endstop
;G392 S1 ; turn on clog detection
M1007 S1 ; turn on mass estimation
G29.4
G90
G21
M83 ; use relative distances for extrusion
; filament start gcode
M106 P3 S200


M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/45
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S500
G1 X123.187 Y157.344 F42000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X118.126 Y152.283 E.26658
G3 X116.121 Y147.443 I4.925 J-4.875 E.20011
G1 X116.121 Y134.646 E.47663
G3 X122.362 Y127.81 I6.891 J.024 E.37804
G3 X126.934 Y129.017 I.63 J6.875 E.17976
G1 X136.957 Y136.035 E.45571
G3 X139.879 Y141.649 I-3.955 J5.627 E.24496
G1 X139.879 Y147.443 E.21581
G3 X137.874 Y152.283 I-6.925 J-.033 E.20012
G1 X132.778 Y157.379 E.26842
G1 X123.232 Y157.379 E.35555
G1 X123.362 Y156.873 F42000
; FEATURE: Outer wall
G1 F3000
G1 X118.455 Y151.966 E.25848
G3 X116.578 Y147.435 I4.596 J-4.558 E.18735
G1 X116.578 Y134.654 E.47602
G3 X122.405 Y128.266 I6.433 J.016 E.35318
G3 X126.679 Y129.396 I.588 J6.42 E.16807
G1 X136.688 Y136.405 E.45511
G3 X139.422 Y141.657 I-3.689 J5.258 E.22919
G1 X139.422 Y147.435 E.21522
M73 P28 R14
G3 X137.545 Y151.966 I-6.468 J-.025 E.18736
G1 X132.589 Y156.922 E.26106
G1 X123.411 Y156.922 E.34185
G1 X123.404 Y156.915 E.00034
; WIPE_START
G1 F33600
G1 X121.99 Y155.501 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.147 Y148.18 Z.6 F42000
G1 X133.891 Y115.108 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X133.879 Y112.858 E.08377
G3 X133.938 Y112.72 I.125 J-.029 E.00599
G1 X135.757 Y110.901 E.09581
G2 X136.879 Y108.191 I-2.746 J-2.725 E.11206
G2 X136.813 Y105.946 I-17.698 J-.602 E.0837
G2 X128.512 Y98.621 I-8.323 J1.066 E.45028
G2 X125.364 Y99.093 I-.429 J7.868 E.11939
G2 X122.285 Y101.469 I2.727 J6.716 E.14665
G2 X120.598 Y104.945 I8.364 J6.208 E.14474
G2 X119.615 Y109.363 I47.198 J12.819 E.16862
G2 X119.907 Y116.364 I13.092 J2.96 E.26405
G2 X124.762 Y122.928 I12.387 J-4.083 E.30931
G1 X139.084 Y132.956 E.65119
G3 X143.621 Y141.672 I-6.116 J8.723 E.38038
G1 X143.621 Y150.49 E.32843
G3 X132.989 Y161.121 I-10.626 J.005 E.6221
G1 X123.01 Y161.121 E.37167
G3 X112.379 Y150.49 I-.005 J-10.626 E.62207
G1 X112.379 Y104.189 E1.72454
G3 X115.497 Y96.66 I10.67 J.009 E.31141
G1 X117.278 Y94.879 E.09383
G1 X138.722 Y94.879 E.79868
G1 X138.809 Y94.967 E.00462
G1 X140.503 Y96.66 E.0892
G3 X143.621 Y104.188 I-7.557 J7.54 E.31137
G1 X143.621 Y111.983 E.29034
G3 X140.483 Y115.121 I-3.13 J.008 E.18372
G1 X134.036 Y115.121 E.24013
G1 X133.951 Y115.113 E.00319
G1 X133.561 Y115.37 F42000
; FEATURE: Outer wall
G1 F3000
G3 X133.422 Y114.986 I.449 J-.38 E.01553
G1 X133.422 Y112.841 E.0799
G3 X133.601 Y112.41 I.61 J.001 E.01783
G1 X135.425 Y110.586 E.0961
G2 X136.422 Y108.18 I-2.422 J-2.412 E.09951
G2 X136.359 Y106.004 I-17.212 J-.592 E.08114
G2 X128.505 Y99.078 I-7.869 J1.008 E.42595
G2 X125.531 Y99.519 I-.419 J7.424 E.11276
G2 X122.649 Y101.747 I2.548 J6.276 E.13737
G2 X121.036 Y105.075 I7.998 J5.929 E.13856
G2 X120.065 Y109.446 I46.797 J12.697 E.16685
G2 X120.217 Y115.813 I12.602 J2.884 E.23965
G2 X125.028 Y122.556 I11.962 J-3.446 E.31453
G1 X139.351 Y132.585 E.65126
G3 X144.078 Y141.666 I-6.383 J9.094 E.39629
G1 X144.078 Y150.496 E.32887
G3 X132.995 Y161.578 I-11.082 J0 E.6484
G1 X123.004 Y161.578 E.37213
G3 X111.922 Y150.496 I0 J-11.082 E.64839
G1 X111.922 Y104.182 E1.725
G3 X115.17 Y96.341 I11.127 J.016 E.32432
G1 X117.089 Y94.422 E.1011
G1 X138.911 Y94.422 E.81279
G1 X139.133 Y94.644 E.01167
G1 X140.83 Y96.341 E.08943
G3 X144.078 Y104.182 I-7.884 J7.859 E.3243
G1 X144.078 Y111.993 E.29093
G3 X140.493 Y115.578 I-3.582 J.003 E.2098
G1 X134.015 Y115.578 E.24128
G3 X133.602 Y115.414 I-.005 J-.588 E.01697
; WIPE_START
G1 F33600
G1 X133.459 Y115.199 E-.09814
G1 X133.422 Y114.986 E-.08213
G1 X133.422 Y113.461 E-.57973
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z0.6 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z0.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623


G1 Z1 F42000
G1 X137.88 Y132.336
M73 P29 R14
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.503125
G1 F6300
G1 X141.471 Y135.928 E.1905
G3 X142.303 Y137.411 I-7.643 J5.263 E.06385
G1 X136.546 Y131.654 E.30533
G1 X134.375 Y130.134 E.09939
G1 X142.722 Y138.48 E.44266
G3 X142.971 Y139.38 I-10.085 J3.276 E.03503
G1 X132.204 Y128.614 E.571
G1 X130.033 Y127.093 E.09939
G1 X143.122 Y140.182 E.69415
G3 X143.201 Y140.912 I-6.911 J1.12 E.02755
G1 X127.025 Y124.736 E.8579
; WIPE_START
G1 F33600
G1 X128.439 Y126.15 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.727 Y119.262 Z.6 F42000
G1 X141.688 Y98.396 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X138.559 Y95.268 E.16592
G1 X137.908 Y95.268 E.02441
G1 X142.049 Y99.408 E.21958
G3 X142.581 Y100.591 I-6.735 J3.742 E.04872
G1 X137.257 Y95.268 E.28234
G1 X136.607 Y95.268 E.02441
G1 X142.887 Y101.548 E.33308
G3 X143.07 Y102.382 I-7.633 J2.11 E.03202
G1 X135.956 Y95.268 E.37729
G1 X135.305 Y95.268 E.02441
G1 X143.179 Y103.142 E.41758
G3 X143.223 Y103.837 I-6.634 J.773 E.02614
G1 X134.654 Y95.268 E.45445
G1 X134.003 Y95.268 E.02441
G1 X143.232 Y104.497 E.48946
G1 X143.232 Y105.148 E.02441
G1 X133.352 Y95.268 E.52398
G1 X132.702 Y95.268 E.02441
G1 X143.232 Y105.799 E.5585
G1 X143.232 Y106.449 E.02441
G1 X132.051 Y95.268 E.59301
G1 X131.4 Y95.268 E.02441
G1 X143.232 Y107.1 E.62753
G1 X143.232 Y107.751 E.02441
G1 X130.749 Y95.268 E.66205
G1 X130.098 Y95.268 E.02441
G1 X143.232 Y108.402 E.69656
G1 X143.232 Y109.053 E.02441
G1 X129.447 Y95.268 E.73108
G1 X128.797 Y95.268 E.02441
G1 X133.021 Y99.492 E.22403
G3 X136.008 Y102.479 I-4.527 J7.515 E.16
G1 X143.232 Y109.704 E.38314
G1 X143.232 Y110.354 E.02441
G1 X136.653 Y103.775 E.34895
G3 X136.971 Y104.743 I-7.51 J3.002 E.03826
G1 X143.232 Y111.005 E.33209
G1 X143.232 Y111.656 E.02441
G1 X137.147 Y105.57 E.32275
G3 X137.238 Y106.312 I-5.888 J1.1 E.02805
M73 P30 R14
G1 X143.211 Y112.286 E.3168
G3 X143.101 Y112.826 I-2.119 J-.153 E.02074
G1 X137.256 Y106.981 E.30996
G1 X137.262 Y107.638 E.02464
G1 X142.903 Y113.279 E.29913
G3 X142.647 Y113.673 I-1.252 J-.532 E.01773
G1 X137.263 Y108.29 E.2855
G3 X137.205 Y108.883 I-3.022 J.002 E.02237
G1 X142.334 Y114.012 E.27202
G3 X141.966 Y114.294 I-.991 J-.91 E.0175
G1 X137.084 Y109.413 E.25888
G3 X136.906 Y109.886 I-8.28 J-2.85 E.01895
G1 X141.542 Y114.522 E.24587
G3 X141.037 Y114.667 I-.858 J-2.029 E.01976
G1 X136.686 Y110.316 E.23077
G3 X136.427 Y110.708 I-2.111 J-1.109 E.01765
G1 X140.44 Y114.721 E.21279
G1 X139.79 Y114.722 E.02436
G1 X136.133 Y111.064 E.19396
G3 X135.813 Y111.395 I-3.694 J-3.252 E.01727
G1 X139.14 Y114.723 E.17648
G1 X138.491 Y114.724 E.02436
G1 X135.488 Y111.722 E.15924
G1 X135.163 Y112.048 E.01726
G1 X137.841 Y114.725 E.142
G1 X137.191 Y114.727 E.02436
G1 X134.839 Y112.374 E.12476
G1 X134.514 Y112.7 E.01726
G1 X136.542 Y114.728 E.10753
G1 X135.892 Y114.729 E.02436
G1 X134.274 Y113.111 E.0858
G1 X134.276 Y113.764 E.02447
G1 X135.243 Y114.73 E.05126
G1 X134.593 Y114.731 E.02436
G1 X134.072 Y114.21 E.02765
; WIPE_START
G1 F33600
G1 X134.593 Y114.731 E-.28019
G1 X135.243 Y114.73 E-.24686
G1 X134.809 Y114.297 E-.23295
; WIPE_END
G1 E-.04 F1800
G1 X133.467 Y106.783 Z.6 F42000
G1 X132.119 Y99.241 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X128.146 Y95.268 E.21071
G1 X127.495 Y95.268 E.02441
G1 X130.758 Y98.531 E.17305
G2 X129.93 Y98.354 I-2.387 J9.136 E.03176
G1 X126.844 Y95.268 E.16366
G1 X126.193 Y95.268 E.02441
G1 X129.188 Y98.262 E.15881
G2 X128.507 Y98.232 I-.996 J15.049 E.02554
G1 X125.542 Y95.268 E.15724
G1 X124.892 Y95.268 E.02441
G1 X127.862 Y98.238 E.15755
G2 X127.241 Y98.268 I-.157 J3.258 E.02336
G1 X124.241 Y95.268 E.15911
G1 X123.59 Y95.268 E.02441
G1 X126.658 Y98.336 E.16272
G2 X126.121 Y98.449 I.616 J4.254 E.02061
G1 X122.939 Y95.268 E.16873
G1 X122.288 Y95.268 E.02441
G1 X125.619 Y98.598 E.17663
G2 X125.137 Y98.767 I.855 J3.203 E.01916
G1 X121.637 Y95.268 E.18561
G1 X120.987 Y95.268 E.02441
G1 X124.688 Y98.969 E.19628
G2 X124.266 Y99.198 I1.213 J2.735 E.01802
G1 X120.336 Y95.268 E.20844
G1 X119.685 Y95.268 E.02441
G1 X123.858 Y99.441 E.22134
G2 X123.484 Y99.718 I1.075 J1.843 E.01748
G1 X119.034 Y95.268 E.23602
G1 X118.383 Y95.268 E.02441
G1 X123.119 Y100.003 E.25115
G1 X122.783 Y100.318 E.01727
G1 X117.732 Y95.268 E.26784
G1 X117.439 Y95.268 E.01099
G1 X117.26 Y95.446 E.00949
G1 X122.462 Y100.648 E.27587
G2 X122.164 Y101.001 I2.692 J2.573 E.01733
G1 X116.935 Y95.772 E.27733
G1 X116.61 Y96.097 E.01726
G1 X121.88 Y101.368 E.27951
G2 X121.611 Y101.749 I3.115 J2.484 E.01752
G1 X116.284 Y96.423 E.28249
G1 X115.959 Y96.748 E.01726
G1 X121.359 Y102.148 E.28637
G2 X121.126 Y102.566 I3.347 J2.135 E.01796
G1 X115.637 Y97.077 E.2911
G2 X115.324 Y97.415 I3.08 J3.163 E.01728
G1 X120.91 Y103.001 E.29622
G2 X120.711 Y103.453 I4.155 J2.097 E.01853
G1 X115.026 Y97.768 E.3015
G1 X114.743 Y98.136 E.01741
G1 X120.531 Y103.923 E.30693
G1 X120.367 Y104.411 E.01928
G1 X114.477 Y98.521 E.31236
G2 X114.226 Y98.92 I3.776 J2.663 E.0177
G1 X120.208 Y104.902 E.31725
G1 X120.071 Y105.416 E.01994
G1 X113.99 Y99.335 E.32247
M73 P31 R14
G2 X113.772 Y99.768 I3.918 J2.253 E.01817
G1 X119.934 Y105.93 E.3268
G2 X119.816 Y106.463 I5.845 J1.574 E.02047
G1 X113.57 Y100.216 E.33126
G2 X113.386 Y100.684 I4.383 J1.988 E.01884
G1 X119.699 Y106.997 E.33479
G1 X119.582 Y107.531 E.0205
G1 X113.223 Y101.171 E.33727
G2 X113.08 Y101.68 I4.869 J1.637 E.01981
G1 X119.471 Y108.07 E.33892
G1 X119.369 Y108.619 E.02094
G1 X112.962 Y102.212 E.33978
G2 X112.869 Y102.769 I5.1 J1.144 E.0212
G1 X119.267 Y109.168 E.33934
G1 X119.165 Y109.717 E.02094
G1 X112.804 Y103.356 E.33734
G2 X112.774 Y103.976 I6.166 J.615 E.0233
G1 X119.063 Y110.266 E.33355
G2 X118.98 Y110.834 I4.744 J.983 E.02154
G1 X112.768 Y104.621 E.32949
G1 X112.768 Y105.272 E.02441
G1 X118.928 Y111.432 E.32672
G2 X118.894 Y112.049 I6.129 J.647 E.02318
G1 X112.768 Y105.923 E.32492
G1 X112.768 Y106.573 E.02441
G1 X118.898 Y112.704 E.32514
G2 X118.928 Y113.385 I4.933 J.122 E.02559
G1 X112.768 Y107.224 E.32674
G1 X112.768 Y107.875 E.02441
G1 X119.003 Y114.11 E.33069
G2 X119.131 Y114.89 I11.714 J-1.532 E.02963
G1 X112.768 Y108.526 E.33751
G1 X112.768 Y109.177 E.02441
G1 X119.321 Y115.73 E.34755
G2 X119.598 Y116.658 I9.068 J-2.202 E.03633
M73 P31 R13
G1 X112.768 Y109.828 E.36224
G1 X112.768 Y110.478 E.02441
G1 X120.45 Y118.161 E.40746
; WIPE_START
G1 F33600
G1 X119.036 Y116.747 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X113.362 Y111.643 Z.6 F42000
G1 X112.562 Y110.924 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X120.698 Y119.06 E.43152
G2 X124.533 Y123.242 I11.4 J-6.604 E.21447
G1 X125.692 Y124.053 E.05302
G1 X143.23 Y141.592 E.93016
G3 X143.232 Y142.245 I-12.953 J.369 E.02449
G1 X139.588 Y138.6 E.1933
G2 X137.185 Y135.72 I-6.549 J3.022 E.14228
G1 X135.594 Y134.606 E.07285
G1 X112.768 Y111.78 E1.21057
G1 X112.768 Y112.431 E.02441
G1 X133.423 Y133.086 E1.09544
G1 X131.252 Y131.566 E.09939
G1 X112.768 Y113.082 E.9803
G1 X112.768 Y113.733 E.02441
G1 X129.081 Y130.046 E.86517
G1 X126.945 Y128.561 E.09754
G1 X112.768 Y114.383 E.75191
G1 X112.768 Y115.034 E.02441
G1 X125.618 Y127.884 E.6815
G2 X124.674 Y127.592 I-2.597 J6.708 E.03707
G1 X112.768 Y115.685 E.63147
G1 X112.768 Y116.336 E.02441
G1 X123.877 Y127.445 E.58919
G2 X123.179 Y127.398 I-1.067 J10.655 E.02623
G1 X112.768 Y116.987 E.55218
G1 X112.768 Y117.638 E.02441
G1 X122.541 Y127.411 E.51831
G2 X121.951 Y127.471 I.136 J4.216 E.02226
G1 X112.768 Y118.288 E.48702
G1 X112.768 Y118.939 E.02441
G1 X121.401 Y127.573 E.45786
G2 X120.886 Y127.708 I.691 J3.661 E.01999
G1 X112.768 Y119.59 E.43055
G1 X112.768 Y120.241 E.02441
G1 X120.401 Y127.874 E.40483
G2 X119.944 Y128.068 I1.161 J3.366 E.01862
G1 X112.768 Y120.892 E.38061
G1 X112.768 Y121.543 E.02441
G1 X119.512 Y128.287 E.35767
G2 X119.103 Y128.529 I1.549 J3.079 E.01783
G1 X112.768 Y122.193 E.336
G1 X112.768 Y122.844 E.02441
M73 P32 R13
G1 X118.717 Y128.793 E.3155
G2 X118.351 Y129.079 I1.832 J2.722 E.0174
G1 X112.768 Y123.495 E.29613
G1 X112.768 Y124.146 E.02441
G1 X118.007 Y129.385 E.27785
G2 X117.682 Y129.711 I2.143 J2.452 E.01727
G1 X112.768 Y124.797 E.26065
G1 X112.768 Y125.447 E.02441
G1 X117.378 Y130.058 E.24453
G2 X117.095 Y130.426 I2.477 J2.201 E.01742
G1 X112.768 Y126.098 E.22952
G1 X112.768 Y126.749 E.02441
G1 X116.834 Y130.816 E.21567
G1 X116.594 Y131.226 E.01784
G1 X112.768 Y127.4 E.20293
G1 X112.768 Y128.051 E.02441
G1 X116.38 Y131.663 E.19157
G2 X116.19 Y132.124 I3.161 J1.568 E.01872
G1 X112.768 Y128.702 E.18152
G1 X112.768 Y129.352 E.02441
G1 X116.028 Y132.613 E.1729
G2 X115.895 Y133.13 I3.711 J1.231 E.02006
G1 X112.768 Y130.003 E.16584
G1 X112.768 Y130.654 E.02441
G1 X115.799 Y133.686 E.16077
G2 X115.745 Y134.282 I4.187 J.679 E.02249
G1 X112.768 Y131.305 E.15791
G1 X112.768 Y131.956 E.02441
G1 X115.732 Y134.921 E.15724
G1 X115.732 Y135.571 E.02441
G1 X112.768 Y132.607 E.15724
G1 X112.768 Y133.257 E.02441
G1 X115.732 Y136.222 E.15724
G1 X115.732 Y136.873 E.02441
G1 X112.768 Y133.908 E.15724
G1 X112.768 Y134.559 E.02441
G1 X115.732 Y137.524 E.15724
G1 X115.732 Y138.175 E.02441
G1 X112.768 Y135.21 E.15724
G1 X112.768 Y135.861 E.02441
G1 X115.732 Y138.826 E.15724
G1 X115.732 Y139.476 E.02441
G1 X112.768 Y136.512 E.15724
G1 X112.768 Y137.162 E.02441
G1 X115.732 Y140.127 E.15724
G1 X115.732 Y140.778 E.02441
G1 X112.768 Y137.813 E.15724
G1 X112.768 Y138.464 E.02441
G1 X115.732 Y141.429 E.15724
G1 X115.732 Y142.08 E.02441
G1 X112.768 Y139.115 E.15724
G1 X112.768 Y139.766 E.02441
G1 X115.732 Y142.731 E.15724
G1 X115.732 Y143.381 E.02441
G1 X112.768 Y140.417 E.15724
G1 X112.768 Y141.067 E.02441
G1 X115.732 Y144.032 E.15724
G1 X115.732 Y144.683 E.02441
G1 X112.768 Y141.718 E.15724
G1 X112.768 Y142.369 E.02441
G1 X115.732 Y145.334 E.15724
G1 X115.732 Y145.985 E.02441
G1 X112.768 Y143.02 E.15724
G1 X112.768 Y143.671 E.02441
G1 X115.732 Y146.636 E.15724
G1 X115.732 Y147.286 E.02441
G1 X112.768 Y144.321 E.15724
G1 X112.768 Y144.972 E.02441
G1 X115.751 Y147.956 E.15823
G2 X115.849 Y148.705 I5.264 J-.31 E.02836
G1 X112.768 Y145.623 E.16344
G1 X112.768 Y146.274 E.02441
G1 X116.379 Y149.885 E.19151
; WIPE_START
G1 F33600
G1 X114.964 Y148.471 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.122 Y145.821 Z.6 F42000
G1 X139.664 Y139.328 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X143.232 Y142.896 E.18924
G1 X143.232 Y143.547 E.02441
G1 X140.168 Y140.482 E.16254
G3 X140.253 Y141.218 I-8.746 J1.386 E.0278
G1 X143.232 Y144.197 E.15801
G1 X143.232 Y144.848 E.02441
G1 X140.268 Y141.883 E.15724
G1 X140.268 Y142.534 E.02441
G1 X143.232 Y145.499 E.15724
G1 X143.232 Y146.15 E.02441
G1 X140.268 Y143.185 E.15724
G1 X140.268 Y143.836 E.02441
G1 X143.232 Y146.801 E.15724
G1 X143.232 Y147.452 E.02441
G1 X140.268 Y144.487 E.15724
G1 X140.268 Y145.138 E.02441
G1 X143.232 Y148.102 E.15724
G1 X143.232 Y148.753 E.02441
G1 X140.268 Y145.788 E.15724
M73 P33 R13
G1 X140.268 Y146.439 E.02441
G1 X143.232 Y149.404 E.15724
G1 X143.232 Y150.055 E.02441
G1 X140.268 Y147.09 E.15724
G3 X140.257 Y147.731 I-8.935 J.18 E.02404
G1 X143.227 Y150.7 E.15748
G3 X143.196 Y151.32 I-5.948 J.012 E.02328
G1 X140.208 Y148.332 E.15843
G3 X140.117 Y148.892 I-3.985 J-.362 E.02128
G1 X143.131 Y151.906 E.15984
G3 X143.039 Y152.465 I-5.546 J-.628 E.02124
G1 X139.989 Y149.415 E.16173
G3 X139.83 Y149.907 I-3.393 J-.825 E.0194
G1 X142.92 Y152.996 E.16386
G3 X142.778 Y153.505 I-4.941 J-1.107 E.01982
G1 X139.644 Y150.371 E.16621
G3 X139.431 Y150.809 I-3.232 J-1.299 E.01828
G1 X142.614 Y153.992 E.16882
G3 X142.431 Y154.46 I-4.457 J-1.482 E.01883
G1 X139.195 Y151.224 E.17162
G3 X138.936 Y151.616 I-2.858 J-1.604 E.01763
G1 X142.229 Y154.909 E.17467
G3 X142.01 Y155.341 I-4.244 J-1.879 E.01817
G1 X138.656 Y151.987 E.17791
G3 X138.355 Y152.337 I-2.587 J-1.918 E.01732
G1 X141.775 Y155.757 E.18137
G3 X141.524 Y156.156 I-3.952 J-2.204 E.01771
G1 X138.037 Y152.67 E.18492
G1 X137.712 Y152.995 E.01726
G1 X141.258 Y156.541 E.18805
G1 X140.975 Y156.909 E.01741
G1 X137.386 Y153.32 E.19032
G1 X137.061 Y153.646 E.01726
G1 X140.676 Y157.261 E.19174
G3 X140.364 Y157.6 I-3.266 J-2.703 E.01728
G1 X136.736 Y153.971 E.19242
G1 X136.41 Y154.297 E.01726
G1 X140.037 Y157.923 E.19234
G3 X139.695 Y158.233 I-3.011 J-2.984 E.01729
G1 X136.085 Y154.622 E.19148
G1 X135.759 Y154.948 E.01726
G1 X139.34 Y158.528 E.1899
G3 X138.969 Y158.808 I-2.89 J-3.435 E.01743
G1 X135.434 Y155.273 E.18751
G1 X135.108 Y155.598 E.01726
G1 X138.584 Y159.074 E.18432
G3 X138.181 Y159.322 I-2.579 J-3.743 E.01775
G1 X134.783 Y155.924 E.1802
G1 X134.458 Y156.249 E.01726
G1 X137.762 Y159.553 E.17524
G3 X137.326 Y159.769 I-2.279 J-4.061 E.01823
G1 X134.132 Y156.575 E.16941
G1 X133.807 Y156.9 E.01726
G1 X136.873 Y159.966 E.16262
G3 X136.402 Y160.146 I-1.915 J-4.313 E.01892
G1 X133.481 Y157.225 E.15489
G1 X133.156 Y157.551 E.01726
G1 X135.911 Y160.306 E.1461
G3 X135.398 Y160.444 I-1.597 J-4.91 E.01992
G1 X132.722 Y157.768 E.14192
G1 X132.071 Y157.768 E.02441
G1 X134.861 Y160.557 E.14795
G3 X134.299 Y160.646 I-1.099 J-5.149 E.02136
G1 X131.42 Y157.768 E.15265
G1 X130.769 Y157.768 E.02441
G1 X133.707 Y160.705 E.15577
G3 X133.081 Y160.73 I-.562 J-6.225 E.0235
G1 X130.119 Y157.768 E.15709
G1 X129.468 Y157.768 E.02441
G1 X132.433 Y160.732 E.15724
G1 X131.782 Y160.732 E.02441
G1 X128.817 Y157.768 E.15724
G1 X128.166 Y157.768 E.02441
G1 X131.131 Y160.732 E.15724
G1 X130.48 Y160.732 E.02441
G1 X127.515 Y157.768 E.15724
G1 X126.864 Y157.768 E.02441
G1 X129.829 Y160.732 E.15724
G1 X129.179 Y160.732 E.02441
G1 X126.214 Y157.768 E.15724
G1 X125.563 Y157.768 E.02441
G1 X128.528 Y160.732 E.15724
G1 X127.877 Y160.732 E.02441
G1 X124.912 Y157.768 E.15724
G1 X124.261 Y157.768 E.02441
G1 X127.226 Y160.732 E.15724
G1 X126.575 Y160.732 E.02441
G1 X123.61 Y157.768 E.15724
G1 X123.061 Y157.768 E.02061
G1 X117.846 Y152.553 E.27655
G3 X116.488 Y150.645 I5.263 J-5.185 E.08822
G1 X112.768 Y146.925 E.19729
G1 X112.768 Y147.576 E.02441
G1 X125.924 Y160.732 E.69776
G1 X125.274 Y160.732 E.02441
G1 X112.768 Y148.226 E.66324
G1 X112.768 Y148.877 E.02441
G1 X124.623 Y160.732 E.62873
G1 X123.972 Y160.732 E.02441
G1 X112.768 Y149.528 E.59421
G1 X112.768 Y150.179 E.02441
G1 X123.321 Y160.732 E.5597
G3 X122.661 Y160.723 I-.153 J-12.648 E.02476
G1 X112.777 Y150.839 E.5242
G2 X112.821 Y151.534 I6.675 J-.077 E.02613
G1 X121.966 Y160.679 E.48498
G3 X121.207 Y160.571 I1.827 J-15.516 E.02876
G1 X112.929 Y152.293 E.43897
G2 X113.111 Y153.126 I8.149 J-1.341 E.03196
G1 X120.374 Y160.389 E.3852
G3 X119.417 Y160.082 I3.832 J-13.607 E.03772
G1 X113.418 Y154.083 E.31814
G2 X113.948 Y155.264 I7.227 J-2.534 E.04859
G1 X118.236 Y159.553 E.22746
G3 X115.79 Y157.757 I4.662 J-8.916 E.11424
G1 X114.308 Y156.275 E.07859
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X115.722 Y157.69 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/45
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S196.35
M106 P2 S178
; open powerlost recovery
M1003 S1
M204 S6000
G17
M73 P34 R13
G3 Z.6 I.103 J1.213 P1  F42000
G1 X123.305 Y157.044 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.337 Y152.077 E.23305
G3 X116.416 Y147.44 I4.675 J-4.652 E.17078
G1 X116.416 Y134.649 E.42428
G3 X122.782 Y128.082 I6.59 J.019 E.3353
G3 X126.767 Y129.261 I.225 J6.565 E.14029
G1 X136.785 Y136.275 E.40566
G3 X139.584 Y141.652 I-3.789 J5.389 E.20894
G1 X139.584 Y147.44 E.192
G3 X137.663 Y152.077 I-6.602 J-.019 E.17077
G1 X132.656 Y157.084 E.23489
G1 X123.349 Y157.084 E.30874
G1 X123.482 Y156.667 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5700
G1 X118.619 Y151.804 E.21129
G3 X116.809 Y147.433 I4.392 J-4.38 E.14917
G1 X116.809 Y134.656 E.39258
G3 X122.803 Y128.473 I6.198 J.012 E.29254
G3 X126.548 Y129.586 I.202 J6.178 E.12215
G1 X136.554 Y136.592 E.37534
G3 X139.191 Y141.659 I-3.56 J5.073 E.18239
G1 X139.191 Y147.433 E.17742
G3 X137.381 Y151.804 I-6.209 J-.011 E.14916
G1 X132.494 Y156.691 E.21237
G1 X123.531 Y156.691 E.27538
M204 S6000
; WIPE_START
G1 F33600
G1 X122.114 Y155.281 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.245 Y147.952 Z.8 F42000
G1 X133.738 Y115.313 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X133.586 Y115.01 I.282 J-.332 E.01157
G1 X133.584 Y112.85 E.07163
G3 X133.721 Y112.518 I.45 J-.008 E.01226
G1 X135.545 Y110.695 E.08554
G2 X136.584 Y108.187 I-2.539 J-2.521 E.09238
G2 X136.519 Y105.976 I-17.313 J-.598 E.07341
G2 X128.51 Y98.916 I-8.024 J1.03 E.38677
G2 X125.512 Y99.353 I-.419 J7.63 E.10115
G2 X122.5 Y101.676 I2.486 J6.339 E.12787
G2 X120.882 Y105.028 I8.102 J5.978 E.12421
G2 X119.655 Y110.933 I50.355 J13.538 E.20014
G2 X124.933 Y122.687 I12.576 J1.416 E.44845
G1 X139.255 Y132.716 E.57997
G3 X143.916 Y141.67 I-6.273 J8.956 E.34806
G1 X143.916 Y150.492 E.29265
G3 X132.992 Y161.416 I-10.926 J-.002 E.5692
G1 X123.008 Y161.416 E.3312
G3 X112.084 Y150.492 I-.005 J-10.919 E.5693
G1 X112.084 Y104.186 E1.53608
G3 X115.286 Y96.453 I10.931 J-.002 E.28491
G1 X117.156 Y94.584 E.0877
G1 X138.844 Y94.584 E.71943
G1 X140.368 Y96.108 E.0715
G3 X143.916 Y104.186 I-7.48 J8.104 E.30109
G1 X143.916 Y111.987 E.25879
G3 X140.487 Y115.416 I-3.423 J.006 E.17877
G1 X134.024 Y115.416 E.21438
G3 X133.787 Y115.349 I-.004 J-.435 E.00832
G1 X133.389 Y115.528 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5700
G1 X133.392 Y115.521 E.00021
G3 X133.194 Y115.027 I.741 J-.584 E.0166
G1 X133.192 Y112.836 E.06732
G3 X133.434 Y112.251 I.94 J.047 E.01984
G1 X135.26 Y110.425 E.07938
G2 X136.191 Y108.177 I-2.261 J-2.253 E.0767
G2 X136.13 Y106.025 I-16.896 J-.59 E.06618
G2 X128.503 Y99.309 I-7.634 J.98 E.34106
G2 X125.655 Y99.718 I-.411 J7.25 E.08901
G2 X122.812 Y101.913 I2.338 J5.967 E.11185
G2 X121.257 Y105.14 I7.795 J5.744 E.11072
G2 X120.045 Y110.979 I50.04 J13.439 E.18333
G2 X125.161 Y122.368 I12.185 J1.37 E.40252
G1 X139.484 Y132.397 E.53728
G3 X143.954 Y138.859 I-6.485 J9.263 E.24656
G1 X144.082 Y139.411 E.01741
G1 X144.082 Y139.411 F42000
G1 F5700
G1 X144.167 Y139.884 E.01479
G1 F4800
G1 X144.181 Y139.968 E.00259
G1 F5700
G1 X144.252 Y140.531 E.01744
G1 X144.249 Y140.531 F42000
G1 F5700
G3 X144.309 Y141.665 I-12.667 J1.239 E.0349
G1 X144.309 Y150.497 E.2714
G3 X144.293 Y151.086 I-11.33 J.001 E.01809
G1 X144.248 Y151.67 E.01801
G1 F4800
G1 X144.172 Y152.252 E.01804
G1 F5700
G1 X144.066 Y152.827 E.01797
G1 X144.064 Y152.827 F42000
G1 F5700
G3 X142.136 Y157.16 I-11.199 J-2.389 E.1468
G1 X142.138 Y157.162 F42000
G1 F5700
G1 X141.834 Y157.557 E.01532
G1 F4800
G1 X141.781 Y157.625 E.00266
G1 F5700
G1 X141.4 Y158.071 E.01803
G1 X141.397 Y158.069 F42000
G1 F5700
G3 X140.994 Y158.494 I-9.42 J-8.54 E.018
G1 X140.996 Y158.496 F42000
G1 F5700
G1 X140.571 Y158.9 E.01801
G1 F4800
G1 X140.125 Y159.281 E.01803
G1 F5700
G1 X139.662 Y159.638 E.01798
G1 X139.662 Y159.638 F42000
G1 F5700
G3 X135.897 Y161.43 I-6.658 J-9.135 E.12885
G1 X135.897 Y161.431 F42000
G1 F5700
G1 X135.413 Y161.547 E.0153
G1 F4800
G1 X135.329 Y161.566 E.00265
G1 F5700
G1 X134.751 Y161.672 E.01805
G1 X134.751 Y161.669 F42000
G1 F5700
G3 X134.17 Y161.744 I-1.901 J-12.372 E.018
G1 X134.17 Y161.748 F42000
G1 F5700
G1 X133.673 Y161.787 E.01533
G1 F4800
G1 X133.586 Y161.793 E.00266
G1 F5700
G1 X132.997 Y161.809 E.0181
G1 X123.003 Y161.809 E.3071
G3 X122.414 Y161.793 I-.001 J-11.329 E.01809
G1 X121.83 Y161.748 E.01801
G1 F4800
G1 X121.248 Y161.672 E.01804
G1 F5700
G1 X120.673 Y161.566 E.01797
G3 X117.834 Y160.559 I2.329 J-11.064 E.09283
G1 X117.834 Y160.559 F42000
G1 F5700
G1 X117.396 Y160.321 E.0153
G1 F4800
G1 X117.321 Y160.279 E.00265
G1 F5700
G1 X116.821 Y159.971 E.01805
G1 X116.823 Y159.968 F42000
G1 F5700
G3 X116.34 Y159.635 I6.904 J-10.515 E.01801
G1 X116.338 Y159.638 F42000
G1 F5700
G1 X115.943 Y159.334 E.01532
G1 F4800
G1 X115.875 Y159.281 E.00266
G1 F5700
G1 X115.429 Y158.9 E.01803
G1 F4800
G1 X115.004 Y158.496 E.01801
G1 F5668.229
G1 X114.944 Y158.433 E.00266
G1 F5700
G1 X114.6 Y158.071 E.01534
G1 X114.6 Y158.071 F42000
G1 F5700
G1 X114.219 Y157.626 E.01801
G1 F4800
G1 X113.861 Y157.161 E.01804
G1 F5700
G1 X113.529 Y156.679 E.01797
G1 X113.531 Y156.678 F42000
G1 F5700
G3 X112.43 Y154.512 I9.764 J-6.328 E.07481
G1 X112.428 Y154.513 F42000
G1 F5700
G1 X112.262 Y154.044 E.01528
G1 F4800
G1 X112.235 Y153.962 E.00265
G1 F5700
G1 X112.069 Y153.398 E.01806
G1 X112.073 Y153.397 F42000
G1 F5700
G3 X111.937 Y152.827 I12.228 J-3.204 E.01801
G1 X111.934 Y152.827 F42000
G1 F5700
G1 X111.843 Y152.337 E.01531
G1 F4800
G1 X111.828 Y152.252 E.00266
G1 F5700
G1 X111.752 Y151.67 E.01804
G1 X111.756 Y151.67 F42000
G1 F5700
G3 X111.691 Y150.497 I12.66 J-1.281 E.03609
G1 X111.691 Y104.58 E1.4109
G1 X111.691 Y104.58 F42000
G1 F5700
G1 X111.691 Y104.18 E.01229
G1 F4800
G1 X111.707 Y103.591 E.0181
G1 F5700
G1 X111.752 Y103.008 E.01799
G1 X111.757 Y103.008 F42000
G1 F5700
G1 X111.828 Y102.427 E.01801
G1 F4800
G1 X111.934 Y101.849 E.01805
G1 F5700
G1 X112.069 Y101.28 E.01796
G3 X113.223 Y98.498 I10.928 J2.899 E.09283
G1 X113.222 Y98.497 F42000
G1 F5700
G1 X113.482 Y98.073 E.0153
G1 F4800
G1 X113.528 Y98 E.00266
G1 F5700
G1 X113.862 Y97.516 E.01805
G1 X113.862 Y97.516 F42000
G1 F5700
G3 X114.6 Y96.606 I9.146 J6.667 E.03602
G1 X114.6 Y96.606 F42000
G1 F5700
G1 X115.006 Y96.179 E.01809
G1 F4800
G1 X116.994 Y94.191 E.08638
G1 X139.006 Y94.191 E.6764
G1 X139.826 Y95.011 E.03561
G1 F5700
G1 X140.109 Y95.294 E.01229
G1 X140.109 Y95.294 F42000
G1 F5700
G1 X140.645 Y95.831 E.02332
G3 X142.468 Y98 I-8.297 J8.821 E.08727
G1 X142.471 Y97.999 F42000
G1 F5700
G1 X142.778 Y98.497 E.01801
G1 F4800
G1 X143.06 Y99.013 E.01807
G1 F5700
G1 X143.35 Y99.622 E.02073
G1 X143.347 Y99.624 F42000
G1 F5700
G3 X143.763 Y100.719 I-11.076 J4.834 E.03601
G1 X143.766 Y100.718 F42000
G1 F5700
G1 X143.907 Y101.195 E.0153
G1 F4800
G1 X143.93 Y101.278 E.00265
G1 F5700
G1 X144.066 Y101.85 E.01806
G1 X144.064 Y101.851 F42000
G1 F5700
G3 X144.309 Y104.18 I-11.531 J2.389 E.0721
G1 X144.309 Y111.995 E.24014
G3 X143.611 Y114.194 I-3.809 J.002 E.072
G1 X143.612 Y114.195 F42000
G1 F5700
G1 X143.445 Y114.413 E.00845
G1 F4800
G1 X143.414 Y114.452 E.00153
G1 F5700
G1 X143.193 Y114.693 E.01005
G3 X142.42 Y115.289 I-2.69 J-2.691 E.03006
G1 X142.42 Y115.289 F42000
G1 F5700
G1 X142.085 Y115.462 E.01161
G1 F4800
G1 X141.779 Y115.587 E.01014
G1 F5700
G1 X141.468 Y115.683 E.01002
G1 X141.468 Y115.683 F42000
G1 F5700
G3 X140.496 Y115.809 I-.97 J-3.689 E.0302
G1 X134.409 Y115.809 E.18704
G1 X134.009 Y115.809 E.01229
G1 F4800
G1 X133.867 Y115.797 E.00438
G1 F4883.179
G1 X133.85 Y115.794 E.00053
G1 F4800
G1 X133.747 Y115.766 E.00326
G1 F5700
G1 X133.605 Y115.705 E.00475
G1 X133.606 Y115.703 F42000
G1 F5700
G1 X133.492 Y115.628 E.00422
G1 F4800
G1 X133.479 Y115.617 E.0005
G1 F5461.645
G1 X133.432 Y115.57 E.00205
M204 S6000
; WIPE_START
G1 F33600
G1 X133.392 Y115.521 E-.02394
G1 X133.295 Y115.394 E-.06089
G1 X133.206 Y115.149 E-.09881
G1 X133.194 Y115.027 E-.04681
G1 X133.192 Y113.633 E-.52955
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z0.8 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z0.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623


G1 Z1.2 F42000
G1 X143.546 Y113.132
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421741
G1 F15000
G1 X141.975 Y114.702 E.06857
G3 X141.127 Y115.015 I-1.863 J-3.75 E.02796
G1 X143.515 Y112.627 E.10423
G2 X143.581 Y112.025 I-3.188 J-.656 E.01872
G1 X140.525 Y115.081 E.13341
G3 X139.988 Y115.083 I-.291 J-6.265 E.0166
G1 X143.583 Y111.488 E.15697
G1 X143.583 Y110.952 E.01654
G1 X139.452 Y115.083 E.18035
G1 X138.916 Y115.083 E.01654
G1 X143.583 Y110.416 E.20374
G1 X143.583 Y109.88 E.01654
G1 X138.38 Y115.083 E.22713
G1 X137.845 Y115.083 E.01654
G1 X143.583 Y109.345 E.25052
G1 X143.583 Y108.809 E.01654
G1 X137.309 Y115.083 E.2739
G1 X136.773 Y115.083 E.01654
G1 X143.583 Y108.273 E.29729
M73 P35 R13
G1 X143.583 Y107.737 E.01654
G1 X136.237 Y115.083 E.32068
G1 X135.702 Y115.083 E.01654
G1 X143.583 Y107.202 E.34407
G1 X143.583 Y106.666 E.01654
G1 X135.166 Y115.083 E.36746
G1 X134.63 Y115.083 E.01654
G1 X143.583 Y106.13 E.39084
G1 X143.583 Y105.595 E.01654
G1 X134.095 Y115.083 E.41423
G3 X133.928 Y115.023 I-.021 J-.205 E.00566
G3 X133.919 Y114.723 I.786 J-.174 E.00932
G1 X143.583 Y105.059 E.42191
G1 X143.583 Y104.523 E.01654
G1 X133.918 Y114.188 E.42193
G1 X133.918 Y113.653 E.01652
G1 X143.578 Y103.992 E.42173
G2 X143.557 Y103.478 I-4.969 J-.053 E.0159
G1 X133.917 Y113.118 E.42083
G1 X133.917 Y112.886 E.00715
G3 X133.974 Y112.736 I.196 J-.011 E.0051
G1 X135.786 Y110.925 E.07909
G2 X136.416 Y110.083 I-3.023 J-2.918 E.03252
G1 X143.513 Y102.986 E.30986
G2 X143.45 Y102.513 I-4.586 J.371 E.01473
G1 X136.78 Y109.183 E.29118
G2 X136.9 Y108.527 I-4.604 J-1.181 E.02059
G1 X143.367 Y102.06 E.28232
G2 X143.266 Y101.626 I-3.913 J.687 E.01377
G1 X136.917 Y107.975 E.27716
G1 X136.917 Y107.439 E.01654
G1 X143.153 Y101.203 E.27225
G2 X143.025 Y100.796 I-4.21 J1.105 E.01319
G1 X136.914 Y106.906 E.26675
G2 X136.893 Y106.391 I-4.051 J-.092 E.01591
G1 X142.885 Y100.4 E.26156
G1 X142.729 Y100.02 E.01268
G1 X136.845 Y105.904 E.25688
G1 X136.771 Y105.443 E.01443
G1 X142.562 Y99.652 E.25281
G2 X142.384 Y99.293 I-3.313 J1.416 E.01235
G1 X136.674 Y105.004 E.24929
G2 X136.558 Y104.583 I-3.357 J.697 E.01346
G1 X142.196 Y98.946 E.24611
G2 X141.996 Y98.61 I-3.106 J1.627 E.01207
G1 X136.426 Y104.18 E.24314
G2 X136.279 Y103.791 I-3.384 J1.059 E.01283
G1 X141.786 Y98.284 E.24043
G1 X141.568 Y97.967 E.01189
G1 X136.116 Y103.419 E.238
G1 X135.936 Y103.063 E.01231
G1 X141.336 Y97.663 E.23572
G2 X141.096 Y97.367 I-2.97 J2.163 E.01176
G1 X135.743 Y102.72 E.23369
G2 X135.538 Y102.389 I-2.7 J1.443 E.01202
G1 X140.848 Y97.079 E.23181
G1 X140.584 Y96.808 E.0117
G1 X135.322 Y102.07 E.22972
G2 X135.086 Y101.769 I-2.202 J1.485 E.01179
G1 X140.32 Y96.536 E.22847
G2 X140.055 Y96.265 I-9.789 J9.329 E.01169
G1 X134.845 Y101.475 E.22743
G2 X134.591 Y101.193 I-2.367 J1.878 E.01172
G1 X139.787 Y95.998 E.22682
G1 X139.519 Y95.73 E.01169
G1 X134.323 Y100.925 E.22682
G2 X134.042 Y100.671 I-2.141 J2.078 E.01172
G1 X139.251 Y95.462 E.22739
G1 X138.983 Y95.194 E.01169
G1 X133.751 Y100.426 E.2284
G1 X133.449 Y100.192 E.01179
G1 X138.715 Y94.926 E.22989
G1 X138.706 Y94.917 E.00041
G1 X138.189 Y94.917 E.01596
G1 X133.13 Y99.975 E.22083
G2 X132.801 Y99.769 I-1.782 J2.487 E.01201
G1 X137.653 Y94.917 E.21184
G1 X137.117 Y94.917 E.01654
G1 X132.459 Y99.575 E.20335
G1 X132.103 Y99.395 E.01231
G1 X136.582 Y94.917 E.1955
G1 X136.046 Y94.917 E.01654
G1 X131.732 Y99.231 E.18833
G2 X131.344 Y99.083 I-1.457 J3.227 E.01281
G1 X135.51 Y94.917 E.18186
G1 X134.974 Y94.917 E.01654
G1 X130.941 Y98.95 E.17608
G2 X130.524 Y98.831 I-1.207 J3.444 E.01339
G1 X134.439 Y94.917 E.17089
G1 X133.903 Y94.917 E.01654
G1 X130.086 Y98.734 E.16663
G1 X129.624 Y98.66 E.01443
G1 X133.367 Y94.917 E.1634
G1 X132.832 Y94.917 E.01654
G1 X129.139 Y98.61 E.16121
G2 X128.617 Y98.595 I-.343 J3.015 E.01613
G1 X132.296 Y94.917 E.16059
G1 X131.76 Y94.917 E.01654
G1 X128.086 Y98.591 E.16038
G2 X127.542 Y98.599 I-.228 J2.901 E.01682
G1 X131.224 Y94.917 E.16073
G1 X130.689 Y94.917 E.01654
G1 X126.957 Y98.648 E.16289
G2 X126.307 Y98.763 I1.333 J9.462 E.02039
G1 X130.153 Y94.917 E.1679
G1 X129.617 Y94.917 E.01654
G1 X125.541 Y98.988 E.17784
G2 X124.583 Y99.415 I2.769 J7.493 E.03238
G1 X129.081 Y94.917 E.19636
G1 X128.546 Y94.917 E.01654
G1 X112.417 Y111.046 E.70411
G1 X112.417 Y111.581 E.01654
G1 X121.646 Y102.352 E.40292
G2 X121.098 Y103.436 I8.622 J5.043 E.03753
G1 X112.417 Y112.117 E.37898
G1 X112.417 Y112.653 E.01654
G1 X120.776 Y104.293 E.36493
G2 X120.522 Y105.083 I5.928 J2.341 E.02562
G1 X112.417 Y113.189 E.35386
G1 X112.417 Y113.724 E.01654
G1 X120.33 Y105.811 E.34547
G2 X120.161 Y106.515 I7.928 J2.274 E.02238
G1 X112.417 Y114.26 E.33809
G1 X112.417 Y114.796 E.01654
G1 X120.013 Y107.2 E.3316
G1 X119.864 Y107.885 E.02163
G1 X112.417 Y115.331 E.3251
G1 X112.417 Y115.867 E.01654
G1 X119.739 Y108.545 E.31966
G1 X119.617 Y109.203 E.02067
G1 X112.417 Y116.403 E.31431
G1 X112.417 Y116.939 E.01654
G1 X119.494 Y109.862 E.30895
G2 X119.374 Y110.517 I5.188 J1.288 E.02059
G1 X112.417 Y117.474 E.30372
G1 X112.417 Y118.01 E.01654
G1 X119.299 Y111.128 E.30046
G1 X119.261 Y111.701 E.01775
G1 X112.417 Y118.546 E.29881
G1 X112.417 Y119.082 E.01654
G1 X119.243 Y112.255 E.298
G2 X119.248 Y112.786 I6.023 J.207 E.01639
G1 X112.417 Y119.617 E.29823
G1 X112.417 Y120.153 E.01654
G1 X119.274 Y113.296 E.29936
G1 X119.324 Y113.781 E.01506
G1 X112.417 Y120.689 E.30156
G1 X112.417 Y121.225 E.01654
G1 X119.377 Y114.265 E.30383
G1 X119.456 Y114.721 E.01431
G1 X112.417 Y121.76 E.30728
G1 X112.417 Y122.296 E.01654
G1 X119.546 Y115.167 E.31124
G2 X119.649 Y115.6 I4.379 J-.805 E.01375
G1 X112.417 Y122.832 E.3157
G1 X112.417 Y123.367 E.01654
G1 X119.763 Y116.021 E.32071
G2 X119.893 Y116.427 I3.865 J-1.017 E.01315
G1 X112.417 Y123.903 E.32639
G1 X112.417 Y124.439 E.01654
G1 X120.029 Y116.827 E.3323
G1 X120.185 Y117.207 E.01267
G1 X112.417 Y124.975 E.33912
G1 X112.417 Y125.51 E.01654
G1 X120.341 Y117.586 E.34594
G2 X120.509 Y117.954 I2.178 J-.771 E.0125
G1 X112.417 Y126.046 E.35326
G1 X112.417 Y126.582 E.01654
G1 X120.692 Y118.307 E.36124
G1 X120.874 Y118.66 E.01227
G1 X112.417 Y127.118 E.36922
G1 X112.417 Y127.653 E.01654
G1 X121.07 Y119 E.37778
G1 X121.278 Y119.328 E.01199
G1 X112.417 Y128.189 E.38682
G1 X112.417 Y128.725 E.01654
G1 X121.485 Y119.657 E.39586
G2 X121.71 Y119.967 I1.975 J-1.203 E.01185
G1 X112.417 Y129.261 E.40572
G1 X112.417 Y129.796 E.01654
G1 X121.941 Y120.273 E.41576
G2 X122.172 Y120.577 I2.472 J-1.635 E.01181
G1 X112.417 Y130.332 E.42585
G1 X112.417 Y130.868 E.01654
G1 X122.419 Y120.865 E.43666
G2 X122.673 Y121.148 I3.198 J-2.615 E.01172
G1 X112.417 Y131.404 E.44772
G1 X112.417 Y131.939 E.01654
G1 X122.932 Y121.424 E.45906
G2 X123.203 Y121.688 I2.657 J-2.447 E.0117
G1 X112.417 Y132.475 E.47089
G1 X112.417 Y133.011 E.01654
G1 X123.478 Y121.949 E.4829
G1 X123.765 Y122.199 E.01172
G1 X112.417 Y133.546 E.4954
G1 X112.417 Y134.082 E.01654
G1 X124.06 Y122.439 E.50828
G1 X124.363 Y122.671 E.0118
G1 X112.417 Y134.618 E.52154
G1 X112.417 Y135.154 E.01654
G1 X124.667 Y122.903 E.53479
G2 X124.98 Y123.127 I2.834 J-3.637 E.01186
G1 X112.417 Y135.689 E.54843
G1 X112.417 Y136.225 E.01654
G1 X116.604 Y132.038 E.18278
G2 X116.326 Y132.852 I7.328 J2.957 E.02655
G1 X112.417 Y136.761 E.17065
G1 X112.417 Y137.297 E.01654
G1 X116.178 Y133.535 E.16422
G2 X116.102 Y134.147 I4.238 J.838 E.01905
G1 X112.417 Y137.832 E.16089
G1 X112.417 Y138.368 E.01654
G1 X116.083 Y134.702 E.16005
G1 X116.083 Y135.237 E.01654
G1 X112.417 Y138.904 E.16005
G1 X112.417 Y139.44 E.01654
G1 X116.083 Y135.773 E.16005
G1 X116.083 Y136.309 E.01654
G1 X112.417 Y139.975 E.16005
G1 X112.417 Y140.511 E.01654
G1 X116.083 Y136.845 E.16005
G1 X116.083 Y137.38 E.01654
G1 X112.417 Y141.047 E.16005
G1 X112.417 Y141.582 E.01654
G1 X116.083 Y137.916 E.16005
G1 X116.083 Y138.452 E.01654
G1 X112.417 Y142.118 E.16005
G1 X112.417 Y142.654 E.01654
G1 X116.083 Y138.988 E.16005
G1 X116.083 Y139.523 E.01654
G1 X112.417 Y143.19 E.16005
G1 X112.417 Y143.725 E.01654
G1 X116.083 Y140.059 E.16005
G1 X116.083 Y140.595 E.01654
G1 X112.417 Y144.261 E.16005
G1 X112.417 Y144.797 E.01654
G1 X116.083 Y141.131 E.16005
G1 X116.083 Y141.666 E.01654
G1 X112.417 Y145.333 E.16005
G1 X112.417 Y145.868 E.01654
G1 X116.083 Y142.202 E.16005
G1 X116.083 Y142.738 E.01654
G1 X112.417 Y146.404 E.16005
G1 X112.417 Y146.94 E.01654
G1 X116.083 Y143.273 E.16005
G1 X116.083 Y143.809 E.01654
G1 X112.417 Y147.476 E.16005
G1 X112.417 Y148.011 E.01654
G1 X116.083 Y144.345 E.16005
G1 X116.083 Y144.881 E.01654
G1 X112.417 Y148.547 E.16005
G1 X112.417 Y149.083 E.01654
G1 X116.083 Y145.416 E.16005
G1 X116.083 Y145.952 E.01654
G1 X112.417 Y149.618 E.16005
G1 X112.417 Y150.154 E.01654
G1 X116.083 Y146.488 E.16005
G1 X116.083 Y147.024 E.01654
G1 X112.422 Y150.685 E.15983
G2 X112.443 Y151.199 I4.968 J.053 E.0159
G1 X116.087 Y147.555 E.15908
G2 X116.115 Y148.063 I3.515 J.06 E.01571
G1 X112.487 Y151.691 E.15839
G1 X112.551 Y152.163 E.0147
G1 X116.175 Y148.539 E.15823
G2 X116.263 Y148.987 I3.136 J-.378 E.01412
M73 P36 R13
G1 X112.633 Y152.617 E.15848
G2 X112.733 Y153.053 I4.392 J-.783 E.0138
G1 X116.374 Y149.412 E.15894
G1 X116.507 Y149.814 E.01308
G1 X112.848 Y153.473 E.15974
G2 X112.974 Y153.883 I4.063 J-1.023 E.01324
G1 X116.663 Y150.194 E.16102
G2 X116.837 Y150.556 I2.343 J-.909 E.0124
G1 X113.115 Y154.277 E.16248
G1 X113.271 Y154.657 E.01268
G1 X117.024 Y150.905 E.16382
G2 X117.228 Y151.236 I2.499 J-1.314 E.01203
G1 X113.439 Y155.025 E.16541
G2 X113.614 Y155.386 I3.304 J-1.381 E.01238
G1 X117.447 Y151.553 E.16732
G2 X117.685 Y151.851 I2.171 J-1.491 E.01178
G1 X113.804 Y155.732 E.16944
G2 X114.004 Y156.067 I3.328 J-1.765 E.01206
G1 X117.936 Y152.135 E.17166
G2 X118.198 Y152.409 I3.914 J-3.479 E.0117
G1 X114.213 Y156.394 E.17396
G2 X114.433 Y156.71 I3.352 J-2.1 E.01188
G1 X118.466 Y152.677 E.17605
G1 X118.734 Y152.945 E.01169
G1 X114.665 Y157.014 E.17764
G2 X114.904 Y157.31 I2.727 J-1.953 E.01177
G1 X119.002 Y153.213 E.17889
G1 X119.27 Y153.48 E.01169
G1 X115.152 Y157.598 E.17978
G1 X115.412 Y157.873 E.0117
G1 X119.537 Y153.748 E.18008
G1 X119.805 Y154.016 E.01169
G1 X115.683 Y158.138 E.17996
G2 X115.959 Y158.398 I2.193 J-2.05 E.01171
G1 X120.073 Y154.284 E.17961
G1 X120.341 Y154.552 E.01169
G1 X116.249 Y158.644 E.17864
G2 X116.546 Y158.883 I2.646 J-2.982 E.01177
G1 X120.609 Y154.82 E.17738
G1 X120.877 Y155.088 E.01169
G1 X116.853 Y159.112 E.17567
G1 X117.17 Y159.33 E.01189
G1 X121.145 Y155.355 E.17352
G1 X121.413 Y155.623 E.01169
G1 X117.5 Y159.536 E.17079
G2 X117.836 Y159.735 I2.148 J-3.237 E.01207
G1 X121.68 Y155.891 E.16781
G1 X121.948 Y156.159 E.01169
G1 X118.184 Y159.923 E.16431
G1 X118.546 Y160.097 E.01239
G1 X122.216 Y156.427 E.16021
G1 X122.484 Y156.695 E.01169
G1 X118.92 Y160.259 E.1556
G2 X119.301 Y160.413 I1.577 J-3.345 E.01271
G1 X122.752 Y156.963 E.15065
G1 X123.02 Y157.231 E.01169
G1 X119.698 Y160.552 E.14502
G2 X120.109 Y160.677 I1.403 J-3.901 E.01327
G1 X123.369 Y157.417 E.14231
G1 X123.905 Y157.417 E.01654
G1 X120.534 Y160.788 E.14716
G2 X120.973 Y160.884 I1.183 J-4.335 E.01389
G1 X124.441 Y157.417 E.15137
G1 X124.976 Y157.417 E.01654
G1 X121.431 Y160.962 E.15476
G1 X121.903 Y161.026 E.0147
G1 X125.512 Y157.417 E.15755
G1 X126.048 Y157.417 E.01654
G1 X122.4 Y161.065 E.15924
G2 X122.92 Y161.081 I.416 J-4.997 E.01605
G1 X126.584 Y157.417 E.15995
G1 X127.119 Y157.417 E.01654
G1 X123.453 Y161.083 E.16006
G1 X123.989 Y161.083 E.01654
G1 X127.655 Y157.417 E.16006
G1 X128.191 Y157.417 E.01654
G1 X124.524 Y161.083 E.16006
G1 X125.06 Y161.083 E.01654
G1 X128.726 Y157.417 E.16006
G1 X129.262 Y157.417 E.01654
G1 X125.596 Y161.083 E.16006
G1 X126.132 Y161.083 E.01654
G1 X129.798 Y157.417 E.16006
G1 X130.334 Y157.417 E.01654
G1 X126.667 Y161.083 E.16006
G1 X127.203 Y161.083 E.01654
G1 X130.869 Y157.417 E.16006
G1 X131.405 Y157.417 E.01654
G1 X127.739 Y161.083 E.16006
G1 X128.275 Y161.083 E.01654
G1 X131.941 Y157.417 E.16006
G1 X132.477 Y157.417 E.01654
G1 X128.81 Y161.083 E.16006
G1 X129.346 Y161.083 E.01654
G1 X143.583 Y146.846 E.62153
G1 X143.583 Y147.382 E.01654
G1 X129.882 Y161.083 E.59814
G1 X130.417 Y161.083 E.01654
G1 X143.583 Y147.917 E.57475
G1 X143.583 Y148.453 E.01654
M73 P36 R12
G1 X130.953 Y161.083 E.55137
G1 X131.489 Y161.083 E.01654
G1 X143.583 Y148.989 E.52798
G1 X143.583 Y149.525 E.01654
G1 X132.025 Y161.083 E.50459
G1 X132.56 Y161.083 E.01654
G1 X143.583 Y150.06 E.4812
G3 X143.58 Y150.599 I-10.384 J.214 E.01663
G1 X133.1 Y161.08 E.45753
G2 X133.654 Y161.061 I.077 J-5.904 E.01714
G1 X143.56 Y151.155 E.43245
G3 X143.506 Y151.745 I-5.217 J-.186 E.01831
G1 X134.244 Y161.007 E.40431
G2 X134.876 Y160.91 I-.535 J-5.636 E.01974
G1 X143.413 Y152.374 E.37266
G3 X143.266 Y153.056 I-6.873 J-1.117 E.02154
G1 X135.555 Y160.767 E.33663
G2 X136.307 Y160.551 I-3.328 J-12.99 E.02415
G1 X143.051 Y153.807 E.29439
G3 X142.721 Y154.673 I-7.938 J-2.531 E.02862
G1 X137.173 Y160.221 E.24217
G2 X138.234 Y159.695 I-4.266 J-9.952 E.03656
G1 X142.195 Y155.734 E.17292
G3 X140.86 Y157.586 I-9.549 J-5.477 E.0706
G3 X139.148 Y159.317 I-34.223 J-32.138 E.07517
G1 X138.321 Y151.573 F42000
G1 F15000
G1 X143.583 Y146.31 E.22973
G1 X143.583 Y145.775 E.01654
G1 X139.461 Y149.897 E.17996
G2 X139.7 Y149.122 I-7.708 J-2.802 E.02504
G1 X143.583 Y145.239 E.16953
G1 X143.583 Y144.703 E.01654
G1 X139.842 Y148.445 E.16333
G2 X139.902 Y147.848 I-13.004 J-1.622 E.0185
G1 X143.583 Y144.167 E.16069
G1 X143.583 Y143.632 E.01654
G1 X139.917 Y147.298 E.16005
G1 X139.917 Y146.762 E.01654
G1 X143.583 Y143.096 E.16005
G1 X143.583 Y142.56 E.01654
G1 X139.917 Y146.226 E.16005
G1 X139.917 Y145.691 E.01654
G1 X143.583 Y142.024 E.16005
G2 X143.579 Y141.493 I-10.594 J-.175 E.0164
G1 X139.917 Y145.155 E.15986
G1 X139.917 Y144.619 E.01654
G1 X143.558 Y140.978 E.15896
G2 X143.514 Y140.486 I-4.475 J.149 E.01526
G1 X139.917 Y144.084 E.15705
G1 X139.917 Y143.548 E.01654
G1 X143.452 Y140.012 E.15434
G2 X143.371 Y139.558 I-4.93 J.641 E.01427
G1 X139.917 Y143.012 E.15081
G1 X139.917 Y142.476 E.01654
G1 X143.271 Y139.122 E.14645
G2 X143.157 Y138.701 I-4.254 J.932 E.01348
G1 X139.917 Y141.941 E.14144
G2 X139.909 Y141.413 I-7.617 J-.147 E.01629
G1 X143.029 Y138.293 E.1362
G2 X142.888 Y137.898 I-4.008 J1.205 E.01295
G1 X139.873 Y140.913 E.13163
G2 X139.805 Y140.445 I-3.409 J.251 E.01462
G1 X142.735 Y137.515 E.12792
G1 X142.568 Y137.146 E.01249
G1 X139.711 Y140.003 E.12473
G2 X139.594 Y139.585 I-3.221 J.674 E.01343
G1 X142.389 Y136.79 E.12201
G2 X142.203 Y136.44 I-3.332 J1.553 E.01223
G1 X139.455 Y139.188 E.11996
G2 X139.298 Y138.81 I-2.806 J.943 E.01266
G1 X142.004 Y136.104 E.11813
G2 X141.793 Y135.779 I-3.344 J1.94 E.01196
G1 X139.123 Y138.448 E.11654
G1 X138.931 Y138.105 E.01215
G1 X141.573 Y135.463 E.11534
G2 X141.345 Y135.155 I-3.179 J2.12 E.01183
G1 X138.721 Y137.779 E.11456
G2 X138.496 Y137.469 I-2.352 J1.465 E.01185
G1 X141.104 Y134.86 E.11387
G2 X140.854 Y134.574 I-2.973 J2.349 E.01172
G1 X138.257 Y137.172 E.11339
G2 X138.004 Y136.889 I-2.165 J1.681 E.01172
G1 X140.596 Y134.297 E.11316
G1 X140.328 Y134.029 E.01169
G1 X137.736 Y136.622 E.11319
G2 X137.451 Y136.371 I-1.949 J1.93 E.01173
G1 X140.049 Y133.773 E.11343
G2 X139.761 Y133.525 I-2.616 J2.744 E.01173
G1 X137.151 Y136.134 E.11392
G2 X136.842 Y135.908 I-3.416 J4.357 E.01184
G1 X139.465 Y133.285 E.11453
G1 X139.157 Y133.057 E.01183
G1 X136.527 Y135.688 E.11483
G1 X136.212 Y135.467 E.01187
G1 X138.844 Y132.835 E.11492
G1 X138.529 Y132.614 E.01187
G1 X135.896 Y135.246 E.11492
G1 X135.581 Y135.026 E.01187
G1 X138.214 Y132.393 E.11492
G1 X137.899 Y132.173 E.01187
G1 X135.266 Y134.805 E.11492
G1 X134.951 Y134.584 E.01187
G1 X137.584 Y131.952 E.11492
G1 X137.268 Y131.731 E.01187
G1 X134.636 Y134.364 E.11492
G1 X134.321 Y134.143 E.01187
G1 X136.953 Y131.511 E.11492
G1 X136.638 Y131.29 E.01187
G1 X134.006 Y133.923 E.11492
G1 X133.691 Y133.702 E.01187
G1 X136.323 Y131.069 E.11492
G1 X136.008 Y130.849 E.01187
G1 X133.376 Y133.481 E.11492
G1 X133.061 Y133.261 E.01187
G1 X135.693 Y130.628 E.11492
G1 X135.378 Y130.408 E.01187
G1 X132.745 Y133.04 E.11492
G1 X132.43 Y132.819 E.01187
G1 X135.063 Y130.187 E.11492
G1 X134.748 Y129.966 E.01187
G1 X132.115 Y132.599 E.11492
G1 X131.8 Y132.378 E.01187
G1 X134.433 Y129.746 E.11492
G1 X134.117 Y129.525 E.01187
G1 X131.485 Y132.157 E.11492
G1 X131.17 Y131.937 E.01187
G1 X133.802 Y129.304 E.11492
G1 X133.487 Y129.084 E.01187
G1 X130.855 Y131.716 E.11492
G1 X130.54 Y131.496 E.01187
G1 X133.172 Y128.863 E.11492
G1 X132.857 Y128.642 E.01187
G1 X130.225 Y131.275 E.11492
G1 X129.91 Y131.054 E.01187
G1 X132.542 Y128.422 E.11492
G1 X132.227 Y128.201 E.01187
G1 X129.594 Y130.834 E.11492
G1 X129.279 Y130.613 E.01187
G1 X131.912 Y127.981 E.11492
G1 X131.597 Y127.76 E.01187
G1 X128.964 Y130.392 E.11492
G1 X128.649 Y130.172 E.01187
G1 X131.282 Y127.539 E.11492
G1 X130.967 Y127.319 E.01187
G1 X128.334 Y129.951 E.11492
G1 X128.019 Y129.73 E.01187
G1 X130.651 Y127.098 E.11492
G1 X130.336 Y126.877 E.01187
G1 X127.704 Y129.51 E.11492
G1 X127.389 Y129.289 E.01187
G1 X130.021 Y126.657 E.11492
G1 X129.706 Y126.436 E.01187
G1 X127.074 Y129.069 E.11492
G2 X126.752 Y128.854 I-3.164 J4.39 E.01193
G1 X129.391 Y126.215 E.11519
G1 X129.076 Y125.995 E.01187
G1 X126.419 Y128.651 E.11597
G2 X126.071 Y128.464 I-1.484 J2.34 E.01222
G1 X128.761 Y125.774 E.11742
G1 X128.446 Y125.554 E.01187
G1 X125.705 Y128.295 E.11967
G2 X125.318 Y128.146 I-1.233 J2.631 E.01281
G1 X128.131 Y125.333 E.12281
G1 X127.816 Y125.112 E.01187
G1 X124.912 Y128.016 E.12674
G2 X124.484 Y127.908 I-1.034 J3.217 E.01364
G1 X127.5 Y124.892 E.13168
G1 X127.185 Y124.671 E.01187
G1 X124.032 Y127.825 E.13767
G2 X123.552 Y127.769 I-.628 J3.33 E.01494
G1 X126.87 Y124.45 E.14488
G1 X126.555 Y124.23 E.01187
G1 X123.035 Y127.75 E.15367
G2 X122.484 Y127.765 I-.153 J4.403 E.01703
G1 X126.24 Y124.009 E.16397
G1 X125.925 Y123.788 E.01187
G1 X121.874 Y127.84 E.17686
G2 X121.186 Y127.992 I.67 J4.658 E.02177
G1 X125.61 Y123.568 E.19314
G1 X125.295 Y123.347 E.01187
G1 X120.044 Y128.598 E.22924
G1 X112.247 Y110.68 F42000
G1 F15000
G1 X128.01 Y94.917 E.68813
G1 X127.474 Y94.917 E.01654
G1 X112.417 Y109.974 E.65734
G1 X112.417 Y109.438 E.01654
G1 X126.938 Y94.917 E.63395
G1 X126.403 Y94.917 E.01654
G1 X112.417 Y108.903 E.61056
G1 X112.417 Y108.367 E.01654
G1 X125.867 Y94.917 E.58717
G1 X125.331 Y94.917 E.01654
G1 X112.417 Y107.831 E.56378
G1 X112.417 Y107.295 E.01654
G1 X124.795 Y94.917 E.5404
G1 X124.26 Y94.917 E.01654
G1 X112.417 Y106.76 E.51701
G1 X112.417 Y106.224 E.01654
G1 X123.724 Y94.917 E.49362
G1 X123.188 Y94.917 E.01654
G1 X112.417 Y105.688 E.47023
G1 X112.417 Y105.153 E.01654
G1 X122.653 Y94.917 E.44685
G1 X122.117 Y94.917 E.01654
G1 X112.417 Y104.617 E.42346
G3 X112.42 Y104.078 I8.558 J-.213 E.01665
G1 X121.581 Y94.917 E.39991
G1 X121.045 Y94.917 E.01654
G1 X112.439 Y103.523 E.3757
G3 X112.494 Y102.933 I5.794 J.235 E.01829
G1 X120.51 Y94.917 E.34995
G1 X119.974 Y94.917 E.01654
G1 X112.59 Y102.301 E.32236
G3 X112.733 Y101.622 I6.925 J1.108 E.02144
G1 X119.438 Y94.917 E.29271
G1 X118.902 Y94.917 E.01654
M73 P37 R12
G1 X112.95 Y100.87 E.25988
G3 X113.276 Y100.007 I8.475 J2.719 E.02849
G1 X118.367 Y94.917 E.22222
G1 X117.831 Y94.917 E.01654
G1 X113.805 Y98.943 E.17574
G3 X115.502 Y96.71 I9.091 J5.148 E.08682
G1 X117.465 Y94.747 E.08569
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X116.051 Y96.161 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/45
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
M106 S193.8
G17
G3 Z.8 I-1.208 J.145 P1  F42000
G1 X123.348 Y156.924 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.419 Y151.995 E.23125
G3 X116.532 Y147.44 I4.618 J-4.581 E.16773
G1 X116.532 Y134.649 E.42429
G3 X122.75 Y128.199 I6.474 J.019 E.32824
G3 X126.701 Y129.356 I.255 J6.456 E.13897
G1 X136.719 Y136.37 E.40566
G3 X139.468 Y141.652 I-3.752 J5.31 E.20518
G1 X139.468 Y147.44 E.19201
G3 X137.581 Y151.995 I-6.504 J-.026 E.16773
G1 X132.608 Y156.968 E.23331
G1 X123.392 Y156.968 E.30572
G1 X123.39 Y156.967 E.00007
G1 X123.538 Y156.56 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5700
G1 X118.701 Y151.723 E.21019
G3 X116.924 Y147.433 I4.335 J-4.309 E.14635
G1 X116.924 Y134.656 E.39258
G3 X122.772 Y128.591 I6.082 J.012 E.286
G3 X126.482 Y129.681 I.233 J6.065 E.12093
G1 X136.488 Y136.687 E.37534
G3 X139.076 Y141.659 I-3.521 J4.992 E.17891
G1 X139.076 Y147.433 E.17743
G3 X137.299 Y151.723 I-6.112 J-.019 E.14635
G1 X132.446 Y156.576 E.2109
G1 X123.591 Y156.576 E.27208
M204 S6000
; WIPE_START
G1 F33600
G1 X122.172 Y155.167 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.283 Y147.833 Z1 F42000
G1 X133.63 Y115.372 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X133.543 Y115.266 E.00455
G3 X133.468 Y114.982 I.466 J-.274 E.00987
G1 X133.468 Y112.85 E.07073
G3 X133.639 Y112.437 I.566 J-.007 E.01522
G1 X135.463 Y110.613 E.08557
G2 X136.468 Y108.187 I-2.46 J-2.44 E.08935
G2 X136.403 Y105.983 I-17.12 J-.598 E.07318
G2 X128.51 Y99.032 I-7.91 J1.025 E.38097
G2 X125.599 Y99.443 I-.413 J7.578 E.09814
G2 X122.308 Y102.142 I2.509 J6.415 E.14353
G2 X120.852 Y105.56 I9.408 J6.025 E.1238
G2 X119.777 Y110.888 I62.164 J15.324 E.18035
G2 X125 Y122.593 I12.381 J1.493 E.44655
G1 X139.322 Y132.621 E.57996
G3 X144.032 Y141.67 I-6.354 J9.058 E.3517
G1 X144.032 Y150.492 E.29266
G3 X132.992 Y161.532 I-11.041 J-.002 E.57521
G1 X123.008 Y161.532 E.3312
G3 X111.968 Y150.492 I-.004 J-11.036 E.57529
G1 X111.968 Y104.185 E1.53608
G3 X115.205 Y96.371 I11.085 J.014 E.28786
G1 X117.108 Y94.468 E.08929
G1 X138.892 Y94.468 E.72261
G1 X140.795 Y96.371 E.08929
G3 X144.032 Y104.185 I-7.831 J7.821 E.28788
G1 X144.032 Y111.987 E.2588
G3 X140.487 Y115.532 I-3.541 J.004 E.18475
G1 X134.023 Y115.532 E.21442
G3 X133.672 Y115.415 I-.015 J-.54 E.01255
G1 X133.3 Y115.602 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4800
G1 X133.214 Y115.485 E.00447
G1 F5700
G1 X133.134 Y115.321 E.00559
G1 X133.137 Y115.32 F42000
G1 F5700
G1 X133.079 Y115.045 E.00865
G1 F4800
G1 X133.076 Y114.994 E.00157
G1 F5700
G1 X133.078 Y114.594 E.01229
G1 X133.084 Y113.098 E.04595
G1 X133.084 Y113.098 F42000
G1 F5700
G1 X133.086 Y112.698 E.01229
G1 F4800
G1 X133.092 Y112.662 E.00114
G1 F5700
G1 X133.173 Y112.418 E.0079
G1 X133.175 Y112.419 F42000
G1 F5700
G3 X133.352 Y112.17 I.882 J.438 E.00942
G1 X135.179 Y110.343 E.07939
G2 X136.076 Y108.177 I-2.181 J-2.172 E.07391
G2 X136.014 Y106.033 I-16.703 J-.59 E.06596
G2 X128.503 Y99.424 I-7.52 J.975 E.33569
G2 X125.738 Y99.81 I-.405 J7.195 E.08633
G2 X122.633 Y102.362 I2.37 J6.049 E.12556
G2 X121.231 Y105.661 I9.074 J5.803 E.11066
G2 X120.166 Y110.935 I61.943 J15.258 E.16538
G2 X125.227 Y122.273 I11.992 J1.446 E.40072
G1 X139.55 Y132.303 E.53728
G3 X142.67 Y135.584 I-6.655 J9.452 E.14002
G1 X142.671 Y135.583 F42000
G1 F5700
G1 X142.963 Y136.074 E.01755
G1 F4800
G3 X143.229 Y136.577 I-10.345 J5.787 E.01748
G1 F5700
G1 X143.527 Y137.227 E.02198
G1 X143.526 Y137.227 F42000
G1 F5700
G3 X144.424 Y141.665 I-10.652 J4.466 E.14002
G1 X144.424 Y150.497 E.2714
G3 X144.18 Y152.835 I-11.684 J-.039 E.07235
G1 X144.047 Y153.408 E.01807
G1 X144.047 Y153.408 F42000
G1 F5700
G1 X143.882 Y153.974 E.01812
G1 F4800
G1 X143.836 Y154.114 E.00453
G1 F5700
G1 X143.689 Y154.529 E.01353
G1 F4800
G3 X143.467 Y155.074 I-11.214 J-4.247 E.01807
G1 F5700
G1 X143.151 Y155.74 E.02265
G1 X143.147 Y155.738 F42000
G1 F5700
G1 X142.868 Y156.256 E.01808
G1 F4800
G1 X142.638 Y156.63 E.01348
G1 F5700
G1 X142.224 Y157.239 E.02264
G1 X142.222 Y157.238 F42000
G1 F5700
G3 X138.239 Y160.65 I-9.269 J-6.789 E.16259
G1 X138.24 Y160.651 F42000
G1 F5700
G1 X137.709 Y160.908 E.01813
G1 F4800
G3 X137.167 Y161.136 I-4.92 J-10.919 E.01806
G1 F5700
G1 X136.473 Y161.383 E.02265
G1 X136.472 Y161.381 F42000
G1 F5700
G3 X132.997 Y161.924 I-3.504 J-11.037 E.10849
G1 X123.003 Y161.924 E.3071
G3 X120.665 Y161.679 I.05 J-11.751 E.07235
G1 X120.092 Y161.547 E.01807
G1 X120.092 Y161.547 F42000
G1 F5700
G1 X119.526 Y161.382 E.01812
G1 F4800
G1 X119.386 Y161.336 E.00453
G1 F5700
G1 X118.971 Y161.189 E.01353
G1 F4800
G3 X118.426 Y160.967 I4.245 J-11.209 E.01808
G1 F5700
G1 X117.76 Y160.651 E.02265
G1 X117.761 Y160.65 F42000
G1 F5700
G3 X113.133 Y156.255 I5.277 J-10.191 E.19873
G1 X113.132 Y156.255 F42000
G1 F5700
G1 X112.849 Y155.74 E.01807
G1 F4800
G1 X112.592 Y155.209 E.01813
G1 F5533.071
G1 X112.533 Y155.074 E.00453
G1 F4800
G1 X112.364 Y154.667 E.01353
G1 F5700
G1 X112.118 Y153.974 E.0226
G1 X112.119 Y153.974 F42000
G1 F5700
G3 X111.576 Y150.497 I10.961 J-3.491 E.10855
G1 X111.576 Y104.18 E1.42319
G3 X111.955 Y101.27 I11.751 J.05 E.09041
G1 X111.953 Y101.27 F42000
G1 F5700
G1 X112.118 Y100.703 E.01812
G1 F4800
G1 X112.164 Y100.563 E.00453
G1 F5700
G1 X112.311 Y100.148 E.01353
G1 F4800
G1 X112.364 Y100.01 E.00455
G1 F5700
G1 X112.533 Y99.604 E.01353
G1 F4800
G1 X112.592 Y99.469 E.00453
G1 F5700
G1 X112.849 Y98.938 E.01813
G1 X112.852 Y98.939 F42000
G1 F5700
G3 X114.519 Y96.528 I10.488 J5.472 E.09031
G1 X114.517 Y96.526 F42000
G1 F5700
G1 X114.924 Y96.098 E.01815
G1 F4800
G1 X116.946 Y94.076 E.08786
G1 X139.054 Y94.076 E.67934
G1 X140.065 Y95.087 E.04393
G1 F5700
G1 X140.348 Y95.37 E.01229
G1 X140.348 Y95.37 F42000
G1 F5700
G1 X141.076 Y96.098 E.03164
G3 X142.867 Y98.423 I-8.141 J8.125 E.09043
G1 X142.868 Y98.422 F42000
G1 F5700
G1 X143.151 Y98.938 E.01807
G1 F4800
G1 X143.408 Y99.469 E.01813
G1 F5533
G1 X143.467 Y99.604 E.00453
G1 F4800
G1 X143.636 Y100.01 E.01353
G1 F5700
G1 X143.883 Y100.705 E.02265
G1 X143.881 Y100.706 F42000
G1 F5700
G3 X144.424 Y104.18 I-11.036 J3.504 E.10849
G1 X144.424 Y111.996 E.24014
G3 X144.298 Y112.985 I-3.93 J.002 E.03074
G1 X144.298 Y112.985 F42000
G1 F5700
G1 X144.2 Y113.306 E.01029
G1 F4800
G3 X144.076 Y113.613 I-3.974 J-1.419 E.01018
G1 F5700
G1 X143.882 Y113.989 E.01299
G1 X143.881 Y113.988 F42000
G1 F5700
G3 X142.488 Y115.381 I-3.413 J-2.02 E.06117
G1 X142.489 Y115.382 F42000
G1 F5700
G1 X142.113 Y115.576 E.01299
G1 F4800
G1 X141.888 Y115.669 E.00748
G1 F5700
G1 X141.485 Y115.798 E.01299
G1 X141.485 Y115.795 F42000
G1 F5700
G3 X140.496 Y115.924 I-1.028 J-4.017 E.03072
G1 X134.008 Y115.924 E.19934
G1 X133.818 Y115.905 E.00588
G1 F4800
G1 X133.678 Y115.865 E.00447
G1 F5502.366
G1 X133.55 Y115.806 E.00434
G1 F4800
G1 X133.514 Y115.784 E.00129
G1 F5700
G1 X133.341 Y115.646 E.00681
M204 S6000
; WIPE_START
G1 F33600
G1 X133.214 Y115.485 E-.07788
G1 X133.134 Y115.321 E-.06918
G1 X133.137 Y115.32 E-.00101
G1 X133.079 Y115.045 E-.10694
G1 X133.076 Y114.994 E-.01947
G1 X133.078 Y114.594 E-.152
G1 X133.081 Y113.716 E-.33351
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z1 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z1
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    
      M400
      G90
      M83
      M204 S5000
      G0 Z2 F4000
      G0 X261 Y250 F20000
      M400 P200
      G39 S1
      G0 Z2 F4000
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623


G1 Z2.4 F42000
G1 X133.632 Y114.798
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420813
G1 F15000
G1 X134.029 Y115.195 E.01729
G1 X134.567 Y115.199 E.01658
G1 X133.801 Y114.433 E.03335
G1 X133.801 Y113.899 E.01646
G1 X135.101 Y115.199 E.05662
G1 X135.636 Y115.199 E.01646
G1 X133.801 Y113.364 E.07989
G3 X133.803 Y112.832 I3.776 J-.251 E.01641
G1 X136.17 Y115.199 E.10307
G1 X136.705 Y115.199 E.01646
G1 X134.027 Y112.521 E.11662
G1 X134.294 Y112.253 E.01164
G1 X137.239 Y115.199 E.12826
G1 X137.774 Y115.199 E.01646
G1 X134.561 Y111.986 E.13989
G1 X134.828 Y111.719 E.01164
G1 X138.308 Y115.199 E.15153
G1 X138.842 Y115.199 E.01646
G1 X135.096 Y111.452 E.16317
G1 X135.363 Y111.185 E.01164
G1 X139.377 Y115.199 E.1748
G1 X139.911 Y115.199 E.01646
G1 X135.63 Y110.917 E.18644
G2 X135.888 Y110.64 I-2.614 J-2.688 E.01165
G1 X140.446 Y115.199 E.1985
G2 X140.945 Y115.164 I-.067 J-4.578 E.01543
G1 X136.12 Y110.339 E.21013
G2 X136.325 Y110.009 I-1.526 J-1.176 E.01197
G1 X141.385 Y115.069 E.22035
G2 X141.778 Y114.928 I-.546 J-2.145 E.01289
G1 X136.502 Y109.651 E.22979
G2 X136.642 Y109.257 I-1.877 J-.89 E.01291
G1 X142.133 Y114.748 E.23914
G2 X142.45 Y114.531 I-1.121 J-1.972 E.01185
G1 X136.742 Y108.823 E.24856
G2 X136.794 Y108.34 I-2.357 J-.497 E.01497
G1 X142.737 Y114.283 E.25881
G2 X142.99 Y114.002 I-5.937 J-5.596 E.01165
G1 X136.798 Y107.81 E.26967
G1 X136.793 Y107.27 E.01661
G1 X143.209 Y113.687 E.27944
G2 X143.4 Y113.343 I-2.481 J-1.599 E.01212
G1 X136.788 Y106.731 E.28796
G2 X136.755 Y106.164 I-3.275 J-.098 E.0175
G1 X143.548 Y112.957 E.29581
G2 X143.653 Y112.528 I-4.04 J-1.22 E.01361
G1 X136.671 Y105.546 E.30406
M73 P38 R12
G2 X136.52 Y104.86 I-40.167 J8.517 E.02164
G1 X143.696 Y112.036 E.31253
G2 X143.699 Y111.504 I-6.268 J-.294 E.01639
G1 X136.261 Y104.067 E.32389
G2 X135.823 Y103.094 I-7.541 J2.811 E.03286
G1 X143.868 Y111.139 E.35035
G1 X141.898 Y97.947 F42000
G1 F15000
G1 X138.753 Y94.801 E.13697
G1 X138.219 Y94.801 E.01646
G1 X142.285 Y98.867 E.17706
G3 X142.815 Y99.932 I-9.498 J5.393 E.03663
G1 X137.684 Y94.801 E.22341
G1 X137.15 Y94.801 E.01646
G1 X143.148 Y100.799 E.26119
G3 X143.366 Y101.552 I-10.125 J3.349 E.02416
G1 X136.616 Y94.801 E.29399
G1 X136.081 Y94.801 E.01646
G1 X143.512 Y102.232 E.3236
G3 X143.612 Y102.867 I-4.239 J.996 E.01981
G1 X135.547 Y94.801 E.35125
G1 X135.012 Y94.801 E.01646
G1 X143.671 Y103.46 E.37709
G3 X143.694 Y104.018 I-5.394 J.502 E.01719
G1 X134.478 Y94.801 E.40136
G1 X133.943 Y94.801 E.01646
G1 X143.699 Y104.557 E.42483
G1 X143.699 Y105.091 E.01646
G1 X133.409 Y94.801 E.4481
G1 X132.875 Y94.801 E.01646
G1 X143.699 Y105.625 E.47137
G1 X143.699 Y106.16 E.01646
G1 X132.34 Y94.801 E.49465
G1 X131.806 Y94.801 E.01646
G1 X143.699 Y106.694 E.51792
G1 X143.699 Y107.229 E.01646
G1 X131.271 Y94.801 E.54119
G1 X130.737 Y94.801 E.01646
G1 X143.699 Y107.763 E.56447
G1 X143.699 Y108.298 E.01646
G1 X130.202 Y94.801 E.58774
G1 X129.668 Y94.801 E.01646
G1 X143.699 Y108.832 E.61101
G1 X143.699 Y109.366 E.01646
G1 X129.134 Y94.801 E.63429
G1 X128.599 Y94.801 E.01646
G1 X143.699 Y109.901 E.65756
G1 X143.699 Y110.435 E.01646
G1 X128.065 Y94.801 E.68083
G1 X127.53 Y94.801 E.01646
G1 X132.406 Y99.677 E.21231
G2 X131.433 Y99.239 I-3.784 J7.103 E.03286
G1 X126.996 Y94.801 E.19324
G1 X126.462 Y94.801 E.01646
G1 X130.648 Y98.987 E.1823
G2 X129.956 Y98.83 I-1.903 J6.767 E.02185
G1 X125.927 Y94.801 E.17545
G1 X125.393 Y94.801 E.01646
G1 X129.336 Y98.745 E.17172
G2 X128.768 Y98.711 I-.486 J3.429 E.01753
G1 X124.858 Y94.801 E.17027
G1 X124.324 Y94.801 E.01646
G1 X128.226 Y98.704 E.16994
G2 X127.694 Y98.706 I-.247 J4.501 E.0164
G1 X123.789 Y94.801 E.17004
G1 X123.255 Y94.801 E.01646
G1 X127.188 Y98.734 E.17126
G2 X126.721 Y98.802 I.276 J3.502 E.01452
G1 X122.721 Y94.801 E.17423
G1 X122.186 Y94.801 E.01646
G1 X126.274 Y98.89 E.17803
G2 X125.859 Y99.009 I.677 J3.144 E.01331
G1 X121.652 Y94.801 E.18322
G1 X121.117 Y94.801 E.01646
G1 X125.457 Y99.141 E.189
G1 X125.079 Y99.298 E.0126
G1 X120.583 Y94.801 E.19581
G1 X120.048 Y94.801 E.01646
G1 X124.721 Y99.474 E.20347
G2 X124.381 Y99.669 I1.052 J2.22 E.01206
G1 X119.514 Y94.801 E.21197
G1 X118.98 Y94.801 E.01646
G1 X124.051 Y99.873 E.22085
G2 X123.743 Y100.099 I1.493 J2.356 E.01178
G1 X118.445 Y94.801 E.23071
G1 X117.911 Y94.801 E.01646
G1 X123.447 Y100.337 E.24109
G2 X123.169 Y100.594 I1.259 J1.646 E.01166
G1 X117.376 Y94.801 E.25224
G1 X117.246 Y94.801 E.00401
G1 X117.044 Y95.003 E.0088
G1 X122.899 Y100.858 E.25497
G2 X122.65 Y101.143 I2.372 J2.325 E.01167
G1 X116.777 Y95.271 E.25575
G1 X116.51 Y95.538 E.01164
G1 X122.412 Y101.44 E.25702
G2 X122.182 Y101.745 I2.575 J2.178 E.01176
G1 X116.242 Y95.805 E.25866
G1 X115.975 Y96.072 E.01164
G1 X121.964 Y102.061 E.26082
G2 X121.758 Y102.39 I2.69 J1.914 E.01195
G1 X115.708 Y96.34 E.26349
G1 X115.441 Y96.607 E.01164
G1 X121.567 Y102.733 E.2668
G2 X121.385 Y103.085 I2.758 J1.651 E.01222
G1 X115.181 Y96.881 E.27019
G2 X114.927 Y97.162 I2.601 J2.595 E.01166
G1 X121.217 Y103.452 E.27392
G1 X121.06 Y103.829 E.01259
G1 X114.682 Y97.451 E.27777
G1 X114.449 Y97.753 E.01173
G1 X120.921 Y104.225 E.28183
G1 X120.787 Y104.625 E.013
G1 X114.227 Y98.065 E.28568
G1 X114.01 Y98.383 E.01185
G1 X120.656 Y105.029 E.28941
G1 X120.545 Y105.452 E.01348
G1 X113.812 Y98.719 E.29322
G1 X113.617 Y99.058 E.01205
G1 X120.434 Y105.875 E.29688
G2 X120.325 Y106.301 I4.846 J1.465 E.01353
G1 X113.43 Y99.406 E.30028
G1 X113.257 Y99.768 E.01235
G1 X120.23 Y106.74 E.30364
G1 X120.135 Y107.179 E.01384
G1 X113.097 Y100.141 E.30649
G2 X112.947 Y100.526 I3.658 J1.642 E.01272
G1 X120.04 Y107.619 E.30886
G2 X119.947 Y108.06 I7.605 J1.826 E.0139
G1 X112.809 Y100.923 E.31083
G1 X112.689 Y101.337 E.01327
G1 X119.863 Y108.511 E.31242
G1 X119.779 Y108.961 E.01411
G1 X112.581 Y101.764 E.31343
G2 X112.489 Y102.205 I4.237 J1.12 E.0139
G1 X119.695 Y109.411 E.31381
G1 X119.61 Y109.862 E.01411
G1 X112.412 Y102.663 E.31348
G2 X112.354 Y103.139 I4.698 J.82 E.01477
G1 X119.526 Y110.312 E.31237
G2 X119.464 Y110.784 I2.937 J.632 E.01466
G1 X112.321 Y103.641 E.31106
G1 X112.303 Y104.157 E.01591
G1 X119.412 Y111.267 E.30962
G2 X119.372 Y111.761 I3.305 J.519 E.01528
G1 X112.301 Y104.69 E.30792
G1 X112.301 Y105.225 E.01646
G1 X119.356 Y112.279 E.30721
G2 X119.366 Y112.824 I4.598 J.185 E.01679
G1 X112.301 Y105.759 E.30767
G1 X112.301 Y106.293 E.01646
G1 X119.403 Y113.395 E.30925
G1 X119.464 Y113.99 E.01844
G1 X112.301 Y106.828 E.31191
G1 X112.301 Y107.362 E.01646
G1 X119.562 Y114.623 E.31621
G1 X119.691 Y115.286 E.02079
G1 X112.301 Y107.897 E.3218
G1 X112.301 Y108.431 E.01646
G1 X119.881 Y116.011 E.3301
G2 X120.146 Y116.81 I14.435 J-4.34 E.02593
G1 X112.301 Y108.966 E.34164
G1 X112.301 Y109.5 E.01646
G1 X120.521 Y117.72 E.35797
G1 X121.013 Y118.685 E.03335
G1 X121.114 Y118.847 E.00588
G1 X112.301 Y110.034 E.38377
G1 X112.301 Y110.569 E.01646
G1 X143.699 Y141.966 E1.36731
G1 X143.699 Y142.501 E.01646
G1 X112.301 Y111.103 E1.36731
G1 X112.301 Y111.638 E.01646
G1 X136.412 Y135.748 E1.04999
G1 X134.629 Y134.5 E.06701
G1 X112.301 Y112.172 E.97236
G1 X112.301 Y112.707 E.01646
G1 X132.847 Y133.252 E.89473
G1 X131.064 Y132.004 E.06701
G1 X112.301 Y113.241 E.81709
G1 X112.301 Y113.775 E.01646
G1 X129.282 Y130.756 E.73946
G1 X127.499 Y129.507 E.06701
G1 X112.301 Y114.31 E.66183
G1 X112.301 Y114.844 E.01646
G1 X126.028 Y128.571 E.59777
G2 X125.122 Y128.199 I-3.752 J7.861 E.03016
G1 X112.301 Y115.379 E.55833
G1 X112.301 Y115.913 E.01646
G1 X124.394 Y128.006 E.52661
G2 X123.757 Y127.903 I-1.76 J8.911 E.01987
G1 X112.301 Y116.447 E.49888
G1 X112.301 Y116.982 E.01646
G1 X123.186 Y127.867 E.47402
G2 X122.656 Y127.871 I-.232 J4.433 E.01634
G1 X112.301 Y117.516 E.45092
G1 X112.301 Y118.051 E.01646
G1 X122.165 Y127.914 E.42953
G2 X121.706 Y127.989 I.485 J4.379 E.01433
G1 X112.301 Y118.585 E.40954
G1 X112.301 Y119.12 E.01646
G1 X121.272 Y128.09 E.39064
G2 X120.855 Y128.208 I.527 J2.655 E.01334
G1 X112.301 Y119.654 E.3725
G1 X112.301 Y120.188 E.01646
G1 X120.466 Y128.353 E.35556
G2 X120.092 Y128.514 I.921 J2.655 E.01254
G1 X112.301 Y120.723 E.33929
G1 X112.301 Y121.257 E.01646
G1 X119.738 Y128.694 E.32386
G2 X119.402 Y128.892 I1.191 J2.4 E.01203
G1 X112.301 Y121.792 E.30923
G1 X112.301 Y122.326 E.01646
G1 X119.081 Y129.106 E.29526
G2 X118.775 Y129.334 I1.425 J2.234 E.01177
G1 X112.301 Y122.861 E.28191
G1 X112.301 Y123.395 E.01646
G1 X118.482 Y129.576 E.26918
G1 X118.208 Y129.836 E.01164
G1 X112.301 Y123.929 E.25724
G1 X112.301 Y124.464 E.01646
G1 X117.949 Y130.111 E.24593
G2 X117.703 Y130.4 I1.874 J1.846 E.01168
G1 X112.301 Y124.998 E.23523
G1 X112.301 Y125.533 E.01646
M73 P39 R12
G1 X117.471 Y130.702 E.22512
G2 X117.258 Y131.024 I2.458 J1.858 E.01188
G1 X112.301 Y126.067 E.21585
G1 X112.301 Y126.601 E.01646
G1 X117.059 Y131.359 E.20718
G2 X116.876 Y131.711 I1.977 J1.251 E.01222
G1 X112.301 Y127.136 E.19922
G1 X112.301 Y127.67 E.01646
G1 X116.712 Y132.08 E.19206
G2 X116.565 Y132.468 I2.599 J1.204 E.01278
G1 X112.301 Y128.205 E.18568
G1 X112.301 Y128.739 E.01646
G1 X116.438 Y132.876 E.18017
G2 X116.337 Y133.309 I3.222 J.985 E.0137
G1 X112.301 Y129.274 E.17574
G1 X112.301 Y129.808 E.01646
G1 X116.26 Y133.766 E.17238
G2 X116.213 Y134.254 I3.351 J.569 E.01509
G1 X112.301 Y130.342 E.17033
G1 X112.301 Y130.877 E.01646
G1 X116.199 Y134.774 E.16972
G1 X116.199 Y135.309 E.01646
G1 X112.301 Y131.411 E.16972
G1 X112.301 Y131.946 E.01646
G1 X116.199 Y135.843 E.16972
G1 X116.199 Y136.377 E.01646
G1 X112.301 Y132.48 E.16972
G1 X112.301 Y133.015 E.01646
G1 X116.199 Y136.912 E.16972
G1 X116.199 Y137.446 E.01646
G1 X112.301 Y133.549 E.16972
G1 X112.301 Y134.083 E.01646
G1 X116.199 Y137.981 E.16972
G1 X116.199 Y138.515 E.01646
G1 X112.301 Y134.618 E.16972
G1 X112.301 Y135.152 E.01646
G1 X116.199 Y139.049 E.16972
G1 X116.199 Y139.584 E.01646
G1 X112.301 Y135.687 E.16972
G1 X112.301 Y136.221 E.01646
G1 X116.199 Y140.118 E.16972
G1 X116.199 Y140.653 E.01646
G1 X112.301 Y136.755 E.16972
G1 X112.301 Y137.29 E.01646
G1 X116.199 Y141.187 E.16972
G1 X116.199 Y141.722 E.01646
G1 X112.301 Y137.824 E.16972
G1 X112.301 Y138.359 E.01646
G1 X116.199 Y142.256 E.16972
G1 X116.199 Y142.79 E.01646
G1 X112.301 Y138.893 E.16972
G1 X112.301 Y139.428 E.01646
G1 X116.199 Y143.325 E.16972
G1 X116.199 Y143.859 E.01646
G1 X112.301 Y139.962 E.16972
G1 X112.301 Y140.496 E.01646
G1 X116.199 Y144.394 E.16972
G1 X116.199 Y144.928 E.01646
G1 X112.301 Y141.031 E.16972
G1 X112.301 Y141.565 E.01646
G1 X116.199 Y145.463 E.16972
G1 X116.199 Y145.997 E.01646
G1 X112.301 Y142.1 E.16972
G1 X112.301 Y142.634 E.01646
G1 X116.199 Y146.531 E.16972
G1 X116.199 Y147.066 E.01646
G1 X112.301 Y143.169 E.16972
G1 X112.301 Y143.703 E.01646
G1 X116.204 Y147.606 E.16997
G2 X116.244 Y148.18 I3.944 J.015 E.01774
G1 X112.301 Y144.237 E.17171
G1 X112.301 Y144.772 E.01646
G1 X116.344 Y148.814 E.17603
G2 X116.539 Y149.544 I7.876 J-1.717 E.02327
G1 X112.301 Y145.306 E.18453
G1 X112.301 Y145.841 E.01646
G1 X116.918 Y150.458 E.20106
G2 X118.179 Y152.226 I6.095 J-3.01 E.06716
G1 X123.254 Y157.301 E.22102
G1 X123.762 Y157.301 E.01565
G1 X127.659 Y161.199 E.16972
G1 X128.194 Y161.199 E.01646
G1 X124.297 Y157.301 E.16972
G1 X124.831 Y157.301 E.01646
G1 X128.728 Y161.199 E.16972
G1 X129.263 Y161.199 E.01646
G1 X125.365 Y157.301 E.16972
G1 X125.9 Y157.301 E.01646
G1 X129.797 Y161.199 E.16972
G1 X130.331 Y161.199 E.01646
G1 X126.434 Y157.301 E.16972
G1 X126.969 Y157.301 E.01646
G1 X130.866 Y161.199 E.16972
G1 X131.4 Y161.199 E.01646
G1 X127.503 Y157.301 E.16972
G1 X128.037 Y157.301 E.01646
G1 X131.935 Y161.199 E.16972
G1 X132.469 Y161.199 E.01646
G1 X128.572 Y157.301 E.16972
G1 X129.106 Y157.301 E.01646
G1 X133.003 Y161.198 E.1697
G1 X133.524 Y161.185 E.01605
G1 X129.641 Y157.301 E.16912
G1 X130.175 Y157.301 E.01646
G1 X134.021 Y161.148 E.1675
G2 X134.495 Y161.087 I-.27 J-3.983 E.01471
G1 X130.71 Y157.301 E.16486
G1 X131.244 Y157.301 E.01646
G1 X134.953 Y161.01 E.16152
G1 X135.393 Y160.916 E.01386
G1 X131.778 Y157.301 E.15741
G1 X132.313 Y157.301 E.01646
G1 X135.827 Y160.815 E.15303
G1 X136.241 Y160.695 E.01327
G1 X132.797 Y157.251 E.14998
G1 X133.064 Y156.984 E.01164
G1 X136.638 Y160.557 E.15563
G2 X137.022 Y160.407 I-1.104 J-3.396 E.01271
G1 X133.331 Y156.716 E.16074
G1 X133.598 Y156.449 E.01164
G1 X137.4 Y160.251 E.16556
G2 X137.761 Y160.077 I-1.322 J-3.203 E.01233
G1 X133.866 Y156.182 E.16962
G1 X134.133 Y155.915 E.01164
G1 X138.112 Y159.894 E.17328
G2 X138.454 Y159.701 I-1.693 J-3.413 E.01209
G1 X134.4 Y155.648 E.17654
G1 X134.667 Y155.38 E.01164
G1 X138.784 Y159.497 E.17929
G2 X139.103 Y159.282 I-1.928 J-3.202 E.01186
G1 X134.934 Y155.113 E.18155
G1 X135.202 Y154.846 E.01164
G1 X139.415 Y159.059 E.18347
G2 X139.714 Y158.824 I-2.474 J-3.457 E.01172
G1 X135.469 Y154.579 E.18487
G1 X135.736 Y154.311 E.01164
G1 X140.004 Y158.58 E.18587
G2 X140.287 Y158.328 I-1.938 J-2.469 E.01166
G1 X136.003 Y154.044 E.18657
G1 X136.27 Y153.777 E.01164
G1 X140.565 Y158.065 E.18687
G1 X140.822 Y157.794 E.0115
G1 X136.538 Y153.51 E.18657
G1 X136.805 Y153.243 E.01164
G1 X141.075 Y157.513 E.18596
G2 X141.32 Y157.224 I-2.678 J-2.523 E.01168
G1 X137.072 Y152.975 E.18501
G1 X137.339 Y152.708 E.01164
G1 X141.553 Y156.922 E.1835
G2 X141.777 Y156.611 I-2.901 J-2.324 E.0118
G1 X137.607 Y152.441 E.1816
G2 X137.872 Y152.172 I-3.551 J-3.766 E.01164
G1 X141.992 Y156.292 E.17945
G1 X142.196 Y155.962 E.01196
G1 X138.129 Y151.895 E.17712
G2 X138.368 Y151.6 I-1.898 J-1.782 E.01171
G1 X142.389 Y155.62 E.17509
G2 X142.573 Y155.269 I-3.31 J-1.956 E.0122
G1 X138.594 Y151.291 E.17327
G2 X138.805 Y150.967 I-2.087 J-1.59 E.0119
G1 X142.747 Y154.909 E.17168
G1 X142.903 Y154.531 E.01259
G1 X139.001 Y150.629 E.16995
G1 X139.177 Y150.27 E.01229
G1 X143.054 Y154.148 E.16884
G2 X143.192 Y153.751 I-3.747 J-1.525 E.01293
G1 X139.337 Y149.896 E.16789
G2 X139.475 Y149.5 I-3.053 J-1.287 E.01293
G1 X143.312 Y153.337 E.16712
G2 X143.42 Y152.91 I-4.089 J-1.253 E.01357
G1 X139.593 Y149.083 E.16664
G2 X139.688 Y148.644 I-2.957 J-.868 E.01386
G1 X143.512 Y152.468 E.16654
G2 X143.589 Y152.01 I-4.589 J-1.004 E.0143
G1 X139.756 Y148.178 E.16691
G2 X139.793 Y147.68 I-3.383 J-.5 E.01538
G1 X143.643 Y151.53 E.16766
G2 X143.684 Y151.037 I-4.058 J-.592 E.01523
G1 X139.801 Y147.154 E.1691
G1 X139.801 Y146.62 E.01646
G1 X143.698 Y150.516 E.16969
G2 X143.699 Y149.982 I-10.351 J-.281 E.01644
G1 X139.801 Y146.085 E.16972
G1 X139.801 Y145.551 E.01646
G1 X143.699 Y149.448 E.16972
G1 X143.699 Y148.914 E.01646
G1 X139.801 Y145.016 E.16972
G1 X139.801 Y144.482 E.01646
G1 X143.699 Y148.379 E.16972
G1 X143.699 Y147.845 E.01646
G1 X139.801 Y143.947 E.16972
G1 X139.801 Y143.413 E.01646
G1 X143.699 Y147.31 E.16972
G1 X143.699 Y146.776 E.01646
G1 X139.801 Y142.879 E.16972
G1 X139.801 Y142.344 E.01646
G1 X143.699 Y146.241 E.16972
G1 X143.699 Y145.707 E.01646
G1 X139.801 Y141.81 E.16972
G2 X139.788 Y141.262 I-7.855 J-.082 E.01688
G1 X143.699 Y145.173 E.1703
G1 X143.699 Y144.638 E.01646
G1 X139.727 Y140.666 E.17296
G2 X139.59 Y139.995 I-4.894 J.648 E.02111
G1 X143.699 Y144.104 E.17892
G1 X143.699 Y143.569 E.01646
G1 X139.341 Y139.212 E.18976
G2 X138.838 Y138.175 I-6.94 J2.724 E.03554
G1 X143.868 Y143.205 E.21905
G1 X143.867 Y141.6 F42000
G1 F15000
G1 X125.89 Y123.623 E.78284
G1 X127.673 Y124.871 E.06701
G1 X143.665 Y140.864 E.69644
G2 X143.601 Y140.265 I-5.161 J.254 E.01856
G1 X129.455 Y126.12 E.616
G1 X131.238 Y127.368 E.06701
G1 X143.491 Y139.621 E.5336
G2 X143.344 Y138.939 I-4.914 J.704 E.02148
G1 X133.021 Y128.616 E.44956
G1 X134.803 Y129.864 E.06701
G1 X143.109 Y138.17 E.36169
G2 X142.757 Y137.284 I-10.316 J3.582 E.02937
G1 X136.586 Y131.112 E.26874
G1 X138.369 Y132.361 E.06701
G1 X142.614 Y136.606 E.18489
; WIPE_START
G1 F33600
G1 X141.2 Y135.192 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.619 Y141.932 Z1 F42000
G1 X127.295 Y161.368 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X112.301 Y146.375 E.65293
G1 X112.301 Y146.909 E.01646
G1 X126.591 Y161.199 E.62227
G1 X126.056 Y161.199 E.01646
G1 X112.301 Y147.444 E.599
G1 X112.301 Y147.978 E.01646
G1 X125.522 Y161.199 E.57573
G1 X124.987 Y161.199 E.01646
G1 X112.301 Y148.513 E.55245
G1 X112.301 Y149.047 E.01646
G1 X124.453 Y161.199 E.52918
G1 X123.918 Y161.199 E.01646
G1 X112.301 Y149.582 E.50591
G1 X112.301 Y150.116 E.01646
G1 X123.384 Y161.199 E.48263
G3 X122.844 Y161.193 I-.185 J-7.725 E.01664
G1 X112.306 Y150.655 E.45891
G2 X112.328 Y151.212 I5.412 J.059 E.01718
G1 X122.289 Y161.172 E.43376
G3 X121.697 Y161.115 I.27 J-5.905 E.0183
G1 X112.387 Y151.805 E.40546
G2 X112.487 Y152.439 I4.336 J-.358 E.01979
G1 X121.066 Y161.018 E.37362
G3 X120.384 Y160.871 I1.088 J-6.685 E.02149
G1 X112.632 Y153.119 E.33758
G2 X112.847 Y153.868 I4.826 J-.978 E.02402
G1 X119.629 Y160.651 E.29536
G3 X118.763 Y160.318 I2.458 J-7.706 E.02861
G1 X113.179 Y154.734 E.24316
G1 X113.199 Y154.788 E.00177
G2 X113.709 Y155.799 I8.978 J-3.892 E.03489
G1 X117.701 Y159.791 E.17383
G3 X115.359 Y157.984 I5.12 J-9.055 E.0914
G1 X114.092 Y156.717 E.05517
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X115.359 Y157.984 E-.68082
G1 X115.509 Y158.129 E-.07918
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/45
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S201.45
G17
G3 Z1 I.202 J1.2 P1  F42000
G1 X123.392 Y156.804 Z1
G1 Z.8
M73 P40 R12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.5 Y151.913 E.22946
G3 X116.647 Y147.44 I4.564 J-4.511 E.16468
G1 X116.647 Y134.649 E.4243
G3 X122.719 Y128.317 I6.352 J.013 E.32124
G3 X126.635 Y129.45 I.267 J6.407 E.13761
G1 X136.652 Y136.464 E.40567
G3 X139.353 Y141.652 I-3.689 J5.217 E.20149
G1 X139.353 Y147.44 E.19201
G3 X137.5 Y151.913 I-6.417 J-.038 E.16468
G1 X132.56 Y156.853 E.23173
G1 X123.44 Y156.853 E.30255
G1 X123.434 Y156.847 E.00027
G1 X123.594 Y156.452 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5700
G1 X118.783 Y151.641 E.20907
G3 X117.039 Y147.433 I4.279 J-4.237 E.14353
G1 X117.039 Y134.656 E.39259
G3 X122.74 Y128.708 I5.96 J.006 E.27952
G3 X126.416 Y129.775 I.247 J6.011 E.11967
G1 X136.422 Y136.782 E.37534
G3 X138.961 Y141.658 I-3.456 J4.899 E.1755
G1 X138.961 Y147.433 E.17743
G3 X137.217 Y151.641 I-6.022 J-.029 E.14353
G1 X132.398 Y156.461 E.20944
G1 X123.65 Y156.461 E.26879
M204 S6000
; WIPE_START
G1 F33600
G1 X122.229 Y155.053 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.328 Y147.715 Z1.2 F42000
G1 X133.556 Y115.462 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X133.452 Y115.335 E.00544
G3 X133.353 Y114.982 I.561 J-.348 E.01234
G1 X133.353 Y112.849 E.07075
G3 X133.557 Y112.356 I.682 J-.006 E.01817
G1 X135.382 Y110.531 E.08561
G2 X136.353 Y108.187 I-2.443 J-2.385 E.08625
G2 X136.287 Y105.989 I-16.927 J-.598 E.07299
G2 X128.509 Y99.147 I-7.792 J1.017 E.37517
G2 X125.639 Y99.552 I-.412 J7.468 E.09676
G2 X122.404 Y102.207 I2.469 J6.308 E.14116
G2 X120.969 Y105.57 I9.313 J5.959 E.12185
G2 X119.891 Y110.902 I67.156 J16.353 E.18048
G2 X125.066 Y122.498 I12.266 J1.479 E.44241
G1 X139.388 Y132.526 E.57996
G3 X144.147 Y141.67 I-6.421 J9.153 E.35537
G1 X144.147 Y150.492 E.29266
G3 X132.992 Y161.647 I-11.157 J-.002 E.58123
G1 X123.008 Y161.647 E.3312
G3 X111.853 Y150.492 I.013 J-11.168 E.58107
G1 X111.853 Y104.185 E1.53608
G3 X115.123 Y96.29 I11.202 J.015 E.29086
G1 X117.06 Y94.353 E.09088
G1 X138.94 Y94.353 E.72578
G1 X140.064 Y95.477 E.05273
G3 X141.994 Y97.593 I-12.239 J13.104 E.09511
G3 X144.147 Y104.185 I-9.083 J6.615 E.23388
G1 X144.147 Y111.987 E.2588
G3 X140.487 Y115.647 I-3.656 J.004 E.19076
G1 X134.022 Y115.647 E.21445
G3 X133.6 Y115.503 I-.01 J-.659 E.01512
G1 X133.259 Y115.714 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5700
G1 X133.127 Y115.553 E.00642
G3 X132.961 Y114.994 I.889 J-.569 E.01816
G1 X132.961 Y112.836 E.06631
G3 X133.27 Y112.088 I1.074 J.007 E.02548
G1 X135.097 Y110.261 E.0794
G2 X135.961 Y108.177 I-2.153 J-2.113 E.07105
G2 X135.898 Y106.04 I-16.51 J-.59 E.06575
G2 X128.503 Y99.539 I-7.403 J.966 E.33034
G2 X125.779 Y99.918 I-.404 J7.086 E.08506
G2 X122.729 Y102.426 I2.33 J5.942 E.12336
G2 X121.348 Y105.672 I8.98 J5.737 E.10889
G2 X120.281 Y110.949 I66.972 J16.293 E.16546
G2 X125.293 Y122.179 I11.877 J1.432 E.39689
G1 X139.617 Y132.208 E.53728
G3 X142.097 Y134.566 I-6.785 J9.62 E.10554
G1 X142.098 Y134.565 F42000
G1 F5700
G1 X142.44 Y135.026 E.01762
G1 F4800
G1 X142.555 Y135.194 E.00627
G1 F5700
G1 X142.757 Y135.501 E.01129
G1 F4800
G1 X142.864 Y135.676 E.00629
G1 F5700
G1 X143.149 Y136.172 E.01758
G1 X143.146 Y136.174 F42000
G1 F5700
G1 X143.408 Y136.682 E.01758
G1 F4800
G1 X143.562 Y137.016 E.01129
G1 F5700
G1 X143.643 Y137.204 E.00629
G1 F4800
G1 X143.779 Y137.545 E.01129
G1 F5700
G1 X144.032 Y138.28 E.02388
G1 X144.03 Y138.28 F42000
G1 F5700
G3 X144.539 Y141.665 I-11.152 J3.408 E.10554
G1 X144.539 Y150.497 E.2714
G3 X144.476 Y151.678 I-12.978 J-.109 E.03634
G1 X144.479 Y151.678 F42000
G1 F5700
G1 X144.404 Y152.264 E.01815
G1 F4800
G1 X144.368 Y152.47 E.00642
G1 F5700
G1 X144.164 Y153.418 E.02981
G1 X144.16 Y153.417 F42000
G1 F5700
G3 X143.804 Y154.543 I-11.573 J-3.039 E.03628
G1 X143.807 Y154.544 F42000
G1 F5700
G1 X143.501 Y155.282 E.02456
G1 F4800
G1 X143.337 Y155.626 E.01171
G1 F5700
G1 X142.958 Y156.33 E.02458
G1 X142.956 Y156.329 F42000
G1 F5700
G3 X138.83 Y160.457 I-10 J-5.871 E.18128
G1 X138.83 Y160.458 F42000
G1 F5700
G1 X138.312 Y160.743 E.01817
G1 F4800
G1 X138.126 Y160.837 E.00641
G1 F5700
G1 X137.591 Y161.086 E.01813
G1 X137.589 Y161.082 F42000
G1 F5700
G1 X137.044 Y161.307 E.01813
G1 F4800
G1 X136.685 Y161.434 E.0117
G1 F5700
G1 X135.918 Y161.664 E.0246
G1 F4800
G1 X135.549 Y161.753 E.01167
G1 F5700
G1 X134.763 Y161.904 E.02457
G1 X134.762 Y161.893 F42000
G1 F5700
G3 X132.997 Y162.039 I-2 J-13.438 E.05445
G1 X123.003 Y162.039 E.30711
G3 X122.41 Y162.021 I.109 J-12.978 E.01821
G1 X121.822 Y161.979 E.01813
G1 X121.822 Y161.979 F42000
G1 F5700
G1 X121.236 Y161.904 E.01815
G1 F4800
G1 X121.03 Y161.868 E.00642
G1 F5700
G1 X120.081 Y161.664 E.02981
G1 X120.083 Y161.66 F42000
G1 F5700
G3 X118.957 Y161.304 I3.039 J-11.573 E.03628
G1 X118.956 Y161.307 F42000
G1 F5700
G1 X118.218 Y161.001 E.02456
G1 F4800
G1 X117.874 Y160.837 E.0117
G1 F5700
G1 X117.687 Y160.743 E.00643
G1 F4800
G1 X117.352 Y160.561 E.01171
G1 F5700
G1 X116.668 Y160.147 E.02458
G1 X116.669 Y160.145 F42000
G1 F5700
G3 X113.043 Y156.33 I6.349 J-9.665 E.16317
G1 X113.042 Y156.33 F42000
G1 F5700
G1 X112.757 Y155.812 E.01818
G1 F4800
G1 X112.663 Y155.626 E.00641
G1 F5700
G1 X112.414 Y155.091 E.01813
G1 X112.416 Y155.09 F42000
G1 F5700
G3 X111.461 Y150.497 I10.723 J-4.626 E.14514
G1 X111.461 Y104.18 E1.42319
G3 X111.599 Y102.415 I12.144 J.061 E.05447
G1 X111.596 Y102.414 F42000
G1 F5700
G1 X111.702 Y101.833 E.01816
G1 F4800
G1 X111.747 Y101.629 E.00641
G1 F5700
G1 X111.836 Y101.26 E.01167
G1 X111.838 Y101.26 F42000
G1 F5700
G3 X112.269 Y99.939 I11.424 J3 E.04273
G1 X112.268 Y99.939 F42000
G1 F5700
G1 X112.499 Y99.395 E.01813
G1 F4800
G1 X112.663 Y99.052 E.01171
G1 F5700
G1 X113.043 Y98.347 E.0246
G1 X113.047 Y98.35 F42000
G1 F5700
G3 X114.437 Y96.449 I10.435 J6.169 E.07247
G1 X114.434 Y96.446 F42000
G1 F5700
G1 X114.842 Y96.016 E.01821
G1 F4800
G1 X116.898 Y93.961 E.08933
G1 X139.102 Y93.961 E.68227
G1 X139.722 Y94.58 E.02692
G1 F5700
G1 X140.341 Y95.199 E.02692
G3 X142.311 Y97.361 I-12.497 J13.365 E.08995
G3 X142.647 Y97.846 I-9.311 J6.815 E.01813
G1 X142.647 Y97.846 F42000
G1 F5700
G1 X142.958 Y98.348 E.01817
G1 F4800
G1 X143.061 Y98.53 E.00641
G1 F5700
G1 X143.243 Y98.865 E.0117
G1 F4800
G1 X143.337 Y99.052 E.00643
G1 F5700
G1 X143.586 Y99.587 E.01813
G1 X143.582 Y99.588 F42000
G1 F5700
G1 X143.807 Y100.134 E.01813
G1 F4800
G1 X143.934 Y100.493 E.01171
G1 F5700
G1 X144.164 Y101.259 E.02458
G1 X144.161 Y101.26 F42000
G1 F5700
G3 X144.539 Y104.18 I-11.46 J2.971 E.09072
G1 X144.539 Y111.996 E.24014
G3 X144.48 Y112.672 I-4.543 J-.061 E.02089
G1 X144.483 Y112.673 F42000
G1 F5700
G1 X144.412 Y113.005 E.01044
G1 F4800
G1 X144.377 Y113.128 E.00391
G1 F5700
G1 X144.27 Y113.448 E.01038
G1 X144.267 Y113.447 F42000
G1 F5700
G1 X144.136 Y113.758 E.01038
G1 F4800
G1 X144.039 Y113.944 E.00645
G1 F5700
G1 X143.792 Y114.341 E.01436
G1 X143.787 Y114.338 F42000
G1 F5700
G3 X142.838 Y115.289 I-3.442 J-2.486 E.04145
G1 X142.841 Y115.292 F42000
G1 F5700
G1 X142.556 Y115.477 E.01044
G1 F4800
G1 X142.444 Y115.539 E.00391
G1 F5700
G1 X142.142 Y115.69 E.01039
G1 X142.14 Y115.686 F42000
G1 F5700
G1 X141.828 Y115.814 E.01038
G1 F4800
G1 X141.628 Y115.877 E.00645
G1 F5700
G1 X141.173 Y115.983 E.01435
G1 X141.173 Y115.982 F42000
G1 F5700
G3 X140.496 Y116.039 I-.674 J-3.958 E.0209
G1 X134.008 Y116.039 E.19935
G3 X133.326 Y115.783 I.009 J-1.056 E.02285
G1 X133.301 Y115.757 E.00109
M204 S6000
; WIPE_START
G1 F33600
G1 X133.127 Y115.553 E-.10213
G1 X133.027 Y115.363 E-.0816
G1 X132.972 Y115.152 E-.08287
G1 X132.961 Y114.994 E-.0602
G1 X132.961 Y113.854 E-.43319
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z1.2 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z1.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.2 F4000
            G39.3 S1
            G0 Z1.2 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z1.6 F42000
G1 X128.444 Y125.289
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X129.778 Y126.222 E.05401
G1 X126.835 Y129.165 E.13804
G1 X131.35 Y132.326 E.18283
G1 X134.292 Y129.384 E.13804
G1 X135.626 Y130.318 E.05401
; WIPE_START
G1 F33600
G1 X134.292 Y129.384 E-.61876
G1 X134.029 Y129.647 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X126.592 Y131.359 Z1.2 F42000
G1 X116.367 Y133.713 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15476.087
G3 X116.794 Y132.146 I16.557 J3.669 E.05391
G1 X112.201 Y127.553 E.21546
G1 X112.201 Y128.447 E.02967
G1 X121.451 Y119.197 E.43395
G2 X125.263 Y123.061 I10.83 J-6.87 E.18142
G1 X119.128 Y129.196 E.28782
G2 X117.528 Y130.796 I4.681 J6.281 E.0753
G1 X112.201 Y136.123 E.2499
G1 X112.201 Y135.229 E.02967
G1 X116.299 Y139.327 E.19225
G1 X116.299 Y139.701 E.0124
G1 X112.201 Y143.799 E.19225
G1 X112.201 Y142.905 E.02967
G1 X116.299 Y147.003 E.19225
G1 X116.299 Y147.377 E.0124
G1 X112.245 Y151.431 E.19021
G3 X112.203 Y150.583 I8.258 J-.826 E.02818
G1 X122.917 Y161.297 E.50259
G2 X125.405 Y161.299 I1.292 J-48.587 E.08254
G1 X129.503 Y157.201 E.19225
G1 X126.497 Y157.201 E.09971
G1 X130.595 Y161.299 E.19225
G2 X133.084 Y161.295 I1.195 J-32.834 E.08259
G1 X143.797 Y150.583 E.50253
G3 X143.755 Y151.431 I-8.3 J.022 E.02818
G1 X139.701 Y147.377 E.19021
G1 X139.701 Y147.003 E.0124
G1 X143.799 Y142.905 E.19225
G1 X143.799 Y143.799 E.02967
G1 X139.247 Y139.247 E.21355
G3 X139.386 Y139.642 I-2.726 J1.177 E.01391
G1 X142.496 Y136.532 E.14592
G2 X138.807 Y132.545 I-9.65 J5.229 E.18207
G1 X135.864 Y135.488 E.13804
G1 X134.607 Y134.607 E.0509
G1 X112.201 Y112.201 E1.05113
G1 X112.201 Y113.095 E.02967
G1 X121.004 Y104.292 E.41299
G3 X121.646 Y102.798 I12.767 J4.603 E.05396
G1 X120.295 Y106.911 F42000
G1 F15476.087
G3 X120.681 Y105.33 I18.594 J3.707 E.05402
G1 X113.832 Y98.48 E.32132
G3 X117.205 Y94.701 I17.896 J12.576 E.1684
G1 X117.729 Y94.701 E.01739
G1 X123.473 Y100.445 E.26947
G3 X126.313 Y98.983 I4.431 J5.119 E.10695
G1 X130.595 Y94.701 E.2009
G1 X133.081 Y94.701 E.08245
G1 X143.799 Y105.419 E.50282
G1 X143.799 Y104.525 E.02967
G1 X133.701 Y114.623 E.47373
G3 X133.708 Y112.784 I10.953 J-.88 E.06107
G3 X133.822 Y112.583 I.371 J.079 E.0078
G1 X134.717 Y111.689 E.04196
G1 X138.327 Y115.299 E.16937
G2 X140.711 Y115.289 I1.077 J-28.402 E.07909
G1 X143.789 Y112.211 E.14443
G3 X143.655 Y112.951 I-5.786 J-.668 E.02498
G1 X136.63 Y105.926 E.32955
M73 P41 R12
G2 X136.27 Y104.379 I-15.365 J2.764 E.05274
G1 X142.166 Y98.482 E.27664
G2 X139.817 Y95.723 I-10.615 J6.659 E.12063
G1 X138.795 Y94.701 E.04793
G1 X138.271 Y94.701 E.01739
G1 X132.895 Y100.077 E.25223
G2 X129.574 Y98.87 I-4.456 J7.085 E.11811
G1 X125.405 Y94.701 E.19557
G1 X122.919 Y94.701 E.08245
G1 X112.201 Y105.419 E.50282
G1 X112.201 Y104.525 E.02967
G1 X119.471 Y111.795 E.34108
G2 X119.51 Y113.462 I11.722 J.56 E.05534
G1 X112.201 Y120.771 E.3429
G1 X112.201 Y119.877 E.02967
G1 X120.695 Y128.371 E.39848
G3 X122.278 Y128.008 I2.858 J8.821 E.05393
; WIPE_START
G1 F33600
G1 X121.586 Y128.112 E-.26575
G1 X120.695 Y128.371 E-.35259
G1 X120.432 Y128.108 E-.14166
; WIPE_END
G1 E-.04 F1800
G1 X119.656 Y135.7 Z1.2 F42000
G1 X117.214 Y159.612 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15476.087
G2 X118.649 Y160.379 I7.188 J-11.73 E.05399
G1 X122.561 Y156.467 E.18352
G1 X118.723 Y152.629 E.18005
G1 X114.371 Y156.981 E.20416
G3 X113.492 Y155.612 I10.55 J-7.749 E.05399
; WIPE_START
G1 F33600
G1 X114.371 Y156.981 E-.61808
G1 X114.635 Y156.716 E-.14192
; WIPE_END
G1 E-.04 F1800
G1 X122.262 Y156.414 Z1.2 F42000
G1 X142.508 Y155.612 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15476.087
G3 X141.627 Y156.979 I-8.94 J-4.791 E.05401
G1 X137.277 Y152.629 E.2041
G1 X133.439 Y156.467 E.18005
G1 X137.351 Y160.379 E.18352
G2 X138.786 Y159.614 I-7.166 J-15.179 E.05397
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P41 R11
G1 F33600
G1 X137.351 Y160.379 E-.61804
G1 X137.087 Y160.115 E-.14196
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/45
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
G17
G3 Z1.2 I.297 J-1.18 P1  F42000
G1 X123.435 Y156.685 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X118.582 Y151.831 E.22769
G3 X116.763 Y147.44 I4.445 J-4.413 E.16172
G1 X116.763 Y134.649 E.4243
G3 X122.688 Y128.434 I6.236 J.013 E.31418
G3 X126.568 Y129.545 I.317 J6.229 E.13635
G1 X136.586 Y136.559 E.40567
G3 X139.237 Y141.652 I-3.623 J5.122 E.19781
G1 X139.237 Y147.44 E.19202
G3 X137.418 Y151.831 I-6.264 J-.022 E.16172
G1 X132.512 Y156.737 E.23014
G1 X123.488 Y156.737 E.29937
G1 X123.478 Y156.727 E.00047
G1 X123.649 Y156.344 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5700
G1 X118.864 Y151.559 E.20794
G3 X117.155 Y147.433 I4.162 J-4.141 E.14079
G1 X117.155 Y134.656 E.39259
G3 X122.709 Y128.825 I5.844 J.006 E.27297
G3 X126.349 Y129.87 I.295 J5.837 E.11851
G1 X136.356 Y136.876 E.37534
G3 X138.845 Y141.658 I-3.391 J4.804 E.17209
G1 X138.845 Y147.433 E.17743
G3 X137.136 Y151.559 I-5.872 J-.015 E.14079
G1 X132.35 Y156.345 E.20797
G1 X123.709 Y156.345 E.26551
M204 S6000
; WIPE_START
G1 F33600
G1 X122.286 Y154.94 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.365 Y147.596 Z1.4 F42000
G1 X133.447 Y115.512 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X133.358 Y115.406 E.00461
G3 X133.237 Y114.978 I.651 J-.415 E.01496
G1 X133.237 Y112.848 E.07066
G3 X133.475 Y112.275 I.798 J-.005 E.02113
G1 X135.3 Y110.45 E.08564
G2 X136.237 Y108.187 I-2.362 J-2.304 E.08322
G2 X136.172 Y105.996 I-16.736 J-.598 E.07278
G2 X128.51 Y99.263 I-7.682 J1.016 E.3693
G2 X125.68 Y99.66 I-.411 J7.359 E.0954
G2 X122.499 Y102.271 I2.378 J6.138 E.13884
G2 X121.086 Y105.582 I9.219 J5.894 E.11994
G2 X120.006 Y110.916 I66.969 J16.334 E.18057
G2 X125.132 Y122.404 I12.152 J1.465 E.43828
G1 X139.454 Y132.432 E.57996
G3 X144.263 Y141.67 I-6.488 J9.248 E.35904
G1 X144.263 Y150.492 E.29266
G3 X132.992 Y161.763 I-11.286 J-.015 E.58704
G1 X123.008 Y161.763 E.33121
G3 X111.737 Y150.492 I-.001 J-11.269 E.58728
G1 X111.737 Y104.185 E1.53609
G3 X115.041 Y96.208 I11.289 J.003 E.29391
G1 X117.012 Y94.237 E.09246
G1 X138.988 Y94.237 E.72895
G1 X140.959 Y96.208 E.09247
G3 X144.263 Y104.185 I-7.985 J7.98 E.2939
G1 X144.263 Y111.987 E.25881
G3 X140.488 Y115.763 I-3.772 J.003 E.19677
G1 X134.022 Y115.763 E.21449
G3 X133.506 Y115.577 I-.013 J-.771 E.0186
G1 X133.488 Y115.557 E.00089
G1 X133.13 Y115.757 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5700
G3 X132.986 Y115.552 I.875 J-.764 E.00773
G1 X132.986 Y115.552 F42000
G1 F5700
G1 X132.918 Y115.404 E.00501
G1 F4800
G1 X132.891 Y115.316 E.00282
G1 F5700
G1 X132.845 Y114.992 E.01004
G1 X132.845 Y112.835 E.06628
G3 X133.188 Y112.007 I1.19 J.008 E.02825
G1 X135.016 Y110.18 E.07941
G2 X135.845 Y108.177 I-2.071 J-2.031 E.06826
G2 X135.783 Y106.047 I-16.319 J-.59 E.06553
G2 X128.503 Y99.655 I-7.293 J.965 E.32493
G2 X125.819 Y100.026 I-.403 J6.977 E.08379
G2 X122.824 Y102.491 I2.239 J5.773 E.12121
G2 X121.464 Y105.684 I8.885 J5.671 E.10713
G2 X120.395 Y110.963 I66.786 J16.274 E.16554
G2 X125.36 Y122.084 I11.762 J1.418 E.39305
G1 X139.683 Y132.114 E.53728
G3 X144.655 Y141.665 I-6.718 J9.567 E.34385
G1 X144.655 Y150.497 E.2714
G3 X144.64 Y151.092 I-11.674 J.001 E.01828
G1 X144.595 Y151.683 E.01821
G1 F4800
G1 X144.562 Y151.951 E.00831
G1 F5700
G1 X144.415 Y152.852 E.02806
G1 X144.412 Y152.852 F42000
G1 F5700
G1 X144.28 Y153.43 E.01822
G1 F4800
G1 X144.208 Y153.69 E.00829
G1 F5700
G1 X144.032 Y154.255 E.01819
G1 X144.029 Y154.254 F42000
G1 F5700
G3 X143.592 Y155.354 I-11.719 J-4.023 E.03638
G1 X143.595 Y155.355 F42000
G1 F5700
G1 X143.334 Y155.887 E.01819
G1 F4800
G1 X143.181 Y156.17 E.00988
G1 F5700
G1 X142.735 Y156.908 E.02651
G1 X142.73 Y156.905 F42000
G1 F5700
G3 X139.406 Y160.232 I-9.915 J-6.582 E.14546
G1 X139.408 Y160.235 F42000
G1 F5700
G1 X138.905 Y160.548 E.01822
G1 F4800
G1 X138.67 Y160.681 E.00829
G1 F5700
G1 X138.145 Y160.956 E.01819
G1 X138.144 Y160.954 F42000
G1 F5700
G3 X137.057 Y161.422 I-5.442 J-11.132 E.03638
G1 X137.058 Y161.425 F42000
G1 F5700
G1 X136.498 Y161.617 E.01819
G1 F4800
G1 X136.19 Y161.708 E.00988
G1 F5700
G1 X135.352 Y161.915 E.02651
G1 X135.352 Y161.914 F42000
G1 F5700
G3 X132.997 Y162.155 I-2.353 J-11.378 E.07286
G1 X123.003 Y162.155 E.30711
G3 X121.232 Y162.01 I.185 J-13.11 E.05463
G1 X120.648 Y161.915 E.01819
G1 X120.648 Y161.915 F42000
G1 F5700
G1 X120.07 Y161.78 E.01822
G1 F4800
G1 X119.81 Y161.708 E.00829
G1 F5700
G1 X118.942 Y161.425 E.02807
G1 X118.942 Y161.424 F42000
G1 F5700
G3 X117.33 Y160.681 I4.079 J-10.981 E.05458
G1 X117.33 Y160.681 F42000
G1 F5700
G1 X116.591 Y160.234 E.02653
G1 F4800
G1 X116.327 Y160.053 E.00986
G1 F5700
G1 X115.637 Y159.535 E.02651
G1 X115.639 Y159.533 F42000
G1 F5700
G3 X113.266 Y156.908 I7.408 J-9.082 E.10913
G1 X113.266 Y156.909 F42000
G1 F5700
G1 X112.952 Y156.405 E.01824
G1 F4800
G1 X112.819 Y156.17 E.00829
G1 F5700
G1 X112.544 Y155.645 E.01819
G1 X112.546 Y155.644 F42000
G1 F5700
G3 X112.078 Y154.557 I11.132 J-5.442 E.03638
G1 X112.075 Y154.558 F42000
G1 F5700
G1 X111.883 Y153.998 E.01819
G1 F4800
G1 X111.792 Y153.69 E.00988
G1 F5700
G1 X111.585 Y152.852 E.02653
G1 F4800
G1 X111.527 Y152.536 E.00985
G1 F5700
G1 X111.405 Y151.682 E.02651
G1 X111.406 Y151.682 F42000
G1 F5700
G3 X111.345 Y150.497 I11.415 J-1.179 E.03647
G1 X111.345 Y104.18 E1.42319
G3 X111.592 Y101.827 I13.111 J.185 E.07282
G1 X111.585 Y101.825 F42000
G1 F5700
G1 X111.72 Y101.248 E.01822
G1 F4800
G1 X111.792 Y100.988 E.00829
G1 F5700
G1 X111.968 Y100.422 E.01819
G1 X111.971 Y100.423 F42000
G1 F5700
G3 X112.408 Y99.324 I11.719 J4.023 E.03638
G1 X112.405 Y99.322 F42000
G1 F5700
G1 X112.666 Y98.791 E.01819
G1 F4800
G1 X112.819 Y98.508 E.00988
G1 F5700
G1 X113.265 Y97.77 E.02649
G1 X113.268 Y97.772 F42000
G1 F5700
G3 X114.353 Y96.367 I10.015 J6.612 E.05459
G1 X114.351 Y96.366 F42000
G1 F5700
G1 X114.761 Y95.934 E.01828
G1 F4800
G1 X116.85 Y93.845 E.09079
G1 X139.15 Y93.845 E.68521
G1 X140.195 Y94.89 E.0454
G1 F5700
G1 X140.478 Y95.173 E.01229
G1 X140.478 Y95.173 F42000
G1 F5700
G1 X141.239 Y95.934 E.03311
G3 X142.032 Y96.817 I-9.345 J9.19 E.03647
G1 X142.035 Y96.815 F42000
G1 F5700
G1 X142.397 Y97.284 E.01821
G1 F4800
G1 X142.553 Y97.505 E.0083
G1 F5700
G1 X143.048 Y98.273 E.02809
G1 X143.046 Y98.274 F42000
G1 F5700
G3 X143.827 Y99.867 I-10.106 J5.939 E.05456
G1 X143.827 Y99.867 F42000
G1 F5700
G1 X144.117 Y100.679 E.0265
G1 F4800
G1 X144.208 Y100.988 E.00988
G1 F5700
G1 X144.415 Y101.826 E.02653
G1 F4800
G1 X144.473 Y102.141 E.00985
G1 F5700
G1 X144.595 Y102.995 E.02651
G1 X144.594 Y102.995 F42000
G1 F5700
G3 X144.655 Y104.18 I-11.415 J1.179 E.03647
G1 X144.655 Y111.996 E.24014
G3 X140.496 Y116.155 I-4.164 J-.005 E.20069
G1 X134.008 Y116.155 E.19936
G3 X133.171 Y115.801 I-.002 J-1.162 E.02868
M204 S6000
; WIPE_START
G1 F33600
G1 X132.986 Y115.552 E-.11791
G1 X132.986 Y115.552 E-.00017
G1 X132.918 Y115.404 E-.06191
G1 X132.891 Y115.316 E-.03485
G1 X132.845 Y114.992 E-.12418
G1 X132.845 Y113.885 E-.42098
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z1.4 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z1.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.4 F4000
            G39.3 S1
            G0 Z1.4 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z1.8 F42000
G1 X121.871 Y102.634
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X121.187 Y104.109 I12.097 J6.506 E.05396
G1 X112.085 Y113.211 E.42698
G1 X112.085 Y112.085 E.03733
G1 X135.078 Y135.078 E1.07861
G1 X135.781 Y135.57 E.0285
G1 X138.89 Y132.462 E.14582
G3 X142.581 Y136.447 I-6.03 J9.287 E.18204
G1 X139.294 Y139.734 E.15419
; WIPE_START
G1 F33600
G1 X140.708 Y138.319 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.266 Y134.227 Z1.4 F42000
G1 X129.933 Y131.475 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15476.087
G1 X131.267 Y132.409 E.05401
G1 X134.375 Y129.301 E.14582
G1 X129.86 Y126.14 E.18283
G1 X126.752 Y129.248 E.14584
G2 X120.786 Y128.462 I-3.766 J5.554 E.20697
G1 X112.085 Y119.761 E.40817
G1 X112.085 Y120.887 E.03733
G1 X119.615 Y113.357 E.35325
G3 X119.583 Y111.907 I11.646 J-.982 E.04811
M73 P42 R11
G1 X112.085 Y104.409 E.35175
G1 X112.085 Y105.535 E.03733
G1 X123.035 Y94.585 E.51365
G1 X125.289 Y94.585 E.07479
G1 X129.713 Y99.01 E.20754
G3 X132.811 Y100.161 I-1.252 J8.112 E.11038
G1 X138.387 Y94.585 E.26156
G1 X138.843 Y94.585 E.01515
G3 X142.249 Y98.399 I-14.583 J16.449 E.16999
G1 X136.177 Y104.471 E.28482
G3 X136.49 Y105.787 I-8.134 J2.63 E.04492
G1 X143.748 Y113.044 E.34045
G2 X143.91 Y112.09 I-4.501 J-1.257 E.03215
G1 X140.59 Y115.41 E.15575
G3 X138.442 Y115.415 I-1.129 J-25.863 E.07126
G1 X134.635 Y111.607 E.17862
G2 X133.663 Y112.593 I4.885 J5.788 E.046
G2 X133.585 Y112.876 I.412 J.265 E.00987
G1 X133.585 Y114.739 E.06179
G1 X143.915 Y104.409 E.48456
G1 X143.915 Y105.535 E.03733
G1 X132.965 Y94.585 E.51365
G1 X130.711 Y94.585 E.07479
G1 X126.154 Y99.142 E.21378
G2 X123.555 Y100.527 I1.761 J6.436 E.09849
G1 X117.613 Y94.585 E.27874
G1 X117.157 Y94.585 E.01515
G2 X113.746 Y98.394 I14.958 J16.824 E.16996
G1 X120.776 Y105.424 E.32979
G2 X120.392 Y107.006 I18.329 J5.295 E.05402
G1 X116.473 Y133.806 F42000
G1 F15476.087
G3 X116.883 Y132.235 I13.15 J2.59 E.0539
G1 X112.085 Y127.437 E.22505
G1 X112.085 Y128.563 E.03733
G1 X121.535 Y119.113 E.4433
G2 X125.346 Y122.978 I10.767 J-6.804 E.18144
G1 X112.085 Y136.239 E.62207
G1 X112.085 Y135.113 E.03733
G1 X116.415 Y139.442 E.20309
G1 X116.415 Y139.585 E.00474
G1 X112.085 Y143.915 E.20309
G1 X112.085 Y142.789 E.03733
G1 X116.415 Y147.118 E.20309
G1 X116.415 Y147.261 E.00474
G1 X112.137 Y151.539 E.20067
G3 X112.085 Y150.465 I15.751 J-1.293 E.03567
G1 X123.035 Y161.415 E.51365
G1 X125.289 Y161.415 E.07479
G1 X129.618 Y157.085 E.20309
G1 X126.382 Y157.085 E.10737
G1 X130.711 Y161.415 E.20309
G1 X132.965 Y161.415 E.07479
G1 X143.915 Y150.465 E.51365
G3 X143.856 Y151.532 I-12.395 J-.14 E.03546
G1 X139.585 Y147.261 E.20036
G1 X139.585 Y147.118 E.00474
G1 X143.915 Y142.789 E.20309
G1 X143.915 Y143.915 E.03733
G1 X139.036 Y139.036 E.22887
G2 X138.209 Y137.638 I-11.652 J5.949 E.05391
; WIPE_START
G1 F33600
G1 X138.793 Y138.531 E-.40551
G1 X139.036 Y139.036 E-.21281
G1 X139.3 Y139.3 E-.14168
; WIPE_END
G1 E-.04 F1800
G1 X139.139 Y146.93 Z1.4 F42000
G1 X138.871 Y159.697 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15476.087
G3 X137.438 Y160.466 I-8.767 J-14.608 E.05397
G1 X133.357 Y156.385 E.19146
G1 X137.195 Y152.547 E.18005
G1 X141.715 Y157.066 E.21201
G2 X142.593 Y155.698 I-14.381 J-10.199 E.05398
; WIPE_START
G1 F33600
G1 X141.715 Y157.066 E-.61809
G1 X141.45 Y156.802 E-.14191
; WIPE_END
G1 E-.04 F1800
G1 X133.824 Y156.502 Z1.4 F42000
G1 X113.406 Y155.697 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15476.087
G2 X114.29 Y157.062 I10.875 J-6.068 E.05399
G1 X118.805 Y152.547 E.21182
G1 X122.643 Y156.385 E.18005
G1 X118.562 Y160.466 E.19146
G3 X117.13 Y159.695 I5.583 J-12.081 E.05399
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X118.562 Y160.466 E-.61813
G1 X118.826 Y160.202 E-.14187
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/45
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
G17
G3 Z1.4 I.749 J.959 P1  F42000
G1 X123.479 Y156.565 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X118.663 Y151.75 E.22591
G3 X116.878 Y147.44 I4.359 J-4.33 E.15871
G1 X116.878 Y134.649 E.42431
G3 X122.657 Y128.551 I6.121 J.013 E.30711
G3 X126.502 Y129.639 I.346 J6.118 E.13504
G1 X136.52 Y136.654 E.40568
G3 X139.122 Y141.651 I-3.557 J5.028 E.19412
G1 X139.122 Y147.44 E.19202
G3 X137.337 Y151.75 I-6.144 J-.02 E.15871
G1 X132.465 Y156.622 E.22856
G1 X123.535 Y156.622 E.2962
G1 X123.521 Y156.608 E.00065
G1 X123.698 Y156.23 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5700
G1 X118.946 Y151.478 E.2065
G3 X117.27 Y147.433 I4.076 J-4.058 E.138
G1 X117.27 Y134.656 E.39259
G3 X122.678 Y128.943 I5.729 J.006 E.26644
G3 X126.283 Y129.964 I.325 J5.726 E.1173
G1 X136.289 Y136.971 E.37534
G3 X138.73 Y141.658 I-3.324 J4.709 E.16868
G1 X138.73 Y147.433 E.17743
G3 X137.054 Y151.478 I-5.751 J-.013 E.138
G1 X132.302 Y156.23 E.2065
G1 X123.758 Y156.23 E.26255
M204 S6000
; WIPE_START
G1 F33600
G1 X122.335 Y154.824 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.396 Y147.476 Z1.6 F42000
G1 X133.347 Y115.572 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X133.122 Y114.979 I.678 J-.597 E.0215
G1 X133.122 Y112.848 E.07071
G3 X133.392 Y112.194 I.914 J-.004 E.0241
G1 X135.219 Y110.368 E.08566
G2 X136.122 Y108.187 I-2.28 J-2.222 E.0802
G2 X136.056 Y106.003 I-16.546 J-.599 E.07256
G2 X128.51 Y99.378 I-7.567 J1.01 E.36351
G2 X125.72 Y99.768 I-.41 J7.25 E.09403
G2 X122.595 Y102.336 I2.389 J6.092 E.13641
G2 X121.197 Y105.611 I9.121 J5.829 E.11866
G2 X120.12 Y110.929 I67.057 J16.346 E.18004
G2 X125.198 Y122.309 I12.037 J1.452 E.43414
G1 X139.52 Y132.337 E.57997
G3 X144.378 Y141.67 I-6.554 J9.342 E.36272
G1 X144.378 Y150.492 E.29267
G3 X132.992 Y161.878 I-11.388 J-.002 E.59325
G1 X123.008 Y161.878 E.33121
G3 X111.622 Y150.492 I0 J-11.386 E.59328
G1 X111.622 Y104.185 E1.53609
G3 X114.96 Y96.127 I11.434 J.015 E.29687
G1 X116.965 Y94.122 E.09405
G1 X139.035 Y94.122 E.73213
G1 X139.759 Y94.846 E.03396
G3 X141.441 Y96.548 I-32.845 J34.126 E.0794
G3 X144.378 Y104.185 I-8.504 J7.654 E.27757
G1 X144.378 Y111.988 E.25882
G3 X140.488 Y115.878 I-3.884 J.006 E.20282
G1 X133.912 Y115.872 E.21813
G3 X133.388 Y115.616 I.113 J-.896 E.0197
G1 X133.045 Y115.835 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5700
G3 X132.73 Y114.993 I.959 J-.84 E.02824
G1 X132.73 Y112.835 E.0663
G3 X133.106 Y111.925 I1.306 J.008 E.03102
G1 X134.934 Y110.098 E.07942
G2 X135.73 Y108.177 I-1.989 J-1.949 E.06547
G2 X135.667 Y106.054 I-16.129 J-.59 E.06531
G2 X128.503 Y99.77 I-7.178 J.958 E.31958
G2 X125.86 Y100.134 I-.402 J6.867 E.08252
G2 X122.92 Y102.555 I2.25 J5.727 E.11897
G2 X121.576 Y105.713 I8.788 J5.606 E.10595
G2 X120.51 Y110.976 I66.874 J16.286 E.16505
G2 X125.426 Y121.99 I11.648 J1.405 E.38922
G1 X139.749 Y132.019 E.53728
G3 X144.77 Y141.665 I-6.784 J9.661 E.34725
G1 X144.77 Y150.497 E.2714
G3 X144.752 Y151.094 I-13.236 J-.11 E.01834
G1 X144.71 Y151.686 E.01825
G1 X144.71 Y151.686 F42000
G1 F5700
G1 X144.635 Y152.276 E.01827
G1 F4800
G1 X144.579 Y152.603 E.01019
G1 F5700
G1 X144.397 Y153.44 E.02633
G1 X144.395 Y153.44 F42000
G1 F5700
G3 X142.823 Y156.984 I-11.413 J-2.943 E.1197
G1 X142.823 Y156.984 F42000
G1 F5700
G1 X142.483 Y157.472 E.01827
G1 F4800
G1 X142.324 Y157.68 E.00804
G1 F5700
G1 X141.732 Y158.392 E.02845
G1 X141.729 Y158.39 F42000
G1 F5700
G3 X140.891 Y159.231 I-8.998 J-8.135 E.0365
G1 X140.892 Y159.232 F42000
G1 F5700
G1 X140.441 Y159.62 E.01827
G1 F4800
G1 X140.18 Y159.824 E.01019
G1 F5700
G1 X139.484 Y160.323 E.0263
G1 X139.482 Y160.319 F42000
G1 F5700
G3 X137.072 Y161.54 I-6.565 J-9.977 E.08319
G1 X136.511 Y161.734 E.01825
G1 X136.511 Y161.734 F42000
G1 F5700
G1 X135.939 Y161.897 E.01825
G1 F4800
G1 X135.684 Y161.958 E.00805
G1 F5700
G1 X134.776 Y162.135 E.02845
G1 X134.774 Y162.127 F42000
G1 F5700
G3 X132.997 Y162.27 I-1.948 J-13.05 E.05482
G1 X123.003 Y162.27 E.30711
G3 X121.814 Y162.207 I.11 J-13.236 E.03659
G1 X121.814 Y162.21 F42000
G1 F5700
G1 X121.224 Y162.135 E.01827
G1 F4800
G1 X120.897 Y162.079 E.01019
G1 F5700
G1 X120.06 Y161.897 E.02633
G1 X120.06 Y161.895 F42000
G1 F5700
G3 X116.516 Y160.323 I2.943 J-11.413 E.1197
G1 X116.516 Y160.323 F42000
G1 F5700
G1 X116.028 Y159.983 E.01827
G1 F4800
G1 X115.82 Y159.824 E.00803
G1 F5700
G1 X115.108 Y159.232 E.02845
G1 X115.109 Y159.23 F42000
G1 F5700
G3 X111.604 Y153.44 I7.895 J-8.737 E.21097
G1 X111.469 Y152.861 E.01828
G1 X111.469 Y152.861 F42000
G1 F5700
G1 X111.364 Y152.275 E.01827
G1 F4800
G1 X111.33 Y152.016 E.00804
G1 F5700
G1 X111.245 Y151.094 E.02845
G1 X111.248 Y151.094 F42000
G1 F5700
G3 X111.23 Y150.497 I13.001 J-.697 E.01834
G1 X111.23 Y104.18 E1.42319
G3 X111.366 Y102.402 I12.219 J.044 E.05485
G1 X111.365 Y102.402 F42000
G1 F5700
G1 X111.469 Y101.816 E.01828
G1 F4800
G1 X111.542 Y101.493 E.01018
G1 F5700
G1 X111.766 Y100.667 E.0263
G1 X111.768 Y100.668 F42000
G1 F5700
G3 X114.269 Y96.286 I11.312 J3.551 E.15621
G1 X114.268 Y96.285 F42000
G1 F5700
G1 X114.679 Y95.853 E.01834
G1 F4800
G1 X116.802 Y93.73 E.09227
G1 X139.198 Y93.73 E.68815
G1 F5700
G1 X139.481 Y94.012 E.01229
G1 X139.481 Y94.012 F42000
G1 F5700
G1 X140.037 Y94.568 E.02416
G3 X141.732 Y96.285 I-33.122 J34.406 E.07416
G3 X144.77 Y104.18 I-8.797 J7.917 E.26581
G1 X144.77 Y111.996 E.24014
G3 X140.496 Y116.27 I-4.276 J-.002 E.2063
G1 X134.406 Y116.27 E.18711
G1 X134.006 Y116.27 E.01229
G1 F4800
G1 X133.883 Y116.263 E.0038
G1 F5640.14
G1 X133.717 Y116.238 E.00516
G1 F4800
G1 X133.665 Y116.224 E.00165
G1 F5700
G1 X133.555 Y116.189 E.00355
G1 X133.555 Y116.188 F42000
G1 F5700
G3 X133.086 Y115.879 I.449 J-1.193 E.01742
M204 S6000
; WIPE_START
G1 F33600
G1 X132.882 Y115.602 E-.13043
G1 X132.811 Y115.446 E-.06549
G1 X132.742 Y115.172 E-.10704
G1 X132.73 Y114.993 E-.06843
G1 X132.73 Y113.97 E-.38861
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z1.6 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z1.6
G1 X0 Y128 F18000 ; move to safe pos
M73 P43 R11
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.6 F4000
            G39.3 S1
            G0 Z1.6 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z2 F42000
G1 X120.489 Y107.102
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X120.871 Y105.519 I18.761 J3.695 E.05402
G1 X113.664 Y98.312 E.3381
G3 X117.109 Y94.47 I18.586 J13.198 E.17155
G1 X117.498 Y94.47 E.0129
G1 X123.637 Y100.609 E.288
G3 X125.978 Y99.318 I4.64 J5.646 E.08919
G1 X130.826 Y94.47 E.22743
G1 X132.85 Y94.47 E.06713
G1 X144.03 Y105.65 E.52449
G1 X144.03 Y104.294 E.04499
G1 X133.47 Y114.854 E.49539
G3 X133.476 Y112.767 I16.443 J-.998 E.06928
G3 X133.651 Y112.428 I.657 J.125 E.01282
G1 X134.553 Y111.525 E.04235
G1 X138.558 Y115.53 E.18786
G1 X140.47 Y115.53 E.06343
G1 X144.03 Y111.97 E.16701
G3 X143.84 Y113.136 I-4.645 J-.157 E.03931
G1 X136.35 Y105.646 E.35137
G2 X136.085 Y104.563 I-8.014 J1.392 E.03702
G1 X142.333 Y98.315 E.29313
G2 X140.791 Y96.37 I-12.841 J8.596 E.08243
G1 X138.891 Y94.47 E.08912
G1 X138.502 Y94.47 E.0129
G1 X132.728 Y100.244 E.2709
G2 X129.86 Y99.156 I-4.738 J8.163 E.10219
G1 X125.174 Y94.47 E.21985
G1 X123.15 Y94.47 E.06713
G1 X111.97 Y105.65 E.52449
G1 X111.97 Y104.294 E.04499
G1 X119.695 Y112.019 E.36242
G2 X119.721 Y113.251 I12.402 J.362 E.04089
G1 X111.97 Y121.002 E.3636
G1 X111.97 Y119.646 E.04499
G1 X120.876 Y128.552 E.41781
G3 X126.668 Y129.332 I2.107 J6.255 E.20083
G1 X129.943 Y126.057 E.15364
G1 X134.458 Y129.218 E.18283
G1 X131.184 Y132.492 E.1536
G1 X129.85 Y131.558 E.05401
G1 X137.898 Y137.441 F42000
G1 F15476.087
G3 X138.795 Y138.795 I-8.688 J6.726 E.0539
G1 X144.03 Y144.03 E.2456
G1 X144.03 Y142.674 E.04499
G1 X139.47 Y147.234 E.21392
G1 X139.47 Y147.146 E.00292
G1 X143.969 Y151.645 E.21104
G2 X144.03 Y150.35 I-41.73 J-2.629 E.043
G1 X132.85 Y161.53 E.52449
G1 X130.826 Y161.53 E.06713
G1 X126.266 Y156.97 E.21392
G1 X129.734 Y156.97 E.11503
G1 X125.174 Y161.53 E.21392
G1 X123.15 Y161.53 E.06713
G1 X111.97 Y150.35 E.52449
G2 X112.031 Y151.645 I46.002 J-1.508 E.04302
G1 X116.53 Y147.146 E.21107
G1 X116.53 Y147.234 E.00292
G1 X111.97 Y142.674 E.21392
G1 X111.97 Y144.03 E.04499
G1 X116.53 Y139.47 E.21392
G1 X116.53 Y139.558 E.00292
G1 X111.97 Y134.998 E.21392
G1 X111.97 Y136.354 E.04499
G1 X125.429 Y122.895 E.63137
G3 X121.619 Y119.029 I6.894 J-10.604 E.18146
G1 X111.97 Y128.678 E.45264
G1 X111.97 Y127.322 E.04499
G1 X116.972 Y132.324 E.23465
G2 X116.579 Y133.899 I11.027 J3.588 E.0539
; WIPE_START
G1 F33600
G1 X116.744 Y133.013 E-.34254
G1 X116.972 Y132.324 E-.27579
G1 X116.708 Y132.06 E-.14167
; WIPE_END
G1 E-.04 F1800
G1 X123.766 Y134.966 Z1.6 F42000
G1 X139.462 Y141.428 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15476.087
G2 X139.203 Y139.825 I-19.85 J2.384 E.0539
G1 X142.666 Y136.362 E.16244
G2 X138.973 Y132.379 I-9.792 J5.376 E.182
G1 X135.699 Y135.653 E.1536
G1 X135.548 Y135.548 E.00611
G1 X111.97 Y111.97 E1.10608
G1 X111.97 Y113.326 E.04499
G1 X121.386 Y103.91 E.44172
G3 X122.108 Y102.453 I8.413 J3.26 E.05402
; WIPE_START
G1 F33600
G1 X121.386 Y103.91 E-.61794
G1 X121.122 Y104.175 E-.14206
; WIPE_END
G1 E-.04 F1800
G1 X124.063 Y111.217 Z1.6 F42000
G1 X142.679 Y155.782 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15476.087
G3 X141.795 Y157.147 I-9.531 J-5.201 E.05401
G1 X137.113 Y152.465 E.21962
G1 X133.275 Y156.303 E.18005
G1 X137.526 Y160.554 E.19939
G2 X138.956 Y159.78 I-7.593 J-15.741 E.05397
G1 X117.045 Y159.778 F42000
G1 F15476.087
G2 X118.474 Y160.554 I6.887 J-10.98 E.054
G1 X122.725 Y156.303 E.19939
G1 X118.887 Y152.465 E.18005
G1 X114.208 Y157.144 E.21948
G3 X113.321 Y155.781 I9.504 J-7.157 E.05399
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X114.208 Y157.144 E-.61804
G1 X114.472 Y156.88 E-.14196
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/45
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
G17
G3 Z1.6 I.058 J1.216 P1  F42000
G1 X123.523 Y156.446 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X118.745 Y151.668 E.22415
G3 X116.994 Y147.44 I4.32 J-4.266 E.15563
G1 X116.994 Y134.649 E.42432
G3 X122.625 Y128.669 I6.005 J.013 E.30006
G3 X126.436 Y129.734 I.375 J6.008 E.13373
G1 X136.454 Y136.748 E.40569
G3 X139.006 Y141.651 I-3.49 J4.933 E.19044
G1 X139.006 Y147.44 E.19201
G3 X137.255 Y151.668 I-6.038 J-.024 E.1557
G1 X132.417 Y156.506 E.22698
G1 X123.583 Y156.506 E.29303
G1 X123.565 Y156.488 E.00084
G1 X123.746 Y156.114 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5700
G1 X119.027 Y151.396 E.20503
G3 X117.386 Y147.433 I4.034 J-3.993 E.13516
G1 X117.386 Y134.656 E.39259
G3 X122.647 Y129.06 I5.613 J.006 E.2599
G3 X126.217 Y130.059 I.353 J5.617 E.11608
G1 X136.223 Y137.065 E.37535
G3 X138.614 Y141.658 I-3.258 J4.615 E.16528
G1 X138.614 Y147.433 E.17743
G3 X136.973 Y151.396 I-5.645 J-.017 E.13521
G1 X132.254 Y156.114 E.20503
G1 X123.806 Y156.114 E.25961
M204 S6000
; WIPE_START
G1 F33600
G1 X122.382 Y154.709 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.43 Y147.356 Z1.8 F42000
G1 X133.261 Y115.649 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X133.006 Y114.98 I.767 J-.675 E.02428
G1 X133.006 Y112.847 E.07075
G3 X133.31 Y112.113 I1.03 J-.004 E.02707
G1 X135.137 Y110.286 E.08569
G2 X136.006 Y108.188 I-2.198 J-2.139 E.07718
G2 X135.941 Y106.009 I-16.357 J-.599 E.07234
G2 X128.51 Y99.494 I-7.447 J.998 E.35777
G2 X125.761 Y99.876 I-.409 J7.14 E.09267
G2 X122.691 Y102.4 I2.349 J5.986 E.13404
G2 X121.304 Y105.658 I9.024 J5.764 E.11799
G2 X120.235 Y110.943 I67.392 J16.384 E.17891
G2 X125.265 Y122.215 I11.922 J1.438 E.43
G1 X139.587 Y132.243 E.57997
G3 X144.494 Y141.67 I-6.62 J9.437 E.36639
G1 X144.494 Y150.492 E.29267
G3 X132.992 Y161.994 I-11.503 J-.002 E.59927
G1 X123.008 Y161.994 E.33122
G3 X111.506 Y150.492 I.021 J-11.522 E.599
G1 X111.506 Y104.185 E1.5361
G3 X114.878 Y96.045 I11.548 J.015 E.29987
G1 X116.917 Y94.006 E.09564
G1 X139.083 Y94.006 E.7353
G1 X139.607 Y94.53 E.02458
G3 X141.524 Y96.468 I-37.636 J39.151 E.09044
G3 X144.494 Y104.185 I-8.542 J7.717 E.28055
G1 X144.494 Y111.988 E.25882
G3 X140.488 Y115.994 I-4.001 J.005 E.20882
G1 X133.888 Y115.986 E.21894
G3 X133.302 Y115.693 I.14 J-1.012 E.02211
G1 X132.961 Y115.912 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5700
G3 X132.614 Y114.993 I1.047 J-.92 E.03084
G1 X132.614 Y112.835 E.06631
G3 X133.025 Y111.844 I1.422 J.009 E.0338
G1 X134.852 Y110.016 E.07943
G2 X135.614 Y108.177 I-1.907 J-1.867 E.06268
G2 X135.552 Y106.061 I-15.94 J-.59 E.06509
G2 X128.503 Y99.886 I-7.058 J.945 E.31427
G2 X125.9 Y100.242 I-.4 J6.758 E.08125
G2 X123.016 Y102.62 I2.21 J5.62 E.11677
G2 X121.683 Y105.76 I8.691 J5.542 E.10533
G2 X120.624 Y110.99 I67.261 J16.334 E.16399
G2 X125.492 Y121.895 I11.533 J1.391 E.38539
G1 X139.815 Y131.924 E.53728
G3 X144.886 Y141.665 I-6.849 J9.756 E.35066
G1 X144.886 Y150.497 E.2714
G3 X132.997 Y162.386 I-11.895 J-.007 E.57373
G1 X123.003 Y162.386 E.30711
G3 X111.114 Y150.497 I.026 J-11.915 E.57347
G1 X111.114 Y104.18 E1.42319
G3 X113.798 Y96.658 I11.942 J.02 E.25021
G1 X114.185 Y96.205 E.01832
G1 X114.185 Y96.205 F42000
G1 F5700
G1 X114.597 Y95.771 E.0184
G1 F4800
G1 X116.754 Y93.614 E.09374
G1 X139.246 Y93.614 E.69109
G1 F5700
G1 X139.884 Y94.253 E.02776
G3 X141.815 Y96.205 I-37.913 J39.431 E.08438
G3 X142.567 Y97.13 I-9.982 J8.876 E.03663
G1 X142.569 Y97.128 F42000
G1 F5700
G1 X142.911 Y97.617 E.01833
G1 F4800
G1 X143.121 Y97.949 E.01206
G1 F5700
M73 P44 R11
G1 X143.518 Y98.642 E.02454
G1 X143.515 Y98.644 F42000
G1 F5700
G3 X144.512 Y101.228 I-10.732 J5.624 E.08531
G1 X144.514 Y101.228 F42000
G1 F5700
G1 X144.647 Y101.81 E.01834
G1 F4800
G1 X144.684 Y102.008 E.00621
G1 F5700
G1 X144.826 Y102.987 E.03039
G1 X144.826 Y102.987 F42000
G1 F5700
G3 X144.886 Y104.18 I-11.683 J1.188 E.03672
G1 X144.886 Y111.996 E.24015
G3 X140.496 Y116.386 I-4.389 J.001 E.21191
G1 X134.006 Y116.386 E.1994
G3 X133.002 Y115.956 I.002 J-1.394 E.03451
M204 S6000
; WIPE_START
G1 F33600
G1 X132.778 Y115.653 E-.143
G1 X132.703 Y115.488 E-.06906
G1 X132.627 Y115.182 E-.11967
G1 X132.614 Y114.993 E-.07202
G1 X132.614 Y114.055 E-.35625
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z1.8 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z1.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.8 F4000
            G39.3 S1
            G0 Z1.8 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z2.2 F42000
G1 X122.372 Y102.253
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X121.608 Y103.688 I10.498 J6.505 E.05395
G1 X111.854 Y113.442 E.45757
G1 X111.854 Y111.854 E.05265
G1 X136.018 Y136.018 E1.13356
G3 X138.515 Y138.515 I-3.53 J6.027 E.11841
G1 X144.146 Y144.146 E.26415
G1 X144.146 Y142.558 E.05265
G1 X139.354 Y147.349 E.22476
G1 X139.354 Y147.03 E.01058
G1 X144.07 Y151.746 E.22122
G2 X144.146 Y150.234 I-22.447 J-1.878 E.05022
G1 X132.734 Y161.646 E.53532
G1 X130.942 Y161.646 E.05947
G1 X126.151 Y156.854 E.22476
G1 X123.439 Y156.854 E.08995
G1 X122.806 Y156.222 E.02968
G1 X118.387 Y160.641 E.20733
G3 X114.126 Y157.226 I5.172 J-10.817 E.18274
G1 X118.968 Y152.384 E.22715
G3 X117.872 Y151.182 I12.014 J-12.059 E.05397
; WIPE_START
G1 F33600
G1 X118.968 Y152.384 E-.61801
G1 X118.704 Y152.648 E-.14199
; WIPE_END
G1 E-.04 F1800
G1 X126.315 Y152.074 Z1.8 F42000
G1 X138.128 Y151.182 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F15476.087
G3 X137.032 Y152.384 I-13.11 J-10.857 E.05397
G1 X141.879 Y157.231 E.22739
G3 X137.613 Y160.641 I-9.511 J-7.524 E.18273
G1 X133.194 Y156.222 E.20733
G1 X132.561 Y156.854 E.02968
G1 X129.849 Y156.854 E.08995
G1 X125.058 Y161.646 E.22476
G1 X123.266 Y161.646 E.05947
G1 X111.854 Y150.234 E.53532
G2 X111.934 Y151.742 I12.425 J.104 E.05012
G1 X116.646 Y147.03 E.22104
G1 X116.646 Y147.349 E.01058
G1 X111.854 Y142.558 E.22476
G1 X111.854 Y144.146 E.05265
G1 X116.646 Y139.354 E.22476
G1 X116.646 Y139.673 E.01058
G1 X111.854 Y134.882 E.22476
G1 X111.854 Y136.47 E.05265
G1 X125.512 Y122.813 E.64068
G3 X121.702 Y118.946 I6.833 J-10.541 E.18148
G1 X111.854 Y128.794 E.46198
G1 X111.854 Y127.206 E.05265
G1 X117.061 Y132.413 E.24426
G2 X116.685 Y133.992 I10.024 J3.226 E.0539
; WIPE_START
G1 F33600
G1 X116.849 Y133.069 E-.35632
G1 X117.061 Y132.413 E-.26196
G1 X116.798 Y132.15 E-.14172
; WIPE_END
G1 E-.04 F1800
G1 X124.424 Y131.851 Z1.8 F42000
G1 X129.767 Y131.641 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F15476.087
G1 X131.101 Y132.575 E.05401
G1 X134.541 Y129.135 E.16138
G1 X130.026 Y125.974 E.18283
G1 X126.585 Y129.415 E.16145
G2 X120.966 Y128.642 I-3.588 J5.268 E.19499
G1 X111.854 Y119.53 E.42743
G1 X111.854 Y121.118 E.05265
G1 X119.829 Y113.143 E.3741
G3 X119.806 Y112.13 I8.527 J-.7 E.03364
G1 X111.855 Y104.179 E.37299
G2 X111.854 Y105.766 I17.892 J.8 E.05265
G1 X123.266 Y94.354 E.53532
G1 X125.058 Y94.354 E.05947
G1 X130.003 Y99.299 E.23195
G3 X132.644 Y100.328 I-2.067 J9.209 E.0944
G1 X138.618 Y94.354 E.28023
G1 X138.939 Y94.354 E.01066
G3 X141.63 Y97.126 I-61.753 J62.668 E.12816
G3 X142.418 Y98.23 I-7.696 J6.323 E.04503
G1 X135.992 Y104.656 E.30146
G3 X136.21 Y105.506 I-8.97 J2.751 E.02911
G1 X143.928 Y113.224 E.36208
G2 X144.146 Y111.854 I-4.169 J-1.364 E.0462
G1 X140.354 Y115.646 E.17784
G1 X138.673 Y115.646 E.05576
G1 X134.472 Y111.444 E.19711
G2 X133.464 Y112.476 I4.587 J5.489 E.04793
G2 X133.354 Y112.858 I.667 J.397 E.01333
G2 X133.355 Y114.969 I15.72 J1.055 E.0701
G1 X144.145 Y104.179 E.50621
G3 X144.146 Y105.766 I-31.554 J.799 E.05265
G1 X132.734 Y94.354 E.53532
G1 X130.942 Y94.354 E.05947
G1 X125.799 Y99.497 E.24127
G2 X123.721 Y100.694 I2.537 J6.807 E.07988
G1 X117.382 Y94.354 E.29738
G1 X117.061 Y94.354 E.01066
G2 X114.029 Y97.565 I18.791 J20.785 E.14664
G1 X113.582 Y98.23 E.02658
G1 X120.958 Y105.606 E.34604
G2 X120.584 Y107.191 I29.855 J7.892 E.05402
; WIPE_START
G1 F33600
G1 X120.958 Y105.606 E-.61871
G1 X120.695 Y105.343 E-.14129
; WIPE_END
G1 E-.04 F1800
G1 X124.059 Y112.195 Z1.8 F42000
G1 X135.616 Y135.736 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F15476.087
G1 X139.056 Y132.296 E.16138
G3 X142.753 Y136.275 I-6.477 J9.725 E.18183
G1 X139.108 Y139.92 E.17096
G3 X139.35 Y141.526 I-6.919 J1.863 E.05399
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X139.259 Y140.576 E-.36239
G1 X139.108 Y139.92 E-.25604
G1 X139.372 Y139.656 E-.14157
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/45
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
G17
G3 Z1.8 I-.883 J-.837 P1  F42000
G1 X123.567 Y156.327 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X118.826 Y151.586 E.22238
G3 X117.109 Y147.44 I4.237 J-4.183 E.15262
G1 X117.109 Y134.649 E.42433
G3 X122.594 Y128.786 I5.891 J.014 E.293
G3 X126.369 Y129.828 I.403 J5.901 E.13242
G1 X136.388 Y136.843 E.40569
G3 X138.891 Y141.651 I-3.423 J4.838 E.18676
G1 X138.891 Y147.44 E.19201
G3 X137.174 Y151.586 I-5.903 J-.016 E.15272
G1 X132.369 Y156.391 E.22539
G1 X123.631 Y156.391 E.28985
G1 X123.609 Y156.369 E.00102
G1 X123.793 Y155.999 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5700
G1 X119.109 Y151.314 E.20356
G3 X117.501 Y147.433 I3.951 J-3.91 E.13238
G1 X117.501 Y134.656 E.3926
G3 X122.615 Y129.177 I5.499 J.007 E.25337
G3 X126.151 Y130.154 I.381 J5.51 E.11487
G1 X136.157 Y137.16 E.37535
G3 X138.499 Y141.658 I-3.19 J4.519 E.16187
G1 X138.499 Y147.433 E.17743
G3 X136.891 Y151.314 I-5.511 J-.009 E.13245
G1 X132.207 Y155.999 E.20356
G1 X123.853 Y155.999 E.25667
M204 S6000
; WIPE_START
G1 F33600
G1 X122.43 Y154.593 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.463 Y147.237 Z2 F42000
G1 X133.17 Y115.731 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X132.891 Y114.98 I.838 J-.74 E.02717
G1 X132.891 Y112.846 E.07079
G3 X133.228 Y112.031 I1.146 J-.003 E.03004
G1 X135.056 Y110.204 E.08572
G2 X135.891 Y108.188 I-2.114 J-2.057 E.07416
G2 X135.825 Y106.016 I-16.17 J-.599 E.07213
G2 X128.51 Y99.609 I-7.331 J.99 E.35198
G2 X125.801 Y99.984 I-.408 J7.031 E.0913
G2 X122.786 Y102.465 I2.31 J5.879 E.13166
G2 X121.411 Y105.706 I8.926 J5.7 E.11733
G2 X120.35 Y110.957 I67.99 J16.474 E.17776
G2 X125.331 Y122.12 I11.808 J1.424 E.42586
G1 X139.653 Y132.148 E.57997
G3 X144.609 Y141.67 I-6.685 J9.531 E.37007
G1 X144.609 Y150.492 E.29267
G3 X132.992 Y162.109 I-11.618 J-.002 E.60528
G1 X123.008 Y162.109 E.33122
G3 X111.391 Y150.492 I.001 J-11.618 E.60529
G1 X111.391 Y104.185 E1.5361
G3 X114.796 Y95.963 I11.662 J.014 E.30288
M73 P45 R11
G1 X116.869 Y93.891 E.09723
G1 X139.131 Y93.891 E.73847
G1 X139.455 Y94.215 E.01519
G1 X141.204 Y95.963 E.08204
G3 X144.609 Y104.185 I-8.238 J8.229 E.30291
G1 X144.609 Y111.988 E.25883
G3 X140.488 Y116.109 I-4.116 J.005 E.21483
G1 X134.018 Y116.109 E.21461
G3 X133.211 Y115.775 I-.01 J-1.118 E.02977
G1 X132.866 Y115.982 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5700
G1 X132.677 Y115.703 E.01037
G3 X132.499 Y114.993 I1.332 J-.711 E.0227
G1 X132.499 Y112.835 E.06632
G3 X132.943 Y111.762 I1.538 J.009 E.03657
G1 X134.771 Y109.934 E.07943
G2 X135.499 Y108.177 I-1.823 J-1.784 E.05989
G2 X135.436 Y106.068 I-15.753 J-.59 E.06488
G2 X128.504 Y100.001 I-6.943 J.94 E.3089
G2 X125.941 Y100.351 I-.399 J6.649 E.07998
G2 X123.112 Y102.684 I2.17 J5.512 E.11457
G2 X121.79 Y105.808 I8.594 J5.479 E.10471
G2 X120.739 Y111.004 I67.875 J16.428 E.16294
G2 X125.558 Y121.8 I11.418 J1.377 E.38156
G1 X139.882 Y131.83 E.53728
G3 X145.001 Y141.665 I-6.915 J9.849 E.35407
G1 X145.001 Y150.497 E.2714
G3 X132.997 Y162.501 I-12.011 J-.007 E.5793
G1 X123.003 Y162.501 E.30711
G3 X110.999 Y150.497 I.006 J-12.01 E.57931
G1 X110.999 Y104.18 E1.42319
G3 X114.102 Y96.126 I12.055 J.02 E.27126
G1 X114.102 Y96.125 F42000
G1 F5700
G1 X114.516 Y95.69 E.01846
G1 F4800
G1 X116.707 Y93.499 E.09521
G1 X139.293 Y93.499 E.69403
G1 F5700
G1 X139.732 Y93.937 E.01906
G1 X141.484 Y95.69 E.07614
G3 X145.001 Y104.18 I-8.519 J8.502 E.28975
G1 X145.001 Y111.996 E.24015
G3 X140.496 Y116.501 I-4.504 J.002 E.21749
G1 X134.006 Y116.501 E.1994
G3 X132.908 Y116.025 I.002 J-1.51 E.03783
M204 S6000
; WIPE_START
G1 F33600
G1 X132.677 Y115.703 E-.15075
G1 X132.596 Y115.53 E-.07259
G1 X132.511 Y115.19 E-.13285
G1 X132.499 Y114.993 E-.07505
G1 X132.499 Y114.128 E-.32878
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z2 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2 F4000
            G39.3 S1
            G0 Z2 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z2.4 F42000
G1 X129.684 Y131.724
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X131.018 Y132.658 E.05401
G1 X134.624 Y129.052 E.16916
G1 X130.109 Y125.891 E.18283
G1 X126.501 Y129.499 E.16925
G2 X125.049 Y128.775 I-4.349 J6.906 E.05392
; WIPE_START
G1 F33600
G1 X125.767 Y129.067 E-.2945
G1 X126.501 Y129.499 E-.32376
G1 X126.765 Y129.235 E-.14174
; WIPE_END
G1 E-.04 F1800
G1 X132.181 Y134.613 Z2 F42000
G1 X139.238 Y141.622 Z2
G1 Z1.6
G1 E.8 F1800
G1 F15476.087
G2 X139.014 Y140.014 I-8.413 J.352 E.05394
G1 X142.835 Y136.192 E.17926
G2 X139.139 Y132.213 I-9.94 J5.528 E.18193
G1 X135.533 Y135.819 E.16916
; WIPE_START
G1 F33600
G1 X136.947 Y134.405 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.448 Y142.021 Z2 F42000
G1 X138.045 Y151.099 Z2
G1 Z1.6
G1 E.8 F1800
G1 F15476.087
G3 X136.95 Y152.302 I-12.431 J-10.214 E.05397
G1 X141.962 Y157.314 E.23513
G3 X137.701 Y160.729 I-8.964 J-6.821 E.18296
G1 X133.112 Y156.14 E.21527
G1 X132.513 Y156.739 E.0281
G1 X129.965 Y156.739 E.08453
G1 X124.943 Y161.761 E.23559
G1 X123.381 Y161.761 E.05181
G1 X111.739 Y150.119 E.54616
G2 X111.824 Y151.852 I21.281 J-.172 E.05758
G1 X116.761 Y146.915 E.23161
G2 X116.762 Y147.466 I7.179 J.266 E.01827
G1 X111.739 Y142.443 E.23562
G1 X111.739 Y144.261 E.06031
G1 X116.761 Y139.239 E.23559
G1 X116.761 Y139.789 E.01824
G1 X111.739 Y134.767 E.23559
G1 X111.739 Y136.585 E.06031
G1 X125.594 Y122.73 E.64999
G3 X121.786 Y118.862 I6.773 J-10.478 E.1815
G1 X111.739 Y128.909 E.47133
G1 X111.739 Y127.091 E.06031
G1 X117.153 Y132.505 E.25398
G3 X121.056 Y128.732 I5.855 J2.151 E.1863
G1 X111.739 Y119.415 E.43706
G1 X111.739 Y121.233 E.06031
G1 X119.938 Y113.034 E.38464
G3 X119.921 Y112.245 I6.638 J-.538 E.02618
G1 X111.742 Y104.066 E.3837
G2 X111.739 Y105.881 I36.374 J.969 E.06021
G1 X123.381 Y94.239 E.54616
G1 X124.943 Y94.239 E.05181
G1 X130.144 Y99.44 E.244
G3 X132.56 Y100.412 I-1.727 J7.787 E.08678
G1 X138.733 Y94.239 E.28957
G3 X139.208 Y94.46 I.127 J.348 E.01931
G1 X141.352 Y96.624 E.10104
G3 X142.504 Y98.144 I-12.319 J10.535 E.0633
G1 X135.9 Y104.748 E.3098
G3 X136.059 Y105.356 I-4.432 J1.489 E.02085
G1 X144.015 Y113.312 E.37323
G2 X144.261 Y111.739 I-4.149 J-1.453 E.05309
G1 X140.239 Y115.761 E.18868
G1 X138.789 Y115.761 E.0481
G1 X134.39 Y111.362 E.20636
G2 X133.364 Y112.417 I4.537 J5.44 E.04891
G2 X133.239 Y112.856 I.797 J.464 E.01529
G1 X133.249 Y115.075 E.07361
G1 X144.258 Y104.066 E.51645
G3 X144.261 Y105.881 I-36.371 J.969 E.06021
G1 X132.619 Y94.239 E.54616
G1 X131.057 Y94.239 E.05181
G1 X125.61 Y99.686 E.25554
G2 X123.803 Y100.775 I2.36 J5.959 E.0703
G1 X117.267 Y94.239 E.30663
G1 X117.013 Y94.239 E.00842
G2 X113.942 Y97.488 I19.123 J21.153 E.14844
G1 X113.5 Y98.148 E.02637
G1 X121.055 Y105.703 E.35446
G2 X120.682 Y107.288 I19.204 J5.36 E.05402
; WIPE_START
G1 F33600
G1 X121.055 Y105.703 E-.61868
G1 X120.792 Y105.44 E-.14132
; WIPE_END
G1 E-.04 F1800
G1 X120.319 Y113.058 Z2 F42000
G1 X117.955 Y151.099 Z2
G1 Z1.6
G1 E.8 F1800
G1 F15476.087
G2 X119.05 Y152.302 I12.431 J-10.215 E.05397
G1 X114.044 Y157.308 E.23482
G2 X118.299 Y160.729 I9.057 J-6.907 E.18289
G1 X122.888 Y156.14 E.21527
G1 X123.487 Y156.739 E.0281
G1 X126.035 Y156.739 E.08453
G1 X131.057 Y161.761 E.23559
G1 X132.619 Y161.761 E.05181
G1 X144.261 Y150.119 E.54616
G3 X144.171 Y151.847 I-18.254 J-.08 E.05744
G1 X139.239 Y146.915 E.23139
G3 X139.238 Y147.466 I-7.185 J.266 E.01827
G1 X144.261 Y142.443 E.23563
G1 X144.261 Y144.261 E.06031
G1 X138.168 Y138.168 E.28584
G2 X136.488 Y136.488 I-5.318 J3.638 E.07925
G1 X111.739 Y111.739 E1.16104
G1 X111.739 Y113.557 E.06031
G1 X121.822 Y103.474 E.47301
G3 X122.643 Y102.071 I11.135 J5.57 E.05396
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X122.268 Y102.631 E-.25612
G1 X121.822 Y103.474 E-.36236
G1 X121.559 Y103.738 E-.14151
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/45
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
G17
G3 Z2 I-1.216 J.048 P1  F42000
G1 X123.611 Y156.207 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X118.908 Y151.504 E.22062
G3 X117.225 Y147.441 I4.106 J-4.081 E.14967
G1 X117.225 Y134.649 E.42433
G3 X122.563 Y128.903 I5.782 J.02 E.28588
G3 X126.303 Y129.923 I.417 J5.843 E.13107
G1 X136.322 Y136.938 E.4057
G3 X138.775 Y141.651 I-3.342 J4.735 E.18312
G1 X138.773 Y147.507 E.19424
G3 X137.092 Y151.504 I-5.78 J-.078 E.14746
G1 X132.321 Y156.275 E.22381
G1 X123.679 Y156.275 E.28668
G1 X123.653 Y156.25 E.0012
G1 X123.841 Y155.883 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5700
M73 P46 R11
G1 X119.191 Y151.233 E.20209
G3 X117.617 Y147.433 I3.823 J-3.809 E.12965
G1 X117.617 Y134.656 E.3926
G3 X122.584 Y129.295 I5.39 J.012 E.24678
G3 X126.084 Y130.248 I.397 J5.446 E.11363
G1 X136.091 Y137.255 E.37535
G3 X138.383 Y141.658 I-3.11 J4.417 E.1585
G1 X138.381 Y147.499 E.17947
G3 X136.809 Y151.233 I-5.387 J-.07 E.1276
G1 X132.159 Y155.883 E.20209
G1 X123.901 Y155.883 E.25373
M204 S6000
; WIPE_START
G1 F33600
G1 X122.478 Y154.478 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.496 Y147.117 Z2.2 F42000
G1 X133.08 Y115.806 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.992 Y115.689 E.00487
G3 X132.775 Y114.981 I1.017 J-.698 E.02495
M73 P46 R10
G1 X132.775 Y112.846 E.07082
G3 X133.146 Y111.95 I1.262 J-.002 E.03302
G1 X134.974 Y110.122 E.08574
G2 X135.775 Y108.188 I-2.022 J-1.97 E.07115
G2 X135.71 Y106.023 I-15.983 J-.599 E.07191
G2 X128.51 Y99.725 I-7.216 J.984 E.34617
G2 X126.07 Y100.012 I-.409 J7.033 E.08192
G2 X122.882 Y102.529 I2.016 J5.83 E.1373
G2 X121.518 Y105.753 I8.825 J5.635 E.11666
G2 X120.458 Y111.024 I54.603 J13.719 E.17841
G2 X125.397 Y122.025 I11.768 J1.326 E.41969
G1 X139.719 Y132.054 E.57998
G3 X144.725 Y141.669 I-6.751 J9.625 E.37374
G1 X144.725 Y150.492 E.29268
G3 X132.992 Y162.225 I-11.734 J-.002 E.6113
G1 X123.008 Y162.225 E.33122
G3 X111.275 Y150.492 I.002 J-11.734 E.6113
G1 X111.275 Y104.185 E1.5361
G3 X114.715 Y95.882 I11.768 J.01 E.3059
G1 X116.821 Y93.775 E.09882
G1 X139.179 Y93.775 E.74165
G1 X141.285 Y95.882 E.09882
G3 X144.725 Y104.185 I-8.324 J8.312 E.30591
G1 X144.725 Y111.988 E.25883
G3 X140.488 Y116.225 I-4.231 J.005 E.22084
G1 X134.018 Y116.225 E.21462
G3 X133.122 Y115.849 I-.009 J-1.233 E.03313
G1 X132.77 Y116.047 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5700
G1 X132.667 Y115.909 E.00527
G3 X132.383 Y114.993 I1.341 J-.918 E.02992
G1 X132.383 Y112.835 E.06634
G3 X132.861 Y111.681 I1.654 J.009 E.03935
G1 X134.689 Y109.853 E.07944
G2 X135.383 Y108.177 I-1.736 J-1.7 E.0571
G2 X135.321 Y106.076 I-15.565 J-.59 E.06466
G2 X128.504 Y100.117 I-6.827 J.931 E.30356
G2 X126.441 Y100.31 I-.399 J6.858 E.0639
G2 X123.452 Y102.406 I1.526 J5.354 E.11428
G2 X122.033 Y105.369 I7.162 J5.254 E.10155
G2 X120.848 Y111.07 I49.461 J13.254 E.17901
G2 X125.624 Y121.706 I11.377 J1.281 E.37587
G1 X139.948 Y131.735 E.53729
G3 X145.117 Y141.665 I-6.98 J9.943 E.35747
G1 X145.117 Y150.497 E.2714
G3 X144.98 Y152.294 I-12.616 J-.061 E.0554
G1 X144.88 Y152.885 E.01844
G1 X144.88 Y152.885 F42000
G1 F5700
G1 X144.747 Y153.471 E.01845
G1 F4800
G1 X144.609 Y153.967 E.01581
G1 F5700
G1 X144.395 Y154.618 E.02106
G1 X144.395 Y154.618 F42000
G1 F5700
G3 X132.997 Y162.617 I-11.397 J-4.119 E.45578
G1 X123.003 Y162.617 E.30711
G3 X120.615 Y162.377 I.06 J-12.615 E.07384
G1 X120.615 Y162.38 F42000
G1 F5700
G1 X120.029 Y162.247 E.01845
G1 F4800
G1 X119.533 Y162.109 E.01581
G1 F5700
G1 X118.882 Y161.895 E.02106
G1 X118.882 Y161.895 F42000
G1 F5700
G3 X117.317 Y161.201 I4.117 J-11.398 E.05264
G1 X117.317 Y161.201 F42000
G1 F5700
G1 X116.793 Y160.906 E.01848
G1 F4800
G1 X116.722 Y160.862 E.00257
G1 F5700
G1 X116.287 Y160.587 E.01583
G1 X116.287 Y160.586 F42000
G1 F5700
G3 X113.309 Y157.772 I6.744 J-10.119 E.1265
G1 X112.913 Y157.213 E.02104
G1 X112.913 Y157.213 F42000
G1 F5700
G1 X112.593 Y156.705 E.01845
G1 F4800
G1 X112.339 Y156.258 E.01581
G1 F5700
G1 X112.03 Y155.645 E.02107
G1 X112.031 Y155.645 F42000
G1 F5700
G3 X111.415 Y154.049 I10.97 J-5.148 E.05263
G1 X111.253 Y153.469 E.01848
G1 F4800
G1 X111.233 Y153.388 E.00257
G1 F5700
G1 X111.121 Y152.886 E.01582
G1 X111.124 Y152.885 F42000
G1 F5700
G3 X110.883 Y150.497 I12.631 J-2.48 E.07384
G1 X110.883 Y104.18 E1.4232
G3 X111.124 Y101.793 I12.878 J.093 E.07383
G1 X111.121 Y101.792 F42000
G1 F5700
G1 X111.253 Y101.207 E.01845
G1 F4800
G1 X111.391 Y100.711 E.01581
G1 F5700
G1 X111.605 Y100.06 E.02106
G1 X111.609 Y100.061 F42000
G1 F5700
G1 X111.823 Y99.501 E.01844
G1 F4800
G1 X112.069 Y98.952 E.01846
G1 F5700
G1 X112.299 Y98.495 E.01573
G1 X112.3 Y98.496 F42000
G1 F5700
G3 X114.02 Y96.046 I10.905 J5.824 E.09221
G1 X114.018 Y96.045 F42000
G1 F5700
G1 X114.434 Y95.608 E.01852
G1 F4800
G1 X116.659 Y93.383 E.09668
G1 X139.341 Y93.383 E.69697
G1 F5700
G1 X139.58 Y93.622 E.01037
G1 X141.566 Y95.608 E.08631
G3 X145.117 Y104.18 I-8.605 J8.586 E.29252
G1 X145.117 Y111.996 E.24015
G3 X140.496 Y116.617 I-4.619 J.002 E.22306
G1 X134.006 Y116.617 E.1994
G3 X132.811 Y116.091 I.002 J-1.625 E.04129
M204 S6000
; WIPE_START
G1 F33600
G1 X132.667 Y115.909 E-.08791
G1 X132.488 Y115.572 E-.14536
G1 X132.396 Y115.2 E-.14527
G1 X132.383 Y114.993 E-.07886
G1 X132.383 Y114.197 E-.30261
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z2.2 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z2.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.2 F4000
            G39.3 S1
            G0 Z2.2 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z2.6 F42000
G1 X120.779 Y107.383
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X121.149 Y105.797 I19.64 J3.755 E.05402
G1 X113.413 Y98.061 E.36295
G3 X114.964 Y96.125 I9.829 J6.288 E.08244
G1 X116.965 Y94.124 E.09389
G1 X117.151 Y94.124 E.00617
G1 X123.884 Y100.856 E.31583
G3 X125.397 Y99.899 I3.941 J4.558 E.05959
G1 X131.173 Y94.124 E.27096
G1 X132.503 Y94.124 E.04414
G1 X144.376 Y105.997 E.55699
G2 X144.371 Y103.953 I-41.216 J-.904 E.06778
G1 X133.146 Y115.178 E.52658
G1 X133.124 Y112.864 E.07678
G3 X133.315 Y112.287 I1.016 J.017 E.02046
G1 X134.312 Y111.284 E.04692
G1 X138.904 Y115.876 E.21546
G1 X140.124 Y115.876 E.04044
G1 X144.376 Y111.624 E.19951
G3 X144.103 Y113.399 I-4.512 J.214 E.05999
G1 X135.905 Y105.201 E.38459
G2 X135.808 Y104.84 I-2.848 J.571 E.0124
G1 X142.587 Y98.061 E.31804
G2 X141.036 Y96.125 I-9.821 J6.282 E.08244
G1 X139.035 Y94.124 E.09389
G1 X138.849 Y94.124 E.00617
G1 X132.477 Y100.496 E.29892
G2 X130.299 Y99.595 I-4.046 J6.701 E.07846
G1 X124.827 Y94.124 E.25668
G1 X123.497 Y94.124 E.04414
G1 X111.624 Y105.997 E.55699
G3 X111.629 Y103.953 I41.21 J-.904 E.06778
G1 X120.035 Y112.359 E.39434
G2 X120.049 Y112.923 I4.144 J.183 E.01872
G1 X111.624 Y121.349 E.39525
G1 X111.624 Y119.3 E.06797
G1 X121.149 Y128.825 E.44686
G3 X126.418 Y129.582 I1.828 J5.99 E.18237
G1 X130.192 Y125.808 E.17706
G1 X134.707 Y128.969 E.18283
G1 X130.935 Y132.741 E.17694
G1 X129.601 Y131.807 E.05401
G1 X135.45 Y135.902 F42000
G1 F15476.087
G1 X139.222 Y132.13 E.17694
G3 X142.92 Y136.108 I-6.316 J9.582 E.18189
G1 X138.919 Y140.108 E.18768
G3 X139.124 Y141.719 I-6.46 J1.637 E.05399
; WIPE_START
G1 F33600
G1 X139.044 Y140.689 E-.39265
G1 X138.919 Y140.108 E-.22557
G1 X139.183 Y139.845 E-.14178
; WIPE_END
G1 E-.04 F1800
G1 X137.289 Y147.238 Z2.2 F42000
G1 X135.717 Y153.372 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F15476.087
G1 X136.869 Y152.22 E.05401
G1 X142.044 Y157.396 E.2428
G3 X137.79 Y160.817 I-9.072 J-6.925 E.18288
G1 X133.031 Y156.058 E.22326
G1 X132.465 Y156.624 E.02651
G1 X130.08 Y156.624 E.07912
G1 X124.827 Y161.876 E.24642
G1 X123.497 Y161.876 E.04414
G1 X111.624 Y150.003 E.55699
G2 X111.721 Y151.955 I19.443 J.01 E.06485
G1 X116.876 Y146.8 E.24186
G2 X116.882 Y147.586 I10.159 J.324 E.02609
G1 X111.624 Y142.327 E.24668
G1 X111.624 Y144.376 E.06797
G1 X116.876 Y139.124 E.24642
G1 X116.876 Y139.904 E.0259
G1 X111.624 Y134.651 E.24642
G1 X111.624 Y136.7 E.06797
G1 X125.677 Y122.647 E.65929
G3 X121.866 Y118.782 I6.761 J-10.481 E.1815
G1 X111.624 Y129.025 E.48048
G1 X111.624 Y126.975 E.06797
M73 P47 R10
G1 X117.241 Y132.593 E.26355
G2 X116.899 Y134.179 I5.679 J2.055 E.05399
; WIPE_START
G1 F33600
G1 X117.037 Y133.265 E-.35126
G1 X117.241 Y132.593 E-.26693
G1 X116.978 Y132.33 E-.14182
; WIPE_END
G1 E-.04 F1800
G1 X118.443 Y124.839 Z2.2 F42000
G1 X122.941 Y101.857 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F15476.087
G2 X122.068 Y103.228 I7.61 J5.809 E.054
G1 X111.624 Y113.673 E.48996
G1 X111.624 Y111.624 E.06797
G1 X144.376 Y144.376 E1.53651
G1 X144.376 Y142.327 E.06797
G1 X139.118 Y147.585 E.24667
G2 X139.121 Y146.797 I-10.131 J-.434 E.02615
G1 X144.279 Y151.955 E.24196
G2 X144.376 Y150.003 I-19.382 J-1.944 E.06485
G1 X132.503 Y161.876 E.55699
G1 X131.173 Y161.876 E.04414
G1 X125.92 Y156.624 E.24642
G1 X123.535 Y156.624 E.07912
G1 X122.969 Y156.058 E.02651
G1 X118.21 Y160.817 E.22326
G3 X113.956 Y157.396 I4.83 J-10.363 E.18287
G1 X119.131 Y152.22 E.24281
G1 X120.283 Y153.372 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X119.131 Y152.22 E-.61876
G1 X118.869 Y152.483 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/45
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
G17
G3 Z2.2 I-.732 J.972 P1  F42000
G1 X123.655 Y156.088 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X118.99 Y151.423 E.21885
G3 X117.34 Y147.441 I4.009 J-3.993 E.14668
G1 X117.34 Y134.647 E.42438
G3 X122.511 Y129.022 I5.67 J.022 E.27813
G3 X126.237 Y130.017 I.472 J5.702 E.13048
G1 X136.255 Y137.032 E.40571
G3 X138.66 Y141.651 I-3.284 J4.645 E.17941
G1 X138.66 Y147.441 E.19205
G3 X137.01 Y151.423 I-5.659 J-.011 E.14668
G1 X132.273 Y156.16 E.22223
G1 X123.727 Y156.16 E.28351
G1 X123.697 Y156.13 E.00138
G1 X123.889 Y155.768 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5700
G1 X119.272 Y151.151 E.20062
G3 X117.732 Y147.433 I3.731 J-3.723 E.12687
G1 X117.732 Y134.656 E.39261
G3 X122.546 Y129.413 I5.277 J.014 E.24002
G3 X126.018 Y130.343 I.439 J5.308 E.11267
G1 X136.025 Y137.349 E.37535
G3 X138.268 Y141.658 I-3.053 J4.328 E.15507
G1 X138.268 Y147.433 E.17744
G3 X136.728 Y151.151 I-5.271 J-.005 E.12687
G1 X132.111 Y155.768 E.20062
G1 X123.949 Y155.768 E.25079
M204 S6000
; WIPE_START
G1 F33600
G1 X122.526 Y154.363 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.526 Y146.997 Z2.4 F42000
G1 X132.984 Y115.858 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.898 Y115.757 E.00439
G3 X132.66 Y114.982 I1.111 J-.766 E.02733
G1 X132.66 Y112.846 E.07086
G3 X133.064 Y111.869 I1.378 J-.001 E.036
G1 X134.893 Y110.04 E.08576
G2 X135.66 Y108.188 I-1.936 J-1.887 E.06813
G2 X135.594 Y106.029 I-15.797 J-.599 E.07173
G2 X128.51 Y99.84 I-7.104 J.984 E.3403
G2 X126.416 Y100.031 I-.376 J7.471 E.07
G2 X123.254 Y102.21 I1.547 J5.629 E.1298
G2 X121.767 Y105.291 I7.386 J5.462 E.11413
G2 X120.753 Y109.913 I50.229 J13.442 E.15705
G2 X125.463 Y121.93 I11.429 J2.452 E.45357
G1 X139.785 Y131.959 E.58
G3 X144.84 Y141.669 I-6.793 J9.707 E.37749
G1 X144.84 Y150.493 E.29268
G3 X132.993 Y162.34 I-11.848 J-.001 E.61733
G1 X123.007 Y162.34 E.33122
G3 X111.16 Y150.493 I.001 J-11.848 E.61733
G1 X111.16 Y104.185 E1.5361
G3 X114.633 Y95.8 I11.861 J.001 E.30894
G1 X116.773 Y93.66 E.10041
G1 X139.227 Y93.66 E.74482
G1 X141.367 Y95.8 E.1004
G3 X144.84 Y104.185 I-8.38 J8.383 E.30895
G1 X144.84 Y111.988 E.25884
G3 X140.488 Y116.34 I-4.347 J.006 E.22685
G1 X134.018 Y116.34 E.21461
G3 X133.114 Y116.001 I-.01 J-1.349 E.03277
G1 X133.025 Y115.902 E.00442
G1 X132.674 Y116.111 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5700
G1 X132.573 Y115.981 E.00506
G1 F4800
G1 X132.467 Y115.806 E.00628
G1 F5700
G1 X132.381 Y115.614 E.00649
G1 F4800
G1 X132.318 Y115.412 E.00649
G1 F5700
G1 X132.281 Y115.211 E.00628
G1 X132.281 Y115.211 F42000
G1 F5700
G3 X132.268 Y114.994 I1.746 J-.216 E.0067
G1 X132.268 Y112.834 E.06635
G3 X132.779 Y111.599 I1.77 J.01 E.04212
G1 X134.608 Y109.771 E.07945
G2 X135.268 Y108.177 I-1.65 J-1.617 E.05432
G2 X135.205 Y106.082 I-15.379 J-.59 E.06445
G2 X128.504 Y100.232 I-6.716 J.929 E.29815
G2 X126.518 Y100.409 I-.372 J7.044 E.06145
G2 X123.565 Y102.448 I1.44 J5.243 E.11236
G2 X122.143 Y105.402 I7.072 J5.224 E.10134
G2 X121.139 Y109.985 I49.873 J13.335 E.14422
G2 X125.69 Y121.611 I11.044 J2.38 E.40647
G1 X140.014 Y131.641 E.53729
G3 X142.931 Y134.525 I-7.127 J10.125 E.12663
G1 X143.265 Y135.01 E.01808
G1 X143.265 Y135.01 F42000
G1 F5700
G1 X143.573 Y135.511 E.01808
G1 F4800
G1 X143.857 Y136.027 E.01809
G1 F5700
G1 X144.103 Y136.529 E.01721
G1 X144.103 Y136.53 F42000
G1 F5700
G3 X145.232 Y141.665 I-11.117 J5.137 E.16283
G1 X145.232 Y150.497 E.2714
G3 X132.997 Y162.732 I-12.239 J-.004 E.59047
G1 X123.003 Y162.732 E.30711
G3 X110.768 Y150.497 I.004 J-12.239 E.59047
G1 X110.768 Y104.18 E1.4232
G3 X113.543 Y96.421 I12.25 J.005 E.25825
G1 X113.935 Y95.964 E.0185
G1 X113.935 Y95.964 F42000
G1 F5700
G1 X114.352 Y95.526 E.01858
G1 F4800
G1 X116.611 Y93.268 E.09815
G1 X139.389 Y93.268 E.69991
G1 F5337.281
G1 X139.428 Y93.306 E.00167
G1 F5700
G1 X139.71 Y93.589 E.01229
G1 X139.71 Y93.589 F42000
G1 F5700
G1 X141.648 Y95.526 E.08418
G3 X145.232 Y104.18 I-8.659 J8.656 E.29535
G1 X145.232 Y111.996 E.24015
G3 X140.496 Y116.732 I-4.735 J.002 E.22863
G1 X134.406 Y116.732 E.18711
G1 X134.406 Y116.732 F42000
G1 F5700
G1 X134.006 Y116.732 E.01229
G1 F4800
G3 X133.588 Y116.682 I-.001 J-1.76 E.01298
G1 F5700
G1 X133.386 Y116.619 E.00649
G1 X133.386 Y116.619 F42000
G1 F5700
G3 X132.712 Y116.158 I.613 J-1.618 E.02535
M204 S6000
; WIPE_START
G1 F33600
G1 X132.573 Y115.981 E-.08539
G1 X132.467 Y115.806 E-.07762
G1 X132.381 Y115.614 E-.08028
G1 X132.318 Y115.412 E-.08031
G1 X132.281 Y115.211 E-.07762
G1 X132.281 Y115.211 E0
G1 X132.268 Y114.994 E-.08275
G1 X132.268 Y114.267 E-.27604
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z2.4 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z2.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.4 F4000
            G39.3 S1
            G0 Z2.4 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z2.8 F42000
G1 X117.007 Y134.273
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X117.331 Y132.683 I6.048 J.401 E.05399
G1 X111.508 Y126.86 E.27315
G1 X111.508 Y129.14 E.07563
G1 X121.949 Y118.699 E.4898
G2 X125.76 Y122.564 I10.42 J-6.465 E.18156
G1 X111.508 Y136.816 E.6686
G1 X111.508 Y134.536 E.07563
G1 X116.992 Y140.02 E.25726
G1 X116.992 Y139.008 E.03356
G1 X111.508 Y144.492 E.25726
G1 X111.508 Y142.212 E.07563
G1 X117.002 Y147.706 E.25773
G3 X116.992 Y146.684 I13.065 J-.64 E.03391
G1 X111.617 Y152.059 E.25213
G3 X111.508 Y149.888 I18.643 J-2.027 E.07214
G1 X123.612 Y161.992 E.56782
G1 X124.712 Y161.992 E.03648
G1 X130.196 Y156.508 E.25726
G1 X132.418 Y156.508 E.0737
G1 X132.949 Y155.977 E.02492
G1 X137.877 Y160.905 E.23118
G2 X142.127 Y157.478 I-4.917 J-10.448 E.18281
G1 X136.787 Y152.139 E.2505
G1 X135.635 Y153.29 E.05401
; WIPE_START
G1 F33600
G1 X136.787 Y152.139 E-.61876
G1 X137.05 Y152.402 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X138.438 Y144.897 Z2.4 F42000
G1 X139.008 Y141.816 Z2.4
G1 Z2
G1 E.8 F1800
G1 F15476.087
G2 X138.825 Y140.203 I-6.408 J-.09 E.05399
G1 X143.008 Y136.02 E.19623
G2 X139.304 Y132.048 I-10.141 J5.741 E.18183
G1 X135.367 Y135.985 E.18472
G1 X130.852 Y132.824 E.18283
G1 X134.79 Y128.886 E.18472
G1 X130.275 Y125.725 E.18283
G1 X126.334 Y129.666 E.18487
G2 X121.242 Y128.918 I-3.356 J5.144 E.17615
G1 X111.508 Y119.184 E.45666
G1 X111.508 Y121.464 E.07563
M73 P48 R10
G1 X120.156 Y112.816 E.40568
G3 X120.15 Y112.474 I2.877 J-.222 E.01137
G1 X111.517 Y103.841 E.405
G2 X111.508 Y106.112 I46.111 J1.31 E.07535
G1 X123.612 Y94.008 E.56782
G1 X124.712 Y94.008 E.03648
G1 X130.457 Y99.753 E.26949
G3 X132.392 Y100.58 I-2.087 J7.564 E.07004
G1 X138.964 Y94.008 E.30829
G1 X139.082 Y94.008 E.00393
G3 X142.559 Y97.8 I-17.514 J19.549 E.17092
G1 X142.671 Y97.977 E.00695
G1 X135.716 Y104.932 E.32627
G3 X135.747 Y105.043 I-.817 J.286 E.00385
G1 X144.199 Y113.495 E.39648
G2 X144.492 Y111.508 I-4.681 J-1.705 E.06708
G1 X140.008 Y115.992 E.21035
G1 X139.02 Y115.992 E.03278
G1 X134.23 Y111.202 E.2247
G1 X133.226 Y112.213 E.04725
G2 X133.008 Y112.864 I.917 J.669 E.02313
G1 X133.056 Y115.268 E.07979
G1 X144.483 Y103.841 E.5361
G3 X144.492 Y106.112 I-46.104 J1.31 E.07535
G1 X132.388 Y94.008 E.56782
G1 X131.288 Y94.008 E.03648
G1 X125.148 Y100.148 E.28803
G2 X123.964 Y100.936 I3.114 J5.968 E.04728
G1 X117.036 Y94.008 E.32499
G1 X116.918 Y94.008 E.00393
G2 X113.441 Y97.799 I17.519 J19.555 E.17089
G1 X113.329 Y97.977 E.00698
G1 X121.243 Y105.891 E.37127
G2 X120.875 Y107.477 I19.337 J5.322 E.05403
; WIPE_START
G1 F33600
G1 X121.243 Y105.891 E-.61873
G1 X120.98 Y105.628 E-.14127
; WIPE_END
G1 E-.04 F1800
G1 X120.882 Y113.26 Z2.4 F42000
G1 X120.365 Y153.29 Z2.4
G1 Z2
G1 E.8 F1800
G1 F15476.087
G1 X119.213 Y152.139 E.05401
G1 X113.873 Y157.478 E.2505
G2 X118.123 Y160.905 I9.17 J-7.025 E.18281
G1 X123.051 Y155.977 E.23118
G1 X123.582 Y156.508 E.02493
G1 X125.804 Y156.508 E.0737
G1 X131.288 Y161.992 E.25726
G1 X132.388 Y161.992 E.03648
G1 X144.492 Y149.888 E.56782
G3 X144.383 Y152.059 I-19.07 J.13 E.07214
G1 X139.008 Y146.684 E.25214
G3 X138.998 Y147.706 I-13.075 J.382 E.03391
G1 X144.492 Y142.212 E.25773
G1 X144.492 Y144.492 E.07563
G1 X111.508 Y111.508 E1.54734
G1 X111.508 Y113.788 E.07563
G1 X122.359 Y102.937 E.50903
G3 X123.294 Y101.607 I10.77 J6.576 E.05396
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X122.359 Y102.937 E-.61776
G1 X122.094 Y103.202 E-.14224
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/45
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
G17
G3 Z2.4 I-1.216 J.036 P1  F42000
G1 X123.679 Y156.03 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21807
G3 X117.398 Y147.441 I3.968 J-3.952 E.14517
G1 X117.398 Y134.648 E.42436
G3 X122.503 Y129.08 I5.613 J.022 E.27485
G3 X126.204 Y130.064 I.481 J5.643 E.12959
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.751 Y156.102 E.28192
G1 X123.721 Y156.073 E.00138
G1 X123.913 Y155.71 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19989
G3 X117.79 Y147.433 I3.689 J-3.682 E.12548
G1 X117.79 Y134.656 E.39261
G3 X122.538 Y129.471 I5.22 J.014 E.237
G3 X125.985 Y130.39 I.446 J5.25 E.11184
G1 X135.991 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.018 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.973 Y155.71 E.24932
M204 S6000
; WIPE_START
G1 F33600
G1 X122.55 Y154.305 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.542 Y146.937 Z2.6 F42000
G1 X132.937 Y115.901 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.766 Y115.651 E.01005
G3 X132.602 Y114.982 I1.242 J-.659 E.02309
G1 X132.602 Y112.845 E.07087
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.853 Y109.999 E.08581
G2 X135.602 Y108.189 I-1.892 J-1.844 E.06655
G2 X135.536 Y106.033 I-15.712 J-.6 E.07163
G2 X128.51 Y99.898 I-7.047 J.979 E.33743
G2 X126.383 Y100.099 I-.385 J7.295 E.07114
G2 X123.31 Y102.231 I1.6 J5.586 E.12634
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.942 Y109.216 I43.552 J11.864 E.13297
G2 X120.561 Y111.952 I17.981 J3.902 E.09172
G2 X125.496 Y121.883 I11.652 J.401 E.38337
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.826 J9.754 E.37932
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.902 J.004 E.62039
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I-.004 J-11.902 E.62039
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.907 J-.003 E.31046
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X141.408 Y95.759 E.1012
G3 X144.898 Y104.185 I-8.417 J8.422 E.31046
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.404 J.005 E.22985
G1 X134.017 Y116.398 E.21467
G3 X132.976 Y115.946 I-.008 J-1.406 E.03874
G1 X132.624 Y116.14 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.531 Y116.017 E.00474
G3 X132.21 Y114.994 I1.477 J-1.026 E.03348
G1 X132.21 Y112.834 E.06635
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.567 Y109.73 E.07948
G2 X135.21 Y108.178 I-1.606 J-1.574 E.05287
G2 X135.148 Y106.086 I-15.293 J-.591 E.06436
G2 X128.504 Y100.29 I-6.658 J.926 E.29548
G2 X126.758 Y100.41 I-.405 J6.877 E.05389
G1 X126.487 Y100.477 E.00859
G2 X125.446 Y100.888 I2.022 J6.642 E.03442
G1 X125.202 Y101.025 E.00861
G2 X123.107 Y103.232 I3.308 J5.237 E.09449
G2 X121.988 Y106.192 I10.013 J5.476 E.09754
G1 X121.854 Y106.746 E.01749
G1 X121.722 Y107.332 E.01847
G1 X121.526 Y108.273 E.02954
G1 X121.327 Y109.289 E.03182
G2 X120.953 Y111.966 I17.615 J3.831 E.08314
G2 X125.724 Y121.564 I11.259 J.388 E.34322
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.05 J10.07 E.36265
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.292 J.001 E.59332
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I-.001 J-12.292 E.59332
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.485 I12.293 J-.001 E.29675
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X141.689 Y95.485 E.09888
G3 X145.29 Y104.18 I-8.692 J8.694 E.29675
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.793 J.001 E.23141
G1 X134.005 Y116.79 E.19946
G3 X132.665 Y116.187 I.004 J-1.799 E.0465
G1 X132.664 Y116.186 E.00006
M204 S6000
; WIPE_START
G1 F33600
G1 X132.531 Y116.017 E-.08138
G1 X132.417 Y115.834 E-.08206
G1 X132.325 Y115.63 E-.08499
G1 X132.263 Y115.431 E-.07948
G1 X132.224 Y115.218 E-.08225
G1 X132.21 Y114.994 E-.08531
G1 X132.21 Y114.297 E-.26454
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z2.6 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z2.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.6 F4000
            G39.3 S1
            G0 Z2.6 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z3 F42000
G1 X123.489 Y101.475
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X122.518 Y102.778 I9.765 J8.292 E.05396
G1 X111.45 Y113.846 E.51919
G1 X111.45 Y111.45 E.07946
G1 X144.55 Y144.55 E1.55276
G1 X144.55 Y142.154 E.07946
G1 X138.938 Y147.766 E.26326
G2 X138.95 Y146.626 I-14.498 J-.729 E.03782
G1 X144.435 Y152.111 E.25728
G2 X144.55 Y149.83 I-18.959 J-2.099 E.07579
G1 X132.33 Y162.05 E.57324
G1 X131.346 Y162.05 E.03265
G1 X125.746 Y156.45 E.26268
G1 X123.606 Y156.45 E.07099
G1 X123.092 Y155.936 E.02413
G1 X118.08 Y160.948 E.23514
G3 X113.832 Y157.52 I4.966 J-10.496 E.18278
G1 X119.254 Y152.098 E.25434
G1 X120.405 Y153.249 E.05401
; WIPE_START
G1 F33600
G1 X119.254 Y152.098 E-.61876
G1 X118.991 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X126.613 Y152.769 Z2.6 F42000
G1 X135.595 Y153.249 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F15476.087
G1 X136.746 Y152.098 E.05401
G1 X142.168 Y157.52 E.25434
G3 X137.92 Y160.948 I-9.22 J-7.076 E.18278
G1 X132.908 Y155.936 E.23514
G1 X132.394 Y156.45 E.02413
G1 X130.254 Y156.45 E.07099
G1 X124.654 Y162.05 E.26268
G1 X123.67 Y162.05 E.03265
G1 X111.45 Y149.83 E.57324
G2 X111.565 Y152.111 I19.073 J.182 E.07579
M73 P49 R10
G1 X117.05 Y146.626 E.25728
G2 X117.062 Y147.766 I14.511 J.411 E.03782
G1 X111.45 Y142.154 E.26326
G1 X111.45 Y144.55 E.07946
G1 X117.05 Y138.95 E.26268
G1 X117.05 Y140.078 E.03739
G1 X111.45 Y134.478 E.26268
G1 X111.45 Y136.874 E.07946
G1 X125.802 Y122.522 E.67325
G3 X121.991 Y118.658 I6.704 J-10.422 E.18152
G1 X111.45 Y129.198 E.49446
G1 X111.45 Y126.802 E.07946
G1 X117.375 Y132.727 E.27795
G2 X117.063 Y134.319 I5.715 J1.949 E.05399
; WIPE_START
G1 F33600
G1 X117.121 Y133.736 E-.22259
G1 X117.375 Y132.727 E-.39553
G1 X117.111 Y132.463 E-.14188
; WIPE_END
G1 E-.04 F1800
G1 X124.122 Y135.481 Z2.6 F42000
G1 X138.95 Y141.864 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F15476.087
G2 X138.778 Y140.25 I-6.38 J-.135 E.054
G1 X143.05 Y135.977 E.20043
G2 X139.346 Y132.006 I-10.181 J5.784 E.18181
G1 X135.325 Y136.026 E.1886
G1 X130.811 Y132.865 E.18283
G1 X134.831 Y128.845 E.1886
G1 X130.316 Y125.684 E.18283
G1 X126.293 Y129.707 E.18877
G2 X121.289 Y128.965 I-3.314 J5.101 E.17305
G1 X111.45 Y119.126 E.46155
G1 X111.45 Y121.522 E.07946
G1 X120.211 Y112.761 E.41099
G1 X120.212 Y112.536 E.00748
G1 X111.46 Y103.784 E.41054
G2 X111.45 Y106.17 I48.579 J1.395 E.07914
G1 X123.67 Y93.95 E.57324
G1 X124.654 Y93.95 E.03265
G1 X130.538 Y99.834 E.27603
G3 X132.35 Y100.622 I-3.031 J9.452 E.06565
G1 X139.022 Y93.95 E.31298
G1 X139.106 Y93.95 E.00281
G3 X142.603 Y97.761 I-17.673 J19.725 E.17184
G1 X142.713 Y97.935 E.00683
G1 X135.666 Y104.962 E.33012
G1 X144.244 Y113.54 E.40243
G2 X144.55 Y111.45 I-4.806 J-1.77 E.07057
G1 X139.95 Y116.05 E.21576
G1 X139.078 Y116.05 E.02895
G1 X134.189 Y111.161 E.22932
G1 X133.182 Y112.175 E.04741
G2 X132.95 Y112.863 I.963 J.707 E.02447
G1 X132.962 Y115.127 E.07508
G1 X133.008 Y115.316 E.00646
G1 X144.54 Y103.784 E.54097
G3 X144.55 Y106.17 I-48.583 J1.395 E.07914
G1 X132.33 Y93.95 E.57324
G1 X131.346 Y93.95 E.03265
G1 X125.003 Y100.293 E.29757
G2 X124.005 Y100.977 I6.199 J10.112 E.04014
G1 X116.978 Y93.95 E.32965
G1 X116.894 Y93.95 E.00281
G2 X113.397 Y97.761 I17.673 J19.725 E.17184
G1 X113.287 Y97.935 E.00682
G1 X121.29 Y105.938 E.37544
G2 X120.926 Y107.525 I61.638 J14.981 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X121.29 Y105.938 E-.61871
G1 X121.027 Y105.675 E-.14129
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/45
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
G17
G3 Z2.6 I-1.215 J.064 P1  F42000
G1 X123.683 Y156.035 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21827
G3 X117.398 Y147.441 I3.976 J-3.956 E.14516
G1 X117.398 Y134.647 E.42439
G3 X122.519 Y129.079 I5.612 J.023 E.27537
G3 X126.204 Y130.064 I.466 J5.639 E.12905
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.751 Y156.102 E.28192
G1 X123.725 Y156.077 E.00118
G1 X123.913 Y155.71 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19989
G3 X117.79 Y147.433 I3.697 J-3.685 E.12547
G1 X117.79 Y134.656 E.39262
G3 X122.554 Y129.47 I5.219 J.014 E.23747
G3 X125.985 Y130.39 I.432 J5.246 E.11135
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.019 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.973 Y155.71 E.24932
M204 S6000
; WIPE_START
G1 F33600
G1 X122.55 Y154.305 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.541 Y146.937 Z2.8 F42000
G1 X132.933 Y115.893 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.769 Y115.656 E.00956
G3 X132.602 Y114.981 I1.239 J-.664 E.02328
G1 X132.602 Y112.845 E.07085
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.854 Y109.997 E.08588
G2 X135.602 Y108.192 I-1.892 J-1.841 E.0664
G2 X135.536 Y106.033 I-15.725 J-.601 E.0717
G2 X128.51 Y99.898 I-7.047 J.979 E.33743
G2 X126.383 Y100.099 I-.385 J7.295 E.07114
G2 X123.31 Y102.231 I1.6 J5.586 E.12634
G2 X121.823 Y105.307 I7.34 J5.446 E.11399
G2 X120.621 Y111.129 I47.146 J12.77 E.19731
G2 X125.496 Y121.883 I11.583 J1.232 E.41076
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.826 J9.754 E.37932
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.904 J.002 E.62037
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I-.004 J-11.902 E.62039
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.907 J-.003 E.31046
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X141.408 Y95.759 E.1012
G3 X144.898 Y104.185 I-8.417 J8.422 E.31046
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.404 J.006 E.22986
G1 X134.014 Y116.398 E.21477
G3 X132.97 Y115.94 I-.006 J-1.406 E.03894
G1 X132.62 Y116.134 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.534 Y116.022 E.00432
G3 X132.21 Y114.993 I1.473 J-1.03 E.03367
G1 X132.21 Y112.834 E.06634
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.569 Y109.728 E.07954
G2 X135.21 Y108.18 I-1.605 J-1.571 E.05275
G2 X135.148 Y106.086 I-15.304 J-.592 E.06442
G2 X128.504 Y100.29 I-6.658 J.926 E.29548
G2 X126.487 Y100.477 I-.381 J6.87 E.06246
G2 X123.621 Y102.47 I1.49 J5.199 E.10921
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.01 Y111.171 I46.83 J12.672 E.18061
G2 X125.724 Y121.564 I11.191 J1.19 E.36773
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.05 J10.07 E.36265
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.295 J-.003 E.59328
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I.001 J-12.293 E.59331
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.485 I12.293 J-.001 E.29675
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X139.492 Y93.289 E.00343
G1 X141.689 Y95.485 E.09546
G3 X145.29 Y104.18 I-8.692 J8.694 E.29675
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.792 J.002 E.23142
G1 X134.001 Y116.79 E.19957
G3 X132.669 Y116.192 I.007 J-1.798 E.04618
G1 X132.659 Y116.18 E.00051
M204 S6000
; WIPE_START
G1 F33600
G1 X132.534 Y116.022 E-.07623
G1 X132.42 Y115.839 E-.08207
G1 X132.322 Y115.621 E-.0907
G1 X132.264 Y115.435 E-.0742
G1 X132.224 Y115.222 E-.08252
G1 X132.21 Y114.993 E-.08684
G1 X132.21 Y114.29 E-.26744
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z2.8 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z2.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.8 F4000
            G39.3 S1
            G0 Z2.8 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z3.2 F42000
G1 X117.064 Y134.319
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X117.375 Y132.727 I5.981 J.344 E.05399
G1 X111.45 Y126.802 E.27795
G1 X111.45 Y129.198 E.07946
G1 X121.99 Y118.658 E.49446
G2 X125.802 Y122.522 I10.518 J-6.56 E.18152
G1 X111.45 Y136.874 E.67325
G1 X111.45 Y134.478 E.07946
G1 X117.05 Y140.078 E.26268
G1 X117.05 Y138.95 E.03739
G1 X111.45 Y144.55 E.26268
G1 X111.45 Y142.154 E.07946
G1 X117.062 Y147.766 E.26326
G3 X117.05 Y146.626 I14.498 J-.729 E.03782
G1 X111.565 Y152.111 E.25728
G3 X111.45 Y149.83 I18.958 J-2.099 E.07579
G1 X123.67 Y162.05 E.57324
G1 X124.654 Y162.05 E.03265
G1 X130.254 Y156.45 E.26268
G1 X132.394 Y156.45 E.07099
G1 X132.908 Y155.936 E.02413
G1 X137.92 Y160.948 E.23514
G2 X142.168 Y157.52 I-4.966 J-10.496 E.18278
G1 X136.746 Y152.098 E.25434
G1 X135.595 Y153.249 E.05401
; WIPE_START
G1 F33600
G1 X136.746 Y152.098 E-.61876
G1 X137.009 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X138.397 Y144.856 Z2.8 F42000
G1 X138.95 Y141.865 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15476.087
G2 X138.777 Y140.251 I-6.303 J-.139 E.054
G1 X143.05 Y135.977 E.20048
G2 X139.346 Y132.006 I-10.181 J5.784 E.18181
G1 X135.325 Y136.026 E.1886
G1 X130.811 Y132.865 E.18283
M73 P50 R10
G1 X134.831 Y128.845 E.1886
G1 X130.316 Y125.684 E.18283
G1 X126.293 Y129.707 E.18877
G2 X121.289 Y128.965 I-3.314 J5.101 E.17305
G1 X111.45 Y119.126 E.46155
G1 X111.45 Y121.522 E.07946
G1 X120.211 Y112.761 E.41099
G1 X120.212 Y112.536 E.00748
G1 X111.46 Y103.784 E.41054
G2 X111.45 Y106.17 I48.579 J1.395 E.07914
G1 X123.67 Y93.95 E.57324
G1 X124.654 Y93.95 E.03265
G1 X130.538 Y99.834 E.27603
G3 X132.35 Y100.622 I-3.031 J9.452 E.06565
G1 X139.022 Y93.95 E.31298
G1 X139.106 Y93.95 E.00281
G3 X142.603 Y97.761 I-17.673 J19.726 E.17183
G1 X142.713 Y97.935 E.00683
G1 X135.666 Y104.962 E.33012
G1 X144.244 Y113.54 E.40243
G2 X144.55 Y111.45 I-4.806 J-1.77 E.07057
G1 X139.95 Y116.05 E.21576
G1 X139.078 Y116.05 E.02895
G1 X134.189 Y111.161 E.22932
G1 X133.182 Y112.175 E.04741
G2 X132.95 Y112.863 I.963 J.707 E.02447
G1 X132.962 Y115.13 E.0752
G1 X133.008 Y115.316 E.00636
G1 X144.54 Y103.784 E.541
G3 X144.55 Y106.17 I-48.583 J1.395 E.07914
G1 X132.33 Y93.95 E.57324
G1 X131.346 Y93.95 E.03265
G1 X125.003 Y100.293 E.29757
G2 X124.005 Y100.977 I6.199 J10.112 E.04014
G1 X116.978 Y93.95 E.32965
G1 X116.894 Y93.95 E.00281
G2 X113.397 Y97.761 I17.673 J19.725 E.17184
G1 X113.287 Y97.935 E.00683
G1 X121.294 Y105.942 E.37561
G2 X120.927 Y107.528 I18.761 J5.173 E.05402
; WIPE_START
G1 F33600
G1 X121.294 Y105.942 E-.61867
G1 X121.031 Y105.679 E-.14133
; WIPE_END
G1 E-.04 F1800
G1 X120.93 Y113.311 Z2.8 F42000
G1 X120.405 Y153.249 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15476.087
G1 X119.254 Y152.098 E.05401
G1 X113.832 Y157.52 E.25434
G2 X118.08 Y160.948 I9.213 J-7.067 E.18278
G1 X123.092 Y155.936 E.23514
G1 X123.606 Y156.45 E.02413
G1 X125.746 Y156.45 E.07099
G1 X131.346 Y162.05 E.26268
G1 X132.33 Y162.05 E.03265
G1 X144.55 Y149.83 E.57324
G3 X144.435 Y152.111 I-19.073 J.182 E.07579
G1 X138.95 Y146.626 E.25728
G3 X138.938 Y147.766 I-14.511 J.411 E.03782
G1 X144.55 Y142.154 E.26326
G1 X144.55 Y144.55 E.07946
G1 X111.45 Y111.45 E1.55276
G1 X111.45 Y113.846 E.07946
G1 X122.518 Y102.778 E.51919
G3 X123.489 Y101.475 I10.736 J6.989 E.05396
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X123.033 Y102.02 E-.27007
G1 X122.518 Y102.778 E-.34845
G1 X122.254 Y103.042 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/45
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
G17
G3 Z2.8 I-1.217 J.033 P1  F42000
G1 X123.687 Y156.039 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21846
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X117.422 Y134.162 I3.128 J-.091 E.01617
G3 X122.557 Y129.077 I5.585 J.505 E.26049
G3 X126.204 Y130.064 I.432 J5.633 E.12779
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.751 Y156.102 E.28192
G1 X123.73 Y156.081 E.00099
G1 X123.913 Y155.71 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19989
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.577 Y129.469 I5.218 J.013 E.23819
G3 X125.985 Y130.39 I.412 J5.242 E.11063
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.018 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.973 Y155.71 E.24932
M204 S6000
; WIPE_START
G1 F33600
G1 X122.55 Y154.305 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.539 Y146.936 Z3 F42000
G1 X132.922 Y115.884 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.858 Y115.802 E.00346
G3 X132.602 Y114.981 I1.149 J-.809 E.02899
G1 X132.602 Y112.845 E.07084
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.856 Y109.996 E.08596
G2 X135.602 Y108.194 I-1.872 J-1.831 E.06628
G2 X135.536 Y106.033 I-15.739 J-.603 E.07178
G2 X128.51 Y99.898 I-7.047 J.979 E.33743
G2 X126.383 Y100.099 I-.385 J7.295 E.07114
G2 X123.31 Y102.231 I1.6 J5.586 E.12634
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.808 Y109.936 I50.17 J13.427 E.15726
G2 X125.496 Y121.883 I11.379 J2.428 E.45094
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.826 J9.754 E.37932
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.907 J-.002 E.62032
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I-.001 J-11.905 E.62035
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.907 J-.004 E.31046
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X139.308 Y93.66 E.0027
G1 X141.408 Y95.759 E.0985
G3 X144.898 Y104.185 I-8.417 J8.422 E.31046
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.404 J.006 E.22986
G1 X134.018 Y116.398 E.21464
G3 X132.966 Y115.936 I-.01 J-1.406 E.03924
G1 X132.961 Y115.93 E.00027
G1 X132.616 Y116.129 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.538 Y116.027 E.00394
G3 X132.21 Y114.993 I1.47 J-1.035 E.03385
G1 X132.21 Y112.834 E.06634
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.57 Y109.727 E.0796
G2 X135.21 Y108.182 I-1.584 J-1.561 E.05265
G2 X135.148 Y106.086 I-15.315 J-.593 E.06448
G2 X128.504 Y100.29 I-6.658 J.926 E.29548
G2 X126.487 Y100.477 I-.381 J6.87 E.06246
G2 X123.621 Y102.47 I1.49 J5.199 E.10921
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.193 Y110.008 I49.814 J13.319 E.14442
G2 X125.724 Y121.564 I10.994 J2.356 E.40403
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.05 J10.07 E.36265
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.299 J-.007 E.59323
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I.005 J-12.297 E.59325
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.485 I12.299 J.001 E.29674
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X139.585 Y93.382 E.00749
G1 X141.689 Y95.485 E.09139
G3 X145.29 Y104.18 I-8.692 J8.694 E.29675
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.792 J.002 E.23142
G1 X134.006 Y116.79 E.19941
G3 X132.674 Y116.198 I.001 J-1.798 E.04613
G1 X132.654 Y116.175 E.00092
M204 S6000
; WIPE_START
G1 F33600
G1 X132.538 Y116.027 E-.07146
G1 X132.42 Y115.84 E-.08418
G1 X132.332 Y115.647 E-.08067
G1 X132.265 Y115.439 E-.08289
G1 X132.225 Y115.225 E-.08252
G1 X132.21 Y114.993 E-.08837
G1 X132.21 Y114.283 E-.2699
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z3 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z3
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3 F4000
            G39.3 S1
            G0 Z3 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z3.4 F42000
G1 X120.931 Y107.531
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X121.297 Y105.945 I17.747 J3.265 E.05402
G1 X113.287 Y97.935 E.37577
G3 X114.841 Y96.003 I9.971 J6.429 E.08242
G1 X116.894 Y93.95 E.09627
G1 X116.978 Y93.95 E.00281
G1 X124.005 Y100.977 E.32965
G3 X125.009 Y100.287 I4.748 J5.829 E.04048
G1 X131.346 Y93.95 E.29725
G1 X132.33 Y93.95 E.03265
G1 X144.55 Y106.17 E.57324
G2 X144.54 Y103.784 I-48.593 J-.99 E.07914
G1 X133.008 Y115.316 E.54096
G3 X132.963 Y115.143 I.464 J-.215 E.00597
G1 X132.95 Y112.863 E.07561
G3 X133.182 Y112.175 I1.194 J.019 E.02447
G1 X134.189 Y111.161 E.04741
G1 X139.078 Y116.05 E.22932
G1 X139.95 Y116.05 E.02895
G1 X144.55 Y111.45 E.21576
G3 X144.244 Y113.54 I-5.112 J.32 E.07057
G1 X135.666 Y104.962 E.40243
G1 X142.713 Y97.935 E.33012
G2 X141.159 Y96.003 I-9.972 J6.43 E.08242
G1 X139.106 Y93.95 E.09628
G1 X139.022 Y93.95 E.00281
G1 X132.35 Y100.622 E.31298
G2 X130.538 Y99.834 I-4.843 J8.664 E.06565
G1 X124.654 Y93.95 E.27603
G1 X123.67 Y93.95 E.03265
G1 X111.45 Y106.17 E.57324
G3 X111.46 Y103.784 I48.589 J-.99 E.07914
G1 X120.212 Y112.536 E.41054
G1 X120.211 Y112.761 E.00748
G1 X111.45 Y121.522 E.41099
G1 X111.45 Y119.126 E.07946
G1 X121.289 Y128.965 E.46155
G3 X126.293 Y129.707 I1.69 J5.844 E.17305
G1 X130.316 Y125.684 E.18877
G1 X134.831 Y128.845 E.18283
M73 P51 R9
G1 X130.811 Y132.865 E.1886
G1 X135.325 Y136.026 E.18283
G1 X139.346 Y132.006 E.1886
G3 X143.05 Y135.977 I-6.477 J9.755 E.18181
G1 X138.778 Y140.25 E.20043
G3 X138.95 Y141.864 I-6.208 J1.479 E.054
; WIPE_START
G1 F33600
G1 X138.935 Y141.223 E-.2437
G1 X138.778 Y140.25 E-.37457
G1 X139.042 Y139.986 E-.14173
; WIPE_END
G1 E-.04 F1800
G1 X137.122 Y147.373 Z3 F42000
G1 X135.595 Y153.249 Z3
G1 Z2.6
G1 E.8 F1800
G1 F15476.087
G1 X136.746 Y152.098 E.05401
G1 X142.168 Y157.52 E.25434
G3 X137.92 Y160.948 I-9.213 J-7.067 E.18278
G1 X132.908 Y155.936 E.23514
G1 X132.394 Y156.45 E.02413
G1 X130.254 Y156.45 E.07099
G1 X124.654 Y162.05 E.26268
G1 X123.67 Y162.05 E.03265
G1 X111.45 Y149.83 E.57324
G2 X111.565 Y152.111 I19.073 J.182 E.07579
G1 X117.05 Y146.626 E.25728
G2 X117.062 Y147.766 I14.512 J.411 E.03782
G1 X111.45 Y142.154 E.26326
G1 X111.45 Y144.55 E.07946
G1 X117.05 Y138.95 E.26268
G1 X117.05 Y140.078 E.03739
G1 X111.45 Y134.478 E.26268
G1 X111.45 Y136.874 E.07946
G1 X125.802 Y122.522 E.67325
G3 X121.99 Y118.658 I6.709 J-10.428 E.18152
G1 X111.45 Y129.198 E.49445
G1 X111.45 Y126.802 E.07946
G1 X117.375 Y132.727 E.27795
G2 X117.062 Y134.319 I5.74 J1.955 E.05399
; WIPE_START
G1 F33600
G1 X117.121 Y133.736 E-.22259
G1 X117.375 Y132.727 E-.39553
G1 X117.111 Y132.463 E-.14188
; WIPE_END
G1 E-.04 F1800
G1 X118.65 Y124.987 Z3 F42000
G1 X123.489 Y101.475 Z3
G1 Z2.6
G1 E.8 F1800
G1 F15476.087
G2 X122.518 Y102.778 I9.763 J8.291 E.05396
G1 X111.45 Y113.846 E.51919
G1 X111.45 Y111.45 E.07946
G1 X144.55 Y144.55 E1.55276
G1 X144.55 Y142.154 E.07946
G1 X138.938 Y147.766 E.26326
G2 X138.95 Y146.626 I-14.498 J-.729 E.03782
G1 X144.435 Y152.111 E.25728
G2 X144.55 Y149.83 I-18.959 J-2.099 E.07579
G1 X132.33 Y162.05 E.57324
G1 X131.346 Y162.05 E.03265
G1 X125.746 Y156.45 E.26268
G1 X123.606 Y156.45 E.07099
G1 X123.092 Y155.936 E.02413
G1 X118.08 Y160.948 E.23514
G3 X113.832 Y157.52 I4.966 J-10.496 E.18278
G1 X119.254 Y152.098 E.25434
G1 X120.405 Y153.249 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X119.254 Y152.098 E-.61876
G1 X118.991 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/45
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
G17
G3 Z3 I-.75 J.958 P1  F42000
G1 X123.691 Y156.042 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21864
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X117.424 Y134.147 I3.228 J-.087 E.01669
G3 X122.572 Y129.076 I5.582 J.519 E.26048
G3 X126.204 Y130.064 I.418 J5.631 E.12727
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.65 J-.032 E.1451
G1 X132.249 Y156.102 E.22144
G1 X123.751 Y156.102 E.28192
G1 X123.733 Y156.085 E.00081
G1 X123.913 Y155.71 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19989
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.592 Y129.468 I5.217 J.012 E.23867
G3 X125.985 Y130.39 I.398 J5.24 E.11015
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.018 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.258 J-.024 E.12542
G1 X132.087 Y155.71 E.19989
G1 X123.973 Y155.71 E.24932
M204 S6000
; WIPE_START
G1 F33600
G1 X122.55 Y154.305 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.538 Y146.936 Z3.2 F42000
G1 X132.917 Y115.877 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.861 Y115.806 E.003
G3 X132.602 Y114.98 I1.145 J-.812 E.02916
G1 X132.602 Y112.845 E.07083
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.857 Y109.994 E.08603
G2 X135.602 Y108.196 I-1.877 J-1.831 E.06613
G2 X135.536 Y106.033 I-15.752 J-.604 E.07185
G2 X128.51 Y99.898 I-7.047 J.979 E.33743
G2 X126.383 Y100.099 I-.385 J7.296 E.07114
G2 X123.31 Y102.231 I1.6 J5.586 E.12634
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.808 Y109.936 I50.169 J13.427 E.15726
G2 X125.496 Y121.883 I11.383 J2.427 E.45092
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.826 J9.754 E.37932
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.902 J.004 E.62039
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I.002 J-11.907 E.62032
G1 X111.102 Y104.185 E1.5361
G3 X111.982 Y99.691 I11.893 J-.004 E.15287
G3 X114.592 Y95.759 I11.141 J4.563 E.15756
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X139.402 Y93.753 E.00709
G1 X141.408 Y95.759 E.09411
G3 X144.898 Y104.185 I-8.417 J8.422 E.31046
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.404 J.006 E.22986
G1 X133.842 Y116.388 E.22048
G3 X132.97 Y115.941 I.165 J-1.395 E.03318
G1 X132.955 Y115.923 E.00078
G1 X132.611 Y116.122 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.548 Y116.027 E.00351
G3 X132.21 Y114.993 I1.481 J-1.055 E.03395
G1 X132.21 Y112.834 E.06634
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.572 Y109.725 E.07966
G2 X135.21 Y108.184 I-1.731 J-1.62 E.05237
G2 X135.148 Y106.086 I-15.327 J-.595 E.06454
G2 X128.504 Y100.29 I-6.658 J.926 E.29548
G2 X126.487 Y100.477 I-.381 J6.87 E.06246
G2 X123.621 Y102.47 I1.49 J5.199 E.10921
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.193 Y110.008 I49.813 J13.319 E.14442
G2 X125.724 Y121.564 I10.986 J2.359 E.40407
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.05 J10.07 E.36265
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.291 J.001 E.59333
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I.007 J-12.299 E.59323
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.485 I12.302 J.002 E.29674
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X139.679 Y93.476 E.01156
G1 X141.689 Y95.485 E.08733
G3 X145.29 Y104.18 I-8.692 J8.694 E.29675
G1 X145.29 Y111.996 E.24015
G3 X142.375 Y116.406 I-4.795 J-.001 E.17203
G3 X140.496 Y116.79 I-1.877 J-4.391 E.05935
G1 X134.006 Y116.79 E.19941
G3 X132.685 Y116.197 I.022 J-1.818 E.04578
G1 X132.653 Y116.165 E.00137
M204 S6000
; WIPE_START
G1 F33600
G1 X132.548 Y116.027 E-.06597
G1 X132.422 Y115.845 E-.08414
G1 X132.333 Y115.651 E-.08086
G1 X132.266 Y115.443 E-.0832
G1 X132.225 Y115.229 E-.08269
G1 X132.21 Y114.993 E-.0899
G1 X132.21 Y114.274 E-.27325
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z3.2 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z3.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.2 F4000
            G39.3 S1
            G0 Z3.2 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z3.6 F42000
G1 X117.062 Y134.319
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X117.375 Y132.727 I6.053 J.363 E.05399
G1 X111.45 Y126.802 E.27795
G1 X111.45 Y129.198 E.07946
G1 X121.99 Y118.658 E.49444
G2 X125.802 Y122.522 I10.524 J-6.568 E.18152
G1 X111.45 Y136.874 E.67325
G1 X111.45 Y134.478 E.07946
G1 X117.05 Y140.078 E.26268
G1 X117.05 Y138.95 E.03739
G1 X111.45 Y144.55 E.26268
G1 X111.45 Y142.154 E.07946
G1 X117.062 Y147.766 E.26326
G3 X117.05 Y146.626 I14.498 J-.729 E.03782
G1 X111.565 Y152.111 E.25728
G3 X111.45 Y149.83 I18.958 J-2.099 E.07579
G1 X123.67 Y162.05 E.57324
G1 X124.654 Y162.05 E.03265
G1 X130.254 Y156.45 E.26268
G1 X132.394 Y156.45 E.07099
G1 X132.908 Y155.936 E.02413
G1 X137.92 Y160.948 E.23514
G2 X142.168 Y157.52 I-4.966 J-10.496 E.18278
G1 X136.746 Y152.098 E.25434
G1 X135.595 Y153.249 E.05401
; WIPE_START
G1 F33600
M73 P52 R9
G1 X136.746 Y152.098 E-.61876
G1 X137.009 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X138.397 Y144.856 Z3.2 F42000
G1 X138.95 Y141.864 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F15476.087
G2 X138.778 Y140.25 I-6.38 J-.135 E.054
G1 X143.05 Y135.977 E.20043
G2 X139.346 Y132.006 I-10.181 J5.784 E.18181
G1 X135.325 Y136.026 E.1886
G1 X130.811 Y132.865 E.18283
G1 X134.831 Y128.845 E.1886
G1 X130.316 Y125.684 E.18283
G1 X126.293 Y129.707 E.18877
G2 X121.289 Y128.965 I-3.314 J5.101 E.17305
G1 X111.45 Y119.126 E.46155
G1 X111.45 Y121.522 E.07946
G1 X120.211 Y112.761 E.41099
G1 X120.212 Y112.536 E.00748
G1 X111.46 Y103.784 E.41054
G2 X111.45 Y106.17 I48.579 J1.395 E.07914
G1 X123.67 Y93.95 E.57324
G1 X124.654 Y93.95 E.03265
G1 X130.538 Y99.834 E.27603
G3 X132.35 Y100.622 I-3.031 J9.452 E.06565
G1 X139.022 Y93.95 E.31298
G3 X139.155 Y93.999 I.042 J.091 E.00525
G3 X142.603 Y97.761 I-17.448 J19.451 E.16953
G1 X142.713 Y97.935 E.00683
G1 X135.666 Y104.962 E.33012
G1 X144.244 Y113.54 E.40243
G2 X144.55 Y111.45 I-4.806 J-1.77 E.07057
G1 X139.95 Y116.05 E.21576
G1 X139.078 Y116.05 E.02895
G1 X134.189 Y111.161 E.22932
G1 X133.182 Y112.175 E.04741
G2 X132.95 Y112.863 I.963 J.707 E.02447
G1 X132.963 Y115.145 E.0757
G2 X133.008 Y115.316 I.513 J-.044 E.00588
G1 X144.54 Y103.784 E.54097
G3 X144.55 Y106.17 I-48.583 J1.395 E.07914
G1 X132.33 Y93.95 E.57324
G1 X131.346 Y93.95 E.03265
G1 X125.009 Y100.287 E.29725
G2 X124.005 Y100.977 I3.744 J6.521 E.04048
G1 X116.978 Y93.95 E.32965
G1 X116.894 Y93.95 E.00281
G2 X113.397 Y97.761 I17.673 J19.726 E.17183
G1 X113.287 Y97.935 E.00683
G1 X121.297 Y105.945 E.37577
G2 X120.931 Y107.531 I17.38 J4.852 E.05402
; WIPE_START
G1 F33600
G1 X121.297 Y105.945 E-.61861
G1 X121.034 Y105.682 E-.14139
; WIPE_END
G1 E-.04 F1800
G1 X120.933 Y113.314 Z3.2 F42000
G1 X120.405 Y153.249 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F15476.087
G1 X119.254 Y152.098 E.05401
G1 X113.832 Y157.52 E.25434
G2 X118.08 Y160.948 I9.213 J-7.067 E.18278
G1 X123.092 Y155.936 E.23514
G1 X123.606 Y156.45 E.02413
G1 X125.746 Y156.45 E.07099
G1 X131.346 Y162.05 E.26268
G1 X132.33 Y162.05 E.03265
G1 X144.55 Y149.83 E.57324
G3 X144.435 Y152.111 I-19.074 J.182 E.07579
G1 X138.95 Y146.626 E.25728
G3 X138.938 Y147.766 I-14.51 J.411 E.03782
G1 X144.55 Y142.154 E.26326
G1 X144.55 Y144.55 E.07946
G1 X111.45 Y111.45 E1.55276
G1 X111.45 Y113.846 E.07946
G1 X122.518 Y102.778 E.51919
G3 X123.489 Y101.475 I10.736 J6.988 E.05396
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X123.033 Y102.02 E-.27007
G1 X122.518 Y102.778 E-.34845
G1 X122.254 Y103.042 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/45
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
G17
G3 Z3.2 I-1.217 J.033 P1  F42000
G1 X123.695 Y156.046 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21881
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X117.425 Y134.131 I3.328 J-.083 E.0172
G3 X122.588 Y129.076 I5.579 J.533 E.26047
G3 X126.204 Y130.064 I.404 J5.629 E.12676
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.231 J4.587 E.17763
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.751 Y156.102 E.28192
G1 X123.737 Y156.089 E.00064
G1 X123.913 Y155.71 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19989
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.608 Y129.467 I5.216 J.012 E.23914
G3 X125.985 Y130.39 I.383 J5.238 E.10967
G1 X135.991 Y137.397 E.37535
G3 X138.21 Y141.658 I-3 J4.27 E.15342
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.973 Y155.71 E.24932
M204 S6000
; WIPE_START
G1 F33600
G1 X122.55 Y154.305 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.537 Y146.936 Z3.4 F42000
G1 X132.913 Y115.872 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.843 Y115.778 E.0039
G3 X132.602 Y114.98 I1.166 J-.787 E.02807
G1 X132.602 Y112.845 E.07081
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.859 Y109.992 E.08611
G2 X135.602 Y108.198 I-1.883 J-1.831 E.06598
G2 X135.536 Y106.033 I-15.765 J-.605 E.07193
G2 X128.51 Y99.898 I-7.047 J.979 E.33743
G2 X126.383 Y100.099 I-.385 J7.296 E.07114
G2 X123.31 Y102.231 I1.6 J5.586 E.12634
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.808 Y109.936 I50.17 J13.427 E.15726
G2 X122.03 Y118.045 I11.488 J2.414 E.27788
G2 X125.496 Y121.883 I10.152 J-5.682 E.17299
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.826 J9.754 E.37932
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.907 J-.002 E.62032
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I-.002 J-11.904 E.62037
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.907 J-.003 E.31046
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X139.495 Y93.847 E.01148
G1 X141.408 Y95.759 E.08972
G3 X144.898 Y104.185 I-8.417 J8.422 E.31046
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.407 J.003 E.22981
G1 X134.017 Y116.398 E.21466
G3 X132.966 Y115.936 I-.008 J-1.407 E.03923
G1 X132.952 Y115.918 E.00074
G1 X132.605 Y116.113 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.513 Y115.99 E.00473
G3 X132.21 Y114.993 I1.497 J-1 E.03247
G1 X132.21 Y112.834 E.06633
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.573 Y109.724 E.07972
G2 X135.21 Y108.186 I-1.726 J-1.616 E.05226
G2 X135.148 Y106.086 I-15.338 J-.596 E.0646
G2 X128.504 Y100.29 I-6.658 J.926 E.29548
G2 X126.487 Y100.477 I-.381 J6.871 E.06246
G2 X123.621 Y102.47 I1.49 J5.199 E.10921
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.193 Y110.008 I49.813 J13.319 E.14442
G2 X125.724 Y121.564 I10.986 J2.359 E.40407
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.05 J10.07 E.36265
G1 X145.29 Y150.497 E.2714
G3 X145.072 Y152.794 I-12.141 J.005 E.07099
G3 X132.997 Y162.79 I-12.08 J-2.302 E.52224
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I.003 J-12.296 E.59327
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.485 I12.293 J-.001 E.29675
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X139.772 Y93.569 E.01562
G1 X141.689 Y95.485 E.08326
G3 X145.29 Y104.18 I-8.692 J8.694 E.29675
G1 X145.29 Y111.996 E.24015
G3 X144.794 Y114.118 I-4.775 J.003 E.06756
G3 X140.496 Y116.79 I-4.305 J-2.132 E.16378
G1 X134.006 Y116.79 E.19942
G3 X132.681 Y116.204 I.004 J-1.8 E.04583
G1 X132.644 Y116.159 E.00178
M204 S6000
; WIPE_START
G1 F33600
G1 X132.513 Y115.99 E-.08123
G1 X132.335 Y115.656 E-.1436
G1 X132.267 Y115.447 E-.08351
G1 X132.226 Y115.233 E-.08284
G1 X132.21 Y114.993 E-.09144
G1 X132.21 Y114.263 E-.2774
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z3.4 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z3.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.4 F4000
            G39.3 S1
            G0 Z3.4 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z3.8 F42000
G1 X120.931 Y107.531
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X121.297 Y105.945 I17.747 J3.265 E.05402
G1 X113.287 Y97.935 E.37577
G3 X114.841 Y96.003 I9.971 J6.43 E.08242
G1 X116.894 Y93.95 E.09627
G1 X116.978 Y93.95 E.00281
G1 X124.005 Y100.977 E.32965
G3 X125.009 Y100.287 I4.749 J5.83 E.04048
G1 X131.346 Y93.95 E.29725
G1 X132.33 Y93.95 E.03265
G1 X144.55 Y106.17 E.57324
G2 X144.54 Y103.784 I-48.593 J-.99 E.07914
G1 X133.008 Y115.316 E.54099
G3 X132.95 Y114.969 I.911 J-.329 E.01176
G1 X132.95 Y112.864 E.0698
G3 X133.182 Y112.175 I1.195 J.019 E.0245
G1 X134.189 Y111.161 E.04741
G1 X139.076 Y116.048 E.22923
G1 X139.951 Y116.049 E.02904
M73 P53 R9
G1 X144.55 Y111.45 E.21573
G3 X144.244 Y113.54 I-5.112 J.32 E.07057
G1 X135.666 Y104.962 E.40243
G1 X142.713 Y97.935 E.33012
G2 X141.56 Y96.424 I-13.975 J9.472 E.06308
G2 X139.106 Y93.95 I-282.385 J277.598 E.11558
G1 X139.022 Y93.95 E.00281
G1 X132.35 Y100.622 E.31298
G2 X130.538 Y99.834 I-4.843 J8.664 E.06565
G1 X124.654 Y93.95 E.27603
G1 X123.67 Y93.95 E.03265
G1 X111.45 Y106.17 E.57324
G3 X111.46 Y103.784 I48.589 J-.99 E.07914
G1 X120.212 Y112.536 E.41054
G1 X120.211 Y112.761 E.00748
G1 X111.45 Y121.522 E.41099
G1 X111.45 Y119.126 E.07946
G1 X121.289 Y128.965 E.46155
G3 X126.293 Y129.707 I1.69 J5.844 E.17305
G1 X130.316 Y125.684 E.18877
G1 X134.831 Y128.845 E.18283
G1 X130.811 Y132.865 E.1886
G1 X135.325 Y136.026 E.18283
G1 X139.346 Y132.006 E.1886
G3 X143.05 Y135.977 I-6.477 J9.755 E.18181
G1 X138.778 Y140.25 E.20043
G3 X138.95 Y141.864 I-6.208 J1.479 E.054
; WIPE_START
G1 F33600
G1 X138.935 Y141.223 E-.2437
G1 X138.778 Y140.25 E-.37457
G1 X139.042 Y139.986 E-.14173
; WIPE_END
G1 E-.04 F1800
G1 X137.122 Y147.373 Z3.4 F42000
G1 X135.595 Y153.249 Z3.4
G1 Z3
G1 E.8 F1800
G1 F15476.087
G1 X136.746 Y152.098 E.05401
G1 X142.168 Y157.52 E.25434
G3 X137.92 Y160.948 I-9.213 J-7.067 E.18278
G1 X132.908 Y155.936 E.23514
G1 X132.394 Y156.45 E.02413
G1 X130.254 Y156.45 E.07099
G1 X124.654 Y162.05 E.26268
G1 X123.67 Y162.05 E.03265
G1 X111.45 Y149.83 E.57324
G2 X111.565 Y152.111 I19.073 J.182 E.07579
G1 X117.05 Y146.626 E.25728
G2 X117.062 Y147.766 I14.511 J.411 E.03782
G1 X111.45 Y142.154 E.26326
G1 X111.45 Y144.55 E.07946
G1 X117.05 Y138.95 E.26268
G1 X117.05 Y140.078 E.03739
G1 X111.45 Y134.478 E.26268
G1 X111.45 Y136.874 E.07946
G1 X125.802 Y122.522 E.67325
G3 X121.99 Y118.658 I6.715 J-10.436 E.18152
G1 X111.45 Y129.198 E.49444
G1 X111.45 Y126.802 E.07946
G1 X117.375 Y132.727 E.27795
G2 X117.062 Y134.319 I5.74 J1.955 E.05399
; WIPE_START
G1 F33600
G1 X117.121 Y133.736 E-.22259
G1 X117.375 Y132.727 E-.39553
G1 X117.111 Y132.463 E-.14188
; WIPE_END
G1 E-.04 F1800
G1 X118.65 Y124.987 Z3.4 F42000
G1 X123.489 Y101.475 Z3.4
G1 Z3
G1 E.8 F1800
G1 F15476.087
G2 X122.518 Y102.778 I9.764 J8.292 E.05396
G1 X111.45 Y113.846 E.51919
G1 X111.45 Y111.45 E.07946
G1 X144.55 Y144.55 E1.55276
G1 X144.55 Y142.154 E.07946
G1 X138.938 Y147.766 E.26326
G2 X138.95 Y146.626 I-14.499 J-.729 E.03782
G1 X144.435 Y152.111 E.25728
G2 X144.55 Y149.83 I-18.958 J-2.099 E.07579
G1 X132.33 Y162.05 E.57324
G1 X131.346 Y162.05 E.03265
G1 X125.746 Y156.45 E.26268
G1 X123.606 Y156.45 E.07099
G1 X123.092 Y155.936 E.02413
G1 X118.08 Y160.948 E.23514
G3 X113.832 Y157.52 I4.966 J-10.496 E.18278
G1 X119.254 Y152.098 E.25434
G1 X120.405 Y153.249 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X119.254 Y152.098 E-.61876
G1 X118.991 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/45
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
G17
G3 Z3.4 I-.751 J.958 P1  F42000
G1 X123.698 Y156.049 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21897
G3 X117.398 Y147.441 I4.02 J-3.974 E.1451
G1 X117.398 Y134.648 E.42435
G3 X117.427 Y134.116 I3.428 J-.079 E.01772
G3 X122.603 Y129.075 I5.576 J.548 E.26047
G3 X126.204 Y130.064 I.389 J5.627 E.12624
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.751 Y156.102 E.28192
G1 X123.74 Y156.092 E.00048
G1 X123.913 Y155.71 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19989
G3 X117.79 Y147.433 I3.735 J-3.701 E.12542
G1 X117.79 Y134.656 E.3926
G3 X122.623 Y129.466 I5.215 J.012 E.23962
G3 X125.985 Y130.39 I.369 J5.236 E.10919
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.018 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.973 Y155.71 E.24932
M204 S6000
; WIPE_START
G1 F33600
G1 X122.55 Y154.305 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.536 Y146.935 Z3.6 F42000
G1 X132.908 Y115.865 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.838 Y115.771 E.00388
G3 X132.602 Y114.98 I1.171 J-.78 E.02781
G1 X132.602 Y112.845 E.0708
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.86 Y109.991 E.08618
G2 X135.602 Y108.201 I-1.929 J-1.848 E.06578
G2 X135.536 Y106.033 I-15.779 J-.607 E.072
G2 X128.51 Y99.898 I-7.045 J.977 E.33745
G2 X126.383 Y100.099 I-.385 J7.296 E.07114
G2 X123.31 Y102.231 I1.6 J5.586 E.12634
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.808 Y109.936 I50.169 J13.427 E.15726
G2 X122.046 Y118.072 I11.486 J2.414 E.27891
G2 X125.496 Y121.883 I10.135 J-5.708 E.17195
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.826 J9.754 E.37932
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.902 J.004 E.62039
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I.002 J-11.907 E.62032
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.907 J-.003 E.31046
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X139.589 Y93.94 E.01587
G1 X141.408 Y95.759 E.08533
G3 X144.898 Y104.185 I-8.417 J8.422 E.31046
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.404 J.006 E.22986
G1 X134.017 Y116.398 E.21467
G3 X132.971 Y115.941 I-.008 J-1.407 E.03898
G1 X132.947 Y115.911 E.00128
G1 X132.6 Y116.105 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.509 Y115.983 E.0047
G3 X132.21 Y114.993 I1.502 J-.993 E.03222
G1 X132.21 Y112.834 E.06633
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.574 Y109.722 E.07978
G2 X135.21 Y108.188 I-1.633 J-1.575 E.05224
G2 X135.148 Y106.086 I-15.35 J-.597 E.06466
G2 X128.504 Y100.29 I-6.655 J.923 E.29551
G2 X126.487 Y100.477 I-.381 J6.871 E.06246
G2 X123.621 Y102.47 I1.49 J5.199 E.10921
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.193 Y110.008 I49.813 J13.319 E.14442
G2 X125.724 Y121.564 I11.002 J2.353 E.404
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.05 J10.07 E.36265
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.291 J.001 E.59333
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I.007 J-12.299 E.59323
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.485 I12.293 J-.001 E.29675
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X139.866 Y93.663 E.01969
G1 X141.689 Y95.485 E.07919
G3 X145.29 Y104.18 I-8.692 J8.694 E.29675
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.792 J.002 E.23142
G1 X134.006 Y116.79 E.19942
G3 X132.686 Y116.209 I.005 J-1.8 E.0456
G1 X132.638 Y116.151 E.00228
M204 S6000
; WIPE_START
G1 F33600
G1 X132.509 Y115.983 E-.08089
G1 X132.337 Y115.661 E-.13851
G1 X132.269 Y115.451 E-.08381
G1 X132.226 Y115.237 E-.083
G1 X132.21 Y114.993 E-.09298
G1 X132.21 Y114.254 E-.28081
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z3.6 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z3.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.6 F4000
            G39.3 S1
            G0 Z3.6 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z4 F42000
G1 X117.062 Y134.319
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X117.375 Y132.727 I6.053 J.363 E.05399
G1 X111.45 Y126.802 E.27795
G1 X111.45 Y129.198 E.07946
G1 X121.99 Y118.658 E.49443
G2 X125.802 Y122.522 I10.53 J-6.575 E.18152
G1 X111.45 Y136.874 E.67325
G1 X111.45 Y134.478 E.07946
M73 P54 R9
G1 X117.05 Y140.078 E.26268
G1 X117.05 Y138.95 E.03739
G1 X111.45 Y144.55 E.26268
G1 X111.45 Y142.154 E.07946
G1 X117.062 Y147.766 E.26326
G3 X117.05 Y146.626 I14.496 J-.729 E.03782
G1 X111.565 Y152.111 E.25728
G3 X111.45 Y149.83 I18.958 J-2.099 E.07579
G1 X123.67 Y162.05 E.57324
G1 X124.654 Y162.05 E.03265
G1 X130.254 Y156.45 E.26268
G1 X132.394 Y156.45 E.07099
G1 X132.908 Y155.936 E.02413
G1 X137.92 Y160.948 E.23514
G2 X142.168 Y157.52 I-4.966 J-10.496 E.18278
G1 X136.746 Y152.098 E.25434
G1 X135.595 Y153.249 E.05401
; WIPE_START
G1 F33600
G1 X136.746 Y152.098 E-.61876
G1 X137.009 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X138.397 Y144.856 Z3.6 F42000
G1 X138.95 Y141.864 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F15476.087
G2 X138.778 Y140.25 I-6.38 J-.135 E.054
G1 X143.05 Y135.977 E.20043
G2 X139.346 Y132.006 I-10.181 J5.784 E.18181
G1 X135.325 Y136.026 E.1886
G1 X130.811 Y132.865 E.18283
G1 X134.831 Y128.845 E.1886
G1 X130.316 Y125.684 E.18283
G1 X126.293 Y129.707 E.18877
G2 X121.289 Y128.965 I-3.314 J5.101 E.17305
G1 X111.45 Y119.126 E.46155
G1 X111.45 Y121.522 E.07946
G1 X120.215 Y112.757 E.41118
G3 X120.208 Y112.532 I2.367 J-.195 E.00748
G1 X111.46 Y103.784 E.41035
G2 X111.45 Y106.17 I48.579 J1.395 E.07914
G1 X123.67 Y93.95 E.57324
G1 X124.654 Y93.95 E.03265
G1 X130.538 Y99.834 E.27603
G3 X132.35 Y100.622 I-3.031 J9.452 E.06565
G1 X139.022 Y93.95 E.31298
G1 X139.106 Y93.95 E.00281
G3 X141.928 Y96.851 I-74.979 J75.758 E.13423
G3 X142.713 Y97.935 I-9.756 J7.893 E.04443
G1 X135.666 Y104.962 E.33012
G1 X144.244 Y113.54 E.40243
G2 X144.55 Y111.45 I-4.806 J-1.77 E.07057
G1 X139.951 Y116.049 E.21573
G1 X139.076 Y116.048 E.02904
G1 X134.189 Y111.161 E.22924
G1 X133.182 Y112.175 E.04741
G2 X132.95 Y112.864 I.964 J.708 E.0245
G2 X132.962 Y115.14 I16.862 J1.052 E.07556
G2 X133.007 Y115.317 I.553 J-.048 E.00607
G1 X144.54 Y103.784 E.54101
G3 X144.55 Y106.17 I-48.583 J1.395 E.07914
G1 X132.33 Y93.95 E.57324
G1 X131.346 Y93.95 E.03265
G1 X125.01 Y100.287 E.29725
G2 X124.005 Y100.977 I3.744 J6.52 E.04048
G1 X116.978 Y93.95 E.32965
G1 X116.894 Y93.95 E.00281
G2 X113.397 Y97.761 I17.673 J19.726 E.17183
G1 X113.287 Y97.935 E.00683
G1 X121.297 Y105.945 E.37577
G2 X120.931 Y107.531 I17.38 J4.852 E.05402
; WIPE_START
G1 F33600
G1 X121.297 Y105.945 E-.61861
G1 X121.034 Y105.682 E-.14139
; WIPE_END
G1 E-.04 F1800
G1 X120.933 Y113.314 Z3.6 F42000
G1 X120.405 Y153.249 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F15476.087
G1 X119.254 Y152.098 E.05401
G1 X113.832 Y157.52 E.25434
G2 X118.08 Y160.948 I9.213 J-7.067 E.18278
G1 X123.092 Y155.936 E.23514
G1 X123.606 Y156.45 E.02413
G1 X125.746 Y156.45 E.07099
G1 X131.346 Y162.05 E.26268
G1 X132.33 Y162.05 E.03265
G1 X144.55 Y149.83 E.57324
G3 X144.435 Y152.111 I-19.074 J.182 E.07579
G1 X138.95 Y146.626 E.25728
G3 X138.938 Y147.766 I-14.51 J.411 E.03782
G1 X144.55 Y142.154 E.26326
G1 X144.55 Y144.55 E.07946
G1 X111.45 Y111.45 E1.55276
G1 X111.45 Y113.846 E.07946
G1 X122.518 Y102.778 E.51919
G3 X123.489 Y101.475 I10.735 J6.988 E.05396
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X123.033 Y102.02 E-.27008
G1 X122.518 Y102.778 E-.34845
G1 X122.254 Y103.042 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/45
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
G17
G3 Z3.6 I-1.217 J.033 P1  F42000
G1 X123.701 Y156.053 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21911
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X117.429 Y134.1 I3.527 J-.075 E.01823
G3 X122.619 Y129.074 I5.573 J.562 E.26046
G3 X126.204 Y130.064 I.375 J5.626 E.12572
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.247 J4.595 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.751 Y156.102 E.28192
G1 X123.743 Y156.095 E.00033
G1 X123.907 Y155.704 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19964
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.639 Y129.466 I5.215 J.012 E.2401
G3 X125.985 Y130.39 I.355 J5.234 E.10871
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.015 J4.278 E.15338
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.965 Y155.71 E.24957
M204 S6000
; WIPE_START
G1 F33600
G1 X122.543 Y154.304 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.529 Y146.934 Z3.8 F42000
G1 X132.903 Y115.857 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.834 Y115.764 E.00385
G3 X132.602 Y114.979 I1.176 J-.774 E.02755
G1 X132.602 Y112.845 E.07079
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.862 Y109.989 E.08625
G2 X135.602 Y108.203 I-1.932 J-1.847 E.06563
G2 X135.536 Y106.033 I-15.792 J-.608 E.07207
G2 X128.51 Y99.898 I-7.047 J.979 E.33743
G2 X126.383 Y100.099 I-.385 J7.296 E.07114
G2 X123.31 Y102.231 I1.6 J5.586 E.12634
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.808 Y109.936 I50.169 J13.426 E.15726
G2 X125.496 Y121.883 I11.39 J2.424 E.45089
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.826 J9.754 E.37932
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.905 J0 E.62034
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I0 J-11.906 E.62034
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.919 J.001 E.31044
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X139.682 Y94.034 E.02025
G1 X141.408 Y95.759 E.08095
G3 X144.898 Y104.185 I-8.417 J8.422 E.31046
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.407 J.003 E.22981
G1 X134.016 Y116.398 E.21468
G3 X132.976 Y115.946 I-.007 J-1.407 E.03873
G1 X132.941 Y115.904 E.00181
G1 X132.595 Y116.097 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.504 Y115.976 E.00467
G3 X132.21 Y114.993 I1.506 J-.986 E.03197
G1 X132.21 Y112.834 E.06632
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.576 Y109.721 E.07984
G2 X135.21 Y108.19 I-1.636 J-1.575 E.05212
G2 X135.148 Y106.086 I-15.361 J-.598 E.06472
G2 X128.504 Y100.29 I-6.658 J.926 E.29548
G2 X126.487 Y100.477 I-.381 J6.871 E.06246
G2 X123.621 Y102.47 I1.49 J5.199 E.10921
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.193 Y110.008 I49.813 J13.319 E.14442
G2 X125.724 Y121.564 I11.004 J2.352 E.40399
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.05 J10.07 E.36265
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.297 J-.005 E.59325
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I.005 J-12.298 E.59325
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.486 I12.311 J.006 E.29673
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X139.96 Y93.757 E.02375
G1 X141.689 Y95.485 E.07513
G3 X145.29 Y104.18 I-8.692 J8.694 E.29675
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.799 J-.005 E.23133
G1 X134.006 Y116.79 E.19943
G3 X132.691 Y116.214 I.005 J-1.801 E.04538
G1 X132.633 Y116.144 E.00278
M204 S6000
; WIPE_START
G1 F33600
G1 X132.504 Y115.976 E-.08053
G1 X132.338 Y115.663 E-.13447
G1 X132.27 Y115.457 E-.0824
G1 X132.227 Y115.241 E-.08384
G1 X132.21 Y114.993 E-.0945
G1 X132.21 Y114.245 E-.28426
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z3.8 I0.86 J0.86 P1 F20000 ; spiral lift a little
M73 P55 R9
G1 Z3.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.8 F4000
            G39.3 S1
            G0 Z3.8 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z4.2 F42000
G1 X120.931 Y107.531
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X121.297 Y105.945 I17.747 J3.265 E.05402
G1 X113.287 Y97.935 E.37577
G3 X114.841 Y96.003 I9.972 J6.43 E.08242
G1 X116.894 Y93.95 E.09627
G1 X116.978 Y93.95 E.00281
G1 X124.005 Y100.977 E.32965
G3 X125.009 Y100.287 I4.749 J5.83 E.04048
G1 X131.346 Y93.95 E.29725
G1 X132.33 Y93.95 E.03265
G1 X144.55 Y106.17 E.57324
G2 X144.54 Y103.784 I-48.593 J-.99 E.07914
G1 X133.007 Y115.317 E.54104
G3 X132.95 Y114.967 I.974 J-.336 E.01182
G1 X132.95 Y112.864 E.06976
G3 X133.182 Y112.175 I1.195 J.019 E.0245
G1 X134.189 Y111.161 E.04741
G1 X139.076 Y116.048 E.22925
G1 X139.951 Y116.049 E.02903
G1 X144.55 Y111.45 E.21573
G3 X144.236 Y113.532 I-4.834 J.335 E.07038
G1 X135.666 Y104.962 E.40202
G1 X142.713 Y97.935 E.33012
G2 X141.56 Y96.424 I-13.976 J9.473 E.06308
G2 X139.106 Y93.95 I-259.565 J254.968 E.11558
G1 X139.022 Y93.95 E.00281
G1 X132.35 Y100.622 E.31298
G2 X130.538 Y99.834 I-4.843 J8.664 E.06565
G1 X124.654 Y93.95 E.27603
G1 X123.67 Y93.95 E.03265
G1 X111.45 Y106.17 E.57324
G3 X111.46 Y103.784 I48.589 J-.99 E.07914
G1 X120.208 Y112.532 E.41038
G2 X120.215 Y112.757 I2.374 J.043 E.00747
G1 X111.45 Y121.522 E.41116
G1 X111.45 Y119.126 E.07946
G1 X121.289 Y128.965 E.46155
G3 X126.293 Y129.707 I1.69 J5.844 E.17305
G1 X130.316 Y125.684 E.18877
G1 X134.831 Y128.845 E.18283
G1 X130.811 Y132.865 E.1886
G1 X135.325 Y136.026 E.18283
G1 X139.346 Y132.006 E.1886
G3 X143.05 Y135.977 I-6.477 J9.755 E.18181
G1 X138.778 Y140.25 E.20043
G3 X138.95 Y141.864 I-6.208 J1.479 E.054
; WIPE_START
G1 F33600
G1 X138.935 Y141.223 E-.2437
G1 X138.778 Y140.25 E-.37457
G1 X139.042 Y139.986 E-.14173
; WIPE_END
G1 E-.04 F1800
G1 X137.122 Y147.373 Z3.8 F42000
G1 X135.595 Y153.249 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F15476.087
G1 X136.746 Y152.098 E.05401
G1 X142.168 Y157.52 E.25434
G3 X137.92 Y160.948 I-9.213 J-7.067 E.18278
G1 X132.908 Y155.936 E.23514
G1 X132.394 Y156.45 E.02413
G1 X130.254 Y156.45 E.07099
G1 X124.654 Y162.05 E.26268
G1 X123.67 Y162.05 E.03265
G1 X111.45 Y149.83 E.57324
G2 X111.565 Y152.111 I19.073 J.182 E.07579
G1 X117.05 Y146.626 E.25728
G2 X117.062 Y147.766 I14.511 J.411 E.03782
G1 X111.45 Y142.154 E.26326
G1 X111.45 Y144.55 E.07946
G1 X117.05 Y138.95 E.26268
G1 X117.05 Y140.078 E.03739
G1 X111.45 Y134.478 E.26268
G1 X111.45 Y136.874 E.07946
G1 X125.802 Y122.522 E.67325
G3 X121.996 Y118.652 I7.353 J-11.038 E.18133
G1 X111.45 Y129.198 E.49471
G1 X111.45 Y126.802 E.07946
G1 X117.375 Y132.727 E.27795
G2 X117.062 Y134.319 I5.74 J1.955 E.05399
; WIPE_START
G1 F33600
G1 X117.121 Y133.736 E-.22259
G1 X117.375 Y132.727 E-.39553
G1 X117.111 Y132.463 E-.14188
; WIPE_END
G1 E-.04 F1800
G1 X118.65 Y124.987 Z3.8 F42000
G1 X123.489 Y101.475 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F15476.087
G2 X122.518 Y102.778 I9.764 J8.292 E.05396
G1 X111.45 Y113.846 E.51919
G1 X111.45 Y111.45 E.07946
G1 X144.55 Y144.55 E1.55276
G1 X144.55 Y142.154 E.07946
G1 X138.938 Y147.766 E.26326
G2 X138.95 Y146.626 I-14.497 J-.729 E.03782
G1 X144.435 Y152.111 E.25728
G2 X144.55 Y149.83 I-18.959 J-2.099 E.07579
G1 X132.33 Y162.05 E.57324
G1 X131.346 Y162.05 E.03265
G1 X125.746 Y156.45 E.26268
G1 X123.606 Y156.45 E.07099
G1 X123.092 Y155.936 E.02413
G1 X118.08 Y160.948 E.23514
G3 X113.832 Y157.52 I4.966 J-10.496 E.18278
G1 X119.254 Y152.098 E.25434
G1 X120.405 Y153.249 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X119.254 Y152.098 E-.61876
G1 X118.991 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/45
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
G17
G3 Z3.8 I-.751 J.958 P1  F42000
G1 X123.704 Y156.055 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21924
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X117.431 Y134.085 I3.628 J-.071 E.01875
G3 X122.634 Y129.073 I5.571 J.577 E.26046
G3 X126.204 Y130.064 I.36 J5.625 E.1252
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.751 Y156.102 E.28192
G1 X123.746 Y156.098 E.00021
G1 X123.928 Y155.71 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X123.913 Y155.71 E.00047
G1 X119.313 Y151.11 E.19989
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.655 Y129.465 I5.214 J.011 E.24057
G3 X125.985 Y130.39 I.34 J5.233 E.10823
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.018 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.988 Y155.71 E.24885
M204 S6000
; WIPE_START
G1 F33600
G1 X123.913 Y155.71 E-.0286
G1 X122.552 Y154.349 E-.7314
; WIPE_END
G1 E-.04 F1800
G1 X124.533 Y146.978 Z4 F42000
G1 X132.896 Y115.851 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.87 Y115.82 E.00133
G3 X132.602 Y114.984 I1.135 J-.825 E.02963
G1 X132.602 Y112.845 E.07095
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.864 Y109.988 E.08632
G2 X135.602 Y108.205 I-1.936 J-1.846 E.06549
G2 X135.536 Y106.033 I-15.805 J-.609 E.07214
G2 X128.51 Y99.898 I-7.047 J.979 E.33743
G2 X126.383 Y100.099 I-.385 J7.296 E.07114
G2 X123.31 Y102.231 I1.6 J5.586 E.12634
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.808 Y109.936 I50.169 J13.427 E.15726
G2 X125.496 Y121.883 I11.392 J2.423 E.45088
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.826 J9.754 E.37932
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.907 J-.002 E.62032
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I.002 J-11.907 E.62032
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.907 J-.003 E.31046
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X139.776 Y94.127 E.02464
G3 X141.816 Y96.188 I-40.944 J42.576 E.09618
G3 X144.898 Y104.185 I-8.867 J8.01 E.29079
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.404 J.006 E.22986
G1 X134.016 Y116.398 E.2147
M73 P55 R8
G3 X133.048 Y116.021 I-.011 J-1.403 E.03531
G1 X132.936 Y115.896 E.00555
G1 X132.604 Y116.11 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.554 Y116.051 E.00236
G3 X132.21 Y114.994 I1.451 J-1.056 E.03472
G1 X132.21 Y112.834 E.06638
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.577 Y109.72 E.0799
G2 X135.21 Y108.192 I-1.639 J-1.574 E.052
G2 X135.148 Y106.086 I-15.373 J-.599 E.06478
G2 X128.504 Y100.29 I-6.658 J.926 E.29548
G2 X126.487 Y100.477 I-.381 J6.871 E.06246
G2 X123.621 Y102.47 I1.49 J5.199 E.10921
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.193 Y110.008 I49.813 J13.319 E.14442
G2 X125.724 Y121.564 I11.007 J2.351 E.40398
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.05 J10.07 E.36265
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.299 J-.007 E.59323
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I.007 J-12.299 E.59323
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.485 I12.293 J-.001 E.29675
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X140.053 Y93.85 E.02782
G3 X142.106 Y95.924 I-41.219 J42.854 E.08968
M73 P56 R8
G3 X145.29 Y104.18 I-9.158 J8.274 E.27808
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.792 J.002 E.23142
G1 X134.006 Y116.79 E.19943
G3 X132.779 Y116.306 I-.001 J-1.795 E.04148
G1 X132.644 Y116.154 E.00625
M204 S6000
; WIPE_START
G1 F33600
G1 X132.554 Y116.051 E-.05198
G1 X132.435 Y115.867 E-.08351
G1 X132.34 Y115.668 E-.08354
G1 X132.271 Y115.462 E-.0827
G1 X132.227 Y115.242 E-.08509
G1 X132.21 Y114.994 E-.09439
G1 X132.21 Y114.261 E-.27878
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z4 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4 F4000
            G39.3 S1
            G0 Z4 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z4.4 F42000
G1 X117.062 Y134.319
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X117.375 Y132.727 I6.053 J.363 E.05399
G1 X111.45 Y126.802 E.27795
G1 X111.45 Y129.198 E.07946
G1 X121.995 Y118.653 E.49468
G2 X125.802 Y122.522 I11.172 J-7.183 E.18133
G1 X111.45 Y136.874 E.67325
G1 X111.45 Y134.478 E.07946
G1 X117.05 Y140.078 E.26268
G1 X117.05 Y138.95 E.03739
G1 X111.45 Y144.55 E.26268
G1 X111.45 Y142.154 E.07946
G1 X117.062 Y147.766 E.26326
G3 X117.05 Y146.626 I14.498 J-.729 E.03782
G1 X111.565 Y152.111 E.25728
G3 X111.45 Y149.83 I18.958 J-2.099 E.07579
G1 X123.67 Y162.05 E.57324
G1 X124.654 Y162.05 E.03265
G1 X130.254 Y156.45 E.26268
G1 X132.394 Y156.45 E.07099
G1 X132.908 Y155.936 E.02413
G1 X137.92 Y160.948 E.23514
G2 X142.168 Y157.52 I-4.966 J-10.496 E.18278
G1 X136.746 Y152.098 E.25434
G1 X135.595 Y153.249 E.05401
; WIPE_START
G1 F33600
G1 X136.746 Y152.098 E-.61876
G1 X137.009 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X138.397 Y144.856 Z4 F42000
G1 X138.95 Y141.864 Z4
G1 Z3.6
G1 E.8 F1800
G1 F15476.087
G2 X138.778 Y140.25 I-6.38 J-.135 E.054
G1 X143.05 Y135.977 E.20043
G2 X139.346 Y132.006 I-10.181 J5.784 E.18181
G1 X135.325 Y136.026 E.1886
G1 X130.811 Y132.865 E.18283
G1 X134.831 Y128.845 E.1886
G1 X130.316 Y125.684 E.18283
G1 X126.293 Y129.707 E.18877
G2 X121.289 Y128.965 I-3.314 J5.101 E.17305
G1 X111.45 Y119.126 E.46155
G1 X111.45 Y121.522 E.07946
G1 X120.214 Y112.758 E.41113
G3 X120.209 Y112.533 I2.357 J-.169 E.00747
G1 X111.46 Y103.784 E.41041
G2 X111.45 Y106.17 I48.579 J1.395 E.07914
G1 X123.67 Y93.95 E.57324
G1 X124.654 Y93.95 E.03265
G1 X130.538 Y99.834 E.27603
G3 X132.35 Y100.622 I-3.031 J9.452 E.06565
G1 X139.022 Y93.95 E.31298
G1 X139.106 Y93.95 E.00281
G3 X141.928 Y96.851 I-68.528 J69.483 E.13424
G3 X142.713 Y97.935 I-9.754 J7.891 E.04443
G1 X135.666 Y104.962 E.33012
G1 X144.244 Y113.54 E.40243
G2 X144.55 Y111.45 I-4.806 J-1.77 E.07057
G1 X139.951 Y116.049 E.21574
G1 X139.076 Y116.048 E.02902
G1 X134.189 Y111.161 E.22925
G1 X133.182 Y112.175 E.04741
G2 X132.95 Y112.864 I.964 J.708 E.0245
G2 X132.961 Y115.139 I17.041 J1.054 E.0755
G2 X133.006 Y115.318 I.576 J-.049 E.00615
G1 X144.54 Y103.784 E.54106
G3 X144.55 Y106.17 I-48.583 J1.395 E.07914
G1 X132.33 Y93.95 E.57324
G1 X131.346 Y93.95 E.03265
G1 X125.009 Y100.287 E.29725
G2 X124.005 Y100.977 I3.744 J6.52 E.04048
G1 X116.978 Y93.95 E.32965
G1 X116.894 Y93.95 E.00281
G2 X113.397 Y97.761 I17.673 J19.726 E.17184
G1 X113.287 Y97.935 E.00683
G1 X121.297 Y105.945 E.37577
G2 X120.931 Y107.531 I17.38 J4.852 E.05402
; WIPE_START
G1 F33600
G1 X121.297 Y105.945 E-.61861
G1 X121.034 Y105.682 E-.14139
; WIPE_END
G1 E-.04 F1800
G1 X120.933 Y113.314 Z4 F42000
G1 X120.405 Y153.249 Z4
G1 Z3.6
G1 E.8 F1800
G1 F15476.087
G1 X119.254 Y152.098 E.05401
G1 X113.832 Y157.52 E.25434
G2 X118.08 Y160.948 I9.213 J-7.067 E.18278
G1 X123.092 Y155.936 E.23514
G1 X123.606 Y156.45 E.02413
G1 X125.746 Y156.45 E.07099
G1 X131.346 Y162.05 E.26268
G1 X132.33 Y162.05 E.03265
G1 X144.55 Y149.83 E.57324
G3 X144.426 Y152.102 I-16.469 J.241 E.07553
G1 X138.95 Y146.626 E.25687
G3 X138.938 Y147.766 I-14.51 J.411 E.03782
G1 X144.55 Y142.154 E.26326
G1 X144.55 Y144.55 E.07946
G1 X111.45 Y111.45 E1.55276
G1 X111.45 Y113.846 E.07946
G1 X122.518 Y102.778 E.51919
G3 X123.489 Y101.475 I10.736 J6.988 E.05396
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X123.033 Y102.02 E-.27007
G1 X122.518 Y102.778 E-.34845
G1 X122.254 Y103.042 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/45
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
G17
G3 Z4 I-1.217 J.033 P1  F42000
G1 X123.706 Y156.058 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21935
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X117.433 Y134.069 I3.727 J-.067 E.01927
G3 X122.65 Y129.072 I5.568 J.592 E.26046
G3 X126.204 Y130.064 I.345 J5.624 E.12469
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.751 Y156.102 E.28192
G1 X123.748 Y156.1 E.0001
G1 X123.898 Y155.695 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19924
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.67 Y129.464 I5.214 J.011 E.24105
G3 X125.985 Y130.39 I.325 J5.232 E.10775
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.018 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.952 Y155.71 E.24997
M204 S6000
; WIPE_START
G1 F33600
G1 X122.532 Y154.302 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.516 Y146.932 Z4.2 F42000
G1 X132.889 Y115.844 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.874 Y115.826 E.00078
G3 X132.602 Y114.985 I1.13 J-.83 E.02983
G1 X132.602 Y112.845 E.07097
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.865 Y109.986 E.0864
G2 X135.602 Y108.207 I-1.939 J-1.845 E.06534
G2 X135.536 Y106.033 I-15.819 J-.61 E.07222
G2 X128.51 Y99.898 I-7.049 J.982 E.3374
G2 X126.383 Y100.099 I-.385 J7.296 E.07114
G2 X123.31 Y102.231 I1.6 J5.586 E.12634
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.808 Y109.936 I50.169 J13.426 E.15726
G2 X125.496 Y121.883 I11.371 J2.431 E.45098
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.826 J9.754 E.37932
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.902 J.004 E.62039
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I-.004 J-11.902 E.62039
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.907 J-.003 E.31046
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X139.869 Y94.221 E.02903
G3 X141.816 Y96.188 I-39.087 J40.625 E.09179
G3 X144.898 Y104.185 I-8.867 J8.01 E.29079
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.407 J.003 E.22981
G1 X134.015 Y116.398 E.21472
G3 X133.042 Y116.016 I-.011 J-1.402 E.03554
G1 X132.929 Y115.889 E.00565
G1 X132.597 Y116.103 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.557 Y116.057 E.00185
G3 X132.21 Y114.995 I1.447 J-1.061 E.03492
G1 X132.21 Y112.834 E.06638
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.578 Y109.718 E.07996
G2 X135.21 Y108.194 I-1.642 J-1.573 E.05188
G2 X135.148 Y106.086 I-15.384 J-.6 E.06484
G2 X128.504 Y100.29 I-6.66 J.928 E.29546
G2 X126.487 Y100.477 I-.381 J6.871 E.06246
M73 P57 R8
G2 X123.621 Y102.47 I1.49 J5.199 E.10922
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.193 Y110.008 I49.813 J13.319 E.14442
G2 X125.724 Y121.564 I10.986 J2.359 E.40407
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.05 J10.07 E.36266
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.291 J.001 E.59333
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I-.001 J-12.291 E.59333
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.485 I12.293 J-.001 E.29675
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X140.147 Y93.944 E.03188
G3 X142.106 Y95.924 I-39.362 J40.904 E.08562
G3 X145.29 Y104.18 I-9.158 J8.274 E.27808
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.799 J-.005 E.23133
G1 X134.005 Y116.79 E.19944
G3 X132.774 Y116.302 I-.001 J-1.794 E.0417
G1 X132.637 Y116.147 E.00634
M204 S6000
; WIPE_START
G1 F33600
G1 X132.557 Y116.057 E-.04566
G1 X132.438 Y115.872 E-.08374
G1 X132.342 Y115.673 E-.08376
G1 X132.272 Y115.466 E-.08301
G1 X132.228 Y115.246 E-.0853
G1 X132.21 Y114.995 E-.09587
G1 X132.21 Y114.251 E-.28267
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z4.2 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z4.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.2 F4000
            G39.3 S1
            G0 Z4.2 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z4.6 F42000
G1 X120.931 Y107.531
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X121.297 Y105.945 I17.747 J3.265 E.05402
G1 X113.287 Y97.935 E.37577
G3 X114.841 Y96.003 I9.971 J6.429 E.08242
G1 X116.894 Y93.95 E.09627
G1 X116.978 Y93.95 E.00281
G1 X124.005 Y100.977 E.32965
G3 X125.01 Y100.287 I4.749 J5.83 E.04048
G1 X131.346 Y93.95 E.29725
G1 X132.33 Y93.95 E.03265
G1 X144.55 Y106.17 E.57324
G2 X144.54 Y103.784 I-48.593 J-.99 E.07914
G1 X133.006 Y115.318 E.54108
G3 X132.95 Y114.973 I1.03 J-.342 E.01166
G1 X132.95 Y112.864 E.06994
G3 X133.182 Y112.175 I1.195 J.019 E.0245
G1 X134.189 Y111.161 E.04741
G1 X139.076 Y116.048 E.22926
G1 X139.951 Y116.049 E.02901
G1 X144.55 Y111.45 E.21574
G3 X144.236 Y113.532 I-4.853 J.334 E.0704
G1 X135.666 Y104.962 E.40205
G1 X142.713 Y97.935 E.33012
G2 X141.56 Y96.424 I-13.976 J9.473 E.06309
G2 X139.106 Y93.95 I-237.025 J232.615 E.11557
G1 X139.022 Y93.95 E.00281
G1 X132.35 Y100.622 E.31298
G2 X130.538 Y99.834 I-4.843 J8.664 E.06565
G1 X124.654 Y93.95 E.27603
G1 X123.67 Y93.95 E.03265
G1 X111.45 Y106.17 E.57324
G3 X111.46 Y103.784 I48.589 J-.99 E.07914
G1 X120.212 Y112.536 E.41054
G1 X120.211 Y112.761 E.00748
G1 X111.45 Y121.522 E.41099
G1 X111.45 Y119.126 E.07946
G1 X121.289 Y128.965 E.46155
G3 X126.293 Y129.707 I1.69 J5.844 E.17305
G1 X130.316 Y125.684 E.18877
G1 X134.831 Y128.845 E.18283
G1 X130.811 Y132.865 E.1886
G1 X135.325 Y136.026 E.18283
G1 X139.346 Y132.006 E.1886
G3 X143.05 Y135.977 I-6.477 J9.755 E.18181
G1 X138.778 Y140.25 E.20043
G3 X138.95 Y141.864 I-6.208 J1.479 E.054
; WIPE_START
G1 F33600
G1 X138.935 Y141.223 E-.2437
G1 X138.778 Y140.25 E-.37457
G1 X139.042 Y139.986 E-.14173
; WIPE_END
G1 E-.04 F1800
G1 X137.122 Y147.373 Z4.2 F42000
G1 X135.595 Y153.249 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F15476.087
G1 X136.746 Y152.098 E.05401
G1 X142.168 Y157.52 E.25434
G3 X137.92 Y160.948 I-9.213 J-7.067 E.18278
G1 X132.908 Y155.936 E.23514
G1 X132.394 Y156.45 E.02413
G1 X130.254 Y156.45 E.07099
G1 X124.654 Y162.05 E.26268
G1 X123.67 Y162.05 E.03265
G1 X111.45 Y149.83 E.57324
G2 X111.565 Y152.111 I19.073 J.182 E.07579
G1 X117.05 Y146.626 E.25728
G2 X117.062 Y147.766 I14.51 J.411 E.03782
G1 X111.45 Y142.154 E.26326
G1 X111.45 Y144.55 E.07946
G1 X117.05 Y138.95 E.26268
G1 X117.05 Y140.078 E.03739
G1 X111.45 Y134.478 E.26268
G1 X111.45 Y136.874 E.07946
G1 X125.802 Y122.522 E.67325
G3 X121.995 Y118.654 I7.379 J-11.069 E.18133
G1 X111.45 Y129.198 E.49465
G1 X111.45 Y126.802 E.07946
G1 X117.375 Y132.727 E.27795
G2 X117.062 Y134.319 I5.74 J1.955 E.05399
; WIPE_START
G1 F33600
G1 X117.121 Y133.736 E-.22259
G1 X117.375 Y132.727 E-.39553
G1 X117.111 Y132.463 E-.14188
; WIPE_END
G1 E-.04 F1800
G1 X118.65 Y124.987 Z4.2 F42000
G1 X123.489 Y101.475 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F15476.087
G2 X122.518 Y102.778 I9.764 J8.291 E.05396
G1 X111.45 Y113.846 E.51919
G1 X111.45 Y111.45 E.07946
G1 X144.55 Y144.55 E1.55276
G1 X144.55 Y142.154 E.07946
G1 X138.938 Y147.766 E.26326
G2 X138.95 Y146.626 I-14.497 J-.729 E.03782
G1 X144.435 Y152.111 E.25728
G2 X144.55 Y149.83 I-18.959 J-2.099 E.07579
G1 X132.33 Y162.05 E.57324
G1 X131.346 Y162.05 E.03265
G1 X125.746 Y156.45 E.26268
G1 X123.606 Y156.45 E.07099
G1 X123.092 Y155.936 E.02413
G1 X118.08 Y160.948 E.23514
G3 X113.832 Y157.52 I4.966 J-10.496 E.18278
G1 X119.254 Y152.098 E.25434
G1 X120.405 Y153.249 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X119.254 Y152.098 E-.61876
G1 X118.991 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/45
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
G17
G3 Z4.2 I-.751 J.958 P1  F42000
G1 X123.708 Y156.059 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21943
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X122.666 Y129.072 I5.606 J.019 E.28025
G3 X126.204 Y130.064 I.33 J5.624 E.12417
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.751 Y156.102 E.28192
G1 X123.75 Y156.102 E.00001
G1 X123.895 Y155.691 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19909
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.686 Y129.463 I5.214 J.011 E.24153
G3 X125.985 Y130.39 I.31 J5.232 E.10727
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.018 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.947 Y155.71 E.25012
M204 S6000
; WIPE_START
G1 F33600
G1 X122.527 Y154.301 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.51 Y146.931 Z4.4 F42000
G1 X132.879 Y115.822 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.819 Y115.744 E.00327
G3 X132.602 Y114.985 I1.185 J-.748 E.02655
G1 X132.602 Y112.845 E.07098
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.867 Y109.985 E.08647
G2 X135.602 Y108.209 I-1.942 J-1.844 E.06519
G2 X135.536 Y106.033 I-15.832 J-.612 E.07229
G2 X128.51 Y99.898 I-7.049 J.982 E.3374
G2 X126.675 Y100.027 I-.363 J7.98 E.06117
G2 X123.31 Y102.231 I1.234 J5.554 E.13641
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.808 Y109.936 I50.169 J13.426 E.15726
G2 X125.496 Y121.883 I11.397 J2.421 E.45086
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.826 J9.754 E.37932
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.907 J-.002 E.62032
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I.002 J-11.907 E.62032
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.907 J-.003 E.31046
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X139.963 Y94.314 E.03342
G3 X141.816 Y96.188 I-37.226 J38.671 E.0874
G3 X144.898 Y104.185 I-8.867 J8.01 E.29079
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.404 J.006 E.22986
G1 X134.015 Y116.398 E.21473
G3 X132.989 Y115.963 I-.011 J-1.402 E.03801
G1 X132.916 Y115.87 E.00394
M73 P58 R8
G1 X132.571 Y116.062 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.489 Y115.956 E.00412
G3 X132.21 Y114.995 I1.515 J-.96 E.03117
G1 X132.21 Y112.834 E.06639
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.58 Y109.717 E.08002
G2 X135.21 Y108.196 I-1.644 J-1.572 E.05177
G2 X135.148 Y106.086 I-15.396 J-.601 E.0649
G2 X128.504 Y100.29 I-6.66 J.928 E.29546
G2 X126.758 Y100.41 I-.36 J7.525 E.05387
G2 X123.621 Y102.47 I1.149 J5.17 E.11788
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.193 Y110.008 I49.813 J13.319 E.14442
G2 X125.724 Y121.564 I10.986 J2.359 E.40407
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.05 J10.07 E.36265
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.299 J-.007 E.59323
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I.007 J-12.299 E.59323
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.486 I12.293 J-.001 E.29675
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X140.24 Y94.037 E.03595
G3 X142.106 Y95.924 I-37.501 J38.949 E.08155
G3 X145.29 Y104.18 I-9.158 J8.274 E.27808
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.792 J.002 E.23142
G1 X134.005 Y116.79 E.19944
G3 X132.703 Y116.232 I-.001 J-1.794 E.04475
G1 X132.608 Y116.109 E.00477
M204 S6000
; WIPE_START
G1 F33600
G1 X132.489 Y115.956 E-.07372
G1 X132.344 Y115.678 E-.11896
G1 X132.274 Y115.471 E-.08332
G1 X132.228 Y115.25 E-.08552
G1 X132.21 Y114.995 E-.09732
G1 X132.21 Y114.202 E-.30116
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z4.4 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z4.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.4 F4000
            G39.3 S1
            G0 Z4.4 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z4.8 F42000
G1 X117.062 Y134.319
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X117.375 Y132.727 I6.053 J.363 E.05399
G1 X111.45 Y126.802 E.27795
G1 X111.45 Y129.198 E.07946
G1 X121.994 Y118.654 E.49462
G2 X125.802 Y122.522 I11.201 J-7.218 E.18132
G1 X111.45 Y136.874 E.67325
G1 X111.45 Y134.478 E.07946
G1 X117.05 Y140.078 E.26268
G1 X117.05 Y138.95 E.03739
G1 X111.45 Y144.55 E.26268
G1 X111.45 Y142.154 E.07946
G1 X117.062 Y147.766 E.26326
G3 X117.05 Y146.626 I14.498 J-.729 E.03782
G1 X111.565 Y152.111 E.25728
G3 X111.45 Y149.83 I18.958 J-2.099 E.07579
G1 X123.67 Y162.05 E.57324
G1 X124.654 Y162.05 E.03265
G1 X130.254 Y156.45 E.26268
G1 X132.394 Y156.45 E.07099
G1 X132.908 Y155.936 E.02413
G1 X137.92 Y160.948 E.23514
G2 X142.168 Y157.52 I-4.966 J-10.496 E.18278
G1 X136.746 Y152.098 E.25434
G1 X135.595 Y153.249 E.05401
; WIPE_START
G1 F33600
G1 X136.746 Y152.098 E-.61876
G1 X137.009 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X138.397 Y144.856 Z4.4 F42000
G1 X138.95 Y141.864 Z4.4
G1 Z4
G1 E.8 F1800
G1 F15476.087
G2 X138.778 Y140.25 I-6.38 J-.135 E.054
G1 X143.05 Y135.977 E.20043
G2 X139.346 Y132.006 I-10.181 J5.784 E.18181
G1 X135.325 Y136.026 E.1886
G1 X130.811 Y132.865 E.18283
G1 X134.831 Y128.845 E.1886
G1 X130.316 Y125.684 E.18283
G1 X126.293 Y129.707 E.18877
G2 X121.289 Y128.965 I-3.314 J5.101 E.17305
G1 X111.45 Y119.126 E.46155
G1 X111.45 Y121.522 E.07946
G1 X120.211 Y112.761 E.41099
G1 X120.212 Y112.536 E.00748
G1 X111.46 Y103.784 E.41054
G2 X111.45 Y106.17 I48.579 J1.395 E.07914
G1 X123.67 Y93.95 E.57324
G1 X124.654 Y93.95 E.03265
G1 X130.538 Y99.834 E.27603
G3 X132.35 Y100.622 I-3.031 J9.452 E.06565
G1 X139.022 Y93.95 E.31298
G1 X139.106 Y93.95 E.00281
G3 X141.928 Y96.851 I-62.57 J63.687 E.13424
G3 X142.713 Y97.935 I-9.754 J7.891 E.04443
G1 X135.666 Y104.962 E.33012
G1 X144.244 Y113.54 E.40243
G2 X144.55 Y111.45 I-4.806 J-1.77 E.07057
G1 X139.951 Y116.049 E.21574
G1 X139.076 Y116.048 E.02901
G1 X134.189 Y111.161 E.22927
G1 X133.182 Y112.175 E.04741
G2 X132.95 Y112.864 I.964 J.708 E.0245
G2 X132.962 Y115.145 I16.312 J1.054 E.0757
G2 X133.005 Y115.319 I.587 J-.052 E.00597
G1 X144.54 Y103.784 E.5411
G3 X144.55 Y106.17 I-48.583 J1.395 E.07914
G1 X132.33 Y93.95 E.57324
G1 X131.346 Y93.95 E.03265
G1 X125.003 Y100.293 E.29757
G2 X124.005 Y100.977 I6.177 J10.08 E.04014
G1 X116.978 Y93.95 E.32965
G1 X116.894 Y93.95 E.00281
G2 X113.397 Y97.761 I17.673 J19.725 E.17184
G1 X113.287 Y97.935 E.00683
G1 X121.297 Y105.945 E.37577
G2 X120.931 Y107.531 I17.38 J4.852 E.05402
; WIPE_START
G1 F33600
G1 X121.297 Y105.945 E-.61861
G1 X121.034 Y105.682 E-.14139
; WIPE_END
G1 E-.04 F1800
G1 X120.933 Y113.314 Z4.4 F42000
G1 X120.405 Y153.249 Z4.4
G1 Z4
G1 E.8 F1800
G1 F15476.087
G1 X119.254 Y152.098 E.05401
G1 X113.832 Y157.52 E.25434
G2 X118.08 Y160.948 I9.213 J-7.067 E.18278
G1 X123.092 Y155.936 E.23514
G1 X123.606 Y156.45 E.02413
G1 X125.746 Y156.45 E.07099
G1 X131.346 Y162.05 E.26268
G1 X132.33 Y162.05 E.03265
G1 X144.55 Y149.83 E.57324
G3 X144.426 Y152.102 I-16.635 J.238 E.07554
G1 X138.95 Y146.626 E.2569
G3 X138.938 Y147.766 I-14.51 J.411 E.03782
G1 X144.55 Y142.154 E.26326
G1 X144.55 Y144.55 E.07946
G1 X111.45 Y111.45 E1.55276
G1 X111.45 Y113.846 E.07946
G1 X122.518 Y102.778 E.51919
G3 X123.489 Y101.475 I10.735 J6.988 E.05396
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X123.033 Y102.02 E-.27007
G1 X122.518 Y102.778 E-.34845
G1 X122.254 Y103.042 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/45
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
G17
G3 Z4.4 I-1.217 J.033 P1  F42000
G1 X123.709 Y156.061 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.2195
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X122.681 Y129.071 I5.606 J.019 E.28077
G3 X126.204 Y130.064 I.315 J5.624 E.12365
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.752 Y156.102 E.28187
G1 X123.892 Y155.689 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19897
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.701 Y129.462 I5.213 J.011 E.242
G3 X125.985 Y130.39 I.295 J5.232 E.1068
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.018 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.943 Y155.71 E.25024
M204 S6000
; WIPE_START
G1 F33600
G1 X122.524 Y154.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.507 Y146.93 Z4.6 F42000
G1 X132.876 Y115.827 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.71 Y115.536 E.01111
G3 X132.602 Y114.986 I1.293 J-.54 E.01873
G1 X132.602 Y112.845 E.07101
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.868 Y109.983 E.08654
G2 X135.602 Y108.212 I-1.944 J-1.843 E.06505
G2 X135.536 Y106.033 I-15.845 J-.613 E.07236
G2 X128.51 Y99.898 I-7.047 J.979 E.33743
G2 X126.385 Y100.098 I-.385 J7.303 E.07106
G2 X123.31 Y102.231 I1.598 J5.587 E.12642
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.808 Y109.936 I50.169 J13.427 E.15726
G2 X125.496 Y121.883 I11.371 J2.431 E.45098
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.826 J9.754 E.37932
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.907 J-.002 E.62032
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I-.004 J-11.902 E.62039
M73 P59 R8
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.929 J.005 E.31043
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X140.057 Y94.408 E.03781
G3 X141.816 Y96.188 I-35.368 J36.719 E.08301
G3 X144.898 Y104.185 I-8.867 J8.01 E.29079
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.404 J.006 E.22986
G1 X134.014 Y116.398 E.21476
G3 X132.912 Y115.875 I-.011 J-1.401 E.04187
G1 X132.545 Y116.038 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.444 Y115.882 E.0057
G3 X132.21 Y114.995 I1.559 J-.886 E.02851
G1 X132.21 Y112.834 E.06639
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.581 Y109.716 E.08008
G2 X135.21 Y108.198 I-1.647 J-1.571 E.05165
G2 X135.148 Y106.086 I-15.407 J-.603 E.06496
G2 X128.504 Y100.29 I-6.658 J.926 E.29548
G2 X126.488 Y100.476 I-.381 J6.874 E.06243
G2 X123.621 Y102.47 I1.489 J5.2 E.10924
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.193 Y110.008 I49.814 J13.319 E.14442
G2 X125.724 Y121.564 I10.986 J2.359 E.40407
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.05 J10.07 E.36265
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.299 J-.007 E.59323
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I.007 J-12.3 E.59322
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.486 I12.321 J.01 E.29671
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X140.334 Y94.131 E.04001
G3 X142.106 Y95.924 I-35.643 J36.998 E.07749
G3 X145.29 Y104.18 I-9.158 J8.274 E.27808
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.792 J.002 E.23142
G1 X134.005 Y116.79 E.19945
G3 X132.579 Y116.087 I-.002 J-1.793 E.0506
M204 S6000
; WIPE_START
G1 F33600
G1 X132.444 Y115.882 E-.09322
G1 X132.346 Y115.683 E-.08419
G1 X132.275 Y115.475 E-.08363
G1 X132.229 Y115.254 E-.08574
G1 X132.21 Y114.995 E-.09878
G1 X132.21 Y114.168 E-.31445
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z4.6 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z4.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.6 F4000
            G39.3 S1
            G0 Z4.6 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z5 F42000
G1 X120.931 Y107.531
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X121.297 Y105.945 I17.747 J3.266 E.05402
G1 X113.287 Y97.935 E.37577
G3 X114.841 Y96.003 I9.971 J6.43 E.08242
G1 X116.894 Y93.95 E.09627
G1 X116.978 Y93.95 E.00281
G1 X124.005 Y100.977 E.32965
G3 X125.003 Y100.293 I7.175 J9.396 E.04014
G1 X131.346 Y93.95 E.29757
G1 X132.33 Y93.95 E.03265
G1 X144.55 Y106.17 E.57324
G2 X144.54 Y103.784 I-48.593 J-.99 E.07914
G1 X133.005 Y115.319 E.54112
G3 X132.95 Y114.973 I1.09 J-.349 E.01165
G1 X132.95 Y112.864 E.06996
G3 X133.182 Y112.175 I1.195 J.019 E.0245
G1 X134.189 Y111.161 E.04741
G1 X139.077 Y116.049 E.22928
G1 X139.951 Y116.049 E.029
G1 X144.55 Y111.45 E.21574
G3 X144.244 Y113.54 I-5.112 J.32 E.07057
G1 X135.666 Y104.962 E.40243
G1 X142.713 Y97.935 E.33012
G2 X139.81 Y94.654 I-14.472 J9.88 E.14569
G1 X139.106 Y93.95 E.03302
G1 X139.022 Y93.95 E.00281
G1 X132.35 Y100.622 E.31298
G2 X130.538 Y99.834 I-4.843 J8.664 E.06565
G1 X124.654 Y93.95 E.27603
G1 X123.67 Y93.95 E.03265
G1 X111.45 Y106.17 E.57324
G3 X111.46 Y103.784 I48.589 J-.99 E.07914
G1 X120.212 Y112.536 E.41054
G1 X120.211 Y112.761 E.00748
G1 X111.45 Y121.522 E.41099
G1 X111.45 Y119.126 E.07946
G1 X121.289 Y128.965 E.46155
G3 X126.293 Y129.707 I1.69 J5.844 E.17305
G1 X130.316 Y125.684 E.18877
G1 X134.831 Y128.845 E.18283
G1 X130.811 Y132.865 E.1886
G1 X135.325 Y136.026 E.18283
G1 X139.346 Y132.006 E.1886
G3 X143.05 Y135.977 I-6.477 J9.755 E.18181
G1 X138.778 Y140.25 E.20043
G3 X138.95 Y141.864 I-6.208 J1.479 E.054
; WIPE_START
G1 F33600
G1 X138.935 Y141.223 E-.2437
G1 X138.778 Y140.25 E-.37457
G1 X139.042 Y139.986 E-.14173
; WIPE_END
G1 E-.04 F1800
G1 X137.122 Y147.373 Z4.6 F42000
G1 X135.595 Y153.249 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F15476.087
G1 X136.746 Y152.098 E.05401
G1 X142.168 Y157.52 E.25434
G3 X137.92 Y160.948 I-9.213 J-7.067 E.18278
G1 X132.908 Y155.936 E.23514
G1 X132.394 Y156.45 E.02413
G1 X130.254 Y156.45 E.07099
G1 X124.654 Y162.05 E.26268
G1 X123.67 Y162.05 E.03265
G1 X111.45 Y149.83 E.57324
G2 X111.565 Y152.111 I19.073 J.182 E.07579
G1 X117.05 Y146.626 E.25728
G2 X117.062 Y147.766 I14.511 J.411 E.03782
G1 X111.45 Y142.154 E.26326
G1 X111.45 Y144.55 E.07946
G1 X117.05 Y138.95 E.26268
G1 X117.05 Y140.078 E.03739
G1 X111.45 Y134.478 E.26268
G1 X111.45 Y136.874 E.07946
G1 X125.802 Y122.522 E.67325
G3 X121.993 Y118.655 I7.413 J-11.11 E.18132
G1 X111.45 Y129.198 E.49458
G1 X111.45 Y126.802 E.07946
G1 X117.375 Y132.727 E.27795
G2 X117.062 Y134.319 I5.74 J1.955 E.05399
; WIPE_START
G1 F33600
G1 X117.121 Y133.736 E-.22259
G1 X117.375 Y132.727 E-.39553
G1 X117.111 Y132.463 E-.14188
; WIPE_END
G1 E-.04 F1800
G1 X118.65 Y124.987 Z4.6 F42000
G1 X123.489 Y101.475 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F15476.087
G2 X122.518 Y102.778 I9.764 J8.291 E.05396
G1 X111.45 Y113.846 E.51919
G1 X111.45 Y111.45 E.07946
G1 X144.55 Y144.55 E1.55276
G1 X144.55 Y142.154 E.07946
G1 X138.938 Y147.766 E.26326
G2 X138.95 Y146.626 I-14.497 J-.729 E.03782
G1 X144.427 Y152.103 E.25691
G2 X144.55 Y149.83 I-16.603 J-2.037 E.07555
G1 X132.33 Y162.05 E.57324
G1 X131.346 Y162.05 E.03265
G1 X125.746 Y156.45 E.26268
G1 X123.606 Y156.45 E.07099
G1 X123.092 Y155.936 E.02413
G1 X118.08 Y160.948 E.23514
G3 X113.832 Y157.52 I4.966 J-10.496 E.18278
G1 X119.254 Y152.098 E.25434
G1 X120.405 Y153.249 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X119.254 Y152.098 E-.61876
G1 X118.991 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/45
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
G17
G3 Z4.6 I-.751 J.958 P1  F42000
G1 X123.71 Y156.062 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21954
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X122.697 Y129.07 I5.605 J.019 E.28128
G3 X126.204 Y130.064 I.3 J5.624 E.12314
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.753 Y156.102 E.28183
G1 X123.89 Y155.687 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.1989
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.717 Y129.462 I5.213 J.011 E.24248
G3 X125.985 Y130.39 I.28 J5.232 E.10632
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.018 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.941 Y155.71 E.25031
M204 S6000
; WIPE_START
G1 F33600
G1 X122.522 Y154.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.505 Y146.93 Z4.8 F42000
G1 X132.872 Y115.818 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.714 Y115.545 E.01047
G3 X132.602 Y114.987 I1.289 J-.548 E.01902
G1 X132.602 Y112.845 E.07103
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.87 Y109.982 E.08661
G2 X135.602 Y108.214 I-1.947 J-1.842 E.06491
G2 X135.536 Y106.033 I-15.858 J-.614 E.07243
G2 X128.51 Y99.898 I-7.047 J.98 E.33743
G2 X126.383 Y100.098 I-.385 J7.297 E.07113
M73 P60 R8
G2 X123.31 Y102.231 I1.6 J5.586 E.12635
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.808 Y109.936 I50.17 J13.427 E.15726
G2 X125.496 Y121.883 I11.371 J2.431 E.45098
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.826 J9.754 E.37932
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.907 J-.002 E.62032
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I-.004 J-11.902 E.62039
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.907 J-.003 E.31046
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X140.15 Y94.502 E.0422
G3 X141.816 Y96.188 I-33.51 J34.768 E.07862
G3 X144.898 Y104.185 I-8.867 J8.01 E.29079
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.404 J.006 E.22986
G1 X134.013 Y116.398 E.21478
G3 X132.905 Y115.868 I-.01 J-1.401 E.04218
G1 X132.54 Y116.031 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.447 Y115.888 E.00525
G3 X132.21 Y114.995 I1.556 J-.89 E.02869
G1 X132.21 Y112.834 E.0664
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.582 Y109.714 E.08014
G2 X135.21 Y108.2 I-1.648 J-1.57 E.05153
G2 X135.148 Y106.086 I-15.418 J-.604 E.06502
G2 X128.504 Y100.29 I-6.66 J.928 E.29547
G2 X126.487 Y100.477 I-.381 J6.871 E.06245
G2 X123.621 Y102.47 I1.49 J5.199 E.10922
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.193 Y110.008 I49.814 J13.319 E.14442
G2 X125.724 Y121.564 I10.986 J2.359 E.40407
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.05 J10.07 E.36265
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.299 J-.007 E.59323
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I-.001 J-12.291 E.59333
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.485 I12.293 J-.001 E.29675
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X140.427 Y94.224 E.04408
G3 X142.106 Y95.924 I-33.785 J35.046 E.07342
G3 X145.29 Y104.18 I-9.158 J8.274 E.27808
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.792 J.002 E.23142
G1 X134.005 Y116.79 E.19946
G3 X132.574 Y116.08 I-.002 J-1.793 E.05086
M204 S6000
; WIPE_START
G1 F33600
G1 X132.447 Y115.888 E-.08775
G1 X132.349 Y115.69 E-.08386
G1 X132.275 Y115.477 E-.08566
G1 X132.229 Y115.258 E-.08476
G1 X132.21 Y114.995 E-.1002
G1 X132.21 Y114.159 E-.31776
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z4.8 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z4.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.8 F4000
            G39.3 S1
            G0 Z4.8 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z5.2 F42000
G1 X117.062 Y134.319
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X117.375 Y132.727 I6.053 J.363 E.05399
G1 X111.45 Y126.802 E.27795
G1 X111.45 Y129.198 E.07946
G1 X121.992 Y118.656 E.49454
G2 X125.802 Y122.522 I11.24 J-7.264 E.18131
G1 X111.45 Y136.874 E.67325
G1 X111.45 Y134.478 E.07946
G1 X117.05 Y140.078 E.26268
G1 X117.05 Y138.95 E.03739
G1 X111.45 Y144.55 E.26268
G1 X111.45 Y142.154 E.07946
G1 X117.062 Y147.766 E.26326
G3 X117.05 Y146.626 I14.498 J-.729 E.03782
G1 X111.565 Y152.111 E.25728
G3 X111.45 Y149.83 I18.958 J-2.099 E.07579
G1 X123.67 Y162.05 E.57324
G1 X124.654 Y162.05 E.03265
G1 X130.254 Y156.45 E.26268
G1 X132.394 Y156.45 E.07099
G1 X132.908 Y155.936 E.02413
G1 X137.92 Y160.948 E.23514
G2 X142.168 Y157.52 I-4.966 J-10.496 E.18278
G1 X136.746 Y152.098 E.25434
G1 X135.595 Y153.249 E.05401
; WIPE_START
G1 F33600
G1 X136.746 Y152.098 E-.61876
G1 X137.009 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X138.397 Y144.856 Z4.8 F42000
G1 X138.95 Y141.864 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F15476.087
G2 X138.778 Y140.25 I-6.38 J-.135 E.054
G1 X143.05 Y135.977 E.20043
G2 X139.346 Y132.006 I-10.181 J5.784 E.18181
G1 X135.325 Y136.026 E.1886
G1 X130.811 Y132.865 E.18283
G1 X134.831 Y128.845 E.1886
G1 X130.316 Y125.684 E.18283
G1 X126.293 Y129.707 E.18877
G2 X121.289 Y128.965 I-3.293 J4.957 E.17331
G1 X111.45 Y119.126 E.46155
G1 X111.45 Y121.522 E.07946
G1 X120.218 Y112.755 E.41129
G1 X120.21 Y112.534 E.00732
G1 X111.46 Y103.784 E.41047
G2 X111.45 Y106.17 I48.579 J1.395 E.07914
G1 X123.67 Y93.95 E.57324
G1 X124.654 Y93.95 E.03265
G1 X130.538 Y99.834 E.27603
G3 X132.35 Y100.622 I-3.031 J9.452 E.06565
G1 X139.022 Y93.95 E.31298
G1 X139.106 Y93.95 E.00281
G1 X139.904 Y94.748 E.03741
G3 X142.713 Y97.935 I-11.351 J12.837 E.14129
G1 X135.666 Y104.962 E.33012
G1 X144.244 Y113.54 E.40243
G2 X144.55 Y111.45 I-4.806 J-1.77 E.07057
G1 X139.951 Y116.049 E.21575
G1 X139.077 Y116.049 E.02899
G1 X134.189 Y111.161 E.22928
G1 X133.182 Y112.175 E.04741
G2 X132.95 Y112.864 I.964 J.708 E.0245
G2 X132.963 Y115.15 I15.656 J1.055 E.0759
G2 X133.005 Y115.319 I.624 J-.066 E.00578
G1 X144.54 Y103.784 E.54111
G3 X144.55 Y106.17 I-48.583 J1.395 E.07914
G1 X132.33 Y93.95 E.57324
G1 X131.346 Y93.95 E.03265
G1 X125.009 Y100.287 E.29725
G2 X124.005 Y100.977 I3.744 J6.52 E.04048
G1 X116.978 Y93.95 E.32965
G1 X116.894 Y93.95 E.00281
G2 X113.397 Y97.761 I17.673 J19.726 E.17184
G1 X113.287 Y97.935 E.00683
G1 X121.297 Y105.945 E.37577
G2 X120.931 Y107.531 I17.381 J4.852 E.05402
; WIPE_START
G1 F33600
G1 X121.297 Y105.945 E-.61861
G1 X121.034 Y105.682 E-.14139
; WIPE_END
G1 E-.04 F1800
G1 X120.933 Y113.314 Z4.8 F42000
G1 X120.405 Y153.249 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F15476.087
G1 X119.254 Y152.098 E.05401
G1 X113.832 Y157.52 E.25434
G2 X118.08 Y160.948 I9.213 J-7.067 E.18278
G1 X123.092 Y155.936 E.23514
G1 X123.606 Y156.45 E.02413
G1 X125.746 Y156.45 E.07099
G1 X131.346 Y162.05 E.26268
G1 X132.33 Y162.05 E.03265
G1 X144.55 Y149.83 E.57324
G3 X144.435 Y152.111 I-19.074 J.182 E.07579
G1 X138.95 Y146.626 E.25728
G3 X138.938 Y147.766 I-14.51 J.411 E.03782
G1 X144.55 Y142.154 E.26326
G1 X144.55 Y144.55 E.07946
G1 X111.45 Y111.45 E1.55276
G1 X111.45 Y113.846 E.07946
G1 X122.518 Y102.778 E.51919
G3 X123.489 Y101.475 I10.736 J6.989 E.05396
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P60 R7
G1 F33600
G1 X123.033 Y102.02 E-.27007
G1 X122.518 Y102.778 E-.34845
G1 X122.254 Y103.042 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/45
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
G17
G3 Z4.8 I-1.217 J.033 P1  F42000
G1 X123.711 Y156.062 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21956
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X122.712 Y129.069 I5.595 J.009 E.28192
G3 X126.204 Y130.064 I.284 J5.625 E.12262
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.754 Y156.102 E.28181
G1 X123.89 Y155.687 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19888
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.732 Y129.461 I5.205 J.003 E.24306
G3 X125.985 Y130.39 I.264 J5.233 E.10584
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.018 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.94 Y155.71 E.25033
M204 S6000
; WIPE_START
G1 F33600
G1 X122.522 Y154.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.503 Y146.929 Z5 F42000
G1 X132.867 Y115.809 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.715 Y115.549 E.00998
G3 X132.602 Y114.988 I1.287 J-.552 E.01915
G1 X132.602 Y112.845 E.07106
M73 P61 R7
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.871 Y109.98 E.08668
G2 X135.602 Y108.216 I-1.987 J-1.856 E.06472
G2 X135.536 Y106.033 I-15.871 J-.615 E.0725
G2 X128.51 Y99.898 I-7.036 J.967 E.33755
G2 X126.383 Y100.098 I-.385 J7.297 E.07113
G2 X123.31 Y102.231 I1.6 J5.586 E.12635
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.808 Y109.936 I50.169 J13.427 E.15726
G2 X125.496 Y121.883 I11.371 J2.431 E.45098
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.847 J9.765 E.37927
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.902 J.004 E.62039
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I-.004 J-11.902 E.62039
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.907 J-.003 E.31046
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X140.244 Y94.595 E.04659
G3 X142.197 Y96.63 I-19.798 J20.962 E.0936
G3 X144.898 Y104.185 I-9.207 J7.552 E.27146
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.407 J.003 E.22981
G1 X134.012 Y116.398 E.21481
G3 X132.899 Y115.86 I-.01 J-1.4 E.04248
G1 X132.536 Y116.023 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.447 Y115.889 E.00492
G3 X132.21 Y114.996 I1.555 J-.892 E.02873
G1 X132.21 Y112.834 E.06641
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.584 Y109.713 E.0802
G2 X135.21 Y108.202 I-1.681 J-1.582 E.05138
G2 X135.148 Y106.086 I-15.43 J-.605 E.06508
G2 X128.504 Y100.29 I-6.648 J.914 E.2956
G2 X126.487 Y100.477 I-.381 J6.872 E.06245
G2 X123.621 Y102.47 I1.49 J5.199 E.10922
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.193 Y110.008 I49.813 J13.319 E.14442
G2 X125.724 Y121.564 I10.986 J2.359 E.40407
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.076 J10.084 E.36259
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.291 J.001 E.59333
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I-.001 J-12.291 E.59333
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.486 I12.293 J-.001 E.29675
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X140.521 Y94.318 E.04814
G3 X142.5 Y96.381 I-20.031 J21.199 E.08789
G3 X145.29 Y104.18 I-9.504 J7.798 E.2596
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.799 J-.005 E.23133
G1 X134.004 Y116.79 E.19947
G3 X132.573 Y116.08 I-.002 J-1.792 E.05088
G1 X132.569 Y116.073 E.00025
M204 S6000
; WIPE_START
G1 F33600
G1 X132.447 Y115.889 E-.08364
G1 X132.351 Y115.695 E-.08261
G1 X132.277 Y115.481 E-.08597
G1 X132.23 Y115.262 E-.08487
G1 X132.21 Y114.996 E-.10163
G1 X132.21 Y114.15 E-.32127
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z5 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z5
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5 F4000
            G39.3 S1
            G0 Z5 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z5.4 F42000
G1 X120.931 Y107.531
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X121.297 Y105.945 I17.747 J3.265 E.05402
G1 X113.287 Y97.935 E.37577
G3 X114.841 Y96.003 I9.972 J6.43 E.08242
G1 X116.894 Y93.95 E.09627
G1 X116.978 Y93.95 E.00281
G1 X124.005 Y100.977 E.32965
G3 X125.009 Y100.287 I4.748 J5.83 E.04048
G1 X131.346 Y93.95 E.29725
G1 X132.33 Y93.95 E.03265
G1 X144.55 Y106.17 E.57324
G2 X144.54 Y103.784 I-48.593 J-.99 E.07914
G1 X133.005 Y115.319 E.54113
G3 X132.95 Y114.975 I1.094 J-.349 E.01162
G1 X132.95 Y112.864 E.07
G3 X133.182 Y112.175 I1.195 J.019 E.0245
G1 X134.189 Y111.161 E.04741
G1 X139.077 Y116.049 E.22929
G1 X139.951 Y116.049 E.02899
G1 X144.55 Y111.45 E.21575
G3 X144.238 Y113.534 I-4.897 J.331 E.07043
G1 X135.666 Y104.962 E.40212
G1 X142.713 Y97.935 E.33012
G2 X139.997 Y94.841 I-13.855 J9.423 E.1369
G1 X139.106 Y93.95 E.0418
G1 X139.022 Y93.95 E.00281
G1 X132.35 Y100.622 E.31298
G2 X130.538 Y99.834 I-4.843 J8.664 E.06565
G1 X124.654 Y93.95 E.27603
G1 X123.67 Y93.95 E.03265
G1 X111.45 Y106.17 E.57324
G3 X111.46 Y103.784 I48.589 J-.99 E.07914
G1 X120.212 Y112.536 E.41054
G1 X120.211 Y112.761 E.00748
G1 X111.45 Y121.522 E.41099
G1 X111.45 Y119.126 E.07946
G1 X121.289 Y128.965 E.46155
G3 X126.293 Y129.707 I1.711 J5.7 E.17331
G1 X130.316 Y125.684 E.18877
G1 X134.831 Y128.845 E.18283
G1 X130.811 Y132.865 E.1886
G1 X135.325 Y136.026 E.18283
G1 X139.346 Y132.006 E.1886
G3 X143.05 Y135.977 I-6.477 J9.755 E.18181
G1 X138.778 Y140.25 E.20043
G3 X138.95 Y141.864 I-6.208 J1.479 E.054
; WIPE_START
G1 F33600
G1 X138.935 Y141.223 E-.2437
G1 X138.778 Y140.25 E-.37457
G1 X139.042 Y139.986 E-.14173
; WIPE_END
G1 E-.04 F1800
G1 X137.122 Y147.373 Z5 F42000
G1 X135.595 Y153.249 Z5
G1 Z4.6
G1 E.8 F1800
G1 F15476.087
G1 X136.746 Y152.098 E.05401
G1 X142.168 Y157.52 E.25434
G3 X137.92 Y160.948 I-9.213 J-7.067 E.18278
G1 X132.908 Y155.936 E.23514
G1 X132.394 Y156.45 E.02413
G1 X130.254 Y156.45 E.07099
G1 X124.654 Y162.05 E.26268
G1 X123.67 Y162.05 E.03265
G1 X111.45 Y149.83 E.57324
G2 X111.565 Y152.111 I19.073 J.182 E.07579
G1 X117.05 Y146.626 E.25728
G2 X117.062 Y147.766 I14.51 J.411 E.03782
G1 X111.45 Y142.154 E.26326
G1 X111.45 Y144.55 E.07946
G1 X117.05 Y138.95 E.26268
G1 X117.05 Y140.078 E.03739
G1 X111.45 Y134.478 E.26268
G1 X111.45 Y136.874 E.07946
G1 X125.802 Y122.522 E.67325
G3 X121.991 Y118.657 I7.449 J-11.153 E.1813
G1 X111.45 Y129.198 E.4945
G1 X111.45 Y126.802 E.07946
G1 X117.375 Y132.727 E.27795
G2 X117.062 Y134.319 I5.74 J1.955 E.05399
; WIPE_START
G1 F33600
G1 X117.121 Y133.736 E-.22259
G1 X117.375 Y132.727 E-.39553
G1 X117.111 Y132.463 E-.14188
; WIPE_END
G1 E-.04 F1800
G1 X118.65 Y124.987 Z5 F42000
G1 X123.489 Y101.475 Z5
G1 Z4.6
G1 E.8 F1800
G1 F15476.087
G2 X122.518 Y102.778 I9.764 J8.291 E.05396
G1 X111.45 Y113.846 E.51919
G1 X111.45 Y111.45 E.07946
G1 X144.55 Y144.55 E1.55276
G1 X144.55 Y142.154 E.07946
G1 X138.938 Y147.766 E.26326
G2 X138.95 Y146.626 I-14.497 J-.729 E.03782
G1 X144.435 Y152.111 E.25728
G2 X144.55 Y149.83 I-18.958 J-2.099 E.07579
G1 X132.33 Y162.05 E.57324
G1 X131.346 Y162.05 E.03265
G1 X125.746 Y156.45 E.26268
G1 X123.606 Y156.45 E.07099
G1 X123.092 Y155.936 E.02413
G1 X118.08 Y160.948 E.23514
G3 X113.832 Y157.52 I4.966 J-10.496 E.18278
G1 X119.254 Y152.098 E.25434
G1 X120.405 Y153.249 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X119.254 Y152.098 E-.61876
G1 X118.991 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/45
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
G17
G3 Z5 I-.751 J.958 P1  F42000
G1 X123.71 Y156.062 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21954
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X122.728 Y129.068 I5.605 J.019 E.28231
G3 X126.204 Y130.064 I.269 J5.626 E.1221
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.252 J4.598 E.17757
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.754 Y156.102 E.28182
G1 X123.89 Y155.687 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.1989
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.748 Y129.46 I5.213 J.011 E.24344
G3 X125.985 Y130.39 I.248 J5.234 E.10536
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.021 J4.281 E.15336
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
M73 P62 R7
G1 X123.941 Y155.71 E.25031
M204 S6000
; WIPE_START
G1 F33600
G1 X122.522 Y154.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.502 Y146.929 Z5.2 F42000
G1 X132.862 Y115.801 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.72 Y115.556 E.0094
G3 X132.602 Y114.989 I1.289 J-.565 E.01934
G1 X132.602 Y112.845 E.0711
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.873 Y109.979 E.08676
G2 X135.602 Y108.218 I-1.981 J-1.852 E.06459
G2 X135.536 Y106.033 I-15.884 J-.617 E.07258
G2 X128.51 Y99.898 I-7.047 J.979 E.33743
G2 X126.383 Y100.098 I-.385 J7.297 E.07113
G2 X123.31 Y102.231 I1.6 J5.586 E.12635
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.808 Y109.936 I50.169 J13.426 E.15726
G2 X125.496 Y121.883 I11.371 J2.431 E.45098
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.826 J9.754 E.37932
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.907 J-.002 E.62032
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I.002 J-11.907 E.62032
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.907 J-.003 E.31046
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X140.337 Y94.689 E.05098
G3 X142.197 Y96.63 I-18.89 J19.96 E.08921
G3 X144.898 Y104.185 I-9.207 J7.552 E.27146
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.407 J.003 E.22981
G1 X134.011 Y116.398 E.21485
G3 X132.895 Y115.851 I-.002 J-1.407 E.0427
G1 X132.531 Y116.016 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.45 Y115.894 E.00448
G3 X132.21 Y114.996 I1.552 J-.896 E.0289
G1 X132.21 Y112.834 E.06642
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.585 Y109.712 E.08026
G2 X135.21 Y108.204 I-1.676 J-1.577 E.05127
G2 X135.148 Y106.086 I-15.441 J-.606 E.06514
G2 X128.504 Y100.29 I-6.658 J.926 E.29548
G2 X126.487 Y100.477 I-.381 J6.871 E.06245
G2 X123.621 Y102.47 I1.49 J5.199 E.10922
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.193 Y110.008 I49.813 J13.319 E.14442
G2 X125.724 Y121.564 I10.986 J2.359 E.40407
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.05 J10.07 E.36266
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.299 J-.007 E.59323
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I.007 J-12.299 E.59323
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.485 I12.293 J-.001 E.29675
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X140.614 Y94.411 E.05221
G3 X142.5 Y96.381 I-19.125 J20.199 E.08382
G3 X145.29 Y104.18 I-9.504 J7.798 E.2596
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.799 J-.005 E.23133
G1 X134.004 Y116.79 E.19948
G3 X132.574 Y116.081 I-.002 J-1.792 E.05083
G1 X132.564 Y116.066 E.00056
M204 S6000
; WIPE_START
G1 F33600
G1 X132.45 Y115.894 E-.07822
G1 X132.353 Y115.699 E-.08281
G1 X132.278 Y115.485 E-.08629
G1 X132.231 Y115.266 E-.08499
G1 X132.21 Y114.996 E-.10302
G1 X132.21 Y114.142 E-.32468
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z5.2 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z5.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.2 F4000
            G39.3 S1
            G0 Z5.2 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z5.6 F42000
G1 X117.062 Y134.319
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X117.375 Y132.727 I6.053 J.363 E.05399
G1 X111.45 Y126.802 E.27795
G1 X111.45 Y129.198 E.07946
G1 X121.992 Y118.656 E.49454
G2 X125.802 Y122.522 I11.24 J-7.265 E.18131
G1 X111.45 Y136.874 E.67325
G1 X111.45 Y134.478 E.07946
G1 X117.05 Y140.078 E.26268
G1 X117.05 Y138.95 E.03739
G1 X111.45 Y144.55 E.26268
G1 X111.45 Y142.154 E.07946
G1 X117.062 Y147.766 E.26326
G3 X117.05 Y146.626 I14.497 J-.729 E.03782
G1 X111.565 Y152.111 E.25728
G3 X111.45 Y149.83 I18.958 J-2.099 E.07579
G1 X123.67 Y162.05 E.57324
G1 X124.654 Y162.05 E.03265
G1 X130.254 Y156.45 E.26268
G1 X132.394 Y156.45 E.07099
G1 X132.908 Y155.936 E.02413
G1 X137.92 Y160.948 E.23514
G2 X142.168 Y157.52 I-4.966 J-10.496 E.18278
G1 X136.746 Y152.098 E.25434
G1 X135.595 Y153.249 E.05401
; WIPE_START
G1 F33600
G1 X136.746 Y152.098 E-.61876
G1 X137.009 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X138.397 Y144.856 Z5.2 F42000
G1 X138.95 Y141.864 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F15476.087
G2 X138.778 Y140.25 I-6.38 J-.135 E.054
G1 X143.05 Y135.977 E.20043
G2 X139.346 Y132.006 I-10.181 J5.784 E.18181
G1 X135.325 Y136.026 E.1886
G1 X130.811 Y132.865 E.18283
G1 X134.831 Y128.845 E.1886
G1 X130.316 Y125.684 E.18283
G1 X126.293 Y129.707 E.18877
G2 X121.289 Y128.965 I-3.293 J4.957 E.17331
G1 X111.45 Y119.126 E.46155
G1 X111.45 Y121.522 E.07946
G1 X120.218 Y112.755 E.41129
G1 X120.21 Y112.534 E.00732
G1 X111.46 Y103.784 E.41047
G2 X111.45 Y106.17 I48.579 J1.395 E.07914
G1 X123.67 Y93.95 E.57324
G1 X124.654 Y93.95 E.03265
G1 X130.538 Y99.834 E.27603
G3 X132.35 Y100.622 I-3.031 J9.451 E.06565
G1 X139.022 Y93.95 E.31298
G1 X139.106 Y93.95 E.00281
G1 X140.091 Y94.935 E.04619
G3 X142.713 Y97.935 I-10.934 J12.202 E.1325
G1 X135.666 Y104.962 E.33012
G1 X144.238 Y113.534 E.40214
G2 X144.55 Y111.45 I-4.598 J-1.753 E.07044
G1 X139.951 Y116.049 E.21575
G1 X139.077 Y116.049 E.02898
G1 X134.189 Y111.161 E.2293
G1 X133.182 Y112.175 E.04741
G2 X132.95 Y112.864 I.964 J.708 E.0245
G2 X132.963 Y115.145 I14.972 J1.056 E.07573
G1 X133.011 Y115.313 E.0058
G1 X144.54 Y103.784 E.54083
G3 X144.55 Y106.17 I-48.583 J1.395 E.07914
G1 X132.33 Y93.95 E.57324
G1 X131.346 Y93.95 E.03265
G1 X125.009 Y100.287 E.29725
G2 X124.005 Y100.977 I3.744 J6.52 E.04048
G1 X116.978 Y93.95 E.32965
G1 X116.894 Y93.95 E.00281
G2 X113.397 Y97.761 I17.673 J19.726 E.17184
G1 X113.287 Y97.935 E.00683
G1 X121.297 Y105.945 E.37577
G2 X120.931 Y107.531 I17.38 J4.852 E.05402
; WIPE_START
G1 F33600
G1 X121.297 Y105.945 E-.61861
G1 X121.034 Y105.682 E-.14139
; WIPE_END
G1 E-.04 F1800
G1 X120.933 Y113.314 Z5.2 F42000
G1 X120.405 Y153.249 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F15476.087
G1 X119.254 Y152.098 E.05401
G1 X113.832 Y157.52 E.25434
G2 X118.08 Y160.948 I9.213 J-7.067 E.18278
G1 X123.092 Y155.936 E.23514
G1 X123.606 Y156.45 E.02413
G1 X125.746 Y156.45 E.07099
G1 X131.346 Y162.05 E.26268
G1 X132.33 Y162.05 E.03265
G1 X144.55 Y149.83 E.57324
G3 X144.428 Y152.104 I-17.037 J.228 E.07559
G1 X138.95 Y146.626 E.25697
G3 X138.938 Y147.766 I-14.51 J.411 E.03782
G1 X144.55 Y142.154 E.26326
G1 X144.55 Y144.55 E.07946
G1 X111.45 Y111.45 E1.55276
G1 X111.45 Y113.846 E.07946
G1 X122.518 Y102.778 E.51919
G3 X123.489 Y101.475 I10.735 J6.988 E.05396
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X123.033 Y102.02 E-.27007
G1 X122.518 Y102.778 E-.34845
G1 X122.254 Y103.042 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/45
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
G17
G3 Z5.2 I-1.217 J.033 P1  F42000
G1 X123.709 Y156.061 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.2195
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X122.743 Y129.068 I5.605 J.019 E.28283
G3 X126.204 Y130.064 I.253 J5.627 E.12159
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.752 Y156.102 E.28186
M73 P63 R7
G1 X123.892 Y155.689 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19897
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.764 Y129.459 I5.213 J.011 E.24392
G3 X125.985 Y130.39 I.232 J5.236 E.10488
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.018 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.943 Y155.71 E.25024
M204 S6000
; WIPE_START
G1 F33600
G1 X122.524 Y154.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.502 Y146.929 Z5.4 F42000
G1 X132.857 Y115.792 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.728 Y115.572 E.00847
G3 X132.602 Y114.99 I1.281 J-.581 E.0199
G1 X132.602 Y112.845 E.07115
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.874 Y109.977 E.08683
G2 X135.602 Y108.192 I-1.903 J-1.817 E.06546
G2 X135.536 Y106.033 I-15.733 J-.601 E.07172
G2 X128.51 Y99.898 I-7.047 J.98 E.33743
G2 X126.385 Y100.098 I-.385 J7.303 E.07106
G2 X123.31 Y102.231 I1.598 J5.587 E.12642
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.808 Y109.936 I50.169 J13.426 E.15726
G2 X125.496 Y121.883 I11.371 J2.431 E.45098
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.826 J9.754 E.37932
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.902 J.004 E.62039
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I-.004 J-11.902 E.62039
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.907 J-.003 E.31046
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X140.431 Y94.782 E.05536
G3 X142.197 Y96.63 I-16.596 J17.634 E.08483
G3 X144.898 Y104.185 I-9.207 J7.552 E.27146
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.404 J.006 E.22986
G1 X134.01 Y116.398 E.2149
G3 X132.891 Y115.846 I-.001 J-1.407 E.04286
G1 X132.89 Y115.843 E.00012
G1 X132.526 Y116.009 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.454 Y115.899 E.00405
G3 X132.21 Y114.997 I1.55 J-.903 E.02905
G1 X132.21 Y112.834 E.06644
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.587 Y109.71 E.08031
G2 X135.21 Y108.179 I-1.61 J-1.548 E.05204
G2 X135.148 Y106.086 I-15.297 J-.591 E.06438
G2 X128.504 Y100.29 I-6.659 J.927 E.29547
G2 X126.488 Y100.476 I-.381 J6.874 E.06243
G2 X123.621 Y102.47 I1.489 J5.2 E.10924
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.193 Y110.008 I49.813 J13.319 E.14442
G2 X125.724 Y121.564 I10.986 J2.359 E.40407
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.05 J10.07 E.36265
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.291 J.001 E.59333
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I-.001 J-12.291 E.59333
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.486 I12.293 J-.001 E.29675
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X140.708 Y94.505 E.05627
G3 X142.5 Y96.381 I-16.846 J17.888 E.07976
G3 X145.29 Y104.18 I-9.504 J7.798 E.2596
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.792 J.002 E.23142
G1 X134.003 Y116.79 E.19949
G3 X132.578 Y116.085 I0 J-1.794 E.05062
G1 X132.56 Y116.058 E.001
M204 S6000
; WIPE_START
G1 F33600
G1 X132.454 Y115.899 E-.07282
G1 X132.367 Y115.729 E-.0724
G1 X132.279 Y115.488 E-.09754
G1 X132.231 Y115.27 E-.08471
G1 X132.21 Y114.997 E-.10437
G1 X132.21 Y114.133 E-.32815
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z5.4 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z5.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.4 F4000
            G39.3 S1
            G0 Z5.4 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z5.8 F42000
G1 X120.931 Y107.531
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X121.297 Y105.945 I17.746 J3.265 E.05402
G1 X113.287 Y97.935 E.37577
G3 X114.841 Y96.003 I9.972 J6.43 E.08242
G1 X116.894 Y93.95 E.09627
G1 X116.978 Y93.95 E.00281
G1 X124.005 Y100.977 E.32965
G3 X125.003 Y100.293 I7.174 J9.396 E.04014
G1 X131.346 Y93.95 E.29757
G1 X132.33 Y93.95 E.03265
G1 X144.55 Y106.17 E.57324
G2 X144.54 Y103.784 I-48.593 J-.99 E.07914
G1 X133.005 Y115.319 E.54112
G3 X132.95 Y114.977 I1.072 J-.346 E.01155
G1 X132.95 Y112.864 E.07007
G3 X133.182 Y112.175 I1.195 J.019 E.0245
G1 X134.189 Y111.161 E.04741
G1 X139.077 Y116.049 E.22931
G1 X139.951 Y116.049 E.02897
G1 X144.55 Y111.45 E.21576
G3 X144.244 Y113.54 I-5.112 J.32 E.07057
G1 X135.666 Y104.962 E.40243
G1 X142.713 Y97.935 E.33012
G2 X140.185 Y95.029 I-13.264 J8.986 E.1281
G1 X139.106 Y93.95 E.05058
G1 X139.022 Y93.95 E.00281
G1 X132.35 Y100.622 E.31298
G2 X130.538 Y99.834 I-4.843 J8.664 E.06565
G1 X124.654 Y93.95 E.27603
G1 X123.67 Y93.95 E.03265
G1 X111.45 Y106.17 E.57324
G3 X111.46 Y103.784 I48.589 J-.99 E.07914
G1 X120.212 Y112.536 E.41054
G1 X120.211 Y112.761 E.00748
G1 X111.45 Y121.522 E.41099
G1 X111.45 Y119.126 E.07946
G1 X121.289 Y128.965 E.46155
G3 X126.293 Y129.707 I1.689 J5.845 E.17305
G1 X130.316 Y125.684 E.18877
G1 X134.831 Y128.845 E.18283
G1 X130.811 Y132.865 E.1886
G1 X135.325 Y136.026 E.18283
G1 X139.346 Y132.006 E.1886
G3 X143.05 Y135.977 I-6.477 J9.755 E.18181
G1 X138.778 Y140.25 E.20043
G3 X138.95 Y141.864 I-6.208 J1.479 E.054
; WIPE_START
G1 F33600
G1 X138.935 Y141.223 E-.2437
G1 X138.778 Y140.25 E-.37457
G1 X139.042 Y139.986 E-.14173
; WIPE_END
G1 E-.04 F1800
G1 X137.122 Y147.373 Z5.4 F42000
G1 X135.595 Y153.249 Z5.4
G1 Z5
G1 E.8 F1800
G1 F15476.087
G1 X136.746 Y152.098 E.05401
G1 X142.168 Y157.52 E.25434
G3 X137.92 Y160.948 I-9.213 J-7.067 E.18278
G1 X132.908 Y155.936 E.23514
G1 X132.394 Y156.45 E.02413
G1 X130.254 Y156.45 E.07099
G1 X124.654 Y162.05 E.26268
G1 X123.67 Y162.05 E.03265
G1 X111.45 Y149.83 E.57324
G2 X111.565 Y152.111 I19.073 J.182 E.07579
G1 X117.05 Y146.626 E.25728
G2 X117.062 Y147.766 I14.511 J.411 E.03782
G1 X111.45 Y142.154 E.26326
G1 X111.45 Y144.55 E.07946
G1 X117.05 Y138.95 E.26268
G1 X117.05 Y140.078 E.03739
G1 X111.45 Y134.478 E.26268
G1 X111.45 Y136.874 E.07946
G1 X125.802 Y122.522 E.67325
G3 X121.993 Y118.655 I7.413 J-11.11 E.18132
G1 X111.45 Y129.198 E.49458
G1 X111.45 Y126.802 E.07946
G1 X117.375 Y132.727 E.27795
G2 X117.062 Y134.319 I5.74 J1.955 E.05399
; WIPE_START
G1 F33600
G1 X117.121 Y133.736 E-.22259
G1 X117.375 Y132.727 E-.39552
G1 X117.111 Y132.463 E-.14188
; WIPE_END
G1 E-.04 F1800
G1 X118.65 Y124.987 Z5.4 F42000
G1 X123.489 Y101.475 Z5.4
G1 Z5
G1 E.8 F1800
G1 F15476.087
G2 X122.518 Y102.778 I9.764 J8.291 E.05396
G1 X111.45 Y113.846 E.51919
G1 X111.45 Y111.45 E.07946
G1 X144.55 Y144.55 E1.55276
G1 X144.55 Y142.154 E.07946
G1 X138.938 Y147.766 E.26326
G2 X138.95 Y146.626 I-14.497 J-.729 E.03782
G1 X144.435 Y152.111 E.25728
G2 X144.55 Y149.83 I-18.959 J-2.099 E.07579
G1 X132.33 Y162.05 E.57324
G1 X131.346 Y162.05 E.03265
G1 X125.746 Y156.45 E.26268
G1 X123.606 Y156.45 E.07099
G1 X123.092 Y155.936 E.02413
G1 X118.08 Y160.948 E.23514
G3 X113.832 Y157.52 I4.966 J-10.496 E.18278
G1 X119.254 Y152.098 E.25434
G1 X120.405 Y153.249 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X119.254 Y152.098 E-.61876
G1 X118.991 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/45
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
G17
G3 Z5.4 I-.751 J.958 P1  F42000
G1 X123.708 Y156.06 Z5.4
G1 Z5.2
M73 P64 R7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21944
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X122.759 Y129.067 I5.606 J.019 E.28335
G3 X126.204 Y130.064 I.237 J5.629 E.12107
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.251 J4.597 E.17757
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.751 Y156.102 E.28192
G1 X123.751 Y156.102 E0
G1 X123.894 Y155.691 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19907
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.779 Y129.458 I5.214 J.011 E.2444
G3 X125.985 Y130.39 I.216 J5.238 E.1044
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.019 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.946 Y155.71 E.25014
M204 S6000
; WIPE_START
G1 F33600
G1 X122.527 Y154.301 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.503 Y146.929 Z5.6 F42000
G1 X132.853 Y115.784 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.725 Y115.564 E.00843
G3 X132.602 Y114.992 I1.284 J-.574 E.01956
G1 X132.602 Y112.845 E.07121
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.878 Y109.974 E.08698
G2 X135.602 Y108.195 I-1.876 J-1.801 E.06525
G2 X135.536 Y106.033 I-15.753 J-.603 E.07181
G2 X128.51 Y99.898 I-7.047 J.979 E.33743
G2 X126.675 Y100.027 I-.363 J7.98 E.06117
G2 X123.31 Y102.231 I1.234 J5.554 E.13641
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.808 Y109.936 I50.17 J13.427 E.15726
G2 X125.496 Y121.883 I11.372 J2.431 E.45098
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.847 J9.765 E.37927
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.902 J.004 E.62039
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I.002 J-11.907 E.62032
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.907 J-.003 E.31046
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X140.524 Y94.876 E.05975
G3 X142.197 Y96.63 I-15.875 J16.814 E.08044
G3 X144.898 Y104.185 I-9.207 J7.552 E.27147
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.404 J.006 E.22985
G1 X133.951 Y116.396 E.21685
G3 X132.895 Y115.849 I.058 J-1.405 E.04074
G1 X132.885 Y115.834 E.00059
G1 X132.521 Y116.001 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.458 Y115.903 E.0036
G3 X132.21 Y114.997 I1.551 J-.912 E.02919
G1 X132.21 Y112.834 E.06646
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.589 Y109.708 E.0804
G2 X135.21 Y108.18 I-1.598 J-1.54 E.05194
G2 X135.148 Y106.086 I-15.304 J-.592 E.06441
G2 X128.504 Y100.29 I-6.658 J.926 E.29548
G2 X126.758 Y100.41 I-.36 J7.525 E.05387
G2 X123.621 Y102.47 I1.149 J5.17 E.11788
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.193 Y110.008 I49.814 J13.319 E.14442
G2 X125.724 Y121.564 I11.011 J2.349 E.40396
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.076 J10.084 E.36259
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.299 J-.006 E.59323
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I.007 J-12.299 E.59323
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.485 I12.293 J-.001 E.29675
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X140.802 Y94.599 E.06034
G3 X142.5 Y96.381 I-16.129 J17.071 E.07569
G3 X145.29 Y104.18 I-9.504 J7.798 E.2596
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.792 J.002 E.23142
G1 X133.933 Y116.788 E.20167
G3 X132.584 Y116.088 I.077 J-1.798 E.0482
G1 X132.556 Y116.05 E.00144
M204 S6000
; WIPE_START
G1 F33600
G1 X132.458 Y115.903 E-.06728
G1 X132.363 Y115.722 E-.07782
G1 X132.28 Y115.493 E-.09244
G1 X132.232 Y115.274 E-.085
G1 X132.21 Y114.997 E-.10568
G1 X132.21 Y114.124 E-.33179
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z5.6 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z5.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.6 F4000
            G39.3 S1
            G0 Z5.6 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z6 F42000
G1 X117.062 Y134.319
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X117.375 Y132.727 I6.053 J.363 E.05399
G1 X111.45 Y126.802 E.27795
G1 X111.45 Y129.198 E.07946
G1 X121.994 Y118.654 E.49462
G2 X125.802 Y122.522 I11.201 J-7.218 E.18132
G1 X111.45 Y136.874 E.67325
G1 X111.45 Y134.478 E.07946
G1 X117.05 Y140.078 E.26268
G1 X117.05 Y138.95 E.03739
G1 X111.45 Y144.55 E.26268
G1 X111.45 Y142.154 E.07946
G1 X117.062 Y147.766 E.26326
G3 X117.05 Y146.626 I14.497 J-.729 E.03782
G1 X111.565 Y152.111 E.25728
G3 X111.45 Y149.83 I18.958 J-2.099 E.07579
G1 X123.67 Y162.05 E.57324
G1 X124.654 Y162.05 E.03265
G1 X130.254 Y156.45 E.26268
G1 X132.394 Y156.45 E.07099
G1 X132.908 Y155.936 E.02413
G1 X137.92 Y160.948 E.23514
G2 X142.162 Y157.514 I-4.899 J-10.388 E.18279
G1 X136.746 Y152.098 E.25408
G1 X135.595 Y153.249 E.05401
; WIPE_START
G1 F33600
G1 X136.746 Y152.098 E-.61876
G1 X137.009 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X138.397 Y144.856 Z5.6 F42000
G1 X138.95 Y141.864 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F15476.087
G2 X138.778 Y140.25 I-6.38 J-.135 E.054
G1 X143.05 Y135.977 E.20043
G2 X139.346 Y132.006 I-10.181 J5.784 E.18181
G1 X135.325 Y136.026 E.1886
G1 X130.811 Y132.865 E.18283
G1 X134.831 Y128.845 E.1886
G1 X130.316 Y125.684 E.18283
G1 X126.293 Y129.707 E.18877
G2 X121.289 Y128.965 I-3.314 J5.102 E.17305
G1 X111.45 Y119.126 E.46155
G1 X111.45 Y121.522 E.07946
G1 X120.211 Y112.761 E.41099
G1 X120.212 Y112.536 E.00748
G1 X111.46 Y103.784 E.41054
G2 X111.45 Y106.17 I48.579 J1.395 E.07914
G1 X123.67 Y93.95 E.57324
G1 X124.654 Y93.95 E.03265
G1 X130.538 Y99.834 E.27603
G3 X132.35 Y100.622 I-3.031 J9.451 E.06565
G1 X139.022 Y93.95 E.31298
G1 X139.106 Y93.95 E.00281
G1 X140.278 Y95.122 E.05497
G3 X142.713 Y97.935 I-10.547 J11.59 E.12371
G1 X135.666 Y104.962 E.33012
G1 X144.244 Y113.54 E.40243
G2 X144.55 Y111.45 I-4.806 J-1.77 E.07057
G1 X139.951 Y116.049 E.21575
G1 X139.077 Y116.049 E.02897
G1 X134.189 Y111.161 E.2293
G1 X133.182 Y112.175 E.04741
G2 X132.95 Y112.864 I.964 J.708 E.0245
G2 X132.964 Y115.15 I14.359 J1.057 E.0759
G1 X133.012 Y115.312 E.00561
G1 X144.54 Y103.784 E.5408
G3 X144.55 Y106.17 I-48.583 J1.395 E.07914
G1 X132.33 Y93.95 E.57324
G1 X131.346 Y93.95 E.03265
G1 X125.003 Y100.293 E.29757
G2 X124.005 Y100.977 I6.176 J10.078 E.04014
G1 X116.978 Y93.95 E.32965
G1 X116.894 Y93.95 E.00281
G2 X113.397 Y97.761 I17.673 J19.726 E.17183
G1 X113.287 Y97.935 E.00683
G1 X121.297 Y105.945 E.37577
G2 X120.931 Y107.531 I17.38 J4.852 E.05402
; WIPE_START
G1 F33600
G1 X121.297 Y105.945 E-.61861
G1 X121.034 Y105.682 E-.14139
; WIPE_END
G1 E-.04 F1800
G1 X120.933 Y113.314 Z5.6 F42000
G1 X120.405 Y153.249 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F15476.087
G1 X119.254 Y152.098 E.05401
G1 X113.832 Y157.52 E.25434
G2 X118.08 Y160.948 I9.213 J-7.067 E.18278
G1 X123.092 Y155.936 E.23514
G1 X123.606 Y156.45 E.02413
G1 X125.746 Y156.45 E.07099
G1 X131.346 Y162.05 E.26268
G1 X132.33 Y162.05 E.03265
G1 X144.55 Y149.83 E.57324
G3 X144.429 Y152.105 I-17.283 J.223 E.07562
G1 X138.95 Y146.626 E.25701
G3 X138.938 Y147.766 I-14.51 J.411 E.03782
G1 X144.55 Y142.154 E.26326
G1 X144.55 Y144.55 E.07946
G1 X111.45 Y111.45 E1.55276
G1 X111.45 Y113.846 E.07946
G1 X122.518 Y102.778 E.51919
G3 X123.489 Y101.475 I10.736 J6.988 E.05396
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X123.033 Y102.02 E-.27008
G1 X122.518 Y102.778 E-.34844
G1 X122.254 Y103.042 E-.14148
; WIPE_END
M73 P65 R7
G1 E-.04 F1800
; layer num/total_layer_count: 27/45
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
G17
G3 Z5.6 I-1.217 J.033 P1  F42000
G1 X123.706 Y156.058 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21936
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X122.774 Y129.066 I5.606 J.019 E.28387
G3 X126.204 Y130.064 I.22 J5.632 E.12055
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.751 Y156.102 E.28192
G1 X123.749 Y156.1 E.00009
G1 X123.898 Y155.695 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19922
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.795 Y129.458 I5.214 J.011 E.24488
G3 X125.985 Y130.39 I.2 J5.24 E.10392
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.018 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.951 Y155.71 E.24999
M204 S6000
; WIPE_START
G1 F33600
G1 X122.531 Y154.302 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.506 Y146.929 Z5.8 F42000
G1 X132.848 Y115.775 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.721 Y115.557 E.00839
G3 X132.602 Y114.994 I1.288 J-.566 E.01921
G1 X132.602 Y112.845 E.07128
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.878 Y109.973 E.08701
G2 X135.602 Y108.194 I-1.867 J-1.797 E.06527
G2 X135.536 Y106.033 I-15.745 J-.602 E.07178
G2 X128.51 Y99.898 I-7.047 J.979 E.33743
G2 X126.383 Y100.099 I-.385 J7.296 E.07114
G2 X123.31 Y102.231 I1.6 J5.586 E.12634
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.808 Y109.936 I50.169 J13.426 E.15726
G2 X125.496 Y121.883 I11.395 J2.422 E.45087
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.826 J9.754 E.37932
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.907 J-.002 E.62032
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I.002 J-11.907 E.62032
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.907 J-.003 E.31046
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X140.618 Y94.969 E.06414
G3 X142.556 Y97.09 I-13.447 J14.237 E.0954
G3 X144.898 Y104.185 I-9.626 J7.111 E.25205
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.404 J.006 E.22986
G1 X133.962 Y116.397 E.2165
G3 X132.897 Y115.853 I.047 J-1.406 E.04094
G1 X132.88 Y115.826 E.00106
G1 X132.516 Y115.994 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.461 Y115.908 E.00316
G3 X132.21 Y114.998 I1.548 J-.917 E.02934
G1 X132.21 Y112.834 E.06648
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.59 Y109.707 E.08045
G2 X135.21 Y108.179 I-1.591 J-1.536 E.05192
G2 X135.148 Y106.086 I-15.301 J-.592 E.06439
G2 X128.504 Y100.29 I-6.658 J.926 E.29548
G2 X126.487 Y100.477 I-.381 J6.871 E.06246
G2 X123.621 Y102.47 I1.49 J5.199 E.10922
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.193 Y110.008 I49.813 J13.319 E.14442
G2 X125.724 Y121.564 I11.009 J2.35 E.40397
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.05 J10.07 E.36265
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.299 J-.007 E.59323
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I.007 J-12.299 E.59323
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.485 I12.293 J-.001 E.29675
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X140.895 Y94.692 E.06441
G3 X142.871 Y96.857 I-13.697 J14.491 E.09014
G3 X145.29 Y104.18 I-9.942 J7.345 E.24101
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.792 J.002 E.23142
G1 X133.943 Y116.789 E.20135
G3 X132.587 Y116.093 I.067 J-1.798 E.04835
G1 X132.551 Y116.043 E.00189
M204 S6000
; WIPE_START
G1 F33600
G1 X132.461 Y115.908 E-.06181
G1 X132.359 Y115.714 E-.08328
G1 X132.281 Y115.498 E-.08732
G1 X132.232 Y115.278 E-.08529
G1 X132.21 Y114.998 E-.10689
G1 X132.21 Y114.115 E-.3354
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z5.8 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z5.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.8 F4000
            G39.3 S1
            G0 Z5.8 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z6.2 F42000
G1 X120.931 Y107.531
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X121.297 Y105.945 I17.747 J3.265 E.05402
G1 X113.287 Y97.935 E.37577
G3 X114.841 Y96.003 I9.971 J6.429 E.08242
G1 X116.894 Y93.95 E.09627
G1 X116.978 Y93.95 E.00281
G1 X124.005 Y100.977 E.32965
G3 X125.01 Y100.287 I4.748 J5.829 E.04048
G1 X131.346 Y93.95 E.29725
G1 X132.33 Y93.95 E.03265
G1 X144.55 Y106.17 E.57324
G2 X144.54 Y103.784 I-48.593 J-.99 E.07914
G1 X133.011 Y115.313 E.54084
G3 X132.95 Y114.98 I.782 J-.314 E.0113
G1 X132.95 Y112.864 E.07018
G3 X133.182 Y112.175 I1.195 J.019 E.0245
G1 X134.189 Y111.161 E.04741
G1 X139.077 Y116.049 E.22931
G1 X139.95 Y116.05 E.02896
G1 X144.55 Y111.45 E.21576
G3 X144.244 Y113.54 I-5.112 J.32 E.07057
G1 X135.666 Y104.962 E.40243
G1 X142.713 Y97.935 E.33012
G2 X140.371 Y95.215 I-11.374 J7.425 E.11943
G1 X139.106 Y93.95 E.05931
G1 X139.022 Y93.95 E.00281
G1 X132.35 Y100.622 E.31298
G2 X130.538 Y99.834 I-4.843 J8.664 E.06565
G1 X124.654 Y93.95 E.27603
G1 X123.67 Y93.95 E.03265
G1 X111.45 Y106.17 E.57324
G3 X111.46 Y103.784 I48.589 J-.99 E.07914
G1 X120.212 Y112.536 E.41054
G1 X120.211 Y112.761 E.00748
G1 X111.45 Y121.522 E.41099
G1 X111.45 Y119.126 E.07946
G1 X121.289 Y128.965 E.46155
G3 X126.293 Y129.707 I1.69 J5.845 E.17305
G1 X130.316 Y125.684 E.18877
G1 X134.831 Y128.845 E.18283
G1 X130.811 Y132.865 E.1886
G1 X135.325 Y136.026 E.18283
G1 X139.346 Y132.006 E.1886
G3 X143.05 Y135.977 I-6.477 J9.755 E.18181
G1 X138.778 Y140.25 E.20043
G3 X138.95 Y141.864 I-6.208 J1.479 E.054
; WIPE_START
G1 F33600
G1 X138.935 Y141.223 E-.2437
G1 X138.778 Y140.25 E-.37457
G1 X139.042 Y139.986 E-.14173
; WIPE_END
G1 E-.04 F1800
G1 X137.122 Y147.373 Z5.8 F42000
G1 X135.595 Y153.249 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F15476.087
G1 X136.746 Y152.098 E.05401
G1 X142.162 Y157.514 E.25407
G3 X137.92 Y160.948 I-9.138 J-6.95 E.18279
G1 X132.908 Y155.936 E.23514
G1 X132.394 Y156.45 E.02413
G1 X130.254 Y156.45 E.07099
G1 X124.654 Y162.05 E.26268
G1 X123.67 Y162.05 E.03265
G1 X111.45 Y149.83 E.57324
G2 X111.565 Y152.111 I19.073 J.182 E.07579
M73 P65 R6
G1 X117.05 Y146.626 E.25728
G2 X117.062 Y147.766 I14.511 J.411 E.03782
G1 X111.45 Y142.154 E.26326
G1 X111.45 Y144.55 E.07946
G1 X117.05 Y138.95 E.26268
G1 X117.05 Y140.078 E.03739
G1 X111.45 Y134.478 E.26268
G1 X111.45 Y136.874 E.07946
G1 X125.802 Y122.522 E.67325
G3 X121.995 Y118.654 I7.379 J-11.069 E.18133
G1 X111.45 Y129.198 E.49465
G1 X111.45 Y126.802 E.07946
G1 X117.375 Y132.727 E.27795
G2 X117.062 Y134.319 I5.74 J1.955 E.05399
; WIPE_START
G1 F33600
G1 X117.121 Y133.736 E-.22259
G1 X117.375 Y132.727 E-.39552
G1 X117.111 Y132.463 E-.14188
; WIPE_END
G1 E-.04 F1800
G1 X118.65 Y124.987 Z5.8 F42000
G1 X123.489 Y101.475 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F15476.087
G2 X122.518 Y102.778 I9.764 J8.292 E.05396
G1 X111.45 Y113.846 E.51919
G1 X111.45 Y111.45 E.07946
G1 X144.55 Y144.55 E1.55276
G1 X144.55 Y142.154 E.07946
G1 X138.938 Y147.766 E.26326
G2 X138.95 Y146.626 I-14.497 J-.729 E.03782
G1 X144.429 Y152.105 E.25703
M73 P66 R6
G2 X144.55 Y149.83 I-17.3 J-2.055 E.07563
G1 X132.33 Y162.05 E.57324
G1 X131.346 Y162.05 E.03265
G1 X125.746 Y156.45 E.26268
G1 X123.606 Y156.45 E.07099
G1 X123.092 Y155.936 E.02413
G1 X118.08 Y160.948 E.23514
G3 X113.832 Y157.52 I4.966 J-10.496 E.18278
G1 X119.254 Y152.098 E.25434
G1 X120.405 Y153.249 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X119.254 Y152.098 E-.61876
G1 X118.991 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/45
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
G17
G3 Z5.8 I-.751 J.958 P1  F42000
G1 X123.704 Y156.055 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21925
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X122.79 Y129.065 I5.606 J.019 E.28439
G3 X126.204 Y130.064 I.204 J5.635 E.12004
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.751 Y156.102 E.28192
G1 X123.746 Y156.098 E.0002
G1 X123.929 Y155.71 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X123.913 Y155.71 E.00049
G1 X119.313 Y151.11 E.19989
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.81 Y129.457 I5.214 J.011 E.24536
G3 X125.985 Y130.39 I.183 J5.243 E.10345
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.018 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.989 Y155.71 E.24883
M204 S6000
; WIPE_START
G1 F33600
G1 X123.913 Y155.71 E-.02884
G1 X122.552 Y154.349 E-.73116
; WIPE_END
G1 E-.04 F1800
G1 X124.519 Y146.975 Z6 F42000
G1 X132.843 Y115.767 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.724 Y115.564 E.00781
G3 X132.602 Y114.992 I1.284 J-.573 E.01954
G1 X132.602 Y112.845 E.07121
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.879 Y109.972 E.08704
G2 X135.602 Y108.193 I-1.865 J-1.795 E.06528
G2 X135.536 Y106.033 I-15.737 J-.602 E.07174
G2 X128.51 Y99.898 I-7.047 J.979 E.33743
G2 X126.383 Y100.099 I-.385 J7.296 E.07114
G2 X123.31 Y102.231 I1.6 J5.586 E.12634
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.808 Y109.936 I50.169 J13.427 E.15726
G2 X125.496 Y121.883 I11.371 J2.431 E.45098
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.847 J9.765 E.37926
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.907 J-.002 E.62032
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I.002 J-11.907 E.62032
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.944 J.012 E.3104
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X140.711 Y95.063 E.06853
G3 X142.556 Y97.09 I-12.858 J13.554 E.09101
G3 X144.898 Y104.185 I-9.626 J7.111 E.25205
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.407 J.003 E.22981
G1 X133.952 Y116.396 E.21682
G3 X132.895 Y115.85 I.057 J-1.405 E.04075
G1 X132.875 Y115.818 E.00124
G1 X132.51 Y115.985 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.459 Y115.903 E.00299
G3 X132.21 Y114.997 I1.551 J-.913 E.0292
G1 X132.21 Y112.834 E.06646
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.591 Y109.706 E.08049
G2 X135.21 Y108.179 I-1.586 J-1.532 E.05189
G2 X135.148 Y106.086 I-15.298 J-.591 E.06438
G2 X128.504 Y100.29 I-6.658 J.926 E.29548
G2 X126.487 Y100.477 I-.381 J6.871 E.06246
G2 X123.621 Y102.47 I1.49 J5.199 E.10921
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.193 Y110.008 I49.813 J13.319 E.14442
G2 X125.724 Y121.564 I10.986 J2.359 E.40407
G1 X140.047 Y131.593 E.53729
G3 X144.975 Y138.912 I-7.043 J10.061 E.2773
G3 X145.29 Y141.665 I-12.294 J2.8 E.08531
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.299 J-.007 E.59323
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I.007 J-12.299 E.59323
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.485 I12.336 J.016 E.29669
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X140.989 Y94.786 E.06847
G3 X142.871 Y96.857 I-13.109 J13.809 E.08608
G3 X145.29 Y104.18 I-9.942 J7.345 E.24101
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.799 J-.005 E.23133
G1 X133.933 Y116.788 E.20165
G3 X132.584 Y116.089 I.076 J-1.798 E.04821
G1 X132.545 Y116.034 E.00205
M204 S6000
; WIPE_START
G1 F33600
G1 X132.459 Y115.903 E-.05974
G1 X132.362 Y115.721 E-.07825
G1 X132.28 Y115.493 E-.09204
G1 X132.232 Y115.275 E-.08502
G1 X132.21 Y114.997 E-.10578
G1 X132.21 Y114.105 E-.33918
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z6 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6 F4000
            G39.3 S1
            G0 Z6 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z6.4 F42000
G1 X117.062 Y134.319
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X117.375 Y132.727 I6.053 J.363 E.05399
G1 X111.45 Y126.802 E.27795
G1 X111.45 Y129.198 E.07946
G1 X121.995 Y118.653 E.49468
G2 X125.802 Y122.522 I11.172 J-7.183 E.18133
G1 X111.45 Y136.874 E.67325
G1 X111.45 Y134.478 E.07946
G1 X117.05 Y140.078 E.26268
G1 X117.05 Y138.95 E.03739
G1 X111.45 Y144.55 E.26268
G1 X111.45 Y142.154 E.07946
G1 X117.062 Y147.766 E.26326
G3 X117.05 Y146.626 I14.497 J-.729 E.03782
G1 X111.565 Y152.111 E.25728
G3 X111.45 Y149.83 I18.958 J-2.099 E.07579
G1 X123.67 Y162.05 E.57324
G1 X124.654 Y162.05 E.03265
G1 X130.254 Y156.45 E.26268
G1 X132.394 Y156.45 E.07099
G1 X132.908 Y155.936 E.02413
G1 X137.912 Y160.94 E.23474
G2 X142.168 Y157.52 I-5.047 J-10.638 E.18277
G1 X136.746 Y152.098 E.25434
G1 X135.595 Y153.249 E.05401
; WIPE_START
G1 F33600
G1 X136.746 Y152.098 E-.61876
G1 X137.009 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X138.397 Y144.856 Z6 F42000
G1 X138.95 Y141.864 Z6
G1 Z5.6
G1 E.8 F1800
G1 F15476.087
G2 X138.778 Y140.25 I-6.38 J-.135 E.054
G1 X143.05 Y135.977 E.20043
G2 X139.346 Y132.006 I-10.181 J5.784 E.18181
G1 X135.325 Y136.026 E.1886
G1 X130.811 Y132.865 E.18283
G1 X134.831 Y128.845 E.1886
G1 X130.316 Y125.684 E.18283
G1 X126.293 Y129.707 E.18877
G2 X121.289 Y128.965 I-3.314 J5.102 E.17305
G1 X111.45 Y119.126 E.46155
G1 X111.45 Y121.522 E.07946
G1 X120.214 Y112.758 E.41113
G3 X120.209 Y112.533 I2.357 J-.169 E.00747
G1 X111.46 Y103.784 E.41041
G2 X111.45 Y106.17 I48.579 J1.395 E.07914
G1 X123.67 Y93.95 E.57324
G1 X124.654 Y93.95 E.03265
G1 X130.538 Y99.834 E.27603
G3 X132.35 Y100.622 I-3.019 J9.424 E.06565
G1 X139.022 Y93.95 E.31298
G1 X139.106 Y93.95 E.00281
G3 X142.277 Y97.298 I-31.566 J33.07 E.153
G3 X142.713 Y97.935 I-6.267 J4.76 E.02563
G1 X135.666 Y104.962 E.33012
G1 X144.244 Y113.54 E.40243
G2 X144.55 Y111.45 I-4.806 J-1.77 E.07057
G1 X139.951 Y116.049 E.21576
G1 X139.077 Y116.049 E.02897
G1 X134.189 Y111.161 E.22931
G1 X133.182 Y112.175 E.04741
G2 X132.95 Y112.864 I.964 J.708 E.0245
G2 X132.964 Y115.15 I14.335 J1.057 E.07591
G1 X133.012 Y115.312 E.0056
G1 X144.54 Y103.784 E.5408
G3 X144.55 Y106.17 I-48.584 J1.395 E.07914
G1 X132.33 Y93.95 E.57324
G1 X131.346 Y93.95 E.03265
G1 X125.009 Y100.287 E.29725
G2 X124.005 Y100.977 I3.744 J6.52 E.04048
G1 X116.978 Y93.95 E.32965
G1 X116.894 Y93.95 E.00281
G2 X113.397 Y97.761 I17.673 J19.726 E.17183
G1 X113.287 Y97.935 E.00683
G1 X121.297 Y105.945 E.37577
G2 X120.931 Y107.531 I17.38 J4.852 E.05402
; WIPE_START
G1 F33600
G1 X121.297 Y105.945 E-.61861
G1 X121.034 Y105.682 E-.14139
; WIPE_END
G1 E-.04 F1800
G1 X120.933 Y113.314 Z6 F42000
G1 X120.405 Y153.249 Z6
M73 P67 R6
G1 Z5.6
G1 E.8 F1800
G1 F15476.087
G1 X119.254 Y152.098 E.05401
G1 X113.836 Y157.516 E.25419
G2 X118.08 Y160.948 I9.171 J-7.001 E.18278
G1 X123.092 Y155.936 E.23514
G1 X123.606 Y156.45 E.02413
G1 X125.746 Y156.45 E.07099
G1 X131.346 Y162.05 E.26268
G1 X132.33 Y162.05 E.03265
G1 X144.55 Y149.83 E.57324
G3 X144.435 Y152.111 I-19.074 J.182 E.07579
G1 X138.95 Y146.626 E.25728
G3 X138.938 Y147.766 I-14.51 J.411 E.03782
G1 X144.55 Y142.154 E.26326
G1 X144.55 Y144.55 E.07946
G1 X111.45 Y111.45 E1.55276
G1 X111.45 Y113.846 E.07946
G1 X122.518 Y102.778 E.51919
G3 X123.489 Y101.475 I10.735 J6.988 E.05396
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X123.033 Y102.02 E-.27008
G1 X122.518 Y102.778 E-.34845
G1 X122.254 Y103.042 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/45
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
G17
G3 Z6 I-1.217 J.033 P1  F42000
G1 X123.701 Y156.053 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21913
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X122.806 Y129.064 I5.607 J.019 E.28491
G3 X126.204 Y130.064 I.187 J5.638 E.11952
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.751 Y156.102 E.28192
G1 X123.744 Y156.095 E.00032
G1 X123.907 Y155.704 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19961
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.826 Y129.456 I5.215 J.012 E.24584
G3 X125.985 Y130.39 I.166 J5.247 E.10297
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.018 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.964 Y155.71 E.24959
M204 S6000
; WIPE_START
G1 F33600
G1 X122.542 Y154.304 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.512 Y146.93 Z6.2 F42000
G1 X132.838 Y115.759 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.72 Y115.556 E.00779
G3 X132.602 Y114.989 I1.289 J-.565 E.01934
G1 X132.602 Y112.845 E.0711
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.877 Y109.974 E.08698
G2 X135.602 Y108.192 I-1.95 J-1.832 E.06526
G2 X135.536 Y106.033 I-15.733 J-.601 E.07172
G2 X128.51 Y99.898 I-7.046 J.978 E.33744
G2 X126.383 Y100.099 I-.385 J7.296 E.07114
G2 X123.31 Y102.231 I1.6 J5.586 E.12634
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.808 Y109.936 I50.168 J13.426 E.15726
G2 X125.496 Y121.883 I11.37 J2.432 E.45098
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.847 J9.765 E.37927
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.907 J-.002 E.62032
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I.002 J-11.907 E.62032
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.907 J-.003 E.31046
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X140.805 Y95.156 E.07292
G3 X142.893 Y97.568 I-9.695 J10.504 E.10602
G3 X144.898 Y104.185 I-9.905 J6.614 E.23272
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.404 J.006 E.22986
G1 X134.011 Y116.398 E.21485
G3 X132.889 Y115.842 I-.002 J-1.407 E.04306
G1 X132.869 Y115.81 E.00125
G1 X132.504 Y115.975 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.45 Y115.894 E.00299
G3 X132.21 Y114.996 I1.552 J-.896 E.0289
G1 X132.21 Y112.834 E.06642
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.588 Y109.708 E.08039
G2 X135.21 Y108.179 I-1.658 J-1.565 E.05192
G2 X135.148 Y106.086 I-15.296 J-.591 E.06437
G2 X128.504 Y100.29 I-6.657 J.924 E.2955
G2 X126.487 Y100.477 I-.381 J6.871 E.06246
G2 X123.621 Y102.47 I1.49 J5.199 E.10921
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.193 Y110.008 I49.813 J13.319 E.14442
G2 X125.724 Y121.564 I10.985 J2.36 E.40407
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.076 J10.084 E.36259
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.299 J-.007 E.59323
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I.007 J-12.299 E.59323
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.485 I12.293 J-.001 E.29675
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X141.082 Y94.879 E.07254
G3 X143.219 Y97.35 I-9.961 J10.773 E.10057
G3 X145.29 Y104.18 I-10.223 J6.829 E.22252
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.792 J.002 E.23142
G1 X134.004 Y116.79 E.19948
G3 X132.574 Y116.081 I-.002 J-1.792 E.05083
G1 X132.537 Y116.025 E.00205
M204 S6000
; WIPE_START
G1 F33600
G1 X132.45 Y115.894 E-.05972
G1 X132.353 Y115.699 E-.08281
G1 X132.278 Y115.485 E-.08629
G1 X132.231 Y115.266 E-.08499
G1 X132.21 Y114.996 E-.10302
G1 X132.21 Y114.093 E-.34317
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z6.2 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z6.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.2 F4000
            G39.3 S1
            G0 Z6.2 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z6.6 F42000
G1 X120.931 Y107.531
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X121.297 Y105.945 I17.747 J3.265 E.05402
G1 X113.287 Y97.935 E.37577
G3 X114.841 Y96.003 I9.971 J6.429 E.08242
G1 X116.894 Y93.95 E.09627
G1 X116.978 Y93.95 E.00281
G1 X124.005 Y100.977 E.32965
G3 X125.009 Y100.287 I4.749 J5.83 E.04048
G1 X131.346 Y93.95 E.29725
G1 X132.33 Y93.95 E.03265
G1 X144.55 Y106.17 E.57324
G2 X144.54 Y103.784 I-48.594 J-.99 E.07914
G1 X133.011 Y115.313 E.54083
G3 X132.95 Y114.975 I.798 J-.318 E.01145
G1 X132.95 Y112.864 E.07003
G3 X133.182 Y112.175 I1.195 J.019 E.0245
G1 X134.189 Y111.161 E.04741
G1 X139.077 Y116.049 E.2293
G1 X139.951 Y116.049 E.02898
G1 X144.55 Y111.45 E.21575
G3 X144.244 Y113.54 I-5.112 J.32 E.07057
G1 X135.666 Y104.962 E.40243
G1 X142.713 Y97.935 E.33012
G2 X140.558 Y95.402 I-10.89 J7.081 E.11065
G1 X139.106 Y93.95 E.06808
G1 X139.022 Y93.95 E.00281
G1 X132.35 Y100.622 E.31298
G2 X130.538 Y99.834 I-4.843 J8.664 E.06565
G1 X124.654 Y93.95 E.27603
G1 X123.67 Y93.95 E.03265
G1 X111.45 Y106.17 E.57324
G3 X111.46 Y103.784 I48.589 J-.99 E.07914
G1 X120.208 Y112.532 E.41038
G2 X120.215 Y112.757 I2.374 J.043 E.00747
G1 X111.45 Y121.522 E.41116
G1 X111.45 Y119.126 E.07946
G1 X121.289 Y128.965 E.46155
G3 X126.293 Y129.707 I1.69 J5.845 E.17305
G1 X130.316 Y125.684 E.18877
G1 X134.831 Y128.845 E.18283
G1 X130.811 Y132.865 E.1886
G1 X135.325 Y136.026 E.18283
G1 X139.346 Y132.006 E.1886
G3 X143.05 Y135.977 I-6.477 J9.755 E.18181
G1 X138.778 Y140.25 E.20043
G3 X138.95 Y141.864 I-6.208 J1.479 E.054
; WIPE_START
G1 F33600
G1 X138.935 Y141.223 E-.2437
G1 X138.778 Y140.25 E-.37457
G1 X139.042 Y139.986 E-.14173
; WIPE_END
G1 E-.04 F1800
G1 X137.122 Y147.373 Z6.2 F42000
G1 X135.595 Y153.249 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F15476.087
G1 X136.746 Y152.098 E.05401
G1 X142.168 Y157.52 E.25434
G3 X137.92 Y160.948 I-9.213 J-7.067 E.18278
G1 X132.908 Y155.936 E.23514
G1 X132.394 Y156.45 E.02413
G1 X130.254 Y156.45 E.07099
G1 X124.654 Y162.05 E.26268
G1 X123.67 Y162.05 E.03265
G1 X111.45 Y149.83 E.57324
G2 X111.565 Y152.111 I19.073 J.182 E.07579
G1 X117.05 Y146.626 E.25728
G2 X117.062 Y147.766 I14.51 J.411 E.03782
G1 X111.45 Y142.154 E.26326
G1 X111.45 Y144.55 E.07946
G1 X117.05 Y138.95 E.26268
G1 X117.05 Y140.078 E.03739
G1 X111.45 Y134.478 E.26268
G1 X111.45 Y136.874 E.07946
G1 X125.802 Y122.522 E.67325
G3 X121.996 Y118.652 I7.353 J-11.038 E.18133
G1 X111.45 Y129.198 E.49471
G1 X111.45 Y126.802 E.07946
M73 P68 R6
G1 X117.375 Y132.727 E.27795
G2 X117.062 Y134.319 I5.74 J1.955 E.05399
; WIPE_START
G1 F33600
G1 X117.121 Y133.736 E-.22259
G1 X117.375 Y132.727 E-.39552
G1 X117.111 Y132.463 E-.14188
; WIPE_END
G1 E-.04 F1800
G1 X118.65 Y124.987 Z6.2 F42000
G1 X123.489 Y101.475 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F15476.087
G2 X122.518 Y102.778 I9.763 J8.291 E.05396
G1 X111.45 Y113.846 E.51919
G1 X111.45 Y111.45 E.07946
G1 X144.55 Y144.55 E1.55276
G1 X144.55 Y142.154 E.07946
G1 X138.938 Y147.766 E.26326
G2 X138.95 Y146.626 I-14.497 J-.729 E.03782
G1 X144.43 Y152.106 E.25708
G2 X144.55 Y149.83 I-17.614 J-2.064 E.07566
G1 X132.33 Y162.05 E.57324
G1 X131.346 Y162.05 E.03265
G1 X125.746 Y156.45 E.26268
G1 X123.606 Y156.45 E.07099
G1 X123.092 Y155.936 E.02413
G1 X118.08 Y160.948 E.23514
G3 X113.832 Y157.52 I4.966 J-10.496 E.18278
G1 X119.254 Y152.098 E.25434
G1 X120.405 Y153.249 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X119.254 Y152.098 E-.61876
G1 X118.991 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/45
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
G17
G3 Z6.2 I-.751 J.958 P1  F42000
G1 X123.698 Y156.05 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21898
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X122.821 Y129.064 I5.607 J.019 E.28542
G3 X126.204 Y130.064 I.17 J5.642 E.119
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.751 Y156.102 E.28192
G1 X123.741 Y156.092 E.00046
G1 X123.912 Y155.709 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19986
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.841 Y129.455 I5.215 J.012 E.24632
G3 X125.985 Y130.39 I.149 J5.251 E.10249
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.018 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.972 Y155.71 E.24935
M204 S6000
; WIPE_START
G1 F33600
G1 X122.549 Y154.305 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.516 Y146.93 Z6.4 F42000
G1 X132.833 Y115.751 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.714 Y115.545 E.00791
G3 X132.602 Y114.987 I1.289 J-.548 E.01901
G1 X132.602 Y112.845 E.07103
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.872 Y109.98 E.08671
G2 X135.602 Y108.217 I-1.985 J-1.855 E.06467
G2 X135.536 Y106.033 I-15.875 J-.616 E.07253
G2 X128.51 Y99.898 I-7.045 J.977 E.33745
G2 X126.383 Y100.099 I-.385 J7.296 E.07114
G2 X123.31 Y102.231 I1.6 J5.586 E.12634
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.808 Y109.936 I50.169 J13.427 E.15726
G2 X125.496 Y121.883 I11.369 J2.432 E.45099
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.847 J9.765 E.37927
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.904 J.001 E.62036
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I-.004 J-11.902 E.62039
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.907 J-.003 E.31046
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X140.899 Y95.25 E.07731
G3 X143.755 Y99.091 I-8.817 J9.541 E.1597
G3 X144.898 Y104.185 I-10.904 J5.121 E.17457
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.404 J.006 E.22986
G1 X134.013 Y116.398 E.21478
G3 X132.885 Y115.841 I-.01 J-1.401 E.04328
G1 X132.863 Y115.803 E.00147
G1 X132.498 Y115.966 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.447 Y115.887 E.00288
G3 X132.21 Y114.995 I1.556 J-.89 E.02867
G1 X132.21 Y112.834 E.0664
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.584 Y109.712 E.08022
G2 X135.21 Y108.202 I-1.679 J-1.58 E.05134
G2 X135.148 Y106.086 I-15.434 J-.605 E.0651
G2 X128.504 Y100.29 I-6.656 J.923 E.29551
G2 X126.487 Y100.477 I-.381 J6.871 E.06246
G2 X123.621 Y102.47 I1.49 J5.199 E.10921
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.193 Y110.008 I49.813 J13.319 E.14442
G2 X125.724 Y121.564 I10.984 J2.36 E.40408
G1 X140.047 Y131.593 E.53729
G3 X144.965 Y138.865 I-7.044 J10.063 E.27584
G3 X145.29 Y141.665 I-12.324 J2.85 E.08679
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.297 J-.004 E.59326
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I-.001 J-12.291 E.59333
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.485 I12.293 J-.001 E.29675
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X141.176 Y94.973 E.0766
G3 X144.11 Y98.923 I-9.077 J9.807 E.15207
G3 X145.29 Y104.18 I-11.262 J5.289 E.16688
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.792 J.002 E.23142
G1 X134.005 Y116.79 E.19946
G3 X132.568 Y116.073 I-.002 J-1.793 E.05115
G1 X132.531 Y116.016 E.0021
M204 S6000
; WIPE_START
G1 F33600
G1 X132.447 Y115.887 E-.05837
G1 X132.349 Y115.689 E-.08384
G1 X132.275 Y115.476 E-.08565
G1 X132.229 Y115.258 E-.08475
G1 X132.21 Y114.995 E-.1001
G1 X132.21 Y114.081 E-.3473
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z6.4 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z6.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.4 F4000
            G39.3 S1
            G0 Z6.4 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z6.8 F42000
G1 X117.062 Y134.319
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X117.375 Y132.727 I6.053 J.363 E.05399
G1 X111.45 Y126.802 E.27795
G1 X111.45 Y129.198 E.07946
G1 X121.99 Y118.658 E.49443
G2 X125.802 Y122.522 I10.53 J-6.575 E.18152
G1 X111.45 Y136.874 E.67325
G1 X111.45 Y134.478 E.07946
G1 X117.05 Y140.078 E.26268
G1 X117.05 Y138.95 E.03739
G1 X111.45 Y144.55 E.26268
G1 X111.45 Y142.154 E.07946
G1 X117.062 Y147.766 E.26326
G3 X117.05 Y146.626 I14.497 J-.729 E.03782
G1 X111.565 Y152.111 E.25728
G3 X111.45 Y149.83 I18.958 J-2.099 E.07579
G1 X123.67 Y162.05 E.57324
G1 X124.654 Y162.05 E.03265
G1 X130.254 Y156.45 E.26268
G1 X132.394 Y156.45 E.07099
G1 X132.908 Y155.936 E.02413
G1 X137.92 Y160.948 E.23514
G2 X142.168 Y157.52 I-4.966 J-10.496 E.18278
G1 X136.746 Y152.098 E.25434
G1 X135.595 Y153.249 E.05401
; WIPE_START
G1 F33600
G1 X136.746 Y152.098 E-.61876
G1 X137.009 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X138.397 Y144.856 Z6.4 F42000
G1 X138.95 Y141.864 Z6.4
G1 Z6
G1 E.8 F1800
G1 F15476.087
G2 X138.778 Y140.25 I-6.38 J-.135 E.054
G1 X143.05 Y135.977 E.20043
G2 X139.346 Y132.006 I-10.181 J5.784 E.18181
G1 X135.325 Y136.026 E.1886
G1 X130.811 Y132.865 E.18283
G1 X134.831 Y128.845 E.1886
G1 X130.316 Y125.684 E.18283
G1 X126.293 Y129.707 E.18877
G2 X121.289 Y128.965 I-3.314 J5.102 E.17305
G1 X111.45 Y119.126 E.46155
G1 X111.45 Y121.522 E.07946
G1 X120.215 Y112.757 E.41118
G3 X120.208 Y112.532 I2.367 J-.195 E.00748
G1 X111.46 Y103.784 E.41035
G2 X111.45 Y106.17 I48.579 J1.395 E.07914
G1 X123.67 Y93.95 E.57324
G1 X124.654 Y93.95 E.03265
G1 X130.538 Y99.834 E.27603
G3 X132.35 Y100.622 I-3.031 J9.451 E.06565
G1 X139.022 Y93.95 E.31298
G1 X139.106 Y93.95 E.00281
G3 X142.277 Y97.298 I-28.21 J29.891 E.15301
G3 X142.713 Y97.935 I-6.267 J4.761 E.02564
G1 X135.666 Y104.962 E.33012
G1 X144.244 Y113.54 E.40243
G2 X144.55 Y111.45 I-4.806 J-1.77 E.07057
G1 X139.951 Y116.049 E.21575
G1 X139.077 Y116.049 E.02899
G1 X134.189 Y111.161 E.22928
G1 X133.182 Y112.175 E.04741
G2 X132.95 Y112.864 I.964 J.708 E.0245
G2 X132.963 Y115.15 I15.681 J1.055 E.07589
G2 X133.005 Y115.319 I.623 J-.066 E.00578
G1 X144.54 Y103.784 E.54111
G3 X144.55 Y106.17 I-48.584 J1.395 E.07914
G1 X132.33 Y93.95 E.57324
G1 X131.346 Y93.95 E.03265
G1 X125.009 Y100.287 E.29725
G2 X124.005 Y100.977 I3.744 J6.521 E.04048
G1 X116.978 Y93.95 E.32965
G1 X116.894 Y93.95 E.00281
G2 X113.397 Y97.761 I17.673 J19.726 E.17184
M73 P69 R6
G1 X113.287 Y97.935 E.00683
G1 X121.297 Y105.945 E.37577
G2 X120.931 Y107.531 I17.381 J4.852 E.05402
; WIPE_START
G1 F33600
G1 X121.297 Y105.945 E-.61861
G1 X121.034 Y105.682 E-.14139
; WIPE_END
G1 E-.04 F1800
G1 X120.933 Y113.314 Z6.4 F42000
G1 X120.405 Y153.249 Z6.4
G1 Z6
G1 E.8 F1800
G1 F15476.087
G1 X119.254 Y152.098 E.05401
G1 X113.832 Y157.52 E.25434
G2 X118.08 Y160.948 I9.213 J-7.067 E.18278
G1 X123.092 Y155.936 E.23514
G1 X123.606 Y156.45 E.02413
G1 X125.746 Y156.45 E.07099
G1 X131.346 Y162.05 E.26268
G1 X132.33 Y162.05 E.03265
G1 X144.55 Y149.83 E.57324
G3 X144.431 Y152.107 I-17.91 J.208 E.07568
G1 X138.95 Y146.626 E.25711
G3 X138.938 Y147.766 I-14.51 J.411 E.03782
G1 X144.55 Y142.154 E.26326
G1 X144.55 Y144.55 E.07946
G1 X111.45 Y111.45 E1.55276
G1 X111.45 Y113.846 E.07946
G1 X122.518 Y102.778 E.51919
G3 X123.489 Y101.475 I10.736 J6.988 E.05396
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X123.033 Y102.02 E-.27007
G1 X122.518 Y102.778 E-.34845
G1 X122.254 Y103.042 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/45
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
G17
G3 Z6.4 I-1.217 J.033 P1  F42000
G1 X123.695 Y156.046 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21883
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X122.837 Y129.063 I5.608 J.02 E.28594
G3 X126.204 Y130.064 I.153 J5.646 E.11849
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.751 Y156.102 E.28192
G1 X123.737 Y156.089 E.00062
G1 X123.913 Y155.71 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19989
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.857 Y129.454 I5.216 J.012 E.2468
G3 X125.985 Y130.39 I.132 J5.256 E.10201
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.018 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.973 Y155.71 E.24932
M204 S6000
; WIPE_START
G1 F33600
G1 X122.55 Y154.305 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.514 Y146.93 Z6.6 F42000
G1 X132.819 Y115.746 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X132.602 Y114.985 I1.185 J-.75 E.02659
G1 X132.602 Y112.845 E.07098
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.868 Y109.983 E.08654
G2 X135.602 Y108.212 I-1.944 J-1.843 E.06505
G2 X135.536 Y106.033 I-15.845 J-.613 E.07236
G2 X128.51 Y99.898 I-7.047 J.979 E.33743
G2 X126.383 Y100.099 I-.385 J7.296 E.07114
G2 X123.31 Y102.231 I1.6 J5.586 E.12634
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.808 Y109.936 I50.168 J13.426 E.15726
G2 X125.496 Y121.883 I11.385 J2.426 E.45091
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.826 J9.754 E.37932
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.904 J.002 E.62037
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I-.002 J-11.904 E.62037
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.929 J.005 E.31043
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X140.992 Y95.344 E.0817
G3 X144.769 Y102.432 I-8.275 J8.959 E.27149
G3 X144.898 Y104.185 I-13.282 J1.858 E.05835
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.404 J.006 E.22986
G1 X134.015 Y116.398 E.21473
G3 X132.852 Y115.795 I-.011 J-1.402 E.04519
G1 X132.506 Y115.98 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.489 Y115.957 E.00087
G3 X132.21 Y114.995 I1.515 J-.961 E.03121
G1 X132.21 Y112.834 E.06639
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.581 Y109.716 E.08008
G2 X135.21 Y108.198 I-1.647 J-1.571 E.05165
G2 X135.148 Y106.086 I-15.407 J-.603 E.06496
G2 X128.504 Y100.29 I-6.658 J.926 E.29548
G2 X126.487 Y100.477 I-.381 J6.871 E.06246
G2 X123.621 Y102.47 I1.49 J5.199 E.10921
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.193 Y110.008 I49.812 J13.319 E.14442
G2 X125.724 Y121.564 I11 J2.354 E.40401
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.05 J10.07 E.36266
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.296 J-.003 E.59327
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I.003 J-12.296 E.59327
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.485 I12.322 J.011 E.29671
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X141.269 Y95.066 E.08067
G3 X145.231 Y102.973 I-8.529 J9.219 E.27769
G3 X145.29 Y104.18 I-12.255 J1.206 E.03715
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.792 J.002 E.23142
G1 X134.005 Y116.79 E.19944
G3 X132.702 Y116.231 I-.001 J-1.794 E.04478
G1 X132.543 Y116.027 E.00794
M204 S6000
; WIPE_START
G1 F33600
G1 X132.489 Y115.957 E-.03356
G1 X132.344 Y115.678 E-.11976
G1 X132.273 Y115.47 E-.08327
G1 X132.228 Y115.25 E-.08549
G1 X132.21 Y114.995 E-.0971
G1 X132.21 Y114.098 E-.34083
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z6.6 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z6.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.6 F4000
            G39.3 S1
            G0 Z6.6 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z7 F42000
G1 X120.931 Y107.531
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X121.297 Y105.945 I17.747 J3.265 E.05402
G1 X113.287 Y97.935 E.37577
G3 X114.841 Y96.003 I9.971 J6.429 E.08242
G1 X116.894 Y93.95 E.09627
G1 X116.978 Y93.95 E.00281
G1 X124.005 Y100.977 E.32965
G3 X125.003 Y100.293 I7.174 J9.395 E.04014
G1 X131.346 Y93.95 E.29757
G1 X132.33 Y93.95 E.03265
G1 X144.55 Y106.17 E.57324
G2 X144.54 Y103.784 I-48.594 J-.99 E.07914
G1 X133.005 Y115.319 E.5411
G3 X132.95 Y114.973 I1.054 J-.345 E.01166
G1 X132.95 Y112.864 E.06995
G3 X133.182 Y112.175 I1.195 J.019 E.0245
G1 X134.189 Y111.161 E.04741
G1 X139.076 Y116.048 E.22927
G1 X139.951 Y116.049 E.02901
G1 X144.55 Y111.45 E.21574
G3 X144.244 Y113.54 I-5.112 J.32 E.07057
G1 X135.666 Y104.962 E.40243
G1 X142.713 Y97.935 E.33012
G2 X140.744 Y95.588 I-10.462 J6.778 E.10187
G1 X139.106 Y93.95 E.07684
G1 X139.022 Y93.95 E.00281
G1 X132.35 Y100.622 E.31298
G2 X130.538 Y99.834 I-4.843 J8.664 E.06565
G1 X124.654 Y93.95 E.27603
G1 X123.67 Y93.95 E.03265
G1 X111.45 Y106.17 E.57324
G3 X111.46 Y103.784 I48.589 J-.99 E.07914
G1 X120.212 Y112.536 E.41054
G1 X120.211 Y112.761 E.00748
G1 X111.45 Y121.522 E.41099
G1 X111.45 Y119.126 E.07946
G1 X121.289 Y128.965 E.46155
G3 X126.293 Y129.707 I1.69 J5.844 E.17305
G1 X130.316 Y125.684 E.18877
G1 X134.831 Y128.845 E.18283
G1 X130.811 Y132.865 E.1886
G1 X135.325 Y136.026 E.18283
G1 X139.346 Y132.006 E.1886
G3 X143.05 Y135.977 I-6.477 J9.755 E.18181
G1 X138.778 Y140.25 E.20043
G3 X138.95 Y141.864 I-6.208 J1.479 E.054
; WIPE_START
G1 F33600
G1 X138.935 Y141.223 E-.2437
G1 X138.778 Y140.25 E-.37457
G1 X139.042 Y139.986 E-.14173
; WIPE_END
G1 E-.04 F1800
G1 X137.122 Y147.373 Z6.6 F42000
G1 X135.595 Y153.249 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F15476.087
G1 X136.746 Y152.098 E.05401
G1 X142.168 Y157.52 E.25434
G3 X137.92 Y160.948 I-9.213 J-7.067 E.18278
G1 X132.908 Y155.936 E.23514
G1 X132.394 Y156.45 E.02413
G1 X130.254 Y156.45 E.07099
G1 X124.654 Y162.05 E.26268
G1 X123.67 Y162.05 E.03265
G1 X111.45 Y149.83 E.57324
G2 X111.565 Y152.111 I19.073 J.182 E.07579
G1 X117.05 Y146.626 E.25728
G2 X117.062 Y147.766 I14.511 J.411 E.03782
G1 X111.45 Y142.154 E.26326
G1 X111.45 Y144.55 E.07946
G1 X117.05 Y138.95 E.26268
G1 X117.05 Y140.078 E.03739
G1 X111.45 Y134.478 E.26268
G1 X111.45 Y136.874 E.07946
G1 X125.802 Y122.522 E.67325
G3 X121.99 Y118.658 I6.715 J-10.436 E.18152
G1 X111.45 Y129.198 E.49444
M73 P70 R6
G1 X111.45 Y126.802 E.07946
G1 X117.375 Y132.727 E.27795
G2 X117.062 Y134.319 I5.74 J1.955 E.05399
; WIPE_START
G1 F33600
G1 X117.121 Y133.736 E-.22259
G1 X117.375 Y132.727 E-.39553
G1 X117.111 Y132.463 E-.14188
; WIPE_END
G1 E-.04 F1800
G1 X118.65 Y124.987 Z6.6 F42000
G1 X123.489 Y101.475 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F15476.087
G2 X122.518 Y102.778 I9.764 J8.291 E.05396
G1 X111.45 Y113.846 E.51919
G1 X111.45 Y111.45 E.07946
G1 X144.55 Y144.55 E1.55276
G1 X144.55 Y142.154 E.07946
G1 X138.938 Y147.766 E.26326
G2 X138.95 Y146.626 I-14.497 J-.729 E.03782
G1 X144.435 Y152.111 E.25728
G2 X144.55 Y149.83 I-18.959 J-2.099 E.07579
G1 X132.33 Y162.05 E.57324
G1 X131.346 Y162.05 E.03265
G1 X125.746 Y156.45 E.26268
G1 X123.606 Y156.45 E.07099
G1 X123.092 Y155.936 E.02413
G1 X118.08 Y160.948 E.23514
G3 X113.832 Y157.52 I4.966 J-10.496 E.18278
G1 X119.254 Y152.098 E.25434
G1 X120.405 Y153.249 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X119.254 Y152.098 E-.61876
G1 X118.991 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/45
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
G17
G3 Z6.6 I-.75 J.958 P1  F42000
G1 X123.691 Y156.043 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21866
G3 X117.398 Y147.441 I3.981 J-3.958 E.14515
G1 X117.398 Y134.648 E.42435
G3 X122.852 Y129.062 I5.608 J.02 E.28646
G3 X126.204 Y130.064 I.135 J5.651 E.11797
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.751 Y156.102 E.28192
G1 X123.734 Y156.085 E.00079
G1 X123.913 Y155.71 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19989
G3 X117.79 Y147.433 I3.699 J-3.686 E.12546
G1 X117.79 Y134.656 E.3926
G3 X122.872 Y129.454 I5.216 J.012 E.24728
G3 X125.985 Y130.39 I.114 J5.261 E.10154
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.018 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.973 Y155.71 E.24932
M204 S6000
; WIPE_START
G1 F33600
G1 X122.55 Y154.305 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.515 Y146.93 Z6.8 F42000
G1 X132.826 Y115.742 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.704 Y115.52 E.00842
G3 X132.602 Y114.984 I1.301 J-.525 E.01821
G1 X132.602 Y112.845 E.07095
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.865 Y109.987 E.08637
G2 X135.602 Y108.206 I-1.938 J-1.846 E.06539
G2 X135.536 Y106.033 I-15.814 J-.61 E.07219
G2 X128.51 Y99.898 I-7.043 J.975 E.33747
G2 X126.383 Y100.099 I-.385 J7.296 E.07114
G2 X123.31 Y102.231 I1.6 J5.586 E.12634
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.808 Y109.936 I50.168 J13.426 E.15726
G2 X125.496 Y121.883 I11.367 J2.433 E.451
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.86 J9.772 E.37923
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.903 J.003 E.62038
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I-.002 J-11.904 E.62037
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.923 J.003 E.31043
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X141.086 Y95.437 E.08609
G3 X144.898 Y104.185 I-8.182 J8.77 E.32555
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.404 J.006 E.22986
G1 X134.016 Y116.398 E.2147
G3 X132.87 Y115.819 I-.011 J-1.403 E.04425
G1 X132.856 Y115.794 E.00094
G1 X132.488 Y115.951 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.435 Y115.865 E.0031
G3 X132.21 Y114.994 I1.57 J-.87 E.02793
G1 X132.21 Y112.834 E.06637
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.578 Y109.719 E.07994
G2 X135.21 Y108.193 I-1.641 J-1.573 E.05192
G2 X135.148 Y106.086 I-15.381 J-.6 E.06482
G2 X128.504 Y100.29 I-6.653 J.921 E.29553
G2 X126.487 Y100.477 I-.381 J6.87 E.06246
G2 X123.621 Y102.47 I1.49 J5.199 E.10921
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.193 Y110.008 I49.813 J13.319 E.14442
G2 X125.724 Y121.564 I10.997 J2.355 E.40402
G1 X140.047 Y131.593 E.53729
G3 X144.955 Y138.818 I-7.083 J10.09 E.27432
G3 X145.29 Y141.665 I-12.364 J2.9 E.08826
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.295 J-.002 E.59329
M73 P70 R5
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I.007 J-12.299 E.59323
G1 X110.71 Y104.18 E1.4232
G3 X111.1 Y101.114 I12.233 J-.003 E.09524
G3 X114.311 Y95.486 I12.021 J3.129 E.20144
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X141.363 Y95.16 E.08473
G3 X145.29 Y104.18 I-8.458 J9.047 E.31087
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.792 J.002 E.23142
G1 X134.006 Y116.79 E.19943
G3 X132.553 Y116.05 I-.001 J-1.795 E.052
G1 X132.521 Y116.001 E.00181
M204 S6000
; WIPE_START
G1 F33600
G1 X132.435 Y115.865 E-.0611
G1 X132.34 Y115.667 E-.08347
G1 X132.271 Y115.461 E-.08263
G1 X132.227 Y115.241 E-.08504
G1 X132.21 Y114.994 E-.09405
G1 X132.21 Y114.064 E-.35371
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z6.8 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z6.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.8 F4000
            G39.3 S1
            G0 Z6.8 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z7.2 F42000
G1 X117.062 Y134.319
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X117.375 Y132.727 I6.053 J.363 E.05399
G1 X111.45 Y126.802 E.27795
G1 X111.45 Y129.198 E.07946
G1 X121.99 Y118.658 E.49444
G2 X125.802 Y122.522 I10.524 J-6.568 E.18152
G1 X111.45 Y136.874 E.67325
G1 X111.45 Y134.478 E.07946
G1 X117.05 Y140.078 E.26268
G1 X117.05 Y138.95 E.03739
G1 X111.45 Y144.55 E.26268
G1 X111.45 Y142.154 E.07946
G1 X117.062 Y147.766 E.26326
G3 X117.05 Y146.626 I14.497 J-.729 E.03782
G1 X111.565 Y152.111 E.25728
G3 X111.45 Y149.83 I18.958 J-2.099 E.07579
G1 X123.67 Y162.05 E.57324
G1 X124.654 Y162.05 E.03265
G1 X130.254 Y156.45 E.26268
G1 X132.394 Y156.45 E.07099
G1 X132.908 Y155.936 E.02413
G1 X137.92 Y160.948 E.23514
G2 X142.168 Y157.52 I-4.965 J-10.495 E.18278
G1 X136.746 Y152.098 E.25434
G1 X135.595 Y153.249 E.05401
; WIPE_START
G1 F33600
G1 X136.746 Y152.098 E-.61876
G1 X137.009 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X138.397 Y144.856 Z6.8 F42000
G1 X138.95 Y141.864 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F15476.087
G2 X138.778 Y140.25 I-6.38 J-.135 E.054
G1 X143.05 Y135.977 E.20043
G2 X139.346 Y132.006 I-10.181 J5.784 E.18181
G1 X135.325 Y136.026 E.1886
G1 X130.811 Y132.865 E.18283
G1 X134.831 Y128.845 E.1886
G1 X130.316 Y125.684 E.18283
G1 X126.293 Y129.707 E.18877
G2 X121.289 Y128.965 I-3.314 J5.102 E.17305
G1 X111.45 Y119.126 E.46155
G1 X111.45 Y121.522 E.07946
G1 X120.211 Y112.761 E.41099
G1 X120.212 Y112.536 E.00748
G1 X111.46 Y103.784 E.41054
G2 X111.45 Y106.17 I48.579 J1.395 E.07914
G1 X123.67 Y93.95 E.57324
G1 X124.654 Y93.95 E.03265
G1 X130.538 Y99.834 E.27603
G3 X132.35 Y100.622 I-3.031 J9.451 E.06565
G1 X139.022 Y93.95 E.31298
G1 X139.106 Y93.95 E.00281
G3 X142.277 Y97.298 I-25.042 J26.891 E.15303
G3 X142.713 Y97.935 I-6.268 J4.761 E.02563
G1 X135.666 Y104.962 E.33012
G1 X144.244 Y113.54 E.40243
G2 X144.55 Y111.45 I-4.806 J-1.77 E.07057
G1 X139.951 Y116.049 E.21574
G1 X139.076 Y116.048 E.02902
G1 X134.189 Y111.161 E.22925
G1 X133.182 Y112.175 E.04741
G2 X132.95 Y112.864 I.964 J.708 E.0245
G2 X132.961 Y115.138 I17.132 J1.054 E.07548
G2 X133.006 Y115.318 I.575 J-.048 E.00617
G1 X144.54 Y103.784 E.54106
G3 X144.55 Y106.17 I-48.584 J1.395 E.07914
G1 X132.33 Y93.95 E.57324
G1 X131.346 Y93.95 E.03265
G1 X125.009 Y100.287 E.29725
G2 X124.005 Y100.977 I3.744 J6.52 E.04048
G1 X116.978 Y93.95 E.32965
G1 X116.894 Y93.95 E.00281
G2 X113.397 Y97.761 I17.673 J19.725 E.17184
G1 X113.287 Y97.935 E.00683
G1 X121.297 Y105.945 E.37577
M73 P71 R5
G2 X120.931 Y107.531 I17.38 J4.852 E.05402
; WIPE_START
G1 F33600
G1 X121.297 Y105.945 E-.61861
G1 X121.034 Y105.682 E-.14139
; WIPE_END
G1 E-.04 F1800
G1 X120.933 Y113.314 Z6.8 F42000
G1 X120.405 Y153.249 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F15476.087
G1 X119.254 Y152.098 E.05401
G1 X113.832 Y157.52 E.25434
G2 X118.08 Y160.948 I9.213 J-7.067 E.18278
G1 X123.092 Y155.936 E.23514
G1 X123.606 Y156.45 E.02413
G1 X125.746 Y156.45 E.07099
G1 X131.346 Y162.05 E.26268
G1 X132.33 Y162.05 E.03265
G1 X144.55 Y149.83 E.57324
G3 X144.435 Y152.111 I-19.074 J.182 E.07579
G1 X138.95 Y146.626 E.25728
G3 X138.938 Y147.766 I-14.51 J.411 E.03782
G1 X144.55 Y142.154 E.26326
G1 X144.55 Y144.55 E.07946
G1 X111.45 Y111.45 E1.55276
G1 X111.45 Y113.846 E.07946
G1 X122.518 Y102.778 E.51919
G3 X123.489 Y101.475 I10.735 J6.988 E.05396
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X123.033 Y102.02 E-.27008
G1 X122.518 Y102.778 E-.34845
G1 X122.254 Y103.042 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/45
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
G17
G3 Z6.8 I-1.217 J.033 P1  F42000
G1 X123.688 Y156.039 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21848
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X122.868 Y129.061 I5.609 J.02 E.28698
G3 X126.204 Y130.064 I.118 J5.657 E.11746
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.751 Y156.102 E.28192
G1 X123.73 Y156.081 E.00097
G1 X123.913 Y155.71 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19989
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.888 Y129.453 I5.217 J.012 E.24777
G3 X125.985 Y130.39 I.096 J5.267 E.10106
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.018 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.973 Y155.71 E.24932
M204 S6000
; WIPE_START
G1 F33600
G1 X122.55 Y154.305 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.513 Y146.929 Z7 F42000
G1 X132.818 Y115.737 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.704 Y115.517 E.00821
G3 X132.602 Y114.98 I1.305 J-.526 E.01826
G1 X132.602 Y112.845 E.07081
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.861 Y109.99 E.0862
G2 X135.602 Y108.201 I-1.93 J-1.847 E.06573
G2 X135.536 Y106.033 I-15.783 J-.607 E.07202
G2 X128.51 Y99.898 I-7.041 J.973 E.33749
G2 X126.383 Y100.099 I-.385 J7.295 E.07114
G2 X123.31 Y102.231 I1.6 J5.586 E.12634
G2 X121.823 Y105.307 I7.34 J5.446 E.11399
G2 X120.875 Y109.572 I43.84 J11.977 E.14498
G2 X120.813 Y114.824 I12.049 J2.77 E.17557
G2 X125.496 Y121.883 I11.364 J-2.456 E.28763
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.826 J9.754 E.37932
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.905 J0 E.62035
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I-.003 J-11.902 E.62039
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.944 J.012 E.31041
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X141.408 Y95.759 E.1012
G3 X144.898 Y104.185 I-8.454 J8.437 E.31041
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.407 J.003 E.22981
G1 X134.017 Y116.398 E.21467
G3 X132.849 Y115.788 I-.008 J-1.407 E.04547
G1 X132.472 Y115.918 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.339 Y115.659 E.00896
G3 X132.21 Y114.993 I1.671 J-.669 E.02096
G1 X132.21 Y112.834 E.06633
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.575 Y109.722 E.0798
G2 X135.21 Y108.189 I-1.634 J-1.575 E.0522
G2 X135.148 Y106.086 I-15.354 J-.597 E.06468
G2 X128.504 Y100.29 I-6.652 J.919 E.29555
G2 X126.487 Y100.477 I-.381 J6.87 E.06246
G2 X123.621 Y102.47 I1.49 J5.199 E.10921
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.26 Y109.644 I43.495 J11.873 E.13307
G2 X121.119 Y114.349 I11.749 J2.708 E.14556
G2 X125.724 Y121.564 I11.117 J-2.018 E.26973
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.05 J10.07 E.36266
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.299 J-.007 E.59323
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I.002 J-12.294 E.59329
G1 X110.71 Y104.18 E1.4232
G3 X114.312 Y95.485 I12.336 J.016 E.29669
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X141.688 Y95.485 E.09888
G3 X144.776 Y100.664 I-8.777 J8.742 E.18714
G3 X145.29 Y104.18 I-11.748 J3.514 E.10957
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.799 J-.005 E.23133
G1 X134.006 Y116.79 E.19942
G3 X132.51 Y115.985 I.004 J-1.8 E.05436
G1 X132.502 Y115.97 E.00052
M204 S6000
; WIPE_START
G1 F33600
G1 X132.339 Y115.659 E-.13353
G1 X132.268 Y115.45 E-.08367
G1 X132.226 Y115.236 E-.08295
G1 X132.21 Y114.993 E-.0925
G1 X132.21 Y114.026 E-.36735
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z7 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z7
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7 F4000
            G39.3 S1
            G0 Z7 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z7.4 F42000
G1 X120.931 Y107.529
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X121.294 Y105.942 I17.874 J3.254 E.05402
G1 X113.287 Y97.935 E.37561
G3 X114.841 Y96.003 I9.972 J6.43 E.08242
G1 X116.894 Y93.95 E.09627
G1 X116.978 Y93.95 E.00281
G1 X124.005 Y100.977 E.32965
G3 X125.003 Y100.293 I7.196 J9.427 E.04014
G1 X131.346 Y93.95 E.29757
G1 X132.33 Y93.95 E.03265
G1 X144.55 Y106.17 E.57324
G2 X144.54 Y103.784 I-48.594 J-.99 E.07914
G1 X133.007 Y115.317 E.541
G3 X132.95 Y114.968 I.924 J-.33 E.01178
G1 X132.95 Y112.864 E.06979
G3 X133.182 Y112.175 I1.195 J.019 E.0245
G1 X134.189 Y111.161 E.04741
G1 X139.076 Y116.048 E.22924
G1 X139.951 Y116.049 E.02904
G1 X144.55 Y111.45 E.21573
G3 X144.243 Y113.539 I-5.083 J.321 E.07055
G1 X135.666 Y104.962 E.40239
G1 X142.713 Y97.935 E.33012
G2 X141.159 Y96.003 I-9.972 J6.43 E.08242
G1 X139.106 Y93.95 E.09627
G1 X139.022 Y93.95 E.00281
G1 X132.35 Y100.622 E.31298
G2 X130.538 Y99.834 I-4.747 J8.441 E.06566
G1 X124.654 Y93.95 E.27603
G1 X123.67 Y93.95 E.03265
G1 X111.45 Y106.17 E.57324
G3 X111.46 Y103.784 I48.589 J-.99 E.07914
G1 X120.212 Y112.536 E.41054
G1 X120.211 Y112.761 E.00748
G1 X111.45 Y121.522 E.41099
G1 X111.45 Y119.126 E.07946
G1 X121.289 Y128.965 E.46155
G3 X126.293 Y129.707 I1.69 J5.844 E.17305
G1 X130.316 Y125.684 E.18877
G1 X134.831 Y128.845 E.18283
G1 X130.811 Y132.865 E.1886
G1 X135.325 Y136.026 E.18283
G1 X139.346 Y132.006 E.1886
G3 X143.05 Y135.977 I-6.477 J9.755 E.18181
G1 X138.778 Y140.25 E.20043
G3 X138.95 Y141.864 I-6.208 J1.479 E.054
; WIPE_START
G1 F33600
G1 X138.935 Y141.223 E-.2437
G1 X138.778 Y140.25 E-.37457
G1 X139.042 Y139.986 E-.14173
; WIPE_END
G1 E-.04 F1800
G1 X137.122 Y147.373 Z7 F42000
G1 X135.595 Y153.249 Z7
G1 Z6.6
G1 E.8 F1800
G1 F15476.087
G1 X136.746 Y152.098 E.05401
G1 X142.168 Y157.52 E.25434
G3 X137.92 Y160.948 I-9.213 J-7.067 E.18278
G1 X132.908 Y155.936 E.23514
G1 X132.394 Y156.45 E.02413
G1 X130.254 Y156.45 E.07099
M73 P72 R5
G1 X124.654 Y162.05 E.26268
G1 X123.67 Y162.05 E.03265
G1 X111.45 Y149.83 E.57324
G2 X111.565 Y152.111 I19.073 J.182 E.07579
G1 X117.05 Y146.626 E.25728
G2 X117.062 Y147.766 I14.51 J.411 E.03782
G1 X111.45 Y142.154 E.26326
G1 X111.45 Y144.55 E.07946
G1 X117.05 Y138.95 E.26268
G1 X117.05 Y140.078 E.03739
G1 X111.45 Y134.478 E.26268
G1 X111.45 Y136.874 E.07946
G1 X125.802 Y122.522 E.67325
G3 X121.991 Y118.658 I6.704 J-10.422 E.18152
G1 X111.45 Y129.198 E.49446
G1 X111.45 Y126.802 E.07946
G1 X117.375 Y132.727 E.27795
G2 X117.062 Y134.319 I5.74 J1.955 E.05399
; WIPE_START
G1 F33600
G1 X117.121 Y133.736 E-.22259
G1 X117.375 Y132.727 E-.39552
G1 X117.111 Y132.463 E-.14188
; WIPE_END
G1 E-.04 F1800
G1 X118.65 Y124.987 Z7 F42000
G1 X123.489 Y101.475 Z7
G1 Z6.6
G1 E.8 F1800
G1 F15476.087
G2 X122.518 Y102.778 I9.764 J8.292 E.05396
G1 X111.45 Y113.846 E.51919
G1 X111.45 Y111.45 E.07946
G1 X144.55 Y144.55 E1.55276
G1 X144.55 Y142.154 E.07946
G1 X138.938 Y147.766 E.26326
G2 X138.95 Y146.626 I-14.497 J-.729 E.03782
G1 X144.435 Y152.111 E.25728
G2 X144.55 Y149.83 I-18.959 J-2.099 E.07579
G1 X132.33 Y162.05 E.57324
G1 X131.346 Y162.05 E.03265
G1 X125.746 Y156.45 E.26268
G1 X123.606 Y156.45 E.07099
G1 X123.092 Y155.936 E.02413
G1 X118.08 Y160.948 E.23514
G3 X113.832 Y157.52 I4.966 J-10.496 E.18278
G1 X119.254 Y152.098 E.25434
G1 X120.405 Y153.249 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X119.254 Y152.098 E-.61876
G1 X118.991 Y152.361 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/45
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
G17
G3 Z7 I-.75 J.958 P1  F42000
G1 X123.684 Y156.035 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.21829
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X122.494 Y129.08 I5.614 J.022 E.2746
G3 X126.204 Y130.064 I.488 J5.645 E.12987
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.609 J-.015 E.14516
G1 X132.249 Y156.102 E.22144
G1 X123.751 Y156.102 E.28192
G1 X123.726 Y156.077 E.00115
G1 X123.913 Y155.71 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19989
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.53 Y129.471 I5.221 J.014 E.23676
G3 X125.985 Y130.39 I.453 J5.251 E.11208
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.018 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.22 J-.008 E.12547
G1 X132.087 Y155.71 E.19989
G1 X123.973 Y155.71 E.24932
M204 S6000
; WIPE_START
G1 F33600
G1 X122.55 Y154.305 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.513 Y146.929 Z7.2 F42000
G1 X132.817 Y115.726 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.7 Y115.508 E.0082
G3 X132.602 Y114.981 I1.307 J-.516 E.01792
G1 X132.602 Y112.845 E.07083
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.857 Y109.994 E.08603
G2 X135.602 Y108.196 I-1.877 J-1.831 E.06613
G2 X135.536 Y106.033 I-15.752 J-.604 E.07185
G2 X128.51 Y99.898 I-7.047 J.979 E.33743
G2 X126.383 Y100.099 I-.385 J7.295 E.07114
G2 X123.31 Y102.231 I1.594 J5.578 E.12635
G2 X121.823 Y105.307 I7.34 J5.446 E.11399
G2 X120.875 Y109.572 I43.839 J11.977 E.14498
G2 X120.813 Y114.824 I12.049 J2.77 E.17557
G2 X125.496 Y121.883 I11.365 J-2.456 E.28763
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.829 J9.756 E.37931
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.902 J.004 E.62039
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I-.004 J-11.902 E.62039
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.912 J-.002 E.31045
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X141.273 Y95.624 E.09486
G3 X144.898 Y104.185 I-8.328 J8.574 E.31675
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.404 J.006 E.22986
G1 X134.017 Y116.398 E.21465
G3 X132.86 Y115.804 I-.01 J-1.405 E.04487
G1 X132.846 Y115.779 E.00096
G1 X132.476 Y115.931 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.43 Y115.838 E.00318
G3 X132.21 Y114.993 I1.599 J-.867 E.02709
G1 X132.21 Y112.834 E.06634
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.572 Y109.725 E.07966
G2 X135.21 Y108.184 I-1.731 J-1.62 E.05237
G2 X135.148 Y106.086 I-15.327 J-.595 E.06454
G2 X128.504 Y100.29 I-6.658 J.926 E.29548
G2 X126.487 Y100.477 I-.381 J6.87 E.06246
G2 X123.621 Y102.47 I1.485 J5.192 E.10922
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.26 Y109.644 I43.495 J11.873 E.13307
G2 X121.119 Y114.349 I11.748 J2.708 E.14556
G2 X125.724 Y121.564 I11.117 J-2.018 E.26973
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.056 J10.074 E.36264
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.293 J0 E.59332
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I-.001 J-12.291 E.59333
G1 X110.71 Y104.18 E1.4232
G3 X114.312 Y95.485 I12.303 J.003 E.29674
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X141.55 Y95.347 E.09286
G3 X145.29 Y104.18 I-8.605 J8.852 E.30272
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.794 J0 E.2314
G1 X134.006 Y116.79 E.19941
G3 X132.546 Y116.025 I.023 J-1.819 E.05255
G1 X132.512 Y115.979 E.00178
M204 S6000
; WIPE_START
G1 F33600
G1 X132.43 Y115.838 E-.06186
G1 X132.333 Y115.65 E-.08063
G1 X132.266 Y115.441 E-.08308
G1 X132.225 Y115.228 E-.08262
G1 X132.21 Y114.993 E-.08931
G1 X132.21 Y114.039 E-.3625
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z7.2 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z7.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.2 F4000
            G39.3 S1
            G0 Z7.2 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z7.6 F42000
G1 X125.288 Y122.174
G1 Z6.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G3 X124.449 Y121.523 I23.712 J-31.405 E.0294
G3 X123.662 Y120.803 I7.977 J-9.511 E.02958
G3 X121.451 Y117.71 I9.152 J-8.877 E.10574
G3 X120.47 Y114.904 I11.29 J-5.523 E.08254
G1 X120.265 Y113.643 E.03538
G3 X120.285 Y110.945 I13.169 J-1.255 E.07489
G3 X121.478 Y105.209 I54.955 J8.445 E.1624
G3 X122.004 Y103.75 I14.277 J4.32 E.04299
G1 X122.458 Y102.861 E.02765
G1 X123.022 Y102.023 E.02798
G3 X126.296 Y99.76 I4.944 J3.652 E.11229
G1 X127.078 Y99.595 E.02213
G3 X127.865 Y99.54 I1.195 J11.319 E.02187
G1 X129.001 Y99.556 E.03149
G1 X130.007 Y99.696 E.02813
G1 X130.936 Y99.951 E.02669
G3 X133.584 Y101.541 I-2.66 J7.43 E.08613
G3 X135.314 Y103.968 I-5.632 J5.844 E.08306
G3 X135.804 Y105.525 I-7.41 J3.19 E.04529
G1 X135.944 Y106.508 E.02751
G1 X135.96 Y108.188 E.04656
G1 X135.885 Y108.794 E.01691
G1 X135.642 Y109.49 E.02044
G1 X135.3 Y110.022 E.01752
G1 X135.104 Y110.254 E.00841
G1 X133.286 Y112.079 E.07137
G1 X133.027 Y112.482 E.01328
G1 X132.96 Y112.864 E.01074
G1 X132.973 Y115.122 E.06256
G1 X133.096 Y115.503 E.0111
G1 X133.256 Y115.716 E.00739
G1 X133.654 Y115.971 E.01309
G1 X134.038 Y116.04 E.0108
G1 X140.478 Y116.04 E.17844
G1 X141.13 Y115.989 E.01812
G1 X141.748 Y115.84 E.0176
G1 X142.302 Y115.612 E.01661
G1 X142.849 Y115.284 E.01767
G1 X143.344 Y114.866 E.01794
G1 X143.766 Y114.375 E.01795
G1 X144.098 Y113.833 E.0176
G1 X144.329 Y113.28 E.01661
G1 X144.483 Y112.661 E.01767
G2 X144.54 Y111.978 I-10.542 J-1.222 E.01898
G1 X144.54 Y104.188 E.21584
G2 X141.013 Y95.879 I-11.546 J-.002 E.25693
G1 X139.172 Y94.03 E.07231
G2 X139.004 Y93.96 I-.158 J.144 E.00519
G1 X116.996 Y93.96 E.60976
G2 X116.828 Y94.03 I-.01 J.213 E.00519
G1 X114.847 Y96.011 E.07762
G2 X111.46 Y104.189 I8.211 J8.191 E.25165
G1 X111.46 Y150.49 E1.28278
G2 X123.012 Y162.04 I11.556 J-.006 E.50263
G1 X132.99 Y162.04 E.27645
G2 X144.54 Y150.488 I.001 J-11.549 E.50271
M73 P73 R5
G1 X144.54 Y141.674 E.24421
G2 X139.61 Y132.203 I-11.593 J.016 E.30743
G1 X125.337 Y122.209 E.48274
G1 X126.41 Y129.772 F42000
G1 F15000
G1 X125.626 Y129.319 E.02508
G1 X124.767 Y128.97 E.02567
G1 X123.863 Y128.765 E.0257
G1 X122.912 Y128.701 E.0264
G1 X122.014 Y128.794 E.02501
G1 X121.115 Y129.015 E.02565
G1 X120.263 Y129.378 E.02567
G1 X119.805 Y129.639 E.01459
G1 X119.085 Y130.178 E.02493
G1 X118.453 Y130.82 E.02495
G1 X117.926 Y131.55 E.02495
G1 X117.682 Y131.988 E.01389
G1 X117.341 Y132.825 E.02504
G1 X117.201 Y133.325 E.01437
G2 X117.04 Y134.644 I9.076 J1.777 E.03686
G1 X117.04 Y147.44 E.3545
G1 X117.12 Y148.349 E.02528
G1 X117.339 Y149.257 E.02587
G1 X117.53 Y149.774 E.01527
G2 X118.172 Y150.922 I6.312 J-2.773 E.0365
G2 X118.777 Y151.635 I12.887 J-10.33 E.02592
G1 X123.557 Y156.415 E.18728
G1 X123.666 Y156.46 E.00328
G1 X132.334 Y156.46 E.24014
G1 X132.443 Y156.415 E.00328
G1 X137.223 Y151.635 E.18728
G1 X137.811 Y150.947 E.02507
G1 X138.286 Y150.178 E.02504
G1 X138.642 Y149.342 E.02517
G1 X138.883 Y148.373 E.02768
G2 X138.96 Y147.44 I-15.454 J-1.745 E.02594
G1 X138.96 Y141.652 E.16036
G1 X138.889 Y140.797 E.02377
G1 X138.698 Y139.94 E.02433
G1 X138.382 Y139.12 E.02433
G1 X137.947 Y138.357 E.02433
G1 X137.409 Y137.664 E.02432
G1 X136.773 Y137.058 E.02433
G1 X136.428 Y136.786 E.01218
G1 X126.459 Y129.806 E.33717
; WIPE_START
G1 F33600
G1 X128.097 Y130.953 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.728 Y132.941 Z7.2 F42000
G1 X116.717 Y134.022 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X117.091 Y132.443 I5.738 J.528 E.05402
G1 X111.818 Y127.17 E.24737
G1 X111.818 Y128.83 E.05505
G1 X121.729 Y118.92 E.46491
G2 X125.538 Y122.786 I10.465 J-6.498 E.18154
G1 X111.818 Y136.506 E.6436
G1 X111.818 Y134.846 E.05505
G1 X116.682 Y139.71 E.22816
G1 X116.682 Y139.318 E.01299
G1 X111.818 Y144.182 E.22816
G1 X111.818 Y142.522 E.05506
G1 X116.682 Y147.386 E.22816
G1 X116.682 Y146.994 E.01299
G1 X111.895 Y151.781 E.22457
G3 X111.818 Y150.198 I23.529 J-1.932 E.05259
G1 X123.302 Y161.682 E.53872
G1 X125.022 Y161.682 E.05706
G1 X129.886 Y156.818 E.22816
G1 X132.457 Y156.818 E.08531
G1 X132.609 Y156.756 E.00543
G1 X133.168 Y156.196 E.02625
G1 X137.64 Y160.668 E.2098
G2 X141.906 Y157.258 I-4.629 J-10.162 E.18302
G1 X137.006 Y152.358 E.22985
G2 X138.102 Y151.156 I-6.848 J-7.345 E.05401
G1 X139.315 Y141.555 F42000
G1 F15476.087
G2 X139.079 Y139.949 I-6.273 J.1 E.05401
G1 X142.777 Y136.251 E.17346
G2 X139.082 Y132.27 I-9.88 J5.465 E.18196
G1 X135.59 Y135.762 E.16382
; WIPE_START
G1 F33600
G1 X137.004 Y134.348 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.273 Y139.389 Z7.2 F42000
G1 X117.898 Y151.156 Z7.2
G1 Z6.8
G1 E.8 F1800
G1 F15476.087
G2 X118.994 Y152.358 I7.945 J-6.144 E.05401
G1 X114.101 Y157.251 E.22954
G2 X118.36 Y160.668 I8.983 J-6.832 E.18294
G1 X122.832 Y156.196 E.2098
G1 X123.391 Y156.756 E.02625
G1 X123.543 Y156.818 E.00543
G1 X126.114 Y156.818 E.08531
G1 X130.978 Y161.682 E.22816
G1 X132.698 Y161.682 E.05706
G1 X144.182 Y150.198 E.53872
G3 X144.102 Y151.777 I-20.191 J-.234 E.05247
G1 X139.318 Y146.994 E.22439
G1 X139.318 Y147.386 E.01299
G1 X144.182 Y142.522 E.22816
G1 X144.182 Y144.182 E.05506
G1 X138.408 Y138.408 E.27084
G2 X136.166 Y136.166 I-5.728 J3.486 E.10622
G1 X111.818 Y111.818 E1.14219
G1 X111.818 Y113.478 E.05505
G1 X121.667 Y103.629 E.46202
G1 X121.712 Y103.522 E.00386
G3 X122.448 Y102.203 I9.321 J4.341 E.05014
G1 X120.616 Y107.223 F42000
G1 F15476.087
G3 X120.991 Y105.639 I19.725 J3.834 E.05402
G1 X113.557 Y98.205 E.34875
G3 X115.103 Y96.261 I11.058 J7.211 E.0825
G1 X117.046 Y94.318 E.09115
G1 X117.346 Y94.318 E.00995
G1 X123.747 Y100.719 E.30028
G3 X125.742 Y99.554 I4.002 J4.561 E.07712
G1 X130.978 Y94.318 E.24561
G1 X132.698 Y94.318 E.05706
G1 X144.182 Y105.802 E.53873
G2 X144.181 Y104.143 I-33.295 J-.805 E.05502
G1 X133.328 Y114.996 E.50912
G3 X133.324 Y112.757 I17.384 J-1.147 E.07431
G3 X133.546 Y112.318 I.811 J.134 E.01659
G1 X134.446 Y111.418 E.04221
G1 X138.71 Y115.682 E.20001
G1 X140.318 Y115.682 E.05336
G1 X144.182 Y111.818 E.18125
G3 X143.955 Y113.251 I-4.335 J.048 E.04835
G1 X136.164 Y105.455 E.3656
G2 X135.963 Y104.685 I-11.331 J2.544 E.02642
G1 X142.446 Y98.202 E.30414
G2 X141.293 Y96.678 I-13.256 J8.834 E.06342
G2 X138.954 Y94.318 I-247.961 J243.461 E.11023
G1 X138.654 Y94.318 E.00995
G1 X132.604 Y100.345 E.28328
G2 X130.046 Y99.342 I-4.133 J6.775 E.0916
G1 X125.022 Y94.318 E.23568
G1 X123.302 Y94.318 E.05706
G1 X111.818 Y105.802 E.53873
G3 X111.819 Y104.143 I33.258 J-.806 E.05502
G1 X119.842 Y112.166 E.37636
G2 X119.863 Y113.109 I8.064 J.291 E.0313
G1 X111.818 Y121.154 E.37741
G1 X111.818 Y119.494 E.05505
G1 X121.015 Y128.662 E.43075
G3 X126.559 Y129.441 I1.978 J6.034 E.19231
G1 X130.052 Y125.948 E.1639
G1 X134.567 Y129.109 E.18283
G1 X131.075 Y132.601 E.16382
G1 X129.741 Y131.667 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X131.075 Y132.601 E-.61876
G1 X131.338 Y132.338 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/45
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
G17
G3 Z7.2 I-1.158 J-.374 P1  F42000
G1 X123.679 Y156.031 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X119.03 Y151.382 E.2181
G3 X117.398 Y147.441 I3.964 J-3.951 E.14518
G1 X117.398 Y134.648 E.42435
G3 X122.494 Y129.08 I5.614 J.022 E.2746
G3 X126.204 Y130.064 I.488 J5.645 E.12987
G1 X136.222 Y137.08 E.40571
G3 X138.602 Y141.651 I-3.25 J4.597 E.17758
G1 X138.602 Y147.441 E.19205
G3 X136.97 Y151.382 I-5.596 J-.009 E.14518
G1 X132.249 Y156.102 E.22144
G1 X123.751 Y156.102 E.28192
G1 X123.722 Y156.073 E.00135
G1 X123.913 Y155.71 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.313 Y151.11 E.19989
G3 X117.79 Y147.433 I3.685 J-3.68 E.12548
G1 X117.79 Y134.656 E.3926
G3 X122.53 Y129.471 I5.221 J.014 E.23676
G3 X125.985 Y130.39 I.453 J5.251 E.11208
G1 X135.992 Y137.397 E.37535
G3 X138.21 Y141.658 I-3.018 J4.28 E.15337
G1 X138.21 Y147.433 E.17744
G3 X136.687 Y151.11 I-5.208 J-.003 E.12548
G1 X132.087 Y155.71 E.19989
G1 X123.973 Y155.71 E.24932
M204 S6000
; WIPE_START
G1 F33600
G1 X122.55 Y154.305 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.511 Y146.929 Z7.4 F42000
G1 X132.811 Y115.717 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.697 Y115.499 E.00817
G3 X132.602 Y114.981 I1.311 J-.508 E.01757
G1 X132.602 Y112.845 E.07086
G3 X133.023 Y111.828 I1.436 J-.001 E.03749
G1 X134.854 Y109.998 E.08586
G2 X135.602 Y108.191 I-1.892 J-1.842 E.06645
G2 X135.536 Y106.033 I-15.72 J-.601 E.07168
G2 X128.51 Y99.898 I-7.047 J.979 E.33743
G2 X126.383 Y100.099 I-.385 J7.295 E.07114
G2 X123.31 Y102.231 I1.6 J5.586 E.12634
G2 X121.823 Y105.307 I7.34 J5.446 E.11398
G2 X120.875 Y109.572 I43.838 J11.977 E.14497
G2 X120.813 Y114.824 I12.049 J2.77 E.17557
G2 X125.496 Y121.883 I11.365 J-2.456 E.28763
G1 X139.818 Y131.912 E.58
G3 X144.898 Y141.669 I-6.826 J9.754 E.37932
G1 X144.898 Y150.493 E.29268
G3 X132.993 Y162.398 I-11.902 J.004 E.62039
G1 X123.007 Y162.398 E.33123
G3 X111.102 Y150.493 I-.004 J-11.902 E.62039
G1 X111.102 Y104.185 E1.5361
G3 X114.592 Y95.759 I11.908 J-.003 E.31046
G1 X116.749 Y93.602 E.1012
G1 X139.251 Y93.602 E.74641
G1 X141.362 Y95.713 E.09903
G3 X144.898 Y104.185 I-8.381 J8.472 E.31262
G1 X144.898 Y111.988 E.25884
G3 X140.488 Y116.398 I-4.404 J.006 E.22986
G1 X134.018 Y116.398 E.21463
G3 X132.856 Y115.797 I-.01 J-1.406 E.04514
G1 X132.84 Y115.77 E.00104
G1 X132.469 Y115.918 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.413 Y115.822 E.0034
G3 X132.21 Y114.994 I1.595 J-.831 E.02648
G1 X132.21 Y112.834 E.06635
G3 X132.738 Y111.559 I1.829 J.01 E.04351
G1 X134.568 Y109.728 E.07952
G2 X135.21 Y108.18 I-1.605 J-1.572 E.05279
G2 X135.148 Y106.086 I-15.3 J-.592 E.0644
G2 X128.504 Y100.29 I-6.658 J.926 E.29548
G2 X126.487 Y100.477 I-.381 J6.87 E.06246
G2 X123.621 Y102.47 I1.49 J5.199 E.10921
G2 X122.199 Y105.418 I7.026 J5.207 E.10119
G2 X121.261 Y109.644 I43.494 J11.873 E.13307
G2 X121.119 Y114.349 I11.748 J2.708 E.14556
G2 X125.724 Y121.564 I11.117 J-2.018 E.26972
G1 X140.047 Y131.593 E.53729
G3 X145.29 Y141.665 I-7.05 J10.07 E.36266
G1 X145.29 Y150.497 E.2714
G3 X132.997 Y162.79 I-12.291 J.001 E.59333
G1 X123.003 Y162.79 E.30711
G3 X110.71 Y150.497 I-.001 J-12.291 E.59333
G1 X110.71 Y104.18 E1.4232
G3 X114.311 Y95.485 I12.295 J0 E.29675
G1 X116.587 Y93.21 E.09888
G1 X139.413 Y93.21 E.70138
G1 X141.642 Y95.439 E.09686
G3 X145.29 Y104.18 I-8.654 J8.743 E.29877
G1 X145.29 Y111.996 E.24015
G3 X140.496 Y116.79 I-4.792 J.002 E.23142
G1 X134.006 Y116.79 E.19941
G3 X132.533 Y116.02 I.002 J-1.798 E.05308
M73 P74 R5
G1 X132.501 Y115.969 E.00186
M204 S6000
; WIPE_START
G1 F33600
G1 X132.413 Y115.822 E-.06489
G1 X132.329 Y115.64 E-.07659
G1 X132.264 Y115.433 E-.08244
G1 X132.224 Y115.22 E-.08229
G1 X132.21 Y114.994 E-.08612
G1 X132.21 Y114.026 E-.36767
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z7.4 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z7.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.4 F4000
            G39.3 S1
            G0 Z7.4 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z7.8 F42000
G1 X125.256 Y122.223
G1 Z7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468881
G1 F14790.092
G3 X124.412 Y121.568 I20.896 J-27.788 E.03708
G1 X123.619 Y120.841 E.03733
G3 X121.401 Y117.738 I9.188 J-8.91 E.1329
G3 X120.414 Y114.919 I11.327 J-5.547 E.10391
G1 X120.208 Y113.652 E.04454
G3 X120.227 Y110.938 I12.571 J-1.27 E.09441
G3 X121.297 Y105.654 I58.316 J9.053 E.1872
G3 X121.951 Y103.728 I13.303 J3.447 E.07066
G1 X122.408 Y102.835 E.0348
G1 X122.975 Y101.991 E.0353
G1 X123.522 Y101.348 E.02932
G1 X124.103 Y100.814 E.02739
G3 X127.06 Y99.54 I3.897 J4.978 E.11301
G3 X129.496 Y99.549 I1.172 J12.465 E.08469
G3 X132.87 Y100.884 I-1.173 J7.896 E.12705
G1 X133.621 Y101.496 E.03362
G3 X135.358 Y103.927 I-5.609 J5.846 E.10431
G1 X135.604 Y104.567 E.02379
G1 X135.863 Y105.526 E.03448
G1 X135.952 Y106.011 E.01713
G3 X136.018 Y108.185 I-18.992 J1.663 E.07554
G1 X135.942 Y108.804 E.02164
G1 X135.834 Y109.199 E.0142
G1 X135.554 Y109.764 E.02191
G1 X135.143 Y110.296 E.02332
G1 X133.327 Y112.119 E.08932
G1 X133.093 Y112.476 E.01482
G1 X133.018 Y112.867 E.01383
G1 X133.023 Y114.975 E.07317
G1 X133.11 Y115.391 E.01475
G1 X133.311 Y115.687 E.01242
G1 X133.649 Y115.913 E.01412
G1 X134.049 Y115.982 E.01406
G1 X140.476 Y115.982 E.2231
G1 X141.122 Y115.932 E.02249
G1 X141.73 Y115.785 E.0217
G1 X142.261 Y115.568 E.01991
G1 X142.806 Y115.243 E.02203
G1 X143.3 Y114.829 E.02236
G1 X143.72 Y114.34 E.02237
G1 X144.046 Y113.807 E.0217
G1 X144.268 Y113.278 E.01992
G1 X144.424 Y112.662 E.02203
G2 X144.482 Y111.976 I-10.041 J-1.2 E.02392
G1 X144.482 Y104.19 E.27024
G2 X141.06 Y96.008 I-11.502 J.004 E.31603
G1 X139.165 Y94.105 E.09322
G2 X138.956 Y94.018 I-.191 J.166 E.00814
G1 X117.044 Y94.018 E.7606
G2 X116.835 Y94.104 I-.018 J.252 E.00811
G1 X114.89 Y96.05 E.09551
G2 X111.518 Y104.192 I8.171 J8.153 E.31386
G1 X111.518 Y150.487 E1.60694
G2 X123.013 Y161.982 I11.499 J-.004 E.62666
G1 X132.987 Y161.982 E.34623
G2 X144.482 Y150.487 I.003 J-11.492 E.62677
G1 X144.482 Y141.674 E.30591
G2 X139.576 Y132.25 I-11.523 J.009 E.38331
G1 X125.305 Y122.257 E.60471
G1 X126.444 Y129.725 F42000
; LINE_WIDTH: 0.466599
G1 F14869.746
G1 X125.655 Y129.269 E.03146
G1 X124.788 Y128.917 E.03229
G1 X123.875 Y128.71 E.03233
G1 X122.932 Y128.655 E.03262
G1 X122.009 Y128.724 E.03197
G1 X121.101 Y128.959 E.03236
G1 X120.241 Y129.326 E.0323
G1 X119.754 Y129.603 E.01934
G1 X119.041 Y130.14 E.03081
G1 X118.41 Y130.781 E.03106
G1 X117.882 Y131.51 E.03106
G1 X117.636 Y131.95 E.01741
G1 X117.285 Y132.802 E.03181
G1 X117.058 Y133.719 E.03259
G2 X116.982 Y134.651 I15.837 J1.751 E.03229
G1 X116.982 Y147.438 E.44149
G1 X117.062 Y148.353 E.03171
G1 X117.284 Y149.27 E.03255
G2 X118.123 Y150.952 I6.867 J-2.375 E.06508
G2 X118.738 Y151.677 I12.303 J-9.808 E.03285
G1 X123.516 Y156.456 E.2333
G2 X123.666 Y156.518 I.122 J-.082 E.00594
G1 X132.334 Y156.518 E.29924
G2 X132.484 Y156.456 I.01 J-.187 E.0058
G1 X137.262 Y151.678 E.23329
G1 X137.847 Y150.994 E.03108
G2 X138.949 Y148.333 I-5.236 J-3.725 E.10026
G2 X139.018 Y147.438 I-17.441 J-1.797 E.03101
G1 X139.018 Y141.653 E.19971
G1 X138.951 Y140.792 E.02981
G1 X138.772 Y139.964 E.02926
G1 X138.436 Y139.099 E.03202
G1 X137.997 Y138.33 E.03059
G1 X137.697 Y137.912 E.01776
G1 X137.113 Y137.28 E.0297
G2 X136.459 Y136.738 I-7.039 J7.827 E.02934
G1 X126.493 Y129.76 E.42003
G1 X129.824 Y131.584 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X131.158 Y132.518 E.05401
G1 X134.484 Y129.192 E.15604
G1 X129.969 Y126.031 E.18283
G1 X126.642 Y129.358 E.15609
G2 X120.904 Y128.58 I-3.643 J5.322 E.19919
G1 X111.934 Y119.61 E.42082
G1 X111.934 Y121.038 E.04739
G1 X119.754 Y113.218 E.36686
G3 X119.727 Y112.051 I9.931 J-.814 E.03875
G1 X111.934 Y104.258 E.36559
G1 X111.934 Y105.686 E.04739
G1 X123.186 Y94.434 E.52789
G1 X125.138 Y94.434 E.06472
G1 X129.904 Y99.2 E.22361
G3 X132.701 Y100.271 I-1.32 J7.637 E.09998
G1 X138.538 Y94.434 E.27384
G1 X138.906 Y94.434 E.0122
G3 X141.569 Y97.176 I-61.601 J62.485 E.1268
G3 X142.361 Y98.287 I-7.744 J6.357 E.0453
G1 X136.055 Y104.593 E.29581
G3 X136.306 Y105.602 I-7.835 J2.482 E.03453
G1 X143.867 Y113.164 E.35471
G2 X144.066 Y111.934 I-4.266 J-1.321 E.04146
G1 X140.434 Y115.566 E.17041
G1 X138.594 Y115.566 E.06102
G1 X134.528 Y111.5 E.19077
G2 X133.531 Y112.519 I4.528 J5.428 E.04736
G2 X133.434 Y112.86 I.593 J.353 E.01191
G1 X133.434 Y114.89 E.06735
G1 X144.066 Y104.258 E.4988
G1 X144.066 Y105.686 E.04739
G1 X132.814 Y94.434 E.52789
G1 X130.862 Y94.434 E.06472
G1 X125.922 Y99.374 E.23177
G2 X123.665 Y100.637 I1.809 J5.878 E.08643
G1 X117.462 Y94.434 E.29103
G1 X117.094 Y94.434 E.0122
G2 X113.639 Y98.287 I15.15 J17.059 E.17205
G1 X120.893 Y105.541 E.34031
G2 X120.517 Y107.125 I55.101 J13.914 E.05401
G1 X122.198 Y102.377 F42000
G1 F15476.087
G1 X122.121 Y102.498 E.00476
G2 X121.467 Y103.829 I6.709 J4.12 E.04925
G1 X111.934 Y113.362 E.44724
G1 X111.934 Y111.934 E.04739
G1 X135.673 Y135.679 E1.1138
G1 X138.999 Y132.353 E.15604
G3 X142.694 Y136.333 I-6.423 J9.67 E.18186
G1 X139.175 Y139.856 E.16517
G3 X139.427 Y141.458 I-7.133 J1.944 E.05392
G1 X138.983 Y159.806 F42000
G1 F15476.087
G3 X137.553 Y160.581 I-8.811 J-14.554 E.05397
G1 X133.25 Y156.278 E.20186
G1 X137.088 Y152.44 E.18005
G1 X141.822 Y157.174 E.2221
G2 X142.706 Y155.808 I-8.9 J-6.725 E.05401
G1 X113.294 Y155.807 F42000
G1 F15476.087
G2 X114.183 Y157.169 I9.889 J-5.485 E.054
G1 X118.912 Y152.44 E.22187
G1 X122.75 Y156.278 E.18005
G1 X118.447 Y160.581 E.20186
G3 X117.018 Y159.803 I5.02 J-10.926 E.054
G1 X116.612 Y133.928 F42000
G1 F15476.087
G3 X117 Y132.352 I6.029 J.647 E.05402
G1 X111.934 Y127.286 E.23767
G1 X111.934 Y128.714 E.04739
G1 X121.645 Y119.003 E.45557
G2 X125.455 Y122.869 I10.532 J-6.568 E.18152
G1 X111.934 Y136.39 E.6343
G1 X111.934 Y134.962 E.04739
G1 X116.566 Y139.594 E.21733
G1 X116.566 Y139.434 E.00532
G1 X111.934 Y144.066 E.21733
G1 X111.934 Y142.638 E.04739
G1 X116.566 Y147.27 E.21733
G1 X116.566 Y147.11 E.00532
G1 X112.006 Y151.67 E.21392
G3 X111.934 Y150.314 I11.837 J-1.314 E.04507
G1 X123.186 Y161.566 E.52789
G1 X125.138 Y161.566 E.06472
G1 X129.77 Y156.934 E.21733
G1 X126.23 Y156.934 E.11744
G1 X130.862 Y161.566 E.21733
G1 X132.814 Y161.566 E.06472
G1 X144.066 Y150.314 E.52789
G3 X144 Y151.676 I-30.107 J-.778 E.04526
G1 X139.434 Y147.11 E.21422
G1 X139.434 Y147.27 E.00532
G1 X144.066 Y142.638 E.21733
G1 X144.066 Y144.066 E.04739
G1 X138.713 Y138.713 E.25112
G2 X137.794 Y137.375 I-5.426 J2.742 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X138.299 Y138.014 E-.30952
G1 X138.713 Y138.713 E-.30886
G1 X138.977 Y138.977 E-.14162
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/45
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
G17
G3 Z7.4 I-.907 J-.812 P1  F42000
G1 X123.655 Y156.088 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X118.99 Y151.423 E.21888
G3 X117.34 Y147.441 I4.009 J-3.993 E.14668
G1 X117.34 Y134.647 E.42438
G3 X122.511 Y129.022 I5.67 J.022 E.27813
G3 X126.237 Y130.017 I.472 J5.702 E.13048
G1 X136.255 Y137.032 E.40571
G3 X138.66 Y141.651 I-3.284 J4.645 E.17941
G1 X138.66 Y147.441 E.19205
G3 X137.01 Y151.423 I-5.659 J-.011 E.14668
G1 X132.273 Y156.16 E.22223
G1 X123.727 Y156.16 E.28351
G1 X123.698 Y156.131 E.00136
G1 X123.889 Y155.768 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.272 Y151.151 E.20062
G3 X117.732 Y147.433 I3.731 J-3.723 E.12687
G1 X117.732 Y134.656 E.39261
G3 X122.546 Y129.413 I5.277 J.014 E.24002
G3 X126.018 Y130.343 I.439 J5.308 E.11267
G1 X136.025 Y137.349 E.37535
G3 X138.268 Y141.658 I-3.053 J4.328 E.15507
G1 X138.268 Y147.433 E.17744
G3 X136.728 Y151.151 I-5.271 J-.005 E.12687
G1 X132.111 Y155.768 E.20062
G1 X123.949 Y155.768 E.25079
M204 S6000
; WIPE_START
G1 F33600
G1 X122.526 Y154.363 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.495 Y146.989 Z7.6 F42000
G1 X132.857 Y115.684 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.749 Y115.474 E.00783
G3 X132.66 Y114.982 I1.26 J-.483 E.0167
G1 X132.66 Y112.846 E.07086
G3 X133.064 Y111.869 I1.378 J-.001 E.036
G1 X134.893 Y110.04 E.08576
G2 X135.66 Y108.188 I-1.936 J-1.887 E.06813
G2 X135.594 Y106.029 I-15.797 J-.599 E.07173
G2 X128.51 Y99.84 I-7.104 J.984 E.3403
G2 X126.416 Y100.031 I-.376 J7.471 E.07
G2 X123.254 Y102.21 I1.547 J5.629 E.1298
G2 X121.767 Y105.291 I7.386 J5.462 E.11413
G2 X120.753 Y109.913 I50.229 J13.442 E.15705
G2 X125.463 Y121.93 I11.429 J2.452 E.45357
G1 X139.785 Y131.959 E.58
G3 X144.84 Y141.669 I-6.793 J9.707 E.37749
G1 X144.84 Y150.493 E.29268
G3 X132.993 Y162.34 I-11.848 J-.001 E.61733
M73 P75 R5
G1 X123.007 Y162.34 E.33122
G3 X111.16 Y150.493 I.001 J-11.848 E.61733
G1 X111.16 Y104.185 E1.5361
G3 X114.633 Y95.8 I11.861 J.001 E.30894
G1 X116.773 Y93.66 E.10041
G1 X139.227 Y93.66 E.74482
G1 X141.367 Y95.8 E.1004
G3 X144.84 Y104.185 I-8.38 J8.383 E.30895
G1 X144.84 Y111.988 E.25884
G3 X140.488 Y116.34 I-4.347 J.006 E.22685
G1 X134.018 Y116.34 E.21461
G3 X132.898 Y115.757 I-.01 J-1.349 E.0436
G1 X132.887 Y115.736 E.00079
G1 X132.513 Y115.882 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.47 Y115.805 E.00271
G3 X132.268 Y114.994 I1.539 J-.814 E.02595
G1 X132.268 Y112.834 E.06635
G3 X132.779 Y111.599 I1.77 J.01 E.04212
G1 X134.608 Y109.771 E.07945
G2 X135.268 Y108.177 I-1.65 J-1.617 E.05432
G2 X135.205 Y106.082 I-15.379 J-.59 E.06445
G2 X128.504 Y100.232 I-6.716 J.929 E.29815
G2 X126.518 Y100.409 I-.372 J7.044 E.06145
G2 X123.565 Y102.448 I1.44 J5.243 E.11236
G2 X122.143 Y105.402 I7.072 J5.224 E.10134
G2 X121.139 Y109.985 I49.873 J13.335 E.14422
G2 X125.69 Y121.611 I11.043 J2.38 E.40647
G1 X140.014 Y131.641 E.53729
G3 X145.232 Y141.665 I-7.02 J10.025 E.36094
G1 X145.232 Y150.497 E.2714
G3 X132.997 Y162.732 I-12.239 J-.004 E.59047
G1 X123.003 Y162.732 E.30711
G3 X110.768 Y150.497 I.004 J-12.239 E.59047
G1 X110.768 Y104.18 E1.4232
G3 X114.352 Y95.526 I12.25 J.005 E.29534
G1 X116.611 Y93.268 E.09815
G1 X139.389 Y93.268 E.69991
G1 X139.428 Y93.306 E.00167
G1 X141.648 Y95.526 E.09647
G3 X145.232 Y104.18 I-8.659 J8.656 E.29535
G1 X145.232 Y111.996 E.24015
G3 X140.496 Y116.732 I-4.735 J.002 E.22863
G1 X134.006 Y116.732 E.1994
G3 X132.575 Y115.979 I.002 J-1.741 E.05167
G1 X132.545 Y115.932 E.00172
M204 S6000
; WIPE_START
G1 F33600
G1 X132.47 Y115.805 E-.05624
G1 X132.381 Y115.614 E-.08023
G1 X132.318 Y115.412 E-.08031
G1 X132.281 Y115.211 E-.07762
G1 X132.268 Y114.994 E-.08275
G1 X132.268 Y113.986 E-.38286
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z7.6 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z7.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.6 F4000
            G39.3 S1
            G0 Z7.6 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z8 F42000
G1 X125.207 Y122.294
G1 Z7.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.526393
G1 F13030.719
G3 X120.188 Y110.571 I7.015 J-9.939 E.52881
G3 X121.344 Y105.155 I56.725 J9.28 E.21828
G1 X121.672 Y104.174 E.04078
G3 X123.626 Y101.119 I8.417 J3.232 E.14383
G1 X124.198 Y100.626 E.02976
G1 X124.969 Y100.13 E.0361
G1 X125.729 Y99.791 E.03279
G1 X126.249 Y99.618 E.02159
G1 X127.046 Y99.455 E.03206
G3 X127.863 Y99.396 I1.33 J12.656 E.03226
G1 X129.004 Y99.412 E.04496
G1 X129.524 Y99.465 E.02059
G1 X130.472 Y99.658 E.03813
G3 X135.838 Y105.036 I-1.995 J7.357 E.31333
G1 X136.032 Y105.96 E.03719
G3 X136.104 Y108.184 I-17.863 J1.691 E.08772
G1 X136.029 Y108.814 E.02502
G1 X135.921 Y109.212 E.01625
G1 X135.633 Y109.8 E.02579
G1 X135.204 Y110.358 E.02773
G1 X133.389 Y112.18 E.10133
G1 X133.175 Y112.504 E.01529
G1 X133.105 Y112.869 E.01463
G1 X133.11 Y114.974 E.08295
G1 X133.188 Y115.353 E.01525
G2 X133.577 Y115.778 I.911 J-.443 E.02301
G2 X134.046 Y115.896 I.554 J-1.223 E.01916
G1 X140.475 Y115.895 E.25327
G1 X141.112 Y115.846 E.02517
G1 X141.708 Y115.701 E.02418
G2 X144.337 Y112.655 I-1.298 J-3.778 E.16611
G2 X144.395 Y111.975 I-9.674 J-1.176 E.02691
G1 X144.395 Y104.191 E.30667
G2 X141.049 Y96.111 I-11.475 J.02 E.35349
G1 X139.137 Y94.199 E.10649
G2 X138.909 Y94.104 I-.207 J.177 E.01012
G1 X117.091 Y94.104 E.85952
G2 X116.863 Y94.199 I-.021 J.272 E.01012
G1 X114.951 Y96.111 E.1065
G2 X111.604 Y104.192 I8.126 J8.099 E.35353
G1 X111.605 Y150.487 E1.8239
G2 X123.014 Y161.896 I11.411 J-.003 E.706
G1 X132.987 Y161.895 E.39291
G2 X144.396 Y150.487 I-.003 J-11.411 E.70596
G1 X144.395 Y141.675 E.34717
G2 X139.526 Y132.32 I-11.447 J.014 E.43179
G1 X125.256 Y122.328 E.68631
G1 X126.494 Y129.654 F42000
; LINE_WIDTH: 0.525388
G1 F13057.872
G1 X125.7 Y129.195 E.03607
G1 X124.803 Y128.832 E.03806
G1 X124.24 Y128.692 E.0228
G1 X123.336 Y128.573 E.03584
G2 X121.999 Y128.638 I-.339 J6.837 E.0527
G1 X121.083 Y128.874 E.03721
G1 X120.189 Y129.245 E.03806
G1 X119.698 Y129.536 E.02241
G1 X118.978 Y130.08 E.03549
G1 X118.345 Y130.724 E.03551
G1 X117.815 Y131.455 E.03551
G1 X117.563 Y131.903 E.02018
G1 X117.2 Y132.783 E.03743
G1 X116.973 Y133.7 E.03714
G2 X116.896 Y134.652 I15.114 J1.713 E.03756
G1 X116.896 Y147.438 E.50268
G1 X116.976 Y148.36 E.03637
M73 P75 R4
G1 X117.197 Y149.31 E.03838
G2 X118.054 Y151.004 I7.275 J-2.619 E.07482
G2 X118.678 Y151.74 I12.172 J-9.688 E.03791
G1 X123.472 Y156.534 E.26656
G2 X123.642 Y156.604 I.138 J-.093 E.00769
G1 X132.358 Y156.604 E.34264
G1 X132.497 Y156.562 E.00573
G1 X137.322 Y151.74 E.26821
G1 X137.912 Y151.052 E.0356
G2 X139.104 Y147.437 I-5.167 J-3.709 E.15198
G1 X139.104 Y141.654 E.22739
G1 X139.033 Y140.762 E.03515
G1 X138.858 Y139.952 E.03261
G1 X138.52 Y139.075 E.03696
G1 X138.064 Y138.276 E.03614
G1 X137.756 Y137.847 E.02077
G1 X137.168 Y137.212 E.03402
G2 X136.508 Y136.666 I-7.125 J7.936 E.03368
G1 X126.543 Y129.689 E.47825
G1 X138.122 Y137.582 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X138.968 Y138.968 I-5.137 J4.086 E.05403
G1 X143.951 Y143.951 E.23373
G1 X143.951 Y142.753 E.03973
G1 X139.549 Y147.155 E.20649
G1 X139.549 Y147.225 E.00234
G1 X143.889 Y151.565 E.20358
G2 X143.951 Y150.429 I-11.779 J-1.213 E.03774
G1 X132.929 Y161.451 E.51706
G1 X130.747 Y161.451 E.07238
G1 X126.345 Y157.049 E.20649
G1 X129.655 Y157.049 E.10978
G1 X125.253 Y161.451 E.20649
G1 X123.071 Y161.451 E.07238
G1 X112.049 Y150.429 E.51706
G2 X112.103 Y151.573 I15.467 J-.154 E.038
G1 X116.451 Y147.225 E.20397
G1 X116.451 Y147.155 E.00234
G1 X112.049 Y142.753 E.20649
G1 X112.049 Y143.951 E.03973
G1 X116.451 Y139.549 E.20649
G1 X116.451 Y139.479 E.00234
G1 X112.049 Y135.077 E.20649
G1 X112.049 Y136.275 E.03973
G1 X125.372 Y122.952 E.62499
G3 X121.561 Y119.087 I6.789 J-10.504 E.1815
G1 X112.049 Y128.599 E.44623
G1 X112.049 Y127.401 E.03973
G1 X116.911 Y132.263 E.22806
G2 X116.506 Y133.835 I5.776 J2.324 E.05402
; WIPE_START
G1 F33600
G1 X116.67 Y132.985 E-.32913
G1 X116.911 Y132.263 E-.28923
G1 X116.647 Y131.999 E-.14163
; WIPE_END
G1 E-.04 F1800
G1 X123.711 Y134.889 Z7.6 F42000
G1 X139.539 Y141.363 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F15476.087
G2 X139.266 Y139.762 I-6.532 J.291 E.05402
G1 X142.607 Y136.421 E.15674
G2 X138.916 Y132.436 I-9.734 J5.315 E.18203
G1 X135.755 Y135.597 E.14826
G1 X135.225 Y135.225 E.02147
G1 X112.049 Y112.049 E1.08724
G1 X112.049 Y113.247 E.03973
G1 X121.257 Y104.013 E.43258
G3 X121.942 Y102.583 I8.61 J3.239 E.05266
G1 X120.424 Y107.037 F42000
G1 F15476.087
G3 X120.806 Y105.454 I17.216 J3.317 E.05402
G1 X113.721 Y98.369 E.33238
G3 X117.142 Y94.549 I18.4 J13.035 E.17046
G1 X117.577 Y94.549 E.01444
G1 X123.581 Y100.553 E.28165
G3 X126.101 Y99.195 I4.26 J4.889 E.09576
G1 X130.747 Y94.549 E.21794
G1 X132.929 Y94.549 E.07238
G1 X143.951 Y105.571 E.51706
G1 X143.951 Y104.373 E.03973
G1 X133.549 Y114.775 E.48796
G3 X133.554 Y112.778 I15.733 J-.957 E.0663
G3 X133.709 Y112.481 I.579 J.114 E.01124
G1 X134.609 Y111.581 E.04222
G1 X138.479 Y115.451 E.18152
G2 X140.552 Y115.448 I1 J-25.234 E.0688
G1 X143.948 Y112.052 E.1593
G3 X143.777 Y113.073 I-4.626 J-.249 E.03441
G1 X136.447 Y105.743 E.34389
G2 X136.148 Y104.5 I-8.194 J1.311 E.04244
G1 X142.276 Y98.372 E.28746
G2 X138.858 Y94.549 I-18.144 J12.78 E.17048
G1 X138.423 Y94.549 E.01444
G1 X132.753 Y100.166 E.26476
G2 X129.757 Y99.053 I-4.3 J6.986 E.10669
G1 X125.253 Y94.549 E.2113
G1 X123.071 Y94.549 E.07238
G1 X112.049 Y105.571 E.51706
G1 X112.049 Y104.373 E.03973
G1 X119.619 Y111.943 E.3551
G2 X119.648 Y113.324 I11.799 J.436 E.04585
G1 X112.049 Y120.923 E.3565
G1 X112.049 Y119.725 E.03973
G1 X120.814 Y128.49 E.4112
G1 X120.969 Y128.434 E.00547
G3 X126.726 Y129.274 I2.024 J6.271 E.19987
G1 X129.886 Y126.114 E.14829
G1 X134.401 Y129.275 E.18283
G1 X131.241 Y132.435 E.14826
G1 X129.907 Y131.501 E.05401
; WIPE_START
G1 F33600
G1 X131.241 Y132.435 E-.61876
G1 X131.504 Y132.172 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X134.761 Y139.075 Z7.6 F42000
G1 X142.615 Y155.721 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F15476.087
G3 X141.74 Y157.092 I-13.534 J-7.669 E.05397
G1 X137.169 Y152.521 E.21443
G1 X133.331 Y156.359 E.18005
G1 X137.464 Y160.492 E.19387
G2 X138.897 Y159.723 I-4.322 J-9.775 E.05401
G1 X117.105 Y159.718 F42000
G1 F15476.087
G2 X118.536 Y160.492 I5.292 J-8.075 E.05401
G1 X122.669 Y156.359 E.19387
M73 P76 R4
G1 X118.831 Y152.521 E.18005
G1 X114.265 Y157.087 E.2142
G3 X113.379 Y155.723 I9.442 J-7.098 E.05399
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X114.265 Y157.087 E-.61804
G1 X114.529 Y156.823 E-.14196
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/45
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
G17
G3 Z7.6 I.082 J1.214 P1  F42000
G1 X123.611 Y156.208 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X118.908 Y151.504 E.22065
G3 X117.225 Y147.441 I4.106 J-4.081 E.14967
G1 X117.225 Y134.649 E.42433
G3 X122.563 Y128.903 I5.782 J.02 E.28588
G3 X126.303 Y129.923 I.417 J5.843 E.13107
G1 X136.322 Y136.938 E.4057
G3 X138.775 Y141.651 I-3.342 J4.735 E.18312
G1 X138.773 Y147.507 E.19424
G3 X137.092 Y151.504 I-5.78 J-.078 E.14746
G1 X132.321 Y156.275 E.22381
G1 X123.679 Y156.275 E.28668
G1 X123.654 Y156.25 E.00117
G1 X123.841 Y155.883 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.191 Y151.233 E.20209
G3 X117.617 Y147.433 I3.823 J-3.809 E.12965
G1 X117.617 Y134.656 E.3926
G3 X122.584 Y129.295 I5.39 J.012 E.24678
G3 X126.084 Y130.248 I.397 J5.446 E.11363
G1 X136.091 Y137.255 E.37535
G3 X138.383 Y141.658 I-3.11 J4.417 E.1585
G1 X138.381 Y147.499 E.17947
G3 X136.809 Y151.233 I-5.387 J-.07 E.1276
G1 X132.159 Y155.883 E.20209
G1 X123.901 Y155.883 E.25373
M204 S6000
; WIPE_START
G1 F33600
G1 X122.478 Y154.478 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.466 Y147.109 Z7.8 F42000
G1 X132.957 Y115.627 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.857 Y115.432 E.00728
G3 X132.775 Y114.981 I1.152 J-.441 E.01528
G1 X132.775 Y112.846 E.07082
G3 X133.146 Y111.95 I1.262 J-.002 E.03302
G1 X134.974 Y110.122 E.08574
G2 X135.775 Y108.188 I-2.052 J-1.983 E.07111
G2 X135.71 Y106.023 I-15.983 J-.599 E.07191
G2 X128.51 Y99.725 I-7.22 J.989 E.34612
G2 X126.069 Y100.012 I-.409 J7.026 E.08195
G2 X122.882 Y102.529 I2.016 J5.829 E.13728
G2 X121.517 Y105.755 I8.829 J5.637 E.11673
G2 X120.458 Y111.024 I59.31 J14.663 E.17833
G2 X125.397 Y122.025 I11.714 J1.351 E.41989
G1 X139.719 Y132.054 E.57998
G3 X144.725 Y141.669 I-6.751 J9.625 E.37374
G1 X144.725 Y150.492 E.29268
G3 X132.992 Y162.225 I-11.734 J-.001 E.6113
G1 X123.008 Y162.225 E.33122
G3 X111.275 Y150.492 I.001 J-11.734 E.6113
G1 X111.275 Y104.185 E1.5361
G3 X114.715 Y95.882 I11.768 J.01 E.3059
G1 X116.821 Y93.775 E.09882
G1 X139.179 Y93.775 E.74165
G1 X141.285 Y95.882 E.09882
G3 X144.725 Y104.185 I-8.303 J8.303 E.30594
G1 X144.725 Y111.988 E.25883
G3 X140.488 Y116.225 I-4.234 J.003 E.2208
G1 X134.018 Y116.225 E.21462
G3 X132.992 Y115.689 I-.009 J-1.233 E.03997
G1 X132.986 Y115.679 E.00038
G1 X132.611 Y115.808 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.49 Y115.571 E.00817
G3 X132.383 Y114.993 I1.519 J-.579 E.01814
G1 X132.383 Y112.835 E.06634
G3 X132.861 Y111.681 I1.654 J.009 E.03935
G1 X134.689 Y109.853 E.07944
G2 X135.383 Y108.177 I-1.757 J-1.709 E.05708
G2 X135.321 Y106.076 I-15.565 J-.59 E.06466
G2 X128.504 Y100.117 I-6.831 J.936 E.30352
G2 X126.3 Y100.352 I-.4 J6.691 E.06841
G2 X123.452 Y102.406 I1.61 J5.232 E.10983
G2 X122.033 Y105.369 I7.162 J5.254 E.10154
G2 X121.03 Y109.94 I49.443 J13.246 E.14385
G2 X125.624 Y121.706 I11.171 J2.417 E.41121
G1 X139.948 Y131.735 E.53729
G3 X145.117 Y141.665 I-6.98 J9.943 E.35747
G1 X145.117 Y150.497 E.2714
G3 X132.997 Y162.617 I-12.126 J-.006 E.58488
G1 X123.003 Y162.617 E.30711
G3 X110.883 Y150.497 I.006 J-12.126 E.58488
G1 X110.883 Y104.18 E1.4232
G3 X114.434 Y95.608 I12.162 J.016 E.29252
G1 X116.659 Y93.383 E.09668
G1 X139.341 Y93.383 E.69697
G1 X141.566 Y95.608 E.09668
G3 X145.117 Y104.18 I-8.584 J8.577 E.29255
G1 X145.117 Y111.996 E.24015
G3 X140.496 Y116.617 I-4.626 J-.005 E.22297
G1 X134.006 Y116.617 E.1994
G3 X132.667 Y115.909 I.002 J-1.625 E.0484
G1 X132.64 Y115.86 E.00173
M204 S6000
; WIPE_START
G1 F33600
G1 X132.49 Y115.571 E-.12388
G1 X132.396 Y115.2 E-.14517
G1 X132.383 Y114.993 E-.07886
G1 X132.383 Y113.909 E-.41209
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z7.8 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z7.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.8 F4000
            G39.3 S1
            G0 Z7.8 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z8.2 F42000
G1 X125.141 Y122.388
G1 Z7.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.524217
G1 F13089.645
G3 X120.073 Y110.554 I7.046 J-10.019 E.53162
G3 X120.922 Y106.31 I98.946 J17.591 E.16975
G3 X121.786 Y103.6 I16.627 J3.806 E.11171
G3 X123.791 Y100.813 I7.672 J3.407 E.13559
G1 X124.193 Y100.49 E.02025
G1 X124.914 Y100.028 E.03357
G1 X125.635 Y99.697 E.03112
G1 X126.219 Y99.51 E.02406
G1 X127.03 Y99.338 E.03252
G3 X127.863 Y99.28 I1.535 J15.933 E.03273
G1 X129.006 Y99.296 E.04486
G3 X136.204 Y106.502 I-.523 J7.72 E.43598
G1 X136.22 Y108.184 E.06594
G1 X136.144 Y108.83 E.02551
G1 X136.035 Y109.235 E.01645
G1 X135.724 Y109.873 E.02784
G1 X135.31 Y110.413 E.02667
G1 X133.478 Y112.248 E.10171
G1 X133.271 Y112.568 E.01494
G1 X133.22 Y112.872 E.0121
G1 X133.225 Y114.973 E.0824
G1 X133.311 Y115.356 E.01539
G1 X133.566 Y115.642 E.015
G1 X133.915 Y115.765 E.01451
G1 X134.046 Y115.78 E.00517
G1 X140.479 Y115.78 E.25232
G1 X141.099 Y115.725 E.02439
G1 X141.705 Y115.575 E.02451
G1 X142.401 Y115.25 E.03011
G1 X142.92 Y114.894 E.02471
G1 X143.364 Y114.456 E.02446
G1 X143.732 Y113.946 E.02464
G1 X144.061 Y113.253 E.03011
G1 X144.221 Y112.645 E.02465
G2 X144.28 Y111.974 I-9.157 J-1.142 E.0264
G1 X144.28 Y104.191 E.30528
G2 X140.967 Y96.192 I-11.426 J.047 E.34823
G1 X139.089 Y94.315 E.10414
G2 X138.861 Y94.22 I-.207 J.177 E.01008
G1 X117.139 Y94.22 E.8519
G2 X116.911 Y94.315 I-.021 J.272 E.01008
G1 X115.033 Y96.192 E.10414
G2 X111.72 Y104.191 I8.042 J8.016 E.34838
G1 X111.72 Y150.487 E1.81569
G2 X123.013 Y161.78 I11.295 J-.002 E.69569
G1 X132.987 Y161.78 E.39117
G2 X144.054 Y152.723 I.002 J-11.287 E.6074
G1 X144.22 Y151.649 E.04261
G2 X144.28 Y150.487 I-16.709 J-1.447 E.04566
G1 X144.28 Y141.675 E.34561
G2 X139.46 Y132.415 I-11.327 J.012 E.42551
G1 X125.19 Y122.423 E.68322
G1 X126.56 Y129.56 F42000
; LINE_WIDTH: 0.525527
G1 F13054.106
G1 X125.761 Y129.096 E.03637
G1 X124.798 Y128.71 E.04078
G1 X124.246 Y128.575 E.02236
G1 X123.332 Y128.458 E.03624
G2 X121.983 Y128.524 I-.344 J6.721 E.0532
G1 X121.087 Y128.743 E.03627
G1 X120.247 Y129.089 E.03571
G1 X119.621 Y129.448 E.02839
G1 X118.896 Y129.998 E.0358
G1 X118.258 Y130.648 E.03583
G1 X117.722 Y131.385 E.03583
G1 X117.476 Y131.821 E.01967
G1 X117.084 Y132.766 E.04025
G1 X116.858 Y133.692 E.0375
G2 X116.78 Y134.652 I15.403 J1.728 E.03787
G1 X116.78 Y147.438 E.50281
G1 X116.86 Y148.368 E.0367
G1 X117.101 Y149.387 E.04118
G2 X117.967 Y151.081 I7.228 J-2.629 E.07502
G2 X118.596 Y151.821 I12.412 J-9.904 E.03821
G1 X123.424 Y156.649 E.26852
G2 X123.595 Y156.72 I.138 J-.093 E.00769
G1 X132.405 Y156.72 E.3465
G1 X132.545 Y156.678 E.00573
G1 X137.404 Y151.821 E.27016
G1 X137.999 Y151.128 E.03595
G2 X138.69 Y149.934 I-5.377 J-3.905 E.05435
G1 X139.046 Y148.878 E.04382
G2 X139.216 Y147.52 I-7.213 J-1.588 E.05388
G1 X139.22 Y141.654 E.23071
G1 X139.138 Y140.691 E.03799
G1 X138.951 Y139.892 E.03228
G1 X138.634 Y139.046 E.03553
G1 X138.16 Y138.193 E.03838
G1 X137.842 Y137.77 E.02081
G1 X137.242 Y137.124 E.03468
G2 X136.574 Y136.572 I-7.244 J8.082 E.03409
G1 X126.61 Y129.594 E.47838
G1 X129.99 Y131.418 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X131.324 Y132.352 E.05401
G1 X134.318 Y129.358 E.14049
G1 X129.804 Y126.196 E.18283
G1 X126.804 Y129.188 E.14052
G2 X120.724 Y128.4 I-3.797 J5.455 E.21135
G1 X112.165 Y119.841 E.40156
G1 X112.165 Y120.807 E.03207
G1 X119.543 Y113.429 E.34615
G3 X119.507 Y111.831 I11.638 J-1.067 E.05307
G1 X112.165 Y104.489 E.34443
G1 X112.165 Y105.456 E.03207
G1 X122.956 Y94.665 E.50622
G1 X125.368 Y94.665 E.08004
G1 X129.618 Y98.914 E.19937
M73 P77 R4
G3 X132.868 Y100.104 I-1.103 J8.05 E.11568
G1 X138.307 Y94.665 E.25517
G1 X138.81 Y94.665 E.01669
G3 X142.191 Y98.457 I-14.404 J16.246 E.16891
G1 X136.241 Y104.407 E.27915
G3 X136.587 Y105.883 I-8.488 J2.766 E.05033
G1 X143.684 Y112.98 E.33296
G2 X143.827 Y112.173 I-4.972 J-1.298 E.02723
G1 X140.673 Y115.327 E.14799
G3 X138.363 Y115.335 I-1.252 J-27.811 E.07663
G1 X134.691 Y111.663 E.17227
G2 X133.73 Y112.637 I4.821 J5.722 E.04546
G2 X133.665 Y112.882 I.359 J.226 E.00854
G1 X133.665 Y114.659 E.05896
G1 X143.835 Y104.489 E.47713
G1 X143.835 Y105.456 E.03207
G1 X133.044 Y94.665 E.50622
G1 X130.632 Y94.665 E.08004
G1 X126.263 Y99.033 E.20495
G1 X126.103 Y99.074 E.00547
G2 X123.499 Y100.471 I1.83 J6.536 E.09883
G1 X117.693 Y94.665 E.27238
G1 X117.19 Y94.665 E.01669
G2 X113.804 Y98.452 I14.724 J16.566 E.16888
G1 X120.712 Y105.36 E.32404
G2 X120.326 Y106.941 I17.031 J4.992 E.05402
G1 X121.713 Y102.745 F42000
G1 F15476.087
G1 X121.589 Y102.975 E.00867
G2 X121.062 Y104.234 I10.034 J4.945 E.04533
G1 X112.165 Y113.132 E.41738
G1 X112.165 Y112.165 E.03207
G1 X134.755 Y134.755 E1.05977
G1 X135.838 Y135.514 E.04387
G1 X138.833 Y132.519 E.14049
G3 X142.522 Y136.506 I-5.975 J9.229 E.18207
G1 X139.357 Y139.671 E.14849
G1 X138.813 Y159.64 F42000
G1 F15476.087
G3 X137.378 Y160.406 I-8.354 J-13.93 E.05397
G1 X133.413 Y156.441 E.18599
G1 X137.251 Y152.603 E.18005
G1 X141.654 Y157.006 E.20657
G2 X142.535 Y155.639 I-8.29 J-6.307 E.05401
; WIPE_START
G1 F33600
G1 X141.654 Y157.006 E-.61805
G1 X141.39 Y156.742 E-.14195
; WIPE_END
G1 E-.04 F1800
G1 X133.764 Y156.441 Z7.8 F42000
G1 X113.465 Y155.639 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F15476.087
G2 X114.346 Y157.006 I10.818 J-6.01 E.05399
G1 X118.749 Y152.603 E.20654
G1 X122.587 Y156.441 E.18005
G1 X118.622 Y160.406 E.18599
G3 X117.188 Y159.638 I5.287 J-11.598 E.05399
G1 X116.4 Y133.742 F42000
G1 F15476.087
G1 X116.406 Y133.688 E.00181
G3 X116.822 Y132.174 I7.081 J1.127 E.0522
G1 X112.165 Y127.517 E.21847
G1 X112.165 Y128.483 E.03207
G1 X121.477 Y119.171 E.43688
G2 X125.289 Y123.035 I10.669 J-6.71 E.18147
G1 X118.979 Y129.345 E.29599
G2 X117.702 Y130.622 I4.274 J5.552 E.06011
G1 X112.165 Y136.159 E.25975
G1 X112.165 Y135.193 E.03207
G1 X116.335 Y139.363 E.19566
G1 X116.335 Y139.665 E.01
G1 X112.165 Y143.835 E.19566
G1 X112.165 Y142.868 E.03207
G1 X116.335 Y147.039 E.19566
G1 X116.335 Y147.341 E.01
G1 X112.211 Y151.465 E.1935
G3 X112.166 Y150.546 I9 J-.897 E.03054
G1 X122.954 Y161.334 E.50608
G2 X125.369 Y161.335 I1.236 J-47.475 E.0801
G1 X129.539 Y157.165 E.19566
G1 X126.461 Y157.165 E.10212
G1 X130.632 Y161.335 E.19566
G2 X133.046 Y161.334 I1.177 J-47.513 E.0801
G1 X143.834 Y150.546 E.50608
G3 X143.789 Y151.465 I-9.052 J.022 E.03054
G1 X139.665 Y147.341 E.1935
G1 X139.665 Y147.039 E.01
G1 X143.835 Y142.868 E.19566
G1 X143.835 Y143.835 E.03207
G1 X139.181 Y139.181 E.21834
G2 X138.398 Y137.758 I-5.866 J2.303 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X138.867 Y138.501 E-.33377
G1 X139.181 Y139.181 E-.28465
G1 X139.445 Y139.445 E-.14158
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/45
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
G17
G3 Z7.8 I-.887 J-.834 P1  F42000
G1 X123.568 Y156.327 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X118.826 Y151.586 E.22241
G3 X117.109 Y147.44 I4.237 J-4.183 E.15262
G1 X117.109 Y134.649 E.42433
G3 X122.594 Y128.786 I5.891 J.014 E.293
G3 X126.369 Y129.828 I.403 J5.901 E.13242
G1 X136.388 Y136.843 E.40569
G3 X138.891 Y141.651 I-3.423 J4.838 E.18676
G1 X138.891 Y147.44 E.19201
G3 X137.174 Y151.586 I-5.903 J-.016 E.15272
G1 X132.369 Y156.391 E.22539
G1 X123.631 Y156.391 E.28985
G1 X123.61 Y156.37 E.00099
G1 X123.793 Y155.999 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.109 Y151.314 E.20356
G3 X117.501 Y147.433 I3.951 J-3.91 E.13238
G1 X117.501 Y134.656 E.3926
G3 X122.615 Y129.177 I5.499 J.007 E.25337
G3 X126.151 Y130.154 I.381 J5.51 E.11487
G1 X136.157 Y137.16 E.37535
G3 X138.499 Y141.658 I-3.19 J4.519 E.16187
G1 X138.499 Y147.433 E.17743
G3 X136.891 Y151.314 I-5.511 J-.009 E.13245
G1 X132.207 Y155.999 E.20356
G1 X123.853 Y155.999 E.25667
M204 S6000
; WIPE_START
G1 F33600
G1 X122.43 Y154.593 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.427 Y147.227 Z8 F42000
G1 X133.022 Y115.521 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X133.023 Y115.518 E.00011
G3 X132.891 Y114.98 I.986 J-.527 E.01855
G1 X132.891 Y112.846 E.07079
G3 X133.228 Y112.031 I1.146 J-.003 E.03004
G1 X135.056 Y110.204 E.08572
G2 X135.891 Y108.188 I-2.114 J-2.057 E.07416
G2 X135.825 Y106.016 I-16.17 J-.599 E.07213
G2 X128.51 Y99.609 I-7.331 J.99 E.35198
G2 X125.801 Y99.984 I-.408 J7.031 E.0913
G2 X122.786 Y102.465 I2.31 J5.879 E.13166
G2 X121.411 Y105.706 I8.926 J5.7 E.11733
G2 X120.35 Y110.957 I67.99 J16.474 E.17776
G2 X125.331 Y122.12 I11.808 J1.424 E.42586
G1 X139.653 Y132.148 E.57997
G3 X144.609 Y141.67 I-6.685 J9.531 E.37007
G1 X144.609 Y150.492 E.29267
G3 X132.992 Y162.109 I-11.618 J-.002 E.60528
G1 X123.008 Y162.109 E.33122
G3 X111.391 Y150.492 I.001 J-11.618 E.60529
G1 X111.391 Y104.185 E1.5361
G3 X114.796 Y95.963 I11.662 J.014 E.30288
G1 X116.869 Y93.891 E.09723
G1 X139.131 Y93.891 E.73847
G1 X139.455 Y94.215 E.01519
G1 X141.204 Y95.963 E.08204
G3 X144.609 Y104.185 I-8.238 J8.229 E.30291
G1 X144.609 Y111.988 E.25883
G3 X140.488 Y116.109 I-4.116 J.005 E.21483
G1 X134.018 Y116.109 E.21461
G3 X133.17 Y115.731 I-.01 J-1.118 E.03176
G1 X133.057 Y115.57 E.00652
G1 X132.702 Y115.744 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.677 Y115.703 E.00148
G3 X132.499 Y114.993 I1.332 J-.711 E.0227
G1 X132.499 Y112.835 E.06632
G3 X132.943 Y111.762 I1.538 J.009 E.03657
G1 X134.771 Y109.934 E.07943
G2 X135.499 Y108.177 I-1.823 J-1.784 E.05989
G2 X135.436 Y106.068 I-15.753 J-.59 E.06488
G2 X128.504 Y100.001 I-6.943 J.94 E.3089
G2 X125.941 Y100.351 I-.399 J6.649 E.07998
G2 X123.112 Y102.684 I2.17 J5.512 E.11457
G2 X121.79 Y105.808 I8.594 J5.479 E.10471
G2 X120.739 Y111.004 I67.875 J16.428 E.16294
G2 X125.558 Y121.8 I11.418 J1.377 E.38156
G1 X139.882 Y131.83 E.53728
G3 X145.001 Y141.665 I-6.915 J9.849 E.35407
G1 X145.001 Y150.497 E.2714
G3 X132.997 Y162.501 I-12.011 J-.007 E.5793
G1 X123.003 Y162.501 E.30711
G3 X110.999 Y150.497 I.006 J-12.01 E.57931
G1 X110.999 Y104.18 E1.42319
G3 X114.516 Y95.69 I12.055 J.02 E.28972
G1 X116.707 Y93.499 E.09521
G1 X139.293 Y93.499 E.69403
G1 X139.732 Y93.937 E.01906
G1 X141.484 Y95.69 E.07614
G3 X145.001 Y104.18 I-8.519 J8.502 E.28975
G1 X145.001 Y111.996 E.24015
G3 X140.496 Y116.501 I-4.504 J.002 E.21749
G1 X134.006 Y116.501 E.1994
G3 X132.876 Y115.99 I.002 J-1.51 E.0393
G1 X132.737 Y115.793 E.00742
M204 S6000
; WIPE_START
G1 F33600
G1 X132.677 Y115.703 E-.04109
G1 X132.596 Y115.53 E-.07259
G1 X132.511 Y115.19 E-.13285
G1 X132.499 Y114.993 E-.07505
G1 X132.499 Y113.839 E-.43843
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z8 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8 F4000
            G39.3 S1
            G0 Z8 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z8.4 F42000
G1 X125.074 Y122.483
G1 Z7.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.525211
G1 F13062.664
G3 X120.018 Y114.556 I7.094 J-10.1 E.37908
G3 X119.828 Y112.003 I13.291 J-2.275 E.10075
G1 X119.913 Y110.915 E.0429
G3 X121.122 Y105.092 I53.925 J8.16 E.23386
G1 X121.458 Y104.089 E.04157
G1 X121.716 Y103.487 E.02573
G1 X122.205 Y102.563 E.04109
G3 X123.89 Y100.574 I7.011 J4.234 E.10289
G3 X127.863 Y99.165 I4.031 J5.057 E.16873
G1 X129.01 Y99.181 E.04508
G3 X135.922 Y104.521 I-.516 J7.812 E.36415
G3 X136.319 Y106.499 I-7.487 J2.534 E.07952
G1 X136.335 Y108.183 E.06621
G1 X136.258 Y108.845 E.02618
G3 X135.949 Y109.704 I-2.749 J-.504 E.03604
G1 X135.579 Y110.274 E.02671
G1 X135.367 Y110.522 E.0128
G1 X133.569 Y112.32 E.09994
G1 X133.371 Y112.655 E.01528
G1 X133.335 Y112.871 E.00862
G1 X133.341 Y114.969 E.08247
G1 X133.412 Y115.284 E.01268
G1 X133.635 Y115.549 E.01361
G1 X134.045 Y115.665 E.01675
G1 X140.474 Y115.665 E.25266
G1 X141.086 Y115.616 E.02411
G1 X141.656 Y115.474 E.0231
G2 X143.969 Y113.154 I-1.23 J-3.538 E.13323
G2 X144.165 Y111.974 I-3.679 J-1.217 E.04721
G1 X144.165 Y104.191 E.30589
G2 X141.023 Y96.424 I-11.194 J.009 E.33746
G1 X139.042 Y94.431 E.11046
G2 X138.813 Y94.335 I-.207 J.175 E.01011
G1 X117.187 Y94.335 E.8499
G2 X116.958 Y94.43 I-.021 J.272 E.0101
G1 X115.115 Y96.274 E.10247
G2 X111.835 Y104.191 I7.982 J7.944 E.34549
G1 X111.835 Y150.487 E1.81945
G2 X123.013 Y161.665 I11.186 J-.009 E.68989
G1 X132.984 Y161.665 E.39188
G2 X144.165 Y150.487 I0 J-11.18 E.69009
G1 X144.165 Y141.675 E.34632
G2 X139.393 Y132.509 I-11.211 J.012 E.42204
G1 X125.124 Y122.518 E.68463
G1 X126.627 Y129.465 F42000
; LINE_WIDTH: 0.524922
G1 F13070.49
G1 X125.821 Y128.997 E.03661
G1 X124.809 Y128.593 E.04278
G1 X124.251 Y128.459 E.02254
G1 X123.328 Y128.342 E.03656
G1 X122.72 Y128.338 E.02388
G1 X121.969 Y128.42 E.02968
G1 X121.068 Y128.628 E.03628
G1 X120.355 Y128.915 E.0302
G1 X119.543 Y129.362 E.03641
G1 X118.814 Y129.916 E.03597
G1 X118.17 Y130.573 E.03614
G1 X117.714 Y131.183 E.0299
G1 X117.384 Y131.754 E.02592
G1 X116.965 Y132.759 E.04277
G1 X116.742 Y133.685 E.0374
G2 X116.665 Y134.652 I15.523 J1.729 E.0381
G1 X116.665 Y147.438 E.50218
G1 X116.744 Y148.376 E.03697
G1 X116.999 Y149.446 E.04323
G2 X117.88 Y151.157 I7.189 J-2.62 E.07576
G2 X118.514 Y151.903 I12.617 J-10.087 E.03848
G1 X123.376 Y156.765 E.27006
G2 X123.547 Y156.835 I.138 J-.093 E.00768
G1 X132.453 Y156.835 E.34982
G1 X132.593 Y156.793 E.00573
G1 X137.486 Y151.903 E.2717
M73 P78 R4
G1 X138.091 Y151.199 E.03646
G1 X138.442 Y150.662 E.0252
G1 X138.808 Y149.929 E.03221
G1 X139.162 Y148.891 E.04306
G1 X139.258 Y148.357 E.0213
G2 X139.335 Y147.437 I-11.021 J-1.387 E.03629
G1 X139.335 Y141.654 E.22715
G1 X139.246 Y140.638 E.04006
G1 X139.066 Y139.872 E.03089
G1 X138.751 Y139.025 E.03553
G1 X138.244 Y138.113 E.04097
G1 X137.924 Y137.688 E.0209
G1 X137.316 Y137.035 E.03503
G2 X136.64 Y136.477 I-7.375 J8.243 E.03444
G1 X126.676 Y129.5 E.47778
; WIPE_START
G1 F33600
G1 X128.314 Y130.647 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.909 Y132.497 Z8 F42000
G1 X116.296 Y133.65 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X116.733 Y132.085 I7.077 J1.13 E.05401
G1 X112.28 Y127.632 E.20888
G1 X112.28 Y128.368 E.02441
G1 X121.394 Y119.254 E.42754
G2 X125.206 Y123.118 I10.739 J-6.783 E.18145
G1 X119.305 Y128.975 E.2758
G2 X117.261 Y131.063 I3.704 J5.672 E.09769
G1 X112.28 Y136.044 E.23366
G1 X112.28 Y135.308 E.02441
G1 X116.22 Y139.248 E.18482
G1 X116.22 Y139.78 E.01766
G1 X112.28 Y143.72 E.18482
G1 X112.28 Y142.984 E.02441
G1 X116.22 Y146.924 E.18482
G1 X116.22 Y147.456 E.01765
G1 X112.318 Y151.358 E.18305
G3 X112.285 Y150.664 I6.743 J-.675 E.02303
G1 X122.836 Y161.215 E.49496
G2 X125.484 Y161.22 I1.413 J-51.719 E.08786
G1 X129.424 Y157.28 E.18482
G1 X126.576 Y157.28 E.09446
G1 X130.516 Y161.22 E.18482
G2 X133.164 Y161.215 I1.235 J-51.792 E.08786
G1 X143.715 Y150.664 E.49496
G3 X143.682 Y151.358 I-6.782 J.018 E.02303
G1 X139.78 Y147.456 E.18305
G1 X139.78 Y146.924 E.01765
G1 X143.72 Y142.984 E.18482
G1 X143.72 Y143.72 E.02441
G1 X139.384 Y139.384 E.20338
G1 X139.448 Y139.58 E.00681
G1 X142.437 Y136.591 E.14022
G2 X138.75 Y132.602 I-9.594 J5.171 E.18211
G1 X135.921 Y135.431 E.13271
G1 X134.285 Y134.285 E.06626
G1 X112.28 Y112.28 E1.03229
G1 X112.28 Y113.016 E.02441
G1 X120.879 Y104.417 E.40338
G3 X123.417 Y100.389 I8.605 J2.607 E.15985
G1 X117.808 Y94.78 E.26311
G1 X117.237 Y94.78 E.01893
G2 X113.89 Y98.538 I14.299 J16.107 E.16732
G1 X120.617 Y105.265 E.31556
G2 X120.228 Y106.846 I18.313 J5.339 E.05402
; WIPE_START
G1 F33600
G1 X120.617 Y105.265 E-.61863
G1 X120.353 Y105.002 E-.14137
; WIPE_END
G1 E-.04 F1800
G1 X127.691 Y102.899 Z8 F42000
G1 X134.23 Y101.025 Z8
G1 Z7.6
G1 E.8 F1800
G1 F15476.087
G1 X134.168 Y100.964 E.00287
G2 X132.952 Y100.02 I-6.186 J6.721 E.05113
G1 X138.192 Y94.78 E.24583
G1 X138.763 Y94.78 E.01893
G3 X141.649 Y97.845 I-30.859 J31.951 E.13971
G3 X142.109 Y98.539 I-5.42 J4.09 E.02764
G1 X136.331 Y104.317 E.27107
G1 X136.347 Y104.359 E.00148
G3 X136.72 Y106.016 I-8.506 J2.783 E.05641
G1 X143.591 Y112.888 E.32238
G2 X143.704 Y112.296 I-3.358 J-.947 E.02001
G1 X140.796 Y115.204 E.13645
G3 X138.248 Y115.22 I-1.422 J-24.21 E.08456
G1 X134.773 Y111.745 E.16303
G1 X133.883 Y112.635 E.04175
G2 X133.78 Y112.867 I.214 J.233 E.00865
G1 X133.78 Y114.544 E.05564
G1 X143.72 Y104.604 E.4663
G1 X143.72 Y105.34 E.02441
G1 X133.16 Y94.78 E.49539
G1 X130.516 Y94.78 E.0877
G1 X126.417 Y98.879 E.19228
G3 X129.484 Y98.781 I1.856 J10.001 E.10219
G1 X125.484 Y94.78 E.18767
G1 X122.84 Y94.78 E.0877
G1 X112.28 Y105.34 E.49539
G1 X112.28 Y104.604 E.02441
G1 X119.395 Y111.719 E.33376
G2 X119.438 Y113.534 I11.955 J.622 E.06029
G1 X112.28 Y120.692 E.3358
G1 X112.28 Y119.956 E.02441
G1 X120.633 Y128.309 E.39183
G3 X126.892 Y129.108 I2.365 J6.385 E.21764
G1 X129.721 Y126.279 E.13271
G1 X134.235 Y129.441 E.18283
G1 X131.407 Y132.269 E.13271
G1 X130.073 Y131.335 E.05401
; WIPE_START
G1 F33600
G1 X131.407 Y132.269 E-.61876
G1 X131.669 Y132.007 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X134.846 Y138.946 Z8 F42000
G1 X142.45 Y155.554 Z8
G1 Z7.6
G1 E.8 F1800
G1 F15476.087
G3 X141.571 Y156.923 I-8.89 J-4.744 E.05401
G1 X137.333 Y152.685 E.19881
G1 X133.495 Y156.523 E.18005
G1 X137.29 Y160.318 E.17805
G2 X138.728 Y159.557 I-6.8 J-14.582 E.05397
G1 X117.273 Y159.555 F42000
G1 F15476.087
G2 X118.71 Y160.318 I6.912 J-11.284 E.05399
G1 X122.505 Y156.523 E.17805
G1 X118.667 Y152.685 E.18005
G1 X114.428 Y156.924 E.19888
G3 X113.55 Y155.555 I10.51 J-7.7 E.05399
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X114.428 Y156.924 E-.61808
G1 X114.692 Y156.66 E-.14192
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/45
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
G17
G3 Z8 I.029 J1.217 P1  F42000
G1 X123.524 Y156.447 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X118.745 Y151.668 E.22418
G3 X116.994 Y147.44 I4.32 J-4.266 E.15563
G1 X116.994 Y134.649 E.42432
G3 X122.625 Y128.669 I6.005 J.013 E.30006
G3 X126.436 Y129.734 I.375 J6.008 E.13373
G1 X136.454 Y136.748 E.40569
G3 X139.006 Y141.651 I-3.49 J4.933 E.19044
G1 X139.006 Y147.44 E.19201
G3 X137.255 Y151.668 I-6.038 J-.024 E.1557
G1 X132.417 Y156.506 E.22698
G1 X123.583 Y156.506 E.29303
G1 X123.566 Y156.489 E.00081
G1 X123.746 Y156.114 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.027 Y151.396 E.20503
G3 X117.386 Y147.433 I4.034 J-3.993 E.13516
G1 X117.386 Y134.656 E.39259
G3 X122.647 Y129.06 I5.613 J.006 E.2599
G3 X126.217 Y130.059 I.353 J5.617 E.11608
G1 X136.223 Y137.065 E.37535
G3 X138.614 Y141.658 I-3.258 J4.615 E.16528
G1 X138.614 Y147.433 E.17743
G3 X136.973 Y151.396 I-5.645 J-.017 E.13521
G1 X132.254 Y156.114 E.20503
G1 X123.806 Y156.114 E.25961
M204 S6000
; WIPE_START
G1 F33600
G1 X122.382 Y154.709 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.399 Y147.348 Z8.2 F42000
G1 X133.132 Y115.464 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X133.006 Y114.98 I.896 J-.491 E.01678
G1 X133.006 Y112.847 E.07075
G3 X133.31 Y112.113 I1.03 J-.004 E.02707
G1 X135.137 Y110.286 E.08569
G2 X136.006 Y108.188 I-2.198 J-2.139 E.07718
G2 X135.941 Y106.009 I-16.357 J-.599 E.07234
G2 X128.51 Y99.494 I-7.447 J.998 E.35777
G2 X125.761 Y99.876 I-.409 J7.14 E.09267
G2 X122.691 Y102.4 I2.349 J5.986 E.13404
G2 X121.304 Y105.658 I9.024 J5.764 E.11799
G2 X120.235 Y110.943 I67.392 J16.384 E.17891
G2 X125.265 Y122.215 I11.922 J1.438 E.43
G1 X139.587 Y132.243 E.57997
G3 X144.494 Y141.67 I-6.62 J9.437 E.36639
G1 X144.494 Y150.492 E.29267
G3 X132.992 Y161.994 I-11.503 J-.002 E.59927
G1 X123.008 Y161.994 E.33122
G3 X111.506 Y150.492 I.021 J-11.522 E.599
G1 X111.506 Y104.185 E1.5361
G3 X114.878 Y96.045 I11.548 J.015 E.29987
G1 X116.917 Y94.006 E.09564
G1 X139.083 Y94.006 E.7353
G1 X139.607 Y94.53 E.02458
G3 X141.524 Y96.468 I-37.639 J39.154 E.09044
G3 X144.494 Y104.185 I-8.542 J7.717 E.28055
G1 X144.494 Y111.988 E.25882
G3 X140.488 Y115.994 I-4.001 J.005 E.20882
G1 X133.888 Y115.986 E.21894
G3 X133.162 Y115.516 I.14 J-1.012 E.02961
G1 X132.792 Y115.673 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.78 Y115.652 E.00073
G3 X132.614 Y114.993 I1.228 J-.66 E.02109
G1 X132.614 Y112.835 E.06631
G3 X133.025 Y111.844 I1.422 J.009 E.0338
G1 X134.852 Y110.016 E.07943
G2 X135.614 Y108.177 I-1.907 J-1.867 E.06268
G2 X135.552 Y106.061 I-15.94 J-.59 E.06509
G2 X128.503 Y99.886 I-7.058 J.945 E.31427
G2 X125.9 Y100.242 I-.4 J6.758 E.08125
G2 X123.016 Y102.62 I2.21 J5.62 E.11677
G2 X121.683 Y105.76 I8.691 J5.542 E.10533
G2 X120.624 Y110.99 I67.26 J16.334 E.16399
G2 X125.492 Y121.895 I11.533 J1.391 E.38539
G1 X139.815 Y131.924 E.53728
G3 X144.886 Y141.665 I-6.849 J9.756 E.35066
G1 X144.886 Y150.497 E.2714
G3 X132.997 Y162.386 I-11.895 J-.007 E.57373
G1 X123.003 Y162.386 E.30711
G3 X111.114 Y150.497 I.026 J-11.915 E.57347
G1 X111.114 Y104.18 E1.42319
G3 X114.597 Y95.771 I11.942 J.02 E.28693
G1 X116.754 Y93.614 E.09374
G1 X139.246 Y93.614 E.69109
G1 X139.884 Y94.253 E.02776
G3 X141.815 Y96.205 I-37.914 J39.432 E.08438
G3 X144.886 Y104.18 I-8.834 J7.98 E.26858
G1 X144.886 Y111.996 E.24015
G3 X140.496 Y116.386 I-4.389 J.001 E.21191
G1 X134.006 Y116.386 E.1994
G3 X132.961 Y115.912 I.002 J-1.394 E.03635
G1 X132.827 Y115.722 E.00715
M204 S6000
; WIPE_START
G1 F33600
G1 X132.78 Y115.652 E-.03181
G1 X132.703 Y115.488 E-.06901
G1 X132.627 Y115.182 E-.11967
G1 X132.614 Y114.993 E-.07202
G1 X132.614 Y113.763 E-.46751
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z8.2 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z8.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.2 F4000
            G39.3 S1
            G0 Z8.2 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z8.6 F42000
G1 X125.008 Y122.578
G1 Z7.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.524498
G1 F13082.011
G3 X124.126 Y121.898 I203.766 J-265.5 E.04371
G3 X119.905 Y114.576 I8.046 J-9.516 E.33836
G3 X119.713 Y112 I13.416 J-2.296 E.10154
G1 X119.798 Y110.901 E.04324
G3 X121.014 Y105.065 I52.443 J7.883 E.23406
G3 X121.591 Y103.467 I13.016 J3.799 E.06672
G1 X122.089 Y102.532 E.04157
G3 X123.38 Y100.877 I7.556 J4.563 E.08256
G3 X124.798 Y99.828 I5.107 J5.417 E.0694
G1 X125.591 Y99.466 E.0342
G1 X126.158 Y99.287 E.02333
M73 P79 R4
G1 X126.997 Y99.109 E.03365
G3 X127.863 Y99.049 I1.701 J18.438 E.03407
G1 X129.013 Y99.065 E.04515
G3 X130.015 Y99.199 I-.442 J7.141 E.03969
G1 X130.999 Y99.454 E.0399
G3 X136.435 Y106.49 I-2.514 J7.56 E.37014
G1 X136.451 Y108.183 E.06644
G1 X136.374 Y108.855 E.02653
G1 X136.173 Y109.515 E.02707
G1 X135.901 Y110.038 E.02315
G3 X135.448 Y110.604 I-6.976 J-5.117 E.02845
G1 X133.651 Y112.401 E.09973
G1 X133.482 Y112.685 E.01295
G1 X133.453 Y112.873 E.00746
G1 X133.451 Y114.952 E.0816
G1 X133.561 Y115.312 E.01477
G1 X133.818 Y115.511 E.01273
G1 X134.049 Y115.549 E.0092
G1 X140.474 Y115.549 E.25213
G1 X141.073 Y115.501 E.02357
G1 X141.631 Y115.358 E.02262
G1 X142.275 Y115.065 E.02776
G1 X142.766 Y114.722 E.02349
G1 X143.235 Y114.249 E.02617
G1 X143.548 Y113.803 E.02135
G1 X143.832 Y113.209 E.02586
G1 X143.991 Y112.621 E.0239
G2 X144.049 Y111.974 I-8.598 J-1.101 E.02549
G1 X144.049 Y104.191 E.30543
G2 X140.801 Y96.361 I-11.087 J.011 E.34132
G1 X138.993 Y94.546 E.10053
G2 X138.765 Y94.451 I-.207 J.175 E.01008
G1 X117.235 Y94.451 E.84489
G2 X117.006 Y94.546 I-.021 J.272 E.01008
G1 X115.196 Y96.355 E.10044
G2 X112.014 Y103.039 I7.87 J7.847 E.29615
G2 X111.951 Y104.195 I23.669 J1.865 E.04544
G1 X111.951 Y150.487 E1.8166
G2 X114.796 Y157.895 I11.198 J-.05 E.31833
G1 X115.589 Y158.694 E.0442
G2 X123.013 Y161.549 I7.443 J-8.275 E.31918
G1 X132.987 Y161.549 E.39139
G2 X139.513 Y159.42 I-.012 J-11.106 E.27387
G1 X140.389 Y158.713 E.0442
G2 X144.049 Y150.487 I-7.49 J-8.259 E.36369
G1 X144.049 Y141.675 E.3458
G2 X139.327 Y132.604 I-11.107 J.017 E.41704
G1 X125.057 Y122.612 E.68361
G1 X125.545 Y128.254 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X125.646 Y128.292 E.00357
G3 X126.975 Y129.025 I-3.02 J7.046 E.05043
G1 X129.638 Y126.362 E.12493
G1 X134.152 Y129.524 E.18283
G1 X131.489 Y132.187 E.12493
G1 X130.156 Y131.253 E.05401
G1 X126.694 Y129.371 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.526751
G1 F13021.095
G1 X125.9 Y128.899 E.03641
G1 X125.043 Y128.551 E.03647
G1 X124.247 Y128.34 E.03245
G1 X123.335 Y128.227 E.03623
G1 X122.401 Y128.246 E.03685
G2 X120.286 Y128.821 I.637 J6.52 E.08682
G1 X119.469 Y129.272 E.03681
G1 X118.732 Y129.834 E.03654
G1 X118.083 Y130.497 E.03657
G1 X117.773 Y130.892 E.0198
G1 X117.291 Y131.681 E.03644
G1 X116.908 Y132.567 E.03806
G1 X116.627 Y133.673 E.04498
G2 X116.549 Y134.652 I15.922 J1.766 E.03874
G1 X116.549 Y147.437 E.50405
G1 X116.619 Y148.37 E.03689
G2 X117.795 Y151.237 I6.669 J-1.061 E.12327
G2 X118.433 Y151.985 I13.007 J-10.448 E.03875
G1 X123.328 Y156.88 E.27296
G2 X123.499 Y156.951 I.138 J-.093 E.00771
G1 X132.501 Y156.951 E.35492
G1 X132.641 Y156.909 E.00575
G1 X137.568 Y151.984 E.27464
G1 X138.181 Y151.258 E.0375
G1 X138.56 Y150.693 E.02681
G2 X139.374 Y148.362 I-6.432 J-3.553 E.09783
G2 X139.451 Y147.437 I-11.212 J-1.395 E.03659
G1 X139.451 Y141.655 E.22798
G1 X139.38 Y140.764 E.0352
G1 X139.2 Y139.884 E.03544
G1 X138.891 Y139.039 E.03545
G1 X138.515 Y138.337 E.03141
G1 X138.003 Y137.602 E.0353
G1 X137.39 Y136.947 E.03538
G2 X136.706 Y136.382 I-7.504 J8.401 E.03497
G1 X126.743 Y129.406 E.47956
; WIPE_START
G1 F33600
G1 X128.381 Y130.553 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.124 Y123.262 Z8.2 F42000
G1 X120.522 Y105.17 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X113.976 Y98.624 E.3071
G3 X117.285 Y94.896 I17.206 J11.942 E.16576
G1 X117.923 Y94.896 E.02117
G1 X123.312 Y100.325 E.25375
G2 X120.696 Y104.6 I6.385 J6.845 E.1683
G1 X112.396 Y112.901 E.38938
G1 X112.396 Y112.396 E.01675
G1 X133.815 Y133.815 E1.00482
G1 X136.004 Y135.348 E.08866
G1 X138.667 Y132.685 E.12493
G3 X142.353 Y136.675 I-5.84 J9.091 E.18214
G1 X139.54 Y139.488 E.13195
G1 X143.604 Y143.604 E.1919
G1 X143.604 Y143.099 E.01675
G1 X139.896 Y146.808 E.17399
G1 X139.891 Y147.567 E.02517
G1 X143.572 Y151.248 E.17269
G2 X143.597 Y150.783 I-3.84 J-.435 E.01547
G1 X133.283 Y161.097 E.48384
G3 X130.401 Y161.104 I-1.59 J-55.996 E.09563
G1 X126.692 Y157.396 E.17399
G1 X129.308 Y157.396 E.0868
G1 X125.599 Y161.104 E.17399
G3 X122.714 Y161.094 I-1.292 J-41.239 E.09573
G1 X112.403 Y150.783 E.4837
G2 X112.426 Y151.25 I4.538 J.015 E.01552
G1 X116.109 Y147.567 E.17278
G1 X116.104 Y146.808 E.02517
G1 X112.396 Y143.099 E.17399
G1 X112.396 Y143.604 E.01675
G1 X116.104 Y139.896 E.17399
G1 X116.104 Y139.132 E.02532
G1 X112.396 Y135.423 E.17399
G1 X112.396 Y135.928 E.01675
G1 X116.926 Y131.398 E.21255
G3 X119.733 Y128.591 I6.099 J3.293 E.13354
G1 X125.123 Y123.201 E.25285
G1 X124.751 Y122.94 E.01508
G3 X121.31 Y119.338 I7.666 J-10.766 E.16623
G1 X112.396 Y128.252 E.4182
G1 X112.396 Y127.747 E.01675
G1 X116.644 Y131.996 E.19929
G1 X113.636 Y155.47 F42000
G1 F15476.087
G2 X114.509 Y156.843 I12.156 J-6.773 E.05399
G1 X118.586 Y152.766 E.19122
G1 X122.424 Y156.604 E.18005
G1 X118.797 Y160.231 E.17011
G3 X117.358 Y159.474 I6.696 J-14.494 E.05397
G1 X138.642 Y159.474 F42000
G1 F15476.087
G3 X137.203 Y160.231 I-8.138 J-13.743 E.05397
G1 X133.576 Y156.604 E.17012
G1 X137.414 Y152.766 E.18005
G1 X141.493 Y156.845 E.19135
G2 X142.363 Y155.471 I-14.127 J-9.91 E.05397
; WIPE_START
G1 F33600
G1 X141.493 Y156.845 E-.61808
G1 X141.229 Y156.581 E-.14192
; WIPE_END
G1 E-.04 F1800
G1 X140.287 Y149.007 Z8.2 F42000
G1 X134.311 Y100.944 Z8.2
G1 Z7.8
G1 E.8 F1800
G1 F15476.087
G1 X134.248 Y100.881 E.00296
G2 X133.035 Y99.937 I-6.261 J6.797 E.05105
G1 X138.077 Y94.896 E.2365
G1 X138.715 Y94.896 E.02117
G3 X142.023 Y98.625 I-13.795 J15.569 E.16577
G1 X136.421 Y104.227 E.26282
G1 X136.467 Y104.353 E.00444
G3 X136.848 Y106.144 I-8.994 J2.849 E.06085
G1 X143.499 Y112.795 E.312
G2 X143.571 Y112.429 I-4.018 J-.982 E.01238
G1 X140.929 Y115.071 E.12395
G3 X140.478 Y115.104 I-.422 J-2.634 E.01501
G1 X138.132 Y115.104 E.07782
G1 X134.854 Y111.826 E.15378
G1 X133.964 Y112.716 E.04175
G2 X133.896 Y112.865 I.129 J.15 E.00559
G1 X133.896 Y114.428 E.05187
G1 X143.604 Y104.72 E.45546
G1 X143.604 Y105.225 E.01675
G1 X133.275 Y94.896 E.48456
G1 X130.401 Y94.896 E.09536
G1 X126.56 Y98.736 E.18015
G3 X129.356 Y98.652 I1.702 J10.115 E.09306
G1 X125.599 Y94.896 E.17621
G1 X122.725 Y94.896 E.09536
G1 X112.396 Y105.225 E.48456
G1 X112.396 Y104.72 E.01675
G1 X119.283 Y111.607 E.32309
G2 X119.333 Y113.639 I12.43 J.709 E.06752
G1 X112.396 Y120.577 E.32545
G1 X112.396 Y120.072 E.01675
G1 X120.543 Y128.219 E.3822
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X119.129 Y126.805 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/45
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
G17
G3 Z8.2 I-1.204 J.176 P1  F42000
G1 X123.48 Y156.566 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X118.663 Y151.75 E.22595
G3 X116.878 Y147.44 I4.359 J-4.33 E.15871
G1 X116.878 Y134.649 E.42431
G3 X122.657 Y128.551 I6.121 J.013 E.30711
G3 X126.502 Y129.639 I.346 J6.118 E.13504
G1 X136.52 Y136.654 E.40568
G3 X139.122 Y141.651 I-3.557 J5.028 E.19412
G1 X139.122 Y147.44 E.19202
G3 X137.337 Y151.75 I-6.144 J-.02 E.15871
G1 X132.465 Y156.622 E.22856
G1 X123.535 Y156.622 E.2962
G1 X123.522 Y156.609 E.00062
G1 X123.698 Y156.23 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.946 Y151.478 E.2065
G3 X117.27 Y147.433 I4.076 J-4.058 E.138
G1 X117.27 Y134.656 E.39259
G3 X122.678 Y128.943 I5.729 J.006 E.26644
G3 X126.283 Y129.964 I.325 J5.726 E.1173
G1 X136.289 Y136.971 E.37534
G3 X138.73 Y141.658 I-3.324 J4.71 E.16868
G1 X138.73 Y147.433 E.17743
G3 X137.054 Y151.478 I-5.751 J-.013 E.138
G1 X132.302 Y156.23 E.2065
G1 X123.758 Y156.23 E.26255
M204 S6000
; WIPE_START
G1 F33600
G1 X122.335 Y154.824 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.369 Y147.468 Z8.4 F42000
G1 X133.235 Y115.414 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X133.122 Y114.979 I.79 J-.439 E.01506
G1 X133.122 Y112.848 E.07071
G3 X133.392 Y112.194 I.956 J.013 E.02404
G1 X135.219 Y110.368 E.08566
G2 X136.122 Y108.187 I-2.28 J-2.222 E.0802
G2 X136.056 Y106.003 I-16.546 J-.599 E.07256
G2 X128.51 Y99.378 I-7.567 J1.01 E.36351
G2 X125.72 Y99.768 I-.41 J7.25 E.09403
G2 X122.595 Y102.336 I2.338 J6.031 E.13647
G2 X121.197 Y105.611 I9.122 J5.829 E.11866
G2 X120.12 Y110.929 I59.853 J14.887 E.18006
G2 X125.198 Y122.309 I12.037 J1.452 E.43414
G1 X139.52 Y132.337 E.57997
G3 X144.378 Y141.67 I-6.554 J9.342 E.36272
G1 X144.378 Y150.492 E.29267
G3 X132.992 Y161.878 I-11.404 J-.018 E.59302
G1 X123.008 Y161.878 E.33121
G3 X111.622 Y150.492 I0 J-11.386 E.59328
G1 X111.622 Y104.185 E1.53609
G3 X114.96 Y96.127 I11.4 J.001 E.29692
G1 X116.965 Y94.122 E.09405
G1 X139.035 Y94.122 E.73213
G1 X141.04 Y96.127 E.09406
G3 X144.378 Y104.185 I-8.062 J8.06 E.29691
G1 X144.378 Y111.988 E.25882
G3 X140.488 Y115.878 I-3.887 J.003 E.20277
G1 X133.912 Y115.872 E.21813
G3 X133.266 Y115.465 I.113 J-.896 E.02613
G1 X132.884 Y115.601 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X132.73 Y114.993 I1.124 J-.61 E.01949
G1 X132.73 Y112.835 E.0663
G3 X133.106 Y111.925 I1.371 J.035 E.03095
G1 X134.934 Y110.098 E.07942
G2 X135.73 Y108.177 I-1.989 J-1.949 E.06547
G2 X135.667 Y106.054 I-16.129 J-.59 E.06531
G2 X128.503 Y99.77 I-7.178 J.958 E.31958
G2 X125.86 Y100.134 I-.402 J6.867 E.08252
G2 X122.92 Y102.555 I2.199 J5.666 E.11902
G2 X121.576 Y105.713 I8.789 J5.606 E.10595
G2 X120.51 Y110.976 I59.602 J14.813 E.16506
M73 P80 R4
G2 X125.426 Y121.99 I11.648 J1.405 E.38922
G1 X139.749 Y132.019 E.53728
G3 X144.77 Y141.665 I-6.784 J9.661 E.34725
G1 X144.77 Y150.497 E.2714
G3 X132.997 Y162.27 I-11.797 J-.024 E.56793
G1 X123.003 Y162.27 E.30711
G3 X111.23 Y150.497 I.005 J-11.778 E.56818
G1 X111.23 Y104.18 E1.42319
G3 X114.679 Y95.853 I11.792 J.006 E.28419
G1 X116.802 Y93.73 E.09227
G1 X139.198 Y93.73 E.68815
G1 X141.321 Y95.853 E.09227
G3 X144.77 Y104.18 I-8.342 J8.334 E.28419
G1 X144.77 Y111.996 E.24014
G3 X140.496 Y116.27 I-4.28 J-.005 E.20626
G1 X134.006 Y116.27 E.1994
G3 X132.914 Y115.653 I.002 J-1.279 E.04029
M204 S6000
; WIPE_START
G1 F33600
G1 X132.811 Y115.446 E-.08815
G1 X132.742 Y115.172 E-.10704
G1 X132.73 Y114.993 E-.06843
G1 X132.73 Y113.686 E-.49638
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z8.4 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z8.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.4 F4000
            G39.3 S1
            G0 Z8.4 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z8.8 F42000
G1 X124.942 Y122.672
G1 Z8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.525327
G1 F13059.509
G3 X119.731 Y110.5 I7.248 J-10.304 E.54802
G3 X120.585 Y106.23 I106.669 J19.105 E.17119
G3 X121.241 Y104.008 I17.024 J3.824 E.09114
G1 X121.477 Y103.455 E.02362
G1 X121.969 Y102.496 E.04238
G3 X123.962 Y100.232 I7.031 J4.179 E.11924
G1 X124.744 Y99.727 E.0366
G1 X125.552 Y99.361 E.03487
G1 X126.128 Y99.175 E.02379
G3 X127.863 Y98.936 I1.797 J6.623 E.06905
G1 X129.015 Y98.95 E.04528
G3 X136.561 Y106.992 I-.522 J8.051 E.47731
G1 X136.566 Y108.183 E.04679
G1 X136.488 Y108.871 E.02724
G1 X136.298 Y109.513 E.02631
G1 X135.992 Y110.108 E.02632
G3 X135.529 Y110.686 I-7.197 J-5.298 E.0291
G1 X133.733 Y112.483 E.09989
G1 X133.604 Y112.707 E.01015
G1 X133.566 Y112.883 E.0071
G1 X133.568 Y114.951 E.0813
G1 X133.648 Y115.227 E.01128
G1 X133.788 Y115.353 E.00739
G1 X134.051 Y115.434 E.01081
G1 X140.474 Y115.434 E.25249
G1 X141.059 Y115.386 E.0231
G1 X141.6 Y115.248 E.02192
G1 X142.208 Y114.973 E.02624
G1 X142.691 Y114.64 E.02306
G1 X143.116 Y114.219 E.0235
G1 X143.443 Y113.763 E.02208
G1 X143.721 Y113.172 E.02566
G1 X143.876 Y112.608 E.02299
G2 X143.934 Y111.974 I-8.221 J-1.071 E.02505
G1 X143.934 Y104.191 E.30594
G2 X140.379 Y96.094 I-11.136 J.06 E.35743
G1 X138.946 Y94.661 E.07969
G2 X138.717 Y94.566 I-.207 J.177 E.0101
G1 X117.283 Y94.566 E.84259
G2 X117.054 Y94.661 I-.021 J.272 E.0101
G1 X115.278 Y96.437 E.09873
G2 X112.13 Y103.043 I7.776 J7.759 E.29327
G2 X112.066 Y104.195 I21.92 J1.79 E.04534
G1 X112.066 Y150.487 E1.81974
G2 X113.855 Y156.485 I11.027 J-.023 E.24946
G1 X114.503 Y157.378 E.04337
G1 X114.879 Y157.814 E.02266
G1 X115.669 Y158.611 E.04409
G2 X123.017 Y161.434 I7.369 J-8.207 E.31641
G1 X132.987 Y161.434 E.39191
G2 X143.934 Y150.487 I-.003 J-10.949 E.6759
G1 X143.934 Y141.675 E.34639
G2 X143.462 Y138.49 I-11.61 J.092 E.12699
G2 X139.261 Y132.699 I-10.495 J3.194 E.28648
G1 X124.991 Y122.706 E.68481
G1 X126.76 Y129.277 F42000
; LINE_WIDTH: 0.524791
G1 F13074.039
G1 X125.96 Y128.8 E.03658
G2 X124.253 Y128.224 I-3.481 J7.499 E.07087
G1 X123.378 Y128.106 E.03466
G2 X120.528 Y128.585 I-.315 J6.852 E.11436
G2 X119.392 Y129.184 I2.535 J6.18 E.0505
G1 X118.65 Y129.753 E.0367
G1 X117.996 Y130.421 E.03672
G1 X117.684 Y130.819 E.01986
G1 X117.195 Y131.613 E.03662
G1 X116.807 Y132.507 E.03826
G1 X116.512 Y133.665 E.04691
G2 X116.434 Y134.652 I16.131 J1.777 E.03891
G1 X116.434 Y147.437 E.50201
G1 X116.503 Y148.379 E.03708
G2 X117.707 Y151.312 I6.794 J-1.074 E.12565
G2 X118.351 Y152.066 I13.206 J-10.626 E.03894
G1 X123.281 Y156.996 E.27373
M73 P80 R3
G2 X123.451 Y157.066 I.138 J-.093 E.00768
G1 X132.549 Y157.066 E.35724
G1 X132.688 Y157.024 E.00572
G1 X137.649 Y152.066 E.27541
G1 X138.269 Y151.333 E.03767
G2 X139.49 Y148.369 I-5.346 J-3.936 E.12713
G2 X139.566 Y147.437 I-11.349 J-1.401 E.03674
G1 X139.566 Y141.655 E.22705
G1 X139.494 Y140.754 E.03549
G1 X139.314 Y139.865 E.03561
G1 X139.027 Y139.067 E.03328
G1 X138.605 Y138.264 E.03565
G1 X138.085 Y137.52 E.03562
G1 X137.465 Y136.858 E.03564
G2 X136.773 Y136.288 I-7.639 J8.566 E.03522
G1 X126.809 Y129.311 E.47761
G1 X130.239 Y131.17 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X131.572 Y132.104 E.05401
G1 X134.07 Y129.606 E.11715
G1 X129.555 Y126.445 E.18283
G1 X127.058 Y128.942 E.11715
G1 X127.003 Y128.904 E.0022
G2 X125.632 Y128.164 I-3.868 J5.523 E.05182
G1 X120.453 Y128.129 F42000
G1 F15476.087
G1 X112.511 Y120.187 E.37258
G1 X112.511 Y120.461 E.00909
G1 X119.226 Y113.746 E.31502
G3 X119.18 Y111.504 I11.23 J-1.352 E.0745
G1 X112.511 Y104.835 E.31286
G1 X112.511 Y105.109 E.00909
G1 X122.609 Y95.011 E.47372
G1 X125.715 Y95.011 E.10302
G1 X129.227 Y98.524 E.16478
G2 X126.706 Y98.59 I-.982 J10.552 E.08387
G1 X130.285 Y95.011 E.16791
G1 X133.391 Y95.011 E.10302
G1 X143.489 Y105.109 E.47372
G1 X143.489 Y104.835 E.00909
G1 X134.013 Y114.312 E.44456
G1 X134.011 Y112.896 E.04695
G3 X134.046 Y112.798 I.127 J-.01 E.00356
G1 X134.936 Y111.908 E.04175
G1 X138.017 Y114.989 E.14453
G2 X140.755 Y114.977 I1.231 J-31.921 E.09087
G2 X141.069 Y114.931 I-.11 J-1.845 E.01052
G1 X143.431 Y112.569 E.11083
G1 X143.403 Y112.699 E.00442
G1 X136.976 Y106.273 E.30147
G2 X136.511 Y104.137 I-8.503 J.735 E.0727
G1 X141.943 Y98.705 E.25484
G2 X140.064 Y96.408 I-9.491 J5.849 E.09872
G1 X138.667 Y95.011 E.06555
G1 X137.961 Y95.011 E.02342
G1 X133.119 Y99.854 E.22717
G3 X134.393 Y100.862 I-4.308 J6.754 E.05402
; WIPE_START
G1 F33600
G1 X133.119 Y99.854 E-.61775
G1 X133.383 Y99.589 E-.14225
; WIPE_END
G1 E-.04 F1800
G1 X125.851 Y100.82 Z8.4 F42000
G1 X122.155 Y101.424 Z8.4
G1 Z8
G1 E.8 F1800
G1 F15476.087
G1 X122.156 Y101.422 E.00008
G3 X123.253 Y100.225 I6.855 J5.182 E.05393
G1 X118.039 Y95.011 E.2446
G1 X117.333 Y95.011 E.02342
G2 X114.056 Y98.704 I13.834 J15.573 E.16417
G1 X120.427 Y105.075 E.29887
G1 X120.513 Y104.783 E.01009
G1 X112.511 Y112.785 E.37538
G1 X112.511 Y112.511 E.00909
G1 X133.344 Y133.344 E.97734
G1 X136.087 Y135.265 E.11106
G1 X138.584 Y132.768 E.11715
G3 X142.267 Y136.76 I-5.77 J9.018 E.18219
G1 X139.633 Y139.395 E.1236
G1 X139.744 Y139.744 E.01213
G1 X143.489 Y143.489 E.1757
G1 X143.489 Y143.215 E.00909
G1 X140.011 Y146.693 E.16316
G3 X140.003 Y147.679 I-13.765 J.376 E.03271
G1 X143.467 Y151.143 E.16251
G2 X143.478 Y150.902 I-2.317 J-.231 E.00801
G1 X133.404 Y160.976 E.4726
G3 X130.285 Y160.989 I-1.769 J-49.455 E.10348
G1 X126.807 Y157.511 E.16316
G1 X129.193 Y157.511 E.07914
G1 X125.715 Y160.989 E.16315
G3 X122.598 Y160.978 I-1.351 J-60.089 E.10339
G1 X112.522 Y150.902 E.47271
G2 X112.533 Y151.143 I2.327 J.011 E.00801
G1 X115.997 Y147.679 E.16251
G1 X115.989 Y147.451 E.00755
G3 X115.989 Y146.693 I21.1 J-.383 E.02516
G1 X112.511 Y143.215 E.16316
G1 X112.511 Y143.489 E.00909
G1 X115.989 Y140.011 E.16316
G1 X115.989 Y139.017 E.03298
G1 X112.511 Y135.539 E.16316
G1 X112.511 Y135.813 E.00909
G1 X116.67 Y131.654 E.19512
G1 X116.555 Y131.907 E.00923
G1 X112.511 Y127.863 E.18971
G1 X112.511 Y128.137 E.00909
G1 X121.225 Y119.423 E.40881
G2 X125.04 Y123.284 I10.9 J-6.954 E.1814
G1 X120 Y128.324 E.23644
G2 X118.624 Y129.187 I2.829 J6.043 E.05402
; WIPE_START
G1 F33600
G1 X119.152 Y128.799 E-.249
G1 X120 Y128.324 E-.36941
G1 X120.264 Y128.061 E-.14159
; WIPE_END
G1 E-.04 F1800
G1 X119.579 Y135.662 Z8.4 F42000
G1 X117.443 Y159.391 Z8.4
G1 Z8
G1 E.8 F1800
G1 F15476.087
G2 X118.885 Y160.143 I7.262 J-12.162 E.05398
G1 X122.342 Y156.686 E.16216
G1 X118.504 Y152.848 E.18005
G1 X114.591 Y156.761 E.18357
G3 X113.724 Y155.385 I11.675 J-8.321 E.05397
; WIPE_START
G1 F33600
G1 X114.591 Y156.761 E-.61798
G1 X114.855 Y156.497 E-.14202
; WIPE_END
G1 E-.04 F1800
G1 X122.481 Y156.188 Z8.4 F42000
G1 X142.278 Y155.387 Z8.4
G1 Z8
G1 E.8 F1800
G1 F15476.087
G3 X141.411 Y156.763 I-15.06 J-8.526 E.05397
G1 X137.496 Y152.848 E.18365
G1 X133.658 Y156.686 E.18005
G1 X137.115 Y160.143 E.16216
G2 X138.557 Y159.391 I-6.468 J-14.175 E.05397
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X137.115 Y160.143 E-.61799
G1 X136.851 Y159.878 E-.14201
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/45
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
M106 S170.85
G17
G3 Z8.4 I.282 J-1.184 P1  F42000
G1 X123.436 Y156.686 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X118.582 Y151.831 E.22772
G3 X116.763 Y147.44 I4.445 J-4.413 E.16172
G1 X116.763 Y134.649 E.4243
G3 X122.688 Y128.434 I6.236 J.013 E.31418
G3 X126.568 Y129.545 I.317 J6.229 E.13635
G1 X136.586 Y136.559 E.40567
M73 P81 R3
G3 X139.237 Y141.652 I-3.623 J5.122 E.19781
G1 X139.237 Y147.44 E.19202
G3 X137.418 Y151.831 I-6.264 J-.022 E.16172
G1 X132.512 Y156.737 E.23014
G1 X123.488 Y156.737 E.29937
G1 X123.478 Y156.728 E.00043
G1 X123.648 Y156.343 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.864 Y151.559 E.20788
G3 X117.155 Y147.433 I4.162 J-4.141 E.14079
G1 X117.155 Y134.656 E.39259
G3 X122.709 Y128.825 I5.844 J.006 E.27297
G3 X126.349 Y129.87 I.295 J5.837 E.11851
G1 X136.356 Y136.876 E.37534
G3 X138.845 Y141.658 I-3.391 J4.804 E.17209
G1 X138.845 Y147.433 E.17743
G3 X137.136 Y151.559 I-5.872 J-.015 E.14079
G1 X132.35 Y156.345 E.20797
G1 X123.707 Y156.345 E.26558
M204 S6000
; WIPE_START
G1 F33600
G1 X122.284 Y154.939 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.34 Y147.589 Z8.6 F42000
G1 X133.346 Y115.386 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X133.287 Y115.264 E.00452
G3 X133.237 Y114.978 I.722 J-.272 E.00967
G1 X133.237 Y112.848 E.07066
G3 X133.475 Y112.275 I.798 J-.005 E.02113
G1 X135.3 Y110.45 E.08564
G2 X136.237 Y108.187 I-2.362 J-2.304 E.08322
G2 X136.172 Y105.996 I-16.736 J-.598 E.07278
G2 X128.51 Y99.263 I-7.682 J1.016 E.36931
G2 X125.68 Y99.66 I-.411 J7.359 E.0954
G2 X122.499 Y102.271 I2.429 J6.2 E.13878
G2 X121.086 Y105.582 I9.218 J5.894 E.11994
G2 X120.006 Y110.916 I59.827 J14.888 E.18058
G2 X125.132 Y122.404 I12.152 J1.465 E.43828
G1 X139.454 Y132.432 E.57996
G3 X144.263 Y141.67 I-6.488 J9.248 E.35904
G1 X144.263 Y150.492 E.29266
G3 X132.992 Y161.763 I-11.272 J-.002 E.58724
G1 X123.008 Y161.763 E.33121
G3 X111.737 Y150.492 I-.001 J-11.269 E.58728
G1 X111.737 Y104.185 E1.53609
G3 X115.041 Y96.208 I11.319 J.015 E.29386
G1 X117.012 Y94.237 E.09247
G1 X138.988 Y94.237 E.72895
G1 X139.912 Y95.161 E.04335
G3 X141.731 Y97.063 I-17.831 J18.878 E.08733
G3 X144.263 Y104.185 I-8.756 J7.124 E.2557
G1 X144.263 Y111.987 E.25881
G3 X140.488 Y115.763 I-3.769 J.006 E.19681
G1 X134.022 Y115.763 E.21449
G3 X133.379 Y115.437 I-.013 J-.771 E.02488
G1 X132.983 Y115.531 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.957 Y115.49 E.00149
G3 X132.845 Y114.992 I1.051 J-.498 E.01579
G1 X132.845 Y112.835 E.06628
G3 X133.188 Y112.007 I1.19 J.008 E.02825
G1 X135.016 Y110.18 E.07941
G2 X135.845 Y108.177 I-2.071 J-2.031 E.06826
G2 X135.783 Y106.047 I-16.319 J-.59 E.06553
G2 X128.503 Y99.655 I-7.293 J.965 E.32493
G2 X125.819 Y100.026 I-.403 J6.977 E.08379
G2 X122.824 Y102.491 I2.29 J5.834 E.12116
G2 X121.464 Y105.684 I8.885 J5.671 E.10713
G2 X120.395 Y110.963 I59.573 J14.813 E.16555
G2 X125.36 Y122.084 I11.762 J1.418 E.39305
G1 X139.683 Y132.114 E.53728
G3 X144.655 Y141.665 I-6.718 J9.567 E.34385
G1 X144.655 Y150.497 E.2714
G3 X132.997 Y162.155 I-11.664 J-.007 E.56258
G1 X123.003 Y162.155 E.30711
G3 X111.345 Y150.497 I.004 J-11.661 E.56262
G1 X111.345 Y104.18 E1.42319
G3 X114.761 Y95.934 I11.712 J.021 E.28136
G1 X116.85 Y93.845 E.09079
G1 X139.15 Y93.845 E.68521
G1 X140.189 Y94.884 E.04514
G3 X142.035 Y96.815 I-18.066 J19.117 E.08212
G3 X144.655 Y104.18 I-9.061 J7.372 E.24494
G1 X144.655 Y111.996 E.24014
G3 X140.496 Y116.155 I-4.161 J-.002 E.20073
G1 X134.008 Y116.155 E.19936
G3 X133.131 Y115.756 I.001 J-1.163 E.0305
G1 X133.016 Y115.581 E.00644
M204 S6000
; WIPE_START
G1 F33600
G1 X132.957 Y115.49 E-.04126
G1 X132.873 Y115.25 E-.09654
G1 X132.845 Y114.992 E-.09843
G1 X132.845 Y113.614 E-.52377
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z8.6 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z8.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.6 F4000
            G39.3 S1
            G0 Z8.6 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z9 F42000
G1 X141.657 Y115.403
G1 Z8.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.401464
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X143.548 Y113.488 E.13878
G2 X143.848 Y112.542 I-3.025 J-1.481 E.0514
G1 X141.084 Y115.34 E.20287
G3 X140.397 Y115.393 I-.645 J-3.914 E.03556
G1 X143.893 Y111.854 E.25658
G1 X143.893 Y111.211 E.03313
G1 X139.763 Y115.393 E.30315
G1 X139.128 Y115.393 E.03273
G1 X143.893 Y110.569 E.34972
G1 X143.893 Y109.926 E.03313
G1 X138.494 Y115.393 E.3963
G1 X137.859 Y115.393 E.03273
G1 X143.893 Y109.284 E.44287
G1 X143.893 Y108.641 E.03313
G1 X137.224 Y115.393 E.48944
G1 X136.59 Y115.393 E.03273
G1 X143.893 Y107.999 E.53601
G1 X143.893 Y107.356 E.03313
G1 X135.955 Y115.393 E.58259
G1 X135.321 Y115.393 E.03273
G1 X143.893 Y106.714 E.62916
G1 X143.893 Y106.072 E.03314
G1 X134.686 Y115.393 E.67573
G1 X134.052 Y115.393 E.03273
G1 X143.893 Y105.429 E.7223
G1 X143.893 Y104.787 E.03313
G1 X133.645 Y115.162 E.75213
G1 X133.636 Y115.141 E.00121
G3 X133.607 Y114.559 I1.766 J-.379 E.03019
G1 X143.891 Y104.146 E.75481
G1 X143.866 Y103.529 E.03186
G1 X133.607 Y113.916 E.75298
G1 X133.607 Y113.274 E.03313
G1 X143.812 Y102.941 E.74902
G2 X143.739 Y102.373 I-4.211 J.253 E.02958
G1 X135.902 Y110.308 E.57521
G2 X136.209 Y109.819 I-2.19 J-1.719 E.02983
G1 X136.437 Y109.27 E.03065
G1 X136.489 Y109.071 E.01062
G1 X143.635 Y101.836 E.52446
G2 X143.509 Y101.321 I-5.109 J.98 E.02734
G1 X136.601 Y108.315 E.50701
G2 X136.602 Y107.671 I-5.25 J-.332 E.03322
G1 X143.362 Y100.827 E.49616
G2 X143.197 Y100.352 I-3.906 J1.094 E.02596
G1 X136.596 Y107.035 E.48446
G2 X136.584 Y106.405 I-3.566 J-.245 E.03254
G1 X143.009 Y99.899 E.47161
G2 X142.812 Y99.456 I-3.664 J1.365 E.02502
G1 X136.519 Y105.828 E.46188
G2 X136.42 Y105.286 I-4.205 J.485 E.02846
G1 X142.597 Y99.032 E.45336
G2 X142.367 Y98.622 I-3.17 J1.514 E.02424
G1 X136.291 Y104.774 E.44591
G2 X136.135 Y104.29 I-2.976 J.698 E.02625
G1 X142.116 Y98.234 E.43903
G2 X141.86 Y97.851 I-2.786 J1.588 E.02379
G1 X135.953 Y103.831 E.43354
G2 X135.754 Y103.391 I-2.753 J.98 E.02497
G1 X141.586 Y97.486 E.42805
G2 X141.302 Y97.131 I-2.878 J2.013 E.02346
G1 X135.531 Y102.973 E.42352
G2 X135.289 Y102.576 I-3.164 J1.656 E.02401
G1 X141.003 Y96.791 E.41933
G1 X140.691 Y96.464 E.0233
G1 X135.028 Y102.198 E.4157
G1 X134.744 Y101.843 E.02345
G1 X140.372 Y96.145 E.41309
G1 X140.053 Y95.825 E.02328
G1 X134.445 Y101.503 E.41161
G1 X134.133 Y101.177 E.02329
G1 X139.734 Y95.506 E.41108
G1 X139.415 Y95.187 E.02328
G1 X133.801 Y100.871 E.41203
G2 X133.449 Y100.584 I-2.372 J2.548 E.02341
G1 X139.095 Y94.868 E.41439
G1 X138.834 Y94.607 E.01903
G1 X138.718 Y94.607 E.00598
G1 X133.08 Y100.315 E.41381
G2 X132.693 Y100.065 I-2.111 J2.84 E.0238
G1 X138.084 Y94.607 E.39566
G1 X137.449 Y94.607 E.03273
G1 X132.286 Y99.834 E.37895
G1 X131.853 Y99.63 E.02468
G1 X136.815 Y94.607 E.36414
G1 X136.18 Y94.607 E.03273
G1 X131.409 Y99.438 E.3502
G2 X130.936 Y99.274 I-1.235 J2.809 E.02585
G1 X135.546 Y94.607 E.33835
G1 X134.911 Y94.607 E.03273
G1 X130.44 Y99.133 E.32814
G2 X129.91 Y99.027 I-.832 J2.78 E.02791
G1 X134.277 Y94.607 E.32045
G1 X133.642 Y94.607 E.03273
G1 X129.36 Y98.942 E.31429
G2 X128.762 Y98.906 I-.518 J3.549 E.03095
G1 X133.007 Y94.607 E.31163
G1 X132.373 Y94.607 E.03273
G1 X128.136 Y98.897 E.31099
G2 X127.489 Y98.91 I-.216 J5.465 E.0334
G1 X131.738 Y94.607 E.31191
G1 X131.104 Y94.607 E.03273
G1 X126.775 Y98.99 E.31774
G2 X125.949 Y99.184 I.745 J5.034 E.0438
G1 X130.469 Y94.607 E.33178
G1 X129.835 Y94.607 E.03273
G1 X124.903 Y99.6 E.36196
G2 X123.962 Y100.172 I3.861 J7.413 E.0568
G2 X121.757 Y102.785 I4.929 J6.397 E.17774
G1 X112.107 Y112.556 E.70825
G1 X112.107 Y113.198 E.03313
G1 X121.206 Y103.986 E.66781
G1 X120.881 Y104.958 E.05285
G1 X112.107 Y113.84 E.64394
G1 X112.107 Y114.483 E.03313
G1 X120.648 Y105.835 E.62688
G2 X120.438 Y106.691 I9.148 J2.703 E.04545
G1 X112.107 Y115.125 E.61143
G1 X112.107 Y115.768 E.03313
G1 X120.266 Y107.507 E.59882
G1 X120.094 Y108.324 E.04303
G1 X112.107 Y116.41 E.58621
M73 P82 R3
G1 X112.107 Y117.053 E.03313
G1 X119.943 Y109.119 E.57513
G1 X119.798 Y109.908 E.0414
G1 X112.107 Y117.695 E.56447
G1 X112.107 Y118.338 E.03313
G1 X119.67 Y110.681 E.55507
G1 X119.594 Y111.4 E.03731
G1 X112.107 Y118.98 E.54949
G1 X112.107 Y119.623 E.03313
G1 X119.557 Y112.08 E.54677
G2 X119.558 Y112.721 I5.405 J.31 E.03309
G1 X112.107 Y120.265 E.54686
G1 X112.107 Y120.907 E.03313
G1 X119.591 Y113.33 E.5493
G1 X119.651 Y113.912 E.03017
G1 X112.107 Y121.55 E.55369
G1 X112.107 Y122.192 E.03313
G1 X119.731 Y114.473 E.55958
G1 X119.835 Y115.01 E.02821
G1 X112.107 Y122.835 E.56722
G1 X112.107 Y123.477 E.03314
G1 X119.953 Y115.533 E.57586
G1 X120.09 Y116.037 E.02693
G1 X112.107 Y124.12 E.58591
G1 X112.107 Y124.762 E.03313
G1 X120.248 Y116.519 E.59753
G2 X120.422 Y116.986 I4.987 J-1.59 E.02569
G1 X112.107 Y125.405 E.61027
G1 X112.107 Y126.047 E.03313
G1 X120.61 Y117.438 E.62407
G2 X120.813 Y117.875 I3.594 J-1.407 E.02486
G1 X112.107 Y126.69 E.63899
G1 X112.107 Y127.332 E.03313
G1 X121.031 Y118.297 E.65497
G2 X121.257 Y118.71 I2.606 J-1.16 E.02433
G1 X112.107 Y127.974 E.67159
G1 X112.107 Y128.617 E.03313
G1 X121.503 Y119.103 E.68966
G1 X121.75 Y119.497 E.02393
G1 X112.107 Y129.259 E.70772
G1 X112.107 Y129.902 E.03313
G1 X122.022 Y119.864 E.72769
G1 X122.297 Y120.227 E.02353
G1 X112.107 Y130.544 E.7479
G1 X112.107 Y131.187 E.03313
G1 X122.585 Y120.578 E.76902
G1 X122.889 Y120.913 E.02332
G1 X112.107 Y131.829 E.79133
G1 X112.107 Y132.472 E.03313
G1 X123.193 Y121.248 E.81364
G2 X123.523 Y121.555 I1.89 J-1.701 E.02333
G1 X112.107 Y133.114 E.83791
G1 X112.107 Y133.757 E.03313
G1 X123.856 Y121.861 E.8623
G2 X124.201 Y122.154 I1.814 J-1.791 E.02338
G1 X112.107 Y134.399 E.88765
G1 X112.107 Y135.042 E.03313
G1 X124.562 Y122.431 E.91412
G2 X124.923 Y122.708 I3.273 J-3.892 E.02347
G1 X112.107 Y135.684 E.94061
G1 X112.107 Y136.326 E.03313
G1 X125.298 Y122.971 E.96815
G1 X125.673 Y123.234 E.02362
G1 X120.368 Y128.605 E.38934
G3 X121.334 Y128.269 I2.716 J6.264 E.05277
G1 X126.048 Y123.496 E.346
G1 X126.423 Y123.759 E.02362
G1 X122.115 Y128.121 E.31623
G3 X122.806 Y128.064 I.632 J3.41 E.03584
G1 X126.798 Y124.022 E.29302
G1 X127.174 Y124.284 E.02362
G1 X123.435 Y128.069 E.27438
G3 X124.005 Y128.134 I-.155 J3.9 E.02964
G1 X127.549 Y124.547 E.26005
G1 X127.924 Y124.81 E.02362
G1 X124.536 Y128.239 E.24862
G3 X125.029 Y128.383 I-.527 J2.729 E.02651
G1 X128.299 Y125.072 E.23998
G1 X128.674 Y125.335 E.02362
G1 X125.503 Y128.546 E.23277
G3 X125.941 Y128.744 I-.82 J2.401 E.02487
G1 X129.049 Y125.598 E.22809
G1 X129.424 Y125.86 E.02362
G1 X126.354 Y128.969 E.22532
G3 X126.743 Y129.217 I-1.492 J2.762 E.02383
G1 X129.799 Y126.123 E.22431
G1 X130.174 Y126.386 E.02362
G1 X127.119 Y129.479 E.22423
G1 X127.494 Y129.742 E.02362
G1 X130.55 Y126.648 E.22423
G1 X130.925 Y126.911 E.02362
G1 X127.87 Y130.004 E.22423
G1 X128.245 Y130.267 E.02362
G1 X131.3 Y127.174 E.22423
G1 X131.675 Y127.436 E.02362
G1 X128.62 Y130.53 E.22423
G1 X128.995 Y130.792 E.02362
G1 X132.05 Y127.699 E.22423
G1 X132.425 Y127.962 E.02362
G1 X129.37 Y131.055 E.22423
G1 X129.745 Y131.318 E.02362
G1 X132.8 Y128.224 E.22423
G1 X133.175 Y128.487 E.02362
G1 X130.12 Y131.58 E.22423
G1 X130.495 Y131.843 E.02362
G1 X133.551 Y128.75 E.22423
G1 X133.926 Y129.012 E.02362
G1 X130.87 Y132.106 E.22423
G1 X131.246 Y132.368 E.02362
G1 X134.301 Y129.275 E.22423
G1 X134.676 Y129.538 E.02362
G1 X131.621 Y132.631 E.22423
G1 X131.996 Y132.894 E.02362
G1 X135.051 Y129.8 E.22423
G1 X135.426 Y130.063 E.02362
G1 X132.371 Y133.156 E.22423
G1 X132.746 Y133.419 E.02362
G1 X135.801 Y130.326 E.22423
M73 P83 R3
G1 X136.176 Y130.588 E.02362
G1 X133.121 Y133.682 E.22423
G1 X133.496 Y133.944 E.02362
G1 X136.552 Y130.851 E.22423
G1 X136.927 Y131.114 E.02362
G1 X133.871 Y134.207 E.22423
G1 X134.247 Y134.47 E.02362
G1 X137.302 Y131.376 E.22423
G1 X137.677 Y131.639 E.02362
G1 X134.622 Y134.732 E.22423
G1 X134.997 Y134.995 E.02362
G1 X138.052 Y131.902 E.22423
G1 X138.427 Y132.164 E.02362
G1 X135.372 Y135.257 E.22423
G1 X135.747 Y135.52 E.02362
G1 X138.802 Y132.427 E.22423
G1 X139.177 Y132.69 E.02362
G1 X136.122 Y135.783 E.22423
G1 X136.497 Y136.045 E.02362
G1 X139.546 Y132.959 E.22374
G3 X139.903 Y133.24 I-2.665 J3.754 E.02344
G1 X136.87 Y136.31 E.22257
G3 X137.23 Y136.589 I-1.787 J2.673 E.02347
G1 X140.247 Y133.534 E.22146
G3 X140.578 Y133.841 I-2.941 J3.507 E.02331
G1 X137.567 Y136.89 E.22103
G3 X137.882 Y137.213 I-2.121 J2.388 E.02331
G1 X140.897 Y134.161 E.22126
G1 X141.201 Y134.495 E.02332
G1 X138.176 Y137.558 E.22202
G3 X138.447 Y137.926 I-1.874 J1.663 E.02361
G1 X141.491 Y134.844 E.22344
G3 X141.769 Y135.206 I-3.522 J2.987 E.02352
G1 X138.69 Y138.323 E.22594
G3 X138.918 Y138.735 I-2.17 J1.468 E.02431
G1 X142.033 Y135.581 E.22862
G3 X142.283 Y135.97 I-3.815 J2.731 E.02387
G1 X139.116 Y139.176 E.23241
G3 X139.288 Y139.645 I-3.221 J1.44 E.02578
G1 X142.519 Y136.374 E.23714
G1 X142.738 Y136.794 E.02446
G1 X139.422 Y140.151 E.24331
G3 X139.525 Y140.689 I-2.673 J.789 E.02832
G1 X142.945 Y137.227 E.25098
G3 X143.134 Y137.678 I-4.473 J2.143 E.02523
G1 X139.593 Y141.263 E.25987
G3 X139.607 Y141.892 I-8.873 J.505 E.03244
G1 X143.306 Y138.146 E.27151
G3 X143.46 Y138.633 I-4.85 J1.8 E.02634
G1 X139.607 Y142.534 E.2828
G1 X139.607 Y143.176 E.03313
G1 X143.592 Y139.142 E.29247
G1 X143.703 Y139.672 E.02793
G1 X139.607 Y143.819 E.30062
G1 X139.607 Y144.461 E.03313
G1 X143.79 Y140.227 E.30698
G3 X143.856 Y140.802 I-4.507 J.809 E.0299
G1 X139.607 Y145.104 E.31183
G1 X139.607 Y145.746 E.03313
G1 X143.887 Y141.413 E.31411
G3 X143.893 Y142.049 I-12.879 J.448 E.0328
G1 X139.607 Y146.389 E.31458
G1 X139.607 Y147.031 E.03313
G1 X143.893 Y142.692 E.31458
G1 X143.893 Y143.334 E.03313
G1 X139.598 Y147.682 E.31523
G3 X139.537 Y148.387 I-4.756 J-.059 E.0365
G1 X143.893 Y143.976 E.31972
G1 X143.893 Y144.619 E.03313
G1 X139.348 Y149.221 E.33361
G3 X138.966 Y150.25 I-5.448 J-1.436 E.05669
G1 X143.893 Y145.261 E.36163
G1 X143.893 Y145.904 E.03313
G1 X128.594 Y161.393 E1.12284
G1 X129.229 Y161.393 E.03273
G1 X143.893 Y146.546 E1.07627
G1 X143.893 Y147.189 E.03313
G1 X129.864 Y161.393 E1.02969
G1 X130.498 Y161.393 E.03273
G1 X143.893 Y147.831 E.98312
G1 X143.893 Y148.474 E.03313
G1 X131.133 Y161.393 E.93655
G1 X131.767 Y161.393 E.03273
G1 X143.893 Y149.116 E.88998
G1 X143.893 Y149.759 E.03313
G1 X132.402 Y161.393 E.8434
G2 X133.038 Y161.392 I.293 J-12.49 E.0328
G1 X143.893 Y150.401 E.79674
G3 X143.878 Y151.058 I-47.642 J-.743 E.03392
G1 X133.696 Y161.368 E.74734
G2 X134.398 Y161.299 I-.325 J-6.935 E.03642
G1 X143.813 Y151.767 E.69102
G3 X143.696 Y152.528 I-5.344 J-.435 E.03977
G1 X135.154 Y161.176 E.62693
G2 X135.993 Y160.97 I-2.772 J-13.048 E.04457
G1 X143.507 Y153.361 E.55152
G3 X143.202 Y154.313 I-13.485 J-3.802 E.05156
G1 X136.946 Y160.647 E.45915
G2 X138.096 Y160.125 I-4.276 J-10.95 E.06517
G1 X142.687 Y155.476 E.33697
G3 X141.394 Y157.429 I-9.567 J-4.935 E.12103
G1 X139.057 Y159.794 E.17149
M106 S170.85
G1 X127.76 Y161.596 F42000
M106 S255
G1 F3000
G1 X132.193 Y157.107 E.32539
G1 X131.559 Y157.107 E.03273
G1 X127.325 Y161.393 E.31071
G1 X126.691 Y161.393 E.03273
G1 X130.924 Y157.107 E.31071
G1 X130.29 Y157.107 E.03273
G1 X126.056 Y161.393 E.31071
G1 X125.422 Y161.393 E.03273
G1 X129.655 Y157.107 E.31071
G1 X129.021 Y157.107 E.03273
G1 X124.787 Y161.393 E.31071
G1 X124.153 Y161.393 E.03273
G1 X128.386 Y157.107 E.31071
G1 X127.751 Y157.107 E.03273
G1 X123.518 Y161.393 E.31071
G3 X122.887 Y161.39 I-.253 J-12.407 E.03257
G1 X127.117 Y157.107 E.31048
G1 X126.482 Y157.107 E.03273
G1 X122.276 Y161.366 E.30872
G3 X121.695 Y161.311 I.246 J-5.729 E.03009
G1 X125.848 Y157.107 E.30476
G1 X125.213 Y157.107 E.03273
G1 X121.141 Y161.23 E.29886
G3 X120.611 Y161.124 I.773 J-5.264 E.0279
G1 X124.579 Y157.107 E.29121
G1 X123.944 Y157.107 E.03273
G1 X120.102 Y160.997 E.28199
G3 X119.613 Y160.85 I1.201 J-4.882 E.02636
M73 P84 R3
G1 X123.322 Y157.094 E.27223
G1 X123.003 Y156.775 E.02328
G1 X119.142 Y160.684 E.28332
G1 X118.692 Y160.497 E.02514
G1 X122.683 Y156.456 E.29294
G1 X122.364 Y156.137 E.02328
G1 X118.255 Y160.297 E.30156
G1 X117.833 Y160.082 E.02445
G1 X122.045 Y155.817 E.30915
G1 X121.726 Y155.498 E.02328
G1 X117.428 Y159.85 E.31546
G1 X117.03 Y159.61 E.02394
G1 X121.407 Y155.179 E.32119
G1 X121.087 Y154.86 E.02328
G1 X116.658 Y159.344 E.32507
G3 X116.289 Y159.075 I1.713 J-2.739 E.02357
G1 X120.768 Y154.541 E.32873
G1 X120.449 Y154.221 E.02328
G1 X115.941 Y158.785 E.33085
G3 X115.601 Y158.487 I1.666 J-2.245 E.02335
G1 X120.13 Y153.902 E.33239
G1 X119.81 Y153.583 E.02328
G1 X115.278 Y158.171 E.33262
G3 X114.967 Y157.844 I2.234 J-2.432 E.02331
G1 X119.491 Y153.264 E.33201
G1 X119.172 Y152.944 E.02328
G1 X114.667 Y157.505 E.33064
G3 X114.383 Y157.15 I2.007 J-1.896 E.02347
G1 X118.853 Y152.625 E.32805
G1 X118.533 Y152.306 E.02328
G1 X114.109 Y156.786 E.32474
G3 X113.855 Y156.4 I2.551 J-1.954 E.02383
G1 X118.218 Y151.983 E.3202
G3 X117.917 Y151.645 I2.115 J-2.187 E.02335
G1 X113.605 Y156.011 E.31649
G1 X113.377 Y155.599 E.02427
G1 X117.639 Y151.284 E.31283
G1 X117.387 Y150.896 E.02384
G1 X113.168 Y155.169 E.30972
G3 X112.966 Y154.73 I2.78 J-1.54 E.02492
G1 X117.155 Y150.489 E.30743
G3 X116.942 Y150.062 I2.195 J-1.362 E.02464
G1 X112.789 Y154.267 E.30484
G3 X112.624 Y153.792 I3.089 J-1.336 E.02599
G1 X116.763 Y149.601 E.30377
G1 X116.619 Y149.105 E.02667
G1 X112.476 Y153.299 E.30406
G3 X112.351 Y152.783 I4.015 J-1.241 E.02742
G1 X116.499 Y148.584 E.30439
G3 X116.422 Y148.019 I3.749 J-.797 E.02942
G1 X112.25 Y152.243 E.30621
G3 X112.173 Y151.679 I5.509 J-1.038 E.0294
G1 X116.393 Y147.406 E.30975
G1 X116.393 Y146.763 E.03313
G1 X112.124 Y151.086 E.31335
G3 X112.107 Y150.46 I41.719 J-1.439 E.03227
G1 X116.393 Y146.121 E.31458
G1 X116.393 Y145.478 E.03313
G1 X112.107 Y149.818 E.31458
G1 X112.107 Y149.176 E.03313
G1 X116.393 Y144.836 E.31458
G1 X116.393 Y144.193 E.03313
G1 X112.107 Y148.533 E.31458
G1 X112.107 Y147.891 E.03313
G1 X116.393 Y143.551 E.31458
G1 X116.393 Y142.909 E.03313
G1 X112.107 Y147.248 E.31458
G1 X112.107 Y146.606 E.03313
G1 X116.393 Y142.266 E.31458
G1 X116.393 Y141.624 E.03313
G1 X112.107 Y145.963 E.31458
G1 X112.107 Y145.321 E.03313
G1 X116.393 Y140.981 E.31458
G1 X116.393 Y140.339 E.03313
G1 X112.107 Y144.678 E.31458
G1 X112.107 Y144.036 E.03313
G1 X116.393 Y139.696 E.31458
G1 X116.393 Y139.054 E.03313
G1 X112.107 Y143.393 E.31458
G1 X112.107 Y142.751 E.03313
G1 X116.393 Y138.411 E.31458
G1 X116.393 Y137.769 E.03313
G1 X112.107 Y142.109 E.31458
G1 X112.107 Y141.466 E.03313
G1 X116.393 Y137.126 E.31458
G1 X116.393 Y136.484 E.03313
G1 X112.107 Y140.824 E.31458
G1 X112.107 Y140.181 E.03313
G1 X116.393 Y135.842 E.31458
G1 X116.393 Y135.199 E.03313
G1 X112.107 Y139.539 E.31458
G1 X112.107 Y138.896 E.03313
G1 X116.396 Y134.553 E.31482
G3 X116.445 Y133.861 I4.713 J-.015 E.03581
G1 X112.107 Y138.254 E.31841
G1 X112.107 Y137.611 E.03313
G1 X116.595 Y133.068 E.32937
G3 X116.91 Y132.106 I6.499 J1.598 E.05224
G1 X111.904 Y137.174 E.36737
M106 S170.85
G1 X111.904 Y112.118 F42000
M106 S255
G1 F3000
G1 X129.2 Y94.607 E1.26941
G1 X128.566 Y94.607 E.03273
G1 X112.107 Y111.271 E1.20798
G1 X112.107 Y110.628 E.03313
G1 X127.931 Y94.607 E1.16141
G1 X127.297 Y94.607 E.03273
G1 X112.107 Y109.986 E1.11483
G1 X112.107 Y109.343 E.03313
G1 X126.662 Y94.607 E1.06826
G1 X126.027 Y94.607 E.03273
G1 X112.107 Y108.701 E1.02169
G1 X112.107 Y108.058 E.03313
G1 X125.393 Y94.607 E.97512
G1 X124.758 Y94.607 E.03273
G1 X112.107 Y107.416 E.92854
G1 X112.107 Y106.773 E.03313
G1 X124.124 Y94.607 E.88197
G1 X123.489 Y94.607 E.03273
G1 X112.107 Y106.131 E.8354
G1 X112.107 Y105.489 E.03313
G1 X122.855 Y94.607 E.78883
G1 X122.22 Y94.607 E.03273
G1 X112.107 Y104.846 E.74225
G1 X112.107 Y104.204 E.03313
G1 X121.586 Y94.607 E.69568
G1 X120.951 Y94.607 E.03273
G1 X112.133 Y103.534 E.64716
G3 X112.201 Y102.824 I5.12 J.126 E.03684
G1 X120.316 Y94.607 E.59565
G1 X119.682 Y94.607 E.03273
G1 X112.324 Y102.056 E.54
G3 X112.53 Y101.206 I5.925 J.98 E.04515
M73 P85 R3
G1 X119.047 Y94.607 E.47836
G1 X118.413 Y94.607 E.03273
G1 X112.847 Y100.242 E.40852
G3 X113.401 Y99.038 I12.635 J5.091 E.0684
G1 X117.778 Y94.607 E.32123
G1 X117.166 Y94.607 E.0316
G2 X113.797 Y97.995 I272.031 J273.811 E.24642
M106 S170.85
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X115.207 Y96.577 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/45
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
M106 S196.35
G17
G3 Z8.6 I-1.206 J.164 P1  F42000
G1 X123.392 Y156.805 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.5 Y151.913 E.2295
G3 X116.647 Y147.44 I4.564 J-4.511 E.16468
G1 X116.647 Y134.649 E.4243
G3 X122.719 Y128.317 I6.357 J.018 E.32117
G3 X126.635 Y129.45 I.267 J6.407 E.13761
G1 X136.652 Y136.464 E.40567
G3 X139.353 Y141.652 I-3.689 J5.217 E.20149
G1 X139.353 Y147.44 E.19201
G3 X137.5 Y151.913 I-6.417 J-.038 E.16468
G1 X132.56 Y156.853 E.23173
G1 X123.44 Y156.853 E.30255
G1 X123.435 Y156.848 E.00023
G1 X123.592 Y156.451 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.783 Y151.641 E.20901
G3 X117.039 Y147.433 I4.279 J-4.237 E.14353
G1 X117.039 Y134.656 E.39259
G3 X122.74 Y128.708 I5.965 J.011 E.27946
G3 X126.416 Y129.775 I.247 J6.011 E.11967
G1 X136.422 Y136.782 E.37534
G3 X138.961 Y141.658 I-3.456 J4.899 E.1755
G1 X138.961 Y147.433 E.17743
G3 X137.217 Y151.641 I-6.022 J-.029 E.14353
G1 X132.398 Y156.461 E.20944
G1 X123.648 Y156.461 E.26885
M204 S6000
; WIPE_START
G1 F33600
G1 X122.227 Y155.053 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.299 Y147.707 Z8.8 F42000
G1 X133.436 Y115.31 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X133.397 Y115.225 E.0031
G3 X133.353 Y114.982 I.615 J-.238 E.00826
G1 X133.353 Y112.849 E.07075
G3 X133.557 Y112.356 I.682 J-.006 E.01817
G1 X135.382 Y110.531 E.08561
G2 X136.353 Y108.187 I-2.443 J-2.385 E.08625
G2 X136.287 Y105.989 I-16.927 J-.598 E.07299
M73 P85 R2
G2 X128.509 Y99.147 I-7.792 J1.017 E.37517
G2 X125.639 Y99.552 I-.412 J7.468 E.09676
G2 X122.404 Y102.207 I2.469 J6.308 E.14116
G2 X120.969 Y105.57 I9.313 J5.959 E.12185
G2 X119.891 Y110.902 I67.156 J16.353 E.18048
G2 X125.066 Y122.498 I12.266 J1.479 E.44241
G1 X139.388 Y132.526 E.57996
G3 X144.147 Y141.67 I-6.421 J9.153 E.35537
G1 X144.147 Y150.492 E.29266
G3 X132.992 Y161.647 I-11.157 J-.002 E.58123
G1 X123.008 Y161.647 E.3312
G3 X111.853 Y150.492 I.013 J-11.168 E.58107
G1 X111.853 Y104.185 E1.53608
G3 X115.123 Y96.29 I11.202 J.015 E.29086
G1 X117.06 Y94.353 E.09088
G1 X138.94 Y94.353 E.72578
G1 X140.064 Y95.477 E.05273
G3 X141.994 Y97.593 I-12.239 J13.104 E.09511
G3 X144.147 Y104.185 I-9.083 J6.615 E.23388
G1 X144.147 Y111.987 E.2588
G3 X140.487 Y115.647 I-3.656 J.004 E.19076
G1 X134.022 Y115.647 E.21445
G3 X133.468 Y115.361 I-.01 J-.659 E.02156
G1 X133.083 Y115.476 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.03 Y115.361 E.00389
G3 X132.961 Y114.994 I.986 J-.378 E.01156
G1 X132.961 Y112.836 E.06631
G3 X133.27 Y112.088 I1.074 J.007 E.02548
G1 X135.097 Y110.261 E.0794
G2 X135.961 Y108.177 I-2.153 J-2.113 E.07105
G2 X135.898 Y106.04 I-16.51 J-.59 E.06575
G2 X128.503 Y99.539 I-7.403 J.966 E.33034
G2 X125.779 Y99.918 I-.404 J7.086 E.08506
G2 X122.729 Y102.426 I2.33 J5.942 E.12336
G2 X121.348 Y105.672 I8.98 J5.737 E.10889
G2 X120.281 Y110.949 I66.972 J16.293 E.16546
G2 X125.293 Y122.179 I11.877 J1.432 E.39689
G1 X139.617 Y132.208 E.53728
G3 X144.539 Y141.665 I-6.651 J9.472 E.34044
G1 X144.539 Y150.497 E.2714
G3 X132.997 Y162.039 I-11.549 J-.007 E.55701
G1 X123.003 Y162.039 E.30711
G3 X111.461 Y150.497 I.018 J-11.56 E.55686
G1 X111.461 Y104.18 E1.42319
G3 X114.842 Y96.016 I11.596 J.021 E.27857
G1 X116.898 Y93.961 E.08933
G1 X139.102 Y93.961 E.68227
G1 X140.341 Y95.199 E.05384
G3 X142.311 Y97.361 I-12.497 J13.365 E.08995
G3 X144.539 Y104.18 I-9.403 J6.847 E.2241
G1 X144.539 Y111.996 E.24014
G3 X140.496 Y116.039 I-4.048 J-.005 E.19512
G1 X134.008 Y116.039 E.19935
G3 X133.127 Y115.553 I.009 J-1.056 E.03223
G1 X133.113 Y115.528 E.00086
M204 S6000
; WIPE_START
G1 F33600
G1 X133.03 Y115.361 E-.07079
G1 X132.972 Y115.152 E-.08271
G1 X132.961 Y114.994 E-.0602
G1 X132.961 Y113.556 E-.54631
; WIPE_END
M73 P86 R2
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z8.8 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z8.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.8 F4000
            G39.3 S1
            G0 Z8.8 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z9.2 F42000
G1 X141.668 Y115.28
G1 Z8.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42225
G1 F15000
G1 X143.456 Y113.492 E.07816
G2 X143.742 Y112.67 I-2.522 J-1.337 E.02702
G1 X141.17 Y115.242 E.11242
G3 X140.565 Y115.311 I-.685 J-3.322 E.01886
G1 X143.811 Y112.065 E.14189
G2 X143.814 Y111.525 I-6.429 J-.312 E.0167
G1 X140.025 Y115.314 E.16565
G1 X139.488 Y115.314 E.01658
G1 X143.814 Y110.988 E.18911
G1 X143.814 Y110.452 E.01658
G1 X138.952 Y115.314 E.21256
G1 X138.415 Y115.314 E.01658
G1 X143.814 Y109.915 E.23601
G1 X143.814 Y109.379 E.01658
G1 X137.879 Y115.314 E.25946
G1 X137.342 Y115.314 E.01658
G1 X143.814 Y108.842 E.28291
G1 X143.814 Y108.306 E.01658
G1 X136.806 Y115.314 E.30636
G1 X136.269 Y115.314 E.01658
G1 X143.814 Y107.769 E.32981
G1 X143.814 Y107.233 E.01658
G1 X135.733 Y115.314 E.35326
G1 X135.197 Y115.314 E.01658
G1 X143.814 Y106.697 E.37671
G1 X143.814 Y106.16 E.01658
G1 X134.66 Y115.314 E.40016
G1 X134.124 Y115.314 E.01658
G1 X143.814 Y105.624 E.42361
G1 X143.814 Y105.087 E.01658
G1 X133.743 Y115.158 E.44026
G3 X133.686 Y114.953 I.241 J-.177 E.00674
G1 X133.686 Y114.679 E.00847
G1 X143.814 Y104.551 E.44275
G2 X143.808 Y104.021 I-6.999 J-.179 E.01639
G1 X133.686 Y114.142 E.44246
G1 X133.686 Y113.606 E.01658
G1 X143.788 Y103.504 E.44161
G2 X143.74 Y103.016 I-3.473 J.096 E.01518
G1 X133.686 Y113.07 E.4395
G3 X133.72 Y112.698 I.808 J-.113 E.01165
G1 X133.811 Y112.573 E.00475
G1 X135.623 Y110.761 E.07923
G2 X136.163 Y110.056 I-2.771 J-2.68 E.02749
G1 X143.687 Y102.532 E.32893
G2 X143.605 Y102.077 I-3.258 J.35 E.01429
G1 X136.556 Y109.126 E.30816
G2 X136.672 Y108.474 I-3.862 J-1.02 E.02049
G1 X143.508 Y101.638 E.29883
G2 X143.394 Y101.216 I-3.529 J.725 E.01353
G1 X136.683 Y107.926 E.29334
G1 X136.678 Y107.395 E.01643
G1 X143.27 Y100.803 E.28815
G2 X143.13 Y100.406 I-3.433 J.986 E.01301
G1 X136.673 Y106.863 E.28226
G2 X136.657 Y106.343 I-2.972 J-.166 E.0161
G1 X142.979 Y100.021 E.27636
G2 X142.816 Y99.648 I-2.786 J.992 E.01261
G1 X136.604 Y105.86 E.27155
G2 X136.527 Y105.4 I-3.579 J.361 E.01442
G1 X142.635 Y99.292 E.267
G1 X142.454 Y98.936 E.01233
G1 X136.427 Y104.964 E.26349
G2 X136.306 Y104.548 I-3.267 J.723 E.01339
G1 X142.255 Y98.599 E.26006
G1 X142.053 Y98.265 E.01207
G1 X136.164 Y104.154 E.25741
G1 X136.012 Y103.769 E.01278
G1 X141.834 Y97.947 E.2545
G2 X141.608 Y97.637 I-3.136 J2.058 E.01187
G1 X135.846 Y103.399 E.25185
G2 X135.664 Y103.044 I-2.819 J1.223 E.01233
G1 X141.373 Y97.336 E.24954
G1 X141.12 Y97.052 E.01174
G1 X135.467 Y102.705 E.2471
G2 X135.254 Y102.382 I-2.605 J1.482 E.01198
G1 X140.867 Y96.769 E.24535
G2 X140.605 Y96.495 I-2.711 J2.329 E.01173
G1 X135.03 Y102.069 E.24369
G2 X134.795 Y101.768 I-2.445 J1.667 E.01182
G1 X140.337 Y96.225 E.24229
G1 X140.07 Y95.956 E.01173
G1 X134.544 Y101.482 E.24158
G2 X134.281 Y101.209 I-2.242 J1.897 E.01174
G1 X139.803 Y95.687 E.2414
G1 X139.535 Y95.419 E.01173
G1 X134.007 Y100.947 E.24165
G1 X133.721 Y100.696 E.01175
G1 X139.266 Y95.151 E.24241
G1 X138.998 Y94.882 E.01173
G1 X133.419 Y100.461 E.24388
G2 X133.106 Y100.238 I-1.883 J2.305 E.0119
G1 X138.658 Y94.686 E.24269
G1 X138.122 Y94.686 E.01658
G1 X132.782 Y100.026 E.23342
G1 X132.443 Y99.828 E.01213
G1 X137.585 Y94.686 E.2248
G1 X137.049 Y94.686 E.01658
G1 X132.083 Y99.652 E.2171
G1 X131.718 Y99.48 E.01246
G1 X136.512 Y94.686 E.20958
G1 X135.976 Y94.686 E.01658
G1 X131.336 Y99.326 E.20284
G2 X130.936 Y99.189 I-1.255 J3.012 E.01307
G1 X135.439 Y94.686 E.19686
G1 X134.903 Y94.686 E.01658
G1 X130.52 Y99.069 E.19161
G1 X130.084 Y98.969 E.01383
G1 X134.367 Y94.686 E.18722
G1 X133.83 Y94.686 E.01658
G1 X129.623 Y98.893 E.18391
G2 X129.138 Y98.841 I-.642 J3.725 E.01508
G1 X133.294 Y94.686 E.18166
G1 X132.757 Y94.686 E.01658
G1 X128.618 Y98.825 E.18092
G1 X128.089 Y98.817 E.01635
G1 X132.221 Y94.686 E.1806
G1 X131.684 Y94.686 E.01658
G1 X127.542 Y98.828 E.18108
G2 X126.957 Y98.877 I.216 J6.132 E.01816
G1 X131.148 Y94.686 E.18321
G1 X130.611 Y94.686 E.01658
G1 X126.294 Y99.004 E.18875
G2 X125.521 Y99.24 I3.77 J13.723 E.02497
G1 X130.075 Y94.686 E.19906
G1 X129.538 Y94.686 E.01658
G1 X124.481 Y99.744 E.22111
G2 X122.127 Y102.021 I3.756 J6.238 E.10208
G1 X121.991 Y102.234 E.00782
G1 X112.186 Y112.038 E.42862
G1 X112.186 Y112.575 E.01658
G1 X121.368 Y103.393 E.4014
G2 X121.027 Y104.27 I5.816 J2.764 E.02911
G1 X112.186 Y113.111 E.3865
G1 X112.186 Y113.648 E.01658
G1 X120.765 Y105.069 E.37503
G1 X120.575 Y105.795 E.02321
G1 X112.186 Y114.184 E.36673
G1 X112.186 Y114.721 E.01658
G1 X120.397 Y106.51 E.35894
G1 X120.249 Y107.194 E.02164
G1 X112.186 Y115.257 E.35248
G1 X112.186 Y115.794 E.01658
G1 X120.101 Y107.878 E.34601
G2 X119.974 Y108.542 I11.719 J2.586 E.02088
G1 X112.186 Y116.33 E.34047
G1 X112.186 Y116.867 E.01658
G1 X119.851 Y109.201 E.33508
G1 X119.728 Y109.861 E.02074
G1 X112.186 Y117.403 E.3297
G1 X112.186 Y117.939 E.01658
G1 X119.608 Y110.518 E.32443
G1 X119.544 Y111.118 E.01865
G1 X112.186 Y118.476 E.32166
G1 X112.186 Y119.012 E.01658
G1 X119.489 Y111.709 E.31926
G1 X119.472 Y112.263 E.01712
G1 X112.186 Y119.549 E.3185
G1 X112.186 Y120.085 E.01658
G1 X119.481 Y112.79 E.31889
G2 X119.509 Y113.299 I3.434 J.067 E.01576
G1 X112.186 Y120.622 E.32011
G1 X112.186 Y121.158 E.01658
G1 X119.559 Y113.785 E.32229
G2 X119.611 Y114.269 I2.73 J-.052 E.01506
G1 X112.186 Y121.695 E.32459
G1 X112.186 Y122.231 E.01658
G1 X119.698 Y114.719 E.3284
G1 X119.785 Y115.168 E.01415
G1 X112.186 Y122.768 E.33221
G1 X112.186 Y123.304 E.01658
G1 X119.889 Y115.601 E.33675
G1 X120.004 Y116.022 E.01351
G1 X112.186 Y123.84 E.34176
G1 X112.186 Y124.377 E.01658
G1 X120.135 Y116.428 E.34748
G2 X120.275 Y116.824 I4.229 J-1.275 E.013
G1 X112.186 Y124.913 E.35362
G1 X112.186 Y125.45 E.01658
G1 X120.424 Y117.212 E.36012
G1 X120.588 Y117.584 E.01258
G1 X112.186 Y125.986 E.36728
G1 X112.186 Y126.523 E.01658
G1 X120.762 Y117.947 E.37488
G1 X120.944 Y118.301 E.01231
G1 X112.186 Y127.059 E.38286
G1 X112.186 Y127.596 E.01658
G1 X121.129 Y118.653 E.39092
G1 X121.335 Y118.983 E.01203
G1 X112.186 Y128.132 E.39995
G1 X112.186 Y128.669 E.01658
G1 X121.542 Y119.313 E.40897
G2 X121.752 Y119.639 I1.929 J-1.018 E.01201
G1 X112.186 Y129.205 E.41819
G1 X112.186 Y129.741 E.01658
G1 X121.984 Y119.944 E.4283
G1 X122.215 Y120.249 E.01184
G1 X112.186 Y130.278 E.4384
G1 X112.186 Y130.814 E.01658
G1 X122.451 Y120.549 E.44875
G1 X122.707 Y120.83 E.01174
G1 X112.186 Y131.351 E.45991
G1 X112.186 Y131.887 E.01658
G1 X122.962 Y121.111 E.47107
G2 X123.223 Y121.386 I1.672 J-1.328 E.01174
G1 X112.186 Y132.424 E.4825
G1 X112.186 Y132.96 E.01658
G1 X123.503 Y121.643 E.4947
G1 X123.782 Y121.901 E.01174
G1 X112.186 Y133.497 E.50691
G1 X112.186 Y134.033 E.01658
G1 X124.068 Y122.151 E.51941
G1 X124.371 Y122.384 E.01182
G1 X112.186 Y134.57 E.53267
G1 X112.186 Y135.106 E.01658
G1 X124.674 Y122.618 E.54592
G2 X124.982 Y122.846 I2.712 J-3.325 E.01186
G1 X112.016 Y135.812 E.56679
G1 X112.016 Y111.672 F42000
G1 F15000
G1 X129.002 Y94.686 E.74252
G1 X128.466 Y94.686 E.01658
G1 X112.186 Y110.966 E.71165
M73 P87 R2
G1 X112.186 Y110.429 E.01658
G1 X127.929 Y94.686 E.6882
G1 X127.393 Y94.686 E.01658
G1 X112.186 Y109.893 E.66475
G1 X112.186 Y109.356 E.01658
G1 X126.856 Y94.686 E.6413
G1 X126.32 Y94.686 E.01658
G1 X112.186 Y108.82 E.61785
G1 X112.186 Y108.283 E.01658
G1 X125.783 Y94.686 E.5944
G1 X125.247 Y94.686 E.01658
G1 X112.186 Y107.747 E.57095
G1 X112.186 Y107.21 E.01658
G1 X124.71 Y94.686 E.5475
G1 X124.174 Y94.686 E.01658
G1 X112.186 Y106.674 E.52405
G1 X112.186 Y106.138 E.01658
G1 X123.638 Y94.686 E.5006
G1 X123.101 Y94.686 E.01658
G1 X112.186 Y105.601 E.47715
G1 X112.186 Y105.065 E.01658
G1 X122.565 Y94.686 E.4537
G1 X122.028 Y94.686 E.01658
G1 X112.186 Y104.528 E.43025
G3 X112.194 Y103.984 I7.185 J-.168 E.01683
G1 X121.492 Y94.686 E.40645
G1 X120.955 Y94.686 E.01658
G1 X112.215 Y103.426 E.38205
G1 X112.281 Y102.824 E.01872
G1 X120.419 Y94.686 E.35573
G1 X119.882 Y94.686 E.01658
G1 X112.378 Y102.19 E.32805
G3 X112.534 Y101.498 I4.762 J.709 E.02196
G1 X119.346 Y94.686 E.29779
G1 X118.809 Y94.686 E.01658
G1 X112.751 Y100.744 E.26483
G3 X113.083 Y99.876 I7.491 J2.364 E.02874
G1 X118.273 Y94.686 E.22688
G1 X117.737 Y94.686 E.01658
G1 X113.642 Y98.78 E.17899
G3 X115.329 Y96.557 I9.191 J5.222 E.08651
G1 X117.37 Y94.516 E.08922
; WIPE_START
G1 F33600
G1 X115.956 Y95.93 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.732 Y102.563 Z8.8 F42000
G1 X143.984 Y145.151 Z8.8
G1 Z8.4
G1 E.8 F1800
G1 F15000
G1 X139.188 Y149.947 E.20964
G2 X139.45 Y149.149 I-4.022 J-1.761 E.026
G1 X143.814 Y144.785 E.19078
G1 X143.814 Y144.248 E.01658
G1 X139.605 Y148.457 E.18399
G2 X139.671 Y147.855 I-10.868 J-1.488 E.01872
G1 X143.814 Y143.712 E.18112
G1 X143.814 Y143.175 E.01658
G1 X139.686 Y147.304 E.18046
G1 X139.686 Y146.767 E.01658
G1 X143.814 Y142.639 E.18046
G1 X143.814 Y142.102 E.01658
G1 X139.686 Y146.231 E.18046
G1 X139.686 Y145.694 E.01658
G1 X143.811 Y141.569 E.18035
G2 X143.795 Y141.049 I-5.243 J-.091 E.01608
G1 X139.686 Y145.158 E.17961
G1 X139.686 Y144.621 E.01658
G1 X143.755 Y140.552 E.17788
G1 X143.691 Y140.08 E.01473
G1 X139.686 Y144.085 E.17507
G1 X139.686 Y143.548 E.01658
G1 X143.611 Y139.624 E.17157
G1 X143.518 Y139.18 E.01402
G1 X139.686 Y143.012 E.16753
G1 X139.686 Y142.475 E.01658
G1 X143.411 Y138.751 E.16283
G2 X143.287 Y138.338 I-4.216 J1.041 E.01332
G1 X139.686 Y141.939 E.15741
G2 X139.678 Y141.411 I-7.519 J-.147 E.01633
G1 X143.151 Y137.938 E.15182
G1 X143 Y137.552 E.0128
G1 X139.634 Y140.918 E.14715
G1 X139.571 Y140.444 E.01477
G1 X142.837 Y137.179 E.14275
G2 X142.662 Y136.817 I-3.196 J1.324 E.01242
G1 X139.471 Y140.008 E.13947
G2 X139.353 Y139.59 I-2.487 J.48 E.01344
G1 X142.478 Y136.465 E.13663
G2 X142.283 Y136.123 I-3.033 J1.506 E.01216
G1 X139.21 Y139.196 E.13433
G2 X139.048 Y138.821 I-2.737 J.958 E.01263
G1 X142.078 Y135.791 E.13244
G1 X141.864 Y135.469 E.01196
G1 X138.869 Y138.465 E.13093
G1 X138.665 Y138.132 E.01206
G1 X141.637 Y135.16 E.12991
G2 X141.401 Y134.859 I-3.152 J2.219 E.01182
G1 X138.458 Y137.803 E.12867
G1 X138.228 Y137.496 E.01184
G1 X141.158 Y134.566 E.12809
G1 X140.903 Y134.285 E.01174
G1 X137.981 Y137.207 E.12773
G2 X137.72 Y136.932 I-2.085 J1.72 E.01174
G1 X140.639 Y134.013 E.1276
G2 X140.366 Y133.748 I-2.796 J2.61 E.01173
G1 X137.444 Y136.671 E.12776
G2 X137.153 Y136.425 I-1.894 J1.94 E.01177
G1 X140.084 Y133.494 E.12813
G2 X139.791 Y133.251 I-2.594 J2.835 E.01178
G1 X136.847 Y136.194 E.12867
G1 X136.532 Y135.973 E.01191
G1 X139.489 Y133.016 E.12929
G2 X139.181 Y132.788 I-4.738 J6.111 E.01186
G1 X136.216 Y135.752 E.12957
G1 X135.901 Y135.531 E.01191
G1 X138.865 Y132.567 E.12957
G1 X138.549 Y132.346 E.01191
G1 X135.585 Y135.31 E.12957
G1 X135.27 Y135.09 E.01191
G1 X138.234 Y132.125 E.12957
G1 X137.918 Y131.905 E.01191
G1 X134.954 Y134.869 E.12957
G1 X134.639 Y134.648 E.01191
G1 X137.603 Y131.684 E.12957
G1 X137.287 Y131.463 E.01191
G1 X134.323 Y134.427 E.12957
G1 X134.008 Y134.206 E.01191
G1 X136.972 Y131.242 E.12957
G1 X136.656 Y131.021 E.01191
G1 X133.692 Y133.985 E.12957
G1 X133.377 Y133.764 E.01191
G1 X136.341 Y130.8 E.12957
G1 X136.025 Y130.579 E.01191
G1 X133.061 Y133.543 E.12957
G1 X132.746 Y133.322 E.01191
G1 X135.71 Y130.358 E.12957
G1 X135.394 Y130.137 E.01191
G1 X132.43 Y133.101 E.12957
G1 X132.115 Y132.88 E.01191
G1 X135.079 Y129.916 E.12957
G1 X134.763 Y129.695 E.01191
G1 X131.799 Y132.659 E.12957
G1 X131.484 Y132.438 E.01191
G1 X134.448 Y129.474 E.12957
G1 X134.132 Y129.253 E.01191
G1 X131.168 Y132.217 E.12957
G1 X130.853 Y131.997 E.01191
G1 X133.817 Y129.032 E.12957
G1 X133.501 Y128.811 E.01191
G1 X130.537 Y131.776 E.12957
G1 X130.221 Y131.555 E.01191
G1 X133.186 Y128.591 E.12957
G1 X132.87 Y128.37 E.01191
G1 X129.906 Y131.334 E.12957
G1 X129.59 Y131.113 E.01191
G1 X132.555 Y128.149 E.12957
G1 X132.239 Y127.928 E.01191
G1 X129.275 Y130.892 E.12957
G1 X128.959 Y130.671 E.01191
G1 X131.924 Y127.707 E.12957
G1 X131.608 Y127.486 E.01191
G1 X128.644 Y130.45 E.12957
G1 X128.328 Y130.229 E.01191
G1 X131.292 Y127.265 E.12957
G1 X130.977 Y127.044 E.01191
G1 X128.013 Y130.008 E.12957
G1 X127.697 Y129.787 E.01191
G1 X130.661 Y126.823 E.12957
G1 X130.346 Y126.602 E.01191
G1 X127.382 Y129.566 E.12957
G1 X127.066 Y129.345 E.01191
G1 X130.03 Y126.381 E.12957
G1 X129.715 Y126.16 E.01191
G1 X126.748 Y129.127 E.12967
G2 X126.423 Y128.916 I-1.604 J2.126 E.012
G1 X129.399 Y125.939 E.13013
G1 X129.084 Y125.718 E.01191
G1 X126.076 Y128.726 E.13148
G2 X125.713 Y128.553 I-1.367 J2.404 E.01245
G1 X128.768 Y125.498 E.13358
G1 X128.453 Y125.277 E.01191
G1 X125.327 Y128.403 E.13666
G1 X124.927 Y128.266 E.01305
G1 X128.137 Y125.056 E.14032
G1 X127.822 Y124.835 E.01191
G1 X124.506 Y128.151 E.14496
G2 X124.057 Y128.063 I-.825 J3.022 E.01414
G1 X127.506 Y124.614 E.15077
G1 X127.191 Y124.393 E.01191
G1 X123.58 Y128.003 E.15783
G2 X123.064 Y127.983 I-.37 J2.835 E.01599
G1 X126.875 Y124.172 E.1666
G1 X126.56 Y123.951 E.01191
G1 X122.509 Y128.001 E.17706
G2 X121.902 Y128.072 I.125 J3.724 E.01891
G1 X126.244 Y123.73 E.1898
G1 X125.929 Y123.509 E.01191
G1 X121.211 Y128.226 E.20621
G2 X120.391 Y128.51 I1.268 J4.994 E.02685
G1 X125.613 Y123.288 E.22826
G1 X125.298 Y123.067 E.01191
G1 X112.186 Y136.179 E.57316
G1 X112.186 Y136.715 E.01658
G1 X116.845 Y132.056 E.20367
G2 X116.557 Y132.88 I5.494 J2.38 E.02701
G1 X112.186 Y137.252 E.19109
G1 X112.186 Y137.788 E.01658
G1 X116.411 Y133.563 E.18468
G2 X116.331 Y134.18 I8.743 J1.445 E.01921
G1 X112.186 Y138.325 E.1812
G1 X112.186 Y138.861 E.01658
G1 X116.314 Y134.733 E.18046
G1 X116.314 Y135.269 E.01658
G1 X112.186 Y139.398 E.18046
G1 X112.186 Y139.934 E.01658
G1 X116.314 Y135.806 E.18046
G1 X116.314 Y136.342 E.01658
G1 X112.186 Y140.471 E.18046
G1 X112.186 Y141.007 E.01658
G1 X116.314 Y136.879 E.18046
G1 X116.314 Y137.415 E.01658
G1 X112.186 Y141.543 E.18046
G1 X112.186 Y142.08 E.01658
G1 X116.314 Y137.952 E.18046
G1 X116.314 Y138.488 E.01658
G1 X112.186 Y142.616 E.18046
G1 X112.186 Y143.153 E.01658
G1 X116.314 Y139.025 E.18046
G1 X116.314 Y139.561 E.01658
G1 X112.186 Y143.689 E.18046
G1 X112.186 Y144.226 E.01658
G1 X116.314 Y140.098 E.18046
G1 X116.314 Y140.634 E.01658
G1 X112.186 Y144.762 E.18046
G1 X112.186 Y145.299 E.01658
G1 X116.314 Y141.17 E.18046
G1 X116.314 Y141.707 E.01658
G1 X112.186 Y145.835 E.18046
G1 X112.186 Y146.372 E.01658
G1 X116.314 Y142.243 E.18046
G1 X116.314 Y142.78 E.01658
G1 X112.186 Y146.908 E.18046
G1 X112.186 Y147.444 E.01658
M73 P88 R2
G1 X116.314 Y143.316 E.18046
G1 X116.314 Y143.853 E.01658
G1 X112.186 Y147.981 E.18046
G1 X112.186 Y148.517 E.01658
G1 X116.314 Y144.389 E.18046
G1 X116.314 Y144.926 E.01658
G1 X112.186 Y149.054 E.18046
G1 X112.186 Y149.59 E.01658
G1 X116.314 Y145.462 E.18046
G1 X116.314 Y145.998 E.01658
G1 X112.186 Y150.127 E.18046
G2 X112.19 Y150.659 I10.395 J.181 E.01645
G1 X116.314 Y146.535 E.18027
G1 X116.314 Y147.071 E.01658
G1 X112.21 Y151.176 E.17942
G2 X112.251 Y151.671 I4.846 J-.157 E.01536
G1 X116.32 Y147.602 E.17785
G2 X116.352 Y148.106 I3.43 J.033 E.01563
G1 X112.312 Y152.146 E.17659
G2 X112.394 Y152.6 I4.477 J-.573 E.01428
G1 X116.417 Y148.578 E.17585
G2 X116.512 Y149.019 I2.263 J-.257 E.01398
G1 X112.492 Y153.039 E.17573
G2 X112.606 Y153.462 I3.528 J-.725 E.01353
G1 X116.633 Y149.434 E.17604
G2 X116.768 Y149.836 I2.159 J-.498 E.01312
G1 X112.73 Y153.874 E.17651
G2 X112.874 Y154.267 I2.657 J-.755 E.01293
G1 X116.926 Y150.214 E.17714
G1 X117.106 Y150.571 E.01234
G1 X113.023 Y154.654 E.1785
G2 X113.187 Y155.027 I2.517 J-.881 E.0126
G1 X117.298 Y150.916 E.17972
G2 X117.511 Y151.239 I2.568 J-1.46 E.01198
G1 X113.359 Y155.391 E.18149
G2 X113.546 Y155.741 I2.981 J-1.362 E.01227
G1 X117.738 Y151.548 E.18328
G2 X117.98 Y151.843 I2.116 J-1.489 E.01179
G1 X113.743 Y156.079 E.1852
G1 X113.954 Y156.405 E.01199
G1 X118.238 Y152.121 E.18729
G2 X118.506 Y152.39 I3.781 J-3.49 E.01173
G1 X114.165 Y156.731 E.18977
G1 X114.395 Y157.037 E.01184
G1 X118.774 Y152.658 E.19142
G1 X119.042 Y152.926 E.01173
G1 X114.627 Y157.342 E.193
G1 X114.88 Y157.625 E.01174
G1 X119.31 Y153.195 E.19367
G1 X119.579 Y153.463 E.01173
G1 X115.133 Y157.909 E.19434
G2 X115.398 Y158.18 I2.082 J-1.769 E.01174
G1 X119.847 Y153.731 E.19447
G1 X120.115 Y153.999 E.01173
G1 X115.67 Y158.445 E.19432
G2 X115.956 Y158.696 I1.79 J-1.751 E.01176
G1 X120.383 Y154.268 E.19356
G1 X120.652 Y154.536 E.01173
G1 X116.248 Y158.94 E.19252
G2 X116.554 Y159.17 I1.757 J-2.02 E.01185
G1 X120.92 Y154.804 E.19085
G1 X121.188 Y155.072 E.01173
G1 X116.865 Y159.395 E.18896
G2 X117.185 Y159.612 I1.508 J-1.877 E.01195
G1 X121.456 Y155.341 E.18672
G1 X121.725 Y155.609 E.01173
G1 X117.519 Y159.814 E.18384
G2 X117.863 Y160.007 I1.46 J-2.2 E.01219
G1 X121.993 Y155.877 E.18055
G1 X122.261 Y156.145 E.01173
G1 X118.218 Y160.188 E.17672
G2 X118.577 Y160.365 I1.321 J-2.224 E.01239
G1 X122.529 Y156.413 E.17275
G1 X122.797 Y156.682 E.01173
G1 X118.957 Y160.522 E.16789
G2 X119.342 Y160.673 I1.453 J-3.149 E.01281
G1 X123.066 Y156.95 E.16276
G1 X123.302 Y157.186 E.01032
G1 X123.366 Y157.186 E.00199
G1 X119.742 Y160.81 E.15844
G1 X120.158 Y160.931 E.01339
G1 X123.903 Y157.186 E.1637
G1 X124.439 Y157.186 E.01658
G1 X120.587 Y161.037 E.16837
G2 X121.032 Y161.13 I1.123 J-4.299 E.01403
G1 X124.975 Y157.186 E.17239
G1 X125.512 Y157.186 E.01658
G1 X121.493 Y161.205 E.17571
G2 X121.971 Y161.263 I.802 J-4.642 E.01491
G1 X126.048 Y157.186 E.17823
G1 X126.585 Y157.186 E.01658
G1 X122.47 Y161.3 E.17985
G1 X122.994 Y161.314 E.01617
G1 X127.121 Y157.186 E.18044
G1 X127.658 Y157.186 E.01658
G1 X123.53 Y161.314 E.18046
G1 X124.066 Y161.314 E.01658
G1 X128.194 Y157.186 E.18046
G1 X128.731 Y157.186 E.01658
G1 X124.602 Y161.314 E.18046
G1 X125.139 Y161.314 E.01658
G1 X129.267 Y157.186 E.18046
G1 X129.804 Y157.186 E.01658
G1 X125.675 Y161.314 E.18046
G1 X126.212 Y161.314 E.01658
G1 X130.34 Y157.186 E.18046
G1 X130.876 Y157.186 E.01658
G1 X126.748 Y161.314 E.18046
G1 X127.285 Y161.314 E.01658
G1 X131.413 Y157.186 E.18046
G1 X131.949 Y157.186 E.01658
G1 X127.821 Y161.314 E.18046
G1 X128.358 Y161.314 E.01658
G1 X143.814 Y145.858 E.67567
G1 X143.814 Y146.394 E.01658
G1 X128.894 Y161.314 E.65222
G1 X129.431 Y161.314 E.01658
G1 X143.814 Y146.931 E.62877
G1 X143.814 Y147.467 E.01658
G1 X129.967 Y161.314 E.60532
G1 X130.503 Y161.314 E.01658
G1 X143.814 Y148.003 E.58186
G1 X143.814 Y148.54 E.01658
G1 X131.04 Y161.314 E.55841
G1 X131.576 Y161.314 E.01658
G1 X143.814 Y149.076 E.53496
G1 X143.814 Y149.613 E.01658
G1 X132.113 Y161.314 E.51151
G1 X132.649 Y161.314 E.01658
G1 X143.814 Y150.149 E.48806
G3 X143.809 Y150.691 I-10.582 J.169 E.01675
G1 X133.191 Y161.309 E.46416
G2 X133.752 Y161.284 I.041 J-5.484 E.01737
G1 X143.784 Y151.252 E.43856
G3 X143.723 Y151.85 I-4.813 J-.194 E.0186
G1 X134.347 Y161.226 E.40986
G2 X134.982 Y161.127 I-.649 J-6.251 E.01989
G1 X143.623 Y152.487 E.37771
G1 X143.476 Y153.17 E.02161
G1 X135.668 Y160.978 E.3413
G2 X136.431 Y160.752 I-3.469 J-13.1 E.02459
G1 X143.252 Y153.931 E.29818
G3 X142.914 Y154.804 I-7.474 J-2.384 E.02897
G1 X137.304 Y160.414 E.24523
G2 X138.374 Y159.881 I-4.171 J-9.707 E.03696
G1 X142.381 Y155.874 E.17517
G3 X141.026 Y157.747 I-9.641 J-5.547 E.07159
G3 X139.324 Y159.467 I-34.439 J-32.37 E.07481
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F33600
G1 X140.731 Y158.046 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/45
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
G17
G3 Z8.8 I.078 J-1.214 P1  F42000
G1 X123.349 Y156.925 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.419 Y151.995 E.23129
G3 X116.532 Y147.44 I4.618 J-4.581 E.16773
G1 X116.532 Y134.649 E.42429
G3 X122.75 Y128.199 I6.474 J.019 E.32824
G3 X126.701 Y129.356 I.255 J6.456 E.13897
G1 X136.719 Y136.37 E.40566
G3 X139.468 Y141.652 I-3.752 J5.31 E.20518
G1 X139.468 Y147.44 E.19201
G3 X137.581 Y151.995 I-6.504 J-.026 E.16773
G1 X132.608 Y156.968 E.23331
G1 X123.392 Y156.968 E.30572
G1 X123.391 Y156.968 E.00003
G1 X123.536 Y156.558 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.701 Y151.723 E.21012
G3 X116.924 Y147.433 I4.335 J-4.309 E.14635
G1 X116.924 Y134.656 E.39258
G3 X122.772 Y128.591 I6.082 J.012 E.286
G3 X126.482 Y129.681 I.233 J6.065 E.12093
G1 X136.488 Y136.687 E.37534
G3 X139.076 Y141.659 I-3.521 J4.992 E.17891
G1 X139.076 Y147.433 E.17743
G3 X137.299 Y151.723 I-6.112 J-.019 E.14635
G1 X132.446 Y156.576 E.2109
G1 X123.589 Y156.576 E.27214
M204 S6000
; WIPE_START
G1 F33600
G1 X122.17 Y155.167 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.262 Y147.827 Z9 F42000
G1 X133.543 Y115.266 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X133.468 Y114.982 I.466 J-.274 E.00987
G1 X133.468 Y112.85 E.07073
G3 X133.639 Y112.437 I.566 J-.007 E.01522
G1 X135.463 Y110.613 E.08557
G2 X136.468 Y108.187 I-2.46 J-2.44 E.08935
G2 X136.403 Y105.983 I-17.12 J-.598 E.07318
G2 X128.51 Y99.032 I-7.91 J1.025 E.38097
G2 X125.599 Y99.443 I-.413 J7.578 E.09814
G2 X122.308 Y102.142 I2.509 J6.415 E.14353
G2 X120.852 Y105.56 I9.408 J6.025 E.1238
G2 X119.777 Y110.888 I62.164 J15.324 E.18035
G2 X125 Y122.593 I12.381 J1.493 E.44655
G1 X139.322 Y132.621 E.57996
G3 X144.032 Y141.67 I-6.354 J9.058 E.3517
G1 X144.032 Y150.492 E.29266
G3 X132.992 Y161.532 I-11.041 J-.002 E.57521
G1 X123.008 Y161.532 E.3312
G3 X111.968 Y150.492 I-.004 J-11.036 E.57529
G1 X111.968 Y104.185 E1.53608
G3 X115.205 Y96.371 I11.085 J.014 E.28786
G1 X117.108 Y94.468 E.08929
G1 X138.892 Y94.468 E.72261
G1 X140.795 Y96.371 E.08929
G3 X144.032 Y104.185 I-7.831 J7.821 E.28788
G1 X144.032 Y111.987 E.2588
G3 X140.487 Y115.532 I-3.541 J.004 E.18475
G1 X134.023 Y115.532 E.21442
G3 X133.576 Y115.316 I-.015 J-.54 E.01712
G1 X133.185 Y115.425 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.137 Y115.32 E.00353
G3 X133.076 Y114.994 I.876 J-.334 E.01026
G1 X133.076 Y112.836 E.0663
G3 X133.352 Y112.17 I.957 J.006 E.02271
G1 X135.179 Y110.343 E.07939
G2 X136.076 Y108.177 I-2.181 J-2.172 E.07391
G2 X136.014 Y106.033 I-16.703 J-.59 E.06596
G2 X128.503 Y99.424 I-7.52 J.975 E.33569
G2 X125.738 Y99.81 I-.405 J7.195 E.08633
G2 X122.633 Y102.362 I2.37 J6.049 E.12556
G2 X121.231 Y105.661 I9.074 J5.803 E.11066
G2 X120.166 Y110.935 I61.943 J15.258 E.16538
G2 X125.227 Y122.273 I11.992 J1.446 E.40072
G1 X139.55 Y132.303 E.53728
G3 X144.424 Y141.665 I-6.584 J9.377 E.33704
G1 X144.424 Y150.497 E.2714
G3 X132.997 Y161.924 I-11.433 J-.007 E.55144
G1 X123.003 Y161.924 E.3071
G3 X111.576 Y150.497 I.001 J-11.428 E.55151
G1 X111.576 Y104.18 E1.42319
G3 X114.924 Y96.098 I11.479 J.02 E.27579
G1 X116.946 Y94.076 E.08786
G1 X139.054 Y94.076 E.67934
G1 X141.076 Y96.098 E.08785
G3 X144.424 Y104.18 I-8.111 J8.095 E.27582
G1 X144.424 Y111.996 E.24014
G3 X140.496 Y115.924 I-3.933 J-.005 E.18955
G1 X134.008 Y115.924 E.19934
G3 X133.218 Y115.482 I.005 J-.938 E.02903
G1 X133.215 Y115.477 E.0002
M204 S6000
; WIPE_START
G1 F33600
G1 X133.137 Y115.32 E-.06642
G1 X133.088 Y115.142 E-.07015
G1 X133.076 Y114.994 E-.05663
G1 X133.076 Y113.502 E-.5668
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z9 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z9
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9 F4000
            G39.3 S1
            G0 Z9 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z9.4 F42000
G1 X133.632 Y114.798
G1 Z8.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420813
G1 F15000
G1 X134.029 Y115.195 E.01729
G1 X134.567 Y115.199 E.01658
G1 X133.801 Y114.433 E.03335
G1 X133.801 Y113.899 E.01646
G1 X135.101 Y115.199 E.05662
G1 X135.636 Y115.199 E.01646
G1 X133.801 Y113.364 E.07989
G3 X133.803 Y112.832 I3.774 J-.251 E.01641
G1 X136.17 Y115.199 E.10307
G1 X136.705 Y115.199 E.01646
G1 X134.027 Y112.521 E.11662
G1 X134.294 Y112.253 E.01164
G1 X137.239 Y115.199 E.12826
M73 P89 R2
G1 X137.774 Y115.199 E.01646
G1 X134.561 Y111.986 E.13989
G1 X134.828 Y111.719 E.01164
G1 X138.308 Y115.199 E.15153
G1 X138.842 Y115.199 E.01646
G1 X135.096 Y111.452 E.16317
G1 X135.363 Y111.185 E.01164
G1 X139.377 Y115.199 E.1748
G1 X139.911 Y115.199 E.01646
G1 X135.63 Y110.917 E.18644
G2 X135.888 Y110.64 I-2.614 J-2.688 E.01165
G1 X140.446 Y115.199 E.1985
G2 X140.945 Y115.164 I-.067 J-4.578 E.01543
G1 X136.12 Y110.339 E.21013
G2 X136.325 Y110.009 I-1.526 J-1.176 E.01197
G1 X141.385 Y115.069 E.22035
G2 X141.778 Y114.928 I-.546 J-2.145 E.01289
G1 X136.502 Y109.651 E.22979
G2 X136.642 Y109.257 I-1.877 J-.89 E.01291
G1 X142.133 Y114.748 E.23914
G2 X142.45 Y114.531 I-1.121 J-1.972 E.01185
G1 X136.742 Y108.823 E.24856
G2 X136.794 Y108.34 I-2.357 J-.497 E.01497
G1 X142.737 Y114.283 E.25881
G2 X142.99 Y114.002 I-5.937 J-5.596 E.01165
G1 X136.798 Y107.81 E.26967
G1 X136.793 Y107.27 E.01661
G1 X143.209 Y113.687 E.27944
G2 X143.4 Y113.343 I-2.481 J-1.599 E.01212
G1 X136.788 Y106.731 E.28796
G2 X136.755 Y106.164 I-3.275 J-.098 E.0175
G1 X143.548 Y112.957 E.29581
G2 X143.653 Y112.528 I-4.04 J-1.22 E.01361
G1 X136.671 Y105.546 E.30406
G2 X136.52 Y104.86 I-40.167 J8.517 E.02164
G1 X143.696 Y112.036 E.31253
G2 X143.699 Y111.504 I-6.268 J-.294 E.01639
G1 X136.261 Y104.067 E.32389
G2 X135.823 Y103.094 I-7.541 J2.811 E.03286
G1 X143.868 Y111.139 E.35035
G1 X141.898 Y97.947 F42000
G1 F15000
G1 X138.753 Y94.801 E.13697
G1 X138.219 Y94.801 E.01646
G1 X142.285 Y98.867 E.17706
G3 X142.815 Y99.932 I-9.498 J5.393 E.03663
G1 X137.684 Y94.801 E.22341
G1 X137.15 Y94.801 E.01646
G1 X143.148 Y100.799 E.26119
G3 X143.366 Y101.552 I-10.125 J3.349 E.02416
G1 X136.616 Y94.801 E.29399
G1 X136.081 Y94.801 E.01646
G1 X143.512 Y102.232 E.3236
G3 X143.612 Y102.867 I-4.239 J.996 E.01981
G1 X135.547 Y94.801 E.35125
G1 X135.012 Y94.801 E.01646
G1 X143.671 Y103.46 E.37709
G3 X143.694 Y104.018 I-5.394 J.502 E.01719
G1 X134.478 Y94.801 E.40136
G1 X133.943 Y94.801 E.01646
G1 X143.699 Y104.557 E.42483
G1 X143.699 Y105.091 E.01646
G1 X133.409 Y94.801 E.4481
G1 X132.875 Y94.801 E.01646
G1 X143.699 Y105.625 E.47137
G1 X143.699 Y106.16 E.01646
G1 X132.34 Y94.801 E.49465
G1 X131.806 Y94.801 E.01646
G1 X143.699 Y106.694 E.51792
G1 X143.699 Y107.229 E.01646
G1 X131.271 Y94.801 E.54119
G1 X130.737 Y94.801 E.01646
G1 X143.699 Y107.763 E.56447
G1 X143.699 Y108.298 E.01646
G1 X130.202 Y94.801 E.58774
G1 X129.668 Y94.801 E.01646
G1 X143.699 Y108.832 E.61101
G1 X143.699 Y109.366 E.01646
G1 X129.134 Y94.801 E.63429
G1 X128.599 Y94.801 E.01646
G1 X143.699 Y109.901 E.65756
G1 X143.699 Y110.435 E.01646
G1 X128.065 Y94.801 E.68083
G1 X127.53 Y94.801 E.01646
G1 X132.406 Y99.677 E.21231
G2 X131.433 Y99.239 I-3.784 J7.103 E.03286
G1 X126.996 Y94.801 E.19324
G1 X126.462 Y94.801 E.01646
G1 X130.648 Y98.987 E.1823
G2 X129.956 Y98.83 I-1.903 J6.767 E.02185
G1 X125.927 Y94.801 E.17545
G1 X125.393 Y94.801 E.01646
G1 X129.336 Y98.745 E.17172
G2 X128.768 Y98.711 I-.486 J3.429 E.01753
G1 X124.858 Y94.801 E.17027
G1 X124.324 Y94.801 E.01646
G1 X128.226 Y98.704 E.16994
G2 X127.694 Y98.706 I-.247 J4.501 E.0164
G1 X123.789 Y94.801 E.17004
G1 X123.255 Y94.801 E.01646
G1 X127.188 Y98.734 E.17126
G2 X126.721 Y98.802 I.276 J3.502 E.01452
G1 X122.721 Y94.801 E.17423
G1 X122.186 Y94.801 E.01646
G1 X126.274 Y98.89 E.17803
G2 X125.859 Y99.009 I.677 J3.144 E.01331
G1 X121.652 Y94.801 E.18322
G1 X121.117 Y94.801 E.01646
G1 X125.457 Y99.141 E.189
G1 X125.079 Y99.298 E.0126
G1 X120.583 Y94.801 E.19581
G1 X120.048 Y94.801 E.01646
G1 X124.721 Y99.474 E.20347
G2 X124.381 Y99.669 I1.052 J2.22 E.01206
G1 X119.514 Y94.801 E.21197
G1 X118.98 Y94.801 E.01646
G1 X124.051 Y99.873 E.22085
G2 X123.743 Y100.099 I1.493 J2.356 E.01178
G1 X118.445 Y94.801 E.23071
G1 X117.911 Y94.801 E.01646
G1 X123.447 Y100.337 E.24109
G2 X123.169 Y100.594 I1.259 J1.646 E.01166
G1 X117.376 Y94.801 E.25224
G1 X117.246 Y94.801 E.00401
G1 X117.044 Y95.003 E.0088
G1 X122.899 Y100.858 E.25497
G2 X122.65 Y101.143 I2.372 J2.325 E.01167
G1 X116.777 Y95.271 E.25575
G1 X116.51 Y95.538 E.01164
G1 X122.412 Y101.44 E.25702
G2 X122.182 Y101.745 I2.575 J2.178 E.01176
G1 X116.242 Y95.805 E.25866
G1 X115.975 Y96.072 E.01164
G1 X121.964 Y102.061 E.26082
G2 X121.758 Y102.39 I2.69 J1.914 E.01195
G1 X115.708 Y96.34 E.26349
G1 X115.441 Y96.607 E.01164
G1 X121.567 Y102.733 E.2668
G2 X121.385 Y103.085 I2.758 J1.651 E.01222
G1 X115.181 Y96.881 E.27019
G2 X114.927 Y97.162 I2.601 J2.595 E.01166
G1 X121.217 Y103.452 E.27392
G1 X121.06 Y103.829 E.01259
G1 X114.682 Y97.451 E.27777
G1 X114.449 Y97.753 E.01173
G1 X120.921 Y104.225 E.28183
G1 X120.787 Y104.625 E.013
G1 X114.227 Y98.065 E.28568
G1 X114.01 Y98.383 E.01185
G1 X120.656 Y105.029 E.28941
G1 X120.545 Y105.452 E.01348
G1 X113.812 Y98.719 E.29322
G1 X113.617 Y99.058 E.01205
G1 X120.434 Y105.875 E.29688
G2 X120.325 Y106.301 I4.846 J1.465 E.01353
G1 X113.43 Y99.406 E.30028
G1 X113.257 Y99.768 E.01235
G1 X120.23 Y106.74 E.30364
G1 X120.135 Y107.179 E.01384
G1 X113.097 Y100.141 E.30649
G2 X112.947 Y100.526 I3.658 J1.642 E.01272
G1 X120.04 Y107.619 E.30886
G2 X119.947 Y108.06 I7.605 J1.826 E.0139
G1 X112.809 Y100.923 E.31083
G1 X112.689 Y101.337 E.01327
G1 X119.863 Y108.511 E.31242
G1 X119.779 Y108.961 E.01411
G1 X112.581 Y101.764 E.31343
G2 X112.489 Y102.205 I4.237 J1.12 E.0139
G1 X119.695 Y109.411 E.31381
G1 X119.61 Y109.862 E.01411
G1 X112.412 Y102.663 E.31348
G2 X112.354 Y103.139 I4.698 J.82 E.01477
G1 X119.526 Y110.312 E.31237
G2 X119.464 Y110.784 I2.937 J.632 E.01466
G1 X112.321 Y103.641 E.31106
G1 X112.303 Y104.157 E.01591
G1 X119.412 Y111.267 E.30962
G2 X119.372 Y111.761 I3.305 J.519 E.01528
G1 X112.301 Y104.69 E.30792
G1 X112.301 Y105.225 E.01646
G1 X119.356 Y112.279 E.30721
G2 X119.366 Y112.824 I4.598 J.185 E.01679
G1 X112.301 Y105.759 E.30767
G1 X112.301 Y106.293 E.01646
G1 X119.403 Y113.395 E.30925
G1 X119.464 Y113.99 E.01844
G1 X112.301 Y106.828 E.31191
G1 X112.301 Y107.362 E.01646
G1 X119.562 Y114.623 E.31621
G1 X119.691 Y115.286 E.02079
G1 X112.301 Y107.897 E.3218
G1 X112.301 Y108.431 E.01646
G1 X119.881 Y116.011 E.3301
G2 X120.146 Y116.81 I14.435 J-4.34 E.02593
G1 X112.301 Y108.966 E.34164
G1 X112.301 Y109.5 E.01646
G1 X120.521 Y117.72 E.35797
G1 X121.013 Y118.685 E.03335
G1 X121.114 Y118.847 E.00588
G1 X112.301 Y110.034 E.38377
G1 X112.301 Y110.569 E.01646
G1 X143.699 Y141.966 E1.36731
G1 X143.699 Y142.501 E.01646
G1 X112.301 Y111.103 E1.36731
G1 X112.301 Y111.638 E.01646
G1 X136.412 Y135.748 E1.04999
G1 X134.629 Y134.5 E.06701
G1 X112.301 Y112.172 E.97236
G1 X112.301 Y112.707 E.01646
G1 X132.847 Y133.252 E.89473
G1 X131.064 Y132.004 E.06701
G1 X112.301 Y113.241 E.81709
G1 X112.301 Y113.775 E.01646
G1 X129.282 Y130.756 E.73946
G1 X127.499 Y129.507 E.06701
G1 X112.301 Y114.31 E.66183
G1 X112.301 Y114.844 E.01646
G1 X126.028 Y128.571 E.59777
G2 X125.122 Y128.199 I-3.752 J7.861 E.03016
G1 X112.301 Y115.379 E.55833
G1 X112.301 Y115.913 E.01646
G1 X124.394 Y128.006 E.52661
G2 X123.757 Y127.903 I-1.76 J8.911 E.01987
G1 X112.301 Y116.447 E.49888
G1 X112.301 Y116.982 E.01646
G1 X123.186 Y127.867 E.47402
G2 X122.656 Y127.871 I-.232 J4.433 E.01634
G1 X112.301 Y117.516 E.45092
M73 P90 R2
G1 X112.301 Y118.051 E.01646
G1 X122.165 Y127.914 E.42953
G2 X121.706 Y127.989 I.485 J4.379 E.01433
G1 X112.301 Y118.585 E.40954
G1 X112.301 Y119.12 E.01646
G1 X121.272 Y128.09 E.39064
G2 X120.855 Y128.208 I.527 J2.655 E.01334
G1 X112.301 Y119.654 E.3725
G1 X112.301 Y120.188 E.01646
G1 X120.466 Y128.353 E.35556
G2 X120.092 Y128.514 I.921 J2.655 E.01254
G1 X112.301 Y120.723 E.33929
G1 X112.301 Y121.257 E.01646
G1 X119.738 Y128.694 E.32386
G2 X119.402 Y128.892 I1.191 J2.4 E.01203
G1 X112.301 Y121.792 E.30923
G1 X112.301 Y122.326 E.01646
G1 X119.081 Y129.106 E.29526
G2 X118.775 Y129.334 I1.425 J2.234 E.01177
G1 X112.301 Y122.861 E.28191
G1 X112.301 Y123.395 E.01646
G1 X118.482 Y129.576 E.26918
G1 X118.208 Y129.836 E.01164
G1 X112.301 Y123.929 E.25724
G1 X112.301 Y124.464 E.01646
G1 X117.949 Y130.111 E.24593
G2 X117.703 Y130.4 I1.874 J1.846 E.01168
G1 X112.301 Y124.998 E.23523
G1 X112.301 Y125.533 E.01646
G1 X117.471 Y130.702 E.22512
G2 X117.258 Y131.024 I2.458 J1.858 E.01188
G1 X112.301 Y126.067 E.21585
G1 X112.301 Y126.601 E.01646
G1 X117.059 Y131.359 E.20718
G2 X116.876 Y131.711 I1.977 J1.251 E.01222
G1 X112.301 Y127.136 E.19922
G1 X112.301 Y127.67 E.01646
G1 X116.712 Y132.08 E.19206
G2 X116.565 Y132.468 I2.599 J1.204 E.01278
G1 X112.301 Y128.205 E.18568
G1 X112.301 Y128.739 E.01646
G1 X116.438 Y132.876 E.18017
G2 X116.337 Y133.309 I3.222 J.985 E.0137
G1 X112.301 Y129.274 E.17574
G1 X112.301 Y129.808 E.01646
G1 X116.26 Y133.766 E.17238
G2 X116.213 Y134.254 I3.351 J.569 E.01509
G1 X112.301 Y130.342 E.17033
G1 X112.301 Y130.877 E.01646
G1 X116.199 Y134.774 E.16972
G1 X116.199 Y135.309 E.01646
G1 X112.301 Y131.411 E.16972
G1 X112.301 Y131.946 E.01646
G1 X116.199 Y135.843 E.16972
G1 X116.199 Y136.377 E.01646
G1 X112.301 Y132.48 E.16972
G1 X112.301 Y133.015 E.01646
G1 X116.199 Y136.912 E.16972
M73 P90 R1
G1 X116.199 Y137.446 E.01646
G1 X112.301 Y133.549 E.16972
G1 X112.301 Y134.083 E.01646
G1 X116.199 Y137.981 E.16972
G1 X116.199 Y138.515 E.01646
G1 X112.301 Y134.618 E.16972
G1 X112.301 Y135.152 E.01646
G1 X116.199 Y139.049 E.16972
G1 X116.199 Y139.584 E.01646
G1 X112.301 Y135.687 E.16972
G1 X112.301 Y136.221 E.01646
G1 X116.199 Y140.118 E.16972
G1 X116.199 Y140.653 E.01646
G1 X112.301 Y136.755 E.16972
G1 X112.301 Y137.29 E.01646
G1 X116.199 Y141.187 E.16972
G1 X116.199 Y141.722 E.01646
G1 X112.301 Y137.824 E.16972
G1 X112.301 Y138.359 E.01646
G1 X116.199 Y142.256 E.16972
G1 X116.199 Y142.79 E.01646
G1 X112.301 Y138.893 E.16972
G1 X112.301 Y139.428 E.01646
G1 X116.199 Y143.325 E.16972
G1 X116.199 Y143.859 E.01646
G1 X112.301 Y139.962 E.16972
G1 X112.301 Y140.496 E.01646
G1 X116.199 Y144.394 E.16972
G1 X116.199 Y144.928 E.01646
G1 X112.301 Y141.031 E.16972
G1 X112.301 Y141.565 E.01646
G1 X116.199 Y145.463 E.16972
G1 X116.199 Y145.997 E.01646
G1 X112.301 Y142.1 E.16972
G1 X112.301 Y142.634 E.01646
G1 X116.199 Y146.531 E.16972
G1 X116.199 Y147.066 E.01646
G1 X112.301 Y143.169 E.16972
G1 X112.301 Y143.703 E.01646
G1 X116.204 Y147.606 E.16997
G2 X116.244 Y148.18 I3.944 J.015 E.01774
G1 X112.301 Y144.237 E.17171
G1 X112.301 Y144.772 E.01646
G1 X116.344 Y148.814 E.17603
G2 X116.539 Y149.544 I7.876 J-1.717 E.02327
G1 X112.301 Y145.306 E.18453
G1 X112.301 Y145.841 E.01646
G1 X116.918 Y150.458 E.20106
G2 X118.179 Y152.226 I6.095 J-3.01 E.06716
G1 X123.254 Y157.301 E.22102
G1 X123.762 Y157.301 E.01565
G1 X127.659 Y161.199 E.16972
G1 X128.194 Y161.199 E.01646
G1 X124.297 Y157.301 E.16972
G1 X124.831 Y157.301 E.01646
G1 X128.728 Y161.199 E.16972
G1 X129.263 Y161.199 E.01646
G1 X125.365 Y157.301 E.16972
G1 X125.9 Y157.301 E.01646
G1 X129.797 Y161.199 E.16972
G1 X130.331 Y161.199 E.01646
G1 X126.434 Y157.301 E.16972
G1 X126.969 Y157.301 E.01646
G1 X130.866 Y161.199 E.16972
G1 X131.4 Y161.199 E.01646
G1 X127.503 Y157.301 E.16972
G1 X128.037 Y157.301 E.01646
G1 X131.935 Y161.199 E.16972
G1 X132.469 Y161.199 E.01646
G1 X128.572 Y157.301 E.16972
G1 X129.106 Y157.301 E.01646
G1 X133.003 Y161.198 E.1697
G1 X133.524 Y161.185 E.01605
G1 X129.641 Y157.301 E.16912
G1 X130.175 Y157.301 E.01646
G1 X134.021 Y161.148 E.1675
G2 X134.495 Y161.087 I-.27 J-3.983 E.01471
G1 X130.71 Y157.301 E.16486
G1 X131.244 Y157.301 E.01646
G1 X134.953 Y161.01 E.16152
G1 X135.393 Y160.916 E.01386
G1 X131.778 Y157.301 E.15741
G1 X132.313 Y157.301 E.01646
G1 X135.827 Y160.815 E.15303
G1 X136.241 Y160.695 E.01327
G1 X132.797 Y157.251 E.14998
G1 X133.064 Y156.984 E.01164
G1 X136.638 Y160.557 E.15563
G2 X137.022 Y160.407 I-1.104 J-3.396 E.01271
G1 X133.331 Y156.716 E.16074
G1 X133.598 Y156.449 E.01164
G1 X137.4 Y160.251 E.16556
G2 X137.761 Y160.077 I-1.322 J-3.203 E.01233
G1 X133.866 Y156.182 E.16962
G1 X134.133 Y155.915 E.01164
G1 X138.112 Y159.894 E.17328
G2 X138.454 Y159.701 I-1.693 J-3.413 E.01209
G1 X134.4 Y155.648 E.17654
G1 X134.667 Y155.38 E.01164
G1 X138.784 Y159.497 E.17929
G2 X139.103 Y159.282 I-1.928 J-3.202 E.01186
G1 X134.934 Y155.113 E.18155
G1 X135.202 Y154.846 E.01164
G1 X139.415 Y159.059 E.18347
G2 X139.714 Y158.824 I-2.474 J-3.457 E.01172
G1 X135.469 Y154.579 E.18487
G1 X135.736 Y154.311 E.01164
G1 X140.004 Y158.58 E.18587
G2 X140.287 Y158.328 I-1.938 J-2.469 E.01166
G1 X136.003 Y154.044 E.18657
G1 X136.27 Y153.777 E.01164
G1 X140.565 Y158.065 E.18687
G1 X140.822 Y157.794 E.0115
G1 X136.538 Y153.51 E.18657
G1 X136.805 Y153.243 E.01164
G1 X141.075 Y157.513 E.18596
G2 X141.32 Y157.224 I-2.678 J-2.523 E.01168
G1 X137.072 Y152.975 E.18501
G1 X137.339 Y152.708 E.01164
G1 X141.553 Y156.922 E.1835
G2 X141.777 Y156.611 I-2.901 J-2.324 E.0118
G1 X137.607 Y152.441 E.1816
G2 X137.872 Y152.172 I-3.551 J-3.766 E.01164
G1 X141.992 Y156.292 E.17945
G1 X142.196 Y155.962 E.01196
G1 X138.129 Y151.895 E.17712
G2 X138.368 Y151.6 I-1.898 J-1.782 E.01171
G1 X142.389 Y155.62 E.17509
G2 X142.573 Y155.269 I-3.31 J-1.956 E.0122
G1 X138.594 Y151.291 E.17327
G2 X138.805 Y150.967 I-2.087 J-1.59 E.0119
G1 X142.747 Y154.909 E.17168
G1 X142.903 Y154.531 E.01259
G1 X139.001 Y150.629 E.16995
G1 X139.177 Y150.27 E.01229
G1 X143.054 Y154.148 E.16884
G2 X143.192 Y153.751 I-3.747 J-1.525 E.01293
G1 X139.337 Y149.896 E.16789
G2 X139.475 Y149.5 I-3.053 J-1.287 E.01293
G1 X143.312 Y153.337 E.16712
G2 X143.42 Y152.91 I-4.089 J-1.253 E.01357
G1 X139.593 Y149.083 E.16664
G2 X139.688 Y148.644 I-2.957 J-.868 E.01386
G1 X143.512 Y152.468 E.16654
G2 X143.589 Y152.01 I-4.589 J-1.004 E.0143
G1 X139.756 Y148.178 E.16691
G2 X139.793 Y147.68 I-3.383 J-.5 E.01538
G1 X143.643 Y151.53 E.16766
G2 X143.684 Y151.037 I-4.058 J-.592 E.01523
G1 X139.801 Y147.154 E.1691
G1 X139.801 Y146.62 E.01646
G1 X143.698 Y150.516 E.16969
G2 X143.699 Y149.982 I-10.351 J-.281 E.01644
G1 X139.801 Y146.085 E.16972
G1 X139.801 Y145.551 E.01646
G1 X143.699 Y149.448 E.16972
G1 X143.699 Y148.914 E.01646
G1 X139.801 Y145.016 E.16972
G1 X139.801 Y144.482 E.01646
G1 X143.699 Y148.379 E.16972
G1 X143.699 Y147.845 E.01646
G1 X139.801 Y143.947 E.16972
G1 X139.801 Y143.413 E.01646
G1 X143.699 Y147.31 E.16972
G1 X143.699 Y146.776 E.01646
G1 X139.801 Y142.879 E.16972
G1 X139.801 Y142.344 E.01646
G1 X143.699 Y146.241 E.16972
G1 X143.699 Y145.707 E.01646
G1 X139.801 Y141.81 E.16972
G2 X139.788 Y141.262 I-7.855 J-.082 E.01688
G1 X143.699 Y145.173 E.1703
G1 X143.699 Y144.638 E.01646
G1 X139.727 Y140.666 E.17296
G2 X139.59 Y139.995 I-4.894 J.648 E.02111
G1 X143.699 Y144.104 E.17892
G1 X143.699 Y143.569 E.01646
G1 X139.341 Y139.212 E.18976
G2 X138.838 Y138.175 I-6.94 J2.724 E.03554
G1 X143.868 Y143.205 E.21905
G1 X143.867 Y141.6 F42000
G1 F15000
G1 X125.89 Y123.623 E.78284
G1 X127.673 Y124.871 E.06701
G1 X143.665 Y140.864 E.69644
G2 X143.601 Y140.265 I-5.161 J.254 E.01856
M73 P91 R1
G1 X129.455 Y126.12 E.616
G1 X131.238 Y127.368 E.06701
G1 X143.491 Y139.621 E.5336
G2 X143.344 Y138.939 I-4.914 J.704 E.02148
G1 X133.021 Y128.616 E.44956
G1 X134.803 Y129.864 E.06701
G1 X143.109 Y138.17 E.36169
G2 X142.757 Y137.284 I-10.316 J3.582 E.02937
G1 X136.586 Y131.112 E.26874
G1 X138.369 Y132.361 E.06701
G1 X142.614 Y136.606 E.18489
; WIPE_START
G1 F33600
G1 X141.2 Y135.192 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.619 Y141.932 Z9 F42000
G1 X127.295 Y161.368 Z9
G1 Z8.6
G1 E.8 F1800
G1 F15000
G1 X112.301 Y146.375 E.65293
G1 X112.301 Y146.909 E.01646
G1 X126.591 Y161.199 E.62227
G1 X126.056 Y161.199 E.01646
G1 X112.301 Y147.444 E.599
G1 X112.301 Y147.978 E.01646
G1 X125.522 Y161.199 E.57573
G1 X124.987 Y161.199 E.01646
G1 X112.301 Y148.513 E.55245
G1 X112.301 Y149.047 E.01646
G1 X124.453 Y161.199 E.52918
G1 X123.918 Y161.199 E.01646
G1 X112.301 Y149.582 E.50591
G1 X112.301 Y150.116 E.01646
G1 X123.384 Y161.199 E.48263
G3 X122.844 Y161.193 I-.185 J-7.725 E.01664
G1 X112.306 Y150.655 E.45891
G2 X112.328 Y151.212 I5.412 J.059 E.01718
G1 X122.289 Y161.172 E.43376
G3 X121.697 Y161.115 I.27 J-5.905 E.0183
G1 X112.387 Y151.805 E.40546
G2 X112.487 Y152.439 I4.336 J-.358 E.01979
G1 X121.066 Y161.018 E.37362
G3 X120.384 Y160.871 I1.088 J-6.685 E.02149
G1 X112.632 Y153.119 E.33758
G2 X112.847 Y153.868 I4.826 J-.978 E.02402
G1 X119.629 Y160.651 E.29536
G3 X118.763 Y160.318 I2.458 J-7.706 E.02861
G1 X113.179 Y154.734 E.24316
G1 X113.199 Y154.788 E.00177
G2 X113.709 Y155.799 I8.978 J-3.892 E.03489
G1 X117.701 Y159.791 E.17383
G3 X115.359 Y157.984 I5.12 J-9.055 E.0914
G1 X114.092 Y156.717 E.05517
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X115.359 Y157.984 E-.68082
G1 X115.509 Y158.129 E-.07918
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/45
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
G17
G3 Z9 I.167 J1.205 P1  F42000
G1 X123.306 Y157.045 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.337 Y152.077 E.23309
G3 X116.416 Y147.44 I4.675 J-4.652 E.17078
G1 X116.416 Y134.649 E.42428
G3 X122.782 Y128.082 I6.59 J.019 E.3353
G3 X126.767 Y129.261 I.225 J6.565 E.14029
G1 X136.785 Y136.275 E.40566
G3 X139.584 Y141.652 I-3.789 J5.389 E.20894
G1 X139.584 Y147.44 E.192
G3 X137.663 Y152.077 I-6.602 J-.019 E.17077
G1 X132.656 Y157.084 E.23489
G1 X123.35 Y157.084 E.3087
G1 X123.48 Y156.665 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.619 Y151.804 E.21122
G3 X116.809 Y147.433 I4.392 J-4.38 E.14917
G1 X116.809 Y134.656 E.39258
G3 X122.803 Y128.473 I6.198 J.012 E.29254
G3 X126.548 Y129.586 I.202 J6.178 E.12215
G1 X136.554 Y136.592 E.37534
G3 X139.191 Y141.659 I-3.56 J5.073 E.18239
G1 X139.191 Y147.433 E.17742
G3 X137.381 Y151.804 I-6.209 J-.011 E.14916
G1 X132.494 Y156.691 E.21237
G1 X123.529 Y156.691 E.27545
M204 S6000
; WIPE_START
G1 F33600
G1 X122.112 Y155.281 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.221 Y147.945 Z9.2 F42000
G1 X133.641 Y115.195 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X133.586 Y115.01 I.379 J-.214 E.00648
G1 X133.584 Y112.85 E.07163
G3 X133.721 Y112.518 I.45 J-.008 E.01226
G1 X135.545 Y110.695 E.08554
G2 X136.584 Y108.187 I-2.539 J-2.521 E.09238
G2 X136.519 Y105.976 I-17.313 J-.598 E.07341
G2 X128.51 Y98.916 I-8.024 J1.03 E.38677
G2 X125.512 Y99.353 I-.419 J7.63 E.10115
G2 X122.5 Y101.676 I2.486 J6.339 E.12787
G2 X120.882 Y105.028 I8.102 J5.978 E.12421
G2 X119.655 Y110.933 I50.354 J13.538 E.20014
G2 X124.933 Y122.687 I12.576 J1.416 E.44845
G1 X139.255 Y132.716 E.57997
G3 X143.916 Y141.67 I-6.273 J8.956 E.34806
G1 X143.916 Y150.492 E.29265
G3 X132.992 Y161.416 I-10.926 J-.002 E.5692
G1 X123.008 Y161.416 E.3312
G3 X112.084 Y150.492 I-.005 J-10.919 E.5693
G1 X112.084 Y104.186 E1.53608
G3 X115.286 Y96.453 I10.931 J-.002 E.28491
G1 X117.156 Y94.584 E.0877
G1 X138.844 Y94.584 E.71943
G1 X140.368 Y96.108 E.0715
G3 X143.916 Y104.186 I-7.48 J8.104 E.30109
G1 X143.916 Y111.987 E.25879
G3 X140.487 Y115.416 I-3.423 J.006 E.17877
G1 X134.024 Y115.416 E.21438
G3 X133.674 Y115.245 I-.004 J-.435 E.01341
G1 X133.295 Y115.394 F42000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X133.194 Y115.027 I.706 J-.393 E.01181
G1 X133.192 Y112.836 E.06732
G3 X133.434 Y112.251 I.94 J.047 E.01984
G1 X135.26 Y110.425 E.07938
G2 X136.191 Y108.177 I-2.261 J-2.253 E.0767
G2 X136.13 Y106.025 I-16.896 J-.59 E.06618
G2 X128.503 Y99.309 I-7.634 J.98 E.34106
G2 X125.655 Y99.718 I-.411 J7.25 E.08901
G2 X122.812 Y101.913 I2.338 J5.967 E.11185
G2 X121.257 Y105.14 I7.795 J5.744 E.11072
G2 X120.045 Y110.979 I50.039 J13.439 E.18333
G2 X125.161 Y122.368 I12.185 J1.37 E.40252
G1 X139.484 Y132.397 E.53728
G3 X144.309 Y141.665 I-6.502 J9.274 E.33367
G1 X144.309 Y150.497 E.2714
G3 X132.997 Y161.809 I-11.318 J-.007 E.54586
G1 X123.003 Y161.809 E.3071
G3 X111.691 Y150.497 I0 J-11.311 E.54595
G1 X111.691 Y104.18 E1.42319
G3 X115.006 Y96.179 I11.324 J.004 E.27306
G1 X116.994 Y94.191 E.08638
G1 X139.006 Y94.191 E.6764
G1 X140.645 Y95.831 E.07122
G3 X144.309 Y104.18 I-7.752 J8.379 E.28821
G1 X144.309 Y111.995 E.24014
G3 X140.496 Y115.809 I-3.812 J.001 E.18405
G1 X134.009 Y115.809 E.19933
G3 X133.326 Y115.445 I-.008 J-.807 E.02477
M204 S6000
; WIPE_START
G1 F33600
G1 X133.206 Y115.149 E-.12126
G1 X133.194 Y115.027 E-.04681
G1 X133.192 Y113.469 E-.59193
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z9.2 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z9.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.2 F4000
            G39.3 S1
            G0 Z9.2 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z9.6 F42000
G1 X143.546 Y113.132
G1 Z8.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421741
G1 F15000
G1 X141.974 Y114.704 E.06862
G3 X141.127 Y115.015 I-1.361 J-2.396 E.02798
G1 X143.515 Y112.627 E.10423
G2 X143.581 Y112.025 I-3.188 J-.656 E.01872
G1 X140.525 Y115.081 E.13341
G3 X139.988 Y115.083 I-.291 J-6.265 E.0166
G1 X143.583 Y111.488 E.15697
G1 X143.583 Y110.952 E.01654
G1 X139.452 Y115.083 E.18035
G1 X138.916 Y115.083 E.01654
G1 X143.583 Y110.416 E.20374
G1 X143.583 Y109.88 E.01654
G1 X138.38 Y115.083 E.22713
G1 X137.845 Y115.083 E.01654
G1 X143.583 Y109.345 E.25052
G1 X143.583 Y108.809 E.01654
G1 X137.309 Y115.083 E.2739
G1 X136.773 Y115.083 E.01654
G1 X143.583 Y108.273 E.29729
G1 X143.583 Y107.737 E.01654
G1 X136.237 Y115.083 E.32068
G1 X135.702 Y115.083 E.01654
G1 X143.583 Y107.202 E.34407
G1 X143.583 Y106.666 E.01654
G1 X135.166 Y115.083 E.36746
G1 X134.63 Y115.083 E.01654
G1 X143.583 Y106.13 E.39084
G1 X143.583 Y105.595 E.01654
G1 X134.095 Y115.083 E.41423
G3 X133.928 Y115.023 I-.021 J-.205 E.00566
G3 X133.919 Y114.723 I.787 J-.174 E.00932
G1 X143.583 Y105.059 E.42191
G1 X143.583 Y104.523 E.01654
G1 X133.918 Y114.188 E.42193
G1 X133.918 Y113.653 E.01652
G1 X143.578 Y103.992 E.42173
G2 X143.557 Y103.478 I-4.969 J-.053 E.0159
G1 X133.917 Y113.118 E.42083
G1 X133.917 Y112.886 E.00715
G3 X133.974 Y112.736 I.196 J-.011 E.0051
G1 X135.786 Y110.925 E.07909
G2 X136.416 Y110.083 I-3.023 J-2.918 E.03252
G1 X143.513 Y102.986 E.30986
G2 X143.45 Y102.513 I-4.584 J.371 E.01473
G1 X136.78 Y109.183 E.29118
G2 X136.9 Y108.527 I-4.604 J-1.181 E.02059
G1 X143.367 Y102.06 E.28232
G2 X143.266 Y101.626 I-3.913 J.687 E.01377
G1 X136.917 Y107.975 E.27716
G1 X136.917 Y107.439 E.01654
G1 X143.153 Y101.203 E.27225
G2 X143.025 Y100.796 I-4.21 J1.105 E.01319
G1 X136.914 Y106.906 E.26675
G2 X136.893 Y106.391 I-4.051 J-.092 E.01591
G1 X142.885 Y100.4 E.26156
G1 X142.729 Y100.02 E.01268
G1 X136.845 Y105.904 E.25688
G1 X136.771 Y105.443 E.01443
G1 X142.562 Y99.652 E.25281
G2 X142.384 Y99.293 I-3.312 J1.416 E.01235
G1 X136.674 Y105.004 E.24929
G2 X136.558 Y104.583 I-3.358 J.697 E.01346
G1 X142.196 Y98.946 E.24611
G2 X141.996 Y98.61 I-3.106 J1.628 E.01207
G1 X136.426 Y104.18 E.24314
G2 X136.279 Y103.791 I-3.384 J1.059 E.01283
G1 X141.786 Y98.284 E.24043
G1 X141.568 Y97.967 E.01189
G1 X136.116 Y103.419 E.238
G1 X135.936 Y103.063 E.01231
G1 X141.336 Y97.663 E.23572
G2 X141.096 Y97.367 I-2.971 J2.163 E.01176
G1 X135.743 Y102.72 E.23369
G2 X135.538 Y102.389 I-2.7 J1.443 E.01202
G1 X140.848 Y97.079 E.23181
G1 X140.584 Y96.808 E.0117
G1 X135.322 Y102.07 E.22972
G2 X135.086 Y101.769 I-2.199 J1.483 E.01179
G1 X140.32 Y96.536 E.22847
G2 X140.055 Y96.265 I-9.789 J9.329 E.01169
G1 X134.845 Y101.475 E.22743
G2 X134.591 Y101.193 I-2.367 J1.878 E.01172
G1 X139.787 Y95.998 E.22682
G1 X139.519 Y95.73 E.01169
G1 X134.323 Y100.925 E.22682
G2 X134.042 Y100.671 I-2.141 J2.078 E.01172
G1 X139.251 Y95.462 E.22739
G1 X138.983 Y95.194 E.01169
G1 X133.751 Y100.426 E.2284
G1 X133.449 Y100.192 E.01179
G1 X138.715 Y94.926 E.22989
G1 X138.706 Y94.917 E.00041
M73 P92 R1
G1 X138.189 Y94.917 E.01596
G1 X133.13 Y99.975 E.22083
G2 X132.801 Y99.769 I-1.782 J2.486 E.01201
G1 X137.653 Y94.917 E.21184
G1 X137.117 Y94.917 E.01654
G1 X132.459 Y99.575 E.20335
G1 X132.103 Y99.395 E.01231
G1 X136.582 Y94.917 E.1955
G1 X136.046 Y94.917 E.01654
G1 X131.732 Y99.231 E.18833
G2 X131.344 Y99.083 I-1.457 J3.227 E.01281
G1 X135.51 Y94.917 E.18186
G1 X134.974 Y94.917 E.01654
G1 X130.941 Y98.95 E.17608
G2 X130.524 Y98.831 I-1.207 J3.444 E.01339
G1 X134.439 Y94.917 E.17089
G1 X133.903 Y94.917 E.01654
G1 X130.086 Y98.734 E.16663
G1 X129.624 Y98.66 E.01443
G1 X133.367 Y94.917 E.1634
G1 X132.832 Y94.917 E.01654
G1 X129.139 Y98.61 E.16121
G2 X128.617 Y98.595 I-.343 J3.015 E.01613
G1 X132.296 Y94.917 E.16059
G1 X131.76 Y94.917 E.01654
G1 X128.086 Y98.591 E.16038
G2 X127.542 Y98.599 I-.228 J2.9 E.01682
G1 X131.224 Y94.917 E.16073
G1 X130.689 Y94.917 E.01654
G1 X126.957 Y98.648 E.16289
G2 X126.307 Y98.763 I1.333 J9.462 E.02039
G1 X130.153 Y94.917 E.1679
G1 X129.617 Y94.917 E.01654
G1 X125.541 Y98.988 E.17784
G2 X124.583 Y99.415 I2.769 J7.492 E.03238
G1 X129.081 Y94.917 E.19636
G1 X128.546 Y94.917 E.01654
G1 X112.417 Y111.046 E.70411
G1 X112.417 Y111.581 E.01654
G1 X121.646 Y102.352 E.40292
G2 X121.098 Y103.436 I8.622 J5.043 E.03753
G1 X112.417 Y112.117 E.37898
G1 X112.417 Y112.653 E.01654
G1 X120.776 Y104.293 E.36493
G2 X120.522 Y105.083 I5.928 J2.341 E.02562
G1 X112.417 Y113.189 E.35386
G1 X112.417 Y113.724 E.01654
G1 X120.33 Y105.811 E.34547
G2 X120.161 Y106.515 I7.927 J2.274 E.02238
G1 X112.417 Y114.26 E.33809
G1 X112.417 Y114.796 E.01654
G1 X120.013 Y107.2 E.3316
G1 X119.864 Y107.885 E.02163
G1 X112.417 Y115.331 E.3251
G1 X112.417 Y115.867 E.01654
G1 X119.739 Y108.545 E.31966
G1 X119.617 Y109.203 E.02067
G1 X112.417 Y116.403 E.31431
G1 X112.417 Y116.939 E.01654
G1 X119.494 Y109.862 E.30896
G2 X119.374 Y110.517 I5.187 J1.287 E.02059
G1 X112.417 Y117.474 E.30372
G1 X112.417 Y118.01 E.01654
G1 X119.299 Y111.128 E.30046
G1 X119.261 Y111.701 E.01775
G1 X112.417 Y118.546 E.29881
G1 X112.417 Y119.082 E.01654
G1 X119.243 Y112.255 E.298
G2 X119.248 Y112.786 I6.023 J.207 E.01639
G1 X112.417 Y119.617 E.29823
G1 X112.417 Y120.153 E.01654
G1 X119.274 Y113.296 E.29936
G1 X119.324 Y113.781 E.01506
G1 X112.417 Y120.689 E.30156
G1 X112.417 Y121.225 E.01654
G1 X119.377 Y114.265 E.30383
G1 X119.456 Y114.721 E.01431
G1 X112.417 Y121.76 E.30728
G1 X112.417 Y122.296 E.01654
G1 X119.546 Y115.167 E.31124
G2 X119.649 Y115.6 I4.379 J-.805 E.01375
G1 X112.417 Y122.832 E.3157
G1 X112.417 Y123.367 E.01654
G1 X119.763 Y116.021 E.32071
G2 X119.893 Y116.427 I3.865 J-1.017 E.01315
G1 X112.417 Y123.903 E.32639
G1 X112.417 Y124.439 E.01654
G1 X120.029 Y116.827 E.3323
G1 X120.185 Y117.207 E.01267
G1 X112.417 Y124.975 E.33912
G1 X112.417 Y125.51 E.01654
G1 X120.341 Y117.586 E.34594
G2 X120.509 Y117.954 I2.178 J-.771 E.0125
G1 X112.417 Y126.046 E.35326
G1 X112.417 Y126.582 E.01654
G1 X120.692 Y118.307 E.36124
G1 X120.874 Y118.66 E.01227
G1 X112.417 Y127.118 E.36922
G1 X112.417 Y127.653 E.01654
G1 X121.07 Y119 E.37778
G1 X121.278 Y119.328 E.01199
G1 X112.417 Y128.189 E.38682
G1 X112.417 Y128.725 E.01654
G1 X121.485 Y119.657 E.39586
G2 X121.71 Y119.967 I1.976 J-1.204 E.01185
G1 X112.417 Y129.261 E.40572
G1 X112.417 Y129.796 E.01654
G1 X121.941 Y120.273 E.41576
G2 X122.172 Y120.577 I2.472 J-1.635 E.01181
G1 X112.417 Y130.332 E.42585
G1 X112.417 Y130.868 E.01654
G1 X122.419 Y120.865 E.43666
G2 X122.673 Y121.148 I3.198 J-2.615 E.01172
G1 X112.417 Y131.404 E.44772
G1 X112.417 Y131.939 E.01654
G1 X122.932 Y121.424 E.45906
G2 X123.203 Y121.688 I2.657 J-2.447 E.0117
G1 X112.417 Y132.475 E.47089
G1 X112.417 Y133.011 E.01654
G1 X123.478 Y121.949 E.4829
G1 X123.765 Y122.199 E.01172
G1 X112.417 Y133.546 E.4954
G1 X112.417 Y134.082 E.01654
G1 X124.06 Y122.439 E.50828
G1 X124.363 Y122.671 E.0118
G1 X112.417 Y134.618 E.52154
G1 X112.417 Y135.154 E.01654
G1 X124.667 Y122.903 E.53479
G2 X124.98 Y123.127 I2.834 J-3.637 E.01186
G1 X112.417 Y135.689 E.54843
G1 X112.417 Y136.225 E.01654
G1 X116.604 Y132.038 E.18278
G2 X116.326 Y132.852 I7.328 J2.956 E.02655
G1 X112.417 Y136.761 E.17065
G1 X112.417 Y137.297 E.01654
G1 X116.178 Y133.535 E.16422
G2 X116.102 Y134.147 I4.239 J.838 E.01905
G1 X112.417 Y137.832 E.16089
G1 X112.417 Y138.368 E.01654
G1 X116.083 Y134.702 E.16005
G1 X116.083 Y135.237 E.01654
G1 X112.417 Y138.904 E.16005
G1 X112.417 Y139.44 E.01654
G1 X116.083 Y135.773 E.16005
G1 X116.083 Y136.309 E.01654
G1 X112.417 Y139.975 E.16005
G1 X112.417 Y140.511 E.01654
G1 X116.083 Y136.845 E.16005
G1 X116.083 Y137.38 E.01654
G1 X112.417 Y141.047 E.16005
G1 X112.417 Y141.582 E.01654
G1 X116.083 Y137.916 E.16005
G1 X116.083 Y138.452 E.01654
G1 X112.417 Y142.118 E.16005
G1 X112.417 Y142.654 E.01654
G1 X116.083 Y138.988 E.16005
G1 X116.083 Y139.523 E.01654
G1 X112.417 Y143.19 E.16005
G1 X112.417 Y143.725 E.01654
G1 X116.083 Y140.059 E.16005
G1 X116.083 Y140.595 E.01654
G1 X112.417 Y144.261 E.16005
G1 X112.417 Y144.797 E.01654
G1 X116.083 Y141.131 E.16005
G1 X116.083 Y141.666 E.01654
G1 X112.417 Y145.333 E.16005
G1 X112.417 Y145.868 E.01654
G1 X116.083 Y142.202 E.16005
G1 X116.083 Y142.738 E.01654
G1 X112.417 Y146.404 E.16005
G1 X112.417 Y146.94 E.01654
G1 X116.083 Y143.273 E.16005
G1 X116.083 Y143.809 E.01654
G1 X112.417 Y147.476 E.16005
G1 X112.417 Y148.011 E.01654
G1 X116.083 Y144.345 E.16005
G1 X116.083 Y144.881 E.01654
G1 X112.417 Y148.547 E.16005
G1 X112.417 Y149.083 E.01654
G1 X116.083 Y145.416 E.16005
G1 X116.083 Y145.952 E.01654
G1 X112.417 Y149.618 E.16005
G1 X112.417 Y150.154 E.01654
G1 X116.083 Y146.488 E.16005
G1 X116.083 Y147.024 E.01654
G1 X112.422 Y150.685 E.15983
G2 X112.443 Y151.199 I4.968 J.053 E.0159
G1 X116.087 Y147.555 E.15908
G2 X116.115 Y148.063 I3.515 J.06 E.01571
G1 X112.487 Y151.691 E.15839
G1 X112.551 Y152.163 E.0147
G1 X116.175 Y148.539 E.15823
G2 X116.263 Y148.987 I3.137 J-.378 E.01412
G1 X112.633 Y152.617 E.15848
G2 X112.733 Y153.053 I4.393 J-.783 E.0138
G1 X116.374 Y149.412 E.15894
G1 X116.507 Y149.814 E.01308
G1 X112.847 Y153.474 E.15977
G2 X112.976 Y153.881 I3.696 J-.941 E.01319
G1 X116.663 Y150.194 E.16095
G2 X116.837 Y150.556 I2.343 J-.909 E.0124
G1 X113.116 Y154.276 E.16243
G2 X113.272 Y154.657 I3.515 J-1.215 E.01269
G1 X117.024 Y150.905 E.16379
G2 X117.228 Y151.236 I2.5 J-1.314 E.01203
G1 X113.437 Y155.027 E.16548
G2 X113.616 Y155.384 I3.577 J-1.561 E.01234
G1 X117.447 Y151.553 E.16726
G2 X117.685 Y151.851 I2.173 J-1.492 E.01178
G1 X113.804 Y155.732 E.16943
G2 X114.004 Y156.067 I3.102 J-1.625 E.01207
G1 X117.936 Y152.135 E.17166
G2 X118.198 Y152.409 I3.914 J-3.479 E.0117
G1 X114.213 Y156.394 E.17396
G2 X114.433 Y156.71 I3.352 J-2.1 E.01188
G1 X118.466 Y152.677 E.17605
G1 X118.734 Y152.945 E.01169
G1 X114.665 Y157.014 E.17764
G2 X114.904 Y157.31 I2.727 J-1.953 E.01177
G1 X119.002 Y153.213 E.17889
G1 X119.27 Y153.48 E.01169
G1 X115.152 Y157.598 E.17978
M73 P93 R1
G1 X115.412 Y157.873 E.0117
G1 X119.537 Y153.748 E.18008
G1 X119.805 Y154.016 E.01169
G1 X115.683 Y158.138 E.17996
G2 X115.959 Y158.398 I2.194 J-2.051 E.01171
G1 X120.073 Y154.284 E.17961
G1 X120.341 Y154.552 E.01169
G1 X116.249 Y158.644 E.17864
G2 X116.546 Y158.883 I2.645 J-2.981 E.01177
G1 X120.609 Y154.82 E.17738
G1 X120.877 Y155.088 E.01169
G1 X116.853 Y159.112 E.17567
G1 X117.17 Y159.33 E.01189
G1 X121.145 Y155.355 E.17352
G1 X121.413 Y155.623 E.01169
G1 X117.5 Y159.536 E.17079
G2 X117.836 Y159.735 I2.148 J-3.237 E.01207
G1 X121.68 Y155.891 E.16781
G1 X121.948 Y156.159 E.01169
G1 X118.184 Y159.923 E.16431
G1 X118.546 Y160.097 E.01239
G1 X122.216 Y156.427 E.16021
G1 X122.484 Y156.695 E.01169
G1 X118.92 Y160.259 E.1556
G2 X119.301 Y160.413 I1.577 J-3.345 E.01271
G1 X122.752 Y156.963 E.15065
G1 X123.02 Y157.231 E.01169
G1 X119.698 Y160.552 E.14502
G2 X120.109 Y160.677 I1.403 J-3.901 E.01327
G1 X123.369 Y157.417 E.14231
G1 X123.905 Y157.417 E.01654
G1 X120.534 Y160.788 E.14716
G2 X120.973 Y160.884 I1.183 J-4.335 E.01389
G1 X124.441 Y157.417 E.15137
G1 X124.976 Y157.417 E.01654
G1 X121.431 Y160.962 E.15476
G1 X121.903 Y161.026 E.0147
G1 X125.512 Y157.417 E.15755
G1 X126.048 Y157.417 E.01654
G1 X122.4 Y161.065 E.15924
G2 X122.92 Y161.081 I.416 J-4.997 E.01605
G1 X126.584 Y157.417 E.15995
G1 X127.119 Y157.417 E.01654
G1 X123.453 Y161.083 E.16006
G1 X123.989 Y161.083 E.01654
G1 X127.655 Y157.417 E.16006
G1 X128.191 Y157.417 E.01654
G1 X124.524 Y161.083 E.16006
G1 X125.06 Y161.083 E.01654
G1 X128.726 Y157.417 E.16006
G1 X129.262 Y157.417 E.01654
G1 X125.596 Y161.083 E.16006
G1 X126.132 Y161.083 E.01654
G1 X129.798 Y157.417 E.16006
G1 X130.334 Y157.417 E.01654
G1 X126.667 Y161.083 E.16006
G1 X127.203 Y161.083 E.01654
G1 X130.869 Y157.417 E.16006
G1 X131.405 Y157.417 E.01654
G1 X127.739 Y161.083 E.16006
G1 X128.275 Y161.083 E.01654
G1 X131.941 Y157.417 E.16006
G1 X132.477 Y157.417 E.01654
G1 X128.81 Y161.083 E.16006
G1 X129.346 Y161.083 E.01654
G1 X143.583 Y146.846 E.62153
G1 X143.583 Y147.382 E.01654
G1 X129.882 Y161.083 E.59814
G1 X130.417 Y161.083 E.01654
G1 X143.583 Y147.917 E.57475
G1 X143.583 Y148.453 E.01654
G1 X130.953 Y161.083 E.55137
G1 X131.489 Y161.083 E.01654
G1 X143.583 Y148.989 E.52798
G1 X143.583 Y149.525 E.01654
G1 X132.025 Y161.083 E.50459
G1 X132.56 Y161.083 E.01654
G1 X143.583 Y150.06 E.4812
G3 X143.58 Y150.599 I-10.384 J.214 E.01663
G1 X133.1 Y161.08 E.45753
G2 X133.654 Y161.061 I.077 J-5.904 E.01714
G1 X143.56 Y151.155 E.43245
G3 X143.506 Y151.745 I-5.217 J-.186 E.01831
G1 X134.244 Y161.007 E.40431
G2 X134.876 Y160.91 I-.535 J-5.636 E.01974
G1 X143.413 Y152.374 E.37266
G3 X143.266 Y153.056 I-6.874 J-1.117 E.02154
G1 X135.555 Y160.767 E.33663
G2 X136.307 Y160.551 I-3.328 J-12.99 E.02415
G1 X143.051 Y153.807 E.29439
G3 X142.721 Y154.673 I-7.938 J-2.531 E.02862
G1 X137.173 Y160.221 E.24217
G2 X138.234 Y159.695 I-4.266 J-9.952 E.03656
G1 X142.195 Y155.734 E.17292
G3 X140.86 Y157.586 I-9.549 J-5.476 E.0706
G3 X139.148 Y159.317 I-34.223 J-32.137 E.07517
G1 X138.321 Y151.573 F42000
G1 F15000
G1 X143.583 Y146.31 E.22973
G1 X143.583 Y145.775 E.01654
G1 X139.461 Y149.897 E.17996
G2 X139.7 Y149.122 I-7.708 J-2.802 E.02504
G1 X143.583 Y145.239 E.16953
G1 X143.583 Y144.703 E.01654
G1 X139.842 Y148.445 E.16333
G2 X139.902 Y147.848 I-13.004 J-1.622 E.0185
G1 X143.583 Y144.167 E.16069
G1 X143.583 Y143.632 E.01654
G1 X139.917 Y147.298 E.16005
G1 X139.917 Y146.762 E.01654
G1 X143.583 Y143.096 E.16005
G1 X143.583 Y142.56 E.01654
G1 X139.917 Y146.226 E.16005
G1 X139.917 Y145.691 E.01654
G1 X143.583 Y142.024 E.16005
G2 X143.579 Y141.493 I-10.594 J-.175 E.0164
G1 X139.917 Y145.155 E.15986
G1 X139.917 Y144.619 E.01654
G1 X143.558 Y140.978 E.15896
G2 X143.514 Y140.486 I-4.475 J.149 E.01526
G1 X139.917 Y144.084 E.15705
G1 X139.917 Y143.548 E.01654
G1 X143.452 Y140.012 E.15434
G2 X143.371 Y139.558 I-4.93 J.641 E.01427
G1 X139.917 Y143.012 E.15081
G1 X139.917 Y142.476 E.01654
G1 X143.271 Y139.122 E.14645
G2 X143.157 Y138.701 I-4.254 J.932 E.01348
G1 X139.917 Y141.941 E.14144
G2 X139.909 Y141.413 I-7.617 J-.147 E.01629
G1 X143.029 Y138.293 E.1362
G2 X142.888 Y137.898 I-4.007 J1.205 E.01295
G1 X139.873 Y140.913 E.13163
G2 X139.805 Y140.445 I-3.409 J.251 E.01462
G1 X142.735 Y137.515 E.12792
G1 X142.568 Y137.146 E.01249
G1 X139.711 Y140.003 E.12473
G2 X139.594 Y139.585 I-3.221 J.674 E.01343
G1 X142.389 Y136.79 E.12201
G2 X142.203 Y136.44 I-3.332 J1.553 E.01223
G1 X139.455 Y139.188 E.11996
G2 X139.298 Y138.81 I-2.807 J.944 E.01266
G1 X142.004 Y136.104 E.11813
G2 X141.793 Y135.779 I-3.344 J1.94 E.01196
G1 X139.123 Y138.448 E.11654
G1 X138.931 Y138.105 E.01215
G1 X141.573 Y135.463 E.11534
G2 X141.345 Y135.155 I-3.179 J2.12 E.01183
G1 X138.721 Y137.779 E.11456
G2 X138.496 Y137.469 I-2.352 J1.465 E.01185
G1 X141.104 Y134.86 E.11387
G2 X140.854 Y134.574 I-2.973 J2.349 E.01172
G1 X138.257 Y137.172 E.11339
G2 X138.004 Y136.889 I-2.165 J1.681 E.01172
G1 X140.596 Y134.297 E.11316
G1 X140.328 Y134.029 E.01169
G1 X137.736 Y136.622 E.11319
G2 X137.451 Y136.371 I-1.949 J1.93 E.01173
G1 X140.049 Y133.773 E.11343
G2 X139.761 Y133.525 I-2.616 J2.744 E.01173
G1 X137.151 Y136.134 E.11392
G2 X136.842 Y135.908 I-3.415 J4.357 E.01184
G1 X139.465 Y133.285 E.11453
G1 X139.157 Y133.057 E.01183
G1 X136.527 Y135.688 E.11483
G1 X136.212 Y135.467 E.01187
G1 X138.844 Y132.835 E.11492
G1 X138.529 Y132.614 E.01187
G1 X135.896 Y135.246 E.11492
G1 X135.581 Y135.026 E.01187
G1 X138.214 Y132.393 E.11492
G1 X137.899 Y132.173 E.01187
G1 X135.266 Y134.805 E.11492
G1 X134.951 Y134.584 E.01187
G1 X137.584 Y131.952 E.11492
G1 X137.268 Y131.731 E.01187
G1 X134.636 Y134.364 E.11492
G1 X134.321 Y134.143 E.01187
G1 X136.953 Y131.511 E.11492
G1 X136.638 Y131.29 E.01187
G1 X134.006 Y133.923 E.11492
G1 X133.691 Y133.702 E.01187
G1 X136.323 Y131.069 E.11492
G1 X136.008 Y130.849 E.01187
G1 X133.376 Y133.481 E.11492
G1 X133.061 Y133.261 E.01187
G1 X135.693 Y130.628 E.11492
G1 X135.378 Y130.408 E.01187
G1 X132.745 Y133.04 E.11492
G1 X132.43 Y132.819 E.01187
G1 X135.063 Y130.187 E.11492
G1 X134.748 Y129.966 E.01187
G1 X132.115 Y132.599 E.11492
G1 X131.8 Y132.378 E.01187
G1 X134.433 Y129.746 E.11492
G1 X134.117 Y129.525 E.01187
G1 X131.485 Y132.157 E.11492
G1 X131.17 Y131.937 E.01187
G1 X133.802 Y129.304 E.11492
G1 X133.487 Y129.084 E.01187
G1 X130.855 Y131.716 E.11492
G1 X130.54 Y131.496 E.01187
G1 X133.172 Y128.863 E.11492
G1 X132.857 Y128.642 E.01187
G1 X130.225 Y131.275 E.11492
G1 X129.91 Y131.054 E.01187
G1 X132.542 Y128.422 E.11492
G1 X132.227 Y128.201 E.01187
G1 X129.594 Y130.834 E.11492
G1 X129.279 Y130.613 E.01187
G1 X131.912 Y127.981 E.11492
G1 X131.597 Y127.76 E.01187
G1 X128.964 Y130.392 E.11492
G1 X128.649 Y130.172 E.01187
G1 X131.282 Y127.539 E.11492
G1 X130.967 Y127.319 E.01187
G1 X128.334 Y129.951 E.11492
G1 X128.019 Y129.73 E.01187
G1 X130.651 Y127.098 E.11492
G1 X130.336 Y126.877 E.01187
G1 X127.704 Y129.51 E.11492
G1 X127.389 Y129.289 E.01187
G1 X130.021 Y126.657 E.11492
G1 X129.706 Y126.436 E.01187
G1 X127.074 Y129.069 E.11492
G2 X126.752 Y128.854 I-3.164 J4.39 E.01193
G1 X129.391 Y126.215 E.11519
G1 X129.076 Y125.995 E.01187
G1 X126.419 Y128.651 E.11597
G2 X126.071 Y128.464 I-1.485 J2.341 E.01222
G1 X128.761 Y125.774 E.11742
G1 X128.446 Y125.554 E.01187
G1 X125.705 Y128.295 E.11967
G2 X125.318 Y128.146 I-1.233 J2.631 E.01281
G1 X128.131 Y125.333 E.12281
G1 X127.816 Y125.112 E.01187
G1 X124.912 Y128.016 E.12674
G2 X124.484 Y127.908 I-1.034 J3.217 E.01364
G1 X127.5 Y124.892 E.13168
G1 X127.185 Y124.671 E.01187
G1 X124.032 Y127.825 E.13767
G2 X123.552 Y127.769 I-.628 J3.33 E.01494
G1 X126.87 Y124.45 E.14488
G1 X126.555 Y124.23 E.01187
G1 X123.035 Y127.75 E.15367
G2 X122.484 Y127.765 I-.153 J4.403 E.01703
G1 X126.24 Y124.009 E.16397
G1 X125.925 Y123.788 E.01187
G1 X121.874 Y127.84 E.17686
G2 X121.186 Y127.992 I.67 J4.658 E.02177
G1 X125.61 Y123.568 E.19314
G1 X125.295 Y123.347 E.01187
G1 X120.044 Y128.598 E.22924
G1 X112.247 Y110.68 F42000
G1 F15000
G1 X128.01 Y94.917 E.68813
G1 X127.474 Y94.917 E.01654
G1 X112.417 Y109.974 E.65734
G1 X112.417 Y109.438 E.01654
G1 X126.938 Y94.917 E.63395
G1 X126.403 Y94.917 E.01654
G1 X112.417 Y108.903 E.61056
G1 X112.417 Y108.367 E.01654
G1 X125.867 Y94.917 E.58717
G1 X125.331 Y94.917 E.01654
G1 X112.417 Y107.831 E.56378
G1 X112.417 Y107.295 E.01654
G1 X124.795 Y94.917 E.5404
G1 X124.26 Y94.917 E.01654
G1 X112.417 Y106.76 E.51701
G1 X112.417 Y106.224 E.01654
G1 X123.724 Y94.917 E.49362
G1 X123.188 Y94.917 E.01654
G1 X112.417 Y105.688 E.47023
G1 X112.417 Y105.153 E.01654
G1 X122.653 Y94.917 E.44685
G1 X122.117 Y94.917 E.01654
G1 X112.417 Y104.617 E.42346
G3 X112.42 Y104.078 I8.558 J-.213 E.01665
G1 X121.581 Y94.917 E.39991
G1 X121.045 Y94.917 E.01654
G1 X112.439 Y103.523 E.3757
G3 X112.494 Y102.933 I5.794 J.235 E.01829
G1 X120.51 Y94.917 E.34995
G1 X119.974 Y94.917 E.01654
G1 X112.59 Y102.301 E.32236
G3 X112.733 Y101.622 I6.926 J1.108 E.02144
G1 X119.438 Y94.917 E.29271
G1 X118.902 Y94.917 E.01654
M73 P94 R1
G1 X112.95 Y100.87 E.25988
G3 X113.276 Y100.007 I8.475 J2.719 E.02849
G1 X118.367 Y94.917 E.22222
G1 X117.831 Y94.917 E.01654
G1 X113.805 Y98.943 E.17574
G3 X115.502 Y96.71 I9.091 J5.148 E.08682
G1 X117.465 Y94.747 E.08569
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F33600
G1 X116.051 Y96.161 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/45
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
M106 S193.8
G17
G3 Z9.2 I-1.208 J.147 P1  F42000
G1 X123.423 Y156.772 Z9.2
G1 Z9
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.538 Y151.886 E.2123
G3 X116.693 Y147.433 I4.513 J-4.478 E.15191
G1 X116.693 Y134.656 E.39258
G3 X122.416 Y128.38 I6.318 J.014 E.2862
G3 X126.614 Y129.492 I.578 J6.305 E.13623
G1 X136.62 Y136.498 E.37533
G3 X139.307 Y141.659 I-3.622 J5.165 E.18581
G1 X139.307 Y147.433 E.17742
G3 X137.462 Y151.886 I-6.353 J-.023 E.15192
G1 X132.541 Y156.807 E.21384
G1 X123.469 Y156.807 E.27878
M204 S6000
; WIPE_START
G1 F33600
G1 X122.053 Y155.394 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.124 Y148.048 Z9.4 F42000
G1 X133.365 Y115.264 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X133.352 Y115.238 E.00089
G3 X133.307 Y114.991 I.658 J-.247 E.00775
G1 X133.307 Y112.836 E.0662
G3 X133.516 Y112.332 I.725 J.005 E.0172
G1 X135.342 Y110.506 E.07934
G2 X136.307 Y108.177 I-2.34 J-2.334 E.07949
G2 X136.245 Y106.018 I-17.09 J-.59 E.06641
G2 X128.503 Y99.193 I-7.755 J.994 E.34635
G2 X125.573 Y99.626 I-.418 J7.304 E.09165
G2 X122.74 Y101.816 I2.504 J6.165 E.1114
G2 X121.147 Y105.108 I7.905 J5.859 E.11303
G2 X120.178 Y109.468 I46.696 J12.666 E.13728
G2 X120.327 Y115.781 I12.585 J2.86 E.19604
G2 X125.094 Y122.462 I11.866 J-3.425 E.25709
G1 X139.418 Y132.492 E.53729
G3 X144.193 Y141.665 I-6.451 J9.187 E.33023
G1 X144.193 Y150.497 E.27139
G3 X132.997 Y161.693 I-11.197 J-.001 E.54037
G1 X123.003 Y161.693 E.3071
G3 X111.807 Y150.497 I.001 J-11.197 E.54037
G1 X111.807 Y104.181 E1.42318
G3 X115.087 Y96.261 I11.242 J.017 E.27023
G1 X117.041 Y94.307 E.08491
G1 X138.959 Y94.307 E.67346
G1 X140.798 Y96.146 E.07992
G3 X144.193 Y104.18 I-7.845 J8.05 E.27524
G1 X144.193 Y111.995 E.24013
G3 X140.495 Y115.693 I-3.696 J.002 E.1785
G1 X134.01 Y115.693 E.19929
G3 X133.473 Y115.444 I0 J-.703 E.01875
G1 X133.396 Y115.315 E.00463
M204 S6000
; WIPE_START
G1 F33600
G1 X133.352 Y115.238 E-.03383
G1 X133.307 Y114.991 E-.09528
G1 X133.307 Y113.331 E-.63089
; WIPE_END
G1 E-.04 F1800
;===================== date: 20240606 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G17
G2 Z9.4 I0.86 J0.86 P1 F20000 ; spiral lift a little
G1 Z9.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.4 F4000
            G39.3 S1
            G0 Z9.4 F4000
            G392 S0
          
        M623
    
    M623
M623


G1 Z9.8 F42000
G1 X138.509 Y94.514
G1 Z9
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X142.251 Y98.256 E.16258
M204 S6000
; WIPE_START
G1 F33600
G1 X140.836 Y96.842 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.913 Y99.451 Z9.4 F42000
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X137.976 Y94.514 E.21454
G1 X137.443 Y94.514
G1 X143.304 Y100.375 E.25469
G1 X143.562 Y101.167
G1 X136.909 Y94.514 E.28908
G1 X136.376 Y94.514
G1 X143.742 Y101.88 E.32008
G1 X143.86 Y102.532
G1 X135.843 Y94.514 E.34838
G1 X135.309 Y94.514
G1 X143.934 Y103.139 E.37478
G1 X143.973 Y103.711
G1 X134.776 Y94.514 E.39966
G1 X134.243 Y94.514
G1 X143.986 Y104.257 E.42337
G1 X143.986 Y104.79
G1 X133.71 Y94.514 E.44654
G1 X133.176 Y94.514
G1 X143.986 Y105.324 E.46971
G1 X143.986 Y105.857
G1 X132.643 Y94.514 E.49289
G1 X132.11 Y94.514
G1 X143.986 Y106.39 E.51606
G1 X143.986 Y106.923
G1 X131.577 Y94.514 E.53923
G1 X131.043 Y94.514
G1 X143.986 Y107.457 E.56241
G1 X143.986 Y107.99
G1 X130.51 Y94.514 E.58558
G1 X129.977 Y94.514
G1 X143.986 Y108.523 E.60875
G1 X143.986 Y109.057
G1 X129.443 Y94.514 E.63193
G1 X128.91 Y94.514
G1 X143.986 Y109.59 E.6551
G1 X143.986 Y110.123
G1 X128.377 Y94.514 E.67827
G1 X127.844 Y94.514
G1 X143.986 Y110.656 E.70145
G1 X143.986 Y111.19
G1 X134.586 Y101.79 E.40846
M204 S6000
; WIPE_START
G1 F33600
G1 X136 Y103.204 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.649 Y103.386 Z9.4 F42000
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X143.986 Y111.723 E.36227
G1 X143.975 Y112.245
G1 X136.049 Y104.319 E.34442
G1 X136.279 Y105.083
G1 X143.909 Y112.712 E.33152
G1 X143.794 Y113.131
G1 X136.412 Y105.75 E.32077
G1 X136.485 Y106.356
G1 X143.64 Y113.51 E.31088
G1 X143.449 Y113.852
G1 X136.503 Y106.906 E.30183
G1 X136.508 Y107.444
G1 X143.228 Y114.165 E.29203
G1 X142.979 Y114.449
G1 X136.513 Y107.983 E.28098
G1 X136.499 Y108.502
G1 X142.698 Y114.702 E.26942
G1 X142.389 Y114.925
G1 X136.422 Y108.959 E.25928
G1 X136.3 Y109.37
G1 X142.049 Y115.119 E.24983
G1 X141.676 Y115.279
G1 X136.14 Y109.743 E.24057
G1 X135.947 Y110.084
G1 X141.261 Y115.398 E.23093
G1 X140.802 Y115.472
G1 X135.723 Y110.393 E.22071
G1 X135.469 Y110.672
G1 X140.283 Y115.486 E.20916
G1 X139.749 Y115.486
G1 X135.203 Y110.939 E.19758
G1 X134.936 Y111.206
G1 X139.216 Y115.486 E.18599
G1 X138.683 Y115.486
G1 X134.669 Y111.472 E.1744
G1 X134.403 Y111.739
G1 X138.15 Y115.486 E.16282
G1 X137.616 Y115.486
G1 X134.136 Y112.005 E.15123
G1 X133.87 Y112.272
G1 X137.083 Y115.486 E.13964
G1 X136.55 Y115.486
G1 X133.614 Y112.55 E.12757
G1 X133.514 Y112.984
G1 X136.016 Y115.486 E.10873
G1 X135.483 Y115.486
G1 X133.514 Y113.517 E.08556
G1 X133.514 Y114.05
G1 X134.95 Y115.486 E.06238
G1 X134.417 Y115.486
G1 X133.514 Y114.583 E.03921
M204 S6000
; WIPE_START
G1 F33600
G1 X134.417 Y115.486 E-.4849
G1 X134.95 Y115.486 E-.20264
G1 X134.815 Y115.351 E-.07246
; WIPE_END
G1 E-.04 F1800
G1 X134.233 Y107.741 Z9.4 F42000
G1 X133.711 Y100.915 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.31 Y94.514 E.27814
G1 X126.777 Y94.514
G1 X132.114 Y99.851 E.2319
G1 X131.181 Y99.451
G1 X126.244 Y94.514 E.21454
G1 X125.711 Y94.514
G1 X130.416 Y99.22 E.20448
G1 X129.751 Y99.088
G1 X125.177 Y94.514 E.19873
G1 X124.644 Y94.514
G1 X129.144 Y99.015 E.19556
G1 X128.585 Y98.988
G1 X124.111 Y94.514 E.19441
G1 X123.578 Y94.514
G1 X128.053 Y98.99 E.19447
G1 X127.525 Y98.995
G1 X123.044 Y94.514 E.19469
G1 X122.511 Y94.514
G1 X127.042 Y99.045 E.1969
G1 X126.58 Y99.117
M73 P95 R1
G1 X121.978 Y94.514 E.2
G1 X121.444 Y94.514
G1 X126.149 Y99.219 E.20445
G1 X125.746 Y99.349
G1 X120.911 Y94.514 E.2101
G1 X120.378 Y94.514
G1 X125.356 Y99.493 E.21633
G1 X124.99 Y99.659
G1 X119.845 Y94.514 E.22358
G1 X119.311 Y94.514
G1 X124.645 Y99.848 E.23177
G1 X124.311 Y100.047
G1 X118.778 Y94.514 E.24043
G1 X118.245 Y94.514
G1 X124.001 Y100.271 E.25014
G1 X123.697 Y100.5
G1 X117.712 Y94.514 E.26012
M73 P95 R0
G1 X117.178 Y94.514
G1 X123.418 Y100.754 E.27115
G1 X123.147 Y101.016
G1 X116.886 Y94.755 E.27206
G1 X116.619 Y95.022
G1 X122.894 Y101.297 E.27266
G1 X122.656 Y101.591
G1 X116.353 Y95.289 E.27388
G1 X116.086 Y95.555
G1 X122.427 Y101.897 E.27556
G1 X122.209 Y102.212
G1 X115.82 Y95.822 E.27767
G1 X115.553 Y96.089
G1 X122.003 Y102.538 E.28027
G1 X121.812 Y102.881
G1 X115.286 Y96.355 E.28359
G1 X115.025 Y96.628
G1 X121.632 Y103.235 E.28711
G1 X121.465 Y103.6
G1 X114.77 Y96.905 E.29094
G1 X114.524 Y97.193
G1 X121.309 Y103.978 E.29486
G1 X121.173 Y104.375
G1 X114.289 Y97.491 E.29916
G1 X114.061 Y97.796
G1 X121.039 Y104.775 E.30325
G1 X120.912 Y105.181
G1 X113.844 Y98.113 E.30716
G1 X113.637 Y98.439
G1 X120.8 Y105.602 E.31128
G1 X120.688 Y106.023
G1 X113.438 Y98.774 E.31503
G1 X113.251 Y99.119
G1 X120.588 Y106.456 E.31885
G1 X120.492 Y106.894
G1 X113.076 Y99.477 E.32229
G1 X112.909 Y99.844
G1 X120.397 Y107.332 E.32539
G1 X120.301 Y107.769
G1 X112.753 Y100.221 E.328
G1 X112.612 Y100.614
G1 X120.211 Y108.212 E.33018
G1 X120.127 Y108.662
G1 X112.483 Y101.017 E.33218
G1 X112.365 Y101.433
G1 X120.043 Y109.111 E.33367
G1 X119.96 Y109.561
G1 X112.262 Y101.863 E.33452
G1 X112.177 Y102.312
G1 X119.876 Y110.011 E.33455
G1 X119.793 Y110.461
G1 X112.108 Y102.776 E.33394
G1 X112.057 Y103.258
G1 X119.727 Y110.929 E.33334
G1 X119.684 Y111.418
G1 X112.026 Y103.761 E.33276
G1 X112.014 Y104.282
G1 X119.652 Y111.919 E.33188
G1 X119.651 Y112.452
G1 X112.014 Y104.815 E.33184
G1 X112.014 Y105.349
G1 X119.659 Y112.993 E.33221
G1 X119.699 Y113.567
G1 X112.014 Y105.882 E.33395
G1 X112.014 Y106.415
G1 X119.773 Y114.174 E.33717
G1 X119.889 Y114.823
G1 X112.014 Y106.948 E.3422
G1 X112.014 Y107.482
G1 X120.045 Y115.513 E.34898
G1 X120.256 Y116.257
G1 X112.014 Y108.015 E.35815
G1 X112.014 Y108.548
G1 X120.574 Y117.107 E.37194
G1 X121.035 Y118.102
G1 X112.014 Y109.081 E.39198
G1 X112.014 Y109.615
G1 X121.788 Y119.388 E.42472
M204 S6000
; WIPE_START
G1 F33600
G1 X120.374 Y117.974 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.382 Y122.681 Z9.4 F42000
G1 X137.616 Y131.483 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X142.759 Y136.626 E.2235
G1 X143.205 Y137.606
G1 X135.837 Y130.238 E.32021
M204 S6000
; WIPE_START
G1 F33600
G1 X137.251 Y131.652 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.058 Y128.992 Z9.4 F42000
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X143.499 Y138.433 E.41026
G1 X143.693 Y139.161
G1 X132.279 Y127.746 E.496
M204 S6000
; WIPE_START
G1 F33600
G1 X133.693 Y129.161 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.5 Y126.501 Z9.4 F42000
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X143.829 Y139.829 E.57917
G1 X143.916 Y140.45
G1 X128.722 Y125.255 E.66027
M204 S6000
; WIPE_START
G1 F33600
G1 X130.136 Y126.67 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.943 Y124.01 Z9.4 F42000
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X143.966 Y141.033 E.73973
G1 X143.984 Y141.584
G1 X125.164 Y122.764 E.8178
M204 S6000
; WIPE_START
G1 F33600
G1 X126.578 Y124.179 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X121.082 Y118.883 Z9.4 F42000
G1 X112.014 Y110.148 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X143.986 Y142.119 E1.38931
G1 X143.986 Y142.653
G1 X112.014 Y110.681 E1.38931
G1 X112.014 Y111.215
G1 X143.986 Y143.186 E1.38931
G1 X143.986 Y143.719
G1 X138.594 Y138.328 E.23429
G1 X139.088 Y139.355
G1 X143.986 Y144.252 E.21281
G1 X143.986 Y144.786
G1 X139.327 Y140.127 E.20243
G1 X139.455 Y140.788
G1 X143.986 Y145.319 E.19688
G1 X143.986 Y145.852
G1 X139.505 Y141.371 E.19472
G1 X139.514 Y141.914
G1 X143.986 Y146.385 E.1943
G1 X143.986 Y146.919
G1 X139.514 Y142.447 E.1943
G1 X139.514 Y142.981
G1 X143.986 Y147.452 E.1943
G1 X143.986 Y147.985
G1 X139.514 Y143.514 E.1943
G1 X139.514 Y144.047
G1 X143.986 Y148.519 E.1943
G1 X143.986 Y149.052
G1 X139.514 Y144.58 E.1943
G1 X139.514 Y145.114
G1 X143.986 Y149.585 E.1943
M73 P96 R0
G1 X143.986 Y150.118
G1 X139.514 Y145.647 E.1943
G1 X139.514 Y146.18
G1 X143.982 Y150.648 E.19413
G1 X143.964 Y151.163
G1 X139.514 Y146.714 E.19334
G1 X139.514 Y147.247
G1 X143.924 Y151.657 E.19162
G1 X143.861 Y152.127
G1 X139.502 Y147.768 E.18942
G1 X139.459 Y148.258
G1 X143.783 Y152.582 E.18791
G1 X143.689 Y153.021
G1 X139.384 Y148.716 E.18707
G1 X139.28 Y149.146
G1 X143.58 Y153.446 E.18686
G1 X143.459 Y153.858
G1 X139.154 Y149.553 E.18706
G1 X139.007 Y149.939
G1 X143.321 Y154.253 E.18745
G1 X143.172 Y154.638
G1 X138.84 Y150.306 E.18824
G1 X138.656 Y150.655
G1 X143.014 Y155.013 E.1894
G1 X142.842 Y155.374
G1 X138.455 Y150.987 E.19063
G1 X138.237 Y151.302
G1 X142.659 Y155.725 E.19218
G1 X142.468 Y156.067
G1 X138.001 Y151.599 E.19414
G1 X137.75 Y151.882
G1 X142.266 Y156.397 E.19623
G1 X142.052 Y156.717
G1 X137.488 Y152.153 E.19833
G1 X137.222 Y152.42
G1 X141.832 Y157.03 E.20033
G1 X141.6 Y157.332
G1 X136.955 Y152.687 E.20185
G1 X136.688 Y152.953
G1 X141.358 Y157.623 E.20291
G1 X141.11 Y157.908
G1 X136.422 Y153.22 E.20371
G1 X136.155 Y153.486
G1 X140.85 Y158.181 E.20402
G1 X140.581 Y158.445
G1 X135.889 Y153.753 E.20391
G1 X135.622 Y154.02
G1 X140.305 Y158.703 E.2035
G1 X140.017 Y158.948
G1 X135.355 Y154.286 E.20256
G1 X135.089 Y154.553
G1 X139.721 Y159.185 E.20129
G1 X139.417 Y159.415
G1 X134.822 Y154.82 E.19968
G1 X134.555 Y155.086
G1 X139.101 Y159.632 E.19754
G1 X138.776 Y159.84
G1 X134.289 Y155.353 E.19499
G1 X134.022 Y155.62
G1 X138.443 Y160.04 E.19211
G1 X138.098 Y160.228
G1 X133.755 Y155.886 E.18869
G1 X133.489 Y156.153
G1 X137.741 Y160.405 E.18479
G1 X137.376 Y160.573
G1 X133.222 Y156.419 E.18051
G1 X132.956 Y156.686
G1 X136.999 Y160.73 E.17571
G1 X136.608 Y160.872
G1 X132.689 Y156.953 E.17031
G1 X132.217 Y157.014
G1 X136.206 Y161.004 E.17335
G1 X135.793 Y161.123
G1 X131.684 Y157.014 E.17856
G1 X131.151 Y157.014
G1 X135.363 Y161.227 E.18304
G1 X134.916 Y161.313
G1 X130.617 Y157.014 E.1868
G1 X130.084 Y157.014
G1 X134.455 Y161.385 E.18992
G1 X133.976 Y161.439
G1 X129.551 Y157.014 E.19227
G1 X129.018 Y157.014
G1 X133.475 Y161.472 E.1937
G1 X132.956 Y161.486
G1 X128.484 Y157.014 E.1943
G1 X127.951 Y157.014
G1 X132.422 Y161.486 E.1943
G1 X131.889 Y161.486
G1 X127.418 Y157.014 E.1943
G1 X126.885 Y157.014
G1 X131.356 Y161.486 E.1943
G1 X130.823 Y161.486
G1 X126.351 Y157.014 E.1943
G1 X125.818 Y157.014
G1 X130.289 Y161.486 E.1943
G1 X129.756 Y161.486
G1 X125.285 Y157.014 E.1943
G1 X124.751 Y157.014
G1 X129.223 Y161.486 E.1943
G1 X128.689 Y161.486
G1 X124.218 Y157.014 E.1943
G1 X123.685 Y157.014
G1 X128.156 Y161.486 E.1943
M204 S6000
; WIPE_START
G1 F33600
G1 X126.742 Y160.071 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.546 Y152.973 Z9.4 F42000
G1 X136.256 Y135.99 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X112.014 Y111.748 E1.05342
G1 X112.014 Y112.281
G1 X134.477 Y134.744 E.97613
M204 S6000
; WIPE_START
G1 F33600
G1 X133.063 Y133.33 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.699 Y133.499 Z9.4 F42000
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X112.014 Y112.814 E.89883
G1 X112.014 Y113.348
G1 X130.92 Y132.253 E.82153
M204 S6000
; WIPE_START
G1 F33600
G1 X129.506 Y130.839 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.141 Y131.007 Z9.4 F42000
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X112.014 Y113.881 E.74423
G1 X112.014 Y114.414
G1 X127.362 Y129.762 E.66694
M204 S6000
; WIPE_START
G1 F33600
G1 X125.948 Y128.348 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.891 Y128.824 Z9.4 F42000
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X112.014 Y114.947 E.60302
G1 X112.014 Y115.481
G1 X124.995 Y128.462 E.56408
G1 X124.273 Y128.273
G1 X112.014 Y116.014 E.5327
G1 X112.014 Y116.547
G1 X123.648 Y128.181 E.50555
G1 X123.085 Y128.151
G1 X112.014 Y117.08 E.48106
G1 X112.014 Y117.614
G1 X122.564 Y128.164 E.45845
G1 X122.081 Y128.214
G1 X112.014 Y118.147 E.43746
G1 X112.014 Y118.68
G1 X121.629 Y128.295 E.41781
G1 X121.203 Y128.402
G1 X112.014 Y119.214 E.3993
G1 X112.014 Y119.747
G1 X120.8 Y128.532 E.38177
G1 X120.418 Y128.684
G1 X112.014 Y120.28 E.36519
G1 X112.014 Y120.813
G1 X120.054 Y128.853 E.34938
G1 X119.709 Y129.041
G1 X112.014 Y121.347 E.33437
G1 X112.014 Y121.88
G1 X119.38 Y129.245 E.32006
G1 X119.069 Y129.467
G1 X112.014 Y122.413 E.30654
G1 X112.014 Y122.946
G1 X118.774 Y129.706 E.29375
G1 X118.495 Y129.96
G1 X112.014 Y123.48 E.2816
G1 X112.014 Y124.013
G1 X118.23 Y130.229 E.2701
G1 X117.98 Y130.512
G1 X112.014 Y124.546 E.25923
G1 X112.014 Y125.08
M73 P97 R0
G1 X117.745 Y130.81 E.24902
G1 X117.529 Y131.127
G1 X112.014 Y125.613 E.23963
G1 X112.014 Y126.146
G1 X117.329 Y131.461 E.23096
G1 X117.146 Y131.811
G1 X112.014 Y126.679 E.223
G1 X112.014 Y127.213
G1 X116.981 Y132.179 E.21582
G1 X116.835 Y132.566
G1 X112.014 Y127.746 E.20948
G1 X112.014 Y128.279
G1 X116.71 Y132.975 E.20406
G1 X116.61 Y133.408
G1 X112.014 Y128.812 E.19971
G1 X112.014 Y129.346
G1 X116.537 Y133.868 E.19653
G1 X116.496 Y134.361
G1 X112.014 Y129.879 E.19475
G1 X112.014 Y130.412
G1 X116.486 Y134.884 E.1943
G1 X116.486 Y135.417
G1 X112.014 Y130.946 E.1943
G1 X112.014 Y131.479
G1 X116.486 Y135.95 E.1943
G1 X116.486 Y136.483
G1 X112.014 Y132.012 E.1943
G1 X112.014 Y132.545
G1 X116.486 Y137.017 E.1943
G1 X116.486 Y137.55
G1 X112.014 Y133.079 E.1943
G1 X112.014 Y133.612
G1 X116.486 Y138.083 E.1943
G1 X116.486 Y138.616
G1 X112.014 Y134.145 E.1943
G1 X112.014 Y134.678
G1 X116.486 Y139.15 E.1943
G1 X116.486 Y139.683
G1 X112.014 Y135.212 E.1943
G1 X112.014 Y135.745
G1 X116.486 Y140.216 E.1943
G1 X116.486 Y140.75
G1 X112.014 Y136.278 E.1943
G1 X112.014 Y136.811
G1 X116.486 Y141.283 E.1943
G1 X116.486 Y141.816
G1 X112.014 Y137.345 E.1943
G1 X112.014 Y137.878
G1 X116.486 Y142.349 E.1943
G1 X116.486 Y142.883
G1 X112.014 Y138.411 E.1943
G1 X112.014 Y138.945
G1 X116.486 Y143.416 E.1943
G1 X116.486 Y143.949
G1 X112.014 Y139.478 E.1943
G1 X112.014 Y140.011
G1 X116.486 Y144.482 E.1943
G1 X116.486 Y145.016
G1 X112.014 Y140.544 E.1943
G1 X112.014 Y141.078
G1 X116.486 Y145.549 E.1943
G1 X116.486 Y146.082
G1 X112.014 Y141.611 E.1943
G1 X112.014 Y142.144
G1 X116.486 Y146.615 E.1943
G1 X116.486 Y147.149
G1 X112.014 Y142.677 E.1943
G1 X112.014 Y143.211
G1 X116.495 Y147.691 E.1947
G1 X116.543 Y148.272
G1 X112.014 Y143.744 E.19678
G1 X112.014 Y144.277
G1 X116.663 Y148.926 E.202
G1 X116.889 Y149.685
G1 X112.014 Y144.811 E.21184
G1 X112.014 Y145.344
G1 X117.37 Y150.7 E.23274
M204 S6000
; WIPE_START
G1 F33600
G1 X115.956 Y149.286 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X112.014 Y145.877 Z9.4 F42000
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.623 Y161.486 E.67827
G1 X127.09 Y161.486
G1 X112.014 Y146.41 E.65509
G1 X112.014 Y146.944
G1 X126.556 Y161.486 E.63192
G1 X126.023 Y161.486
G1 X112.014 Y147.477 E.60875
G1 X112.014 Y148.01
G1 X125.49 Y161.486 E.58557
G1 X124.957 Y161.486
G1 X112.014 Y148.543 E.5624
G1 X112.014 Y149.077
G1 X124.423 Y161.486 E.53923
G1 X123.89 Y161.486
G1 X112.014 Y149.61 E.51606
G1 X112.014 Y150.143
G1 X123.357 Y161.486 E.49288
G1 X122.819 Y161.481
G1 X112.019 Y150.681 E.46928
G1 X112.042 Y151.238
G1 X122.262 Y161.458 E.4441
G1 X121.673 Y161.401
G1 X112.099 Y151.827 E.41603
G1 X112.194 Y152.455
G1 X121.045 Y161.306 E.38462
G1 X120.366 Y161.161
G1 X112.339 Y153.134 E.34884
G1 X112.547 Y153.876
G1 X119.625 Y160.954 E.30758
G1 X118.774 Y160.635
G1 X112.864 Y154.726 E.2568
G1 X113.354 Y155.749
G1 X117.752 Y160.147 E.19109
M204 S6000
G1 X117.029 Y159.719 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.105586
G1 F15000
G1 X116.876 Y159.593 E.00101
; LINE_WIDTH: 0.140417
G1 X116.724 Y159.466 E.00158
; LINE_WIDTH: 0.175248
G1 X116.571 Y159.339 E.00214
; LINE_WIDTH: 0.210333
G1 X116.368 Y159.16 E.00369
; LINE_WIDTH: 0.24567
G1 X116.165 Y158.982 E.00446
; LINE_WIDTH: 0.287397
G1 X115.725 Y158.577 E.01192
; LINE_WIDTH: 0.318514
G3 X114.923 Y157.775 I15.698 J-16.5 E.02547
; LINE_WIDTH: 0.289282
G1 X114.538 Y157.358 E.0114
; LINE_WIDTH: 0.247172
G1 X114.34 Y157.132 E.005
; LINE_WIDTH: 0.207377
G1 X114.142 Y156.906 E.00403
; LINE_WIDTH: 0.162651
G1 X113.961 Y156.689 E.00276
; LINE_WIDTH: 0.112998
G1 X113.781 Y156.471 E.00161
; WIPE_START
G1 F33600
G1 X113.961 Y156.689 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.243 Y160.398 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.109015
G1 F15000
G1 X118.133 Y160.32 E.00073
; LINE_WIDTH: 0.150706
G1 X118.023 Y160.242 E.00118
; LINE_WIDTH: 0.196239
G1 X117.813 Y160.085 E.00327
; WIPE_START
G1 F33600
G1 X118.023 Y160.242 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.428 Y154.854 Z9.4 F42000
G1 X142.384 Y135.957 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.100054
G1 F15000
G1 X142.312 Y135.864 E.00054
; LINE_WIDTH: 0.13069
G1 X142.196 Y135.721 E.00132
; LINE_WIDTH: 0.168193
G1 X142.079 Y135.578 E.00189
; LINE_WIDTH: 0.205697
G1 X141.962 Y135.435 E.00245
; LINE_WIDTH: 0.245477
G1 X141.783 Y135.226 E.00454
; LINE_WIDTH: 0.287537
G1 X141.604 Y135.017 E.00548
; LINE_WIDTH: 0.322614
G1 X141.421 Y134.814 E.00624
; LINE_WIDTH: 0.350705
G1 X141.237 Y134.61 E.00687
; LINE_WIDTH: 0.384594
G2 X140.081 Y133.452 I-17.812 J16.622 E.0456
; LINE_WIDTH: 0.354216
G1 X139.878 Y133.268 E.00694
; LINE_WIDTH: 0.327139
G1 X139.675 Y133.084 E.00634
; LINE_WIDTH: 0.29285
G1 X139.464 Y132.903 E.00567
; LINE_WIDTH: 0.251345
G1 X139.253 Y132.721 E.00472
; LINE_WIDTH: 0.206855
G1 X139.039 Y132.541 E.00374
; LINE_WIDTH: 0.159382
G1 X138.824 Y132.361 E.00266
; LINE_WIDTH: 0.111908
G1 X138.61 Y132.181 E.00157
; WIPE_START
G1 F33600
G1 X138.824 Y132.361 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.555 Y131.543 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.208383
G1 F15000
G1 X137.314 Y131.341 E.00425
; LINE_WIDTH: 0.160298
G1 X137.072 Y131.138 E.00301
; LINE_WIDTH: 0.112214
G1 X136.831 Y130.936 E.00178
; WIPE_START
G1 F33600
G1 X137.072 Y131.138 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.776 Y130.298 Z9.4 F42000
M73 P98 R0
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.208947
G1 F15000
G1 X135.546 Y130.104 E.00407
; LINE_WIDTH: 0.161992
G1 X135.315 Y129.911 E.00292
; LINE_WIDTH: 0.115036
G1 X135.084 Y129.717 E.00177
; LINE_WIDTH: 0.0898643
G1 X135.052 Y129.69 E.00016
; WIPE_START
G1 F33600
G1 X135.084 Y129.717 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X133.998 Y129.052 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.208383
G1 F15000
G1 X133.756 Y128.85 E.00425
; LINE_WIDTH: 0.160298
G1 X133.515 Y128.647 E.00301
; LINE_WIDTH: 0.112214
G1 X133.273 Y128.445 E.00178
; WIPE_START
G1 F33600
G1 X133.515 Y128.647 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.219 Y127.807 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.208383
G1 F15000
G1 X131.977 Y127.604 E.00425
; LINE_WIDTH: 0.160298
G1 X131.736 Y127.402 E.00301
; LINE_WIDTH: 0.112214
G1 X131.495 Y127.199 E.00178
; WIPE_START
G1 F33600
G1 X131.736 Y127.402 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.44 Y126.561 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.215669
G1 F15000
G1 X130.268 Y126.417 E.00315
; LINE_WIDTH: 0.182157
G1 X130.097 Y126.273 E.00254
; LINE_WIDTH: 0.148644
G1 X129.925 Y126.13 E.00193
; LINE_WIDTH: 0.11003
G1 X129.716 Y125.954 E.0015
; WIPE_START
G1 F33600
G1 X129.925 Y126.13 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.661 Y125.316 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.217545
G1 F15000
G1 X128.457 Y125.145 E.00378
; LINE_WIDTH: 0.183583
G1 X128.284 Y124.999 E.0026
; LINE_WIDTH: 0.145419
G1 X128.11 Y124.854 E.00189
; LINE_WIDTH: 0.107254
G1 X127.937 Y124.708 E.00119
; WIPE_START
G1 F33600
G1 X128.11 Y124.854 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.882 Y124.07 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.208383
G1 F15000
G1 X126.641 Y123.868 E.00425
; LINE_WIDTH: 0.160298
G1 X126.4 Y123.665 E.00301
; LINE_WIDTH: 0.112214
G1 X126.158 Y123.463 E.00178
; WIPE_START
G1 F33600
G1 X126.4 Y123.665 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.104 Y122.825 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.221408
G1 F15000
G1 X124.933 Y122.682 E.00324
; LINE_WIDTH: 0.189873
G1 X124.703 Y122.481 E.00365
; LINE_WIDTH: 0.149191
G1 X124.473 Y122.28 E.00264
; LINE_WIDTH: 0.10851
G1 X124.243 Y122.08 E.00163
; WIPE_START
G1 F33600
G1 X124.473 Y122.28 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.459 Y120.295 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0901787
G1 F15000
G1 X122.407 Y120.239 E.0003
; LINE_WIDTH: 0.114711
G1 X122.203 Y120.004 E.00182
; LINE_WIDTH: 0.159562
G1 X122 Y119.768 E.00296
; LINE_WIDTH: 0.21063
G1 X121.727 Y119.449 E.00573
G1 X121.309 Y118.615 F42000
; LINE_WIDTH: 0.103645
G1 F15000
G1 X121.227 Y118.509 E.00066
; LINE_WIDTH: 0.135061
G1 X121.142 Y118.4 E.00104
; LINE_WIDTH: 0.167671
G1 X121.058 Y118.282 E.00148
; LINE_WIDTH: 0.200561
G1 X120.973 Y118.163 E.00187
; WIPE_START
G1 F33600
G1 X121.058 Y118.282 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.636 Y113.77 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.135256
G1 F15000
G1 X119.715 Y113.551 E.00175
; WIPE_START
G1 F33600
G1 X119.636 Y113.77 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.55 Y106.716 Z9.4 F42000
G1 X125.56 Y99.429 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.109391
G1 F15000
G1 X125.489 Y99.414 E.00039
G1 X125.4 Y99.475 E.00058
; WIPE_START
G1 F33600
G1 X125.489 Y99.414 E-.45673
G1 X125.56 Y99.429 E-.30327
; WIPE_END
G1 E-.04 F1800
G1 X130.633 Y99.17 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.126936
G1 F15000
G1 X130.402 Y99.234 E.00164
; WIPE_START
G1 F33600
G1 X130.633 Y99.17 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.645 Y100.144 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.108151
G1 F15000
G1 X132.511 Y100.04 E.0009
; LINE_WIDTH: 0.148586
G1 X132.373 Y99.933 E.0015
; LINE_WIDTH: 0.193685
G1 X132.175 Y99.789 E.003
; WIPE_START
G1 F33600
G1 X132.373 Y99.933 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.646 Y101.73 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.232124
G1 F15000
G1 X133.771 Y100.855 E.01907
; WIPE_START
G1 F33600
G1 X134.646 Y101.73 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.711 Y103.325 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.193683
G1 F15000
G1 X135.567 Y103.127 E.003
; LINE_WIDTH: 0.168655
G1 X135.565 Y103.124 E.00004
; LINE_WIDTH: 0.148109
G1 X135.46 Y102.989 E.00146
; LINE_WIDTH: 0.108149
G1 X135.356 Y102.855 E.0009
; WIPE_START
G1 F33600
G1 X135.46 Y102.989 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.115 Y104.253 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.119956
G1 F15000
G2 X135.899 Y103.929 I-10.554 J6.776 E.00244
; WIPE_START
G1 F33600
G1 X136.115 Y104.253 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.481 Y105.681 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.11031
G1 F15000
G2 X136.359 Y105.452 I-7.394 J3.801 E.00142
; WIPE_START
G1 F33600
G1 X136.481 Y105.681 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.648 Y113.09 Z9.4 F42000
G1 X134.051 Y115.504 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.288474
G1 F15000
G3 X133.496 Y114.948 I.832 J-1.387 E.01589
; WIPE_START
G1 F33600
G1 X133.726 Y115.248 E-.36291
G1 X134.051 Y115.504 E-.39709
; WIPE_END
G1 E-.04 F1800
G1 X137.882 Y108.903 Z9.4 F42000
G1 X143.115 Y99.887 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.17571
G1 F15000
G1 X142.983 Y99.7 E.00248
; LINE_WIDTH: 0.202316
G1 X142.851 Y99.513 E.00297
G1 X142.598 Y98.843 F42000
; LINE_WIDTH: 0.112324
G1 F15000
G1 X142.484 Y98.69 E.00108
; LINE_WIDTH: 0.158936
G1 X142.337 Y98.503 E.00225
; LINE_WIDTH: 0.203848
G1 X142.19 Y98.317 E.00312
; WIPE_START
G1 F33600
G1 X142.337 Y98.503 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.4 Y97.108 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.125965
G1 F15000
G2 X138.819 Y94.496 I-57.211 J53.948 E.02486
; WIPE_START
G1 F33600
G1 X140.233 Y95.91 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.615 Y95.443 Z9.4 F42000
G1 X117.158 Y94.496 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0978385
G1 F15000
G1 X117.026 Y94.628 E.00084
; WIPE_START
G1 F33600
G1 X117.158 Y94.496 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.25 Y102.127 Z9.4 F42000
G1 X117.842 Y151.407 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0922418
G1 F15000
G1 X117.776 Y151.334 E.0004
; LINE_WIDTH: 0.117345
G1 X117.626 Y151.155 E.00142
; LINE_WIDTH: 0.159618
G1 X117.473 Y150.971 E.00227
; LINE_WIDTH: 0.209371
G1 X117.309 Y150.761 E.00362
; WIPE_START
G1 F33600
G1 X117.473 Y150.971 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.557 Y143.629 Z9.4 F42000
G1 X123.932 Y128.218 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.177195
G1 F15000
G1 X123.782 Y128.143 E.00184
G1 X123.634 Y128.196 E.00172
; WIPE_START
G1 F33600
G1 X123.782 Y128.143 E-.36726
G1 X123.932 Y128.218 E-.39274
; WIPE_END
G1 E-.04 F1800
G1 X126.424 Y129.119 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.095062
G1 F15000
G1 X126.355 Y129.063 E.00038
; LINE_WIDTH: 0.12141
G1 X126.221 Y128.963 E.00107
; LINE_WIDTH: 0.159954
G1 X126.088 Y128.862 E.00159
; LINE_WIDTH: 0.198498
G1 X125.954 Y128.762 E.00212
; WIPE_START
G1 F33600
G1 X126.088 Y128.862 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.147 Y130.309 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.112214
G1 F15000
G1 X127.905 Y130.107 E.00178
; LINE_WIDTH: 0.160298
G1 X127.664 Y129.904 E.00301
; LINE_WIDTH: 0.208383
G1 X127.423 Y129.702 E.00425
; WIPE_START
G1 F33600
G1 X127.664 Y129.904 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.926 Y131.555 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.112214
G1 F15000
G1 X129.684 Y131.352 E.00178
; LINE_WIDTH: 0.160298
G1 X129.443 Y131.15 E.00301
; LINE_WIDTH: 0.208382
G1 X129.201 Y130.947 E.00425
; WIPE_START
G1 F33600
G1 X129.443 Y131.15 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.704 Y132.8 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.112214
G1 F15000
G1 X131.463 Y132.598 E.00178
; LINE_WIDTH: 0.160298
G1 X131.222 Y132.395 E.00301
; LINE_WIDTH: 0.208383
G1 X130.98 Y132.193 E.00425
; WIPE_START
G1 F33600
G1 X131.222 Y132.395 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X133.483 Y134.046 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.112213
G1 F15000
G1 X133.242 Y133.843 E.00178
; LINE_WIDTH: 0.160298
G1 X133 Y133.641 E.00301
; LINE_WIDTH: 0.208382
G1 X132.759 Y133.438 E.00425
; WIPE_START
G1 F33600
G1 X133 Y133.641 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.262 Y135.291 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.112213
G1 F15000
G1 X135.021 Y135.089 E.00178
; LINE_WIDTH: 0.160298
G1 X134.779 Y134.886 E.00301
; LINE_WIDTH: 0.208382
G1 X134.538 Y134.684 E.00425
; WIPE_START
G1 F33600
G1 X134.779 Y134.886 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.1 Y136.596 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.103008
G1 F15000
G1 X136.931 Y136.45 E.00109
; LINE_WIDTH: 0.132805
G1 X136.761 Y136.302 E.00165
; LINE_WIDTH: 0.168961
G1 X136.539 Y136.116 E.00298
; LINE_WIDTH: 0.211269
G1 X136.317 Y135.929 E.00398
; WIPE_START
G1 F33600
G1 X136.539 Y136.116 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.656 Y138.265 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.20494
G1 F15000
G1 X138.5 Y138.073 E.00327
; LINE_WIDTH: 0.163603
G1 X138.341 Y137.879 E.00247
; LINE_WIDTH: 0.129127
G1 X138.201 Y137.718 E.0015
; LINE_WIDTH: 0.101822
G1 X138.06 Y137.557 E.00103
; WIPE_START
G1 F33600
G1 X138.201 Y137.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.394 Y140.06 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.128197
G1 F15000
G1 X139.238 Y139.794 E.00215
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F33600
G1 X139.394 Y140.06 E-.76
; WIPE_END
G1 E-.04 F1800
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; filament end gcode 
M106 P3 S0
;===== date: 20231229 =====================
G392 S0 ;turn off nozzle clog detect

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z9.5 F900 ; lower z a little
G1 X0 Y128 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos

M1002 judge_flag timelapse_record_flag
M622 J1
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M991 S0 P-1 ;end timelapse at safe pos
M623


M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

;G1 X27 F15000 ; wipe

; pull back filament to AMS
M620 S255
G1 X267 F15000
T255
G1 X-28.5 F18000
G1 X-48.2 F3000
G1 X-28.5 F18000
G1 X-48.2 F3000
M621 S255

M104 S0 ; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z109 F600
    G1 Z107

M400 P100
M17 R ; restore z current

G90
G1 X-48 Y180 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A0 B20 L100 C37 D20 M40 E42 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C46 D10 M80 E46 F10 N80
M1006 A44 B20 L100 C39 D20 M60 E48 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C48 D10 M60 E44 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10  N80
M1006 A44 B20 L100 C49 D20 M80 E41 F20 N80
M1006 A0 B20 L100 C0 D20 M60 E0 F20 N80
M1006 A0 B20 L100 C37 D20 M30 E37 F20 N60
M1006 W
;=====printer finish  sound=========

;M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M400
M18 X Y Z

M73 P100 R0
; EXECUTABLE_BLOCK_END

