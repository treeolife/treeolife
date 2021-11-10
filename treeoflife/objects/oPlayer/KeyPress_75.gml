/// @description debug advance level with timer

if (debugger_mode) {
	t = instance_create_depth(0,0, get_layer_depth(LAYER.ui), oTimer);

	t.setup(
		3, 
		function() {
			global.wave += 1;
			oController.advanceLevel(global.wave);
		} , "Advancing", 3, "Wave " + string(global.wave + 1) + "...", true);

	t.start();
}