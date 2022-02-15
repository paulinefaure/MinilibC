BITS 64             ; 64 bits mode

SECTION .text       ; code section

GLOBAL memset       ; export memset function

memset :
    push rbp        ; declare var
    mov rbp, rsp    ;
    xor rcx, rcx    ; ou exclusif binaire 0 (false) ou 1 (true)

.loop :
    cmp rcx, rdx            ; check if counter == size (arg3)
    je end                  ;
    mov [rdi + rcx], sil    ; sil contains  char to be copied
    inc rcx                 ; increment counter
    jmp .loop               ; loop as long as we can

end :
    mov rax, rdi    ; move result on return var
    pop rbp         ; unroll rbp & increment rsp
    ret             ; return 