CFLAGS=-g
BISON=bison
FLEX=flex
 
parser: parser.o scanner.o
	$(CC) -o parser scanner.o parser.o
     
parser.c: parser.y
	$(BISON) -t -d -o parser.c parser.y
         
scanner.c: scanner.l
	$(FLEX) -o scanner.c scanner.l
             
clean:
	rm -f scanner.c scanner.o parser.c parser.o parser.h parser

