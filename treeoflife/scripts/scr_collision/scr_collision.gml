/// @function scr_collision();
function scr_collision() {
	//Collision horizontal with object Collision
	if place_meeting(x+speed_h, y, oCollision) {
	    while !place_meeting(x+sign(speed_h), y, oCollision) {
	        x += sign(speed_h);
	    }
	    speed_h = 0;
	}
	x += speed_h;

	// Collision vertical with object Collision
	if place_meeting(x, y+speed_v, oCollision) {
	    while !place_meeting(x, y+sign(speed_v), oCollision) {
	        y += sign(speed_v);
	    }
	    speed_v = 0;
	}
	y += speed_v;
}