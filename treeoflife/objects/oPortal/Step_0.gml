/// @description 
if (evenSpawningMode) {
	currentSpawns = totalSpawns;
}

if (oPlayer != noone && currentSpawns > 0 && not global.gamePaused) {
	instance_create_depth((x)+(32*image_xscale), y-80, get_layer_depth(LAYER.enemy), monsterType);
	currentSpawns--;
}

if (evenSpawningMode) {
	for (var i = 0; i < instance_number(monsterType); i++) {
		totalSpawns--;
	}
}

if (currentSpawns <= 0) {
	image_alpha = Approach(image_alpha, 0, 1/(room_speed * 10));
}

if (image_alpha == 0)
	instance_destroy();