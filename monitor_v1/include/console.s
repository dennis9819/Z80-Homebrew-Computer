

; A contains char
; Destroys A
print_char:
    out (IO_SIO0B_D),a
    call print_wait_out
    ret
; HL contains pointer to string
; Destroy A, HL

print_str:
    ld a, (hl)
    or a
    jr z,print_str_end
    call print_char
    inc hl
    jr print_str
print_str_end:
    ret

print_clear:
    ld hl, [MSG_CLEAR]
    call print_str
    ret

print_newLine:
    ld a,10
    call print_char
    ld a,13
    call print_char
    ret
; destroys a
print_wait_out:
    ; check for TX buffer empty
    sub a ;clear a, write into WR0: select RR0
    inc a ;select RR1
    out (IO_SIO0B_C),A
    in A,(IO_SIO0B_C) ;read RRx
    bit 0,A
    jr z,print_wait_out
    ret

print_a_hex:
    push af
    push bc
    push de
    call STRCONV_BYTES_TO_HEX
    ld a,b
    call print_char
    ld a,c
    call print_char
    pop de
    pop bc
    pop af

read_char:
    xor a               ; a = 0
    out (IO_SIO0B_C), a ; select reg 0
    in a, (IO_SIO0B_C)  ; read reg 0
    and	1               ; mask D0 (recieve char available)
    ret	Z               ; return 0 if no char
    in a, (IO_SIO0B_D)  ; read char if avail
    ret                 ; return

;MSG_CRSR_0:
;    db 0x1B, "[?25h",0
;MSG_CRSR_1:
;    db 0x1B, "[?25l",0
MSG_CLEAR:
    db 27, '[2J', 27, '[H',0



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