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
    nop
    call keyboard_wait_clk
    in a,(IO_PIO_1_B_D) ;read data bit
    and 0x02
    jp nz, keyboard_read_fault  ;if startbit not 0 then fault
    ld b,0x80      ;b is buffer for input data
    ld c,0          ;parity counter
keyboard_read_loop:
    call keyboard_wait_clk
    in a,(IO_PIO_1_B_D) ;read data bit
    rrca        ;carry now contains the clock bit
    rrca        ;carry now contains the received bit
    jr nc, keyboard_read_loop_odd
    inc c   ;if positiv bit, incement parity counter
    scf
keyboard_read_loop_odd:
    ld a,b      ;load buffer in a
    rra         ;carry bit is now appended to buffer
    ld b,a      ;store a to buffer
    jp nc, keyboard_read_loop   ;repeat for 8 times
keyboard_read_parity:
    call keyboard_wait_clk      
    ld a,c  ;load parity counter to a and calculate parity
    rra     ;if bit1 is set -> odd # of 1s else even # of 1s
    jr c, keyboard_read_podd
    ;parity even
    in a,(IO_PIO_1_B_D) ;read parity bit
    and 0x02    ;test if parity bit is also even
    jr z, keyboard_read_fault
    jr keyboard_read_stop
keyboard_read_podd:
    ;parity odd
    in a,(IO_PIO_1_B_D) ;read parity bit
    and 0x02    ;test if parity bit is also odd
    jr nz, keyboard_read_fault
keyboard_read_stop:
    call keyboard_wait_clk    
    in a,(IO_PIO_1_B_D) ;read data bit
    and 0x02
    jp z, keyboard_read_fault  ;if stopbit not 1 then fault
    call keyboard_off
    ld a,b  ;else load buffer to a
    ret     ;and return

keyboard_read_fault:
    call keyboard_abort
    ;call keyboard_off
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

keyboard_wait_clk_low_only:             ;wait until low
    in a,(IO_PIO_1_B_D)             
    and 0x01
    jp nz,keyboard_wait_clk_low_only
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
    ld a,0x0C   ;deactivate clock pulldown
    out (IO_PIO_1_B_D),a
    ret
