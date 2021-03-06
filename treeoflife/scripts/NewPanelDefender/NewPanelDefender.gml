function NewPanelDefender(id) {
	if (id == undefined) exit;
	if (!instance_exists(id)) exit;
	
	// 1. Create defender panel
	// 2. Apply attributes
	// 3. Check for origin
	// 4. State machine
	
	if (global.firstTime.unlockFern == -1 && global.wave > 1) {
		NewHighlight(sFernIdle,window_get_width()/2,0,100,"Unlocked Fern Defender, with ranged attacks, they are very effective against air!",true, true, true);
		global.firstTime.unlockFern = 1;
	}
	
	panelState = global.panelState;
	defenderPanel = noone;
	if instance_exists(oUIPanelRight) {
		defenderPanel = oUIPanelRight;
	} else {
		defenderPanel = 
			instance_create_depth(
				0,
				0,
				get_layer_depth(LAYER.ui), 
				oUIPanelRight);
		defenderPanel.panelTitle = "Plant the seed";
	}
	
	with(defenderPanel) {
		
		// Set origin, useful to determine state // Soil
		originInstance = id;
		
		if (debugger_mode)
			show_debug_message("origin: " 
			+ string(
				object_get_name(
					originInstance.object_index)));
		
		// For defender
		//if (originInstance.object_index == oSoil) {
		//	global.panelState.defender = OpenPanel;
		//}
		
		//// For tree
		//if (originInstance.object_index == oPlayer) {
		//	global.panelState.defender = ClosePanel;
		//}
		
		//if (keyboard_check_pressed(vk_down)) {
		//	show_debug_message("down!");
		//}
	}
	
	//script_execute(global.panelState.defender);
	
}

function OpenPanel() {
	defenderPanel.visible = true;
	
	if (keyboard_check_pressed(vk_down)) {
		show_debug_message("down!");
		global.panelState.defender = ClosePanel;
	}
}

function ClosePanel() {
	instance_destroy(oUIPanelRight);
}