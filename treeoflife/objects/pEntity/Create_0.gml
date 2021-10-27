/// @description 
//upixelH = shader_get_uniform(shEntity, "pixelH");
//upixelW = shader_get_uniform(shEntity, "pixelW");
//texelW = 4*texture_get_texel_width(sprite_get_texture(sprite_index, 0));
//texelH = 4*texture_get_texel_height(sprite_get_texture(sprite_index, 0));

draw = false;

sh_texel_handle = shader_get_uniform(
	shEntity, "texture_Pixel");