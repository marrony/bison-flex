CFLAGS=-g
BISON=bison
FLEX=flex
 
parser: parser.o scanner.o main.o
	$(CC) -o parser scanner.o parser.o main.o

parser.c parser.h scanner.c scanner.h: parser.y scanner.l
	$(BISON) parser.y
	$(FLEX) scanner.l

main.o: scanner.h parser.h
         
clean:
	rm -f scanner.c scanner.o scanner.h parser.c parser.o parser.h main.o parser

