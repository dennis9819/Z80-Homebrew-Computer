MOD_COMMANDS:
    ;org 0x0370

;-------------------------------------------------------------
; command directory
;-------------------------------------------------------------
ARR_COMMANDS:
    ; Version
    word [CMD_VERSION]
    db "ver",0
    ; Clear Screen
    word [CMD_CLEAR]
    db "clr",0
    ; Help
    word [CMD_HELP]
    db "?",0
    ; Set Memory
    word [CMD_MSET]
    db "mset $",0
    ; Get Memory
    word [CMD_MGET]
    db "mget $",0
    ; IO Set
    word [CMD_IOSET]
    db "ioset $",0
    ; IO Get
    word [CMD_IOGET]
    db "ioget $",0
    ; Hey-Dump
    word [CMD_HEXDUMP]
    db "hd $",0
    ; Exec
    word [CMD_EXEC]
    db "exec $",0

    ; Exec
    word [CMD_CALL]
    db "call $",0
    
    ;File System Functions
    ; List Files
    word [CMD_NOT_IMPLEMENTED]
    db "dlist",0

    ; Go Subdirectory
    word [CMD_NOT_IMPLEMENTED]
    db "dgo",0

    ; Load File to Memory
    word [CMD_NOT_IMPLEMENTED]
    db "dload ",0

    ; Store File from Memory
    word [CMD_NOT_IMPLEMENTED]
    db "dsave ",0

    ; mount FS
    word [CMD_NOT_IMPLEMENTED]
    db "dmount ",0

    ; ununt FS
    word [CMD_NOT_IMPLEMENTED]
    db "dumount ",0

    ; remove file
    word [CMD_NOT_IMPLEMENTED]
    db "drem ",0

    ; disk info
    word [CMD_NOT_IMPLEMENTED]
    db "dinfo ",0

    word 0x0000 ; END

STR_NOTFOUND:
    db 13,10,"invalid command/syntax",13,10,0

;-------------------------------------------------------------
; command parser
;-------------------------------------------------------------

;*****************
; PARSE_CMD
;*****************
;Description: Pares Input Command
;
;Inputs: none
;
;Outputs: none
;
;Destroys: A, BC, DE, HL
PARSE_CMD:
    LD DE, [ARR_COMMANDS]           ; Load compare ADDR 

PARSE_CMD_START:
    LD A, (DE)                       ;Load first 2 bytes: Jump address
    LD C,A
    INC DE   
    LD A, (DE)                       ;Load first 2 bytes: Jump address
    LD B,A
    INC DE                          ;DE is now the starting address of the null-terminated-string 
    
    ; Compare 16 bit routine pointer
    LD HL,0000h                     ;load HL with value to compare -> 0x0000
    SBC HL,BC                       ;substract HL from BC. If both match, Z flag will be set
    JP Z,PARSE_CMD_NO_MATCH         ;jmp to exit block for parser
    ; if > 0 -> continue

    LD HL, [MEM_PROMPT_START]       ; Input Buffer
    CALL PARSE_CMD_CMP_STRING_START ;parse 1st elemeent
    JP Z,PARSE_CMD_START_FOUND      ;jmp to pointer if match

PARSE_CMD_START_NOT_FOUND:          ;inc DE to next element
    LD A,(DE)                       ;find end of string -> load current byte
    INC DE                          
    AND A                           ;find null termination
    JP Z, PARSE_CMD_START          ;if current byte-1 == 0x00 -> continue loop @ PARSE_CMD_START
    JP PARSE_CMD_START_NOT_FOUND

PARSE_CMD_START_FOUND:              ;if command matched
    CALL PARSE_CMD_START_EXEC       ;call routine
    RET                             ;exit parser

PARSE_CMD_START_EXEC:               ;dynamic Z80 call -> serves as function and will put last PC value on stack


    LD H,B                       ;load HL with pointer to routine
    LD L,C
    JP (HL)                         ;jmp to routine
    
PARSE_CMD_NO_MATCH:                 ;if no command matched
    LD BC,[STR_NOTFOUND]            ;load pointer to string STR_NOTFOUND
    CALL CONSOLE_PRINTSTR           ;print null-terminated string to console
    RET                             ;exit parser

; HL = String to compare
; DE = String Pattern
PARSE_CMD_CMP_STRING_START:
    LD A,(DE)
    AND A
    RET Z; RETURN Z=1 if reached END wizhout mismatch
    CP (HL)
    RET NZ; If not Match (z=0) exit
PARSE_CMD_CMP_STRING_START_MATCHED:
    LD A,(HL)
    AND A; String to compare reached end
    RET Z
PARSE_CMD_CMP_STRING_START_CONTINUE:
    INC HL
    INC DE
    JP PARSE_CMD_CMP_STRING_START
    
;-------------------------------------------------------------
; commands routines
;-------------------------------------------------------------
CMD_HELP:
    LD BC,[MSG_CMD_HELP]
    CALL CONSOLE_PRINTSTR

    LD A,13
    out (IO_SIO0B_D),A
    call TX_EMP
    LD A,10
    out (IO_SIO0B_D),A
    call TX_EMP
    RET

CMD_VERSION:
    LD BC,[MSG_CMD_VER]
    CALL CONSOLE_PRINTSTR

    LD A,13
    out (IO_SIO0B_D),A
    call TX_EMP
    LD A,10
    out (IO_SIO0B_D),A
    call TX_EMP
    RET

CMD_CLEAR:
    LD BC,[MSG_CLEAR]
    CALL CONSOLE_PRINTSTR
    CALL TermClear
    RET

CMD_HEXDUMP:
    LD BC,MEM_PROMPT_START + 4
    CALL DHEX_TO_BYTE
    LD H,A

    LD BC,MEM_PROMPT_START + 6
    CALL DHEX_TO_BYTE
    AND 0xF0
    LD L,A

    CALL PRINT_HEXDUMP
    RET

CMD_EXEC:
    LD BC,MEM_PROMPT_START + 6
    CALL DHEX_TO_BYTE
    LD H,A

    LD BC,MEM_PROMPT_START + 8
    CALL DHEX_TO_BYTE
    LD L,A

    LD SP,0x7FFF
    JP HL

CMD_CALL:
    LD BC,MEM_PROMPT_START + 6
    CALL DHEX_TO_BYTE
    LD H,A

    LD BC,MEM_PROMPT_START + 8
    CALL DHEX_TO_BYTE
    LD L,A
    CALL CMD_CALL_TRICK

CMD_CALL_TRICK:
    JP HL


CMD_IOGET:
    LD BC,MEM_PROMPT_START + 7
    CALL DHEX_TO_BYTE
    LD C, A

    LD A,13
    out (IO_SIO0B_D),A
    call TermPrintChar
    call TX_EMP
    LD A,10
    out (IO_SIO0B_D),A
    call TermPrintChar
    call TX_EMP

    IN A,(C)
    CALL PRINT_A_HEX
    call TermPrintChar
    LD A,'h'

    out (IO_SIO0B_D),A
    call TX_EMP
    LD A,13
    out (IO_SIO0B_D),A
    call TX_EMP
    LD A,10
    out (IO_SIO0B_D),A
    call TX_EMP
    RET

CMD_IOSET:
    LD BC,MEM_PROMPT_START + 7
    CALL DHEX_TO_BYTE
    LD H,A

    LD BC,MEM_PROMPT_START + 10
    CALL DHEX_TO_BYTE

    ;; DEBUG START
    PUSH AF

    LD A,' '
    out (IO_SIO0B_D),A
    call TX_EMP

    LD A,H
    CALL PRINT_A_HEX

    POP AF
    ;; DEBUG END

    LD C,H
    OUT (C),A

    LD A,13
    out (IO_SIO0B_D),A
    call TX_EMP
    LD A,10
    out (IO_SIO0B_D),A
    call TX_EMP
    RET

CMD_MSET:
    LD BC,MEM_PROMPT_START + 6
    CALL DHEX_TO_BYTE
    LD H,A

    LD BC,MEM_PROMPT_START + 8
    CALL DHEX_TO_BYTE
    LD L,A

    
    LD BC,MEM_PROMPT_START + 11
    CALL DHEX_TO_BYTE
    
    LD (HL),A

    LD A,13
    out (IO_SIO0B_D),A
    call TX_EMP
    LD A,10
    out (IO_SIO0B_D),A
    call TX_EMP
    RET

CMD_MGET:
    LD BC,MEM_PROMPT_START + 6
    CALL DHEX_TO_BYTE
    LD H,A

    LD BC,MEM_PROMPT_START + 8
    CALL DHEX_TO_BYTE
    LD L,A

    LD A,13
    out (IO_SIO0B_D),A
    call TermPrintChar
    call TX_EMP
    LD A,10
    out (IO_SIO0B_D),A
    call TermPrintChar
    call TX_EMP
    LD A,(HL)
    CALL PRINT_A_HEX
    LD A,'h'
    out (IO_SIO0B_D),A
    call TermPrintChar
    call TX_EMP
    LD A,13
    out (IO_SIO0B_D),A
    call TX_EMP
    LD A,10
    out (IO_SIO0B_D),A
    call TX_EMP
    RET

CMD_NOT_IMPLEMENTED:
    LD BC,[MSG_NOT_IMPLEMENTED]
    CALL CONSOLE_PRINTSTR
    RET

;-------------------------------------------------------------
; commands strings
;-------------------------------------------------------------
MSG_SYS_VER:
    db 27, '[2J', 27, '[H'
    db 'Z8C Mk IV - A Z80 Homebrew Computer',13,10
    db 'Monitor ROM Ver. 1.0 by Dennis Gunia (2022)',13,10
    db '48k RAM - 4MHz Z80 CPU - Stack $',0

MSG_CMD_HELP:
    db 13,10
    db "hd $<addr>  mget $<addr>"
    db "mset $<addr> <val> ioget $<addr>",13,10
    db "ioset $<addr> <val>  ? clr  ver",13,10
    db "exec $<addr>  call $<addr>",13,10
    ;db "dlist  dgo <dir>  dload <file> ($<addr>)",13,10
    ;db "dsave <file> $<addr> [<len>,$<addr_end>]",13,10
    ;db "dmount  dumount  drem <file>  dinfo"
    db 0

MSG_CMD_VER:
    db 13,10
    db "Z8C Monitor Programm ROM Version 1.0",13,10
    db "Written by Dennis Gunia, 2022",13,10
    db "3.686411MHz 48K RAM System, John 3,16",13,10
    db "www.dennisgunia.de"
    db 0

MSG_NOT_IMPLEMENTED:
    db 13,10
    db "Not implemented yet",13,10
    db 0