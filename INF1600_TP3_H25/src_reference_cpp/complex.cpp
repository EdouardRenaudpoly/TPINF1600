/*
INF1600 - TP3 - Visualisation de la serie de Mandelbrot
Auteur: Abdul-Wahab Chaarani
Date: 1/10/2025
Version: 1.0
Description: Implémentation en C++ de la classe Complex à coder en assembleur. Utiliser comme référence.
*/

#include "complex.hpp"

namespace reference{
    // Constructeur
    Complex::Complex(float x, float y) : real(x), imag(y) {}

    // Méthodes d'accès
    float Complex::realPart() const { return real; }
    float Complex::imagPart() const { return imag; }

    // Méthode pour calculer le module
    float Complex::modulus() const {
        return std::sqrt(realPart() * realPart() + imagPart() * imagPart());
    }

    // Implémentation de l'opérateur +
    Complex operator+(const Complex& c1, const Complex& c2) {
        return Complex(c1.realPart() + c2.realPart(), c1.imagPart() + c2.imagPart());
    }

    // Implémentation de l'opérateur *
    Complex operator*(const Complex& c1, const Complex& c2) {
        return Complex(c1.realPart() * c2.realPart() - c1.imagPart() * c2.imagPart(), 
                    c1.realPart() * c2.imagPart() + c1.imagPart() * c2.realPart());
    }

}