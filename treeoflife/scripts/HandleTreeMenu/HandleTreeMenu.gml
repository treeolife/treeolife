function HandleTreeMenu(){
	
	if debugger_mode show_debug_message("Handle Tree Menu");
	
		switch(buttonSelected) {
			
			case treeMenu.tree:
				if ((global.wave == 0 || debugger_mode) && not instance_exists(oTree)) {
					originInstance.createDefender(oTree);
					
					with(originInstance.defenderId) {
						scr_play_audio(snd_tree_grow, 100, false);
					}
					
				}
				
				#region Level 0
					if(instance_exists(oTree) && global.wave == 0) {
					
						if (global.timeToLevel != noone)
							global.timeToLevel.start();
					
						if (global.timeToLevel == noone) {
							global.timeToLevel = instance_create_depth(0,0, get_layer_depth(LAYER.ui), oTimer);
						
							global.timeToLevel.setup(
								3, 
								function() {
									global.wave = 1;
									//oCamera.initialised = false;
									TransitionRoom(rOne, "Level 1");
								} , "Next Level", 3, "To Level 1", true);
						
							with(oPlayer) {
								NewTextBox("The Tree of Life invites you to the next stage.", TEXTBOX.forest, ["16:Let's go!","0:Not yet."]);
							};
						}
					}
				#endregion
				
				#region Level 1
				if(instance_exists(oTree) && global.wave == 1) {
					if (global.timeToLevel != noone)
						global.timeToLevel.start();
						
					if (global.timeToLevel == noone) {
						global.timeToLevel = instance_create_depth(0,0, get_layer_depth(LAYER.ui), oTimer);
						
							var	nextLevelCost = { 
							costQuantity: 1,
							cost: oFertiliser,
						};
					
						if(oInventory.playerHasResources(nextLevelCost)) {
						
							oInventory.deductResources(nextLevelCost);
							global.timeToLevel.setup(
								3, 
								function() {
									global.wave = 2;
									//oCamera.initialised = false;
									TransitionRoom(rTwo, "Level 2");
								} , "Next Level", 3, "To Level 2", true);
						
							oTree.sprite_index = sAnimTree1;
						
							with(oTree) {
								hp += 50;
							}
						
							with(oPlayer) {
								NewTextBox("The Tree of Life invites you to the next stage.", TEXTBOX.forest, ["16:Let's go!","0:Not yet."]);
							};
						}
					}
				}
				#endregion
				
				#region Level 2
				if(instance_exists(oTree) && global.wave == 2) {
					if (global.timeToLevel != noone)
						global.timeToLevel.start();
						
					if (global.timeToLevel == noone) {
						global.timeToLevel = instance_create_depth(0,0, get_layer_depth(LAYER.ui), oTimer);
						
							var	nextLevelCost = { 
							costQuantity: 1,
							cost: oFertiliser,
						};
					
						if(oInventory.playerHasResources(nextLevelCost)) {
						
							oInventory.deductResources(nextLevelCost);
							global.timeToLevel.setup(
								3, 
								function() {
									global.wave = 3;
									TransitionRoom(rThree, "Level 3");
								} , "Next Level", 3, "To Level 3", true);
						
							oTree.sprite_index = sAnimTree2;
						
							with(oTree) {
								hp += 50;
							}
						
							with(oPlayer) {
								NewTextBox("The Tree of Life invites you to the next stage.", TEXTBOX.forest, ["16:Let's go!","0:Not yet."]);
							};
						}
					}
				}
				#endregion
				
				#region Level 3
				if(instance_exists(oTree) && global.wave == 3) {
					if (global.timeToLevel != noone)
						global.timeToLevel.start();
						
					if (global.timeToLevel == noone) {
						global.timeToLevel = instance_create_depth(0,0, get_layer_depth(LAYER.ui), oTimer);
						
							var	nextLevelCost = { 
							costQuantity: 1,
							cost: oFertiliser,
						};
					
						if(oInventory.playerHasResources(nextLevelCost)) {
						
							oInventory.deductResources(nextLevelCost);
							global.timeToLevel.setup(
								3, 
								function() {
									global.wave = 4;
									TransitionRoom(rFour, "Final Level");
								} , "Final Level", 3, "Final Level", true);
						
							oTree.sprite_index = sAnimTree3;
						
							with(oTree) {
								hp += 50;
							}
						
							with(oPlayer) {
								NewTextBox("The Tree of Life invites you to the final stage.", TEXTBOX.forest, ["16:Let's go!","0:Not yet."]);
							};
						}
					}
				}
				#endregion
				
				#region Game complete!!
				if(instance_exists(oTree) && global.wave == 4) {
					if (global.timeToLevel != noone)
						global.timeToLevel.start();
						
					if (global.timeToLevel == noone) {
						global.timeToLevel = instance_create_depth(0,0, get_layer_depth(LAYER.ui), oTimer);
					
						var	nextLevelCost = { 
							costQuantity: 1,
							cost: oFertiliser,
						};
					
						if(oInventory.playerHasResources(nextLevelCost)) {
							oInventory.deductResources(nextLevelCost);

							global.timeToLevel.setup(
								0, 
								function() {
									global.wave = 5;
									TransitionRoom(rCredits, "Credits");
								} , "Winner!", 2, "Credits", false);
							
							NewHighlight(sTreeOne,window_get_width()/2,0,100,"Pollution eradicated, Nature has won!",true, true, true);
							NewTextBox("Thank you, Midori. You have saved us from pollution.", TEXTBOX.forest, ["16:"]);
						}
					}
				}
				#endregion
					
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