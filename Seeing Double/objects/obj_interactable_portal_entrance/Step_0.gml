switchGreenPortalSprite();
normalizeStretching();
if sprite_index == spr_interactable_portalCircle_idle_green portalFloat();

if !active audio_stop_sound(portal_snd_instance);

if playerIsPresent() {
	
	var _nearestPlayer = instance_nearest(x, y, obj_player);
	
    var _dist = point_distance(x, y, _nearestPlayer.x, _nearestPlayer.y);
    var _max_dist = 300; // Distance where sound is silent
    
    // Calculate volume: 1 at 0px distance, 0 at 600px distance
    var _vol = clamp(1 - (_dist / _max_dist), 0, 0.8);
	
	//show_debug_message("_vol in green portal: " + string(_vol))
    
    // Apply volume to a sound that is already playing
    // (Note: You'd need to start the sound once in the Create event)
    audio_sound_gain(portal_snd_instance, _vol, 0);
	
}