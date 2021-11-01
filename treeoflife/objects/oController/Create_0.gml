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
global.transitioning = false;

global.levelAccessed = {
	zero:	-1,
	one	:	-1,
	two	:	-1,
	three:	-1,
	four:	-1,
}

// UI state machine
global.panelState = {
	defender:	-1,
	highlight:	-1,
	middle:		-1,
	timer:	-1,
}

// Layers
global.collisionMapName = "Land";

global.howToPlayTitle = "How to play";
global.howToPlayInfo = 
			"Nurture and protect the Tree of Life from pollution monsters.\n\n" +
			"Plant Defender plants so they can fight against pollution monsters. " + 
				"and stop them from approaching the Tree of Life.\n\n" +
			"A) Collect seeds dropped from the Tree of Life -> " + 
				"seeds give you defenders.\n" +
			"B) Select which type of Defender plant to plant -> " + 
				"each one has a different ability!\n" +
			"C) Nurture them by watering.\n" +
			"D) Collect items dropped by defeated pollution monsters, " + 
				"feed them to the Tree of Life.";

global.helpTitle = "Help";
global.helpInfo = 
			"1. Use arrow keys to move.\n" + 
			"2. Jump with space bar.\n" +
			"3. Enter to select, Esc to escape menu.\n" + 
			"4. Interact with items with \"Z\".";

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

	oCamera.initialised = false;
	global.transitioning = true;
	
	if (global.transitioning)
		switch(wave) {
		
			case 1: roomName = rOne; 
			room_goto(roomName);
			break;
			
			case 2: roomName = rTwo; 
			room_goto(roomName);
			break;
			
			case 3: roomName = rThree; 
			room_goto(roomName);
			break;
			
			case 4: roomName = rFour; 
			room_goto(roomName);
			break;
			
			case 0: 
			default: roomName = rZero;
			room_goto(roomName);
			break;
		
		}
}

room_goto(rStart);