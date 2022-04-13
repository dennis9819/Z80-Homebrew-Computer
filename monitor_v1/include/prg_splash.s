; Z8C Splash-Screen

splash_run:
    ld a, 11000000b ; Set 16k memory and disable blank blank and Mode I
    ld b,TmsCtrl1Reg
    call vdp_reg_write  ; write to reg 1

    ;clear memory
    ld de, TmsNameLoc
    ld bc, TmsNameLoc+960
    call vdp_tms_clear

    ld de, TmsPatternLoc + (128*8)    ;setup start addr
    ld hl,[spash_pattern] ;HL contains start addr of spash_pattern
    ld bc,8 + (32*8)
    call vdp_setup_font

    ;create color table entry
    ld hl, TmsColorTableLoc
    call vdp_address

    ld b, 32
splash_run_ld_clr_loop:
    ld a, 0xF0
    out (VDP_MEM),a
    dec b
    ld a,b
    cp 16
    jp nz, splash_run_ld_clr_loop
splash_run_ld_clr_loop2:
    ld a, 0x90
    out (VDP_MEM),a
    dec b
    jp nz, splash_run_ld_clr_loop2


    ;print pattern
    ld hl, TmsNameLoc
    call vdp_address
    xor a



    ld a, 128 ;first tile
    ld b, 0 ;start x
    ld c, 0 ;start y
    ld d, 8 ;size x
    ld e, 4 ;size y

    ld (var_scratch), a
    ld a,d
    ld (var_scratch + 1), a

    ld a,b
    ld (var_curserx), a
    ld a,c
    ld (var_cursery), a
    call vdp_im2_pos
    
_pattern_loop_column:
    ld a,(var_scratch)
    out (VDP_MEM),a
    inc a
    ld (var_scratch),a
    dec d
    jp z,_pattern_loop_next_row
    jp _pattern_loop_column

_pattern_loop_next_row:
    ld a, (var_scratch + 1)
    ld d,a
    dec e
    jp z,_pattern_loop_next_end
    
    ld a,(var_cursery)
    inc a
    ld (var_cursery), a
    call vdp_im2_pos

    jp _pattern_loop_column

_pattern_loop_next_end:

    ld a,9
    ld (var_curserx), a
    ld a,0
    ld (var_cursery), a
    call vdp_im2_pos
    ld hl, [STR_Title1]
    call print_str

    ld a,2
    ld (var_cursery), a
    ld a,9
    ld (var_curserx), a
    call vdp_im2_pos
    ld hl, [STR_Title2]
    call print_str
    ld a,3
    ld (var_cursery), a
    ld a,9
    ld (var_curserx), a
    call vdp_im2_pos
    ld hl, [STR_Title3]
    call print_str
    halt


STR_Title1:
    db 'A Homebrew Computer',0
STR_Title2:
    db 'by Dennis Gunia 2022',0
STR_Title3:
    db 'www.dennisgunia.de',0

spash_pattern:
tile_0: ;(0,0)
    db 0,63,127,127,127,63,0,0
tile_1: ;(1,0)
    db 0,255,255,255,255,255,3,7
tile_2: ;(2,0)
    db 0,252,254,254,254,253,253,249
tile_3: ;(3,0)
    db 0,15,127,255,255,252,248,248
tile_4: ;(4,0)
    db 0,255,255,255,255,127,63,63
tile_5: ;(5,0)
    db 0,255,255,255,255,255,15,31
tile_6: ;(6,0)
    db 0,255,255,255,255,255,240,224
tile_7: ;(7,0)
    db 0,224,252,254,254,254,28,0
tile_8: ;(0,1)
    db 0,0,0,0,0,0,1,3
tile_9: ;(1,1)
    db 15,31,63,63,127,255,254,252
tile_10: ;(2,1)
    db 241,225,192,192,128,0,0,1
tile_11: ;(3,1)
    db 248,248,252,127,63,127,255,248
tile_12: ;(4,1)
    db 63,63,126,252,248,252,254,63
tile_13: ;(5,1)
    db 31,63,63,63,63,63,63,63
tile_14: ;(6,1)
    db 192,128,0,0,0,0,0,0
tile_15: ;(7,1)
    db 0,0,0,0,0,0,0,0
tile_16: ;(0,2)
    db 3,7,15,31,63,127,127,127
tile_17: ;(1,2)
    db 248,248,240,224,192,255,255,255
tile_18: ;(2,2)
    db 3,3,3,3,3,255,255,255
tile_19: ;(3,2)
    db 240,240,240,240,240,248,255,255
tile_20: ;(4,2)
    db 31,31,31,31,31,63,255,254
tile_21: ;(5,2)
    db 191,191,159,159,143,135,7,1
tile_22: ;(6,2)
    db 0,128,192,224,240,255,255,255
tile_23: ;(7,2)
    db 0,0,0,0,28,254,254,254
tile_24: ;(0,3)
    db 127,63,0,0,0,0,0,0
tile_25: ;(1,3)
    db 255,255,0,0,0,0,0,0
tile_26: ;(2,3)
    db 255,255,0,0,0,0,0,0
tile_27: ;(3,3)
    db 255,255,0,0,0,0,0,0
tile_28: ;(4,3)
    db 252,240,0,0,0,0,0,0
tile_29: ;(5,3)
    db 0,0,0,0,0,0,0,0
tile_30: ;(6,3)
    db 255,31,0,0,0,0,0,0
tile_31: ;(7,3)
    db 252,224,0,0,0,0,0,0
