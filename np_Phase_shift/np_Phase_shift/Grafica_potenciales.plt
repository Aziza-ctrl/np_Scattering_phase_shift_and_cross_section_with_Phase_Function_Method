set terminal pdfcairo
set output 'Potencial 3S1 N.pdf'
set xlabel 'r(fm)'
set ylabel 'V(r) (MeV)'
set xrange [0:5]
set yrange [-200:100]
set grid
plot 'Pot_3S1_N.txt' using 1:2 with lines title 'Malfliet-Tjon' lt rgb 'red' dt 2 lw 2, \
	 'Pot_3S1_N.txt' using 1:3 with lines title 'Manning-Rosen' lt rgb 'blue' dt 5 lw 2, \
	 'Pot_3S1_N.txt' using 1:4 with lines title 'Morse' lt rgb 'black' lw 2, \
	 'Pot_3S1_N.txt' using 1:5 with lines title 'Hulthen' lt rgb 'brown' dt 3 lw 2

set terminal pdfcairo
set output 'Potencial 1S0 N.pdf'
set xlabel 'r(fm)'
set ylabel 'V(r) (MeV)'
set xrange [0:5]
set yrange [-200:100]
set grid
plot 'Pot_1S0_N.txt' using 1:2 with lines title 'Malfliet-Tjon' lt rgb 'red' dt 2 lw 2, \
	 'Pot_1S0_N.txt' using 1:3 with lines title 'Manning-Rosen' lt rgb 'blue' dt 5 lw 2, \
	 'Pot_1S0_N.txt' using 1:4 with lines title 'Morse' lt rgb 'black' lw 2, \
	 'Pot_1S0_N.txt' using 1:5 with lines title 'Hulthen' lt rgb 'brown' dt 3 lw 2

set terminal pdfcairo
set output 'Potencial 3S1 V.pdf'
set xlabel 'r(fm)'
set ylabel 'V(r) (MeV)'
set xrange [0:5]
set yrange [-200:100]
set grid
plot 'Pot_3S1_V.txt' using 1:2 with lines title 'Malfliet-Tjon' lt rgb 'red' dt 2 lw 2, \
	 'Pot_3S1_V.txt' using 1:3 with lines title 'Manning-Rosen' lt rgb 'blue' dt 5 lw 2, \
	 'Pot_3S1_V.txt' using 1:4 with lines title 'Morse' lt rgb 'black' lw 2, \
	 'Pot_3S1_V.txt' using 1:5 with lines title 'Hulthen' lt rgb 'brown' dt 3 lw 2

set terminal pdfcairo
set output 'Potencial 1S0 V.pdf'
set xlabel 'r(fm)'
set ylabel 'V(r) (MeV)'
set xrange [0:5]
set yrange [-200:100]
set grid
plot 'Pot_1S0_V.txt' using 1:2 with lines title 'Malfliet-Tjon' lt rgb 'red' dt 2 lw 2, \
	 'Pot_1S0_V.txt' using 1:3 with lines title 'Manning-Rosen' lt rgb 'blue' dt 5 lw 2, \
	 'Pot_1S0_V.txt' using 1:4 with lines title 'Morse' lt rgb 'black' lw 2, \
	 'Pot_1S0_V.txt' using 1:5 with lines title 'Hulthen' lt rgb 'brown' dt 3 lw 2