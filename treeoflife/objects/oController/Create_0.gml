/// @description Runs 1st

// Stores global variables
global.water_amount = 100;
global.cost			= 0;
global.timer		= 30;
global.pausedTimer	= false;
global.currentTime	= 0;
global.gamePaused	= false;
global.textSpeed	= 0.75;
global.Dialog		= false;
global.inventory	= ds_list_create();
global.inventoryStart = noone;

// Tracking to complete transition only once
global.transitioning = false;

// Tracking levels accessed for replayability
global.wave			= -1;
global.gameStarted	= -1;
global.levelAccessed = {
	start:	-1,
	zero:	-1,
	one	:	-1,
	two	:	-1,
	three:	-1,
	four:	-1,
}

// Tracking firsts
global.firstTime = {
	pickingItem:	-1,
	planting:		-1,
	upgrading:		-1,
}

// UI panel state machine
global.panelState = {
	defender:	-1,
	highlight:	-1,
	middle:		-1,
	timer:	-1,
}

// Graphics
enum graphics {
	low,
	high
}
global.graphicsSettings = graphics.high;
global.graphicsLayer = "Weather";

// Layers
global.collisionMapName = "Land";

// Info
global.loadingDefault = "Transitioning...";
global.loadingInfo = "Loading...";
global.loadingGeneric = "...";

// Instructions
global.howToPlayTitle = "How to play";
global.howToPlayIcon = sSignpost;
global.howToPlayInfo = 
			"Nurture and protect the Tree of Life from pollution monsters.\n\n" +
			"Plant Defender plants so they can fight against pollution monsters. " + 
				"and stop them from approaching the Tree of Life.\n\n" +
			"A) Collect seeds dropped from the Tree of Life: " + 
				"Seeds give you defenders!\n\n" +
			"B) Select which type of Defender plant to plant: " + 
				"Each one has a different ability!\n\n" +
			"C) Nurture them by watering.\n\n" +
			"D) Collect items dropped by defeated pollution monsters, " + 
				"feed them to the Tree of Life.";
global.helpTitle = "Help";
global.helpIcon = sSignpost;
global.helpInfo = 
			"1. Use arrow keys to move.\n" + 
			"2. Jump with space bar.\n" +
			"3. Enter to select.\n" + 
			"4. Interact with items with \"Z\".\n\n" +
			"Esc to pause.\n" +
			"Graphics settings are at pause menu.";

/// Everything below are for Room states ///

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

alarm[0] = 3 * room_speed;