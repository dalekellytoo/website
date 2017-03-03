function RGB = RGBlinear_to_RGB_points(RGBlinear);


	

	i=1;

	while [i <= (max(size(RGBlinear)))]


		if RGBlinear(i,1) <= 0.0031308

			R(i) = abs(12.92.*RGBlinear(i,1));
			else R(i) = abs(1.055.*RGBlinear(i,1).^(1/2.4));
		endif


		if RGBlinear(i,2) <= 0.0031308

			G(i) = abs(12.92.*RGBlinear(i,2));
			else G(i) = abs(1.055.*(RGBlinear(i,2).^(1/2.4)));
		endif



		if RGBlinear(i,3) <= 0.0031308

			B(i) = abs(12.92.*RGBlinear(i,3));
			else B(i) = abs(1.055.*RGBlinear(i,3).^(1/2.4));
		endif

		i=i+1;

	endwhile

	RGB=[R; G; B]';


endfunction
