instance_destroy(); 

var _dropletSFX = choose(

	sfx_caveDroplet,
	sfx_caveDroplet2,
	sfx_caveDroplet3,
	sfx_caveDroplet4,
	sfx_caveDroplet5,

);

playAudioWithFalloff(_dropletSFX);
