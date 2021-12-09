show_debug_message(x);
show_debug_message(y);

#region Movement
if(!global.playerStunLock){
	/*move_right=(keyboard_check(vk_right));
	move_left=(keyboard_check(vk_left));
	move_up=(keyboard_check(vk_up));
	move_down=(keyboard_check(vk_down));

	xped=(move_right-move_left) * playerSpeed;
	ysped=(move_down-move_up) * playerSpeed;


	x+=xped;
	y+=ysped;


	if (move_right){
		sprite_index = spr_playerWalk;
		image_xscale=1;
		directionFacing = 0;
	}
	else if (move_left){
		sprite_index = spr_playerWalk;
		image_xscale=-1;
		directionFacing = 1;
	}
	else if (move_up){
		sprite_index = spr_playerWalk;
	}
	else if (move_down){
		sprite_index = spr_playerWalk;
	}
	else {
		sprite_index= spr_playerIdle;
	}*/
	if(keyboard_check(vk_right) && place_free(x + collisionSpeed, y)){
		x+=playerSpeed;
		image_speed = playerSpeed;
		sprite_index = spr_playerWalkRight;
		directionFacing = 0;
	}
	if(keyboard_check(vk_left) && place_free(x - collisionSpeed, y)){
		x-=playerSpeed;
		image_speed = playerSpeed;
		sprite_index = spr_playerWalkLeft;
		directionFacing = 1;
	}
	if(keyboard_check(vk_up) && place_free(x, y - collisionSpeed)){
		y-=playerSpeed;
		image_speed = playerSpeed;
		//sprite change up
	}
	if(keyboard_check(vk_down) && place_free(x, y + collisionSpeed)){
		y+=playerSpeed;
		image_speed = playerSpeed;
		//sprite change down
	}
	if(keyboard_check(vk_nokey)){
		image_speed = 0;
		image_index = 0;
		if(directionFacing == 0){
			sprite_index = spr_playerWalkRight;	
		}
		if(directionFacing == 1){
			sprite_index = spr_playerWalkLeft;	
		}
	}
}
#endregion

#region Punch Attack
if(keyboard_check_pressed(ord("Z"))){
	leftRightArm = !leftRightArm;
	if(directionFacing == 0){
		var punchX = (sprite_width * 0.8) 
	}
	else if(directionFacing == 1){
		var punchX = (sprite_width * -0.8) 
	}
	if(directionFacing == 0){
		
		if(leftRightArm){
			sprite_index = spr_playerFaceRightHitRight;
		}
		else{
			sprite_index = spr_playerFaceRightHitLeft;
		}
	}
	else if(directionFacing == 1){
		if(leftRightArm){
			sprite_index = spr_playerFaceLeftHitRight;
		}
		else{
			sprite_index = spr_playerFaceLeftHitLeft;
		}
	}
	audio_play_sound(punchSound[irandom(array_length(punchSound)-1)], 10, 0);
	instance_create_layer(x + punchX, y, "player",obj_playerHit);
}
#endregion