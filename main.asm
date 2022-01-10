
        org 0x0000
init:
        LD A,0x00
        LD B,0x00
loop1:
        ADD A,1
        JR NC, loop1
output:
        LD A,B
        OUT (0x20),A
        XOR 0xFF
        LD B,A
        LD A,0x00
        JR loop1
