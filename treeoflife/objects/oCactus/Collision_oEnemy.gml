/// @description 

with (other) {
	var pollutionTarget = attackedBy;
	attacked = true;
	if (pollutionTarget == noone) attackedBy = instance_nearest(x,y,oCactus);
	hp -= 2;
}