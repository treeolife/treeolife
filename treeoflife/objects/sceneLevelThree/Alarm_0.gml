 /// @description 
	
if (global.levelAccessed.four == -1) {
	if global.timeToLevel == noone
		global.timeToLevel = instance_create_depth(0,0, get_layer_depth(LAYER.ui), oTimer);
		
	global.timeToLevel.setup(
	    60, 
		function() {
			global.levelStarted = 1;
		} , "Plant!", 3, "Incoming!", true
	);	
	
	NewTextBox(
		"The field has expanded, both land and air monsters are coming.\n" +
		"The round begins in 60 seconds.\n" +
		"Plant your defenders!"
		, TEXTBOX.forest, ["16:"]);
}