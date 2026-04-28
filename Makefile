CC = gcc
CFLAGS = -Wall -Wextra -ggdb3 -O1 

all:
	mkdir -p build
	$(CC) $(CFLAGS) -c src/vector.c -o build/vector.o

clean:
	rm -rf build
