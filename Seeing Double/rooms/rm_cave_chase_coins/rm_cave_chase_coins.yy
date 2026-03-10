{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rm_cave_chase_coins",
  "creationCodeFile": "rooms/rm_cave_chase_coins/RoomCreationCode.gml",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_45787CB1_3_1_1_1_1_1_4_1_1_1","path":"rooms/rm_cave_chase_coins/rm_cave_chase_coins.yy",},
    {"name":"inst_6967D5E1_4_1_1_1_1_1_4_1_1_1","path":"rooms/rm_cave_chase_coins/rm_cave_chase_coins.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Collision","depth":0,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"SecretTiles","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":37,"SerialiseWidth":120,"TileCompressedData":[
-60,0,-60,-2147483648,-60,0,-60,-2147483648,-60,0,-60,-2147483648,-60,0,-60,-2147483648,-60,0,-60,-2147483648,-60,0,-60,-2147483648,-60,0,-60,-2147483648,-60,0,-60,-2147483648,-60,0,-60,-2147483648,-60,0,-60,-2147483648,-60,0,-60,-2147483648,-60,0,-60,-2147483648,-60,0,-60,-2147483648,-60,0,-60,-2147483648,-60,0,-60,-2147483648,-60,0,-60,-2147483648,-60,0,-60,-2147483648,-60,0,-60,-2147483648,-60,0,-60,-2147483648,-60,0,-60,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,
-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-31,0,-89,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tiles_standard","path":"tilesets/tiles_standard/tiles_standard.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Triggers","depth":200,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_45787CB1_3_1_1_1_1_1_4_1_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_trigger_defeat","path":"objects/obj_trigger_defeat/obj_trigger_defeat.yy",},"properties":[],"rotation":0.0,"scaleX":127.0,"scaleY":1.0,"x":-16.0,"y":288.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6967D5E1_4_1_1_1_1_1_4_1_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_trigger_defeat","path":"objects/obj_trigger_defeat/obj_trigger_defeat.yy",},"properties":[],"rotation":0.0,"scaleX":127.0,"scaleY":1.0,"x":-16.0,"y":608.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"ForegroundTiles","depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":37,"SerialiseWidth":120,"TileCompressedData":[
-132,-2147483648,1,0,-14,-2147483648,-3,0,-102,-2147483648,1,0,-119,-2147483648,-18,0,-100,-2147483648,2,0,-2147483648,-18,0,-99,-2147483648,-21,0,-99,-2147483648,-21,0,-99,-2147483648,-2,0,1,-2147483648,-18,0,-90,-2147483648,-17,0,1,-2147483648,-3,0,1,-2147483648,-8,0,-90,-2147483648,-17,0,1,-2147483648,-3,0,1,-2147483648,-8,0,-90,-2147483648,-17,0,-2,-2147483648,3,0,-2147483648,-2147483648,-8,0,-90,-2147483648,-17,0,-2,-2147483648,3,0,-2147483648,-2147483648,-8,0,-90,-2147483648,-17,0,1,-2147483648,-3,0,1,-2147483648,-8,0,-90,-2147483648,-27,0,-93,-2147483648,-27,0,-93,-2147483648,-27,0,-93,-2147483648,-27,0,-2493,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tiles_standard_transparent","path":"tilesets/tiles_standard_transparent/tiles_standard_transparent.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Collectables","depth":400,"effectEnabled":true,"effectType":null,"gridX":8,"gridY":8,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":500,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"LevelTiles","depth":600,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":37,"SerialiseWidth":120,"TileCompressedData":[
-10,136,1,137,-3,0,1,135,-28,136,5,137,275,276,277,135,-12,136,-60,-2147483648,-4,136,1,134,-5,156,1,157,-3,0,1,155,-4,156,1,154,-23,136,5,137,295,296,297,135,-12,136,-60,-2147483648,-3,136,2,134,157,-14,0,1,155,-6,156,1,154,-4,136,1,134,-3,156,1,154,-7,136,5,137,315,316,317,135,-12,136,-60,-2147483648,-2,136,2,134,157,-22,0,1,155,-4,156,1,157,-3,-2147483648,1,155,-5,156,3,154,136,137,-3,-2147483648,1,135,-3,136,1,134,-6,156,2,154,136,-60,-2147483648,3,
136,134,157,-27,0,-11,-2147483648,3,155,156,157,-3,-2147483648,1,155,-3,156,1,157,-6,-2147483648,2,155,156,-60,-2147483648,2,156,157,-28,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-5,0,1,115,-4,116,1,117,-19,0,-90,-2147483648,-4,0,2,115,174,-4,136,1,157,-19,0,-90,-2147483648,-3,0,2,115,174,-3,136,2,134,157,-20,0,-90,-2147483648,-2,0,2,115,174,-3,136,2,134,157,-21,0,-90,-2147483648,-2,116,2,174,134,-3,156,1,157,-22,0,-90,-2147483648,-3,136,1,137,-26,0,-90,-2147483648,-3,136,1,137,-26,
0,-90,-2147483648,-3,136,1,137,-26,0,-90,-2147483648,-3,136,1,114,-56,116,-60,-2147483648,-60,49,-60,-2147483648,-60,49,-60,-2147483648,-60,49,-60,-2147483648,-10,136,1,137,-3,0,1,135,-28,136,5,137,275,276,277,135,-12,136,-60,-2147483648,-4,136,1,134,-5,156,1,157,-3,0,1,155,-4,156,1,154,-23,136,5,137,295,296,297,135,-12,136,-60,-2147483648,-3,136,2,134,157,-14,0,1,155,-6,156,1,154,-4,136,1,134,-3,156,1,154,-7,136,5,137,315,316,317,135,-12,136,-60,-2147483648,-2,136,2,134,157,-22,0,1,
155,-4,156,1,157,-3,-2147483648,1,155,-5,156,3,154,136,137,-3,-2147483648,1,135,-3,136,1,134,-6,156,2,154,136,-60,-2147483648,3,136,134,157,-27,0,-11,-2147483648,3,155,156,157,-3,-2147483648,1,155,-3,156,1,157,-6,-2147483648,2,155,156,-60,-2147483648,2,156,157,-28,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-5,0,1,115,-4,116,1,117,-19,0,-90,-2147483648,-4,0,2,115,174,-4,136,1,157,-19,0,-90,-2147483648,-3,0,2,115,174,-3,136,2,134,157,-20,0,-90,-2147483648,-2,0,2,115,174,-3,136,2,134,
157,-21,0,-90,-2147483648,-2,116,2,174,134,-3,156,1,157,-22,0,-90,-2147483648,-3,136,1,137,-26,0,-90,-2147483648,-3,136,1,137,-26,0,-90,-2147483648,-3,136,1,137,-26,0,-90,-2147483648,-3,136,1,114,-56,116,-60,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tiles_standard","path":"tilesets/tiles_standard/tiles_standard.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"BackgroundTiles","depth":700,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":37,"SerialiseWidth":120,"TileCompressedData":[
-735,-2147483648,1,268435752,-6,-2147483648,1,291,-227,-2147483648,1,296,-118,-2147483648,1,268435672,-230,-2147483648,-5,131,-17,-2147483648,1,268435672,-97,-2147483648,-4,131,1,268435752,-9,-2147483648,1,268435672,-105,-2147483648,-5,131,-5,-2147483648,-2,0,-14,-2147483648,1,268435752,-103,-2147483648,-2,0,-1443,-2147483648,1,268435752,-6,-2147483648,1,291,-227,-2147483648,1,296,-118,-2147483648,4,268435672,-2147483648,-2147483648,0,-119,-2147483648,1,0,-107,-2147483648,-5,131,-7,-2147483648,1,0,-9,-2147483648,1,268435672,-97,-2147483648,-4,131,1,268435752,-6,-2147483648,-3,0,1,268435672,-105,-2147483648,-5,131,-5,-2147483648,-4,0,-12,-2147483648,1,268435752,-103,-2147483648,3,131,0,0,-347,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tiles_standard_background","path":"tilesets/tiles_standard_background/tiles_standard_background.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"BackgroundTilesDistant","depth":800,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":37,"SerialiseWidth":120,"TileCompressedData":[
-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,
-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tiles_standard_background_distant","path":"tilesets/tiles_standard_background_distant/tiles_standard_background_distant.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4278190080,"depth":900,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "parent": {
    "name": "Rooms",
    "path": "folders/Rooms.yy",
  },
  "parentRoom": null,
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 588,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 1920,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":270,"inherit":false,"objectId":null,"vborder":32,"visible":true,"vspeed":-1,"wport":1920,"wview":480,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":270,"inherit":false,"objectId":null,"vborder":32,"visible":true,"vspeed":-1,"wport":1366,"wview":480,"xport":0,"xview":0,"yport":0,"yview":320,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": false,
    "enableViews": true,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}