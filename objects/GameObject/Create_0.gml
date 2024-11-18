/// @description event
pathRunnerArray = [Koeppl,Musil,Plank,Pock];

function cooldown_ready(){
	return cooldown_timer <= 0;
}

function reset_cooldown(){
cooldown_timer = cooldown_max

// log($"cooldown_timer:{cooldown_timer}")
}

function update_cooldown(){
	if(cooldown_timer > 0){
	cooldown_timer --;
	}
	//log($"GameObject Update_Cooldown: {cooldown_timer}")
}




Get_PathRunner = function(){
	pathRunnerArray_shuffled = array_shuffle(pathRunnerArray)
	log($"{object_get_name(pathRunnerArray_shuffled[0])}");
	return pathRunnerArray_shuffled[0];
}



// Shufflen -> assigenen zur variablen 
// Methoide: Get PathRunner

