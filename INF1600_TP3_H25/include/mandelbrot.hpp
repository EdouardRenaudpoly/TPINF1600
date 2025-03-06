/*
INF1600 - TP3 - Visualisation de la serie de Mandelbrot
Matricules:
Date: 1/10/2025
Version: 1.0
Description: Parametres et signature de la fonction utilisees pour le calcul de la serie de Mandelbrot
*/

#pragma once
#include "complex.hpp"

const int maxIterations = 100;
const float escapeRadius = 2.0;

extern int mandelbrotSet(const Complex& z, const Complex& c, int count);