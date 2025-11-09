event_inherited();

idle = false;
walking = true;

moveDir = WALKING_DIRECTION.LEFT;

walkSpeed = 0.5;

followPlayer = false; //Track if this enemy attempts to follow the player
delayBeforeTurnAround = 60;

idleSprite = spr_enemy_skullBeetle_idle;
walkSprite = spr_enemy_skullBeetle_walk;
jumpSprite = spr_enemy_skullBeetle_jump;
defeatSprite = spr_enemy_skullBeetle_defeat;