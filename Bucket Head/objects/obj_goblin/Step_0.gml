if(!disabled){
if(instance_exists(obj_player)){
alert = true;
}
else{
	alert = false
}
#region Health
if(localHealth <= 0){
	//put destruction animation in here
	disabled = true;
	instance_create_layer(x,y,"objects", obj_gold);
}
if(hit){
	stun++;
	if(stun >= room_speed*2){
		hit = false;
		stun = 0;
	}
}
#endregion

#region sprite changing
if(alert){
	
	var difX =  xprevious-x//pos goes left neg goes right
	var difY =  yprevious-y//pos goes up neg goes down
	
	
	if(charge == false and hit == true){
		image_speed = 0;
		image_index = 0;
	}
	else if(charge == false and hit == false){
		image_speed = 3;
		var boyoDirection = point_direction(x,y,obj_player.x,obj_player.y);
		if(boyoDirection <= 45 or boyoDirection >= 315){
			sprite_index = spr_goblinWalkRight;
		}
		if(boyoDirection > 45 and boyoDirection <= 135){
			sprite_index = spr_goblinWalkUp;
		}
		else if(boyoDirection > 135 and boyoDirection <= 225){
			sprite_index = spr_goblinWalkLeft;
		}
		else if(boyoDirection > 225 and boyoDirection < 315){
			sprite_index = spr_goblinWalkDown
		}
	}
	else if(charge == true and hit == false){
		image_speed = 8;
	}

	/*
	if(difX < 0){
		if(abs(difX) > abs(difY)){
			sprite_index = spr_goblinWalkRight;
		}
		else if(abs(difX) < abs(difY)){
			if(difY > 0){
				sprite_index = spr_goblinWalkUp;
			}
			else if(difY < 0){
				sprite_index = spr_goblinWalkDown;
			}
		}
	}
	else if(difX > 0){
		if(abs(difX) > abs(difY)){
			sprite_index = spr_goblinWalkLeft;
		}
		else if(abs(difX) < abs(difY)){
			if(difY > 0){
				sprite_index = spr_goblinWalkUp;
			}
			else if(difY < 0){
				sprite_index = spr_goblinWalkDown;
			}
		}
	}
	else if(difX = 0){
		if(difY > 0){
			sprite_index = spr_goblinWalkUp;
		}
		else if(difY < 0){
			sprite_index = spr_goblinWalkDown;
		}
	}
		*/
}
#endregion

#region AI
if(alert){

//track player
//move to closest x or y coordinate
//charge at player
//when lining up avoid the obsticles.
	if(!obj_player.cantHurt){
		if(!charge and !hit){
			if(x != obj_player.x or y != obj_player.y){
				check_for_player();
			}
		}
		if(place_meeting(x,y,obj_player)){
			damaging(obj_player)
			hit= true;
			charge = false;
			audio_stop_sound(snd_goblinCharge);
			audio_play_sound(snd_goblinHit,10,false);
			
		}	
		if(!hit){
			if(!charge){
				if(x >= obj_player.x -8 and x <= obj_player.x + 8){
					path_end();
					show_debug_message("chase");
					charge = true;
					playerDif = obj_player.y - y;
					directional = false;
					audio_play_sound(snd_goblinCharge, 10, false);
				}
				else if(y >= obj_player.y -8 and y <= obj_player.y + 8){
					path_end();
					show_debug_message("chase");
					charge = true;
					playerDif = obj_player.x - x;
					directional = true;
					audio_play_sound(snd_goblinCharge, 10, false);
				}
				else{
					charge = false;
				}
			}
			else if(charge){
				if(!directional){
					if(playerDif > 0){
						if(place_free(x, y + (movementSpeed * 2))){
							y+= (movementSpeed * 2);
						}
						else{
							hit = true;
							charge = false;
							audio_stop_sound(snd_goblinCharge);
							audio_play_sound(snd_goblinHit,10,false);
						}
					}
					else if(playerDif < 0){
						if(place_free(x, y - (movementSpeed * 2))){
							y-= (movementSpeed * 2);
						}
						else{
							hit = true;
							charge = false;
							audio_stop_sound(snd_goblinCharge);
							audio_play_sound(snd_goblinHit,10,false);
						}
					}
				}
				else if(directional){
					if(playerDif >  0){
						if(place_free(x  + (movementSpeed * 2), y)){
							x+= (movementSpeed * 2);
						}
						else{
							hit = true;
							charge = false;
							audio_stop_sound(snd_goblinCharge);
							audio_play_sound(snd_goblinHit,10,false);
						}
					}
					else if(playerDif < 0){
						if(place_free(x  - (movementSpeed * 2), y)){
							x-= (movementSpeed * 2);
						}
						else{
							hit = true;
							charge = false;
							audio_stop_sound(snd_goblinCharge);
							audio_play_sound(snd_goblinHit,10,false);
						}
					}
				}
			}
		}
		
	}
}
else{
}
#endregion
}
else{
	if(!disabledOnce){
		path_end();
		audio_play_sound(snd_goblinDeath, 10, false);
		sprite_index = spr_goblinDeath;
		alarm[0] = room_speed*0.5;
		disabledOnce = true;
	}
}