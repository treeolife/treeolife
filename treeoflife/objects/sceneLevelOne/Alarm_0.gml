/// @description 
	
if (global.levelAccessed.two == -1) {
	if global.timeToLevel == noone
		global.timeToLevel = instance_create_depth(0,0, get_layer_depth(LAYER.ui), oTimer);
		
	global.timeToLevel.setup(
		30, 
		function() {
			global.levelStarted = 1;
		} , "Plant!", 3, "Incoming!", true
	);	
	
	NewTextBox(
		"The round begins in 30 seconds.\n" +
		"Plan to defend TWO sides.\n" +
		"Plant your defenders!"
		, TEXTBOX.forest, ["16:"]);
		//, TEXTBOX.forest, ["13:"]);
}