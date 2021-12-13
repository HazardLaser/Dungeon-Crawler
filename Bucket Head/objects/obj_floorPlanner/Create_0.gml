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
					numberOfRooms -=1;
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
	instance_destroy(bestHolder);
}
else{
	instance_create_layer(mostEastRoom[0].x + (floorWidth / 2), mostEastRoom[0].y + (floorHeight / 2), "enemies", obj_bossVase);	
	instance_destroy(mostEastRoom[0]);
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
	instance_create_layer(bestHolder.x + 296, bestHolder.y + 205, "objects", obj_billBoardMovement);
	instance_create_layer(bestHolder.x + 88, bestHolder.y + 205, "objects", obj_billBoardZ);
	instance_create_layer(bestHolder.x + 32, bestHolder.y + 87, "objects", obj_vase);
	instance_create_layer(bestHolder.x + 32, bestHolder.y + 120, "objects", obj_vase);
	instance_create_layer(bestHolder.x + 32, bestHolder.y + 136, "objects", obj_vase);
	instance_create_layer(bestHolder.x + 32, bestHolder.y + 169, "objects", obj_vase);
	instance_create_layer(bestHolder.x + 352, bestHolder.y + 87, "objects", obj_vase);
	instance_create_layer(bestHolder.x + 352, bestHolder.y + 120, "objects", obj_vase);
	instance_create_layer(bestHolder.x + 352, bestHolder.y + 136, "objects", obj_vase);
	instance_create_layer(bestHolder.x + 352, bestHolder.y + 169, "objects", obj_vase);
	instance_create_layer(bestHolder.x + 151, bestHolder.y + 32, "objects", obj_vase);
	instance_create_layer(bestHolder.x + 184, bestHolder.y + 32, "objects", obj_vase);
	instance_create_layer(bestHolder.x + 200, bestHolder.y + 32, "objects", obj_vase);
	instance_create_layer(bestHolder.x + 233, bestHolder.y + 32, "objects", obj_vase);
	instance_create_layer(bestHolder.x + 151, bestHolder.y + 224, "objects", obj_vase);
	instance_create_layer(bestHolder.x + 184, bestHolder.y + 224, "objects", obj_vase);
	instance_create_layer(bestHolder.x + 200, bestHolder.y + 224, "objects", obj_vase);
	instance_create_layer(bestHolder.x + 233, bestHolder.y + 224, "objects", obj_vase);
	
	instance_destroy(bestHolder);
}
else{
	instance_create_layer(mostWestRoom[0].x + (floorWidth / 2), mostWestRoom[0].y + (floorHeight / 2), "enemies", obj_player);
	instance_create_layer(mostWestRoom[0].x + 296, mostWestRoom[0].y + 205, "objects", obj_billBoardMovement);
	instance_create_layer(mostWestRoom[0].x + 88, mostWestRoom[0].y + 205, "objects", obj_billBoardZ);
	instance_create_layer(mostWestRoom[0].x + 32, mostWestRoom[0].y + 87, "objects", obj_vase);
	instance_create_layer(mostWestRoom[0].x + 32, mostWestRoom[0].y + 120, "objects", obj_vase);
	instance_create_layer(mostWestRoom[0].x + 32, mostWestRoom[0].y + 136, "objects", obj_vase);
	instance_create_layer(mostWestRoom[0].x + 32, mostWestRoom[0].y + 169, "objects", obj_vase);
	instance_create_layer(mostWestRoom[0].x + 352, mostWestRoom[0].y + 87, "objects", obj_vase);
	instance_create_layer(mostWestRoom[0].x + 352, mostWestRoom[0].y + 120, "objects", obj_vase);
	instance_create_layer(mostWestRoom[0].x + 352, mostWestRoom[0].y + 136, "objects", obj_vase);
	instance_create_layer(mostWestRoom[0].x + 352, mostWestRoom[0].y + 169, "objects", obj_vase);
	instance_create_layer(mostWestRoom[0].x + 151, mostWestRoom[0].y + 32, "objects", obj_vase);
	instance_create_layer(mostWestRoom[0].x + 184, mostWestRoom[0].y + 32, "objects", obj_vase);
	instance_create_layer(mostWestRoom[0].x + 200, mostWestRoom[0].y + 32, "objects", obj_vase);
	instance_create_layer(mostWestRoom[0].x + 233, mostWestRoom[0].y + 32, "objects", obj_vase);
	instance_create_layer(mostWestRoom[0].x + 151, mostWestRoom[0].y + 224, "objects", obj_vase);
	instance_create_layer(mostWestRoom[0].x + 184, mostWestRoom[0].y + 224, "objects", obj_vase);
	instance_create_layer(mostWestRoom[0].x + 200, mostWestRoom[0].y + 224, "objects", obj_vase);
	instance_create_layer(mostWestRoom[0].x + 233, mostWestRoom[0].y + 224, "objects", obj_vase);
	instance_destroy(mostWestRoom[0]);
}

#endregion
