tune_test1:
    ;commands are a set of two bytes each
    ;byte 0 register
    ;byte 1 data
    ;if byte 0 is 10h, byte 1 is delay
    ;if byte FF then exit
    db 0x08,0x0F ; R08 - Ch A Amplitude
    db 0x00,0xFF ; R00 - Ch A Tone Period
    db 0x01,0x04 ; R01 - Ch A Tone Period
    db 0x07,0x3E ; R07 - Enable 
    db 0x10,0x2F ; Delay
    db 0x01,0x07 ; R01 - Ch A Tone Period
    db 0x10,0x2F ; Delay
    db 0x01,0x03 ; R01 - Ch A Tone Period
    db 0x10,0x2F ; Delay

    db 0x01,0x07 ; R01 - Ch A Tone Period
    db 0x10,0x0F ; Delay
    db 0x01,0x03 ; R01 - Ch A Tone Period
    db 0x10,0x0F ; Delay
    db 0x01,0x07 ; R01 - Ch A Tone Period
    db 0x10,0x0F ; Delay
    db 0x01,0x03 ; R01 - Ch A Tone Period
    db 0x10,0x0F ; Delay
    db 0x01,0x07 ; R01 - Ch A Tone Period
    db 0x10,0x0F ; Delay
    db 0x01,0x03 ; R01 - Ch A Tone Period
    db 0x10,0x0F ; Delay
    db 0x01,0x07 ; R01 - Ch A Tone Period
    db 0x10,0x0F ; Delay
    db 0x01,0x03 ; R01 - Ch A Tone Period
    db 0x10,0x0F ; Delay

    db 0x08,0x00 ; R08 - Ch A Amplitude



    db 0xFF      ; END