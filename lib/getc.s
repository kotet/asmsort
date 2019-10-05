.intel_syntax noprefix
.global getc

# read single character from stdin
# input: none
# output: 
#   rax: the character read
getc:
    push rdi
    push rsi
    push rbp
    mov rbp, rsp

    sub rsp, 1
    mov rax, 0 # system call number (read)
    mov rdi, 1 # file discriptor (stdout)
    mov rsi, rsp # address
    mov rdx, 1 # length
    syscall
    movzx rax, byte ptr [rsp]

    mov rsp, rbp
    pop rbp
    pop rsi
    pop rdi
    ret
