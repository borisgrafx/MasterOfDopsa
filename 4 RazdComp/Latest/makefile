output: main.o lib.a
	gcc main.o lib.a -o output
main.o: main.c
	gcc -c main.c
lib.a: selection.o selection.h
	ar -rsc lib.a selection.o
selection.o:
	gcc -c selection.c
clean:
	rm *.o *.a output
