/// @description 

with (other) {
	// other is oEnemy
	self.hp -= other.damage;
	
	if (other.attackDefender) {
		other.attacked = true;
		
		if (self != noone) {
			other.attackedBy = self;
			other.target(self);
		}
		else {
			other.attackedBy = noone;
			other.attacked = false;
		}
			
		//flash = 1;
	
		// release the other (enemy) if self (defender) dies
		if self.hp <= 0 {
			other.attackedBy = noone;
			other.attacked = false;
		}
	}
}
