function RGBlinear = XYZ_to_RGBlinear_points(XYZ);

	XYZ_to_linear_sRGB_matrix=[3.2406 -1.5372 -0.4986 ; -0.9689 1.8758 0.0415 ; 0.0557 -0.2040 1.0570];

	i=1;
		while	[i <= (max(size(XYZ)))]
			RGBlinear(:,i)=XYZ_to_linear_sRGB_matrix*(XYZ(i,:))';
			i=i+1;
		endwhile
		RGBlinear=RGBlinear';

		max(RGBlinear(:,1))
		max(RGBlinear(:,2))
		max(RGBlinear(:,3))
		min(RGBlinear(:,1))
		min(RGBlinear(:,2))
		min(RGBlinear(:,3))

endfunction
