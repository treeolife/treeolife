function draw_self_facing() {
	draw_sprite_ext(sprite_index,image_index,x,y,
	                face_direction,image_yscale,image_angle,
	                image_blend,image_alpha);
}
