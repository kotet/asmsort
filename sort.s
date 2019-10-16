.global main

main:
    push %rbp
    mov %rsp, %rbp

    call getint # array length
    mov %rax, %rbx

    movq $8, %r8
    mul %r8
    sub %rax, %rsp # allocate array
    movq $0, %r8 # counter
input_loop_cond:
    cmp %rbx, %r8
    jb input_loop_body
    jmp input_loop_exit
input_loop_body:
    call getint
    movq %rax, (%rsp,%r8,8)

    inc %r8
    jmp input_loop_cond
input_loop_exit:

    mov %rsp, %rax
    call sort

    movq $0, %r8 # counter
output_loop_cond:
    cmp %rbx, %r8
    jb output_loop_body
    jmp output_loop_exit
output_loop_body:
    movq (%rsp,%r8,8), %rax
    call putint
    movq $0x20, %rax # space
    call putc

    inc %r8
    jmp output_loop_cond
output_loop_exit:
    movq $0x0A, %rax # line feed
    call putc
    mov %rbp, %rsp
    pop %rbp
    movq $0, %rax
    ret
