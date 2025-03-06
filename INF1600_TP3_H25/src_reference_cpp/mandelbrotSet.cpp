/*
INF1600 - TP3 - Visualisation de la serie de Mandelbrot
Auteur: Abdul-Wahab Chaarani
Date: 1/10/2025
Version: 1.0
Description: Implémentation en C++ de la fonction récursive à coder en assembleur. Utiliser comme référence.
             Dans un namespace pour éviter les collisions avec l'implémentation ASM.
*/

#include "mandelbrot.hpp"

namespace reference{

    int mandelbrotSet(const Complex& z, const Complex& c, int count) {
        if (z.modulus() >= escapeRadius) return count;          // cas de base 1
        if (count + 1   > maxIterations) return count;          // cas de base 2
        return reference::mandelbrotSet(z * z + c, c, ++count); // cas recursif
    }

}
