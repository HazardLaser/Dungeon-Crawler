randomize();
floorPlan = false;
floorHeight =  room_height / 8;
floorWidth = room_width / 9;
numberOfRooms = irandom_range(7,13);
var roomNorth = false;
var roomWest = false;
var roomSouth = false;
var roomEast = false;
floorLayouts = [spr_defaultRoom]

#region layout
show_debug_message("Lets get it started in here");

for(var i = 0; i < 10; i++) {
	for(var j = 0; j < 9; j++) {
		floorPlan[i,j] = false;
	}
}

floorPlan[3,3] = true;				
while(numberOfRooms > 0){
	for(var i = 0; i < 9; i++) {
		for(var j = 0; j < 8; j++) {
			if(irandom(1) == 0 and floorPlan[i, j] != true and numberOfRooms > 0){
				
				if(floorPlan[i+1, j] == true){
					roomWest = true;
				}
				if(floorPlan[i, j+1] == true){
					roomNorth = true;
				}
				if(i > 0){
					if(floorPlan[i-1, j] == true){
						roomEast = true;
					}
				}
				if(j > 0) {
					if(floorPlan[i, j-1] == true){
						roomSouth = true;
					}
				}
				if(roomNorth or roomWest or roomSouth or roomEast){
					floorPlan[i, j] = true;
					layer_sprite_create("Assets_1", floorWidth * i, floorHeight * j, floorLayouts[irandom(array_length(floorLayouts)-1)]);
					show_debug_message(floorWidth *i);
					numberOfRooms -=1;
					controller = instance_create_layer(floorWidth * i, floorHeight * j, "controllers", obj_roomController);
					controller.roomNorth = roomNorth;
					controller.roomWest = roomWest;
					controller.roomSouth = roomSouth;
					controller.roomEast = roomEast;
				}
				else{
					floorPlan[i, j] = false;
				}
				roomNorth = false;
				roomWest = false;
				roomSouth = false;
				roomEast = false;
			}
			else{
				floorPlan[i, j] = false;
			}
		}
	}
	show_debug_message("Again");
}
if(floorPlan[3+1, 3] == true){
	roomWest = true;
}
if(floorPlan[3, 3+1] == true){
	roomNorth = true;
}
if(floorPlan[3-1, 3] == true){
	roomEast = true;
}
if(floorPlan[3, 3-1] == true){
	roomSouth = true;
}
if(roomNorth or roomWest or roomSouth or roomEast){
	layer_sprite_create("Assets_1", floorWidth * 3, floorHeight * 3, floorLayouts[irandom(array_length(floorLayouts)-1)]);
	controller = instance_create_layer(floorWidth * 3, floorHeight * 3, "controllers", obj_roomController);
	controller.roomNorth = roomNorth;
	controller.roomWest = roomWest;
	controller.roomSouth = roomSouth;
	controller.roomEast = roomEast;
}
var roomNorth = false;
var roomWest = false;
var roomSouth = false;
var roomEast = false;

show_debug_message(numberOfRooms);
#endregion

#region roomController

#endregion