
init:
    LD A,0x00
    LD B,0x00
loop1:
    ADD A,1
    JR NC, loop1
    halt