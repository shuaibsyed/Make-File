CC = gcc
CFLAGS = -ansi -pedantic-errors -Wall -fstack-protector-all -Werror

all: main.x program1.x tester.x


main.x: range-fill.h array-print.h main.o range-fill.o array-print.o
	$(CC) main.o range-fill.o array-print.o -o main.x

program1.x: program1.o row-compare.h row-compare.o
	$(CC) program1.o row-compare.o -o program1.x

tester.x: range-fill.h array-sum.h row-sum.h range-fill.o row-sum.o tester.o array-sum.o
	$(CC) range-fill.o row-sum.o tester.o array-sum.o -o tester.x

main.o: main.c range-fill.h array-print.h
	$(CC) $(CFLAGS) -c main.c

program1.o: program1.c row-compare.h
	$(CC) $(CFLAGS) -c program1.c

tester.o: tester.c range-fill.h array-sum.h row-sum.h
	$(CC) $(CFLAGS) -c tester.c

range-fill.o: range-fill.h range-fill.c
	$(CC) $(CFLAGS) -c range-fill.c

array-print.o: array-print.h array-print.c 
	$(CC) $(CFLAGS) -c array-print.c

row-compare.o: row-compare.h row-compare.c
	$(CC) $(CFLAGS) -c row-compare.c

row-sum.o: row-sum.h row-sum.c
	$(CC) $(CFLAGS) -c row-sum.c

array-sum.o: array-sum.h array-sum.c
	$(CC) $(CFLAGS) -c array-sum.c


clean:
	- rm *.x *.o