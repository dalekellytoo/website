function makeRGB();

	fileID = fopen('RGB.txt','w');

	for i = 0:5:255

		for j = 0:5:255

			for k = 0:5:255

				fprintf(fileID, '%d %d %d\r\n', i, j, k);

			endfor

		endfor

	endfor

	fclose(fileID);

endfunction
