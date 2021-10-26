/// @description 

if global.wave < 4 {
	global.wave += 1;
	oController.advanceLevel(global.wave);
	//oPlayer.startTimer(30);
	oCamera.initialised = false;
}