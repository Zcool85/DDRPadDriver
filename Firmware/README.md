# Introduction

Firmware pour un microcontoller AVR © permettant de gérer un tapis de dance DDR.

Ce firmware permet de se branche en USB sur un PC, ou sur une console Playstation.

## Trucs et astuces

### Installation des toolkit AVR GCC

Cf. [Doc](https://github.com/osx-cross/homebrew-avr)

```sh
brew tap osx-cross/avr
brew install avr-gcc
```

### Programmer les fuses

Commande à lancer (via ll'usage d'un AVR ISP mk II) :

```sh
avrdude -C avrdude.conf -p m324p -P usb -c avrispmkII -U efuse:w:efuse.bin:r -U hfuse:w:hfuse.bin:r -U lfuse:w:lfuse.bin:r
avrdude -C avrdude.conf -p m324p -P usb -c stk600pp   -U efuse:w:efuse.bin:r -U hfuse:w:hfuse.bin:r -U lfuse:w:lfuse.bin:r
```

### Faire une réinitialisation d'un AVR via Parallel High-Voltage Programming

Le présent process est fonctionnel pour une carte de développement STK600.

Cf. [Documentation](http://ww1.microchip.com/downloads/en/devicedoc/40001904a.pdf)

#### Pour un ATtiny48-PU

Use STK600-RC028M-6 PCB
Use STK600-DIP PCB

Connect PROGCTRL cable
Connect PROGDATA cable

Mount VTARGET jumper
Mount RESET jumper

avrdude -C avrdude.conf -c stk600pp -p attiny48 -P usb -U lfuse:w:lfuse.bin:r -U hfuse:w:hfuse.bin:r -U efuse:w:efuse.bin:r

#### Pour un ATMega324p-20PU

Use STK600-RC040M-5 PCB
Use STK600-DIP PCB

Connect PROGCTRL cable
Connect PROGDATA cable

Mount VTARGET jumper
Mount RESET jumper

avrdude -C avrdude.conf -c stk600pp -p m324p -P usb -U lfuse:w:lfuse.bin:r -U hfuse:w:hfuse.bin:r -U efuse:w:efuse.bin:r

### Visualiser les données USART sous MacOS

```sh
sudo cu -s 115200 -l /dev/tty.usbserial-A9IM6MKT
```

NOTE : `~.` pour terminer la communication.

### Visualiser la liste des périphérique USB sur MacOS

```sh
ioreg -p IOUSB
```

### Tester un joystick sous Windows

```cmd
joy.cpl
```

Note sur les [pilotes Windows](https://www.raphnet-tech.com/support/testing/index_fr.php).
