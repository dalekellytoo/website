function XYZ_to_uv();

	XYZ=load('XYZ.txt');

	X=XYZ(:,1);
	Y=XYZ(:,2);
	Z=XYZ(:,3);

	fileID = fopen('uv.txt','w');

	i=1;

	while (i <= max(size(XYZ)))


		if ( (X(i)+Y(i).*15+Z(i).*3) <= 0 )

			denom(i)=0;

		else

			denom(i)=1./(X(i)+Y(i).*15+Z(i).*3);


		endif

		uv(i,1)=X(i).*4.*denom(i);

		uv(i,2)=Y(i).*9.*denom(i);


		fprintf(fileID, '%f %f\r\n', uv(i,1), uv(i,2));

		i = i + 1;	

	endwhile

	
	fclose(fileID);

endfunction
