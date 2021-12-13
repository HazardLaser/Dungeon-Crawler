if(instance_exists(obj_player)){
	summon = true;
}

#region floorLayout time
if(summon and !once){
	floorLayout = irandom(0);
	switch(floorLayout){
		case 0:
			//dark robe
			array_push(enemies,instance_create_layer(x+40, y+40, "enemies", obj_darkWizard));
			array_push(enemies, instance_create_layer(x+72, y+40, "enemies", obj_darkWizard));
			array_push(enemies,  instance_create_layer(x+312, y+40, "enemies", obj_darkWizard));
			array_push(enemies, instance_create_layer(x+344, y+ 40, "enemies", obj_darkWizard));
			array_push(enemies, instance_create_layer(x+40, y+ 216, "enemies", obj_darkWizard));
			array_push(enemies, instance_create_layer(x+72, y+216, "enemies", obj_darkWizard));
			array_push(enemies, instance_create_layer(x+312, y+216, "enemies", obj_darkWizard));
			array_push(enemies, instance_create_layer(x+344, y+216, "enemies", obj_darkWizard));
			//goo boy
			array_push(enemies, instance_create_layer(x+192, y+128, "enemies", obj_punchFace));
			//pot
			instance_create_layer(x+136, y+32, "objects",obj_vase)
			instance_create_layer(x+249, y+32, "objects", obj_vase)
			instance_create_layer(x+135, y+223, "objects", obj_vase)
			instance_create_layer(x+249, y+224, "objects", obj_vase)
			//pillars
			instance_create_layer(x+256, y+80, "objects", obj_pillar)
			instance_create_layer(x+128, y+80, "objects", obj_pillar)
			instance_create_layer(x+128, y+144, "objects", obj_pillar)
			instance_create_layer(x+256, y+144, "objects", obj_pillar)
		
			break;
		/*case 0:
			break;
		case 0:
			break;
		case 0:
			break;
		case 0:
			break;*/
		
	}
		once= true;
		counter++;
		boundingBox = instance_create_layer(x + 24, y + 24, "controllers", obj_boundingBox);
		
}
#endregion
#region Player has entered the arena
if(boundingBox.ALERTTIME and !initialized){
	for(var i = 0; i < array_length(enemies); i++){
		enemies[i].alert = true;
	}
	array_push(gates, instance_create_layer(x + 143, y, "objects", obj_lockNorth), instance_create_layer(x, y + 79, "objects", obj_lockWest), instance_create_layer(x + 143, y + 232, "objects", obj_lockSouth), instance_create_layer(x + 360, y + 79,"objects",obj_lockEast));
	show_debug_message("DOUBLE TIME");
	initialized = true;
	enemyGoal = global.enemiesDefeated + array_length(enemies);
}
if(initialized){
	if(global.enemiesDefeated >= enemyGoal){
		for(var i = 0; i < array_length(gates); i++){
			instance_destroy(gates[i]);
		}
	}
}
#endregion