# RPC-CLP-01 Experimenters' Computer Light Pen v1.00

Computer Light Pen Quick Specs:
------------------------------

Supply Voltage Vs: 3.0V to 15V
Output Voltage Vo: Vs + 0.5V

Supply Current Is: <50mA
Output Current Io: < 15mA per output

Total power consumption: <250mW at 5.0 supply

Operating frequency: Line sync <25kHz

Output rise time: <160ns at 5V supply
Output fall time: <60ns at 5V supply

Propagation delay from optical input:
 <420ns for active high output
 <280ns for active low output


Product Description:
-------------------
The light pen board is designed for home construction
hobbyists at intermediate to experienced level, having
a single, large-ish surface mount device, the remainder
of the components being through-hole mounted.

There is no case design supplied. It is suggested that
once built, the board is protected using a heat-shrink
tube, though a body may be improvised using a suitably
sized marker pen.

A potentiometer is provided to allow the sensitivity of
the photodetector to be adjusted.

Solder-bridge jumper pads are included to change the 
output polarity between active high and active low behaviour.
Most light pens are active low.

Historically, the most commonplace design of light pen was little 
more than a phototransistor (or even a photodiode) in a pen body
soldered directly to a resistor and 3 wires. The sensitivity and 
reliability of these was marginal to poor at best. Commercial devices
were somewhat better constructed, but generally provided only a small
improvement in sensitivity for the additional cost.


CAUTION
-------
Light pens are generally not compatible with LCD flat screen
displays. Image contrast may be too low for acceptable 
position detection. 

Contact between light pen and the display may damage the display 
irreparably.

Check to see what input voltage is required a the light pen port.
Generally these ports have TTL inputs and so the supply should be 
limited to 5V.

The speed of response of this device means two things - 
+ it is not suitable for use with modern, fast video interfaces.
+ the position response will be approximate at best.


Construction
------------
You will require a soldering iron with a small chisel or screwdriver 
tip and fine solder wire.

For the SMT chip, you will need a suitable solder paste blobbed onto 
the PCB solder pads before placement of the chip. The chip should be 
the first component placed and soldered. Pay particular attention as
this device will be difficult to remove or rework without damage if
you make any mistakes. Note that this device should be a SOIC16 type
as the TSSOP device is very difficult to hand solder.

The legs of the LTR-4206 phototransistor should be bent so that the 
body of the device sits in the notch at the narrow end of the PCB 
with the legs flush against the board. A small amount of epoxy 
adhesive will help to support the device. Mixing in some black 
pigment will improve the detection contrast.

The cable may be any suitable 4-core flex. Connection may be via a
right-angle Berg ( Du-Pont)connector or soldered directly to the 
board (strain relief holes are provided. A flat telephone handset 
cable will be most suitable in this instance.

The appropriate jumpers must be bridged using a blob of solder in 
order that any signal may be transmitted.

Cable pinout
------------
The cable at the PCB carries 4 voltages - +V, Ground, pen out and
button out.

At the computer end, you will need to check the light pen port pinout
as no two devices seem to use the same arrangement of pins.

Be aware that many o these connectors carry a +12V supply as well as 
the more useful +5V.

In the case of a PC, it is suggested that a 4-pin GX-12 aviation 
connector or a 4/6 pin mini DIN* connector be used, fitted to a suitably 
drilled ISA card slot bracket.

* These are the familiar PS/2 mouse/keyboard connectors that predated
the use of USB devices.


Software
--------

Examples are included for a DOS PC with an EGA card with light-pen 
port. Both MS BASIC and Assembler versions are available.

Whilst these examples were taken from an FT-156 install disc, they seem to be the same examples found on every website and installation
kit for CGA/EGA/HGA light pens.

The BASIC examples run under both GWBASIC and BASICA (tested in DOS 
Box on Windows 7) The programs are meaningless on any modern machine
which lacks even the hope of a light-pen port.

For 8- and 16- bit home computers, light pen examples may be found readily across the internet.


ARowan
Nov 2024
