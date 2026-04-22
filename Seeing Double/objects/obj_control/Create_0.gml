xScale = 1;
yScale = 1;

depth = -14000;

typist = scribble_typist();
typist2 = scribble_typist();
//typist.in(0.5, 0.9);
typist.in(0.85, 0.9);
typist.sound(sfx_footstep, false, 1, 1); 

typist2.in(0.85, 0.9);
typist2.sound(sfx_footstep, false, 1, 1); 

//image_alpha = 0.75;

pauseMenuPosition = 0;

pauseMenuSublevel = 0;

submenuType = "";

volumeSliderSprite = spr_UI_volumeSlider_x4;
volumeMuteIcon = spr_UI_volumeIcon_mute_x4;
volumeLoudIcon = spr_UI_volumeIcon_loud_x4;

audioBGMLoaded = false;
audioSFXLoaded = false;
audioAMBLoaded = false;

dividerYscale = 0;
dividerYscaleIncreaseAmount = 2;

audio_group_load(audiogroup_bgm);
audio_group_load(audiogroup_sfx);
audio_group_load(audiogroup_amb);

scammedSFXpitch = 1.0; //0.3
scammedSFXpitchDecreaseAmount = 0.001;

canDrawDivider = true;

//transparentSecretLayer = false;
//layer_alpha_settings("SecretTiles");

//tilemapID = noone;
//tileLayerAlpha = 0.5;

//bgmForest = bgm_inSync;
//bgmCave = bgm_caveDwellers;

bgmForest = bgm_forestNightThemeLoop;
//bgmForest = bgm_relax_in_the_forest_background;
//bgmCave = bgm_in_the_cave;
bgmCave = bgm_dramaticCaveTheme;
bgmCaveRestArea = bgm_burrowedBelow;
bgmCaveChase = bgm_runAway;

//Load player settings
loadSettings();

//Start game in fullscreen if saved settings are fulllscreen
if global.fullScreen window_set_fullscreen(true);

if !audio_is_playing(amb_soft_wind) audio_play_sound(amb_soft_wind, 1, 1);

playerFallingWithBoulder = false; //Tracks if the player is falling with a boulder from one room to another


// Create a custom bus and emitter for your delay effects
reverb_emitter = audio_emitter_create();
reverb_bus = audio_bus_create();
audio_emitter_bus(reverb_emitter, reverb_bus);

// Create the reverb effect
reverb_effect = audio_effect_create(AudioEffectType.Reverb1);
enableSmallReverb();

//reverb_effect.bypass = false;
//reverb_effect.size = 0.25;
//reverb_effect.damp = 0.95;
//reverb_effect.mix = 0.5;

//reverb_effect.bypass = false;
//reverb_effect.size = 0.5;
//reverb_effect.damp = 0.05;
//reverb_effect.mix = 0.5;



// Assign the effect to the first slot of your new bus
reverb_bus.effects[0] = reverb_effect;

// Connect this bus to the main output
//audio_bus_main.bypass = false;