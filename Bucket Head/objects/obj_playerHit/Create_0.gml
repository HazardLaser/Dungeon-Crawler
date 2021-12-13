alarm[0] = room_speed*0.2;
global.playerStunLock = true;
if(obj_player.imageRotation == 0){
	for(var i = 0; i < irandom_range(10,20); i++){
		instance_create_layer(x + irandom_range(-8,8), y + irandom_range(-16,16), "player", obj_punchEffect);
	}
}
else{
	for(var i = 0; i < irandom_range(10,20); i++){
		instance_create_layer(x + irandom_range(-16,16), y + irandom_range(-8,8), "player", obj_punchEffect);
	}
}