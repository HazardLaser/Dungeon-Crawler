if(other.sprite_index != Spr_projectile_death){
	other.disabled = true;
	instance_destroy(self);
}