FC = gfortran
FFLAGS = -O2 -Wall

SRC = mod_kinds.f90 mod_constants.f90 mod_graphene_lattice.f90 \
      mod_hamiltonian.f90 mod_k_space.f90 mod_band_structure.f90 \
      mod_dos.f90 mod_io.f90 main.f90

OBJ = $(SRC:.f90=.o)

all: graphene_tb

graphene_tb: $(OBJ)
$(FC) $(FFLAGS) -o $@ $(OBJ)

clean:
rm -f *.o *.mod graphene_tb
