import classes.Characters.PlayerCharacter;
import classes.GameData.Pregnancy.PregnancyManager;
import classes.GUI;
import classes.StorageClass;
import classes.UIComponents.SquareButton;
import flash.events.Event;

public function get canSaveAtCurrentLocation():Boolean
{

	if(inCombat()) 
		return false;

	if (this.inSceneBlockSaving)
		return false;

	return this.rooms[this.currentLocation].canSaveInRoom
}

// Wrap some newline shit to make eventBuffer more consistent
public function addToEventBuffer(msg:String):void
{
	if (eventBuffer.length == 0)
	{
		eventBuffer += "\n" + msg;
	}
	else
	{
		eventBuffer += "\n\n" + msg;
	}
}

public function processEventBuffer():Boolean
{
	if (eventBuffer.length > 0)
	{
		clearOutput();
		output("<b>" + possessive(pc.short) + " log:</b>" + eventBuffer);
		eventBuffer = "";
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return true;
	}
	return false;
}

public function mainGameMenu():void {
	flags["COMBAT MENU SEEN"] = undefined;
	
	//Display shit that happened during time passage.
	if (processEventBuffer()) return;
	
	//Queued events can fire off too!
	//trace("EventQueue = ", eventQueue);
	//trace("this.eventQueue = ", this.eventQueue);
	if(eventQueue.length > 0) {
		//Do the most recent:
		this.eventQueue[0]();
		//Strip out the most recent:
		this.eventQueue.splice(0,1);
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
	this.userInterface.showBust("none");
	this.inSceneBlockSaving = false
	//Inventory shit
	itemScreen = mainGameMenu;
	lootScreen = inventory;
	this.addButton(2,"Inventory",inventory);
	//Other standard buttons

	if(this.chars["PC"].lust() < 33) {
		if(pc.canLactate()) addButton(3,"Hand Milk",milkturbation);
		else this.addDisabledButton(3,"Masturbate");
	}
	else {
		this.addButton(3,"Masturbate",masturbateMenu);
	}
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


	this.addButton(13, "Codex", showCodex);
	this.addButton(14, "RESET NPCs", initializeNPCs);
	
	// Show the minimap too!
	this.userInterface.showMinimap();
	var map:* = mapper.generateMap(currentLocation);
	this.userInterface.setMapData(map);
	
	// Enable the perk list button
	(userInterface as GUI).perkDisplayButton.Activate();
}

// Temp display stuff for perks
public function showPerkListHandler(e:Event = null):void
{
	var pButton:SquareButton = (userInterface as GUI).perkDisplayButton;
	if (pButton.isActive && !pButton.isHighlighted)
	{
		showPerksList();
		pButton.Highlight();
	}
	else if (pButton.isActive && pButton.isHighlighted)
	{
		mainGameMenu();
		pButton.DeHighlight();
	}
}

public function showPerksList():void
{
	clearOutput2();
	clearGhostMenu();
	addGhostButton(0, "Next", showPerkListHandler);
	
	var perkList:Array = (pc as PlayerCharacter).perks;
	
	for (var i:int = 0; i < perkList.length; i++)
	{
		var perk:StorageClass = perkList[i] as StorageClass;
		if (perk.combatOnly == false)
		{
			output2("<b>" + perk.storageName + "</b> - " + perk.tooltip + "\n");
		}
	}
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
	if(reahaIsCrew())
	{
		count++;
		if(!counter)
		{
			addButton(count-1,"Reaha",approachShipBoardReahaWhyDidntSavinCodeThisHeWasntExhaustedYesterday);
			crewMessages += "\n\nReaha is currently meandering around the ship, arms clutched under her hefty bosom, her nipples hooked up to a small portable milker.";
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
		
		if ((pc.XPRaw >= pc.XPMax()) && pc.level < 5 && flags["LEVEL_UP_AVAILABLE"] == undefined)
		{
			(pc as PlayerCharacter).unspentStatPoints += 13;
			(pc as PlayerCharacter).unclaimedClassPerks += 1;
			(pc as PlayerCharacter).unclaimedGenericPerks += 1;
			
			pc.level++;
			pc.XPRaw = 0;
			pc.maxOutHP();
			
			// Enable the button
			userInterface.levelUpButton.Activate();
			
			eventBuffer += "\n\nA nights rest is just what you needed; you feel faster... stronger... harder....\n<b>Level Up is available!</b>";
		}
		
		//CELISE NIGHT TIME BEDTIMEZ
		if(celiseIsCrew() && rand(3) == 0)
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

	mimbraneSleepEvents();
	
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
	else if(shipLocation == "201") setLocation("SHIP\nINTERIOR","TARKUS","SYSTEM: REDACTED");
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
	else addDisabledButton(0,"Tavros");
	if(shipLocation != "SHIP HANGAR") 
		this.addButton(1,"Mhen'ga",flyTo,"Mhen'ga");
	else addDisabledButton(1,"Mhen'ga");
	//Planet #2 unlocked!
	if(flags["UNLOCKED_JUNKYARD_PLANET"] != undefined)
	{
		if(shipLocation != "201") addButton(2,"Tarkus",flyTo,"Tarkus");
		else addDisabledButton(2,"Tarkus");
	}

	this.addButton(14,"Back",mainGameMenu);
}

function flyTo(arg:String):void {
	clearOutput();	
	if(arg == "Mhen'ga") {
		shipLocation = "SHIP HANGAR";
		currentLocation = "SHIP HANGAR";
		output("You fly to Mhen'ga");
		output(" and step out of your ship.");
	}
	else if(arg == "Tavros") {
		shipLocation = "TAVROS HANGAR";
		currentLocation = "TAVROS HANGAR";
		output("You fly to Tavros");
		output(" and step out of your ship.");
	}
	else if(arg == "Tarkus")
	{
		shipLocation = "201";
		output("You slow your ship down as you near the orbit of your next destination, Loora. As you scale down from near a third the speed of light, the planet begins to come into focus ahead: surrounded by a dense field of asteroids looms the two sundered halves of the goblin world. What should be a lifeless system, however, teems with activity: your sensors go wild as you approach the riven planet, alerting you to massive electrical activity below. The planet - or perhaps more accurately, planets - are two halves of different wholes, unsubtly chained together with a massive space tether whose every link must be the size of a dreadnought. Good god, it must have taken the resources of an entire race to erect such a technological marvel: no wonder the new pioneers have been so interested in the planet.");
		output("\n\nSlow and steady, you guide your vessel through the asteroid field around the planet. Now that you're closer, though, those asteroids look more like debris than rock: hulls of space ships and ruined clumps of satellites mashed together over centuries of disuse now litter the upper atmosphere of Tarkus, making your approach difficult. More than once, a mass of space debris bounces off your shields, sending shudders through the hull. Finally, though, you break through, heat shields going up as you make the dive planetside.");
		output("\n\nYour nav beacon guides you in most of the way, directing you towards what looks like a derelict capital ship in the middle of a great red wasteland, littered with debris from all manner of machines and vessels. This whole planet is little more than a junkyard, a once-ripe world ravished by the march of a civilization that has left little more than its garbage in its wake. You shudder at the sight of the ruined landscape as you're guided in toward an open docking bay on the side of the ancient-looking, monolithic ship, flying past a glowing hull plate reading NOVA. It looks vaguely like a human vessel, but not of a make or model you've ever seen, and it looks centuries old, a derelict of ancient days. How'd it get all the way out here? Benching the question for now, you loop around the broadside of the capsized capital ship, easing into your appointed docking bay - a hastily spray-painted square on the deck, surrounded by other explorers' ships.");
	}
	
	processTime(600 + rand(30));
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

function move(arg:String, goToMainMenu:Boolean = true):void {
	//Reset the thing that disabled encounters
	flags["ENCOUNTERS_DISABLED"] = undefined;
	var moveMinutes:int = rooms[currentLocation].moveMinutes;
	if(pc.hasItem(new Hoverboard())) {
		moveMinutes -= 1;
		if(moveMinutes < 1) moveMinutes = 1;
	}
	processTime(moveMinutes);
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
	for(var x:int = this.chars["PC"].statusEffects.length-1; x >= 0; x--) 
	{
		//trace("Checking status effect: " + x + " of " + (this.chars["PC"].statusEffects.length-1));
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
				//Horse pill gets bonus proc!
				if(this.chars["PC"].statusEffects[x].storageName == "Horse Pill")
				{
					var pill = new HorsePill();
					eventQueue[eventQueue.length] = pill.lastPillTF;
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
				if(this.chars["PC"].statusEffects[x].storageName == "Quivering Quasar")
				{
					this.chars["PC"].physiqueMod -= this.chars["PC"].statusEffects[x].value2;
					trace("Quivering Quasar: " + this.chars["PC"].statusEffects[x].value2);
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
				//trace("Marking slot: " + x + " to cut");
			}
			
		}
	}
	//Cut the statuses that expired and need cut.
	while(shitToCut.length > 0)
	{
		trace("REMOVING " + chars["PC"].statusEffects[shitToCut[shitToCut.length-1]].storageName + " in slot " + shitToCut[shitToCut.length-1] + " due to status effect time out.");
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
	else if (this.chars["PC"].hasPerk("Ice Cold")) productionFactor /= 2;
	
	//Actually apply lust.
	this.chars["PC"].lust(arg * productionFactor);
	
	//Top off shields
	this.chars["PC"].shieldsRaw = this.chars["PC"].shieldsMax();
	
	PregnancyManager.updatePregnancyStages(chars, arg);
	
	//milk is chunked out all at once due to lazies
	if(arg > 0 && pc.canLactate()) 
	{
		pc.milkProduced(arg);
		milkGainNotes();
	}
	
	if (flags["MIMBRANES BITCH TIMER"] == undefined)
	{
		flags["MIMBRANES BITCH TIMER"] = arg;
	}
	else
	{
		flags["MIMBRANES BITCH TIMER"] += arg;
	}
	
	if (flags["MIMBRANES BITCH TIMER"] >= 300)
	{
		flags["MIMBRANES BITCH TIMER"] = 0;
		mimbranesComplainAndShit();
	}

	//loop through every minute
	while(arg > 0) {
		//Check for shit that happens.
		//Actually move time!
		this.minutes++;

		//Status Effect Updates
		statusTick();
		
		//Tick hours!
		if (this.minutes >= 60) {
			
			// Lust increase per hour
			mimbraneSweatHandler();
			
			this.minutes = 0;
			this.hours++;
			//Hours checks here!
			if(flags["SHEKKA_TALK_COOLDOWN"] != undefined)
			{
				if(flags["SHEKKA_TALK_COOLDOWN"] > 0) flags["SHEKKA_TALK_COOLDOWN"]--;
				if(flags["SHEKKA_TALK_COOLDOWN"] < 0) flags["SHEKKA_TALK_COOLDOWN"] = 0;
			}
			if(flags["FLAHNE_PISSED"] > 0) {
				flags["FLAHNE_PISSED"]--;
				if(flags["FLAHNE_PISSED"] < 0) flags["FLAHNE_PISSED"] = 0;
			}
			if(chars["ALISS"].lust() < 70)
			{
				chars["ALISS"].lust(5);
			}
			chars["SHEKKA"].lust(15);
			//Lactation effect updates
			lactationUpdateHourTick();
			//Horse pill procs!
			if(pc.hasStatusEffect("Horse Pill"))
			{
				var pill = new HorsePill();
				//eventQueue[eventQueue.length] = pill.pillTF;
				pill.pillTF();
			}	
			//Cunt stretching stuff
			if(this.chars["PC"].hasVagina()) {
				for(x = 0; x < this.chars["PC"].totalVaginas(); x++) {
					//Count da stretch cooldown or reset if at minimum.
					if(this.chars["PC"].vaginas[x].loosenessRaw > this.chars["PC"].vaginas[x].minLooseness) this.chars["PC"].vaginas[x].shrinkCounter++;
					else this.chars["PC"].vaginas[x].shrinkCounter = 0;
					//Reset for this cunt.
					tightnessChanged = false;
					if(this.chars["PC"].vaginas[x].loosenessRaw < 2) {}
					else if(this.chars["PC"].vaginas[x].loosenessRaw <= 2 && this.chars["PC"].vaginas[x].shrinkCounter >= 200) tightnessChanged = true;
					else if(this.chars["PC"].vaginas[0].loosenessRaw < 4 && this.chars["PC"].vaginas[x].shrinkCounter >= 150) tightnessChanged = true;
					else if(this.chars["PC"].vaginas[0].loosenessRaw < 5 && this.chars["PC"].vaginas[x].shrinkCounter >= 110) tightnessChanged = true;
					else if(this.chars["PC"].vaginas[0].loosenessRaw >= 5 && this.chars["PC"].vaginas[x].shrinkCounter >= 75) tightnessChanged = true;
					if(tightnessChanged) {
						this.chars["PC"].vaginas[x].loosenessRaw--;
						eventBuffer += "\n\n<b>Your </b>";
						if(this.chars["PC"].totalVaginas() > 1) eventBuffer += "<b>" + num2Text2(x+1) + "</b> ";
						eventBuffer += "<b>" + this.chars["PC"].vaginaDescript(x) + " has recovered from its ordeals, tightening up a bit.</b>";
					}
				}
			}
			//Butt stretching stuff
			//Count da stretch cooldown or reset if at minimum.
			if(this.chars["PC"].ass.loosenessRaw > this.chars["PC"].ass.minLooseness) this.chars["PC"].ass.shrinkCounter++;
			else this.chars["PC"].ass.shrinkCounter = 0;
			//Reset for this cunt.
			tightnessChanged = false;
			if(this.chars["PC"].ass.loosenessRaw < 2) {}
			if(this.chars["PC"].ass.loosenessRaw == 2 && this.chars["PC"].ass.shrinkCounter >= 72) tightnessChanged = true;
			if(this.chars["PC"].ass.loosenessRaw == 3 && this.chars["PC"].ass.shrinkCounter >= 48) tightnessChanged = true;
			if(this.chars["PC"].ass.loosenessRaw == 4 && this.chars["PC"].ass.shrinkCounter >= 24) tightnessChanged = true;
			if(this.chars["PC"].ass.loosenessRaw == 5 && this.chars["PC"].ass.shrinkCounter >= 12) tightnessChanged = true;
			if(tightnessChanged) {
				this.chars["PC"].ass.loosenessRaw--;
				if(this.chars["PC"].ass.loosenessRaw <= 4) eventBuffer += "\n\n<b>Your " + this.chars["PC"].assholeDescript() + " has recovered from its ordeals and is now a bit tighter.</b>";
				else eventBuffer += "\n\n<b>Your " + this.chars["PC"].assholeDescript() + " recovers from the brutal stretching it has received and tightens up.</b>";
			}
			//Cunt snake pregnancy stuff
			if(pc.hasCuntSnake() && flags["CUNT_TAIL_PREGNANT_TIMER"] > 0) {
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
				if(chars["ALISS"].lust() >= 70)
				{
					chars["ALISS"].orgasm();
				}
				//Cunt snake tomfoolery
				if(this.chars["PC"].hasCuntTail()) {
					if(flags["DAYS_SINCE_FED_CUNT_TAIL"] == undefined) flags["DAYS_SINCE_FED_CUNT_TAIL"] = 1;
					else flags["DAYS_SINCE_FED_CUNT_TAIL"]++;
				}
				//Reset 'dem venus pitcher hoz
				if(currentLocation != "OVERGROWN ROCK 12" && flags["ROOM_80_VENUS_PITCHER_ASLEEP"] != undefined) flags["ROOM_80_VENUS_PITCHER_ASLEEP"] = undefined;
				if(currentLocation != "VINED JUNGLE 3" && flags["ROOM_65_VENUS_PITCHER_ASLEEP"] != undefined) flags["ROOM_65_VENUS_PITCHER_ASLEEP"] = undefined;
				if(currentLocation != "DEEP JUNGLE 2" && flags["ROOM_61_VENUS_PITCHER_ASLEEP"] != undefined) flags["ROOM_61_VENUS_PITCHER_ASLEEP"] = undefined;

				// Tick up all of the attached mimbranes days since last fed
				mimbranesIncreaseDaysSinceFed();
			}
		}
		arg--;
	}
	//Check to see if something changed in this department
	milkMultiplierGainNotificationCheck();
	//Queue up dumbfuck procs
	if(pc.hasStatusEffect("Dumbfuck"))
	{
		//Got some cums to pile oN?
		if(pc.hasStatusEffect("Dumbfuck Orgasm Procced"))
		{
			//No sneezes set up yet. Start dis shit.
			if(!pc.hasStatusEffect("Dumbfuck Orgasm Queued"))
			{
				pc.createStatusEffect("Dumbfuck Orgasm Queued", pc.statusEffectv1("Dumbfuck Orgasm Procced"), 0, 0, 0, true, "", "", false, 0);
			}
			//Already got some. PILE ON!
			else pc.addStatusValue("Dumbfuck Orgasm Queued",1,pc.statusEffectv1("Dumbfuck Orgasm Procced"));
			//Clear out the holding status now that we're cued up for sneezin'
			pc.removeStatusEffect("Dumbfuck Orgasm Procced");
		}
		//Add to event queue so long as it isn't on there already
		if(pc.hasStatusEffect("Dumbfuck Orgasm Queued") && eventQueue.indexOf(procDumbfuckStuff) == -1)
		{
			eventQueue[eventQueue.length] = procDumbfuckStuff;
		}
	}
	updatePCStats();
}

//Notes about milk gain increases
function milkGainNotes():void
{
	var x:int = 0;
	//Cross 75% milk fullness +1 cup
	//This doubles past F-cup
	if(pc.hasStatusEffect("Pending Gain Milk Note: 75"))
	{
		//Bump size!
		for(x = 0; x < pc.bRows(); x++)
		{
			if(pc.breastRows[x].breastRatingRaw >= 5) pc.breastRows[x].breastRatingLactationMod = 1.5;
			else pc.breastRows[x].breastRatingLactationMod = 1;
		}
		eventBuffer = "\n\nThere's no way you could miss how your [pc.fullChest] have swollen up with [pc.milk]. You figure it won't be long before they're completely full. It might be a good idea to milk them soon. <b>With all that extra weight, ";

		if(pc.bRows() > 1) eventBuffer += "the top row is ";
		else eventBuffer += "they're ";
		eventBuffer += "currently [pc.breastCupSize]s";
		if(pc.bRows() > 1) eventBuffer += ", and the others are similarly swollen";
		eventBuffer += ".</b>";
		pc.removeStatusEffect("Pending Gain Milk Note: 75");
	}
	//Cross 100% milk fullness + 1.5 cups
	//This doubles past F-cup
	if(pc.hasStatusEffect("Pending Gain Milk Note: 100"))
	{
		//Bump size!
		for(x = 0; x < pc.bRows(); x++)
		{
			if(pc.breastRows[x].breastRatingRaw >= 5) pc.breastRows[x].breastRatingLactationMod = 2.5;
			else pc.breastRows[x].breastRatingLactationMod = 1.5;
		}
		eventBuffer += "\n\nYour [pc.fullChest] feel more than a little sore. They're totally and unapologetically swollen with [pc.milk]. You heft the [pc.breastCupSize]s and sigh, swearing you can almost hear them slosh. <b>They're totally full.</b>";
		pc.removeStatusEffect("Pending Gain Milk Note: 100");
	}
	//Cross 150% milk fullness + 2 cups
	//This doubles past F-cup
	if(pc.hasStatusEffect("Pending Gain Milk Note: 150"))
	{
		//Bump size!
		for(x = 0; x < pc.bRows(); x++)
		{
			if(pc.breastRows[x].breastRatingRaw >= 5) pc.breastRows[x].breastRatingLactationMod = 3.5;
			else pc.breastRows[x].breastRatingLactationMod = 2;
		}
		eventBuffer += "\n\nYour [pc.nipples] are extraordinarily puffy at the moment, practically suffused with your neglected [pc.milk]. It's actually getting kind of painful to hold in all that liquid weight, and if you don't take care of it soon, a loss of production is likely. Right now, they're swollen up to [pc.breastCupSize]s.";
		pc.removeStatusEffect("Pending Gain Milk Note: 150");
	}
	//Hit 200% milk fullness cap + 3 cups
	//This doubles past F-cup
	if(pc.hasStatusEffect("Pending Gain Milk Note: 200"))
	{
		//Bump size!
		for(x = 0; x < pc.bRows(); x++)
		{
			if(pc.breastRows[x].breastRatingRaw >= 5) pc.breastRows[x].breastRatingLactationMod = 4.5;
			else pc.breastRows[x].breastRatingLactationMod = 3;
		}
		eventBuffer += "\n\nThe tightness in your [pc.fullChest] is almost overwhelming. You feel so full – so achingly stuffed – that every movement is a torture of breast-swelling delirium. You can't help but wish for relief or a cessation of your lactation, whichever comes first. <b>If you don't tend to them, your [pc.breastCupSize]s will stop producing [pc.milk].</b>";
		pc.removeStatusEffect("Pending Gain Milk Note: 200");
	}
}

function lactationUpdateHourTick():void
{
	//These are easy since they proc with time passage and can be added to event buffer.
	//Milk Multiplier crosses a 10 point threshold while dropping
	//Drops .5 an hour above 150 fullness. 1 above 200 fullness
	//Milk Rate drops by .1 an hour above 200.
	var originalMultiplier = pc.milkMultiplier;
	if(pc.milkFullness >= 200) 
	{
		if(pc.hasPerk("Milky")) pc.milkMultiplier -= .2;
		else pc.milkMultiplier -= 1;
	}
	else if(pc.milkFullness >= 150) 
	{
		if(!pc.hasPerk("Milky")) pc.milkMultiplier -= .5;
	}
	//Drops a tiny amount if below 50.
	if(pc.milkMultiplier < 50) {
		if(!pc.hasPerk("Milky")) pc.milkMultiplier -= 0.1;
		else pc.milkMultiplier -= 0.02;
		if(pc.milkFullness > 0) 
		{
			pc.milkFullness -= 1;
			if(pc.milkFullness < 0) pc.milkFullness = 0;
		}
	}
	//90
	if(pc.milkMultiplier < 90 && originalMultiplier >= 90) eventBuffer += "\n\nYou're pretty sure that your lactation is starting to slow down a little bit. If you don't start milking yourself, you'll eventually stop producing.";
	//80
	if(pc.milkMultiplier < 80 && originalMultiplier >= 80) eventBuffer += "\n\nLow level tingles in your [pc.chest] remind you that producing [pc.milk] is something your body does, but if you keep ignoring yourself, you won't for too much longer.";
	//70
	if(pc.milkMultiplier < 70 && originalMultiplier >= 70) eventBuffer += "\n\nYou're feeling pretty sore in your [pc.chest], but it's not getting that much worse. <b>You're pretty sure that you're lactating less as a result of the inattention to your chest.</b>";
	//60	
	if(pc.milkMultiplier < 60 && originalMultiplier >= 60) eventBuffer += "\n\nYour body's ability to produce [pc.milk] is diminishing to the point where your [pc.fullChest] are barely making any more. It won't take long before you stop production entirely.";
	//50
	if(pc.milkMultiplier < 50 && originalMultiplier >= 50) {
		for(var x:int = 0; x < pc.bRows(); x++)
		{
			pc.breastRows[x].breastRatingLactationMod = 0;
		}
		eventBuffer += "\n\nLike a switch has been flipped inside you, you feel your body's [pc.milk]-factories power down. <b>You've stopped lactating entirely.</b>";
		if(pc.milkFullness >= 75) 
		{
			eventBuffer += " The swelling from your over-filled [pc.fullChest] goes down as well, leaving you with [pc.breastCupSize]s.";
			pc.milkFullness = 75;
		}

	}
}

//Milk Multiplier crosses a 10 point threshold from raising
function milkMultiplierGainNotificationCheck():void
{
	//kGAMECLASS cheat to cheat these messages into the event buffer? Or pass event buffer as an argument? Regardless, seems the cleanest way to keep it from interrupting the scene it gets called in.
	//30
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 30")) {
		eventBuffer += "\n\nThe soreness in your [pc.nipples] is both persistent and pleasant in its own unique way. There's no disguising how it makes your [pc.chest] practically glow with warmth.";
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 30");
	}
	//40
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 40")) {
		eventBuffer += "\n\nTingles run through your [pc.fullChest] every now and again. Your [pc.nipples] even feel moist. Perhaps you'll start lactating soon?";
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 40");
	}
	//50
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 50")) {
		eventBuffer += "\n\nA single droplet of [pc.milk] escapes from one of your [pc.nipples]";
		if(pc.isChestGarbed()) eventBuffer += ", staining your [pc.upperGarments] [pc.milkColor]";
		eventBuffer += ". <b>You're lactating</b>, albeit slowly.";
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 50");
	}
	//60
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 60")) {
		eventBuffer += "\n\nJudging by the feelings in your [pc.fullChest], you can safely say that you're making [pc.milk] faster than before. Is that what ";
		if(pc.hasPregnancy()) eventBuffer += "it feels like to be an expectant mother?";
		else eventBuffer += "expectant mothers feel like?";
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 60");
	}
	//70
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 70")) {
		eventBuffer += "\n\nYou're pretty sure you're lactating even more now. As a matter of fact, a scan by your codex confirms it. Your body is producing a decent amount of milk, perhaps a little under half its maximum capability.";
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 70");
	}
	//80
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 80")) {
		eventBuffer += "\n\nHeat suffuses your chest, just another indication that your [pc.fullChest] have passed a new threshold of productivity. You're definitely lactating harder.";
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 80");
	}
	//90
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 90")) {
		eventBuffer += "\n\nThere's no doubt about how bountiful your [pc.fullChest] are feeling, swollen with potential just waiting to be milked out so that they can produce more. <b>You're getting close to having your body as trained for lactation as possible.</b>";
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 90");
	}
	//100
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 100")) {
		eventBuffer += "\n\nA wonderful, productive feeling swells in your [pc.fullChest], tingling hotly. A quick scan with your codex reports that your body is making [pc.milk] at its full capacity.";
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 100");
	}
	//110
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 110")) {
		eventBuffer += "\n\nSomehow, your body is adapting to all the milking its been put through, and your [pc.fullChest] feel more powerful and fecund than ever before. Your chest is a well-trained milking machine.";
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 110");
	}
	//125
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 125")) {
		eventBuffer += "\n\nYour chest is practically singing in delight, and the only thing it sings about is [pc.milk] - rivers of never ending, liquid flows that will spill from you unceasingly. You have trained them to lactate as well as anything can be trained. If you want to make any more [pc.milk], you'll have to grow your [pc.fullChest] bigger or turn science.";
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 125");
	}
}

function badEnd():void {
	output("\n\n<b>GAME OVER</b>\n\n(Access the main menu to start a new character or the data menu to load a saved game. The buttons are located in the lower left of the game screen.)");
	clearMenu();
}