global.devTools = false;

global.steamTracking = false; //ENABLE FOR DEMO AND EA RELEASE
//global.steamStatsReady = false;

global.demoBuild = false; //Determines if this build is the demo version vs full version

window_set_caption("Seeing Double");

global.speedrunTimer = 0;

global.coinCount = 0;
global.cherryCount = 0;
global.coinCountRegional = 0;
global.cherryCountRegional = 0;
global.defeatCount = 0;
global.storedCoins = 0;
global.storedCherries = 0;
//global.grassCount = 0;

global.coinLotsAmount = global.demoBuild ? 800 : 2000; 
global.cherryMax = global.demoBuild ? 34 : 85; 

global.cherryMaxForest = 34;
global.cherryMaxCave = 51;

global.coinLotsAmountForest = 800;
global.coinLotsAmountCave = 1200;

global.paused = false;
global.playerControl = true;

global.playerDefeated = false;
global.playerRespawnTime = 90;
global.roomToSpawnIn = room_get_name(rm_titleScreen);
global.xRespawnPitter = 0;
global.yRespawnPitter = 0;
global.xRespawnPatter = 0;
global.yRespawnPatter = 0;
global.currentCheckpoint = noone;
global.currentCheckpointDefeatCount = 0;

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

global.dontReactivateForestBGM = false;

//Settings
global.volumeMaster = 8;
global.volumeSFX = 8;
global.volumeBGM = 8;
global.volumeAMB = 8;
global.fullScreen = false;
global.runModeIsToggle = false;
global.useScreenShake = true;
global.scoreUIenabled = true;
global.assistMode = true;
global.screenShake = true;

global.titleScreenCherriesEaten = 0;
global.pitterPatterHugging = false;
global.patterBeamedAway = false;

global.moveUp = false;
global.moveDown = false;
global.moveLeft = false;
global.moveRight = false;
global.hasMovedUp = false;
global.hasMovedDown = false;
global.hasMovedLeft = false;
global.hasMovedRight = false;

//THESE TWO VALUES SHOULD NOT BE EDITED
global.defaultPatterOffsetX = 528; 
global.defaultPatterOffsetY = 320;
global.defaultCustomLevelPatterOffsetY = 592;

global.portalsActive = false;
global.portalsActiveStoredValue = false;
global.portalsStoredPatterOffsetY = 320;
//global.portalsActive = true;

global.patterOffsetX = 528; //528
global.patterOffsetY = 320;

global.verticalLevel = false;
global.customLevel = false;

global.cutsceneActive = true;
//global.currentCutsceneID = CUTSCENE_ID.NONE;
global.currentCutsceneID = CUTSCENE_ID.OPENING;
global.titleScreenCutsceneState = TITLE_SCREEN_CUTSCENE_STATE.ON_MENU;

draw_set_font(font_titleMenu);

global.respawnEdgeCases = {

	speedUpForestPlatform : false,

}

global.dialogueVariables = {

	talkedToSmallGhost : false,
	talkedToSmallGhostTwice : false,
	spookedBySmallGhost : false,
	spookedBySmallGhostOver : false,
	talkedToGreenBrother : false,
	talkedToGreenBrotherTwice : false,
	talkedToCrazyGuy : false,
	beatMinigame : false,
	talkedToScammer : false,
	talkedToScammerTwice : false,
	talkedToScammerThrice : false,
	boughtParachuteFromScammer : false,
	jumpedOverParachute : false,
	talkedToExplorer : false,
	talkedToExplorerTwice : false,
	solvedForestPuzzle : false,
	talkedToScaredMiner : false,
	talkedToMiner : false,
	talkedToCamper : false,
	talkedToCamperTwice : false,
	talkedToMinerGroup : false,
	beatCaveMinigame : false,
	solvedCavePuzzle : false,
	talkedToExplorerCave : false,
	talkedToExplorerCaveTwice : false,
	talkedToHungryMiner : false,
	eatenCaveCherry : false,
	talkedToLostMiner : false,
	talkedToLostMinerTwice : false,

}

global.gotScammed = false;
//global.gotScammed = true;


global.caughtByForestGhost = false;
global.escapedForestGhost = false;

global.solvedForestPuzzle = false;
global.solvedCavePuzzle = false;
global.solvedLabPuzzle = false;
global.solvedSewerPuzzle = false;
global.solvedVolcanoPuzzle = false;

global.savedGreenMiner = false;
global.caveChaseOver = false;

global.foundRose = false;
global.foundLily = false;
global.foundForgetMeNot = false;
global.foundSunflower = false;
global.foundTulip = false;

global.caughtByCaveGhostAmount = 0;

// r/playtester 