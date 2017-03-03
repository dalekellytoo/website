function uv_and_RGBhex();

	uv=load('uv.txt');
	RGB=load('RGB.txt');
	fileID = fopen('sRGBhex_and_uv.txt','w');

	

	i=1;

	while (i <= max(size(RGB)))

		Rhex(i,1:2) = dec2hex(RGB(i,1),2);
		Ghex(i,1:2) = dec2hex(RGB(i,2),2);
		Bhex(i,1:2) = dec2hex(RGB(i,3),2);

		RGBhex(i,1:8) = strcat("0x",Rhex(i,1:2),Ghex(i,1:2),Bhex(i,1:2));


		fprintf(fileID,'%f %f %s\r\n',uv(i,1:2),RGBhex(i,1:8));

		i = i + 1;	

	endwhile

	
	fclose(fileID);

endfunction
