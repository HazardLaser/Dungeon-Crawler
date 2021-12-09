show_debug_message(x);
show_debug_message(y);

#region Movement
if(!global.playerStunLock){
	move_right=(keyboard_check(vk_right));
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
	}
}
#endregion

#region Attack
if(keyboard_check_pressed(ord("Z"))){
	leftRightArm = !leftRightArm;
	if(directionFacing == 0){
		var punchX = (sprite_width * 0.8) 
	}
	else if(directionFacing == 1){
		var punchX = (sprite_width * 0.8) 
	}
	if(leftRightArm){
		sprite_index = spr_playerHitRight;
	}
	else{
		sprite_index = spr_playerHitLeft;
	}
	instance_create_layer(x + punchX, y, "player",obj_playerHit);
}
#endregion