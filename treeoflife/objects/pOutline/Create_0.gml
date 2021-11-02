/// @description 

event_inherited();

draw = false;
outline = false;

sh_texel_handle = shader_get_uniform(
	shUI, "texture_Pixel");
	
//ns_uniforms = nineslice_uniforms();
//ns_uvs = nineslice_uvs(sprite_index, image_index);