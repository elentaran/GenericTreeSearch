EXEC=TreeSearch
CC=ghc

all: $(EXEC)


$(EXEC): 
	$(CC) main.hs -o $(EXEC) 


clean:
	rm -f *.o
	rm -f *.hi
	rm -f *~
	rm -f $(EXEC)
