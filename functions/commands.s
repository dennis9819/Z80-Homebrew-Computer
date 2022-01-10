ARR_COMMANDS:
    ; Version
    byte 3,
    db "ver",0,
    word [MSG_CMD_VER],
    ; Clear
    byte 3,
    db "clr",0,
    word [MSG_CMD_VER],
    ; Help
    byte 1,
    db "?",0,
    word [MSG_CMD_VER],