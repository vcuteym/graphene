FC=gfortran
FFLAGS=-O2

SRC=main.f90 \
    mod_kinds.f90 \
    mod_constants.f90 \
    mod_graphene_lattice.f90 \
    mod_hamiltonian.f90 \
    mod_k_space.f90 \
    mod_band_structure.f90 \
    mod_dos.f90 \
    mod_io.f90

OBJ=$(SRC:.f90=.o)

all: graphene_tb.exe

%.o: %.f90
	$(FC) $(FFLAGS) -c $<

graphene_tb.exe: $(OBJ)
	$(FC) $(FFLAGS) $(OBJ) -o $@

clean:
	rm -f $(OBJ) *.mod graphene_tb.exe
