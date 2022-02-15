BITS 64             ; 64 bits mode

SECTION .text       ; code section

GLOBAL strcmp       ; export strcmp function

strcmp :
    push rbp        ; declare var
    mov rbp, rsp    ;
    xor rcx, rcx    ; ou exclusif binaire 0 (false) ou 1 (true) 

.loop :
    mov r8b, [rdi + rcx]; move s1[i] on var 
    mov r9b, [rsi + rcx]; move s2[i] on var
    cmp r8b, 0          ; check if var != 0
    je end              ; if r8 = 0, jump on end section
    cmp r9b, 0          ; check if var != 0
    je end              ; if r9 = 0, jump on end section
    cmp r8b, r9b        ; check if r8 == r9
    jne end             ; if r8 != r9, jump on end section
    inc rcx             ; increment counter
    jmp .loop           ; loop as long as we can

end :
    sub r8b, r9b    ; substract r9 to r8
    movsx rax, r8b  ; move result substract to return var
    mov rsp, rbp    ; move rbp on rsp 
    pop rbp         ; unroll rbp & increment rsp
    ret             ; return