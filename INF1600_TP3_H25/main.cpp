/*
INF1600 - TP3 - Visualisation de la serie de Mandelbrot
Matricules:
Date: 1/10/2025
Version: 1.0
Description: Visualisation d'un calcul recursif de la serie de Mandelbrot a l'aide de Raylib. 
             Noter que ce code n'est pas optimise, mais sert uniquement a un but academique.
*/

#include "raylib.h"
#include "draw.hpp"
#include "mandelbrot.hpp"
#include "tests.hpp"

int main() {

    /////////////////////////// PARTIE 0: COMPILATION ///////////////////////////
    /*
    Ceci est pour tester l'installation de vos dependances
    */

    //drawInit(); // Commenter cet appel si le tout compile.


    ///////////////////////////    PARTIE 1: TODO    ///////////////////////////
    /*
    Vous devez completer les fichiers assembleurs fournis dans le repertoire /src_TODO
    Vous pouvez utiliser cet espace libre pour faire des appels à vos fonctions pour les tester.
    */

    ///////////////////////////   PARTIE 2: TESTS   ////////////////////////////
    /*
    Pour vous aider a vous valider. Le resultat sera imprime dans le terminal
    Commenter/decommenter au besoin
    */

    runTests();

    /////////////////////////// PARTIE 3: AFFICHAGE ///////////////////////////

    // drawMandelbrot(); // Decommenter cet appel pour visualiser votre fonction recursive!

}