/// @description check exrta distance
event_inherited()

// Stops after extra distance has been walked
if (extra_distance > 0){
	extra_distance -= BasePathRunner.SPEED
	
	if (extra_distance <= 0){
		extra_distance = -1;
		change_now();
	
	}
}

global.x = x;
global.y = y;




