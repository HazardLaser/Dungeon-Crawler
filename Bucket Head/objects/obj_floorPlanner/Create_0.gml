randomize();
floorPlan = false;
floorHeight =  room_height / 8;
floorWidth = room_width / 9;
numberOfRooms = irandom_range(7,13);
var roomNorth = false;
var roomWest = false;
var roomSouth = false;
var roomEast = false;
floorLayouts = [spr_defaultRoom];
controllerArray = [];

#region layout
show_debug_message("Lets get it started in here");

for(var i = 0; i < 10; i++) {
	for(var j = 0; j < 9; j++) {
		floorPlan[i,j] = false;
	}
}

floorPlan[3,3] = true;			
layer_sprite_create("Assets_1", floorWidth * 3, floorHeight * 3, floorLayouts[irandom(array_length(floorLayouts)-1)]);
while(numberOfRooms > 0){
	for(var i = 0; i < 9; i++) {
		for(var j = 0; j < 8; j++) {
			if(choose(0,1,2,4) == 0 and floorPlan[i, j] == false and numberOfRooms > 0){
				
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
					layer_sprite_create("Assets_1", floorWidth * i, floorHeight * j, floorLayouts[irandom(array_length(floorLayouts)-1)]);
					floorPlan[i, j] = true;
					show_debug_message(floorWidth *i);
					numberOfRooms -=1;
					show_debug_message("Room started");
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
				//hey there
			}
		}
	}
	show_debug_message("Again");
}

for(var i = 0; i < 9; i++) {
		for(var j = 0; j < 8; j++) {
			if(floorPlan[i+1, j] == true){
				roomWest = true;
			}
			else{
				roomWest = false;	
			}
			if(floorPlan[i, j+1] == true){
				roomNorth = true;
			}
			else{
				roomNorth = false;	
			}
			if(i > 0){
				if(floorPlan[i-1, j] == true){
					roomEast = true;
				}
				else{
					roomEast = false;	
				}
			}
			if(j > 0){
				if(floorPlan[i, j-1] == true){
					roomSouth = true;
				}
				else{
					roomSouth = false;	
				}
			}
			if(floorPlan[i,j] == true){
				controller = instance_create_layer(floorWidth * i, floorHeight * j, "controllers", obj_roomController)
				theseWalls(controller.x, controller.y, roomNorth, roomWest, roomSouth, roomEast);
				array_push(controllerArray, controller);
			}
			var roomNorth = false;
			var roomWest = false;
			var roomSouth = false;
			var roomEast = false;

			show_debug_message(numberOfRooms);
		}
}
#endregion

#region roomMapping
//Just get the numbers
var ghost = instance_create_layer(floorWidth * 3, floorHeight * 3, "controllers", obj_ghostController);
var mostNorthRoom = [ghost];
var mostWestRoom = [ghost];
var mostSouthRoom = [ghost];
var mostEastRoom = [ghost];

//Run through controller locations to know min maxs
for(i = 0; i < array_length(controllerArray); i++){
	//check the north
	if(mostNorthRoom[0].y > controllerArray[i].y){
		array_resize(mostNorthRoom, 0);
		mostNorthRoom[0] = controllerArray[i];
	}
	else if(mostNorthRoom[0].y == controllerArray[i].y){
		array_push(mostNorthRoom, controllerArray[i]);
		if(mostNorthRoom[0] == ghost){
			array_resize(mostNorthRoom, 0);
			mostNorthRoom[0] = controllerArray[i];
		}
	}
	//check the west
	if(mostWestRoom[0].x > controllerArray[i].x){
		array_resize(mostWestRoom, 0);
		mostWestRoom[0] = controllerArray[i];
	}
	else if(mostWestRoom[0].x == controllerArray[i].x){
		array_push(mostWestRoom, controllerArray[i]);
		if(mostWestRoom[0] == ghost){
			array_resize(mostWestRoom, 0);
			mostWestRoom[0] = controllerArray[i];
		}
	}
	//check the South
	if(mostSouthRoom[0].y < controllerArray[i].y){
		array_resize(mostSouthRoom, 0);
		mostSouthRoom[0] = controllerArray[i];
	}
	else if(mostSouthRoom[0].y == controllerArray[i].y){
		array_push(mostSouthRoom, controllerArray[i]);
		if(mostSouthRoom[0] == ghost){
			array_resize(mostSouthRoom, 0);
			mostSouthRoom[0] = controllerArray[i];
		}
	}
	//check the east
	if(mostEastRoom[0].x < controllerArray[i].x){
		array_resize(mostEastRoom, 0);
		mostEastRoom[0] = controllerArray[i];
	}
	else if(mostEastRoom[0].x == controllerArray[i].x){
		array_push(mostEastRoom, controllerArray[i]);
		if(mostEastRoom[0] == ghost){
			array_resize(mostEastRoom, 0);
			mostEastRoom[0] = controllerArray[i];
		}
	}
	
}
//print out for testing
//no more testing here
//spawn in boss
var bestHolder = 0; 	
if(array_length(mostEastRoom) > 1){
	bestHolder = mostEastRoom[0];
	for(i = 0; i < array_length(mostEastRoom); i++){
		if(bestHolder.y > mostEastRoom[i].y){
			bestHolder = mostEastRoom[i];
		}
	}
	instance_create_layer(bestHolder.x + (floorWidth / 2), bestHolder.y + (floorHeight / 2), "enemies", obj_bossVase);
}
else{
	instance_create_layer(mostEastRoom[0].x + (floorWidth / 2), mostEastRoom[0].y + (floorHeight / 2), "enemies", obj_bossVase);	
}
//reset variable
//spawn player left bottom
if(array_length(mostWestRoom) > 1){
	bestHolder = mostWestRoom[0];
	for(i = 0; i < array_length(mostWestRoom); i++){
		if(bestHolder.y < mostWestRoom[i].y){
			bestHolder = mostWestRoom[i];
		}
	}
	instance_create_layer(bestHolder.x + (floorWidth / 2), bestHolder.y + (floorHeight / 2), "enemies", obj_player);
}
else{
	instance_create_layer(mostWestRoom[0].x + (floorWidth / 2), mostWestRoom[0].y + (floorHeight / 2), "enemies", obj_player);	
}
#endregion
