EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title "Pads"
Date "2022-02-20"
Rev "1.0"
Comp "Cool Inc."
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1050 3400 0    50   Output ~ 0
S1-SELECT
Text HLabel 6500 1700 0    50   Output ~ 0
S2-START
Text HLabel 4650 5000 0    50   Output ~ 0
L1
Text HLabel 2750 1700 0    50   Output ~ 0
UP
Text HLabel 2750 3400 0    50   Output ~ 0
DOWN
Text HLabel 2750 4950 0    50   Output ~ 0
RIGHT
Text HLabel 1050 1700 0    50   Output ~ 0
LEFT
Text HLabel 6500 3400 0    50   Output ~ 0
R2
Text HLabel 8350 5000 0    50   Output ~ 0
L2
Text HLabel 6500 5000 0    50   Output ~ 0
R1
Text HLabel 4700 1700 0    50   Output ~ 0
B1-CROSS
Text HLabel 4700 3400 0    50   Output ~ 0
B2-CIRCLE
Text HLabel 8350 1700 0    50   Output ~ 0
B3-SQUARE
Text HLabel 8350 3400 0    50   Output ~ 0
B4-TRIANGLE
$Comp
L Device:R R27
U 1 1 62404DA4
P 5150 4750
F 0 "R27" H 5220 4796 50  0000 L CNN
F 1 "680" H 5220 4705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5080 4750 50  0001 C CNN
F 3 "~" H 5150 4750 50  0001 C CNN
	1    5150 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R24
U 1 1 62404DAE
P 4900 5000
F 0 "R24" V 4693 5000 50  0000 C CNN
F 1 "470" V 4784 5000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4830 5000 50  0001 C CNN
F 3 "~" H 4900 5000 50  0001 C CNN
	1    4900 5000
	0    1    1    0   
$EndComp
Text GLabel 4750 4450 0    50   Input ~ 0
VCC
Wire Wire Line
	5150 5400 5150 5500
Wire Wire Line
	4750 4450 5150 4450
Wire Wire Line
	5150 4450 5150 4600
Wire Wire Line
	5050 5000 5150 5000
Wire Wire Line
	5150 5000 5150 4900
Wire Wire Line
	5150 5000 5150 5100
Connection ~ 5150 5000
Wire Wire Line
	5150 5000 5450 5000
$Comp
L Diode:BZX84Cxx D14
U 1 1 62404DE8
P 5150 5250
F 0 "D14" V 5104 5330 50  0000 L CNN
F 1 "BZX84C3V6" V 5250 4800 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 5150 5075 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 5150 5250 50  0001 C CNN
	1    5150 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 5000 4650 5000
$Comp
L Device:R R21
U 1 1 6265062F
P 3250 1450
F 0 "R21" H 3320 1496 50  0000 L CNN
F 1 "680" H 3320 1405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 3180 1450 50  0001 C CNN
F 3 "~" H 3250 1450 50  0001 C CNN
	1    3250 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 62650639
P 3000 1700
F 0 "R18" V 2793 1700 50  0000 C CNN
F 1 "470" V 2884 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2930 1700 50  0001 C CNN
F 3 "~" H 3000 1700 50  0001 C CNN
	1    3000 1700
	0    1    1    0   
$EndComp
Text GLabel 2850 1200 0    50   Input ~ 0
VCC
Wire Wire Line
	2850 1200 3250 1200
Wire Wire Line
	3250 1200 3250 1300
Wire Wire Line
	3150 1700 3250 1700
Wire Wire Line
	3250 1700 3250 1600
Connection ~ 3250 1700
Wire Wire Line
	3250 1700 3550 1700
Wire Wire Line
	2850 1700 2750 1700
$Comp
L Diode:BZX84Cxx D11
U 1 1 62AF12A8
P 3250 1950
F 0 "D11" V 3204 2030 50  0000 L CNN
F 1 "BZX84C3V6" V 3350 1500 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 3250 1775 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 3250 1950 50  0001 C CNN
	1    3250 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 1700 3250 1800
Wire Wire Line
	3250 2100 3250 2200
Text GLabel 2850 2200 0    50   Input ~ 0
GND
Wire Wire Line
	3250 2200 2850 2200
$Comp
L Device:R R22
U 1 1 62DB4678
P 3250 3150
F 0 "R22" H 3320 3196 50  0000 L CNN
F 1 "680" H 3320 3105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 3180 3150 50  0001 C CNN
F 3 "~" H 3250 3150 50  0001 C CNN
	1    3250 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 62DB4682
P 3000 3400
F 0 "R19" V 2793 3400 50  0000 C CNN
F 1 "470" V 2884 3400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2930 3400 50  0001 C CNN
F 3 "~" H 3000 3400 50  0001 C CNN
	1    3000 3400
	0    1    1    0   
$EndComp
Text GLabel 2850 2900 0    50   Input ~ 0
VCC
Wire Wire Line
	2850 2900 3250 2900
Wire Wire Line
	3250 2900 3250 3000
Wire Wire Line
	3150 3400 3250 3400
Wire Wire Line
	3250 3400 3250 3300
Connection ~ 3250 3400
Wire Wire Line
	3250 3400 3550 3400
Wire Wire Line
	2850 3400 2750 3400
$Comp
L Diode:BZX84Cxx D12
U 1 1 62DB46A1
P 3250 3650
F 0 "D12" V 3204 3730 50  0000 L CNN
F 1 "BZX84C3V6" V 3350 3200 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 3250 3475 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 3250 3650 50  0001 C CNN
	1    3250 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 3400 3250 3500
Wire Wire Line
	3250 3800 3250 3900
Text GLabel 2850 3900 0    50   Input ~ 0
GND
Wire Wire Line
	3250 3900 2850 3900
$Comp
L Device:R R23
U 1 1 62DBDA9C
P 3250 4700
F 0 "R23" H 3320 4746 50  0000 L CNN
F 1 "680" H 3320 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 3180 4700 50  0001 C CNN
F 3 "~" H 3250 4700 50  0001 C CNN
	1    3250 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R20
U 1 1 62DBDAA6
P 3000 4950
F 0 "R20" V 2793 4950 50  0000 C CNN
F 1 "470" V 2884 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2930 4950 50  0001 C CNN
F 3 "~" H 3000 4950 50  0001 C CNN
	1    3000 4950
	0    1    1    0   
$EndComp
Text GLabel 2850 4450 0    50   Input ~ 0
VCC
Wire Wire Line
	2850 4450 3250 4450
Wire Wire Line
	3250 4450 3250 4550
Wire Wire Line
	3150 4950 3250 4950
Wire Wire Line
	3250 4950 3250 4850
Connection ~ 3250 4950
Wire Wire Line
	3250 4950 3550 4950
Wire Wire Line
	2850 4950 2750 4950
$Comp
L Diode:BZX84Cxx D13
U 1 1 62DBDAC5
P 3250 5200
F 0 "D13" V 3204 5280 50  0000 L CNN
F 1 "BZX84C3V6" V 3350 4750 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 3250 5025 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 3250 5200 50  0001 C CNN
	1    3250 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 4950 3250 5050
Wire Wire Line
	3250 5350 3250 5450
Text GLabel 2850 5450 0    50   Input ~ 0
GND
Wire Wire Line
	3250 5450 2850 5450
$Comp
L Device:R R14
U 1 1 62DBDB1C
P 1550 1450
F 0 "R14" H 1620 1496 50  0000 L CNN
F 1 "680" H 1620 1405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1480 1450 50  0001 C CNN
F 3 "~" H 1550 1450 50  0001 C CNN
	1    1550 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 62DBDB26
P 1300 1700
F 0 "R10" V 1093 1700 50  0000 C CNN
F 1 "470" V 1184 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1230 1700 50  0001 C CNN
F 3 "~" H 1300 1700 50  0001 C CNN
	1    1300 1700
	0    1    1    0   
$EndComp
Text GLabel 1150 1200 0    50   Input ~ 0
VCC
Wire Wire Line
	1150 1200 1550 1200
Wire Wire Line
	1550 1200 1550 1300
Wire Wire Line
	1450 1700 1550 1700
Wire Wire Line
	1550 1700 1550 1600
Connection ~ 1550 1700
Wire Wire Line
	1550 1700 1850 1700
Wire Wire Line
	1150 1700 1050 1700
$Comp
L Diode:BZX84Cxx D7
U 1 1 62DBDB45
P 1550 1950
F 0 "D7" V 1504 2030 50  0000 L CNN
F 1 "BZX84C3V6" V 1650 1500 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 1550 1775 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 1550 1950 50  0001 C CNN
	1    1550 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	1550 1700 1550 1800
Wire Wire Line
	1550 2100 1550 2200
Text GLabel 1150 2200 0    50   Input ~ 0
GND
Wire Wire Line
	1550 2200 1150 2200
$Comp
L Device:R R28
U 1 1 62DD2A0E
P 5200 1450
F 0 "R28" H 5270 1496 50  0000 L CNN
F 1 "680" H 5270 1405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5130 1450 50  0001 C CNN
F 3 "~" H 5200 1450 50  0001 C CNN
	1    5200 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R25
U 1 1 62DD2A18
P 4950 1700
F 0 "R25" V 4743 1700 50  0000 C CNN
F 1 "470" V 4834 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4880 1700 50  0001 C CNN
F 3 "~" H 4950 1700 50  0001 C CNN
	1    4950 1700
	0    1    1    0   
$EndComp
Text GLabel 4800 1200 0    50   Input ~ 0
VCC
Wire Wire Line
	4800 1200 5200 1200
Wire Wire Line
	5200 1200 5200 1300
Wire Wire Line
	5100 1700 5200 1700
Wire Wire Line
	5200 1700 5200 1600
Connection ~ 5200 1700
Wire Wire Line
	5200 1700 5500 1700
Wire Wire Line
	4800 1700 4700 1700
$Comp
L Diode:BZX84Cxx D15
U 1 1 62DD2A37
P 5200 1950
F 0 "D15" V 5154 2030 50  0000 L CNN
F 1 "BZX84C3V6" V 5300 1500 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 5200 1775 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 5200 1950 50  0001 C CNN
	1    5200 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	5200 1700 5200 1800
Wire Wire Line
	5200 2100 5200 2200
Text GLabel 4800 2200 0    50   Input ~ 0
GND
Wire Wire Line
	5200 2200 4800 2200
$Comp
L Device:R R29
U 1 1 62DD2A8E
P 5200 3150
F 0 "R29" H 5270 3196 50  0000 L CNN
F 1 "680" H 5270 3105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5130 3150 50  0001 C CNN
F 3 "~" H 5200 3150 50  0001 C CNN
	1    5200 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R26
U 1 1 62DD2A98
P 4950 3400
F 0 "R26" V 4743 3400 50  0000 C CNN
F 1 "470" V 4834 3400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4880 3400 50  0001 C CNN
F 3 "~" H 4950 3400 50  0001 C CNN
	1    4950 3400
	0    1    1    0   
$EndComp
Text GLabel 4800 2900 0    50   Input ~ 0
VCC
Wire Wire Line
	4800 2900 5200 2900
Wire Wire Line
	5200 2900 5200 3000
Wire Wire Line
	5100 3400 5200 3400
Wire Wire Line
	5200 3400 5200 3300
Connection ~ 5200 3400
Wire Wire Line
	5200 3400 5500 3400
Wire Wire Line
	4800 3400 4700 3400
$Comp
L Diode:BZX84Cxx D16
U 1 1 62DD2AB7
P 5200 3650
F 0 "D16" V 5154 3730 50  0000 L CNN
F 1 "BZX84C3V6" V 5300 3200 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 5200 3475 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 5200 3650 50  0001 C CNN
	1    5200 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	5200 3400 5200 3500
Wire Wire Line
	5200 3800 5200 3900
Text GLabel 4800 3900 0    50   Input ~ 0
GND
Wire Wire Line
	5200 3900 4800 3900
$Comp
L Device:R R39
U 1 1 62DD2B0E
P 8850 1450
F 0 "R39" H 8920 1496 50  0000 L CNN
F 1 "680" H 8920 1405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8780 1450 50  0001 C CNN
F 3 "~" H 8850 1450 50  0001 C CNN
	1    8850 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R36
U 1 1 62DD2B18
P 8600 1700
F 0 "R36" V 8393 1700 50  0000 C CNN
F 1 "470" V 8484 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8530 1700 50  0001 C CNN
F 3 "~" H 8600 1700 50  0001 C CNN
	1    8600 1700
	0    1    1    0   
$EndComp
Text GLabel 8450 1200 0    50   Input ~ 0
VCC
Wire Wire Line
	8450 1200 8850 1200
Wire Wire Line
	8850 1200 8850 1300
Wire Wire Line
	8750 1700 8850 1700
Wire Wire Line
	8850 1700 8850 1600
Connection ~ 8850 1700
Wire Wire Line
	8850 1700 9150 1700
Wire Wire Line
	8450 1700 8350 1700
$Comp
L Diode:BZX84Cxx D20
U 1 1 62DD2B37
P 8850 1950
F 0 "D20" V 8804 2030 50  0000 L CNN
F 1 "BZX84C3V6" V 8950 1500 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 8850 1775 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 8850 1950 50  0001 C CNN
	1    8850 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	8850 1700 8850 1800
Wire Wire Line
	8850 2100 8850 2200
Text GLabel 8450 2200 0    50   Input ~ 0
GND
$Comp
L Device:R R40
U 1 1 62DD2B8E
P 8850 3150
F 0 "R40" H 8920 3196 50  0000 L CNN
F 1 "680" H 8920 3105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8780 3150 50  0001 C CNN
F 3 "~" H 8850 3150 50  0001 C CNN
	1    8850 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R37
U 1 1 62DD2B98
P 8600 3400
F 0 "R37" V 8393 3400 50  0000 C CNN
F 1 "470" V 8484 3400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8530 3400 50  0001 C CNN
F 3 "~" H 8600 3400 50  0001 C CNN
	1    8600 3400
	0    1    1    0   
$EndComp
Text GLabel 8450 2900 0    50   Input ~ 0
VCC
Wire Wire Line
	8450 2900 8850 2900
Wire Wire Line
	8850 2900 8850 3000
Wire Wire Line
	8750 3400 8850 3400
Wire Wire Line
	8850 3400 8850 3300
Connection ~ 8850 3400
Wire Wire Line
	8850 3400 9150 3400
Wire Wire Line
	8450 3400 8350 3400
$Comp
L Diode:BZX84Cxx D21
U 1 1 62DD2BB7
P 8850 3650
F 0 "D21" V 8804 3730 50  0000 L CNN
F 1 "BZX84C3V6" V 8950 3200 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 8850 3475 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 8850 3650 50  0001 C CNN
	1    8850 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	8850 3400 8850 3500
Wire Wire Line
	8850 3800 8850 3900
Text GLabel 8450 3900 0    50   Input ~ 0
GND
Text GLabel 4750 5500 0    50   Input ~ 0
GND
Wire Wire Line
	5150 5500 4750 5500
$Comp
L Device:R R41
U 1 1 62F8B679
P 8850 4750
F 0 "R41" H 8920 4796 50  0000 L CNN
F 1 "680" H 8920 4705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8780 4750 50  0001 C CNN
F 3 "~" H 8850 4750 50  0001 C CNN
	1    8850 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R38
U 1 1 62F8B683
P 8600 5000
F 0 "R38" V 8393 5000 50  0000 C CNN
F 1 "470" V 8484 5000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8530 5000 50  0001 C CNN
F 3 "~" H 8600 5000 50  0001 C CNN
	1    8600 5000
	0    1    1    0   
$EndComp
Text GLabel 8450 4450 0    50   Input ~ 0
VCC
Wire Wire Line
	8850 5400 8850 5500
Wire Wire Line
	8450 4450 8850 4450
Wire Wire Line
	8850 4450 8850 4600
Wire Wire Line
	8750 5000 8850 5000
Wire Wire Line
	8850 5000 8850 4900
Wire Wire Line
	8850 5000 8850 5100
Connection ~ 8850 5000
Wire Wire Line
	8850 5000 9150 5000
$Comp
L Diode:BZX84Cxx D22
U 1 1 62F8B6A2
P 8850 5250
F 0 "D22" V 8804 5330 50  0000 L CNN
F 1 "BZX84C3V6" V 8950 4800 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 8850 5075 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 8850 5250 50  0001 C CNN
	1    8850 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	8450 5000 8350 5000
Text GLabel 8450 5500 0    50   Input ~ 0
GND
Wire Wire Line
	8850 5500 8450 5500
$Comp
L Device:R R35
U 1 1 62FAC7B1
P 7000 4750
F 0 "R35" H 7070 4796 50  0000 L CNN
F 1 "680" H 7070 4705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6930 4750 50  0001 C CNN
F 3 "~" H 7000 4750 50  0001 C CNN
	1    7000 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R32
U 1 1 62FAC7BB
P 6750 5000
F 0 "R32" V 6543 5000 50  0000 C CNN
F 1 "470" V 6634 5000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6680 5000 50  0001 C CNN
F 3 "~" H 6750 5000 50  0001 C CNN
	1    6750 5000
	0    1    1    0   
$EndComp
Text GLabel 6600 4450 0    50   Input ~ 0
VCC
Wire Wire Line
	7000 5400 7000 5500
Wire Wire Line
	6600 4450 7000 4450
Wire Wire Line
	7000 4450 7000 4600
Wire Wire Line
	6900 5000 7000 5000
Wire Wire Line
	7000 5000 7000 4900
Wire Wire Line
	7000 5000 7000 5100
Connection ~ 7000 5000
Wire Wire Line
	7000 5000 7300 5000
$Comp
L Diode:BZX84Cxx D19
U 1 1 62FAC7DA
P 7000 5250
F 0 "D19" V 6954 5330 50  0000 L CNN
F 1 "BZX84C3V6" V 7100 4800 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 7000 5075 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 7000 5250 50  0001 C CNN
	1    7000 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	6600 5000 6500 5000
Text GLabel 6600 5500 0    50   Input ~ 0
GND
Wire Wire Line
	7000 5500 6600 5500
$Comp
L Device:R R34
U 1 1 62FAC7E9
P 7000 3150
F 0 "R34" H 7070 3196 50  0000 L CNN
F 1 "680" H 7070 3105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6930 3150 50  0001 C CNN
F 3 "~" H 7000 3150 50  0001 C CNN
	1    7000 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R31
U 1 1 62FAC7F3
P 6750 3400
F 0 "R31" V 6543 3400 50  0000 C CNN
F 1 "470" V 6634 3400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6680 3400 50  0001 C CNN
F 3 "~" H 6750 3400 50  0001 C CNN
	1    6750 3400
	0    1    1    0   
$EndComp
Text GLabel 6600 2850 0    50   Input ~ 0
VCC
Wire Wire Line
	7000 3800 7000 3900
Wire Wire Line
	6600 2850 7000 2850
Wire Wire Line
	7000 2850 7000 3000
Wire Wire Line
	6900 3400 7000 3400
Wire Wire Line
	7000 3400 7000 3300
Wire Wire Line
	7000 3400 7000 3500
Connection ~ 7000 3400
Wire Wire Line
	7000 3400 7300 3400
$Comp
L Diode:BZX84Cxx D18
U 1 1 62FAC812
P 7000 3650
F 0 "D18" V 6954 3730 50  0000 L CNN
F 1 "BZX84C3V6" V 7100 3200 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 7000 3475 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 7000 3650 50  0001 C CNN
	1    7000 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	6600 3400 6500 3400
Text GLabel 6600 3900 0    50   Input ~ 0
GND
Wire Wire Line
	7000 3900 6600 3900
$Comp
L Device:R R33
U 1 1 62FC1769
P 7000 1450
F 0 "R33" H 7070 1496 50  0000 L CNN
F 1 "680" H 7070 1405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6930 1450 50  0001 C CNN
F 3 "~" H 7000 1450 50  0001 C CNN
	1    7000 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R30
U 1 1 62FC1773
P 6750 1700
F 0 "R30" V 6543 1700 50  0000 C CNN
F 1 "470" V 6634 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6680 1700 50  0001 C CNN
F 3 "~" H 6750 1700 50  0001 C CNN
	1    6750 1700
	0    1    1    0   
$EndComp
Text GLabel 6600 1150 0    50   Input ~ 0
VCC
Wire Wire Line
	7000 2100 7000 2200
Wire Wire Line
	6600 1150 7000 1150
Wire Wire Line
	7000 1150 7000 1300
Wire Wire Line
	6900 1700 7000 1700
Wire Wire Line
	7000 1700 7000 1600
Wire Wire Line
	7000 1700 7000 1800
Connection ~ 7000 1700
Wire Wire Line
	7000 1700 7300 1700
$Comp
L Diode:BZX84Cxx D17
U 1 1 62FC1792
P 7000 1950
F 0 "D17" V 6954 2030 50  0000 L CNN
F 1 "BZX84C3V6" V 7100 1500 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 7000 1775 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 7000 1950 50  0001 C CNN
	1    7000 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	6600 1700 6500 1700
Text GLabel 6600 2200 0    50   Input ~ 0
GND
Wire Wire Line
	7000 2200 6600 2200
$Comp
L Device:R R15
U 1 1 62FEB5B5
P 1550 3150
F 0 "R15" H 1620 3196 50  0000 L CNN
F 1 "680" H 1620 3105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1480 3150 50  0001 C CNN
F 3 "~" H 1550 3150 50  0001 C CNN
	1    1550 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 62FEB5BF
P 1300 3400
F 0 "R11" V 1093 3400 50  0000 C CNN
F 1 "470" V 1184 3400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1230 3400 50  0001 C CNN
F 3 "~" H 1300 3400 50  0001 C CNN
	1    1300 3400
	0    1    1    0   
$EndComp
Text GLabel 1150 2850 0    50   Input ~ 0
VCC
Wire Wire Line
	1550 3800 1550 3900
Wire Wire Line
	1150 2850 1550 2850
Wire Wire Line
	1550 2850 1550 3000
Wire Wire Line
	1450 3400 1550 3400
Wire Wire Line
	1550 3400 1550 3300
Wire Wire Line
	1550 3400 1550 3500
Connection ~ 1550 3400
Wire Wire Line
	1550 3400 1850 3400
$Comp
L Diode:BZX84Cxx D8
U 1 1 62FEB5DE
P 1550 3650
F 0 "D8" V 1504 3730 50  0000 L CNN
F 1 "BZX84C3V6" V 1650 3200 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 1550 3475 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 1550 3650 50  0001 C CNN
	1    1550 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	1150 3400 1050 3400
Text GLabel 1150 3900 0    50   Input ~ 0
GND
Wire Wire Line
	1550 3900 1150 3900
Wire Wire Line
	8850 3900 8450 3900
Wire Wire Line
	8850 2200 8450 2200
Text HLabel 1050 4950 0    50   Output ~ 0
L3
$Comp
L Device:R R16
U 1 1 62A61410
P 1550 4700
F 0 "R16" H 1620 4746 50  0000 L CNN
F 1 "680" H 1620 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1480 4700 50  0001 C CNN
F 3 "~" H 1550 4700 50  0001 C CNN
	1    1550 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 62A6141A
P 1300 4950
F 0 "R12" V 1093 4950 50  0000 C CNN
F 1 "470" V 1184 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1230 4950 50  0001 C CNN
F 3 "~" H 1300 4950 50  0001 C CNN
	1    1300 4950
	0    1    1    0   
$EndComp
Text GLabel 1150 4450 0    50   Input ~ 0
VCC
Wire Wire Line
	1150 4450 1550 4450
Wire Wire Line
	1550 4450 1550 4550
Wire Wire Line
	1450 4950 1550 4950
Wire Wire Line
	1550 4950 1550 4850
Connection ~ 1550 4950
Wire Wire Line
	1550 4950 1850 4950
Wire Wire Line
	1150 4950 1050 4950
$Comp
L Diode:BZX84Cxx D9
U 1 1 62A61437
P 1550 5200
F 0 "D9" V 1504 5280 50  0000 L CNN
F 1 "BZX84C3V6" V 1650 4750 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 1550 5025 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 1550 5200 50  0001 C CNN
	1    1550 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	1550 4950 1550 5050
Wire Wire Line
	1550 5350 1550 5450
Text GLabel 1150 5450 0    50   Input ~ 0
GND
Wire Wire Line
	1550 5450 1150 5450
$Comp
L Device:R R17
U 1 1 62A61447
P 1550 6400
F 0 "R17" H 1620 6446 50  0000 L CNN
F 1 "680" H 1620 6355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1480 6400 50  0001 C CNN
F 3 "~" H 1550 6400 50  0001 C CNN
	1    1550 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 62A61451
P 1300 6650
F 0 "R13" V 1093 6650 50  0000 C CNN
F 1 "470" V 1184 6650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1230 6650 50  0001 C CNN
F 3 "~" H 1300 6650 50  0001 C CNN
	1    1300 6650
	0    1    1    0   
$EndComp
Text GLabel 1150 6100 0    50   Input ~ 0
VCC
Wire Wire Line
	1550 7050 1550 7150
Wire Wire Line
	1150 6100 1550 6100
Wire Wire Line
	1550 6100 1550 6250
Wire Wire Line
	1450 6650 1550 6650
Wire Wire Line
	1550 6650 1550 6550
Wire Wire Line
	1550 6650 1550 6750
Connection ~ 1550 6650
Wire Wire Line
	1550 6650 1850 6650
$Comp
L Diode:BZX84Cxx D10
U 1 1 62A61470
P 1550 6900
F 0 "D10" V 1504 6980 50  0000 L CNN
F 1 "BZX84C3V6" V 1650 6450 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 1550 6725 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 1550 6900 50  0001 C CNN
	1    1550 6900
	0    1    1    0   
$EndComp
Wire Wire Line
	1150 6650 1050 6650
Text GLabel 1150 7150 0    50   Input ~ 0
GND
Wire Wire Line
	1550 7150 1150 7150
Text HLabel 1050 6650 0    50   Output ~ 0
R3
Text Notes 2800 7100 0    50   ~ 0
NOTE : Tout a été testé en 3,3V et 5V\nTout est OK
Text Notes 2800 6550 0    50   ~ 0
VCC 5v / Zener 3V6\n\nBouton ouvert : 3,38V\nBouton fermé : 0V\nuC OK
Text Notes 4300 6550 0    50   ~ 0
VCC 3.3v / Zener 3V6\n\nBouton ouvert : 2,9V\nBouton fermé : 0V\nuC OK
Text Notes 2800 7550 0    50   ~ 0
NOTE : 680R est un compromis pour polariser a\nminima à 5mA la diode Zener (Iz)
$Comp
L Connector:Conn_01x08_Male J5
U 1 1 627843DC
P 10750 1700
F 0 "J5" H 10722 1628 50  0000 R CNN
F 1 "Conn_01x08_Male" H 10722 1583 50  0001 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Horizontal" H 10750 1700 50  0001 C CNN
F 3 "~" H 10750 1700 50  0001 C CNN
	1    10750 1700
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Male J6
U 1 1 6279A9BB
P 10750 2900
F 0 "J6" H 10722 2828 50  0000 R CNN
F 1 "Conn_01x08_Male" H 10722 2783 50  0001 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Horizontal" H 10750 2900 50  0001 C CNN
F 3 "~" H 10750 2900 50  0001 C CNN
	1    10750 2900
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Male J7
U 1 1 6279B46D
P 10750 4100
F 0 "J7" H 10722 4028 50  0000 R CNN
F 1 "Conn_01x08_Male" H 10722 3983 50  0001 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Horizontal" H 10750 4100 50  0001 C CNN
F 3 "~" H 10750 4100 50  0001 C CNN
	1    10750 4100
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Male J8
U 1 1 6279BF29
P 10750 5300
F 0 "J8" H 10722 5228 50  0000 R CNN
F 1 "Conn_01x08_Male" H 10722 5183 50  0001 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Horizontal" H 10750 5300 50  0001 C CNN
F 3 "~" H 10750 5300 50  0001 C CNN
	1    10750 5300
	-1   0    0    -1  
$EndComp
Text GLabel 10150 5900 0    50   Input ~ 0
GND
Wire Wire Line
	10550 1500 10350 1500
Wire Wire Line
	10350 1500 10350 1700
Wire Wire Line
	10550 1700 10350 1700
Connection ~ 10350 1700
Wire Wire Line
	10350 1700 10350 1900
Wire Wire Line
	10550 1900 10350 1900
Connection ~ 10350 1900
Wire Wire Line
	10350 1900 10350 2100
Wire Wire Line
	10550 2100 10350 2100
Wire Wire Line
	10550 2700 10350 2700
Wire Wire Line
	10350 2700 10350 2900
Wire Wire Line
	10550 2900 10350 2900
Connection ~ 10350 2900
Wire Wire Line
	10350 2900 10350 3100
Wire Wire Line
	10550 3100 10350 3100
Connection ~ 10350 3100
Wire Wire Line
	10350 3100 10350 3300
Wire Wire Line
	10550 3300 10350 3300
Wire Wire Line
	10550 3900 10350 3900
Wire Wire Line
	10350 3900 10350 4100
Wire Wire Line
	10550 4100 10350 4100
Connection ~ 10350 4100
Wire Wire Line
	10350 4100 10350 4300
Wire Wire Line
	10550 4300 10350 4300
Connection ~ 10350 4300
Wire Wire Line
	10550 4500 10350 4500
Wire Wire Line
	10550 5100 10350 5100
Wire Wire Line
	10350 5100 10350 5300
Wire Wire Line
	10550 5300 10350 5300
Connection ~ 10350 5300
Wire Wire Line
	10350 5300 10350 5500
Wire Wire Line
	10550 5500 10350 5500
Connection ~ 10350 5500
Wire Wire Line
	10350 5500 10350 5700
Wire Wire Line
	10550 5700 10350 5700
Wire Wire Line
	10350 5700 10350 5900
Wire Wire Line
	10350 5900 10150 5900
Connection ~ 10350 5700
Text GLabel 10150 4700 0    50   Input ~ 0
GND
Text GLabel 10150 3500 0    50   Input ~ 0
GND
Text GLabel 10150 2300 0    50   Input ~ 0
GND
Wire Wire Line
	10350 2100 10350 2300
Wire Wire Line
	10350 2300 10150 2300
Connection ~ 10350 2100
Wire Wire Line
	10350 3300 10350 3500
Wire Wire Line
	10350 3500 10150 3500
Connection ~ 10350 3300
Wire Wire Line
	10350 4700 10150 4700
Wire Wire Line
	10350 4300 10350 4500
Connection ~ 10350 4500
Wire Wire Line
	10350 4500 10350 4700
Text Label 1850 1700 0    50   ~ 0
C_LEFT
Text Label 10150 2000 2    50   ~ 0
C_LEFT
Text Label 3550 1700 0    50   ~ 0
C_UP
Text Label 10150 1400 2    50   ~ 0
C_UP
Text Label 3550 4950 0    50   ~ 0
C_RIGHT
Text Label 10200 1600 2    50   ~ 0
C_RIGHT
Text Label 3550 3400 0    50   ~ 0
C_DOWN
Text Label 10200 1800 2    50   ~ 0
C_DOWN
Text Label 5500 1700 0    50   ~ 0
C_CROSS
Text Label 10150 2600 2    50   ~ 0
C_CROSS
Text Label 5500 3400 0    50   ~ 0
C_CIRCLE
Text Label 10150 2800 2    50   ~ 0
C_CIRCLE
Text Label 9150 1700 0    50   ~ 0
C_SQUARE
Text Label 10150 3000 2    50   ~ 0
C_SQUARE
Text Label 9150 3400 0    50   ~ 0
C_TRIANGLE
Text Label 10150 3200 2    50   ~ 0
C_TRIANGLE
Text Label 7300 1700 0    50   ~ 0
C_START
Text Label 10150 3800 2    50   ~ 0
C_START
Text Label 7300 5000 0    50   ~ 0
C_R1
Text Label 10150 4000 2    50   ~ 0
C_R1
Text Label 7300 3400 0    50   ~ 0
C_R2
Text Label 10150 4200 2    50   ~ 0
C_R2
Text Label 1850 6650 0    50   ~ 0
C_R3
Text Label 10150 4400 2    50   ~ 0
C_R3
Text Label 1850 3400 0    50   ~ 0
C_SELECT
Text Label 10150 5000 2    50   ~ 0
C_SELECT
Text Label 5450 5000 0    50   ~ 0
C_L1
Text Label 10150 5200 2    50   ~ 0
C_L1
Text Label 9150 5000 0    50   ~ 0
C_L2
Text Label 10150 5400 2    50   ~ 0
C_L2
Text Label 1850 4950 0    50   ~ 0
C_L3
Text Label 10150 5600 2    50   ~ 0
C_L3
Wire Wire Line
	10150 1400 10550 1400
Wire Wire Line
	10550 1600 10200 1600
Wire Wire Line
	10200 1800 10550 1800
Wire Wire Line
	10550 2000 10150 2000
Wire Wire Line
	10150 2600 10550 2600
Wire Wire Line
	10550 2800 10150 2800
Wire Wire Line
	10150 3000 10550 3000
Wire Wire Line
	10550 3200 10150 3200
Wire Wire Line
	10150 3800 10550 3800
Wire Wire Line
	10550 4000 10150 4000
Wire Wire Line
	10150 4200 10550 4200
Wire Wire Line
	10550 4400 10150 4400
Wire Wire Line
	10150 5000 10550 5000
Wire Wire Line
	10550 5200 10150 5200
Wire Wire Line
	10150 5400 10550 5400
Wire Wire Line
	10550 5600 10150 5600
$EndSCHEMATC
