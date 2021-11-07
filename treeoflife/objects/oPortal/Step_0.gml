/// @description 

//for (var i = 0; i < instance_number(oLand); i++) {
//	count--;
//}

//for (var i = 0; i < instance_number(oAir); i++) {
//	count--;
//}

currentSpawns = totalSpawns;

if (oPlayer != noone && currentSpawns > 0) {
	instance_create_depth((x)+(32*image_xscale), y-80, get_layer_depth(LAYER.enemy), monsterType);
	currentSpawns--;
}

for (var i = 0; i < instance_number(monsterType); i++) {
	totalSpawns--;
}

//if (oPlayer != noone && count > 0) {
//	instance_create_depth((x)+(32*image_xscale), y-80, get_layer_depth(LAYER.enemy), oAir);
//}