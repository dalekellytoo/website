#data derived from CIE D002-2004 XYZ tristimulus values
#at http://www.cie.co.at/ , the source
#with http://en.wikipedia.org/wiki/CIELUV calculations
#a free source of XYZ is found at http://cvrl.ioo.ucl.ac.uk/cmfs.htm
#plot command derived from Olaf Shultz  o.schultz@enhydralutris.de
#at http://www.enhydralutris.de/Diverses/plotCIEwithGnuplot.tgz
set terminal qt size 1000,1000
set title "CIE 1931 u',v' chromaticity diagram"
set xrange [0:0.8]
set yrange [0:0.8]
set xlabel "u'"
set ylabel "v'"
set size square
set mouse
plot "spectral_locus.txt" using 1:2 with lines title "spectral locus" linecolor -1,"spectral_locus_labels.txt" using 1:2:3 with labels font "Times,10" rotate by 45 offset .5,.5 title "", "purples.txt" linecolor -1 with lines title "","planckian_locus_upvp.txt" using 1:2 with linespoints title "planckian locus","" using 1:2:3 with labels font "Times,8" rotate by 90 offset 0,1 t ""

