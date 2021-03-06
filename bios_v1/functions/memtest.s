FUNC_MEMCHECK:
    org 0x0800


; CELL ADDRESS BC
; DESTROYS     A,D
; RETURN A=0 OK
;        A>0 ERROR
FUNC_MEMCHECK_CHECK_CELL:
    LD A,BC ; BACKUP ORIGINAL VALUE
    LD D,A

    XOR A       ; SET CELL TO 0x00
    LD (BC),A

    NOP         ; Verify 0x00
    LD A,(BC)
    AND 0xFF
    JP NZ, FUNC_MEMCHECK_CHECK_CELL_FAIL_CONDITION

    LD A,0x55   ; SET CELL TO 0x55
    LD (BC),A

    NOP         ; Verify 0x55
    LD A,(BC)
    CP 0x55
    JP NZ, FUNC_MEMCHECK_CHECK_CELL_FAIL_CONDITION

    LD A,D      ; Restore original Value
    LD (BC),A

    XOR A   ; Set A to 0x00 (OKAY)
    RET

FUNC_MEMCHECK_CHECK_CELL_FAIL_CONDITION:
    LD A,0xFF
    RET