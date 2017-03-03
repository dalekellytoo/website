function XYZ_to_xyz();

	XYZ=load('XYZ.txt');

	X=XYZ(:,1);
	Y=XYZ(:,2);
	Z=XYZ(:,3);

	fileID = fopen('xyz.txt','w');

	i=1;

	while (i <= max(size(XYZ)))


		if ( (X(i)+Y(i)+Z(i)) <= 0 )

			denom(i)=0;

		else

			denom(i)=1./(X(i)+Y(i)+Z(i));


		endif

		xyz(i,1)=X(i).*denom(i);

		xyz(i,2)=Y(i).*denom(i);

		xyz(i,3)=(1 - xyz(i,1) - xyz(i,2));	


		fprintf(fileID, '%f %f %f\r\n', xyz(i,1), xyz(i,2), xyz(i,3));

		i = i + 1;	

	endwhile

	
	fclose(fileID);

endfunction
