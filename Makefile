CFLAGS=-Wall -g

all:
	gcc -o Homework5 Homework5.c Dijkstra.h Dijkstra.c -lm
	gcc -o TestHomework5 TestHomework5.c Dijkstra.h Dijkstra.c -lm
	
run: 
	./Homework5 start

clean:
	rm -f Homework5
	rm -f TestHomework5
