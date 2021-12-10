
function invincible(object){
	//makes it so that it's invincible, add in some other special effects with this code to make it cooler
	object.cantHurt = true;
	object.image_alpha = 0.5;
	object.alarm[0] = room_speed*2;
}
//this function is for all things that take damage
//add in something about triggering hurt animation
function damaging(object){
	if(!object.cantHurt){
		
		if(object.object_index == obj_player){
			if(object.localHealth > 0){
				invincible(object);
			}
			object.localHealth -= 1;
			show_debug_message("Hit Player " + string(object.localHealth));
		}
		
	}
}