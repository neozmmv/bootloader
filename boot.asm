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
MOV SP, AX

; define stack pointer as mbr start address

MOV SP, 0x7C00

; 0xB8000 VGA ADDRESS
; 0x07 for white on black text


MOV AX, 0xB800
MOV ES, AX ; now ES points to VGA memory
MOV SI, MSG ; source index register

; loop for printing string
; https://www.ctyme.com/intr/int-10.htm
.loop:
    MOV AL, [SI]
    CMP AL, 0 ; check for null terminator
    JE .halt
    INC SI    ; moves to next byte in string
    MOV AH, 0x0E ; teletype output function
    INT 0x10 ; call BIOS video interrupt
    JMP .loop


.halt:
    JMP $ ; halt

; data section
MSG DB "OS is just a fruit of your imagination", 0
; write all remaining bytes to zero and last two bytes 0x55 and 0xAA
TIMES 510 - ($ - $$) DB 0 ; $ - current byte, $$ program start byte (0x7C00)
DW 0xAA55 ; little-endian