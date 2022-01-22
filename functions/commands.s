ARR_COMMANDS:
    ; Version
    word [MSG_CMD_VER],
    db "ver",0,
    ; Clear Screen
    word [MSG_CMD_VER],
    db "clr",0,
    ; Help
    word [MSG_CMD_VER],
    db "?",0,
    ; Set Memory
    word [MSG_CMD_VER],
    db "mset $",0,
    ; Get Memory
    word [MSG_CMD_VER],
    db "mget $",0,
    ; IO Set
    word [MSG_CMD_VER],
    db "ioset $",0,
    ; IO Get
    word [MSG_CMD_VER],
    db "ioget $",0,
    ; Hey-Dump
    word [MSG_CMD_VER],
    db "hd $",0,
    ; Exec
    word [MSG_CMD_VER],
    db "exec $",0,

;*****************
; PARSE_CMD
;*****************
;Description: Pares Input Command
;
;Inputs: none
;
;Outputs: none
;
;Destroys: A, BC, DE
PARSE_CMD:
    LD HL, [MEM_PROMPT_START]   ; Input Buffer
    LD DE, [ARR_COMMANDS]       ; Load compare ADDR 

PARSE_CMD_START:
    LD BC, DE   ; Load first 2 bytes: Jump address
    INC DE
    INC DE
    CALL PARSE_CMD_CMP_STRING_START
    JP NZ,PARSE_CMD_START_FOUND
    INC DE
    JP PARSE_CMD_START;

PARSE_CMD_START_FOUND:
    CALL PARSE_CMD_START_EXEC
    RET 

PARSE_CMD_START_EXEC:
    JP HL, BC
    JP (HL)
    

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
    