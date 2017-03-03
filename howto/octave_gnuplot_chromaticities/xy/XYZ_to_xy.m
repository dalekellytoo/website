function XYZ_to_xy();

# edited by Dale Kelly dale@dalekelly.org
# XYZ from http://cvrl.ioo.ucl.ac.uk/
# XYZ to x,y formula at https://en.wikipedia.org/wiki/CIE_1931_color_space

	fileID = fopen('visual_xy_locus.txt','w');
	nm_and_XYZ=csvread("ciexyz31_1.csv");

	i=1;

	while (i <= max(size(nm_and_XYZ)))
		nm = nm_and_XYZ(i,1);
		denom = 1 / (nm_and_XYZ(i,2) + nm_and_XYZ(i,3) + nm_and_XYZ(i,4));
		x = nm_and_XYZ(i,2) * denom;
		y = nm_and_XYZ(i,3) * denom;
		Y = nm_and_XYZ(i,3);
		fprintf(fileID,'%i %f %f\r\n',nm, x, y);
		i=i+1;
	endwhile
	fclose(fileID);
	
endfunction
