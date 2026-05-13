

//breakCaveBoulder();

objBktGlitchDemo.enable_split_screen = false;

setPitterScaredSprites();
setPatterScaredSprites();
setUpSpookyGhostAudio();
caveGhostIsCloseInstant();
audio_play_sound_on(obj_control.reverb_emitter, sfx_ghost_screamAlerted, false, 1, 0.5, 0, 0.65); 

with obj_npc_ghost_cavesChase {
				
	alarm[0] = 5;

}

if audio_is_playing(obj_control.bgmCave) audio_stop_sound(obj_control.bgmCave);
if !audio_is_playing(obj_control.bgmCaveChase) audio_play_sound(obj_control.bgmCaveChase, 1, true);

instance_destroy();