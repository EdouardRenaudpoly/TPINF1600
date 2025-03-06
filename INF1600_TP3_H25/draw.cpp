/*
INF1600 - TP3 - Visualisation de la serie de Mandelbrot
Auteur: Abdul-Wahab Chaarani
Date: 1/10/2025
Version: 1.0
Description: Visualisation de la serie de Mandelbrot a l'aide de Raylib .
*/

////////////// NE PAS MODIFIER CE QUI SUIT //////////////////

#include "draw.hpp"
#include "mandelbrot.hpp"

Color GetColorFromIteration(int iteration);

void drawInit() {
    // Initialization
    const int screenWidth = 800;
    const int screenHeight = 450;

    InitWindow(screenWidth, screenHeight, "INF1600 - TP3 - Test compilation");

    SetTargetFPS(60);

    // Main game loop
    while (!WindowShouldClose()) {

        // Draw
        BeginDrawing();
        ClearBackground(RAYWHITE);
        DrawText("Votre projet compile! Vous pouvez commencer le TP3!", 10, 10, 20, DARKGRAY);
        EndDrawing();
    }

    CloseWindow();
}

void drawMandelbrot(){
    // Initialize the window
    const int screenWidth = 800;
    const int screenHeight = 600;
    InitWindow(screenWidth, screenHeight, "INF1600 - H25 - TP3: Mandelbrot Recursif ");
    SetTargetFPS(60); 

    // Define initial grid bounds and scale factor
    float minX = -2.0f, maxX = 1.0f;
    float minY = -1.5f, maxY = 1.5f;
    float zoomLevel = 1.0f;
    float scaleX, scaleY;

    // Variables to handle mouse dragging
    Vector2 lastMousePos = {0, 0};
    bool isDragging = false;

    while (!WindowShouldClose()) {
        // Update zoom level with mouse wheel
        float mouseWheelMove = GetMouseWheelMove();
        if (mouseWheelMove != 0) {
            zoomLevel += mouseWheelMove * 1.0f;
            zoomLevel = std::max(zoomLevel, 0.1f); 
        }

        // Recalculate the scale based on zoom level
        scaleX = (static_cast<float>(screenWidth) / (maxX - minX)) * zoomLevel;
        scaleY = (static_cast<float>(screenHeight) / (maxY - minY)) * zoomLevel;

        // Check for mouse dragging to move coordinates
        if (IsMouseButtonPressed(MOUSE_BUTTON_LEFT)) {
            lastMousePos = GetMousePosition();
            isDragging = true;
        }

        if (isDragging && IsMouseButtonDown(MOUSE_BUTTON_LEFT)) {
            Vector2 mousePos = GetMousePosition();
            float dx = (mousePos.x - lastMousePos.x) / scaleX;
            float dy = (mousePos.y - lastMousePos.y) / scaleY;

            // Adjust the grid bounds based on the mouse movement
            minX -= dx;
            maxX -= dx;
            minY -= dy;
            maxY -= dy;

            lastMousePos = mousePos;
        }

        if (IsMouseButtonReleased(MOUSE_BUTTON_LEFT)) {
            isDragging = false;
        }

        // Begin drawing
        BeginDrawing();
        ClearBackground(BLACK);

        // Draw the Mandelbrot set
        for (int i = 0; i < screenWidth; ++i) {
            for (int j = 0; j < screenHeight; ++j) {
                float worldX = minX + (i / scaleX);
                float worldY = minY + (j / scaleY);

                Complex c(worldX, worldY);
                Complex z(0, 0);
                int iteration = 0;

				iteration = mandelbrotSet(z, c, 0);

                // Map iterations to color
                if (iteration == maxIterations) {
                    DrawPixel(i, j, BLACK);
                } else {
                    Color color = GetColorFromIteration(iteration);
                    DrawPixel(i, j, color);
                }
            }
        }

        // Draw text displaying the zoom level and FPS
        DrawText(TextFormat("Zoom Level: %.2f", zoomLevel), 10, 10, 20, WHITE);
        DrawFPS(10, 40);

        EndDrawing();
    }

    // Close window and OpenGL context
    CloseWindow();
}

Color GetColorFromIteration(int iteration){
	float t = static_cast<float>(iteration) / maxIterations;
	Color color = {
		static_cast<unsigned char>(9 * (1 - t) * t * t * t * 255),
		static_cast<unsigned char>(15 * (1 - t) * (1 - t) * t * t * 255),
		static_cast<unsigned char>(8.5 * (1 - t) * (1 - t) * (1 - t) * t * 255),
		255
	};
	return color;
}