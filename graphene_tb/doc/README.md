# Graphene Tight-Binding Model

This project provides a simple Fortran implementation of a 2x2 tight-binding
model for monolayer graphene. The code generates band structure data along a
selected high-symmetry path and an approximate density of states on a regular
Brillouin zone grid.

## Build

```
cd src
make
```

This will produce `graphene_tb.exe` in the `src` directory (requires
`gfortran`).

## Run

After building, execute the program from within the `src` directory:

```
./graphene_tb.exe
```

Output files `bands.dat` and `dos.dat` will appear in the `data` directory one
level above `src`.

## Plotting

Simple gnuplot scripts and a Python script are provided in `scripts/` to plot
the band structure and density of states.
