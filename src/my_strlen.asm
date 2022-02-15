BITS 64             ; 64 bits mode

SECTION .text       ; code section

GLOBAL strlen       ; export strlen function

strlen :
    push rbp        ; declare var
    mov rbp, rsp    ;
    xor rcx, rcx    ; ou exclusif binaire 0 (false) ou 1 (true)
    cmp rdi, 0      ; check if first param == NULL
    je end          ; if cmp == 1 (= equals), jump on end section

.loop :
    cmp BYTE[rdi + rcx], 0  ; compare with NULL
    je end          ; if cmp == 1 (= equals), jump on end section
    inc rcx         ; increment size
    jmp .loop       ; loop as long as we can

end :
    mov rax, rcx    ; move rcx (size) on rax (return value)
    mov rsp, rbp    ; move rbp on rsp 
    pop rbp         ; unroll rbp & increment rsp
    ret             ; return size