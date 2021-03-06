; Hello World Program
; compile: nasm -f elf helloworld.asm
; Link with: ld -m elf_i386 helloworld.o
; Run with: ./helloworld

SECTION .data
msg	db	'Hello Aldin!', 0AH ; assign msg variable with your message string

SECTION .text
global _start

_start:

    mov     edx, 13     ; number of bytes to write - one for each letter plus 0Ah (line feed character)
    mov     ecx, msg    ; move the memory address of our message string into ecx
    mov     ebx, 1      ; write to the STDOUT file
    mov     eax, 4      ; invoke SYS_WRITE (kernel opcode 4)
    int     80h

    mov     ebx, 0      ; return 0 status on exit - 'No Errors'
    mov     eax, 1      ; invoke SYS_EXIT (kernel opcode 1)
    int     80h
