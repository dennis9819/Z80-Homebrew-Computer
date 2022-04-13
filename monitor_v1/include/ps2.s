;PS2 Implementation
;PIO1 Port C has PS2 Pins
;C/0 -> INPUT   CLK
;C/1 -> INPUT   DATA
;C/2 -> OUTPUT  CLK_LOW (ACTIVE_LOW)
;C/3 -> OUTPUT  DATA_LOW (ACTIVE_LOW)
;DATA and CLK are pulled high via 4.7k resistor
;C/4-7 are unused

keyboard_init:
    ld a, 0xCF  ;controll word: Set mode 3 (no interrupts)
    out (IO_PIO_1_B_C), a
    ld a, 0x03  ;bit mask: 1 and 2 input, rest output (I/!O)
    out (IO_PIO_1_B_C), a

    ld a, 0x0C  ;disable CLK_LOW, DATA_LOW pulldown (RX enable)
    out (IO_PIO_1_B_D), a
    call keyboard_off

    ret

; a contains result
keyboard_read:
    call keyboard_on
    call keyboard_wait_clk
    in a,(IO_PIO_1_B_D) ;read data bit
    and 0x02
    jp nz, keyboard_read_fault  ;if startbit not 0 then fault
    ld b,0      ;b is buffer for input data
    ld c,8      ;c is counter for data bytes
keyboard_read_loop:
    call keyboard_wait_clk
    in a,(IO_PIO_1_B_D) ;read data bit
    rrca        ;carry now contains the clock bit
    rrca        ;carry now contains the received bit
    ld a,b      ;load buffer in a
    rra         ;carry bit is now appended to buffer
    ld b,a      ;store a to buffer
    dec c       ;count chars
    jp nz, keyboard_read_loop   ;repeat for 8 times
keyboard_read_eol:
    call keyboard_wait_clk      ;ignore parity for now
    call keyboard_wait_clk    
    in a,(IO_PIO_1_B_D) ;read data bit
    and 0x02
    jp z, keyboard_read_fault  ;if stopbit not 1 then fault
    call keyboard_wait_clk_high_only
    nop
    nop
    nop
    nop
    call keyboard_off
    ld a,b  ;else load buffer to a
    ret     ;and return

keyboard_read_fault:
    call keyboard_abort
    ld a,0xFF
    ret

keyboard_wait_clk:         
keyboard_wait_clk_high:             ;wait until high
    in a,(IO_PIO_1_B_D)             
    and 0x01
    jp z,keyboard_wait_clk_high
keyboard_wait_clk_low:              ;wait until low
    in a,(IO_PIO_1_B_D)
    and 0x01
    jp nz,keyboard_wait_clk_low
    ret


keyboard_wait_clk_high_only:             ;wait until high
    in a,(IO_PIO_1_B_D)             
    and 0x01
    jp z,keyboard_wait_clk_high
    ret


keyboard_abort:
    push bc
    ld b,0
    ld c,1
    ld a,0x08   ;activate clock pulldown
    out (IO_PIO_1_B_D),a
    ld hl,11
keyboard_abort_delay:               ;35-T-States    = 105326.028571 loops per sec
                                    ;  = 0.00000949433 s/loop
    sbc hl,bc                       ;15 T-States
    nop                             ;4  T-States
    nop                             ;4  T-States
    jp nz, keyboard_abort_delay     ;12 T-States

    ld a,0x0C   ;deactivate clock pulldown
    out (IO_PIO_1_B_D),a
    pop bc
    ret


keyboard_off:
    ld a,0x08   ;activate clock pulldown
    out (IO_PIO_1_B_D),a
    ret

keyboard_on:
    ld a,0x0C   ;activate clock pulldown
    out (IO_PIO_1_B_D),a
    ret