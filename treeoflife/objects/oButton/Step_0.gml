/// @description 

if (buttonLoaded) {
	draw = true;
}

if (!buttonLoaded) {

	image_xscale = width / sprite_width;
	image_yscale = height / sprite_height;
	
	x = _x + width/2;
	y = _y + height/2;	
	
	buttonLoaded = true;
}
	