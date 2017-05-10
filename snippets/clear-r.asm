;nasm clear-r.asm && gdb --args ../demo clear-r

bits 32
%include "include/all.asm"

    int3

    ; xor eax, eax
    push 'xxxx'
    pop eax
    xor eax, 'xxxx'

    push 'xxxx'
    pop ecx
    xor ecx, 'xxxx'

    push 'xxxx'
    pop edx
    xor edx, 'xxxx'











    int3


    ; Clearing ebx
    push 'xxxx'
    pop eax
    xor eax, 'xxxx'

    push eax ; eax
    push ecx ; ecx
    push edx ; edx
    push eax ; ebx
    push eax ; original esp
    push ebp ; ebp
    push esi ; esi
    push edi ; edi
    popad

    int3
