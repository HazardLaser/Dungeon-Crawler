roomNorth = false;
roomWest = false;
roomSouth = false;
roomEast = false;

#region North
instance_create_layer(x, y, "walls", obj_horizontalWall);
if(roomNorth){
	instance_create_layer(x + 143, y, "walls", obj_doorwayNorth);
}
else{
	instance_create_layer(x + 143, y, "walls", obj_horizontalWall);
}
instance_create_layer(x + 241, y, "walls", obj_horizontalWall);
#endregion

#region West
instance_create_layer(x, y, "walls", obj_verticalWall);
if(roomWest){
	instance_create_layer(x, y + 79, "walls", obj_doorwayWest);
}
else{
	instance_create_layer(x, y + 79, "walls", obj_verticalWall);
}
instance_create_layer(x, y + 177, "walls", obj_verticalWall);
#endregion

#region South
instance_create_layer(x, y + 232, "walls", obj_horizontalWall);
if(roomSouth){
	instance_create_layer(x + 143, y + 232, "walls", obj_doorwaySouth);
}
else{
	instance_create_layer(x + 143, y + 232, "walls", obj_horizontalWall);
}
instance_create_layer(x + 241, y + 232, "walls", obj_horizontalWall);
#endregion

#region East
instance_create_layer(x + 360, y, "walls", obj_verticalWall);
if(roomEast){
	instance_create_layer(x + 360, y + 79, "walls", obj_doorwayEast);
}
else{
	instance_create_layer(x + 360, y + 79, "walls", obj_verticalWall);
}
instance_create_layer(x + 360, y + 177, "walls", obj_verticalWall);
#endregion
show_debug_message("Room Made");