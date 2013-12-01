var version:String = "0.01c";
//===****** CHEAT NOTES ******===//
//var my_color:Color = new Color(levelUpButton.plusses);
//my_color.setRGB(0xFF0000); // this will turn mcTarget completly to red
//===***** END CHEATS *****===//

/*leftSideBar Components
sceneTitle
planet
system
monsterHP
monsterHPBar
monsterLust
monsterLustBar
monsterEnergy
monsterEnergyBar
monsterLevel
monsterRace
monsterSex
time
days
sceneBy
sceneByTag

rightSideBar components
nameText
playerHP
playerLust
playerEnergy
playerLevel
playerXP
playerCredits
playerPhysique
playerPhysiqueBar
playerReflexes
playerReflexesBar
playerAim
playerAimBar
playerIntelligence
playerIntelligenceBar
playerWillpower
playerWillpowerBar

central components
mainTextField
scrollbar
*/

//temporary nonsense variables.
temp = 0;


import classes.Creature;
import classes.ItemSlotClass;
import flash.net.registerClassAlias;
import classes.ScriptParser;
import classes.ShipClass;
//import purpleButton;
//import blueButton;
registerClassAlias("Creature", Creature);
registerClassAlias("ItemSlotClass", ItemSlotClass);
registerClassAlias("shipClass", ShipClass);
registerClassAlias("CockClass", CockClass);
registerClassAlias("VaginaClass", VaginaClass);
registerClassAlias("BreastRowClass",BreastRowClass);
registerClassAlias("ItemSlotClass",ItemSlotClass);
registerClassAlias("roomClass",RoomClass);
registerClassAlias("StorageClass",StorageClass);


characters = new Array();
foes = new Array();
textBuffer = new Array("","","","");
//Used for temp buffer stuff
tempText = "";
tempAuthor = "";
currentPCNotes = undefined;
//Used for output()
outputBuffer = "";
outputBuffer2 = "";
authorBuffer = new Array("","","","");
textPage = 4;
days = 0;
hours = 0;
minutes = 0;
eventQueue = new Array();
eventBuffer = "";

//Toggles
silly = false;
easy = false;
debug = false;


//Lazy man state checking
showingPCAppearance = false;
saveHere = false;
location = 0;
shipLocation = 0;

//Pervineer here!
parser = new ScriptParser(this);

setupCharacters();

function setupCharacters():void {
	for(var count:int = 0; count < 100; count++) {
		characters[count] = new Creature();
		trace("Character #" + count + " initialized.");
	}
	foes[0] = new Creature();
	trace("One foe slot initialized.");
}

//Lazy man shortcuts! Need reset after reinitialization of data.
pc = characters[0];
celise = characters[GLOBAL.CELISE];
rival = characters[GLOBAL.RIVAL];
flags = new Dictionary();
initializeFlags();


function initializeFlags():void 
{
	flags = new Dictionary();
	/*
	for (var x:int = 0; x < 10000; x++) {
		flags[x] = undefined;
	}
	*/
}

function setCheatPointers():void {
	pc = characters[0];
	celise = characters[GLOBAL.CELISE];
	rival = characters[GLOBAL.RIVAL];
}