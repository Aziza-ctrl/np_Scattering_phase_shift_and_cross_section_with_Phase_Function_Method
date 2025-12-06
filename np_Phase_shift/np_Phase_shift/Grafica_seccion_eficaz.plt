set terminal pdfcairo
set output 'Seccion_eficaz_total_N.pdf'
set encoding utf8
set title "Seccion eficaz de dispersion"
set xlabel "Elab(MeV)"
set ylabel "{/Symbol s}_{total} (barn)"
set xrange [1e-3:300]
set logscale x
set yrange [0:25]
plot 'SE_total_N.txt' using 1:2 with lines title 'Malfliet-Tjon' lt rgb 'red' dt 2 lw 2, \
	 'SE_total_N.txt' using 1:3 with lines title 'Manning-Rosen' lt rgb 'blue' dt 5 lw 2, \
	 'SE_total_N.txt' using 1:4 with lines title 'Morse' lt rgb 'black' lw 2, \
	 'SE_total_N.txt' using 1:5 with lines title 'Hulthen' lt rgb 'brown' dt 3 lw 2, \
	 'SE_Exp.txt' using 1:2 with points title 'Seccion eficaz Exp.' lt rgb 'green' pt 7

set terminal pdfcairo
set output 'Seccion_eficaz_total_V.pdf'
set encoding utf8
set title "Seccion eficaz de dispersion"
set xlabel "Elab(MeV)"
set ylabel "{/Symbol s}_{total} (barn)"
set xrange [1e-3:300]
set logscale x
set yrange [0:25]
plot 'SE_total_V.txt' using 1:2 with lines title 'Malfliet-Tjon' lt rgb 'red' dt 2 lw 2, \
	 'SE_total_V.txt' using 1:3 with lines title 'Manning-Rosen' lt rgb 'blue' dt 5 lw 2, \
	 'SE_total_V.txt' using 1:4 with lines title 'Morse' lt rgb 'black' lw 2, \
	 'SE_total_V.txt' using 1:5 with lines title 'Hulthen' lt rgb 'brown' dt 3 lw 2, \
	 'SE_Exp.txt' using 1:2 with points title 'Seccion eficaz Exp.' lt rgb 'green' pt 7