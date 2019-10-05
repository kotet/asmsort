.intel_syntax noprefix
.global main

main:
    push rbp
    mov rbp, rsp
mainloop:
    call getint
    call putint
    dec rsp
    mov byte ptr [rsp], 0x0A
    mov rax, rsp
    mov rbx, 1
    call putstr
    jmp mainloop

    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret
