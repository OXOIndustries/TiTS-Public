import classes.BreastRowClass;
import classes.Characters.PlayerCharacter;
import classes.Creature;
import classes.GameData.EventContainer;
import classes.GameData.PerkData;
import classes.GameData.Pregnancy.Handlers.RenvraEggPregnancy;
import classes.GameData.Pregnancy.Handlers.NyreaHuntressPregnancy;
import classes.GameData.Pregnancy.PregnancyManager;
import classes.GUI;
import classes.Items.Accessories.LeithaCharm;
import classes.Items.Armor.Unique.Omnisuit;
import classes.Items.Armor.AugmentWeaveArmor;
import classes.Items.Miscellaneous.EmptySlot;
import classes.Items.Miscellaneous.HorsePill;
import classes.Items.Transformatives.Cerespirin;
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

public function processEventBuffer():Boolean
{
	if (timestampedEventBuffer.length > 0)
	{
		clearOutput();
		clearBust();
		
		output("<b>" + possessive(pc.short) + " log:</b>");
		
		timestampedEventBuffer.sortOn("timestamp", Array.NUMERIC);
		
		for (var i:int = 0; i < timestampedEventBuffer.length; i++)
		{
			var tEvent:EventContainer = timestampedEventBuffer[i];
			
			var d:int = 0;
			var h:int = 0;
			var m:int = tEvent.timestamp;
			if (m >= 60)
			{
				h += m / 60;
				m = m % 60;
			}
			if (h >= 24)
			{
				d += h / 24;
				h = h % 24;
			}
			
			output("\n\n\\\[<span class='" + tEvent.style + "'><b>D: " + d + " T: " + (h < 10 ? ("0" + h) : h) + ":" + (m < 10 ? ("0" + m) : m) + "</b></span>\\\] " + tEvent.msg);
		}
		
		timestampedEventBuffer = [];
		
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

public function setNavDisabled(addUmask:uint):void
{
	if (flags["NAV_DISABLED"] == undefined) flags["NAV_DISABLED"] = addUmask;
	flags["NAV_DISABLED"] |= addUmask;
}

public function showLocationName():void
{
	if(InShipInterior()) setLocation("SHIP\nINTERIOR", rooms[shipLocation].planet, rooms[shipLocation].system);
	else setLocation(rooms[currentLocation].roomName, rooms[currentLocation].planet, rooms[currentLocation].system);
}

public function disableExploreEvents():Boolean
{
	// Stellar Tether Duration
	if (flags["FOUGHT_TAM"] != undefined && flags["STELLAR_TETHER_CLOSED"] == undefined) return true;
	// Stellar Tether (Bomb Timer)
	if (flags["TARKUS_BOMB_TIMER"] != undefined && flags["TARKUS_BOMB_TIMER"] > 0) return true;
	// Deck 13 Duration
	if (flags["ANNO_MISSION_OFFER"] > 1 && flags["DECK13_COMPLETE"] == undefined) return true;
	// KaraQuest2 Duration
	if (flags["KQ2_QUEST_BEGIN"] == 1 && flags["KQ2_QUEST_FINISHED"] == undefined) return true;
	// Pirate Base (Bomb Timer)
	if (flags["KQ2_NUKE_STARTED"] >= 0 && flags["KQ2_NUKE_EXPLODED"] == undefined) return true;
	// Kashima Duration
	if (flags["KASHIMA_STATE"] > 0 && flags["KASHIMA_STATE"] < 2) return true;
	// Federation Quest
	if (flags["FEDERATION_QUEST"] > 0 && flags["FEDERATION_QUEST_AMBUSH"] != undefined && flags["FEDERATION_QUEST"] < 3) return true;
	// Syri Quest
	if (flags["SYRIQUEST_STATE"] >= 4 && flags["SYRIQUEST_STATE"] < 20) return true;

	return false;
}

public function mainGameMenu(minutesMoved:Number = 0):void
{
	for (var prop:String in chars)
	{
		chars[prop].sortPerks();
		chars[prop].sortStatusEffects();
		chars[prop].sortKeyItems();
	}
	
	// Bad ends prevent triggering events and renewing menu.
	if(gameOverEvent)
	{
		clearOutput();
		output("<b>GAME OVER</b>");
		output("\n\n(Access the main menu to start a new character or the data menu to load a saved game. The buttons are located in the lower left of the game screen.)");
		clearMenu();
		return;
	}
	//Bad end for negative hp.
	if(pc.HPMax() < 1)
	{
		if(eventQueue.indexOf(deathByNoHP) == -1) eventQueue.push(deathByNoHP);
	}
	
	flags["COMBAT MENU SEEN"] = undefined;
	
	// Original stat hotfixes.
	if (flags["PC_UPBRINGING"] == undefined)
	{
		if(eventQueue.indexOf(fixPcUpbringing) == -1) eventQueue.push(fixPcUpbringing);
	}
	if(baby.originalRace == "NOT SET")
	{
		if(eventQueue.indexOf(setBabyValuesOptions) == -1) eventQueue.push(setBabyValuesOptions);
	}
	
	if (flags["CELISE_BEDSTUFF_HAPPENED"] != undefined)
	{
		flags["CELISE_BEDSTUFF_HAPPENED"] = undefined;
	}
	
	variableRoomUpdateCheck();
	generateMap();
	showLocationName();
	
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
				if ((pc.accessory is LeithaCharm) && (pc.accessory as LeithaCharm).attemptTF(pc)) return;
			}
		}
	}
    
	// Check cocksocks
	if (invalidCocksocksWorn(true)) return;
	
	// Update the state of the players mails -- we don't want to do this all the time (ie in process time), and we're only going to care about it at the menu root soooooo...
	updateMailStatus();
	
	// Update children cache
	ChildManager.updateTime(-1);
	
	//Set up all appropriate flags
	//Display the room description
	clearOutput();
	if(debug) output("<b>\\\[ <span class='lust'>DEBUG MODE IS ON</span> \\\]</b>\n\n");
	output(rooms[currentLocation].description);
	
	// Time passing effects
	if(passiveTimeEffects(minutesMoved)) return;
	
	// Random events, outside of important/timed missions
	if (!disableExploreEvents())
	{
		if (tryEncounterFreedomBeef()) return;
	}
	
	if(inCombat())
		output("\n\n<b>You’re still in combat, you ninny!</b>");
	if(pc.hasStatusEffect("Temporary Nudity Cheat"))
		output("\n\n<b>BUG REPORT: TEMP NUDITY STUCK ON.</b>");
	
	clearMenu(false);
	clearBust();
	inSceneBlockSaving = false;
	updatePCStats();
	//Inventory shit
	itemScreen = mainGameMenu;
	lootScreen = inventory;
	
	// Dynamic room functions on enter
	if(rooms[currentLocation].runOnEnter != undefined)
	{
		if(rooms[currentLocation].runOnEnter()) return;
		//If in a hazard area
		if(rooms[currentLocation].hasFlag(GLOBAL.HAZARD) && !disableExploreEvents())
		{
			if(pattonIsHere()) pattonAppearance();
		}
	}
	
	//Standard buttons:
	addButton(13, "Inventory", inventory);
	//Other standard buttons
	// Arousal Masturbation
	if(hasButton(8)) {} // Button overrides!
	else if(pc.lust() < 33)
	{
		if(canArouseSelf()) addButton(8, "Arousal", arousalMenu);
		else addDisabledButton(8, "Masturbate");
	}
	else
	{
		masturbateButton(8);
	}
	// Sleep/Rest
	if(hasButton(9)) {} // Button overrides!
	else if(!rooms[currentLocation].hasFlag(GLOBAL.BED))
	{
		if(canRest()) addButton(9, "Rest", restMenu);
		else addDisabledButton(9, "Rest", "Rest", "You can’t seem to rest or wait here at the moment....");
	}
	else
	{
		if(canRest() || canSleep()) addButton(9, "Sleep", sleepMenu);
		else addDisabledButton(9, "Sleep", "Sleep", "You can’t seem to sleep here at the moment....");
	}
	addButton(14, "Codex", showCodex);
	
	//Display movement shits - after clear menu for extra options!
	//Turn off encounters since you're already here. Moving clears this.
	flags["ENCOUNTERS_DISABLED"] = 1;

	if(pc.hasStatusEffect("Endowment Immobilized"))
	{
		if (rooms[currentLocation].northExit && !isNavDisabled(NAV_NORTH_DISABLE))
		{
			addDisabledButton(6, "North", "North", "You can’t move - you’re immobilized!");
		}
		if (rooms[currentLocation].eastExit && !isNavDisabled(NAV_EAST_DISABLE)) 
		{
			addDisabledButton(12, "East", "East", "You can’t move - you’re immobilized!");
		}
		if (rooms[currentLocation].southExit && !isNavDisabled(NAV_SOUTH_DISABLE)) 
		{
			addDisabledButton(11,"South","South","You can’t move - you’re immobilized!");
		}
		if (rooms[currentLocation].westExit && !isNavDisabled(NAV_WEST_DISABLE)) 
		{
			addDisabledButton(10,"West","West","You can’t move - you’re immobilized!");
		}
		if (rooms[currentLocation].inExit && !isNavDisabled(NAV_IN_DISABLE))
		{
			addDisabledButton(5, rooms[currentLocation].inText, rooms[currentLocation].inText, "You can’t move - you’re immobilized!");
		}
		if (rooms[currentLocation].outExit && !isNavDisabled(NAV_OUT_DISABLE)) 
		{
			addDisabledButton(7,rooms[currentLocation].outText,rooms[currentLocation].outText,"You can’t move - you’re immobilized!");
		}
	}
	else
	{
		if (rooms[currentLocation].northExit)
		{
			if(!isNavDisabled(NAV_NORTH_DISABLE)) addButton(6, "North", move, rooms[currentLocation].northExit);
			else addDisabledButton(6, "North", "North", "You are unable to go in this direction.");
		}
		if (rooms[currentLocation].eastExit)
		{
			if(!isNavDisabled(NAV_EAST_DISABLE)) addButton(12, "East", move, rooms[currentLocation].eastExit);
			else addDisabledButton(12, "East", "East", "You are unable to go in this direction.");
		}
		if (rooms[currentLocation].southExit)
		{
			if(!isNavDisabled(NAV_SOUTH_DISABLE)) addButton(11,"South", move, rooms[currentLocation].southExit);
			else addDisabledButton(11, "South", "South", "You are unable to go in this direction.");
		}
		if (rooms[currentLocation].westExit)
		{
			if(!isNavDisabled(NAV_WEST_DISABLE)) addButton(10, "West", move, rooms[currentLocation].westExit);
			else addDisabledButton(10, "West", "West", "You are unable to go in this direction.");
		}
		if (rooms[currentLocation].inExit) 
		{
			if(!isNavDisabled(NAV_IN_DISABLE)) addButton(5, rooms[currentLocation].inText, move, rooms[currentLocation].inExit);
			else addDisabledButton(5, rooms[currentLocation].inText, rooms[currentLocation].inText, "You are unable to go in this direction.");
		}
		if (rooms[currentLocation].outExit)
		{
			if(!isNavDisabled(NAV_OUT_DISABLE)) addButton(7, rooms[currentLocation].outText, move, rooms[currentLocation].outExit);
			else addDisabledButton(7, rooms[currentLocation].outText, rooms[currentLocation].outText, "You are unable to go in this direction.");
		}
	}
	
	if (currentLocation == "SHIP INTERIOR")
	{
		if(!isNavDisabled(NAV_OUT_DISABLE)) addButton(7, "Exit Ship", move, rooms[currentLocation].outExit);
		else addDisabledButton(7, "Exit Ship", rooms[currentLocation].outText, "You can’t exit your ship here!");
	}
	if (currentLocation == shipLocation)
	{
		if (!isNavDisabled(NAV_IN_DISABLE)) addButton(5, "Enter Ship", move, "SHIP INTERIOR");
		else addDisabledButton(5, "Enter Ship", rooms[currentLocation].inText, "You can’t enter your ship here!");
	}
	if (rooms[currentLocation].hasFlag(GLOBAL.SHIPHANGAR))
	{
		shipHangarButton(7);
	}
	
	// Dynamic room functions after enter
	if (rooms[currentLocation].runAfterEnter != null) rooms[currentLocation].runAfterEnter();
	
	flags["NAV_DISABLED"] = undefined; // Clear disabled directions.
	
	//if (kGAMECLASS.debug) this.addButton(13, "RESET NPCs", initializeNPCs);
	
	// Append any extra messages:
	priapismBlurbs();
	
	// Show the minimap too!
	userInterface.showMinimap();
	userInterface.perkDisplayButton.Activate();
}

public function shipHangarButton(btnSlot:int = 7):void
{
	var ships:Array = shipHangarShips(currentLocation);
	if(ships.length > 0) 
	{
		//Mhenga uses button "7" for going down. Thus an exception!
		if(shipLocation == "SHIP HANGAR") btnSlot = 0;
		
		addButton(btnSlot, "Hangar", shipHangarMenu, ships, "Hangar Dock", "Explore other ships that are docked here.");
	}
}
// Trafficked by spacers
public function publicHangars(dock:String = ""):Array
{
	var publicHangars:Array = [];
	
	publicHangars.push("TAVROS HANGAR"); // Tavros Station
	publicHangars.push("SHIP HANGAR"); // Mhen'ga
	publicHangars.push("201"); // Tarkus
	publicHangars.push("500"); // New Texas
	publicHangars.push("600"); // Myrellion
	publicHangars.push("UVS F15"); // Uveto
	publicHangars.push("CANADA1"); // Canadia Station
	
	return publicHangars;
}
// Need exclusive access
public function privateHangars(dock:String = ""):Array
{
	var privateHangars:Array = [];
	
	privateHangars.push("2I7"); // Myrellion (Caves)
	privateHangars.push("ZS L50"); // Zheng Shi Station
	privateHangars.push("POESPACE"); // Poe A
	privateHangars.push("K16_DOCK"); // Gastigoth
	privateHangars.push("BREEDWELL_HANGAR"); // Breedwell Centre
	
	return privateHangars;
}
public function shipHangarShips(dock:String = ""):Array
{
	var ships:Array = [];
	var publicHangars:Array = publicHangars();
	var privateHangars:Array = privateHangars();
	
	// ships.push(["Ship Name", null]);
	// functionBonusName or null for no bonus function
	if(dock == "TAVROS HANGAR")
	{
		if(flags["FALL OF THE PHOENIX STATUS"] == 1) ships.push(["The Phoenix", thePhoenixShipBonus]);
	}
	if(InCollection(dock, publicHangars))
	{
		if(flags["SHIZZY_MET"] != undefined && majinHere()) ships.push(["Great Majin", shizzyGreatMajinBonus]);
	}
	
	return ships;
}
public function shipHangarMenu(ships:Array):void
{
	clearOutput();
	showBust("");
	showName("DOCKED\nSHIPS");
	output("You find yourself in the hangar.");
	clearMenu();
	
	var btnSlot:int = 0;
	var i:int = 0;
	
	for(i = 0; i < ships.length; i++)
	{
		if(btnSlot > 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", mainGameMenu);
			btnSlot++;
		}
		
		if(ships[i].length > 1 && ships[i][1] != undefined && ships[i][1] != null)
		{
			ships[i][1](btnSlot);
			btnSlot++;
		}
	}
	if(btnSlot > 14)
	{
		while((btnSlot < 59) && ((btnSlot + 1) % 15 != 0)) { btnSlot++; }
		addButton(btnSlot, "Back", mainGameMenu);
	}
	addButton(14, "Back", mainGameMenu);
}

public function generateMap():void
{
	generateMapForLocation(currentLocation);
}
public function generateMapForLocation(location:String):void
{
	userInterface.setMapData(mapper.generateMap(location));
}
public function generateLocationName(location:String):void
{
	setLocation(rooms[location].roomName, rooms[location].planet, rooms[location].system);
}
public function generateLocation(location:String):void
{
	generateMapForLocation(location);
	generateLocationName(location);
}

public function backToPrimaryOutput(clearB:Boolean = false):void
{
	if(clearB) clearBust();
	userInterface.backToPrimaryOutput();
}
public function clearBust(forceNone:Boolean = false):void
{
	if(forceNone || !inCombat()) showBust("none");
}
public function addBust(arg:String):void
{
	var b:Array = GetCurrentBusts();
	b.push(arg);
	showBust(b);
}
public function addTopBust(arg:String):void
{
	var b:Array = GetCurrentBusts();
	b.unshift(arg);
	showBust(b);
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
	addGhostButton(1, "Log", displayQuestLog, flags["TOGGLE_MENU_LOG"]);
	addGhostButton(2, "Extra", showCodexExtra, undefined, "Extra Functions", "Use your codex add-on functions.");
	addGhostButton(3, "Options", displayCodexOptions, undefined, "Codex Options", "Adjust the settings to your codex display.");
	addGhostButton(4, "Back", backToPrimaryOutput);
}
public function showCodexExtra():void
{
	clearOutput2();
	clearGhostMenu();
	
	output2(header("<u>Codex Functions</u>", false));
	
	output2("\nUse your codex add-on functions.");
	output2("\n");
	
	output2("\n<b><u>Add-Ons</u></b>");
	
	var btnSlot:int = 0;
	var addOns:Array = [];
	var i:int = 0;
	
	// Add-ons
	if(flags["EMMY_QUEST"] >= 6)
	{
		output2("\n<b>* Remote Cumtrol:</b> Control interface for Emmy’s herm harness sex toy.");
		if(!canSaveAtCurrentLocation) addOns.push(["EmmyRemote", null, undefined, "Remote Cumtrol", "You cannot use this at this time."]);
		else if(flags["KQ2_MYRELLION_STATE"] == 1) addOns.push(["EmmyRemote", null, undefined, "Remote Cumtrol", "Who knows if Emmy is even alive with what happened to Myrellion. Maybe after you finish with this probe nonsense, you can use your Dad’s resources to track down her whereabouts - assuming she made it out in one piece."]);
		else addOns.push(["EmmyRemote", pushEmmysButtonsMenu, undefined, "Remote Cumtrol", "Control Emmy’s sex toy."]);
	}
	
	if(addOns.length <= 0) output2("\n* <i>There are no controllable add-ons installed at the moment.</i>");
	output2("\n\n");
	
	for(i = 0; i < addOns.length; i++)
	{
		if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addGhostButton(btnSlot, "Back", showCodex);
			btnSlot++;
		}
		
		if(addOns[i][1] == null) addDisabledGhostButton(btnSlot, addOns[i][0], addOns[i][3], addOns[i][4]);
		else addGhostButton(btnSlot, addOns[i][0], addOns[i][1], addOns[i][2], addOns[i][3], addOns[i][4]);
		btnSlot++;
		
		if(addOns.length > 14 && (i + 1) == addOns.length)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addGhostButton(btnSlot, "Back", showCodex);
		}
	}
	addGhostButton(14, "Back", showCodex);
}

// Temp display stuff for perks
public function showPerkListHandler(e:Event = null):void
{
	if (pc.short.length == 0) return;
	
	var pButton:SquareButton = (userInterface as GUI).perkDisplayButton;
	
	if (pButton.isActive && !pButton.isHighlighted)
	{
		showPerksList();
		userInterface.DeGlowButtons();
		pButton.Highlight();
	}
	else if (pButton.isActive && pButton.isHighlighted)
	{
		backToPrimaryOutput();
	}
}

public function showMailsHandler(e:Event = null):void
{
	if (pc.short.length == 0) return;
	
	var pButton:SquareButton = (userInterface as GUI).mailsDisplayButton;
	
	if (!pc || pc.hasStatusEffect("In Creation"))
	{
		userInterface.mailsDisplayButton.Deactivate();
		return;
	}
	
	if (flags["KASHIMA_STATE"] == 1)
	{
		if (!userInterface.isSecondaryOutputActive())
		{
			userInterface.showSecondaryOutput();
			clearOutput2();
			output2("You try and access your Codex’s communications functions, but the app refuses to go beyond the login screen. Something’s messed up with it’s quantum comms. device... or it’s getting some serious interference. You’ll not be able to use the function until you get back to your ship and tinker with it.");
			return;
		}
		else
		{
			backToPrimaryOutput();
			return;
		}
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
		backToPrimaryOutput();
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
	m.htmlText += "\n\nReceived messages are displayed to the right of the CODEX™ display, with as-yet unread messages sorted to the top and displayed in <b>bold</b>.\n\nThe CODEX™ root menu will alert you to new messages via an un-obtrusive notification - the access icon for the system will display as a green icon when unread messages are detected.";
	m.htmlText += "</p></span>";
	
	clearGhostMenu();
	addGhostButton(4, "Back", showMailsHandler);
}

import classes.GameData.MailManager;
import classes.GUI;
import classes.UIComponents.UIStyleSettings;

public function updateMailStatus():void
{
	if (flags["KASHIMA_STATE"] == 1)
	{
		userInterface.mailsDisplayButton.Activate();
		userInterface.mailsDisplayButton.iconColour = UIStyleSettings.gStatusBadColour;
		return;
	}
	
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

public function showPerksList(filter:String = ""):void
{
	clearOutput2();
	showPCBust();
	setLocation("\nPERKS", "CODEX", "DATABASE");
	author("");
	
	var desc:Boolean = (flags["PERKS_DESC_OFF"] ? false : true);
	var hasDesc:Boolean = false;
	var perkList:Array = (pc as PlayerCharacter).perks;
	
	if (perkList.length == 0) output2("<i>No available character perks have been acquired.</i>");
	
	for (var i:int = 0; i < perkList.length; i++)
	{
		var perk:StorageClass = perkList[i] as StorageClass;
		var perkDesc:String = _perkDB.getDescriptionForPerk(perk.storageName);
		
		if (perkDesc.length == 0) perkDesc = perk.tooltip;
		
		if (perk.combatOnly == false)
		{
			output2("<b>" + ParseQuotes(perk.storageName) + "</b>" + ((desc && perkDesc.length > 0) ? (" - " + perkDesc) : ""));
			if(perkDesc.length > 0) hasDesc = true;
			output2("\n");
		}
	}
	output2("\n");
	
	clearGhostMenu();
	if(hasDesc) addGhostButton(13, ("Desc: " + (desc ? "On" : "Off")), perksDisplayToggleDesc, filter, "Descriptions", ("Toggle descriptions " + (desc ? "off" : "on") + "."));
	addGhostButton(14, "Back", showPerkListHandler);
}
public function perksDisplayToggleDesc(filter:String = ""):void
{
	flags["PERKS_DESC_OFF"] = (flags["PERKS_DESC_OFF"] ? undefined : true);
	showPerksList(filter);
}

public const CREW_CELISE:int = 0;
public const CREW_REAHA:int = 1;
public const CREW_ANNO:int = 2;
public const CREW_SERA:int = 3;
public const CREW_BESS:int = 4;
public const CREW_YAMMI:int = 5;
public const CREW_GOO_ARMOR_IS_CREW:int = 6;
public const CREW_PEXIGA:int = 7;
public const CREW_PIPPA:int = 8;
public const CREW_GOO_ARMOR_NOT:int = 9;
public const CREW_VARMINT:int = 10;
public const CREW_SIEGEWFULFE:int = 11;
public const CREW_AZRA:int = 12;
public const CREW_PAIGE:int = 13;
public const CREW_KASE:int = 14;
public const CREW_SHEKKA:int = 15;
public const CREW_SYRI:int = 16;
public const CREW_RAMIS:int = 17;

public function crewRecruited(allcrew:Boolean = false):Array
{
	var crewMembers:Array = new Array();
	
	// Actual crew members
	if (annoRecruited()) crewMembers.push(CREW_ANNO);
	if (syriRecruited()) crewMembers.push(CREW_SYRI);
	if (azraIsCrew()) crewMembers.push(CREW_AZRA);
	if (bessIsFollower()) crewMembers.push(CREW_BESS);
	if (flags["RECRUITED_CELISE"] > 0) crewMembers.push(CREW_CELISE);
	if (pippaOnShip()) crewMembers.push(CREW_PIPPA);
	if (reahaRecruited()) crewMembers.push(CREW_REAHA);
	if (seraRecruited()) crewMembers.push(CREW_SERA);
	if (yammiIsCrew()) crewMembers.push(CREW_YAMMI);
	if (gooArmorIsCrew()) crewMembers.push(CREW_GOO_ARMOR_IS_CREW);
	if (pexigaIsCrew()) crewMembers.push(CREW_PEXIGA);
	if (paigeIsCrew()) crewMembers.push(CREW_PAIGE);
	if (kaseIsCrew()) crewMembers.push(CREW_KASE);
	if (shekkaIsCrew()) crewMembers.push(CREW_SHEKKA);
	if (ramisRecruited()) crewMembers.push(CREW_RAMIS);

	// Pets or other non-speaking crew members
	if (allcrew)
	{
		if (hasGooArmor() && !gooArmorIsCrew()) crewMembers.push(CREW_GOO_ARMOR_NOT);
		if (siegwulfeIsCrew()) crewMembers.push(CREW_SIEGEWFULFE);
		if (varmintIsTame()) crewMembers.push(CREW_VARMINT);
	}
	
	return crewMembers;
}

public function multiCrewInteractions():Array
{
	var crewMembers:Array = crewRecruited();
	var crewMessages:String = "";
	
	if (InCollection(CREW_REAHA, crewMembers) && !reahaAddicted())
	{
		if (rand(8) == 0 && InCollection(CREW_BESS, crewMembers))
		{
			crewMembers.splice(crewMembers.indexOf(CREW_REAHA), 1);
			crewMembers.splice(crewMembers.indexOf(CREW_BESS), 1);
			
			crewMessages += "\n\nReaha and [bess.name] are wandering around the ship, trying to make themselves useful. Mostly helping each other clean up the place, making sure everything’s spick and span.";
		}
		else if (rand(8) == 0 && !curedReahaInDebt() && InCollection(CREW_PIPPA, crewMembers) && flags["PIPPA_SETTLED_IN"] == 1)
		{
			crewMembers.splice(crewMembers.indexOf(CREW_REAHA), 1);
			crewMembers.splice(crewMembers.indexOf(CREW_PIPPA), 1);
			
			crewMessages += "\n\nPippa’s relaxing in the common room, looking well-fed. Reaha’s catching a quick nap near her, flopped down on the couch, snoozing peacefully, and looking well-milked."; 
		}
	}
	if (InCollection(CREW_YAMMI, crewMembers))
	{
		if (rand(5) == 0 && flags["YAMMI_KITCHENED"] != undefined && InCollection(CREW_PIPPA, crewMembers) && flags["PIPPA_SETTLED_IN"] == 1)
		{
			crewMembers.splice(crewMembers.indexOf(CREW_YAMMI), 1);
			crewMembers.splice(crewMembers.indexOf(CREW_PIPPA), 1);
			
			crewMessages += "\n\nPippa and Yammi are in the kitchen chatting while Yammi cooks.";
			
			if (flags["SEXED_YAMMI"] > 0 && pc.lust() >= 33 && pippaYammiThreesomeCount(0) == 0 && (pc.hasCock() || pc.hasHardLightEquipped()) && !pc.isTaur() && pippaSexed(0) > 0) flags["PIPPA_YAMMI_KITCHEN"] = 1;
			else flags["PIPPA_YAMMI_KITCHEN"] = 0;
		}
		else flags["PIPPA_YAMMI_KITCHEN"] = 0;
	}
	if (InCollection(CREW_PIPPA, crewMembers) && flags["PIPPA_SETTLED_IN"] == 1)
	{
		if (hours > 13 && hours <= 14 && rand(2) == 0 && InCollection(CREW_ANNO, crewMembers))
		{
			crewMembers.splice(crewMembers.indexOf(CREW_ANNO), 1);
			crewMembers.splice(crewMembers.indexOf(CREW_PIPPA), 1);
			
			crewMessages += "\n\nPippa is giving Anno a post-workout massage, focusing on her torso and being careful to avoid getting oil in her fur.";
		}
		else if (rand(8) == 0 && InCollection(CREW_YAMMI, crewMembers))
		{
			crewMembers.splice(crewMembers.indexOf(CREW_YAMMI), 1);
			crewMembers.splice(crewMembers.indexOf(CREW_PIPPA), 1);
			
			crewMessages += "\n\nPippa is giving Yammi a massage, paying special attenion to her hands and feet.";
		}
		else if (!curedReahaInDebt() && rand(8) == 0 && InCollection(CREW_REAHA, crewMembers))
		{
			crewMembers.splice(crewMembers.indexOf(CREW_REAHA), 1);
			crewMembers.splice(crewMembers.indexOf(CREW_PIPPA), 1);
			
			crewMessages += "\n\nPippa is giving Reaha a massage, paying special attenion to her back.";
		}
	}
	if (InCollection(CREW_RAMIS, crewMembers))
	{
		ramisValidateActivity(crewMembers);
		if (flags["RAMIS_ACTIVITY"] == "KASE")
		{
			crewMembers.splice(crewMembers.indexOf(CREW_RAMIS), 1);
			crewMembers.splice(crewMembers.indexOf(CREW_KASE), 1);
		
			crewMessages += "\n\nOn the monitors, you can see Ramis and Kase are talking in the corridors. Or rather, Ramis has blocked Kase’s path with her arm and is leering down at him, whilst a blushing Kase is nervously playing with the tip of one of his tails. Impossible to imagine what’s going on there.";
		}
		else if (flags["RAMIS_ACTIVITY"] == "SHEKKA")
		{
			crewMembers.splice(crewMembers.indexOf(CREW_RAMIS), 1);
			crewMembers.splice(crewMembers.indexOf(CREW_SHEKKA), 1);
		
			crewMessages += "\n\nOn the monitors, you can see Ramis and Shekka are in the canteen, chatting frenetically. From the way they’re gesturing, and occasionally positioning glasses and cutlery on the table to make a point, you’d guess they’re talking about tech. Shekka has positioned a box on top of a chair so that she can talk to the kaithrit without straining her neck - and also to get at the bottle of whiskey Ramis has plonked onto the table. Gails of tipsy feminine laughter emanate from that part of the ship.";
		}
	}
	
	crewMembers.push(crewMessages);
	return crewMembers;
}

// TODO: This is a temporary solution, I just don't want to refactor ALL of the crew shit right now
public function getCrewOnShip():Array
{
	var c:Array = [];
	if (annoIsCrew()) c.push(anno);
	if (syriIsCrew()) c.push(syri);
	//9999 - not sure what I need to set up for this. Probably just a creature link but none done yet:
	//if (azraIsCrew()) c.push(azra);
	//if (paigeIsCrew()) c.push(paige);
	if (bessIsCrew()) c.push(bess);
	if (celiseIsCrew()) c.push(celise);
	if (reahaIsCrew()) c.push(reaha);
	if (shekkaIsCrew()) c.push(shekka);
	if (yammiIsCrew()) c.push(yammi);
	if (gooArmorIsCrew()) c.push(gooArmor);
	if (siegwulfeIsCrew()) c.push(wulfe);
	return c;
}

public function getCrewOnShipNames(allcrew:Boolean = false, customName:Boolean = true):Array
{
	var crewMembers:Array = [];
	
	if (annoIsCrew()) crewMembers.push("Anno");
	if (azraIsCrew()) crewMembers.push("Azra");
	if (bessIsCrew()) crewMembers.push(customName ? chars["BESS"].short : chars["BESS"].mf("Ben-14","Bess-13"));
	if (celiseIsCrew()) crewMembers.push("Celise");
	if (daneIsCrew()) crewMembers.push("Dane");
	if (kaseIsCrew()) crewMembers.push("Kase");
	if (kiroIsCrew()) crewMembers.push("Kiro");
	if (gooArmorIsCrew()) crewMembers.push(customName ? chars["GOO"].short : "Goo Armor");
	if (paigeIsCrew()) crewMembers.push("Paige");
	if (pippaOnShip()) crewMembers.push("Pippa");
	if (ramisIsCrew()) crewMembers.push("Ramis");
	if (reahaIsCrew()) crewMembers.push("Reaha");
	if (seraIsCrew()) crewMembers.push("Sera");
	if (shekkaIsCrew()) crewMembers.push("Shekka");
	if (syriIsCrew()) crewMembers.push("Syri");
	if (yammiIsCrew()) crewMembers.push("Yammi");
	
	if (allcrew)
	{
		if (hasGooArmor() && !gooArmorIsCrew()) crewMembers.push(customName ? chars["GOO"].short : "Goo Armor");
		if (siegwulfeIsCrew()) crewMembers.push(customName ? chars["WULFE"].short : "Siegwulfe");
		if (varmintIsTame()) crewMembers.push("Varmint");
	}
	
	return crewMembers;
}

// Returns the custom name for the follower, if any.
public function getFollowerName(followerName:String = ""):String
{
	switch(followerName)
	{
		case "Ben-14":
		case "Bess-13": return chars["BESS"].short; break;
		case "Goo Armor": return chars["GOO"].short; break;
		case "Siegwulfe": return chars["WULFE"].short; break;
	}
	return followerName;
}
// Returns the custom bust for the follower, if any.
public function getFollowerBustDisplay(followerName:String = ""):String
{
	switch(followerName)
	{
		case "Anno": return annoBustDisplay(); break;
		case "Azra": return azraBustString(); break;
		case "Ben-14":
		case "Bess-13": return bessBustDisplay(); break;
		case "Celise": return celiseBustDisplay(); break;
		case "Dane": return daneBustDisplay(); break;
		case "Kase": return kaseBustDisplay(); break;
		case "Kiro": return kiroBustDisplay(); break;
		case "Goo Armor": return novaBustDisplay(); break;
		case "Paige": return getPaigeBustString(); break;
		case "Pippa": return pippaBustDisplay(); break;
		case "Ramis": return ramisBustDisplay(); break;
		case "Reaha": return reahaBustDisplay(); break;
		case "Sera": return seraBustDisplay(); break;
		case "Shekka": return shekkaBustDisplay(); break;
		case "Syri": return syriBustDisplay(); break;
		case "Yammi": return yammiBustDisplay(); break;
		case "Siegwulfe": return wulfeBustDisplay(); break;
		case "Varmint": return varmintPetBustDisplay(); break;
	}
	return followerName.toUpperCase();
}
// Returns a follower gender.
public function isFollowerMale(followerName:String = ""):Boolean
{
	switch(followerName)
	{
		case "Bess-13":
		case "Dane":
		case "Kase": return true; break;
	}
	return false;
}

// Sleeping partner-specific names, busts and gender
public function getSleepingPartnerName():String
{
	if (flags["CREWMEMBER_SLEEP_WITH"] == undefined) return "";
	if(chars[flags["CREWMEMBER_SLEEP_WITH"]] != null) return chars[flags["CREWMEMBER_SLEEP_WITH"]].nameDisplay();
	return StringUtil.toTitleCase(flags["CREWMEMBER_SLEEP_WITH"].toLowerCase());
}
public function getSleepingPartnerBustDisplay():String
{
	if (flags["CREWMEMBER_SLEEP_WITH"] == undefined) return "";
	switch(flags["CREWMEMBER_SLEEP_WITH"])
	{
		case "ANNO": return annoBustDisplay(); break;
		case "AZRA": return azraBustString(); break;
		case "BESS": return bessBustDisplay(); break;
		case "CELISE": return celiseBustDisplay(); break;
		case "DANE": return daneBustDisplay(); break;
		case "KASE": return kaseBustDisplay(); break;
		case "KIRO": return kiroBustDisplay(); break;
		case "PAIGE": return getPaigeBustString(); break;
		case "PIPPA": return pippaBustDisplay(); break;
		case "RAMIS": return ramisBustDisplay(); break;
		case "REAHA": return reahaBustDisplay(); break;
		case "SERA": return seraBustDisplay(); break;
		case "SHEKKA": return shekkaBustDisplay(); break;
		case "SYRI": return syriBustDisplay(); break;
		case "YAMMI": return yammiBustDisplay(); break;
	}
	return flags["CREWMEMBER_SLEEP_WITH"].toUpperCase();
}
public function isSleepingPartnerMale():Boolean
{
	if (flags["CREWMEMBER_SLEEP_WITH"] == undefined) return false;
	switch(flags["CREWMEMBER_SLEEP_WITH"])
	{
		case "BESS": return (chars["BESS"].mf("m", "f") == "m"); break;
		case "DANE":
		case "KASE": return true; break;
	}
	return false;
}

public function crewButtonAdjustments(button:Number):Number
{
	button++;
	if((button + 1) % 15 == 0)
	{
		addButton(button, "Back", mainGameMenu);
		button++;
	}
	return button;
}

public function crew(counter:Boolean = false, allcrew:Boolean = false):Number {
	if(!counter) {
		clearOutput();
		clearMenu();
	}
	
	var crewMembers:Array = multiCrewInteractions();
	var crewMessages:String = crewMembers.pop();
	var count:int = 0; // For actual crew members
	var other:int = 0; // For pets or other non-speaking crew members
	var btnSlot:int = 0;
	
	// Followers
	//amber (dryad)
	if (amberIsCrew())
	{
		count++;
		if (!counter)
		{
			crewMessages += "\n\n" + amberShipBonusText();
			if (amberCurrentlyDumbfucked()) addDisabledButton(btnSlot,"Amber","Amber","You’ve decided to leave Amber alone while the effects of the Dumbfuck she took wear off.");
			else addButton(btnSlot, "Amber", amberInTheHold);
			btnSlot = crewButtonAdjustments(btnSlot);
		}
	}
	if (annoIsCrew())
	{
		count++;
		if (!counter)
		{
			//If anno is disabled due to thiccness
			if(flags["ANNO_HUSKAR_COMPLETE"] == undefined && flags["ANNO_HUSKARRED"] != undefined && flags["ANNO_HUSKARRED"] + 60 > GetGameTimestamp())
			{
				crewMessages += "\n\nAnno isn’t in at the moment. You’ll have to wait a bit longer for her to start digging into the treats....";
				addDisabledButton(btnSlot,"Anno","Anno","Anno isn’t in at the moment. You’ll have to wait a bit longer for her to start digging into the treats....");
				btnSlot = crewButtonAdjustments(btnSlot);
			}
			//If anno is away
			else if(annoIsAway())
			{
				crewMessages += "\n\nAnno is currently away or otherwise busy at the moment.";
				addDisabledButton(btnSlot,"Anno","Anno","Anno is currently away or otherwise busy at the moment.");
				btnSlot = crewButtonAdjustments(btnSlot);
			}
			//25% chance of special maid scene proccing if Anno has the maid outfit and haven't seen the scene in a day - gotta have a dink that fits and not be naga or taur
			else if (flags["ANNO_MAID_OUTFIT"] != undefined && rand(4) == 0 && !pc.hasStatusEffect("The Lusty Ausar Maid") && !pc.isTaur() && !pc.isNaga() && pc.cockThatFits(anno.vaginalCapacity()) >= 0)
			{
				if (rand(2) == 0) crewMessages += "\n\nAnno’s not in her quarters as you’d expect. Instead you find her prancing about the common area of your ship, dressed in what appears to be... a maid outfit?";
				else crewMessages += "\n\nAnno doesn’t seem to be in her quarters at the moment, leaving the room strikingly empty, but you think you catch a few glimpses of the snowy pup cavorting about your ship’s common area. Odd.";
				addButton(btnSlot, "Anno", annoFrenchMaid);
				btnSlot = crewButtonAdjustments(btnSlot);
			}
			else
			{
				if (hours >= 6 && hours <= 7 || hours >= 19 && hours <= 20) crewMessages += "\n\nAnno is walking about in her quarters, sorting through her inventory and organizing some of her equipment.";
				else if (hours >= 12 || hours <= 13) 
				{
					if(!annoIsHuskar()) crewMessages += "\n\nAnno’s busy doing a quick workout in her quarters to the beat of some fast-paced ausar heavy metal. <i>“Gotta keep in shape!”</i> she says.";
					else crewMessages += "\n\nYou catch Anno standing in the middle of her quarters, wearing a skin-tight leotard that’s practically tearing itself apart trying to contain her chest and pillowy ass. She’s following along with a low-impact cardio routine playing on her desk’s holoscreen; guess Anno still wants to keep in shape, but isn’t looking to burn off those sexy curves you’ve given her. You happily drink in her jiggling movements for a few moments before moving on.";
				}
				// PC has Freed Reaha and Anno, add to Anno’s random selection:
				else if (!curedReahaInDebt() && rand(3) == 0) crewMessages += "\n\nAnno’s sitting in the kitchen with a [reaha.milkNoun] moustache on her upper lip, looking awfully happy with herself. You can’t imagine where that came from...";
				else crewMessages += "\n\nAnno is sitting in the common area with her nose buried in half a dozen different data slates. It looks like she’s splitting her attention between the latest Warp Gate research and several different field tests of experimental shield generators.";
				addButton(btnSlot, "Anno", annoFollowerApproach);
				btnSlot = crewButtonAdjustments(btnSlot);
			}
		}
	}
	if (azraIsCrew())
	{
		count++;
		if(!counter) 
		{
			crewMessages += azraCrewBlurbs(btnSlot);
			btnSlot = crewButtonAdjustments(btnSlot);
		}
	}
	if (bessIsCrew())
	{
		count++;
		if (!counter)
		{
			if (InCollection(CREW_BESS, crewMembers)) crewMessages += "\n\n[bess.name] is wandering around the ship and keeping [bess.himHer]self busy. It shouldn’t be that hard to find [bess.himHer].";
			addButton(btnSlot, bess.short, approachFollowerBess);
			btnSlot = crewButtonAdjustments(btnSlot);
		}
	}
	if (celiseIsCrew())
	{
		count++;
		if(!counter) {
			if(reahaIsCrew() && !curedReahaInDebt() && rand(3) == 0) crewMessages += "\n\nCelise looks strangely [reaha.milkColor] at the moment, a cloud of discolored liquid floating listlessly inside her. Looks like she’s been feeding off a certain bovine lately...";
			else crewMessages += "\n\nCelise is onboard, if you want to go see her. The ship does seem to stay clean of spills and debris with her around.";
			addButton(btnSlot, "Celise", celiseFollowerInteractions);
			btnSlot = crewButtonAdjustments(btnSlot);
		}
	}
	if (kaseIsCrew())
	{
		count++;
		if(!counter) 
		{
			if (InCollection(CREW_KASE, crewMembers)) crewMessages += kaseCrewBlurbs(btnSlot);
			else addButton(btnSlot, "Kase", kaseApproachCrew, 1); //9999 ramis stuff
			btnSlot = crewButtonAdjustments(btnSlot);
		}
	}
	if (mitziIsCrew())
	{
		count++;
		if(!counter)
		{
			crewMessages += mitziCrewBonus();
			if(pc.hasStatusEffect("Mitzi_Gushed_Out")) addDisabledButton(btnSlot,"Mitzi","Mitzi","Maybe let her recover from that Gush, huh?");
			else addButton(btnSlot,"Mitzi",approachCrewMitzi);
			btnSlot = crewButtonAdjustments(btnSlot);
		}
	}
	if (paigeIsCrew())
	{
		count++;
		if(!counter)
		{
			crewMessages += "\n\nPaige mostly keeps to her room when not helping you navigate the starways.";
			addButton(btnSlot,"Paige",paigeCrewApproach);
			btnSlot = crewButtonAdjustments(btnSlot);
		}
	}
	if (pippaOnShip())
	{
		count++;
		if (!counter)
		{
			if (InCollection(CREW_PIPPA, crewMembers)) crewMessages += "\n\n" + pippaShipBonusText();
			if (flags["PIPPA_SETTLED_IN"] != 1) addButton(btnSlot, "Pippa", pippaShipIntro);
			else if (flags["PIPPA_YAMMI_KITCHEN"] == 1) addButton(btnSlot, "Pippa", pippaYammiThreesomeIntro);
			else addButton(btnSlot, "Pippa", pippaMainMenu);
			btnSlot = crewButtonAdjustments(btnSlot);
		}
	}
	if (ramisIsCrew())
	{
		count++;
		if(!counter)
		{
			if (!pc.hasStatusEffect("Partying Ramis"))
			{
				if (InCollection(CREW_RAMIS, crewMembers)) crewMessages += "\n\n" + ramisCrewBlurb();
				addButton(btnSlot, "Ramis", ramisCrewApproach);
			}
			else addDisabledButton(btnSlot, "Ramis", "Ramis", "The female kaithrit is out in Tavros, pulverizing the station’s drinking holes no doubt.\n\nShe’ll be back tomorrow.");
			btnSlot = crewButtonAdjustments(btnSlot);
		}
	}
	if (reahaIsCrew())
	{
		count++;
		if(!counter)
		{
			//Not Addicted (CURED XPACK: reaha.cured_expansion.as)
			if(!reahaAddicted())
			{
				if (InCollection(CREW_REAHA, crewMembers))
				{
					//Slave Reaha, random choice: 
					if(curedReahaInDebt()) 
					{
						crewMessages += RandomInCollection([
							"\n\nReaha’s wandering around the ship, trying to make herself useful. Mostly cleaning up the place, making sure everything’s spick and span.",
							"\n\nReaha’s sitting in the galley, surrounded by bottles of fresh [reaha.milk]. She’s milking herself to the point of exhaustion trying to pay off her debt to you, by the looks of things.",
							"\n\nReaha’s in her bunk, the doors closed. Whenever you get too near her quarters you can hear muffled moans and grunts of pleasure. You suppose even without her patches, Reaha’s still exceptionally libidinous after all...",
						]);
					}
					//Freed Reaha, random choice: 
					else
					{
						crewMessages += RandomInCollection([
							"\n\nReaha’s wandering around the ship, trying to make herself useful. Mostly cleaning up the place, making sure everything’s spick and span.",
							"\n\nReaha’s catching a quick nap in the common area, flopped down on the couch and snoozing peacefully.",
							"\n\nReaha’s in the galley, using her Magic Milker to drain her boobs - and make a little cash on the side.",
							"\n\nReaha’s fiddling with the ship’s point-defenses, making sure they’re calibrated to military spec.",
						]);
					}
				}
				addButton(btnSlot, "Reaha", curedReahaApproach);
				btnSlot = crewButtonAdjustments(btnSlot);
			}
			//Normal Reaha
			else 
			{
				crewMessages += "\n\nReaha is currently meandering around the ship, arms clutched under her hefty bosom, her nipples hooked up to a small portable milker.";
				addButton(btnSlot, "Reaha", approachShipBoardReahaWhyDidntSavinCodeThisHeWasntExhaustedYesterday);
				btnSlot = crewButtonAdjustments(btnSlot);
			}
		}
	}
	if (seraIsCrew())
	{
		count++;
		if (!counter)
		{
			crewMessages += seraOnShipBonus(btnSlot);
			btnSlot = crewButtonAdjustments(btnSlot);
		}
	}
	if (shekkaIsCrew())
	{
		count++;
		if(!counter)
		{
			if (!InCollection(CREW_SHEKKA, crewMembers)) //9999 ramis stuff
			{
				addButton(btnSlot,"Shekka",approachCrewShekka);
			}
			if(pc.hasStatusEffect("Shekka_Cum_Playing"))
			{
				crewMessages += "\n\nShekka is lounging about after a little bit of play with her toy. Once she’s recovered and cleaned up, she’ll be up to hang out again. Give her an hour at the most.";
				addDisabledButton(btnSlot,"Shekka","Shekka","Shekka is lounging about after a little bit of play with her toy. Once she’s recovered and cleaned up, she’ll be up to hang out again. Give her an hour at the most.");
			}
			else if(pc.hasStatusEffect("SHEKKA_CHEATING_ON_YOU_CD"))
			{
				crewMessages += "\n\nShekka is still probably banging out her frustrations on a bull. She’ll be back before too long.";
				addDisabledButton(btnSlot,"Shekka","Shekka","Shekka is still probably banging out her frustrations on a bull. She’ll be back before too long.");
			}
			else if(shekka.hasCock() && flags["SHEKKA_ONAHOLED"] == undefined && rand(5) == 0)
			{
				crewMessages += "\n\nShekka should be around your ship’s engines, but there’s <b>a strangely musky smell coming from back there...</b>";
				addButton(btnSlot,"Shekka",shekkaOnaholeIntro);
			}
			else 
			{
				crewMessages += "\n\nShekka is hanging out around your ship’s engines, constantly calibrating one circuit or another to maximize power.";
				addButton(btnSlot,"Shekka",approachCrewShekka);
			}
			btnSlot = crewButtonAdjustments(btnSlot);
		}
	}
	if (yammiIsCrew())
	{
		count++;
		if (!counter)
		{
			if (InCollection(CREW_YAMMI, crewMembers)) crewMessages += "\n\n" + yammiShipBonusText();
			if (flags["PIPPA_YAMMI_KITCHEN"] == 1) addButton(btnSlot, "Yammi", pippaYammiThreesomeIntro);
			else addButton(btnSlot, "Yammi", yammiInTheKitchen);
			btnSlot = crewButtonAdjustments(btnSlot);
		}
	}

	// Pets
	if (hasGooArmor() || gooArmorIsCrew())
	{
		if(gooArmorIsCrew()) count++; // Speaking crew member on ship.
		else other++; // Mostly quiet member on person or in storage.
		if (!counter)
		{
			crewMessages += gooArmorOnSelfBonus(btnSlot);
			btnSlot = crewButtonAdjustments(btnSlot);
		}
	}
	if (pexigaIsCrew())
	{
		count++;
		if (!counter)
		{
			crewMessages += "\n\n" + pexigaShipBonusText();
			addButton(btnSlot, pexigaName(), approachPexigaCrew);
			btnSlot = crewButtonAdjustments(btnSlot);
		}
	}
	if (hasSiegwulfe() || siegwulfeIsCrew() || flags["WULFE_ON_SHIP"] == false)
	{
		other++;
		if (!counter)
		{
			crewMessages += siegwulfeOnShipBonus(btnSlot);
			btnSlot = crewButtonAdjustments(btnSlot);
		}
	}
	if (varmintIsCrew())
	{
		other++;
		if (!counter)
		{
			crewMessages += varmintOnShipBonus(btnSlot);
			btnSlot = crewButtonAdjustments(btnSlot);
		}
	}
	
	// Crew display
	if(!counter) {
		if((count + other) > 0) {
			clearBust();
			showName("\nCREW");
			output("Who of your crew do you wish to interact with?" + crewMessages);
			
			if(btnSlot > 14)
			{
				while((btnSlot < 59) && ((btnSlot + 1) % 15 != 0)) { btnSlot++; }
				addButton(btnSlot, "Back", mainGameMenu);
			}
		}
		addButton(14, "Back", mainGameMenu);
	}
	if(allcrew) return (count + other);
	return count;
}

public function passiveTimeEffects(minPass:int = 0):Boolean
{
	if (minPass > 0)
	{
		if (pc.hasStatusEffect("Bitterly Cold") && tryApplyUvetoColdDamage(minPass)) return true;
	}
	return false;
}

// Times of the day
public function isMorning():Boolean
{
	return (hours > 4 && hours <= 10);
}
public function isNoon():Boolean
{
	return (hours > 10 && hours <= 16);
}
public function isEvening():Boolean
{
	return (hours > 16 && hours <= 22);
}
public function isNight():Boolean
{
	return (hours > 22 || hours <= 4);
}

public function canRest():Boolean
{
	return true;
}
public function canSleep():Boolean
{
	if(InShipInterior(pc) && pc.hasStatusEffect("Disable Ship Bed")) return false;
	return true;
}

public function restMenu():void
{
	clearOutput();
	output("Do you wait for some minutes or take a rest for a few hours?");
	
	clearMenu();
	
	addButton(0, "Wait 5 min", wait, 5, "Wait 5 Minutes", "Wait for 5 minutes.");
	addButton(1, "Wait 10 min", wait, 10, "Wait 10 Minutes", "Wait for 10 minutes.");
	addButton(2, "Wait 30 min", wait, 30, "Wait 30 Minutes", "Wait for 30 minutes.");
	
	addButton(5, "Wait 1 hr", wait, 60, "Wait 1 Hour", "Wait for 1 hour.");
	addButton(6, "Wait 2 hr", wait, 120, "Wait 2 Hours", "Wait for 2 hours.");
	addButton(7, "Wait 3 hr", wait, 180, "Wait 3 Hours", "Wait for 3 hours.");
	
	addButton(9, "Rest", rest, undefined, "Rest", "Take a break and fully rest a while.");
	
	addButton(14, "Back", mainGameMenu);
}
public function sleepMenu():void
{
	if(!canRest())
	{
		sleep();
		return;
	}
	
	clearOutput();
	output("Do you wait for some minutes, take a rest for a few hours, or go " + (isNight() && silly ? "<i>the fuck</i> to sleep" : "to sleep for some time") + "?");
	
	clearMenu();
	
	addButton(0, "Wait 5 min", wait, 5, "Wait 5 Minutes", "Wait for 5 minutes.");
	addButton(1, "Wait 10 min", wait, 10, "Wait 10 Minutes", "Wait for 10 minutes.");
	addButton(2, "Wait 30 min", wait, 30, "Wait 30 Minutes", "Wait for 30 minutes.");
	
	addButton(5, "Wait 1 hr", wait, 60, "Wait 1 Hour", "Wait for 1 hour.");
	addButton(6, "Wait 2 hr", wait, 120, "Wait 2 Hours", "Wait for 2 hours.");
	addButton(7, "Wait 3 hr", wait, 180, "Wait 3 Hours", "Wait for 3 hours.");
	
	addButton(8, "Rest", rest, undefined, "Rest", "Take a break and fully rest a while.");
	if(canSleep()) addButton(9, "Sleep", sleep, undefined, "Sleep", "Go to sleep for some time.");
	else addDisabledButton(9, "Sleep", "Sleep", "You can’t seem to sleep here at the moment....");
	
	addButton(14, "Back", mainGameMenu);
}

public function wait(minPass:int = 0):void
{
	//Turn encounters back on.
	flags["ENCOUNTERS_DISABLED"] = undefined;
	
	clearOutput();
	
	var hrPass:int = Math.floor(minPass/60);
	
	output("You decide to " + (minPass < 30 ? "stand" : "mosey") + " around and wait for");
	if(hrPass <= 0) output(" " + num2Text(minPass) + " minutes");
	else if(hrPass == 1) output(" one hour");
	else output(" " + num2Text(hrPass) + " hours");
	output(".");
	
	var waitMult:Number = 0.20 * (minPass / 240);
	if(pc.HPRaw < pc.HPMax()) pc.HP(Math.round(pc.HPMax() * waitMult));
	if(pc.energyRaw < pc.energyMax()) pc.energy(Math.round(pc.energyMax() * waitMult));
	
	if(pc.HPRaw < pc.HPMax() || pc.energyRaw < pc.energyMax()) output(" While doing this doesn’t keep you well rested, it manages to pass the time.");
	
	processTime(minPass);
	
	if(passiveTimeEffects(minPass)) return;
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function rest(deltaT:int = -1):void {
	var minPass:int;
	//Turn encounters back on.
	flags["ENCOUNTERS_DISABLED"] = undefined;
	if(InRoomWithFlag(GLOBAL.WATERFALL))
	{
		restOnWaterfall();
		return;
	}
	clearOutput();

	var postRestLustBonus:Number = 0;

	if (deltaT == -1)
	{
		if(pc.hasPerk("Auto-Autofellatio") && pc.hasCock())
		{
			//First time gudness
			if(pc.perkv1("Auto-Autofellatio") == 0 && pc.canAutoFellate(-1))
			{
				cumCowAutoFellatio(true, (280 + rand(30) + 1));
				return;
			}
			else if(pc.perkv2("Auto-Autofellatio") <= 0 && rand(3) == 0 && pc.hasTailCock() && pc.hasGenitals()) 
			{
				cumCowCockvineSuck();
				return;
			}
			else if(pc.perkv2("Auto-Autofellatio") <= 0 && rand(3) == 0 && pc.canAutoFellate(-1))
			{
				cumCowAutoFellatio(true, (280 + rand(30) + 1));
				return;
			}

			else if(rand(20) == 0)
			{
				autoCocknosisDistraction();
				postRestLustBonus = pc.libido()/3 + 20;
			}
		}
		if(pc.isCumSlut() && pc.libido() >= 50 && pc.lust() >= 70 && pc.WQ() < 25 && pc.hasVagina() && pc.hasBackGenitals() && rand(4) == 0) 
		{
			eventQueue.push(involuntarilyCockwangYourself);
		}
		minPass = 230 + rand(20) + 1;
		if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) {
			output("You take a rest for about " + num2Text(Math.round(minPass/60)) + " hours");
			if(pc.HP() < pc.HPMax()) output(" and dress your injuries with some less-than-legal nanogel you appropriated on an old job");
			output(".");
		}
		else output("You sit down and rest for around " + num2Text(Math.round(minPass/60)) + " hours.");
	}
	else
	{
		minPass = deltaT;
	}
	restHeal();
	processTime(minPass);
	pc.lust(postRestLustBonus);
	
	// Time passing effects
	if(passiveTimeEffects(minPass)) return;
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function restHeal():void
{
	var bonusMult:Number = 1 + pc.statusEffectv1("Home Cooking")/100;
	var soreMult:Number = 1;
	
	if(pc.armor is AugmentWeaveArmor)
	{
		bonusMult += 0.5;
		soreMult += 1;
	}
	if(pc.accessory is MaikesCollar)
	{
		bonusMult = 0;
		AddLogEvent("The slave collar’s punishing shocks keep your rest from doing much.");
	}
	else if(pc.hasStatusEffect("Dzaan Withdrawal")) bonusMult = 0.5;
	
	if(bonusMult != 0)
	{
		if(pc.HPRaw < pc.HPMax()) {
			if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) pc.HP(Math.round(pc.HPMax() * bonusMult));
			else pc.HP(Math.round(pc.HPMax() * .33 * bonusMult));
		}
		if(pc.energyRaw < pc.energyMax()) {
			pc.energy(Math.round(pc.energyMax() * .33 * bonusMult));
		}
	}
	
	if(pc.hasStatusEffect("Sore Counter")) soreChange(-1 * soreMult);
}

public function sleep(outputs:Boolean = true, bufferXP:Boolean = true):void {
	
	//Turn encounters back on.
	flags["ENCOUNTERS_DISABLED"] = undefined;
	
	var minPass:int = 420 + rand(80) + 1;
	var inShip:Boolean = InShipInterior(pc);
	var wakeEvents:Array = [];
	
	if(outputs)
	{
		clearOutput();
		if(bufferXP) eventBufferXP();
	}
	
	// Before sleep events
	if(kiMedbaySleeps()) return;
	//Whiff o Wisp > Dreams or sex!
	if(pc.hasStatusEffect("Woozy") && outputs) 
	{
		trace("SHIT PROCCED, SCRUB");
		whiffOWhateverTexts();
		return;
	}
	if(inShip)
	{
		if(outputs)
		{
			// Randy Claws
			if(isChristmas() && MailManager.isEntryViewed("randy_claws_email") && flags["RANDY_CLAWS"] == undefined)
			{
				randyClawsHook();
				return;
			}
			// BOO!! CHUPACABRO!!
			if(isHalloweenish() && reahaIsCrew() && reahaIsCured() && flags["CHUPACABRO'D"] == undefined)
			{
				reahaIsScaredOfTheChupacabro();
				return;
			}
			else if(!isHalloweenish()) flags["CHUPACABRO'D"] = undefined;
			
			// Anno interjection
			if (flags["ANNO_SLEEPWITH_INTRODUCED"] == undefined && annoIsCrew() && annoSexed() > 0)
			{
				annoSleepWithIntroduce();
				return;
			}
			//Shekka interjection
			if (flags["SHEKKA_SLEEPWITH_INTRODUCED"] == undefined && shekkaIsCrew() && (flags["CREWMEMBER_SLEEP_WITH"] == undefined || flags["CREWMEMBER_SLEEP_WITH"] == 0))
			{
				shareShekkaBedProc();
				return;
			}
			//Shekka interjects to Anno
			if (flags["SHEKKA_SLEEPWITH_INTRODUCED"] == undefined && shekkaIsCrew() && (flags["CREWMEMBER_SLEEP_WITH"] == "ANNO") && annoIsCrew())
			{
				shekkaBedIntroWithAnnoProc();
				return;
			}
			// Azra interjection! - Req's Azra onboard, not professional, banged once, nobody else in bed, and a week since your last visit to the sharkgal. Also a dick that fits inside.
			if(azraIsCrew() && !azraProfessional() && flags["AZRA_SEXED"] != undefined && (flags["CREWMEMBER_SLEEP_WITH"] == undefined || flags["CREWMEMBER_SLEEP_WITH"] == 0) && flags["AZRA_VISITED"] + (60*24*7) < GetGameTimestamp() && pc.hasCock() && pc.cockThatFits(azra.vaginalCapacity(0)) >= 0) 
			{
				neglectedAzraFunsies();
				return;
			}
			
			var interrupt:Boolean = false;
			
			switch(flags["CREWMEMBER_SLEEP_WITH"])
			{
				case "SHEKKA AND ANNO":
					if (annoIsCrew() && (rand(3) == 0 || (isChristmas() && flags["ANNO_GIFT_WRAPPED"] == undefined)))
					{
						annoSleepSexyTimes();
						interrupt = true;
						break;
					}
					if (shekkaIsCrew() && rand(3) == 0)
					{
						wakeEvents.push(shekkaSleepWithMornings);
					}
					break;
				case "MITZI":
					if (mitziIsCrew() && pc.hasGenitals() && flags["CREWMEMBER_SLEEP_WITH"] == "MITZI") 
					{
						if(!pc.hasStatusEffect("Mitzi_Gushed_Out")) wakeEvents.push(mitziMorningSuccOrWhatever);
					}
					break;
				case "ANNO":
					if (annoIsCrew() && (rand(3) == 0 || (isChristmas() && flags["ANNO_GIFT_WRAPPED"] == undefined)))
					{
						annoSleepSexyTimes();
						interrupt = true;
					}
					break;
				case "SHEKKA":
					if (shekkaIsCrew() && rand(3) == 0)
					{
						wakeEvents.push(shekkaSleepWithMornings);
					}
					break;
				case "BESS":
					if (bessIsCrew() && rand(3) == 0)
					{
						wakeEvents.push(bessMorningEvents);
					}
					break;
				case "REAHA":
					if (reahaIsCrew() && rand(3) == 0)
					{
						sleepWithCuredReaha();
						interrupt = true;
					}
					break;
				case "SERA":
					if (seraIsCrew())
					{
						interrupt = seraBitchImpregnateBed(true);
					}
					break;
				case "KASE":
					if (kaseIsCrew() && rand(3) == 0)
					{
						if (pc.isLactating() && flags["KASE_SNOOZED"] == 1 && rand(2) == 0){
							kaseCrewSleepSuckling();
							interrupt = true;
						}
						else {
							kaseCrewSleep();
							interrupt = true;
						}
					}
					break;
				case "PAIGE":
					if (paigeIsCrew() && hours >= 22 || hours < 5)
					{
						paigeSleepNodeOne();
						interrupt = true;
					}
					break;
				case "RAMIS":
					if (ramisIsCrew() && !ramisOutDrinking() && !looksFemaleToRamis() && !pc.isTaur())
					{
						ramisSleep();
					}
					break;
				// No partner selected.
				default:
					// SERA IMPREGNATIONS
					if(!interrupt && seraIsCrew())
					{
						interrupt = seraBitchImpregnateBed();
					}
					//CELISE NIGHT TIME BEDTIMEZ
					if(!interrupt && celiseIsCrew() && rand(3) == 0 && flags["CELISE_NO_BED_SENPAI"] == undefined)
					{
						celiseOffersToBeYourBedSenpai();
						interrupt = true;
					}
					break;
			}
			if(interrupt) return;
		}
	}
	if(outputs) output("You lie down and sleep for about " + num2Text(Math.round(minPass/60)) + " hours.");
	
	sleepHeal();
	
	processTime(minPass);

	// Time passing effects
	if(passiveTimeEffects(minPass)) return;
	
	// Dream events
	var dreamed:Boolean = dreamChances(inShip);
	
	// Between sleep events
	if(outputs)
	{
		mimbraneSleepEvents();
		if(inShip) grayGooSpessSkype();
	}
	
	// After sleep events
	if(inShip)
	{
		//Queue up cured Reaha
		//reahaConfidence at 75 or better. Reaha Addiction at 0%. Happens the next time the PC sleeps aboard ship after Addiction 0.
		if(reahaConfidence() >= 75 && reahaAddiction() <= 0 && !reahaIsCured())
		{
			if(eventQueue.indexOf(reahaIsAStrongIndependantMilkSlootWhoDontNeedNoPatches) == -1) eventQueue.push(reahaIsAStrongIndependantMilkSlootWhoDontNeedNoPatches);
		}
	}
	
	clearMenu();
	
	// Waking up events
	if(inShip && !dreamed)
	{
		if (seraBitchImpregnateBedWakeCheck()) wakeEvents.push(seraBitchImpregnateBedWake);
		if (tryProcDommyReahaTime(minPass - rand(301))) wakeEvents.push(reahaDommyFuxTime);
		if (flags["ANNO_SLEEPWITH_DOMORNING"] == 1) wakeEvents = [annoMorningRouter];
		if (flags["KASE_SLEEPWITH_DOMORNING"] == 1) wakeEvents = [kaseCrewWake];
		if (flags["RAMIS_SLEEPWITH_DOMORNING"] == 1) wakeEvents = [ramisSleepWake];
		if (flags["PAIGE_WAKEY_FLAGS"] != undefined) wakeEvents = [paigeWakeyWakey];
		
		if (wakeEvents.length > 0)
		{
			addButton(0, "Next", wakeEvents[rand(wakeEvents.length)]);
			return;
		}
	}
	//Nyrean Queen’s Chambers
	// 50% chance and only once every 24h
	else if(currentLocation == "2C15" && !dreamed && pc.hasPerk("Nyrean Royal") && !pc.hasStatusEffect("Taivra Bed Event Cooldown") && rand(2) == 0)
	{
		addButton(0, "Next", taivraMorningEvent);
		return;
	}
	
	addButton(0, "Next", mainGameMenu);
}

public function sleepHeal():void
{
	var bonusMult:Number = 1;
	var soreMult:Number = 1;
	
	if(pc.accessory is MaikesCollar)
	{
		bonusMult = 0;
		AddLogEvent("The slave collar’s punishing shocks keep your rest from doing much.");
	}
	else if(pc.hasStatusEffect("Dzaan Withdrawal")) bonusMult = 0.5;
	
	if(pc.armor is AugmentWeaveArmor)
	{
		bonusMult += 0.5;
		soreMult += 1;
	}

	if(bonusMult != 0)
	{
		if(pc.HPRaw < pc.HPMax()) pc.HPRaw = Math.round(pc.HPMax() * bonusMult);
		if(pc.energyRaw < pc.energyMax()) pc.energyRaw = Math.round(pc.energyMax() * bonusMult);
	}
	
	// Fecund Figure shape loss (Lose only after sore/working out)
	if(pc.hasPerk("Fecund Figure") && pc.isSore())
	{
		var numPreg:int = pc.totalPregnancies();
		if(pc.isPregnant(3)) numPreg--;
		
		var weightLoss:int = 0;
		if(pc.hasStatusEffect("Sore")) weightLoss = -1;
		if(pc.hasStatusEffect("Very Sore")) weightLoss = -2;
		if(pc.hasStatusEffect("Worn Out")) weightLoss = -3;
		
		if(numPreg <= 0)
		{
			pc.addPerkValue("Fecund Figure", 1, weightLoss);
			pc.addPerkValue("Fecund Figure", 2, weightLoss);
			pc.addPerkValue("Fecund Figure", 3, weightLoss);
		}
		pc.addPerkValue("Fecund Figure", 1, weightLoss);
		pc.addPerkValue("Fecund Figure", 2, weightLoss);
		pc.addPerkValue("Fecund Figure", 3, weightLoss);
		if(pc.perkv1("Fecund Figure") < 0) pc.setPerkValue("Fecund Figure", 1, 0);
		if(pc.perkv2("Fecund Figure") < 0) pc.setPerkValue("Fecund Figure", 2, 0);
		if(pc.perkv3("Fecund Figure") < 0) pc.setPerkValue("Fecund Figure", 3, 0);
	}
	if(pc.hasStatusEffect("Sore Counter")) soreChange(-3 * soreMult);
	pc.removeStatusEffect("Jaded");
	pc.removeStatusEffect("Roshan Blue");
}

public function genericSleep(baseTime:int = 480, bufferXP:Boolean = true):void
{
	var totalTime:int = baseTime + (rand(baseTime / 3) - (baseTime / 6));
	
	processTime(totalTime);
	sleepHeal();
	if(bufferXP) eventBufferXP();
}

public function dailyAutoSleep(nMin:int = 0, bufferXP:Boolean = true):void
{
	var nHour:int = Math.floor(nMin / 60);
	var numSleeps:int = Math.floor(nHour / 24);
	if(numSleeps > 0)
	{
		for(var i:int = 0; i < numSleeps; i++)
		{
			sleepHeal();
		}
		if(bufferXP) eventBufferXP();
	}
	else if(nHour >= 8)
	{
		sleepHeal();
		if(bufferXP) eventBufferXP();
	}
}

public function eventBufferXP():void
{
	if (pc.level >= pc.levelEnd()) return;
	
	if ((pc.XPRaw >= pc.XPMax()) && pc.level < pc.levelMax() && flags["LEVEL_UP_AVAILABLE"] == undefined)
	{
		(pc as PlayerCharacter).unspentStatPoints += 13;
		(pc as PlayerCharacter).unclaimedClassPerks += 1;
		(pc as PlayerCharacter).unclaimedGenericPerks += 1;
		
		pc.XPRaw -= pc.XPMax();
		pc.level++;
		pc.maxOutHP();
		
		// Enable the button
		userInterface.levelUpButton.Activate();
		
		AddLogEvent("A nights rest is just what you needed; you feel faster... stronger... harder....\n<b>Level Up is available!</b>", "good");
	}
	else if (pc.level >= pc.levelMax())
	{
		AddLogEvent("<b>You’ve already reached the current maximum level. It will be raised in future builds.</b>", "good");
	}
}
public function earnXP(XPGain:Number = 0, newline:Boolean = true):void
{
	//Roshan Blue gives 25% more xp and lowers willpower by 30% until next rest
	if (XPGain > 0 && pc.hasStatusEffect("Roshan Blue")) XPGain += Math.floor(XPGain * 0.25);
	
	/* DISABLED WITH NEW XP UPDATE
	=======================================
	// Add up XP, but don't permit the players current XP to overcap (unless at level end-cap)
	if (XPGain > 0 && (XPGain + pc.XP()) > pc.XPMax() && pc.level >= pc.levelEnd())
	{
		XPGain = pc.XPMax() - pc.XP();
	}
	=======================================*/
	
	// No XP
	if (XPGain == 0)
	{
		output((!newline ? " " : "\n\n") + "0 XP gained!");
	}
	// Earning XP
	else if (XPGain > 0)
	{
		pc.XP(XPGain);
		output((!newline ? " " : "\n\n") + XPGain + " XP gained!");
	}
	// Spending XP?
	else if (XPGain < 0)
	{
		pc.XP(XPGain);
		output((!newline ? " " : "\n\n") + Math.abs(XPGain) + " XP spent!");
	}
	
	// Limit notification
	if (pc.XP() >= pc.XPMax()) output("\n" + outputMaxXP());
}

public function rewardXP(XPBuffer:Number = 0):void
{
	// Scale XP to PC level.
	var XPGain:Number = Math.round(XPBuffer * pc.level);
	
	earnXP(XPGain);
}

public function outputMaxXP():String
{
	var msg:String = "";
	
	msg += "<b>";
	msg += "Maximum XP attained!";
	if(pc.level < pc.levelMax())
	{
		msg += " You need to level up to continue to progress.";
		if(pc.level <= pc.levelMin()) msg += "\nFind a bed to sleep on in order to level up (like on your ship).";
	}
	else if(pc.level < pc.levelEnd())
	{
		msg += " Your XP will continue to pool until the next level becomes available.";
	}
	msg += "</b>";
	
	return msg;
}

public function insideShipEvents():Boolean
{
	// Mitzi stops you from going inside~
	if(pc.hasStatusEffect("SeenMitzi") && flags["MITZI_DISABLED"] == undefined && !mitziRecruited())
	{
		mitziFirstShipApproach();
		return true;
	}
	// Puppyslutmas hook :D
	if (annoIsCrew() && annoPuppyslutmasEntry())
	{
		return true;
	}
	//Pexiga hook
	if (yammiIsCrew() && pexigaIsCrew() && flags["PEX&YAM_MEETING"] == undefined)
	{
		approachPexigaCrewFirstTime();
		return true;
	}
	//Kase/Anno Fun
	if(kaseIsCrew() && annoIsCrew() && (flags["KASE_MATHED"] == undefined || ((flags["KASE_MATHED"] != undefined && flags["KASE_MATHED"] + 7*24*60 < GetGameTimestamp()))) && rand(10) == 0)
	{
		annoAndKaseDoMath();
		return true;
	}
	//Ellie Preg laying
	if(flags["ELLIE_LAYING_PC_MIA"] != undefined)
	{
		ellieLayPlayerOffNT();
		return true;
	}
	//Anno Thiccening xpack
	if(flags["ANNO_HUSKAR_COMPLETE"] == undefined && flags["ANNO_HUSKARRED"] != undefined && flags["ANNO_HUSKARRED"] + 60 < GetGameTimestamp())
	{
		annoSomethingsChanging();
		return true;
	}
	if(shekkaSpitAddiction() >= 50 && !shekkaSpitAddicted() && pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) 
	{
		shekkaConfesesThatShesAddicted();
		return true;
	}
	if(shekkaSpitAddicted() && !pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED))
	{
		shekkaUnaddictionNotice();
		return true;
	}
	if(majinHere() && flags["SHIZZY_MET"] == 1 && annoIsCrew()) 
	{
		shizzyAnnoShipTalk();
		return true;
	}
	if (ramisMolestingAvailable() && rand(10) == 0)
	{
		ramisCorridorMolesting();
		return true;
	}

	return false;
}

public function shipMenu():Boolean
{
	rooms["SHIP INTERIOR"].outExit = shipLocation;
	
	setLocation("SHIP\nINTERIOR", rooms[rooms["SHIP INTERIOR"].outExit].planet, rooms[rooms["SHIP INTERIOR"].outExit].system);
	
	if(insideShipEvents()) return true;
	
	if(shipLocation == "KIROS SHIP AIRLOCK") output("\n\n<b>You’re parked in the hangar of the distressed ship. You can step out to investigate at your leisure.</b>");
	
	// Location Exceptions
	if(shipLocation == "600") myrellionLeaveShip();
	
	// Main ship interior buttons
	if(currentLocation == "SHIP INTERIOR")
	{
		//Also the Anno-Kase Voyeur scene
			//Kase is crew, Anno is crew, Anno is wearing catsuit, done the Anno-Kase 3sum, 
			//haven't seen the Voyeur scene in 24hrs, then finally 10% chance
		if(kaseIsCrew() && annoIsCrew() && annoWearingCatsuit() && flags["KASE_3SUM_ANNO"] != undefined 
			&& !pc.hasStatusEffect("Kase-Anno Voyeur Cooldown") && rand(100) < 10)
		{
			kaseVoyeurAnno();
			return true;
		}
		
		if (crew(true, true) > 0) addButton(2, "Crew", crew);
		if (hasShipStorage()) addButton(3, "Storage", shipStorageMenuRoot);
		else addDisabledButton(3, "Storage");
		addButton(4, "Shower", showerMenu);
		if(shipLocation == "K16_DOCK") addButton(5,"Take Off",leaveZePrison);
		else addButton(5, "Fly", flyMenu);
		if(pc.hasStatusEffect("PAIGE_COMA_CD")) 
		{
			output("\n\n<b>No sense leaving while Paige is still in surgery...</b>");
			addDisabledButton(5,"Fly","Fly","Maybe you should stay close while Paige is in surgery.");
		}
	}
	
	return false;
}

public function flyMenu():void
{
	clearOutput();
	
	//Make sure you can leave the planet!
	if(!leavePlanetOK())
	{
		if(flags["CHECKED_GEAR_AT_OGGY"] == 1)
		{
			output("<b>Your gear is still locked up in customs. You should go grab it before you jump out of system.");
			clearMenu();
			addButton(14, "Back", mainGameMenu);
			return;
		}
		if(pc.hasKeyItem("RK Lay - Captured"))
		{
			output("<b>You should probably get rid of RK Lah before you skip town...</b>");
			clearMenu();
			addButton(14, "Back", mainGameMenu);
			return;
		}
		if(ramisOutDrinking())
		{
			ramisAbandonBlurb();
			clearMenu();
			addButton(0, "Wait", ramisWaitForTheDrunkard);
			addButton(14, "Back", mainGameMenu);
			return;
		}
			
		
		if(flags["CHECKED_GEAR_AT_OGGY"] != undefined) flags["CHECKED_GEAR_AT_OGGY"] = undefined;
		pc.removeStatusEffect("Disarmed");
	}
	if(paigeIsCrew())
	{
		showPaige();
		showName("WHERE\nTO?");
		output("You ring Paige up on your ship’s intercom. <i>“Paige to the bridge,”</i> you say into the receiver, <i>“Paige to the bridge.”</i>");
		output("\n\nYour Ausar navigator is by your side in just another moment. <i>“Yes, captain?”</i> she asks cheerfully.");
		output("\n\nYou tell her that you’re setting off, and you want your navigator to plot you a course. <i>“Of course!”</i> she says, excited to get to work. <i>“Where are we headed?”</i>");
	}
	else output("Where do you want to go?");
	clearMenu();
	//TAVROS
	if(shipLocation != "TAVROS HANGAR") addButton(0, "Tavros", flyTo, "Tavros");
	else addDisabledButton(0, "Tavros", "Tavros Station", "You’re already here.");
	//MHEN'GA
	if(shipLocation != "SHIP HANGAR") addButton(1, "Mhen’ga", flyTo, "Mhen'ga");
	else addDisabledButton(1, "Mhen’ga", "Mhen’ga", "You’re already here.");
	//TARKUS
	if(flags["UNLOCKED_JUNKYARD_PLANET"] != undefined)
	{
		if(shipLocation != "201") addButton(2, "Tarkus", flyTo, "Tarkus");
		else addDisabledButton(2, "Tarkus", "Tarkus", "You’re already here.");
	}
	else addDisabledButton(2, "Locked", "Locked", "You need to find one of your father’s probes to access this location’s coordinates.");
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
			else addDisabledButton(3, "Myrellion", "Myrellion - Deep Caves", "You’re already here.");
		}
	}
	else addDisabledButton(3, "Locked", "Locked", "You need to find one of your father’s probes to access this location’s coordinates.");
	
	if(zhengCoordinatesUnlocked())
	{
		if (shipLocation != "ZS L50") addButton(4, "ZhengShi", flyTo, "ZhengShi");
		else addDisabledButton(4, "ZhengShi", "Zhèng Shi Station", "You’re already here.");
	}
	else addDisabledButton(4, "Locked", "Locked", "You need to find one of your father’s probes to access this location’s coordinates.");

	//NEW TEXAS
	if(flags["NEW_TEXAS_COORDINATES_GAINED"] != undefined)
	{
		if(shipLocation != "500") addButton(5, "New Texas", flyTo, "New Texas");
		else addDisabledButton(5, "New Texas", "New Texas", "You’re already here.");
	}
	else addDisabledButton(5, "Locked", "Locked", "You have not yet learned of this location’s coordinates.");
	//POE A
	if(flags["HOLIDAY_OWEEN_ACTIVATED"] != undefined)
	{
		if(flags["POE_A_DISABLED"] == 1) addDisabledButton(6, "Poe A", "Poe A", "You probably shouldn’t go back there after your last trip to ‘The Masque.’")
		else if(shipLocation != "POESPACE") addButton(6, "Poe A", flyToPoeAConfirm);
		else addDisabledButton(6, "Poe A", "Poe A", "You’re already here.");
	}
	else addDisabledButton(6, "Locked", "Locked", "You have not yet learned of this location’s coordinates.");
	//UVETO
	if (uvetoUnlocked())
	{
		if (shipLocation != "UVS F15") addButton(7, "Uveto", flyTo, "Uveto");
		else addDisabledButton(7, "Uveto", "Uveto Station", "You’re already here.");
	}
	else addDisabledButton(7, "Locked", "Locked", "You have not yet learned of this location’s coordinates.");
	//Canadia Station
	if(canadiaUnlocked())
	{
		if (shipLocation != "CANADA1") addButton(8, "Canadia", flyTo, "Canadia");
		else addDisabledButton(8, "Canadia", "Canadia Station", "You’re already here.");
	}
	else addDisabledButton(8, "Locked", "Locked", "You have not yet learned of this location’s coordinates.");
	//Gastigoth
	if(MailManager.isEntryViewed("gastigoth_unlock"))
	{
		if(shipLocation != "K16_DOCK") addButton(9, "Gastigoth", flyTo, "Gastigoth");
		else addDisabledButton(9, "Gastigoth", "Gastigoth Station", "You’re already here!");
	}
	else addDisabledButton(9, "Locked", "Locked", "You have not learned of this location’s coordinates yet.");
	//Breedwell
	if(MailManager.isEntryViewed("breedwell_unlock"))
	{
		// PC must not be a taur, infertile or e.g. on Sterilex to choose this option before they’ve been there at all.
		if(shipLocation == "BREEDWELL_HANGAR") addDisabledButton(10, "Breedwell", "Breedwell Centre", "You’re already here.");
		else if(!CodexManager.entryViewed("Rahn")) addDisabledButton(10, "Breedwell", "Breedwell Centre", "Maybe you should read up on the rahn before traveling to this location...");
		else if(!pc.hasGenitals()) addDisabledButton(10, "Breedwell", "Breedwell Centre", "It might be a pointless journey if you have no genitals to make use of this location...");
		else if((!pc.hasVagina() || pc.fertility() <= 0) && (!pc.hasCock() || pc.virility() <= 0)) addDisabledButton(10, "Breedwell", "Breedwell Centre", "Probably unwise to check this place out whilst you’re infertile. The ad gave you the distinct impression that the Breedwell Centre was counting on you being... fruitful.");
		else if(pc.isTaur()) addDisabledButton(10, "Breedwell", "Breedwell Centre", "One of the disclaimers from the ad did stick with you: <i>“Tauric beings not supported”</i>. Gobsmacking discrimination, really.");
		else addButton(10, "Breedwell", flyTo, "Breedwell");
	}
	else addDisabledButton(10, "Locked", "Locked", "You have not learned of this location’s coordinates yet.");
	//KQ2
	if (flags["KQ2_QUEST_OFFER"] != undefined && flags["KQ2_QUEST_DETAILED"] == undefined)
	{
		addButton(11, "Kara", flyTo, "karaQuest2", "Kara", "Go see what Kara has up her sleeve.");
	}
	//Federation Quest - Taking myr to Mhega yourself - PC must have capital ship
	if (flags["FEDERATION_QUEST"] == 8 && flags["FEDERATION_QUEST_EVAC_TIMER"] + 24*60 < GetGameTimestamp() && hasCapitalShip())
	{
		addButton(11, "Remnants", fedQuestEvacuate, undefined, "Evacuate Gold Remnants", "You’re getting a beacon signal from the planet. Looks like the Gold Myr remnants, ready to be retrieved...");	
	}
	
	addButton(14, "Back", mainGameMenu);
}

public function flyTo(arg:String):void
{
	generateMapForLocation("SHIP INTERIOR");
    
	if (flags["SUPRESS TRAVEL EVENTS"] == 1)
	{
		flags["SUPRESS TRAVEL EVENTS"] = 0;
	}
	else if(!InCollection(arg, ["Poe A", "karaQuest2"]))
	{
		//Eggshit Override!
		if (pc.hasItemByClass(StrangeEgg) || pc.hasItemInStorageByClass(StrangeEgg))
		{
			//PC can preggo with it?
			//Has an open spot!
			if(pc.findEmptyPregnancySlot(0) != -1 && !pc.hasPregnancyOfType("PsychicTentacles"))
			{
				fuckingEggHatchOhFuck(arg);
				return;
			}
		}
		else if (shizzyTrapAvailable() && rand(4) == 0)
		{
			shizzySpezzOdysseyEncounter(arg);
			return;
		}
		else if (silly)
		{
			if (flags["SPACE_BEAR"] == undefined && days >= 10) 
			{
				bearMessage(arg);
				return;
			}
			if (flags["SPACE_BEAR"] == 0 && shipLocation == "TAVROS HANGAR") 
			{
				bearFlyAway(arg);
				return;
			}
		}
		//Normal message events.
		var tEvent:Function = tryProcTravelEvent(arg);
		if (tEvent != null)
		{
			incomingMessage(tEvent, arg);
			return;
		}
	}
	
	var shortTravel:Boolean = false;
	var interruptMenu:Boolean = false;
	
	clearOutput();
	
	switch(arg)
	{
		case "Tavros":
			shipLocation = "TAVROS HANGAR";
			currentLocation = "TAVROS HANGAR";
			setLocation("SHIP\nINTERIOR", rooms[shipLocation].planet, rooms[shipLocation].system);
			if(shekkaIsCrew()) flags["SHEKKA_BEEN_TAVROS"] = 1;
			flyToTavros();
			break;
		case "Mhen'ga":
			shipLocation = "SHIP HANGAR";
			currentLocation = "SHIP HANGAR";
			setLocation("SHIP\nINTERIOR", rooms[shipLocation].planet, rooms[shipLocation].system);
			flyToMhenga();
			break;
		case "Tarkus":
			shipLocation = "201";
			currentLocation = "201";
			setLocation("SHIP\nINTERIOR", rooms[shipLocation].planet, rooms[shipLocation].system);
			landOnTarkus();
			break;
		case "New Texas":
			shipLocation = "500";
			currentLocation = "500";
			setLocation("SHIP\nINTERIOR", rooms[shipLocation].planet, rooms[shipLocation].system);
			if(shekkaIsCrew()) flags["SHEKKA_BEEN_NT"] = 1;
			landOnNewTexas();
			break;
		case "Myrellion":
			shipLocation = "600";
			currentLocation = "600";
			setLocation("SHIP\nINTERIOR", rooms[shipLocation].planet, rooms[shipLocation].system);
			if(shekkaIsCrew()) flags["SHEKKA_BEEN_MYRELLION"] = 1;
			flyToMyrellion();
			break;
		case "MyrellionDeepCaves":
			shipLocation = "2I7";
			currentLocation = "2I7";
			setLocation("SHIP\nINTERIOR", rooms[shipLocation].planet, rooms[shipLocation].system);
			if(shekkaIsCrew()) flags["SHEKKA_BEEN_MYRELLION"] = 1;
			flyToMyrellionDeepCaves();
			break;
		case "ZhengShi":
			shipLocation = "ZS L50";
			currentLocation = "ZS L50";
			setLocation("SHIP\nINTERIOR", rooms[shipLocation].planet, rooms[shipLocation].system);
			landingAtZhengShi();
			interruptMenu = true;
			break;
		case "Poe A":
			shipLocation = "POESPACE";
			currentLocation = "POESPACE";
			setLocation("SHIP\nINTERIOR", rooms[shipLocation].planet, rooms[shipLocation].system);
			flyToPoeA();
			break;
		case "karaQuest2":
			shortTravel = (shipLocation == "600");
			interruptMenu = true;
			kq2TravelToKara(shortTravel);
			setLocation("SHIP\nINTERIOR", rooms[shipLocation].planet, rooms[shipLocation].system);
			break;
		case "Uveto":
			shipLocation = "UVS F15";
			currentLocation = "UVS F15";
			setLocation("SHIP\nINTERIOR", rooms[shipLocation].planet, rooms[shipLocation].system);
			if(shekkaIsCrew()) flags["SHEKKA_BEEN_UVETO"] = 1;
			interruptMenu = true;
			flyToUveto();
			break;
		case "Canadia":
			shipLocation = "CANADA1";
			currentLocation = "CANADA1";
			setLocation("SHIP\nINTERIOR", rooms[shipLocation].planet, rooms[shipLocation].system);
			flyToCanadia();
			break;
		case "Gastigoth":
			if(shipLocation == "GASTIGOTH_SPACE") shortTravel = true;
			shipLocation = "K16_DOCK";
			currentLocation = "K16_DOCK";
			setLocation("SHIP\nINTERIOR", rooms[shipLocation].planet, rooms[shipLocation].system);
			arrivalAtGastibooty();
			break;
		case "Breedwell":
			shipLocation = "BREEDWELL_HANGAR";
			currentLocation = "BREEDWELL_HANGAR";
			setLocation("SHIP\nINTERIOR", rooms[shipLocation].planet, rooms[shipLocation].system);
			interruptMenu = flyToBreedwell();
			break;
	}
	var timeFlown:Number = (shortTravel ? 30 + rand(10) : 600 + rand(30));
	if(paigeIsCrew()) timeFlown = Math.floor(timeFlown * 0.75);
	StatTracking.track("movement/time flown", timeFlown);
	processTime(timeFlown);
	
	if(pc.pluggedVaginas() > 0 || pc.isPlugged(-1))
	{
		if(pc.isPlugged(-1)) 
		{
			pc.ass.delFlag(GLOBAL.FLAG_PLUGGED);
		}
		for(var i:int = 0; i < pc.totalVaginas(); i++)
		{
			if(pc.isPlugged(i)) 
			{
				pc.vaginas[i].delFlag(GLOBAL.FLAG_PLUGGED);
			}
		}
		pc.removeStatusEffect("Pussy Plugged");
		AddLogEvent(ParseText("While you have time in travel, you grab a quick shower and <b>the hardened substance plugging you up dissolves away!</b>"));
		flags["SHOWERED_OUT_PLUG"] = 1;
		pc.shower();
	}

	if (!interruptMenu)
	{
		if(landingEventCheck(arg)) return;
		flags["LANDING_EVENT_CHECK"] = 1;
		
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	
	//Leaving the victim to sort his own shit out when starting the SpaceYakuza questline
	if (flags["SHUKUCHI_TAVROS_ENCOUNTER"] === 0) flags["SHUKUCHI_TAVROS_ENCOUNTER"] = 1;
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
public function leavePlanetOK():Boolean
{
	if(pc.hasStatusEffect("Disarmed") && shipLocation == "500") return false;
	if(pc.hasKeyItem("RK Lay - Captured")) return false;
	if(ramisOutDrinking()) return false;
	return true;
}

public function landingEventCheck(arg:String = ""):Boolean
{
	if(flags["LANDING_EVENT_CHECK"] != 1) return false;
	
	flags["LANDING_EVENT_CHECK"] = undefined;
	
	if(arg == "Mhen'ga")
	{
		if(((annoIsCrew() && flags["ANNOxSYRI_EVENT"] != undefined) || !annoIsCrew()) && syriAtBurts() && syriIsAFuckbuddy() && rand(5) == 0)
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

public function nearestMedicalCenter():String
{
	var roomID:String = currentLocation;
	var planetName:String = getPlanetName();
	
	switch(planetName)
	{
		//case "Tavros Station": roomID = "NURSERYG4"; break;
		case "Mhen'ga": roomID = "ESBETH MEDICAL OFFICE"; break;
		//case "Tarkus": roomID = ""; break;
		case "Myrellion":
			var myrLoc:int = int(currentLocation);
			if
			(	currentLocation == "GMEREHOSPITAL"
			||	currentLocation == "GENES MODS"
			||	currentLocation == "ENTITE"
			||	(myrLoc >= 700 && myrLoc < 800)
			) roomID = "GMEREHOSPITAL";
			else if
			(	currentLocation == "KRESSIA MEDICAL"
			||	currentLocation == "LIEVE BUNKER"
			||	currentLocation == "FAZIAN_RESCUE_ROOM"
			||	(myrLoc >= 800 && myrLoc < 900)
			) roomID = "KRESSIA MEDICAL";
			else roomID = (rand(2) == 0 ? "GMEREHOSPITAL" : "KRESSIA MEDICAL");
			break;
		//case "New Texas": roomID = ""; break;
		//case "Uveto": roomID = "UVI R32"; break;
		case "Kashima": roomID = "KI-H16"; break;
	}
	
	return roomID;
}

public function showerMenu(special:String = "ship"):void
{
	clearOutput();
	
	var showerInShip:Boolean = (special == "ship" && InShipInterior(pc));
	
	output("You find yourself in the " + special + "’s shower room.");
	if(showerInShip) output("\n\nNext to the shower is a medicine cabinet with various hygiene products.");
	output("\n\nWhat would you like to do?");
	
	clearMenu();
	addButton(0, "Shower", showerOptions, [0, special], "Shower", "Take a shower and wash off any sweat or grime you might have.");
	if (showerInShip || special == "nursery") addButton(1, "Cabinet", showerOptions, [1, special], "Bathroom Cabinet", "Check your bathroom’s medicine cabinet.");
	if (showerInShip && pc.lust() >= 33 && crew(true) > 0) addButton(2, "Sex", showerOptions, [2, special], "Sex", "Have some shower sex with a crew member.");
	showerDoucheToggleButton(5);
	addButton(14, "Back", showerExit);
}
public function showerDoucheToggleButton(btnSlot:int = 5):void
{
	if (pc.statusEffectv1("Anally-Filled") + pc.statusEffectv1("Vaginally-Filled") + pc.statusEffectv1("Orally-Filled") <= 0) return;
	if (pc.statusEffectv1("Shower Douche Toggle") == 1) addButton(btnSlot, "Rinse: ON", showerDoucheToggle, undefined, "Use Douche", "Clean out the fluids that have been pumped into you. Select to turn rinsing off.");
	else addButton(btnSlot, "Rinse: OFF", showerDoucheToggle, undefined, "No Douche", "Keep the fluids that are inside you for now. Select to turn rinsing on.");
}
public function showerDoucheToggle(btnSlot:int = 5):void
{
	if (!pc.hasStatusEffect("Shower Douche Toggle")) pc.createStatusEffect("Shower Douche Toggle", 0, 0, 0, 0, true, "", "", false, 0);
	pc.setStatusValue("Shower Douche Toggle", 1, (pc.statusEffectv1("Shower Douche Toggle") == 1 ? 0 : 1));
	showerDoucheToggleButton(btnSlot);
}
public function showerExit():void
{
	//pc.removeStatusEffect("Shower Douche Toggle");
	mainGameMenu();
}

public function showerOptions(arg:Array):void
{
	var showerInShip:Boolean = InShipInterior(pc);
	
	var option:int = arg[0];
	var special:String = arg[1];
	
	if(option == 0 && showerInShip && seranigansTrigger("shower")) return;
	
	clearOutput();
	clearMenu();
	var showerSex:int = 0;

	// Regular showers
	if (option == 0)
	{
		if(pc.pluggedVaginas() > 0 || pc.isPlugged(-1))
		{
			author("Nonesuch");
			flags["SHOWERED_OUT_PLUG"] = 1;
			if(pc.pluggedVaginas() > 0)
			{
				output("You step underneath the jet of hot water, letting it flow ");
				if(pc.hasHair()) output("through your [pc.hair]");
				else output("over your head");
				output(". Even here, it’s difficult to relax with your pussy plugged up like it is, the obstruction keeping you constantly aroused and frustrated. Perhaps the hot water...? You pluck the shower head from out of its fixture and angle it at your [pc.vagina]. For a moment you think nothing is going to happen - then, in a wave of relief and hollowing out, <b>the plug begins to lose its solidity, melting into fluffy blue foam</b> which easily washes away down your [pc.legs] and into the drain. You sigh with relief. At last!");
				var removed:Number = 0;
				for(var i:int = 0; i < pc.totalVaginas(); i++)
				{
					if(pc.isPlugged(i)) 
					{
						pc.vaginas[i].delFlag(GLOBAL.FLAG_PLUGGED);
						removed++;
					}
				}
				if(removed == 2) output(" <b>You tend to the other plug while you’re at it.</b>");
				if(removed > 2) output(" <b>You tend to the other plugs while you’re at it.</b>");
				if(pc.isPlugged(-1))
				{
					output(" <b>The plug in your ass vanishes as well.</b>");
					pc.ass.delFlag(GLOBAL.FLAG_PLUGGED);
				}
				pc.removeStatusEffect("Pussy Plugged");
			}
			else
			{
				output("You step underneath the jet of hot water, letting it flow ");
				if(pc.hasHair()) output("through your [pc.hair]");
				else output("over your head");
				output(". Even here, it’s difficult to relax with your ass plugged up like it is, the obstruction keeping you constantly aroused and frustrated. Perhaps the hot water...? You pluck the shower head from out of its fixture and angle it at your [pc.ass]. For a moment you think nothing is going to happen - then, in a wave of relief and hollowing out, <b>the plug begins to lose its solidity, melting into fluffy blue foam</b> which easily washes away down your [pc.legs] and into the drain. You sigh with relief. At last!");
				pc.ass.delFlag(GLOBAL.FLAG_PLUGGED);
			}
			if(pc.lust() >= 33) 
			{
				//[Masturbate] [Finish]
				output(" With the shower head where it is, perhaps you could take care of that aggravating lust now as well?");
				
				shipShowerFapButtons(showerSex);
			}
			else addButton(0, "Next", showerExit);
			return;
		}
		author("Couch");
		if(showerInShip)
		{
			output("Adventuring is fun and all, but it also leaves a [pc.guy] feeling dirty at the end of the day");
			if (pc.libido() > 50) output(", and not in the good way");
			output(". You decide to hit the showers");
		}
		else output("You decide to take a shower");
		output(", stripping off your gear with a sigh of relief as you take a moment just to stretch and enjoy being");
		if (pc.isNude()) output(" fully");
		else output(" truly");
		output(" nude.");
		output("\n\nThe water comes out");
		if(showerInShip) output(" icy cold, sending a shiver down your spine. You think to yourself that you really should spring for a better temperature regulator, carefully adjusting the dial back and forth until finding that sweet spot between freezing and scalding where the water is blissfully warm. Now you can finally relax, setting to applying");
		else output(" in perfect streams and feels blissfully warm down your spine - not too hot, and not too cold - allowing you to let loose and relax. Now that you are settled in, you apply");
		output(" a good dose of shampoo to your [pc.hair]. Your [pc.skinFurScalesNoun] comes next, your hands running up and down your front to coat every last inch in a nice thick lather.");
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
		if (pc.buttTone() >= 30 && pc.buttRating() < 4) output(", relishing the hard, taut muscles you’ve worked so hard to achieve");
		else if (pc.buttTone() < 30 && pc.buttRating() >= 10) output(", unable to resist topping it off with a good spank");
		output(".");
		
		if(pc.statusEffectv1("Shower Douche Toggle") == 1 && pc.statusEffectv1("Anally-Filled") + pc.statusEffectv1("Vaginally-Filled") + pc.statusEffectv1("Orally-Filled") > 0)
		{
			output("\n\n");
			if(pc.statusEffectv1("Anally-Filled") + pc.statusEffectv1("Vaginally-Filled") > 0)
			{
				output("You take the opportunity to relax your muscles fully, flaring your");
				if(pc.statusEffectv1("Anally-Filled") > 0 && pc.statusEffectv1("Vaginally-Filled") > 0) output(" holes");
				else if(pc.statusEffectv1("Vaginally-Filled") > 0) output(" puss" + (pc.vaginas.length == 1 ? "y" : "ies"));
				else output(" anus");
				output(" to allow the thick payload");
				if(pc.statusEffectv1("Anally-Filled") > 0 && pc.statusEffectv1("Vaginally-Filled") > 0) output("s");
				output(" you’re carrying to slowly ooze out. You whisk it all from your privates with brisk swishes of warm water, leaving yourself feeling clean and pleasantly empty. ");
			}
			if(pc.statusEffectv1("Orally-Filled") > 0) output("There’s a bottle of mouthwash in here, and you take the opportunity to flannel around your [pc.lips] before taking a swig, swilling it to one cheek then the other before spitting down the plughole. Minty fresh!");
		}
		
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
			
			shipShowerFapButtons(showerSex);
		}
		else
		{
			output("\n\nFinally you feel you’ve gotten all the relaxation you can and shut off the water, stepping out and toweling yourself off. You slip your gear on with a refreshed smile, squeaky clean and ready to resume your adventure.");
			addButton(0, "Next", showerExit);
		}
		
		pc.shower();
		processTime(10);
	}
	// Bathroom cabinet
	else if (option == 1)
	{
		output("You open the medicine cabinet and find a small collection of body hygiene and toiletry supplies.");
		
		var btnSlot:int = 0;
		
		if(pc.hasBeard()) addButton(btnSlot++, "Beard", showerCabinet, ["beard", special], "Beard", "Do something with your [pc.beardNoun].");
		if(pc.isBimbo()) addButton(btnSlot++, "Cosmétique", showerCabinet, ["cosmetique", special], "Cosmétique Magazine", "Like, read up on the latest beauty trends!");
		
		addButton(14, "Back", showerMenu, special);
	}
	// Shower sex options
	else if (option == 2)
	{
		if (annoIsCrew() && pc.hasGenitals())
		{
			addButton(showerSex, "Anno", annoFollowerShowerSex);
			showerSex++;
		}
		if (ramisIsCrew() && !looksFemaleToRamis() && flags["RAMIS_SEXED_SHIP"] != undefined)
		{
			addButton(showerSex, "Ramis", ramisBathingCats, "shower");
			showerSex++;
		}
		if (showerSex > 0) output("Feeling a little turned on, you decide that maybe you should have some fun shower sex with one of your crew. Who do you approach?");
		else output("You don’t seem to have any crew members onboard who can have shower sex with you at the moment.");
		addButton(14, "Back", showerMenu, special);
	}
}
public function shipShowerFapButtons(showerSex:int = 0):void
{
	if (pc.hasStatusEffect("Myr Venom Withdrawal")) addDisabledButton(0, "Masturbate", "Masturbate", "While you’re in withdrawal, you don’t see much point in masturbating, no matter how much your body may want it.");
	else if (!pc.canMasturbate()) addDisabledButton(0, "Masturbate", "Masturbate", "You can’t seem to masturbate at the moment....");
	else
	{
		showerSex = shipShowerFaps(true);
	}
	addButton(showerSex, "Nevermind", shipShowerFappening, "Nevermind", "Nevermind", "On second thought...");
}
public function showerCabinet(arg:Array):void
{
	clearOutput();
	clearMenu();
	
	var response:String = arg[0];
	var special:String = arg[1];
	
	switch(response)
	{
		case "beard":
			output("You pull the cabinet mirror to the side and take a good look at your [pc.beard].");
			if(!pc.hasLivingBeard())
			{
				output("\n\nWith the supplies that you have on hand, you guess you can’t do more than a shave. If you want to do anything fancier, you’ll probably have better luck visiting a stylist who specializes in fixing facial hair.");
				
				addButton(0, "Shave", showerCabinet, ["beard shave", special], "Shave", "Shave your [pc.beard].");
			}
			else
			{
				output("\n\nUnfortunately, you don’t have the supplies to manipulate your living facial hair. You’ll have to visit a specialist if you want to change it in style and length.");
			}
			
			addButton(14, "Back", showerMenu, special);
			break;
		case "beard shave":
			output("To prepare, you lather your lower face and around your [pc.lipsChaste], making sure to get the parts covered by your facial hair. You then wipe your hands dry and pull out");
			if(pc.beardLength > 0.125)
			{
				output(" a cheap wireless electric razor. Flicking a switch, the battery charges and the device hums to life.");
				output("\n\nYou spend the next ten minutes or so shaving the [pc.beardNoun] from your visage. After you you’ve got it all, you turn on the sink faucet and rinse your face and slap on some aftershave.");
				output("\n\nTaking a final look at the mirror shows that the razor could only lop off so much, so you are left with some <b>stubble decorating your face</b>. If you want to remove it all, you’ll need to shave again.");
				
				processTime(11);
				pc.beardLength = 0.050;
			}
			else
			{
				output(" an inexpensive, disposable razor. Getting in close, you slide the blade across the stubble on your face.");
				output("\n\nIt doesn’t take long, but you do find yourself having to repeat a few times in order to get rid of the rough spots. Once complete, you rub on some post-shave balm and feel the tingly, stinging sensation it leaves behind.");
				output("\n\nThe pain is worth it though. As you take a final review of your efforts, you grin. A clean shave. <b>You no longer have a beard!</b>");
				
				processTime(7);
				pc.removeBeard();
			}
			
			addButton(0, "Next", showerMenu, special);
			break;
		case "cosmetique":
			output("A mini-slate with the Cosmétique logo emblazoned on it sits next to the mirror. " + RandomInCollection([
				"<i>Ooo!</i>--maybe there’s a sexy article you can read!",
				"<i>Yay!</i> It’s your favorite magazine!",
				"<i>Hmm</i>, beauty tips and sex advice--<i>why not?!</i>",
				"It’s, like, totally the latest and greatest source for <i>glamour and glitter!</i>",
			]) + " You quickly flick on the device and page through the articles.");
			
			var cosmoList:Array = [];
			var cosmoMsg:String = "";
			
			cosmoMsg = "An article";
			if(silly) cosmoMsg += ", written by one with the handle of “Alexa Jonez”,";
			cosmoMsg += " about the dangers of low semen intake catches your attention. It reads like alarmist propaganda, running off a sprinkling of obscure facts and small case “studies”. If you didn’t know any better, you would swear the author is prophesying an end-times scenario.";
			cosmoMsg += "\n\n<i>“Like, get a grip silly lady--there’s plenty of spooge for everyone!”</i>";
			cosmoMsg += "\n\nHmm... However, if the author is right, then you’ll have to do your best to prevent the world from imminent malnutrition. You must save all the cummies!";
			cosmoList.push(cosmoMsg);
			cosmoMsg = "A strikingly beautiful image of a glamour model pops up on the page and you have to pause for a moment to soak in the view. She is a natural bombshell of a woman, yet any signs of modding only accentuates her features even more. She seems so alien yet so familiar to you.";
			cosmoMsg += "\n\n<i>“Wow, she’s gorgeous! Like a goddess!”</i> You fawn and fan-girl over the figure and set your sights on becoming just as pretty as she is.";
			cosmoMsg += "\n\nYou save the image for later; for when you need another positive motivation booster.";
			cosmoList.push(cosmoMsg);
			cosmoMsg = "A colorful chart comes into view, advertising several shades of a new lipstick line. You scroll up and down, in awe of the color combinations.";
			cosmoMsg += "\n\n<i>“Ooh, neat! I didn’t know lips can be that color!”</i> You study one that is of interest to you--one where the model’s lips are artistically covered in a thick, translucent white glaze. It looks completely oozing with life and at the same time, it’s gloss is hypnotizing to view, even at a glance. And to top it off, the lipstick has been sprinkled with a little glitter, giving it a playful shimmer. The lipstick is lusty, lewd and lively, all in one!";
			cosmoMsg += "\n\nYou tap on the bookmark icon to save it for later. This is the kind of makeup that goes with everything--especially slutwear!";
			cosmoList.push(cosmoMsg);
			cosmoMsg = "An advertisement for a heavy-duty G-spot vibrator flashes onto the page. You struggle to press the tiny ‘x’ icon in the upper corner to close the window but accidently hit the ad instead. The slate’s browser opens up and loads a video that highlights the device’s features as very enticing audio plays. You surrender to it, as it is too late to turn back now, and give the commercial a fair listen.";
			cosmoMsg += "\n\n<i>“Wow, that’s totally awesome!”</i> you remark as the incredibly erotic-looking machine transforms into a small, palmable cylinder--a shape reminiscent to that of a tube of lipstick. With a press of a button, the device shape-shifts back to its original lewd form.";
			cosmoMsg += "\n\nThe advertisement ends with an info link and you ponder if it’s something you might want to invest in the future...";
			cosmoList.push(cosmoMsg);
			cosmoMsg = "A title springs out to you: “Gains for Girls on the Go: 10 Easy Steps!”. It seems to be an article about personal fitness and diet; to move fat to the most important parts of a girl’s figure. Interesting...";
			cosmoMsg += "\n\nYou let out a loud giggle as you read. The author who wrote the piece gives very useful advice but delivers them in such a comedic manner that you can’t help but laugh at every punch line and witty comment.";
			cosmoMsg += "\n\nYour eyes almost water from the humor being thrown your way. What a great read! You’re convinced that the writer is just as enjoyable in person and would definitely like to meet her.";
			cosmoList.push(cosmoMsg);
			
			output("\n\n" + cosmoList[rand(cosmoList.length)]);
			output("\n\nAfter some time, you finish browsing the articles and ogling the images, turn off the tablet, and set it aside.");
			
			processTime(14);
			
			addButton(0, "Next", showerMenu, special);
			break;
		default:
			output("Nothing valid selected!");
			output("\n\n");
			
			addButton(0, "Next", showerMenu, special);
			break;
	}
}

public function sneakBackYouNudist():void
{
	clearOutput();
	
	var nTime:int = 0;
	
	output("You meticulously make your way back to the ship using every ounce of subtlety you possess.");
	if(currentLocation == shipLocation)
	{
		output(" Climbing back up the airlock, you");
		nTime = 5;
	}
	else if(InCollection(shipLocation, [rooms[currentLocation].northExit, rooms[currentLocation].eastExit, rooms[currentLocation].southExit, rooms[currentLocation].westExit]))
	{
		output(" Having to take your time and almost getting caught sneaking around, you finally");
		nTime = 15;
	}
	else
	{
		output(" It takes way longer than you would have thought thanks to a couple of near-misses, but you");
		nTime = (180 + rand(30));
	}
	output(" make it safe and sound to the interior of your craft.");
	
	processTime(nTime);
	
	moveTo("SHIP INTERIOR");
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function dropNewClothes():void
{
	clearOutput();
	
	output("Deciding to let consumerism solve your problem, you flip open your codex and search for a speedy clothing drop service. When you find one, you request an emergency drop and send them your current coordinates.");
	output("\n\nYou don’t need to wait long as within a few minutes a service drone hovers toward your location with a supply box filled with mystery clothes.");
	if(currentLocation == "SHIP INTERIOR") output(" You open your airlock and allow the drone to enter your ship.");
	output(" It drops the box in front of you as a yellow light near its sensors blink awaitingly. It obviously expects a payment.");
	output("\n\nYou wave your codex over the drone’s sensors and the light turns");
	
	var cost:int = 200;
	var lootList:Array = [];
	
	lootList.push(new DressClothes());
	if(!pc.hasVagina()) lootList.push(new PlainBriefs());
	else lootList.push(new PlainPanties());
	if(pc.biggestTitSize() < 1) lootList.push(new PlainUndershirt());
	else lootList.push(new PlainBra());
	
	for(var i:int = 0; i < lootList.length; i++)
	{
		cost += lootList[i].basePrice;
	}
	
	if(pc.credits <= 0)
	{
		output(" red. Your credit account is dry at the moment, of course, so this seems more like a charity drop than a business transaction. The drone makes a beeping tone of pity");
	}
	else if(pc.credits < cost)
	{
		output(" orange. You didn’t have enough to pay the full price, but your Codex shows that <b>the service took whatever you had left in your credit account</b>. Well, this better be worth the cost... The drone makes a disappointed beeping noise");
		
		pc.credits = 0;
	}
	else
	{
		output(" green. Your Codex shows that <b>the service took " + cost + " credits from your credit account</b>. Well, this better be worth the cost... The drone makes a satisfied beeping melody");
		
		pc.credits -= cost;
	}
	output(" and then buzzes away");
	if(currentLocation == "SHIP INTERIOR") output(", out of your ship, and");
	output(" into the distance.");
	output("\n\nWith your new package in hand, you open the box and take out the vaccuum-sealed contents inside. After opening each packet, you look at your new clothing items. Not an impressive spread, but at least it will keep you covered.");
	
	processTime(15);
	
	output("\n\n");
	itemCollect(lootList);
}

public function move(arg:String, goToMainMenu:Boolean = true):void
{
	//Prevent movement for nudists into nude-restricted zones.
	if(goToMainMenu && rooms[arg].hasFlag(GLOBAL.NUDITY_ILLEGAL))
	{
		var nudistPrevention:Boolean = false;
		if(!pc.isCoveredUp())
		{
			if((!pc.isChestGarbed() || pc.isChestVisible()) && pc.biggestTitSize() > 1) nudistPrevention = true;
			if(!pc.isCrotchGarbed() || ((pc.hasGenitals() || pc.balls > 0) && pc.isCrotchVisible()) || pc.isAssVisible()) nudistPrevention = true;
		}
		if(pc.hasStatusEffect("Priapism"))
		{
			// Note to self: taxi event to ship if moving in illegal area + fine.
			if(getCaughtWithPriapism()) return;
			// Note to self: disable public move restrictions.
			nudistPrevention = false;
		}
		else if(pc.canCoverSelf(true)) nudistPrevention = false;
		if(nudistPrevention)
		{
			clearOutput();
			output("Nudity is illegal in that location! You’ll have to cover up if you want to go there.");
			
			var i:int = 0;
			var chestCovered:Boolean = (pc.hasBreasts() ? false : true);
			var groinCovered:Boolean = false;
			var item:ItemSlotClass;
			
			for(i = 0; i < pc.inventory.length; i++)
			{
				item = pc.inventory[i];
				switch(item.type)
				{
					case GLOBAL.CLOTHING:
					case GLOBAL.ARMOR:
						if(!item.hasFlag(GLOBAL.ITEM_FLAG_TRANSPARENT) && !item.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !item.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST) && !item.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) && !item.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS))
						{
							chestCovered = true;
							groinCovered = true;
						}
						break;
					case GLOBAL.UPPER_UNDERGARMENT:
						if(!item.hasFlag(GLOBAL.ITEM_FLAG_TRANSPARENT) && !item.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !item.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST))
						{
							chestCovered = true;
						}
						break;
					case GLOBAL.LOWER_UNDERGARMENT:
						if(!item.hasFlag(GLOBAL.ITEM_FLAG_TRANSPARENT) && !item.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !item.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) && !item.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS))
						{
							groinCovered = true;
						}
						break;
				}
			}
			
			clearMenu();
			if(currentLocation == "SHIP INTERIOR")
			{
				// No need to sneak back if already in ship!
				for(i = 0; i < pc.ShipStorageInventory.length; i++)
				{
					item = pc.ShipStorageInventory[i];
					switch(item.type)
					{
						case GLOBAL.CLOTHING:
						case GLOBAL.ARMOR:
							if(!item.hasFlag(GLOBAL.ITEM_FLAG_TRANSPARENT) && !item.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !item.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST) && !item.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) && !item.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS))
							{
								chestCovered = true;
								groinCovered = true;
							}
							break;
						case GLOBAL.UPPER_UNDERGARMENT:
							if(!item.hasFlag(GLOBAL.ITEM_FLAG_TRANSPARENT) && !item.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !item.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST))
							{
								chestCovered = true;
							}
							break;
						case GLOBAL.LOWER_UNDERGARMENT:
							if(!item.hasFlag(GLOBAL.ITEM_FLAG_TRANSPARENT) && !item.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !item.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) && !item.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS))
							{
								groinCovered = true;
							}
							break;
					}
				}
			}
			else
			{
				output("\n\nYou can try your luck and sneak back to your ship if you are daring...");
				addButton(0, "SneakBack", sneakBackYouNudist, undefined, "SneakBack", "Sneak back to the ship. Fuckin’ prudes. It might take you a couple hours to get back safely.");
			}
			if(!chestCovered || !groinCovered)
			{
				output("\n\nDue to your lack of coverage, you can call for an emergency clothing drop to help with your situation--though it may cost you some credits if you choose to do so.");
				addButton(1, "Help!", dropNewClothes, undefined, "Emergency Clothing Drop", "Call a drone to retrieve a new set of clothes.");
			}
			addButton(14, "Back", mainGameMenu);
			return;
		}
	}
	//Reset the thing that disabled encounters
	flags["ENCOUNTERS_DISABLED"] = undefined;
	
	//Procs on approaching ship dock:
	if (arg == shipLocation)
	{
		if(currentLocation != "SHIP INTERIOR")
		{
			if(goToMainMenu && !disableExploreEvents() && seranigansTrigger("hijacked")) return;
			if(flags["SERA_QUIT_SMOKING"] == undefined && flags["SERA_PREGNANCY_TIMER"] >= 24) eventQueue.push(seraPregQuitSmoking);
		}
	}
	
	//Procs on ship enter:
	if (arg == "SHIP INTERIOR")
	{
		// Lane follower hook
		if (flags["LANE_FULLY_HYPNOTISED_DAY"] != undefined && flags["FOLLOWER_LANE_INTERVENTION"] == undefined)
		{
			tryFollowerLaneIntervention();
		}
		// Goo Armor hook
		if (flags["ANNO_NOVA_UPDATE"] == 2)
		{
			eventQueue.push(grayGooArrivesAtShip);
		}
		// Azra follower greeting
		if(flags["AZRA_RECRUITED"] == 1 && azraIsCrew())
		{
			eventQueue.push(azraInShipGreeting);
		}
		//Paige follower greeting
		if(paigeIsCrew() && flags["PAIGE_SHIP_GREETING"] == undefined) 
		{
			eventQueue.push(firstTimePaigeCrewHiHi);
		}
		//Kase follower greeting
		if(kaseIsCrew() && flags["KASE_CREW"] == 1)
		{
			eventQueue.push(kaseCrewGreeting);
		}
		//Anno/Erra Threesome
		if((pc.hasCock() || pc.hasHardLightStrapOn()) && annoIsCrew() && flags["ANNO_OWNS_LIGHT_STRAPON"] != undefined && erraAvailableForThreesome() && !pc.hasStatusEffect("Anno-Erra Cooldown") && rand(5) == 0)
		{
			eventQueue.push(annoxErraIntro);
		}
		//Shekka/Anno shit
		if(pc.hasGenitals() && annoIsCrew() && shekkaIsCrew() && flags["SHEKKA_ANNO_NERDOFF"] == undefined && rand(4) == 0)
		{
			eventQueue.push(shekkaAndAnnoNerdOff);
		}
	}
	
	//Procs on ship exit:
	if(currentLocation == "SHIP INTERIOR")
	{
		//Procs in safe areas only, like Reaha's milk stand:
		if(!rooms[arg].hasFlag(GLOBAL.HAZARD))
		{
			if(reahaIsCrew() && !reahaAddicted() && rand(5) == 0) eventQueue.push(reahaMilkStand);
		}
	}

	//Waterfall stuff.
	if(goToMainMenu && rooms[arg].hasFlag(GLOBAL.WATERFALL))
	{
		pc.energy(-6);
		if(arg == "8. RED ROCK SCREE" && currentLocation == "7. DRIFTWOOD SHOULDER")
		{
			if(flags["PQ_NALEENED"] == undefined) 
			{
				if(driftwoodShoulderDoofiness()) return;
			}
		}
		if(pc.energy() <= 0)
		{
			pcDunFallsOffDatHill();
			return;
		}
	}

	var moveMinutes:int = rooms[currentLocation].moveMinutes;
	//Moveable immobilization adds more minutes!
	moveMinutes += immobilizedUpdate(true);
	//Huge nuts slow you down
	if(pc.hasStatusEffect("Egregiously Endowed")) moveMinutes *= 2;
	if(pc.hasItemByClass(DongDesigner)) moveMinutes *= 2;
	if (pc.hasPowerArmorItem() && !pc.inPowerArmor()) moveMinutes *= 2;
	//Getting a beat-down from the mafia slows you down too
	if (pc.hasStatusEffect("Brutalized")) moveMinutes *= 2;
	if (rand(2) == 0)
	{
		if (pc.hasStatusEffect("Stinging Bruises")) pc.HP(pc.statusEffectv1("Stinging Bruises"));
		if (pc.hasStatusEffect("Lash Marks")) pc.HP(pc.statusEffectv1("Lash Marks"));
	}
	//Things that make you go fastah!
	//Nogwitch is fastest mount atm.
	if(pc.accessory is NogwichLeash) moveMinutes = (moveMinutes >= 3 ? Math.floor(moveMinutes/3) : moveMinutes-1);
	//Hoverboard & Kordiiaks cuts time in half-ish.
	else if(pc.hasItemByClass(Hoverboard) || pc.accessory is KordiiakLeash) moveMinutes = (moveMinutes > 2 ? Math.floor(moveMinutes/2) : moveMinutes-1);
	//Grunch reduce by 25%
	else if(pc.accessory is GrunchLeash) moveMinutes = (moveMinutes > 4 ? Math.floor(moveMinutes * .75) : moveMinutes-1);
	//Not sure who put this in, but I hate it. Tentacles aren't an optimal mode of movement. Reducing to -1;
	else if(pc.legType == GLOBAL.TYPE_TENTACLE && pc.hasLegFlag(GLOBAL.FLAG_AMORPHOUS)) moveMinutes--;
	
	if(moveMinutes < 0) moveMinutes = 0;
	StatTracking.track("movement/time travelled", moveMinutes);
	processTime(moveMinutes);
	moveTo(arg, true);
	if(pc.hasStatusEffect("Treatment Exhibitionism Gain 4 DickGirls") && pc.hasCock() && rooms[arg].hasFlag(GLOBAL.PUBLIC)) treatmentCumCowExhibitionism();
	if(pc.hasPerk("Ultra-Exhibitionist")) exhibitionismLocationToggle();
	trace("Printing map for " + currentLocation);
	//mapper.printMap(map);
	//process time here, then back to mainGameMenu!
	if(goToMainMenu) mainGameMenu(moveMinutes);
}
// Place PC and update map!
// No time or event triggers.
public function moveTo(arg:String, logPrevious:Boolean = false):void
{
	if(logPrevious) flags["PREV_LOCATION"] = currentLocation;
	currentLocation = arg;
	generateMap();
}

public function variableRoomUpdateCheck():void
{
	/* TAVROS STATION */
	
	//Merchant Deck
	// Acquisitions
	if(sentientAcquisitionsIsOpen()) rooms["ACQUISITIONS"].addFlag(GLOBAL.NPC);
	else rooms["ACQUISITIONS"].removeFlag(GLOBAL.NPC);
	// Sera's Shop
	if(darkChrysalisIsOpen()) rooms["DARK CHRYSALIS"].addFlag(GLOBAL.COMMERCE);
	else rooms["DARK CHRYSALIS"].removeFlag(GLOBAL.COMMERCE);
	//Residental Deck
	//Notices
	if(tavrosRDActiveNotice()) rooms["RESIDENTIAL DECK 2"].addFlag(GLOBAL.OBJECTIVE);
	else rooms["RESIDENTIAL DECK 2"].removeFlag(GLOBAL.OBJECTIVE);
	//Place Aina's NPC flag depending whenever or not the PC meet her + generate her room
	if(flags["HELPED_AINA"] == undefined) 
	{ 
		rooms["RESIDENTIAL DECK 15"].addFlag(GLOBAL.NPC);
		lockAinasRoom();
	}
	else if(flags["HELPED_AINA"] == true)
	{ 
		rooms["RESIDENTIAL DECK 15"].removeFlag(GLOBAL.NPC);
		unlockAinasRoom();
	}
	else
	{
		rooms["RESIDENTIAL DECK 15"].removeFlag(GLOBAL.NPC);
		lockAinasRoom();
	}
	//Paige's place/yoga:
	paigeRoomsUpdate();
	//Place/remove Semith's NPC flag from chess area based on time and if pc played with him already
	if (hours >= 12 && hours <= 17) rooms["RESIDENTIAL DECK 7"].addFlag(GLOBAL.NPC);
	else rooms["RESIDENTIAL DECK 7"].removeFlag(GLOBAL.NPC);
	//Place/remove Semith's NPC flag from his apartment based on time.
	if (hours > 17) rooms["RESIDENTIAL DECK SEMITHS APARTMENT"].addFlag(GLOBAL.NPC);
	else rooms["RESIDENTIAL DECK SEMITHS APARTMENT"].removeFlag(GLOBAL.NPC);
	//Zheniya's schedule
	if (zilCallgirlAtNursery())
	{
		rooms["ANON'S BOARD HALL"].removeFlag(GLOBAL.OBJECTIVE);
		if (hours >= 8 && hours <= 16) rooms["RESIDENTIAL DECK ZHENIYA"].removeFlag(GLOBAL.NPC);
		else rooms["RESIDENTIAL DECK ZHENIYA"].addFlag(GLOBAL.NPC);
	}
	else if(flags["SAENDRA_XPACK1_STATUS"] >= 8)
	{
		if(zilCallgirlAvailable()) rooms["ANON'S BOARD HALL"].addFlag(GLOBAL.OBJECTIVE);
		else rooms["ANON'S BOARD HALL"].removeFlag(GLOBAL.OBJECTIVE);
	}
	//Nursery
	if (flags["BRIGET_MET"] == undefined || (hours >= 7 && hours <= 16))
	{
		rooms["NURSERYE14"].addFlag(GLOBAL.NPC);
		rooms["NURSERYG8"].removeFlag(GLOBAL.NPC);
	}
	else
	{
		rooms["NURSERYE14"].removeFlag(GLOBAL.NPC);
		rooms["NURSERYG8"].addFlag(GLOBAL.NPC);
	}
	if(seraAtNursery() || riyaAtNursery()) rooms["NURSERYG12"].addFlag(GLOBAL.NPC);
	else rooms["NURSERYG12"].removeFlag(GLOBAL.NPC);
	
	if((hours < 4 || hours >= 12) && !pc.hasStatusEffect("Liamme Disabled")) 
	{
		rooms["RESIDENTIAL DECK 12"].addFlag(GLOBAL.NPC);
	}
	else rooms["RESIDENTIAL DECK 12"].removeFlag(GLOBAL.NPC);
	if(flags["MET_GIL"] != undefined)
	{
		rooms["9017"].addFlag(GLOBAL.NPC);
	}
	else rooms["9017"].removeFlag(GLOBAL.NPC);
	// Fisi
	if(fisiAtResDeck()) 
	{
		rooms["RESIDENTIAL DECK 5"].addFlag(GLOBAL.NPC);
	}
	else rooms["RESIDENTIAL DECK 5"].removeFlag(GLOBAL.NPC);
	// Riya
	if(flags["MET_RIYA"] != undefined && riyaAtNursery())
	{
		rooms["CANADA4"].removeFlag(GLOBAL.NPC);
		rooms["9008"].removeFlag(GLOBAL.NPC);
	}
	else if(riyaOnCanada())
	{
		//Riya isnt there:
		if(pc.hasStatusEffect("RIYA_CANADIA_CD"))
		{
			rooms["CANADA4"].removeFlag(GLOBAL.NPC);
		}
		//She there but no flag! FIIXXXX
		else rooms["CANADA4"].addFlag(GLOBAL.NPC);
		rooms["9008"].removeFlag(GLOBAL.NPC);
	}
	else
	{
		//Riya is there:
		if(!pc.hasStatusEffect("RIYA_CANADIA_CD"))
		{
			rooms["9008"].addFlag(GLOBAL.NPC);
		}
		//Riya not there:
		else rooms["9008"].removeFlag(GLOBAL.NPC);
		rooms["CANADA4"].removeFlag(GLOBAL.NPC);
	}
	if(flags["KASE_CREW"] == 0 && !rooms["RESIDENTIAL DECK KASES APARTMENT"].hasFlag(GLOBAL.NPC)) rooms["RESIDENTIAL DECK KASES APARTMENT"].addFlag(GLOBAL.NPC);
	else if(flags["KASE_CREW"] != 0 && rooms["RESIDENTIAL DECK KASES APARTMENT"].hasFlag(GLOBAL.NPC)) rooms["RESIDENTIAL DECK KASES APARTMENT"].removeFlag(GLOBAL.NPC);
	// Temp housing
	if(nurserySpareApptIsOccupied()) rooms["NURSERYI6"].addFlag(GLOBAL.OBJECTIVE);
	else rooms["NURSERYI6"].removeFlag(GLOBAL.OBJECTIVE);
	//Akane & Shukuchi
	if (akaneCeleritasVeritasAvailable() || akaneLairAvailable()) rooms["110"].addFlag(GLOBAL.NPC);
	else rooms["110"].removeFlag(GLOBAL.NPC);
	if (flags["SHUKUCHI_TAVROS_ENCOUNTER"] === 0) rooms["9013"].addFlag(GLOBAL.NPC);
	else rooms["9013"].removeFlag(GLOBAL.NPC);
	
	/* MHENGA */
	
	//Bounties
	if(mhengaActiveBounty()) rooms["ESBETH'S NORTH PATH"].addFlag(GLOBAL.OBJECTIVE);
	else
	{
		rooms["ESBETH'S NORTH PATH"].removeFlag(GLOBAL.OBJECTIVE);
		// Pyrite Satellite Quest
		if(flags["SATELLITE_QUEST"] == 1 || flags["SATELLITE_QUEST"] == -1) rooms["ESBETH'S NORTH PATH"].addFlag(GLOBAL.NPC);
		else rooms["ESBETH'S NORTH PATH"].removeFlag(GLOBAL.NPC);
	}
	//Yakuza things
	if (flags["SHUKUCHI_TAVROS_ENCOUNTER"] != undefined && flags["SHUKUCHI_MHENGA_ENCOUNTER"] == undefined) rooms["NORTHWEST ESBETH"].addFlag(GLOBAL.NPC);
	else rooms["NORTHWEST ESBETH"].removeFlag(GLOBAL.NPC);
	//Azra stuff
	if(azraRecruited() && !azraIsCrew()) rooms["NORTHEAST ESBETH"].addFlag(GLOBAL.NPC);
	else rooms["NORTHEAST ESBETH"].removeFlag(GLOBAL.NPC);
	//Kelly's work - close/open Xenogen Biotech.
	//Open up shop: link room
	if(hours >= 6 && hours < 17) 
	{
		rooms["SOUTH ESBETH 2"].northExit = "KELLY'S OFFICE";
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
	}
	//Filling Burt's back end
	//Kally not at work or incesty zil
	if ((hours < 6 || hours >= 17) || zilTwinsAtBar())
		rooms["BURT'S BACK END"].addFlag(GLOBAL.NPC);
	else rooms["BURT'S BACK END"].removeFlag(GLOBAL.NPC);
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
	// Xenogen Camp
	if(flags["CLEARED_XENOGEN_CAMP_BODIES"] != undefined) rooms["ABANDONED CAMP"].addFlag(GLOBAL.BED);
	else rooms["ABANDONED CAMP"].removeFlag(GLOBAL.BED);
	// Visited Thare Plantation
	if(flags["THARE_MANOR_ENTERED"] != undefined && flags["PQ_P_BURNED"] == undefined) rooms["THARE MANOR"].addFlag(GLOBAL.OBJECTIVE);
	else rooms["THARE MANOR"].removeFlag(GLOBAL.OBJECTIVE);
	// Waterfall Taxi
	if(flags["WATERFALL_TAXI_RELAY"] != undefined) rooms["2. WATERFALL POOL"].removeFlag(GLOBAL.TAXI);
	else rooms["2. WATERFALL POOL"].removeFlag(GLOBAL.TAXI);
	// Pyrite Satellite Quest
	if(pyriteSatelliteLocationUnlocked())
	{
		if(rooms["A TURNING POINT"].eastExit == "") rooms["A TURNING POINT"].eastExit = "CRASHYMCSATELLITEFACE";
	}
	else if(rooms["A TURNING POINT"].eastExit != "") rooms["A TURNING POINT"].eastExit = "";
	if(pyriteSatelliteIntroActive()) rooms["JUNGLE EDGE"].addFlag(GLOBAL.NPC);
	else rooms["JUNGLE EDGE"].removeFlag(GLOBAL.NPC);
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
	//FedQuest Myr Colony on Mhenga - exclude 8 as this means PC still needs to drop them off
	if(flags["FEDERATION_QUEST"] >= 7 && flags["FEDERATION_QUEST"] != 8)
	{
		//PC dropped them off themself
		if(flags["FEDERATION_QUEST"] == 10)
		{
			//It's been 2 days
			if(flags["FEDERATION_QUEST_EVAC_TIMER"]+2*24*60 < GetGameTimestamp())
			{
				myrOnMhenga(true);
				rooms["WEST ESBETH 1"].westExit = "GOLD MYR EMBASSY";
			}
			else rooms["WEST ESBETH 1"].westExit = "";
		}
		//Someone else dropped them off and it's been 3 days
		else if(flags["FEDERATION_QUEST_EVAC_TIMER"]+3*24*60 < GetGameTimestamp())
		{
			myrOnMhenga(true);
			rooms["WEST ESBETH 1"].westExit = "GOLD MYR EMBASSY";
		}
		else rooms["WEST ESBETH 1"].westExit = "";
	}
	else rooms["WEST ESBETH 1"].westExit = "";
	
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
	// Stellar Tether Mitzi
	if(flags["MITZI_RESCUED"] == undefined) rooms["364"].addFlag(GLOBAL.NPC);
	else rooms["364"].removeFlag(GLOBAL.NPC);
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
	if(flags["DR_BADGER_TURNED_IN"] != undefined)
	{
		rooms["304"].removeFlag(GLOBAL.NPC);
		//rooms["209"].northExit = "";
	}
	else
	{
		rooms["304"].addFlag(GLOBAL.NPC);
		//rooms["209"].northExit = "304";
	}
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
	// Gianna
	if (giannaAWOL()) rooms["512"].removeFlag(GLOBAL.NPC);
	else rooms["512"].addFlag(GLOBAL.NPC);
	// Busky
	if(hours >= 6 && hours < 17) rooms["STRAPS"].addFlag(GLOBAL.COMMERCE);
	else rooms["STRAPS"].removeFlag(GLOBAL.COMMERCE);
	//Brandy (she is in bar from 2 to 6
	if (hours >= 2 && hours <= 5 && flags["BRANDY_RELATIONSHIP"] == 1 && flags["MET_SALLY"] != undefined && !pc.hasStatusEffect("Brandy Sally Timer")) rooms["505.75"].removeFlag(GLOBAL.NPC);
	else rooms["505.75"].addFlag(GLOBAL.NPC);
	
	
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
	/*
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
	*/
	//THE ENTITE
	if (entiteAvailable())
	{
		rooms["720"].northExit = "ENTITE";
	}
	else
	{
		rooms["720"].northExit = "";
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
	// Liriel's Lemonade Stand
	if (flags["LIRIEL_MET"] != undefined && lirielStandActiveHours())
	{
		rooms["706"].addFlag(GLOBAL.NPC);
	}
	else
	{
		rooms["706"].removeFlag(GLOBAL.NPC);
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
	if(flags["UNLOCKED_TAIVRAS_GATE"] == undefined && flags["KING_NYREA"] == undefined) rooms["2G15"].southExit = "";
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
	// Quadomme locations
	markersBothriocQuadomme();
	// Bothrioc Embassy
	if(flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_FAILURE && flags["BOTHRIOC_EMBASSY_ENTERED"] >= 2) rooms["BOTHRIOC EMBASSAY"].removeFlag(GLOBAL.NPC);
	else rooms["BOTHRIOC EMBASSAY"].addFlag(GLOBAL.NPC);
	// KQuest
	kquest2RoomStateUpdater();
	if (flags["KQ2_MYRELLION_STATE"] == 2)
	{
		rooms["2I7"].removeFlag(GLOBAL.TAXI);
		rooms["2I7"].addFlag(GLOBAL.SHIPHANGAR);
	}
	else
	{
		rooms["2I7"].removeFlag(GLOBAL.SHIPHANGAR);
		rooms["2I7"].addFlag(GLOBAL.TAXI);
	}
	//Federation Quest
	if(flags["SELLERA_DENIED"] != undefined && (GetGameTimestamp() < flags["SELLERA_DENIED"] + 60*48))
	{
		rooms["LIEVE BUNKER"].removeFlag(GLOBAL.NPC);
	}
	else if(flags["FEDERATION_QUEST"] == 1)
	{
		rooms["LIEVE BUNKER"].removeFlag(GLOBAL.NPC);
		rooms["803"].addFlag(GLOBAL.OBJECTIVE);
	}
	else if(pc.hasStatusEffect("Lieve Disabled"))
	{
		rooms["LIEVE BUNKER"].removeFlag(GLOBAL.NPC);
		rooms["803"].removeFlag(GLOBAL.OBJECTIVE);
	}
	else
	{
		rooms["LIEVE BUNKER"].addFlag(GLOBAL.NPC);
		rooms["803"].removeFlag(GLOBAL.OBJECTIVE);
	}

	/* ZHENG SHI */

	if(rooms["ZSM U2"].hasFlag(GLOBAL.NPC) && flags["MAIKE_SLAVES_RELEASED"] != undefined) rooms["ZSM U2"].removeFlag(GLOBAL.NPC);
	else if(!rooms["ZSM U2"].hasFlag(GLOBAL.NPC) && flags["MAIKE_SLAVES_RELEASED"] == undefined) rooms["ZSM U2"].addFlag(GLOBAL.NPC);
	 
	/* UVETO */
	
	// Huskar Bimbos
	if(uvetoStationLoungeHuskarBimboActive())
	{
		rooms["UVS B7"].addFlag(GLOBAL.NPC);
	}
	else
	{
		rooms["UVS B7"].removeFlag(GLOBAL.NPC);
	}
	// Shade Lover letter and home stuff
	if(MailManager.isEntryViewed("letter_from_shade") && flags["SHADE_ON_UVETO"] == 2 && shadeIsLover() && (shadeIsSiblings() || hours >= 16))
	{
		rooms["UVI P30"].addFlag(GLOBAL.OBJECTIVE);
	}
	else if(flags["SHADE_ON_UVETO"] >= 3 && (shadeIsHome() || astraIsHome()))
	{
		rooms["UVI P30"].addFlag(GLOBAL.NPC);
	}
	else
	{
		rooms["UVI P30"].removeFlag(GLOBAL.OBJECTIVE);
		rooms["UVI P30"].removeFlag(GLOBAL.NPC);
	}
	// Carbonado
	if(carbonadoActiveHours()) rooms["UVS A9"].addFlag(GLOBAL.COMMERCE);
	else rooms["UVS A9"].removeFlag(GLOBAL.COMMERCE);
	// Steele Med
	if(steeleBiomedBusinessHours()) rooms["UVI H36"].addFlag(GLOBAL.NPC);
	else rooms["UVI H36"].removeFlag(GLOBAL.NPC);
	//Syri at Freezer and H34
	if (syriAtFreeezer()) rooms["UVI R32"].addFlag(GLOBAL.NPC);
	else rooms["UVI R32"].removeFlag(GLOBAL.NPC);
	if (flags["SYRIQUEST_STATE"] == 3) rooms["UVI H34"].addFlag(GLOBAL.NPC);
	else rooms["UVI H34"].removeFlag(GLOBAL.NPC);
	// Pippa's house
	if (flags["PIPPA_RECRUITED"] == 1)
	{
		rooms["PIPPA HOUSE"].removeFlag(GLOBAL.NPC);
	}
	else
	{
		rooms["PIPPA HOUSE"].addFlag(GLOBAL.NPC);
	}
	// Yakuza people
	if (flags["SHUKUCHI_MHENGA_ENCOUNTER"] != undefined && flags["SHUKUCHI_UVETO7_ENCOUNTER"] == undefined) rooms["UVI N34"].addFlag(GLOBAL.NPC);
	else rooms["UVI N34"].removeFlag(GLOBAL.NPC);
	// Princess Ula Location
	if(flags["ULA_CAVE"] != undefined)
	{
		if(flags["ULA_SAVED"] == undefined)
		{
			if(flags["ULA_LEAVE_TIMER"] == undefined || flags["ULA_LEAVE_TIMER"] + 60*24*2 > GetGameTimestamp()) rooms[flags["ULA_CAVE"]].addFlag(GLOBAL.NPC);
			else rooms[flags["ULA_CAVE"]].removeFlag(GLOBAL.NPC);
			rooms["KORGII B14"].removeFlag(GLOBAL.OBJECTIVE);
		}
		else
		{
			rooms[flags["ULA_CAVE"]].removeFlag(GLOBAL.NPC);
			rooms["KORGII B14"].addFlag(GLOBAL.OBJECTIVE);
		}
	}
	else
	{
		rooms["UVIP R36"].removeFlag(GLOBAL.NPC);
		rooms["UVIP D22"].removeFlag(GLOBAL.NPC);
		rooms["UVIP J18"].removeFlag(GLOBAL.NPC);
		rooms["UVGR K20"].removeFlag(GLOBAL.NPC);
		rooms["KORGII B14"].removeFlag(GLOBAL.OBJECTIVE);
	}
	if(flags["LUND_FUCKED_OFF"] == undefined && !rooms["KORGII F8"].hasFlag(GLOBAL.NPC)) rooms["KORGII F8"].addFlag(GLOBAL.NPC);
	else if(flags["LUND_FUCKED_OFF"] != undefined && rooms["KORGII F8"].hasFlag(GLOBAL.NPC)) rooms["KORGII F8"].removeFlag(GLOBAL.NPC);
	//Myrna
	if(isChristmas())
	{
		if(flags["MET_MYRNA"] != undefined && !rooms["UVIP T44"].hasFlag(GLOBAL.OBJECTIVE)) rooms["UVIP T44"].addFlag(GLOBAL.OBJECTIVE);
	}
	//Remove marker after xmas
	else if(rooms["UVIP T44"].hasFlag(GLOBAL.OBJECTIVE)) rooms["UVIP T44"].removeFlag(GLOBAL.OBJECTIVE);
	//Vark's cave and stuff
	rooms[varkCaveRoom].removeFlag(GLOBAL.NPC);
	rooms[varkCaveRoom].removeFlag(GLOBAL.OBJECTIVE);
	rooms["UVIP T44"].southExit = varkCaveRoom;
	if (pc.isTaur() || !pc.hasGenitals())
		rooms["UVIP T44"].southExit = undefined;
	if (flags["MET_VARK"] == undefined) rooms[varkCaveRoom].addFlag(GLOBAL.OBJECTIVE);
	else if (flags["MET_VARK"] == 1) rooms[varkCaveRoom].addFlag(GLOBAL.NPC);
	else rooms["UVIP T44"].southExit = undefined;
	
	/* VESPERIA / CANADIA STATION */
	/*
	if(flags["KALLY_FAP_2_KIRO"] != undefined)
	{
		rooms["CANADA7"].eastExit = "CANADA8";
	}
	else rooms["CANADA7"].eastExit = "";
	*/
	//Ushamee Corridor
	if (MailManager.isEntryViewed("ushamee_meet") && flags["USHA_MET3"] == undefined)
	{
		rooms["CANADA3"].addFlag(GLOBAL.NPC);
	}
	else rooms["CANADA3"].removeFlag(GLOBAL.NPC);

	/* MISC */
	
	// Kiro's Airlock
	kirosShipAirlockUpdate();
	// Phoenix Location
	phoenixSetMapState();
	// Phoenix's Rec Room
	phoenixRecRoomUpdate();
	// Shizuya's Great Majin
	majinUpdate(false);
	// Kashima
	if(flags["KI_ESCAPE_UNCURED"] != undefined)
	{
		rooms["KI-E23"].removeFlag(GLOBAL.LIFTDOWN);
		rooms["KI-E23"].addFlag(GLOBAL.HAZARD);
	}
	else
	{
		rooms["KI-E23"].addFlag(GLOBAL.LIFTDOWN);
		rooms["KI-E23"].removeFlag(GLOBAL.HAZARD);
	}
	//Akkadi Lab from SyriQuest
	if (flags["SYRIQUEST_STATE"] != undefined)
	{
		if (flags["SYRIQUEST_POWER_STATE"] >= 2) rooms["AKD M23"].removeFlag(GLOBAL.OBJECTIVE);
		else rooms["AKD M23"].addFlag(GLOBAL.OBJECTIVE);
		if (flags["MET_SCHORA"] >= 3 || rooms["SYRIQUEST_STATE"] >= 8) rooms["AKD E9"].removeFlag(GLOBAL.NPC);
		else rooms["AKD E9"].addFlag(GLOBAL.NPC);
		if (flags["SYRIQUEST_CALNOR_ICON"] == 1 && flags["SYRIQUEST_VALDEN_BODY_CHOICE"] != 1) rooms["AKD S17"].addFlag(GLOBAL.NPC);
		else rooms["AKD S17"].removeFlag(GLOBAL.NPC);
		if (flags["SYRIQUEST_STATE"] == 5)
		{
			rooms["AKD S15"].addFlag(GLOBAL.OBJECTIVE);
			rooms["AKD M27"].removeFlag(GLOBAL.OBJECTIVE);
			rooms["AKD K25"].removeFlag(GLOBAL.LIFTUP);
			rooms["AKD K25"].addFlag(GLOBAL.LIFTDOWN);
		}
		else
		{
			rooms["AKD S15"].removeFlag(GLOBAL.OBJECTIVE);
			rooms["AKD M27"].addFlag(GLOBAL.OBJECTIVE);
			rooms["AKD K25"].addFlag(GLOBAL.LIFTUP);
			rooms["AKD K25"].removeFlag(GLOBAL.LIFTDOWN);
		}
		if (flags["SYRIQUEST_STATE"] == 8 || flags["SYRIQUEST_STATE"] == 9) rooms["AKD Q17"].addFlag(GLOBAL.NPC);
		else rooms["AKD Q17"].removeFlag(GLOBAL.NPC);
			
	}
}

public function processTime(deltaT:uint, doOut:Boolean = true):void
{
	for (var prop:String in chars)
	{
		chars[prop].processTime(deltaT, doOut);
	}
	
	PregnancyManager.updatePregnancyStages(chars, deltaT);
	
	// There are some further optimizations that could be done here;
	// Many events are split into "per minute", "per hour", or "per day" - deltas for each could be calculated once
	// here, and then passed down. I would not suggest restructuring these into processMinuteEvents() or the like,
	// because the order the events are processed may become important, so maintaining a relatively simplistic way
	// to change the order of things happening across deltaT time may be useful.
	
	var nextTimestamp:uint = (GetGameTimestamp() + deltaT);
	var totalDays:uint = (nextTimestamp / 1440) - days;
	
	processUvetoWeather(deltaT, doOut);
	processRenvraMessageEvents(deltaT, doOut);
	processQueenOfTheDeepMessageEvents(deltaT, doOut);
	processTarkusBombTimerEvents(deltaT, doOut);
	processKQ2NukeEvents(deltaT, doOut);
	processDaneCoordEvents(deltaT, doOut);
	processTaivrasPregnancyState(deltaT, doOut);
	processShadeEvents(deltaT, doOut);
	processGiannaEvents(deltaT, doOut);
	processTreatmentEvents(deltaT, doOut);
	processKiroBarEvents(deltaT, doOut);
	processSaendraEvents(deltaT, doOut, totalDays);
	processLetsFapUpdates(deltaT, doOut);
	processShekkaEvents(deltaT, doOut);
	processFlahneEvents(deltaT, doOut);
	processAnnoEvents(deltaT, doOut);
	processAlissEvents(deltaT, doOut);
	processPennyEvents(deltaT, doOut);
	processSeraEvents(deltaT, doOut, totalDays);
	processRiyaEvents(deltaT, doOut);
	processReahaEvents(deltaT, doOut, totalDays);
	processGobblesEvents(deltaT, doOut);
	processIrelliaEvents(deltaT, doOut);
	processOmniSuitEvents(deltaT, doOut); // Dependant on Libido changes, might need to be refactored to support jumping between states directly
	processCarryTrainingEvents(deltaT, doOut);
	processNessaEvents(deltaT, doOut);
	processCuntTailEggs(deltaT, doOut);
	processDrBadgerEvents(deltaT, doOut);
	varmintDisappearChance(deltaT, doOut);
	processEmmyEvents(deltaT, doOut, totalDays);
	processZheniyaEvents(deltaT, doOut, totalDays);
	processHLPantyShit();
	processSubTunerShit();
	processHardlightAGThongBlurbs(deltaT, doOut);
	processGastigothPregEvents(deltaT, doOut, totalDays);
	processFrostwyrmPregEvents(deltaT, doOut, totalDays);
	
	
	// Per-day events
	if (totalDays >= 1)
	{
		processHolidayoweenEvents(deltaT, doOut, totalDays);
		processHoneyPotMods(deltaT, doOut, totalDays);
		processNewTexasEvents(deltaT, doOut, totalDays);
		processOryxxEvents(deltaT, doOut, totalDays);
		processVenusPitcherEvents(deltaT, doOut, totalDays);
		processRaskvelEvents(deltaT, doOut, totalDays);
		processMyrPregEvents(deltaT, doOut, totalDays);
		thollumYardMushroomGrow();
		laneHandleCredits(totalDays);
		updateBothriocAddiction(totalDays);
		geneSubmissionLevelDecay(totalDays);
		seraBitcheningStoreInventory(totalDays);
		seraOnTavrosObedience(totalDays);
		processGastigothEvents();
		breedwellTryUnlock();
		processElliePregEvents(deltaT, doOut, totalDays);
		processIlariaPregEvents(deltaT, doOut, totalDays);
		processFZilPregEvents(deltaT, doOut, totalDays);
		processQuinnPregEvents(deltaT, doOut, totalDays);
		processUlaPregEvents(deltaT, doOut, totalDays);
		processBothriocQuadommeEvents(deltaT, doOut, totalDays);
		//9999 processQuaellePregEvents(deltaT, doOut, totalDays);
	}
	
	var totalHours:uint = Math.floor((minutes + deltaT) / 60);
	
	if (!pc.hasStatusEffect("Milk Paused")) lactationUpdateHourTick(totalHours);
	
	processMimbranesTime(deltaT, doOut, totalDays);
	processLeithaCharmTime(deltaT, doOut);
	processLaneDetoxEvents(deltaT);
	
	//Check to see if something changed in body part notices
	milkMultiplierGainNotificationCheck(deltaT);
	milkGainNotes(deltaT);
	bellySizeUpdates(deltaT);
	nutSwellUpdates(deltaT);
	immobilizedUpdate(false, deltaT);

	//Queue up dumbfuck procs
	if(pc.hasStatusEffect("Dumbfuck")) processDumbfuckEvents();
	var sendMails:Boolean = true;
	
	// Don't send mails to the player whilst aboard the kashima
	if (flags["KASHIMA_STATE"] == 1) sendMails = false;
	
	if(sendMails)
	{
		/* SHEKKA RECROOT */
		if(!shekkaRecruited() && flags["SHEKKA_REPEAT_TALKED"] != undefined && flags["SHEKKA_TALKED_PLAN"] != undefined && flags["PLANET_3_UNLOCKED"] != undefined && flags["TIMES_SEXED_SHEKKA"] != undefined)
		{
			if(!MailManager.isEntryUnlocked("shekkaFollowerIntroMail") && !pc.hasStatusEffect("Shekka_Follower_Email_CD") && currentLocation != "WIDGET WAREHOUSE") goMailGet("shekkaFollowerIntroMail");
			if(flags["SHEKKA_CURE_TIMER"] != undefined)
			{
				if(flags["SHEKKA_CURE_TIMER"]+10080 < GetGameTimestamp() && !MailManager.isEntryUnlocked("shekkaFollowerFirstChildrenBorn")) goMailGet("shekkaFollowerFirstChildrenBorn");
				if(flags["SHEKKA_CURE_TIMER"]+20080 < GetGameTimestamp() && !MailManager.isEntryUnlocked("shekkaFollowerTesting")) goMailGet("shekkaFollowerTesting");
				if(flags["SHEKKA_CURE_TIMER"]+24080 < GetGameTimestamp() && !MailManager.isEntryUnlocked("shekkaFollowerUnlockEmail")) goMailGet("shekkaFollowerUnlockEmail");
			}	
		}
		/* ANNO THICKNESS! */
		if(annoIsHuskar())
		{
			if(!MailManager.isEntryUnlocked("syriGetsBlockedByAnnoOverHuskarMail") && flags["ANNO_HUSKARRED"] != undefined && flags["ANNO_HUSKARRED"] + 700 <= GetGameTimestamp()) goMailGet("syriGetsBlockedByAnnoOverHuskarMail", (flags["ANNO_HUSKARRED"] + 700));
			if(!MailManager.isEntryUnlocked("annoReactsToSyriHuskarTeasingMail") && flags["ANNO_HUSKARRED"] != undefined && flags["ANNO_HUSKARRED"] + 375 <= GetGameTimestamp()) goMailGet("annoReactsToSyriHuskarTeasingMail", (flags["ANNO_HUSKARRED"] + 375));
			if(!MailManager.isEntryUnlocked("syriReactsToHuskarAnnoEmailMail") && flags["ANNO_HUSKARRED"] != undefined && flags["ANNO_HUSKARRED"] + 370 <= GetGameTimestamp()) goMailGet("syriReactsToHuskarAnnoEmailMail", (flags["ANNO_HUSKARRED"] + 370));
			if(!MailManager.isEntryUnlocked("kaedeReactsToHuskarAnnoEmailMail") && flags["ANNO_HUSKARRED"] != undefined && flags["ANNO_HUSKARRED"] + 250 <= GetGameTimestamp()) goMailGet("kaedeReactsToHuskarAnnoEmailMail", (flags["ANNO_HUSKARRED"] + 250));
		}
		//NEVRIE MAIL!
		if (!MailManager.isEntryUnlocked("myrpills") && flags["MCALLISTER_MEETING_TIMESTAMP"] <= (nextTimestamp - (24 * 60))) goMailGet("myrpills", (flags["MCALLISTER_MEETING_TIMESTAMP"] + (24 * 60)));
		if (!MailManager.isEntryUnlocked("orangepills") && flags["MCALLISTER_MYR_HYBRIDITY"] == 2 && nextTimestamp >= (flags["MCALLISTER_MYR_HYBRIDITY_START"] + (7 * 24 * 60))) goMailGet("orangepills", (flags["MCALLISTER_MYR_HYBRIDITY_START"] + (7 * 24 * 60)));
		if (!MailManager.isEntryUnlocked("bjreminder") && flags["NEVRIE_FIRST_DISCOUNT_DATE"] != undefined && days >= flags["NEVRIE_FIRST_DISCOUNT_DATE"] + 20) goMailGet("bjreminder", ((flags["NEVRIE_FIRST_DISCOUNT_DATE"] + 20) * 24 * 60));

		//Emmy Mail
		if (!MailManager.isEntryUnlocked("emmy_apology") && flags["EMMY_EMAIL_TIMER"] <= (nextTimestamp - (24 * 60))) goMailGet("emmy_apology", (flags["EMMY_EMAIL_TIMER"] + (24 * 60)));
		//Emmy mail stage 2 START
		if (!MailManager.isEntryUnlocked("emmy_gift_starter") && flags["EMMY_ORAL_TIMER"] <= (nextTimestamp - (72 * 60))) goMailGet("emmy_gift_starter", (flags["EMMY_ORAL_TIMER"] + (72 * 60)));
		//Emmy mail set up for sextoy go
		if (!MailManager.isEntryUnlocked("emmy_implant_explain_email") && flags["EMMY_PRESEX_FUN_TIMER"] <= (nextTimestamp - (100 * 60))) goMailGet("emmy_implant_explain_email", (flags["EMMY_PRESEX_FUN_TIMER"] + (100 * 60)));
		if (!MailManager.isEntryUnlocked("emmy_harness_here") && flags["EMMY_TOY_TIMER"] <= nextTimestamp) goMailGet("emmy_harness_here", flags["EMMY_TOY_TIMER"]);

		//Saendra Mail
		if (!MailManager.isEntryUnlocked("saendrathanks") && flags["FALL OF THE PHOENIX STATUS"] >= 1 && flags["SAENDRA_DISABLED"] != 1 && rooms[currentLocation].planet != "SHIP: PHOENIX" && !InShipInterior(pc)) saendraPhoenixMailGet();
		//Anno Mail
		if (!MailManager.isEntryUnlocked("annoweirdshit") && flags["MET_ANNO"] != undefined && flags["ANNO_MISSION_OFFER"] != 2 && flags["FOUGHT_TAM"] == undefined && flags["RUST_STEP"] != undefined && rand(20) == 0) goMailGet("annoweirdshit");
		//KIRO FUCKMEET
		if (!MailManager.isEntryUnlocked("kirofucknet") && flags["RESCUE KIRO FROM BLUEBALLS"] == 1 && kiroTrust() >= 50 && flags["MET_FLAHNE"] != undefined && flags["KIRO_ORGY_DATE"] == undefined && rand(3) == 0) { goMailGet("kirofucknet", nextTimestamp, kiroFuckNetBonus(deltaT)); }
		//KIRO DATEMEET
		if (!MailManager.isEntryUnlocked("kirodatemeet") && kiroTrust() >= 100 && kiroSexed() && rand(10) == 0) { goMailGet("kirodatemeet"); }
		//KIRO SMUT!
		if(!MailManager.isEntryUnlocked("kiroandkallyholomail") && flags["KIRO_3SOME_REACTION"] != -1 && flags["KIRO_3SOME_REACTION"] != undefined && kiroKallyThreesomes() > 0 && flags["KIRO_KALLY_EMAIL"] != undefined && flags["KIRO_KALLY_EMAIL"] + 5*60 < GetGameTimestamp()) { goMailGet("kiroandkallyholomail"); }
		
		trySendStephMail();
		trySendZephyrKidsMail();
		
		//Jade muff-ins
		if (!MailManager.isEntryUnlocked("jade_dumplings") && rooms[currentLocation].planet != "TAVROS STATION" && flags["GOTTEN_INTIMATE_WITH_JADE"] != undefined && flags["GOTTEN_INTIMATE_WITH_JADE"] >= 4 && rand(3) == 0) { goMailGet("jade_dumplings"); }

		//Del moved to Canada as trap.
		if(!MailManager.isEntryUnlocked("del_moved") && !MailManager.isEntryUnlocked("del_moved_light") && getPlanetName() != "Tarkus" && flags["CARVER_DEL_TALK"] != 1)
		{
			if(flags["CARVER_DEL_TALK"] == 3)
			{
				if(flags["DEL_MOVE_TIMER"] == undefined) flags["DEL_MOVE_TIMER"] = GetGameTimestamp();
				else if((flags["DEL_MOVE_TIMER"] + (60*24*10)) <= nextTimestamp) goMailGet("del_moved_light", (flags["DEL_MOVE_TIMER"] + (60*24*10)));
			}
			//Del moving to Canada as shemale
			else if (delilahSubmissiveness() >= 10 || flags["CARVER_DEL_TALK"] == 2) 
			{
				if(flags["DEL_MOVE_TIMER"] == undefined) flags["DEL_MOVE_TIMER"] = GetGameTimestamp();
				else if((flags["DEL_MOVE_TIMER"] + (60*24*10)) <= nextTimestamp) goMailGet("del_moved", (flags["DEL_MOVE_TIMER"] + (60*24*10)));
			}
		}

		// Pippa Nuru massage email
		if (!MailManager.isEntryUnlocked("pippa_nuru") && flags["PIPPA_NURU_TIMER"] <= (nextTimestamp - (24 * 60)) && currentLocation != "PIPPA HOUSE") goMailGet("pippa_nuru", (flags["PIPPA_NURU_TIMER"] + (24 * 60)));
		// Pippa Crew message email
		if (!MailManager.isEntryUnlocked("pippa_crew") && flags["PIPPA_RECRUIT_TIMER"] <= (nextTimestamp - (36 * 60)) && currentLocation != "PIPPA HOUSE") goMailGet("pippa_crew", (flags["PIPPA_RECRUIT_TIMER"] + (36 * 60)));

		//Plantation Quest Offer
		//Key string - "plantation_quest_start"
		if (!MailManager.isEntryUnlocked("plantation_quest_start") && flags["PLANTATION_MEALS"] != undefined && flags["PLANTATION_ZIL_TALK"] != undefined && flags["PLANTATION_PLANTATION_TALK"] != undefined && flags["PLANTATION_WORKERS_TALK"] != undefined && flags["PLANET_3_UNLOCKED"] != undefined)
		{
			if(flags["PQUEST_DELAY_TIMER"] == undefined) flags["PQUEST_DELAY_TIMER"] = GetGameTimestamp();
			else if(nextTimestamp >= (flags["PQUEST_DELAY_TIMER"] + (60*10))) goMailGet("plantation_quest_start", (flags["PQUEST_DELAY_TIMER"] + (60*10)));
		}
		if(pc.hasCock() && pc.thinnestCockThickness() < 7 && pc.balls >= 2 && pc.ballDiameter() >= 12 && pc.ballFullness >= 50 && !MailManager.isEntryUnlocked("kally_kiro_milkvite") && kiroKallyThreesomesAvailable() && rand(20) == 0 && flags["KIRO_KALLY_TEAM_MILKED"] == undefined) goMailGet("kally_kiro_milkvite");

		//Ushamee Meet Invite
		if (!MailManager.isEntryUnlocked("ushamee_meet") && (flags["KASHIMA_STATE"] == 2 || flags["KASHIMA_STATE"] == 3))
		{
			if(flags["KASHIMA_DELAY_TIMER"] == undefined) flags["KASHIMA_DELAY_TIMER"] = GetGameTimestamp();
			else if(nextTimestamp >= (flags["KASHIMA_DELAY_TIMER"] + (60*24*5))) goMailGet("ushamee_meet", (flags["KASHIMA_DELAY_TIMER"] + (60*24*5)));
		}
		
		//Syri Panty vid
		if (!MailManager.isEntryUnlocked("syri_video") && flags["SYRI_GIFT_PANTY"] != undefined)
		{
			if(flags["SYRI_VIDEO_DELAY_TIMER"] == undefined) flags["SYRI_VIDEO_DELAY_TIMER"] = GetGameTimestamp();
			else if(nextTimestamp >= (flags["SYRI_VIDEO_DELAY_TIMER"] + (60*24*3))) goMailGet("syri_video", (flags["SYRI_VIDEO_DELAY_TIMER"] + (60*24*3)));
		}
		//Shade Holiday shit
		if(isChristmas() && flags["SHADE_ON_UVETO"] >= 3)
		{
			if (!MailManager.isEntryUnlocked("shade_xmas_invite"))
			{
				if(shadeIsHome() && (shadeIsLover() || shadeIsSiblings())) goMailGet("shade_xmas_invite");
			}
		}
		//Prai email stuff
		if (flags["PRAI_EMAIL_NUMBER"] != undefined && flags["PRAI_EMAIL_STAMP"] != undefined && nextTimestamp >= (flags["PRAI_EMAIL_STAMP"] + (60*10)))
		{
			resendMail("prai_email", (flags["PRAI_EMAIL_STAMP"] + (60*10)));
			flags["PRAI_EMAIL_NUMBER"] = undefined;
			flags["PRAI_EMAIL_STAMP"] = undefined;
		}
		//Akane, Celeritas Veritas email
		if (!MailManager.isEntryUnlocked("shukuchi_veritas") && !pc.isPregnant() && flags["SHUKUCHI_EMAIL_TIMER"] != undefined && nextTimestamp >= flags["SHUKUCHI_EMAIL_TIMER"] + (60*24*6))
		{
			goMailGet("shukuchi_veritas", flags["SHUKUCHI_EMAIL_TIMER"] + (60*24*6));
		}
		//AkaneQuest email
		if (!MailManager.isEntryUnlocked("akanequest_email") && flags["AKANE_TIMES_WHIPPED"] >= 2 && flags["AKANE_RIVALS_TIMESTAMP"] != undefined && nextTimestamp >= flags["AKANE_RIVALS_TIMESTAMP"] + (60*24*7))
		{
			goMailGet("akanequest_email", flags["AKANE_RIVALS_TIMESTAMP"] + (60*24*7));
		}
		//Sucuccow email
		if(pc.hasCock() && flags["SUCCUCOW_EMAIL_THIS_YEAR"] == undefined && flags["CIARAN_MET"] != undefined && isHalloweenish())
		{
			resendMail("succucow_email");
			flags["SUCCUCOW_EMAIL_THIS_YEAR"] = 1;
		}
		else if (!isHalloweenish())
		{
			flags["SUCCUCOW_EMAIL_THIS_YEAR"] = undefined;
			flags["SUCCUCOW'D"] = undefined;
		}
		//RandyClaws email
		if(flags["RANDY_CLAWS_EMAIL_THIS_YEAR"] == undefined && flags["CIARAN_MET"] != undefined && isChristmas())
		{
			resendMail("randy_claws_email");
			flags["RANDY_CLAWS_EMAIL_THIS_YEAR"] = 1;
		}
		else if(!isChristmas())
		{
			flags["RANDY_CLAWS_EMAIL_THIS_YEAR"] = undefined;
			flags["RANDY_CLAWS"] = undefined;
		}
		
		//Other Email Checks!
		if (rand(100) == 0) emailRoulette(deltaT);
	}
	
	flags["HYPNO_EFFECT_OUTPUT_DONE"] = undefined;
	variableRoomUpdateCheck();
	updatePCStats();
	
	minutes += deltaT;
	
	hours += Math.floor(minutes / 60);
	minutes = minutes % 60;
	
	days += Math.floor(hours / 24);
	hours = hours % 24;
}

// Process time forward to certain time on the clock in (h, m).
// Where h is particular hour and m is particular minute.
public function processTimeToClock(h:int = 0, m:int = 0):void
{
	var numMin:int = 0;
	var iHour:int = 0;
	var iMins:int = 0;
	iHour = hours;
	if(iHour < 0 || iHour >= 24) iHour = 0;
	while(iHour != h)
	{
		numMin++;
		iMins++;
		if(iMins >= 60) { iHour++; iMins = 0; }
		if(iHour >= 24) { iHour = 0; }
	}
	iMins = minutes;
	if(iMins < 0 || iMins >= 60) iMins = 0;
	while(iMins != m)
	{
		numMin++;
		iMins++;
		if(iMins >= 60) { iMins = 0; }
	}
	processTime(numMin);
}

public function processHolidayoweenEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if(flags["HOLIDAY_OWEEN_ACTIVATED"] == undefined && (isHalloweenish() || rand(100) <= totalDays - 1))
	{
		if(eventQueue.indexOf(hollidayOweenAlert) == -1) eventQueue.push(hollidayOweenAlert);
	}
}

public function processMimbranesTime(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if (attachedMimbranes() == 0) return;
		
	if (flags["MIMBRANES BITCH TIMER"] == undefined) flags["MIMBRANES BITCH TIMER"] = deltaT;
	else flags["MIMBRANES BITCH TIMER"] += deltaT;
	
	if (flags["MIMBRANES BITCH TIMER"] >= 300)
	{
		flags["MIMBRANES BITCH TIMER"] = 0;
		if (doOut) mimbranesComplainAndShit();
	}
	
	var totalHours:int = ((minutes + deltaT) / 60);
	if (totalHours >= 1)
	{
		mimbraneSweatHandler(totalHours);
	}
	
	if (totalDays >= 1)
	{
		mimbranesIncreaseDaysSinceFed(totalDays);
	}
}

public function processLeithaCharmTime(deltaT:uint, doOut:Boolean):void
{
	if (pc.hasStatusEffect("Leitha Charm"))
	{
		pc.addStatusValue("Leitha Charm", 1, deltaT * 20);
	}
}

public function processRenvraMessageEvents(deltaT:uint, doOut:Boolean):void
{
	if (pc.hasStatusEffect("Renvra Eggs Messages Available") || pc.hasStatusEffect("Nyrea Eggs Messages Available") || pc.hasStatusEffect("Royal Eggs Messages Available"))
	{
		var cRoom:RoomClass = rooms[currentLocation];
		var pSpace:Boolean = cRoom.hasFlag(GLOBAL.PUBLIC);
		
		if (pc.hasStatusEffect("Renvra Eggs Messages Available")) RenvraEggPregnancy.renvraEggsMessageHandler(pSpace, deltaT);
		else if (pc.hasStatusEffect("Nyrea Eggs Messages Available")) NyreaHuntressPregnancy.nyreaEggsMessageHandler(pSpace, deltaT);
		else if (pc.hasStatusEffect("Royal Eggs Messages Available")) RoyalEggPregnancy.royalEggsMessageHandler(pSpace, deltaT);
	}
	
	renvraMessageHandler();
}

public function processQueenOfTheDeepMessageEvents(deltaT:uint, doOut:Boolean):void
{
	if (flags["Queen Message Supression"] == undefined)
	{
		QueenOfTheDeepPregnancy.queenPregnancyMessages(deltaT);
	}
	else
	{
		flags["Queen Message Supression"] = undefined;
	}
}

public function processTarkusBombTimerEvents(deltaT:uint, doOut:Boolean):void
{
	if(flags["TARKUS_BOMB_TIMER"] != undefined && flags["TARKUS_BOMB_TIMER"] > 0)
	{
		flags["TARKUS_BOMB_TIMER"] -= Math.min(deltaT, flags["TARKUS_BOMB_TIMER"]);
		bombStatusUpdate();
		
		if(flags["TARKUS_BOMB_TIMER"] <= 0)
		{
			if(eventQueue.indexOf(bombExplodes) == -1) eventQueue.push(bombExplodes);
		}
	}
}

public function processTaivrasPregnancyState(deltaT:uint, doOut:Boolean):void
{
	if (flags["TAIVRA_FERTILE"] > 0 && (flags["TAIVRA_FERTILE"] + (24 * 60)) < (GetGameTimestamp() + deltaT)) flags["TAIVRA_FERTILE"] = 0;
}

public function processKQ2NukeEvents(deltaT:uint, doOut:Boolean):void
{
	if (flags["KQ2_NUKE_STARTED"] >= 0 && flags["KQ2_NUKE_EXPLODED"] == undefined)
	{
		// Still there!
		if (flags["KQ2_QUEST_FINISHED"] == undefined)
		{
			if (flags["KQ2_NUKE_STARTED"] + KQ2_NUKE_DURATION < GetGameTimestamp() + deltaT)
			{
				if(eventQueue.indexOf(kq2NukeBadend) == -1) eventQueue.push(kq2NukeBadend);
			}
		}
		// Left
		else if (InShipInterior(pc))
		{
			flags["KQ2_NUKE_EXPLODED"] = 1;
			if(eventQueue.indexOf(kq2NukeExplodesLater) == -1) eventQueue.push(kq2NukeExplodesLater);
		}
	}
}

public function processDaneCoordEvents(deltaT:uint, doOut:Boolean):void
{
	if (flags["KQ2_MYRELLION_STATE"] == 1)
	{
		if (flags["KQ2_DANE_COORDS_TIMER"] != undefined && flags["KQ2_DANE_COORDS_TIMER"] + 2880 < GetGameTimestamp() + deltaT)
		{
			if(eventQueue.indexOf(kq2DaneCoordEmail) == -1) eventQueue.push(kq2DaneCoordEmail);
		}
	}
}

public function processShadeEvents(deltaT:uint, doOut:Boolean):void
{
	if(flags["KQ2_SHADE_AWAY_TIME"] != undefined)
	{
		if(GetGameTimestamp() + deltaT > (flags["KQ2_SHADE_AWAY_TIME"] + (24 * 60)))
		{
			if(flags["SHADE_ON_UVETO"] == undefined || flags["SHADE_ON_UVETO"] < 1) flags["SHADE_ON_UVETO"] = 1;
			if(flags["SHADE_DISABLED"] == -1) flags["SHADE_DISABLED"] = undefined;
			flags["KQ2_SHADE_AWAY_TIME"] = undefined;
		}
	}
	
	var totalHours:int = ((minutes + deltaT) / 60);
	if (totalHours >= 1 && flags["SHADE_INSEMINATION_COUNTER"] != undefined)
	{
		flags["SHADE_INSEMINATION_COUNTER"] += totalHours;
		if(flags["SHADE_INSEMINATION_COUNTER"] > 167) flags["SHADE_INSEMINATION_COUNTER"] = undefined;
	}
}

public function processGiannaEvents(deltaT:uint, doOut:Boolean):void
{
	if (flags["GIANNA_AWAY_TIMER"] != undefined && flags["GIANNA_AWAY_TIMER"] > 0) giannaAWOL(-deltaT);
	
	if (flags["GIANNA_FUCK_TIMER"] != undefined) flags["GIANNA_FUCK_TIMER"] += deltaT;
}

public function processTreatmentEvents(deltaT:uint, doOut:Boolean):void
{
	if(pc.hasStatusEffect("Treatment Elasticity Report Q'ed"))
	{
		//Buttes
		if(pc.statusEffectv1("Treatment Elasticity Report Q'ed") == 1) treatedVagNote(true);
		//Cooters
		else treatedVagNote(false);
	}
	
	var totalHours:int = ((minutes + deltaT) / 60);
	if (totalHours >= 1)
	{
		if (pc.hasPerk("Dumb4Cum")) dumb4CumUpdate(totalHours);
	}
}

public function processKiroBarEvents(deltaT:uint, doOut:Boolean):void
{
	//Kiro stuff
	if(flags["KIRO_BAR_MET"] != undefined)
	{
		var totalHours:int = ((minutes + deltaT) / 60);
		
		if (totalHours >= 1)
		{
			kiro.ballSizeRaw += totalHours;
			
			if (kiro.ballDiameter() > 20)
			{
				// original was rand(200) < ballSize per hour, ergo 10% per hour
				// => (200 - ballSize) in 200 per hour
				// => 1 - ((180 / 200) ^ 1) == 0.1 == 10%
				// => 1 - ((200 - ballSize / 200) ^ hours)
				
				var orgProb:Number = Math.round((1 - Math.pow(((200 - kiro.ballDiameter()) / 200), totalHours)) * 1000);
				if (rand(1000) < orgProb) kiro.orgasm();
			}
		}
		
		//Kiro's disabled timer!
		if(flags["KIRO_DISABLED_MINUTES"] != undefined)
		{
			flags["KIRO_DISABLED_MINUTES"] -= deltaT;
			if(flags["KIRO_DISABLED_MINUTES"] <= 0) flags["KIRO_DISABLED_MINUTES"] = undefined;
		}
	}
}

public function processSaendraEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if(flags["SAENDRA_XPACK1_STATUS"] == 1 || flags["SAENDRA_XPACK1_STATUS"] == 5)
	{
		updateSaendraXPackTimer(deltaT);
	}
	
	if (totalDays >= 1 && flags["SAENDRA_XPACK1_STATUS"] == undefined && shipLocation == "TAVROS HANGAR" && saendraAffection() >= 60 && !MailManager.isEntryUnlocked("saendraxpack1"))
	{
		if(flags["SAENDRA_DISABLED"] != undefined || flags["SAENDRA GONNA GO GET A COCK"] == 1 || flags["SAENDRA GONNA GO GET A COCK"] == 2) { /* Don't trigger. */ }
		else if(eventQueue.indexOf(unlockSaendraXPackMail) == -1) eventQueue.push(unlockSaendraXPackMail);
	}
}

public function processLetsFapUpdates(deltaT:uint, doOut:Boolean):void
{
	// Bail early if we've already unlocked everything
	if (letsFapTrack() >= LETS_FAP_EPISODES.length) return;
	
	var numMinutes:int = deltaT / 60;
	var numHours:int = deltaT - (deltaT % 60);
	var numDays:int = numHours / 24;
	
	// If we cross 1pm
	// => more than 24 hours pass this delta, or hours is less than 13 prior to processTime() and 13 after
	if (numHours >= 24 || (hours < 13 && (hours + numHours + (minutes + numMinutes > 60 ? 1 : 0)) >= 13))
	{
		if (flags["LETS_FAP_RELEASE_TIMER"] != undefined)
		{
			var passedLength:Number = (GetGameTimestamp() + deltaT - flags["LETS_FAP_RELEASE_TIMER"]);
			var unlockLength:Number = (flags["EARLY_LETS_FAPS"] == undefined ? 10080 : 7200);
			var numUnlocks:int = 0;
			
			if (passedLength >= unlockLength)
			{
				numUnlocks += Math.floor(passedLength / unlockLength);
				
				// Clamp the max unlocks to 7, accounting for presently unlocked potentials
				if(letsFapTrack() + numUnlocks > LETS_FAP_EPISODES.length) numUnlocks = Math.min(LETS_FAP_EPISODES.length - letsFapTrack());
				
				if (numUnlocks == 1)
				{
					AddLogEvent("Atha has posted a new Let’s Fap video!", "good", (passedLength - unlockLength));
				}
				else
				{
					AddLogEvent("Atha has posted " + num2Text(numUnlocks) + " new Let’s Fap videos!", "good", (passedLength - (numUnlocks * unlockLength)));
				}
				
				// Unlock the latest episode possible based on time passage and existing unlock position
				flags["LETS_FAP_LATEST"] = (letsFapTrack() + (numUnlocks - 1));
				if(flags["LATEST_LETS_FAP"] < flags["LETS_FAP_LATEST"]) flags["LATEST_LETS_FAP"] = flags["LETS_FAP_LATEST"];
				
				flags["LETS_FAP_RELEASE_TIMER"] = undefined;
			}
		}
		else if (letsFapUnlockFromName() != "" && rand(10) == 0 && (days + numDays > 35 || (days + numDays > 34 && hours + numHours >= 24))) letsFapEmailUnlock();
	}
}

public function processShekkaEvents(deltaT:uint, doOut:Boolean):void
{
	var totalHours:int = ((minutes + deltaT) / 60);
	
	if (totalHours >= 1)
	{
		if (flags["SHEKKA_TALK_COOLDOWN"] != undefined)
		{
			if (flags["SHEKKA_TALK_COOLDOWN"] > 0) flags["SHEKKA_TALK_COOLDOWN"] -= totalHours;
			if (flags["SHEKKA_TALK_COOLDOWN"] < 0) flags["SHEKKA_TALK_COOLDOWN"] = 0;
		}
		
		if (chars["SHEKKA"].lust() < 50) chars["SHEKKA"].lust(15 * totalHours);
	}
}

public function processFlahneEvents(deltaT:uint, doOut:Boolean):void
{	
	var totalHours:int = ((minutes + deltaT) / 60);
	if (flags["FLAHNE_PISSED"] > 0 && totalHours >= 1) 
	{		
		flags["FLAHNE_PISSED"] -= totalHours;
		if(flags["FLAHNE_PISSED"] < 0) flags["FLAHNE_PISSED"] = 0;
	}
}

public function processAnnoEvents(deltaT:uint, doOut:Boolean):void
{	
	var totalHours:int = ((minutes + deltaT) / 60);
	if(!isChristmas()) flags["ANNO_GIFT_WRAPPED"] = undefined;
	if(flags["ANNO_AWAY"] != undefined && deltaT >= 1)
	{
		flags["ANNO_AWAY"] -= deltaT;
		if(flags["ANNO_AWAY"] <= 0) flags["ANNO_AWAY"] = undefined;
	}
	if(flags["ANNO_ASLEEP"] != undefined && totalHours >= 1)
	{
		flags["ANNO_ASLEEP"] -= totalHours;
		if(flags["ANNO_ASLEEP"] <= 0) flags["ANNO_ASLEEP"] = undefined;
	}
}

public function processAlissEvents(deltaT:uint, doOut:Boolean):void
{
	var totalHours:int = ((minutes + deltaT) / 60);
	if (totalHours >= 1)
	{
		if(chars["ALISS"].lust() < 70) chars["ALISS"].lust(5 * totalHours);
	}
}

public function processPennyEvents(deltaT:uint, doOut:Boolean):void
{
	var totalHours:int = ((minutes + deltaT) / 60);
	if (totalHours >= 1)
	{
		if (chars["PENNY"].lust() < 100) chars["PENNY"].lust(10);
	}
}

public function processSeraEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	seraLustGain(deltaT);
	
	if (deltaT >= 1440 || (hours < 18 && hours + Math.floor(deltaT / 60) >= 18))
	{
		var totalAttempts:int = 1;
		
		if (deltaT >= 1440)
		{
			var d:int = days;
			var h:int = hours;
			var m:int = minutes;
			
			m += deltaT % 60;
			if (m >= 60)
			{
				h++;
				m = 0;
			}
			
			h += Math.floor(deltaT / 60);
			if (h >= 24)
			{
				d += Math.floor(h / 24);
			}
			
			totalAttempts = d - days;
			if (h >= 18) totalAttempts++;
		}
		
		seraNurseryVisitCheck(totalAttempts);
		seranigansCheck(totalAttempts);
	}
	
	seraPregnancyIsDue(totalDays);
}

public function processRiyaEvents(deltaT:uint, doOut:Boolean):void
{
	if (deltaT >= 1440 || (hours < 18 && hours + Math.floor(deltaT / 60) >= 18))
	{
		var totalAttempts:int = 1;
		
		if (deltaT >= 1440)
		{
			var d:int = days;
			var h:int = hours;
			var m:int = minutes;
			
			m += deltaT % 60;
			if (m >= 60)
			{
				h++;
				m = 0;
			}
			
			h += Math.floor(deltaT / 60);
			if (h >= 24)
			{
				d += Math.floor(h / 24);
			}
			
			totalAttempts = d - days;
			if (h >= 18) totalAttempts++;
		}
		
		riyaNurseryVisitCheck(totalAttempts);
	}
}

public function processReahaEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	var totalHours:int = ((minutes + deltaT) / 60);
	if (!disableExploreEvents() && totalHours >= 1 && flags["REAHA_PAY_Q"] == 1 && currentLocation == "SHIP INTERIOR")
	{
		flags["REAHA_PAY_Q"] = undefined;
		if(eventQueue.indexOf(reahaPaybackEvent) == -1) eventQueue.push(reahaPaybackEvent);
	}
	
	if (totalDays >= 1 && reahaIsCrew() && curedReahaInDebt() && !reahaAddicted() && ((days + totalDays) % 7 == 0 || totalDays >= 7) && flags["REAHA_PAY_Q"] == undefined) flags["REAHA_PAY_Q"] = 1;
}

public function processGobblesEvents(deltaT:uint, doOut:Boolean):void
{
	var totalHours:int = ((minutes + deltaT) / 60);
	if (totalHours >= 1 && flags["GOBBLES_SEXYTIMES_STARTED"] == 1 && flags["GOBBLES_COOLDOWN"] != 24)
	{
		if (flags["GOBBLES_COOLDOWN"] == undefined) flags["GOBBLES_COOLDOWN"] = 0;
		flags["GOBBLES_COOLDOWN"] += totalHours;
		if (flags["GOBBLES_COOLDOWN"] > 24) flags["GOBBLES_COOLDOWN"] = 24;
	}
}

public function processIrelliaEvents(deltaT:uint, doOut:Boolean):void
{
	var totalHours:int = ((minutes + deltaT) / 60);
	
	if (totalHours >= 1)
	{
		var d:int = days;
		var h:int = hours;
		var m:int = minutes;
		
		m += deltaT % 60;
		if (m >= 60)
		{
			h++;
			m = m % 60;
		}
		
		h += Math.floor(deltaT / 60);
		if (h >= 24)
		{
			d += Math.floor(h / 24);
			h = h % 24;
		}
		
		if (d != days)
		{
			if (flags["IRELLIA_QUEST_STATUS"] == 3 && currentLocation != "725")
			{
				missedRebelExplosion();
			}
			if(flags["IRELLIA_QUEST_STATUS"] == 4) 
			{
				AddLogEvent("You receive a missive from your codex informing you that Queen Irellia would like to speak to you. Sounds like someone’s about to get paid!", "good", deltaT);
				flags["IRELLIA_QUEST_STATUS"] = 5;
			}
		}
		
		//Mushroom park meeting.		
		if ((d != days || hours < 18 && h >= 18) && currentLocation == "708" && flags["IRELLIA_QUEST_STATUS"] == 2)
		{
			if(eventQueue.indexOf(unificationRallyEvent) == -1) eventQueue.push(unificationRallyEvent);
		}

		//Bomb explosion bad-end meeting
		if(d != days && flags["IRELLIA_QUEST_STATUS"] == 3 && currentLocation == "725")
		{
			if(eventQueue.indexOf(beADumbShitFallGuyForTheRebels) == -1) eventQueue.push(beADumbShitFallGuyForTheRebels);
		}
		
		//Irellia's sex cooldown
		if(flags["IRELLIA_SEX_COOLDOWN"] != undefined)
		{
			if(flags["IRELLIA_SEX_COOLDOWN"] <= 0) flags["IRELLIA_SEX_COOLDOWN"] = undefined;
			else flags["IRELLIA_SEX_COOLDOWN"] -= totalHours;
		}
	}
}

public function processOmniSuitEvents(deltaT:uint, doOut:Boolean):void
{
	if (pc.armor is Omnisuit)
	{
		var totalHours:int = ((minutes + deltaT) / 60);
		
		if (totalHours >= 1)
		{
			omnisuitChangeUpdate();
		}
	}
}

public function processCarryTrainingEvents(deltaT:uint, doOut:Boolean):void
{
	var totalHours:int = ((minutes + deltaT) / 60);
	
	if (pc.hasStatusEffect("Eggy Belly") && totalHours >= 1 && (flags["CARRY_TRAINING_BONUS_PROC"] == undefined || flags["CARRY_TRAINING_BONUS_PROC"] + (60 * 24 < GetGameTimestamp() + deltaT)))
	{
		var eventChance:Number = Math.round((1 - Math.pow(14 / 15, totalHours)) * 1000);
		if (rand(1000) < eventChance)
		{
			var msg:String = "";
			
			//Event: Jiggle Jiggle!
			//Play sometimes when PC is walking. Increase Lust by 10 per Training level.
			AddLogEvent(ParseText("Your progress is interrupted by a sudden shift in your [pc.belly], making you nearly double over with intense, overwhelming pleasure. Just feeling the "), "passive", deltaT);
			if(pc.totalBabiesOfType("EggTrainerCarryTraining") < 18) ExtendLogEvent("dozen");
			else if(pc.totalBabiesOfType("EggTrainerCarryTraining") < 75) ExtendLogEvent("dozens");
			else ExtendLogEvent("close to a hundred");
			ExtendLogEvent(" eggs moving around inside you, jiggling with your movements, is almost enough to make you cum on the spot. You bite your lip and hold on, ");

			if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC)) ExtendLogEvent("ignoring the curious looks from passersby.");
			else if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC) && pc.exhibitionism() >= 33) 
			{
				ExtendLogEvent("more than a little aroused by the way people are looking at you.");
				pc.lust(5);
			}
			else ExtendLogEvent("thankful that you’re all alone.");
			ExtendLogEvent("\n\nYour body’s betrayal lasts only for a moment before the eggs settle down again. You sigh, taking a deep breath to steady yourself before you get going again, a ");
			if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC) && pc.exhibitionism() >= 33) ExtendLogEvent("good deal");
			else ExtendLogEvent("little");
			ExtendLogEvent(" more flushed than before.");
			
			//Reset cooldown
			flags["CARRY_TRAINING_BONUS_PROC"] = GetGameTimestamp() + deltaT;
		}
	}
}

public function processNessaEvents(deltaT:uint, doOut:Boolean):void
{
	var totalHours:int = ((minutes + deltaT) / 60);
	
	if (totalHours >= 1 && flags["NESSA_BELLY"] != undefined && flags["NESSA_BELLY"] > 0)
	{
		flags["NESSA_BELLY"] -= (100 * totalHours);
		if (flags["NESSA_BELLY"] < 0) flags["NESSA_BELLY"] = 0;
	}
}

public function processCuntTailEggs(deltaT:uint, doOut:Boolean):void
{
	if (flags["CUNT_TAIL_PREGNANT_TIMER"] == undefined) return;
	
	if (!pc.hasCuntSnake())
	{
		flags["DAYS_SINCE_FED_CUNT_TAIL"] = flags["CUNT_TAIL_PREGNANT_TIMER"] = undefined;
	}
	else
	{
		flags["CUNT_TAIL_PREGNANT_TIMER"] -= Math.min(deltaT, flags["CUNT_TAIL_PREGNANT_TIMER"]);
		if (flags["CUNT_TAIL_PREGNANT_TIMER"] <= 0)
		{
			flags["CUNT_TAIL_PREGNANT_TIMER"] = undefined;
			if (eventQueue.indexOf(giveBirthThroughCuntTail) == -1) eventQueue.push(giveBirthThroughCuntTail);
		}
	}
}

public function processDrBadgerEvents(deltaT:uint, doOut:Boolean):void
{
	if (flags["BADGER_QUEST"] == -1)
	{
		if (flags["BADGER_QUEST_TIMER"] == undefined) flags["BADGER_QUEST_TIMER"] = (GetGameTimestamp() + (60 - minutes));
		
		if (flags["BADGER_QUEST_TIMER"] != -1 && GetGameTimestamp() + deltaT >= flags["BADGER_QUEST_TIMER"] + 1440)
		{
			pennyBadgerQuestAlert();
			flags["BADGER_QUEST_TIMER"] = -1;
		}
	}
}

public function processHoneyPotMods(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if (pc.hasPerk("Honeypot"))
	{
		var numProcs:int = Math.floor(((days % 3) + totalDays) / 3);
		if (numProcs > 0) honeyPotBump(false, numProcs);
	}
}

public function processNewTexasEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	// New Texas cockmilker repair cooldown.
	if (flags["MILK_BARN_COCKMILKER_BROKEN"] == undefined && flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] != undefined)
	{
		if (flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] > 0) flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] -= totalDays;
		else flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] = 0;
	}
	
	if (days + totalDays >= 2 && (flags["NEW_TEXAS_COORDINATES_GAINED"] == undefined || !MailManager.isEntryUnlocked("newtexas")))
	{
		newTexasEmail();
	}
	
	if (flags["MILK_BARN_EVENT_TODAY"] != undefined) flags["MILK_BARN_EVENT_TODAY"] = undefined;
	if (flags["BRYNN_MET_TODAY"] != undefined) flags["BRYNN_MET_TODAY"] = undefined;
}

public function processOryxxEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if(flags["ORRYX_SHIPPED_TODAY"] != undefined) flags["ORRYX_SHIPPED_TODAY"] = undefined;
}

public function processVenusPitcherEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if(currentLocation != "OVERGROWN ROCK 12" && flags["ROOM_80_VENUS_PITCHER_ASLEEP"] != undefined) flags["ROOM_80_VENUS_PITCHER_ASLEEP"] = undefined;
	if(currentLocation != "VINED JUNGLE 3" && flags["ROOM_65_VENUS_PITCHER_ASLEEP"] != undefined) flags["ROOM_65_VENUS_PITCHER_ASLEEP"] = undefined;
	if(currentLocation != "DEEP JUNGLE 2" && flags["ROOM_61_VENUS_PITCHER_ASLEEP"] != undefined) flags["ROOM_61_VENUS_PITCHER_ASLEEP"] = undefined;
	
	venusSubmission( -(totalDays));
}

public function processRaskvelEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if(flags["RASKVEL_PREG_TIMER"] != undefined)
	{
		flags["RASKVEL_PREG_TIMER"] -= totalDays;
		
		//She pops eggs without you seeing.
		if(flags["RASKVEL_PREG_TIMER"] < -5) 
		{
			flags["RASKVEL_PREG_TIMER"] = undefined;
			flags["RASKVEL_EGG_COUNT"] = undefined;
		}
	}
}

public function processMyrPregEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if(flags["BRIHA_INCUBATION_TIMER"] != undefined) flags["BRIHA_INCUBATION_TIMER"] += totalDays;
	if(flags["BRIHA_LATEST_SPAWN_AGE"] != undefined) flags["BRIHA_LATEST_SPAWN_AGE"] += totalDays;
	if(flags["BRIHA_SECOND_OLDEST_SPAWN_AGE"] != undefined) flags["BRIHA_SECOND_OLDEST_SPAWN_AGE"] += totalDays;
	if(flags["BRIHA_OLDEST_SPAWN_AGE"] != undefined) flags["BRIHA_OLDEST_SPAWN_AGE"] += totalDays;
}

public function processEmmyEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if (totalDays >= 1)
	{
		flags["EMMY_SPECIAL"] = undefined;
	}
}

public function badEnd(displayGG:String = "GAME OVER"):void 
{
	if(stage.contains(userInterface.textInput)) removeInput();
	
	gameOverEvent = true;
	backToPrimaryOutput();
	
	// Todo -- Hook alternate game ends in here, and also maybe look into some kind of categorisation system.
	
	if (displayGG != "") output("\n\n<b>" + displayGG + "</b>");
	output("\n\n(Access the main menu to start a new character or the data menu to load a saved game. The buttons are located in the lower left of the game screen.)");
	clearMenu();
	addButton(14, "Codex", showCodex);
}

// Checkin' da E-mails
public function goMailGet(mailKey:String = "", timeStamp:int = -1, messageBody:String = ""):void
{
	var mailFrom:String = "<i>Unknown Sender</i>";
	var mailFromAdress:String = "<i>Unknown Address</i>";
	if(timeStamp < 0) timeStamp = GetGameTimestamp();
	var deltaT:uint = (timeStamp - GetGameTimestamp());
	if(mailKey != "" && MailManager.hasEntry(mailKey))
	{
		var mailEmail:Object = MailManager.getEntry(mailKey);
		if(mailEmail.FromCache != null) mailFrom = mailEmail.FromCache;
		if(mailEmail.From != null) mailFrom = mailEmail.From();
		if(mailEmail.FromAddressCache != null) mailFromAdress = mailEmail.FromAddressCache;
		if (mailEmail.FromAddress != null) mailFromAdress = mailEmail.FromAddress();
		if (messageBody.length == 0)
		{
			AddLogEvent("<b>New Email from " + mailFrom + " (" + mailFromAdress +")!</b>", "words", deltaT);
		}
		else
		{
			AddLogEvent("<b>New Email from " + mailFrom + " (" + mailFromAdress +")!</b>" + messageBody, "words", deltaT);
		}
		MailManager.unlockEntry(mailKey, timeStamp);
	}
}
// Reset and ressend the e-mail!
public function resendMail(mailKey:String = "", timeStamp:int = -1, messageBody:String = ""):void
{
	// Removes cached text but also sets timestamps to default
	MailManager.clearEntry(mailKey);
	// Regenerates cache and sets new appropriate timestamp
	goMailGet(mailKey, timeStamp, messageBody);
}
// Random Emails!
public function emailRoulette(deltaT:uint):void
{
	var mailList:Array = [];
	var mailKey:String = "";
	var mailSubject:String = "\\\[No Subject\\\]";
	var mailContent:String = "<i>This message turns up empty...</i>";
	
	var randTimestamp:uint = (GetGameTimestamp() + 1 + rand(deltaT));
	
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
	if(!MailManager.isEntryUnlocked("cuzfuckball") && flags["TIMES_MET_FEMZIL"] != undefined && flags["BEEN_ON_TARKUS"] != undefined && pc.level >= 2)
		mailList.push("cuzfuckball");
	if (!MailManager.isEntryUnlocked("extrameet_invite_email") && extrameetSmutAvail())
		mailList.push("extrameet_invite_email", "extrameet_invite_email", "extrameet_invite_email");
	
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
		// Any special actions/unlocks
		var mailEmail:Object = MailManager.getEntry(mailKey);
		if(mailEmail.SubjectCache != null) mailSubject = mailEmail.SubjectCache;
		if(mailEmail.Subject != null) mailSubject = mailEmail.Subject();
		if(mailEmail.ContentCache != null) mailContent = mailEmail.ContentCache;
		if(mailEmail.Content != null) mailContent = mailEmail.Content();
		
		// Regular:
		if (mailKey == "kirofucknet")
		{
			goMailGet(mailKey, randTimestamp, kiroFuckNetBonus(deltaT));
		}
		// Spam:
		else if (mailKey == "cov8" && flags["SPAM_MSG_COV8"] == undefined)
		{
			flags["SPAM_MSG_COV8"] = 1;
		}
		else if(mailKey == "fatloss" && pc.isBimbo())
		{
			goMailGet(mailKey, randTimestamp, "\n\nThe subject line reads <i>“" + mailSubject + "”</i>. Ooo, secrets and stuff! You eagerly open the message and the codex lights up with the display:\n\n<i>" + mailContent + "</i>\n\nMmm, that sounds yummy!");
			pc.lust(20);
			MailManager.readEntry("fatloss", randTimestamp);
		}
		else if(mailKey == "estrobloom" && !pc.hasKeyItem("Coupon - Estrobloom"))
		{
			goMailGet(mailKey, randTimestamp, "\n\n<b>You have gained a coupon for Estrobloom!</b>");
			pc.createKeyItem("Coupon - Estrobloom", 0.9, 0, 0, 0, "Save 10% on your next purchase of Estrobloom!");
		}
		else if(mailKey == "hugedicktoday" && pc.isBro() && pc.hasCock())
		{
			goMailGet(mailKey, randTimestamp, "\n\nThe subject line reads <i>“" + mailSubject + "”</i>. Hell yeah--who wouldn’t want a bigger dick? You quicky open the message to read its contents and the codex lights up with the display:\n\n<i>" + mailContent + "</i>\n\nYou’re not quite sure you understood all that, but your dick did.");
			pc.lust(20);
			MailManager.readEntry("hugedicktoday", randTimestamp);
		}
		else
		{
			goMailGet(mailKey, randTimestamp);
		}
	}
}

// Event Dates
// checkDate(day:int, month:int, dayRange:int)
public function holidaySeasonCheck(seasonFlag:String = ""):Boolean
{
	// Flag auto return
	if(gameOptions.seasonalOverridePreferences[seasonFlag] != undefined) return gameOptions.seasonalOverridePreferences[seasonFlag];
	// Normal date ranges.
	switch(seasonFlag)
	{
		case "NEW_YEARS": return checkDate(1, 1, 3); break;
		case "LUNAR_NEW_YEAR": return checkDate(5, 2, 15); break;
		case "VALENTINES": return checkDate(14, 2, 3); break;
		case "ST_PATRICKS": return checkDate(17, 3, 3); break;
		case "APRIL_FOOLS": return checkDate(1, 4, 0); break;
		case "EASTER": return checkDate(10, 4, 15); break;
		case "JULY_4TH": return checkDate(4, 7, 7); break;
		case "OKTOBERFEST": return checkDate(18, 9, 4); break;
		case "HALLOWEEN": return checkDate(29, 10, 10); break;
		case "THANKSGIVING":
			// Canadian Holiday
			if(checkDate(12, 10, 6)) return true;
			// American Holiday
			if(checkDate(24, 11, 6)) return true;
			break;
		case "CHRISTMAS": return checkDate(25, 12, 8); break;
	}
	
	return false;
}
public function isNewYears():Boolean { return holidaySeasonCheck("NEW_YEARS"); }
public function isLunarNewYear():Boolean { return holidaySeasonCheck("LUNAR_NEW_YEAR"); }
public function isValentines():Boolean { return holidaySeasonCheck("VALENTINES"); }
public function isStPatricks():Boolean { return holidaySeasonCheck("ST_PATRICKS"); }
public function isAprilFools():Boolean { return holidaySeasonCheck("APRIL_FOOLS"); } // APRIL FOOLS!
public function isEaster():Boolean { return holidaySeasonCheck("EASTER"); }
public function isNearlyJulyFourth():Boolean { return holidaySeasonCheck("JULY_4TH"); }
public function isOktoberfest():Boolean { return holidaySeasonCheck("OKTOBERFEST"); }
public function isHalloweenish():Boolean { return holidaySeasonCheck("HALLOWEEN"); }
public function isThanksgiving():Boolean { return holidaySeasonCheck("THANKSGIVING"); }
public function isChristmas():Boolean { return holidaySeasonCheck("CHRISTMAS"); }

// Bad Ends
public function deathByNoHP():void
{
	clearOutput();
	showName("GAME\nOVER");
	output("You collapse unconscious... and do not rise again, your body’s capacity to take damage reduced to less than nothing. Whoops.");
	badEnd();
}

public function taintedLove():void
{
	clearOutput();
	showName("ONCE I RAN\nTO YOU...");
	output("... Now I run from you...");
	pc.taint(15);
	processTime(1);
	clearMenu();
	addButton(0, "Again", taintedLove);
	addButton(14, "Back", mainGameMenu);
}
