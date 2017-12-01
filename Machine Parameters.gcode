;After the semicolon is a comment, please modify the parameters according to the annotation
;The basic format is Mxxx Ixxx,Mxxx Txxx or Mxxx Sxxx, among them Ixx(is the letter I, not a numbner 1)Followed by numbers, with possible decimals，it can can also be hexadecimal (starting with 0x)，Sxx followed by a floating point number.
; 
M8998 I1		;Enable configuration
;;;;;;;;;;;;;;;;;;;;;;;;;The following two configurations need to be used in conjunction with the printer for shutdown and power saving;;;;;;;;;;
M8000 I0	;;Power to save support or not, I1 said support, I0 that does not support, set up after the restart to take effect
M8001 I0	;;Print shutdown support or not, I1 said support, I0 that does not support, set up after the restart to take effect

;The following is the stepper motor direction control，I1 and I-1 in the opposite direction, so if the motor direction is wrong, or change the wiring, or change the direction of the parameters.
M8002 I1;		;X stepper motor direction, I1 or I-1
M8003 I1		;Y Stepper motor direction
M8004 I1		;Z Stepper motor direction
M8005 I-1		;E Stepper motor direction
;M8005 I1 E2	;Set the second E stepper motor direction, I1 or I-1, if not set, the second E motor direction is opposite to the first motor direction
;
;;;;;;;;;;;;;XYZ axis extrusion / platform movement configuration only affects the actual movement of the manual interface button;;;;;;;;;;;;;;
M8005 X0	;               0:X Axial direction of the extrusion head movement
		;1:X Axial direction of the platform movement Currently on the market of the machine, most of the X-axis extrusion head movement
M8005 Y0	;               0:Y Axial direction of the extrusion head movement
		;1:Y Axis direction of the current movement of the platform I3 Y axis is the platform movement,
			;				delta, ultimaker with makerbot The Y-axis is the extrusion head movement
M8005 Z1    ;0:Z Axial direction of the extrusion head movement
		;1:Z Axis direction of the platform movement current I3 structure and delta structure Z axis is the extrusion head movement,
		;			ultimaker with makerbot Structure Z axis is platform movement
;
;Speed-dependent setting, in mm/s speed, in mm/s^2 increments

M8006	I80	        ;Start speed, when the speed of movement exceeds this speed, the speed as the starting speed began to accelerate, otherwise the speed of movement at constant speed
M8007	I15	        ;Turn the maximum speed, when playing in the filling, there will be a lot of reciprocating motion, this value is large, the noise is large, the value is small, slow
M8008	I1000       ;Acceleration, the greater the value, the actual operation of the average speed greater, but the noise is also large, the value is small, the actual speed will be smaller.

;Machine-related parameters, parameters set finished, please print a cube, and then use the size of the size of the ruler to confirm the parameters no problem
;M8009  S0.010625		;XY each step of the mm value, such as 20 teeth, pitch 2.032mm, 1.8 degree stepper motor, 16 subdivision, compared with (20*2.032)/((360/1.8)*16)
M8009 X0.010617 Y0.010595	;If you need to set the X, Y stepper motor parameters independently, you can use this command (to remove the Bank)
M8010  S0.0025	;Z each step of the mm value, the formula: lead / ((360/1.8)*16), the lead for the screw to turn the platform to rise the height
M8011  S0.00210	;   S0.01079E the value of each step mm, this value is equal to the circumference of the extrusion gear divided by 3200, if there is a reduction gear to be divided by the reduction ratio, if you find the set of silk is thin, or often fault, it is recommended to set this value To be smaller than the true value, the silk is better

;The maximum speed of various parameters, in order to ensure the machine can be stable, according to the measured results set
M8012  I200		;XY maximum speed of movement mm/s
M8013  I30		;Z maximum speed of movement mm/s
M8014  I120		;extruder maximum speed mm/s

;Z zero speed, makerware slice software slice, will ignore this zero return speed, because its gcode has a specified zero return speed
M8015  I8		;Z Zero return to the first time zero speed, faster
M8015  S30		;XY
M8016  I4		;Z Zero return to the first time zero speed, faster
M8016  S5		;XY Zero return to the second zero speed, slower


;Pre-extrusion before printing
M8017	I10		;Pre-extrusion length mm, the first layer and the bottom plate is firmly bonded to the print quality, a little more pre-extrusion will make the bottom plate stick better
M8018	I20		;Extruder maximum pre-extrusion speed mm / s, non-reducer gear feed, the maximum speed is usually more than 100,

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;The following two parameters and compatibility with the Replicator / Makerware software is closely related, if you do not intend to be compatible with such software, you can not control
M8019	I50		;The maximum retraction speed, in mm / s, is the same as the maximum speed of E. The default Makerware double-headed slices are very slow, and the pause time is very long
M8020	S1.5	;Wire length, mm, picking distance, back pumping too small will leak, pull too large, pause time is too long, but also easy to leak wire, according to your type of feed and extrusion type reasonable set, if 0 , Retracts the length to follow the slice software
M8033	S8		;Makerware software to switch the length of the extrusion head when the length, makerware slices specified retraction is very long, and then back when the easy card, if zero, follow the slice software settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Set the machine to use the default consumable diameter in units of mm
M8021	S1.75		;Consumables diameter

;Extreme temperature of extruded head
M8022 I250		;Extruded head to support the maximum temperature, set the temperature in order to prevent the user misuse the extrusion head temperature caused by the extrusion head damage, thermal resistance can only be to 260 degrees, peek tube is also about 260 degrees softening

;Hot bed maximum temperature
M8023 I120		;Hot plate maximum temperature, high temperature is easy to damage the hot plate

;Prohibit temperature error detection，the default temperature error detection will be in the temperature sensor is not plugged in or when the heating power is too small to warn, it is strongly recommended not to disable this feature
M8023 T0		;1: prohibit temperature error detection       0: enable temperature detection

;X，Y，Z The maximum distance is set according to the actual print size mm
;be sure to set this parameter carefully！！！！！！
M8024 I178		;175 X maximum distance, in the case of lcd to enable the sound, the movement beyond the trigger will cause the buzzer tweet
M8025 I144		;149 Y maximum distance
M8026 I149		;149 Z maximum distance

;Set the number of extrusion head, at least one, currently up to 2
M8027	I1		;configure the number of extruded heads

;the second extruder is used as Z, and some large machines require two Z-axes, so the E2 can be used as a Z-axis, and the command forces the number of extruded heads to 1
;M8027  Z0		;If you enable this function, please remove the preceding ';', to disable the function, use ';' to comment it out, 0: double Z double limit mode, the second limit then X +, 1: Dual Z single limit mode, only need to connect a limit switch
;The second extrusion head is used as Y
;M8027  Y0		;If this feature is enabled, remove the preceding ';', disable the function, and comment it out with ';'

;some machines may wish to ban the hot bed, possibly by prohibiting the hot bed
M8027  T1		;1： enable hot bed, 0: disable hot bed

;adavnced settings
M8028	S0.00	;retraction compensation，retract and then test，because the role of elasticity a little bit than the original position back，If not working change back to zero


;limit switch structure type
;0:reprap model，normal use repetier-host with cura, limit switch position at x, y zero, limit press X-,Y-
;1:makerbot replicator similar models are usually used replicatorG/makerware/makerbot desktop slice software, limit position at the maximum of x, y, limit access X+,Y+
;2:ultimaker models, both sides with limit switch
;3:models with the left rear of the machine limit (very few, limit then X-,Y+)
;For delta-type machines, this parameter is ignored and the limit switches are all received X+,Y+,Z+,
M8029	I1		;0: unilateral zero limit，such as mendel,i3...    1:unilateral maximum point limit, such as makerbot model    2：bilateral limit, such asultimaker model	3:left rear limit (rarely)


;XYZ limit switch wiring type, if this configuration is wrong in the manual interface to operate the motor, in a certain direction the motor can not move and the buzzer will be issued a drop of sound.
;simple judgment method，if the configuration is normal and the limit is changed from the limit, the buzzer will send a drop of sound, and the buzzer will not sound when the limit becomes unlimited. If the problem is reversed, modify this configuration if you can.
M8029   T0	;0: Limit switch normally open (not limit - and s voltage is high, the limit is low)  	1:Limit switch normally closed (not limit - and s voltage is low, the limit is high)

;Z axis limit switch position
M8029	S0		;0：extrude head from the platform at the nearest time limit, limit access Z- 1：extrude head from the platform farthest time limit, limit access Z+


;If the function is enabled, the leveling limit of the delta structure must be connected to Z-. If this function is not enabled, the leveling of the delta structure should be connected to the level of FILAMENT. Limit access FILAMENT
M8029 	D0		;0:do not allow breakage detection			1:enable breakage detection

;;;;;;;;;;;;;;;;;;;Break detection limit FILAMENT at the beginning of the configuration, when the function is not enabled to break the material, the delta leveling limit switch connected to the above;;;;;;;;;;;;;;;;;;;;;;;;;;;;
M8029	P1		;1:same as XYZ limit type   -1:invert the XYZ limit type


;If the extruded head is the makerbot structure, the extruder will need to heat it when heated, otherwise the extrusion is overheated if the extruded head is ultimaker and the fan needs to be opened by the slice software
M8030	I0	        ;If you need to force the extruder to automatically turn on the fan when it is greater than a certain temperature, set a temperature greater than 0. If set to 0, the fan starts with slicing software

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Set the motherboard fan self-starting temperature, must be placed on the M8030 I0 command, the makerbot motherboard has two fans, a side of the fan above a certain temperature will open, you can fan the motherboard fan, and configure this parameter
M8030 I50 T-1		;IThe following parameters indicate the temperature, when 0 is, that the motherboard fan will not change with temperature, or when the extrusion head temperature reaches the specified temperature, the fan will open

;set the offset of the second extrusion head (right squeeze head) in mm. The following two parameters are only valid when the nozzle is set to 2
M8031	S31.18	;S35.0 X offset direction
M8032	S3.7		;S0 Y offset direction

;SD enable SD card folder support
M8034	I1		;0: disable 1： enable

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;If the X and Y are less than 1, then the relative stroke ratio, otherwise expressed as X, Y absolute coordinates, the unit is mm
M8035	I3		;the number of leveling points，
M8036	X5 Y5	;how many points, how many instructions
;if the trip is (200,200), the M8036 X0.1 Y0.1 versus M8036 X20 Y20 has the same effect.
M8036	X142 Y5
M8036	X73 Y145
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;machine type
M8080 I0	        ;Machine Type: 0: XYZ Normal Types   2:Hbot types
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;thermal resistance type
;for the thermal resistance, the same parameters of the thermal resistance is also slightly different, different thermal resistance at low temperatures when the temperature is relatively close, at high temperatures, the display temperature difference of up to 40 degrees,
if it is a thermistor, be sure to set the correct thermal resistance type
M8081 I1	;temperature sensor type:0: ideal NTC 100K 1% 3950 B   
                                1:K type thermocouple 
                                2:EPCOS NTC 100K 1% 3950 B,correspond marlin of the sensor type 2 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

M8085 I3000	;boot logo duration，min 100ms, max 6000ms
M8085 P0	;standby time will turn off the machine, this function is only installed off the shutdown function module settings to use some settings, the unit is seconds (s), 0 is said to prohibit standby shutdown function
M8086	I1	;software frequency, and some users use the 0.9 step angle from the motor or external 32 subdivision of the drive, hoping to achieve 1.8 step angle or 16 segment effect, you can set the frequency to 2, the default is 1, Do not divide the frequency
M8087 I15000 T0	;I:the direction signal is valid until the pulse signal is high on the settling time, the unit is ns  T：the shortest hold time of the pulse signal is in units ns ,if you do not have an external drive dashboard, set it to zero
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;advanced configuration, in most cases do not need to edit;;;;;;;;;;;;;;;;;;;;;
M8489	I256	;motherboard fan since the start of the pwm ratio, the highest is 256,some motherboard fan speed is relatively strong, the noise is relatively loud, you can use this parameter to change the fan speed and noise level.
M8489	T3		;of the supplies of the interface, the loading of the feed into the wire speed, the unit is mm/s, into the wire too fast, can not timely wire, resulting in squeeze out of the extruder and out of step
M8489	P0		;whether or not the motor is turned off after the print is complete    	 0：Turn off all motors    	1：after printing does not work, completely obey the gcode directive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;the temperature of the PID parameter settings, if you are not an expert, and your current temperature control is relatively stable, you should not edit this parameter
M301 P30 I0.75 D600 ;set new PID Settings here after M303 PID Auto tune cycle is complete M301 PXX IX.XX DXXX
;M301 P21.303133 I1.274111 D89.047089 ; QIDI PID tune 11-20-2017
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Auto tune PID command，this command will block for a long time
M303 E0 S150 C5	;temperature 150 degrees, automatic cycle shock 4 times, auto-modulation after the parameters may pass repetier-host see the modulation after pid parameter.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

M8520	I0		;1:support the relevant configuration of laser engraving  0：Does not support the laser engraving of the relevant configuration, the relevant function is set in the more button inside the speed.


;save command, this parameter must not be less, otherwise the parameters can not be saved to the device
M8500		;save the configuration
