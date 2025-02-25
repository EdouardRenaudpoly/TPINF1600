CC = gcc
CXX = g++
AS = gcc
CFLAGS = -Wall -m32 -I./include -I./raylib/include -g -fno-stack-protector -no-pie -fno-pie 
CFLAGS += $(shell PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig:/usr/lib32/pkgconfig:/usr/lib/i386-linux-gnu/pkgconfig pkg-config --cflags x11)
CXXFLAGS = -Wall -m32 -I./include -I./raylib/include -g -fno-stack-protector -no-pie -fno-pie 
ASFLAGS = -m32 -g -fno-pie -no-pie -fno-stack-protector 
LDFLAGS = -m32 -fno-pie -no-pie -fno-stack-protector -L./raylib/lib -lraylib -lm -pthread -ldl $(shell PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig:/usr/lib32/pkgconfig:/usr/lib/i386-linux-gnu/pkgconfig pkg-config --libs x11 xrandr xi xinerama xcursor alsa)

# Directory for build output
BUILD_DIR = build

# Output executable will be in the root directory
OUT = mandelbrot

# Create the build directory if it doesn't exist
$(shell mkdir -p $(BUILD_DIR))

# Find source files in the appropriate directories
C_SRC = $(wildcard *.c)
CPP_SRC = $(wildcard *.cpp)
ASM_SRC = $(wildcard src_TODO/*.s)
SRC = $(C_SRC) $(CPP_SRC) $(ASM_SRC)

# Object files will be stored in the build directory
OBJ = $(patsubst %.c, $(BUILD_DIR)/%.o, $(C_SRC))
OBJ += $(patsubst %.cpp, $(BUILD_DIR)/%.o, $(CPP_SRC))
OBJ += $(patsubst src_TODO/%.s, $(BUILD_DIR)/%.o, $(ASM_SRC))
OBJ += $(BUILD_DIR)/tests.o



all: $(OUT)

$(OUT): $(OBJ)
	$(CXX) -o $(OUT) $(OBJ) $(LDFLAGS)

# Compile C source files to object files in the build directory
$(BUILD_DIR)/%.o: %.c
	$(CC) -c $< $(CFLAGS) -o $@

# Compile C++ source files to object files in the build directory
$(BUILD_DIR)/%.o: %.cpp
	$(CXX) -c $< $(CXXFLAGS) -o $@

# Compile assembly source files to object files in the build directory
$(BUILD_DIR)/%.o: src_TODO/%.s
	$(AS) -c $< $(ASFLAGS) -o $@

clean:
	find build -type f -name '*.o' ! -name 'tests.o' -exec rm -f {} +
	rm -f $(OUT)

run: $(OUT)
	./$(OUT)

zip:
	make clean
	rm -f INF1600_H25_TP3_REMISE.zip
	zip -r INF1600_H25_TP3_REMISE.zip ./
