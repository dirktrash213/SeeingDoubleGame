
global.coinCount = 0;
global.cherryCount = 0;
global.defeatCount = 0;
//global.grassCount = 0;

global.paused = false;
global.playerControl = true;
global.playerDefeated = false;
global.playerRespawnTime = 90;
global.controllerPort = 0;
global.lastInputWasController = false;

global.readytoDisplayTitleScreenMenu = true;
global.titleScreenMenuActive = false;
global.delayBeforeTitleScreen = 300;

global.cutsceneActive = false;
global.currentCutsceneID = "";
global.titleScreenCutsceneState = TITLE_SCREEN_CUTSCENE_STATE.ON_MENU;

global.splitScreenActive = false;

global.volumeMaster = 5;
global.volumeSFX = 5;
global.volumeBGM = 5;

global.moveUp = false;
global.moveDown = false;
global.moveLeft = false;
global.moveRight = false;
global.hasMovedUp = false;
global.hasMovedDown = false;
global.hasMovedLeft = false;
global.hasMovedRight = false;

draw_set_font(font_titleMenu);