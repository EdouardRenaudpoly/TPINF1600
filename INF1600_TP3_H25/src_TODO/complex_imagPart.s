/*
INF1600 - TP3 - Visualisation de la serie de Mandelbrot
Matricules: Code fourni
Date: 
Version: 1.0
Description:
L'equivalent C++
float Complex::imagPart() const {return this->imag;}

*** c'est une methode, donc le parametre this est implicite:
*/

.data

.text
.globl _ZNK7Complex8imagPartEv

_ZNK7Complex8imagPartEv:
    # prologue
    push    %ebp
    movl    %esp, %ebp

    
    subl    $4, %esp        # variable locale sur la pile : this->imag
                            # pas d'instruction ALU -> FPU
                            # donnees FPU doivent donc etre prises de la memoire
    movl    8(%ebp), %eax   # this, stocke dans %eax
    movl    4(%eax), %edx   # this->imag (imag est le 2e attribut de la classe), stocke dans %edx
    movl    %edx, (%esp)    # stocke this->real sur la pile 

    # L'instruction flds charge la valeur stockée à l'adresse %esp (c'est-à-dire this->real) 
    # dans le registre de la FPU st(0) (le sommet de la pile FPU). Cette instruction est utilisée 
    # pour manipuler des nombres flottants ou doubles.
    flds    (%esp)          # placer this->real sur le top de la FPU      
                            # par convention, les valeurs de retour de type float/double doivent se retrouver dans st[0]
    
     
    # epilogue
    leave
    ret
