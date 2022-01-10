# IOADDR

# PINOUT

Head1

    NC      CTC_CLK
    NC      NC
    NC      BUSACK
    NC      BUSREQ
    NC      RESET

1   A10     A9
2   A11     A8
3   A12     A6
4   A13     A5
5   A14     A4
6   A7      A3
7   RD      A2
8   WR      A1
9   INT     A0
10  NMI     D7
11  IOREQ   D6
12  MREQ    D5
13  M1      D4
14  RESET   D3
15  CLK     D2
16  WAIT    D1
17  IEI     D0



0b00100000








IC MEM-MUX
A14-> A0
A15-> A1
GND-> A3
G0 -> GND
G1 -> MREQ
G2 -> VCC


A14 A15 
0   0   0x0000-0x3FFF   ->  Y0
1   0   0x4000-0x7FFF   ->  Y1
0   1   0x8000-0xBFFF   ->  Y2
1   1   0xC000-0xFFFF   ->  Y3








3,686411MHz


1843205.5



115200 -> /2 



76800

3686411