/*
INF1600 - TP3 - Visualisation de la serie de Mandelbrot
Matricules: 
Date: 
Version: 1.0
Description:


*/

/* Attention, ici il faudra utiliser les opérateurs surchargés : _ZNK7Complex8realPartEv et _ZNK7Complex8imagPartEv 
ainsi que l'instruction faddp (pour additionner 2 nombres de la pile flottante et met le résultat sur le dessus de la pile.
Ex : ADDP ST(1), ST(0) → Additionne ST(1) = ST(1) + ST(0))
et l'instruction fstps pour dépile la dernière valeur de la pile flottante et mets la valeur dans l'adresse indiquée

L'opérateur plus doit appeler un constructeur pour créer le nombre complexe résultat de l'addition (retour de la fonction)
*/


.data

.text
.globl _ZplRK7ComplexS1_            # mangling vous est fourni

_ZplRK7ComplexS1_:                  
     # Prologue : Sauvegarder EBP et sauvegarder %ebx et %edi sur la pile
    push    %ebp                    
    movl    %esp, %ebp               # Initialisation de la pile de la fonction
    push    %ebx                     # Sauvegarder %ebx (callee-saved)
    push    %edi                     # Sauvegarder %edi (callee-saved)

    # TODO
    movl  8(%ebp), %edx #this
    movl  12(%ebp), %eax #adresse 1er complexe
    movl  16(%ebp), %ebx   #adresse 2eme complexe
    flds (%eax)
    flds (%ebx)
    faddp
    flds 4(%eax)
    flds 4(%ebx)
    faddp
    sub $8, %esp
    fstps 4(%esp)
    fstps (%esp)
    push %edx
    call _ZN7ComplexC1Eff
    addl $12, %esp
     # Épilogue : Restaurer les registres et revenir
    popl    %edi                     # Restaurer %edi
    popl    %ebx                     # Restaurer %ebx
    leave                            # Restaurer %ebp et %esp
    ret
