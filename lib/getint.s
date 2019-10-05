.intel_syntax noprefix
.global getint

# read from stdin and convert into integer
# input: none
# output: 
#   rax: the integer read
getint:
    push rbx
    push rcx
    push rdx
    mov rbx, 0
loop0: # read until '0'~'9'
    call getc
    sub rax, 48 # rax -= '0'
    cmp rax, 10
    jb loop1
    jmp loop0
loop1: # read until '0'~'9'
    # rbx *= 10
    mov rcx, rax
    mov rax, rbx
    mov rdx, 10
    mul rdx
    mov rbx, rax
    add rbx, rcx

    call getc
    sub rax, 48 # rax -= '0'
    cmp rax, 10
    jb loop1

    mov rax, rbx
    pop rdx
    pop rcx
    pop rbx
    ret
