/// @description Async - System (Handle Controllers & Remote Play)
var _type = async_load[? "event_type"];

if (_type == "gamepad discovered") {
    var _pad = async_load[? "pad_index"];
    gamepad_set_axis_deadzone(_pad, 0.3);

    // If Patter doesn't have a gamepad assigned yet, give it to them
    if (global.patterDevice == -1 || !gamepad_is_connected(global.patterDevice)) {
        global.patterDevice = _pad;
    }
}

if (_type == "gamepad lost") {
    var _pad = async_load[? "pad_index"];
    
    // Fall back or reassign if assigned gamepad disconnects
    if (global.pitterDevice == _pad) global.pitterDevice = -1;
    if (global.patterDevice == _pad) global.patterDevice = -1;
}