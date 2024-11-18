base_health = base_health - BaseBullet.bullet_damage
instance_destroy(other)
if (base_health <= 0) {
	instance_create_layer(EnterField.x, EnterField.y, layer, Musil);
	instance_destroy(self)
	instance_destroy(other)
}
log(base_health);

if (other.object_index == Kaugummi) {
	
}