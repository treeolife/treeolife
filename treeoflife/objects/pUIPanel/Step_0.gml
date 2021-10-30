/// @description 

if (hover) {
	y = y + sin(timer*frequency) * amplitude;
}

timer++;
sineWave = 0 + (1 + sin(2*pi*current_time/1000 * 0.30)) * 0.8 // 0 - 0.8