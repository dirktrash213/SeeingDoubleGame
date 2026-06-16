if !audio_is_playing(obj_control.bgmLab) audio_play_sound(obj_control.bgmLab, 1, true);

global.verticalLevel = false;
global.customLevel = false;

global.groundPoundActive = true;
global.doubleJumpActive = true;


if !global.destroyedLabDoor with obj_npc_robot_broken visible = false;