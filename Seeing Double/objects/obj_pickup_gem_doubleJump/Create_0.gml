event_inherited();
pickupSound = sfx_collect_coin;


triggered = false;
defaultSprite = spr_interactable_gem_doubleJump;
emptySprite = spr_interactable_gem_empty;
respawnDuration = 90;

duplicate = false;
duplicatedObject = noone; //Use this if gems need to move in sync in step event
if global.coopActive alarm[1] = 2;