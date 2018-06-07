import classes.Characters.InfectedCrewmember;
import classes.Items.Melee.VampBlade;
import classes.Items.Miscellaneous.OSStimBoost;
public function kiEnterShuttleLZ():void
{
	output("The Nova Securities shuttle that ferried you over is parked here, surrounded by pools of some unidentifiable white sludge splattered all over the ground.");
	if (pc.isBimbo()) output(" Actually... you’re pretty sure it’s cum. Old, musky cum. What a waste!");
	output(" The shuttle’s been locked down tight by the leithan Nova pilot, meaning you’re not getting out of here without her.");

	if (flags["KI_ESCAPE_UNCURED"] != undefined)
	{
		addButton(0, "Escape!", kiEscapeShuttle, undefined, "Escape!", "You don’t have any choice left -- get off the <i>Kashima</i> and make a run for it. You escaping is the only hope the crew has left!");
	}
}

public function kiElevatorTerminal():void
{
	flags["NAV_DISABLED"] = 0;
	
	output("A bank of elevators sits on the east bulkhead, all of which have big, red EMERGENCY signs printed out on their displays instead of the floor selectors. Somebody must have triggered a lockdown...");
	
	addButton(0, "Elevators", kiGoElevators, undefined, "Elevators", "Take a look at the personnel elevators.");
	addButton(2, "WhiteSlime", kiElevatorWhiteStuff, undefined, "White Slime", "What’s that slime on the walls... and the deck... and everywhere?");
	
	if (flags["KI_ESCAPE_UNCURED"] != undefined)
	{
		output("\n\nThe north bulkhead has been cut away to reveal a now-empty lift shaft, fit for a huge cargo elevator. Peering through the hole in the bulkhead, all you can make out is an endless black void, and the not so subtle groans of the shambling, infected crew somewhere down in the darkness.");
		
		flags["NAV_DISABLED"] |= NAV_NORTH_DISABLE;
	}
	else
	{
		output("\n\nThe north bulkhead has been cut away to reveal a heavy-duty cargo elevator, probably meant to ferry raw materials from the cargo hold at the ship’s rear to the deck for transportation. The lights around it have been completely destroyed -- looks like they were torn out by hand. More of that viscous white crap is dripping down the walls of the elevator shaft, creating a horribly musky, masculine aroma that threatens to overwhelm you the closer you are to the cargo lift.");
	}
	
	if (flags["KI_USED_ELEVATORS"] == undefined)
	{
		addButton(1, "CargoLift", kiGoCargolift, undefined, "Cargo Lift", "Let’s see if the cargo lift is still working. Looks like the only way you’re getting out of the hangar.");
		flags["NAV_DISABLED"] |= NAV_NORTH_DISABLE;
	}
	
	flags["NAV_DISABLED"] |= NAV_EAST_DISABLE;
}

public function kiElevatorWhiteStuff():void
{
	clearOutput();
	output("In the flickering light of the emergency alarms, you squat down next to a growing pool of white sludge next to the cargo elevator shaft. You get a face-full of its pungent, musky odor. The smell is instantly, impossibly familiar: it smells like cum. You scrunch your nose and glance up into the dark depths of the cargo shaft. More of the cummy white gunk is sloughing down the walls, like");
	if (flags["RESCUE KIRO FROM BLUEBALLS"] != undefined) output(" Kiro");
	else output(" some over-loaded kui-tan");
	output(" had busted a torrential nut somewhere on the upper decks. What in the world...");

	addDisabledButton(2, "WhiteSlime");
}

public function kiGoElevators():void
{
	clearOutput();
	output("The <i>Kashima</i>’s elevator banks look to have been locked down. A red sign over each says in big, bold letters “EMERGENCY.” You can’t tell from here if it’s a lockdown due to structural damage to the ship, or if it’s a security lockdown. The ship seemed to be intact when you flew in, but who knows.... Either way, you’re not getting anywhere this way.");
	addDisabledButton(0, "Elevators");
}

public function kiGoCargolift():Boolean
{
	if (flags["KI_USED_ELEVATORS"] == undefined)
	{
		clearOutput();
		flags["KI_USED_ELEVATORS"] = 1;
		currentLocation = "KI-E23";
		generateLocation(currentLocation);
		mainGameMenu();
	}
	
	return false;
}

public function kiCargoLiftRoomFunction():Boolean
{
	if (flags["KI_ELEVATOR_INTRO"] == undefined)
	{
		flags["KI_ELEVATOR_INTRO"] = 1;
		output("\n\n<i>“Chief Neykkar!”</i> one of the Nova troopers shouts, waving the leithan amazon over in your direction. She stomps over, curling her nose as she forges into the musky haze coming off the white slime on the walls.");
		
		output("\n\n<i>“Ugh, what the fuck is that?”</i> she growls, hefting her machine gun onto her shoulder and covering her mouth and nose with the other hand. <i>“Smells like an ausar locker room over here.”</i>");
		
		output("\n\nThe merc grunt shrugs. <i>“Cargo elevator looks operational. Ship schematics say it should take us all the way to the command deck.”</i>");
		
		output("\n\nChief Neykkar turns her attention to you, starry blue eyes narrowing. <i>“You’re the suit here, Steele. When you’re ready, we’ll take you up to the bridge. Should be able to reactivate power from there, maybe find out where the crew’s gone.”</i>");
		
		output("\n\n<i>“Place gives me the creeps, " + pc.mf("sir", "ma’am") +",”</i> the Nova grunt says to you, running his hands along the top of his laser carbine.");
		addButton(0, "Use Lift", kiGoUseCargoLift);
	}
	else
	{
		output("\n\nThe Chief is still here, waiting for you before heading into the bowels of the ship.");
		addButton(0, "Use Lift", kiGoUseCargoLift);
	}

	return false;
}

public function kiGoUseCargoLift():void
{
	clearOutput();
	output("You step onto the cargo elevator and take a look up. The car is open-air, letting you see into the shaft. Like everything else around here, it’s covered in what you’re fairly sure must be gallons of cum, drooling down the bulkheads around you from the darkness above. You can only see maybe twenty feet up before the emergency lights cut out completely, leaving darkness shrouding the upper decks. The only real illumination left are the red emergency lights wired onto the railing of the lift. Guess you won’t be seeing what’s causing the deluge until you get up there.");
	
	output("\n\nChief Neykkar follows you, stepping aboard just in time for a huge glob of white to fall from on high and splatter across her chitinous horse-body’s backside, making her eyes go wide and her bunny ears flick up in alarm.");
	
	output("\n\n<i>“God dammit,”</i> she growls, flicking the sludge off with her tail-tip. It leaves a gross smear across her NovaSec armor, dripping wetly between her legs. <i>“What is with this shit?”</i>");
	
	output("\n\nYou shrug, suggesting the only way you’re going to find out is going up. She gives you a firm nod and turns to the rest of her troops. <i>“Alright people, everyone aboard. Keep your hands and legs inside the vehicle at all times.”</i>");
	
	output("\n\nThe troops pile in, nervously looking up and trying to dodge the falling globs of maybe-spunk. Amid a few curses and grunts of disgust, their Chief shoves her way to the back of the car and punches the UP button. A screech of gears grinding shudders through the shaft, echoing up the tunnel, and the cargo car shudders beneath you. The handful of crates aboard shift, and you and the Nova troops all wobble as the cart starts moving.");
	
	output("\n\nThe ascent is jerky and slow, like the lift’s been damaged and is only just barely able to actually carry your company’s weight. Barely a deck up and the downpour of cummy white sludge starts getting unbearable, splattering more and more across the rusty elevator floor and hitting several of the Nova grunts on the helmet. Their complaints become more and more agitated as white cream smears over their visors and hands.");
	
	output("\n\nSomething else falls down amid the rain of white, smashing down onto the deck just beside you. You stumble out of the way as what looks like some kind of heavy grating clatters away in a shower of sparks and fluids. It bounces straight into one of the Nova troopers, barreling him down to the ground with a nasty crunch of buckling armor plates.");
	
	output("\n\nSomething screams above you, drawing all eyes from the wounded man up to the shadowy shaft. Your first thought is that it’s the screech of straining machinery - a brake on the elevator trying desperately to grind to a halt. But then it happens again, reverberating through the shaft from above. Then the rain of white stops, completely cut off the moment the screeching stops.");
	
	output("\n\n<i>“That... that wasn’t human.”</i> one of the mercenaries next to you breathes, shouldering his laser rifle and shining its flashlight upwards, piercing the darkness.");
	
	output("\n\nAs far as you can see, every elevator door on every deck above you is hanging open. People stare down from every one of them, shadowy figures looking at the oncoming elevator with curiosity and surprise. Most look human and ausar at a glance, but the longer you see them, the more you realize something’s... off about the crew. Their Steele Tech jumpsuits are in tatters, exposing flushed skin and fur and scales, as well as parts that shouldn’t be there. Before you can get a good look at the alien bodies on display, several of them screech with inhuman rage and leap from the upper decks.");
	
	output("\n\n<i>“What the-”</i> a Nova soldier manages to yelp before a crewman slams into her from on high, throwing her to the deck and ripping at her uniform. The soldier screams, and more wild-eyed bodies land around you, lashing out at everyone around you. Now that they’re in the light, you can see that every one of the crewmen has blood-red flesh, and their bodies have become covered in writhing masses of flesh. Tentacles, growing from their groins, faces, even backs and arms. Oh, God...");
	
	output("\n\nYou’re snapped out of your reverie by a hard shove aside. Chief Neykkar pushes past you, planting herself between you and the warped crewmen. She shoulders her machine gun and opens fire, roaring orders over the growing din of laser screams. You stagger up to your");
	if (!pc.isNaga()) output(" feet");
	else output(" upper coils");
	output(" and grab your [pc.weapon], finding yourself staring down a horde of ravening Steele Tech employees that seem determined to take you.");

	processTime(2);
	
	var f:Array = [pc];
	if (flags["CHIEF_NEYKKAR_WITH_PC"] == 1) f.push(new ChiefNeykkar());

	var h:Array = [];
	for (var i:int = 0; i < 4; i++)
	{
		h.push(new InfectedCrewmember());
	}
	
	h[0].createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(f);
	CombatManager.setHostileActors(h);
	CombatManager.displayLocation("INFECTED CREW");
	CombatManager.victoryCondition(CombatManager.ENTIRE_PARTY_DEFEATED);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
	CombatManager.victoryScene(kiCargoLiftVictory);
	CombatManager.lossScene(kiCargoLiftLoss);
	CombatManager.encounterTextGenerator(function():String {
		var m:String = "You’re fighting" + (CombatManager.enemiesAlive() == 1 ? " the last of the" : " several") + " Steele Tech mutant crewmen. These poor souls come in all shapes and sizes, races and sexes, but are unified in a blood-red coloration of their bodies and the writhing tendrils sprouting like cancerous growths from all over their bodies. Every one of them has several such tentacles growing from their loins, but the similarities end there. Some have tendrils drooling from their mouths where their tongues should be; others from their limbs or backs and even breasts. The crew look mindless, overcome with sadistic lust -- the fire of intelligence has long since burned out in their eyes, leaving them acting like mindless monsters, thirsting for your body.";
		return m;
	});
	
	clearMenu();
	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function kiEnterMedbay():Boolean
{
	flags["NAV_DISABLED"] = NAV_SOUTH_DISABLE;
	addButton(0, "Vent", kiE9EnterVents);
		
	if (pc.hasKeyItem("Parasite Sample"))
	{
		kiMedbayCure();
		return true;
	}
	
	if (flags["KI_VANDERBILT_WORKING"] == 1)
	{
		if (flags["KI_VANDERBILT_WORKING_START"] + 240 < GetGameTimestamp())
		{
			kiApproachElenora();
			return true;
		}
		
		output("\n\nDoctor Vanderbilt is sitting at the only operational holo-terminal in the bay, busily working on her cure.");
		addDisabledButton(1, "Elenora", "Approach Elenora", "The doctor looks totally engrossed in her work; probably best to give her a little more time.");
	}
	else
	{
		addDisabledButton(1, "Elenora", "Approach Elenora", "You’ve got places to be and things to do, no point wasting time.");
	}
	
	if (flags["KI_REFUSED_VANDERBILT"] != undefined && flags["KI_VANDERBILT_WORKING"] != undefined)
	{
		addDisabledButton(9, "Sleep", "Sleep", "You can’t afford to risk sleeping with Elenora around. Who knows if she’ll be able to hold it together... or if she’ll try something while you rest.");
	}
	
	return false;
}

public function kiP18CommandDeck():Boolean
{
	output("\n\nTo the north is a");
	if (flags["KI_P16_UNLOCKED"] == undefined)
	{
		flags["NAV_DISABLED"] = NAV_NORTH_DISABLE;
		output(" sealed");
	}
	else
	{
		flags["NAV_DISABLED"] = 0;
		output(" unlocked");
	}
	output(" security door labeled ‘Captain’s Ready Room’.");
	
	output("\n\nTo the east is the head of the ship, and a heavy-duty security door ahead bears the ‘BRIDGE’ markings overhead. A pair of disabled shock-turrets once guarded these sensitive chambers, but have long since been overwhelmed by what must have been gallons of cum. They’ve completely shorted out.");

	
	if (flags["KASHIMA_HOLMES_DEFEATED"] != undefined)
	{
		flags["NAV_DISABLED"] |= NAV_EAST_DISABLE;
		output(" Given the current state of the captain, it’s probably wise to give the bridge a wide berth....");
	}
	
	if(flags["KI_P16_UNLOCKED"] != undefined)
	{
		// noop
	}
	else if (flags["KI_P16_FAILURES"] == undefined || flags["KI_P16_FAILURES"] <= 3)
	{
		addButton(0, "Hack Door", kiTryUnlockReadyRoom, undefined, "Hack Door Lock", "Attempt to hack the door lock to the north.");
	}
	else
	{
		addDisabledButton(0, "Hack Door", "Hack Door Lock", "You’ve failed too many times and the lock has shutdown!");
	}

	return commandDeckRandomEncounter();
}

public function kiTryUnlockReadyRoom():void
{
	userInterface.showMinigame();
	var gm:RotateMinigameModule = userInterface.getMinigameModule();
	
	var g:uint = RGMK.NODE_GOAL;
	var i:uint = RGMK.NODE_INTERACT;
	var l:uint = RGMK.NODE_LOCKED;
	
	var n:uint = RGMK.CON_NORTH;
	var e:uint = RGMK.CON_EAST;
	var s:uint = RGMK.CON_SOUTH;
	var w:uint = RGMK.CON_WEST;
	
	// 9999 update with new puzzle
	gm.setFailablePuzzleState(
		kiSuccessfullyUnlockReadyRoom, 
		kiFailedToUnlockReadyRoom, 
		RotateMinigameModule.MAX_MOVES, 22,
		5, 5, 
	[
		g | e | s, 	i | n | s, 	i | w | s, 	i | n | e, 	g | w,
		i | e | w, 	l, 			i | s | w, 	i | n | e, 	l,
		i | n | s, 	l, 			i | n | s, 	l, 			l,
		i | w | n, 	i | n | e, 	i | n | e, 	i | e | w,	i | n | e,
		i | s | e,	i | w | s,	i | s | e,	l,			g | n
	]);
}

public function kiSuccessfullyUnlockReadyRoom():void
{
	clearOutput();
	
	output("It’s a quick matter to rip some of the wiring out, cross it, and short out the security system. After about a minute of work, the door slides open. Success!");
	
	flags["KI_P16_UNLOCKED"] = 1;

	processTime(2);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kiFailedToUnlockReadyRoom():void
{
	clearOutput();
	
	output("The door locks security finally detects that somebody is doing something rather untoward with it, quickly locking you out of your attempts to bypass it. Seconds tick by with agonizing slowness...");
	
	IncrementFlag("KI_P16_FAILURES");
	
	if (flags["KI_P16_FAILURES"] <= 3)
	{
		output(" but the display flickers back to its default layout eventually.");
	}
	else
	{
		output(" but nothing seems to happen. Looks like the device has finally locked you out. Bummer.");
	}
	
	processTime(2);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kiP16CaptainsReadyRoom():void
{
	output("\n\n");
	if (flags["KI_TAKEN_SWORD"] == undefined)
	{
		output("A slender, straight-edged sword hangs from a display behind the captain’s desk, next to a pair of empty holsters. ");
		addButton(0, "Sword", kiP16TakeSword, undefined, "Take Sword", "Take the sword. Even if it’s owner didn’t, or couldn’t, use it, you might be able to!")
	}
	else
	{
		output("All the captain’s weapons have been looted now. ");
	}

	output("On closer look, you can see several shell casings on the floor underneath the desk, along with a significant cum-stain on the carpeting.");
}

public function kiP16TakeSword():void
{
	clearOutput();
	
	output("You reach up and draw the sword from its place on the wall, giving the blade an experimental flick. It sings through the air, audibly slicing the wind as you move. Taking a closer look at the blade itself, you can see a dozen tiny vents and circuits woven seamlessly into the metal, barely visible until your eyes are inches from the weapon. Looks like this sword’s a little more high-tech than it lets on...\n\n");
	
	lootScreen = kiP16TakeSwordCheck;
	flags["KI_TAKEN_SWORD"] = 1;
	flags["SUPRESS_COMBAT"] = 1;
	itemCollect([new VampBlade()]);
}

public function kiP16TakeSwordCheck():void
{
	if (pc.meleeWeapon is VampBlade || pc.hasItemByClass(VampBlade))
	{
		mainGameMenu();
		return;
	}
	
	clearOutput();
	output("You put the sword back where you found it.");
	flags["KI_TAKEN_SWORD"] = undefined;
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kiE9EnterVents():void
{
	clearOutput();
	author("Savin");
	showName("KASHIMA\nVENTS")
	output("You slide into the vents,");
	if (pc.isTaur() || pc.isDrider()) output(" squeezing your animalistic body in somehow despite your size");
	else if (pc.tallness > 95) output(" somehow managing to squeeze in despite your tremendous size");
	else if (pc.tallness > 70) output(" easily squirming in thanks to your average stature");
	else output("easily squirming in thanks to your small stature");
	output(". Now the question is... where are you going?");

	kiVentMenu();
}

public function kiVentMenu():void
{
	clearMenu();
	if (currentLocation != "KI-H16") addButton(0, "Medbay", kiMedbayVent, undefined, "Medical Bay", "Head to the medical bay.");
	else addDisabledButton(0, "Medbay", "Medical Bay", "You’re already near the medical bay.");
	
	if (currentLocation != "KI-OfficersAccessRoom") addButton(1, "Officers Q.", kiOfficersDeckVent, undefined, "Officers Quarters", "Head to the Officers Quarters deck.");
	else addDisabledButton(1, "Officers Q.", "Officers Quarters", "You’re already on the Officers Quarters deck.");
	
	if (currentLocation != "KI-EngineeringVent") addButton(2, "Engineering", kiEngineeringGoAccessRoom, undefined, "Engineering Deck", "Head to the Engineering deck.");
	else addDisabledButton(2, "Engineering", "Engineering Deck", "You’re already on the Engineering deck.");

	addButton(14, "Back", mainGameMenu);
}

public function kiMedbayVent():void
{
	currentLocation = "KI-H16";
	generateLocation(currentLocation);
	processTime(3);
	mainGameMenu();
}

public function kiEngineeringGoAccessRoom():void
{
	currentLocation = "KI-EngineeringVent";
	generateLocation(currentLocation);
	processTime(3);
	mainGameMenu();
}

public function kiEngineeringAccessRoom():void
{
	if (flags["KI_VANDERBILT_WORKING"] != 2)
	{
		output("\n\nYou don’t yet have a means to combat the infection properly; venturing into the engineering deck whilst properly prepared may be your last chance to sieze back control of the ship from the infected.");
	}
	addButton(0, "Vents", kiE9EnterVents, undefined, "Enter Vents", "Crawl into the vents and move around the ship.");
}

public function kiEngineeringFight():Boolean
{
	clearOutput();

	kiEngineeringBossFight();
	return true;
}

public function kiOfficersDeckVent():void
{
	currentLocation = "KI-OfficersAccessRoom";
	generateLocation(currentLocation);
	processTime(3);
	mainGameMenu();
}

public function kiK5CMOQuarters():void
{
	if (flags["KI_CMO_MEDSUPPLIES"] == undefined)
	{
		addButton(0, "MedSupplies", kiK5CMOQuartersMeds, undefined, "Medical Supplies", "You might be able to patch yourself up here.");
	}
	else
	{
		addDisabledButton(0, "MedSupplies", "Medical Supplies", "You’ve already taken everything of use in the supplies!");
	}
	
	if (flags["KI_CMO_SEARCHED"] == undefined)
	{
		addButton(1, "Search", kiK5CMOSearch, undefined, "Search", "Toss the doc’s room. Maybe you’ll find something useful.")
	}
}

public function kiK5CMOQuartersMeds():void
{
	clearOutput();
	
	output("Taking a look through the medical kit, you find a one-shot stimulant boost of microsurgeons - strong enough to give you a quick pick-me-up after the fights you’ve been in.\n\n"); 
	
	lootScreen = kiK5CMOMedSuppliesCheck;
	flags["KI_CMO_MEDSUPPLIES"] = 1;
	itemCollect([new OSStimBoost()]);
}

public function kiK5CMOMedSuppliesCheck():void
{
	if (pc.hasItemByClass(OSStimBoost) || flags["KI_CMO_MEDSUPPLIES"] == 2)
	{
		mainGameMenu();
		return;
	}
	
	clearOutput();
	output("You stash the hypospray back where you found it.");
	flags["KI_CMO_MEDSUPPLIES"] = undefined;
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kiK5CMOSearch():void
{
	clearOutput();
	flags["KI_CMO_SEARCHED"] = 1;
	output("You spend a few minutes rifling through Elenora’s room, hoping you’ll find something interesting. There’s not much on hand here, really: you quickly find yourself staring at some black, lacy negligee hidden away in her dresser, plus some family pictures on holo-cards showing her and a young boy - her son, maybe? Nothing helpful to your current situation, at any rate.");

	processTime(5);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kiE5EngineersQuarters():void
{
	addButton(0, "Sexbot", kiE5Sexbot, undefined, "Sexbot", "What’s the deal with the sexbot?");
	if (flags["KIE5_SEARCHED"] == undefined) addButton(1, "Search", kiE5Search, undefined, "Search the Room", "Toss the engineer’s room. Maybe you’ll find something useful.");
}

public function kiE5Search():void
{
	clearOutput();
	pc.credits += 2000;
	flags["KIE5_SEARCHED"] = 1;

	output("You spend a few minutes searching through the chief’s room, looking for anything useful. You quickly turn up a credit chit tucked under a pillow worth about 2,000 credits, plus enough mechanic’s tools, sex toys both phallic and feminine, and lube to last you a life time. You even turn up a pic of the engineer herself, a lightly chocolate-skinned ausar girl with flame-orange hair in a skin-tight Steele Tech suit that hugs her delicious curves just right. In the pic she’s smiling wide, arms around the shoulders of a svelte human male who looks oddly reminiscent of that half-built sexbot.");

	processTime(5);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kiE5Sexbot():void
{
	clearOutput();
	output("You wander over to the robot, experimentally poking at its exposed wiring. The bot doesn’t react - definitely powered off. A cursory examination shows a handsome ausar form, almost pretty in a way. Whoever built this model seems to have wanted a distinctly fem-boy style appearance. He looks to have been built by KihaCorp, though you note a lot of his internals are Steele-brand. Looks like the chief engineer was making this bot from bits.");

	processTime(1);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kiG3Exec():void
{
	if (flags["KIG3_SEARCHED"] == undefined) addButton(0, "Search", kiG3Search, undefined, "Search the Room", "Toss the XO’s room. Maybe you’ll find something useful.");
}

public function kiG3Search():void
{
	clearOutput();

	flags["KIG3_SEARCHED"] = 1;

	output("There’s not much left to search, really, other than the bed. Which, frankly, you don’t want to go near. There’s no sign of anything related directly to the parasites or infection here: no samples from the asteroid’s surface, no biological samples... nothing but dried bodily fluids and torn-up clothes.");

	processTime(2);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kiI3Science():void
{
	if (flags["KII3_SEARCHED"] == undefined) addButton(0, "Search", kiI3ScienceSearch, undefined, "Search the Room", "Toss the Science Officer’s quarters. Maybe you’ll find something useful.");
	else if (flags["KII3_CRACKED"] == undefined) addButton(0, "Safe Crack", kiI3StartSafeCrack, undefined, "Crack the Safe", "Try and crack the safe’s digital code.");
}

public function kiI3ScienceSearch():void
{
	clearOutput();
	output("You spend a few minutes tearing through the scientist’s quarters, looking for anything out of the ordinary. And you find it.");

	output("\n\nYou pull a hologram projector down from the wall, causing the image of the officer’s family to flicker out of existence. Behind it, you find a safe built into the bulkhead, secure and impenetrable... and doubtless full of valuables. The Steele Tech logo sits proudly over the lock, as if daring you to try and break in through an inch of hardened steel. If there’s anything valuable or dangerous on this deck, something tells you it’s in there.");

	processTime(5);
	flags["KII3_SEARCHED"] = 1;
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kiI3StartSafeCrack():void
{
	clearOutput();
	output("You crack your knuckles and tear off the keypad, revealing the digital lock underneath. There’s no way you can guess the right keycode, but you might be able to use the company override. You are a Steele, after all - if anybody can figure out how your company’s tech works, it’s you.");

	processTime(1);
	
	clearMenu();
	addButton(0, "Start", kiI3ActuallyStartSafeCrack);
}

public function kiI3ActuallyStartSafeCrack():void
{
	// 9999 new puzzle
	configureLightsOut(kiI3SucceedSafeCrack, kiI3FailSafeCrack, [1, 5, 6, 9, 10, 11, 12, 13], 20);
}

public function kiI3FailSafeCrack():void
{
	clearOutput();

	IncrementFlag("KII3_SAFECRACK_FAILS");

	if (flags["KII3_SAFECRACK_FAILS"] == 3)
	{
		flags["KII3_CRACKED"] = -1;

		output("You curse as the safe blares at you, telling you that once again you’ve gotten the wrong override. Worse, the keypad freezes and takes on a garish, glowing red on its display. <i>“Too many failed attempts. Safe is now secure-locked. Please contact Steele Industrial Technologies customer support for release procedures.”</i>");

		output("\n\nShit. That’s not exactly your area of expertise - looks like you’re not getting in there any time soon.");

		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		output("You curse as the safe blares at you, telling you that");
		if (flags["KII3_SAFECRACK_FAILS"] > 1) output(" once again");
		output(" you’ve gotten the wrong override. Annoyingly the keypad resets entirely.");

		clearMenu();
		addButton(0, "Try Again", kiI3ActuallyStartSafeCrack);
		addButton(1, "Back", mainGameMenu);
	}
}

public function kiI3SucceedSafeCrack():void
{
	clearOutput();
	flags["KII3_CRACKED"] = 1;
	output("The safe beeps happily at you, and you hear a heavy click inside as the mechanism unlocks. You did it!");
	
	output("\n\nYou pop the safe open, smiling despite yourself as it reveals its contents. Inside is a small stash of data slates, a few credit chits which you liberate, and a small black security case. Oooh, now this is what you’re talking about.");
	
	output("\n\nYou pick the case up and pop the lid, gazing upon a slender, silver vial cushioned in foam. Inside is a single, small shard of pale gray rock with what looks like a tiny, almost imperceptible, pink worm half-buried inside it.");
	
	output("\n\n<i>“What the...?”</i> you start to say, picking up the vial. The moment you jostle it, the worm begins to thrash violently, wriggling up from the rock and lunging against the glass. It can’t escape, of course, but....");
	
	output("\n\nThe glass cracks. Oh shit. You snap the case closed and lock it. Better get this thing back to the doc.");

	pc.createKeyItem("Parasite Sample", 0, 0, 0, 0, "A small security hardcase containing a medical sample.");
	output("\n\n<b>Key Item Acquired: Parasite Sample - A small security hardcase containing a medical sample.</b>");
	
	processTime(2);
	pc.credits += 250 + rand(50);

	clearMenu();
	addButton(0, "Back", mainGameMenu);
}

public function commandDeckRandomEncounter():Boolean
{
	IncrementFlag("KI_COMMAND_DECK_STEPS");

	var encChance:int = 5;

	if (flags["KI_COMMAND_DECK_STEPS"] > 3 && rand(100) < (flags["KI_COMMAND_DECK_STEPS"] * (flags["CHIEF_NEYKKAR_WITH_PC"] == 2 ? 20 : 5)))
	{
		flags["KI_COMMAND_DECK_STEPS"] = 0;

		kiCommandDeckTriggerEncounter();
		return true;
	}

	return false;
}

public function officersDeckRandomEncounter():Boolean
{
	IncrementFlag("KI_OFFICERS_DECK_STEPS");
	
	if (flags["KI_OFFICERS_DECK_STEPS"] > 3 && rand(100) < (flags["KI_OFFICERS_DECK_STEPS"] * 20))
	{
		flags["KI_OFFICERS_DECK_STEPS"] = 0;
		kiOfficersDeckTriggerEncounter();
		return true;
	}
	
	return false;
}

public function kiCommandDeckTriggerEncounter():void
{
	var numEnemies:int = 2;
	if (flags["CHIEF_NEYKKAR_WITH_PC"] == 1)
	{
		if (rand(5) <= 2) numEnemies++;
	}
	else
	{
		if (rand(5) <= 1) numEnemies++;
	}

	var f:Array = [pc];
	if (flags["CHIEF_NEYKKAR_WITH_PC"] == 1) f.push(new ChiefNeykkar());

	var h:Array = [];
	for (var i:int = 0; i < numEnemies; i++)
	{
		h.push(new InfectedCrewmember());
	}
	
	output("\n\nYou hear a horrible screech of metal buckling and tearing. You spin around in time to see a vent shaft above you explode outwards, and");
	if (numEnemies == 2) output(" a pair of");
	else output(" several");
	output(" mutants crawl out of it, leaping down onto the deck just feet away from you. Oh, shit, here we go again!");

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(f);
	CombatManager.setHostileActors(h);
	CombatManager.displayLocation("INFECTED CREW");
	CombatManager.victoryCondition(CombatManager.ENTIRE_PARTY_DEFEATED);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
	CombatManager.victoryScene(kiRandomMutantVictory);
	CombatManager.lossScene(kiRandomMutantLoss);

	clearMenu();
	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function kiOfficersDeckTriggerEncounter():void
{
	var numEnemies:int = rand(5) <= 1 ? 3 : 2;
	
	var h:Array = [];
	for (var i:int = 0; i < numEnemies; i++)
	{
		h.push(new InfectedCrewmember());
	}
	
	output("\n\nYou hear a horrible screech of metal buckling and tearing. You spin around in time to see a vent shaft above you explode outwards, and");
	if (numEnemies == 2) output(" a pair of");
	else output(" several");
	output(" mutants crawl out of it, leaping down onto the deck just feet away from you. Oh, shit, here we go again!");
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(h);
	CombatManager.displayLocation("INFECTED CREW");
	CombatManager.victoryCondition(CombatManager.ENTIRE_PARTY_DEFEATED);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
	CombatManager.victoryScene(kiRandomMutantVictory);
	CombatManager.lossScene(kiRandomMutantLoss);

	clearMenu();
	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function kiRandomMutantLoss():void
{
	clearOutput();
	author("Savin");

	output("Mutated, tentacle-laden bodies washes over you, throwing you to the ground and tearing at your");
	if (!pc.isNude()) output(" [pc.armor]");
	else output(" gear");
	output(", lashing at your mouth and rump");
	if (pc.hasVagina())
	{
		output(" and twat");
		if (pc.vaginas.length > 1) output("s");
	} 
	output(" with a dozen slimy, drooling tentacles. Your weapon clatters out of your hand, and your body begins to give in, surrendering to pleasure and pain. You lack the power to resist anymore, and your will crumbles under a haze of red mist seeping from the creatures’ mouths.");

	output("\n\nYou black out\n\n");

	CombatManager.genericLoss();

	clearMenu();
	addButton(0, "Next", kiMutantBadEnd);
}

public function kiRandomMutantVictory():void
{
	clearOutput();
	author("Savin");

	output("The creatures have all crumpled to the ground, unable to fight anymore... but they’re still moving. Their flesh contorts,");
	if (rand(2) == 0) output(" growing new tentacles to add to those you resisted");
	else output(" healing over the wounds you caused");
	output(". You doubt the horrid things will stay down for long. No way you’re staying here. Time to go!\n\n");

	flags["KI_COMMAND_DECK_STEPS"] = 0;
	flags["SUPPRESS_COMBAT"] = 1;

	CombatManager.genericVictory();
	//clearMenu();
	//addButton(0, "Next", mainGameMenu);
}

public function kiEnterTheBridge():Boolean
{
	if (flags["KASHIMA_BRIDGE"] == undefined)
	{
		clearOutput();
		chiefNeykkarHeader(false);

		output("You approach the bridge door, but find that it doesn’t open automatically like it should. The lockdown again. Grunting in frustration, you tell the Chief to cover you as you yank off the access panel beside the door and");
		if (pc.characterClass == GLOBAL.CLASS_MERCENARY) output(" start ripping wires");
		else output(" start trying an override");
		output(". The leithan warrior turns back towards the corridor and shoulders her gun, keeping an eye out for more of the tentacle creatures.");

		output("\n\nFor the first time in what feels like hours, you’ve got a moment to breathe.");

		processTime(3);
		
		clearMenu();
		addButton(0, "YourName?", kiBridgeName, undefined, "Ask About Her Name", "You never caught this amazonian beauty’s name...");
		addButton(1, "Sorry...", kiBridgeSorry, undefined, "Sorry...", "Sorry about her troops. You can only hope there’s a way to save them still...");
		addButton(2, "Experience", kiBridgeExperience, undefined, "Experiences", "You’ve never seen anything like what’s happened to the crew. But maybe an officer of Nova Securities has some better insight?");
		addButton(3, "StayQuiet", kiBridgeNothing, undefined, "Say Nothing", "Don’t waste time talking. Get on with the mission.");

		return true;
	}

	return false;
}

public function kiBridgeName():void
{
	clearOutput();
	chiefNeykkarHeader(false);

	output("<i>“So... I never got your name,”</i> you say between plucks of the wires. <i>“Chief Neykkar, right?”</i>");
	
	output("\n\nShe grunts, still facing away from you. <i>“Yeah. Ushamee Neykkar. Chief Warrant Officer.”</i>");
	
	output("\n\nYou smile. <i>“I’m [pc.name]. [pc.name] Steele,”</i> you answer.");
	if (pc.isNice()) output(" <i>“Glad to meet you, Chief Neykkar.”</i>");
	else if (pc.isMisc()) output(" <i>“Pleased to meet ya, miss Neykkar.”</i>");
	
	output("\n\nShe canters back a step, finally looking back your way. Her long, plated tail whips along the deck, narrowly missing your [pc.foot]. <i>“Yeah. You, uh... most people call me Usha.”</i>");
	
	output("\n\n");
	if (pc.isMisc()) output("<i>“Not Mee-mee or something?”</i> you tease, earning yourself a painful swat on the ass from her tail and a scowl. You can’t help but laugh chuckle. ");
	output("<i>“So how’d you end up working for Nova?”</i>");
	
	output("\n\nThe control panel sizzles, making you recoil. Almost got it. Behind you, Usha mumbles something under her breath before saying, <i>“Seriously? Surrounded by fuck-monsters and you want to small-talk?”</i>");
	
	output("\n\nTouche. <i>“Not going to work any faster if we don’t,”</i> you retort, switching the place of two wires.");
	
	output("\n\n<i>“Hurry up, then!”</i> Usha says. A moment passes before she sighs and sits down on her equine-like lower half, still training her weapon on the corridor behind you. You smirk and shake your head, fiddling with the console until it beeps, and the seal releases with a hiss. Looks like you’re in.");

	processTime(7);
	flags["KASHIMA_BRIDGE"] = 1;

	clearMenu();
	addButton(0, "Next", kiBridgeContinued);
}

public function kiBridgeSorry():void
{
	clearOutput();
	chiefNeykkarHeader(false);

	output("While you work, you figure you owe the Chief an apology. After all, it’s your company’s employees that just ripped into her soldiers.");
	
	output("\n\nNeykkar grunts and stamps two of her clawed feet on the deck. <i>“We’re gonna get ‘em back. Get that door open and we’ll have control of the ship. Be able to lock whatever those... those things were down, keep ‘em from coming at us. Then we call in the cavalry. HAZMAT or Special Forces or something. I don’t even fucking know.”</i>");
	
	output("\n\nThe Chief seems to be freaking out a little. Not surprising, considering what you two have just seen. Still, she’s right: the two of you are deep in the shit here all by yourselves, surrounded by what’s become of the <i>Kashima</i>’s crew. You cross another pair of wires and recoil as sparks fly in your face. Almost done.");
	
	output("\n\nA moment of quiet passes. When it seems sure that nothing’s getting ready to storm down the hall and assault you, Neykkar sighs and lowers her gun a fraction of an inch.");
	
	output("\n\n<i>“Name’s Usha, by the way,”</i> she says out of the blue, not turning to face you. <i>“Chief Warrant Officer Ushamee Neykkar.”</i>");
	
	output("\n\n<i>“Steele,”</i> you answer, finally getting the right wire. The door hisses as the seal opens. <i>“[pc.name] Steele.”</i>");

	processTime(6);
	flags["KASHIMA_BRIDGE"] = 2;

	clearMenu();
	addButton(0, "Next", kiBridgeContinued);
}

public function kiBridgeExperience():void
{
	clearOutput();
	chiefNeykkarHeader(false);

	output("<i>“So,”</i> you say as you start pulling wires. <i>“Ever see anything like this? Those people, I mean.”</i>");
	
	output("\n\nThe Chief grunts something like <i>“Fuck no,”</i> smacking her tail loudly on the deck. <i>“I’ve seen combat before, Steele. Fought pirates and primitives and weird shit that lives out here in space. Never something like them before. They were... something was wrong with them. Like something’s gotten inside and changed them. Maybe some kind of gene-mod gone wrong.”</i>");
	
	output("\n\nYou shake your head. <i>“This is a mining ship. Shouldn’t have been working on science projects aboard it.”</i>");
	
	output("\n\n<i>“Right,”</i> the leithan sneers. <i>“And mega-corps have never done shady shit on the down-low before.”</i>");
	
	output("\n\nOuch. Hearing your company being talked about that way hits a little close to home... and makes you think. What if she’s right?");
	
	if(annoIsCrew()) output(" Maybe you should try and call Anno and see just what the science department’s been up to out on the frontier...");
	
	output("\n\nBefore you can worry too much about it, you find the right wire and yank it. Sparks fly, and the door’s seal breaks with a violent hiss. Looks like you’re in.");

	processTime(3);
	flags["KASHIMA_BRIDGE"] = 3;

	clearMenu();
	addButton(0, "Next", kiBridgeContinued);
}

public function kiBridgeNothing():void
{
	clearOutput();
	chiefNeykkarHeader(false);

	output("You mumble to yourself as you yank wires and pull cords, not willing to waste time talking the leithan woman up. You need your focus on the here and now.");
	
	output("\n\nSure enough, it barely takes you any time at all to find the right wires. One good tug and the door beeps and hisses, its seal breaking at your command. <i>“We’re good to go,”</i> you say, standing back up and drawing your [pc.weapon].");

	processTime(2);
	flags["KASHIMA_BRIDGE"] = 4;

	clearMenu();
	addButton(0, "Next", kiBridgeContinued);
}

public function kiBridgeContinued():void
{
	clearOutput();
	chiefNeykkarHeader(false);

	currentLocation = "KI-R18";
	generateLocation(currentLocation);

	output("The door’s barely managed to slide open before the erstwhile silence is sundered by an ear-piercing scream of terror from inside. The Chief curses and shoulder-checks the door aside, rushing in before you’ve had time to blink.");

	output("\n\nBeyond the doors, the bridge is illuminated by flickering red lights, casting long shadows across the abandoned deck. Sparks shower from wrent wires hanging from shattered ceiling plates and damaged consoles, giving you enough momentary flashes of brightness to resolve the image of the screaming woman on her back, scrambling back away from a towering human man stomping towards her. Your companion bellows for them both to freeze, and the man spins around with a savage howl. His eyes have gone a solid pink, and his hair is gone, replaced by throbbing, pulsating tentacles growing wildly from his dusky scalp. Four bigger, arm-thick tendrils hang down from his crotch through what little remains of his pants, and another pair flail out behind him, protruding from his back.");

	output("\n\nIn a brief moment of bright light, you manage to see the name tag somehow still clipped to his chest: Captain Holmes.");
	if (silly || pc.isMisc()) output(" Talk about going down with the ship...");
	output(" God damn, he barely looks human anymore.");

	processTime(1);
	
	var f:Array = [pc];
	//if (flags["CHIEF_NEYKKAR_WITH_PC"] == 1) f.push(new ChiefNeykkar());
	f.push(new ChiefNeykkar());

	var h:Array = [new CaptainHolmes()];
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(f);
	CombatManager.setHostileActors(h);
	CombatManager.displayLocation("CAPT. HOLMES");
	CombatManager.victoryCondition(CombatManager.ENTIRE_PARTY_DEFEATED);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
	CombatManager.victoryScene(kiHolmesVictory);
	CombatManager.lossScene(kiHolmesLoss);

	CombatManager.encounterText("You’re fighting Captain Holmes!\n\nOr what’s become of him, anyway. There doesn’t appear to be much of the man left now: just a dark-skinned husk and a long, scraggly beard to hint at his former appearance. The creature he’s become is a pink-eyed tentacle abomination, with a head of writhing tentacle hair, four dangling tenta-cocks, and a pair of limb-like appendages growing from his back. The tattered remnants of a Steele Tech jumpsuit hang loosely from his muscular body, its yellow stripes catching the light in ways that make him seem to glow.\n\nThe Captain’s gone wild with lust, thrashing about and trying to grab at you and Chief Neykkar. Pink-hued jizz drools from the tips of every tentacle, spurting onto the deck in wild arcs of viscous cream that surrounds you in ever-present musk.");

	
	clearMenu();
	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function kiHolmesLoss(asHenderson:Boolean = false):void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	clearOutput();
	author("Savin");
	if (!asHenderson)
	{
		showBust("HOLMES", "USHAMEE_NUDE");
		showName("DEFEAT:\nCAPT. HOLMES");
	}
	else
	{
		showBust("HENDERSON", "USHAMEE_NUDE");
		showName("DEFEAT:\nHENDERSON");
	}

	if (!asHenderson || enemy.hasStatusEffect("Free Chief"))
	{
		output("You barely register the fact that your companion’s gone down, slammed to the ground by the mutated captain’s throbbing tentacles.");
	}
	else
	{
		output("There’s nothing you can do for the Chief now, held tight by the squirming tentacles as she is.")
	}
	output(" You’re too busy fighting off the others: four tentacle cocks groping at your arms, grabbing your wrists and [pc.legOrLegs], trying to pull you down. And in the state you’re in, it isn’t long before he succeeds. Your struggles weaken to nothing, unable to shake off the creature’s grasp as he draws you in kicking and screaming.");

	output("\n\nYour world suddenly goes topsy-turvy as the " + (asHenderson ? "commander" : "captain") + " hauls you off the deck and slams you down on your back, spreading you eagle and tearing at your gear with his shoulder-tentacles until you’re completely bare, covered in the tatters of your gear. Your [pc.weapon] and Codex lie smashed on the deck beside you. Hot, musky breath washes over your [pc.face] as the " + (asHenderson ? "commander" : "captain") + " looms over you, so close that you could almost hear his heartbeat through the pulsating growths flooding through his body. His open mouth hangs a bare inch over yours, drooling pink fluids across your face.");

	output("\n\nOne last, futile attempt to struggle against his mighty grasp ends with your [pc.legOrLegs] hauled up in the air, and two tentacles immediately thrust into your [pc.vagOrAss]. You scream, arching your back and clawing desperately at the restraints on your limbs - to no avail. Overwhelming sensation burns your mind white as the tentacles force their way into your hole, stretching you wide and blasting your [pc.vagOrAss] with the same pink fluids that the creature exudes everywhere else. A few seconds of that, and your limbs go languid, feeling leaden and boneless at your side. Heat burns through your body, spreading through your loins and up through your body, taking root and clenching at your heart. You feel the heat and cold sweat more acutely than the tentacles thrusting inside you, refusing to let you think: only pleasure remains.");

	processTime(4);
	
	if(inCombat()) CombatManager.postCombat();
	clearMenu();
	addButton(0, "Next", kiHolmesLossII, asHenderson);
}

public function kiHolmesLossII(asHenderson:Boolean):void
{
	clearOutput();
	author("Savin");

	if (!asHenderson)
	{
		showBust("HOLMES", "USHAMEE_NUDE");
		showName("DEFEAT:\nCAPT. HOLMES");
	}
	else
	{
		showBust("HENDERSON", "USHAMEE_NUDE");
		showName("DEFEAT:\nHENDERSON");
	}

	output("<b>Several hours later...</b>");
	
	hours += 4 + rand(3);
	processTime(rand(11));
	pc.removeAll();

	output("\n\nYou can’t move anymore, even if you had the energy to struggle anymore. Tentacles bind your limbs, pinning you to the bulkhead, writhing across your flesh. Others are buried deep inside you, squirming in your mouth");
	if (pc.hasVagina())
	{
		if (pc.vaginas.length == 1) output(", pussy,");
		else output(", pussies,");
	}
	output(" and ass. The pink slime they pump you with has left you completely leaden, able to do almost nothing but moan and cum and stare vacuously into the darkness around you. The lights have shut off, and the Chief has been dragged away by the creatures that eventually pursued you from the elevator. But you remain on the bridge, hearing but not seeing the stomping footsteps of the mutated captain.");
	
	output("\n\nThe tendrils inside and around you trail off to and from his body, dragging across the cum-slathered deck. You can hear screams throughout the ships, cries of endless pleasure as the remaining crew of the <i>Sunny Nebula</i> are assailed by the other mutants, fucked into submission over and over. Yet you... your fate is different. Solitary. The others didn’t touch you when they came for the Chief. Didn’t dare, when the "+ (asHenderson ? "commander" : "captain") +" roared at them, spraying lusty pink slime everywhere.");
	
	output("\n\nPerhaps he means something special for you? A worse fate than the others...");
	
	output("\n\nIt’s hard to think now, much less concentrate on anything but the pleasure of the unceasing tentacle-rape. You can already feel your body changing. Heat burns in your loins, clutches in your chest, burns your mind. Something’s inside you, not just the Captain’s tentacles... and it’s growing. You can feel your stomach bulging, stretching out around the growing presence inside you. Your [pc.skinFurScales] is reddening, too. At first you thought you were flushed with arousal, but now... now you’re positively crimson. Infected with whatever these poor creatures were. Even the microsurgeons your father paid a fortune for were insufficient to stop the tentacle plague.");
	
	output("\n\nYou wonder how long it will be before you’re just another mutant, wandering the halls of the derelict <i>Kashima...</i>.");

	clearMenu();
	addButton(0, "Next", kiHolmesLossIII, asHenderson);
}

public function kiHolmesLossIII(asHenderson:Boolean):void
{
	generateMapForLocation("GAME OVER");
	
	clearOutput();
	showBust("");
	author("Savin");
	
	showName("\nIT BEGINS...");
	
	output("<b>A week passes...</b>");
	
	days += 7;
	hours += rand(24);
	minutes += rand(60);
	processTime(31);
	
	output("\n\nThe <i>Kashima</i> shudders violently as a boarding tether bolts on. The sleek, curving hull of the Confederate cruiser slowly glides past the derelict’s starboard windows, showing in big, blocky white letters a Terran identification number. Above them, the words <i>Odyssey</i>.");
	
	output("\n\nThe airlock buzzes as a plasma torch burns through it, slowly slicing it open. It takes just a minute before the steel lock falls away with a thunderous <i>thunk</i>, echoing throughout the halls. The moment it does, five pair of heavy boots stomp across the steel deck into the ship. Flashlights penetrate the darkness that’s overcome the corridors, scanning the empty walkways and busted panels on the bulkheads. Dead wires hang heavily from above, dripping with old, rancid white and pink cream. The smell is overwhelming, repulsive, making the five invaders curl their noses even through their suits.");
	
	output("\n\n<i>“What the hell happened here?”</i> one of them, a burly kui-tan, grunts. He raises his plasma rifle, scanning the corridor through the holographic sights. <i>“This ship’s a wreck.”</i>");
	
	output("\n\nAnother, a cat-like kaithrit woman, pulls a handheld computer from her belt and holds it up. <i>“No idea. Plenty of lifesigns, though. Enough for both crews.”</i>");
	
	output("\n\nThe first man scoffs. <i>“Alive? Strange, with the ship in this state. We-”</i>");
	
	output("\n\n<i>“Lieutenant! Something’s coming!”</i> the kaithrit barks, eyes fixed to her screen. <i>“Those lifesigns are-”</i>");
	
	output("\n\nSomething screams, a horrible, piercing shriek that echoes through the corridors. A moment later, it’s answered by another... and another. A cacophony of screeching voices that meld together, deafening the marines. One of them stumbles back, yells something in panic as the first of the crew come into view.");
	
	output("\n\nThere’s nothing human about them. Nothing humanoid. Just writhing masses of squirming red tentacles, lunging down the corridors like jets of liquid. They engulf the marines before they can key their comms; before they can scream. A moment later, and they spill through the airlock, through the boarding tube before anyone aboard realizes what’s wrong.");
	
	output("\n\nSomewhere among the flood of creatures that boards the <i>Odyssey</i> is flesh that once was [pc.name] Steele. Flesh, and some small, vestigial remnant of the mind that once sought to rescue the <i>Kashima</i>’s crew. Now you are, though in a form you hadn’t quite expected...");
	
	output("\n\nNow, though, you’ll be bringing them to the rest of the galaxy.");
	
	badEnd();
}

public function kiHolmesVictory():void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	clearOutput();
	author("Savin");
	showBust("HOLMES", "USHAMEE");
	showName("VICTORY:\nCAPT. HOLMES");

	flags["KASHIMA_HOLMES_DEFEATED"] = 1;

	output("The corrupted captain stumbles back, grunts, and collapses against his chair.\n\n");

	CombatManager.genericVictory();
	
	output("\n\n<i>“Holy shit,”</i> your leithan companion breathes, lowering her machine gun. <i>“That guy was even worse than the last bunch.”</i>");
	
	output("\n\nYou nod, breathing hard. She’s not kidding... was the captain some kind of advanced form of what’s happened here? Or maybe some people just react even more horrifically to whatever they’ve been exposed to. No way to tell now.");
	
	output("\n\n<i>“We need to find that woman,”</i> you say, turning back towards the corridor. <i>“She seemed okay. Maybe she can tell us what happened.”</i>");
	
	output("\n\nShe nods. <i>“Right. You’re right. First, let’s get control of security. Call Nova for backup.”</i>");
	
	output("\n\nFair enough. You tell the Chief to do what she needs to do. While she works, you make your way over to the captain’s chair, trying not to get too close to what’s left of him, and tap away at the command console. Looks like he was logged in before: the console pops up at your touch, displaying the ship’s systems for you: red almost across the board, save for emergency systems. On top of that, as you’d seen earlier, the captain’s placed a lockdown on most of the ship. Between that and the elevators being infested with mutants, there’s no way you’re going to be changing decks.");
	
	output("\n\nAt least not with the Chief in tow. Something tells you a big leithan girl’s not going to be fitting in the emergency Geoffries tubes any time soon.");
	
	output("\n\nAlongside the lockdown and status displays, you soon find that there’s a holo-log paused mid-recording on the captain’s terminal. He really was right in the middle of things when... whatever happened. Maybe now you can figure out what’s going on!");
	
	output("\n\nYou press the replay button");
	if (pc.isMisc()) output(" and swing yourself into the captain’s seat.");
	else output(" and take a seat.");
	
	output("\n\nThe recording pops open with a view of the bridge, brightly lit and sparkling white. Steele Tech logos flicker on several screens behind the captain as he takes a seat, crossing a leg and looking at a dataslate in his hands. Captain Holmes is a handsome man here, looking to be in his late fifties with a salt-and-pepper beard and short-cropped, curly hair.");
	
	output("\n\n<i>“Captain’s log, day seventy four of deployment. Update from medical bay: Doctor Vanderbilt informs me that Commander Henderson is recovering rapidly after the accident on the surface. ‘A remarkable recovery,’ with his burns almost completely healed already, and he’s up and about again, though doc’s ordered him to take it easy. Tensions are still high after the accident, however, and I’ve canceled all exploration of the asteroid’s surface for now. I’m afraid our Chief Science Officer will have to content himself with the samples mister Henderson recovered beforehand.”</i>");
	
	output("\n\nCaptain Holmes glances down at his datapad, looking to find his log’s next topic. Suddenly, your screen goes dark, flickering back in a dark red hue: emergency lights. The captain glances up in alarm. <i>“What’s going on? Status report!”</i> he snaps at crewmen running past.");
	
	output("\n\n<i>“I can’t raise Engineering!”</i> someone shouts. <i>“Fire suppression going insane over the lower decks!”</i>");
	
	output("\n\n<i>“What?”</i> the captain says, jumping to his feet. <i>“Security, I need you down at Engineering. Something’s-”</i>");
	
	output("\n\nSomething explodes on the bridge, throwing the captain and several other crewmen down to the deck. The door slides open, and you hear an ear-piercing scream from off-screen. The hologram fizzles, then cuts out.");
	
	output("\n\nDamn.");

	output("\n\nYou minimize the display and turn to Chief Neykkar, who seems to be finishing up with her own objective, cursing and spitting at the comms console.");

	output("\n\n<i>“Something’s jamming comms,”</i> she scowls, delivering a swift kick to the console. <i>“Can’t get a signal, even on Q-Comms. I put the ship’s distress beacon on, but fuck knows if anybody’s close enough to pick up on it... if it’s even going to get through the jamming.”</i>");

	output("\n\n<i>“Any idea where it’s coming from?”</i>");

	output("\n\nShe shakes her head. <i>“Somewhere here on the </i>Kashima<i>, I bet. Maybe one of those tentacle freaks messed with the comm relay.”</i>");

	output("\n\nYour thoughts snap back to the mention of Engineering earlier. Something bad apparently happened there. Something you’re going to have to deal with if you want to get out of here.");

	output("\n\n<i>“C’mon, Steele,”</i> your companion says, shouldering her gun. <i>“Let’s find that broad and get to Engineering.”</i>");

	output("\n\nSounds like a plan. You grab your [pc.weapon] and turn to leave.");

	processTime(25);
	
	clearMenu();
	addButton(0, "Next", kiHolmesVictoryII);
}

public function kiHolmesVictoryII():void
{
	clearOutput();
	author("Savin");
	showBust("HOLMES", "USHAMEE");
	showName("VICTORY:\nCAPT. HOLMES");

	output("And just as you do, you feel something wet and slimy wrap around your [pc.leg]. You look down in alarm, yanking your [pc.foot] up. The captain’s tendrils grasp at you as the mutant man rises up again, drooling pink spittle onto the deck as he staggers to his feet.");

	output("\n\n<i>“Steele!”</i> your companion shouts, suddenly drowned out by the sound of gunfire. The mutated captain cries out and staggers back, blood blossoming from his chest as a burst of machinegun fire throws him back onto the deck. He spasms, flailing arms and tentacles like a fish out of water... and doesn’t stop moving.");

	output("\n\n<i>“He should be dead,”</i> Neykkar gasps, taking a step back. <i>“L-look at his chest!”</i>");

	output("\n\nYou do so, and see the wounds she just caused starting to close, spurting pink goo and chunks of lead. Something tells you he’s not going to stay down.");

	output("\n\n<i>“Come on! We’re leaving!”</i>");

	processTime(1);
	
	clearMenu();
	addButton(0, "Run!", kiHolmesRun);
	//Get the fuck out of here before you have to fight Captain Holmes all over again.
	//Back to corridor. Remove access to the Bridge in the future. Next time the PC passes by the T-bone intersection, go to "RIP Chief Neykkar" event.
}

public function kiHolmesRun():void
{
	flags["SUPPRESS_COMBAT"] = 1;
	currentLocation = "KI-P18";
	generateLocation(currentLocation);
	mainGameMenu();
}

public function kiL18RoomFunction():Boolean
{
	if (flags["KASHIMA_HOLMES_DEFEATED"] != undefined && flags["CHIEF_NEYKKAR_WITH_PC"] == 1)
	{
		kiRipChief();
		return true;
	}
	
	if(flags["CHIEF_NEYKKAR_WITH_PC"] == 2)
	{
		flags["NAV_DISABLED"] = NAV_EAST_DISABLE;
	}

	return commandDeckRandomEncounter();
}

public function kiRipChief():void
{
	clearOutput();
	author("Savin");

	output("As you’re running down the corridor, you pass by the elevator banks and see that they’re not only all standing open, but several of the mutants - dozens of them! - are pulling themselves up from the bowels of the ship. Some of them screech, others growl, and every one of them comes charging at you with tentacles outstretched, ready to give a repeat performance of what happened to the Nova troops!");
	
	output("\n\n<i>“Not again!”</i> the Chief shouts, firing into the oncoming horde with abandon. <i>“Move! Move, move, move!”</i>");
	
	output("\n\nThere’s too many to fight, so you take the Chief’s advice and leg it.");
	
	output("\n\nThe horde’s right on your heels, moving with inhuman speed and lashing at your back with their monstrous appendages. Chief’s clawed legs clatter on the deck beside you, propelling her forward. For a moment, she overtakes you, charging ahead... until suddenly she screams, and goes screeching back. You turn and see that two of the mutant crewmen have managed to grab her by the tail, pulling her back just long enough for the rest of the horde to jump her. A dozen mutants are grabbing at Neykkar’s ass and legs by the time you skid to a halt, training your [pc.rangedWeapon] at them.");
	
	output("\n\nAll thirty or forty of them. Fuck.");
	
	output("\n\n<i>“<b>RUN!</b>”</i> she screams as the mutants rip at her armor plates, wresting her gun away even as she’s swinging it desperately like a club. <i>“RUN, STEELE!”</i>");
	
	output("\n\nThe last you see of her is the tide of flesh surging past her, completely overwhelming even the towering leithan. She vanishes under the tidal wave of bodies rushing towards you.");
	
	output("\n\nYou run.");

	processTime(2);
	
	flags["CHIEF_NEYKKAR_WITH_PC"] = 2;
	flags["SUPPRESS_COMBAT"] = 1;

	clearMenu();
	addButton(0, "Next", mainGameMenu);

	//[Run]
	//Back to map, increase encounter chance to 20% per square, or 100% if you move any direction but left.
	//Eventually when PC gets to the medical bay and tries to access it, go to "Meeting Dr. Vanderbilt"
}

public function kiH18RoomFunction():Boolean
{
	flags["NAV_DISABLED"] = NAV_NORTH_DISABLE;
	output("\n\nThe control panel for the door is damaged beyond all hope of quick repair.");
	
	if (flags["CHIEF_NEYKKAR_WITH_PC"] == 2 && flags["KI_VANDERBILT_MET"] == undefined)
	{
		kiMeetingVanderbilt();
	}

	return commandDeckRandomEncounter();
}

public function kiMeetingVanderbilt():void
{
	clearOutput();
	author("Savin");

	output("You skid to a stop at the doors of the medical bay, sealed shut and bathed in shadows brought to life by the flickering emergency lights. A glance over your shoulder shows dozens of mutant crewmen rushing towards you, eager to force you to join in Chief Neykkar and the other Nova troops’ fates. Shit. You grab the emergency panel, trying in vain to force the door open. It stands stoically shut, refusing to budge even as you resort to pounding on it.");

	output("\n\nThe creatures surge closer, ready to steamroll you and fuck you into oblivion!");

	var h:Array = [];
	for (var i:int = 0; i < 3; i++)
	{
		h.push(new InfectedCrewmember());
	}
	
	h[0].createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(h);
	CombatManager.displayLocation("INFECTED CREW");
	CombatManager.victoryCondition(CombatManager.SURVIVE_WAVES, 3);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
	CombatManager.victoryScene(kiMedbayFightEnds);
	CombatManager.lossScene(kiRandomMutantLoss);
	
	clearMenu();
	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function kiMedbayFightEnds():void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	clearOutput();
	author("Savin");
	showBust("ELENORA");
	showName("DOCTOR\nVANDERBILT");

	currentLocation = "KI-H16";
	flags["KI_VANDERBILT_MET"] = 1;

	output("Suddenly, you hear a pneumatic hiss just inches from your ear as the MedBay door slides open, flashing with brilliant red and white lights. A woman - the same one from the bridge - grabs you by the shoulders and yanks you inside, throwing you to the ground. Tentacles slap and grasp at your");
	if (pc.hasFeet()) output(" heels");
	else output(" back");
	output(" before the doors slam shut again and hiss as the emergency lock sets back in place, leaving you in eerie silence save for the rhythmic <i>thump-thump</i> against the door, sounding far away and distant. The reinforced windows don’t so much as waver under the assault, though outside the mutants slaver and silently shriek, thrusting wildly with their blood-red tentacles.");

	output("\n\n<i>“A-are you okay?”</i>");
	
	output("\n\nThe woman’s voice snaps your attention back, away from the slavering horde and to your savior. She landed just behind you, like she’d used all her bodyweight - what little of it there is on the slip of a woman - to pull you inside. She’s wearing what’s left of a lab coat hanging in tatters from her shoulders, revealing black scrubs underneath that have been torn up so much as to leave very little to the imagination: cleavage, belly, and legs are largely left bare to your gaze. A stethoscope dangles from around her neck, cementing that she must be the ship’s doctor.");
	
	output("\n\nYou tell her that you’re as fine as you can be, all things considered. The doctor sighs with relief and scrambles to her feet, awkwardly adjusting the remnants of her clothing. <i>“Who are you? You’re not crew... nobody else from the crew has their mind left. So...”</i>");

	output("\n\n<i>“I’m [pc.name]. [pc.name] Steele,”</i> you say, dusting yourself off. <i>“The company sent us to investigate when the </i>Kashima<i> went dark.”</i>");

	output("\n\n<i>“Thank God,”</i> she breathes, pushing her glasses up the bridge of her nose. Above her, the white lights flicker momentarily. Power’s certainly not stable. <i>“I didn’t think anyone was coming. It’s been days... you can’t imagine what it’s been like, watching everyone slowly go insane. Start changing from the inside out.”</i>");

	output("\n\nShe shivers, wrapping her arms around herself. Like you, she struggles to rip her gaze away from the poor souls outside, clamoring to get in. <i>“I’m Doctor Vanderbilt, by the way. Elenora. The </i>Kashima<i>’s chief medical officer. Welcome aboard, I guess.”</i>");

	processTime(10);
	CombatManager.abortCombatDeferred(kiMedbayFightEndsII);
}

public function kiMedbayFightEndsII():void
{
	clearOutput();
	author("Savin");
	showBust("ELENORA");
	showName("DOCTOR\nVANDERBILT");
	
	generateLocation(currentLocation);
	
	pc.maxOutHP();
	output("<b>A few uncomfortable, awkward minutes pass...</b>");

	output("\n\n<i>“Good, no sign of infection,”</i> Elenora says, feigning a smile as she switches off the medical scanner. <i>“You’re lucky. The tentacles spread the... the infection, I think. Through intercourse, I suspect. I’m sure the people you came here with are likely in the process of transforming as we speak. From what I’ve been able to tell, the process is only accelerating with the more victims the infection takes.”</i>");
	
	output("\n\n<i>“Alright, what exactly is this infection?”</i> you ask, hopping up from the examination table. Again, the lights flicker, and the computers all shut off automatically.");
	
	output("\n\nElenora curses and tosses the scanner apparatus aside. <i>“I don’t... I don’t know, exactly. I’ve figured out a little bit, but this whole thing... it caught us all by surprise.”</i> She sighs, sitting heavily on a chair nearby and casting a wary glance to the door. <i>“I can tell you where it started, though.”</i>");

	output("\n\nYou nod, encouraging her to tell you the story.");
	if (!pc.isAss()) output(" You can’t do much to help flying blind like you have been.");
	else output(" You’re sick and tired of flying blind like this.");

	output("\n\n<i>“Okay, okay. About a week ago, the captain sent his executive officer, Commander Henderson, to supervise our drone fleet’s recovery of mineral samples from the asteroid’s surface. There was an accident, though - an explosion. One of the drones nicked a fuel line, I think. Henderson came back unconscious, badly burned under his suit. To be honest, I thought he wasn’t going to make it... we’re a mining ship, not really equipped to deal with major trauma. The Captain was almost ready to abandon the mission when, out of nowhere, Henderson completely stabilized and his burns began to heal. At first, I thought he must have had microsurgeons he’d left off his medical records. Even then, though, he healed much faster than he should have.”</i>");

	output("\n\n<i>“Do you think he was infected with something? Out on the surface?”</i>");
	
	output("\n\nThe doctor shrugs. <i>“I don’t know... but it makes sense. Henderson certainly was the first one to show signs of infection. Yes, I think so, anyway. I can’t imagine even microscopic life existing on the surface of the asteroid, though. There’s no atmosphere, nothing but rock on the surface... Then again, I’m not a xenobiologist. What do I know, really?”</i> She chuckles half-heartedly, wiping at her glasses. <i>“I don’t know what this infection is, [pc.name]. I hypothesize it’s some sort of parasite, but... the way it spreads, and how quickly, it’s like nothing I’ve ever seen before. And the aggression - the mutations! A parasite usually wants to remain unnoticed, to subtly control its host. Not turn them into monsters...”</i>");
	
	output("\n\nYou’re sure stranger things must have happened... somewhere, some time in the galaxy. But that doesn’t help you figure out how to stop it from spreading... or how to rescue Chief Neykkar and the others.");
	
	output("\n\n<i>“I can’t say anything for sure,”</i> the doctor says apologetically. <i>“It would help if I had a raw, safe sample of the parasite. If it even is one. Or perhaps knew more about where it comes from. Right now I’m almost as clueless as you are.”</i>");

	processTime(4);
	
	//[Cure] [Escape] [Destruct]
	kiDoctorMenu();
}

public function kiDoctorMenu(lastF:Function = null):void
{
	clearMenu();
	if (lastF != kiDoctorCure) addButton(0, "Cure", kiDoctorCure, undefined, "Cure", "Ask Elenora about a potential cure for what’s infecting the crew. Surely there must be something.");
	else addDisabledButton(0, "Cure");
	
	if (lastF != kiDoctorEscape) addButton(1, "Escape", kiDoctorEscape, undefined, "Escape", "How the hell are the two of you going to get off this tub?");
	else addDisabledButton(1, "Escape");

	if (lastF != kiDoctorDestruct) addButton(2, "Destruct", kiDoctorDestruct, undefined, "Destruct", "If worst comes to worst, could you activate the ship’s self-destruct system?");
	else addDisabledButton(2, "Destruct");

	if (lastF != null)
	{
		addButton(14, "Leave", kiDoctorLeave, undefined, "Leave", "What’s next, doc?");
	}
}

public function kiDoctorCure():void
{
	clearOutput();
	author("Savin");
	showBust("ELENORA");
	showName("DOCTOR\nVANDERBILT");

	output("<i>“Whatever it is, it’s completely fought off the crew’s microsurgeons, and it resisted Henderson’s nano-machine antibiotic treatments. Like I said, if I only knew more about it - had a sample to look at - I might be able to program a new wave of nano-machines to fight it off. Of course, then we’d have to actually treat the crew, and they don’t seem like they’ll line up for their injections.”</i>");
	
	output("\n\nShe thrums her fingers on the arm of her chair, looking between you and the mess that is the MedBay. <i>“No, we can’t distribute it manually. Too dangerous to try. Oh! The fire suppression system. If we could load an aerosol nano-machine counter agent, we could affect the whole crew at once. Let the machines work while we stay safe in here!”</i>");
	
	output("\n\nNow that sounds like a plan.");
	
	output("\n\n<i>“There might be a sample of asteroid material - or even the parasite itself - still in Henderson’s quarters. Though someone would have to go there and get it...”</i>");

	processTime(1);
	
	kiDoctorMenu(kiDoctorCure);
}

public function kiDoctorEscape():void
{
	clearOutput();
	author("Savin");
	showBust("ELENORA");
	showName("DOCTOR\nVANDERBILT");

	output("<i>“Escape? We can’t... some of the crew escaped already. They took the shuttle. But quarantine was in effect, and our security chief... she shot them down. That was before the entire crew had succumbed. Just most of them.”</i>");

	output("\n\nDamn. Well, luckily you came aboard a shuttle of your own... though it’s sealed off, and you don’t have the keys.");
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" You might be able to override it, but that’ll take a lot of time.");
	else output(" No way you’re going to be able to use the Nova shuttle without Chief Neykkar.");

	processTime(1);
	
	kiDoctorMenu(kiDoctorEscape);
}

public function kiDoctorDestruct():void
{
	clearOutput();
	author("Savin");
	showBust("ELENORA");
	showName("DOCTOR\nVANDERBILT");

	output("<i>“W-what?”</i> Elenora gasps as you explain your intentions. <i>“No, we can’t... I mean, I could, but all those people. They’re still alive, even if something’s hurting them. Changing them. We can’t kill everyone aboard the </i>Kashima<i>. That’s monstrous!”</i>");
	
	output("\n\n<i>“More monstrous than letting this spread?”</i> you ask.");
	
	output("\n\nThe doctor blanches, glancing out the window to where the horde has gathered. <i>“You’re... you’re right, I suppose. But I can’t bear the thought of destroying the ship without at least trying to help them. Now that you’re here, we can... we have to be able to do something! If only we had a cure, some way to fight back the infection.”</i>");
	
	output("\n\n<i>“And if we can’t?”</i> you prompt.");
	
	output("\n\n<i>“Then...”</i> she sighs, wrapping her arms around herself. <i>“If there’s no way to save the crew, we won’t have much choice, will we? I don’t think the company’s going to send more help, are they? No, not quick enough to save us. I... no, I’m not going to be responsible for that, [pc.name]. No way.”</i>");
	
	output("\n\nYou cross you arms, looking the doctor up and down. She’s not going to do the deed unless there’s no choice left to her. Probably smart, but you tell yourself you’ll have to be ready to force the issue if the time comes. You cannot risk this infection spreading to Steele Tech itself");
	if (!pc.isAss()) output(", much less the planet below");
	output(".");

	processTime(1);
	
	kiDoctorMenu(kiDoctorDestruct);
}

public function kiDoctorLeave():void
{
	clearOutput();
	author("Savin");
	showBust("ELENORA");
	showName("DOCTOR\nVANDERBILT");

	output("<i>“So what’s our next move?”</i> you ask. <i>“No way we’re getting out the way I came in.”</i>");

	output("\n\n<i>“You’re right. It’s been almost impossible to get around on the ship since the infected took over,”</i> Elenora sighs, adjusting her glasses. <i>“They prowl the corridors, attacking anyone and anything that they see. And if the people you came with have become infected, too... going out there again is practically suicide. At least we’re safe in here.”</i>");
	
	output("\n\nStaying holed up in here doesn’t help you, or the crew. Your companion sighs and nods, for once drawing her attention away from you and the corridor outside. You follow her gaze to a ventilation duct hidden underneath one of the desks across from her. You walk over, pushing a toppled chair and some sort of blood pump out of the way and squat down. The vent cover comes over with one good, solid yank, revealing a wide open shaft just big enough for you to get inside.");
	
	output("\n\n<i>“Where’s this lead?”</i> you ask, glancing inside. It’s pitch black, the tunnel fading off into shadows and silence.");
	
	output("\n\n<i>“Everywhere,”</i> she answers quietly. <i>“The vents connect the whole ship. I don’t... I don’t think the infected have found their way in there yet, either. You might be able to use them to get to the lower decks. Engineering, staff quarters, wherever. Just... if you’re going, close everything behind you. I don’t want infected following you back.”</i>");
	
	output("\n\nYou cock an eyebrow over your shoulder at her. <i>“You’re not coming?”</i>");
	
	output("\n\nShe shakes her head vigorously. <i>“No! No. After seeing the captain like that... and all those poor people... I don’t think I could go out there again. I’m sorry. If you find anything, though... that sample, maybe... bring it back to me. There’s still enough equipment here to make a cure. Barely.”</i>");
	
	output("\n\nLooks like you’re on your own.");

	processTime(1);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kiMedbaySleeps():Boolean
{
	if (currentLocation != "KI-H16") return false;

	IncrementFlag("KI_MEDBAY_SLEEPS");

	if (flags["KI_MEDBAY_SLEEPS"] >= 2 && flags["KI_VANDERBILTS_SECRET"] == undefined)
	{
		kiDiscoverVanderbiltsSecret();
		return true;
	}

	return false;
}

public function kiDiscoverVanderbiltsSecret():void
{
	clearOutput();
	author("Savin");
	showName("DOCTOR\nVANDERBILT");
	showBust("ELENORA_NUDE");

	processTime(30+rand(15));
	flags["KI_VANDERBILTS_SECRET"] = 1;

	output("<b>Your sleep is interrupted...</b>");
	
	output("\n\nYour fitful dreams are disturbed by a soft, wet sounds that echo through the medical bay. At first you ignore it, sleeping through the faint but ceaseless noise. Your eyes flicker open groggily, looking throughout the dimly lit MedBay. Several mutants are pushed up against the viewport to the corridor, faces distorted in mindless ecstasy as others fuck them from behind, pounding the weaker, less aggressive of their lot mercilessly with tentacles and cocks. The submissives’ own pricks and mutated members have all but covered the window with eruptions of tainted, pink seed - and they show no signs of stopping, rolling their eyes back and groping themselves gleefully as they’re railed in every hole.");
	
	output("\n\nBut that’s not the source of the noise. No, the accumulated fuck-monsters outside are all but silent through the reinforced glass. Only the occasional, reverberating <i>thump</i> of a body slamming against the glass makes it through. Still rubbing the sleep from your eyes, your gaze wanders from the lustful display on the window to the shadows around you. The soft, wet sounds persist, punctuated by quiet little moans and gasps of pleasure.");
	
	output("\n\nFinally, you see the source: almost completely hidden in the shrouded far side of the MedBay, Elenora is sitting on a swivel chair with her legs splayed, torn lab coat falling around her in tatters. One of her hands is clutching at a small, pert breast; the other has vanished between her legs, pumping at an unseen slit. She’s rolled her head back, eyes closed, completely unaware of your wakefulness during her pleasure.");
	
	output("\n\n");
	if (pc.isMisc()) output("Hell of a time for that, isn’t it?");
	else output("Considering what’s happened to her, you can’t say you were expecting to see that...");
	output(" For a moment, you consider");
	if (pc.isTreated() || pc.LQ() >= 75) output(" asking if she needs a little ‘help’ with her problem");
	else output(" pretending you’re still asleep");
	output(", at least until she shifts in her chair, turning just enough for you to see up what’s left of her bottom and the slit hidden beneath it.");
	
	output("\n\nYour eyes go wide in horror as you take in what the doctor’s hiding. Her fingers are buried deep into her pussy, as you expected, but what’s around them... a half-dozen small, vermilion tendrils are poking a few inches out of her pussy, coiling around and caressing her hand as she masturbates. That means...");
	
	output("\n\nShe’s infected. Oh shit.");

	output("\n\nIt takes you a second to realize you just said that out loud.");

	output("\n\nElenora gasps, swinging around to face you full-on. The tendrils growing from her twat lunge in your direction, doubling their own size before their host grabs them in her hand, restraining them with a moan of unbridled pleasure and frustration. <i>“S-Steele, I’m,”</i> she starts to say, desperately trying to push the tentacles back inside her. They resist, but are too small still to disobey for long.");

	output("\n\n<i>“I’m sorry,”</i> she whimpers, still grinding her fingers through her sex. <i>“I’m so sorry.”</i>");

	output("\n\nYou throw yourself up out of bed, not sure if you should be grabbing your weapon or trying to flee from her, like the other infected. Yet... unlike them, she’s still talking. Seems in control. For now. Warily, you ask her how it happened.");

	output("\n\n<i>“The... the captain,”</i> Elenora admits, shame-faced. <i>“Just before you and that leithan arrived, he pinned me and shoved a tentacle... inside me. I got free, but the tentacle came off, and stayed inside. I ran to MedBay to try and remove it, but...”</i>");

	output("\n\nShe sighs and clenches her legs together, shielding her infected sex from you. <i>“I can’t get it out. Too late. Now I can... I can feel it. Feel </i>through<i> it, I mean. Like it’s a part of me I can’t control. And it’s growing. Making me... making me think things I shouldn’t. It’s so hard not to listen...”</i>");

	output("\n\nThis can’t be good. Now you’re locked in with an infected... who also just so happens to be the only chance you have of synthesizing a cure.");
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" You’re a specialist in your field, not medical science. You wouldn’t know how to make one all by yourself, especially in a half-destroyed facility and with no extranet access.");

	output("\n\nSlowly, you find yourself asking, <i>“How long can you hold out?”</i>");
	
	output("\n\n<i>“Not long,”</i> Elenora sighs. <i>“I don’t know. I’m starting to hear things, and it’s getting hard t-to control myself,”</i> she adds, glancing down at her soaked thighs. <i>“If I go too long... without... I start to lose control. And the tentacles start growing e-even faster. Spreading.”</i>");

	output("\n\n");
	if (pc.isNice()) output("<i>“Is there anything I can... do for you?”</i> you ask uncertainly.");
	else if (pc.isMisc()) output("<i>“Think there’s anything I can do to keep you from turning into a mutant?”</i> you say with a forced grin.");
	else output("<i>“You better have a way to keep yourself from turning, doctor,”</i> you grunt, putting a hand on your [pc.weapon].");

	output("\n\nYour companion fidgets nervously, glancing from you to");
	if (pc.isAss()) output(" your weapon");
	else output(" the crowd of mutants outside, all eager to get inside");
	output(". <i>“A-actually, I do. The parasites grow, take more control, if I resist the urge so... so I need you to fuck me. Please... fuck me?”</i>");

	output("\n\nYou blink at her in surprise, not sure what to do.");

	clearMenu();
	if (pc.hasCock() || pc.hasVagina() || pc.hasTailCock() || pc.hasTailCunt()) addButton(0, "Fuck Her", kiVanderbiltFuckHer, undefined, "Fuck Her", "She’s practically begging for it. If the parasites are only suppressed by pleasure, then give her what she wants so the doc can keep her mind a little longer.");
	else addDisabledButton(0, "Fuck Her", "Fuck Her", "You don’t have any compatible genitalia!");

	addButton(1, "Refuse", kiVanderbiltRefuse, undefined, "Refuse", "No way. She might still have her mind, but the parasites could be doing the talking. You can’t afford to let her infect you.");
}

public function kiVanderbiltFuckHer():void
{
	clearOutput();
	author("Savin");
	showName("DOCTOR\nVANDERBILT");
	showBust("ELENORA_NUDE");

	output("You can only imagine how dangerous this maneuver is, but you’ll have to risk infection if you want to keep the doc on her feet - and the hope of you getting out of this jam in one piece alive. So you give the doctor a smile, slinking her way and shrugging off your [pc.gear]. Elenora lets loose a low moan, releasing the clamp on her legs and massaging her tentacle-laden pussy. It’s going to be awkward making this work without risking one of those tentacles getting too close to something they could crawl into. But you’ll manage, you tell yourself, putting on your most confident swagger for the demure doctor.");
	
	output("\n\nLeaning over Elenora, your hands lock on the back of her chair and push her back until she’s almost parallel with the deck. Her chest is heaving under her torn scrubs, eyes wide and full of awe. You wonder just how much experience a girl like her has, the way she’s so shy and uncertain. Elenora blinks up at you, slowly spreading her legs, an unsubtle invitation - but she takes no motion herself other than to caress her sex.");
	
	output("\n\nYou smile down at her, tracing a few fingers down her petite chest, teasing one of her breasts through the shredded fabric hiding it from view. Your efforts are rewarded with a gasp, and Elenora’s cheeks flushing darkly as your touch trails down to her thighs and the sodden gasp between them. Despite your feign of confidence, you can’t stop yourself from shuddering as you feel one of the parasitic tentacles rub against your hand. It tries to draw you deeper, wrapping around a finger and gently guiding you into its host’s crotch. You slip a digit in, circling around the lips of Elenora’s twat before reaching into its tentacle-laden depths.");
	
	output("\n\n<i>“[pc.name],”</i> she moans, arching her back. Her hand reaches out towards your own groin,");
	if (pc.hasCock()) output(" grabbing at your [pc.cock]");
	else if (pc.hasVagina()) output(" brushing her fingers around your pussy");
	else output(" teasing around your barren crotch");
	output(". <i>“L-let me...”</i>");

	output("\n\nYou haven’t seen any parasites around her fingers and mouth so far, so... maybe it’s safe?");

	if (pc.hasCock())
	{
		var cIdx:int = pc.biggestCockIndex();

		output("\n\nYou give the doctor a slight nod, trying to focus your efforts on her infected hole. Her hand wraps around your [pc.cock], and for the first time you notice how slender and delicate her fingers are: she’s positively <i>dainty</i>! She tenderly begins to stroke your shaft, punctuating each apex with a little gasp or a sultry moan, quickly bringing you to full mast, and drawing your [pc.hips] towards her eager face. Her eyes flutter closed and her mouth opens");
		if (pc.cocks[cIdx].thickness() <= 1) output(" just enough to fit");
		else if (pc.cocks[cIdx].thickness() <= 3) output(" wide, wrapping");
		else output(" as wide as she can stretch it");
		output(" around your [pc.cock "+cIdx+"]. She takes it like a natural, circling your [pc.cockHead "+cIdx+"] with her tongue and drawing you deeper into her welcoming mouth.");
		
		output("\n\nShe may act like a timid virgin, but Elenora sure gives head like a sex goddess.");
		
		output("\n\nYou run a hand through her disheveled hair, still using the other to tease and finger deep into her slit. Elenora’s muscles contract around your digits, and the tentacles squirm around your wrist, demanding more and more from you. They seem to <i>want</i> you to pleasure their host, like they crave it somehow. You’re happy to give it, so long as they leave Elenora’s mind alone for a little longer.");
		
		output("\n\nIt seems to work, as the doctor relaxes more and more in your embrace, lovingly tending to your [pc.cock "+cIdx+"]. She moans incoherently, faint words muffled by a mouthful of your manhood. You’re half afraid Elenora’s going to fall asleep, the way she goes languid in her chair, but to your delight, the doc holds out to the very end, moaning and gasping as your dexterous fingers eventually bring her to climax, tentacles and all.");

		output("\n\nPink juices squirt from the tentacles’ heads, basting her thighs until Elenora’s a wet, murky mess below the belt. Her whimpers of pleasure, the way she utterly loses control, drives you over the edge in short order. You grunt, grabbing the back of her head and driving your [pc.hips] forward until you’re");
		if (pc.cocks[cIdx].cLength() >= 12) output(" straining Elenora’s throat with the sheer size of your massive prick");
		else output(" grinding her lips on your crotch, completely sheathed inside her");
		output(", and cum.");
		if (pc.cumQ() >= 250 && pc.cumQ() <= 1000) output(" Clearly more than she was expecting, if the way her eyes snap open is any indication");
		else if (pc.cumQ() > 1000) output(" Elenora’s eyes snap open as her cheeks bulge from your inhuman output. She quickly ends up coughing up cum, drooling it down her chin in a mess of [pc.cumNoun].");

		output("\n\nYou leave her lips with a glossy covering of [pc.cum], drawing your [pc.cock] out with a shudder that leaves you breathless.");
		
		output("\n\n<i>“The parasites,”</i> Elenora mumbles, still gasping for breath. <i>“They’re... they’re still. For now.”</i>");
		
		output("\n\nYou give a sigh of relief. Looks like the gamble paid off. <i>“How long do you think they’ll stay quiet?”</i>");
		
		output("\n\n<i>“A few hours. Maybe,”</i> she answers with a grimace. Almost as a reflex afterwards, she licks the cum off her lips. She flushes the second she realizes what she’s done, quickly looking down to the floor. <i>“Whatever you intend to do, you need to hurry, [pc.name]. Please.”</i>");
	}
	else if (pc.hasVagina())
	{
		output("\n\nThe doctor’s already leaned as far back in her chair as she can possible be, making it easy for you to swing");
		if (pc.legCount > 1) output(" a leg");
		else output(" your [pc.leg]");
		output(" over her and present the doc with your [pc.cunt]. At the same time, you’ve given yourself a perfect angle on her tentacle-haven of a pussy, blooming with vermilion tendrils. You put your hands on Elenora’s thighs, caressing the smooth, pale flesh of them until your fingertips are back around her rosy lips.");
		
		output("\n\nThe tentacles reach out, groping blindly at your fingers and trying to pull you in. Pink juices leak from their parted tips, smearing across her thighs and your fingers like a glaze of lube. You don’t dare get your mouth involved, but for the moment, your hands are more than enough to get the good doctor going. You brush her clit, tease her lips, slip fingers deep into her until she moans and cries out. Her back arches beneath her, and her hands grab at your [pc.hips]. The feeling of fingers near your crotch, starting to spread your womanhood open for inspection, sends shivers of pleasure through you.");
		
		output("\n\nElenora’s tongue caresses your [pc.cunt], delving between your lips and into your depths. The way her hands caress your backside, groping at your behind, is almost more pleasurable than her oral ministrations though - she’s skilled with her hands, that’s for sure, always grabbing and pinching at just the right spot to drive you wild. You return the favor as much as you can with your hands, but Elenora certainly has the advantage. A wonderful heat spreads through your loins before you know it, bringing you to the edge on the back of delicate fingers and a probing tongue.");
		
		output("\n\nOrgasm rushes through you, a cascade of pleasure that has you screaming and bucking your [pc.hips] against Elenora’s face. She giggles and laps up your running juices eagerly, only adding to your ecstasy. Shuddering and gasping uncontrollably, you force yourself to focus all your attention on Elenora’s clit and the race to her own orgasm.");
		
		output("\n\nWhen it comes, it comes hard. Elenora’s back arches, and you feel a scream of pleasure being bellowed into your [pc.cunt] and sending reverberations through you. The tentacles protruding from her sex writhe madly as their host orgasms, apparently reciprocating her pleasure. Pink fluids squirt from the tendrils’ tips, basting Elenora’s thighs and your hands in parasite-spunk. The feeling of it on your [pc.skinFurScales] sends a pleasant burn through you, spreading up your arms in short order.");
		
		output("\n\nSighing contentedly, you clamber off of the doctor and ask how she’s feeling now.");
		
		output("\n\n<i>“The parasites,”</i> Elenora mumbles, still gasping for breath. <i>“They’re... they’re still. For now.”</i>");
		
		output("\n\nYou give a sigh of relief. Looks like the gamble paid off. <i>“How long do you think they’ll stay quiet?”</i>");
		
		output("\n\n<i>“A few hours. Maybe,”</i> she answers with a grimace. Almost as a reflex afterwards, she licks the cum off her lips. She flushes the second she realizes what she’s done, quickly looking down to the floor. <i>“Whatever you intend to do, you need to hurry, [pc.name]. Please.”</i>");
	}
	else
	{
		output("\n\nThough you have no sex of your own, your mutant tail is making its own desires known all the same. You caress your tail, guiding it towards Elenora’s mouth even as your hands play around between her legs. She catches on to your plan and wmiles, wrapping her hand around the tip of your tail and bringing its");
		if (pc.hasTailCock()) output(" cockhead");
		else output(" lips");
		output(" to her mouth and running her tongue across it.");
		
		output("\n\nSecond-hand pleasure blossoms from your [pc.tail], enough to make your breath catch as you return your attentions to Elenora’s pussy. You put your hands on Elenora’s thighs, caressing the smooth, pale flesh of them until your fingertips are back around her rosy lips.");
		
		output("\n\nThe tentacles reach out, groping blindly at your fingers and trying to pull you in. Pink juices leak from their parted tips, smearing across her thighs and your fingers like a glaze of lube. You don’t dare get your mouth involved, but for the moment, your hands are more than enough to get the good doctor going. You brush her clit, tease her lips, slip fingers deep into her until she moans and cries out. Her back arches beneath her, and her hands grab at your [pc.tail]. The feeling of fingers near your tail-sex,");
		if (!pc.hasTailCock()) output(" starting to spread your womanhood open for inspection");
		else output(" starting to jerk your rear-mounted manhood");
		output(", sends shivers of pleasure through you.");
		
		output("\n\nThough she’s certainly not adept at pleasuring a tail, Elenora certainly seems capable when she puts her mind to it. She pulls your tail to her mouth, licking around your sex while you slip your fingers deeper and deeper inside her. You gasp and moan, wiggling the length of your tail across your partner’s chest, brushing at her small breasts until she whimpers and sucks a little harder on your");
		if (!pc.hasTailCock()) output(" clit");
		else output(" dick");
		output(". Meanwhile, your feel her hands tracing along your thigh, then your [pc.butt], groping at your rear.");
		
		output("\n\nThe way her hands caress your backside, groping at your behind, is almost more pleasurable than her oral ministrations though - she’s skilled with her hands, that’s for sure, always grabbing and pinching at just the right spot to drive you wild. You return the favor as much as you can with your hands, but Elenora quickly takes the advantage. A wonderful heat spreads through your loins before you know it, bringing you to the edge on the back of delicate fingers and a talented tongue.");
		
		output("\n\nOrgasm rushes through you, a cascade of pleasure that has you screaming and thrashing your [pc.tail] against Elenora’s face. She giggles and laps up your");
		if (!pc.hasTailCock()) output(" running juices");
		else output(" surge of [pc.cum]");
		output(" eagerly, only adding to your ecstasy. Shuddering and gasping uncontrollably, you force yourself to focus all your attention on Elenora’s clit and the race to her own orgasm.");
		
		output("\n\nWhen it comes, it comes hard. Elenora’s back arches, screaming around the tip of your [pc.tail]. The tentacles protruding from her sex writhe madly as their host orgasms, apparently reciprocating her pleasure. Pink fluids squirt from the tendrils’ tips, basting Elenora’s thighs and your hands in parasite-spunk. The feeling of it on your [pc.skinFurScales] sends a pleasant burn through you, spreading up your arms in short order.");
		
		output("\n\nSighing contentedly, you clamber off of the doctor and ask how she’s feeling now.");
		
		output("\n\n<i>“The parasites,”</i> Elenora mumbles, still gasping for breath. <i>“They’re... they’re still. For now.”</i>");
		
		output("\n\nYou give a sigh of relief. Looks like the gamble paid off. <i>“How long do you think they’ll stay quiet?”</i>");
		
		output("\n\n<i>“A few hours. Maybe,”</i> she answers with a grimace. Almost as a reflex afterwards, she licks the cum off her lips. She flushes the second she realizes what she’s done, quickly looking down to the floor. <i>“Whatever you intend to do, you need to hurry, [pc.name]. Please.”</i>");
	}

	processTime(10+rand(5));
	pc.orgasm();
	flags["KI_VANDERBILTS_SECRET"] = 2;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kiVanderbiltRefuse():void
{
	clearOutput();
	author("Savin");
	showName("DOCTOR\nVANDERBILT");
	showBust("ELENORA_NUDE");

	output("<i>“No,”</i> you say, as firmly as you can. <i>“Can’t risk it.”</i>");
	
	output("\n\nElenora grunts, turning away from you. <i>“I... you’re right. You’re right, of course. I still don’t know the details of the parasite’s infection vectors. We can’t risk infecting you, too. In fact, I... I should leave. Go out into the horde outside. That way-”</i>");
	
	output("\n\nAs much as sending the doctor out might be the safer course, you’re doomed without at least someone with you.");
	
	output("\n\n<i>“No,”</i> you repeat. <i>“No way. I’m not making it out of this all by myself. We still need to work together.”</i>");
	
	output("\n\nShe avoids your gaze, but doesn’t make a move to throw herself out of the MedBay, either. <i>“I’m sorry, [pc.name]. You’re right. I’ll... I’ll try and hold it together for as long as I can. Just be careful around me. I don’t know if I’ll have a chance to warn you before it’s too late.”</i>");
	
	output("\n\nYou nod, but feel rather unsure about your chances now. Things have gotten quite a bit more dicey, and you’re not going to be able to trust the doctor now. Have to be on guard at all times...");
	
	flags["KI_REFUSED_VANDERBILT"] = 1;
	sleep(false);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kiMedbayCure():void
{
	clearOutput();
	author("Savin");
	showName("DOCTOR\nVANDERBILT");
	showBust("ELENORA");

	output("You crawl up through the vents once again, grunting with discomfort in the cramped quarters.");
	if (pc.isTaur()) output(" Thank God for whoever made the vents big enough for your tauric form to fit in!");
	output(" The grating under the MedBay desk pops off with an echoing <i>CLANG</i>, clattering onto the floor as you pull yourself up and onto the deck. A cloud of dust follows you, settling over the toppled chair and scattered equipment nearby.");
	
	output("\n\nSomething looks different from when you were here last - as if the MedBay’s been ransacked all over again, with even more of its equipment and furniture tossed helter-skelter. The security door at the front is solidly sealed, though, and it seems that the horde outside has dispersed.");
	if (flags["KI_VANDERBILTS_SECRET"] == undefined) output(" Elenora is sitting at her desk, legs crossed and face hidden in her hands. She looks tired, broken.... She doesn’t react to your return.");
	else output(" Elenora is sitting at her desk, legs spread and a hand delving deep between them in the tatters of her clothing. Her fingers pump vigorously in and out of her tentacle-laden twat, and she’s moaning weakly as the tendrils squirm around her thrusting digits. She barely responds to your entry.");
	
	output("\n\nYou approach and put a hand on her shoulder, trying to get her attention. She gasps, starting up almost out of her chair. <i>“[pc.name]! Y-you’re back! You’re really back!”</i>");
	
	output("\n\nThough you can clearly see her chest hammering");
	if (flags["KI_VANDERBILTS_SECRET"] == undefined) output(" from surprise");
	else output(" with still-rampant desire");
	output(", she quickly adjusts her spectacles and hops to her feet with a faint smile.");
	if (flags["KI_VANDERBILTS_SECRET"] != undefined) output(" Fem-cum and pink tentacle juices drool lewdly down her thighs, filling their air with a feminine musk that makes your skin burn.");
	output(" Smiling to her, you pull out the security case you picked up and show it to her, warning that there’s a parasite in there that seems eager to escape its containment.");
	
	output("\n\n<i>“Y-you found one? Really?”</i> Elenora gasps, taking the box from you. <i>“You’re a saint, [pc.name]. If I’m right - if this is what’s causing the mutations - I might be able to synthesize a cure. Distributing it will be a whole different issue, but it’s a start. A good start!”</i>");
	
	output("\n\nShe clutches the box tight and scurries over to a biohazard-marked container - the kind with gloves on the outside poking in, letting her manipulate it safely. She shoves her hands into the gloves and goes to work, bringing over analyzer tools and containers of nanomachines that have somehow survived the otherwise devastating chaos that swept through the room.");
	
	output("\n\n<i>“This will take a while. If... if it works at all,”</i> she says over her shoulder. <i>“You should rest up. Spreading a cure around is going to be even harder than making it.”</i>");

	processTime(3);
	
	pc.removeKeyItem("Parasite Sample");
	
	flags["KI_VANDERBILT_WORKING"] = 1;
	flags["KI_VANDERBILT_WORKING_START"] = GetGameTimestamp();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kiApproachElenora():void
{
	clearOutput();
	author("Savin");
	showName("DOCTOR\nVANDERBILT");
	showBust("ELENORA");

	output("<i>“How’re you doing, doc?”</i> you ask, looking over Elenora’s shoulder. The container is open inside the glovebox, and the little parasite is moving around the shattered remains of its sample tube.");
	
	output("\n\nShe smiles, looking up from her work for a moment. She looks exhausted, pale, a little sickly... but excited. <i>“You found the perfect sample. This little guy seems to be some sort of extremophile, and extremely young at that. Too small to have been the first infectious parasite... he may have only just hatched inside the rock sample you gave me, after Henderson had recovered it. If that’s the case, the whole surface of this rock might be crawling with hidden tentacles. I suppose it was only a matter of time before one of them found its way into a collector drone, or even through our own airlocks. Commander Henderson just got unlucky: given the strength of this creature even in such a juvenile state, I can only imagine an adult must have caused the fuel explosion, and infected the Commander while he was injured. Perhaps his suit ruptured, and the parasite bypassed his emergency shield?”</i>");
	
	output("\n\n<i>“That’s all fascinating, but do we have a cure?”</i>");
	
	output("\n\nShe blinks. <i>“Oh! Yes, yes, of course. Here,”</i> Elenora says, grabbing a small aerosol spray bottle from the desk beside her and plugging it into the side of the glovebox. She reaches in through a glove, grabs the worm-like parasite, and drags it up to face the spray nozzle. It makes a little shrieking sound, struggling violently until the doctor pulls the trigger, spraying a thin gray mist all over it.");
	
	output("\n\nThe parasite seizes up, shudders, and goes limp.");
	
	output("\n\n<i>“Is it...?”</i>");
	
	output("\n\n<i>“No, it’s alive,”</i> Elenora says, unplugging the spray bottle. <i>“But it’s comatose. Easy to remove from the host, without doing permanent harm from an instant death. I don’t know exactly how deeply ingrained the parasite’s control is, especially in advanced cases like Commander Henderson or the captain. Just killing it could kill the host, but this... this renders it unconscious, and should keep it that way for a few days. That will give me and a medical crew more than enough time to carefully remove them. Without harm to parasite or host.”</i>");
	
	output("\n\nThat sounds... wait a second. <i>“Without harming the parasite?”</i>");
	
	output("\n\n<i>“Of course!”</i> she huffs, looking at you like you’re a dimwit. <i>“These parasites could be sapient for all we know. Even if not, they could be extraordinarily valuable to Steele Tech. Who knows what the company’s biology department could synthesize from it... and as the company that discovered the species, if we prove they’re not sapient, we can copyright their genetic structure. Standard company policy for first-contact like this, you should know that.”</i>");
	
	output("\n\nYou wonder to yourself if you should <i>let</i> Steele Tech harvest these parasites. Even if they could be worth a fortune, they’re clearly pretty damn dangerous....");
	
	output("\n\nElenora hands you the spray can, pressing it into your hands. <i>“Here. If you can get this into the fire suppression system, it’ll spread it all over the ship in moments once one of us pulls the fire alarm. No matter how dangerous things get, we have to get the cure out as fast as we can. That’s the only way to make sure we... and the crew... are safe.”</i>");
	
	output("\n\nYou nod and pocket the can. Fire suppression would be down in Engineering, in the bowels of the ship’s rear. A long haul, and one you probably aren’t coming back from unless you can get the cure to work. Something tells you the big, open, warm maze of the engine deck is going to be absolutely swarming with infected.");

	processTime(4);
	
	flags["KI_VANDERBILT_WORKING"] = 2;
	
	pc.createKeyItem("Parasite Cure", 0, 0, 0, 0, "A vial containing a potential cure for the parasite afflicting the crew of the <i>Kashima</i>.");
	output("\n\n<b>Key Item Acquired: Parasite Cure - A vial containing a potential cure for the parasite afflicting the crew of the <i>Kashima</i>.</b>");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kiEngineeringBossFight():void
{
	clearOutput();
	author("Savin");
	showName("ENGINEERING\nDECK");
	showBust("USHAMEE_NUDE", "HENDERSON");

	output("You clamber down the vent shaft into the bowels of the <i>Kashima</i>’s pipes. The trip’s long, cramped, and sweaty, taking you through increasingly warm, dark pipes until you’re feeling your way around on panels of steel that sizzle and burn your fingers. Eventually, just as you’re reaching the extent of your endurance, you find a grate going straight down over a deck that’s lit brilliant red and thrumming with the reverberations of LightDrive engines at rest.");
	
	output("\n\nThe grate comes off with a good shove, and you tumble down to the deck. Emergency lights flare above you, bathing your surroundings in crimson. Towering engine blocks and steaming pipes stand tall all around you, looming large against cum-slathered bulkheads. You can hear faint hisses and growls over the engine sounds now, and... and the sounds of sensual moans, cries of pleasure from the shadows. As you look around, eyes adjusting to the different light, you can see writhing tentacles clutching at the bulkheads, covering the machinery in biological masses of red and black, slime and sinew.");
	
	output("\n\nWhat the...");
	
	output("\n\nYou stand and approach one of the walls, and a thick pod-like collusion of tentacles wrapped around a support pillar. Inside, as you near, you recognize the hints of white and orange of Nova Securities armor, torn open to reveal a pair of heavy breasts and shapely thighs, pale skinned faintly red-tinged. Four thick, squirming, living tentacles are thrust up between the soldier’s legs, buried deep in her pussy and throbbing as it injects fluids into her womb. More troops are nearby on the wall as you walk closer, each sealed in a bed of tentacles and being fucked in every hole.");
	
	output("\n\n<i>“St-Steele!”</i>");
	
	output("\n\nA familiar voice snaps your attentions around to a wide-open section on the other side of the deck, barely lit by the flickering screens of a dozen holo-terminals. The control station. In the middle of it is what looks to be a junction of dozens of thick tendrils, grasping at the six legs of Chief Neykkar, spreading them apart like an ant and forcing her onto her side. Another tentacle is wrapped around her arms, pinning them to her side, and another has grasped her reptilian tail and lifted it straight up.");
	
	output("\n\nAnd one big, throbbing, slime-slathered red tentacle has plunged itself right into her crotch through the sundered remains of her armor. It goes deep inside, so deep that her belly is bloating between her splayed legs, swollen out far beyond even what a leithan’s gravid pregnancy could ever be.");
	if (silly) output(" She might as well have swallowed a beach ball!");
	output(" Despite that, her skin’s still the same dark gray, and her eyes are the starry blue you’d expect from a leithan. Is she actually infected, or are they... are they using her for something else? She groans as the tentacle thrusts into her, swelling as <b>something</b> passes through it into her bloated body. Her tremendous F-cup tits bounce with the aftershocks, drooling golden milk down the heavy orbs.");
	
	output("\n\n<i>“Steele! Help!”</i> she shrieks, squirming helplessly in the tentacles’ grasp. You start running her way, beating aside more hap-hazard tentacles until you’re at the Chief’s side, pulling at the tentacles binding her arms. <i>“Get... ah! Get... out! Get-”</i> she cries, barely able to form words as the tentacle pumps her ruined pussy.");
	
	output("\n\nYou think she’s telling you to <i>“get it out.”</i> At least, you do until you feel something slimy and coal-hot wrap around your [pc.foot]. You roll forward, spinning to face your attacker with your [pc.weapon] drawn.");
	
	output("\n\nBehind you stands a particularly massive mutant crewman, easily seven feet tall, with skin as red as cold blood. He was human once, you’re sure, but now he looks like a tentacle abomination straight out of a Neo-Tokyo ultraporn, with legs and arms nothing more than dozens of wrapped tentacles, and dozens more drooping and squirming from his crotch, chest, and face. Two pink-hued eyes, glowing as bright as embers, stare down at you from sockets surrounded by dozens of scillia-like shafts.");
	
	output("\n\nThe tatters of a Steele Tech jumpsuit still cling to its chest, though in little more than strips of material stuck between writhing tentacles. You can just barely make out the Commander’s stripes on his shoulders. Commander Henderson.");
	
	output("\n\nThe creature doesn’t roar. Doesn’t menace or shriek or challenge you. It simply stomps mindlessly forward, lashing tentacles out to grasp at your arms and");
	if (pc.hasLegs()) output(" legs");
	else output(" body");
	output(". This guy’s got no mind left to speak of, looks like: just beastial instinct and parasitic directives. You’re not getting out of this without a fight.");

	processTime(7);
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new CommanderHenderson());
	CombatManager.displayLocation("HENDERSON");
	CombatManager.victoryCondition(CombatManager.ENTIRE_PARTY_DEFEATED);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
	CombatManager.victoryScene(kiHendersonVictory);
	CombatManager.lossScene(kiHendersonLoss);
	CombatManager.encounterTextGenerator(function():String {
		var m:String = "Before you stands a particularly massive mutant crewman, easily seven feet tall, with skin as red as cold blood. He was human once, you’re sure, but now he looks like a tentacle abomination straight out of a Neo-Tokyo ultraporn, with legs and arms nothing more than dozens of wrapped tentacles, and dozens more drooping and squirming from his crotch, chest, and face. Two pink-hued eyes, glowing as bright as embers, stare down at you from sockets surrounded by dozens of cilia-like shafts.";
		
		var h:Array = CombatManager.getHostileActors();
		if (CombatManager.hasFriendlyOfClass(ChiefNeykkar))
		{
			// noop
		}
		else if (!h[0].hasStatusEffect("Free Chief"))
		{
			m += "\n\nChief Neykkar is wrapped up tightly by a squirming mass of tentacles. If you can get her free then you might have the upper hand...";
		}
		else
		{
			m += "\n\nThe Chief is free of the crushing mass of tentacles, but she’s still a little out of it. She needs a minute or two to get her legs back under herself...";
		}
		
		return m;
	});
	
	clearMenu();
	addButton(0, "Fight!", CombatManager.beginCombat);
}