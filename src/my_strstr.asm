BITS 64             ; 64 bits mode

SECTION .text       ; code section

GLOBAL strstr       ; export strstr function

strstr :
    push rbp        ; declare var
    mov rbp, rsp    ;
    xor rcx, rcx    ; ou exclusif binaire 0 (false) ou 1 (true) 
    cmp rdi, 0      ; check if arg1 == NULL
    je end          ; jump on end section
    cmp rsi, 0      ; check if arg2 == NULL
    je end          ; jump on end section

.loop :
    mov r8b, [rdi + rcx]; move s1[i] on var
    mov r9b, [rsi + rcx]; move s2[i] on var
    cmp r9b, 0          ; check if r9b == '\0'
    je .find_occurence  ; if true, jump on end section
    cmp r8b, r9b        ; check f r8b == r9b
    jne .set_again      ; if they are equals, go on set again section
    inc rcx             ; increment counter
    jmp .loop           ; loop as long as we can

.set_again :
    cmp r8b, 0          ; check if r8b == '\0'
    je end              ; if true, jump on end section
    inc rdi             ; increment arg1 by 1
    xor rcx, rcx        ; re set counter to 0
    jmp .loop           ; loop as long as we can

.find_occurence :
    mov rax, rdi        ; move position of the first occurrence in the return var
    je end              ; jump on end section
    
end :
    mov rsp, rbp    ; move rbp on rsp 
    pop rbp         ; unroll rbp & increment rsp
    ret             ; return 