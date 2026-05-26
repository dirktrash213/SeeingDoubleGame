global.coinCount++;
global.coinCountRegional++;

var _sparkleCount = 5;

part_particles_create(global.particleSystemDevice, x, y, global.particleCoinSparkle, _sparkleCount);

audio_play_sound(sfx_collect_coin, 1, 0);
//audio_play_sound_on(obj_control.reverb_emitter, sfx_collect_coin, false, 1);

instance_destroy();


