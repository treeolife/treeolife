/// @description 

with (other) { // Other is oSlice
	
	if (attackable) {
		attacked = true;
		attackedBy = other.id;
		hp = Approach(hp, 0, other.damage); // oSlice is doing damage
		
		other.hasHit = true;
	}
}
