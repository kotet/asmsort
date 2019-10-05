.intel_syntax noprefix
.global main
.global input_loop_exit

main:
    push rbp
    mov rbp, rsp

    call getint # array length
    mov rbx, rax

    mov r8, 8
    mul r8
    sub rsp, rax # allocate array
    mov r8, 0 # counter
input_loop_cond:
    cmp r8, rbx
    jb input_loop_body
    jmp input_loop_exit
input_loop_body:
    call getint
    mov qword ptr[rsp+8*r8], rax

    inc r8
    jmp input_loop_cond
input_loop_exit:

    mov rax, rsp
    call sort

    mov r8, 0 # counter
output_loop_cond:
    cmp r8, rbx
    jb output_loop_body
    jmp output_loop_exit
output_loop_body:
    mov rax, qword ptr[rsp+8*r8]
    call putint
    mov rax, 0x20 # space
    call putc

    inc r8
    jmp output_loop_cond
output_loop_exit:
    mov rax, 0x0A # line feed
    call putc
    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret
