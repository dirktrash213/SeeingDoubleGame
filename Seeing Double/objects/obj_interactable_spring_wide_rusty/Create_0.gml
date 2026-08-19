image_speed = 0;

coopObjectCreateEventCode();

attachedToPlatform = false;
platform = instance_nearest(x,y,obj_block_wall_semiSolid_moving);

active = true;
cooldown = 30;
springYspeed = -16;

canPlayAudio = true;
audioCooldown = 5;

vanishOnTimeout = false;

attachedToBreakableFloor = false;
breakableFloor = instance_nearest(x,y,obj_interactable_breakableFloor);

falling = false;