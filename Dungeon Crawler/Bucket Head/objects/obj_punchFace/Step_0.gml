var distance = distance_to_object(obj_player);

if(distance > playerRangeMax){
	move_towards_point(obj_player.x, obj_player.y, punchFaceSpeed);
}
else if(distance < playerRangeMin){
	direction = point_direction(x,y,obj_player.x, obj_player.y) + 180;;
	speed = punchFaceSpeed
}
else{
	speed = 0;
}
//if player in same room
counter++;
if(counter >= room_speed*ballRate){
	instance_create_layer(x,y,"enemyProjectiles",obj_gooBall);
	counter = 0;
	ballRate = irandom_range(4,6);
}

//health
if(localHealth <= 0){
	//put destruction animation in here
	instance_destroy(self)
}