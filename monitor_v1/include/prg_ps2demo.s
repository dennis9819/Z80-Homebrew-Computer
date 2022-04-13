ps2demo_run:

    call keyboard_init

ps2demo_run_loop:
    call keyboard_read
    call print_a_hex
    call print_newLine
    jp ps2demo_run_loop



