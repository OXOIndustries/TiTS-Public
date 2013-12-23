function dataRouter(d:MouseEvent = undefined):void 
{
	if(this.userInterface.leftSideBar.dataButton.alpha < 1 && d != this.userInterface.tempEvent) 
	{
		return;
	}
	else if(this.userInterface.leftSideBar.dataButton.filters.length > 0) //....... is this checking if the button is enabled? Wut?
	{
		this.userInterface.dataOff();
		this.userInterface.leftSideBar.dataButton.filters = [];
		this.userInterface.hideMenus();
		if(pc.short == "uncreated") 
			mainMenu();
	}
	else 
	{
		this.userInterface.hideMenus();
		this.userInterface.leftSideBar.dataButton.filters = [this.userInterface.myGlow];
		dataMenu();
	}
}

function dataMenu():void 
{
	var outStr:String = ""
	//if(pc.hasStatusEffect("In Creation") || pc.short == "uncreated") saveHere = false;
	clearOutput2();
	outStr += "You can ";
	if(saveHere) outStr += "<b>save</b> or ";
	outStr += "<b>load</b> your data here.";
	if(!saveHere) outStr += "\n\n<b>You must be at a safe place to save your game.</b>";
	this.userInterface.clearGhostMenu();
	this.userInterface.addGhostButton(0,"Load",loadGameMenu);

	output2(outStr);

	if(saveHere) 
		this.userInterface.addGhostButton(1,"Save",saveGameMenu);
	this.userInterface.addGhostButton(14,"Back", dataRouter, this.userInterface.tempEvent);
}

function saveGameMenu():void 
{
	clearOutput2();
	var outStr:String = ""
	outStr += "<b>Which slot would you like to save in?</b>\n";
	this.userInterface.clearGhostMenu();
	var z:int = 0;
	for(var x:int = 1; x <= 14; x++) {
		outStr += loadSaveDisplay("TiTS_"+x,String(x));
		this.userInterface.addGhostButton((x-1-z),"Slot " + (x-z),saveGame,"TiTS_" + (x-z));
		if(x == 15) {
			z = 1;
		}
	}
	output2(outStr);
	this.userInterface.addGhostButton(14,"Back",dataMenu);
}

function loadGameMenu():void 
{
	clearOutput2();
	var outStr:String = ""
	outStr += "<b>Which slot would you like to load?</b>\n";
	this.userInterface.clearGhostMenu();
	var y:String = "";
	var z:int = 0;
	for(var x:int = 1; x <= 14; x++) 
	{
		//trace("Looping: " + x);
		y = loadSaveDisplay("TiTS_"+x, String(x));
		outStr += y;
		if	(y != (x-z) + ": <b>EMPTY</b>\n\n") 
		{
			this.userInterface.addGhostButton(x-1-z,"Slot " + (x-z),loadGame,"TiTS_" + (x-z));
			if(x == 15) {
				z = 1;
			}
		}
	}
	output2(outStr);
	this.userInterface.addGhostButton(14,"Back",dataMenu);
}

function loadSaveDisplay(slot:String, slotName:String):String 
{
	var holding:String = "";
	//Initialize the save file
	var saveFile = SharedObject.getLocal(slot,"/");;
	var pfileHolding:Creature;
	if(saveFile.data.exists)
	{
		if(saveFile.data.notes == undefined) {
			saveFile.data.notes = "No notes available.";
		}
		holding = slotName;
		holding += ": <b>";
		holding += saveFile.data.short;
		holding += "</b> - <i>" + saveFile.data.notes + "</i>\n";
		holding += "	<b>Days:</b> " + saveFile.data.days + "  <b>Gender:</b> ";
		holding += saveFile.data.characters[0].mfn("M","F","A");
		holding += "  <b>Location:</b> " + saveFile.data.location;
		holding += "\n";
		return holding;
	}
	return slotName + ": <b>EMPTY</b>\n\n";
}
/*
function copyDicks(donor:Creature,recipient:Creature):void 
{
	for(var x:int = 0; x < donor.cocks.length; x++) {
		recipient.cocks[0] = new CockClass();
		recipient.cocks[0] = clone(recipient
	}
}*/

function cloneDict(original:Dictionary):Dictionary 
{
	var cloned:Dictionary = new Dictionary();
	for(var key:Object in original) 
	{
		cloned[key] = original[key];
		trace("Key, value = ", key, cloned[key]);
	}
	return cloned;
}

function saveGame(slot:String):void 
{
	//Initialize the save file
	var saveFile;
	saveFile = SharedObject.getLocal(slot,"/");
	//Set a single variable that tells us if this save exists
	saveFile.data.exists = true;
	
	saveFile.data.characters = new Array();
	saveFile.data.short = characters[0].short;
	
	
	
	for(var x:int = 0; x < characters.length; x++) {
		if(characters[x].short != "uncreated") {
			saveFile.data.characters[x] = clone(characters[x]);
		}
	}
	saveFile.data.foes = new Array();
	for(x = 0; x < foes.length; x++) {
		saveFile.data.foes[x] = clone(foes[x]);
	}
	
	//Save flags
	saveFile.data.flags = cloneDict(flags);

	/*
	for (x = 0; x < 10000; x++) {
		saveFile.data.flags[x] = flags[x];
	}
	*/

	//Save crap
	saveFile.data.silly = silly;
	saveFile.data.easy = easy;
	saveFile.data.debug = debug;
	saveFile.data.notes = this.userInterface.currentPCNotes;
	saveFile.data.days = this.userInterface.days;
	saveFile.data.minutes = this.userInterface.minutes;
	saveFile.data.hours = this.userInterface.hours;
	saveFile.data.locationKey = currentLocation;
	saveFile.data.shipLocation = shipLocation;
	saveFile.data.location = this.userInterface.leftSideBar.planet.text + ", " + this.userInterface.leftSideBar.system.text;
	saveFile.data.location = saveFile.data.location.toLowerCase();
	
	saveFile.flush();
	clearOutput2();
	output2("Saved to " + slot + "!");
	this.userInterface.clearGhostMenu();
	this.userInterface.addGhostButton(14,"Back",dataMenu);
}
function loadGame(slot:String):void 
{
	clearOutput2();
	//Initialize the save file
	var saveFile;
	saveFile = SharedObject.getLocal(slot,"/");
	//Set a single variable that tells us if this save exists
	if(saveFile.data.exists) {
		this.userInterface.currentPCNotes = saveFile.data.notes;
		//Clear character array and load the defaults!
		characters = new Array();

		// you don't need to clear this if it's overwritten again in a bit, you know.
		this.setupCharacters();
		this.initializeNPCs();
		
		//Load it up!
		for(var x:int = 0; x < saveFile.data.characters.length; x++) {
			if(saveFile.data.characters[x].short != "uncreated") {
				characters[x] = clone(saveFile.data.characters[x]);
			}
		}
		foes = new Array();
		for(x = 0; x < foes.length; x++) {
			foes[x] = clone(saveFile.data.foes[x]);
		}
		//Load flags
		flags = cloneDict(saveFile.data.flags);
		
		/*
		for (x = 0; x < 10000; x++) {
			flags[x] = saveFile.data.flags[x];
		}
		*/
		
		//Load misc shit
		this.userInterface.days = saveFile.data.days;
		this.userInterface.hours = saveFile.data.hours;
		this.userInterface.minutes = saveFile.data.minutes;
		silly = saveFile.data.silly;
		easy = saveFile.data.easy;
		debug = saveFile.data.debug;
		currentLocation = saveFile.data.locationKey;
		shipLocation = saveFile.data.shipLocation;
		lootList = new Array();		
		
		//Update NPCs that didn't used to exist
		this.initializeNPCs(true);				
		
		//Set pointers back where they belong!
		this.setCheatPointers();
		
		//Update display and such!
		this.hideNPCStats();
		this.showPCStats();
		this.updatePCStats();
		this.output2("Game loaded from " + slot + "!");
		this.userInterface.clearGhostMenu();
		this.userInterface.addGhostButton(0,"Next",postLoadToZeGame);
		return;
	}
	else output2("Error: Game not loaded.");
	this.userInterface.clearGhostMenu();
	this.userInterface.addGhostButton(14,"Back",dataMenu);
}

function postLoadToZeGame():void 
{
	this.userInterface.dataOff();
	this.userInterface.leftSideBar.dataButton.filters = [];
	this.userInterface.hideMenus();
	mainGameMenu();
}



// This is SO MUCH the wrong approach to setting up this sort of thing I can't even express myself properly.
function setupCharacters():void 
{
	for(var count:int = 0; count < 100; count++) {
		characters[count] = new Creature();
		//trace("Character #" + count + " initialized.");
	}
	foes[0] = new Creature();
	trace("One foe slot initialized.");

	trace("Setting up the PC")
	this.pc = new Creature()
}

function initializeFlags():void 
{
	flags = new Dictionary();
	/*
	for (var x:int = 0; x < 10000; x++) {
		flags[x] = undefined;
	}
	*/
}

// arrrrrgh whryyyyy
function setCheatPointers():void 
{
	pc = characters[0];
	celise = characters[GLOBAL.CELISE];
	rival = characters[GLOBAL.RIVAL];
	geoff = characters[GLOBAL.GEOFF];
	flahne = characters[GLOBAL.FLAHNE];
}