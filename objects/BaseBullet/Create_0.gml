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
	instance_destroy(self);
	
}