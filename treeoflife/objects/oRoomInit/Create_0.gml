/// @description Runs 2nd

create_layer(LAYER.defenders);
create_layer(LAYER.enemy);
move_layer("Background", LAYER.background); // move default background layer
instance_create_depth(0, 0, get_layer_depth(LAYER.ui), oUIMaster); // add ui

instance_destroy();