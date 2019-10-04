.intel_syntax noprefix
.global main

main:
    push rbp
    mov rbp, rsp

    mov rax, 12345678
    call putint

    dec rsp
    mov byte ptr [rsp], 0x0A
    mov rax, rsp
    mov rbx, 1
    call putstr

    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret
