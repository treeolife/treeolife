/// @description 

with (other) {
	var pollutionTarget = attackedBy;
	attacked = true;
	
	me = instance_nearest(x,y,oCactus);
	if (pollutionTarget == noone) attackedBy = me;
	//flash = 1;
	hp -= other.damage;
	
	// release the pollution if cactus dies
	if me.hp == 0 {
		attackedBy = noone;
		attacked = false;
	}
}
