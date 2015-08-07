import classes.BreastRowClass;
import classes.Characters.PlayerCharacter;
import classes.Creature;
import classes.GameData.PerkData;
import classes.GameData.Pregnancy.Handlers.RenvraEggPregnancy;
import classes.GameData.Pregnancy.Handlers.NyreaHuntressPregnancy;
import classes.GameData.Pregnancy.PregnancyManager;
import classes.GUI;
import classes.Items.Accessories.LeithaCharm;
import classes.Items.Miscellaneous.HorsePill;
import classes.RoomClass;
import classes.StorageClass;
import classes.UIComponents.ContentModules.MailModule;
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

public function infiniteItems():Boolean
{
	return (debug || flags["INFINITE_ITEMS"] != undefined);
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

public static const NAV_NORTH_DISABLE:uint 	= 1;
public static const NAV_EAST_DISABLE:uint 	= 1 << 1;
public static const NAV_SOUTH_DISABLE:uint 	= 1 << 2;
public static const NAV_WEST_DISABLE:uint 	= 1 << 3;
public static const NAV_IN_DISABLE:uint 	= 1 << 4;
public static const NAV_OUT_DISABLE:uint 	= 1 << 5;

public function isNavDisabled(umask:uint):Boolean
{
	if (flags["NAV_DISABLED"] != undefined && flags["NAV_DISABLED"] & umask) return true;
	
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
	
	if (pc.hasStatusEffect("Leitha Charm"))
	{
		if (pc.statusEffectv1("Leitha Charm") > 0)
		{
			// Add about two hours of variance to the proc time.
			if (rand(pc.statusEffectv1("Leitha Charm")) > 60)
			{
				pc.setStatusValue("Leitha Charm", 1, -720 - rand(360));
				if ((pc.accessory as LeithaCharm).attemptTF(pc)) return;
			}
		}
	}
	
	// Update the state of the players mails -- we don't want to do this all the time (ie in process time), and we're only going to care about it at the menu root soooooo...
	updateMailStatus();
	
	//Set up all appropriate flags
	//Display the room description
	clearOutput();
	output(this.rooms[this.currentLocation].description);
	setLocation(this.rooms[this.currentLocation].roomName,this.rooms[this.currentLocation].planet,this.rooms[this.currentLocation].system);
	if(currentLocation == "SHIP INTERIOR") setLocation("SHIP\nINTERIOR",rooms[rooms["SHIP INTERIOR"].outExit].planet,rooms[rooms["SHIP INTERIOR"].outExit].system);
	if(inCombat()) 
		output("\n\n<b>You're still in combat, you ninny!</b>");
	if(pc.hasStatusEffect("Temporary Nudity Cheat"))
		output("\n\n<b>BUG REPORT: TEMP NUDITY STUCK ON.</b>");
	//Standard buttons:
	this.clearMenu(false);
	this.userInterface.showBust("none");
	this.inSceneBlockSaving = false;
	//Inventory shit
	itemScreen = mainGameMenu;
	lootScreen = inventory;
	this.addButton(2,"Inventory",inventory);
	//Other standard buttons

	if(pc.lust() < 33) {
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

	if(pc.hasStatusEffect("Endowment Immobilized"))
	{
		if (this.rooms[this.currentLocation].northExit && !isNavDisabled(NAV_NORTH_DISABLE))
		{
			this.addDisabledButton(6, "North", "North", "You can't move - you're immobilized!");
		}
		if (this.rooms[this.currentLocation].eastExit && !isNavDisabled(NAV_EAST_DISABLE)) 
		{
			this.addDisabledButton(12, "East", "East", "You can't move - you're immobilized!");
		}
		if (this.rooms[this.currentLocation].southExit && !isNavDisabled(NAV_SOUTH_DISABLE)) 
		{
			this.addDisabledButton(11,"South","South","You can't move - you're immobilized!");
		}
		if (this.rooms[this.currentLocation].westExit && !isNavDisabled(NAV_WEST_DISABLE)) 
		{
			this.addDisabledButton(10,"West","West","You can't move - you're immobilized!");
		}
		if (this.rooms[this.currentLocation].inExit && !isNavDisabled(NAV_IN_DISABLE))
		{
			this.addDisabledButton(5, rooms[currentLocation].inText, rooms[currentLocation].inText, "You can't move - you're immobilized!");
		}
		if (rooms[currentLocation].outExit && !isNavDisabled(NAV_OUT_DISABLE)) 
		{
			addDisabledButton(7,rooms[currentLocation].outText,rooms[currentLocation].outText,"You can't move - you're immobilized!");
		}
	}
	else
	{
		if (this.rooms[this.currentLocation].northExit && !isNavDisabled(NAV_NORTH_DISABLE))
		{
			this.addButton(6, "North", move, this.rooms[this.currentLocation].northExit);
		}
		if (this.rooms[this.currentLocation].eastExit && !isNavDisabled(NAV_EAST_DISABLE))
		{
			this.addButton(12, "East", move, this.rooms[this.currentLocation].eastExit);
		}
		if (this.rooms[this.currentLocation].southExit && !isNavDisabled(NAV_SOUTH_DISABLE))
		{
			this.addButton(11,"South",move,this.rooms[this.currentLocation].southExit);
		}
		if (this.rooms[this.currentLocation].westExit && !isNavDisabled(NAV_WEST_DISABLE))
		{
			this.addButton(10, "West", move, this.rooms[this.currentLocation].westExit);
		}
		if (this.rooms[this.currentLocation].inExit && !isNavDisabled(NAV_IN_DISABLE)) 
		{
			this.addButton(5, this.rooms[this.currentLocation].inText, move, this.rooms[this.currentLocation].inExit);
		}
		if (this.rooms[this.currentLocation].outExit && !isNavDisabled(NAV_OUT_DISABLE))
		{
			this.addButton(7, this.rooms[this.currentLocation].outText, move, this.rooms[this.currentLocation].outExit);
		}
	}
	if(this.currentLocation == shipLocation) 
		this.addButton(1,"Enter Ship",move,"SHIP INTERIOR");

	flags["NAV_DISABLED"] = undefined; // Clear disabled directions.

	//if (kGAMECLASS.debug) this.addButton(13, "RESET NPCs", initializeNPCs);
	this.addButton(14, "Codex", showCodex);
	// Show the minimap too!
	this.userInterface.showMinimap();
	var map:* = mapper.generateMap(currentLocation);
	this.userInterface.setMapData(map);
	
	// Enable the perk list button
	(userInterface as GUI).perkDisplayButton.Activate();
}

public function generateMapForLocation(location:String):void
{
	userInterface.setMapData(mapper.generateMap(location));
}

public function showCodex():void
{
	this.userInterface.showCodex();
	this.codexHomeFunction();
	this.clearGhostMenu();
	
	// TESTO BUTTONO
	addGhostButton(0, "Stats", statisticsScreen);
	
	//addGhostButton(1, "Messages", function():void { } );
	//addGhostButton(2, "Log", function():void { } );
	//addGhostButton(3, "CHEEVOS", function():void { } );
	addGhostButton(1, "Log", displayQuestLog);
	
	addGhostButton(4, "Back", this.userInterface.showPrimaryOutput);
}

// Temp display stuff for perks
public function showPerkListHandler(e:Event = null):void
{
	var pButton:SquareButton = (userInterface as GUI).perkDisplayButton;
	if (pButton.isActive && !pButton.isHighlighted)
	{
		showPerksList();
		userInterface.DeGlowButtons();
		pButton.Highlight();
	}
	else if (pButton.isActive && pButton.isHighlighted)
	{
		userInterface.showPrimaryOutput();
		userInterface.DeGlowButtons();
	}
}

public function showMailsHandler(e:Event = null):void
{
	var pButton:SquareButton = (userInterface as GUI).mailsDisplayButton;
	
	if (flags["PC_EMAIL_ADDRESS"] == undefined)
	{
		(userInterface as GUI).showSecondaryOutput();
		initialMailConfiguration();
		return;
	}
	
	if (pButton.isActive && !pButton.isHighlighted)
	{
		showMails();
	}
	else if (pButton.isActive && pButton.isHighlighted)
	{
		userInterface.showPrimaryOutput();
		userInterface.DeGlowButtons();
	}
}

public function showMails():void
{
	userInterface.showMails();
			userInterface.DeGlowButtons();
	(userInterface as GUI).mailsDisplayButton.Highlight();
	codexMailFunction();
}

public function codexMailFunction():void
{
	var m:MailModule = (userInterface as GUI).mailModule;
	
	m.htmlText = "<span class='words'><p>";
	m.htmlText += "Welcome to the Steele Industries® CODEX™ Extranet Messenger Extension.";
	m.htmlText += "\n\nThe Codex EME system allows you, as a user of a Steele Industries® CODEX™ device, to exchange messages with other EME system users, allowing you to keep a historical record of various communications and transactions.";
	m.htmlText += "\n\nRecieved messages are displayed to the right of the CODEX™ display, with as-yet unread messages sorted to the top and displayed in <b>bold</b>.\n\nThe CODEX™ root menu will alert you to new messages via an un-obtrusive notification - the access icon for the system will display as a green icon when unread messages are detected.";
	m.htmlText += "</p></span>";
	
	clearGhostMenu();
	addGhostButton(4, "Back", showMailsHandler);
}

import classes.GameData.MailManager;
import classes.GUI;
import classes.UIComponents.UIStyleSettings;

public function updateMailStatus():void
{
	// Initial mail config option!
	if (flags["PC_EMAIL_ADDRESS"] == undefined)
	{
		userInterface.mailsDisplayButton.Activate();
		userInterface.mailsDisplayButton.iconColour = UIStyleSettings.gStatusGoodColour;
		return;
	}
	
	// No mails, disable button
	if (!MailManager.hasUnlockedEntries())
	{
		(userInterface as GUI).mailsDisplayButton.Deactivate();
		(userInterface as GUI).mailsDisplayButton.iconColour = 0xFFFFFF;
	}
	// Has mails, no new mails
	else if (!MailManager.hasUnreadEntries())
	{
		(userInterface as GUI).mailsDisplayButton.Activate();
		(userInterface as GUI).mailsDisplayButton.iconColour = 0xFFFFFF;
	}
	// Has new mails
	else
	{
		(userInterface as GUI).mailsDisplayButton.Activate();
		(userInterface as GUI).mailsDisplayButton.iconColour = UIStyleSettings.gStatusGoodColour;
	}
}

public function showPerksList():void
{
	clearOutput2();
	clearGhostMenu();
	addGhostButton(14, "Back", showPerkListHandler);
	
	var perkList:Array = (pc as PlayerCharacter).perks;
	
	for (var i:int = 0; i < perkList.length; i++)
	{
		var perk:StorageClass = perkList[i] as StorageClass;
		var perkDesc:String = _perkDB.getDescriptionForPerk(perk.storageName);
		
		if (perkDesc.length == 0) perkDesc = perk.tooltip;
		
		if (perk.combatOnly == false)
		{
			output2("<b>" + perk.storageName + "</b> - " + perkDesc + "\n");
		}
	}
}

public function crewRecruited():Number
{
	var counter:Number = 0;
	if(flags["RECRUITED_CELISE"] > 0) counter++;
	if(reahaRecruited()) counter++;
	if(!annoNotRecruited()) counter++;
	return counter;
}

public function crew(counter:Boolean = false):Number {
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
	if (annoIsCrew())
	{
		count++;
		if (!counter)
		{
			addButton(count - 1, "Anno", annoFollowerApproach);
			if (hours >= 6 && hours <= 7 || hours >= 19 && hours <= 20) crewMessages += "\n\nAnno is walking about in her quarters, sorting through her inventory and organizing some of her equipment.";
			else if (hours >= 12 || hours <= 13) crewMessages += "\n\nAnno's busy doing a quick workout in her quarters to the beat of some fast-paced ausar heavy metal. <i>“Gotta keep in shape!”</i> she says.";
			else crewMessages += "\n\nAnno is sitting in the common area with her nose buried in half a dozen different data slates. It looks like she's splitting her attention between the latest Warp Gate research and several different field tests of experimental shield generators.";
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
public function rest(deltaT:int = -1):void {
	var minutes:int;
	//Turn encounters back on.
	flags["ENCOUNTERS_DISABLED"] = undefined;

	clearOutput();
	if (deltaT == -1)
	{
		minutes = 230 + rand(20) + 1;
		if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) {
			output("You take a rest for about " + num2Text(Math.round(minutes/60)) + " hours");
			if(pc.HP() < pc.HPMax()) output(" and dress your injuries with some less-than-legal nanogel you appropriated on an old job");
			output(".");
		}
		else output("You sit down and rest for around " + num2Text(Math.round(minutes/60)) + " hours.");
	}
	else
	{
		minutes = deltaT;
	}
	restHeal();
	processTime(minutes);
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}
public function restHeal():void
{
	if(pc.HPRaw < pc.HPMax()) {
		if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) pc.HP(Math.round(pc.HPMax()));
		else pc.HP(Math.round(pc.HPMax() * .33));
	}
	if(pc.energy() < pc.energyMax()) {
		pc.energy(Math.round(pc.energyMax() * .33));
	}
}

public function sleep(outputs:Boolean = true):void {
	
	//Turn encounters back on.
	flags["ENCOUNTERS_DISABLED"] = undefined;
	
	var minutes:int = 420 + rand(80) + 1
	
	if(outputs) 
	{
		clearOutput();
		
		// Anno interjection
		if (flags["ANNO_SLEEPWITH_INTRODUCED"] == undefined && annoIsCrew() && annoSexed() > 0)
		{
			annoSleepWithIntroduce();
			return;
		}
		
		if ((pc.XPRaw >= pc.XPMax()) && pc.level < 7 && flags["LEVEL_UP_AVAILABLE"] == undefined)
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
		else if (pc.level == 7)
		{
			eventBuffer += "\n\n<b>You've already reached the current maximum level.</b>";
		}
		
		//CELISE NIGHT TIME BEDTIMEZ
		if(celiseIsCrew() && rand(3) == 0 && flags["CREWMEMBER_SLEEP_WITH"] == undefined)
		{
			celiseOffersToBeYourBedSenpai();
			return;
		}
		else if (annoIsCrew() && rand(3) == 0 && flags["CREWMEMBER_SLEEP_WITH"] == "ANNO")
		{
			annoSleepSexyTimes();
			return;
		}
		
		output("You lie down and sleep for about " + num2Text(Math.round(minutes/60)) + " hours.");
	}
	
	sleepHeal();
	
	processTime(minutes);

	if (pc.hasStatusEffect("Queen Pregnancy State"))
	{
		if (pc.statusEffectv1("Queen Pregnancy State") > 0 && flags["Queen Message Supression"] == undefined && (flags["Queen Dream Last Day"] < days || flags["Queen Dream Last Day"] == undefined))
		{
			queenDreamEvent();
			flags["Queen Message Supression"] = 1;
			flags["Queen Dream Last Day"] = days;
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			return;
		}
	}
	
	mimbraneSleepEvents();
	grayGooSpessSkype();
	
	this.clearMenu();
	if (flags["ANNO_SLEEPWITH_DOMORNING"] != undefined) this.addButton(0, "Next", annoMorningRouter);
	else this.addButton(0,"Next",mainGameMenu);
}

public function sleepHeal():void
{
	if (pc.HPRaw < pc.HPMax()) 
	{
		pc.HP(Math.round(pc.HPMax()));
	}
	pc.removeStatusEffect("Sore");
	pc.removeStatusEffect("Sore Counter");
	
	if (pc.energy() < pc.energyMax()) pc.energyRaw = pc.energyMax();
}


public function shipMenu():Boolean {
	
	rooms["SHIP INTERIOR"].outExit = shipLocation;
	
	setLocation("SHIP\nINTERIOR",rooms[rooms["SHIP INTERIOR"].outExit].planet,rooms[rooms["SHIP INTERIOR"].outExit].system);
	
	// Lane follower hook
	if (tryFollowerLaneIntervention())
	{
		return true;
	}
	
	// Puppyslutmas hook :D
	if (annoIsCrew() && annoPuppyslutmasEntry())
	{
		return true;
	}
	
	if (flags["ANNO_NOVA_UPDATE"] == 2)
	{
		grayGooArrivesAtShip();
		return true;
	}

	this.addButton(9,"Fly",flyMenu);
	if(currentLocation == "SHIP INTERIOR") {
		if(crew(true) > 0) {
			this.addButton(8,"Crew",crew);
		}
	}
	if (hasShipStorage()) addButton(5, "Storage", shipStorageMenuRoot);
	else addDisabledButton(5, "Storage");

	return false;
}

public function flyMenu():void {
	clearOutput();
	if(pc.hasStatusEffect("Disarmed") && shipLocation == "500")
	{
		if(flags["CHECKED_GEAR_AT_OGGY"] != undefined)
		{
			output("<b>Your gear is still locked up in customs. You should go grab it before you jump out of system.");
			clearMenu();
			addButton(14,"Back",mainGameMenu);
			return;
		}
		else 
		{
			pc.removeStatusEffect("Disarmed");
		}
	}
	output("Where do you want to go?");
	this.clearMenu();
	//TAVROS
	if(shipLocation != "TAVROS HANGAR") 
		this.addButton(0,"Tavros",flyTo,"Tavros");
	else addDisabledButton(0,"Tavros");
	//MHEN'GA
	if(shipLocation != "SHIP HANGAR") 
		this.addButton(1,"Mhen'ga",flyTo,"Mhen'ga");
	else addDisabledButton(1,"Mhen'ga");
	//TARKUS
	if(flags["UNLOCKED_JUNKYARD_PLANET"] != undefined)
	{
		if(shipLocation != "201") addButton(2,"Tarkus",flyTo,"Tarkus");
		else addDisabledButton(2,"Tarkus");
	}
	else addDisabledButton(2,"Locked","Locked","You need to find your father's probe on Mhen'ga to get this planet's coordinates.");
	//MYRELLION
	if(flags["PLANET_3_UNLOCKED"] != undefined)
	{
		if(shipLocation != "600") addButton(3,"Myrellion",flyTo,"Myrellion");
		else addDisabledButton(3,"Myrellion","Myrellion","You're already here.");
	}
	else addDisabledButton(3,"Locked","Locked","You need to find one of your father's probes to access this planet's coordinates and name.");
	//NEW TEXAS
	if(flags["NEW_TEXAS_COORDINATES_GAINED"] != undefined)
	{
		if(shipLocation != "500") addButton(5,"New Texas",flyTo,"New Texas");
		else addDisabledButton(5,"New Texas","New Texas","You're already there.");
	}
	else addDisabledButton(5,"Locked","Locked","You have not yet learned of this planet's coordinates.");
	this.addButton(14,"Back",mainGameMenu);
}

public function flyTo(arg:String):void {
	
	if (flags["SUPRESS TRAVEL EVENTS"] == 1)
	{
		flags["SUPRESS TRAVEL EVENTS"] = 0;
	}
	else
	{
		var tEvent:Function = tryProcTravelEvent();
		if (tEvent != null)
		{
			incomingMessage(tEvent, arg);
			return;
		}
	}
	
	clearOutput();
	
	if(arg == "Mhen'ga") {
		shipLocation = "SHIP HANGAR";
		currentLocation = "SHIP HANGAR";
		output("You fly to Mhen'ga");
		output(" and step out of your ship.");
		if(flags["LANDING_EVENT_CHECK"] == 1)
		{
			if((annoIsCrew() && flags["ANNOxSYRI_EVENT"] != undefined) || !annoIsCrew())
			{
				if(syriIsAFuckbuddy() && !pc.hasKeyItem("Panties - Syri's - Sky blue, silky, and extra crotch room.")) 
				{
					gettingSyrisPanties();
					return;
				}
				else if(syriIsAFuckbuddy() && rand(4) == 0)
				{
					gettingSyrisPanties();
					return;
				}
			}
			flags["LANDING_EVENT_CHECK"] = undefined;
		}
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
		currentLocation = "201";
		output("You slow your ship down as you near the orbit of your next destination, Tarkus. As you scale down past a third of the speed of light, the planet begins to come into view: surrounded by a dense field of asteroids loom the two sundered halves of the goblin world. At first glance this appears to be a lifeless system, however, as the ships sensor suite comes online instruments alert you to extreme electromagnetic interference emanating from the planet below, suggesting a power source in the multi-petawatt range. The planet, or perhaps more accurately the rended halves of the former planet, is blatantly chained together with a massive space tether whose every link must be the size of a Terran cruiser! Surely it must have taken the resources of the entire system to erect such a technological marvel: No wonder new pioneers are so interested in this place.");
		output("\n\nSlowly but surely, the ship picks through shards of rock that must have once been part of the planet's core and mantle. Further in however the field seems to largely consist of orbital debris rather than planetary ejecta: hulls of space ships and ruined clumps of satellites mashed together over centuries of disuse flit past you at thousands of kilometers per hour, making your approach difficult. More than once unidentified high velocity particles are intercepted by your shields, a grim reminder your ship is barely equipped to survive this landing. Finally you're through. The console to your front chirps as heat shields engage and you enter the upper atmosphere.");
		output("\n\n For several minutes all you can hear is the hum of the shield generator as it works to deflect and absorb much of the heat created by drag and atmospheric compression as you descend. \n\n\ Finally the vibration subsides and your view is restored as the heat shields slide open, just in time for you to see yourself punch through a thick cloud layer that leaves a mask of water droplets at the edges of your cockpit window. Although still high above the planet, you make out the surface below as mostly red speckled with flecks of silver and gray. The sea resembles acrylic paints that have undergone mixing at the hands of an overzealous toddler; hideous black and green hues garishly reflect the harsh light of Tarkus's star KP0384128J");
		output("\n\n Entry process winks green and your altitude control system switches to local ref. 300 kilometers out from the beacon you slow to a polite mach one in towards the impact site of the ancient and disintegrating capital ship you saw from orbit. The ship is surrounded by mechanical detritus from all sides and powdered with red dusts from a wasteland which stretches as far as your eye can see to the east. It rests on the shore of the strange shimmering black sea. The land here is little more than a junkyard, one more world ravished by the march of progress until it was little more than a skeleton. The dead land sends a chill down your spine while you wait for permission to land. As you vector to one of the dimly lit hangers you fly past an ancient QR code dating from the brief but colorful Information Age of Man that reads simply; NOVA. \"<i>Goddamn the ship is prehistoric!</i>\" you think as the Z14 eases into your appointed docking bay - a hastily spray-painted square on the deck, surrounded by other explorers' ships.");
	}
	else if(arg == "New Texas") {
		shipLocation = "500";
		currentLocation = "500";
		landOnNewTexas();
	}
	else if(arg == "Myrellion")
	{
		shipLocation = "600";
		currentLocation = "600";
		flyToMyrellion();
	}
	var timeFlown:Number = 600 + rand(30);
	StatTracking.track("movement/time flown", timeFlown);
	processTime(timeFlown);
	flags["LANDING_EVENT_CHECK"] = 1;
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

public function sneakBackYouNudist():void
{
	clearOutput();
	output("You meticulously make your way back to the ship using every ounce of subtlety you possess. It takes way longer than you would have thought thanks to a couple of near-misses, but you make it safe and sound to the interior of your craft.");
	processTime(180+rand(30));
	currentLocation = "SHIP INTERIOR";
	var map:* = mapper.generateMap(currentLocation);
	this.userInterface.setMapData(map);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function move(arg:String, goToMainMenu:Boolean = true):void {
	//Prevent movement for nudists into nude-restricted zones.
	if(rooms[arg].hasFlag(GLOBAL.NUDITY_ILLEGAL))
	{
		var nudistPrevention:Boolean = false;
		if(!pc.isChestGarbed() && pc.biggestTitSize() > 1) nudistPrevention = true;
		if(!pc.isCrotchGarbed()) nudistPrevention = true;
		if(nudistPrevention)
		{
			clearOutput();
			output("Nudity is illegal in that location! You'll have to cover up if you want to go there.");
			clearMenu();
			addButton(0,"SneakBack",sneakBackYouNudist,undefined,"SneakBack","Sneak back to the ship. Fuckin' prudes. It might take you a couple hours to get back safely.");
			addButton(14,"Back",mainGameMenu);
			return;
		}
	}
	//Reset the thing that disabled encounters
	flags["ENCOUNTERS_DISABLED"] = undefined;

	var moveMinutes:int = rooms[currentLocation].moveMinutes;
	//Huge nuts slow you down
	if(pc.hasStatusEffect("Egregiously Endowed")) moveMinutes *= 2;
	if(pc.hasItem(new DongDesigner())) moveMinutes *= 2;
	if(pc.hasItem(new Hoverboard())) {
		moveMinutes -= 1;
		if(moveMinutes < 1) moveMinutes = 1;
	}
	StatTracking.track("movement/time travelled", moveMinutes);
	processTime(moveMinutes);
	currentLocation = arg;
	var map:* = mapper.generateMap(currentLocation);
	this.userInterface.setMapData(map);
	
	trace("Printing map for " + currentLocation);
	//mapper.printMap(map);
	//process time here, then back to mainGameMenu!
	mainGameMenu();
}

public function statusTick():void {
	var expiredStatuses:Array = new Array();
	var y:int = 0;
	for(var x:int = pc.statusEffects.length-1; x >= 0; x--) 
	{
		//Some hardcoded removal stuff
		//Cut condensol if all cocks are gone.
		if((pc.statusEffects[x].storageName == "Condensol-B" || pc.statusEffects[x].storageName == "Condensol-A") && !pc.hasCock())
		{
			expiredStatuses[expiredStatuses.length] = x;
		}
		//trace("Checking status effect: " + x + " of " + (pc.statusEffects.length-1));
		//If times, count dat shit down.
		if(pc.statusEffects[x].minutesLeft > 0) 
		{
			pc.statusEffects[x].minutesLeft--;
			//TIMER OVER!
			if(pc.statusEffects[x].minutesLeft <= 0) 
			{
				if ((pc.statusEffects[x] as StorageClass).storageName.indexOf("Lane's Hypnosis") != -1)
				{
					baseHypnosisWearsOff((pc.statusEffects[x] as StorageClass).storageName);
				}
				//CERTAIN STATUSES NEED TO CLEAR SOME SHIT.
				if(pc.statusEffects[x].storageName == "Crabbst") 
				{
					pc.physiqueMod -= pc.statusEffects[x].value2;
					pc.reflexesMod += pc.statusEffects[x].value2;
					pc.aimMod += pc.statusEffects[x].value2;
					pc.intelligenceMod += pc.statusEffects[x].value2;
					pc.willpowerMod += pc.statusEffects[x].value2;
				}
				//Horse pill gets bonus proc!
				if(pc.statusEffects[x].storageName == "Horse Pill")
				{
					var pill:HorsePill = new HorsePill();
					eventQueue[eventQueue.length] = pill.lastPillTF;
				}
				//Condensol ends!
				if(pc.statusEffects[x].storageName == "Condensol-A")
				{
					if(pc.hasCock())
					{
						eventBuffer += "\n\nYou feel your groin relax, and check your [pc.cocks] to discover that everything is more or less as it should be. The Condensol must have worn off.";
						for(y = 0; y < pc.cockTotal(); y++)
						{
							pc.cocks[y].cLengthRaw *= 2;
						}
					}
				}
				if(pc.statusEffects[x].storageName == "Condensol-B")
				{
					if(pc.hasCock())
					{
						eventBuffer += "\n\nYou feel your groin relax, and check your [pc.cocks] to discover that everything is more or less as it should be. The Condensol must have worn off.";
						for(y = 0; y < pc.cockTotal(); y++)
						{
							pc.cocks[y].cLengthRaw *= 4;
						}
					}
				}
				//Boobswell ends!
				if(pc.statusEffects[x].storageName == "Boobswell Pads")
				{
					//Message text, last boob size increase. 7 days later.
					eventBuffer += "\n\nUnfortunately, as you admire your now-larger bosom, you realize that the gentle, wet rumble of the pads has come to a stop. <b>It looks like you’ve exhausted the BoobSwell Pads";
					if(pc.bRows() > 1) eventBuffer += "on your " + num2Text2(pc.statusEffects[x].value1+1) + " row of breasts";
					eventBuffer += "!</b> You peel them off your [pc.skinFurScales] and toss them away.";
				}
				//Treatment finishing.
				if(pc.statusEffects[x].storageName == "The Treatment")
				{
					eventBuffer += "\n\n<b>The Treatment is over.</b> You aren’t sure why or how you know, but you know it all the same. Well, there’s nothing left to do but enjoy your enhanced body to the fullest! ...While hunting for Dad’s probes, of course. It’s the best way to meet sexy new aliens.";
					eventBuffer += "\n\nOnce you claim you fortune, you can retire on New Texas, maybe even get your own private milker.";
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
					trace("X-Zil-rate Expired: " + pc.statusEffects[x].value2);
				}
				if(pc.statusEffects[x].storageName == "Quivering Quasar")
				{
					pc.physiqueMod -= pc.statusEffects[x].value2;
					trace("Quivering Quasar: " + pc.statusEffects[x].value2);
				}
				if(pc.statusEffects[x].storageName == "Zil Sting")
				{
					pc.reflexesMod += pc.statusEffects[x].value1;
					pc.libidoMod -= pc.statusEffects[x].value1;
				}
				if (pc.statusEffects[x].storageName == "Naleen Venom")
				{
					pc.physiqueMod += pc.statusEffects[x].value1;
					pc.aimMod += pc.statusEffects[x].value1;
					pc.willpowerMod += pc.statusEffects[x].value1;
					pc.reflexesMod += pc.statusEffects[x].value1;
				}
				//Mark out the ones that need cut!
				expiredStatuses[expiredStatuses.length] = x;
				//trace("Marking slot: " + x + " to cut");
			}
		}
	}	
	
	//Cut the statuses that expired and need cut.
	while(expiredStatuses.length > 0)
	{
		trace("REMOVING " + chars["PC"].statusEffects[expiredStatuses[0]].storageName + " in slot " + expiredStatuses[0] + " due to status effect time out.");
		pc.statusEffects.splice(expiredStatuses[0],1);
		expiredStatuses.splice(0,1);
	}
}

public function variableRoomUpdateCheck():void
{
	//Open Nyrea village gate
	if(rooms["2G11"].westExit != "2E11")
	{
		if(flags["PRAETORIAN_RESPAWN"] != 0 && flags["PRAETORIAN_RESPAWN"] != undefined) rooms["2G11"].westExit = "2E11"
	}
	else if(flags["PRAETORIAN_RESPAWN"] == undefined) rooms["2G11"].westExit = "";
	//Handle badger closure
	if(flags["DR_BADGER_TURNED_IN"] != undefined && rooms["209"].northExit != "") rooms["209"].northExit = "";
	if(flags["DR_BADGER_TURNED_IN"] == undefined && rooms["209"].northExit == "") rooms["209"].northExit = "304";
	//Handle planet explosions
	if(flags["TARKUS_DESTROYED"] == 1 && rooms["211"].southExit != "") 
	{
		trace("PLANET BLEWED UP. HIDIN ROOMS");
		rooms["211"].southExit = "";
		rooms["213"].southExit = "";
	}
	else if(rooms["211"].southExit == "" && flags["TARKUS_DESTROYED"] == undefined)
	{
		trace("PLANET DIDN'T BLOWED UP. LINKIN' ROOMS");
		rooms["211"].southExit = "215";
		rooms["213"].southExit = "295";
	}
	
	//Kelly's work - close/open Xenogen Biotech.
	//Open up shop: link room
	if(hours >= 6 && hours < 17) 
	{
		rooms["SOUTH ESBETH 2"].northExit = "KELLY'S OFFICE";
		rooms["BURT'S BACK END"].removeFlag(GLOBAL.NPC);
		//Add back in icons.
		if(!rooms["JULIAN'S OFFICE"].hasFlag(GLOBAL.NPC)) rooms["JULIAN'S OFFICE"].addFlag(GLOBAL.NPC);
		if(!rooms["KELLY'S OFFICE"].hasFlag(GLOBAL.NPC)) rooms["KELLY'S OFFICE"].addFlag(GLOBAL.NPC);
	}
	//Close shop: 
	else
	{
		//rooms["SOUTH ESBETH 2"].northExit = "";
		//Get rid of icons
		rooms["KELLY'S OFFICE"].removeFlag(GLOBAL.NPC);
		rooms["JULIAN'S OFFICE"].removeFlag(GLOBAL.NPC);
		//Add Kelly icon in the bar
		if(!rooms["BURT'S BACK END"].hasFlag(GLOBAL.NPC)) rooms["BURT'S BACK END"].addFlag(GLOBAL.NPC);
	}

	//Sexbot factory opeeeeeen.
	if(flags["SEXBOTS_SCANNED_FOR_COLENSO"] != undefined && flags["SEXBOTS_SCANNED_FOR_COLENSO"] >= 4)
	{
		rooms["256"].southExit = "294";
	}
	else rooms["256"].southExit = undefined;
	
	// Annos shop
	if (!steeleTechTarkusShopAvailable())
	{
		rooms["303"].removeFlag(GLOBAL.NPC);
	}
	else
	{
		rooms["303"].addFlag(GLOBAL.NPC);
	}
	
	// Deck 13 Reactor -> Databank room
	if (flags["DECK13_REACTOR_DOOR_OPEN"] == undefined)
	{
		rooms["DECK 13 REACTOR"].northExit = undefined;
	}
	else
	{
		rooms["DECK 13 REACTOR"].northExit = "DECK 13 SECONDARY REACTOR";
	}

	// Deck 13 Reactor -> Vents
	if (flags["DECK13_REACTOR_DOOR_OPEN"] != undefined)
	{
		rooms["DECK 13 REACTOR"].eastExit = undefined;
	}
	else
	{
		rooms["DECK 13 REACTOR"].eastExit = "DECK 13 VENTS";
	}
	
	if (flags["BRYNN_MET_TODAY"] == 1) rooms["BrynnsStall"].removeFlag(GLOBAL.NPC);
	else rooms["BrynnsStall"].addFlag(GLOBAL.NPC);
	//Pitchers on Mhen'ga
	if(flags["ROOM_80_PITCHER_MET"] == 1)
	{
		if(!rooms["OVERGROWN ROCK 12"].hasFlag(GLOBAL.PLANT_BULB)) rooms["OVERGROWN ROCK 12"].addFlag(GLOBAL.PLANT_BULB);
	}
	else rooms["OVERGROWN ROCK 12"].removeFlag(GLOBAL.PLANT_BULB);
	if(flags["ROOM_65_PITCHER_MET"] == 1)
	{
		if(!rooms["VINED JUNGLE 3"].hasFlag(GLOBAL.PLANT_BULB)) rooms["VINED JUNGLE 3"].addFlag(GLOBAL.PLANT_BULB);
	}
	else rooms["VINED JUNGLE 3"].removeFlag(GLOBAL.PLANT_BULB);
	if(flags["ROOM_61_PITCHER_MET"] == 1)
	{
		if(!rooms["DEEP JUNGLE 2"].hasFlag(GLOBAL.PLANT_BULB)) rooms["DEEP JUNGLE 2"].addFlag(GLOBAL.PLANT_BULB);
	}
	else rooms["DEEP JUNGLE 2"].removeFlag(GLOBAL.PLANT_BULB);

	//Irellia quest stuff.
	//IrelliaQuest incomplete. No east passage, people token in main room.
	if(flags["IRELLIA_QUEST_STATUS"] == undefined || flags["IRELLIA_QUEST_STATUS"] < 6)
	{
		if(!rooms["746"].hasFlag(GLOBAL.NPC)) rooms["746"].addFlag(GLOBAL.NPC);
		if(rooms["747"].hasFlag(GLOBAL.NPC)) rooms["747"].removeFlag(GLOBAL.NPC);
		rooms["746"].eastExit = "";
	}
	//IrelliaQuest complete: establish east/west link and move people token to Irellia's chambers
	else
	{
		rooms["746"].eastExit = "747";
		if(rooms["746"].hasFlag(GLOBAL.NPC)) rooms["746"].removeFlag(GLOBAL.NPC);
		if(!rooms["747"].hasFlag(GLOBAL.NPC)) rooms["747"].addFlag(GLOBAL.NPC);
	}
	
	// Steph Myrellion shit
	if (flags["STEPH_WATCHED"] == undefined)
	{
		if (rooms["1F22"].hasFlag(GLOBAL.NPC)) rooms["1F22"].removeFlag(GLOBAL.NPC);
	}
	else
	{
		if (flags["STEPH_WORK_CHOICE"] == undefined)
		{
			if (!rooms["1F22"].hasFlag(GLOBAL.NPC)) rooms["1F22"].addFlag(GLOBAL.NPC);
		}
		else
		{
			if (rooms["1F22"].hasFlag(GLOBAL.NPC)) rooms["1F22"].removeFlag(GLOBAL.NPC);
		}
	}
	
	// Doc McAllister
	if (mcallisterIsIn())
	{
		rooms["XBMYRELLIONLAB"].addFlag(GLOBAL.NPC);
	}
	else
	{
		rooms["XBMYRELLIONLAB"].removeFlag(GLOBAL.NPC);
	}
	
}

public function processTime(arg:int):void {
	var x:int = 0;
	
	var tightnessChanged:Boolean = false;
	
	var productionFactor:Number = 100 / (1920) * ((pc.libido() * 3 + 100) / 100);
	
	// Ideally most of this character updating shit needs to be shifted into the Creature class itself
	// Then everything can just get stuffed in this loop as like chars[prop].processTime(arg) and hook everything like that.
	for (var prop:String in chars)
	{
		if(chars[prop].ballFullness < 100 || chars[prop] == pc) chars[prop].cumProduced(arg);
	}
	
	//Double time
	if (pc.hasPerk("Extra Ardor")) productionFactor *= 2;
	//Huge nuts double time!
	if (pc.hasStatusEffect("Ludicrously Endowed")) productionFactor *= 1.5;
	if (pc.hasStatusEffect("Overwhelmingly Endowed")) productionFactor *= 2;
	
	if (pc.hasStatusEffect("Myr Venom")) productionFactor *= 1.25;
	
	//BOOZE QUADRUPLES TIEM!
	if(pc.hasStatusEffect("X-Zil-rate") || pc.hasStatusEffect("Mead") || pc.hasStatusEffect("X-Zil-rate"))
	productionFactor *= 4;
	
	//Half time.
	else if (pc.hasPerk("Ice Cold")) productionFactor /= 2;
	
	if (pc.hasStatusEffect("Leitha Charm"))
	{
		// Hardcoding checks because we might have issues with items being replaced without running through equipItem() and
		// thus calling onEquip/onRemove.
		if (!(pc.accessory is LeithaCharm))
		{
			throw new Error("Leitha Charm status effect present, but the item isn't presently equipped to the player!");
		}
		else
		{
			pc.addStatusValue("Leitha Charm", 1, arg * 20); // temp debug shit
		}
	}

	//Used to establish a cap
	var lustCap:Number = Math.round(pc.lustMax() * .75);
	//Not going over lustcap? Proceed as normal.
	if(pc.lust() + (arg * productionFactor) < lustCap)
	{
		//trace("Not going over lustcap. Lust: " + pc.lust() + " LustCap: " + lustCap + " Arg&Prod: " + arg*productionFactor);
		//Actually apply lust.
		pc.lust(arg * productionFactor);
	}
	//Already over the lustcap? Slowly reduce current lust.
	else if(pc.lust() > lustCap)
	{
		var reduce:Number = arg * productionFactor / 4;
		//Ice Cold - Ice cold becomes extra effective here., effectively multiplying loss by x4 (since it halved gains earlier)
		if (pc.hasPerk("Ice Cold")) reduce *= 4;
		//The reverse for Extra Ardor. Reduces much slower.
		if (pc.hasPerk("Extra Ardor")) reduce /= 4;
		pc.lust(-reduce);
	}
	//Gonna hit the cap? Change to cap.
	else
	{
		pc.lustRaw = lustCap;
	}
		
	//Top off shields
	pc.shieldsRaw = pc.shieldsMax();
	
	PregnancyManager.updatePregnancyStages(chars, arg);
	
	//milk is chunked out all at once due to lazies
	if(arg > 0 && pc.canLactate()) 
	{
		//Celise overnights halt milkstuff.
		if(!pc.hasStatusEffect("Milk Paused"))
		{
			//trace("time rested: " + arg);
			pc.milkProduced(arg);
			milkGainNotes();
		}
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

	//Queue up procs for boobswell shit
	if (pc.hasStatusEffect("Boobswell Pads")) boobswellStuff(arg);
	variableRoomUpdateCheck();
	//Laneshit
	processLaneDetoxEvents(arg);
	
	if (tryProcDommyReahaTime(arg))
	{
		eventQueue.push(reahaDommyFuxTime);
	}
	
	// Extra special handler for Renvra's egg messages
	if (pc.hasStatusEffect("Renvra Eggs Messages Available") || pc.hasStatusEffect("Nyrea Eggs Messages Available") || pc.hasStatusEffect("Royal Eggs Messages Available"))
	{
		var cRoom:RoomClass = rooms[currentLocation];
		var pSpace:Boolean = cRoom.hasFlag(GLOBAL.PUBLIC);
		
		// This should avoid doubling messages up if the player has both pregnancies at the same time.
		if (pc.hasStatusEffect("Renvra Eggs Messages Available")) RenvraEggPregnancy.renvraEggsMessageHandler(pSpace, arg);
		else if (pc.hasStatusEffect("Nyrea Eggs Messages Available")) NyreaHuntressPregnancy.nyreaEggsMessageHandler(pSpace, arg);
		else if (pc.hasStatusEffect("Royal Eggs Messages Available")) RoyalEggPregnancy.royalEggsMessageHandler(pSpace, arg);
		
	}
	
	// I named this badly, but this is the secondary pregnancy variant that Renvra has. It's much more complicated, so
	// all the checking is done at the target callsite.
	renvraMessageHandler();
	
	// Extra special handler for Queen of the Deeps pregnancy
	if (flags["Queen Message Supression"] == undefined)
	{
		QueenOfTheDeepPregnancy.queenPregnancyMessages(arg);
	}
	else
	{
		flags["Queen Message Supression"] = undefined;
	}

	//========== Stuff that gets checked once every time that time passes ===========//
	//Blue balls removed for not having cock and balls.
	if(!pc.hasCock() && pc.balls == 0)
	{
		if(pc.hasStatusEffect("Blue Balls")) pc.removeStatusEffect("Blue Balls");
	}
	//Remove Racial Perks No Longer Qualified For
	racialPerkUpdateCheck();

	//loop through every minute
	while(arg > 0) {
		//Check for shit that happens.
		//Actually move time!
		this.minutes++;

		//Status Effect Updates
		statusTick();
		//AlcoholTic
		if(pc.hasStatusEffect("Alcohol")) pc.alcoholTic();
		
		//Tarkus'splosions
		if(flags["TARKUS_BOMB_TIMER"] != undefined && flags["TARKUS_BOMB_TIMER"] > 0)
		{
			flags["TARKUS_BOMB_TIMER"]--;
			bombStatusUpdate();
			if(flags["TARKUS_BOMB_TIMER"] == 0) eventQueue[eventQueue.length] = bombExplodes;
		}

		//Treatment display shit
		if(pc.hasStatusEffect("Treatment Elasticity Report Q'ed"))
		{
			//Buttes
			if(pc.statusEffectv1("Treatment Elasticity Report Q'ed") == 1) treatedVagNote(true);
			//Cooters
			else treatedVagNote(false);
		}
		//Kiro stuff
		if(flags["KIRO_BAR_MET"] != undefined)
		{
			if (this.minutes >= 60) 
			{
				kiro.ballSizeRaw++;
				//Ball despunkification!
				if(kiro.ballDiameter() > 20)
				{
					if(rand(200) < kiro.ballDiameter()) kiro.orgasm();
				}
			}
			//Kiro's disabled timer!
			if(flags["KIRO_DISABLED_MINUTES"] != undefined)
			{
				flags["KIRO_DISABLED_MINUTES"]--;
				if(flags["KIRO_DISABLED_MINUTES"] <= 0) flags["KIRO_DISABLED_MINUTES"] = undefined;
			}
		}
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
			//Taivra's guards respawn
			if(flags["PRAETORIAN_RESPAWN"] != undefined && flags["PRAETORIAN_RESPAWN"] != 0)
			{
				flags["PRAETORIAN_RESPAWN"]--;
				if(flags["PRAETORIAN_RESPAWN"] <= 0) flags["PRAETORIAN_RESPAWN"] = 0;
			}
			if(flags["FLAHNE_PISSED"] > 0) {
				flags["FLAHNE_PISSED"]--;
				if(flags["FLAHNE_PISSED"] < 0) flags["FLAHNE_PISSED"] = 0;
			}
			if(flags["ANNO_ASLEEP"] != undefined)
			{
				flags["ANNO_ASLEEP"]--;
				if(flags["ANNO_ASLEEP"] <= 0) flags["ANNO_ASLEEP"] = undefined;
			}
			if(chars["ALISS"].lust() < 70)
			{
				chars["ALISS"].lust(5);
			}
			if(chars["SHEKKA"].lust() < 50) chars["SHEKKA"].lust(15);

			//Gobbles Cooldown
			if(flags["GOBBLES_SEXYTIMES_STARTED"] == 1 && flags["GOBBLES_COOLDOWN"] != 24)
			{
				if(flags["GOBBLES_COOLDOWN"] == undefined) flags["GOBBLES_COOLDOWN"] = 0;
				flags["GOBBLES_COOLDOWN"]++;
				if(flags["GOBBLES_COOLDOWN"] > 24) flags["GOBBLES_COOLDOWN"] = 24;
			}
			if(flags["GIANNA_FUCK_TIMER"] != undefined) flags["GIANNA_FUCK_TIMER"]++;
			if(flags["IRELLIA_QUEST_STATUS"] == 3 && hours == 24 && currentLocation != "725") missedRebelExplosion();
			if(flags["IRELLIA_QUEST_STATUS"] == 4 && hours == 24) 
			{
				eventBuffer += "\n\nYou receive a missive from your codex informing you that Queen Irellia would like to speak to you. Sounds like someone's about to get paid!";
				flags["IRELLIA_QUEST_STATUS"] = 5;
			}
			//Mushroom park meeting.
			if(flags["IRELLIA_QUEST_STATUS"] == 2 && hours == 18 && currentLocation == "708") eventQueue.push(unificationRallyEvent);
			//Bomb explosion bad-end meeting
			if(flags["IRELLIA_QUEST_STATUS"] == 3 && hours >= 24 && currentLocation == "725") eventQueue.push(beADumbShitFallGuyForTheRebels);
			//Irellia's sex cooldown
			if(flags["IRELLIA_SEX_COOLDOWN"] != undefined)
			{
				if(flags["IRELLIA_SEX_COOLDOWN"] <= 0) flags["IRELLIA_SEX_COOLDOWN"] = undefined;
				else flags["IRELLIA_SEX_COOLDOWN"]--;
			}
			//Lactation effect updates
			if(!pc.hasStatusEffect("Milk Paused")) lactationUpdateHourTick();
			//Horse pill procs!
			if(pc.hasStatusEffect("Horse Pill"))
			{
				var pill:HorsePill = new HorsePill();
				//eventQueue[eventQueue.length] = pill.pillTF;
				pill.pillTF();
			}	
			//Treatmentr procs
			if(pc.hasStatusEffect("The Treatment"))
			{
				treatmentHourProcs();
			}
			//Cunt stretching stuff
			if(pc.hasVagina()) {
				for(x = 0; x < pc.totalVaginas(); x++) {
					//Count da stretch cooldown or reset if at minimum.
					if(pc.vaginas[x].loosenessRaw > pc.vaginas[x].minLooseness) pc.vaginas[x].shrinkCounter++;
					else pc.vaginas[x].shrinkCounter = 0;
					//Reset for this cunt.
					tightnessChanged = false;
					if(pc.vaginas[x].loosenessRaw < 2) {}
					else if(pc.vaginas[x].loosenessRaw <= 2 && pc.vaginas[x].shrinkCounter >= 200) tightnessChanged = true;
					else if(pc.vaginas[x].loosenessRaw < 4 && pc.vaginas[x].shrinkCounter >= 150) tightnessChanged = true;
					else if(pc.vaginas[x].loosenessRaw < 5 && pc.vaginas[x].shrinkCounter >= 110) tightnessChanged = true;
					else if(pc.vaginas[x].loosenessRaw >= 5 && pc.vaginas[x].shrinkCounter >= 75) tightnessChanged = true;
					if(tightnessChanged) {
						pc.vaginas[x].loosenessRaw--;
						eventBuffer += "\n\n<b>Your </b>";
						if(pc.totalVaginas() > 1) eventBuffer += "<b>" + num2Text2(x+1) + "</b> ";
						eventBuffer += "<b>" + pc.vaginaDescript(x) + " has recovered from its ordeals, tightening up a bit.</b>";
					}
				}
			}
			//Butt stretching stuff
			//Count da stretch cooldown or reset if at minimum.
			if(pc.ass.loosenessRaw > pc.ass.minLooseness) pc.ass.shrinkCounter++;
			else pc.ass.shrinkCounter = 0;
			//Reset for this cunt.
			tightnessChanged = false;
			if(pc.ass.loosenessRaw < 2) {}
			if(pc.ass.loosenessRaw == 2 && pc.ass.shrinkCounter >= 72) tightnessChanged = true;
			if(pc.ass.loosenessRaw == 3 && pc.ass.shrinkCounter >= 48) tightnessChanged = true;
			if(pc.ass.loosenessRaw == 4 && pc.ass.shrinkCounter >= 24) tightnessChanged = true;
			if(pc.ass.loosenessRaw == 5 && pc.ass.shrinkCounter >= 12) tightnessChanged = true;
			if(tightnessChanged) {
				pc.ass.loosenessRaw--;
				if(pc.ass.loosenessRaw <= 4) eventBuffer += "\n\n<b>Your " + pc.assholeDescript() + " has recovered from its ordeals and is now a bit tighter.</b>";
				else eventBuffer += "\n\n<b>Your " + pc.assholeDescript() + " recovers from the brutal stretching it has received and tightens up.</b>";
			}
			//Cunt snake pregnancy stuff
			if(pc.hasCuntSnake() && flags["CUNT_TAIL_PREGNANT_TIMER"] > 0) {
				flags["CUNT_TAIL_PREGNANT_TIMER"]--;
				if(flags["CUNT_TAIL_PREGNANT_TIMER"] == 1) {
					flags["CUNT_TAIL_PREGNANT_TIMER"] = 0;
					eventQueue[eventQueue.length] = giveBirthThroughCuntTail;
				}
			}
			//Shade cunt snakustuff
			if(flags["SHADE_INSEMINATION_COUNTER"] != undefined)
			{
				flags["SHADE_INSEMINATION_COUNTER"]++;
				//Birth that shit on her own time if she holds it too long
				if(flags["SHADE_INSEMINATION_COUNTER"] > 167) flags["SHADE_INSEMINATION_COUNTER"] = undefined;
			}

			//Days ticks here!
			if(this.hours >= 24) {
				this.days++;
				if(pc.hasPerk("Honeypot") && days % 3 == 0) honeyPotBump();
				//Exhibitionism reduction!
				if(!(pc.armor is EmptySlot) && !(pc.lowerUndergarment is EmptySlot) && !(pc.upperUndergarment is EmptySlot))
				{
					pc.exhibitionism(-0.5);
				}
				// New Texas cockmilker repair cooldown.
				if (flags["MILK_BARN_COCKMILKER_BROKEN"] == undefined && flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] != undefined)
				{
					if (flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] > 0) flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"]--;
					else flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] = 0;
				}
				//Reset Orryx shipments!
				if(flags["ORRYX_SHIPPED_TODAY"] != undefined) flags["ORRYX_SHIPPED_TODAY"] = undefined;
				if(days >= 2 && (flags["NEW_TEXAS_COORDINATES_GAINED"] == undefined || !MailManager.isEntryUnlocked("newtexas"))) newTexasEmail();
				this.hours = 0;
				if(chars["ALISS"].lust() >= 70)
				{
					chars["ALISS"].orgasm();
				}
				//Cunt snake tomfoolery
				if(pc.hasCuntTail()) {
					if(flags["DAYS_SINCE_FED_CUNT_TAIL"] == undefined) flags["DAYS_SINCE_FED_CUNT_TAIL"] = 1;
					else flags["DAYS_SINCE_FED_CUNT_TAIL"]++;
				}
				//Reset 'dem venus pitcher hoz
				if(currentLocation != "OVERGROWN ROCK 12" && flags["ROOM_80_VENUS_PITCHER_ASLEEP"] != undefined) flags["ROOM_80_VENUS_PITCHER_ASLEEP"] = undefined;
				if(currentLocation != "VINED JUNGLE 3" && flags["ROOM_65_VENUS_PITCHER_ASLEEP"] != undefined) flags["ROOM_65_VENUS_PITCHER_ASLEEP"] = undefined;
				if(currentLocation != "DEEP JUNGLE 2" && flags["ROOM_61_VENUS_PITCHER_ASLEEP"] != undefined) flags["ROOM_61_VENUS_PITCHER_ASLEEP"] = undefined;
				//Reset milk barn events
				if (flags["MILK_BARN_EVENT_TODAY"] != undefined) flags["MILK_BARN_EVENT_TODAY"] = undefined;
				if (flags["BRYNN_MET_TODAY"] != undefined) flags["BRYNN_MET_TODAY"] = undefined;
				//Raskvel pregger shit
				if(flags["RASKVEL_PREG_TIMER"] != undefined)
				{
					flags["RASKVEL_PREG_TIMER"]--;
					//She pops eggs without you seeing.
					if(flags["RASKVEL_PREG_TIMER"] < -5) 
					{
						flags["RASKVEL_PREG_TIMER"] = undefined;
						flags["RASKVEL_EGG_COUNT"] = undefined;
					}
				}
				//Myr preggo shit
				if(flags["BRIHA_INCUBATION_TIMER"] != undefined) flags["BRIHA_INCUBATION_TIMER"]++;
				if(flags["BRIHA_LATEST_SPAWN_AGE"] != undefined) flags["BRIHA_LATEST_SPAWN_AGE"]++;
				if(flags["BRIHA_SECOND_OLDEST_SPAWN_AGE"] != undefined) flags["BRIHA_SECOND_OLDEST_SPAWN_AGE"]++;
				if(flags["BRIHA_OLDEST_SPAWN_AGE"] != undefined) flags["BRIHA_SECOND_OLDEST_SPAWN_AGE"]++;

				// Tick up all of the attached mimbranes days since last fed
				mimbranesIncreaseDaysSinceFed();
				
				// Lane monies
				laneHandleCredits();
				//Venus pitcher
				venusSubmission( -1);
				
				tryProcSaendraXPackEmail();
			}
		}
		arg--;
	}
	//Check to see if something changed in body part notices
	milkMultiplierGainNotificationCheck();
	nutSwellUpdates();

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
	//NEVRIE MAIL!
	if (!MailManager.isEntryUnlocked("myrpills") && flags["MCALLISTER_MEETING_TIMESTAMP"] <= (GetGameTimestamp() - (24 * 60))) nevriMailGet();
	if (!MailManager.isEntryUnlocked("orangepills") && flags["MCALLISTER_MYR_HYBRIDITY"] == 2 && GetGameTimestamp() >= (flags["MCALLISTER_MYR_HYBRIDITY_START"] + (7 * 24 * 60))) nevriOrangeMailGet();
	if (!MailManager.isEntryUnlocked("bjreminder") && flags["NEVRIE_FIRST_DISCOUNT_DATE"] != undefined && days >= flags["NEVRIE_FIRST_DISCOUNT_DATE"]+20) nevriBJMailGet();
	flags["HYPNO_EFFECT_OUTPUT_DONE"] = undefined;
	updatePCStats();
}

public function honeyPotCheck():void
{
	if(pc.thickness >= 30)
	{
		var boobDiff:Number = 0;
		boobDiff = pc.thickness - 10;
		if(pc.thickness >= 30)
		{

		}
		boobDiff /= 10;

		pc.addPerkValue("Honeypot",1,boobDiff);
		pc.thickness = 20;
		
		if(pc.milkFullness < 100) pc.milkFullness = 100;
		//Bump up boob sizes
		for(var bb:int = 0; bb < pc.bRows(); bb++)
		{
			pc.breastRows[bb].breastRatingHoneypotMod += boobDiff;
		}
		eventBuffer += "\n\nYour body tightens as the honeypot gene goes to work, diverting your excess bodymass into your [pc.chest], building you bigger and fuller of [pc.milkNoun].";
	}
}

public function honeyPotBump(cumShot:Boolean = false):void
{
	if(pc.thickness >= 30)
	{
		pc.thickness -= 10;
		var boobDiff:Number = 0;
		boobDiff = 10;
		if(pc.thickness >= 30) 
		{
			boobDiff = 10;
			pc.thickness -= 10;
		}
		boobDiff /= 10;
		if(pc.milkFullness < 100) pc.milkFullness = 100;
		for(var bb:int = 0; bb < pc.bRows(); bb++)
		{
			pc.breastRows[bb].breastRatingHoneypotMod += boobDiff;
		}
		eventBuffer += "\n\nYour body tightens as the honeypot gene goes to work, diverting your excess bodymass into your [pc.chest], building you bigger and fuller of [pc.milkNoun].";
	}
	else if(pc.breastRows[0].breastRatingHoneypotMod == 0)
	{
		eventBuffer += "\n\nYour [pc.chest] feel bigger than normal, swollen ";
		if(cumShot) eventBuffer += "from all the oral calories you've taken in.";
		else eventBuffer += "with the spare calories your honeypot gene has siphoned off of your meals.";
	}
	else if(pc.breastRows[0].breastRatingHoneypotMod < 10 && pc.breastRows[0].breastRatingHoneypotMod+1 >= 10)
	{
		eventBuffer += "\n\nYour [pc.chest] practically glows with the ever-expanding fruit of your honeypot gene. You wonder just how big you'll get.";
	}
	else if(pc.breastRows[0].breastRatingHoneypotMod < 20 && pc.breastRows[0].breastRatingHoneypotMod+1 >= 20)
	{
		eventBuffer += "\n\nSometimes when you move, your [pc.arm] sends your liquid-filled [pc.chest] bouncing. You can feel as much as hear the fluid churning inside, ready to be released into your hands, the ground, or a passersby's open mouth.";
	}
	else if(pc.breastRows[0].breastRatingHoneypotMod < 30 && pc.breastRows[0].breastRatingHoneypotMod+1 >= 30)
	{
		eventBuffer += "\n\nEvery movement is accompanied by a weighty, sloshing jiggle from your [pc.chest]. The more you take in, the more like a gold myr honeypot you seem, growing until you seem more boob than " + pc.mfn("man","woman","person") + ".";
	}
	else if(pc.breastRows[0].breastRatingHoneypotMod < 40 && pc.breastRows[0].breastRatingHoneypotMod+1 >= 40)
	{
		eventBuffer += "\n\nWherever you go, the eyes of every single passing sapient zero in on your [pc.chest]. It juts from your body like the proud prow of a deep space freighter, filled with a glorious [pc.milkFlavor] bounty. If only they knew - if only they could sense just how great it would be to take your [pc.nipple] in your mouth and suck. An all too pleasurable shudder wracks your spine at the thought.";
	}
	else if(pc.breastRows[0].breastRatingHoneypotMod < 50 && pc.breastRows[0].breastRatingHoneypotMod+1 >= 50)
	{
		eventBuffer += "\n\nIt's tough not to toddle forward off your [pc.feet] and onto your [pc.milkNoun]-engorged chest. The pressure would probably release a tide of [pc.milkFlavored] juice and still barely put a dent in your super-sized knockers. The honeypot gene is so amazing, the way it makes your body so fruitful... You've got to share this beautiful bosom with the galaxy!";
	}
	//Bump up boob size for 3 days of eating or a cumshot!
	for(var cc:int = 0; cc < pc.bRows(); cc++)
	{
		pc.breastRows[cc].breastRatingHoneypotMod += 1;
	}
}

public function racialPerkUpdateCheck():void
{
	if(pc.hasPerk("'Nuki Nuts"))
	{
		if(pc.nukiScore() < 3)
		{
			if(pc.balls > 0)
			{
				//Nuts inflated:
				if(pc.perkv1("'Nuki Nuts") > 0)
				{
					eventBuffer += "\n\nThe extra size in your [pc.balls] bleeds off, making it easier to walk. You have a hunch that without all your kui-tan body-mods, you won't be swelling up with excess [pc.cumNoun] any more.";
				}
				//Nuts not inflated:
				else
				{
					eventBuffer += "\n\nA tingle spreads through your [pc.balls]. Once it fades, you realize that your [pc.sack] is noticeably less elastic. Perhaps you've replaced too much kui-tan DNA to reap the full benefits.";
					pc.removePerk("'Nuki Nuts");
				}
				eventBuffer += "\n\n(<b>Perk Lost: 'Nuki Nuts</b>)";
				pc.ballSizeMod -= pc.perkv1("'Nuki Nuts");
				pc.removePerk("'Nuki Nuts");
				nutStatusCleanup();
			}
			else
			{
				eventBuffer += "\n\n(<b>Perk Lost: 'Nuki Nuts</b> - You no longer meet the requirements. You've lost too many kui-tan transformations.)";
				pc.removePerk("'Nuki Nuts");
			}
		}
	}
}

public function nutSwellUpdates():void
{
	if(pc.balls > 0)
	{
		//Hit basketball size >= 9
		if(pc.ballDiameter() >= 9 && !pc.hasStatusEffect("Egregiously Endowed"))
		{
			if(pc.hasPerk("'Nuki Nuts") && pc.balls > 1) eventBuffer += "\n\nUgh, you could really use a chance to offload some [pc.cumNoun]. Your balls have reached the size of basketballs and show no signs of stopping. The squishy, sensitive mass will definitely slow your movements.";
			//Status - Egregiously Endowed - Movement between rooms takes twice as long, and fleeing from combat is more difficult.
			pc.createStatusEffect("Egregiously Endowed", 0,0,0,0,false,"Icon_Poison", "Movement between rooms takes twice as long, and fleeing from combat is more difficult.", false, 0);
		}
		//Hit beachball size >= 15
		if(pc.ballDiameter() >= 15 && !pc.hasStatusEffect("Ludicrously Endowed"))
		{
			if(pc.hasPerk("'Nuki Nuts") && pc.balls > 1) eventBuffer += "\n\nEvery movement is accompanied by a symphony of sensation from your swollen nutsack, so engorged with [pc.cumNoun] that they wobble from their own internal weight. You have to stop from time to time just to keep from being overwhelmed by your own liquid arousal.";
			pc.createStatusEffect("Ludicrously Endowed", 0,0,0,0,false,"Icon_Poison", "The shifting masses of your over-sized testes cause you to gain fifty percent more lust over time.", false, 0);
		}
		//Hit barrel size
		if(pc.ballDiameter() >= 25 && !pc.hasStatusEffect("Overwhelmingly Endowed"))
		{
			if(pc.hasPerk("'Nuki Nuts") && pc.balls > 1) eventBuffer += "\n\nWhoah, this is awkward. Your nuts are practically barrel-sized! If you aren’t careful, they drag softly on the ground. Grass is no longer scenery - it’s hundreds of slender tongues tickling your nuts. Mud is an erotic massage. Even sand feels kind of good against your thickened sack, like a vigorous massage.";
			pc.createStatusEffect("Overwhelmingly Endowed", 0,0,0,0,false,"Icon_Poison", "The shifting masses of your over-sized testes cause you to gain twice as much lust over time.", false, 0);
		}
		//hit person size
		if(pc.ballDiameter() >= 40 && !pc.hasStatusEffect("Endowment Immobilized"))
		{
			if(pc.balls > 1) 
			{
				eventBuffer += "\n\nYou strain as hard as you can, but there’s just no helping it. You’re immobilized. Your balls are just too swollen to allow you to move anywhere. The bulk of your body weight is right there in your testes, and there’s nothing you can do about it.";
				if(canShrinkNuts()) eventBuffer += ".. well, almost nothing. A nice, long orgasm ought to fix this!";
				else 
				{
					eventQueue[eventQueue.length] = bigBallBadEnd;
					if(pc.hasPerk("'Nuki Nuts")) eventBuffer += " If a quick fap wasn't illegal here, this would be far simpler. Too bad.";
				}
				pc.createStatusEffect("Endowment Immobilized", 0,0,0,0,false,"Icon_Poison", "Your endowments prevent you from moving.", false, 0);
			}
		}
	}
	nutStatusCleanup();
}

public function canShrinkNuts():Boolean
{
	//Can fap it away!
	if(pc.hasPerk("'Nuki Nuts"))
	{
		//NO FAPS!
		if(rooms[currentLocation].hasFlag(GLOBAL.NOFAP)) return false;
		if(rooms[currentLocation].hasFlag(GLOBAL.FAPPING_ILLEGAL)) return false;
		return true;
	}
	return false;
}

public function nutStatusCleanup():void
{
	if(pc.hasStatusEffect("Endowment Immobilized") && (pc.balls == 0 || pc.ballDiameter() < 40))
	{
		eventBuffer += "\n\nYou're no longer immobilized by your out-sized equipment!";
		pc.removeStatusEffect("Endowment Immobilized");
	}
	if((pc.balls == 0 || pc.ballDiameter() < 25) && pc.hasStatusEffect("Overwhelmingly Endowed")) pc.removeStatusEffect("Overwhelmingly Endowed");
	if((pc.balls == 0 || pc.ballDiameter() < 15) && pc.hasStatusEffect("Ludicrously Endowed")) pc.removeStatusEffect("Ludicrously Endowed");
	if((pc.balls == 0 || pc.ballDiameter() < 9) && pc.hasStatusEffect("Egregiously Endowed")) pc.removeStatusEffect("Egregiously Endowed");
}

public function bigBallBadEnd():void
{
	clearOutput();
	author("Fenoxo");
	//Dangerous area, can’t unswell:
	if(rooms[currentLocation].hasFlag(GLOBAL.HAZARD))
	{
		output("It isn’t long before the natives of this place take you as an amusement - a live-in toy whose virility is the show-piece of an alien exhibit. You never do manage to get your dad’s fortune, but hey, at least you get to live in relative comfort and have all the orgasms your body can handle.");
		badEnd();
	}
	//Not a dangerous area:
	else 
	{
		output("Eventually, you manage to get someone to pick you up and take you in for treatment. It isn’t cheap either. ");
		if(pc.credits >= 10000)
		{
			pc.credits -= 10000;
			output("Your finances are ");
			if(pc.credits < 1000) output("completely ");
			output("drained by your own libidinous foolishness, but at least you can move around normally again!");
		}
		else
		{
			pc.credits = 0;
			output("Your finances aren’t capable of footing the bill, but at least the medical experimentation that pays for it all isn’t too bad.");
			if(pc.biggestTitSize() >= 1 && rand(2) == 0 && pc.breastRows[0].breasts < 3) 
			{
				output(" A third breast is a small price to pay, after all.");
				pc.breastRows[0].breasts = 3;
			}
			else if(pc.balls < 3) 
			{
				output(" A trio of smaller nuts is a small price to pay, after all.");
				pc.balls = 3;
			}
		}
		pc.ballSizeRaw = 30;
		currentLocation = "SHIP INTERIOR";
		var map:* = mapper.generateMap(currentLocation);
		userInterface.setMapData(map);
		processTime(1382);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	
}

public function boobswellStuff(time:Number = 0):void
{
	//Message text, boob size+. Every 6 hours or so.
	//Every minute = .003 breastRating. = 5.5 hours per cup size.
	var swelledRows:Array = new Array();
	//Loop through statuses and find out which boobs are covered.
	for(var x:Number = 0; x < pc.statusEffects.length; x++)
	{
		//Boobswell on!
		if(pc.statusEffects[x].storageName == "Boobswell Pads")
		{
			//Add to the list of covered rows.
			swelledRows.push(pc.statusEffects[x].value1);
		}
	}
	//While rows remain that need processed.
	while(swelledRows.length > 0)
	{
		//Bonus lust for each extra row:
		pc.lust(time/10);
		//Use x to hold the original value for later comparison.
		
		var bRow:BreastRowClass = pc.breastRows[swelledRows[swelledRows.length - 1]];
		
		if (bRow != null) // Catching potential errors in lieu of a "proper" fix.
		{
			x = bRow.breastRating();
			trace("BOOBSWELL! Original titty: " + x);
			trace("Time: " + time + " Amount grown from time: " + (time * 0.003));
			//Actually change it
			pc.breastRows[swelledRows[swelledRows.length-1]].breastRatingRaw += time * 0.003;
			trace("BOOBSWELL! Post titty: " + pc.breastRows[swelledRows[swelledRows.length-1]].breastRating());
		
			if(Math.floor(pc.breastRows[swelledRows[swelledRows.length-1]].breastRating()) > Math.floor(x) 
				&& (Math.floor(pc.breastRows[swelledRows[swelledRows.length-1]].breastRating()) % 2 == 0 || Math.floor(pc.breastRows[swelledRows[swelledRows.length-1]].breastRating()) < 6))
			{
				trace("BOOBSWELL OUTPUT TRIGGERED");
				eventBuffer += "\n\nThanks to the BoobSwell pads you’re wearing, your chest is slowly but steadily filling out! <b>You figure that ";
				if(pc.bRows() == 1) eventBuffer += "you ";
				else eventBuffer += "your " + num2Text2(swelledRows[swelledRows.length-1]+1) + " row of breasts ";
				eventBuffer += "could now fit into " + indefiniteArticle(pc.breastCup(swelledRows[swelledRows.length - 1])) + " bra!</b>";
			}
		}
		
		swelledRows.splice(swelledRows.length-1,1);
	}
}

//Notes about milk gain increases
public function milkGainNotes():void
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
		eventBuffer += "\n\nThere's no way you could miss how your [pc.fullChest] have swollen up with [pc.milk]. You figure it won't be long before they're completely full. It might be a good idea to milk them soon. <b>With all that extra weight, ";

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
		
		eventBuffer += "\n\nYour [pc.nipples] are extraordinarily puffy at the moment, practically suffused with your neglected [pc.milk]. It's actually getting kind of painful to hold in all that liquid weight, and if ";
		if(pc.hasPerk("Milky") || pc.hasPerk("Treated Milk")) eventBuffer += "it wasn't for your genetically engineered super-tits, your body would be slowing down production";
		else if(pc.hasPerk("Honeypot")) eventBuffer += "it wasn't for your honeypot gene, your body would be slowing down production";
		else if(pc.isPregnant()) eventBuffer += "you weren't pregnant, you'd probably be slowing production.";
		else if(pc.upperUndergarment is BountyBra) eventBuffer += "you weren't wearing a <b>Bounty Bra</b>, your body would be slowing down production";
		else eventBuffer += "you don't take care of it soon, a loss of production is likely";
		eventBuffer += ". Right now, they're swollen up to [pc.breastCupSize]s.";
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
		
		eventBuffer += "\n\nThe tightness in your [pc.fullChest] is almost overwhelming. You feel so full – so achingly stuffed – that every movement is a torture of breast-swelling delirium. You can't help but wish for relief or a cessation of your lactation, whichever comes first. ";
		if(pc.hasPerk("Milky") || pc.hasPerk("Treated Milk")) eventBuffer += "<b>However, with your excessively active udders, you are afraid the production will never stop.</b>";
		else if(pc.hasPerk("Honeypot")) eventBuffer += "<b>However, with your honeypot gene, they'll likely never stop.</b>";
		else if(pc.isPregnant()) eventBuffer += "<b>With a pregnancy on the way, there's no way your body will stop producing.";
		else if(pc.upperUndergarment is BountyBra) eventBuffer += "<b>Your Bounty Bra will keep your [pc.fullChest] producing despite the uncomfortable fullness.</b>";
		else eventBuffer += "<b>If you don't tend to them, your [pc.breastCupSize]s will stop producing [pc.milk].</b>";
		pc.removeStatusEffect("Pending Gain Milk Note: 200");
	}
}

public function lactationUpdateHourTick():void
{
	//These are easy since they proc with time passage and can be added to event buffer.
	//Milk Multiplier crosses a 10 point threshold while dropping
	//Drops .5 an hour above 150 fullness. 1 above 200 fullness
	//Milk Rate drops by .1 an hour above 200.
	var originalMultiplier:Number = pc.milkMultiplier;
	//Bounty bra never loses milkMultiplier!
	if(pc.upperUndergarment is BountyBra || pc.isPregnant() || pc.hasPerk("Honeypot"))
	{

	}
	else
	{
		if(pc.milkFullness >= 200) 
		{
			if(pc.hasPerk("Milky") && pc.hasPerk("Treated Milk")) {}
			else if(pc.hasPerk("Milky") || pc.hasPerk("Treated Milk")) pc.milkMultiplier -= .2;
			else pc.milkMultiplier -= 1;
		}
		else if(pc.milkFullness >= 150) 
		{
			if(!pc.hasPerk("Milky") && !pc.hasPerk("Treated Milk")) pc.milkMultiplier -= .5;
		}
	}
	//Drops a tiny amount if below 50.
	if(pc.milkMultiplier < 50 && !(pc.upperUndergarment is BountyBra) && !pc.isPregnant() && !pc.hasPerk("Honeypot")) {
		if(pc.hasPerk("Milky") && pc.hasPerk("Treated Milk")) {}
		else if(pc.hasPerk("Milky") || pc.hasPerk("Treated Milk")) pc.milkMultiplier -= .02;
		else pc.milkMultiplier -= 0.1;

		if(!pc.hasPerk("Milky")) pc.milkMultiplier -= 0.1;
		else pc.milkMultiplier -= 0.02;
		if(pc.milkFullness > 0) 
		{
			pc.milkFullness -= 1;
			if(pc.milkFullness < 0) pc.milkFullness = 0;
		}
	}
	if(pc.milkMultiplier < 0) pc.milkMultiplier = 0;
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
public function milkMultiplierGainNotificationCheck():void
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

public function badEnd():void 
{
	gameOverEvent = true;
	
	// Todo -- Hook alternate game ends in here, and also maybe look into some kind of categorisation system.
	
	output("\n\n<b>GAME OVER</b>\n\n(Access the main menu to start a new character or the data menu to load a saved game. The buttons are located in the lower left of the game screen.)");
	clearMenu();
}

public function statisticsScreen():void
{
	clearOutput2();
	clearGhostMenu();
	addGhostButton(14, "Back", showCodex);
	
	output2("<b><u>Personal Statistics:</u></b>\n");
	output2("<b>Alcohol Tolerance: </b>" + pc.tolerance() + "/100\n");
	
	if(pc.hasCock())
	{
		output2("<b>Cum, Current Internal: </b>" + pc.currentCum() + " mLs\n");
		output2("<b>Cum, Probable Ejaculation: </b> " + pc.cumQ() + " mLs\n");
		output2("<b>Cum, Max: </b>" + pc.maxCum() + " mLs\n");
	}
	output2("<b>Exhibitionism: </b>" + Math.round(pc.exhibitionism()*10)/10 + "/100\n");
	output2("<b>Femininity (Negative is Masculine): </b>" + (pc.femininity-50)*2 + "\n");
	if(pc.hasVagina())
	{
		output2("<b>Fertility: </b>" + Math.round(pc.fertility()*1000)/10 + "%\n");
		output2("<b>Fertility Speed Modifier: </b>" + Math.round(pc.pregnancyIncubationBonusMother()*1000)/10 + "%\n");
		output2("<b>Fertility Quantity Bonus: </b>" + Math.round(pc.pregnancyMultiplier()) + "\n");
	}
	//Milkshit!
	if(pc.canLactate())
	{
		output2("<b>Milk, Current: </b>" + Math.round(pc.milkFullness/100 * pc.milkCapacity()) + " mLs\n");;
		output2("<b>Milk, Max: </b>" + pc.milkCapacity() + " mLs\n");
		output2("<b>Milk, Production Training: </b>" + Math.round(pc.milkMultiplier*10)/10 + "%\n");
		output2("<b>Milk, Production Bonus: </b>" + Math.round(pc.milkRate*100)/10 + "%\n");
	}
	output2("<b>Orgasms, Total: </b>" + StatTracking.getStat("sex/player/orgasms") + "\n");
	
	output2("<b>Personality Score: </b>" + Math.round(pc.personality));
	if (pc.isNice()) output2(", Kind");
	if (pc.isMischievous()) output2(", Mischievous");
	if (pc.isAss()) output2(", Hard");
	output2("\n");
	
	if(pc.hasCock()) output2("<b>Refractory Rate: </b>" + Math.round(pc.refractoryRate*1000)/10 + "%\n");
	if(pc.hasCock()) output2("<b>Virility: </b>" + Math.round(pc.virility()*1000)/10 + "%\n");

	output2("\n<b><u>Combat Statistics:</u></b>\n");
	output2("<b>Accuracy Bonus, Melee: </b>" + pc.attack(true) + "%\n");
	output2("<b>Accuracy Bonus, Ranged: </b>" + pc.attack(false) + "%\n");
	output2("<b>Combat, Losses: </b>" + StatTracking.getStat("combat/losses") + "\n");
	output2("<b>Combat, Victories: </b>" + StatTracking.getStat("combat/wins") + "\n");
	output2("<b>Critical Chance, Melee: </b>" + pc.critBonus(true) + "%\n");
	output2("<b>Critical Chance, Ranged: </b>" + pc.critBonus(false) + "%\n");
	output2("<b>Evasion Bonus: </b>" + pc.evasion() + "%\n");


	//======NPC STATISTICS=====//
	output2("\n<b><u>Interpersonal Statistics:</u></b>\n");
	if (flags["MET_ELLIE"] != undefined && flags["NEPH_AFFECTION"] != undefined) output2("<b>Ellie's Affection: </b>" + flags["NEPH_AFFECTION"] + "%\n");
	if (flags["MET_GIANNA"] != undefined) output2("<b>Gianna's Personality Score:</b>" + giannaPersonality() + "\n");
	if (flags["KELLY_ATTRACTION"] != undefined) output2("<b>Kelly's Attraction: </b>" + flags["KELLY_ATTRACTION"] + "%\n");
	if(flags["RESCUE KIRO FROM BLUEBALLS"] == 1) output2("<b>Kiro's Trust: </b>" + kiroTrust() + "%\n");
	//Lane shit
	if(flags["LANE_HYPNOSIS_LEVEL"] != 0 && flags["LANE_HYPNOSIS_LEVEL"] != undefined)
	{
		output2("<b>Lane, Hypnosis Level: </b>" + flags["LANE_HYPNOSIS_LEVEL"] + "\n");
		if (flags["LANE_DETOX_COUNTER"] != undefined) output2("<b>Lane, Hypnotism Detoxification Duration: </b>" + prettifyMinutes(flags["LANE_DETOX_COUNTER"]) + "\n");
	}
	if (flags["MET_ORRYX"] >= 2 && flags["ORRYX_REP"] != undefined)
	{
		output2("<b>Orryx's Reputation Level: </b>" + flags["ORRYX_REP"] + "\n");
	}
	if (flags["MET_PENNY"] != undefined && flags["PENNY_AFFECTION"] != undefined) output2("<b>Penny's Affection: </b>" + flags["PENNY_AFFECTION"] + "%\n");
	if(reahaRecruited()) 
	{
		output2("<b>Reaha's Patch Addiction: </b>" + reahaAddiction() + "%\n");
		output2("<b>Reaha's Confidence: </b>" + reahaConfidence() + "%\n");
	}
	if (flags["SAEN MET AT THE BAR"] != undefined) output2("<b>Saendra's Affection: </b>" + saendraAffection() + "% (69% Max)\n");

	//=====GENERAL STATS=====//
	output2("\n<b><u>General Statistics:</u></b>\n");
	output2("<b>Crew, Recruited: </b>" + crewRecruited() + "\n");
	output2("<b>Crew, Onboard: </b>" + crew(true) + "\n");
	if(StatTracking.getStat("milkers/breast milker uses") > 0)
	{
		output2("<b>Milker, Breast, Times Used: </b>" + StatTracking.getStat("milkers/breast milker uses") + "\n");
		output2("<b>Milker, Breast, Fluid Milked: </b>" + StatTracking.getStat("milkers/milk milked") + " mL\n");
	}
	if(StatTracking.getStat("milkers/prostate milker uses") > 0)
	{
		output2("<b>Milker, Prostate, Times Used: </b>" + StatTracking.getStat("milkers/prostate milker uses") + "\n");
		output2("<b>Milker, Prostate, Cum Milked: </b>" + StatTracking.getStat("milkers/cum milked") + " mL\n");
	}
	output2("<b>Time Spent Moving From Room to Room: </b>" + prettifyMinutes(StatTracking.getStat("movement/time travelled")) + "\n");
	output2("<b>Time Spent Flying: </b>" + prettifyMinutes(StatTracking.getStat("movement/time flown")) + "\n");
	if(StatTracking.getStat("characters/maiden vanae/cherrys popped") > 0)
	{
		output2("<b>Vanae Deflowered: </b>" + StatTracking.getStat("characters/maiden vanae/cherrys popped") + "\n");
	}
	if(flags["TIMES_CAUGHT_BY_ELDER_VENUS_PITCHER"] != undefined) output2("<b>Venus Pitcher Elders, Times Hypnotized By: </b>" + flags["TIMES_CAUGHT_BY_ELDER_VENUS_PITCHER"] + "\n");
	if(venusSubmission() > 0) output2("<b>Venus Pitcher Elders, Submission: </b>" + Math.round(venusSubmission()*10)/10 + "%\n");
	var totalVirginitiesTaken:Number = StatTracking.getStat("characters/maiden vanae/cherrys popped");
	if(!chars["KIRO"].vaginalVirgin) totalVirginitiesTaken++;
	if(!embry.vaginalVirgin) totalVirginitiesTaken++;
	if(!embry.analVirgin) totalVirginitiesTaken++;
	output2("<b>Virginities Claimed: </b>" + totalVirginitiesTaken + "\n");
	
	//Births header!
	if(StatTracking.getStat("pregnancy/total births") > 0)
	{
		output2("\n<b><u>Reproduction Statistics:</u></b>\n");
		output2("<b>Births, Total: </b>" + StatTracking.getStat("pregnancy/total births") + "\n");

		if(StatTracking.getStat("pregnancy/cockvine seedlings birthed") > 0)
			output2("<b>Births, Cockvines: </b>" + StatTracking.getStat("pregnancy/cockvine seedlings birthed") + "\n");
		if(StatTracking.getStat("pregnancy/cockvine seedlings captured") > 0)
			output2("<b>Births, Cockvines, Captured: </b>" + StatTracking.getStat("pregnancy/cockvine seedlings captured") + "\n");
		if(StatTracking.getStat("pregnancy/nyrea eggs") > 0)
			output2("<b>Births, Nyrea Eggs: </b>" + StatTracking.getStat("pregnancy/nyrea eggs") + "\n");
		if(StatTracking.getStat("pregnancy/renvra kids") > 0)
			output2("<b>Births, Renvra's Children: </b>" + StatTracking.getStat("pregnancy/renvra kids") + "\n");
		if(StatTracking.getStat("pregnancy/venus pitcher seeds") > 0)
			output2("<b>Births, Venus Pitcher Seeds: </b>" + StatTracking.getStat("pregnancy/venus pitcher seeds") + "\n");
		if(StatTracking.getStat("pregnancy/fertilized venus pitcher seeds/day care") > 0)
			output2("<b>Births, Venus Pitcher Seeds @ Daycare: </b>" + StatTracking.getStat("pregnancy/fertilized venus pitcher seeds/day care") + "\n");
		if(StatTracking.getStat("pregnancy/unfertilized venus pitcher seed") > 0)
			output2("<b>Births, Venus Pitcher Seeds, Unfertilized: </b>" + StatTracking.getStat("pregnancy/unfertilized venus pitcher seed") + "\n");
		if(StatTracking.getStat("pregnancy/queen of the deep eggs") > 0)
			output2("<b>Births, Water Queen Eggs: </b>" + StatTracking.getStat("pregnancy/queen of the deep eggs") + "\n");
		if(StatTracking.getStat("pregnancy/raskvel sired/total") > 0)
			output2("<b>Fathered, Raskvel Eggs: </b>" + StatTracking.getStat("pregnancy/raskvel sired/total") + "\n");
		if(StatTracking.getStat("pregnancy/raskvel sired/day care") > 0)
			output2("<b>Fathered, Raskvel @ Daycare: </b>" + StatTracking.getStat("pregnancy/raskvel sired/day care") + "\n");
		if(StatTracking.getStat("pregnancy/briha kids") > 0)
			output2("<b>Fathered, Briha Children: </b>" + StatTracking.getStat("pregnancy/briha kids") + "\n");
		if(StatTracking.getStat("pregnancy/briha sons") > 0)
			output2("<b>Fathered, Briha Sons: </b>" + StatTracking.getStat("pregnancy/briha sons") + "\n");
		if(StatTracking.getStat("pregnancy/briha daughters") > 0)
			output2("<b>Fathered, Briha Daughters: </b>" + StatTracking.getStat("pregnancy/briha daughters") + "\n");
	}

	//======PARASITE STATISTICS=====//
	//Parasites!
	output2("\n<b><u>Parasite Statistics:</u></b>\n");

	var bHasParasites:Boolean = false;

	// Cockvines
	if(pc.tailType == GLOBAL.TYPE_COCKVINE && pc.tailCount > 0)
	{
		output2("<b>Cockvine, Attached, Type: </b>" + GLOBAL.TYPE_NAMES[pc.tailGenitalArg] + "\n");
		bHasParasites = true;
	}
	// Cunt Snakes
	if(pc.tailType == GLOBAL.TYPE_CUNTSNAKE && pc.tailCount > 0)
	{
		output2("<b>Cunt Snake, Attached, Type: </b>" + GLOBAL.TYPE_NAMES[pc.tailGenitalArg] + "\n");
		if(flags["DAYS_SINCE_FED_CUNT_TAIL"] != undefined) output2("<b>Cunt Snake, Feeding, Current: </b>" + flags["DAYS_SINCE_FED_CUNT_TAIL"] + " days since last fed\n");
		bHasParasites = true;
	}
	if(flags["TIMES_FED_CUNT_SNAKE"] != undefined)
	{
		output2("<b>Cunt Snake, Feeding, Total: </b>" + flags["TIMES_FED_CUNT_SNAKE"] + " times\n");
		bHasParasites = true;
	}
	if(flags["CUNT_TAIL_PREGNANT_TIMER"] != undefined && flags["CUNT_TAIL_PREGNANT_TIMER"] > 0)
	{
		output2("<b>Cunt Snake, Pregnancy, Gestation Time: </b>" + prettifyMinutes(flags["CUNT_TAIL_PREGNANT_TIMER"]) + " until birth\n");
		bHasParasites = true;
	}
	if(flags["CUNT_SNAKE_EGGS_FAXED_HOME"] != undefined && flags["CUNT_SNAKE_EGGS_FAXED_HOME"] > 0)
	{
		output2("<b>Cunt Snake, Reproduction, Eggs in Hatchery: </b>" + flags["CUNT_SNAKE_EGGS_FAXED_HOME"] + "\n");
		bHasParasites = true;
	}
	if(flags["CUNT_SNAKES_HELPED_TO_INFEST"] != undefined || flags["CUNT_SNAKE_EGGS_FAXED_HOME"] != undefined)
	{
		output2("<b>Cunt Snake, Reproduction, Eggs Laid Total: </b>");
		if(flags["CUNT_SNAKE_EGGS_FAXED_HOME"] == undefined) output2(flags["CUNT_SNAKES_HELPED_TO_INFEST"]);
		else if(flags["CUNT_SNAKES_HELPED_TO_INFEST"] == undefined) output2(flags["CUNT_SNAKE_EGGS_FAXED_HOME"]);
		else output2(flags["CUNT_SNAKES_HELPED_TO_INFEST"] + flags["CUNT_SNAKE_EGGS_FAXED_HOME"]);
		output2("\n");
		bHasParasites = true;
	}
	// Mimbranes
	if(attachedMimbranes() > 0)
	{
		output2("<b>Mimbranes, Attached, Total: </b>" + attachedMimbranes() + "\n");
		
		var mimSumReproductionCounter:int = 0;
		
		if(pc.hasStatusEffect("Mimbrane Cock")) mimSumReproductionCounter += pc.statusEffectv4("Mimbrane Cock");
		if(pc.hasStatusEffect("Mimbrane Pussy")) mimSumReproductionCounter += pc.statusEffectv4("Mimbrane Pussy");
		if(pc.hasStatusEffect("Mimbrane Ass")) mimSumReproductionCounter += pc.statusEffectv4("Mimbrane Ass");
		if(pc.hasStatusEffect("Mimbrane Balls")) mimSumReproductionCounter += pc.statusEffectv4("Mimbrane Balls");
		if(pc.hasStatusEffect("Mimbrane Boobs")) mimSumReproductionCounter += pc.statusEffectv4("Mimbrane Boobs");
		if(pc.hasStatusEffect("Mimbrane Hand Left")) mimSumReproductionCounter += pc.statusEffectv4("Mimbrane Hand Left");
		if(pc.hasStatusEffect("Mimbrane Hand Right")) mimSumReproductionCounter += pc.statusEffectv4("Mimbrane Hand Right");
		if(pc.hasStatusEffect("Mimbrane Foot Left")) mimSumReproductionCounter += pc.statusEffectv4("Mimbrane Foot Left");
		if(pc.hasStatusEffect("Mimbrane Foot Right")) mimSumReproductionCounter += pc.statusEffectv4("Mimbrane Foot Right");
		if(pc.hasStatusEffect("Mimbrane Face")) mimSumReproductionCounter += pc.statusEffectv4("Mimbrane Face");
		
		if(mimSumReproductionCounter > 0) output2("<b>Mimbranes, Reproduction, Current Total: </b>" + mimSumReproductionCounter + " times\n");
		bHasParasites = true;
	}
	if(flags["MIMBRANE_COCK_REPRODUCTION_NOTICED"] != undefined || flags["MIMBRANE_PUSSY_REPRODUCTION_NOTICED"] != undefined || flags["MIMBRANE_ASS_REPRODUCTION_NOTICED"] != undefined || flags["MIMBRANE_BALLS_REPRODUCTION_NOTICED"] != undefined || flags["MIMBRANE_BOOBS_REPRODUCTION_NOTICED"] != undefined || flags["MIMBRANE_HAND_REPRODUCTION_NOTICED"] != undefined || flags["MIMBRANE_FOOT_REPRODUCTION_NOTICED"] != undefined || flags["MIMBRANE_FACE_REPRODUCTION_NOTICED"] != undefined)
	{
		var mimSumRepNoteCounter:int = 0;
		
		if(flags["MIMBRANE_COCK_REPRODUCTION_NOTICED"] != undefined) mimSumRepNoteCounter += flags["MIMBRANE_COCK_REPRODUCTION_NOTICED"];
		if(flags["MIMBRANE_PUSSY_REPRODUCTION_NOTICED"] != undefined) mimSumRepNoteCounter += flags["MIMBRANE_PUSSY_REPRODUCTION_NOTICED"];
		if(flags["MIMBRANE_ASS_REPRODUCTION_NOTICED"] != undefined) mimSumRepNoteCounter += flags["MIMBRANE_ASS_REPRODUCTION_NOTICED"];
		if(flags["MIMBRANE_BALLS_REPRODUCTION_NOTICED"] != undefined) mimSumRepNoteCounter += flags["MIMBRANE_BALLS_REPRODUCTION_NOTICED"];
		if(flags["MIMBRANE_BOOBS_REPRODUCTION_NOTICED"] != undefined) mimSumRepNoteCounter += flags["MIMBRANE_BOOBS_REPRODUCTION_NOTICED"];
		if(flags["MIMBRANE_HAND_REPRODUCTION_NOTICED"] != undefined) mimSumRepNoteCounter += flags["MIMBRANE_HAND_REPRODUCTION_NOTICED"];
		if(flags["MIMBRANE_FOOT_REPRODUCTION_NOTICED"] != undefined) mimSumRepNoteCounter += flags["MIMBRANE_FOOT_REPRODUCTION_NOTICED"];
		if(flags["MIMBRANE_FACE_REPRODUCTION_NOTICED"] != undefined) mimSumRepNoteCounter += flags["MIMBRANE_FACE_REPRODUCTION_NOTICED"];
		
		if(mimSumRepNoteCounter > 0) output2("<b>Mimbranes, Reproduction, Total Noticed: </b>" + mimSumRepNoteCounter + " times\n");
		bHasParasites = true;
	}
	// You're clean!
	if(!bHasParasites) output2("<i>There is no history of any attached parasites.</i>\n");
}

public function prettifyMinutes(minutes:Number):String
{
	var buffer:String = "";
	var hours:Number = 0;
	var days:Number = 0;
	//Days
	if(minutes > 1440) 
	{
		days = Math.floor(minutes/1440);
		minutes -= 1440 * days;
	}
	//Hourz
	if(minutes > 60)
	{
		hours = Math.floor(minutes/60);
		minutes -= 60 * hours;
	}
	if(days > 0) 
	{
		buffer += days + " day";
		if(days > 1) buffer += "s";
	}
	if(hours > 0 || days > 0) 
	{
		if(days > 0) buffer += " ";
		buffer += hours + " hour"
		if(hours != 1) buffer += "s";
	}
	if(buffer != "") buffer += " ";
	buffer += minutes + " minute";
	if(minutes != 1) buffer += "s";
	return buffer;
}

// Captain's log button menu
public function questLogMenu(showID:String = "All"):void
{
	// Starter Locations
	if(flags["RIVALCONFIGURED"] != undefined)
	{
		// Tavros
		if(showID == "Tavros") { output2(header("<u>Tavros Station</u>")); addDisabledGhostButton(0, "Tavros"); }
		else addGhostButton(0, "Tavros", displayQuestLog, "Tavros");
		// Mhen'ga
		if(showID == "Mhen'ga") { output2(header("<u>Mhen’ga</u>")); addDisabledGhostButton(1, "Mhen'ga"); }
		else addGhostButton(1, "Mhen'ga", displayQuestLog, "Mhen'ga");
	}
	// Tarkus
	if(flags["UNLOCKED_JUNKYARD_PLANET"] != undefined)
	{
		if(showID == "Tarkus") { output2(header("<u>Tarkus</u>")); addDisabledGhostButton(2, "Tarkus"); }
		else addGhostButton(2, "Tarkus", displayQuestLog, "Tarkus");
	}
	// Myrellion
	if(flags["PLANET_3_UNLOCKED"] != undefined)
	{
		if(showID == "Myrellion") { output2(header("<u>Myrellion</u>")); addDisabledGhostButton(3, "Myrellion"); }
		else addGhostButton(3, "Myrellion", displayQuestLog, "Myrellion");
	}
	// Uveto
	if(9999 == 0)
	{
		if(showID == "Uveto") { output2(header("<u>Uveto VII</u>")); addDisabledGhostButton(4, "Uveto"); }
		else addGhostButton(4, "Uveto", displayQuestLog, "Uveto");
	}
	// New Texas
	if(flags["NEW_TEXAS_COORDINATES_GAINED"] != undefined)
	{
		if(showID == "New Texas") { output2(header("<u>New Texas</u>")); addDisabledGhostButton(5, "New Texas"); }
		else addGhostButton(5, "New Texas", displayQuestLog, "New Texas");
	}
	// Other Info
	if(showID == "Other") addDisabledGhostButton(12, "Other");
	else addGhostButton(12, "Other", displayQuestLog, "Other", "Other Data", "Show the information not restricted to a location.");
	// Everything
	if(showID == "All") addDisabledGhostButton(13, "All");
	else addGhostButton(13, "All", displayQuestLog, "All", "All Data", "Show the cumulative log.");
}

// Displays the Captain's quest log.
public function displayQuestLog(showID:String = "All"):void
{
	clearOutput2();
	clearGhostMenu();
	addGhostButton(14, "Back", showCodex);
	
	// Generate buttons and headers (if necessary)
	questLogMenu(showID);
	
	if(showID == "All" || showID == "Other") output2(header("<b><u>Captain's Log:</u></b>"));
	
	// Locational Info
	if(showID != "Other" || showID == "All")
	{
		// Main Questline:
		if(showID != "All") output2("\n\n");
		output2(blockHeader("Main Mission"));
		var mainCount:int = 0;
		// Tavros
		if(flags["RIVALCONFIGURED"] != undefined && (showID == "Tavros" || showID == "All"))
		{
			output2("\n<b><u>Tavros Station</u></b>");
			output2("\n<b>* Status:</b> Acquired Codex, Acquired Casstech Z14, Met [rival.name]");
			output2("\n<b>* Celise:</b>");
			if(flags["RECRUITED_CELISE"] != undefined) output2(" Recruited");
			else output2(" Not taken");
			mainCount++;
		}
		// Mhen'ga
		if(flags["RIVALCONFIGURED"] != undefined && (showID == "Mhen'ga" || showID == "All"))
		{
			output2("\n<b><u>Mhen’ga</u></b>");
			output2("\n<b>* Status:</b>");
			if(flags["DIDNT_ENGAGE_RIVAL_ON_MHENGA"] != undefined) output2(" Coordinates received, Did not engage [rival.name]");
			else if(flags["WHUPPED_DANES_ASS_ON_MHENGA"] != undefined) output2(" Coordinates received, Won against Dane");
			else if(flags["LOST_TO_DANE_ON_MHENGA"] != undefined) output2(" Coordinates received, Lost against Dane");
			else output2(" <i>In progress...</i>");
			output2("\n<b>* Scout Transport:</b> Esbeth");
			if(flags["SALVAGED VANAE CAMP"] >= 2) output2(", Xenogen Camp");
			mainCount++;
		}
		// Tarkus
		if(flags["UNLOCKED_JUNKYARD_PLANET"] != undefined && (showID == "Tarkus" || showID == "All"))
		{
			output2("\n<b><u>Tarkus</u></b>");
			output2("\n<b>* Status:</b>");
			if(flags["PLANET_3_UNLOCKED"] != undefined) output2(" Coordinates received");
			else output2(" <i>In progress...</i>");
			if(flags["GAVE_SHEKKA_PROBE"] != undefined) output2(", Gave probe to Shekka");
			output2("\n<b>* Scout Transport:</b> Novahome");
			if(flags["TARKUS_DESTROYED"] == undefined && flags["TARKUS_TAXI_STOP_UNLOCKED"] != undefined) output2(", The Lift");
			if(flags["MET_UGC_TROOPER_AT_CHASMFALL"] != undefined && flags["FOUGHT_TAM"] != undefined)
			{
				output2("\n<b>* The Stellar Tether:</b>");
				if(flags["PLATINUM_TAKEN"] != undefined) output2(" Taken Platinum 190,");
				if(flags["STELLAR_TETHER_CLOSED"] != undefined && flags["TARKUS_BOMB_TIMER"] != undefined && flags["TARKUS_BOMB_TIMER"] <= 0)
				{
					output2(" Completed");
					if(flags["TARKUS_DESTROYED"] != undefined) output2(", Planet destroyed by pirates of the <i>Tarasque</i>");
					else output2(", Planet saved from pirates of the <i>Tarasque</i>");
				}
				else output2(" <i>In progress...</i>");
				if(flags["TAM_DISABLE_METHOD"] != undefined || flags["TAKEN_TAMWOLF"] != undefined)
				{
					output2("\n<b>* The Stellar Tether, <i>Tarasque</i> Crew:</b>");
					if(flags["TAM_DISABLE_METHOD"] != undefined) output2(" Knocked out Tam");
					else output2(" Fucked Tam");
					if(flags["TAKEN_TAMWOLF"] != undefined) output2(" and taken Tam-wolf");
					if(flags["ROCKET_PODS_ENCOUNTERED"] != undefined)
					{
						if(flags["ROCKET_PODS_HACKED"] != undefined) output2(", Hacked rocket pods");
						if(flags["ROCKET_PODS_SNEAKED"] != undefined) output2(", Sneaked passed rocket pods");
					}
					if(flags["KASKA_FUCKED"] != undefined) output2(", Fucked Kaska");
					if(flags["STARTED_KHORGAN_FIGHT"] != undefined)
					{
						if(flags["DICKFUCKED_CAPN_KHORGAN"] != undefined) output2(", Dick-fucked Capt. Khorgan");
						if(flags["LESBOED_KHORGAN"] != undefined) output2(", Lesbian-fucked Capt. Khorgan");
					}
				}
				if(flags["TARKUS_BOMB_TIMER"] != undefined && flags["TARKUS_BOMB_TIMER"] > 0) output2("\n<b>* The Stellar Tether, Time-Bomb Countdown: </b>" + prettifyMinutes(flags["TARKUS_BOMB_TIMER"]));
			}
			mainCount++;
		}
		// Myrellion
		if(flags["PLANET_3_UNLOCKED"] != undefined && (showID == "Myrellion" || showID == "All"))
		{
			output2("\n<b>Myrellion</b>");
			output2("\n<b>* Status:</b>");
			if(9999 == 0) output2(" Coordinates received");
			else output2(" <i>In progress...</i> STILL IN DEVELOPMENT");
			output2("\n<b>* Scout Transport:</b> D.M.Z.");
			if(flags["NO_ANTS_LAND_TAXI_UNLOCKED"] != undefined) output2(", No Myr's Land");
			if(flags["DEEP_CAVES_TAXI_UNLOCKED"] != undefined) output2(", Deep Caves");
			mainCount++;
		}
		// Uveto
		if(9999 == 0 && (showID == "Uveto" || showID == "All"))
		{
			output2("\n<b>Uveto VII</b>");
			output2("\n<b>* Status:</b>");
			if(9999 == 0) output2(" Coordinates received");
			else output2(" <i>In progress...</i> STILL IN DEVELOPMENT");
			mainCount++;
		}
		// Nothing recorded
		if(mainCount == 0)
		{
			output2("\n<b><u>Not Available</u></b>");
			output2("\n* <i>No data from your main mission has been logged</i>");
			if(showID != "All") output2("<i> at this location</i>");
			output2("<i>.</i>");
		}
		
		// Side quests:
		var sideCount:Number = 0;
		output2("\n\n" + blockHeader("Side Missions"));
		if(showID == "New Texas" || showID == "All")
		{
			// The Treatment
			if(CodexManager.entryViewed("The Treatment"))
			{
				output2("\n<b><u>The Treatment</u></b>");
				output2("\n<b>* Status: </b>");
				if(pc.hasStatusEffect("The Treatment")) output2("Undergoing Treatment");
				else if(pc.hasStatusEffect("Temporary Treatment")) output2("Undergoing temporary Treatment");
				else if(pc.hasStatusEffect("Treated")) output2(" Treated");
				else output2(" Untreated");
				if(pc.hasStatusEffect("The Treatment"))
				{
					output2("\n<b>* Current Effects:</b>");
					if(pc.statusEffectv1("The Treatment") == 0) output2(" Feminine, Cow");
					else if(pc.statusEffectv1("The Treatment") == 1) output2(" Maculine, Stud");
					else if(pc.statusEffectv1("The Treatment") == 2) output2(" Feminine, Stud");
					else if(pc.statusEffectv1("The Treatment") == 3) output2(" Unisex, Cow and Stud");
					else if(pc.statusEffectv1("The Treatment") == 4) output2(" Maculine, Amazonian");
					else if(pc.statusEffectv1("The Treatment") == 5) output2(" Feminine, Double Stud");
					else if(pc.statusEffectv1("The Treatment") == 6) output2(" Feminine, Undersized");
					// Timer stuff
					var treatedMinutes:Number = 10080 - pc.getStatusMinutes("The Treatment");
					output2("\n<b>* Duration: </b>" + prettifyMinutes(treatedMinutes));
				}
				sideCount++;
			}
			// Varmint Wranglin'
			if(flags["MET_CAMERON"] != undefined)
			{
				output2("\n<b><u>Varmint Wranglin’</u></b>");
				output2("\n<b>* Varmints Captured, Total: </b>");
				if(flags["VARMINTS_CAUGHT"] != undefined) output2(flags["VARMINTS_CAUGHT"]);
				else output2("<i>In progress...</i>");
				// Silicone stuff!
				var siliconeTotal:int = 0;
				if(flags["TAKEN_SILICONE_538"] != undefined) siliconeTotal++;
				if(flags["TAKEN_SILICONE_552"] != undefined) siliconeTotal++;
				if(flags["TAKEN_SILICONE_556"] != undefined) siliconeTotal++;
				if(flags["TAKEN_SILICONE_564"] != undefined) siliconeTotal++;
				if(siliconeTotal > 0) output2("\n<b>* Silicone Collected: </b>" + siliconeTotal);
				if(siliconeTotal >= 4) output2(", Completed");
				sideCount++;
			}
			// Breaking the male milker
			if(flags["MILK_BARN_COCKMILKER_BROKEN"] != undefined || flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] != undefined)
			{
				output2("\n<b><u>Prostate Milker</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] != undefined && flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] <= 0) output2(" Paid, Fixed!");
				else if(flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] != undefined) output2(" Paid, Repairing...");
				else output2(" Broken");
				sideCount++;
			}
		}

		if(showID == "Mhen'ga" || showID == "All")
		{
			// Zil Capture
			if(flags["ACCEPTED_JULIANS_ZIL_CAPTURE_MISSION"] != undefined)
			{
				output2("\n<b><u>Zil Capture</u></b>");
				output2("\n<b>* Female Zil:</b>");
				if(flags["CAPTURED_A_FEMALE_ZIL_FOR_DR_HASWELL"] != undefined) output2(" Captured");
				else output2(" <i>In progress...</i>");
				output2("\n<b>* Male Zil:</b>");
				if(flags["CAPTURED_A_MALE_ZIL_FOR_DR_HASWELL"] != undefined) output2(" Captured");
				else output2(" <i>In progress...</i>");
				output2("\n<b>* Status:</b>");
				if(flags["CAPTURED_A_FEMALE_ZIL_FOR_DR_HASWELL"] != undefined && flags["CAPTURED_A_MALE_ZIL_FOR_DR_HASWELL"] != undefined) output2(" Completed");
				else output2(" <i>In progress...</i>");
				sideCount++;
			}
			// Penny's Zil Problem
			if(flags["MET_PENNY"] != undefined)
			{
				output2("\n<b><u>Penny's Zil Problem</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["ZIL_PROBLEM_DEALT_WITH"] != undefined) output2(" Completed");
				else output2(" <i>In progress...</i>");
				sideCount++;
			}
			// The Forge Machina
			if(flags["TALKED_WITH_CARL_ABOUT_HIS_ROBOT"] != undefined)
			{
				output2("\n<b><u>The Forge Machina</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["ROBOT_QUEST_COMPLETE"] >= 2) output2(" Robot retrieved, Completed");
				else if(flags["ROBOT_QUEST_COMPLETE"] == 1) output2(" Robot found, Return to Carl");
				else output2(" <i>In progress...</i>");
				sideCount++;
			}
		}
		if(showID == "Tarkus" || showID == "All")
		{
			// Deck 13
			if(flags["ANNO_MISSION_OFFER"] != undefined)
			{
				output2("\n<b><u>The Ghost Deck</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["ANNO_MISSION_OFFER"] <= 1) output2(" Offered");
				else
				{
					if(flags["DECK13_COMPLETE"] != undefined) 
					{
						output2(" Completed");
						if(flags["DECK13_GRAY_PRIME_DECISION"] == 1) output2(", Helped Nova with cybernetic bodies");
						if(flags["DECK13_GRAY_PRIME_DECISION"] == 2) output2(", Convinced Nova to make use of gray goo");
						if(flags["DECK13_GRAY_PRIME_DECISION"] == 3) output2(", Killed Nova");
					}
					else output2(" <i>In progress...</i>");
					if(flags["DECK13_SAMPLES_TAKEN"] != undefined) output2("\n<b>* Gray Goo Samples Taken: </b>" + flags["DECK13_SAMPLES_TAKEN"]);
					output2("\n<b>* Deck 13:</b>");
					if(flags["DECK13_REACTOR_DOOR_OPEN"] != undefined) output2(" Reactor door open");
					else output2(" Reactor door closed");
					if(flags["DECK13_SHIELDS_ON"] != undefined) output2(", Shields on");
					else output2(", Shields off");
					if(flags["DECK13_ARMORY_ENTERED"] != undefined) output2(", Entered armory");
					if(flags["DECK13_TAKEN_PISTOL"] != undefined || flags["DECK13_TAKEN_RIFLE"] != undefined) output2(", Looted armory");
					if(flags["DECK13_CREW_TALK"] != undefined) output2("\n<b>* Nova:</b> Met her, Found out about her crew");
					if(flags["GRAY_PRIME_DEFEATED_VIA_HP"] != undefined)
					{
						output2("\n<b>* Nova, Combat:</b> She was defeated using physical force");
						if(flags["GRAY_PRIME_DEFEATED_VIA_HP"] == 2) output2(" twice in a row");
					}
					if(flags["ANNO_NOVA_UPDATE"] != undefined && flags["ANNO_MISSION_OFFER"] >= 3)
					{
						output2("\n<b>* Nova Update:</b>");
						if(flags["ANNO_NOVA_UPDATE"] >= 2) output2(" Made [goo.name]");
						else output2(" <i>In progress...</i>");
					}
				}
				output2("\n<b>* Anno:</b>");
				if(flags["ANNO_MISSION_OFFER"] <= 1) output2(" Offered");
				sideCount++;
			}
			// Colenso's Conspiracy Theories
			if(flags["SEXBOT_QUEST_STATUS"] != undefined)
			{
				output2("\n<b><u>The Hnngularity</u></b>");
				output2("\n<b>* Sexbots Scanned: </b>");
				if(flags["SEXBOTS_SCANNED_FOR_COLENSO"] != undefined) output2(flags["SEXBOTS_SCANNED_FOR_COLENSO"]);
				else output2(" <i>In progress...</i>");
				if(flags["SEXBOTS_SCANNED_FOR_COLENSO"] >= 4)
				{
					output2(", Completed");
					if(flags["SEXBOT_QUEST_STATUS"] < 2 && flags["HAND_SOS_ROBOT_DESTROYED"] == undefined && flags["HAND_SO_TALKED_DOWN"] == undefined)
					{
						output2("\n<b>* Sexbot Factory:</b> <i>Exploring...</i>");
					}
					else
					{
						output2("\n<b>* Sexbot Factory:</b>");
						if(flags["SEXBOT_FACTORY_DISABLED"] != undefined) output2(" Disabled");
						else if(flags["SEXBOTS_GENDER_SETTING"] == 1) output2(" Active, Male sexbot preferred");
						else if(flags["SEXBOTS_GENDER_SETTING"] == -1) output2(" Active, Female sexbot preferred");
						else output2(" Active");
						if(flags["HAND_SOS_ROBOT_DESTROYED"] != undefined)
						{
							output2("\n<b>* Firewall:</b>");
							if(flags["TASTED_THE_FLAME"] != undefined)output2(" Used flamethrower,");
							output2(" Destroyed");
						}
						output2("\n<b>* Hand So:</b>");
						if(flags["HAND_SO_LISTENED_TO"] != undefined) output2(" Listened to,");
						if(flags["HAND_SOS_CONSOLE_EXPLODED"] != undefined || flags["HAND_SO_LOOTED"] != undefined)
						{
							if(flags["HAND_SO_TALKED_DOWN"] != undefined) output2(" Talked down to");
							else output2(" Defeated");
							if(flags["HAND_SOS_CONSOLE_EXPLODED"] != undefined) output2(", Console destroyed");
							else if(flags["HAND_SO_LOOTED"] != undefined && !pc.hasKeyItem("Hand So's Data Bead")) output2(", Disposed of data bead");
							if(pc.hasKeyItem("Hand So's Data Bead")) output2(", Contained in data bead");
						}
						else output2(" <i>Active...</i>");
					}
				}
				sideCount++;
			}
			// Lane's Illegal Activity
			if(flags["MET_LANE"] != undefined)
			{
				output2("\n<b><u>Lane’s Plane</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["LANE_FULLY_HYPNOTISED_FOREVER"] == undefined)
				{
					if(flags["LANE_DETOX_COUNTER"] != undefined) output2(" Detoxifying");
					else if(hasHypnosisEffect()) output2(" Hypnotized");
					else output2(" Normal");
				}
				else output2(" Hypnotized forever");
				if(flags["LANE_PAYS_PC_ERRY_DAY"] != undefined) output2(", Get paid 200 credits per day");
				if(flags["PC_PAYS_LANE_ERRY_DAY"] != undefined) output2(", Get taxed 500 credits per day");
				output2("\n<b>* Lane:</b>");
				if(flags["LANE_DISABLED"] != undefined) output2(" Inactive");
				else output2(" Active");
				if(flags["LANE_TIMES_HYPNOTISED"] > 0) output2("\n<b>* Lane, Times Hypnotized: </b>" + flags["LANE_TIMES_HYPNOTISED"]);
				sideCount++;
			}
		}

		if(showID == "Myrellion" || showID == "All")
		{
			// The Great Ant World War
			if(flags["MET_JURO"] != undefined)
			{
				output2("\n<b><u>War in Myrellion</u></b>");
				output2("\n<b>* Status:</b>");
				if(9999 == 0) output2(" ???");
				else output2(" <i>In progress... STILL IN DEVELOPMENT</i>");
				sideCount++;
			}
			// IrelliaQuest
			if(flags["IRELLIA_QUEST_STATUS"] != undefined)
			{
				output2("\n<b><u>IrelliaQuest</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["IRELLIA_QUEST_STATUS"] == 0) output2(" Refused");
				else if(flags["IRELLIA_QUEST_STATUS"] == -1) output2(" Failed, Bomb exploded");
				else if(flags["IRELLIA_QUEST_STATUS"] == 2) output2(" Investigating, Attend unification rally");
				else if(flags["IRELLIA_QUEST_STATUS"] == 3) output2(" Investigated, Not reported");
				else if(flags["IRELLIA_QUEST_STATUS"] == 4) output2(" Investigated, Reported");
				else if(flags["IRELLIA_QUEST_STATUS"] >= 5) output2(" Investigated, Completed");
				else if(flags["IRELLIA_QUEST_STATUS"] >= 6) output2(", Rewarded, Irellia's private chambers unlocked");
				else output2(" <i>In progress...</i>");
				sideCount++;
			}
			// "All the Feels: The Quest"
			if(flags["SIERVA_LATEGOODBYE_RESPONSE"] != undefined)
			{
				if(flags["LEARNED_IAYAS_FATE"] == undefined) output2("\n<b><u>In Love and War</u></b>");
				else output2("\n<b><u>War is Hell</u></b>");
				output2("\n<b>* Sierva’s Request:</b>");
				if(flags["SIERVA_LATEGOODBYE_RESPONSE"] == 1) output2(" Refused");
				else if(flags["SIERVA_LATEGOODBYE_RESPONSE"] == 2)
				{
					if(flags["LEARNED_IAYAS_FATE"] == undefined) output2(" Accepted, Find Iaya");
					else output2(" Accepted, Learned Iaya’s Fate, Tell Sievra");
				}
				else if(flags["SIERVA_LATEGOODBYE_RESPONSE"] == 3) output2(" Accepted, Learned Iaya’s Fate, Told Sievra, Completed");
				sideCount++;
			}
			// Red Myr Blood Donation Drive
			if(flags["NEVRIE_QUEST"] != undefined)
			{
				output2("\n<b><u>Nevrie’s Co-worker</u></b>");
				output2("\n<b>* Red Myr Blood Sample:</b>");
				if(pc.hasKeyItem("Red Myr Blood") || flags["LIEVE_BLOOD_SAMPLE"] != undefined || flags["NEHZARA_BLOOD_SAMPLE"] != undefined)
				{
					output2(" Acquired");
					if(flags["LIEVE_BLOOD_SAMPLE"] != undefined || flags["NEHZARA_BLOOD_SAMPLE"] != undefined) output2(" from");
					if(flags["LIEVE_BLOOD_SAMPLE"] != undefined) output2(" Lieve");
					if(flags["LIEVE_BLOOD_SAMPLE"] != undefined && flags["NEHZARA_BLOOD_SAMPLE"] != undefined) output2(" and");
					if(flags["NEHZARA_BLOOD_SAMPLE"] != undefined) output2(" Nehzara");
					if(flags["NEVRIE_QUEST"] < 2) output2(", Return to Nevrie");
				}
				else output2(" <i>In progress...</i>");
				if(flags["NEVRIE_QUEST"] >= 2)
				{
					output2(", Completed");
					if(flags["NEVRIE_QUEST"] < 3) output2(", Dr. McAllister is out");
					else output2(", Lab unlocked");
				}
				sideCount++;
			}
			// Ant Hybrids
			if(flags["MCALLISTER_MYR_HYBRIDITY"] != undefined)
			{
				output2("\n<b><u>Myr Hybridity</u></b>");
				output2("\n<b>* Research:</b>");
				if(flags["MCALLISTER_MYR_HYBRIDITY"] == 1) output2(" Pending funds...");
				else if(flags["MCALLISTER_MYR_HYBRIDITY"] == 2)
				{
					output2(" Funded");
					if(GetGameTimestamp() < (flags["MCALLISTER_MYR_HYBRIDITY_START"] + (7 * 24 * 60))) output2(", Researching...");
					else output2(", Completed");
				}
				if(flags["MCALLISTER_MYR_HYBRIDITY"] >= 3)
				{
					output2("\n<b>* Orange Myr Data Chit:</b>");
					if(flags["MCALLISTER_MYR_HYBRIDITY"] == 4) output2(" Gave to Juro");
					else if(pc.hasKeyItem("Orange Myr Data")) output2(" In inventory");
					else output2(" <i>Missing</i>");
				}
				sideCount++;
			}
			// Kara's Big Adventure!
			if(flags["BEEN_TO_MYRELLION_BAR"] != undefined && flags["MET_KARA"] != undefined)
			{
				output2("\n<b><u>KaraQuest</u></b>");
				output2("\n<b>* First Encounter:</b>");
				if(flags["LET_SHADE_AND_KARA_DUKE_IT_OUT"] != undefined) output2(" Ignored Kara and Shade");
				else if(flags["DISTRACTED_SHADE"] != undefined) output2(" Distracted Shade");
				else if(flags["TRIPPED_ON_SHADE"] != undefined) output2(" Tripped on Shade");
				else if(flags["BETRAYED_KARA"] == 1) output2(" Betrayed Kara by telling Shade");
				else if(flags["BETRAYED_KARA"] == 2) output2(" Agreed to Shade’s Offer to catch Kara");
				else output2(" <i>In progress...</i>");
				if(flags["SHADE_DEFEATED_WITH_KARA"] != undefined) output2(", Won against Shade");
				if(flags["KARA_DEFEATED_WITH_SHADE"] != undefined) output2(", Won against Kara");
				if(flags["LOST_TO_SHADE_WITH_KARA"] != undefined) output2(", Lost against Shade");
				if(flags["SHADE_PAID_YOU"] != undefined) output2(", Rewarded by Shade");
				if(flags["KARA_PAID_YOU"] != undefined) output2(", Rewarded by Kara");
				sideCount++;
			}
		}

		if(showID == "Uveto" || showID == "All")
		{
			// 9999
			if(9999 == 0)
			{
				output2("\n<b><u>PLACEHOLDER</u></b>");
				output2("\n<b>* OBJECTIVE:</b>");
				if(9999 == 0) output2(" Completed");
				else output2(" <i>In progress...</i>");
				sideCount++;
			}
		}
		if(showID == "Ausaril" || showID == "All")
		{
			// Puppyslutmas
			if(flags["PUPPYSLUTMAS_2014"] != undefined)
			{
				if(silly) output2("\n<b><u>Puppyslutmas</u></b>");
				else output2("\n<b><u>Dorna Christmas Gala</u></b>");
				output2("\n<b>* Date:</b> " + flags["PUPPYSLUTMAS_2014"]);
				if(flags["PUPPYSLUTMAS_2014"] == "Syri" && flags["PUPPYSLUTMAS_2014_SYRI_CLOTHES"] != undefined) output2(" in " + indefiniteArticle(flags["PUPPYSLUTMAS_2014_SYRI_CLOTHES"]));
				if(flags["PUPPYSLUTMAS_2014_DRINKS"] != undefined)
				{
					output2("\n<b>* Drinks Total:</b> " + flags["PUPPYSLUTMAS_2014_DRINKS"]);
					if(flags["PUPPYSLUTMAS_2014_DRINKS"] >= 4) output2(", Smashed");
					else if(flags["PUPPYSLUTMAS_2014_DRINKS"] >= 2) output2(", Drunk");
					else if(flags["PUPPYSLUTMAS_2014_DRINKS"] >= 1) output2(", Buzzed");
					else output2(", Sober");
				}
				sideCount++;
			}
		}

		// Nothing recorded
		if(sideCount == 0)
		{
			output2("\n<b><u>Not Available</u></b>");
			output2("\n* <i>No data from side missions have been logged</i>");
			if(showID != "All") output2("<i> at this location</i>");
			output2("<i>.</i>");
		}
		
		// Various Encounters:
		output2("\n\n" + blockHeader("Various Encounters"));
		var variousCount:int = 0;
		if(showID == "Tavros" || showID == "All")
		{
			// Hangar stuff
			if(flags["RECRUITED_CELISE"] > 0 || flags["MET_VAHN"] != undefined)
			{
				output2("\n<b><u>Tavros Station Hangar</u></b>");
				// Slimeyface
				if(flags["RECRUITED_CELISE"] > 0)
				{
					output2("\n<b>* Celise:</b> Met her");
					if(flags["GIGACELISE"] == 1)output2(", Gigaform");
					output2(", Crewmember");
					if(flags["CELISE_ONBOARD"] > 0) output2(" (Onboard Ship)");
					if(flags["CELISE_ONBOARD"] == undefined) output2(" (At Tavros Station)");
					if(flags["TIMES_CELISE_IN_BALLS"] != undefined)
					{
						output2("\n<b>* Celise, Times She’s Stimulated</b>");
						if(silly) output2("<b> Your Internal Testicular Fortitude</b>");
						else output2("<b> the Inside of Your Balls</b>");
						output2("<b>: </b>" + flags["TIMES_CELISE_IN_BALLS"]);
					}
					if(flags["LACTATION_FED_CELISE"] != undefined) output2("\n<b>* Celise, Times Breast-Fed Her: </b>" + flags["LACTATION_FED_CELISE"]);
				}
				// Vahn
				if(flags["MET_VAHN"] != undefined)
				{
					output2("\n<b>* Vahn:</b> Met him");
					if(flags["SEXED_VAHN"] != undefined)
					{
						output2(", Sexed him");
						if(flags["FUCKED_VAHNS_ASS"] != undefined) output2(", Fucked his ass");
					}
				}
				variousCount++;
			}
			// Anon's Bar!
			if(flags["MET_ALEX"] != undefined || flags["SEEN_SELLESY"] != undefined || flags["APPROACHED_SHELLY"] != undefined)
			{
				output2("\n<b><u>Anon’s Bar and Board</u></b>");
				// Alex
				if(flags["MET_ALEX"] != undefined)
				{
					if(flags["FUCKED_ALEX"] != undefined || flags["LAST_MINUTE_ALEX_BACK_OUT"] != undefined) output2("\n<b>* Alex:</b>")
					else output2("\n<b>* Pretty Boy:</b>")
					output2(" Met him")
					if(flags["LAST_MINUTE_ALEX_BACK_OUT"] != undefined) output2(", Bailed on him")
					if(flags["FUCKED_ALEX"] != undefined) output2("\n<b>* Alex, Times Sexed: </b>" + flags["FUCKED_ALEX"]);
				}
				// Sellesy
				if(flags["SEEN_SELLESY"] != undefined)
				{
					if(flags["MET_SELLESY"] != undefined) output2("\n<b>* Sellesy:</b>");
					else output2("\n<b>* Three-Breasted Waitress:</b>");
					output2(" Met her");
				}
				// Shelly
				if(flags["APPROACHED_SHELLY"] != undefined)
				{
					if(flags["KNOW_SHELLYS_NAME"] != undefined) output2("\n<b>* Shelly:</b>");
					else output2("\n<b>* Bunny Woman:</b>");
					if(flags["TALKED_TO_SHELLY"] != undefined) output2(" Talked to");
					else output2(" Approached");
					if(flags["ASSISTED_SHELLY_WITH_LAYING"] != undefined) output2(", Assisted her egg laying");
					if(flags["CAME_INSIDE_SHELLY"] != undefined) output2(", Came inside her during sex");
				}
				variousCount++;
			}
			// Reaha stuffs
			if(flags["TALK_TO_LADY_1ST"] != undefined)
			{
				output2("\n<b><u>Beth’s Busty Broads</u></b>");
				output2("\n<b>* Brothel Mistress:</b> Met her");
				if(pc.isAss()) output2("\n<b>* Cow-Slut:</b>");
				else output2("\n<b>* Reaha:</b>");
				if(flags["REAHA_BOUGHT"] != undefined) output2(" Bought");
				else output2(" Whoring");
				if(flags["REAHA_FREE"] != undefined) output2(", Free to speak");
				if(flags["REAHA_SLAVE"] != undefined) output2(", Sex slave");
				if(flags["REAHA_IS_CREW"] != undefined)
				{
					output2(", Crewmember");
					// Reaha Expansion
					if(flags["REAHA_IS_CREW"] == 1) output2(" (Onboard Ship)");
					if(flags["REAHA_IS_CREW"] == 2) output2(" (At Tavros Station)");
					if(flags["REAHA_IS_CREW"] == 3) output2(" (At New Texas)");
					if(flags["REAHA_MILKMODS_UNLOCKED"] != undefined)
					{
						output2("\n<b>* Reaha, Milk Type: </b>" + GLOBAL.FLUID_TYPE_NAMES[chars["REAHA"].milkType]);
						if(flags["REAHA_MILK_CHANGED"] != undefined) output2("\n<b>* Reaha, Milk Type, Times Changed: </b>" + flags["REAHA_MILK_CHANGED"]);
					}
					if(flags["REAHA_TALK_ADDICTION_CURE"] != undefined)
					{
						output2("\n<b>* Reaha, Patch Addiction:</b>");
						if(flags["REAHA_ADDICTION_CURED"] != undefined) output2(" Cured");
						else output2(" Ongoing");
					}
					if(flags["REAHA_LAST_DOMMY_FUCK"] != undefined) output2("\n<b>* Reaha, Days Since Last Dommy Fuck: </b>" + (days - flags["REAHA_LAST_DOMMY_FUCK"]));
				}
				variousCount++;
			}
			// Serabutts
			if(flags["MET_SERA"] != undefined)
			{
				output2("\n<b><u>The Dark Chrysalis</u></b>");
				output2("\n<b>* Sera:</b> Met her");
				if(flags["SERA_TALKED_ABOUT_BEING_PISSED_OFF"] == undefined) output2(", Pissed off");
				else output2(", Vented her frustrations");
				if(flags["FUCKED SERA"] != undefined)
				{
					if(flags["FUCKED SERA"] > 0) output2("\n<b>* Sera, Times Sexed: </b>" + flags["GOTTEN_INTIMATE_WITH_JADE"]);
					if(flags["SERA FUCKED PCS TAILCUNT"] > 0) output2("\n<b>* Sera, Times She Fucked Your Tail Cunt: </b>" + flags["SERA FUCKED PCS TAILCUNT"]);
					if(flags["TIMES_RODE_BY_SERA"] > 0) output2("\n<b>* Sera, Times She Rode You: </b>" + flags["TIMES_RODE_BY_SERA"]);
					if(flags["SERA_STUCK_IT_ALL_IN_BUTT"] > 0) output2("\n<b>* Sera, Times She Fucked Your Ass: </b>" + flags["SERA_STUCK_IT_ALL_IN_BUTT"]);
				}
				variousCount++;
			}
			// Panda, please
			if(flags["KNOW_JADES_NAME"] != undefined)
			{
				output2("\n<b><u>Fur Effect</u></b>");
				output2("\n<b>* Jade:</b> Met her");
				if(flags["GOTTEN_INTIMATE_WITH_JADE"] != undefined) output2("\n<b>* Jade, Times Sexed: </b>" + flags["GOTTEN_INTIMATE_WITH_JADE"]);
				if(flags["TITFUCKED_JADE"] != undefined) output2("\n<b>* Jade, Times Titfucked: </b>" + flags["TITFUCKED_JADE"]);
				if(flags["TIMES_SAT_ON_JADES_FACE"] != undefined) output2("\n<b>* Jade, Times Sat on Her Face: </b>" + flags["TIMES_SAT_ON_JADES_FACE"]);
				if(flags["CAN_SUGGEST_JADES_NIPPLE_TREATMENT"] != undefined)
				{
					output2("\n<b>* Jade, Nipple Treatment:</b> Suggested");
					if(flags["TALKED_WITH_JADE_ABOUT_TENTACLE_NIPPLES"] != undefined) output2(", Talked about");
					if(flags["JADE_NIPPLE_TF_QUEUED"] == 1) output2(", Paid for, Has Nipplelux");
					if(flags["JADE_NIPPLE_TF_QUEUED"] >= 2) output2(", Paid for, Used Nipplelux, Completed");
				}
				variousCount++;
			}
			// Alissiness
			if(flags["MET_ALICE"] != undefined)
			{
				output2("\n<b><u>Mi Amour</u></b>");
				output2("\n<b>* Aliss:</b> Met her");
				if(flags["TALKED_TO_ALIIS_ABOUT_LIBIDO"] != undefined) output2("\n<b>* Aliss, Lust:</b>" + chars["ALISS"].lust());
				if(flags["TIMES_SEXED_ALISS"] != undefined) output2("\n<b>* Aliss, Times Sexed: </b>" + flags["TIMES_SEXED_ALISS"]);
				if(flags["ANNO_OWNS_LIGHT_STRAPON"] != undefined) output2("\n<b>* Aliss, Unique Sale:</b> Anno's hardlight strapon");
				variousCount++;
			}
			// Shear Beauty!
			if(flags["MET_CERIA"] != undefined)
			{
				output2("\n<b><u>Shear Beauty</u></b>");
				output2("\n<b>* Ceria:</b> Met her");
				if(flags["CERIA_EAR_TOUCH_UNLOCKED"] != undefined)
				{
					output2(", Touched her ears");
					if(flags["EATEN_CERIA_OUT"] != undefined) output2(", Ate her pussy");
					if(flags["CERIA_MOUTH_FLOOD"] != undefined) output2(", Flooded her mouth with semen");
				}
				if(flags["HEARD_OF_NAHRI"] != undefined) output2("\n<b>* Nahri:</b> Heard of her");
				if(flags["SEXED_PENNY"] != undefined) output2("\n<b>* Penny:</b> Sexed her");
				variousCount++;
			}
		}
		if(showID == "New Texas" || showID == "All")
		{
			// Customs
			if(flags["NEW_TEXAN_CUSTOMS_MET"] != undefined)
			{
				output2("\n<b><u>New Texas Customs Office</u></b>");
				// Ogram and Amma
				output2("\n<b>* Ogram and Amma:</b> Met them");
				if(flags["FUCKED_TEXAN_CUSTOMS"] != undefined) output2(", Sexed them");
				variousCount++;
			}
			if(flags["MET_BIG_T"] != undefined || flags["MET_ELLIE"] != undefined || flags["MET_HERMAN"] != undefined || flags["MET_ZEPHYR"] != undefined)
			{
				output2("\n<b><u>Big T’s Ranch</u></b>");
				// Big T!
				if(flags["MET_BIG_T"] != undefined) 
				{
					output2("\n<b>* Big T:</b> Met him");
					if(flags["SEXED_BIG_T"] != undefined) output2("\n<b>* Big T, Times Sexed: </b>" + flags["SEXED_BIG_T"]);
				}
				// Like, Ellie and stuff!
				if(flags["MET_ELLIE"] != undefined)
				{
					output2("\n<b>* Ellie:</b> Met her");
					if(flags["SUCKED_ELLIES_TITS"] != undefined) output2(", Sucked her tits");
					if(flags["ELLIE_EMBARASSED_LIL_DICK_FUCK"] != undefined) output2(", Fucked her with an embarrassingly small dick for her size");
					if(flags["ELLIE_SEXED"] != undefined) output2("\n<b>* Ellie, Times Sexed: </b>" + flags["ELLIE_SEXED"]);
				}
				// BBQ, Mmmm...
				if(flags["MET_HERMAN"] != undefined)
				{
					output2("\n<b>* Herman:</b> Met him");
					if(flags["HERMAN_SPECIAL_ORDER"] != undefined) output2("\n<b>* Herman, Times Requested “Special Order”: </b>" + flags["HERMAN_SPECIAL_ORDER"]);
				}
				// Zephyrbutts
				if(flags["MET_ZEPHYR"] != undefined)
				{
					output2("\n<b>* Zephyr:</b> Met her");
					if(flags["ZEPHYR_PISSED"] != undefined) output2(", Pissed off");
					if(flags["SEXED_ZEPHYR"] != undefined) output2(", Sexed her");
					if(flags["ZEPHYR_FUCKED_PC"] != undefined) output2(", She fucked you");
				}
				variousCount++;
			}
			// The Fields
			if(flags["MET_CAMERON"] != undefined)
			{
				output2("\n<b><u>The Fields</u></b>");
				output2("\n<b>* Cameron:</b> Met him");
				if(flags["SEXED_CAMERON"] != undefined) output2("\n<b>* Cameron, Times Sexed: </b>" + flags["SEXED_CAMERON"]);
				variousCount++;
			}
			// Iced Teats
			if(flags["MET_YAMMI"] != undefined)
			{
				output2("\n<b><u>Iced Teats</u></b>");
				// Yum, icecream!
				var flavorsTotal:int = 0;
				if(flags["HAD_GEWINFRUIT"] != undefined) flavorsTotal++;
				if(flags["HAD_YOKTO"] != undefined) flavorsTotal++;
				if(flags["HAD_BLITZABERRY"] != undefined) flavorsTotal++;
				if(flags["HAD_STRAWBERRY"] != undefined) flavorsTotal++;
				if(flags["HAD_JUMBIJUMBI"] != undefined) flavorsTotal++;
				if(flags["HAD_DARGINUT"] != undefined) flavorsTotal++;
				if(flags["HAD_CHOCOLATE"] != undefined) flavorsTotal++;
				if(flags["HAD_FLAMEBERKS"] != undefined) flavorsTotal++;
				output2("\n<b>* Number of Flavors Tasted: </b>" + flavorsTotal);
				// Yammi follower?
				output2("\n<b>* Yammi:</b> Met her");
				if(yammiIsOwned())
				{
					output2(", Crewmember");
					if(9999 == 0) output2(" (Onboard Ship)");
				}
				// Reaha special
				if(flags["REAHA_ICE_CREAM_TIMES"] != undefined) output2("\n<b>* Reaha, Times Had Icecream With: </b>" + flags["REAHA_ICE_CREAM_TIMES"]);
				variousCount++;
			}
			// Milk Barn, where all the cows stay at!
			if(flags["BRYNN_AUTOENTER"] != undefined || flags["MET_GIANNA"] != undefined || flags["MET_MILLIE"] != undefined || flags["MET_YANCY"] != undefined)
			{
				output2("\n<b><u>Milk Barn</u></b>");
				// Brynn
				if(flags["BRYNN_AUTOENTER"] != undefined)
				{
					if(flags["BRYNN_INTRODUCED"] != undefined) output2("\n<b>* Brynn:</b>");
					else output2("\n<b>* Well-Endowed Stud:</b>");
					output2(" Met him");
					if(flags["SUCKED_BRYNN"] != undefined) output2(", Sucked him off");
					if(flags["DEEPTHROATED_BRYNN"] != undefined) output2(", Deepthroated his cock");
				}
				// Giannannanna
				if(flags["MET_GIANNA"] != undefined)
				{
					output2("\n<b>* Gianna:</b>");
					if(giannaAWOL()) output2(" Away");
					else output2(" Active");
					if(flags["GIVEN_GIANNA_SILICONE"] != undefined) output2(", Gave her Silicone");
					// Talk
					if(flags["TALKED_TO_GIANNA"] != undefined)
					{
						if(flags["GIANNA_ABOUT_HER_TALK_RESULT"] != undefined) output2("\n<b>* Gianna, Talk, Her Assumption About A.I. Having Emotions:</b>");
						if(flags["GIANNA_ABOUT_HER_TALK_RESULT"] == 0) output2(" Refuted her");
						if(flags["GIANNA_ABOUT_HER_TALK_RESULT"] == 1) output2(" Agreed with her");
						if(flags["GIANNA_AI_TALK_RESULT"] != undefined) output2("\n<b>* Gianna, Talk, Her Desire to be More Than Just a Companion:</b>");
						if(flags["GIANNA_AI_TALK_RESULT"] == 0) output2(" Discouraged her");
						if(flags["GIANNA_AI_TALK_RESULT"] == 1) output2(" Encouraged her");
						if(flags["GIANNA_BODY_TALK_RESULT"] != undefined) output2("\n<b>* Gianna, Talk, The Technical Specifications of Her Body:</b>");
						if(flags["GIANNA_BODY_TALK_RESULT"] == 0) output2(" Changed the topic");
						if(flags["GIANNA_BODY_TALK_RESULT"] == 1) output2(" Listened to her");
						if(flags["GIANNA_OWNER_TALK_RESULT"] != undefined) output2("\n<b>* Gianna, Talk, About Her Previous Owner Abandoning Her:</b>");
						if(flags["GIANNA_OWNER_TALK_RESULT"] == 0) output2(" Dissuaded her");
						if(flags["GIANNA_OWNER_TALK_RESULT"] == 1) output2(" Took a neutral stance");
						if(flags["GIANNA_OWNER_TALK_RESULT"] == 2) output2(" Comforted her");
						if(flags["GIANNA_MAXBUTT_REACTION"] != undefined) output2("\n<b>* Gianna, Transformation, Response:</b>");
						if(flags["GIANNA_MAXBUTT_REACTION"] == 0) output2(" Jerk about giant booty");
						if(flags["GIANNA_MAXBUTT_REACTION"] == 1) output2(" Neutral about giant booty");
						if(flags["GIANNA_MAXBUTT_REACTION"] == 2) output2(" Nice about giant booty");
					}
					// Temp
					if(flags["GIANNA_BODY_TALK_RESULT"] != undefined)
					{
						output2("\n<b>* Gianna, Body Tempurature:</b>");
						if(flags["GIANNA_TEMP"] <= -1) output2(" Cool");
						else if(flags["GIANNA_TEMP"] >= 1) output2(" Hot");
					}
					else output2(" Normal");
					// Personality
					if(flags["GIANNA_ABOUT_HER_TALK_RESULT"] == 1)
					{
						output2("\n<b>* Gianna, Personality:</b>");
						if(giannaPersonality() >= 100) output2(" Hyper Positive");
						else if(giannaPersonality() > 80) output2(" Positive");
						else if(giannaPersonality() > 60) output2(" Slightly Positive");
						else if(giannaPersonality() >= 40) output2(" Generic");
						else if(giannaPersonality() >= 20) output2(" Slightly Negative");
						else if(giannaPersonality() > 0) output2(" Negative");
						else output2(" Very Negative");
					}
					// Attachments
					if(flags["GIANNA_BODY_TALK_RESULT"] != undefined)
					{
						output2("\n<b>* Gianna, Simulated Sexual Organs: </b>");
						if(chars["GIANNA"].hasCock())
						{
							output2(GLOBAL.TYPE_NAMES[chars["GIANNA"].cocks[0].cType] + " cock");
							if(chars["GIANNA"].balls == 1) output2(" with a ball");
							else if(chars["GIANNA"].balls > 1) output2(" with " + chars["GIANNA"].balls + " balls");
						}
						if(chars["GIANNA"].hasVagina())
						{
							if(chars["GIANNA"].hasCock()) output2(", ");
							output2(GLOBAL.TYPE_NAMES[chars["GIANNA"].vaginas[0].type] + " vagina");
							if(chars["GIANNA"].vaginas[0].clits == 1) output2(" with a clit");
							else if(chars["GIANNA"].vaginas[0].clits > 1) output2(" with " + chars["GIANNA"].vaginas[0].clits + " clits");
						}
						if(chars["GIANNA"].hasCock() || chars["GIANNA"].hasVagina()) output2(", ");
						output2("Asshole");
					}
					// Sex stuff
					if(flags["GIANNA_STALL_SEEN"] != undefined || flags["GIANNA_TITFUCKS"] != undefined || flags["GIANNA_GIVEN_GIRLY_ORAL_YET"] != undefined || flags["SIXTYNINED_GIANNA"] != undefined || flags["FUCKED_GIANNA_VAGINALLY"] != undefined || flags["GIANNA_CUMFLATION_DISABLED"] != undefined)
					{
						output2("\n<b>* Gianna, Sexual History:</b> Sexed her");
						if(flags["GIANNA_STALL_SEEN"] != undefined) output2(", Fucked in stall");
						if(flags["GIANNA_TITFUCKS"] != undefined) output2(", Titfucked her");
						if(flags["GIANNA_GIVEN_GIRLY_ORAL_YET"] != undefined) output2(", She ate your pussy");
						if(flags["SIXTYNINED_GIANNA"] != undefined) output2(", 69'd with her");
						if(flags["FUCKED_GIANNA_VAGINALLY"] != undefined) output2(", Fucked her vagina");
						if(flags["GIANNA_CUMFLATION_DISABLED"] != undefined) output2(", Cumflation disabled");
					}
					// Timer
					if(flags["GIANNA_FUCK_TIMER"] != undefined) output2("\n<b>* Gianna, Time Since Last Fucked: </b>" + prettifyMinutes(flags["GIANNA_FUCK_TIMER"]));
				}
				//  Millie milks!
				if(flags["MET_MILLIE"] != undefined)
				{
					output2("\n<b>* Millie:</b> Met her");
					if(flags["FUCKED_MILLIE"] != undefined) output2(", Sexed her");
					if(flags["TRIED_TREATMENT_LIGHT"] != undefined) output2(", Tried the Temporary Treatment");
					if(flags["MILLIE_LAST_ACTION"] != undefined) output2("\n<b>* Millie, Previous Action: </b>" + flags["MILLIE_LAST_ACTION"]);
					if(flags["MILLIE_MILK_COUNT"] != undefined) output2("\n<b>* Millie, Times Milked By: </b>" + flags["MILLIE_MILK_COUNT"]);
				}
				// Fancy Yancy
				if(flags["MET_YANCY"] != undefined)
				{
					output2("\n<b>* Yancy:</b> Met him");
					if(flags["YANCY_SEXED"] != undefined) output2(", Sexed him");
					if(flags["YANCY_BUTTFUCKED_BY_PC"] != undefined) output2(", Fucked his ass");
					if(flags["YANCY_PREVIOUS_ENCOUNTER_RESULT"] != undefined) output2("\n<b>* Yancy, Previous Action: </b>" + StringUtil.toTitleCase(flags["YANCY_PREVIOUS_ENCOUNTER_RESULT"]));
					if(flags["YANCY_MILKED_PC"] != undefined) output2("\n<b>* Yancy, Times Milked By: </b>" + flags["YANCY_MILKED_PC"]);
				}
				variousCount++;
			}
			// Ten Ton Gym
			if(flags["MET_QUENTON"] != undefined)
			{
				output2("\n<b><u>Ten Ton Gym</u></b>");
				output2("\n<b>* Quenton:</b> Met him");
				if(flags["SEXED_QUENTON"] != undefined) output2(", Sexed him");
				variousCount++;
			}
		}
		if(showID == "Mhen'ga" || showID == "All")
		{
			// Customs
			if(flags["MET_FLAHNE"] != undefined)
			{
				output2("\n<b><u>Mhen’ga Customs Office</u></b>");
				// Flahne da Rahn
				output2("\n<b>* Flahne:</b> Met her");
				if(flags["FLAHNE_EXHIBITIONISM_UNLOCKED"] != undefined) output2(", Into exhibitionism");
				if(flags["HUGGED_FLAHNE"] != undefined) output2(", Hugged her");
				if(flags["FLAHNE_TALKED_ABOUT_CUMSLUTPENNY"] != undefined) output2(", Talked about cum-slut Penny");
				if(flags["FLAHNE_PISSED"] > 0) output2("\n<b>* Flahne, Interaction:</b> Pissed off for " + flags["FLAHNE_PISSED"] + " hours");
				if(flags["FLAHNE_LIKE_OVIPOSITOR"] != undefined)
				{
					output2("\n<b>* Flahne, Ovipositor:</b>");
					if(flags["FLAHNE_LIKE_OVIPOSITOR"] < 1) output2(" Hidden");
					else if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) output2(" Exposed");
					else output2(" Unknown");
				}
				if(flags["FLAHNE_SEXED"] != undefined) output2("\n<b>* Flahne, Times Sexed: </b>" + flags["FLAHNE_SEXED"]);
				variousCount++;
			}
			// Scrapyard
			if(flags["SCRAPYARD_SEEN"] != undefined)
			{
				output2("\n<b><u>The Art of Scrapyard Maintenance</u></b>");
				output2("\n<b>* Artie:</b> Met him");
				if(flags["MET_GEOFF"] != undefined)
				{
					output2("\n<b>* Geoff:</b> Met him");
					if(flags["SEXED_GEOFF"] != undefined) output2(", Sexed him");
					if(flags["SEXED_GEOFF_MASC"] != undefined) 
					{
						output2(", Male-on-male sex");
						if(flags["GEOFF_FUCKED_DUDES_TWICE"] != undefined) output2(" more than once");
					}
					if(flags["GEOFF_TOPPED"] != undefined)
					output2(", Fucked his ass");
					if(flags["GEOFF_TOPPED"] >= 2) output2(" more than once");
				}
				variousCount++;
			}
			// Badass Mead Hall
			if(flags["MET_BURT"] != undefined || flags["KELLY_MET"] != undefined || flags["MET_SYRI"] != undefined)
			{
				output2("\n<b><u>Burt’s Badass Mead Hall</u></b>");
				// Burt and Company
				if(flags["MET_BURT"] != undefined)
				{
					output2("\n<b>* Burt:</b> Met him");
					if(flags["BURT_MEAD_HALL_DISCUSSIONS"] != undefined) output2("\n<b>* Burt, Talk, Mead Hall Topics:</b>");
					if(flags["BURT_MEAD_HALL_DISCUSSIONS"] >= 1) output2(" Three-Dee");
					if(flags["BURT_MEAD_HALL_DISCUSSIONS"] == 2) output2(" and");
					if(flags["BURT_MEAD_HALL_DISCUSSIONS"] > 2) output2(",");
					if(flags["BURT_MEAD_HALL_DISCUSSIONS"] >= 2) output2(" patrons");
					if(flags["BURT_MEAD_HALL_DISCUSSIONS"] >= 3) output2(", Honey and other employees");
					if(flags["BURT_ZIL_TALK"] != undefined) output2("\n<b>* Burt, Talk, Zil Topics:</b>");
					if(flags["BURT_ZIL_TALK"] >= 1) output2(" The zil culture");
					if(flags["BURT_ZIL_TALK"] == 2) output2(" and");
					if(flags["BURT_ZIL_TALK"] > 2) output2(",");
					if(flags["BURT_ZIL_TALK"] >= 2) output2(" sex drive");
					if(flags["BURT_ZIL_TALK"] == 3) output2(" and");
					if(flags["BURT_ZIL_TALK"] > 3) output2(",");
					if(flags["BURT_ZIL_TALK"] >= 3) output2(" combat methods");
					if(flags["BURT_DRINKS_BOUGHT"] != undefined) output2("\n<b>* Burt, Drinks Bought Total: </b>" + flags["BURT_DRINKS_BOUGHT"]);
					if(flags["TIMES_FUCKED_BURT"] != undefined) output2("\n<b>* Burt, Times Sexed: </b>" + flags["TIMES_FUCKED_BURT"]);
					if(flags["TIMES_THREE_D_SURPRISE_SEXED"] != undefined) output2("\n<b>* Three-Dee, Times Surprise Sexed: </b>" + flags["TIMES_THREE_D_SURPRISE_SEXED"]);
				}
				// Kelly Golden Honey Bunny Butts!
				if(flags["KELLY_MET"] != undefined && flags["KELLY_ENCOUNTERED_AT_THE_BAR"] != undefined)
				{
					output2("\n<b>* Kelly:</b>");
					if(hours >= 6 && hours < 17) output2(" At work");
					else output2(" Met her");
					if(flags["KELLY_CONFESSED"] != undefined) output2(", Confessed her affection");
					if(flags["KELLY_HAD_A_MEAL_SHARED"] != undefined) output2(", Shared a meal together");
					if(flags["KELLY_SEXED"] != undefined) output2("\n<b>* Kelly, Times Sexed: </b>" + flags["KELLY_SEXED"]);
					if(flags["KELLY_BLOWJOBS_GIVEN"] != undefined) output2("\n<b>* Kelly, Times Given Her Blowjobs: </b>" + flags["KELLY_BLOWJOBS_GIVEN"]);
					if(flags["KELLY_HYPERPLAY_COUNT"] != undefined) output2("\n<b>* Kelly, Times Hyperplay: </b>" + flags["KELLY_HYPERPLAY_COUNT"]);
					if(flags["KELLY_HAD_SPECIAL_TAUR_DP"] != undefined) output2("\n<b>* Kelly, Times Had Tauric Double Penetrate: </b>" + flags["KELLY_HAD_SPECIAL_TAUR_DP"]);
					if(flags["KELLY_TIMES_DOUBLESTUFFED_THE_PC"] != undefined) output2("\n<b>* Kelly, Times Getting Double-Stuffed: </b>" + flags["KELLY_TIMES_DOUBLESTUFFED_THE_PC"]);
				}
				// Syributts!
				if(flags["MET_SYRI"] != undefined)
				{
					output2("\n<b>* Syri:</b>");
					if(flags["SYRI_TALKS"] != undefined) output2(" Friend");
					else output2(" Met her");
					if(flags["SYRI_SEEN_PCS_SHIP_CABIN"] != undefined) output2(", She's seen your ship's cabin");
					if(flags["ANNOxSYRI_WINCEST"] != undefined) output2(", Sexed her with Anno")
					if(syriIsCrew())
					{
						output2(", Crewmember");
						if(9999 == 0) output2(" (Onboard Ship)");
					}
					if(flags["BET_AGAINST_SYRI"] != undefined)
					{
						output2("\n<b>* Syri, Gaming:</b> Bet against her");
						if(flags["SYRI_WINBET_VAG"] != undefined) output2(", Insisted she fuck your vagina");
					}
					if(flags["TIMES_BET_YOURSELF_AGAINST_SYRI"] != undefined) output2("\n<b>* Syri, Gaming, Times Betting Yourself: </b>" + flags["TIMES_BET_YOURSELF_AGAINST_SYRI"]);
					if(flags["TIMES_WON_AGAINST_SYRI"] != undefined || flags["TIMES_LOST_TO_SYRI"] != undefined) output2("\n<b>* Syri, Gaming, Win/Loss Ratio: </b>" + flags["TIMES_WON_AGAINST_SYRI"] + "(W):" + flags["TIMES_LOST_TO_SYRI"] + "(L) of " + (flags["TIMES_WON_AGAINST_SYRI"] + flags["TIMES_LOST_TO_SYRI"]) + " games");
					if(flags["FUCKED_SYRI_COUNT"] != undefined) output2("\n<b>* Syri, Times Sexed: </b>" + flags["FUCKED_SYRI_COUNT"]);
					if(flags["TIMES_BUTTFUCKED_BY_SYRI"] != undefined) output2("\n<b>* Syri, Times She Fucked Your Ass: </b>" + flags["TIMES_BUTTFUCKED_BY_SYRI"]);
					if(flags["SEEN_SYRI_IN_THE_MORNING"] != undefined) output2("\n<b>* Syri, Times Seen Her in the Morning: </b>" + flags["SEEN_SYRI_IN_THE_MORNING"]);
				}
				variousCount++;
			}
			// Crazy Carl!
			if(flags["MET_CARL"] != undefined)
			{
				output2("\n<b><u>Crazy Carl’s Crude Cylinder Collection Cache</u></b>");
				output2("\n<b>* Carl:</b> Met him");
				variousCount++;
			}
			// Nurse Joy-robot
			if(flags["MET_VKO"] != undefined)
			{
				output2("\n<b><u>Medical Office</u></b>");
				output2("\n<b>* V-Ko:</b> Met her");
				if(flags["GOT_VKO_STRESS_RELIEF"] != undefined) output2(", Got stress relief");
				if(flags["TIMES_ELECTROSTIMMED_BY_VKO"] != undefined) output2(", Got electrostimulated");
				variousCount++;
			}
			// Pennybutts
			if(flags["MET_PENNY"] != undefined)
			{
				output2("\n<b><u>U.G.C. Peacekeepers Office</u></b>");
				output2("\n<b>* Penny:</b> Met her");
				if(flags["PENNY_IS_A_CUMSLUT"] != undefined)
				{
					if(flags["PENNY_HIDING_CUMSLUTTERY"] != undefined)
					{
						output2(", Hiding her");
						if(flags["SEEN_PENNY_HIDE_CUMSLUTTERY"] != undefined) output2(" obvious");
						output2(" cum-sluttery");
					}
					if(flags["PENNY_LETTING_OTHERS_WATCH_CUMSLUTTERY"] != undefined)
					{
						output2(", Allowing others to watch her");
						if(flags["PENNY_BEEN_IN_WATCH_CUMSLUT_MODE_AND_BLOWN_IN_FRONT_OF_PC"] != undefined) output2(" exhibitionist");
						output2(" cum-sluttery");
					}
					if(flags["PENNY_BEING_A_PUBLIC_CUMSLUT"] != undefined)
					{
						output2(", Having others join in sexing her as a");
						if(flags["SEEN_PENNY_BE_A_GANGBANG_SLUT"] != undefined) output2(" gangbanged");
						output2(" cum-slut");
					}
				}
				if(flags["PENNY_THROBB_PURCHASE_UNLOCKED"] != undefined) output2("\n<b>* Penny, Throbb:</b> Available for purchase");
				if(flags["PENNY_THROBB_USES"] != undefined) output2("\n<b>* Penny, Throbb, Times Used: </b>" + flags["PENNY_THROBB_USES"]);
				if(flags["SEXED_PENNY"] != undefined)
				{
					output2("\n<b>* Penny, Sexual Organs: </b>");
					if(chars["PENNY"].hasCock())
					{
						output2(GLOBAL.TYPE_NAMES[chars["PENNY"].cocks[0].cType] + " cock");
						if(chars["PENNY"].balls == 1) output2(" with a ball");
						else if(chars["PENNY"].balls > 1) output2(" with " + chars["PENNY"].balls + " balls");
					}
					if(chars["PENNY"].hasVagina())
					{
						if(chars["PENNY"].hasCock()) output2(", ");
						output2(GLOBAL.TYPE_NAMES[chars["PENNY"].vaginas[0].type] + " vagina");
						if(chars["PENNY"].vaginas[0].clits == 1) output2(" with a clit");
						else if(chars["PENNY"].vaginas[0].clits > 1) output2(" with " + chars["PENNY"].vaginas[0].clits + " clits");
					}
					if(chars["PENNY"].hasCock() || chars["PENNY"].hasVagina()) output2(", ");
					output2("Asshole");
					output2("\n<b>* Penny, Sexual History:</b> Sexed her");
					if(flags["TIMES_FROTTAGED_PENNY"] != undefined) output2(", Frottaged her");
					if(flags["TIMES_PENNY_PAWJOBBED"] != undefined) output2(", She gave a pawjob");
				}
				if(flags["PENNY_TIMES_ANAL_SEXED"] != undefined) output2("\n<b>* Penny, Times Fucked Her Ass: </b>" + flags["PENNY_TIMES_ANAL_SEXED"]);
				if(flags["PENNY_TIMES_OVER_DESK_FUCKED"] != undefined) output2("\n<b>* Penny, Times Fucked Her Over Desk: </b>" + flags["PENNY_TIMES_OVER_DESK_FUCKED"]);
				if(flags["TIMES_JACKED_PENNY_OFF_WITH_ONAHOLE"] != undefined) output2("\n<b>* Penny, Times Jacked Her Off With An Onahole: </b>" + flags["TIMES_JACKED_PENNY_OFF_WITH_ONAHOLE"]);
				variousCount++;
			}
			// Tanis Bow Trainings
			if(flags["TANIS_APPROACHED"] != undefined)
			{
				output2("\n<b><u>U.G.C. Scout Authority</u></b>");
				output2("\n<b>* Tanis:</b> Met him");
				if(flags["TANIS_BOW_INTRO"] != undefined && flags["TANIS_BOW_TRAINING"] != undefined)
				{
					output2("\n<b>* Tanis, Bow Training Sessions Total:</b> " + flags["TANIS_BOW_TRAINING"]);
					if(flags["TANIS_BOW_TRAINING"] >= 12) output2(", Completed");
				}
				variousCount++;
			}
			// Xenogen Laboratory
			if(flags["MET_DR_HASWELL"] != undefined || flags["KELLY_MET"] != undefined)
			{
				output2("\n<b><u>Xenogen Biotech Laboratory</u></b>");
				// Julian Haswell
				if(flags["MET_DR_HASWELL"] != undefined) output2("\n<b>* Dr. Haswell:</b> Met him");
				// Kelly!
				if(flags["KELLY_MET"] != undefined)
				{
					output2("\n<b>* Kelly:</b>");
					if(hours >= 6 && hours < 17) output2(" Met her");
					else output2(" At bar");
				}
				variousCount++;
			}
			// Jungles
			if(flags["MET_CUNT_SNAKE"] != undefined || flags["ENCOUNTERED_MIMBRANE"] != undefined || flags["TIMES_MET_FEMZIL"] != undefined || flags["ENCOUNTERED_ZIL"] != undefined || flags["TIMES_MET_NALEEN"] != undefined || flags["TIMES_MET_MALE_NALEEN"] != undefined || flags["TIMES_MET_VENUS_PITCHER"] != undefined || flags["TIMES_VENUS_PITCHER_ELDER_ENCOUNTERED"] != undefined || flags["MET_VANAE_MAIDEN"] != undefined || flags["MET_VANAE_HUNTRESS"] != undefined || flags["MET_KEROKORAS"] != undefined)
			{
				output2("\n<b><u>Mhen’gan Jungles</u></b>");
				if(flags["MET_CUNT_SNAKE"] != undefined) output2("\n<b>* Cunt Snake, Times Encountered: </b>" + flags["MET_CUNT_SNAKE"]);
				if(flags["MET_KEROKORAS"] != undefined) output2("\n<b>* Kerokoras, Times Encountered: </b>" + flags["MET_KEROKORAS"]);
				if(flags["ENCOUNTERED_MIMBRANE"] != undefined) output2("\n<b>* Mimbranes, Times Encountered: </b>" + flags["ENCOUNTERED_MIMBRANE"]);
				if(flags["TIMES_MET_NALEEN"] != undefined)
				{
					output2("\n<b>* Naleen Huntress, Times Encountered: </b>" + flags["TIMES_MET_NALEEN"]);
					if(flags["TIMES_WINSEXED_NALEEN"] != undefined || flags["TIMES_LOSS_DOMMED_BY_NALEEN"] != undefined) output2("\n<b>* Naleen Huntress, Times Sexed: </b>" + totalNaleenSexCount());
				}
				if(flags["TIMES_MET_MALE_NALEEN"] != undefined) output2("\n<b>* Male Naleen, Times Encountered: </b>" + flags["TIMES_MET_MALE_NALEEN"]);
				if(flags["MET_VANAE_MAIDEN"] != undefined) output2("\n<b>* Vanae Maiden, Times Encountered: </b>" + flags["MET_VANAE_MAIDEN"]);
				if(flags["MET_VANAE_HUNTRESS"] != undefined)
				{
					output2("\n<b>* Vanae Huntress, Times Encountered: </b>" + flags["MET_VANAE_HUNTRESS"]);
					if(flags["VANAE_HUNTRESS_BRED"] != undefined) output2("\n<b>* Vanae Huntress, Times Bred By: </b>" + flags["VANAE_HUNTRESS_BRED"]);
					if(flags["VANAE_MILKBATH_TIMES"] != undefined) output2("\n<b>* Vanae Huntress, Times Received Milkbath By: </b>" + flags["VANAE_MILKBATH_TIMES"]);
				}
				if(flags["TIMES_MET_VENUS_PITCHER"] != undefined) output2("\n<b>* Venus Pitcher, Times Encountered: </b>" + flags["TIMES_MET_VENUS_PITCHER"]);
				if(flags["TIMES_VENUS_PITCHER_ELDER_ENCOUNTERED"] != undefined) output2("\n<b>* Elder Venus Pitcher, Times Encountered: </b>" + flags["TIMES_VENUS_PITCHER_ELDER_ENCOUNTERED"]);
				if(flags["TIMES_MET_FEMZIL"] != undefined) output2("\n<b>* Female Zil, Times Encountered: </b>" + flags["TIMES_MET_FEMZIL"]);
				if(flags["ENCOUNTERED_ZIL"] != undefined)
				{
					output2("\n<b>* Male Zil, Times Encountered: </b>" + flags["ENCOUNTERED_ZIL"]);
					if(flags["TIMES_LOST_TO_ZIL"] != undefined) output2("\n<b>* Male Zil, Combat, Times Lost: </b>" + flags["TIMES_LOST_TO_ZIL"]);
					if(flags["TIMES_LOSS_SUCKED_ZIL_MALE"] != undefined) output2("\n<b>* Male Zil, Combat, Times Sucked His Cock Upon Losing: </b>" + flags["TIMES_LOSS_SUCKED_ZIL_MALE"]);
				}
				variousCount++;
			}
			// Resources
			if(flags["TAGGED_MHENGA_OXONIUM_DEPOSIT"] != undefined || flags["UTHRA HARVEST DAY"] != undefined)
			{
				output2("\n<b><u>Mhen’gan Resources</u></b>");
				if(flags["TAGGED_MHENGA_OXONIUM_DEPOSIT"] != undefined) output2("\n<b>* Oxonium Deposit: </b> Found");
				if(flags["UTHRA HARVEST DAY"] != undefined) output2("\n<b>* Uthra Sap, Days Since Last Harvest: </b>" + (days - flags["UTHRA HARVEST DAY"]));
				
				variousCount++;
			}
			// Travel Points
			if(flags["SALVAGED VANAE CAMP"] != undefined)
			{
				output2("\n<b><u>Mhen’gan Travel Points</u></b>");
				// Abandoned Outpost
				if(flags["SALVAGED VANAE CAMP"] != undefined)
				{
					output2("\n<b>* Abandoned Xenogen Biotech Outpost:</b> Found");
					if(flags["CLEARED_XENOGEN_CAMP_BODIES"] != undefined) output2(", Cleared bodies");
					if(flags["SALVAGED VANAE CAMP"] >= 1) output2(", Looted camp");
					if(flags["SALVAGED VANAE CAMP"] >= 2) output2(", Salvaged transport vehicle");
				}
				variousCount++;
			}
		}

		if(showID == "Tarkus" || showID == "All")
		{
			// Colenso's
			if(flags["ASKED_COLENSO_ABOUT_HIS_THEORIES"] != undefined)
			{
				output2("\n<b><u>Colenso’s Junk</u></b>");
				output2("\n<b>* Colenso:</b> Met him, Asked about his theories");
				variousCount++;
			}
			// Doctor Lash
			if(flags["MET_DR_LASH"] != undefined)
			{
				output2("\n<b><u>Doctor Lash’s Office</u></b>");
				output2("\n<b>* Doctor Lash:</b> Met him");
				variousCount++;
			}
			// Aurora
			if(flags["MET_AURORA"] != undefined)
			{
				output2("\n<b><u>Mechanist’s Shop</u></b>")
				output2("\n<b>* Aurora:</b> Met her");
				if(flags["AURORA_SEEN_AFTER_SPLOSION"] != undefined) output2(", She remains as perky as ever");
				if(silly) output2(", This bat is too fukken kawaii");
				variousCount++;
			}
			// The Mess!
			if(flags["SHEKKA_TALKED_THE_MESS"] != undefined || flags["MET_DEL"] != undefined || flags["HAS_ORDERED_FOOD_AT_THE_MESS"] != undefined)
			{
				output2("\n<b><u>The Mess</u></b>");
				// Rumors
				if(flags["SHEKKA_TALKED_THE_MESS"] != undefined) output2("\n<b>* Rumors, Shekka:</b> <i>She believes the catering company is abducting people.</i>");
				// Beth
				if(flags["MET_DEL"] != undefined) output2("\n<b>* Beth:</b> Met her");
				// Delilah
				if(flags["MET_DEL"] != undefined)
				{
					output2("\n<b>* Delilah:</b> Met her");
					if(flags["TOOK_DELILAHS_BUTTGINITY"]) output2(", Took her anal virginity");
					if(flags["TIMES_ATE_DELILAH_OUT"] != undefined) output2("\n<b>* Delilah, Times Sexed: </b>" + flags["TIMES_ATE_DELILAH_OUT"]);
					if(flags["TIMES_HAD_SEX_WITH_DELILAH_IN_SOME_WAY"] != undefined) output2("\n<b>* Delilah, Times She Has Eaten You Out: </b>" + flags["TIMES_HAD_SEX_WITH_DELILAH_IN_SOME_WAY"]);
				}
				// Unknown waitress
				if(flags["HAS_ORDERED_FOOD_AT_THE_MESS"] != undefined) output2("\n<b>* Waitress:</b> Ordered food from her, Food never received");
				variousCount++;
			}
			// Anno
			if(flags["ANNOS_SHOP_CLOSED"] != undefined || flags["MET_ANNO"] != undefined)
			{
				output2("\n<b><u>Steele Tech Outpost</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["ANNOS_SHOP_CLOSED"] != undefined) output2(" Closed");
				else output2(" Open");
				if(flags["MET_ANNO"] != undefined)
				{
					output2("\n<b>* Anno:</b> Met her");
					if(flags["ANNO_ASLEEP"] != undefined) output2(", Currently sleeping");
					if(flags["ANNO_CREWMEMBER"] != undefined)
					{
						output2(", Crewmember");
						// Follower stuff
						if(flags["ANNO_CREWMEMBER"] == 1) output2(" (Onboard Ship)");
						if(flags["ANNO_CREWMEMBER"] == 2) output2(" (At Tavros Station)");
					}
					if(flags["ANNOxKAEDE_INTRODUCED"] != undefined) output2("\n<b>* Anno, Times Met with Kaede: </b>" + flags["ANNOxKAEDE_INTRODUCED"]);
					if(flags["ANNOxKAEDE_LAST_DAY"] != undefined) output2("\n<b>* Anno, Days Since Last Met with Kaede: </b>" + (days - flags["ANNOxKAEDE_LAST_DAY"]));
					if(flags["ANNO_TRIBERATOR_USED"] != undefined || flags["ANNO_OWNS_LIGHT_STRAPON"] != undefined)
					{
						output2("\n<b>* Anno, Sex Toys:</b>");
						if(flags["ANNO_TRIBERATOR_USED"] != undefined) output2(" Vibrator");
						if(flags["ANNO_OWNS_LIGHT_STRAPON"] != undefined)
						{
							if(flags["ANNO_TRIBERATOR_USED"] != undefined) output2(",");
							output2(" Hardlight strapon");
							if(flags["ANNO_STRAPON_MODS_ENABLED"] != undefined) output2(", Strapon mods enabled");
						}
					}
					if(flags["ANNO_SEXED"] != undefined)
					{
						output2("\n<b>* Anno, Sexual History:</b> Sexed her");
						if(flags["ANNO_EVER_STRAPONED"] != undefined) output2(", Fucked her with a hardlight strapon");
						if(flags["ANNOxSYRI_WINCEST"] != undefined) output2(", Sexed her with Syri");
						output2("\n<b>* Anno, Times Sexed: </b>" + flags["ANNO_SEXED"]);
					}
					if(flags["ANNO_ANALSEXED"] != undefined) output2("\n<b>* Anno, Times Fucked Her Ass: </b>" + flags["ANNO_ANALSEXED"]);
					if(flags["ANNO_TRIBERATOR_USED"] != undefined) output2("\n<b>* Anno, Times Used Her Vibrator: </b>" + flags["ANNO_TRIBERATOR_USED"]);
				}
				variousCount++;
			}
			// Shekka
			if(flags["MET_SHEKKA"] != undefined)
			{
				output2("\n<b><u>Widget Warehouse</u></b>");
				output2("\n<b>* Shekka:</b> Met her");
				if(flags["SHEKKA_TALK_COOLDOWN"] != undefined && flags["SHEKKA_TALK_COOLDOWN"] != 0) output2(", Too busy to talk");
				if(flags["SEEN_SHEKKAS_SEXBOTS"] != undefined)
				{
					output2(", Seen her sexbots");
					if(flags["SEEN_SHEKKAS_SEXBOTS"] != undefined) output2(" and her <i>new</i> sexbots");
				}
				if(flags["TIMES_SEXED_SHEKKA"] != undefined) output2("\n<b>* Shekka, Times Sexed: </b>" + flags["TIMES_SEXED_SHEKKA"]);
				if(flags["TIMES_TAILVIBED_WITH_SHEKKA"] != undefined) output2("\n<b>* Shekka, Times Fucked Her Tail-Vibrator: </b>" + flags["TIMES_TAILVIBED_WITH_SHEKKA"]);
				if(flags["TIMES_SHEKKA_KIRBUED"] != undefined) output2("\n<b>* Shekka, Times Fucked Her Inside a Hazmat Suit: </b>" + flags["TIMES_SHEKKA_KIRBUED"]);
				if(StatTracking.getStat("contests/shekka sexoff losses") + StatTracking.getStat("contests/shekka sexoff wins") > 0) output2("\n<b>* Shekka, Robot Sex-Off, Win/Loss Ratio: </b>" + StatTracking.getStat("contests/shekka sexoff wins") + "(W):" + StatTracking.getStat("contests/shekka sexoff losses") + "(L) of " + (StatTracking.getStat("contests/shekka sexoff losses") + StatTracking.getStat("contests/shekka sexoff wins")) + " games");
				variousCount++;
			}
			// Horace Decker
			if(flags["MET_UGC_TROOPER_AT_CHASMFALL"] != undefined)
			{
				output2("\n<b><u>Chasmfall</u></b>");
				output2("\n<b>* Sgt. Decker:</b> Met him");
				variousCount++;
			}
			// Wastes
			if(flags["MET_GRAY_GOO"] != undefined || flags["ENCOUNTERED_PARASITIC_LAPINARA"] != undefined || (flags["MET_FEMALE_RASKVEL"] != undefined || flags["MET_MALE_RASKVEL_GANG"] != undefined) || flags["MET_SEXBOT_FEMALE_ON_TARKUS"] != undefined || flags["MET_SEXBOT_MALE_ON_TARKUS"] != undefined || flags["MET_SYDIAN_MALE"] != undefined)
			{
				output2("\n<b><u>The Wastes</u></b>");
				if(flags["MET_GRAY_GOO"] != undefined) output2("\n<b>* Gray Goo, Times Encountered: </b>" + flags["MET_GRAY_GOO"]);
				if(flags["ENCOUNTERED_PARASITIC_LAPINARA"] != undefined) output2("\n<b>* Female Parasitic Lapinara, Times Encountered: </b>" + flags["ENCOUNTERED_PARASITIC_LAPINARA"]);
				if(flags["MET_FEMALE_RASKVEL"] != undefined)
				{
					output2("\n<b>* Female Raskvel, Times Encountered: </b>" + flags["MET_FEMALE_RASKVEL"]);
					if(flags["TIMES_RODE_RASKVEL_FACE"] != undefined) output2("\n<b>* Female Raskvel, Times Riding Her Face: </b>" + flags["TIMES_RODE_RASKVEL_FACE"]);
				}
				if(flags["MET_MALE_RASKVEL_GANG"] != undefined) output2("\n<b>* Male Raskvel Gang, Times Encountered: </b>" + flags["MET_MALE_RASKVEL_GANG"]);
				if(flags["MET_SEXBOT_FEMALE_ON_TARKUS"] != undefined) output2("\n<b>* Female Sexbots, Times Encountered: </b>" + flags["MET_SEXBOT_FEMALE_ON_TARKUS"]);
				if(flags["MET_SEXBOT_MALE_ON_TARKUS"] != undefined) output2("\n<b>* Male Sexbots, Times Encountered: </b>" + flags["MET_SEXBOT_MALE_ON_TARKUS"]);
				if(flags["MET_SYDIAN_MALE"] != undefined)
				{
					output2("\n<b>* Male Sydian, Times Encountered: </b>" + flags["MET_SYDIAN_MALE"]);
					if(flags["TIMES_TAKEN_RUST_BRO_IN_COOCH"] != undefined) output2("\n<b>* Male Sydian, Times Cunt-Fucked By: </b>" + flags["TIMES_TAKEN_RUST_BRO_IN_COOCH"]);
				}
				variousCount++;
			}
			// Travel Points
			if(flags["TARKUS_TAXI_STOP_UNLOCKED"] != undefined)
			{
				output2("\n<b><u>Tarkus Travel Points</u></b>");
				// Artificial Platform
				if(flags["TARKUS_TAXI_STOP_UNLOCKED"] != undefined)
				{
					output2("\n<b>* Artificial Platform:</b> Found");
					if(flags["TARKUS_DESTROYED"] != undefined) output2(", Destroyed");
					else output2(", Fixed comm relay");
				}
				variousCount++;
			}
		}

		if(showID == "Myrellion" || showID == "All")
		{
			// Embassy
			if(flags["MET_JURO"] != undefined || flags["MET_LYRALLA"] != undefined || flags["MET_NEHZARA"] != undefined)
			{
				output2("\n<b><u>The Embassy</u></b>");
				// Juro
				if(flags["MET_JURO"] != undefined) output2("\n<b>* Juro:</b> Met him");
				// Lyralla
				if(flags["MET_LYRALLA"] != undefined)
				{
					output2("\n<b>* Lyralla:</b> Met her");
					if(flags["LYRALLA_DISCUSSED_HER_QUEEN"] != undefined) output2(", Spoke of Queen Irellia");
					if(flags["LYRALLA_AND_JURO_RELATIONSHIP_HINTED_AT"] != undefined)
					{
						output2("\n<b>* Lyralla, Relationships:</b> Infatuated with Juro");
						if(flags["JURO_LYRALLA_CLOSET_SEEN"] != undefined) output2(", Seen her fucking Juro in the closet");
					}
				}
				// Nehzara
				if(flags["MET_NEHZARA"] != undefined)
				{
					output2("\n<b>* Nehzara:</b> Met her");
					if(flags["SEXED_NEHZARA"] != undefined) output2(", Sexed her");
					if(flags["NEHZ_PREGGO_RUB_HAPPENED"] != undefined) output2(", She rubbed your pregnant belly");
					if(flags["NEHZ_WARRIORS_HONOR_SCENE_HAPPENED"] != undefined) output2(", Proved her warrior’s honor");
					if(flags["NEHZARA_CLOSET_FUKKED"] != undefined) output2("\n<b>* Nehzara, Times Closet Fucked With: </b>" + flags["NEHZARA_CLOSET_FUKKED"]);
				}
				variousCount++;
			}
			// Gene's Mods
			if(flags["GENES_MODS_ENTERED"] != undefined)
			{
				output2("\n<b><u>Gene’s Mods</u></b>");
				if(flags["GENE_TALKED_TO"] == undefined) output2("\n<b>* Fanfir Man:</b>");
				else output2("\n<b>* Gene:</b>");
				output2("Met him");
				if(flags["GENE_FUCKED"] != undefined) output2(", Sexed him");
				if(flags["GENE_BLOWJOB"] != undefined) output2(", Sucked his cock");
				if(flags["GENE_BELLYRUBS_ENABLED"] != undefined) output2(", Rubbed his belly");
				if(flags["GENE_SUBMISSION_LEVEL"] != undefined)
				{
					output2("\n<b>* Gene, Submission Level: </b>");
					if(flags["GENE_SUBMISSION_LEVEL"] == -1) output2("Refused his advances completely");
					else output2(flags["GENE_SUBMISSION_LEVEL"] + "/10");
				}
				variousCount++;
			}
			// Golden Peaks Tavern
			if(flags["MET_EMBRY"] != undefined || flags["MET_LILIANA"] != undefined)
			{
				output2("\n<b><u>The Golden Peak</u></b>");
				// Embry
				if(flags["MET_EMBRY"] != undefined)
				{
					output2("\n<b>* [embry.name]:</b> Met her");
					if(flags["EMBRY_LOVERS_SCENE_HAPPENED"] != undefined && flags["CRUSHED_EMBRYS_HEART"] == undefined) output2(", She loves you");
					if(flags["SEEN_MONKEY_STRAPON"] != undefined) output2(", Seen her strapon");
					if(!embry.isNude())
					{
						output2("\n<b>* [embry.name], Attire:</b>");
						if(flags["EMBRY_GLASSES"] != undefined) output2(" A pair of glasses with");
						output2(" [embry.gear]");
					}
					if(flags["EMBRY_TALKED_ABOUT_TRANSITIONING"] != undefined)
					{
						output2("\n<b>* [embry.name], Current Balance: </b>" + chars["EMBRY"].credits + " credits");
						if(flags["EMBRY_TREATMENTS"] > 0)
						{
							output2("\n<b>* [embry.name], Transition Treatments:</b>");
							if(flags["EMBRY_TREATMENTS"] >= 1)
							{
								output2(" First");
								if(flags["DIDNT_WATCH_EMBRY_TF"] != undefined) output2(" (didn't watch)");
								else output2(" (watched)");
							}
							if(flags["EMBRY_TREATMENTS"] >= 2) output2(", Second");
							if(flags["EMBRY_TREATMENTS"] >= 3) output2(", Third");
						}
					}
					if(flags["EMBRY_RELATIONSHIP"] != undefined)
					{
						output2("\n<b>* [embry.name], Relationship:</b>");
						if(flags["CRUSHED_EMBRYS_HEART"] != undefined) output2(" You've broken her heart");
						else
						{
							if(flags["EMBRY_RELATIONSHIP"] == 0) output2(" You've pissed her off");
							if(flags["EMBRY_RELATIONSHIP"] == 1) output2(" Normal");
							if(flags["EMBRY_RELATIONSHIP"] == 2) output2(" You're her platonic friend");
							if(flags["EMBRY_RELATIONSHIP"] == 3)
							{
								if(flags["EMBRY_TREATMENTS"] >= 2) output2(" She is lovingly attached to you");
								else if(flags["EMBRY_TREATMENTS"] >= 1) output2(" She is intimate with you");
								else output2(" She is affectionate towards you");
							}
						}
						if(flags["EMBRY_LOVE_STYLE"] != undefined) output2("\n<b>* [embry.name], Relationship, Love Style: </b>" + StringUtil.capitalize(flags["EMBRY_LOVE_STYLE"]));
					}
					if(flags["SEXED_EMBRY"] != undefined)
					{
						output2("\n<b>* [embry.name], Sexual History:</b> Sexed her");
						if(flags["EMBRY_VAGINAL_SEX_UNLOCKED"] != undefined) output2(", Fucked her pussy");
						if(flags["GOTTEN_TO_FUCK_EMBRYBUTT"] != undefined) output2(", Fucked her ass");
						if(flags["GOTTEN_AN_EMBRY_BJ"] != undefined) output2(", She sucked your dick");
						if(flags["GOTTEN_CUNNILINGUS_FROM_EMBRY"] != undefined) output2(", She ate your pussy");
						if(flags["GOTTEN_RIMMED_BY_EMBRY"] != undefined) output2(", She rimmed you");
						output2("\n<b>* [embry.name], Sexual Preference:</b>");
						if(flags["EMBRY_TOLD_YOU_LIKE_COCK"] != undefined) output2(" You like her cock");
						else if(flags["EMBRY_TOLD_YOU_DONT_LIKE_COCK"] != undefined) output2(" You dislike her cock");
						else output2(" You are neutral about her cock");
					}
				}
				// Liliana
				if(flags["MET_LILIANA"] != undefined)
				{
					output2("\n<b>* Liliana:</b> Met her");
					if(flags["LILIANA_SEEN_NAKKERS"] != undefined) output2(", Seen her naked");
					if(flags["LILIANA_NO_ARMS_ARE_COOL"] != undefined) output2(", Encouraged her to be the same");
					if(flags["LILIANA_ARMS"] != undefined) output2(", Encouraged her to get a new arm");
					if(hours >= 19) output2(", Able to cuddle");
					if(flags["LILIANA_TALKS"] >= 1)
					{
						output2("\n<b>* Liliana, Talks:</b> How she lost her arm");
						if(flags["LILIANA_TALKS"] >= 2) output2(", Why she's afraid to replace it");
						if(flags["LILIANA_TALKS"] >= 3) output2(", Her infatuation with Dr. Anilla");
					}
					if(flags["LILIANA_ARMS"] != undefined)
					{
						output2("\n<b>* Liliana, Replacement Arm Type:</b>");
						if(flags["LILIANA_ARMS"] < 1) output2(" None");
						if(flags["LILIANA_ARMS"] == 1) output2(" Robotic");
						if(flags["LILIANA_ARMS"] == 2) output2(" Regenerated");
						if(flags["LILIANA_ARMS"] > 2) output2(" Unknown");
					}
				}
				variousCount++;
			}
			// Xenogen Biotech Office
			if(flags["MET_NEVRIE"] != undefined || flags["MET_MCALLISTER"] != undefined)
			{
				output2("\n<b><u>Xenogen Biotech Office</u></b>");
				// Nevrie
				if(flags["MET_NEVRIE"] != undefined)
				{
					output2("\n<b>* Nevrie:</b> Met her");
					if(flags["FUCKED_NEVRIE"] != undefined) output2(", Sexed her");
					if(flags["NEVRIE_SHOPPED"] != undefined) output2(", Accessed her shop");
					if(flags["NEVRIE_DISCOUNT"] != undefined) output2(", Store discount active");
				}
				// Byron McAllister
				if(flags["MET_MCALLISTER"] != undefined)
				{
					output2("\n<b>* Dr. McAllister:</b> Met him");
					if(flags["MCALLISTER_MYR_TFS"] != undefined)
					{
						output2("\n<b>* Dr. McAllister, Myr Transformation Experiment:</b>");
						if(flags["MCALLISTER_MYR_TFS"] < 2) output2(" Ready to meet test subjects");
						else output2(" Met test subjects, Successful results");
					}
				}
				variousCount++;
			}
			// Streets of Gildenmere
			if(flags["MET_ORRYX"] != undefined || 9999 == 0)
			{
				output2("\n<b><u>Gildenmere</u></b>");
				// Orryx, step right up ladies and gents!
				if(flags["MET_ORRYX"] != undefined)
				{
					if(flags["MET_ORRYX"] == -1) output2("\n<b>* Fuzzy Alien:</b> Invited to meet");
					else output2("\n<b>* Orryx:</b> Met him");
					if(flags["MET_ORRYX"] == 2) output2(", Agreed to supply him with Golden Honey");
					if(flags["ORRYX_SHIPPED_HONEY"] != undefined)
					{
						output2("\n<b>* Orryx, Honey Shipment Status:</b>");
						if(flags["ORRYX_SHIPPED_TODAY"] == undefined) output2(" None shipped today");
						else output2(" Shipped a load today");
					}
				}
				variousCount++;
			}
			// The Honey Nozzle
			if(flags["MET_DALLY"] != undefined)
			{
				output2("\n<b><u>The Honey Nozzle</u></b>");
				// Dallyyy
				output2("\n<b>* Dally:</b> Met him");
				if(flags["DALLY_TIPS"] != undefined) output2("\n<b>* Dally, Tip Balance: </b>" + flags["DALLY_TIPS"] + " credits");
				if(flags["DALLY_FAVORS"] != undefined) output2("\n<b>* Dally, Times Performed On Stage With Him: </b>" + flags["DALLY_FAVORS"]);
				if(flags["DALLY_NECTAR_DRANK"] != undefined) output2("\n<b>* Dally, Times Drank His Nectar: </b>" + flags["DALLY_NECTAR_DRANK"]);
				if(flags["CUNTTAILED_DALLY"] != undefined) output2("\n<b>* Dally, Times He Fucked Your Tail Cunt: </b>" + flags["CUNTTAILED_DALLY"]);
				variousCount++;
			}
			// The Honeypot Stall
			if(flags["MET_ASENNIA"] != undefined)
			{
				output2("\n<b><u>The Honeypot Stall</u></b>");
				// Asennia
				output2("\n<b>* Asennia:</b> Met her");
				if(flags["ASENNIA_COCK_OFFERED"] != undefined) output2(", Offered your cock to her");
				variousCount++;
			}
			// Queen's Palace
			if(flags["MET_IRELLIA"] != undefined || flags["LYRALLA_DISCUSSED_HER_QUEEN"] != undefined)
			{
				output2("\n<b><u>The Queen’s Palace</u></b>");
				// Queen Irellia and all the queens!
				output2("\n<b>* Queen Irellia:</b>");
				if(flags["MET_IRELLIA"] != undefined && flags["IRELLIA_QUEST_STATUS"] != undefined)
				{
					output2(" Met her");
					if(flags["IRELLIA_QUEST_STATUS"] == -1) output2(", Refuses to interact");
					if(flags["IRELLIA_QUEST_STATUS"] >= 6)
					{
						if(flags["IRELLIA_TITTYSNACK_OFFER"] != undefined) output2(", She offered a titty-snack");
						if(flags["IRELLIA_SEX_COOLDOWN"] == 0 || flags["IRELLIA_SEX_COOLDOWN"] == undefined) output2(", Desires sex");
						if(flags["IRELLIA_DOUBLE_TEAM_EVER_DONE"] != undefined) output2("\n<b>* Queen Irellia, Times Double-Teamed Her: </b>" + flags["IRELLIA_DOUBLE_TEAM_EVER_DONE"]);
					}
					output2("\n<b>* Queen Marsail:</b> Met her");
					if(flags["IRELLIA_QUEST_STATUS"] == -1) output2(", Refuses to interact");
					output2("\n<b>* Queen Scalla:</b> Met her");
					if(flags["IRELLIA_QUEST_STATUS"] == -1) output2(", Refuses to interact");
					if(flags["MET_AURIN"] != undefined) output2("\n<b>* Aurin:</b> Met him, You both paired up and fucked Irellia");
					if(flags["MET_ETHELN"] != undefined) output2("\n<b>* Etheln:</b> Met him, You both paired up and fucked Irellia");
					if(flags["MET_ILODEN"] != undefined) output2("\n<b>* Iloden:</b> Met him, You both paired up and fucked Irellia");
				}
				else if(flags["LYRALLA_DISCUSSED_HER_QUEEN"] != undefined) output2(" Know of her");
				variousCount++;
			}
			// Silken Serenity
			if(flags["MET_XANTHE"] != undefined)
			{
				output2("\n<b><u>Silken Serenity</u></b>");
				// Xanthe
				output2("\n<b>* Xanthe:</b> Met her");
				if(flags["MET_BUTCH"] != undefined) output2(", Met ‘Butch’");
				if(flags["SET_XANTHE_SEX"] != undefined) output2(", Changed her genitals");
				if(flags["XANTHE_MATED"] != undefined) output2(", Mated with her");
				if(flags["XANTHE_TALKED_ABOUT_HER_SEX"] != undefined)
				{
					output2("\n<b>* Xanthe, Genitals:</b> ");
					if(flags["XANTHE_FRONT_GENITAL"] == 0) output2(" Nothing on front");
					if(flags["XANTHE_FRONT_GENITAL"] == 1) output2(" Front penis");
					if(flags["XANTHE_FRONT_GENITAL"] == 2) output2(" Front vagina");
					if(flags["XANTHE_BACK_GENITAL"] == 0) output2(", Nothing on back");
					if(flags["XANTHE_BACK_GENITAL"] == 1) output2(", Back penis");
					if(flags["XANTHE_BACK_GENITAL"] == 2) output2(", Back vagina");
				}
				variousCount++;
			}
			// Kressia, where all the gangstas chill
			if(flags["LIEVE_INVITE"] != undefined || flags["MET_LIEVE"] != undefined || 9999 == 0)
			{
				output2("\n<b><u>Kressia</u></b>");
				// Lieve
				if(flags["LIEVE_INVITE"] != undefined || flags["MET_LIEVE"] != undefined)
				{
					if(flags["MET_LIEVE"] != undefined)
					{
						output2("\n<b>* Lieve:</b> Met her");
						if(flags["LIEVE_TOWNTOUR"] != undefined) output2(", Took her Tour");
						if(flags["LIEVE_VENOM_ENABLED"] != undefined) output2(", Venom enabled");
						if(flags["HAS_BEEN_MYR_VENOMED"] != undefined) output2(", She venom-fucked you");
						if(flags["LIEVE_HAREM_DICKFUCK"] != undefined) output2(", Dick-fucked her harem");
						if(flags["LIEVE_VENOM_USED"] != undefined) output2("\n<b>* Lieve, Times Used Venom: </b>" + flags["LIEVE_VENOM_USED"]);
						if(flags["FUCKED_LIEVE"] != undefined) output2("\n<b>* Lieve, Times Sexed: </b>" + flags["FUCKED_LIEVE"]);
						if(flags["FUCKED_LIEVE_SOLO"] != undefined) output2("\n<b>* Lieve, Times Fucked Her Solo: </b>" + flags["FUCKED_LIEVE_SOLO"]);
						if(flags["FUCKED_TRENCHWIVES"] != undefined) output2("\n<b>* Lieve, Times Fucked Her Trenchwives: </b>" + flags["FUCKED_TRENCHWIVES"]);
						if(flags["SIERVA_TALK"] != undefined)
						{
							output2("\n<b>* Mayren:</b> Met her");
							output2("\n<b>* Sievra:</b> Met her");
						}
					}
					else output2("\n<b>* Young Woman with Purple Hair:</b> Invited to meet");
				}
				variousCount++;
			}
			// Bath House
			if(flags["TALKED_ABOOT_BATH_HOUSE"] != undefined)
			{
				if(silly) output2("\n<b><u>Bathen Hausen</u></b>");
				else output2("\n<b><u>Bath House</u></b>");
				output2("\n<b>* Matron Oserre:</b> Met her");
				variousCount++;
			}
			// Merchant Queen
			if(flags["MET_MERCHANT_QUEEN"] != undefined)
			{
				output2("\n<b><u>Merchant Queen’s Shop</u></b>");
				if(silly) output2("\n<b>* Queen Fuzzlebottom:</b>");
				else output2("\n<b>* Merchant Queen:</b>");
				output2(" Met her")
				variousCount++;
			}
			// Renvraaa
			if(flags["MET_RENVRA"] != undefined)
			{
				output2("\n<b><u>Federation Supply and Trading Post</u></b>");
				output2("\n<b>* Renvra:</b> Met her");
				if(flags["RENVRA_SEXED"] != undefined) output2(", Sexed her");
				variousCount++;
			}
			// Survival Shop
			if(flags["MET_ANARRIE"] != undefined || flags["MET_SHIARE"] != undefined)
			{
				output2("\n<b><u>Kressia Survival Shop</u></b>");
				// Annarie and Shiare
				if(flags["MET_ANARRIE"] != undefined)
				{
					output2("\n<b>* Annarie:</b> Met her")
					if(flags["FUCKED_ANARRIE"] != undefined) output2(", Sexed her");
				}
				if(flags["MET_SHIARE"] != undefined)
				{
					output2("\n<b>* Shiare:</b> Met her")
					if(flags["FUCKED_SHIARE"] != undefined) output2(", Sexed her");
				}
				variousCount++;
			}
			// ReallyJustSpaceSavin
			if(flags["MET_SEIFYN"] != undefined)
			{
				output2("\n<b><u>Trading Post</u></b>");
				if(flags["MET_SEIFYN"] != undefined)
				{
					output2("\n<b>* Seifyn:</b> Met her")
				}
				variousCount++;
			}
			// No Myr's Land
			if(flags["ENCOUNTERED_LANDMINES"] != undefined || flags["MET_ADULT_COCKVINE"] != undefined || flags["MET_COCKVINE_SEEDLING"] != undefined || flags["MET_GOLD_DESERTER"] != undefined || flags["MET_RED_DESERTER"] != undefined)
			{
				output2("\n<b><u>No Myr’s Land</u></b>");
				if(flags["ENCOUNTERED_LANDMINES"] != undefined)
				{
					output2("\n<b>* Landmines, Times Encountered: </b>" + flags["ENCOUNTERED_LANDMINES"]);
					if(flags["DISARMED_LANDMINES"] != undefined) output2("\n<b>* Landmines, Total Disarmed: </b>" + flags["DISARMED_LANDMINES"]);
				}
				if(flags["MET_ADULT_COCKVINE"] != undefined)
				{
					output2("\n<b>* Adult Cockvine, Times Encountered: </b>" + flags["MET_ADULT_COCKVINE"]);
					if(flags["FUCKED_ADULT_COCKVINE"] != undefined) output2("\n<b>* Adult Cockvine, Times Sexed: </b>" + flags["FUCKED_ADULT_COCKVINE"]);
				}
				if(flags["MET_COCKVINE_SEEDLING"] != undefined) output2("\n<b>* Cockvine Seedling, Times Encountered: </b>" + flags["MET_COCKVINE_SEEDLING"]);
				if(flags["MET_GOLD_DESERTER"] != undefined)
				{
					output2("\n<b>*</b>");
					if(flags["KNOW_GOLD_MYR_NAME"] == undefined) output2("<b> Gold Myr Deserter</b>");
					else output2(" <b>Lys</b>");
					if(flags["GOLD_MYR_DESERTER_BEATEN"] != undefined && flags["GOLD_MYR_DESERTER_BEATEN"] >= 5) output2(" <b>(Non-hostile)</b>");
					output2("<b>, Times Encountered: </b>" + flags["MET_GOLD_DESERTER"]);
				}
				if(flags["MET_RED_DESERTER"] != undefined)
				{
					output2("\n<b>*</b>");
					if(flags["KNOW_RED_MYR_NAME"] == undefined) output2("<b> Red Myr Deserter</b>");
					else output2("<b> Briha</b>");
					if(flags["RED_MYR_DESERTER_BEATEN"] != undefined && flags["RED_MYR_DESERTER_BEATEN"] >= 5) output2(" <b>(Non-hostile)</b>");
					output2("<b>, Times Encountered: </b>" + flags["MET_RED_DESERTER"]);
				}
				variousCount++;
			}
			// Wetraxxel Den
			if(flags["MET_WETRA_HOUND"] != undefined || flags["MET_WETRAXXEL_BRAWLER"] != undefined)
			{
				output2("\n<b><u>Wetraxxel Den</u></b>");
				if(flags["MET_WETRA_HOUND"] != undefined) output2("\n<b>* Wetra Hound, Times Encountered: </b>" + flags["MET_WETRA_HOUND"]);
				if(flags["MET_WETRAXXEL_BRAWLER"] != undefined)
				{
					output2("\n<b>* Wetraxxel, Times Encountered: </b>" + flags["MET_WETRAXXEL_BRAWLER"]);
					if(flags["WETRAXXEL_SUBMISSION"] != undefined)output2("\n<b>* Wetraxxel, Submission Level: </b>" + flags["WETRAXXEL_SUBMISSION"] + "/10");
				}
				variousCount++;
			}
			// Deep Caverns
			if(flags["MET_INFECTED_MYR_FEMALE"] != undefined || flags["MET_NYREA_ALPHA"] != undefined || flags["MET_NYREA_BETA"] != undefined)
			{
				output2("\n<b><u>The Deep Caverns</u></b>");
				if(flags["MET_INFECTED_MYR_FEMALE"] != undefined) output2("\n<b>* Female Infected Myr, Times Encountered: </b>" + flags["MET_INFECTED_MYR_FEMALE"]);
				if(flags["MET_NYREA_ALPHA"] != undefined) output2("\n<b>* Alpha Nyrea Huntress, Times Encountered: </b>" + flags["MET_NYREA_ALPHA"]);
				if(flags["MET_NYREA_BETA"] != undefined) output2("\n<b>* Beta Nyrea Huntress, Times Encountered: </b>" + flags["MET_NYREA_BETA"]);
				variousCount++;
			}
			// Travel Points
			if(flags["NO_ANTS_LAND_TAXI_UNLOCKED"] != undefined || flags["LOOTED_MYR_RIFLE"] != undefined || flags["DEEP_CAVES_TAXI_UNLOCKED"] != undefined)
			{
				output2("\n<b><u>Myrellion Travel Points</u></b>");
				// Radio Bunker
				if(flags["NO_ANTS_LAND_TAXI_UNLOCKED"] != undefined || flags["LOOTED_MYR_RIFLE"] != undefined)
				{
					output2("\n<b>* Radio Bunker:</b> Found");
					if(flags["NO_ANTS_LAND_TAXI_UNLOCKED"] != undefined) output2(", Repaired radio communications");
					if(flags["LOOTED_MYR_RIFLE"] != undefined) output2(", Looted bunker");
				}
				// Crash Site
				if(flags["DEEP_CAVES_TAXI_UNLOCKED"] != undefined)
				{
					output2("\n<b>* Crash Site:</b> Found");
					if(flags["DEEP_CAVES_TAXI_UNLOCKED"] != undefined) output2(", Activated beacon");
				}
				variousCount++;
			}
		}

		// Nothing recorded
		if(variousCount == 0)
		{
			output2("\n<b><u>Not Available</u></b>");
			output2("\n* <i>No data for normal encounters have been logged</i>");
			if(showID != "All") output2("<i> at this location</i>");
			output2("<i>.</i>");
		}

		// Unique Encounters:
		output2("\n\n" + blockHeader("Unique Encounters"));
		var uniqueCount:int = 0;
		if(showID == "New Texas" || showID == "All")
		{
			// Turkey Lady
			if(flags["GOBBLES_SEXYTIMES_STARTED"] != undefined)
			{
				output2("\n<b><u>Milk Barn</u></b>");
				if(flags["CANADA_EXPLAINED"] != undefined) output2("\n<b>* Canada:</b>");
				else output2("\n<b>* Turkey Girl:</b>");
				output2(" Encountered");
				if(flags["REPEAT_GOBBLES_MILKED"] == 1) output2(", Milked once");
				else if(flags["REPEAT_GOBBLES_MILKED"] > 1) output2(", Milked " + flags["REPEAT_GOBBLES_MILKED"] + " times");
				uniqueCount++;
			}
		}
		if(showID == "Tarkus" || showID == "All")
		{
			// Bimbotorium
			if(flags["MET_DR_BADGER"] != undefined)
			{
				output2("\n<b><u>The Bimbotorium</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["DR_BADGER_BIMBOED_PC"] != undefined)
				{
					output2(" Accepted Bimbofication");
					if(silly && pc.isBimbo()) output2(", <i>Like, you're a hero now!</i>");
				}
				else output2(" Refused Bimbofication");
				output2("\n<b>* Doctor Badger:</b>");
				if(flags["DR_BADGER_TURNED_IN"] != undefined) output2(" Inactive, Arrested by the U.G.C.");
				else output2(" Active");
				uniqueCount++;
			}
		}
		if(showID == "Myrellion" || showID == "All")
		{
			// Like, Steph Irson, theee Galactic Huntress!
			if(flags["STEPH_WATCHED"] != undefined && flags["STEPH_WORK_CHOICE"] != undefined)
			{
				output2("\n<b><u>A Cavern</u></b>");
				output2("\n<b>* Steph Irson:</b> Encountered")
				output2("\n<b>* Steph Irson, Work Choice:</b>")
				if(flags["STEPH_WORK_CHOICE"] == 1) output2(" Galactic Pornstar")
				else if(flags["STEPH_WORK_CHOICE"] == 2)
				{
					output2(" Find a new network")
					if(flags["STEPH_STEELE_SPONSOR"] != undefined) output2(", Steele Tech as sponsor")
				}
				else if(flags["STEPH_WORK_CHOICE"] == 3) output2(" Discouraged from switching networks")
				else output2(" Unknown option")
				uniqueCount++;
			}
			// Crab Lady
			if(flags["QUEEN_OF_THE_DEEP_ENCOUNTERED"] != undefined)
			{
				output2("\n<b><u>Deep Lake</u></b>");
				output2("\n<b>* Queen of the Deep Lake:</b> Encountered");
				if(pc.hasPregnancyOfType("DeepQueenPregnancy")) output2(", Impregnated by");
				if(StatTracking.getStat("pregnancy/queen of the deep eggs") > 0) output2(", Progenitor of race");
				uniqueCount++;
			}
		}
		// Nothing recorded
		if(uniqueCount == 0)
		{
			output2("\n<b><u>Not Available</u></b>");
			output2("\n* <i>No data for unique encounters have been logged</i>");
			if(showID != "All") output2("<i> at this location</i>");
			output2("<i>.</i>");
		}
	}

	// Other/Misc Info
	if(showID == "Other" || showID == "All")
	{
		// Roaming Encounters
		if(showID != "Other") output2("\n\n");
		output2(blockHeader("Roaming Encounters"));
		var roamCount:int = 0;
		// Dane
		if(flags["MET_DANE"] != undefined)
		{
			output2("\n<b>* Dane:</b> Met him");
			if(flags["FOUGHT_DANE_ON_MHENGA"] != undefined) output2(", Fought him on Mhen’ga");
			if(daneIsCrew())
			{
				output2(", Crewmember");
				if(9999 == 0) output2(" (Onboard Ship)");
			}
			roamCount++;
		}
		// Rival
		if(flags["RIVALCONFIGURED"] != undefined)
		{
			output2("\n<b>* [rival.name]:</b> Met [rival.em]");
			if(flags["INSULTED_COUSIN_ON_MHENGA"] != undefined) output2(" Insulted [rival.em] on Mhen’ga");
			roamCount++;
		}
		// Kaede
		if(flags["ANNOxKAEDE_INTRODUCED"] != undefined || flags["PUPPYSLUTMAS_2014"] != undefined || flags["MET_KAEDE"] != undefined || flags["KAEDE_MYRELLION_ENCOUNTER"] != undefined)
		{
			output2("\n<b>* Kaede:</b> Met her");
			if(flags["ANNOxKAEDE_INTRODUCED"] != undefined) output2(", Seen with Anno");
			if(flags["PUPPYSLUTMAS_2014"] != undefined) output2(", Seen on Ausaril");
			if(flags["KAEDE_MYRELLION_ENCOUNTER"] != undefined) output2(", Seen on Myrellion");
			if(flags["KAEDE_FUCKED"] != undefined) output2("\n<b>* Kaede, Times Sexed: </b>" + flags["KAEDE_FUCKED"]);
			roamCount++;
		}
		// Kara
		if(flags["MET_KARA"] != undefined)
		{
			output2("\n<b>* Kara:</b> Met her");
			roamCount++;
		}
		// Kirobutts!
		if(flags["RESCUE KIRO FROM BLUEBALLS"] == 1 && flags["KIRO_BAR_MET"] != undefined)
		{
			output2("\n<b>* Kiro:</b>");
			if(flags["KIRO_DISABLED_MINUTES"] > 0) output2(" Away");
			else output2(" Active");
			if(flags["KIRO_DRINKING_CONTEST_RESULTS"] != undefined) output2(", Participated in drinking contest with her");
			if(flags["KIRO_FUCKED_DURING_RESCUE"] != undefined || flags["KIRO_DEEPTHROATED_YOU"] != undefined || flags["KIRO_BALLJOBBED_YOU"] != undefined || flags["KIRO_X_SAEN_HAPPENED"] != undefined || flags["PUMPED_KIRO_PUSSY"] != undefined)
			{
				output2("\n<b>* Kiro, Vaginal Virginity:</b>");
				if(kiro.vaginalVirgin) output2(" Not taken");
				else output2(" Taken");
				output2("\n<b>* Kiro, Sexual History:</b> Sexed her");
				if(flags["KIRO_FUCKED_DURING_RESCUE"] != undefined) output2(" during rescue");
				if(flags["KIRO_DEEPTHROATED_YOU"] != undefined) output2(", She deepthroated you");
				if(flags["KIRO_BALLJOBBED_YOU"] != undefined) output2(", She gave you a balljob");
				if(flags["KIRO_X_SAEN_HAPPENED"] != undefined) output2(", Fucked her with Saendra");
				if(flags["PUMPED_KIRO_PUSSY"] != undefined) output2(", Pumped her Pussy");
			}
			roamCount++;
		}
		// Saendra
		if(flags["FALL OF THE PHOENIX STATUS"] >= 1 || flags["SAEN MET AT THE BAR"] != undefined)
		{
			output2("\n<b>* Saendra:</b> Met her");
			if(flags["SAEN MET AT THE BAR"] != undefined) output2(", Seen at Tavros");
			roamCount++;
		}
		// Shade
		if(flags["MET_KARA"] != undefined)
		{
			output2("\n<b>* Shade:</b> Met her");
			if(flags["SHADE_GOT_HELP_WITH_LAYING"] != undefined) output2(", Helped her with laying");
			if(flags["SHADE_INSEMINATION_COUNTER"] != undefined && flags["SHADE_INSEMINATION_COUNTER"] >= 20) output2(", Ready to lay tail cunt egg");
			if(flags["SHADE_TALKED_ABOUT_MODS"] != undefined)
			{
				output2("\n<b>* Shade, Milk Type: </b>" + GLOBAL.FLUID_TYPE_NAMES[chars["SHADE"].milkType]);
			}
			if(flags["SEXED_SHADE"] != undefined)
			{
				output2("\n<b>* Shade, Sexual History:</b> Sexed her");
				if(flags["TAKEN_SHADES_HARDLIGHT"] != undefined) output2(", Fucked by her hardlight strapon");
				if(flags["SHADE_BOOBWORSHIP"] != undefined) output2(", Worshipped her boobs");
			}
			roamCount++;
		}
		// Nothing recorded
		if(roamCount == 0)
		{
			output2("\n<b><u>Not Available</u></b>");
			output2("\n* <i>No data from roaming encounters have been logged.</i>");
		}
		
		// Distress Calls:
		output2("\n\n" + blockHeader("Distress Calls"));
		var travelCount:int = 0;
		// Operation: Space Phoenix Down
		if(flags["FALL OF THE PHOENIX STATUS"] != undefined)
		{
			output2("\n<b><u>Fall of the Phoenix</u></b>");
			output2("\n<b>* Status:</b>");
			if(flags["FALL OF THE PHOENIX DEFEATED PIRATES"] != undefined)
			{
				if(flags["FALL OF THE PHOENIX DEFEATED PIRATES"] == 1) output2(" Defeated pirates");
				else if(flags["FALL OF THE PHOENIX DEFEATED PIRATES"] == -1)  output2(" Lost to pirates");
				if(flags["FALL OF THE PHOENIX TAKEN SHIELD"] != undefined) output2(", Looted ship");
				if(flags["FALL OF THE PHOENIX ENGINEERING STATUS"] != 1) output2(", Engines need starting");
				else if(flags["FALL OF THE PHOENIX ENGINEERING STATUS"] == 1) output2(", Started engines");
				else if(flags["FALL OF THE PHOENIX STATUS"] == -1) output2(", Failed to save ship");
				if(flags["FALL OF THE PHOENIX STATUS"] >= 1) output2(", Saved Captain Saendra");
			}
			else if(flags["FALL OF THE PHOENIX STATUS"] == -1) output2(" Ignored call");
			else output2(" <i>In progress...</i>");
			
			output2("\n<b>* The <i>Phoenix</i>, Status:</b>");
			if(flags["SAENDRA PHOENIX AVAILABLE"] == undefined) output2(" Locked");
			else output2(" Unlocked");
			if(flags["SAENDRA PHOENIX STATUS TIMES"] >= -1) output2(", Undergoing repairs");
			
			travelCount++;
		}
		// Operation: Tanuki Problems #69
		if(flags["RESCUE KIRO FROM BLUEBALLS"] != undefined)
		{
			output2("\n<b><u>Rescue Kiro from Blueballs</u></b>");
			output2("\n<b>* Status:</b>");
			// Did you fix it?
			if(flags["RESCUE KIRO TECHSPEC MACHINE FIX"] == -1) output2(" Failed to fix machine,");
			else if(flags["RESCUE KIRO TECHSPEC MACHINE FIX"] == 1) output2(" Fixed machine,");
			// Did you save her?
			if(flags["RESCUE KIRO FROM BLUEBALLS"] == 1)
			{
				output2(" Saved Kiro");
				if(flags["KIRO_FUCKED_DURING_RESCUE"] != undefined) output2(", Fucked Kiro during rescue");
			}
			else if(flags["RESCUE KIRO FROM BLUEBALLS"] == -1)
			{
				if(flags["RESCUE KIRO TOOK CUTLASS"] != undefined || flags["RESCUE KIRO TOOK PISTOL"] != undefined || flags["RESCUE KIRO TECHSPEC MACHINE FIX"] != undefined || flags["RESCUE KIRO WAITED TO BOARD"] != undefined) output2(" Refused to rescue");
				else output2(" Ignored call");
			}
			else output2(" <i>In progress</i>");
			// Rewards or Loot?
			if(flags["RESCUE KIRO TOOK CUTLASS"] != undefined || flags["RESCUE KIRO TOOK PISTOL"] != undefined) output2(", Looted ship");
			if(flags["RESCUE KIRO FROM BLUEBALLS"] == 1 && flags["RESCUE KIRO TOOK CUTLASS"] == undefined && flags["RESCUE KIRO TOOK PISTOL"] == undefined) output2(", Rewarded");
			travelCount++;
		}
		// Nothing recorded
		if(travelCount == 0)
		{
			output2("\n<b><u>Not Available</u></b>");
			output2("\n* <i>No data from distress calls have been logged.</i>");
		}
		
		// Misc: (Optional)
		output2("\n\n" + blockHeader("Miscellaneous"));
		var miscCount:int = 0;
		// Resources, rare elements, etc.
		if(flags["OXONIUM_FOUND"] != undefined || 9999 == 0)
		{
			output2("\n<b><u>Resources</u></b>");
			// Oxonium
			if(flags["OXONIUM_FOUND"] != undefined) output2("\n<b>* Oxonium Deposits Found, Total: </b>" + flags["OXONIUM_FOUND"]);
			miscCount++;
		}
		// Super rare and weird TF items/sex toys - regular rare items/armor/weapons can be omitted
		if(flags["SYNTHSHEATH_ACQUIRED"] != undefined || flags["SYNTHSHEATH_TWO_FOUND"] != undefined || flags["LOOTED_COCKBOX"] != undefined || 9999 == 0)
		{
			output2("\n<b><u>Suspicious Items</u></b>");
			// Big like Cock-Box!
			if(flags["LOOTED_COCKBOX"] != undefined)
			{
				output2("\n<b>* TamaniCorp, Dong Designer:</b> Taken");
				if(flags["DONG_DESIGNER_INSTALLED"] != undefined) output2(", Installed");
				if(flags["USED_DONG_DESIGNER"] == undefined) output2(", Unused");
				else output2(", Used");
				if(flags["DONG_DESIGNER_MALFUNCTIONED"] != undefined) output2(", Has malfunctioned");
				if(flags["DONG_DESIGNER_BACKWASHED"] != undefined) output2(", Has backwashed");
				if(flags["DONG_DESIGNER_FLOODED"] != undefined) output2(", Has flooded");
			}
			// Horse wieners
			if(flags["SYNTHSHEATH_ACQUIRED"] != undefined || flags["SYNTHSHEATH_TWO_FOUND"] != undefined)
			{
				if(!CodexManager.entryViewed("SynthSheath")) output2("\n<b>* ???, Equine Phallus Found, Total: </b>");
				else output2("\n<b>* Xenogen Biotech, SynthSheath, Total Found: </b>");
				var horseCocksTotal:int = 0;
				if(flags["SYNTHSHEATH_ACQUIRED"] != undefined) horseCocksTotal++;
				if(flags["SYNTHSHEATH_TWO_FOUND"] != undefined) horseCocksTotal++;
				output2(String(horseCocksTotal));
			}
			miscCount++;
		}
		// Illegal items... Penny's gonna getcha!
		if(CodexManager.entryViewed("Dumbfuck") || CodexManager.entryViewed("Gush") || CodexManager.entryViewed("The Treatment") || flags["PENNY_THROBB_PURCHASE_UNLOCKED"] != undefined || flags["PENNY_THROBB_USES"] != undefined || flags["TIMES_THROBB_USED"] != undefined || 9999 == 0)
		{
			output2("\n<b><u>Illegal Items</u></b>");
			// Dumbfuck
			if(CodexManager.entryViewed("Dumbfuck"))
			{
				output2("\n<b>* Dumbfuck:</b> Known");
				if(flags["TIMES_TAKEN_DUMBFUCK"] != undefined)
				{
					if(flags["TIMES_TAKEN_DUMBFUCK"] == 1) output2(", Used once");
					else output2(", Used " + flags["TIMES_TAKEN_DUMBFUCK"] + " times");
					if(flags["DUMBFUCK_SNEEZES"] != undefined)
					{
						output2(" with " + flags["DUMBFUCK_SNEEZES"] + " sneeze");
						if(flags["DUMBFUCK_SNEEZES"] != 1) output2("s");
						output2(" total");
					}
				}
			}
			// Gush
			if(CodexManager.entryViewed("Gush"))
			{
				output2("\n<b>* Gush:</b> Known");
				if(flags["USED_GUSH"] != undefined) output2(", Used");
			}
			// Throbb
			if(flags["PENNY_THROBB_PURCHASE_UNLOCKED"] != undefined || flags["PENNY_THROBB_USES"] != undefined || flags["TIMES_THROBB_USED"] != undefined)
			{
				output2("\n<b>* Throbb:</b> Known");
				if(flags["TIMES_THROBB_USED"] != undefined)
				{
					if(flags["TIMES_THROBB_USED"] == 1) output2(", Used once");
					else output2(", Used " + flags["TIMES_THROBB_USED"] + " times");
				}
			}
			// The Treatment
			if(CodexManager.entryViewed("The Treatment"))
			{
				output2("\n<b>* The Treatment:</b> Known");
				if(pc.hasStatusEffect("Treated")) output2(", Used");
			}
			miscCount++;
		}
		// Nothing recorded
		if(miscCount == 0)
		{
			output2("\n<b><u>Not Available</u></b>");
			output2("\n* <i>No miscellaneous information has been logged.</i>");
		}
	}
}