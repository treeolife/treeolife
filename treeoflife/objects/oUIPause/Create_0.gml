/// @description initialise options

enum PAUSE {
	continue_game	= 0,
	replay			= 1,
	help			= 2,
	graphics		= 3,
	exit_game		= 4,
}

visible = false;
col_msg = c_white;
selection = 0;

pauseTitle = "Paused";

pauseOption[PAUSE.continue_game] = "Continue";
pauseOption[PAUSE.replay] = "Replay";
pauseOption[PAUSE.help] = "Help";
pauseOption[PAUSE.graphics] = "Graphics";
pauseOption[PAUSE.exit_game] = "Back to Main Menu";

pauseOptionSelected = 0;

hide = function() {
	oUIHud.visible = true;
	visible = false;
}

show = function() {
	selection = 0;
	oUIHud.visible = false;
	visible = true;
}

isOpen = function() {
	return visible;
 }
 
inFade = function() {
	return instance_exists(fadeIn) || 
			instance_exists(fadeOut);
}
 
pauseGame = function() {
	if inFade() return;
	
	if (oPlayer != noone) 
		oPlayer.pauseState = oPlayer.state;
	
	global.gamePaused = true;
	show();
}

function checkHelpMenu() {
	if(instance_exists(oUIPanelMiddle))
		instance_destroy(oUIPanelMiddle);
}

unpauseGame = function() {
	if inFade() return;
	
	if (oPlayer != noone) 
		oPlayer.state = oPlayer.pauseState;
	
	checkHelpMenu();
		
	global.gamePaused = false;
	hide();		
}