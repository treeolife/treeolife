/// @description room initialisation

// initalize layers
create_layer(LAYER.lighting);
create_layer(LAYER.effects);
create_layer(LAYER.bullets);
create_layer(LAYER.towers);
create_layer(LAYER.enemy);

// move background layer deeper
move_layer("Background", LAYER.background);

// add ui
instance_create_depth(0, 0, get_layer_depth(LAYER.ui), oUIMaster);

// add mouse

// add lighting

// remove self
instance_destroy();