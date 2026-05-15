openWingsTimer = 240;
openWingsTimerVariance = 120;

alarm[0] = openWingsTimer + random_range(-openWingsTimerVariance, openWingsTimerVariance);

state = BAT_STATE.IDLE;



squeakTimer = 180;
squeakTimerVariance = 60;

alarm[1] = squeakTimer + random_range(-squeakTimerVariance, squeakTimerVariance);