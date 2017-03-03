function xy_and_RGBhex();

	xyz=load('xyz.txt');
	RGB=load('RGB.txt');
	fileID = fopen('sRGBhex_and_xy.txt','w');

	xy=xyz(:,1:2);

	

	i=1;

	while (i <= max(size(RGB)))

		Rhex(i,1:2) = dec2hex(RGB(i,1),2);
		Ghex(i,1:2) = dec2hex(RGB(i,2),2);
		Bhex(i,1:2) = dec2hex(RGB(i,3),2);

		RGBhex(i,1:8) = strcat("0x",Rhex(i,1:2),Ghex(i,1:2),Bhex(i,1:2));


		fprintf(fileID,'%f %f %s\r\n',xy(i,1:2),RGBhex(i,1:8));

		i = i + 1;	

	endwhile

	
	fclose(fileID);

endfunction
