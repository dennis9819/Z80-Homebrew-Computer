EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 3 7
Title ""
Date ""
Rev ""
Comp "Dennis Gunia"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CPU:Z80CPU U13
U 1 1 622C5F07
P 3350 2400
F 0 "U13" H 3350 4081 50  0000 C CNN
F 1 "Z80CPU" H 3350 3990 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_LongPads" H 3350 2800 50  0001 C CNN
F 3 "www.zilog.com/manage_directlink.php?filepath=docs/z80/um0080" H 3350 2800 50  0001 C CNN
	1    3350 2400
	1    0    0    -1  
$EndComp
Text GLabel 2450 1200 0    50   Input ~ 0
!RESET
Text GLabel 2450 1500 0    50   Input ~ 0
CLK_CPU
Wire Wire Line
	2450 1200 2650 1200
Wire Wire Line
	2650 1500 2450 1500
Wire Wire Line
	4050 1200 4650 1200
Entry Wire Line
	4650 1200 4750 1100
Text Label 4150 1200 0    50   ~ 0
A0
Wire Wire Line
	4050 1300 4650 1300
Entry Wire Line
	4650 1300 4750 1200
Text Label 4150 1300 0    50   ~ 0
A1
Wire Wire Line
	4050 1400 4650 1400
Entry Wire Line
	4650 1400 4750 1300
Text Label 4150 1400 0    50   ~ 0
A2
Wire Wire Line
	4050 1500 4650 1500
Entry Wire Line
	4650 1500 4750 1400
Text Label 4150 1500 0    50   ~ 0
A3
Wire Wire Line
	4050 1600 4650 1600
Entry Wire Line
	4650 1600 4750 1500
Text Label 4150 1600 0    50   ~ 0
A4
Wire Wire Line
	4050 1700 4650 1700
Entry Wire Line
	4650 1700 4750 1600
Text Label 4150 1700 0    50   ~ 0
A5
Wire Wire Line
	4050 1800 4650 1800
Entry Wire Line
	4650 1800 4750 1700
Text Label 4150 1800 0    50   ~ 0
A6
Wire Wire Line
	4050 1900 4650 1900
Entry Wire Line
	4650 1900 4750 1800
Text Label 4150 1900 0    50   ~ 0
A7
Wire Wire Line
	4050 2000 4650 2000
Entry Wire Line
	4650 2000 4750 1900
Text Label 4150 2000 0    50   ~ 0
A8
Wire Wire Line
	4050 2100 4650 2100
Entry Wire Line
	4650 2100 4750 2000
Text Label 4150 2100 0    50   ~ 0
A9
Wire Wire Line
	4050 2200 4650 2200
Entry Wire Line
	4650 2200 4750 2100
Text Label 4150 2200 0    50   ~ 0
A10
Wire Wire Line
	4050 2300 4650 2300
Entry Wire Line
	4650 2300 4750 2200
Text Label 4150 2300 0    50   ~ 0
A11
Wire Wire Line
	4050 2400 4650 2400
Entry Wire Line
	4650 2400 4750 2300
Text Label 4150 2400 0    50   ~ 0
A12
Wire Wire Line
	4050 2500 4650 2500
Entry Wire Line
	4650 2500 4750 2400
Text Label 4150 2500 0    50   ~ 0
A13
Wire Wire Line
	4050 2600 4650 2600
Entry Wire Line
	4650 2600 4750 2500
Text Label 4150 2600 0    50   ~ 0
A14
Wire Wire Line
	4050 2700 4650 2700
Entry Wire Line
	4650 2700 4750 2600
Text Label 4150 2700 0    50   ~ 0
A15
Wire Wire Line
	4050 2900 4650 2900
Entry Wire Line
	4650 2900 4750 2800
Text Label 4150 2900 0    50   ~ 0
D0
Wire Wire Line
	4050 3000 4650 3000
Entry Wire Line
	4650 3000 4750 2900
Text Label 4150 3000 0    50   ~ 0
D1
Wire Wire Line
	4050 3100 4650 3100
Entry Wire Line
	4650 3100 4750 3000
Text Label 4150 3100 0    50   ~ 0
D2
Wire Wire Line
	4050 3200 4650 3200
Entry Wire Line
	4650 3200 4750 3100
Text Label 4150 3200 0    50   ~ 0
D3
Wire Wire Line
	4050 3300 4650 3300
Entry Wire Line
	4650 3300 4750 3200
Text Label 4150 3300 0    50   ~ 0
D4
Wire Wire Line
	4050 3400 4650 3400
Entry Wire Line
	4650 3400 4750 3300
Text Label 4150 3400 0    50   ~ 0
D5
Wire Wire Line
	4050 3500 4650 3500
Entry Wire Line
	4650 3500 4750 3400
Text Label 4150 3500 0    50   ~ 0
D6
Wire Wire Line
	4050 3600 4650 3600
Entry Wire Line
	4650 3600 4750 3500
Text Label 4150 3600 0    50   ~ 0
D7
$Comp
L Device:R R9
U 1 1 620FCB13
P 1750 1550
F 0 "R9" H 1820 1596 50  0000 L CNN
F 1 "10k" H 1820 1505 50  0000 L CNN
F 2 "" V 1680 1550 50  0001 C CNN
F 3 "~" H 1750 1550 50  0001 C CNN
	1    1750 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 620FD10E
P 1450 1550
F 0 "R8" H 1520 1596 50  0000 L CNN
F 1 "10k" H 1520 1505 50  0000 L CNN
F 2 "" V 1380 1550 50  0001 C CNN
F 3 "~" H 1450 1550 50  0001 C CNN
	1    1450 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 620FD96F
P 1150 1550
F 0 "R7" H 1220 1596 50  0000 L CNN
F 1 "10k" H 1220 1505 50  0000 L CNN
F 2 "" V 1080 1550 50  0001 C CNN
F 3 "~" H 1150 1550 50  0001 C CNN
	1    1150 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 1800 1750 1800
Wire Wire Line
	1750 1800 1750 1700
Wire Wire Line
	2650 1900 1450 1900
Wire Wire Line
	1450 1900 1450 1700
Wire Wire Line
	2650 2400 1150 2400
Wire Wire Line
	1150 2400 1150 1700
$Comp
L Device:R R6
U 1 1 620FF5E9
P 850 1550
F 0 "R6" H 920 1596 50  0000 L CNN
F 1 "10k" H 920 1505 50  0000 L CNN
F 2 "" V 780 1550 50  0001 C CNN
F 3 "~" H 850 1550 50  0001 C CNN
	1    850  1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 3500 2600 3500
Wire Wire Line
	850  3500 850  1700
$Comp
L power:+5V #PWR0118
U 1 1 6210082C
P 850 1200
F 0 "#PWR0118" H 850 1050 50  0001 C CNN
F 1 "+5V" H 865 1373 50  0000 C CNN
F 2 "" H 850 1200 50  0001 C CNN
F 3 "" H 850 1200 50  0001 C CNN
	1    850  1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  1400 850  1300
Wire Wire Line
	850  1300 1150 1300
Wire Wire Line
	1150 1300 1150 1400
Connection ~ 850  1300
Wire Wire Line
	850  1300 850  1200
Wire Wire Line
	1150 1300 1450 1300
Wire Wire Line
	1450 1300 1450 1400
Connection ~ 1150 1300
Wire Wire Line
	1450 1300 1750 1300
Wire Wire Line
	1750 1300 1750 1400
Connection ~ 1450 1300
Text GLabel 750  1800 0    50   Input ~ 0
!NMI
Text GLabel 750  1900 0    50   Input ~ 0
!INT
Text GLabel 750  2400 0    50   Input ~ 0
!WAIT
Text GLabel 750  2500 0    50   Output ~ 0
!HALT
Text GLabel 750  2200 0    50   Output ~ 0
!M1
Text GLabel 2450 2900 0    50   Output ~ 0
!RD
Text GLabel 2450 3000 0    50   Output ~ 0
!WR
Text GLabel 2450 3100 0    50   Output ~ 0
!MREQ
Text GLabel 2450 3200 0    50   Output ~ 0
!IOREQ
Text GLabel 2500 3600 0    50   Output ~ 0
!BUSACK
Text GLabel 2500 3400 0    50   Input ~ 0
!BUSREQ
Wire Wire Line
	2500 3600 2650 3600
Wire Wire Line
	2500 3400 2600 3400
Wire Wire Line
	2600 3400 2600 3500
Connection ~ 2600 3500
Wire Wire Line
	2600 3500 850  3500
Wire Wire Line
	2450 3200 2650 3200
Wire Wire Line
	2650 3100 2450 3100
Wire Wire Line
	2450 3000 2650 3000
Wire Wire Line
	2650 2900 2450 2900
Wire Wire Line
	750  2500 2650 2500
Wire Wire Line
	750  2400 1150 2400
Connection ~ 1150 2400
Wire Wire Line
	750  2200 2650 2200
Connection ~ 1750 1800
Wire Wire Line
	750  1900 1450 1900
Connection ~ 1450 1900
Wire Wire Line
	750  1800 1750 1800
NoConn ~ 2650 2300
$Comp
L Memory_EEPROM:28C256 U16
U 1 1 62116094
P 6250 2100
F 0 "U16" H 6250 3381 50  0000 C CNN
F 1 "28C256" H 6250 3290 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_LongPads" H 6250 2100 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0006.pdf" H 6250 2100 50  0001 C CNN
	1    6250 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 1200 5250 1200
Entry Wire Line
	5250 1200 5150 1100
Text Label 5750 1200 2    50   ~ 0
A0
Wire Wire Line
	5850 1300 5250 1300
Entry Wire Line
	5250 1300 5150 1200
Text Label 5750 1300 2    50   ~ 0
A1
Wire Wire Line
	5850 1400 5250 1400
Entry Wire Line
	5250 1400 5150 1300
Text Label 5750 1400 2    50   ~ 0
A2
Wire Wire Line
	5850 1500 5250 1500
Entry Wire Line
	5250 1500 5150 1400
Text Label 5750 1500 2    50   ~ 0
A3
Wire Wire Line
	5850 1600 5250 1600
Entry Wire Line
	5250 1600 5150 1500
Text Label 5750 1600 2    50   ~ 0
A4
Wire Wire Line
	5850 1700 5250 1700
Entry Wire Line
	5250 1700 5150 1600
Text Label 5750 1700 2    50   ~ 0
A5
Wire Wire Line
	5850 1800 5250 1800
Entry Wire Line
	5250 1800 5150 1700
Text Label 5750 1800 2    50   ~ 0
A6
Wire Wire Line
	5850 1900 5250 1900
Entry Wire Line
	5250 1900 5150 1800
Text Label 5750 1900 2    50   ~ 0
A7
Wire Wire Line
	5850 2000 5250 2000
Entry Wire Line
	5250 2000 5150 1900
Text Label 5750 2000 2    50   ~ 0
A8
Wire Wire Line
	5850 2100 5250 2100
Entry Wire Line
	5250 2100 5150 2000
Text Label 5750 2100 2    50   ~ 0
A9
Wire Wire Line
	5850 2200 5250 2200
Entry Wire Line
	5250 2200 5150 2100
Text Label 5750 2200 2    50   ~ 0
A10
Wire Wire Line
	5850 2300 5250 2300
Entry Wire Line
	5250 2300 5150 2200
Text Label 5750 2300 2    50   ~ 0
A11
Wire Wire Line
	5850 2400 5250 2400
Entry Wire Line
	5250 2400 5150 2300
Text Label 5750 2400 2    50   ~ 0
A12
Wire Wire Line
	5850 2500 5250 2500
Entry Wire Line
	5250 2500 5150 2400
Text Label 5750 2500 2    50   ~ 0
A13
Wire Wire Line
	6650 1200 7250 1200
Entry Wire Line
	7250 1200 7350 1100
Text Label 6750 1200 0    50   ~ 0
D0
Wire Wire Line
	6650 1300 7250 1300
Entry Wire Line
	7250 1300 7350 1200
Text Label 6750 1300 0    50   ~ 0
D1
Wire Wire Line
	6650 1400 7250 1400
Entry Wire Line
	7250 1400 7350 1300
Text Label 6750 1400 0    50   ~ 0
D2
Wire Wire Line
	6650 1500 7250 1500
Entry Wire Line
	7250 1500 7350 1400
Text Label 6750 1500 0    50   ~ 0
D3
Wire Wire Line
	6650 1600 7250 1600
Entry Wire Line
	7250 1600 7350 1500
Text Label 6750 1600 0    50   ~ 0
D4
Wire Wire Line
	6650 1700 7250 1700
Entry Wire Line
	7250 1700 7350 1600
Text Label 6750 1700 0    50   ~ 0
D5
Wire Wire Line
	6650 1800 7250 1800
Entry Wire Line
	7250 1800 7350 1700
Text Label 6750 1800 0    50   ~ 0
D6
Wire Wire Line
	6650 1900 7250 1900
Entry Wire Line
	7250 1900 7350 1800
Text Label 6750 1900 0    50   ~ 0
D7
Text GLabel 5650 2900 0    50   Input ~ 0
!RD
Text GLabel 5650 2800 0    50   Input ~ 0
!WR
Wire Wire Line
	5650 2800 5850 2800
Wire Wire Line
	5650 2900 5850 2900
$Comp
L 74xx:74HC137 U11
U 1 1 6214A79A
P 2250 4800
F 0 "U11" H 2250 5581 50  0000 C CNN
F 1 "74HC137" H 2250 5490 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 2250 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74hc237.pdf" H 2250 4800 50  0001 C CNN
	1    2250 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 4400 1250 4400
Entry Wire Line
	1250 4400 1150 4300
Text Label 1750 4400 2    50   ~ 0
A14
Wire Wire Line
	1850 4500 1250 4500
Entry Wire Line
	1250 4500 1150 4400
Text Label 1750 4500 2    50   ~ 0
A15
Text GLabel 1700 4800 0    50   Input ~ 0
!MREQ
Wire Wire Line
	1700 4800 1800 4800
Wire Wire Line
	1850 5000 1800 5000
Wire Wire Line
	1800 5000 1800 4800
Connection ~ 1800 4800
Wire Wire Line
	1800 4800 1850 4800
Wire Wire Line
	1800 4800 1800 4600
Wire Wire Line
	1800 4600 1850 4600
$Comp
L power:+5V #PWR0119
U 1 1 6216B886
P 1650 5100
F 0 "#PWR0119" H 1650 4950 50  0001 C CNN
F 1 "+5V" H 1665 5273 50  0000 C CNN
F 2 "" H 1650 5100 50  0001 C CNN
F 3 "" H 1650 5100 50  0001 C CNN
	1    1650 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 5100 1850 5100
NoConn ~ 2650 5100
NoConn ~ 2650 5000
NoConn ~ 2650 4900
NoConn ~ 2650 4800
$Comp
L 74xx:74HC74 U10
U 1 1 621AA5AA
P 2150 6050
F 0 "U10" H 2150 6531 50  0000 C CNN
F 1 "74HC74" H 2150 6440 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 2150 6050 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 2150 6050 50  0001 C CNN
	1    2150 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 5950 1250 5950
Entry Wire Line
	1250 5950 1150 5850
Text Label 1750 5950 2    50   ~ 0
D0
Wire Wire Line
	2150 5750 1650 5750
Wire Wire Line
	1650 5750 1650 5100
Connection ~ 1650 5100
Text GLabel 1950 6400 0    50   Input ~ 0
!RESET
Wire Wire Line
	2150 6400 2150 6350
Wire Wire Line
	1950 6400 2150 6400
$Comp
L 74xx:74LS32 U9
U 1 1 621D9D82
P 3550 5550
F 0 "U9" H 3550 5875 50  0000 C CNN
F 1 "74LS32" H 3550 5784 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3550 5550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3550 5550 50  0001 C CNN
	1    3550 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 4400 2950 4400
Wire Wire Line
	2950 4400 2950 5450
Wire Wire Line
	2950 5450 3150 5450
Wire Wire Line
	2450 6150 2950 6150
Wire Wire Line
	2950 6150 2950 5650
Wire Wire Line
	2950 5650 3250 5650
Wire Wire Line
	3850 5550 4850 5550
Wire Wire Line
	4850 5550 4850 3000
Wire Wire Line
	4850 3000 5850 3000
$Comp
L 74xx:74LS32 U9
U 2 1 621F5FCB
P 3550 6150
F 0 "U9" H 3550 6475 50  0000 C CNN
F 1 "74LS32" H 3550 6384 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3550 6150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3550 6150 50  0001 C CNN
	2    3550 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 5950 3050 6250
Wire Wire Line
	3050 6250 3250 6250
Wire Wire Line
	2450 5950 3050 5950
Wire Wire Line
	3250 6050 3150 6050
Wire Wire Line
	3150 6050 3150 5450
Connection ~ 3150 5450
Wire Wire Line
	3150 5450 3250 5450
$Comp
L 74xx:74LS08 U15
U 1 1 62224BFA
P 4350 6050
F 0 "U15" H 4350 6375 50  0000 C CNN
F 1 "74LS08" H 4350 6284 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4350 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4350 6050 50  0001 C CNN
	1    4350 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 6150 4050 6150
Wire Wire Line
	2650 4500 3950 4500
Wire Wire Line
	3950 4500 3950 5950
Wire Wire Line
	3950 5950 4050 5950
$Comp
L 74xx:74LS08 U15
U 2 1 62235891
P 4350 4700
F 0 "U15" H 4350 5025 50  0000 C CNN
F 1 "74LS08" H 4350 4934 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4350 4700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4350 4700 50  0001 C CNN
	2    4350 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 4600 4050 4600
Wire Wire Line
	2650 4700 4050 4700
Wire Wire Line
	4050 4700 4050 4800
Text GLabel 8800 2300 2    50   Input ~ 0
!RD
Text GLabel 8800 2400 2    50   Input ~ 0
!WR
Wire Wire Line
	8800 2400 8750 2400
Wire Wire Line
	8800 2300 8750 2300
Wire Bus Line
	5150 600  4750 600 
Connection ~ 5150 600 
Wire Bus Line
	1150 4050 4750 4050
$Comp
L Memory_RAM:AS6C4008-55PCN U18
U 1 1 6214B011
P 8250 2100
F 0 "U18" H 8250 3381 50  0000 C CNN
F 1 "AS6C4008-55PCN" H 8250 3290 50  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm" H 8250 2200 50  0001 C CNN
F 3 "https://www.alliancememory.com/wp-content/uploads/pdf/AS6C4008.pdf" H 8250 2200 50  0001 C CNN
	1    8250 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 1200 7450 1200
Entry Wire Line
	7450 1200 7350 1100
Text Label 7700 1200 2    50   ~ 0
A0
Wire Wire Line
	7750 1300 7450 1300
Entry Wire Line
	7450 1300 7350 1200
Text Label 7700 1300 2    50   ~ 0
A1
Wire Wire Line
	7750 1400 7450 1400
Entry Wire Line
	7450 1400 7350 1300
Text Label 7700 1400 2    50   ~ 0
A2
Wire Wire Line
	7750 1500 7450 1500
Entry Wire Line
	7450 1500 7350 1400
Text Label 7700 1500 2    50   ~ 0
A3
Wire Wire Line
	7750 1600 7450 1600
Entry Wire Line
	7450 1600 7350 1500
Text Label 7700 1600 2    50   ~ 0
A4
Wire Wire Line
	7750 1700 7450 1700
Entry Wire Line
	7450 1700 7350 1600
Text Label 7700 1700 2    50   ~ 0
A5
Wire Wire Line
	7750 1800 7450 1800
Entry Wire Line
	7450 1800 7350 1700
Text Label 7700 1800 2    50   ~ 0
A6
Wire Wire Line
	7750 1900 7450 1900
Entry Wire Line
	7450 1900 7350 1800
Text Label 7700 1900 2    50   ~ 0
A7
Wire Wire Line
	7750 2000 7450 2000
Entry Wire Line
	7450 2000 7350 1900
Text Label 7700 2000 2    50   ~ 0
A8
Wire Wire Line
	7750 2100 7450 2100
Entry Wire Line
	7450 2100 7350 2000
Text Label 7700 2100 2    50   ~ 0
A9
Wire Wire Line
	7750 2200 7450 2200
Entry Wire Line
	7450 2200 7350 2100
Text Label 7700 2200 2    50   ~ 0
A10
Wire Wire Line
	7750 2300 7450 2300
Entry Wire Line
	7450 2300 7350 2200
Text Label 7700 2300 2    50   ~ 0
A11
Wire Wire Line
	7750 2400 7450 2400
Entry Wire Line
	7450 2400 7350 2300
Text Label 7700 2400 2    50   ~ 0
A12
Text Label 8850 1200 0    50   ~ 0
D0
Text Label 8850 1300 0    50   ~ 0
D1
Text Label 8850 1400 0    50   ~ 0
D2
Text Label 8850 1500 0    50   ~ 0
D3
Text Label 8850 1600 0    50   ~ 0
D4
Text Label 8850 1700 0    50   ~ 0
D5
Text Label 8850 1800 0    50   ~ 0
D6
Text Label 8850 1900 0    50   ~ 0
D7
$Comp
L 74xx:74LS08 U15
U 3 1 621F6CC0
P 5250 4800
F 0 "U15" H 5250 5125 50  0000 C CNN
F 1 "74LS08" H 5250 5034 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5250 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5250 4800 50  0001 C CNN
	3    5250 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 4700 4950 4700
Wire Wire Line
	4650 6050 4950 6050
Wire Wire Line
	4950 6050 4950 4900
Wire Wire Line
	6600 5250 6000 5250
Entry Wire Line
	6000 5250 5900 5150
Text Label 6500 5250 2    50   ~ 0
D0
Wire Wire Line
	6600 5350 6000 5350
Entry Wire Line
	6000 5350 5900 5250
Text Label 6500 5350 2    50   ~ 0
D1
Wire Wire Line
	6600 5450 6000 5450
Entry Wire Line
	6000 5450 5900 5350
Text Label 6500 5450 2    50   ~ 0
D2
Wire Wire Line
	6600 5550 6000 5550
Entry Wire Line
	6000 5550 5900 5450
Text Label 6500 5550 2    50   ~ 0
D3
Wire Bus Line
	5150 600  7350 600 
Wire Wire Line
	7750 2500 7450 2500
Entry Wire Line
	7450 2500 7350 2400
Text Label 7700 2500 2    50   ~ 0
A13
Connection ~ 7350 600 
Wire Bus Line
	7350 600  9150 600 
Wire Wire Line
	5550 4800 5600 4800
Wire Wire Line
	6600 6350 6500 6350
$Comp
L power:GND #PWR0120
U 1 1 624D763A
P 6500 6350
F 0 "#PWR0120" H 6500 6100 50  0001 C CNN
F 1 "GND" H 6505 6177 50  0000 C CNN
F 2 "" H 6500 6350 50  0001 C CNN
F 3 "" H 6500 6350 50  0001 C CNN
	1    6500 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 5750 6000 5750
Entry Wire Line
	6000 5750 5900 5650
Text Label 6500 5750 2    50   ~ 0
A0
Wire Wire Line
	6600 5850 6000 5850
Entry Wire Line
	6000 5850 5900 5750
Text Label 6500 5850 2    50   ~ 0
A1
Wire Wire Line
	6600 6150 6000 6150
Entry Wire Line
	6000 6150 5900 6050
Text Label 6500 6150 2    50   ~ 0
A14
Wire Wire Line
	6600 6250 6000 6250
Entry Wire Line
	6000 6250 5900 6150
Text Label 6500 6250 2    50   ~ 0
A15
Wire Bus Line
	5900 4700 7350 4700
Text Notes 6300 7500 0    50   ~ 0
Memory bank switching logic\n4x 16KiB Banks\n\nW0 Bank defines $0000-$3FFF\nW1 Bank defines $4000-$7FFF\nW2 Bank defines $8000-$AFFF\nW3 Bank defines $B000-$FFFF\n
Text Notes 1100 6450 1    50   ~ 0
If latch is set, the system rom will \nalways be visible in the first 16K Page,\nindependent of the selected bank.
Wire Wire Line
	8900 6350 8800 6350
$Comp
L power:GND #PWR0121
U 1 1 62599472
P 8800 6350
F 0 "#PWR0121" H 8800 6100 50  0001 C CNN
F 1 "GND" H 8805 6177 50  0000 C CNN
F 2 "" H 8800 6350 50  0001 C CNN
F 3 "" H 8800 6350 50  0001 C CNN
	1    8800 6350
	1    0    0    -1  
$EndComp
Text Label 8800 5750 2    50   ~ 0
A0
Wire Wire Line
	8900 5850 8300 5850
Text Label 8800 5850 2    50   ~ 0
A1
Wire Wire Line
	8900 6150 8300 6150
Text Label 8800 6150 2    50   ~ 0
A14
Wire Wire Line
	8900 6250 8300 6250
Text Label 8800 6250 2    50   ~ 0
A15
Wire Wire Line
	8900 5250 8300 5250
Entry Wire Line
	8300 5250 8200 5150
Text Label 8800 5250 2    50   ~ 0
D4
Wire Wire Line
	8900 5350 8300 5350
Entry Wire Line
	8300 5350 8200 5250
Text Label 8800 5350 2    50   ~ 0
D5
Wire Wire Line
	8900 5450 8300 5450
Entry Wire Line
	8300 5450 8200 5350
Text Label 8800 5450 2    50   ~ 0
D6
Wire Wire Line
	8900 5550 8300 5550
Entry Wire Line
	8300 5550 8200 5450
Text Label 8800 5550 2    50   ~ 0
D7
Entry Wire Line
	8300 5750 8200 5650
Entry Wire Line
	8300 5850 8200 5750
Entry Wire Line
	8300 6150 8200 6050
Entry Wire Line
	8300 6250 8200 6150
Wire Bus Line
	7350 4700 8200 4700
Connection ~ 7350 4700
Wire Wire Line
	5600 4800 5600 6800
Text Notes 7650 7600 0    50   ~ 0
Each bank can map 2??? (32) 16K memory pages. \nEach page can be mapped to each bank.\n\nInitial mapping needs to be set during\nsystem initialization.\n\nThe EEPROM location cannot be changed\nand is always in bank 0.
$Comp
L 74xx:74HC137 U20
U 1 1 62768D7E
P 11500 5750
F 0 "U20" H 11500 6531 50  0000 C CNN
F 1 "74HC137" H 11500 6440 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 11500 5750 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74hc237.pdf" H 11500 5750 50  0001 C CNN
	1    11500 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	11000 6800 11000 5950
Wire Wire Line
	11000 5750 11100 5750
Wire Wire Line
	11100 5950 11000 5950
Connection ~ 11000 5950
Wire Wire Line
	11000 5950 11000 5750
$Comp
L power:+5V #PWR0122
U 1 1 6284851F
P 10850 5950
F 0 "#PWR0122" H 10850 5800 50  0001 C CNN
F 1 "+5V" H 10865 6123 50  0000 C CNN
F 2 "" H 10850 5950 50  0001 C CNN
F 3 "" H 10850 5950 50  0001 C CNN
	1    10850 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	11100 6050 10850 6050
Wire Wire Line
	10850 6050 10850 5950
Wire Wire Line
	2250 6750 1250 6750
Entry Wire Line
	1250 6750 1150 6650
Text Label 2150 6750 2    50   ~ 0
A2
$Comp
L 74xx:74HC137 U12
U 1 1 62905073
P 2650 7150
F 0 "U12" H 2650 7931 50  0000 C CNN
F 1 "74HC137" H 2650 7840 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 2650 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74hc237.pdf" H 2650 7150 50  0001 C CNN
	1    2650 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 6850 1250 6850
Entry Wire Line
	1250 6850 1150 6750
Text Label 2150 6850 2    50   ~ 0
A3
Wire Wire Line
	2250 6950 1250 6950
Entry Wire Line
	1250 6950 1150 6850
Text Label 2150 6950 2    50   ~ 0
A4
Text GLabel 2150 7150 0    50   Input ~ 0
!IOREQ
Wire Wire Line
	2150 7150 2250 7150
$Comp
L 74xx:74LS32 U14
U 1 1 62A81A5D
P 4200 6850
F 0 "U14" H 4200 7175 50  0000 C CNN
F 1 "74LS32" H 4200 7084 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4200 6850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4200 6850 50  0001 C CNN
	1    4200 6850
	1    0    0    -1  
$EndComp
Entry Wire Line
	1250 7250 1150 7150
Entry Wire Line
	1250 7450 1150 7350
Wire Wire Line
	1250 7250 1400 7250
Wire Wire Line
	1250 7450 1400 7450
Text Label 1300 7250 0    50   ~ 0
A5
Text Label 1300 7450 0    50   ~ 0
A6
Wire Wire Line
	2000 7350 2250 7350
Entry Wire Line
	1250 7650 1150 7550
Text Label 1300 7650 0    50   ~ 0
A7
Wire Wire Line
	2100 7650 2100 7450
Wire Wire Line
	2100 7450 2250 7450
Wire Wire Line
	1250 7650 2100 7650
Wire Wire Line
	1550 6500 1550 6050
Wire Wire Line
	1550 6050 1850 6050
$Comp
L 74xx:74LS32 U9
U 3 1 62BCF1AD
P 1700 7350
F 0 "U9" H 1700 7675 50  0000 C CNN
F 1 "74LS32" H 1700 7584 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 1700 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 1700 7350 50  0001 C CNN
	3    1700 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 6750 3900 6750
Wire Wire Line
	4500 6850 4500 6500
Wire Wire Line
	4500 6500 1550 6500
Text Label 3100 6500 0    50   ~ 0
IO_ROM_WR
$Comp
L 74xx:74LS32 U14
U 2 1 62C2D60F
P 5000 6850
F 0 "U14" H 5000 7175 50  0000 C CNN
F 1 "74LS32" H 5000 7084 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5000 6850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5000 6850 50  0001 C CNN
	2    5000 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 6850 3800 6850
Wire Wire Line
	3800 6850 3800 7050
Wire Wire Line
	3800 7050 4600 7050
Wire Wire Line
	4600 7050 4600 6750
Wire Wire Line
	4600 6750 4700 6750
Wire Wire Line
	6600 5950 5750 5950
Wire Wire Line
	5750 5950 5750 6700
Wire Wire Line
	5750 6700 5400 6700
Wire Wire Line
	5400 6700 5400 6850
Wire Wire Line
	5400 6850 5300 6850
Wire Wire Line
	8050 6700 8050 5950
Wire Wire Line
	8050 5950 8900 5950
Wire Wire Line
	5750 6700 8050 6700
Connection ~ 5750 6700
Text GLabel 3700 7650 0    50   Input ~ 0
!WR
Wire Wire Line
	3900 6950 3900 7650
Wire Wire Line
	3700 7650 3900 7650
Wire Wire Line
	4700 7650 3900 7650
Wire Wire Line
	4700 6950 4700 7650
Connection ~ 3900 7650
Text Label 5850 6700 0    50   ~ 0
IO_BANK_WR
Text Notes 13650 6450 0    50   ~ 0
IO Addresses:\n$80 - Rom enable \n        (Bit 0 defines rom \n        visibility in Page 0)\n$84 - Bank 0 config\n$85 - Bank 1 config\n$86 - Bank 2 config\n$87 - Bank 3 config\n$88 - CTC Base\n$8C - SIO Base\n$90 - PIO PS2\n$94 - DMA \n$98 - APU
Text Notes 1800 5550 0    50   ~ 0
EEPROM Insert logic\nDefault: Visible
Text GLabel 3250 7150 2    50   Output ~ 0
IO_PS2_CS
Wire Wire Line
	3250 7150 3050 7150
Text GLabel 3250 7050 2    50   Output ~ 0
IO_SIO_CS
Wire Wire Line
	3250 7050 3050 7050
Text GLabel 3250 6950 2    50   Output ~ 0
IO_CTC_CS
Wire Wire Line
	3250 6950 3050 6950
Wire Wire Line
	7600 5250 8100 5250
Entry Wire Line
	8100 5250 8200 5150
Text Label 7700 5250 0    50   ~ 0
PA14
Wire Wire Line
	7600 5350 8100 5350
Entry Wire Line
	8100 5350 8200 5250
Text Label 7700 5350 0    50   ~ 0
PA15
Wire Wire Line
	7600 5450 8100 5450
Entry Wire Line
	8100 5450 8200 5350
Text Label 7700 5450 0    50   ~ 0
PA16
Wire Wire Line
	7600 5550 8100 5550
Entry Wire Line
	8100 5550 8200 5450
Text Label 7700 5550 0    50   ~ 0
PA17
Wire Wire Line
	9900 5250 10400 5250
Entry Wire Line
	10400 5250 10500 5150
Text Label 10000 5250 0    50   ~ 0
PA18
Wire Wire Line
	9900 5350 10400 5350
Entry Wire Line
	10400 5350 10500 5250
Text Label 10000 5350 0    50   ~ 0
PA19
Wire Wire Line
	9900 5450 10400 5450
Entry Wire Line
	10400 5450 10500 5350
Text Label 10000 5450 0    50   ~ 0
PA20
Wire Wire Line
	9900 5550 10400 5550
Entry Wire Line
	10400 5550 10500 5450
Text Label 10000 5550 0    50   ~ 0
PA21
Wire Wire Line
	11100 5350 10600 5350
Entry Wire Line
	10600 5350 10500 5250
Text Label 11000 5350 2    50   ~ 0
PA19
Wire Wire Line
	11100 5450 10600 5450
Entry Wire Line
	10600 5450 10500 5350
Text Label 11000 5450 2    50   ~ 0
PA20
Wire Wire Line
	11100 5550 10600 5550
Entry Wire Line
	10600 5550 10500 5450
Text Label 11000 5550 2    50   ~ 0
PA21
Wire Bus Line
	8200 4700 10500 4700
Connection ~ 8200 4700
Wire Wire Line
	7750 2600 7450 2600
Entry Wire Line
	7450 2600 7350 2500
Text Label 7700 2600 2    50   ~ 0
PA14
Wire Wire Line
	7750 2700 7450 2700
Entry Wire Line
	7450 2700 7350 2600
Text Label 7700 2700 2    50   ~ 0
PA15
Wire Wire Line
	7750 2800 7450 2800
Entry Wire Line
	7450 2800 7350 2700
Text Label 7700 2800 2    50   ~ 0
PA16
Wire Wire Line
	7750 2900 7450 2900
Entry Wire Line
	7450 2900 7350 2800
Text Label 7700 2900 2    50   ~ 0
PA17
Wire Wire Line
	7750 3000 7450 3000
Entry Wire Line
	7450 3000 7350 2900
Text Label 7700 3000 2    50   ~ 0
PA18
Entry Wire Line
	9050 1900 9150 1800
Wire Wire Line
	8750 1900 9050 1900
Entry Wire Line
	9050 1800 9150 1700
Wire Wire Line
	8750 1800 9050 1800
Entry Wire Line
	9050 1700 9150 1600
Wire Wire Line
	8750 1700 9050 1700
Entry Wire Line
	9050 1600 9150 1500
Wire Wire Line
	8750 1600 9050 1600
Entry Wire Line
	9050 1500 9150 1400
Wire Wire Line
	8750 1500 9050 1500
Entry Wire Line
	9050 1400 9150 1300
Wire Wire Line
	8750 1400 9050 1400
Entry Wire Line
	9050 1300 9150 1200
Wire Wire Line
	8750 1300 9050 1300
Entry Wire Line
	9050 1200 9150 1100
Wire Wire Line
	8750 1200 9050 1200
Text GLabel 10600 2300 2    50   Input ~ 0
!RD
Text GLabel 10600 2400 2    50   Input ~ 0
!WR
Wire Wire Line
	10600 2400 10550 2400
Wire Wire Line
	10600 2300 10550 2300
$Comp
L Memory_RAM:AS6C4008-55PCN U?
U 1 1 63EA4462
P 10050 2100
F 0 "U?" H 10050 3381 50  0000 C CNN
F 1 "AS6C4008-55PCN" H 10050 3290 50  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm" H 10050 2200 50  0001 C CNN
F 3 "https://www.alliancememory.com/wp-content/uploads/pdf/AS6C4008.pdf" H 10050 2200 50  0001 C CNN
	1    10050 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 1200 9250 1200
Entry Wire Line
	9250 1200 9150 1100
Text Label 9500 1200 2    50   ~ 0
A0
Wire Wire Line
	9550 1300 9250 1300
Entry Wire Line
	9250 1300 9150 1200
Text Label 9500 1300 2    50   ~ 0
A1
Wire Wire Line
	9550 1400 9250 1400
Entry Wire Line
	9250 1400 9150 1300
Text Label 9500 1400 2    50   ~ 0
A2
Wire Wire Line
	9550 1500 9250 1500
Entry Wire Line
	9250 1500 9150 1400
Text Label 9500 1500 2    50   ~ 0
A3
Wire Wire Line
	9550 1600 9250 1600
Entry Wire Line
	9250 1600 9150 1500
Text Label 9500 1600 2    50   ~ 0
A4
Wire Wire Line
	9550 1700 9250 1700
Entry Wire Line
	9250 1700 9150 1600
Text Label 9500 1700 2    50   ~ 0
A5
Wire Wire Line
	9550 1800 9250 1800
Entry Wire Line
	9250 1800 9150 1700
Text Label 9500 1800 2    50   ~ 0
A6
Wire Wire Line
	9550 1900 9250 1900
Entry Wire Line
	9250 1900 9150 1800
Text Label 9500 1900 2    50   ~ 0
A7
Wire Wire Line
	9550 2000 9250 2000
Entry Wire Line
	9250 2000 9150 1900
Text Label 9500 2000 2    50   ~ 0
A8
Wire Wire Line
	9550 2100 9250 2100
Entry Wire Line
	9250 2100 9150 2000
Text Label 9500 2100 2    50   ~ 0
A9
Wire Wire Line
	9550 2200 9250 2200
Entry Wire Line
	9250 2200 9150 2100
Text Label 9500 2200 2    50   ~ 0
A10
Wire Wire Line
	9550 2300 9250 2300
Entry Wire Line
	9250 2300 9150 2200
Text Label 9500 2300 2    50   ~ 0
A11
Wire Wire Line
	9550 2400 9250 2400
Entry Wire Line
	9250 2400 9150 2300
Text Label 9500 2400 2    50   ~ 0
A12
Text Label 10650 1200 0    50   ~ 0
D0
Text Label 10650 1300 0    50   ~ 0
D1
Text Label 10650 1400 0    50   ~ 0
D2
Text Label 10650 1500 0    50   ~ 0
D3
Text Label 10650 1600 0    50   ~ 0
D4
Text Label 10650 1700 0    50   ~ 0
D5
Text Label 10650 1800 0    50   ~ 0
D6
Text Label 10650 1900 0    50   ~ 0
D7
Wire Wire Line
	9550 2500 9250 2500
Entry Wire Line
	9250 2500 9150 2400
Text Label 9500 2500 2    50   ~ 0
A13
Wire Bus Line
	9150 600  10950 600 
Wire Wire Line
	9550 2600 9250 2600
Entry Wire Line
	9250 2600 9150 2500
Text Label 9500 2600 2    50   ~ 0
PA14
Wire Wire Line
	9550 2700 9250 2700
Entry Wire Line
	9250 2700 9150 2600
Text Label 9500 2700 2    50   ~ 0
PA15
Wire Wire Line
	9550 2800 9250 2800
Entry Wire Line
	9250 2800 9150 2700
Text Label 9500 2800 2    50   ~ 0
PA16
Wire Wire Line
	9550 2900 9250 2900
Entry Wire Line
	9250 2900 9150 2800
Text Label 9500 2900 2    50   ~ 0
PA17
Wire Wire Line
	9550 3000 9250 3000
Entry Wire Line
	9250 3000 9150 2900
Text Label 9500 3000 2    50   ~ 0
PA18
Entry Wire Line
	10850 1900 10950 1800
Wire Wire Line
	10550 1900 10850 1900
Entry Wire Line
	10850 1800 10950 1700
Wire Wire Line
	10550 1800 10850 1800
Entry Wire Line
	10850 1700 10950 1600
Wire Wire Line
	10550 1700 10850 1700
Entry Wire Line
	10850 1600 10950 1500
Wire Wire Line
	10550 1600 10850 1600
Entry Wire Line
	10850 1500 10950 1400
Wire Wire Line
	10550 1500 10850 1500
Entry Wire Line
	10850 1400 10950 1300
Wire Wire Line
	10550 1400 10850 1400
Entry Wire Line
	10850 1300 10950 1200
Wire Wire Line
	10550 1300 10850 1300
Entry Wire Line
	10850 1200 10950 1100
Wire Wire Line
	10550 1200 10850 1200
Text GLabel 12400 2300 2    50   Input ~ 0
!RD
Text GLabel 12400 2400 2    50   Input ~ 0
!WR
Wire Wire Line
	12400 2400 12350 2400
Wire Wire Line
	12400 2300 12350 2300
$Comp
L Memory_RAM:AS6C4008-55PCN U?
U 1 1 63EC414D
P 11850 2100
F 0 "U?" H 11850 3381 50  0000 C CNN
F 1 "AS6C4008-55PCN" H 11850 3290 50  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm" H 11850 2200 50  0001 C CNN
F 3 "https://www.alliancememory.com/wp-content/uploads/pdf/AS6C4008.pdf" H 11850 2200 50  0001 C CNN
	1    11850 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	11350 1200 11050 1200
Entry Wire Line
	11050 1200 10950 1100
Text Label 11300 1200 2    50   ~ 0
A0
Wire Wire Line
	11350 1300 11050 1300
Entry Wire Line
	11050 1300 10950 1200
Text Label 11300 1300 2    50   ~ 0
A1
Wire Wire Line
	11350 1400 11050 1400
Entry Wire Line
	11050 1400 10950 1300
Text Label 11300 1400 2    50   ~ 0
A2
Wire Wire Line
	11350 1500 11050 1500
Entry Wire Line
	11050 1500 10950 1400
Text Label 11300 1500 2    50   ~ 0
A3
Wire Wire Line
	11350 1600 11050 1600
Entry Wire Line
	11050 1600 10950 1500
Text Label 11300 1600 2    50   ~ 0
A4
Wire Wire Line
	11350 1700 11050 1700
Entry Wire Line
	11050 1700 10950 1600
Text Label 11300 1700 2    50   ~ 0
A5
Wire Wire Line
	11350 1800 11050 1800
Entry Wire Line
	11050 1800 10950 1700
Text Label 11300 1800 2    50   ~ 0
A6
Wire Wire Line
	11350 1900 11050 1900
Entry Wire Line
	11050 1900 10950 1800
Text Label 11300 1900 2    50   ~ 0
A7
Wire Wire Line
	11350 2000 11050 2000
Entry Wire Line
	11050 2000 10950 1900
Text Label 11300 2000 2    50   ~ 0
A8
Wire Wire Line
	11350 2100 11050 2100
Entry Wire Line
	11050 2100 10950 2000
Text Label 11300 2100 2    50   ~ 0
A9
Wire Wire Line
	11350 2200 11050 2200
Entry Wire Line
	11050 2200 10950 2100
Text Label 11300 2200 2    50   ~ 0
A10
Wire Wire Line
	11350 2300 11050 2300
Entry Wire Line
	11050 2300 10950 2200
Text Label 11300 2300 2    50   ~ 0
A11
Wire Wire Line
	11350 2400 11050 2400
Entry Wire Line
	11050 2400 10950 2300
Text Label 11300 2400 2    50   ~ 0
A12
Text Label 12450 1200 0    50   ~ 0
D0
Text Label 12450 1300 0    50   ~ 0
D1
Text Label 12450 1400 0    50   ~ 0
D2
Text Label 12450 1500 0    50   ~ 0
D3
Text Label 12450 1600 0    50   ~ 0
D4
Text Label 12450 1700 0    50   ~ 0
D5
Text Label 12450 1800 0    50   ~ 0
D6
Text Label 12450 1900 0    50   ~ 0
D7
Wire Wire Line
	11350 2500 11050 2500
Entry Wire Line
	11050 2500 10950 2400
Text Label 11300 2500 2    50   ~ 0
A13
Wire Bus Line
	10950 600  12750 600 
Wire Wire Line
	11350 2600 11050 2600
Entry Wire Line
	11050 2600 10950 2500
Text Label 11300 2600 2    50   ~ 0
PA14
Wire Wire Line
	11350 2700 11050 2700
Entry Wire Line
	11050 2700 10950 2600
Text Label 11300 2700 2    50   ~ 0
PA15
Wire Wire Line
	11350 2800 11050 2800
Entry Wire Line
	11050 2800 10950 2700
Text Label 11300 2800 2    50   ~ 0
PA16
Wire Wire Line
	11350 2900 11050 2900
Entry Wire Line
	11050 2900 10950 2800
Text Label 11300 2900 2    50   ~ 0
PA17
Wire Wire Line
	11350 3000 11050 3000
Entry Wire Line
	11050 3000 10950 2900
Text Label 11300 3000 2    50   ~ 0
PA18
Entry Wire Line
	12650 1900 12750 1800
Wire Wire Line
	12350 1900 12650 1900
Entry Wire Line
	12650 1800 12750 1700
Wire Wire Line
	12350 1800 12650 1800
Entry Wire Line
	12650 1700 12750 1600
Wire Wire Line
	12350 1700 12650 1700
Entry Wire Line
	12650 1600 12750 1500
Wire Wire Line
	12350 1600 12650 1600
Entry Wire Line
	12650 1500 12750 1400
Wire Wire Line
	12350 1500 12650 1500
Entry Wire Line
	12650 1400 12750 1300
Wire Wire Line
	12350 1400 12650 1400
Entry Wire Line
	12650 1300 12750 1200
Wire Wire Line
	12350 1300 12650 1300
Entry Wire Line
	12650 1200 12750 1100
Wire Wire Line
	12350 1200 12650 1200
Text GLabel 14200 2300 2    50   Input ~ 0
!RD
Text GLabel 14200 2400 2    50   Input ~ 0
!WR
Wire Wire Line
	14200 2400 14150 2400
Wire Wire Line
	14200 2300 14150 2300
$Comp
L Memory_RAM:AS6C4008-55PCN U?
U 1 1 63EEB26A
P 13650 2100
F 0 "U?" H 13650 3381 50  0000 C CNN
F 1 "AS6C4008-55PCN" H 13650 3290 50  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm" H 13650 2200 50  0001 C CNN
F 3 "https://www.alliancememory.com/wp-content/uploads/pdf/AS6C4008.pdf" H 13650 2200 50  0001 C CNN
	1    13650 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	13150 1200 12850 1200
Entry Wire Line
	12850 1200 12750 1100
Text Label 13100 1200 2    50   ~ 0
A0
Wire Wire Line
	13150 1300 12850 1300
Entry Wire Line
	12850 1300 12750 1200
Text Label 13100 1300 2    50   ~ 0
A1
Wire Wire Line
	13150 1400 12850 1400
Entry Wire Line
	12850 1400 12750 1300
Text Label 13100 1400 2    50   ~ 0
A2
Wire Wire Line
	13150 1500 12850 1500
Entry Wire Line
	12850 1500 12750 1400
Text Label 13100 1500 2    50   ~ 0
A3
Wire Wire Line
	13150 1600 12850 1600
Entry Wire Line
	12850 1600 12750 1500
Text Label 13100 1600 2    50   ~ 0
A4
Wire Wire Line
	13150 1700 12850 1700
Entry Wire Line
	12850 1700 12750 1600
Text Label 13100 1700 2    50   ~ 0
A5
Wire Wire Line
	13150 1800 12850 1800
Entry Wire Line
	12850 1800 12750 1700
Text Label 13100 1800 2    50   ~ 0
A6
Wire Wire Line
	13150 1900 12850 1900
Entry Wire Line
	12850 1900 12750 1800
Text Label 13100 1900 2    50   ~ 0
A7
Wire Wire Line
	13150 2000 12850 2000
Entry Wire Line
	12850 2000 12750 1900
Text Label 13100 2000 2    50   ~ 0
A8
Wire Wire Line
	13150 2100 12850 2100
Entry Wire Line
	12850 2100 12750 2000
Text Label 13100 2100 2    50   ~ 0
A9
Wire Wire Line
	13150 2200 12850 2200
Entry Wire Line
	12850 2200 12750 2100
Text Label 13100 2200 2    50   ~ 0
A10
Wire Wire Line
	13150 2300 12850 2300
Entry Wire Line
	12850 2300 12750 2200
Text Label 13100 2300 2    50   ~ 0
A11
Wire Wire Line
	13150 2400 12850 2400
Entry Wire Line
	12850 2400 12750 2300
Text Label 13100 2400 2    50   ~ 0
A12
Text Label 14250 1200 0    50   ~ 0
D0
Text Label 14250 1300 0    50   ~ 0
D1
Text Label 14250 1400 0    50   ~ 0
D2
Text Label 14250 1500 0    50   ~ 0
D3
Text Label 14250 1600 0    50   ~ 0
D4
Text Label 14250 1700 0    50   ~ 0
D5
Text Label 14250 1800 0    50   ~ 0
D6
Text Label 14250 1900 0    50   ~ 0
D7
Wire Wire Line
	13150 2500 12850 2500
Entry Wire Line
	12850 2500 12750 2400
Text Label 13100 2500 2    50   ~ 0
A13
Wire Bus Line
	12750 600  14550 600 
Wire Wire Line
	13150 2600 12850 2600
Entry Wire Line
	12850 2600 12750 2500
Text Label 13100 2600 2    50   ~ 0
PA14
Wire Wire Line
	13150 2700 12850 2700
Entry Wire Line
	12850 2700 12750 2600
Text Label 13100 2700 2    50   ~ 0
PA15
Wire Wire Line
	13150 2800 12850 2800
Entry Wire Line
	12850 2800 12750 2700
Text Label 13100 2800 2    50   ~ 0
PA16
Wire Wire Line
	13150 2900 12850 2900
Entry Wire Line
	12850 2900 12750 2800
Text Label 13100 2900 2    50   ~ 0
PA17
Wire Wire Line
	13150 3000 12850 3000
Entry Wire Line
	12850 3000 12750 2900
Text Label 13100 3000 2    50   ~ 0
PA18
Entry Wire Line
	14450 1900 14550 1800
Wire Wire Line
	14150 1900 14450 1900
Entry Wire Line
	14450 1800 14550 1700
Wire Wire Line
	14150 1800 14450 1800
Entry Wire Line
	14450 1700 14550 1600
Wire Wire Line
	14150 1700 14450 1700
Entry Wire Line
	14450 1600 14550 1500
Wire Wire Line
	14150 1600 14450 1600
Entry Wire Line
	14450 1500 14550 1400
Wire Wire Line
	14150 1500 14450 1500
Entry Wire Line
	14450 1400 14550 1300
Wire Wire Line
	14150 1400 14450 1400
Entry Wire Line
	14450 1300 14550 1200
Wire Wire Line
	14150 1300 14450 1300
Entry Wire Line
	14450 1200 14550 1100
Wire Wire Line
	14150 1200 14450 1200
Wire Wire Line
	8750 2200 9050 2200
Wire Wire Line
	9050 2200 9050 4500
Wire Wire Line
	9050 4500 12000 4500
Wire Wire Line
	12000 4500 12000 5350
Wire Wire Line
	12000 5350 11900 5350
Wire Wire Line
	12100 5450 12100 4400
Wire Wire Line
	11900 5450 12100 5450
Wire Wire Line
	12100 4400 10850 4400
Wire Wire Line
	10850 4400 10850 2200
Wire Wire Line
	10850 2200 10550 2200
Wire Wire Line
	11900 5550 12200 5550
Wire Wire Line
	12200 5550 12200 4400
Wire Wire Line
	12200 4400 12650 4400
Wire Wire Line
	12650 4400 12650 2200
Wire Wire Line
	12650 2200 12350 2200
Wire Wire Line
	11900 5650 12300 5650
Wire Wire Line
	12300 4500 12300 5650
Wire Wire Line
	12300 4500 14500 4500
Wire Wire Line
	14500 4500 14500 2200
Wire Wire Line
	14500 2200 14150 2200
Wire Wire Line
	5600 6800 11000 6800
$Comp
L 74xx:74LS670 U?
U 1 1 6425FCB0
P 7100 5750
F 0 "U?" H 7100 6731 50  0000 C CNN
F 1 "74HC670" H 7100 6640 50  0000 C CNN
F 2 "" H 7100 5750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS670" H 7100 5750 50  0001 C CNN
	1    7100 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 5750 8900 5750
$Comp
L 74xx:74LS670 U?
U 1 1 64292D75
P 9400 5750
F 0 "U?" H 9400 6731 50  0000 C CNN
F 1 "74HC670" H 9400 6640 50  0000 C CNN
F 2 "" H 9400 5750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS670" H 9400 5750 50  0001 C CNN
	1    9400 5750
	1    0    0    -1  
$EndComp
Text Label 5850 6800 0    50   ~ 0
CS_RAM
Text Label 4400 5550 0    50   ~ 0
CS_ROM
NoConn ~ 11900 5750
NoConn ~ 11900 5850
NoConn ~ 11900 5950
NoConn ~ 11900 6050
Text Notes 7400 3300 0    50   ~ 0
RAM 512K Block #0\n$000000 - $07ffffff
Text Notes 9100 3300 0    50   ~ 0
RAM 512K Block #1\n$080000 - $0fffffff
Text Notes 10900 3300 0    50   ~ 0
RAM 512K Block #2\n$100000 - $17ffffff
Text Notes 12750 3300 0    50   ~ 0
RAM 512K Block #2\n$180000 - $1fffffff
$Comp
L Zilog_Z80_Peripherals2:DMA-DIP-40 IC?
U 1 1 6445716B
P 2050 8450
F 0 "IC?" H 2350 8831 50  0000 C CNN
F 1 "DMA-DIP-40" H 2350 8740 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_LongPads" H 2450 10300 50  0001 L CNN
F 3 "" H 400 7850 50  0001 L CNN
F 4 "Z8410 DMA Zilog Z8410" H 2450 10100 50  0001 L CNN "Description"
F 5 "4.06" H 2450 10000 50  0001 L CNN "Height"
F 6 "Zilog" H 2450 9900 50  0001 L CNN "Manufacturer_Name"
F 7 "Z84C4206PEG" H 2450 9800 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "692-Z84C4206PEG" H 2450 9700 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=692-Z84C4206PEG" H 2450 9600 50  0001 L CNN "Mouser Price/Stock"
F 10 "6600766" H 2450 9500 50  0001 L CNN "RS Part Number"
F 11 "https://uk.rs-online.com/web/p/products/6600766" H 2450 9400 50  0001 L CNN "RS Price/Stock"
F 12 "R1000052" H 2450 9300 50  0001 L CNN "Allied_Number"
F 13 "https://www.alliedelec.com/zilog-z84c4206peg/R1000052/" H 2450 9200 50  0001 L CNN "Allied Price/Stock"
	1    2050 8450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 8500 3450 8500
Entry Wire Line
	3450 8500 3550 8400
Text Label 2950 8500 0    50   ~ 0
A0
Wire Wire Line
	2850 8600 3450 8600
Entry Wire Line
	3450 8600 3550 8500
Text Label 2950 8600 0    50   ~ 0
A1
Wire Wire Line
	2850 8700 3450 8700
Entry Wire Line
	3450 8700 3550 8600
Text Label 2950 8700 0    50   ~ 0
A2
Wire Wire Line
	2850 8800 3450 8800
Entry Wire Line
	3450 8800 3550 8700
Text Label 2950 8800 0    50   ~ 0
A3
Wire Wire Line
	2850 8900 3450 8900
Entry Wire Line
	3450 8900 3550 8800
Text Label 2950 8900 0    50   ~ 0
A4
Wire Wire Line
	2850 9000 3450 9000
Entry Wire Line
	3450 9000 3550 8900
Text Label 2950 9000 0    50   ~ 0
A5
Wire Wire Line
	2850 9100 3450 9100
Entry Wire Line
	3450 9100 3550 9000
Text Label 2950 9100 0    50   ~ 0
A6
Wire Wire Line
	2850 9200 3450 9200
Entry Wire Line
	3450 9200 3550 9100
Text Label 2950 9200 0    50   ~ 0
A7
Wire Wire Line
	2850 9300 3450 9300
Entry Wire Line
	3450 9300 3550 9200
Text Label 2950 9300 0    50   ~ 0
A8
Wire Wire Line
	2850 9400 3450 9400
Entry Wire Line
	3450 9400 3550 9300
Text Label 2950 9400 0    50   ~ 0
A9
Wire Wire Line
	2850 9500 3450 9500
Entry Wire Line
	3450 9500 3550 9400
Text Label 2950 9500 0    50   ~ 0
A10
Wire Wire Line
	2850 9600 3450 9600
Entry Wire Line
	3450 9600 3550 9500
Text Label 2950 9600 0    50   ~ 0
A11
Wire Wire Line
	2850 9700 3450 9700
Entry Wire Line
	3450 9700 3550 9600
Text Label 2950 9700 0    50   ~ 0
A12
Wire Wire Line
	2850 9800 3450 9800
Entry Wire Line
	3450 9800 3550 9700
Text Label 2950 9800 0    50   ~ 0
A13
Wire Wire Line
	2850 9900 3450 9900
Entry Wire Line
	3450 9900 3550 9800
Text Label 2950 9900 0    50   ~ 0
A14
Wire Wire Line
	2850 10000 3450 10000
Entry Wire Line
	3450 10000 3550 9900
Text Label 2950 10000 0    50   ~ 0
A15
Wire Wire Line
	1850 8500 1250 8500
Entry Wire Line
	1250 8500 1150 8400
Text Label 1750 8500 2    50   ~ 0
D0
Wire Wire Line
	1850 8600 1250 8600
Entry Wire Line
	1250 8600 1150 8500
Text Label 1750 8600 2    50   ~ 0
D1
Wire Wire Line
	1850 8700 1250 8700
Entry Wire Line
	1250 8700 1150 8600
Text Label 1750 8700 2    50   ~ 0
D2
Wire Wire Line
	1850 8800 1250 8800
Entry Wire Line
	1250 8800 1150 8700
Text Label 1750 8800 2    50   ~ 0
D3
Wire Wire Line
	1850 8900 1250 8900
Entry Wire Line
	1250 8900 1150 8800
Text Label 1750 8900 2    50   ~ 0
D4
Wire Wire Line
	1850 9000 1250 9000
Entry Wire Line
	1250 9000 1150 8900
Text Label 1750 9000 2    50   ~ 0
D5
Wire Wire Line
	1850 9100 1250 9100
Entry Wire Line
	1250 9100 1150 9000
Text Label 1750 9100 2    50   ~ 0
D6
Wire Wire Line
	1850 9200 1250 9200
Entry Wire Line
	1250 9200 1150 9100
Text Label 1750 9200 2    50   ~ 0
D7
Wire Bus Line
	3550 7900 1150 7900
Connection ~ 1150 7900
Text GLabel 1750 9350 0    50   Output ~ 0
!BUSREQ
Text GLabel 1750 9450 0    50   Input ~ 0
!BUSACK
Wire Wire Line
	1850 9350 1750 9350
Wire Wire Line
	1750 9450 1850 9450
Text GLabel 1650 10000 0    50   BiDi ~ 0
!RD
Text GLabel 1650 10100 0    50   BiDi ~ 0
!WR
Text GLabel 1650 9900 0    50   Output ~ 0
!MREQ
Text GLabel 1650 9800 0    50   Input ~ 0
!IOREQ
Wire Wire Line
	1650 9800 1850 9800
Wire Wire Line
	1850 9900 1650 9900
Wire Wire Line
	1650 10100 1850 10100
Wire Wire Line
	1850 10000 1650 10000
Text GLabel 1650 9700 0    50   Input ~ 0
!M1
Wire Wire Line
	1650 9700 1850 9700
Text GLabel 1650 10550 0    50   Input ~ 0
CLK_CPU
Wire Wire Line
	1850 10550 1650 10550
Wire Wire Line
	3050 7250 3350 7250
Wire Wire Line
	3350 7250 3350 10250
Wire Wire Line
	3350 10250 2850 10250
Text GLabel 2950 10350 2    50   Output ~ 0
!INT
Wire Wire Line
	2950 10350 2850 10350
$Comp
L Mini8085Ext-cache:Am9511A U?
U 1 1 649310F0
P 4850 9350
F 0 "U?" H 4850 8103 60  0000 C CNN
F 1 "Am9511A" H 4850 7997 60  0000 C CNN
F 2 "*DIP*24*" H 4850 7891 60  0001 C CNN
F 3 "" H 4950 8650 60  0000 C CNN
	1    4850 9350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 8500 3650 8500
Entry Wire Line
	3650 8500 3550 8400
Text Label 4150 8500 2    50   ~ 0
D0
Wire Wire Line
	4250 8600 3650 8600
Entry Wire Line
	3650 8600 3550 8500
Text Label 4150 8600 2    50   ~ 0
D1
Wire Wire Line
	4250 8700 3650 8700
Entry Wire Line
	3650 8700 3550 8600
Text Label 4150 8700 2    50   ~ 0
D2
Wire Wire Line
	4250 8800 3650 8800
Entry Wire Line
	3650 8800 3550 8700
Text Label 4150 8800 2    50   ~ 0
D3
Wire Wire Line
	4250 8900 3650 8900
Entry Wire Line
	3650 8900 3550 8800
Text Label 4150 8900 2    50   ~ 0
D4
Wire Wire Line
	4250 9000 3650 9000
Entry Wire Line
	3650 9000 3550 8900
Text Label 4150 9000 2    50   ~ 0
D5
Wire Wire Line
	4250 9100 3650 9100
Entry Wire Line
	3650 9100 3550 9000
Text Label 4150 9100 2    50   ~ 0
D6
Wire Wire Line
	4250 9200 3650 9200
Entry Wire Line
	3650 9200 3550 9100
Text Label 4150 9200 2    50   ~ 0
D7
Text GLabel 4050 10200 0    50   Input ~ 0
CLK_CPU
Wire Wire Line
	4250 10200 4050 10200
Text GLabel 4050 10000 0    50   Input ~ 0
!RESET
Wire Wire Line
	4050 10000 4250 10000
Text GLabel 4050 9800 0    50   Input ~ 0
!RD
Text GLabel 4050 9700 0    50   Input ~ 0
!WR
Wire Wire Line
	4050 9700 4250 9700
Wire Wire Line
	4050 9800 4250 9800
Wire Wire Line
	3750 7350 3050 7350
Wire Wire Line
	4250 9600 3750 9600
Wire Wire Line
	3750 7350 3750 9600
Text Label 4150 9400 2    50   ~ 0
A0
Entry Wire Line
	3650 9400 3550 9300
Wire Wire Line
	3650 9400 4250 9400
$Comp
L 74xx:74HCT574 U?
U 1 1 64BFE0D0
P 8250 9050
F 0 "U?" H 8250 10031 50  0000 C CNN
F 1 "74HCT574" H 8250 9940 50  0000 C CNN
F 2 "" H 8250 9050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT574" H 8250 9050 50  0001 C CNN
	1    8250 9050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 8550 7150 8550
Entry Wire Line
	7150 8550 7050 8450
Text Label 7650 8550 2    50   ~ 0
D0
Wire Wire Line
	7750 8650 7150 8650
Entry Wire Line
	7150 8650 7050 8550
Text Label 7650 8650 2    50   ~ 0
D1
Wire Wire Line
	7750 8750 7150 8750
Entry Wire Line
	7150 8750 7050 8650
Text Label 7650 8750 2    50   ~ 0
D2
Wire Wire Line
	7750 8850 7150 8850
Entry Wire Line
	7150 8850 7050 8750
Text Label 7650 8850 2    50   ~ 0
D3
Wire Wire Line
	7750 8950 7150 8950
Entry Wire Line
	7150 8950 7050 8850
Text Label 7650 8950 2    50   ~ 0
D4
Wire Wire Line
	7750 9050 7150 9050
Entry Wire Line
	7150 9050 7050 8950
Text Label 7650 9050 2    50   ~ 0
D5
Wire Wire Line
	7750 9150 7150 9150
Entry Wire Line
	7150 9150 7050 9050
Text Label 7650 9150 2    50   ~ 0
D6
Wire Wire Line
	7750 9250 7150 9250
Entry Wire Line
	7150 9250 7050 9150
Text Label 7650 9250 2    50   ~ 0
D7
$Comp
L 74xx:74LS125 U?
U 1 1 64C94EA7
P 6250 8700
AR Path="/624F3E6F/64C94EA7" Ref="U?"  Part="1" 
AR Path="/622409DC/64C94EA7" Ref="U?"  Part="1" 
AR Path="/620F0305/64C94EA7" Ref="U?"  Part="1" 
F 0 "U?" H 6250 9017 50  0000 C CNN
F 1 "74HC125" H 6250 8926 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6250 8700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS125" H 6250 8700 50  0001 C CNN
	1    6250 8700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 8950 6800 8950
Wire Wire Line
	6800 8950 6800 7950
Wire Wire Line
	6800 7950 9450 7950
Wire Wire Line
	9450 7950 9450 8550
Wire Wire Line
	9450 8550 8750 8550
Wire Wire Line
	5450 8700 5950 8700
Text GLabel 6200 8250 0    50   Output ~ 0
!WAIT
Wire Wire Line
	6200 8250 6600 8250
Wire Wire Line
	6600 8700 6600 8250
Wire Wire Line
	6600 8700 6550 8700
Text Label 8800 8550 0    50   ~ 0
APUWaitEnable
Wire Wire Line
	6850 9000 6850 8000
Wire Wire Line
	5450 9000 6850 9000
Wire Wire Line
	5450 9300 6900 9300
Wire Wire Line
	6900 9300 6900 8050
Wire Bus Line
	3550 7900 7050 7900
Connection ~ 3550 7900
$Comp
L power:GND #PWR?
U 1 1 64FF8181
P 7700 9600
F 0 "#PWR?" H 7700 9350 50  0001 C CNN
F 1 "GND" H 7705 9427 50  0000 C CNN
F 2 "" H 7700 9600 50  0001 C CNN
F 3 "" H 7700 9600 50  0001 C CNN
	1    7700 9600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 9550 7700 9550
Wire Wire Line
	7700 9550 7700 9600
$Comp
L 74xx:74LS32 U?
U 3 1 650410F2
P 6800 9750
F 0 "U?" H 6800 10075 50  0000 C CNN
F 1 "74LS32" H 6800 9984 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6800 9750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6800 9750 50  0001 C CNN
	3    6800 9750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 7450 4000 7450
Wire Wire Line
	4000 7450 4000 8100
Wire Wire Line
	4000 8100 5850 8100
Wire Wire Line
	5850 8100 5850 9650
Wire Wire Line
	5850 9650 6500 9650
Wire Wire Line
	7250 9750 7250 9450
Wire Wire Line
	7250 9450 7750 9450
Wire Wire Line
	7100 9750 7250 9750
Text GLabel 6300 9850 0    50   Input ~ 0
!WR
Wire Wire Line
	6300 9850 6500 9850
$Comp
L 74xx_IEEE:74LS348 U?
U 1 1 6519379C
P 11400 8950
F 0 "U?" H 11400 9666 50  0000 C CNN
F 1 "74LS348" H 11400 9575 50  0000 C CNN
F 2 "" H 11400 8950 50  0001 C CNN
F 3 "" H 11400 8950 50  0001 C CNN
	1    11400 8950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 8900 5750 8900
Wire Wire Line
	5750 8900 5750 10100
Wire Wire Line
	5750 10100 10300 10100
Wire Wire Line
	10300 10100 10300 8550
Wire Wire Line
	10300 8550 10800 8550
Wire Wire Line
	10500 9350 10800 9350
Wire Wire Line
	12000 8650 12600 8650
Entry Wire Line
	12600 8650 12700 8550
Text Label 12100 8650 0    50   ~ 0
D0
Wire Wire Line
	12000 8750 12600 8750
Entry Wire Line
	12600 8750 12700 8650
Text Label 12100 8750 0    50   ~ 0
D1
Wire Wire Line
	12000 8850 12600 8850
Entry Wire Line
	12600 8850 12700 8750
Text Label 12100 8850 0    50   ~ 0
D2
NoConn ~ 12000 9250
Wire Bus Line
	7050 7900 12700 7900
Connection ~ 7050 7900
Text GLabel 12100 9150 2    50   Output ~ 0
!INT
Wire Wire Line
	12100 9150 12000 9150
$Comp
L 74xx:74LS32 U?
U 1 1 65557823
P 10450 7450
F 0 "U?" H 10450 7775 50  0000 C CNN
F 1 "74LS32" H 10450 7684 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 10450 7450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 10450 7450 50  0001 C CNN
	1    10450 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 8000 10500 9350
Text GLabel 10000 7550 0    50   Input ~ 0
!IOREQ
Wire Wire Line
	10000 7550 10150 7550
Text GLabel 10000 7350 0    50   Input ~ 0
!M1
Wire Wire Line
	10000 7350 10150 7350
Text Label 11600 7350 0    50   ~ 0
INT_ACK
Wire Wire Line
	9350 8750 8750 8750
Wire Wire Line
	6900 8050 9350 8050
Wire Wire Line
	9350 8050 9350 8750
Wire Wire Line
	9400 8650 8750 8650
Wire Wire Line
	6850 8000 9400 8000
Wire Wire Line
	9400 8000 9400 8650
Text Label 8800 8650 0    50   ~ 0
APUEndAck
Text Label 8800 8750 0    50   ~ 0
APUSvcAck
$Comp
L 74xx:74LS32 U?
U 2 1 65AAC19D
P 11250 7350
F 0 "U?" H 11250 7675 50  0000 C CNN
F 1 "74LS32" H 11250 7584 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 11250 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 11250 7350 50  0001 C CNN
	2    11250 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	11850 8000 11850 7350
Wire Wire Line
	11850 7350 11550 7350
Wire Wire Line
	10500 8000 11850 8000
Wire Wire Line
	10950 7450 10750 7450
Wire Wire Line
	2850 10550 4600 10550
Wire Wire Line
	4600 10550 4600 10850
Wire Wire Line
	4600 10850 9650 10850
Wire Wire Line
	9650 10850 9650 7050
Wire Wire Line
	9650 7050 10950 7050
Wire Wire Line
	10950 7050 10950 7250
Text Label 10400 7050 0    50   ~ 0
IE_DMA>PENC
$Comp
L 74xx:74HC04 U?
U 1 1 65D4900B
P 6800 10500
F 0 "U?" H 6800 10817 50  0000 C CNN
F 1 "74HC04" H 6800 10726 50  0000 C CNN
F 2 "" H 6800 10500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6800 10500 50  0001 C CNN
	1    6800 10500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 9200 5650 9200
Wire Wire Line
	5650 9200 5650 10500
Wire Wire Line
	5650 10500 6500 10500
Wire Wire Line
	7100 10500 10400 10500
Wire Wire Line
	10400 10500 10400 8650
Wire Wire Line
	10400 8650 10800 8650
$Comp
L power:+5V #PWR?
U 1 1 65EECF8E
P 10050 9150
F 0 "#PWR?" H 10050 9000 50  0001 C CNN
F 1 "+5V" H 10065 9323 50  0000 C CNN
F 2 "" H 10050 9150 50  0001 C CNN
F 3 "" H 10050 9150 50  0001 C CNN
	1    10050 9150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10800 9250 10050 9250
Wire Wire Line
	10050 9250 10050 9150
Wire Bus Line
	12700 7900 12700 8750
Wire Bus Line
	10500 4700 10500 5450
Wire Bus Line
	7050 7900 7050 9150
Wire Bus Line
	1150 7900 1150 9100
Wire Bus Line
	14550 600  14550 1800
Wire Bus Line
	8200 4700 8200 6150
Wire Bus Line
	5900 4700 5900 6150
Wire Bus Line
	1150 4050 1150 7900
Wire Bus Line
	5150 600  5150 2400
Wire Bus Line
	3550 7900 3550 9900
Wire Bus Line
	7350 600  7350 4700
Wire Bus Line
	4750 600  4750 4050
Wire Bus Line
	9150 600  9150 2900
Wire Bus Line
	10950 600  10950 2900
Wire Bus Line
	12750 600  12750 2900
$EndSCHEMATC
