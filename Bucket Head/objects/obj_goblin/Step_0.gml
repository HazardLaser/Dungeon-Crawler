//heatlh
if(localHealth <= 0){
	//put destruction animation in here
	instance_destroy(self);
	instance_create_layer(x,y,"objects", obj_gold);
}

if(instance_exists(obj_player)){
//track player
//move to closest x or y coordinate
//charge at player
//when lining up avoid the obsticles.
}