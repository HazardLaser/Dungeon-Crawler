show_debug_message(x);
show_debug_message(y);

#region Movement
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
}
else if (move_left){
	sprite_index = spr_playerWalk;
	image_xscale=-1;	
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
#endregion