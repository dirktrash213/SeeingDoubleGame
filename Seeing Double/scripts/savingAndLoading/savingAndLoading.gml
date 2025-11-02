//NOTE: if running into saving/loading performance issues, use buffers

global.gameData = {

	roomData : {
	
	
	
	
	
	
	
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
	
	with obj_pickup_cherry {
	
		var _dataStruct = {
		
			objectName: object_get_name(object_index),
			x: x,
			y: y,
			image_index: image_index,
		
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
	
	


	struct_set(global.gameData.roomData, room_get_name(room), _dataArray);




}

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
		instance_destroy(obj_pickup_coin);
		
		for(var i = 0; i < array_length(_dataArray); i++) {
		
			var _dataStruct = _dataArray[i];
			
			var _inst = instance_create_layer(_dataStruct.x, _dataStruct.y, "Instances", asset_get_index(_dataStruct.objectName), _dataStruct);
		
		}
	
	}

}

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
		
		var _dataJsonString = file_text_read_string(_file);
		file_text_readln(_file);
		
		global.gameData = json_parse(_dataJsonString);
		
		global.roomToSpawnIn = file_text_read_string(_file);
		
		loadRoom();
		
		file_text_close(_file);
	
	}

}