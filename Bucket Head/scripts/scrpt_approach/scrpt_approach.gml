// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function approach(speed, targetSpeed, acceleration){
	if(speed < targetSpeed){
		speed += acceleration;
		if (speed > targetSpeed){
			return targetSpeed;
		}
	}
	else{
		speed -= acceleration;
		if (speed < targetSpeed){
			return targetSpeed;
		}
	}
	return speed;
}