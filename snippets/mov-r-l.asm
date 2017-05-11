;nasm mov-r-l.asm && gdb --args ../demo mov-r-l

bits 32
%include "include/all.asm"

    ; mov eax, 'ABCD'

    push 'xxxx'
    pop eax
    xor eax, 'xxxx'
    xor eax, 'ABCD'


    push 'xxxx'
    pop edx
    xor edx, 'xxxx'
    xor edx, 0x30303030 ; ~ '0000'

