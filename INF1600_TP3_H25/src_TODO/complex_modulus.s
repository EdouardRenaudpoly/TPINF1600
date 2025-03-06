/*
INF1600 - TP3 - Visualisation de la serie de Mandelbrot
Matricules: 
Date: 
Version: 1.0
Description:

/* Attention, ici il faudra utiliser les instructions
l'instruction faddp, fmulp et fsqrt (pour faire dea opérations sur
2 nombres de la pile flottante et met le résultat sur le dessus de la pile.
Ex : fmulp ST(1), ST(0) → multiplie ST(1) = ST(1) * ST(0))
*/ 

.data

.text
.globl _ZNK7Complex7modulusEv

_ZNK7Complex7modulusEv:
    # prologue
    push    %ebp
    movl    %esp, %ebp

    # TODO
    movl 8(%ebp), %eax #adresse de this
    push %eax
    call _ZNK7Complex8realPartEv
    addl $4, %esp
    push %eax
    call _ZNK7Complex8realPartEv
    addl $4, %esp
    fmulp
    push %eax
    call _ZNK7Complex8imagPartEv
    addl $4, %esp
    push %eax
    call _ZNK7Complex8imagPartEv
    addl $4, %esp
    fmulp
    faddp
    fsqrt
    # epilogue
    leave
    ret
