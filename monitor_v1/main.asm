MONITOR_START   equ 0x0080
SYS_RAM_START   equ 0x4000
SYS_BUF_START   equ 0x4010
PRG_RAM_START   equ 0x4110
PRG_RAM_TOP     equ 0xFF00
STACK_RAM_TOP   equ 0xFFFF

;VAR_CONSOLE_CONF    equ 0x07  ;CLK/TRG Clock @ 1843220.5/s
VAR_CONSOLE_CONF    equ 0x0F  ;CPU/16  Clock @ 230402.5625/s

VAR_CONSOLE_BAUD    equ 12  ;BAUD timer constant
                            ;CLK/TRG Clock @ 1843220.5/s
                            ; -> 0x16 : 14400
                            ;CPU/16  Clock @ 230402.5625/s
                            ; -> 12 : 19200
                            ; -> 24 : 9600

; include IO device addresses
.include "addresses.s"

    org 0x0000
main:
    jp mon_start_init_sound    

    org MONITOR_START

;memory var template
mon_var_template:
    phase SYS_RAM_START

var_buffer_len:
    defb 0
var_last_char:
    defb 0
var_buffer:
    dc 255,0x00

mon_var_template_end:
    dephase
;end memory var template

mon_start_init_sound:
    ld	  D,0x08	; Select register #8
    ld	  A,0x00	; Volume channel A 0
    call AY0_WRITE_REG
    ld	  D,0x09	; Select register #9
    ld	  A,0x00	; Volume channel B 0
    call AY0_WRITE_REG
    ld	  D,0x0A	; Select register #10
    ld	  A,0x00	; Volume channel C 0
    call AY0_WRITE_REG
mon_start_init_serial:
    ld A,VAR_CONSOLE_CONF   ; Setup CTC
    out (IO_CTC0_C1),A      ; Controll word, software reset, time constant follows, CLK/TRG starts timer
    ld A,VAR_CONSOLE_BAUD   ; Setup timer const
    out (IO_CTC0_C1),A      ; Load timer const into CTC (Setup Baud generator)
    ;set up TX and RX:W
    ld a,00110000b      ;write into WR0: error reset, select WR0
    out (IO_SIO0B_C),A
    ld a,018h           ;write into WR0: channel reset
    out (IO_SIO0B_C),A
    ld a,004h           ;write into WR0: select WR4
    out (IO_SIO0B_C),A
    ld a,04h            ;44h write into WR4: clkx1,1 stop bit, no parity
    out (IO_SIO0B_C),A
    ld a,005h           ;write into WR0: select WR5
    out (IO_SIO0B_C),A
    ld a,068h           ;DTR active, TX 8bit, BREAK off, TX on, RTS inactive
    out (IO_SIO0B_C),A
    ld a,01h            ;write into WR0: select WR1
    out (IO_SIO0B_C),A
    ld a,00000100b      ;no interrupt in CH B, special RX condition affects vect
    out (IO_SIO0B_C),A
    ;enable SIO channel A RX
    ld a,003h ;write into WR0: select WR3
    out (IO_SIO0B_C),A
    ld a,0C1h ;RX 8bit, auto enable off, RX on
    out (IO_SIO0B_C),A
    ;Channel A RX active
mon_start_ram:
    ld hl,mon_var_template
    ld de,mon_var_template_end
    ld bc,SYS_RAM_START
mon_start_ram_loop:
    ld a,(hl)  ;copy values
    ld (bc),a
    inc hl      
    inc bc
    push hl    ;check if end is reached
    sbc hl,de
    pop hl
    jp nz, mon_start_ram_loop
    ;template copy done

mon_start_complete:
    call print_clear
    ld hl, [STR_Banner_Start]
    call print_str
    call PROMPT_BEGIN
    ;halt CPU if prompt exits
    halt
; Misc Functions
AY0_WRITE_REG:
    LD B,A
    LD A,D
    OUT (IO_AY0_ADDR),A
    LD A,B
    OUT (IO_AY0_DATA),A
    RET

PROMPT_BEGIN:
    ld a,'>'
    call print_char
    ld a,0  ;reset buffer len
    ld (var_buffer_len),a

PROMPT_BEGIN_READ_LOOP:
    call read_char
    jp z, PROMPT_BEGIN_READ_LOOP    ; wait until char avail
    
    ; process special ops
    cp 13   ; enter
    jp z,PROMPT_BEGIN_READ_PROCESS
    cp 0x08 ; backspace 0x08 VT102 0x7f Putty
    jp z,PROMPT_BEGIN_READ_BACKSPACE

    push af
    ; a contains latest char
    ld hl,[var_buffer]
    ld d,0
    ld a,(var_buffer_len)
    ld e,a
    add hl,de   ;hl now contains pointer to last position in buffer
    inc a
    ld (var_buffer_len),a ;store incremented buffer length

    pop af
    ld (hl),a
    call print_char
    inc hl
    ld a, 0x00
    ld (hl),a   ;always add null termination after last char
    jp PROMPT_BEGIN_READ_LOOP

PROMPT_BEGIN_READ_BACKSPACE:
    ld a,(var_buffer_len)
    and a
    jp z, PROMPT_BEGIN_READ_LOOP    ; do not continue if already at char 0
    dec a       ;decrement length
    ld (var_buffer_len),a   ;and store it
    ld e,a      ;load de with decremented value
    ld d,0
    ld hl,[var_buffer]
    add hl,de   ;hl now contains pointer to last position in buffer
    xor a       ; store null byte to current location
    ld (hl),a
    ld a, 0x08
    call print_char
    ld a, 0x20
    call print_char
    ld a, 0x08
    call print_char
    jp PROMPT_BEGIN_READ_LOOP

PROMPT_BEGIN_READ_PROCESS:
    call print_newLine
    ld hl,var_buffer
    call print_str
    call print_newLine
    ld hl, [STR_SyntaxError]
    call print_str
    jp PROMPT_BEGIN

    ret


Includes:
.include "console.s"
; Strings
STR_Banner_Start:
    db "Z8C Monitor V2 by Dennis Gunia (2022)",10,13,0
STR_SyntaxError:
    db "Syntax error",10,13,0