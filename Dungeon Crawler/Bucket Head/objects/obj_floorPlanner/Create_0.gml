floorPlan = false;
floorHeight =  room_height / 8;
floorWidth = room_width / 9;
numberOfRooms = 8;
show_debug_message("Lets get it started in here");

for(var i = 0; i < 10; i++) {
	for(var j = 0; j < 9; j++) {
		floorPlan[i,j] = false;
	}
}

floorPlan[3,3] = true;
layer_sprite_create("Assets_1", floorWidth * 3, floorHeight * 3, spr_room1);

while(numberOfRooms > 0){
	for(var i = 0; i < 9; i++) {
		for(var j = 0; j < 8; j++) {
			if(irandom(1) == 0 and floorPlan[i, j] != true and numberOfRooms > 0){
				
				if(floorPlan[i+1, j] == true or floorPlan[i, j+1] == true ){
					floorPlan[i, j] = true;
					layer_sprite_create("Assets_1", floorWidth * i, floorHeight * j, spr_room1);
					show_debug_message(floorWidth *i);
					numberOfRooms -=1;
				}
				else if(i > 0){
					if(floorPlan[i-1, j] == true) {
						floorPlan[i, j] = true;
						layer_sprite_create("Assets_1", floorWidth * i, floorHeight * j, spr_room1);
						show_debug_message(floorWidth *i);
						numberOfRooms -=1;
					}
				}
				else if(j > 0) {
					if(floorPlan[i, j-1] == true) {
						floorPlan[i, j] = true;
						layer_sprite_create("Assets_1", floorWidth * i, floorHeight * j, spr_room1);
						show_debug_message(floorWidth *i);
						numberOfRooms -=1;
					}
				}
				else{
					floorPlan[i, j] = false;
				}
			}
			else{
				floorPlan[i, j] = false;
			}
		}
	}
	show_debug_message("Again");
}
show_debug_message(numberOfRooms);