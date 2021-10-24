if can_countdown {
	can_countdown = false;
	current_seconds = seconds;
	
	if(!global.pausedTimer)
		global.currentTime -= 1;
	
	if global.currentTime < 0
		global.currentTime = -1
}

if (current_seconds <= 0) {
	can_countdown = true;	
} else {
	current_seconds -= 1;
}