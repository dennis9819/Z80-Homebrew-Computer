EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 7
Title "SPI Interface"
Date "2022-02-18"
Rev ""
Comp "Dennis Gunia"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Z8C-rev3-rescue:74HC165-74xx U?
U 1 1 620ED2DC
P 3700 1650
AR Path="/620ED2DC" Ref="U?"  Part="1" 
AR Path="/620ED227/620ED2DC" Ref="U?"  Part="1" 
F 0 "U?" H 3700 2731 50  0000 C CNN
F 1 "74HC165" H 3700 2640 50  0000 C CNN
F 2 "" H 3700 1650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT165.pdf" H 3700 1650 50  0001 C CNN
	1    3700 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 1150 2600 1150
Entry Wire Line
	2600 1150 2500 1050
Text Label 3100 1150 2    50   ~ 0
D0
Wire Wire Line
	3200 1250 2600 1250
Entry Wire Line
	2600 1250 2500 1150
Text Label 3100 1250 2    50   ~ 0
D1
Wire Wire Line
	3200 1350 2600 1350
Entry Wire Line
	2600 1350 2500 1250
Text Label 3100 1350 2    50   ~ 0
D2
Wire Wire Line
	3200 1450 2600 1450
Entry Wire Line
	2600 1450 2500 1350
Text Label 3100 1450 2    50   ~ 0
D3
Wire Wire Line
	3200 1550 2600 1550
Entry Wire Line
	2600 1550 2500 1450
Text Label 3100 1550 2    50   ~ 0
D4
Wire Wire Line
	3200 1650 2600 1650
Entry Wire Line
	2600 1650 2500 1550
Text Label 3100 1650 2    50   ~ 0
D5
Wire Wire Line
	3200 1750 2600 1750
Entry Wire Line
	2600 1750 2500 1650
Text Label 3100 1750 2    50   ~ 0
D6
Wire Wire Line
	3200 1850 2600 1850
Entry Wire Line
	2600 1850 2500 1750
Text Label 3100 1850 2    50   ~ 0
D7
$Comp
L power:GND #PWR?
U 1 1 620F48CD
P 3150 2400
F 0 "#PWR?" H 3150 2150 50  0001 C CNN
F 1 "GND" H 3155 2227 50  0000 C CNN
F 2 "" H 3150 2400 50  0001 C CNN
F 3 "" H 3150 2400 50  0001 C CNN
	1    3150 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 2350 3150 2350
Wire Wire Line
	3150 2350 3150 2400
Text GLabel 1000 2050 0    50   Input ~ 0
!SPI_WR
$Comp
L power:GND #PWR?
U 1 1 620F5443
P 3050 800
F 0 "#PWR?" H 3050 550 50  0001 C CNN
F 1 "GND" H 3055 627 50  0000 C CNN
F 2 "" H 3050 800 50  0001 C CNN
F 3 "" H 3050 800 50  0001 C CNN
	1    3050 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 1050 3200 750 
Wire Wire Line
	3200 750  3050 750 
Wire Wire Line
	3050 750  3050 800 
$Comp
L 74xx:74LS32 U?
U 1 1 620F6E46
P 2700 2500
F 0 "U?" H 2700 2825 50  0000 C CNN
F 1 "74HC32" H 2700 2734 50  0000 C CNN
F 2 "" H 2700 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2700 2500 50  0001 C CNN
	1    2700 2500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 1 1 620FAAEF
P 1650 2400
F 0 "U?" H 1650 2717 50  0000 C CNN
F 1 "74HC04" H 1650 2626 50  0000 C CNN
F 2 "" H 1650 2400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 1650 2400 50  0001 C CNN
	1    1650 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 2400 2000 2400
Wire Wire Line
	1000 2050 1250 2050
Wire Wire Line
	1250 2050 1250 2400
Wire Wire Line
	1250 2400 1350 2400
Wire Wire Line
	1250 2050 3200 2050
Connection ~ 1250 2050
Wire Wire Line
	3000 2500 3000 2250
Wire Wire Line
	3000 2250 3200 2250
Text Notes 1050 1900 0    50   ~ 0
write generates single clk pulse \nand pulls pin 1 to low (indicating \na parallel load)\n
$Comp
L 74xx:74HC74 U?
U 1 1 62104FE5
P 3000 3950
F 0 "U?" H 3000 4431 50  0000 C CNN
F 1 "74HC74" H 3000 4340 50  0000 C CNN
F 2 "" H 3000 3950 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 3000 3950 50  0001 C CNN
	1    3000 3950
	1    0    0    -1  
$EndComp
$Comp
L Oscillator:ASCO X?
U 1 1 62107221
P 2250 5200
F 0 "X?" H 2500 5450 50  0000 L CNN
F 1 "20MHz" H 2600 5050 50  0000 L CNN
F 2 "Oscillator:Oscillator_SMD_Abracon_ASCO-4Pin_1.6x1.2mm" H 2350 4850 50  0001 C CNN
F 3 "https://abracon.com/Oscillators/ASCO.pdf" H 2025 5325 50  0001 C CNN
	1    2250 5200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 2 1 6210C461
P 1650 3500
F 0 "U?" H 1650 3817 50  0000 C CNN
F 1 "74HC04" H 1650 3726 50  0000 C CNN
F 2 "" H 1650 3500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 1650 3500 50  0001 C CNN
	2    1650 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 2400 2000 2700
Wire Wire Line
	2000 2700 1250 2700
Wire Wire Line
	1250 2700 1250 3500
Wire Wire Line
	1250 3500 1350 3500
Connection ~ 2000 2400
Wire Wire Line
	2000 2400 2400 2400
Wire Wire Line
	2450 3500 2450 3950
Wire Wire Line
	2450 3950 2700 3950
Wire Wire Line
	1950 3500 2450 3500
Text Notes 3650 4150 0    50   ~ 0
This flip-flop generates \nthe start signal for the clock/timer, \nas soon as WR goes high again.\n\nThe output stays high for 8 clock cycles \nand is reset by the cunter/timer reaching byte 8
$Comp
L 74xx:74HC74 U?
U 2 1 6211E9AB
P 3850 5200
F 0 "U?" H 3850 5681 50  0000 C CNN
F 1 "74HC74" H 3850 5590 50  0000 C CNN
F 2 "" H 3850 5200 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 3850 5200 50  0001 C CNN
	2    3850 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 3850 3500 3850
Wire Wire Line
	3500 3850 3500 5100
Wire Wire Line
	3500 5100 3550 5100
Wire Wire Line
	2650 5200 3100 5200
$Comp
L power:+5V #PWR?
U 1 1 62126B17
P 2700 3550
F 0 "#PWR?" H 2700 3400 50  0001 C CNN
F 1 "+5V" H 2715 3723 50  0000 C CNN
F 2 "" H 2700 3550 50  0001 C CNN
F 3 "" H 2700 3550 50  0001 C CNN
	1    2700 3550
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 62127243
P 3400 4850
F 0 "#PWR?" H 3400 4700 50  0001 C CNN
F 1 "+5V" H 3415 5023 50  0000 C CNN
F 2 "" H 3400 4850 50  0001 C CNN
F 3 "" H 3400 4850 50  0001 C CNN
	1    3400 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 3650 2700 3550
Wire Wire Line
	2700 3650 3000 3650
Connection ~ 2700 3650
Wire Wire Line
	3850 4900 3400 4900
Wire Wire Line
	3400 4900 3400 4850
Wire Wire Line
	3850 5500 3400 5500
Wire Wire Line
	3400 5500 3400 4900
Connection ~ 3400 4900
Wire Wire Line
	2700 3850 2700 3650
$Comp
L power:+5V #PWR?
U 1 1 6212DE9E
P 2250 4900
F 0 "#PWR?" H 2250 4750 50  0001 C CNN
F 1 "+5V" H 2265 5073 50  0000 C CNN
F 2 "" H 2250 4900 50  0001 C CNN
F 3 "" H 2250 4900 50  0001 C CNN
	1    2250 4900
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6212E3E7
P 2250 5500
F 0 "#PWR?" H 2250 5250 50  0001 C CNN
F 1 "GND" H 2255 5327 50  0000 C CNN
F 2 "" H 2250 5500 50  0001 C CNN
F 3 "" H 2250 5500 50  0001 C CNN
	1    2250 5500
	1    0    0    -1  
$EndComp
Text Notes 4250 5050 0    50   ~ 0
Lock enable signal to\nclock phase
Wire Wire Line
	3600 4650 3600 3000
Wire Wire Line
	3600 3000 2300 3000
Wire Wire Line
	2300 3000 2300 2600
Wire Wire Line
	2300 2600 2400 2600
$Comp
L 74xx:74LS169 U?
U 1 1 6215982F
P 6750 4050
F 0 "U?" H 6750 5131 50  0000 C CNN
F 1 "74HC169" H 6750 5040 50  0000 C CNN
F 2 "" H 6750 4050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS169" H 6750 4050 50  0001 C CNN
	1    6750 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 3450 7750 3450
Wire Wire Line
	7250 3550 7750 3550
Wire Wire Line
	7250 3650 7750 3650
NoConn ~ 7250 4050
NoConn ~ 4150 5300
$Comp
L power:GND #PWR?
U 1 1 62178D71
P 6000 4850
F 0 "#PWR?" H 6000 4600 50  0001 C CNN
F 1 "GND" H 6005 4677 50  0000 C CNN
F 2 "" H 6000 4850 50  0001 C CNN
F 3 "" H 6000 4850 50  0001 C CNN
	1    6000 4850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6250 4150 6000 4150
Wire Wire Line
	6000 4150 6000 4350
Wire Wire Line
	6000 4150 6000 3750
Wire Wire Line
	6000 3750 6250 3750
Connection ~ 6000 4150
Wire Wire Line
	6250 3650 6000 3650
Wire Wire Line
	6000 3650 6000 3750
Connection ~ 6000 3750
Wire Wire Line
	6250 3550 6000 3550
Wire Wire Line
	6000 3550 6000 3650
Connection ~ 6000 3650
Wire Wire Line
	6250 3450 6000 3450
Wire Wire Line
	6000 3450 6000 3550
Connection ~ 6000 3550
Wire Wire Line
	6250 4350 6000 4350
Connection ~ 6000 4350
Wire Wire Line
	6000 4350 6000 4450
Wire Wire Line
	6250 4450 6000 4450
Connection ~ 6000 4450
Wire Wire Line
	6000 4450 6000 4850
$Comp
L 74xx:74HC04 U?
U 3 1 62190968
P 6250 2550
F 0 "U?" H 6250 2867 50  0000 C CNN
F 1 "74HC04" H 6250 2776 50  0000 C CNN
F 2 "" H 6250 2550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6250 2550 50  0001 C CNN
	3    6250 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 2550 6650 2550
Wire Wire Line
	5950 2550 5850 2550
Wire Wire Line
	9050 2150 9050 4150
Wire Wire Line
	9050 4150 8550 4150
Wire Wire Line
	6250 3950 5850 3950
Wire Wire Line
	6650 2850 6650 2550
Text Notes 5850 3100 0    50   ~ 0
This signal resets\nthe counter after\nbit 8 is reached
Wire Wire Line
	2550 4350 3000 4350
Wire Wire Line
	3000 4350 3000 4250
$Comp
L 74xx:74HC137 U?
U 1 1 621A117E
P 8150 3850
F 0 "U?" H 8150 4631 50  0000 C CNN
F 1 "74HC137" H 8150 4540 50  0000 C CNN
F 2 "" H 8150 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74hc237.pdf" H 8150 3850 50  0001 C CNN
	1    8150 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 621A831F
P 7650 4250
F 0 "#PWR?" H 7650 4000 50  0001 C CNN
F 1 "GND" H 7655 4077 50  0000 C CNN
F 2 "" H 7650 4250 50  0001 C CNN
F 3 "" H 7650 4250 50  0001 C CNN
	1    7650 4250
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 621A9028
P 7500 4050
F 0 "#PWR?" H 7500 3900 50  0001 C CNN
F 1 "+5V" H 7515 4223 50  0000 C CNN
F 2 "" H 7500 4050 50  0001 C CNN
F 3 "" H 7500 4050 50  0001 C CNN
	1    7500 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 4250 7650 4050
Wire Wire Line
	7650 4050 7750 4050
Wire Wire Line
	7650 4050 7650 3850
Wire Wire Line
	7650 3850 7750 3850
Connection ~ 7650 4050
Wire Wire Line
	7750 4150 7500 4150
Wire Wire Line
	7500 4150 7500 4050
NoConn ~ 7250 3750
NoConn ~ 8550 4050
NoConn ~ 8550 3950
NoConn ~ 8550 3850
NoConn ~ 8550 3750
NoConn ~ 8550 3650
NoConn ~ 8550 3550
NoConn ~ 8550 3450
$Comp
L 74xx:74HC04 U?
U 4 1 621BF569
P 5550 2550
F 0 "U?" H 5550 2867 50  0000 C CNN
F 1 "74HC04" H 5550 2776 50  0000 C CNN
F 2 "" H 5550 2550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5550 2550 50  0001 C CNN
	4    5550 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 2150 5150 2150
Wire Wire Line
	5150 2150 5150 2550
Wire Wire Line
	5150 2550 5250 2550
Text Notes 3900 3000 0    50   ~ 0
It also resets the\nclock enable latch
$Comp
L 74xx:74HC04 U?
U 5 1 621CFC59
P 5550 1850
F 0 "U?" H 5550 2167 50  0000 C CNN
F 1 "74HC04" H 5550 2076 50  0000 C CNN
F 2 "" H 5550 1850 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5550 1850 50  0001 C CNN
	5    5550 1850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 6 1 621D0BB8
P 6250 1850
F 0 "U?" H 6250 2167 50  0000 C CNN
F 1 "74HC04" H 6250 2076 50  0000 C CNN
F 2 "" H 6250 1850 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6250 1850 50  0001 C CNN
	6    6250 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 1850 5850 1850
Wire Wire Line
	3600 3000 3600 2750
Wire Wire Line
	3600 2750 5050 2750
Wire Wire Line
	5050 2750 5050 1850
Wire Wire Line
	5050 1850 5250 1850
Connection ~ 3600 3000
Text GLabel 6700 1850 2    50   Output ~ 0
SPI_CLK
Wire Wire Line
	6550 1850 6700 1850
Text GLabel 4350 1050 2    50   Output ~ 0
SPI_MOSI
Wire Wire Line
	4200 1050 4350 1050
NoConn ~ 1850 5200
Wire Wire Line
	3600 4650 5250 4650
$Comp
L 74xx:74LS08 U?
U 1 1 621F1518
P 4650 5500
F 0 "U?" H 4650 5825 50  0000 C CNN
F 1 "74HC08" H 4650 5734 50  0000 C CNN
F 2 "" H 4650 5500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4650 5500 50  0001 C CNN
	1    4650 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 5200 3100 5600
Wire Wire Line
	3100 5600 4350 5600
Connection ~ 3100 5200
Wire Wire Line
	3100 5200 3550 5200
Wire Wire Line
	4150 5100 4250 5100
Wire Wire Line
	4250 5100 4250 5400
Wire Wire Line
	4250 5400 4350 5400
Wire Wire Line
	4950 5500 5250 5500
Wire Wire Line
	5250 5500 5250 4650
Connection ~ 5250 4650
Wire Wire Line
	5250 4650 6250 4650
$Comp
L 74xx:74HC595 U?
U 1 1 622068AA
P 3300 6700
F 0 "U?" H 3300 7481 50  0000 C CNN
F 1 "74HC595" H 3300 7390 50  0000 C CNN
F 2 "" H 3300 6700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 3300 6700 50  0001 C CNN
	1    3300 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 5500 5250 5750
Wire Wire Line
	5250 5750 2700 5750
Wire Wire Line
	2700 5750 2700 6500
Wire Wire Line
	2700 6500 2900 6500
Connection ~ 5250 5500
$Comp
L 74xx:74LS08 U?
U 2 1 622342F0
P 2250 4350
F 0 "U?" H 2250 4675 50  0000 C CNN
F 1 "74HC08" H 2250 4584 50  0000 C CNN
F 2 "" H 2250 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2250 4350 50  0001 C CNN
	2    2250 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 2850 2050 4100
Wire Wire Line
	2050 4100 1850 4100
Wire Wire Line
	1850 4100 1850 4250
Wire Wire Line
	1850 4250 1950 4250
Wire Wire Line
	1950 4450 1500 4450
Wire Wire Line
	1500 4450 1500 4600
Wire Wire Line
	1500 6600 2900 6600
Text GLabel 1400 4450 0    50   Input ~ 0
!RESET
Wire Wire Line
	1400 4450 1500 4450
Connection ~ 1500 4450
Text GLabel 2500 6300 0    50   Input ~ 0
SPI_MISO
Wire Wire Line
	2500 6300 2900 6300
Wire Wire Line
	2700 6500 2700 6800
Wire Wire Line
	2700 6800 2900 6800
Connection ~ 2700 6500
Text GLabel 2500 6900 0    50   Input ~ 0
!SPI_RD
Wire Wire Line
	2900 6900 2500 6900
Wire Wire Line
	3700 6300 4300 6300
Entry Wire Line
	4300 6300 4400 6200
Text Label 3800 6300 0    50   ~ 0
D0
Wire Wire Line
	3700 6400 4300 6400
Entry Wire Line
	4300 6400 4400 6300
Text Label 3800 6400 0    50   ~ 0
D1
Wire Wire Line
	3700 6500 4300 6500
Entry Wire Line
	4300 6500 4400 6400
Text Label 3800 6500 0    50   ~ 0
D2
Wire Wire Line
	3700 6600 4300 6600
Entry Wire Line
	4300 6600 4400 6500
Text Label 3800 6600 0    50   ~ 0
D3
Wire Wire Line
	3700 6700 4300 6700
Entry Wire Line
	4300 6700 4400 6600
Text Label 3800 6700 0    50   ~ 0
D4
Wire Wire Line
	3700 6800 4300 6800
Entry Wire Line
	4300 6800 4400 6700
Text Label 3800 6800 0    50   ~ 0
D5
Wire Wire Line
	3700 6900 4300 6900
Entry Wire Line
	4300 6900 4400 6800
Text Label 3800 6900 0    50   ~ 0
D6
Wire Wire Line
	3700 7000 4300 7000
Entry Wire Line
	4300 7000 4400 6900
Text Label 3800 7000 0    50   ~ 0
D7
Wire Wire Line
	2050 2850 5050 2850
$Comp
L 74xx:74LS08 U?
U 3 1 622985DF
P 5500 3400
F 0 "U?" H 5500 3725 50  0000 C CNN
F 1 "74HC08" H 5500 3634 50  0000 C CNN
F 2 "" H 5500 3400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5500 3400 50  0001 C CNN
	3    5500 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 3950 5850 3400
Wire Wire Line
	5850 3400 5800 3400
Wire Wire Line
	5200 3300 5050 3300
Wire Wire Line
	5050 3300 5050 2850
Connection ~ 5050 2850
Wire Wire Line
	5050 2850 6650 2850
Wire Wire Line
	5200 3500 3400 3500
Wire Wire Line
	3400 3500 3400 4600
Wire Wire Line
	3400 4600 1500 4600
Connection ~ 1500 4600
Wire Wire Line
	1500 4600 1500 6600
Wire Bus Line
	4400 5950 4550 5950
Wire Bus Line
	2500 950  2400 950 
Text GLabel 2400 950  0    50   BiDi ~ 0
z80bus
Text GLabel 4550 5950 2    50   BiDi ~ 0
z80bus
NoConn ~ 3700 7200
$Comp
L 74xx:74LS573 U?
U 1 1 62327306
P 5600 6800
F 0 "U?" H 5600 7781 50  0000 C CNN
F 1 "74LS573" H 5600 7690 50  0000 C CNN
F 2 "" H 5600 6800 50  0001 C CNN
F 3 "74xx/74hc573.pdf" H 5600 6800 50  0001 C CNN
	1    5600 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 6300 4500 6300
Entry Wire Line
	4500 6300 4400 6200
Text Label 5000 6300 2    50   ~ 0
D0
Wire Wire Line
	5100 6400 4500 6400
Entry Wire Line
	4500 6400 4400 6300
Text Label 5000 6400 2    50   ~ 0
D1
Wire Wire Line
	5100 6500 4500 6500
Entry Wire Line
	4500 6500 4400 6400
Text Label 5000 6500 2    50   ~ 0
D2
Wire Wire Line
	5100 6600 4500 6600
Entry Wire Line
	4500 6600 4400 6500
Text Label 5000 6600 2    50   ~ 0
D3
Wire Wire Line
	5100 6700 4500 6700
Entry Wire Line
	4500 6700 4400 6600
Text Label 5000 6700 2    50   ~ 0
D4
Wire Wire Line
	5100 6800 4500 6800
Entry Wire Line
	4500 6800 4400 6700
Text Label 5000 6800 2    50   ~ 0
D5
Wire Wire Line
	5100 6900 4500 6900
Entry Wire Line
	4500 6900 4400 6800
Text Label 5000 6900 2    50   ~ 0
D6
Wire Wire Line
	5100 7000 4500 7000
Entry Wire Line
	4500 7000 4400 6900
Text Label 5000 7000 2    50   ~ 0
D7
Wire Wire Line
	5050 7300 5100 7300
$Comp
L power:GND #PWR?
U 1 1 62389FA6
P 5050 7300
F 0 "#PWR?" H 5050 7050 50  0001 C CNN
F 1 "GND" H 5055 7127 50  0000 C CNN
F 2 "" H 5050 7300 50  0001 C CNN
F 3 "" H 5050 7300 50  0001 C CNN
	1    5050 7300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 1 1 62396D19
P 4500 7550
F 0 "U?" H 4500 7867 50  0000 C CNN
F 1 "74HC04" H 4500 7776 50  0000 C CNN
F 2 "" H 4500 7550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4500 7550 50  0001 C CNN
	1    4500 7550
	1    0    0    -1  
$EndComp
Text GLabel 4000 7550 0    50   Input ~ 0
!WR_SPI_CS
Wire Wire Line
	4000 7550 4200 7550
Wire Wire Line
	4800 7550 4900 7550
Wire Wire Line
	4900 7550 4900 7200
Wire Wire Line
	4900 7200 5100 7200
$Comp
L 74xx:74HC137 U?
U 1 1 623B1537
P 7250 5900
F 0 "U?" H 7250 6681 50  0000 C CNN
F 1 "74HC137" H 7250 6590 50  0000 C CNN
F 2 "" H 7250 5900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74hc237.pdf" H 7250 5900 50  0001 C CNN
	1    7250 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 6300 6150 6300
Wire Wire Line
	6150 6300 6150 5500
Wire Wire Line
	6150 5500 6850 5500
Wire Wire Line
	6250 6400 6250 5600
Wire Wire Line
	6250 5600 6850 5600
Wire Wire Line
	6100 6400 6250 6400
Wire Wire Line
	6100 6500 6350 6500
Wire Wire Line
	6350 6500 6350 5700
Wire Wire Line
	6350 5700 6850 5700
NoConn ~ 3300 4050
Wire Wire Line
	3500 5100 3500 5850
Wire Wire Line
	3500 5850 6450 5850
Wire Wire Line
	6450 5850 6450 6200
Wire Wire Line
	6450 6200 6850 6200
Connection ~ 3500 5100
$Comp
L power:GND #PWR?
U 1 1 623E7392
P 6750 6500
F 0 "#PWR?" H 6750 6250 50  0001 C CNN
F 1 "GND" H 6755 6327 50  0000 C CNN
F 2 "" H 6750 6500 50  0001 C CNN
F 3 "" H 6750 6500 50  0001 C CNN
	1    6750 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 6500 6750 6400
Wire Wire Line
	6750 6100 6850 6100
Wire Wire Line
	6750 6100 6750 5900
Wire Wire Line
	6750 5900 6850 5900
Connection ~ 6750 6100
Wire Wire Line
	7250 6400 6750 6400
Connection ~ 6750 6400
Wire Wire Line
	6750 6400 6750 6100
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J?
U 1 1 6242D84B
P 9000 5650
F 0 "J?" H 9050 6067 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 9050 5976 50  0000 C CNN
F 2 "" H 9000 5650 50  0001 C CNN
F 3 "~" H 9000 5650 50  0001 C CNN
	1    9000 5650
	1    0    0    -1  
$EndComp
Text GLabel 9500 5450 2    50   Input ~ 0
SPI_CLK
Text GLabel 9500 5550 2    50   Input ~ 0
SPI_MOSI
Text GLabel 9500 5650 2    50   Output ~ 0
SPI_MISO
$Comp
L power:GND #PWR?
U 1 1 6243040B
P 9500 5950
F 0 "#PWR?" H 9500 5700 50  0001 C CNN
F 1 "GND" H 9505 5777 50  0000 C CNN
F 2 "" H 9500 5950 50  0001 C CNN
F 3 "" H 9500 5950 50  0001 C CNN
	1    9500 5950
	-1   0    0    -1  
$EndComp
Text GLabel 9500 5750 2    50   Input ~ 0
RESET
Wire Wire Line
	9300 5850 9500 5850
Wire Wire Line
	9500 5850 9500 5950
Wire Wire Line
	9500 5750 9300 5750
Wire Wire Line
	9300 5650 9500 5650
Wire Wire Line
	9300 5550 9500 5550
Wire Wire Line
	9500 5450 9300 5450
Wire Wire Line
	8050 5500 8050 5450
Wire Wire Line
	8050 5450 8800 5450
Wire Wire Line
	8800 5550 8150 5550
Wire Wire Line
	8150 5550 8150 5600
Wire Wire Line
	8150 5600 7650 5600
Wire Wire Line
	7650 5500 8050 5500
Wire Wire Line
	7650 5700 8250 5700
Wire Wire Line
	8250 5700 8250 5650
Wire Wire Line
	8250 5650 8800 5650
Wire Wire Line
	8350 5750 8350 5800
Wire Wire Line
	8350 5800 7650 5800
Wire Wire Line
	7650 5900 8450 5900
Wire Wire Line
	8450 5900 8450 5850
Wire Wire Line
	8450 5850 8800 5850
Wire Wire Line
	8350 5750 8800 5750
NoConn ~ 7650 6000
NoConn ~ 7650 6100
NoConn ~ 7650 6200
Text Label 8750 5450 2    50   ~ 0
SPI_CS0
Text Label 8750 5550 2    50   ~ 0
SPI_CS1
Text Label 8750 5650 2    50   ~ 0
SPI_CS2
Text Label 8750 5750 2    50   ~ 0
SPI_CS3
Text Label 8750 5850 2    50   ~ 0
SPI_CS4
NoConn ~ 6100 6600
NoConn ~ 6100 6700
NoConn ~ 6100 6800
NoConn ~ 6100 6900
NoConn ~ 6100 7000
Wire Bus Line
	4400 5950 4400 6900
Wire Bus Line
	2500 950  2500 1750
$EndSCHEMATC
