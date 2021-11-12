function HandleUpgradeMenu(){
	
	if debugger_mode show_debug_message("Handle Upgrade Menu");
	
		switch(buttonSelected) {
				
			case upgradeMenu.close:
				state = PanelDefenderClose;
				break;
					
			case upgradeMenu.heal: {
				
				var	damageUpgradeCost = { 
							costQuantity: 2,
							cost: oWater,
				};
				
				if(oInventory.playerHasResources(damageUpgradeCost)) {
					oInventory.deductResources(damageUpgradeCost);

					originInstance.defenderId.hp += 
						Approach(
							originInstance.defenderId.hp, 
							originInstance.defenderId.hp_max, 
							20);
				}

			} break;
					
			case upgradeMenu.addHp: {
				
				var	damageUpgradeCost = { 
							costQuantity: 10,
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
							costQuantity: 5,
							cost: oWater,
				};
					
				if(oInventory.playerHasResources(damageUpgradeCost)) {
					oInventory.deductResources(damageUpgradeCost);
					originInstance.defenderId.damage += 1;
				}

			} break;
					
			default:
				break;
		}
	}
	state = PanelDefenderOpen;