/// @description Runs 1st

// BGM
scr_play_audio(snd_bgm, 5, true);

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
global.defenders	= ds_map_create();
global.defendersStart = noone;

// Tracking to complete transition only once
global.transitioning = false;
global.splashScreenTimer = 5;

// Tracking levels accessed for replayability
global.wave			= -1;
global.gameStarted	= -1;
global.levelStarted = -1;
global.levelAccessed = {
	start:	-1,
	zero:	-1,
	one	:	-1,
	two	:	-1,
	three:	-1,
	four:	-1,
}
global.roomReplay = false;

global.timeToLevel = noone;

global.oSnapshot = instance_create_depth(0,0,0, oSnapshot);
oSnapshot.persistent = true;

// Tracking firsts
global.firstTime = {
	pickingItem:	-1,
	planting:		-1,
	unlockFern:		-1,
	upgrading:		-1,
	pickingFertiliser: -1,
	droppingFertiliser: -1,
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
global.graphicsSettings = graphics.low;
global.graphicsLayer = "Weather";

// Layers
global.collisionMapName = "Land";

// Info
global.loadingDefault = "Transitioning...";
global.loadingInfo = "Loading...";
global.loadingGeneric = "...";
global.quitMenuInfo = "> Press enter to close this menu. <";

// Instructions
global.howToPlayTitle = "How to play";
global.howToPlayIcon = sSignpost;
global.howToPlayInfo = 
			"Nurture and protect the Tree of Life from pollution monsters.\n\n" +
			"Plant Defender plants so they can fight against pollution monsters. " + 
				"and stop them from approaching the Tree of Life.\n\n" +
			"Collect seeds dropped from the Tree of Life: " + 
				"Seeds give you defenders!\n\n" +
			"Select which type of Defender plant to plant: " + 
				"Each one has a different ability!\n\n" +
			"Nurture them by watering.\n\n" +
			"Collect items dropped by defeated pollution monsters, " + 
				"feed them to the Tree of Life.\n\n" + 
			global.quitMenuInfo;

global.helpTitle = "Help";
global.helpIcon = sSignpost;
global.helpInfo = 
			"Use arrow keys to move.\n" + 
			"Jump with space bar.\n" +
			"Enter to select.\n" + 
			"\"Z\" to interact.\n\n" +
			global.quitMenuInfo;

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

if (debugger_mode) TransitionRoom(ROOM_START, "debug mode...");
else alarm[0] = global.splashScreenTimer * room_speed;

enum tileDistance {
	half = 16,
	one = 32,
	two = 64,
	three = 96,
	four = 128,
	five = 160,
	six = 192,
	seven = 224,
	eight = 256,
	nine = 288,
	ten = 320,
}
