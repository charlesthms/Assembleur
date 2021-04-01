DEFAULT REL

extern printf
extern scanf

segment .data
    prompt1         db "Entrez un entier : ",0
    prompt2         db "Entrez un autre entier : ",0

    promptor        db "OR:",0
    promptand       db "AND:",0
    promptxor       db "XOR:",0

    newLine         db 10,0

    longIntFormat   db "%ld",0

segment .bss
    entier1     resq 1
    entier2     resq 1
    result      resq 1

segment .text
    global main

main:

    push rbp
    mov rbp, rsp

    lea rdi, [prompt1]
    call print_string

    lea rdi, [entier1]
    call read_int
    mov rbx, [entier1]

    lea rdi, [prompt2]
    call print_string

    lea rdi, [entier2]
    call read_int
    mov r12, [entier2]

    ; OR
    or rbx, r12
    mov [result], rbx

    lea rdi, [promptor]
    call print_string

    mov rdi, [result]
    call print_int

    lea rdi, [newLine]
    call print_string

    mov rbx, [entier1]

    ; AND
    and rbx, r12
    mov [result], rbx

    lea rdi, [promptand]
    call print_string

    mov rdi, [result]
    call print_int

    lea rdi, [newLine]
    call print_string

    mov rbx, [entier1]

    ; XOR
    xor rbx, r12
    mov [result], rbx

    lea rdi, [promptxor]
    call print_string

    mov rdi, [result]
    call print_int

    lea rdi, [newLine]
    call print_string


    mov rax, 0
    leave
    ret

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
