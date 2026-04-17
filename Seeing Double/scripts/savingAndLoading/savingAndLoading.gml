//NOTE: if running into saving/loading performance issues, use buffers

global.gameData = {

	roomData : {
	
	
	
	
	
	
	
	}

}

function saveSettings() {

	var _file = file_text_open_write("settings.txt");
	
	file_text_write_real(_file, global.volumeMaster);
	file_text_writeln(_file);
	file_text_write_real(_file, global.volumeSFX);
	file_text_writeln(_file);
	file_text_write_real(_file, global.volumeBGM);
	file_text_writeln(_file);
	file_text_write_real(_file, global.volumeAMB);
	file_text_writeln(_file);
	file_text_write_real(_file, global.fullScreen);
	file_text_writeln(_file);
	file_text_write_real(_file, global.runModeIsToggle);
	file_text_writeln(_file);
	file_text_write_real(_file, global.scoreUIenabled);
	file_text_writeln(_file);
	file_text_write_real(_file, global.assistMode);
	file_text_writeln(_file);

	file_text_close(_file); 

}

function loadSettings() { //Load player's audio, visual, and gameplay settings on game start

	if file_exists("settings.txt") {
	
		var _file = file_text_open_read("settings.txt");
		
		global.volumeMaster = file_text_read_real(_file);
		file_text_readln(_file);
		global.volumeSFX = file_text_read_real(_file);
		file_text_readln(_file);
		global.volumeBGM = file_text_read_real(_file);
		file_text_readln(_file);
		global.volumeAMB = file_text_read_real(_file);
		file_text_readln(_file);
		global.fullScreen = file_text_read_real(_file);
		file_text_readln(_file);
		global.runModeIsToggle = file_text_read_real(_file);
		file_text_readln(_file);
		global.scoreUIenabled = file_text_read_real(_file);
		file_text_readln(_file);
		global.assistMode = file_text_read_real(_file);
		file_text_readln(_file);
		
		file_text_close(_file);
		
	}

}

function saveRoom() {

	var _dataArray = [];

	with obj_pickup_coin {
	
		var _dataStruct = {
		
			objectName: object_get_name(object_index),
			x: x,
			y: y,
			image_index: image_index,
		
		}
		
		array_push(_dataArray, _dataStruct);

	}
	
	with obj_pickup_coin_empty {
	
		var _dataStruct = {
		
			objectName: object_get_name(object_index),
			x: x,
			y: y,
			image_index: image_index,
		
		}
		
		array_push(_dataArray, _dataStruct);

	}
	
	with obj_pickup_coin_temporary {
	
		var _dataStruct = {
		
			objectName: object_get_name(object_index),
			x: x,
			y: y,
			image_index: image_index,
		
		}
		
		array_push(_dataArray, _dataStruct);

	}
	
	with obj_pickup_cherry {
	
		var _dataStruct = {
		
			objectName: object_get_name(object_index),
			x: x,
			y: y,
			image_index: image_index,
			visible: visible,
		
		}
		
		array_push(_dataArray, _dataStruct);

	}
	
	with obj_spawner_cherry {
	
		var _dataStruct = {
		
			objectName: object_get_name(object_index),
			x: x,
			y: y,
			image_index: image_index,
		
		}
		
		array_push(_dataArray, _dataStruct);

	}
	
	with obj_interactable_pot {
	
		var _dataStruct = {
		
			objectName: object_get_name(object_index),
			x: x,
			y: y,
			image_index: image_index,
			triggered: triggered,
		
		}
		
		array_push(_dataArray, _dataStruct);
	
	}
	
	struct_set(global.gameData.roomData, room_get_name(room), _dataArray);
	
}
//@
function saveGame(){

	saveRoom();
	
	var _dataJsonString = json_stringify(global.gameData);

	var _file = file_text_open_write("save.txt");
	
	file_text_write_real(_file, global.coinCount);
	file_text_writeln(_file);
	file_text_write_real(_file, global.cherryCount);
	file_text_writeln(_file);
	file_text_write_real(_file, global.defeatCount);
	file_text_writeln(_file);
	file_text_write_real(_file, global.xRespawnPitter);
	file_text_writeln(_file);
	file_text_write_real(_file, global.yRespawnPitter);
	file_text_writeln(_file);
	file_text_write_real(_file, global.splitScreenActive);
	file_text_writeln(_file);
	file_text_write_real(_file, global.gotScammed);
	file_text_writeln(_file);
	file_text_write_real(_file, global.solvedForestPuzzle); //Add other solve variables
	file_text_writeln(_file);
	file_text_write_real(_file, global.doubleJumpActive);
	file_text_writeln(_file);
	file_text_write_real(_file, global.caughtByForestGhost);
	file_text_writeln(_file);
	file_text_write_real(_file, global.escapedForestGhost);
	file_text_writeln(_file);
	file_text_write_real(_file, global.foundRose);
	file_text_writeln(_file);
	file_text_write_real(_file, global.groundPoundActive);
	file_text_writeln(_file);
	file_text_write_real(_file, global.foundLily);
	file_text_writeln(_file);
	file_text_write_real(_file, global.dashActive);
	file_text_writeln(_file);
	file_text_write_real(_file, global.foundForgetMeNot);
	file_text_writeln(_file);
	file_text_write_real(_file, global.crouchJumpActive);
	file_text_writeln(_file);
	file_text_write_real(_file, global.foundSunflower);
	file_text_writeln(_file);
	file_text_write_real(_file, global.foundTulip);
	file_text_writeln(_file);

	file_text_write_string(_file, _dataJsonString);
	file_text_writeln(_file);
	
	file_text_write_string(_file, global.roomToSpawnIn);
	//file_text_writeln(_file);
	
	file_text_close(_file); 

}

function loadRoom(){

	var _dataArray = struct_get(global.gameData.roomData, room_get_name(room));

	if _dataArray != undefined {
	
		instance_destroy(obj_spawner_cherry);
		instance_destroy(obj_pickup_cherry);
		instance_destroy(obj_pickup_coin_empty);
		instance_destroy(obj_pickup_coin_temporary);
		instance_destroy(obj_pickup_coin);
		instance_destroy(obj_interactable_pot);
		
		for(var i = 0; i < array_length(_dataArray); i++) {
		
			var _dataStruct = _dataArray[i];
			
			var _inst = instance_create_layer(_dataStruct.x, _dataStruct.y, "Instances", asset_get_index(_dataStruct.objectName), _dataStruct);
			
			
			
			if _inst.object_index == obj_pickup_coin_temporary {
			
				instance_create_layer(_inst.x, _inst.y, "Instances", obj_pickup_coin_empty);
				instance_destroy(_inst);
			
			}
		
		}
	
	}

}
//@
function loadGame(){

	if file_exists("save.txt") {
	
		var _file = file_text_open_read("save.txt");
		
		global.coinCount = file_text_read_real(_file);
		file_text_readln(_file);
		global.cherryCount = file_text_read_real(_file);
		file_text_readln(_file);
		global.defeatCount = file_text_read_real(_file);
		file_text_readln(_file);
		global.xRespawnPitter = file_text_read_real(_file);
		file_text_readln(_file);
		global.yRespawnPitter = file_text_read_real(_file);
		file_text_readln(_file);
		global.splitScreenActive = file_text_read_real(_file);
		file_text_readln(_file);
		global.gotScammed = file_text_read_real(_file);
		file_text_readln(_file);
		global.solvedForestPuzzle = file_text_read_real(_file);
		file_text_readln(_file);
		global.doubleJumpActive = file_text_read_real(_file);
		file_text_readln(_file);
		global.caughtByForestGhost = file_text_read_real(_file);
		file_text_readln(_file);
		global.escapedForestGhost = file_text_read_real(_file);
		file_text_readln(_file);
		global.foundRose = file_text_read_real(_file);
		file_text_readln(_file);
		global.groundPoundActive = file_text_read_real(_file);
		file_text_readln(_file);
		global.foundLily = file_text_read_real(_file);
		file_text_readln(_file);
		global.dashActive = file_text_read_real(_file);
		file_text_readln(_file);
		global.foundForgetMeNot = file_text_read_real(_file);
		file_text_readln(_file);
		global.crouchJumpActive = file_text_read_real(_file);
		file_text_readln(_file);
		global.foundSunflower = file_text_read_real(_file);
		file_text_readln(_file);
		global.foundTulip = file_text_read_real(_file);
		file_text_readln(_file);
		
		var _dataJsonString = file_text_read_string(_file);
		file_text_readln(_file);
		
		global.gameData = json_parse(_dataJsonString);
		
		global.roomToSpawnIn = file_text_read_string(_file);
		
		loadRoom();
		
		file_text_close(_file);
	
	}

}