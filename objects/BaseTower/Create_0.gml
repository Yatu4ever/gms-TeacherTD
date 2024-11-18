/// @description  all functions BaseTower

// Inherite Cooldown from GameObject
event_inherited()

// Base variables

// TODO: ChildTower -> bullet_type = Kaugummi/ Lineal/ PapierKugel
closest_distance		= 100000000;
my_target				= undefined;
my_distance				= undefined;
closest_enemy			= undefined;
circle_color			= c_red;

cooldown_timer			= 0; 


// Move Sprite Towards Pathrunner
follow_enemy = function() {
	find_closest_enemy();
	image_angle = my_target != undefined ?
		point_direction(x, y, my_target.x, my_target.y):
		0
	;
}

shoot = function() {
	
	if(!bullet_type){
		return;
	}
	// shoot_cooldown % cooldown == 0 
	if(my_target != undefined && my_distance <= range * MAP_GIRD_SIZE && cooldown_ready()){
		instance_create_layer(x,y,"Shoots", bullet_type, {
			direction: image_angle
		})
		reset_cooldown();
	}
	// shoot_cooldown++;
}

// Locate Closest Enemy and save Data in Variables
find_closest_enemy = function(){
	var closest_enemy		= undefined;
	var closest_distance	= 100000;
	var dist;
	
	with(BasePathRunner) {
		dist = point_distance(other.x, other.y,x,y);
		if (dist < closest_distance){
			closest_distance = dist;
			closest_enemy = self;
		}
	}	
	
	my_target = closest_enemy;
	my_distance = closest_distance;
}

// If Enemy in Our Range turn Green instead Red
check_enemy_range = function() {
	find_closest_enemy();
    circle_color = my_distance <= range * MAP_GIRD_SIZE ? c_green : c_red;
	shoot();

}

// Draw Circle around Tower
draw_range_circle = function() {
	draw_set_alpha(0.3);
	draw_set_color(circle_color);
	
	draw_circle(x  , y , range * MAP_GIRD_SIZE, false); // Center the circle
	
	draw_set_alpha(1);
	draw_set_color(c_white);
}




