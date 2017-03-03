function sRGB_upvpY_point_in_polygon();

# edited by Dale Kelly 7/4/2015 dale@dalekelly.org
# increment is how many same dimensional vertical/horizontal points, for instance 0.001
# 

	fileID = fopen('sRGB_upvp_inon_locus_and_hex.txt', 'w');
	
	xv = [0.4593639576, 0.125, 0.1754385965];
	yv = [0.5247349823, 0.5625, 0.1578947368];

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
