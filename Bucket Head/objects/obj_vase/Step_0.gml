/// @description Insert description here
// You can write your code in this editor

if(localHealth = 1){
	if(!cracked){
		image_index = 1;
		cracked = true;
	}
}
if(localHealth = 0){
	audio_play_sound(snd_vaseBreak, 10, false);
	instance_destroy(self);
}


