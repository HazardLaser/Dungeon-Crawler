//heatlh
if(localHealth <= 0){
	//put destruction animation in here
	instance_destroy(self);
	instance_create_layer(x,y,"objects", obj_gold);
}
if(hit){
	stun++;
	if(stun >= room_speed*2){
		hit = false;
		stun = 0;
	}
}
if(instance_exists(obj_player)){
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