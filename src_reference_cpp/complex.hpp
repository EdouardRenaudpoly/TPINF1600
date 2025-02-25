    
/*
INF1600 - TP3 - Visualisation de la serie de Mandelbrot
Auteur: Abdul-Wahab Chaarani
Date: 1/10/2025
Version: 1.0
Description: Implémentation en C++ de la classe Complex à coder en assembleur. Utiliser comme référence.
             Dans un namespace pour éviter les collisions avec l'implémentation ASM.
*/
#include <cmath>
namespace reference{
    class Complex{

    public:
        Complex (float x, float y);

        float realPart() const;
        float imagPart() const;
        float modulus() const;

    private:
        float real;
        float imag;
    };
}
