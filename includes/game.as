import classes.BreastRowClass;
import classes.Characters.PlayerCharacter;
import classes.Creature;
import classes.GameData.PerkData;
import classes.GameData.Pregnancy.Handlers.RenvraEggPregnancy;
import classes.GameData.Pregnancy.Handlers.NyreaHuntressPregnancy;
import classes.GameData.Pregnancy.PregnancyManager;
import classes.GUI;
import classes.Items.Accessories.LeithaCharm;
import classes.Items.Miscellaneous.EmptySlot;
import classes.Items.Miscellaneous.HorsePill;
import classes.Items.Transformatives.Clippex;
import classes.Items.Transformatives.Goblinola;
import classes.RoomClass;
import classes.StorageClass;
import classes.UIComponents.ContentModules.MailModule;
import classes.UIComponents.SquareButton;
import flash.events.Event;
import classes.Engine.Combat.DamageTypes.DamageFlag;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.ItemSlotClass;
import classes.PregnancyData;
import classes.SexualPreferences;
import classes.StringUtil;

public function get canSaveAtCurrentLocation():Boolean
{

	if(inCombat()) 
		return false;

	if (inSceneBlockSaving)
		return false;

	return rooms[currentLocation].canSaveInRoom
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
		showLocationName();
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

public function showLocationName():void
{
	if(currentLocation == "SHIP INTERIOR") setLocation("SHIP\nINTERIOR", rooms[rooms["SHIP INTERIOR"].outExit].planet, rooms[rooms["SHIP INTERIOR"].outExit].system);
	else setLocation(rooms[currentLocation].roomName, rooms[currentLocation].planet, rooms[currentLocation].system);
}

public function mainGameMenu():void {
	flags["COMBAT MENU SEEN"] = undefined;
	
	if (flags["PC_UPBRINGING"] == undefined)
	{
		eventQueue.push(fixPcUpbringing);
	}
	
	if (flags["CELISE_BEDSTUFF_HAPPENED"] != undefined)
	{
		flags["CELISE_BEDSTUFF_HAPPENED"] = undefined;
	}
	
	//Display shit that happened during time passage.
	if (processEventBuffer()) return;
	
	//Queued events can fire off too!
	//trace("EventQueue = ", eventQueue);
	//trace("this.eventQueue = ", this.eventQueue);
	if(eventQueue.length > 0) {
		//Do the most recent:
		eventQueue[0]();
		//Strip out the most recent:
		eventQueue.splice(0,1);
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
	output(rooms[currentLocation].description);
	showLocationName();
	if(inCombat()) 
		output("\n\n<b>You’re still in combat, you ninny!</b>");
	if(pc.hasStatusEffect("Temporary Nudity Cheat"))
		output("\n\n<b>BUG REPORT: TEMP NUDITY STUCK ON.</b>");
	//Standard buttons:
	clearMenu(false);
	userInterface.showBust("none");
	inSceneBlockSaving = false;
	updatePCStats();
	//Inventory shit
	itemScreen = mainGameMenu;
	lootScreen = inventory;
	addButton(13, "Inventory", inventory);
	//Other standard buttons

	if(pc.lust() < 33) {
		if(pc.canLactate()) addButton(8, "Hand Milk", milkturbation);
		else addDisabledButton(8, "Masturbate");
	}
	else {
		if(pc.hasStatusEffect("Myr Venom Withdrawal")) addDisabledButton(8, "Masturbate", "Masturbate", "While you’re in withdrawal, you don’t see much point in masturbating, no matter how much your body may want it.");
		else if(!pc.canMasturbate()) addDisabledButton(8, "Masturbate", "Masturbate", "You can’t seem to masturbate at the moment....");
		else addButton(8, "Masturbate", masturbateMenu);
	}
	if(!rooms[currentLocation].hasFlag(GLOBAL.BED)) 
		addButton(9, "Rest", rest);
	else 
		addButton(9, "Sleep", sleep);
	//Display movement shits - after clear menu for extra options!
	if(rooms[currentLocation].runOnEnter != undefined) {
		if(rooms[currentLocation].runOnEnter()) return;
	}
	//Turn off encounters since you're already here. Moving clears this.
	flags["ENCOUNTERS_DISABLED"] = 1;

	if(pc.hasStatusEffect("Endowment Immobilized"))
	{
		if (rooms[currentLocation].northExit && !isNavDisabled(NAV_NORTH_DISABLE))
		{
			addDisabledButton(6, "North", "North", "You can't move - you're immobilized!");
		}
		if (rooms[currentLocation].eastExit && !isNavDisabled(NAV_EAST_DISABLE)) 
		{
			addDisabledButton(12, "East", "East", "You can't move - you're immobilized!");
		}
		if (rooms[currentLocation].southExit && !isNavDisabled(NAV_SOUTH_DISABLE)) 
		{
			addDisabledButton(11,"South","South","You can't move - you're immobilized!");
		}
		if (rooms[currentLocation].westExit && !isNavDisabled(NAV_WEST_DISABLE)) 
		{
			addDisabledButton(10,"West","West","You can't move - you're immobilized!");
		}
		if (rooms[currentLocation].inExit && !isNavDisabled(NAV_IN_DISABLE))
		{
			addDisabledButton(5, rooms[currentLocation].inText, rooms[currentLocation].inText, "You can't move - you're immobilized!");
		}
		if (rooms[currentLocation].outExit && !isNavDisabled(NAV_OUT_DISABLE)) 
		{
			addDisabledButton(7,rooms[currentLocation].outText,rooms[currentLocation].outText,"You can't move - you're immobilized!");
		}
	}
	else
	{
		if (rooms[currentLocation].northExit && !isNavDisabled(NAV_NORTH_DISABLE))
		{
			addButton(6, "North", move, rooms[currentLocation].northExit);
		}
		if (rooms[currentLocation].eastExit && !isNavDisabled(NAV_EAST_DISABLE))
		{
			addButton(12, "East", move, rooms[currentLocation].eastExit);
		}
		if (rooms[currentLocation].southExit && !isNavDisabled(NAV_SOUTH_DISABLE))
		{
			addButton(11,"South", move, rooms[currentLocation].southExit);
		}
		if (rooms[currentLocation].westExit && !isNavDisabled(NAV_WEST_DISABLE))
		{
			addButton(10, "West", move, rooms[currentLocation].westExit);
		}
		if (rooms[currentLocation].inExit && !isNavDisabled(NAV_IN_DISABLE)) 
		{
			addButton(5, rooms[currentLocation].inText, move, rooms[currentLocation].inExit);
		}
		if (rooms[currentLocation].outExit && !isNavDisabled(NAV_OUT_DISABLE))
		{
			addButton(7, rooms[currentLocation].outText, move, rooms[currentLocation].outExit);
		}
	}
	if(currentLocation == shipLocation) 
		addButton(5, "Enter Ship", move, "SHIP INTERIOR");

	flags["NAV_DISABLED"] = undefined; // Clear disabled directions.

	//if (kGAMECLASS.debug) this.addButton(13, "RESET NPCs", initializeNPCs);
	addButton(14, "Codex", showCodex);
	// Show the minimap too!
	userInterface.showMinimap();
	generateMap();
	userInterface.perkDisplayButton.Activate();
}

public function generateMap():void
{
	generateMapForLocation(currentLocation);
}

public function generateMapForLocation(location:String):void
{
	userInterface.setMapData(mapper.generateMap(location));
}

public function showCodex():void
{
	userInterface.showCodex();
	codexHomeFunction();
	clearGhostMenu();
	
	// Default toggles
	if(flags["TOGGLE_MENU_STATS"] == undefined) flags["TOGGLE_MENU_STATS"] = "All";
	if(flags["TOGGLE_MENU_LOG"] == undefined) flags["TOGGLE_MENU_LOG"] = "All";
	
	// TESTO BUTTONO
	addGhostButton(0, "Stats", statisticsScreen, flags["TOGGLE_MENU_STATS"]);
	
	//addGhostButton(1, "Messages", function():void { } );
	//addGhostButton(2, "Log", function():void { } );
	//addGhostButton(3, "CHEEVOS", function():void { } );
	addGhostButton(1, "Log", displayQuestLog, flags["TOGGLE_MENU_LOG"]);
	
	addGhostButton(4, "Back", userInterface.showPrimaryOutput);
}

// Temp display stuff for perks
public function showPerkListHandler(e:Event = null):void
{
	var pButton:SquareButton = (userInterface as GUI).perkDisplayButton;
	
	if (pc.short.length == 0) return;
	
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
	
	if (pc.short.length == 0) return;
	
	if (!pc || pc.hasStatusEffect("In Creation"))
	{
		userInterface.mailsDisplayButton.Deactivate();
		return;
	}
	
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
	
	if (perkList.length == 0) output2("<i>No available character perks have been acquired.</i>");
	
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
	if (flags["RECRUITED_CELISE"] > 0) counter++;
	if (reahaRecruited()) counter++;
	if (!annoNotRecruited()) counter++;
	if (bessIsFollower()) counter++;
	if (hasGooArmor()) counter++;
	if (varmintIsTame()) counter++;
	return counter;
}

public function crew(counter:Boolean = false):Number {
	if(!counter) {
		clearOutput();
		clearMenu();
	}
	var crewMessages:String = "";
	var count:int = 0;
	if(celiseIsCrew()) {
		count++;
		if(!counter) {
			addButton(count - 1, "Celise", celiseFollowerInteractions);
			crewMessages += "\n\nCelise is onboard, if you want to go see her. The ship does seem to stay clean of spills and debris with her around.";
		}
	}
	if(reahaIsCrew())
	{
		count++;
		if(!counter)
		{
			addButton(count-1, "Reaha", approachShipBoardReahaWhyDidntSavinCodeThisHeWasntExhaustedYesterday);
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
	if (bessIsCrew())
	{
		count++;
		if (!counter)
		{
			crewMessages += "\n\n[bess.name] is wandering around the ship and keeping [bess.himHer]self busy. It shouldn't be that hard to find [bess.himHer].";
			addButton(count - 1, bess.short, approachFollowerBess);
		}
	}
	if (varmintIsCrew())
	{
		count++;
		if (!counter)
		{
			crewMessages += varmintOnShipBonus(count - 1);
		}
	}
	if(!counter) {
		if(count > 0) {
			showName("\nCREW");
			output("Who of your crew do you wish to interact with?" + crewMessages);
		}
		addButton(14, "Back", mainGameMenu);
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
	clearMenu();
	addButton(0, "Next", mainGameMenu);
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
	
	if(outputs) clearOutput();
	if(currentLocation == "SHIP INTERIOR")
	{
		if(outputs)
		{			
			// Anno interjection
			if (flags["ANNO_SLEEPWITH_INTRODUCED"] == undefined && annoIsCrew() && annoSexed() > 0)
			{
				annoSleepWithIntroduce();
				return;
			}
		}
	}
	if(outputs)
	{
		if ((pc.XPRaw >= pc.XPMax()) && pc.level < 8 && flags["LEVEL_UP_AVAILABLE"] == undefined)
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
		else if (pc.level == 8)
		{
			eventBuffer += "\n\n<b>You've already reached the current maximum level. It will be raised in future builds.</b>";
		}
	}
	if(currentLocation == "SHIP INTERIOR")
	{
		if(outputs)
		{
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
			else if (bessIsCrew() && rand(3) == 0 && flags["CREWMEMBER_SLEEP_WITH"] == "BESS")
			{
				flags["BESS_SLEEPWITH_DOMORNING"] = 1;
			}
		}
	}
	if(outputs) output("You lie down and sleep for about " + num2Text(Math.round(minutes/60)) + " hours.");
	
	sleepHeal();
	
	processTime(minutes);
	if(outputs)
	{
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
		if(currentLocation == "SHIP INTERIOR") grayGooSpessSkype();
	}
	
	clearMenu();
	if(currentLocation == "SHIP INTERIOR")
	{
		if (flags["ANNO_SLEEPWITH_DOMORNING"] != undefined)
		{
			addButton(0, "Next", annoMorningRouter);
			return;
		}
		if (flags["BESS_SLEEPWITH_DOMORNING"] == 1)
		{
			addButton(0, "Next", bessMorningEvents);
			return;
		}
		if (tryProcDommyReahaTime(minutes - rand(301)))
		{
			addButton(0, "Next", reahaDommyFuxTime);
			return;
		}
	}
	
	addButton(0, "Next", mainGameMenu);
}

public function sleepHeal():void
{
	if (pc.HPRaw < pc.HPMax()) 
	{
		pc.HP(Math.round(pc.HPMax()));
	}
	// Fecund Figure shape loss (Lose only after sore/working out)
	if(pc.hasPerk("Fecund Figure") && pc.hasStatusEffect("Sore"))
	{
		var numPreg:int = pc.totalPregnancies();
		if(pc.isPregnant(3)) numPreg--;
		if(numPreg <= 0)
		{
			pc.addPerkValue("Fecund Figure", 1, -1);
			pc.addPerkValue("Fecund Figure", 2, -1);
			pc.addPerkValue("Fecund Figure", 3, -1);
		}
		pc.addPerkValue("Fecund Figure", 1, -1);
		pc.addPerkValue("Fecund Figure", 2, -1);
		pc.addPerkValue("Fecund Figure", 3, -1);
		if(pc.perkv1("Fecund Figure") < 0) pc.setPerkValue("Fecund Figure", 1, 0);
		if(pc.perkv2("Fecund Figure") < 0) pc.setPerkValue("Fecund Figure", 2, 0);
		if(pc.perkv3("Fecund Figure") < 0) pc.setPerkValue("Fecund Figure", 3, 0);
	}
	pc.removeStatusEffect("Sore");
	pc.removeStatusEffect("Sore Counter");
	pc.removeStatusEffect("Jaded");
	
	if (pc.energy() < pc.energyMax()) pc.energyRaw = pc.energyMax();
}

public function shipMenu():Boolean {
	
	rooms["SHIP INTERIOR"].outExit = shipLocation;
	
	setLocation("SHIP\nINTERIOR", rooms[rooms["SHIP INTERIOR"].outExit].planet, rooms[rooms["SHIP INTERIOR"].outExit].system);
	
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
	
	// Goo Armor hook
	if (flags["ANNO_NOVA_UPDATE"] == 2)
	{
		grayGooArrivesAtShip();
		return true;
	}
	
	// Main ship interior buttons
	if(currentLocation == "SHIP INTERIOR")
	{
		if (crew(true) > 0) addButton(2, "Crew", crew);
		if (hasShipStorage()) addButton(3, "Storage", shipStorageMenuRoot);
		else addDisabledButton(3, "Storage");
		addButton(4, "Shower", showerMenu);
		addButton(5, "Fly", flyMenu);
	}

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
			addButton(14, "Back", mainGameMenu);
			return;
		}
		else 
		{
			pc.removeStatusEffect("Disarmed");
		}
	}
	output("Where do you want to go?");
	clearMenu();
	//TAVROS
	if(shipLocation != "TAVROS HANGAR") 
		addButton(0, "Tavros", flyTo, "Tavros");
	else addDisabledButton(0, "Tavros");
	//MHEN'GA
	if(shipLocation != "SHIP HANGAR") 
		addButton(1, "Mhen'ga", flyTo, "Mhen'ga");
	else addDisabledButton(1, "Mhen'ga");
	//TARKUS
	if(flags["UNLOCKED_JUNKYARD_PLANET"] != undefined)
	{
		if(shipLocation != "201") addButton(2, "Tarkus", flyTo, "Tarkus");
		else addDisabledButton(2, "Tarkus", "You’re already here.");
	}
	else addDisabledButton(2, "Locked", "Locked", "You need to find your father’s probe on Mhen’ga to get this planet’s coordinates.");
	//MYRELLION
	if(flags["PLANET_3_UNLOCKED"] != undefined)
	{
		if (flags["KQ2_MYRELLION_STATE"] == undefined)
		{
			if(shipLocation != "600") addButton(3, "Myrellion", flyTo, "Myrellion");
			else addDisabledButton(3, "Myrellion", "Myrellion", "You’re already here.");
		}
		else if (flags["KQ2_MYRELLION_STATE"] == 1)
		{
			addDisabledButton(3, "Myrellion", "Myrellion", "It would be wise not to visit a planet currently experiencing a heavy nuclear winter...");
		}
		else
		{
			if (shipLocation != "2I7") addButton(3, "Myrellion", flyTo, "MyrellionDeepCaves");
			else addDisabledButton(3, "Myrellion", "Myrellion", "You’re already here.");
		}
	}
	else addDisabledButton(3, "Locked", "Locked", "You need to find one of your father’s probes to access this planet’s coordinates and name.");
	//NEW TEXAS
	if(flags["NEW_TEXAS_COORDINATES_GAINED"] != undefined)
	{
		if(shipLocation != "500") addButton(5, "New Texas", flyTo, "New Texas");
		else addDisabledButton(5, "New Texas", "New Texas", "You’re already here.");
	}
	else addDisabledButton(5, "Locked", "Locked", "You have not yet learned of this planet’s coordinates.");
	//POE A
	if(flags["HOLIDAY_OWEEN_ACTIVATED"] != undefined)
	{
		if(flags["POE_A_DISABLED"] == 1) addDisabledButton(6, "Poe A", "Poe A", "You probably shouldn’t go back there after your last trip to ‘The Masque.’")
		else if(shipLocation != "POESPACE") addButton(6, "Poe A", flyTo, "Poe A");
		else addDisabledButton(6, "Poe A", "Poe A", "You’re already here.");
	}
	else addDisabledButton(6, "Locked", "Locked", "You have not yet learned of this planet.");
	if (flags["KQ2_QUEST_OFFER"] != undefined && flags["KQ2_QUEST_DETAILED"] == undefined)
	{
		addButton(7, "Kara", flyTo, "karaQuest2", "Kara", "Go see what Kara has up her sleeve.");
	}
	addButton(14, "Back", mainGameMenu);
}

public function flyTo(arg:String):void {
	
	if (flags["SUPRESS TRAVEL EVENTS"] == 1)
	{
		flags["SUPRESS TRAVEL EVENTS"] = 0;
	}
	else if(!InCollection(arg, ["Poe A", "karaQuest2"]))
	{
		var tEvent:Function = tryProcTravelEvent();
		if (tEvent != null)
		{
			incomingMessage(tEvent, arg);
			return;
		}
	}
	
	var shortTravel:Boolean = false;
	var interruptMenu:Boolean = false;
	
	clearOutput();
	
	if(arg == "Mhen'ga")
	{
		shipLocation = "SHIP HANGAR";
		currentLocation = "SHIP HANGAR";
		flyToMhenga();
	}
	else if(arg == "Tavros")
	{
		shipLocation = "TAVROS HANGAR";
		currentLocation = "TAVROS HANGAR";
		flyToTavros();
	}
	else if(arg == "Tarkus")
	{
		shipLocation = "201";
		currentLocation = "201";
		landOnTarkus();
	}
	else if(arg == "New Texas")
	{
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
	else if (arg == "MyrellionDeepCaves")
	{
		shipLocation = "2I7";
		currentLocation = "2I7";
		flyToMyrellionDeepCaves();
	}
	else if(arg == "Poe A")
	{
		shipLocation = "POESPACE";
		currentLocation = "POESPACE";
		flyToPoeA();
	}
	else if (arg == "karaQuest2")
	{
		shortTravel = (shipLocation == "600");
		interruptMenu = true;
		kq2TravelToKara(shortTravel);
	}
	
	var timeFlown:Number = (shortTravel ? 30 + rand(10) : 600 + rand(30));
	StatTracking.track("movement/time flown", timeFlown);
	processTime(timeFlown);
	
	if (!interruptMenu)
	{
		if(landingEventCheck(arg)) return;
		flags["LANDING_EVENT_CHECK"] = 1;
		
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

public function leaveShipOK():Boolean
{
	if(pc.hasStatusEffect("Endowment Immobilized"))
	{
		output(" and attempt to head towards the airlock... but you can barely budge an inch from where you are sitting. You’re immobilized. It looks like your endowments have swollen far too large, making it impossible for you to exit your ship! <b>You’ll have to take care of that if you want to leave...</b>");
		currentLocation = "SHIP INTERIOR";
		return false;
	}
	return true;
}

public function landingEventCheck(arg:String = ""):Boolean
{
	if(flags["LANDING_EVENT_CHECK"] != 1) return false;
	
	flags["LANDING_EVENT_CHECK"] = undefined;
	
	if(arg == "Mhen'ga")
	{
		if(((annoIsCrew() && flags["ANNOxSYRI_EVENT"] != undefined) || !annoIsCrew()) && syriIsAFuckbuddy() && rand(5) == 0)
		{
			currentLocation = "SHIP INTERIOR";
			gettingSyrisPanties();
			return true;
		}
	}
	if(arg != "New Texas")
	{
		// Wild varmint stowaway!
		if(varmintStowaway())
		{
			currentLocation = "SHIP INTERIOR";
			getAPetVarmint();
			return true;
		}
	}
	return false;
}

public function showerMenu():void {
	clearOutput();
	output("You find yourself in the ship’s shower room. What would you like to do?");
	clearMenu();
	addButton(0, "Shower", showerOptions, 0, "Shower", "Take a shower and wash off any sweat or grime you might have.");
	if (pc.lust() >= 33 && crew(true) > 0) addButton(1, "Sex", showerOptions, 1, "Sex", "Have some shower sex with a crew member.");
	addButton(14, "Back", mainGameMenu);
}

public function showerOptions(option:int = 0):void {
	clearOutput();
	clearMenu();
	var showerSex:int = 0;
	// Regular showers
	if (option == 0)
	{
		author("Couch");
		output("Adventuring is fun and all, but it also leaves a [pc.guy] feeling dirty at the end of the day");
		if (pc.libido() > 50) output(", and not in the good way");
		output(". You decide to hit the showers, stripping off your gear with a sigh of relief as you take a moment just to stretch and enjoy being");
		if (pc.isNude()) output(" fully");
		else output(" truly");
		output(" nude.");
		output("\n\nThe water comes out icy cold, sending a shiver down your spine. You think to yourself that you really should spring for a better temperature regulator, carefully adjusting the dial back and forth until finding that sweet spot between freezing and scalding where the water is blissfully warm. Now you can finally relax, setting to applying a good dose of shampoo to your [pc.hair]. Your [pc.skinFurScalesNoun] comes next, your hands running up and down your front to coat every last inch in a nice thick lather.");
		if (pc.biggestTitSize() >= 4) output(" You can’t help but take a moment just to grope your [pc.chest], licking your lips at how good it feels to be so busty.");
		if (pc.hasWings()) output(" Now for the fun part.");
		output(" You carefully apply more body wash to a brush and reach with it over your shoulder to scrub your back.");
		if (pc.hasWings())
		{
			output(" As it hits that spot right between your wingpoints you can’t help but shudder and moan,");
			if (pc.hasCock()) output(" [pc.eachCock] stiffening at");
			output(" the rush of pleasure cascading down your spine. Gods, you love having wings! They get their own turn at being washed when your back’s done, delicate brushing ensuring they’re free of dust and grime.");
		}
		output("\n\nOf course, you can’t forget below the belt.");
		if (pc.hasTail()) output(" You curl [pc.oneTail] in front to help with lathering it up, briefly relishing the little pleasure spot right at the top of where it meets your spine.");
		output(" Your [pc.hips] come next, followed by your [pc.ass]");
		if (pc.tone >= 30 && pc.buttRating() < 4) output(", relishing the hard, taut muscles you’ve worked so hard to achieve");
		else if (pc.tone < 30 && pc.buttRating() >= 10) output(", unable to resist topping it off with a good spank");
		output(".");
		output("\n\nEven after you’re fully rinsed off, you let yourself stay under the water for a few minutes longer, just enjoying the warmth running down your body. There’s nothing like a good shower to just melt all the tension away.");
		if (pc.lust() >= 33)
		{
			output(" In fact...");
			output("\n\nYou");
			if(pc.hasGenitals())
			{
				if(pc.genitalLocation() >= 2) output(" look back at your groin,");
				else output(" look down,");
				if (pc.hasCock()) output(" [pc.eachCock] stiff");
				if (pc.hasCock() && pc.hasVagina()) output(" and");
				if (pc.hasVagina()) output(" [pc.eachVagina] slick");
			}
			else output(" flex your [pc.asshole]");
			output(". Maybe you’re not done showering just yet.");
			
			if (pc.hasStatusEffect("Myr Venom Withdrawal")) addDisabledButton(0, "Masturbate", "Masturbate", "While you’re in withdrawal, you don’t see much point in masturbating, no matter how much your body may want it.");
			else if (!pc.canMasturbate()) addDisabledButton(0, "Masturbate", "Masturbate", "You can’t seem to masturbate at the moment....");
			else
			{
				showerSex = shipShowerFaps(true);
			}
			addButton(showerSex, "Nevermind", shipShowerFappening, "Nevermind", "On second thought...");
		}
		else
		{
			output("\n\nFinally you feel you’ve gotten all the relaxation you can and shut off the water, stepping out and toweling yourself off. You slip your gear on with a refreshed smile, squeaky clean and ready to resume your adventure.");
			addButton(0, "Next", mainGameMenu);
		}
		
		pc.shower();
		processTime(10);
	}
	// Shower sex options
	else if (option == 1)
	{
		if (annoIsCrew() && pc.hasGenitals())
		{
			addButton(showerSex, "Anno", annoFollowerShowerSex);
			showerSex++;
		}
		if (showerSex > 0) output(" Feeling a little turned on, you decide that maybe you should have some fun shower sex with one of your crew. Who do you approach?");
		else output(" You don’t seem to have any crew members onboard who can have shower sex with you at the moment.");
		addButton(14, "Back", showerMenu);
	}
}

public function sneakBackYouNudist():void
{
	clearOutput();
	output("You meticulously make your way back to the ship using every ounce of subtlety you possess. It takes way longer than you would have thought thanks to a couple of near-misses, but you make it safe and sound to the interior of your craft.");
	processTime(180+rand(30));
	currentLocation = "SHIP INTERIOR";
	generateMap();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function move(arg:String, goToMainMenu:Boolean = true):void {
	//Prevent movement for nudists into nude-restricted zones.
	if(rooms[arg].hasFlag(GLOBAL.NUDITY_ILLEGAL))
	{
		var nudistPrevention:Boolean = false;
		if((!pc.isChestGarbed() || pc.isChestExposed()) && pc.biggestTitSize() > 1) nudistPrevention = true;
		if(!pc.isCrotchGarbed() || pc.isCrotchExposed() || pc.isAssExposed()) nudistPrevention = true;
		if(nudistPrevention)
		{
			clearOutput();
			output("Nudity is illegal in that location! You'll have to cover up if you want to go there.");
			clearMenu();
			addButton(0, "SneakBack", sneakBackYouNudist, undefined, "SneakBack", "Sneak back to the ship. Fuckin' prudes. It might take you a couple hours to get back safely.");
			addButton(14, "Back", mainGameMenu);
			return;
		}
	}
	//Reset the thing that disabled encounters
	flags["ENCOUNTERS_DISABLED"] = undefined;

	var moveMinutes:int = rooms[currentLocation].moveMinutes;
	//Moveable immobilization adds more minutes!
	moveMinutes += immobilizedUpdate(true);
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
	generateMap();
	
	trace("Printing map for " + currentLocation);
	//mapper.printMap(map);
	//process time here, then back to mainGameMenu!
	mainGameMenu();
}

public function statusTick():void {
	var expiredStatuses:Array = new Array();
	var y:int = 0;
	var gogoVenomShit:Boolean = false;
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
				//Goblinola changes!
				if(pc.statusEffects[x].storageName == "Goblinola Bar")
				{
					var gobbyTF:Goblinola = new Goblinola();
					eventQueue[eventQueue.length] = gobbyTF.itemEndGoblinTF;
				}
				//Goblinola face changes
				if(pc.statusEffects[x].storageName == "Gabilani Face Change")
				{
					var gobbyFaceTF:Goblinola = new Goblinola();
					eventQueue[eventQueue.length] = gobbyFaceTF.itemGoblinFaceTF;
				}
				//Clippex changes!
				if(pc.statusEffects[x].storageName == "Clippex Gel")
				{
					var clippexTF:Clippex = new Clippex();
					if(pc.statusEffects[x].value2 > 1) eventQueue[eventQueue.length] = clippexTF.itemClippexTFPlus;
					else eventQueue[eventQueue.length] = clippexTF.itemClippexTF;
				}
				//Semen's Friend changes!
				if(pc.statusEffects[x].storageName == "Semen's Candy")
				{
					var semensTF:SemensFriend = new SemensFriend();
					if(pc.statusEffects[x].value2 > 1) eventQueue[eventQueue.length] = semensTF.itemSemensFriendTFPlus;
					else eventQueue[eventQueue.length] = semensTF.itemSemensFriendTF;
				}
				if(pc.statusEffects[x].storageName == "Red Myr Venom")
				{
					//Bit of a hacky solution
					gogoVenomShit = true;
				}
				//Jaded wears off!
				if(pc.statusEffects[x].storageName == "Jaded")
				{
					eventBuffer += "\n\nNo longer bored from your previous whoring session, you feel a bit more refreshed now.";
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
				//Mighty Tight ends!
				if(pc.statusEffects[x].storageName == "Mighty Tight")
				{
					eventBuffer += "\n\nPausing for a moment, you feel your backdoor";
					if(pc.hasVagina()) eventBuffer += " and [pc.vaginas] relaxing";
					else eventBuffer += " relax";
					eventBuffer += " a bit. It is probably safe to say that you are no longer under the effects of Mighty Tight.";
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
				//Sterilex/Infertile ends!
				if(pc.statusEffects[x].storageName == "Infertile")
				{
					eventBuffer += "\n\nA strange tingling sensation spreads through your loins as your microsurgeons are suddenly reinvigorated. Your codex then beeps to notify you that you have regained your";
					if(pc.hasGenitals())
					{
						if(pc.hasVagina()) eventBuffer += " fertility";
						if(pc.isHerm()) eventBuffer += " and";
						if(pc.hasCock()) eventBuffer += " virility";
					}
					else eventBuffer += " fertility and virility should you ever have the genitals for them";
					eventBuffer += ". <b>Your ability to potentionally create life has been restored!</b>";
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
				if (pc.statusEffects[x].storageName == "GaloMax")
				{
					eventQueue.push(galoMaxTFProc);
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
	//Alright, now do the venom shit - since adding more statuses could fuck shit otherwise
	if(gogoVenomShit) venomExpirationNotice();
}

public function variableRoomUpdateCheck():void
{
	/* MHENGA */
	
	//Kelly's work - close/open Xenogen Biotech.
	//Open up shop: link room
	if(hours >= 6 && hours < 17) 
	{
		rooms["SOUTH ESBETH 2"].northExit = "KELLY'S OFFICE";
		rooms["BURT'S BACK END"].removeFlag(GLOBAL.NPC);
		//Add back in icons.
		rooms["JULIAN'S OFFICE"].addFlag(GLOBAL.NPC);
		rooms["KELLY'S OFFICE"].addFlag(GLOBAL.NPC);
	}
	//Close shop: 
	else
	{
		//rooms["SOUTH ESBETH 2"].northExit = "";
		//Get rid of icons
		rooms["KELLY'S OFFICE"].removeFlag(GLOBAL.NPC);
		rooms["JULIAN'S OFFICE"].removeFlag(GLOBAL.NPC);
		//Add Kelly icon in the bar
		rooms["BURT'S BACK END"].addFlag(GLOBAL.NPC);
	}
	//Hungry Hungry Rahn
	if(flags["SEEN_BIMBO_PENNY"] != undefined && (hours < 8 || hours >= 17))
	{
		rooms["CUSTOMS OFFICE"].removeFlag(GLOBAL.NPC);
	}
	else rooms["CUSTOMS OFFICE"].addFlag(GLOBAL.NPC);
	//Pitchers on Mhen'ga
	if(flags["ROOM_80_PITCHER_MET"] == 1)
	{
		rooms["OVERGROWN ROCK 12"].addFlag(GLOBAL.PLANT_BULB);
	}
	else rooms["OVERGROWN ROCK 12"].removeFlag(GLOBAL.PLANT_BULB);
	if(flags["ROOM_65_PITCHER_MET"] == 1)
	{
		rooms["VINED JUNGLE 3"].addFlag(GLOBAL.PLANT_BULB);
	}
	else rooms["VINED JUNGLE 3"].removeFlag(GLOBAL.PLANT_BULB);
	if(flags["ROOM_61_PITCHER_MET"] == 1)
	{
		rooms["DEEP JUNGLE 2"].addFlag(GLOBAL.PLANT_BULB);
	}
	else rooms["DEEP JUNGLE 2"].removeFlag(GLOBAL.PLANT_BULB);
	//Mhenga Probe
	if(flags["DIDNT_ENGAGE_RIVAL_ON_MHENGA"] == undefined && flags["FOUGHT_DANE_ON_MHENGA"] == undefined)
	{
		rooms["METAL POD 1"].roomName = "METAL\nPOD";
		rooms["METAL POD 1"].addFlag(GLOBAL.HAZARD);
		rooms["METAL POD 1"].addFlag(GLOBAL.QUEST);
		rooms["METAL POD 1"].removeFlag(GLOBAL.OBJECTIVE);
	}
	else if(flags["MHENGA_PROBE_CASH_GOT"] == undefined && flags["WHUPPED_DANES_ASS_ON_MHENGA"] != undefined)
	{
		rooms["METAL POD 1"].roomName = "METAL\nPOD";
		rooms["METAL POD 1"].removeFlag(GLOBAL.HAZARD);
		rooms["METAL POD 1"].removeFlag(GLOBAL.QUEST);
		rooms["METAL POD 1"].addFlag(GLOBAL.OBJECTIVE);
	}
	else
	{
		rooms["METAL POD 1"].roomName = "SMALL\nCRATER";
		rooms["METAL POD 1"].removeFlag(GLOBAL.HAZARD);
		rooms["METAL POD 1"].removeFlag(GLOBAL.QUEST);
		rooms["METAL POD 1"].removeFlag(GLOBAL.OBJECTIVE);
	}
	
	
	/* TARKUS */
	
	// Chasmfall entrance
	if(flags["STELLAR_TETHER_CLOSED"] == undefined)
	{
		rooms["350"].addFlag(GLOBAL.HAZARD);
		if(MailManager.isEntryViewed("annoweirdshit")) rooms["350"].addFlag(GLOBAL.OBJECTIVE);
		else rooms["350"].removeFlag(GLOBAL.OBJECTIVE);
	}
	else
	{
		rooms["350"].removeFlag(GLOBAL.HAZARD);
		rooms["350"].removeFlag(GLOBAL.OBJECTIVE);
	}
	// Stellar Tether probe clue
	if(flags["TARKUS_BOMB_TIMER"] != undefined && flags["TARKUS_BOMB_TIMER"] <= 0 && flags["PLANET_3_UNLOCKED"] == undefined) rooms["WIDGET WAREHOUSE"].addFlag(GLOBAL.QUEST);
	else rooms["WIDGET WAREHOUSE"].removeFlag(GLOBAL.QUEST);
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
	//Sexbot factory opeeeeeen.
	if(flags["SEXBOTS_SCANNED_FOR_COLENSO"] != undefined && flags["SEXBOTS_SCANNED_FOR_COLENSO"] >= 4)
	{
		rooms["256"].southExit = "294";
	}
	else
	{
		rooms["256"].southExit = undefined;
	}
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
	//Handle badger closure
	if(flags["DR_BADGER_TURNED_IN"] != undefined && rooms["209"].northExit != "") rooms["209"].northExit = "";
	if(flags["DR_BADGER_TURNED_IN"] == undefined && rooms["209"].northExit == "") rooms["209"].northExit = "304";
	// Arbetz Open:
	if (arbetzActiveHours())
	{
		rooms["ARBETZ MAIN"].addFlag(GLOBAL.NPC);
		rooms["ARBETZ POOL"].addFlag(GLOBAL.OBJECTIVE);
	}
	// Arbetz Closed:
	else
	{
		rooms["ARBETZ MAIN"].removeFlag(GLOBAL.NPC);
		rooms["ARBETZ POOL"].removeFlag(GLOBAL.OBJECTIVE);
	}
	// Lane is away
	if (flags["LANE_DISABLED"] == undefined) rooms["LANESSHOP"].addFlag(GLOBAL.NPC);
	else rooms["LANESSHOP"].removeFlag(GLOBAL.NPC);
	
	
	/* NEW TEXAS */
	
	// Brynn's Stall
	if (flags["BRYNN_MET_TODAY"] == 1) rooms["BrynnsStall"].removeFlag(GLOBAL.NPC);
	else rooms["BrynnsStall"].addFlag(GLOBAL.NPC);
	// Quenton Gym stuffs
	if (pc.hasKeyItem("Ten Ton Gym Membership") || pc.hasStatusEffect("Gym Pass"))
	{
		rooms["571"].addFlag(GLOBAL.OBJECTIVE);
		rooms["572"].addFlag(GLOBAL.OBJECTIVE);
		rooms["573"].addFlag(GLOBAL.OBJECTIVE);
		rooms["574"].addFlag(GLOBAL.OBJECTIVE);
	}
	else
	{
		rooms["571"].removeFlag(GLOBAL.OBJECTIVE);
		rooms["572"].removeFlag(GLOBAL.OBJECTIVE);
		rooms["573"].removeFlag(GLOBAL.OBJECTIVE);
		rooms["574"].removeFlag(GLOBAL.OBJECTIVE);
	}
	
	
	/* MYRELLION */
	// Yarasta Shit
	if(flags["MET_YARASTA"] != undefined)
	{
		//In classroom? 737
		if((hours >= 6 && hours < 12) || (hours >= 13 && hours < 18) || hours == 19 || hours == 20) rooms["737"].addFlag(GLOBAL.NPC);
		else rooms["737"].removeFlag(GLOBAL.NPC);
		//In Mush park 736
		if(hours == 12 || hours == 18) rooms["736"].addFlag(GLOBAL.NPC);
		else rooms["736"].removeFlag(GLOBAL.NPC);
		//In lobby (735)
		if(hours == 21) rooms["735"].addFlag(GLOBAL.NPC);
		else rooms["735"].removeFlag(GLOBAL.NPC);
	}
	// Steph Myrellion shit
	if (flags["STEPH_WATCHED"] == undefined)
	{
		rooms["1F22"].removeFlag(GLOBAL.NPC);
	}
	else
	{
		if (flags["STEPH_WORK_CHOICE"] == undefined)
		{
			rooms["1F22"].addFlag(GLOBAL.NPC);
		}
		else
		{
			rooms["1F22"].removeFlag(GLOBAL.NPC);
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
	//Irellia quest stuff.
	//IrelliaQuest incomplete. No east passage, people token in main room.
	if(flags["IRELLIA_QUEST_STATUS"] == undefined || flags["IRELLIA_QUEST_STATUS"] < 6)
	{
		// Quest markers
		//Added by JCup
		if(flags["IRELLIA_QUEST_STATUS"] == 2 && (hours >= 17 && hours <= 18)) rooms["708"].addFlag(GLOBAL.OBJECTIVE);
		else rooms["708"].removeFlag(GLOBAL.OBJECTIVE);
		if(flags["IRELLIA_QUEST_STATUS"] == 3 && hours >= 23) rooms["725"].addFlag(GLOBAL.OBJECTIVE);
		else rooms["725"].removeFlag(GLOBAL.OBJECTIVE);

		rooms["746"].addFlag(GLOBAL.NPC);
		rooms["747"].removeFlag(GLOBAL.NPC);
		rooms["746"].eastExit = "";
	}
	//IrelliaQuest complete: establish east/west link and move people token to Irellia's chambers
	else
	{
		rooms["746"].eastExit = "747";
		rooms["746"].removeFlag(GLOBAL.NPC);
		rooms["747"].addFlag(GLOBAL.NPC);
	}
	//Nyrea gate should be open
	if(nyreaDungeonGateOpen()) 
	{
		rooms["2G11"].westExit = "2E11";
		if(nyreaDungeonFinished()) rooms["2G11"].removeFlag(GLOBAL.QUEST);
		else rooms["2G11"].addFlag(GLOBAL.QUEST);
	}
	//Nyrea gate should be closed
	else 
	{
		rooms["2G11"].westExit = "";
		if(!nyreaDungeonFinished()) rooms["2G11"].addFlag(GLOBAL.QUEST);
		else rooms["2G11"].removeFlag(GLOBAL.QUEST);
	}
	//Other nyrea gate:
	if(flags["UNLOCKED_TAIVRAS_GATE"] == undefined) rooms["2G15"].southExit = "";
	else rooms["2G15"].southExit = "2G17";
	//Queensguard shit
	if(queensguardAtFountain()) 
	{
		rooms["2C13"].addFlag(GLOBAL.NPC);
	}
	else rooms["2C13"].removeFlag(GLOBAL.NPC);
	//Fungus area open:
	if(flags["FUNGUS_QUEEN_SAVED"] == undefined && flags["LET_FUNGUS_QUEEN_DIE"] == undefined)
	{
		rooms["2S11"].northExit = "2S9";
		if(CodexManager.entryUnlocked("Myr Fungus")) rooms["2S7"].addFlag(GLOBAL.OBJECTIVE);
	}
	else 
	{
		rooms["2S7"].removeFlag(GLOBAL.OBJECTIVE);
		rooms["2S11"].northExit = "";
	}
	// Crystal Goo Silly Modes
	if(silly) rooms["2O25"].southExit = "2O27";
	else rooms["2O25"].southExit = "";
	
	// KQuest
	kquest2RoomStateUpdater();
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
	
	if (pc.hasStatusEffect("Red Myr Venom")) productionFactor *= 1.5;
	
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

	//Laneshit
	processLaneDetoxEvents(arg);
	
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
		minutes++;

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
		
		if (flags["KQ2_NUKE_STARTED"] != undefined && flags["KQ2_NUKE_EXPLODED"] == undefined)
		{
			// Still there!
			if (flags["KQ2_QUEST_FINISHED"] == undefined)
			{
				if (flags["KQ2_NUKE_STARTED"] + KQ2_NUKE_DURATION < GetGameTimestamp())
				{
					eventQueue.push(kq2NukeBadend);
				}
			}
			// Left
			else if (currentLocation == "SHIP INTERIOR")
			{
				eventQueue.push(kq2NukeExplodesLater);
				flags["KQ2_NUKE_EXPLODED"] = 1;
			}
			
			// Followup for Dane to send coordinates to the player, should the need arise
			if (flags["KQ2_MYRELLION_STATE"] == 1)
			{
				if (flags["KQ2_DANE_COORDS_TIMER"] != undefined && flags["KQ2_DANE_COORDS_TIMER"] + 2880 < GetGameTimestamp())
				{
					eventQueue.push(kq2DaneCoordEmail);
				}
			}
		}
		
		//Clippex procs!
		if(pc.hasStatusEffect("Clippex Gel"))
		{
			var clippexTF:Clippex = new Clippex();
			clippexTF.itemClippexLustIncrease();
		}
		//Semen's Friend procs!
		if(pc.hasStatusEffect("Semen's Candy"))
		{
			var semensTF:SemensFriend = new SemensFriend();
			semensTF.itemSemensFriendLibidoIncrease();
		}
		//Treatment display shit
		if(pc.hasStatusEffect("Treatment Elasticity Report Q'ed"))
		{
			//Buttes
			if(pc.statusEffectv1("Treatment Elasticity Report Q'ed") == 1) treatedVagNote(true);
			//Cooters
			else treatedVagNote(false);
		}
		// Wild varmint run away!
		varmintDisappearChance();
		//Kiro stuff
		if(flags["KIRO_BAR_MET"] != undefined)
		{
			if (minutes >= 60) 
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
		//Saendra's X-Pack Timer
		if(flags["SAENDRA_XPACK1_STATUS"] == 1 || flags["SAENDRA_XPACK1_STATUS"] == 5)
		{
			updateSaendraXPackTimer();
		}
		//Tick hours!
		if (minutes >= 60) {
			
			// Lust increase per hour
			mimbraneSweatHandler();
			
			minutes = 0;
			hours++;
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
			//Goblinola procs!
			if(pc.hasStatusEffect("Goblinola Bar"))
			{
				var gobbyTF:Goblinola = new Goblinola();
				gobbyTF.itemGoblinTF();
			}
			//Treatmentr procs
			if(pc.hasStatusEffect("The Treatment"))
			{
				treatmentHourProcs();
			}
			//Egg trainer stuff
			carryTrainingBonusBlurbCheck();
			//Cunt stretching stuff
			if(pc.hasVagina()) {
				for(x = 0; x < pc.totalVaginas(); x++) {
					//Count da stretch cooldown or reset if at minimum.
					if(pc.vaginas[x].loosenessRaw > pc.vaginas[x].minLooseness) pc.vaginas[x].shrinkCounter++;
					else pc.vaginas[x].shrinkCounter = 0;
					//Reset for this cunt.
					tightnessChanged = false;
					if(pc.vaginas[x].loosenessRaw < 2) {}
					else if(pc.vaginas[x].loosenessRaw >= 5 && pc.vaginas[x].shrinkCounter >= 60) tightnessChanged = true;
					else if(pc.vaginas[x].loosenessRaw >= 4 && pc.vaginas[x].shrinkCounter >= 96) tightnessChanged = true;
					else if(pc.vaginas[x].loosenessRaw >= 3 && pc.vaginas[x].shrinkCounter >= 132) tightnessChanged = true;
					else if(pc.vaginas[x].loosenessRaw >= 2 && pc.vaginas[x].shrinkCounter >= 168) tightnessChanged = true;
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
			else if(pc.ass.loosenessRaw >= 5 && pc.ass.shrinkCounter >= 12) tightnessChanged = true;
			else if(pc.ass.loosenessRaw >= 4 && pc.ass.shrinkCounter >= 24) tightnessChanged = true;
			else if(pc.ass.loosenessRaw >= 3 && pc.ass.shrinkCounter >= 48) tightnessChanged = true;
			else if(pc.ass.loosenessRaw >= 2 && pc.ass.shrinkCounter >= 72) tightnessChanged = true;
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
			//Goo PC updates and fixers:
			if(pc.hasStatusEffect("Goo Crotch")) gooCrotchUpdate();

			if(flags["BADGER_QUEST"] == -1)
			{
				if(flags["BADGER_QUEST_TIMER"] == undefined) flags["BADGER_QUEST_TIMER"] = GetGameTimestamp();
				if(GetGameTimestamp() >= flags["BADGER_QUEST_TIMER"] + 1440 && flags["BADGER_QUEST_TIMER"] != -1)
				{
					pennyBadgerQuestAlert();
					flags["BADGER_QUEST_TIMER"] = -1;
				}
			}

			//Days ticks here!
			if(hours >= 24) {
				hours = 0;
				days++;
				
				//Unlock dat shiiit
				if(flags["HOLIDAY_OWEEN_ACTIVATED"] == undefined && (isHalloweenish() || rand(100) == 0)) eventQueue.push(hollidayOweenAlert);
				if(pc.hasPerk("Honeypot") && days % 3 == 0) honeyPotBump();
				//Exhibitionism reduction!
				if(!(pc.armor is EmptySlot) && !(pc.lowerUndergarment is EmptySlot) && !(pc.upperUndergarment is EmptySlot))
				{
					if(pc.isChestExposed() && pc.isCrotchExposed() && pc.isAssExposed())
						{ /* No reduction for a full set of exposed clothing! */ }
					else pc.exhibitionism(-0.5);
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
				if(flags["BRIHA_OLDEST_SPAWN_AGE"] != undefined) flags["BRIHA_OLDEST_SPAWN_AGE"]++;

				// Tick up all of the attached mimbranes days since last fed
				mimbranesIncreaseDaysSinceFed();
				
				// Lane monies
				laneHandleCredits();
				//Venus pitcher
				venusSubmission( -1);
				
				tryProcSaendraXPackEmail();
				
				// Manes grow out!
				if(pc.hasPerk("Mane") && pc.hairLength <= 3) maneHairGrow();
				// Fecund Figure shape gain (Gains only while pregnant)
				if(pc.hasPerk("Fecund Figure"))
				{
					var numPreg:int = pc.totalPregnancies();
					// Wombs only--exclude anal pregnancy!
					if(pc.isPregnant(3)) numPreg--;
					// Longevity of growth based on number of current pregnant wombs.
					if(numPreg > 0) pc.addPerkValue("Fecund Figure", 4, numPreg);
					if(pc.perkv4("Fecund Figure") > 0)
					{
						// 20 days for 1 hips/butt size gain
						pc.addPerkValue("Fecund Figure", 1, 0.05); // Hips
						pc.addPerkValue("Fecund Figure", 2, 0.05); // Butt
						//pc.addPerkValue("Fecund Figure", 3, 0.0125); // Belly
						pc.addPerkValue("Fecund Figure", 4, -1); // Gains
					}
					if(pc.perkv4("Fecund Figure") < 0) pc.setPerkValue("Fecund Figure", 4, 0);
				}
				//DAILY MYR VENOM CHECKS
				//Addicts
				if(flags["VENOM_ADDICTION"] != undefined)
				{
					//Not yet uber-addict:
					if(!pc.hasPerk("Venom Slut"))
					{
						if(pc.hasStatusEffect("Myr Venom Withdrawal")) myrAddiction(-2);
					}
				}
				//Non addicts not under the effects of venom lose progress to addiction
				else if(flags["VENOM_ADDICTION"] == undefined && !pc.hasStatusEffect("Red Myr Venom"))
				{
					venomProgress(-2);
				}
			}
		}
		arg--;
	}
	//Check to see if something changed in body part notices
	milkMultiplierGainNotificationCheck();
	nutSwellUpdates();
	immobilizedUpdate();

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
	if (!MailManager.isEntryUnlocked("bjreminder") && flags["NEVRIE_FIRST_DISCOUNT_DATE"] != undefined && days >= flags["NEVRIE_FIRST_DISCOUNT_DATE"] + 20) nevriBJMailGet();
	//Emmy Mail
	if (!MailManager.isEntryUnlocked("emmy_apology") && flags["EMMY_EMAIL_TIMER"] <= (GetGameTimestamp() - (24 * 60))) emmyMailGet();
	//Emmy mail stage 2 START
	if (!MailManager.isEntryUnlocked("emmy_gift_starter") && flags["EMMY_ORAL_TIMER"] <= (GetGameTimestamp() - (72 * 60))) emmyMailGet2();
	//Saendra Mail
	if (!MailManager.isEntryUnlocked("saendrathanks") && flags["FALL OF THE PHOENIX STATUS"] >= 1 && flags["SAENDRA_DISABLED"] != 1 && rooms[currentLocation].planet != "SHIP: PHOENIX" && currentLocation != "SHIP INTERIOR") saendraPhoenixMailGet();
	//Anno Mail
	if (!MailManager.isEntryUnlocked("annoweirdshit") && flags["MET_ANNO"] != undefined && flags["ANNO_MISSION_OFFER"] != 2 && flags["FOUGHT_TAM"] == undefined && flags["RUST_STEP"] != undefined && rand(20) == 0) goMailGet("annoweirdshit");
	//Other Email Checks!
	if (rand(100) == 0) emailRoulette();
	flags["HYPNO_EFFECT_OUTPUT_DONE"] = undefined;
	variableRoomUpdateCheck();
	updatePCStats();
}

public function racialPerkUpdateCheck():void
{
	if(pc.hasPerk("'Nuki Nuts") && pc.perkv2("'Nuki Nuts") != 1)
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
	if(pc.hasPerk("Fecund Figure"))
	{
		if(!pc.hasVagina())
		{
			eventBuffer += "\n\nNo longer possessing a vagina, your body tingles";
			if((pc.perkv1("Fecund Figure") + pc.perkv2("Fecund Figure") + pc.perkv3("Fecund Figure")) > 0) eventBuffer += ", rapidly changing as you lose your fertility goddess-like build";
			eventBuffer += ".";
			eventBuffer += "\n\n(<b>Perk Lost: Fecund Figure</b>)";
			pc.removePerk("Fecund Figure");
		}
	}
}

public function badEnd(displayGG:String = "GAME OVER"):void 
{
	gameOverEvent = true;
	
	// Todo -- Hook alternate game ends in here, and also maybe look into some kind of categorisation system.
	
	if (displayGG != "") output("\n\n<b>" + displayGG + "</b>");
	output("\n\n(Access the main menu to start a new character or the data menu to load a saved game. The buttons are located in the lower left of the game screen.)");
	clearMenu();
}

public function fixPcUpbringing():void
{
	clearOutput();
	showName("CODEX\nALERT");
	author("Gedan");
	
	output("Your trusty codex vibrates incessantly, demanding your attention for something. The means are unusual, which piques your interest; you’ve been wearing the thing for long enough now to have most of its features down pat, and whatever it’s doing right now is most certainly out of the ordinary.");
	
	output("\n\nSafely shuffled off to one side, hopefully out of the way - and out of sight - of any one or any thing that might come by, you bring your handy forearm-mounted helper to the fore to see exactly what it’s complaining about....");
	
	output("\n\n<i>DATA CORRUPTION DETECTED</i>");
	
	output("\n\nWell, shit.");
	
	output("\n\n<i>FIX NOW?</i>");
	
	output("\n\n<i>“Fucking computers,”</i> you mutter under your breath, a [pc.finger] already tapping on the key labeled ‘Okay’. The thing chugs away for a second or two, seemingly hard at work repairing itself... you’re about set to move on rather than wind up waiting all day for the Codex to");
	if (!silly) output(" fix itself");
	else output(" do the needful");
	output(" before it’s vibrating away, demanding its masters dutiful attention again.");
	
	output("\n\n<i>UNRECOVERABLE DATA FRAGMENT LOCATED IN FILE: [pc.fullName]</i>");
	output("\n<i>MISSING SEGMENT: SCHOOL HISTORY</i>");
	output("\n<i>PLEASE RE-ENTER VALID DATA...</i>");
	
	output("\n\nThere doesn’t seem to be any way around the prompt other than to give the fucking thing an acceptable answer to devices question...");
	
	clearMenu();
	addButton(0,"Pampered",fixPcUpbringingSetNew,GLOBAL.UPBRINGING_PAMPERED);
	addButton(1,"Athletic",fixPcUpbringingSetNew,GLOBAL.UPBRINGING_ATHLETIC);
	addButton(2,"Bookworm",fixPcUpbringingSetNew,GLOBAL.UPBRINGING_BOOKWORM);
	addButton(3,"Austere",fixPcUpbringingSetNew,GLOBAL.UPBRINGING_AUSTERE);
	addButton(4,"Balanced",fixPcUpbringingSetNew,GLOBAL.UPBRINGING_BALANCED);
}

public function fixPcUpbringingSetNew(upType:uint):void
{
	clearOutput();
	showName("CODEX\nALERT");
	author("Gedan");
	
	flags["PC_UPBRINGING"] = upType;
	
	output("<i>INPUT REGISTERED: " + (GLOBAL.UPBRINGING_NAMES[upType] as String).toUpperCase() + "</i>");
	output("\n<i>THANK YOU FOR YOUR COMPLIANCE.</i>");
	
	output("\n\nLooks like that was all the cheeky little bastard wanted from you. Another ‘Okay’ key tap and you’re back on your travels.");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Checkin' da E-mails
public function goMailGet(mailKey:String = "", timeStamp:int = -1):void
{
	var mailFrom:String = "<i>Unknown Sender</i>";
	var mailFromAdress:String = "<i>Unknown Address</i>";
	if(timeStamp < 0) timeStamp = GetGameTimestamp();
	if(mailKey != "" && MailManager.hasEntry(mailKey))
	{
		var mailEmail:Object = MailManager.getEntry(mailKey);
		if(mailEmail.FromCache != null) mailFrom = mailEmail.FromCache;
		if(mailEmail.From != null) mailFrom = mailEmail.From();
		if(mailEmail.FromAddressCache != null) mailFromAdress = mailEmail.FromAddressCache;
		if(mailEmail.FromAddress != null) mailFromAdress = mailEmail.FromAddress();
		eventBuffer += "\n\n<b>New Email from " + mailFrom + " ("+ mailFromAdress +")!</b>";
		MailManager.unlockEntry(mailKey, timeStamp);
	}
}
// Random Emails!
public function emailRoulette():void
{
	var mailList:Array = [];
	var mailKey:String = "";
	var mailSubject:String = "\\\[No Subject\\\]";
	var mailContent:String = "<i>This message turns up empty...</i>";
	
	// Character/Event specific:
	if(!MailManager.isEntryUnlocked("burtsmeadhall") && pc.level >= 1)
		mailList.push("burtsmeadhall");
	if(!MailManager.isEntryUnlocked("kihaai") && flags["UNLOCKED_JUNKYARD_PLANET"] != undefined)
		mailList.push("kihaai");
	if(!MailManager.isEntryUnlocked("syrividja") && flags["SPAM_MSG_COV8"] != undefined && syriIsAFuckbuddy() && (flags["TIMES_WON_AGAINST_SYRI"] != undefined || flags["TIMES_LOST_TO_SYRI"] != undefined))
		mailList.push("syrividja");
	if(!MailManager.isEntryUnlocked("fuckinggoosloots") && celiseIsCrew() && pc.level >= 2)
		mailList.push("fuckinggoosloots");
	if(!MailManager.isEntryUnlocked("fuckinggooslootsII") && MailManager.isEntryUnlocked("fuckinggoosloots") && celiseIsCrew() && pc.level >= 5)
		mailList.push("fuckinggooslootsII");
	if(!MailManager.isEntryUnlocked("kirofucknet") && flags["RESCUE KIRO FROM BLUEBALLS"] == 1 && kiroTrust() >= 50)
		mailList.push("kirofucknet");
	if(!MailManager.isEntryUnlocked("cuzfuckball") && flags["TIMES_MET_FEMZIL"] != undefined && flags["BEEN_ON_TARKUS"] != undefined && pc.level >= 2)
		mailList.push("cuzfuckball");
	
	// SPAM: (9999: If does not have spamblocker upgrade toggled on for CODEX.)
	if(SpamEmailKeys.length > 0 && flags["CODEX_SPAM_BLOCKER"] == undefined)
	{
		for(var i:int = 0; i < SpamEmailKeys.length; i++) 
		{
			if(	!InCollection(SpamEmailKeys[i], ["burtsmeadhall", "kihaai", "fuckinggoosloots", "fuckinggooslootsII", "kirofucknet"])
			&&	!MailManager.isEntryUnlocked(SpamEmailKeys[i])
			&&	rand(2) == 0
			)
				mailList.push(SpamEmailKeys[i]);
		}
	}
	
	if(mailList.length > 0) mailKey = mailList[rand(mailList.length)];
	
	if(mailKey != "" && MailManager.hasEntry(mailKey))
	{
		goMailGet(mailKey);
		
		// Any special actions/unlocks
		var mailEmail:Object = MailManager.getEntry(mailKey);
		if(mailEmail.SubjectCache != null) mailSubject = mailEmail.SubjectCache;
		if(mailEmail.Subject != null) mailSubject = mailEmail.Subject();
		if(mailEmail.ContentCache != null) mailContent = mailEmail.ContentCache;
		if(mailEmail.Content != null) mailContent = mailEmail.Content();
		
		// Regular:
		if(mailKey == "kirofucknet" && (pc.isBimbo() || pc.isBro() || !pc.hasStatusEffect("Focus Pill") || pc.IQ() < 50 || pc.WQ() < 50))
		{
			eventBuffer += " The subject line reads <i>“" + mailSubject + "”</i>. Curiously, you open the letter to see what it could be...";
			eventBuffer += "\n\nThe message is headed by a big holo-image of Kiro with her massive equine dong shoved to the hilt up some girl’s backside, stretching her sphincter like a rubber band. Kiro’s holding the camera and giving you a big, goofy grin and a thumb’s-up.\n\n<i>Kiro Tamahime wants you to join the GalLink group “GalLink Fuckmeet.”\n\nGalLink Fuckmeet: Bone random citizens of the galaxy with no hassle, no commitment, just fun!\n\nSuggested Members: Kiro Tamahime, Saendra en Illya, BigBooty Flahne, Sera Succubus, GirlBoy Alex</i>";
			eventBuffer += "\n\nYou shrug and click “Join”...\n\nAnd are instantly flooded with several THOUSAND pictures of the group’s members (mostly Kiro) engaged in lewd acts.\n\nWell, at least you won’t need to look for new porn for a while.";
			pc.lust(20);
		}
		// Spam:
		if(mailKey == "cov8" && flags["SPAM_MSG_COV8"] == undefined)
			flags["SPAM_MSG_COV8"] = 1;
		if(mailKey == "fatloss" && pc.isBimbo())
		{
			eventBuffer += " The subject line reads <i>“" + mailSubject + "”</i>. Ooo, secrets and stuff! You eagerly open the message and the codex lights up with the display:";
			eventBuffer += "\n\n<i>" + mailContent + "</i>";
			eventBuffer += "\n\nMmm, that sounds yummy!";
			pc.lust(20);
		}
		if(mailKey == "estrobloom" && !pc.hasKeyItem("Coupon - Estrobloom"))
		{
			eventBuffer += "\n\n<b>You have gained a coupon for Estrobloom!</b>";
			pc.createKeyItem("Coupon - Estrobloom", 0.9, 0, 0, 0, "Save 10% on your next purchase of Estrobloom!");
		}
		if(mailKey == "hugedicktoday" && pc.isBro() && pc.hasCock())
		{
			eventBuffer += " The subject line reads <i>“" + mailSubject + "”</i>. Hell yeah--who wouldn’t want a bigger dick? You quicky open the message to read its contents and the codex lights up with the display:";
			eventBuffer += "\n\n<i>" + mailContent + "</i>";
			eventBuffer += "\n\nYou’re not quite sure you understood all that, but your dick did.";
			pc.lust(20);
		}
	}
}
