;nasm mov-r-l.asm && gdb --args ../demo mov-r-l

bits 32
%include "include/all.asm"

    ; mov eax, 0x12345678

    push '____'
    pop eax
    xor eax, '____'
    xor eax, 0x12345678


    int3
















    ; Move illegal characters/literals
    push '____'
    pop eax
    xor eax,'____'

    xor al, 'O' ; O  = 01001111
    xor al, 'D' ; D  = 01000100
                ; \t = 00001011

    int3
