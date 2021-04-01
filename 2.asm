DEFAULT REL

extern printf
extern scanf

segment .data
    prompt         db "Saisir 0 pour un homme et 1 pour une femme : ",0

    rep1           db "Bonjour Monsieur",0
    rep2           db "Bonjour Madame",0

    newLine        db 10,0

    longIntFormat   db "%ld",0

segment .bss
    result resq 1

segment .text
    global main

main:

    push rbp
    mov rbp, rsp

    lea rdi, [prompt]
    call print_string

    lea rdi, [result]
    call read_int
    mov rbx, [result]

    cmp rbx, 0
    je isMan
    lea rdi, [rep2]
    call print_string
    lea rdi, [newLine]
    call print_string

    mov rax, 0
    jmp fin

fin:
    leave
    ret

isMan:
    lea rdi, [rep1]
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
