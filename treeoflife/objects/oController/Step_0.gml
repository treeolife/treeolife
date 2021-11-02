/// @description 
var graphics_layer_id = layer_get_id(global.graphicsLayer);
var graphics_layer_exists = layer_exists(global.graphicsLayer);

if(global.graphicsSettings == graphics.high) {
	if graphics_layer_exists
		layer_set_visible(graphics_layer_id, true);
} else 
if(global.graphicsSettings == graphics.low) {
	if graphics_layer_exists
		layer_set_visible(graphics_layer_id, false);
}
