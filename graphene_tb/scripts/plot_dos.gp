set xlabel 'Energy (eV)'
set ylabel 'DOS'
plot '../data/dos.dat' using 1:2 with lines title 'DOS'
