function HandleDrawMenu(){
	
	if debugger_mode show_debug_message("Handle Draw Menu");
	
	switch(buttonSelected) {
				
		case orderedButtonMenu.close:
			state = PanelDefenderClose;
			break;
					
		case orderedButtonMenu.cactus:
			originInstance.createDefender(oCactus);
			
			swapUpgradeMenu();
			
			break;
					
		case orderedButtonMenu.fern:
			originInstance.createDefender(oFern);
			
			swapUpgradeMenu();
				
			break;
					
		default:
			break;
	}		
}

state = PanelDefenderOpen;
	
function swapUpgradeMenu() {
		
	with(oButton) {
		instance_destroy();
	}
				
	buttonsDrawn = false;
	buttonSelected = upgradeMenu.close;
}