/// @description 

if (global.wave == 1) {
	oTree.sprite_index = sTreeOne;
}

if (global.wave == 2) {
	oTree.sprite_index = sTreeTwo;
}

if (global.wave == 3) {
	oTree.sprite_index = sTreeTree;
}

if (global.wave == 4) {
	oTree.sprite_index = sTreeFour;
}

if (instance_exists(soil))
	ystart = soil.y;