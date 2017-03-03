#Generate points for ploting with gnuplot the CIE-chromacity-diagram
#e.g.  plot [0:0.8][0:0.8]"gen_uv_CIEpoints_sRGB.txt" u 1:2:10 w points pt 5 lc rgb variable
#
#usage:
#gawk -f gen_uv_CIEpoints_sRGB.awk -v d=5
#
#where d is the option delta in numbers of RGB-Values (0...255 0...255 0...255), default d=5
#
#Olaf Schultz, o.schultz@enhydralutris.de
#Initial version: 11.12.2014
#
#Known bugs/limitations:
#11.12.2014: covers only the sRGB-colour-scheme
#
#literature and data-source
#http://www.brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html
#http://www.poynton.com/PDFs/ColorFAQ.pdf
#
#Dale Kelly dale@dalekelly.org 22.12.2014
#edited for u'v' output rather than x,y and a couple minor doc changes above, on my computer with 1GB RAM, it crawls with d greater than 5 in plot
#literature http://en.wikipedia.org/wiki/CIELUV calculations
BEGIN{
if (d=="") {d=5}
if (t=="") {t="sRGB"}
outf="CIEpoints_"t".txt";printf("#generated with genCIEpoints.awk -v d=%s -v t=%s\n",d,t)>outf
print "#    x      y      z      X      Y      Z   R   G   B   0xRGB">>outf
print "#    1      2      3      4      5      6   7   8   9   10">>outf
for (R=0;R<=255;R=R+d)			#Loops for the hex-range
 {for (G=0;G<=255;G=G+d)		
  {for (B=0;B<=255;B=B+d)
   {Re=R/255;Ge=G/255;Be=B/255		#from hex to unit (einheits)
    if (t=="GeHo")
     {X=0.49000*R+0.31000*G+0.20000*B	#Gernot Hoffmann
      Y=0.17697*R+0.81240*G+0.01063*B
      Z=0.00000*R+0.01000*G+0.99000*B}
    if (t=="sRGB")				#actual sRGBD65 http://www.brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html
     {X=0.4124564*Re+0.3575761*Ge+0.1804375*Be	#first Wikipedia http://de.wikipedia.org/wiki/CIE-Normvalenzsystem sRGB
      Y=0.2126729*Re+0.7151522*Ge+0.0721750*Be	#second http://www.poynton.com/PDFs/ColorFAQ.pdf
      Z=0.0193339*Re+0.1191920*Ge+0.9503041*Be}	#
    if (t=="ARGBD50")				#AdobeRGB D50 http://www.brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html
     {X=0.6097559*Re+0.2052401*Ge+0.1492240*Be	
      Y=0.3111242*Re+0.6256560*Ge+0.0632197*Be	
      Z=0.0194811*Re+0.0608902*Ge+0.7448387*Be}	
    if (t=="ARGBD65")				#AdobeRGB D65 http://www.brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html
     {X=0.5767309*Re+0.1855540*Ge+0.1881852*Be	
      Y=0.2973769*Re+0.6273491*Ge+0.0752741*Be	
      Z=0.0270343*Re+0.0706872*Ge+0.9911085*Be}	
    if (t=="proPhoD50")				#ProPhoto D50 http://www.brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html
     {X=0.7976749*Re+0.1351917*Ge+0.0313534*Be	
      Y=0.2880402*Re+0.7118741*Ge+0.0000857*Be	
      Z=0.0000000*Re+0.0000000*Ge+0.8252100*Be}	
    if (t=="colMaD50")				#ColorMatch D50 AdobeRGB1998 http://www.brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html
     {X=0.5093439*Re+0.3209071*Ge+0.1339691*Be	
      Y=0.2748840*Re+0.6581315*Ge+0.0669845*Be	
      Z=0.0242545*Re+0.1087821*Ge+0.6921735*Be}	
    if (t=="CIERGBE")				#CIE RGB E AdobeRGB1998 http://www.brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html
     {X=0.4887180*Re+0.3106803*Ge+0.2006017*Be	
      Y=0.1762044*Re+0.8129847*Ge+0.0108109*Be	
      Z=0.0000000*Re+0.0102048*Ge+0.9897952*Be}	
    if(X+Y+Z!=0)			#Otherise div by zero 
     {up=(4*X)/(X+(15*Y)+(3*Z))
      vp=(9*Y)/(X+(15*Y)+(3*Z))}
      else {up=0;vp=0}
	
      RGBH="0x"hexit(R) hexit(G) hexit(B)
      printf("%.4f %.4f %.4f %6.3f %6.3f %6.3f %3d %3d %3d %s\n",up,vp,vp,X,Y,Z,R,G,B,RGBH)>>outf;nout++
   }}}
print " "outf" written with "nout" data-lines, finished!" 
}

function hexit(inp) {
ret=sprintf("%2x",inp)
gsub(" ","0",ret)
return ret
}
