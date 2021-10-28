


// timer setup
timer--;

if (timer <= 0) {
	timer = time;


	
repeat (Amount) { 
	var xDiff = irandom_range( -(Range*RainDropWith), (Range*RainDropWith)  );
	   
	   with  instance_create_layer(x + xDiff, y + yDiff,  "Weather", oRainDrop) { 
		    var DelayChoose = irandom_range(0,30);
			
		   delayTimer = DelayChoose }
	
	
	}

	
}


