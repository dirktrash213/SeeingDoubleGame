if bonked && (visible || secret) {

	if instance_exists(obj_spawner_enemyCherryGoal) {
	
		instance_destroy(obj_enemy);
		
		with instance_create_layer(xSpawn, ySpawn, "Instances", obj_enemy_beetle) {
		
			image_blend = c_aqua;
		
		}
		
		instance_destroy(obj_enemy_doppleganger);
		
		with instance_create_layer(xSpawnDoppleganger, ySpawnDoppleganger, "Instances", obj_enemy_doppleganger) {
		
			sprite_index = spr_enemy_skullBeetle_walk;
			image_blend = c_aqua;
		
		}
	
		with obj_trigger_wrongBuzzer triggered = false;
	
	}

	visible = true;
	
	bonked = false;
	
	gravity = 0.5;
	vspeed = -3;
	
}

if y > ystart {
	
	y = ystart;
	gravity = 0;
	vspeed = 0;
	
}