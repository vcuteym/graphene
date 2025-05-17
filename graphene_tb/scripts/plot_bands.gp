set xlabel 'k-path'
set ylabel 'Energy (eV)'
plot '../data/bands.dat' using 1:2 with lines title 'Band 1', \
     '../data/bands.dat' using 1:3 with lines title 'Band 2'
