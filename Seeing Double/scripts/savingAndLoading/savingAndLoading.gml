//NOTE: if running into saving/loading performance issues, use buffers

global.gameData = {

	roomData : {
	
	
	
	
	
	
	
	}

}

global.settingsData = {
	
	settings : {
	
	
	
	}

}

//@
function saveSettings() {

	global.settingsData.settings = {
		
        volumeMaster: global.volumeMaster,
        volumeSFX: global.volumeSFX,
        volumeBGM: global.volumeBGM,
        volumeAMB: global.volumeAMB,
        fullScreen: global.fullScreen,
        runModeIsToggle: global.runModeIsToggle,
        scoreUIenabled: global.scoreUIenabled,
        assistMode: global.assistMode,
        screenShake: global.screenShake,
        displayGameTime: global.displayGameTime,
        disableSpeedrunForest: global.disableSpeedrunForest,
        disableSpeedrunCave: global.disableSpeedrunCave,
        disableSpeedrunLab: global.disableSpeedrunLab,
        disableSpeedrunSewer: global.disableSpeedrunSewer,
 
    };
	
    var _dataJsonString = json_stringify(global.settingsData);

    //Save to file
    var _file = file_text_open_write("settings.txt");
    file_text_write_string(_file, _dataJsonString);
    file_text_close(_file); 

	

}
//@
function loadSettings() { //Load player's audio, visual, and gameplay settings on game start

	 if (file_exists("settings.txt")) {
        var _file = file_text_open_read("settings.txt");
        var _json = file_text_read_string(_file);
        file_text_close(_file);
        
        // Parse the big JSON string back into a temporary struct
        var _loadData = json_parse(_json);
		
		if !variable_struct_exists(_loadData, "settings") {
		
			show_debug_message("Settings struct not found, creating backup")
		
			_loadData = {
			
				settings : {}
			
			}
		
		}
		
		//show_debug_message("_loadData.settings: " + string(_loadData.settings))
        
        // Safely restore stats using the accessor [$ "name"] 
        // If the key doesn't exist in an old save, it uses the ?? default value
        var _s = _loadData.settings;
        
        global.volumeMaster           = _s[$ "volumeMaster"] ?? 0;
        global.volumeSFX   = _s[$ "volumeSFX"] ?? 0;
        global.volumeBGM   = _s[$ "volumeBGM"] ?? 0;
        global.volumeAMB   = _s[$ "volumeAMB"] ?? 0;
        global.fullScreen   = _s[$ "fullScreen"] ?? false;
        global.runModeIsToggle   = _s[$ "runModeIsToggle"] ?? false;
        global.scoreUIenabled   = _s[$ "scoreUIenabled"] ?? false;
        global.assistMode   = _s[$ "assistMode"] ?? false;
        global.screenShake   = _s[$ "screenShake"] ?? false;
        global.displayGameTime   = _s[$ "displayGameTime"] ?? true; //TEMP, set to false
        global.disableSpeedrunForest   = _s[$ "disableSpeedrunForest"] ?? true;
        global.disableSpeedrunCave   = _s[$ "disableSpeedrunCave"] ?? true;
        global.disableSpeedrunLab   = _s[$ "disableSpeedrunLab"] ?? true;
        global.disableSpeedrunSewer   = _s[$ "disableSpeedrunSewer"] ?? true;

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
function saveGame() {
    // 1. Update the room-specific data first
    saveRoom();
    
    // 2. Pack all global variables into a "stats" struct within gameData
    global.gameData.stats = {
        coinCount: global.coinCount,
        coinCountRegional: global.coinCountRegional,
        cherryCount: global.cherryCount,
        cherryCountRegional: global.cherryCountRegional,
        defeatCount: global.defeatCount,
        xRespawnPitter: global.xRespawnPitter,
        yRespawnPitter: global.yRespawnPitter,
        splitScreenActive: global.splitScreenActive,
        gotScammed: global.gotScammed,
        solvedForestPuzzle: global.solvedForestPuzzle,
        caughtByForestGhost: global.caughtByForestGhost,
        escapedForestGhost: global.escapedForestGhost,
        foundRose: global.foundRose,
		foundLily: global.foundLily,
		foundForgetMeNot: global.foundForgetMeNot,
		foundSunflower: global.foundSunflower,
		foundTulip: global.foundTulip,
		doubleJumpActive: global.doubleJumpActive,
        groundPoundActive: global.groundPoundActive,
        dashActive: global.dashActive,
        crouchJumpActive: global.crouchJumpActive,
        roomToSpawnIn: global.roomToSpawnIn,
		caughtByCaveGhostAmount: global.caughtByCaveGhostAmount,
		caveChaseOver: global.caveChaseOver,
		storedCoins: global.storedCoins,
		storedCherries: global.storedCherries,
		savedGreenMiner: global.savedGreenMiner,
		
		
		
		
		//dialogueVariables: global.dialogueVariables,
		
    };

    // 3. Convert the entire master struct to a single JSON string
    var _dataJsonString = json_stringify(global.gameData);

    // 4. Save to file
    var _file = file_text_open_write("save.txt");
    file_text_write_string(_file, _dataJsonString);
    file_text_close(_file); 
}
//@
function loadGame() {
    if (file_exists("save.txt")) {
        var _file = file_text_open_read("save.txt");
        var _json = file_text_read_string(_file);
        file_text_close(_file);
        
        // Parse the big JSON string back into a temporary struct
        var _loadData = json_parse(_json);
        
        // Safely restore roomData
        if (struct_exists(_loadData, "roomData")) {
            global.gameData.roomData = _loadData.roomData;
        }

        // Safely restore stats using the accessor [$ "name"] 
        // If the key doesn't exist in an old save, it uses the ?? default value
        var _s = _loadData.stats;
        
        global.coinCount           = _s[$ "coinCount"] ?? 0;
        global.coinCountRegional   = _s[$ "coinCountRegional"] ?? 0;
        global.cherryCount         = _s[$ "cherryCount"] ?? 0;
        global.cherryCountRegional = _s[$ "cherryCountRegional"] ?? 0;
        global.defeatCount         = _s[$ "defeatCount"] ?? 0;
        global.xRespawnPitter      = _s[$ "xRespawnPitter"] ?? 0;
        global.yRespawnPitter      = _s[$ "yRespawnPitter"] ?? 0;
        global.splitScreenActive   = _s[$ "splitScreenActive"] ?? false;
        global.gotScammed          = _s[$ "gotScammed"] ?? false;
        global.solvedForestPuzzle  = _s[$ "solvedForestPuzzle"] ?? false;
        global.doubleJumpActive    = _s[$ "doubleJumpActive"] ?? false;
        global.caughtByForestGhost = _s[$ "caughtByForestGhost"] ?? false;
        global.escapedForestGhost  = _s[$ "escapedForestGhost"] ?? false;
        global.foundRose           = _s[$ "foundRose"] ?? false;
        global.groundPoundActive   = _s[$ "groundPoundActive"] ?? false;
        global.foundLily           = _s[$ "foundLily"] ?? false;
        global.dashActive          = _s[$ "dashActive"] ?? false;
        global.foundForgetMeNot    = _s[$ "foundForgetMeNot"] ?? false;
        global.crouchJumpActive    = _s[$ "crouchJumpActive"] ?? false;
        global.foundSunflower      = _s[$ "foundSunflower"] ?? false;
        global.foundTulip          = _s[$ "foundTulip"] ?? false;
        global.roomToSpawnIn       = _s[$ "roomToSpawnIn"] ?? "rm_titleScreen"; // Replace with your actual starting room name
		global.caughtByCaveGhostAmount    = _s[$ "caughtByCaveGhostAmount"] ?? 0;
        global.caveChaseOver    = _s[$ "caveChaseOver"] ?? false;
        global.storedCoins      = _s[$ "storedCoins"] ?? 0;
        global.storedCherries          = _s[$ "storedCherries"] ?? 0;
        global.savedGreenMiner          = _s[$ "savedGreenMiner"] ?? false;
       
	 
	 
	 
	    //global.dialogueVariables          = _s[$ "dialogueVariables"] ?? {};
		
	
        // Re-populate the room based on the newly loaded data
        loadRoom();
    }
}

//function loadGame(){
//    if !file_exists("save.txt") exit;
//
//    var _file = file_text_open_read("save.txt");
//    var _json = file_text_read_string(_file);
//    file_text_close(_file);
//
//    var _loadData = json_parse(_json);
//    
//    // 1. Restore the room data
//    global.gameData.roomData = _loadData.roomData;
//
//    // 2. Safely restore stats
//    var _s = _loadData.stats;
//    
//    // We use "variable_struct_get" or a null-check to provide defaults for old saves
//    global.coinCount   = _s[$ "coinCount"] ?? 0;
//    global.cherryCount = _s[$ "cherryCount"] ?? 0;
//    global.defeatCount = _s[$ "defeatCount"] ?? 0;
//    global.xRespawnPitter = _s[$ "xRespawn"] ?? 100; // Default if missing
//    global.yRespawnPitter = _s[$ "yRespawn"] ?? 100;
//    
//    // This is the "Magic" part: 
//    // If an old save doesn't have 'solvedForestPuzzle', it just stays 'false' 
//    // instead of breaking the whole file.
//    global.solvedForestPuzzle = _s[$ "solvedForestPuzzle"] ?? false;
//    global.doubleJumpActive   = _s[$ "doubleJumpActive"] ?? false;
//    global.roomToSpawnIn      = _s[$ "roomToSpawnIn"] ?? "rm_start";
//
//    loadRoom();
//}

//function loadGameOLD(){
//
//	if file_exists("save.txt") {
//	
//		var _file = file_text_open_read("save.txt");
//		
//		global.coinCount = file_text_read_real(_file);
//		file_text_readln(_file);
//		global.cherryCount = file_text_read_real(_file);
//		file_text_readln(_file);
//		global.defeatCount = file_text_read_real(_file);
//		file_text_readln(_file);
//		global.xRespawnPitter = file_text_read_real(_file);
//		file_text_readln(_file);
//		global.yRespawnPitter = file_text_read_real(_file);
//		file_text_readln(_file);
//		global.splitScreenActive = file_text_read_real(_file);
//		file_text_readln(_file);
//		global.gotScammed = file_text_read_real(_file);
//		file_text_readln(_file);
//		global.solvedForestPuzzle = file_text_read_real(_file);
//		file_text_readln(_file);
//		global.doubleJumpActive = file_text_read_real(_file);
//		file_text_readln(_file);
//		global.caughtByForestGhost = file_text_read_real(_file);
//		file_text_readln(_file);
//		global.escapedForestGhost = file_text_read_real(_file);
//		file_text_readln(_file);
//		global.foundRose = file_text_read_real(_file);
//		file_text_readln(_file);
//		global.groundPoundActive = file_text_read_real(_file);
//		file_text_readln(_file);
//		global.foundLily = file_text_read_real(_file);
//		file_text_readln(_file);
//		global.dashActive = file_text_read_real(_file);
//		file_text_readln(_file);
//		global.foundForgetMeNot = file_text_read_real(_file);
//		file_text_readln(_file);
//		global.crouchJumpActive = file_text_read_real(_file);
//		file_text_readln(_file);
//		global.foundSunflower = file_text_read_real(_file);
//		file_text_readln(_file);
//		global.foundTulip = file_text_read_real(_file);
//		file_text_readln(_file);
//		
//		var _dataJsonString = file_text_read_string(_file);
//		file_text_readln(_file);
//		
//		global.gameData = json_parse(_dataJsonString);
//		
//		global.roomToSpawnIn = file_text_read_string(_file);
//		
//		loadRoom();
//		
//		file_text_close(_file);
//	
//	}
//
//}