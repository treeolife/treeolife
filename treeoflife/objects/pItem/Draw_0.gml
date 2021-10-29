/// @description 

// Inherit the parent event
event_inherited();

if !picked {
	gpu_set_blendmode(bm_add);

	// += adds more images around the object or less
	for (c=0; c<360;c+=20) { 
		draw_sprite_ext(
			sprite_index,
			image_index,
			x+lengthdir_x(6,c),
			y+lengthdir_y(6,c),
			image_xscale,
			image_yscale,
			image_angle,
			image_blend,
			sineWave*0.02
		);
	}

	gpu_set_blendmode(bm_normal);
}

// Same as draw self except we 
// modify the hover without changing y-value
// to affect interact distance checking
//draw_sprite_ext(
//		sprite_index,
//		image_index,
//		x,
//		_y,
//		image_xscale,
//		image_yscale,
//		image_angle,
//		image_blend,
//		image_alpha
//	);

draw_self();