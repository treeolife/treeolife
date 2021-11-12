/// @description 

// Inherit the parent event
event_inherited();

if(global.gameLost) {
	global.gamePaused = true;
	oUIPause.pauseGame();
	oUIPause.pauseTitle = "The tree of life has died. Play again?";
}