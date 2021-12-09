// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrpt_collision(object){
	var targetX = object.x;
	var targetY = object.y;
	object.x = xprevious;
	object.y = yprevious;
	var distanceX = abs(targetX - object.x);
	var distanceY = abs(targetY - object.x);
	for(var i = 0; i < distanceX; i++){
	}
}