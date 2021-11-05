/// @description 
if (defenderArea != noone && instance_exists(defenderArea))
	instance_destroy(defenderArea);
	
if (instance_exists(soil)) {
	soil.removeDefender();	
}