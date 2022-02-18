EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	2500 1400 1900 1400
Entry Wire Line
	1900 1400 1800 1300
Text Label -2500 2200 2    50   ~ 0
D0
Wire Wire Line
	2500 1500 1900 1500
Entry Wire Line
	1900 1500 1800 1400
Text Label -2500 2300 2    50   ~ 0
D1
Wire Wire Line
	2500 1600 1900 1600
Entry Wire Line
	1900 1600 1800 1500
Text Label -2500 2400 2    50   ~ 0
D2
Wire Wire Line
	2500 1700 1900 1700
Entry Wire Line
	1900 1700 1800 1600
Text Label -2500 2500 2    50   ~ 0
D3
Wire Wire Line
	2500 1800 1900 1800
Entry Wire Line
	1900 1800 1800 1700
Text Label -2500 2600 2    50   ~ 0
D4
Wire Wire Line
	2500 1900 1900 1900
Entry Wire Line
	1900 1900 1800 1800
Text Label -2500 2700 2    50   ~ 0
D5
Wire Wire Line
	2500 2000 1900 2000
Entry Wire Line
	1900 2000 1800 1900
Text Label -2500 2800 2    50   ~ 0
D6
Wire Wire Line
	2500 2100 1900 2100
Entry Wire Line
	1900 2100 1800 2000
Text Label -2500 2900 2    50   ~ 0
D7
Wire Wire Line
	2500 2400 1900 2400
Entry Wire Line
	1900 2400 1800 2300
Text Label 2400 2400 2    50   ~ 0
A0
Wire Wire Line
	2500 2300 1900 2300
Entry Wire Line
	1900 2300 1800 2200
Text Label 2400 2300 2    50   ~ 0
A1
Text GLabel -2600 3250 0    50   Input ~ 0
!M1
Text GLabel -2600 3350 0    50   Input ~ 0
!IOREQ
Text GLabel -2600 3450 0    50   Input ~ 0
!RD
Wire Wire Line
	-2600 3250 -2400 3250
Wire Wire Line
	-2400 3350 -2600 3350
Wire Wire Line
	-2600 3450 -2400 3450
Text GLabel -2600 3150 0    50   Input ~ 0
RESET
Wire Wire Line
	-2600 3150 -2400 3150
Text GLabel -2600 3650 0    50   Input ~ 0
CLK_CPU
Wire Wire Line
	-2400 3650 -2600 3650
Text GLabel -2600 3800 0    50   Output ~ 0
!INT
Wire Wire Line
	-2400 3800 -2600 3800
Wire Wire Line
	-1400 2500 -1200 2500
Wire Wire Line
	-1200 2300 -1400 2300
Wire Wire Line
	-1400 3400 -1100 3400
Wire Wire Line
	-1400 2400 -400 2400
Wire Wire Line
	-1400 2200 -500 2200
Wire Wire Line
	-1400 2850 -700 2850
Wire Wire Line
	-1400 2950 -600 2950
Wire Wire Line
	-700 3500 -1400 3500
Wire Wire Line
	-800 3300 -1400 3300
Wire Wire Line
	-900 3950 -1400 3950
Wire Wire Line
	-1000 4050 -1400 4050
Wire Bus Line
	1800 950  1000 950 
NoConn ~ -1400 2600
NoConn ~ -1400 2700
NoConn ~ -1400 3050
NoConn ~ -1400 3150
NoConn ~ -1400 3700
NoConn ~ -1400 4150
NoConn ~ -1400 4250
NoConn ~ -1400 3800
$Comp
L Zilog_Z80_Peripherals:SIO0-DIP-40 IC?
U 1 1 624FB9ED
P -2200 2150
AR Path="/622409DC/624FB9ED" Ref="IC?"  Part="1" 
AR Path="/624F3E6F/624FB9ED" Ref="IC?"  Part="1" 
F 0 "IC?" H -1900 2531 50  0000 C CNN
F 1 "SIO0-DIP-40" H -1900 2440 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_LongPads" H -1800 4000 50  0001 L CNN
F 3 "" H -3000 1000 50  0001 L CNN
F 4 "Z80 CMOS SIO/0 Z84C40 Zilog" H -1800 3800 50  0001 L CNN "Description"
F 5 "4.06" H -1800 3700 50  0001 L CNN "Height"
F 6 "Zilog" H -1800 3600 50  0001 L CNN "Manufacturer_Name"
F 7 "Z84C4206PEG" H -1800 3500 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "692-Z84C4206PEG" H -1800 3400 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=692-Z84C4206PEG" H -1800 3300 50  0001 L CNN "Mouser Price/Stock"
F 10 "6600766" H -1800 3200 50  0001 L CNN "RS Part Number"
F 11 "https://uk.rs-online.com/web/p/products/6600766" H -1800 3100 50  0001 L CNN "RS Price/Stock"
F 12 "R1000052" H -1800 3000 50  0001 L CNN "Allied_Number"
F 13 "https://www.alliedelec.com/zilog-z84c4206peg/R1000052/" H -1800 2900 50  0001 L CNN "Allied Price/Stock"
	1    -2200 2150
	1    0    0    -1  
$EndComp
$Comp
L Zilog_Z80_Peripherals:PIO-DIP-40 U?
U 1 1 624FCE64
P 2600 1300
F 0 "U?" H 3000 1581 50  0000 C CNN
F 1 "PIO-DIP-40" H 3000 1490 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm" H 3000 -1300 50  0001 C CNN
F 3 "" H 2550 -300 50  0001 C CNN
	1    2600 1300
	1    0    0    -1  
$EndComp
Text GLabel 2300 2700 0    50   Input ~ 0
!M1
Text GLabel 2300 2800 0    50   Input ~ 0
!IOREQ
Text GLabel 2300 2900 0    50   Input ~ 0
!RD
Wire Wire Line
	2300 2700 2500 2700
Wire Wire Line
	2500 2800 2300 2800
Wire Wire Line
	2300 2900 2500 2900
Text GLabel 2300 3100 0    50   Input ~ 0
CLK_CPU
Wire Wire Line
	2500 3100 2300 3100
Text GLabel 2300 3300 0    50   Output ~ 0
!INT
Wire Wire Line
	2500 3300 2300 3300
NoConn ~ 3500 2300
NoConn ~ 3500 2400
NoConn ~ 3500 3500
NoConn ~ 3500 3600
$Comp
L 74xx:74HC595 U?
U 1 1 62524117
P 5850 1800
F 0 "U?" H 5850 2581 50  0000 C CNN
F 1 "74HC595" H 5850 2490 50  0000 C CNN
F 2 "" H 5850 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 5850 1800 50  0001 C CNN
	1    5850 1800
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74HC595 U?
U 1 1 6252D88F
P 5850 3550
F 0 "U?" H 5850 4331 50  0000 C CNN
F 1 "74HC595" H 5850 4240 50  0000 C CNN
F 2 "" H 5850 3550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 5850 3550 50  0001 C CNN
	1    5850 3550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5450 2300 5300 2300
Wire Wire Line
	5300 2300 5300 2750
Wire Wire Line
	5300 2750 6450 2750
Wire Wire Line
	6450 2750 6450 3150
Wire Wire Line
	6450 3150 6250 3150
Wire Wire Line
	6500 3350 6500 1900
Wire Wire Line
	6500 1600 6250 1600
Wire Wire Line
	6250 3350 6500 3350
Wire Wire Line
	6250 3650 6500 3650
Wire Wire Line
	6500 3650 6500 3350
Connection ~ 6500 3350
Wire Wire Line
	6250 1900 6500 1900
Connection ~ 6500 1900
Wire Wire Line
	6500 1900 6500 1600
Wire Wire Line
	3500 1400 4800 1400
Wire Wire Line
	4800 1400 4800 1500
Wire Wire Line
	4800 1500 5450 1500
Wire Wire Line
	3500 1500 4700 1500
Wire Wire Line
	4700 1500 4700 1600
Wire Wire Line
	4700 1600 5450 1600
Wire Wire Line
	4600 1600 4600 1700
Wire Wire Line
	4600 1700 5450 1700
Wire Wire Line
	3500 1600 4600 1600
Wire Wire Line
	3500 1700 4500 1700
Wire Wire Line
	4500 1700 4500 1800
Wire Wire Line
	4500 1800 5450 1800
Wire Wire Line
	3500 1800 4400 1800
Wire Wire Line
	4400 1800 4400 1900
Wire Wire Line
	4400 1900 5450 1900
Wire Wire Line
	3500 1900 4300 1900
Wire Wire Line
	4300 1900 4300 2000
Wire Wire Line
	4300 2000 5450 2000
Wire Wire Line
	3500 2000 4200 2000
Wire Wire Line
	4200 2000 4200 2100
Wire Wire Line
	4200 2100 5450 2100
Wire Wire Line
	3500 2100 4100 2100
Wire Wire Line
	4100 2100 4100 2200
Wire Wire Line
	4100 2200 5200 2200
Wire Wire Line
	5200 2200 5200 3150
Wire Wire Line
	5200 3150 5450 3150
Text Label 5100 1500 2    50   ~ 0
DATA0
Text Label 5100 1600 2    50   ~ 0
DATA1
Text Label 5100 1700 2    50   ~ 0
DATA2
Text Label 5100 1800 2    50   ~ 0
DATA3
Text Label 5100 1900 2    50   ~ 0
DATA4
Text Label 5100 2000 2    50   ~ 0
DATA5
Text Label 5100 2100 2    50   ~ 0
DATA6
Text Label 5100 2200 2    50   ~ 0
DATA7
Wire Wire Line
	5450 3250 5100 3250
Wire Wire Line
	5100 3250 5100 2600
Wire Wire Line
	5100 2600 3500 2600
Text Label 4900 2600 2    50   ~ 0
PARITY
Wire Wire Line
	5450 3350 5000 3350
Wire Wire Line
	5000 3350 5000 2700
Wire Wire Line
	5000 2700 3500 2700
Text Label 4900 2700 2    50   ~ 0
STOP
Wire Wire Line
	4900 2800 4900 4550
Wire Wire Line
	4900 4550 6600 4550
Wire Wire Line
	6600 4550 6600 3450
Wire Wire Line
	6600 3450 6250 3450
Wire Wire Line
	6600 3450 6600 1700
Wire Wire Line
	6600 1700 6250 1700
Connection ~ 6600 3450
Text Label 4900 2800 2    50   ~ 0
CLEAR
Wire Wire Line
	3500 2800 4900 2800
$Comp
L power:GND #PWR?
U 1 1 62552439
P 6350 3850
F 0 "#PWR?" H 6350 3600 50  0001 C CNN
F 1 "GND" H 6355 3677 50  0000 C CNN
F 2 "" H 6350 3850 50  0001 C CNN
F 3 "" H 6350 3850 50  0001 C CNN
	1    6350 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3750 6350 3750
Wire Wire Line
	6350 3750 6350 3850
Wire Wire Line
	6250 2000 6350 2000
Wire Wire Line
	6350 2000 6350 3750
Connection ~ 6350 3750
$Comp
L 74xx:74LS125 U?
U 1 1 6255C343
P 7900 1700
F 0 "U?" H 7900 2017 50  0000 C CNN
F 1 "74HC125" H 7900 1926 50  0000 C CNN
F 2 "" H 7900 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS125" H 7900 1700 50  0001 C CNN
	1    7900 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 2900 3650 2900
Wire Wire Line
	3650 2900 3650 700 
Wire Wire Line
	3650 700  7500 700 
Wire Wire Line
	7500 700  7500 1700
Wire Wire Line
	7500 1700 7600 1700
Wire Wire Line
	3500 3000 3750 3000
Wire Wire Line
	3750 3000 3750 800 
Wire Wire Line
	3750 800  7400 800 
Wire Wire Line
	7400 800  7400 2400
Wire Wire Line
	7400 2400 7600 2400
Wire Wire Line
	6250 1400 7650 1400
Wire Wire Line
	7650 1400 7650 1250
Wire Wire Line
	7650 1250 8300 1250
Wire Wire Line
	8300 1250 8300 1700
Wire Wire Line
	8300 1700 8200 1700
Wire Wire Line
	6500 1600 7300 1600
Wire Wire Line
	7300 1600 7300 1150
Wire Wire Line
	7300 1150 8400 1150
Wire Wire Line
	8400 1150 8400 2400
Wire Wire Line
	8400 2400 8200 2400
Connection ~ 6500 1600
Text Label 4300 700  2    50   ~ 0
SDATA
Text Label 4300 800  2    50   ~ 0
SCLK
Wire Wire Line
	3500 3100 3850 3100
Wire Wire Line
	3850 3100 3850 900 
Wire Wire Line
	3850 900  7200 900 
Wire Wire Line
	7200 900  7200 1950
Wire Wire Line
	7200 1950 7900 1950
Wire Wire Line
	7900 2650 7200 2650
Wire Wire Line
	7200 2650 7200 1950
Connection ~ 7200 1950
Text Label 4300 900  2    50   ~ 0
SENABLE
$Comp
L Connector:DIN-5 J?
U 1 1 6257EE0D
P 9950 2200
F 0 "J?" H 9950 1925 50  0000 C CNN
F 1 "DIN-5" H 9950 1834 50  0000 C CNN
F 2 "" H 9950 2200 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/18/40_c091_abd_e-75918.pdf" H 9950 2200 50  0001 C CNN
	1    9950 2200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 625803D8
P 9450 2000
F 0 "#PWR?" H 9450 1850 50  0001 C CNN
F 1 "+5V" H 9465 2173 50  0000 C CNN
F 2 "" H 9450 2000 50  0001 C CNN
F 3 "" H 9450 2000 50  0001 C CNN
	1    9450 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62580A2E
P 9550 2400
F 0 "#PWR?" H 9550 2150 50  0001 C CNN
F 1 "GND" H 9555 2227 50  0000 C CNN
F 2 "" H 9550 2400 50  0001 C CNN
F 3 "" H 9550 2400 50  0001 C CNN
	1    9550 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 2400 9550 2100
Wire Wire Line
	9550 2100 9650 2100
Wire Wire Line
	9650 2300 9450 2300
Wire Wire Line
	9450 2300 9450 2000
Wire Wire Line
	10250 2100 10450 2100
Wire Wire Line
	10450 2100 10450 1700
Wire Wire Line
	10450 1700 8300 1700
Connection ~ 8300 1700
Wire Wire Line
	10250 2300 10450 2300
Wire Wire Line
	10450 2300 10450 2750
Wire Wire Line
	10450 2750 8400 2750
Wire Wire Line
	8400 2750 8400 2400
Wire Bus Line
	1800 950  1800 2300
Connection ~ 8400 2400
Text Label 10300 1700 2    50   ~ 0
PS2_DATA
Text Label 10300 2750 2    50   ~ 0
PS2_CLK
$Comp
L 74xx:74LS125 U?
U 2 1 62598262
P 7900 2400
F 0 "U?" H 7900 2717 50  0000 C CNN
F 1 "74HC125" H 7900 2626 50  0000 C CNN
F 2 "" H 7900 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS125" H 7900 2400 50  0001 C CNN
	2    7900 2400
	1    0    0    -1  
$EndComp
$EndSCHEMATC
