/*
INF1600 - TP3 - Visualisation de la serie de Mandelbrot
Matricules:
Date: 1/10/2025
Version: 1.0
Description: Declaration de la classe Complex utilisee pour le calcul de la serie de Mandelbrot
*/

#pragma once
#include <cmath>
#include <iostream>

class Complex{
	float real;
	float imag;

	public:
	Complex (float x, float y);
	float realPart() const;
	float imagPart() const;
	float modulus() const;

	friend std::ostream& operator<<(std::ostream& os, const Complex& c) {
        os << "(" << c.real << "," << c.imag << ")";
        return os;
    }

	friend int complexConstructorTest();
	friend int complexOperationPlTest();
	friend int complexOperationMlTest();

};

Complex operator+(const Complex& c1, const Complex& c2);
Complex operator*(const Complex& c1, const Complex& c2);