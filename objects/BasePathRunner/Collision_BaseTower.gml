/// @description event

// Apply damage to the Pathrunner
other.modify_health(-bullet_damage);

// Destroy the bullet after it hits the target 
instance_destroy();
