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

    db "add_demo.gb", 0, 0, 0, 0;Game title (15 characters max, unused bytes null padded)
    db $80                 ;Game Boy Color compatibility (0x80 for GBC, 0x00 for classic)
    db $00, $01            ;License code (new), two bytes treated as ascii, and put together for the actual value! https://www.zophar.net/fileuploads/2/10597teazh/gbrom.txt for common values
    db $00                 ;SGB features, (0x03 for SGB features, 0x00 for not)
    db $00                 ;Cartridge type. https://www.zophar.net/fileuploads/2/10597teazh/gbrom.txt for common values
    db $01                 ;ROM size (32KB * 2^VALUE)
    db $01                 ;Save RAM size (2KB * 2^VALUE)
    db $00                 ;Country code (0x00 is japan, 0x01 is other)
    db $01                 ;Licensee (old). https://www.zophar.net/fileuploads/2/10597teazh/gbrom.txt for common values
    db $02                 ;mask ROM version number
    db $00                 ;Header checksum (will be fixed by rgbfix)
    db $00, $00            ;Global checksum (also fixed by rgbfix)

SECTION "Main Code", ROM0[$150]
;Simple 2+4 demo. Results in register A having 6.
start:
;Store value 2 at register A. Add the value 6 to register A.
ld a, 2
add a, 4
;A now contains value 6.
stop