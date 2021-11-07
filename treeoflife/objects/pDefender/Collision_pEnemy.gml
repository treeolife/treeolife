/// @description 

with (other) { // Other is pDefender
	
	if (attackable) {
		attacked = true;
		attackedBy = other.id;
		hp -= other.damage; // pDefender is doing damage
	}
}
