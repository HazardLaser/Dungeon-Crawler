// Script assets have changed for v2.3.0 see
// https://help.varYovarYogames.com/hc/en-us/articles/360005277377 for more information
function theseWalls(varX, varY, roomNorth, roomWest, roomSouth, roomEast){
	#region North
	instance_create_layer(varX, varY, "walls", obj_horizontalWall);
	if(roomSouth){
		instance_create_layer(varX + 143, varY, "walls", obj_doorwayNorth);
	}
	else{
		instance_create_layer(varX + 143, varY, "walls", obj_horizontalWall);
	}
	instance_create_layer(varX + 241, varY, "walls", obj_horizontalWall);
	#endregion

	#region West
	instance_create_layer(varX, varY, "walls", obj_verticalWall);
	if(roomEast){
		instance_create_layer(varX, varY + 79, "walls", obj_doorwayWest);
	}
	else{
		var wall = instance_create_layer(varX, varY + 79, "walls", obj_verticalWallLong);
		wall.sprite_index = spr_wallVerticalLong;
	}
	instance_create_layer(varX, varY + 177, "walls", obj_verticalWall);
	#endregion

	#region South
	instance_create_layer(varX, varY + 232, "walls", obj_horizontalWall);
	if(roomNorth){
		instance_create_layer(varX + 143, varY + 232, "walls", obj_doorwaySouth);
	}
	else{
		instance_create_layer(varX + 143, varY + 232, "walls", obj_horizontalWall);
	}
	instance_create_layer(varX + 241, varY + 232, "walls", obj_horizontalWall);
	#endregion

	#region East
	instance_create_layer(varX + 360, varY, "walls", obj_verticalWall);
	if(roomWest){
		instance_create_layer(varX + 360, varY + 79, "walls", obj_doorwayEast);
	}
	else{
		var wall = instance_create_layer(varX + 360, varY + 79, "walls", obj_verticalWall);
		wall.sprite_index = spr_wallVerticalLong;
		
	}
	instance_create_layer(varX + 360, varY + 177, "walls", obj_verticalWall);
	#endregion
	show_debug_message("Room Made");
}