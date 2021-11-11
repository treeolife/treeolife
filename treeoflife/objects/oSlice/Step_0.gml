/// @description 
//if (target_to_hit == noone) exit;
if (not instance_exists(target_to_hit) && animation_end()) {
	instance_destroy();
}

if (not instance_exists(target_to_hit)) {
	exit;
}

//if (target_to_hit != noone && distance_start == 0) {
//	distance_start = sign(x - target_to_hit.x) * (x - target_to_hit.x);
//}

if (hasHit) {
	timeToDestroy++;
}

if (timeToDestroy > 2 * room_speed) {
	instance_destroy();	
}

//distance_travelled = sign(x - xstart) * (x - xstart);
//distance_current = distance_start - distance_travelled;

image_angle = point_direction(x, y, target_to_hit.x, target_to_hit.y) + random_range(-3,3);


////image_index = floor((distance_current/distance_start) * image_number);

x += (target_to_hit.x - x) / room_speed;
y += (target_to_hit.y - y) / room_speed;