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
    movl  8(%ebp), %edx #z
    movl  12(%ebp), %ecx #c
    movl  16(%ebp), %eax   #count

    flds escapeRadiusFloat
    cmpl $0, %eax
    je initialiserC
    jmp restant
    initialiserC:
    push %eax #caller-saved
    push %edx

    pushl $8       # Taille en octets
    call malloc    # Appel à malloc
    addl $4, %esp  # Nettoyage de la pile (paramètre passé)
    movl %eax, %ecx  # Stocker le pointeur retourné par malloc dans ECX

    pop %edx
    pop %eax

    push %eax #caller-saved
    push %ecx
    push %edx

    push 4(%edx)
    push (%edx)
    push %ecx
    call _ZN7ComplexC1Eff
    add $12, %esp

    pop %edx
    pop %ecx
    pop %eax
    restant:
    push %eax #caller-saved
    push %ecx
    push %edx

    push %edx
    call _ZNK7Complex7modulusEv
    add $4,%esp

    pop %edx
    pop %ecx
    pop %eax

    push %eax
    fcompp
    fstsw %ax
    sahf
    pop %eax

    jae end
    cmpl maxIterations, %eax
    jae end
    addl $0x01, %eax

    push %eax #caller-saved
    push %ecx
    push %edx

    push %edx
    push %edx
    push %edx
    call _ZmlRK7ComplexS1_
    addl $12, %esp

    pop %edx
    pop %ecx
    pop %eax

    push %eax #caller-saved
    push %ecx
    push %edx

    push %edx
    push %ecx
    push %edx
    call _ZplRK7ComplexS1_
    addl $12, %esp

    pop %edx
    pop %ecx
    pop %eax

    push %eax
    push %ecx
    push %edx
    call _Z13mandelbrotSetRK7ComplexS1_i
    addl $12, %esp
    cmpl $2,escapeRadiusInt
    je freeComplex
    jmp end
    freeComplex:
    push %eax
    push %ecx
    push %edx

    pushl %ecx  # Passer l'adresse allouée à free
    call free
    addl $4, %esp

    pop %edx
    pop %ecx
    pop %eax
    subl $2, escapeRadiusInt

    end:
    # epilogue
    leave
    ret
