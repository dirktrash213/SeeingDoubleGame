
global.coinCount = 0;
global.cherryCount = 0;
global.defeatCount = 0;
//global.grassCount = 0;

global.paused = false;
global.playerControl = true;

global.playerDefeated = false;
global.playerRespawnTime = 90;
global.roomToSpawnIn = room_get_name(rm_titleScreen);
global.xRespawnPitter = 0;
global.yRespawnPitter = 0;
global.xRespawnPatter = 0;
global.yRespawnPatter = 0;

global.layer_alpha = 1;

global.controllerPort = 0;
global.lastInputWasController = false;

global.readytoDisplayTitleScreenMenu = true;
global.titleScreenMenuActive = false;
global.delayBeforeTitleScreen = 300;

global.playerDefaultGrav = 0.275;

global.splitScreenActive = false;

global.doubleJumpActive = false;
global.groundPoundActive = false;
global.dashActive = false;
global.crouchJumpActive = false;


global.volumeMaster = 8;
global.volumeSFX = 8;
global.volumeBGM = 8;

global.moveUp = false;
global.moveDown = false;
global.moveLeft = false;
global.moveRight = false;
global.hasMovedUp = false;
global.hasMovedDown = false;
global.hasMovedLeft = false;
global.hasMovedRight = false;

global.patterOffsetX = 528; //528
global.patterOffsetY = 320;

global.verticalLevel = false;

global.cutsceneActive = true;
//global.currentCutsceneID = CUTSCENE_ID.NONE;
global.currentCutsceneID = CUTSCENE_ID.OPENING;
global.titleScreenCutsceneState = TITLE_SCREEN_CUTSCENE_STATE.ON_MENU;

draw_set_font(font_titleMenu);

global.dialogueVariables = {

	talkedToGreenBrother : false,
	talkedToGreenBrotherTwice : false,
	talkedToScammer : false,
	talkedToScammerTwice : false,
	talkedToScammerThrice : false,
	boughtParachuteFromScammer : false,
	jumpedOverParachute : false,
	talkedToExplorer : false,
	talkedToExplorerTwice : false,
	solvedForestPuzzle : false,

}

global.gotScammed = false;
global.solvedForestPuzzle = false;

global.caughtByForestGhost = false;
global.escapedForestGhost = false;