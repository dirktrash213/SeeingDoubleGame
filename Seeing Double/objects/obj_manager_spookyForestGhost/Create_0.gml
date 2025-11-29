timer = 0;

timerActive = false;

ambienceFadingIn = false;
ambienceFadingInPoint = 200;
ambienceFadingIn2 = false;
ambienceFadingIn2Point = 1200;
ambienceFadingIn3 = false;
ambienceFadingIn3Point = 2400;


glitchesAppearing = false;
glitchesAppearingPoint = 2400; //600


textAppearing = false;
textAppearingPoint = 3600; //900

textFinishedAppearing = false;
textDuration = 300;

ghostArriving = false;
ghostArrivingPoint = 4200; //1200



ambienceFadingOut = false;
ambienceFadingOutPoint = ghostArrivingPoint + 1800;


ghostDeparting = false;
ghostDepartingPoint = ghostArrivingPoint + 2300;

ghostGone = false;

//audio_play_sound(bgm_abyssalDescent, 1, 1);
//audio_sound_gain(bgm_abyssalDescent, 0, 2);

//audio_play_sound(bgm_ghostlyReverberations, 1, 1);
audio_play_sound(bgm_ghostlyReverberations, 1, 1);
audio_sound_gain(bgm_ghostlyReverberations, 0, 0);

audio_play_sound(bgm_ephemeralEcho, 1, 1);
audio_sound_gain(bgm_ephemeralEcho, 0, 0);

audio_play_sound(bgm_cursedAtmosphere, 1, 1);
audio_sound_gain(bgm_cursedAtmosphere, 0, 0);

audio_play_sound(sfx_glitch_loop, 1, 1);
audio_sound_gain(sfx_glitch_loop, 0, 0);

audio_play_sound(sfx_glitch_loop2, 1, 1);
audio_sound_gain(sfx_glitch_loop2, 0, 0);

typist = scribble_typist();
//typist.in(0.85, 0.9); 
typist.in(0.2, 0.9); 
typist.sound(sfx_footstep, false, 1, 1); 

