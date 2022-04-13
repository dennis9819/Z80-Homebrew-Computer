

; A contains char
; Destroys A
print_char:
    call vdp_char
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
    ;NOT IMPLEMENTED
    ;ld hl, [MSG_CLEAR]
    ;call print_str
    ret

print_newLine:
    xor a               
    ld (var_curserx),a
    ld a,(var_cursery)
    cp 23
    jp z,print_newLine_scroll
    inc a
    ld (var_cursery),a    
    call vdp_cursor_move
    ret
print_newLine_scroll:
    call vdp_scroll
    ld a,23
    ld (var_cursery),a  
    call vdp_cursor_move

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

print_delete:
    ld a,(var_curserx) 
    cp 0
    jp c,print_delete_end
    dec a
    ld (var_curserx),a
    call vdp_cursor_move
    ld a, ' '
    out (VDP_MEM),a
    call vdp_cursor_move
print_delete_end:
    ret

print_parity:
    jr c, print_parity_odd
    ld a, "E"
    call print_char
    or a
    ret
print_parity_odd:
    ld a, "O"
    call print_char
    scf
    ret

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