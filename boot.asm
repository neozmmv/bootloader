; --------------------
; Master Boot Record ;
; --------------------

; i'm learning this and writing by hand btw
; intel i386
; 512 bytes, two last are 0x55 and 0xAA.
; BIOS reads MBR to 0x7C00 to 0x7DFF

; BIOS gives control on REAL MODE (16 bits)
[BITS 16]
[ORG 0x7C00] ; defines program start on MBR start

; clear sector registers
; sector registers can't be xor'd
