
        org 0x0000
init:
        LD A,0x00
        LD IX,0x3000
        LD BC,0x01
loop1:
        ADD IX,BC
        JR NC, loop1
output:
        ;;LD A,B
        OUT (0x20),A
        XOR 0xFF
        ;;LD B,A
        LD IX,0x3000
        JR loop1
