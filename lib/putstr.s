.intel_syntax noprefix
.global putstr

# put string into stdout.
# input:
#   rax: address to head of string
#   rbx: length of string
# output: none
putstr:
    push rsi
    push rdi
    push rdx

    mov rsi, rax # address
    mov rax, 1 # system call number (write)
    mov rdi, 1 # file discriptor (stdout)
    mov rdx, rbx # length
    syscall

    mov rax, rdx
    pop rdx
    pop rdi
    pop rsi
    ret
