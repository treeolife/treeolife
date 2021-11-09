function scr_play_audio(index, volume){
	
	// max volume is 100, min volume is 0
	//var volume = 50;
	
	var loop = false;
	var priority = 1;
	
	var playAt = noone;
	if (instance_exists(oPlayer))
		playAt = oPlayer;
	else if (instance_exists(oTree))
		playAt = oTree;
		
	// position Z is 0 because this is a 2D game, has no Z axis
	audio_listener_position(playAt.x, playAt.y, 0);
	
	audio_listener_orientation(0, 1, 0, 0, 0, 1);
	audio_falloff_set_model(audio_falloff_exponent_distance);
	if (playAt != noone)
		audio_play_sound_at(index, x, y, 0, volume, 5, 1, loop, priority);
	else
		audio_play_sound(index, priority, loop);
}