CFLAGS=-g
BISON=bison
FLEX=flex
 
parser: parser.o scanner.o main.o
	$(CC) -o parser scanner.o parser.o main.o

parser.c parser.h: parser.y scanner.h
	$(BISON) parser.y

scanner.c scanner.h: scanner.l
	$(FLEX) scanner.l

main.o: scanner.h parser.h
         
clean:
	rm -f scanner.c scanner.o scanner.h parser.c parser.o parser.h main.o parser

