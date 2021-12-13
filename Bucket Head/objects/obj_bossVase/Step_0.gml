/// @description Insert description here
// You can write your code in this editor

if(localHealth = 1){
	if(!cracked){
		image_index = 1;
		cracked = true;
	}
}
if(localHealth <= 0){
	audio_stop_sound(snd_gameMusic);
	instance_create_layer(x,y,"objects", obj_bossGold);
	if(!activateOnce){
		alarm[1] = room_speed*coinNoiseRate;
		alarm[0] = room_speed*4;
		activateOnce = true;
		global.won = true;
		global.win = true;
	}
	obj_player.sprite_index = spr_playerWin
	global.playerStunLock = true;
}


