SYS_RAM_START   equ 0x4000
SYS_BUF_START   equ 0x4010
PRG_RAM_START   equ 0x4110
PRG_RAM_TOP     equ 0xFF00
STACK_RAM_TOP   equ 0xFFFF

;VAR_CONSOLE_CONF    equ 0x07  ;CLK/TRG Clock @ 1843220.5/s
VAR_CONSOLE_CONF    equ 0x0F  ;CPU/16  Clock @ 230402.5625/s

VAR_CONSOLE_BAUD    equ 24  ;BAUD timer constant
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

;memory var template
mon_var_template:
    phase SYS_RAM_START

var_buffer_len:
    defb 0
var_last_char:
    defb 0
var_curserx:
    defb 0
var_cursery:
    defb 0
var_scratch:
    defs 16 ;16 bytes space for scratch vars
var_buffer:
    defb 0  ;var lentgh 


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
    call vdpconsole_init
    ;call print_clear
    ld hl, [STR_Banner_Start]
    call print_str


    ;jp splash_run
    jp ps2demo_run
    ;call debug_init
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
    call print_newLine
    call A_RTS_ON
    ld a,'>'
    call print_char
    xor a  ;reset buffer len
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
    xor a       ;a = 0
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
    call print_delete
    ;ld a, 0x08
    ;call print_char
    ;ld a, 0x20
    ;call print_char
    ;ld a, 0x08
    ;call print_char
    jp PROMPT_BEGIN_READ_LOOP

PROMPT_BEGIN_READ_PROCESS:
    ;call print_newLine
    ;ld hl,var_buffer
    ;call print_str

    ld a,([var_buffer])
    cp '$'              ;jump to addr
    jp z, CMD_EXEC
    cp '?'              ;print hexdump
    jp z, CMD_VIEW
    cp '!'              ;set memory
    jp z, CMD_SET
    cp 'i'              ;in IO
    jp z, CMD_IO_READ
    cp 'o'              ;out IO
    jp z, CMD_IO_WRITE
    cp 'x'              ;start xmodem
    jp z, xmodem_init


    call print_newLine
    ld hl, [STR_Unknown]
    call print_str
    jp PROMPT_BEGIN

    ret

CMD_EXEC:
    xor a                   ;write null byte to buffer pos 0 to prevent reexecute the last command
    ld (var_buffer),a

    ld hl,var_buffer+1      ;load 1st byte
    call DHEX_TO_BYTE       
    ld b,a                  ;store result in b
    ld a,e                  ;check for error
    and a
    jp nz, CMD_SYNTAX_ERROR

    ld hl,var_buffer+3      ;load 2nd byte
    call DHEX_TO_BYTE
    ld c,a
    ld a,e  ;check for error
    and a
    jp nz, CMD_SYNTAX_ERROR

    ld h,b
    ld l,c
    jp (hl)

CMD_VIEW:
    call print_newLine
    ld hl,var_buffer+1      ;load 1st byte
    call DHEX_TO_BYTE       
    ld b,a                  ;store result in b
    ld a,e                  ;check for error
    and a
    jp nz, CMD_SYNTAX_ERROR

    ld hl,var_buffer+3      ;load 2nd byte
    call DHEX_TO_BYTE
    ld c,a
    ld a,e  ;check for error
    and a
    jp nz, CMD_SYNTAX_ERROR  


    ld a,(var_buffer+5)
    cp ' '
    jp nz, CMD_SYNTAX_ERROR

    ld hl,var_buffer+6      ;load length
    call DHEX_TO_BYTE
    push af
    ld a,e  ;check for error
    and a
    jp nz, CMD_SYNTAX_ERROR  
    
    ;draw header
    ld hl,[STR_HEXDUMP_HEADER]
    call print_str

    pop af
    ;loading vars done. display results
    ld h, b ;pointer to current byte
    ld l, c ;pointer to current byte
    ld b, a                 ;bytes counter

    ;draw row
CMD_VIEW_ROW:
    call print_newLine
    ld a,h              ;print start
    call print_a_hex
    ld a,l
    call print_a_hex
    ld a, ' '
    call print_char
    ld c, 8                 ;column counter
CMD_VIEW_ROW_LOOP:
    ld a,(hl)
    call print_a_hex
    
    inc hl  ;increment pointer
    dec b   ;decrement byte counter
    dec c   ;decrement column counter

    ld a,b
    and a
    jp z,CMD_VIEW_END   ;if byte counter = 0 -> end reached

    ld a,c
    and a
    jp z,CMD_VIEW_ROW   ;else if column counter = 0 -> 16 chars printed. next row

    ld a, ' '
    call print_char
    jp CMD_VIEW_ROW_LOOP    ;else
CMD_VIEW_END:
    call print_newLine
    jp PROMPT_BEGIN

CMD_SET:
    ld hl,var_buffer+1      ;load 1st byte
    call DHEX_TO_BYTE       
    ld b,a                  ;store result in b
    ld a,e                  ;check for error
    and a
    jp nz, CMD_SYNTAX_ERROR

    ld hl,var_buffer+3      ;load 2nd byte
    call DHEX_TO_BYTE
    ld c,a
    ld a,e  ;check for error
    and a
    jp nz, CMD_SYNTAX_ERROR    
    ;bc now contains the start address

    ld hl,var_buffer+5
CMD_SET_LOOP:
    ld a,(hl)
    cp 0    ;if 0 then end
    jp z, CMD_SET_END
    cp ' '
    jp nz, CMD_SYNTAX_ERROR
    inc hl  ;next byte
    call DHEX_TO_BYTE
    ld (bc),a   ;load byte to 
    ld a,e
    and a
    jp nz, CMD_SYNTAX_ERROR    
    inc bc
    inc hl
    inc hl
    jp CMD_SET_LOOP
CMD_SET_END:
    call print_newLine
    jp PROMPT_BEGIN


CMD_IO_WRITE:
    ld hl,var_buffer+1      ;load 1st byte
    call DHEX_TO_BYTE       
    ld c,a                  ;store result in b
    ld a,e                  ;check for error
    and a
    jp nz, CMD_SYNTAX_ERROR

    ld a,(var_buffer+3)
    cp ' '
    jp nz, CMD_SYNTAX_ERROR

    ld hl,var_buffer+4      ;load 1st byte
    call DHEX_TO_BYTE       
    push af
    ld a,e                  ;check for error
    and a
    jp nz, CMD_SYNTAX_ERROR

    pop af
    out (c),a    
    call print_newLine
    jp PROMPT_BEGIN

CMD_IO_READ:
    ld hl,var_buffer+1      ;load 1st byte
    call DHEX_TO_BYTE       
    ld c,a                  ;store result in b
    ld a,e                  ;check for error
    and a
    jp nz, CMD_SYNTAX_ERROR

    in a,(c)
    push af
    call print_newLine
    pop af
    call print_a_hex
    call print_newLine
    jp PROMPT_BEGIN

CMD_SYNTAX_ERROR:
    call print_newLine
    ld hl, [STR_SyntaxError]
    call print_str
    jp PROMPT_BEGIN



Includes:
.include "vdpconsole.s"
.include "conversions.s"
.include "vdptext.s"
.include "ps2.s"
.include "prg_ps2demo.s"
.include "prg_splash.s"
.include "parity.s"
; Strings
STR_Banner_Start:
    db "Z8C Monitor V2 by Dennis Gunia (2022)",0
STR_SyntaxError:
    db "syn?",0
STR_Unknown:
    db "cmd?",0
STR_HEXDUMP_HEADER:
    db 'BASE 0  1  2  3  4  5  6  7',0

.include "xmodem.s"
;.include "debug.s"