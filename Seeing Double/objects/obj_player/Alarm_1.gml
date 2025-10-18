/// @description Kill player if they spend too much time out of bounds [May not implement]
/*
if global.playerDefeated exit;

global.playerDefeated = true;
global.defeatCount++;

audio_play_sound(sfx_hurt, 1, 0);
global.playerControl = false;
obj_control.alarm[0] = global.playerRespawnTime; 

other.sprite_index = other.defeatSprite;
