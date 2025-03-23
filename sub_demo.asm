SECTION "Header", ROM0[$100]
jp start

; --- NINTENDO LOGO (MUST MATCH EXACTLY) ---
SECTION "Nintendo Logo", ROM0[$104]

    db $CE, $ED, $66, $66, $CC, $0D, $00, $0B
    db $03, $73, $00, $83, $00, $0C, $00, $0D
    db $00, $08, $11, $1F, $88, $89, $00, $0E
    db $DC, $CC, $6E, $E6, $DD, $DD, $D9, $99
    db $BB, $BB, $67, $63, $6E, $0E, $EC, $CC
    db $DD, $DC, $99, $9F, $BB, $B9, $33, $3E

; --- GAME TITLE & HEADER METADATA ---
SECTION "Header Metadata", ROM0[$134]

    db "sub_demo.gb", 0, 0, 0, 0, 0 ; Game title (11 characters max)
    db $01   ; Game Boy Color compatibility (set to $00 for DMG)
    db $00   ; License code (old)
    db $00   ; Cartridge type (ROM only)
    db $00   ; ROM size (32 KB)
    db $00   ; RAM size (none)
    db $00   ; Destination code (Japan)
    db $33   ; Licensee code (new)
    db $01   ; Version number
    db $00   ; Header checksum (will be fixed by rgbfix)
    db $00, $00 ; Global checksum (also fixed by rgbfix)

SECTION "Main Code", ROM0[$150]
;Simple 6-4 demo. Results in register A having 2.
start:
;Store value 6 at register A. Sub the value 4 to register A.
ld a, 6
sub a, 4
;A now contains value 2.
stop