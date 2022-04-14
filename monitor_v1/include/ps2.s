;PS2 Implementation
;PIO1 Port C has PS2 Pins
;C/0 -> INPUT   CLK
;C/1 -> INPUT   DATA
;C/2 -> OUTPUT  CLK_LOW (ACTIVE_LOW)
;C/3 -> OUTPUT  DATA_LOW (ACTIVE_LOW)
;DATA and CLK are pulled high via 4.7k resistor
;C/4-7 are unused

var_ps2_timeout equ var_ps2mem  ;16bit integer
var_ps2_state   equ var_ps2mem+2    ;8bit status code
var_ps2_led     equ var_ps2mem+3    ;8bit status code
var_ps2_err     equ var_ps2mem+4    ;8bit error code

ps2_err_timeout equ 0xD0
ps2_err_parity  equ 0xD1
ps2_err_unexpected equ 0xD2
ps2_ok          equ 0x00
;-------------------------------------------------------
; Wait for clock states
;-------------------------------------------------------
; Z-Flag is set if timeout
; Z-Flag is reset in level is detected

keyboard_wait_clk_high:             ;wait until high
    ld a,(var_ps2_timeout) 
    ld d,a
keyboard_wait_clk_high_loop:    ;39 T-States
    dec d                      ;increment loop counter  ;4  
    jr z, keyboard_wait_timout  ;if equal -> timout     ;7

    in a,(IO_PIO_1_B_D)         ;else continue wait     ;11
    and 0x01                                            ;7
    jp z,keyboard_wait_clk_high_loop                    ;10

    ;or 1    ;reset zero flag not needed because of jump condition
    ret

keyboard_wait_clk_low:             ;wait until high
    ld a,(var_ps2_timeout) 
    ld d,a
    
keyboard_wait_clk_low_loop:
    dec d                      ;increment loop counter  ;4  
    jr z, keyboard_wait_timout  ;if equal -> timout     ;7

    in a,(IO_PIO_1_B_D)         ;else continue wait
    and 0x01
    jp nz,keyboard_wait_clk_low_loop

    or 1    ;reset zero flag
    ret


keyboard_wait_timout:
    ld a, ps2_err_timeout
    ld (var_ps2_err),a
    cp a    ;set zero flag
    ret


keyboard_wait_clk_rising:
    call keyboard_wait_clk_low
    ret z
    call keyboard_wait_clk_high
    ret
keyboard_wait_clk_falling:
    call keyboard_wait_clk_high
    ret z
    call keyboard_wait_clk_low
    ret
;-------------------------------------------------------
; Keyboard initialization
;-------------------------------------------------------
keyboard_init_io:   ;called befor VDP init
    ld a, 0xCF  ;controll word: Set mode 3 (no interrupts)
    out (IO_PIO_1_B_C), a
    ld a, 0x03  ;bit mask: 1 and 2 input, rest output (I/!O)
    out (IO_PIO_1_B_C), a

    ld a, 0x00  ; CLK_LOW, DATA_LOW pulldown (RX enable)
    out (IO_PIO_1_B_D), a
    ret

keyboard_init:      ;called after VDP init
    xor a
    ld (var_ps2_state),a
    ld (var_ps2_err),a
    ld (var_ps2_led),a
    ld a,255
    ld (var_ps2_timeout),a

    ld a, 0xFF  ;Reset KB
    call keyboard_send_wrapper


keyboard_init_wait: ;wait until KB is ready
    call keyboard_read 
    cp 0xAA
    jr nz, keyboard_init_wait

    ;set leds
    ld a, 0xED 
    call keyboard_send_wrapper

    ld a, 0x04
    call keyboard_send_wrapper


keyboard_init_okay:
    call print_newLine
    ld hl, [STR_keyboard_init_okay]
    call print_str
    ret

keyboard_init_err:
    call print_newLine
    ld hl, [STR_keyboard_init_err]
    call print_str
    halt

STR_keyboard_init_okay:
    db "PS/2 Keyboard initialized.",0
STR_keyboard_init_err:
    db "PS/2 Keyboard error! System HALT!",0


;-------------------------------------------------------
; Keyboard Read
;-------------------------------------------------------

; a contains result
keyboard_read:
    xor a
    ld (var_ps2_err),a  ;reset error code
    call keyboard_on
    call keyboard_wait_clk_falling
    jp z, keyboard_read_null   ;timeout condition -> no message received
    in a,(IO_PIO_1_B_D) ;read data bit
    and 0x02
    jp nz, keyboard_read_fault_byte  ;if startbit not 0 then fault
    ld b,0x80      ;b is buffer for input data
    ld c,0          ;parity counter
keyboard_read_loop:
    call keyboard_wait_clk_falling
    jp z, keyboard_read_fault   ;timeout condition
    in a,(IO_PIO_1_B_D) ;read data bit
    rrca        ;carry now contains the clock bit
    rrca        ;carry now contains the received bit
    jr nc, keyboard_read_loop_odd
    inc c   ;if positiv bit, incement parity counter
    scf     ;preserver carry flag
keyboard_read_loop_odd:
    ld a,b      ;load buffer in a
    rra         ;carry bit is now appended to buffer
    ld b,a      ;store a to buffer
    jp nc, keyboard_read_loop   ;repeat for 8 times
keyboard_read_parity:
    call keyboard_wait_clk_falling
    jp z, keyboard_read_fault   ;timeout condition
    ld a,c  ;load parity counter to a and calculate parity
    rra     ;if bit1 is set -> odd # of 1s else even # of 1s
    jr c, keyboard_read_podd
    ;parity even
    in a,(IO_PIO_1_B_D) ;read parity bit
    and 0x02    ;test if parity bit is also even
    jr z, keyboard_read_fault_parity
    jr keyboard_read_stop
keyboard_read_podd:
    ;parity odd
    in a,(IO_PIO_1_B_D) ;read parity bit
    and 0x02    ;test if parity bit is also odd
    jr nz, keyboard_read_fault_parity
keyboard_read_stop:
    call keyboard_wait_clk_falling
    jp z, keyboard_read_fault   ;timeout condition  
    in a,(IO_PIO_1_B_D) ;read data bit
    and 0x02
    jp z, keyboard_read_fault_byte  ;if stopbit not 1 then fault

    call keyboard_wait_clk_high
    jp z, keyboard_read_fault   ;timeout condition
    nop
    nop
    call keyboard_off
    ld a,b  ;else load buffer to a
    ret     ;and return

keyboard_read_fault_parity:
    ld a,ps2_err_parity
    ld (var_ps2_err), a
    jr keyboard_read_fault
keyboard_read_fault_byte:
    ld a,ps2_err_unexpected
    ld (var_ps2_err), a
    jr keyboard_read_fault
keyboard_read_fault:
    call keyboard_abort
    ld a,0x0C   ;deactivate clock pulldown
    out (IO_PIO_1_B_D),a
    call keyboard_off
    ld a,0xFF
    ret
keyboard_read_null:
    call keyboard_off
    ld a,0x00
    ret




keyboard_wait_data_low_only:             ;wait until low
    in a,(IO_PIO_1_B_D)             
    and 0x02
    jp nz,keyboard_wait_data_low_only
    ret

keyboard_wait_data_high_only:             ;wait until high
    in a,(IO_PIO_1_B_D)             
    and 0x02
    jp z,keyboard_wait_data_low_only
    ret

keyboard_abort:
    push bc
    ld b,0
    ld c,1
    ld a,0x08   ;activate clock pulldown
    out (IO_PIO_1_B_D),a
    ld hl,12
    call delay
    pop bc
    ret

; hl contains loops (0.00000949433 s/loop)
delay:
    push bc
    ld bc, 1
delay_loop:
    sbc hl,bc                       ;15 T-States
    nop                             ;4  T-States
    nop                             ;4  T-States
    jp nz, delay_loop     ;12 T-States

    pop bc
    ret

;0b00001100
;      |||+IN CLK
;      ||+-IN DATA
;      |+--OUT CLK (LOW = Pulled low)
;      +---OUT DATA (LOW = Pulled low)

keyboard_off:
    ld a,0x08   ;activate clock pulldown
    out (IO_PIO_1_B_D),a
    ret

keyboard_on:
    call keyboard_wait_data_high_only
    ld a,0x0C   ;deactivate clock pulldown
    out (IO_PIO_1_B_D),a
    ret

; a contains data
keyboard_send_wrapper:
    ld b,4  ;amount of retries
    push bc
    call keyboard_send  ;send bit
    call keyboard_read  ;wait for response
    pop bc
    ret

;a contains data
keyboard_send:

    ld c,a      ;store data in b
    ld e,0      ;parity counter
    
    xor a
    ld (var_ps2_err),a  ;reset error code

    ld a,0x0C   ;release clock and data
    out (IO_PIO_1_B_D),a

    ld hl, 1    ;~20us
    call delay

    ld a,0x08   ;set clock low for 60us
    out (IO_PIO_1_B_D),a

    ld hl, 11    ;~100us
    call delay

    xor a               ; 2) Bring the Data and Clock line low.
    out (IO_PIO_1_B_D),a
    push af     ;small delay
    pop af
    ld a,0x04           ; 3) Release the Clock line. Keep data low
    out (IO_PIO_1_B_D),a

keyboard_send_initial_delay:
    call keyboard_wait_clk_low_loop     ; 4) Wait for the device to bring the Clock line low.
    jp z, keyboard_send_initial_delay   ;initial delay is much looooonger then the rest
                                        ;so no timeout error here
    ld b,8      ;setup byte counter


keyboard_send_loop: ; 5) Set/reset the Data line to send the first data bit
    ;call keyboard_wait_clk_low_only ;first cycle
    ld a,c      ;load data from c
    rra
    ld c,a
    jr c, keyboard_send_loop_high
    ld a,0x04   ;activate data pulldown -> data = 0
    out (IO_PIO_1_B_D),a
    inc e
    jr keyboard_send_loop_continue
keyboard_send_loop_high:
    ld a,0x0C   ;deactivate data pulldown -> data = 1
    out (IO_PIO_1_B_D),a
keyboard_send_loop_continue:
    call keyboard_wait_clk_falling
    jp z, keyboard_send_timeout
    djnz keyboard_send_loop          ; 8a) Repeat steps 5-7 for the other seven data bits 
keyboard_send_parity:                ; 8b) and the parity bit
    ld a,e  ;load 
    rra
    jr nc, keyboard_send_parity_high
    ld a,0x04   ;activate data pulldown -> data = 0
    out (IO_PIO_1_B_D),a
    jr keyboard_send_stopbit
keyboard_send_parity_high:
    ld a,0x0C   ;deactivate data pulldown -> data = 1
    out (IO_PIO_1_B_D),a
keyboard_send_stopbit:
    call keyboard_wait_clk_falling  ; 6) Wait for the device to bring Clock high.
    jp z, keyboard_send_timeout     ; 7) Wait for the device to bring Clock low.
    ld a,0x0C                        ; 9) Release the Data line
    out (IO_PIO_1_B_D),a
keyboard_get_ack:
    call keyboard_wait_clk_high
    jp z, keyboard_send_timeout

    call keyboard_wait_data_low_only ; 10) Wait for the device to bring Data low.
    call keyboard_wait_clk_low  ; 11) Wait for the device to bring Clock low.
    jp z, keyboard_send_timeout
    call keyboard_wait_data_high_only   ; 12) Wait for the device to release Data and Clock
    call keyboard_wait_clk_high
    jp z, keyboard_send_timeout
    nop
    nop
    call keyboard_off
    ret

keyboard_send_timeout:
    ret

