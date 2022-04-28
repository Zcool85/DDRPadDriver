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
Text HLabel 1800 3350 0    50   Output ~ 0
S1-SELECT
Text HLabel 7250 1650 0    50   Output ~ 0
S2-START
Text HLabel 5400 4950 0    50   Output ~ 0
L1
Text HLabel 3500 1650 0    50   Output ~ 0
UP
Text HLabel 3500 3350 0    50   Output ~ 0
DOWN
Text HLabel 3500 4900 0    50   Output ~ 0
RIGHT
Text HLabel 1800 1650 0    50   Output ~ 0
LEFT
Text HLabel 7250 3350 0    50   Output ~ 0
R2
Text HLabel 9100 4950 0    50   Output ~ 0
L2
Text HLabel 7250 4950 0    50   Output ~ 0
R1
Text HLabel 5450 1650 0    50   Output ~ 0
B1-CROSS
Text HLabel 5450 3350 0    50   Output ~ 0
B2-CIRCLE
Text HLabel 9100 1650 0    50   Output ~ 0
B3-SQUARE
Text HLabel 9100 3350 0    50   Output ~ 0
B4-TRIANGLE
$Comp
L Device:R R27
U 1 1 62404DA4
P 5900 4700
F 0 "R27" H 5970 4746 50  0000 L CNN
F 1 "680" H 5970 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5830 4700 50  0001 C CNN
F 3 "~" H 5900 4700 50  0001 C CNN
	1    5900 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R24
U 1 1 62404DAE
P 5650 4950
F 0 "R24" V 5443 4950 50  0000 C CNN
F 1 "470" V 5534 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5580 4950 50  0001 C CNN
F 3 "~" H 5650 4950 50  0001 C CNN
	1    5650 4950
	0    1    1    0   
$EndComp
Text GLabel 5500 4400 0    50   Input ~ 0
VCC
$Comp
L Connector_Generic:Conn_01x02 J12
U 1 1 62404DB9
P 6200 4650
F 0 "J12" H 6280 4642 50  0000 L CNN
F 1 "Conn_01x02" H 6280 4551 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Horizontal" H 6200 4650 50  0001 C CNN
F 3 "~" H 6200 4650 50  0001 C CNN
	1    6200 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5900 5350 5900 5450
Wire Wire Line
	5500 4400 5900 4400
Wire Wire Line
	5900 4400 5900 4550
Wire Wire Line
	5800 4950 5900 4950
Wire Wire Line
	5900 4950 5900 4850
Wire Wire Line
	5900 4950 5900 5050
Connection ~ 5900 4950
Wire Wire Line
	5900 4950 6200 4950
Wire Wire Line
	6200 4950 6200 4850
Wire Wire Line
	6300 5450 5900 5450
$Comp
L Diode:BZX84Cxx D14
U 1 1 62404DE8
P 5900 5200
F 0 "D14" V 5854 5280 50  0000 L CNN
F 1 "BZX84C3V6" V 6000 4750 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 5900 5025 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 5900 5200 50  0001 C CNN
	1    5900 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	6300 4850 6300 5450
Wire Wire Line
	5500 4950 5400 4950
$Comp
L Device:R R21
U 1 1 6265062F
P 4000 1400
F 0 "R21" H 4070 1446 50  0000 L CNN
F 1 "680" H 4070 1355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 3930 1400 50  0001 C CNN
F 3 "~" H 4000 1400 50  0001 C CNN
	1    4000 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 62650639
P 3750 1650
F 0 "R18" V 3543 1650 50  0000 C CNN
F 1 "470" V 3634 1650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 3680 1650 50  0001 C CNN
F 3 "~" H 3750 1650 50  0001 C CNN
	1    3750 1650
	0    1    1    0   
$EndComp
Text GLabel 3600 1150 0    50   Input ~ 0
VCC
$Comp
L Connector_Generic:Conn_01x02 J9
U 1 1 62650644
P 4300 1300
F 0 "J9" H 4380 1292 50  0000 L CNN
F 1 "Conn_01x02" H 4380 1201 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Horizontal" H 4300 1300 50  0001 C CNN
F 3 "~" H 4300 1300 50  0001 C CNN
	1    4300 1300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3600 1150 4000 1150
Wire Wire Line
	4000 1150 4000 1250
Wire Wire Line
	3900 1650 4000 1650
Wire Wire Line
	4000 1650 4000 1550
Connection ~ 4000 1650
Wire Wire Line
	4000 1650 4300 1650
Wire Wire Line
	4300 1650 4300 1500
Wire Wire Line
	3600 1650 3500 1650
$Comp
L Diode:BZX84Cxx D11
U 1 1 62AF12A8
P 4000 1900
F 0 "D11" V 3954 1980 50  0000 L CNN
F 1 "BZX84C3V6" V 4100 1450 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 4000 1725 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 4000 1900 50  0001 C CNN
	1    4000 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	4000 1650 4000 1750
Wire Wire Line
	4000 2050 4000 2150
Connection ~ 4000 2150
Wire Wire Line
	4000 2150 4400 2150
Text GLabel 3600 2150 0    50   Input ~ 0
GND
Wire Wire Line
	4000 2150 3600 2150
$Comp
L Device:R R22
U 1 1 62DB4678
P 4000 3100
F 0 "R22" H 4070 3146 50  0000 L CNN
F 1 "680" H 4070 3055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 3930 3100 50  0001 C CNN
F 3 "~" H 4000 3100 50  0001 C CNN
	1    4000 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 62DB4682
P 3750 3350
F 0 "R19" V 3543 3350 50  0000 C CNN
F 1 "470" V 3634 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 3680 3350 50  0001 C CNN
F 3 "~" H 3750 3350 50  0001 C CNN
	1    3750 3350
	0    1    1    0   
$EndComp
Text GLabel 3600 2850 0    50   Input ~ 0
VCC
$Comp
L Connector_Generic:Conn_01x02 J10
U 1 1 62DB468D
P 4300 3000
F 0 "J10" H 4380 2992 50  0000 L CNN
F 1 "Conn_01x02" H 4380 2901 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Horizontal" H 4300 3000 50  0001 C CNN
F 3 "~" H 4300 3000 50  0001 C CNN
	1    4300 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3600 2850 4000 2850
Wire Wire Line
	4000 2850 4000 2950
Wire Wire Line
	3900 3350 4000 3350
Wire Wire Line
	4000 3350 4000 3250
Connection ~ 4000 3350
Wire Wire Line
	4000 3350 4300 3350
Wire Wire Line
	4300 3350 4300 3200
Wire Wire Line
	3600 3350 3500 3350
$Comp
L Diode:BZX84Cxx D12
U 1 1 62DB46A1
P 4000 3600
F 0 "D12" V 3954 3680 50  0000 L CNN
F 1 "BZX84C3V6" V 4100 3150 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 4000 3425 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 4000 3600 50  0001 C CNN
	1    4000 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	4000 3350 4000 3450
Wire Wire Line
	4000 3750 4000 3850
Connection ~ 4000 3850
Wire Wire Line
	4000 3850 4400 3850
Text GLabel 3600 3850 0    50   Input ~ 0
GND
Wire Wire Line
	4000 3850 3600 3850
$Comp
L Device:R R23
U 1 1 62DBDA9C
P 4000 4650
F 0 "R23" H 4070 4696 50  0000 L CNN
F 1 "680" H 4070 4605 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 3930 4650 50  0001 C CNN
F 3 "~" H 4000 4650 50  0001 C CNN
	1    4000 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R20
U 1 1 62DBDAA6
P 3750 4900
F 0 "R20" V 3543 4900 50  0000 C CNN
F 1 "470" V 3634 4900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 3680 4900 50  0001 C CNN
F 3 "~" H 3750 4900 50  0001 C CNN
	1    3750 4900
	0    1    1    0   
$EndComp
Text GLabel 3600 4400 0    50   Input ~ 0
VCC
$Comp
L Connector_Generic:Conn_01x02 J11
U 1 1 62DBDAB1
P 4300 4550
F 0 "J11" H 4380 4542 50  0000 L CNN
F 1 "Conn_01x02" H 4380 4451 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Horizontal" H 4300 4550 50  0001 C CNN
F 3 "~" H 4300 4550 50  0001 C CNN
	1    4300 4550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3600 4400 4000 4400
Wire Wire Line
	4000 4400 4000 4500
Wire Wire Line
	3900 4900 4000 4900
Wire Wire Line
	4000 4900 4000 4800
Connection ~ 4000 4900
Wire Wire Line
	4000 4900 4300 4900
Wire Wire Line
	4300 4900 4300 4750
Wire Wire Line
	3600 4900 3500 4900
$Comp
L Diode:BZX84Cxx D13
U 1 1 62DBDAC5
P 4000 5150
F 0 "D13" V 3954 5230 50  0000 L CNN
F 1 "BZX84C3V6" V 4100 4700 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 4000 4975 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 4000 5150 50  0001 C CNN
	1    4000 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	4000 4900 4000 5000
Wire Wire Line
	4000 5300 4000 5400
Connection ~ 4000 5400
Wire Wire Line
	4000 5400 4400 5400
Text GLabel 3600 5400 0    50   Input ~ 0
GND
Wire Wire Line
	4000 5400 3600 5400
$Comp
L Device:R R14
U 1 1 62DBDB1C
P 2300 1400
F 0 "R14" H 2370 1446 50  0000 L CNN
F 1 "680" H 2370 1355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2230 1400 50  0001 C CNN
F 3 "~" H 2300 1400 50  0001 C CNN
	1    2300 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 62DBDB26
P 2050 1650
F 0 "R10" V 1843 1650 50  0000 C CNN
F 1 "470" V 1934 1650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1980 1650 50  0001 C CNN
F 3 "~" H 2050 1650 50  0001 C CNN
	1    2050 1650
	0    1    1    0   
$EndComp
Text GLabel 1900 1150 0    50   Input ~ 0
VCC
$Comp
L Connector_Generic:Conn_01x02 J5
U 1 1 62DBDB31
P 2600 1300
F 0 "J5" H 2680 1292 50  0000 L CNN
F 1 "Conn_01x02" H 2680 1201 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Horizontal" H 2600 1300 50  0001 C CNN
F 3 "~" H 2600 1300 50  0001 C CNN
	1    2600 1300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1900 1150 2300 1150
Wire Wire Line
	2300 1150 2300 1250
Wire Wire Line
	2200 1650 2300 1650
Wire Wire Line
	2300 1650 2300 1550
Connection ~ 2300 1650
Wire Wire Line
	2300 1650 2600 1650
Wire Wire Line
	2600 1650 2600 1500
Wire Wire Line
	1900 1650 1800 1650
$Comp
L Diode:BZX84Cxx D7
U 1 1 62DBDB45
P 2300 1900
F 0 "D7" V 2254 1980 50  0000 L CNN
F 1 "BZX84C3V6" V 2400 1450 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 2300 1725 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 2300 1900 50  0001 C CNN
	1    2300 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	2300 1650 2300 1750
Wire Wire Line
	2300 2050 2300 2150
Connection ~ 2300 2150
Wire Wire Line
	2300 2150 2700 2150
Text GLabel 1900 2150 0    50   Input ~ 0
GND
Wire Wire Line
	2300 2150 1900 2150
$Comp
L Device:R R28
U 1 1 62DD2A0E
P 5950 1400
F 0 "R28" H 6020 1446 50  0000 L CNN
F 1 "680" H 6020 1355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5880 1400 50  0001 C CNN
F 3 "~" H 5950 1400 50  0001 C CNN
	1    5950 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R25
U 1 1 62DD2A18
P 5700 1650
F 0 "R25" V 5493 1650 50  0000 C CNN
F 1 "470" V 5584 1650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5630 1650 50  0001 C CNN
F 3 "~" H 5700 1650 50  0001 C CNN
	1    5700 1650
	0    1    1    0   
$EndComp
Text GLabel 5550 1150 0    50   Input ~ 0
VCC
$Comp
L Connector_Generic:Conn_01x02 J13
U 1 1 62DD2A23
P 6250 1300
F 0 "J13" H 6330 1292 50  0000 L CNN
F 1 "Conn_01x02" H 6330 1201 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Horizontal" H 6250 1300 50  0001 C CNN
F 3 "~" H 6250 1300 50  0001 C CNN
	1    6250 1300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5550 1150 5950 1150
Wire Wire Line
	5950 1150 5950 1250
Wire Wire Line
	5850 1650 5950 1650
Wire Wire Line
	5950 1650 5950 1550
Connection ~ 5950 1650
Wire Wire Line
	5950 1650 6250 1650
Wire Wire Line
	6250 1650 6250 1500
Wire Wire Line
	5550 1650 5450 1650
$Comp
L Diode:BZX84Cxx D15
U 1 1 62DD2A37
P 5950 1900
F 0 "D15" V 5904 1980 50  0000 L CNN
F 1 "BZX84C3V6" V 6050 1450 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 5950 1725 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 5950 1900 50  0001 C CNN
	1    5950 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	5950 1650 5950 1750
Wire Wire Line
	5950 2050 5950 2150
Connection ~ 5950 2150
Wire Wire Line
	5950 2150 6350 2150
Text GLabel 5550 2150 0    50   Input ~ 0
GND
Wire Wire Line
	5950 2150 5550 2150
$Comp
L Device:R R29
U 1 1 62DD2A8E
P 5950 3100
F 0 "R29" H 6020 3146 50  0000 L CNN
F 1 "680" H 6020 3055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5880 3100 50  0001 C CNN
F 3 "~" H 5950 3100 50  0001 C CNN
	1    5950 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R26
U 1 1 62DD2A98
P 5700 3350
F 0 "R26" V 5493 3350 50  0000 C CNN
F 1 "470" V 5584 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5630 3350 50  0001 C CNN
F 3 "~" H 5700 3350 50  0001 C CNN
	1    5700 3350
	0    1    1    0   
$EndComp
Text GLabel 5550 2850 0    50   Input ~ 0
VCC
$Comp
L Connector_Generic:Conn_01x02 J14
U 1 1 62DD2AA3
P 6250 3000
F 0 "J14" H 6330 2992 50  0000 L CNN
F 1 "Conn_01x02" H 6330 2901 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Horizontal" H 6250 3000 50  0001 C CNN
F 3 "~" H 6250 3000 50  0001 C CNN
	1    6250 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5550 2850 5950 2850
Wire Wire Line
	5950 2850 5950 2950
Wire Wire Line
	5850 3350 5950 3350
Wire Wire Line
	5950 3350 5950 3250
Connection ~ 5950 3350
Wire Wire Line
	5950 3350 6250 3350
Wire Wire Line
	6250 3350 6250 3200
Wire Wire Line
	5550 3350 5450 3350
$Comp
L Diode:BZX84Cxx D16
U 1 1 62DD2AB7
P 5950 3600
F 0 "D16" V 5904 3680 50  0000 L CNN
F 1 "BZX84C3V6" V 6050 3150 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 5950 3425 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 5950 3600 50  0001 C CNN
	1    5950 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	5950 3350 5950 3450
Wire Wire Line
	5950 3750 5950 3850
Connection ~ 5950 3850
Wire Wire Line
	5950 3850 6350 3850
Text GLabel 5550 3850 0    50   Input ~ 0
GND
Wire Wire Line
	5950 3850 5550 3850
$Comp
L Device:R R39
U 1 1 62DD2B0E
P 9600 1400
F 0 "R39" H 9670 1446 50  0000 L CNN
F 1 "680" H 9670 1355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9530 1400 50  0001 C CNN
F 3 "~" H 9600 1400 50  0001 C CNN
	1    9600 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R36
U 1 1 62DD2B18
P 9350 1650
F 0 "R36" V 9143 1650 50  0000 C CNN
F 1 "470" V 9234 1650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9280 1650 50  0001 C CNN
F 3 "~" H 9350 1650 50  0001 C CNN
	1    9350 1650
	0    1    1    0   
$EndComp
Text GLabel 9200 1150 0    50   Input ~ 0
VCC
$Comp
L Connector_Generic:Conn_01x02 J18
U 1 1 62DD2B23
P 9900 1300
F 0 "J18" H 9980 1292 50  0000 L CNN
F 1 "Conn_01x02" H 9980 1201 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Horizontal" H 9900 1300 50  0001 C CNN
F 3 "~" H 9900 1300 50  0001 C CNN
	1    9900 1300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9200 1150 9600 1150
Wire Wire Line
	9600 1150 9600 1250
Wire Wire Line
	9500 1650 9600 1650
Wire Wire Line
	9600 1650 9600 1550
Connection ~ 9600 1650
Wire Wire Line
	9600 1650 9900 1650
Wire Wire Line
	9900 1650 9900 1500
Wire Wire Line
	9200 1650 9100 1650
$Comp
L Diode:BZX84Cxx D20
U 1 1 62DD2B37
P 9600 1900
F 0 "D20" V 9554 1980 50  0000 L CNN
F 1 "BZX84C3V6" V 9700 1450 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 9600 1725 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 9600 1900 50  0001 C CNN
	1    9600 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	9600 1650 9600 1750
Wire Wire Line
	9600 2050 9600 2150
Wire Wire Line
	9600 2150 10000 2150
Text GLabel 9200 2150 0    50   Input ~ 0
GND
$Comp
L Device:R R40
U 1 1 62DD2B8E
P 9600 3100
F 0 "R40" H 9670 3146 50  0000 L CNN
F 1 "680" H 9670 3055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9530 3100 50  0001 C CNN
F 3 "~" H 9600 3100 50  0001 C CNN
	1    9600 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R37
U 1 1 62DD2B98
P 9350 3350
F 0 "R37" V 9143 3350 50  0000 C CNN
F 1 "470" V 9234 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9280 3350 50  0001 C CNN
F 3 "~" H 9350 3350 50  0001 C CNN
	1    9350 3350
	0    1    1    0   
$EndComp
Text GLabel 9200 2850 0    50   Input ~ 0
VCC
$Comp
L Connector_Generic:Conn_01x02 J19
U 1 1 62DD2BA3
P 9900 3000
F 0 "J19" H 9980 2992 50  0000 L CNN
F 1 "Conn_01x02" H 9980 2901 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Horizontal" H 9900 3000 50  0001 C CNN
F 3 "~" H 9900 3000 50  0001 C CNN
	1    9900 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9200 2850 9600 2850
Wire Wire Line
	9600 2850 9600 2950
Wire Wire Line
	9500 3350 9600 3350
Wire Wire Line
	9600 3350 9600 3250
Connection ~ 9600 3350
Wire Wire Line
	9600 3350 9900 3350
Wire Wire Line
	9900 3350 9900 3200
Wire Wire Line
	9200 3350 9100 3350
$Comp
L Diode:BZX84Cxx D21
U 1 1 62DD2BB7
P 9600 3600
F 0 "D21" V 9554 3680 50  0000 L CNN
F 1 "BZX84C3V6" V 9700 3150 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 9600 3425 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 9600 3600 50  0001 C CNN
	1    9600 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	9600 3350 9600 3450
Wire Wire Line
	9600 3750 9600 3850
Wire Wire Line
	9600 3850 10000 3850
Text GLabel 9200 3850 0    50   Input ~ 0
GND
Text GLabel 5500 5450 0    50   Input ~ 0
GND
Wire Wire Line
	5900 5450 5500 5450
Connection ~ 5900 5450
$Comp
L Device:R R41
U 1 1 62F8B679
P 9600 4700
F 0 "R41" H 9670 4746 50  0000 L CNN
F 1 "680" H 9670 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9530 4700 50  0001 C CNN
F 3 "~" H 9600 4700 50  0001 C CNN
	1    9600 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R38
U 1 1 62F8B683
P 9350 4950
F 0 "R38" V 9143 4950 50  0000 C CNN
F 1 "470" V 9234 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9280 4950 50  0001 C CNN
F 3 "~" H 9350 4950 50  0001 C CNN
	1    9350 4950
	0    1    1    0   
$EndComp
Text GLabel 9200 4400 0    50   Input ~ 0
VCC
$Comp
L Connector_Generic:Conn_01x02 J20
U 1 1 62F8B68E
P 9900 4650
F 0 "J20" H 9980 4642 50  0000 L CNN
F 1 "Conn_01x02" H 9980 4551 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Horizontal" H 9900 4650 50  0001 C CNN
F 3 "~" H 9900 4650 50  0001 C CNN
	1    9900 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9600 5350 9600 5450
Wire Wire Line
	9200 4400 9600 4400
Wire Wire Line
	9600 4400 9600 4550
Wire Wire Line
	9500 4950 9600 4950
Wire Wire Line
	9600 4950 9600 4850
Wire Wire Line
	9600 4950 9600 5050
Connection ~ 9600 4950
Wire Wire Line
	9600 4950 9900 4950
Wire Wire Line
	9900 4950 9900 4850
Wire Wire Line
	10000 5450 9600 5450
$Comp
L Diode:BZX84Cxx D22
U 1 1 62F8B6A2
P 9600 5200
F 0 "D22" V 9554 5280 50  0000 L CNN
F 1 "BZX84C3V6" V 9700 4750 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 9600 5025 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 9600 5200 50  0001 C CNN
	1    9600 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	10000 4850 10000 5450
Wire Wire Line
	9200 4950 9100 4950
Text GLabel 9200 5450 0    50   Input ~ 0
GND
Wire Wire Line
	9600 5450 9200 5450
Connection ~ 9600 5450
$Comp
L Device:R R35
U 1 1 62FAC7B1
P 7750 4700
F 0 "R35" H 7820 4746 50  0000 L CNN
F 1 "680" H 7820 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 7680 4700 50  0001 C CNN
F 3 "~" H 7750 4700 50  0001 C CNN
	1    7750 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R32
U 1 1 62FAC7BB
P 7500 4950
F 0 "R32" V 7293 4950 50  0000 C CNN
F 1 "470" V 7384 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 7430 4950 50  0001 C CNN
F 3 "~" H 7500 4950 50  0001 C CNN
	1    7500 4950
	0    1    1    0   
$EndComp
Text GLabel 7350 4400 0    50   Input ~ 0
VCC
$Comp
L Connector_Generic:Conn_01x02 J17
U 1 1 62FAC7C6
P 8050 4650
F 0 "J17" H 8130 4642 50  0000 L CNN
F 1 "Conn_01x02" H 8130 4551 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Horizontal" H 8050 4650 50  0001 C CNN
F 3 "~" H 8050 4650 50  0001 C CNN
	1    8050 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7750 5350 7750 5450
Wire Wire Line
	7350 4400 7750 4400
Wire Wire Line
	7750 4400 7750 4550
Wire Wire Line
	7650 4950 7750 4950
Wire Wire Line
	7750 4950 7750 4850
Wire Wire Line
	7750 4950 7750 5050
Connection ~ 7750 4950
Wire Wire Line
	7750 4950 8050 4950
Wire Wire Line
	8050 4950 8050 4850
Wire Wire Line
	8150 5450 7750 5450
$Comp
L Diode:BZX84Cxx D19
U 1 1 62FAC7DA
P 7750 5200
F 0 "D19" V 7704 5280 50  0000 L CNN
F 1 "BZX84C3V6" V 7850 4750 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 7750 5025 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 7750 5200 50  0001 C CNN
	1    7750 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	8150 4850 8150 5450
Wire Wire Line
	7350 4950 7250 4950
Text GLabel 7350 5450 0    50   Input ~ 0
GND
Wire Wire Line
	7750 5450 7350 5450
Connection ~ 7750 5450
$Comp
L Device:R R34
U 1 1 62FAC7E9
P 7750 3100
F 0 "R34" H 7820 3146 50  0000 L CNN
F 1 "680" H 7820 3055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 7680 3100 50  0001 C CNN
F 3 "~" H 7750 3100 50  0001 C CNN
	1    7750 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R31
U 1 1 62FAC7F3
P 7500 3350
F 0 "R31" V 7293 3350 50  0000 C CNN
F 1 "470" V 7384 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 7430 3350 50  0001 C CNN
F 3 "~" H 7500 3350 50  0001 C CNN
	1    7500 3350
	0    1    1    0   
$EndComp
Text GLabel 7350 2800 0    50   Input ~ 0
VCC
$Comp
L Connector_Generic:Conn_01x02 J16
U 1 1 62FAC7FE
P 8050 3050
F 0 "J16" H 8130 3042 50  0000 L CNN
F 1 "Conn_01x02" H 8130 2951 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Horizontal" H 8050 3050 50  0001 C CNN
F 3 "~" H 8050 3050 50  0001 C CNN
	1    8050 3050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7750 3750 7750 3850
Wire Wire Line
	7350 2800 7750 2800
Wire Wire Line
	7750 2800 7750 2950
Wire Wire Line
	7650 3350 7750 3350
Wire Wire Line
	7750 3350 7750 3250
Wire Wire Line
	7750 3350 7750 3450
Connection ~ 7750 3350
Wire Wire Line
	7750 3350 8050 3350
Wire Wire Line
	8050 3350 8050 3250
Wire Wire Line
	8150 3850 7750 3850
$Comp
L Diode:BZX84Cxx D18
U 1 1 62FAC812
P 7750 3600
F 0 "D18" V 7704 3680 50  0000 L CNN
F 1 "BZX84C3V6" V 7850 3150 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 7750 3425 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 7750 3600 50  0001 C CNN
	1    7750 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	8150 3250 8150 3850
Wire Wire Line
	7350 3350 7250 3350
Text GLabel 7350 3850 0    50   Input ~ 0
GND
Wire Wire Line
	7750 3850 7350 3850
Connection ~ 7750 3850
$Comp
L Device:R R33
U 1 1 62FC1769
P 7750 1400
F 0 "R33" H 7820 1446 50  0000 L CNN
F 1 "680" H 7820 1355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 7680 1400 50  0001 C CNN
F 3 "~" H 7750 1400 50  0001 C CNN
	1    7750 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R30
U 1 1 62FC1773
P 7500 1650
F 0 "R30" V 7293 1650 50  0000 C CNN
F 1 "470" V 7384 1650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 7430 1650 50  0001 C CNN
F 3 "~" H 7500 1650 50  0001 C CNN
	1    7500 1650
	0    1    1    0   
$EndComp
Text GLabel 7350 1100 0    50   Input ~ 0
VCC
$Comp
L Connector_Generic:Conn_01x02 J15
U 1 1 62FC177E
P 8050 1350
F 0 "J15" H 8130 1342 50  0000 L CNN
F 1 "Conn_01x02" H 8130 1251 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Horizontal" H 8050 1350 50  0001 C CNN
F 3 "~" H 8050 1350 50  0001 C CNN
	1    8050 1350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7750 2050 7750 2150
Wire Wire Line
	7350 1100 7750 1100
Wire Wire Line
	7750 1100 7750 1250
Wire Wire Line
	7650 1650 7750 1650
Wire Wire Line
	7750 1650 7750 1550
Wire Wire Line
	7750 1650 7750 1750
Connection ~ 7750 1650
Wire Wire Line
	7750 1650 8050 1650
Wire Wire Line
	8050 1650 8050 1550
Wire Wire Line
	8150 2150 7750 2150
$Comp
L Diode:BZX84Cxx D17
U 1 1 62FC1792
P 7750 1900
F 0 "D17" V 7704 1980 50  0000 L CNN
F 1 "BZX84C3V6" V 7850 1450 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 7750 1725 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 7750 1900 50  0001 C CNN
	1    7750 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	8150 1550 8150 2150
Wire Wire Line
	7350 1650 7250 1650
Text GLabel 7350 2150 0    50   Input ~ 0
GND
Wire Wire Line
	7750 2150 7350 2150
Connection ~ 7750 2150
$Comp
L Device:R R15
U 1 1 62FEB5B5
P 2300 3100
F 0 "R15" H 2370 3146 50  0000 L CNN
F 1 "680" H 2370 3055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2230 3100 50  0001 C CNN
F 3 "~" H 2300 3100 50  0001 C CNN
	1    2300 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 62FEB5BF
P 2050 3350
F 0 "R11" V 1843 3350 50  0000 C CNN
F 1 "470" V 1934 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1980 3350 50  0001 C CNN
F 3 "~" H 2050 3350 50  0001 C CNN
	1    2050 3350
	0    1    1    0   
$EndComp
Text GLabel 1900 2800 0    50   Input ~ 0
VCC
$Comp
L Connector_Generic:Conn_01x02 J6
U 1 1 62FEB5CA
P 2600 3050
F 0 "J6" H 2680 3042 50  0000 L CNN
F 1 "Conn_01x02" H 2680 2951 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Horizontal" H 2600 3050 50  0001 C CNN
F 3 "~" H 2600 3050 50  0001 C CNN
	1    2600 3050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2300 3750 2300 3850
Wire Wire Line
	1900 2800 2300 2800
Wire Wire Line
	2300 2800 2300 2950
Wire Wire Line
	2200 3350 2300 3350
Wire Wire Line
	2300 3350 2300 3250
Wire Wire Line
	2300 3350 2300 3450
Connection ~ 2300 3350
Wire Wire Line
	2300 3350 2600 3350
Wire Wire Line
	2600 3350 2600 3250
Wire Wire Line
	2700 3850 2300 3850
$Comp
L Diode:BZX84Cxx D8
U 1 1 62FEB5DE
P 2300 3600
F 0 "D8" V 2254 3680 50  0000 L CNN
F 1 "BZX84C3V6" V 2400 3150 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 2300 3425 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 2300 3600 50  0001 C CNN
	1    2300 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	2700 3250 2700 3850
Wire Wire Line
	1900 3350 1800 3350
Text GLabel 1900 3850 0    50   Input ~ 0
GND
Wire Wire Line
	2300 3850 1900 3850
Connection ~ 2300 3850
Wire Wire Line
	10000 3200 10000 3850
Wire Wire Line
	9600 3850 9200 3850
Connection ~ 9600 3850
Wire Wire Line
	10000 1500 10000 2150
Wire Wire Line
	9600 2150 9200 2150
Connection ~ 9600 2150
Wire Wire Line
	6350 1500 6350 2150
Wire Wire Line
	6350 3200 6350 3850
Wire Wire Line
	4400 1500 4400 2150
Wire Wire Line
	4400 3200 4400 3850
Wire Wire Line
	4400 4750 4400 5400
Wire Wire Line
	2700 1500 2700 2150
Text HLabel 1800 4900 0    50   Output ~ 0
L3
$Comp
L Device:R R16
U 1 1 62A61410
P 2300 4650
F 0 "R16" H 2370 4696 50  0000 L CNN
F 1 "680" H 2370 4605 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2230 4650 50  0001 C CNN
F 3 "~" H 2300 4650 50  0001 C CNN
	1    2300 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 62A6141A
P 2050 4900
F 0 "R12" V 1843 4900 50  0000 C CNN
F 1 "470" V 1934 4900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1980 4900 50  0001 C CNN
F 3 "~" H 2050 4900 50  0001 C CNN
	1    2050 4900
	0    1    1    0   
$EndComp
Text GLabel 1900 4400 0    50   Input ~ 0
VCC
$Comp
L Connector_Generic:Conn_01x02 J7
U 1 1 62A61425
P 2600 4550
F 0 "J7" H 2680 4542 50  0000 L CNN
F 1 "Conn_01x02" H 2680 4451 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Horizontal" H 2600 4550 50  0001 C CNN
F 3 "~" H 2600 4550 50  0001 C CNN
	1    2600 4550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1900 4400 2300 4400
Wire Wire Line
	2300 4400 2300 4500
Wire Wire Line
	2200 4900 2300 4900
Wire Wire Line
	2300 4900 2300 4800
Connection ~ 2300 4900
Wire Wire Line
	2300 4900 2600 4900
Wire Wire Line
	2600 4900 2600 4750
Wire Wire Line
	1900 4900 1800 4900
$Comp
L Diode:BZX84Cxx D9
U 1 1 62A61437
P 2300 5150
F 0 "D9" V 2254 5230 50  0000 L CNN
F 1 "BZX84C3V6" V 2400 4700 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 2300 4975 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 2300 5150 50  0001 C CNN
	1    2300 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	2300 4900 2300 5000
Wire Wire Line
	2300 5300 2300 5400
Connection ~ 2300 5400
Wire Wire Line
	2300 5400 2700 5400
Text GLabel 1900 5400 0    50   Input ~ 0
GND
Wire Wire Line
	2300 5400 1900 5400
$Comp
L Device:R R17
U 1 1 62A61447
P 2300 6350
F 0 "R17" H 2370 6396 50  0000 L CNN
F 1 "680" H 2370 6305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2230 6350 50  0001 C CNN
F 3 "~" H 2300 6350 50  0001 C CNN
	1    2300 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 62A61451
P 2050 6600
F 0 "R13" V 1843 6600 50  0000 C CNN
F 1 "470" V 1934 6600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1980 6600 50  0001 C CNN
F 3 "~" H 2050 6600 50  0001 C CNN
	1    2050 6600
	0    1    1    0   
$EndComp
Text GLabel 1900 6050 0    50   Input ~ 0
VCC
$Comp
L Connector_Generic:Conn_01x02 J8
U 1 1 62A6145C
P 2600 6300
F 0 "J8" H 2680 6292 50  0000 L CNN
F 1 "Conn_01x02" H 2680 6201 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Horizontal" H 2600 6300 50  0001 C CNN
F 3 "~" H 2600 6300 50  0001 C CNN
	1    2600 6300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2300 7000 2300 7100
Wire Wire Line
	1900 6050 2300 6050
Wire Wire Line
	2300 6050 2300 6200
Wire Wire Line
	2200 6600 2300 6600
Wire Wire Line
	2300 6600 2300 6500
Wire Wire Line
	2300 6600 2300 6700
Connection ~ 2300 6600
Wire Wire Line
	2300 6600 2600 6600
Wire Wire Line
	2600 6600 2600 6500
Wire Wire Line
	2700 7100 2300 7100
$Comp
L Diode:BZX84Cxx D10
U 1 1 62A61470
P 2300 6850
F 0 "D10" V 2254 6930 50  0000 L CNN
F 1 "BZX84C3V6" V 2400 6400 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 2300 6675 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 2300 6850 50  0001 C CNN
	1    2300 6850
	0    1    1    0   
$EndComp
Wire Wire Line
	2700 6500 2700 7100
Wire Wire Line
	1900 6600 1800 6600
Text GLabel 1900 7100 0    50   Input ~ 0
GND
Wire Wire Line
	2300 7100 1900 7100
Connection ~ 2300 7100
Wire Wire Line
	2700 4750 2700 5400
Text HLabel 1800 6600 0    50   Output ~ 0
R3
Text Notes 3850 7150 0    50   ~ 0
NOTE : Tout a été testé en 3,3V et 5V\nTout est OK
Text Notes 3550 6500 0    50   ~ 0
VCC 5v / Zener 3V6\n\nBouton ouvert : 3,38V\nBouton fermé : 0V\nuC OK
Text Notes 5050 6500 0    50   ~ 0
VCC 3.3v / Zener 3V6\n\nBouton ouvert : 2,9V\nBouton fermé : 0V\nuC OK
Text Notes 8150 6250 0    50   ~ 0
NOTE : 680R est un compromis pour polariser a\nminima à 5mA la diode Zener (Iz)
$EndSCHEMATC
