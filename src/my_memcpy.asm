BITS 64             ; 64 bits mode

SECTION .text       ; code section

GLOBAL memcpy       ; export memcpy function

memcpy :
    push rbp        ; declare var
    mov rbp, rsp    ;
    xor rcx, rcx    ; ou exclusif binaire 0 (false) ou 1 (true)

.loop :
    cmp rcx, rdx        ; compare counter with arg3
    je end              ; if rcx == rdx, jump on end section
    mov r9b, [rsi + rcx]; move s2[i] on var
    mov [rdi + rcx], r9b; copy s2[i] on s1[i]
    inc rcx             ; increment counter
    jmp .loop           ; loop as log as we can

end :
    mov rax, rdi    ; move rbp on rsp 
    pop rbp         ; unroll rbp & increment rsp
    ret             ;