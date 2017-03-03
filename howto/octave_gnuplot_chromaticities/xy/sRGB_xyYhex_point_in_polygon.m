function sRGB_xyYhex_point_in_polygon()

# edited by Dale Kelly 7/4/2015 dale@dalekelly.org
# increment is how many same dimensional vertical/horizontal points, for instance 0.001
# 

	fileID = fopen('sRGB_xy_inon_locus_and_hex.txt', 'w');
	
	xv = [0.6400, 0.3000, 0.1500];
	yv = [0.3300, 0.6000, 0.0600];

	xa = [0:0.0025:1];
	ya = [0:0.0025:1];
	[x,y] = meshgrid (xa, ya);
 	[in,on] = inpolygon (x, y, xv, yv);
 	inside = in & !on;

	x_linear=x(inside);
	y_linear=y(inside);

	j=1;

	while (j <= max(size(x_linear)))


		fprintf(fileID,'%f %f \r\n',x_linear(j),y_linear(j));

		j=j+1;
	
	endwhile

	fclose(fileID);
	
endfunction
