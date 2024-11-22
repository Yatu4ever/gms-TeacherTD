/// @description all functions BaseBullet

speed = bullet_speed;

check_impact = function(){
	with(BasePathRunner) {
		if(point_in_circle(other.x, other.y,x,y,sprite_width/2)) {
		other.do_damage(self);
		break;
		
	
		}
	}
}

do_damage = function(_to){	
	_to.modify_health(-bullet_damage);
	if(bullet_name == "Kaugummi"){
	slow_down(_to);
	}
	instance_destroy(self);
	
}

slow_down = function(_who){
_who.hspeed = 0;
_who.vspeed = 0;
_who.go_on_cooldown(effect_cooldown);
}
