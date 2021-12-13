if(instance_exists(obj_player)){
	summon = true;
}

#region floorLayout time
if(summon and !once){
	floorLayout = irandom(10);
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
			instance_create_layer(x+136, y+32, "objects",obj_vase);
			instance_create_layer(x+249, y+32, "objects", obj_vase);
			instance_create_layer(x+135, y+223, "objects", obj_vase);
			instance_create_layer(x+249, y+224, "objects", obj_vase);
			//pillars
			instance_create_layer(x+256, y+80, "objects", obj_pillar);
			instance_create_layer(x+128, y+80, "objects", obj_pillar);
			instance_create_layer(x+128, y+144, "objects", obj_pillar);
			instance_create_layer(x+256, y+144, "objects", obj_pillar);
		
			break;
		case 1:
			//pillars
			instance_create_layer(x+291, y+112, "objects", obj_pillar);
			//pots
			instance_create_layer(x+192, y+59, "objects",obj_vase);
			instance_create_layer(x+90, y+132, "objects", obj_vase);
			instance_create_layer(x+136, y+189, "objects", obj_vase);
			instance_create_layer(x+295, y+197, "objects", obj_vase);
			instance_create_layer(x+267, y+67, "objects", obj_vase);
			//food
			instance_create_layer(x+192, y+128, "objects", obj_food);
			//goblins
			array_push(enemies, instance_create_layer(x+192, y+96, "enemies", obj_goblin));
			array_push(enemies, instance_create_layer(x+160, y+128, "enemies", obj_goblin));
			array_push(enemies,  instance_create_layer(x+192, y+160, "enemies", obj_goblin));
			array_push(enemies, instance_create_layer(x+216, y+ 128, "enemies", obj_goblin));
			break;
		case 2:
			//pillars
			instance_create_layer(x+192, y+80, "objects", obj_pillar);
			//pots
			instance_create_layer(x+281, y+79, "objects",obj_vase);
			instance_create_layer(x+99, y+80, "objects", obj_vase);
			instance_create_layer(x+250, y+224, "objects", obj_vase);
			instance_create_layer(x+134, y+224, "objects", obj_vase);
			//goblins
			array_push(enemies, instance_create_layer(x+224, y+128, "enemies", obj_goblin));
			
			//PunchFace
			array_push(enemies, instance_create_layer(x+192, y+128, "enemies", obj_punchFace));
			
			//Darkwizard
			array_push(enemies, instance_create_layer(x+160, y+128, "enemies", obj_darkWizard));
			break;
		case 3:
			//pots
			instance_create_layer(x+216, y+120, "objects",obj_vase);
			instance_create_layer(x+216, y+136, "objects", obj_vase);
			instance_create_layer(x+200, y+152, "objects", obj_vase);
			instance_create_layer(x+184, y+152, "objects", obj_vase);
			instance_create_layer(x+168, y+136, "objects",obj_vase);
			instance_create_layer(x+168, y+120, "objects", obj_vase);
			instance_create_layer(x+184, y+104, "objects", obj_vase);
			instance_create_layer(x+200, y+104, "objects", obj_vase);
			//coins
			instance_create_layer(x+184, y+120, "objects",obj_gold);
			instance_create_layer(x+184, y+136, "objects", obj_gold);
			instance_create_layer(x+200, y+120, "objects", obj_gold);
			instance_create_layer(x+200, y+136, "objects", obj_gold);
			//goblins
			array_push(enemies, instance_create_layer(x+43, y+45, "enemies", obj_goblin));
			array_push(enemies, instance_create_layer(x+43, y+214, "enemies", obj_goblin));
			array_push(enemies, instance_create_layer(x+338, y+214, "enemies", obj_goblin));
			array_push(enemies, instance_create_layer(x+338, y+45, "enemies", obj_goblin));
			//PunchFace
			array_push(enemies, instance_create_layer(x+112, y+128, "enemies", obj_punchFace));
			array_push(enemies, instance_create_layer(x+272, y+128, "enemies", obj_punchFace));
			break;
		case 4:
			//food
			instance_create_layer(x+72, y+128, "objects",obj_food);
			instance_create_layer(x+328, y+128, "objects", obj_food);
			//punchface
			array_push(enemies, instance_create_layer(x+40, y+40, "enemies", obj_punchFace));
			array_push(enemies, instance_create_layer(x+72, y+40, "enemies", obj_punchFace));
			array_push(enemies, instance_create_layer(x+312, y+40, "enemies", obj_punchFace));
			array_push(enemies, instance_create_layer(x+344, y+40, "enemies", obj_punchFace));
			array_push(enemies, instance_create_layer(x+40, y+216, "enemies", obj_punchFace));
			array_push(enemies, instance_create_layer(x+72, y+216, "enemies", obj_punchFace));
			array_push(enemies, instance_create_layer(x+312, y+216, "enemies", obj_punchFace));
			array_push(enemies, instance_create_layer(x+344, y+216, "enemies", obj_punchFace));
			array_push(enemies, instance_create_layer(x+160, y+96, "enemies", obj_punchFace));
			array_push(enemies, instance_create_layer(x+192, y+96, "enemies", obj_punchFace));
			array_push(enemies, instance_create_layer(x+224, y+96, "enemies", obj_punchFace));
			array_push(enemies, instance_create_layer(x+160, y+128, "enemies", obj_punchFace));
			array_push(enemies, instance_create_layer(x+192, y+128, "enemies", obj_punchFace));
			array_push(enemies, instance_create_layer(x+224, y+128, "enemies", obj_punchFace));
			array_push(enemies, instance_create_layer(x+160, y+160, "enemies", obj_punchFace));
			array_push(enemies, instance_create_layer(x+192, y+160, "enemies", obj_punchFace));
			array_push(enemies, instance_create_layer(x+224, y+160, "enemies", obj_punchFace));
			
			break;
		case 5:
			//vase
			instance_create_layer(x+64,y+192, "objects", obj_vase);
			instance_create_layer(x+32,y+64, "objects", obj_vase);
			instance_create_layer(x+32,y+32, "objects", obj_vase);
			instance_create_layer(x+64,y+32, "objects", obj_vase);
			instance_create_layer(x+320,y+224, "objects", obj_vase);
			instance_create_layer(x+352,y+192, "objects", obj_vase);
			instance_create_layer(x+288,y+64, "objects", obj_vase);
			//pillars
			instance_create_layer(x+96,y+128, "objects", obj_pillar);
			instance_create_layer(x+128,y+64, "objects", obj_pillar);
			instance_create_layer(x+256,y+64, "objects", obj_pillar);
			instance_create_layer(x+288,y+128, "objects", obj_pillar);
			//punchFace
			array_push(enemies, instance_create_layer(x+96,y+192, "enemies", obj_punchFace));
			array_push(enemies, instance_create_layer(x+288,y+192, "enemies", obj_punchFace));
			//wizards
			array_push(enemies, instance_create_layer(x+192,y+192, "enemies", obj_darkWizard));
			array_push(enemies, instance_create_layer(x+320,y+96, "enemies", obj_darkWizard));
			array_push(enemies, instance_create_layer(x+64,y+96, "enemies", obj_darkWizard));
			break;
		case 6:
			//vase
			instance_create_layer(x+32,y+224, "objects", obj_vase);
			instance_create_layer(x+64,y+192, "objects", obj_vase);
			instance_create_layer(x+64,y+32, "objects", obj_vase);
			instance_create_layer(x+256,y+192, "objects", obj_vase);
			instance_create_layer(x+320,y+192, "objects", obj_vase);
			instance_create_layer(x+320,y+32, "objects", obj_vase);
			//pillar
			instance_create_layer(x+128,y+128, "objects", obj_pillar);
			instance_create_layer(x+128,y+128, "objects", obj_pillar);
			//food
			instance_create_layer(x+192,y+128, "objects", obj_food);
			//punchface
			array_push(enemies,instance_create_layer(x+64,y+96, "enemies", obj_punchFace));
			array_push(enemies,instance_create_layer(x+320,y+160, "enemies", obj_punchFace));
			//goblin
			array_push(enemies,instance_create_layer(x+96,y+192, "enemies", obj_goblin));
			array_push(enemies,instance_create_layer(x+64,y+96, "enemies", obj_goblin));
			array_push(enemies,instance_create_layer(x+288,y+64, "enemies", obj_goblin));
			array_push(enemies,instance_create_layer(x+288,y+192, "enemies", obj_goblin));
			break;
		case 7:
			//coins
			instance_create_layer(x+168, y+104, "objects", obj_gold);
			instance_create_layer(x+192, y+99, "objects", obj_gold);
			instance_create_layer(x+216, y+104, "objects", obj_gold);
			instance_create_layer(x+160, y+122, "objects", obj_gold);
			instance_create_layer(x+162, y+138, "objects", obj_gold);
			instance_create_layer(x+168, y+152, "objects", obj_gold);
			instance_create_layer(x+142, y+133, "objects", obj_gold);
			instance_create_layer(x+193, y+121, "objects", obj_gold);
			instance_create_layer(x+195, y+140, "objects", obj_gold);
			instance_create_layer(x+189, y+164, "objects", obj_gold);
			instance_create_layer(x+227, y+123, "objects", obj_gold);
			instance_create_layer(x+240, y+134, "objects", obj_gold);
			instance_create_layer(x+216, y+152, "objects", obj_gold);
			instance_create_layer(x+218, y+168, "objects", obj_gold);
			//pillar
			instance_create_layer(x+296, y+200, "objects",obj_pillar);
			//goblin
			array_push(enemies, instance_create_layer(x+144, y+128, "enemies", obj_goblin));
			array_push(enemies, instance_create_layer(x+176, y+128, "enemies", obj_goblin));
			array_push(enemies, instance_create_layer(x+208, y+128, "enemies", obj_goblin));
			array_push(enemies, instance_create_layer(x+240, y+128, "enemies", obj_goblin));
			array_push(enemies, instance_create_layer(x+192, y+96, "enemies", obj_goblin));
			array_push(enemies, instance_create_layer(x+192, y+160, "enemies", obj_goblin));
			//wizard
			array_push(enemies, instance_create_layer(x+296, y+184, "enemies", obj_darkWizard));
			array_push(enemies, instance_create_layer(x+40, y+216, "enemies", obj_darkWizard));
			array_push(enemies, instance_create_layer(x+344, y+216, "enemies", obj_darkWizard));
			array_push(enemies, instance_create_layer(x+40, y+40, "enemies", obj_darkWizard));
			array_push(enemies, instance_create_layer(x+344, y+40, "enemies", obj_darkWizard));
			break;
		case 8:
			//vase
			instance_create_layer(x+320,y+192, "objects", obj_vase);
			instance_create_layer(x+228,y+96, "objects", obj_vase);
			instance_create_layer(x+192,y+64, "objects", obj_vase);
			//gold
			instance_create_layer(x+224,y+128, "objects", obj_gold);
			//food
			instance_create_layer(x+64,y+192, "objects", obj_food);
			//pillars
			instance_create_layer(x+64,y+192, "objects", obj_pillar);
			instance_create_layer(x+96,y+128, "objects", obj_pillar);
			instance_create_layer(x+64,y+64, "objects", obj_pillar);
			instance_create_layer(x+160,y+192, "objects", obj_pillar);
			instance_create_layer(x+192,y+64, "objects", obj_pillar);
			instance_create_layer(x+224,y+128, "objects", obj_pillar);
			instance_create_layer(x+256,y+192, "objects", obj_pillar);
			instance_create_layer(x+288,y+196, "objects", obj_pillar);
			instance_create_layer(x+320,y+64, "objects", obj_pillar);
			instance_create_layer(x+320,y+192, "objects", obj_pillar);
			//wizards
			array_push(enemies,instance_create_layer(x+256,y+192, "enemies", obj_darkWizard));
			array_push(enemies,instance_create_layer(x+160,y+192, "enemies", obj_darkWizard));
			array_push(enemies,instance_create_layer(x+96,y+128, "enemies", obj_darkWizard));
			array_push(enemies,instance_create_layer(x+64,y+64, "enemies", obj_darkWizard));
			array_push(enemies,instance_create_layer(x+320,y+24, "enemies", obj_darkWizard));
			break;
		case 9:
			//food
			instance_create_layer(x+175,y+152, "objects", obj_food);
			instance_create_layer(x+192,y+152, "objects", obj_food);
			instance_create_layer(x+208,y+152, "objects", obj_food);
			//goblin
			array_push(enemies,instance_create_layer(x+192,y+128, "enemies", obj_goblin));
			break;
		case 10:
			//gold
			instance_create_layer(x+175,y+152, "objects", obj_gold);
			instance_create_layer(x+192,y+152, "objects", obj_gold);
			instance_create_layer(x+208,y+152, "objects", obj_gold);
			//goblin
			array_push(enemies,instance_create_layer(x+192,y+128, "enemies", obj_goblin));
			break;
		
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
	audio_play_sound(snd_doorShut, 11, false);
	initialized = true;
	enemyGoal = global.enemiesDefeated + array_length(enemies);
	mp_grid_add_instances(global.mp_grid,obj_pillar, false);
	mp_grid_add_instances(global.mp_grid,obj_horizontalWall, false);
	mp_grid_add_instances(global.mp_grid,obj_verticalWall, false);
	mp_grid_add_instances(global.mp_grid,obj_vase, true);
	mp_grid_add_instances(global.mp_grid,obj_verticalWallLong, false);
	mp_grid_add_instances(global.mp_grid,obj_lockNorth, false);
	mp_grid_add_instances(global.mp_grid,obj_lockWest, false);
	mp_grid_add_instances(global.mp_grid,obj_lockSouth, false);
	mp_grid_add_instances(global.mp_grid,obj_lockEast, false);
}
if(initialized){
	if(global.enemiesDefeated >= enemyGoal){
		for(var i = 0; i < array_length(gates); i++){
			instance_destroy(gates[i]);
		}
	}
}
#endregion