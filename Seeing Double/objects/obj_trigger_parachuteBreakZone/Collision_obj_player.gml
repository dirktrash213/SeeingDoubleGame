if pitterPlayerIsPresent() {

	if !obj_player_pitter.wearingParachute exit;

} 

if triggered exit;

triggered = true;

audio_play_sound(sfx_deflate, 1, 0);

if pitterPlayerIsPresent() {

	with obj_player_pitter {
	
		wearingParachute = false;
		wearingBrokenParachute = true;
	
	}

}



