var _pitch = random_range(2.8, 3.2);


playAudioWithFalloff(sfx_mouseChirp, 600, _pitch, false, true);


alarm[1] = squeakTimer + random_range(-squeakTimerVariance, squeakTimerVariance);







