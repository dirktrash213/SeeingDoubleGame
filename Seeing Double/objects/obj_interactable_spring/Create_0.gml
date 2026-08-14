image_speed = 0;

coopObjectCreateEventCode();

attachedToPlatform = false;
platform = instance_nearest(x,y,obj_block_wall_semiSolid_moving);

active = true;
cooldown = 5;
springYspeed = -8;

canPlayAudio = true;
audioCooldown = 5; 

vanishOnTimeout = false;

duplicateAudio = false;