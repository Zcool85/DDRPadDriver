EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
Title "LED driver"
Date "2022-03-05"
Rev "1.0"
Comp "Cool Inc."
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74xx:74HC595 U3
U 1 1 62667960
P 2200 2250
F 0 "U3" H 2200 3031 50  0000 C CNN
F 1 "74HC595" H 2200 2940 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 2200 2250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 2200 2250 50  0001 C CNN
	1    2200 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 2750 2600 2750
Text GLabel 2200 1350 1    50   Input ~ 0
VCC
Text GLabel 2200 3150 3    50   Input ~ 0
GND
Wire Wire Line
	2200 1350 2200 1650
Wire Wire Line
	2200 2950 2200 3050
Text HLabel 1400 1850 0    50   Input ~ 0
SHIFT_SER
Text HLabel 1400 2050 0    50   Input ~ 0
SHIFT_CLK
Text HLabel 1400 2150 0    50   Input ~ 0
~SHIFT_CLR~
Text HLabel 1400 2350 0    50   Input ~ 0
SHIFT_RCK
Wire Wire Line
	1400 1850 1800 1850
Wire Wire Line
	1800 2050 1400 2050
Wire Wire Line
	1400 2150 1800 2150
Wire Wire Line
	1800 2350 1400 2350
Wire Wire Line
	1650 2450 1800 2450
Text Label 2850 1850 0    50   ~ 0
LED-UL
Text Label 2850 1950 0    50   ~ 0
LED-U
Text Label 2850 2050 0    50   ~ 0
LED-UR
Text Label 2850 2150 0    50   ~ 0
LED-L
Text Label 2850 2250 0    50   ~ 0
LED-R
Text Label 2850 2350 0    50   ~ 0
LED-BL
Text Label 2850 2450 0    50   ~ 0
LED-B
Text Label 2850 2550 0    50   ~ 0
LED-BR
Text Notes 2550 1450 0    50   ~ 0
35mA / pin ABSOLUTE MAX
$Comp
L Isolator:SFH620A-2X007T U?
U 1 1 6267B494
P 8800 1800
AR Path="/62226A50/6267B494" Ref="U?"  Part="1" 
AR Path="/62582603/6267B494" Ref="U8"  Part="1" 
F 0 "U8" H 8800 2167 50  0000 C CNN
F 1 "SFH620A-2X007T" H 8800 2076 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W9.53mm_Clearance8mm" H 8800 1400 50  0001 C CNN
F 3 "http://www.vishay.com/docs/83675/sfh620a.pdf" H 8800 1800 50  0001 C CNN
	1    8800 1800
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BCP56 Q?
U 1 1 6267B49A
P 9900 1900
AR Path="/62226A50/6267B49A" Ref="Q?"  Part="1" 
AR Path="/62582603/6267B49A" Ref="Q7"  Part="1" 
F 0 "Q7" H 10091 1946 50  0000 L CNN
F 1 "BCP56" H 10091 1855 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 10100 1825 50  0001 L CIN
F 3 "http://cache.nxp.com/documents/data_sheet/BCP56_BCX56_BC56PA.pdf?pspll=1" H 9900 1900 50  0001 L CNN
	1    9900 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6267B4A0
P 9350 1900
AR Path="/62226A50/6267B4A0" Ref="R?"  Part="1" 
AR Path="/62582603/6267B4A0" Ref="R60"  Part="1" 
F 0 "R60" V 9450 1900 50  0000 C CNN
F 1 "1K" V 9350 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9280 1900 50  0001 C CNN
F 3 "~" H 9350 1900 50  0001 C CNN
	1    9350 1900
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 6267B4A6
P 9600 2150
AR Path="/62226A50/6267B4A6" Ref="R?"  Part="1" 
AR Path="/62582603/6267B4A6" Ref="R63"  Part="1" 
F 0 "R63" H 9530 2104 50  0000 R CNN
F 1 "4K7" H 9530 2195 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9530 2150 50  0001 C CNN
F 3 "~" H 9600 2150 50  0001 C CNN
	1    9600 2150
	-1   0    0    1   
$EndComp
Text GLabel 9300 1700 2    50   Input ~ 0
12V
Wire Wire Line
	9100 1900 9200 1900
Wire Wire Line
	9500 1900 9600 1900
Wire Wire Line
	9600 2000 9600 1900
Connection ~ 9600 1900
Wire Wire Line
	9600 1900 9700 1900
Wire Wire Line
	10000 2100 10000 2400
Wire Wire Line
	9600 2300 9600 2400
Wire Wire Line
	9600 2400 10000 2400
Text GLabel 10150 2400 2    50   Input ~ 0
GND12V
Wire Wire Line
	10000 2400 10150 2400
Connection ~ 10000 2400
Wire Wire Line
	10150 1600 10000 1600
Wire Wire Line
	10000 1600 10000 1700
Wire Wire Line
	2600 1850 2850 1850
Wire Wire Line
	2850 1950 2600 1950
Wire Wire Line
	2600 2050 2850 2050
Wire Wire Line
	2850 2150 2600 2150
Wire Wire Line
	2600 2250 2850 2250
Wire Wire Line
	2850 2350 2600 2350
Wire Wire Line
	2600 2450 2850 2450
Wire Wire Line
	2850 2550 2600 2550
$Comp
L Device:R R?
U 1 1 6225D313
P 8200 1900
AR Path="/62226A50/6225D313" Ref="R?"  Part="1" 
AR Path="/62582603/6225D313" Ref="R57"  Part="1" 
F 0 "R57" V 8300 1900 50  0000 C CNN
F 1 "470" V 8200 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8130 1900 50  0001 C CNN
F 3 "~" H 8200 1900 50  0001 C CNN
	1    8200 1900
	0    1    1    0   
$EndComp
Text GLabel 7900 2050 3    50   Input ~ 0
GND
Wire Wire Line
	7850 1700 8500 1700
Wire Wire Line
	8500 1900 8350 1900
Wire Wire Line
	8050 1900 7900 1900
Wire Wire Line
	7900 1900 7900 2050
$Comp
L Isolator:SFH620A-2X007T U?
U 1 1 622646A4
P 8800 3200
AR Path="/62226A50/622646A4" Ref="U?"  Part="1" 
AR Path="/62582603/622646A4" Ref="U9"  Part="1" 
F 0 "U9" H 8800 3567 50  0000 C CNN
F 1 "SFH620A-2X007T" H 8800 3476 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W9.53mm_Clearance8mm" H 8800 2800 50  0001 C CNN
F 3 "http://www.vishay.com/docs/83675/sfh620a.pdf" H 8800 3200 50  0001 C CNN
	1    8800 3200
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BCP56 Q?
U 1 1 622646AE
P 9900 3300
AR Path="/62226A50/622646AE" Ref="Q?"  Part="1" 
AR Path="/62582603/622646AE" Ref="Q8"  Part="1" 
F 0 "Q8" H 10091 3346 50  0000 L CNN
F 1 "BCP56" H 10091 3255 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 10100 3225 50  0001 L CIN
F 3 "http://cache.nxp.com/documents/data_sheet/BCP56_BCX56_BC56PA.pdf?pspll=1" H 9900 3300 50  0001 L CNN
	1    9900 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 622646B8
P 9350 3300
AR Path="/62226A50/622646B8" Ref="R?"  Part="1" 
AR Path="/62582603/622646B8" Ref="R61"  Part="1" 
F 0 "R61" V 9450 3300 50  0000 C CNN
F 1 "1K" V 9350 3300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9280 3300 50  0001 C CNN
F 3 "~" H 9350 3300 50  0001 C CNN
	1    9350 3300
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 622646C2
P 9600 3550
AR Path="/62226A50/622646C2" Ref="R?"  Part="1" 
AR Path="/62582603/622646C2" Ref="R64"  Part="1" 
F 0 "R64" H 9530 3504 50  0000 R CNN
F 1 "4K7" H 9530 3595 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9530 3550 50  0001 C CNN
F 3 "~" H 9600 3550 50  0001 C CNN
	1    9600 3550
	-1   0    0    1   
$EndComp
Text GLabel 9300 3100 2    50   Input ~ 0
12V
Wire Wire Line
	9100 3300 9200 3300
Wire Wire Line
	9500 3300 9600 3300
Wire Wire Line
	9600 3400 9600 3300
Connection ~ 9600 3300
Wire Wire Line
	9600 3300 9700 3300
Wire Wire Line
	10000 3500 10000 3800
Wire Wire Line
	9600 3700 9600 3800
Wire Wire Line
	9600 3800 10000 3800
Text GLabel 10150 3800 2    50   Input ~ 0
GND12V
Wire Wire Line
	10000 3800 10150 3800
Connection ~ 10000 3800
Wire Wire Line
	10150 3000 10000 3000
Wire Wire Line
	10000 3000 10000 3100
$Comp
L Device:R R?
U 1 1 622646EB
P 8200 3300
AR Path="/62226A50/622646EB" Ref="R?"  Part="1" 
AR Path="/62582603/622646EB" Ref="R58"  Part="1" 
F 0 "R58" V 8300 3300 50  0000 C CNN
F 1 "470" V 8200 3300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8130 3300 50  0001 C CNN
F 3 "~" H 8200 3300 50  0001 C CNN
	1    8200 3300
	0    1    1    0   
$EndComp
Text GLabel 7900 3450 3    50   Input ~ 0
GND
Wire Wire Line
	7850 3100 8500 3100
Wire Wire Line
	8500 3300 8350 3300
Wire Wire Line
	8050 3300 7900 3300
Wire Wire Line
	7900 3300 7900 3450
$Comp
L Isolator:SFH620A-2X007T U?
U 1 1 6226C6B5
P 5500 1800
AR Path="/62226A50/6226C6B5" Ref="U?"  Part="1" 
AR Path="/62582603/6226C6B5" Ref="U5"  Part="1" 
F 0 "U5" H 5500 2167 50  0000 C CNN
F 1 "SFH620A-2X007T" H 5500 2076 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W9.53mm_Clearance8mm" H 5500 1400 50  0001 C CNN
F 3 "http://www.vishay.com/docs/83675/sfh620a.pdf" H 5500 1800 50  0001 C CNN
	1    5500 1800
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BCP56 Q?
U 1 1 6226C6BF
P 6600 1900
AR Path="/62226A50/6226C6BF" Ref="Q?"  Part="1" 
AR Path="/62582603/6226C6BF" Ref="Q4"  Part="1" 
F 0 "Q4" H 6791 1946 50  0000 L CNN
F 1 "BCP56" H 6791 1855 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 6800 1825 50  0001 L CIN
F 3 "http://cache.nxp.com/documents/data_sheet/BCP56_BCX56_BC56PA.pdf?pspll=1" H 6600 1900 50  0001 L CNN
	1    6600 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6226C6C9
P 6050 1900
AR Path="/62226A50/6226C6C9" Ref="R?"  Part="1" 
AR Path="/62582603/6226C6C9" Ref="R51"  Part="1" 
F 0 "R51" V 6150 1900 50  0000 C CNN
F 1 "1K" V 6050 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5980 1900 50  0001 C CNN
F 3 "~" H 6050 1900 50  0001 C CNN
	1    6050 1900
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 6226C6D3
P 6300 2150
AR Path="/62226A50/6226C6D3" Ref="R?"  Part="1" 
AR Path="/62582603/6226C6D3" Ref="R54"  Part="1" 
F 0 "R54" H 6230 2104 50  0000 R CNN
F 1 "4K7" H 6230 2195 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6230 2150 50  0001 C CNN
F 3 "~" H 6300 2150 50  0001 C CNN
	1    6300 2150
	-1   0    0    1   
$EndComp
Text GLabel 6000 1700 2    50   Input ~ 0
12V
Wire Wire Line
	5800 1900 5900 1900
Wire Wire Line
	6200 1900 6300 1900
Wire Wire Line
	6300 2000 6300 1900
Connection ~ 6300 1900
Wire Wire Line
	6300 1900 6400 1900
Wire Wire Line
	6700 2100 6700 2400
Wire Wire Line
	6300 2300 6300 2400
Wire Wire Line
	6300 2400 6700 2400
Wire Wire Line
	6000 1700 5800 1700
Text GLabel 6850 2400 2    50   Input ~ 0
GND12V
Wire Wire Line
	6700 2400 6850 2400
Connection ~ 6700 2400
Wire Wire Line
	6850 1600 6700 1600
Wire Wire Line
	6700 1600 6700 1700
$Comp
L Device:R R?
U 1 1 6226C6FC
P 4900 1900
AR Path="/62226A50/6226C6FC" Ref="R?"  Part="1" 
AR Path="/62582603/6226C6FC" Ref="R48"  Part="1" 
F 0 "R48" V 5000 1900 50  0000 C CNN
F 1 "470" V 4900 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4830 1900 50  0001 C CNN
F 3 "~" H 4900 1900 50  0001 C CNN
	1    4900 1900
	0    1    1    0   
$EndComp
Text GLabel 4600 2050 3    50   Input ~ 0
GND
Text Label 4550 1700 2    50   ~ 0
LED-UL
Wire Wire Line
	4550 1700 5200 1700
Wire Wire Line
	5200 1900 5050 1900
Wire Wire Line
	4750 1900 4600 1900
Wire Wire Line
	4600 1900 4600 2050
$Comp
L Isolator:SFH620A-2X007T U?
U 1 1 6226C70C
P 5500 3200
AR Path="/62226A50/6226C70C" Ref="U?"  Part="1" 
AR Path="/62582603/6226C70C" Ref="U6"  Part="1" 
F 0 "U6" H 5500 3567 50  0000 C CNN
F 1 "SFH620A-2X007T" H 5500 3476 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W9.53mm_Clearance8mm" H 5500 2800 50  0001 C CNN
F 3 "http://www.vishay.com/docs/83675/sfh620a.pdf" H 5500 3200 50  0001 C CNN
	1    5500 3200
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BCP56 Q?
U 1 1 6226C716
P 6600 3300
AR Path="/62226A50/6226C716" Ref="Q?"  Part="1" 
AR Path="/62582603/6226C716" Ref="Q5"  Part="1" 
F 0 "Q5" H 6791 3346 50  0000 L CNN
F 1 "BCP56" H 6791 3255 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 6800 3225 50  0001 L CIN
F 3 "http://cache.nxp.com/documents/data_sheet/BCP56_BCX56_BC56PA.pdf?pspll=1" H 6600 3300 50  0001 L CNN
	1    6600 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6226C720
P 6050 3300
AR Path="/62226A50/6226C720" Ref="R?"  Part="1" 
AR Path="/62582603/6226C720" Ref="R52"  Part="1" 
F 0 "R52" V 6150 3300 50  0000 C CNN
F 1 "1K" V 6050 3300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5980 3300 50  0001 C CNN
F 3 "~" H 6050 3300 50  0001 C CNN
	1    6050 3300
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 6226C72A
P 6300 3550
AR Path="/62226A50/6226C72A" Ref="R?"  Part="1" 
AR Path="/62582603/6226C72A" Ref="R55"  Part="1" 
F 0 "R55" H 6230 3504 50  0000 R CNN
F 1 "4K7" H 6230 3595 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6230 3550 50  0001 C CNN
F 3 "~" H 6300 3550 50  0001 C CNN
	1    6300 3550
	-1   0    0    1   
$EndComp
Text GLabel 6000 3100 2    50   Input ~ 0
12V
Wire Wire Line
	5800 3300 5900 3300
Wire Wire Line
	6200 3300 6300 3300
Wire Wire Line
	6300 3400 6300 3300
Connection ~ 6300 3300
Wire Wire Line
	6300 3300 6400 3300
Wire Wire Line
	6700 3500 6700 3800
Wire Wire Line
	6300 3700 6300 3800
Wire Wire Line
	6300 3800 6700 3800
Text GLabel 6850 3800 2    50   Input ~ 0
GND12V
Wire Wire Line
	6700 3800 6850 3800
Connection ~ 6700 3800
Wire Wire Line
	6850 3000 6700 3000
Wire Wire Line
	6700 3000 6700 3100
$Comp
L Device:R R?
U 1 1 6226C753
P 4900 3300
AR Path="/62226A50/6226C753" Ref="R?"  Part="1" 
AR Path="/62582603/6226C753" Ref="R49"  Part="1" 
F 0 "R49" V 5000 3300 50  0000 C CNN
F 1 "470" V 4900 3300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4830 3300 50  0001 C CNN
F 3 "~" H 4900 3300 50  0001 C CNN
	1    4900 3300
	0    1    1    0   
$EndComp
Text GLabel 4600 3450 3    50   Input ~ 0
GND
Wire Wire Line
	4550 3100 5200 3100
Wire Wire Line
	5200 3300 5050 3300
Wire Wire Line
	4750 3300 4600 3300
Wire Wire Line
	4600 3300 4600 3450
$Comp
L Isolator:SFH620A-2X007T U?
U 1 1 6227D3BE
P 8800 4600
AR Path="/62226A50/6227D3BE" Ref="U?"  Part="1" 
AR Path="/62582603/6227D3BE" Ref="U10"  Part="1" 
F 0 "U10" H 8800 4967 50  0000 C CNN
F 1 "SFH620A-2X007T" H 8800 4876 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W9.53mm_Clearance8mm" H 8800 4200 50  0001 C CNN
F 3 "http://www.vishay.com/docs/83675/sfh620a.pdf" H 8800 4600 50  0001 C CNN
	1    8800 4600
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BCP56 Q?
U 1 1 6227D3C8
P 9900 4700
AR Path="/62226A50/6227D3C8" Ref="Q?"  Part="1" 
AR Path="/62582603/6227D3C8" Ref="Q9"  Part="1" 
F 0 "Q9" H 10091 4746 50  0000 L CNN
F 1 "BCP56" H 10091 4655 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 10100 4625 50  0001 L CIN
F 3 "http://cache.nxp.com/documents/data_sheet/BCP56_BCX56_BC56PA.pdf?pspll=1" H 9900 4700 50  0001 L CNN
	1    9900 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6227D3D2
P 9350 4700
AR Path="/62226A50/6227D3D2" Ref="R?"  Part="1" 
AR Path="/62582603/6227D3D2" Ref="R62"  Part="1" 
F 0 "R62" V 9450 4700 50  0000 C CNN
F 1 "1K" V 9350 4700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9280 4700 50  0001 C CNN
F 3 "~" H 9350 4700 50  0001 C CNN
	1    9350 4700
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 6227D3DC
P 9600 4950
AR Path="/62226A50/6227D3DC" Ref="R?"  Part="1" 
AR Path="/62582603/6227D3DC" Ref="R65"  Part="1" 
F 0 "R65" H 9530 4904 50  0000 R CNN
F 1 "4K7" H 9530 4995 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9530 4950 50  0001 C CNN
F 3 "~" H 9600 4950 50  0001 C CNN
	1    9600 4950
	-1   0    0    1   
$EndComp
Text GLabel 9300 4500 2    50   Input ~ 0
12V
Wire Wire Line
	9100 4700 9200 4700
Wire Wire Line
	9500 4700 9600 4700
Wire Wire Line
	9600 4800 9600 4700
Connection ~ 9600 4700
Wire Wire Line
	9600 4700 9700 4700
Wire Wire Line
	10000 4900 10000 5200
Wire Wire Line
	9600 5100 9600 5200
Wire Wire Line
	9600 5200 10000 5200
Text GLabel 10150 5200 2    50   Input ~ 0
GND12V
Wire Wire Line
	10000 5200 10150 5200
Connection ~ 10000 5200
Wire Wire Line
	10150 4400 10000 4400
Wire Wire Line
	10000 4400 10000 4500
$Comp
L Device:R R?
U 1 1 6227D405
P 8200 4700
AR Path="/62226A50/6227D405" Ref="R?"  Part="1" 
AR Path="/62582603/6227D405" Ref="R59"  Part="1" 
F 0 "R59" V 8300 4700 50  0000 C CNN
F 1 "470" V 8200 4700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8130 4700 50  0001 C CNN
F 3 "~" H 8200 4700 50  0001 C CNN
	1    8200 4700
	0    1    1    0   
$EndComp
Text GLabel 7900 4850 3    50   Input ~ 0
GND
Wire Wire Line
	7850 4500 8500 4500
Wire Wire Line
	8500 4700 8350 4700
Wire Wire Line
	8050 4700 7900 4700
Wire Wire Line
	7900 4700 7900 4850
$Comp
L Isolator:SFH620A-2X007T U?
U 1 1 6227D415
P 5500 4600
AR Path="/62226A50/6227D415" Ref="U?"  Part="1" 
AR Path="/62582603/6227D415" Ref="U7"  Part="1" 
F 0 "U7" H 5500 4967 50  0000 C CNN
F 1 "SFH620A-2X007T" H 5500 4876 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W9.53mm_Clearance8mm" H 5500 4200 50  0001 C CNN
F 3 "http://www.vishay.com/docs/83675/sfh620a.pdf" H 5500 4600 50  0001 C CNN
	1    5500 4600
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BCP56 Q?
U 1 1 6227D41F
P 6600 4700
AR Path="/62226A50/6227D41F" Ref="Q?"  Part="1" 
AR Path="/62582603/6227D41F" Ref="Q6"  Part="1" 
F 0 "Q6" H 6791 4746 50  0000 L CNN
F 1 "BCP56" H 6791 4655 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 6800 4625 50  0001 L CIN
F 3 "http://cache.nxp.com/documents/data_sheet/BCP56_BCX56_BC56PA.pdf?pspll=1" H 6600 4700 50  0001 L CNN
	1    6600 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6227D429
P 6050 4700
AR Path="/62226A50/6227D429" Ref="R?"  Part="1" 
AR Path="/62582603/6227D429" Ref="R53"  Part="1" 
F 0 "R53" V 6150 4700 50  0000 C CNN
F 1 "1K" V 6050 4700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5980 4700 50  0001 C CNN
F 3 "~" H 6050 4700 50  0001 C CNN
	1    6050 4700
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 6227D433
P 6300 4950
AR Path="/62226A50/6227D433" Ref="R?"  Part="1" 
AR Path="/62582603/6227D433" Ref="R56"  Part="1" 
F 0 "R56" H 6230 4904 50  0000 R CNN
F 1 "4K7" H 6230 4995 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6230 4950 50  0001 C CNN
F 3 "~" H 6300 4950 50  0001 C CNN
	1    6300 4950
	-1   0    0    1   
$EndComp
Text GLabel 6000 4500 2    50   Input ~ 0
12V
Wire Wire Line
	5800 4700 5900 4700
Wire Wire Line
	6200 4700 6300 4700
Wire Wire Line
	6300 4800 6300 4700
Connection ~ 6300 4700
Wire Wire Line
	6300 4700 6400 4700
Wire Wire Line
	6700 4900 6700 5200
Wire Wire Line
	6300 5100 6300 5200
Wire Wire Line
	6300 5200 6700 5200
Text GLabel 6850 5200 2    50   Input ~ 0
GND12V
Wire Wire Line
	6700 5200 6850 5200
Connection ~ 6700 5200
Wire Wire Line
	6850 4400 6700 4400
Wire Wire Line
	6700 4400 6700 4500
$Comp
L Device:R R?
U 1 1 6227D45C
P 4900 4700
AR Path="/62226A50/6227D45C" Ref="R?"  Part="1" 
AR Path="/62582603/6227D45C" Ref="R50"  Part="1" 
F 0 "R50" V 5000 4700 50  0000 C CNN
F 1 "470" V 4900 4700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4830 4700 50  0001 C CNN
F 3 "~" H 4900 4700 50  0001 C CNN
	1    4900 4700
	0    1    1    0   
$EndComp
Text GLabel 4600 4850 3    50   Input ~ 0
GND
Wire Wire Line
	4550 4500 5200 4500
Wire Wire Line
	5200 4700 5050 4700
Wire Wire Line
	4750 4700 4600 4700
Wire Wire Line
	4600 4700 4600 4850
$Comp
L Isolator:SFH620A-2X007T U?
U 1 1 622C155E
P 2150 4600
AR Path="/62226A50/622C155E" Ref="U?"  Part="1" 
AR Path="/62582603/622C155E" Ref="U2"  Part="1" 
F 0 "U2" H 2150 4967 50  0000 C CNN
F 1 "SFH620A-2X007T" H 2150 4876 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W9.53mm_Clearance8mm" H 2150 4200 50  0001 C CNN
F 3 "http://www.vishay.com/docs/83675/sfh620a.pdf" H 2150 4600 50  0001 C CNN
	1    2150 4600
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BCP56 Q?
U 1 1 622C1568
P 3250 4700
AR Path="/62226A50/622C1568" Ref="Q?"  Part="1" 
AR Path="/62582603/622C1568" Ref="Q2"  Part="1" 
F 0 "Q2" H 3441 4746 50  0000 L CNN
F 1 "BCP56" H 3441 4655 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 3450 4625 50  0001 L CIN
F 3 "http://cache.nxp.com/documents/data_sheet/BCP56_BCX56_BC56PA.pdf?pspll=1" H 3250 4700 50  0001 L CNN
	1    3250 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 622C1572
P 2700 4700
AR Path="/62226A50/622C1572" Ref="R?"  Part="1" 
AR Path="/62582603/622C1572" Ref="R43"  Part="1" 
F 0 "R43" V 2800 4700 50  0000 C CNN
F 1 "1K" V 2700 4700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2630 4700 50  0001 C CNN
F 3 "~" H 2700 4700 50  0001 C CNN
	1    2700 4700
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 622C157C
P 2950 4950
AR Path="/62226A50/622C157C" Ref="R?"  Part="1" 
AR Path="/62582603/622C157C" Ref="R44"  Part="1" 
F 0 "R44" H 2880 4904 50  0000 R CNN
F 1 "4K7" H 2880 4995 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2880 4950 50  0001 C CNN
F 3 "~" H 2950 4950 50  0001 C CNN
	1    2950 4950
	-1   0    0    1   
$EndComp
Text GLabel 2650 4500 2    50   Input ~ 0
12V
Wire Wire Line
	2450 4700 2550 4700
Wire Wire Line
	2850 4700 2950 4700
Wire Wire Line
	2950 4800 2950 4700
Connection ~ 2950 4700
Wire Wire Line
	2950 4700 3050 4700
Wire Wire Line
	3350 4900 3350 5200
Wire Wire Line
	2950 5100 2950 5200
Wire Wire Line
	2950 5200 3350 5200
Text GLabel 3500 5200 2    50   Input ~ 0
GND12V
Wire Wire Line
	3350 5200 3500 5200
Connection ~ 3350 5200
Wire Wire Line
	3500 4400 3350 4400
Wire Wire Line
	3350 4400 3350 4500
$Comp
L Device:R R?
U 1 1 622C15A5
P 1550 4700
AR Path="/62226A50/622C15A5" Ref="R?"  Part="1" 
AR Path="/62582603/622C15A5" Ref="R42"  Part="1" 
F 0 "R42" V 1650 4700 50  0000 C CNN
F 1 "470" V 1550 4700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1480 4700 50  0001 C CNN
F 3 "~" H 1550 4700 50  0001 C CNN
	1    1550 4700
	0    1    1    0   
$EndComp
Text GLabel 1250 4850 3    50   Input ~ 0
GND
Wire Wire Line
	1200 4500 1850 4500
Wire Wire Line
	1850 4700 1700 4700
Wire Wire Line
	1400 4700 1250 4700
Wire Wire Line
	1250 4700 1250 4850
$Comp
L Isolator:SFH620A-2X007T U?
U 1 1 622C15B5
P 2150 6350
AR Path="/62226A50/622C15B5" Ref="U?"  Part="1" 
AR Path="/62582603/622C15B5" Ref="U4"  Part="1" 
F 0 "U4" H 2150 6717 50  0000 C CNN
F 1 "SFH620A-2X007T" H 2150 6626 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W9.53mm_Clearance8mm" H 2150 5950 50  0001 C CNN
F 3 "http://www.vishay.com/docs/83675/sfh620a.pdf" H 2150 6350 50  0001 C CNN
	1    2150 6350
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BCP56 Q?
U 1 1 622C15BF
P 3250 6450
AR Path="/62226A50/622C15BF" Ref="Q?"  Part="1" 
AR Path="/62582603/622C15BF" Ref="Q3"  Part="1" 
F 0 "Q3" H 3441 6496 50  0000 L CNN
F 1 "BCP56" H 3441 6405 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 3450 6375 50  0001 L CIN
F 3 "http://cache.nxp.com/documents/data_sheet/BCP56_BCX56_BC56PA.pdf?pspll=1" H 3250 6450 50  0001 L CNN
	1    3250 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 622C15C9
P 2700 6450
AR Path="/62226A50/622C15C9" Ref="R?"  Part="1" 
AR Path="/62582603/622C15C9" Ref="R46"  Part="1" 
F 0 "R46" V 2800 6450 50  0000 C CNN
F 1 "1K" V 2700 6450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2630 6450 50  0001 C CNN
F 3 "~" H 2700 6450 50  0001 C CNN
	1    2700 6450
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 622C15D3
P 2950 6700
AR Path="/62226A50/622C15D3" Ref="R?"  Part="1" 
AR Path="/62582603/622C15D3" Ref="R47"  Part="1" 
F 0 "R47" H 2880 6654 50  0000 R CNN
F 1 "4K7" H 2880 6745 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2880 6700 50  0001 C CNN
F 3 "~" H 2950 6700 50  0001 C CNN
	1    2950 6700
	-1   0    0    1   
$EndComp
Text GLabel 2650 6250 2    50   Input ~ 0
12V
Wire Wire Line
	2450 6450 2550 6450
Wire Wire Line
	2850 6450 2950 6450
Wire Wire Line
	2950 6550 2950 6450
Connection ~ 2950 6450
Wire Wire Line
	2950 6450 3050 6450
Wire Wire Line
	3350 6650 3350 6950
Wire Wire Line
	2950 6850 2950 6950
Wire Wire Line
	2950 6950 3350 6950
Text GLabel 3500 6950 2    50   Input ~ 0
GND12V
Wire Wire Line
	3350 6950 3500 6950
Connection ~ 3350 6950
Wire Wire Line
	3500 6150 3350 6150
Wire Wire Line
	3350 6150 3350 6250
$Comp
L Device:R R?
U 1 1 622C15FC
P 1550 6450
AR Path="/62226A50/622C15FC" Ref="R?"  Part="1" 
AR Path="/62582603/622C15FC" Ref="R45"  Part="1" 
F 0 "R45" V 1650 6450 50  0000 C CNN
F 1 "470" V 1550 6450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1480 6450 50  0001 C CNN
F 3 "~" H 1550 6450 50  0001 C CNN
	1    1550 6450
	0    1    1    0   
$EndComp
Text GLabel 1250 6600 3    50   Input ~ 0
GND
Wire Wire Line
	1200 6250 1850 6250
Wire Wire Line
	1850 6450 1700 6450
Wire Wire Line
	1400 6450 1250 6450
Wire Wire Line
	1250 6450 1250 6600
Text Label 7850 1700 2    50   ~ 0
LED-U
Text Label 4550 3100 2    50   ~ 0
LED-UR
Text Label 7850 3100 2    50   ~ 0
LED-L
Text Label 1200 4500 2    50   ~ 0
LED-R
Text Label 4550 4500 2    50   ~ 0
LED-BL
Text Label 7850 4500 2    50   ~ 0
LED-B
Text Label 1200 6250 2    50   ~ 0
LED-BR
Wire Wire Line
	2750 2750 2750 3050
Wire Wire Line
	2750 3050 2200 3050
Connection ~ 2200 3050
Wire Wire Line
	2200 3050 2200 3150
Wire Wire Line
	1650 2450 1650 3050
Wire Wire Line
	1650 3050 2200 3050
Text Notes 650  800  0    50   ~ 0
NOTE : Tout a ??t?? test?? en 3.3v et 5V\nTout est OK
$Comp
L Connector:Conn_01x08_Male J9
U 1 1 62DD6529
P 5300 6600
F 0 "J9" H 5272 6528 50  0000 R CNN
F 1 "Conn_01x08_Male" H 5272 6483 50  0001 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Horizontal" H 5300 6600 50  0001 C CNN
F 3 "~" H 5300 6600 50  0001 C CNN
	1    5300 6600
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Male J10
U 1 1 62DE4F81
P 6600 6600
F 0 "J10" H 6572 6528 50  0000 R CNN
F 1 "Conn_01x08_Male" H 6572 6483 50  0001 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Horizontal" H 6600 6600 50  0001 C CNN
F 3 "~" H 6600 6600 50  0001 C CNN
	1    6600 6600
	-1   0    0    -1  
$EndComp
Text GLabel 6000 5950 0    50   Input ~ 0
12V
Text GLabel 4700 5950 0    50   Input ~ 0
12V
Wire Wire Line
	6000 5950 6250 5950
Wire Wire Line
	4700 5950 4950 5950
Text Label 4700 6300 2    50   ~ 0
L-UP
Text Label 4700 6500 2    50   ~ 0
L-RIGHT
Text Label 4700 6700 2    50   ~ 0
L-DOWN
Text Label 4700 6900 2    50   ~ 0
L-LEFT
Text Label 6000 6300 2    50   ~ 0
L-CROSS
Text Label 6000 6500 2    50   ~ 0
L-CIRCLE
Text Label 6000 6700 2    50   ~ 0
L-SQUARE
Text Label 6000 6900 2    50   ~ 0
L-TRIANGLE
Wire Wire Line
	9100 1700 9300 1700
Wire Wire Line
	9100 3100 9300 3100
Wire Wire Line
	5800 3100 6000 3100
Wire Wire Line
	9100 4500 9300 4500
Wire Wire Line
	5800 4500 6000 4500
Wire Wire Line
	2450 4500 2650 4500
Wire Wire Line
	2450 6250 2650 6250
Text Label 10150 1600 0    50   ~ 0
L-UP
Text Label 3500 4400 0    50   ~ 0
L-RIGHT
Text Label 10150 4400 0    50   ~ 0
L-DOWN
Text Label 10150 3000 0    50   ~ 0
L-LEFT
Text Label 6850 1600 0    50   ~ 0
L-CROSS
Text Label 6850 3000 0    50   ~ 0
L-CIRCLE
Text Label 3500 6150 0    50   ~ 0
L-SQUARE
Text Label 6850 4400 0    50   ~ 0
L-TRIANGLE
Wire Wire Line
	4700 6300 5100 6300
Wire Wire Line
	4700 6500 5100 6500
Wire Wire Line
	4700 6700 5100 6700
Wire Wire Line
	4700 6900 5100 6900
Wire Wire Line
	4950 5950 4950 6400
Wire Wire Line
	4950 7000 5100 7000
Wire Wire Line
	5100 6800 4950 6800
Connection ~ 4950 6800
Wire Wire Line
	4950 6800 4950 7000
Wire Wire Line
	5100 6600 4950 6600
Connection ~ 4950 6600
Wire Wire Line
	4950 6600 4950 6800
Wire Wire Line
	5100 6400 4950 6400
Connection ~ 4950 6400
Wire Wire Line
	4950 6400 4950 6600
Wire Wire Line
	6000 6300 6400 6300
Wire Wire Line
	6000 6500 6400 6500
Wire Wire Line
	6000 6700 6400 6700
Wire Wire Line
	6000 6900 6400 6900
Wire Wire Line
	6250 5950 6250 6400
Wire Wire Line
	6250 7000 6400 7000
Wire Wire Line
	6400 6800 6250 6800
Connection ~ 6250 6800
Wire Wire Line
	6250 6800 6250 7000
Wire Wire Line
	6400 6600 6250 6600
Connection ~ 6250 6600
Wire Wire Line
	6250 6600 6250 6800
Wire Wire Line
	6400 6400 6250 6400
Connection ~ 6250 6400
Wire Wire Line
	6250 6400 6250 6600
$EndSCHEMATC
