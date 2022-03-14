EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
Title "DDR PAD Driver"
Date "2022-02-20"
Rev "1.0"
Comp "Cool Inc."
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:USB_B J?
U 1 1 6212648C
P 1100 1400
F 0 "J?" H 1157 1867 50  0000 C CNN
F 1 "USB_B" H 1157 1776 50  0000 C CNN
F 2 "" H 1250 1350 50  0001 C CNN
F 3 " ~" H 1250 1350 50  0001 C CNN
	1    1100 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D?
U 1 1 6212750A
P 1750 1800
F 0 "D?" V 1704 1880 50  0000 L CNN
F 1 "3V6" V 1795 1880 50  0000 L CNN
F 2 "" H 1750 1800 50  0001 C CNN
F 3 "~" H 1750 1800 50  0001 C CNN
	1    1750 1800
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D?
U 1 1 62127D5B
P 2100 1800
F 0 "D?" V 2054 1880 50  0000 L CNN
F 1 "3V6" V 2145 1880 50  0000 L CNN
F 2 "" H 2100 1800 50  0001 C CNN
F 3 "~" H 2100 1800 50  0001 C CNN
	1    2100 1800
	0    1    1    0   
$EndComp
Text GLabel 2650 850  2    50   Output ~ 0
5V
$Comp
L Device:R R?
U 1 1 6212924B
P 1750 1150
F 0 "R?" H 1820 1196 50  0000 L CNN
F 1 "1K5" H 1820 1105 50  0000 L CNN
F 2 "" V 1680 1150 50  0001 C CNN
F 3 "~" H 1750 1150 50  0001 C CNN
	1    1750 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 62129D6F
P 2400 1400
F 0 "R?" V 2500 1400 50  0000 C CNN
F 1 "68" V 2400 1400 50  0000 C CNN
F 2 "" V 2330 1400 50  0001 C CNN
F 3 "~" H 2400 1400 50  0001 C CNN
	1    2400 1400
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 6212A83B
P 2400 1500
F 0 "R?" V 2300 1500 50  0000 C CNN
F 1 "68" V 2400 1500 50  0000 C CNN
F 2 "" V 2330 1500 50  0001 C CNN
F 3 "~" H 2400 1500 50  0001 C CNN
	1    2400 1500
	0    -1   -1   0   
$EndComp
Text Label 2650 1400 0    50   ~ 0
D+
Text Label 2650 1500 0    50   ~ 0
D-
Wire Wire Line
	1400 1200 1550 1200
Wire Wire Line
	1550 1200 1550 850 
Wire Wire Line
	1550 850  1750 850 
Wire Wire Line
	1750 1000 1750 850 
Connection ~ 1750 850 
Wire Wire Line
	1750 850  2650 850 
Wire Wire Line
	1400 1400 2100 1400
Wire Wire Line
	2550 1400 2650 1400
Wire Wire Line
	2650 1500 2550 1500
Wire Wire Line
	1750 1300 1750 1500
Connection ~ 1750 1500
Wire Wire Line
	1750 1500 1400 1500
Wire Wire Line
	1750 1650 1750 1500
Wire Wire Line
	2100 1950 2100 2100
Wire Wire Line
	1750 1950 1750 2100
Wire Wire Line
	1000 1800 1000 1900
Wire Wire Line
	1000 1900 1100 1900
Connection ~ 1100 1900
Wire Wire Line
	1100 1900 1100 1800
$Comp
L Device:C C?
U 1 1 6212C7CB
P 4800 3450
F 0 "C?" H 4915 3496 50  0000 L CNN
F 1 "0.1uF" H 4915 3405 50  0000 L CNN
F 2 "" H 4838 3300 50  0001 C CNN
F 3 "~" H 4800 3450 50  0001 C CNN
	1    4800 3450
	1    0    0    -1  
$EndComp
Text GLabel 4350 3000 0    50   Input ~ 0
VCC
Wire Wire Line
	4350 3000 4800 3000
Wire Wire Line
	4800 3000 4800 3300
Wire Wire Line
	4800 3950 4800 3600
Text Notes 4500 4350 0    50   ~ 0
Découpage
Wire Wire Line
	1750 1500 2250 1500
Wire Wire Line
	2100 1650 2100 1400
Connection ~ 2100 1400
Wire Wire Line
	2100 1400 2250 1400
$Comp
L Connector:AVR-ISP-6 J?
U 1 1 6212EBCB
P 1450 6950
F 0 "J?" H 1121 7046 50  0000 R CNN
F 1 "AVR-ISP-6" H 1121 6955 50  0000 R CNN
F 2 "" V 1200 7000 50  0001 C CNN
F 3 " ~" H 175 6400 50  0001 C CNN
	1    1450 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 6300 1350 6300
Wire Wire Line
	1350 6300 1350 6450
Wire Wire Line
	1350 7350 1350 7450
Text Label 2300 7050 0    50   ~ 0
~RESET~
Text Label 2300 6950 0    50   ~ 0
SCK
Text Label 2300 6850 0    50   ~ 0
MOSI
Text Label 2300 6750 0    50   ~ 0
MISO
Wire Wire Line
	1850 6750 2300 6750
Wire Wire Line
	2300 6850 1850 6850
Wire Wire Line
	1850 6950 2300 6950
Wire Wire Line
	2300 7050 1850 7050
Text Label 9300 1950 2    50   ~ 0
UP
Text Label 9300 2050 2    50   ~ 0
DOWN
Text Label 9300 2150 2    50   ~ 0
RIGHT
Text Label 9300 2250 2    50   ~ 0
LEFT
Text Label 9300 2450 2    50   ~ 0
L2
Text Label 9300 2350 2    50   ~ 0
R2
Text Label 9300 1650 2    50   ~ 0
S1-SELECT
Text Label 9300 1750 2    50   ~ 0
S2-START
Text Label 9300 1850 2    50   ~ 0
L1
Text Label 9300 2550 2    50   ~ 0
R1
Text Label 9300 2650 2    50   ~ 0
B1-CROSS
Text Label 9300 2750 2    50   ~ 0
B2-CIRCLE
Text Label 9300 2850 2    50   ~ 0
B3-SQUARE
Text Label 9300 2950 2    50   ~ 0
B4-TRIANGLE
$Sheet
S 9600 1350 900  2050
U 62226A50
F0 "Pads" 50
F1 "Pads.sch" 50
F2 "S1-SELECT" O L 9600 1650 50 
F3 "S2-START" O L 9600 1750 50 
F4 "L1" O L 9600 1850 50 
F5 "UP" O L 9600 1950 50 
F6 "DOWN" O L 9600 2050 50 
F7 "RIGHT" O L 9600 2150 50 
F8 "LEFT" O L 9600 2250 50 
F9 "R2" O L 9600 2350 50 
F10 "L2" O L 9600 2450 50 
F11 "R1" O L 9600 2550 50 
F12 "B1-CROSS" O L 9600 2650 50 
F13 "B2-CIRCLE" O L 9600 2750 50 
F14 "B3-SQUARE" O L 9600 2850 50 
F15 "B4-TRIANGLE" O L 9600 2950 50 
F16 "L3" O L 9600 3050 50 
F17 "R3" O L 9600 3150 50 
$EndSheet
Text GLabel 1100 2100 3    50   Input ~ 0
GND
Wire Wire Line
	1100 2100 1100 1900
Text GLabel 4450 5750 2    50   Output ~ 0
GND12V
Text GLabel 4450 5650 2    50   Output ~ 0
12V
Wire Wire Line
	9300 1650 9600 1650
Wire Wire Line
	9600 1750 9300 1750
Wire Wire Line
	9300 1850 9600 1850
Wire Wire Line
	9600 1950 9300 1950
Wire Wire Line
	9300 2050 9600 2050
Wire Wire Line
	9600 2150 9300 2150
Wire Wire Line
	9300 2250 9600 2250
Wire Wire Line
	9600 2350 9300 2350
Wire Wire Line
	9300 2450 9600 2450
Wire Wire Line
	9600 2550 9300 2550
Wire Wire Line
	9300 2650 9600 2650
Wire Wire Line
	9600 2750 9300 2750
Wire Wire Line
	9300 2850 9600 2850
Wire Wire Line
	9600 2950 9300 2950
$Comp
L MCU_Microchip_ATmega:ATmega164P-20PU U?
U 1 1 63074699
P 6350 3250
F 0 "U?" H 6350 1161 50  0000 C CNN
F 1 "ATmega164P-20PU" H 6350 1070 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm" H 6350 3250 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-42742-ATmega164P_Datasheet.pdf" H 6350 3250 50  0001 C CNN
	1    6350 3250
	1    0    0    -1  
$EndComp
Text Label 7250 2850 0    50   ~ 0
~PS2_SS~
Wire Wire Line
	6950 2850 7250 2850
$Comp
L Device:L L?
U 1 1 630BEAB0
P 5200 2150
F 0 "L?" V 5100 2150 50  0000 C CNN
F 1 "10mH" V 5299 2150 50  0000 C CNN
F 2 "" H 5200 2150 50  0001 C CNN
F 3 "~" H 5200 2150 50  0001 C CNN
	1    5200 2150
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 630BEABA
P 5500 2550
F 0 "C?" H 5615 2596 50  0000 L CNN
F 1 "0.1uF" H 5615 2505 50  0000 L CNN
F 2 "" H 5538 2400 50  0001 C CNN
F 3 "~" H 5500 2550 50  0001 C CNN
	1    5500 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2150 5500 2150
Wire Wire Line
	5500 2150 5500 2400
Wire Wire Line
	5500 2700 5500 2950
Text GLabel 4850 850  0    50   Input ~ 0
VCC
Text GLabel 4850 2150 0    50   Input ~ 0
VCC
Wire Wire Line
	4850 850  5600 850 
Wire Wire Line
	6450 850  6450 1250
Wire Wire Line
	6350 1250 6350 850 
Connection ~ 6350 850 
Wire Wire Line
	6350 850  6450 850 
Wire Wire Line
	4850 2150 5050 2150
Wire Wire Line
	5350 2150 5500 2150
Connection ~ 5500 2150
$Comp
L Device:R R?
U 1 1 630E7C5D
P 5600 1200
F 0 "R?" H 5670 1246 50  0000 L CNN
F 1 "10K" H 5670 1155 50  0000 L CNN
F 2 "" V 5530 1200 50  0001 C CNN
F 3 "~" H 5600 1200 50  0001 C CNN
	1    5600 1200
	1    0    0    -1  
$EndComp
Text Label 5400 1550 2    50   ~ 0
~RESET~
Wire Wire Line
	5600 1050 5600 850 
Connection ~ 5600 850 
Wire Wire Line
	5600 850  6350 850 
Wire Wire Line
	5600 1350 5600 1550
Wire Wire Line
	5600 1550 5750 1550
Wire Wire Line
	5400 1550 5600 1550
Connection ~ 5600 1550
$Comp
L Device:Crystal Y?
U 1 1 630F786B
P 4450 1750
F 0 "Y?" V 4450 1550 50  0000 C CNN
F 1 "12MHz" V 4450 2000 50  0000 C CNN
F 2 "" H 4450 1750 50  0001 C CNN
F 3 "~" H 4450 1750 50  0001 C CNN
	1    4450 1750
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 1600 4450 1550
Wire Wire Line
	4450 1550 4900 1550
Wire Wire Line
	4900 1550 4900 1750
Wire Wire Line
	4900 1750 5750 1750
Wire Wire Line
	4450 1950 4450 1900
$Comp
L Device:C C?
U 1 1 63115F7B
P 4150 1550
F 0 "C?" V 4400 1500 50  0000 L CNN
F 1 "10pF" V 4300 1450 50  0000 L CNN
F 2 "" H 4188 1400 50  0001 C CNN
F 3 "~" H 4150 1550 50  0001 C CNN
	1    4150 1550
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 631220AF
P 4150 1950
F 0 "C?" V 3900 1900 50  0000 L CNN
F 1 "10pF" V 4000 1850 50  0000 L CNN
F 2 "" H 4188 1800 50  0001 C CNN
F 3 "~" H 4150 1950 50  0001 C CNN
	1    4150 1950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4300 1550 4450 1550
Connection ~ 4450 1550
Wire Wire Line
	4300 1950 4450 1950
Connection ~ 4450 1950
Wire Wire Line
	4000 1550 3850 1550
Wire Wire Line
	3850 1550 3850 1950
Wire Wire Line
	4000 1950 3850 1950
Connection ~ 3850 1950
Wire Wire Line
	3850 1950 3850 2100
Text GLabel 3850 2100 3    50   Output ~ 0
GND
Text GLabel 6350 5600 3    50   Output ~ 0
GND
Wire Wire Line
	6350 5250 6350 5600
Text Label 7250 2950 0    50   ~ 0
MOSI
Text Label 7250 3050 0    50   ~ 0
MISO
Text Label 7250 3150 0    50   ~ 0
SCK
Wire Wire Line
	4450 1950 5750 1950
Text Label 7250 2750 0    50   ~ 0
PS2_ACK
Wire Wire Line
	7250 2750 6950 2750
$Comp
L Device:R R?
U 1 1 631DBA0D
P 7950 2250
F 0 "R?" V 7850 2200 50  0000 L CNN
F 1 "10K" V 7950 2200 50  0000 L CNN
F 2 "" V 7880 2250 50  0001 C CNN
F 3 "~" H 7950 2250 50  0001 C CNN
	1    7950 2250
	-1   0    0    1   
$EndComp
Wire Wire Line
	6950 1650 7250 1650
Wire Wire Line
	6950 1750 7250 1750
Wire Wire Line
	6950 1850 7250 1850
Wire Wire Line
	6950 1950 7250 1950
Wire Wire Line
	6950 2050 7250 2050
Wire Wire Line
	6950 1550 7250 1550
Text Label 7250 1950 0    50   ~ 0
UP
Text Label 7250 2150 0    50   ~ 0
DOWN
Text Label 7250 2050 0    50   ~ 0
RIGHT
Text Label 7250 2250 0    50   ~ 0
LEFT
Text Label 7250 3350 0    50   ~ 0
L2
Text Label 7250 3450 0    50   ~ 0
R2
Text Label 7250 3550 0    50   ~ 0
L1
Text Label 7250 3650 0    50   ~ 0
R1
Wire Wire Line
	7250 2150 6950 2150
Wire Wire Line
	7250 2250 6950 2250
Text Label 7250 1550 0    50   ~ 0
S1-SELECT
Text Label 7250 1850 0    50   ~ 0
S2-START
Text Label 7250 3950 0    50   ~ 0
B1-CROSS
Text Label 7250 3850 0    50   ~ 0
B2-CIRCLE
Text Label 7250 4050 0    50   ~ 0
B3-SQUARE
Text Label 7250 3750 0    50   ~ 0
B4-TRIANGLE
Wire Wire Line
	6950 4450 7250 4450
Wire Wire Line
	7250 4550 6950 4550
Wire Wire Line
	7250 4950 6950 4950
Wire Wire Line
	6950 3350 7250 3350
Wire Wire Line
	7250 3450 6950 3450
Wire Wire Line
	6950 3550 7250 3550
Wire Wire Line
	7250 3650 6950 3650
Wire Wire Line
	6950 3750 7250 3750
Wire Wire Line
	7250 3850 6950 3850
Wire Wire Line
	6950 3950 7250 3950
Wire Wire Line
	7250 4050 6950 4050
Text GLabel 1100 6300 0    50   Input ~ 0
VCC
Text Label 7250 2450 0    50   ~ 0
D-
Text Label 7250 2550 0    50   ~ 0
D+
Wire Wire Line
	6950 2450 7250 2450
Wire Wire Line
	7250 2550 6950 2550
Text Label 7250 4250 0    50   ~ 0
RX
Text Label 7250 4350 0    50   ~ 0
TX
Wire Wire Line
	6950 4250 7250 4250
Wire Wire Line
	7250 4350 6950 4350
Text GLabel 1350 7450 3    50   Output ~ 0
GND
Text GLabel 4800 3950 3    50   Output ~ 0
GND
Text GLabel 5500 2950 3    50   Output ~ 0
GND
Text GLabel 1050 5150 0    50   Input ~ 0
5V
Text GLabel 1050 4700 0    50   Input ~ 0
3V3
Text GLabel 2700 5150 2    50   Output ~ 0
VCC
$Comp
L Transistor_FET:DMG2301L Q?
U 1 1 6219A018
P 1400 4800
F 0 "Q?" V 1742 4800 50  0000 C CNN
F 1 "DMG2305UX" V 1651 4800 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 1600 4725 50  0001 L CIN
F 3 "" H 1400 4800 50  0001 L CNN
	1    1400 4800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1050 5150 1400 5150
Connection ~ 1400 5150
Wire Wire Line
	2700 5150 2300 5150
Wire Wire Line
	1050 4700 1200 4700
Wire Wire Line
	1600 4700 2000 4700
Wire Wire Line
	2000 4700 2000 5150
Wire Wire Line
	1400 5000 1400 5150
$Comp
L Device:D_Schottky D?
U 1 1 621ED30C
P 1700 5150
F 0 "D?" H 1700 4950 50  0000 C CNN
F 1 "SS12" H 1700 5050 50  0000 C CNN
F 2 "" H 1700 5150 50  0001 C CNN
F 3 "~" H 1700 5150 50  0001 C CNN
F 4 "20V 1A" H 1700 5250 50  0000 C CNN "Autre"
F 5 "550mV" H 1700 5350 50  0000 C CNN "ForwardVotage"
	1    1700 5150
	-1   0    0    1   
$EndComp
Wire Wire Line
	1850 5150 2000 5150
Connection ~ 2000 5150
Wire Wire Line
	1400 5150 1550 5150
Text Notes 2500 5050 0    50   ~ 0
4,45V ou 3,3V
Text GLabel 1750 2100 3    50   Input ~ 0
GND
Text GLabel 2100 2100 3    50   Input ~ 0
GND
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 6232BDAA
P 3900 5650
F 0 "J?" H 4008 5831 50  0000 C CNN
F 1 "Alim 12V" H 4008 5740 50  0000 C CNN
F 2 "" H 3900 5650 50  0001 C CNN
F 3 "~" H 3900 5650 50  0001 C CNN
	1    3900 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 5650 4450 5650
Wire Wire Line
	4450 5750 4100 5750
$Comp
L Device:C C?
U 1 1 62366AE4
P 2300 5450
F 0 "C?" H 2415 5496 50  0000 L CNN
F 1 "47uF" H 2415 5405 50  0000 L CNN
F 2 "" H 2338 5300 50  0001 C CNN
F 3 "~" H 2300 5450 50  0001 C CNN
	1    2300 5450
	1    0    0    -1  
$EndComp
Text GLabel 2300 5750 3    50   Input ~ 0
GND
Wire Wire Line
	2300 5300 2300 5150
Connection ~ 2300 5150
Wire Wire Line
	2300 5150 2000 5150
Wire Wire Line
	2300 5600 2300 5750
Text Label 3350 6750 2    50   ~ 0
SCK
Text Label 4050 6750 0    50   ~ 0
PS2_SCK
Wire Wire Line
	3350 6750 4050 6750
Wire Wire Line
	6950 3150 7250 3150
Text Label 3350 6850 2    50   ~ 0
MOSI
$Comp
L Device:R R?
U 1 1 6241F077
P 3700 6850
F 0 "R?" V 3650 7000 50  0000 L CNN
F 1 "10K" V 3700 6800 50  0000 L CNN
F 2 "" V 3630 6850 50  0001 C CNN
F 3 "~" H 3700 6850 50  0001 C CNN
	1    3700 6850
	0    1    1    0   
$EndComp
Text Label 4050 6850 0    50   ~ 0
PS2_MOSI
Wire Wire Line
	3350 6850 3550 6850
Wire Wire Line
	3850 6850 4050 6850
Wire Wire Line
	7250 2950 6950 2950
Text Label 3350 6950 2    50   ~ 0
MISO
$Comp
L Device:R R?
U 1 1 6248FF83
P 3700 6950
F 0 "R?" V 3650 7100 50  0000 L CNN
F 1 "10K" V 3700 6900 50  0000 L CNN
F 2 "" V 3630 6950 50  0001 C CNN
F 3 "~" H 3700 6950 50  0001 C CNN
	1    3700 6950
	0    1    1    0   
$EndComp
Text Label 4050 6950 0    50   ~ 0
PS2_MISO
Wire Wire Line
	3350 6950 3550 6950
Wire Wire Line
	3850 6950 4050 6950
Wire Wire Line
	6950 3050 7250 3050
$Comp
L Device:C C?
U 1 1 6255BA89
P 7950 2950
F 0 "C?" H 8065 2996 50  0000 L CNN
F 1 "0.1uF" H 8065 2905 50  0000 L CNN
F 2 "" H 7988 2800 50  0001 C CNN
F 3 "~" H 7950 2950 50  0001 C CNN
	1    7950 2950
	1    0    0    -1  
$EndComp
Text GLabel 7950 3250 3    50   Output ~ 0
GND
Text GLabel 7950 1850 1    50   Input ~ 0
3V3
Wire Wire Line
	6950 2650 7950 2650
Wire Wire Line
	7950 2650 7950 2400
Wire Wire Line
	7950 2800 7950 2650
Connection ~ 7950 2650
Wire Wire Line
	7950 3100 7950 3250
Wire Wire Line
	7950 2100 7950 1850
$Sheet
S 9600 4650 900  800 
U 62582603
F0 "LEDs" 50
F1 "LEDs.sch" 50
F2 "SHIFT_SER" I L 9600 4900 50 
F3 "SHIFT_CLK" I L 9600 5000 50 
F4 "~SHIFT_CLR~" I L 9600 5100 50 
F5 "SHIFT_RCK" I L 9600 5200 50 
$EndSheet
$Sheet
S 950  3000 900  750 
U 625A5B0F
F0 "PS2 Connector" 50
F1 "PS2Connector.sch" 50
F2 "PS2_MISO" I R 1850 3150 50 
F3 "PS2_MOSI" O R 1850 3250 50 
F4 "~PS2_SS~" O R 1850 3350 50 
F5 "PS2_SCK" O R 1850 3450 50 
F6 "PS2_ACK" I R 1850 3550 50 
$EndSheet
Text Label 2200 3150 0    50   ~ 0
PS2_MISO
Text Label 2200 3250 0    50   ~ 0
PS2_MOSI
Text Label 2200 3350 0    50   ~ 0
~PS2_SS~
Text Label 2200 3450 0    50   ~ 0
PS2_SCK
Text Label 2200 3550 0    50   ~ 0
PS2_ACK
Wire Wire Line
	1850 3150 2200 3150
Wire Wire Line
	2200 3250 1850 3250
Wire Wire Line
	1850 3350 2200 3350
Wire Wire Line
	2200 3450 1850 3450
Wire Wire Line
	1850 3550 2200 3550
$Comp
L Connector:Conn_01x03_Male J?
U 1 1 625DEA5A
P 5250 6850
F 0 "J?" H 5358 7131 50  0000 C CNN
F 1 "Conn_01x03_Male" H 5358 7040 50  0000 C CNN
F 2 "" H 5250 6850 50  0001 C CNN
F 3 "~" H 5250 6850 50  0001 C CNN
	1    5250 6850
	1    0    0    -1  
$EndComp
Text Label 6000 6750 0    50   ~ 0
RX
Text Label 6000 6850 0    50   ~ 0
TX
Text GLabel 5750 7150 3    50   Output ~ 0
GND
Wire Wire Line
	5450 6750 6000 6750
Wire Wire Line
	6000 6850 5450 6850
Wire Wire Line
	5450 6950 5750 6950
Wire Wire Line
	5750 6950 5750 7150
Text Notes 5150 7250 0    50   ~ 0
Debug
Text Label 7250 1650 0    50   ~ 0
L3
Text Label 7250 1750 0    50   ~ 0
R3
Text Label 9300 3050 2    50   ~ 0
L3
Text Label 9300 3150 2    50   ~ 0
R3
Wire Wire Line
	9300 3050 9600 3050
Wire Wire Line
	9600 3150 9300 3150
Text Label 9250 4900 2    50   ~ 0
SHIFT_SER
Text Label 9250 5000 2    50   ~ 0
SHIFT_CLK
Text Label 9250 5200 2    50   ~ 0
SHIFT_RCK
Text Label 7250 4450 0    50   ~ 0
SHIFT_SER
Text Label 7250 4550 0    50   ~ 0
SHIFT_CLK
Text Label 7250 4650 0    50   ~ 0
SHIFT_RCK
Wire Wire Line
	9250 4900 9600 4900
Wire Wire Line
	9600 5000 9250 5000
Wire Wire Line
	9250 5100 9600 5100
Wire Wire Line
	9600 5200 9250 5200
Text Notes 750  4850 0    50   ~ 0
750mA max
Text Notes 800  5300 0    50   ~ 0
500mA max
$Comp
L Device:LED D?
U 1 1 623665E0
P 7250 5200
F 0 "D?" V 7289 5082 50  0000 R CNN
F 1 "LED" V 7198 5082 50  0000 R CNN
F 2 "" H 7250 5200 50  0001 C CNN
F 3 "~" H 7250 5200 50  0001 C CNN
	1    7250 5200
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 6236819D
P 7250 5650
F 0 "R?" H 7320 5696 50  0000 L CNN
F 1 "470" H 7320 5605 50  0000 L CNN
F 2 "" V 7180 5650 50  0001 C CNN
F 3 "~" H 7250 5650 50  0001 C CNN
	1    7250 5650
	1    0    0    -1  
$EndComp
Text GLabel 7250 5950 3    50   Output ~ 0
GND
Wire Wire Line
	7250 4950 7250 5050
Wire Wire Line
	7250 5350 7250 5500
Wire Wire Line
	7250 5800 7250 5950
NoConn ~ 7150 4850
Wire Wire Line
	7150 4850 6950 4850
Text Label 9250 5100 2    50   ~ 0
~RESET~
Wire Wire Line
	6950 4650 7250 4650
NoConn ~ 7150 4750
Wire Wire Line
	7150 4750 6950 4750
Text Notes 5800 750  0    50   ~ 0
Ordre PORTA et PORTC choisi\npour être conforme à l’attendu par la PS2
Text Notes 1050 4400 0    50   ~ 0
TODO : tester DMG2305
Text Notes 3150 7250 0    50   ~ 0
TODO : Les 10K c’est pas bon…\nIl faut les enlever je pense
Text Notes 7050 1250 0    50   ~ 0
TODO : (Pour SCK/MOSI/MISO dédiée à la PS2)\n- Déplacer D- et D+ sur PD6 et PD7\n- Déplacer PB2 sur PD5\n- Supprimer la led témoin
$EndSCHEMATC
