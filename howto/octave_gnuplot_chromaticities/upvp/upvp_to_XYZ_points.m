function XYZ = upvp_to_XYZ_points(Y);
	
	xy=load('sRGB_upvp_inon_locus_and_hex.txt');


	
	XYZ(:,2)=ones(max(size(xy)),1).*Y;

	i=1;

	while [i <= (max(size(xy)))]
		invdenom(i,1) = 1 ./ (4.*xy(i,2));
		XYZ(i,1) = (xy(i,1)*9 .* invdenom(i,1)) .* Y;
		XYZ(i,3) = ((12 - xy(i,1)*3 - xy(i,2)*20) .* invdenom(i,1)) .*Y;
		i=i+1;
	endwhile

	while (i <= (max(size(xy))))
		if (xy(i,2)=0)
			XYZ(i,1)=0;
			XYZ(i,2)=0;
			XYZ(i,3)=0;
		endif
		i=i+1;
	endwhile


	max(xy(:,1))
	min(xy(:,1))
	max(xy(:,2))
	min(xy(:,2))	
	

	size(XYZ(:,1))
	size(XYZ(:,2))
	size(XYZ(:,3))
	max(XYZ(:,1))
	min(XYZ(:,1))
	max(XYZ(:,2))
	min(XYZ(:,2))
	max(XYZ(:,3))
	min(XYZ(:,3))
		


endfunction
