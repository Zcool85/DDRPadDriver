# Instalation

Cf. [Doc](https://github.com/osx-cross/homebrew-avr)

```sh
brew tap osx-cross/avr
brew install avr-gcc
```

## Reset AVR (Parallel High-Voltage Programming)

Cf. [Documentation](http://ww1.microchip.com/downloads/en/devicedoc/40001904a.pdf)

### For ATtiny48-PU

Use STK600-RC028M-6 PCB
Use STK600-DIP PCB

Connect PROGCTRL cable
Connect PROGDATA cable

Mount VTARGET jumper
Mount RESET jumper

avrdude -C avrdude.conf -c stk600pp -p attiny48 -P usb -U lfuse:w:lfuse.bin:r -U hfuse:w:hfuse.bin:r -U efuse:w:efuse.bin:r


### For ATtiny48-PU

Use STK600-RC040M-5 PCB
Use STK600-DIP PCB

Connect PROGCTRL cable
Connect PROGDATA cable

Mount VTARGET jumper
Mount RESET jumper

avrdude -C avrdude.conf -c stk600pp -p m324p -P usb -U lfuse:w:lfuse.bin:r -U hfuse:w:hfuse.bin:r -U efuse:w:efuse.bin:r
