; Assembly language performance tester
; Does 9,000 divisions, 10,000 times
; Variables:
; rbx: Counter for keeping track of which of the 9,000 divisions is being done
; rcx: Counter for keeping track of which batch of 10,000 divisions is being done
; si: Stores an arbitrary divisor

                global  _start

                section .text

_start:         mov     rcx, 0                  ; initialize outer loop counter
                mov     si, 3                   ; remember 3

outer_loop:     inc     rcx                     ; increment outer loop counter
                cmp     rcx, 10000              ; done if the counter equals 10000
                je      done

                mov     rbx, 0                  ; initialize inner loop counter

inner_loop:     inc     rbx                     ; increment inner loop counter
                cmp     rbx, 1000               ; done if inner loop counter equals 1000
                je      outer_loop
                
                mov     ax, 0xFFFF              ; set ax to 2^16 - 1
                xor     dx, dx                  ; zero dx
                div     si                      ; divide by the divisor
                xor     dx, dx                  ; zero dx
                div     si                      ; divide by the divisor
                xor     dx, dx                  ; zero dx
                div     si                      ; divide by the divisor
                xor     dx, dx                  ; zero dx
                div     si                      ; divide by the divisor
                xor     dx, dx                  ; zero dx
                div     si                      ; divide by the divisor
                xor     dx, dx                  ; zero dx
                div     si                      ; divide by the divisor
                xor     dx, dx                  ; zero dx
                div     si                      ; divide by the divisor
                xor     dx, dx                  ; zero dx
                div     si                      ; divide by the divisor
                xor     dx, dx                  ; zero dx
                div     si                      ; divide by the divisor

                jmp     inner_loop              ; go back to the inner loop

done:           mov     rax, 60                 ; system call for exit
                xor     rdi, rdi                ; exit code 0
                syscall
