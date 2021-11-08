/// @description 

if (instance_exists(panelTimer) && panelTimer != noone)
	panelTimer.selfDestruct();
	
if (instance_exists(global.timeToLevel))
	global.timeToLevel = noone;