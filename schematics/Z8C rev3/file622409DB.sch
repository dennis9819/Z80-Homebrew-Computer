EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 7
Title "IO Addr Decoding & R232"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74xx:74LS154 U?
U 1 1 622422CB
P 2150 2150
F 0 "U?" H 2150 3331 50  0000 C CNN
F 1 "74HC154" H 2150 3240 50  0000 C CNN
F 2 "" H 2150 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS154" H 2150 2150 50  0001 C CNN
	1    2150 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 1450 1050 1450
Entry Wire Line
	1050 1450 950  1350
Text Label 1550 1450 2    50   ~ 0
A4
Wire Wire Line
	1650 1550 1050 1550
Entry Wire Line
	1050 1550 950  1450
Text Label 1550 1550 2    50   ~ 0
A5
Wire Wire Line
	1650 1650 1050 1650
Entry Wire Line
	1050 1650 950  1550
Text Label 1550 1650 2    50   ~ 0
A6
Wire Wire Line
	1650 1750 1050 1750
Entry Wire Line
	1050 1750 950  1650
Text Label 1550 1750 2    50   ~ 0
A7
Text GLabel 1450 1950 0    50   Input ~ 0
!IOREQ
Wire Wire Line
	1450 1950 1550 1950
Wire Wire Line
	1650 2050 1550 2050
Wire Wire Line
	1550 2050 1550 1950
Connection ~ 1550 1950
Wire Wire Line
	1550 1950 1650 1950
$Comp
L Zilog_Z80_Peripherals:CTC-DIP-28 IC?
U 1 1 6224F1DF
P 1850 4350
F 0 "IC?" H 2250 4731 50  0000 C CNN
F 1 "CTC-DIP-28" H 2250 4640 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_LongPads" H 3300 5350 50  0001 L CNN
F 3 "" H 3300 5250 50  0001 L CNN
F 4 "Z8430 Zilog CTC" H 3300 5150 50  0001 L CNN "Description"
F 5 "5.21" H 3300 5050 50  0001 L CNN "Height"
F 6 "Zilog" H 3300 4950 50  0001 L CNN "Manufacturer_Name"
F 7 "Z84C3010PEG" H 3300 4850 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "692-Z84C3010PEG" H 3300 4750 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=692-Z84C3010PEG" H 3300 4650 50  0001 L CNN "Mouser Price/Stock"
	1    1850 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 4400 1050 4400
Entry Wire Line
	1050 4400 950  4300
Text Label 1550 4400 2    50   ~ 0
D0
Wire Wire Line
	1650 4500 1050 4500
Entry Wire Line
	1050 4500 950  4400
Text Label 1550 4500 2    50   ~ 0
D1
Wire Wire Line
	1650 4600 1050 4600
Entry Wire Line
	1050 4600 950  4500
Text Label 1550 4600 2    50   ~ 0
D2
Wire Wire Line
	1650 4700 1050 4700
Entry Wire Line
	1050 4700 950  4600
Text Label 1550 4700 2    50   ~ 0
D3
Wire Wire Line
	1650 4800 1050 4800
Entry Wire Line
	1050 4800 950  4700
Text Label 1550 4800 2    50   ~ 0
D4
Wire Wire Line
	1650 4900 1050 4900
Entry Wire Line
	1050 4900 950  4800
Text Label 1550 4900 2    50   ~ 0
D5
Wire Wire Line
	1650 5000 1050 5000
Entry Wire Line
	1050 5000 950  4900
Text Label 1550 5000 2    50   ~ 0
D6
Wire Wire Line
	1650 5100 1050 5100
Entry Wire Line
	1050 5100 950  5000
Text Label 1550 5100 2    50   ~ 0
D7
Text GLabel 1450 5250 0    50   Input ~ 0
CS_CTC
Text GLabel 2800 1450 2    50   Output ~ 0
CS_CTC
Text GLabel 2800 1650 2    50   Output ~ 0
CS_RTC
Text GLabel 2800 1750 2    50   Output ~ 0
CS_AY0
Text GLabel 2800 1850 2    50   Output ~ 0
CS_AY1
Text GLabel 2800 1950 2    50   Output ~ 0
CS_SN
Text GLabel 2800 2050 2    50   Output ~ 0
CS_YM
Text GLabel 2800 2150 2    50   Output ~ 0
CS_VDP
Text GLabel 2800 2250 2    50   Output ~ 0
CS_PIO0
Text GLabel 2800 2450 2    50   Output ~ 0
CS_SPI
Text GLabel 2800 2950 2    50   Output ~ 0
CS_BANKING
Wire Wire Line
	2650 1450 2800 1450
Wire Wire Line
	2650 1650 2800 1650
Wire Wire Line
	2650 1750 2800 1750
Wire Wire Line
	2650 1850 2800 1850
Wire Wire Line
	2650 1950 2800 1950
Wire Wire Line
	2650 2050 2800 2050
Wire Wire Line
	2650 2150 2800 2150
Wire Wire Line
	2650 2250 2800 2250
Wire Wire Line
	2650 2450 2800 2450
Wire Wire Line
	2650 2950 2800 2950
Text GLabel 2800 2350 2    50   Output ~ 0
CS_IDE
Wire Wire Line
	2650 2350 2800 2350
Wire Wire Line
	1450 5250 1650 5250
Wire Wire Line
	1650 5350 1050 5350
Entry Wire Line
	1050 5350 950  5250
Text Label 1550 5350 2    50   ~ 0
A0
Wire Wire Line
	1650 5450 1050 5450
Entry Wire Line
	1050 5450 950  5350
Text Label 1550 5450 2    50   ~ 0
A1
Text GLabel 1450 5550 0    50   Input ~ 0
!M1
Text GLabel 1450 5650 0    50   Input ~ 0
!IOREQ
Text GLabel 1450 5750 0    50   Input ~ 0
!RD
Wire Wire Line
	1450 5550 1650 5550
Wire Wire Line
	1650 5650 1450 5650
Wire Wire Line
	1450 5750 1650 5750
Text GLabel 1450 6100 0    50   Output ~ 0
!INT
Wire Wire Line
	1650 6100 1450 6100
Text GLabel 3000 5500 2    50   Input ~ 0
RESET
Text GLabel 3000 5700 2    50   Input ~ 0
CLK_CPU
Text GLabel 3000 4400 2    50   Input ~ 0
CLK_CTC
Text GLabel 3000 4700 2    50   Input ~ 0
CLK_CTC
Wire Wire Line
	3000 4400 2850 4400
Wire Wire Line
	2850 4700 3000 4700
Wire Wire Line
	3000 5500 2850 5500
Wire Wire Line
	2850 5700 3000 5700
Wire Wire Line
	4650 1350 4050 1350
Entry Wire Line
	4050 1350 3950 1250
Text Label 4550 1350 2    50   ~ 0
D0
Wire Wire Line
	4650 1450 4050 1450
Entry Wire Line
	4050 1450 3950 1350
Text Label 4550 1450 2    50   ~ 0
D1
Wire Wire Line
	4650 1550 4050 1550
Entry Wire Line
	4050 1550 3950 1450
Text Label 4550 1550 2    50   ~ 0
D2
Wire Wire Line
	4650 1650 4050 1650
Entry Wire Line
	4050 1650 3950 1550
Text Label 4550 1650 2    50   ~ 0
D3
Wire Wire Line
	4650 1750 4050 1750
Entry Wire Line
	4050 1750 3950 1650
Text Label 4550 1750 2    50   ~ 0
D4
Wire Wire Line
	4650 1850 4050 1850
Entry Wire Line
	4050 1850 3950 1750
Text Label 4550 1850 2    50   ~ 0
D5
Wire Wire Line
	4650 1950 4050 1950
Entry Wire Line
	4050 1950 3950 1850
Text Label 4550 1950 2    50   ~ 0
D6
Wire Wire Line
	4650 2050 4050 2050
Entry Wire Line
	4050 2050 3950 1950
Text Label 4550 2050 2    50   ~ 0
D7
Wire Wire Line
	4650 3400 4050 3400
Entry Wire Line
	4050 3400 3950 3300
Text Label 4550 3400 2    50   ~ 0
A0
Wire Wire Line
	4650 3300 4050 3300
Entry Wire Line
	4050 3300 3950 3200
Text Label 4550 3300 2    50   ~ 0
A1
Text GLabel 4450 2400 0    50   Input ~ 0
!M1
Text GLabel 4450 2500 0    50   Input ~ 0
!IOREQ
Text GLabel 4450 2600 0    50   Input ~ 0
!RD
Wire Wire Line
	4450 2400 4650 2400
Wire Wire Line
	4650 2500 4450 2500
Wire Wire Line
	4450 2600 4650 2600
Text GLabel 4450 2300 0    50   Input ~ 0
RESET
Wire Wire Line
	4450 2300 4650 2300
Text GLabel 4450 2800 0    50   Input ~ 0
CLK_CPU
Wire Wire Line
	4650 2800 4450 2800
Text GLabel 4450 2950 0    50   Output ~ 0
!INT
Wire Wire Line
	4650 2950 4450 2950
Wire Wire Line
	3500 1550 3500 2200
Wire Wire Line
	3500 2200 4650 2200
Wire Wire Line
	2650 1550 3500 1550
Text Label 3400 1550 2    50   ~ 0
CS_SIO
Wire Wire Line
	5650 1650 5850 1650
Wire Wire Line
	5850 1650 5850 1450
Wire Wire Line
	5850 1450 5650 1450
Wire Wire Line
	5850 1650 5850 4500
Wire Wire Line
	5850 4500 2850 4500
Connection ~ 5850 1650
Wire Wire Line
	5650 2550 5950 2550
Wire Wire Line
	5950 4800 2850 4800
Wire Wire Line
	5950 2550 5950 4800
NoConn ~ 2850 5000
Wire Wire Line
	2850 5300 2950 5300
Wire Wire Line
	2950 5300 2950 5100
Wire Wire Line
	2950 5100 2850 5100
$Comp
L Interface_UART:MAX232 U?
U 1 1 622C0080
P 8050 2050
F 0 "U?" H 8050 3431 50  0000 C CNN
F 1 "MAX232" H 8050 3340 50  0000 C CNN
F 2 "" H 8100 1000 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/max232.pdf" H 8050 2150 50  0001 C CNN
	1    8050 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 1550 6650 1550
Wire Wire Line
	6650 1550 6650 2150
Wire Wire Line
	6650 2150 7250 2150
Wire Wire Line
	5650 1350 6550 1350
Wire Wire Line
	6550 1350 6550 2550
Wire Wire Line
	6550 2550 7250 2550
Wire Wire Line
	5650 2000 6350 2000
Wire Wire Line
	6350 2000 6350 2350
Wire Wire Line
	6350 2350 7250 2350
Wire Wire Line
	5650 2100 6450 2100
Wire Wire Line
	6450 2100 6450 2750
Wire Wire Line
	6450 2750 7250 2750
$Comp
L Device:CP C?
U 1 1 622E2F2B
P 6950 1300
F 0 "C?" H 7068 1346 50  0000 L CNN
F 1 "1uF" H 7068 1255 50  0000 L CNN
F 2 "" H 6988 1150 50  0001 C CNN
F 3 "~" H 6950 1300 50  0001 C CNN
	1    6950 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 622E35B8
P 9050 1300
F 0 "C?" H 9168 1346 50  0000 L CNN
F 1 "1uF" H 9168 1255 50  0000 L CNN
F 2 "" H 9088 1150 50  0001 C CNN
F 3 "~" H 9050 1300 50  0001 C CNN
	1    9050 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 1150 7250 1150
Wire Wire Line
	6950 1450 7250 1450
Wire Wire Line
	8850 1450 9050 1450
Wire Wire Line
	8850 1150 9050 1150
$Comp
L Device:CP C?
U 1 1 622F1E03
P 9600 1300
F 0 "C?" H 9482 1254 50  0000 R CNN
F 1 "1uF" H 9482 1345 50  0000 R CNN
F 2 "" H 9638 1150 50  0001 C CNN
F 3 "~" H 9600 1300 50  0001 C CNN
	1    9600 1300
	1    0    0    1   
$EndComp
Wire Wire Line
	9600 1650 9600 1450
Wire Wire Line
	8850 1650 9600 1650
$Comp
L power:+5VA #PWR?
U 1 1 622F97F6
P 9600 1000
F 0 "#PWR?" H 9600 850 50  0001 C CNN
F 1 "+5VA" H 9615 1173 50  0000 C CNN
F 2 "" H 9600 1000 50  0001 C CNN
F 3 "" H 9600 1000 50  0001 C CNN
	1    9600 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 1150 9600 1000
$Comp
L Device:CP C?
U 1 1 622FD326
P 9350 1950
F 0 "C?" V 9605 1950 50  0000 C CNN
F 1 "1uF" V 9514 1950 50  0000 C CNN
F 2 "" H 9388 1800 50  0001 C CNN
F 3 "~" H 9350 1950 50  0001 C CNN
	1    9350 1950
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 622FE2B1
P 9650 1950
F 0 "#PWR?" H 9650 1700 50  0001 C CNN
F 1 "GND" H 9655 1777 50  0000 C CNN
F 2 "" H 9650 1950 50  0001 C CNN
F 3 "" H 9650 1950 50  0001 C CNN
	1    9650 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 1950 9200 1950
Wire Wire Line
	9500 1950 9650 1950
$Comp
L Connector:DB9_Male J?
U 1 1 6230C1AF
P 10150 2700
F 0 "J?" H 10330 2746 50  0000 L CNN
F 1 "DB9_Male" H 10330 2655 50  0000 L CNN
F 2 "" H 10150 2700 50  0001 C CNN
F 3 " ~" H 10150 2700 50  0001 C CNN
	1    10150 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 2300 9800 2300
Wire Wire Line
	9800 2300 9800 1950
Wire Wire Line
	9800 1950 9650 1950
Connection ~ 9650 1950
Wire Wire Line
	9850 2500 9700 2500
Wire Wire Line
	9700 2500 9700 3000
Wire Wire Line
	9700 3000 9850 3000
Wire Wire Line
	9850 2900 9300 2900
Wire Wire Line
	9300 2900 9300 2550
Wire Wire Line
	9300 2550 8850 2550
Wire Wire Line
	9850 2800 9400 2800
Wire Wire Line
	9400 2800 9400 2350
Wire Wire Line
	9400 2350 8850 2350
Wire Wire Line
	9850 2700 9500 2700
Wire Wire Line
	9500 2700 9500 2150
Wire Wire Line
	9500 2150 8850 2150
Wire Wire Line
	9850 2600 9200 2600
Wire Wire Line
	9200 2600 9200 2750
Wire Wire Line
	9200 2750 8850 2750
$Comp
L Interface_UART:MAX232 U?
U 1 1 6233AEF2
P 8050 4850
F 0 "U?" H 8050 6231 50  0000 C CNN
F 1 "MAX232" H 8050 6140 50  0000 C CNN
F 2 "" H 8100 3800 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/max232.pdf" H 8050 4950 50  0001 C CNN
	1    8050 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 4950 7250 4950
Wire Wire Line
	6250 5350 7250 5350
Wire Wire Line
	6150 5150 7250 5150
Wire Wire Line
	6050 5550 7250 5550
$Comp
L Device:CP C?
U 1 1 6233AEFC
P 6950 4100
F 0 "C?" H 7068 4146 50  0000 L CNN
F 1 "1uF" H 7068 4055 50  0000 L CNN
F 2 "" H 6988 3950 50  0001 C CNN
F 3 "~" H 6950 4100 50  0001 C CNN
	1    6950 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 6233AF02
P 9050 4100
F 0 "C?" H 9168 4146 50  0000 L CNN
F 1 "1uF" H 9168 4055 50  0000 L CNN
F 2 "" H 9088 3950 50  0001 C CNN
F 3 "~" H 9050 4100 50  0001 C CNN
	1    9050 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 3950 7250 3950
Wire Wire Line
	6950 4250 7250 4250
Wire Wire Line
	8850 4250 9050 4250
Wire Wire Line
	8850 3950 9050 3950
$Comp
L Device:CP C?
U 1 1 6233AF0C
P 9600 4100
F 0 "C?" H 9482 4054 50  0000 R CNN
F 1 "1uF" H 9482 4145 50  0000 R CNN
F 2 "" H 9638 3950 50  0001 C CNN
F 3 "~" H 9600 4100 50  0001 C CNN
	1    9600 4100
	1    0    0    1   
$EndComp
Wire Wire Line
	9600 4450 9600 4250
Wire Wire Line
	8850 4450 9600 4450
$Comp
L power:+5VA #PWR?
U 1 1 6233AF14
P 9600 3800
F 0 "#PWR?" H 9600 3650 50  0001 C CNN
F 1 "+5VA" H 9615 3973 50  0000 C CNN
F 2 "" H 9600 3800 50  0001 C CNN
F 3 "" H 9600 3800 50  0001 C CNN
	1    9600 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 3950 9600 3800
$Comp
L Device:CP C?
U 1 1 6233AF1B
P 9350 4750
F 0 "C?" V 9605 4750 50  0000 C CNN
F 1 "1uF" V 9514 4750 50  0000 C CNN
F 2 "" H 9388 4600 50  0001 C CNN
F 3 "~" H 9350 4750 50  0001 C CNN
	1    9350 4750
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6233AF21
P 9650 4750
F 0 "#PWR?" H 9650 4500 50  0001 C CNN
F 1 "GND" H 9655 4577 50  0000 C CNN
F 2 "" H 9650 4750 50  0001 C CNN
F 3 "" H 9650 4750 50  0001 C CNN
	1    9650 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 4750 9200 4750
Wire Wire Line
	9500 4750 9650 4750
$Comp
L Connector:DB9_Male J?
U 1 1 6233AF29
P 10150 5500
F 0 "J?" H 10330 5546 50  0000 L CNN
F 1 "DB9_Male" H 10330 5455 50  0000 L CNN
F 2 "" H 10150 5500 50  0001 C CNN
F 3 " ~" H 10150 5500 50  0001 C CNN
	1    10150 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 5100 9800 5100
Wire Wire Line
	9800 5100 9800 4750
Wire Wire Line
	9800 4750 9650 4750
Connection ~ 9650 4750
Wire Wire Line
	9850 5300 9700 5300
Wire Wire Line
	9700 5300 9700 5800
Wire Wire Line
	9700 5800 9850 5800
Wire Wire Line
	9850 5700 9300 5700
Wire Wire Line
	9300 5700 9300 5350
Wire Wire Line
	9300 5350 8850 5350
Wire Wire Line
	9850 5600 9400 5600
Wire Wire Line
	9400 5600 9400 5150
Wire Wire Line
	9400 5150 8850 5150
Wire Wire Line
	9850 5500 9500 5500
Wire Wire Line
	9500 5500 9500 4950
Wire Wire Line
	9500 4950 8850 4950
Wire Wire Line
	9850 5400 9200 5400
Wire Wire Line
	9200 5400 9200 5550
Wire Wire Line
	9200 5550 8850 5550
Wire Wire Line
	6350 2650 5650 2650
Wire Wire Line
	6250 2450 5650 2450
Wire Wire Line
	6150 5150 6150 3100
Wire Wire Line
	6150 3100 5650 3100
Wire Wire Line
	6050 5550 6050 3200
Wire Wire Line
	6050 3200 5650 3200
Wire Wire Line
	6250 2450 6250 5350
Wire Wire Line
	6350 2650 6350 4950
$Comp
L power:+5VA #PWR?
U 1 1 6242B7DF
P 1000 5850
F 0 "#PWR?" H 1000 5700 50  0001 C CNN
F 1 "+5VA" H 1015 6023 50  0000 C CNN
F 2 "" H 1000 5850 50  0001 C CNN
F 3 "" H 1000 5850 50  0001 C CNN
	1    1000 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 5900 1000 5900
Wire Wire Line
	1000 5900 1000 5850
Wire Wire Line
	1650 6000 1600 6000
Wire Wire Line
	1600 6000 1600 6550
Wire Wire Line
	1600 6550 3800 6550
Wire Wire Line
	3800 6550 3800 3050
Wire Wire Line
	3800 3050 4650 3050
Wire Bus Line
	3950 900  950  900 
Connection ~ 950  900 
Wire Bus Line
	950  900  650  900 
Text Label 7150 2150 2    50   ~ 0
A-TX
Text Label 7150 2350 2    50   ~ 0
A-RTS
Text Label 7150 2550 2    50   ~ 0
A-RX
Text Label 7150 2750 2    50   ~ 0
A-CTS
Text Label 7150 4950 2    50   ~ 0
B-TX
Text Label 7150 5150 2    50   ~ 0
B-RTS
Text Label 7150 5350 2    50   ~ 0
B-RX
Text Label 7150 5550 2    50   ~ 0
B-CTS
Text Notes 10550 2150 2    50   ~ 0
Serial Port A
Text Notes 10550 4950 2    50   ~ 0
Serial Port B
Text Label 6100 1550 2    50   ~ 0
A-TX
Text Label 6100 1350 2    50   ~ 0
A-RX
Text Label 6200 2100 2    50   ~ 0
A-CTS
Text Label 6200 2000 2    50   ~ 0
A-RTS
Text Label 6200 2650 2    50   ~ 0
B-TX
Text Label 6150 3100 2    50   ~ 0
B-RTS
Text Label 6200 2450 2    50   ~ 0
B-RX
Text Label 6050 3200 2    50   ~ 0
B-CTS
NoConn ~ 5650 1750
NoConn ~ 5650 1850
NoConn ~ 5650 2200
NoConn ~ 5650 2300
NoConn ~ 5650 2850
NoConn ~ 5650 3300
NoConn ~ 5650 3400
NoConn ~ 5650 2950
$Comp
L Zilog_Z80_Peripherals:SIO0-DIP-40 IC?
U 1 1 62272F5A
P 4850 1300
F 0 "IC?" H 5150 1681 50  0000 C CNN
F 1 "SIO0-DIP-40" H 5150 1590 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_LongPads" H 5250 3150 50  0001 L CNN
F 3 "" H 4050 150 50  0001 L CNN
F 4 "Z80 CMOS SIO/0 Z84C40 Zilog" H 5250 2950 50  0001 L CNN "Description"
F 5 "4.06" H 5250 2850 50  0001 L CNN "Height"
F 6 "Zilog" H 5250 2750 50  0001 L CNN "Manufacturer_Name"
F 7 "Z84C4206PEG" H 5250 2650 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "692-Z84C4206PEG" H 5250 2550 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=692-Z84C4206PEG" H 5250 2450 50  0001 L CNN "Mouser Price/Stock"
F 10 "6600766" H 5250 2350 50  0001 L CNN "RS Part Number"
F 11 "https://uk.rs-online.com/web/p/products/6600766" H 5250 2250 50  0001 L CNN "RS Price/Stock"
F 12 "R1000052" H 5250 2150 50  0001 L CNN "Allied_Number"
F 13 "https://www.alliedelec.com/zilog-z84c4206peg/R1000052/" H 5250 2050 50  0001 L CNN "Allied Price/Stock"
	1    4850 1300
	1    0    0    -1  
$EndComp
Wire Bus Line
	3950 900  3950 3300
Wire Bus Line
	950  900  950  5350
$EndSCHEMATC
