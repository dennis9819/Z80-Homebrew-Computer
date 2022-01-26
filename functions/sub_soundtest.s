MEM_MUSIC_POINTER equ 0x40F0
MEM_MUSIC_DELAY equ 0x40F2
MEM_MUSIC_STATE equ 0x40F3

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


; Start Addr = MEM_MUSIC_POINTER
SUB_PLAY_CTC:
    LD A,0x00
    LD (MEM_MUSIC_DELAY),A  ;Reset delay counter
    LD A,0x01
    LD (MEM_MUSIC_STATE),A  ; Set playback-status to 0x01 = Running
    LD BC,[song_demo2]
    LD (MEM_MUSIC_POINTER), BC  ; Preload Music Counter
    ; Set CTC Ch3 Interrupt Vector
    LD A,10h    ; it vector defined in bit 7­3,bit 2­1 don't care, bit 0 = 0
    OUT (IO_CTC0_C0),A
    ; Init CTC Channel 3
    LD A,10100111b
    OUT (IO_CTC0_C2),A
    ;LD A,0x34 ; 55Hz ISR
    LD A,0xFF ; 55Hz ISR
    OUT (IO_CTC0_C2),A

    LD A,0
    LD I,A  ;load I reg with zero
    IM 2    ;set int mode 2
    EI  ; Enable Interrupts
    ;JP CONSOLE_PROMPT


SUB_PLAY_CTC_LOOP:
    LD A,(MEM_MUSIC_STATE)      ; wait until playback is complete
    AND A                       ; check if a == 0x00
    NOP                         ; sit here and wait
    JR NZ, SUB_PLAY_CTC_LOOP    ; Loop as long as Status is not 0x00, loop

SUB_PLAY_CTC_END:
    DI                          ; disable interrupts
    LD A,0x00                   ; load CTC controll register value in A -> 0x00 eq stop
    OUT (IO_CTC0_C2),A          ; write to CTC Ch2 -> disable CTC2

    LD	  D,0x08	; Select register #8
    LD	  A,0x00	; Volume channel A 0
    CALL AY0_WRITE_REG
    LD	  D,0x09	; Select register #9
    LD	  A,0x00	; Volume channel B 0
    CALL AY0_WRITE_REG
    LD	  D,0x0A	; Select register #10
    LD	  A,0x00	; Volume channel C 0
    CALL AY0_WRITE_REG
    
    LD BC, [STR_PLAYBACK_DONE]
    CALL CONSOLE_PRINTSTR
    JP CONSOLE_PROMPT


; Music Interrupt Service Routine
SUB_PLAY_CTC_ISR:
    DI          ; Disable INT and swap registers
    EX AF,AF'   ;
    EXX         ;

    ; Check if delay
    LD A,(MEM_MUSIC_DELAY)
    AND A                       ; If Countdown == 0
    JR Z, SUB_PLAY_CTC_ISR_CONT ; Execute SUB_PLAY_CTC_ISR_CONT
                                ; Else continue with delay routine
    DEC A
    LD (MEM_MUSIC_DELAY),A      ; Dec Delay and store to RAM
    JR SUB_PLAY_CTC_ISR_END     ; Always end ISR

    ; Playback routine
SUB_PLAY_CTC_ISR_CONT:
    LD BC,(MEM_MUSIC_POINTER)
SUB_PLAY_CTC_ISR_CONT_LOOP:
    LD A,(BC)   ; Load first byte of Instruction
    LD D,A      ; Backup A (Register Addr)
    
    CP 0xF0; Test if F0
    JR Z, SUB_PLAY_CTC_ISR_EXIT_RTE ; Exit on 0xF0

    CP 0xFF; Test if FF
    JR Z, SUB_PLAY_CTC_ISR_NEXT ; Skip ISR on 0xFF

    ;CP 0x10; Test if 0-15
    ;JR NC, SUB_PLAY_CTC_ISR_NEXT_BYTE  ;if true continue (is valid)

    CP 0xFE
    JR Z, SUB_PLAY_CTC_ISR_INIT_DELAY; Delay if 0xFE. duration: next byte x4

    ; Execute Instruction
    LD A,D          
    OUT (IO_AY0_ADDR),A ; Set Register Addr (1st byte)
    INC BC
    LD A,(BC)
    OUT (IO_AY0_DATA),A ; Set Data Register (2nd byte)
    INC BC
    JR SUB_PLAY_CTC_ISR_CONT_LOOP

SUB_PLAY_CTC_ISR_END:
    EXX         ; swap registers and enable INT
    EX AF,AF'   ;
    EI          ;
    RETI        ; Exit ISR

SUB_PLAY_CTC_ISR_INIT_DELAY:
    INC BC
    LD A,(BC)
    ADD A   ; x2
    ADD A   ; x2x2 (x4)
    SUB 1   ; sub 1 to account for this ISR
    LD (MEM_MUSIC_DELAY),A      ; Store delay to RAM
    ;CALL PRINT_A_HEX
    INC BC
    LD (MEM_MUSIC_POINTER),BC   ; Update Music Pointer in Ram
    JR SUB_PLAY_CTC_ISR_END

SUB_PLAY_CTC_ISR_NEXT:
    INC BC
    LD (MEM_MUSIC_POINTER),BC   ; Update Music Pointer in Ram
    JR SUB_PLAY_CTC_ISR_END

SUB_PLAY_CTC_ISR_EXIT_RTE:  ; Called when end of song is reached
    LD A,0x00
    LD (MEM_MUSIC_STATE),A  ; Set playback-status to 0x00 = Stopped
    JR SUB_PLAY_CTC_ISR_END

SUB_PLAY_CTC_ISR_NEXT_BYTE:
    INC BC
    JR SUB_PLAY_CTC_ISR_CONT_LOOP


    
STR_SOUNDCHECK_DONE:
    db 13,10,"Soundcheck done!",13,10,0
STR_PLAYBACK_DONE:
    db 13,10,"Playback done!",13,10,0



.include "tune_test1.s"
.include "song.s"

INT_VEC_SND:    ;interrupt vector table entry for CTC Ch2
    org 14h
    DEFW SUB_PLAY_CTC_ISR