/// @description initialise options

enum PAUSE {
	continue_game	= 0,
	help			= 1,
	sound			= 2,
	exit_game		= 3,
}

visible = false;
col_msg = c_white;
selection = 0;

pauseOption[PAUSE.continue_game] = "Continue";
pauseOption[PAUSE.help] = "Help";
pauseOption[PAUSE.sound] = "Sound";
pauseOption[PAUSE.exit_game] = "Exit";

pauseOptionSelected = 0;

hide = function() {
	oUIBar.visible = true;
	visible = false;
}

show = function() {
	selection = 0;
	oUIBar.visible = false;
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

unpauseGame = function() {
	if inFade() return;
	
	if (oPlayer != noone) 
		oPlayer.state = oPlayer.pauseState;
		
	global.gamePaused = false;
	hide();		
}