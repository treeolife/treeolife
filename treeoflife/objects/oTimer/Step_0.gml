if !global.gamePaused {
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

	if (global.currentTime == 0) {
		show_debug_message("Advancing...");
		if global.wave < 4 {
			global.wave += 1;
			oController.advanceLevel(global.wave);	
		}
	}
}