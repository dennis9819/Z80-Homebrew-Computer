
; Kernel Conversion Functions



;*****************
; Convert Byte to Hex Char (ASCII)
;*****************
;Description: the StrLength function inline
;
;Inputs: A contains input byte
;
;Outputs: BC contains 2 Bytes of ASCII (HEX)
;
;Destroys: A, BC,
STRCONV_BYTES_TO_HEX:
    PUSH AF;Backup A Register
    RRA
    RRA
    RRA
    RRA
    CALL STRCONV_BYTES_TO_HEX_1
    ;LD A,D
    LD B,A  
    POP AF ; Reload first Byte
    CALL STRCONV_BYTES_TO_HEX_1
    ;LD A,D
    LD C,A
    RET

STRCONV_BYTES_TO_HEX_1:
    AND 0x0F
    ADD 48
    CP 58 ; Check if less than 58 (less than ASCII 9)
    JR C, STRCONV_BYTES_TO_HEX_2
    ADD 7 ; A-F
STRCONV_BYTES_TO_HEX_2:
    ;LD D,A
    RET



