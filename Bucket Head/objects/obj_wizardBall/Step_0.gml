if(direction != point_direction(x,y,obj_player.x,obj_player.y)){
	var difference = direction - point_direction(x,y,obj_player.x,obj_player.y);
	if(difference > 0){
		direction -= easing;	
	}
	else if(difference < 0){
		direction += easing;	
	}
}
speed = 1.5;