function HandleTreeMenu(){
	
	if debugger_mode show_debug_message("Handle Tree Menu");
	
		switch(buttonSelected) {
			
			case treeMenu.tree:
				if (global.wave == 0 || debugger_mode)
					originInstance.createDefender(oTree);
				
				// successfully created
				if(instance_exists(oTree) && global.wave == 0) {
					
					if (global.timeToLevel != noone)
						global.timeToLevel.start();
					
					if (global.timeToLevel == noone) {
						global.timeToLevel = instance_create_depth(0,0, get_layer_depth(LAYER.ui), oTimer);
						
						global.timeToLevel.setup(
							3, 
							function() {
								global.wave = 1;
								oCamera.initialised = false;
								TransitionRoom(rOne, "Level 1");
							} , "Next Level", 3, "To Level 1", true);
						
						with(oPlayer) {
							NewTextBox("The Tree of Life invites you to the next stage.", TEXTBOX.forest, ["16:Let's go!","0:Not yet."]);
						};
					}
				}
					
				state = PanelDefenderClose;
				break;
				
			case treeMenu.close:
				state = PanelDefenderClose;
				break;

			default:
				break;
		}
	}
	state = PanelDefenderOpen;