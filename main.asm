.include "addresses.s"

MEM_CURSOR_STATE equ 0x4000  ; 1 byte var
MEM_LAST_CHAR equ 0x4001  ; 1 byte var
MEM_PROMPT_SIZE equ 0x4003
MEM_PROMPT_START equ 0x4005

CMD_CRS_SPEED equ 0xE000

; Include Kernel Libs at 0x0380
    org 0x0380
.include "conversions.s"
.include "console.s"
.include "io.s"
.include "commands.s"

; include subroutines
;.include "sub_soundtest.s"

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

init_console:
    CALL CONSOLE_INIT

    LD	  D,0x08	; Select register #8
    LD	  A,0x00	; Volume channel A 0
    CALL AY0_WRITE_REG
    LD	  D,0x09	; Select register #9
    LD	  A,0x00	; Volume channel B 0
    CALL AY0_WRITE_REG
    LD	  D,0x0A	; Select register #10
    LD	  A,0x00	; Volume channel C 0
    CALL AY0_WRITE_REG
    

;INT_INI:
;    ld A,0
;    ld I,A  ;load I reg with zero
;    im 2    ;set int mode 2
;    ei      ;enable interupt

    LD A,0x00
    OUT (IO_SIO0B_D),A
    CALL TX_EMP

    call A_RTS_ON

    ; PRINT BANNER
    LD BC, [MSG_SYS_VER]
    CALL CONSOLE_PRINTSTR

    LD SP,07FFFh
    ; Print SP Location
    LD (0x4000),SP
    LD A,(0x4001)
    CALL PRINT_A_HEX
    LD A,(0x4000)
    CALL PRINT_A_HEX

    LD A,13
    out (IO_SIO0B_D),A
    call TX_EMP
    LD A,10
    out (IO_SIO0B_D),A
    call TX_EMP

    JP CONSOLE_PROMPT




SPEC_RX_CONDITON:
    
    jp 0000h


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

    CALL PARSE_CMD

    JP CONSOLE_PROMPT

CONSOLE_PROMPT_LOOP_1: ; Not new line
   
    LD A,(MEM_LAST_CHAR)
    LD D, 0x7F
    CP D
    JR NZ, CONSOLE_PROMPT_LOOP_1B

    ; if Backspace
    LD A,(MEM_PROMPT_SIZE); test if 0
    AND A
    JP Z,CONSOLE_PROMPT_LOOP_2; no action if buffer empty

    ;EXEC this if backspace (08d)
    DEC A
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

    JP CONSOLE_PROMPT_LOOP_2

CONSOLE_PROMPT_LOOP_1B: ;IF not Backspace 


    ; CHECK if Controll Sequence
    

    ; Continue

    LD A,(MEM_PROMPT_SIZE)
    INC A
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

    ;APPEND CHAR TO BUFFER
    PUSH BC
    LD HL,MEM_PROMPT_START
    LD B,0
    LD A,(MEM_PROMPT_SIZE)
    DEC A
    LD C,A
    ADC HL, BC
    LD A, (MEM_LAST_CHAR)
    LD (HL), A
    POP BC
    


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

; A Contains Byte
PRINT_A_HEX:
    PUSH BC
    PUSH DE
    CALL STRCONV_BYTES_TO_HEX   ; New Kernel Call
    LD A,B
    out (IO_SIO0B_D),A
    call TX_EMP
    LD A,C
    out (IO_SIO0B_D),A
    call TX_EMP
    POP DE
    POP BC
    RET

MSG_HEXDUMP_HEADER:
    db 13,10,'BASE   0  1  2  3  4  5  6  7  8  9  A  B  C  D  E  F',0

; HL contains Start ADDR
PRINT_HEXDUMP:
    PUSH AF
    PUSH BC
    PUSH HL
    ; PRINT Header
    LD BC, [MSG_HEXDUMP_HEADER]
    CALL CONSOLE_PRINTSTR
    LD C,0  ; Line Counter

PRINT_HEXDUMP_SOL: ; Start of Line
    LD A,13
    out (IO_SIO0B_D),A
    call TX_EMP
    LD A,10
    out (IO_SIO0B_D),A
    call TX_EMP

    LD A,H
    CALL PRINT_A_HEX
    LD A,L
    CALL PRINT_A_HEX

    LD A, 'h'
    out (IO_SIO0B_D),A
    call TX_EMP
    LD A, ':'
    out (IO_SIO0B_D),A
    call TX_EMP
    LD A, ' '
    out (IO_SIO0B_D),A
    call TX_EMP

    LD B,0  ; Column Counter
PRINT_HEXDUMP_LOOP1:
    LD A,(HL)
    CALL PRINT_A_HEX
    LD A, ' '
    out (IO_SIO0B_D),A
    call TX_EMP

    INC B
    INC HL
    ; Check If 16 columns
    LD A,B
    AND 0x10
    JP Z, PRINT_HEXDUMP_LOOP1; IF less than 8

    INC C
    LD A,C
    AND 0x10

    JP Z, PRINT_HEXDUMP_SOL; IF less than 8

    LD A,13
    out (IO_SIO0B_D),A
    call TX_EMP
    LD A,10
    out (IO_SIO0B_D),A
    call TX_EMP

    POP HL
    POP BC
    POP AF
    RET


; HL = String to compare
; DE = String Pattern
CMP_STRING_START:
    LD A,(DE)
    AND A
    RET Z; RETURN Z=1 if reached END wizhout mismatch
    CP (HL)
    RET NZ; If not Match (z=0) exit
CMP_STRING_START_MATCHED:
    LD A,(HL)
    AND A; String to compare reached end
    RET Z
CMP_STRING_START_CONTINUE:
    INC HL
    INC DE
    JP CMP_STRING_START
    
; REG A Contains CHAR-Low
; If failed, Carry is set
HEX_TO_BIN:
    SUB 48 ; 0 is 0
    JP PE, HEX_TO_INVALID_2; to low (SUB overflow)
    CP 10 ; Value is between 0 and 9
    JR C, HEX_TO_BIN_2
    SUB 7
    JP PE, HEX_TO_INVALID_2; to low (SUB overflow)
HEX_TO_BIN_2:
    CP 16
    JR NC, HEX_TO_INVALID_2; if bigger than 15-> fail
    AND 0x0F
    RET
HEX_TO_INVALID_2:
    LD A,1
    ADD 255
    RET

; BC Contains Address to string
; E is 0xFF if error
; E is 0x00 if okay
DHEX_TO_BYTE:
    PUSH BC
    ; Load First Byte
    LD A,(BC)
    CALL HEX_TO_BIN
    ;JP C,DHEX_TO_BYTE_FAILED
    SLA A
    SLA A
    SLA A
    SLA A
    LD D,A

    INC BC
    LD A,(BC)
    CALL HEX_TO_BIN
    ;JP C,DHEX_TO_BYTE_FAILED
    OR D ; Merge
    
    POP BC
    LD E,0x00
    RET
DHEX_TO_BYTE_FAILED:
    LD E,0xFF
    ;LD A,0x00
    POP BC
    RET

;Strings
MSG_CLEAR:
    db 27, '[2J', 27, '[H',0