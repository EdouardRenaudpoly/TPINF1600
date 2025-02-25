/*
INF1600 - TP3 - Visualisation de la serie de Mandelbrot
Matricules: 
Date: 1/10/2025
Version: 1.0
Description:

Vous devrez utiliser la fonction 
fisttpl qui prend le registre ST(0) de la pile FPU (valeur le plus récemment chargée) 
et le met à l'emplacement mémoire spécifié.  Puisque vous ne pouvez pas spécifier
directement un registre vous devrez faire comme suit (en utilisant le dessus de la pile)
si vous voulez de mettre dans le registre %eax
fisttpl (%esp)                      
movl    (%esp), %eax

*/

.data

maxIterations: 
.int   100

# Vous avez le choix de considerer la variable escapeRadius comme un float ou un int, dependament de votre implementation
# Les deux variables sont fournies pour vous faciliter la vie
escapeRadiusFloat:  
.float 2.0
escapeRadiusInt:  
.int 2

.text

.globl _Z13mandelbrotSetRK7ComplexS1_i  # mangling vous est fourni

_Z13mandelbrotSetRK7ComplexS1_i:        # mangling vous est fourni
    # prologue
    push    %ebp
    movl    %esp, %ebp

    # TODO

    end:
    # epilogue
    leave
    ret
