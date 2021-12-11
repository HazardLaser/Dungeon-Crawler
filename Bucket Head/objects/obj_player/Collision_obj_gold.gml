if(!other.animation){
	instance_destroy(other);
	global.money+=5;
	audio_play_sound(snd_coin, 10, false);
}