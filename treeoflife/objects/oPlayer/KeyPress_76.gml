/// @description debug back one level
if (debugger_mode) {
	if global.wave > 0 {
	 	global.wave -= 1;
	
		oController.advanceLevel(global.wave);
	}
}