; HEADER_BLOCK_START
; BambuStudio 01.09.07.52
; model printing time: 16m 59s; total estimated time: 22m 46s
; total layer number: 35
; total filament length [mm] : 3969.34
; total filament volume [cm^3] : 9547.38
; total filament weight [g] : 12.03
; filament_density: 1.26,1.24,1.3,1.04
; filament_diameter: 1.75,1.75,1.75,1.75
; max_z_height: 7.00
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0,0,1
; additional_cooling_fan_speed = 70,70,70,0
; auxiliary_fan = 1
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
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
; chamber_temperatures = 0,0,0,0
; change_filament_gcode = M620 S[next_extruder]A\nM204 S9000\n{if toolchange_count > 1 && (z_hop_types[current_extruder] == 0 || z_hop_types[current_extruder] == 3)}\nG17\nG2 Z{z_after_toolchange + 0.4} I0.86 J0.86 P1 F10000 ; spiral lift a little from second lift\n{endif}\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F{old_filament_e_feedrate}\n{else}\nM620.11 S0\n{endif}\nM400\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\n\n{if next_extruder < 255}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{old_filament_e_feedrate}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F[old_filament_e_feedrate]\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\nG92 E0\n{if flush_length_1 > 1}\nM83\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == "PETG"}\nM109 S260\n{elsif filament_type[next_extruder] == "PVA"}\nM109 S210\n{else}\nM109 S[nozzle_temperature_range_high]\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X105 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\n\nG1 X70 F10000\nG1 X80 F15000\nG1 X60\nG1 X80\nG1 X60\nG1 X80 ; shake to put down garbage\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; close_fan_the_first_x_layers = 1,1,1,3
; complete_print_exhaust_fan_speed = 70,70,70,70
; cool_plate_temp = 35,35,40,0
; cool_plate_temp_initial_layer = 35,35,40,0
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_filament_colour = ;;;
; default_filament_profile = "Bambu PLA Basic @BBL X1C"
; default_jerk = 0
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70,70,70
; elefant_foot_compensation = 0.15
; enable_arc_fitting = 1
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1,1,1,1
; enable_overhang_speed = 1
; enable_pressure_advance = 0,0,0,0
; enable_prime_tower = 0
; enable_support = 0
; enforce_support_layers = 0
; eng_plate_temp = 0,0,0,90
; eng_plate_temp_initial_layer = 0,0,0,90
; ensure_vertical_shell_thickness = 1
; exclude_object = 1
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 34
; extruder_clearance_max_radius = 68
; extruder_clearance_radius = 57
; extruder_colour = #018001
; extruder_offset = 0x2
; extruder_type = DirectDrive
; fan_cooling_layer_time = 100,100,100,30
; fan_max_speed = 100,100,100,60
; fan_min_speed = 100,100,100,10
; filament_colour = #0086D6;#00000000;#FFFFFF;#000000
; filament_cost = 24.99,20,69.98,24.99
; filament_density = 1.26,1.24,1.3,1.04
; filament_diameter = 1.75,1.75,1.75,1.75
; filament_end_gcode = "; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n"
; filament_flow_ratio = 0.98,0.98,1,0.95
; filament_ids = GFA00;GFL99;GFS02;GFB00
; filament_is_support = 0,0,1,0
; filament_long_retractions_when_cut = 1,nil,nil,nil
; filament_max_volumetric_speed = 21,12,12,16
; filament_minimal_purge_on_wipe_tower = 15,15,15,15
; filament_notes = 
; filament_retraction_distances_when_cut = 18,nil,nil,nil
; filament_settings_id = "Bambu PLA Basic @BBL X1C";"Generic PLA";"Bambu Support For PLA @BBL X1C";"Bambu ABS @BBL X1C"
; filament_soluble = 0,0,0,0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; Filament gcode\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA;PLA;PLA;ABS
; filament_vendor = "Bambu Lab";Generic;"Bambu Lab";"Bambu Lab"
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0,577,230,147,327,0,230,187,420,420,0,420,533,667,230,0
; flush_volumes_vector = 140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0,0,0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 
; host_type = octoprint
; hot_plate_temp = 55,55,55,90
; hot_plate_temp_initial_layer = 55,55,55,90
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
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 E-[retraction_length] F1800\nG17\nG2 Z{layer_z + 0.4} I0.86 J0.86 P1 F20000 ; spiral lift a little\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 E[retraction_length] F300\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; long_retractions_when_cut = 0
; machine_end_gcode = ;===== date: 20230428 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of "timelapse_record_flag"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,200
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_start_gcode = ;===== machine: P1S ========================\n;===== date: 20231107 =====================\n;===== turn on the HB fan & MC board fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\nM710 A1 S255 ;turn on MC fan by default(P1S)\n;===== reset machine status =================\nM290 X40 Y40 Z2.6666666\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action : 2\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_extruder]A\nM620.1 E F{filament_max_volumetric_speed[initial_extruder]/2.4053*60} T{nozzle_temperature_range_high[initial_extruder]}\n\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X230 Y15\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== fmech mode fast check============================\n\n\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature_initial_layer[initial_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X18 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\n
; machine_unload_filament_time = 28
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
; nozzle_height = 4.2
; nozzle_temperature = 220,220,220,270
; nozzle_temperature_initial_layer = 220,220,220,260
; nozzle_temperature_range_high = 240,240,240,280
; nozzle_temperature_range_low = 190,190,190,240
; nozzle_type = stainless_steel
; nozzle_volume = 107
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
; overhang_fan_speed = 100,100,100,80
; overhang_fan_threshold = 50%,50%,50%,25%
; overhang_totally_speed = 50
; post_process = 
; precise_z_height = 0
; pressure_advance = 0.02,0.02,0.02,0.02
; prime_tower_brim_width = 3
; prime_tower_width = 35
; prime_volume = 45
; print_compatible_printers = "Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL X1C
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_model = Bambu Lab P1S
; printer_notes = 
; printer_settings_id = Bambu Lab P1S 0.4 nozzle
; printer_structure = corexy
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
; reduce_fan_stop_start_freq = 1,1,1,1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3,3,3,3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
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
; slow_down_for_layer_cooling = 1,1,1,1
; slow_down_layer_time = 4,8,8,12
; slow_down_min_speed = 20,20,20,20
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 150
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
; temperature_vitrification = 45,45,45,100
; template_custom_gcode = 
; textured_plate_temp = 55,55,55,90
; textured_plate_temp_initial_layer = 55,55,55,90
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = 
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
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_distance = 5
; tree_support_wall_count = 0
; upward_compatible_machine = "Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle"
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
; wipe_tower_x = 165
; wipe_tower_y = 241
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R22
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: P1S ========================
;===== date: 20231107 =====================
;===== turn on the HB fan & MC board fan =================
M104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle
M710 A1 S255 ;turn on MC fan by default(P1S)
;===== reset machine status =================
M290 X40 Y40 Z2.6666666
G91
M17 Z0.4 ; lower the z-motor current
G380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed
G380 S2 Z-25 F300 ;
G1 Z5 F300;
G90
M17 X1.2 Y1.2 Z0.75 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 5
M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem
G29.1 Z0 ; clear z-trim value first
M204 S10000 ; init ACC set to 10m/s^2

;===== heatbed preheat ====================
M1002 gcode_claim_action : 2
M140 S55 ;set bed temp
M190 S55 ;wait for bed temp



;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S220 ;set extruder temp
G91
G0 Z10 F1200
G90
G28 X
M975 S1 ; turn on
M73 P19 R18
G1 X60 F12000
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
    G1 Y265
    M400
M621 S0A
M620.1 E F523.843 T240


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
G1 E50 F200
M400
M104 S220
G92 E0
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P20 R18
G1 E-0.5 F300

M73 P21 R17
G1 X70 F9000
G1 X76 F15000
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
G1 X165 F15000; wipe and shake
M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S200
G1 X100 F18000 ; first wipe mouth

G0 X135 Y253 F20000  ; move to exposed steel surface edge
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
G0 Z5 F20000

G1 X60 Y265
G92 E0
G1 E-0.5 F300 ; retrack more
G1 X100 F5000; second wipe mouth
G1 X70 F15000
M73 P22 R17
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X90 F5000
G0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle
M104 S140 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)

M221 S; push soft endstop status
M221 Z0 ;turn off Z axis endstop
G0 Z0.5 F20000
G0 X125 Y259.5 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 X128
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
G1 Z10
G1 F30000
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X100 Y100 I56 J56
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

M975 S1 ; turn on vibration supression


;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S220 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q0 A7 B30 C90 Q0 H15 K0
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X230 Y15
G28 X ; re-home XY
;===== fmech mode fast check============================


;===== nozzle load line ===============================
M975 S1
G90
M83
T1000
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S220
G1 Z0.2
G0 E2 F300
G0 X240 E15 F6033.27
G0 Y11 E0.700 F1508.32
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F6033.27
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.04 ; for Textured PEI Plate

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
G21
M83 ; use relative distances for extrusion
; filament start gcode
M106 P3 S150

M142 P1 R35 S40
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S500
G1 X106.773 Y150.005 F30000
M73 P23 R17
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X106.2 Y149.537 E.02754
G3 X100.857 Y137.994 I9.813 J-11.551 E.4889
G1 X100.857 Y114.006 E.89348
G3 X116.49 Y98.857 I15.159 J.003 E.90444
G1 X140 Y98.857 E.87567
G3 X155.143 Y114.006 I-.014 J15.156 E.88594
G1 X155.143 Y137.994 E.89347
G3 X139.994 Y153.143 I-15.157 J-.008 E.88617
G1 X116.006 Y153.143 E.89348
G3 X106.834 Y150.047 I.008 J-15.157 E.36696
G1 X106.823 Y150.039 E.00054
G1 X106.485 Y150.356 F30000
; FEATURE: Outer wall
G1 F3000
G1 X106.23 Y150.154 E.0121
M73 P24 R17
G3 X100.4 Y137.997 I9.784 J-12.168 E.51926
G1 X100.4 Y114.003 E.89371
G3 X116.49 Y98.4 I15.616 J.006 E.93106
G1 X140.004 Y98.4 E.87579
G3 X155.6 Y114.003 I-.017 J15.614 E.91244
G1 X155.6 Y137.997 E.89371
G3 X139.997 Y153.6 I-15.614 J-.011 E.91268
G1 X116.003 Y153.6 E.89371
G3 X106.902 Y150.666 I.011 J-15.614 E.36195
G1 X106.533 Y150.391 E.01712
; WIPE_START
G1 F24000
G1 X106.23 Y150.154 E-.14626
G1 X105.583 Y149.612 E-.32102
G1 X105.023 Y149.082 E-.29271
; WIPE_END
G1 E-.04 F1800
G1 X110.202 Y143.475 Z.6 F30000
G1 X148.674 Y101.818 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.502641
G1 F6300
G1 X150.728 Y103.872 E.10884
G3 X152.698 Y106.492 I-11.234 J10.496 E.12303
G1 X147.508 Y101.302 E.27498
G2 X146.161 Y100.605 I-5.81 J9.582 E.05684
G1 X153.413 Y107.857 E.38421
M73 P25 R17
G3 X153.848 Y108.943 I-7.8 J3.758 E.04384
G1 X145.04 Y100.135 E.46663
G2 X144.082 Y99.827 I-3.32 J8.682 E.03773
G1 X154.173 Y109.918 E.53461
G3 X154.395 Y110.79 I-7.889 J2.474 E.03374
G1 X143.21 Y99.605 E.59258
G2 X142.41 Y99.455 I-1.506 J5.825 E.03052
G1 X154.552 Y111.597 E.64325
G3 X154.651 Y112.346 I-5.477 J1.108 E.02835
G1 X141.645 Y99.34 E.68905
G2 X140.933 Y99.278 I-.81 J5.218 E.02678
G1 X154.719 Y113.065 E.73037
G3 X154.747 Y113.742 I-4.978 J.544 E.02544
G1 X140.257 Y99.253 E.76764
M73 P25 R16
G2 X139.6 Y99.246 I-.46 J12.128 E.02463
G1 X154.754 Y114.4 E.80285
G1 X154.754 Y115.05 E.02436
G1 X138.95 Y99.246 E.83729
G1 X138.3 Y99.246 E.02436
G1 X154.754 Y115.7 E.87173
G1 X154.754 Y116.35 E.02436
G1 X137.65 Y99.246 E.90618
G1 X137 Y99.246 E.02436
G1 X154.754 Y117 E.94062
G1 X154.754 Y117.651 E.02436
G1 X136.349 Y99.246 E.97506
G1 X135.699 Y99.246 E.02436
G1 X154.754 Y118.301 E1.00951
G1 X154.754 Y118.951 E.02436
G1 X135.049 Y99.246 E1.04395
G1 X134.399 Y99.246 E.02436
G1 X154.754 Y119.601 E1.0784
G1 X154.754 Y120.251 E.02436
G1 X133.749 Y99.246 E1.11284
G1 X133.099 Y99.246 E.02436
G1 X154.754 Y120.901 E1.14728
G1 X154.754 Y121.551 E.02436
G1 X132.449 Y99.246 E1.18173
G1 X131.798 Y99.246 E.02436
G1 X154.754 Y122.202 E1.21617
G1 X154.754 Y122.852 E.02436
G1 X131.148 Y99.246 E1.25061
G1 X130.498 Y99.246 E.02436
G1 X154.754 Y123.502 E1.28506
G1 X154.754 Y124.152 E.02436
G1 X129.848 Y99.246 E1.3195
G1 X129.198 Y99.246 E.02436
M73 P26 R16
G1 X154.754 Y124.802 E1.35395
G1 X154.754 Y125.452 E.02436
G1 X128.548 Y99.246 E1.38839
G1 X127.898 Y99.246 E.02436
G1 X154.754 Y126.102 E1.42283
G1 X154.754 Y126.753 E.02436
G1 X127.247 Y99.246 E1.45728
G1 X126.597 Y99.246 E.02436
G1 X154.754 Y127.403 E1.49172
G1 X154.754 Y128.053 E.02436
G1 X125.947 Y99.246 E1.52616
G1 X125.297 Y99.246 E.02436
G1 X154.754 Y128.703 E1.56061
G1 X154.754 Y129.353 E.02436
G1 X124.647 Y99.246 E1.59505
G1 X123.997 Y99.246 E.02436
G1 X154.754 Y130.003 E1.6295
G1 X154.754 Y130.653 E.02436
G1 X123.347 Y99.246 E1.66394
G1 X122.696 Y99.246 E.02436
G1 X154.754 Y131.304 E1.69838
G1 X154.754 Y131.954 E.02436
G1 X122.046 Y99.246 E1.73283
G1 X121.396 Y99.246 E.02436
G1 X154.754 Y132.604 E1.76727
G1 X154.754 Y133.254 E.02436
G1 X120.746 Y99.246 E1.80171
G1 X120.096 Y99.246 E.02436
G1 X154.754 Y133.904 E1.83616
G1 X154.754 Y134.554 E.02436
G1 X119.446 Y99.246 E1.8706
G1 X118.796 Y99.246 E.02436
G1 X154.754 Y135.204 E1.90505
G1 X154.754 Y135.855 E.02436
G1 X118.145 Y99.246 E1.93949
G1 X117.495 Y99.246 E.02436
G1 X154.754 Y136.505 E1.97393
G1 X154.754 Y137.155 E.02436
G1 X116.845 Y99.246 E2.00838
G2 X116.2 Y99.251 I-.176 J18.957 E.02417
G1 X154.754 Y137.805 E2.04256
G3 X154.742 Y138.443 I-11.822 J.092 E.0239
G1 X115.561 Y99.261 E2.07577
G2 X114.941 Y99.292 I-.112 J3.988 E.02325
G1 X154.711 Y139.062 E2.10694
G3 X154.659 Y139.66 I-5.539 J-.183 E.02249
G1 X114.348 Y99.349 E2.13562
G2 X113.772 Y99.423 I.168 J3.573 E.02177
G1 X154.581 Y140.232 E2.162
G3 X154.479 Y140.78 I-4.091 J-.48 E.0209
G1 X113.22 Y99.521 E2.18583
G2 X112.679 Y99.63 I.399 J3.377 E.0207
G1 X154.368 Y141.319 E2.20861
G3 X154.24 Y141.842 I-3.917 J-.679 E.02017
G1 X112.164 Y99.766 E2.22912
G2 X111.651 Y99.902 I.583 J3.222 E.01993
G1 X154.098 Y142.35 E2.24879
G1 X153.934 Y142.836 E.01922
G1 X111.17 Y100.072 E2.26558
G1 X110.689 Y100.241 E.0191
G1 X153.76 Y143.312 E2.28183
M73 P27 R16
G1 X153.574 Y143.777 E.01875
G1 X110.23 Y100.432 E2.29634
G1 X109.78 Y100.633 E.01844
G1 X153.371 Y144.224 E2.3094
G3 X153.161 Y144.663 I-4.166 J-1.726 E.01827
G1 X109.338 Y100.841 E2.32165
G1 X108.918 Y101.071 E.01794
G1 X152.935 Y145.088 E2.33198
G3 X152.699 Y145.502 I-3.934 J-1.975 E.01786
G1 X108.498 Y101.301 E2.3417
G2 X108.099 Y101.552 I1.343 J2.576 E.01768
G1 X152.455 Y145.908 E2.3499
G3 X152.194 Y146.297 I-3.72 J-2.212 E.01756
G1 X107.707 Y101.81 E2.35685
G2 X107.32 Y102.073 I1.425 J2.506 E.01755
G1 X151.928 Y146.681 E2.36322
G1 X151.647 Y147.05 E.01738
G1 X106.955 Y102.359 E2.36768
G1 X106.591 Y102.644 E.01735
G1 X151.357 Y147.411 E2.37169
G1 X151.059 Y147.763 E.01728
G1 X106.242 Y102.946 E2.37434
G1 X105.904 Y103.257 E.01724
G1 X150.747 Y148.101 E2.37574
G1 X150.431 Y148.435 E.01723
G1 X105.565 Y103.569 E2.3769
G1 X105.254 Y103.908 E.01724
G1 X150.097 Y148.751 E2.37573
G3 X149.757 Y149.061 I-2.457 J-2.352 E.01725
G1 X104.942 Y104.246 E2.37424
G2 X104.639 Y104.593 I2.407 J2.408 E.01727
G1 X149.401 Y149.355 E2.37144
G1 X149.045 Y149.65 E.0173
G1 X104.349 Y104.953 E2.36793
G2 X104.071 Y105.326 I3.297 J2.747 E.01741
G1 X148.674 Y149.929 E2.36299
G1 X148.296 Y150.2 E.01745
G1 X103.8 Y105.704 E2.35734
G2 X103.55 Y106.105 I2.828 J2.042 E.01769
G1 X147.9 Y150.455 E2.3496
M73 P28 R16
G3 X147.497 Y150.702 I-2.025 J-2.847 E.01772
G1 X103.301 Y106.506 E2.34144
G2 X103.064 Y106.919 I2.419 J1.661 E.01786
G1 X147.077 Y150.932 E2.33174
G1 X146.657 Y151.162 E.01794
G1 X102.844 Y107.349 E2.32116
G1 X102.623 Y107.779 E.01809
G1 X146.218 Y151.374 E2.30961
G3 X145.771 Y151.577 I-2.096 J-4.021 E.0184
G1 X102.431 Y108.237 E2.29611
G1 X102.24 Y108.696 E.01864
G1 X145.306 Y151.762 E2.28156
G3 X144.83 Y151.936 I-1.842 J-4.305 E.019
G1 X102.067 Y109.173 E2.26552
G1 X101.909 Y109.665 E.01936
G1 X144.344 Y152.1 E2.24815
G3 X143.836 Y152.242 I-1.562 J-4.616 E.01978
G1 X101.756 Y110.163 E2.22929
G1 X101.627 Y110.683 E.0201
G1 X143.313 Y152.369 E2.20845
G1 X142.774 Y152.48 E.02062
G1 X101.515 Y111.222 E2.18579
G2 X101.418 Y111.775 I5.023 J1.168 E.02104
G1 X142.225 Y152.582 E2.1619
G1 X141.653 Y152.66 E.02163
G1 X101.34 Y112.347 E2.13571
G2 X101.295 Y112.952 I4.441 J.633 E.02276
G1 X141.055 Y152.712 E2.10639
G3 X140.435 Y152.742 I-.592 J-5.688 E.02325
G1 X101.254 Y113.561 E2.07576
G2 X101.251 Y114.208 I4.788 J.346 E.02426
G1 X139.797 Y152.754 E2.04211
G1 X139.147 Y152.754 E.02436
G1 X101.251 Y114.858 E2.00768
M73 P29 R16
G1 X101.251 Y115.508 E.02435
G1 X138.497 Y152.754 E1.97324
G1 X137.847 Y152.754 E.02436
G1 X101.251 Y116.158 E1.93881
G1 X101.25 Y116.808 E.02435
G1 X137.197 Y152.754 E1.90437
G1 X136.546 Y152.754 E.02436
G1 X101.25 Y117.458 E1.86993
G1 X101.25 Y118.108 E.02435
G1 X135.896 Y152.754 E1.8355
G1 X135.246 Y152.754 E.02436
G1 X101.25 Y118.758 E1.80106
G1 X101.25 Y119.408 E.02435
G1 X134.596 Y152.754 E1.76663
G1 X133.946 Y152.754 E.02436
G1 X101.25 Y120.058 E1.73219
G1 X101.25 Y120.708 E.02435
G1 X133.296 Y152.754 E1.69776
G1 X132.646 Y152.754 E.02436
G1 X101.249 Y121.358 E1.66332
G1 X101.249 Y122.008 E.02435
G1 X131.995 Y152.754 E1.62888
G1 X131.345 Y152.754 E.02436
G1 X101.249 Y122.658 E1.59445
G1 X101.249 Y123.308 E.02435
G1 X130.695 Y152.754 E1.56001
M73 P29 R15
G1 X130.045 Y152.754 E.02436
G1 X101.249 Y123.958 E1.52558
G1 X101.249 Y124.608 E.02435
G1 X129.395 Y152.754 E1.49114
G1 X128.745 Y152.754 E.02436
G1 X101.249 Y125.258 E1.45671
G1 X101.248 Y125.908 E.02435
G1 X128.095 Y152.754 E1.42227
M73 P30 R15
G1 X127.444 Y152.754 E.02436
G1 X101.248 Y126.558 E1.38783
G1 X101.248 Y127.208 E.02435
G1 X126.794 Y152.754 E1.3534
G1 X126.144 Y152.754 E.02436
G1 X101.248 Y127.858 E1.31896
G1 X101.248 Y128.508 E.02435
G1 X125.494 Y152.754 E1.28453
G1 X124.844 Y152.754 E.02436
G1 X101.248 Y129.158 E1.25009
G1 X101.247 Y129.808 E.02435
G1 X124.194 Y152.754 E1.21566
G1 X123.544 Y152.754 E.02436
G1 X101.247 Y130.458 E1.18122
G1 X101.247 Y131.108 E.02435
G1 X122.893 Y152.754 E1.14678
G1 X122.243 Y152.754 E.02436
G1 X101.247 Y131.758 E1.11235
G1 X101.247 Y132.408 E.02435
G1 X121.593 Y152.754 E1.07791
G1 X120.943 Y152.754 E.02436
G1 X101.247 Y133.058 E1.04348
G1 X101.247 Y133.708 E.02435
G1 X120.293 Y152.754 E1.00904
G1 X119.643 Y152.754 E.02436
G1 X101.246 Y134.358 E.97461
G1 X101.246 Y135.008 E.02435
G1 X118.993 Y152.754 E.94017
G1 X118.342 Y152.754 E.02436
G1 X101.246 Y135.658 E.90574
G1 X101.246 Y136.308 E.02435
G1 X117.692 Y152.754 E.8713
G1 X117.042 Y152.754 E.02436
G1 X101.246 Y136.958 E.83686
G1 X101.246 Y137.608 E.02435
G1 X116.392 Y152.754 E.80243
G3 X115.734 Y152.747 I-.19 J-12.182 E.02464
G1 X101.253 Y138.266 E.7672
M73 P31 R15
G2 X101.279 Y138.942 I6.238 J.098 E.02536
G1 X115.058 Y152.721 E.73
G3 X114.347 Y152.66 I.208 J-6.588 E.02675
G1 X101.341 Y139.654 E.68902
G1 X101.456 Y140.419 E.02898
G1 X113.593 Y152.556 E.64299
G1 X112.785 Y152.398 E.03086
G1 X101.607 Y141.22 E.59217
G2 X101.83 Y142.093 I8.161 J-1.618 E.03376
G1 X111.902 Y152.165 E.53362
G3 X110.948 Y151.861 I1.771 J-7.204 E.03755
G1 X102.156 Y143.069 E.46577
G2 X102.593 Y144.156 I8.233 J-2.677 E.04392
G1 X109.835 Y151.398 E.38368
G3 X108.466 Y150.679 I6.211 J-13.491 E.05796
G1 X103.312 Y145.526 E.27303
G2 X104.253 Y146.927 I15.595 J-9.455 E.06324
G1 X105.02 Y147.855 E.04509
G1 X105.536 Y148.4 E.02815
G1 X107.316 Y150.18 E.09428
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X105.902 Y148.766 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S255
M106 P2 S178
; open powerlost recovery
M1003 S1
M204 S10000
G17
G3 Z.6 I-1.09 J.54 P1  F30000
G1 X106.611 Y150.197 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.357 Y149.997 E.01074
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.014 Y98.602 E.79647
G3 X155.398 Y114.004 I-.028 J15.411 E.80179
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.02 Y150.502 I.01 J-15.412 E.31823
G1 X106.659 Y150.233 E.01492
G1 X106.374 Y150.509 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.01028
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.017 Y98.21 E.73793
G3 X155.79 Y114.001 I-.031 J15.804 E.76146
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.422 Y150.545 E.01415
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.303 E-.14989
M73 P32 R15
G1 X105.456 Y149.753 E-.32493
G1 X104.911 Y149.237 E-.28518
; WIPE_END
G1 E-.04 F1800
G1 X112.541 Y149.41 Z.8 F30000
G1 X149.064 Y150.239 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421988
G1 F15000
G2 X151.213 Y148.06 I-39.138 J-40.751 E.09454
G1 X151.74 Y147.44 E.02513
G1 X152.47 Y146.452 E.03794
G1 X152.745 Y146.022 E.01575
G1 X148.014 Y150.753 E.20664
G3 X146.782 Y151.449 I-7.037 J-11.016 E.04374
G1 X153.434 Y144.796 E.29061
G1 X153.902 Y143.792 E.03421
G1 X145.792 Y151.902 E.35428
G3 X144.928 Y152.23 I-3.455 J-7.803 E.02856
G1 X154.23 Y142.928 E.40633
G2 X154.478 Y142.145 I-7.104 J-2.676 E.0254
G1 X144.145 Y152.478 E.45139
G3 X143.424 Y152.663 I-1.732 J-5.255 E.02301
G1 X154.663 Y141.424 E.49096
G1 X154.802 Y140.749 E.02129
G1 X142.748 Y152.802 E.52654
G3 X142.103 Y152.911 I-1.131 J-4.734 E.02022
G1 X154.912 Y140.103 E.55952
G2 X154.987 Y139.491 I-5.605 J-1.005 E.01905
G1 X141.491 Y152.987 E.58958
G1 X140.907 Y153.035 E.01809
G1 X155.035 Y138.907 E.61715
G2 X155.055 Y138.351 I-5.113 J-.462 E.0172
G1 X140.351 Y153.055 E.64232
G3 X139.805 Y153.065 I-.453 J-10.093 E.01686
G1 X155.065 Y137.805 E.66659
G1 X155.064 Y137.269 E.01656
G1 X139.269 Y153.065 E.69
G1 X138.733 Y153.065 E.01656
G1 X155.064 Y136.733 E.71341
G1 X155.064 Y136.198 E.01656
G1 X138.197 Y153.065 E.73682
G1 X137.661 Y153.065 E.01656
G1 X155.064 Y135.662 E.76024
G1 X155.064 Y135.126 E.01656
G1 X137.125 Y153.065 E.78365
G1 X136.589 Y153.065 E.01656
G1 X155.064 Y134.59 E.80706
G1 X155.064 Y134.054 E.01656
G1 X136.053 Y153.065 E.83047
G1 X135.517 Y153.065 E.01656
G1 X155.064 Y133.518 E.85389
G1 X155.063 Y132.982 E.01656
G1 X134.981 Y153.065 E.8773
G1 X134.445 Y153.065 E.01656
G1 X155.063 Y132.446 E.90071
G1 X155.063 Y131.91 E.01656
G1 X133.908 Y153.065 E.92413
G1 X133.372 Y153.065 E.01656
G1 X155.063 Y131.374 E.94754
G1 X155.063 Y130.838 E.01656
G1 X132.836 Y153.065 E.97095
G1 X132.3 Y153.065 E.01656
G1 X155.063 Y130.302 E.99436
G1 X155.063 Y129.766 E.01656
G1 X131.764 Y153.065 E1.01778
G1 X131.228 Y153.065 E.01656
G1 X155.063 Y129.23 E1.04119
G1 X155.062 Y128.694 E.01656
G1 X130.692 Y153.065 E1.0646
G1 X130.156 Y153.065 E.01656
G1 X155.062 Y128.158 E1.08802
G1 X155.062 Y127.622 E.01656
G1 X129.62 Y153.065 E1.11143
G1 X129.084 Y153.065 E.01656
G1 X155.062 Y127.086 E1.13484
G1 X155.062 Y126.55 E.01656
G1 X128.548 Y153.065 E1.15825
G1 X128.012 Y153.065 E.01656
G1 X155.062 Y126.014 E1.18167
G1 X155.062 Y125.478 E.01656
G1 X127.475 Y153.065 E1.20508
G1 X126.939 Y153.065 E.01656
G1 X155.062 Y124.942 E1.22849
G1 X155.061 Y124.406 E.01656
G1 X126.403 Y153.065 E1.2519
G1 X125.867 Y153.065 E.01656
G1 X155.061 Y123.87 E1.27532
G1 X155.061 Y123.335 E.01656
G1 X125.331 Y153.065 E1.29873
G1 X124.795 Y153.065 E.01656
G1 X155.061 Y122.799 E1.32214
G1 X155.061 Y122.263 E.01656
G1 X124.259 Y153.065 E1.34556
G1 X123.723 Y153.065 E.01656
G1 X155.061 Y121.727 E1.36897
G1 X155.061 Y121.191 E.01656
G1 X123.187 Y153.065 E1.39238
G1 X122.651 Y153.065 E.01656
G1 X155.061 Y120.655 E1.41579
G1 X155.06 Y120.119 E.01656
G1 X122.115 Y153.065 E1.43921
G1 X121.579 Y153.065 E.01656
G1 X155.06 Y119.583 E1.46262
G1 X155.06 Y119.047 E.01656
G1 X121.042 Y153.065 E1.48603
G1 X120.506 Y153.065 E.01656
G1 X155.06 Y118.511 E1.50945
G1 X155.06 Y117.975 E.01656
G1 X119.97 Y153.065 E1.53286
G1 X119.434 Y153.065 E.01656
G1 X155.06 Y117.439 E1.55627
G1 X155.06 Y116.903 E.01656
G1 X118.898 Y153.065 E1.57968
G1 X118.362 Y153.065 E.01656
G1 X155.06 Y116.367 E1.6031
G1 X155.059 Y115.831 E.01656
G1 X117.826 Y153.065 E1.62651
G1 X117.29 Y153.065 E.01656
G1 X155.059 Y115.295 E1.64992
G1 X155.059 Y114.759 E.01656
G1 X116.754 Y153.065 E1.67333
G1 X116.218 Y153.065 E.01656
G1 X155.059 Y114.223 E1.69675
G1 X155.059 Y113.687 E.01656
G1 X115.69 Y153.056 E1.71978
G3 X115.169 Y153.041 I-.123 J-4.806 E.01611
G1 X155.036 Y113.174 E1.74156
G2 X155.002 Y112.672 I-3.715 J.004 E.01554
G1 X114.673 Y153.001 E1.76171
G3 X114.187 Y152.951 I.215 J-4.51 E.01511
G1 X154.943 Y112.195 E1.7804
G1 X154.885 Y111.717 E.01486
G1 X113.715 Y152.887 E1.79845
G3 X113.262 Y152.804 I.384 J-3.383 E.01424
G1 X154.808 Y111.258 E1.81488
G1 X154.721 Y110.809 E.01415
G1 X112.817 Y152.712 E1.83053
G1 X112.373 Y152.621 E.01402
G1 X154.617 Y110.377 E1.84537
G2 X154.509 Y109.949 I-3.209 J.583 E.01365
G1 X111.953 Y152.505 E1.85901
G3 X111.535 Y152.386 I.884 J-3.91 E.01341
G1 X154.378 Y109.544 E1.87155
G1 X154.247 Y109.138 E.01316
G1 X111.134 Y152.251 E1.88336
G3 X110.736 Y152.113 I1.056 J-3.679 E.01301
G1 X154.112 Y108.737 E1.89483
G1 X153.955 Y108.358 E.01267
G1 X110.353 Y151.96 E1.9047
G3 X109.974 Y151.804 I.972 J-2.898 E.01269
G1 X153.798 Y107.979 E1.91443
G2 X153.636 Y107.605 I-2.379 J.807 E.01261
G1 X109.611 Y151.63 E1.92318
G1 X109.249 Y151.456 E.01241
G1 X153.454 Y107.251 E1.93107
G1 X153.273 Y106.896 E.0123
G1 X108.89 Y151.279 E1.93882
G1 X108.547 Y151.086 E.01215
G1 X153.088 Y106.545 E1.94572
G1 X152.883 Y106.214 E.01203
G1 X108.206 Y150.891 E1.95166
G1 X107.879 Y150.682 E.01199
G1 X152.678 Y105.883 E1.95698
G1 X152.472 Y105.552 E.01203
G1 X107.552 Y150.473 E1.9623
G3 X107.24 Y150.249 I1.905 J-2.987 E.01187
G1 X152.245 Y105.244 E1.96601
G1 X152.017 Y104.935 E.01184
G1 X106.928 Y150.025 E1.96968
M73 P33 R15
G3 X106.628 Y149.788 I2.033 J-2.878 E.01179
G1 X151.789 Y104.627 E1.97281
G2 X151.544 Y104.336 I-1.908 J1.36 E.01176
G1 X106.331 Y149.549 E1.97508
G3 X106.045 Y149.3 I2.156 J-2.768 E.01174
G1 X151.294 Y104.05 E1.97668
G1 X151.044 Y103.764 E.01174
G1 X105.762 Y149.046 E1.97811
G3 X105.488 Y148.784 I2.277 J-2.661 E.01172
G1 X150.782 Y103.49 E1.97864
G1 X150.51 Y103.225 E.01171
G1 X105.22 Y148.516 E1.97848
G3 X104.959 Y148.241 I1.903 J-2.058 E.01172
G1 X150.239 Y102.961 E1.97799
G2 X149.96 Y102.704 I-1.717 J1.585 E.01173
G1 X104.709 Y147.954 E1.97671
G1 X104.46 Y147.668 E.01174
G1 X149.666 Y102.462 E1.9748
G1 X149.373 Y102.219 E.01176
G1 X104.213 Y147.378 E1.97274
G1 X103.982 Y147.074 E.01182
G1 X149.076 Y101.979 E1.96991
G1 X148.761 Y101.759 E.01189
G1 X103.751 Y146.768 E1.96619
G1 X103.534 Y146.449 E.01192
G1 X148.445 Y101.539 E1.96186
G1 X148.129 Y101.318 E.01189
G1 X103.318 Y146.129 E1.95753
G3 X103.116 Y145.795 I2.976 J-2.03 E.01206
G1 X147.792 Y101.12 E1.95162
G1 X147.453 Y100.922 E.01211
G1 X102.914 Y145.461 E1.94563
G3 X102.726 Y145.113 I3.117 J-1.907 E.01223
G1 X147.115 Y100.724 E1.93905
G2 X146.756 Y100.547 I-1.27 J2.111 E.01237
G1 X102.541 Y144.762 E1.93151
G3 X102.368 Y144.399 I3.264 J-1.775 E.01243
G1 X146.394 Y100.373 E1.92322
G1 X146.031 Y100.199 E.01241
G1 X102.198 Y144.032 E1.9148
G3 X102.042 Y143.653 I3.423 J-1.632 E.01269
G1 X145.649 Y100.045 E1.90494
G1 X145.262 Y99.897 E.01282
G1 X101.889 Y143.269 E1.89467
G3 X101.751 Y142.872 I3.596 J-1.476 E.01301
G1 X144.874 Y99.749 E1.88379
G2 X144.464 Y99.623 I-.977 J2.457 E.01327
G1 X101.616 Y142.471 E1.87177
G3 X101.497 Y142.054 I3.79 J-1.304 E.01341
G1 X144.049 Y99.502 E1.85883
G1 X143.634 Y99.381 E.01335
G1 X101.381 Y141.634 E1.84579
G1 X101.289 Y141.189 E.01402
G1 X143.189 Y99.289 E1.83037
G1 X142.745 Y99.197 E.01402
G1 X101.197 Y140.745 E1.81495
G3 X101.114 Y140.292 I3.297 J-.841 E.01423
G1 X142.29 Y99.116 E1.79872
G1 X141.812 Y99.058 E.01486
G1 X101.05 Y139.82 E1.78067
G3 X101 Y139.334 I4.456 J-.705 E.0151
G1 X141.335 Y98.999 E1.76199
G2 X140.829 Y98.969 I-.437 J3.106 E.01568
G1 X100.959 Y138.838 E1.74164
G3 X100.944 Y138.318 I4.787 J-.401 E.0161
G1 X140.314 Y98.948 E1.71981
G2 X139.79 Y98.936 I-.415 J6.386 E.01618
G1 X100.935 Y137.79 E1.69733
G1 X100.935 Y137.254 E.01656
G1 X139.254 Y98.936 E1.67391
G1 X138.718 Y98.936 E.01656
G1 X100.935 Y136.718 E1.65049
G1 X100.935 Y136.182 E.01656
G1 X138.182 Y98.936 E1.62707
G1 X137.646 Y98.936 E.01656
G1 X100.935 Y135.646 E1.60366
G1 X100.935 Y135.11 E.01656
G1 X137.11 Y98.936 E1.58024
G1 X136.574 Y98.936 E.01656
G1 X100.935 Y134.574 E1.55682
G1 X100.935 Y134.038 E.01656
G1 X136.037 Y98.936 E1.5334
G1 X135.501 Y98.936 E.01656
G1 X100.935 Y133.502 E1.50998
G1 X100.935 Y132.966 E.01656
G1 X134.965 Y98.936 E1.48657
G1 X134.429 Y98.936 E.01656
G1 X100.935 Y132.429 E1.46315
G1 X100.935 Y131.893 E.01656
G1 X133.893 Y98.936 E1.43973
G1 X133.357 Y98.936 E.01656
G1 X100.935 Y131.357 E1.41631
G1 X100.935 Y130.821 E.01656
G1 X132.821 Y98.936 E1.39289
G1 X132.285 Y98.936 E.01656
G1 X100.935 Y130.285 E1.36948
G1 X100.935 Y129.749 E.01656
G1 X131.749 Y98.936 E1.34606
M73 P34 R15
G1 X131.213 Y98.936 E.01656
G1 X100.935 Y129.213 E1.32264
G1 X100.935 Y128.677 E.01656
G1 X130.677 Y98.935 E1.29922
G1 X130.141 Y98.935 E.01656
G1 X100.935 Y128.141 E1.2758
G1 X100.935 Y127.605 E.01656
G1 X129.605 Y98.935 E1.25239
G1 X129.068 Y98.935 E.01656
G1 X100.935 Y127.069 E1.22897
G1 X100.935 Y126.533 E.01656
G1 X128.532 Y98.935 E1.20555
G1 X127.996 Y98.935 E.01656
G1 X100.935 Y125.996 E1.18213
G1 X100.935 Y125.46 E.01656
G1 X127.46 Y98.935 E1.15871
M73 P34 R14
G1 X126.924 Y98.935 E.01656
G1 X100.935 Y124.924 E1.1353
G1 X100.935 Y124.388 E.01656
G1 X126.388 Y98.935 E1.11188
G1 X125.852 Y98.935 E.01656
G1 X100.935 Y123.852 E1.08846
G1 X100.935 Y123.316 E.01656
G1 X125.316 Y98.935 E1.06504
G1 X124.78 Y98.935 E.01656
G1 X100.935 Y122.78 E1.04162
G1 X100.935 Y122.244 E.01656
G1 X124.244 Y98.935 E1.01821
G1 X123.708 Y98.935 E.01656
G1 X100.935 Y121.708 E.99479
G1 X100.935 Y121.172 E.01656
G1 X123.172 Y98.935 E.97137
G1 X122.636 Y98.935 E.01656
G1 X100.935 Y120.636 E.94795
G1 X100.935 Y120.1 E.01656
G1 X122.099 Y98.935 E.92453
G1 X121.563 Y98.935 E.01656
G1 X100.935 Y119.563 E.90112
G1 X100.935 Y119.027 E.01656
G1 X121.027 Y98.935 E.8777
G1 X120.491 Y98.935 E.01656
G1 X100.935 Y118.491 E.85428
G1 X100.935 Y117.955 E.01656
G1 X119.955 Y98.935 E.83086
G1 X119.419 Y98.935 E.01656
G1 X100.935 Y117.419 E.80744
G1 X100.935 Y116.883 E.01656
G1 X118.883 Y98.935 E.78403
G1 X118.347 Y98.935 E.01656
G1 X100.935 Y116.347 E.76061
G1 X100.935 Y115.811 E.01656
G1 X117.811 Y98.935 E.73719
G1 X117.275 Y98.935 E.01656
G1 X100.935 Y115.275 E.71377
G1 X100.935 Y114.739 E.01656
G1 X116.739 Y98.935 E.69035
G1 X116.203 Y98.935 E.01656
G1 X100.935 Y114.203 E.66694
G3 X100.945 Y113.657 I10.098 J-.097 E.01686
G1 X115.652 Y98.95 E.64247
G1 X115.093 Y98.973 E.01727
G1 X100.964 Y113.101 E.6172
G1 X101.012 Y112.518 E.01809
G1 X114.516 Y99.014 E.58992
G2 X113.911 Y99.082 I.332 J5.614 E.01882
G1 X101.087 Y111.906 E.5602
G3 X101.191 Y111.267 I5.952 J.636 E.02003
G1 X113.27 Y99.188 E.52767
G2 X112.59 Y99.331 I.983 J6.338 E.02146
G1 X101.334 Y110.588 E.49174
G1 X101.525 Y109.86 E.02324
G1 X111.866 Y99.519 E.45175
G2 X111.084 Y99.766 I1.884 J7.343 E.02536
G1 X101.766 Y109.084 E.40704
G3 X102.092 Y108.221 I8.118 J2.58 E.02851
G1 X110.221 Y100.092 E.35508
G2 X109.233 Y100.544 I7.551 J17.825 E.03354
G1 X102.559 Y107.218 E.29156
G3 X103.241 Y106 I12.265 J6.068 E.04315
G1 X108.006 Y101.235 E.20813
G2 X106.246 Y102.52 I9.043 J14.237 E.06735
G1 X105.655 Y103.05 E.02451
G1 X103.739 Y104.966 E.0837
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X105.153 Y103.552 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.8 I-1.216 J.038 P1  F30000
G1 X106.615 Y150.2 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.357 Y149.997 E.01089
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.027 Y98.602 E.79688
G3 X155.398 Y114.004 I-.04 J15.411 E.80138
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.02 Y150.502 I.01 J-15.412 E.31823
G1 X106.663 Y150.236 E.01477
G1 X106.377 Y150.512 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.01042
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.03 Y98.21 E.73831
G3 X155.79 Y114.001 I-.043 J15.803 E.76107
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.426 Y150.548 E.01401
M204 S10000
G1 X106.898 Y150.201 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421988
G1 F15000
G1 X105.323 Y148.626 E.06879
G3 X103.247 Y146.014 I11.171 J-11.01 E.10326
G1 X107.976 Y150.743 E.20657
G2 X109.203 Y151.434 I7.283 J-11.499 E.04352
G1 X102.551 Y144.782 E.29059
G3 X102.098 Y143.793 I17.943 J-8.817 E.03361
G1 X110.206 Y151.901 E.35418
G2 X111.071 Y152.23 I3.393 J-7.612 E.02862
G1 X101.775 Y142.934 E.40611
G1 X101.521 Y142.144 E.02562
G1 X111.855 Y152.478 E.45143
G2 X112.58 Y152.667 I2.104 J-6.592 E.02315
G1 X101.333 Y141.419 E.49133
G3 X101.193 Y140.743 I6.166 J-1.629 E.02134
G1 X113.259 Y152.809 E.52709
G1 X113.889 Y152.904 E.0197
G1 X101.088 Y140.103 E.55919
G3 X101.013 Y139.491 I5.605 J-1.005 E.01905
G1 X114.509 Y152.987 E.58958
G1 X115.093 Y153.035 E.01809
G1 X100.965 Y138.907 E.61715
G3 X100.945 Y138.351 I5.112 J-.462 E.0172
G1 X115.649 Y153.055 E.64232
G2 X116.195 Y153.065 I.453 J-10.093 E.01686
G1 X100.935 Y137.805 E.66659
G1 X100.935 Y137.269 E.01656
G1 X116.731 Y153.065 E.69
G1 X117.267 Y153.065 E.01656
G1 X100.935 Y136.733 E.71342
G1 X100.935 Y136.197 E.01656
G1 X117.803 Y153.065 E.73684
G1 X118.339 Y153.065 E.01656
G1 X100.935 Y135.661 E.76026
G1 X100.935 Y135.125 E.01656
G1 X118.875 Y153.065 E.78368
G1 X119.411 Y153.065 E.01656
G1 X100.935 Y134.589 E.8071
G1 X100.935 Y134.053 E.01656
G1 X119.947 Y153.065 E.83051
G1 X120.483 Y153.065 E.01656
G1 X100.935 Y133.517 E.85393
G1 X100.935 Y132.981 E.01656
M73 P35 R14
G1 X121.019 Y153.065 E.87735
G1 X121.555 Y153.065 E.01656
G1 X100.935 Y132.445 E.90077
G1 X100.935 Y131.908 E.01656
G1 X122.092 Y153.065 E.92419
G1 X122.628 Y153.065 E.01656
G1 X100.935 Y131.372 E.94761
G1 X100.935 Y130.836 E.01656
G1 X123.164 Y153.065 E.97102
G1 X123.7 Y153.065 E.01656
G1 X100.935 Y130.3 E.99444
G1 X100.935 Y129.764 E.01656
G1 X124.236 Y153.065 E1.01786
G1 X124.772 Y153.065 E.01656
G1 X100.935 Y129.228 E1.04128
G1 X100.935 Y128.692 E.01656
G1 X125.308 Y153.065 E1.0647
G1 X125.844 Y153.065 E.01656
G1 X100.935 Y128.156 E1.08811
G1 X100.935 Y127.62 E.01656
G1 X126.38 Y153.065 E1.11153
G1 X126.916 Y153.065 E.01656
G1 X100.935 Y127.084 E1.13495
G1 X100.935 Y126.548 E.01656
G1 X127.452 Y153.065 E1.15837
G1 X127.988 Y153.065 E.01656
G1 X100.935 Y126.012 E1.18179
G1 X100.935 Y125.475 E.01656
G1 X128.525 Y153.065 E1.20521
G1 X129.061 Y153.065 E.01656
G1 X100.935 Y124.939 E1.22862
G1 X100.935 Y124.403 E.01656
G1 X129.597 Y153.065 E1.25204
G1 X130.133 Y153.065 E.01656
G1 X100.935 Y123.867 E1.27546
G1 X100.935 Y123.331 E.01656
G1 X130.669 Y153.065 E1.29888
G1 X131.205 Y153.065 E.01656
G1 X100.935 Y122.795 E1.3223
G1 X100.935 Y122.259 E.01656
G1 X131.741 Y153.065 E1.34572
G1 X132.277 Y153.065 E.01656
G1 X100.935 Y121.723 E1.36913
G1 X100.935 Y121.187 E.01656
G1 X132.813 Y153.065 E1.39255
G1 X133.349 Y153.065 E.01656
G1 X100.935 Y120.651 E1.41597
G1 X100.935 Y120.115 E.01656
G1 X133.885 Y153.065 E1.43939
G1 X134.421 Y153.065 E.01656
G1 X100.935 Y119.579 E1.46281
G1 X100.935 Y119.042 E.01656
G1 X134.958 Y153.065 E1.48622
G1 X135.494 Y153.065 E.01656
G1 X100.935 Y118.506 E1.50964
G1 X100.935 Y117.97 E.01656
G1 X136.03 Y153.065 E1.53306
G1 X136.566 Y153.065 E.01656
G1 X100.935 Y117.434 E1.55648
G1 X100.935 Y116.898 E.01656
G1 X137.102 Y153.065 E1.5799
G1 X137.638 Y153.065 E.01656
G1 X100.935 Y116.362 E1.60332
G1 X100.935 Y115.826 E.01656
G1 X138.174 Y153.065 E1.62673
G1 X138.71 Y153.065 E.01656
G1 X100.935 Y115.29 E1.65015
G1 X100.935 Y114.754 E.01656
G1 X139.246 Y153.065 E1.67357
G1 X139.782 Y153.065 E.01656
G1 X100.935 Y114.218 E1.69699
G3 X100.944 Y113.69 I9.764 J-.105 E.0163
G1 X140.31 Y153.056 E1.71966
G2 X140.831 Y153.041 I.123 J-4.809 E.01611
G1 X100.959 Y113.169 E1.74177
G1 X100.999 Y112.673 E.01536
G1 X141.327 Y153.001 E1.76166
G2 X141.813 Y152.951 I-.206 J-4.392 E.0151
G1 X101.051 Y112.189 E1.78062
G1 X101.121 Y111.723 E.01456
G1 X142.284 Y152.886 E1.79815
G2 X142.739 Y152.804 I-.38 J-3.431 E.01428
G1 X101.191 Y111.257 E1.81495
G3 X101.282 Y110.812 I3.327 J.449 E.01404
G1 X143.183 Y152.713 E1.83038
G1 X143.627 Y152.621 E.01401
G1 X101.379 Y110.373 E1.84557
G3 X101.495 Y109.953 I3.935 J.862 E.01347
G1 X144.047 Y152.505 E1.85885
G2 X144.465 Y152.386 I-.884 J-3.908 E.01341
G1 X101.614 Y109.535 E1.87191
G1 X101.749 Y109.134 E.01307
G1 X144.866 Y152.251 E1.88353
G2 X145.264 Y152.113 I-1.076 J-3.737 E.01302
G1 X101.887 Y108.736 E1.89486
G1 X102.04 Y108.354 E.01274
G1 X145.647 Y151.96 E1.90492
G2 X146.027 Y151.804 I-1.25 J-3.582 E.01269
G1 X102.196 Y107.973 E1.9147
G1 X102.37 Y107.611 E.01241
G1 X146.393 Y151.635 E1.92312
G2 X146.757 Y151.462 I-1.409 J-3.439 E.01244
G1 X102.544 Y107.249 E1.9314
G3 X102.721 Y106.89 I2.764 J1.138 E.01238
G1 X147.107 Y151.276 E1.93898
G2 X147.456 Y151.089 I-1.557 J-3.307 E.01223
G1 X102.914 Y106.547 E1.94574
G3 X103.109 Y106.206 I3.244 J1.627 E.01214
G1 X147.79 Y150.887 E1.95185
G2 X148.125 Y150.685 I-1.696 J-3.184 E.01207
G1 X103.318 Y105.879 E1.95731
G1 X103.527 Y105.552 E.01199
G1 X148.444 Y150.469 E1.96214
G1 X148.764 Y150.252 E.01192
G1 X103.751 Y105.24 E1.96632
G1 X103.975 Y104.928 E.01187
G1 X149.069 Y150.022 E1.96988
G1 X149.374 Y149.79 E.01182
G1 X104.212 Y104.629 E1.97284
G1 X104.451 Y104.331 E.01178
G1 X149.667 Y149.547 E1.97521
G1 X149.957 Y149.301 E.01175
G1 X104.7 Y104.045 E1.97697
G1 X104.954 Y103.762 E.01173
G1 X150.237 Y149.045 E1.97815
G1 X150.512 Y148.785 E.01171
G1 X105.216 Y103.488 E1.97874
G1 X105.484 Y103.22 E.01171
G1 X150.781 Y148.517 E1.97875
G1 X151.041 Y148.241 E.01171
G1 X105.758 Y102.958 E1.97817
G1 X106.04 Y102.704 E.01173
G1 X151.297 Y147.961 E1.977
G1 X151.543 Y147.671 E.01175
G1 X106.328 Y102.456 E1.97519
G1 X106.629 Y102.22 E.0118
G1 X151.787 Y147.378 E1.97268
G1 X152.018 Y147.074 E.01182
G1 X106.93 Y101.985 E1.96965
G3 X107.232 Y101.751 I1.877 J2.108 E.01181
G1 X152.249 Y146.768 E1.96652
G1 X152.461 Y146.445 E.01195
G1 X107.551 Y101.535 E1.96186
G1 X107.871 Y101.318 E.01192
G1 X152.674 Y146.122 E1.9572
G1 X152.887 Y145.798 E.01195
G1 X108.205 Y101.116 E1.95191
M73 P36 R14
G1 X108.539 Y100.914 E.01207
G1 X153.083 Y145.458 E1.94583
G1 X153.276 Y145.115 E.01215
G1 X108.887 Y100.726 E1.93908
G1 X109.238 Y100.541 E.01225
G1 X153.453 Y144.756 E1.93152
G1 X153.627 Y144.394 E.01241
G1 X109.601 Y100.368 E1.92324
G1 X109.968 Y100.198 E.01247
G1 X153.801 Y144.032 E1.91483
G2 X153.957 Y143.652 I-2.754 J-1.355 E.0127
G1 X110.347 Y100.042 E1.90507
G1 X110.731 Y99.889 E.01275
G1 X154.111 Y143.269 E1.89501
G2 X154.249 Y142.872 I-3.501 J-1.444 E.01301
G1 X111.128 Y99.751 E1.8837
G1 X111.529 Y99.616 E.01307
G1 X154.384 Y142.471 E1.87209
G2 X154.503 Y142.054 I-3.789 J-1.304 E.01341
G1 X111.946 Y99.497 E1.85905
G1 X112.366 Y99.38 E.01345
G1 X154.619 Y141.634 E1.84579
G1 X154.711 Y141.189 E.01401
G1 X112.805 Y99.284 E1.83061
G3 X113.249 Y99.191 I1.076 J4.043 E.014
G1 X154.803 Y140.745 E1.81525
G2 X154.885 Y140.291 I-3.346 J-.838 E.01427
G1 X113.709 Y99.116 E1.79871
G3 X114.18 Y99.05 I.838 J4.308 E.01469
G1 X154.95 Y139.82 E1.78098
G2 X155 Y139.334 I-4.339 J-.695 E.01509
G1 X114.664 Y98.998 E1.76206
G3 X115.172 Y98.969 I.462 J3.726 E.01572
G1 X155.041 Y138.838 E1.74163
G2 X155.056 Y138.318 I-4.79 J-.401 E.0161
G1 X115.687 Y98.948 E1.7198
G3 X116.21 Y98.935 I.423 J6.438 E.01616
G1 X155.065 Y137.79 E1.69734
G1 X155.064 Y137.254 E.01656
G1 X116.746 Y98.935 E1.67391
G1 X117.282 Y98.935 E.01656
G1 X155.064 Y136.718 E1.65049
G1 X155.064 Y136.182 E.01656
G1 X117.818 Y98.935 E1.62706
G1 X118.354 Y98.935 E.01656
G1 X155.064 Y135.645 E1.60364
G1 X155.064 Y135.109 E.01656
G1 X118.89 Y98.935 E1.58022
G1 X119.426 Y98.935 E.01656
G1 X155.064 Y134.573 E1.55679
G1 X155.064 Y134.037 E.01656
G1 X119.962 Y98.935 E1.53337
G1 X120.498 Y98.935 E.01656
G1 X155.064 Y133.501 E1.50994
G1 X155.063 Y132.964 E.01656
G1 X121.035 Y98.935 E1.48652
G1 X121.571 Y98.935 E.01656
G1 X155.063 Y132.428 E1.4631
G1 X155.063 Y131.892 E.01656
G1 X122.107 Y98.935 E1.43967
G1 X122.643 Y98.935 E.01656
G1 X155.063 Y131.356 E1.41625
G1 X155.063 Y130.82 E.01656
G1 X123.179 Y98.935 E1.39282
G1 X123.715 Y98.935 E.01656
G1 X155.063 Y130.283 E1.3694
G1 X155.063 Y129.747 E.01656
G1 X124.251 Y98.935 E1.34597
G1 X124.787 Y98.935 E.01656
G1 X155.063 Y129.211 E1.32255
G1 X155.062 Y128.675 E.01656
G1 X125.323 Y98.936 E1.29913
G1 X125.859 Y98.936 E.01656
G1 X155.062 Y128.139 E1.2757
G1 X155.062 Y127.602 E.01656
G1 X126.395 Y98.936 E1.25228
G1 X126.932 Y98.936 E.01656
G1 X155.062 Y127.066 E1.22885
G1 X155.062 Y126.53 E.01656
G1 X127.468 Y98.936 E1.20543
G1 X128.004 Y98.936 E.01656
G1 X155.062 Y125.994 E1.18201
G1 X155.062 Y125.457 E.01656
G1 X128.54 Y98.936 E1.15858
G1 X129.076 Y98.936 E.01656
G1 X155.062 Y124.921 E1.13516
G1 X155.061 Y124.385 E.01656
G1 X129.612 Y98.936 E1.11173
G1 X130.148 Y98.936 E.01656
G1 X155.061 Y123.849 E1.08831
G1 X155.061 Y123.313 E.01656
G1 X130.684 Y98.936 E1.06489
G1 X131.22 Y98.936 E.01656
G1 X155.061 Y122.776 E1.04146
G1 X155.061 Y122.24 E.01656
G1 X131.756 Y98.936 E1.01804
G1 X132.292 Y98.936 E.01656
G1 X155.061 Y121.704 E.99461
G1 X155.061 Y121.168 E.01656
M73 P37 R14
G1 X132.829 Y98.936 E.97119
G1 X133.365 Y98.936 E.01656
G1 X155.061 Y120.632 E.94776
G1 X155.06 Y120.095 E.01656
G1 X133.901 Y98.936 E.92434
G1 X134.437 Y98.936 E.01656
G1 X155.06 Y119.559 E.90092
G1 X155.06 Y119.023 E.01656
G1 X134.973 Y98.936 E.87749
G1 X135.509 Y98.936 E.01656
G1 X155.06 Y118.487 E.85407
G1 X155.06 Y117.951 E.01656
G1 X136.045 Y98.936 E.83064
G1 X136.581 Y98.936 E.01656
G1 X155.06 Y117.414 E.80722
G1 X155.06 Y116.878 E.01656
G1 X137.117 Y98.936 E.7838
G1 X137.653 Y98.936 E.01656
G1 X155.06 Y116.342 E.76037
G1 X155.059 Y115.806 E.01656
G1 X138.189 Y98.936 E.73695
G1 X138.726 Y98.936 E.01656
G1 X155.059 Y115.269 E.71352
G1 X155.059 Y114.733 E.01656
G1 X139.262 Y98.936 E.6901
G1 X139.798 Y98.936 E.01656
G1 X155.059 Y114.197 E.66668
G1 X155.059 Y113.661 E.01656
G1 X140.347 Y98.949 E.64266
G1 X140.907 Y98.972 E.01729
G1 X155.031 Y113.097 E.61703
G2 X154.987 Y112.516 I-5.471 J.129 E.018
G1 X141.488 Y99.018 E.58967
G1 X142.099 Y99.093 E.01901
G1 X154.916 Y111.91 E.55991
G1 X154.8 Y111.258 E.02046
G1 X142.739 Y99.196 E.52691
G1 X143.414 Y99.335 E.02129
G1 X154.67 Y110.591 E.49171
G2 X154.482 Y109.868 I-5.429 J1.021 E.02311
G1 X144.144 Y99.53 E.45161
G1 X144.915 Y99.764 E.02489
G1 X154.228 Y109.077 E.40681
G2 X153.892 Y108.205 I-5.523 J1.628 E.02891
G1 X145.784 Y100.097 E.35418
G1 X145.953 Y100.162 E.00559
G1 X146.782 Y100.559 E.0284
G1 X153.435 Y107.212 E.29062
G2 X152.736 Y105.977 I-7.934 J3.675 E.04388
G1 X148 Y101.241 E.20688
G1 X149.117 Y102.007 E.04184
G1 X150.06 Y102.787 E.03779
G3 X152.222 Y104.927 I-77.861 J80.827 E.09398
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X150.801 Y103.52 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
G17
G3 Z1 I-.884 J-.837 P1  F30000
G1 X106.618 Y150.203 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.357 Y149.997 E.01105
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.039 Y98.603 E.79729
G3 X155.398 Y114.004 I-.052 J15.411 E.80096
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.02 Y150.502 I.01 J-15.412 E.31823
G1 X106.667 Y150.239 E.01461
G1 X106.381 Y150.515 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.302 E.01057
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.042 Y98.211 E.73869
G3 X155.79 Y114.001 I-.055 J15.803 E.76069
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.429 Y150.551 E.01386
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.302 E-.15345
G1 X105.456 Y149.753 E-.32492
G1 X104.918 Y149.244 E-.28163
; WIPE_END
G1 E-.04 F1800
G1 X112.044 Y151.977 Z1.2 F30000
G1 X114.676 Y152.986 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X116.302 Y153.05 I1.585 J-19.665 E.05401
G1 X155.044 Y114.308 E1.81746
G1 X155.044 Y114.664 E.01183
G1 X139.331 Y98.951 E.73715
G1 X139.697 Y98.951 E.01215
G1 X100.95 Y137.698 E1.81769
G1 X100.95 Y137.33 E.01219
G1 X116.67 Y153.05 E.73743
G1 X123.978 Y153.05 E.24243
G1 X155.046 Y121.982 E1.45745
G1 X155.046 Y122.342 E.01195
G1 X131.655 Y98.951 E1.09734
G1 X132.021 Y98.951 E.01217
G1 X100.95 Y130.022 E1.45761
G1 X100.95 Y129.654 E.01219
G1 X124.346 Y153.05 E1.09753
G1 X131.654 Y153.05 E.24243
G1 X155.048 Y129.656 E1.09744
G1 X155.048 Y130.02 E.01207
G1 X123.978 Y98.951 E1.45753
G1 X124.346 Y98.951 E.01218
G1 X100.95 Y122.346 E1.09752
G1 X100.95 Y121.978 E.01219
G1 X132.022 Y153.05 E1.45762
G1 X139.33 Y153.05 E.24243
G1 X155.05 Y137.33 E.73743
G1 X155.05 Y137.698 E.01218
G1 X116.302 Y98.95 E1.81772
G1 X116.67 Y98.95 E.01219
G1 X100.95 Y114.67 E.73743
G1 X100.95 Y114.302 E.01219
G1 X139.698 Y153.05 E1.81772
G2 X146.085 Y151.761 I.24 J-15.282 E.21781
G1 X102.239 Y107.915 E2.05689
G3 X105.362 Y103.362 I13.805 J6.122 E.18418
G1 X150.638 Y148.638 E2.12396
G2 X153.761 Y144.085 I-10.682 J-10.675 E.18418
G1 X109.916 Y100.24 E2.05684
G3 X111.438 Y99.664 I5.007 J10.935 E.05403
G1 X154.33 Y109.442 F30000
G1 F15476.087
G2 X153.757 Y107.919 I-9.634 J2.752 E.05403
G1 X109.915 Y151.761 E2.05671
G3 X105.358 Y148.642 I7.338 J-15.608 E.18397
G1 X150.634 Y103.366 E2.12396
G2 X146.083 Y100.241 I-10.786 J10.828 E.18413
G1 X102.239 Y144.085 E2.05681
G3 X101.663 Y142.563 I15.475 J-6.734 E.054
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X102.239 Y144.085 E-.6184
G1 X102.503 Y143.821 E-.1416
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
G17
G3 Z1.2 I-1.023 J.66 P1  F30000
G1 X106.622 Y150.207 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X106.357 Y149.997 E.01123
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.052 Y98.603 E.7977
G3 X155.398 Y114.004 I-.064 J15.411 E.80055
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X106.976 Y150.47 I.01 J-15.412 E.32005
G1 X106.671 Y150.242 E.01262
G1 X106.385 Y150.518 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.01072
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.054 Y98.211 E.73908
G3 X155.79 Y114.001 I-.067 J15.803 E.76031
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.747 Y150.788 I.013 J-15.804 E.3039
G1 X106.433 Y150.554 E.01201
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.303 E-.15532
G1 X105.456 Y149.753 E-.32494
M73 P38 R14
G1 X104.921 Y149.247 E-.27975
; WIPE_END
G1 E-.04 F1800
G1 X105.916 Y141.68 Z1.4 F30000
G1 X111.437 Y99.663 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X109.915 Y100.239 I5.213 J16.054 E.054
G1 X153.761 Y144.085 E2.05689
G3 X150.642 Y148.642 I-15.606 J-7.337 E.18397
G1 X105.362 Y103.362 E2.12414
G2 X102.24 Y107.916 I10.664 J10.66 E.18419
G1 X146.085 Y151.761 E2.05686
G3 X139.698 Y153.05 I-6.207 J-14.291 E.21775
G1 X100.95 Y114.302 E1.81772
G1 X100.95 Y114.67 E.01219
G1 X116.67 Y98.95 E.73743
G1 X116.302 Y98.95 E.01219
G1 X155.05 Y137.698 E1.81772
G1 X155.05 Y137.33 E.01218
G1 X139.33 Y153.05 E.73743
G1 X132.022 Y153.05 E.24243
G1 X100.95 Y121.978 E1.45762
G1 X100.95 Y122.346 E.01219
G1 X124.346 Y98.951 E1.09752
G1 X123.978 Y98.951 E.01218
G1 X155.048 Y130.02 E1.45752
G1 X155.048 Y129.656 E.01207
G1 X131.654 Y153.05 E1.09744
G1 X124.346 Y153.05 E.24243
G1 X100.95 Y129.654 E1.09753
G1 X100.95 Y130.022 E.01219
G1 X132.021 Y98.951 E1.4576
G1 X131.655 Y98.951 E.01216
G1 X155.046 Y122.342 E1.09733
G1 X155.046 Y121.982 E.01195
G1 X123.978 Y153.05 E1.45745
G1 X116.67 Y153.05 E.24243
G1 X100.95 Y137.33 E.73743
G1 X100.95 Y137.698 E.01219
G1 X139.697 Y98.951 E1.81768
G1 X139.331 Y98.951 E.01214
G1 X155.044 Y114.664 E.73714
G1 X155.044 Y114.308 E.01183
G1 X116.302 Y153.05 E1.81746
G3 X114.676 Y152.986 I-.041 J-19.728 E.05401
G1 X154.329 Y109.442 F30000
G1 F15476.087
G2 X153.757 Y107.919 I-9.628 J2.751 E.05403
G1 X109.916 Y151.76 E2.05666
G3 X105.358 Y148.642 I6.167 J-13.904 E.18421
G1 X150.634 Y103.366 E2.12396
G2 X146.083 Y100.241 I-10.785 J10.826 E.18413
G1 X102.239 Y144.085 E2.05681
G3 X101.67 Y142.56 I13.947 J-6.071 E.054
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X102.239 Y144.085 E-.61828
G1 X102.503 Y143.821 E-.14172
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
G17
G3 Z1.4 I-1.022 J.66 P1  F30000
G1 X106.627 Y150.209 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X106.357 Y149.997 E.01139
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.064 Y98.603 E.79811
G3 X155.398 Y114.004 I-.076 J15.41 E.80014
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.02 Y150.502 I.01 J-15.412 E.31823
G1 X106.675 Y150.245 E.01428
G1 X106.389 Y150.521 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.01088
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.067 Y98.211 E.73946
G3 X155.79 Y114.001 I-.079 J15.803 E.75993
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.437 Y150.557 E.01355
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.303 E-.15729
G1 X105.456 Y149.753 E-.32493
M73 P38 R13
G1 X104.925 Y149.251 E-.27779
; WIPE_END
G1 E-.04 F1800
G1 X112.052 Y151.981 Z1.6 F30000
G1 X114.676 Y152.986 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X116.302 Y153.05 I1.585 J-19.665 E.05401
G1 X155.044 Y114.308 E1.81746
G1 X155.044 Y114.664 E.01183
G1 X139.331 Y98.951 E.73714
G1 X139.697 Y98.951 E.01213
G1 X100.95 Y137.698 E1.81768
G1 X100.95 Y137.33 E.01219
G1 X116.67 Y153.05 E.73743
G1 X123.978 Y153.05 E.24243
G1 X155.046 Y121.982 E1.45745
G1 X155.046 Y122.342 E.01195
G1 X131.655 Y98.951 E1.09733
G1 X132.021 Y98.951 E.01215
G1 X100.95 Y130.022 E1.4576
G1 X100.95 Y129.654 E.01219
G1 X124.346 Y153.05 E1.09753
G1 X131.654 Y153.05 E.24243
G1 X155.048 Y129.656 E1.09744
G1 X155.048 Y130.02 E.01207
G1 X123.979 Y98.951 E1.45752
G1 X124.345 Y98.951 E.01217
G1 X100.95 Y122.346 E1.09751
G1 X100.95 Y121.978 E.01219
G1 X132.022 Y153.05 E1.45762
G1 X139.33 Y153.05 E.24243
G1 X155.05 Y137.33 E.73743
G1 X155.05 Y137.698 E.01218
G1 X116.302 Y98.95 E1.81772
G1 X116.67 Y98.95 E.01219
G1 X100.95 Y114.67 E.73743
G1 X100.95 Y114.302 E.01219
G1 X139.698 Y153.05 E1.81772
G2 X146.085 Y151.761 I.18 J-15.579 E.21775
G1 X102.239 Y107.915 E2.05689
G3 X105.362 Y103.362 I13.805 J6.122 E.18418
G1 X150.642 Y148.642 E2.12414
G2 X153.76 Y144.084 I-12.475 J-11.883 E.18397
G1 X109.915 Y100.239 E2.05687
G3 X111.437 Y99.663 I6.735 J15.477 E.054
G1 X154.33 Y109.442 F30000
G1 F15476.087
G2 X153.757 Y107.919 I-9.637 J2.754 E.05403
G1 X109.915 Y151.761 E2.05671
G3 X105.358 Y148.642 I6.451 J-14.311 E.18414
G1 X150.634 Y103.366 E2.12396
G2 X146.083 Y100.241 I-10.785 J10.826 E.18413
G1 X102.239 Y144.085 E2.05681
G3 X101.663 Y142.563 I15.476 J-6.734 E.054
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X102.239 Y144.085 E-.6184
G1 X102.503 Y143.821 E-.1416
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
G17
G3 Z1.6 I-1.022 J.66 P1  F30000
G1 X106.631 Y150.213 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X106.357 Y149.997 E.01158
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.076 Y98.603 E.79852
G3 X155.398 Y114.004 I-.089 J15.41 E.79973
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X106.956 Y150.455 I.01 J-15.412 E.32086
G1 X106.679 Y150.249 E.01145
G1 X106.393 Y150.525 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.01104
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
M73 P39 R13
G1 X140.079 Y98.211 E.73984
G3 X155.79 Y114.001 I-.092 J15.802 E.75955
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.727 Y150.773 I.013 J-15.804 E.30466
G1 X106.441 Y150.561 E.01093
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.303 E-.15931
G1 X105.456 Y149.753 E-.32493
G1 X104.929 Y149.254 E-.27576
; WIPE_END
G1 E-.04 F1800
G1 X105.922 Y141.687 Z1.8 F30000
G1 X111.437 Y99.663 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X109.915 Y100.239 I5.213 J16.054 E.054
G1 X153.759 Y144.083 E2.05682
G3 X150.642 Y148.642 I-15.553 J-7.293 E.18399
G1 X105.362 Y103.362 E2.12414
G2 X102.24 Y107.916 I10.67 J10.665 E.18419
G1 X146.085 Y151.761 E2.05687
G3 X139.698 Y153.05 I-6.147 J-13.993 E.21781
G1 X100.95 Y114.302 E1.81772
G1 X100.95 Y114.67 E.01219
G1 X116.67 Y98.95 E.73743
G1 X116.302 Y98.95 E.01219
G1 X155.05 Y137.698 E1.81772
G1 X155.05 Y137.33 E.01218
G1 X139.33 Y153.05 E.73743
G1 X132.022 Y153.05 E.24243
G1 X100.95 Y121.978 E1.45762
G1 X100.95 Y122.346 E.01219
G1 X124.345 Y98.951 E1.09751
G1 X123.979 Y98.951 E.01217
G1 X155.048 Y130.02 E1.45752
G1 X155.048 Y129.656 E.01207
G1 X131.654 Y153.05 E1.09744
G1 X124.346 Y153.05 E.24243
G1 X100.95 Y129.654 E1.09753
G1 X100.95 Y130.022 E.01219
G1 X132.021 Y98.951 E1.45759
G1 X131.655 Y98.951 E.01214
G1 X155.046 Y122.342 E1.09732
G1 X155.046 Y121.982 E.01195
G1 X123.978 Y153.05 E1.45745
G1 X116.67 Y153.05 E.24243
G1 X100.95 Y137.33 E.73743
G1 X100.95 Y137.698 E.01219
G1 X139.697 Y98.951 E1.81767
G1 X139.331 Y98.951 E.01212
G1 X155.044 Y114.664 E.73713
G1 X155.044 Y114.308 E.01183
G1 X116.302 Y153.05 E1.81746
G3 X114.676 Y152.986 I-.041 J-19.728 E.05401
G1 X154.33 Y109.442 F30000
G1 F15476.087
G2 X153.757 Y107.919 I-9.637 J2.754 E.05403
G1 X109.916 Y151.76 E2.05669
G3 X105.358 Y148.642 I6.475 J-14.349 E.18413
G1 X150.634 Y103.366 E2.12396
G2 X146.083 Y100.241 I-10.785 J10.826 E.18413
G1 X102.239 Y144.085 E2.05681
G3 X101.67 Y142.561 I14.33 J-6.218 E.054
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X102.239 Y144.085 E-.61829
G1 X102.503 Y143.821 E-.14171
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
G17
G3 Z1.8 I-1.022 J.661 P1  F30000
G1 X106.635 Y150.216 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X106.357 Y149.997 E.01175
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.089 Y98.603 E.79893
G3 X155.398 Y114.004 I-.101 J15.41 E.79932
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.02 Y150.502 I.01 J-15.412 E.31823
G1 X106.683 Y150.251 E.01392
G1 X106.398 Y150.528 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.01121
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.091 Y98.211 E.74022
G3 X155.79 Y114.001 I-.104 J15.802 E.75917
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.446 Y150.564 E.01322
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.303 E-.16142
G1 X105.456 Y149.753 E-.32493
G1 X104.933 Y149.258 E-.27366
; WIPE_END
G1 E-.04 F1800
G1 X112.061 Y151.986 Z2 F30000
G1 X114.676 Y152.986 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X116.302 Y153.05 I1.585 J-19.665 E.05401
G1 X155.044 Y114.308 E1.81746
G1 X155.044 Y114.664 E.01183
G1 X139.331 Y98.952 E.73712
G1 X139.696 Y98.952 E.01211
G1 X100.95 Y137.698 E1.81766
G1 X100.95 Y137.33 E.01219
G1 X116.67 Y153.05 E.73743
G1 X123.978 Y153.05 E.24243
G1 X155.046 Y121.982 E1.45745
G1 X155.046 Y122.342 E.01195
G1 X131.655 Y98.951 E1.09732
G1 X132.021 Y98.951 E.01214
G1 X100.95 Y130.022 E1.45758
G1 X100.95 Y129.654 E.01219
G1 X124.346 Y153.05 E1.09753
G1 X131.654 Y153.05 E.24243
G1 X155.048 Y129.656 E1.09744
G1 X155.048 Y130.02 E.01207
G1 X123.979 Y98.951 E1.45752
G1 X124.345 Y98.951 E.01216
G1 X100.95 Y122.346 E1.09751
G1 X100.95 Y121.978 E.01219
G1 X132.022 Y153.05 E1.45762
G1 X139.33 Y153.05 E.24243
G1 X155.05 Y137.33 E.73743
G1 X155.05 Y137.698 E.01218
G1 X116.302 Y98.95 E1.81772
G1 X116.67 Y98.95 E.01219
G1 X100.95 Y114.67 E.73743
G1 X100.95 Y114.302 E.01219
G1 X139.698 Y153.05 E1.81772
G2 X146.085 Y151.761 I.18 J-15.579 E.21775
G1 X102.239 Y107.915 E2.05689
G3 X105.362 Y103.362 I13.805 J6.122 E.18418
G1 X150.641 Y148.641 E2.12414
G2 X153.761 Y144.085 I-11.72 J-11.37 E.18406
G1 X109.915 Y100.239 E2.05689
G3 X111.437 Y99.663 I6.734 J15.476 E.054
G1 X101.663 Y142.563 F30000
G1 F15476.087
G2 X102.239 Y144.085 I16.052 J-5.213 E.054
G1 X146.083 Y100.241 E2.05681
G3 X150.634 Y103.366 I-6.236 J13.955 E.18413
G1 X105.358 Y148.642 E2.12396
G2 X109.916 Y151.76 I10.788 J-10.879 E.18419
G1 X153.757 Y107.919 E2.05666
G3 X154.33 Y109.442 I-9.065 J4.277 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X153.757 Y107.919 E-.61827
G1 X153.493 Y108.183 E-.14173
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
G17
G3 Z2 I-.813 J-.906 P1  F30000
G1 X106.64 Y150.219 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X106.357 Y149.997 E.01194
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.101 Y98.604 E.79934
G3 X155.398 Y114.004 I-.113 J15.41 E.79891
G1 X155.398 Y137.996 E.79585
M73 P40 R13
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.02 Y150.502 I.01 J-15.412 E.31823
G1 X106.688 Y150.255 E.01373
G1 X106.402 Y150.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.01138
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.104 Y98.211 E.7406
G3 X155.79 Y114.001 I-.116 J15.802 E.75879
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.451 Y150.567 E.01304
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.303 E-.16356
G1 X105.456 Y149.753 E-.32492
G1 X104.937 Y149.262 E-.27152
; WIPE_END
G1 E-.04 F1800
G1 X101.663 Y142.563 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X102.239 Y144.085 I16.053 J-5.213 E.054
G1 X146.083 Y100.241 E2.05681
G3 X150.634 Y103.366 I-6.236 J13.955 E.18413
G1 X105.358 Y148.642 E2.12396
G2 X109.915 Y151.761 I11.907 J-12.504 E.18396
G1 X153.757 Y107.919 E2.05673
G3 X154.33 Y109.442 I-9.065 J4.277 E.05403
G1 X111.437 Y99.663 F30000
G1 F15476.087
G2 X109.915 Y100.239 I5.213 J16.054 E.054
G1 X153.761 Y144.085 E2.05689
G3 X150.642 Y148.642 I-15.607 J-7.338 E.18397
G1 X105.362 Y103.362 E2.12414
G2 X102.24 Y107.916 I10.667 J10.663 E.18419
G1 X146.085 Y151.761 E2.05687
G3 X139.698 Y153.05 I-6.207 J-14.291 E.21775
G1 X100.95 Y114.302 E1.81772
G1 X100.95 Y114.67 E.01219
G1 X116.67 Y98.95 E.73743
G1 X116.302 Y98.95 E.01219
G1 X155.05 Y137.698 E1.81772
G1 X155.05 Y137.33 E.01218
G1 X139.33 Y153.05 E.73743
G1 X132.022 Y153.05 E.24243
G1 X100.95 Y121.978 E1.45762
G1 X100.95 Y122.346 E.01219
G1 X124.345 Y98.951 E1.09751
G1 X123.979 Y98.951 E.01216
G1 X155.048 Y130.02 E1.45751
G1 X155.048 Y129.656 E.01207
G1 X131.654 Y153.05 E1.09744
G1 X124.346 Y153.05 E.24243
G1 X100.95 Y129.654 E1.09753
G1 X100.95 Y130.022 E.01219
G1 X132.021 Y98.951 E1.45758
G1 X131.655 Y98.951 E.01213
G1 X155.046 Y122.342 E1.09731
G1 X155.046 Y121.982 E.01195
G1 X123.978 Y153.05 E1.45745
G1 X116.67 Y153.05 E.24243
G1 X100.95 Y137.33 E.73743
G1 X100.95 Y137.698 E.01219
G1 X139.696 Y98.952 E1.81765
G1 X139.332 Y98.952 E.0121
G1 X155.044 Y114.664 E.73711
G1 X155.044 Y114.308 E.01183
G1 X116.302 Y153.05 E1.81746
G3 X114.676 Y152.986 I-.041 J-19.728 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.302 Y153.05 E-.61848
G1 X116.566 Y152.786 E-.14152
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
G17
G3 Z2.2 I.305 J-1.178 P1  F30000
G1 X106.643 Y150.216 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X106.354 Y150 E.01196
G3 X100.602 Y137.996 I9.65 J-12.004 E.45661
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.113 Y98.604 E.79975
G3 X155.398 Y114.004 I-.115 J15.399 E.79864
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.401 J.001 E.80255
G1 X116.004 Y153.398 E.79585
G3 X107.36 Y150.744 I-.001 J-15.401 E.30445
G1 X106.691 Y150.251 E.02754
G1 X106.407 Y150.535 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.108 Y150.306 E.01156
G3 X100.21 Y137.999 I9.895 J-12.309 E.43364
G1 X100.21 Y114.001 E.73736
G3 X100.516 Y110.912 I16.942 J.119 E.09553
G3 X116.001 Y98.21 I15.499 J3.105 E.66649
G1 X140.116 Y98.212 E.74098
G3 X143.088 Y98.516 I-.105 J15.684 E.09193
G3 X155.79 Y114.001 I-3.105 J15.499 E.66649
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.794 J-.002 E.76217
G1 X116.001 Y153.79 E.73736
G3 X106.789 Y150.823 I.002 J-15.794 E.30225
G1 X106.455 Y150.571 E.01287
M204 S10000
; WIPE_START
G1 F24000
G1 X106.108 Y150.306 E-.16579
G1 X105.456 Y149.753 E-.32495
G1 X104.941 Y149.266 E-.26925
; WIPE_END
G1 E-.04 F1800
G1 X112.071 Y151.99 Z2.4 F30000
G1 X114.676 Y152.986 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X116.302 Y153.05 I1.585 J-19.665 E.05401
G1 X155.044 Y114.308 E1.81746
G1 X155.044 Y114.664 E.01183
G1 X139.332 Y98.952 E.73711
G1 X139.696 Y98.952 E.01209
G1 X100.95 Y137.698 E1.81765
G1 X100.95 Y137.33 E.01219
G1 X116.67 Y153.05 E.73743
G1 X123.978 Y153.05 E.24243
G1 X155.046 Y121.982 E1.45745
G1 X155.046 Y122.342 E.01195
G1 X131.655 Y98.951 E1.09731
G1 X132.021 Y98.951 E.01212
G1 X100.95 Y130.022 E1.45757
G1 X100.95 Y129.654 E.01219
G1 X124.346 Y153.05 E1.09753
G1 X131.654 Y153.05 E.24243
G1 X155.048 Y129.656 E1.09744
G1 X155.048 Y130.02 E.01207
G1 X123.979 Y98.951 E1.45751
G1 X124.345 Y98.951 E.01216
G1 X100.95 Y122.346 E1.0975
G1 X100.95 Y121.978 E.01219
G1 X132.022 Y153.05 E1.45762
G1 X139.33 Y153.05 E.24243
G1 X155.05 Y137.33 E.73743
G1 X155.05 Y137.698 E.01218
G1 X116.302 Y98.95 E1.81772
G1 X116.67 Y98.95 E.01219
G1 X100.95 Y114.67 E.73743
G1 X100.95 Y114.302 E.01219
G1 X139.698 Y153.05 E1.81772
G2 X146.085 Y151.761 I.18 J-15.579 E.21775
G1 X102.239 Y107.915 E2.05689
G3 X105.362 Y103.362 I13.805 J6.122 E.18418
G1 X150.642 Y148.642 E2.12414
G2 X153.761 Y144.085 I-12.488 J-11.894 E.18397
G1 X109.916 Y100.24 E2.05684
G3 X111.438 Y99.664 I6.285 J14.29 E.054
G1 X154.33 Y109.442 F30000
G1 F15476.087
G2 X153.757 Y107.919 I-9.637 J2.754 E.05403
G1 X109.915 Y151.761 E2.05671
G3 X105.358 Y148.642 I7.338 J-15.607 E.18397
G1 X150.634 Y103.366 E2.12396
G2 X146.083 Y100.241 I-10.785 J10.826 E.18413
G1 X102.239 Y144.085 E2.05681
G3 X101.663 Y142.563 I15.475 J-6.734 E.054
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X102.239 Y144.085 E-.6184
G1 X102.503 Y143.821 E-.1416
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
G17
M73 P41 R13
G3 Z2.4 I-1.022 J.661 P1  F30000
G1 X106.649 Y150.226 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X106.354 Y150 E.01233
G3 X100.602 Y137.996 I9.65 J-12.004 E.4566
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.126 Y98.604 E.80016
G3 X155.398 Y114.004 I-.138 J15.409 E.79808
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.401 J.001 E.80255
G1 X116.004 Y153.398 E.79585
G3 X107.018 Y150.505 I-.001 J-15.401 E.31828
G1 X106.697 Y150.262 E.01334
G1 X106.412 Y150.538 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.108 Y150.306 E.01174
G3 X100.21 Y137.999 I9.895 J-12.309 E.43364
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.129 Y98.212 E.74136
G3 X155.79 Y114.001 I-.141 J15.801 E.75803
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.794 J-.002 E.76217
G1 X116.001 Y153.79 E.73736
G3 X106.789 Y150.823 I.002 J-15.794 E.30225
G1 X106.46 Y150.574 E.01269
M204 S10000
; WIPE_START
G1 F24000
G1 X106.108 Y150.306 E-.16803
G1 X105.456 Y149.753 E-.32495
G1 X104.946 Y149.27 E-.26701
; WIPE_END
G1 E-.04 F1800
G1 X101.663 Y142.563 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X102.239 Y144.085 I16.052 J-5.213 E.054
G1 X146.083 Y100.241 E2.05681
G3 X147.401 Y100.909 I-3.444 J8.426 E.04906
G1 X147.125 Y101.185 E.01293
G3 X150.367 Y103.633 I-6.353 J11.783 E.13528
G1 X105.358 Y148.642 E2.11145
G2 X109.915 Y151.761 I11.894 J-12.488 E.18397
G1 X153.757 Y107.919 E2.05671
G3 X154.33 Y109.442 I-9.065 J4.277 E.05403
G1 X147.714 Y101.108 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X148.103 Y101.336 E.01246
G1 X149.104 Y102.035 E.03384
G1 X150.035 Y102.805 E.03348
G1 X150.911 Y103.656 E.03383
G1 X151.722 Y104.586 E.03419
G1 X152.44 Y105.557 E.03348
G1 X152.866 Y106.243 E.02235
G1 X111.437 Y99.663 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X109.915 Y100.239 I5.212 J16.052 E.054
G1 X153.761 Y144.085 E2.05689
G3 X150.642 Y148.642 I-15.607 J-7.338 E.18397
G1 X105.362 Y103.362 E2.12414
G2 X102.239 Y107.915 I10.682 J10.675 E.18418
G1 X146.085 Y151.761 E2.05689
G3 X139.698 Y153.05 I-6.147 J-13.993 E.21781
G1 X100.95 Y114.302 E1.81772
G1 X100.95 Y114.67 E.01219
G1 X116.67 Y98.95 E.73743
G1 X116.302 Y98.95 E.01219
G1 X155.05 Y137.698 E1.81772
G1 X155.05 Y137.33 E.01218
G1 X139.33 Y153.05 E.73743
G1 X132.022 Y153.05 E.24243
G1 X100.95 Y121.978 E1.45762
G1 X100.95 Y122.346 E.01219
G1 X124.345 Y98.951 E1.0975
G1 X123.979 Y98.951 E.01215
G1 X155.048 Y130.02 E1.45751
G1 X155.048 Y129.656 E.01207
G1 X131.654 Y153.05 E1.09744
G1 X124.346 Y153.05 E.24243
G1 X100.95 Y129.654 E1.09753
G1 X100.95 Y130.022 E.01219
G1 X132.021 Y98.952 E1.45757
G1 X131.655 Y98.951 E.01212
G1 X155.046 Y122.342 E1.0973
G1 X155.046 Y121.982 E.01195
G1 X123.978 Y153.05 E1.45745
G1 X116.67 Y153.05 E.24243
G1 X100.95 Y137.33 E.73743
G1 X100.95 Y137.698 E.01219
G1 X139.696 Y98.952 E1.81764
G1 X139.332 Y98.952 E.01208
G1 X155.044 Y114.664 E.7371
G1 X155.044 Y114.308 E.01183
G1 X116.302 Y153.05 E1.81746
G3 X114.676 Y152.986 I-.041 J-19.728 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.302 Y153.05 E-.61848
G1 X116.566 Y152.786 E-.14152
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
G17
G3 Z2.6 I.304 J-1.178 P1  F30000
G1 X106.654 Y150.23 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X106.357 Y149.997 E.01252
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.401 J-.001 E.80255
G1 X140.138 Y98.604 E.80057
G3 X155.398 Y114.004 I-.15 J15.409 E.79767
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.401 J.001 E.80255
G1 X116.004 Y153.398 E.79585
G3 X107.02 Y150.502 I.01 J-15.412 E.31823
G1 X106.702 Y150.266 E.01314
G1 X106.416 Y150.542 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.01193
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.794 J.002 E.76217
G1 X140.141 Y98.212 E.74174
G3 X155.79 Y114.001 I-.142 J15.791 E.75778
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.794 J-.002 E.76217
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.465 Y150.578 E.0125
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.303 E-.17028
G1 X105.456 Y149.753 E-.32491
G1 X104.95 Y149.274 E-.26482
; WIPE_END
G1 E-.04 F1800
G1 X103.156 Y145.806 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G2 X107.933 Y150.679 I12.81 J-7.78 E.19072
G1 X112.869 Y133.455 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X102.239 Y144.085 E.49869
G3 X101.663 Y142.563 I15.477 J-6.735 E.054
G1 X110.205 Y132.096 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.423093
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X110.842 Y131.458 E.05165
G1 X110.508 Y131.123 E.0271
G1 X106.34 Y135.291 E.33765
G1 X106.005 Y134.957 E.0271
G1 X110.173 Y130.789 E.33765
G1 X109.839 Y130.454 E.0271
G1 X105.671 Y134.622 E.33765
G1 X105.336 Y134.288 E.0271
G1 X109.504 Y130.12 E.33765
G1 X109.17 Y129.785 E.0271
G1 X105.002 Y133.953 E.33765
G1 X104.667 Y133.619 E.0271
G1 X108.835 Y129.451 E.33765
G1 X108.501 Y129.116 E.0271
G1 X104.333 Y133.284 E.33765
G1 X103.998 Y132.95 E.0271
G1 X108.166 Y128.782 E.33765
G1 X107.832 Y128.447 E.0271
G1 X103.664 Y132.615 E.33765
G1 X103.329 Y132.281 E.0271
G1 X107.497 Y128.113 E.33765
G1 X107.163 Y127.778 E.0271
G1 X102.995 Y131.946 E.33765
G1 X102.688 Y131.64 E.02482
G1 X106.526 Y127.802 E.31091
G1 X106.498 Y127.774 E.00228
G1 X106.828 Y127.444 E.02673
M73 P42 R13
G1 X106.494 Y127.109 E.0271
G1 X106.02 Y127.582 E.03833
G1 X105.194 Y125.779 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X100.95 Y130.022 E.19906
G1 X100.95 Y129.654 E.01219
G1 X102.509 Y131.213 E.07312
G1 X105.92 Y127.802 E.16003
G1 X105.521 Y127.403 E.01871
G1 X105.57 Y126.704 E.02324
G1 X105.641 Y126.669 E.00264
G1 X100.95 Y121.978 E.22004
G1 X100.95 Y122.346 E.01219
G1 X104.545 Y118.751 E.16865
G1 X105.546 Y119.752 E.04696
G1 X105.973 Y119.325 E.02002
G1 X108.276 Y121.628 E.10803
G1 X107.124 Y122.779 E.05401
G1 X105.234 Y125.204 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.411844
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X113.3 Y133.271 E.61919
G1 X113.627 Y132.944 E.02507
G1 X105.704 Y125.021 E.6082
G1 X106.03 Y124.694 E.02507
G1 X113.954 Y132.618 E.6082
G1 X114.28 Y132.291 E.02507
G1 X106.357 Y124.368 E.6082
G1 X106.683 Y124.041 E.02507
G1 X114.607 Y131.965 E.6082
G1 X114.933 Y131.638 E.02507
G1 X107.01 Y123.715 E.6082
G1 X107.336 Y123.388 E.02507
G1 X115.26 Y131.312 E.6082
G1 X115.586 Y130.985 E.02507
G1 X107.663 Y123.062 E.6082
G1 X107.99 Y122.735 E.02507
G1 X115.913 Y130.658 E.6082
G1 X116.24 Y130.332 E.02507
G1 X108.316 Y122.408 E.6082
G1 X108.643 Y122.082 E.02507
G1 X116.566 Y130.005 E.6082
G1 X116.893 Y129.679 E.02507
G1 X108.969 Y121.755 E.6082
G1 X109.296 Y121.429 E.02507
G1 X117.219 Y129.352 E.6082
G1 X117.546 Y129.026 E.02507
G1 X109.622 Y121.102 E.6082
G1 X109.949 Y120.776 E.02507
G1 X117.873 Y128.699 E.6082
G1 X118.199 Y128.372 E.02507
G1 X110.276 Y120.449 E.6082
G1 X110.602 Y120.122 E.02507
G1 X118.526 Y128.046 E.6082
G1 X118.852 Y127.719 E.02507
G1 X110.929 Y119.796 E.6082
G1 X111.255 Y119.469 E.02507
G1 X119.322 Y127.536 E.61919
G1 X120.204 Y125.586 F30000
; LINE_WIDTH: 0.409376
G1 F3000
G1 X128.271 Y133.653 E.61179
G1 X128.595 Y133.328 E.02464
G1 X120.672 Y125.405 E.60093
G1 X120.997 Y125.08 E.02464
G1 X128.92 Y133.003 E.60093
G1 X129.245 Y132.678 E.02464
G1 X121.322 Y124.755 E.60093
G1 X121.646 Y124.43 E.02464
G1 X129.57 Y132.354 E.60093
G1 X129.895 Y132.029 E.02464
G1 X121.971 Y124.105 E.60093
G1 X122.296 Y123.78 E.02464
G1 X130.22 Y131.704 E.60093
G1 X130.544 Y131.379 E.02464
G1 X122.621 Y123.456 E.60093
G1 X122.73 Y123.346 E.00829
G1 X118.892 Y119.508 E.29108
G1 X119.108 Y119.293 E.01634
G1 X134.707 Y134.892 E1.18309
G1 X135.032 Y134.567 E.02464
G1 X119.433 Y118.968 E1.18309
G1 X119.757 Y118.643 E.02464
G1 X135.357 Y134.243 E1.18309
G1 X135.682 Y133.918 E.02464
G1 X120.082 Y118.318 E1.18309
G1 X120.407 Y117.993 E.02464
G1 X136.007 Y133.593 E1.18309
G1 X136.331 Y133.268 E.02464
G1 X120.732 Y117.669 E1.18309
G1 X121.057 Y117.344 E.02464
G1 X136.656 Y132.943 E1.18309
G1 X136.981 Y132.618 E.02464
G1 X121.382 Y117.019 E1.18309
G1 X121.438 Y116.963 E.00427
G1 X125.276 Y120.801 E.29108
G1 X125.544 Y120.532 E.02036
G1 X133.468 Y128.456 E.60093
G1 X133.793 Y128.131 E.02464
G1 X125.869 Y120.207 E.60093
G1 X126.194 Y119.883 E.02464
G1 X134.117 Y127.806 E.60093
G1 X134.442 Y127.481 E.02464
G1 X126.519 Y119.558 E.60093
G1 X126.844 Y119.233 E.02464
G1 X134.767 Y127.156 E.60093
G1 X135.092 Y126.832 E.02464
G1 X127.169 Y118.908 E.60093
G1 X127.493 Y118.583 E.02464
G1 X135.417 Y126.507 E.60093
G1 X135.742 Y126.182 E.02464
G1 X127.675 Y118.115 E.61179
G1 X127.262 Y118.12 F30000
; LINE_WIDTH: 0.409375
G1 F3000
G1 X135.329 Y110.053 E.61179
G1 X135.004 Y109.728 E.02464
G1 X127.08 Y117.652 E.60093
G1 X126.756 Y117.327 E.02464
G1 X134.679 Y109.404 E.60093
G1 X134.354 Y109.079 E.02464
G1 X126.431 Y117.002 E.60093
G1 X126.106 Y116.677 E.02464
G1 X134.029 Y108.754 E.60093
G1 X133.705 Y108.429 E.02464
G1 X125.781 Y116.353 E.60093
G1 X125.456 Y116.028 E.02464
G1 X133.38 Y108.104 E.60093
G1 X133.055 Y107.779 E.02464
G1 X125.131 Y115.703 E.60093
G1 X124.807 Y115.378 E.02464
G1 X136.568 Y103.617 E.89201
G1 X136.243 Y103.292 E.02464
G1 X124.482 Y115.053 E.89201
G1 X124.157 Y114.728 E.02464
G1 X135.918 Y102.967 E.89201
G1 X135.594 Y102.642 E.02464
G1 X123.832 Y114.404 E.89201
G1 X123.507 Y114.079 E.02464
G1 X135.269 Y102.317 E.89201
G1 X134.944 Y101.993 E.02464
G1 X123.182 Y113.754 E.89201
G1 X122.858 Y113.429 E.02464
M73 P42 R12
G1 X134.619 Y101.668 E.89201
G1 X134.294 Y101.343 E.02464
G1 X122.533 Y113.104 E.89201
G1 X122.208 Y112.779 E.02464
G1 X130.143 Y104.845 E.60178
G1 X130.109 Y104.833 E.00193
M73 P43 R12
G1 X129.807 Y104.531 E.02291
G1 X121.883 Y112.455 E.60093
G1 X121.558 Y112.13 E.02464
G1 X129.482 Y104.206 E.60093
G1 X129.157 Y103.882 E.02464
G1 X121.233 Y111.805 E.60093
G1 X120.909 Y111.48 E.02464
G1 X128.832 Y103.557 E.60093
G1 X128.507 Y103.232 E.02464
G1 X120.584 Y111.155 E.60093
G1 X120.259 Y110.831 E.02464
G1 X128.182 Y102.907 E.60093
G1 X127.858 Y102.582 E.02464
G1 X119.791 Y110.649 E.61179
G1 X124.887 Y116.064 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X123.735 Y114.913 E.05401
G1 X121.865 Y116.783 E.08775
G1 X121.438 Y116.357 E.02002
G1 X119.897 Y117.897 E.07227
G1 X116.036 Y114.036 E.18116
G1 X112.198 Y117.874 E.18005
G1 X113.459 Y119.134 E.05915
G1 X112.22 Y119.82 E.04695
G1 X111.686 Y119.286 E.02504
G1 X119.897 Y111.075 E.38519
G1 X119.447 Y110.624 E.02113
G1 X118.746 Y111.325 E.03288
G1 X111.624 Y117.834 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.409375
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X119.691 Y109.767 E.61179
G1 X119.366 Y109.443 E.02464
G1 X111.443 Y117.366 E.60093
G1 X111.118 Y117.041 E.02464
G1 X119.041 Y109.118 E.60093
G1 X118.716 Y108.793 E.02464
G1 X110.793 Y116.716 E.60093
G1 X110.468 Y116.392 E.02464
G1 X118.392 Y108.468 E.60093
G1 X118.067 Y108.143 E.02464
G1 X110.143 Y116.067 E.60093
G1 X109.818 Y115.742 E.02464
G1 X117.742 Y107.818 E.60093
G1 X117.417 Y107.494 E.02464
G1 X109.494 Y115.417 E.60093
G1 X109.384 Y115.308 E.00829
G1 X105.546 Y119.146 E.29108
G1 X105.331 Y118.93 E.01634
G1 X117.092 Y107.169 E.89201
G1 X116.99 Y107.066 E.00779
G1 X120.828 Y103.228 E.29108
G1 X120.605 Y103.006 E.01685
G1 X105.006 Y118.605 E1.18309
G1 X104.681 Y118.281 E.02464
G1 X120.281 Y102.681 E1.18309
G1 X119.956 Y102.356 E.02464
G1 X104.356 Y117.956 E1.18309
G1 X104.032 Y117.631 E.02464
G1 X119.631 Y102.032 E1.18309
G1 X119.306 Y101.707 E.02464
G1 X103.707 Y117.306 E1.18309
G1 X103.382 Y116.981 E.02464
G1 X118.981 Y101.382 E1.18309
G1 X118.656 Y101.057 E.02464
G1 X103.057 Y116.656 E1.18309
G1 X103.001 Y116.6 E.00427
G1 X106.839 Y112.762 E.29108
G1 X106.57 Y112.494 E.02036
G1 X114.494 Y104.57 E.60093
G1 X114.169 Y104.245 E.02464
G1 X106.245 Y112.169 E.60093
G1 X105.921 Y111.844 E.02464
G1 X113.844 Y103.921 E.60093
G1 X113.519 Y103.596 E.02464
G1 X105.596 Y111.519 E.60093
G1 X105.271 Y111.194 E.02464
G1 X113.194 Y103.271 E.60093
G1 X112.87 Y102.946 E.02464
G1 X104.946 Y110.87 E.60093
G1 X104.621 Y110.545 E.02464
G1 X112.545 Y102.621 E.60093
G1 X112.22 Y102.296 E.02464
G1 X104.153 Y110.363 E.61179
G1 X106.8 Y107.103 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X107.952 Y105.952 E.05401
G1 X105.362 Y103.362 E.12148
G2 X102.241 Y107.917 I10.637 J10.637 E.1842
G1 X104.114 Y109.79 E.08787
G1 X103.687 Y110.217 E.02002
G1 X104.545 Y111.075 E.04026
G1 X100.95 Y114.67 E.16865
G1 X100.95 Y114.302 E.01219
G1 X102.821 Y116.173 E.08778
G1 X103.973 Y115.022 E.05401
G1 X112.691 Y120.547 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.41279
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X113.806 Y119.432 E.08594
G1 X113.933 Y119.362 E.00795
G1 X114.232 Y119.66 E.02303
G1 X113.162 Y120.731 E.08254
G1 X113.489 Y121.058 E.02523
G1 X114.559 Y119.988 E.08254
G1 X114.886 Y120.315 E.02523
G1 X113.816 Y121.385 E.08254
G1 X114.143 Y121.712 E.02523
G1 X115.214 Y120.642 E.08254
G1 X115.541 Y120.969 E.02523
G1 X114.47 Y122.04 E.08254
G1 X114.798 Y122.367 E.02523
G1 X115.868 Y121.297 E.08254
M73 P44 R12
G1 X116.195 Y121.624 E.02523
G1 X115.125 Y122.694 E.08254
G1 X115.452 Y123.021 E.02523
G1 X116.523 Y121.951 E.08254
G1 X116.85 Y122.278 E.02523
G1 X115.779 Y123.349 E.08254
G1 X116.107 Y123.676 E.02523
G1 X117.177 Y122.606 E.08254
G1 X117.504 Y122.933 E.02523
G1 X116.434 Y124.003 E.08254
G1 X116.761 Y124.33 E.02523
G1 X117.832 Y123.26 E.08254
G1 X118.159 Y123.587 E.02523
G1 X117.088 Y124.658 E.08254
G1 X117.416 Y124.985 E.02523
G1 X118.486 Y123.915 E.08254
G1 X118.785 Y124.213 E.02304
G1 X118.714 Y124.341 E.00794
G1 X117.6 Y125.455 E.08595
G1 X119.864 Y121.086 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.713 Y119.935 E.05401
G1 X116.913 Y121.735 E.08445
G1 X119.316 Y124.138 E.11274
G1 X119.012 Y124.688 E.02083
G1 X119.897 Y125.573 E.04153
G1 X119.738 Y125.733 E.00748
G1 X120.165 Y126.16 E.02002
G1 X119.362 Y126.962 E.03764
G1 X119.789 Y127.389 E.02002
G1 X116.913 Y130.265 E.13493
G1 X139.698 Y153.05 E1.06889
G1 X139.33 Y153.05 E.01219
G1 X155.05 Y137.33 E.73743
G1 X155.05 Y137.698 E.01218
G1 X151.455 Y134.103 E.16864
G1 X149.567 Y135.99 E.08854
G1 X149.141 Y135.563 E.02002
G1 X131.654 Y153.05 E.82032
G1 X132.022 Y153.05 E.01219
G1 X111.224 Y132.252 E.97567
G1 X110.252 Y132.319 E.03231
G1 X109.79 Y132.781 E.0217
G1 X122.851 Y128.846 F30000
G1 F15476.087
G1 X124.002 Y129.998 E.05401
G1 X105.625 Y148.375 E.86212
G2 X108.557 Y150.65 I11.563 J-11.872 E.12337
G1 X108.286 Y150.921 E.01269
G2 X109.917 Y151.759 I6.997 J-11.602 E.06086
G1 X127.84 Y133.836 E.84084
G1 X128.267 Y134.262 E.02002
G1 X128.427 Y134.103 E.00748
G1 X146.085 Y151.761 E.82838
G3 X144.563 Y152.337 I-6.735 J-15.476 E.054
G1 X143.552 Y133.475 F30000
G1 F15476.087
G1 X123.978 Y153.05 E.91827
G1 X124.346 Y153.05 E.01219
G1 X106.934 Y135.637 E.81684
G1 X106.507 Y136.064 E.02002
G1 X104.545 Y134.103 E.09202
G1 X100.95 Y137.698 E.16865
G1 X100.95 Y137.33 E.01219
G1 X116.67 Y153.05 E.73743
G1 X116.302 Y153.05 E.01219
G1 X134.065 Y135.287 E.83328
G1 X132.914 Y134.136 E.05401
G1 X139.714 Y129.637 F30000
G1 F15476.087
G1 X137.217 Y132.135 E.11718
G1 X137.643 Y132.562 E.02002
G1 X136.103 Y134.103 E.07227
G1 X150.642 Y148.642 E.68205
G2 X153.762 Y144.086 I-12.529 J-11.927 E.18396
G1 X136.103 Y126.427 E.82842
G1 X134.951 Y127.578 E.05401
G1 X135.916 Y125.226 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.409376
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X143.983 Y133.293 E.61179
G1 X144.307 Y132.968 E.02464
G1 X136.384 Y125.045 E.60093
G1 X136.709 Y124.72 E.02464
G1 X144.632 Y132.643 E.60093
G1 X144.957 Y132.318 E.02464
G1 X137.034 Y124.395 E.60093
G1 X137.358 Y124.07 E.02464
G1 X145.282 Y131.994 E.60093
G1 X145.607 Y131.669 E.02464
G1 X137.683 Y123.745 E.60093
G1 X138.008 Y123.42 E.02464
G1 X149.77 Y135.182 E.89201
G1 X150.094 Y134.857 E.02464
G1 X138.333 Y123.096 E.89201
G1 X138.658 Y122.771 E.02464
G1 X150.419 Y134.532 E.89201
G1 X150.744 Y134.207 E.02464
G1 X138.983 Y122.446 E.89201
G1 X139.307 Y122.121 E.02464
G1 X151.069 Y133.883 E.89201
G1 X151.394 Y133.558 E.02464
G1 X139.632 Y121.796 E.89201
G1 X139.957 Y121.471 E.02464
G1 X151.718 Y133.233 E.89201
G1 X152.043 Y132.908 E.02464
G1 X140.282 Y121.147 E.89201
G1 X140.607 Y120.822 E.02464
G1 X152.368 Y132.583 E.89201
G1 X152.693 Y132.258 E.02464
G1 X140.931 Y120.497 E.89201
G1 X141.256 Y120.172 E.02464
G1 X153.018 Y131.934 E.89201
G1 X153.343 Y131.609 E.02464
G1 X141.581 Y119.847 E.89201
G1 X141.906 Y119.522 E.02464
G1 X149.829 Y127.446 E.60093
G1 X150.154 Y127.121 E.02464
G1 X142.231 Y119.198 E.60093
G1 X142.556 Y118.873 E.02464
G1 X150.479 Y126.796 E.60093
G1 X150.804 Y126.471 E.02464
G1 X142.88 Y118.548 E.60093
G1 X143.205 Y118.223 E.02464
G1 X151.129 Y126.147 E.60093
G1 X151.454 Y125.822 E.02464
G1 X143.387 Y117.755 E.61179
G1 X143.654 Y117.665 F30000
; LINE_WIDTH: 0.409375
G1 F3000
G1 X150.973 Y110.346 E.55512
G1 X150.648 Y110.021 E.02464
G1 X142.725 Y117.944 E.60093
G1 X142.4 Y117.62 E.02464
G1 X145.333 Y114.687 E.22242
G1 X145.091 Y114.749 E.01338
G3 X144.527 Y114.844 I-1.161 J-5.218 E.03071
G1 X142.075 Y117.295 E.18591
G1 X141.75 Y116.97 E.02464
G1 X143.85 Y114.87 E.15927
G1 X143.816 Y114.87 E.00186
G3 X143.255 Y114.815 I.245 J-5.458 E.0302
G1 X141.426 Y116.645 E.13877
G1 X141.101 Y116.32 E.02464
G1 X142.72 Y114.701 E.12281
G1 X142.53 Y114.646 E.01059
G3 X142.231 Y114.54 I3.496 J-10.325 E.01701
G1 X140.776 Y115.996 E.11039
G1 X140.451 Y115.671 E.02464
G1 X141.824 Y114.298 E.10412
G1 X141.499 Y113.973 E.02464
G1 X140.126 Y115.346 E.10412
G1 X139.801 Y115.021 E.02464
G1 X141.174 Y113.648 E.10412
G1 X140.849 Y113.323 E.02464
G1 X139.477 Y114.696 E.10412
G1 X139.152 Y114.371 E.02464
G1 X140.525 Y112.999 E.10412
G1 X140.2 Y112.674 E.02464
G1 X138.827 Y114.047 E.10412
G1 X138.502 Y113.722 E.02464
G1 X139.875 Y112.349 E.10412
G1 X139.585 Y112.059 E.02201
G1 X139.563 Y112.011 E.0028
G1 X138.177 Y113.397 E.10509
G1 X137.852 Y113.072 E.02464
G1 X139.38 Y111.545 E.11584
G1 X139.341 Y111.43 E.0065
G3 X139.24 Y111.035 I6.691 J-1.936 E.02186
G1 X137.528 Y112.747 E.12985
G1 X137.203 Y112.422 E.02464
G1 X139.151 Y110.474 E.14778
G1 X139.144 Y110.404 E.00378
G3 X139.13 Y109.846 I6.352 J-.439 E.02994
G1 X136.878 Y112.098 E.17077
G1 X136.553 Y111.773 E.02464
G1 X139.211 Y109.101 E.20208
G3 X139.471 Y108.205 I4.619 J.857 E.05013
M73 P45 R12
G1 X136.228 Y111.448 E.24594
G1 X135.903 Y111.123 E.02464
G1 X143.827 Y103.2 E.60093
G1 X143.502 Y102.875 E.02464
G1 X135.435 Y110.941 E.61179
G1 X139.603 Y111.432 F30000
; LINE_WIDTH: 0.411844
G1 F3000
G1 X142.22 Y114.049 E.20083
G1 X142.661 Y114.216 E.02562
G1 X143.167 Y114.343 E.0283
G1 X139.656 Y110.832 E.2695
G1 X139.592 Y110.362 E.02576
G1 X139.578 Y110.101 E.01415
G1 X143.898 Y114.421 E.33155
G1 X144.522 Y114.392 E.03393
G1 X139.609 Y109.479 E.37714
G1 X139.71 Y108.926 E.03048
G1 X145.073 Y114.29 E.4117
G1 X145.434 Y114.184 E.02042
G1 X145.57 Y114.133 E.00786
G1 X139.866 Y108.43 E.43779
G1 X140.032 Y108.045 E.02273
G1 X140.068 Y107.978 E.00412
G1 X146.022 Y113.932 E.45704
G1 X146.434 Y113.691 E.02592
G1 X140.309 Y107.566 E.47019
G1 X140.586 Y107.19 E.02535
G1 X146.81 Y113.414 E.47775
G1 X147.151 Y113.102 E.02509
G1 X140.898 Y106.849 E.47997
G1 X141.244 Y106.542 E.02511
G1 X147.458 Y112.756 E.47697
G1 X147.73 Y112.374 E.02541
G1 X141.625 Y106.27 E.4686
G1 X142.043 Y106.034 E.02603
G1 X147.965 Y111.957 E.45457
G1 X148.16 Y111.498 E.02703
G1 X142.502 Y105.84 E.43434
G1 X143.006 Y105.692 E.02856
G1 X148.309 Y110.994 E.40701
G1 X148.401 Y110.433 E.03086
G1 X143.567 Y105.599 E.37108
G1 X143.828 Y105.58 E.01421
G1 X144.205 Y105.583 E.02046
G1 X148.418 Y109.796 E.32339
G1 X148.397 Y109.52 E.01504
G1 X148.318 Y109.044 E.0262
G1 X144.957 Y105.683 E.25801
G1 X145.462 Y105.826 E.02851
G1 X145.968 Y106.04 E.0298
G1 X148.345 Y108.417 E.18246
G1 X148.367 Y111.652 F30000
; LINE_WIDTH: 0.409375
G1 F3000
G1 X150.324 Y109.696 E.14836
G1 X149.999 Y109.371 E.02464
G1 X148.845 Y110.525 E.08753
G1 X148.846 Y110.511 E.0008
G2 X148.869 Y109.851 I-5.401 J-.52 E.03541
G1 X152.712 Y106.008 E.29145
G1 X152.464 Y105.607 E.0253
G1 X148.815 Y109.256 E.2767
G1 X148.812 Y109.228 E.00147
G2 X148.702 Y108.719 I-6.884 J1.219 E.02793
G1 X152.19 Y105.231 E.26458
G1 X151.914 Y104.857 E.02491
G1 X148.537 Y108.222 E.25566
G2 X148.339 Y107.783 I-6.328 J2.599 E.02583
G1 X151.631 Y104.491 E.24969
G1 X151.328 Y104.144 E.02469
G1 X148.022 Y107.45 E.25072
G1 X147.697 Y107.125 E.02464
G1 X151.025 Y103.797 E.25239
G2 X150.706 Y103.467 I-2.189 J1.795 E.02467
G1 X147.372 Y106.8 E.25282
G1 X147.048 Y106.475 E.02464
G1 X150.377 Y103.146 E.25249
G1 X150.048 Y102.826 E.02464
G1 X146.723 Y106.151 E.25216
G1 X146.398 Y105.826 E.02464
G1 X149.693 Y102.531 E.24989
G1 X149.337 Y102.237 E.02475
G1 X146.011 Y105.563 E.25223
G2 X145.545 Y105.379 I-2.128 J4.727 E.02688
G1 X148.973 Y101.952 E.25997
G1 X148.59 Y101.685 E.02502
G1 X145.036 Y105.239 E.2696
G1 X144.474 Y105.151 E.03049
G1 X148.208 Y101.418 E.28319
G2 X147.806 Y101.17 I-1.721 J2.345 E.02535
G1 X143.845 Y105.13 E.30035
G1 X143.816 Y105.13 E.0016
G2 X143.117 Y105.209 I.209 J5.012 E.03774
G1 X144.477 Y103.849 E.10312
G1 X144.152 Y103.524 E.02464
G1 X141.788 Y105.888 E.17925
G1 X147.295 Y101.015 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X147.401 Y100.909 E.00497
G2 X146.083 Y100.241 I-4.762 J7.758 E.04906
G1 X143.779 Y102.545 E.10811
G1 X143.499 Y102.265 E.01313
G1 X143.072 Y102.692 E.02002
G1 X139.332 Y98.952 E.17545
G1 X139.696 Y98.952 E.01207
G1 X136.103 Y102.545 E.16856
G1 X137.39 Y103.832 E.06037
G1 X136.963 Y104.259 E.02002
G1 X139.234 Y106.53 E.10655
G1 X138.083 Y107.682 E.05401
G1 X132.66 Y102.259 F30000
G1 F15476.087
G1 X133.811 Y101.107 E.05401
G1 X131.655 Y98.952 E.10113
G1 X132.02 Y98.952 E.01211
G1 X128.427 Y102.545 E.16859
G1 X127.854 Y101.973 E.02685
G1 X127.428 Y102.4 E.02002
G1 X123.979 Y98.951 E.16178
G1 X124.345 Y98.951 E.01215
G1 X120.751 Y102.545 E.16862
G1 X121.434 Y103.228 E.03203
G1 X121.007 Y103.655 E.02002
G1 X123.59 Y106.238 E.12116
G1 X122.438 Y107.389 E.05401
G1 X131.673 Y114.321 F30000
G1 F15476.087
G1 X139.087 Y121.735 E.3478
G1 X142.498 Y118.324 E.16003
G1 X139.087 Y114.913 E.16003
G1 X132.086 Y121.914 E.32843
G1 X128.248 Y118.076 E.18005
G1 X135.249 Y111.075 E.32843
G1 X136.401 Y112.226 E.05401
G1 X152.414 Y129.988 F30000
G1 F15476.087
G1 X153.565 Y131.139 E.05401
G1 X155.048 Y129.656 E.06956
G1 X155.048 Y130.02 E.01207
G1 X151.455 Y126.427 E.16856
G1 X152.063 Y125.819 E.02853
G1 X151.636 Y125.392 E.02002
G1 X155.046 Y121.982 E.15996
G1 X155.046 Y122.342 E.01195
G1 X147.318 Y114.614 E.36255
G1 X144.088 Y117.844 E.15151
G1 X147.798 Y121.554 E.17405
G1 X155.044 Y114.308 E.33992
G1 X155.044 Y114.664 E.01183
G1 X151.156 Y110.776 E.18241
G1 X151.583 Y110.349 E.02002
G1 X151.455 Y110.221 E.006
G1 X153.757 Y107.919 E.10801
G2 X153.104 Y106.6 I-8.424 J3.35 E.04887
G1 X152.994 Y106.711 E.00518
G1 X111.438 Y99.664 F30000
G1 F15476.087
G2 X109.916 Y100.24 I3.485 J11.511 E.05403
G1 X111.79 Y102.114 E.08789
G1 X112.217 Y101.687 E.02002
G1 X113.075 Y102.545 E.04026
G1 X116.67 Y98.95 E.16865
G1 X116.302 Y98.95 E.01219
G1 X118.173 Y100.821 E.08778
G1 X117.022 Y101.973 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.173 Y100.821 E-.61876
G1 X117.911 Y100.559 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
G17
G3 Z2.8 I-1.187 J-.269 P1  F30000
G1 X106.659 Y150.234 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X106.357 Y149.997 E.01272
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.151 Y98.604 E.80098
G3 X155.398 Y114.004 I-.152 J15.398 E.79741
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.02 Y150.502 I.01 J-15.412 E.31823
G1 X106.707 Y150.269 E.01294
G1 X106.421 Y150.546 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.01211
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.153 Y98.212 E.74212
G3 X155.79 Y114.001 I-.155 J15.791 E.7574
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.47 Y150.581 E.01231
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.303 E-.17259
G1 X105.456 Y149.753 E-.32492
G1 X104.954 Y149.278 E-.2625
; WIPE_END
G1 E-.04 F1800
G1 X112.272 Y149.186 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.409376
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X120.339 Y141.119 E.61179
G1 X120.014 Y140.795 E.02464
G1 X112.091 Y148.718 E.60093
G1 X111.766 Y148.393 E.02464
G1 X119.689 Y140.47 E.60093
G1 X119.365 Y140.145 E.02464
G1 X111.441 Y148.068 E.60093
G1 X111.116 Y147.744 E.02464
G1 X119.04 Y139.82 E.60093
G1 X118.715 Y139.495 E.02464
G1 X107.695 Y150.516 E.8358
G3 X107.309 Y150.252 I1.826 J-3.087 E.02509
G1 X118.39 Y139.17 E.84044
G1 X118.065 Y138.846 E.02464
G1 X106.936 Y149.975 E.84404
G3 X106.565 Y149.696 I1.982 J-3.03 E.0249
G1 X117.74 Y138.521 E.84757
G1 X117.416 Y138.196 E.02464
G1 X106.214 Y149.398 E.84957
G3 X105.868 Y149.094 I2.627 J-3.345 E.0247
G1 X117.091 Y137.871 E.85119
G1 X116.766 Y137.546 E.02464
G1 X105.534 Y148.778 E.85186
G3 X105.209 Y148.453 I2.836 J-3.154 E.02465
G1 X116.441 Y137.221 E.85183
G1 X116.116 Y136.897 E.02464
G1 X104.893 Y148.119 E.85116
G3 X104.591 Y147.773 I3.047 J-2.966 E.0247
G1 X115.791 Y136.572 E.84949
G1 X115.467 Y136.247 E.02464
G1 X104.292 Y147.421 E.84749
G3 X104.011 Y147.053 I3.25 J-2.767 E.02487
G1 X115.142 Y135.922 E.84415
G1 X114.817 Y135.597 E.02464
G1 X103.735 Y146.679 E.84049
G1 X103.472 Y146.292 E.02508
G1 X114.492 Y135.272 E.83576
G1 X114.167 Y134.948 E.02464
G1 X103.219 Y145.896 E.83035
G1 X103.196 Y145.859 E.00233
G1 X106.214 Y142.841 E.22886
G1 X105.919 Y142.546 E.02237
G1 X113.842 Y134.623 E.60093
G1 X113.518 Y134.298 E.02464
G1 X105.594 Y142.221 E.60093
G1 X105.269 Y141.897 E.02464
G1 X113.193 Y133.973 E.60093
G1 X112.868 Y133.648 E.02464
G1 X104.801 Y141.715 E.61179
G1 X102.986 Y145.464 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X102.953 Y145.496 E.00152
G3 X102.239 Y144.085 I15.461 J-8.708 E.05248
G1 X104.545 Y141.779 E.10819
G1 X104.335 Y141.569 E.00986
G1 X104.762 Y141.142 E.02002
G1 X100.95 Y137.33 E.17881
G1 X100.95 Y137.698 E.01219
G1 X108.449 Y130.199 E.35177
G2 X110.149 Y131.177 I3.567 J-4.234 E.06542
G1 X112.438 Y133.466 E.10736
G1 X112.865 Y133.039 E.02002
G1 X113.075 Y133.249 E.00986
M73 P46 R12
G1 X123.39 Y122.9 E.4847
G3 X123.932 Y122.219 I5.42 J3.758 E.02889
G1 X116.55 Y123.321 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421603
G1 F15000
G2 X115.489 Y122.262 I-78.188 J77.244 E.04625
G1 X115.061 Y121.904 E.0172
G1 X114.597 Y121.595 E.0172
G1 X113.988 Y121.294 E.02099
G1 X116.703 Y124.009 E.1185
G1 X116.841 Y124.354 E.01146
G1 X116.97 Y124.812 E.01467
G1 X113.191 Y121.033 E.16489
G1 X113.04 Y120.993 E.00483
G1 X112.54 Y120.918 E.0156
G1 X117.085 Y125.462 E.19833
G1 X117.106 Y126.019 E.01719
G1 X111.981 Y120.894 E.22367
G1 X111.652 Y120.898 E.01015
G1 X111.472 Y120.92 E.00559
G1 X117.079 Y126.527 E.24469
G1 X117.01 Y126.994 E.01455
G1 X111.002 Y120.986 E.26216
G1 X110.577 Y121.096 E.01356
G1 X116.908 Y127.427 E.27629
G1 X116.772 Y127.827 E.01303
G1 X110.174 Y121.229 E.28793
G1 X109.796 Y121.387 E.01263
G1 X116.608 Y128.199 E.29728
G1 X116.428 Y128.554 E.01229
G1 X109.449 Y121.576 E.30453
G1 X109.121 Y121.783 E.01199
G1 X116.217 Y128.879 E.30969
G1 X115.992 Y129.189 E.01183
G1 X108.808 Y122.006 E.31348
G1 X108.524 Y122.257 E.01171
G1 X115.744 Y129.477 E.31509
G1 X115.49 Y129.737 E.01122
G1 X115.479 Y129.747 E.00047
G1 X108.254 Y122.523 E.31527
G1 X108.01 Y122.814 E.01173
G1 X115.187 Y129.991 E.31321
G1 X114.878 Y130.218 E.01182
G1 X107.781 Y123.121 E.30971
G1 X107.571 Y123.446 E.01195
G1 X114.553 Y130.428 E.30469
G1 X114.2 Y130.611 E.01226
G1 X107.389 Y123.8 E.29724
G1 X107.227 Y124.173 E.01256
G1 X113.823 Y130.769 E.28787
G1 X113.423 Y130.905 E.01303
G1 X107.095 Y124.577 E.27615
G1 X106.991 Y125.008 E.01369
G1 X112.996 Y131.013 E.26205
G1 X112.531 Y131.084 E.01452
G1 X106.92 Y125.473 E.24486
G1 X106.888 Y125.977 E.01558
G1 X112.018 Y131.107 E.22387
G1 X111.652 Y131.102 E.01132
G1 X111.453 Y131.077 E.00616
G1 X106.921 Y126.545 E.1978
G1 X106.979 Y126.971 E.01326
G1 X107.036 Y127.195 E.00714
G1 X110.805 Y130.964 E.16448
G1 X110.553 Y130.905 E.00799
G1 X110.019 Y130.714 E.01748
G1 X107.291 Y127.986 E.11907
G1 X107.56 Y128.536 E.01892
G1 X107.706 Y128.776 E.00865
G1 X108.034 Y129.228 E.01722
G2 X109.311 Y130.542 I14.371 J-12.692 E.05657
G1 X120.439 Y142.001 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.409376
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X128.506 Y133.934 E.61179
G1 X128.831 Y134.259 E.02464
G1 X120.907 Y142.182 E.60093
G1 X121.232 Y142.507 E.02464
G1 X129.155 Y134.584 E.60093
G1 X129.48 Y134.909 E.02464
G1 X121.557 Y142.832 E.60093
G1 X121.882 Y143.157 E.02464
G1 X129.805 Y135.233 E.60093
G1 X130.13 Y135.558 E.02464
G1 X122.206 Y143.482 E.60093
G1 X122.488 Y143.764 E.02137
G1 X118.65 Y147.602 E.29108
G1 X118.693 Y147.645 E.00327
G1 X130.455 Y135.883 E.89201
G1 X130.779 Y136.208 E.02464
G1 X119.018 Y147.969 E.89201
G1 X119.343 Y148.294 E.02464
G1 X131.104 Y136.533 E.89201
G1 X131.429 Y136.858 E.02464
G1 X119.668 Y148.619 E.89201
G1 X119.993 Y148.944 E.02464
G1 X131.754 Y137.182 E.89201
G1 X132.079 Y137.507 E.02464
G1 X120.317 Y149.269 E.89201
G1 X120.642 Y149.594 E.02464
G1 X132.404 Y137.832 E.89201
G1 X132.728 Y138.157 E.02464
G1 X120.967 Y149.918 E.89201
G1 X121.292 Y150.243 E.02464
G1 X133.053 Y138.482 E.89201
G1 X133.378 Y138.807 E.02464
G1 X121.617 Y150.568 E.89201
G1 X121.941 Y150.893 E.02464
G1 X133.703 Y139.131 E.89201
G1 X134.028 Y139.456 E.02464
G1 X122.266 Y151.218 E.89201
G1 X122.469 Y151.42 E.01534
G1 X126.307 Y147.582 E.29108
G1 X126.429 Y147.705 E.0093
G1 X134.353 Y139.781 E.60093
G1 X134.677 Y140.106 E.02464
G1 X126.754 Y148.029 E.60093
G1 X127.079 Y148.354 E.02464
G1 X135.002 Y140.431 E.60093
G1 X135.327 Y140.756 E.02464
G1 X127.404 Y148.679 E.60093
G1 X127.728 Y149.004 E.02464
G1 X135.652 Y141.08 E.60093
G1 X135.977 Y141.405 E.02464
G1 X127.91 Y149.472 E.61179
G1 X133.473 Y144.522 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X132.321 Y145.673 E.05401
G1 X134.747 Y148.099 E.11378
G1 X134.32 Y148.525 E.02002
G1 X135.249 Y149.455 E.04359
G1 X131.654 Y153.05 E.16865
G1 X132.022 Y153.05 E.01219
G1 X128.483 Y149.511 E.16599
G1 X128.057 Y149.938 E.02002
G1 X127.573 Y149.455 E.02268
G1 X123.978 Y153.05 E.16865
G1 X124.346 Y153.05 E.01219
G1 X122.895 Y151.599 E.06805
G1 X124.047 Y150.448 E.05401
G1 X117.835 Y144.236 F30000
G1 F15476.087
G1 X116.684 Y145.387 E.05401
G1 X118.471 Y147.175 E.08384
G1 X118.044 Y147.602 E.02002
G1 X119.897 Y149.455 E.08694
G1 X116.302 Y153.05 E.16865
G1 X116.67 Y153.05 E.01219
G1 X112.846 Y149.225 E.1794
G1 X112.419 Y149.652 E.02002
G1 X112.221 Y149.455 E.00927
G1 X109.915 Y151.761 E.10819
G3 X108.467 Y151.019 I4.749 J-11.051 E.05403
G1 X124.238 Y137.59 F30000
G1 F15476.087
G1 X116.198 Y129.55 E.37714
G2 X116.198 Y122.45 I-4.199 J-3.55 E.25605
G1 X124.41 Y114.238 E.38521
G2 X131.591 Y114.239 I3.591 J-4.271 E.25879
G1 X139.73 Y122.378 E.38181
G1 X132.597 Y123.301 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425079
M73 P47 R12
G1 F15000
G1 X131.526 Y122.23 E.04715
G1 X131.125 Y121.89 E.01639
G1 X130.662 Y121.576 E.01742
G1 X130.418 Y121.438 E.00874
G1 X130 Y121.244 E.01435
G1 X132.752 Y123.996 E.12121
G1 X132.893 Y124.351 E.0119
G1 X133.015 Y124.8 E.01449
G1 X129.2 Y120.985 E.16804
G1 X128.836 Y120.905 E.0116
G1 X128.548 Y120.873 E.00902
G1 X133.127 Y125.452 E.20166
G1 X133.156 Y125.721 E.00842
G1 X133.156 Y126.022 E.00937
G1 X127.978 Y120.844 E.22803
G1 X127.72 Y120.844 E.00804
G1 X127.465 Y120.872 E.00797
G1 X133.128 Y126.535 E.24939
G1 X133.058 Y127.005 E.01481
G1 X126.995 Y120.942 E.26703
G1 X126.558 Y121.045 E.01399
G1 X132.955 Y127.442 E.28173
G1 X132.819 Y127.846 E.01328
G1 X126.154 Y121.181 E.29353
G1 X125.774 Y121.342 E.01284
G1 X132.653 Y128.221 E.30296
G1 X132.471 Y128.579 E.01251
G1 X125.424 Y121.533 E.31035
G1 X125.088 Y121.737 E.01225
G1 X132.258 Y128.907 E.31578
G1 X132.03 Y129.22 E.01204
G1 X124.781 Y121.97 E.31926
G1 X124.492 Y122.221 E.01193
G1 X131.782 Y129.512 E.32108
G1 X131.508 Y129.779 E.0119
G1 X124.218 Y122.488 E.32107
G1 X123.97 Y122.78 E.01194
G1 X131.219 Y130.03 E.31926
G1 X130.912 Y130.263 E.01201
G1 X123.737 Y123.088 E.31599
G1 X123.532 Y123.424 E.01225
G1 X130.578 Y130.469 E.31027
G1 X130.224 Y130.657 E.01245
G1 X123.347 Y123.779 E.3029
G1 X123.181 Y124.154 E.01277
G1 X129.846 Y130.819 E.29353
G1 X129.442 Y130.955 E.01328
G1 X123.045 Y124.558 E.28172
G1 X122.942 Y124.995 E.01399
G1 X129.005 Y131.058 E.26702
G1 X128.534 Y131.128 E.01481
G1 X122.872 Y125.466 E.24939
G1 X122.844 Y125.721 E.008
G1 X122.844 Y125.978 E.00801
G1 X128.022 Y131.156 E.22803
G1 X127.721 Y131.156 E.00936
G1 X127.452 Y131.127 E.00843
G1 X122.873 Y126.548 E.20164
G1 X122.906 Y126.843 E.00923
G1 X122.985 Y127.2 E.01138
G1 X126.8 Y131.015 E.16803
G1 X126.618 Y130.975 E.0058
G1 X126.005 Y130.761 E.02022
G1 X123.239 Y127.995 E.12181
G1 X123.575 Y128.662 E.02325
G1 X123.89 Y129.125 E.01744
G1 X124.231 Y129.527 E.01642
G1 X125.301 Y130.597 E.0471
G1 X128.076 Y133.752 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X124.979 Y130.655 E.14528
G3 X124.219 Y130.068 I2.38 J-3.867 E.03189
G1 X131.777 Y130.065 F30000
G1 F15476.087
G3 X131.006 Y130.67 I-4.419 J-4.832 E.03254
G1 X120.751 Y140.925 E.48109
G1 X116.913 Y137.087 E.18005
G1 X124.073 Y129.927 E.33589
G3 X123.345 Y129.021 I4.61 J-4.448 E.03859
G1 X108.783 Y114.459 E.68314
G1 X100.95 Y122.346 E.36872
G1 X100.95 Y121.978 E.01219
G1 X106.822 Y127.85 E.27546
G3 X106.815 Y124.157 I5.088 J-1.856 E.12501
G1 X100.95 Y130.022 E.27513
G1 X100.95 Y129.654 E.01219
G1 X108.6 Y137.304 E.35886
G1 X107.449 Y138.455 E.05401
G1 X109.311 Y114.542 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421537
G1 F15000
G3 X108.032 Y113.226 I13.079 J-13.991 E.05663
G1 X107.706 Y112.776 E.01715
G1 X107.56 Y112.537 E.00865
G1 X107.291 Y111.986 E.01892
G1 X110.019 Y114.714 E.11904
G1 X110.553 Y114.905 E.01749
G1 X110.804 Y114.964 E.00798
G1 X107.029 Y111.188 E.16474
G1 X106.934 Y110.697 E.01545
G1 X106.922 Y110.546 E.00467
G1 X111.453 Y115.077 E.19771
G1 X111.652 Y115.102 E.00617
G1 X112.018 Y115.107 E.0113
G1 X106.893 Y109.981 E.22363
G1 X106.919 Y109.472 E.01574
G1 X112.526 Y115.079 E.24465
G1 X112.765 Y115.056 E.00741
G1 X112.991 Y115.009 E.00713
G1 X106.986 Y109.004 E.26203
G1 X107.093 Y108.576 E.01362
G1 X113.426 Y114.909 E.27633
G1 X113.823 Y114.77 E.01296
G1 X107.225 Y108.172 E.28785
G1 X107.39 Y107.802 E.01251
G1 X114.2 Y114.611 E.2971
G1 X114.552 Y114.428 E.01226
G1 X107.571 Y107.447 E.30462
G1 X107.781 Y107.121 E.01195
G1 X114.878 Y114.218 E.30965
M73 P47 R11
G1 X115.186 Y113.992 E.01182
G1 X108.009 Y106.814 E.31315
G1 X108.254 Y106.523 E.01173
G1 X115.478 Y113.748 E.31521
G1 X115.742 Y113.476 E.01168
G1 X108.523 Y106.258 E.31495
G1 X108.808 Y106.007 E.01171
G1 X115.993 Y113.192 E.31348
G1 X116.216 Y112.88 E.01184
G1 X109.12 Y105.783 E.30965
G1 X109.283 Y105.668 E.00617
G1 X109.448 Y105.576 E.00583
G1 X116.425 Y112.553 E.3044
G1 X116.612 Y112.204 E.0122
G1 X109.795 Y105.388 E.29742
G1 X110.173 Y105.23 E.01263
G1 X116.769 Y111.826 E.28782
G1 X116.903 Y111.425 E.01305
G1 X110.575 Y105.097 E.27611
G1 X111.005 Y104.991 E.01365
G1 X117.011 Y110.997 E.26204
G1 X117.084 Y110.535 E.01443
G1 X111.466 Y104.916 E.24514
G1 X111.978 Y104.894 E.01583
G1 X117.106 Y110.021 E.22373
G1 X117.085 Y109.465 E.01718
G1 X112.543 Y104.923 E.19818
G1 X112.766 Y104.944 E.00692
G1 X113.187 Y105.032 E.01327
G1 X116.971 Y108.815 E.16508
G1 X116.841 Y108.354 E.01477
G1 X116.705 Y108.014 E.01132
G1 X113.977 Y105.286 E.119
G1 X114.597 Y105.595 E.02135
G1 X115.062 Y105.905 E.01726
G1 X115.484 Y106.257 E.01695
G1 X116.542 Y107.316 E.04619
G1 X116.348 Y106.635 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X115.204 Y105.528 I-4.004 J2.994 E.05302
G1 X109.915 Y100.239 E.2481
G3 X111.437 Y99.663 I6.734 J15.475 E.054
G1 X108.617 Y114.342 F30000
G1 F15476.087
G1 X108.593 Y114.325 E.00098
G3 X107.542 Y113.218 I3.746 J-4.609 E.05079
G1 X102.239 Y107.915 E.24875
G3 X105.358 Y103.358 I15.608 J7.338 E.18397
G1 X108.112 Y106.112 E.12919
G3 X111.032 Y104.588 I3.888 J3.889 E.11098
G1 X116.67 Y98.95 E.26446
G1 X116.302 Y98.95 E.01219
G1 X123.766 Y106.414 E.35015
G2 X122.742 Y108.23 I4.234 J3.586 E.06959
G1 X110.162 Y120.81 E.59014
G2 X108.446 Y121.798 I2.087 J5.612 E.06598
G1 X100.95 Y114.302 E.35163
G1 X100.95 Y114.67 E.01219
G1 X106.582 Y109.038 E.26422
G1 X106.593 Y108.965 E.00245
G3 X107.102 Y107.502 I5.251 J1.009 E.05156
G1 X125.3 Y114.597 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425082
G1 F15000
G1 X124.232 Y113.528 E.04706
G1 X123.89 Y113.125 E.01646
G1 X123.575 Y112.662 E.01744
G1 X123.314 Y112.169 E.01738
G1 X123.248 Y112.004 E.00551
G1 X125.996 Y114.752 E.121
G1 X126.351 Y114.893 E.01191
G1 X126.8 Y115.015 E.01449
G1 X122.98 Y111.196 E.16822
G1 X122.905 Y110.838 E.0114
G1 X122.873 Y110.548 E.00907
G1 X127.452 Y115.127 E.20165
G1 X127.721 Y115.156 E.00843
G1 X128.022 Y115.156 E.00936
G1 X122.844 Y109.978 E.22802
G1 X122.844 Y109.72 E.00805
G1 X122.872 Y109.466 E.00796
G1 X128.534 Y115.128 E.24939
G1 X129.005 Y115.058 E.01481
G1 X122.942 Y108.995 E.26702
G1 X123.045 Y108.558 E.01399
G1 X129.442 Y114.955 E.28172
G1 X129.846 Y114.819 E.01328
G1 X123.181 Y108.154 E.29353
G1 X123.343 Y107.776 E.01282
G1 X130.226 Y114.658 E.3031
G1 X130.576 Y114.468 E.01241
G1 X123.531 Y107.422 E.31027
G1 X123.742 Y107.093 E.01218
G1 X130.912 Y114.263 E.31578
G1 X131.219 Y114.03 E.01201
G1 X123.97 Y106.78 E.31926
G1 X124.218 Y106.488 E.01194
G1 X131.508 Y113.779 E.32108
G1 X131.782 Y113.512 E.0119
G1 X124.491 Y106.221 E.32108
G1 X124.778 Y105.967 E.01192
G1 X132.03 Y113.22 E.3194
G1 X132.258 Y112.907 E.01205
G1 X125.093 Y105.742 E.31557
G1 X125.422 Y105.531 E.01218
G1 X132.469 Y112.578 E.31035
G1 X132.656 Y112.225 E.01245
G1 X125.775 Y105.343 E.30305
G1 X126.157 Y105.184 E.01287
G1 X132.819 Y111.846 E.2934
G1 X132.955 Y111.442 E.01328
G1 X126.561 Y105.048 E.28158
G1 X126.993 Y104.94 E.01388
G1 X133.058 Y111.005 E.2671
G1 X133.128 Y110.535 E.01481
G1 X127.459 Y104.865 E.24968
G1 X127.978 Y104.844 E.01617
G1 X133.156 Y110.022 E.22805
G1 X133.135 Y109.46 E.01751
G1 X128.548 Y104.873 E.20201
G1 X128.836 Y104.905 E.00902
G1 X129.2 Y104.985 E.0116
G1 X133.019 Y108.804 E.1682
G1 X132.894 Y108.354 E.01454
G1 X132.752 Y107.996 E.01199
G1 X130 Y105.244 E.12121
G1 X130.419 Y105.438 E.0144
G1 X130.897 Y105.726 E.01738
G1 X131.342 Y106.064 E.0174
G1 X132.597 Y107.301 E.05487
G1 X139.873 Y106.212 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X141.133 Y105.191 I3.755 J3.345 E.05403
G1 X146.083 Y100.241 E.23222
G3 X150.634 Y103.366 I-6.234 J13.952 E.18413
G1 X147.961 Y106.039 E.12539
G2 X144.843 Y104.463 I-3.919 J3.879 E.11792
G1 X139.332 Y98.952 E.25852
G1 X139.696 Y98.952 E.01206
G1 X132.234 Y106.414 E.35005
G3 X133.27 Y108.242 I-4.439 J3.725 E.07009
G1 X145.688 Y120.66 E.58253
G3 X147.621 Y121.731 I-1.588 J5.149 E.07385
G1 X155.044 Y114.308 E.34822
G1 X155.044 Y114.664 E.01183
G1 X149.535 Y109.115 E.2594
G2 X149.068 Y107.608 I-6.364 J1.149 E.05246
G1 X148.624 Y107.259 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.428747
G1 F15000
G1 X147.567 Y106.201 E.04703
G1 X147.188 Y105.875 E.01572
G1 X146.727 Y105.556 E.01763
G1 X146.236 Y105.29 E.01755
G1 X146.01 Y105.19 E.00775
G1 X148.8 Y107.98 E.12405
G1 X148.945 Y108.35 E.01247
G1 X149.068 Y108.793 E.01447
G1 X145.211 Y104.937 E.17149
G1 X144.905 Y104.866 E.00987
G1 X144.551 Y104.823 E.0112
G1 X149.177 Y109.448 E.20567
G1 X149.206 Y109.721 E.00862
G1 X149.205 Y110.022 E.00948
G1 X143.976 Y104.793 E.23251
G1 X143.79 Y104.791 E.00586
G1 X143.459 Y104.822 E.01044
G1 X149.178 Y110.541 E.25429
G1 X149.146 Y110.836 E.00932
G1 X149.107 Y111.015 E.00578
G1 X142.985 Y104.894 E.27219
G1 X142.545 Y104.999 E.01422
G1 X149.004 Y111.458 E.28717
G1 X148.862 Y111.862 E.01346
G1 X142.133 Y105.133 E.29918
G1 X141.755 Y105.3 E.01301
G1 X148.701 Y112.246 E.30882
G1 X148.512 Y112.603 E.01269
G1 X141.399 Y105.49 E.31625
G1 X141.06 Y105.697 E.01248
G1 X148.3 Y112.936 E.32189
G1 X148.068 Y113.251 E.01227
G1 X140.75 Y105.932 E.3254
G1 X140.506 Y106.132 E.00992
G1 X140.455 Y106.183 E.00226
G1 X147.819 Y113.547 E.32746
G1 X147.543 Y113.816 E.01213
G1 X140.183 Y106.457 E.32722
G1 X139.932 Y106.751 E.01217
G1 X147.249 Y114.068 E.32535
G1 X146.94 Y114.304 E.01224
G1 X139.698 Y107.063 E.32199
G1 X139.486 Y107.397 E.01243
G1 X146.601 Y114.512 E.31635
G1 X146.248 Y114.704 E.01265
G1 X139.301 Y107.757 E.30886
G1 X139.137 Y108.139 E.01306
G1 X145.862 Y114.864 E.29903
G1 X145.458 Y115.005 E.01347
G1 X138.996 Y108.543 E.28733
G1 X138.893 Y108.986 E.01431
G1 X145.016 Y115.109 E.27222
G1 X144.54 Y115.179 E.01512
G1 X138.821 Y109.459 E.2543
G1 X138.791 Y109.976 E.01626
G1 X144.022 Y115.206 E.23257
G1 X143.79 Y115.209 E.00731
G1 X143.447 Y115.177 E.01081
G1 X138.821 Y110.551 E.20569
G1 X138.878 Y110.973 E.0134
G1 X138.928 Y111.204 E.00742
G1 X142.791 Y115.067 E.17175
G1 X142.415 Y114.967 E.01222
G1 X141.981 Y114.802 E.01461
G1 X139.204 Y112.025 E.12348
G1 X139.32 Y112.299 E.00935
G1 X139.593 Y112.786 E.01756
G1 X139.917 Y113.242 E.01759
G1 X140.241 Y113.608 E.01535
G1 X141.272 Y114.638 E.04582
G1 X139.073 Y112.659 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X140.037 Y113.963 I4.677 J-2.45 E.05402
G1 X131.927 Y122.073 E.38046
G3 X132.655 Y122.979 I-4.61 J4.448 E.03859
G1 X143.715 Y134.039 E.51887
G1 X139.877 Y137.877 E.18005
G1 X131.925 Y129.925 E.37307
G2 X132.655 Y129.021 I-4.203 J-4.145 E.03861
G1 X146.867 Y114.809 E.66672
G2 X147.26 Y114.556 I-1.069 J-2.091 E.01551
G1 X155.046 Y122.342 E.36527
G1 X155.046 Y121.982 E.01195
G1 X149.342 Y127.685 E.26756
G2 X149.342 Y124.315 I-5.265 J-1.685 E.11363
G1 X155.048 Y130.02 E.26765
G1 X155.048 Y129.656 E.01207
G1 X151.455 Y133.249 E.16856
G1 X151.162 Y132.956 E.01374
G1 X150.735 Y133.383 E.02002
G1 X147.621 Y130.269 E.14607
G3 X145.688 Y131.34 I-3.521 J-4.077 E.07385
G1 X136.103 Y140.925 E.44964
G1 X132.265 Y137.087 E.18005
G1 X139.729 Y129.623 E.35015
G1 X141.275 Y130.634 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.428549
G1 F15000
G1 X140.096 Y129.455 E.0524
G1 X139.75 Y129.019 E.01748
G1 X139.45 Y128.545 E.01762
G1 X139.187 Y128.001 E.01902
G1 X141.989 Y130.803 E.12456
G1 X142.416 Y130.967 E.01435
G1 X142.798 Y131.067 E.01243
G1 X138.928 Y127.197 E.17199
G1 X138.833 Y126.698 E.01594
G1 X138.821 Y126.544 E.00487
G1 X143.46 Y131.183 E.20616
G1 X144.034 Y131.212 E.01806
G1 X138.793 Y125.971 E.23291
G1 X138.817 Y125.45 E.01638
G1 X144.549 Y131.181 E.25469
G1 X145.02 Y131.107 E.01499
G1 X138.894 Y124.981 E.27221
G1 X138.938 Y124.753 E.00731
G1 X139.002 Y124.543 E.00688
G1 X145.462 Y131.004 E.28711
G1 X145.866 Y130.863 E.01346
G1 X139.137 Y124.133 E.29907
G1 X139.3 Y123.75 E.01306
G1 X146.246 Y130.697 E.3087
G1 X146.607 Y130.513 E.01274
G1 X139.491 Y123.397 E.31624
G1 X139.701 Y123.062 E.01243
G1 X146.938 Y130.298 E.32159
G1 X147.254 Y130.069 E.01227
G1 X139.929 Y122.744 E.3255
G1 X140.185 Y122.455 E.01214
G1 X147.547 Y129.816 E.32713
G1 X147.817 Y129.541 E.01212
G1 X140.455 Y122.179 E.32717
G1 X140.752 Y121.931 E.01217
G1 X148.07 Y129.249 E.32522
G1 X148.304 Y128.938 E.01224
G1 X141.065 Y121.699 E.32172
G1 X141.396 Y121.484 E.01239
G1 X148.514 Y128.602 E.31634
G1 X148.702 Y128.244 E.01269
G1 X141.757 Y121.3 E.30861
G1 X142.14 Y121.137 E.01307
G1 X148.863 Y127.86 E.29876
G1 X149 Y127.452 E.01353
G1 X142.547 Y120.999 E.28678
G1 X142.981 Y120.888 E.0141
G1 X149.109 Y127.016 E.27232
G1 X149.184 Y126.546 E.01497
G1 X143.456 Y120.818 E.25455
G1 X143.977 Y120.793 E.01638
G1 X149.212 Y126.028 E.23264
G1 X149.184 Y125.455 E.01803
G1 X144.552 Y120.823 E.20585
G1 X144.905 Y120.866 E.01116
M73 P48 R11
G1 X145.212 Y120.937 E.00989
G1 X149.067 Y124.793 E.17135
G1 X148.945 Y124.349 E.01446
G1 X148.799 Y123.979 E.01249
G1 X146.013 Y121.193 E.12384
G1 X146.484 Y121.416 E.01638
G1 X146.727 Y121.557 E.00883
G1 X147.188 Y121.875 E.0176
G1 X147.567 Y122.201 E.0157
G1 X148.642 Y123.276 E.04777
G1 X147.801 Y114.112 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X148.824 Y112.852 I-3.526 J-3.909 E.05402
G1 X153.757 Y107.919 E.23144
G3 X154.33 Y109.442 I-9.064 J4.277 E.05403
G1 X131.781 Y121.932 F30000
G1 F15476.087
G2 X131.021 Y121.345 I-3.142 J3.283 E.03188
G1 X116.472 Y106.796 E.68255
G1 X124.345 Y98.951 E.36868
G1 X123.979 Y98.951 E.01215
G1 X129.77 Y104.742 E.27165
G2 X126.242 Y104.73 I-1.781 J5.324 E.11903
G1 X132.02 Y98.952 E.27107
G1 X131.656 Y98.952 E.0121
G1 X139.436 Y106.745 E.3653
G2 X139.187 Y107.137 I3.533 J2.522 E.01544
G1 X124.985 Y121.339 E.66623
G2 X124.075 Y122.075 I3.375 J5.099 E.03887
G1 X115.889 Y113.889 E.38406
G2 X116.852 Y112.585 I-3.431 J-3.545 E.05402
G1 X144.288 Y134.078 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.409001
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X136.222 Y142.145 E.61067
G1 X136.546 Y142.47 E.02457
G1 X144.47 Y134.546 E.59983
G1 X144.794 Y134.871 E.02457
G1 X136.871 Y142.794 E.59983
G1 X137.195 Y143.119 E.02457
G1 X145.119 Y135.195 E.59983
G1 X145.443 Y135.52 E.02457
G1 X137.52 Y143.443 E.59983
G1 X137.844 Y143.768 E.02457
G1 X145.768 Y135.844 E.59983
G1 X146.092 Y136.169 E.02457
G1 X138.169 Y144.092 E.59983
G1 X138.493 Y144.417 E.02457
G1 X146.417 Y136.493 E.59983
G1 X146.687 Y136.764 E.02048
G1 X148.976 Y134.475 E.17328
G1 X149.03 Y134.529 E.00409
G1 X134.98 Y148.58 E1.06366
G1 X135.305 Y148.904 E.02457
G1 X149.355 Y134.854 E1.06366
G1 X149.567 Y135.066 E.01607
G1 X149.85 Y134.783 E.02141
G1 X149.896 Y134.829 E.00345
G1 X151.162 Y133.562 E.09585
G1 X151.229 Y133.629 E.00506
G1 X135.629 Y149.229 E1.18093
G1 X135.954 Y149.553 E.02457
G1 X151.553 Y133.954 E1.18093
G1 X151.878 Y134.278 E.02457
G1 X136.278 Y149.878 E1.18093
G1 X136.603 Y150.202 E.02457
G1 X152.202 Y134.603 E1.18093
G1 X152.527 Y134.927 E.02457
G1 X136.927 Y150.527 E1.18093
G1 X137.252 Y150.851 E.02457
G1 X152.851 Y135.252 E1.18093
G1 X153.071 Y135.472 E.01662
G1 X149.233 Y139.31 E.29055
G1 X149.338 Y139.415 E.00795
G1 X141.415 Y147.338 E.59983
G1 X141.739 Y147.663 E.02457
G1 X149.663 Y139.739 E.59983
G1 X149.987 Y140.064 E.02457
G1 X142.064 Y147.987 E.59983
G1 X142.388 Y148.312 E.02457
G1 X150.312 Y140.388 E.59983
G1 X150.636 Y140.713 E.02457
G1 X142.713 Y148.636 E.59983
G1 X143.037 Y148.961 E.02457
G1 X150.961 Y141.037 E.59983
G1 X151.285 Y141.362 E.02457
G1 X143.362 Y149.285 E.59983
G1 X143.686 Y149.61 E.02457
G1 X151.61 Y141.686 E.59983
G1 X151.935 Y142.011 E.02457
G1 X143.868 Y150.078 E.61067
G1 X139.05 Y150.099 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X137.898 Y151.25 E.05401
G1 X139.698 Y153.05 E.08441
G1 X139.33 Y153.05 E.01219
G1 X142.925 Y149.455 E.16865
G1 X144.014 Y150.544 E.05109
G1 X144.441 Y150.117 E.02002
G1 X146.085 Y151.761 E.07711
G3 X144.563 Y152.337 I-6.734 J-15.475 E.054
G1 X152.099 Y137.05 F30000
G1 F15476.087
G1 X153.25 Y135.898 E.05401
G1 X155.05 Y137.698 E.08441
G1 X155.05 Y137.33 E.01218
G1 X151.455 Y140.925 E.16864
G1 X152.544 Y142.014 E.05109
G1 X152.117 Y142.441 E.02002
G1 X153.762 Y144.086 E.07717
G3 X150.642 Y148.642 I-14.396 J-6.514 E.18411
G1 X148.279 Y146.279 E.11083
G1 X147.128 Y147.43 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X148.279 Y146.279 E-.61876
G1 X148.542 Y146.542 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
G17
G3 Z3 I-.107 J-1.212 P1  F30000
G1 X106.663 Y150.237 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X106.357 Y149.997 E.01293
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.8024
G1 X140.163 Y98.604 E.80139
G3 X155.398 Y114.004 I-.175 J15.408 E.79685
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.02 Y150.502 I.01 J-15.412 E.31823
G1 X106.712 Y150.273 E.01274
G1 X106.426 Y150.549 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.0123
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.166 Y98.212 E.7425
G3 X155.79 Y114.001 I-.177 J15.801 E.75688
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.474 Y150.585 E.01212
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.303 E-.17493
G1 X105.456 Y149.753 E-.32492
G1 X104.959 Y149.282 E-.26016
; WIPE_END
G1 E-.04 F1800
G1 X109.503 Y146.905 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X109.599 Y146.955 E.00358
G2 X111.042 Y147.421 I2.714 J-5.926 E.05041
G1 X116.67 Y153.05 E.26403
G1 X116.302 Y153.05 E.01219
G1 X123.761 Y145.591 E.3499
G3 X122.73 Y143.758 I4.629 J-3.81 E.07012
G1 X110.149 Y131.177 E.59019
G3 X108.449 Y130.199 I1.867 J-5.212 E.06542
G1 X100.95 Y137.698 E.35177
G1 X100.95 Y137.33 E.01219
G1 X106.587 Y142.967 E.26443
G2 X108.113 Y145.887 I5.41 J-.968 E.111
G1 X105.358 Y148.642 E.12922
G2 X109.915 Y151.761 I11.894 J-12.488 E.18397
G1 X115.214 Y146.462 E.24859
G2 X116.364 Y145.357 I-3.522 J-4.816 E.05306
G1 X114.692 Y146.537 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421402
G1 F15000
G1 X115.695 Y145.534 E.04376
G1 X116.051 Y145.12 E.01683
G1 X116.218 Y144.891 E.00875
G1 X116.507 Y144.415 E.01718
G1 X116.708 Y143.986 E.01459
G1 X113.988 Y146.706 E.11862
G1 X113.581 Y146.863 E.01347
G1 X113.192 Y146.966 E.01239
G1 X116.965 Y143.193 E.16456
G1 X117.045 Y142.835 E.01132
G1 X117.077 Y142.547 E.00894
G1 X112.546 Y147.077 E.19759
G1 X112.21 Y147.109 E.01043
G1 X111.982 Y147.106 E.00703
G1 X117.106 Y141.982 E.2235
G1 X117.085 Y141.468 E.01588
G1 X111.473 Y147.08 E.24477
G1 X111.004 Y147.014 E.01462
G1 X117.011 Y141.007 E.26201
G1 X116.904 Y140.578 E.01362
G1 X110.578 Y146.904 E.27592
G1 X110.176 Y146.772 E.01308
G1 X116.77 Y140.177 E.28763
G1 X116.613 Y139.799 E.01263
G1 X109.798 Y146.614 E.29725
G1 X109.449 Y146.428 E.0122
G1 X116.427 Y139.45 E.30433
G1 X116.219 Y139.123 E.01196
G1 X109.12 Y146.221 E.3096
G1 X108.815 Y145.991 E.01179
G1 X115.995 Y138.811 E.31315
G1 X115.744 Y138.527 E.0117
G1 X108.526 Y145.745 E.31482
G1 X108.257 Y145.478 E.01167
G1 X115.481 Y138.255 E.31506
G1 X115.189 Y138.011 E.01172
G1 X108.012 Y145.189 E.31307
M73 P49 R11
G1 X107.783 Y144.882 E.0118
G1 X114.881 Y137.784 E.3096
G1 X114.556 Y137.574 E.01194
G1 X107.573 Y144.557 E.30458
G1 X107.392 Y144.202 E.01227
G1 X114.204 Y137.391 E.29708
G1 X113.827 Y137.232 E.0126
G1 X107.232 Y143.828 E.28767
G1 X107.093 Y143.432 E.01294
G1 X113.428 Y137.096 E.27633
G1 X113.001 Y136.987 E.01357
G1 X106.992 Y142.997 E.26211
G1 X106.921 Y142.533 E.01447
G1 X112.537 Y136.917 E.24495
G1 X112.025 Y136.893 E.01578
G1 X106.891 Y142.027 E.22393
G1 X106.92 Y141.463 E.01741
G1 X111.461 Y136.922 E.19809
G1 X111.097 Y136.967 E.01132
G1 X110.814 Y137.034 E.00897
G1 X107.033 Y140.815 E.16493
G1 X107.116 Y140.486 E.01044
G1 X107.294 Y140.019 E.01543
G1 X110.019 Y137.294 E.11885
G1 X109.772 Y137.397 E.00825
G1 X109.284 Y137.667 E.01719
G1 X108.828 Y137.989 E.01722
G1 X108.612 Y138.169 E.00867
G2 X107.438 Y139.34 I85.108 J86.609 E.05113
G1 X108.617 Y137.658 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X108.595 Y137.673 E.00088
G2 X107.517 Y138.807 I4.04 J4.923 E.05201
G1 X102.239 Y144.085 E.24762
G3 X101.663 Y142.563 I15.475 J-6.734 E.054
G1 X114.585 Y137.147 F30000
G1 F15476.087
G3 X115.889 Y138.111 I-2.245 J4.397 E.05401
G1 X124.073 Y129.927 E.38394
G3 X123.345 Y129.021 I4.61 J-4.448 E.03859
G1 X108.783 Y114.459 E.68314
G1 X100.95 Y122.346 E.36872
G1 X100.95 Y121.978 E.01219
G1 X106.822 Y127.85 E.27546
G3 X106.815 Y124.157 I5.088 J-1.856 E.12501
G1 X100.95 Y130.022 E.27513
G1 X100.95 Y129.654 E.01219
G1 X108.783 Y137.541 E.36872
G1 X123.39 Y122.9 E.68602
G3 X123.932 Y122.219 I5.42 J3.758 E.02889
G1 X123.417 Y123.286 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425088
G1 F15000
G3 X124.657 Y122.065 I23.067 J22.168 E.0542
G1 X125.103 Y121.726 E.01745
G1 X125.581 Y121.438 E.01739
G1 X126.005 Y121.239 E.01457
G1 X123.244 Y124 E.12158
G1 X123.025 Y124.619 E.02046
G1 X122.985 Y124.8 E.00577
G1 X126.8 Y120.985 E.16803
G1 X127.164 Y120.905 E.01162
G1 X127.452 Y120.873 E.00901
G1 X122.873 Y125.452 E.20165
G1 X122.844 Y125.721 E.00843
G1 X122.844 Y126.022 E.00936
G1 X128.022 Y120.844 E.22803
G1 X128.278 Y120.844 E.00799
G1 X128.534 Y120.872 E.00802
G1 X122.872 Y126.534 E.24938
G1 X122.942 Y127.005 E.01482
G1 X129.005 Y120.942 E.26703
G1 X129.442 Y121.045 E.01399
G1 X123.045 Y127.442 E.28173
G1 X123.181 Y127.846 E.01328
G1 X129.846 Y121.181 E.29353
G1 X130.221 Y121.347 E.01277
G1 X123.343 Y128.224 E.30291
G1 X123.531 Y128.578 E.01245
G1 X130.579 Y121.529 E.31044
G1 X130.907 Y121.742 E.01217
G1 X123.742 Y128.907 E.31558
G1 X123.97 Y129.22 E.01205
G1 X131.22 Y121.97 E.31929
G1 X131.512 Y122.218 E.01194
G1 X124.218 Y129.512 E.32123
G1 X124.488 Y129.782 E.0119
G1 X131.782 Y122.488 E.32123
G1 X132.03 Y122.78 E.01194
G1 X124.78 Y130.03 E.31929
G1 X125.093 Y130.258 E.01205
G1 X132.258 Y123.093 E.31558
G1 X132.469 Y123.422 E.01218
G1 X125.422 Y130.469 E.31036
G1 X125.775 Y130.657 E.01245
G1 X132.657 Y123.775 E.30305
G1 X132.816 Y124.157 E.01287
G1 X126.154 Y130.819 E.29341
G1 X126.558 Y130.955 E.01329
G1 X132.956 Y124.557 E.28179
G1 X133.058 Y124.995 E.01402
G1 X126.995 Y131.058 E.26703
G1 X127.466 Y131.128 E.01481
G1 X133.128 Y125.466 E.2494
G1 X133.156 Y125.72 E.00797
G1 X133.156 Y125.978 E.00805
G1 X127.978 Y131.156 E.22804
G1 X128.279 Y131.156 E.00937
G1 X128.548 Y131.127 E.00842
G1 X133.127 Y126.548 E.20166
G1 X133.095 Y126.836 E.00902
G1 X133.015 Y127.2 E.01161
G1 X129.2 Y131.015 E.16804
G1 X129.382 Y130.975 E.0058
G1 X129.995 Y130.761 E.02022
G1 X132.756 Y128 E.1216
G1 X132.562 Y128.419 E.01437
G1 X132.421 Y128.668 E.00894
G1 X132.11 Y129.125 E.0172
G1 X131.769 Y129.527 E.01642
G1 X130.699 Y130.597 E.04711
G1 X131.777 Y130.065 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X131.006 Y130.67 I-4.419 J-4.832 E.03254
G1 X116.484 Y145.192 E.68127
G1 X124.346 Y153.05 E.36872
G1 X123.978 Y153.05 E.01219
G1 X129.77 Y147.258 E.27168
G3 X126.242 Y147.27 I-1.781 J-5.33 E.11903
G1 X132.022 Y153.05 E.27114
G1 X131.654 Y153.05 E.01219
G1 X139.436 Y145.255 E.36537
G3 X139.187 Y144.863 I3.52 J-2.514 E.01544
G1 X124.979 Y130.655 E.66652
G3 X124.219 Y130.068 I2.38 J-3.867 E.03189
G1 X123.416 Y139.287 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425084
G1 F15000
G3 X124.657 Y138.065 I23.178 J22.277 E.05424
G1 X125.103 Y137.726 E.01744
G1 X125.581 Y137.438 E.01739
G1 X125.996 Y137.248 E.0142
G1 X123.244 Y140 E.12119
G1 X123.025 Y140.618 E.02043
G1 X122.985 Y140.8 E.0058
G1 X126.804 Y136.981 E.16818
G1 X127.46 Y136.865 E.02076
G1 X122.873 Y141.452 E.20201
G1 X122.844 Y141.721 E.00843
G1 X122.844 Y142.022 E.00936
G1 X128.022 Y136.844 E.22804
G1 X128.279 Y136.844 E.00801
G1 X128.534 Y136.872 E.008
G1 X122.865 Y142.541 E.24967
G1 X122.94 Y143.006 E.01469
G1 X129.005 Y136.942 E.26709
G1 X129.442 Y137.045 E.01399
G1 X123.048 Y143.439 E.28158
G1 X123.184 Y143.843 E.01329
G1 X129.846 Y137.181 E.2934
G1 X130.221 Y137.347 E.01277
G1 X123.343 Y144.224 E.30291
G1 X123.531 Y144.578 E.01245
G1 X130.576 Y137.532 E.31027
G1 X130.912 Y137.737 E.01225
G1 X123.742 Y144.907 E.31579
G1 X123.967 Y145.222 E.01206
G1 X131.219 Y137.97 E.31937
G1 X131.513 Y138.217 E.01195
G1 X124.221 Y145.508 E.32112
G1 X124.488 Y145.782 E.0119
G1 X131.779 Y138.492 E.32108
G1 X132.03 Y138.781 E.01193
G1 X124.78 Y146.03 E.31926
G1 X125.093 Y146.258 E.01205
G1 X132.263 Y139.088 E.31579
G1 X132.273 Y139.102 E.00053
G1 X132.469 Y139.422 E.0117
G1 X125.422 Y146.469 E.31035
G1 X125.775 Y146.657 E.01245
G1 X132.657 Y139.775 E.30305
G1 X132.816 Y140.157 E.01287
G1 X126.157 Y146.816 E.29327
G1 X126.561 Y146.952 E.01329
G1 X132.956 Y140.557 E.28161
G1 X133.058 Y140.995 E.014
G1 X126.993 Y147.06 E.26711
G1 X127.459 Y147.135 E.01469
G1 X133.128 Y141.466 E.24968
G1 X133.163 Y141.971 E.01579
G1 X127.978 Y147.156 E.22833
G1 X128.279 Y147.156 E.00937
G1 X128.548 Y147.127 E.00842
G1 X133.134 Y142.54 E.20199
G1 X133.019 Y143.196 E.02074
G1 X129.2 Y147.015 E.1682
G1 X129.382 Y146.975 E.00581
G1 X130 Y146.756 E.02042
G1 X132.752 Y144.004 E.12121
G1 X132.686 Y144.169 E.00553
G1 X132.425 Y144.662 E.01738
G1 X132.111 Y145.125 E.01743
G1 X131.78 Y145.516 E.01595
G1 X130.713 Y146.583 E.04699
G1 X139.873 Y145.788 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X141.133 Y146.809 I3.825 J-3.432 E.05402
G1 X146.085 Y151.761 E.2323
G3 X144.563 Y152.337 I-6.735 J-15.477 E.054
G1 X146.39 Y147.062 F30000
G1 F15476.087
G3 X144.84 Y147.54 I-2.283 J-4.657 E.05402
G1 X139.33 Y153.05 E.25847
G1 X139.698 Y153.05 E.01219
G1 X132.239 Y145.591 E.3499
G2 X133.27 Y143.758 I-4.629 J-3.81 E.07012
G1 X145.688 Y131.34 E.58254
G2 X147.621 Y130.269 I-1.587 J-5.148 E.07385
G1 X155.05 Y137.698 E.34847
G1 X155.05 Y137.33 E.01218
G1 X149.534 Y142.846 E.25873
G3 X147.961 Y145.961 I-5.568 J-.858 E.1177
G1 X150.642 Y148.642 E.12576
G2 X153.761 Y144.085 I-12.488 J-11.894 E.18397
G1 X148.807 Y139.131 E.23238
G2 X147.788 Y137.87 I-4.515 J2.607 E.05402
G1 X146.725 Y130.641 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.428748
G1 F15000
G2 X147.989 Y129.356 I-21.438 J-22.371 E.05669
G1 X148.33 Y128.904 E.01778
G1 X148.48 Y128.667 E.00883
G1 X148.74 Y128.172 E.01758
G1 X148.8 Y128.02 E.00513
G1 X146.012 Y130.808 E.12394
G1 X145.451 Y131.008 E.01874
G1 X145.202 Y131.072 E.00807
G1 X149.068 Y127.207 E.17187
G1 X149.184 Y126.544 E.02115
G1 X144.548 Y131.181 E.20617
G1 X143.974 Y131.209 E.01806
G1 X149.212 Y125.971 E.23292
G1 X149.184 Y125.453 E.0163
G1 X143.455 Y131.182 E.25474
G1 X142.98 Y131.112 E.0151
G1 X149.109 Y124.983 E.27252
G1 X149 Y124.546 E.01414
G1 X142.545 Y131.001 E.28698
G1 X142.133 Y130.867 E.01361
G1 X148.862 Y124.138 E.29918
G1 X148.701 Y123.754 E.0131
G1 X141.755 Y130.7 E.30883
G1 X141.399 Y130.51 E.01268
G1 X148.513 Y123.396 E.3163
G1 X148.299 Y123.064 E.01241
G1 X141.062 Y130.301 E.32179
G1 X140.747 Y130.071 E.01228
G1 X148.068 Y122.749 E.32554
G1 X147.819 Y122.453 E.01218
G1 X140.454 Y129.818 E.32751
G1 X140.183 Y129.544 E.01213
G1 X147.544 Y122.182 E.32732
G1 X147.251 Y121.929 E.01216
G1 X139.932 Y129.249 E.32545
G1 X139.698 Y128.937 E.01225
G1 X146.935 Y121.7 E.32179
G1 X146.604 Y121.485 E.0124
G1 X139.486 Y128.603 E.31647
G1 X139.301 Y128.243 E.01274
G1 X146.242 Y121.302 E.30862
G1 X145.862 Y121.136 E.01303
G1 X139.133 Y127.865 E.2992
G1 X139 Y127.452 E.01363
G1 X145.458 Y120.995 E.28713
G1 X145.016 Y120.891 E.01428
G1 X138.893 Y127.014 E.27222
G1 X138.821 Y126.541 E.01504
G1 X144.54 Y120.821 E.25431
G1 X144.349 Y120.798 E.00605
G1 X144.022 Y120.794 E.01029
G1 X138.791 Y126.024 E.23257
G1 X138.817 Y125.453 E.01798
G1 X143.452 Y120.818 E.20608
G1 X142.958 Y120.892 E.01571
G1 X142.789 Y120.936 E.00549
G1 X138.93 Y124.795 E.17158
G1 X139.101 Y124.217 E.01893
G1 X139.204 Y123.975 E.00829
G1 X141.981 Y121.198 E.12348
G1 X141.393 Y121.485 E.02058
G1 X140.925 Y121.79 E.01756
G1 X140.491 Y122.144 E.01761
G2 X139.373 Y123.26 I27.158 J28.322 E.04966
G1 X139.73 Y122.378 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X131.591 Y114.239 E.38181
G3 X124.41 Y114.238 I-3.59 J-4.271 E.25879
G1 X116.198 Y122.45 E.38521
G3 X116.198 Y129.55 I-4.199 J3.55 E.25605
G1 X124.409 Y137.761 E.38518
G3 X131.591 Y137.761 I3.591 J4.242 E.25903
G1 X139.729 Y129.623 E.38176
G1 X139.373 Y139.26 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.428746
G1 F15000
G1 X140.357 Y138.276 E.04376
G1 X140.703 Y137.961 E.01471
G1 X141.155 Y137.631 E.0176
G1 X141.639 Y137.352 E.01758
G1 X141.981 Y137.198 E.01178
G1 X139.204 Y139.975 E.12348
G1 X139.101 Y140.217 E.00829
G1 X138.93 Y140.795 E.01893
G1 X142.789 Y136.936 E.17158
G1 X142.958 Y136.892 E.00549
G1 X143.452 Y136.818 E.01571
G1 X138.818 Y141.452 E.20605
G1 X138.791 Y142.024 E.018
G1 X144.022 Y136.793 E.23258
G1 X144.349 Y136.798 E.01028
G1 X144.54 Y136.821 E.00604
G1 X138.821 Y142.541 E.2543
G1 X138.893 Y143.014 E.01504
G1 X145.016 Y136.891 E.27222
G1 X145.458 Y136.995 E.01428
G1 X138.996 Y143.457 E.28733
G1 X139.137 Y143.861 E.01346
G1 X145.862 Y137.136 E.29902
G1 X146.242 Y137.302 E.01303
G1 X139.301 Y144.243 E.30862
G1 X139.486 Y144.603 E.01274
G1 X146.601 Y137.488 E.31635
G1 X146.94 Y137.696 E.01247
G1 X139.698 Y144.937 E.32199
G1 X139.932 Y145.249 E.01225
G1 X147.249 Y137.932 E.32535
G1 X147.546 Y138.18 E.01218
G1 X140.183 Y145.544 E.3274
G1 X140.453 Y145.819 E.01213
G1 X147.815 Y138.457 E.32731
G1 X148.069 Y138.749 E.01216
G1 X140.747 Y146.071 E.32556
G1 X141.062 Y146.301 E.01228
G1 X148.303 Y139.06 E.32195
G1 X148.51 Y139.399 E.01248
G1 X141.399 Y146.51 E.31618
G1 X141.755 Y146.7 E.01268
G1 X148.702 Y139.753 E.30888
G1 X148.862 Y140.138 E.01312
G1 X142.133 Y146.867 E.29919
G1 X142.545 Y147.001 E.01361
G1 X149 Y140.546 E.28698
G1 X149.109 Y140.983 E.01414
G1 X142.98 Y147.112 E.27252
G1 X143.455 Y147.182 E.01509
G1 X149.184 Y141.453 E.25475
G1 X149.212 Y141.971 E.0163
G1 X143.974 Y147.209 E.23292
G1 X144.547 Y147.181 E.01807
G1 X149.184 Y142.544 E.20617
G1 X149.068 Y143.207 E.02115
G1 X145.21 Y147.064 E.17151
G1 X145.451 Y147.008 E.00777
G1 X146.012 Y146.808 E.01872
G1 X148.8 Y144.02 E.12394
G1 X148.74 Y144.172 E.00513
G1 X148.479 Y144.668 E.0176
G1 X148.168 Y145.131 E.01755
G1 X147.994 Y145.351 E.00883
G3 X146.738 Y146.627 I-22.491 J-20.877 E.05628
G1 X146.733 Y114.63 F30000
; LINE_WIDTH: 0.428427
G1 F15000
G1 X147.839 Y113.524 E.04916
G1 X148.168 Y113.132 E.01605
G1 X148.469 Y112.684 E.01698
G1 X148.74 Y112.172 E.01818
G1 X148.801 Y112.017 E.00524
G1 X146.007 Y114.811 E.12413
G1 X145.451 Y115.008 E.01852
G1 X145.209 Y115.064 E.00781
G1 X149.065 Y111.208 E.17132
G1 X149.146 Y110.837 E.01192
G1 X149.177 Y110.55 E.00906
G1 X144.55 Y115.178 E.20557
G1 X144.349 Y115.202 E.00635
G1 X143.975 Y115.207 E.01174
G1 X149.205 Y109.977 E.23235
G1 X149.206 Y109.721 E.00805
G1 X149.178 Y109.459 E.00826
G1 X143.459 Y115.178 E.25407
G1 X143.232 Y115.157 E.00715
G1 X142.986 Y115.106 E.00791
G1 X149.111 Y108.981 E.27214
G1 X149 Y108.547 E.01407
G1 X142.543 Y115.004 E.28685
G1 X142.139 Y114.862 E.01344
G1 X148.863 Y108.139 E.29869
G1 X148.702 Y107.754 E.0131
G1 X141.757 Y114.7 E.30857
G1 X141.395 Y114.516 E.01274
G1 X148.511 Y107.4 E.31613
G1 X148.304 Y107.062 E.01246
G1 X141.065 Y114.301 E.32162
G1 X140.748 Y114.073 E.01227
G1 X148.07 Y106.75 E.32532
G1 X147.817 Y106.459 E.01214
G1 X140.459 Y113.817 E.32687
G1 X140.185 Y113.545 E.01211
G1 X147.547 Y106.184 E.32703
G1 X147.254 Y105.931 E.01214
G1 X139.929 Y113.256 E.3254
G1 X139.701 Y112.939 E.01227
G1 X146.938 Y105.702 E.32149
G1 X146.605 Y105.49 E.01241
G1 X139.491 Y112.604 E.31603
G1 X139.3 Y112.25 E.01263
G1 X146.251 Y105.298 E.30883
G1 X145.867 Y105.138 E.01309
G1 X139.137 Y111.868 E.29899
G1 X139.002 Y111.458 E.01356
G1 X145.463 Y104.996 E.28704
G1 X145.022 Y104.893 E.01424
G1 X138.889 Y111.025 E.27243
G1 X138.821 Y110.548 E.01513
G1 X144.547 Y104.822 E.25439
G1 X144.347 Y104.798 E.00632
G1 X144.03 Y104.794 E.00996
G1 X138.793 Y110.031 E.23266
G1 X138.788 Y109.859 E.00539
G1 X138.821 Y109.458 E.01266
G1 X143.456 Y104.822 E.20595
G1 X143.232 Y104.843 E.00707
G1 X142.802 Y104.931 E.01379
G1 X138.928 Y108.806 E.17213
G1 X139.012 Y108.482 E.01052
G1 X139.187 Y108.001 E.01608
G1 X141.993 Y105.195 E.12464
G1 X141.639 Y105.352 E.01217
G1 X141.155 Y105.631 E.01754
G1 X140.924 Y105.791 E.00885
G1 X140.538 Y106.105 E.01563
G1 X139.354 Y107.289 E.0526
G1 X139.073 Y112.659 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X140.037 Y113.963 I4.677 J-2.45 E.05402
G1 X131.927 Y122.073 E.38046
G3 X132.655 Y122.979 I-4.61 J4.448 E.03859
G1 X146.867 Y137.191 E.66674
G3 X147.26 Y137.444 I-1.069 J2.091 E.01551
G1 X155.048 Y129.656 E.36535
G1 X155.048 Y130.02 E.01207
G1 X149.342 Y124.315 E.26765
G3 X149.342 Y127.685 I-5.265 J1.685 E.11363
G1 X155.046 Y121.982 E.26756
G1 X155.046 Y122.342 E.01195
G1 X147.26 Y114.556 E.36527
G1 X147.193 Y114.607 E.00278
G3 X146.867 Y114.809 I-2.038 J-2.933 E.01273
G1 X132.655 Y129.021 E.66672
M73 P50 R11
G3 X131.925 Y129.925 I-4.933 J-3.241 E.03861
G1 X140.017 Y138.055 E.38054
G2 X139.073 Y139.341 I4.364 J4.195 E.0531
G1 X114.672 Y130.558 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4214
G1 F15000
G1 X115.696 Y129.533 E.04467
G1 X116.053 Y129.118 E.01689
G1 X116.365 Y128.663 E.01702
G1 X116.508 Y128.414 E.00884
G1 X116.708 Y127.986 E.01458
G1 X113.988 Y130.706 E.11862
G1 X113.581 Y130.863 E.01348
G1 X113.192 Y130.966 E.01239
G1 X116.965 Y127.193 E.16457
G1 X117.045 Y126.835 E.01132
G1 X117.077 Y126.547 E.00894
G1 X112.541 Y131.082 E.19782
G1 X112.209 Y131.109 E.01027
G1 X111.982 Y131.106 E.00701
G1 X117.106 Y125.982 E.22349
G1 X117.085 Y125.468 E.01588
G1 X111.473 Y131.08 E.24477
G1 X111.006 Y131.012 E.01456
G1 X117.011 Y125.007 E.26192
G1 X116.904 Y124.578 E.01362
G1 X110.573 Y130.909 E.27614
G1 X110.176 Y130.771 E.01296
G1 X116.77 Y124.177 E.2876
G1 X116.613 Y123.799 E.01263
G1 X109.798 Y130.614 E.29727
G1 X109.451 Y130.425 E.01217
G1 X116.427 Y123.45 E.30423
G1 X116.218 Y123.123 E.01196
G1 X109.123 Y130.219 E.30949
G1 X108.811 Y129.996 E.01183
G1 X115.993 Y122.813 E.31329
G1 X115.746 Y122.525 E.01171
G1 X108.526 Y129.744 E.31489
G1 X108.26 Y129.476 E.01167
G1 X115.481 Y122.255 E.31497
G1 X115.189 Y122.011 E.01172
G1 X108.008 Y129.192 E.31322
G1 X107.783 Y128.882 E.01182
G1 X114.881 Y121.784 E.3096
G1 X114.556 Y121.574 E.01194
G1 X107.573 Y128.557 E.3046
G1 X107.392 Y128.202 E.01228
G1 X114.204 Y121.391 E.29708
G1 X113.827 Y121.232 E.0126
G1 X107.232 Y127.827 E.28766
G1 X107.094 Y127.43 E.01298
G1 X113.428 Y121.096 E.27624
G1 X113.001 Y120.987 E.01357
G1 X106.987 Y127.002 E.26232
G1 X106.919 Y126.534 E.01457
G1 X112.537 Y120.917 E.245
G1 X112.025 Y120.893 E.01579
G1 X106.888 Y126.03 E.22405
G1 X106.921 Y125.462 E.01754
G1 X111.461 Y120.922 E.19804
G1 X111.098 Y120.967 E.01131
G1 X110.825 Y121.023 E.0086
G1 X107.028 Y124.82 E.16561
G1 X107.205 Y124.222 E.01924
G1 X107.294 Y124.019 E.00684
G1 X110.018 Y121.294 E.11885
G1 X109.772 Y121.397 E.00825
G1 X109.284 Y121.667 E.01719
G1 X108.834 Y121.985 E.017
G1 X108.613 Y122.169 E.00886
G2 X107.437 Y123.34 I84.692 J86.196 E.05119
G1 X114.666 Y114.56 F30000
; LINE_WIDTH: 0.421334
G1 F15000
G2 X116.053 Y113.119 I-14.049 J-14.897 E.06169
G1 X116.369 Y112.656 E.01728
G1 X116.633 Y112.165 E.01719
G1 X116.704 Y111.987 E.00591
G1 X113.984 Y114.707 E.11862
G1 X113.58 Y114.863 E.01335
G1 X113.188 Y114.968 E.01252
G1 X116.97 Y111.186 E.16494
G1 X117.084 Y110.537 E.02031
G1 X112.544 Y115.077 E.19798
G1 X112.21 Y115.109 E.01034
G1 X111.98 Y115.106 E.0071
G1 X117.106 Y109.98 E.22355
G1 X117.085 Y109.466 E.01587
G1 X111.471 Y115.08 E.24481
G1 X111.004 Y115.011 E.01455
G1 X117.011 Y109.005 E.26193
G1 X116.904 Y108.577 E.01361
G1 X110.571 Y114.909 E.27615
G1 X110.175 Y114.77 E.01295
G1 X116.77 Y108.176 E.28759
G1 X116.613 Y107.797 E.01264
G1 X109.796 Y114.614 E.29728
G1 X109.45 Y114.425 E.01216
G1 X116.425 Y107.45 E.30417
G1 X116.223 Y107.117 E.01201
G1 X109.122 Y114.218 E.30967
G1 X108.81 Y113.995 E.01183
G1 X115.991 Y106.814 E.31316
G1 X115.743 Y106.526 E.0117
G1 X108.526 Y113.744 E.31475
G1 X108.409 Y113.641 E.00479
G1 X108.259 Y113.475 E.00689
G1 X115.48 Y106.254 E.31491
G1 X115.189 Y106.01 E.01171
G1 X108.007 Y113.192 E.31317
G1 X107.782 Y112.882 E.01181
G1 X114.88 Y105.784 E.30954
G1 X114.556 Y105.573 E.01193
G1 X107.572 Y112.557 E.30453
G1 X107.392 Y112.202 E.01228
G1 X114.203 Y105.391 E.29702
G1 X113.832 Y105.227 E.01251
G1 X107.232 Y111.827 E.28783
G1 X107.093 Y111.431 E.01294
G1 X113.428 Y105.095 E.27629
G1 X112.996 Y104.992 E.01369
G1 X106.992 Y110.997 E.26185
G1 X106.921 Y110.533 E.01447
G1 X112.532 Y104.922 E.24469
G1 X112.21 Y104.891 E.00996
G1 X112.025 Y104.893 E.0057
G1 X106.891 Y110.027 E.22387
G1 X106.92 Y109.463 E.0174
G1 X111.467 Y104.916 E.19828
G1 X110.824 Y105.023 E.02008
G1 X107.033 Y108.814 E.16532
G1 X107.116 Y108.486 E.01043
G1 X107.283 Y108.03 E.015
G1 X110.018 Y105.294 E.11929
G1 X109.772 Y105.397 E.00824
G1 X109.284 Y105.667 E.01719
G1 X108.844 Y105.977 E.01659
G1 X108.614 Y106.168 E.00921
G2 X107.438 Y107.339 I83.807 J85.315 E.05119
G1 X107.102 Y107.502 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X106.582 Y109.038 I4.602 J2.413 E.054
G1 X100.95 Y114.67 E.26422
G1 X100.95 Y114.302 E.01219
G1 X108.446 Y121.798 E.35163
G3 X110.162 Y120.81 I3.803 J4.624 E.06598
G1 X122.742 Y108.23 E.59014
G3 X123.766 Y106.414 I5.259 J1.77 E.06959
G1 X116.302 Y98.95 E.35015
G1 X116.67 Y98.95 E.01219
G1 X111.032 Y104.588 E.26446
G2 X108.112 Y106.112 I.968 J5.413 E.11098
G1 X105.358 Y103.358 E.12919
G2 X102.239 Y107.915 I11.718 J11.367 E.18406
G1 X107.542 Y113.218 E.24875
G2 X108.617 Y114.342 I4.201 J-2.942 E.05181
G1 X116.852 Y112.585 F30000
G1 F15476.087
G3 X115.889 Y113.889 I-4.395 J-2.241 E.05402
G1 X124.075 Y122.075 E.38406
G3 X124.985 Y121.339 I4.284 J4.363 E.03887
G1 X139.187 Y107.137 E.66623
G3 X139.442 Y106.738 I2.734 J1.465 E.01574
G1 X131.656 Y98.952 E.36526
G1 X132.02 Y98.952 E.01209
G1 X126.242 Y104.73 E.27107
G3 X129.77 Y104.742 I1.746 J5.335 E.11903
G1 X123.979 Y98.951 E.27165
G1 X124.345 Y98.951 E.01214
G1 X116.472 Y106.796 E.36868
G1 X131.021 Y121.345 E.68255
G3 X131.781 Y121.932 I-2.383 J3.869 E.03188
G1 X130.713 Y114.583 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425086
G1 F15000
G1 X131.769 Y113.527 E.0465
G1 X132.109 Y113.127 E.01635
G1 X132.425 Y112.662 E.01751
G1 X132.761 Y111.995 E.02326
G1 X129.995 Y114.761 E.12182
G1 X129.382 Y114.975 E.02022
G1 X129.2 Y115.015 E.0058
G1 X133.015 Y111.2 E.16804
G1 X133.095 Y110.836 E.01161
G1 X133.127 Y110.548 E.00902
G1 X128.548 Y115.127 E.20166
G1 X128.279 Y115.156 E.00842
G1 X127.978 Y115.156 E.00937
G1 X133.156 Y109.978 E.22804
G1 X133.135 Y109.459 E.01618
G1 X127.466 Y115.128 E.24968
G1 X126.995 Y115.058 E.01481
G1 X133.06 Y108.994 E.2671
G1 X132.952 Y108.561 E.01388
G1 X126.557 Y114.956 E.28165
G1 X126.157 Y114.816 E.0132
G1 X132.816 Y108.157 E.29327
G1 X132.657 Y107.776 E.01287
G1 X125.776 Y114.657 E.30305
G1 X125.422 Y114.469 E.01245
G1 X132.469 Y107.422 E.31035
G1 X132.258 Y107.093 E.01218
G1 X125.093 Y114.258 E.31558
G1 X124.778 Y114.032 E.01206
G1 X132.03 Y106.78 E.31938
G1 X131.782 Y106.488 E.01194
G1 X124.491 Y113.779 E.32109
G1 X124.218 Y113.512 E.0119
G1 X131.513 Y106.217 E.32127
G1 X131.219 Y105.97 E.01195
G1 X123.97 Y113.22 E.31927
G1 X123.742 Y112.907 E.01205
G1 X130.912 Y105.737 E.31579
G1 X130.576 Y105.532 E.01225
G1 X123.531 Y112.578 E.31028
G1 X123.343 Y112.224 E.01245
G1 X130.221 Y105.347 E.30291
G1 X129.846 Y105.181 E.01277
G1 X123.184 Y111.843 E.2934
G1 X123.048 Y111.439 E.01329
G1 X129.442 Y105.045 E.28159
G1 X129.005 Y104.942 E.01399
G1 X122.938 Y111.008 E.26718
G1 X122.872 Y110.534 E.0149
G1 X128.534 Y104.872 E.24939
G1 X128.279 Y104.844 E.008
G1 X128.022 Y104.844 E.00801
G1 X122.844 Y110.022 E.22804
G1 X122.844 Y109.721 E.00936
G1 X122.873 Y109.452 E.00843
G1 X127.46 Y104.865 E.20201
G1 X126.803 Y104.981 E.02076
G1 X122.985 Y108.8 E.16818
G1 X123.025 Y108.618 E.0058
G1 X123.239 Y108.005 E.02023
G1 X125.996 Y105.248 E.1214
G1 X125.829 Y105.315 E.00558
G1 X125.337 Y105.576 E.01734
G1 X124.876 Y105.889 E.01737
G1 X124.656 Y106.065 E.00876
G2 X123.403 Y107.3 I22.177 J23.752 E.0548
G1 X111.437 Y99.663 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X109.915 Y100.239 I5.213 J16.054 E.054
G1 X115.204 Y105.528 E.2481
G3 X116.348 Y106.635 I-2.86 J4.101 E.05302
G1 X149.068 Y107.608 F30000
G1 F15476.087
G1 X149.104 Y107.682 E.00274
G3 X149.54 Y109.16 I-5.847 J2.53 E.05124
G1 X155.044 Y114.664 E.25821
G1 X155.044 Y114.308 E.01183
G1 X147.621 Y121.731 E.34822
G2 X145.688 Y120.66 I-3.522 J4.078 E.07385
G1 X133.269 Y108.239 E.58263
G2 X132.234 Y106.414 I-5.51 J1.921 E.06997
G1 X139.696 Y98.953 E.35005
G1 X139.332 Y98.953 E.01205
G1 X144.843 Y104.463 E.25851
G3 X147.961 Y106.039 I-.801 J5.456 E.11792
G1 X150.634 Y103.366 E.12539
G2 X146.083 Y100.241 I-10.785 J10.826 E.18413
G1 X141.133 Y105.191 E.23222
G2 X139.873 Y106.212 I2.495 J4.366 E.05403
G1 X154.33 Y109.442 F30000
G1 F15476.087
G2 X153.757 Y107.919 I-9.637 J2.754 E.05403
G1 X148.811 Y112.876 E.23229
G3 X147.801 Y114.112 I-5.152 J-3.182 E.05309
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X148.475 Y113.376 E-.37895
G1 X148.811 Y112.876 E-.22911
G1 X149.093 Y112.593 E-.15194
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
G17
G3 Z3.2 I-.808 J-.91 P1  F30000
G1 X106.668 Y150.241 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X106.354 Y150 E.01314
G3 X100.602 Y137.996 I9.65 J-12.004 E.45661
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.401 J-.001 E.80255
G1 X140.175 Y98.605 E.8018
G3 X155.398 Y114.004 I-.177 J15.398 E.79658
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.401 J.001 E.80255
G1 X116.004 Y153.398 E.79585
G3 X107.018 Y150.505 I-.001 J-15.401 E.31828
G1 X106.716 Y150.277 E.01253
G1 X106.431 Y150.553 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.108 Y150.306 E.0125
G3 X100.21 Y137.999 I9.895 J-12.309 E.43364
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.794 J.002 E.76217
G1 X140.178 Y98.212 E.74288
G3 X143.149 Y98.529 I-.288 J16.825 E.09191
G3 X155.79 Y114.001 I-3.161 J15.483 E.66463
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.794 J-.002 E.76217
G1 X116.001 Y153.79 E.73736
G3 X106.789 Y150.823 I.002 J-15.794 E.30225
G1 X106.479 Y150.589 E.01194
M204 S10000
; WIPE_START
G1 F24000
G1 X106.108 Y150.306 E-.17733
G1 X105.456 Y149.753 E-.32495
G1 X104.963 Y149.287 E-.25772
; WIPE_END
G1 E-.04 F1800
G1 X109.337 Y146.558 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421273
G1 F15000
G1 X108.197 Y145.418 E.04971
G1 X107.863 Y145.006 E.01634
G1 X107.56 Y144.536 E.01725
G1 X107.285 Y143.97 E.0194
G1 X110.022 Y146.707 E.11935
G1 X110.288 Y146.819 E.00889
G1 X110.827 Y146.977 E.01732
G1 X107.027 Y143.177 E.16568
G1 X106.934 Y142.697 E.01509
G1 X106.921 Y142.536 E.00498
G1 X111.463 Y147.079 E.19807
G1 X111.652 Y147.102 E.00584
G1 X112.027 Y147.107 E.01157
G1 X106.893 Y141.973 E.22385
G1 X106.92 Y141.465 E.01569
G1 X112.533 Y147.078 E.24477
G1 X113.003 Y147.013 E.01463
G1 X106.987 Y140.997 E.26231
G1 X107.095 Y140.569 E.0136
G1 X113.429 Y146.904 E.27618
G1 X113.828 Y146.768 E.013
G1 X107.229 Y140.168 E.28774
G1 X107.391 Y139.795 E.01254
G1 X114.206 Y146.611 E.29717
G1 X114.553 Y146.422 E.01216
G1 X107.573 Y139.443 E.30432
G1 X107.783 Y139.118 E.01193
G1 X114.884 Y146.219 E.30962
G1 X115.191 Y145.99 E.01179
G1 X108.012 Y138.811 E.313
G1 X108.216 Y138.561 E.00996
G1 X108.256 Y138.521 E.00175
G1 X115.476 Y145.74 E.31478
G1 X115.746 Y145.475 E.01167
G1 X108.526 Y138.255 E.31481
G1 X108.81 Y138.004 E.01169
G1 X115.993 Y145.188 E.31321
G1 X116.223 Y144.882 E.01178
G1 X109.122 Y137.781 E.30961
G1 X109.451 Y137.575 E.01197
G1 X116.426 Y144.55 E.30411
G1 X116.609 Y144.198 E.01223
G1 X109.798 Y137.387 E.29699
G1 X110.175 Y137.229 E.01261
G1 X116.772 Y143.826 E.28765
G1 X116.908 Y143.427 E.013
G1 X110.572 Y137.091 E.27626
G1 X111.005 Y136.989 E.01371
G1 X117.01 Y142.994 E.26183
G1 X117.079 Y142.527 E.01453
G1 X111.472 Y136.92 E.24447
G1 X111.652 Y136.898 E.00559
G1 X111.98 Y136.894 E.01013
G1 X117.106 Y142.02 E.2235
G1 X117.085 Y141.463 E.01717
G1 X112.539 Y136.917 E.19821
G1 X113.04 Y136.993 E.01562
G1 X113.189 Y137.033 E.00477
G1 X116.97 Y140.814 E.16485
G1 X116.841 Y140.354 E.01472
G1 X116.704 Y140.013 E.01135
G1 X113.984 Y137.293 E.11858
G1 X114.597 Y137.595 E.02104
G1 X115.06 Y137.903 E.01717
G1 X115.485 Y138.258 E.01706
G1 X116.552 Y139.326 E.04655
G1 X116.364 Y145.357 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X115.214 Y146.462 I-4.672 J-3.711 E.05305
G1 X109.915 Y151.761 E.24859
G3 X105.358 Y148.642 I6.484 J-14.36 E.18413
G1 X108.113 Y145.887 E.12922
G3 X106.587 Y142.967 I3.884 J-3.888 E.111
G1 X100.95 Y137.33 E.26443
G1 X100.95 Y137.698 E.01219
G1 X108.449 Y130.199 E.35177
G2 X110.149 Y131.177 I3.567 J-4.234 E.06542
G1 X122.732 Y143.763 E.59035
G2 X123.761 Y145.591 I5.703 J-2.008 E.06993
G1 X116.302 Y153.05 E.3499
G1 X116.67 Y153.05 E.01219
G1 X111.042 Y147.421 E.26403
G3 X109.503 Y146.905 I1.226 J-6.201 E.05397
G1 X101.671 Y142.56 F30000
G1 F15476.087
G2 X102.239 Y144.085 I13.704 J-4.237 E.054
G1 X107.539 Y138.773 E.24891
G3 X108.617 Y137.658 I5.067 J3.821 E.05156
G1 X109.311 Y130.542 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421603
G1 F15000
G3 X108.034 Y129.228 I13.094 J-14.006 E.05657
G1 X107.706 Y128.776 E.01722
G1 X107.56 Y128.536 E.00865
G1 X107.291 Y127.986 E.01892
G1 X110.019 Y130.714 E.11907
G1 X110.553 Y130.905 E.01748
G1 X110.805 Y130.964 E.00799
G1 X107.036 Y127.195 E.16448
G1 X106.979 Y126.971 E.00714
G1 X106.921 Y126.545 E.01326
G1 X111.453 Y131.077 E.1978
G1 X111.652 Y131.102 E.00616
G1 X112.018 Y131.107 E.01132
G1 X106.888 Y125.977 E.22387
G1 X106.92 Y125.473 E.01558
G1 X112.531 Y131.084 E.24486
M73 P51 R11
G1 X112.996 Y131.013 E.01452
G1 X106.991 Y125.008 E.26205
G1 X107.095 Y124.577 E.01369
G1 X113.423 Y130.905 E.27615
G1 X113.823 Y130.769 E.01303
G1 X107.227 Y124.173 E.28787
G1 X107.389 Y123.8 E.01256
G1 X114.2 Y130.611 E.29724
G1 X114.553 Y130.428 E.01226
G1 X107.571 Y123.446 E.30469
G1 X107.781 Y123.121 E.01195
G1 X114.878 Y130.218 E.30971
G1 X115.187 Y129.991 E.01182
G1 X108.01 Y122.814 E.31321
G1 X108.254 Y122.523 E.01173
G1 X115.479 Y129.747 E.31527
G1 X115.49 Y129.737 E.00047
G1 X115.744 Y129.477 E.01122
G1 X108.524 Y122.257 E.31509
G1 X108.808 Y122.006 E.01171
G1 X115.992 Y129.189 E.31348
G1 X116.217 Y128.879 E.01183
G1 X109.121 Y121.783 E.30969
G1 X109.449 Y121.576 E.01199
G1 X116.428 Y128.554 E.30453
G1 X116.608 Y128.199 E.01229
G1 X109.796 Y121.387 E.29728
G1 X110.174 Y121.229 E.01263
G1 X116.772 Y127.827 E.28793
G1 X116.908 Y127.427 E.01303
G1 X110.577 Y121.096 E.27629
G1 X111.002 Y120.986 E.01356
G1 X117.01 Y126.994 E.26216
G1 X117.079 Y126.527 E.01455
G1 X111.472 Y120.92 E.24469
G1 X111.652 Y120.898 E.00559
G1 X111.981 Y120.894 E.01015
G1 X117.106 Y126.019 E.22367
G1 X117.085 Y125.462 E.01719
G1 X112.54 Y120.918 E.19833
G1 X113.04 Y120.993 E.0156
G1 X113.191 Y121.033 E.00483
G1 X116.97 Y124.812 E.16489
G1 X116.841 Y124.354 E.01467
G1 X116.703 Y124.009 E.01146
G1 X113.988 Y121.294 E.1185
G1 X114.597 Y121.595 E.02099
G1 X115.061 Y121.904 E.0172
G1 X115.489 Y122.262 E.0172
G3 X116.55 Y123.321 I-77.127 J78.303 E.04625
G1 X123.932 Y122.219 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X123.339 Y122.985 I3.669 J3.454 E.03218
G1 X108.783 Y137.541 E.68283
G1 X100.95 Y129.654 E.36872
G1 X100.95 Y130.022 E.01219
G1 X106.815 Y124.157 E.27513
G2 X106.822 Y127.85 I5.095 J1.837 E.12501
G1 X100.95 Y121.978 E.27546
G1 X100.95 Y122.346 E.01219
G1 X108.783 Y114.459 E.36872
G1 X123.345 Y129.021 E.68314
G2 X124.073 Y129.927 I5.338 J-3.542 E.03859
G1 X115.889 Y138.111 E.38395
G2 X114.585 Y137.147 I-3.549 J3.433 E.05401
G1 X124.219 Y130.068 F30000
G1 F15476.087
G2 X124.979 Y130.655 I3.14 J-3.28 E.03189
G1 X139.187 Y144.863 E.66652
G2 X139.442 Y145.262 I2.733 J-1.464 E.01574
G1 X131.654 Y153.05 E.36533
G1 X132.022 Y153.05 E.01219
G1 X126.242 Y147.27 E.27114
G2 X129.77 Y147.258 I1.746 J-5.341 E.11903
G1 X123.978 Y153.05 E.27168
G1 X124.346 Y153.05 E.01219
G1 X116.484 Y145.192 E.36872
G1 X131.116 Y130.6 E.68549
G2 X131.777 Y130.065 I-5.108 J-6.984 E.02823
G1 X125.301 Y130.597 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425079
G1 F15000
G1 X124.231 Y129.527 E.0471
G1 X123.89 Y129.125 E.01642
G1 X123.575 Y128.662 E.01744
G1 X123.239 Y127.995 E.02325
G1 X126.005 Y130.761 E.12181
G1 X126.618 Y130.975 E.02022
G1 X126.8 Y131.015 E.0058
G1 X122.985 Y127.2 E.16803
G1 X122.906 Y126.843 E.01138
G1 X122.873 Y126.548 E.00923
G1 X127.452 Y131.127 E.20164
G1 X127.721 Y131.156 E.00843
G1 X128.022 Y131.156 E.00936
G1 X122.844 Y125.978 E.22803
G1 X122.844 Y125.721 E.00801
G1 X122.872 Y125.466 E.008
G1 X128.534 Y131.128 E.24939
G1 X129.005 Y131.058 E.01481
G1 X122.942 Y124.995 E.26702
G1 X123.045 Y124.558 E.01399
G1 X129.442 Y130.955 E.28172
G1 X129.846 Y130.819 E.01328
G1 X123.181 Y124.154 E.29353
G1 X123.347 Y123.779 E.01277
G1 X130.224 Y130.657 E.3029
G1 X130.578 Y130.469 E.01245
G1 X123.532 Y123.424 E.31027
G1 X123.737 Y123.088 E.01225
G1 X130.912 Y130.263 E.31599
G1 X131.219 Y130.03 E.01201
G1 X123.97 Y122.78 E.31926
G1 X124.218 Y122.488 E.01194
G1 X131.508 Y129.779 E.32107
G1 X131.782 Y129.512 E.0119
G1 X124.492 Y122.221 E.32108
G1 X124.781 Y121.97 E.01193
G1 X132.03 Y129.22 E.31926
G1 X132.258 Y128.907 E.01204
G1 X125.088 Y121.737 E.31578
G1 X125.424 Y121.533 E.01225
G1 X132.471 Y128.579 E.31035
G1 X132.653 Y128.221 E.01251
G1 X125.774 Y121.342 E.30296
G1 X126.154 Y121.181 E.01284
G1 X132.819 Y127.846 E.29353
G1 X132.955 Y127.442 E.01328
G1 X126.558 Y121.045 E.28173
G1 X126.995 Y120.942 E.01399
G1 X133.058 Y127.005 E.26703
G1 X133.128 Y126.535 E.01481
G1 X127.465 Y120.872 E.24939
G1 X127.72 Y120.844 E.00797
G1 X127.978 Y120.844 E.00804
G1 X133.156 Y126.022 E.22803
G1 X133.156 Y125.721 E.00937
G1 X133.127 Y125.452 E.00842
G1 X128.548 Y120.873 E.20166
G1 X128.836 Y120.905 E.00902
G1 X129.2 Y120.985 E.0116
G1 X133.015 Y124.8 E.16804
G1 X132.893 Y124.351 E.01449
G1 X132.752 Y123.996 E.0119
G1 X130 Y121.244 E.12121
G1 X130.418 Y121.438 E.01435
G1 X130.662 Y121.576 E.00874
G1 X131.125 Y121.89 E.01742
G1 X131.526 Y122.23 E.01639
G1 X132.597 Y123.301 E.04715
G1 X131.781 Y121.932 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X131.021 Y121.345 I-3.142 J3.283 E.03188
G1 X116.472 Y106.796 E.68255
G1 X124.345 Y98.951 E.36868
G1 X123.979 Y98.951 E.01214
G1 X129.77 Y104.742 E.27164
G2 X126.242 Y104.73 I-1.781 J5.324 E.11903
G1 X132.02 Y98.952 E.27106
G1 X131.656 Y98.952 E.01209
G1 X139.436 Y106.745 E.36529
G2 X139.187 Y107.137 I3.531 J2.521 E.01543
G1 X124.985 Y121.339 E.66623
G2 X124.075 Y122.075 I3.375 J5.099 E.03887
G1 X115.889 Y113.889 E.38406
G2 X116.852 Y112.585 I-3.431 J-3.545 E.05402
G1 X116.542 Y107.316 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421537
G1 F15000
G1 X115.484 Y106.257 E.04619
G1 X115.062 Y105.905 E.01695
G1 X114.597 Y105.595 E.01726
G1 X113.977 Y105.286 E.02135
G1 X116.705 Y108.014 E.119
G1 X116.841 Y108.354 E.01132
G1 X116.971 Y108.815 E.01477
G1 X113.187 Y105.032 E.16508
G1 X112.766 Y104.944 E.01327
G1 X112.543 Y104.923 E.00692
G1 X117.085 Y109.465 E.19818
G1 X117.106 Y110.021 E.01718
G1 X111.978 Y104.894 E.22373
G1 X111.466 Y104.916 E.01583
G1 X117.084 Y110.535 E.24514
G1 X117.011 Y110.997 E.01443
G1 X111.005 Y104.991 E.26204
G1 X110.575 Y105.097 E.01365
G1 X116.903 Y111.425 E.27611
G1 X116.769 Y111.826 E.01305
G1 X110.173 Y105.23 E.28782
G1 X109.795 Y105.388 E.01263
G1 X116.612 Y112.204 E.29742
G1 X116.425 Y112.553 E.0122
G1 X109.448 Y105.576 E.3044
G1 X109.283 Y105.668 E.00583
G1 X109.12 Y105.783 E.00617
G1 X116.216 Y112.88 E.30965
G1 X115.993 Y113.192 E.01184
G1 X108.808 Y106.007 E.31348
G1 X108.523 Y106.258 E.01171
G1 X115.742 Y113.476 E.31495
G1 X115.478 Y113.748 E.01168
G1 X108.254 Y106.523 E.31521
G1 X108.009 Y106.814 E.01173
G1 X115.186 Y113.992 E.31315
G1 X114.878 Y114.218 E.01182
G1 X107.781 Y107.121 E.30965
G1 X107.571 Y107.447 E.01195
G1 X114.552 Y114.428 E.30462
G1 X114.2 Y114.611 E.01226
G1 X107.39 Y107.802 E.2971
G1 X107.225 Y108.172 E.01251
G1 X113.823 Y114.77 E.28785
G1 X113.426 Y114.909 E.01296
G1 X107.093 Y108.576 E.27633
G1 X106.986 Y109.004 E.01362
G1 X112.991 Y115.009 E.26203
G1 X112.765 Y115.056 E.00713
G1 X112.526 Y115.079 E.00741
G1 X106.919 Y109.472 E.24465
G1 X106.893 Y109.981 E.01574
G1 X112.018 Y115.107 E.22363
G1 X111.652 Y115.102 E.0113
G1 X111.453 Y115.077 E.00617
G1 X106.922 Y110.546 E.19771
G1 X106.934 Y110.697 E.00467
G1 X107.029 Y111.188 E.01545
G1 X110.804 Y114.964 E.16474
G1 X110.553 Y114.905 E.00798
G1 X110.019 Y114.714 E.01749
G1 X107.291 Y111.986 E.11904
G1 X107.56 Y112.537 E.01892
G1 X107.706 Y112.776 E.00865
G1 X108.032 Y113.226 E.01715
G2 X109.311 Y114.542 I14.358 J-12.676 E.05663
G1 X108.617 Y114.342 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X108.593 Y114.325 E.00098
G3 X107.542 Y113.218 I3.746 J-4.609 E.05079
G1 X102.239 Y107.915 E.24875
G2 X101.663 Y109.437 I15.475 J6.734 E.054
G1 X107.102 Y107.502 F30000
G1 F15476.087
G2 X106.583 Y109.038 I4.603 J2.413 E.054
G1 X100.95 Y114.67 E.26422
G1 X100.95 Y114.302 E.01219
G1 X108.446 Y121.798 E.35163
G3 X110.162 Y120.81 I3.803 J4.624 E.06598
G1 X122.742 Y108.23 E.59014
G3 X123.766 Y106.414 I5.259 J1.77 E.06959
G1 X116.302 Y98.95 E.35015
G1 X116.67 Y98.95 E.01219
G1 X111.032 Y104.588 E.26446
G2 X108.112 Y106.112 I.968 J5.413 E.11098
G1 X105.362 Y103.362 E.129
G3 X109.915 Y100.239 I10.675 J10.682 E.18418
G1 X115.204 Y105.528 E.2481
G3 X116.348 Y106.634 I-2.86 J4.101 E.05302
G1 X125.3 Y114.597 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425082
G1 F15000
G1 X124.232 Y113.528 E.04706
G1 X123.89 Y113.125 E.01646
G1 X123.575 Y112.662 E.01744
G1 X123.314 Y112.169 E.01738
G1 X123.248 Y112.004 E.00551
G1 X125.996 Y114.752 E.121
G1 X126.351 Y114.893 E.01191
G1 X126.8 Y115.015 E.01449
G1 X122.98 Y111.196 E.16822
G1 X122.905 Y110.838 E.0114
G1 X122.873 Y110.548 E.00907
G1 X127.452 Y115.127 E.20165
G1 X127.721 Y115.156 E.00843
G1 X128.022 Y115.156 E.00936
G1 X122.844 Y109.978 E.22802
G1 X122.844 Y109.72 E.00805
G1 X122.872 Y109.466 E.00796
G1 X128.534 Y115.128 E.24939
G1 X129.005 Y115.058 E.01481
G1 X122.942 Y108.995 E.26702
G1 X123.045 Y108.558 E.01399
G1 X129.442 Y114.955 E.28172
G1 X129.846 Y114.819 E.01328
G1 X123.181 Y108.154 E.29353
G1 X123.343 Y107.776 E.01282
G1 X130.226 Y114.658 E.3031
G1 X130.576 Y114.468 E.01241
G1 X123.531 Y107.422 E.31027
G1 X123.742 Y107.093 E.01218
G1 X130.912 Y114.263 E.31578
G1 X131.219 Y114.03 E.01201
G1 X123.97 Y106.78 E.31926
G1 X124.218 Y106.488 E.01194
G1 X131.508 Y113.779 E.32108
G1 X131.782 Y113.512 E.0119
G1 X124.491 Y106.221 E.32108
G1 X124.778 Y105.967 E.01192
G1 X132.03 Y113.22 E.3194
G1 X132.258 Y112.907 E.01205
G1 X125.093 Y105.742 E.31557
G1 X125.422 Y105.531 E.01218
G1 X132.469 Y112.578 E.31035
G1 X132.656 Y112.225 E.01245
G1 X125.775 Y105.343 E.30305
G1 X126.157 Y105.184 E.01287
G1 X132.819 Y111.846 E.2934
G1 X132.955 Y111.442 E.01328
G1 X126.561 Y105.048 E.28158
G1 X126.993 Y104.94 E.01388
G1 X133.058 Y111.005 E.2671
G1 X133.128 Y110.535 E.01481
G1 X127.459 Y104.865 E.24968
G1 X127.978 Y104.844 E.01617
G1 X133.156 Y110.022 E.22805
G1 X133.135 Y109.46 E.01751
G1 X128.548 Y104.873 E.20201
G1 X128.836 Y104.905 E.00902
G1 X129.2 Y104.985 E.0116
G1 X133.019 Y108.804 E.1682
G1 X132.894 Y108.354 E.01454
G1 X132.752 Y107.996 E.01199
G1 X130 Y105.244 E.12121
G1 X130.419 Y105.438 E.0144
G1 X130.897 Y105.726 E.01738
G1 X131.342 Y106.064 E.0174
G1 X132.597 Y107.301 E.05487
G1 X139.873 Y106.212 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X141.133 Y105.191 I3.755 J3.345 E.05403
G1 X146.083 Y100.241 E.23223
G3 X150.634 Y103.366 I-6.234 J13.952 E.18413
G1 X147.961 Y106.039 E.12539
G2 X144.843 Y104.463 I-3.919 J3.879 E.11792
G1 X139.333 Y98.953 E.2585
M73 P51 R10
G1 X139.695 Y98.953 E.01204
G1 X132.234 Y106.414 E.35004
G3 X133.27 Y108.242 I-4.439 J3.725 E.07009
G1 X145.688 Y120.66 E.58253
G3 X147.621 Y121.731 I-1.588 J5.149 E.07385
G1 X155.044 Y114.308 E.34822
G1 X155.044 Y114.664 E.01183
G1 X149.535 Y109.115 E.2594
G2 X149.068 Y107.608 I-6.364 J1.149 E.05246
G1 X148.624 Y107.259 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.428747
G1 F15000
G1 X147.567 Y106.201 E.04703
G1 X147.188 Y105.875 E.01572
G1 X146.727 Y105.556 E.01763
G1 X146.236 Y105.29 E.01755
G1 X146.01 Y105.19 E.00775
G1 X148.8 Y107.98 E.12405
G1 X148.945 Y108.35 E.01247
G1 X149.068 Y108.793 E.01447
G1 X145.211 Y104.937 E.17149
G1 X144.905 Y104.866 E.00987
G1 X144.551 Y104.823 E.0112
G1 X149.177 Y109.448 E.20567
G1 X149.206 Y109.721 E.00862
G1 X149.205 Y110.022 E.00948
G1 X143.976 Y104.793 E.23251
G1 X143.79 Y104.791 E.00586
G1 X143.459 Y104.822 E.01044
G1 X149.178 Y110.541 E.25429
G1 X149.146 Y110.836 E.00932
G1 X149.107 Y111.015 E.00578
G1 X142.985 Y104.894 E.27219
G1 X142.545 Y104.999 E.01422
G1 X149.004 Y111.458 E.28717
G1 X148.862 Y111.862 E.01346
G1 X142.133 Y105.133 E.29918
G1 X141.755 Y105.3 E.01301
G1 X148.701 Y112.246 E.30882
G1 X148.512 Y112.603 E.01269
G1 X141.399 Y105.49 E.31625
G1 X141.06 Y105.697 E.01248
G1 X148.3 Y112.936 E.32189
G1 X148.068 Y113.251 E.01227
G1 X140.75 Y105.932 E.3254
G1 X140.506 Y106.132 E.00992
G1 X140.455 Y106.183 E.00226
G1 X147.819 Y113.547 E.32746
G1 X147.543 Y113.816 E.01213
G1 X140.183 Y106.457 E.32722
G1 X139.932 Y106.751 E.01217
G1 X147.249 Y114.068 E.32535
G1 X146.94 Y114.304 E.01224
G1 X139.698 Y107.063 E.32199
G1 X139.486 Y107.397 E.01243
G1 X146.601 Y114.512 E.31635
G1 X146.248 Y114.704 E.01265
G1 X139.301 Y107.757 E.30886
G1 X139.137 Y108.139 E.01306
G1 X145.862 Y114.864 E.29903
G1 X145.458 Y115.005 E.01347
G1 X138.996 Y108.543 E.28733
G1 X138.893 Y108.986 E.01431
G1 X145.016 Y115.109 E.27222
G1 X144.54 Y115.179 E.01512
G1 X138.821 Y109.459 E.2543
G1 X138.791 Y109.976 E.01626
G1 X144.022 Y115.206 E.23257
G1 X143.79 Y115.209 E.00731
G1 X143.447 Y115.177 E.01081
G1 X138.821 Y110.551 E.20569
G1 X138.878 Y110.973 E.0134
G1 X138.928 Y111.204 E.00742
G1 X142.791 Y115.067 E.17175
G1 X142.415 Y114.967 E.01222
G1 X141.981 Y114.802 E.01461
G1 X139.204 Y112.025 E.12348
G1 X139.32 Y112.299 E.00935
G1 X139.593 Y112.786 E.01756
G1 X139.917 Y113.242 E.01759
G1 X140.241 Y113.608 E.01535
G1 X141.272 Y114.638 E.04582
G1 X147.801 Y114.112 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X148.823 Y112.852 I-3.526 J-3.909 E.05402
G1 X153.757 Y107.919 E.23144
G3 X154.33 Y109.442 I-9.065 J4.277 E.05403
G1 X148.642 Y123.276 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.428549
G1 F15000
G1 X147.567 Y122.201 E.04777
G1 X147.188 Y121.875 E.0157
G1 X146.727 Y121.557 E.0176
G1 X146.484 Y121.416 E.00883
G1 X146.013 Y121.193 E.01638
G1 X148.799 Y123.979 E.12384
G1 X148.945 Y124.349 E.01249
G1 X149.067 Y124.793 E.01446
G1 X145.212 Y120.937 E.17135
G1 X144.905 Y120.866 E.00989
G1 X144.552 Y120.823 E.01116
G1 X149.184 Y125.455 E.20585
G1 X149.212 Y126.028 E.01803
G1 X143.977 Y120.793 E.23264
G1 X143.456 Y120.818 E.01638
G1 X149.184 Y126.546 E.25455
G1 X149.109 Y127.016 E.01497
G1 X142.981 Y120.888 E.27232
G1 X142.547 Y120.999 E.0141
G1 X149 Y127.452 E.28678
G1 X148.863 Y127.86 E.01353
G1 X142.14 Y121.137 E.29876
G1 X141.757 Y121.3 E.01307
G1 X148.702 Y128.244 E.30861
G1 X148.514 Y128.602 E.01269
G1 X141.396 Y121.484 E.31634
G1 X141.065 Y121.699 E.01239
G1 X148.304 Y128.938 E.32172
G1 X148.07 Y129.249 E.01224
G1 X140.752 Y121.931 E.32522
G1 X140.455 Y122.179 E.01217
G1 X147.817 Y129.541 E.32717
M73 P52 R10
G1 X147.547 Y129.816 E.01212
G1 X140.185 Y122.455 E.32713
G1 X139.929 Y122.744 E.01214
G1 X147.254 Y130.069 E.3255
G1 X146.938 Y130.298 E.01227
G1 X139.701 Y123.062 E.32159
G1 X139.491 Y123.397 E.01243
G1 X146.607 Y130.513 E.31624
G1 X146.246 Y130.697 E.01274
G1 X139.3 Y123.75 E.3087
G1 X139.137 Y124.133 E.01306
G1 X145.866 Y130.863 E.29907
G1 X145.462 Y131.004 E.01346
G1 X139.002 Y124.543 E.28711
G1 X138.938 Y124.753 E.00688
G1 X138.894 Y124.981 E.00731
G1 X145.02 Y131.107 E.27221
G1 X144.549 Y131.181 E.01499
G1 X138.817 Y125.45 E.25469
G1 X138.793 Y125.971 E.01638
G1 X144.034 Y131.212 E.23291
G1 X143.46 Y131.183 E.01806
G1 X138.821 Y126.544 E.20616
G1 X138.833 Y126.698 E.00487
G1 X138.928 Y127.197 E.01594
G1 X142.798 Y131.067 E.17199
G1 X142.416 Y130.967 E.01243
G1 X141.989 Y130.803 E.01435
G1 X139.187 Y128.001 E.12456
G1 X139.45 Y128.545 E.01902
G1 X139.75 Y129.019 E.01762
G1 X140.096 Y129.455 E.01748
G1 X141.275 Y130.634 E.0524
G1 X139.729 Y129.623 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X131.591 Y137.761 E.38176
G2 X124.409 Y137.761 I-3.591 J4.241 E.25903
G1 X116.198 Y129.55 E.38518
G2 X116.198 Y122.45 I-4.199 J-3.55 E.25605
G1 X124.41 Y114.238 E.38521
G2 X131.591 Y114.239 I3.591 J-4.271 E.25879
G1 X139.73 Y122.378 E.38181
G1 X139.073 Y139.341 F30000
G1 F15476.087
G3 X140.037 Y138.037 I4.677 J2.45 E.05402
G1 X131.925 Y129.925 E.38058
G2 X132.655 Y129.021 I-4.203 J-4.145 E.03861
G1 X146.867 Y114.809 E.66672
G2 X147.26 Y114.556 I-1.069 J-2.091 E.01551
G1 X155.046 Y122.342 E.36527
G1 X155.046 Y121.982 E.01195
G1 X149.342 Y127.685 E.26756
G2 X149.342 Y124.315 I-5.265 J-1.685 E.11363
G1 X155.048 Y130.02 E.26765
G1 X155.048 Y129.656 E.01207
G1 X147.26 Y137.444 E.36535
G1 X147.193 Y137.393 E.00278
G2 X146.867 Y137.191 I-2.037 J2.932 E.01272
G1 X132.655 Y122.979 E.66675
G2 X131.927 Y122.073 I-5.338 J3.543 E.03859
G1 X140.017 Y113.945 E.38042
G3 X139.073 Y112.659 I4.364 J-4.195 E.05309
G1 X132.597 Y139.301 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425084
G1 F15000
G1 X131.342 Y138.064 E.05486
G1 X130.897 Y137.726 E.0174
G1 X130.419 Y137.438 E.01738
G1 X130 Y137.244 E.01439
G1 X132.752 Y139.996 E.1212
G1 X132.894 Y140.354 E.01198
G1 X133.016 Y140.801 E.01443
G1 X129.2 Y136.985 E.16806
G1 X128.836 Y136.905 E.01161
G1 X128.548 Y136.873 E.00902
G1 X133.127 Y141.452 E.20166
G1 X133.156 Y141.72 E.0084
G1 X133.162 Y142.028 E.00958
G1 X127.978 Y136.844 E.22832
G1 X127.459 Y136.865 E.01617
G1 X133.134 Y142.54 E.24994
G1 X133.06 Y143.007 E.0147
G1 X126.994 Y136.94 E.26717
G1 X126.561 Y137.048 E.01388
G1 X132.952 Y143.439 E.28144
G1 X132.816 Y143.843 E.01329
G1 X126.157 Y137.184 E.29327
G1 X125.774 Y137.342 E.01289
G1 X132.656 Y144.225 E.3031
G1 X132.469 Y144.578 E.01245
G1 X125.424 Y137.533 E.31028
G1 X125.102 Y137.726 E.01171
G1 X125.088 Y137.737 E.00054
G1 X132.258 Y144.907 E.31579
G1 X132.033 Y145.222 E.01206
G1 X124.781 Y137.97 E.31937
G1 X124.492 Y138.221 E.01193
G1 X131.783 Y145.513 E.32112
G1 X131.508 Y145.779 E.0119
G1 X124.218 Y138.488 E.32108
G1 X123.97 Y138.781 E.01194
G1 X131.219 Y146.03 E.31926
G1 X130.912 Y146.263 E.01201
G1 X123.737 Y139.089 E.31597
G1 X123.532 Y139.424 E.01224
G1 X130.576 Y146.468 E.3102
G1 X130.221 Y146.653 E.01247
G1 X123.347 Y139.779 E.30277
G1 X123.181 Y140.154 E.01277
G1 X129.846 Y146.819 E.29353
G1 X129.442 Y146.955 E.01328
G1 X123.045 Y140.558 E.28173
G1 X122.942 Y140.995 E.01399
G1 X129.005 Y147.058 E.26702
G1 X128.534 Y147.128 E.01481
G1 X122.872 Y141.466 E.24939
G1 X122.844 Y141.721 E.008
G1 X122.844 Y141.978 E.00802
G1 X128.022 Y147.156 E.22803
G1 X127.46 Y147.135 E.01751
G1 X122.865 Y142.54 E.20235
G1 X122.981 Y143.197 E.02076
G1 X126.803 Y147.019 E.16834
G1 X126.352 Y146.893 E.0146
G1 X125.996 Y146.752 E.01193
G1 X123.248 Y144.004 E.121
G1 X123.314 Y144.169 E.00551
G1 X123.576 Y144.663 E.01741
G1 X123.887 Y145.122 E.01729
G1 X124.065 Y145.343 E.00884
G2 X125.3 Y146.597 I23.744 J-22.169 E.0548
G1 X141.274 Y146.633 F30000
; LINE_WIDTH: 0.428561
G1 F15000
G1 X140.098 Y145.458 E.05226
G1 X139.75 Y145.019 E.01758
G1 X139.45 Y144.545 E.01762
G1 X139.189 Y144.003 E.01891
G1 X141.989 Y146.803 E.12442
G1 X142.416 Y146.967 E.01437
G1 X142.798 Y147.067 E.01241
G1 X138.928 Y143.197 E.17196
G1 X138.833 Y142.698 E.01596
G1 X138.821 Y142.544 E.00485
G1 X143.46 Y147.183 E.20615
G1 X144.033 Y147.212 E.01806
G1 X138.793 Y141.971 E.2329
G1 X138.818 Y141.451 E.01637
G1 X144.548 Y147.181 E.25467
G1 X145.021 Y147.108 E.01503
G1 X138.894 Y140.981 E.27228
G1 X139.001 Y140.543 E.01417
G1 X145.462 Y147.004 E.28711
G1 X145.866 Y146.863 E.01346
G1 X139.136 Y140.133 E.29908
G1 X139.299 Y139.751 E.01306
G1 X146.246 Y146.697 E.3087
G1 X146.604 Y146.51 E.01271
G1 X139.491 Y139.397 E.31613
G1 X139.701 Y139.062 E.01243
G1 X146.942 Y146.303 E.3218
G1 X147.252 Y146.067 E.01223
G1 X139.929 Y138.744 E.32542
G1 X140.185 Y138.455 E.01214
G1 X147.548 Y145.818 E.32721
G1 X147.817 Y145.541 E.01212
G1 X140.459 Y138.183 E.32698
G1 X140.749 Y137.928 E.01214
G1 X148.073 Y145.252 E.32549
G1 X148.301 Y144.934 E.01228
G1 X141.064 Y137.698 E.32161
G1 X141.401 Y137.489 E.01245
G1 X148.514 Y144.602 E.31611
G1 X148.702 Y144.244 E.01269
G1 X141.754 Y137.297 E.30875
G1 X142.14 Y137.137 E.01312
G1 X148.863 Y143.86 E.29877
G1 X149 Y143.452 E.01353
G1 X142.547 Y136.999 E.2868
G1 X142.981 Y136.888 E.0141
G1 X149.109 Y143.016 E.27233
G1 X149.184 Y142.546 E.01497
G1 X143.456 Y136.818 E.25456
G1 X143.977 Y136.793 E.01638
G1 X149.212 Y142.028 E.23267
G1 X149.184 Y141.455 E.01803
G1 X144.552 Y136.823 E.20586
G1 X144.905 Y136.866 E.01117
G1 X145.211 Y136.937 E.00989
G1 X149.067 Y140.793 E.17136
G1 X148.945 Y140.35 E.01444
G1 X148.8 Y139.98 E.01248
G1 X146.013 Y137.193 E.12387
G1 X146.485 Y137.417 E.01643
G1 X146.961 Y137.709 E.01756
G1 X147.404 Y138.051 E.01758
G1 X148.624 Y139.259 E.05396
G1 X154.338 Y142.563 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X153.76 Y144.084 I-15.224 J-4.914 E.054
G1 X148.807 Y139.131 E.23233
G2 X147.788 Y137.87 I-4.515 J2.607 E.05402
G1 X146.39 Y147.062 F30000
G1 F15476.087
G3 X144.84 Y147.54 I-2.283 J-4.657 E.05402
G1 X139.33 Y153.05 E.25847
G1 X139.698 Y153.05 E.01219
G1 X132.239 Y145.591 E.3499
G2 X133.27 Y143.758 I-4.629 J-3.81 E.07012
G1 X145.688 Y131.34 E.58254
G2 X147.621 Y130.269 I-1.587 J-5.148 E.07385
G1 X155.05 Y137.698 E.34848
G1 X155.05 Y137.33 E.01218
G1 X149.534 Y142.846 E.25873
G3 X147.961 Y145.961 I-5.568 J-.858 E.1177
G1 X150.642 Y148.642 E.12576
G3 X146.085 Y151.761 I-10.763 J-10.834 E.18419
G1 X141.133 Y146.809 E.2323
G3 X139.873 Y145.788 I2.565 J-4.453 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X140.45 Y146.338 E-.30289
G1 X141.133 Y146.809 E-.31529
G1 X141.397 Y147.073 E-.14181
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
G17
G3 Z3.4 I.871 J-.85 P1  F30000
G1 X124.473 Y129.724 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X127.722 Y120.879 I3.524 J-3.724 E.39635
G1 X127.993 Y120.872 E.00898
G3 X124.517 Y129.765 I.004 J5.127 E.66132
; WIPE_START
G1 F24000
G1 X124.277 Y129.527 E-.12831
G1 X123.917 Y129.103 E-.211
G1 X123.606 Y128.644 E-.21101
G1 X123.347 Y128.156 E-.20968
; WIPE_END
G1 E-.04 F1800
G1 X124.565 Y120.622 Z3.6 F30000
G1 X125.554 Y114.499 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F15476.087
G1 X125.36 Y114.388 E.00743
G3 X127.742 Y104.879 I2.65 J-4.389 E.43304
G1 X128 Y104.872 E.00855
G3 X125.849 Y114.649 I.01 J5.127 E.60862
G1 X125.608 Y114.526 E.00898
; WIPE_START
G1 F24000
G1 X125.36 Y114.388 E-.10787
G1 X124.895 Y114.081 E-.2117
G1 X124.473 Y113.723 E-.21018
G1 X124.277 Y113.527 E-.10552
G1 X124.065 Y113.277 E-.12472
; WIPE_END
G1 E-.04 F1800
G1 X131.693 Y113.529 Z3.6 F30000
G1 X140.496 Y113.82 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F15476.087
G3 X143.792 Y104.826 I3.494 J-3.821 E.40574
G1 X144.049 Y104.823 E.00856
G3 X140.54 Y113.861 I-.059 J5.177 E.66283
; WIPE_START
G1 F24000
G1 X140.124 Y113.434 E-.22649
G1 X139.778 Y112.998 E-.21126
G1 X139.481 Y112.529 E-.21125
G1 X139.352 Y112.266 E-.111
; WIPE_END
G1 E-.04 F1800
G1 X139.55 Y119.896 Z3.6 F30000
G1 X139.785 Y128.993 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F15476.087
G3 X143.799 Y120.826 I4.218 J-2.997 E.36886
G1 X144.07 Y120.822 E.00899
G3 X139.821 Y129.042 I-.066 J5.174 E.69864
; WIPE_START
G1 F24000
G1 X139.481 Y128.529 E-.23385
G1 X139.236 Y128.03 E-.21125
G1 X139.134 Y127.771 E-.10565
G1 X138.974 Y127.244 E-.20925
; WIPE_END
G1 E-.04 F1800
G1 X131.409 Y128.26 Z3.6 F30000
G1 X111.067 Y130.99 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F15476.087
G1 X110.565 Y130.865 E.01715
G3 X111.653 Y120.934 I1.431 J-4.868 E.46929
G1 X111.924 Y120.923 E.00897
G3 X111.126 Y130.996 I.073 J5.074 E.56023
; WIPE_START
G1 F24000
G1 X110.565 Y130.865 E-.21895
G1 X110.041 Y130.685 E-.21063
G1 X109.788 Y130.571 E-.10542
G1 X109.302 Y130.302 E-.21076
G1 X109.272 Y130.281 E-.01424
; WIPE_END
G1 E-.04 F1800
G1 X110.18 Y122.703 Z3.6 F30000
G1 X111.104 Y114.995 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F15476.087
G3 X111.673 Y104.933 I.906 J-4.996 E.48774
G1 X111.931 Y104.922 E.00854
G3 X111.163 Y115.006 I.079 J5.077 E.56001
; WIPE_START
G1 F24000
G1 X110.563 Y114.871 E-.23346
G1 X110.041 Y114.685 E-.21075
G1 X109.788 Y114.571 E-.10543
G1 X109.303 Y114.303 E-.21037
; WIPE_END
G1 E-.04 F1800
G1 X108.746 Y121.915 Z3.6 F30000
G1 X106.673 Y150.245 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F15476.087
G1 X106.354 Y150 E.01334
G3 X100.602 Y137.996 I9.65 J-12.004 E.45661
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.401 J-.001 E.80255
G1 X140.184 Y98.605 E.80208
G3 X155.398 Y114.004 I-.184 J15.397 E.79632
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.401 J.001 E.80255
G1 X116.004 Y153.398 E.79585
G3 X107.018 Y150.505 I-.001 J-15.401 E.31828
G1 X106.721 Y150.281 E.01233
G1 X106.44 Y150.552 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X105.781 Y150.03 E.02581
G3 X100.21 Y137.999 I10.235 J-12.045 E.42042
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.794 J.002 E.76217
G1 X140.189 Y98.213 E.74322
G3 X155.79 Y114.001 I-.189 J15.789 E.75631
G1 X155.79 Y137.999 E.73736
G3 X155.459 Y141.209 I-16.813 J-.111 E.09933
G3 X139.999 Y153.79 I-15.474 J-3.226 E.66269
G1 X116.001 Y153.79 E.73736
G3 X112.791 Y153.459 I.111 J-16.813 E.09933
G3 X106.791 Y150.82 I3.226 J-15.474 E.20286
G1 X106.487 Y150.588 E.01174
M204 S10000
; WIPE_START
G1 F24000
G1 X105.781 Y150.03 E-.34201
G1 X104.969 Y149.288 E-.41799
; WIPE_END
G1 E-.04 F1800
G1 X109.503 Y146.905 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X109.599 Y146.955 E.00358
G2 X111.042 Y147.421 I2.714 J-5.926 E.05041
G1 X116.67 Y153.05 E.26403
G1 X116.302 Y153.05 E.01219
G1 X123.761 Y145.591 E.3499
G3 X122.73 Y143.758 I4.629 J-3.81 E.07012
G1 X110.019 Y131.047 E.59631
G3 X108.505 Y130.143 I2.08 J-5.204 E.05873
G1 X100.95 Y137.698 E.3544
G1 X100.95 Y137.33 E.01219
G1 X106.587 Y142.967 E.26443
G2 X108.113 Y145.887 I5.41 J-.968 E.111
G1 X105.364 Y148.636 E.12897
G2 X109.915 Y151.761 I10.643 J-10.627 E.18418
G1 X115.214 Y146.462 E.24859
G2 X116.364 Y145.357 I-3.522 J-4.816 E.05305
G1 X114.692 Y146.537 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421401
G1 F15000
G1 X115.695 Y145.534 E.04376
G1 X116.052 Y145.12 E.01686
G1 X116.218 Y144.891 E.00872
G1 X116.507 Y144.415 E.01718
G1 X116.708 Y143.986 E.01459
G1 X113.988 Y146.706 E.11862
G1 X113.581 Y146.863 E.01347
G1 X113.192 Y146.966 E.01239
G1 X116.965 Y143.193 E.16456
G1 X117.045 Y142.835 E.01132
G1 X117.077 Y142.547 E.00894
G1 X112.546 Y147.077 E.19759
G1 X112.21 Y147.109 E.01043
G1 X111.982 Y147.106 E.00703
G1 X117.106 Y141.982 E.22349
G1 X117.085 Y141.468 E.01588
G1 X111.473 Y147.08 E.24477
G1 X111.004 Y147.014 E.01462
G1 X117.011 Y141.007 E.26201
G1 X116.904 Y140.578 E.01362
G1 X110.578 Y146.904 E.27591
G1 X110.176 Y146.772 E.01307
G1 X116.77 Y140.177 E.28763
G1 X116.613 Y139.799 E.01263
G1 X109.798 Y146.614 E.29725
G1 X109.449 Y146.428 E.0122
G1 X116.427 Y139.45 E.30433
G1 X116.219 Y139.123 E.01196
G1 X109.12 Y146.221 E.3096
G1 X108.815 Y145.991 E.01179
G1 X115.995 Y138.811 E.31315
G1 X115.744 Y138.527 E.0117
G1 X108.526 Y145.745 E.31481
G1 X108.257 Y145.478 E.01167
G1 X115.481 Y138.255 E.31506
G1 X115.189 Y138.011 E.01172
G1 X108.012 Y145.189 E.31307
G1 X107.783 Y144.882 E.0118
G1 X114.881 Y137.784 E.30959
G1 X114.556 Y137.574 E.01194
G1 X107.573 Y144.557 E.30458
G1 X107.392 Y144.202 E.01227
G1 X114.204 Y137.391 E.29708
G1 X113.827 Y137.232 E.0126
G1 X107.232 Y143.828 E.28767
G1 X107.093 Y143.432 E.01294
G1 X113.428 Y137.096 E.27633
G1 X113.001 Y136.987 E.01357
G1 X106.992 Y142.997 E.2621
G1 X106.921 Y142.533 E.01447
G1 X112.537 Y136.917 E.24495
G1 X112.025 Y136.893 E.01578
G1 X106.891 Y142.027 E.22393
G1 X106.92 Y141.463 E.01741
G1 X111.461 Y136.922 E.19809
G1 X111.097 Y136.967 E.01132
G1 X110.814 Y137.034 E.00897
G1 X107.033 Y140.815 E.16493
G1 X107.116 Y140.487 E.01044
G1 X107.294 Y140.019 E.01543
G1 X110.019 Y137.294 E.11885
G1 X109.772 Y137.397 E.00825
G1 X109.284 Y137.667 E.01719
G1 X108.828 Y137.989 E.01721
G1 X108.612 Y138.169 E.00867
G2 X107.438 Y139.34 I85.148 J86.648 E.05113
G1 X108.617 Y137.658 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P53 R10
G1 F15476.087
G1 X108.595 Y137.673 E.00087
G2 X107.518 Y138.807 I4.041 J4.923 E.05201
G1 X102.239 Y144.085 E.24762
G3 X101.663 Y142.563 I15.476 J-6.735 E.054
G1 X107.765 Y129.39 F30000
G1 F15476.087
G3 X106.956 Y127.984 I5.65 J-4.185 E.05391
G1 X100.95 Y121.978 E.28175
G1 X100.95 Y122.346 E.01219
G1 X108.872 Y114.425 E.3716
G1 X106.609 Y110.562 F30000
G1 F15476.087
G3 X106.679 Y108.941 I10.832 J-.345 E.05385
G1 X100.95 Y114.67 E.26873
G1 X100.95 Y114.302 E.01219
G1 X108.502 Y121.854 E.35427
G3 X110.016 Y120.956 I5.247 J7.121 E.05849
G1 X122.868 Y108.104 E.60289
G3 X123.822 Y106.471 I5.215 J1.952 E.06308
G1 X116.302 Y98.95 E.35278
G1 X116.67 Y98.95 E.01219
G1 X110.934 Y104.686 E.26906
G2 X108.168 Y106.168 I1.074 J5.325 E.10561
G1 X105.362 Y103.362 E.13163
G2 X102.241 Y107.917 I10.637 J10.637 E.1842
G1 X123.647 Y129.323 E1.00421
G1 X123.988 Y129.724 E.01747
; WIPE_START
G1 F24000
G1 X123.647 Y129.323 E-.20012
G1 X122.605 Y128.281 E-.55988
; WIPE_END
G1 E-.04 F1800
G1 X123.988 Y122.276 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
G1 F15476.087
G1 X123.647 Y122.677 E.01746
G1 X108.783 Y137.541 E.6973
G1 X100.95 Y129.654 E.36872
G1 X100.95 Y130.022 E.01219
G1 X106.952 Y124.02 E.28155
G3 X107.766 Y122.618 I6.223 J2.675 E.05391
G1 X113.61 Y114.527 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.527 Y111.609 E.12677
G1 X116.72 Y110.883
G1 X112.878 Y114.725 E.16693
G1 X112.274 Y114.796
G1 X116.8 Y110.27 E.19669
G1 X116.8 Y109.736
G1 X111.739 Y114.797 E.21992
G1 X111.258 Y114.745
G1 X116.748 Y109.256 E.23855
G1 X116.654 Y108.816
G1 X110.815 Y114.655 E.25377
G1 X110.403 Y114.534
G1 X116.532 Y108.404 E.26636
G1 X116.379 Y108.024
G1 X110.023 Y114.38 E.27621
G1 X109.67 Y114.2
G1 X116.201 Y107.669 E.28381
G1 X116 Y107.336
G1 X109.339 Y113.998 E.28949
G1 X109.027 Y113.777
G1 X115.777 Y107.027 E.29332
G1 X115.528 Y106.743
G1 X108.742 Y113.529 E.29488
G1 X108.473 Y113.264
G1 X115.265 Y106.472 E.29513
G1 X114.974 Y106.229
G1 X108.227 Y112.977 E.2932
G1 X108.003 Y112.668
G1 X114.669 Y106.002 E.28969
G1 X114.337 Y105.801
G1 X107.8 Y112.337 E.28404
G1 X107.623 Y111.981
G1 X113.978 Y105.626 E.27615
G1 X113.599 Y105.472
G1 X107.47 Y111.6 E.26631
G1 X107.344 Y111.193
G1 X113.193 Y105.345 E.25415
G1 X112.751 Y105.253
G1 X107.255 Y110.749 E.23883
G1 X107.205 Y110.266
G1 X112.268 Y105.203 E.21999
G1 X111.736 Y105.201
G1 X107.205 Y109.733 E.1969
G1 X107.274 Y109.13
G1 X111.124 Y105.28 E.16733
G1 X110.406 Y105.465
G1 X107.467 Y108.404 E.12772
M204 S10000
G1 X109.901 Y105.676 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.111492
G1 F15000
G1 X109.761 Y105.781 E.00098
; LINE_WIDTH: 0.158189
G1 X109.621 Y105.887 E.00165
; LINE_WIDTH: 0.204887
G1 X109.481 Y105.993 E.00232
; LINE_WIDTH: 0.250114
G1 X109.283 Y106.159 E.00436
; LINE_WIDTH: 0.293869
G1 X109.086 Y106.325 E.00528
; LINE_WIDTH: 0.337225
G2 X108.535 Y106.858 I9.157 J10.016 E.01838
; LINE_WIDTH: 0.327771
G1 X108.363 Y107.049 E.00596
; LINE_WIDTH: 0.301169
G1 X108.191 Y107.24 E.0054
; LINE_WIDTH: 0.269897
G1 X108.085 Y107.372 E.00314
; LINE_WIDTH: 0.233956
G1 X107.978 Y107.504 E.00264
; LINE_WIDTH: 0.198015
G1 X107.871 Y107.636 E.00215
; LINE_WIDTH: 0.160615
G1 X107.792 Y107.743 E.00128
; LINE_WIDTH: 0.121753
G1 X107.712 Y107.85 E.00086
; LINE_WIDTH: 0.0951761
G1 X107.677 Y107.901 E.00026
; WIPE_START
G1 F24000
G1 X107.712 Y107.85 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.344 Y107.966 Z3.6 F30000
G1 X116.363 Y107.981 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.102398
G1 F15000
G1 X116.276 Y107.86 E.00072
G1 X116.316 Y112.114 F30000
; LINE_WIDTH: 0.112303
G1 F15000
G1 X116.214 Y112.255 E.00098
; LINE_WIDTH: 0.152742
G1 X116.131 Y112.362 E.00121
; LINE_WIDTH: 0.194359
G3 X116.024 Y112.502 I-1.892 J-1.327 E.00218
; LINE_WIDTH: 0.238245
G1 X115.887 Y112.671 E.00347
; LINE_WIDTH: 0.280974
G1 X115.72 Y112.867 E.00498
; LINE_WIDTH: 0.32488
G3 X114.812 Y113.768 I-7.47 J-6.621 E.02941
; LINE_WIDTH: 0.269913
G1 X114.621 Y113.929 E.00462
; LINE_WIDTH: 0.233144
G1 X114.513 Y114.012 E.00212
; LINE_WIDTH: 0.204137
G1 X114.418 Y114.09 E.00162
; LINE_WIDTH: 0.1712
G1 X114.307 Y114.172 E.00144
; LINE_WIDTH: 0.134688
G1 X114.208 Y114.249 E.00094
; LINE_WIDTH: 0.103448
G1 X114.118 Y114.311 E.00054
G1 X113.549 Y114.466 F30000
; LINE_WIDTH: 0.154686
G1 F15000
G1 X113.25 Y114.642 E.00316
G1 X113.547 Y114.464 F30000
; LINE_WIDTH: 0.202345
G1 F15000
G1 X113.255 Y114.65 E.00449
; WIPE_START
G1 F24000
G1 X113.547 Y114.464 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.14 Y109.076 Z3.6 F30000
G1 X107.528 Y108.466 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.102569
G1 F15000
G3 X107.358 Y108.755 I-11.331 J-6.476 E.00163
; WIPE_START
G1 F24000
G1 X107.528 Y108.466 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.041 Y107.117 Z3.6 F30000
G1 X116.428 Y106.868 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X124.345 Y98.951 E.37141
G1 X123.979 Y98.951 E.01214
G1 X129.896 Y104.868 E.27755
G3 X131.315 Y105.65 I-3.84 J8.643 E.05384
G1 X132.611 Y111.523 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X129.523 Y114.611 E.13418
G1 X128.82 Y114.781
G1 X132.788 Y110.814 E.17239
G1 X132.851 Y110.217
G1 X128.217 Y114.851 E.20133
G1 X127.688 Y114.846
G1 X132.846 Y109.688 E.22414
G1 X132.792 Y109.209
G1 X127.209 Y114.793 E.24264
G1 X126.772 Y114.696
G1 X132.697 Y108.771 E.2575
G1 X132.57 Y108.365
G1 X126.363 Y114.572 E.26971
G1 X125.984 Y114.418
G1 X132.418 Y107.984 E.2796
G1 X132.237 Y107.631
G1 X125.632 Y114.236 E.28702
G1 X125.299 Y114.036
G1 X132.036 Y107.299 E.29276
G1 X131.809 Y106.992
G1 X124.991 Y113.811 E.2963
G1 X124.704 Y113.565
G1 X131.565 Y106.704 E.29812
G1 X131.298 Y106.437
G1 X124.437 Y113.298 E.29814
G1 X124.191 Y113.011
G1 X131.01 Y106.192 E.29632
G1 X130.699 Y105.97
G1 X123.97 Y112.699 E.29242
G1 X123.766 Y112.369
G1 X130.372 Y105.763 E.28707
G1 X130.019 Y105.583
G1 X123.583 Y112.019 E.27969
G1 X123.431 Y111.638
G1 X129.636 Y105.433 E.26963
G1 X129.231 Y105.304
G1 X123.305 Y111.23 E.25751
G1 X123.208 Y110.794
G1 X128.794 Y105.208 E.24274
G1 X128.314 Y105.155
G1 X123.154 Y110.315 E.22423
G1 X123.149 Y109.786
G1 X127.787 Y105.148 E.20154
G1 X127.184 Y105.218
G1 X123.211 Y109.191 E.17263
G1 X123.388 Y108.482
G1 X126.482 Y105.388 E.13446
M204 S10000
G1 X126.004 Y105.573 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0925467
G1 F15000
G1 X125.967 Y105.597 E.00018
; LINE_WIDTH: 0.116769
G1 X125.859 Y105.677 E.00081
; LINE_WIDTH: 0.156464
G1 X125.752 Y105.757 E.00124
; LINE_WIDTH: 0.196159
G1 X125.644 Y105.836 E.00167
; LINE_WIDTH: 0.235854
G1 X125.536 Y105.916 E.00211
; LINE_WIDTH: 0.279977
G1 X125.338 Y106.08 E.00498
; LINE_WIDTH: 0.328531
G1 X125.139 Y106.245 E.006
; LINE_WIDTH: 0.378003
G2 X124.237 Y107.148 I6.714 J7.607 E.0349
; LINE_WIDTH: 0.332929
G1 X124.11 Y107.301 E.00469
; LINE_WIDTH: 0.291844
G2 X123.952 Y107.493 I3.455 J3 E.00505
; LINE_WIDTH: 0.24758
G2 X123.853 Y107.621 I2.166 J1.774 E.00269
; LINE_WIDTH: 0.203505
G1 X123.751 Y107.754 E.00219
; LINE_WIDTH: 0.159666
G1 X123.678 Y107.858 E.00121
; LINE_WIDTH: 0.11117
G2 X123.572 Y108.005 I1.94 J1.511 E.00101
; WIPE_START
G1 F24000
G1 X123.678 Y107.858 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.104 Y109.621 Z3.6 F30000
G1 X132.781 Y110.02 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.130917
G1 F15000
G1 X132.867 Y110.234 E.00165
G1 X132.425 Y112.002 F30000
; LINE_WIDTH: 0.110059
G1 F15000
G3 X132.322 Y112.144 I-3.678 J-2.538 E.00096
; LINE_WIDTH: 0.159138
G1 X132.244 Y112.256 E.00129
; LINE_WIDTH: 0.198245
G1 X132.165 Y112.357 E.00162
; LINE_WIDTH: 0.233458
G1 X132.085 Y112.464 E.00208
; LINE_WIDTH: 0.265106
G1 X132.004 Y112.563 E.00231
; LINE_WIDTH: 0.292853
G1 X131.925 Y112.664 E.00263
; LINE_WIDTH: 0.329329
G1 X131.757 Y112.861 E.00603
; LINE_WIDTH: 0.376453
G3 X130.856 Y113.762 I-7.347 J-6.453 E.03466
; LINE_WIDTH: 0.32432
G1 X130.656 Y113.927 E.00595
; LINE_WIDTH: 0.275007
G1 X130.456 Y114.092 E.0049
; LINE_WIDTH: 0.231221
G1 X130.352 Y114.169 E.00198
; LINE_WIDTH: 0.192963
G1 X130.248 Y114.245 E.00158
; LINE_WIDTH: 0.154706
G1 X130.145 Y114.322 E.00117
; LINE_WIDTH: 0.110095
G3 X130.002 Y114.425 I-1.158 J-1.459 E.00096
G1 X126.746 Y114.693 F30000
; LINE_WIDTH: 0.0955169
G1 F15000
G1 X126.593 Y114.609 E.00075
G1 X132.012 Y122.276 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.353 Y122.677 E.01747
G1 X146.867 Y137.191 E.6809
G3 X147.26 Y137.444 I-1.069 J2.09 E.01551
G1 X155.048 Y129.656 E.36535
G1 X155.048 Y130.02 E.01207
G1 X149.22 Y124.192 E.27341
G3 X149.22 Y127.808 I-5.797 J1.808 E.12182
G1 X155.046 Y121.982 E.27333
G1 X155.046 Y122.342 E.01195
G1 X147.203 Y114.499 E.36792
G3 X147.108 Y114.568 I-.366 J-.408 E.00391
G1 X132.353 Y129.323 E.69218
G1 X132.012 Y129.724 E.01747
G1 X132.612 Y127.521 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X129.52 Y130.613 E.13435
G1 X128.811 Y130.789
G1 X132.788 Y126.811 E.17284
G1 X132.851 Y126.215
G1 X128.216 Y130.85 E.20141
G1 X127.687 Y130.846
G1 X132.845 Y125.688 E.22417
G1 X132.792 Y125.207
G1 X127.207 Y130.792 E.24268
G1 X126.77 Y130.696
G1 X132.696 Y124.77 E.2575
G1 X132.569 Y124.364
G1 X126.362 Y130.571 E.26975
G1 X125.982 Y130.418
G1 X132.418 Y123.982 E.27967
G1 X132.235 Y123.631
G1 X125.631 Y130.236 E.28701
G1 X125.298 Y130.035
G1 X132.035 Y123.298 E.29276
G1 X131.809 Y122.991
G1 X124.991 Y129.809 E.29624
G1 X124.703 Y129.564
G1 X131.564 Y122.703 E.29813
G1 X131.297 Y122.436
G1 X124.436 Y129.297 E.29813
G1 X124.191 Y129.009
G1 X131.009 Y122.191 E.29624
G1 X130.702 Y121.965
G1 X123.969 Y128.698 E.29258
G1 X123.763 Y128.371
G1 X130.37 Y121.763 E.28714
G1 X130.018 Y121.583
G1 X123.582 Y128.018 E.27965
G1 X123.429 Y127.638
G1 X129.636 Y121.431 E.26975
G1 X129.23 Y121.304
G1 X123.304 Y127.23 E.25751
G1 X123.208 Y126.793
G1 X128.793 Y121.208 E.24269
G1 X128.313 Y121.154
G1 X123.155 Y126.312 E.22416
G1 X123.154 Y125.78
G1 X127.784 Y121.149 E.2012
G1 X127.189 Y121.212
G1 X123.217 Y125.184 E.1726
G1 X123.388 Y124.479
G1 X126.479 Y121.388 E.13431
M204 S10000
G1 X126.001 Y121.573 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.110628
G1 F15000
G2 X125.855 Y121.679 I3.424 J4.896 E.00099
; LINE_WIDTH: 0.16002
G1 X125.747 Y121.755 E.00126
; LINE_WIDTH: 0.200825
G1 X125.641 Y121.835 E.00171
; LINE_WIDTH: 0.236481
G1 X125.536 Y121.915 E.00209
; LINE_WIDTH: 0.278589
G1 X125.337 Y122.08 E.00496
; LINE_WIDTH: 0.327152
G1 X125.138 Y122.244 E.00598
; LINE_WIDTH: 0.376294
G2 X124.235 Y123.149 I6.867 J7.761 E.03476
; LINE_WIDTH: 0.327868
G1 X124.073 Y123.34 E.0058
; LINE_WIDTH: 0.289307
G1 X123.966 Y123.474 E.00344
; LINE_WIDTH: 0.247275
G2 X123.845 Y123.63 I1.46 J1.258 E.00329
; LINE_WIDTH: 0.201492
G1 X123.755 Y123.747 E.00191
; LINE_WIDTH: 0.161535
G1 X123.677 Y123.855 E.00128
; LINE_WIDTH: 0.118714
G1 X123.6 Y123.962 E.00082
; LINE_WIDTH: 0.0926439
G1 X123.574 Y124.001 E.00019
; WIPE_START
G1 F24000
G1 X123.6 Y123.962 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.048 Y125.63 Z3.6 F30000
G1 X132.781 Y126.018 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.128987
G1 F15000
G1 X132.867 Y126.232 E.00161
G1 X132.427 Y127.998 F30000
; LINE_WIDTH: 0.110868
G1 F15000
G3 X132.321 Y128.144 I-4.487 J-3.129 E.001
; LINE_WIDTH: 0.160141
G1 X132.245 Y128.253 E.00127
; LINE_WIDTH: 0.201024
G1 X132.165 Y128.358 E.0017
; LINE_WIDTH: 0.236461
G1 X132.086 Y128.463 E.00208
; LINE_WIDTH: 0.26665
G1 X132.002 Y128.564 E.00239
; LINE_WIDTH: 0.306536
G3 X131.839 Y128.761 I-2.981 J-2.3 E.00549
; LINE_WIDTH: 0.347961
G3 X131.67 Y128.955 I-3.093 J-2.531 E.0064
; LINE_WIDTH: 0.379457
M73 P54 R10
G3 X130.854 Y129.763 I-7.444 J-6.706 E.03151
; LINE_WIDTH: 0.327744
G1 X130.659 Y129.928 E.00592
; LINE_WIDTH: 0.295017
G1 X130.561 Y130.007 E.00259
; LINE_WIDTH: 0.267765
G1 X130.463 Y130.086 E.00231
; LINE_WIDTH: 0.234149
G1 X130.354 Y130.167 E.00212
; LINE_WIDTH: 0.199241
G1 X130.256 Y130.243 E.00157
; LINE_WIDTH: 0.16269
G1 X130.148 Y130.321 E.0013
; LINE_WIDTH: 0.11964
G1 X130.039 Y130.399 E.00083
; LINE_WIDTH: 0.0930018
G1 X129.999 Y130.426 E.0002
G1 X126.744 Y130.693 F30000
; LINE_WIDTH: 0.0960317
G1 F15000
G1 X126.592 Y130.608 E.00076
G1 X123.392 Y127.408 F30000
; LINE_WIDTH: 0.0959697
G1 F15000
G1 X123.307 Y127.256 E.00075
G1 X123.232 Y126.501 F30000
; LINE_WIDTH: 0.112381
G1 F15000
G2 X123.153 Y126.332 I-6.292 J2.843 E.00106
G1 X116.528 Y127.606 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.605 Y130.53 E.12705
G1 X112.879 Y130.722
G1 X116.72 Y126.881 E.16691
G1 X116.8 Y126.268
G1 X112.269 Y130.798 E.19687
G1 X111.736 Y130.799
G1 X116.8 Y125.735 E.22007
G1 X116.743 Y125.258
G1 X111.256 Y130.745 E.23843
G1 X110.811 Y130.657
G1 X116.653 Y124.815 E.25385
G1 X116.533 Y124.402
G1 X110.401 Y130.533 E.26644
G1 X110.024 Y130.377
G1 X116.379 Y124.023 E.27613
G1 X116.2 Y123.668
G1 X109.666 Y130.203 E.28396
G1 X109.338 Y129.997
G1 X115.999 Y123.336 E.28943
G1 X115.775 Y123.027
G1 X109.025 Y129.776 E.2933
G1 X108.741 Y129.528
G1 X115.53 Y122.739 E.29502
G1 X115.264 Y122.471
G1 X108.472 Y129.263 E.29513
G1 X108.227 Y128.975
G1 X114.976 Y122.226 E.29324
G1 X114.668 Y122.001
G1 X108.002 Y128.667 E.28967
G1 X107.801 Y128.335
G1 X114.333 Y121.802 E.28387
G1 X113.982 Y121.62
G1 X107.621 Y127.981 E.2764
G1 X107.472 Y127.597
G1 X113.6 Y121.469 E.26629
G1 X113.191 Y121.344
G1 X107.343 Y127.192 E.25411
G1 X107.255 Y126.747
G1 X112.75 Y121.253 E.23876
G1 X112.268 Y121.201
G1 X107.205 Y126.264 E.22
G1 X107.202 Y125.734
G1 X111.733 Y121.203 E.19691
G1 X111.13 Y121.272
G1 X107.274 Y125.128 E.16755
G1 X107.471 Y124.399
G1 X110.403 Y121.466 E.12745
M204 S10000
; WIPE_START
G1 F24000
G1 X108.989 Y122.88 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.451 Y130.105 Z3.6 F30000
G1 X111.662 Y130.726 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104462
G1 F15000
G1 X111.475 Y130.793 E.001
; WIPE_START
G1 F24000
G1 X111.662 Y130.726 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X116.311 Y128.117 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.109059
G1 F15000
G1 X116.216 Y128.252 E.00089
; LINE_WIDTH: 0.153528
G1 X116.13 Y128.361 E.00125
; LINE_WIDTH: 0.188281
G1 X116.058 Y128.459 E.00144
; LINE_WIDTH: 0.219683
G1 X115.967 Y128.569 E.00205
; LINE_WIDTH: 0.248381
G1 X115.888 Y128.669 E.00213
; LINE_WIDTH: 0.283974
G1 X115.716 Y128.871 E.00522
; LINE_WIDTH: 0.32493
G3 X114.81 Y129.768 I-7.647 J-6.808 E.02931
; LINE_WIDTH: 0.270958
G1 X114.621 Y129.928 E.0046
; LINE_WIDTH: 0.234547
G1 X114.513 Y130.012 E.00214
; LINE_WIDTH: 0.205491
G1 X114.418 Y130.09 E.00163
; LINE_WIDTH: 0.172585
G1 X114.307 Y130.171 E.00145
; LINE_WIDTH: 0.134949
G1 X114.201 Y130.253 E.001
; LINE_WIDTH: 0.103076
G1 X114.11 Y130.318 E.00055
G1 X116.644 Y127.247 F30000
; LINE_WIDTH: 0.166162
G1 F15000
G1 X116.465 Y127.543 E.00347
G1 X116.644 Y127.247 F30000
; LINE_WIDTH: 0.0980127
G1 F15000
G1 X116.471 Y127.549 E.00156
G1 X116.828 Y125.979 F30000
; LINE_WIDTH: 0.151798
G1 F15000
G1 X116.757 Y126.135 E.00152
G1 X116.816 Y126.284 E.00142
G1 X116.742 Y125.236 F30000
; LINE_WIDTH: 0.0930627
G1 F15000
G1 X116.66 Y125.075 E.00074
G1 X114.491 Y121.911 F30000
; LINE_WIDTH: 0.0980963
G1 F15000
G2 X114.39 Y121.832 I-.827 J.957 E.00058
G1 X109.897 Y121.678 F30000
; LINE_WIDTH: 0.110866
G1 F15000
G1 X109.761 Y121.78 E.00094
; LINE_WIDTH: 0.156258
G1 X109.625 Y121.883 E.00157
; LINE_WIDTH: 0.20165
G1 X109.489 Y121.985 E.0022
; LINE_WIDTH: 0.246531
G1 X109.292 Y122.151 E.00429
; LINE_WIDTH: 0.290902
G1 X109.094 Y122.318 E.00522
; LINE_WIDTH: 0.333661
G2 X108.534 Y122.858 I6.22 J6.996 E.01844
; LINE_WIDTH: 0.326753
G1 X108.366 Y123.045 E.00582
; LINE_WIDTH: 0.30094
G1 X108.197 Y123.232 E.00529
; LINE_WIDTH: 0.266683
G1 X108.065 Y123.395 E.00383
; LINE_WIDTH: 0.22398
G1 X107.932 Y123.557 E.0031
; LINE_WIDTH: 0.190896
G1 X107.871 Y123.635 E.00119
; LINE_WIDTH: 0.159657
G1 X107.792 Y123.742 E.00127
; LINE_WIDTH: 0.120643
G1 X107.712 Y123.85 E.00085
; LINE_WIDTH: 0.0945763
G1 X107.679 Y123.898 E.00025
G1 X114.527 Y114.793 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X115.833 Y113.833 I-4.765 J-7.839 E.05383
G1 X124.131 Y122.131 E.38931
G3 X124.638 Y121.686 I2.304 J2.109 E.02242
G1 X139.498 Y106.794 E.69786
G1 X131.656 Y98.952 E.3679
G1 X132.02 Y98.952 E.01208
G1 X126.103 Y104.869 E.27756
G2 X124.679 Y105.645 I4.671 J10.258 E.05386
G1 X111.438 Y99.664 F30000
G1 F15476.087
G2 X109.916 Y100.24 I3.485 J11.511 E.05403
G1 X131.323 Y121.647 E1.00424
G3 X131.871 Y122.129 I-2.685 J3.607 E.02423
G1 X140.093 Y113.907 E.38571
G3 X139.131 Y112.601 I8.231 J-7.071 E.05385
; WIPE_START
G1 F24000
G1 X139.672 Y113.438 E-.37864
G1 X140.093 Y113.907 E-.23951
G1 X139.829 Y114.171 E-.14184
; WIPE_END
G1 E-.04 F1800
G1 X147.296 Y112.589 Z3.6 F30000
G1 X148.287 Y112.379 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.369 Y114.297 E.08336
G1 X145.447 Y114.685
G1 X148.688 Y111.444 E.14084
G1 X148.848 Y110.751
G1 X144.751 Y114.848 E.17802
G1 X144.165 Y114.901
G1 X148.901 Y110.165 E.20576
G1 X148.893 Y109.64
G1 X143.643 Y114.89 E.22814
G1 X143.168 Y114.832
G1 X148.835 Y109.165 E.24626
G1 X148.734 Y108.732
G1 X142.727 Y114.739 E.26101
G1 X142.323 Y114.61
G1 X148.608 Y108.325 E.27312
G1 X148.456 Y107.944
G1 X141.946 Y114.453 E.28286
G1 X141.593 Y114.274
G1 X148.272 Y107.594 E.29025
G1 X148.072 Y107.261
G1 X141.263 Y114.07 E.29587
G1 X140.954 Y113.846
G1 X147.846 Y106.954 E.29948
G1 X147.596 Y106.671
G1 X140.666 Y113.6 E.30112
G1 X140.402 Y113.331
G1 X147.333 Y106.4 E.30118
G1 X147.045 Y106.155
G1 X140.153 Y113.047 E.29949
G1 X139.931 Y112.735
G1 X146.737 Y105.93 E.29573
G1 X146.406 Y105.727
G1 X139.725 Y112.409 E.29035
G1 X139.548 Y112.053
G1 X146.051 Y105.549 E.28261
G1 X145.673 Y105.394
G1 X139.389 Y111.678 E.27311
G1 X139.262 Y111.272
G1 X145.27 Y105.264 E.26107
G1 X144.836 Y105.165
G1 X139.17 Y110.831 E.24621
G1 X139.107 Y110.36
G1 X144.36 Y105.107 E.22825
G1 X143.837 Y105.097
G1 X139.096 Y109.838 E.20602
G1 X139.155 Y109.246
G1 X143.249 Y105.152 E.1779
G1 X142.555 Y105.312
G1 X139.31 Y108.557 E.14101
G1 X139.703 Y107.631
G1 X141.629 Y105.705 E.08368
M204 S10000
G1 X139.374 Y108.621 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.184804
G1 F15000
G3 X139.218 Y108.892 I-10.226 J-5.709 E.0036
; WIPE_START
G1 F24000
G1 X139.374 Y108.621 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.775 Y114.014 Z3.6 F30000
G1 X145.384 Y114.622 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.127039
G1 F15000
G1 X145.106 Y114.783 E.0022
G1 X148.523 Y111.913 F30000
; LINE_WIDTH: 0.159767
G1 F15000
G1 X148.355 Y112.14 E.00269
; LINE_WIDTH: 0.211285
G3 X148.226 Y112.318 I-1.793 J-1.171 E.00301
; WIPE_START
G1 F24000
G1 X148.355 Y112.14 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X145.448 Y105.352 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.100458
G1 F15000
G1 X145.297 Y105.268 E.00081
G1 X142.093 Y105.477 F30000
; LINE_WIDTH: 0.134776
G1 F15000
G1 X141.913 Y105.606 E.00166
; LINE_WIDTH: 0.18153
G1 X141.804 Y105.681 E.00149
; LINE_WIDTH: 0.213249
G1 X141.69 Y105.767 E.00198
G1 X146.474 Y105.063 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X144.934 Y104.554 I-2.63 J5.367 E.05397
G1 X139.333 Y98.953 E.26276
G1 X139.695 Y98.953 E.01203
G1 X132.178 Y106.471 E.35267
G3 X133.131 Y108.103 I-6.231 J4.735 E.06288
G1 X145.816 Y120.788 E.59508
G3 X147.565 Y121.787 I-1.663 J4.945 E.06722
G1 X155.044 Y114.308 E.35085
G1 X155.044 Y114.664 E.01183
G1 X149.446 Y109.066 E.26262
G2 X147.905 Y106.095 I-5.44 J.937 E.1128
G1 X150.634 Y103.366 E.12802
G2 X146.083 Y100.241 I-10.785 J10.826 E.18413
G1 X140.891 Y105.433 E.24359
G2 X139.703 Y106.537 I6.166 J7.83 E.05385
; WIPE_START
G1 F24000
G1 X140.295 Y105.899 E-.33095
G1 X140.891 Y105.433 E-.28723
G1 X141.155 Y105.169 E-.14183
; WIPE_END
G1 E-.04 F1800
G1 X148.415 Y107.524 Z3.6 F30000
G1 X154.33 Y109.442 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F15476.087
G2 X153.757 Y107.919 I-9.637 J2.754 E.05403
G1 X148.547 Y113.129 E.24441
G3 X147.442 Y114.315 I-7.346 J-5.736 E.05384
G1 X148.287 Y128.377 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.366 Y130.298 E.08347
G1 X145.444 Y130.686
G1 X148.685 Y127.446 E.14082
G1 X148.842 Y126.755
G1 X144.752 Y130.845 E.17773
G1 X144.161 Y130.903
G1 X148.899 Y126.165 E.20588
G1 X148.888 Y125.642
G1 X143.641 Y130.89 E.22804
G1 X143.166 Y130.831
G1 X148.83 Y125.168 E.24611
G1 X148.733 Y124.731
G1 X142.727 Y130.738 E.26102
G1 X142.322 Y130.609
G1 X148.607 Y124.324 E.2731
G1 X148.455 Y123.943
G1 X141.945 Y130.453 E.28288
G1 X141.591 Y130.273
G1 X148.271 Y123.593 E.29027
G1 X148.069 Y123.263
G1 X141.262 Y130.069 E.29577
G1 X140.954 Y129.844
G1 X147.843 Y122.955 E.29935
G1 X147.599 Y122.665
G1 X140.665 Y129.599 E.30131
G1 X140.401 Y129.33
G1 X147.331 Y122.401 E.30111
G1 X147.044 Y122.154
G1 X140.152 Y129.046 E.29948
G1 X139.931 Y128.734
G1 X146.736 Y121.929 E.29571
G1 X146.407 Y121.725
G1 X139.724 Y128.407 E.29039
G1 X139.545 Y128.053
G1 X146.054 Y121.544 E.28284
G1 X145.672 Y121.393
G1 X139.388 Y127.677 E.27306
G1 X139.263 Y127.268
G1 X145.268 Y121.264 E.26094
G1 X144.834 Y121.165
G1 X139.167 Y126.831 E.24624
G1 X139.107 Y126.359
G1 X144.358 Y121.107 E.22821
G1 X143.836 Y121.096
G1 X139.102 Y125.83 E.2057
G1 X139.154 Y125.245
G1 X143.24 Y121.159 E.17758
G1 X142.552 Y121.313
G1 X139.311 Y124.555 E.14087
G1 X139.721 Y123.611
G1 X141.62 Y121.713 E.08249
M204 S10000
G1 X139.375 Y124.619 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.183641
G1 F15000
G3 X139.219 Y124.889 I-10.205 J-5.695 E.00358
; WIPE_START
G1 F24000
G1 X139.375 Y124.619 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.289 Y130.6 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.090393
G1 F15000
G1 X142.15 Y130.514 E.00063
; WIPE_START
G1 F24000
G1 X142.289 Y130.6 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.524 Y127.91 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.161395
G1 F15000
G1 X148.375 Y128.113 E.00243
; LINE_WIDTH: 0.200129
G1 X148.226 Y128.315 E.00322
; WIPE_START
G1 F24000
G1 X148.375 Y128.113 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X146.215 Y121.65 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.0999241
G1 F15000
G1 X146.104 Y121.567 E.00065
G1 X142.09 Y121.479 F30000
; LINE_WIDTH: 0.134166
G1 F15000
G1 X141.949 Y121.579 E.00129
; LINE_WIDTH: 0.179994
G1 X141.808 Y121.678 E.00193
; LINE_WIDTH: 0.211983
G1 X141.682 Y121.775 E.00219
; WIPE_START
G1 F24000
M73 P55 R10
G1 X141.808 Y121.678 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.761 Y129.238 Z3.6 F30000
G1 X139.373 Y139.26 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.428745
G1 F15000
G1 X140.357 Y138.276 E.04376
G1 X140.703 Y137.961 E.01471
G1 X141.155 Y137.631 E.0176
G1 X141.639 Y137.352 E.01758
G1 X141.981 Y137.198 E.01178
G1 X139.204 Y139.975 E.12348
G1 X139.101 Y140.217 E.00828
G1 X138.93 Y140.795 E.01893
G1 X142.789 Y136.936 E.17158
G1 X142.958 Y136.892 E.00549
G1 X143.452 Y136.818 E.01571
G1 X138.818 Y141.453 E.20605
G1 X138.791 Y142.024 E.018
G1 X144.022 Y136.793 E.23258
G1 X144.349 Y136.798 E.01028
G1 X144.54 Y136.821 E.00605
G1 X138.821 Y142.541 E.2543
G1 X138.893 Y143.014 E.01504
G1 X145.016 Y136.891 E.27222
G1 X145.458 Y136.995 E.01428
G1 X138.996 Y143.457 E.28733
G1 X139.137 Y143.861 E.01346
G1 X145.862 Y137.136 E.29902
G1 X146.242 Y137.302 E.01303
G1 X139.301 Y144.243 E.30862
G1 X139.486 Y144.603 E.01274
G1 X146.601 Y137.488 E.31635
G1 X146.94 Y137.696 E.01247
G1 X139.698 Y144.937 E.32199
G1 X139.932 Y145.249 E.01225
G1 X147.249 Y137.932 E.32535
G1 X147.546 Y138.18 E.01218
G1 X140.183 Y145.544 E.3274
G1 X140.453 Y145.819 E.01213
G1 X147.815 Y138.457 E.32731
G1 X148.069 Y138.749 E.01216
G1 X140.747 Y146.071 E.32556
G1 X141.062 Y146.301 E.01228
G1 X148.303 Y139.06 E.32195
G1 X148.51 Y139.399 E.01248
G1 X141.399 Y146.51 E.31618
G1 X141.755 Y146.7 E.01268
G1 X148.702 Y139.753 E.30888
G1 X148.862 Y140.138 E.01312
G1 X142.133 Y146.867 E.29919
G1 X142.545 Y147.001 E.01361
G1 X149 Y140.546 E.28698
G1 X149.109 Y140.983 E.01414
G1 X142.98 Y147.112 E.27252
G1 X143.455 Y147.182 E.01509
G1 X149.184 Y141.453 E.25475
G1 X149.212 Y141.971 E.0163
G1 X143.974 Y147.209 E.23292
G1 X144.547 Y147.181 E.01807
G1 X149.184 Y142.544 E.20617
G1 X149.068 Y143.207 E.02115
G1 X145.21 Y147.064 E.17151
G1 X145.451 Y147.008 E.00777
G1 X146.012 Y146.808 E.01872
G1 X148.8 Y144.02 E.12394
G1 X148.74 Y144.172 E.00513
G1 X148.479 Y144.668 E.0176
G1 X148.168 Y145.131 E.01755
G1 X147.994 Y145.351 E.00883
G3 X146.738 Y146.627 I-22.486 J-20.873 E.05628
G1 X146.39 Y147.062 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X144.84 Y147.54 I-2.283 J-4.657 E.05402
G1 X139.33 Y153.05 E.25847
G1 X139.698 Y153.05 E.01219
G1 X132.239 Y145.591 E.3499
G2 X133.27 Y143.758 I-4.629 J-3.81 E.07012
G1 X145.816 Y131.211 E.58858
G2 X147.565 Y130.213 I-1.663 J-4.944 E.06722
G1 X155.05 Y137.698 E.35111
G1 X155.05 Y137.33 E.01218
G1 X149.534 Y142.846 E.25873
G3 X147.961 Y145.961 I-5.568 J-.858 E.1177
G1 X150.636 Y148.636 E.12552
G2 X153.761 Y144.085 I-10.627 J-10.643 E.18418
G1 X148.807 Y139.131 E.23238
G2 X147.788 Y137.87 I-4.515 J2.607 E.05402
G1 X139.073 Y139.341 F30000
G1 F15476.087
G3 X140.037 Y138.037 I4.677 J2.45 E.05402
G1 X131.869 Y129.869 E.38321
G3 X131.362 Y130.314 I-2.302 J-2.107 E.02242
G1 X116.484 Y145.192 E.69797
G1 X124.346 Y153.05 E.36872
G1 X123.978 Y153.05 E.01219
G1 X129.77 Y147.258 E.27168
G3 X126.242 Y147.27 I-1.781 J-5.33 E.11903
G1 X132.022 Y153.05 E.27114
G1 X131.654 Y153.05 E.01219
G1 X139.436 Y145.255 E.36537
G3 X139.187 Y144.863 I3.523 J-2.516 E.01543
G1 X124.677 Y130.353 E.68069
G3 X124.129 Y129.871 I2.682 J-3.604 E.02423
G1 X115.889 Y138.111 E.38657
G2 X114.585 Y137.147 I-3.549 J3.433 E.05401
G1 X123.417 Y139.287 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425084
G1 F15000
G3 X124.657 Y138.065 I23.178 J22.278 E.05424
G1 X125.103 Y137.726 E.01744
G1 X125.581 Y137.438 E.01739
G1 X125.996 Y137.248 E.0142
G1 X123.244 Y140 E.12118
G1 X123.025 Y140.618 E.02043
G1 X122.985 Y140.8 E.0058
G1 X126.803 Y136.981 E.16818
G1 X127.46 Y136.865 E.02076
G1 X122.873 Y141.452 E.202
G1 X122.844 Y141.721 E.00843
G1 X122.844 Y142.022 E.00936
G1 X128.022 Y136.844 E.22804
G1 X128.279 Y136.844 E.00801
G1 X128.534 Y136.872 E.008
G1 X122.865 Y142.541 E.24967
G1 X122.94 Y143.006 E.01469
G1 X129.005 Y136.942 E.26709
G1 X129.442 Y137.045 E.01399
G1 X123.048 Y143.439 E.28158
G1 X123.184 Y143.843 E.01329
G1 X129.846 Y137.181 E.2934
G1 X130.221 Y137.347 E.01277
G1 X123.343 Y144.224 E.30291
G1 X123.531 Y144.578 E.01245
G1 X130.576 Y137.532 E.31027
G1 X130.912 Y137.737 E.01225
G1 X123.742 Y144.907 E.31579
G1 X123.967 Y145.222 E.01206
G1 X131.219 Y137.97 E.31937
G1 X131.513 Y138.217 E.01195
G1 X124.221 Y145.508 E.32112
G1 X124.488 Y145.782 E.0119
G1 X131.779 Y138.492 E.32108
G1 X132.03 Y138.781 E.01193
G1 X124.78 Y146.03 E.31926
G1 X125.093 Y146.258 E.01205
G1 X132.263 Y139.088 E.31578
G1 X132.273 Y139.102 E.00053
G1 X132.469 Y139.422 E.0117
G1 X125.422 Y146.469 E.31035
G1 X125.775 Y146.656 E.01245
G1 X132.656 Y139.775 E.30304
G1 X132.816 Y140.157 E.01287
G1 X126.157 Y146.816 E.29327
G1 X126.561 Y146.952 E.01329
G1 X132.956 Y140.557 E.28161
G1 X133.058 Y140.995 E.014
G1 X126.993 Y147.06 E.2671
G1 X127.459 Y147.135 E.01469
G1 X133.128 Y141.466 E.24968
G1 X133.163 Y141.971 E.01579
G1 X127.978 Y147.156 E.22833
G1 X128.279 Y147.156 E.00937
G1 X128.548 Y147.127 E.00842
G1 X133.134 Y142.54 E.20199
G1 X133.019 Y143.196 E.02074
G1 X129.2 Y147.015 E.1682
G1 X129.382 Y146.975 E.00581
G1 X130 Y146.756 E.02042
G1 X132.752 Y144.004 E.12121
G1 X132.686 Y144.169 E.00552
G1 X132.425 Y144.662 E.01738
G1 X132.111 Y145.125 E.01743
G1 X131.78 Y145.516 E.01595
G1 X130.713 Y146.583 E.04699
G1 X132.661 Y138.981 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.6 Y138.884 E.00379
G2 X131.591 Y137.761 I-5.339 J3.78 E.0502
G1 X139.785 Y129.567 E.3844
G3 X139.786 Y122.434 I4.223 J-3.566 E.25718
G1 X131.535 Y114.183 E.38708
G3 X124.466 Y114.182 I-3.534 J-4.212 E.25467
G1 X116.142 Y122.506 E.39049
G3 X116.142 Y129.494 I-4.143 J3.494 E.25192
G1 X124.409 Y137.761 E.38781
G3 X125.789 Y136.909 I3.855 J4.699 E.05398
G1 X139.873 Y145.788 F30000
G1 F15476.087
G2 X141.133 Y146.809 I3.825 J-3.432 E.05402
G1 X146.085 Y151.761 E.2323
G3 X144.563 Y152.337 I-6.734 J-15.475 E.054
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X146.085 Y151.761 E-.6184
G1 X145.821 Y151.497 E-.1416
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
G17
G3 Z3.6 I1.013 J-.674 P1  F30000
G1 X126.049 Y121.784 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X126.278 Y121.677 E.00836
G3 X127.748 Y121.355 I1.719 J4.322 E.05016
G1 X127.993 Y121.348 E.00814
G3 X125.82 Y121.888 I.003 J4.651 E.89445
G1 X125.995 Y121.809 E.00637
G1 X126.211 Y122.133 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X127.769 Y121.746 I1.786 J3.867 E.04964
G1 X127.994 Y121.74 E.00689
G3 X126.156 Y122.158 I.003 J4.259 E.76394
M204 S10000
; WIPE_START
G1 F24000
G1 X126.423 Y122.042 E-.11047
G1 X126.86 Y121.895 E-.17528
G1 X127.311 Y121.796 E-.17529
G1 X127.769 Y121.746 E-.17528
G1 X127.994 Y121.74 E-.08524
G1 X128.095 Y121.743 E-.03845
; WIPE_END
G1 E-.04 F1800
G1 X127.769 Y129.368 Z3.8 F30000
G1 X127.448 Y136.902 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X127.745 Y136.879 I.557 J5.094 E.00987
G3 X128.278 Y136.879 I.261 J4.917 E.01769
G3 X127.389 Y136.909 I-.272 J5.117 E1.03848
; WIPE_START
G1 F24000
G1 X127.745 Y136.879 E-.13586
G1 X128.278 Y136.879 E-.20251
G1 X128.83 Y136.939 E-.21099
G1 X129.371 Y137.059 E-.21064
; WIPE_END
G1 E-.04 F1800
G1 X137.001 Y137.262 Z3.8 F30000
G1 X141.657 Y137.386 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F15476.087
G3 X143.814 Y136.826 I2.349 J4.614 E.07452
G3 X144.347 Y136.833 I.194 J4.965 E.0177
G3 X141.603 Y137.413 I-.342 J5.166 E.98483
; WIPE_START
G1 F24000
G1 X141.907 Y137.264 E-.12842
G1 X142.426 Y137.067 E-.21124
G1 X142.964 Y136.926 E-.21123
G1 X143.509 Y136.846 E-.20911
; WIPE_END
G1 E-.04 F1800
G1 X143.504 Y129.213 Z3.8 F30000
G1 X143.5 Y121.327 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F15476.087
G1 X143.559 Y121.319 E.00199
G3 X143.817 Y121.301 I.444 J4.678 E.00859
G1 X144.063 Y121.298 E.00815
G3 X143.06 Y121.394 I-.06 J4.698 E.94585
G1 X143.44 Y121.336 E.01278
G1 X143.877 Y121.693 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.058 Y121.69 E.00557
G3 X143.817 Y121.694 I-.055 J4.307 E.8241
M204 S10000
; WIPE_START
G1 F24000
G1 X144.058 Y121.69 E-.09171
G1 X144.52 Y121.721 E-.17582
G1 X144.748 Y121.755 E-.08795
G1 X145.199 Y121.86 E-.17582
G1 X145.636 Y122.012 E-.17583
G1 X145.762 Y122.072 E-.05287
; WIPE_END
G1 E-.04 F1800
G1 X147.57 Y114.657 Z3.8 F30000
G1 X148.701 Y110.021 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.665 Y110.503 E.01605
G3 X143.811 Y105.302 I-4.675 J-.503 E.71227
G1 X144.044 Y105.298 E.00774
G3 X148.692 Y109.963 I-.054 J4.701 E.24198
G1 X148.309 Y109.975 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X148.3 Y110 E.00083
G3 X143.826 Y105.693 I-4.309 J-.001 E.61893
G1 X144.04 Y105.691 E.00655
G3 X148.294 Y109.769 I-.049 J4.309 E.19942
G1 X148.305 Y109.915 E.00449
M204 S10000
; WIPE_START
G1 F24000
G1 X148.3 Y110 E-.03251
G1 X148.285 Y110.462 E-.17551
G1 X148.211 Y110.919 E-.17583
G1 X148.088 Y111.365 E-.17583
G1 X147.918 Y111.795 E-.17583
G1 X147.89 Y111.853 E-.0245
; WIPE_END
G1 E-.04 F1800
G1 X140.613 Y109.55 Z3.8 F30000
G1 X127.449 Y105.383 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X127.498 Y105.376 E.00166
G3 X127.767 Y105.354 I.511 J4.623 E.00895
G1 X128 Y105.348 E.00773
G3 X127 Y105.458 I.009 J4.651 E.93602
G1 X127.39 Y105.393 E.0131
G1 X127.837 Y105.744 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128 Y105.74 E.005
G3 X127.777 Y105.746 I.009 J4.259 E.81545
M204 S10000
; WIPE_START
G1 F24000
G1 X128 Y105.74 E-.08468
G1 X128.461 Y105.765 E-.17529
G1 X128.689 Y105.796 E-.08767
G1 X129.14 Y105.895 E-.17528
G1 X129.577 Y106.042 E-.17528
G1 X129.724 Y106.111 E-.0618
; WIPE_END
G1 E-.04 F1800
G1 X122.678 Y109.043 Z3.8 F30000
G1 X116.273 Y111.708 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.277 Y111.721 E.00044
G3 X111.705 Y105.408 I-4.268 J-1.721 E.65069
G1 X111.937 Y105.398 E.00771
G3 X116.365 Y111.484 I.072 J4.601 E.29234
G1 X116.296 Y111.652 E.00602
G1 X115.932 Y111.5 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X115.913 Y111.574 E.00234
G3 X111.731 Y105.799 I-3.904 J-1.575 E.55138
G1 X111.943 Y105.79 E.00651
G3 X115.993 Y111.358 I.067 J4.209 E.24773
G1 X115.956 Y111.445 E.00292
M204 S10000
; WIPE_START
G1 F24000
G1 X115.913 Y111.574 E-.05158
G1 X115.814 Y111.782 E-.08752
G1 X115.597 Y112.187 E-.17474
G1 X115.337 Y112.567 E-.17489
G1 X115.037 Y112.915 E-.17457
G1 X114.851 Y113.089 E-.09671
; WIPE_END
G1 E-.04 F1800
G1 X112.313 Y120.287 Z3.8 F30000
G1 X111.92 Y121.399 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.93 Y121.398 E.00033
G3 X111.686 Y121.408 I.066 J4.598 E.95039
G1 X111.86 Y121.401 E.0058
G1 X111.832 Y121.795 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.936 Y121.791 E.0032
G3 X111.713 Y121.8 I.061 J4.206 E.80533
G1 X111.772 Y121.797 E.00183
M204 S10000
; WIPE_START
G1 F24000
G1 X111.936 Y121.791 E-.06232
G1 X112.172 Y121.793 E-.08976
G1 X112.63 Y121.837 E-.1748
G1 X113.08 Y121.931 E-.17473
G1 X113.518 Y122.073 E-.17473
G1 X113.718 Y122.163 E-.08366
; WIPE_END
G1 E-.04 F1800
G1 X112.911 Y129.753 Z3.8 F30000
G1 X112.148 Y136.927 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X112.206 Y136.926 E.0019
G3 X111.653 Y136.934 I-.205 J5.073 E1.0399
G1 X112.088 Y136.928 E.01442
; WIPE_START
G1 F24000
G1 X112.206 Y136.926 E-.0446
G1 X112.485 Y136.945 E-.10637
G1 X113.033 Y137.028 E-.21076
G1 X113.569 Y137.17 E-.21075
G1 X114.03 Y137.348 E-.18752
; WIPE_END
G1 E-.04 F1800
G1 X110.251 Y143.98 Z3.8 F30000
G1 X106.678 Y150.249 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F15476.087
G1 X106.357 Y149.997 E.01355
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.196 Y98.605 E.80249
G3 X155.398 Y114.004 I-.208 J15.408 E.79575
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.02 Y150.502 I.01 J-15.412 E.31823
G1 X106.727 Y150.284 E.01211
G1 X106.441 Y150.561 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.01288
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.201 Y98.213 E.7436
G3 X155.79 Y114.001 I-.213 J15.8 E.75578
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.489 Y150.596 E.01155
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.303 E-.18206
G1 X105.456 Y149.753 E-.32491
G1 X104.972 Y149.295 E-.25304
; WIPE_END
G1 E-.04 F1800
G1 X111.438 Y152.338 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X109.917 Y151.759 I4.784 J-14.863 E.054
G1 X131.116 Y130.6 E.99356
G2 X131.777 Y130.065 I-5.108 J-6.984 E.02823
G1 X126.051 Y130.712 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.512682
G1 F13411.046
G1 X126.203 Y130.799 E.00667
; LINE_WIDTH: 0.484822
G1 F14256.565
G1 X126.88 Y131 E.02546
G2 X124.107 Y122.674 I1.12 J-4.998 E.77931
G2 X125.344 Y130.386 I3.901 J3.329 E.3197
; LINE_WIDTH: 0.513527
G1 F13386.966
G1 X125.997 Y130.687 E.02756
G1 X129.532 Y137.398 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.612 Y140.477 E.13383
G1 X132.788 Y141.187
G1 X128.814 Y137.212 E.1727
G1 X128.217 Y137.149
G1 X132.852 Y141.784 E.20139
G1 X132.846 Y142.312
G1 X127.689 Y137.154 E.22411
G1 X127.215 Y137.213
G1 X132.787 Y142.785 E.24212
G1 X132.694 Y143.226
G1 X126.774 Y137.306 E.25723
G1 X126.365 Y137.43
G1 X132.572 Y143.637 E.26971
G1 X132.418 Y144.016
G1 X125.984 Y137.582 E.27961
G1 X125.633 Y137.765
G1 X132.238 Y144.37 E.28701
G1 X132.036 Y144.701
G1 X125.303 Y137.968 E.29258
G1 X124.991 Y138.189
G1 X131.811 Y145.009 E.29637
M73 P56 R10
G1 X131.565 Y145.297
G1 X124.704 Y138.436 E.29817
G1 X124.437 Y138.702
G1 X131.298 Y145.563 E.29814
G1 X131.01 Y145.808
G1 X124.192 Y138.99 E.29625
G1 X123.967 Y139.298
G1 X130.703 Y146.034 E.29271
G1 X130.372 Y146.237
G1 X123.765 Y139.629 E.28713
G1 X123.583 Y139.981
G1 X130.015 Y146.412 E.27948
G1 X129.636 Y146.567
G1 X123.431 Y140.362 E.26963
G1 X123.304 Y140.769
G1 X129.231 Y146.696 E.25755
G1 X128.794 Y146.792
G1 X123.208 Y141.206 E.24274
G1 X123.155 Y141.686
G1 X128.314 Y146.845 E.22418
G1 X127.786 Y146.851
G1 X123.148 Y142.213 E.20154
G1 X123.211 Y142.809
G1 X127.184 Y146.782 E.17263
G1 X126.482 Y146.612
G1 X123.396 Y143.527 E.13409
M204 S10000
; WIPE_START
G1 F24000
G1 X124.81 Y144.941 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.212 Y140.785 Z3.8 F30000
G1 X132.424 Y139.998 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.092618
G1 F15000
G1 X132.398 Y139.959 E.00019
; LINE_WIDTH: 0.117541
G1 X132.32 Y139.852 E.00081
; LINE_WIDTH: 0.157963
G1 X132.242 Y139.745 E.00124
; LINE_WIDTH: 0.198386
G1 X132.163 Y139.638 E.00168
; LINE_WIDTH: 0.23486
M73 P56 R9
G1 X132.087 Y139.538 E.00196
; LINE_WIDTH: 0.266459
G1 X132.005 Y139.436 E.00239
; LINE_WIDTH: 0.29464
G1 X131.923 Y139.334 E.00269
; LINE_WIDTH: 0.32594
G1 X131.754 Y139.141 E.00592
; LINE_WIDTH: 0.374987
G2 X130.862 Y138.244 I-8.169 J7.232 E.03425
; LINE_WIDTH: 0.328473
G1 X130.658 Y138.07 E.00623
; LINE_WIDTH: 0.28554
G1 X130.521 Y137.963 E.00344
; LINE_WIDTH: 0.243079
G1 X130.384 Y137.856 E.00283
; LINE_WIDTH: 0.200619
G1 X130.247 Y137.75 E.00223
; LINE_WIDTH: 0.156584
G1 X130.131 Y137.669 E.00131
; LINE_WIDTH: 0.110975
G1 X130.015 Y137.588 E.00078
; WIPE_START
G1 F24000
G1 X130.131 Y137.669 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.878 Y144.573 Z3.8 F30000
G1 X126.004 Y146.427 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.0936361
G1 F15000
G1 X125.961 Y146.398 E.00021
; LINE_WIDTH: 0.112267
G1 X125.894 Y146.349 E.00047
; LINE_WIDTH: 0.138489
G1 X125.824 Y146.299 E.00067
; LINE_WIDTH: 0.1671
G1 X125.753 Y146.249 E.00088
; LINE_WIDTH: 0.1961
G1 X125.672 Y146.188 E.00126
; LINE_WIDTH: 0.234774
G1 X125.507 Y146.058 E.00329
; LINE_WIDTH: 0.284683
G1 X125.342 Y145.928 E.00414
; LINE_WIDTH: 0.314244
G1 X125.3 Y145.892 E.00121
; LINE_WIDTH: 0.33392
G1 X125.129 Y145.742 E.0054
; LINE_WIDTH: 0.376874
G3 X124.243 Y144.859 I6.816 J-7.721 E.03406
; LINE_WIDTH: 0.331758
G1 X124.077 Y144.664 E.00604
; LINE_WIDTH: 0.294881
G1 X123.994 Y144.558 E.00275
; LINE_WIDTH: 0.266371
G1 X123.911 Y144.457 E.00238
; LINE_WIDTH: 0.236594
G1 X123.834 Y144.356 E.00202
; LINE_WIDTH: 0.202116
G1 X123.756 Y144.254 E.00166
; LINE_WIDTH: 0.160692
G1 X123.67 Y144.131 E.00144
; LINE_WIDTH: 0.11232
G1 X123.584 Y144.008 E.00085
; WIPE_START
G1 F24000
G1 X123.67 Y144.131 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.41 Y146.608 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.0955933
G1 F15000
G1 X129.257 Y146.693 E.00075
G1 X124.679 Y146.355 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X126.104 Y147.131 I6.178 J-9.637 E.05386
G1 X132.022 Y153.05 E.27764
G1 X131.654 Y153.05 E.01219
G1 X139.498 Y145.206 E.36798
G1 X124.979 Y130.655 E.68188
G3 X124.219 Y130.068 I2.38 J-3.867 E.03189
G1 X117.07 Y126.014 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.485575
G1 F14232.313
G2 X111.652 Y120.941 I-5.073 J-.012 E.30034
G1 X110.846 Y121.056 E.02936
G2 X117.042 Y126.568 I1.155 J4.94 E.79974
G1 X117.067 Y126.074 E.01783
G1 X113.613 Y137.476 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.527 Y140.391 E.12663
G1 X116.72 Y141.117
G1 X112.884 Y137.281 E.16669
G1 X112.274 Y137.204
G1 X116.8 Y141.73 E.19668
G1 X116.8 Y142.264
G1 X111.739 Y137.203 E.21993
G1 X111.258 Y137.255
G1 X116.748 Y142.744 E.23855
G1 X116.654 Y143.184
G1 X110.815 Y137.345 E.25377
G1 X110.403 Y137.466
G1 X116.532 Y143.596 E.26636
G1 X116.379 Y143.976
G1 X110.026 Y137.622 E.2761
G1 X109.672 Y137.802
G1 X116.202 Y144.332 E.28377
G1 X116 Y144.664
G1 X109.339 Y138.002 E.28947
G1 X109.027 Y138.223
G1 X115.776 Y144.972 E.29328
G1 X115.529 Y145.259
G1 X108.742 Y138.471 E.29495
G1 X108.472 Y138.735
G1 X115.265 Y145.528 E.29516
G1 X114.977 Y145.773
G1 X108.23 Y139.027 E.29315
G1 X108.005 Y139.335
G1 X114.669 Y145.998 E.28958
G1 X114.334 Y146.197
G1 X107.8 Y139.663 E.28394
G1 X107.622 Y140.018
G1 X113.983 Y146.379 E.27641
G1 X113.599 Y146.528
G1 X107.469 Y140.398 E.2664
G1 X107.344 Y140.807
G1 X113.193 Y146.655 E.25414
G1 X112.752 Y146.748
G1 X107.255 Y141.251 E.23884
G1 X107.205 Y141.734
G1 X112.268 Y146.797 E.22
G1 X111.735 Y146.797
G1 X107.205 Y142.268 E.19684
G1 X107.275 Y142.871
G1 X111.132 Y146.728 E.16761
G1 X110.396 Y146.524
G1 X107.475 Y143.604 E.12692
M204 S10000
; WIPE_START
G1 F24000
G1 X108.889 Y145.018 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.163 Y140.672 Z3.8 F30000
G1 X116.309 Y139.879 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.108103
G1 F15000
G1 X116.223 Y139.763 E.00077
; LINE_WIDTH: 0.14804
G1 X116.136 Y139.646 E.00124
; LINE_WIDTH: 0.187976
G1 X116.05 Y139.53 E.00171
; LINE_WIDTH: 0.226775
G1 X115.925 Y139.379 E.00293
; LINE_WIDTH: 0.264434
G1 X115.801 Y139.228 E.00354
; LINE_WIDTH: 0.308071
G2 X115.548 Y138.943 I-5.344 J4.489 E.00823
; LINE_WIDTH: 0.325243
G2 X114.81 Y138.231 I-8.992 J8.576 E.02359
; LINE_WIDTH: 0.270495
G1 X114.62 Y138.071 E.00461
; LINE_WIDTH: 0.231138
G1 X114.498 Y137.975 E.00239
; LINE_WIDTH: 0.201991
G1 X114.417 Y137.909 E.00135
; LINE_WIDTH: 0.172459
G1 X114.307 Y137.826 E.00145
; LINE_WIDTH: 0.134189
G1 X114.198 Y137.744 E.00102
; LINE_WIDTH: 0.101613
G1 X114.118 Y137.689 E.00047
G1 X113.55 Y137.539 F30000
; LINE_WIDTH: 0.203778
G1 F15000
G1 X113.255 Y137.348 E.0046
; WIPE_START
G1 F24000
G1 X113.55 Y137.539 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X110.623 Y144.588 Z3.8 F30000
G1 X109.901 Y146.324 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.102945
G1 F15000
G1 X109.798 Y146.247 E.00063
; LINE_WIDTH: 0.138867
G1 X109.696 Y146.174 E.00099
; LINE_WIDTH: 0.175835
G1 X109.586 Y146.087 E.00151
; LINE_WIDTH: 0.208822
G1 X109.49 Y146.014 E.00164
; LINE_WIDTH: 0.237806
G1 X109.384 Y145.926 E.00219
; LINE_WIDTH: 0.263627
G1 X109.289 Y145.85 E.00218
; LINE_WIDTH: 0.303846
G3 X108.994 Y145.588 I4 J-4.797 E.00839
; LINE_WIDTH: 0.337792
G3 X108.367 Y144.96 I8.31 J-8.927 E.02134
; LINE_WIDTH: 0.304545
G1 X108.191 Y144.76 E.00567
; LINE_WIDTH: 0.262946
G1 X108.028 Y144.564 E.00458
; LINE_WIDTH: 0.225556
G1 X107.95 Y144.464 E.00189
; LINE_WIDTH: 0.195206
G1 X107.871 Y144.363 E.00158
; LINE_WIDTH: 0.157058
G1 X107.78 Y144.237 E.00145
; LINE_WIDTH: 0.111116
G1 X107.689 Y144.111 E.00087
; WIPE_START
G1 F24000
G1 X107.78 Y144.237 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.41 Y144.043 Z3.8 F30000
G1 X116.363 Y144.019 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.102346
G1 F15000
G1 X116.276 Y144.14 E.00072
G1 X116.429 Y145.133 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X124.346 Y153.05 E.37139
G1 X123.978 Y153.05 E.01219
G1 X129.896 Y147.132 E.27759
G2 X131.315 Y146.35 I-3.84 J-8.643 E.05384
G1 X139.131 Y139.399 F30000
G1 F15476.087
G3 X140.093 Y138.093 I9.193 J5.765 E.05385
G1 X131.925 Y129.925 E.38321
G2 X132.655 Y129.021 I-4.203 J-4.145 E.03861
G1 X146.867 Y114.809 E.66672
G2 X147.26 Y114.556 I-1.069 J-2.091 E.01551
G1 X155.046 Y122.342 E.36527
G1 X155.046 Y121.982 E.01195
G1 X149.342 Y127.685 E.26756
G2 X149.342 Y124.315 I-5.265 J-1.685 E.11363
G1 X155.048 Y130.02 E.26765
G1 X155.048 Y129.656 E.01207
G1 X147.203 Y137.501 E.368
G2 X147.108 Y137.432 I-.366 J.408 E.00391
G1 X132.655 Y122.979 E.67803
G2 X131.927 Y122.073 I-5.338 J3.543 E.03859
G1 X140.017 Y113.945 E.38042
G3 X139.073 Y112.659 I4.364 J-4.195 E.05309
G1 X140.305 Y113.626 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.485333
G1 F14240.114
G2 X144.752 Y115.118 I3.717 J-3.705 E.17534
; LINE_WIDTH: 0.502772
G1 F13700.059
G1 X145.011 Y115.052 E.01001
; LINE_WIDTH: 0.524898
G1 F13071.146
G3 X145.45 Y114.97 I.468 J1.292 E.01761
; LINE_WIDTH: 0.490147
G1 F14086.817
G2 X147.265 Y114.013 I-1.426 J-4.9 E.07528
; LINE_WIDTH: 0.501864
G1 F13727.181
G1 X147.47 Y113.809 E.01083
; LINE_WIDTH: 0.500301
G1 F13774.082
G3 X147.812 Y113.501 I1.3 J1.103 E.01719
G2 X148.431 Y112.678 I-3.647 J-3.383 E.03846
; LINE_WIDTH: 0.487992
G1 F14155.029
G2 X149.167 Y109.72 I-4.578 J-2.709 E.11211
G1 X149.061 Y108.91 E.0296
G2 X141.655 Y105.388 I-5.07 J1.112 E.34293
G1 X140.957 Y105.811 E.0296
G2 X140.265 Y113.581 I3.058 J4.188 E.32019
; WIPE_START
G1 F24000
G1 X139.937 Y113.209 E-.18841
G1 X139.616 Y112.755 E-.21122
G1 X139.346 Y112.269 E-.21121
G1 X139.193 Y111.908 E-.14915
; WIPE_END
G1 E-.04 F1800
G1 X139.873 Y106.212 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X141.133 Y105.191 I3.755 J3.345 E.05403
G1 X146.083 Y100.241 E.23223
G3 X150.634 Y103.366 I-6.234 J13.952 E.18413
G1 X147.961 Y106.039 E.12539
G2 X144.843 Y104.463 I-3.919 J3.879 E.11792
G1 X139.333 Y98.953 E.25849
G1 X139.695 Y98.953 E.01202
G1 X132.234 Y106.414 E.35003
G3 X133.27 Y108.242 I-4.439 J3.725 E.07009
G1 X145.688 Y120.66 E.58253
G3 X147.621 Y121.731 I-1.588 J5.149 E.07385
G1 X155.044 Y114.308 E.34822
G1 X155.044 Y114.664 E.01183
G1 X149.535 Y109.115 E.2594
G2 X149.068 Y107.608 I-6.364 J1.149 E.05246
G1 X147.801 Y114.112 F30000
G1 F15476.087
G2 X148.823 Y112.852 I-3.526 J-3.909 E.05402
G1 X153.757 Y107.919 E.23144
G3 X154.33 Y109.442 I-9.065 J4.277 E.05403
; WIPE_START
G1 F24000
G1 X153.757 Y107.919 E-.61827
G1 X153.493 Y108.183 E-.14173
; WIPE_END
G1 E-.04 F1800
G1 X148.662 Y114.092 Z3.8 F30000
G1 X138.824 Y126.125 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.485911
G1 F14221.515
G2 X148.147 Y122.901 I5.174 J-.131 E.70188
G2 X144.361 Y120.835 I-4.187 J3.171 E.16044
G1 X143.535 Y120.844 E.02983
G2 X138.826 Y126.065 I.482 J5.169 E.2788
G1 X139.729 Y129.623 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X131.535 Y137.817 E.3844
G2 X124.465 Y137.817 I-3.535 J4.258 E.25437
G1 X116.198 Y129.55 E.38782
G2 X116.198 Y122.45 I-4.199 J-3.55 E.25605
G1 X124.41 Y114.238 E.38521
G2 X131.591 Y114.239 I3.591 J-4.271 E.25879
G1 X139.73 Y122.378 E.38181
G1 X131.781 Y121.932 F30000
G1 F15476.087
G2 X131.021 Y121.345 I-3.142 J3.283 E.03188
G1 X116.472 Y106.796 E.68255
G1 X124.345 Y98.951 E.36867
G1 X123.979 Y98.951 E.01213
G1 X129.77 Y104.742 E.27164
G2 X126.242 Y104.73 I-1.781 J5.324 E.11903
G1 X132.02 Y98.952 E.27106
G1 X131.656 Y98.952 E.01207
G1 X139.436 Y106.745 E.36528
G2 X139.187 Y107.137 I3.531 J2.521 E.01543
G1 X124.985 Y121.339 E.66623
G2 X124.075 Y122.075 I3.375 J5.099 E.03887
G1 X115.889 Y113.889 E.38406
G2 X116.852 Y112.585 I-3.431 J-3.545 E.05402
G1 X115.648 Y113.521 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.485041
G1 F14249.488
G2 X117.07 Y110.015 I-3.654 J-3.523 E.1397
G2 X112.222 Y104.928 I-5.092 J-.001 E.2794
G1 X111.4 Y104.959 E.02966
G2 X115.605 Y113.562 I.6 J5.036 E.69679
; WIPE_START
G1 F24000
G1 X115.245 Y113.901 E-.18778
G1 X114.8 Y114.232 E-.2106
G1 X114.322 Y114.512 E-.21058
G1 X113.959 Y114.674 E-.15103
; WIPE_END
G1 E-.04 F1800
G1 X108.617 Y114.342 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X108.593 Y114.325 E.00098
G3 X107.542 Y113.218 I3.746 J-4.609 E.05079
G1 X102.241 Y107.917 E.24867
G2 X101.662 Y109.438 I14.284 J6.305 E.054
G1 X107.102 Y107.502 F30000
G1 F15476.087
G2 X106.583 Y109.038 I4.603 J2.413 E.054
G1 X100.95 Y114.67 E.26422
G1 X100.95 Y114.302 E.01219
G1 X108.446 Y121.798 E.35163
G3 X110.162 Y120.81 I3.803 J4.624 E.06598
G1 X122.742 Y108.23 E.59014
G3 X123.766 Y106.414 I5.259 J1.77 E.06959
G1 X116.302 Y98.95 E.35015
G1 X116.67 Y98.95 E.01219
G1 X111.032 Y104.588 E.26446
G2 X108.112 Y106.112 I.968 J5.413 E.11098
G1 X105.358 Y103.358 E.12919
G3 X109.915 Y100.239 I10.762 J10.834 E.18419
G1 X115.204 Y105.528 E.2481
G3 X116.348 Y106.634 I-2.86 J4.101 E.05302
G1 X127.986 Y115.124 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.488008
G1 F14154.5
G2 X128.286 Y104.884 I.006 J-5.124 E.57343
G1 X127.462 Y104.901 E.0299
G2 X127.926 Y115.121 I.542 J5.096 E.56134
G1 X108.872 Y137.575 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X100.95 Y129.654 E.3716
G1 X100.95 Y130.022 E.01219
G1 X106.815 Y124.157 E.27513
G2 X106.822 Y127.85 I5.095 J1.837 E.12501
G1 X100.95 Y121.978 E.27546
G1 X100.95 Y122.346 E.01219
G1 X108.783 Y114.459 E.36872
G1 X123.345 Y129.021 E.68314
G2 X124.073 Y129.927 I5.338 J-3.542 E.03859
G1 X115.833 Y138.167 E.38657
G3 X116.794 Y139.473 I-4.783 J4.528 E.0539
; WIPE_START
G1 F24000
G1 X116.318 Y138.714 E-.34018
G1 X115.833 Y138.167 E-.27786
G1 X116.097 Y137.903 E-.14196
; WIPE_END
G1 E-.04 F1800
G1 X113.431 Y145.055 Z3.8 F30000
G1 X112.56 Y147.39 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F15476.087
G3 X110.94 Y147.32 I-.38 J-10.02 E.05385
G1 X116.67 Y153.05 E.26878
G1 X116.302 Y153.05 E.01219
G1 X123.817 Y145.535 E.35254
G3 X122.869 Y143.896 I6.707 J-4.978 E.06293
G1 X110.149 Y131.177 E.59668
G3 X108.449 Y130.199 I1.867 J-5.212 E.06542
G1 X100.95 Y137.698 E.35177
G1 X100.95 Y137.33 E.01219
M73 P57 R9
G1 X106.687 Y143.067 E.26912
G2 X108.169 Y145.831 I5.305 J-1.065 E.10555
G1 X105.358 Y148.642 E.13185
G3 X102.239 Y144.085 I10.834 J-10.763 E.18419
G1 X123.39 Y122.9 E.99302
G3 X123.932 Y122.219 I5.42 J3.759 E.02889
; WIPE_START
G1 F24000
G1 X123.39 Y122.9 E-.33066
G1 X122.592 Y123.7 E-.42934
; WIPE_END
G1 E-.04 F1800
G1 X129.08 Y127.72 Z3.8 F30000
G1 X148.287 Y139.621 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.369 Y137.703 E.08336
G1 X145.447 Y137.315
G1 X148.684 Y140.552 E.14066
G1 X148.842 Y141.242
G1 X144.754 Y137.155 E.17762
G1 X144.166 Y137.1
G1 X148.899 Y141.833 E.20566
G1 X148.889 Y142.356
G1 X143.641 Y137.108 E.22805
G1 X143.169 Y137.169
G1 X148.83 Y142.83 E.24601
G1 X148.734 Y143.268
G1 X142.732 Y137.266 E.2608
G1 X142.326 Y137.394
G1 X148.61 Y143.677 E.27305
G1 X148.456 Y144.056
G1 X141.946 Y137.547 E.28286
G1 X141.593 Y137.726
G1 X148.272 Y144.406 E.29025
G1 X148.072 Y144.739
G1 X141.263 Y137.93 E.29586
G1 X140.954 Y138.154
G1 X147.846 Y145.046 E.29948
G1 X147.6 Y145.334
G1 X140.666 Y138.4 E.3013
G1 X140.4 Y138.667
G1 X147.333 Y145.6 E.30126
G1 X147.045 Y145.845
G1 X140.153 Y138.953 E.29949
G1 X139.931 Y139.265
G1 X146.737 Y146.07 E.29573
G1 X146.408 Y146.274
G1 X139.725 Y139.591 E.2904
G1 X139.548 Y139.947
G1 X146.051 Y146.451 E.28261
G1 X145.677 Y146.61
G1 X139.389 Y140.322 E.27328
G1 X139.264 Y140.73
G1 X145.27 Y146.737 E.26101
G1 X144.835 Y146.834
G1 X139.167 Y141.167 E.24628
G1 X139.107 Y141.64
G1 X144.355 Y146.888 E.22803
G1 X143.832 Y146.898
G1 X139.097 Y142.163 E.20576
G1 X139.155 Y142.755
G1 X143.25 Y146.849 E.17793
G1 X142.555 Y146.688
G1 X139.31 Y143.443 E.14101
G1 X139.703 Y144.369
G1 X141.629 Y146.295 E.08368
M204 S10000
; WIPE_START
G1 F24000
G1 X140.214 Y144.88 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.243 Y141.091 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0909488
G1 F15000
G1 X139.196 Y140.929 E.00066
; WIPE_START
G1 F24000
G1 X139.243 Y141.091 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X146.832 Y140.278 Z3.8 F30000
G1 X148.522 Y140.097 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.100785
G1 F15000
G1 X148.477 Y140.03 E.00038
; LINE_WIDTH: 0.12743
G1 X148.432 Y139.963 E.00055
; LINE_WIDTH: 0.161679
G1 X148.357 Y139.859 E.00124
; LINE_WIDTH: 0.211912
G1 X148.282 Y139.755 E.00177
G1 X148.305 Y139.615 E.00195
; WIPE_START
G1 F24000
G1 X148.282 Y139.755 E-.39871
G1 X148.357 Y139.859 E-.36129
; WIPE_END
G1 E-.04 F1800
G1 X143.132 Y145.423 Z3.8 F30000
G1 X142.096 Y146.526 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.135434
G1 F15000
G1 X141.914 Y146.394 E.00169
; LINE_WIDTH: 0.180161
G1 X141.811 Y146.323 E.00139
; LINE_WIDTH: 0.211842
G1 X141.69 Y146.233 E.00208
G1 X146.474 Y146.935 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X144.935 Y147.445 I-4.046 J-9.624 E.05386
G1 X139.33 Y153.05 E.26291
G1 X139.698 Y153.05 E.01219
G1 X132.183 Y145.535 E.35254
G2 X133.131 Y143.896 I-6.732 J-4.992 E.06293
G1 X145.688 Y131.34 E.58904
G2 X147.621 Y130.269 I-1.587 J-5.148 E.07385
G1 X155.05 Y137.698 E.34848
G1 X155.05 Y137.33 E.01218
G1 X149.438 Y142.941 E.26323
G3 X147.905 Y145.905 I-5.473 J-.954 E.11242
G1 X150.642 Y148.642 E.12839
G3 X146.085 Y151.761 I-10.762 J-10.834 E.18419
G1 X140.878 Y146.554 E.24425
G3 X139.692 Y145.45 I4.01 J-5.496 E.05391
; WIPE_START
G1 F24000
G1 X140.26 Y146.068 E-.31898
G1 X140.878 Y146.554 E-.29912
G1 X141.142 Y146.818 E-.1419
; WIPE_END
G1 E-.04 F1800
G1 X148.406 Y144.475 Z3.8 F30000
G1 X154.338 Y142.562 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F15476.087
G3 X153.759 Y144.083 I-14.863 J-4.784 E.054
G1 X148.568 Y138.892 E.24352
G2 X147.465 Y137.703 I-5.805 J4.277 E.05391
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X148.234 Y138.447 E-.40655
G1 X148.568 Y138.892 E-.21146
G1 X148.832 Y139.156 E-.14199
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
G17
G3 Z3.8 I.737 J-.968 P1  F30000
G1 X126.029 Y121.787 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X126.047 Y121.778 E.00067
G3 X127.748 Y121.355 I1.954 J4.218 E.05851
G3 X128.25 Y121.354 I.253 J5.288 E.01665
G3 X125.602 Y122.014 I-.249 J4.642 E.87707
G1 X125.976 Y121.815 E.01404
G1 X126.211 Y122.134 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X127.769 Y121.746 I1.789 J3.863 E.04963
G3 X128.23 Y121.746 I.231 J4.854 E.01416
G3 X126.157 Y122.16 I-.23 J4.251 E.75624
M204 S10000
; WIPE_START
G1 F24000
G1 X126.423 Y122.042 E-.11045
G1 X126.86 Y121.895 E-.17528
G1 X127.311 Y121.796 E-.17529
G1 X127.769 Y121.746 E-.17528
G1 X128.095 Y121.746 E-.12371
; WIPE_END
G1 E-.04 F1800
G1 X129.533 Y129.242 Z4 F30000
G1 X132.313 Y143.741 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.117 Y144.183 E.01605
G3 X127.769 Y137.354 I-4.107 J-2.184 E.64367
G1 X128 Y137.348 E.00765
G3 X132.344 Y143.69 I.011 J4.651 E.30014
G1 X131.944 Y143.608 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X131.874 Y143.792 E.00607
G3 X127.79 Y137.746 I-3.863 J-1.793 E.55308
G1 X128 Y137.74 E.00646
G3 X131.974 Y143.556 I.01 J4.259 E.25488
M204 S10000
; WIPE_START
G1 F24000
G1 X131.874 Y143.792 E-.09743
G1 X131.65 Y144.196 E-.17546
G1 X131.391 Y144.578 E-.17528
G1 X131.093 Y144.93 E-.17529
G1 X130.832 Y145.177 E-.13654
; WIPE_END
G1 E-.04 F1800
G1 X137.321 Y141.159 Z4 F30000
G1 X143.514 Y137.325 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.56 Y137.319 E.00156
G3 X143.832 Y137.301 I.45 J4.68 E.00904
G1 X144.063 Y137.298 E.00767
G3 X143.06 Y137.395 I-.052 J4.701 E.94643
G1 X143.454 Y137.334 E.01324
G1 X143.897 Y137.692 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.058 Y137.69 E.00493
G3 X143.837 Y137.694 I-.048 J4.309 E.82522
M204 S10000
; WIPE_START
G1 F24000
G1 X144.058 Y137.69 E-.08382
G1 X144.52 Y137.721 E-.17582
G1 X144.748 Y137.755 E-.08795
G1 X145.199 Y137.86 E-.17583
G1 X145.636 Y138.012 E-.17583
G1 X145.78 Y138.081 E-.06076
; WIPE_END
G1 E-.04 F1800
G1 X145.038 Y130.485 Z4 F30000
G1 X144.141 Y121.306 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.315 Y121.308 E.00579
G3 X143.844 Y121.301 I-.308 J4.691 E.96422
G1 X144.081 Y121.305 E.00786
G1 X143.877 Y121.693 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.289 Y121.7 E.01267
G3 X143.817 Y121.695 I-.282 J4.3 E.81742
M204 S10000
; WIPE_START
G1 F24000
G1 X144.289 Y121.7 E-.17942
G1 X144.748 Y121.755 E-.17583
G1 X145.199 Y121.86 E-.17582
G1 X145.636 Y122.012 E-.17583
G1 X145.764 Y122.069 E-.0531
; WIPE_END
G1 E-.04 F1800
G1 X147.566 Y114.652 Z4 F30000
G1 X148.701 Y109.981 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.702 Y110 E.00065
G3 X143.811 Y105.302 I-4.701 J-.001 E.72859
G3 X144.313 Y105.308 I.179 J5.559 E.01667
G3 X148.675 Y109.496 I-.312 J4.691 E.21789
G1 X148.698 Y109.921 E.01411
G1 X148.309 Y109.975 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X148.31 Y110 E.00077
G3 X143.826 Y105.693 I-4.309 J-.001 E.61862
G3 X144.288 Y105.7 I.163 J5.111 E.01419
G3 X148.285 Y109.538 I-.288 J4.3 E.18494
G1 X148.305 Y109.915 E.0116
M204 S10000
; WIPE_START
G1 F24000
G1 X148.31 Y110 E-.03238
G1 X148.285 Y110.462 E-.17582
G1 X148.211 Y110.919 E-.17583
G1 X148.088 Y111.365 E-.17582
G1 X148.009 Y111.582 E-.08795
G1 X147.886 Y111.851 E-.11221
; WIPE_END
G1 E-.04 F1800
G1 X140.611 Y109.544 Z4 F30000
G1 X127.475 Y105.379 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X127.5 Y105.376 E.00083
G3 X127.792 Y105.353 I.51 J4.623 E.00973
G3 X128.252 Y105.355 I.219 J4.24 E.01526
G3 X127 Y105.459 I-.242 J4.645 E.9277
G1 X127.416 Y105.389 E.01397
G1 X127.838 Y105.745 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.231 Y105.746 E.01205
G3 X127.778 Y105.747 I-.221 J4.254 E.80842
M204 S10000
; WIPE_START
G1 F24000
G1 X128.231 Y105.746 E-.17185
G1 X128.689 Y105.796 E-.17528
G1 X129.14 Y105.895 E-.17528
G1 X129.36 Y105.963 E-.08768
G1 X129.727 Y106.109 E-.1499
; WIPE_END
G1 E-.04 F1800
G1 X122.684 Y109.052 Z4 F30000
G1 X116.261 Y111.736 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.062 Y112.179 E.01612
G3 X111.73 Y105.407 I-4.052 J-2.179 E.63464
G3 X112.189 Y105.402 I.276 J4.193 E.01522
G3 X116.291 Y111.685 I-.179 J4.598 E.29108
G1 X115.93 Y111.499 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X115.913 Y111.574 E.00236
G3 X111.755 Y105.798 I-3.903 J-1.575 E.55204
G3 X112.172 Y105.793 I.25 J3.816 E.01284
G3 X116.062 Y111.138 I-.163 J4.206 E.23358
G1 X115.951 Y111.443 E.00997
M204 S10000
; WIPE_START
G1 F24000
G1 X115.913 Y111.574 E-.05185
G1 X115.711 Y111.989 E-.17526
G1 X115.574 Y112.223 E-.10309
G1 X115.337 Y112.567 E-.15868
G1 X115.037 Y112.915 E-.17473
G1 X114.852 Y113.088 E-.09639
; WIPE_END
G1 E-.04 F1800
G1 X111.933 Y120.141 Z4 F30000
G1 X111.393 Y121.445 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.686 Y121.408 E.00979
G3 X112.186 Y121.401 I.323 J5.227 E.01661
G3 X111.187 Y121.47 I-.186 J4.598 E.92576
G1 X111.334 Y121.452 E.0049
G1 X111.823 Y121.798 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X112.172 Y121.793 E.01072
G3 X111.713 Y121.8 I-.172 J4.206 E.79855
G1 X111.763 Y121.799 E.00155
M204 S10000
; WIPE_START
G1 F24000
G1 X112.172 Y121.793 E-.15532
G1 X112.402 Y121.809 E-.08768
G1 X112.857 Y121.878 E-.17473
G1 X113.301 Y121.996 E-.17473
G1 X113.712 Y122.155 E-.16754
; WIPE_END
G1 E-.04 F1800
G1 X112.814 Y129.734 Z4 F30000
G1 X111.906 Y137.399 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.916 Y137.399 E.00031
G3 X111.686 Y137.408 I.073 J4.601 E.95145
G1 X111.847 Y137.402 E.00533
G1 X111.86 Y137.794 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.922 Y137.791 E.0019
G3 X111.713 Y137.8 I.068 J4.209 E.80624
G1 X111.8 Y137.796 E.0027
M204 S10000
; WIPE_START
G1 F24000
G1 X111.922 Y137.791 E-.04632
G1 X112.172 Y137.793 E-.09493
G1 X112.63 Y137.837 E-.17491
G1 X113.08 Y137.931 E-.17473
G1 X113.518 Y138.073 E-.17473
G1 X113.744 Y138.175 E-.09437
; WIPE_END
G1 E-.04 F1800
G1 X109.892 Y144.764 Z4 F30000
G1 X106.683 Y150.252 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.357 Y149.997 E.01376
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.417 Y98.608 E.80982
G3 X155.398 Y114.004 I-.421 J15.396 E.78858
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.02 Y150.502 I.01 J-15.412 E.31823
G1 X106.732 Y150.288 E.01191
G1 X106.446 Y150.564 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.01307
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.428 Y98.216 E.75055
G3 X155.79 Y114.001 I-.431 J15.788 E.74898
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.494 Y150.6 E.01136
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.303 E-.18445
G1 X105.456 Y149.753 E-.32492
G1 X104.977 Y149.3 E-.25063
; WIPE_END
G1 E-.04 F1800
G1 X109.503 Y146.905 Z4 F30000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X109.599 Y146.955 E.00358
G2 X111.042 Y147.421 I2.714 J-5.926 E.05041
G1 X116.67 Y153.05 E.26403
G1 X116.302 Y153.05 E.01219
G1 X123.761 Y145.591 E.3499
G3 X122.73 Y143.758 I4.629 J-3.81 E.07012
G1 X110.149 Y131.177 E.59019
G3 X108.449 Y130.199 I1.867 J-5.212 E.06542
G1 X100.95 Y137.698 E.35177
G1 X100.95 Y137.33 E.01219
G1 X106.587 Y142.967 E.26443
G2 X108.113 Y145.887 I5.41 J-.968 E.111
G1 X105.358 Y148.642 E.12922
G2 X109.915 Y151.761 I11.894 J-12.488 E.18397
G1 X115.214 Y146.462 E.24859
G2 X116.364 Y145.357 I-3.522 J-4.816 E.05305
G1 X115.671 Y138.497 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.485304
G1 F14241.043
G2 X111.101 Y137.006 I-3.692 J3.565 E.18034
G1 X110.313 Y137.211 E.02935
G2 X117.042 Y142.568 I1.687 J4.785 E.7792
G2 X115.71 Y138.543 I-5.066 J-.555 E.15761
G1 X114.585 Y137.147 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X115.889 Y138.111 I-2.245 J4.397 E.05401
G1 X124.073 Y129.927 E.38395
G3 X123.345 Y129.021 I4.61 J-4.448 E.03859
G1 X108.783 Y114.459 E.68314
G1 X100.95 Y122.346 E.36872
G1 X100.95 Y121.978 E.01219
G1 X106.822 Y127.85 E.27546
G3 X106.815 Y124.157 I5.088 J-1.856 E.12501
M73 P58 R9
G1 X100.95 Y130.022 E.27513
G1 X100.95 Y129.654 E.01219
G1 X108.783 Y137.541 E.36872
G1 X123.39 Y122.9 E.68603
G3 X123.932 Y122.219 I5.42 J3.759 E.02889
G1 X117.07 Y126.014 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.485575
G1 F14232.313
G2 X111.652 Y120.941 I-5.073 J-.012 E.30034
G1 X110.846 Y121.056 E.02936
G2 X117.042 Y126.568 I1.155 J4.94 E.79974
G1 X117.067 Y126.074 E.01783
G1 X125.838 Y130.641 F30000
; LINE_WIDTH: 0.484648
G1 F14262.178
G2 X124.107 Y122.674 I2.163 J-4.641 E.81865
G2 X125.784 Y130.613 I3.891 J3.325 E.33723
G1 X131.777 Y130.065 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X131.006 Y130.67 I-4.419 J-4.832 E.03254
G1 X116.484 Y145.192 E.68127
G1 X124.346 Y153.05 E.36872
G1 X123.978 Y153.05 E.01219
G1 X129.77 Y147.258 E.27168
G3 X126.242 Y147.27 I-1.781 J-5.33 E.11903
G1 X132.022 Y153.05 E.27114
G1 X131.654 Y153.05 E.01219
G1 X139.436 Y145.255 E.36537
G3 X139.187 Y144.863 I3.523 J-2.516 E.01543
G1 X124.979 Y130.655 E.66652
G3 X124.219 Y130.068 I2.38 J-3.867 E.03189
G1 X128.014 Y136.88 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.484424
G1 F14269.412
G2 X133.112 Y142.291 I-.014 J5.12 E.85805
G2 X128.074 Y136.883 I-5.108 J-.292 E.29715
G1 X140.528 Y138.164 F30000
; LINE_WIDTH: 0.4858
G1 F14225.087
G2 X147.767 Y145.541 I3.472 J3.834 E.60134
G2 X144.362 Y136.835 I-3.771 J-3.544 E.42108
G1 X143.536 Y136.844 E.02978
G2 X140.574 Y138.126 I.461 J5.128 E.11849
; WIPE_START
G1 F24000
G1 X140.959 Y137.814 E-.18826
G1 X141.425 Y137.512 E-.21109
G1 X141.922 Y137.266 E-.21091
G1 X142.289 Y137.122 E-.14974
; WIPE_END
G1 E-.04 F1800
G1 X140.239 Y144.474 Z4 F30000
G1 X139.873 Y145.788 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X141.133 Y146.809 I3.825 J-3.432 E.05402
G1 X146.085 Y151.761 E.2323
G3 X144.563 Y152.337 I-6.734 J-15.475 E.054
G1 X146.39 Y147.062 F30000
G1 F15476.087
G3 X144.84 Y147.54 I-2.283 J-4.657 E.05402
G1 X139.33 Y153.05 E.25847
G1 X139.698 Y153.05 E.01219
G1 X132.239 Y145.591 E.3499
G2 X133.27 Y143.758 I-4.629 J-3.81 E.07012
G1 X145.688 Y131.34 E.58254
G2 X147.621 Y130.269 I-1.587 J-5.148 E.07385
G1 X155.05 Y137.698 E.34848
G1 X155.05 Y137.33 E.01218
G1 X149.534 Y142.846 E.25873
G3 X147.961 Y145.961 I-5.568 J-.858 E.1177
G1 X150.642 Y148.642 E.12576
G2 X153.761 Y144.085 I-12.488 J-11.894 E.18397
G1 X148.807 Y139.131 E.23238
G2 X147.788 Y137.87 I-4.515 J2.607 E.05402
G1 X138.824 Y126.125 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.485911
G1 F14221.515
G2 X148.147 Y122.901 I5.174 J-.131 E.70188
G2 X144.361 Y120.835 I-4.187 J3.171 E.16044
G1 X143.535 Y120.844 E.02983
G2 X138.826 Y126.065 I.482 J5.169 E.2788
G1 X139.73 Y122.378 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X131.591 Y114.239 E.38181
G3 X124.41 Y114.238 I-3.59 J-4.271 E.25879
G1 X116.198 Y122.45 E.38521
G3 X116.198 Y129.55 I-4.199 J3.55 E.25605
G1 X124.409 Y137.761 E.38518
G3 X131.591 Y137.761 I3.591 J4.242 E.25903
G1 X139.729 Y129.623 E.38176
G1 X140.305 Y113.626 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.487944
G1 F14156.555
G2 X149.167 Y109.72 I3.69 J-3.634 E.45386
G1 X149.061 Y108.91 E.0296
G2 X141.655 Y105.388 I-5.07 J1.112 E.3429
G1 X140.957 Y105.811 E.0296
G2 X140.265 Y113.581 I3.058 J4.188 E.32016
G1 X139.073 Y112.659 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X140.037 Y113.963 I4.677 J-2.45 E.05402
G1 X131.927 Y122.073 E.38046
G3 X132.655 Y122.979 I-4.611 J4.448 E.03859
G1 X146.867 Y137.191 E.66675
G3 X147.26 Y137.444 I-1.069 J2.09 E.01551
G1 X155.048 Y129.656 E.36535
G1 X155.048 Y130.02 E.01207
G1 X149.342 Y124.315 E.26765
G3 X149.342 Y127.685 I-5.265 J1.685 E.11363
G1 X155.046 Y121.982 E.26756
G1 X155.046 Y122.342 E.01195
G1 X147.26 Y114.556 E.36527
G1 X147.193 Y114.607 E.00278
G3 X146.867 Y114.809 I-2.038 J-2.932 E.01272
G1 X132.655 Y129.021 E.66672
G3 X131.925 Y129.925 I-4.933 J-3.241 E.03861
G1 X140.017 Y138.055 E.38054
G2 X139.073 Y139.341 I4.364 J4.195 E.0531
G1 X127.986 Y115.124 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483245
G1 F14307.615
G2 X132.497 Y112.448 I.014 J-5.117 E.19761
; LINE_WIDTH: 0.494578
G1 F13948.607
G1 X132.601 Y112.204 E.00976
; LINE_WIDTH: 0.521991
G1 F13150.472
G3 X132.798 Y111.801 I1.586 J.526 E.01757
; LINE_WIDTH: 0.486938
G1 F14188.628
G1 X133 Y111.12 E.02571
G2 X128.292 Y104.881 I-5.014 J-1.112 E.32138
G1 X127.468 Y104.901 E.02982
G2 X125.834 Y114.647 I.543 J5.101 E.48208
; LINE_WIDTH: 0.502854
G1 F13697.632
G1 X126.177 Y114.761 E.01354
; LINE_WIDTH: 0.52431
G1 F13087.12
G3 X126.686 Y114.954 I-.467 J1.992 E.02143
; LINE_WIDTH: 0.485346
G1 F14239.666
G1 X127.427 Y115.092 E.02716
G1 X127.926 Y115.121 E.01803
G1 X116.852 Y112.585 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X115.889 Y113.889 I-4.395 J-2.241 E.05402
G1 X124.075 Y122.075 E.38406
G3 X124.985 Y121.339 I4.285 J4.363 E.03887
G1 X139.187 Y107.137 E.66623
G3 X139.442 Y106.738 I2.733 J1.464 E.01574
G1 X131.658 Y98.954 E.36516
G1 X132.018 Y98.954 E.01195
G1 X126.242 Y104.73 E.27097
G3 X129.77 Y104.742 I1.746 J5.335 E.11903
G1 X123.98 Y98.952 E.27159
G1 X124.344 Y98.952 E.01207
G1 X116.472 Y106.796 E.36863
G1 X131.021 Y121.345 E.68255
G3 X131.781 Y121.932 I-2.382 J3.869 E.03188
G1 X147.801 Y114.112 F30000
G1 F15476.087
G2 X148.823 Y112.852 I-3.526 J-3.909 E.05402
G1 X153.759 Y107.917 E.23154
G2 X150.634 Y103.366 I-13.952 J6.234 E.18413
G1 X147.961 Y106.039 E.12539
G2 X144.843 Y104.463 I-3.919 J3.879 E.11792
G1 X139.336 Y98.956 E.25836
G1 X139.692 Y98.956 E.01183
G1 X132.234 Y106.414 E.34989
G3 X133.27 Y108.242 I-4.439 J3.725 E.07009
G1 X145.688 Y120.66 E.58253
G3 X147.621 Y121.731 I-1.588 J5.149 E.07385
G1 X155.044 Y114.308 E.34822
G1 X155.044 Y114.664 E.01183
G1 X149.535 Y109.115 E.2594
G2 X149.068 Y107.608 I-6.364 J1.149 E.05246
G1 X144.558 Y99.67 F30000
G1 F15476.087
G3 X146.081 Y100.243 I-2.754 J9.637 E.05403
G1 X141.133 Y105.191 E.23212
G2 X139.873 Y106.212 I2.495 J4.366 E.05403
; WIPE_START
G1 F24000
G1 X140.682 Y105.482 E-.41407
G1 X141.133 Y105.191 E-.20396
G1 X141.397 Y104.927 E-.14197
; WIPE_END
G1 E-.04 F1800
G1 X134.157 Y107.343 Z4 F30000
G1 X115.648 Y113.521 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.485041
G1 F14249.488
G2 X117.07 Y110.015 I-3.654 J-3.523 E.1397
G2 X112.222 Y104.928 I-5.092 J-.001 E.2794
G1 X111.4 Y104.959 E.02966
G2 X115.605 Y113.562 I.6 J5.036 E.69679
; WIPE_START
G1 F24000
G1 X115.245 Y113.901 E-.18778
G1 X114.8 Y114.232 E-.2106
G1 X114.322 Y114.512 E-.21058
G1 X113.959 Y114.674 E-.15103
; WIPE_END
G1 E-.04 F1800
G1 X108.685 Y109.157 Z4 F30000
G1 X107.102 Y107.502 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X106.583 Y109.038 I4.603 J2.413 E.054
G1 X100.95 Y114.67 E.26422
G1 X100.95 Y114.302 E.01219
G1 X108.446 Y121.798 E.35163
G3 X110.162 Y120.81 I3.803 J4.624 E.06598
G1 X122.742 Y108.23 E.59014
G3 X123.766 Y106.414 I5.259 J1.77 E.06959
G1 X116.302 Y98.95 E.35015
G1 X116.67 Y98.95 E.01218
G1 X111.032 Y104.588 E.26446
G2 X108.112 Y106.112 I.968 J5.413 E.11098
G1 X105.358 Y103.358 E.12919
G2 X102.239 Y107.915 I11.718 J11.367 E.18406
G1 X107.542 Y113.218 E.24875
G2 X108.617 Y114.342 I4.201 J-2.942 E.05181
; WIPE_START
G1 F24000
G1 X108.126 Y113.912 E-.24817
G1 X107.542 Y113.218 E-.34468
G1 X107.231 Y112.907 E-.16715
; WIPE_END
G1 E-.04 F1800
G1 X109.541 Y105.632 Z4 F30000
G1 X111.437 Y99.663 Z4
G1 Z3.6
G1 E.8 F1800
G1 F15476.087
G2 X109.915 Y100.239 I5.212 J16.052 E.054
G1 X115.204 Y105.528 E.2481
G3 X116.348 Y106.634 I-2.86 J4.101 E.05302
; WIPE_START
G1 F24000
G1 X115.766 Y105.984 E-.33158
G1 X115.204 Y105.528 E-.2751
G1 X114.919 Y105.243 E-.15332
; WIPE_END
G1 E-.04 F1800
G1 X113.462 Y112.735 Z4 F30000
G1 X108.617 Y137.658 Z4
G1 Z3.6
G1 E.8 F1800
G1 F15476.087
G1 X108.595 Y137.673 E.00087
G2 X107.518 Y138.807 I4.041 J4.923 E.05201
G1 X102.239 Y144.085 E.24762
G3 X101.663 Y142.563 I15.476 J-6.734 E.054
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X102.239 Y144.085 E-.6184
G1 X102.503 Y143.821 E-.1416
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
G17
G3 Z4 I.832 J.888 P1  F30000
G1 X126.029 Y121.787 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X126.047 Y121.778 E.00065
G3 X127.748 Y121.355 I1.954 J4.218 E.05851
G3 X128.249 Y121.354 I.253 J5.803 E.01661
G3 X125.602 Y122.014 I-.248 J4.642 E.87711
G1 X125.976 Y121.815 E.01407
G1 X126.211 Y122.134 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X127.769 Y121.746 I1.789 J3.863 E.04963
G3 X128.229 Y121.746 I.231 J5.335 E.01414
G3 X126.157 Y122.16 I-.229 J4.251 E.75625
M204 S10000
; WIPE_START
G1 F24000
G1 X126.64 Y121.963 E-.19802
G1 X127.084 Y121.84 E-.17529
G1 X127.539 Y121.765 E-.17528
G1 X127.769 Y121.746 E-.08767
G1 X128.095 Y121.746 E-.12374
; WIPE_END
G1 E-.04 F1800
G1 X129.535 Y129.242 Z4.2 F30000
G1 X132.315 Y143.72 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.23 Y143.957 E.00837
G3 X127.797 Y137.353 I-4.219 J-1.958 E.653
G3 X128.252 Y137.355 I.215 J4.192 E.01508
G3 X132.418 Y143.488 I-.241 J4.645 E.28464
G1 X132.34 Y143.665 E.0064
G1 X131.95 Y143.594 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X131.771 Y143.999 E.01362
G3 X127.817 Y137.745 I-3.761 J-2 E.54682
G3 X128.231 Y137.746 I.195 J3.816 E.01272
G3 X131.98 Y143.544 I-.22 J4.254 E.24736
M204 S10000
; WIPE_START
G1 F24000
G1 X131.771 Y143.999 E-.19044
G1 X131.526 Y144.391 E-.17549
G1 X131.391 Y144.578 E-.08767
G1 X131.093 Y144.93 E-.17529
G1 X130.842 Y145.167 E-.13112
; WIPE_END
G1 E-.04 F1800
G1 X137.415 Y141.286 Z4.2 F30000
G1 X144.157 Y137.306 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.315 Y137.31 E.00526
G3 X144.567 Y137.332 I-.327 J5.125 E.00838
G3 X143.86 Y137.301 I-.56 J4.665 E.95583
G1 X144.097 Y137.305 E.00785
G1 X143.897 Y137.693 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.289 Y137.7 E.01206
G3 X143.837 Y137.694 I-.279 J4.3 E.81801
M204 S10000
; WIPE_START
G1 F24000
G1 X144.289 Y137.7 E-.17191
G1 X144.748 Y137.755 E-.17583
G1 X145.199 Y137.86 E-.17582
G1 X145.636 Y138.012 E-.17583
G1 X145.78 Y138.081 E-.0606
; WIPE_END
G1 E-.04 F1800
G1 X145.05 Y130.483 Z4.2 F30000
G1 X144.168 Y121.306 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.315 Y121.31 E.00489
G3 X144.567 Y121.332 I-.325 J5.1 E.00838
G3 X143.871 Y121.301 I-.559 J4.668 E.95677
G1 X144.108 Y121.305 E.00788
G1 X143.877 Y121.693 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.884 Y121.693 E.00021
G3 X144.52 Y121.721 I.107 J4.676 E.01956
G3 X143.597 Y121.711 I-.512 J4.276 E.80306
G1 X143.817 Y121.697 E.00679
M204 S10000
; WIPE_START
G1 F24000
G1 X143.884 Y121.693 E-.02544
G1 X144.52 Y121.721 E-.24166
G1 X144.975 Y121.802 E-.17583
G1 X145.42 Y121.93 E-.17583
G1 X145.764 Y122.072 E-.14125
; WIPE_END
G1 E-.04 F1800
G1 X147.565 Y114.655 Z4.2 F30000
G1 X148.701 Y109.98 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.709 Y110 E.00071
G3 X143.982 Y105.299 I-4.7 J-.001 E.73383
G3 X144.817 Y105.369 I-.165 J6.99 E.02781
G3 X148.682 Y109.495 I-.808 J4.63 E.20121
G1 X148.699 Y109.92 E.0141
G1 X148.309 Y109.975 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X148.32 Y110 E.00085
G3 X143.987 Y105.691 I-4.309 J.001 E.62326
G3 X144.52 Y105.721 I-.001 J4.748 E.0164
G3 X148.295 Y109.537 I-.509 J4.279 E.17805
G1 X148.307 Y109.915 E.01162
M204 S10000
; WIPE_START
G1 F24000
G1 X148.32 Y110 E-.03274
G1 X148.304 Y110.231 E-.08813
G1 X148.254 Y110.691 E-.17583
G1 X148.156 Y111.143 E-.17583
G1 X148.009 Y111.582 E-.17583
G1 X147.918 Y111.795 E-.08794
G1 X147.889 Y111.851 E-.02371
; WIPE_END
G1 E-.04 F1800
G1 X140.617 Y109.535 Z4.2 F30000
G1 X127.539 Y105.372 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X127.83 Y105.352 E.00968
G3 X128.503 Y105.375 I.169 J5.01 E.02237
G3 X127.479 Y105.379 I-.493 J4.625 E.93544
G1 X127.84 Y105.744 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X128.461 Y105.765 I.158 J4.594 E.01909
G3 X127.78 Y105.747 I-.451 J4.235 E.8014
M204 S10000
; WIPE_START
G1 F24000
G1 X128.461 Y105.765 E-.2586
G1 X128.916 Y105.84 E-.17528
G1 X129.36 Y105.963 E-.17529
G1 X129.577 Y106.042 E-.08767
G1 X129.728 Y106.112 E-.06316
; WIPE_END
G1 E-.04 F1800
G1 X122.648 Y108.964 Z4.2 F30000
G1 X116.35 Y111.501 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.177 Y111.951 E.01601
G3 X111.767 Y105.405 I-4.166 J-1.952 E.64427
G3 X112.439 Y105.419 I.236 J4.952 E.02232
G3 X116.377 Y111.449 I-.429 J4.581 E.27439
G1 X115.929 Y111.498 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X115.82 Y111.785 E.00943
G3 X111.783 Y105.797 I-3.811 J-1.785 E.54583
G3 X112.402 Y105.809 I.219 J4.536 E.01903
G3 X115.993 Y111.358 I-.393 J4.19 E.23355
G1 X115.954 Y111.443 E.00288
M204 S10000
; WIPE_START
G1 F24000
G1 X115.82 Y111.785 E-.13942
G1 X115.597 Y112.187 E-.17489
G1 X115.337 Y112.567 E-.17473
G1 X115.144 Y112.797 E-.11424
G1 X114.874 Y113.077 E-.14788
G1 X114.856 Y113.092 E-.00885
; WIPE_END
G1 E-.04 F1800
G1 X111.933 Y120.142 Z4.2 F30000
G1 X111.393 Y121.445 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.686 Y121.408 E.00979
G3 X112.185 Y121.401 I.331 J5.736 E.01657
G3 X111.187 Y121.47 I-.184 J4.598 E.92581
G1 X111.333 Y121.452 E.00489
G1 X111.813 Y121.798 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X112.171 Y121.793 E.01101
G3 X111.713 Y121.8 I-.171 J4.206 E.79857
G1 X111.753 Y121.799 E.00124
M204 S10000
; WIPE_START
G1 F24000
M73 P59 R9
G1 X112.171 Y121.793 E-.15893
G1 X112.402 Y121.809 E-.08785
G1 X112.857 Y121.878 E-.17473
G1 X113.301 Y121.996 E-.17473
G1 X113.703 Y122.151 E-.16376
; WIPE_END
G1 E-.04 F1800
G1 X112.846 Y129.736 Z4.2 F30000
G1 X111.98 Y137.404 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X112.186 Y137.401 E.00681
G3 X111.686 Y137.408 I-.185 J4.598 E.94247
G1 X111.92 Y137.405 E.00778
G1 X111.846 Y137.798 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X112.171 Y137.793 E.01001
G3 X111.713 Y137.8 I-.171 J4.206 E.79856
G1 X111.786 Y137.799 E.00225
M204 S10000
; WIPE_START
G1 F24000
G1 X112.171 Y137.793 E-.14655
G1 X112.402 Y137.809 E-.08779
G1 X112.857 Y137.878 E-.17472
G1 X113.301 Y137.996 E-.17473
G1 X113.73 Y138.162 E-.17473
G1 X113.733 Y138.164 E-.00148
; WIPE_END
G1 E-.04 F1800
G1 X109.891 Y144.758 Z4.2 F30000
G1 X106.688 Y150.256 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.357 Y149.997 E.01397
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.221 Y98.605 E.80331
G3 X155.398 Y114.004 I-.222 J15.397 E.79508
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.401 J.001 E.80255
G1 X116.004 Y153.398 E.79585
G3 X107.02 Y150.502 I.01 J-15.412 E.31823
G1 X106.737 Y150.292 E.0117
G1 X106.451 Y150.568 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.01327
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.226 Y98.213 E.74436
G3 X155.79 Y114.001 I-.238 J15.8 E.75502
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.794 J-.002 E.76217
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.499 Y150.604 E.01116
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.303 E-.18684
G1 X105.456 Y149.753 E-.32492
G1 X104.981 Y149.304 E-.24824
; WIPE_END
G1 E-.04 F1800
G1 X109.503 Y146.905 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X109.599 Y146.955 E.00358
G2 X111.042 Y147.421 I2.714 J-5.926 E.05041
G1 X116.67 Y153.05 E.26403
G1 X116.302 Y153.05 E.01219
G1 X123.761 Y145.591 E.3499
G3 X122.73 Y143.758 I4.629 J-3.81 E.07012
G1 X100.95 Y121.978 E1.02173
G1 X100.95 Y122.346 E.01219
G1 X109.212 Y114.084 E.38759
G2 X115.497 Y113.497 I2.788 J-4.089 E.22704
G1 X124.465 Y122.465 E.42072
G2 X124.468 Y129.532 I3.529 J3.532 E.26044
G1 X115.889 Y138.111 E.40246
G2 X114.585 Y137.147 I-3.549 J3.433 E.05401
G1 X115.671 Y138.497 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.485304
G1 F14241.043
G2 X111.101 Y137.006 I-3.692 J3.565 E.18034
G1 X110.313 Y137.211 E.02935
G2 X117.042 Y142.568 I1.687 J4.785 E.7792
G2 X115.71 Y138.543 I-5.066 J-.555 E.15761
G1 X125.789 Y136.909 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X125.68 Y136.952 E.0039
G2 X124.409 Y137.761 I2.847 J5.878 E.05009
G1 X115.805 Y129.157 E.40361
G2 X115.805 Y122.843 I-3.907 J-3.157 E.22651
G1 X124.804 Y113.844 E.42216
G2 X131.196 Y113.844 I3.196 J-3.867 E.22987
G1 X140.123 Y122.771 E.41875
G2 X140.123 Y129.229 I3.984 J3.229 E.23176
G1 X131.591 Y137.761 E.40023
G3 X132.661 Y138.981 I-4.227 J4.79 E.05398
G1 X128.014 Y136.88 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.484743
G1 F14259.117
G2 X133.112 Y142.291 I-.014 J5.12 E.85867
G2 X131.917 Y138.692 I-5.197 J-.273 E.13977
; LINE_WIDTH: 0.513392
G1 F13390.807
G1 X131.378 Y138.183 E.02842
G1 X131.265 Y138.049 E.00672
; LINE_WIDTH: 0.483543
G1 F14297.961
G1 X130.658 Y137.62 E.02669
G2 X128.074 Y136.883 I-2.68 J4.502 E.09757
G1 X139.073 Y139.341 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X140.037 Y138.037 I4.677 J2.45 E.05402
G1 X131.532 Y129.532 E.39897
G2 X131.532 Y122.468 I-3.521 J-3.532 E.26041
G1 X140.433 Y113.567 E.41757
G3 X139.844 Y107.141 I3.568 J-3.567 E.23225
G1 X131.656 Y98.952 E.38413
G1 X132.02 Y98.952 E.01206
G1 X124.84 Y106.132 E.3368
G2 X124.291 Y106.652 I2.449 J3.132 E.02514
; WIPE_START
G1 F24000
G1 X124.84 Y106.132 E-.28754
G1 X125.719 Y105.253 E-.47246
; WIPE_END
G1 E-.04 F1800
G1 X131.709 Y106.652 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
G1 F15476.087
G3 X123.979 Y98.951 I353.495 J-362.523 E.36195
G1 X124.345 Y98.951 E.01212
G1 X116.088 Y107.208 E.38733
G3 X116.771 Y108.679 I-4.652 J3.053 E.05398
; WIPE_START
G1 F24000
G1 X116.487 Y107.909 E-.31183
G1 X116.088 Y107.208 E-.30643
G1 X116.352 Y106.944 E-.14174
; WIPE_END
G1 E-.04 F1800
G1 X108.72 Y106.858 Z4.2 F30000
G1 X108.188 Y106.852 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F15476.087
G2 X107.369 Y108.251 I6.409 J4.689 E.05385
G1 X100.95 Y114.67 E.30113
G1 X100.95 Y114.302 E.01219
G1 X108.84 Y122.192 E.3701
; WIPE_START
G1 F24000
G1 X107.425 Y120.777 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.608 Y128.318 Z4.2 F30000
G1 X108.842 Y129.806 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F15476.087
G1 X100.95 Y137.698 E.3702
G1 X100.95 Y137.33 E.01219
G1 X106.587 Y142.967 E.26443
G2 X108.113 Y145.887 I5.41 J-.968 E.111
G1 X105.358 Y148.642 E.12922
G3 X102.239 Y144.085 I10.834 J-10.762 E.18419
G1 X107.539 Y138.773 E.24891
G3 X108.617 Y137.658 I5.067 J3.821 E.05156
; WIPE_START
G1 F24000
G1 X107.933 Y138.289 E-.35361
G1 X107.539 Y138.773 E-.23704
G1 X107.224 Y139.088 E-.16936
; WIPE_END
G1 E-.04 F1800
G1 X109.537 Y146.362 Z4.2 F30000
G1 X111.437 Y152.338 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F15476.087
G3 X109.916 Y151.76 I4.936 J-15.285 E.054
G1 X115.214 Y146.462 E.24854
G2 X116.364 Y145.357 I-3.522 J-4.816 E.05305
; WIPE_START
G1 F24000
G1 X115.964 Y145.821 E-.2327
G1 X115.214 Y146.462 E-.37491
G1 X114.931 Y146.745 E-.15239
; WIPE_END
G1 E-.04 F1800
G1 X122.167 Y144.319 Z4.2 F30000
G1 X140.528 Y138.164 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4858
G1 F14225.087
G2 X147.767 Y145.541 I3.472 J3.834 E.60134
G2 X144.362 Y136.835 I-3.771 J-3.544 E.42108
G1 X143.536 Y136.844 E.02978
G2 X140.574 Y138.126 I.461 J5.128 E.11849
; WIPE_START
G1 F24000
G1 X140.959 Y137.814 E-.18826
G1 X141.425 Y137.512 E-.21109
G1 X141.922 Y137.266 E-.21091
G1 X142.289 Y137.122 E-.14974
; WIPE_END
G1 E-.04 F1800
G1 X147.788 Y137.87 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X147.881 Y137.955 E.00421
G3 X148.807 Y139.131 I-4.255 J4.303 E.04977
G1 X153.761 Y144.085 E.23238
G3 X150.642 Y148.642 I-15.607 J-7.338 E.18397
G1 X147.961 Y145.961 E.12576
G2 X149.534 Y142.846 I-3.995 J-3.973 E.1177
G1 X155.05 Y137.33 E.25873
G1 X155.05 Y137.698 E.01218
G1 X147.23 Y129.878 E.36683
G1 X146.875 Y130.153 E.0149
G1 X133.268 Y143.763 E.6384
G3 X132.239 Y145.591 I-5.703 J-2.008 E.06993
G1 X139.698 Y153.05 E.3499
G1 X139.33 Y153.05 E.01219
G1 X144.84 Y147.54 E.25847
G1 X144.994 Y147.516 E.00519
G2 X146.39 Y147.062 I-1.157 J-5.928 E.0488
G1 X144.56 Y152.329 F30000
G1 F15476.087
G2 X146.085 Y151.761 I-4.237 J-13.704 E.054
G1 X141.133 Y146.809 E.2323
G3 X139.873 Y145.788 I2.565 J-4.453 E.05402
; WIPE_START
G1 F24000
G1 X140.45 Y146.338 E-.30289
G1 X141.133 Y146.809 E-.31529
G1 X141.397 Y147.073 E-.14181
; WIPE_END
G1 E-.04 F1800
G1 X143.89 Y139.859 Z4.2 F30000
G1 X147.385 Y129.746 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F15476.087
G2 X148.129 Y128.899 I-5.875 J-5.909 E.03742
G1 X155.046 Y121.982 E.3245
G1 X155.046 Y122.342 E.01195
G1 X146.859 Y114.155 E.38407
G2 X148.795 Y108.415 I-2.848 J-4.157 E.21557
G1 X155.044 Y114.664 E.29315
G1 X155.044 Y114.308 E.01183
G1 X147.228 Y122.124 E.36666
G2 X146.903 Y121.875 I-1.32 J1.391 E.0136
G1 X131.84 Y106.808 E.70674
G1 X139.695 Y98.953 E.36846
G1 X139.333 Y98.953 E.012
G1 X145.594 Y105.214 E.29371
G3 X147.569 Y106.431 I-1.832 J5.181 E.07753
G1 X150.634 Y103.366 E.14379
G2 X146.083 Y100.241 I-10.785 J10.827 E.18413
G1 X108.783 Y137.541 E1.74982
G1 X100.95 Y129.654 E.36872
G1 X100.95 Y130.022 E.01219
G1 X124.16 Y106.808 E1.08891
G1 X116.302 Y98.95 E.3686
G1 X116.67 Y98.95 E.01219
G1 X110.245 Y105.375 E.30141
G2 X108.504 Y106.504 I1.791 J4.668 E.06932
G1 X105.362 Y103.362 E.14739
G3 X109.915 Y100.239 I10.914 J11.03 E.18412
G1 X146.867 Y137.191 E1.7335
G3 X147.26 Y137.444 I-1.069 J2.09 E.01551
G1 X155.048 Y129.656 E.36535
G1 X155.048 Y130.02 E.01207
G1 X148.129 Y123.101 E.32459
G2 X147.383 Y122.256 I-6.113 J4.651 E.03741
; WIPE_START
G1 F24000
G1 X148.129 Y123.101 E-.42818
G1 X148.746 Y123.718 E-.33182
; WIPE_END
G1 E-.04 F1800
G1 X141.442 Y121.503 Z4.2 F30000
G1 X101.662 Y109.437 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F15476.087
G3 X102.24 Y107.916 I15.287 J4.936 E.054
G1 X139.187 Y144.863 E1.73323
G2 X139.442 Y145.262 I2.733 J-1.464 E.01574
G1 X131.654 Y153.05 E.36533
G1 X132.022 Y153.05 E.01219
G1 X126.242 Y147.27 E.27114
G2 X129.77 Y147.258 I1.746 J-5.341 E.11903
G1 X123.978 Y153.05 E.27168
G1 X124.346 Y153.05 E.01219
G1 X116.484 Y145.192 E.36872
G1 X153.757 Y107.919 E1.74857
G3 X154.33 Y109.442 I-9.065 J4.277 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X153.757 Y107.919 E-.61827
G1 X153.493 Y108.183 E-.14173
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
G17
G3 Z4.2 I-.54 J-1.09 P1  F30000
G1 X126.065 Y121.77 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X126.516 Y121.595 E.01605
G3 X127.902 Y121.35 I1.493 J4.405 E.04688
G3 X128.753 Y121.409 I-.037 J6.732 E.02829
G3 X126.013 Y121.799 I-.744 J4.591 E.87623
G1 X126.213 Y122.138 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X127.913 Y121.742 I1.795 J3.86 E.054
G3 X128.689 Y121.796 I-.039 J6.189 E.02393
G3 X126.159 Y122.164 I-.681 J4.202 E.74204
M204 S10000
; WIPE_START
G1 F24000
G1 X126.64 Y121.963 E-.19795
G1 X127.084 Y121.84 E-.17529
G1 X127.539 Y121.765 E-.17528
G1 X127.913 Y121.742 E-.14218
G1 X128.095 Y121.745 E-.0693
; WIPE_END
G1 E-.04 F1800
G1 X127.848 Y114.116 Z4.4 F30000
G1 X127.564 Y105.371 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X127.853 Y105.352 E.00963
G3 X128.753 Y105.409 I.044 J6.393 E.02992
G3 X127.497 Y105.377 I-.744 J4.591 E.92767
G1 X127.504 Y105.377 E.00022
G1 X127.841 Y105.745 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X127.864 Y105.744 E.00071
G3 X128.461 Y105.765 I.136 J4.564 E.01836
G3 X127.54 Y105.767 I-.45 J4.235 E.79395
G1 X127.781 Y105.75 E.00744
M204 S10000
; WIPE_START
G1 F24000
G1 X127.864 Y105.744 E-.03157
G1 X128.461 Y105.765 E-.22687
G1 X128.916 Y105.84 E-.17528
G1 X129.36 Y105.963 E-.17529
G1 X129.729 Y106.11 E-.15099
; WIPE_END
G1 E-.04 F1800
G1 X122.681 Y109.038 Z4.4 F30000
G1 X116.276 Y111.698 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.277 Y111.72 E.00073
G3 X111.791 Y105.404 I-4.268 J-1.72 E.65361
G3 X112.689 Y105.45 I.13 J6.324 E.02985
G3 X116.439 Y111.244 I-.68 J4.551 E.25888
G1 X116.297 Y111.642 E.01402
G1 X115.93 Y111.499 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X115.914 Y111.575 E.00237
G3 X111.807 Y105.796 I-3.903 J-1.575 E.55361
G3 X112.402 Y105.809 I.197 J4.507 E.0183
G3 X116.063 Y111.138 I-.391 J4.191 E.22654
G1 X115.951 Y111.443 E.00996
M204 S10000
; WIPE_START
G1 F24000
G1 X115.914 Y111.575 E-.05201
G1 X115.814 Y111.782 E-.08756
G1 X115.597 Y112.187 E-.17473
G1 X115.337 Y112.567 E-.17473
G1 X115.192 Y112.745 E-.0874
G1 X114.874 Y113.077 E-.17473
G1 X114.856 Y113.092 E-.00884
; WIPE_END
G1 E-.04 F1800
G1 X112.477 Y120.344 Z4.4 F30000
G1 X112.131 Y121.402 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X112.188 Y121.408 E.00192
G3 X112.689 Y121.45 I-.294 J6.653 E.01667
G3 X111.84 Y121.402 I-.68 J4.55 E.9307
G1 X112.071 Y121.402 E.00767
G1 X111.803 Y121.798 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.856 Y121.794 E.00164
G3 X112.63 Y121.837 I.045 J6.116 E.02385
G3 X111.484 Y121.824 I-.622 J4.163 E.77734
G1 X111.743 Y121.803 E.00798
M204 S10000
; WIPE_START
G1 F24000
G1 X111.856 Y121.794 E-.04304
G1 X112.172 Y121.793 E-.12038
G1 X112.63 Y121.837 E-.17473
G1 X113.08 Y121.931 E-.17474
G1 X113.301 Y121.996 E-.0874
G1 X113.693 Y122.147 E-.15972
; WIPE_END
G1 E-.04 F1800
G1 X112.92 Y129.741 Z4.4 F30000
G1 X112.14 Y137.402 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X112.188 Y137.408 E.00161
G3 X112.689 Y137.45 I-.302 J6.74 E.01667
G3 X111.848 Y137.402 I-.68 J4.551 E.93108
G1 X112.08 Y137.402 E.0077
G1 X111.83 Y137.796 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.864 Y137.794 E.00106
G3 X112.402 Y137.809 I.136 J4.592 E.01655
G3 X111.484 Y137.824 I-.391 J4.191 E.78441
G1 X111.77 Y137.801 E.00881
M204 S10000
; WIPE_START
M73 P60 R9
G1 F24000
G1 X111.864 Y137.794 E-.03588
G1 X112.402 Y137.809 E-.20451
G1 X112.63 Y137.837 E-.08739
G1 X113.08 Y137.931 E-.17474
G1 X113.518 Y138.073 E-.17473
G1 X113.716 Y138.162 E-.08275
; WIPE_END
G1 E-.04 F1800
G1 X121.027 Y140.355 Z4.4 F30000
G1 X132.313 Y143.74 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.118 Y144.183 E.01606
G3 X127.838 Y137.352 I-4.107 J-2.183 E.64597
G3 X128.503 Y137.375 I.161 J4.998 E.0221
G3 X132.344 Y143.691 I-.492 J4.625 E.28341
G1 X131.965 Y143.58 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X127.848 Y137.744 I-3.955 J-1.58 E.56203
G3 X128.461 Y137.765 I.151 J4.581 E.01884
G3 X131.987 Y143.524 I-.451 J4.235 E.23958
M204 S10000
; WIPE_START
G1 F24000
G1 X131.764 Y143.995 E-.19819
G1 X131.526 Y144.391 E-.17528
G1 X131.391 Y144.578 E-.08767
G1 X131.093 Y144.93 E-.17528
G1 X130.857 Y145.153 E-.12357
; WIPE_END
G1 E-.04 F1800
G1 X137.359 Y141.157 Z4.4 F30000
G1 X143.609 Y137.316 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.9 Y137.3 E.00966
G3 X144.567 Y137.332 I.094 J5.054 E.02215
G3 X143.55 Y137.322 I-.556 J4.668 E.94609
G1 X143.896 Y137.693 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.905 Y137.692 E.0003
G3 X144.52 Y137.721 I.089 J4.637 E.0189
G3 X143.596 Y137.711 I-.51 J4.279 E.80353
G1 X143.836 Y137.696 E.0074
M204 S10000
; WIPE_START
G1 F24000
G1 X143.905 Y137.692 E-.02645
G1 X144.52 Y137.721 E-.2336
G1 X144.975 Y137.802 E-.17583
G1 X145.42 Y137.93 E-.17583
G1 X145.636 Y138.013 E-.08795
G1 X145.779 Y138.081 E-.06034
; WIPE_END
G1 E-.04 F1800
G1 X145.063 Y130.482 Z4.4 F30000
G1 X144.198 Y121.306 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.315 Y121.315 E.0039
G3 X144.817 Y121.369 I-.438 J6.414 E.01674
G3 X143.909 Y121.3 I-.808 J4.631 E.94965
G1 X144.138 Y121.305 E.0076
G1 X143.878 Y121.694 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.914 Y121.692 E.00111
G3 X144.52 Y121.721 I.081 J4.626 E.01865
G3 X143.596 Y121.711 I-.509 J4.279 E.80355
G1 X143.818 Y121.698 E.00684
M204 S10000
; WIPE_START
G1 F24000
G1 X143.914 Y121.692 E-.03654
G1 X144.52 Y121.721 E-.23042
G1 X144.975 Y121.802 E-.17583
G1 X145.42 Y121.93 E-.17582
G1 X145.636 Y122.012 E-.08795
G1 X145.763 Y122.073 E-.05345
; WIPE_END
G1 E-.04 F1800
G1 X147.565 Y114.656 Z4.4 F30000
G1 X148.701 Y109.981 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.71 Y110 E.00071
G3 X143.958 Y105.3 I-4.701 J.001 E.73325
G3 X144.817 Y105.369 I-.113 J6.734 E.0286
G3 X148.683 Y109.495 I-.808 J4.632 E.20125
G1 X148.699 Y109.921 E.01413
G1 X148.309 Y109.975 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X148.318 Y110 E.00082
G3 X143.963 Y105.692 I-4.309 J.001 E.62261
G3 X144.748 Y105.755 I-.107 J6.188 E.02423
G3 X148.293 Y109.537 I-.74 J4.245 E.17087
G1 X148.306 Y109.915 E.01161
M204 S10000
; WIPE_START
G1 F24000
G1 X148.318 Y110 E-.03264
G1 X148.285 Y110.462 E-.176
G1 X148.254 Y110.691 E-.08794
G1 X148.211 Y110.919 E-.08795
G1 X148.088 Y111.365 E-.17582
G1 X147.918 Y111.795 E-.17583
G1 X147.889 Y111.851 E-.02382
; WIPE_END
G1 E-.04 F1800
G1 X142.307 Y117.056 Z4.4 F30000
G1 X106.693 Y150.26 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.354 Y150 E.01418
G3 X100.602 Y137.996 I9.65 J-12.004 E.4566
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.401 J-.001 E.80255
G1 X140.233 Y98.605 E.80372
G3 X155.398 Y114.004 I-.234 J15.397 E.79466
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.401 J.001 E.80255
G1 X116.004 Y153.398 E.79585
G3 X107.018 Y150.505 I-.001 J-15.401 E.31828
G1 X106.741 Y150.296 E.01149
G1 X106.456 Y150.572 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.108 Y150.306 E.01346
G3 X100.21 Y137.999 I9.895 J-12.309 E.43364
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.794 J.002 E.76217
G1 X140.239 Y98.213 E.74474
G3 X143.209 Y98.541 I-.232 J15.728 E.09197
G3 X155.79 Y114.001 I-3.226 J15.474 E.66269
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.794 J-.002 E.76217
G1 X116.001 Y153.79 E.73736
G3 X106.789 Y150.823 I.002 J-15.794 E.30225
G1 X106.504 Y150.608 E.01097
M204 S10000
; WIPE_START
G1 F24000
G1 X106.108 Y150.306 E-.18927
G1 X105.456 Y149.753 E-.32495
G1 X104.986 Y149.309 E-.24578
; WIPE_END
G1 E-.04 F1800
G1 X108.842 Y145.807 Z4.4 F30000
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X110.242 Y146.622 I3.222 J-3.925 E.05396
G1 X116.67 Y153.05 E.30154
G1 X116.302 Y153.05 E.01219
G1 X124.16 Y145.192 E.3686
G1 X100.95 Y121.978 E1.08891
G1 X100.95 Y122.346 E.01219
G1 X109.21 Y114.086 E.38747
G3 X107.369 Y108.251 I2.813 J-4.095 E.21866
G1 X100.95 Y114.67 E.30113
G1 X100.95 Y114.302 E.01219
G1 X108.84 Y122.192 E.3701
; WIPE_START
G1 F24000
G1 X107.425 Y120.777 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.606 Y128.318 Z4.4 F30000
G1 X108.84 Y129.808 Z4.4
G1 Z4
G1 E.8 F1800
G1 F15476.087
G1 X100.95 Y137.698 E.3701
G1 X100.95 Y137.33 E.01219
G1 X107.38 Y143.76 E.30162
G2 X108.5 Y145.5 I4.752 J-1.828 E.06914
G1 X105.358 Y148.642 E.14737
G2 X109.915 Y151.761 I11.894 J-12.488 E.18397
G1 X153.757 Y107.919 E2.05671
G3 X154.33 Y109.442 I-9.065 J4.277 E.05403
G1 X147.382 Y122.257 F30000
G1 F15476.087
G3 X148.144 Y123.116 I-10.05 J9.671 E.03808
G1 X155.048 Y130.02 E.32389
G1 X155.048 Y129.656 E.01207
G1 X146.859 Y137.845 E.38415
G3 X148.795 Y143.585 I-2.873 J4.166 E.21542
G1 X155.05 Y137.33 E.2934
G1 X155.05 Y137.698 E.01218
G1 X147.228 Y129.876 E.36692
G3 X146.877 Y130.151 I-1.876 J-2.038 E.0148
G1 X131.844 Y145.196 E.70552
G1 X139.698 Y153.05 E.36845
G1 X139.33 Y153.05 E.01219
G1 X145.589 Y146.791 E.29361
G2 X147.569 Y145.569 I-1.656 J-4.896 E.07784
G1 X150.642 Y148.642 E.14416
G2 X153.761 Y144.085 I-12.49 J-11.896 E.18397
G1 X109.915 Y100.239 E2.05689
G3 X111.437 Y99.663 I6.734 J15.474 E.054
G1 X124.291 Y106.652 F30000
G1 F15476.087
G2 X132.02 Y98.952 I-391.282 J-400.448 E.36189
G1 X131.656 Y98.952 E.01205
G1 X139.844 Y107.141 E.38412
G2 X140.429 Y113.571 I4.17 J2.862 E.2323
G1 X131.535 Y122.465 E.41726
G3 X131.532 Y129.532 I-3.623 J3.532 E.25952
G1 X140.429 Y138.429 E.41738
G2 X139.842 Y144.862 I3.57 J3.569 E.23249
G1 X131.654 Y153.05 E.38411
G1 X132.022 Y153.05 E.01219
G1 X124.851 Y145.879 E.33637
G3 X124.291 Y145.348 I3.806 J-4.57 E.02564
; WIPE_START
G1 F24000
G1 X124.851 Y145.879 E-.29351
G1 X125.719 Y146.747 E-.46649
; WIPE_END
G1 E-.04 F1800
G1 X131.708 Y145.347 Z4.4 F30000
G1 Z4
G1 E.8 F1800
G1 F15476.087
G2 X123.978 Y153.05 I631.489 J641.444 E.36199
G1 X124.346 Y153.05 E.01219
G1 X116.088 Y144.792 E.38739
G2 X116.764 Y143.319 I-6.856 J-4.04 E.05385
; WIPE_START
G1 F24000
G1 X116.486 Y144.096 E-.31349
G1 X116.088 Y144.792 E-.30462
G1 X116.352 Y145.056 E-.14189
; WIPE_END
M73 P60 R8
G1 E-.04 F1800
G1 X108.827 Y143.779 Z4.4 F30000
G1 X101.663 Y142.563 Z4.4
G1 Z4
G1 E.8 F1800
G1 F15476.087
G2 X102.239 Y144.085 I16.052 J-5.213 E.054
G1 X146.083 Y100.241 E2.05681
G3 X150.634 Y103.366 I-6.234 J13.952 E.18413
G1 X147.569 Y106.431 E.14379
G2 X145.594 Y105.214 I-4.158 J4.534 E.07741
G1 X139.333 Y98.953 E.29371
G1 X139.695 Y98.953 E.01199
G1 X131.844 Y106.804 E.3683
G1 X146.877 Y121.849 E.70552
G3 X147.228 Y122.124 I-1.525 J2.312 E.0148
G1 X155.044 Y114.308 E.36666
G1 X155.044 Y114.664 E.01183
G1 X148.795 Y108.415 E.29315
G3 X146.86 Y114.157 I-4.813 J1.575 E.21543
G1 X155.046 Y122.342 E.384
G1 X155.046 Y121.982 E.01195
G1 X148.129 Y128.899 E.3245
G3 X147.382 Y129.743 I-6.06 J-4.605 E.03741
; WIPE_START
G1 F24000
G1 X148.129 Y128.899 E-.42817
G1 X148.746 Y128.282 E-.33183
; WIPE_END
G1 E-.04 F1800
G1 X141.749 Y125.233 Z4.4 F30000
G1 X139.296 Y124.165 Z4.4
G1 Z4
G1 E.8 F1800
G1 F15476.087
G3 X140.123 Y122.771 I7.586 J3.552 E.05385
G1 X131.196 Y113.844 E.41875
G3 X124.808 Y113.84 I-3.192 J-3.858 E.22983
G1 X115.805 Y122.843 E.42232
G3 X115.805 Y129.157 I-3.797 J3.157 E.22725
G1 X124.804 Y138.156 E.42214
G3 X131.196 Y138.156 I3.195 J3.909 E.22959
G1 X140.123 Y129.229 E.41882
G2 X141.347 Y130.291 I5.749 J-5.384 E.05384
; WIPE_START
G1 F24000
G1 X140.6 Y129.735 E-.35359
G1 X140.123 Y129.229 E-.26441
G1 X139.859 Y129.493 E-.142
; WIPE_END
G1 E-.04 F1800
G1 X141.398 Y136.969 Z4.4 F30000
G1 X144.563 Y152.337 Z4.4
G1 Z4
G1 E.8 F1800
G1 F15476.087
G2 X146.085 Y151.761 I-5.212 J-16.052 E.054
G1 X102.239 Y107.915 E2.05689
G3 X105.362 Y103.362 I13.805 J6.122 E.18418
G1 X108.5 Y106.5 E.14719
G3 X110.245 Y105.375 I3.62 J3.702 E.06933
G1 X116.67 Y98.95 E.30141
G1 X116.302 Y98.95 E.01219
G1 X124.16 Y106.808 E.3686
G1 X100.95 Y130.022 E1.08891
G1 X100.95 Y129.654 E.01219
G1 X109.213 Y137.916 E.38759
G3 X115.496 Y138.504 I2.788 J4.087 E.22703
G1 X124.468 Y129.532 E.42085
G3 X124.465 Y122.465 I3.621 J-3.535 E.25952
G1 X115.496 Y113.496 E.42075
G2 X116.084 Y107.212 I-3.495 J-3.497 E.2271
G1 X124.345 Y98.951 E.3875
G1 X123.979 Y98.951 E.01212
G1 X131.16 Y106.132 E.33685
G3 X131.708 Y106.653 I-2.122 J2.781 E.02514
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.16 Y106.132 E-.28747
G1 X130.28 Y105.253 E-.47253
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
G17
G3 Z4.4 I-1.179 J-.301 P1  F30000
G1 X126.065 Y121.77 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X126.516 Y121.595 E.01605
G3 X127.877 Y121.351 I1.493 J4.405 E.04605
G3 X128.753 Y121.409 I.008 J6.527 E.02913
G3 X126.013 Y121.799 I-.744 J4.592 E.87623
G1 X126.213 Y122.138 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X127.888 Y121.743 I1.795 J3.86 E.05323
G3 X128.689 Y121.796 I.006 J5.978 E.0247
G3 X126.159 Y122.164 I-.681 J4.202 E.74204
M204 S10000
; WIPE_START
G1 F24000
G1 X126.64 Y121.963 E-.19795
G1 X127.084 Y121.84 E-.17529
G1 X127.539 Y121.765 E-.17528
G1 X127.888 Y121.743 E-.13266
G1 X128.095 Y121.745 E-.07883
; WIPE_END
G1 E-.04 F1800
G1 X128 Y114.113 Z4.6 F30000
G1 X127.891 Y105.351 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.251 Y105.361 E.01195
G3 X128.753 Y105.409 I-.367 J6.515 E.0167
G3 X127.831 Y105.353 I-.744 J4.592 E.93878
G1 X127.842 Y105.746 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X127.888 Y105.743 E.00139
G3 X128.689 Y105.796 I.007 J5.977 E.0247
G3 X127.54 Y105.767 I-.681 J4.202 E.78639
G1 X127.783 Y105.75 E.00748
M204 S10000
; WIPE_START
G1 F24000
G1 X127.888 Y105.743 E-.04004
G1 X127.888 Y105.743 E0
G1 X128.231 Y105.746 E-.13034
G1 X128.689 Y105.796 E-.17528
G1 X129.14 Y105.895 E-.17528
G1 X129.36 Y105.963 E-.08768
G1 X129.73 Y106.11 E-.15137
; WIPE_END
G1 E-.04 F1800
G1 X137.226 Y107.549 Z4.6 F30000
G1 X148.689 Y109.748 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.71 Y110 E.00839
G3 X143.934 Y105.3 I-4.701 J.001 E.73246
G3 X144.817 Y105.369 I-.071 J6.558 E.02939
G3 X148.683 Y109.495 I-.808 J4.632 E.20125
G1 X148.687 Y109.688 E.0064
G1 X148.304 Y109.974 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X148.311 Y110.232 E.00791
G3 X143.939 Y105.692 I-4.303 J-.231 E.61476
G3 X144.748 Y105.755 I-.064 J6.009 E.02496
G3 X148.311 Y109.768 I-.74 J4.245 E.17799
G1 X148.306 Y109.914 E.00449
M204 S10000
; WIPE_START
G1 F24000
G1 X148.311 Y110.232 E-.12061
G1 X148.254 Y110.691 E-.176
G1 X148.211 Y110.919 E-.08795
G1 X148.088 Y111.365 E-.17582
G1 X147.918 Y111.795 E-.17583
G1 X147.889 Y111.851 E-.02379
; WIPE_END
G1 E-.04 F1800
G1 X145.13 Y118.967 Z4.6 F30000
G1 X144.223 Y121.306 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.315 Y121.315 E.00306
G3 X144.817 Y121.369 I-.452 J6.541 E.01674
G3 X143.934 Y121.3 I-.808 J4.631 E.95043
G1 X144.163 Y121.305 E.00761
G1 X143.878 Y121.695 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.939 Y121.692 E.00187
G3 X144.748 Y121.755 I-.064 J6.008 E.02497
G3 X143.596 Y121.711 I-.74 J4.245 E.79638
G1 X143.818 Y121.698 E.00685
M204 S10000
; WIPE_START
G1 F24000
G1 X143.939 Y121.692 E-.04599
G1 X144.289 Y121.7 E-.13307
G1 X144.748 Y121.755 E-.17583
G1 X145.199 Y121.86 E-.17583
G1 X145.636 Y122.012 E-.17583
G1 X145.763 Y122.073 E-.05347
; WIPE_END
G1 E-.04 F1800
G1 X144.992 Y129.666 Z4.6 F30000
G1 X144.216 Y137.306 Z4.6
G1 Z4.2
M73 P61 R8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.315 Y137.31 E.00328
G3 X144.93 Y146.608 I-.321 J4.69 E.44801
G3 X140.923 Y138.447 I-.93 J-4.608 E.40965
G3 X143.927 Y137.3 I3.108 J3.634 E.10878
G1 X144.156 Y137.305 E.00762
G1 X143.895 Y137.694 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.932 Y137.692 E.00114
G3 X144.748 Y137.755 I-.053 J5.968 E.02518
G3 X143.596 Y137.711 I-.74 J4.245 E.79638
G1 X143.835 Y137.697 E.00737
M204 S10000
; WIPE_START
G1 F24000
G1 X143.932 Y137.692 E-.03694
G1 X144.289 Y137.7 E-.13567
G1 X144.748 Y137.755 E-.17583
G1 X145.199 Y137.86 E-.17582
G1 X145.636 Y138.012 E-.17583
G1 X145.778 Y138.08 E-.0599
; WIPE_END
G1 E-.04 F1800
G1 X138.742 Y141.038 Z4.6 F30000
G1 X132.313 Y143.74 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.116 Y144.182 E.01605
G3 X127.864 Y137.351 I-4.107 J-2.182 E.64691
G3 X128.753 Y137.409 I.028 J6.447 E.02956
G3 X132.342 Y143.689 I-.744 J4.591 E.27491
G1 X131.964 Y143.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X131.964 Y143.579 E.00061
G3 X127.875 Y137.743 I-3.955 J-1.579 E.56289
G3 X128.689 Y137.796 I.027 J5.899 E.0251
G3 X132.043 Y143.362 I-.681 J4.204 E.22715
G1 X131.986 Y143.504 E.00468
M204 S10000
; WIPE_START
G1 F24000
G1 X131.964 Y143.579 E-.03001
G1 X131.764 Y143.995 E-.17543
G1 X131.65 Y144.196 E-.08768
G1 X131.391 Y144.578 E-.17528
G1 X131.093 Y144.93 E-.17529
G1 X130.871 Y145.14 E-.11631
; WIPE_END
G1 E-.04 F1800
G1 X123.781 Y142.312 Z4.6 F30000
G1 X111.532 Y137.425 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.821 Y137.403 E.00963
G3 X112.689 Y137.45 I.085 J6.504 E.02884
G3 X111.436 Y137.435 I-.68 J4.551 E.91731
G1 X111.472 Y137.431 E.00122
G1 X111.811 Y137.797 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.838 Y137.795 E.0008
G3 X112.63 Y137.837 I.076 J5.956 E.02441
G3 X111.484 Y137.824 I-.622 J4.163 E.77729
G1 X111.752 Y137.802 E.00825
M204 S10000
; WIPE_START
G1 F24000
G1 X111.838 Y137.795 E-.03273
G1 X112.172 Y137.793 E-.12728
G1 X112.63 Y137.837 E-.17473
G1 X113.08 Y137.931 E-.17474
G1 X113.518 Y138.073 E-.17473
G1 X113.7 Y138.155 E-.07579
; WIPE_END
G1 E-.04 F1800
G1 X112.976 Y130.557 Z4.6 F30000
G1 X112.105 Y121.402 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X112.188 Y121.408 E.00277
G3 X112.689 Y121.45 I-.278 J6.45 E.01667
G3 X111.815 Y121.403 I-.68 J4.551 E.92997
G1 X112.045 Y121.402 E.00764
G1 X111.791 Y121.798 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.831 Y121.795 E.00122
G3 X112.63 Y121.837 I.087 J5.908 E.02462
G3 X111.484 Y121.824 I-.622 J4.163 E.77734
G1 X111.731 Y121.803 E.00763
M204 S10000
; WIPE_START
G1 F24000
G1 X111.831 Y121.795 E-.03789
G1 X112.172 Y121.793 E-.12986
G1 X112.63 Y121.837 E-.17473
G1 X113.08 Y121.931 E-.17474
G1 X113.301 Y121.996 E-.0874
G1 X113.682 Y122.143 E-.15538
; WIPE_END
G1 E-.04 F1800
G1 X115.538 Y114.74 Z4.6 F30000
G1 X116.35 Y111.5 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.176 Y111.951 E.01603
G3 X111.814 Y105.403 I-4.167 J-1.951 E.64597
G3 X112.689 Y105.45 I.096 J6.456 E.02907
G3 X116.377 Y111.448 I-.68 J4.551 E.26597
G1 X115.929 Y111.498 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X115.82 Y111.785 E.00944
G3 X111.831 Y105.795 I-3.812 J-1.785 E.54737
G3 X112.63 Y105.837 I.087 J5.907 E.02462
G3 X115.992 Y111.358 I-.622 J4.163 E.22645
G1 X115.954 Y111.443 E.00288
M204 S10000
; WIPE_START
G1 F24000
G1 X115.82 Y111.785 E-.13948
G1 X115.711 Y111.988 E-.0875
G1 X115.472 Y112.381 E-.17472
G1 X115.192 Y112.745 E-.17473
G1 X115.037 Y112.915 E-.0874
G1 X114.852 Y113.088 E-.09615
; WIPE_END
G1 E-.04 F1800
G1 X113.217 Y120.543 Z4.6 F30000
G1 X106.698 Y150.264 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.354 Y150 E.01439
G3 X100.602 Y137.996 I9.65 J-12.004 E.4566
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.246 Y98.605 E.80413
G3 X155.398 Y114.004 I-.247 J15.397 E.79425
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.018 Y150.505 I-.001 J-15.401 E.31828
G1 X106.746 Y150.3 E.01128
G1 X106.465 Y150.571 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X105.779 Y150.033 E.02678
G3 X100.21 Y137.999 I10.223 J-12.036 E.4205
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.251 Y98.213 E.74512
G3 X155.79 Y114.001 I-.263 J15.8 E.75426
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X112.851 Y153.471 I.114 J-16.859 E.09743
G3 X106.789 Y150.823 I3.15 J-15.474 E.20479
G1 X106.512 Y150.608 E.01078
M204 S10000
; WIPE_START
G1 F24000
G1 X105.779 Y150.033 E-.35404
G1 X104.992 Y149.31 E-.40596
; WIPE_END
G1 E-.04 F1800
G1 X111.437 Y152.338 Z4.6 F30000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X109.916 Y151.76 I4.914 J-15.224 E.054
G1 X153.757 Y107.919 E2.05666
G3 X154.33 Y109.442 I-9.065 J4.277 E.05403
G1 X147.382 Y129.743 F30000
G1 F15476.087
G2 X148.136 Y128.892 I-3.641 J-3.981 E.03779
G1 X155.046 Y121.982 E.32416
G1 X155.046 Y122.342 E.01195
G1 X146.859 Y114.155 E.38407
G2 X148.795 Y108.415 I-2.848 J-4.157 E.21557
G1 X155.044 Y114.664 E.29315
G1 X155.044 Y114.308 E.01183
G1 X147.228 Y122.124 E.36666
G2 X146.903 Y121.875 I-1.315 J1.384 E.0136
G1 X131.84 Y106.808 E.70674
G1 X139.694 Y98.954 E.36845
G1 X139.333 Y98.954 E.01197
G1 X145.594 Y105.214 E.2937
G3 X147.569 Y106.431 I-2.183 J5.751 E.07741
G1 X150.634 Y103.366 E.14379
G2 X146.083 Y100.241 I-10.785 J10.826 E.18413
G1 X102.239 Y144.085 E2.05681
G2 X105.358 Y148.642 I14.871 J-6.834 E.18406
G1 X108.5 Y145.5 E.14737
G3 X107.38 Y143.76 I3.632 J-3.568 E.06914
G1 X100.95 Y137.33 E.30162
G1 X100.95 Y137.698 E.01219
G1 X108.842 Y129.806 E.37023
; WIPE_START
G1 F24000
G1 X107.428 Y131.22 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X112.091 Y137.263 Z4.6 F30000
G1 X116.764 Y143.319 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F15476.087
G3 X116.088 Y144.792 I-5.836 J-1.788 E.05391
G1 X124.346 Y153.05 E.38738
G1 X123.978 Y153.05 E.01219
G1 X131.149 Y145.879 E.33637
G2 X131.711 Y145.35 I-4.309 J-5.136 E.02563
; WIPE_START
G1 F24000
G1 X131.149 Y145.879 E-.29349
G1 X130.28 Y146.747 E-.46651
; WIPE_END
G1 E-.04 F1800
G1 X124.291 Y145.348 Z4.6 F30000
G1 Z4.2
G1 E.8 F1800
G1 F15476.087
G3 X132.022 Y153.05 I-379.486 J388.609 E.36199
G1 X131.654 Y153.05 E.01219
G1 X139.842 Y144.862 E.38411
G3 X140.429 Y138.429 I4.17 J-2.863 E.23241
G1 X131.532 Y129.532 E.41737
G2 X131.532 Y122.468 I-3.615 J-3.532 E.25949
G1 X140.429 Y113.571 E.41737
G3 X139.844 Y107.141 I3.585 J-3.568 E.2323
G1 X131.656 Y98.953 E.38412
G1 X132.02 Y98.953 E.01205
G1 X124.869 Y106.103 E.33546
G2 X124.291 Y106.652 I4.171 J4.964 E.02645
; WIPE_START
G1 F24000
G1 X124.869 Y106.103 E-.30281
G1 X125.72 Y105.253 E-.45719
; WIPE_END
G1 E-.04 F1800
G1 X131.709 Y106.652 Z4.6 F30000
G1 Z4.2
G1 E.8 F1800
G1 F15476.087
G2 X123.979 Y98.951 I-672.98 J667.722 E.36194
G1 X124.345 Y98.952 E.01212
G1 X116.085 Y107.211 E.38748
G3 X116.771 Y108.68 I-4.493 J2.994 E.05397
; WIPE_START
G1 F24000
G1 X116.486 Y107.904 E-.31398
G1 X116.085 Y107.211 E-.30418
G1 X116.349 Y106.947 E-.14185
; WIPE_END
G1 E-.04 F1800
G1 X108.717 Y106.858 Z4.6 F30000
G1 X108.188 Y106.852 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F15476.087
G2 X107.369 Y108.251 I6.409 J4.689 E.05385
G1 X100.95 Y114.67 E.30113
G1 X100.95 Y114.302 E.01219
G1 X108.84 Y122.192 E.3701
; WIPE_START
G1 F24000
G1 X107.425 Y120.777 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.857 Y128.398 Z4.6 F30000
G1 X108.842 Y145.807 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F15476.087
G2 X110.242 Y146.622 I3.232 J-3.942 E.05396
G1 X116.67 Y153.05 E.30154
G1 X116.302 Y153.05 E.01219
G1 X124.16 Y145.192 E.3686
G1 X100.95 Y121.978 E1.08891
G1 X100.95 Y122.346 E.01219
G1 X109.212 Y114.084 E.38759
G2 X115.498 Y113.498 I2.789 J-4.091 E.22705
G1 X124.468 Y122.468 E.42079
G2 X124.468 Y129.532 I3.614 J3.532 E.25949
G1 X115.496 Y138.504 E.42085
G2 X109.213 Y137.916 I-3.496 J3.5 E.22703
G1 X100.95 Y129.654 E.38759
G1 X100.95 Y130.022 E.01219
G1 X124.16 Y106.808 E1.08891
G1 X116.302 Y98.95 E.3686
G1 X116.67 Y98.95 E.01219
G1 X110.245 Y105.375 E.30141
G2 X108.504 Y106.504 I1.791 J4.668 E.06932
G1 X105.362 Y103.362 E.14739
G3 X109.915 Y100.239 I11.277 J11.559 E.18405
G1 X153.761 Y144.085 E2.05689
G3 X150.642 Y148.642 I-15.607 J-7.338 E.18397
G1 X147.569 Y145.569 E.14416
G3 X145.594 Y146.786 I-4.158 J-4.534 E.07741
G1 X139.33 Y153.05 E.29385
G1 X139.698 Y153.05 E.01219
G1 X131.844 Y145.196 E.36842
G1 X146.903 Y130.125 E.70674
G2 X147.228 Y129.876 I-.99 J-1.632 E.0136
G1 X155.05 Y137.698 E.36692
G1 X155.05 Y137.33 E.01218
G1 X148.795 Y143.585 E.2934
G2 X146.864 Y137.84 I-4.874 J-1.559 E.21516
G1 X155.048 Y129.656 E.38391
G1 X155.048 Y130.02 E.01207
G1 X148.136 Y123.108 E.32425
G2 X147.382 Y122.257 I-4.394 J3.13 E.03779
; WIPE_START
G1 F24000
G1 X148.136 Y123.108 E-.4321
G1 X148.746 Y123.718 E-.3279
; WIPE_END
G1 E-.04 F1800
G1 X143.04 Y128.787 Z4.6 F30000
G1 X141.347 Y130.291 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F15476.087
G3 X140.123 Y129.229 I4.525 J-6.446 E.05384
G1 X131.192 Y138.16 E.41897
G2 X124.808 Y138.16 I-3.192 J3.833 E.22983
G1 X115.807 Y129.159 E.42223
G2 X115.809 Y122.84 I-3.817 J-3.161 E.22731
G1 X124.804 Y113.844 E.42202
G2 X131.192 Y113.84 I3.192 J-3.854 E.22982
G1 X140.123 Y122.771 E.41893
G2 X139.299 Y124.166 I6.573 J4.82 E.05384
; WIPE_START
G1 F24000
G1 X139.731 Y123.3 E-.36768
G1 X140.123 Y122.771 E-.25035
G1 X139.858 Y122.506 E-.14197
; WIPE_END
G1 E-.04 F1800
G1 X141.047 Y130.046 Z4.6 F30000
G1 X144.56 Y152.329 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F15476.087
G2 X146.085 Y151.761 I-4.237 J-13.704 E.054
G1 X102.24 Y107.916 E2.05684
G2 X101.662 Y109.437 I14.646 J6.435 E.054
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X102.24 Y107.916 E-.61836
G1 X102.504 Y108.18 E-.14164
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
G17
G3 Z4.6 I-.609 J1.054 P1  F30000
G1 X126.049 Y121.784 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X126.279 Y121.68 E.00835
G3 X127.852 Y121.352 I1.722 J4.321 E.05359
G3 X130.523 Y122.093 I.117 J4.761 E.0933
G3 X129.101 Y130.518 I-2.523 J3.907 E.35931
G3 X124.07 Y123.514 I-1.094 J-4.523 E.36595
G3 X125.822 Y121.891 I3.931 J2.487 E.08011
G1 X125.995 Y121.809 E.00636
G1 X126.214 Y122.139 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X127.863 Y121.744 I1.797 J3.862 E.05246
G3 X128.461 Y121.765 I.137 J4.565 E.01839
G3 X126.159 Y122.164 I-.45 J4.236 E.74966
M204 S10000
; WIPE_START
G1 F24000
G1 X126.64 Y121.963 E-.19794
G1 X127.084 Y121.84 E-.17529
G1 X127.539 Y121.765 E-.17528
G1 X127.863 Y121.744 E-.12314
G1 X128.095 Y121.752 E-.08835
; WIPE_END
G1 E-.04 F1800
G1 X135.725 Y121.543 Z4.8 F30000
G1 X143.514 Y121.329 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.811 Y121.302 E.00989
G1 X144.063 Y121.298 E.00838
G3 X143.308 Y121.349 I-.063 J4.698 E.95424
G1 X143.454 Y121.335 E.00487
G1 X143.878 Y121.693 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.058 Y121.69 E.00553
G3 X143.818 Y121.694 I-.058 J4.307 E.82415
M204 S10000
; WIPE_START
G1 F24000
G1 X144.058 Y121.69 E-.09116
G1 X144.52 Y121.721 E-.17582
G1 X144.975 Y121.802 E-.17583
G1 X145.42 Y121.93 E-.17582
G1 X145.636 Y122.012 E-.08795
G1 X145.763 Y122.073 E-.05342
; WIPE_END
G1 E-.04 F1800
G1 X144.722 Y129.634 Z4.8 F30000
G1 X143.665 Y137.313 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.954 Y137.3 E.00958
G3 X144.817 Y137.369 I-.106 J6.699 E.02874
G3 X143.559 Y137.321 I-.808 J4.632 E.93805
G1 X143.605 Y137.318 E.00154
G1 X143.894 Y137.695 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.959 Y137.692 E.00199
G3 X144.748 Y137.755 I-.099 J6.152 E.02436
G3 X143.596 Y137.711 I-.74 J4.245 E.79644
G1 X143.834 Y137.698 E.00734
M204 S10000
; WIPE_START
G1 F24000
G1 X143.959 Y137.692 E-.04745
G1 X144.289 Y137.7 E-.12554
G1 X144.748 Y137.755 E-.17583
G1 X145.199 Y137.86 E-.17582
G1 X145.636 Y138.012 E-.17583
G1 X145.778 Y138.08 E-.05953
; WIPE_END
M73 P62 R8
G1 E-.04 F1800
G1 X138.742 Y141.038 Z4.8 F30000
G1 X132.313 Y143.74 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.116 Y144.182 E.01605
G3 X127.891 Y137.351 I-4.107 J-2.182 E.64778
G3 X128.753 Y137.409 I-.015 J6.627 E.02868
G3 X132.343 Y143.689 I-.744 J4.591 E.27492
G1 X131.971 Y143.54 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X131.964 Y143.579 E.00121
G3 X127.901 Y137.743 I-3.955 J-1.579 E.5637
G3 X128.689 Y137.796 I-.017 J6.08 E.02428
G3 X132.043 Y143.362 I-.681 J4.204 E.22716
G1 X131.994 Y143.485 E.00407
M204 S10000
; WIPE_START
G1 F24000
G1 X131.964 Y143.579 E-.03759
G1 X131.764 Y143.995 E-.17544
G1 X131.579 Y144.308 E-.13778
G1 X131.391 Y144.578 E-.12516
G1 X131.093 Y144.93 E-.17528
G1 X130.885 Y145.126 E-.10875
; WIPE_END
G1 E-.04 F1800
G1 X123.79 Y142.312 Z4.8 F30000
G1 X111.497 Y137.436 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.795 Y137.404 E.00996
G3 X107.512 Y143.014 I.205 J4.596 E.69206
G3 X111.188 Y137.473 I4.499 J-1.005 E.24633
G1 X111.437 Y137.443 E.00833
G1 X111.793 Y137.797 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.811 Y137.796 E.00056
G3 X112.402 Y137.809 I.193 J4.505 E.01817
G3 X111.484 Y137.824 I-.391 J4.191 E.78441
G1 X111.733 Y137.802 E.00768
M204 S10000
; WIPE_START
G1 F24000
G1 X111.811 Y137.796 E-.02976
G1 X112.402 Y137.809 E-.22459
G1 X112.63 Y137.837 E-.0874
G1 X113.08 Y137.931 E-.17473
G1 X113.518 Y138.073 E-.17473
G1 X113.683 Y138.147 E-.06879
; WIPE_END
G1 E-.04 F1800
G1 X112.955 Y130.55 Z4.8 F30000
G1 X112.08 Y121.402 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X112.188 Y121.408 E.00361
G3 X112.689 Y121.45 I-.267 J6.313 E.01667
G3 X111.79 Y121.404 I-.68 J4.55 E.929
G1 X112.02 Y121.403 E.00763
G1 X111.78 Y121.798 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.806 Y121.796 E.0008
G3 X112.402 Y121.809 I.198 J4.509 E.01834
G3 X111.484 Y121.824 I-.391 J4.191 E.78436
G1 X111.72 Y121.803 E.00728
M204 S10000
; WIPE_START
G1 F24000
G1 X111.806 Y121.796 E-.03273
G1 X112.402 Y121.809 E-.2266
G1 X112.63 Y121.837 E-.08739
G1 X113.08 Y121.931 E-.17474
G1 X113.518 Y122.073 E-.17473
G1 X113.671 Y122.142 E-.06382
; WIPE_END
G1 E-.04 F1800
G1 X115.518 Y114.737 Z4.8 F30000
G1 X116.276 Y111.699 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.277 Y111.72 E.00071
G3 X111.838 Y105.402 I-4.268 J-1.72 E.65511
G3 X112.689 Y105.45 I.057 J6.646 E.02829
G3 X116.439 Y111.244 I-.68 J4.551 E.25888
G1 X116.296 Y111.642 E.01404
G1 X115.931 Y111.499 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X115.912 Y111.574 E.00238
G3 X111.854 Y105.794 I-3.904 J-1.573 E.55519
G3 X112.63 Y105.837 I.048 J6.101 E.0239
G3 X116.061 Y111.138 I-.622 J4.163 E.21936
G1 X115.951 Y111.442 E.00994
M204 S10000
; WIPE_START
G1 F24000
G1 X115.912 Y111.574 E-.05212
G1 X115.711 Y111.988 E-.17488
G1 X115.597 Y112.187 E-.0874
G1 X115.337 Y112.567 E-.17473
G1 X115.037 Y112.915 E-.17473
G1 X114.852 Y113.088 E-.09613
; WIPE_END
G1 E-.04 F1800
G1 X121.414 Y109.189 Z4.8 F30000
G1 X127.871 Y105.352 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X127.901 Y105.35 E.00099
G3 X128.753 Y105.409 I-.034 J6.717 E.02835
G3 X127.497 Y105.377 I-.744 J4.59 E.92732
G1 X127.811 Y105.356 E.01043
G1 X127.844 Y105.746 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X127.911 Y105.742 E.00208
G3 X128.689 Y105.796 I-.036 J6.173 E.02397
G3 X127.54 Y105.767 I-.681 J4.203 E.78656
G1 X127.784 Y105.75 E.00752
M204 S10000
; WIPE_START
G1 F24000
G1 X127.911 Y105.742 E-.04853
G1 X127.911 Y105.742 E0
G1 X128.231 Y105.746 E-.12134
G1 X128.689 Y105.796 E-.17528
G1 X129.14 Y105.895 E-.17528
G1 X129.577 Y106.042 E-.17528
G1 X129.73 Y106.114 E-.06428
; WIPE_END
G1 E-.04 F1800
G1 X137.209 Y107.638 Z4.8 F30000
G1 X148.701 Y109.98 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.71 Y110 E.00073
G3 X143.91 Y105.3 I-4.701 J.001 E.73169
G3 X144.817 Y105.369 I-.034 J6.436 E.03018
G3 X148.683 Y109.495 I-.808 J4.631 E.20123
G1 X148.699 Y109.92 E.0141
G1 X148.309 Y109.975 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X148.32 Y110 E.00085
G3 X143.915 Y105.692 I-4.309 J0 E.62108
G3 X144.52 Y105.721 I.08 J4.625 E.0186
G3 X148.295 Y109.537 I-.509 J4.279 E.17804
G1 X148.307 Y109.915 E.01162
M204 S10000
; WIPE_START
G1 F24000
G1 X148.32 Y110 E-.03276
G1 X148.304 Y110.231 E-.08812
G1 X148.254 Y110.691 E-.17583
G1 X148.156 Y111.143 E-.17583
G1 X148.088 Y111.365 E-.08794
G1 X147.918 Y111.795 E-.17583
G1 X147.889 Y111.85 E-.02369
; WIPE_END
G1 E-.04 F1800
G1 X142.308 Y117.057 Z4.8 F30000
G1 X106.703 Y150.268 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.354 Y150 E.01459
G3 X100.602 Y137.996 I9.65 J-12.004 E.45661
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.401 J-.001 E.80255
G1 X140.258 Y98.606 E.80454
G3 X155.398 Y114.004 I-.27 J15.407 E.7937
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.018 Y150.505 I-.001 J-15.401 E.31828
G1 X106.751 Y150.304 E.01108
G1 X106.466 Y150.58 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.108 Y150.306 E.01384
G3 X100.21 Y137.999 I9.895 J-12.309 E.43364
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.794 J.002 E.76217
G1 X140.263 Y98.214 E.7455
G3 X155.79 Y114.001 I-.265 J15.789 E.75402
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.789 Y150.823 I.002 J-15.794 E.30225
G1 X106.514 Y150.616 E.01059
M204 S10000
; WIPE_START
G1 F24000
G1 X106.108 Y150.306 E-.19401
G1 X105.456 Y149.753 E-.32494
G1 X104.995 Y149.317 E-.24104
; WIPE_END
G1 E-.04 F1800
G1 X101.663 Y142.563 Z4.8 F30000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X102.239 Y144.085 I16.054 J-5.213 E.054
G1 X146.083 Y100.241 E2.05681
G3 X150.634 Y103.366 I-6.234 J13.952 E.18413
G1 X147.569 Y106.431 E.14379
G2 X145.594 Y105.214 I-3.806 J3.964 E.07753
G1 X139.334 Y98.954 E.29369
G1 X139.694 Y98.954 E.01196
G1 X131.844 Y106.804 E.36829
G1 X146.903 Y121.875 E.70674
G3 X147.228 Y122.124 I-.99 J1.632 E.0136
G1 X155.044 Y114.308 E.36666
G1 X155.044 Y114.664 E.01183
G1 X148.795 Y108.415 E.29315
G3 X146.859 Y114.155 I-4.784 J1.583 E.21557
G1 X155.046 Y122.342 E.38407
G1 X155.046 Y121.982 E.01195
G1 X148.129 Y128.899 E.3245
G3 X147.384 Y129.745 I-5.507 J-4.1 E.03743
; WIPE_START
G1 F24000
G1 X148.129 Y128.899 E-.42829
G1 X148.746 Y128.282 E-.33171
; WIPE_END
G1 E-.04 F1800
G1 X147.382 Y122.257 Z4.8 F30000
G1 Z4.4
G1 E.8 F1800
G1 F15476.087
G2 X155.048 Y130.02 I175.099 J-165.226 E.36193
G1 X155.048 Y129.656 E.01207
G1 X146.865 Y137.841 E.3839
G3 X148.795 Y143.585 I-2.898 J4.17 E.21538
G1 X155.05 Y137.33 E.2934
G1 X155.05 Y137.698 E.01218
G1 X147.23 Y129.878 E.36683
G1 X146.876 Y130.151 E.01482
G1 X131.84 Y145.192 E.70549
G1 X139.698 Y153.05 E.3686
G1 X139.33 Y153.05 E.01219
G1 X145.589 Y146.791 E.29361
G2 X147.569 Y145.569 I-1.656 J-4.896 E.07784
G1 X150.642 Y148.642 E.14416
G2 X153.761 Y144.085 I-12.488 J-11.894 E.18397
G1 X109.915 Y100.239 E2.05689
G3 X111.437 Y99.663 I6.734 J15.475 E.054
G1 X116.771 Y108.679 F30000
G1 F15476.087
G2 X116.088 Y107.208 I-5.33 J1.58 E.05398
G1 X124.345 Y98.952 E.38733
G1 X123.979 Y98.952 E.01211
G1 X131.16 Y106.132 E.33684
G3 X131.708 Y106.653 I-2.122 J2.781 E.02514
; WIPE_START
G1 F24000
G1 X131.16 Y106.132 E-.28747
G1 X130.28 Y105.253 E-.47253
; WIPE_END
G1 E-.04 F1800
G1 X124.291 Y106.652 Z4.8 F30000
G1 Z4.4
G1 E.8 F1800
G1 F15476.087
G2 X132.019 Y98.953 I-391.4 J-400.567 E.36188
G1 X131.657 Y98.953 E.01204
G1 X139.844 Y107.141 E.38411
G2 X140.429 Y113.571 I4.17 J2.862 E.2323
G1 X131.532 Y122.468 E.41737
G3 X131.532 Y129.532 I-3.521 J3.532 E.26041
G1 X140.429 Y138.429 E.41738
G2 X139.844 Y144.859 I3.563 J3.566 E.23245
G1 X131.654 Y153.05 E.38422
G1 X132.022 Y153.05 E.01219
G1 X124.851 Y145.879 E.33637
G3 X124.289 Y145.35 I4.309 J-5.135 E.02564
; WIPE_START
G1 F24000
G1 X124.851 Y145.879 E-.29353
G1 X125.719 Y146.747 E-.46647
; WIPE_END
G1 E-.04 F1800
G1 X131.709 Y145.348 Z4.8 F30000
G1 Z4.4
G1 E.8 F1800
G1 F15476.087
G2 X123.978 Y153.05 I379.384 J388.508 E.36199
G1 X124.346 Y153.05 E.01219
G1 X116.088 Y144.792 E.38739
G2 X116.764 Y143.319 I-6.856 J-4.04 E.05385
; WIPE_START
G1 F24000
G1 X116.486 Y144.096 E-.31349
G1 X116.088 Y144.792 E-.30462
G1 X116.352 Y145.056 E-.14189
; WIPE_END
G1 E-.04 F1800
G1 X112.979 Y138.209 Z4.8 F30000
G1 X108.84 Y129.808 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F15476.087
G1 X100.95 Y137.698 E.3701
G1 X100.95 Y137.33 E.01219
G1 X107.38 Y143.76 E.30162
G2 X108.5 Y145.5 I4.752 J-1.828 E.06914
G1 X105.358 Y148.642 E.14737
G2 X109.915 Y151.761 I11.894 J-12.488 E.18397
G1 X153.757 Y107.919 E2.05671
G3 X154.33 Y109.442 I-9.065 J4.277 E.05403
G1 X139.3 Y124.167 F30000
G1 F15476.087
G3 X140.123 Y122.771 I7.151 J3.279 E.05384
G1 X131.196 Y113.844 E.41882
G3 X124.804 Y113.844 I-3.196 J-3.962 E.2292
G1 X115.805 Y122.843 E.42217
G3 X115.805 Y129.157 I-3.801 J3.157 E.22722
G1 X124.808 Y138.16 E.42232
G3 X131.192 Y138.16 I3.192 J3.831 E.22984
G1 X140.121 Y129.231 E.41884
G2 X141.347 Y130.291 I6.002 J-5.705 E.05385
; WIPE_START
G1 F24000
G1 X140.6 Y129.735 E-.35373
G1 X140.121 Y129.231 E-.26438
G1 X139.857 Y129.495 E-.14189
; WIPE_END
G1 E-.04 F1800
G1 X141.397 Y136.971 Z4.8 F30000
G1 X144.563 Y152.337 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F15476.087
G2 X146.085 Y151.761 I-5.212 J-16.052 E.054
G1 X102.239 Y107.915 E2.05689
G3 X105.358 Y103.358 I15.608 J7.338 E.18397
G1 X108.504 Y106.504 E.14757
G3 X110.245 Y105.375 I3.531 J3.539 E.06932
G1 X116.67 Y98.95 E.30141
G1 X116.302 Y98.95 E.01219
G1 X124.16 Y106.808 E.3686
G1 X100.95 Y130.022 E1.08891
G1 X100.95 Y129.654 E.01219
G1 X109.213 Y137.916 E.38759
G3 X115.496 Y138.504 I2.787 J4.087 E.22703
G1 X124.468 Y129.532 E.42085
G3 X124.468 Y122.468 I3.521 J-3.532 E.26041
G1 X115.498 Y113.498 E.42079
G3 X109.212 Y114.084 I-3.495 J-3.483 E.22721
G1 X100.95 Y122.346 E.38759
G1 X100.95 Y121.978 E.01219
G1 X124.156 Y145.196 E1.08891
G1 X116.302 Y153.05 E.36845
G1 X116.67 Y153.05 E.01219
G1 X110.242 Y146.622 E.30154
G3 X108.842 Y145.807 I1.822 J-4.74 E.05396
; WIPE_START
G1 F24000
G1 X109.37 Y146.195 E-.24886
G1 X110.242 Y146.622 E-.36899
G1 X110.507 Y146.886 E-.14215
; WIPE_END
G1 E-.04 F1800
G1 X109.993 Y139.271 Z4.8 F30000
G1 X108.84 Y122.192 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F15476.087
G1 X100.95 Y114.302 E.3701
G1 X100.95 Y114.67 E.01219
G1 X107.369 Y108.251 E.30113
G3 X108.188 Y106.852 I7.227 J3.29 E.05385
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.701 Y107.544 E-.32144
G1 X107.369 Y108.251 E-.29666
G1 X107.105 Y108.515 E-.1419
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
G17
G3 Z4.8 I-.697 J.997 P1  F30000
G1 X126.065 Y121.77 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X126.516 Y121.595 E.01605
G3 X127.827 Y121.352 I1.494 J4.405 E.04439
G3 X128.503 Y121.375 I.171 J5.014 E.02245
G3 X126.013 Y121.8 I-.493 J4.625 E.88462
G1 X126.213 Y122.138 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X127.838 Y121.744 I1.796 J3.862 E.0517
G3 X128.461 Y121.765 I.16 J4.599 E.01917
G3 X126.159 Y122.164 I-.452 J4.235 E.74963
M204 S10000
; WIPE_START
G1 F24000
G1 X126.64 Y121.963 E-.19795
G1 X127.084 Y121.84 E-.17529
G1 X127.539 Y121.765 E-.17528
G1 X127.838 Y121.744 E-.11362
G1 X127.838 Y121.744 E0
G1 X128.095 Y121.753 E-.09786
; WIPE_END
G1 E-.04 F1800
G1 X129.533 Y129.249 Z5 F30000
G1 X132.313 Y143.74 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.109 Y144.178 E.01603
G3 X124.058 Y139.532 I-4.109 J-2.178 E.49577
G3 X127.917 Y137.35 I3.943 J2.47 E.15328
G3 X130.468 Y138.058 I.047 J4.777 E.08899
G3 X132.335 Y143.684 I-2.468 J3.942 E.2132
G1 X131.978 Y143.522 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X131.966 Y143.58 E.00181
G3 X127.928 Y137.742 I-3.955 J-1.58 E.56439
G3 X128.461 Y137.765 I.065 J4.683 E.01639
G3 X132.046 Y143.363 I-.45 J4.235 E.23435
G1 X132.001 Y143.467 E.00347
M204 S10000
; WIPE_START
G1 F24000
G1 X131.966 Y143.58 E-.045
G1 X131.764 Y143.995 E-.17549
G1 X131.565 Y144.33 E-.14788
G1 X131.391 Y144.578 E-.11506
M73 P63 R8
G1 X131.093 Y144.93 E-.17529
G1 X130.899 Y145.113 E-.10128
; WIPE_END
G1 E-.04 F1800
G1 X137.416 Y141.14 Z5 F30000
G1 X143.694 Y137.312 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.98 Y137.299 E.0095
G3 X144.817 Y137.369 I-.162 J6.973 E.02785
G3 X143.559 Y137.321 I-.808 J4.631 E.93798
G1 X143.634 Y137.316 E.0025
G1 X143.893 Y137.695 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.986 Y137.691 E.00285
G3 X144.52 Y137.721 I.001 J4.739 E.01644
G3 X143.596 Y137.711 I-.509 J4.279 E.80355
G1 X143.833 Y137.699 E.0073
M204 S10000
; WIPE_START
G1 F24000
G1 X143.986 Y137.691 E-.05799
G1 X144.52 Y137.721 E-.20324
G1 X144.975 Y137.802 E-.17583
G1 X145.42 Y137.93 E-.17582
G1 X145.636 Y138.012 E-.08795
G1 X145.777 Y138.079 E-.05917
; WIPE_END
G1 E-.04 F1800
G1 X145.096 Y130.477 Z5 F30000
G1 X144.275 Y121.307 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.315 Y121.315 E.00136
G3 X144.817 Y121.369 I-.502 J7.008 E.01674
G3 X143.984 Y121.299 I-.808 J4.631 E.95211
G1 X144.215 Y121.306 E.00765
G1 X143.879 Y121.696 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.989 Y121.691 E.00339
G3 X144.52 Y121.721 I-.005 J4.763 E.01633
G3 X143.596 Y121.711 I-.509 J4.279 E.80355
G1 X143.819 Y121.699 E.00687
M204 S10000
; WIPE_START
G1 F24000
G1 X143.989 Y121.691 E-.06475
G1 X144.52 Y121.721 E-.2018
G1 X144.975 Y121.802 E-.17583
G1 X145.199 Y121.86 E-.08794
G1 X145.636 Y122.012 E-.17583
G1 X145.764 Y122.073 E-.05385
; WIPE_END
G1 E-.04 F1800
G1 X147.565 Y114.656 Z5 F30000
G1 X148.701 Y109.98 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.711 Y110 E.00075
G3 X143.886 Y105.301 I-4.701 J0 E.73083
G3 X144.567 Y105.332 I.106 J5.077 E.02261
G3 X148.684 Y109.495 I-.557 J4.668 E.20966
G1 X148.699 Y109.92 E.0141
G1 X148.309 Y109.975 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X148.317 Y110 E.00082
G3 X143.892 Y105.693 I-4.308 J-.001 E.62017
G3 X144.52 Y105.721 I.101 J4.662 E.01933
G3 X148.292 Y109.537 I-.511 J4.278 E.17798
G1 X148.306 Y109.915 E.01161
M204 S10000
; WIPE_START
G1 F24000
G1 X148.317 Y110 E-.03263
G1 X148.304 Y110.231 E-.08805
G1 X148.254 Y110.691 E-.17583
G1 X148.156 Y111.143 E-.17583
G1 X148.088 Y111.365 E-.08794
G1 X147.918 Y111.795 E-.17583
G1 X147.889 Y111.851 E-.0239
; WIPE_END
G1 E-.04 F1800
G1 X140.641 Y109.459 Z5 F30000
G1 X128.226 Y105.363 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.503 Y105.376 E.00918
G3 X132.558 Y110.926 I-.503 J4.624 E.25653
G3 X123.442 Y109.074 I-4.557 J-.931 E.48432
G3 X127.924 Y105.35 I4.573 J.945 E.20875
G1 X128.166 Y105.36 E.00803
G1 X127.845 Y105.747 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X127.935 Y105.742 E.00276
G3 X128.461 Y105.765 I.054 J4.731 E.01617
G3 X127.54 Y105.767 I-.45 J4.235 E.79396
G1 X127.785 Y105.751 E.00757
M204 S10000
; WIPE_START
G1 F24000
G1 X127.935 Y105.742 E-.05697
G1 X128.461 Y105.765 E-.1999
G1 X128.916 Y105.84 E-.17528
G1 X129.36 Y105.963 E-.17529
G1 X129.577 Y106.042 E-.08767
G1 X129.732 Y106.114 E-.06489
; WIPE_END
G1 E-.04 F1800
G1 X122.648 Y108.955 Z5 F30000
G1 X116.351 Y111.48 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.275 Y111.72 E.00834
G3 X111.862 Y105.401 I-4.267 J-1.72 E.65589
G3 X112.689 Y105.45 I.011 J6.921 E.0275
G3 X116.438 Y111.243 I-.681 J4.55 E.25884
G1 X116.371 Y111.424 E.00637
G1 X115.929 Y111.497 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X115.822 Y111.786 E.00946
G3 X111.878 Y105.793 I-3.812 J-1.786 E.54878
G3 X112.402 Y105.809 I.118 J4.673 E.01612
G3 X115.994 Y111.358 I-.392 J4.191 E.23361
G1 X115.955 Y111.443 E.00286
M204 S10000
; WIPE_START
G1 F24000
G1 X115.822 Y111.786 E-.13975
G1 X115.597 Y112.187 E-.17493
G1 X115.337 Y112.567 E-.17474
G1 X115.081 Y112.867 E-.15012
G1 X114.874 Y113.077 E-.112
G1 X114.857 Y113.092 E-.00847
; WIPE_END
G1 E-.04 F1800
G1 X111.987 Y120.164 Z5 F30000
G1 X111.473 Y121.429 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.765 Y121.405 E.0097
G3 X112.439 Y121.419 I.238 J4.957 E.0224
G3 X111.414 Y121.437 I-.429 J4.581 E.92485
G1 X111.769 Y121.798 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.781 Y121.797 E.00037
G3 X112.402 Y121.809 I.221 J4.542 E.0191
G3 X111.484 Y121.824 I-.393 J4.19 E.78431
G1 X111.709 Y121.803 E.00694
M204 S10000
; WIPE_START
G1 F24000
G1 X111.781 Y121.797 E-.02741
G1 X112.402 Y121.809 E-.23607
G1 X112.857 Y121.878 E-.17473
G1 X113.08 Y121.931 E-.0874
G1 X113.518 Y122.073 E-.17473
G1 X113.661 Y122.138 E-.05966
; WIPE_END
G1 E-.04 F1800
G1 X112.864 Y129.728 Z5 F30000
G1 X112.058 Y137.403 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X112.188 Y137.403 E.00432
G3 X112.439 Y137.419 I-.185 J4.953 E.00834
G3 X111.769 Y137.405 I-.429 J4.581 E.93675
G1 X111.998 Y137.403 E.00762
G1 X111.775 Y137.798 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.785 Y137.797 E.00031
G3 X112.402 Y137.809 I.218 J4.535 E.01899
G3 X111.484 Y137.824 I-.393 J4.191 E.78438
G1 X111.715 Y137.803 E.00712
M204 S10000
; WIPE_START
G1 F24000
G1 X111.785 Y137.797 E-.02657
G1 X112.402 Y137.809 E-.23464
G1 X112.63 Y137.837 E-.08739
G1 X113.08 Y137.931 E-.17473
G1 X113.518 Y138.073 E-.17473
G1 X113.666 Y138.14 E-.06193
; WIPE_END
G1 E-.04 F1800
G1 X109.869 Y144.761 Z5 F30000
G1 X106.708 Y150.271 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.354 Y150 E.0148
G3 X100.602 Y137.996 I9.65 J-12.004 E.45661
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.401 J-.001 E.80255
G1 X140.27 Y98.606 E.80496
G3 X155.398 Y114.004 I-.282 J15.407 E.79329
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.018 Y150.505 I-.001 J-15.401 E.31828
G1 X106.756 Y150.307 E.01087
G1 X106.471 Y150.583 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.108 Y150.306 E.01403
G3 X100.21 Y137.999 I9.895 J-12.309 E.43364
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.794 J.002 E.76217
G1 X140.276 Y98.214 E.74588
G3 X155.79 Y114.001 I-.277 J15.789 E.75364
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.789 Y150.823 I.002 J-15.794 E.30225
G1 X106.519 Y150.619 E.0104
M204 S10000
; WIPE_START
G1 F24000
G1 X106.108 Y150.306 E-.19635
G1 X105.456 Y149.753 E-.32495
G1 X105 Y149.321 E-.2387
; WIPE_END
G1 E-.04 F1800
G1 X108.842 Y145.807 Z5 F30000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X110.242 Y146.622 I3.222 J-3.925 E.05396
G1 X116.67 Y153.05 E.30154
G1 X116.302 Y153.05 E.01219
G1 X124.16 Y145.192 E.3686
G1 X100.95 Y121.978 E1.08891
G1 X100.95 Y122.346 E.01219
G1 X109.21 Y114.086 E.38749
G2 X115.498 Y113.498 I2.779 J-4.2 E.22643
G1 X124.465 Y122.465 E.42067
G2 X124.465 Y129.535 I3.535 J3.535 E.26047
G1 X115.499 Y138.501 E.42061
G2 X109.213 Y137.916 I-3.497 J3.513 E.22707
G1 X100.95 Y129.654 E.38759
G1 X100.95 Y130.022 E.01219
G1 X124.16 Y106.808 E1.08891
G1 X116.302 Y98.95 E.3686
G1 X116.67 Y98.95 E.01219
G1 X110.245 Y105.375 E.30141
G2 X108.5 Y106.5 I1.875 J4.826 E.06933
G1 X105.358 Y103.358 E.14737
G2 X102.239 Y107.915 I12.489 J11.895 E.18397
G1 X146.085 Y151.761 E2.05689
G3 X144.563 Y152.337 I-6.734 J-15.475 E.054
G1 X124.291 Y145.348 F30000
G1 F15476.087
G3 X132.022 Y153.05 I-379.501 J388.625 E.36199
G1 X131.654 Y153.05 E.01219
G1 X139.842 Y144.862 E.38411
G3 X140.429 Y138.429 I4.18 J-2.862 E.23234
G1 X131.532 Y129.532 E.41737
G2 X131.532 Y122.468 I-3.521 J-3.532 E.26041
G1 X140.429 Y113.571 E.41737
G3 X139.844 Y107.141 I3.585 J-3.568 E.2323
G1 X131.657 Y98.953 E.38411
G1 X132.019 Y98.953 E.01203
G1 X124.869 Y106.103 E.33545
G2 X124.291 Y106.652 I4.171 J4.964 E.02645
; WIPE_START
G1 F24000
G1 X124.869 Y106.103 E-.30281
G1 X125.72 Y105.253 E-.45719
; WIPE_END
G1 E-.04 F1800
G1 X131.708 Y106.653 Z5 F30000
G1 Z4.6
G1 E.8 F1800
G1 F15476.087
G3 X123.979 Y98.952 I631.631 J-641.584 E.36193
G1 X124.345 Y98.952 E.01211
G1 X116.086 Y107.21 E.38743
G3 X116.771 Y108.679 I-4.537 J3.01 E.05397
; WIPE_START
G1 F24000
G1 X116.486 Y107.904 E-.31389
G1 X116.086 Y107.21 E-.3043
G1 X116.35 Y106.946 E-.14181
; WIPE_END
G1 E-.04 F1800
G1 X108.718 Y106.858 Z5 F30000
G1 X108.188 Y106.852 Z5
G1 Z4.6
G1 E.8 F1800
G1 F15476.087
G2 X107.369 Y108.251 I6.409 J4.689 E.05385
G1 X100.95 Y114.67 E.30113
G1 X100.95 Y114.302 E.01219
G1 X108.84 Y122.192 E.3701
; WIPE_START
G1 F24000
G1 X107.425 Y120.777 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X110.347 Y127.829 Z5 F30000
G1 X116.764 Y143.319 Z5
G1 Z4.6
G1 E.8 F1800
G1 F15476.087
G3 X116.088 Y144.792 I-7.532 J-2.568 E.05385
G1 X124.346 Y153.05 E.38739
G1 X123.978 Y153.05 E.01219
G1 X131.149 Y145.879 E.33637
G2 X131.709 Y145.348 I-3.806 J-4.57 E.02564
G1 X141.346 Y130.292 F30000
G1 F15476.087
G3 X140.123 Y129.229 I2.5 J-4.11 E.054
G1 X131.192 Y138.16 E.41897
G2 X124.804 Y138.156 I-3.197 J3.84 E.22992
G1 X115.805 Y129.157 E.42214
G2 X115.807 Y122.841 I-3.815 J-3.16 E.2272
G1 X124.804 Y113.844 E.42207
G2 X131.192 Y113.84 I3.192 J-3.854 E.22982
G1 X140.123 Y122.771 E.41893
G2 X139.299 Y124.166 I6.572 J4.82 E.05384
; WIPE_START
G1 F24000
G1 X139.731 Y123.3 E-.36768
G1 X140.123 Y122.771 E-.25035
G1 X139.858 Y122.506 E-.14197
; WIPE_END
G1 E-.04 F1800
G1 X145.359 Y127.798 Z5 F30000
G1 X147.383 Y129.744 Z5
G1 Z4.6
G1 E.8 F1800
G1 F15476.087
G2 X148.146 Y128.882 I-3.946 J-4.26 E.03824
G1 X155.046 Y121.982 E.32371
G1 X155.046 Y122.342 E.01195
G1 X146.862 Y114.158 E.38394
G2 X148.795 Y108.415 I-2.861 J-4.16 E.21557
G1 X155.044 Y114.664 E.29315
G1 X155.044 Y114.308 E.01183
G1 X147.228 Y122.124 E.36666
G2 X146.877 Y121.849 I-1.876 J2.038 E.0148
G1 X131.844 Y106.804 E.70552
G1 X139.694 Y98.954 E.36828
G1 X139.334 Y98.954 E.01195
G1 X145.594 Y105.214 E.29368
G3 X147.569 Y106.431 I-1.83 J5.178 E.07753
G1 X150.634 Y103.366 E.14379
G2 X146.083 Y100.241 I-10.785 J10.826 E.18413
G1 X102.239 Y144.085 E2.05681
G3 X101.663 Y142.563 I15.477 J-6.735 E.054
; WIPE_START
G1 F24000
G1 X102.239 Y144.085 E-.6184
G1 X102.503 Y143.821 E-.1416
; WIPE_END
G1 E-.04 F1800
G1 X104.016 Y136.34 Z5 F30000
G1 X111.437 Y99.663 Z5
G1 Z4.6
G1 E.8 F1800
G1 F15476.087
G2 X109.915 Y100.239 I5.212 J16.051 E.054
G1 X153.761 Y144.085 E2.05689
G3 X150.642 Y148.642 I-15.607 J-7.338 E.18397
G1 X147.569 Y145.569 E.14416
G3 X145.589 Y146.791 I-3.61 J-3.632 E.07785
G1 X139.33 Y153.05 E.29361
G1 X139.698 Y153.05 E.01219
G1 X131.84 Y145.192 E.3686
G1 X146.876 Y130.151 E.70549
G1 X147.23 Y129.878 E.01482
G1 X155.05 Y137.698 E.36683
G1 X155.05 Y137.33 E.01218
G1 X148.795 Y143.585 E.2934
G2 X146.864 Y137.84 I-4.874 J-1.558 E.21516
G1 X155.048 Y129.656 E.38391
G1 X155.048 Y130.02 E.01207
G1 X148.136 Y123.108 E.32425
G2 X147.382 Y122.257 I-4.394 J3.13 E.03779
G1 X154.33 Y109.442 F30000
G1 F15476.087
G2 X153.757 Y107.919 I-9.637 J2.754 E.05403
G1 X109.915 Y151.761 E2.05671
G3 X105.358 Y148.642 I6.334 J-14.141 E.18416
G1 X108.5 Y145.5 E.14737
G3 X107.38 Y143.76 I3.632 J-3.568 E.06914
G1 X100.95 Y137.33 E.30162
G1 X100.95 Y137.698 E.01219
G1 X108.842 Y129.806 E.37023
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.428 Y131.22 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
G17
G3 Z5 I.55 J1.085 P1  F30000
G1 X126.065 Y121.77 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X126.516 Y121.594 E.01605
G3 X127.788 Y121.353 I1.494 J4.405 E.0431
G3 X128.252 Y121.355 I.222 J4.278 E.01539
G3 X126.012 Y121.799 I-.243 J4.645 E.89297
G1 X126.213 Y122.137 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X127.808 Y121.745 I1.796 J3.862 E.05078
G3 X128.231 Y121.746 I.202 J3.9 E.013
G3 X126.159 Y122.163 I-.222 J4.254 E.75671
M204 S10000
; WIPE_START
G1 F24000
G1 X126.64 Y121.963 E-.19796
G1 X127.084 Y121.84 E-.17529
G1 X127.54 Y121.765 E-.17559
G1 X127.808 Y121.745 E-.10195
G1 X128.095 Y121.746 E-.10921
; WIPE_END
G1 E-.04 F1800
G1 X128.071 Y114.113 Z5.2 F30000
G1 X128.044 Y105.354 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.25 Y105.354 E.00684
G3 X127.748 Y105.355 I-.249 J4.642 E.9523
G1 X127.984 Y105.354 E.00781
G1 X127.846 Y105.746 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.23 Y105.746 E.0118
G3 X127.769 Y105.746 I-.23 J4.251 E.80771
G1 X127.786 Y105.746 E.0005
M204 S10000
; WIPE_START
G1 F24000
G1 X128.23 Y105.746 E-.16876
G1 X128.461 Y105.765 E-.08797
G1 X128.916 Y105.84 E-.17528
G1 X129.36 Y105.963 E-.17529
G1 X129.734 Y106.112 E-.1527
; WIPE_END
G1 E-.04 F1800
M73 P64 R8
G1 X122.684 Y109.038 Z5.2 F30000
G1 X116.276 Y111.698 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.269 Y111.717 E.00068
G3 X111.686 Y105.408 I-4.269 J-1.718 E.65044
G3 X112.186 Y105.401 I.325 J5.315 E.0166
G3 X116.431 Y111.242 I-.186 J4.598 E.27534
G1 X116.296 Y111.641 E.014
G1 X115.931 Y111.498 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X115.905 Y111.571 E.00236
G3 X111.713 Y105.8 I-3.905 J-1.572 E.55117
G3 X112.172 Y105.793 I.297 J4.876 E.01411
G3 X116.053 Y111.136 I-.171 J4.206 E.23326
G1 X115.95 Y111.441 E.00992
M204 S10000
; WIPE_START
G1 F24000
G1 X115.905 Y111.571 E-.05203
G1 X115.814 Y111.782 E-.08739
G1 X115.597 Y112.187 E-.17472
G1 X115.337 Y112.567 E-.17474
G1 X115.062 Y112.889 E-.16096
G1 X114.874 Y113.076 E-.10085
G1 X114.855 Y113.092 E-.00931
; WIPE_END
G1 E-.04 F1800
G1 X111.942 Y120.146 Z5.2 F30000
G1 X111.408 Y121.437 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.438 Y121.434 E.001
G3 X111.726 Y121.407 I.571 J4.566 E.00958
G3 X112.189 Y121.402 I.279 J4.227 E.01536
G3 X110.941 Y121.524 I-.179 J4.598 E.91731
G1 X111.349 Y121.448 E.01376
G1 X111.759 Y121.798 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X112.172 Y121.793 E.01272
G3 X111.699 Y121.802 I-.164 J4.206 E.79806
M204 S10000
; WIPE_START
G1 F24000
G1 X112.172 Y121.793 E-.18003
G1 X112.63 Y121.837 E-.17473
G1 X113.08 Y121.931 E-.17474
G1 X113.518 Y122.073 E-.17473
G1 X113.653 Y122.13 E-.05578
; WIPE_END
G1 E-.04 F1800
G1 X112.547 Y129.681 Z5.2 F30000
G1 X111.411 Y137.437 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.438 Y137.434 E.00093
G3 X111.728 Y137.407 I.571 J4.566 E.00966
G3 X112.189 Y137.402 I.277 J4.205 E.01528
G3 X110.942 Y137.524 I-.179 J4.598 E.91731
G1 X111.352 Y137.448 E.01383
G1 X111.758 Y137.798 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X112.172 Y137.793 E.01274
G3 X111.698 Y137.802 I-.163 J4.206 E.79804
M204 S10000
; WIPE_START
G1 F24000
G1 X112.172 Y137.793 E-.18026
G1 X112.63 Y137.837 E-.17473
G1 X113.08 Y137.931 E-.17473
G1 X113.518 Y138.073 E-.17473
G1 X113.653 Y138.129 E-.05554
; WIPE_END
G1 E-.04 F1800
G1 X120.966 Y140.312 Z5.2 F30000
G1 X132.328 Y143.703 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.318 Y143.72 E.00066
G3 X127.748 Y137.355 I-4.317 J-1.724 E.65975
G3 X128.249 Y137.354 I.253 J5.466 E.01663
G3 X132.48 Y143.241 I-.249 J4.642 E.27578
G1 X132.347 Y143.646 E.01414
G1 X131.982 Y143.505 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X131.954 Y143.575 E.00233
G3 X127.769 Y137.746 I-3.954 J-1.578 E.55962
G3 X128.23 Y137.746 I.231 J5.02 E.01415
G3 X132.101 Y143.138 I-.23 J4.251 E.2339
G1 X132 Y143.448 E.01002
M204 S10000
; WIPE_START
G1 F24000
G1 X131.954 Y143.575 E-.05162
G1 X131.764 Y143.995 E-.17521
G1 X131.526 Y144.391 E-.17528
G1 X131.247 Y144.758 E-.17529
G1 X131.093 Y144.93 E-.08768
G1 X130.911 Y145.101 E-.09493
; WIPE_END
G1 E-.04 F1800
G1 X137.483 Y141.219 Z5.2 F30000
G1 X144.106 Y137.305 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.313 Y137.308 E.00686
G3 X143.811 Y137.302 I-.312 J4.691 E.96323
G1 X144.046 Y137.305 E.00781
G1 X143.892 Y137.694 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.288 Y137.7 E.01219
G3 X143.826 Y137.693 I-.288 J4.3 E.81778
G1 X143.832 Y137.693 E.00016
M204 S10000
; WIPE_START
G1 F24000
G1 X144.288 Y137.7 E-.17349
G1 X144.52 Y137.721 E-.08828
G1 X144.975 Y137.802 E-.17583
G1 X145.42 Y137.93 E-.17582
G1 X145.776 Y138.077 E-.14658
; WIPE_END
G1 E-.04 F1800
G1 X145.02 Y130.482 Z5.2 F30000
G1 X144.106 Y121.305 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.313 Y121.308 E.00686
G3 X143.811 Y121.302 I-.312 J4.691 E.96323
G1 X144.046 Y121.305 E.00782
G1 X143.879 Y121.694 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.288 Y121.7 E.01259
G3 X143.819 Y121.694 I-.288 J4.3 E.81753
M204 S10000
; WIPE_START
G1 F24000
G1 X144.288 Y121.7 E-.1785
G1 X144.52 Y121.721 E-.08826
G1 X144.975 Y121.802 E-.17583
G1 X145.42 Y121.93 E-.17582
G1 X145.764 Y122.072 E-.14159
; WIPE_END
G1 E-.04 F1800
G1 X147.565 Y114.655 Z5.2 F30000
G1 X148.696 Y110 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.703 Y110.253 E.0084
G3 X143.849 Y105.301 I-4.694 J-.253 E.72117
G3 X144.315 Y105.308 I.166 J4.345 E.01549
G3 X148.703 Y109.747 I-.307 J4.691 E.22641
G1 X148.697 Y109.94 E.00639
G1 X148.309 Y109.975 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X148.317 Y110 E.00082
G3 X143.863 Y105.693 I-4.309 J0 E.61947
G3 X144.289 Y105.7 I.151 J3.967 E.0131
G3 X148.293 Y109.537 I-.281 J4.3 E.18511
G1 X148.306 Y109.915 E.01161
M204 S10000
; WIPE_START
G1 F24000
G1 X148.317 Y110 E-.03267
G1 X148.304 Y110.231 E-.08806
G1 X148.254 Y110.691 E-.17583
G1 X148.156 Y111.143 E-.17583
G1 X148.088 Y111.365 E-.08794
G1 X147.918 Y111.795 E-.17583
G1 X147.889 Y111.851 E-.02384
; WIPE_END
G1 E-.04 F1800
G1 X142.309 Y117.058 Z5.2 F30000
G1 X106.713 Y150.275 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.357 Y149.997 E.015
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.283 Y98.606 E.80537
G3 X155.398 Y114.004 I-.284 J15.397 E.79302
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.02 Y150.502 I.01 J-15.412 E.31824
G1 X106.761 Y150.311 E.01067
G1 X106.476 Y150.587 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.01422
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.288 Y98.214 E.74626
G3 X155.79 Y114.001 I-.3 J15.799 E.75312
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.524 Y150.623 E.01021
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.303 E-.19862
G1 X105.456 Y149.753 E-.32492
G1 X105.004 Y149.325 E-.23646
; WIPE_END
G1 E-.04 F1800
G1 X108.842 Y145.807 Z5.2 F30000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X110.242 Y146.622 I3.222 J-3.925 E.05396
G1 X116.67 Y153.05 E.30154
G1 X116.302 Y153.05 E.01219
G1 X124.156 Y145.196 E.36845
G1 X100.95 Y121.978 E1.08891
G1 X100.95 Y122.346 E.01219
G1 X109.212 Y114.084 E.38759
G2 X115.497 Y113.497 I2.784 J-4.129 E.22675
G1 X124.468 Y122.468 E.42085
G3 X131.535 Y122.465 I3.535 J3.542 E.26029
G1 X140.433 Y113.567 E.41746
G3 X139.842 Y107.138 I3.67 J-3.579 E.23164
G1 X131.657 Y98.953 E.38399
G1 X132.019 Y98.953 E.01202
G1 X124.851 Y106.121 E.33625
G2 X124.291 Y106.652 I3.806 J4.569 E.02564
G1 X116.765 Y108.681 F30000
G1 F15476.087
G2 X116.086 Y107.21 I-5.739 J1.757 E.05391
G1 X124.344 Y98.952 E.38742
G1 X123.98 Y98.952 E.01211
G1 X131.149 Y106.121 E.33631
G3 X131.709 Y106.652 I-3.806 J4.57 E.02564
G1 X139.3 Y124.167 F30000
G1 F15476.087
G3 X140.123 Y122.771 I7.15 J3.279 E.05384
G1 X131.196 Y113.844 E.41878
G3 X124.804 Y113.844 I-3.195 J-3.909 E.22959
G1 X115.807 Y122.841 E.42208
G3 X115.805 Y129.157 I-3.794 J3.157 E.22735
G1 X124.804 Y138.156 E.42214
G3 X131.196 Y138.156 I3.195 J3.866 E.22988
G1 X140.121 Y129.231 E.41869
G2 X141.347 Y130.291 I5.978 J-5.677 E.05385
; WIPE_START
G1 F24000
G1 X140.6 Y129.736 E-.35371
G1 X140.121 Y129.231 E-.2644
G1 X139.857 Y129.495 E-.14189
; WIPE_END
G1 E-.04 F1800
G1 X145.357 Y124.204 Z5.2 F30000
G1 X147.385 Y122.254 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F15476.087
G3 X148.136 Y123.108 I-4.023 J4.295 E.03779
G1 X155.048 Y130.02 E.32425
G1 X155.048 Y129.656 E.01207
G1 X146.859 Y137.845 E.38415
G3 X148.795 Y143.585 I-2.917 J4.181 E.21516
G1 X155.05 Y137.33 E.2934
G1 X155.05 Y137.698 E.01218
G1 X147.23 Y129.878 E.36683
G1 X146.876 Y130.151 E.01482
G1 X131.844 Y145.196 E.70549
G1 X139.698 Y153.05 E.36845
G1 X139.33 Y153.05 E.01219
G1 X145.59 Y146.79 E.29364
G2 X147.567 Y145.567 I-1.85 J-5.202 E.07772
G1 X150.642 Y148.642 E.14422
G2 X153.761 Y144.085 I-12.49 J-11.896 E.18397
G1 X109.915 Y100.239 E2.05689
G2 X105.358 Y103.358 I6.206 J13.954 E.18419
G1 X108.504 Y106.504 E.14757
G2 X107.38 Y108.24 I3.481 J3.486 E.06913
G1 X100.95 Y114.67 E.30162
G1 X100.95 Y114.302 E.01219
G1 X108.84 Y122.192 E.3701
; WIPE_START
G1 F24000
G1 X107.425 Y120.777 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.606 Y128.318 Z5.2 F30000
G1 X108.84 Y129.808 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F15476.087
G1 X100.95 Y137.698 E.3701
G1 X100.95 Y137.33 E.01219
G1 X107.38 Y143.76 E.30162
G2 X108.5 Y145.5 I4.752 J-1.828 E.06914
G1 X105.358 Y148.642 E.14737
G3 X102.239 Y144.085 I10.834 J-10.763 E.18419
G1 X146.083 Y100.241 E2.05681
G3 X150.634 Y103.366 I-6.234 J13.952 E.18413
G1 X147.57 Y106.43 E.14371
G2 X145.594 Y105.214 I-3.834 J4.018 E.07753
G1 X139.334 Y98.954 E.29368
G1 X139.694 Y98.954 E.01194
G1 X131.84 Y106.808 E.36842
G1 X146.876 Y121.849 E.70549
G1 X147.23 Y122.122 E.01483
G1 X155.044 Y114.308 E.36657
G1 X155.044 Y114.664 E.01183
G1 X148.795 Y108.415 E.29315
G3 X146.859 Y114.155 I-4.808 J1.575 E.21543
G1 X155.046 Y122.342 E.38407
G1 X155.046 Y121.982 E.01195
G1 X148.129 Y128.899 E.3245
G3 X147.383 Y129.744 I-4.358 J-3.093 E.03745
G1 X154.33 Y109.442 F30000
G1 F15476.087
G2 X153.757 Y107.919 I-9.637 J2.754 E.05403
G1 X109.916 Y151.76 E2.05665
G2 X111.437 Y152.338 I6.402 J-14.556 E.054
G1 X124.289 Y145.35 F30000
G1 F15476.087
G3 X132.022 Y153.05 I-235.594 J244.317 E.362
G1 X131.654 Y153.05 E.01219
G1 X139.844 Y144.859 E.38422
G3 X140.429 Y138.429 I4.17 J-2.863 E.2323
G1 X131.535 Y129.535 E.41726
G3 X124.465 Y129.535 I-3.535 J-3.535 E.26047
G1 X115.499 Y138.501 E.42061
G2 X109.213 Y137.916 I-3.497 J3.513 E.22707
G1 X100.95 Y129.654 E.38759
G1 X100.95 Y130.022 E.01219
G1 X124.16 Y106.808 E1.08891
G1 X116.302 Y98.95 E.3686
G1 X116.67 Y98.95 E.01219
G1 X110.245 Y105.375 E.30141
G2 X108.843 Y106.189 I3.457 J7.572 E.05385
G1 X101.662 Y109.437 F30000
G1 F15476.087
G3 X102.24 Y107.916 I15.134 J4.881 E.054
G1 X146.085 Y151.761 E2.05683
G3 X144.563 Y152.337 I-6.734 J-15.475 E.054
G1 X131.711 Y145.35 F30000
G1 F15476.087
G2 X123.978 Y153.05 I228.679 J237.373 E.362
G1 X124.346 Y153.05 E.01219
G1 X116.088 Y144.792 E.38738
G2 X116.764 Y143.319 I-5.16 J-3.261 E.05391
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.487 Y144.091 E-.31168
G1 X116.088 Y144.792 E-.30643
G1 X116.352 Y145.056 E-.14189
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
G17
G3 Z5.2 I1.123 J.468 P1  F30000
G1 X126.065 Y121.77 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X126.515 Y121.593 E.01606
G3 X127.762 Y121.354 I1.491 J4.406 E.04223
G1 X128 Y121.348 E.00791
G3 X126.011 Y121.797 I.007 J4.651 E.90127
G1 X126.212 Y122.136 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X127.782 Y121.746 I1.794 J3.863 E.05001
G1 X128 Y121.74 E.00669
G3 X126.158 Y122.162 I.006 J4.259 E.76376
M204 S10000
; WIPE_START
G1 F24000
G1 X126.64 Y121.963 E-.19798
M73 P64 R7
G1 X127.084 Y121.84 E-.17529
G1 X127.54 Y121.765 E-.1754
G1 X127.782 Y121.746 E-.09243
G1 X128 Y121.74 E-.08279
G1 X128.095 Y121.745 E-.03611
; WIPE_END
G1 E-.04 F1800
G1 X128.076 Y114.113 Z5.4 F30000
G1 X128.054 Y105.35 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.251 Y105.355 E.00653
G3 X127.748 Y105.355 I-.257 J4.644 E.95277
G1 X127.987 Y105.348 E.00794
G1 X127.994 Y105.348 E.00023
G1 X127.847 Y105.744 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X127.988 Y105.74 E.00434
G3 X127.769 Y105.746 I.006 J4.259 E.81559
G1 X127.787 Y105.746 E.00053
M204 S10000
; WIPE_START
G1 F24000
G1 X127.988 Y105.74 E-.07645
M73 P65 R7
G1 X128.23 Y105.746 E-.09218
G1 X128.689 Y105.796 E-.17539
G1 X129.14 Y105.895 E-.17529
G1 X129.577 Y106.042 E-.17528
G1 X129.733 Y106.115 E-.06542
; WIPE_END
G1 E-.04 F1800
G1 X122.689 Y109.054 Z5.4 F30000
G1 X116.261 Y111.735 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.048 Y112.168 E.016
G3 X111.686 Y105.408 I-4.054 J-2.171 E.63366
G1 X111.924 Y105.399 E.00792
G3 X116.274 Y111.678 I.069 J4.598 E.29901
G1 X115.931 Y111.498 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X115.897 Y111.567 E.00238
G3 X111.713 Y105.8 I-3.903 J-1.57 E.55106
G1 X111.93 Y105.791 E.0067
G3 X116.044 Y111.133 I.063 J4.206 E.24034
G1 X115.949 Y111.441 E.0099
M204 S10000
; WIPE_START
G1 F24000
G1 X115.897 Y111.567 E-.05202
G1 X115.711 Y111.988 E-.17457
G1 X115.479 Y112.37 E-.17013
G1 X115.337 Y112.567 E-.09188
G1 X115.037 Y112.915 E-.17484
G1 X114.852 Y113.089 E-.09656
; WIPE_END
G1 E-.04 F1800
G1 X112.389 Y120.313 Z5.4 F30000
G1 X112.018 Y121.401 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X112.439 Y121.418 E.014
G3 X111.699 Y121.408 I-.433 J4.578 E.93392
G1 X111.937 Y121.398 E.0079
G1 X111.958 Y121.399 E.00068
G1 X111.75 Y121.798 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.943 Y121.79 E.00592
G3 X111.69 Y121.802 I.064 J4.206 E.80443
M204 S10000
; WIPE_START
G1 F24000
G1 X111.943 Y121.79 E-.096
G1 X112.402 Y121.809 E-.17473
G1 X112.857 Y121.878 E-.17473
G1 X113.08 Y121.931 E-.0874
G1 X113.518 Y122.073 E-.17474
G1 X113.643 Y122.13 E-.05241
; WIPE_END
G1 E-.04 F1800
G1 X112.836 Y129.719 Z5.4 F30000
G1 X112.018 Y137.401 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X112.439 Y137.418 E.01398
G3 X111.7 Y137.408 I-.433 J4.578 E.93394
G1 X111.937 Y137.398 E.00787
G1 X111.959 Y137.399 E.00071
G1 X111.744 Y137.798 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.943 Y137.79 E.00611
G3 X111.684 Y137.802 I.064 J4.206 E.80424
M204 S10000
; WIPE_START
G1 F24000
G1 X111.943 Y137.79 E-.09832
G1 X112.402 Y137.809 E-.17473
G1 X112.63 Y137.837 E-.0874
G1 X113.08 Y137.931 E-.17473
G1 X113.518 Y138.073 E-.17473
G1 X113.638 Y138.127 E-.0501
; WIPE_END
G1 E-.04 F1800
G1 X120.975 Y140.23 Z5.4 F30000
G1 X132.401 Y143.504 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.215 Y143.95 E.01605
G3 X127.748 Y137.355 I-4.222 J-1.951 E.65219
G1 X127.986 Y137.348 E.00789
G3 X132.414 Y143.446 I.007 J4.651 E.29138
G1 X131.986 Y143.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X131.86 Y143.786 E.00989
G3 X127.769 Y137.746 I-3.867 J-1.786 E.55321
G1 X127.986 Y137.74 E.00667
G3 X132.03 Y143.358 I.007 J4.259 E.24827
G1 X132.005 Y143.433 E.00243
M204 S10000
; WIPE_START
G1 F24000
G1 X131.86 Y143.786 E-.14502
G1 X131.65 Y144.196 E-.17516
G1 X131.526 Y144.391 E-.08767
G1 X131.247 Y144.758 E-.17529
G1 X131.093 Y144.93 E-.08768
G1 X130.922 Y145.091 E-.08919
; WIPE_END
G1 E-.04 F1800
G1 X137.495 Y141.211 Z5.4 F30000
G1 X144.117 Y137.301 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.314 Y137.309 E.00657
G3 X143.811 Y137.302 I-.322 J4.688 E.96263
G1 X144.049 Y137.298 E.0079
G1 X144.057 Y137.299 E.00026
G1 X143.891 Y137.693 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.044 Y137.69 E.00471
G3 X143.826 Y137.693 I-.051 J4.307 E.82481
G1 X143.831 Y137.693 E.00014
M204 S10000
; WIPE_START
G1 F24000
G1 X144.044 Y137.69 E-.08104
G1 X144.289 Y137.7 E-.09301
G1 X144.748 Y137.755 E-.17595
G1 X145.199 Y137.86 E-.17583
G1 X145.636 Y138.012 E-.17582
G1 X145.775 Y138.078 E-.05835
; WIPE_END
G1 E-.04 F1800
G1 X144.754 Y130.514 Z5.4 F30000
G1 X143.514 Y121.329 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.811 Y121.302 E.00989
G1 X144.05 Y121.298 E.00793
G3 X143.308 Y121.348 I-.056 J4.698 E.95466
G1 X143.454 Y121.335 E.00487
G1 X143.879 Y121.693 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.045 Y121.69 E.00511
G3 X143.819 Y121.694 I-.051 J4.307 E.82456
M204 S10000
; WIPE_START
G1 F24000
G1 X144.045 Y121.69 E-.08598
G1 X144.289 Y121.7 E-.09272
G1 X144.748 Y121.755 E-.17595
G1 X145.199 Y121.86 E-.17583
G1 X145.636 Y122.012 E-.17582
G1 X145.764 Y122.073 E-.05371
; WIPE_END
G1 E-.04 F1800
G1 X147.565 Y114.656 Z5.4 F30000
G1 X148.701 Y109.981 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.705 Y110 E.00066
G3 X143.823 Y105.301 I-4.699 J-.004 E.72828
G1 X144.063 Y105.298 E.00795
G3 X148.678 Y109.496 I-.057 J4.698 E.2263
G1 X148.698 Y109.921 E.01412
G1 X148.309 Y109.975 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X148.313 Y110 E.00079
G3 X143.839 Y105.693 I-4.307 J-.003 E.61835
G1 X144.058 Y105.69 E.00674
G3 X148.288 Y109.538 I-.052 J4.306 E.19214
G1 X148.306 Y109.915 E.0116
M204 S10000
; WIPE_START
G1 F24000
G1 X148.313 Y110 E-.03252
G1 X148.285 Y110.462 E-.17588
G1 X148.213 Y110.907 E-.17119
G1 X148.156 Y111.143 E-.09246
G1 X148.009 Y111.582 E-.17593
G1 X147.886 Y111.85 E-.11201
; WIPE_END
G1 E-.04 F1800
G1 X142.307 Y117.058 Z5.4 F30000
G1 X106.718 Y150.279 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.354 Y150 E.0152
G3 X100.602 Y137.996 I9.65 J-12.004 E.4566
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.295 Y98.606 E.80578
G3 X155.398 Y114.004 I-.307 J15.407 E.79247
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.018 Y150.505 I-.001 J-15.401 E.31828
G1 X106.766 Y150.315 E.01047
G1 X106.481 Y150.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.108 Y150.306 E.0144
G3 X100.21 Y137.999 I9.895 J-12.309 E.43364
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.3 Y98.214 E.74664
G3 X155.79 Y114.001 I-.302 J15.789 E.75288
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.789 Y150.823 I.002 J-15.794 E.30225
G1 X106.529 Y150.627 E.01003
M204 S10000
; WIPE_START
G1 F24000
G1 X106.108 Y150.306 E-.20094
G1 X105.456 Y149.753 E-.32494
G1 X105.008 Y149.33 E-.23411
; WIPE_END
G1 E-.04 F1800
G1 X111.804 Y145.855 Z5.4 F30000
G1 X116.764 Y143.319 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X116.088 Y144.792 I-7.532 J-2.568 E.05385
G1 X124.346 Y153.05 E.38739
G1 X123.978 Y153.05 E.01219
G1 X131.149 Y145.879 E.33637
G2 X131.711 Y145.35 I-4.309 J-5.136 E.02563
; WIPE_START
G1 F24000
G1 X131.149 Y145.879 E-.29349
G1 X130.28 Y146.747 E-.46651
; WIPE_END
G1 E-.04 F1800
G1 X124.291 Y145.348 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F15476.087
G3 X132.022 Y153.05 I-379.438 J388.562 E.36199
G1 X131.654 Y153.05 E.01219
G1 X139.842 Y144.862 E.38411
G3 X140.433 Y138.433 I4.166 J-2.858 E.2323
G1 X131.532 Y129.532 E.41757
G2 X131.532 Y122.468 I-3.521 J-3.532 E.26041
G1 X140.43 Y113.57 E.41738
G3 X139.842 Y107.138 I3.592 J-3.571 E.23233
G1 X131.657 Y98.953 E.38399
G1 X132.019 Y98.953 E.01202
G1 X124.869 Y106.103 E.33544
G2 X124.291 Y106.652 I4.17 J4.963 E.02645
; WIPE_START
G1 F24000
G1 X124.869 Y106.103 E-.30281
G1 X125.72 Y105.253 E-.45719
; WIPE_END
G1 E-.04 F1800
G1 X131.709 Y106.652 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F15476.087
G3 X123.98 Y98.952 I379.442 J-388.565 E.36193
G1 X124.344 Y98.952 E.0121
G1 X116.087 Y107.209 E.38735
G3 X116.771 Y108.679 I-8.112 J4.664 E.05385
G1 X111.437 Y99.663 F30000
G1 F15476.087
G2 X109.915 Y100.239 I5.213 J16.052 E.054
G1 X153.761 Y144.085 E2.05689
G3 X150.642 Y148.642 I-15.607 J-7.338 E.18397
G1 X147.567 Y145.567 E.14422
G3 X145.589 Y146.791 I-3.83 J-3.982 E.07773
G1 X139.33 Y153.05 E.29362
G1 X139.698 Y153.05 E.01219
G1 X131.844 Y145.196 E.36842
G1 X146.876 Y130.151 E.70549
G1 X147.23 Y129.878 E.01482
G1 X155.05 Y137.698 E.36683
G1 X155.05 Y137.33 E.01218
G1 X148.795 Y143.585 E.2934
G2 X146.859 Y137.845 I-4.854 J-1.559 E.21516
G1 X155.048 Y129.656 E.38414
G1 X155.048 Y130.02 E.01207
G1 X148.136 Y123.108 E.32425
G2 X147.382 Y122.257 I-4.394 J3.13 E.03779
; WIPE_START
G1 F24000
G1 X148.136 Y123.108 E-.4321
G1 X148.746 Y123.718 E-.3279
; WIPE_END
G1 E-.04 F1800
G1 X147.383 Y129.744 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F15476.087
G2 X148.129 Y128.899 I-3.603 J-3.931 E.03745
G1 X155.046 Y121.982 E.3245
G1 X155.046 Y122.342 E.01195
G1 X146.864 Y114.16 E.38383
G2 X148.795 Y108.415 I-3.004 J-4.207 E.21482
G1 X155.044 Y114.664 E.29315
G1 X155.044 Y114.308 E.01183
G1 X147.228 Y122.124 E.36666
G2 X146.903 Y121.875 I-1.315 J1.383 E.01361
G1 X131.84 Y106.808 E.70673
G1 X139.694 Y98.954 E.36842
G1 X139.334 Y98.954 E.01193
G1 X145.594 Y105.214 E.29367
G3 X147.569 Y106.432 I-2.142 J5.684 E.07742
G1 X150.634 Y103.366 E.14379
G2 X146.083 Y100.241 I-10.785 J10.826 E.18413
G1 X102.239 Y144.085 E2.05681
G3 X101.671 Y142.56 I13.136 J-5.762 E.054
G1 X108.842 Y129.806 F30000
G1 F15476.087
G1 X100.95 Y137.698 E.3702
G1 X100.95 Y137.33 E.01219
G1 X107.369 Y143.749 E.30113
G2 X108.184 Y145.151 I4.677 J-1.779 E.05401
; WIPE_START
G1 F24000
G1 X107.699 Y144.452 E-.32335
G1 X107.369 Y143.749 E-.29484
G1 X107.106 Y143.485 E-.14181
; WIPE_END
G1 E-.04 F1800
G1 X114.228 Y140.741 Z5.4 F30000
G1 X141.347 Y130.291 Z5.4
G1 Z5
G1 E.8 F1800
G1 F15476.087
G3 X140.123 Y129.229 I3.332 J-5.078 E.05391
G1 X131.196 Y138.156 E.41878
G2 X124.804 Y138.156 I-3.196 J3.864 E.22986
G1 X115.805 Y129.157 E.42217
G2 X115.807 Y122.841 I-3.814 J-3.159 E.2272
G1 X124.804 Y113.844 E.42208
G2 X131.192 Y113.84 I3.192 J-3.855 E.22981
G1 X140.123 Y122.771 E.41897
G2 X139.3 Y124.167 I6.327 J4.674 E.05384
G1 X154.33 Y109.442 F30000
G1 F15476.087
G2 X153.757 Y107.919 I-9.637 J2.754 E.05403
G1 X109.915 Y151.761 E2.05671
G3 X105.358 Y148.642 I7.338 J-15.607 E.18397
G1 X108.5 Y145.5 E.14739
G2 X110.241 Y146.621 I4.289 J-4.747 E.06901
G1 X116.67 Y153.05 E.30157
G1 X116.302 Y153.05 E.01219
G1 X124.16 Y145.192 E.3686
G1 X100.95 Y121.978 E1.08891
G1 X100.95 Y122.346 E.01219
G1 X109.21 Y114.086 E.38749
G2 X115.496 Y113.496 I2.778 J-4.194 E.22642
G1 X124.465 Y122.465 E.42075
G2 X124.468 Y129.532 I3.529 J3.532 E.26044
G1 X115.496 Y138.504 E.42085
G2 X109.212 Y137.916 I-3.496 J3.5 E.22703
G1 X100.95 Y129.654 E.38759
G1 X100.95 Y130.022 E.01219
G1 X124.16 Y106.808 E1.08891
G1 X116.302 Y98.95 E.3686
G1 X116.67 Y98.95 E.01219
G1 X110.242 Y105.378 E.30154
G2 X108.842 Y106.193 I1.822 J4.74 E.05396
; WIPE_START
G1 F24000
G1 X109.37 Y105.805 E-.24886
G1 X110.242 Y105.378 E-.36899
G1 X110.507 Y105.114 E-.14215
; WIPE_END
G1 E-.04 F1800
G1 X114.971 Y111.304 Z5.4 F30000
G1 X144.563 Y152.337 Z5.4
G1 Z5
G1 E.8 F1800
G1 F15476.087
G2 X146.085 Y151.761 I-5.212 J-16.052 E.054
G1 X102.239 Y107.915 E2.05689
G3 X105.362 Y103.362 I13.805 J6.122 E.18418
G1 X108.5 Y106.5 E.14719
G2 X107.38 Y108.24 I3.626 J3.564 E.06914
G1 X100.95 Y114.67 E.30162
G1 X100.95 Y114.302 E.01219
G1 X108.84 Y122.192 E.3701
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.425 Y120.777 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
G17
G3 Z5.4 I-1.217 J-.029 P1  F30000
G1 X106.723 Y150.282 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X106.354 Y150 E.01539
G3 X100.602 Y137.996 I9.65 J-12.004 E.45661
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.401 J-.001 E.80255
G1 X140.308 Y98.606 E.80619
G3 X155.398 Y114.004 I-.32 J15.407 E.79206
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.401 J.001 E.80255
G1 X116.004 Y153.398 E.79585
G3 X107.018 Y150.505 I-.001 J-15.401 E.31828
G1 X106.77 Y150.318 E.01028
G1 X106.485 Y150.594 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.01458
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.794 J.002 E.76217
G1 X140.313 Y98.214 E.74702
M73 P66 R7
G3 X155.79 Y114.001 I-.314 J15.788 E.7525
G1 X155.79 Y137.999 E.73736
G3 X155.484 Y141.088 I-16.942 J-.119 E.09553
G3 X139.999 Y153.79 I-15.487 J-3.09 E.66661
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.534 Y150.63 E.00984
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.303 E-.20314
G1 X105.456 Y149.753 E-.32491
G1 X105.013 Y149.334 E-.23195
; WIPE_END
G1 E-.04 F1800
G1 X107.028 Y141.972 Z5.6 F30000
G1 X107.368 Y140.728 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.428954
G1 F3000
G1 X107.368 Y142.181 E.04571
G1 X107.406 Y142.632 E.01423
G1 X107.502 Y143.129 E.01593
G1 X107.57 Y143.374 E.00799
G2 X107.755 Y143.864 I5.368 J-1.735 E.01649
G1 X107.755 Y140.136 E.11728
G3 X108.141 Y139.44 I3.853 J1.684 E.02506
G1 X108.141 Y144.566 E.16125
G2 X108.527 Y145.068 I3.475 J-2.272 E.01994
G1 X108.527 Y138.932 E.19304
G1 X108.913 Y138.541 E.01728
G1 X108.913 Y145.452 E.21739
G1 X109.122 Y145.637 E.0088
G1 X109.299 Y145.761 E.00679
G1 X109.299 Y138.239 E.23665
G1 X109.685 Y137.989 E.01447
G1 X109.685 Y146.011 E.25237
G1 X110.071 Y146.216 E.01374
G1 X110.071 Y137.787 E.26512
G1 X110.457 Y137.627 E.01315
G1 X110.457 Y146.366 E.2749
G1 X110.843 Y146.485 E.01271
G1 X110.843 Y137.513 E.28223
G1 X111.229 Y137.434 E.0124
G1 X111.229 Y146.571 E.28743
G1 X111.615 Y146.618 E.01224
G1 X111.615 Y137.38 E.29061
G1 X112.001 Y137.368 E.01215
G1 X112.001 Y146.631 E.29138
G1 X112.387 Y146.615 E.01215
G1 X112.387 Y137.385 E.29034
G1 X112.773 Y137.431 E.01223
G1 X112.773 Y146.569 E.28746
G1 X113.159 Y146.489 E.0124
G1 X113.159 Y137.511 E.28241
G1 X113.545 Y137.633 E.01273
G1 X113.545 Y146.367 E.27475
G1 X113.931 Y146.215 E.01305
G1 X113.931 Y137.791 E.26499
G1 X114.317 Y137.984 E.01357
G1 X114.317 Y146.015 E.25264
G1 X114.703 Y145.764 E.01449
G1 X114.703 Y138.236 E.23678
G1 X115.089 Y138.546 E.01558
G1 X115.089 Y145.453 E.21727
G1 X115.475 Y145.067 E.01718
G1 X115.475 Y138.933 E.19294
G1 X115.517 Y138.976 E.00188
G3 X115.861 Y139.434 I-4.518 J3.758 E.01804
G1 X115.861 Y144.566 E.16144
G1 X115.963 Y144.409 E.0059
G2 X116.247 Y143.85 I-3.513 J-2.138 E.01974
G1 X116.247 Y140.15 E.11639
G1 X116.39 Y140.506 E.01207
G1 X116.466 Y140.75 E.00803
G1 X116.575 Y141.241 E.01584
G1 X116.631 Y141.749 E.01607
G3 X116.633 Y143.257 I-27.586 J.799 E.04743
G1 X126.73 Y146.681 F30000
; LINE_WIDTH: 0.432754
G1 F3000
G2 X128.256 Y146.681 I.752 J-25.297 E.04848
G1 X128.759 Y146.626 E.01608
G1 X129.254 Y146.517 E.01609
G1 X129.735 Y146.355 E.01612
G1 X129.872 Y146.291 E.00481
G1 X126.125 Y146.291 E.11904
G1 X125.584 Y146.017 E.01926
G1 X125.403 Y145.902 E.0068
G1 X130.595 Y145.902 E.16491
G1 X131.099 Y145.512 E.02025
G1 X124.901 Y145.512 E.1969
G1 X124.505 Y145.122 E.01764
G1 X131.494 Y145.122 E.22202
G1 X131.803 Y144.732 E.01579
G1 X124.197 Y144.732 E.24161
G1 X124.12 Y144.63 E.00406
G3 X123.941 Y144.342 I13.151 J-8.353 E.01076
G1 X132.056 Y144.342 E.25778
G1 X132.261 Y143.952 E.01399
G1 X123.746 Y143.952 E.27049
G1 X123.587 Y143.563 E.01337
G1 X132.416 Y143.563 E.28047
G1 X132.532 Y143.173 E.01292
G1 X123.465 Y143.173 E.28804
G1 X123.379 Y142.783 E.01268
G1 X132.616 Y142.783 E.29341
G1 X132.666 Y142.393 E.01249
G1 X123.334 Y142.393 E.29645
G1 X123.319 Y142.003 E.01239
G1 X132.688 Y142.003 E.2976
G1 X132.67 Y141.613 E.0124
G1 X123.334 Y141.613 E.29659
G1 X123.378 Y141.224 E.01246
G1 X132.616 Y141.224 E.29346
G1 X132.534 Y140.834 E.01265
G1 X123.464 Y140.834 E.28813
G1 X123.585 Y140.444 E.01297
G1 X132.419 Y140.444 E.28063
G1 X132.263 Y140.054 E.01333
G1 X123.736 Y140.054 E.27089
G1 X123.94 Y139.664 E.01398
G1 X132.06 Y139.664 E.25792
G1 X131.807 Y139.274 E.01475
G1 X124.193 Y139.274 E.24189
G1 X124.505 Y138.885 E.01586
G1 X131.495 Y138.885 E.22207
G1 X131.106 Y138.495 E.0175
G1 X124.894 Y138.495 E.19734
G1 X125.198 Y138.243 E.01255
G2 X125.393 Y138.105 I-7.605 J-10.938 E.00758
G1 X130.607 Y138.105 E.16563
G1 X130.416 Y137.983 E.0072
G2 X129.892 Y137.715 I-2.239 J3.735 E.01871
G1 X126.108 Y137.715 E.1202
G1 X126.504 Y137.558 E.01353
G1 X126.992 Y137.422 E.01609
G1 X127.242 Y137.374 E.00811
G3 X127.671 Y137.325 I1.231 J8.939 E.01371
G1 X129.294 Y137.325 E.05155
G1 X132.681 Y127.271 F30000
; LINE_WIDTH: 0.433021
G1 F3000
G1 X132.681 Y125.763 E.04793
G2 X132.355 Y124.266 I-4.899 J.283 E.04891
G1 X132.291 Y124.117 E.00514
G1 X132.291 Y127.876 E.1195
G3 X131.901 Y128.596 I-4.262 J-1.845 E.02605
G1 X131.901 Y123.404 E.16502
G2 X131.573 Y122.966 I-5.054 J3.436 E.01742
G1 X131.511 Y122.9 E.00288
G1 X131.511 Y129.1 E.19709
G2 X131.404 Y129.223 I1.083 J1.051 E.00519
G1 X131.121 Y129.491 E.01238
G1 X131.121 Y122.509 E.22192
G1 X130.731 Y122.192 E.01598
G1 X130.731 Y129.804 E.24196
G1 X130.341 Y130.057 E.01478
G1 X130.341 Y121.945 E.25787
G1 X129.951 Y121.745 E.01394
G1 X129.951 Y130.262 E.27073
G1 X129.56 Y130.417 E.01335
G1 X129.56 Y121.586 E.28071
G1 X129.17 Y121.465 E.01299
G1 X129.17 Y130.534 E.28829
G1 X128.78 Y130.622 E.01271
G1 X128.78 Y121.379 E.29382
G1 X128.759 Y121.374 E.00069
G1 X128.39 Y121.334 E.01179
G1 X128.39 Y130.666 E.29665
G1 X128 Y130.688 E.01242
G1 X128 Y121.319 E.29783
G1 X127.61 Y121.331 E.01241
G1 X127.61 Y130.667 E.29678
G1 X127.22 Y130.615 E.01251
G1 X127.22 Y121.385 E.29343
G1 X126.83 Y121.467 E.01267
G1 X126.83 Y130.533 E.28819
G1 X126.44 Y130.417 E.01294
G1 X126.44 Y121.583 E.28082
G1 X126.05 Y121.738 E.01335
G1 X126.05 Y130.262 E.27094
G1 X125.659 Y130.057 E.014
G1 X125.659 Y121.943 E.25794
G1 X125.269 Y122.195 E.01477
G1 X125.269 Y129.804 E.24187
G1 X124.879 Y129.491 E.01589
G1 X124.879 Y122.509 E.22197
G1 X124.597 Y122.776 E.01236
G1 X124.489 Y122.903 E.00529
G1 X124.489 Y129.097 E.1969
G1 X124.268 Y128.837 E.01085
G1 X124.099 Y128.596 E.00935
G1 X124.099 Y123.411 E.16481
G1 X123.983 Y123.584 E.00661
G1 X123.709 Y124.124 E.01925
G1 X123.709 Y127.876 E.1193
G3 X123.432 Y127.048 I3.762 J-1.719 E.02783
G1 X123.374 Y126.76 E.00934
G1 X123.319 Y126.255 E.01614
G3 X123.319 Y124.729 I24.476 J-.769 E.0485
G1 X113.286 Y121.37 F30000
; LINE_WIDTH: 0.428713
G1 F3000
G2 X111.724 Y121.371 I-.737 J69.083 E.04911
G1 X111.432 Y121.397 E.00921
G1 X110.932 Y121.487 E.01598
G1 X110.447 Y121.63 E.01589
G1 X110.145 Y121.756 E.0103
G1 X113.854 Y121.756 E.1166
G1 X114.136 Y121.883 E.00971
G1 X114.573 Y122.142 E.01598
G1 X109.435 Y122.142 E.16153
G1 X109.123 Y122.362 E.01201
G1 X108.926 Y122.528 E.0081
G1 X115.072 Y122.528 E.19321
G1 X115.456 Y122.914 E.01712
G1 X108.541 Y122.914 E.2174
G1 X108.232 Y123.299 E.01555
G1 X115.765 Y123.299 E.23683
G1 X116.013 Y123.685 E.01442
G1 X107.982 Y123.685 E.25247
G2 X107.787 Y124.071 I3.799 J2.168 E.0136
G1 X116.215 Y124.071 E.26497
G1 X116.371 Y124.457 E.01307
M73 P67 R7
G1 X107.628 Y124.457 E.27484
G2 X107.511 Y124.843 I6.931 J2.322 E.01268
G1 X116.487 Y124.843 E.28218
G2 X116.524 Y124.981 I1.266 J-.268 E.0045
G1 X116.573 Y125.228 E.00794
G1 X107.432 Y125.228 E.28737
G2 X107.379 Y125.614 I2.5 J.54 E.01225
G1 X116.616 Y125.614 E.2904
G1 X116.631 Y125.747 E.0042
G1 X116.638 Y126 E.00796
G1 X107.364 Y126 E.29154
G1 X107.379 Y126.386 E.01214
G1 X116.62 Y126.386 E.29052
G1 X116.566 Y126.772 E.01225
G1 X107.432 Y126.772 E.28716
G2 X107.493 Y127.089 I4.459 J-.695 E.01016
G1 X107.511 Y127.157 E.00223
G1 X116.485 Y127.157 E.2821
G1 X116.371 Y127.543 E.01265
G1 X107.633 Y127.543 E.27468
G1 X107.787 Y127.929 E.01305
G1 X116.216 Y127.929 E.26497
G1 X116.013 Y128.315 E.01369
G1 X107.982 Y128.315 E.25248
G1 X108.232 Y128.701 E.01444
G1 X115.763 Y128.701 E.23677
G1 X115.454 Y129.086 E.01555
G1 X108.541 Y129.086 E.2173
G2 X108.926 Y129.472 I3.565 J-3.168 E.01713
G1 X115.067 Y129.472 E.19305
G1 X114.777 Y129.714 E.01186
G1 X114.561 Y129.858 E.00816
G1 X109.435 Y129.858 E.16115
G2 X110.138 Y130.244 I2.415 J-3.568 E.02525
G1 X113.868 Y130.244 E.11726
G3 X113.434 Y130.41 I-3.326 J-8.017 E.01463
G1 X113.191 Y130.482 E.00797
G1 X112.695 Y130.585 E.01593
G1 X112.235 Y130.629 E.0145
G1 X110.717 Y130.629 E.04774
G1 X108.63 Y129.731 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X108.622 Y129.723 E.00038
G3 X107.937 Y128.965 I3.415 J-3.773 E.03396
G1 X100.95 Y121.978 E.32775
G1 X100.95 Y122.346 E.01219
G1 X109.153 Y114.143 E.38479
G2 X111.484 Y114.997 I2.823 J-4.096 E.08324
G2 X115.155 Y113.913 I.521 J-4.99 E.13026
G1 X115.216 Y113.867 E.00255
G2 X115.553 Y113.553 I-1.834 J-2.299 E.01529
G1 X124.409 Y122.409 E.41549
G1 X124.612 Y122.222 E.00914
G3 X127.775 Y120.926 I3.382 J3.748 E.11568
G1 X128.116 Y120.927 E.01131
G3 X131.591 Y122.409 I-.136 J5.133 E.12833
G1 X140.356 Y113.611 E.41198
G3 X139.785 Y107.081 I3.65 J-3.609 E.23584
G1 X131.657 Y98.953 E.38129
G1 X132.019 Y98.953 E.01201
G1 X125.138 Y105.804 E.32209
G2 X124.235 Y106.596 I2.693 J3.977 E.03995
G1 X129.294 Y105.325 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.432478
G1 F3000
G1 X127.691 Y105.325 E.05088
G2 X126.266 Y105.645 I.284 J4.601 E.04656
G1 X126.103 Y105.715 E.00561
G1 X129.891 Y105.715 E.12024
G1 X130.414 Y105.982 E.01864
G1 X130.606 Y106.104 E.00723
G1 X125.394 Y106.104 E.16545
G3 X125.164 Y106.268 I-8.111 J-11.184 E.00896
G1 X124.895 Y106.494 E.01116
G1 X131.105 Y106.494 E.19714
G1 X131.494 Y106.883 E.01748
G1 X124.506 Y106.883 E.22185
G1 X124.19 Y107.273 E.01592
G1 X131.811 Y107.273 E.24192
G3 X132.016 Y107.583 I-9.069 J6.244 E.01181
G1 X132.059 Y107.663 E.00287
G1 X123.938 Y107.663 E.25777
G1 X123.744 Y108.052 E.01383
G1 X132.263 Y108.052 E.27043
G3 X132.418 Y108.442 I-2.87 J1.369 E.01332
G1 X123.586 Y108.442 E.28037
G1 X123.464 Y108.831 E.01295
G1 X132.536 Y108.831 E.28797
G2 X132.577 Y108.989 I1.466 J-.303 E.00519
G1 X132.622 Y109.221 E.00749
G1 X123.379 Y109.221 E.29342
G1 X123.334 Y109.61 E.01245
G1 X132.666 Y109.61 E.29624
G1 X132.688 Y110 E.01239
G1 X123.319 Y110 E.29739
G1 X123.319 Y110.255 E.00811
G1 X123.33 Y110.389 E.00427
G1 X132.667 Y110.389 E.29637
G3 X132.626 Y110.758 I-5.412 J-.41 E.01177
G1 X132.621 Y110.779 E.00069
G1 X123.379 Y110.779 E.29341
G2 X123.464 Y111.169 I2.798 J-.412 E.01267
G1 X132.536 Y111.169 E.28797
G3 X132.442 Y111.496 I-6.377 J-1.64 E.01082
G1 X132.418 Y111.558 E.00211
G1 X123.582 Y111.558 E.28049
G3 X123.645 Y111.735 I-1.605 J.672 E.00597
G1 X123.737 Y111.948 E.00735
G1 X132.263 Y111.948 E.27063
G1 X132.056 Y112.337 E.01399
G1 X123.941 Y112.337 E.25762
G2 X124.12 Y112.63 I5.53 J-3.172 E.0109
G1 X124.193 Y112.727 E.00385
G1 X131.807 Y112.727 E.2417
G1 X131.5 Y113.116 E.01575
G1 X124.504 Y113.116 E.22205
G2 X124.776 Y113.403 I2.032 J-1.653 E.01253
G1 X124.891 Y113.506 E.00491
G1 X131.105 Y113.506 E.19728
G1 X130.838 Y113.731 E.01109
G1 X130.605 Y113.895 E.00906
G1 X125.395 Y113.895 E.16538
G1 X125.806 Y114.142 E.01521
G1 X126.108 Y114.285 E.01062
G1 X129.892 Y114.285 E.1201
G3 X128.508 Y114.66 I-1.861 J-4.125 E.04571
G1 X128.331 Y114.675 E.00564
G1 X126.681 Y114.675 E.05235
G1 X115.266 Y113.527 F30000
; LINE_WIDTH: 0.428916
G1 F3000
G1 X115.996 Y112.347 E.04364
G2 X116.575 Y110.758 I-3.881 J-2.315 E.05353
G1 X116.59 Y110.654 E.00328
G1 X114.637 Y113.811 E.11675
G3 X113.933 Y114.214 I-2.69 J-3.879 E.02553
G1 X116.63 Y109.856 E.16119
G1 X116.61 Y109.493 E.01142
G1 X116.57 Y109.219 E.00872
G1 X113.343 Y114.435 E.19294
G3 X112.944 Y114.541 I-.95 J-2.773 E.01298
G1 X112.81 Y114.561 E.00426
G1 X116.445 Y108.687 E.21727
G2 X116.303 Y108.27 I-3.342 J.904 E.01389
G1 X116.28 Y108.22 E.00171
G1 X112.319 Y114.622 E.23676
G1 X111.858 Y114.634 E.01453
G1 X116.084 Y107.803 E.25265
G1 X115.859 Y107.434 E.01361
G1 X111.428 Y114.595 E.26488
G1 X111.017 Y114.526 E.01311
G1 X115.612 Y107.1 E.27469
G1 X115.345 Y106.797 E.01268
G1 X110.625 Y114.426 E.28216
G1 X110.253 Y114.294 E.01242
G1 X115.063 Y106.52 E.28753
G1 X114.758 Y106.279 E.01222
G1 X109.9 Y114.13 E.2904
G3 X109.562 Y113.943 I1.107 J-2.399 E.01217
G1 X114.438 Y106.062 E.29152
G1 X114.104 Y105.869 E.01215
G1 X109.243 Y113.724 E.29055
G3 X108.939 Y113.483 I1.447 J-2.142 E.01223
G1 X113.749 Y105.709 E.28755
G1 X113.379 Y105.573 E.0124
G1 X108.656 Y113.206 E.28232
G3 X108.403 Y112.927 I3.765 J-3.673 E.01185
G1 X108.388 Y112.906 E.00082
G1 X112.986 Y105.475 E.27487
G1 X112.576 Y105.403 E.01308
G1 X108.141 Y112.57 E.2651
G1 X107.92 Y112.194 E.01373
G1 X112.145 Y105.367 E.25254
G1 X111.687 Y105.373 E.0144
G1 X107.722 Y111.782 E.23704
G1 X107.556 Y111.316 E.01554
G1 X111.196 Y105.433 E.21758
G2 X110.688 Y105.552 I1.042 J5.621 E.01639
G1 X110.663 Y105.561 E.00084
G1 X107.433 Y110.781 E.19309
G1 X107.378 Y110.38 E.01273
G1 X107.372 Y110.146 E.00736
G1 X110.071 Y105.784 E.16133
G1 X109.537 Y106.07 E.01905
G1 X109.365 Y106.192 E.00663
G1 X107.408 Y109.354 E.11694
G1 X107.502 Y108.872 E.01542
G1 X107.57 Y108.627 E.008
G1 X107.746 Y108.152 E.01595
G1 X107.958 Y107.732 E.01478
G1 X108.732 Y106.48 E.0463
; WIPE_START
G1 F24000
G1 X107.958 Y107.732 E-.55936
G1 X107.746 Y108.152 E-.1786
G1 X107.726 Y108.206 E-.02204
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.102 J1.213 P1  F30000
G1 X142.731 Y105.266 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.421721
G1 F3000
G3 X144.316 Y105.273 I.584 J50.779 E.04894
G1 X144.823 Y105.334 E.01576
G1 X145.318 Y105.449 E.01567
G1 X145.862 Y105.645 E.01787
G1 X142.141 Y105.645 E.11486
G1 X141.632 Y105.897 E.01755
G1 X141.436 Y106.024 E.0072
G1 X146.568 Y106.024 E.1584
G1 X146.896 Y106.251 E.01232
G1 X147.073 Y106.403 E.00719
G1 X140.925 Y106.403 E.18976
G1 X140.526 Y106.782 E.017
G1 X147.475 Y106.782 E.21452
G2 X147.629 Y106.954 I1.682 J-1.343 E.00713
G1 X147.792 Y107.16 E.00812
G1 X140.214 Y107.16 E.23392
G1 X139.959 Y107.539 E.0141
G1 X148.046 Y107.539 E.24963
G1 X148.25 Y107.918 E.01328
G1 X139.752 Y107.918 E.26232
G1 X139.585 Y108.297 E.01277
G1 X148.414 Y108.297 E.27251
M73 P68 R7
G1 X148.542 Y108.676 E.01235
G1 X139.454 Y108.676 E.28053
G1 X139.361 Y109.054 E.01204
G1 X148.639 Y109.054 E.28641
G1 X148.701 Y109.433 E.01185
G1 X139.303 Y109.433 E.2901
G1 X139.272 Y109.812 E.01173
G1 X148.728 Y109.812 E.29186
G1 X148.727 Y110.191 E.01169
G1 X139.269 Y110.191 E.29196
G1 X139.3 Y110.57 E.01173
G1 X148.702 Y110.57 E.29023
G3 X148.639 Y110.948 I-5.714 J-.759 E.01186
G1 X139.365 Y110.948 E.28627
G1 X139.459 Y111.327 E.01205
G1 X148.544 Y111.327 E.28045
G3 X148.418 Y111.706 I-2.81 J-.727 E.01234
G1 X139.582 Y111.706 E.27275
G2 X139.746 Y112.085 I8.519 J-3.464 E.01274
G1 X148.249 Y112.085 E.26246
G3 X148.071 Y112.423 I-2.204 J-.941 E.0118
G1 X148.046 Y112.464 E.00149
G1 X139.957 Y112.464 E.24966
G2 X140.137 Y112.743 I5.188 J-3.14 E.01024
G1 X140.212 Y112.842 E.00385
G1 X147.782 Y112.842 E.23366
G1 X147.63 Y113.045 E.00782
G1 X147.465 Y113.221 E.00745
G1 X140.532 Y113.221 E.21399
G2 X140.927 Y113.6 I2.604 J-2.319 E.0169
G1 X147.078 Y113.6 E.18988
G3 X146.564 Y113.979 I-2.767 J-3.219 E.01974
G1 X141.43 Y113.979 E.15847
G2 X142.084 Y114.333 I2.784 J-4.361 E.02299
G1 X142.149 Y114.358 E.00213
G1 X145.852 Y114.358 E.11431
G3 X144.319 Y114.727 I-1.96 J-4.771 E.04888
G3 X142.723 Y114.736 I-.925 J-21.342 E.04927
G1 X145.458 Y114.917 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X146.921 Y114.217 I-1.445 J-4.897 E.05403
G1 X155.046 Y122.342 E.38117
G1 X155.046 Y121.982 E.01195
G1 X148.414 Y128.614 E.31114
G3 X147.439 Y129.8 I-4.695 J-2.864 E.05108
G1 X142.712 Y130.733 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.42157
G1 F3000
G2 X144.572 Y130.703 I.579 J-21.751 E.0574
G1 X145.072 Y130.615 E.01568
G1 X145.56 Y130.473 E.01566
G1 X145.85 Y130.354 E.00968
G1 X142.136 Y130.354 E.1146
G1 X141.632 Y130.103 E.01739
G1 X141.436 Y129.976 E.00721
G1 X146.574 Y129.976 E.15852
G1 X147.082 Y129.597 E.01956
G1 X140.925 Y129.597 E.18998
G1 X140.811 Y129.503 E.00456
G3 X140.529 Y129.218 I1.832 J-2.091 E.01237
G1 X147.475 Y129.218 E.21431
G1 X147.792 Y128.84 E.01523
G1 X140.214 Y128.84 E.2338
G1 X139.956 Y128.461 E.01414
G1 X148.046 Y128.461 E.24961
G1 X148.25 Y128.083 E.01328
G1 X139.745 Y128.083 E.26242
G1 X139.584 Y127.704 E.0127
G1 X148.414 Y127.704 E.27246
G1 X148.547 Y127.325 E.01239
G1 X139.454 Y127.325 E.28057
G3 X139.361 Y126.947 I2.663 J-.857 E.01204
G1 X148.639 Y126.947 E.28628
G2 X148.701 Y126.568 I-2.636 J-.623 E.01185
G1 X139.298 Y126.568 E.29013
G1 X139.273 Y126.189 E.01171
G1 X148.731 Y126.189 E.29184
G1 X148.731 Y125.811 E.01168
G1 X139.267 Y125.811 E.292
G1 X139.278 Y125.618 E.00596
G2 X139.3 Y125.432 I-1.721 J-.296 E.00578
G1 X148.701 Y125.432 E.29007
G2 X148.641 Y125.053 I-5.793 J.721 E.01183
G1 X139.361 Y125.053 E.28634
G3 X139.453 Y124.675 I5.604 J1.158 E.01202
G1 X148.542 Y124.675 E.28045
G1 X148.414 Y124.296 E.01233
G1 X139.586 Y124.296 E.2724
G1 X139.752 Y123.917 E.01276
G1 X148.253 Y123.917 E.2623
G1 X148.041 Y123.539 E.0134
G1 X139.959 Y123.539 E.24936
G1 X140.214 Y123.16 E.01409
G1 X147.784 Y123.16 E.23356
G1 X147.63 Y122.955 E.00791
G1 X147.467 Y122.781 E.00733
G1 X140.53 Y122.781 E.21406
G1 X140.925 Y122.403 E.01689
G1 X147.082 Y122.403 E.18997
G2 X146.568 Y122.024 I-2.757 J3.203 E.01972
G1 X141.436 Y122.024 E.15835
G1 X141.856 Y121.775 E.01505
G2 X142.137 Y121.645 I-2.117 J-4.944 E.00955
G1 X145.859 Y121.645 E.11485
G1 X145.798 Y121.617 E.00208
G2 X143.863 Y121.267 I-1.811 J4.49 E.0611
G1 X142.713 Y121.267 E.03549
G1 X139.237 Y124.107 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X140.067 Y122.715 I4.442 J1.704 E.05402
G1 X131.253 Y113.901 E.4135
G1 X130.839 Y114.212 E.01718
G3 X129.377 Y114.889 I-2.936 J-4.423 E.05366
G1 X129.37 Y114.892 E.00024
G3 X124.748 Y113.9 I-1.356 J-4.947 E.16296
G1 X115.864 Y122.784 E.41678
G1 X116.296 Y123.384 E.02454
G3 X117.03 Y126.004 I-4.372 J2.637 E.09134
G1 X117.028 Y126.052 E.00158
G3 X115.861 Y129.213 I-5.016 J-.054 E.11401
G1 X124.747 Y138.099 E.41686
G3 X126.409 Y137.177 I3.226 J3.853 E.06342
G1 X126.544 Y137.139 E.00467
G3 X127.724 Y136.928 I1.522 J5.091 E.03984
G1 X127.748 Y136.927 E.00078
G3 X131.252 Y138.1 I.257 J5.054 E.12548
G1 X140.064 Y129.288 E.4134
G2 X141.29 Y130.348 I3.789 J-3.138 E.05401
G1 X140.337 Y138.735 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.421751
G1 F3000
G1 X139.741 Y139.927 E.04114
G2 X139.275 Y141.705 I4.284 J2.071 E.05709
G1 X140.927 Y138.401 E.11402
G1 X141.205 Y138.174 E.01109
G1 X141.589 Y137.924 E.01414
G1 X139.295 Y142.513 E.15836
G1 X139.403 Y143.144 E.01977
G1 X142.156 Y137.637 E.19006
G1 X142.669 Y137.459 E.01676
G1 X139.567 Y143.664 E.21416
G1 X139.763 Y144.118 E.01528
G1 X143.15 Y137.345 E.23376
G1 X143.603 Y137.286 E.01411
G1 X139.987 Y144.517 E.24958
G1 X139.996 Y144.533 E.00056
G2 X140.235 Y144.869 I2.528 J-1.543 E.01274
G1 X144.035 Y137.269 E.26229
G1 X144.45 Y137.285 E.01283
G1 X140.499 Y145.188 E.27273
G1 X140.78 Y145.472 E.01236
G1 X144.846 Y137.34 E.28069
G3 X145.226 Y137.428 I-.42 J2.671 E.01204
G1 X141.079 Y145.722 E.28627
G1 X141.39 Y145.946 E.01184
G1 X145.593 Y137.54 E.29012
G3 X145.945 Y137.684 I-.807 J2.467 E.01174
G1 X141.714 Y146.145 E.29202
G1 X142.052 Y146.317 E.01169
G1 X146.285 Y137.851 E.29219
G2 X146.479 Y137.962 I2.112 J-3.437 E.0069
G1 X146.608 Y138.052 E.00486
G1 X142.405 Y146.457 E.29011
G1 X142.771 Y146.574 E.01184
G1 X146.921 Y138.272 E.28651
G1 X147.217 Y138.527 E.01206
G1 X143.152 Y146.658 E.28061
G1 X143.547 Y146.716 E.01231
G1 X147.499 Y138.81 E.27283
G3 X147.765 Y139.127 I-2.256 J2.163 E.01276
G1 X143.962 Y146.733 E.26253
G1 X144.394 Y146.715 E.01337
G1 X148.011 Y139.482 E.24965
G1 X148.233 Y139.885 E.01421
G1 X144.848 Y146.655 E.23366
G2 X145.329 Y146.54 I-.326 J-2.426 E.0153
G1 X148.43 Y140.338 E.21407
G1 X148.493 Y140.497 E.0053
G1 X148.593 Y140.858 E.01157
G1 X145.844 Y146.357 E.18978
G1 X146.031 Y146.28 E.00626
G1 X146.408 Y146.076 E.01322
G1 X148.703 Y141.486 E.15842
G1 X148.738 Y142.001 E.01593
G2 X148.728 Y142.283 I4.205 J.289 E.00873
G1 X147.064 Y145.611 E.11485
G1 X147.461 Y145.235 E.01688
G1 X147.788 Y144.846 E.0157
G1 X148.071 Y144.423 E.01572
G2 X148.81 Y142.966 I-36.643 J-19.496 E.05041
G1 X149.126 Y141.866 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X149.13 Y142.014 E.00493
G3 X148.908 Y143.471 I-5.177 J-.04 E.04906
G1 X155.05 Y137.33 E.28809
G1 X155.05 Y137.698 E.01218
G1 X147.287 Y129.935 E.36418
G1 X146.622 Y130.406 E.02703
G1 X132.253 Y144.775 E.67406
G1 X132.052 Y145.063 E.01165
G3 X131.901 Y145.253 I-2.413 J-1.773 E.00806
G1 X139.698 Y153.05 E.36577
G1 X139.33 Y153.05 E.01219
G1 X145.474 Y146.906 E.2882
G2 X147.623 Y145.623 I-1.384 J-4.762 E.08395
G1 X150.642 Y148.642 E.1416
G2 X153.76 Y144.084 I-12.466 J-11.877 E.18398
G1 X109.915 Y100.239 E2.05686
G3 X111.437 Y99.663 I6.734 J15.475 E.054
G1 X143.857 Y104.874 F30000
G1 F15476.087
G1 X143.991 Y104.876 E.00442
G3 X145.465 Y105.085 I.063 J4.848 E.04961
G1 X139.334 Y98.954 E.28762
G1 X139.694 Y98.954 E.01192
G1 X131.897 Y106.751 E.36577
G3 X132.247 Y107.22 I-2.829 J2.485 E.01943
G1 X146.693 Y121.634 E.67692
G3 X147.287 Y122.065 I-3.329 J5.205 E.02437
G1 X155.044 Y114.308 E.36392
G1 X155.044 Y114.664 E.01183
M73 P69 R7
G1 X148.893 Y108.473 E.28949
G2 X147.626 Y106.374 I-4.829 J1.482 E.08217
G1 X150.634 Y103.366 E.14109
G2 X146.083 Y100.241 I-10.785 J10.826 E.18413
G1 X102.239 Y144.085 E2.05681
G3 X101.663 Y142.563 I15.474 J-6.734 E.054
; WIPE_START
G1 F24000
G1 X102.239 Y144.085 E-.6184
G1 X102.503 Y143.821 E-.1416
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.012 J1.217 P1  F30000
G1 X139.088 Y143.456 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F15476.087
G1 X139.176 Y143.744 E.00999
G2 X139.785 Y144.919 I4.99 J-1.84 E.04401
G1 X131.654 Y153.05 E.38142
G1 X132.022 Y153.05 E.01219
G1 X125.059 Y146.136 E.32549
G3 X124.233 Y145.406 I2.676 J-3.855 E.03665
G1 X144.563 Y152.337 F30000
G1 F15476.087
G2 X146.085 Y151.761 I-5.212 J-16.052 E.054
G1 X102.239 Y107.915 E2.05689
G3 X105.358 Y103.358 I15.608 J7.338 E.18397
G1 X108.444 Y106.444 E.14475
G2 X107.649 Y107.478 I3.917 J3.834 E.04338
G1 X107.645 Y107.484 E.00022
G2 X107.246 Y108.375 I6.371 J3.393 E.0324
G1 X100.95 Y114.67 E.29532
G1 X100.95 Y114.302 E.01219
G1 X108.783 Y122.135 E.36747
G1 X123.752 Y107.221 E.70094
G1 X123.872 Y107.043 E.0071
G3 X124.103 Y106.751 I1.938 J1.299 E.01237
G1 X116.302 Y98.95 E.36596
G1 X116.67 Y98.95 E.01219
G1 X110.379 Y105.241 E.29512
G3 X113.021 Y105.082 I1.613 J4.755 E.08885
G1 X113.811 Y105.307 E.02725
G3 X116.145 Y107.151 I-1.814 J4.696 E.10016
G1 X124.344 Y98.952 E.38465
G1 X123.98 Y98.952 E.0121
G1 X130.849 Y105.794 E.32161
G3 X131.765 Y106.596 I-3.401 J4.808 E.04047
G1 X147.441 Y122.198 F30000
G1 F15476.087
G1 X147.82 Y122.585 E.01797
G3 X148.394 Y123.366 I-3.229 J2.973 E.03223
G1 X155.048 Y130.02 E.31214
G1 X155.048 Y129.656 E.01207
G1 X146.916 Y137.788 E.38147
G2 X140.373 Y138.373 I-2.921 J4.204 E.23658
G1 X131.591 Y129.591 E.412
G1 X131.497 Y129.685 E.00442
G3 X128.818 Y131.014 I-3.538 J-3.769 E.10062
G3 X128.28 Y131.072 I-11.672 J-104.836 E.01796
G1 X127.997 Y131.08 E.00939
G3 X124.409 Y129.591 I.021 J-5.117 E.13217
G1 X115.555 Y138.445 E.41535
G1 X115.664 Y138.557 E.00517
G3 X116.145 Y144.849 I-3.669 J3.445 E.22625
G1 X124.346 Y153.05 E.38471
G1 X123.978 Y153.05 E.01219
G1 X130.78 Y146.247 E.3191
G1 X131.28 Y145.879 E.0206
G2 X131.767 Y145.406 I-5.432 J-6.073 E.02252
; WIPE_START
G1 F24000
G1 X131.28 Y145.879 E-.25789
G1 X130.78 Y146.247 E-.23596
G1 X130.285 Y146.743 E-.26615
; WIPE_END
G1 E-.04 F1800
G1 X134.42 Y140.328 Z5.6 F30000
G1 X154.33 Y109.442 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F15476.087
G2 X153.757 Y107.919 I-9.637 J2.754 E.05403
G1 X109.915 Y151.761 E2.05671
G3 X105.358 Y148.642 I7.338 J-15.607 E.18397
G1 X108.466 Y145.579 E.14473
G2 X110.372 Y146.752 I3.595 J-3.706 E.07486
G1 X116.67 Y153.05 E.29542
G1 X116.302 Y153.05 E.01219
G1 X124.1 Y145.252 E.3658
G1 X123.963 Y145.083 E.00722
G3 X123.752 Y144.78 I6.072 J-4.443 E.01223
G1 X108.783 Y129.865 E.70098
M73 P69 R6
G1 X100.95 Y137.698 E.36747
G1 X100.95 Y137.33 E.01219
G1 X107.245 Y143.625 E.29529
G1 X107.124 Y143.234 E.01357
G3 X109.156 Y137.86 I4.866 J-1.232 E.20292
G1 X100.95 Y129.654 E.38493
G1 X100.95 Y130.022 E.01219
G1 X108.186 Y122.729 E.34078
G3 X108.63 Y122.269 I2.431 J1.902 E.02125
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.186 Y122.729 E-.24297
G1 X107.228 Y123.695 E-.51703
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
G17
G3 Z5.6 I-1.217 J-.023 P1  F30000
G1 X106.727 Y150.286 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X106.357 Y149.997 E.01558
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.313 Y98.606 E.80638
G3 X155.398 Y114.004 I-.315 J15.396 E.79201
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.02 Y150.502 I.01 J-15.412 E.31823
G1 X106.775 Y150.321 E.01008
G1 X106.49 Y150.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.01476
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.323 Y98.214 E.74733
G3 X155.79 Y114.001 I-.325 J15.788 E.75219
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.538 Y150.633 E.00967
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.303 E-.20534
G1 X105.534 Y149.822 E-.28515
G1 X105.017 Y149.337 E-.26951
; WIPE_END
G1 E-.04 F1800
G1 X107.819 Y144.371 Z5.8 F30000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.428912
G1 F15000
G1 X108.797 Y145.349 E.04352
G1 X109.123 Y145.638 E.01369
G1 X109.537 Y145.93 E.01593
G1 X109.98 Y146.174 E.01591
G1 X110.306 Y146.312 E.01114
G1 X107.682 Y143.689 E.11669
G1 X107.502 Y143.13 E.01846
G1 X107.462 Y142.922 E.00666
G1 X111.081 Y146.541 E.16097
G1 X111.713 Y146.627 E.02006
G1 X107.378 Y142.292 E.19283
G1 X107.364 Y142.126 E.00525
G1 X107.374 Y141.743 E.01205
G1 X112.258 Y146.627 E.21725
G1 X112.751 Y146.574 E.01558
G1 X107.429 Y141.252 E.23674
G1 X107.524 Y140.801 E.01449
G1 X113.202 Y146.479 E.25257
G1 X113.614 Y146.345 E.01362
G1 X107.653 Y140.384 E.26514
G1 X107.82 Y140.005 E.01302
G1 X113.996 Y146.181 E.27472
G1 X114.355 Y145.995 E.01271
G1 X108.007 Y139.647 E.28238
G1 X108.221 Y139.315 E.01242
G1 X114.683 Y145.777 E.28743
G1 X114.989 Y145.537 E.01223
G1 X108.463 Y139.01 E.29032
G1 X108.725 Y138.726 E.01215
G1 X115.274 Y145.276 E.29135
G1 X115.539 Y144.995 E.01215
G1 X109.005 Y138.461 E.29063
G1 X109.316 Y138.226 E.01226
G1 X115.776 Y144.686 E.28735
G1 X115.991 Y144.356 E.01241
G1 X109.646 Y138.01 E.28226
G1 X109.999 Y137.817 E.01265
G1 X116.182 Y144 E.27503
G1 X116.342 Y143.614 E.01314
G1 X110.384 Y137.656 E.26503
G1 X110.799 Y137.526 E.0137
G1 X116.473 Y143.2 E.25237
G1 X116.528 Y143.005 E.00636
G1 X116.57 Y142.75 E.00812
G1 X111.249 Y137.43 E.23666
G1 X111.737 Y137.372 E.01545
G1 X116.624 Y142.259 E.21736
G1 X116.638 Y142 E.00814
G1 X116.628 Y141.717 E.00892
G1 X112.286 Y137.375 E.1931
G1 X112.694 Y137.414 E.01287
G1 X112.918 Y137.461 E.0072
G1 X116.54 Y141.083 E.16112
G1 X116.466 Y140.749 E.01077
G1 X116.311 Y140.308 E.01469
G1 X113.681 Y137.678 E.11698
G1 X114.133 Y137.882 E.01559
G1 X114.355 Y138.005 E.008
G1 X114.777 Y138.286 E.01595
G1 X115.127 Y138.578 E.01434
G1 X116.174 Y139.625 E.04656
G1 X123.775 Y144.393 F30000
; LINE_WIDTH: 0.432889
G1 F15000
G2 X124.965 Y145.572 I22.362 J-21.37 E.05324
G1 X125.369 Y145.879 E.01612
G1 X125.583 Y146.017 E.0081
G1 X126.031 Y146.254 E.01611
G1 X126.291 Y146.358 E.0089
G1 X123.633 Y143.7 E.11946
G1 X123.487 Y143.268 E.01448
G1 X123.411 Y142.926 E.01113
G1 X127.077 Y146.592 E.16473
G1 X127.493 Y146.66 E.01339
G1 X127.708 Y146.672 E.00686
G1 X123.323 Y142.286 E.19709
G1 X123.321 Y141.733 E.01759
G1 X128.267 Y146.679 E.22231
G1 X128.764 Y146.625 E.01588
G1 X123.375 Y141.236 E.24218
G1 X123.475 Y140.784 E.01471
G1 X129.216 Y146.525 E.25802
G1 X129.632 Y146.39 E.0139
G1 X123.61 Y140.368 E.27061
G1 X123.773 Y139.979 E.01339
G1 X130.018 Y146.224 E.28063
G1 X130.378 Y146.032 E.01295
G1 X123.964 Y139.619 E.28822
G1 X124.184 Y139.287 E.01265
G1 X130.714 Y145.817 E.29345
G1 X131.027 Y145.579 E.01251
G1 X124.426 Y138.977 E.29666
G1 X124.689 Y138.689 E.01241
G1 X131.311 Y145.311 E.2976
G1 X131.573 Y145.035 E.01211
G1 X124.973 Y138.421 E.2969
G1 X125.286 Y138.183 E.01251
G1 X131.816 Y144.713 E.29345
G1 X132.036 Y144.381 E.01265
G1 X125.619 Y137.964 E.28837
G1 X125.979 Y137.773 E.01296
G1 X132.227 Y144.021 E.28076
G1 X132.389 Y143.631 E.0134
G1 X126.369 Y137.611 E.27054
G1 X126.788 Y137.479 E.01396
G1 X132.521 Y143.212 E.25767
G1 X132.578 Y143.007 E.00677
G1 X132.619 Y142.759 E.00801
G1 X127.241 Y137.381 E.24167
G1 X127.732 Y137.32 E.01572
G1 X132.674 Y142.262 E.22206
G1 X132.678 Y141.715 E.01738
G1 X128.285 Y137.322 E.19743
G1 X128.923 Y137.408 E.02045
G1 X132.592 Y141.077 E.16489
G1 X132.442 Y140.504 E.01883
G1 X132.358 Y140.292 E.00725
G1 X129.708 Y137.642 E.11908
G1 X129.969 Y137.746 E.00891
G1 X130.417 Y137.983 E.01611
G1 X130.631 Y138.121 E.0081
G1 X131.034 Y138.427 E.01608
G3 X132.217 Y139.599 I-22.754 J24.14 E.05294
G1 X124.235 Y145.404 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X125.225 Y146.253 I3.558 J-3.145 E.04342
G1 X132.022 Y153.05 E.31883
G1 X131.654 Y153.05 E.01219
G1 X139.785 Y144.919 E.38142
G3 X139.088 Y143.456 I3.93 J-2.768 E.05402
G1 X141.571 Y146.263 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421628
G1 F15000
G3 X140.454 Y145.142 I82.908 J-83.747 E.04884
G1 X140.137 Y144.743 E.01573
G1 X139.866 Y144.314 E.01565
G1 X139.61 Y143.766 E.01866
G1 X142.241 Y146.398 E.11484
G1 X142.805 Y146.584 E.01831
G1 X143.011 Y146.632 E.00654
G1 X139.373 Y142.994 E.15877
G1 X139.305 Y142.635 E.01128
G1 X139.283 Y142.368 E.00824
G1 X143.635 Y146.72 E.18991
G1 X144.18 Y146.729 E.01682
G1 X139.272 Y141.822 E.21419
G1 X139.278 Y141.618 E.00628
G1 X139.317 Y141.33 E.00896
G1 X144.672 Y146.686 E.23371
G1 X145.121 Y146.6 E.01413
G1 X139.403 Y140.881 E.24955
G1 X139.521 Y140.463 E.0134
G1 X145.537 Y146.48 E.26259
G1 X145.919 Y146.326 E.0127
G1 X139.675 Y140.082 E.27252
G1 X139.852 Y139.724 E.01233
G1 X146.276 Y146.148 E.28034
G1 X146.614 Y145.95 E.01208
G1 X140.052 Y139.388 E.28636
G1 X140.275 Y139.075 E.01185
G1 X146.921 Y145.722 E.29007
G1 X147.211 Y145.476 E.01173
G1 X140.523 Y138.788 E.29187
G1 X140.789 Y138.518 E.01169
G1 X147.482 Y145.211 E.29207
G1 X147.726 Y144.92 E.01173
G1 X141.082 Y138.275 E.28997
G1 X141.205 Y138.174 E.00493
G1 X141.394 Y138.052 E.00693
G1 X147.948 Y144.606 E.28606
G1 X148.15 Y144.272 E.01204
G1 X141.726 Y137.849 E.28034
G1 X142.081 Y137.668 E.01229
G1 X148.33 Y143.917 E.2727
G1 X148.481 Y143.533 E.01274
G1 X142.471 Y137.522 E.26231
G1 X142.884 Y137.399 E.01329
G1 X148.6 Y143.116 E.24947
G1 X148.685 Y142.665 E.01415
G1 X143.331 Y137.311 E.23366
G1 X143.822 Y137.266 E.0152
G1 X148.728 Y142.173 E.21415
G1 X148.738 Y142 E.00535
G1 X148.718 Y141.627 E.01152
G1 X144.37 Y137.279 E.18975
G1 X144.822 Y137.334 E.01405
G1 X145.003 Y137.376 E.00571
G1 X148.623 Y140.997 E.15802
G1 X148.494 Y140.5 E.01585
G1 X148.384 Y140.222 E.0092
G1 X145.769 Y137.606 E.11417
G1 X146.259 Y137.835 E.01669
G1 X146.491 Y137.97 E.00829
G1 X146.897 Y138.251 E.01524
G1 X147.274 Y138.576 E.01534
G1 X148.25 Y139.552 E.04261
G1 X147.439 Y129.8 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X148.414 Y128.614 I-3.31 J-3.714 E.05112
G1 X155.046 Y121.982 E.31113
G1 X155.046 Y122.342 E.01195
G1 X146.921 Y114.217 E.38117
G3 X145.458 Y114.917 I-3.181 J-4.769 E.05399
G1 X141.557 Y114.256 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421824
G1 F15000
G1 X140.618 Y113.317 E.041
G1 X140.29 Y112.947 E.01525
G1 X140.137 Y112.743 E.00788
G1 X139.866 Y112.314 E.01566
G1 X139.607 Y111.77 E.0186
G1 X142.223 Y114.386 E.11422
G1 X142.561 Y114.514 E.01116
G1 X143.002 Y114.629 E.01407
G1 X139.375 Y111.002 E.15837
G1 X139.305 Y110.635 E.01154
G1 X139.284 Y110.375 E.00804
G1 X143.629 Y114.72 E.18971
G1 X144.177 Y114.733 E.01695
G1 X139.272 Y109.827 E.21419
G1 X139.278 Y109.618 E.00646
G1 X139.316 Y109.335 E.00881
G1 X144.665 Y114.685 E.23358
G1 X145.114 Y114.598 E.01412
G1 X139.402 Y108.886 E.24942
G1 X139.522 Y108.47 E.01336
G1 X145.529 Y114.477 E.26229
G1 X145.916 Y114.328 E.01279
G1 X139.671 Y108.083 E.27267
G1 X139.847 Y107.723 E.01236
G1 X146.277 Y114.153 E.28076
G1 X146.609 Y113.949 E.01203
G1 X140.052 Y107.392 E.28633
G1 X140.277 Y107.081 E.01185
G1 X146.919 Y113.723 E.29003
G1 X147.212 Y113.481 E.01175
G1 X140.519 Y106.788 E.29223
G1 X140.628 Y106.672 E.00489
G1 X140.787 Y106.52 E.00681
G1 X147.476 Y113.209 E.2921
G1 X147.723 Y112.92 E.01173
G1 X141.08 Y106.277 E.29009
G1 X141.392 Y106.053 E.01186
G1 X147.951 Y112.612 E.2864
G1 X148.151 Y112.276 E.01207
G1 X141.724 Y105.85 E.28061
G1 X142.08 Y105.669 E.01231
G1 X148.326 Y111.915 E.27275
G1 X148.477 Y111.53 E.01277
G1 X142.468 Y105.521 E.26238
G1 X142.884 Y105.402 E.01337
M73 P70 R6
G1 X148.599 Y111.116 E.24952
G1 X148.688 Y110.67 E.01405
G1 X143.334 Y105.316 E.23379
G1 X143.82 Y105.266 E.01508
G1 X148.728 Y110.174 E.21432
G1 X148.738 Y109.999 E.0054
G1 X148.718 Y109.628 E.01149
G1 X144.369 Y105.279 E.18988
G1 X144.822 Y105.334 E.01409
G1 X145.002 Y105.376 E.00569
G1 X148.631 Y109.006 E.15849
G1 X148.494 Y108.5 E.01617
G1 X148.385 Y108.223 E.0092
G1 X145.768 Y105.606 E.11426
G1 X146.032 Y105.72 E.00888
G1 X146.478 Y105.962 E.01566
G1 X146.897 Y106.251 E.01574
G1 X147.273 Y106.575 E.0153
G1 X148.25 Y107.552 E.04268
G1 X147.439 Y122.2 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X148.394 Y123.366 I-3.054 J3.478 E.05023
G1 X155.048 Y130.02 E.31214
G1 X155.048 Y129.656 E.01207
G1 X146.916 Y137.788 E.38147
G2 X140.377 Y138.377 I-2.916 J4.213 E.23638
G1 X131.588 Y129.588 E.41231
G2 X131.588 Y122.412 I-3.577 J-3.588 E.26454
G1 X140.356 Y113.611 E.41209
G3 X139.785 Y107.081 I3.672 J-3.611 E.23569
G1 X131.657 Y98.953 E.38129
G1 X132.019 Y98.953 E.01201
G1 X125.208 Y105.764 E.3195
G2 X124.235 Y106.596 I2.398 J3.788 E.04263
G1 X123.783 Y112.401 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.432889
G1 F15000
G2 X124.965 Y113.572 I22.217 J-21.232 E.0529
G1 X125.37 Y113.88 E.01616
G1 X125.803 Y114.141 E.01609
G1 X126.291 Y114.358 E.01697
G1 X123.633 Y111.7 E.11945
G1 X123.483 Y111.255 E.01493
G1 X123.411 Y110.926 E.01069
G1 X127.074 Y114.589 E.16462
G1 X127.242 Y114.626 E.00547
G1 X127.714 Y114.677 E.01508
G1 X123.323 Y110.286 E.19734
G1 X123.321 Y109.733 E.01759
G1 X128.267 Y114.679 E.22231
G1 X128.764 Y114.624 E.01587
G1 X123.375 Y109.236 E.24216
G1 X123.475 Y108.784 E.01471
G1 X129.216 Y114.525 E.25802
G1 X129.632 Y114.39 E.0139
G1 X123.61 Y108.368 E.27061
G1 X123.776 Y107.982 E.01334
G1 X130.018 Y114.224 E.28051
G1 X130.378 Y114.032 E.01295
G1 X123.968 Y107.622 E.28807
G1 X124.181 Y107.284 E.0127
G1 X130.716 Y113.819 E.29365
G1 X131.023 Y113.574 E.01247
G1 X124.426 Y106.977 E.29646
G1 X124.689 Y106.689 E.01241
G1 X131.311 Y113.311 E.2976
G1 X131.572 Y113.035 E.01208
G1 X124.973 Y106.421 E.29691
G1 X125.287 Y106.184 E.01251
G1 X131.817 Y112.714 E.29345
G1 X132.032 Y112.378 E.01269
G1 X125.619 Y105.964 E.28822
G1 X125.979 Y105.773 E.01296
G1 X132.228 Y112.022 E.28081
G1 X132.389 Y111.631 E.01342
G1 X126.368 Y105.61 E.27058
G1 X126.784 Y105.475 E.0139
G1 X132.521 Y111.212 E.25785
G1 X132.578 Y111.007 E.00677
G1 X132.619 Y110.759 E.00801
G1 X127.236 Y105.375 E.24192
G1 X127.733 Y105.321 E.01588
G1 X132.674 Y110.262 E.22205
G1 X132.688 Y110 E.00832
G1 X132.677 Y109.714 E.0091
G1 X128.285 Y105.322 E.19739
G1 X128.923 Y105.408 E.02045
G1 X132.589 Y109.074 E.16476
G1 X132.517 Y108.746 E.01067
G1 X132.367 Y108.3 E.01495
G1 X129.708 Y105.642 E.11947
G1 X129.969 Y105.746 E.00891
G1 X130.417 Y105.983 E.01611
G1 X130.631 Y106.121 E.0081
G1 X131.034 Y106.427 E.01608
G3 X132.215 Y107.597 I-22.71 J24.094 E.05284
G1 X131.765 Y106.596 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X130.775 Y105.747 I-3.558 J3.145 E.04342
G1 X123.98 Y98.952 E.31877
G1 X124.344 Y98.952 E.0121
G1 X116.145 Y107.151 E.38465
G3 X115.552 Y113.552 I-4.162 J2.843 E.23124
G1 X124.409 Y122.409 E.41549
G1 X124.314 Y122.505 E.00448
G2 X124.412 Y129.588 I3.685 J3.492 E.2601
G1 X115.552 Y138.448 E.4156
G3 X116.145 Y144.849 I-3.57 J3.559 E.23125
G1 X124.346 Y153.05 E.38471
G1 X123.978 Y153.05 E.01219
G1 X130.842 Y146.211 E.3214
G2 X131.767 Y145.406 I-3.638 J-5.115 E.04075
G1 X144.563 Y152.337 F30000
G1 F15476.087
G2 X146.085 Y151.761 I-5.212 J-16.052 E.054
G1 X102.239 Y107.915 E2.05689
G3 X105.362 Y103.362 I13.805 J6.122 E.18418
G1 X108.466 Y106.421 E.14454
G3 X110.372 Y105.248 I3.601 J3.716 E.07485
G1 X116.67 Y98.95 E.29542
G1 X116.302 Y98.95 E.01219
G1 X124.103 Y106.751 E.36596
G2 X123.752 Y107.22 I2.977 J2.599 E.01947
G1 X108.783 Y122.135 E.70094
G1 X100.95 Y114.302 E.36747
G1 X100.95 Y114.67 E.01219
G1 X107.246 Y108.375 E.29532
G1 X107.2 Y108.498 E.00435
G2 X109.153 Y114.143 I4.828 J1.491 E.21202
G1 X100.95 Y122.346 E.38479
G1 X100.95 Y121.978 E.01219
G1 X107.937 Y128.966 E.32778
G2 X108.633 Y129.728 I3.682 J-2.662 E.0343
G1 X107.818 Y128.371 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.428913
G1 F15000
G1 X108.797 Y129.349 E.04353
G1 X109.123 Y129.637 E.01367
G1 X109.326 Y129.789 E.008
G1 X109.755 Y130.058 E.01592
G1 X110.306 Y130.313 E.01909
G1 X107.69 Y127.697 E.11636
G1 X107.57 Y127.372 E.01088
G1 X107.455 Y126.916 E.01479
G1 X111.08 Y130.541 E.16125
G1 X111.713 Y130.627 E.02007
G1 X107.373 Y126.288 E.19304
G1 X107.374 Y125.743 E.01712
G1 X112.258 Y130.627 E.21725
G1 X112.751 Y130.574 E.01558
G1 X107.429 Y125.252 E.23674
G1 X107.526 Y124.803 E.01443
G1 X113.202 Y130.479 E.25247
G1 X113.611 Y130.342 E.01357
G1 X107.653 Y124.384 E.26502
G1 X107.82 Y124.005 E.01302
G1 X113.996 Y130.181 E.27472
G1 X114.355 Y129.995 E.01271
G1 X108.007 Y123.647 E.28238
G1 X108.221 Y123.315 E.01242
G1 X114.683 Y129.777 E.28743
G1 X114.989 Y129.537 E.01223
G1 X108.463 Y123.01 E.29032
G1 X108.725 Y122.726 E.01215
G1 X115.277 Y129.279 E.29148
G1 X115.535 Y128.991 E.01216
G1 X109.005 Y122.461 E.29047
G1 X109.316 Y122.226 E.01226
G1 X115.774 Y128.684 E.28727
G1 X115.991 Y128.356 E.01239
G1 X109.646 Y122.01 E.28226
G1 X109.999 Y121.817 E.01265
G1 X116.182 Y128 E.27503
G1 X116.342 Y127.614 E.01314
G1 X110.384 Y121.656 E.26503
G1 X110.799 Y121.526 E.0137
G1 X116.473 Y127.2 E.25237
G1 X116.528 Y127.005 E.00636
G1 X116.57 Y126.75 E.00812
G1 X111.249 Y121.43 E.23666
G1 X111.737 Y121.372 E.01545
G1 X116.63 Y126.265 E.21764
G1 X116.627 Y125.716 E.01724
G1 X112.286 Y121.375 E.1931
G1 X112.694 Y121.414 E.01287
G1 X112.918 Y121.461 E.0072
G1 X116.545 Y125.088 E.16134
G1 X116.391 Y124.507 E.01891
G1 X116.311 Y124.308 E.00675
G1 X113.681 Y121.678 E.11698
G1 X114.134 Y121.882 E.01563
G1 X114.57 Y122.139 E.0159
G1 X114.975 Y122.442 E.01592
G1 X116.174 Y123.625 E.05297
G1 X108.63 Y122.269 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X107.937 Y123.035 I5.237 J5.433 E.0343
G1 X100.95 Y130.022 E.32775
G1 X100.95 Y129.654 E.01219
G1 X109.156 Y137.86 E.38493
G2 X107.245 Y143.625 I2.818 J4.133 E.21651
G1 X100.95 Y137.33 E.29529
G1 X100.95 Y137.698 E.01219
G1 X108.786 Y129.863 E.36756
G1 X108.868 Y129.936 E.00366
G2 X109.028 Y130.056 I1.552 J-1.895 E.00665
G1 X123.764 Y144.792 E.69127
G2 X124.103 Y145.249 I2.36 J-1.4 E.01892
G1 X116.302 Y153.05 E.36597
G1 X116.67 Y153.05 E.01219
G1 X110.371 Y146.751 E.29548
G3 X108.444 Y145.556 I1.534 J-4.625 E.07592
G1 X105.358 Y148.642 E.14476
G2 X109.915 Y151.761 I11.894 J-12.487 E.18397
G1 X153.757 Y107.919 E2.05671
G3 X154.33 Y109.442 I-9.069 J4.278 E.05403
G1 X148.241 Y123.543 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421825
G1 F15000
G1 X147.273 Y122.575 E.04227
G1 X146.896 Y122.251 E.01533
G1 X146.478 Y121.962 E.01571
G1 X146.031 Y121.72 E.01567
G1 X145.777 Y121.616 E.00849
G1 X148.385 Y124.223 E.11387
G1 X148.494 Y124.5 E.00918
G1 X148.632 Y125.006 E.01619
G1 X144.995 Y121.37 E.15879
G1 X144.369 Y121.279 E.01953
G1 X148.718 Y125.628 E.1899
G1 X148.731 Y126.177 E.01694
G1 X143.82 Y121.266 E.21442
G1 X143.33 Y121.311 E.01522
G1 X148.686 Y126.668 E.2339
G1 X148.599 Y127.116 E.0141
G1 X142.882 Y121.4 E.24961
G1 X142.469 Y121.523 E.0133
G1 X148.481 Y127.534 E.26249
G1 X148.329 Y127.919 E.01276
G1 X142.08 Y121.669 E.27288
G1 X141.724 Y121.85 E.01231
G1 X148.149 Y128.274 E.28053
G1 X147.947 Y128.608 E.01205
G1 X141.392 Y122.053 E.28624
G1 X141.08 Y122.277 E.01186
G1 X147.724 Y128.921 E.29014
G1 X147.48 Y129.213 E.01174
G1 X140.788 Y122.521 E.2922
G1 X140.521 Y122.79 E.0117
G1 X147.209 Y129.478 E.29201
G1 X146.919 Y129.723 E.01174
G1 X140.277 Y123.081 E.29003
G1 X140.052 Y123.392 E.01185
G1 X146.611 Y129.951 E.28641
G1 X146.273 Y130.149 E.01209
G1 X139.847 Y123.723 E.28058
G1 X139.671 Y124.083 E.01236
G1 X145.916 Y130.328 E.27268
G1 X145.533 Y130.481 E.01272
G1 X139.522 Y124.47 E.26247
G1 X139.402 Y124.886 E.01336
G1 X145.118 Y130.602 E.24958
G1 X144.667 Y130.686 E.01417
G1 X139.316 Y125.335 E.23365
G1 X139.267 Y125.822 E.0151
G1 X144.174 Y130.729 E.21426
G1 X143.631 Y130.722 E.01677
G1 X139.277 Y126.369 E.19009
G1 X139.374 Y127.001 E.01977
G1 X143.002 Y130.629 E.15839
G1 X142.561 Y130.514 E.01407
G1 X142.223 Y130.386 E.01116
G1 X139.615 Y127.778 E.11386
G1 X139.748 Y128.089 E.01043
G1 X139.995 Y128.532 E.01567
G1 X140.289 Y128.946 E.01568
G1 X140.618 Y129.317 E.01532
G1 X141.557 Y130.256 E.04097
G1 X141.29 Y130.349 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X140.066 Y129.285 I2.473 J-4.081 E.05402
G1 X131.252 Y138.1 E.4135
G2 X124.748 Y138.1 I-3.252 J3.922 E.234
G1 X115.861 Y129.213 E.41688
G2 X115.864 Y122.784 I-3.871 J-3.216 E.23133
G1 X124.748 Y113.9 E.41678
G2 X131.249 Y113.897 I3.248 J-3.912 E.23395
G1 X140.067 Y122.715 E.41369
G2 X139.237 Y124.107 I3.614 J3.097 E.05402
G1 X132.215 Y123.597 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.43289
G1 F15000
G1 X131.164 Y122.546 E.04724
G1 X130.837 Y122.268 E.01364
G1 X130.619 Y122.112 E.00852
G1 X130.196 Y121.859 E.01566
G1 X129.7 Y121.633 E.01732
G1 X132.358 Y124.292 E.11946
G1 X132.442 Y124.504 E.00726
G1 X132.594 Y125.079 E.01892
G1 X128.926 Y121.411 E.16486
G1 X128.758 Y121.374 E.00547
G1 X128.286 Y121.323 E.01508
G1 X132.677 Y125.714 E.19734
G1 X132.688 Y126 E.0091
G1 X132.674 Y126.262 E.00832
G1 X127.733 Y121.321 E.22203
G1 X127.241 Y121.381 E.01573
G1 X132.619 Y126.759 E.24167
G1 X132.578 Y127.007 E.00801
G1 X132.521 Y127.212 E.00677
G1 X126.788 Y121.479 E.25767
G1 X126.369 Y121.611 E.01396
G1 X132.389 Y127.631 E.27054
G1 X132.228 Y128.022 E.01342
G1 X125.979 Y121.773 E.28081
G1 X125.619 Y121.964 E.01296
G1 X132.032 Y128.378 E.28822
G1 X131.817 Y128.714 E.01269
G1 X125.287 Y122.184 E.29345
G1 X125.163 Y122.268 E.00478
G1 X124.977 Y122.426 E.00773
G1 X131.579 Y129.027 E.29666
G1 X131.311 Y129.311 E.0124
G1 X124.687 Y122.687 E.29771
G1 X124.426 Y122.977 E.01241
G1 X131.023 Y129.574 E.29646
G1 X130.713 Y129.816 E.01249
G1 X124.184 Y123.287 E.29341
G1 X123.964 Y123.619 E.01265
G1 X130.381 Y130.036 E.28837
G1 X130.021 Y130.227 E.01296
G1 X123.773 Y123.979 E.28076
G1 X123.611 Y124.369 E.0134
G1 X129.631 Y130.389 E.27054
G1 X129.212 Y130.522 E.01396
G1 X123.479 Y124.788 E.25768
G1 X123.422 Y124.993 E.00676
G1 X123.381 Y125.242 E.00801
G1 X128.764 Y130.625 E.24193
G1 X128.267 Y130.679 E.01589
G1 X123.326 Y125.738 E.22205
G1 X123.312 Y126 E.00832
G1 X123.323 Y126.286 E.0091
G1 X127.708 Y130.672 E.1971
G1 X127.493 Y130.66 E.00687
G1 X127.077 Y130.592 E.01338
G1 X123.411 Y126.926 E.16476
G1 X123.483 Y127.255 E.0107
G1 X123.633 Y127.7 E.01493
G1 X126.291 Y130.358 E.11946
G1 X126.031 Y130.254 E.0089
G1 X125.584 Y130.017 E.0161
G1 X125.164 Y129.732 E.01612
G1 X124.965 Y129.572 E.00812
G3 X123.785 Y128.403 I20.993 J-22.359 E.05279
G1 X116.174 Y107.625 F30000
; LINE_WIDTH: 0.428704
G1 F15000
G1 X114.965 Y106.434 E.05336
G1 X114.57 Y106.139 E.01551
G1 X114.134 Y105.882 E.01589
G1 X113.682 Y105.678 E.0156
G1 X116.318 Y108.315 E.11722
G1 X116.466 Y108.748 E.01438
G1 X116.54 Y109.082 E.01076
G1 X112.919 Y105.461 E.16099
G1 X112.694 Y105.414 E.00723
G1 X112.288 Y105.376 E.01283
G1 X116.622 Y109.71 E.1927
G1 X116.638 Y109.999 E.00912
G1 X116.624 Y110.257 E.00812
G1 X111.739 Y105.372 E.21718
G1 X111.248 Y105.427 E.01553
G1 X116.57 Y110.749 E.23661
G1 X116.478 Y111.203 E.01455
G1 X110.8 Y105.525 E.25241
G1 X110.388 Y105.658 E.01362
G1 X116.343 Y111.613 E.26473
G1 X116.183 Y111.999 E.01312
G1 X110 Y105.816 E.27486
G1 X109.648 Y106.009 E.01264
G1 X115.992 Y112.354 E.28208
G1 X115.776 Y112.683 E.01238
G1 X109.318 Y106.225 E.28709
G1 X109.01 Y106.462 E.01223
G1 X115.541 Y112.994 E.29036
G1 X115.276 Y113.274 E.01213
G1 X108.722 Y106.72 E.29138
G1 X108.464 Y107.008 E.01215
G1 X114.991 Y113.535 E.29018
G1 X114.686 Y113.775 E.01221
G1 X108.223 Y107.312 E.28732
G1 X108.009 Y107.644 E.0124
G1 X114.355 Y113.995 E.28226
G1 X113.999 Y114.18 E.0126
G1 X107.822 Y108.002 E.27463
G1 X107.66 Y108.386 E.01309
G1 X113.615 Y114.341 E.26474
G1 X113.201 Y114.472 E.01365
G1 X107.523 Y108.795 E.25241
G1 X107.429 Y109.246 E.0145
G1 X112.752 Y114.57 E.23666
G1 X112.443 Y114.616 E.00983
G1 X112.261 Y114.624 E.00573
G1 X107.375 Y109.738 E.21723
G1 X107.375 Y110.284 E.01717
G1 X111.72 Y114.628 E.19315
G1 X111.088 Y114.542 E.02005
G1 X107.453 Y110.907 E.16159
G1 X107.57 Y111.372 E.01507
G1 X107.686 Y111.686 E.01051
G1 X110.317 Y114.316 E.11695
G1 X109.755 Y114.058 E.01943
G1 X109.326 Y113.789 E.01593
G1 X108.934 Y113.479 E.01571
G1 X107.826 Y112.371 E.04925
G1 X111.437 Y99.663 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X109.915 Y100.239 I5.213 J16.052 E.054
G1 X153.76 Y144.084 E2.05687
G3 X150.642 Y148.642 I-15.585 J-7.32 E.18398
G1 X147.623 Y145.623 E.1416
G3 X145.474 Y146.906 I-3.518 J-3.452 E.08396
G1 X139.33 Y153.05 E.2882
G1 X139.698 Y153.05 E.01219
G1 X131.901 Y145.253 E.36577
G2 X132.236 Y144.792 I-2.752 J-2.356 E.01893
G1 X146.671 Y130.379 E.67664
G2 X147.287 Y129.935 I-3.165 J-5.029 E.0252
G1 X155.05 Y137.698 E.36418
G1 X155.05 Y137.33 E.01218
G1 X148.909 Y143.471 E.28809
G2 X149.126 Y141.865 I-4.654 J-1.449 E.05403
G1 X101.663 Y142.563 F30000
G1 F15476.087
G2 X102.239 Y144.085 I16.054 J-5.213 E.054
G1 X146.083 Y100.241 E2.05681
G3 X150.634 Y103.366 I-6.236 J13.954 E.18413
G1 X147.625 Y106.375 E.14116
G3 X148.909 Y108.529 I-3.497 J3.545 E.08407
G1 X155.044 Y114.664 E.28784
G1 X155.044 Y114.308 E.01183
G1 X147.284 Y122.068 E.36403
G2 X146.622 Y121.594 I-3.889 J4.74 E.02703
G1 X132.212 Y107.161 E.67653
G2 X131.897 Y106.751 I-4.113 J2.843 E.01716
G1 X139.694 Y98.955 E.36577
G1 X139.334 Y98.954 E.01192
G1 X145.438 Y105.076 E.28675
G2 X143.857 Y104.874 I-1.504 J5.498 E.05302
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X144.88 Y104.946 E-.38951
M73 P71 R6
G1 X145.438 Y105.076 E-.21765
G1 X145.154 Y104.791 E-.15284
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
G17
G3 Z5.8 I-.93 J-.785 P1  F30000
G1 X106.732 Y150.289 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X106.357 Y149.997 E.01577
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.326 Y98.607 E.80678
G3 X155.398 Y114.004 I-.327 J15.396 E.79161
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.02 Y150.502 I.01 J-15.412 E.31823
G1 X106.78 Y150.325 E.0099
G1 X106.494 Y150.601 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.01493
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.335 Y98.215 E.74771
G3 X155.79 Y114.001 I-.337 J15.788 E.75181
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.543 Y150.637 E.00949
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.303 E-.20748
G1 X105.456 Y149.753 E-.32492
G1 X105.021 Y149.341 E-.2276
; WIPE_END
G1 E-.04 F1800
G1 X104.92 Y148.156 Z6 F30000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G2 X108.248 Y150.882 I11.312 J-10.417 E.11959
G2 X110.108 Y151.831 I11.257 J-19.778 E.05786
G1 X114.837 Y152.985 F30000
G1 F15000
G2 X116.661 Y153.035 I1.498 J-21.1 E.05056
G1 X113.921 Y145.597 F30000
; LINE_WIDTH: 0.433164
G1 F15000
G1 X114.914 Y144.605 E.04465
G1 X115.099 Y144.383 E.00918
G1 X115.446 Y143.846 E.02034
G1 X115.698 Y143.269 E.02002
G1 X113.27 Y145.696 E.10915
G1 X113.003 Y145.779 E.00891
G1 X112.544 Y145.871 E.01488
G1 X115.87 Y142.545 E.14957
G1 X115.908 Y141.954 E.01881
G1 X111.954 Y145.909 E.17785
G1 X111.443 Y145.868 E.0163
G1 X115.868 Y141.443 E.19903
G1 X115.774 Y140.985 E.01487
G1 X110.985 Y145.774 E.21539
G1 X110.57 Y145.637 E.0139
G1 X115.638 Y140.569 E.2279
G1 X115.465 Y140.191 E.01324
G1 X110.191 Y145.464 E.23716
G1 X109.844 Y145.259 E.01282
G1 X115.259 Y139.844 E.24354
G1 X115.025 Y139.526 E.01255
G1 X109.526 Y145.025 E.24732
G1 X109.236 Y144.764 E.01243
G1 X114.763 Y139.236 E.24858
G1 X114.474 Y138.974 E.01242
G1 X108.973 Y144.474 E.24736
G1 X108.74 Y144.156 E.01256
G1 X114.156 Y138.739 E.24359
G1 X113.809 Y138.535 E.01282
G1 X108.535 Y143.808 E.23717
G1 X108.363 Y143.429 E.01325
G1 X113.43 Y138.362 E.22789
G1 X113.015 Y138.225 E.01389
G1 X108.226 Y143.014 E.21538
G1 X108.131 Y142.557 E.01484
G1 X112.557 Y138.131 E.19905
G1 X112.044 Y138.092 E.01636
G1 X108.092 Y142.044 E.17773
G1 X108.129 Y141.455 E.01876
G1 X111.454 Y138.13 E.14954
G1 X111.1 Y138.196 E.01145
G1 X110.728 Y138.304 E.01231
G1 X108.305 Y140.728 E.10899
G1 X108.499 Y140.261 E.01608
G1 X108.606 Y140.06 E.00721
G1 X108.837 Y139.702 E.01357
G1 X109.088 Y139.393 E.01266
G1 X110.076 Y138.404 E.04446
G1 X108.503 Y139.495 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X108.983 Y138.934 E.02451
G1 X109.677 Y138.381 E.02943
G1 X100.95 Y129.654 E.40938
G1 X100.95 Y130.022 E.01219
G1 X132.019 Y98.953 E1.45749
G1 X131.657 Y98.953 E.012
G1 X140.308 Y107.605 E.40585
G1 X140.863 Y106.913 E.02942
G1 X141.424 Y106.431 E.02452
G1 X140.33 Y108.003 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424517
G1 F15000
G3 X141.301 Y107.035 I24.514 J23.619 E.04264
G1 X141.635 Y106.762 E.0134
G1 X141.995 Y106.528 E.01337
G1 X142.379 Y106.333 E.01338
G1 X142.645 Y106.228 E.00889
G1 X140.226 Y108.646 E.10635
G1 X140.107 Y109.04 E.0128
G1 X140.042 Y109.371 E.01048
G1 X143.371 Y106.041 E.14642
G1 X143.96 Y105.992 E.01836
G1 X139.992 Y109.96 E.17449
G1 X140.02 Y110.472 E.01594
G1 X144.473 Y106.019 E.19583
G1 X144.931 Y106.101 E.01446
G1 X140.101 Y110.931 E.2124
G1 X140.224 Y111.347 E.0135
G1 X145.347 Y106.224 E.22527
G1 X145.728 Y106.382 E.01284
G1 X140.383 Y111.728 E.23506
G1 X140.572 Y112.078 E.01238
G1 X146.078 Y106.572 E.24213
G1 X146.4 Y106.79 E.01208
G1 X140.79 Y112.4 E.24671
G1 X141.034 Y112.696 E.01192
G1 X146.696 Y107.034 E.24899
G1 X146.966 Y107.303 E.01187
G1 X141.303 Y112.967 E.24903
G1 X141.599 Y113.21 E.01192
G1 X147.21 Y107.598 E.24676
G1 X147.33 Y107.767 E.00641
G1 X147.428 Y107.921 E.00568
G1 X141.922 Y113.427 E.24213
G1 X142.272 Y113.616 E.01238
G1 X147.617 Y108.272 E.23503
G1 X147.775 Y108.653 E.01284
G1 X142.653 Y113.775 E.22524
G1 X143.069 Y113.898 E.0135
G1 X147.899 Y109.069 E.21238
G1 X147.981 Y109.527 E.01446
G1 X143.527 Y113.98 E.19584
G1 X144.038 Y114.009 E.01591
G1 X148.008 Y110.038 E.1746
G1 X147.96 Y110.627 E.01836
G1 X144.628 Y113.959 E.14653
G1 X144.907 Y113.905 E.00885
G1 X145.353 Y113.774 E.01444
G1 X147.773 Y111.354 E.10642
G1 X147.55 Y111.864 E.0173
G1 X147.205 Y112.409 E.02006
G1 X146.938 Y112.728 E.01294
G1 X145.992 Y113.674 E.0416
G1 X147.111 Y106.889 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X150.634 Y103.366 E.16524
G2 X146.083 Y100.241 I-10.786 J10.828 E.18413
G1 X102.523 Y143.801 E2.04349
G3 X102.28 Y143.191 I5.51 J-2.551 E.0218
G1 X101.99 Y143.481 E.01362
G3 X101.795 Y142.955 I4.75 J-2.061 E.01861
G1 X102.152 Y143.838 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G2 X102.543 Y144.7 I11.921 J-4.887 E.02624
G1 X108.959 Y145.041 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X105.625 Y148.375 E.15639
G2 X110.199 Y151.477 I11.28 J-11.712 E.18423
G1 X153.757 Y107.919 E2.04337
G3 X154.33 Y109.442 I-9.068 J4.278 E.05403
G1 X140.33 Y124.003 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424517
G1 F15000
G3 X141.31 Y123.027 I21.682 J20.797 E.04303
G1 X141.634 Y122.763 E.013
G1 X141.995 Y122.528 E.01338
G1 X142.379 Y122.333 E.01338
G1 X142.645 Y122.228 E.0089
G1 X140.226 Y124.646 E.10635
G1 X140.107 Y125.04 E.0128
G1 X140.042 Y125.371 E.01047
G1 X143.371 Y122.041 E.14642
G1 X143.96 Y121.992 E.01836
G1 X139.992 Y125.96 E.17449
G1 X140.02 Y126.472 E.01594
G1 X144.473 Y122.019 E.19583
G1 X144.931 Y122.101 E.01446
G1 X140.101 Y126.931 E.2124
G1 X140.224 Y127.347 E.0135
G1 X145.347 Y122.224 E.22527
G1 X145.728 Y122.382 E.01284
G1 X140.383 Y127.728 E.23506
G1 X140.572 Y128.078 E.01238
G1 X146.078 Y122.572 E.24213
G1 X146.4 Y122.79 E.01208
G1 X140.79 Y128.4 E.24669
G1 X141.034 Y128.696 E.01192
G1 X146.696 Y123.034 E.24899
G1 X146.966 Y123.303 E.01187
G1 X141.303 Y128.966 E.24902
G1 X141.599 Y129.21 E.01192
G1 X147.21 Y123.598 E.24676
G1 X147.33 Y123.767 E.00641
G1 X147.428 Y123.921 E.00568
G1 X141.922 Y129.427 E.24213
G1 X142.272 Y129.616 E.01238
G1 X147.616 Y124.272 E.23502
G1 X147.775 Y124.653 E.01283
G1 X142.653 Y129.775 E.22524
G1 X143.069 Y129.898 E.0135
G1 X147.899 Y125.069 E.21238
G1 X147.981 Y125.527 E.01446
G1 X143.527 Y129.98 E.19584
G1 X144.038 Y130.009 E.01591
G1 X148.008 Y126.038 E.1746
G1 X147.96 Y126.627 E.01836
G1 X144.628 Y129.959 E.14653
G1 X144.907 Y129.905 E.00885
G1 X145.353 Y129.774 E.01443
G1 X147.773 Y127.354 E.10642
G1 X147.55 Y127.864 E.0173
G1 X147.205 Y128.409 E.02006
G1 X146.938 Y128.728 E.01294
G1 X145.992 Y129.674 E.0416
G1 X140.33 Y140.003 F30000
G1 F15000
G3 X141.301 Y139.035 I24.506 J23.611 E.04264
G1 X141.635 Y138.762 E.0134
G1 X141.995 Y138.528 E.01337
G1 X142.379 Y138.333 E.01339
G1 X142.645 Y138.228 E.00889
G1 X140.227 Y140.645 E.10631
G1 X140.107 Y141.04 E.01284
G1 X140.042 Y141.371 E.01048
G1 X143.371 Y138.041 E.14642
G1 X143.96 Y137.992 E.01836
G1 X139.992 Y141.96 E.17449
G1 X140.02 Y142.472 E.01594
G1 X144.473 Y138.019 E.19583
G1 X144.931 Y138.101 E.01446
G1 X140.101 Y142.931 E.2124
G1 X140.224 Y143.347 E.0135
G1 X145.347 Y138.224 E.22527
G1 X145.728 Y138.382 E.01284
G1 X140.383 Y143.728 E.23506
G1 X140.572 Y144.078 E.01238
G1 X146.078 Y138.572 E.24211
G1 X146.4 Y138.79 E.01209
G1 X140.79 Y144.4 E.24671
G1 X141.034 Y144.696 E.01192
G1 X146.696 Y139.034 E.24899
G1 X146.966 Y139.303 E.01187
G1 X141.303 Y144.967 E.24903
G1 X141.599 Y145.21 E.01192
G1 X147.21 Y139.598 E.24676
G1 X147.33 Y139.767 E.00641
G1 X147.428 Y139.921 E.00568
G1 X141.922 Y145.427 E.24213
G1 X142.272 Y145.616 E.01238
G1 X147.617 Y140.272 E.23503
G1 X147.775 Y140.653 E.01284
G1 X142.653 Y145.775 E.22524
G1 X143.069 Y145.898 E.0135
G1 X147.899 Y141.069 E.21237
G1 X147.981 Y141.527 E.01446
G1 X143.527 Y145.98 E.19584
G1 X144.038 Y146.009 E.01591
G1 X148.008 Y142.038 E.1746
G1 X147.96 Y142.627 E.01836
G1 X144.628 Y145.959 E.14653
G1 X144.894 Y145.908 E.00844
G1 X145.353 Y145.774 E.01485
G1 X147.773 Y143.354 E.10642
G1 X147.55 Y143.864 E.0173
G1 X147.205 Y144.409 E.02006
G1 X146.938 Y144.728 E.01294
G1 X145.992 Y145.674 E.0416
G1 X147.111 Y145.111 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X150.642 Y148.642 E.16561
G2 X153.76 Y144.084 I-12.471 J-11.88 E.18398
G1 X109.915 Y100.239 E2.05687
G2 X105.362 Y103.362 I6.362 J14.155 E.18412
G1 X108.959 Y106.959 E.16872
G1 X110.076 Y106.404 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.433164
G1 F15000
G1 X109.088 Y107.393 E.04446
G1 X108.837 Y107.702 E.01265
G1 X108.505 Y108.249 E.02036
G1 X108.305 Y108.728 E.01649
G1 X110.728 Y106.304 E.10899
G1 X111.1 Y106.196 E.01231
G1 X111.454 Y106.13 E.01145
G1 X108.129 Y109.455 E.14954
G1 X108.092 Y110.044 E.01876
G1 X112.044 Y106.093 E.17771
G1 X112.557 Y106.131 E.01637
G1 X108.131 Y110.557 E.19905
G1 X108.226 Y111.014 E.01485
G1 X113.015 Y106.225 E.21539
G1 X113.43 Y106.362 E.01389
G1 X108.363 Y111.429 E.22789
G1 X108.535 Y111.808 E.01325
G1 X113.809 Y106.535 E.23717
G1 X114.156 Y106.739 E.01282
G1 X108.74 Y112.156 E.24359
G1 X108.973 Y112.474 E.01256
G1 X114.474 Y106.974 E.24736
G1 X114.763 Y107.236 E.01242
G1 X109.236 Y112.764 E.24858
G1 X109.526 Y113.025 E.01243
G1 X115.025 Y107.526 E.24732
G1 X115.259 Y107.844 E.01255
G1 X109.844 Y113.259 E.24353
G1 X110.191 Y113.464 E.01281
G1 X115.465 Y108.191 E.23716
G1 X115.638 Y108.569 E.01324
G1 X110.57 Y113.637 E.2279
G1 X110.985 Y113.774 E.0139
G1 X115.774 Y108.985 E.21539
G1 X115.868 Y109.443 E.01487
G1 X111.443 Y113.868 E.19903
G1 X111.954 Y113.909 E.0163
G1 X115.908 Y109.954 E.17785
G1 X115.904 Y110.214 E.00825
G1 X115.87 Y110.545 E.01058
G1 X112.544 Y113.871 E.14957
G1 X113.003 Y113.779 E.01489
G1 X113.27 Y113.696 E.0089
G1 X115.698 Y111.269 E.10915
G1 X115.446 Y111.846 E.02002
G1 X115.099 Y112.383 E.02034
G1 X114.914 Y112.605 E.00918
G1 X113.921 Y113.597 E.04465
G1 X110.076 Y122.404 F30000
G1 F15000
G1 X109.088 Y123.393 E.04446
G1 X108.837 Y123.702 E.01265
G1 X108.505 Y124.249 E.02036
G1 X108.305 Y124.728 E.0165
G1 X110.728 Y122.304 E.10899
G1 X111.1 Y122.196 E.01231
G1 X111.454 Y122.13 E.01145
G1 X108.129 Y125.455 E.14954
G1 X108.092 Y126.044 E.01876
G1 X112.044 Y122.092 E.17772
G1 X112.557 Y122.131 E.01636
G1 X108.131 Y126.557 E.19904
G1 X108.226 Y127.014 E.01485
G1 X113.015 Y122.225 E.21539
G1 X113.43 Y122.362 E.01389
G1 X108.363 Y127.429 E.22789
G1 X108.536 Y127.808 E.01324
G1 X113.809 Y122.535 E.23716
G1 X114.156 Y122.739 E.01282
G1 X108.74 Y128.156 E.24359
G1 X108.973 Y128.474 E.01256
G1 X114.474 Y122.974 E.24736
G1 X114.763 Y123.237 E.01242
G1 X109.236 Y128.764 E.24857
G1 X109.526 Y129.025 E.01243
G1 X115.025 Y123.526 E.24732
G1 X115.26 Y123.844 E.01255
G1 X109.844 Y129.259 E.24356
G1 X110.191 Y129.464 E.01282
G1 X115.465 Y124.191 E.23715
G1 X115.638 Y124.569 E.01324
G1 X110.57 Y129.637 E.2279
G1 X110.985 Y129.774 E.0139
G1 X115.774 Y124.985 E.21539
G1 X115.868 Y125.443 E.01487
G1 X111.443 Y129.868 E.19903
G1 X111.954 Y129.909 E.0163
G1 X115.908 Y125.954 E.17785
G1 X115.904 Y126.214 E.00825
G1 X115.87 Y126.545 E.01058
G1 X112.544 Y129.871 E.14957
G1 X113.003 Y129.779 E.01488
G1 X113.27 Y129.696 E.0089
G1 X115.698 Y127.269 E.10915
G1 X115.446 Y127.846 E.02002
G1 X115.099 Y128.383 E.02034
G1 X114.914 Y128.605 E.00918
G1 X113.921 Y129.597 E.04465
G1 X126.261 Y129.988 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X125.553 Y129.599 E.0268
G1 X124.924 Y129.076 E.02714
G1 X115.041 Y138.959 E.46365
G1 X115.537 Y139.552 E.02564
G1 X115.895 Y140.174 E.02381
G1 X116.141 Y140.834 E.02336
G1 X116.275 Y141.523 E.02327
G1 X116.295 Y142.227 E.02336
G1 X116.198 Y142.938 E.02382
G1 X115.989 Y143.611 E.02336
G1 X115.619 Y144.323 E.02662
G1 X124.346 Y153.05 E.4094
G1 X123.978 Y153.05 E.01219
G1 X155.046 Y121.982 E1.45745
G1 X155.046 Y122.342 E.01195
G1 X146.395 Y113.691 E.40583
G1 X145.676 Y114.07 E.02696
G1 X145.001 Y114.286 E.0235
G1 X144.29 Y114.392 E.02386
G1 X143.581 Y114.382 E.0235
G1 X142.884 Y114.258 E.0235
G1 X142.215 Y114.024 E.0235
G1 X141.408 Y113.558 E.03091
G1 X140.888 Y113.112 E.02273
G1 X131.076 Y122.924 E.46031
G1 X131.605 Y123.563 E.0275
G1 X132.04 Y124.384 E.03085
G1 X132.293 Y125.29 E.03119
M73 P72 R6
G1 X132.352 Y125.994 E.02345
G1 X132.251 Y126.93 E.03121
G1 X132.04 Y127.616 E.0238
G1 X131.605 Y128.437 E.03085
G1 X131.076 Y129.076 E.0275
G1 X140.888 Y138.888 E.4603
G1 X141.593 Y138.315 E.03015
G1 X142.216 Y137.976 E.0235
G1 X142.884 Y137.742 E.0235
G1 X143.581 Y137.618 E.0235
G1 X144.301 Y137.609 E.02386
G1 X145.001 Y137.714 E.0235
G1 X145.676 Y137.93 E.0235
G1 X146.395 Y138.309 E.02696
G1 X155.048 Y129.656 E.40591
G1 X155.048 Y130.02 E.01207
G1 X123.98 Y98.952 E1.45747
G1 X124.344 Y98.952 E.01209
G1 X115.619 Y107.677 E.40934
G1 X115.989 Y108.389 E.02662
G1 X116.195 Y109.05 E.02297
G1 X116.295 Y109.76 E.02376
G1 X116.277 Y110.464 E.02336
G1 X116.141 Y111.166 E.02373
G1 X115.895 Y111.826 E.02336
G1 X115.551 Y112.427 E.02295
G1 X115.041 Y113.041 E.0265
G1 X124.924 Y122.924 E.46365
G1 X125.553 Y122.401 E.02714
G1 X126.261 Y122.012 E.0268
G1 X126.06 Y122.355 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.437831
G1 F15000
G1 X125.016 Y123.399 E.0475
G1 X124.848 Y123.604 E.00852
G1 X124.502 Y124.145 E.02068
G1 X124.254 Y124.72 E.02015
G1 X126.72 Y122.254 E.11224
G1 X127.149 Y122.133 E.01433
G1 X127.452 Y122.08 E.00991
G1 X124.08 Y125.452 E.15345
G1 X124.046 Y125.785 E.01078
G1 X124.042 Y126.049 E.00848
G1 X128.049 Y122.042 E.18235
G1 X128.566 Y122.083 E.01671
G1 X124.083 Y126.566 E.20406
G1 X124.178 Y127.03 E.01523
G1 X129.03 Y122.178 E.22083
G1 X129.45 Y122.316 E.01423
G1 X124.316 Y127.45 E.23364
G1 X124.491 Y127.833 E.01356
G1 X129.833 Y122.491 E.24312
G1 X130.184 Y122.699 E.01312
G1 X124.699 Y128.184 E.24964
G1 X124.936 Y128.506 E.01285
G1 X130.506 Y122.936 E.25348
G1 X130.798 Y123.201 E.01272
G1 X125.201 Y128.799 E.25473
G1 X125.494 Y129.064 E.01272
G1 X131.064 Y123.494 E.25348
G1 X131.301 Y123.816 E.01285
G1 X125.816 Y129.301 E.24965
G1 X126.167 Y129.509 E.01312
G1 X131.509 Y124.167 E.24312
G1 X131.684 Y124.55 E.01356
G1 X126.55 Y129.684 E.23365
G1 X126.97 Y129.822 E.01423
G1 X131.822 Y124.97 E.22083
G1 X131.917 Y125.433 E.01523
G1 X127.433 Y129.917 E.20406
G1 X127.951 Y129.958 E.01671
G1 X131.958 Y125.951 E.18236
G1 X131.954 Y126.215 E.00848
G1 X131.92 Y126.548 E.01078
G1 X128.548 Y129.92 E.15346
G1 X128.863 Y129.864 E.01031
G1 X129.28 Y129.746 E.01392
G1 X131.746 Y127.28 E.11226
G1 X131.498 Y127.855 E.02016
G1 X131.152 Y128.396 E.02068
G1 X130.985 Y128.6 E.00846
G1 X129.94 Y129.645 E.04758
G1 X126.06 Y138.355 F30000
G1 F15000
G1 X125.016 Y139.399 E.04751
G1 X124.848 Y139.604 E.00852
G1 X124.502 Y140.145 E.02068
G1 X124.255 Y140.719 E.02011
G1 X126.72 Y138.254 E.1122
G1 X127.149 Y138.133 E.01433
G1 X127.452 Y138.08 E.00991
G1 X124.08 Y141.452 E.15345
G1 X124.046 Y141.785 E.01078
G1 X124.042 Y142.049 E.00847
G1 X128.048 Y138.042 E.18233
G1 X128.566 Y138.083 E.01673
G1 X124.083 Y142.566 E.20406
G1 X124.178 Y143.029 E.01521
G1 X129.03 Y138.178 E.22081
G1 X129.45 Y138.316 E.01423
G1 X124.316 Y143.45 E.23364
G1 X124.491 Y143.833 E.01356
G1 X129.833 Y138.491 E.24312
G1 X130.184 Y138.699 E.01312
G1 X124.699 Y144.184 E.24965
G1 X124.936 Y144.506 E.01285
G1 X130.506 Y138.936 E.25348
G1 X130.799 Y139.201 E.01272
G1 X125.201 Y144.799 E.25474
G1 X125.494 Y145.064 E.01272
G1 X131.064 Y139.494 E.25348
G1 X131.301 Y139.816 E.01285
G1 X125.816 Y145.301 E.24965
G1 X126.167 Y145.509 E.01312
G1 X131.509 Y140.167 E.24312
G1 X131.684 Y140.55 E.01356
G1 X126.55 Y145.684 E.23365
G1 X126.97 Y145.822 E.01423
G1 X131.822 Y140.97 E.22083
G1 X131.917 Y141.434 E.01524
G1 X127.433 Y145.917 E.20405
G1 X127.951 Y145.958 E.01671
G1 X131.958 Y141.951 E.18236
G1 X131.954 Y142.215 E.00848
G1 X131.92 Y142.548 E.01078
G1 X128.548 Y145.92 E.15346
G1 X128.851 Y145.867 E.00992
G1 X129.28 Y145.746 E.01432
G1 X131.746 Y143.28 E.11226
G1 X131.498 Y143.855 E.02016
G1 X131.152 Y144.396 E.02069
G1 X130.985 Y144.6 E.00846
G1 X129.94 Y145.645 E.04758
G1 X123.851 Y143.309 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X124.158 Y144.043 E.0264
G1 X124.617 Y144.735 E.02754
G1 X116.679 Y152.673 E.37237
G1 X116.293 Y152.673 E.01282
G1 X100.95 Y137.33 E.71974
G1 X100.95 Y137.698 E.01219
G1 X109.3 Y129.348 E.39171
G1 X108.66 Y128.71 E.02998
G1 X108.146 Y127.91 E.03154
G1 X107.826 Y127.042 E.03071
G1 X107.7 Y126.111 E.03115
G1 X107.778 Y125.177 E.0311
G1 X108.057 Y124.281 E.03112
G1 X108.523 Y123.467 E.03112
G1 X109.3 Y122.652 E.03735
G1 X100.95 Y114.302 E.39171
G1 X100.95 Y114.67 E.01219
G1 X116.67 Y98.95 E.73743
G1 X116.302 Y98.95 E.01219
G1 X124.617 Y107.265 E.39006
G1 X125.362 Y106.539 E.03451
G1 X126.168 Y106.053 E.03121
G1 X127.059 Y105.751 E.03121
G1 X127.993 Y105.649 E.03117
G1 X128.93 Y105.749 E.03126
G1 X129.832 Y106.053 E.03158
G1 X130.638 Y106.539 E.03121
G1 X131.383 Y107.265 E.03451
G1 X139.693 Y98.955 E.38986
G1 X139.334 Y98.955 E.01191
G1 X155.044 Y114.664 E.73698
G1 X155.044 Y114.308 E.01183
G1 X146.77 Y122.582 E.38814
G1 X146.093 Y122.128 E.02705
G1 X145.23 Y121.774 E.03094
G1 X144.525 Y121.63 E.02387
G1 X143.581 Y121.618 E.0313
G1 X142.668 Y121.805 E.03094
G1 X142.002 Y122.078 E.02386
G1 X141.221 Y122.587 E.03094
G1 X140.581 Y123.229 E.03006
G1 X130.735 Y113.383 E.46191
G1 X130.043 Y113.842 E.02754
G1 X129.395 Y114.122 E.02343
G1 X128.711 Y114.293 E.02338
G1 X128.006 Y114.352 E.02348
G1 X127.291 Y114.293 E.0238
G1 X126.605 Y114.122 E.02343
G1 X125.957 Y113.842 E.02343
G1 X125.265 Y113.383 E.02754
G1 X115.347 Y123.301 E.46526
G1 X115.789 Y123.964 E.02644
G1 X116.071 Y124.61 E.02336
G1 X116.245 Y125.303 E.02373
G1 X116.302 Y125.994 E.023
G1 X116.245 Y126.696 E.02336
G1 X116.071 Y127.39 E.02373
G1 X115.789 Y128.036 E.02336
G1 X115.347 Y128.699 E.02644
G1 X125.265 Y138.617 E.46526
G1 X125.957 Y138.158 E.02754
G1 X126.605 Y137.878 E.02343
G1 X127.291 Y137.707 E.02343
G1 X127.991 Y137.649 E.02333
G1 X128.698 Y137.705 E.02353
G1 X129.395 Y137.878 E.0238
G1 X130.043 Y138.158 E.02343
G1 X130.735 Y138.617 E.02754
G1 X140.581 Y128.771 E.46191
G1 X141.221 Y129.413 E.03006
G1 X142.002 Y129.922 E.03094
G1 X142.668 Y130.195 E.02386
G1 X143.581 Y130.382 E.03094
G1 X144.525 Y130.37 E.0313
G1 X145.23 Y130.226 E.02386
G1 X146.093 Y129.872 E.03094
G1 X146.77 Y129.418 E.02705
G1 X155.05 Y137.698 E.38839
G1 X155.05 Y137.33 E.01218
G1 X139.33 Y153.05 E.73743
G1 X139.698 Y153.05 E.01219
G1 X131.383 Y144.735 E.39006
G1 X130.813 Y145.32 E.0271
G1 X130.149 Y145.782 E.02683
G1 X141.424 Y145.569 F30000
G1 F15476.087
G1 X140.863 Y145.087 E.02452
G1 X140.308 Y144.395 E.02942
G1 X131.654 Y153.05 E.40599
G1 X132.022 Y153.05 E.01219
G1 X100.95 Y121.978 E1.45762
G1 X100.95 Y122.346 E.01219
G1 X109.677 Y113.619 E.4094
G1 X108.983 Y113.066 E.02943
G1 X108.503 Y112.505 E.0245
G1 X101.664 Y109.438 F30000
G1 F15476.087
G3 X102.24 Y107.916 I11.517 J3.487 E.05403
G1 X146.085 Y151.761 E2.05684
G3 X144.563 Y152.337 I-6.734 J-15.474 E.054
G1 X129.94 Y113.645 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.437831
G1 F15000
G1 X130.985 Y112.6 E.04758
G1 X131.152 Y112.396 E.00846
G1 X131.498 Y111.855 E.02068
G1 X131.746 Y111.28 E.02016
G1 X129.28 Y113.746 E.11226
G1 X128.851 Y113.867 E.01432
G1 X128.548 Y113.92 E.0099
G1 X131.92 Y110.548 E.15344
G1 X131.954 Y110.215 E.01078
G1 X131.958 Y109.951 E.00848
G1 X127.951 Y113.958 E.18236
G1 X127.433 Y113.917 E.01671
G1 X131.917 Y109.433 E.20406
G1 X131.822 Y108.97 E.01522
G1 X126.97 Y113.822 E.22083
G1 X126.55 Y113.684 E.01423
G1 X131.684 Y108.55 E.23365
G1 X131.509 Y108.167 E.01356
G1 X126.167 Y113.509 E.24312
G1 X125.816 Y113.301 E.01312
G1 X131.301 Y107.816 E.24965
G1 X131.064 Y107.494 E.01285
G1 X125.494 Y113.064 E.25348
G1 X125.201 Y112.799 E.01272
G1 X130.799 Y107.201 E.25474
G1 X130.506 Y106.936 E.01272
G1 X124.936 Y112.506 E.25348
G1 X124.699 Y112.184 E.01285
G1 X130.184 Y106.699 E.24965
G1 X129.833 Y106.491 E.01312
G1 X124.491 Y111.833 E.24312
G1 X124.316 Y111.45 E.01356
G1 X129.45 Y106.316 E.23365
G1 X129.03 Y106.178 E.01423
G1 X124.178 Y111.03 E.22083
G1 X124.083 Y110.566 E.01523
G1 X128.566 Y106.083 E.20406
G1 X128.048 Y106.042 E.01673
G1 X124.042 Y110.049 E.18233
G1 X124.046 Y109.785 E.00847
G1 X124.08 Y109.452 E.01078
G1 X127.452 Y106.08 E.15345
G1 X127.149 Y106.133 E.00991
G1 X126.72 Y106.254 E.01433
G1 X124.254 Y108.72 E.11224
G1 X124.502 Y108.145 E.02015
G1 X124.848 Y107.604 E.02068
G1 X125.016 Y107.399 E.00852
G1 X126.06 Y106.355 E.04751
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.016 Y107.399 E-.56099
G1 X124.848 Y107.604 E-.10057
G1 X124.709 Y107.822 E-.09845
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
G17
G3 Z6 I-1.121 J-.474 P1  F30000
G1 X106.736 Y150.292 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.357 Y149.997 E.01595
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.338 Y98.607 E.80719
G3 X155.398 Y114.004 I-.34 J15.396 E.7912
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.02 Y150.502 I.01 J-15.412 E.31823
G1 X106.784 Y150.328 E.00971
G1 X106.499 Y150.604 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.0151
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.348 Y98.215 E.74809
G3 X155.79 Y114.001 I-.35 J15.788 E.75144
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.547 Y150.64 E.00932
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.303 E-.20957
G1 X105.456 Y149.753 E-.32492
G1 X105.025 Y149.345 E-.22551
; WIPE_END
G1 E-.04 F1800
G1 X104.816 Y148.066 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.404064
; LAYER_HEIGHT: 0.4
G1 F3000
G2 X106.583 Y149.711 I15.516 J-14.89 E.1262
G1 X107.569 Y150.44 E.06403
G1 X108.211 Y150.85 E.03981
G2 X108.29 Y150.898 I.455 J-.666 E.00486
G1 X105.247 Y147.855 E.22487
G1 X105.478 Y147.568 E.01926
G1 X102.493 Y144.583 E.22056
G1 X102.387 Y144.352 E.01327
G1 X109.636 Y151.602 E.53565
G1 X110.1 Y151.823 E.02686
G1 X110.3 Y151.624 E.01476
G1 X102.376 Y143.7 E.58544
G1 X102.698 Y143.379 E.02372
G1 X110.621 Y151.302 E.58544
G1 X110.942 Y150.981 E.02372
G1 X103.019 Y143.058 E.58544
G1 X103.266 Y142.81 E.0183
G1 X107.104 Y146.648 E.28358
G1 X107.178 Y146.575 E.00542
G1 X111.263 Y150.66 E.30186
G1 X111.584 Y150.339 E.02372
G1 X107.499 Y146.254 E.30186
G1 X107.82 Y145.933 E.02372
G1 X112.188 Y150.301 E.32276
G1 X112.218 Y150.272 E.00217
G1 X114.931 Y152.985 E.2005
G2 X115.545 Y153.016 I.588 J-5.639 E.03212
G1 X108.141 Y145.612 E.54706
G1 X108.462 Y145.291 E.02372
G1 X116.2 Y153.028 E.57171
G1 X116.655 Y153.028 E.02377
G1 X116.684 Y152.915 E.00609
G1 X116.707 Y152.893 E.00166
G1 X108.783 Y144.969 E.58544
G1 X109.104 Y144.648 E.02372
G1 X117.028 Y152.572 E.58544
G1 X117.349 Y152.251 E.02372
G1 X110.35 Y145.252 E.51712
G2 X111.324 Y145.584 I1.663 J-3.285 E.05395
G1 X117.67 Y151.93 E.46887
G1 X117.991 Y151.609 E.02372
G1 X112.05 Y145.668 E.43893
G2 X112.618 Y145.594 I-.394 J-5.229 E.02994
G1 X118.312 Y151.288 E.42069
G1 X118.633 Y150.967 E.02372
G1 X113.133 Y145.467 E.40635
G1 X113.157 Y145.46 E.00131
G1 X114.831 Y146.597 E.10574
G1 X114.869 Y146.56 E.00275
G1 X118.954 Y150.645 E.30186
G1 X119.275 Y150.324 E.02372
G1 X115.19 Y146.239 E.30186
G1 X115.511 Y145.918 E.02372
G1 X119.596 Y150.003 E.30186
G1 X119.917 Y149.682 E.02372
G1 X115.832 Y145.597 E.30186
G1 X116.153 Y145.276 E.02372
G1 X120.238 Y149.361 E.30186
G1 X120.559 Y149.04 E.02372
G1 X116.474 Y144.955 E.30186
G1 X116.795 Y144.634 E.02372
G1 X121.024 Y148.862 E.31244
G1 X121.133 Y147.685 F30000
; LINE_WIDTH: 0.437506
G1 F3000
G1 X125.361 Y151.914 E.3663
G1 X125.706 Y151.569 E.02986
G1 X121.621 Y147.484 E.3539
G1 X121.965 Y147.139 E.02986
G1 X126.051 Y151.225 E.3539
G1 X126.395 Y150.88 E.02986
G1 X122.31 Y146.794 E.3539
G1 X122.655 Y146.45 E.02986
G1 X126.74 Y150.535 E.3539
G1 X127.085 Y150.191 E.02986
G1 X122.856 Y145.962 E.3663
G1 X124 Y153.035 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X128.311 Y153.035 E.11944
G1 X117.107 Y153.035 F30000
G1 F15000
G1 X120.674 Y153.035 E.09882
G1 X102.542 Y142.929 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X103.266 Y142.204 E.03399
M73 P73 R6
G1 X103.693 Y142.631 E.02002
G1 X146.083 Y100.241 E1.98861
G3 X150.634 Y103.366 I-6.234 J13.952 E.18413
G1 X109.723 Y144.277 E1.91919
G1 X109.282 Y143.865 E.02003
G1 X108.383 Y144.763 E.04215
G1 X100.95 Y137.33 E.3487
G1 X100.95 Y137.698 E.01219
G1 X139.693 Y98.955 E1.81751
G1 X139.335 Y98.955 E.0119
G1 X155.044 Y114.664 E.73697
G1 X155.044 Y114.308 E.01183
G1 X123.439 Y145.913 E1.48264
G1 X123.013 Y145.486 E.02002
G1 X120.656 Y147.842 E.11053
G1 X121.488 Y148.718 E.04006
G1 X120.751 Y149.455 E.03458
G1 X123.969 Y152.673 E.15096
G1 X124.355 Y152.673 E.01283
G1 X124.921 Y152.107 E.02655
G1 X125.348 Y152.533 E.02002
G1 X127.704 Y150.177 E.11053
G1 X127.277 Y149.751 E.02002
G1 X155.046 Y121.982 E1.30268
G1 X155.046 Y122.342 E.01195
G1 X131.657 Y98.953 E1.09722
G1 X132.019 Y98.953 E.01199
G1 X100.95 Y130.022 E1.45748
G1 X100.95 Y129.654 E.01219
G1 X116.059 Y144.763 E.70879
G1 X116.796 Y144.026 E.03458
G1 X117.223 Y144.453 E.02002
G1 X153.757 Y107.919 E1.71388
G3 X154.33 Y109.442 I-9.068 J4.278 E.05403
G1 X111.438 Y99.664 F30000
G1 F15476.087
G2 X109.916 Y100.24 I3.485 J11.511 E.05403
G1 X153.76 Y144.084 E2.05682
G3 X150.642 Y148.642 I-14.347 J-6.473 E.18413
G1 X105.362 Y103.362 E2.12414
G2 X102.241 Y107.917 I10.643 J10.642 E.1842
G1 X146.085 Y151.761 E2.05682
G3 X139.698 Y153.05 I-6.147 J-13.993 E.21781
G1 X100.95 Y114.302 E1.81772
G1 X100.95 Y114.67 E.01219
G1 X116.67 Y98.95 E.73743
G1 X116.302 Y98.95 E.01219
G1 X155.05 Y137.698 E1.81771
G1 X155.05 Y137.33 E.01218
G1 X139.33 Y153.05 E.73743
G1 X132.022 Y153.05 E.24243
G1 X100.95 Y121.978 E1.45762
G1 X100.95 Y122.346 E.01219
G1 X124.344 Y98.952 E1.09745
G1 X123.98 Y98.952 E.01209
G1 X155.048 Y130.02 E1.45747
G1 X155.048 Y129.656 E.01207
G1 X131.654 Y153.05 E1.09744
G1 X130.026 Y153.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.654 Y153.05 E-.61876
G1 X131.917 Y152.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
G17
G3 Z6.2 I.12 J-1.211 P1  F30000
G1 X106.74 Y150.296 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X106.357 Y149.997 E.01613
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.005 Y98.602 I15.412 J.01 E.80244
G1 X140.35 Y98.607 E.80756
G3 X155.398 Y114.004 I-.352 J15.396 E.7908
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.02 Y150.502 I.01 J-15.412 E.31823
G1 X106.789 Y150.331 E.00954
G1 X106.503 Y150.608 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.01527
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.002 Y98.21 I15.804 J.013 E.76204
G1 X140.36 Y98.215 E.74845
G3 X155.79 Y114.001 I-.362 J15.788 E.75106
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.551 Y150.643 E.00916
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.303 E-.2116
G1 X105.456 Y149.753 E-.32492
G1 X105.029 Y149.349 E-.22348
; WIPE_END
G1 E-.04 F1800
G1 X105.507 Y148.761 Z6.4 F30000
G1 Z6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G3 X101.409 Y141.626 I10.562 J-10.812 E.2309
G1 X101.164 Y140.435 E.03367
G3 X100.965 Y137.989 I14.833 J-2.438 E.06808
G1 X100.965 Y114.009 E.66438
G3 X101.626 Y109.591 I15.835 J.112 E.12418
G3 X107.512 Y101.598 I14.403 J4.442 E.28024
G1 X108.597 Y100.914 E.03553
G3 X114.783 Y99.015 I7.473 J13.312 E.18066
G1 X116.013 Y98.965 E.0341
G1 X140.337 Y98.97 E.67391
G3 X141.221 Y99.015 I-.388 J16.202 E.02455
G1 X142.439 Y99.164 E.03398
G1 X143.635 Y99.411 E.03384
G1 X144.807 Y99.754 E.03383
G1 X145.947 Y100.192 E.03383
G3 X147.048 Y100.72 I-6.536 J15.037 E.03385
G1 X148.103 Y101.336 E.03383
G3 X149.104 Y102.035 I-8.902 J13.809 E.03385
G1 X150.045 Y102.813 E.03383
G1 X150.919 Y103.665 E.03383
G3 X151.722 Y104.585 I-11.812 J11.114 E.03382
G1 X152.448 Y105.568 E.03386
G1 X153.091 Y106.606 E.03383
G3 X153.648 Y107.693 I-14.332 J8.03 E.03384
G1 X154.115 Y108.821 E.03383
G1 X154.486 Y109.975 E.03358
G3 X154.985 Y112.778 I-15.833 J4.265 E.07898
G3 X155.03 Y113.597 I-14.972 J1.225 E.02273
G1 X155.035 Y137.991 E.67585
G3 X154.374 Y142.409 I-15.585 J-.074 E.12419
G3 X152.447 Y146.434 I-15.17 J-4.79 E.12404
G3 X151.194 Y148.037 I-16.697 J-11.754 E.05639
M73 P73 R5
G3 X139.989 Y153.035 I-11.222 J-10.099 E.35006
G1 X128.881 Y153.035 E.30775
G1 X110.782 Y148.499 F30000
; LINE_WIDTH: 0.403458
G1 F15000
G1 X109.88 Y148.499 E.02651
; LINE_WIDTH: 0.420506
G1 X109.698 Y148.596 E.00634
; LINE_WIDTH: 0.4546
G1 X109.516 Y148.694 E.00691
; LINE_WIDTH: 0.503922
G1 F13665.89
G1 X109.335 Y148.791 E.00774
G1 X108.712 Y148.856 E.02353
G2 X109.493 Y149.332 I3.903 J-5.519 E.03439
G1 X109.57 Y149.166 E.00687
; LINE_WIDTH: 0.488734
G1 F14131.465
G1 X109.721 Y149.055 E.00681
; LINE_WIDTH: 0.454717
G1 F15000
G1 X109.872 Y148.944 E.00629
; LINE_WIDTH: 0.406932
G1 X110.023 Y148.834 E.00556
G1 X110.727 Y148.523 E.02282
G1 X111.985 Y148.487 F30000
; LINE_WIDTH: 0.412083
G1 F15000
G1 X111.772 Y148.461 E.00645
G1 X114.757 Y148.505 F30000
; LINE_WIDTH: 0.411988
G1 F15000
G1 X113.745 Y148.501 E.03043
G1 X117.316 Y148.306 F30000
; LINE_WIDTH: 0.567409
G1 F12011.708
G1 X117.052 Y148.21 E.01201
G2 X115.163 Y148.195 I-2.935 J263.693 E.08075
; LINE_WIDTH: 0.52886
G1 F12964.567
G1 X115.028 Y148.173 E.00543
; LINE_WIDTH: 0.485316
G1 F14240.651
G1 X114.892 Y148.152 E.00494
; LINE_WIDTH: 0.422468
G1 F15000
G1 X114.757 Y148.13 E.00424
G1 X113.685 Y148.13 E.03315
; LINE_WIDTH: 0.443287
G1 X113.538 Y148.152 E.00486
; LINE_WIDTH: 0.489862
G1 F14095.805
G1 X113.39 Y148.174 E.00543
; LINE_WIDTH: 0.543225
G1 F12592.328
G1 X113.243 Y148.196 E.00608
G1 X112.52 Y148.205 E.02947
; LINE_WIDTH: 0.505074
G1 F13631.819
G1 X112.332 Y148.156 E.0073
; LINE_WIDTH: 0.458337
G1 F15000
G1 X112.145 Y148.108 E.00656
G1 X111.628 Y148.105 E.01748
; LINE_WIDTH: 0.486574
G1 F14200.256
G1 X111.481 Y148.109 E.00533
; LINE_WIDTH: 0.50577
G1 F13611.337
G1 X111.378 Y148.148 E.00417
; LINE_WIDTH: 0.561342
G1 F12152.259
G1 X111.274 Y148.187 E.00467
G1 X110.935 Y148.205 E.01436
; LINE_WIDTH: 0.551682
G1 F12382.998
G1 X110.717 Y148.186 E.00907
; LINE_WIDTH: 0.514059
G1 F13371.867
G1 X110.499 Y148.168 E.0084
; LINE_WIDTH: 0.476435
G1 F14532.381
G1 X110.281 Y148.149 E.00773
; LINE_WIDTH: 0.420577
G1 F15000
G2 X109.773 Y148.13 I-.363 J2.934 E.01566
G3 X109.2 Y148.392 I-1.006 J-1.439 E.01949
G1 X108.689 Y148.441 E.0158
G3 X107.687 Y148.143 I.868 J-4.749 E.03223
G1 X107.293 Y148.13 E.01215
G1 X107.293 Y148.306 E.00541
G2 X109.031 Y149.558 I10.626 J-12.922 E.06596
G1 X109.67 Y149.908 E.02244
G1 X109.887 Y149.441 E.01584
G1 X110.235 Y149.136 E.01425
; LINE_WIDTH: 0.438811
G1 X110.421 Y149.034 E.00685
; LINE_WIDTH: 0.476435
G1 F14532.381
G1 X110.608 Y148.932 E.0075
; LINE_WIDTH: 0.514059
G1 F13371.867
G1 X110.794 Y148.831 E.00815
; LINE_WIDTH: 0.558599
G1 F12216.913
G1 X110.98 Y148.729 E.00892
G1 X111.338 Y148.711 E.01504
; LINE_WIDTH: 0.532424
G1 F12870.17
G1 X111.522 Y148.76 E.0076
; LINE_WIDTH: 0.487454
G1 F14172.144
G1 X111.706 Y148.809 E.0069
; LINE_WIDTH: 0.430937
G1 F15000
G2 X112.091 Y148.854 I.27 J-.639 E.01243
; LINE_WIDTH: 0.438254
G1 X112.241 Y148.799 E.00512
; LINE_WIDTH: 0.474762
G1 F14588.686
G1 X112.39 Y148.744 E.0056
; LINE_WIDTH: 0.51127
G1 F13451.482
G1 X112.539 Y148.689 E.00607
; LINE_WIDTH: 0.544331
G1 F12564.556
G1 X113.053 Y148.687 E.02098
G1 X113.291 Y148.74 E.00999
; LINE_WIDTH: 0.527706
G1 F12995.439
G1 X113.383 Y148.791 E.00413
; LINE_WIDTH: 0.494063
G1 F13964.546
G1 X113.474 Y148.842 E.00385
; LINE_WIDTH: 0.462931
G1 F14999.625
G1 X113.578 Y148.857 E.0036
; LINE_WIDTH: 0.421202
G1 F15000
G1 X113.682 Y148.872 E.00324
G1 X114.83 Y148.881 E.03536
; LINE_WIDTH: 0.441772
G1 X114.955 Y148.82 E.00454
; LINE_WIDTH: 0.485316
G1 F14240.651
G1 X115.081 Y148.76 E.00503
; LINE_WIDTH: 0.546572
G1 F12508.636
G1 X115.207 Y148.699 E.00573
G1 X115.816 Y148.699 E.02499
; LINE_WIDTH: 0.575702
G1 F11824.738
G1 X116.186 Y148.758 E.01628
G1 X116.269 Y148.688 E.0047
G1 X117.063 Y148.331 E.03778
G1 X117.256 Y148.312 E.00844
G1 X117.557 Y147.896 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X117.273 Y147.802 E.00921
G1 X117.203 Y147.753 E.00263
G1 X113.36 Y147.753 E.11807
G2 X112.534 Y147.773 I-.321 J3.719 E.02543
G3 X111.479 Y147.682 I7.417 J-91.398 E.03255
G1 X111.051 Y147.753 E.01333
G1 X109.649 Y147.753 E.04309
G1 X109.292 Y147.966 E.01276
G1 X109.108 Y148.027 E.00596
G1 X108.711 Y148.064 E.01227
G3 X107.795 Y147.776 I.73 J-3.911 E.02957
G1 X106.916 Y147.753 E.02703
G1 X106.916 Y148.481 E.02235
G1 X107.3 Y148.807 E.01549
G2 X109.801 Y150.409 I9.067 J-11.396 E.09143
G1 X109.865 Y150.353 E.00262
G1 X110.172 Y149.688 E.02251
G1 X110.554 Y149.376 E.01516
G1 X111.059 Y149.174 E.01669
G3 X112.08 Y149.25 I.222 J3.902 E.03155
G1 X112.587 Y149.119 E.01611
G1 X113 Y149.129 E.0127
G1 X113.306 Y149.204 E.00966
G1 X113.373 Y149.247 E.00246
G1 X114.878 Y149.258 E.04624
G1 X115.283 Y149.135 E.01302
G1 X115.739 Y149.135 E.01401
G1 X116.226 Y149.256 E.01541
G2 X116.552 Y149.046 I-.171 J-.625 E.01211
G1 X117.142 Y148.781 E.01987
G1 X117.464 Y148.759 E.00992
G1 X118.046 Y148.882 E.01829
G1 X118.149 Y148.947 E.00375
G1 X118.379 Y148.718 E.00998
G1 X117.6 Y147.938 E.03387
G1 X117.743 Y147.548 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X117.433 Y147.461 E.00991
G1 X117.312 Y147.376 E.00454
G1 X113.36 Y147.376 E.12144
G2 X112.554 Y147.397 I-.305 J3.742 E.02481
G2 X111.71 Y147.315 I-1.509 J11.216 E.02608
G1 X111.487 Y147.252 E.0071
G1 X111.188 Y147.366 E.00984
G3 X109.479 Y147.376 I-1.417 J-96.497 E.05252
G1 X109.439 Y147.449 E.00256
G1 X109.03 Y147.657 E.01408
G1 X108.732 Y147.688 E.00921
G3 X107.921 Y147.411 I.575 J-3.007 E.02641
G2 X106.539 Y147.376 I-.948 J10.195 E.04253
G1 X106.537 Y148.654 E.03926
G1 X107.066 Y149.103 E.0213
G1 X108.009 Y149.8 E.03605
G1 X108.646 Y150.207 E.02324
G1 X109.673 Y150.769 E.03596
G1 X109.807 Y150.831 E.00455
G1 X110.181 Y150.638 E.01291
G1 X110.238 Y150.406 E.00733
G1 X110.457 Y149.935 E.01597
G1 X110.764 Y149.69 E.01206
G1 X111.177 Y149.538 E.01354
G3 X112.025 Y149.629 I-.078 J4.695 E.02624
G1 X112.636 Y149.492 E.01925
G1 X113.056 Y149.523 E.01292
G1 X113.279 Y149.623 E.00752
G1 X114.909 Y149.635 E.0501
G1 X115.473 Y149.493 E.01786
G3 X116.205 Y149.64 I-.806 J5.893 E.02295
G1 X116.505 Y149.56 E.00956
G1 X116.786 Y149.342 E.01094
G1 X117.208 Y149.153 E.01419
G1 X117.472 Y149.136 E.00812
G1 X117.888 Y149.224 E.01306
G1 X118.193 Y149.437 E.01144
G1 X118.912 Y148.718 E.03128
G1 X117.786 Y147.591 E.04896
G1 X117.901 Y147.173 F30000
G1 F15000
G1 X117.672 Y147.149 E.00708
G1 X117.413 Y146.999 E.00921
G1 X113.36 Y146.999 E.12453
G2 X112.48 Y147.007 I-.373 J6.985 E.02706
G1 X112.366 Y146.966 E.00371
G1 X111.856 Y146.963 E.01568
G1 X111.439 Y146.847 E.0133
G1 X111.192 Y146.981 E.00864
G3 X109.309 Y146.999 I-1.506 J-59.903 E.05786
G1 X109.236 Y147.131 E.00462
G1 X108.924 Y147.295 E.01085
G1 X108.754 Y147.311 E.00526
G2 X107.997 Y147.04 I-7.552 J19.854 E.0247
G1 X107.413 Y146.999 E.01798
G1 X106.162 Y146.999 E.03846
G1 X106.162 Y148.628 E.05005
G1 X106.158 Y148.694 E.00203
G1 X106.069 Y148.735 E.00301
G2 X109.837 Y151.258 I9.943 J-10.771 E.13991
G3 X110.368 Y150.99 I1.639 J2.588 E.01831
G1 X110.528 Y150.787 E.00795
G1 X110.742 Y150.182 E.01973
G1 X110.973 Y150.004 E.00896
G1 X111.303 Y149.909 E.01056
G1 X111.903 Y150.01 E.01869
G1 X112.198 Y150.001 E.00908
G1 X112.686 Y149.866 E.01554
G1 X113.049 Y149.913 E.01127
G1 X113.185 Y149.999 E.00494
G1 X114.941 Y150.013 E.05397
G1 X115.488 Y149.87 E.01738
G1 X116.001 Y149.994 E.01621
G2 X116.518 Y149.976 I.202 J-1.609 E.01596
G2 X117.02 Y149.637 I-.382 J-1.11 E.01882
G1 X117.36 Y149.515 E.0111
G1 X117.729 Y149.566 E.01142
G1 X118.245 Y149.918 E.01921
G1 X119.446 Y148.718 E.05218
G1 X117.943 Y147.215 E.06528
G1 X118.042 Y146.781 F30000
; LINE_WIDTH: 0.419513
G1 F15000
G1 X117.9 Y146.81 E.00444
G1 X117.7 Y146.741 E.0065
G1 X117.581 Y146.622 E.00517
G1 X113.36 Y146.622 E.12954
G1 X113.112 Y146.593 E.00766
G1 X112.595 Y146.644 E.01594
G1 X112.368 Y146.589 E.00717
G1 X111.915 Y146.59 E.01391
G1 X111.353 Y146.431 E.01793
G1 X111.075 Y146.62 E.01032
G3 X109.132 Y146.622 I-1.477 J-650.438 E.05961
G1 X109.034 Y146.812 E.00659
G1 X108.832 Y146.93 E.00716
G1 X108.706 Y146.917 E.00388
G1 X108.222 Y146.713 E.01612
G1 X107.67 Y146.622 E.01716
G1 X105.796 Y146.622 E.05753
G1 X105.785 Y148.628 E.06156
G1 X105.507 Y148.761 E.00944
G2 X108.262 Y150.856 I13.388 J-14.742 E.10632
G1 X109.335 Y151.444 E.03755
G1 X109.976 Y151.736 E.02161
G1 X110.058 Y151.567 E.00577
G1 X110.203 Y151.468 E.0054
G1 X110.59 Y151.301 E.01293
G1 X110.785 Y151.11 E.00838
G1 X110.936 Y150.822 E.00999
G1 X111.027 Y150.429 E.01237
G1 X111.265 Y150.287 E.0085
G1 X111.875 Y150.388 E.01898
G1 X112.258 Y150.377 E.01175
G1 X112.765 Y150.239 E.01612
G1 X112.991 Y150.312 E.00731
G1 X113.054 Y150.376 E.00274
G1 X114.973 Y150.39 E.05888
G3 X115.567 Y150.255 I.992 J2.977 E.01873
G1 X116.031 Y150.378 E.01474
G2 X116.633 Y150.34 I.162 J-2.2 E.01856
G2 X117.339 Y149.895 I-.768 J-2.002 E.02577
G1 X117.57 Y149.908 E.0071
G1 X118.088 Y150.263 E.01929
G1 X118.242 Y150.455 E.00754
G1 X119.979 Y148.718 E.07539
G1 X118.085 Y146.824 E.0822
G1 X123.013 Y146.995 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X122.166 Y147.842 E.03681
G1 X124.526 Y150.202 E.10257
G3 X124.76 Y150.376 I-.128 J.418 E.00914
G1 X125.997 Y150.376 E.03799
G1 X126.195 Y150.177 E.00863
G1 X123.055 Y147.037 E.13645
G1 X123.013 Y147.552 F30000
; LINE_WIDTH: 0.450342
G1 F15000
G1 X122.722 Y147.842 E.01363
G1 X124.74 Y149.86 E.09473
G1 X124.995 Y149.992 E.00953
G1 X125.467 Y149.992 E.01566
G3 X123.055 Y147.594 I139.19 J-142.405 E.1129
G1 X121.821 Y142.315 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.4075
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X117.991 Y146.145 E.28782
G1 X118.314 Y146.468 E.02431
G1 X122.001 Y142.782 E.27706
G1 X122.325 Y143.105 E.02431
G1 X118.638 Y146.792 E.27706
G1 X118.961 Y147.115 E.02431
G1 X122.648 Y143.429 E.27706
G1 X122.972 Y143.752 E.02431
G1 X119.285 Y147.439 E.27706
G1 X119.608 Y147.762 E.02431
G1 X123.295 Y144.076 E.27706
G1 X123.619 Y144.399 E.02431
G1 X119.932 Y148.086 E.27706
G1 X120.255 Y148.409 E.02431
G1 X123.942 Y144.723 E.27706
G1 X124.266 Y145.046 E.02431
G1 X116.081 Y153.231 E.61506
G1 X114.398 Y150.778 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X116.148 Y152.528 E.08208
G1 X130.668 Y152.23 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.4075
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X134.897 Y148.002 E.31778
G1 X134.574 Y147.678 E.02431
M73 P74 R5
G1 X130.488 Y151.764 E.30702
G1 X130.165 Y151.44 E.02431
G1 X134.25 Y147.355 E.30702
G1 X133.927 Y147.031 E.02431
G1 X127.93 Y153.028 E.45067
G1 X127.283 Y153.028 E.03438
G1 X133.603 Y146.708 E.47498
G1 X133.28 Y146.384 E.02431
G1 X126.636 Y153.028 E.4993
G1 X125.989 Y153.028 E.03438
G1 X132.956 Y146.061 E.52361
G1 X132.633 Y145.737 E.02431
G1 X125.342 Y153.028 E.54792
G1 X124.695 Y153.028 E.03438
G1 X132.309 Y145.414 E.57223
G1 X131.986 Y145.09 E.02431
G1 X124.14 Y152.936 E.5896
G1 X124.297 Y152.684 E.01576
G1 X124.021 Y152.408 E.02077
G1 X125.084 Y151.345 E.07989
G1 X124.76 Y151.021 E.02431
G1 X123.697 Y152.085 E.07989
G1 X123.537 Y151.925 E.012
G1 X123.19 Y152.142 E.02175
G1 X123.092 Y152.043 E.00743
G1 X124.437 Y150.698 E.10108
G1 X124.113 Y150.374 E.02431
G1 X122.768 Y151.72 E.10108
G1 X122.445 Y151.396 E.02431
G1 X123.79 Y150.051 E.10108
G1 X123.466 Y149.727 E.02431
G1 X120.166 Y153.028 E.24805
G1 X119.518 Y153.028 E.03438
G1 X123.143 Y149.404 E.27236
G1 X122.819 Y149.08 E.02431
G1 X118.871 Y153.028 E.29667
G1 X118.224 Y153.028 E.03438
G1 X122.496 Y148.757 E.32098
G1 X122.172 Y148.433 E.02431
G1 X117.577 Y153.028 E.34529
G1 X116.93 Y153.028 E.03438
G1 X121.849 Y148.11 E.3696
G1 X121.581 Y147.842 E.02014
G1 X123.013 Y146.41 E.10761
G1 X123.281 Y146.678 E.02014
G1 X124.589 Y145.37 E.09833
G1 X124.913 Y145.693 E.02431
G1 X123.604 Y147.002 E.09833
G1 X123.928 Y147.325 E.02431
G1 X129.074 Y142.179 E.38675
G1 X129.398 Y142.502 E.02431
G1 X124.251 Y147.649 E.38675
G1 X124.575 Y147.972 E.02431
G1 X129.721 Y142.826 E.38675
G1 X130.045 Y143.149 E.02431
G1 X124.898 Y148.296 E.38675
G1 X125.222 Y148.619 E.02431
G1 X130.368 Y143.473 E.38675
G1 X130.692 Y143.796 E.02431
G1 X125.545 Y148.943 E.38675
G1 X125.869 Y149.266 E.02431
G1 X131.015 Y144.12 E.38675
G1 X131.339 Y144.443 E.02431
G1 X126.192 Y149.59 E.38675
G1 X126.516 Y149.913 E.02431
G1 X131.805 Y144.623 E.39751
G1 X132.393 Y151.118 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X131.241 Y152.269 E.05401
G1 X131.645 Y152.673 E.01893
G1 X132.031 Y152.673 E.01283
G1 X154.671 Y130.033 E1.06206
G1 X154.671 Y129.643 E.01295
G1 X124.357 Y99.329 E1.42208
G1 X123.967 Y99.329 E.01293
G1 X101.327 Y121.969 E1.06207
G1 X101.327 Y122.355 E.01283
G1 X121.248 Y142.276 E.93453
G1 X121.675 Y141.849 E.02002
G1 X124.589 Y144.763 E.13669
G1 X154.667 Y114.685 E1.41104
G1 X154.667 Y114.287 E.01319
G1 X139.712 Y99.332 E.70157
G1 X139.316 Y99.332 E.01313
G1 X101.327 Y137.321 E1.78212
G1 X101.327 Y137.707 E.01283
G1 X109.85 Y146.23 E.3998
G1 X108.97 Y146.23 E.02918
G1 X108.729 Y146.495 E.0119
G2 X107.762 Y146.238 I-1.085 J2.13 E.03344
G1 X150.367 Y103.633 E1.99868
G2 X145.801 Y100.524 I-10.341 J10.279 E.18438
G1 X102.523 Y143.801 E2.03023
G2 X103.25 Y145.257 I17.999 J-8.066 E.05401
G1 X154.036 Y142.272 F30000
G1 F15476.087
G3 X153.477 Y143.801 I-193.002 J-69.692 E.05399
G1 X110.199 Y100.523 E2.03024
G2 X105.629 Y103.629 I5.743 J13.367 E.18442
G1 X150.375 Y148.375 E2.09912
G3 X145.801 Y151.477 I-10.546 J-10.627 E.18439
G1 X102.523 Y108.199 E2.03024
G2 X101.964 Y109.728 I17.806 J7.375 E.05401
G1 X154.028 Y109.735 F30000
G1 F15476.087
G2 X153.468 Y108.208 I-9.663 J2.672 E.05403
G1 X115.446 Y146.23 E1.78369
G1 X117.47 Y146.23 E.06711
G1 X101.327 Y130.031 E.75858
G1 X101.327 Y129.645 E.01283
G1 X131.642 Y99.331 E1.4221
G1 X132.034 Y99.331 E.01303
G1 X154.669 Y121.965 E1.06182
G1 X154.669 Y122.359 E.01307
G1 X132.265 Y144.763 E1.05102
G1 X135.506 Y148.004 E.15205
G1 X135.079 Y148.431 E.02002
G1 X139.321 Y152.673 E.19898
G1 X139.707 Y152.673 E.01283
G1 X154.673 Y137.707 E.70205
G1 X154.672 Y137.32 E.01283
G1 X116.68 Y99.328 E1.78233
G1 X116.293 Y99.327 E.01283
G1 X101.327 Y114.293 E.70205
G1 X101.327 Y114.679 E.01283
G1 X128.586 Y141.938 E1.27877
G1 X127.435 Y143.09 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.586 Y141.938 E-.61876
G1 X128.324 Y141.675 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
G17
G3 Z6.4 I-.452 J-1.13 P1  F30000
G1 X106.744 Y150.299 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X106.357 Y149.997 E.0163
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.362 Y98.607 E.808
G3 X155.398 Y114.004 I-.366 J15.398 E.79037
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.02 Y150.502 I.01 J-15.412 E.31823
G1 X106.793 Y150.334 E.00936
G1 X106.507 Y150.611 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.01543
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.372 Y98.215 E.74884
G3 X155.79 Y114.001 I-.377 J15.79 E.75066
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.556 Y150.646 E.009
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.303 E-.21357
G1 X105.456 Y149.753 E-.32492
G1 X105.032 Y149.353 E-.22152
; WIPE_END
G1 E-.04 F1800
G1 X108.494 Y151.25 Z6.6 F30000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.426418
G1 F15000
G1 X106.158 Y148.915 E.10322
G1 X106.46 Y148.674 E.01206
G1 X109.235 Y151.449 E.12265
G1 X110.246 Y151.918 E.03482
G1 X106.46 Y148.131 E.16733
G1 X106.46 Y147.589 E.01695
G1 X111.116 Y152.245 E.20577
G2 X111.898 Y152.485 I2.159 J-5.648 E.02558
G1 X106.709 Y147.297 E.22929
G1 X107.252 Y147.297 E.01695
G1 X112.634 Y152.678 E.23785
G2 X113.316 Y152.819 I1.375 J-4.96 E.02179
G1 X107.815 Y147.318 E.24311
G3 X108.103 Y147.381 I-.04 J.873 E.00924
G1 X108.7 Y147.66 E.02059
G1 X113.96 Y152.92 E.23248
G2 X114.575 Y152.993 I.977 J-5.636 E.01936
G1 X109.132 Y147.55 E.24055
G1 X109.464 Y147.339 E.01228
G1 X115.165 Y153.041 E.25199
G2 X115.724 Y153.057 I.428 J-5.135 E.01747
G1 X109.964 Y147.297 E.25457
G1 X110.506 Y147.297 E.01695
G1 X116.274 Y153.065 E.25491
G1 X116.816 Y153.065 E.01695
G1 X111.048 Y147.297 E.25491
G1 X111.409 Y147.297 E.01126
G1 X111.5 Y147.206 E.00402
G1 X117.359 Y153.065 E.25893
G1 X117.901 Y153.065 E.01695
G1 X112.106 Y147.269 E.25613
G1 X112.296 Y147.266 E.00597
G1 X112.577 Y147.346 E.00913
G1 X112.698 Y147.319 E.00386
G1 X118.443 Y153.065 E.25392
G1 X118.986 Y153.065 E.01695
G1 X113.21 Y147.289 E.25527
G1 X113.76 Y147.297 E.0172
G1 X119.528 Y153.065 E.25491
G1 X120.07 Y153.065 E.01695
G1 X114.302 Y147.297 E.25491
G1 X114.845 Y147.297 E.01695
G1 X120.613 Y153.065 E.25491
G1 X121.155 Y153.065 E.01695
G1 X115.387 Y147.297 E.25491
G1 X115.929 Y147.297 E.01695
G1 X121.697 Y153.065 E.25491
G1 X122.24 Y153.065 E.01695
G1 X116.472 Y147.297 E.25491
G1 X117.014 Y147.297 E.01695
G1 X122.782 Y153.065 E.25491
G1 X123.324 Y153.065 E.01695
G1 X117.725 Y147.465 E.24748
G1 X118.055 Y147.522 E.01049
G1 X118.238 Y147.436 E.00631
M73 P75 R5
G1 X123.867 Y153.065 E.24877
G1 X124.409 Y153.065 E.01695
G1 X118.606 Y147.261 E.25649
G1 X118.973 Y147.086 E.01272
G1 X124.952 Y153.065 E.26421
G1 X125.494 Y153.065 E.01695
G1 X119.341 Y146.912 E.27192
G1 X119.558 Y146.809 E.0075
G1 X118.891 Y146.142 E.02946
G1 X119.003 Y146.031 E.00492
G1 X126.036 Y153.065 E.31085
G1 X126.579 Y153.065 E.01695
G1 X119.274 Y145.76 E.32284
G1 X119.545 Y145.489 E.01198
G1 X127.121 Y153.065 E.33482
G1 X127.345 Y153.065 E.00702
G1 X127.504 Y152.906 E.00702
G1 X119.816 Y145.217 E.33978
G1 X120.087 Y144.946 E.01198
G1 X127.776 Y152.635 E.33978
G1 X128.047 Y152.363 E.01198
G1 X120.358 Y144.675 E.33978
G1 X120.63 Y144.404 E.01198
G1 X128.318 Y152.092 E.33978
G1 X128.589 Y151.821 E.01198
G1 X120.901 Y144.133 E.33978
G1 X121.172 Y143.862 E.01198
G1 X128.86 Y151.55 E.33978
G1 X129.131 Y151.279 E.01198
G1 X121.443 Y143.59 E.33978
G1 X121.675 Y143.358 E.01025
G1 X125.175 Y146.859 E.15469
G1 X125.214 Y146.819 E.00173
G1 X129.403 Y151.008 E.18509
G1 X129.674 Y150.736 E.01198
G1 X125.486 Y146.548 E.18509
G1 X125.757 Y146.277 E.01198
G1 X129.945 Y150.465 E.18509
G1 X130.019 Y150.391 E.00327
G1 X130.814 Y151.187 E.03516
G1 X131.012 Y150.989 E.00872
G1 X126.028 Y146.006 E.22025
G1 X126.299 Y145.735 E.01198
G1 X131.283 Y150.718 E.22025
G1 X131.554 Y150.447 E.01198
G1 X126.57 Y145.464 E.22025
G1 X126.841 Y145.192 E.01198
G1 X131.825 Y150.176 E.22025
G1 X132.096 Y149.905 E.01198
G1 X127.113 Y144.921 E.22025
G1 X127.384 Y144.65 E.01198
G1 X132.367 Y149.634 E.22025
G1 X132.639 Y149.362 E.01198
G1 X127.655 Y144.379 E.22025
G1 X127.926 Y144.108 E.01198
G1 X132.91 Y149.091 E.22025
G1 X133.181 Y148.82 E.01198
G1 X128.197 Y143.836 E.22025
G1 X128.469 Y143.565 E.01198
G1 X133.452 Y148.549 E.22025
G1 X133.723 Y148.278 E.01198
G1 X128.74 Y143.294 E.22025
G1 X129.011 Y143.023 E.01198
G1 X134.114 Y148.127 E.22555
G1 X127.969 Y152.739 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400635
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X128.258 Y153.028 E.02099
G1 X128.896 Y153.028 E.03273
G1 X128.431 Y152.564 E.03374
G1 X128.75 Y152.245 E.02315
G1 X129.533 Y153.028 E.05688
G1 X130.17 Y153.028 E.03273
G1 X129.069 Y151.926 E.08003
G1 X129.387 Y151.608 E.02315
G1 X130.808 Y153.028 E.10318
G1 X131.445 Y153.028 E.03273
G1 X129.706 Y151.289 E.12632
G1 X130.019 Y150.976 E.02274
G1 X132.082 Y153.028 E.14947
G1 X132.719 Y153.028 E.03273
G1 X131.139 Y151.447 E.11483
G1 X131.457 Y151.129 E.02315
G1 X133.357 Y153.028 E.13798
G1 X133.994 Y153.028 E.03273
G1 X131.776 Y150.81 E.16112
G1 X132.095 Y150.491 E.02315
G1 X134.631 Y153.028 E.18427
G1 X135.269 Y153.028 E.03273
G1 X132.413 Y150.173 E.20741
G1 X132.732 Y149.854 E.02315
G1 X135.906 Y153.028 E.23056
G1 X136.543 Y153.028 E.03273
G1 X133.05 Y149.535 E.25371
G1 X133.369 Y149.217 E.02315
G1 X137.181 Y153.028 E.27685
G1 X137.818 Y153.028 E.03273
G1 X133.688 Y148.898 E.3
G1 X134.006 Y148.58 E.02315
G1 X138.455 Y153.028 E.32314
G1 X139.092 Y153.028 E.03273
G1 X134.325 Y148.261 E.34629
G1 X134.582 Y148.004 E.01864
G1 X129.013 Y142.436 E.40448
G1 X128.757 Y142.692 E.01864
G1 X100.972 Y114.908 E2.01823
G1 X100.972 Y115.545 E.03273
G1 X128.438 Y143.011 E1.99508
G1 X128.119 Y143.33 E.02315
G1 X100.972 Y116.182 E1.97193
G1 X100.972 Y116.819 E.03273
G1 X127.801 Y143.648 E1.94879
G1 X127.482 Y143.967 E.02315
G1 X100.972 Y117.457 E1.92564
G1 X100.972 Y118.094 E.03273
G1 X127.163 Y144.286 E1.9025
G1 X126.845 Y144.604 E.02315
G1 X100.972 Y118.731 E1.87935
G1 X100.972 Y119.369 E.03273
G1 X126.526 Y144.923 E1.8562
G1 X126.207 Y145.242 E.02315
G1 X100.972 Y120.006 E1.83306
G1 X100.972 Y120.643 E.03273
G1 X125.889 Y145.56 E1.80991
G1 X125.57 Y145.879 E.02315
G1 X100.972 Y121.281 E1.78677
G1 X100.972 Y121.918 E.03273
G1 X125.251 Y146.197 E1.76362
G1 X125.175 Y146.274 E.00554
G1 X121.675 Y142.774 E.25425
G1 X121.433 Y143.016 E.0176
G1 X100.972 Y122.555 E1.48623
G1 X100.972 Y123.192 E.03273
G1 X121.114 Y143.335 E1.46308
G1 X120.795 Y143.653 E.02315
G1 X100.972 Y123.83 E1.43994
G1 X100.972 Y124.467 E.03273
G1 X120.477 Y143.972 E1.41679
G1 X120.158 Y144.291 E.02315
G1 X100.972 Y125.104 E1.39365
G1 X100.972 Y125.742 E.03273
G1 X119.839 Y144.609 E1.3705
G1 X119.521 Y144.928 E.02315
G1 X100.972 Y126.379 E1.34736
G1 X100.972 Y127.016 E.03273
G1 X119.202 Y145.246 E1.32421
G1 X118.883 Y145.565 E.02315
G1 X100.972 Y127.653 E1.30106
G1 X100.972 Y128.291 E.03273
G1 X118.565 Y145.884 E1.27792
G1 X118.306 Y146.142 E.01877
G1 X118.851 Y146.687 E.03955
G1 X118.769 Y146.726 E.00465
G1 X100.972 Y128.928 E1.29277
G1 X100.972 Y129.565 E.03273
G1 X118.337 Y146.931 E1.26138
G1 X117.997 Y147.092 E.01936
G1 X117.833 Y147.064 E.00852
G1 X100.972 Y130.203 E1.22477
G1 X100.972 Y130.84 E.03273
G1 X117.015 Y146.883 E1.16534
G1 X116.378 Y146.883 E.03273
G1 X100.972 Y131.477 E1.11905
G1 X100.972 Y132.115 E.03273
G1 X115.74 Y146.883 E1.07276
G1 X115.103 Y146.883 E.03273
G1 X100.972 Y132.752 E1.02646
G1 X100.972 Y133.389 E.03273
G1 X114.466 Y146.883 E.98017
G1 X113.828 Y146.883 E.03273
G1 X100.972 Y134.026 E.93388
G1 X100.972 Y134.664 E.03273
G1 X113.157 Y146.849 E.88513
G2 X112.59 Y146.919 I-.015 J2.202 E.02943
G1 X100.972 Y135.301 E.84394
G1 X100.972 Y135.938 E.03273
M73 P76 R5
G1 X111.885 Y146.851 E.7927
G1 X111.403 Y146.718 E.02569
G1 X111.258 Y146.862 E.01049
G1 X100.972 Y136.576 E.74719
G1 X100.972 Y137.213 E.03273
G1 X110.642 Y146.883 E.70242
G1 X110.005 Y146.883 E.03273
G1 X100.972 Y137.85 E.65613
G2 X100.986 Y138.501 I12.053 J.07 E.03345
G1 X109.384 Y146.9 E.61003
G1 X108.994 Y147.147 E.02371
G1 X101.024 Y139.177 E.57898
G2 X101.096 Y139.886 I6.578 J-.31 E.03664
G1 X108.183 Y146.973 E.51481
G2 X107.455 Y146.883 I-.681 J2.511 E.03778
G1 X101.213 Y140.641 E.45341
G1 X101.379 Y141.443 E.04209
G1 X106.818 Y146.883 E.39512
G1 X106.181 Y146.883 E.03273
G1 X101.605 Y142.307 E.33237
G2 X101.928 Y143.267 I22.755 J-7.11 E.052
G1 X106.046 Y147.385 E.29916
G1 X106.046 Y148.023 E.03273
G1 X102.396 Y144.373 E.26513
G2 X103.123 Y145.737 I13.663 J-6.406 E.07946
G1 X105.944 Y148.558 E.20486
G1 X105.591 Y148.829 E.02282
G1 X103.621 Y146.872 E.14261
G1 X100.769 Y114.068 F30000
G1 F3000
G1 X139.73 Y153.028 E2.83
G2 X140.357 Y153.018 I.131 J-11.613 E.03223
G1 X100.982 Y113.643 E2.86014
G3 X101.007 Y113.031 I5.652 J-.076 E.03149
G1 X140.969 Y152.993 E2.9028
G1 X141.559 Y152.945 E.03037
G1 X101.055 Y112.441 E2.94212
G3 X101.134 Y111.883 I4.153 J.306 E.02897
G1 X142.123 Y152.872 E2.97733
G2 X142.672 Y152.784 I-.539 J-5.108 E.02858
G1 X101.217 Y111.329 E3.01117
G3 X101.323 Y110.798 I3.973 J.513 E.02787
G1 X143.207 Y152.681 E3.04234
G2 X143.718 Y152.555 I-.905 J-4.78 E.02707
G1 X101.442 Y110.28 E3.07082
G1 X101.581 Y109.781 E.02659
G1 X144.217 Y152.417 E3.097
G1 X144.7 Y152.262 E.02603
G1 X101.733 Y109.296 E3.12101
G1 X101.893 Y108.819 E.02583
G1 X145.18 Y152.105 E3.14421
G1 X145.636 Y151.924 E.02522
G1 X102.08 Y108.368 E3.16385
G1 X102.266 Y107.917 E.02507
G1 X146.086 Y151.737 E3.18298
G1 X146.521 Y151.535 E.02466
G1 X102.467 Y107.48 E3.20005
G1 X102.677 Y107.053 E.02445
G1 X146.945 Y151.321 E3.21552
G1 X147.361 Y151.1 E.02421
G1 X102.903 Y106.642 E3.22937
G3 X103.134 Y106.236 I3.863 J1.927 E.02402
G1 X147.761 Y150.863 E3.24161
G2 X148.156 Y150.62 I-2.037 J-3.762 E.02381
G1 X103.382 Y105.847 E3.25224
G3 X103.636 Y105.463 I3.666 J2.146 E.02364
G1 X148.535 Y150.363 E3.26142
G2 X148.908 Y150.098 I-2.252 J-3.571 E.02349
G1 X103.902 Y105.092 E3.26915
G3 X104.177 Y104.73 I3.477 J2.356 E.02337
G1 X149.27 Y149.823 E3.27546
M73 P77 R5
G2 X149.622 Y149.537 I-2.459 J-3.385 E.02328
G1 X104.461 Y104.377 E3.28037
G3 X104.758 Y104.036 I3.294 J2.561 E.02321
G1 X149.967 Y149.245 E3.28389
G2 X150.297 Y148.937 I-2.543 J-3.064 E.02317
G1 X105.059 Y103.7 E3.28597
G3 X105.376 Y103.379 I3.114 J2.762 E.02316
G1 X150.623 Y148.627 E3.28667
G2 X150.931 Y148.297 I-2.321 J-2.478 E.02318
G1 X105.696 Y103.062 E3.28577
G1 X106.032 Y102.761 E.02318
G1 X151.236 Y147.965 E3.28355
G2 X151.536 Y147.627 I-2.39 J-2.417 E.02321
G1 X106.373 Y102.464 E3.28052
G1 X106.726 Y102.18 E.02328
G1 X151.82 Y147.274 E3.27549
G2 X152.095 Y146.912 I-3.201 J-2.72 E.02337
G1 X107.088 Y101.905 E3.26921
G1 X107.459 Y101.638 E.02345
G1 X152.361 Y146.541 E3.26164
G2 X152.615 Y146.157 I-3.41 J-2.531 E.02363
G1 X107.84 Y101.382 E3.25239
G3 X108.235 Y101.14 I2.962 J4.397 E.02381
G1 X152.864 Y145.769 E3.24172
G2 X153.095 Y145.362 I-3.631 J-2.336 E.02401
G1 X108.634 Y100.902 E3.22951
G1 X109.051 Y100.681 E.02421
G1 X153.32 Y144.95 E3.21562
G1 X153.526 Y144.52 E.02454
G1 X109.474 Y100.467 E3.19988
G1 X109.91 Y100.265 E.02466
G1 X153.733 Y144.089 E3.18322
M73 P78 R4
G2 X153.923 Y143.642 I-3.2 J-1.627 E.02497
G1 X110.358 Y100.077 E3.16446
G1 X110.814 Y99.895 E.0252
G1 X154.105 Y143.186 E3.14454
G2 X154.265 Y142.71 I-4.331 J-1.727 E.02584
G1 X111.29 Y99.735 E3.12161
G3 X111.775 Y99.582 I1.647 J4.396 E.02612
G1 X154.416 Y142.222 E3.09728
G1 X154.548 Y141.718 E.0268
G1 X112.274 Y99.444 E3.07069
G3 X112.792 Y99.324 I1.362 J4.714 E.0273
G1 X154.68 Y141.212 E3.04267
G1 X154.783 Y140.678 E.02797
G1 X113.321 Y99.216 E3.01167
G1 X113.869 Y99.126 E.0285
G1 X154.871 Y140.129 E2.97833
G2 X154.945 Y139.565 I-5.163 J-.96 E.02922
G1 X114.439 Y99.059 E2.94229
G3 X115.029 Y99.012 I.642 J4.322 E.03043
G1 X154.993 Y138.976 E2.9029
M73 P79 R4
G2 X155.018 Y138.364 I-5.624 J-.54 E.03147
G1 X115.641 Y98.987 E2.86026
G3 X116.263 Y98.972 I.495 J7.626 E.03198
G1 X155.028 Y137.737 E2.81578
G1 X155.028 Y137.099 E.03274
G1 X116.901 Y98.972 E2.76947
G1 X117.538 Y98.972 E.03274
G1 X155.028 Y136.462 E2.72316
G1 X155.028 Y135.824 E.03274
G1 X118.176 Y98.972 E2.67684
G1 X118.813 Y98.972 E.03274
G1 X155.028 Y135.187 E2.63053
G1 X155.027 Y134.549 E.03274
G1 X119.451 Y98.973 E2.58422
G1 X120.088 Y98.973 E.03274
G1 X155.027 Y133.912 E2.53791
G1 X155.027 Y133.274 E.03274
G1 X120.725 Y98.973 E2.4916
G1 X121.363 Y98.973 E.03274
G1 X155.027 Y132.637 E2.44528
G1 X155.027 Y132 E.03274
G1 X122 Y98.973 E2.39897
M73 P80 R4
G1 X122.638 Y98.973 E.03274
G1 X155.027 Y131.362 E2.35266
G1 X155.026 Y130.725 E.03274
G1 X123.275 Y98.973 E2.30635
G1 X123.913 Y98.973 E.03274
G1 X155.026 Y130.087 E2.26004
G1 X155.026 Y129.45 E.03274
G1 X124.55 Y98.974 E2.21372
G1 X125.187 Y98.974 E.03274
G1 X155.026 Y128.812 E2.16741
G1 X155.026 Y128.175 E.03274
G1 X125.825 Y98.974 E2.1211
G1 X126.462 Y98.974 E.03274
G1 X155.026 Y127.537 E2.07479
G1 X155.026 Y126.9 E.03274
G1 X127.1 Y98.974 E2.02848
G1 X127.737 Y98.974 E.03274
G1 X155.025 Y126.263 E1.98217
G1 X155.025 Y125.625 E.03274
G1 X128.375 Y98.974 E1.93585
G1 X129.012 Y98.974 E.03274
G1 X155.025 Y124.988 E1.88954
M73 P81 R4
G1 X155.025 Y124.35 E.03274
G1 X129.649 Y98.975 E1.84323
G1 X130.287 Y98.975 E.03274
G1 X155.025 Y123.713 E1.79692
G1 X155.025 Y123.075 E.03274
G1 X130.924 Y98.975 E1.75061
G1 X131.562 Y98.975 E.03274
G1 X155.025 Y122.438 E1.70429
G1 X155.024 Y121.8 E.03274
G1 X132.199 Y98.975 E1.65798
G1 X132.837 Y98.975 E.03274
G1 X155.024 Y121.163 E1.61167
G1 X155.024 Y120.526 E.03274
G1 X133.474 Y98.975 E1.56536
G1 X134.111 Y98.975 E.03274
G1 X155.024 Y119.888 E1.51905
G1 X155.024 Y119.251 E.03274
G1 X134.749 Y98.976 E1.47273
G1 X135.386 Y98.976 E.03274
G1 X155.024 Y118.613 E1.42642
G1 X155.024 Y117.976 E.03274
G1 X136.024 Y98.976 E1.38011
G1 X136.661 Y98.976 E.03274
G1 X155.023 Y117.338 E1.3338
M73 P82 R4
G1 X155.023 Y116.701 E.03274
G1 X137.298 Y98.976 E1.28749
G1 X137.936 Y98.976 E.03274
G1 X155.023 Y116.063 E1.24118
G1 X155.023 Y115.426 E.03274
G1 X138.573 Y98.976 E1.19486
G1 X139.211 Y98.977 E.03274
G1 X155.023 Y114.789 E1.14855
G1 X155.023 Y114.151 E.03274
G1 X139.848 Y98.977 E1.10224
G3 X140.493 Y98.984 I.251 J6.262 E.03313
G1 X155.018 Y113.509 E1.05507
G1 X154.981 Y112.835 E.03466
G1 X141.165 Y99.019 E1.00361
M73 P82 R3
G3 X141.887 Y99.103 I-.241 J5.176 E.03737
G1 X154.897 Y112.113 E.94499
G2 X154.792 Y111.372 I-5.517 J.398 E.0385
G1 X142.632 Y99.212 E.88327
G1 X143.435 Y99.377 E.04209
G1 X154.627 Y110.569 E.81296
G2 X154.388 Y109.692 I-6.583 J1.326 E.0467
G1 X144.312 Y99.617 E.73187
G3 X145.273 Y99.941 I-1.509 J6.066 E.05215
G1 X154.075 Y108.742 E.63933
G1 X153.617 Y107.647 E.06097
G1 X146.374 Y100.404 E.52613
G3 X147.737 Y101.13 I-3.776 J8.735 E.07942
G1 X152.871 Y106.264 E.3729
G1 X152.438 Y105.567 E.04212
G1 X151.712 Y104.584 E.06274
G1 X150.913 Y103.668 E.06245
G1 X148.894 Y101.65 E.14662
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X150.308 Y103.064 E-.76
; WIPE_END
M73 P83 R3
G1 E-.04 F1800
; layer num/total_layer_count: 32/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
G17
G3 Z6.6 I-.895 J-.825 P1  F30000
G1 X106.748 Y150.302 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.357 Y149.997 E.01647
G3 X100.602 Y137.996 I9.657 J-12.011 E.45652
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.374 Y98.607 E.8084
G3 X155.398 Y114.004 I-.378 J15.397 E.78997
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.02 Y150.502 I.01 J-15.412 E.31823
G1 X106.797 Y150.337 E.0092
G1 X106.511 Y150.614 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.303 E.01558
G3 X100.21 Y137.999 I9.903 J-12.317 E.43356
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.384 Y98.215 E.74922
G3 X155.79 Y114.001 I-.389 J15.789 E.75028
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.559 Y150.649 E.00885
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.303 E-.21546
G1 X105.456 Y149.753 E-.32492
G1 X105.036 Y149.356 E-.21962
; WIPE_END
G1 E-.04 F1800
G1 X112.667 Y149.51 Z6.8 F30000
G1 X149.061 Y150.241 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422018
G1 F15000
G1 X150.696 Y148.607 E.07143
G2 X152.746 Y146.02 I-10.333 J-10.298 E.10219
G1 X148.012 Y150.754 E.20682
G3 X146.78 Y151.45 I-7.035 J-11.015 E.04374
G1 X153.444 Y144.786 E.29111
G2 X153.887 Y143.807 I-7.002 J-3.759 E.03323
G1 X145.791 Y151.903 E.35369
G3 X144.927 Y152.231 I-3.454 J-7.802 E.02855
G1 X154.231 Y142.927 E.40646
G2 X154.478 Y142.143 I-7.106 J-2.675 E.0254
G1 X144.143 Y152.478 E.45151
G3 X143.419 Y152.666 I-2.036 J-6.35 E.02313
G1 X154.667 Y141.418 E.4914
G2 X154.809 Y140.74 I-4.931 J-1.388 E.02143
G1 X142.739 Y152.811 E.52733
G1 X142.109 Y152.904 E.01968
G1 X154.904 Y140.109 E.55899
G2 X154.988 Y139.49 I-4.528 J-.926 E.01933
G1 X141.49 Y152.988 E.58969
G1 X140.906 Y153.035 E.01809
G1 X155.035 Y138.906 E.61727
G2 X155.055 Y138.35 I-5.112 J-.462 E.0172
G1 X140.35 Y153.055 E.64243
G3 X139.804 Y153.065 I-.452 J-10.093 E.01687
G1 X155.065 Y137.804 E.6667
G1 X155.064 Y137.268 E.01656
G1 X139.268 Y153.065 E.69011
G1 X138.732 Y153.065 E.01656
G1 X155.064 Y136.732 E.71353
G1 X155.064 Y136.196 E.01656
G1 X138.196 Y153.065 E.73695
G1 X137.659 Y153.065 E.01656
G1 X155.064 Y135.66 E.76036
G1 X155.064 Y135.124 E.01656
G1 X137.123 Y153.065 E.78378
G1 X136.587 Y153.065 E.01656
G1 X155.064 Y134.588 E.8072
G1 X155.064 Y134.052 E.01656
G1 X136.051 Y153.065 E.83061
G1 X135.515 Y153.065 E.01656
G1 X155.064 Y133.516 E.85403
G1 X155.063 Y132.98 E.01656
G1 X134.979 Y153.065 E.87745
G1 X134.443 Y153.065 E.01656
G1 X155.063 Y132.444 E.90086
G1 X155.063 Y131.908 E.01656
G1 X133.907 Y153.065 E.92428
G1 X133.37 Y153.065 E.01656
G1 X155.063 Y131.372 E.9477
G1 X155.063 Y130.836 E.01656
G1 X132.834 Y153.065 E.97111
G1 X132.298 Y153.065 E.01656
G1 X155.063 Y130.3 E.99453
G1 X155.063 Y129.764 E.01656
G1 X131.762 Y153.065 E1.01795
G1 X131.226 Y153.065 E.01656
G1 X155.063 Y129.228 E1.04136
G1 X155.062 Y128.692 E.01656
G1 X130.69 Y153.065 E1.06478
G1 X130.154 Y153.065 E.01656
G1 X155.062 Y128.156 E1.08819
G1 X155.062 Y127.62 E.01656
G1 X129.618 Y153.065 E1.11161
M73 P84 R3
G1 X129.081 Y153.065 E.01656
G1 X155.062 Y127.084 E1.13503
G1 X155.062 Y126.548 E.01656
G1 X128.545 Y153.065 E1.15844
G1 X128.009 Y153.065 E.01656
G1 X155.062 Y126.012 E1.18186
G1 X155.062 Y125.476 E.01656
G1 X127.473 Y153.065 E1.20528
G1 X126.937 Y153.065 E.01656
G1 X155.062 Y124.94 E1.22869
G1 X155.061 Y124.404 E.01656
G1 X126.401 Y153.065 E1.25211
G1 X125.865 Y153.065 E.01656
G1 X155.061 Y123.868 E1.27553
G1 X155.061 Y123.332 E.01656
G1 X125.329 Y153.065 E1.29894
G1 X124.792 Y153.065 E.01656
G1 X155.061 Y122.796 E1.32236
G1 X155.061 Y122.26 E.01656
G1 X124.256 Y153.065 E1.34578
G1 X123.72 Y153.065 E.01656
G1 X155.061 Y121.724 E1.36919
G1 X155.061 Y121.188 E.01656
G1 X123.184 Y153.065 E1.39261
G1 X122.648 Y153.065 E.01656
G1 X155.061 Y120.652 E1.41603
G1 X155.06 Y120.116 E.01656
G1 X122.112 Y153.065 E1.43944
G1 X121.576 Y153.065 E.01656
G1 X155.06 Y119.58 E1.46286
G1 X155.06 Y119.044 E.01656
G1 X121.04 Y153.065 E1.48627
G1 X120.503 Y153.065 E.01656
G1 X155.06 Y118.508 E1.50969
G1 X155.06 Y117.972 E.01656
G1 X119.967 Y153.065 E1.53311
G1 X119.431 Y153.065 E.01656
G1 X155.06 Y117.436 E1.55652
G1 X155.06 Y116.9 E.01656
G1 X118.895 Y153.065 E1.57994
G1 X118.359 Y153.065 E.01656
G1 X155.06 Y116.364 E1.60336
G1 X155.059 Y115.828 E.01656
G1 X117.823 Y153.065 E1.62677
G1 X117.287 Y153.065 E.01656
G1 X155.059 Y115.292 E1.65019
G1 X155.059 Y114.756 E.01656
G1 X116.751 Y153.065 E1.67361
G1 X116.214 Y153.065 E.01656
G1 X155.059 Y114.22 E1.69702
G1 X155.059 Y113.684 E.01656
G1 X115.687 Y153.056 E1.72006
G3 X115.166 Y153.041 I-.122 J-4.803 E.01611
G1 X155.036 Y113.171 E1.74182
G2 X155.001 Y112.669 I-3.716 J.006 E.01554
G1 X114.67 Y153.001 E1.76196
G3 X114.186 Y152.948 I.143 J-3.594 E.01505
G1 X154.943 Y112.192 E1.78055
G1 X154.884 Y111.714 E.01487
G1 X113.72 Y152.878 E1.79836
G1 X113.254 Y152.808 E.01456
G1 X154.807 Y111.255 E1.81534
G1 X154.721 Y110.806 E.01415
G1 X112.809 Y152.717 E1.83101
G1 X112.37 Y152.62 E.0139
G1 X154.616 Y110.374 E1.84563
G2 X154.508 Y109.946 I-3.21 J.585 E.01364
G1 X111.95 Y152.504 E1.85924
G3 X111.532 Y152.385 I.885 J-3.909 E.01341
G1 X154.377 Y109.541 E1.87178
G1 X154.247 Y109.135 E.01316
G1 X111.131 Y152.25 E1.88359
G3 X110.734 Y152.112 I1.077 J-3.736 E.01302
G1 X154.111 Y108.735 E1.89505
G1 X153.954 Y108.355 E.01268
G1 X110.35 Y151.959 E1.90494
G3 X109.97 Y151.803 I1.251 J-3.582 E.01269
G1 X153.797 Y107.976 E1.91467
G2 X153.635 Y107.602 I-2.378 J.809 E.01261
G1 X109.604 Y151.633 E1.9236
G3 X109.241 Y151.46 I1.098 J-2.76 E.01243
G1 X153.453 Y107.248 E1.9315
G1 X153.271 Y106.894 E.0123
G1 X108.895 Y151.27 E1.9387
G1 X108.548 Y151.08 E.0122
G1 X153.087 Y106.542 E1.94576
G1 X152.881 Y106.211 E.01203
G1 X108.204 Y150.889 E1.95185
G1 X107.877 Y150.68 E.01199
G1 X152.676 Y105.881 E1.95717
G1 X152.471 Y105.55 E.01203
G1 X107.55 Y150.471 E1.9625
G1 X107.237 Y150.247 E.01187
G1 X152.243 Y105.241 E1.96619
G1 X152.015 Y104.933 E.01184
G1 X106.925 Y150.023 E1.96987
G3 X106.626 Y149.786 I2.035 J-2.877 E.0118
G1 X151.788 Y104.625 E1.97298
G2 X151.542 Y104.334 I-1.909 J1.362 E.01177
G1 X106.329 Y149.547 E1.97525
G3 X106.045 Y149.295 I1.743 J-2.25 E.01174
G1 X151.292 Y104.048 E1.97674
G1 X151.042 Y103.761 E.01174
G1 X105.766 Y149.038 E1.97802
G1 X105.486 Y148.781 E.01172
G1 X150.78 Y103.488 E1.97875
G1 X150.508 Y103.223 E.01171
G1 X105.218 Y148.513 E1.97861
G1 X104.957 Y148.239 E.01171
G1 X150.236 Y102.959 E1.97816
G2 X149.957 Y102.702 I-1.716 J1.586 E.01173
G1 X104.701 Y147.959 E1.97714
G1 X104.454 Y147.669 E.01175
G1 X149.664 Y102.459 E1.97507
G1 X149.37 Y102.217 E.01176
G1 X104.211 Y147.376 E1.97288
G1 X103.98 Y147.071 E.01182
G1 X149.073 Y101.977 E1.97003
G1 X148.758 Y101.757 E.01189
G1 X103.749 Y146.766 E1.96631
G1 X103.533 Y146.446 E.01192
G1 X148.442 Y101.537 E1.96198
G1 X148.126 Y101.316 E.01189
G1 X103.316 Y146.127 E1.95765
G3 X103.114 Y145.792 I2.98 J-2.03 E.01207
G1 X147.789 Y101.118 E1.95172
G1 X147.45 Y100.92 E.01211
G1 X102.913 Y145.458 E1.94573
G3 X102.725 Y145.109 I3.12 J-1.907 E.01223
G1 X147.111 Y100.723 E1.93914
G2 X146.753 Y100.545 I-1.27 J2.114 E.01237
G1 X102.539 Y144.759 E1.93159
G3 X102.366 Y144.395 I3.266 J-1.773 E.01244
G1 X146.39 Y100.371 E1.9233
M73 P85 R3
G1 X146.028 Y100.198 E.01242
G1 X102.197 Y144.029 E1.91487
G3 X102.041 Y143.649 I3.425 J-1.631 E.0127
G1 X145.646 Y100.044 E1.90499
G1 X145.258 Y99.896 E.01282
G1 X101.888 Y143.266 E1.89473
G3 X101.749 Y142.868 I3.599 J-1.475 E.01302
G1 X144.87 Y99.747 E1.88383
G2 X144.459 Y99.622 I-.976 J2.46 E.01328
G1 X101.614 Y142.467 E1.87179
G3 X101.496 Y142.049 I3.792 J-1.303 E.01341
G1 X144.045 Y99.501 E1.85885
G2 X143.629 Y99.38 I-.95 J2.491 E.01338
G1 X101.379 Y141.629 E1.84579
G1 X101.283 Y141.19 E.0139
G1 X143.185 Y99.288 E1.83059
G1 X142.74 Y99.197 E.01402
G1 X101.192 Y140.745 E1.81515
G1 X101.122 Y140.279 E.01456
G1 X142.285 Y99.116 E1.79833
G1 X141.807 Y99.057 E.01486
G1 X101.052 Y139.813 E1.78052
G3 X100.999 Y139.329 I3.542 J-.627 E.01505
G1 X141.33 Y98.999 E1.76193
G2 X140.828 Y98.965 I-.494 J3.581 E.01556
G1 X100.959 Y138.833 E1.74176
G3 X100.944 Y138.312 I4.792 J-.399 E.01611
G1 X140.316 Y98.94 E1.72005
G1 X139.78 Y98.94 E.01656
G1 X100.935 Y137.785 E1.69701
G1 X100.935 Y137.248 E.01656
G1 X139.244 Y98.94 E1.67359
G1 X138.708 Y98.94 E.01656
G1 X100.935 Y136.712 E1.65017
G1 X100.935 Y136.176 E.01656
G1 X138.172 Y98.94 E1.62676
G1 X137.636 Y98.94 E.01656
G1 X100.935 Y135.64 E1.60334
G1 X100.935 Y135.104 E.01656
G1 X137.1 Y98.94 E1.57992
G1 X136.564 Y98.94 E.01656
G1 X100.935 Y134.568 E1.5565
G1 X100.935 Y134.032 E.01656
G1 X136.028 Y98.94 E1.53309
G1 X135.492 Y98.939 E.01656
G1 X100.935 Y133.496 E1.50967
G1 X100.935 Y132.959 E.01656
G1 X134.956 Y98.939 E1.48625
G1 X134.419 Y98.939 E.01656
G1 X100.935 Y132.423 E1.46284
G1 X100.935 Y131.887 E.01656
G1 X133.883 Y98.939 E1.43942
G1 X133.347 Y98.939 E.01656
G1 X100.935 Y131.351 E1.416
G1 X100.935 Y130.815 E.01656
G1 X132.811 Y98.939 E1.39259
G1 X132.275 Y98.939 E.01656
G1 X100.935 Y130.279 E1.36917
G1 X100.935 Y129.743 E.01656
G1 X131.739 Y98.939 E1.34575
G1 X131.203 Y98.939 E.01656
G1 X100.935 Y129.207 E1.32233
G1 X100.935 Y128.67 E.01656
G1 X130.667 Y98.938 E1.29892
G1 X130.131 Y98.938 E.01656
G1 X100.935 Y128.134 E1.2755
G1 X100.935 Y127.598 E.01656
G1 X129.595 Y98.938 E1.25208
G1 X129.059 Y98.938 E.01656
G1 X100.935 Y127.062 E1.22867
G1 X100.935 Y126.526 E.01656
G1 X128.523 Y98.938 E1.20525
G1 X127.987 Y98.938 E.01656
G1 X100.935 Y125.99 E1.18183
G1 X100.935 Y125.454 E.01656
G1 X127.451 Y98.938 E1.15842
G1 X126.915 Y98.938 E.01656
G1 X100.935 Y124.918 E1.135
G1 X100.935 Y124.381 E.01656
G1 X126.379 Y98.938 E1.11158
G1 X125.843 Y98.937 E.01656
G1 X100.935 Y123.845 E1.08816
G1 X100.935 Y123.309 E.01656
G1 X125.307 Y98.937 E1.06475
G1 X124.771 Y98.937 E.01656
G1 X100.935 Y122.773 E1.04133
G1 X100.935 Y122.237 E.01656
G1 X124.235 Y98.937 E1.01791
G1 X123.699 Y98.937 E.01656
G1 X100.935 Y121.701 E.9945
G1 X100.935 Y121.165 E.01656
G1 X123.163 Y98.937 E.97108
G1 X122.627 Y98.937 E.01656
G1 X100.935 Y120.629 E.94766
G1 X100.935 Y120.092 E.01656
G1 X122.091 Y98.937 E.92424
G1 X121.555 Y98.937 E.01656
G1 X100.935 Y119.556 E.90083
G1 X100.935 Y119.02 E.01656
G1 X121.019 Y98.936 E.87741
M73 P86 R3
G1 X120.483 Y98.936 E.01656
G1 X100.935 Y118.484 E.85399
G1 X100.935 Y117.948 E.01656
G1 X119.947 Y98.936 E.83058
G1 X119.411 Y98.936 E.01656
G1 X100.935 Y117.412 E.80716
G1 X100.935 Y116.876 E.01656
G1 X118.875 Y98.936 E.78374
G1 X118.339 Y98.936 E.01656
G1 X100.935 Y116.34 E.76033
G1 X100.935 Y115.803 E.01656
G1 X117.803 Y98.936 E.73691
G1 X117.267 Y98.936 E.01656
G1 X100.935 Y115.267 E.71349
G1 X100.935 Y114.731 E.01656
G1 X116.731 Y98.935 E.69007
G1 X116.195 Y98.935 E.01656
G1 X100.935 Y114.195 E.66666
G3 X100.945 Y113.649 I10.104 J-.093 E.01687
G1 X115.649 Y98.945 E.64239
G2 X115.094 Y98.964 I-.059 J6.434 E.01716
G1 X100.967 Y113.092 E.6172
G1 X101.023 Y112.499 E.01838
G1 X114.508 Y99.014 E.58913
G2 X113.902 Y99.084 I.35 J5.7 E.01885
G1 X101.084 Y111.902 E.55998
G1 X101.189 Y111.261 E.02007
G1 X113.261 Y99.189 E.52738
G2 X112.58 Y99.333 I.989 J6.345 E.02149
G1 X101.333 Y110.58 E.49136
G3 X101.522 Y109.855 I6.782 J1.38 E.02316
G1 X111.855 Y99.522 E.45144
G2 X111.072 Y99.77 I1.892 J7.352 E.0254
G1 X101.77 Y109.072 E.40638
G3 X102.098 Y108.208 I8.13 J2.591 E.02856
G1 X110.208 Y100.098 E.35431
G2 X109.218 Y100.551 I7.964 J18.684 E.03363
G1 X102.555 Y107.214 E.29109
G1 X103.093 Y106.232 E.03461
G1 X103.255 Y105.978 E.00931
G1 X107.986 Y101.247 E.20665
G2 X105.373 Y103.324 I8.399 J13.249 E.1033
G1 X103.76 Y104.937 E.07048
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X105.174 Y103.523 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
G17
G3 Z6.8 I-1.216 J.041 P1  F30000
G1 X106.752 Y150.305 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.356 Y149.997 E.01664
G3 X100.602 Y137.996 I9.658 J-12.01 E.4565
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.387 Y98.607 E.80881
G3 X155.398 Y114.004 I-.389 J15.396 E.78959
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.02 Y150.502 I.01 J-15.412 E.31823
G1 X106.801 Y150.34 E.00904
G1 X106.515 Y150.617 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.111 Y150.302 E.01573
G3 X100.21 Y137.999 I9.903 J-12.316 E.43355
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.397 Y98.215 E.7496
G3 X155.79 Y114.001 I-.4 J15.788 E.74992
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.791 Y150.82 I.013 J-15.804 E.3022
G1 X106.563 Y150.652 E.0087
M204 S10000
; WIPE_START
G1 F24000
G1 X106.111 Y150.302 E-.21734
G1 X105.456 Y149.753 E-.32484
G1 X105.04 Y149.359 E-.21782
; WIPE_END
G1 E-.04 F1800
G1 X111.358 Y152.506 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421942
G1 F15000
G1 X111.017 Y152.165 E.0149
G1 X111.323 Y151.935 E.01182
G1 X111.87 Y152.482 E.02391
G2 X112.589 Y152.665 I1.713 J-5.213 E.02295
G1 X111.575 Y151.651 E.04429
G1 X111.759 Y151.34 E.01117
G1 X111.804 Y151.344 E.00139
G1 X113.265 Y152.804 E.06381
G2 X113.909 Y152.913 I1.125 J-4.7 E.02021
G1 X112.329 Y151.332 E.06905
G1 X112.777 Y151.245 E.01411
G1 X114.52 Y152.988 E.07615
G1 X115.104 Y153.036 E.01808
G1 X113.361 Y151.293 E.07612
G2 X113.937 Y151.333 I.419 J-1.887 E.01789
G1 X115.659 Y153.055 E.07523
G2 X116.205 Y153.065 I.447 J-10.088 E.01685
G1 X114.453 Y151.313 E.0765
G1 X114.693 Y151.343 E.00746
G1 X115.022 Y151.346 E.01016
G1 X116.741 Y153.065 E.07508
G1 X117.277 Y153.065 E.01656
G1 X115.482 Y151.269 E.07842
G1 X115.544 Y151.251 E.00201
G1 X115.792 Y151.315 E.00791
G1 X116.103 Y151.354 E.00966
G1 X117.813 Y153.065 E.0747
G1 X118.349 Y153.065 E.01656
G1 X116.612 Y151.328 E.07587
G1 X117.035 Y151.214 E.01352
G1 X118.885 Y153.065 E.08082
G1 X119.421 Y153.065 E.01656
G1 X117.397 Y151.041 E.08839
G1 X117.451 Y151.008 E.00194
G1 X117.846 Y151.198 E.01355
G1 X118.194 Y151.301 E.01121
G1 X119.957 Y153.065 E.07701
G1 X120.493 Y153.065 E.01656
G1 X118.778 Y151.35 E.0749
G3 X118.838 Y151.349 I.032 J.156 E.00184
G1 X119.026 Y151.346 E.00582
G1 X119.275 Y151.311 E.00777
G1 X121.029 Y153.065 E.07661
G1 X121.565 Y153.065 E.01656
G1 X120.499 Y151.999 E.04655
G2 X121.073 Y152.036 I.411 J-1.901 E.01781
G1 X122.101 Y153.065 E.04493
G1 X122.637 Y153.065 E.01656
G1 X121.583 Y152.011 E.04603
G1 X121.78 Y151.963 E.00625
G1 X121.988 Y151.88 E.00692
G1 X123.173 Y153.065 E.05175
G1 X123.709 Y153.065 E.01656
G1 X122.33 Y151.686 E.06024
G1 X122.481 Y151.553 E.00621
G1 X122.595 Y151.415 E.00553
G1 X124.245 Y153.065 E.07206
G1 X124.781 Y153.065 E.01656
G1 X123.035 Y151.318 E.07628
G2 X123.594 Y151.349 I.388 J-1.956 E.01736
G1 X125.317 Y153.065 E.0751
G1 X125.853 Y153.065 E.01656
G1 X124.088 Y151.299 E.07712
G1 X124.501 Y151.176 E.01331
G1 X126.389 Y153.065 E.08248
G1 X126.925 Y153.065 E.01656
G1 X125.175 Y151.314 E.07645
G2 X125.729 Y151.333 I.357 J-2.406 E.01717
G1 X127.461 Y153.065 E.07565
G1 X127.997 Y153.065 E.01656
G1 X126.251 Y151.318 E.07629
G1 X126.818 Y151.35 E.01756
G1 X128.533 Y153.065 E.07491
G1 X129.069 Y153.065 E.01656
G1 X127.265 Y151.261 E.07879
G1 X127.634 Y151.093 E.0125
G1 X129.605 Y153.065 E.08611
G1 X130.141 Y153.065 E.01656
G1 X127.933 Y150.857 E.09645
G1 X128.155 Y150.542 E.01188
G1 X130.677 Y153.065 E.11017
G1 X131.213 Y153.065 E.01656
G1 X128.51 Y150.361 E.11809
G2 X129.046 Y150.362 I.278 J-9.77 E.01657
G1 X131.749 Y153.065 E.11807
G1 X132.285 Y153.065 E.01656
G1 X130.589 Y151.368 E.07409
G2 X130.772 Y151.378 I.24 J-2.886 E.00566
G1 X131.096 Y151.339 E.01008
G1 X132.821 Y153.065 E.07536
G1 X133.357 Y153.065 E.01656
G1 X131.488 Y151.195 E.08165
G1 X131.849 Y151.021 E.0124
G1 X133.893 Y153.065 E.08928
G1 X134.429 Y153.065 E.01656
G1 X132.211 Y150.846 E.0969
G1 X132.572 Y150.671 E.0124
G1 X134.965 Y153.065 E.10453
G1 X135.502 Y153.065 E.01656
G1 X132.934 Y150.497 E.11216
G1 X133.295 Y150.322 E.0124
G1 X136.038 Y153.065 E.11978
G1 X136.574 Y153.065 E.01656
G1 X133.657 Y150.148 E.12741
G1 X133.837 Y150.054 E.00628
G1 X133.992 Y149.947 E.00582
G1 X137.11 Y153.065 E.13616
G1 X137.646 Y153.065 E.01656
G1 X134.268 Y149.687 E.14755
G1 X134.382 Y149.536 E.00584
G1 X134.476 Y149.359 E.00618
G1 X138.182 Y153.065 E.16184
G1 X138.718 Y153.065 E.01656
G1 X134.606 Y148.953 E.17961
G1 X134.633 Y148.739 E.00666
G1 X134.634 Y148.445 E.00906
G1 X139.254 Y153.065 E.20176
G1 X139.79 Y153.065 E.01656
G1 X100.935 Y114.21 E1.69711
G3 X100.944 Y113.683 I9.76 J-.101 E.01629
G1 X140.317 Y153.056 E1.71975
G2 X140.838 Y153.041 I.12 J-4.806 E.0161
G1 X100.959 Y113.162 E1.74183
G1 X101 Y112.667 E.01536
G1 X141.333 Y153 E1.76171
G2 X141.819 Y152.95 I-.218 J-4.507 E.0151
G1 X101.05 Y112.181 E1.78076
G1 X101.114 Y111.709 E.0147
G1 X142.291 Y152.886 E1.79856
G2 X142.748 Y152.806 I-.505 J-4.25 E.01432
G1 X101.197 Y111.256 E1.81486
G1 X101.289 Y110.812 E.01402
G1 X143.197 Y152.72 E1.83051
G2 X143.628 Y152.615 I-.752 J-4.03 E.01371
G1 X101.38 Y110.367 E1.84534
G3 X101.497 Y109.947 I3.157 J.648 E.01346
G1 X144.056 Y152.507 E1.85894
G1 X144.462 Y152.377 E.01316
G1 X101.615 Y109.53 E1.87148
G1 X101.75 Y109.129 E.01307
G1 X144.867 Y152.246 E1.8833
G2 X145.268 Y152.11 I-.814 J-3.051 E.01306
G1 X101.889 Y108.732 E1.89472
G1 X102.042 Y108.348 E.01274
G1 X145.651 Y151.958 E1.90482
G2 X146.031 Y151.802 I-1.211 J-3.492 E.01269
G1 X102.199 Y107.97 E1.91454
G1 X102.373 Y107.607 E.01241
G1 X146.398 Y151.633 E1.92297
G2 X146.761 Y151.46 I-1.411 J-3.437 E.01243
G1 X102.546 Y107.245 E1.93125
G3 X102.723 Y106.886 I2.737 J1.125 E.01237
G1 X147.111 Y151.274 E1.93883
G2 X147.46 Y151.086 I-1.558 J-3.305 E.01222
G1 X102.917 Y106.543 E1.94558
G3 X103.112 Y106.202 I3.242 J1.629 E.01214
G1 X147.794 Y150.885 E1.95168
G2 X148.128 Y150.683 I-1.697 J-3.181 E.01206
G1 X103.321 Y105.875 E1.95713
G1 X103.53 Y105.548 E.01199
G1 X148.448 Y150.466 E1.96196
G1 X148.767 Y150.25 E.01192
G1 X103.754 Y105.236 E1.96613
G1 X103.978 Y104.924 E.01186
G1 X149.073 Y150.019 E1.96968
G1 X149.377 Y149.788 E.01181
G1 X104.215 Y104.625 E1.97264
G1 X104.454 Y104.328 E.01178
G1 X149.67 Y149.544 E1.97499
M73 P86 R2
G1 X149.96 Y149.298 E.01175
G1 X104.703 Y104.042 E1.97675
G1 X104.957 Y103.759 E.01172
G1 X150.24 Y149.043 E1.97792
G1 X150.515 Y148.782 E.01171
G1 X105.218 Y103.485 E1.97851
G1 X105.486 Y103.217 E.01171
G1 X150.783 Y148.514 E1.9785
G1 X151.043 Y148.238 E.01171
G1 X105.761 Y102.955 E1.97789
G1 X106.043 Y102.702 E.01172
G1 X151.299 Y147.957 E1.97671
G1 X151.541 Y147.664 E.01176
G1 X106.331 Y102.453 E1.97472
G1 X106.632 Y102.218 E.01179
G1 X151.784 Y147.37 E1.97217
M73 P87 R2
G2 X152.023 Y147.074 I-2.085 J-1.935 E.01178
G1 X106.933 Y101.983 E1.96951
G3 X107.235 Y101.749 I1.875 J2.109 E.01181
G1 X152.248 Y146.762 E1.9661
G2 X152.471 Y146.45 I-2.772 J-2.224 E.01187
G1 X107.554 Y101.532 E1.96193
G1 X107.874 Y101.316 E.01192
G1 X152.68 Y146.123 E1.9571
G1 X152.889 Y145.796 E.01199
G1 X108.208 Y101.114 E1.95164
G1 X108.542 Y100.913 E.01206
G1 X153.081 Y145.451 E1.94539
G1 X153.271 Y145.105 E.01219
G1 X108.891 Y100.725 E1.93847
G1 X109.241 Y100.539 E.01225
G1 X153.461 Y144.759 E1.93146
G2 X153.633 Y144.395 I-2.625 J-1.467 E.01244
G1 X109.604 Y100.366 E1.92312
G1 X109.971 Y100.197 E.01247
G1 X153.803 Y144.029 E1.91453
G2 X153.959 Y143.65 I-3.333 J-1.594 E.01269
G1 X110.35 Y100.041 E1.90477
G1 X110.734 Y99.888 E.01274
G1 X154.112 Y143.266 E1.8947
G2 X154.25 Y142.869 I-3.598 J-1.475 E.01301
G1 X111.131 Y99.75 E1.88338
G1 X111.532 Y99.615 E.01307
G1 X154.385 Y142.468 E1.87177
G2 X154.5 Y142.046 I-3.053 J-1.053 E.01351
G1 X111.95 Y99.496 E1.85852
G3 X112.37 Y99.38 I1.28 J3.808 E.01346
G1 X154.611 Y141.621 E1.84507
G2 X154.721 Y141.195 I-3.091 J-1.019 E.01361
G1 X112.809 Y99.283 E1.83065
G3 X113.252 Y99.19 I1.075 J4.044 E.014
G1 X154.807 Y140.745 E1.81505
G2 X154.886 Y140.288 I-4.173 J-.96 E.01432
G1 X113.713 Y99.115 E1.7984
G3 X114.184 Y99.05 I.843 J4.35 E.01468
G1 X154.951 Y139.817 E1.78065
G2 X155 Y139.33 I-4.459 J-.703 E.0151
G1 X114.667 Y98.997 E1.76172
G3 X115.165 Y98.959 I.731 J6.308 E.01543
G1 X155.041 Y138.835 E1.74173
G2 X155.056 Y138.314 I-4.793 J-.4 E.0161
G1 X115.686 Y98.944 E1.71962
G3 X116.213 Y98.935 I.423 J9.677 E.01629
G1 X155.065 Y137.787 E1.69697
G1 X155.064 Y137.25 E.01656
G1 X116.75 Y98.936 E1.67355
G1 X117.286 Y98.936 E.01656
G1 X155.064 Y136.714 E1.65012
G1 X155.064 Y136.178 E.01656
G1 X117.822 Y98.936 E1.6267
G1 X118.358 Y98.936 E.01656
G1 X155.064 Y135.642 E1.60328
G1 X155.064 Y135.106 E.01656
G1 X118.894 Y98.936 E1.57985
G1 X119.43 Y98.936 E.01656
G1 X155.064 Y134.57 E1.55643
G1 X155.064 Y134.034 E.01656
G1 X119.966 Y98.936 E1.53301
G1 X120.502 Y98.936 E.01656
G1 X155.064 Y133.497 E1.50958
G1 X155.063 Y132.961 E.01656
G1 X121.039 Y98.936 E1.48616
G1 X121.575 Y98.937 E.01656
G1 X155.063 Y132.425 E1.46274
G1 X155.063 Y131.889 E.01656
G1 X122.111 Y98.937 E1.43931
G1 X122.647 Y98.937 E.01656
G1 X155.063 Y131.353 E1.41589
G1 X155.063 Y130.817 E.01656
G1 X123.183 Y98.937 E1.39247
G1 X123.719 Y98.937 E.01656
G1 X155.063 Y130.281 E1.36905
G1 X155.063 Y129.744 E.01656
G1 X124.255 Y98.937 E1.34562
G1 X124.792 Y98.937 E.01656
G1 X155.063 Y129.208 E1.3222
G1 X155.062 Y128.672 E.01656
G1 X125.328 Y98.937 E1.29878
G1 X125.864 Y98.937 E.01656
G1 X155.062 Y128.136 E1.27535
G1 X155.062 Y127.6 E.01656
G1 X126.4 Y98.938 E1.25193
G1 X126.936 Y98.938 E.01656
G1 X155.062 Y127.064 E1.22851
G1 X155.062 Y126.528 E.01656
G1 X127.472 Y98.938 E1.20508
G1 X128.008 Y98.938 E.01656
G1 X155.062 Y125.991 E1.18166
G1 X155.062 Y125.455 E.01656
G1 X128.545 Y98.938 E1.15824
G1 X129.081 Y98.938 E.01656
G1 X155.062 Y124.919 E1.13481
M73 P88 R2
G1 X155.061 Y124.383 E.01656
G1 X129.617 Y98.938 E1.11139
G1 X130.153 Y98.938 E.01656
G1 X155.061 Y123.847 E1.08797
G1 X155.061 Y123.311 E.01656
G1 X130.689 Y98.939 E1.06454
G1 X131.225 Y98.939 E.01656
G1 X155.061 Y122.775 E1.04112
G1 X155.061 Y122.238 E.01656
G1 X131.761 Y98.939 E1.0177
G1 X132.297 Y98.939 E.01656
G1 X155.061 Y121.702 E.99428
G1 X155.061 Y121.166 E.01656
G1 X132.834 Y98.939 E.97085
G1 X133.37 Y98.939 E.01656
G1 X155.061 Y120.63 E.94743
G1 X155.06 Y120.094 E.01656
G1 X133.906 Y98.939 E.92401
G1 X134.442 Y98.939 E.01656
G1 X155.06 Y119.558 E.90058
G1 X155.06 Y119.022 E.01656
G1 X134.978 Y98.939 E.87716
G1 X135.514 Y98.94 E.01656
G1 X155.06 Y118.485 E.85374
G1 X155.06 Y117.949 E.01656
G1 X136.05 Y98.94 E.83031
G1 X136.587 Y98.94 E.01656
G1 X155.06 Y117.413 E.80689
G1 X155.06 Y116.877 E.01656
G1 X137.123 Y98.94 E.78347
G1 X137.659 Y98.94 E.01656
G1 X155.06 Y116.341 E.76004
G1 X155.059 Y115.805 E.01656
G1 X138.195 Y98.94 E.73662
G1 X138.731 Y98.94 E.01656
G1 X155.059 Y115.269 E.7132
G1 X155.059 Y114.732 E.01656
G1 X139.267 Y98.94 E.68978
G1 X139.803 Y98.941 E.01656
G1 X155.059 Y114.196 E.66635
G1 X155.059 Y113.66 E.01656
G1 X140.339 Y98.941 E.64293
G3 X140.903 Y98.968 I.018 J5.375 E.01744
G1 X155.032 Y113.097 E.61713
G2 X154.982 Y112.511 I-4.348 J.077 E.01818
G1 X141.489 Y99.018 E.58936
G1 X142.1 Y99.093 E.01901
G1 X154.907 Y111.9 E.55942
G2 X154.809 Y111.266 I-4.723 J.406 E.01983
G1 X142.739 Y99.196 E.52719
G1 X143.414 Y99.335 E.02129
G1 X154.67 Y110.591 E.49163
G2 X154.482 Y109.867 I-5.429 J1.022 E.02311
G1 X144.145 Y99.53 E.45153
G1 X144.916 Y99.765 E.02489
G1 X154.228 Y109.077 E.40674
G2 X153.891 Y108.205 I-5.525 J1.629 E.0289
G1 X145.784 Y100.097 E.35412
G1 X145.953 Y100.162 E.00558
G1 X146.782 Y100.559 E.02841
G1 X153.434 Y107.211 E.29056
G2 X152.736 Y105.977 I-7.929 J3.672 E.04387
G1 X148 Y101.241 E.20684
G1 X149.117 Y102.008 E.04184
G1 X150.06 Y102.787 E.03779
G3 X152.222 Y104.927 I-77.985 J80.952 E.09395
G1 X132.92 Y146.731 F30000
G1 F15000
G1 X100.935 Y114.746 E1.39707
G1 X100.935 Y115.282 E.01656
G1 X131.502 Y145.849 E1.3351
G2 X130.776 Y145.659 I-.76 J1.426 E.02337
G1 X100.935 Y115.818 E1.30342
G1 X100.935 Y116.354 E.01656
G1 X130.287 Y145.706 E1.28204
G1 X130.265 Y145.711 E.00069
G2 X129.899 Y145.854 I.35 J1.437 E.01218
G1 X100.935 Y116.89 E1.2651
G1 X100.935 Y117.426 E.01656
G1 X129.601 Y146.093 E1.2521
G1 X129.486 Y146.222 E.00534
G1 X129.371 Y146.398 E.00652
G1 X100.935 Y117.962 E1.24205
G1 X100.935 Y118.498 E.01656
G1 X129.166 Y146.729 E1.23306
G1 X128.63 Y146.729 E.01656
G1 X100.935 Y119.035 E1.20965
G1 X100.935 Y119.571 E.01656
G1 X128.154 Y146.789 E1.18886
G1 X127.773 Y146.944 E.0127
G1 X100.935 Y120.107 E1.17221
G1 X100.935 Y120.643 E.01656
G1 X125.958 Y145.665 E1.09295
G2 X125.421 Y145.665 I-.277 J10.911 E.01657
G1 X100.935 Y121.179 E1.06952
G1 X100.935 Y121.715 E.01656
G1 X124.955 Y145.735 E1.04916
G1 X124.645 Y145.86 E.01034
G1 X124.48 Y145.795 E.00548
G1 X100.935 Y122.251 E1.02839
G1 X100.935 Y122.787 E.01656
G1 X123.807 Y145.658 E.99899
G1 X123.275 Y145.663 E.01641
G1 X100.935 Y123.323 E.97578
G1 X100.935 Y123.859 E.01656
G1 X122.822 Y145.746 E.95599
G1 X122.543 Y145.842 E.00912
G1 X122.269 Y145.728 E.00917
G1 X100.935 Y124.395 E.93181
G1 X100.935 Y124.931 E.01656
G1 X121.652 Y145.647 E.90486
G1 X121.129 Y145.66 E.01616
G1 X100.935 Y125.467 E.88202
G1 X100.935 Y126.003 E.01656
G1 X120.683 Y145.75 E.86254
G1 X120.31 Y145.913 E.01257
G1 X100.935 Y126.539 E.84625
G1 X100.935 Y127.075 E.01656
G1 X119.624 Y145.764 E.81631
G1 X119.362 Y145.7 E.00833
G1 X118.977 Y145.652 E.01199
G1 X100.935 Y127.611 E.78803
G1 X100.935 Y128.147 E.01656
G1 X118.457 Y145.669 E.76534
G1 X118.014 Y145.761 E.01399
G1 X100.935 Y128.683 E.74597
G1 X100.935 Y129.219 E.01656
G1 X117.489 Y145.772 E.72303
G1 X117.151 Y145.68 E.0108
G1 X116.845 Y145.665 E.00947
G1 X100.935 Y129.755 E.69492
G1 X100.935 Y130.291 E.01656
G1 X116.315 Y145.67 E.67175
G1 X116.04 Y145.721 E.00861
G3 X115.791 Y145.682 I.002 J-.834 E.00784
G1 X100.935 Y130.827 E.64886
G1 X100.935 Y131.363 E.01656
G1 X115.237 Y145.665 E.62468
G1 X114.962 Y145.668 E.0085
G1 X114.739 Y145.703 E.00695
G1 X100.935 Y131.899 E.60294
G1 X100.935 Y132.435 E.01656
G1 X114.165 Y145.665 E.57785
G2 X113.63 Y145.666 I-.255 J7.273 E.01653
G1 X100.935 Y132.971 E.55448
G1 X100.935 Y133.507 E.01656
G1 X113.123 Y145.694 E.53233
G1 X112.852 Y145.662 E.00842
G1 X112.572 Y145.68 E.00866
G1 X100.935 Y134.043 E.50829
G1 X100.935 Y134.579 E.01656
G1 X112.023 Y145.667 E.48431
G1 X111.801 Y145.643 E.00692
G1 X111.475 Y145.655 E.01006
G1 X100.935 Y135.115 E.46038
G1 X100.935 Y135.651 E.01656
G1 X111.023 Y145.739 E.44063
G1 X110.868 Y145.788 E.00503
G1 X110.665 Y145.716 E.00665
G1 X110.42 Y145.671 E.00772
G1 X100.935 Y136.187 E.41426
G1 X100.935 Y136.723 E.01656
G1 X109.877 Y145.665 E.39055
M73 P89 R2
G1 X109.611 Y145.674 E.00821
G1 X109.392 Y145.716 E.00689
G1 X100.935 Y137.259 E.36937
G1 X100.935 Y137.795 E.01656
G1 X109.006 Y145.866 E.35251
G1 X108.882 Y145.936 E.00441
G1 X108.639 Y145.838 E.0081
G1 X108.358 Y145.754 E.00904
G1 X100.945 Y138.341 E.3238
G2 X100.964 Y138.896 I5.125 J.099 E.01717
G1 X107.735 Y145.667 E.29574
G1 X107.197 Y145.665 E.01662
G1 X101.012 Y139.48 E.27015
G2 X101.087 Y140.091 I5.673 J-.387 E.01903
G1 X106.661 Y145.665 E.24346
G2 X106.154 Y145.694 I-.147 J1.83 E.01572
G1 X101.196 Y140.735 E.21659
G1 X101.335 Y141.411 E.02129
G1 X105.753 Y145.828 E.19297
G1 X105.593 Y145.907 E.00549
G1 X105.414 Y146.026 E.00664
G1 X101.518 Y142.13 E.17019
G2 X101.764 Y142.912 I7.338 J-1.88 E.02534
G1 X105.153 Y146.301 E.14802
G1 X105.061 Y146.446 E.0053
G1 X104.966 Y146.65 E.00696
G1 X102.09 Y143.774 E.12561
G2 X102.539 Y144.759 I19.396 J-8.241 E.03341
G1 X104.843 Y147.063 E.10065
G1 X104.828 Y147.218 E.00481
G2 X104.828 Y147.584 I7.457 J.192 E.01129
G1 X102.735 Y145.491 E.0914
; WIPE_START
G1 F24000
G1 X104.149 Y146.905 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.775 Y147.215 Z7 F30000
G1 X134.401 Y148.132 Z7
G1 Z6.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.158 Y146.89 E.054
G1 X132.115 Y146.379
G1 X134.427 Y148.692 E.10049
G1 X134.341 Y149.139
G1 X131.116 Y145.914 E.14011
G1 X130.547 Y145.878
G1 X134.16 Y149.491 E.157
G1 X133.895 Y149.759
G1 X130.115 Y145.979 E.16427
G1 X129.794 Y146.192
G1 X133.564 Y149.962 E.16385
G1 X133.205 Y150.136
G1 X129.558 Y146.489 E.15846
G1 X129.382 Y146.847
G1 X132.845 Y150.309 E.15048
G1 X132.485 Y150.483
G1 X128.938 Y146.936 E.15414
G1 X128.414 Y146.945
G1 X132.126 Y150.657 E.16128
G1 X131.766 Y150.831
G1 X128.003 Y147.067 E.16353
G1 X127.663 Y147.261
G1 X131.407 Y151.004 E.16266
G1 X131.014 Y151.144
G1 X127.391 Y147.522 E.1574
G1 X127.31 Y147.441
G1 X125.741 Y145.872 E.06818
G1 X125.221 Y145.885
G1 X130.491 Y151.155 E.22899
M204 S10000
G1 X128.957 Y150.154 F30000
M204 S2000
G1 F12000
G1 X124.815 Y146.012 E.17998
G1 X124.198 Y145.929
G1 X128.414 Y150.145 E.18321
G1 X128.037 Y150.301
G1 X123.593 Y145.857 E.19311
G1 X123.097 Y145.895
G1 X127.844 Y150.641 E.20627
G1 X127.562 Y150.893
G1 X122.68 Y146.01 E.21217
G1 X122.018 Y145.882
G1 X127.2 Y151.064 E.22516
G1 X126.746 Y151.143
G1 X121.453 Y145.85 E.22997
G1 X120.964 Y145.894
G1 X126.166 Y151.096 E.22603
G1 X125.662 Y151.125
G1 X120.556 Y146.02 E.22187
G1 X120.221 Y146.218
G1 X125.088 Y151.085 E.21151
G1 X124.445 Y150.975
G1 X119.385 Y145.915 E.21989
G1 X118.793 Y145.857
G1 X124.035 Y151.098 E.22777
G1 X123.544 Y151.14
G1 X118.305 Y145.902 E.22764
G1 X117.892 Y146.022
G1 X122.962 Y151.092 E.22029
G1 X122.508 Y151.171
G1 X117.248 Y145.911 E.22857
G1 X116.676 Y145.872
G1 X122.271 Y151.467 E.24313
G1 X121.944 Y151.674
G1 X116.173 Y145.903 E.25077
G1 X115.609 Y145.872
G1 X121.544 Y151.807 E.25791
G1 X121.033 Y151.829
G1 X115.076 Y145.872 E.25885
G1 X114.611 Y145.94
G1 X120.44 Y151.769 E.2533
M204 S10000
G1 X119.243 Y151.106 F30000
M204 S2000
G1 F12000
G1 X114.009 Y145.872 E.22743
G1 X113.493 Y145.889
G1 X118.748 Y151.144 E.22835
G1 X118.148 Y151.077
G1 X112.947 Y145.876 E.22601
G1 X112.452 Y145.915
G1 X117.358 Y150.821 E.21319
G1 X117.007 Y151.003
G1 X111.858 Y145.854 E.22374
G1 X111.351 Y145.88
G1 X116.592 Y151.121 E.22773
G1 X116.083 Y151.145
G1 X110.926 Y145.988 E.2241
G1 X110.276 Y145.872
G1 X115.464 Y151.059 E.22541
G1 X115.01 Y151.139
G1 X109.743 Y145.872 E.22886
G1 X109.302 Y145.965
G1 X114.438 Y151.1 E.22315
G1 X113.93 Y151.125
G1 X108.947 Y146.142 E.21655
G1 X108.201 Y145.93
G1 X113.347 Y151.076 E.2236
G1 X112.769 Y151.031
G1 X107.61 Y145.872 E.2242
G1 X107.078 Y145.873
G1 X112.329 Y151.124 E.22817
G1 X111.807 Y151.136
G1 X106.543 Y145.872 E.22874
G1 X106.067 Y145.928
G1 X111.509 Y151.371 E.23651
G1 X111.284 Y151.679
G1 X105.693 Y146.088 E.24296
G1 X105.397 Y146.325
G1 X111 Y151.929 E.2435
G1 X110.653 Y152.114
G1 X105.19 Y146.652 E.23738
G1 X105.057 Y147.051
G1 X109.892 Y151.887 E.21013
G1 X108.861 Y151.389
G1 X105.035 Y147.563 E.16625
G1 X105.035 Y148.096
G1 X107.489 Y150.551 E.10666
M204 S10000
; WIPE_START
G1 F24000
G1 X106.075 Y149.136 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X113.64 Y148.124 Z7 F30000
G1 X130.552 Y145.859 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.140227
G1 F15000
G1 X130.414 Y145.931 E.00124
G1 X130.303 Y145.896 E.00092
G1 X132.053 Y146.441 F30000
; LINE_WIDTH: 0.196596
G1 F15000
G1 X131.93 Y146.353 E.00189
; LINE_WIDTH: 0.156571
G1 X131.807 Y146.266 E.0014
; LINE_WIDTH: 0.110705
G1 X131.645 Y146.15 E.0011
G1 X134.232 Y147.669 F30000
; LINE_WIDTH: 0.107952
G1 F15000
G2 X133.757 Y147.193 I-2.7 J2.221 E.00357
; WIPE_START
G1 F24000
G1 X134.012 Y147.422 E-.38702
G1 X134.232 Y147.669 E-.37298
; WIPE_END
G1 E-.04 F1800
G1 X130.089 Y151.046 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.109379
G1 F15000
G1 X130.05 Y151.019 E.00026
G3 X129.941 Y150.935 I1.133 J-1.573 E.00074
; LINE_WIDTH: 0.139446
G3 X129.599 Y150.582 I1.871 J-2.162 E.00387
; LINE_WIDTH: 0.102796
G1 X129.521 Y150.479 E.00063
G1 X125.396 Y151.145 F30000
; LINE_WIDTH: 0.183711
G1 F15000
G1 X125.222 Y151.056 E.00224
G1 X125.078 Y151.103 E.00173
G1 X117.668 Y150.891 F30000
; LINE_WIDTH: 0.099483
G1 F15000
G1 X117.584 Y150.828 E.00048
; LINE_WIDTH: 0.124777
G1 X117.454 Y150.725 E.00111
G1 X110.303 Y152.072 F30000
; LINE_WIDTH: 0.21453
G1 F15000
G1 X109.954 Y151.825 E.00598
G1 X108.181 Y151.004 F30000
; LINE_WIDTH: 0.111728
G1 F15000
G1 X107.97 Y150.833 E.00152
; LINE_WIDTH: 0.158846
G1 X107.76 Y150.661 E.00256
; LINE_WIDTH: 0.205964
G1 X107.55 Y150.49 E.0036
; WIPE_START
G1 F24000
G1 X107.76 Y150.661 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X106.313 Y149.672 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.110946
G1 F15000
G1 X105.884 Y149.276 E.00323
; LINE_WIDTH: 0.147029
G3 X105.016 Y148.416 I15.431 J-16.443 E.01036
G1 X105.297 Y146.492 F30000
; LINE_WIDTH: 0.100668
G1 F15000
G2 X105.213 Y146.601 I1.502 J1.244 E.00065
G1 X120.142 Y146.297 F30000
; LINE_WIDTH: 0.167341
G1 F15000
G1 X120.013 Y146.196 E.00166
; LINE_WIDTH: 0.137334
G1 X119.91 Y146.12 E.00099
; LINE_WIDTH: 0.10061
G1 X119.817 Y146.055 E.00053
G1 X127.313 Y147.114 F30000
; LINE_WIDTH: 0.272486
G1 F15000
G1 X127.169 Y146.897 E.00487
; LINE_WIDTH: 0.314502
G1 X127.024 Y146.681 E.00576
; LINE_WIDTH: 0.349761
G1 X126.969 Y146.606 E.00233
; LINE_WIDTH: 0.390507
G2 X126.59 Y146.223 I-1.57 J1.174 E.0153
; LINE_WIDTH: 0.340451
G2 X126.086 Y145.867 I-5.367 J7.065 E.01497
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.59 Y146.223 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
G17
G3 Z7 I-.59 J-1.064 P1  F30000
G1 X123.188 Y148.108 Z7
G1 Z6.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X123.733 Y147.9 I.399 J.226 E.01944
G3 X124.097 Y148.108 I-.195 J.764 E.01306
G1 X123.248 Y148.108 E.02611
M204 S10000
G1 X123.209 Y148.915 F30000
M204 S5000
G1 F12000
G1 X123.888 Y148.915 E.02087
G1 X123.87 Y148.947 E.00111
G3 X123.236 Y148.969 I-.323 J-.169 E.02365
M204 S10000
; WIPE_START
G1 F24000
G1 X123.888 Y148.915 E-.34201
G1 X123.87 Y148.947 E-.01892
G1 X123.724 Y149.093 E-.10845
G1 X123.534 Y149.149 E-.10358
G1 X123.349 Y149.085 E-.10203
G1 X123.281 Y149.022 E-.0489
G1 X123.236 Y148.969 E-.03611
; WIPE_END
G1 E-.04 F1800
G1 X118.521 Y149.024 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
M204 S5000
G1 F12000
G3 X118.452 Y148.915 I.269 J-.246 E.00398
G1 X119.131 Y148.915 E.02087
G1 X119.114 Y148.947 E.00111
G3 X118.565 Y149.065 I-.323 J-.169 E.01966
M204 S10000
G1 X118.431 Y148.108 F30000
M204 S5000
G1 F12000
G3 X118.976 Y147.9 I.399 J.226 E.01944
G3 X119.341 Y148.108 I-.195 J.764 E.01306
G1 X118.491 Y148.108 E.02611
M204 S10000
; WIPE_START
G1 F24000
G1 X118.543 Y147.975 E-.05785
G1 X118.67 Y147.907 E-.05893
G1 X118.78 Y147.885 E-.04524
G1 X118.976 Y147.9 E-.0802
G1 X119.183 Y147.981 E-.09014
G1 X119.341 Y148.108 E-.08247
G1 X118.491 Y148.108 E-.34518
; WIPE_END
G1 E-.04 F1800
G1 X112.099 Y147.918 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X112.098 Y148.249 E.01016
G3 X111.71 Y148.131 I-.078 J-.442 E.01295
G3 X111.74 Y147.828 I.245 J-.129 E.0099
G1 X111.766 Y147.816 E.00088
G3 X111.966 Y147.824 I.09 J.289 E.00628
G1 X111.978 Y147.829 E.00039
G3 X112.054 Y147.878 I-.224 J.43 E.00279
M204 S10000
; WIPE_START
G1 F24000
G1 X112.098 Y148.249 E-.19488
G1 X111.845 Y148.225 E-.1328
G1 X111.775 Y148.195 E-.03989
G1 X111.71 Y148.131 E-.04779
G1 X111.685 Y148.046 E-.04598
G1 X111.687 Y147.941 E-.05517
G1 X111.706 Y147.862 E-.04216
G1 X111.74 Y147.828 E-.02495
G1 X111.766 Y147.816 E-.01493
G1 X111.871 Y147.797 E-.05579
G1 X111.966 Y147.824 E-.05161
G1 X111.978 Y147.829 E-.00664
G1 X112.054 Y147.878 E-.04741
; WIPE_END
G1 E-.04 F1800
G1 X107.552 Y148.347 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.742 Y148.304 E.00647
G1 X107.796 Y148.417 E.00416
G3 X107.81 Y149.325 I-1.182 J.472 E.03082
G1 X107.776 Y149.362 E.00164
G3 X107.552 Y149.52 I-.959 J-1.128 E.00913
G1 X107.552 Y148.407 E.03692
G1 X107.159 Y147.856 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X107.579 Y147.86 I.155 J5.325 E.01289
G3 X108.225 Y148.48 I-.038 J.687 E.02994
G3 X108.162 Y149.502 I-1.529 J.42 E.03205
G3 X107.384 Y149.886 I-.732 J-.503 E.02785
G1 X107.159 Y149.889 E.0069
G1 X107.159 Y147.916 E.06062
M204 S10000
; WIPE_START
G1 F24000
G1 X107.579 Y147.86 E-.16073
G1 X107.824 Y147.914 E-.09551
G1 X107.985 Y148.01 E-.07103
G1 X108.118 Y148.182 E-.08263
G1 X108.225 Y148.48 E-.12033
G1 X108.266 Y148.765 E-.10962
G1 X108.268 Y149.081 E-.12014
; WIPE_END
G1 E-.04 F1800
G1 X115.891 Y149.472 Z7.2 F30000
G1 X125.176 Y149.948 Z7.2
G1 Z6.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X125.176 Y147.049 E.08908
G1 X126.128 Y147.049 E.02924
G1 X126.128 Y148.975 E.05918
G2 X126.99 Y148.943 I.378 J-1.456 E.02687
G1 X126.99 Y149.969 E.03153
G3 X126.054 Y149.84 I-.181 J-2.145 E.02928
G1 X126.029 Y149.948 E.00341
G1 X125.236 Y149.948 E.02436
M204 S10000
; WIPE_START
G1 F24000
G1 X125.195 Y147.949 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.836 Y148.108 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X124.865 Y148.448 E.01047
G3 X123.649 Y149.968 I-1.388 J.136 E.06619
G1 X123.649 Y149.998 E.00094
G2 X123.409 Y149.999 I-.118 J.502 E.00744
G1 X123.409 Y149.973 E.0008
G3 X123.222 Y149.944 I.065 J-1.037 E.00584
G3 X122.196 Y148.503 I.431 J-1.393 E.05839
G3 X123.325 Y147.049 I1.427 J-.057 E.06149
G3 X124.637 Y147.59 I.256 J1.24 E.04628
G1 X124.297 Y148.108 E.01905
G1 X124.776 Y148.108 E.01472
M204 S10000
; WIPE_START
G1 F24000
G1 X124.865 Y148.448 E-.13334
G1 X124.846 Y148.79 E-.13025
G1 X124.783 Y149.045 E-.09975
G1 X124.681 Y149.279 E-.0971
G1 X124.538 Y149.493 E-.09788
G1 X124.359 Y149.674 E-.09665
G1 X124.148 Y149.818 E-.09692
G1 X124.128 Y149.826 E-.00811
; WIPE_END
G1 E-.04 F1800
G1 X122.053 Y147.787 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X121.729 Y147.799 E.00995
G2 X121.547 Y148.016 I-.019 J.169 E.01028
G1 X121.547 Y149.168 E.03541
G1 X121.943 Y149.168 E.01215
G1 X121.943 Y149.948 E.02397
G1 X121.547 Y149.948 E.01215
G1 X121.547 Y150.652 E.02161
G1 X120.596 Y150.652 E.02924
G1 X120.596 Y149.948 E.02161
G1 X120.27 Y149.948 E.01001
G1 X120.27 Y149.168 E.02397
G1 X120.596 Y149.168 E.01001
G1 X120.598 Y147.972 E.03675
G3 X120.642 Y147.64 I1.707 J.06 E.01031
G3 X121.33 Y147.032 I.706 J.105 E.03067
G3 X122.053 Y147.068 I.153 J4.232 E.02226
G1 X122.053 Y147.727 E.02027
M204 S10000
; WIPE_START
G1 F24000
G1 X121.729 Y147.799 E-.12596
G1 X121.621 Y147.819 E-.04172
G1 X121.577 Y147.851 E-.02093
G1 X121.547 Y148.016 E-.06359
G1 X121.547 Y149.168 E-.43787
G1 X121.731 Y149.168 E-.06993
; WIPE_END
G1 E-.04 F1800
G1 X120.079 Y148.108 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X120.108 Y148.448 E.01047
G3 X118.892 Y149.968 I-1.388 J.136 E.06619
G1 X118.892 Y149.998 E.00094
G2 X118.652 Y149.999 I-.118 J.502 E.00744
G1 X118.652 Y149.973 E.0008
G3 X118.465 Y149.944 I.065 J-1.037 E.00584
G3 X117.439 Y148.503 I.431 J-1.393 E.05839
G3 X118.569 Y147.049 I1.427 J-.057 E.06149
G3 X119.881 Y147.59 I.256 J1.24 E.04628
G1 X119.54 Y148.108 E.01905
G1 X120.019 Y148.108 E.01472
M204 S10000
; WIPE_START
G1 F24000
G1 X120.108 Y148.448 E-.13334
G1 X120.089 Y148.79 E-.13025
G1 X120.027 Y149.045 E-.09975
G1 X119.925 Y149.279 E-.0971
G1 X119.781 Y149.493 E-.09788
G1 X119.602 Y149.674 E-.09665
M73 P90 R2
G1 X119.392 Y149.818 E-.09692
G1 X119.372 Y149.826 E-.00811
; WIPE_END
G1 E-.04 F1800
G1 X113.47 Y147.049 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X114.426 Y147.049 E.02937
G1 X114.426 Y149.063 E.06188
G2 X114.783 Y149.143 I.371 J-.812 E.01132
G2 X114.842 Y148.889 I-.24 J-.189 E.00828
G1 X114.842 Y147.049 E.05654
G1 X115.793 Y147.049 E.02923
G1 X115.792 Y149.051 E.06152
G2 X116.161 Y149.143 I.349 J-.617 E.01183
G2 X116.215 Y148.888 I-.281 J-.193 E.00822
G1 X116.218 Y147.049 E.05649
G1 X117.165 Y147.049 E.02911
G1 X117.165 Y148.951 E.05843
G3 X116.513 Y149.932 I-.997 J.044 E.03871
G3 X115.554 Y149.739 I-.273 J-1.127 E.03103
G1 X115.554 Y149.653 E.00264
G3 X114.354 Y149.831 I-.71 J-.654 E.0403
G1 X114.327 Y149.948 E.0037
G1 X113.47 Y149.948 E.02634
G1 X113.47 Y147.109 E.08724
M204 S10000
; WIPE_START
G1 F24000
G1 X114.426 Y147.049 E-.36397
G1 X114.426 Y148.091 E-.39603
; WIPE_END
G1 E-.04 F1800
G1 X111.294 Y148.878 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X111.586 Y149.087 E.01105
G2 X112.035 Y149.17 I.335 J-.557 E.01435
G2 X112.091 Y148.981 I-.147 J-.146 E.00631
G3 X111.665 Y148.958 I-.083 J-2.356 E.01314
G3 X110.769 Y148.08 I.1 J-.998 E.04163
G3 X111.76 Y147.028 I.903 J-.142 E.05118
G1 X111.76 Y146.993 E.00107
G2 X112 Y147.024 I.169 J-.373 E.00754
G1 X112 Y147.063 E.0012
G3 X112.405 Y147.246 I-.266 J1.13 E.01376
G3 X112.967 Y147.033 I.544 J.586 E.01892
G1 X113.24 Y147.603 E.01944
G1 X113.091 Y147.723 E.00586
G2 X113.062 Y147.829 I.296 J.138 E.00338
G3 X113.029 Y149.037 I-87.24 J-1.816 E.03715
G3 X112.115 Y149.963 I-.925 J.001 E.04433
G3 X110.879 Y149.514 I-.156 J-1.495 E.0418
G1 X111.261 Y148.928 E.0215
M204 S10000
; WIPE_START
G1 F24000
G1 X111.586 Y149.087 E-.13756
G1 X111.814 Y149.173 E-.09259
G1 X112.035 Y149.17 E-.08414
G1 X112.068 Y149.128 E-.02018
G1 X112.091 Y148.981 E-.05656
G1 X112.091 Y148.981 E-.00002
G1 X111.665 Y148.958 E-.16223
G1 X111.341 Y148.859 E-.12863
G1 X111.168 Y148.748 E-.07808
; WIPE_END
G1 E-.04 F1800
G1 X109.549 Y149.948 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X109.549 Y147.049 E.08908
G1 X110.505 Y147.049 E.02939
G1 X110.505 Y149.948 E.08908
G1 X109.609 Y149.948 E.02755
M204 S10000
G1 X109.603 Y150.223 F30000
M204 S5000
G1 F12000
G3 X109.954 Y150.011 I.424 J.305 E.01295
G1 X110.1 Y150.011 E.0045
G3 X109.571 Y150.273 I-.073 J.518 E.08163
M204 S10000
; WIPE_START
G1 F24000
G1 X109.715 Y150.108 E-.08343
G1 X109.787 Y150.063 E-.03219
G1 X109.954 Y150.011 E-.06647
G1 X110.1 Y150.011 E-.05559
G1 X110.266 Y150.062 E-.0658
G1 X110.337 Y150.105 E-.03178
G1 X110.453 Y150.219 E-.06157
G1 X110.53 Y150.367 E-.06366
G1 X110.549 Y150.449 E-.03194
G1 X110.549 Y150.609 E-.06065
G1 X110.498 Y150.769 E-.06408
G1 X110.454 Y150.841 E-.03212
G1 X110.338 Y150.956 E-.06177
G1 X110.224 Y151.015 E-.04896
; WIPE_END
G1 E-.04 F1800
G1 X117.812 Y150.193 Z7.2 F30000
G1 X130.552 Y148.815 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X130.552 Y148.223 E.01964
G1 X131.192 Y148.521 E.02343
G1 X130.606 Y148.79 E.02137
G1 X130.099 Y149.369 F30000
G1 F15476.087
G1 X127.95 Y149.369 E.0713
G1 X127.95 Y147.721 E.05467
G1 X130.099 Y147.721 E.0713
G1 X130.099 Y146.268 E.04821
G1 X133.642 Y148 E.13082
G1 X133.642 Y149.053 E.03491
G1 X130.099 Y150.764 E.13051
G1 X130.099 Y149.429 E.04428
G1 X130.491 Y149.274 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.126 Y148.524 E.05526
G1 X130.491 Y147.762 E.05541
G1 X130.491 Y146.896 E.02662
G1 X133.25 Y148.245 E.09435
G1 X133.25 Y148.807 E.01726
G1 X130.491 Y150.139 E.09413
G1 X130.491 Y149.334 E.02474
M204 S10000
G1 X130.16 Y148.977 F30000
M204 S5000
G1 F12000
G1 X128.342 Y148.977 E.05585
G1 X128.342 Y148.113 E.02654
G1 X130.16 Y148.113 E.05585
G1 X130.16 Y148.917 E.0247
M204 S10000
; WIPE_START
G1 F24000
G1 X128.342 Y148.977 E-.69103
G1 X128.342 Y148.796 E-.06897
; WIPE_END
G1 E-.04 F1800
G1 X120.757 Y149.646 Z7.2 F30000
G1 X107.883 Y151.09 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X109.105 Y150.43 I-.743 J-2.838 E.04651
G2 X110.938 Y150.392 I.919 J.089 E.10335
G1 X110.859 Y150.053 E.01153
G2 X112.535 Y150.283 I1.125 J-1.98 E.05749
G2 X113.078 Y149.972 I-.582 J-1.647 E.02087
G1 X113.078 Y150.34 E.01222
G1 X114.654 Y150.34 E.05226
G2 X115.536 Y150.18 I.216 J-1.319 E.03033
G2 X117.397 Y149.655 I.683 J-1.139 E.07184
G2 X118.26 Y150.295 I1.606 J-1.266 E.03607
G1 X118.26 Y150.446 E.00503
G1 X118.768 Y150.379 E.017
G1 X119.284 Y150.433 E.01721
G1 X119.284 Y150.286 E.00487
G2 X119.878 Y149.979 I-.716 J-2.108 E.02226
G1 X119.878 Y150.34 E.012
G1 X120.204 Y150.34 E.0108
G1 X120.204 Y151.044 E.02333
G1 X121.939 Y151.044 E.05758
G1 X121.939 Y150.34 E.02333
G1 X122.335 Y150.34 E.01311
G1 X122.335 Y149.88 E.01526
G2 X123.017 Y150.295 I1.583 J-1.838 E.0266
G1 X123.017 Y150.446 E.00503
G1 X123.525 Y150.379 E.017
G1 X124.041 Y150.433 E.01721
G1 X124.041 Y150.286 E.00487
G2 X124.784 Y149.844 I-.881 J-2.327 E.02884
G1 X124.784 Y150.34 E.01646
G1 X126.424 Y150.34 E.0544
G2 X127.382 Y150.368 I.711 J-8.036 E.03179
G1 X127.382 Y148.459 E.06333
G1 X126.52 Y148.643 E.02922
G1 X126.52 Y146.657 E.06587
G1 X124.784 Y146.657 E.05758
G1 X124.784 Y147.143 E.01611
G2 X122.445 Y147.035 I-1.229 J1.236 E.08517
G1 X122.445 Y146.712 E.01069
G2 X121.18 Y146.652 I-.906 J5.708 E.0421
G2 X120.283 Y147.457 I.155 J1.075 E.04237
G2 X119.385 Y146.727 I-1.7 J1.175 E.03892
G2 X117.557 Y147.159 I-.565 J1.69 E.06562
G1 X117.557 Y146.657 E.01666
G1 X113.222 Y146.657 E.14379
G1 X113.204 Y146.618 E.00143
G1 X112.707 Y146.662 E.01654
G2 X112.392 Y146.768 I.134 J.918 E.0111
G1 X112.392 Y146.624 E.00479
G1 X111.925 Y146.633 E.0155
G1 X111.368 Y146.472 E.01922
G1 X111.368 Y146.667 E.00648
G2 X110.897 Y146.857 I.672 J2.349 E.01685
G1 X110.897 Y146.657 E.00663
G1 X109.156 Y146.657 E.05775
G1 X109.156 Y147.341 E.02269
G2 X107.337 Y146.657 I-1.591 J1.47 E.06687
G1 X105.82 Y146.657 E.05032
G1 X105.82 Y149.556 E.09616
G3 X100.602 Y137.996 I10.209 J-11.566 E.43357
G1 X100.602 Y114.004 E.79585
G3 X116.004 Y98.602 I15.412 J.01 E.80241
G1 X140.399 Y98.608 E.80921
G3 X155.398 Y114.004 I-.403 J15.396 E.78918
G1 X155.398 Y137.996 E.79585
G3 X139.996 Y153.398 I-15.412 J-.01 E.80241
G1 X116.004 Y153.398 E.79585
G3 X107.935 Y151.121 I.044 J-15.596 E.2816
; WIPE_START
G1 F24000
G1 X108.501 Y150.856 E-.23764
G1 X108.798 Y150.675 E-.13238
G1 X109.105 Y150.43 E-.14913
G1 X109.121 Y150.666 E-.08998
G1 X109.154 Y150.811 E-.0562
G1 X109.21 Y150.948 E-.05647
G1 X109.269 Y151.029 E-.0382
; WIPE_END
G1 E-.04 F1800
G1 X106.631 Y150.709 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G2 X107.877 Y150.662 I.385 J-6.35 E.03837
G2 X109.243 Y148.774 I-.343 J-1.686 E.07865
G2 X108.657 Y147.413 I-1.917 J.018 E.04673
G2 X107.337 Y147.049 I-1.116 J1.47 E.04311
G1 X106.212 Y147.049 E.03457
G1 X106.212 Y150.389 E.10262
G3 X100.21 Y137.999 I9.834 J-12.413 E.43763
G1 X100.21 Y114.001 E.73736
G3 X116.001 Y98.21 I15.804 J.013 E.76203
G1 X140.409 Y98.216 E.74998
G3 X155.79 Y114.001 I-.413 J15.788 E.74954
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.68 Y150.744 I.033 J-15.886 E.30633
M204 S10000
G1 X107.363 Y150.982 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.150372
G1 F15000
G1 X107.58 Y150.943 E.00193
; LINE_WIDTH: 0.113369
G1 X107.741 Y150.907 E.00095
G1 X109.055 Y150.19 F30000
; LINE_WIDTH: 0.110141
G1 F15000
G1 X109.145 Y150.097 E.00071
; LINE_WIDTH: 0.146744
G1 X109.237 Y149.993 E.00117
; LINE_WIDTH: 0.182908
G1 X109.273 Y149.963 E.00053
G1 X109.294 Y150.002 E.0005
; LINE_WIDTH: 0.13954
G1 X109.315 Y150.04 E.00035
; LINE_WIDTH: 0.120364
G2 X109.336 Y150.191 I.225 J.045 E.00098
G1 X109.421 Y150.145 E.00061
G1 X109.254 Y150.061 F30000
; LINE_WIDTH: 0.139602
G1 F15000
G1 X109.334 Y149.7 E.00291
; WIPE_START
G1 F24000
G1 X109.254 Y150.061 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X110.701 Y149.701 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.134431
G1 F15000
G1 X110.804 Y149.768 E.00091
; LINE_WIDTH: 0.109423
G1 X110.906 Y149.835 E.00066
G1 X111.803 Y150.506 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42202
G1 F15000
G1 X110.349 Y151.961 E.06355
G2 X110.74 Y152.106 I1.109 J-2.397 E.01291
G1 X112.168 Y150.678 E.06237
G2 X112.64 Y150.601 I.023 J-1.341 E.01487
G1 X112.745 Y150.554 E.00355
G1 X112.745 Y150.637 E.00257
G1 X111.137 Y152.245 E.07026
G1 X111.533 Y152.385 E.01299
G1 X113.243 Y150.675 E.07471
G1 X113.775 Y150.679 E.01644
G1 X111.954 Y152.5 E.07955
G1 X112.379 Y152.611 E.01356
G1 X114.307 Y150.683 E.08425
G1 X114.839 Y150.687 E.01644
G1 X112.806 Y152.72 E.08882
G1 X113.262 Y152.801 E.01428
G1 X115.507 Y150.556 E.09808
G1 X115.545 Y150.539 E.00128
G1 X115.866 Y150.66 E.0106
G1 X115.931 Y150.668 E.00203
G1 X113.717 Y152.882 E.09673
G2 X114.187 Y152.947 I.637 J-2.858 E.0147
G1 X116.45 Y150.684 E.09887
G2 X117.433 Y150.173 I-.19 J-1.563 E.03495
G1 X117.468 Y150.203 E.00144
G1 X114.677 Y152.994 E.12194
G1 X115.167 Y153.041 E.01519
G1 X117.778 Y150.429 E.11407
G1 X117.927 Y150.515 E.00531
G1 X117.927 Y150.816 E.00932
G1 X115.687 Y153.056 E.09785
G2 X116.215 Y153.065 I.424 J-9.753 E.0163
G1 X118.533 Y150.746 E.10128
G3 X119.07 Y150.746 I.269 J1.121 E.01673
G1 X116.751 Y153.065 E.1013
G1 X117.287 Y153.065 E.01656
G1 X119.33 Y151.022 E.08923
G3 X119.801 Y151.087 I.08 J1.16 E.01479
G1 X117.823 Y153.065 E.08639
G1 X118.359 Y153.065 E.01656
G1 X120.047 Y151.377 E.07373
G1 X120.583 Y151.377 E.01656
G1 X118.895 Y153.065 E.07373
G1 X119.432 Y153.065 E.01656
G1 X121.119 Y151.377 E.07373
G1 X121.655 Y151.377 E.01656
G1 X119.798 Y153.234 E.08114
G1 X120 Y150.628 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.190164
G1 F15000
G1 X119.674 Y150.611 E.00391
; LINE_WIDTH: 0.191508
G1 X119.629 Y150.592 E.0006
; LINE_WIDTH: 0.227663
G1 X119.583 Y150.573 E.00074
G3 X119.581 Y150.387 I1.185 J-.108 E.0028
G1 X119.862 Y149.731 F30000
; LINE_WIDTH: 0.120445
G1 F15000
G2 X120.074 Y149.549 I-3.154 J-3.89 E.00176
G1 X120.327 Y148.972 F30000
; LINE_WIDTH: 0.155068
G1 F15000
G1 X120.353 Y148.535 E.00401
G1 X120.333 Y147.965 E.00521
; LINE_WIDTH: 0.179864
G1 X120.333 Y147.902 E.0007
G1 X120.355 Y147.873 E.00042
; LINE_WIDTH: 0.131692
G1 X120.377 Y147.843 E.00027
; LINE_WIDTH: 0.105159
G1 X120.395 Y147.77 E.00038
G1 X120.333 Y147.902 F30000
; LINE_WIDTH: 0.174657
G1 F15000
G1 X120.048 Y147.693 E.0038
; WIPE_START
G1 F24000
G1 X120.333 Y147.902 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.416 Y147.318 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.122907
G1 F15000
G1 X122.297 Y147.428 E.00105
G1 X122.267 Y147.522 E.00064
G1 X121.905 Y147.989 F30000
; LINE_WIDTH: 0.313612
G1 F15000
G1 X121.875 Y148.339 E.00775
G1 X121.885 Y148.831 E.01086
G1 X122.053 Y148.972 E.00484
G1 X122.157 Y149.298 F30000
; LINE_WIDTH: 0.142403
G1 F15000
G2 X122.27 Y149.532 I.338 J-.018 E.00217
; LINE_WIDTH: 0.111111
G1 X122.363 Y149.626 E.00073
G1 X122.103 Y150.929 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42202
G1 F15000
G1 X122.359 Y150.674 E.01117
G1 X122.668 Y150.674 E.00956
G1 X122.668 Y150.504 E.00525
G1 X122.684 Y150.511 E.00053
G1 X122.684 Y150.826 E.00974
G1 X122.751 Y150.817 E.00211
G1 X120.504 Y153.065 E.09819
G1 X121.04 Y153.065 E.01656
G1 X123.369 Y150.736 E.10173
G1 X123.529 Y150.715 E.00501
G1 X123.888 Y150.752 E.01115
G1 X121.576 Y153.065 E.10102
G1 X122.112 Y153.065 E.01656
G1 X124.503 Y150.674 E.10446
G1 X125.039 Y150.674 E.01656
G1 X122.648 Y153.065 E.10446
G1 X123.184 Y153.065 E.01656
G1 X125.575 Y150.674 E.10446
G1 X126.112 Y150.674 E.01656
G1 X123.721 Y153.065 E.10446
G1 X124.257 Y153.065 E.01656
G1 X126.641 Y150.68 E.10418
G1 X127.162 Y150.695 E.0161
G1 X124.623 Y153.234 E.11093
G1 X124.716 Y149.622 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.112784
G1 F15000
G1 X124.812 Y149.524 E.00078
; LINE_WIDTH: 0.142624
G1 X124.863 Y149.469 E.00061
; LINE_WIDTH: 0.170164
G1 X124.91 Y149.416 E.00074
; LINE_WIDTH: 0.17806
G1 X124.966 Y149.199 E.00246
G1 X124.958 Y149.198 F30000
; LINE_WIDTH: 0.107242
G1 F15000
G3 X124.893 Y149.517 I-7.149 J-1.288 E.00171
G1 X124.855 Y147.912 F30000
; LINE_WIDTH: 0.144759
G1 F15000
G1 X124.93 Y147.59 E.00274
G1 X124.908 Y147.551 E.00037
; LINE_WIDTH: 0.104664
G1 X124.818 Y147.462 E.00064
; WIPE_START
G1 F24000
G1 X124.908 Y147.551 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.142 Y146.107 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42202
G1 F15000
G1 X155.061 Y121.188 E1.08862
G1 X155.061 Y121.724 E.01656
G1 X130.629 Y146.156 E1.06736
G1 X130.989 Y146.332 E.01238
G1 X155.061 Y122.26 E1.05163
G1 X155.061 Y122.796 E.01656
G1 X131.349 Y146.508 E1.03591
G1 X131.709 Y146.684 E.01238
G1 X155.061 Y123.332 E1.02018
G1 X155.061 Y123.868 E.01656
G1 X132.07 Y146.86 E1.00446
G1 X132.43 Y147.036 E.01238
G1 X155.061 Y124.404 E.98873
G1 X155.062 Y124.94 E.01656
G1 X132.79 Y147.212 E.97301
G1 X133.15 Y147.388 E.01238
G1 X155.062 Y125.476 E.95729
G1 X155.062 Y126.012 E.01656
G1 X133.51 Y147.564 E.94156
G1 X133.87 Y147.741 E.01238
G1 X155.062 Y126.548 E.92584
G1 X155.062 Y127.084 E.01656
G1 X133.975 Y148.171 E.92123
G1 X133.975 Y148.707 E.01656
G1 X155.062 Y127.62 E.92124
G1 X155.062 Y128.156 E.01656
G1 X130.154 Y153.065 E1.08818
G1 X130.69 Y153.065 E.01656
G1 X155.062 Y128.692 E1.06477
G1 X155.063 Y129.228 E.01656
G1 X131.226 Y153.065 E1.04135
G1 X131.762 Y153.065 E.01656
G1 X155.063 Y129.764 E1.01793
G1 X155.063 Y130.3 E.01656
G1 X132.299 Y153.065 E.99452
G1 X132.835 Y153.065 E.01656
G1 X155.063 Y130.836 E.9711
G1 X155.063 Y131.372 E.01656
G1 X133.371 Y153.065 E.94768
G1 X133.907 Y153.065 E.01656
G1 X155.063 Y131.908 E.92427
G1 X155.063 Y132.444 E.01656
G1 X134.443 Y153.065 E.90085
G1 X134.979 Y153.065 E.01656
G1 X155.063 Y132.98 E.87743
G1 X155.064 Y133.516 E.01656
G1 X135.515 Y153.065 E.85402
G1 X136.052 Y153.065 E.01656
G1 X155.064 Y134.052 E.8306
G1 X155.064 Y134.588 E.01656
G1 X136.588 Y153.065 E.80718
G1 X137.124 Y153.065 E.01656
G1 X155.064 Y135.124 E.78377
G1 X155.064 Y135.66 E.01656
G1 X137.66 Y153.065 E.76035
G1 X138.196 Y153.065 E.01656
G1 X155.064 Y136.196 E.73693
G1 X155.064 Y136.732 E.01656
G1 X138.732 Y153.065 E.71352
G1 X139.268 Y153.065 E.01656
G1 X155.064 Y137.268 E.6901
G1 X155.065 Y137.804 E.01656
G1 X139.804 Y153.065 E.66668
G2 X140.35 Y153.055 I.093 J-10.103 E.01687
G1 X155.055 Y138.35 E.64242
G3 X155.035 Y138.906 I-5.133 J.094 E.0172
G1 X140.906 Y153.035 E.61725
G1 X141.49 Y152.987 E.01809
G1 X154.987 Y139.49 E.58967
G3 X154.912 Y140.102 I-5.682 J-.393 E.01906
G1 X142.102 Y152.912 E.55963
G2 X142.742 Y152.807 I-.641 J-5.958 E.02005
G1 X154.807 Y140.742 E.5271
G3 X154.664 Y141.422 I-5.084 J-.719 E.02148
G1 X143.418 Y152.668 E.49129
G2 X144.143 Y152.479 I-1.029 J-5.439 E.02315
G1 X154.472 Y142.15 E.45126
G3 X154.23 Y142.928 I-5.858 J-1.395 E.02519
G1 X144.934 Y152.224 E.40615
G2 X145.792 Y151.903 I-1.943 J-6.486 E.02832
G1 X153.903 Y143.792 E.35436
G1 X153.434 Y144.796 E.03425
G1 X146.781 Y151.449 E.29066
G2 X148.013 Y150.753 I-5.805 J-11.714 E.04374
G1 X152.745 Y146.021 E.20674
G1 X152.469 Y146.454 E.01587
G3 X150.679 Y148.624 I-13.438 J-9.262 E.08699
G1 X149.063 Y150.24 E.07062
; WIPE_START
G1 F24000
G1 X150.477 Y148.826 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.851 Y148.506 Z7.2 F30000
G1 X117.559 Y147.443 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.118138
G1 F15000
G1 X117.445 Y147.571 E.00105
; LINE_WIDTH: 0.148468
G1 X117.361 Y147.677 E.00116
G1 X117.359 Y149.194 F30000
; LINE_WIDTH: 0.112421
G1 F15000
G2 X117.44 Y149.377 I.205 J.018 E.00118
; WIPE_START
G1 F24000
G1 X117.368 Y149.288 E-.41551
G1 X117.359 Y149.194 E-.34449
; WIPE_END
G1 E-.04 F1800
G1 X124.598 Y151.613 Z7.2 F30000
G1 X129.448 Y153.234 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42202
G1 F15000
G1 X132.903 Y149.78 E.15092
G1 X131.866 Y150.281 E.03558
G1 X129.082 Y153.065 E.12162
G1 X128.546 Y153.065 E.01656
G1 X130.829 Y150.782 E.09974
G1 X129.792 Y151.283 E.03558
G1 X128.01 Y153.065 E.07786
G1 X127.473 Y153.065 E.01656
G1 X129.766 Y150.772 E.10016
M73 P91 R2
G1 X129.766 Y150.236 E.01656
G1 X126.937 Y153.065 E.12358
G1 X126.401 Y153.065 E.01656
G1 X129.763 Y149.702 E.14689
G1 X129.227 Y149.702 E.01656
G1 X125.865 Y153.065 E.14689
G1 X125.329 Y153.065 E.01656
G1 X128.691 Y149.702 E.14689
G1 X128.155 Y149.702 E.01656
G1 X127.545 Y150.312 E.02664
G1 X127.666 Y149.573 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.20406
G1 F15000
G1 X127.666 Y148.19 E.01815
G1 X129.228 Y147.558 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42202
G1 F15000
G1 X129.766 Y147.019 E.02352
G1 X129.766 Y146.483 E.01656
G1 X128.861 Y147.388 E.03953
G1 X128.325 Y147.388 E.01656
G1 X155.061 Y120.652 E1.16801
G1 X155.06 Y120.116 E.01656
G1 X126.971 Y148.206 E1.22716
G1 X126.853 Y148.231 E.00372
G1 X126.853 Y147.787 E.0137
G1 X155.06 Y119.58 E1.23229
G1 X155.06 Y119.044 E.01656
G1 X126.853 Y147.251 E1.23229
G1 X126.853 Y146.715 E.01656
G1 X155.06 Y118.508 E1.23228
G1 X155.06 Y117.972 E.01656
G1 X126.709 Y146.324 E1.23861
G1 X126.172 Y146.324 E.01656
G1 X155.06 Y117.436 E1.26202
G1 X155.06 Y116.9 E.01656
G1 X125.636 Y146.324 E1.28544
G1 X125.1 Y146.324 E.01656
G1 X155.06 Y116.364 E1.30886
G1 X155.059 Y115.828 E.01656
G1 X124.411 Y146.476 E1.33895
G2 X123.997 Y146.354 I-.57 J1.168 E.01339
G1 X155.059 Y115.292 E1.35702
G1 X155.059 Y114.756 E.01656
G1 X123.506 Y146.31 E1.3785
G1 X123.03 Y146.369 E.0148
G1 X122.841 Y146.438 E.00621
G1 X155.059 Y114.22 E1.40752
G1 X155.059 Y113.684 E.01656
G1 X122.373 Y146.37 E1.42798
G1 X121.885 Y146.322 E.01515
G1 X155.036 Y113.171 E1.4483
G2 X155.001 Y112.67 I-3.715 J.005 E.01554
G1 X121.356 Y146.315 E1.46991
G2 X120.654 Y146.481 I-.082 J1.222 E.02262
G1 X154.943 Y112.192 E1.49802
G1 X154.884 Y111.714 E.01487
G1 X119.951 Y146.648 E1.52615
G2 X119.602 Y146.461 I-.783 J1.043 E.01228
G1 X154.807 Y111.256 E1.53803
G1 X154.721 Y110.806 E.01415
G1 X119.185 Y146.342 E1.55248
G2 X118.67 Y146.32 I-.318 J1.43 E.01599
G1 X154.616 Y110.374 E1.57038
G2 X154.508 Y109.947 I-3.209 J.585 E.01364
G1 X117.967 Y146.487 E1.59637
G1 X117.89 Y146.524 E.00263
G1 X117.89 Y146.324 E.00617
G1 X117.594 Y146.324 E.00914
G1 X154.377 Y109.541 E1.60695
G1 X154.247 Y109.135 E.01316
G1 X117.058 Y146.324 E1.62467
G1 X116.522 Y146.324 E.01656
G1 X154.111 Y108.735 E1.64218
G1 X153.954 Y108.356 E.01268
G1 X115.986 Y146.324 E1.65874
G1 X115.45 Y146.324 E.01656
G1 X153.797 Y107.977 E1.6753
G2 X153.635 Y107.603 I-2.378 J.808 E.01261
G1 X114.914 Y146.324 E1.69164
G1 X114.378 Y146.324 E.01656
G1 X153.453 Y107.248 E1.70712
G1 X153.271 Y106.894 E.0123
G1 X113.841 Y146.324 E1.7226
G1 X113.433 Y146.324 E.01263
G1 X113.405 Y146.266 E.00198
G1 X113.359 Y146.27 E.00142
G1 X153.087 Y106.542 E1.7356
G1 X152.881 Y106.212 E.01203
M73 P91 R1
G1 X112.771 Y146.322 E1.75232
G1 X112.725 Y146.326 E.00143
G1 X112.725 Y146.284 E.00128
G1 X112.264 Y146.293 E.01426
G1 X152.676 Y105.881 E1.76552
G1 X152.471 Y105.55 E.01203
G1 X111.777 Y146.244 E1.77781
G1 X111.361 Y146.123 E.01338
G1 X152.243 Y105.241 E1.78605
G1 X152.015 Y104.933 E.01184
G1 X110.625 Y146.324 E1.80827
G1 X110.089 Y146.324 E.01656
G1 X151.788 Y104.625 E1.82173
G2 X151.542 Y104.334 I-1.908 J1.361 E.01177
G1 X109.383 Y146.493 E1.84185
G1 X108.609 Y146.731 F30000
G1 F15000
G1 X151.292 Y104.048 E1.86472
G1 X151.042 Y103.761 E.01174
G1 X108.361 Y146.443 E1.86464
G2 X107.918 Y146.35 I-.492 J1.253 E.01407
G1 X150.78 Y103.488 E1.87256
G1 X150.508 Y103.223 E.01171
G1 X107.408 Y146.324 E1.88295
G1 X106.872 Y146.324 E.01656
G1 X150.237 Y102.959 E1.8945
G2 X149.957 Y102.702 I-1.716 J1.586 E.01173
G1 X106.166 Y146.493 E1.91314
; WIPE_START
G1 F24000
G1 X107.58 Y145.079 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.356 Y148.12 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.147514
G1 F15000
G1 X107.559 Y148.099 E.00175
; LINE_WIDTH: 0.111009
G3 X107.678 Y148.096 I.098 J1.246 E.00066
; WIPE_START
G1 F24000
G1 X107.559 Y148.099 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X109.103 Y147.591 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.109431
G1 F15000
G1 X109.181 Y147.685 E.00066
; LINE_WIDTH: 0.135815
G1 X109.23 Y147.75 E.00061
; LINE_WIDTH: 0.163249
G1 X109.277 Y147.812 E.00076
; LINE_WIDTH: 0.179815
G1 X109.353 Y147.919 E.00147
G1 X109.33 Y148.065 F30000
; LINE_WIDTH: 0.112087
G1 F15000
G2 X109.266 Y147.71 I-10.056 J1.614 E.00203
; WIPE_START
G1 F24000
G1 X109.33 Y148.065 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X110.781 Y147.125 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.116186
G1 F15000
G2 X110.721 Y147.321 I3.11 J1.057 E.00122
G1 X110.701 Y147.238 F30000
; LINE_WIDTH: 0.11846
G1 F15000
G3 X110.906 Y147.093 I2.414 J3.181 E.00155
; WIPE_START
G1 F24000
G1 X110.701 Y147.238 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X113.249 Y149.06 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.103831
G1 F15000
G1 X113.24 Y149.189 E.00065
; LINE_WIDTH: 0.13348
G1 X113.217 Y149.416 E.00168
; LINE_WIDTH: 0.191164
G1 X113.166 Y149.671 E.00315
G1 X113.014 Y149.756 F30000
; LINE_WIDTH: 0.147665
G1 F15000
G1 X113.274 Y149.468 E.00331
G1 X113.274 Y149.487 F30000
; LINE_WIDTH: 0.0971408
G1 F15000
G1 X113.03 Y149.734 E.00153
G1 X112.994 Y149.735 E.00016
G1 X109.921 Y151.786 F30000
; LINE_WIDTH: 0.245213
G1 F15000
G1 X109.657 Y151.697 E.0046
G3 X109.29 Y151.514 I1.289 J-3.04 E.00677
; LINE_WIDTH: 0.278703
G1 X109.137 Y151.409 E.00357
; LINE_WIDTH: 0.318989
G1 X109.069 Y151.356 E.00194
; LINE_WIDTH: 0.376081
G1 X109.001 Y151.303 E.00234
G3 X108.668 Y150.996 I3.612 J-4.264 E.0123
G1 X108.947 Y150.821 F30000
; LINE_WIDTH: 0.412039
G1 F15000
G1 X108.851 Y151.113 E.00925
; LINE_WIDTH: 0.438915
G1 X108.845 Y151.132 E.00064
; LINE_WIDTH: 0.466336
G1 F14878.994
G1 X108.839 Y151.151 E.00068
; LINE_WIDTH: 0.478613
G1 F14459.724
G1 X109.39 Y151.68 E.02712
; WIPE_START
G1 F24000
G1 X108.839 Y151.151 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.366 Y148.902 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42202
G1 F15000
G1 X105.487 Y148.781 E.00529
G1 X105.487 Y148.245 E.01656
G1 X105.218 Y148.514 E.01176
G3 X104.957 Y148.238 I1.904 J-2.057 E.01173
G1 X105.487 Y147.709 E.02313
G1 X105.487 Y147.173 E.01656
G1 X104.707 Y147.952 E.03404
G1 X104.458 Y147.666 E.01174
G1 X149.664 Y102.46 E1.97495
G1 X149.37 Y102.217 E.01176
G1 X104.212 Y147.375 E1.97285
G1 X103.984 Y147.067 E.01184
G1 X149.074 Y101.977 E1.96985
G1 X148.758 Y101.757 E.01189
G1 X103.756 Y146.758 E1.96601
G3 X103.529 Y146.45 I1.782 J-1.553 E.01186
G1 X148.442 Y101.537 E1.96215
G1 X148.126 Y101.316 E.01189
G1 X103.324 Y146.119 E1.95733
G1 X103.118 Y145.788 E.01203
G1 X147.789 Y101.118 E1.95154
G1 X147.45 Y100.92 E.01211
G1 X102.913 Y145.457 E1.94571
G3 X102.725 Y145.109 I2.47 J-1.563 E.01223
G1 X147.112 Y100.723 E1.93915
G2 X146.753 Y100.545 I-1.27 J2.113 E.01237
G1 X102.539 Y144.759 E1.9316
G3 X102.366 Y144.396 I3.266 J-1.774 E.01244
G1 X146.391 Y100.371 E1.92331
G1 X146.028 Y100.198 E.01242
G1 X102.197 Y144.029 E1.91489
G3 X102.041 Y143.649 I3.425 J-1.631 E.0127
G1 X145.646 Y100.044 E1.905
G1 X145.258 Y99.896 E.01282
G1 X101.888 Y143.266 E1.89474
G3 X101.753 Y142.864 I2.894 J-1.193 E.01309
G1 X144.87 Y99.747 E1.88368
G2 X144.46 Y99.622 I-.976 J2.459 E.01328
G1 X101.623 Y142.459 E1.87144
G1 X101.492 Y142.053 E.01316
G1 X144.045 Y99.501 E1.85902
G2 X143.629 Y99.38 I-.949 J2.486 E.01338
G1 X101.384 Y141.625 E1.84561
G3 X101.279 Y141.194 I3.926 J-1.182 E.01372
G1 X143.185 Y99.288 E1.83076
G1 X142.74 Y99.197 E.01402
G1 X101.193 Y140.744 E1.81511
G3 X101.114 Y140.287 I4.173 J-.96 E.01433
G1 X142.285 Y99.116 E1.79869
G1 X141.808 Y99.057 E.01487
G1 X101.049 Y139.815 E1.78064
G3 X100.999 Y139.329 I4.46 J-.703 E.01511
G1 X141.33 Y98.999 E1.76195
G2 X140.828 Y98.964 I-.501 J3.636 E.01555
G1 X100.959 Y138.833 E1.74179
G3 X100.944 Y138.312 I4.789 J-.399 E.01611
G1 X140.315 Y98.941 E1.72005
G1 X139.779 Y98.941 E.01656
G1 X100.935 Y137.785 E1.69701
M73 P92 R1
G1 X100.935 Y137.249 E.01656
G1 X139.243 Y98.941 E1.67359
G1 X138.707 Y98.94 E.01656
G1 X100.935 Y136.712 E1.65017
G1 X100.935 Y136.176 E.01656
G1 X138.171 Y98.94 E1.62676
G1 X137.635 Y98.94 E.01656
G1 X100.935 Y135.64 E1.60334
G1 X100.935 Y135.104 E.01656
G1 X137.099 Y98.94 E1.57992
G1 X136.563 Y98.94 E.01656
G1 X100.935 Y134.568 E1.55651
G1 X100.935 Y134.032 E.01656
G1 X136.027 Y98.94 E1.53309
G1 X135.491 Y98.94 E.01656
G1 X100.935 Y133.496 E1.50967
G1 X100.935 Y132.96 E.01656
G1 X134.955 Y98.94 E1.48626
G1 X134.419 Y98.939 E.01656
G1 X100.935 Y132.423 E1.46284
G1 X100.935 Y131.887 E.01656
G1 X133.883 Y98.939 E1.43942
G1 X133.347 Y98.939 E.01656
G1 X100.935 Y131.351 E1.416
G1 X100.935 Y130.815 E.01656
G1 X132.811 Y98.939 E1.39259
G1 X132.275 Y98.939 E.01656
G1 X100.935 Y130.279 E1.36917
G1 X100.935 Y129.743 E.01656
G1 X131.739 Y98.939 E1.34575
G1 X131.203 Y98.939 E.01656
G1 X100.935 Y129.207 E1.32234
G1 X100.935 Y128.671 E.01656
G1 X130.667 Y98.939 E1.29892
G1 X130.131 Y98.939 E.01656
G1 X100.935 Y128.134 E1.2755
G1 X100.935 Y127.598 E.01656
G1 X129.595 Y98.938 E1.25209
G1 X129.059 Y98.938 E.01656
G1 X100.935 Y127.062 E1.22867
G1 X100.935 Y126.526 E.01656
G1 X128.523 Y98.938 E1.20525
G1 X127.987 Y98.938 E.01656
G1 X100.935 Y125.99 E1.18183
G1 X100.935 Y125.454 E.01656
G1 X127.451 Y98.938 E1.15842
G1 X126.915 Y98.938 E.01656
G1 X100.935 Y124.918 E1.135
G1 X100.935 Y124.382 E.01656
G1 X126.379 Y98.938 E1.11158
G1 X125.843 Y98.938 E.01656
G1 X100.935 Y123.845 E1.08817
G1 X100.935 Y123.309 E.01656
G1 X125.307 Y98.937 E1.06475
G1 X124.771 Y98.937 E.01656
G1 X100.935 Y122.773 E1.04133
G1 X100.935 Y122.237 E.01656
G1 X124.235 Y98.937 E1.01792
G1 X123.699 Y98.937 E.01656
G1 X100.935 Y121.701 E.9945
G1 X100.935 Y121.165 E.01656
G1 X123.163 Y98.937 E.97108
G1 X122.627 Y98.937 E.01656
G1 X100.935 Y120.629 E.94767
G1 X100.935 Y120.093 E.01656
G1 X122.091 Y98.937 E.92425
G1 X121.555 Y98.937 E.01656
G1 X100.935 Y119.556 E.90083
G1 X100.935 Y119.02 E.01656
G1 X121.019 Y98.936 E.87741
G1 X120.483 Y98.936 E.01656
G1 X100.935 Y118.484 E.854
G1 X100.935 Y117.948 E.01656
G1 X119.947 Y98.936 E.83058
G1 X119.411 Y98.936 E.01656
G1 X100.935 Y117.412 E.80716
G1 X100.935 Y116.876 E.01656
G1 X118.875 Y98.936 E.78375
G1 X118.339 Y98.936 E.01656
G1 X100.935 Y116.34 E.76033
G1 X100.935 Y115.803 E.01656
G1 X117.803 Y98.936 E.73691
G1 X117.267 Y98.936 E.01656
G1 X100.935 Y115.267 E.7135
G1 X100.935 Y114.731 E.01656
G1 X116.731 Y98.936 E.69008
G1 X116.195 Y98.935 E.01656
G1 X100.935 Y114.195 E.66666
G3 X100.945 Y113.649 I10.104 J-.093 E.01687
G1 X115.644 Y98.951 E.64215
G1 X115.085 Y98.974 E.01729
G1 X100.967 Y113.092 E.61678
G1 X101.023 Y112.499 E.01838
G1 X114.508 Y99.014 E.58912
G2 X113.902 Y99.084 I.343 J5.653 E.01884
G1 X101.084 Y111.902 E.55999
G1 X101.189 Y111.261 E.02007
G1 X113.261 Y99.189 E.52738
G2 X112.58 Y99.333 I.989 J6.345 E.02149
G1 X101.344 Y110.569 E.49088
G3 X101.521 Y109.856 I4.468 J.731 E.02273
G1 X111.855 Y99.522 E.45147
G2 X111.072 Y99.77 I1.892 J7.352 E.0254
G1 X101.776 Y109.066 E.40611
G3 X102.098 Y108.208 I6.486 J1.943 E.02832
G1 X110.208 Y100.098 E.35431
G2 X109.218 Y100.551 I7.964 J18.683 E.03364
G1 X102.566 Y107.204 E.29063
G3 X103.27 Y105.963 I11.252 J5.57 E.04411
G1 X107.986 Y101.247 E.20599
G2 X105.372 Y103.324 I8.399 J13.249 E.10331
G1 X103.762 Y104.935 E.07038
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X105.176 Y103.521 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/35
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
G17
G3 Z7.2 I-1.128 J.456 P1  F30000
G1 X123.188 Y148.108 Z7.2
M73 P93 R1
G1 Z7
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X123.733 Y147.9 I.399 J.226 E.01944
G3 X124.097 Y148.108 I-.195 J.764 E.01306
G1 X123.248 Y148.108 E.02611
M204 S10000
G1 X123.209 Y148.915 F30000
M204 S5000
G1 F12000
G1 X123.888 Y148.915 E.02087
G1 X123.87 Y148.947 E.00111
G3 X123.236 Y148.969 I-.323 J-.169 E.02365
M204 S10000
; WIPE_START
G1 F24000
G1 X123.888 Y148.915 E-.34201
G1 X123.87 Y148.947 E-.01892
G1 X123.724 Y149.093 E-.10845
G1 X123.534 Y149.149 E-.10359
G1 X123.349 Y149.085 E-.10202
G1 X123.281 Y149.022 E-.0489
G1 X123.236 Y148.969 E-.03611
; WIPE_END
G1 E-.04 F1800
G1 X118.521 Y149.024 Z7.4 F30000
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F12000
G3 X118.452 Y148.915 I.269 J-.246 E.00398
G1 X119.131 Y148.915 E.02087
G1 X119.114 Y148.947 E.00111
G3 X118.565 Y149.065 I-.323 J-.169 E.01966
M204 S10000
G1 X118.431 Y148.108 F30000
M204 S5000
G1 F12000
G3 X118.976 Y147.9 I.399 J.226 E.01944
G3 X119.341 Y148.108 I-.195 J.764 E.01306
G1 X118.491 Y148.108 E.02611
M204 S10000
; WIPE_START
G1 F24000
G1 X118.543 Y147.975 E-.05785
G1 X118.67 Y147.907 E-.05893
G1 X118.78 Y147.885 E-.04524
G1 X118.976 Y147.9 E-.08019
G1 X119.183 Y147.981 E-.09014
G1 X119.341 Y148.108 E-.08247
G1 X118.491 Y148.108 E-.34518
; WIPE_END
G1 E-.04 F1800
G1 X112.099 Y147.918 Z7.4 F30000
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X112.098 Y148.249 E.01015
G3 X111.71 Y148.131 I-.078 J-.442 E.01295
G3 X111.74 Y147.828 I.245 J-.129 E.0099
G1 X111.766 Y147.816 E.00088
G3 X111.966 Y147.824 I.09 J.289 E.00628
G3 X112.055 Y147.877 I-.146 J.345 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X112.098 Y148.249 E-.19526
G1 X111.845 Y148.225 E-.13268
G1 X111.775 Y148.195 E-.03986
G1 X111.71 Y148.131 E-.04774
G1 X111.685 Y148.046 E-.04595
G1 X111.687 Y147.941 E-.05512
G1 X111.706 Y147.862 E-.04211
G1 X111.74 Y147.828 E-.02493
G1 X111.766 Y147.816 E-.01492
G1 X111.871 Y147.797 E-.05574
G1 X111.966 Y147.824 E-.05157
G1 X112.055 Y147.877 E-.05412
; WIPE_END
G1 E-.04 F1800
G1 X107.159 Y147.856 Z7.4 F30000
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F12000
G3 X107.579 Y147.86 I.155 J5.325 E.01289
G3 X108.225 Y148.48 I-.038 J.687 E.02994
G3 X108.162 Y149.502 I-1.529 J.42 E.03205
G3 X107.384 Y149.886 I-.732 J-.503 E.02785
G1 X107.159 Y149.889 E.0069
G1 X107.159 Y147.916 E.06062
M204 S10000
; WIPE_START
G1 F24000
G1 X107.579 Y147.86 E-.16073
G1 X107.824 Y147.914 E-.09551
G1 X107.985 Y148.01 E-.07103
G1 X108.118 Y148.182 E-.08263
G1 X108.225 Y148.48 E-.12034
G1 X108.266 Y148.765 E-.10962
G1 X108.268 Y149.081 E-.12014
; WIPE_END
G1 E-.04 F1800
G1 X115.891 Y149.472 Z7.4 F30000
G1 X125.176 Y149.948 Z7.4
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X125.176 Y147.049 E.08908
G1 X126.128 Y147.049 E.02924
G1 X126.128 Y148.975 E.05918
G2 X126.99 Y148.943 I.378 J-1.456 E.02687
G1 X126.99 Y149.97 E.03154
G3 X126.054 Y149.84 I-.171 J-2.208 E.02926
G1 X126.029 Y149.948 E.00341
G1 X125.236 Y149.948 E.02436
M204 S10000
; WIPE_START
G1 F24000
G1 X125.195 Y147.949 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.836 Y148.108 Z7.4 F30000
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X124.865 Y148.448 E.01047
G3 X123.649 Y149.968 I-1.388 J.136 E.06619
G1 X123.649 Y149.998 E.00094
G2 X123.409 Y149.999 I-.118 J.502 E.00744
G1 X123.409 Y149.973 E.0008
G3 X123.222 Y149.944 I.065 J-1.036 E.00584
G3 X122.201 Y148.36 I.45 J-1.411 E.06274
G3 X123.434 Y147.036 I1.394 J.061 E.06049
G3 X124.639 Y147.588 I.149 J1.266 E.04282
G1 X124.297 Y148.108 E.01913
G1 X124.776 Y148.108 E.01472
M204 S10000
; WIPE_START
G1 F24000
G1 X124.865 Y148.448 E-.13334
G1 X124.846 Y148.79 E-.13025
G1 X124.783 Y149.045 E-.09975
G1 X124.681 Y149.279 E-.0971
G1 X124.538 Y149.493 E-.09788
G1 X124.359 Y149.674 E-.09664
G1 X124.148 Y149.818 E-.09693
G1 X124.128 Y149.826 E-.00811
; WIPE_END
G1 E-.04 F1800
G1 X122.053 Y147.787 Z7.4 F30000
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X121.729 Y147.799 E.00995
G2 X121.547 Y148.016 I-.019 J.169 E.01028
G1 X121.547 Y149.168 E.03541
G1 X121.943 Y149.168 E.01215
G1 X121.943 Y149.948 E.02397
G1 X121.547 Y149.948 E.01215
G1 X121.547 Y150.652 E.02161
G1 X120.596 Y150.652 E.02924
G1 X120.596 Y149.948 E.02161
G1 X120.27 Y149.948 E.01001
G1 X120.27 Y149.168 E.02397
G1 X120.596 Y149.168 E.01001
G1 X120.598 Y147.972 E.03675
G3 X120.671 Y147.544 I1.856 J.097 E.01339
G3 X121.239 Y147.04 I.667 J.181 E.0247
G3 X122.053 Y147.066 I.287 J3.783 E.02507
G1 X122.053 Y147.727 E.02032
M204 S10000
; WIPE_START
G1 F24000
G1 X121.729 Y147.799 E-.12596
G1 X121.621 Y147.819 E-.04172
G1 X121.577 Y147.851 E-.02093
G1 X121.547 Y148.016 E-.06359
G1 X121.547 Y149.168 E-.43787
G1 X121.731 Y149.168 E-.06993
; WIPE_END
G1 E-.04 F1800
G1 X120.079 Y148.108 Z7.4 F30000
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X120.108 Y148.448 E.01047
G3 X118.892 Y149.968 I-1.388 J.136 E.06619
G1 X118.892 Y149.998 E.00094
G2 X118.652 Y149.999 I-.118 J.502 E.00744
G1 X118.652 Y149.973 E.0008
G3 X118.465 Y149.944 I.065 J-1.036 E.00584
G3 X117.445 Y148.36 I.45 J-1.411 E.06274
G3 X118.677 Y147.036 I1.394 J.061 E.06049
G3 X119.881 Y147.59 I.157 J1.242 E.0429
G1 X119.54 Y148.108 E.01905
G1 X120.019 Y148.108 E.01472
M204 S10000
; WIPE_START
G1 F24000
G1 X120.108 Y148.448 E-.13334
G1 X120.089 Y148.79 E-.13025
G1 X120.027 Y149.045 E-.09975
G1 X119.925 Y149.279 E-.0971
G1 X119.781 Y149.493 E-.09789
G1 X119.602 Y149.674 E-.09664
G1 X119.392 Y149.818 E-.09693
G1 X119.372 Y149.826 E-.00811
; WIPE_END
G1 E-.04 F1800
G1 X113.47 Y149.948 Z7.4 F30000
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X113.47 Y147.049 E.08908
G1 X114.426 Y147.049 E.02937
G1 X114.426 Y149.063 E.06188
G2 X114.783 Y149.143 I.371 J-.812 E.01132
G2 X114.842 Y148.889 I-.24 J-.189 E.00828
G1 X114.842 Y147.049 E.05654
G1 X115.793 Y147.049 E.02923
G1 X115.792 Y149.051 E.06152
G2 X116.161 Y149.143 I.349 J-.617 E.01183
G2 X116.215 Y148.888 I-.281 J-.193 E.00822
G1 X116.218 Y147.049 E.05649
G1 X117.165 Y147.049 E.02911
G1 X117.165 Y148.951 E.05843
G3 X116.513 Y149.932 I-.997 J.044 E.03871
G3 X115.554 Y149.739 I-.273 J-1.126 E.03103
G1 X115.554 Y149.653 E.00264
G3 X114.354 Y149.831 I-.71 J-.654 E.0403
G1 X114.327 Y149.948 E.0037
G1 X113.53 Y149.948 E.02449
M204 S10000
; WIPE_START
G1 F24000
G1 X113.489 Y147.949 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.294 Y148.878 Z7.4 F30000
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X111.586 Y149.087 E.01105
G2 X112.035 Y149.17 I.335 J-.557 E.01435
G2 X112.091 Y148.981 I-.147 J-.146 E.00631
G3 X111.665 Y148.958 I-.083 J-2.356 E.01314
G3 X110.769 Y148.08 I.1 J-.998 E.04163
G3 X111.76 Y147.028 I.904 J-.142 E.05119
G1 X111.76 Y146.993 E.00106
G2 X112 Y147.026 I.176 J-.389 E.00755
G1 X112 Y147.063 E.00112
G3 X112.405 Y147.246 I-.266 J1.131 E.01376
G3 X112.967 Y147.033 I.544 J.586 E.01892
G1 X113.24 Y147.604 E.01944
G1 X113.091 Y147.723 E.00586
G2 X113.062 Y147.829 I.296 J.138 E.00338
G3 X113.029 Y149.037 I-87.308 J-1.818 E.03715
G3 X112.115 Y149.963 I-.925 J.001 E.04433
G3 X110.879 Y149.514 I-.156 J-1.496 E.0418
G1 X111.261 Y148.928 E.0215
M204 S10000
; WIPE_START
G1 F24000
G1 X111.586 Y149.087 E-.13756
G1 X111.814 Y149.173 E-.09259
G1 X112.035 Y149.17 E-.08414
G1 X112.068 Y149.128 E-.02017
G1 X112.091 Y148.981 E-.05657
G1 X112.091 Y148.981 E-.00002
G1 X111.665 Y148.958 E-.16224
G1 X111.341 Y148.859 E-.12863
G1 X111.168 Y148.748 E-.07808
; WIPE_END
G1 E-.04 F1800
G1 X109.549 Y147.049 Z7.4 F30000
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X110.505 Y147.049 E.02939
G1 X110.505 Y149.948 E.08908
G1 X109.549 Y149.948 E.02939
G1 X109.549 Y147.109 E.08724
M204 S10000
; WIPE_START
G1 F24000
G1 X110.505 Y147.049 E-.36423
G1 X110.505 Y148.091 E-.39577
; WIPE_END
G1 E-.04 F1800
G1 X109.56 Y150.293 Z7.4 F30000
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F12000
G3 X109.96 Y150.011 I.467 J.238 E.01565
G1 X110.027 Y150.007 E.00206
G3 X109.535 Y150.348 I-.001 J.524 E.08163
M204 S10000
; WIPE_START
G1 F24000
G1 X109.655 Y150.162 E-.08378
G1 X109.787 Y150.063 E-.06285
G1 X109.96 Y150.011 E-.06866
G1 X110.027 Y150.007 E-.02551
G1 X110.188 Y150.03 E-.06178
G1 X110.266 Y150.062 E-.03178
G1 X110.399 Y150.158 E-.06244
G1 X110.497 Y150.29 E-.06257
G1 X110.53 Y150.367 E-.03194
G1 X110.554 Y150.529 E-.06198
G1 X110.53 Y150.691 E-.06245
G1 X110.498 Y150.769 E-.03215
G1 X110.4 Y150.903 E-.06294
G1 X110.296 Y150.979 E-.04916
; WIPE_END
G1 E-.04 F1800
G1 X117.89 Y150.214 Z7.4 F30000
G1 X130.16 Y148.977 Z7.4
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X128.342 Y148.977 E.05585
G1 X128.342 Y148.113 E.02654
G1 X130.16 Y148.113 E.05585
G1 X130.16 Y148.917 E.0247
M204 S10000
; WIPE_START
G1 F24000
G1 X128.342 Y148.977 E-.69103
G1 X128.342 Y148.796 E-.06897
; WIPE_END
G1 E-.04 F1800
G1 X130.491 Y150.139 Z7.4 F30000
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X130.491 Y149.274 E.02659
G1 X132.126 Y148.524 E.05526
G1 X130.491 Y147.762 E.05541
G1 X130.491 Y146.896 E.02662
G1 X133.25 Y148.245 E.09435
G1 X133.25 Y148.807 E.01726
G1 X130.545 Y150.113 E.09229
M204 S10000
; WIPE_START
G1 F24000
G1 X130.491 Y149.274 E-.31956
G1 X131.545 Y148.79 E-.44044
; WIPE_END
G1 E-.04 F1800
G1 X123.935 Y149.376 Z7.4 F30000
G1 X106.632 Y150.709 Z7.4
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F12000
G2 X107.877 Y150.662 I.385 J-6.35 E.03837
G2 X109.243 Y148.774 I-.343 J-1.686 E.07865
G2 X108.657 Y147.413 I-1.917 J.018 E.04673
G2 X107.723 Y147.052 I-1.057 J1.346 E.03124
G1 X106.212 Y147.049 E.04642
G1 X106.212 Y150.389 E.10262
G3 X100.21 Y137.999 I9.834 J-12.413 E.43763
G1 X100.21 Y114.001 E.73736
G3 X116.002 Y98.21 I15.804 J.013 E.76203
G1 X140.421 Y98.216 E.75036
G3 X155.79 Y114.001 I-.425 J15.788 E.74917
G1 X155.79 Y137.999 E.73736
G3 X139.999 Y153.79 I-15.804 J-.013 E.76203
G1 X116.001 Y153.79 E.73736
G3 X106.68 Y150.744 I.032 J-15.885 E.30633
M204 S10000
G1 X107.363 Y150.982 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.150374
G1 F15000
G1 X107.58 Y150.943 E.00193
; LINE_WIDTH: 0.113372
G1 X107.741 Y150.907 E.00095
; WIPE_START
G1 F24000
G1 X107.58 Y150.943 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X109.055 Y150.19 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.110142
G1 F15000
G1 X109.145 Y150.097 E.00071
; LINE_WIDTH: 0.146737
G1 X109.237 Y149.993 E.00117
; LINE_WIDTH: 0.182917
G1 X109.273 Y149.963 E.00053
G1 X109.294 Y150.002 E.0005
; LINE_WIDTH: 0.13958
G1 X109.315 Y150.04 E.00035
; LINE_WIDTH: 0.120394
G2 X109.336 Y150.191 I.225 J.045 E.00098
G1 X109.42 Y150.146 E.00061
G1 X109.254 Y150.061 F30000
; LINE_WIDTH: 0.139599
G1 F15000
G1 X109.334 Y149.7 E.00291
; WIPE_START
G1 F24000
G1 X109.254 Y150.061 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X110.701 Y149.701 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.121919
G1 F15000
G1 X110.906 Y149.835 E.00157
G1 X110.911 Y149.119 F30000
; LINE_WIDTH: 0.238507
G1 F15000
G1 X110.724 Y148.635 E.00828
; WIPE_START
G1 F24000
G1 X110.911 Y149.119 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X110.721 Y147.321 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.116182
G1 F15000
G3 X110.781 Y147.125 I3.176 J.863 E.00122
G1 X110.906 Y147.093 F30000
; LINE_WIDTH: 0.118464
G1 F15000
G2 X110.701 Y147.238 I2.197 J3.309 E.00155
; WIPE_START
G1 F24000
G1 X110.906 Y147.093 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X109.266 Y147.71 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.112089
G1 F15000
G3 X109.33 Y148.065 I-9.953 J1.963 E.00203
G1 X109.353 Y147.919 F30000
; LINE_WIDTH: 0.179799
G1 F15000
G1 X109.277 Y147.812 E.00147
; LINE_WIDTH: 0.163229
G1 X109.23 Y147.75 E.00076
; LINE_WIDTH: 0.135804
G1 X109.181 Y147.685 E.00061
; LINE_WIDTH: 0.109428
G1 X109.103 Y147.591 E.00066
; WIPE_START
G1 F24000
G1 X109.181 Y147.685 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.678 Y148.096 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.111007
G1 F15000
G2 X107.559 Y148.099 I-.02 J1.249 E.00066
; LINE_WIDTH: 0.147512
G1 X107.356 Y148.12 E.00175
G1 X107.461 Y148.39 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.06 Y148.988 E.02602
G1 X107.96 Y149.422
G1 X107.367 Y148.828 E.02579
M204 S10000
; WIPE_START
G1 F24000
G1 X107.96 Y149.422 E-.3189
G1 X108.06 Y148.988 E-.16901
G1 X107.554 Y148.482 E-.27209
; WIPE_END
G1 E-.04 F1800
G1 X112.994 Y149.735 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0971349
G1 F15000
G1 X113.03 Y149.734 E.00016
G1 X113.274 Y149.487 E.00153
G1 X113.274 Y149.468 F30000
; LINE_WIDTH: 0.147657
G1 F15000
G1 X113.014 Y149.756 E.00331
G1 X113.166 Y149.671 F30000
; LINE_WIDTH: 0.191162
G1 F15000
G1 X113.217 Y149.416 E.00315
; LINE_WIDTH: 0.133479
G1 X113.24 Y149.189 E.00168
; LINE_WIDTH: 0.10383
G1 X113.249 Y149.06 E.00065
; WIPE_START
G1 F24000
G1 X113.24 Y149.189 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.359 Y149.194 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.112421
G1 F15000
G2 X117.44 Y149.377 I.205 J.018 E.00118
; WIPE_START
G1 F24000
G1 X117.368 Y149.288 E-.41555
G1 X117.359 Y149.194 E-.34445
; WIPE_END
G1 E-.04 F1800
G1 X117.361 Y147.677 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.148465
G1 F15000
G1 X117.445 Y147.571 E.00116
; LINE_WIDTH: 0.118136
G1 X117.559 Y147.443 E.00105
; WIPE_START
G1 F24000
G1 X117.445 Y147.571 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.048 Y147.693 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.174664
G1 F15000
G1 X120.333 Y147.902 E.0038
G1 X120.355 Y147.872 F30000
; LINE_WIDTH: 0.131747
G1 F15000
G1 X120.377 Y147.842 E.00027
; LINE_WIDTH: 0.105193
G1 X120.395 Y147.77 E.00038
G1 X120.355 Y147.872 F30000
; LINE_WIDTH: 0.179878
G1 F15000
G1 X120.333 Y147.902 E.00042
G1 X120.333 Y147.965 E.0007
; LINE_WIDTH: 0.155068
G1 X120.353 Y148.535 E.00521
G1 X120.327 Y148.972 E.00401
G1 X120.074 Y149.549 F30000
; LINE_WIDTH: 0.120442
G1 F15000
G3 X119.862 Y149.731 I-3.363 J-3.705 E.00176
; WIPE_START
G1 F24000
G1 X120.074 Y149.549 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.053 Y148.972 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.313607
G1 F15000
G1 X121.885 Y148.831 E.00484
G1 X121.875 Y148.339 E.01086
G1 X121.905 Y147.989 E.00775
G1 X122.267 Y147.522 F30000
; LINE_WIDTH: 0.122903
G1 F15000
G1 X122.297 Y147.428 E.00064
G1 X122.416 Y147.318 E.00105
; WIPE_START
G1 F24000
G1 X122.297 Y147.428 E-.47185
G1 X122.267 Y147.522 E-.28815
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y149.298 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.142401
G1 F15000
G2 X122.27 Y149.532 I.338 J-.018 E.00217
; LINE_WIDTH: 0.111112
G1 X122.363 Y149.626 E.00073
; WIPE_START
G1 F24000
G1 X122.27 Y149.532 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.716 Y149.622 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.112783
G1 F15000
G1 X124.812 Y149.524 E.00078
; LINE_WIDTH: 0.142622
G1 X124.863 Y149.469 E.00061
; LINE_WIDTH: 0.17016
G1 X124.91 Y149.416 E.00074
; LINE_WIDTH: 0.178058
G1 X124.966 Y149.199 E.00246
G1 X124.958 Y149.198 F30000
; LINE_WIDTH: 0.107243
G1 F15000
G3 X124.893 Y149.517 I-7.129 J-1.285 E.00171
; WIPE_START
G1 F24000
G1 X124.958 Y149.198 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.887 Y147.912 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.14203
G1 F15000
G1 X124.932 Y147.567 E.00282
G1 X124.915 Y147.543 E.00024
; LINE_WIDTH: 0.110472
G1 X124.777 Y147.411 E.00105
; WIPE_START
G1 F24000
G1 X124.915 Y147.543 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.144 Y141.189 Z7.4 F30000
G1 X152.975 Y105.38 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X148.633 Y101.039 E.18866
M204 S10000
; WIPE_START
G1 F24000
G1 X150.048 Y102.453 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X147.289 Y100.228 Z7.4 F30000
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X153.746 Y106.685 E.28057
G1 X154.253 Y107.725
G1 X146.266 Y99.738 E.34711
G1 X145.385 Y99.39
G1 X154.629 Y108.634 E.40172
G1 X154.882 Y109.421
G1 X144.579 Y99.117 E.44774
G1 X143.825 Y98.897
G1 X155.099 Y110.171 E.4899
G1 X155.259 Y110.864
G1 X143.147 Y98.752 E.52635
G1 X142.479 Y98.618
G1 X155.382 Y111.521 E.56069
G1 X155.457 Y112.128
G1 X141.872 Y98.543 E.59033
G1 X141.264 Y98.469
G1 X155.531 Y112.736 E.61997
G1 X155.562 Y113.3
G1 X140.7 Y98.438 E.6458
G1 X140.152 Y98.423
G1 X155.577 Y113.848 E.6703
G1 X155.577 Y114.382
G1 X139.618 Y98.423 E.69349
G1 X139.085 Y98.423
G1 X155.577 Y114.915 E.71667
G1 X155.577 Y115.448
G1 X138.551 Y98.423 E.73985
G1 X138.018 Y98.423
G1 X155.577 Y115.982 E.76304
G1 X155.578 Y116.515
G1 X137.485 Y98.422 E.78622
G1 X136.951 Y98.422
G1 X155.578 Y117.049 E.80941
G1 X155.578 Y117.582
G1 X136.418 Y98.422 E.83259
G1 X135.884 Y98.422
G1 X155.578 Y118.115 E.85577
G1 X155.578 Y118.649
G1 X135.351 Y98.422 E.87896
G1 X134.818 Y98.422
G1 X155.578 Y119.182 E.90214
G1 X155.578 Y119.716
G1 X134.284 Y98.422 E.92533
G1 X133.751 Y98.422
G1 X155.578 Y120.249 E.94851
G1 X155.579 Y120.782
G1 X133.217 Y98.421 E.9717
G1 X132.684 Y98.421
G1 X155.579 Y121.316 E.99488
G1 X155.579 Y121.849
G1 X132.151 Y98.421 E1.01806
G1 X131.617 Y98.421
G1 X155.579 Y122.383 E1.04125
G1 X155.579 Y122.916
G1 X131.084 Y98.421 E1.06443
G1 X130.551 Y98.421
G1 X155.579 Y123.449 E1.08762
G1 X155.579 Y123.983
G1 X130.017 Y98.421 E1.1108
G1 X129.484 Y98.421
G1 X155.579 Y124.516 E1.13398
G1 X155.58 Y125.05
G1 X128.95 Y98.42 E1.15717
G1 X128.417 Y98.42
G1 X155.58 Y125.583 E1.18035
G1 X155.58 Y126.116
G1 X127.884 Y98.42 E1.20354
G1 X127.35 Y98.42
G1 X155.58 Y126.65 E1.22672
G1 X155.58 Y127.183
M73 P94 R1
G1 X126.817 Y98.42 E1.2499
G1 X126.283 Y98.42
G1 X155.58 Y127.717 E1.27309
G1 X155.58 Y128.25
G1 X125.75 Y98.42 E1.29627
G1 X125.217 Y98.42
G1 X155.58 Y128.783 E1.31946
G1 X155.581 Y129.317
G1 X124.683 Y98.419 E1.34264
G1 X124.15 Y98.419
G1 X155.581 Y129.85 E1.36583
G1 X155.581 Y130.384
G1 X123.616 Y98.419 E1.38901
G1 X123.083 Y98.419
G1 X155.581 Y130.917 E1.41219
G1 X155.581 Y131.45
G1 X122.55 Y98.419 E1.43538
G1 X122.016 Y98.419
G1 X155.581 Y131.984 E1.45856
G1 X155.581 Y132.517
G1 X121.483 Y98.419 E1.48175
G1 X120.949 Y98.419
G1 X155.581 Y133.051 E1.50493
G1 X155.582 Y133.584
G1 X120.416 Y98.418 E1.52811
G1 X119.883 Y98.418
G1 X155.582 Y134.117 E1.5513
G1 X155.582 Y134.651
G1 X119.349 Y98.418 E1.57448
G1 X118.816 Y98.418
G1 X155.582 Y135.184 E1.59767
G1 X155.582 Y135.718
G1 X118.282 Y98.418 E1.62085
G1 X117.749 Y98.418
G1 X155.582 Y136.251 E1.64403
G1 X155.582 Y136.784
G1 X117.216 Y98.418 E1.66722
G1 X116.682 Y98.418
G1 X155.582 Y137.318 E1.6904
G1 X155.583 Y137.851
G1 X116.149 Y98.417 E1.71359
G1 X115.631 Y98.433
G1 X155.572 Y138.374 E1.73566
G1 X155.556 Y138.891
G1 X115.118 Y98.453 E1.75721
G1 X114.614 Y98.482
G1 X155.516 Y139.384 E1.77739
G1 X155.466 Y139.868
G1 X114.133 Y98.534 E1.79614
G1 X113.663 Y98.598
G1 X155.402 Y140.337 E1.81376
G1 X155.325 Y140.793
G1 X113.205 Y98.673 E1.83031
G1 X112.762 Y98.763
G1 X155.239 Y141.241 E1.84585
G1 X155.134 Y141.669
G1 X112.325 Y98.859 E1.86028
G1 X111.903 Y98.971
G1 X155.023 Y142.091 E1.87376
G1 X154.912 Y142.513
G1 X111.486 Y99.087 E1.88707
G1 X111.084 Y99.219
G1 X154.781 Y142.916 E1.89883
G1 X154.647 Y143.314
G1 X110.686 Y99.353 E1.91032
G1 X110.302 Y99.503
G1 X154.494 Y143.695 E1.92035
G1 X154.337 Y144.072
G1 X109.92 Y99.655 E1.93014
G1 X109.552 Y99.82
G1 X154.181 Y144.449 E1.93935
G1 X154.009 Y144.81
G1 X109.188 Y99.989 E1.94772
G1 X108.834 Y100.168
G1 X153.833 Y145.167 E1.9554
G1 X153.646 Y145.514
G1 X108.486 Y100.353 E1.96243
G1 X108.148 Y100.549
G1 X153.453 Y145.854 E1.96873
G1 X153.254 Y146.188
G1 X107.819 Y100.753 E1.97435
G1 X107.49 Y100.957
G1 X153.046 Y146.513 E1.97961
G1 X152.832 Y146.833
G1 X107.166 Y101.167 E1.98442
G1 X106.856 Y101.39
G1 X152.606 Y147.139 E1.98806
G1 X152.379 Y147.446
G1 X106.547 Y101.614 E1.99164
M73 P95 R1
G1 X106.251 Y101.851
G1 X152.152 Y147.753 E1.99464
G1 X151.908 Y148.042
G1 X105.955 Y102.089 E1.99687
G1 X105.672 Y102.339
G1 X151.663 Y148.33 E1.99853
G1 X151.408 Y148.608
G1 X105.391 Y102.591 E1.99965
G1 X105.119 Y102.852
G1 X151.148 Y148.882 E2.0002
G1 X150.882 Y149.148
G1 X104.852 Y103.119 E2.0002
G1 X104.591 Y103.391
G1 X150.608 Y149.408 E1.99964
G1 X150.33 Y149.663
G1 X104.339 Y103.672 E1.99854
G1 X104.089 Y103.955
G1 X150.042 Y149.908 E1.99687
G1 X149.753 Y150.153
G1 X103.851 Y104.251 E1.99465
G1 X103.614 Y104.547
G1 X149.45 Y150.383 E1.99181
G1 X149.147 Y150.613
G1 X103.389 Y104.856 E1.98838
G1 X103.167 Y105.166
G1 X148.832 Y150.831 E1.98438
G1 X148.514 Y151.047
G1 X102.954 Y105.487 E1.97979
G1 X102.746 Y105.813
G1 X148.187 Y151.253 E1.97461
G1 X147.854 Y151.453
G1 X102.547 Y106.146 E1.96883
G1 X102.354 Y106.487
G1 X147.514 Y151.647 E1.96243
G1 X147.166 Y151.832
G1 X102.167 Y106.833 E1.9554
G1 X101.99 Y107.19
G1 X146.812 Y152.011 E1.94772
G1 X146.448 Y152.18
G1 X101.819 Y107.551 E1.93934
G1 X101.663 Y107.928
G1 X146.08 Y152.345 E1.93014
M73 P95 R0
G1 X145.698 Y152.497
G1 X101.506 Y108.305 E1.92035
G1 X101.353 Y108.686
G1 X145.314 Y152.646 E1.91029
G1 X144.91 Y152.776
G1 X101.219 Y109.085 E1.8986
G1 X101.088 Y109.487
G1 X144.507 Y152.906 E1.88676
G1 X144.1 Y153.032
G1 X100.977 Y109.909 E1.87389
G1 X100.866 Y110.331
G1 X143.673 Y153.138 E1.86016
G1 X143.241 Y153.239
G1 X100.761 Y110.759 E1.84595
G1 X100.675 Y111.207
G1 X142.793 Y153.325 E1.83024
G1 X142.337 Y153.402
G1 X100.598 Y111.663 E1.81378
G1 X100.534 Y112.132
G1 X141.868 Y153.466 E1.79616
G1 X141.384 Y153.516
G1 X100.484 Y112.616 E1.77729
G1 X100.444 Y113.109
G1 X140.891 Y153.556 E1.7576
M73 P96 R0
G1 X140.374 Y153.572
G1 X100.428 Y113.626 E1.73587
G1 X100.417 Y114.149
G1 X139.851 Y153.583 E1.71358
G1 X139.318 Y153.583
G1 X100.417 Y114.682 E1.69041
G1 X100.417 Y115.215
G1 X133.183 Y147.981 E1.42384
G1 X132.14 Y147.471
G1 X100.417 Y115.749 E1.37849
G1 X100.417 Y116.282
G1 X131.096 Y146.961 E1.33314
G1 X130.284 Y146.682
G1 X100.417 Y116.815 E1.29785
G1 X100.417 Y117.349
G1 X130.284 Y147.215 E1.29785
G1 X130.284 Y147.748
G1 X100.417 Y117.882 E1.29785
G1 X100.417 Y118.415
G1 X129.908 Y147.906 E1.28151
G1 X129.375 Y147.906
G1 X100.417 Y118.948 E1.25834
G1 X100.417 Y119.482
G1 X128.842 Y147.906 E1.23517
G1 X128.308 Y147.906
G1 X100.417 Y120.015 E1.212
G1 X100.417 Y120.548
G1 X128.135 Y148.265 E1.20445
G1 X128.135 Y148.799
G1 X126.336 Y147 E.07818
G1 X126.178 Y146.842
G1 X100.417 Y121.081 E1.11941
G1 X100.417 Y121.615
G1 X125.644 Y146.842 E1.09623
G1 X125.111 Y146.842
G1 X100.417 Y122.148 E1.07306
G1 X100.417 Y122.681
G1 X124.936 Y147.2 E1.06544
G1 X124.123 Y146.921
G1 X100.417 Y123.215 E1.03014
G1 X100.417 Y123.748
G1 X123.499 Y146.83 E1.00302
G1 X123.044 Y146.908
G1 X100.417 Y124.281 E.98325
G1 X100.417 Y124.814
G1 X122.697 Y147.094 E.96814
G1 X121.915 Y146.845
G1 X100.417 Y125.348 E.93418
G1 X100.417 Y125.881
G1 X121.366 Y146.83 E.91034
G1 X120.923 Y146.92
G1 X100.417 Y126.414 E.89108
G1 X100.417 Y126.947
G1 X120.64 Y147.17 E.87875
G1 X120.467 Y147.531
G1 X100.417 Y127.481 E.87127
G1 X100.417 Y128.014
G1 X119.299 Y146.896 E.8205
G1 X118.699 Y146.829
G1 X100.417 Y128.547 E.79442
G1 X100.417 Y129.081
G1 X118.258 Y146.921 E.77525
G1 X117.916 Y147.112
G1 X100.417 Y129.614 E.76038
G1 X100.417 Y130.147
G1 X117.112 Y146.842 E.72546
M73 P97 R0
G1 X116.579 Y146.842
G1 X100.417 Y130.68 E.70229
G1 X100.417 Y131.214
G1 X116.046 Y146.842 E.67912
G1 X115.512 Y146.842
G1 X100.417 Y131.747 E.65594
G1 X100.417 Y132.28
G1 X114.979 Y146.842 E.63277
G1 X114.446 Y146.842
G1 X100.417 Y132.813 E.6096
G1 X100.417 Y133.347
G1 X113.912 Y146.842 E.58642
G1 X113.379 Y146.842
G1 X100.417 Y133.88 E.56325
G1 X100.417 Y134.413
G1 X112.843 Y146.839 E.53996
G1 X112.434 Y146.963
G1 X100.417 Y134.946 E.52218
G1 X100.417 Y135.48
G1 X111.697 Y146.759 E.49016
G1 X111.294 Y146.89
G1 X100.417 Y136.013 E.47266
G1 X100.417 Y136.546
G1 X110.749 Y146.878 E.44894
G1 X110.18 Y146.842
G1 X100.417 Y137.08 E.42421
G1 X100.417 Y137.613
G1 X109.646 Y146.842 E.40104
G1 X109.341 Y147.07
G1 X100.422 Y138.15 E.3876
G1 X100.436 Y138.698
G1 X109.08 Y147.342 E.37559
G1 X108.12 Y146.915
G1 X100.475 Y139.27 E.33219
G1 X100.536 Y139.864
G1 X107.516 Y146.844 E.30331
G1 X106.981 Y146.843
G1 X100.63 Y140.492 E.276
G1 X100.74 Y141.136
G1 X106.447 Y146.842 E.24798
G1 X106.005 Y146.933
G1 X100.896 Y141.824 E.22201
G1 X101.101 Y142.562
G1 X106.005 Y147.466 E.2131
G1 X106.005 Y147.999
G1 X101.389 Y143.384 E.20056
G1 X101.754 Y144.282
G1 X106.005 Y148.533 E.18472
G1 X106.005 Y149.066
G1 X102.241 Y145.302 E.16355
M204 S10000
; WIPE_START
G1 F24000
G1 X103.655 Y146.717 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X103.039 Y146.634 Z7.4 F30000
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X106.005 Y149.599 E.12886
M204 S10000
; WIPE_START
G1 F24000
G1 X104.59 Y148.185 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X112.174 Y149.05 Z7.4 F30000
G1 X119.638 Y149.901 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X120.388 Y150.651 E.03261
M204 S10000
; WIPE_START
G1 F24000
G1 X119.638 Y149.901 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.217 Y148.998 Z7.4 F30000
G1 X133.457 Y148.255 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X138.785 Y153.583 E.23149
G1 X138.251 Y153.583
G1 X133.457 Y148.789 E.20832
G1 X133.198 Y149.062
G1 X137.718 Y153.583 E.19643
G1 X137.185 Y153.583
G1 X132.838 Y149.236 E.18888
G1 X132.478 Y149.41
G1 X136.651 Y153.583 E.18134
G1 X136.118 Y153.583
G1 X132.119 Y149.583 E.17379
G1 X131.759 Y149.757
G1 X135.585 Y153.583 E.16624
G1 X135.052 Y153.583
G1 X131.4 Y149.931 E.15869
G1 X131.04 Y150.104
G1 X134.518 Y153.583 E.15115
G1 X133.985 Y153.583
G1 X130.681 Y150.278 E.1436
G1 X130.321 Y150.452
G1 X133.452 Y153.583 E.13605
M204 S10000
; WIPE_START
G1 F24000
G1 X132.038 Y152.168 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.284 Y149.882 Z7.4 F30000
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X129.587 Y149.184 E.03029
G1 X129.054 Y149.184
G1 X130.284 Y150.415 E.05347
M204 S10000
; WIPE_START
G1 F24000
G1 X129.054 Y149.184 E-.66122
G1 X129.314 Y149.184 E-.09878
; WIPE_END
G1 E-.04 F1800
G1 X128.52 Y149.184 Z7.4 F30000
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X132.919 Y153.583 E.19112
G1 X132.385 Y153.583
G1 X126.336 Y147.533 E.26289
G1 X126.336 Y148.066
G1 X126.999 Y148.729 E.02882
G1 X127.197 Y148.928
G1 X131.852 Y153.583 E.20228
G1 X131.319 Y153.583
G1 X127.197 Y149.461 E.17911
G1 X127.197 Y149.994
G1 X130.785 Y153.583 E.15593
G1 X130.252 Y153.583
G1 X126.842 Y150.173 E.14817
G1 X126.257 Y150.12
G1 X129.719 Y153.583 E.15045
G1 X129.186 Y153.583
G1 X125.759 Y150.156 E.14892
G1 X125.225 Y150.156
G1 X128.652 Y153.583 E.14892
G1 X128.119 Y153.583
G1 X124.42 Y149.883 E.16075
G1 X124.075 Y150.072
G1 X127.586 Y153.583 E.15254
G1 X127.053 Y153.583
G1 X123.68 Y150.21 E.14656
G1 X123.045 Y150.108
G1 X126.519 Y153.583 E.15099
G1 X125.986 Y153.583
G1 X122.342 Y149.938 E.15836
G1 X122.026 Y150.156
G1 X125.453 Y153.583 E.14892
G1 X124.92 Y153.583
G1 X121.755 Y150.418 E.13752
G1 X121.663 Y150.859
G1 X124.386 Y153.583 E.11835
G1 X123.853 Y153.583
G1 X121.129 Y150.859 E.11835
G1 X120.596 Y150.859
G1 X123.32 Y153.583 E.11835
G1 X122.786 Y153.583
G1 X119.289 Y150.085 E.152
G1 X118.875 Y150.205
G1 X122.253 Y153.583 E.14678
G1 X121.72 Y153.583
G1 X118.2 Y150.062 E.15297
G1 X117.2 Y149.596
G1 X121.187 Y153.583 E.17322
G1 X120.653 Y153.583
G1 X116.972 Y149.901 E.15998
G1 X116.64 Y150.102
G1 X120.12 Y153.583 E.15125
G1 X119.587 Y153.583
G1 X116.181 Y150.176 E.14801
M73 P98 R0
G1 X115.466 Y149.995
G1 X119.054 Y153.583 E.1559
G1 X118.52 Y153.583
G1 X115.092 Y150.154 E.14899
G1 X114.517 Y150.113
G1 X117.987 Y153.583 E.15077
G1 X117.454 Y153.583
G1 X114.027 Y150.156 E.14892
G1 X113.494 Y150.156
G1 X116.92 Y153.583 E.14892
G1 X116.387 Y153.583
G1 X112.804 Y149.999 E.15571
G1 X112.391 Y150.119
G1 X115.85 Y153.578 E.15031
G1 X115.302 Y153.564
G1 X111.909 Y150.171 E.14744
G1 X111.208 Y150.003
G1 X114.73 Y153.525 E.15305
G1 X114.139 Y153.467
G1 X110.713 Y150.041 E.14888
G1 X110.756 Y150.618
G1 X113.521 Y153.383 E.12014
G1 X112.864 Y153.259
G1 X110.597 Y150.992 E.09854
G1 X110.284 Y151.213
G1 X112.161 Y153.089 E.08156
G1 X111.437 Y152.899
G1 X109.737 Y151.199 E.07389
M204 S10000
; WIPE_START
G1 F24000
G1 X111.151 Y152.613 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.593 Y150.588 Z7.4 F30000
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X110.635 Y152.629 E.08871
G1 X109.725 Y152.253
G1 X108.24 Y150.768 E.06454
G1 X107.984 Y151.046
G1 X108.711 Y151.772 E.03157
M204 S10000
; WIPE_START
G1 F24000
G1 X107.984 Y151.046 E-.39037
G1 X108.24 Y150.768 E-.14341
G1 X108.661 Y151.189 E-.22622
; WIPE_END
G1 E-.04 F1800
G1 X116.248 Y150.354 Z7.4 F30000
G1 X131.238 Y148.703 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X130.557 Y148.022 E.0296
G1 X130.367 Y148.365
G1 X130.873 Y148.871 E.02198
M204 S10000
; WIPE_START
G1 F24000
G1 X130.367 Y148.365 E-.27186
G1 X130.557 Y148.022 E-.14906
G1 X131.188 Y148.653 E-.33908
; WIPE_END
G1 E-.04 F1800
G1 X133.444 Y148.269 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.165914
G1 F15000
G1 X133.501 Y148.122 E.00158
G1 X133.464 Y148.076 E.0006
; LINE_WIDTH: 0.172058
G1 X133.354 Y147.998 E.00141
; LINE_WIDTH: 0.201759
G1 X133.245 Y147.92 E.00174
; WIPE_START
G1 F24000
G1 X133.354 Y147.998 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.303 Y150.433 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.095119
G1 F15000
G1 X130.169 Y150.567 E.0008
; WIPE_START
G1 F24000
G1 X130.303 Y150.433 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.287 Y148.681 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.109115
G1 F15000
G1 X131.402 Y148.6 E.00076
; LINE_WIDTH: 0.146884
G1 X131.419 Y148.574 E.00026
; LINE_WIDTH: 0.180531
G1 X131.436 Y148.548 E.00035
; LINE_WIDTH: 0.219031
G1 X131.453 Y148.522 E.00045
G1 X131.434 Y148.507 E.00034
; LINE_WIDTH: 0.197868
G1 X131.325 Y148.43 E.00169
; LINE_WIDTH: 0.153989
G1 X131.215 Y148.354 E.00121
; LINE_WIDTH: 0.11011
G1 X131.105 Y148.277 E.00073
; WIPE_START
G1 F24000
G1 X131.215 Y148.354 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.566 Y147.19 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.109576
G1 F15000
G1 X131.43 Y147.093 E.00091
; LINE_WIDTH: 0.152389
G1 X131.294 Y146.996 E.00149
; LINE_WIDTH: 0.195202
G1 X131.158 Y146.899 E.00207
; WIPE_START
G1 F24000
G1 X131.294 Y146.996 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.303 Y147.9 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0931737
G1 F15000
G1 X129.914 Y147.9 E.00159
; WIPE_START
G1 F24000
G1 X130.303 Y147.9 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.228 Y150.096 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0919099
G1 F15000
G3 X126.101 Y150.232 I-.252 J-.109 E.00076
; WIPE_START
G1 F24000
G1 X126.203 Y150.142 E-.54839
G1 X126.228 Y150.096 E-.21161
; WIPE_END
G1 E-.04 F1800
G1 X122.983 Y150.169 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.198459
G1 F15000
G1 X122.841 Y150.066 E.00223
; LINE_WIDTH: 0.156745
G3 X122.691 Y149.955 I.922 J-1.413 E.00173
; LINE_WIDTH: 0.125038
G1 X122.487 Y149.768 E.00185
; WIPE_START
G1 F24000
G1 X122.691 Y149.955 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.491 Y150.964 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.122857
G1 F15000
G1 X120.283 Y150.756 E.00191
; WIPE_START
G1 F24000
G1 X120.491 Y150.964 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X113.382 Y150.267 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.103968
G1 F15000
G1 X113.132 Y150.018 E.00176
; WIPE_START
G1 F24000
G1 X113.382 Y150.267 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X109.186 Y152.008 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.109665
G1 F15000
G1 X109.048 Y151.909 E.00092
; LINE_WIDTH: 0.152657
G1 X108.91 Y151.81 E.00152
; LINE_WIDTH: 0.195649
G1 X108.772 Y151.711 E.00211
G1 X109.334 Y151.062 F30000
; LINE_WIDTH: 0.231406
G1 F15000
G1 X109.211 Y150.499 E.00885
; LINE_WIDTH: 0.184784
G1 X109.213 Y150.47 E.00033
; LINE_WIDTH: 0.134798
G1 X109.216 Y150.441 E.00022
; LINE_WIDTH: 0.0848134
G1 X109.218 Y150.412 E.0001
G1 X109.272 Y150.433 F30000
; LINE_WIDTH: 0.315997
G1 F15000
G1 X109.218 Y150.536 E.00258
; LINE_WIDTH: 0.359404
G3 X109.156 Y150.65 I-.661 J-.282 E.00335
G1 X109.417 Y151.146 E.01445
G1 X109.676 Y151.26 F30000
; LINE_WIDTH: 0.226337
G1 F15000
G3 X109.306 Y150.899 I1.021 J-1.414 E.00775
G1 X108.899 Y150.312 E.01068
; WIPE_START
G1 F24000
G1 X109.306 Y150.899 E-.44051
G1 X109.549 Y151.165 E-.2217
G1 X109.676 Y151.26 E-.09779
; WIPE_END
G1 E-.04 F1800
G1 X107.858 Y151.149 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.100881
G1 F15000
G1 X107.836 Y151.161 E.00012
G1 X107.821 Y151.213 E.00025
; LINE_WIDTH: 0.124558
G1 X107.972 Y151.342 E.00132
; LINE_WIDTH: 0.095489
G1 X108.033 Y151.389 E.00033
; WIPE_START
G1 F24000
G1 X107.972 Y151.342 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.933 Y149.799 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.203354
G1 F15000
G1 X105.885 Y149.783 E.00066
; LINE_WIDTH: 0.167623
G1 X105.836 Y149.767 E.00052
G3 X104.432 Y148.378 I19.809 J-21.43 E.02008
; LINE_WIDTH: 0.144347
G1 X104.158 Y148.077 E.00336
; LINE_WIDTH: 0.106895
G1 X103.885 Y147.777 E.00212
; WIPE_START
G1 F24000
G1 X104.158 Y148.077 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X106.016 Y149.986 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.215722
G1 F15000
G1 X105.933 Y149.799 E.00288
G1 X106.023 Y149.586 E.00326
; WIPE_START
G1 F24000
G1 X105.933 Y149.799 E-.40327
G1 X106.016 Y149.986 E-.35673
; WIPE_END
G1 E-.04 F1800
G1 X107.769 Y146.852 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0956947
G1 F15000
G2 X107.59 Y146.77 I-1.353 J2.706 E.00085
; WIPE_START
G1 F24000
G1 X107.769 Y146.852 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X113.282 Y146.963 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.105552
G1 F15000
G1 X113.24 Y147.016 E.00034
; LINE_WIDTH: 0.114355
G3 X113.214 Y147.007 I-.009 J-.017 E.00018
G1 X113.124 Y146.88 E.00091
; WIPE_START
G1 F24000
G1 X113.214 Y147.007 E-.64481
G1 X113.24 Y147.016 E-.11519
; WIPE_END
G1 E-.04 F1800
G1 X117.742 Y147.281 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.160645
G1 F15000
G1 X117.54 Y147.091 E.00266
; LINE_WIDTH: 0.184964
G1 X117.496 Y147.072 E.00056
; LINE_WIDTH: 0.223407
G1 X117.451 Y147.052 E.00071
G1 X117.353 Y147.255 E.00331
; WIPE_START
G1 F24000
G1 X117.451 Y147.052 E-.62511
G1 X117.496 Y147.072 E-.13489
; WIPE_END
G1 E-.04 F1800
G1 X120.019 Y147.403 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.117605
G1 F15000
G1 X119.865 Y147.237 E.00138
G2 X119.588 Y146.989 I-2.168 J2.142 E.00227
; LINE_WIDTH: 0.160117
G1 X119.475 Y146.91 E.00131
; LINE_WIDTH: 0.193012
G1 X119.363 Y146.831 E.00168
; WIPE_START
G1 F24000
G1 X119.475 Y146.91 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.05 Y145.976 Z7.4 F30000
G1 X154.907 Y142.542 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0915225
G1 F15000
G1 X154.822 Y142.69 E.00067
; WIPE_START
G1 F24000
G1 X154.907 Y142.542 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154.8 Y134.911 Z7.4 F30000
G1 X154.425 Y108.138 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.108524
G1 F15000
G1 X154.347 Y108.021 E.00075
; LINE_WIDTH: 0.149232
G1 X154.269 Y107.904 E.00122
; LINE_WIDTH: 0.189941
G1 X154.191 Y107.788 E.00168
; WIPE_START
G1 F24000
G1 X154.269 Y107.904 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.361 Y106.004 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.111271
G1 F15000
G1 X153.212 Y105.817 E.00133
; LINE_WIDTH: 0.157474
G1 X153.063 Y105.629 E.00224
; LINE_WIDTH: 0.203676
G1 X152.914 Y105.441 E.00314
; WIPE_START
G1 F24000
G1 X153.063 Y105.629 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X152.183 Y104.292 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.091429
G1 F15000
G1 X152.14 Y104.242 E.00026
; LINE_WIDTH: 0.116083
G1 X151.708 Y103.78 E.00377
; LINE_WIDTH: 0.167429
G2 X150.378 Y102.432 I-17.249 J15.686 E.01922
; LINE_WIDTH: 0.144423
G1 X150.077 Y102.158 E.00337
; LINE_WIDTH: 0.10692
G1 X149.776 Y101.884 E.00212
; WIPE_START
G1 F24000
G1 X150.077 Y102.158 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.573 Y101.099 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.216192
G1 F15000
G1 X148.36 Y100.921 E.00392
; LINE_WIDTH: 0.181455
G1 X148.239 Y100.827 E.00173
; LINE_WIDTH: 0.14414
G1 X148.118 Y100.734 E.00126
; LINE_WIDTH: 0.106826
G1 X147.997 Y100.641 E.0008
G1 X147.228 Y100.29 F30000
; LINE_WIDTH: 0.199508
G1 F15000
G1 X147.113 Y100.209 E.00179
; LINE_WIDTH: 0.166924
G1 X146.998 Y100.128 E.00142
; LINE_WIDTH: 0.135017
G1 X146.913 Y100.067 E.00078
; LINE_WIDTH: 0.103785
G1 X146.829 Y100.007 E.00052
; WIPE_START
G1 F24000
G1 X146.913 Y100.067 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.55 Y105.498 Z7.4 F30000
G1 X102.302 Y145.241 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.196465
G1 F15000
G1 X102.182 Y145.078 E.00254
; LINE_WIDTH: 0.149555
G1 X102.061 Y144.915 E.00176
; LINE_WIDTH: 0.107135
G1 X101.989 Y144.81 E.00066
; WIPE_START
G1 F24000
G1 X102.061 Y144.915 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X103.1 Y146.573 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.215984
G1 F15000
G1 X102.92 Y146.359 E.00395
; LINE_WIDTH: 0.181109
G1 X102.821 Y146.232 E.00181
; LINE_WIDTH: 0.143933
G1 X102.722 Y146.106 E.00132
; LINE_WIDTH: 0.106757
G1 X102.623 Y145.979 E.00083
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X102.722 Y146.106 E-.76
; WIPE_END
G1 E-.04 F1800
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; filament end gcode 
M106 P3 S0
;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z7.5 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S3 ;wait for last picture to be taken
M623; end of "timelapse_record_flag"

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z107 F600
    G1 Z105

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

