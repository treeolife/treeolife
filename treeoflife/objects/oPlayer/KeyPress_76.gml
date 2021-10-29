/// @description back one level

if global.wave > 0 {
 	global.wave -= 1;
	
	oController.advanceLevel(global.wave);
 }