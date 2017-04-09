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
			
			var d:int = days;
			var h:int = hours;
			var m:int = minutes;
			
			if (tEvent.timestamp > 0)
			{
				m += tEvent.timestamp;
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
			}
			
			output("\n\n\\\[<span class='" + tEvent.style + "'><b>D: " + d + " T: " + (h < 10 ? (String("0") + h) : String(h)) + ":" + (m < 10 ? (String("0") + m) : String(m)) + "</b></span>\\\] " + tEvent.msg);
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
	// Pirate Base (Bomb Timer)
	if (flags["KQ2_NUKE_STARTED"] != undefined && flags["KQ2_NUKE_EXPLODED"] == undefined) return true;
	// Kashima Duration
	if (flags["KASHIMA_STATE"] > 0 && flags["KASHIMA_STATE"] < 2) return true;
	
	return false;
}

public function mainGameMenu(minutesMoved:Number = 0):void
{
	flags["COMBAT MENU SEEN"] = undefined;
	
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
				if ((pc.accessory as LeithaCharm).attemptTF(pc)) return;
			}
		}
	}
	
	// Update the state of the players mails -- we don't want to do this all the time (ie in process time), and we're only going to care about it at the menu root soooooo...
	updateMailStatus();
	
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
		if (currentLocation == shipLocation)
		{
			if(seranigansTrigger("hijacked")) return;
		}
	}
	
	if(inCombat())
		output("\n\n<b>You’re still in combat, you ninny!</b>");
	if(pc.hasStatusEffect("Temporary Nudity Cheat"))
		output("\n\n<b>BUG REPORT: TEMP NUDITY STUCK ON.</b>");
	//Standard buttons:
	clearMenu(false);
	clearBust();
	inSceneBlockSaving = false;
	updatePCStats();
	//Inventory shit
	itemScreen = mainGameMenu;
	lootScreen = inventory;
	addButton(13, "Inventory", inventory);
	//Other standard buttons
	
	if(pc.lust() < 33)
	{
		if(canArouseSelf()) addButton(8, "Arousal", arousalMenu);
		else addDisabledButton(8, "Masturbate");
	}
	else
	{
		if(pc.hasStatusEffect("Myr Venom Withdrawal")) addDisabledButton(8, "Masturbate", "Masturbate", "While you’re in withdrawal, you don’t see much point in masturbating, no matter how much your body may want it.");
		else if(!pc.canMasturbate()) addDisabledButton(8, "Masturbate", "Masturbate", "You can’t seem to masturbate at the moment....");
		else if(InRoomWithFlag(GLOBAL.WATERFALL)) addButton(8,"Masturbate",fapOnWaterfall,undefined,"Masturbate","Try to blow off some steam.");
		else addButton(8, "Masturbate", masturbateMenu);
	}
	if (!rooms[currentLocation].hasFlag(GLOBAL.BED)) 
	{
		addButton(9, "Rest", restMenu);
	}
	else 
	{
		if (currentLocation == "KI-H16" && flags["KI_REFUSED_VANDERBILT"] != undefined && flags["KI_VANDERBILT_WORKING"] != undefined)
		{
			addDisabledButton(9, "Sleep", "Sleep", "You can’t afford to risk sleeping with Elenora around. Who knows if she’ll be able to hold it together... or if she’ll try something while you rest.");
		}
		else
		{
			addButton(9, "Sleep", sleep);
		}
	}
		
	addButton(14, "Codex", showCodex);
	
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
	
	if (rooms[currentLocation].runAfterEnter != null) rooms[currentLocation].runAfterEnter();

	flags["NAV_DISABLED"] = undefined; // Clear disabled directions.

	//if (kGAMECLASS.debug) this.addButton(13, "RESET NPCs", initializeNPCs);
	
	// Show the minimap too!
	userInterface.showMinimap();
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
public function generateLocationName(location:String):void
{
	setLocation(rooms[location].roomName, rooms[location].planet, rooms[location].system);
}
public function generateLocation(location:String):void
{
	generateMapForLocation(location);
	generateLocationName(location);
}

public function backToPrimaryOutput():void
{
	clearBust();
	userInterface.backToPrimaryOutput();
}
public function clearBust(forceNone:Boolean = false):void
{
	if(forceNone || !inCombat()) showBust("none");
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
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) 
	{
		if(flags["KQ2_MYRELLION_STATE"] == 1) addDisabledGhostButton(3,"EmmyRemote","EmmyRemote","Who knows if Emmy is even alive with what happened to Myrellion. Maybe after you finish with this probe nonsense, you can use your Dad’s resources to track down her whereabouts - assuming she made it out in one piece.");
		else addGhostButton(3,"EmmyRemote",pushEmmysButtonsMenu);
	}
	addGhostButton(4, "Back", backToPrimaryOutput);
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
		backToPrimaryOutput();
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
			output2("<b>" + perk.storageName + "</b>" + ((desc && perkDesc.length > 0) ? (" - " + perkDesc) : ""));
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

public function crewRecruited(allcrew:Boolean = false):Number
{
	var counter:Number = 0;
	
	// Actual crew members
	if (flags["RECRUITED_CELISE"] > 0) counter++;
	if (reahaRecruited()) counter++;
	if (!annoNotRecruited()) counter++;
	if (seraRecruited()) counter++;
	if (bessIsFollower()) counter++;
	if (yammiIsCrew()) counter++;
	if (gooArmorIsCrew()) counter++;
	if (pexigaIsCrew()) counter++;
	
	// Pets or other non-speaking crew members
	if (allcrew)
	{
		if (hasGooArmor() && !gooArmorIsCrew()) counter++;
		if (varmintIsTame()) counter++;
		if (siegwulfeIsCrew()) counter++;
	}
	
	return counter;
}

public function crew(counter:Boolean = false, allcrew:Boolean = false):Number {
	if(!counter) {
		clearOutput();
		clearMenu();
	}
	
	var crewMessages:String = "";
	var count:int = 0; // For actual crew members
	var other:int = 0; // For pets or other non-speaking crew members
	if(celiseIsCrew()) {
		count++;
		if(!counter) {
			addButton((count + other) - 1, "Celise", celiseFollowerInteractions);
			if(reahaIsCrew() && !curedReahaInDebt() && rand(3) == 0) crewMessages += "\n\nCelise looks strangely [reaha.milkColor] at the moment, a cloud of discolored liquid floating listlessly inside her. Looks like she’s been feeding off a certain bovine lately...";
			else crewMessages += "\n\nCelise is onboard, if you want to go see her. The ship does seem to stay clean of spills and debris with her around.";
		}
	}
	if(reahaIsCrew())
	{
		count++;
		if(!counter)
		{

			//Not Addicted (CURED XPACK: reaha.cured_expansion.as)
			if(!reahaAddicted())
			{
				//Slave Reaha, random choice: 
				if(curedReahaInDebt()) 
				{
					if(rand(3) == 0) crewMessages += "\n\nReaha’s wandering around the ship, trying to make herself useful. Mostly cleaning up the place, making sure everything’s spick and span.";
					else if(rand(2) == 0) crewMessages += "\n\nReaha’s sitting in the galley, surrounded by bottles of fresh [reaha.milk]. She’s milking herself to the point of exhaustion trying to pay off her debt to you, by the looks of things.";
					else crewMessages += "\n\nReaha’s in her bunk, the doors closed. Whenever you get too near her quarters you can hear muffled moans and grunts of pleasure. You suppose even without her patches, Reaha’s still exceptionally libidinous after all...";
				}
				//Freed Reaha, random choice: 
				else
				{
					if(rand(4) == 0) crewMessages += "\n\nReaha’s wandering around the ship, trying to make herself useful. Mostly cleaning up the place, making sure everything’s spick and span.";
					else if(rand(3) == 0) crewMessages += "\n\nReaha’s catching a quick nap in the common area, flopped down on the couch and snoozing peacefully.";
					else if(rand(2) == 0) crewMessages += "\n\nReaha’s in the galley, using her Magic Milker to drain her boobs - and make a little cash on the side.";
					else crewMessages += "\n\nReaha’s fiddling with the ship’s point-defenses, making sure they’re calibrated to military spec.";
				}
				addButton((count + other) - 1, "Reaha", curedReahaApproach);
			}
			//Normal Reaha
			else 
			{
				crewMessages += "\n\nReaha is currently meandering around the ship, arms clutched under her hefty bosom, her nipples hooked up to a small portable milker.";
				addButton((count + other) - 1, "Reaha", approachShipBoardReahaWhyDidntSavinCodeThisHeWasntExhaustedYesterday);
			}
		}
	}
	if (annoIsCrew())
	{
		count++;
		if (!counter)
		{
			addButton((count + other) - 1, "Anno", annoFollowerApproach);
			if (hours >= 6 && hours <= 7 || hours >= 19 && hours <= 20) crewMessages += "\n\nAnno is walking about in her quarters, sorting through her inventory and organizing some of her equipment.";
			else if (hours >= 12 || hours <= 13) crewMessages += "\n\nAnno’s busy doing a quick workout in her quarters to the beat of some fast-paced ausar heavy metal. <i>“Gotta keep in shape!”</i> she says.";
			else if (!curedReahaInDebt() && rand(3) == 0) crewMessages += "\n\nAnno’s sitting in the kitchen with a [reaha.milkNoun] moustache on her upper lip, looking awfully happy with herself. You can’t imagine where that came from...";
			else crewMessages += "\n\nAnno is sitting in the common area with her nose buried in half a dozen different data slates. It looks like she’s splitting her attention between the latest Warp Gate research and several different field tests of experimental shield generators.";
		}
		//output("\n\n{PC has Freed Reaha and Anno, add to Anno’s random selection: }");
	}
	if (seraIsCrew())
	{
		other++;
		if (!counter)
		{
			crewMessages += seraOnShipBonus((count + other) - 1);
		}
	}
	if (bessIsCrew())
	{
		count++;
		if (!counter)
		{
			crewMessages += "\n\n[bess.name] is wandering around the ship and keeping [bess.himHer]self busy. It shouldn’t be that hard to find [bess.himHer].";
			addButton((count + other) - 1, bess.short, approachFollowerBess);
		}
	}
	if (yammiIsCrew())
	{
		count++;
		if (!counter)
		{
			crewMessages += "\n\n" + yammiShipBonusText();
			addButton((count + other) - 1, "Yammi", yammiInTheKitchen);
		}
	}
	if (pexigaIsCrew())
	{
		count++;
		if (!counter)
		{
			crewMessages += "\n\n" + pexigaShipBonusText();
			addButton((count + other) - 1, (pexiga.short.toLowerCase() == "lil bobby tables" ? "Lil Bobby" : pexiga.short), approachPexigaCrew);
		}
	}
	if (hasGooArmor() || gooArmorIsCrew())
	{
		if(gooArmorIsCrew()) count++; // Speaking crew member on ship.
		else other++; // Mostly quiet member on person or in storage.
		if (!counter)
		{
			crewMessages += gooArmorOnSelfBonus((count + other) - 1);
		}
	}
	if (varmintIsCrew())
	{
		other++;
		if (!counter)
		{
			crewMessages += varmintOnShipBonus((count + other) - 1);
		}
	}
	if (hasSiegwulfe() || siegwulfeIsCrew() || flags["WULFE_ON_SHIP"] == false)
	{
		other++;
		if (!counter)
		{
			crewMessages += siegwulfeOnShipBonus((count + other) - 1);
		}
	}
	if(!counter) {
		if((count + other) > 0) {
			clearBust();
			showName("\nCREW");
			output("Who of your crew do you wish to interact with?" + crewMessages);
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
public function wait(minPass:int = 0):void
{
	clearOutput();
	
	var hrPass:int = Math.floor(minPass/60);
	
	output("You decide to " + (minPass < 30 ? "stand" : "mosey") + " around and wait for");
	if(hrPass <= 0) output(" " + num2Text(minPass) + " minutes");
	else if(hrPass == 1) output(" one hour");
	else output(" " + num2Text(hrPass) + " hours");
	output(". While doing this doesn’t keep you rested, it manages to pass the time.");
	
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
	if(pc.HPRaw < pc.HPMax()) {
		if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) pc.HP(Math.round(pc.HPMax()));
		else 
		pc.HP(Math.round(pc.HPMax() * .33 * bonusMult));
	}
	if(pc.energy() < pc.energyMax()) {
		pc.energy(Math.round(pc.energyMax() * .33 * bonusMult));
	}
}

public function sleep(outputs:Boolean = true):void {
	
	//Turn encounters back on.
	flags["ENCOUNTERS_DISABLED"] = undefined;
	
	if (kiMedbaySleeps()) return;
	
	var minPass:int = 420 + rand(80) + 1;
	
	if(outputs) clearOutput();
	if(InShipInterior(pc))
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
		//Queue up cured Reaha
		//reahaConfidence at 75 or better. Reaha Addiction at 0%. Happens the next time the PC sleeps aboard ship after Addiction 0.
		if(reahaConfidence() >= 75 && reahaAddiction() <= 0 && flags["REAHA_ADDICTION_CURED"] == undefined)
		{
			if(eventQueue.indexOf(reahaIsAStrongIndependantMilkSlootWhoDontNeedNoPatches) == -1) eventQueue.push(reahaIsAStrongIndependantMilkSlootWhoDontNeedNoPatches);
		}
	}
	if(outputs)
	{
		eventBufferXP();
	}
	if(InShipInterior(pc))
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
			else if (reahaIsCrew() && rand(3) == 0 && flags["CREWMEMBER_SLEEP_WITH"] == "REAHA")
			{
				sleepWithCuredReaha();
				return;
			}
		}
	}
	if(outputs) output("You lie down and sleep for about " + num2Text(Math.round(minPass/60)) + " hours.");
	
	sleepHeal();
	
	processTime(minPass);
	dreamChances();
	if(outputs)
	{
		mimbraneSleepEvents();
		if(InShipInterior(pc)) grayGooSpessSkype();
	}
	
	// Time passing effects
	if(passiveTimeEffects(minPass)) return;
	
	clearMenu();
	if(InShipInterior(pc))
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
		if (tryProcDommyReahaTime(minPass - rand(301)))
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
	if(pc.isSore()) soreChange(-3);
	pc.removeStatusEffect("Jaded");
	pc.removeStatusEffect("Roshan Blue");
	
	if (pc.energy() < pc.energyMax()) pc.energyRaw = pc.energyMax();
}

public function genericSleep(baseTime:int = 480):void
{
	var totalTime:int = baseTime + (rand(baseTime / 3) - (baseTime / 6));
	
	eventBufferXP();
	sleepHeal();
	processTime(totalTime);
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

public function shipMenu():Boolean {
	
	rooms["SHIP INTERIOR"].outExit = shipLocation;
	
	setLocation("SHIP\nINTERIOR", rooms[rooms["SHIP INTERIOR"].outExit].planet, rooms[rooms["SHIP INTERIOR"].outExit].system);

	if(shipLocation == "KIROS SHIP AIRLOCK") output("\n\n<b>You’re parked in the hangar of the distressed ship. You can step out to investigate at your leisure.</b>");
	
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
	//Pexiga hook
	if (yammiIsCrew() && pexigaIsCrew() && flags["PEX&YAM_MEETING"] == undefined)
	{
		approachPexigaCrewFirstTime();
		return true;
	}
	// Goo Armor hook
	if (flags["ANNO_NOVA_UPDATE"] == 2)
	{
		grayGooArrivesAtShip();
		return true;
	}
	
	// Location Exceptions
	if(shipLocation == "600") myrellionLeaveShip();
	
	// Main ship interior buttons
	if(currentLocation == "SHIP INTERIOR")
	{
		if (crew(true, true) > 0) addButton(2, "Crew", crew);
		if (hasShipStorage()) addButton(3, "Storage", shipStorageMenuRoot);
		else addDisabledButton(3, "Storage");
		addButton(4, "Shower", showerMenu);
		addButton(5, "Fly", flyMenu);
	}
	
	return false;
}

public function flyMenu():void {
	clearOutput();
	if(!leavePlanetOK())
	{
		if(flags["CHECKED_GEAR_AT_OGGY"] != undefined)
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
		else 
		{
			pc.removeStatusEffect("Disarmed");
		}
	}
	output("Where do you want to go?");
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
		else if(shipLocation != "POESPACE") addButton(6, "Poe A", flyTo, "Poe A");
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
	//KQ2
	if (flags["KQ2_QUEST_OFFER"] != undefined && flags["KQ2_QUEST_DETAILED"] == undefined)
	{
		addButton(10, "Kara", flyTo, "karaQuest2", "Kara", "Go see what Kara has up her sleeve.");
	}
	
	addButton(14, "Back", mainGameMenu);
}

public function flyTo(arg:String):void {
	
	generateMapForLocation("SHIP INTERIOR");
	
	if (flags["SUPRESS TRAVEL EVENTS"] == 1)
	{
		flags["SUPRESS TRAVEL EVENTS"] = 0;
	}
	else if(!InCollection(arg, ["Poe A", "karaQuest2"]))
	{
		//Eggshit Override!
		if (pc.hasItem(new StrangeEgg()) || pc.hasItemInStorage(new StrangeEgg()))
		{
			//PC can preggo with it?
			//Has an open spot!
			if(pc.findEmptyPregnancySlot(0) != -1 && !pc.hasPregnancyOfType("PsychicTentacles"))
			{
				fuckingEggHatchOhFuck(arg);
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
	else if (arg == "Uveto")
	{
		shipLocation = "UVS F15";
		currentLocation = "UVS F15";
		flyToUveto();
		interruptMenu = true;
	}
	else if (arg == "Canadia")
	{
		shipLocation = "CANADA1";
		currentLocation = "CANADA1";
		flyToCanadia();
	}
	
	var timeFlown:Number = (shortTravel ? 30 + rand(10) : 600 + rand(30));
	StatTracking.track("movement/time flown", timeFlown);
	processTime(timeFlown);
	setLocation("SHIP\nINTERIOR", rooms[shipLocation].planet, rooms[shipLocation].system);
	
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
public function leavePlanetOK():Boolean
{
	if(pc.hasStatusEffect("Disarmed") && shipLocation == "500") return false;
	if(pc.hasKeyItem("RK Lay - Captured")) return false;
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

public function showerMenu(special:String = "ship"):void {
	clearOutput();
	output("You find yourself in the " + special + "’s shower room. What would you like to do?");
	clearMenu();
	addButton(0, "Shower", showerOptions, 0, "Shower", "Take a shower and wash off any sweat or grime you might have.");
	if (special == "ship" && InShipInterior(pc) && pc.lust() >= 33 && crew(true) > 0) addButton(1, "Sex", showerOptions, 1, "Sex", "Have some shower sex with a crew member.");
	showerDoucheToggleButton(5);
	addButton(14, "Back", showerExit);
}
public function showerDoucheToggleButton(btnSlot:int = 5):void
{
	if (pc.statusEffectv1("Anally-Filled") + pc.statusEffectv1("Vaginally-Filled") + pc.statusEffectv1("Orally-Filled") <= 0) return;
	if (pc.hasStatusEffect("Shower Douche Toggle")) addButton(btnSlot, "Rinse: ON", showerDoucheToggle, undefined, "Use Douche", "Clean out the fluids that have been pumped into you. Select to turn rinsing off.");
	else addButton(btnSlot, "Rinse: OFF", showerDoucheToggle, undefined, "No Douche", "Keep the fluids that are inside you for now. Select to turn rinsing on.");
}
public function showerDoucheToggle(btnSlot:int = 5):void
{
	if (pc.hasStatusEffect("Shower Douche Toggle")) pc.removeStatusEffect("Shower Douche Toggle");
	else pc.createStatusEffect("Shower Douche Toggle");
	showerDoucheToggleButton(btnSlot);
}
public function showerExit():void
{
	pc.removeStatusEffect("Shower Douche Toggle");
	mainGameMenu();
}

public function showerOptions(option:int = 0):void
{
	var showerInShip:Boolean = InShipInterior(pc);
	
	if(showerInShip && seranigansTrigger("shower")) return;
	
	clearOutput();
	clearMenu();
	var showerSex:int = 0;
	// Regular showers
	if (option == 0)
	{
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
		
		if(pc.hasStatusEffect("Shower Douche Toggle"))
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
			addButton(0, "Next", showerExit);
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

public function move(arg:String, goToMainMenu:Boolean = true):void
{
	//Prevent movement for nudists into nude-restricted zones.
	if(rooms[arg].hasFlag(GLOBAL.NUDITY_ILLEGAL))
	{
		var nudistPrevention:Boolean = false;
		if((!pc.isChestGarbed() || pc.isChestVisible()) && pc.biggestTitSize() > 1) nudistPrevention = true;
		if(!pc.isCrotchGarbed() || ((pc.hasGenitals() || pc.balls > 0) && pc.isCrotchVisible()) || pc.isAssVisible()) nudistPrevention = true;
		if(pc.canCoverSelf(true)) nudistPrevention = false;
		if(nudistPrevention)
		{
			clearOutput();
			output("Nudity is illegal in that location! You’ll have to cover up if you want to go there.");
			clearMenu();
			if(currentLocation == "SHIP INTERIOR") { /* No need to sneak back if already in ship! */ }
			else addButton(0, "SneakBack", sneakBackYouNudist, undefined, "SneakBack", "Sneak back to the ship. Fuckin’ prudes. It might take you a couple hours to get back safely.");
			addButton(14, "Back", mainGameMenu);
			return;
		}
	}
	//Reset the thing that disabled encounters
	flags["ENCOUNTERS_DISABLED"] = undefined;

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
	if(rooms[arg].hasFlag(GLOBAL.WATERFALL))
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
	if(pc.hasItem(new DongDesigner())) moveMinutes *= 2;
	if(pc.hasItem(new Hoverboard()) || (pc.legType == GLOBAL.TYPE_TENTACLE && pc.hasLegFlag(GLOBAL.FLAG_AMORPHOUS)))
	{
		if(moveMinutes > 1) moveMinutes -= 1;
	}
	StatTracking.track("movement/time travelled", moveMinutes);
	processTime(moveMinutes);
	flags["PREV_LOCATION"] = currentLocation;
	currentLocation = arg;
	generateMap();
	if(pc.hasStatusEffect("Treatment Exhibitionism Gain 4 DickGirls") && pc.hasCock() && rooms[arg].hasFlag(GLOBAL.PUBLIC)) treatmentCumCowExhibitionism();
	trace("Printing map for " + currentLocation);
	//mapper.printMap(map);
	//process time here, then back to mainGameMenu!
	if(goToMainMenu) mainGameMenu(moveMinutes);
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
	if(seraAtNursery()) rooms["NURSERYG12"].addFlag(GLOBAL.NPC);
	else rooms["NURSERYG12"].removeFlag(GLOBAL.NPC);
	
	if((hours < 4 || hours >= 12) && !pc.hasStatusEffect("Liamme Disabled")) 
	{
		if(!rooms["RESIDENTIAL DECK 12"].hasFlag(GLOBAL.NPC)) rooms["RESIDENTIAL DECK 12"].addFlag(GLOBAL.NPC);
	}
	else rooms["RESIDENTIAL DECK 12"].removeFlag(GLOBAL.NPC);

	/* MHENGA */
	
	//Bounties
	if(mhengaActiveBounty()) rooms["ESBETH'S NORTH PATH"].addFlag(GLOBAL.OBJECTIVE);
	else rooms["ESBETH'S NORTH PATH"].removeFlag(GLOBAL.OBJECTIVE);
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
	// Visited Thare Plantation
	if(flags["THARE_MANOR_ENTERED"] != undefined && flags["PQ_P_BURNED"] == undefined) rooms["THARE MANOR"].addFlag(GLOBAL.OBJECTIVE);
	else rooms["THARE MANOR"].removeFlag(GLOBAL.OBJECTIVE);
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
	else if(flags["SHADE_ON_UVETO"] >= 3 && shadeIsHome())
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
	// Pippa's house
	if (flags["PIPPA_RECRUITED"] == 1)
	{
		rooms["PIPPA HOUSE"].removeFlag(GLOBAL.NPC);
	}
	else
	{
		rooms["PIPPA HOUSE"].addFlag(GLOBAL.NPC);
	}
	
	/* VESPERIA / CANADIA STATION */
	/*
	if(flags["KALLY_FAP_2_KIRO"] != undefined)
	{
		rooms["CANADA7"].eastExit = "CANADA8";
	}
	else rooms["CANADA7"].eastExit = "";
	*/


	/* MISC */
	
	// Kiro's Airlock
	kirosShipAirlockUpdate();
	// Phoenix's Rec Room
	phoenixRecRoomUpdate();
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
	
	var totalDays:uint = ((GetGameTimestamp() + deltaT) / 1440) - days;
	
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
	processSeraEvents(deltaT, doOut);
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
	geneSubmissionLevelDecay(deltaT, doOut);
	
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
		processOmegaFever();
		seraBitcheningStoreInventory(totalDays);
		seraOnTavrosObedience(totalDays);
	}
	
	racialPerkUpdateCheck(); // Want to move this into creatures too but :effort: right now
	
	if (!pc.hasStatusEffect("Milk Paused")) lactationUpdateHourTick(Math.floor((minutes + deltaT) / 60));
	
	processMimbranesTime(deltaT, doOut, totalDays);
	processLeithaCharmTime(deltaT, doOut);
	processLaneDetoxEvents(deltaT);
	
	//Check to see if something changed in body part notices
	milkMultiplierGainNotificationCheck();
	milkGainNotes();
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
		if(pc.hasStatusEffect("Dumbfuck Orgasm Queued"))
		{
			if(eventQueue.indexOf(procDumbfuckStuff) == -1) eventQueue.push(procDumbfuckStuff);
		}
	}
	
	// Don't send mails to the player whilst aboard the kashima
	if (flags["KASHIMA_STATE"] != 1)
	{
		//NEVRIE MAIL!
		if (!MailManager.isEntryUnlocked("myrpills") && flags["MCALLISTER_MEETING_TIMESTAMP"] <= (GetGameTimestamp() - (24 * 60))) nevriMailGet();
		if (!MailManager.isEntryUnlocked("orangepills") && flags["MCALLISTER_MYR_HYBRIDITY"] == 2 && GetGameTimestamp() >= (flags["MCALLISTER_MYR_HYBRIDITY_START"] + (7 * 24 * 60))) nevriOrangeMailGet();
		if (!MailManager.isEntryUnlocked("bjreminder") && flags["NEVRIE_FIRST_DISCOUNT_DATE"] != undefined && days >= flags["NEVRIE_FIRST_DISCOUNT_DATE"] + 20) nevriBJMailGet();

		//Emmy Mail
		if (!MailManager.isEntryUnlocked("emmy_apology") && flags["EMMY_EMAIL_TIMER"] <= (GetGameTimestamp() - (24 * 60))) emmyMailGet();
		//Emmy mail stage 2 START
		if (!MailManager.isEntryUnlocked("emmy_gift_starter") && flags["EMMY_ORAL_TIMER"] <= (GetGameTimestamp() - (72 * 60))) emmyMailGet2();
		//Emmy mail set up for sextoy go
		if (!MailManager.isEntryUnlocked("emmy_implant_explain_email") && flags["EMMY_PRESEX_FUN_TIMER"] <= (GetGameTimestamp() - (100 * 60))) emmyMailGet3();
		if (!MailManager.isEntryUnlocked("emmy_harness_here") && flags["EMMY_TOY_TIMER"] <= GetGameTimestamp()) emmyMailGet4();

		//Saendra Mail
		if (!MailManager.isEntryUnlocked("saendrathanks") && flags["FALL OF THE PHOENIX STATUS"] >= 1 && flags["SAENDRA_DISABLED"] != 1 && rooms[currentLocation].planet != "SHIP: PHOENIX" && !InShipInterior(pc)) saendraPhoenixMailGet();
		//Anno Mail
		if (!MailManager.isEntryUnlocked("annoweirdshit") && flags["MET_ANNO"] != undefined && flags["ANNO_MISSION_OFFER"] != 2 && flags["FOUGHT_TAM"] == undefined && flags["RUST_STEP"] != undefined && rand(20) == 0) goMailGet("annoweirdshit");
		//KIRO FUCKMEET
		if (!MailManager.isEntryUnlocked("kirofucknet") && flags["RESCUE KIRO FROM BLUEBALLS"] == 1 && kiroTrust() >= 50 && flags["MET_FLAHNE"] != undefined && flags["KIRO_ORGY_DATE"] == undefined && rand(3) == 0) { goMailGet("kirofucknet", -1, kiroFuckNetBonus()); }
		//KIRO DATEMEET
		if (!MailManager.isEntryUnlocked("kirodatemeet") && kiroTrust() >= 100 && kiroSexed() && rand(10) == 0) { goMailGet("kirodatemeet"); }
		trySendStephMail();
		
		//Jade muff-ins
		if (!MailManager.isEntryUnlocked("jade_dumplings") && rooms[currentLocation].planet != "TAVROS STATION" && flags["GOTTEN_INTIMATE_WITH_JADE"] != undefined && flags["GOTTEN_INTIMATE_WITH_JADE"] >= 4 && rand(3) == 0) { goMailGet("jade_dumplings"); }

		if (!MailManager.isEntryUnlocked("del_moved") && delilahSubmissiveness() >= 5 && rand(10) == 0 && getPlanetName() != "Tarkus") { goMailGet("del_moved"); }

		// Pippa Nuru massage email
		if (!MailManager.isEntryUnlocked("pippa_nuru") && flags["PIPPA_NURU_TIMER"] <= (GetGameTimestamp() - (24 * 60))) pippaNuruEmailGet();

		//Plantation Quest Offer
		//Key string - "plantation_quest_start"
		if (!MailManager.isEntryUnlocked("plantation_quest_start") && flags["PLANTATION_MEALS"] != undefined && flags["PLANTATION_ZIL_TALK"] != undefined && flags["PLANTATION_PLANTATION_TALK"] != undefined && flags["PLANTATION_WORKERS_TALK"] != undefined && flags["PLANET_3_UNLOCKED"] != undefined)
		{
			if(flags["PQUEST_DELAY_TIMER"] == undefined) flags["PQUEST_DELAY_TIMER"] = GetGameTimestamp();
			else if(GetGameTimestamp() >= flags["PQUEST_DELAY_TIMER"] + 60*10) goMailGet("plantation_quest_start");
		}

		//Other Email Checks!
		if (rand(100) == 0) emailRoulette();
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

public function processOmegaFever():void
{
	if (pc.hasPerk("Omega Fever"))
	{
		(new OmegaOil()).checkOmegaFever();
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
	if (flags["KQ2_NUKE_STARTED"] != undefined && flags["KQ2_NUKE_EXPLODED"] == undefined)
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
	if (flags["GIANNA_AWAY_TIMER"] != undefined && flags["GIANNA_AWAY_TIMER"] > 0) giannaAWOL( -1);
	
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
		if (pc.hasStatusEffect("The Treatment")) treatmentHourProcs(totalHours);
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
	
	if (totalDays >= 1 && flags["SAENDRA_XPACK1_STATUS"] == undefined && shipLocation == "TAVROS HANGAR" && saendraAffection() >= 60 && !MailManager.isEntryUnlocked("saendraxpack1") && eventQueue.indexOf(unlockSaendraXPackMail) == -1)
	{
		eventQueue.push(unlockSaendraXPackMail);
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

public function processSeraEvents(deltaT:uint, doOut:Boolean):void
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
}

public function processReahaEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	var totalHours:int = ((minutes + deltaT) / 60);
	if (totalHours >= 1 && flags["REAHA_PAY_Q"] == 1 && currentLocation == "SHIP INTERIOR")
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

public function racialPerkUpdateCheck():void
{
	if(pc.hasPerk("'Nuki Nuts"))
	{
		if(pc.balls <= 0 && pc.perkv1("'Nuki Nuts") != 0)
		{
			// Empty reserves!
			pc.ballSizeMod -= pc.perkv1("'Nuki Nuts");
			pc.setPerkValue("'Nuki Nuts", 1, 0);
		}
		if(pc.perkv2("'Nuki Nuts") != 1 && pc.nukiScore() < 3)
		{
			if(pc.balls > 0)
			{
				//Nuts inflated:
				if(pc.perkv1("'Nuki Nuts") > 0)
				{
					AddLogEvent(ParseText("The extra size in your [pc.balls] bleeds off, making it easier to walk. You have a hunch that without all your"), "passive");
					if(pc.originalRace.indexOf("kui-tan") != -1) ExtendLogEvent(" natural kui-tan genes");
					else ExtendLogEvent(" kui-tan body-mods");
					ExtendLogEvent(ParseText(", you won’t be swelling up with excess [pc.cumNoun] any more."));
				}
				//Nuts not inflated:
				else
				{
					AddLogEvent(ParseText("A tingle spreads through your [pc.balls]. Once it fades, you realize that your [pc.sack] is noticeably less elastic. Perhaps you’ve replaced too much kui-tan DNA to reap the full benefits."), "passive");
				}
				ExtendLogEvent("\n\n(<b>Perk Lost: 'Nuki Nuts</b>)");
				pc.ballSizeMod -= pc.perkv1("'Nuki Nuts");
				pc.removePerk("'Nuki Nuts");
				nutStatusCleanup();
			}
			else
			{
				AddLogEvent("(<b>Perk Lost: 'Nuki Nuts</b> - You no longer meet the requirements. You’ve lost too many kui-tan transformations.)", "passive");
				pc.removePerk("'Nuki Nuts");
			}
		}
		else if(pc.perkv2("'Nuki Nuts") == 1 && pc.balls <= 0)
		{
			AddLogEvent("A strange sensation hits your nethers that forces you to wobble a little... Checking your status on your codex, it seems that removing your ballsack has also made the signature testicle-expanding tanuki mod vanish as well!\n\n(<b>Perk Lost: 'Nuki Nuts</b> - You have no nuts to expand!)", "passive");
			pc.removePerk("'Nuki Nuts");
		}
	}
	if(pc.hasPerk("Fecund Figure"))
	{
		if(!pc.hasVagina())
		{
			AddLogEvent("No longer possessing a vagina, your body tingles", "passive");
			if((pc.perkv1("Fecund Figure") + pc.perkv2("Fecund Figure") + pc.perkv3("Fecund Figure")) > 0) ExtendLogEvent(", rapidly changing as you lose your fertility goddess-like build");
			ExtendLogEvent(".\n\n(<b>Perk Lost: Fecund Figure</b>)");
			pc.removePerk("Fecund Figure");
		}
	}
	if(pc.hasStatusEffect("Special Scrotum"))
	{
		if(pc.balls <= 0)
		{
			AddLogEvent("A tingling sensations hits your crotch as you feel something fading away... Your codex beeps, informing you that, due to the lack of testicles, the unique covering for your non-existent scrotum has finally dissolved from your system.", "passive");
			pc.removeStatusEffect("Special Scrotum");
		}
	}
	if(pc.statusEffectv4("Vanae Markings") > 0)
	{
		if(pc.balls <= 0)
		{
			AddLogEvent("A tingling sensations hits your crotch as you feel something fading away... Your codex beeps, informing you that the last remnants of your " + pc.skinAccent + " testicular tattoos have left your body, leaving the area bare.", "passive");
			pc.setStatusValue("Vanae Markings", 4, 0);
		}
	}
	if(pc.hasStatusEffect("Nyrea Eggs"))
	{
		if(pc.nyreaScore() < 3)
		{
			AddLogEvent("You are interrupted by a shifting in your insides as a bubbling sensation fills your loins, and then... nothing.", "passive");
			if(pc.statusEffectv1("Nyrea Eggs") > 0)
			{
				ExtendLogEvent(" Strangely, you feel");
				if(pc.statusEffectv1("Nyrea Eggs") <= 5) ExtendLogEvent(" as if something is missing.");
				else if(pc.statusEffectv1("Nyrea Eggs") <= 10) ExtendLogEvent(" a bit lighter now.");
				else if(pc.statusEffectv1("Nyrea Eggs") <= 50) ExtendLogEvent(" like you have lost some pounds.");
				else if(pc.statusEffectv1("Nyrea Eggs") <= 100) ExtendLogEvent(" much lighter now.");
				else ExtendLogEvent(" like a huge weight has been lifted from you.");
			}
			ExtendLogEvent(" Double-checking your codex, you find that");
			if(pc.statusEffectv1("Nyrea Eggs") > 0) ExtendLogEvent(ParseText(" the nyrean eggs you’ve been carrying in your [pc.cumNoun] have dissolved and absobed into your body"));
			else ExtendLogEvent(ParseText(" your [pc.cumNoun] is no longer capable of producing eggs anymore"));
			ExtendLogEvent(". It must be due to the lack of nyrean genes in your system....");
			pc.removeStatusEffect("Nyrea Eggs");
		}
	}
	if(pc.hasPerk("Slut Stamp"))
	{
		if(!pc.hasGenitals())
		{
			AddLogEvent(ParseText("A sudden burning sensation hits your lower back, right above your [pc.ass]. You quickly"), "passive");
			if(pc.isCrotchGarbed()) ExtendLogEvent(ParseText(" struggle through your [pc.lowerGarments],"));
			ExtendLogEvent(" turn back and wince hard when the area is instantly struck by a refreshing coolness - as if being splashed on with cold water after being branded. When your hazed vision returns to normal, you see the slutty tattoo that resides there gradually dissolve and vanish before your eyes. It looks like your lack of genitalia makes it easier for you to cope with your libido now.\n\n(<b>Perk Lost: Slut Stamp</b>)");
			pc.removePerk("Slut Stamp");
		}
	}
	if (pc.hasPerk("Androgyny") && pc.perkv1("Androgyny") > 0 && !pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED))
	{ // racialPerkUpdateCheck: removal of Androgyny perk with the loss of muzzle.
		AddLogEvent("With your face becoming more human, your appearance is now no longer androgynous.\n\n(<b>Perk Lost: Androgyny</b> - You’ve lost your muzzle.)", "passive");
		pc.removePerk("Androgyny");
	}
	if (pc.hasPerk("Icy Veins") && pc.perkv1("Icy Veins") > 0 && (!pc.hasSkinFlag(GLOBAL.FLAG_FLUFFY) || !InCollection(pc.skinType, GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_FEATHERS)))
	{ // racialPerkUpdateCheck: removal of Icy Veins perk with he loss of fluffy fur (fork on still having fur but not fluffy flag?).
		AddLogEvent("Without all that thick, fluffy coat of fur you suddenly feel rather cold...\n\n(<b>Perk Lost: Icy Veins</b> - You’ve lost your insulating coat of fur, and as a result you are now weaker against cold.)", "passive");
		pc.removePerk("Icy Veins");
	}
	if(flags["GALOMAX_DOSES"] != undefined)
	{
		if(pc.hasHair() && pc.hairType != GLOBAL.HAIR_TYPE_GOO && !pc.hasStatusEffect("Hair Regoo"))
		{
			AddLogEvent(ParseText("There is a slight tingling sensation at the roots of your [pc.hair].... Hm, strange...."), "passive");
			pc.createStatusEffect("Hair Regoo", 0, 0, 0, 0, true, "", "", false, 720);
		}
	}
	if(pc.hasPerk("Black Latex"))
	{
		if(pc.skinType != GLOBAL.SKIN_TYPE_LATEX && !pc.hasStatusEffect("Latex Regrow"))
		{
			AddLogEvent("Somehow, losing your natural latex skin makes you feel naked and insecure... You hope this feeling doesn’t last for too long...", "passive");
			pc.createStatusEffect("Latex Regrow", 0, 0, 0, 0, true, "", "", false, 720);
		}
	}
	if(pc.armType == GLOBAL.TYPE_FLOWER && pc.hasVagina())
	{
		if(pc.totalWombPregnancies() < pc.vaginas.length)
		{
			if(pc.hasStatusEffect("Arm Flower")) return;
			
			// Choose Flower Color
			var flowerColor:String = RandomInCollection(["red", "yellow", "blue", "purple", "pink", "white"]);
			
			AddLogEvent("A summery feeling spreads down your arm ivy, like tiny veins of lustful energy. You intimately feel each of the small " + flowerColor + " flowers that pop and blossom into being on the delicate vines, like little skips of the heart.\n\nWhy have you flowered like this? The rational part of your brain doesn’t have an answer... but the clear, green part of you knows. Your empty womb and [pc.eachVagina] know. You are ripe and ready for seeding, and your body is brightly signaling that fact to anyone that looks at you the best way it knows how.", "passive");
			
			pc.createStatusEffect("Arm Flower", 0, 0, 0, 0, true, "", flowerColor, false);
			// +Lust, slow Libido increase of 5
			pc.slowStatGain("libido", 5);
			pc.lust(50);
		}
		else if(pc.hasStatusEffect("Arm Flower"))
		{
			AddLogEvent("Your " + pc.getStatusTooltip("Arm Flower") + " arm flowers droop and, over the course of the next hour, de-petal. Evidently they feel their work is done... which can only mean one thing. You stroke your [pc.belly].", "passive");
			
			//Libido decrease of 3
			pc.libido(-3);
			pc.removeStatusEffect("Arm Flower");
		}
	}
	else if(pc.armType != GLOBAL.TYPE_FLOWER && pc.hasStatusEffect("Arm Flower"))
	{
		pc.removeStatusEffect("Arm Flower");
	}
	if(pc.hasPerk("Resin"))
	{
		if(pc.skinType != GLOBAL.SKIN_TYPE_BARK)
		{
			AddLogEvent("The surface of your body tingles and your nose briefly catches a whiff of a familiar amber aroma--which then completely dissipates into the air. Curious, you check your codex and, sure enough, due to the lack of your once bark skin, you’ve lost the ability to create a resin cast to protect yourself. Well, at least you feel a bit more nimble now...\n\n(<b>Perk Lost: Resin</b>)", "passive");
			
			pc.removePerk("Resin");
		}
	}
	if(pc.hasPerk("Flower Power"))
	{
		var numFlowers:int = 0;
		if(pc.hasStatusEffect("Hair Flower"))
		{
			if(pc.statusEffectv1("Hair Flower") > 1) numFlowers += pc.statusEffectv1("Hair Flower");
			else numFlowers++;
		}
		if(pc.hasStatusEffect("Arm Flower")) numFlowers += 2;
		if(pc.hasVaginaType(GLOBAL.TYPE_FLOWER)) numFlowers += pc.totalVaginas(GLOBAL.TYPE_FLOWER);
		if(pc.tailGenitalArg == GLOBAL.TYPE_FLOWER && pc.hasTailCunt()) numFlowers += pc.tailCount;
		
		if (pc.perkv1("Flower Power") <= 0 && numFlowers > 0)
		{
			AddLogEvent("The flower" + (numFlowers == 1 ? "" : "s") + " located on your body blossom" + (numFlowers == 1 ? "s" : "") + ", ready to unleash " + (numFlowers == 1 ? "its" : "their") + " lust-inducing spores--this also adds to your sexual appetite... not that that’s a bad thing, after all!", "passive");
		}
		else if (pc.perkv1("Flower Power") > 0 && numFlowers <= 0)
		{
			AddLogEvent("Without any flowers located on your body, you feel the need to produce spores fade. While this relaxes your body’s sexual urges, you know that producing any new flowers will have you ready for pollination again.", "passive");
		}
		
		pc.setPerkValue("Flower Power", 1, numFlowers);
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

// Checkin' da E-mails
public function goMailGet(mailKey:String = "", timeStamp:int = -1, messageBody:String = ""):void
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
		if (mailEmail.FromAddress != null) mailFromAdress = mailEmail.FromAddress();
		if (messageBody.length == 0)
		{
			AddLogEvent("<b>New Email from " + mailFrom + " (" + mailFromAdress +")!</b>", "words");
		}
		else
		{
			AddLogEvent("<b>New Email from " + mailFrom + " (" + mailFromAdress +")!</b>" + messageBody, "words");
		}
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
		// Any special actions/unlocks
		var mailEmail:Object = MailManager.getEntry(mailKey);
		if(mailEmail.SubjectCache != null) mailSubject = mailEmail.SubjectCache;
		if(mailEmail.Subject != null) mailSubject = mailEmail.Subject();
		if(mailEmail.ContentCache != null) mailContent = mailEmail.ContentCache;
		if(mailEmail.Content != null) mailContent = mailEmail.Content();
		
		// Regular:
		if (mailKey == "kirofucknet")
		{
			goMailGet(mailKey, -1, kiroFuckNetBonus());
		}
		// Spam:
		else if (mailKey == "cov8" && flags["SPAM_MSG_COV8"] == undefined)
		{
			flags["SPAM_MSG_COV8"] = 1;
		}
		else if(mailKey == "fatloss" && pc.isBimbo())
		{
			goMailGet(mailKey, -1, " The subject line reads <i>“" + mailSubject + "”</i>. Ooo, secrets and stuff! You eagerly open the message and the codex lights up with the display:\n\n<i>" + mailContent + "</i>\n\nMmm, that sounds yummy!");
			pc.lust(20);
			MailManager.readEntry("fatloss", GetGameTimestamp());
		}
		else if(mailKey == "estrobloom" && !pc.hasKeyItem("Coupon - Estrobloom"))
		{
			goMailGet(mailKey, -1, "\n\n<b>You have gained a coupon for Estrobloom!</b>");
			pc.createKeyItem("Coupon - Estrobloom", 0.9, 0, 0, 0, "Save 10% on your next purchase of Estrobloom!");
		}
		else if(mailKey == "hugedicktoday" && pc.isBro() && pc.hasCock())
		{
			goMailGet(mailKey, -1, " The subject line reads <i>“" + mailSubject + "”</i>. Hell yeah--who wouldn’t want a bigger dick? You quicky open the message to read its contents and the codex lights up with the display:\n\n<i>" + mailContent + "</i>\n\nYou’re not quite sure you understood all that, but your dick did.");
			pc.lust(20);
			MailManager.readEntry("hugedicktoday", GetGameTimestamp());
		}
		else
		{
			goMailGet(mailKey);
		}
	}
}
