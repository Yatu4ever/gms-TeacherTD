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


// Function to modify health and check for destruction
modify_health_tower = function(damage) {
    base_health += damage; // Reduce health by the damage amount

    // Check if health is 0 or less
    if (base_health <= 0) {
        instance_destroy()
		
    }
};

draw_health_bar = function() {
    // Fixed health bar width and height
    var bar_width = 140; 
    var bar_height = 14;

    // Calculate health bar position
    var bar_x = x + sprite_width / 2 - bar_width / 2; // Center the bar horizontally
    var bar_y = y - sprite_height / 2 - 6; // Position it slightly above the entity

    // Calculate the health percentage
    var health_percent = base_health / max_health;

    // Draw the background (gray bar)
    draw_set_color(c_gray);
    draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

    // Draw the current health (green bar)
    draw_set_color(c_lime);
    draw_rectangle(bar_x, bar_y, bar_x + bar_width * health_percent, bar_y + bar_height, false);

    // Draw the health points as text within the bar (e.g., "809 / 1200")
    draw_set_font(font_small); // Use a small font
    draw_set_color(c_black);  // Set text color to black
    draw_set_halign(fa_center); // Center the text horizontally
    draw_set_valign(fa_middle); // Center the text vertically
    draw_text(bar_x + bar_width / 2, bar_y + bar_height / 2, string(base_health) + " / " + string(max_health));

    // Reset the drawing color
    draw_set_color(c_white);
};




