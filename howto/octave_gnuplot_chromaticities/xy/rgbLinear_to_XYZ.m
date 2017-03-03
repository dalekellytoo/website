function rgbLinear_to_XYZ();

	rgbLinear=load('rgbLinear.txt');

	rgbLinear=rgbLinear';

	fileID = fopen('XYZ.txt','w');

	i=1;

	while (i <= max(size(rgbLinear)))

		XYZ=[0.4124,0.3576,0.1805;0.2126,0.7152,0.0722;0.0193,0.1192,0.9505]*rgbLinear(:,i);

		fprintf(fileID, '%f %f %f\r\n', XYZ');

		i = i + 1;	

	endwhile

	
	fclose(fileID);

endfunction
