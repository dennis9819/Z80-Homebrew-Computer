;-------------------------------------------------
; Z8C/MEGA80 P-ATA IO Functions
; by Dennis Gunia 2022/02
; Version 0.1
;
; For Z8C Monitor
;-------------------------------------------------

; Constant Values
IDEDefaultBufferLocation    equ 00410h
IDEDefaultSectorCount       equ 1
IDEVarMemoryLocation        equ 04100h
IDEBasePort                 equ 0A1h

    title Z8C_IDE_BASIC_IO

; Make Vars public for other programs to use
    public IDECurrentSector, IDECurrentCyl, IDESectorCount, IDEDefaultBufferLocation, IDEStatus
; Same for functions
    public IDEInit, IDEMount

; Dynamic VARs
IDEVarTemplate:
    phase IDEVarMemoryLocation  ;Change pointers to this template to the specified location
; IDE Interface Vars
; IDE is using address-space starting at 04100h
IDECurrentSector:   ; Start sector
    defb 0x00
IDECurrentCyl:      ; Start cylinder 
    defw 0x0000
IDESectorCount:     ; Sectors to load
    defb IDEDefaultSectorCount
IDEBufferLocation:  ; Starting location for buffer
    defw IDEDefaultBufferLocation
IDEStatus:
    defb 0x00       ; Default 0x00

IDEVarTemplateEnd:
    dephase

; IDE System Calls
IDEInit:
    ; Copy IDEVarTemplate to memory
    LD HL, IDEVarMemoryLocation     ;Load destination into HL
    LD BC, IDEVarTemplate           ;Load source into BC
    LD DE,[IDEVarTemplateEnd]       ;Load end into DE
IDEInit_copy_loop:
    LD A,(HL)       ;Copy value
    LD (BC),A       
    INC BC          ;Increment pointers
    INC DE
    PUSH HL         ;Backup HL
    SBC HL,DE       ;Check if next pointer matches end
    POP HL          ;Restore HL
    JP NZ, IDEInit_copy_loop    ;Loop if pointer != end
    ; template copy done

    ; no more setup steps. Disk is initialized within the mount call
    RET 

; Mount disk
IDEMount:
    RET



IDELoadSector:      ; Fast-Load 16-Bit IDE Data
    LD HL,([IDEBufferLocation])
    LD B,0  ; Set byte-counter to 0 => 256 Bytes loades
    LD C,IDEBasePort
IDELoadSectorLoop1: ; Load first 256 Bytes
    INI             ; Load byte HL, dec counter, inc HL
    LD A,B
    XOR 01h         ; Alternate 16 bit register High-Byte / Low-Byte
    LD B,A
    JP NZ, IDELoadSectorLoop1
    LD B,0          ; Set byte-counter to 0 => 256 Bytes loades
IDELoadSectorLoop2: ; Load first 256 Bytes
    INI             ; Load byte HL, dec counter, inc HL
    LD A,B
    XOR 01h         ; Alternate 16 bit register High-Byte / Low-Byte
    LD B,A
    JP NZ, IDELoadSectorLoop2
IDELoadSectorEnd:
    RET