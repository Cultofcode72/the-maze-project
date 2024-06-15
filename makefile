# Compiler to use
CC=gcc

# Flags to create object files with
CFLAGS=-g -Wall -Werror -Wextra -pedantic

# Flags to link the SDL2 library
SDL_FLAGS=-I/usr/include/SDL2

# Libraries to link
LDLIBS=-lSDL2 -lm

# All C program files
SRC=./src/mazemap.c ./src/build_world.c ./src/check_direction.c ./src/create_drawings.c ./src/key_press_release.c ./src/free_malloc.c ./src/init_window.c ./src/main_maze.c ./src/directions.c ./src/winner.c

# The names of all object files
OBJ=$(SRC:.c=.o)

# Executable name
NAME=maze

# Removal command
RM=rm -f

# Default target (executable)
$(NAME): $(OBJ)
	$(CC) $(OBJ) -o $(NAME) $(LDLIBS)

# Remove all object files and executable
clean:
	$(RM) $(OBJ) $(NAME) *~

# Compile each source file into object files
%.o: %.c
	$(CC) $(CFLAGS) $(SDL_FLAGS) -c $< -o $@

# Phony target to avoid conflicts with file named "clean"
.PHONY: clean

