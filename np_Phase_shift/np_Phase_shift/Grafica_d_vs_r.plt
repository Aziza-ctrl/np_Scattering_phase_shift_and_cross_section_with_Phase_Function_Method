set terminal pdfcairo
set output 'Grafica_d_vs_r.pdf'
set encoding utf8
set multiplot layout 3,2 margins char 9,10,2.5,1 spacing screen 0.2, char 3 
set xlabel "r (fm)" font ',9' offset 0,0.5
set ylabel "{/Symbol d} (grados)" font ',9' offset 1,0
set yrange [-40:100]
set xrange [0:5]
set tics font ',8'
set key font ',7'
set grid
plot '1MeV.txt' with lines title 'E_{lab} = 1 MeV' lt rgb 'blue'
plot '10MeV.txt' with lines title 'E_{lab}  = 10 MeV' lt rgb 'blue'
plot '50MeV.txt' with lines title 'E_{lab} = 50 MeV' lt rgb 'blue'
plot '100MeV.txt' with lines title 'E_{lab} = 100 MeV' lt rgb 'blue'
plot '200MeV.txt' with lines title 'E_{lab} = 200 MeV' lt rgb 'blue'
plot '300MeV.txt' with lines title 'E_{lab} = 300 MeV' lt rgb 'blue'
unset multiplot