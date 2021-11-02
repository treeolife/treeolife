/// @description 

event_inherited();

//show_debug_message("Drawing in oButton. x = " + string(x) + " ... y = " + string(y));
//show_debug_message("Width = " + string(width) + " ... Height = " + string(height));

// button
//draw_sprite_stretched(
//	sprite_index,
//	image_index,
//	x,
//	y,
//	width,
//	height
//);


if (icon != noone) {
	draw_sprite_ext(
		icon, 
		iconSubimg, 
		x,
		y,
		1,
		1,
		image_angle,
		image_blend,
		image_alpha);
}
	
scr_draw_set(image_alpha, c_white, function() {
	scr_set_align(fa_center, fa_middle);
	draw_set_font(fInventory);
	draw_text(x+width/2,y+height/2,message);
})