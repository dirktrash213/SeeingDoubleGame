if !instance_exists(obj_spawner_cherry) exit;

audio_play_sound(pickupSound, 1, 0, 1, 0, obj_spawner_cherry.coinCollectAudioPitch);

instance_destroy();

with obj_spawner_cherry {

	coinsCollected++;
	coinCollectAudioPitch += 0.1;

}
