/// @description event

// Array with the global varibales from path
definedDirections = [4];

if(!exit_n && !exit_e && !exit_s && !exit_w){
	 var errormsg= $"Fehler in MapField auf {(x/64)}/{(y/64)} {(sprite_width/64)}*{(sprite_height/64)}";
	 if(DEV_CONFIG){
		show_message(errormsg)
		game_end();
	 }
	else{
		show_debug_message(errormsg);
	}	
}

// Moving he Path Runner along the path
set_direction = function(_who){

// log("entered set direction method");

i = 0;
if(exit_n){definedDirections[i] = "exit_n"; i++}
if(exit_s){definedDirections[i] = "exit_s"; i++}
if(exit_e){definedDirections[i] = "exit_e"; i++}
if(exit_w){definedDirections[i] = "exit_w"; i++}


	definedDirections_shuffled = array_shuffle(definedDirections)

	if(definedDirections_shuffled[0] == "exit_n")
	{
		log($"{BasePathRunner.SPEED} in the direction {definedDirections_shuffled[0]}")
			_who.hspeed = 0;
			_who.vspeed = -BasePathRunner.SPEED;
	} else if (definedDirections_shuffled[0] == "exit_s"){
		log($"{BasePathRunner.SPEED} in the direction {definedDirections_shuffled[0]}")
			_who.hspeed = 0;
			_who.vspeed = BasePathRunner.SPEED;
	}else if (definedDirections_shuffled[0] == "exit_e") {
		log($"{BasePathRunner.SPEED} in the direction {definedDirections_shuffled[0]}")
			_who.hspeed = BasePathRunner.SPEED;
			_who.vspeed = 0;
	} else if (definedDirections_shuffled[0] == "exit_w"){
		log($"{BasePathRunner.SPEED} in the direction {definedDirections_shuffled[0]}")
			_who.hspeed = -BasePathRunner.SPEED;
			_who.vspeed = 0;
	} else {
		show_debug_message("**ERROR NO DIRETICON**")
			_who.hspeed = 0;
			_who.vspeed = 0;
	}
}

