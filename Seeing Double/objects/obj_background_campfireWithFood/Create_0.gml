event_inherited();


//if !audio_is_playing(amb_campfire) playAudioWithFalloff(amb_campfire, 300);
if !audio_is_playing(amb_campfire) audio_play_sound_on(obj_control.reverb_emitter, amb_campfire, 1, 1);