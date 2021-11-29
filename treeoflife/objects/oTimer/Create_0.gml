/// @description 

show = false;
seconds = room_speed;
current_seconds = seconds;
can_countdown = true;
timer_paused = true;
callback = noone;
eventName = "";
postText = "";

bufferSeconds = 0;

startTime = 0;
time = 0;

panelTimer = instance_create_depth(
	0,
	0,
	get_layer_depth(LAYER.ui),
	oUIPanelTimer);

setup = function(_time, _callback, _eventName, _bufferSeconds, _postText, _show) {
	callback = _callback;
	time = _time;
	startTime = _time;
	eventName = _eventName;
	postText = _postText;
	bufferSeconds = _bufferSeconds;
	show = _show;
	
	panelTimer.show = show;
	panelTimer.time = time;
	panelTimer.startTime = startTime;
	panelTimer.eventName = eventName;
}

pause = function() {
	timer_paused = true;
}

start = function() {
	timer_paused = false;
}