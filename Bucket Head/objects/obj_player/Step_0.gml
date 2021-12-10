//show_debug_message(x);
//show_debug_message(y);

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
	//Here is revised movement with collision tracking
	if(keyboard_check(vk_right)){
		image_speed = playerSpeed;
		sprite_index = spr_playerWalkRight;
		//this gives the local variable  a value depending on what direction it faces
		directionFacing = 0;
	}
	if(keyboard_check(vk_left)){
		image_speed = playerSpeed;
		sprite_index = spr_playerWalkLeft;
		directionFacing = 1;
	}
	if(keyboard_check(vk_up)){
		image_speed = playerSpeed;
		sprite_index = spr_playerWalkUp;
		directionFacing = 2;
	}
	if(keyboard_check(vk_down)){
		image_speed = playerSpeed;
		sprite_index= spr_playerWalkDown;
		directionFacing = 3;
	}
	//I seperated this so movement wouldn't be clunky on the walls
	if(keyboard_check(vk_right) && place_free(x + collisionSpeed, y)){
		x+=playerSpeed;
	}
	if(keyboard_check(vk_left) && place_free(x - collisionSpeed, y)){
		x -= playerSpeed;
	}
	if(keyboard_check(vk_up) && place_free(x, y - collisionSpeed)){
		y-=playerSpeed;
	}
	if(keyboard_check(vk_down) && place_free(x, y + collisionSpeed)){
		y+=playerSpeed;
	}
	//If nothing is being pressed have the player idle
	if(keyboard_check(vk_nokey)){
		image_speed = 0;
		image_index = 0;
		if(directionFacing == 0){
			sprite_index = spr_playerWalkRight;	
		}
		if(directionFacing == 1){
			sprite_index = spr_playerWalkLeft;	
		}
		if (directionFacing==2){
			sprite_index = spr_playerWalkUp;
		}
		if (directionFacing==3){
			sprite_index = spr_playerWalkDown;
		}
	}
}
#endregion

#region Punch Attack
//checks if you can be hurt before being able to hurt others
if(!cantHurt){
	//z is the attack button
	if(keyboard_check_pressed(ord("Z"))){
		//changes which arm punches
		leftRightArm = !leftRightArm;
		if(directionFacing == 0){
			var punchX = 24 * 0.8; 
			var punchY = 0;
			var imageRotation = 0;
		}
		else if(directionFacing == 1){
			var punchX = 24 * -0.8;
			var punchY = 0;
			var imageRotation = 0;
		}
		if(directionFacing == 2){
			var punchX = 0;
			var punchY = 24 * -0.8;
			var imageRotation = 90;
		}
		else if(directionFacing == 3){
			var punchX = 0;
			var punchY = 24 * 0.8;
			var imageRotation = 90;
		}
		//add in sprite height for the other direction facing
		//give sprite index based on which direction facing
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
		else if(directionFacing == 2){
		
			if(leftRightArm){
				sprite_index = spr_playerFaceUpHitRight;
			}
			else{
				sprite_index = spr_playerFaceUpHitLeft;
			}
		}
		else if(directionFacing == 3){
		
			if(leftRightArm){
				sprite_index = spr_playerFaceDownHitRight;
			}
			else{
				sprite_index = spr_playerFaceDownHitLeft;
			}
		}
		//play random sound for effect
		audio_play_sound(punchSound[irandom(array_length(punchSound)-1)], 10, 0);
		//creates hurt box
		var hitBox = instance_create_layer(x + punchX, y + punchY, "player",obj_playerHit);
		hitBox.image_angle += imageRotation;
	}
}
#endregion
#region Health
//this controls the health
global.playerHealth = localHealth;
if(instance_number(obj_playerHit) <= 0){
	global.playerStunLock = false;
}
if(localHealth <= 0){
	//put destruction animation in here
	instance_destroy(self)
}
#endregion