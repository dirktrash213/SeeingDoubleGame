//detectionRadius = 70;


//state = BIRD_STATE.IDLE;


ableToHop = true;
ableToPeck = true;





// Settings
detect_radius = 64;   // How close player gets before bird flies
fly_speed_h = 3;      // How fast it moves horizontally
fly_accel_v = 0.15;   // How fast it accelerates UPWARDS (The curve factor)
max_fly_speed_v = 4;  // Max upward speed cap

// Internal Variables
state = BIRD_STATE.IDLE;       // Can be "IDLE" or "FLYING"
hsp = 0;              // Horizontal Speed
vsp = -1;             // Vertical Speed (Starts slightly up)

idleDuration = 180;
timeUntilHop = 300;

alarm[0] = idleDuration;
alarm[1] = timeUntilHop;

canHop = false;
hopSpeed = 2;
hopDirectionRight = 45;
hopDirectionLeft = 135;
hopGravity = 0.3;