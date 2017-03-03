set terminal qt size 1000,1000
set title "CIE 1931 x,y chromaticity diagram"
set xrange [0:0.9]
set yrange [0:0.9]
set xlabel "x"
set ylabel "y"
set size square
set mouse
plot "visual_xy_locus.txt" using 2:3 with lines title "spectral locus" linecolor -1, "xy_lineofpurples.txt" using 2:3 with lines title "line of purples" linecolor -1
