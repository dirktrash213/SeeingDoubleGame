wrapAmount = 455;

var _epicGamer = "";

var _speedsterText = global.speedrunTimer <= -50000 ? "\nYou move with purpose." : "";
var _noDeathsText = global.defeatCount <= 0 ? "\nYou have kept something precious alive." : "";
var _moneybagsText = global.coinCount >= global.coinLotsAmount ? "\nYou have gathered funds for a future." : "";
var _allCherriesText = global.cherryCount >= global.cherryMax ? "\nYou have recovered the lost picnic contents." : "";
var _foundRoseText = global.foundRose ? "\nYou have found something sentimental." : "";
//var _noDeathsText = global.defeatCount <= 0 ? "\nNot a single death!? What a gamer!" : "";
//var _moneybagsText = global.coinCount >= global.coinLotsAmount ? "\nLook at Mr. Moneybags over here!" : "";
//var _allCherriesText = global.cherryCount >= global.cherryMax ? "\nYou got all the cherries! Nice hunting!" : "";



dialogueString[0] = "";
dialogueString[1] = "";
dialogueString[2] = "";
dialogueString[3] = "";
dialogueString[4] = "";
dialogueString[5] = "";
dialogueString[6] = "Coins: [spr_interactable_coin]" + string(global.coinCount)
+ "\nCherries: [spr_interactable_cherry]" + string(global.cherryCount) + "/" + string(global.cherryMax)
+ "\nDeaths: [spr_pitter_defeat][spr_patter_defeat]" + string(global.defeatCount)
+ _noDeathsText
+ _moneybagsText
+ _allCherriesText
+ _foundRoseText;