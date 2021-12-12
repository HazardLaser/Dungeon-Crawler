if(!disabled){
	if(instance_exists(obj_player)){
		var distance = distance_to_object(obj_player);
		var tx = x + lengthdir_x(speed, direction);
		var ty = y + lengthdir_y(speed, direction);
	
		if(distance > playerRangeMax){
			check_for_player()
		}
		else if(distance < playerRangeMin and place_free(tx, ty)){
			path_end();
			direction = point_direction(x,y,obj_player.x, obj_player.y) + 180;;
			speed = movementSpeed
		}
		else{
			path_end();
			speed = 0;
		}
		//if player in same room
		counter++;
		if(counter >= room_speed*ballRate){
			audio_play_sound(snd_gooBoyAttack, 10, false);
			instance_create_layer(x,y,"enemyProjectiles",obj_gooBall);
			counter = 0;
			ballRate = irandom_range(4,6);
		}

		//health
		if(localHealth <= 0){
			//put destruction animation in here
			disabled = true;
			instance_create_layer(x,y,"enemies",obj_gold);
		}
	}
}
else{
	if(!disabledOnce){
		path_end();
		audio_play_sound(snd_gooBoyDeath, 10, false);
		speed = 0;
		sprite_index = spr_punchFaceDeath;
		alarm[1] = room_speed*0.5;
		disabledOnce = true;
	}
}