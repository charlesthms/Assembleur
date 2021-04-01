DEFAULT REL

extern printf
extern scanf

segment .data

    prompt0         db "Entrer un entier signe : ",0
    prompt1         db "pair",0
    prompt2         db "impair",0

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

    ; Setup de la division : rax = résultat , rdx = reste
    mov rax, [input]
    mov r12, 2
    cqo
    idiv r12

    ; On compare si le reste est = 0 
    cmp rdx, 0
    je resteNul ; Si le reste est nul
    lea rdi, [prompt2] ; Sinon
    call print_string
    lea rdi, [newLine]
    call print_string

    jmp fin

fin: 
    leave
    ret
resteNul:
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
