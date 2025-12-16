/// @description Spawn assist mode shadows

if global.devTools {

	with obj_dev_recorder {

		recording = true;
	    frames = []; // Clear old data
	    show_debug_message("--- RECORDING STARTED ---");

	}

}

if !instance_exists(global.currentCheckpoint) exit;

//Spawn the shadow
var _shadow = instance_create_layer(global.currentCheckpoint.x, global.currentCheckpoint.y, "Instances", obj_assist_shadow);

//Tell the shadow which file to load
_shadow.load_recording(global.currentCheckpoint.assist_file);





