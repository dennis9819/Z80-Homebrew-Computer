START_ROM   equ 0x0000


IO_CTC0_C0  equ 0x00
IO_CTC0_C1  equ 0x01
IO_CTC0_C2  equ 0x02
IO_CTC0_C3  equ 0x03

IO_SIO0A_C  equ 00010010b
IO_SIO0A_D  equ 00010000b
IO_SIO0B_C  equ 00010011b
IO_SIO0B_D  equ 00010001b

IO_REG0     equ 0x20

PROG_ROM_START equ 0x0100
PROG_MEM_START equ 04000h

MEM_CURSOR_STATE equ 0x4000  ; 1 byte var
MEM_LAST_CHAR equ 0x4001  ; 1 byte var
MEM_PROMPT_SIZE equ 0x4002
MEM_PROMPT_START equ 0x4003

CMD_CRS_SPEED equ 0xB000

;Strings
STRINGS:
    org 0x0600
MSG_SYS_VER:
    db 'Z8C - A Z80 Homebrew Computer',13,10
    db 'ROM Ver. 1.0 by Dennis Gunia (2022)',13,10
    db '48k RAM - Z8C Monitor',13,10,0

MSG_CMD_UNKNOWN:
    db 8,' ',13,10,'Invalid operation',13,10,0

MSG_HEX:
    db '0123456789ABCDEF'


INT_VEC:
    org 0Ch
    DEFW RX_CHA_AVAILABLE
    org 0Eh
    DEFW SPEC_RX_CONDITON
    
init:
    org 0x0000
    jp PROG_ROM_START

init_led:
    org PROG_ROM_START
    LD A,0x00
    OUT (IO_REG0),A

init_ctc0:
    ; Init Ch1 (SIO0B)
    LD A,00000111b
    OUT (IO_CTC0_C1),A
    ; Set Value Ch1 (SIO0B)
    ; CLK= 8MHz
    ; Baud 4800
    LD A,52d
    ;LD A,27d
    OUT (IO_CTC0_C1),A

init_sio0b:
    ;set up TX and RX:W
    ld a,00110000b ;write into WR0: error reset, select WR0
    out (IO_SIO0B_C),A
    ld a,018h ;write into WR0: channel reset
    out (IO_SIO0B_C),A

    ld a,004h ;write into WR0: select WR4
    out (IO_SIO0B_C),A
    ;ld a,44h ;44h write into WR4: clkx16,1 stop bit, no parity
    ld a,04h ;44h write into WR4: clkx1,1 stop bit, no parity
    out (IO_SIO0B_C),A

    ld a,005h ;write into WR0: select WR5
    out (IO_SIO0B_C),A
    ;ld a,0E8h ;DTR active, TX 8bit, BREAK off, TX on, RTS inactive
    ld a,068h ;DTR active, TX 8bit, BREAK off, TX on, RTS inactive
    out (IO_SIO0B_C),A

    ld a,01h ;write into WR0: select WR1
    out (IO_SIO0B_C),A
    ld a,00000100b ;no interrupt in CH B, special RX condition affects vect
    out (IO_SIO0B_C),A

    ld a,02h ;write into WR0: select WR2
    out (IO_SIO0B_C),A
    ld a,0h ;write into WR2: cmd line int vect (see int vec table)
    ;bits D3,D2,D1 are changed according to RX condition
    out (IO_SIO0B_C),A

    ;ld a,01h ;write into WR0: select WR1
    ;out (IO_SIO0B_C),A
    ;ld a,00011000b ;interrupt on all RX characters, parity is not a spec RX condition
    ;buffer overrun is a spec RX condition
    ;out (IO_SIO0B_C),A

    ;enable SIO channel A RX
    ld a,003h ;write into WR0: select WR3
    out (IO_SIO0B_C),A
    ld a,0C1h ;RX 8bit, auto enable off, RX on
    out (IO_SIO0B_C),A
    ;Channel A RX active

INT_INI:
    ld A,0
    ld I,A  ;load I reg with zero
    im 2    ;set int mode 2
    ei      ;enable interupt

    LD A,0x00
    OUT (IO_SIO0B_D),A
    CALL TX_EMP

    call A_RTS_ON

    ; PRINT BANNER
    LD BC, [MSG_SYS_VER]
    CALL CONSOLE_PRINTSTR

    JP CONSOLE_PROMPT


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

SPEC_RX_CONDITON:
    
    jp 0000h

TX_EMP:

    ; check for TX buffer empty
    sub a ;clear a, write into WR0: select RR0
    inc a ;select RR1
    out (IO_SIO0B_C),A
    in A,(IO_SIO0B_C) ;read RRx
    bit 0,A
    jp z,TX_EMP
    ret

DELAY:
    PUSH IX
    PUSH BC
    LD IX,0x4000
    LD BC,1
DELAY_LOOP:
    ADD IX,BC
    JR NC, DELAY_LOOP
    POP BC
    POP IX
    RET

; Console Functions

;OUT
CONSOLE_PRINTSTR:
    ; BC contains String offset
    ; Prints null terminated string
    PUSH AF
CONSOLE_PRINTSTR_LOOP:
    LD A,(BC)

    ; Return if nullbyte
    OR 0
    JR Z, CONSOLE_PRINTSTR_EXIT
    ; Print Char
    out (IO_SIO0B_D),A
    call TX_EMP

    ; INC BC and JP start of loop
    INC BC
    jp CONSOLE_PRINTSTR_LOOP

CONSOLE_PRINTSTR_EXIT:
    POP AF
    RET

CONSOLE_PRINT_A_HEX:
    PUSH AF
    PUSH BC
    PUSH HL

    LD B,A
    
    RRA
    RRA
    RRA
    RRA
    AND 0x0F
    LD HL,[MSG_HEX]
    add   a, l    ; A = A+L
    ld    l, a    ; L = A+L
    adc   a, h    ; A = A+L+H+carry
    sub   l       ; A = H+carry
    ld    h, a    ; H = H+carry
    LD A,(HL)
    out (IO_SIO0B_D),A
    call TX_EMP

    LD A,B
    AND 0x0F
    LD HL,[MSG_HEX]
    add   a, l    ; A = A+L
    ld    l, a    ; L = A+L
    adc   a, h    ; A = A+L+H+carry
    sub   l       ; A = H+carry
    ld    h, a    ; H = H+carry
    LD A,(HL)
    out (IO_SIO0B_D),A
    call TX_EMP

    POP HL
    POP BC
    POP AF
    RET

;IN

CONSOLE_READ_CHAR:
    XOR	A
    OUT (IO_SIO0B_C), A
    IN A, (IO_SIO0B_C)
    AND	1
    RET	Z	
    IN A, (IO_SIO0B_D)
    ;LD D,A
    RET

CONSOLE_PROMPT:
    ;Console Prompt
    LD A, 10
    out (IO_SIO0B_D),A
    call TX_EMP
    LD A,'?'
    out (IO_SIO0B_D),A
    call TX_EMP
    LD A,'>'
    out (IO_SIO0B_D),A
    call TX_EMP
    LD A,' '
    out (IO_SIO0B_D),A
    call TX_EMP
    LD A,"_"
    out (IO_SIO0B_D),A 
    call TX_EMP

    ; Blinking Cursor
    LD IX,CMD_CRS_SPEED
    LD BC,1
    LD A,0
    LD (MEM_CURSOR_STATE),A
    ; SET PROMPT LENGTH TO 0
    LD A,0
    LD (MEM_PROMPT_SIZE),A

CONSOLE_PROMPT_LOOP:
    ; READ INPUT
    ; Delete Cursor if input Avail
    ;JP CONSOLE_PROMPT_LOOP_2
    CALL CONSOLE_READ_CHAR
    AND A
    LD (MEM_LAST_CHAR),A

    JP Z, CONSOLE_PROMPT_LOOP_2
    ; if newline
    LD D, 13
    CP D
    JR NZ, CONSOLE_PROMPT_LOOP_1

    LD BC, [MSG_CMD_UNKNOWN]
    CALL CONSOLE_PRINTSTR

    JP CONSOLE_PROMPT

CONSOLE_PROMPT_LOOP_1: ; Not new line
   
    LD A,(MEM_LAST_CHAR)
    LD D, 08
    CP D
    JR NZ, CONSOLE_PROMPT_LOOP_1B

    ; if Backspace
    LD A,(MEM_PROMPT_SIZE); test if not smaller than 0
    CALL CONSOLE_PRINT_A_HEX; DEBUG
    DEC A
    JP Z,CONSOLE_PROMPT_LOOP_2; no action if buffer empty
    LD (MEM_PROMPT_SIZE),A  ; store size to mem

    LD A, 0x7F
    out (IO_SIO0B_D),A
    call TX_EMP
    out (IO_SIO0B_D),A
    call TX_EMP

    LD A, ' '
    out (IO_SIO0B_D),A
    call TX_EMP

    JP CONSOLE_PROMPT_LOOP_2

CONSOLE_PROMPT_LOOP_1B: ;IF not Backspace 
    LD A,(MEM_PROMPT_SIZE)
    ;LD D,A
    ;LD E, 0
    ;LD HL,MEM_PROMPT_START ; generate pointer to line buffer
    ;ADD HL,DE
    ;LD A,(MEM_LAST_CHAR)
    ;LD (HL),A
    INC A
    ;LD A,D
    LD (MEM_PROMPT_SIZE),A  ; store size to mem

    LD A, 0x7F
    out (IO_SIO0B_D),A
    call TX_EMP

    LD A,(MEM_LAST_CHAR)
    out (IO_SIO0B_D),A
    call TX_EMP

    LD A," "
    out (IO_SIO0B_D),A 
    call TX_EMP

CONSOLE_PROMPT_LOOP_2:
    ; Print Cursor
    ADD IX,BC
    JR NC, CONSOLE_PROMPT_LOOP
    ; Toggle cycle
    LD A,(MEM_CURSOR_STATE)
    XOR 1
    JR Z,CONSOLE_PROMPT_LOOP_3
    LD (MEM_CURSOR_STATE),A

    LD A, 0x7F
    out (IO_SIO0B_D),A
    call TX_EMP
    LD A,'_'
    out (IO_SIO0B_D),A
    call TX_EMP
    LD IX,CMD_CRS_SPEED
    JP CONSOLE_PROMPT_LOOP

CONSOLE_PROMPT_LOOP_3:
    LD (MEM_CURSOR_STATE),A
    LD A, 0x7F
    out (IO_SIO0B_D),A
    call TX_EMP
    LD A,' '
    out (IO_SIO0B_D),A
    call TX_EMP
    LD IX,CMD_CRS_SPEED
    JP CONSOLE_PROMPT_LOOP