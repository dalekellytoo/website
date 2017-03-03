set terminal qt size 1000,1000
set title "CIE 1976 u',v' UCS"
set xrange [0:0.7]
set yrange [0:0.7]
set xlabel "u'"
set ylabel "v'"
set size square
set mouse
plot "visual_upvp_locus.txt" using 2:3 with lines title "spectral locus" linecolor -1
