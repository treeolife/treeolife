 /// @description 
	
if (global.levelAccessed.three == -1) {
	if global.timeToLevel == noone
		global.timeToLevel = instance_create_depth(0,0, get_layer_depth(LAYER.ui), oTimer);
		
	global.timeToLevel.setup(
	    30, 
		function() {
			global.levelStarted = 1;
		} , "Plant!", 3, "Incoming!", true
	);	
	
	NewTextBox(
		"Air pollution moves swiftly and does not stop at defenders.\n" +
		"The round begins in 30 seconds.\n" +
		"Plant your defenders!"
		, TEXTBOX.forest, ["16:"]);
		//, TEXTBOX.forest, ["13:"]);
}