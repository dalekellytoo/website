#Generate points for ploting with gnuplot the CIE-chromacity-diagram
#e.g.  plot [0:0.8][0:0.9]"CIEpoints_xy.txt" u 1:2:10 w points pt 5 lc rgb variable
#
#usage:
#gawk -f genCIEpoints_overxy.awk -v d=0.01 -v Y=1.0 -v gam=0.454545
#
#where
#d is the option for resolution
#Y is the luminicity
#gam is the gamma-value
#
#Olaf Schultz, o.schultz@enhydralutris.de
#
#Issues
#11.12.2014 Initial version
#16.12.2014 Working, inclusive to stay inside spectral-locus
#
#Known bugs/limitations:
#
#literature and data-source
#http://www.brucelindbloom.com/index.html?ColorCalculator.html
#http://docs-hoffmann.de/ciesuper.txt (is a postscript-file from gernot hoffmann, got 13.12.2014 from mentioned location)
#
BEGIN{
if (d=="") {d=0.01}
if (Y=="") {Y=1.0}
if (gam=="") {gam=1/2.2}			#ciesuper.txt line 127
ds=d  ;n=split(ds,a,".");if (n==2) {ds=a[1]"p"a[2]} else {ds=Y""} #just replace dot dot resolution-string with point for more convinient file-name containing the resolutions
Ys=Y  ;n=split(Ys,a,".");if (n==2) {Ys=a[1]"p"a[2]} else {Ys=Y""}
gs=gam;n=split(gs,a,".");if (n==2) {gs=a[1]"p"a[2]} else {gs=gam""}
outf="CIEpoints_overxy_d"ds"_Y"Ys"_g"gs".txt"
#spectrallocus-Data for location-check (ciesuper.txt, /ci [...] seems to be for CIE1931!
speclocx="0.1741 0.1740 0.1738 0.1736 0.1733 0.1730 0.1726 0.1721 0.1714 0.1703 0.1689 0.1669 0.1644 0.1611 0.1566 0.1510 0.1440 0.1355 0.1241 0.1096 0.0913 0.0686 0.0454 0.0235 0.0082 0.0039 0.0139 0.0389 0.0743 0.1142 0.1547 0.1929 0.2296 0.2658 0.3016 0.3373 0.3731 0.4087 0.4441 0.4788 0.5125 0.5448 0.5752 0.6029 0.6270 0.6482 0.6658 0.6801 0.6915 0.7006 0.7079 0.7140 0.7190 0.7230 0.7260 0.7283 0.7300 0.7311 0.7320 0.7327 0.7334 0.7340 0.7344 0.7346 0.7347"
speclocy="0.0050 0.0050 0.0049 0.0049 0.0048 0.0048 0.0048 0.0048 0.0051 0.0058 0.0069 0.0086 0.0109 0.0138 0.0177 0.0227 0.0297 0.0399 0.0578 0.0868 0.1327 0.2007 0.2950 0.4127 0.5384 0.6548 0.7502 0.8120 0.8338 0.8262 0.8059 0.7816 0.7543 0.7243 0.6923 0.6589 0.6245 0.5896 0.5547 0.5202 0.4866 0.4544 0.4242 0.3965 0.3725 0.3514 0.3340 0.3197 0.3083 0.2993 0.2920 0.2859 0.2809 0.2770 0.2740 0.2717 0.2700 0.2689 0.2680 0.2673 0.2666 0.2660 0.2656 0.2654 0.2653"
nx=split(speclocx,speclocxf)
ny=split(speclocy,speclocyf)
print " found nx="nx" and ny="ny" points for spectral locus."
p1x=0.7347;p1y=0.2653						#end-points to cloase horse-shoe-diagram
#start to write and calculate data
printf("#generated with genCIEpoints_overxy.awk -v d=%s -v Y=%s  -v G=%s\n",d,Y,gam)>outf
print "#    x      y      z      X      Y      Z   R   G   B   0xRGB">>outf
print "#    1      2      3      4      5      6   7   8   9   10">>outf
for (x=d;x<=1;x+=d)
 {for (y=(0.2653-0.0050)/(0.7347-0.1741)*(x-0.1741)+0.0050;y<1-x;y+=d)	#between purple-line and less than 1-x 
  {if (y<d) {y=d}				#not below y=0
   pr=0						#print, default=0
   z=1-x-y					#ciesuper.txt line 213-215
   X=x/y*Y
   Z=z/y*Y
   R=+2.36461*X-0.89654*Y-0.46807*Z		#ciesuper.txt line 216-218
   G=-0.51517*X+1.42641*Y+0.08876*Z
   B=+0.00520*X-0.01441*Y+1.00920*Z
   max=R;if (G>max) {max=G};if (B>max) {max=B}	#ciesuper.txt line 219-221
   R=R/max;G=G/max;B=B/max			#ciesuper.txt line 222-224
   if (R<0) {R=O};if (G<0) {G<0};if (B<0) {B=0}	#ciesuper.txt line 225-227
   R=R^gam;G=G^gam;B=B^gam			#ciespuer.txt line 228-280
   Rh=int(255*R);Gh=int(255*G);Bh=int(255*B)	#generate rgb-values (0...255)
   RGBH="0x"hexit(Rh) hexit(Gh) hexit(Bh)	#generate 0xRGB for gnuplot
   for (i=1;i<nx-1;i++)				#insidetria for horseshoe/spectral-locus check
    {p2x=speclocxf[i];p2y=speclocyf[i];p3x=speclocxf[i+1];p3y=speclocyf[i+1]	#left corner points of triangle
     v0x=p3x-p1x;v0y=p3y-p1y;v1x=p2x-p1x;v1y=p2y-p1y;v2x=x-p1x;v2y=y-p1y	#theory from http://www.blackpawn.com/texts/pointinpoly/
     dot00=v0x*v0x+v0y*v0y;dot01=v0x*v1x+v0y*v1y;dot02=v0x*v2x+v0y*v2y;dot11=v1x*v1x+v1y*v1y;dot12=v1x*v2x+v1y*v2y;denom=(dot00*dot11-dot01*dot01)
#     u=(dot11*dot02-dot01*dot12)/denom;v=(dot00*dot12-dot01*dot02)/denom		#works well on triangles with large area
     if (denom!=0) {u=(dot11*dot02-dot01*dot12)/denom;v=(dot00*dot12-dot01*dot02)/denom} else {u=10;v=10}
     if (u>0 && v>0 && u+v<1) {pr=1;break}}
   if (pr==1 && Gr<256 && Gr>=0 && Gh<256 && Gh>=0 && Gb<256 && Gb>=0 ) {printf("%.4f %.4f %.4f %6.3f %6.3f %6.3f %3d %3d %3d %s\n",x,y,z,X,Y,Z,Rh,Gh,Bh,RGBH)>>outf;nout++}
 }}
print " "outf" written with "nout" data-lines, finished!" 
}

function hexit(inp) {
ret=sprintf("%2x",inp)
gsub(" ","0",ret)
return ret
}