set terminal pdfcairo 
set output "Cambio de fase 1S0 V.pdf"
set encoding utf8
set xlabel "E_{lab} (MeV)"
set ylabel "{/Symbol d} (grados)"
set yrange [-10:70]
set xrange [0:300]
set grid
plot 'CDF_V1S0.txt' using 1:2 with lines title 'Malfliet-Tjon' lt rgb 'red' dt 2 lw 2, \
	 'CDF_V1S0.txt' using 1:3 with lines title 'Manning-Rosen' lt rgb 'blue' dt 5 lw 2, \
	 'CDF_V1S0.txt' using 1:4 with lines title 'Morse' lt rgb 'black' lw 2, \
	 'CDF_V1S0.txt' using 1:5 with lines title 'Hulthen' lt rgb 'brown' dt 3 lw 2, \
	 'CDF_V1S0.txt' using 1:6 with points title 'Exp. Arndt. 1983' lt rgb 'blue' pt 10 lw 3 ps 1

set terminal pdfcairo 
set output "Cambio de fase 1S0 N.pdf"
set encoding utf8
set xlabel "E_{lab} (MeV)"
set ylabel "{/Symbol d} (grados)"
set yrange [-10:70]
set xrange [0:300]
set grid
plot 'CDF_N1S0.txt' using 1:2 with lines title 'Malfliet-Tjon' lt rgb 'red' dt 2 lw 2, \
	 'CDF_N1S0.txt' using 1:3 with lines title 'Manning-Rosen' lt rgb 'blue' dt 5 lw 2, \
	 'CDF_N1S0.txt' using 1:4 with lines title 'Morse' lt rgb 'black' lw 2, \
	 'CDF_N1S0.txt' using 1:5 with lines title 'Hulthen' lt rgb 'brown' dt 3 lw 2, \
	 'CDF_Exp_1S0.txt'		  with points title 'Exp. Perez. 2016' lt rgb 'red' pt 6 lw 3 ps 1, \
	 'CDF_N1S0.txt' using 1:6 with points title 'Exp. Arndt. 1983' lt rgb 'blue' pt 10 lw 3 ps 1
