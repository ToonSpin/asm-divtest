; Assembly language performance tester
; Does 10,000 divisions, 10,000 times
; Variables:
; bx: Counter for keeping track of which of the 10,000 divisions is being done
; cx: Counter for keeping track of which batch of 10,000 divisions is being done
; si: Stores an arbitrary divisor

                global  _start

                section .text

_start:         mov     cx, 0                   ; initialize outer loop counter
                mov     si, 17                  ; remember 17 (arbitrary divisor)

outer_loop:     inc     cx                      ; increment outer loop counter
                cmp     cx, 10000               ; done if the counter equals 10000
                je      done

                mov     bx, 0                   ; initialize inner loop counter

inner_loop:     inc     bx                      ; increment inner loop counter
                cmp     bx, 10000               ; done if inner loop counter equals 10000
                je      outer_loop
                
                mov     ax, bx                  ; set ax to the inner loop counter (dividend)
                xor     dx, dx                  ; zero dx
                div     si                      ; divide by the divisor

                jmp     inner_loop              ; go back to the inner loop

done:           mov     rax, 60                 ; system call for exit
                xor     rdi, rdi                ; exit code 0
                syscall
