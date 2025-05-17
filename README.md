# Graphene Tight-Binding Example

This repository contains a minimal Fortran implementation of the
2x2 nearest-neighbour tight-binding model for monolayer graphene.
It calculates the band structure along a high symmetry path and the
density of states using Gaussian smearing.

## Directory Structure

```
├── src/
│   ├── constants.f90   # physical constants and TB parameters
│   ├── lattice.f90     # lattice vectors and k-path
│   ├── kgrid.f90       # k-grid for DOS
│   ├── hamiltonian.f90 # construct 2x2 Hamiltonian
│   ├── diagonalize.f90 # LAPACK diagonalization
│   ├── dos.f90         # density of states
│   └── main.f90        # driver program
└── plot/
    ├── band.py         # band structure plot
    └── dos.py          # DOS plot
```

## Building

A simple Makefile is provided. Compile using

```
make
```

This requires `gfortran` and LAPACK/BLAS libraries.

## Running

After building, run

```
./graphene_tb
```

This produces `band.dat` and `dos.dat` files.
Plot the results using Python:

```
python plot/band.py
python plot/dos.py
```

which will generate `band.png` and `dos.png`.
