/*
INF1600 - TP3 - Visualisation de la serie de Mandelbrot
Matricules: 
Date:
Version: 1.0
Description:



/* Attention, ici il faudra utiliser les opérateurs surchargés : _ZNK7Complex8realPartEv et _ZNK7Complex8imagPartEv 
ainsi que l'instruction faddp (pour multiplier 2 nombres de la pile flottante et met le résultat sur le dessus de la pile.
Ex : fmulp ST(1), ST(0) → multiplie ST(1) = ST(1) * ST(0))
l'instruction fsubrp et l'instructions  faddp  pour soustraire et additionner
et l'instruction fstps pour dépile la dernière valeur de la pile flottante et mets la valeur dans l'adresse indiquée

L'opérateur plus doit appeler un constructeur pour créer le nombre complexe résultat de l'addition (retour de la fonction)
*/

.data

.text
.globl _ZmlRK7ComplexS1_            # mangling vous est fourni

_ZmlRK7ComplexS1_  :
    # Prologue : Sauvegarder EBP et sauvegarder %ebx et %edi sur la pile
    push    %ebp                    
    movl    %esp, %ebp               # Initialisation de la pile de la fonction
    push    %ebx                     # Sauvegarder %ebx (callee-saved)
    push    %edi                     # Sauvegarder %edi (callee-saved)

  # TODO
    movl  8(%ebp), %edx #this
    movl  12(%ebp), %eax #adresse 1er complexe
    movl  16(%ebp), %ebx   #adresse 2eme complexe

    push %eax
    push %edx
    
    push %eax
    call _ZNK7Complex8realPartEv
    add $4, %esp

    pop %edx
    pop %eax

    push %eax
    push %edx
    
    push %ebx
    call _ZNK7Complex8realPartEv
    add $4, %esp

    pop %edx
    pop %eax

    fmulp

    push %eax
    push %edx
    
    push %eax
    call _ZNK7Complex8imagPartEv
    add $4, %esp

    pop %edx
    pop %eax
    
    push %eax
    push %edx
    
    push %ebx
    call _ZNK7Complex8imagPartEv
    add $4, %esp

    pop %edx
    pop %eax

    fmulp
    fsubrp

    push %eax
    push %edx
    
    push %eax
    call _ZNK7Complex8realPartEv
    add $4, %esp

    pop %edx
    pop %eax
    
    push %eax
    push %edx
    
    push %ebx
    call _ZNK7Complex8imagPartEv
    add $4, %esp

    pop %edx
    pop %eax

    fmulp
    
    push %eax
    push %edx
    
    push %eax
    call _ZNK7Complex8imagPartEv
    add $4, %esp

    pop %edx
    pop %eax
    
    push %eax
    push %edx
    
    push %ebx
    call _ZNK7Complex8realPartEv
    add $4, %esp

    pop %edx
    pop %eax

    fmulp
    faddp

    push %eax
    push %ebx
    push %ecx

    sub $8, %esp
    fstps 4(%esp)
    fstps (%esp)
    push %edx
    call _ZN7ComplexC1Eff
    addl $12, %esp

    pop %ecx
    pop %ebx
    pop %eax
    # epilogue
    popl    %edi                     # Restaurer %edi
    popl    %ebx                     # Restaurer %ebx
    leave
    ret
