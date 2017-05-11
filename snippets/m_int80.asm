bits 32
%include "include/all.asm"

    ; Clear eax and ecx
    push 'xxxx'
    pop eax
    xor eax, 'xxxx'

    ; Create 0x80 in eax
    xor al, '0' ; Getting highest possible number from ascii chars (0x7F)
    xor al, 'O'

    push eax ; Move eax to ecx to allow increment
    pop ecx
    inc ecx ; 0x80

    push ecx ; move 0x80 back to eax
    pop eax

    ; We have 0x80 in both eax and ecx

    xor al, 'M' ; 0x4D
    ; al == 0xCD

    ; We now have 0xCD and 0x80 in eax and ecx respectively
    mov [????], al
    mov [????+1], cl
