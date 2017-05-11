bits 32
%include "include/all.asm"

start_listing:
    ; Clear eax and ecx
    push 'xxxx'
    pop eax
    xor eax, 'xxxx'

    ; XOR to value between 0-127
    xor al, '0' ; 0x30
    xor al, 'O' ; 0x4F
    ; al == 0x7F

    ; Increment to value
    push eax ; Move eax to ecx to allow increment
    pop ecx
    inc ecx ; 0x80

    ; XOR to value above 0x80
    push ecx ; move 0x80 back to eax
    pop eax

    ; XOR any two characters, to get a value between 128-255
    xor al, 'a' ; 0x61
    xor al, 't' ; 0x74
    ; al == 0x15

