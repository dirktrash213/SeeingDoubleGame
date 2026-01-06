event_inherited();

idle = false;
walking = true;

moveDir = WALKING_DIRECTION.LEFT;

walkSpeed = 0.5;

followPlayer = false; //Track if this enemy attempts to follow the player
delayBeforeTurnAround = 60;

fallOffLedges = true;

spikey = true;

idleSprite = spr_enemy_hornBeetle_idle;
walkSprite = spr_enemy_hornBeetle_walk;
jumpSprite = spr_enemy_hornBeetle_jump;
defeatSprite = spr_enemy_hornBeetle_defeat;

xStretch = 1;
yStretch = 1;
stretchAdjustAmount = 0.1;

harmless = false;
invincible = false;

removeDuration = 15;