; Assembly language performance tester
; Does 10,000 divisions, 10,000 times
; Variables:
; ebx: Counter for keeping track of which of the 10,000 divisions is being done
; ecx: Counter for keeping track of which batch of 10,000 divisions is being done
; esi: Stores an arbitrary divisor

                global  _start

                section .text

_start:         mov     ecx, 0                  ; initialize outer loop counter
                mov     esi, 17                 ; remember 17 (arbitrary divisor)

outer_loop:     inc     ecx                     ; increment outer loop counter
                cmp     ecx, 10000              ; done if the counter equals 10000
                je      done

                mov     ebx, 0                  ; initialize inner loop counter

inner_loop:     inc     ebx                     ; increment inner loop counter
                cmp     ebx, 10000              ; done if inner loop counter equals 10000
                je      outer_loop
                
                mov     eax, ebx                ; set eax to the inner loop counter (dividend)
                xor     edx, edx                ; zero edx
                div     esi                     ; divide by the divisor

                jmp     inner_loop              ; go back to the inner loop

done:           mov     rax, 60                 ; system call for exit
                xor     rdi, rdi                ; exit code 0
                syscall
