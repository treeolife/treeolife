/// @description 

visible = false;

healthbar_width = 32;
healthbar_height = 8;

friendly = true;

xx = 0;
yy = 0;

hp = 0;
hp_max = 1;
flash = 0;

function update(_xx, _yy, _hp, _hp_max, _flash, _friendly) {
	xx = _xx; 
	yy = _yy;
	hp = _hp;
	hp_max = _hp_max;
	flash = _flash;
	friendly = _friendly;
}