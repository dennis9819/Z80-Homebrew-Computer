SUB_SOUNDCHECK:
    org 0x0A00
    ; turn on channel A
    LD	  D,0x08	; Select register #8
    LD	  A,0x0F	; Volume channel A full
    CALL AY0_WRITE_REG

    LD	  D,0x00	; Select register #0
    LD	  A,0x5D	; Write #93 into register #0
    CALL AY0_WRITE_REG	

    LD	  D,0x01	; Select register #1
    LD	  A,0x0D	; Write #13 into register #1
    CALL AY0_WRITE_REG

    LD	  D,0x07	; Select register #7
    LD	  A,0x3E	; Enable output Channel A (0011 1110)
    CALL AY0_WRITE_REG



    LD BC, [STR_SOUNDCHECK_DONE]
    CALL CONSOLE_PRINTSTR

    JP CONSOLE_PROMPT

SUB_PLAY:
    org 0x0A30

    LD BC,[tune_test1]

SUB_PLAY_LOOP:
    ; Load next byte of melody
    LD A,(BC)
    LD D,A; Backup A
    
    INC A; Test if FF
    JP Z, SUB_PLAY_EXIT ; Exit on 0xFF

    CP 0x11
    JP Z, PLAY_DELAY; Delay function

    LD A,D
    OUT (IO_AY0_ADDR),A
    INC BC
    LD A,(BC)
    OUT (IO_AY0_DATA),A
    INC BC

    JR SUB_PLAY_LOOP

SUB_PLAY_EXIT:
    LD BC, [STR_PLAYBACK_DONE]
    CALL CONSOLE_PRINTSTR
    JP CONSOLE_PROMPT

PLAY_DELAY:
    INC BC
    LD A,(BC)
PLAY_DELAY_LOOP:
    LD D,A
    LD A,255
PLAY_DELAY_LOOP_1:
    NOP
    NOP
    NOP
    NOP
    DEC A
    JP NZ, PLAY_DELAY_LOOP_1
    LD A,D
    DEC A
    JP NZ, PLAY_DELAY_LOOP
    INC BC
    JP SUB_PLAY_LOOP

; A contains Data
; C Contains Addr
AY0_WRITE_REG:
    LD B,A
    LD A,D
    OUT (IO_AY0_ADDR),A
    LD A,B
    OUT (IO_AY0_DATA),A
    RET
    

STR_SOUNDCHECK_DONE:
    db 13,10,"Soundcheck done!",13,10,0
STR_PLAYBACK_DONE:
    db 13,10,"Playback done!",13,10,0

.include "tune_test1.s"
