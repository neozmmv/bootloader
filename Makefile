
.PHONY: bootloader run floppy

bootloader:
	nasm -f bin boot.asm -o boot.bin

run:
	qemu-system-i386 -drive format=raw,file=boot.bin

floppy:
	qemu-system-i386 -drive file=boot.bin,format=raw,if=floppy