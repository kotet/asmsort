.intel_syntax noprefix
.global sort

# sort given array of 64-bit unsigned integer.
# input:
#   rax: address to head of array
#   rbx: number of array elements
# output: none

sort:
    push rdi
    push r8
    push r9
    push rcx

    mov rdi, rax
    mov r8, 0 # counter
loop_outer:
    mov r9, r8 # counter
    inc r9

loop_inner:

    mov rax, qword ptr [rdi+8*r8]
    cmp rax, qword ptr [rdi+8*r9]

    jb skip_swap

    mov rcx, qword ptr [rdi+8*r9]
    mov qword ptr [rdi+8*r8], rcx
    mov qword ptr [rdi+8*r9], rax

skip_swap:

    inc r9
    cmp r9, rbx
    jb loop_inner

    inc r8
    cmp r8, rbx
    jb loop_outer

    pop rcx
    pop r9
    pop r8
    pop rdi
    ret
