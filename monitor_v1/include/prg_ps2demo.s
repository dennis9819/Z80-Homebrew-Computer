ps2demo_run:

    call keyboard_init

ps2demo_run_loop:
    call keyboard_read
    or a
    jr z, ps2demo_run_loop
    push af
    ld a,"E"
    call print_char
    ld a," "
    call print_char
    ld a,(var_ps2_err)
    call print_a_hex
    ld a," "
    call print_char
    ld a," "
    call print_char
    ld a,"D"
    call print_char
    ld a," "
    call print_char
    pop af
    call print_a_hex
    call print_newLine
    jr ps2demo_run_loop