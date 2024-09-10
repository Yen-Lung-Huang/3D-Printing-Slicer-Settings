; Machine start G-code

; MACHINE START CODE
M106 S255 ; turn fan on full for cooling
M104 S[first_layer_temperature] ; set extruder temp
M140 S[first_layer_bed_temperature] ; set bed temp
M109 S[first_layer_temperature] ; wait for extruder temp
M190 S[first_layer_bed_temperature] ; wait for bed temp
G21 ; metric values
G90 ; use absolute coordinates
G28 ; home all
G4 P500 ; wait for 500 milliseconds (0.5 second)
G92 E0.0 ; zero the extruded length

; intro line
G1 F3000 ; set feed rate to 3000
G1 X0 Y-100 Z1 ; move to position with previously set speed (F3000)
G1 F3000 E30 ; extrude 30 mm of filament (to compensate for the 30 mm retraction at the end)
G1 F600 E30 ; change to slower speed for precise extrusion and extrude 30 mm of filament
G4 P2500 ; wait for 2500 milliseconds (2.5 second)
G1 F3000 ; set feed rate back to 3000
G1 X-20 Y-80 Z-0.05 ; move to position with speed F3000, scrape off any excess filament
G92 E0.0 ; zero the extruded length again
M106 S50 ; set fan to low speed

; Put printing message on LCD screen
; MACHINE START CODE






; Machine end G-code

; MACHINE END CODE
M104 S0 ; extruder heater off
M140 S0 ; heated bed heater off
M106 S255 ; turn fan on full for cooling
G91 ; relative positioning
G1 E-10 F4000 ; retract the filament
G1 E-5 F600 ; retract more to release pressure
G4 P500 ; wait for 500 milliseconds (0.5 second)
G1 Z+10 F3000 ; move Z up
G90 ; absolute positioning
G1 X0 Y0 ; move X/Y to home position
G4 P120000 ; wait 2 minutes for cooling
M106 S0 ; turn off fan
G28 ; home all axes
M84 ; disable motors
M300 S20 P50 ; beep
G4 P25 ; wait
M300 S20000 P50 ; beep
; MACHINE END CODE






; Before layer change G-code

;BEFORE_LAYER_CHANGE
;[layer_z]
G92 E0






; Layer change G-code

;AFTER_LAYER_CHANGE
;[layer_z]






; Pause G-code
M601
G91 ; relative positioning
G1 Z5 E-5 F3000 ; raise Z 5mm and retract 5mm
G90 ; absolute positioning
G1 X0 Y0 ; move to X=0 Y=0
