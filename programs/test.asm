    org 04480h
CONSOLE_PRINTSTR    equ 00208h

START:
    LD BC, [STR]
    CALL CONSOLE_PRINTSTR
    HALT

STR:
    db 13,10,'Hello World',0
