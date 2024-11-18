/// @description event

// Inherit the parent event
event_inherited();

slow = function(){
	log($"Before: {BasePathRunner.SPEED}")
	BasePathRunner.SPEED--;
log($"After: {BasePathRunner.SPEED}")
}
