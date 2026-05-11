/*
	By default, the shader adapts to the size of the application surface.
	You can pass your own resolution via the arguments of this function or by using
	the dedicated ones.
*/

// Activating the shader.
bktglitch_activate();
//bktglitch_activate(3000, 3000);

// Getting uniform values from the user interface, you can ignore this.
__bktgtlich_pass_uniforms_from_ui();

/* 
    Remember, all uniforms need to be set for the shader to work.
	bktglitch_activate takes care of the basic ones, though you can
	still set things like time and resolution manually.
	
    This is what a further configuration could look like:
    
        We can choose one of the presets, and tweak only the values we want: 
        
            bktglitch_set_preset(BktGlitch.presetA); 
            bktglitch_set_line_resolution(0.420000);
            bktglitch_set_line_drift(0.249702);
            bktglitch_set_line_vertical_shift(0.713333);
        
        etc..
    
        We can also use configuration one-liners, such as:
    
            bktglitch_config_zero(); - this sets all tweaking parameters to zero
            
            or
            
            bktglitch_config(0.004, 0.01, 1, 0, 0, 0, 5.333, 0.2, 0.15, 0.5, 0.00233, 0.0025, 0.5, 1, 0); - sets all tweaking parameters at once
*/

bktglitch_config_zero();
//bktglitch_config_preset(BktGlitchPreset.E);

// LOGIC: Determine the split value
var _split_value = 0.0; // Default to Full Screen (0.0 means "clean part" is non-existent)

if (enable_split_screen) {
    _split_value = 0.5; // Set split to halfway
}

// Pass the value to the shader
shader_set_uniform_f(u_split_pos, _split_value);

//if global.caughtByForestGhost || global.escapedForestGhost {
//
//	intensity = 0;
//	channelShift = 0;
//	channelDispersion = 0;
//
//}

switch room {

	case rm_forest_caveEntrance: {
	
		bktglitch_set_intensity(intensity);
		bktglitch_set_line_shift(0.001333);
		bktglitch_set_line_speed(0.250000);
		bktglitch_set_line_resolution(1.660000);
		bktglitch_set_line_drift(0.493333);
		bktglitch_set_line_vertical_shift(0.740000);
		bktglitch_set_noise_level(0.353333);
		bktglitch_set_jumbleness(0.300000);
		bktglitch_set_jumble_speed(25.000000);
		bktglitch_set_jumble_resolution(.10000000);
		bktglitch_set_jumble_shift(0.086667);
		bktglitch_set_channel_shift(channelShift);
		bktglitch_set_channel_dispersion(channelDispersion);
		bktglitch_set_shakiness(2.266667);
		bktglitch_set_rng_seed(48.666667);
	
	} break;
	
	default: {
	
		bktglitch_set_intensity(intensity);
		bktglitch_set_line_shift(0.001333);
		bktglitch_set_line_speed(0.250000);
		bktglitch_set_line_resolution(1.660000);
		bktglitch_set_line_drift(0.493333);
		bktglitch_set_line_vertical_shift(0.740000);
		bktglitch_set_noise_level(0.353333);
		bktglitch_set_jumbleness(0.300000);
		bktglitch_set_jumble_speed(25.000000);
		bktglitch_set_jumble_resolution(.10000000);
		bktglitch_set_jumble_shift(0.086667);
		bktglitch_set_channel_shift(channelShift);
		bktglitch_set_channel_dispersion(channelDispersion);
		bktglitch_set_shakiness(2.266667);
		bktglitch_set_rng_seed(48.666667);
	
	} break;

}

//default: {
//
//	//bktglitch_set_intensity(0.20000);
//	bktglitch_set_intensity(0.000000);
//	bktglitch_set_line_shift(0.0005333);
//	bktglitch_set_line_speed(0.250000);
//	bktglitch_set_line_resolution(1.660000);
//	bktglitch_set_line_drift(0.493333);
//	bktglitch_set_line_vertical_shift(0.740000);
//	bktglitch_set_noise_level(0.353333);
//	//bktglitch_set_jumbleness(0.300000);
//	bktglitch_set_jumble_speed(25.000000);
//	bktglitch_set_jumble_resolution(.10000000);
//	bktglitch_set_jumble_shift(0.086667);
//	//bktglitch_set_channel_shift(0.001);
//	//bktglitch_set_channel_dispersion(0.001);
//	//bktglitch_set_channel_shift(0.004);
//	//bktglitch_set_channel_dispersion(0.004);
//	bktglitch_set_shakiness(2.266667);
//	bktglitch_set_rng_seed(48.666667);
//
//} break;
//


// Drawing with shader active! 
// draw_surface(application_surface, 0, 0);
//draw_surface_stretched(application_surface, 0, 0, display_get_gui_width(), display_get_gui_height());
draw_surface_stretched(application_surface, 0, 0, display_get_gui_width(), display_get_gui_height());

// Done with the shader (this is really just shader_reset)!
bktglitch_deactivate();

// Draw the UI normally
//__bktGlitch_ui_draw();