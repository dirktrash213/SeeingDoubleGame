global.coinCount++;

var _sparkleCount = 5;

part_particles_create(global.particleSystemDevice, x, y, global.particleCoinSparkle, _sparkleCount);

audio_play_sound(sfx_collect_coin, 1, 0);

instance_destroy();


