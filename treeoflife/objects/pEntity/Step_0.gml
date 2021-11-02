/// @description 

if (instance_exists(oPlayer)) { 
	if (oPlayer.midoriState != MIDORI.locked) {
		sh_texel_handle = shader_get_uniform(
			shEntity, "texture_Pixel");
	} else {
		sh_texel_handle = shader_get_uniform(
			shBlackOutline, "texture_Pixel");
	}
}

