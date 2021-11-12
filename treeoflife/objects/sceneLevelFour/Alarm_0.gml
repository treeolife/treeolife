 /// @description 
	
if (global.levelAccessed.five == -1) {
	if global.timeToLevel == noone
		global.timeToLevel = instance_create_depth(0,0, get_layer_depth(LAYER.ui), oTimer);
		
	global.timeToLevel.setup(
	    60, 
		function() {
			global.levelStarted = 1;
		} , "Defend!", 3, "Incoming!", true
	);	
	
	NewTextBox(
		"The pollution monsters take their last stand, gaining immense numbers.\n" +
		"The round begins in 60 seconds.\n" +
		"Hold the fort for one last time!"
		, TEXTBOX.forest, ["16:"]);
}