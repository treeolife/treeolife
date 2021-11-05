/// @description 

for (var i = 0; i < instance_number(oLand); i++) {
	count--;
}

//for (var i = 0; i < instance_number(oAir); i++) {
//	count--;
//}

if (oPlayer != noone && count > 0) {
	instance_create_depth((x)+(32*image_xscale), y-80, get_layer_depth(LAYER.enemy), oLand);
}

//if (oPlayer != noone && count > 0) {
//	instance_create_depth((x)+(32*image_xscale), y-80, get_layer_depth(LAYER.enemy), oAir);
//}