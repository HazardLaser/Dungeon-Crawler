if (keyboard_check_pressed(vk_space)){
	global.money=global.money-1;
}
else 
if (global.money<0){
	 global.money=0;
}