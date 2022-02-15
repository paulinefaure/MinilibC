BITS 64             ; 64 bits mode

SECTION .text       ; code section

GLOBAL strchr       ; export strchr function

strchr :
    push rbp        ; declare var
    mov rbp, rsp    ;
    xor rcx, rcx    ; ou exclusif binaire 0 (false) ou 1 (true)
    cmp rdi, 0          ; check if str[i] == '\0'
    je .is_null         ; if true, jump on section that manage this case

.loop :
    mov r8b, [rdi]; move str[i] on var
    cmp r8b, sil        ; check if str[i] == char (arg2)
    je end              ; if true, jump on end section
    inc rdi             ; increment counter
    jmp .loop           ; loop as long as we can

.is_null :
    mov rax, 0      ; return var = 0
    mov rsp, rbp    ; move rbp on rsp 
    pop rbp         ; unroll rbp & increment rsp
    ret             ;

end :
    mov rax, rcx    ; move position on return var
    mov rsp, rbp    ; move rbp on rsp 
    pop rbp         ; unroll rbp & increment rsp
    ret             ;