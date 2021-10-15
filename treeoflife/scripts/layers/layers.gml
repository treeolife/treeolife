enum LAYER {
	ui,
	shop,
	build,
	lighting,
	effects,
	bullets,
	enemy,
	towers,
	background,
}

function create_layer(layer) {
	layer_create(get_layer_depth(layer), string(layer));
}

function get_layer_depth(layer){
	switch(layer) {
		case LAYER.ui:
			return 10;
		break;
		case LAYER.shop:
			return 20;
		break;
		case LAYER.build:
			return 30;
		break
		case LAYER.lighting:
			return 100;
		break;
		case LAYER.bullets:
			return 250;
		break;
		case LAYER.enemy:
			return 275;
		break;
		case LAYER.effects:
			return 450;
		break;
		case LAYER.background:
			return 900;
		break;
		default:
			return 10;
		break;
	}
}

function move_layer(name, layer) {
	layer_depth(layer_get_id(name), get_layer_depth(layer));
}