.intel_syntax noprefix
.global putint

# put integer into stdout.
# input:
#   rax: unsigned int to display
# output: none
putint:
    push rbp
    push rbx
    push rdx
    mov rbp, rsp

    mov rbx, 10 # divisor

putint_loop:

    mov rdx, 0
    div rbx # rax = rax / 10, rdx = rax % 10

    add rdx, 0x30 # rdx += '0'
    dec rsp
    mov byte ptr [rsp], dl
    test rax, rax
    jne putint_loop # if rax != 0

    mov rax, rsp # address
    mov rbx, rbp # length = rbp-rsp
    sub rbx, rsp
    call putstr

    mov rsp, rbp
    pop rdx
    pop rbx
    pop rbp
    ret
