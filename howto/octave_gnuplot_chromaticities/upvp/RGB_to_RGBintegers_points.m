function RGBintegers = RGB_to_RGBintegers_points(RGB);

# make integer and multiply by 255


i=1;

while   i <= max(size(RGB))


	RGBintegers(i,1) = int32(RGB(i,1).*255);
	RGBintegers(i,2) = int32(RGB(i,2).*255);
	RGBintegers(i,3) = int32(RGB(i,3).*255);

	i=i+1;

endwhile

max(RGBintegers(:,1))
max(RGBintegers(:,2))
max(RGBintegers(:,3))
min(RGBintegers(:,1))
min(RGBintegers(:,2))
min(RGBintegers(:,3))


# clip max to 255


j=1;
		

while j <= max(size(RGBintegers))

		if RGBintegers(j,1) > 255

			RGBintegers(j,1)=255;

		endif

	if RGBintegers(j,2) > 255

			RGBintegers(j,2)=255;

		endif

	if RGBintegers(j,3) > 255

			RGBintegers(j,3)=255;

		endif
	
	
j=j+1;

endwhile

max(RGBintegers(:,1))
max(RGBintegers(:,2))
max(RGBintegers(:,3))


endfunction
