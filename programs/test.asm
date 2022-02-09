    org 04800h
CONSOLE_PRINTSTR    equ 0039Ah

START:
    LD BC, [STR]
    CALL CONSOLE_PRINTSTR
    HALT

STR:
    db 13,10,'Hello World',0
