.globl main

main:
    push %rbp
    mov %rsp, %rbp
mainloop:
    call getint
    call putint
    dec %rsp
    movb $0x0A, (%rsp)
    mov %rsp, %rax
    movq $1, %rbx
    call putstr
    jmp mainloop

    mov %rbp, %rsp
    pop %rbp
    mov $0, %rax
    ret
