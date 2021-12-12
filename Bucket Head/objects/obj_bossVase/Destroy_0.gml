var rnd = irandom(5)
if(rnd == 0){
	instance_create_layer(x,y,"objects",obj_gold);
}
else if(rnd == 1){
	//instance_create_layer(x,y,"objects", obj_food);
}
mp_grid_clear_rectangle(global.mp_grid, floor(x-8), floor(y-8), floor(x+8), floor(y+8));
room_goto(room_end);