DEFAULT REL

extern printf
extern scanf

segment .data

    prompt0         db "Entrer un entier non signe : ",0
    prompt1         db "L'entier EST une puissance de 2",0
    prompt2         db "L'entier n'est PAS une puissance de 2",0

    newLine         db 10,0
    longIntFormat   db "%ld",0

segment .bss
    input           resq 1

segment .text
    global main

main:

    push rbp
    mov rbp, rsp

    ; Input
    lea rdi, [prompt0]
    call print_string

    lea rdi, [input]
    call read_int

    ; Vérification de input && input - 1
    mov rbx, [input]
    mov r12, [input]
    sub r12, 1  
    and rbx,  r12

    cmp rbx, 0
    je isPowerOf2
    lea rdi, [prompt2]
    call print_string

    lea rdi, [newLine]
    call print_string

    jmp fin

fin:
    leave
    ret

isPowerOf2:
    lea rdi, [prompt1]
    call print_string
    lea rdi, [newLine]
    call print_string
    jmp fin

print_string:
    enter 0,0
    mov rax,0
    call printf wrt ..plt
    mov rax,0
    leave
    ret

print_int:
    enter 0,0
    mov rsi,rdi
    lea rdi,[longIntFormat]
    mov rax,0
    call printf wrt ..plt
    mov rax,0
    leave
    ret

read_int:
    enter 0,0
    mov rsi,rdi
    lea rdi,[longIntFormat]
    mov rax,0
    call scanf wrt ..plt
    mov rax,0
    leave
    ret
