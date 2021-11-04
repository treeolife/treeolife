/// @description advance level with timer

//oPlayer.startTimer(5);

//if global.wave < 4 {
// 	global.wave += 1;
// };

t = instance_create_depth(0,0, get_layer_depth(LAYER.ui), oTimer);

t.setup(
	3, 
	function() {
		global.wave += 1;
		oController.advanceLevel(global.wave);
	} , "Advancing", 3, "Wave " + string(global.wave + 1) + "...");

t.start();

//i = instance_create_depth(0,0, get_layer_depth(LAYER.ui), oTimer);
//i.setup(3, function() { global.timer.start() }, "Timer start", 0, "");
//i.start();