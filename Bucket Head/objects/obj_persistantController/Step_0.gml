if(room = room_floor1 and global.won == false){
	counter++;
	if(counter >= room_speed*1){
		global.second+=1;
		counter = 0;
	}
	if(global.second>=60){
		counter=0;
		global.minute += 1;
		global.second = 0;
	}


}