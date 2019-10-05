.intel_syntax noprefix
.global putc

# put character into stdout.
# input:
#   rax: charactor to display
# output: none

putc:
    push rbp
    push rbx
    mov rbp, rsp

    dec rsp
    mov byte ptr [rsp], al
    mov rax, rsp
    mov rbx, 1
    call putstr

    mov rsp, rbp
    pop rbx
    pop rbp
    ret
