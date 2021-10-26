/// @description Runs 1st

// stores global variables
global.water_amount = 100;
global.seed_amount	= 1;
global.wave			= 0;
global.cost			= 0;
global.timer		= 30;
global.pausedTimer	= false;
global.currentTime	= 0;
global.gamePaused	= false;

advanceLevel = function() {
	var roomName;
	var wave_number = real(global.wave + 1);
	//show_debug_message("wave " + string(global.wave));
	//show_debug_message("wave num " + string(wave_number));
	switch(wave_number) {
		case 1: roomName = rOne; 
		room_goto(rOne);
		break;
		case 2: roomName = rTwo; 
		room_goto(rTwo);
		break;
		case 3: roomName = rThree; 
		room_goto(rThree);
		break;
		case 4: roomName = rFour; 
		room_goto(rFour);
		break;
		case 0: 
		default: roomName = rZero;
		room_goto(rZero);
		break;
	}
}

room_goto(rStart);