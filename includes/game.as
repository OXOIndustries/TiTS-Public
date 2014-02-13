
public function get canSaveAtCurrentLocation():Boolean
{

	if(inCombat()) 
		return false;

	if (this.inSceneBlockSaving)
		return false;

	return this.rooms[this.currentLocation].canSaveInRoom
}

public function mainGameMenu():void {
	flags["COMBAT MENU SEEN"] = undefined;
	//Display shit that happened during time passage.
	if(eventBuffer != "") {
		clearOutput();
		output("<b>" + possessive(this.chars["PC"].short) + " log:</b>" + eventBuffer);
		eventBuffer = "";
		this.clearMenu();
		this.addButton(0,"Next",mainGameMenu);
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
	//Display the room description
	clearOutput();
	output(this.rooms[this.currentLocation].description);
	setLocation(this.rooms[this.currentLocation].roomName,this.rooms[this.currentLocation].planet,this.rooms[this.currentLocation].system);
	if(inCombat()) 
		output("\n\n<b>You're still in combat, you ninny!</b>");
	//Standard buttons:
	this.clearMenu(false);
	this.inSceneBlockSaving = false
	//Inventory shit
	itemScreen = mainGameMenu;
	lootScreen = inventory;
	this.addButton(2,"Inventory",inventory);
	//Other standard buttons

	if(this.chars["PC"].lust() < 33) 
		this.addDisabledButton(3,"Masturbate");
	else 
		this.addButton(3,"Masturbate",masturbateMenu);
	if(!this.rooms[this.currentLocation].hasFlag(GLOBAL.BED)) 
		this.addButton(4,"Rest",rest);
	else 
		this.addButton(4,"Sleep",sleep);
	//Display movement shits - after clear menu for extra options!
	if(this.rooms[this.currentLocation].runOnEnter != undefined) {
		if(this.rooms[this.currentLocation].runOnEnter()) return;
	}
	//Turn off encounters since you're already here. Moving clears this.
	flags["ENCOUNTERS_DISABLED"] = 1;

	if(this.rooms[this.currentLocation].northExit) 
		this.addButton(6,"North",move,this.rooms[this.currentLocation].northExit);
	if(this.rooms[this.currentLocation].eastExit) 
		this.addButton(12,"East",move,this.rooms[this.currentLocation].eastExit);
	if(this.rooms[this.currentLocation].southExit) 
		this.addButton(11,"South",move,this.rooms[this.currentLocation].southExit);
	if(this.rooms[this.currentLocation].westExit) 
		this.addButton(10,"West",move,this.rooms[this.currentLocation].westExit);
	if(this.rooms[this.currentLocation].inExit) 
		this.addButton(5,this.rooms[this.currentLocation].inText,move,this.rooms[this.currentLocation].inExit);
	if(this.rooms[this.currentLocation].outExit) 
		this.addButton(7,this.rooms[this.currentLocation].outText,move,this.rooms[this.currentLocation].outExit);
	if(this.currentLocation == shipLocation) 
		this.addButton(1,"Enter Ship",move,"SHIP INTERIOR");


	this.addButton(14, "RESET NPCs", initializeNPCs);
	
	// Show the minimap too!
	this.userInterface.showMinimap();
}


function crew(counter:Boolean = false):Number {
	if(!counter) {
		clearOutput();
		this.clearMenu();
	}
	var crewMessages:String = "";
	var count:int = 0;
	if(celiseIsCrew()) {
		count++;
		if(!counter) {
			this.addButton(count - 1,"Celise",celiseFollowerInteractions);
			crewMessages += "\n\nCelise is onboard, if you want to go see her. The ship does seem to stay clean of spills and debris with her around.";
		}
	}
	if(!counter) {
		if(count > 0) {
			output("Who of your crew do you wish to interact with?" + crewMessages);
		}
		this.addButton(14,"Back",mainGameMenu);
	}
	return count;
}
function rest():void {
	//Turn encounters back on.
	flags["ENCOUNTERS_DISABLED"] = undefined;

	clearOutput();
	if(this.chars["PC"].HPRaw < this.chars["PC"].HPMax()) {
		this.chars["PC"].HP(Math.round(this.chars["PC"].HPMax() * .2));
	}
	if(this.chars["PC"].energy() < this.chars["PC"].energyMax()) {
		this.chars["PC"].energy(Math.round(this.chars["PC"].energyMax() * .2));
	}
	var minutes:int = 230 + rand(20) + 1;
	processTime(minutes);
	output("You sit down and rest for around " + num2Text(Math.round(minutes/60)) + " hours.");
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}
function sleep(outputs:Boolean = true):void {
	//Turn encounters back on.
	flags["ENCOUNTERS_DISABLED"] = undefined;
	var minutes:int = 420 + rand(80) + 1
	if(outputs) 
	{
		clearOutput();
		if(pc.XPRaw >= pc.XPMax() && pc.level < 5) {
			levelUp();
			return;
		}
		//CELISE NIGHT TIME BEDTIMEZ
		if(celiseIsCrew())
		{
			celiseOffersToBeYourBedSenpai();
			return;
		}
		output("You lie down and sleep for about " + num2Text(Math.round(minutes/60)) + " hours.");
	}
	if(this.chars["PC"].HPRaw < this.chars["PC"].HPMax()) {
		this.chars["PC"].HP(Math.round(this.chars["PC"].HPMax()));
	}
	if(this.chars["PC"].energy() < this.chars["PC"].energyMax()) this.chars["PC"].energyRaw = this.chars["PC"].energyMax()
	processTime(minutes);
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

function shipMenu():Boolean {
	rooms["SHIP INTERIOR"].outExit = shipLocation;
	this.addButton(9,"Fly",flyMenu);

	if(shipLocation == "TAVROS HANGAR") {
		setLocation("SHIP\nINTERIOR","TAVROS STATION","SYSTEM: KALAS");
	}
	else if(shipLocation == "SHIP HANGAR") {
		setLocation("SHIP\nINTERIOR","MHEN'GA","SYSTEM: ARA ARA");
	}
	if(currentLocation == "SHIP INTERIOR") {
		if(crew(true) > 0) {
			this.addButton(8,"Crew",crew);
		}
	}
	return false;
}

function flyMenu():void {
	clearOutput();
	output("Where do you want to go?");
	this.clearMenu();
	if(shipLocation != "TAVROS HANGAR") 
		this.addButton(0,"Tavros",flyTo,"Tavros");
	if(shipLocation != "SHIP HANGAR") 
		this.addButton(1,"Mhen'ga",flyTo,"Mhen'ga");
	this.addButton(14,"Back",mainGameMenu);
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
	processTime(600 + rand(30));
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

function move(arg:String, goToMainMenu:Boolean = true):void {
	//Reset the thing that disabled encounters
	flags["ENCOUNTERS_DISABLED"] = undefined;
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
	var shitToCut:Array = new Array();
	for(var x:int = 0; x < this.chars["PC"].statusEffects.length; x++) 
	{
		//If times, count dat shit down.
		if(this.chars["PC"].statusEffects[x].minutesLeft > 0) 
		{
			this.chars["PC"].statusEffects[x].minutesLeft--;
			//TIMER OVER!
			if(this.chars["PC"].statusEffects[x].minutesLeft <= 0) 
			{
				//CERTAIN STATUSES NEED TO CLEAR SOME SHIT.
				if(this.chars["PC"].statusEffects[x].storageName == "Crabbst") 
				{
					this.chars["PC"].physiqueMod -= this.chars["PC"].statusEffects[x].value2;
					this.chars["PC"].reflexesMod += this.chars["PC"].statusEffects[x].value2;
					this.chars["PC"].aimMod += this.chars["PC"].statusEffects[x].value2;
					this.chars["PC"].intelligenceMod += this.chars["PC"].statusEffects[x].value2;
					this.chars["PC"].willpowerMod += this.chars["PC"].statusEffects[x].value2;
				}
				if(this.chars["PC"].statusEffects[x].storageName == "Mead") 
				{
					this.chars["PC"].physiqueMod -= this.chars["PC"].statusEffects[x].value2;
					this.chars["PC"].reflexesMod += this.chars["PC"].statusEffects[x].value2 * .5;
					this.chars["PC"].aimMod += this.chars["PC"].statusEffects[x].value2 * .5;
					this.chars["PC"].intelligenceMod += this.chars["PC"].statusEffects[x].value2 * .5;
					this.chars["PC"].willpowerMod += this.chars["PC"].statusEffects[x].value2 * .5;
				}
				if(this.chars["PC"].statusEffects[x].storageName == "X-Zil-rate")
				{
					this.chars["PC"].physiqueMod -= this.chars["PC"].statusEffects[x].value2;
					trace("X-Zil-rate Expired: " + this.chars["PC"].statusEffects[x].value2);
				}
				if(this.chars["PC"].statusEffects[x].storageName == "Zil Sting")
				{
					this.chars["PC"].reflexesMod += this.chars["PC"].statusEffects[x].value1;
					this.chars["PC"].libidoMod -= this.chars["PC"].statusEffects[x].value1;
				}
				if (pc.statusEffects[x].storageName == "Naleen Venom")
				{
					pc.physiqueMod += pc.statusEffects[x].value1;
					pc.aimMod += pc.statusEffects[x].value1;
					pc.willpowerMod += pc.statusEffects[x].value1;
					pc.reflexesMod += pc.statusEffects[x].value1;
				}
				//Mark out the ones that need cut!
				shitToCut[shitToCut.length] = x;
			}
			
		}
	}
	//Cut the statuses that expired and need cut.
	while(shitToCut.length > 0)
	{
		trace("REMOVING " + chars["PC"].statusEffects.storageName);
		this.chars["PC"].statusEffects.splice(shitToCut[shitToCut.length-1],1);
		shitToCut.splice(shitToCut.length-1,1);
	}
}

public function processTime(arg:int):void {
	var x:int = 0;
	var tightnessChanged:Boolean = false;
	if(this.chars["PC"].ballFullness < 100) this.chars["PC"].cumProduced(arg);
	var productionFactor:Number = 100/(1920) * ((this.chars["PC"].libido() * 3 + 100)/100);
	
	//Double time
	if(this.chars["PC"].hasPerk("Extra Ardor")) productionFactor *= 2;
	
	//BOOZE QUADRUPLES TIEM!
	if(this.chars["PC"].hasStatusEffect("X-Zil-rate") || this.chars["PC"].hasStatusEffect("Mead") || this.chars["PC"].hasStatusEffect("X-Zil-rate"))
	productionFactor *= 4;
	
	//Half time.
	else if(this.chars["PC"].hasPerk("Ice Cold")) productionFactor /= 2;
	//Actually apply lust.
	this.chars["PC"].lust(arg * productionFactor);
	
	//Top off shields
	this.chars["PC"].shieldsRaw = this.chars["PC"].shieldsMax();
	
	//loop through every minute
	while(arg > 0) {
		//Check for shit that happens.
		//Actually move time!
		this.minutes++;

		//Status Effect Updates
		statusTick();
		
		
		//Tick hours!
		if(this.minutes >= 60) {
			this.minutes = 0;
			this.hours++;
			if(flags["FLAHNE_PISSED"] > 0) {
				flags["FLAHNE_PISSED"]--;
				if(flags["FLAHNE_PISSED"] < 0) flags["FLAHNE_PISSED"] = 0;
			}
			//Hours checks here!
			//Cunt stretching stuff
			if(this.chars["PC"].hasVagina()) {
				for(x = 0; x < this.chars["PC"].totalVaginas(); x++) {
					//Count da stretch cooldown or reset if at minimum.
					if(this.chars["PC"].vaginas[x].looseness > this.chars["PC"].vaginas[x].minLooseness) this.chars["PC"].vaginas[x].shrinkCounter++;
					else this.chars["PC"].vaginas[x].shrinkCounter = 0;
					//Reset for this cunt.
					tightnessChanged = false;
					if(this.chars["PC"].vaginas[x].looseness < 2) {}
					else if(this.chars["PC"].vaginas[x].looseness <= 2 && this.chars["PC"].vaginas[x].shrinkCounter >= 200) tightnessChanged = true;
					else if(this.chars["PC"].vaginas[0].looseness < 4 && this.chars["PC"].vaginas[x].shrinkCounter >= 150) tightnessChanged = true;
					else if(this.chars["PC"].vaginas[0].looseness < 5 && this.chars["PC"].vaginas[x].shrinkCounter >= 110) tightnessChanged = true;
					else if(this.chars["PC"].vaginas[0].looseness >= 5 && this.chars["PC"].vaginas[x].shrinkCounter >= 75) tightnessChanged = true;
					if(tightnessChanged) {
						this.chars["PC"].vaginas[x].looseness--;
						eventBuffer += "\n\n<b>Your </b>";
						if(this.chars["PC"].totalVaginas() > 1) eventBuffer += "<b>" + num2Text2(x+1) + "</b> ";
						eventBuffer += "<b>" + this.chars["PC"].vaginaDescript(x) + " has recovered from its ordeals, tightening up a bit.</b>";
					}
				}
			}
			//Butt stretching stuff
			//Count da stretch cooldown or reset if at minimum.
			if(this.chars["PC"].ass.looseness > this.chars["PC"].ass.minLooseness) this.chars["PC"].ass.shrinkCounter++;
			else this.chars["PC"].ass.shrinkCounter = 0;
			//Reset for this cunt.
			tightnessChanged = false;
			if(this.chars["PC"].ass.looseness < 2) {}
			if(this.chars["PC"].ass.looseness == 2 && this.chars["PC"].ass.shrinkCounter >= 72) tightnessChanged = true;
			if(this.chars["PC"].ass.looseness == 3 && this.chars["PC"].ass.shrinkCounter >= 48) tightnessChanged = true;
			if(this.chars["PC"].ass.looseness == 4 && this.chars["PC"].ass.shrinkCounter >= 24) tightnessChanged = true;
			if(this.chars["PC"].ass.looseness == 5 && this.chars["PC"].ass.shrinkCounter >= 12) tightnessChanged = true;
			if(tightnessChanged) {
				this.chars["PC"].ass.looseness--;
				if(this.chars["PC"].ass.looseness <= 4) eventBuffer += "\n\n<b>Your " + this.chars["PC"].assholeDescript() + " has recovered from its ordeals and is now a bit tighter.</b>";
				else eventBuffer += "\n\n<b>Your " + this.chars["PC"].assholeDescript() + " recovers from the brutal stretching it has received and tightens up.</b>";
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
			if(this.hours >= 24) {
				this.days++;
				this.hours = 0;
				//Cunt snake tomfoolery
				if(this.chars["PC"].hasCuntTail()) {
					if(flags["DAYS_SINCE_FED_CUNT_TAIL"] == undefined) flags["DAYS_SINCE_FED_CUNT_TAIL"] = 1;
					else flags["DAYS_SINCE_FED_CUNT_TAIL"]++;
				}
				//Reset 'dem venus pitcher hoz
				if(currentLocation != "OVERGROWN ROCK 12" && flags["ROOM_80_VENUS_PITCHER_ASLEEP"] != undefined) flags["ROOM_80_VENUS_PITCHER_ASLEEP"] = undefined;
				if(currentLocation != "VINED JUNGLE 3" && flags["ROOM_65_VENUS_PITCHER_ASLEEP"] != undefined) flags["ROOM_65_VENUS_PITCHER_ASLEEP"] = undefined;
				if(currentLocation != "DEEP JUNGLE 2" && flags["ROOM_61_VENUS_PITCHER_ASLEEP"] != undefined) flags["ROOM_61_VENUS_PITCHER_ASLEEP"] = undefined;
			}
		}
		arg--;
	}
	updatePCStats();
}
function badEnd():void {
	output("\n\n<b>GAME OVER</b>\n\n(Access the main menu to start a new character or the data menu to load a saved game. The buttons are located in the lower left of the game screen.)");
	clearMenu();
}