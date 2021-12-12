// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_for_player(){
	var distance = distance_to_object(obj_player);
	
	
	if(calcPathTimer-- <= 0){
		calcPathTimer = calcPathDelay;
		
		var foundPlayer = mp_grid_path(global.mp_grid, path, x, y, obj_player.x,obj_player.y, choose(0,1));
		if(foundPlayer) {
			path_start(path, movementSpeed, path_action_stop, false);	
		}
	}
}
/*
calcPathTimer
calcPathDelay
path
movementSpeed
*/