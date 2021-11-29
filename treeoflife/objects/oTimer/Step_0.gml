if (!timer_paused) {
	if (instance_exists(panelTimer))
		panelTimer.time = time;
}

if can_countdown {
	can_countdown = false;
	current_seconds = seconds;
	
	time -= 1;
	
	if (time < 0 && bufferSeconds == 0) {
		instance_destroy();
	}
}

if (current_seconds <= 0) {
	can_countdown = true;	
} else if (!timer_paused && !global.gamePaused) {
	current_seconds -= 1;
}

if (time == 0) {
	
	if (bufferSeconds != 0) {
			panelTimer.postText = postText;
			if (bufferSeconds > 1)
				alarm[1] = (bufferSeconds - 2) * room_speed;
			else 
				alarm[0] = bufferSeconds * room_speed;
	} else if (callback != noone)
		callback();
}