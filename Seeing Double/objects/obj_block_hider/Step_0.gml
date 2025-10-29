var _inst = instance_place(x, y, all);

if _inst == noone exit;

if _inst.object_index == obj_player_pitter ||  _inst.object_index == obj_player_patter exit;

_inst.visible = false;







