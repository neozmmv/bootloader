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
; https://wiki.osdev.org/Real_Mode
; There are six 16-bit segment registers:
; CS, DS, ES, FS, GS, and SS. When using segment registers, addresses are given with the following notation
; (where 'Segment' is a value in a segment register and 'Offset' is a value in an address register): 

XOR AX, AX
MOV DS, AX
MOV ES, AX
MOV FS, AX
MOV GS, AX
MOV SS, AX