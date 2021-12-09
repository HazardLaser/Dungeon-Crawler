if(instance_number(obj_playerHit) <= 1){
	global.playerStunLock = false;
}
instance_destroy(self);