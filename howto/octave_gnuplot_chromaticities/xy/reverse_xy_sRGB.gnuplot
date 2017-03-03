set terminal qt size 1000,1000
set title "CIE 1931 x,y chromaticity diagram"
set xrange [0:0.9]
set yrange [0:0.9]
set xlabel "x"
set ylabel "y"
set size square
set mouse
plot "sRGBhex_and_xy.txt" using 1:2:3 with points pt 5 linecolor rgb variable, "visual_xy_locus.txt" using 2:3 with lines title "spectral locus" linecolor -1, "xy_lineofpurples.txt" using 2:3 with lines title "line of purples" linecolor -1, "visual_xy_locus_labels.txt" using 2:3:1 with labels notitle, "planck_xy_locus.txt" using 2:3:1 with labels title "planck locus", "Adobe_Wide_Gamut_RGB_xy_primaries.txt" using 1:2 with lines title "Adobe Wide Gamut RGB", "ProPhotoRGB_xy_primaries.txt" using 1:2 with lines title "Pro Photo RGB", "Abobe_1998_RGB_xy_primaries.txt" using 1:2 with lines title "Adobe 1998 RGB","sRGB_xy_primaries.txt" using 1:2 with lines title "sRGB"
