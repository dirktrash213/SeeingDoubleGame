var _detectionOffsetY = 10;
var _detectionOffsetYExtra = 5;

// 1. Create a temporary list to hold the results
var __breakableFloorList = ds_list_create();

// 2. Check for collisions and store the count
var _num2 = instance_place_list(x, y+_detectionOffsetY, obj_interactable_breakableFloor, __breakableFloorList, false);

// 3. If we hit something (count > 0)
if (_num2 > 0) {
    // Loop through every object in the list
    for (var i = 0; i < _num2; i++) {
      
        // Get the specific instance ID from the list
        var _inst = __breakableFloorList[| i];
      
        // --- DO YOUR LOGIC HERE ---
        // Example: Break the floor
        with (_inst) {
			triggered = true;
            //instance_destroy();
        }
    }
}

// 4. IMPORTANT: Clean up the list to prevent memory leaks
ds_list_destroy(__breakableFloorList);

// 1. Create a temporary list to hold the results
var __groundPoundFloorList = ds_list_create();

// 2. Check for collisions and store the count
var _num = instance_place_list(x, y+_detectionOffsetY, obj_interactable_groundPoundFloor, __groundPoundFloorList, false);

// 3. If we hit something (count > 0)
if (_num > 0) {
    // Loop through every object in the list
    for (var i = 0; i < _num; i++) {
      
        // Get the specific instance ID from the list
        var _inst = __groundPoundFloorList[| i];
      
        // --- DO YOUR LOGIC HERE ---
        // Example: Break the floor
        with (_inst) {
		
			spawnGroundPoundFloorPieces();
			instance_destroy();
		
        }
    }
}

// 4. IMPORTANT: Clean up the list to prevent memory leaks
ds_list_destroy(__groundPoundFloorList);


coopObjectStepEventCode();

