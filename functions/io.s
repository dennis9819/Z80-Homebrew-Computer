; A contains Data
; C Contains Addr
AY0_WRITE_REG:
    LD B,A
    LD A,D
    OUT (IO_AY0_ADDR),A
    LD A,B
    OUT (IO_AY0_DATA),A
    RET

; Serial Util Functions
A_RTS_OFF:
    ld a,005h ;write into WR0: select WR5
    out (IO_SIO0B_C),A
    ld a,0E8h ;DTR active, TX 8bit, BREAK off, TX on, RTS inactive
    out (IO_SIO0B_C),A
    ret
A_RTS_ON:
    ld a,005h ;write into WR0: select WR5
    out (IO_SIO0B_C),A
    ld a,0EAh ;DTR active, TX 8bit, BREAK off, TX on, RTS active
    out (IO_SIO0B_C),A
    ret

RX_CHA_AVAILABLE:
    push AF ;backup AF

    LD A,0xFF
    OUT (IO_REG0),A

    call A_RTS_OFF
    in A,(IO_SIO0B_D) ;read RX character into A
    ; A holds received character
    ;do something with the received character
    ;echo character to host
    out (IO_SIO0B_D),A
    call TX_EMP
    ei ;see comments below
    call A_RTS_ON ;see comments below

    ;LD A,0x00
    ;OUT (IO_REG0),A

    pop AF ;restore AF
    Reti