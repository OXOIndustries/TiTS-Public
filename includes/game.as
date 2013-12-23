function mainGameMenu():void {
	//Display shit that happened during time passage.
	if(eventBuffer != "") {
		clearOutput();
		output("<b>" + possessive(pc.short) + " log:</b>" + eventBuffer);
		eventBuffer = "";
		this.userInterface.clearMenu();
		this.userInterface.addButton(0,"Next",mainGameMenu);
		return;
	}
	//Queued events can fire off too!
	//trace("EventQueue = ", eventQueue);
	//trace("this.eventQueue = ", this.eventQueue);
	if(eventQueue.length > 0) {
		//Do the most recent:
		this.eventQueue[this.eventQueue.length-1]();
		//Strip out the most recent:
		this.eventQueue.splice(this.eventQueue.length-1,1);
		return;
	}
	//Set up all appropriate flags
	saveHere = true;
	//Display the room description
	clearOutput();
	output(rooms[currentLocation].description);
	setLocation(rooms[currentLocation].roomName,rooms[currentLocation].planet,rooms[currentLocation].system);
	if(inCombat()) 
		output("\n\n<b>You're still in combat, you ninny!</b>");
	//Standard buttons:
	this.userInterface.clearMenu();
	//Inventory shit
	itemScreen = mainGameMenu;
	lootScreen = inventory;
	this.userInterface.addButton(2,"Inventory",inventory);
	//Other standard buttons

	this.userInterface.addButton(2,"Inventory",inventoryScreen);
	if(pc.lust() < 33) 
		this.userInterface.addDisabledButton(3,"Masturbate");
	else 
		this.userInterface.addButton(3,"Masturbate",masturbateMenu);
	if(!rooms[currentLocation].hasFlag(GLOBAL.BED)) 
		this.userInterface.addButton(4,"Rest",rest);
	else 
		this.userInterface.addButton(4,"Sleep",sleep);
	//Display movement shits - after clear menu for extra options!
	if(rooms[currentLocation].runOnEnter != undefined) {
		if(rooms[currentLocation].runOnEnter()) return;
	}
	if(rooms[currentLocation].northExit) 
		this.userInterface.addButton(6,"North",move,rooms[currentLocation].northExit);
	if(rooms[currentLocation].eastExit) 
		this.userInterface.addButton(12,"East",move,rooms[currentLocation].eastExit);
	if(rooms[currentLocation].southExit) 
		this.userInterface.addButton(11,"South",move,rooms[currentLocation].southExit);
	if(rooms[currentLocation].westExit) 
		this.userInterface.addButton(10,"West",move,rooms[currentLocation].westExit);
	if(rooms[currentLocation].inExit) 
		this.userInterface.addButton(5,rooms[currentLocation].inText,move,rooms[currentLocation].inExit);
	if(rooms[currentLocation].outExit) 
		this.userInterface.addButton(7,rooms[currentLocation].outText,move,rooms[currentLocation].outExit);
	if(currentLocation == shipLocation) 
		this.userInterface.addButton(1,"Enter Ship",move,"SHIP INTERIOR");
	//else userInterface.addButton(1,"Appearance",appearance,pc);
	this.userInterface.addButton(14,"RESET NPCs",initializeNPCs);
}

function inventoryScreen():void {
	clearOutput();
	output("This is a placeholder, yo.");
	this.userInterface.clearMenu();
	this.userInterface.addButton(14,"Back",mainGameMenu);
}
function crew(counter:Boolean = false):Number {
	if(!counter) {
		clearOutput();
		this.userInterface.clearMenu();
	}
	var crewMessages:String = "";
	var count:int = 0;
	if(celiseIsCrew()) {
		count++;
		if(!counter) {
			this.userInterface.addButton(count - 1,"Celise",celiseFollowerInteractions);
			crewMessages += "\n\nCelise is onboard, if you want to go see her. The ship does seem to stay clean of spills and debris with her around.";
		}
	}
	if(!counter) {
		if(count > 0) {
			output("Who of your crew do you wish to interact with?" + crewMessages);
		}
		this.userInterface.addButton(14,"Back",mainGameMenu);
	}
	return count;
}
function rest():void {
	clearOutput();
	if(pc.HPRaw < pc.HPMax()) {
		pc.HP(Math.round(pc.HPMax() * .2));
	}
	var minutes:int = 230 + rand(20) + 1;
	processTime(minutes);
	output("You sit down and rest for around " + num2Text(Math.round(minutes/60)) + " hours.");
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}
function sleep():void {
	clearOutput();
	if(pc.HPRaw < pc.HPMax()) {
		pc.HP(Math.round(pc.HPMax()));
	}
	var minutes:int = 420 + rand(80) + 1
	processTime(minutes);
	output("You lie down and sleep for about " + num2Text(Math.round(minutes/60)) + " hours.");
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

function shipMenu():Boolean {
	rooms["SHIP INTERIOR"].outExit = shipLocation;
	this.userInterface.addButton(9,"Fly",flyMenu);
	if(currentLocation == "SHIP INTERIOR") {
		if(crew(true) > 0) 
			this.userInterface.addButton(8,"Crew",crew);
	}
	return false;
}

function flyMenu():void {
	clearOutput();
	output("Where do you want to go?");
	this.userInterface.clearMenu();
	if(shipLocation != "TAVROS HANGAR") 
		this.userInterface.addButton(0,"Tavros",flyTo,"Tavros");
	if(shipLocation != "SHIP HANGAR") 
		this.userInterface.addButton(1,"Mhen'ga",flyTo,"Mhen'ga");
	this.userInterface.addButton(14,"Back",mainGameMenu);
}

function flyTo(arg:String):void {
	clearOutput();	
	if(arg == "Mhen'ga") {
		shipLocation = "SHIP HANGAR";
		currentLocation = "SHIP HANGAR";
		output("You fly to Mhen'ga");
	}
	else if(arg == "Tavros") {
		shipLocation = "TAVROS HANGAR";
		currentLocation = "TAVROS HANGAR";
		output("You fly to Tavros");
	}
	output(" and step out of your ship.");
	processTime(30270 + rand(10));
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

function move(arg:String):void {
	processTime(rooms[currentLocation].moveMinutes);
	currentLocation = arg;
	var map:* = mapper.generateMap(currentLocation);
	this.userInterface.setMapData(map);
	
	//trace("Printing map for " + currentLocation);
	//mapper.printMap(map);
	//process time here, then back to mainGameMenu!
	mainGameMenu();
}

function statusTick():void {
	for(var x:int = 0; x < pc.statusEffects.length; x++) 
	{
		//If times, count dat shit down.
		if(pc.statusEffects[x].minutesLeft > 0) 
		{
			pc.statusEffects[x].minutesLeft--;
			//TIMER OVER!
			if(pc.statusEffects[x].minutesLeft <= 0) 
			{
				//CERTAIN STATUSES NEED TO CLEAR SOME SHIT.
				if(pc.statusEffects[x].storageName == "Crabbst") 
				{
					pc.physiqueMod -= pc.statusEffects[x].value2;
					pc.reflexesMod += pc.statusEffects[x].value2;
					pc.aimMod += pc.statusEffects[x].value2;
					pc.intelligenceMod += pc.statusEffects[x].value2;
					pc.willpowerMod += pc.statusEffects[x].value2;
				}
				if(pc.statusEffects[x].storageName == "Mead") 
				{
					pc.physiqueMod -= pc.statusEffects[x].value2;
					pc.reflexesMod += pc.statusEffects[x].value2 * .5;
					pc.aimMod += pc.statusEffects[x].value2 * .5;
					pc.intelligenceMod += pc.statusEffects[x].value2 * .5;
					pc.willpowerMod += pc.statusEffects[x].value2 * .5;
				}
				if(pc.statusEffects[x].storageName == "X-Zil-rate")
				{
					pc.physiqueMod -= pc.statusEffects[x].value2;
				}
				if(pc.statusEffects[x].storageName == "Zil Sting")
				{
					pc.reflexesMod += pc.statusEffects[x].value1;
					pc.libidoMod -= pc.statusEffects[x].value1;
				}
				//KILL ZE STATUS
				pc.statusEffects.splice(x,1);
			}
		}
	}
}

function processTime(arg:int):void {
	var x:int = 0;
	var tightnessChanged:Boolean = false;
	if(pc.ballFullness < 100) pc.cumProduced(arg);
	var productionFactor:Number = 100/(1920 * ((pc.libido() * 3 + 100)/100));
	
	//Double time
	if(pc.hasPerk("Extra Ardor")) productionFactor *= 2;
	
	//BOOZE QUADRUPLES TIEM!
	if(pc.hasStatusEffect("X-Zil-rate") || pc.hasStatusEffect("Mead") || pc.hasStatusEffect("X-Zil-rate"))
	productionFactor *= 4;
	
	//Half time.
	else if(pc.hasPerk("Ice Cold")) productionFactor /= 2;
	//Actually apply lust.
	pc.lust(arg * productionFactor);
	
	//Top off shields
	pc.shieldsRaw = pc.shieldsMax();
	
	//loop through every minute
	while(arg > 0) {
		//Check for shit that happens.
		//Actually move time!
		this.userInterface.minutes++;

		//Status Effect Updates
		statusTick();
		
		
		//Tick hours!
		if(this.userInterface.minutes >= 60) {
			this.userInterface.minutes = 0;
			this.userInterface.hours++;
			if(flags["FLAHNE_PISSED"] > 0) {
				flags["FLAHNE_PISSED"]--;
				if(flags["FLAHNE_PISSED"] < 0) flags["FLAHNE_PISSED"] = 0;
			}
			//Hours checks here!
			//Cunt stretching stuff
			if(pc.hasVagina()) {
				for(x = 0; x < pc.totalVaginas(); x++) {
					//Count da stretch cooldown or reset if at minimum.
					if(pc.vaginas[x].looseness > pc.vaginas[x].minLooseness) pc.vaginas[x].shrinkCounter++;
					else pc.vaginas[x].shrinkCounter = 0;
					//Reset for this cunt.
					tightnessChanged = false;
					if(pc.vaginas[x].looseness < 2) {}
					else if(pc.vaginas[x].looseness <= 2 && pc.vaginas[x].shrinkCounter >= 200) tightnessChanged = true;
					else if(pc.vaginas[0].looseness < 4 && pc.vaginas[x].shrinkCounter >= 150) tightnessChanged = true;
					else if(pc.vaginas[0].looseness < 5 && pc.vaginas[x].shrinkCounter >= 110) tightnessChanged = true;
					else if(pc.vaginas[0].looseness >= 5 && pc.vaginas[x].shrinkCounter >= 75) tightnessChanged = true;
					if(tightnessChanged) {
						pc.vaginas[x].looseness--;
						eventBuffer += "\n\n<b>Your </b>";
						if(pc.totalVaginas() > 1) eventBuffer += "<b>" + num2Text2(x+1) + "</b> ";
						eventBuffer += "<b>" + pc.vaginaDescript(x) + " has recovered from its ordeals, tightening up a bit.</b>";
					}
				}
			}
			//Butt stretching stuff
			//Count da stretch cooldown or reset if at minimum.
			if(pc.ass.looseness > pc.ass.minLooseness) pc.ass.shrinkCounter++;
			else pc.ass.shrinkCounter = 0;
			//Reset for this cunt.
			tightnessChanged = false;
			if(pc.ass.looseness < 2) {}
			if(pc.ass.looseness == 2 && pc.ass.shrinkCounter >= 72) tightnessChanged = true;
			if(pc.ass.looseness == 3 && pc.ass.shrinkCounter >= 48) tightnessChanged = true;
			if(pc.ass.looseness == 4 && pc.ass.shrinkCounter >= 24) tightnessChanged = true;
			if(pc.ass.looseness == 5 && pc.ass.shrinkCounter >= 12) tightnessChanged = true;
			if(tightnessChanged) {
				pc.ass.looseness--;
				if(pc.ass.looseness <= 4) eventBuffer += "\n\n<b>Your " + pc.assholeDescript() + " has recovered from its ordeals and is now a bit tighter.</b>";
				else eventBuffer += "\n\n<b>Your " + pc.assholeDescript() + " recovers from the brutal stretching it has received and tightens up.</b>";
			}
			//Cunt snake pregnancy stuff
			if(flags["CUNT_TAIL_PREGNANT_TIMER"] > 0) {
				flags["CUNT_TAIL_PREGNANT_TIMER"]--;
				if(flags["CUNT_TAIL_PREGNANT_TIMER"] == 1) {
					flags["CUNT_TAIL_PREGNANT_TIMER"] = 0;
					eventQueue[eventQueue.length] = giveBirthThroughCuntTail;
				}
			}
			//Days ticks here!
			if(this.userInterface.hours >= 24) {
				this.userInterface.days++;
				this.userInterface.hours = 0;
				//Cunt snake tomfoolery
				if(pc.hasCuntTail()) {
					if(flags["DAYS_SINCE_FED_CUNT_TAIL"] == undefined) flags["DAYS_SINCE_FED_CUNT_TAIL"] = 1;
					else flags["DAYS_SINCE_FED_CUNT_TAIL"]++;
				}
			}
		}
		arg--;
	}
	updatePCStats();
}