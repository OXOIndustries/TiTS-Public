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
	
	addGhostButton(4, "Back", this.userInterface.showPrimaryOutput);
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
		userInterface.showPrimaryOutput();
		pButton.DeHighlight();
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
		pButton.Highlight();
	}
	else if (pButton.isActive && pButton.isHighlighted)
	{
		userInterface.showPrimaryOutput();
		pButton.DeHighlight();
	}
}

public function showMails():void
{
	userInterface.showMails();
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
	restHeal();
	if (deltaT == -1)
	{
		minutes = 230 + rand(20) + 1;
		output("You sit down and rest for around " + num2Text(Math.round(minutes/60)) + " hours.");
	}
	else
	{
		minutes = deltaT;
	}
	
	processTime(minutes);
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}
public function restHeal():void
{
	if(pc.HPRaw < pc.HPMax()) {
		pc.HP(Math.round(pc.HPMax() * .2));
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
	if (pc.hasStatusEffect("Renvra Eggs Messages Available") || pc.hasStatusEffect("Nyrea Eggs Messages Available"))
	{
		var cRoom:RoomClass = rooms[currentLocation];
		var pSpace:Boolean = cRoom.hasFlag(GLOBAL.PUBLIC);
		
		// This should avoid doubling messages up if the player has both pregnancies at the same time.
		if (pc.hasStatusEffect("Renvra Eggs Messages Available")) RenvraEggPregnancy.renvraEggsMessageHandler(pSpace, arg);
		else if (pc.hasStatusEffect("Nyrea Eggs Messages Available")) NyreaHuntressPregnancy.nyreaEggsMessageHandler(pSpace, arg);
	}
	
	// I named this badly, but this is the secondary pregnancy variant that Renvra has. It's much more complicated, so
	// all the checking is done at the target callsite.
	renvraMessageHandler();

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
			if(flags["FLAHNE_PISSED"] > 0) {
				flags["FLAHNE_PISSED"]--;
				if(flags["FLAHNE_PISSED"] < 0) flags["FLAHNE_PISSED"] = 0;
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
				if(days >= 2 && flags["NEW_TEXAS_COORDINATES_GAINED"] == undefined) newTexasEmail();
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

				// Tick up all of the attached mimbranes days since last fed
				mimbranesIncreaseDaysSinceFed();
				
				// Lane monies
				laneHandleCredits();
				//Venus pitcher
				venusSubmission(-1);
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
	
	flags["HYPNO_EFFECT_OUTPUT_DONE"] = undefined;
	updatePCStats();
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
		x = pc.breastRows[swelledRows[swelledRows.length-1]].breastRating();
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
			eventBuffer += "could now fit into " + indefiniteArticle(pc.breastCup(swelledRows[swelledRows.length-1])) + " bra!</b>";
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
		if(pc.hasPerk("Milky") && pc.hasPerk("Treated Milk")) eventBuffer += "it wasn't for your genetically engineered super-tits, your body would be slowing down production";
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
		if(pc.hasPerk("Milky") && pc.hasPerk("Treated Milk")) eventBuffer += "<b>However, with your excessively active udders, you are afraid the production will never stop.</b>";
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
	if(pc.upperUndergarment is BountyBra || pc.isPregnant())
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
	if(pc.milkMultiplier < 50 && !(pc.upperUndergarment is BountyBra) && !pc.isPregnant()) {
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
	output2("\n<b><u>NPC Statistics:</u></b>\n");
	if(flags["RESCUE KIRO FROM BLUEBALLS"] == 1) output2("<b>Kiro's Trust: </b>" + kiroTrust() + "%\n");
	//Lane shit
	if(flags["LANE_HYPNOSIS_LEVEL"] != 0 && flags["LANE_HYPNOSIS_LEVEL"] != undefined)
	{
		output2("\n<b>Lane, Hypnosis Level: </b>" + flags["LANE_HYPNOSIS_LEVEL"] + "\n");

	}
	if(reahaRecruited()) 
	{
		output2("<b>Reaha's Patch Addiction: </b>" + reahaAddiction() + "%\n");
		output2("<b>Reaha's Confidence: </b>" + reahaConfidence() + "%\n");
	}
	if (flags["SAEN MET AT THE BAR"] != undefined) output2("<b>Saendra's Affection: </b>" + saendraAffection() + "% (69% Max)\n");
	if (flags["KELLY_ATTRACTION"] != undefined) output2("<b>Kelly's Attraction: </b>" + flags["KELLY_ATTRACTION"] + "%\n");



	//=====GENERAL STATS=====//
	output2("\n<b><u>General Statistics:</u></b>\n");
	output2("<b>Crew, Recruited: </b>" + crewRecruited() + "\n");
	output2("<b>Crew, Onboard: </b>" + crew(true) + "\n");
	if(StatTracking.getStat("milkers/prostate milker uses") > 0)
	{
		output2("<b>Milker, Prostate, Times Used: </b>" + StatTracking.getStat("milkers/prostate milker uses") + "\n");
		output2("<b>Milker, Prostate, Cum Milked: </b>" + StatTracking.getStat("milkers/cum milked") + "\n");
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
		
	}
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