if !instance_exists(obj_spawner_cherry) exit;



var _sparkleCount = 5;

part_particles_create(global.particleSystemDevice, x, y, global.particleCoinSparkleRed, _sparkleCount);

audio_play_sound(pickupSound, 1, 0, 1, 0, obj_spawner_cherry.coinCollectAudioPitch);

instance_destroy();

with obj_spawner_cherry {

	coinsCollected++;
	coinCollectAudioPitch += 0.1;

}

with instance_create_layer(x, y, "Instances", obj_textPopup) {

	text = obj_spawner_cherry.coinsCollected;

}