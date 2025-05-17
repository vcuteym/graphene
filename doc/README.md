# Graphene Tight-Binding Model

This project implements a simple 2x2 tight-binding model for monolayer graphene in Fortran. The code generates band structure data along a high-symmetry path and a simple density of states (DOS) using a histogram method.

## Building

A simple `Makefile` is provided in the `src` directory. Use `make` inside that directory to build the executable `graphene_tb` (requires `gfortran`).

```bash
cd src
make
```

## Running

Running the executable produces two data files in the `data` directory:

- `bands.dat` – band energies along the chosen k-path
- `dos.dat` – density of states histogram

```
./graphene_tb
```

## Plotting

Plotting scripts are provided in the `scripts` directory. You can use Gnuplot:

```
gnuplot scripts/plot_bands.gp
gnuplot scripts/plot_dos.gp
```

Or with Python and matplotlib:

```
python scripts/plot_results.py
```
