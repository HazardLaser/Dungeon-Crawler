//heatlh
if(localHealth <= 0){
	//put destruction animation in here
	instance_destroy(self);
	instance_create_layer(x,y,"objects", obj_gold);
}