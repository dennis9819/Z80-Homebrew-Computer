; Registers
TmsCtrl0Reg:            equ 80h
TmsCtrl1Reg:            equ 81h
TmsNameReg:             equ 82h
TmsColorTableReg:       equ 83h
TmsPatternReg:          equ 84h
TmsSpriteAttrReg:       equ 85h
TmsSpritePatternReg:    equ 86h
TmsColorReg:            equ 87h

; colors
TmsTransparent:         equ 0
TmsBlack:               equ 1
TmsMediumGreen:         equ 2
TmsLightGreen:          equ 3
TmsDarkBlue:            equ 4
TmsLightBlue:           equ 5
TmsDarkRed:             equ 6
TmsCyan:                equ 7
TmsMediumRed:           equ 8
TmsLightRed:            equ 9
TmsDarkYellow:          equ 0ah
TmsLightYellow:         equ 0bh
TmsDarkGreen:           equ 0ch
TmsMagenta:             equ 0dh
TmsGray:                equ 0eh
TmsWhite:               equ 0fh

; memory locations
TmsNameLoc:             equ 0x3800
TmsPatternLoc:          equ 0x0000
TmsColorTableLoc:       equ 0x2000

; table lengths

TmsTileNameLen:         equ 300h
TmsTextNameLen:         equ 3c0h

TmsTileColorLen:        equ 20h
TmsBitmapColorLen:      equ 800h

TmsTilePatternLen:      equ 800h
TmsTextPatternLen:      equ 800h
TmsMulticolorPatternLen: equ 600h
TmsBitmapPatternLen:    equ 1800h

;VDP initialization
vdpconsole_init:
    xor a
    ld (var_curserx), a ;initialize curser x position with 0
    ld (var_cursery), a ;initialize curser y position with 0

    xor a
    ld b, TmsCtrl0Reg
    call vdp_reg_write  ; Set reg 0 to 0

    ld a, 0x90          ; Set 16k memory and blank
    ld b, TmsCtrl1Reg
    call vdp_reg_write  ; write to reg 1

    ;ld a,0xF4           ;white,purple
    ld a,0xF0           ;white,black
    ld b, TmsColorReg
    call vdp_reg_write  ; set color to fg:white bg:black


    ld de, 0            ; clear entire VRAM
    ld bc, 0x4000
    ld a, 0
    call vdp_tms_clear

    ;setup adress color
    ld bc, TmsColorTableLoc ;color base addr
    ld a,b          ;divide by 0x40 (so it fits in 1 byte)
    rl c            
    rla
    rl c
    rla

    ld b, TmsColorTableReg
    call vdp_reg_write

    ;setup pattern addr
    ld bc, TmsPatternLoc
    ld a,b
    rrca
    rrca
    rrca

    ld b, TmsPatternReg
    call vdp_reg_write

    ;setup name table addr
    ld bc, TmsNameLoc
    ld a,b
    rrca
    rrca
    and 0x0F
    ld b, TmsNameReg
    call vdp_reg_write

    ;copy charset to video ram
    ;TmsFont is start symbol of charset
    ld hl,[TmsFont] ;HL contains start addr of font
    call vdp_setup_font

    ;clear memory
    ld de, TmsNameLoc
    ld bc, TmsNameLoc+960
    call vdp_tms_clear

    ;set cursor to 0,0
    ld bc,0
    call vdp_cursor_set

    ;end of initialization
    ld a, 11010000b ; Set 16k memory and disable blank blank
    ld b,TmsCtrl1Reg
    call vdp_reg_write  ; write to reg 1

    ;set cursor position
    call vdp_cursor_move

    ret


;Output operation to VDP register   
;A contians Data, B contains Regsiter ID
vdp_reg_write:
    out (VDP_REG), a    ;write data byte first
    ld a, b          ;load reg address
    out (VDP_REG), a    ;write register select
    ret

vdp_wait:
    ;nop
    ;nop
    ;nop
    ;nop
    ret

;HL contianst start addr of font
vdp_setup_font:
    ld bc,TmsTextPatternLen
    ld de, TmsPatternLoc    ;setup start addr
    ld a,e      ;load lsb
    out (VDP_REG), a
    ld a,d      ;load msb
    and 0x3F    ;mask
    or 0x40     ;set auto incerement bit
    out (VDP_REG), a
vdp_setup_font_loop:
    ld a,(hl)   ;load current byte
    inc hl      ;incerment pointer
    dec bc      ;decrement counter
    ;ld a, 10001000b
    out (VDP_MEM),a
    call vdp_wait

    ld a,b  ;check if bc == 0
    or c
    jp nz, vdp_setup_font_loop  ;if not 0 then loop

    ret
    
;DE start addr, BC end addr
vdp_tms_clear:
    ;setup start addr
    push af
    ld a,c      ;load lsb
    out (VDP_REG), a

    ld a,b      ;load msb
    and 0x3F    ;mask
    or 0x40     ;set auto incerement bit
    out (VDP_REG), a

    pop af
    push hl

vdp_tms_clear_loop:
    ;write memory out
    xor a
    out (VDP_MEM), a
    call vdp_wait

    inc de      ;incerement counter
    ld h,b
    ld l,c
    sbc hl,de   ;check if reached maximum
    jp nz, vdp_tms_clear_loop   ;if not -> loop
    
    pop hl      ;restore hl and exit sub
    ret

.include "tmsfont.s"



; b contains x
; c contains y
vdp_cursor_set:
    ld a, b
    ld (var_curserx),a
    ld a,c
    ld (var_cursery),a
    ret

vdp_cursor_move:
    push hl
    push de
    ld hl,0
    ld d,0
    ld a,(var_cursery)
    ld e,a
    add hl,de   ;  Y x 1
    add hl,hl   ;x2
    add hl,hl   ;x4
    add hl,de   ;x5
    add hl, hl  ;x10
    add hl, hl  ;x20
    add hl, hl  ;x40 
    ld a,(var_curserx)
    ld e,a
    add hl,de   ;add x
    ld de, TmsNameLoc
    add hl,de   ;add table offset
    ld a,l
    out (VDP_REG),a
    ld a,h
    or 0x40
    out (VDP_REG),a
    pop de
    pop hl
    ret

vdp_char:
    push af             ;store to-print char
    ld a,(var_curserx)  ;load x
    cp 40               ;if eol reached
    jr z,vdp_char_nl     
    inc a               ;else incerment
    ld (var_curserx),a  ;and store
    pop af              ;print char
    out (VDP_MEM),a
    call vdp_wait
    ret
vdp_char_nl:    ;new line
    xor a               ;reset x pos
    ld (var_curserx),a  ;
    ld a,(var_cursery)
    cp 24
    jr z,vdp_char_scroll
    inc a
    ld (var_cursery),a  
    pop af              ;print char
    out (VDP_MEM),a
    call vdp_wait
    ret
vdp_char_scroll:    ;last line full -> scroll
    call vdp_scroll
    xor a               
    ld (var_curserx),a  
    ld a,23
    ld (var_cursery),a  
    call vdp_cursor_move
    pop af              ;print char
    out (VDP_MEM),a
    call vdp_wait
    ret

vdp_scroll:
    push hl
    push bc
    push de
    ;BC = first position (dest)
    ;HL = second position (src)
    ld bc, TmsNameLoc    ; load start of text-buffer (name table) into reg bc
vdp_scroll_line:
    ld h,b
    ld l,c

    ld de, 40   ; line width
    add hl, de  ;HL is now the second position

    ld a,l          ; setup VDP address
    out (VDP_REG),a
    ld a,h
    and 3fh
    out (VDP_REG),a
    call vdp_wait
    in a, (VDP_MEM)    ; read byte
    push af

    ld a,c          ; setup VDP address
    out (VDP_REG),a
    ld a,b
    and 3fh         
    or 40h          ; write bit
    out (VDP_REG),a
    pop af
    call vdp_wait
    out (VDP_MEM),a

    inc bc

    ld h,b
    ld l,c
    ld de, TmsNameLoc + 960    ; buffer end
    sbc hl, de

    jp nz, vdp_scroll_line

vdp_scroll_clear_l24:
    ld bc, TmsNameLoc + 920
vdp_scroll_clear_l24_loop:

    ld a,c          ; setup VDP addressh
    out (VDP_REG),a
    ld a,b
    and 3fh         
    or 40h          ; write bit
    out (VDP_REG),a
    ld a, ' '
    out (VDP_MEM),a
    call vdp_wait

    inc bc
    ld h,b
    ld l,c
    ld de, TmsNameLoc + 960   ; buffer end
    sbc hl, de

    jp nz, vdp_scroll_clear_l24_loop

    pop de
    pop bc
    pop hl
    ret
