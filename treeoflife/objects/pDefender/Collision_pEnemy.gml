/// @description 

//with (other) { // Other is pDefender
	
//	if (attackable) {
//		attacked = true;
//		attackedBy = other.id;
//		hp = Approach(hp, 0, other.damage); // pDefender is doing damage
//	}
//}

with (other) { // Other is pDefender
	if (other.attackable && not global.gamePaused) {
		other.attacked = true;	
		other.hp = Approach(other.hp, 0, damage);
	}
}
