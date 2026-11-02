.DEFAULT_GOAL := all

CC = gcc
CPPFLAGS =
CFLAGS = -Wall -pedantic
LDFLAGS =
LDLIBS = 
# Legacy extra compiler flags remain supported.
FLAGS =

include student.mk

all: pi pi_omp

pi: pi.c Makefile student.mk
	$(CC) $(CPPFLAGS) $(CFLAGS) $(FLAGS) -fopenmp $(LDFLAGS) -o $@ $(filter %.c,$^) $(LDLIBS)

pi_omp: pi_omp.c student.c student.h Makefile student.mk
	$(CC) $(CPPFLAGS) $(CFLAGS) $(FLAGS) -fopenmp $(LDFLAGS) -o $@ $(filter %.c,$^) $(LDLIBS)

# FULL=1 enables all fixtures; MPIEXEC may override the MPI launcher.
test: pi_omp
	FULL="$(FULL)" python3 test_smoke.py

clean:
	rm -f pi pi_omp

.PHONY: all clean test help 
