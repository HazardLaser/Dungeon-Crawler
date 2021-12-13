if(disabled){
	if(!disabledOnce){
		audio_play_sound(snd_splat,5,false);
		speed = 0;
		sprite_index = spr_gooDeath;
		alarm[1] = room_speed*0.5;
		disabledOnce = true;
	}
}