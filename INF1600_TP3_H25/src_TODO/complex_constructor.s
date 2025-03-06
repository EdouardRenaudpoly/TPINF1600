/*
INF1600 - TP3 - Visualisation de la serie de Mandelbrot
Matricules: 
Date: 
Version: 1.0
Description: 
*** Attention, c'est une methode, donc le parametre this est implicite:

*/

.data

.text

.globl _ZN7ComplexC1Eff

_ZN7ComplexC1Eff:
    # prologue
    push    %ebp
    movl    %esp, %ebp

    movl    16(%ebp), %eax #y
    movl    12(%ebp), %ebx #x
    movl    8(%ebp), %ecx #this
    movl    %ebx, (%ecx)
    movl    %eax, 4(%ecx)
    
    #epilogue                   
    leave
    ret
