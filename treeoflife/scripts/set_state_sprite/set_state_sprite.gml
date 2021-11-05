function set_state_sprite(newSprite, newSpeed, newIndex){
	if (sprite_index != newSprite) {
		sprite_index = newSprite;
		image_speed = newSpeed;
		image_index = newIndex;
	}
}