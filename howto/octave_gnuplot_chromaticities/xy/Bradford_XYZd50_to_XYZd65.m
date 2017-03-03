function XYZd65 = Bradford_XYZd50_to_XYZd65(XYZd50);
# adaption matrix from
# http://www.brucelindbloom.com/index.html?Eqn_ChromAdapt.html

	XYZd50_to_XYZd65_matrix=[0.9555766 -0.02330393 0.0631636 ; -0.0282895 1.0099416 0.0210077 ; 0.0122982 -0.0204830 1.3299098];

	i=1;

	while	[i <= (max(size(XYZd50)))]
		XYZd65(:,i)=XYZd50_to_XYZd65_matrix*(XYZd50(i,:))';
		i=i+1;
	endwhile

	XYZd65=XYZd65';



endfunction
