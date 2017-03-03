function RGB_to_rgb();

	RGB=load('RGB.txt');

	denom = 1/255;

	rgb=RGB.*denom;

	fileID = fopen('rgb.txt','w');

	i=1;

	while (i <= max(size(rgb)))

		fprintf(fileID, '%f %f %f\r\n', rgb(i,1), rgb(i,2), rgb(i,3));

		i = i + 1;

	endwhile


	fclose(fileID);

endfunction
