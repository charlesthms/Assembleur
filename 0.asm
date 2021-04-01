DEFAULT REL
extern printf
extern scanf
segment .data
    prompt1         db "Entrez un entier : ",0
    prompt2         db "Entrez un autre entier : ",0
    formatSortie    db "Difference : ",0
    longIntFormat   db "%ld",0
    newLine         db 10,0
segment .bss
    entier1  resq 1
    entier2  resq 1
    resultat resq 1

segment .text 
        global  main
main:
    push rbp
    mov rbp,rsp
    push rbx
    push r12

    lea rdi, [prompt1]
    call print_string

    lea rdi, [entier1]
    call read_int
    mov rbx, [entier1]

    lea rdi, [prompt2]
    call print_string
    
    lea rdi, [entier2]
    call read_int
    mov rcx, [entier2]
    
    sub rbx, rcx
    mov [resultat],rbx
    
    lea rdi,[formatSortie]
    call print_string

    mov rdi,[resultat]
    call print_int
    
    lea rdi,[newLine]
    call print_string
        
    pop r12
    pop rbx
    pop rbp

    mov rax, 0 
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