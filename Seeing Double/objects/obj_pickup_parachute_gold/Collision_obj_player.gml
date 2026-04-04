var _sparkleCount = 5;

part_particles_create(global.particleSystemDevice, x, y, global.particleCoinSparkle, _sparkleCount);

audio_play_sound(sfx_collect_cherry, 1, 0);

instance_destroy();

//with instance_create_layer(x, y - 20, "Instances", obj_textPopup) {
//
//	text = "GOT\nGOLDEN\nPARACHUTE!";
//	alphaFadeRate = 0.005;
//
//}
