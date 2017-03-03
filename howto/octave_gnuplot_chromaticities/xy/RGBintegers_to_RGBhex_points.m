function RGBhex = RGBintegers_to_RGBhex_points(RGBintegers);

xy=load('sRGB_xy_inon_locus_and_hex.txt');

fileID = fopen('xy_and_sRGBhex.txt','w');

i=1;

while i <= max(size(RGBintegers))

Rhex(i,1:2)=dec2hex(RGBintegers(i,1),2);
Ghex(i,1:2)=dec2hex(RGBintegers(i,2),2);
Bhex(i,1:2)=dec2hex(RGBintegers(i,3),2);

RGBhex(i,1:8) = strcat("0x",Rhex(i,1:2),Ghex(i,1:2),Bhex(i,1:2));

fprintf(fileID,'%f %f %s\r\n',xy(i,1),xy(i,2),RGBhex(i,1:8));

i=i+1;

endwhile

fclose(fileID);

endfunction
