/// @function scr_collision();
function scr_collision() {
	var collidedH = false;
	var collidedV = false;
	
	//Collision horizontal with object Collision
	if place_meeting(x+speed_h, y, oCollision) {
	    while !place_meeting(x+sign(speed_h), y, oCollision) {
	        x += sign(speed_h);
	    }
	    speed_h = 0;
		collidedH = true;
	}
	x += speed_h;

	// Collision vertical with object Collision
	if place_meeting(x, y+speed_v, oCollision) {
	    while !place_meeting(x, y+sign(speed_v), oCollision) {
	        y += sign(speed_v);
	    }
	    speed_v = 0;
		collidedV = true;
	}
	y += speed_v;
	
	return collidedH;
}