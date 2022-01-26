; Kernel Konsole Functions

VAR_CONSOLE_BAUD equ 16d ; BAUD 14400 @ 3.686441MHz & CPUCLK/2

;*****************
; CONSOLE_PRINTSTR
;*****************
;Description: Sends null-terminated String via Serial Port
;
;Inputs: BC contains start address of stringg
;
;Outputs: Output to IO_SIO0B_D
;
;Destroys: none
CONSOLE_PRINTSTR:
    ; BC contains String offset
    ; Prints null terminated string
    PUSH AF
    PUSH BC
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
    POP BC
    POP AF
    RET

;*****************
; CONSOLE_READ_CHAR
;*****************
;Description: Gets a single byte from console port
;
;Inputs: BC contains start address of stringg
;
;Outputs: Output to IO_SIO0B_D
;
;Destroys: A

CONSOLE_READ_CHAR:
    XOR	A
    OUT (IO_SIO0B_C), A
    IN A, (IO_SIO0B_C)
    AND	1
    RET	Z	
    IN A, (IO_SIO0B_D)
    ;LD D,A
    RET

;*****************
; CONSOLE_TX_WAIT/TX_EMP
;*****************
;Description: Waits until byte is sent
;
;Inputs: none
;
;Outputs: none
;
;Destroys: A
TX_EMP: ; DONT USE!!! DEPRECATED
    jp CONSOLE_TX_WAIT
CONSOLE_TX_WAIT:
    ; check for TX buffer empty
    sub a ;clear a, write into WR0: select RR0
    inc a ;select RR1
    out (IO_SIO0B_C),A
    in A,(IO_SIO0B_C) ;read RRx
    bit 0,A
    jp z,CONSOLE_TX_WAIT
    ret

;*****************
; CONSOLE_INIT
;*****************
;Description: Initializes CTC & SIO on Port B
;
;Inputs: none 
;
;Outputs: none
;
;Destroys: A
CONSOLE_INIT:
    ; Setup CTC
    ; Init Ch1 (SIO0B)
    ; For 4MHz CPU CLK 00000111b
    ; For EXT CLK
    LD A,00001111b
    OUT (IO_CTC0_C1),A

    LD A,VAR_CONSOLE_BAUD
    OUT (IO_CTC0_C1),A

    ; Setup SIO
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

    LD A,'%'
    out (IO_SIO0B_D),A
    call CONSOLE_TX_WAIT

    RET



;;


