BITS 64             ; 64 bits mode

SECTION .text       ; code section

GLOBAL memmove       ; export memmove function

memmove :
    push rbp        ; declare var
    mov rbp, rsp    ;
    xor rcx, rcx    ; ou exclusif binaire 0 (false) ou 1 (true)

.loop :
    cmp rcx, rdx        ; check if counter == size
    je .copy            ; if counter == size, jmp on .copy section
    mov cl, [rsi + rcx] ;
    push cx             ;
    inc rcx             ;
    jmp .loop           ;

.copy :
    test rcx, rcx       ; ou exclusif binaire 0 (false) ou 1 (true)
    jz end              ;
    pop cx              ;
    dec rcx             ;
    mov [rdi + rcx], cl ;
    jmp .copy           ;

end :
    mov rax, rdi    ; move rbp on rsp 
    pop rbp         ; unroll rbp & increment rsp
    ret             ;