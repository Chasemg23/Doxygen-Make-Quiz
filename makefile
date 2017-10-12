#CFLAGS = -Wall -std=c++11
CC = g++

college:
	$(CC) $(CFLAGS) main.o course.o college.o -o college  

all: build doc

build: college

doc: 
	doxygen config

main.o: collegemain.cc node.h tarray.h course.o college.o
	$(CC) -c collegemain.cc course.o college.o

course.o: course.cc course.h
	$(CC) -c course.cc

college.o: college.cc college.h
	$(CC) -c college.cc

archive: 
	tar -czvf archive.tar.gz collegemain.cc college.cc college.h course.cc course.h node.h tarray.h makefile

clean:
	rm -f *.o college *.gch
	rm -r html
