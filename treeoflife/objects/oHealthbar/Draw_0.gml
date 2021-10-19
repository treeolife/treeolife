/// @description 

if (hp <= 0) {
	instance_destroy();
}

if (flash > 0) {
	flash--;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}

var pixels_up = sprite_height+4;
healthbar_width = sprite_width;

draw_sprite_stretched(sHealthbarBg,0,xx-healthbar_width/2,yy-pixels_up,healthbar_width,healthbar_height); 
if (friendly) draw_sprite_stretched(sHealth,0,xx-healthbar_width/2,yy-pixels_up,clamp(hp/hp_max,0,1) * healthbar_width, healthbar_height); 
else draw_sprite_stretched(sHealthRed,0,xx-healthbar_width/2,yy-pixels_up,clamp(hp/hp_max,0,1) * healthbar_width, healthbar_height); 
//draw_sprite_stretched(sHealthbarBorder,0,xx-healthbar_width/2,yy-pixels_up,healthbar_width,healthbar_height); 
