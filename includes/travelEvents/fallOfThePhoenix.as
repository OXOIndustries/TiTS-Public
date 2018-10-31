import classes.Characters.PhoenixPirates;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.Items.Melee.Rock;
import classes.Items.Miscellaneous.EmptySlot;
import classes.kGAMECLASS;

public function startFallOfThePhoenix(destination:String):void
{
	clearOutput();
	author("Savin");
	output("You divert your course towards the attached coordinates. It isn’t far, and the journey takes little more than a few minutes at top acceleration. When you return to relativistic speeds, your viewscreen lights up with a picture of utter carnage: a small cargo transport surrounded by a field of debris - mostly blasted from its hull - and locked in the clutches of several magnetic hooks attached to a medium frigate holding maybe two clicks off the port side. The frigate’s proudly painted with the skull and crossbones on its engine nacelles, each skull surrounded by a circle of woven rose vines.");
	output("\n\nYour computer handily highlights a battery of powerful lasers and rocket pods bristling all across the attacking ship’s hull. Nasty piece of work. It doesn’t look like the pirate crew’s noticed you, yet, though... you could still back out, or maybe swing in low under the victim transport, blocking your ship from the pirates’ weapon batteries. ");
	processTime(10+rand(6));

	//[Move In] [Back off]
	clearMenu();
	addButton(0, "Move In", moveInToDaShip, destination);
	addButton(1, "Back Off", fuckThisShittyShip, destination);
}

public function fuckThisShittyShip(destination:String):void
{
	clearOutput();
	author("Savin");
	output("No way you can deal with this. With a heavy heart, you back your ship off from the skirmish, leaving the <i>Phoenix</i> to its fate.");

	flags["FALL OF THE PHOENIX STATUS"] = -1;

	clearMenu();
	addButton(0, "Next", flyToWrapper, destination);
}

// In lieu of having proper support for lockable room status based off of some intenralised map structure, this is the only real way I can set this up. Basically, post-load state will set the nessecary setup of the rooms in the Phoenix based on flags.
public function phoenixSetMapState():void
{
	// RecRoom -> Bridge
	if (flags["FALL OF THE PHOENIX BRIDGE ACCESSIBLE"] == undefined) rooms["PHOENIX RECROOM"].westExit = null;
	else rooms["PHOENIX RECROOM"].westExit = "PHOENIX BRIDGE";
}

public function moveInToDaShip(destination:String):void
{
	// Set the initial map state
	phoenixSetMapState();
	
	clearOutput();
	author("Savin");
	output("Carefully, you angle your ship around beneath the <i>Phoenix</i>, putting it between you and the pirate vessel. With those grappling lines, the enemy shouldn’t be able to move around and engage you, at least for a few minutes. That’s all you need to close the distance between your ships, using the docking thrusters to guide your vessel in through the field of wreckage left over from the ruptured hull. You get about as close as you can, aligning your ship with the <i>Phoenix</i>’s main airlock, though you’ve still got a good hundred yards between you. You abandon the bridge, hiking down to the armory and load up your kit and a grappling gun before suiting up for E.V.A.");
	output("\n\nOnce you’ve gathered your gear together, you make your way to the airlock and cycle through it. A moment passes, and the great black vastness of space is open before you, though marred by the field of carbon-scorched steel floating listlessly between you and the <i>Phoenix</i>’s hull. You bring the grappling gun to your shoulder, take aim, and fire. The magnetic hook flies true until it cracks into the other ship’s airlock door. You tie the rope off, making sure it’s nice and rigid before you go, lest you end up free-floating for eternity. Once you’ve made sure it’s secure, you latch on and activate your suit’s thrusters, letting them carry you across the void between your ships until you face-plant into the <i>Phoenix</i>’s hull.");
	output("\n\nGraceful. As. Fuck. You peel yourself off the hull and grab the airlock panel, punching in the command for it to cycle open. You’re glad you were beside it when it pops open: the outer door practically blasts off its hinges as air evacuates out in an explosion of air and furniture. You grab onto a railing for dear life while the compartment vents, leaving a foggy cloud of air billowing out from the <i>Phoenix</i> which is thankfully devoid of bodies. When the vent is complete, you swing into the devastated compartment and activate your mag-boots with a satisfying electronic beep. By the look of it, this was a common room before your... dynamic entry. A card table’s been crushed against the wall next to the airlock, floating in splinters around you as a fridge strains against its oversized power cords. ");
	output("\n\nSo, you’ve made it aboard ship. The next question is... how do you proceed? Opening the other doors would probably result in further air loss, and if you aren’t johnny on the spot, you could decompress the entire ship. From where you’re standing, there’s a fore door to the bridge, and an aft one to the engineering and cargo decks; from the carbon scoring on the bulkheads, it looks like there was a running firefight thataway. There’s also a console up against the starboard bulkhead that’s still blinking with power despite the lack of air. Hardy little computer.");

	currentLocation = "PHOENIX RECROOM";
	flags["STORED SHIP DESTINATION"] = destination;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function phoenixRecRoomUpdate():void
{
	if(flags["FALL OF THE PHOENIX STATUS"] == 1 && flags["SAENDRA AFFECTION"] != undefined)
	{
		rooms["PHOENIX RECROOM"].addFlag(GLOBAL.LIFTDOWN);
	}
	else
	{
		rooms["PHOENIX RECROOM"].removeFlag(GLOBAL.LIFTDOWN);
	}
}
public function phoenixRecRoom():void
{
	clearOutput();
	author("Savin");
	phoenixLocationSetter();

	if (flags["FALL OF THE PHOENIX STATUS"] == 1 && flags["SAENDRA AFFECTION"] != undefined)
	{
		output("The main room of the <i>Phoenix</i> looks like a cross between a seedy pub and an extranet cafe. A big pool table dominates the center, covered with enough dirty plates and beer bottles to make you think it spends more time acting as a dinner table than gaming space. A liquor cabinet is on the far wall, as is a refrigerator and food replicator, which both smell vaguely like pizza and Chinese take-out.");
		
		// Hooking into Phoenix Room stuff for post-arrival at Tavros
		// See: Saendra.as
		if (flags["SAENDRA GONNA GO GET A COCK"] == 2)
		{
			phoenixRecRoomAtTavros();
		}
		
		if (currentLocation != shipLocation) addButton(7, "Exit", move, shipLocation);
	}
	else
	{
		// {Power has NOT been restored via Engineering}
		if (flags["FALL OF THE PHOENIX ENGINEERING STATUS"] == 0 || flags["FALL OF THE PHOENIX ENGINEERING STATUS"] == undefined)
		{
			output("The recreational room of the <i>Phoenix</i> has been trashed thanks to your dynamic entry through the airlock. Most of the furniture is floating listlessly around, or is smashed against the walls. There’s a computer, somehow still attached to the wall,");
			if (flags["FALL OF THE PHOENIX COMPUTER STATUS"] == 0 || flags["FALL OF THE PHOENIX COMPUTER STATUS"] == undefined) output(" currently blinking urgently");
			else output(" though of course it’s managed to short itself out");
			output(".");
		}
		// {Power has been restored}
		else
		{
			showBust("VALERIA");
			output("The recreational room of the <i>Phoenix</i> has been trashed thanks to your dynamic entry through the airlock. Most of the furniture is smashed against the floor now that gravity is back. With power on again, Valeria’s avatar has flickered onto a holo-platform beside the shorted-out computer, desperately working on several different data windows. A casual glance tells you she’s manually operating the ship’s defenses, keeping the shields up against the pirate ship’s bombardment.");
		}
		
		if (flags["FALL OF THE PHOENIX BRIDGE ACCESSIBLE"] == 1) output("\n\nThe door leading to the bridge of the <i>Phoenix</i> is slightly ajar.");
		else output("\n\nThere’s an ominous red glow coming from an access panel adjacent to a door to the west.");

		//[Computer]
		if (flags["FALL OF THE PHOENIX COMPUTER STATUS"] == 0 || flags["FALL OF THE PHOENIX COMPUTER STATUS"] == undefined) addButton(0, "Computer", phoenixRecRoomComputer);
		
		// Overwrite East button
		if (flags["FALL OF THE PHOENIX SHIELDS STATUS"] != 2)
		{
			addButton(12, "East", phoenixRecRoomEastBlocked);
		}
	}
}

public function phoenixRecRoomEastBlocked():void
{
	clearOutput();
	clearBust();
	
	output("The door is sealed, though beyond it, you can hear the sounds of gunfire.");
	if (flags["FALL OF THE PHOENIX TALKED TO AI"] == 1) output(" The A.I.");
	else output(" A voice");
	output(" announces, <i>“Cargo doors are sealed while life forms are still inside and atmosphere is drained in the recreation room.”</i>");
	output("\n\nShit.");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function phoenixRecRoomComputer():void
{
	clearOutput();
	author("Savin");
	showBust("VALERIA");
	output("You approach the computer console, and it springs to life before you can lay a hand on it. A blue holo projection flickers to life from the screen, coalescing into the form of a tiny fairy fluttering on ghostly butterfly wings. Your comms ping, and a voice chimes into your ear: <i>“Oh thank God, you’re not a pirate! Please, you have to help us!”</i>");

	output("\n\n<i>“Calm down, I’m-”</i> Before you can finish speaking, the fairy’s holographic avatar sizzles and pops as the computer console sparks, overloading with the rest of the ship’s systems. Shit.");
	flags["FALL OF THE PHOENIX COMPUTER STATUS"] = 1;

	output("\n\n<i>“Sorry,”</i> the now-disembodied voice says into your comms, <i>“If you’re here to help, please, you have to get to the bridge and turn the shields on. That’ll stop the atmosphere from venting, and might buy us some time against the pirate ship’s weapons.”</i>");
	
	flags["FALL OF THE PHOENIX BRIDGE ACCESSIBLE"] = 1;
	rooms["PHOENIX RECROOM"].westExit = "PHOENIX BRIDGE";

	//[Who are you?] [Next]
	clearMenu();
	addButton(0, "Who are you?", phoenixWhoAreYou);
	addButton(1, "Next", mainGameMenu);
}

public function phoenixWhoAreYou():void
{
	clearOutput();
	author("Savin");
	showValeria();
	output("<i>“Who exactly are you?”</i> you ask, speaking to the air. Or lack thereof, now.");

	output("\n\n<i>“My name is Valeria,”</i> the disembodied voice responds in your ear, <i>“I’m Captain en Illya’s personal A.I. I handle the </i>Phoenix<i>’s main routines, but the pirates have severed my control. We have to get to the bridge so we can regain control of the ship! Please!”</i>");

	output("\n\nDoesn’t look like you’re getting anything useful out of her while she’s panicking. Better get the shields on.");

	flags["FALL OF THE PHOENIX TALKED TO AI"] = 1;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function phoenixBridge():void
{
	clearOutput();
	author("Savin");
	phoenixLocationSetter();
	
	if (flags["FALL OF THE PHOENIX STATUS"] == 1 && flags["SAENDRA AFFECTION"] != undefined)
	{
		output("The <i>Phoenix</i>’s bridge -- really more of a cramped cockpit -- is clearly a solo operation, with a single cushiony chair pulled up to a console with blinking lights and readout displays. A huge pair of fuzzy dice hang from the forward viewscreen. Several holo-discs are scattered around, some stacked up under a game controller, others are tucked where you might not notice them on first glance, showing quite a bit of skin on their covers. ");
	}
	else
	{
		if (flags["FALL OF THE PHOENIX BRIDGE ENTERED"] == undefined || flags["FALL OF THE PHOENIX BRIDGE ENTERED"] == 0)
		{
			flags["FALL OF THE PHOENIX BRIDGE ENTERED"] = 1;
			output("At the A.I.’s behest, you float up to the western door and grab the hatch, bracing yourself for another decompression. Locking your mag-boots onto the deck, you twist the handle and take cover - sure enough, a huge gust of air sucks out of the cockpit, blasting some of the floating furniture in the rec room against the far wall. It only takes a moment to pass, and then you’re able to swing yourself onto the bridge.");
			output("\n\n");
		}

		//	{Power hasn't been restored}
		if (flags["FALL OF THE PHOENIX ENGINEERING STATUS"] == undefined || flags["FALL OF THE PHOENIX ENGINEERING STATUS"] == 0)
		{
			output("The <i>Phoenix</i>’s bridge is fairly cramped, clearly a solo operation. The captain’s chair is large and plush, sitting in the shadow of the biggest pair of fuzzy dice you’ve ever seen, dangling from the top of the viewscreen.");
			output("\n\nThe captain clearly wasn’t expecting company: there are several half-eaten bags of chips and cookies floating around in the zero-G");
			
			if (!pc.hasKeyItem("Holodisk: Horsecock Hell 2")) output(", along with a pair of holodisks obviously labeled <b>‘Horsecock Hell 2: A Tail of Two Twats’</b>");
			
			if (flags["FALL OF THE PHOENIX DILDO GET"] == undefined) output(" and an oversized pink dildo shaped like an equine phallus, currently trapped under the headrest after the decompression sucked it out of... wherever she’d hidden it");
			output(".");
		}
		// {Power has been restored, from the engineering deck}
		else
		{
			output("The <i>Phoenix</i>’s bridge is fairly cramped, clearly a solo operation. The captain’s chair is large and plush, sitting in the shadow of the biggest pair of fuzzy dice you’ve ever seen, dangling from the top of the viewscreen. With main power back on, the accumulated trash has fallen back onto the ground.");
			if (!pc.hasKeyItem("Holodisk: Horsecock Hell 2")) output(" The porno holos are noticeably absent, and");
			if (flags["FALL OF THE PHOENIX STATUS"] != 1) output(" Captain Saendra is slumped in her captain’s chair, fiddling with the controls.");
		}

		if (flags["FALL OF THE PHOENIX SHIELDS STATUS"] != 2) addButton(0, "Shields", phoenixBridgeShields);
		if (!pc.hasKeyItem("Holodisk: Horsecock Hell 2")) addButton(1, "Disks", phoenixBridgeDisks);
		if (flags["FALL OF THE PHOENIX DILDO GET"] == undefined || flags["FALL OF THE PHOENIX DILDO GET"] == 0) addButton(5, "Dildo", phoenixBridgeDildo);
		if (flags["FALL OF THE PHOENIX ENGINEERING STATUS"] == 1 && flags["FALL OF THE PHOENIX STATUS"] != 1) addButton(7, "Saendra", phoenixBridgeCaptain);
	}
}

public function phoenixBridgeCaptain():void
{
	clearOutput();
	saenHeader();
	output("You step up behind the captain, planting an arm around the headrest of her chair. Upon looking down at her, you see that she looks deathly pale, her sides and left arm wrapped in bandages stained red with blood. ");

	output("\n\n<i>“You’re a life-saver, [pc.name],”</i> she says through gritted teeth, planting a hand on the throttle. <i>“The </i>Phoenix<i> can cover you for a couple minutes. Get back to your ship and get out of here... I’ll try and limp back to Tavros station, get patched up. If we actually make it out of here... look me up some time, hero. I owe you one.”</i>");

	output("\n\nYou put a hand on her good shoulder, then book it back towards the airlock. Now that it’s back online, you fix your suit back together and cycle through the airlock. When the outer door slides open, you’re greeted by a light show as the <i>Phoenix</i>’s shields buckle and flash under bombardment, and stray shots go wide around the drifting vessel, lighting up the darkness of space. Thankfully, Saendra’s ship is still parked between the pirate vessel and your own, shielding your ship from the worst of the attack. You grab the rope connecting your ships and hit your thrusters, hurtling back across the gulf of space and into your still-open airlock.");

	output("\n\nYou’ve barely landed in your own airlock before you see the <i>Phoenix</i>’s engines fire up, getting it moving out of the frigate’s line of fire. Shit. You seal the airlock and run for your bridge, hopping into the captain’s chair and hitting your own engines -- just as the first laser bolts hammer into your upraised shields. You bring your ship about and follow in the <i>Phoenix</i>’s wake, cranking up the speed to max and bolting towards the nearest gate, well away from the lethal pirate assault.");
	
	currentLocation = "SHIP INTERIOR";

	flags["FALL OF THE PHOENIX STATUS"] = 1;
	
	if (flags["STORED SHIP DESTINATION"] == undefined) flags["STORED SHIP DESTINATION"] = "Tavros";

	clearMenu();
	addButton(0, "Next", flyToWrapper, flags["STORED SHIP DESTINATION"]);
}

public function phoenixBridgeDisks():void
{
	clearOutput();
	author("Savin");
	output("You pick the pair of pornographic holodisks out of the air, looking at the cases covered with gene-modded centaur men and hermaphroditic humanoids with oversized equine phalluses and large, heavy breasts. Between them is a single ausar girl, covered head to toe in semen, kneeling over a futa horsegirl who has her cock buried up the star’s ass to the hilt until her gut is bulging. ");

	output("\n\nDelightful.");

	pc.createKeyItem("Holodisk: Horsecock Hell 2", 0, 0, 0, 0, "A pair of holodisks labeled ‘<b>Horsecock Hell 2: A Tail of Two Twats</b>’. The cover makes a big deal out of the star of the show: ‘Nivas Oxonef’.");
	output("\n\n<b>Horsecock Hell 2 has been added to Key Items</b>");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function phoenixBridgeDildo():void
{
	clearOutput();
	author("Savin");
	if (flags["FALL OF THE PHOENIX FLUX COUPLING STATUS"] == undefined || flags["FALL OF THE PHOENIX FLUX COUPLING STATUS"] == 0)
	{
		output("You consider messing with the dildo lodged in the head-rest, but... that’s been places, man. ");
	}
	else
	{
		output("Hmm. Big, plastic... this might actually work out in your favor. You take the life-sized horsewang and turn back toward the rec room. ");
		flags["FALL OF THE PHOENIX DILDO GET"] = 1;
	}

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function phoenixBridgeShields():void
{
	clearOutput();
	author("Savin");
	// PC hasn't routed the power
	if (flags["FALL OF THE PHOENIX FLUX COUPLING STATUS"] != 2)
	{
		output("<i>“There’s the button,”</i> the disembodied A.I. says. A moment passes as she tries to point it out, sans body. <i>“Uh... the big green one. Under the fuzzy dice.”</i>");

		output("\n\n<i>“Right,”</i> you say, pressing the button.");

		output("\n\nNothing happens. ");

		output("\n\n<i>“Uh...”</i> the A.I. groans, half-thinking and half-panicking. <i>“Pirates must have shorted the systems out when they hit us. Oh, no. Okay, okay, uh... there’s a flux coupling behind the bulkhead in the captain’s quarters. Come on, we can re-route the power from there!”</i>");
		flags["FALL OF THE PHOENIX SHIELDS STATUS"] = 1;
	}
	// PC has routed the power
	else
	{
		output("You press the shield control again, and this time, you’re rewarded with a roaring sound from the back of the ship and several panels in the cockpit shorting out, showering you in sparks. Through the viewscreen, you’re rewarded with the sight of bright orange energy wrapping around the cockpit, spreading out from the emitters overhead and enveloping the wreck of the <i>Phoenix</i>. ");

		output("\n\n<i>“You did it!”</i> your A.I. companion cheers. <i>“No more pirates are getting aboard while the shields are up. If we’re lucky, their ship won’t risk firing on us again while their crew is aboard. Thank god for you, " + pc.mf("mister","miss") + ". Now let’s go rescue Captain en Illya!”</i>");

		output("\n\nJust as she says it, though, you’re nearly thrown off your [pc.feet] as an explosion rocks the <i>Phoenix</i>. You grab the headrest, trying to steady yourself as the ship shudders and rocks, the shields barely holding.");

		output("\n\n<i>“I guess not! We have to hurry!”</i>");

		flags["FALL OF THE PHOENIX SHIELDS STATUS"] = 2;
	}

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function phoenixCrewQuarters():void
{
	clearOutput();
	author("Savin");
	phoenixLocationSetter();
	
	if (flags["FALL OF THE PHOENIX STATUS"] == 1 && flags["SAENDRA AFFECTION"] != undefined)
	{
		output("Saendra’s cabin is more like a university girl’s dorm than a ship captain’s room. The bed is sloppily made and covered with several books, magazines, and piles of clothes. There’s a locker in one corner, hanging open to show a picture of Saendra with her arm around");
		if (flags["RESCUE KIRO FROM BLUEBALLS"] == 1) output(" Kiro’s");
		else output(" a kui-tan girl’s");
		output(" shoulders, sticking their tongues out at the camera. With the locker open, you’re also treated to a good look at several open drawers full of Saendra’s bright pink panties and bras. A life-sized latex horse dildo is peeking its flared head out from under the bed.");
	}
	else
	{
		output("The captain’s quarters look more like a university girl’s dorm than a ship captain’s room. The bed is sloppily made and covered with several books, magazines, and clothes. There’s a locker in one corner, hanging open to show a picture of a cat-eared girl with her arm around a kui-tan’s shoulders, sticking their tongues out at the camera. With the locker open, you’re also treated to a good look at several open drawers full of panties and bras, the latter clearly made for a well-endowed girl.");

		if (flags["FALL OF THE PHOENIX FLUX COUPLING STATUS"] == 2) output( "One of the wall panels has been yanked off, giving you access to the wiring inside the bulkhead. A floppy, pink horsecock dildo is sticking out of it, blackened by electricity.");

		if (flags["FALL OF THE PHOENIX FLUX COUPLING STATUS"] != 2 && flags["FALL OF THE PHOENIX SHIELDS STATUS"] == 1) addButton(0, "Flux Coupl.", phoenixCrewQuartersFluxCouple);
	}
}

public function phoenixCrewQuartersFluxCouple():void
{
	clearOutput();
	author("Savin");

	// {if PC has tried to use the shields, does not have the Horse Dildo}
	if (flags["FALL OF THE PHOENIX DILDO GET"] == 0 || flags["FALL OF THE PHOENIX DILDO GET"] == undefined)
	{
		output("At the A.I.’s behest, you yank off one of the wall panels, giving yourself access to the wiring inside. ");

		output("\n\n<i>“Okay. Just reach inside and pull out the RED wires. Not the GREEN wires, and DEFINITELY not the BLUE wires.”</i>");

		output("\n\n<i>“What do the blue ones do?”</i>");

		output("\n\n<i>“That’s life support for the rest of the ship. The, uh, parts that still have it.”</i>");

		output("\n\nAll right. Simple enough. You reach a hand into the panel... and are immediately rewarded with a nasty shock! OUCH! You recoil, wagging your shocked hand around until it stops hurting. Ow. You’ll need something else to rewire the ship.");

		flags["FALL OF THE PHOENIX FLUX COUPLING STATUS"] = 1;
	}
	else
	{
		output("This is the worst idea, and the best idea. You take out the life-sized horsecock and poke it into the exposed wiring, angling the big, flared head toward the clump of red wires deep inside. With a little finesse, you’re able to wrangle the massive plastic dong into the compartment and batter the red wires down, tearing them out with what the dildo’s manufacturer probably labeled as ‘flare-fisting force’ or some such. Either way, you hear the RIIIIP of wires coming out, and the lights flicker off overhead.");

		output("\n\n<i>“That’ll do it!”</i> the A.I. cheers in what is clearly a verbal fist-pump as you batter down some of the secondary systems. <i>“Now let’s try the shields again!”</i>");
		flags["FALL OF THE PHOENIX FLUX COUPLING STATUS"] = 2;
	}

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function phoenixCargo():Boolean
{
	clearOutput();
	author("Savin");
	phoenixLocationSetter();

	if (flags["FALL OF THE PHOENIX STATUS"] == 1 && flags["SAENDRA AFFECTION"] != undefined)
	{
		output("The cargo bay is surprisingly large for the <i>Phoenix</i>’s size, a wide open berth in two floors that could easily hold several dozen pallets of goods. A metal walkway leads down from the crew decks down to the cargo bay proper; an elevator leads down from there to Engineering. The walls are still pock-marked with bullet holes and carbon scorches from laser shots, though some of them have been patched or painted over.");
		return false;
	}
	else
	{
		if (flags["FALL OF THE PHOENIX SHIELDS STATUS"] != 2)
		{
			output("The door is sealed, though beyond it, you can hear the sounds of gunfire.");
			if (flags["FALL OF THE PHOENIX TALKED TO AI"] == 1) output(" The A.I.");
			else output(" A voice");
			output(" announces, <i>“Cargo doors are sealed while life forms are still inside and atmosphere is drained in the recreation room.”</i>");

			output("\n\nShit.");
			clearMenu();
			addButton(0, "Next", move, "PHOENIX RECROOM");
			return true;
		}
		else if (flags["FALL OF THE PHOENIX DEFEATED PIRATES"] == undefined)
		{
			showBust("VOIDPIRATE", "VOIDPIRATE", "VOIDPIRATE");
			
			output("<i>“Okay, we’re in. Atmosphere and pressure restoring in the damaged sections as we speak. I’m showing several life-signs in the cargo bay: it looks like they drilled in via assault pod. Captain en Illya’s still alive, I think. Be ready for a fight.”</i>");

			output("\n\nYou nod, and kick open the cargo bay door. You find yourself overlooking the bay proper, walking out into a catwalk over the bay, two stairs leading downwards along the sides. Below, you can see several men in black, skintight spacesuits taking cover behind crates and barrels, trading gunfire with a lone figure sitting in a pool of her own blood, firing a heavy-looking Hammer pistol one-handed as she clutches her side. ");

			output("\n\n<i>“Saendra!”</i> the A.I. gasps, seeing what you assume to be the captain badly wounded. <i>“Quick, we have to help her!”</i>");

			output("\n\nDoesn’t look like you have a choice. Her sudden outburst has drawn the attention of the pirates, who look up in shock to see you, leveling their weapons upward. Uh-oh. ");

			output("\n\nYou dive into cover just in time as a volley of automatic weapons fire pummels into the catwalk, chewing through the thin metal until it looks like Swiss cheese. Unfortunately for you, the catwalk buckles under the hail of lead, and you have just enough time to scream before you go plummeting to the deck, smashing into the ground. Conveniently, you land in cover behind some chest-high crates.");

			output("\n\n<i>“Who the hell is that?”</i> one of the pirates shouts, slamming a new magazine into a machine-pistol.");

			output("\n\n<i>“I don’t fucking know! Just shoot ‘em!”</i>");

			clearMenu();
			addButton(0, "Fight", startPhoenixPirateFight);
			return true;
		}
		else
		{
			output("The <i>Phoenix</i>’s cargo bay is spacious for its size, full of crates and barrels and other cargo. Several dead pirates are splattered on the deck, while others have been knocked out in the battle. Red emergency lights are active, now that the power is semi-out in secondary systems, and the floor is lousy with blood and shell-casings.");
			
			if (flags["FALL OF THE PHOENIX ENGINEERING STATUS"] != 1) output("\n\nSaendra is slumped against the wall, using a first-aid kit to patch the hole up in her side.");
			return false;
		}
	}
}

// Not starting it directly so I can inject a status effect onto the player to handle the help from Sae
public function startPhoenixPirateFight():void
{
	saendra.long = "Saendra lithely snakes out of cover from time to time, taking potshots at anything and everything she can sight quickly enough before ducking back to safety.";
	saendra.customDodge = "Saen quickly ducks out of the way of the attack.";
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors	([pc, saendra]);
	CombatManager.setHostileActors	([new PhoenixPirates(), new PhoenixPirates(), new PhoenixPirates()]);
	CombatManager.victoryScene(victoryOverPhoenixPirates);
	CombatManager.lossScene(loseToPhoenixPirates);
	CombatManager.displayLocation("VOID GANG");
	CombatManager.encounterText("A gang of unruly, vicious-looking space toughs, these Black Void pirates are armed to the teeth with machine-pistols, rifles, shotguns, and everything in between. Ausar, humans, kaithrit girls, and even a Centaurin packing a gatling-laser make up their ranks. They’re all wearing skintight black space suits and peppering the cover around you with bullets.");
	
	CombatManager.beginCombat();
}

public function loseToPhoenixPirates():void 
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	clearOutput();
	showBust("MIRIAN", "VOIDPIRATE", "VOIDPIRATE");
	showName("DEFEAT:\nVOID GANG");
	author("Savin");
	
	// Not a Bad End: Saendra sold into slavery!
	flags["FALL OF THE PHOENIX STATUS"] = -1;
	flags["FALL OF THE PHOENIX DEFEATED PIRATES"] = -1;

	output("You never saw the blow coming. Under a hail of gunfire, you dive into cover, only to find a pair of pirates with stun batons leaping at you. Though you throw one of them off, the other connects, shocking you; with a scream, you crumple to the ground, only to be shocked again and again, until blackness takes you...");

	output("\n\nYou awaken with your hands bound, a pair of men dragging you along the corridor of a ship - not the <i>Phoenix</i>, but a much larger vessel, filled with crewmen watching you. A glance behind you shows that the woman you were trying to rescue is being dragged along as well, her head hung low and tails tucked defensively between her legs. She looks up, catches your eye, and looks sharply away. Shame? Fear? You’re not sure.");

	output("\n\nA door slides open ahead of you, and you find yourself being brought before a gaudy combination of throne and captain’s chair, a great black seat surrounded by digital readouts and flanked by crew stations. In it sits a tall, handsome woman, clad in black leather and possessed of black hair streaming down just past her shoulders. One of her cheeks is covered with a rose-vine tattoo: the left, with savage looking scars leading up to an eye patch. ");

	output("\n\n<i>“So, this is our White Knight?”</i> she says, her voice cold and callous. <i>“It’s a dangerous galaxy, captain. You should learn better than to interfere where you’re not wanted.”</i>");

	output("\n\nTo illustrate her point, one of the mooks holding you strikes you across the face. You see stars and reel from the impact.");

	output("\n\nShe clicks her tongue and stands, taking a step down from her throne toward you. She looks from you to the other captain. <i>“Saendra. I’m disappointed in you. After all we’ve done for you, this is how you repay us? Father will be </i>very<i> unhappy.”</i> The pirate reaches down and grabs one of Saendra’s tits, reaching right into her shirt. The captain recoils, struggling against the men holding her down... until the pirate’s hand comes back with a small data chit, still stuck to a piece of tape. ");

	output("\n\n<i>“At least you managed to do something right,”</i> the pirate sighs, looking over the data chit. Satisfied, she looks to one of the guards and says, <i>“Take Saendra down to the holding cells. Do something about those injuries and process her. Maybe Carver can get some use out of her.”</i>");

	output("\n\nThe guard nods, and drags her away through a side door. The pirate captain then turns to you,");
	if (pc.tallness > 80) output(" taking a knee and"); 
	output(" looking you in the eye. <i>“Unfortunate that you stuck your nose in. Still, we’re not looking for slaves.”</i> She looks up to one of the other guards, <i>“Strip "+ pc.mf("his","her") +" credits and equipment, and throw "+ pc.mf("him","her") +" back on "+ pc.mf("his","her") +" ship.”</i>");

	output("\n\n<i>“Aye, captain,”</i> the guard says, just before you get a rifle butt in the back of the head.");

	processTime(60 * (4 + rand(4)));
	output("\n\n<b>Hours pass...</b>");

	// PC loses 75% of credits + all equipment save underclothes
	pc.credits = Math.floor(pc.credits * 0.25);
	pc.removeEquipment("shield");
	pc.removeEquipment("accessory");
	pc.removeEquipment("meleeWeapon");
	pc.meleeWeapon = new Rock();
	pc.removeEquipment("rangedWeapon");
	pc.rangedWeapon = new Rock();
	pc.removeClothes("armor");
	pc.clearInventory();

	currentLocation = "SHIP INTERIOR";

	output("\n\nYou wake up aboard your ship, crumpled on the deck of your airlock with a massive headache. You look through the window, only to see empty space. The pirate ship is gone, as is the <i>Phoenix</i>. Whoever that captain was, or the pirates, they seem to be gone now.");

	output("\n\nYou sigh, rubbing your head and stumbling back to your bridge. Damn it.\n\n");

	CombatManager.genericLoss();
}

public function victoryOverPhoenixPirates():void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	clearOutput();
	showBust(saendraBustDisplay(),"VALERIA");
	showName("\nVICTORY!");
	author("Savin");

	output("The last pirate drops under your combined assault, and the din of gunfire dies down. You blink hard, your ears ringing from so much fire in such tight quarters. Checking to make sure the pirates are down for the count, you lower your");
	if (pc.hasEquippedWeapon()) output(" weapon");
	else output(" fists")
	output(" and make your way over to the captain, who’s slumped down to the floor, clutching at her side.");

	output("\n\nWhen you step up to her, though, you’re greeted with a face-full of Hammer pistol. Over the iron sights, you finally get a good look at the captain herself: she’s tall and well-built, with hips and breasts that strain against the confines of her torn-up jeans and vest. Her long, red hair sports a pair of cute little cat-ears poking up from the top of her head, and a pair of large, fluffy tails are splayed out behind her, curled under one of her legs. ");

	output("\n\n<i>“Who are...”</i> she starts to say, but stops mid-sentence, grimacing in pain. You can see blood leaking around her fingers. ");

	output("\n\n<i>“[pc.name],”</i> you say, batting her handgun away. She lowers it without much resistance, though prying her hand away from her side is another matter... and her arm, too. You grimace at the sight.");

	output("\n\n<i>“Saendra, are you alright?”</i> your A.I. companion asks, her fairy-avatar reforming on a small platform near the door behind the captain.");

	output("\n\nThe captain, Saendra, grunts. <i>“Not really. Valeria, help [pc.name] boot the engines. I... I gotta get to the cockpit. Get us out of here.”</i>");

	output("\n\n<i>“That doesn’t sound like a good idea,”</i> you say, looking at the mangled mess of her arm and side. ");

	output("\n\nShe actually flashes you a grin, letting you see her face clearly for the first time: fierce, feminine, beautiful. Her green, slitted cat-eyes shine bright. <i>“No choice, hero...”</i> she says, struggling to her feet. <i>“and thanks. Wouldn’t have made it through that without you.”</i>");

	output("\n\nYou help her up, and grab the first-aid kit from the wall nearby. Before you can do anything with it, though, another explosion rocks the hull as the pirate frigate opens up on the <i>Phoenix</i> again. You stumble as the deck jolts around, only spurred to action when the A.I., Valeria, shouts, <i>“We have to go! The ship can’t take much more, captain! [pc.name], come down to the engineering deck. We need to get the engines restarted if we’re going to make it out of here!”</i>\n\n");

	flags["FALL OF THE PHOENIX DEFEATED PIRATES"] = 1;

	CombatManager.genericVictory();
}

public function phoenixEngineering():void
{
	clearOutput();
	author("Savin");
	showBust("VALERIA");
	phoenixLocationSetter();
	
	if (flags["FALL OF THE PHOENIX ENGINEERING STATUS"] == 1)
	{
		output("The Engineering deck is largely dominated by a huge engine, currently idling and humming lowly. An instance of Valeria’s avatar is sitting near the engines, carefully keeping an eye on several flickering readouts and sensor reports. A loading ramp is opposite the engines, with a heavy cargo lifter parked nearby, as well as a pair of hover bikes. ");
		if (flags["FALL OF THE PHOENIX TAKEN SHIELD"] == undefined) addButton(0, "Cargo", phoenixEngineeringCargo);
	}
	else
	{
		output("The <i>Phoenix</i>’s engineering deck is massive, running more than half the length of the ship. It apparently also serves as a flight deck and garage, as there’s a pair of hoverbikes and a cargo loader parked inside. More importantly, though, you can see the engines sitting idle, knocked offline by the first devastating volley of fire. ");

		output("\n\nNot far from the elevator shaft, a small holo-console is still on emergency power, showing Valeria’s holo-avatar.");

		// [Valeria] [Engines] [Cargo]
		if (flags["FALL OF THE PHOENIX ENGINE STATUS"] == undefined && flags["FALL OF THE PHOENIX TALKED TO AI IN ENGINEERING"] == undefined) addButton(0, "Valeria", phoenixEngineeringValeria);
		if (flags["FALL OF THE PHOENIX ENGINEERING STATUS"] != 1) addButton(1, "Engines", phoenixEngineeringEngines);
		if (flags["FALL OF THE PHOENIX TAKEN SHIELD"] == undefined) addButton(5, "Cargo", phoenixEngineeringCargo);
	}
}

public function phoenixEngineeringCargo():void
{
	clearOutput();
	author("Savin");
	output("You poke your head into the cargo lifter to see what’s inside. On the lifter, you find several crates loaded up and ready for delivery, though one has been cracked open. Inside, you can see several shield belts on a rack. Probably meant for one of the private security groups on the Rush.");
	if (pc.isMischievous()) output(" They wouldn’t miss ONE, would they?");

	// [Take] [Leave]
	clearMenu();
	addButton(0, "Take", phoenixEngineeringTakeShield);
	addButton(1, "Leave", mainGameMenu);
}

public function phoenixEngineeringTakeShield():void
{
	clearOutput();
	author("Savin");
	showValeria();
	output("You pick one of the shield belts off the rack. A quick glance tells you it’s a pretty high-end JoyCo model, better than most pioneers can get their hands on. Nice!");

	output("\n\n<i>“Heeeey!”</i> Valeria cries from the console. <i>“That’s not yours!”</i>");

	output("\n\n<i>“Deal with it,”</i> you say, stowing the belt. She harrumphs, but locked in virtual space as she is, there’s not much she can do about it.\n\n");

	flags["FALL OF THE PHOENIX TAKEN SHIELD"] = 1;

	var foundLootItems:Array = new Array();
	foundLootItems.push(new JoyCoPremiumShield());

	itemScreen = mainGameMenu;
	lootScreen = phoenixEngineeringTakeShieldCheck;
	useItemFunction = mainGameMenu;
	itemCollect(foundLootItems);
}
public function phoenixEngineeringTakeShieldCheck():void
{
	if(pc.shield is JoyCoPremiumShield || pc.hasItemByClass(JoyCoPremiumShield))
	{
		mainGameMenu();
		return;
	}
	
	clearOutput();
	showValeria();
	output("Not having enough space for it, you figure you put it back where you found it.");

	output("\n\n“<i>That’s more like it!”</i> Valeria harrumphs.");

	output("\n\nYou shrug your shoulders.");

	flags["FALL OF THE PHOENIX TAKEN SHIELD"] = undefined;
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function phoenixEngineeringValeria():void
{
	clearOutput();
	author("Savin");
	showValeria();
	output("<i>“Alright, what do I need to do?”</i> you ask, looking towards the inactive engine.");

	output("\n\n<i>“The engines are offline. We need to quick-start them, but it’s not easy on these older models. You’ll need to manually control power output - too much, too quickly, and I’ll have to boot them down again. Try to find the sweet spot. I’ll walk you through it once you get to the engine controls.”</i>");

	flags["FALL OF THE PHOENIX TALKED TO AI IN ENGINEERING"] = 1;
	//[Alright] [Flirt] [Captain]
	clearMenu();
	addButton(0, "Alright", mainGameMenu);
	addButton(1, "Flirt", phoenixEngineeringValeriaFlirt);
	addButton(2, "Captain", phoenixEngineeringValeriaCaptain);
}

public function phoenixEngineeringValeriaCaptain():void
{
	clearOutput();
	author("Savin");
	showValeria();
	output("<i>“So, you think Captain Saendra will be alright?”</i> you say. Good time for small talk, right?");

	output("\n\nValeria stares at you a moment, biting her holographic lip. <i>“I’ve been with her since she was little... I hope she makes it through this. But her arm...”</i>");

	output("\n\nYeah. That looked bad.");

	output("\n\n<i>“Anyway... thank you for helping, [pc.name]. We owe you... If we get out of here, that is.”</i>");
	removeButton(2);
}

public function phoenixEngineeringValeriaFlirt():void
{
	clearOutput();
	author("Savin");
	showValeria();
	output("<i>“So, what’s a cute sprite like you doing here, anyway?”</i>");

	output("\n\nAmusingly, Valeria’s avatar flushes a darker shade of blue. <i>“I, uh... well, you know, I’m just a little companion A.I.,”</i> she says, shuffling her feet on the holo-platform. <i>“Nothing special. I’m not even a modern version number.”</i>");

	removeButton(1);
}

public var phoenixEngineButtons:Array = [0, 0, 0, 0, 0];

public function phoenixEngineeringEngines(doOutput:Boolean = true):void
{
	if (doOutput)
	{
		clearOutput();
		author("Savin");
		showValeria();
		output("You approach the engines and dust off the manual control panel. The power reading is flashing a great big ‘0%.’");

		output("\n\nFrom the holo-platform near the elevator, Valeria says, <i>“Okay, I’m spooling up the engines now. The power converters are on manual reset, however. You’ll need to guide the power into the sweet spot </i>without<i> going too far over, or I’ll have to activate emergency shutdown, and you’ll have to start over. <b>We need to hit 45%.</b> Please hurry, [pc.name]: our shields won’t hold for long.”</i>");

		output("\n\nYou nod, and watch the emergency power flood into the engines in one last, desperate attempt to spin them up. Power readouts flash onto the screen, and your fingers go to work...");
		
		if (easy) output("\n\nYou can barely make out three letters scratched into the surface of the control panels casing; ‘C-A-C’.");
	}

	clearMenu();
	phoenixEngineButtons = [0, 0, 0, 0, 0];

	addButton(0, "Reactor Feed", phoenixToggleEngine, 0);
	userInterface.setButtonBlue(0);

	addButton(1, "Ion Chamber", phoenixToggleEngine, 1);
	userInterface.setButtonBlue(1);

	addButton(2, "Neutron Accel.", phoenixToggleEngine, 2);
	userInterface.setButtonBlue(2);

	addButton(3, "Particle Inj.", phoenixToggleEngine, 3);
	userInterface.setButtonBlue(3);

	addButton(4, "Prefire Chamber", phoenixToggleEngine, 4);
	userInterface.setButtonBlue(4);
}

public function phoenixToggleEngine(slot:int):void
{
	if (phoenixEngineButtons[slot] == 0)
	{
		phoenixEngineButtons[slot] = 1;
		userInterface.setButtonPurple(slot);
	}
	else
	{
		phoenixEngineButtons[slot] = 0;
		userInterface.setButtonBlue(slot);
	}

	var powah:int = calculateDaPOWAH();
	var sweetSpot:int = 45;
	var ohFuckValue:int = 48;
	
	clearOutput();
	output("The power reading is flashing ‘" + powah + "%’.");
	
	if (powah == sweetSpot) phoenixYOUDIDITCHAMP();
	if (powah >= ohFuckValue) phoenixTRYAGAINCHAMP();
}

public function calculateDaPOWAH():int
{
	var powahs:Array = [33, 22, 7, 40, 16]

	var powah:int = 0;
	
	for (var i:int = 0; i < powahs.length; i++)
	{
		if (phoenixEngineButtons[i] == 1) powah += powahs[i];
	}
	
	return powah;
}

public function phoenixTRYAGAINCHAMP():void
{
	if (flags["FALL OF THE PHOENIX FAILED ENGINEERING PUZZLE"] == undefined) flags["FALL OF THE PHOENIX FAILED ENGINEERING PUZZLE"] = 1;
	else flags["FALL OF THE PHOENIX FAILED ENGINEERING PUZZLE"]++;
	
	author("Savin");
	showValeria();
	output("\n\n<i>“It’s too much! Engines going critical!”</i> Valeria shouts, bringing up several readouts around her avatar, working feverishly. <i>“Emergency shutdown protocols initiated... done!”</i>");

	output("\n\nIn front of you, the engines spin back down. A moment later, they’re silent. ");

	output("\n\n<i>“Okay, okay... no pressure. Let’s try this again. <b>45%. You can do it.</b>”</i>");
	
	if (easy)
	{
		if (flags["FALL OF THE PHOENIX FAILED ENGINEERING PUZZLE"] == 1) output("\n\n‘C-A-C’? There’s only three controls that have that feature those letters prominently....");
		else output("\n\nPerhaps the Ion <b>C</b>hamber, the Neutron <b>A</b>ccelerator and the Prefire <b>C</b>hamber?");
	}

	phoenixEngineeringEngines(false);
}

public function phoenixYOUDIDITCHAMP():void
{
	author("Savin");
	showValeria();
	output("\n\nWith a sudden roar, the engines come to life, thrumming deafeningly. You step back as heat rolls off them, staying just long enough to see that the power is holding steady. Finally, the lights flicker back on, and the shaking of the deck abates as the shields are reinforced by the added power. Looks like you’ve bought the <i>Phoenix</i> some time once again.");

	output("\n\n<i>“I think we’re alright,”</i> Valeria says, barely audible over the roar of the engines. <i>“Ah, the captain wants you. Head back up to the cockpit, [pc.name]. We need to get out of here before the shields buckle again!”</i>");
	flags["FALL OF THE PHOENIX ENGINEERING STATUS"] = 1;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
