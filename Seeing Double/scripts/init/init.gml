#macro VIEW_WIDTH 1280
#macro VIEW_HEIGHT 720

//window_set_size(VIEW_WIDTH, VIEW_HEIGHT);


//global.particleSystemHeartsPink = part_system_create();
//global.particleSystemHeartsBlue = part_system_create();
//global.particleSystemDevice = part_system_create();

global.coinCount = 0;
global.cherryCount = 0;
global.defeatCount = 0;

global.playerControl = true;
global.playerDefeated = false;
global.playerRespawnTime = 90;
global.controllerPort = 0;
global.lastInputWasController = false;

global.readytoDisplayTitleScreenMenu = true;
global.titleScreenMenuActive = false;
global.delayBeforeTitleScreen = 300;

global.titleScreenCutsceneState = TITLE_SCREEN_CUTSCENE_STATE.ON_MENU;