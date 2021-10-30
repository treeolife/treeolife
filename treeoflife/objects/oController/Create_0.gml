/// @description Runs 1st

// stores global variables
global.water_amount = 100;
global.seed_amount	= 1;
global.wave			= -1;
global.cost			= 0;
global.timer		= 30;
global.pausedTimer	= false;
global.currentTime	= 0;
global.gamePaused	= false;
global.textSpeed	= 0.75;
global.Dialog		= false;
global.max_water_amount = 10;
global.inventory	= ds_list_create();
global.gameStarted	= -1;

// layers
global.collisionMapName = "Land";

getLevelRoom = function() {
	
	switch (global.wave) {
		default:
		case 0:
			return rZero;
		case 1:
			return rOne;
		case 2:
			return rTwo;
		case 3:
			return rThree;
		case 4:
			return rFour;
	}
}

advanceLevel = function(wave) {
	var roomName;
	var wave_number = real(wave);
	
	oCamera.initialised = false;
	
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