bits 32
%include "include/all.asm"

    ; mov eax, ebx
    push ebx
    pop eax

    ; Cannot pop ebx
    push eax ; eax
    push ecx ; ecx
    push edx ; edx
    push eax ; ebx
    push eax ; original esp
    push ebp ; ebp
    push esi ; esi
    push edi ; edi
    popad
