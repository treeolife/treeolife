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
	switch(wave_number) {
		case 1: roomName = rOne; break;
		case 2: roomName = rTwo; break;
		case 3: roomName = rThree; break;
		case 4: roomName = rFour; break;
		case 0: 
		default: roomName = rZero;
		break;
	}
	room_goto(roomName);
}

room_goto(rStart);