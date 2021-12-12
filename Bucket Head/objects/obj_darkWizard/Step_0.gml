if(!disabled){

if(instance_exists(obj_player)){
	alert = true;
}
else{
	alert = false;
}

#region Health
if(localHealth <= 0){
	//put destruction animation in here
	disabled = true;
	instance_create_layer(x,y,"objects", obj_gold);
}
#endregion

#region Attack
if(alert){
	if(attack == false){
		counter++;
	}
	if(counter >= room_speed*3){
		counter = 0;
		alarm[0] = room_speed*1;
		attack = true;
		sprite_index = spr_darkWizardPreCast;
	}
}
#endregion
}
else{
	if(!disabledOnce){
		audio_play_sound(snd_wizardDeath,10,false);
		sprite_index = spr_darkWizardDeath;
		alarm[2] = room_speed*0.5;
		disabledOnce = true;
	}
}