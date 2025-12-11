/// @description Spawn assist mode shadows

//Spawn the shadow
var _shadow = instance_create_layer(global.currentCheckpoint.x, global.currentCheckpoint.y, "Instances", obj_assist_shadow);

//Tell the shadow which file to load
_shadow.load_recording(global.currentCheckpoint.assist_file);





