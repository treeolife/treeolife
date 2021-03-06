if (outline) {

	shader_set(shUI);

	// grab stuff, pointers
	var texture = sprite_get_texture(sprite_index, image_index);
	var texture_Width  = texture_get_texel_width(texture);
	var texture_Height = texture_get_texel_height(texture);

	// put stuff in -> vec2 2 values
	shader_set_uniform_f(sh_texel_handle, texture_Width, texture_Height );
}

if draw
	draw_self();

if outline	
	shader_reset();

	//draw_nineslice(ns_uniforms, ns_uvs, x, y, sprite_width*image_xscale, sprite_height*image_yscale);

