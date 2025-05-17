FC=gfortran
FFLAGS=-O2
LIBS=-llapack -lblas
SRC=$(wildcard src/*.f90)
OBJ=$(SRC:.f90=.o)

all: graphene_tb

%.o: %.f90
	$(FC) $(FFLAGS) -c $< -o $@

graphene_tb: $(OBJ)
	$(FC) $(FFLAGS) -o $@ $(OBJ) $(LIBS)

clean:
	rm -f *.o src/*.o graphene_tb band.dat dos.dat
