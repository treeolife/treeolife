function HandleUpgradeMenu(){
	
	if debugger_mode show_debug_message("Handle Upgrade Menu");
	
		switch(buttonSelected) {
				
			case upgradeMenu.close:
				state = PanelDefenderClose;
				break;
					
			case upgradeMenu.addHp: {
				
				var	damageUpgradeCost = { 
							costQuantity: 1,
							cost: oWater,
				};
				
				if(oInventory.playerHasResources(damageUpgradeCost)) {
					oInventory.deductResources(damageUpgradeCost);
					originInstance.defenderId.hp_max += 50;
					originInstance.defenderId.hp += 50;
				}

			} break;
					
			case upgradeMenu.addDamage: {
			
				var	damageUpgradeCost = { 
							costQuantity: 1,
							cost: oWater,
				};
					
				if(oInventory.playerHasResources(damageUpgradeCost)) {
					oInventory.deductResources(damageUpgradeCost);
					originInstance.defenderId.damage += 2;
				}

			} break;
					
			default:
				break;
		}
	}
	state = PanelDefenderOpen;