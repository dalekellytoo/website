function rgb_to_rgbLinear();

	rgb=load('rgb.txt');

	fileID = fopen('rgbLinear.txt','w');

	i=1;

	while (i <= max(size(rgb)))

		if (rgb(i,1) <=  0.04045)

			rgbLinear(i,1)=rgb(i,1)./12.92;

		else

			rgbLinear(i,1)= ((rgb(i,1) + 0.055)./1.055).^2.4;

		endif

		if (rgb(i,1) <=  0.04045)

			rgbLinear(i,2)=rgb(i,2)./12.92;

		else

			rgbLinear(i,2)= ((rgb(i,2) + 0.055)./1.055).^2.4;

		endif

		if (rgb(i,1) <=  0.04045)

			rgbLinear(i,3)=rgb(i,3)./12.92;

		else

			rgbLinear(i,3)= ((rgb(i,3) + 0.055)./1.055).^2.4;

		endif


		
		fprintf(fileID, '%f %f %f\r\n', rgbLinear(i,1), rgbLinear(i,2), rgbLinear(i,3));



		i = i + 1;
	
	endwhile


	fclose(fileID);

endfunction
