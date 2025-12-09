xSpeed = 0;
ySpeed = 0;

bonked = false;
secret = false;

inert = false;

if !instance_exists(obj_enemy) exit;

var _enemy = instance_nearest(x, y, obj_enemy);
xSpawn = _enemy.xstart;
ySpawn = _enemy.ystart;

var _enemyDoppleganger = instance_nearest(x, y, obj_enemy_doppleganger);
xSpawnDoppleganger = _enemyDoppleganger.xstart;
ySpawnDoppleganger = _enemyDoppleganger.ystart;

