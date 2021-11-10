function scr_play_audio(index, volume, loop){
	
	// max volume is 100, min volume is 0
	//var volume = 50;
	//var loop = false;
	
	snd = noone;
	
	var priority = 1;
	
	var playAt = noone;
	if (instance_exists(oPlayer))
		playAt = oPlayer;
	else if (instance_exists(oTree))
		playAt = oTree;
		
	// position Z is 0 because this is a 2D game, has no Z axis
	if(playAt != noone) {
		audio_listener_position(playAt.x, playAt.y, 0);
		audio_listener_orientation(0, 1, 0, 0, 0, 1);
	}
	
	audio_falloff_set_model(audio_falloff_exponent_distance);
	if (playAt != noone)
		snd = audio_play_sound_at(index, x, y, 0, volume, window_get_width(), 1, loop, priority);
	else
		snd = audio_play_sound(index, priority, loop);
		
	if (index == snd_enter_key && snd != noone)
		audio_sound_set_track_position(snd, 0.21);
}