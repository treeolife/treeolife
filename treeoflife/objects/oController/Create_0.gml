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

advanceLevel = function(wave) {
	var roomName;
	var wave_number = real(wave);
	//show_debug_message("wave " + string(global.wave));
	//show_debug_message("wave num " + string(wave_number));
	switch(wave_number) {
		case 1: roomName = rOne; 
		room_goto(rOne);
		oCamera.initialised = false;
		break;
		case 2: roomName = rTwo; 
		room_goto(rTwo);
		oCamera.initialised = false;
		break;
		case 3: roomName = rThree; 
		room_goto(rThree);
		oCamera.initialised = false;
		break;
		case 4: roomName = rFour; 
		room_goto(rFour);
		oCamera.initialised = false;
		break;
		case 0: 
		default: roomName = rZero;
		room_goto(rZero);
		oCamera.initialised = false;
		break;
	}
}

room_goto(rStart);