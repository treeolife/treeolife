xScaleFactor = width / sprite_width;

if (flex) {
	var estWidth = string_length(message) * 8 + offset * 4;
	if (estWidth > width) {
		width = estWidth;
		image_xscale = width / sprite_width;
	}
} else if (image_xscale < xScaleFactor) {
	image_xscale = xScaleFactor;	
}