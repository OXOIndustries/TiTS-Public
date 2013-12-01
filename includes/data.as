function dataRouter(d:MouseEvent = undefined):void {
	if(leftSideBar.dataButton.alpha < 1 && d != e) return;
	else if(leftSideBar.dataButton.filters.length > 0) {
		dataOff();
		leftSideBar.dataButton.filters = [];
		hideMenus();
		if(pc.short == "uncreated") mainMenu();
	}
	else {
		hideMenus();
		if(leftSideBar.currentFrame >= 11) leftSideBar.dataButton.filters = [myGlow];
		dataMenu();
	}
}

function dataMenu():void {
	//if(pc.hasStatusEffect("In Creation") || pc.short == "uncreated") saveHere = false;
	clearOutput2();
	output2("You can ");
	if(saveHere) output2("<b>save</b> or ");
	output2("<b>load</b> your data here.");
	if(!saveHere) output2("\n\n<b>You must be at a safe place to save your game.</b>");
	clearGhostMenu();
	addGhostButton(0,"Load",loadGameMenu);
	if(saveHere) addGhostButton(1,"Save",saveGameMenu);
	addGhostButton(14,"Back",dataRouter,e);
}

function saveGameMenu():void {
	clearOutput2();
	output2("<b>Which slot would you like to save in?</b>\n");
	clearGhostMenu();
	var z:int = 0;
	for(var x:int = 1; x <= 14; x++) {
		output2(loadSaveDisplay("TiTS_"+x,String(x)));
		addGhostButton((x-1-z),"Slot " + (x-z),saveGame,"TiTS_" + (x-z));
		if(x == 15) {
			z = 1;
		}
	}
	addGhostButton(14,"Back",dataMenu);
}

function loadGameMenu():void {
	clearOutput2();
	output2("<b>Which slot would you like to load?</b>\n");
	clearGhostMenu();
	var y:String = "";
	var z:int = 0;
	for(var x:int = 1; x <= 14; x++) {
		trace("Looping: " + x);
		y = loadSaveDisplay("TiTS_"+x,String(x));
		output2(y);
		if	(y != (x-z) + ": <b>EMPTY</b>\n\n") 
		{
			addGhostButton(x-1-z,"Slot " + (x-z),loadGame,"TiTS_" + (x-z));
			if(x == 15) {
				z = 1;
			}
		}
	}
	addGhostButton(14,"Back",dataMenu);
}

function loadSaveDisplay(slot:String, slotName:String):String {
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
		holding += "<b>Days:</b> " + saveFile.data.days + "  <b>Gender:</b> ";
		holding += saveFile.data.characters[0].mfn("M","F","A");
		holding += "  <b>Location:</b> " + saveFile.data.location;
		holding += "\n";
		return holding;
	}
	return slotName + ": <b>EMPTY</b>\n\n";
}
/*
function copyDicks(donor:Creature,recipient:Creature):void {
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

function saveGame(slot:String):void {
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
	saveFile.data.notes = currentPCNotes;
	saveFile.data.days = days;
	saveFile.data.minutes = minutes;
	saveFile.data.hours = hours;
	saveFile.data.locationKey = location;
	saveFile.data.shipLocation = shipLocation;
	saveFile.data.location = leftSideBar.planet.text + ", " + leftSideBar.system.text;
	saveFile.data.location = saveFile.data.location.toLowerCase();
	
	saveFile.flush();
	clearOutput2();
	output2("Saved to " + slot + "!");
	clearGhostMenu();
	addGhostButton(14,"Back",dataMenu);
}
function loadGame(slot:String):void {
	clearOutput2();
	//Initialize the save file
	var saveFile;
	saveFile = SharedObject.getLocal(slot,"/");
	//Set a single variable that tells us if this save exists
	if(saveFile.data.exists) {
		currentPCNotes = saveFile.data.notes;
		//Clear character array and load the defaults!
		characters = new Array();
		setupCharacters();
		initializeNPCs();
		
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
		days = saveFile.data.days;
		hours = saveFile.data.hours;
		minutes = saveFile.data.minutes;
		silly = saveFile.data.silly;
		easy = saveFile.data.easy;
		debug = saveFile.data.debug;
		location = saveFile.data.locationKey;
		shipLocation = saveFile.data.shipLocation;
		
		//Set pointers back where they belong!
		setCheatPointers();
		
		//Update display and such!
		hideNPCStats();
		showPCStats();
		updatePCStats();
		output2("Game loaded from " + slot + "!");
		clearGhostMenu();
		addGhostButton(0,"Next",postLoadToZeGame);
		return;
	}
	else output2("Error: Game not loaded.");
	clearGhostMenu();
	addGhostButton(14,"Back",dataMenu);
}

function postLoadToZeGame():void {
	dataOff();
	leftSideBar.dataButton.filters = [];
	hideMenus();
	mainGameMenu();
}