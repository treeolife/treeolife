/// @description oUIPanelHighlight

event_inherited();
	
// draw icon
draw_sprite_ext(
	icon, 
	iconSubimg, 
	x - width/2 + 20, 
	y + sprite_get_yoffset(icon) / 3 + 2,
	1,
	1,
	image_angle,
	image_blend,
	image_alpha);
	
scr_draw_set(image_alpha, c_black, function() {
	scr_set_align(fa_center, fa_middle);
	draw_set_font(fInventory);
	draw_text(x + offset,y,message);
})