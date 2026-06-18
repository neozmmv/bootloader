
.PHONY: bootloader

bootloader:
	nasm -f bin boot.asm -o boot.bin