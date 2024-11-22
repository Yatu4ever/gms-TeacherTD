/// @description BasePathRunner Create

event_inherited()

//health

my_target				= undefined;
my_distance				= undefined;
closest_enemy			= undefined;
circle_color			= c_red;

cooldown_timer			= 0;



// saves previous path 
previous_other = undefined;

// Enter next path variable
extra_distance = -1

//allign ourself to map grip
align_to_gird = function(){
	x = MAP_GIRD_SIZE * floor((x + speed)/MAP_GIRD_SIZE) + sprite_xoffset;
	y = MAP_GIRD_SIZE * floor((y + speed)/MAP_GIRD_SIZE) + sprite_yoffset;
}
align_to_gird();

follow_path = function() {
	//self = runner
	//other = path-object mit dem wir konllidiren sind 

	if(previous_other == other)
		return;	
	
	previous_other = other;
	extra_distance = MAP_GIRD_SIZE / 2 + speed;
}
continue_movement = function(){
previous_other.set_direction(self);
}
change_now = function() {
	align_to_gird();
	log($"Self Change now method: {self}")
	continue_movement();
	
}

go_on_cooldown = function(_for){
	alarm_set(0, _for)
}


spawn_new_enemie = function(){
	// log($"Object index: {object_index}");
	instance_create_layer(global.spawn_x, global.spawn_y, layer, Get_PathRunner())
	instance_destroy()
}

get_exam = function() {
    global.exams++;

    if (global.exams >= PASSAGES) { // If the exam limit is not reached
        room_goto(rmStartup) // Create a new instance at the spawn point
		global.exams = 0;
    }else{
		// log($"Object index: {object_index}");
		instance_create_layer(global.spawn_x, global.spawn_y, layer, Get_PathRunner())
	}

    instance_destroy(); // Destroy the current instance regardless
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
// Function to modify health and check for destruction
modify_health = function(damage) {
    base_health += damage; // Reduce health by the damage amount

    // Check if health is 0 or less
    if (base_health <= 0) {
        spawn_new_enemie(); // Call get_exam to handle instance creation or destruction
		
    }
};

draw_exam_status = function() {
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
	draw_set_font(Rundenanzahl)

    var x_pos = display_get_gui_width() / 2;
    var y_pos = 25; // Abstand von oben
    var display_text = string(global.exams) + " von " + string(PASSAGES) + " Runden";
    draw_text(x_pos, y_pos, display_text);
};

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


follow_enemy = function() {
	find_closest_enemy();
	image_angle = my_target != undefined ?
		point_direction(x, y, my_target.x, my_target.y):
		0
	;
}

check_enemy_range = function() {
	find_closest_enemy();
    circle_color = my_distance <= range * MAP_GIRD_SIZE ? c_green : c_red;
	shoot();

}