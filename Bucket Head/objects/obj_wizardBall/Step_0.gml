if(instance_exists(obj_player)){
	alert = true;
}
else{
	alert = false;
}
	
if(!disabled){
	if(alert){
		check_for_player();
	}
	else{
		path_end();
	}
}
else{
	if(!disabledOnce){
		path_end();
		sprite_index = Spr_projectile_death;
		alarm[1] = room_speed*0.5;
		disabledOnce = true;
	}
}