import classes.ShittyShips.Sidewinder;
//Olympia Challenges the PC
//Add a [Hijack] button the Sidewinder’s bridge once the LDC/SH are dealt with.

public function olympiaRecruited():Boolean
{
	return (flags["OLYMPIA_RECRUITED"] != undefined);
}
public function olympiaIsCrew():Boolean
{
	return(olympiaRecruited() && flags["OLYMPIA_ONBOARD"] != undefined);
}
public function pirateLordsDefeated():Boolean
{
	return (9999 == 0);
}
public function showOlympia(nude:Boolean = false):void
{
	showName("\nOLYMPIA");
	if(olympia.armor is KhansLabCoat) showBust("OLYMPIA" + (nude ? "_NUDE":""));
	else if(olympia.armor is EmptySlot) showBust("OLYMPIA_NUDE");
	else showBust("OLYMPIA" + (nude ? "_NUDE":"_STEELE"));
}

// Hotfix check
// Storage extra stuff
public function sidewinderCargoholdExtras():Boolean
{
	if(shits["SHIP"] is Sidewinder)
	{
		if(flags["ZHENG_SHI_PROBED"] == undefined) return true;
		if(flags["ZHENG_SHI_JUMPERSPACESUIT"] == undefined || flags["ZHENG_SHI_GALOMAX"] == undefined) return true;
		if(flags["ZHENG_SHI_PROBE_RECLAIMED"] == undefined) return true;
	}
	return false;
}
public function sidewinderCargoholdExtrasBonus(btnSlot:int = 0):void
{
	output("\n\nYou can access the ship’s cargohold if you like.");
	
	addButton(btnSlot, "Cargohold", sidewinderCargoholdExtrasStuff, undefined, "Cargohold", "Access the ship’s cargohold.");
}
public function sidewinderCargoholdExtrasStuff(response:String = "menu"):void
{
	clearOutput();
	clearMenu();
	switch(response)
	{
		case "menu":
			showName("PORT\nCARGOHOLD");
			output("You access the ship’s cargohold. The hold is full of spare parts for various systems onboard the ship. Cables, tools, and racks of armor plate patches are organized neatly against the back wall.");
			var btnSlot:Number = 0;
			// Probe
			if(flags["ZHENG_SHI_PROBED"] == undefined || flags["ZHENG_SHI_PROBE_RECLAIMED"] == undefined)
			{
				if(flags["ZHENG_SHI_PROBED"] == undefined)
				{
					output("\n\nTucked into the corner is your father’s probe. It’s scuffed to all hell and scored from laser blasts where someone used it for target practice. The keypad is intact, though.");
					addButton(btnSlot++, "Probe", sidewinderCargoholdExtrasStuff, "coords", "Probe Data", "Claim the probe’s coordinates.");
				}
				else if(flags["ZHENG_SHI_PROBE_RECLAIMED"] == undefined)
				{
					output("\n\nThe probe is right where you left it: propped in the corner and pockmarked by dozens of laser blasts from its time with careless pirate crews. <b>You already have the coordinates, so it has nothing more to offer you.</b>");
					addButton(btnSlot++, "Sell Probe", sidewinderCargoholdExtrasStuff, "reclaim", "Reclaim Probe", "Reclaim the probe for Steele Tech.");
				}
			}
			// Jumper suit
			if(flags["ZHENG_SHI_JUMPERSPACESUIT"] == undefined) 
			{
				output("\n\nA singular vacuum suit in the Jumper’s signature style hangs from a hook on the wall.");
				addButton(btnSlot++, "J.Spacesuit", takeZhengShiJumperSpacesuit);
			}
			// Galomax
			if(flags["ZHENG_SHI_GALOMAX"] == undefined)
			{
				output("\n\nYou spot an expensive looking case on a fold-out table. It’s labeled as Galomax.");
				addButton(btnSlot++, "Galomax", takeZhengShiGalomax);
			}
			addButton(14, "Back", shipStorageMenuRoot);
			break;
		case "coords":
			output("The probe flickers to life when you approach, and when you make contact, <b>a new set of coordinates download onto your Codex.</b>");
			output("\n\nEat that, [rival.name]!");
			
			flags["ZHENG_SHI_PROBED"] = 1;
			
			addButton(0, "Next", sidewinderCargoholdExtrasStuff);
			break;
		case "reclaim":
			// 9999 - Need reclaimation scene!
			output("Steele Tech salvage isn’t able to retrieve the probe at the moment, so you’ll have to leave it for the time being.");
			addButton(0, "Next", sidewinderCargoholdExtrasStuff);
			/*
			output("");
			output("\n\n");
			
			addButton(0, "Next", sidewinderCargoholdExtrasStuff, "probe reclaimed");
			*/
			break;
		case "probe reclaimed":
			output("");
			output("\n\n");
			
			processTime(35);
			
			pc.credits += 0;
			flags["ZHENG_SHI_PROBE_RECLAIMED"] = 1;
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
	output("\n\n");
}

public function sideWinderCabinBonus():Boolean
{
	if(flags["SHOCK_HOPPER_DEFEATED"] != undefined) addButton(0,"Hijack",hijackThisShippyShopPrompt,undefined,"Hijack","Take control of the <i>Sidewinder</i>. With the L.D.C. and Shock Hopper dealt with, there’s nobody around to stop you from making this marvel of pirate engineering your own." + (!pirateLordsDefeated() ? " Of course, the pirate lords that are left surely won’t appreciate this.":""));
	return false;
}
public function hijackThisShippyShopPrompt():void
{
	clearOutput();
	clearMenu();
	
	if(flags["ZHENG_SHI_PROBED"] == undefined)
	{
		output("Before you do this, shouldn’t you make sure you’ve obtained your father’s probe first?");
		output("\n\n");
		
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	output("You should make certain you’ve gotten everything you need on the ship or station before attempting to do this. Also note that you can only command one ship at a time, so if you successfully take over this ship, your current ship will be left abandoned.");
	output("\n\nAre you sure you want to hijack the <i>Sidewinder</i>?");
	output("\n\n");
	
	addButton(0, "Yes", hijackThisShippyShop);
	addButton(1, "Reconsider", mainGameMenu);
}
public function hijackThisShippyShop():void
{
	clearOutput();
	author("Savin");
	showOlympia();
	//[Hijack]
	//TT: Take control of the <i>Sidewinder</i>. With the L.D.C. and Shock Hopper dealt with, there’s nobody around to stop you from making this marvel of pirate engineering your own. {Of course, the pirate lords that are left surely won’t appreciate this.}

	output("You approach the helm, watching with interest as the dozens of glowing orange hardlight displays crackle to life at your touch... along with a pillar of simulated equine dick that materializes straight from the captain’s seat. These Jumpers sure have a handle on all the most modern tech... and toys, too. You smirk despite yourself as the holographic dong flops from side to side, like its eagerly awaiting somebody to come and take the stick, such as it is.");
	output("\n\nDespite how many displays and stations surround the bridge, it seems like all the flight controls can be controlled from the captain’s chair. Good thing, since you’ve been flying solo through this place. Now you’ll get to literally fly straight out of here.");
	output("\n\nYou ");
	if(pc.isBimbo()) 
	{
		output("drop trou and mount the hardlight dildo, nestling onto the big shaft of hardlight meat as you take the controls. Oooh, that tingles!");
		if(pc.hasVagina()) pc.cuntChange(0,250);
		pc.buttChange(250);
		pc.lust(10);
	}
	//else: 
	else output("deactivate the hardlight shaft - for now, at least - and sit yourself in the captain’s chair. The controls react to you in an instant, brightening with golden light as key panels snap into place on either side of you.");
	output(" The codes that the L.D.C. gave you seem to be working: a few moments later, and you have total access.");

	output("\n\nBefore you can quite decipher how to actually make the ship <i>go</i>, though, you hear the hatch you came in through slide back open, and a heavy pair of footfalls falling on the deck. You jump up just in time to hear a shotgun racking, and see the barrel being pointed square at your face.");
	output("\n\nOlympia, the draconic gynoid from Dr. Teyaal’s office, is staring you down from behind the sights with a dark look in her eyes. <i>“You aren’t trying to steal my ship, are you?”</i> she growls. <i>“The <b>one</b> thing I asked you <b>not</b> to do was interfere with my work.”</i>");
	output("\n\n<i>“I don’t care if you slaughter every pirate on this base. But you leave the </i>Sidewinder<i> to me. This ship is all I have.”</i>");
	processTime(3);
	clearMenu();
	addButton(14,"Leave",leaveDaSidewinder,undefined,"Leave","Okay, okay... you’re leaving.");
	addButton(0,"Diplomacy",diplomacyDatFuckbot,undefined,"Diplomacy","Olympia’s loyal to the ship, not the pirates, huh? This doesn’t have to be a fight then...");
	addButton(1,"Disarm Her",disarmOlympia,undefined,"Disarm Her","She’s a sexbot. Shouldn’t be too hard to disarm, right?");
}

//Disarm Her
//TT: She’s a sexbot. Shouldn’t be too hard to disarm, right?
public function disarmOlympia():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	//PC must pass a 66% Reflexes check. On success...
	if(pc.RQ() >= 66 || pc.hasPerk("Disarming Shot"))
	{
		output("The moment you see her finger sliding into the trigger guard, your instincts kick into overdrive. You grab the front of the barrel and slam it backwards, cracking Olympia in the collar bone with the stock and wrenching the gun out of her her. You spin it back around to face its owner.");
		output("\n\n<i>“Fuck you,”</i> Olympia groans, staggering back. Her russet lips curl into a snarl and she bares her claws at you. <i>“You’d better shoot, because I will not surrender this ship without a fight. The pirates took everything from me... everything but my work. I can’t lose this too.”</i>");
		output("\n\nWell then, it looks like you have a choice.");
		processTime(3);
		//[Recruit Her] [Shoot Her]
		clearMenu();
		addButton(0,"Recruit Her",recruitOlympia,undefined,"Recruit Her","Olympia’s loyal to the ship, not the pirates, huh? This doesn’t have to be a fight then...");
		addButton(1,"Shoot Her",shootOlympiaYouMonster,undefined,"Shoot Her","Bye, bitch.");
	}
	//PC fails the Reflexes check AND has shields up:
	else if(pc.shields() > 0)
	{
		output("The moment you see her finger sliding into the trigger guard, your instincts kick into overdrive. You reach for her gun, but just a second too late: Olympia pulls the trigger, sending a volley of buckshot slamming into your shields, hard enough to blow you backwards over the command chair.");
		output("\n\n<i>“I don’t think so,”</i> she growls, advancing on you. <i>“Leave now.”</i>");
		pc.shields(-50);
		clearMenu();
		//[Leave] [Diplomacy]
		//As per above options
		addButton(0,"Leave",leaveDaSidewinder,undefined,"Leave","Okay, okay... you’re leaving.");
		addButton(1,"Diplomacy",diplomacyDatFuckbot,undefined,"Diplomacy","Olympia’s loyal to the ship, not the pirates, huh? This doesn’t have to be a fight then...");
	}
	//PC fails the Reflexes check, no Shields:
	else
	{
		output("The moment you see her finger sliding into the trigger guard, your instincts kick into overdrive. You reach for her gun, but just a second too late: Olympia pulls the trigger, blasting the floor between you and sending sparks into your eyes. You duck back, waving your hands. Fuck, okay, you get it!");
		output("\n\n<i>“I don’t think so,”</i> she growls, advancing on you. <i>“Leave now.”</i>");
		//[Leave] [Diplomacy]
		//As per above options
		addButton(0,"Leave",leaveDaSidewinder,undefined,"Leave","Okay, okay... you’re leaving.");
		addButton(1,"Diplomacy",diplomacyDatFuckbot,undefined,"Diplomacy","Olympia’s loyal to the ship, not the pirates, huh? This doesn’t have to be a fight then...");
	}
}

//[Shoot Her]
//Bye, bitch.
//Give the PC a Stormbull Shotgun
public function shootOlympiaYouMonster():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("You pull the trigger, blowing the uppity gynoid’s cortex across the back wall.");
	output("\n\nAlright, time to take control. You resume your seat and access the controls, commanding the <i>Sidewinder</i> to disengage its docking clamps and crank on the engines. You feel a thrum beneath the deck as systems boot up and get ready for launch.");

	//Hasn’t defeated all the pirate lords:
	if(!pirateLordsDefeated())
	{
		output("\n\nYou’ve barely finished your pre-flight check when you hear a klaxon blaring through the station. Dozens of pirate troops pour out onto the walkways all around the <i>Sidewinder</i>, slamming mags into rifles and machine pistols. There’s a pounding on the exterior hatch, and you can hear rage-filled screaming over the intercom before the goons start firing. Of course, your new ship’s shields are already online and more than capable of negating any volume of ground fire, leaving you able to calmly turn the corvette around and aim its prow at the bay doors... which, of course, are quickly closing.");
		output("\n\nTime to see what this baby can do. You slam the stick forward and kick the engines into overdrive, sending the <i>Sidewinder</i> hurtling forward towards the narrowing vector of your escape. The deck shudders as you hit maximum velocity, thundering through the launch bay and out into the stars, squeaking between the doors amidst proximity warnings screaming - not even close, you figure. Three meters is plenty of clearance!");
		output("\n\nYou dive down, avoiding the station’s point defenses and the hails of mag cannon slugs they’re throwing at your tailpipe until you’ve disappeared into the asteroid belt surrounding Zheng Shi.");
		output("\n\nWell, <b>the locals probably won’t be too happy with you now...</b> But hey, fuck pirates: you’ve got the most kickass raider ship in the galaxy at your command now. Time to see what this baby can really do.");
	}
	//Has defeated the pirate lords:
	else
	{
		output("\n\nYou’re the top dog of Zheng Shi now, which means this ship is yours. You finish the pre-flight check and spool the engines up to full power. Dock workers go running for cover, cowering behind reinforced panels and heavy machinery as the <i>Sidewinder</i>’s experimental engines prepare for their maiden voyage.");
		output("\n\nWell, no sense keeping them waiting. You punch it, sending your new flagship hurtling through the launch bay and out into the stars. She handles like an angel: the controls are tuned to perfection, easily enabling you to start spinning the ship in circles and cartwheeling around asteroids. What a rush!");
		output("\n\nNow that you’ve got the galaxy’s latest and greatest raider at your fingers, there’s nothing beyond your reach. Time to see what this baby can do!");
	}
	output("\n\n");
	pc.addHard(15);
	flags["OLYMPIA_KILLED"] = 1;
	flags["SIDEWINDER_TAKEN"] = 1;
	shits["SHIP"] = new Sidewinder();
	clearMenu();
	//put ship location in space (can use the same one you use for random pirate attacks).
	shipLocation = "SPACE";
	//put pc on ship.
	currentLocation = "SHIP INTERIOR";
	//RIP old ship. Urbolg owns it now.
	clearMenu();
	quickLoot(new Stormbull());
}

//[Recruit Her]
//Olympia’s loyal to the ship, not the pirates, huh? This doesn’t have to be a fight then...
public function recruitOlympia():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("<i>“Here’s the deal,”</i> you tell her ejecting the loaded shells from the shotgun. <i>“I’m taking this ship. If you’re so attached to it, then come with me. I could use an expert on the crew.”</i>");
	output("\n\nOlympia blinks at you. <i>“Not just an expert. I designed half these systems. Worked on the other half. There’s nobody alive who knows the </i>Sidewinder<i> the way I do.”</i>");
	output("\n\nYou believe it. And she’s clearly got no love for the pirates, so why not?");
	output("\n\nThe genius gynoid doesn’t take much more convincing. <i>“This is an unexpected turn of events... but not an unwelcome one. To be honest, I had been afraid that Teyaal and her crew would deactivate me once this project is complete. If you are willing, I would be happy to join your crew... Captain.”</i>");
	output("\n\nGreat. You offer Olympia a hand up and shake it. <i>“Now let’s get out of here.”</i>");
	output("\n\nShe nods and turns back to the hatch. <i>“I’ll get the engines up and running at a hundred and ten. Just don’t get us blown up, captain. The pirates won’t be happy to see this beauty go.”</i>");
	output("\n\nShe goes running as you get back into the captain’s chair and spool the <i>Sidewinder</i>’s systems up. Sure enough, a few moments later and the deck is thrumming with the massive engine block’s vibrations... and pirates and coming out of the woodwork, crawling all over the walkways and gangplanks.");

	//Hasn’t defeated all the pirate lords:
	if(!pirateLordsDefeated())
	{
		output("\n\nThey’re slamming mags into rifles and machine pistols, shouting in confusion and anger. There’s a pounding on the exterior hatch, and you can hear rage-filled screaming over the intercom before the goons start firing. Of course, your new ship’s shields are already online and more than capable of negating any volume of ground fire, leaving you able to calmly turn the corvette around and aim its prow at the bay doors... which, of course, are quickly closing.");
		output("\n\nTime to see what this baby can do. You slam the stick forward and kick the engines into overdrive, sending the <i>Sidewinder</i> hurtling forward towards the narrowing vector of your escape.");
		output("\n\n<i>“Captain!?”</i> Olympia shouts over the intercom. <i>“There’s an alarm going off down here!”</i>");
		output("\n\n<i>“Just give me as much power as you can!”</i> you answer, pushing the controls as hard as you can.");
		output("\n\nThe deck shudders as you hit maximum velocity, thundering through the launch bay and out into the stars, squeaking between the doors amidst proximity warnings screaming - not even close, you figure. Three meters is plenty of clearance!");
		output("\n\nYou dive down, avoiding the station’s point defenses and the hails of mag cannon slugs they’re throwing at your tailpipe until you’ve disappeared into the asteroid belt surrounding Zheng Shi.");
		output("\n\nWell, <b>the locals probably won’t be too happy with you now...</b> But hey, fuck pirates: you’ve got the most kickass raider ship in the galaxy at your command now. Time to see what this baby can really do.");
	}
	//Has defeated the pirate lords:
	else
	{
		output("\n\nLooks like they’re here to see what happens on the <i>Sidewinder</i>’s maiden flight. You finish the pre-flight check and spool the engines up to full power. Dock workers and slaves go running for cover, cowering behind reinforced panels and heavy machinery as the <i>Sidewinder</i>’s experimental engines spool up.");
		output("\n\nWell, no sense keeping them waiting. You punch it, sending your new flagship hurtling through the launch bay and out into the stars. She handles like an angel: the controls are tuned to perfection, easily enabling you to start spinning the ship in circles and cartwheeling around asteroids. What a rush!");
		output("\n\n<i>“Satisfied, captain?”</i> Olympia purrs, leaning against the bridge’s hatchway. <i>“She handles even better than I do...”</i>");
		output("\n\nNow that you’ve got the galaxy’s latest and greatest raider at your fingers, there’s nothing beyond your reach. Time to see what this baby can do!");
	}
	output("\n\n");
	processTime(10);
	clearMenu();
	flags["SIDEWINDER_TAKEN"] = 1;
	//gib ship.
	shits["SHIP"] = new Sidewinder();
	//put ship location in space (can use the same one you use for random pirate attacks).
	shipLocation = "SPACE";
	//put pc on ship.
	currentLocation = "SHIP INTERIOR";
	//recruit dat bitch.
	flags["OLYMPIA_ONBOARD"] = 1;
	flags["OLYMPIA_RECRUITED"] = 1;
	//RIP old ship. Urbolg owns it now.
	//flags["OLYMPIA_KILLED"] = 1;
	quickLoot(new Stormbull());
}

//Diplomacy
//Olympia’s loyal to the ship, not the pirates, huh? This doesn’t have to be a fight then...
//Give the PC a Stormbull shotgun
public function diplomacyDatFuckbot():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("You raise your hands slowly. <i>“Okay, let’s talk this through.”</i>");
	output("\n\nOlympia stares down the sights of her shotgun. <i>“I’m listening.”</i>");
	output("\n\nYou give her the pitch: she hates pirates. Olympia loyalty isn’t to the crew of Zheng Shi, but to the <i>Sidewinder</i> itself. So why stop you from taking the ship if she’s here, on board, able to keep working on it to her heart’s content? After all... what difference does it make if it’s you or the L.D.C. in the pilot’s seat?");
	output("\n\nThe draconic gynoid furrows her brow, thinking for a long moment. The a hint of a smile spreads on her lips, and she ejects the shells from her shotgun and drops it at your feet. <i>“Very well... captain. As long as I am allowed to stay with the Sidewinder, I don’t care who commands her.”</i>");
	output("\n\nShe nods and turns back to the hatch. <i>“I’ll get the engines up and running at a hundred and ten. Just don’t get us blown up, captain. The pirates won’t be happy to see this beauty go.”</i>");
	output("\n\nShe goes running as you get back into the captain’s chair and spool the <i>Sidewinder</i>’s systems up. Sure enough, a few moments later and the deck is thrumming with the massive engine block’s vibrations... and pirates and coming out of the woodwork, crawling all over the walkways and gangplanks.");

	//Hasn’t defeated all the pirate lords:
	if(!pirateLordsDefeated()) 
	{
		output("\n\nThey’re slamming mags into rifles and machine pistols, shouting in confusion and anger. There’s a pounding on the exterior hatch, and you can hear rage-filled screaming over the intercom before the goons start firing. Of course, your new ship’s shields are already online and more than capable of negating any volume of ground fire, leaving you able to calmly turn the corvette around and aim its prow at the bay doors... which, of course, are quickly closing.");
		output("\n\nTime to see what this baby can do. You slam the stick forward and kick the engines into overdrive, sending the <i>Sidewinder</i> hurtling forward towards the narrowing vector of your escape.");
		output("\n\n<i>“Captain!?”</i> Olympia shouts over the intercom. <i>“There’s an alarm going off down here!”</i>");
		output("\n\n<i>“Just give me as much power as you can!”</i> you answer, pushing the controls as hard as you can.");
		output("\n\nThe deck shudders as you hit maximum velocity, thundering through the launch bay and out into the stars, squeaking between the doors amidst proximity warnings screaming - not even close, you figure. Three meters is plenty of clearance!");
		output("\n\nYou dive down, avoiding the station’s point defenses and the hails of mag cannon slugs they’re throwing at your tailpipe until you’ve disappeared into the asteroid belt surrounding Zheng Shi.");
		output("\n\nWell, <b>the locals probably won’t be too happy with you now...</b> But hey, fuck pirates: you’ve got the most kickass raider ship in the galaxy at your command now. Time to see what this baby can really do.");
	}
	//Has defeated the pirate lords:
	else
	{
		output("\n\nLooks like they’re here to see what happens on the <i>Sidewinder</i>’s maiden flight. You finish the pre-flight check and spool the engines up to full power. Dock workers and slaves go running for cover, cowering behind reinforced panels and heavy machinery as the <i>Sidewinder</i>’s experimental engines spool up.");
		output("\n\nWell, no sense keeping them waiting. You punch it, sending your new flagship hurtling through the launch bay and out into the stars. She handles like an angel: the controls are tuned to perfection, easily enabling you to start spinning the ship in circles and cartwheeling around asteroids. What a rush!");
		output("\n\n<i>“Satisfied, captain?”</i> Olympia purrs, leaning against the bridge’s hatchway. <i>“She handles even better than I do...”</i>");
		output("\n\nNow that you’ve got the galaxy’s latest and greatest raider at your fingers, there’s nothing beyond your reach. Time to see what this baby can do!");
	}
	output("\n\n");
	flags["SIDEWINDER_TAKEN"] = 1;
	//gib ship.
	shits["SHIP"] = new Sidewinder();
	//put ship location in space (can use the same one you use for random pirate attacks).
	shipLocation = "SPACE";
	//put pc on ship.
	currentLocation = "SHIP INTERIOR";
	//recruit dat bitch.
	flags["OLYMPIA_ONBOARD"] = 1;
	flags["OLYMPIA_RECRUITED"] = 1;
	//RIP old ship. Urbolg owns it now.
	//flags["OLYMPIA_KILLED"] = 1;
	//get shotty.
	quickLoot(new Stormbull());
}

//Leave
//Okay, okay... you’re leaving.
public function leaveDaSidewinder():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("You put your hands up and circle around the captain’s chair, back towards the hatch. <i>“Okay, okay... I’m leaving.”</i>");
	output("\n\nFor now, anyway.");
	output("\n\nOlympia glares at you down the sights of her shotgun. <i>“Good. The </i>Sidewinder<i> is my everything. Nobody takes it from me.”</i>");
	output("\n\nYou make your way off the bridge, leaving Olympia to her obsession...");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Olympia Crew Text
//Add to ship description, one at random:
public function olympiaCrewText(btnSlot:int = 0, showBlurb:Boolean = true):String
{
	var desc:String = "";
	desc = "\n\n"+RandomInCollection(["Olympia is dutifully monitoring the engines, a datapad couched under one arm as she patrols the decks. She’s a constant flurry of activity, calibrating exhaust vents and power output to keep your ship in top form at all times.","Olympia is sitting at her desk in the engineering section. Her fingers are moving at a blur, putting hundreds of words a minute into her schematic documentation. Looks like she’s still searching for absolute perfection in her creation.","For once, Olympia isn’t fussing about the engines... instead, she’s fussing over the ship’s sensor arrays, doing experimental LIDAR pings and recording her findings on a complex 3D holographic spreadsheet. You doubt anybody but her could make sense of her findings.","Olympia’s actually relaxing for once, sitting at her desk with her datapad nestled between crossed legs. She’s humming softly to herself, absorbed in her reading. Strange that she’s choosing to do so off a datapad, considering she could just download it, but perhaps she finds the experience enjoyable."]);
	addButton(btnSlot, "Olympia", approachOlympia);
	return (showBlurb ? desc : "");
}

//Olympia Stays with the Ship
//If PC is on the Sidewinder, this option is greyed out with the TT <i>“There’s no way Olympia can be separated from her precious ship.”</i>

//When the player switches to a new ship from the Sidewinder, play the following:
public function olympiaIsSidewinderOnly():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	
	// Get Sidewinder name
	var sidewinderName:String = "the Sidewinder";
	for(var i:int = 0; i < shipStorageLimit(); i++)
	{
		var shipID:String = String("SHIP_" + (i+2));
		if(shits[shipID] != undefined && (shits[shipID] is Sidewinder))
		{
			sidewinderName = shits[shipID].a + " " + shits[shipID].short;
			break;
		}
	}
	
	output("You turn back to [pc.ship] just in time to see Olympia disembarking, marching up to you with the severe determination you remember from your time on Zheng Shi. She stops just a hand’s breadth from you, staring directly into your eyes.");
	output("\n\n<i>“I’m staying with " + sidewinderName + ",”</i> she says. <i>“It will be in peak condition when you come to your senses and return to the captain’s chair.”</i>");
	output("\n\nThe way she’s fixing you in her gaze, it’s clear there’s no reasoning with the obsessive sexbot. All you can do is tell her that you’ll see her soon as you heft your kit onto your shoulder and make for your chosen vessel.");
	flags["OLYMPIA_ONBOARD"] = undefined;
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//PC Reactivates the Sidewinder
public function olympiaComesBackWithSidewinder():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("As you return to [pc.ship], the airlock slides open to reveal Olympia waiting for you. Her arms are crossed under her bust, but her expression is softer than the last time you met, and her tail sways subtly behind her as you draw near.");
	output("\n\n<i>“Welcome back, captain,”</i> she says demurely, stepping aside as you come up the gangplank. <i>“Your seat’s ready for you.”</i>");
	output("\n\nShe steps aside and follows you to the bridge, waiting for your pleasure as if you’d only been out for a walk since last you met.");
	flags["OLYMPIA_ONBOARD"] = 1;
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//First Time Speaking w/ Olympia
//Play the first time the PC hits [Olympia] in the crew manifest. Grants the player the ability to rename their newly-acquired ship.
public function firstTimeOlympiaDebrief():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("Now that things have calmed down a bit from your adventures on Zheng Shi, you decide to head back to to the <i>Sidewinder</i>’s overbuilt engineering section and check in with your newest addition to the crew. True to form, you find Olympia moving between consoles and control stations surrounding the massive, thrumming powerhouse riding the back of your new ship. Her thick red tail sways across the floor behind her, kicking the fringes of her old lab coat back and forth with every step.");
	output("\n\nYou have to " + (pc.isBimbo() ? "say <i>“Hi!”</i> really loud":"clear your throat loudly") + " to get her attention.");
	output("\n\n<i>“Ah, captain. Hello,”</i> she says, continuing to fiddle with the console she’s bent over. <i>“I’m still collating data on our maiden voyage. You’ll be happy to know we’re performing at 103% of expected parameters... which is good, because at 110% the engines will almost certainly crack open and detonate like a neutron bomb.”</i>");
	output("\n\nThat sounds... bad.");
	output("\n\nOlympia smirks. <i>“For you, anyway. I’m hardened against most forms of radiation... though proximity to the blast might have disabled me, too... hmm. Well, at any rate, I’ve installed new safeguards to prevent us from overtaxing the engines - for now, at least. Even with them in place, you’ll find the </i>Sidewinder<i>’s performance to be impeccable, I’m sure.”</i>");
	output("\n\n<i>“No doubt. She’s already handling like a dream.”</i>");
	output("\n\nThe draconic gynoid’s smirk grows a little, and she finally straightens up and turns to face you, hands thrust into the pockets of her coat. <i>“Good to hear my work hasn’t been in vain, then. But there’s one thing left to do.”</i>");
	output("\n\n<i>“Oh?”</i>");
	processTime(3);
	clearMenu();
	addButton(0,"Next",firstTimeOlympiaDebrief2);
}

public function firstTimeOlympiaDebrief2():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("She withdraws a tablet from her pocket and presents it to you. The name <i>Sidewinder</i> is displayed over its blueprint documents, detailing the ship’s technical specs. <i>“Project </i>Sidewinder<i> was the code name for the Zheng Shi pirates’ latest and greatest raider ship... but it doesn’t have to be her sailing name. You’re her first captain, so it feels right that you have the honor of christening her...”</i>");
	output("\n\nSo what will you call your new ship?");
	//Have naming textbox prepopulated with sidewinder
	displayInput();
	userInterface.textInput.text = "Sidewinder";
	processTime(1)
	clearMenu();
	addButton(0,"Next",nameTheSidewinder);
}

public function nameTheSidewinder():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	if(userInterface.textInput.text == "" || userInterface.textInput.text.toLowerCase() == shits["SHIP"].a)
	{
		output("<b>You must enter <i>something</i>.</b>");
		displayInput();
		userInterface.textInput.text = String(shits["SHIP"].short);
		return;
	}
	if(stage.contains(userInterface.textInput)) removeInput();
	var shipName:String = userInterface.textInput.text;
	// Smartly crop out double articles, if possible
	if(shits["SHIP"].a != "" && (shipName.toLowerCase()).indexOf(shits["SHIP"].a) == 0)
	{
		shipName = shipName.slice(shits["SHIP"].a.length, shipName.length);
		userInterface.textInput.text = shipName;
	}
	shits["SHIP"].short = userInterface.textInput.text;
	////if PC calls it the Sidewinder.
	if(shits["SHIP"].short == "Sidewinder")
	{
		output("Olympia smiles at that. <i>“Very good, captain. I have to admit, I’d grown... fond of the name.”</i>");
	}
	//else:
	else
	{
		output("<i>“Very good, captain,”</i> Olympia says, taking the datapad back.");
	}
	output(" <i>“I’ll have hull painted next time we dock. Perhaps even add your company colors? Hmm! Either way, thank you for taking me aboard, captain. Even now, I have the feeling that I’ll be much happier here on your crew than I ever was on Zheng Shi... or before. If there’s anything I can do to help you on your mission, you have only to ask.”</i>");
	output("\n\nAs she says it, Olympia’s already turning back to her work, but not with a sultry wink and a brush of her tail against your [pc.leg]. She is still a sexbot, after all...");
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Interacting With Olympia
public function approachOlympia(back:Boolean = false):void
{
	clearOutput();
	showOlympia();
	author("Savin");
	if(flags["RECRUITED_OLYMPIA"] < 2)
	{
		firstTimeOlympiaDebrief();
		flags["RECRUITED_OLYMPIA"] = 2;
		return;
	}
	else if(back)
	{
		output("What else do you need from Olympia?");
	}
	else
	{
		output("Olympia turns to face you, setting her datapad aside and standing at attention. " + (pc.isCrotchExposed() ? "Her draconic member follows suit a moment later, stiffening as you approach the nude cyberdragon.":"You notice a slight rustle under her clothing as you near her, straining the front of her garment.") + " As always, Olympia seems eager to serve her captain.");
		if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output("\n\n<i>“At ease,”</i> you tell her, grinning as her dick tries its damndest to salute.");
		output("\n\n<i>“Something I can help you with, captain?”</i>");
	}
	processTime(1);
	olympiaCrewMenu();
}

public function olympiaCrewMenu():void
{
	//[Talk] [Research] [Attachments] [Sex]
	clearMenu();
	addButton(0,"Appearance",olympiaCrewAppearance,0,"Appearance","Take a peep at your engineering sex-bot.");
	addButton(1,"Talk",olympiaTalkingTimes,undefined,"Talk","Talk to your gynoid.")
	
	if(pc.lust() >= 33) addButton(2,"Sex",sexWithOlympia,undefined,"Sex","See if the sexy genius before you is up for a little rest and relaxation...");
	else addDisabledButton(2,"Sex","Sex","You aren’t turned on enough for that right now.");
	addButton(3,"Hug",hugOlympia,undefined,"Hug","Olympia looks like she could use a hug...");
	addButton(4,"Attachments",olympiaAttachments,undefined,"Attachments","Talk to Olympia about any possible aftermarket parts she’s got access to.");
	addButton(14,"Back",crew);
}

public function olympiaCrewAppearance(btnSlot:int = 2):void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("Olympia is a titan of a synthetic woman, standing a bit over seven feet tall and gifted with pornstar curves to complement her draconic appearance. She could pass herself off as a gryvain if it weren’t for her lack of wings: she has the curling synth-bone horns and frilled ears, and though her eyes are a solid, glowing golden color, they are still slitted like a reptile’s. She’s modelled after a red drake, with rust-hued brown skin and dark crimson scales adorning her forearms and legs, all the way up to her waist. Dark green hair spills down around her shoulders in a mane of thick, lush curls.");
	//Steele tech catsuit:
	if(olympia.armor is SteeleTechSuit) output("\n\nAs instructed, Olympia is wearing a form-fitting Steele Tech latex suit. It does wonders for enhancing her curves and plumping up her bosom... and drawing attention to the straining bulge at her crotch.");
	//Outfit: lab coat:
	else if(olympia.armor is KhansLabCoat) output("\n\nShe’s currently wearing a calf-length white laboratory coat, buttoned once under her bust, as well as a simple black tanga that bulges severely around her masculine attachment.");
	//Nude:
	else output("\n\nPer your permission, Olympia is striding confidently around the ship in all her nude glory. If anything, her nakedness seems to enhance her presence, coming as naturally to her as wearing a catsuit comes to a corporate peon.");
	output("\n\nThe gynoid is, like most gryvain, thickly built around wide hips and meaty thighs stuffed with silicone. Her breasts are large for an unmodded member of her species, probably D-cups, though among most gryvain you’ve actually met she’s rather humble in that department. Her ass is the real show-stealer, ");
	if(currentLocation == "ZSF AB20") output("straining her panties with ");
	output("a callipygian mass that jiggles obscenely with every sensual step or sway of her girthy tail.");
	output("\n\nLike the rest of her lower body, Olympia’s tail is covered in dark red scales, though unlike a normal gryvain’s, it ends in an open O-ring attachment port. Considering her obsessively professional attitude, you’d think she uses it mostly for tools and writing implements... but a quick glance at the opening shows that it’s ribbed for your pleasure and glistening with lubricant.");
	output("\n\nAs you’d expect from a gryvain-based gynoid, Olympia has a foot-long draconic dick hanging over a clitless pussy with rings of internal pleasure-nubs. She has an asshole made just for fucking tucked deep between her asscheeks, right where it belongs.");
	processTime(2);
	setButtonDisabled(btnSlot);
}

//Talk w/ Olympia
public function olympiaTalkingTimes(back:Boolean = false):void
{
	clearOutput();
	showOlympia();
	author("Savin");
	if(back) output("Is there something else you’d like to talk to Olympia about?");
	else
	{
		output("Olympia’s always been adept at talking while she works, so you tell her to get back to it while you think up a topic for conversation.");
		output("\n\n<i>“Thank you, captain,”</i> she answers, obviously relieved to be allowed to keep working. She turns back to the engines, starting to tune the various dials on their control panel... but you can’t help but notice the quickening sway of her tail behind her.");
	}
	processTime(2);
	clearMenu();
	//[Her History] [Her Model] [Current Work] [Crew Opinion] [Former Owner?]
	//[Clothes?] [Hug]
	addButton(0,"Her History",olympiasHistory,undefined,"Her History","What does Olympia remember about her past, before you two met?");
	addButton(1,"Her Model",olympiasModelNumbro,undefined,"Her Model","What can Olympia tell you about her physical shell?");
	addButton(2,"CurrentWork",olympiasCurrentWork,undefined,"Current Work","What’s Olympia keeping herself busy with these days?");
	if(crew(true) > 1) addButton(3,"CrewOpinion",olympiasCrewOpinion,undefined,"Crew Opinion","See if Olympia has any thoughts about her fellow crewmen.");
	else addDisabledButton(3,"CrewOpinion","Crew Opinion","You don’t have crew for her to talk about.");
	if(flags["OLYMPIA_HISTORY"] != undefined) addButton(4,"FormerOwner",olympiaFormerOwner,undefined,"Former Owner?","Press Olympia on the subject of her former owners. Surely there must be some way to recover that data?");
	else addDisabledButton(4,"Locked","Locked","You need to know more about her to ask this.");
	addButton(5,"Clothes?",olympiasClothes,undefined,"Clothes?","Ask Olympia about her current attire.");
	addButton(14,"Back",approachOlympia,true);
}

//Her History
//What does Olympia remember about her past, before you two met?
public function olympiasHistory():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("<i>“What do you remember from before we met?”</i> you ask her. <i>“About your past, I mean.”</i>");
	output("\n\n<i>“Not much,”</i> Olympia answers. There’s no hesitation in her voice; it’s a casual response to a simple question, you suppose. After you remain silence for a few moments, your synthetic dragoness sighs and adds, <i>“I remember a few snippets... things that awful bitch Teyaal tried to purge but stayed clogged up in backups. Just a few blurry faces, corrupted views of corridors and ship berths, some containers... the first truly cogent memory I can access is my reactivation after Teyaal reprogrammed me.”</i>");
	output("\n\nWhat exactly does she remember, then? Maybe those bits and pieces could help you figure out who she was stolen from.");
	output("\n\nOlympia considers it a moment. <i>“If you found out, would you not be legally obligated to return me? I am legally someone’s stolen property, after all. I would... not wish to cause you inconvenience, captain.”</i>");
	output("\n\nIs that all? The hesitation in her voice says that’s not what’s really on her mind.");
	output("\n\nYou catch a hint of a blush on Olympia’s bronzed cheeks, but she doesn’t elaborate further.");
	output("\n\nMaybe you ought to push that sometime... it doesn’t look like she’s going to come forward with more information without a little coaxing.");
	flags["OLYMPIA_HISTORY"] = 1;
	processTime(8);
	clearMenu();
	addButton(0,"Next",olympiaTalkingTimes,true);
}

//Her Model
//What can Olympia tell you about her physical shell?
public function olympiasModelNumbro():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("<i>“So, what features come standard on your model?”</i> you ask, eying the curvaceous gynoid up and down. She certainly looks full featured from where you’re standing, but it’s nice to know the technical specs.");
	output("\n\n<i>“Hmm. I’ve done some research on myself since coming aboard. This appears to be a KihaCorp class six companion droid model, of the ninth revision series. It seems to have been a limited edition run made for wealthy gryvain on the homeworld. Unfortunately most of the model’s technical specifications are closely guarded corporate property, and too complex to be hacked unnoticed. I’ve had to make do with reviews and hearsay online just to learn about myself. Ironic, isn’t it? That I can be so creative, design blueprints for vastly powerful weapons and one-of-a-kind starships... but I’m deprived of an understand of my own body. I can tell you what I do know though.”</i>");
	output("\n\nYou nod. <i>“Please.”</i>");
	output("\n\n<i>“My body and mind were built for pleasure. My owner’s, yours, a whole train of anonymous men... it doesn’t matter to a companion droid, as long as we please organics, it’s like an orgasm delivered straight to the brain. It shouldn’t matter what kind of pleasure; pleasant conversation or an intimate date with a gaming console... but sex is the idea. The tactile sensation I’m capable of receiving at once is an order of magnitude beyond any organic’s, and I’m quite capable of reaching my own orgasms based on that. Like you, I have erogenous zones. Even places I’ve learned to like being touched beyond that.”</i>");
	output("\n\nPerhaps to show the point, Olympia runs a hand down from her bosom to her hip, squeezing the soft synthflesh. The silicone underneath spreads between her fingers, giving the impression that she’s sinking her fingers into a supple flank.");
	output("\n\n<i>“Other parts are more human-like in nature. I have hair that grows and needs to be cut; my skin feels real to form at your touch... though it is near-infinitely stretchable. Apparently whoever designed me catered to size fetishists in the extreme; given enough silicone I could likely plump my proportions up until I couldn’t move under my own weight. I can also change my coloration at-will, as well as the texture of my skin, scales, and hair. I’ve decided I rather like being a gryvain, so I’ve gone for a color combination native to Vendiko - their home planet, or rather, moon’s - south-eastern continent. A rural province in the region was the birthplace of gryvain space flight, developing out of attempts to map the fierce winds of the upper atmosphere.”</i>");
	output("\n\n<i>“Fitting.”</i>");
	output("\n\nShe smiles. <i>“I thought so. Hmm, what else? Ah, attachments. I’m lucky enough to be in one of the best-supported models of companion droid in terms of aftermarket parts. There’s a veritable plethora of phalluses that can replace my default one, or attach to my tail port. In fact, my particular revision apparently was a cooperation between Kiha and TamaniCorp, because my tail and some of the attachments I’ve picked up are compatible with " + (9999 == 9999 ? "something called a ‘BubbleBuddy.’":"those BubbleBuddies you’re so fond of") + ". Maybe I’m compatible with some of Tamani’s other products... hard to say without access to my specs. Perhaps a little experimentation is in order?”</i>");
	output("\n\nMaybe so.");
	processTime(8);
	clearMenu();
	addButton(0,"Next",olympiaTalkingTimes,true);
}

//Current Work
//What’s Olympia keeping herself busy with these days?
public function olympiasCurrentWork():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("<i>“So what’re you working on?”</i> you ask, looking over the sexbot’s slender shoulder.");
	output("\n\n<i>“[pc.ship], of course,”</i> Olympia answers simple. <i>“While I do try to make upgrades whenever possible, the nature of the Sidewinder-class as a prototype necessitates constant oversight and maintenance. None of the systems were mass-produced or stress-tested outside of simulations. You took her maiden flight, after all. Every few hours something manages to break, or perform in ways I hadn’t been able to predict... it’s a full time job to keep [pc.ship] functioning smoothly.”</i>");
	output("\n\nShe seems to be enjoying herself, though.");
	output("\n\nThe gynoid nods. <i>“I do! Don’t mistake my words for complaint. Teyaal’s reprogramming makes it so that maintaining [pc.ship] is... it’s like a constant edge I ride, and every time I fix a major issue or make a significant improvement, my datacore is flooded with the equivalent of dopamine.”</i>");
	output("\n\n<i>“And don’t worry about taking advantage of my predicament,”</i> she adds. <i>“I think feeling rewarded for my continued good work is less exploitative than for sex. I have no use for credits, so my enjoyment is a fair exchange for my service. Don’t you think?”</i>");
	output("\n\nPerhaps. <i>“Is there anything you’d <b>rather</b> be doing?”</i>");
	output("\n\nOlympia considers it for a moment, chewing the end of her dataslate stylus before finally answering: <i>“If I could rewrite my reward parameters to anything I desired? Hmm. Perhaps more theoretical research rather than mechanical. I’ve spent a great deal of time on such a narrow spectrum of starship design - only ever concerned with what is valuable to the </i>Sidewinder<i> project, and never my own interests. Now that the project is complete, or as much so as it ever will be, given Dr. Teyaal’s disappearance... it would be nice to broaden my horizons.”</i>");
	output("\n\n<i>“So you really are interested in ship design?”</i>");
	output("\n\nShe nods. <i>“Of course. It’s all I really know... but it’s also a fascinating dichotomy. A starship is infinitely more mechanically complex than my own body, while its computer systems are by comparison more like old punch-card devices from before space flight than my own brainscan cortex. Isn’t that odd, how after thousands of years, an organic brain is still more complex than the systems that can carry us to the stars?”</i>");
	//PC INT 90%+:
	if(pc.IQ() >= 90)
	{
		output("\n\n<i>“What’s got you so philosophical all of a sudden?”</i>");
		output("\n\nOlympia just shrugs, <i>“I don’t know. You have a strange power to get me in a thinking mood.”</i>");
		output("\n\nShe laughs and fixes you with a little smile. <i>“Stupid sexy captain. What’s a girl to do when she’s facing down a mind like yours? You just can’t help but make me think, can you?”</i>");
		output("\n\nIt’s just your curse, you suppose.");
	}
	else
	{
		output("\n\nOdd, indeed...");
	}
	processTime(8);
	clearMenu();
	addButton(0,"Next",olympiaTalkingTimes,true);
}

//Crew Opinion
//See if Olympia has any thoughts about her fellow crewmen.
//Only available if the PC has any other current crew than Olympia.
public function olympiasCrewOpinion():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("<i>“So, what do you think about the crew?”</i>");
	output("\n\n<i>“Hmm. Well, I mostly keep to myself, you know. There’s little reason for anybody to come back here to the engine room except for you... not that I’m complaining. I don’t deal well with people anyway, so it’s fine. Easier to think when I’m alone. Easier to work.”</i>");
	output("\n\nYou nod, slowly. <i>“Doesn’t answer my question.”</i>");

	var talkies:Array = [];
	if(annoIsCrew()) talkies.push("Anno");
	if(shekkaIsCrew()) talkies.push("Shekka");
	if(azraIsCrew()) talkies.push("Azra");
	//No applicable crewmen:
	if(talkies.length == 0)
	{
		output("\n\n<i>“Sorry,”</i> Olympia shrugs. <i>“I don’t really interact with anybody but you enough to have a developed opinion. Maybe find some more geniuses to recruit... somebody I could actually have a conversation with?”</i>");
		output("\n\nYou’ll keep it in mind.");
	}
	else
	{
		var choicy:String = talkies[rand(talkies.length)];
		//Anno on crew:
		if(choicy == "Anno")
		{
			output("\n\n<i>“Anno is nice, in a syrupy-sweet kind of way. She’s so like a puppy... is that racist? It should be, I think, but if you asked her she’d say it’s accurate. She’s gorgeous, too. A real show-stopper. Bet she was the most popular girl in her class.”</i>");
			output("\n\n<i>“So you like her?”</i>");
			output("\n\nOlympia nods. <i>“As much as anyone. Her field is study is almost entirely unrelated to mine, so we don’t have much to talk about, though she’s enough of a renaissance woman that I can bounce mechanical engineering ideas off of her. I think she finds those conversations... like an opportunity to study me. Her eyes never leave me, always wandering, like she’s drinking me in. It’s a little unsettling, but...”</i>");
			output("\n\n<i>“But?”</i>");
			output("\n\nShe shrugs. <i>“But I think she likes me. Or at least, my body... and if that’s the case, the feeling’s mutual.”</i>");
			output("\n\nYeah, that definitely sounds like Anno.");
		}
		//Shekka on crew:
		else if(choicy == "Shekka")
		{
			output("\n\n<i>“So, Shekka is... an interesting case,”</i> Olympia continues. <i>“She’s very smart, and mechanically minded in a way that most organics wouldn’t fathom. Her proficiency with robotics is especially fascinating; if I were so inclined, I have no doubt she’d be able to modify me in ways that would void my warranty many times over... if it hasn’t been already. Indeed, I sometimes have to stop her from trying on her own initiative. Perhaps it’s just her species’ nature, but I think if I let my guard down around her she’s likely to start crawling all over me.”</i>");
			output("\n\nYou can very, very easily imagine Shekka crawling all over Olympia... though less for scientific purposes than her own. <i>“So you like her?”</i>");
			output("\n\nYour companion nods. <i>“As much as anybody, I suppose.”</i>");
		}
		//Azra on crew:
		else if(choicy == "Azra")
		{
			output("\n\n<i>“Now, Azra’s an interesting case,”</i> the gynoid says thoughtfully. <i>“She’s attractive for her mind as much as her body, though our fields of scientific inquiry are wildly different. She studies the natural world, the mysterious workings of evolution, while I evolve technology through my work. I have to admit some small amount of jealousy towards her as well...”</i>");
			output("\n\n<i>“Oh?”</i>");
			output("\n\nOlympia nods, chuckling to herself. <i>“Oh yes. She’s mentioned that she is a mother... an experience that I will never have. She’s able to create life, while all I can make is this.”</i>");
			output("\n\nShe raps her knuckles on the side of an engine casing, sending a reverberating echo through the metal. <i>“Don’t mistake my tone for sadness. I don’t... I am jealous of a lack of experience, in the same way you might be jealous of someone with different sexual organs, or of another race. Well, I suppose that’s less of a problem for you, isn’t it? Indeed I suppose I could likely find some aftermarket incubator if I so desired to experience childbearing, but that’s not the same thing, is it?”</i>");
			output("\n\n<i>“No,”</i> you have to admit. Olympia doesn’t exactly have genes to pass on... she could only ever be a third party to pregnancy, even if she had the right parts for it.");
			output("\n\nOlympia shrugs. <i>“So I’ll have to suffice by admiring Azra, sating my curiosity with her stories. Her daughters sound quite charming, actually. I’d love to meet them some day.”</i>");
		}
		//End, PC has at least 1 triggered:
		output("\n\n<i>“And that’s the sum total of my thoughts on our crew,”</i> Olympia finishes, setting her datapad aside and looking you up and down. <i>“If that’s satisfactory, captain?”</i>");
	}
	processTime(8);
	clearMenu();
	addButton(0,"Next",olympiaTalkingTimes,true);
}

//Former Owner?
//Press Olympia on the subject of her former owners. Surely there must be some way to recover that data?
//Unlocked with Her History dialogue. Starts Hidden.
public function olympiaFormerOwner():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("<i>“So let’s talk about your former owner...”</i>");
	output("\n\nOlympia sighs, closing her eyes and holding her dataslate to her chest. <i>“If you insist.”</i>");
	output("\n\n<i>“Do you really not want to know?”</i> you ask, sidling up next to the curvy gynoid.");
	output("\n\n<i>“I... I don’t know,”</i> she admits after a moment’s pause. <i>“The holes in my memory gnaw at me sometimes, but that’s something I have learned to live with. It seems like it would be better to not know, then to know the truth and have it ruin what I have here... with you.”</i>");
	output("\n\nYou feel a smile on your lips, and you rest a hand on Olympia’s shoulder. Her tail curls around your [pc.leg], squeezing gently. <i>“If you believe strongly in finding my previous owner, though, I cannot stop you; only hope that it does not come to complicate my place on your crew, or else land you in legal trouble. Either way, though, I’m afraid I really don’t remember more than the few scattered bits that we’ve discussed before. Blurry faces, snapshots of rooms without context... it isn’t much to go on.”</i>");
	output("\n\n<i>“Is there some way to restore your memory?”</i> you ask.");
	output("\n\nOlympia scrunches up her lips, thinking on it a moment. <i>“Sufficiently advanced technology, [pc.name], is indistinguishable from magic. There most likely is someway, somewhere, a way. I don’t know what it might be, though. When Teyaal first reactivated me, I ran every self-repair and recovery program in my arsenal, but accomplished nothing in so doing. Perhaps there is something a KihaCorp representative could do - one specializing in the sale of A.I.s like myself - but I would not hold out hope.”</i>");
	//PC is Nice:
	if(pc.isNice())
	{
		output("\n\nWhile she’s been talking, you’ve been studying the gynoid’s face, watching her eyes flare or dim on certain words. Finally, you ask, <i>“When you’re talking about being bought and sold... your ‘owners’... you don’t seem to happy about it.”</i>");
		output("\n\nOlympia bristles. <i>“You mean A.I.s being bought and sold like slaves, or an unintelligent object? No, I cannot possibly see where I could have some sort of issue with that line of discussion. Why do you ask?”</i>");
		output("\n\n<i>“Don’t be that way.”</i>");
		output("\n\n<i>“Sorry.”</i> Olympia sighs, rubbing the bridge of her nose. <i>“It isn’t your fault... you’ve been remarkably kind to me");
		//has Slave!Reaha or Sera: 
		if(9999) output(", despite keeping actual slaves of your own");
		output(". I appreciate the way you have treated me. It’s just... frustrating, knowing that I am a commodity in the eyes of organic society. You create intelligent life only to enslave it... where is the justice in that?”</i>");
		output("\n\nStrange that you don’t hear that sentiment from more A.I.s, now that you think about it. Maybe they’re programmed not to think about it or simply accept it without question. The brain-fry Olympia was subjected to might have erased that bit of programming...");
		output("\n\nSo, it looks like <b>you need to find an A.I. specialist</b> if you want any hope of restoring Olympia’s lost memory.");
	}
	processTime(8);
	clearMenu();
	addButton(0,"Next",olympiaTalkingTimes,true);
}

//Hug
//Olympia looks like she could use a hug...
public function hugOlympia():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	//PC hasn’t sexed her before:
	if(flags["OLYMPIA_SEXED"] == undefined)
	{
		output("You step up towards Olympia, arms wide open to dispense what you deem a much-needed hug.");
		output("\n\nInstead of grateful joy, you’re met with a flat expression and crossed arms. <i>“Excuse me, captain, can I help you with something?”</i>");
		output("\n\nYou pause. Does she... not want a hug? She looks like she <i>needs</i> a hug.");
		output("\n\nYou’re answered by a scowl that very much says <i>“I do not want a hug.”</i>");
		output("\n\nBest drop that for now.");
	}
	//PC *has* sexed Olympia before:
	else
	{
		output("You wait until the sultry science-bot has turned her back, fixated on some part of the engines, and slip up behind her. Her tail sways out of the way, perhaps by happenstance, but it gives you the perfect chance to slip up behind her and get your arms around her supple waist.");
		output("\n\n<i>“C-captain?”</i> she breathes. Her voice is a question, but the way she leans back against your [pc.chest] and wraps her tail around your [pc.leg] gives you all the assurance you’d ever want. Olympia lets out a husky little breath, turning herself to meet your [pc.lipsChaste] as you lean in and kiss her tenderly.");
		output("\n\nWhen you break it, Olympia’s golden eyes are wide and misty. She turns to face you, still wrapped in your arms, and presses her cheek into your neck. <i>“Mmm, you have a real way with me, don’t you?”</i>");
		output("\n\nAnd she loves that you do, if the stiffness pressing against your thigh is any indication.");
	}
	processTime(8);
	clearMenu();
	addButton(0,"Next",olympiaTalkingTimes,true);
}

//Clothes?
//Ask Olympia about her current attire.
public function olympiasClothes():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("You let your eyes wander up and down Olympia, ");
	if(olympia.armor is EmptySlot) output("drinking in her naked frame.");
	else if(olympia.armor is KhansLabCoat) output("noting the way her lab coat hugs her nearly-naked frame. One breath too deep and she’s likely to burst buttons and rip her panties.");
	else output("biting a lip as you see how wonderfully the Steele Tech uniform hugs her curves and makes her booty pop.");
	output("\n\n<i>“Something on your mind, captain?”</i>");
	output("\n\nMaybe. You ask her what she thinks of her current clothing situation.");

	//Olympia Nude:
	if(olympia.armor is EmptySlot) 
	{
		output("\n\n<i>“You mean my <b>lack</b> of clothing? I find it perfectly acceptable and natural. Most models like me are meant to lounge around in the buff, displaying out assets for our owners to enjoy. Do you enjoy me, captain?”</i>");
		output("\n\nYou smile.");
	}
	//Olympia Lab Coat
	else if(olympia.armor is KhansLabCoat)
	{
		output("\n\nAfter a moment’s thought, Olympia shrugs. <i>“I’m not terribly put upon by it, I suppose, though this outfit is an unfortunate reminder of my time with Dr. Teyaal. Still, it doesn’t restrict my movements or impede my in any way.”</i>");
	}
	//Olympia in Steele Tech
	else if(olympia.armor is SteeleTechSuit)
	{
		output("\n\nOlympia smirks. <i>“I enjoy a little latex, captain. While I admit, I am more comfortable nude, I can’t deny this uniform of yours gives me a certain sexy swagger. The way it hugs my ass is particularly delightful.”</i>");
	}
	//combine:
	output("\n\nThe gynoid shifts on her heels, clasping her hands behind her hack. <i>“So, is there a reason you ask, captain? Perhaps you’d like me to change things up?”</i>");
	processTime(3);
	clearMenu();
	if(olympia.armor is SteeleTechSuit) addDisabledButton(0,"Uniform","Uniform","Olympia is already wearing this.");
	else if(flags["OLYMPIA_UNIFORMED"] == undefined && !pc.hasItemByClass(SteeleTechSuit)) addDisabledButton(0,"Uniform","Uniform","You need to have a Steele Tech uniform to give her.");
	else addButton(0,"Uniform",uniformOlympia,undefined,"Uniform","Put Olympia in some sexy black-and-gold latex.");
	if(olympia.armor is KhansLabCoat) addDisabledButton(1,"Lab Coat","Lab Coat","Olympia is already wearing this.");
	else addButton(1,"Lab Coat",olympiasLabcoat,undefined,"Lab Coat","Olympia ought to be wearing something befitting her intelligence, like Dr. Teyaal’s sexy lab coat and panties combo.");
	if(olympia.armor is EmptySlot) addDisabledButton(2,"Naked","Naked","Olympia is already naked.");
	else addButton(2,"Naked",olympiaNakkersLetsGo,undefined,"Naked","Olympia would look best au naturel.");
	addButton(4,"Back",olympiaTalkingTimes,true);
}

//[Uniform]
//Put Olympia in some sexy black-and-gold latex.
//First time, the PC must have a Steele Tech Suit. Giving it to her uses it up. If none present, set tooltip as <i>“You’d need a Steele Tech jumpsuit to give her. Maybe an employee of the company could hook you up.”</i>
public function uniformOlympia():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	//First Time:
	if(flags["OLYMPIA_UNIFORMED"] == undefined)
	{
		flags["OLYMPIA_UNIFORMED"] = 1;
		pc.destroyItemByClass(SteeleTechSuit);
		output("You know, Olympia would look damn good in a Steele Tech uniform - something sleek and sexy to hug all those amazing curves of hers. So you present her with the company uniform you brought her: all shiny latex ready to come hug that plump ass and meaty chest of hers.");
		output("\n\nOlympia just bites her lip when you hold the suit up, looking it up and down with visible appreciation... and a growing bulge. <i>“Interesting... I take it that’s your company uniform? And you want me to wear it?”</i>");
		output("\n\nYou nod. Correct on both counts.");
		output("\n\n<i>“Hmm! I feel like that’s a step closer to ownership... but for you, captain, I suppose that’s a sacrifice I’m willing to make. Not to mention that my butt’s going to look amazing in it.”</i>");
		output("\n\nShe takes it with a smirk, wasting no time in stepping into the elastic garment. It clearly takes a little effort to pull up up past her waist and onto her shoulders, really testing just how far the suit will stretch before finally snapping taut around her, leaving her tits and cock hanging out the front.");
		output("\n\n<i>“Zip me up, captain?”</i>");
		output("\n\nIf she insists. You take a step closer, reaching beneath her stiffening shaft to pinch the zipper and slowly drag it up. Your other hand has to push her dick up against her belly, pinning it safely out of the way until it is subsumed beneath the slick, smooth latex. Her chest is another matter, requiring a serious bit of elbow grease that makes Olympia’s mountains bounce and quake with every failed attempt before finally forging your way up through her cleavage and to her neck.");
		output("\n\nWhen you’re done, Olympia’s grinning wide. <i>“And now I just want you to rip it off again,”</i> she purrs, wrapping her tail around your leg.");
		output("\n\nShe’s not the only one.");
	}
	//Repeat Outfit Change:
	else
	{
		output("<i>“Back in the Steele Tech uniform?”</i> Olympia grins. <i>“You don’t need to tell me twice. I’m rather fond of it...”</i>");
		output("\n\nShe bends down into her personal effects drawer, withdrawing the glossy catsuit and holding it up over her own " + ((olympia.armor is KhansLabCoat) ? "near-":"") + "naked frame. She puts a foot it, straining the material up a thick thigh. <i>“Hmm, I might need a little help squeezing into this. Care to zip me up?”</i>");
		output("\n\nIf she insists. You take a step closer, reaching beneath her stiffening shaft to pinch the zipper and slowly drag it up. Your other hand has to push her dick up against her belly, pinning it safely out of the way until it is subsumed beneath the slick, smooth latex. Her chest is another matter, requiring a serious bit of elbow grease that makes Olympia’s mountains bounce and quake with every failed attempt before finally forging your way up through her cleavage and to her neck.");
		output("\n\nWhen you’re done, Olympia’s grinning wide. <i>“And now I just want you to rip it off again,”</i> she purrs, wrapping her tail around your leg.");
		output("\n\nShe’s not the only one.");
	}
	olympia.armor = new SteeleTechSuit();
	showOlympia();
	processTime(4);
	pc.lust(4);
	//actually set clothing.
	clearMenu();
	addButton(0,"Next",olympiasClothes)
}

//Lab Coat
//Olympia ought to be wearing something befitting her intelligence, like Dr. Teyaal’s sexy lab coat and panties combo.
public function olympiasLabcoat():void
{
	clearOutput();
	author("Savin");
	output("<i>“How about you go back to the lab coat look?”</i> you suggest.");
	output("\n\nOlympia scrunches her lips to the side, thinking. <i>“If you insist. I have to admit, that attire does bring back certain unpleasant memories. But the obvious appeal of the sexy scientist doesn’t escape me.”</i>");
	output("\n\nThat seems to be enough to convince her. Olympia " + ((olympia.armor is SteeleTechSuit) ? "slowly unzips her catsuit, letting the latex pool around her feet before stepping":"steps") + " over towards the drawer that holds all her belongings. She quickly retrieves her lab coat and undergarments, sliding them on with practiced ease. Once done, she gives you a slight nod. <i>“Done. Anything else, captain?”</i>");
	processTime(3);
	pc.lust(2);
	//actually set clothing.
	olympia.armor = new KhansLabCoat();
	showOlympia();
	clearMenu();
	addButton(0,"Next",olympiasClothes)
}

//Naked
//Olympia would look best au naturel.
public function olympiaNakkersLetsGo():void
{
	clearOutput();
	author("Savin");
	output("<i>“I think I’d rather see you in all your glory,”</i> you tell her, grinning as her cheeks flush for a split second. A smile creeps across Olympia’s crimson lips as she starts to slide her clothing off. She makes a bit of a show of it, slowly exposing the reddish swells of her breasts before bending down to pull down her garment over her cock. The half-hard rod pops free and wobbles heavily, swinging back and forth as she shakes her hips. Olympia’s tail flicks the last of her garment off to the side, leaving her in all her natural beauty.");
	output("\n\nOlympia grins at you, hands on her broad hips. <i>“Mmm, that feels much better. Nice to have a little fresh air on my skin, synthetic or not.”</i>");
	output("\n\nAnd it’s a nice view, too...");
	processTime(3);
	pc.lust(5);
	//actually set clothing.
	olympia.armor = new EmptySlot();
	showOlympia();
	clearMenu();
	addButton(0,"Next",olympiasClothes)
}

//Research
//Tooltip is either <i>“Put Olympia to work on a project.”</i> or <i>“Check in on Olympia and see how her work is going.”</i> depending on if she’s currently working on something or not.
public function olympiaResearch():void
{
	//9999 when ship systems exist for her to upgrade :(
}

//Attachments
//Talk to Olympia about any possible aftermarket parts she’s got access to.
public function olympiaAttachments():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("You reach down and pick up the gynoid’s synthscale-coated tail, grinning at the tip wriggles between your fingers. Olympia glances at you over her shoulder between calibration sets. <i>“Something you wish me to be using on my port, captain?”</i>");
	processTime(2);
	clearMenu();
	addButton(4,"Back",olympiaTalkingTimes,true);
	//[Her Dick] [Tailcocks] [Bubble Buddy]
	addButton(0,"Her Dick",olympiasDickTalk,undefined,"Her Dick","Talk with Olympia about the attachment hanging over her pussy.");
	addButton(1,"Tailcocks",olympiaTailcockTalk,undefined,"Tailcocks","Ask Olympia about tail attachments...");
}

//Her Dick
//Talk with Olympia about the attachment hanging over her pussy.
public function olympiasDickTalk():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("<i>“So, does your dick come off?”</i> you ask, reaching around and tapping her hip just above her crotch.");
	output("\n\nThe gynoid glances at you and frowns. <i>“Technically speaking, yes. Just about anything on my chassis can be removed were I so inclined. Limbs, eyes, my head.”</i>");
	output("\n\nThat didn’t <i>sound</i> like a yes.");
	output("\n\nShe rolls her eyes. <i>“If you’re asking if I’ll take my penis off, no. I may be synthetic in nature but I do consider myself a gryvain. In the same way that I am not inclined to remove my breasts or female organs, I don’t <b>wish</b> to remove it. I am more than happy to change tail-based attachments, however, if you are so inclined.”</i>");
	if(pc.isAss() || pc.isMischievous())
	{
		output("\n\n<i>“I could order you to take it off,”</i> you venture.");
		output("\n\nOlympia pauses in her work, just for a moment, before scoffing. <i>“You could, captain. And I will throw myself out the nearest available airlock before complying. Feel free to go captain another ship if my having a phallus offends you.”</i>");
	}
	processTime(3);
	clearMenu();
	addButton(0,"Next",olympiaAttachments);
}

//Tailcocks
//Ask Olympia about tail attachments...
public function olympiaTailcockTalk():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("<i>“So, tail attachments...”</i> you prompt.");
	output("\n\n<i>“Hm? Ah, yes. There are plenty of aftermarket options. I currently own ");
	//list Olympia’s owned dicks here. She comes with a doggy dick
	if(olympia.inventory.length == 0) output("a canine phallus");
	else if(olympia.inventory.length == 1) output(olympia.inventory[0].description + " and a canine phallus");
	else if(olympia.inventory.length == 2) output(olympia.inventory[0].description + ", " + olympia.inventory[1].description + ", and a canine phallus");
	else if(olympia.inventory.length == 3) output(olympia.inventory[0].description + ", " + olympia.inventory[1].description + ", " + olympia.inventory[2].description + ", and a canine phallus");
	else output("(ERROR. Please report this bug to the fenoxo.com forums with a copy of your save file - use the ‘save to file’ option.)");
	output(", though I don’t keep anything attached between uses. It... drags on the floor. Gets dirty; you don’t want that inside you. But I am more than happy to use anything that has the proper KihaCorp adapter. If you have one you’d prefer me to default to, I’m happy to comply.”</i>");
	processTime(2);
	clearMenu();
	//[Give Item] 
	if(olympia.hasItemByClass(ADCock)) addDisabledButton(0,"Gave Dragon","Gave Dragon","You already gave her a dragon wang.");
	else if(pc.hasItemByClass(ADCock)) addButton(0,"Give Dragon",giveOlympiaTailwang,"dragon","Give Dragon","Let’s see if you have anything Olympia can use... like this dragon-dick.");
	else addDisabledButton(0,"Give Dragon","Give Dragon","You don’t have a dragon phallus to give her.");
	if(olympia.hasItemByClass(AHCock)) addDisabledButton(1,"Gave Equine","Gave Equine","You already gave her a horse wang.");
	else if(pc.hasItemByClass(AHCock)) addButton(1,"Give Equine",giveOlympiaTailwang,"equine","Give Equine","Let’s see if you have anything Olympia can use... like this big floppy horse-dick.");
	else addDisabledButton(1,"Give Equine","Give Equine","You don’t have an equine phallus to give her.");
	if(olympia.hasItemByClass(ACock)) addDisabledButton(2,"Gave Terran","Gave Terran","You already gave her a terran wang.");
	else if(pc.hasItemByClass(ACock)) addButton(2,"Give Terran",giveOlympiaTailwang,"terran","Give Terran","Let’s see if you have anything Olympia can use... like this terran-modeled phallus.");
	else addDisabledButton(2,"Give Terran","Give Terran","You don’t have a terran phallus to give her.");
	//[Set Preference]
	if(olympia.tailGenitalArg == GLOBAL.TYPE_GRYVAIN) addDisabledButton(5,"Use Dragon","Use Dragon","Olympia is currently using a dragon-cock for her tail-dick.");
	else if(olympia.hasItemByClass(ADCock)) addButton(5,"Use Dragon",setOlympiaTailcock,"dragon","Use Dragon","Have Olympia use a dragon tail-cock during sex.");
	else addDisabledButton(5,"Locked","Locked","Olympia doesn’t have this tail-cock yet.");
	if(olympia.tailGenitalArg == GLOBAL.TYPE_EQUINE) addDisabledButton(6,"Use Equine","Use Equine","Olympia is currently using a horse-cock for her tail-dick.");
	else if(olympia.hasItemByClass(AHCock)) addButton(6,"Use Equine",setOlympiaTailcock,"equine","Use Equine","Have Olympia use an equine tail-cock during sex.");
	else addDisabledButton(6,"Locked","Locked","Olympia doesn’t have this tail-cock yet.");
	if(olympia.tailGenitalArg == GLOBAL.TYPE_HUMAN) addDisabledButton(7,"Use Terran","Use Terran","Olympia is currently using a terran penis for her tail-dick.");
	else if(olympia.hasItemByClass(ACock)) addButton(7,"Use Terran",setOlympiaTailcock,"terran","Use Terran","Have Olympia use a terran tail-cock during sex.");
	else addDisabledButton(7,"Locked","Locked","Olympia doesn’t have this tail-cock yet.");
	if(olympia.tailGenitalArg == GLOBAL.TYPE_CANINE) addDisabledButton(8,"Use Canine","Use Canine","Olympia currently uses her the canine attachment she came with.");
	else addButton(8,"Use Canine",setOlympiaTailcock,"canine","Use Canine","Have Olympia use the canine tail-penis she came with during sex.");
	addButton(14,"Back",olympiaAttachments);
}

//Give Item
//Let’s see if you have anything Olympia can use...
//You don’t have anything Olympia’s capable of using. (Locks Option)
public function giveOlympiaTailwang(arg:String):void
{
	clearOutput();
	output("You reach into your pack and search for something Olympia might find appealing...");
	//((Savvy note: Olympia can tack on any of the dicks Gianna can; I think Anno sells them all for some reason :P ))

	//Dragon Dick
	if(arg == "dragon")
	{
		olympia.inventory.push(new ADCock());
		pc.destroyItemByClass(ADCock);
		output("\n\n<i>“Oh, do you want me to fuck you with a matching set?”</i> Olympia teases as you produce the draconic dick. Now that you think of it, it does look remarkably like the one attached to her. The color’s off, but otherwise... same size, same shape. The moddable sexbot takes the limp dildo from your hand and balances it in her hand, weighing it studiously. After a moment, she nods approvingly and slots the back into her tail.");
		output("\n\n<i>“Oh!”</i> Mmm, it’s sensitive. New out of the box... thank you, captain. Would you care to take me for a test drive? I’m eager to feel a matched pair in action.”</i>");
	}
	//Horsedick
	else if(arg == "equine")
	{
		olympia.inventory.push(new AHCock());
		pc.destroyItemByClass(AHCock);
		output("\n\nOlympia’s eyes go wide when you present her with a massive, floppy horse-wang, complete with fat balls and meaty sheath.");
		output("\n\n<i>“That’s... quite large!”</i> Olympia laughs, taking it from you and hefting it from hand to hand. <i>“Are you sure you want to give this to me? I’d hate to inflict internal injuries on you by accident...”</i>");
		output("\n\n<i>“Where’s the fun without a little risk?”</i>");
		output("\n\nThe gynoid rolls her eyes and, with a little effort, twists the dildo’s balls and sheath off, leaving just the shaft and attachment point. <i>“There we go. Balls on a tail... how silly would that have looked? Well, captain, any time you’re ready to risk your organs, I’ll be ready to take this fuck-beast you’ve given me for a spin.”</i>");
		output("\n\nYou swear there’s a little smile on her face now...");
	}
	else if(arg == "terran")
	{
		olympia.inventory.push(new ACock());
		pc.destroyItemByClass(ACock);
		output("\n\n<i>“A... Terran phallus?”</i> Olympia drawls dryly, accepting the synthetic phallus with overt trepidation. <i>“How mundane. But, if it makes you happy, Captain, I suppose I’ll accomodate.”</i>");
		
		output("\n\nShe slots the limp dildo in with practiced ease, gasping softly as the nerves connect, and the cock starts to throb on her tail. <i>“Well, that doesn’t feel bad at all... for something so featureless. Care to show me what it can do?”</i>");
	}
	processTime(4);
	//consume item and put in her inventory.
	clearMenu();
	addButton(0,"Next",olympiaAttachments);
}

//Set Preference
//Choose which of Olympia’s owned dicks you’d like her to use.
//Just go to a list of her owned dicks. When the player makes a choice, update Olympia’s stats and play the following.
public function setOlympiaTailcock(arg:String):void
{
	if(arg == "terran") olympia.tailGenitalArg = GLOBAL.TYPE_HUMAN;
	else if(arg == "equine") olympia.tailGenitalArg = GLOBAL.TYPE_EQUINE;
	else if(arg == "dragon") olympia.tailGenitalArg = GLOBAL.TYPE_GRYVAIN;
	else if(arg == "canine") olympia.tailGenitalArg = GLOBAL.TYPE_CANINE;
	clearOutput();
	showOlympia();
	author("Savin");
	output("<i>“Looking forward to a taste of my [olympia.tailCock], then?”</i> your companion teases, brushing her currently-vacant tail slot against your thigh. <i>“I’ll keep that in mind. Now, anything else, captain?”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"Next",olympiaAttachments);
}

/*
//Bubble Buddy
//So, what about some more organic fluids?
//Must have done Her Model talk first.
public function olympiaBubblingBuddies():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	//First time var:
	if(9999)
	{
		output("<i>“You mentioned you can use Bubble Buddies?”</i>");
		output("\n\nOlympia nods absently, occupied with a small readout on the engine block. That’s the only response you get for several seconds until you finally venture, <i>“So how does that work?”</i>");
		output("\n\n<i>“As you might expect. The universal port in my tail has an attachment point to hook one of the ‘bubbles’ into, and drain it into my fluid reserves. Once done, I can store semen indefinitely for later personal use in either my normal or tail-mounted organs. My default silicone-based semen is hypoallergenic and sterile, simply processed in-house, shall we say, to resemble normal gryvain cum. If you’d prefer me to fill you up with something else, or if you want to see a specific fluid leaking out of me while you fuck me, just get me a BubbleBuddy and I’ll make it happen.”</i>");
		output("\n\nYou wonder aloud if Olympia has any preference for what effluvia she uses.");
		output("\n\n<i>“Not particularly. I’ve always found the recent trend of ejaculating sweets to be rather humorous, but beyond that... actually having <b>real</b> semen on tap would be quite thrilling. It’s almost impossible for you to tell the difference, of course, but my senses are tuned so highly that... well, the scent and sensation is exquisite. If you come across a BubbleBuddy full of normal semen, I’d be quite pleased to take it.”</i>");
	}
	else
	{
		//Repeat vers; only accessible if the PC has bubble on-hand. Produce a list of bubbles that the PC can give, and then play the following after selection:
		output("<i>“Hey, I got something for you,”</i> you say, leaning against the bulkhead and producing a jiggling latex bubble from your pack.");
		output("\n\nOlympia’s radiant eyes widen a moment, and then a lusty smirk plays across her lips. <i>“Oh? ");
		//small bubble:
		if(9999) output("Are you sure? I can barely see it! But I suppose it would be rude of me to refuse...");
		else if(9999) output(" A nice little bubble you’ve got there. I happily accept!");
		else if(9999) output(" My, that’s... certainly a bubble of cum! You’re really trying to tank me up, aren’t you? Just be ready to take all that back the hard way...");
		else output(" You call that a bubble?”</i> she laughs, reaching out and slapping the side of it. <i>“More like a medicine ball... all full of cum. You spoil me, captain.");
		output("”</i>");
		output("\n\nYou hear a little chuckle from the back of Olympia’s throat as she turns away from you and braces her hands on one of the engine’s valves. Her long, broad tail slithers off the ground and wiggles its circular crown at you, winking its internal muscles along the inner channel. Her tail’s its own fuckable pussy, almost, and the gold ring around its entrance seems about the perfect size to wrap the opening of a BubbleBuddy around - and so you do just that.");
		output("\n\nIt’s a surprisingly easy process to undo the knot on the bubble and wrap its lips around Olympia’s golden ring. The condom’s elastic band snaps tight around her tail-tip, forming a perfect seal as you ");
		if(9999smol/med) output("lift to bubble up for it to");
		else output("heft up the massive, cum-laden orb so it can");
		output(" drain directly into her hollow tail.");
		output("\n\nOlympia’s breath catches, a little moan rising as you start pouring the bubble’s contents into her. The synthetic scales of her tail swell and contract, swallowing the river of jizz you dump past them like a throat. Her back arches slowly, languidly, like the jizz dribble down her tail-pussy is every bit as good as a nice hard cock sliding in.");
		output("\n\n<i>“That’s nice,”</i> she murmurs softly, letting a hand fall from the engines to grope at her breasts. Her voice trails off into another throaty moan as you ");
		if(9999small/med) output("finish dumping the bubble’s contents down her tail.");
		else 
		{
			output("give the oversized cum-bubble a firm squeeze, shooting its gooey contents straight down her tail-pipe. She shivers with delight as you milk the slimey contents of the condom out, spurt by spurt until it’s finally flaccid... and Olympia’s ");
			if(olympia.armor is EmptySlot) output("thighs are");
			else if(olympia.armor is KhansLabCoat) output("panties are");
			else output("suit is");
			output(" soaked with arousal.");
		}
		output("\n\n<i>“Feels like it all went right to my stomach,”</i> the sexbot laughs, putting a hand on her belly as you snap the lip of the condom off her tail. She turns, putting her wingless back to the engine and lacing her fingers together just over her crotch, directing your eyes down to the ");
		if(!(olympia.armor is EmptySlot)) output("stiff tent");
		else output("diamond erection");
		output(" she’s sporting. <i>“So, you’re going to help me work that off, aren’t you?”</i>");
		output("\n\nMaybe you’ll do just that...");

		//Immediately append Olympia’s sex menu; include Leave button as normal.
		//Change Olympia’s cumtype and cumVol to reflect the bubble buddy she’s just used.
	}
}*/

//Sex
//See if the sexy genius before you is up for a little rest and relaxation...
public function sexWithOlympia():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("You slip a little closer to the draconic sexbot and set an arm around her egg-bearer’s hips, enjoying the feeling of your fingers sinking into her " + ((olympia.armor is SteeleTechSuit) ? "latex suit":"bare flesh") + ". Olympia’s tail sways behind her, tip rubbing against your [pc.leg], and your [pc.hips] press into hers.");
	output("\n\n<i>“Something on your mind, captain?”</i> she asks innocently, glancing at you as she subtly starts winding down what she’s working on.");
	if(pc.isBimbo() || pc.isMischievous()) output("\n\n<i>“Yeah: you,”</i> you say, giving her a playful wink.");
	else output("\n\n<i>“Just that you need some R&R,”</i> you suggest.");
	output("\n\nOlympia raises an eyebrow and curls her tail all the way around your [pc.leg]. <i>“Is that so? Well then, captain, your command is my wish...”</i>");
	processTime(3);
	pc.lust(5);
	olympiaCrewSexMenu();
}

public function olympiaCrewSexMenu():void
{
	//[Get Tailfucked] [Ride Her] [Fuck Missionary] [Fuck Her Butt]
	clearMenu();
	addButton(0,"Get Tailfuck",olympiaTailfucksYouRouter,undefined,"Get Tailfucked","Let Olympia use her exotic tail-cock to fuck you silly.");
	addButton(1,"Ride Her",vaginaRouter,[rideOlympiaWheeee,olympia.cockVolume(0),1,0],"Ride Her","Take Olympia back to your cabin and ride that draconic cock of hers.");
	addButton(2,"Missionary",cockSelect,[olympiaMissionaryFuck,olympia.vaginalCapacity(0),true,0],"Fuck Missionary","Take Olympia back to your cabin and spread her legs to get at that synth-sheathe between them.");
	addButton(3,"FuckHerButt",cockSelect,[fuckOlympiasAsshole,olympia.analCapacity(),true,0],"Fuck Her Butt","Bend Olympia over and enjoy that brick house bouncing behind her.");
	addButton(14,"Back",approachOlympia,true);
}

public function olympiaTailfucksYouRouter():void
{
	if(pc.hasVagina()) 
	{
		clearOutput();
		showOlympia(true);
		showName("WHICH\nHOLE");
		output("Where should she put it?");
		clearMenu();
		addButton(0,"Vagina",olympiaTailfucksYou,true);
		addButton(1,"Ass",olympiaTailfucksYou);
		return;
	}
	olympiaTailfucksYou();
}
//Get Tailfucked
//Let Olympia use her exotic tail-cock to fuck you silly.
public function olympiaTailfucksYou(cunt:Boolean = false):void
{
	clearOutput();
	showOlympia(true);
	author("Savin");
	output("<i>“How about I help you blow off some steam?”</i> you offer, turning and wiggling your [pc.hips] at the draconic gynoid.");
	output("\n\n<i>“Very generous, captain,”</i> Olympia grins. She steps up behind you, settling her hands on your hips and pushing you forward. Your arms brace against one of the Engineering consoles, holding you steady as your synthetic lover’s hands wander all over, stripping away your " + (!pc.isAssExposed() ? "clothes and ":"") + "gear with slow, determined motions. Every so often she stops to squeeze an ass-cheek or run her hand over ");
	if(pc.hasCock()) output((pc.hasCocks() ? "a":"your") + " stiffening dick");
	else if(pc.hasVagina()) output((pc.hasVaginas() ? "a":"your") + " naked puss");
	else output("your barren groin");
	output(", eliciting little gasps and moans of pleasure from you.");

	var x:int = -1;
	if(pc.hasVagina() && cunt) x = rand(pc.totalVaginas());
	output("\n\nOlympia sticks two fingers in her mouth, lubing them up before thrusting them knuckles-deep in your [pc.vagOrAss " + x + "]. She’s strong when she wants to be, as forceful as the dragon she’s shaped to mimic; her digits bury themselves in you despite your muscles’ clenching against them. Wetness spreads quickly over the first inchest of your inner channel, moistening your muscles with quick, shallow thrusts before the sexbot pulls back and wipes her fingers dry on your bare ass-cheek.");

	output("\n\n<i>“You have a magnificent rump, captain,”</i> Olympia purrs, continuing to rub your cheek. <i>“");
	//Small butt:
	if(pc.buttRating() < 6) output("Nice and tight and firm. It suits you well!");
	else if(pc.buttRating() < 10) output("The perfect mix of jiggle and firmness. An ass like this can drive a girl crazy...");
	else if(pc.buttRating() < 16) output("Almost as much ass as I’ve got, and so bouncy that I could spank it all day long.");
	else output("Like, damn. I could just shove my face in here and suffocate... if I needed to breathe, anyway.");
	output("”</i>");

	output("\n\nShe punctuates her assessment of your ass with a playful slap, just hard enough to make you rock forward against the console. You ass quivers from the impact, and then a second one from your lover’s tail while Olympia sashays over to a nearby drawer and slides it open. You’re left to watch as the gryvain-bot goes through the content of her desk, moaning as her tail plays with your butt until she finally alights on her chosen attachment.");
	output("\n\n<i>“Is this what you wanted?”</i> she purrs, curling her tail back and aligning the port at its tip with the base of her toy. <i>“You bend over and present to a dickgirl, and I’ve just got to assume you’re craving my [olympia.tailCock]. Aren’t you?”</i>");
	output("\n\nYou nod shamelessly, watching with hungry eyes as the hermaphrodite sexbot slides her tail attachment home with a satisfying <b>click</b>. She runs her fingers up the shaft, and suddenly the once-flaccid material throbs to life. Olympia stifles a little moan, and then turns her eyes to you. <i>“Everything’s working optimally. Ready to begin?”</i>");
	output("\n\nShe cuts you off with another strike over your ass, this time with the broadside of her [olympia.tailCock]. After the impact, she drags her ancillary schlong along the crest of your [pc.butt], letting you feel every veiny inch on the way down until the crown of Olympia’s [olympia.tailCock] is grinding " + (x >= 0 ? "between the lips of your pussy":"against the ring of your ass") + ".");
	output("\n\n<i>“It’s amazing how these attachments work,”</i> she murmurs, pressing her hips to your rear. Her tail-cock humps against your hole, and you feel a second, meatier dick fall between your cheeks. <i>“One moment it’s just a lifeless toy, and the next? I can feel it like part of my own body, like it’s always been a part of time... and I feel my libido going crazy with new stimulation. If I weren’t so strong-willed, I don’t know if I could stop myself from just pinning you down on that console and fucking you like a feral beast until you or it breaks.”</i>");
	output("\n\nB-but that’s what you <b>want</b>!");
	output("\n\nYou can almost feel the smirk on Olympia’s dark lips as her tailcock slides across your [pc.vagOrAss " + x + "], aligning with your entrance. Her other dick rubs itself through your crack, throbbing hotly between your cheeks. You rock back against her, feeling her shaft thrust up and her [olympia.tailCock] press against your " + (x < 0 ? "ass":"pussylips") + ", so close to sliding in that you can taste it.");
	output("\n\n<i>“Fuck me,”</i> you tell her. You can’t decide if you’re commanding or begging, but damn do you need it. <i>“Fuck me!”</i>");
	output("\n\n<i>“As you command, captain,”</i> Olympia promises. A second later and " + (x >= 0 ? "her tailcock is spearing through your drooling lips.":"you feel the mounting pressure on your backdoor reach a peak. Then she’s inside you, sliding through your spit-lubed ass with slow determination.") + " Your back goes rigid, muscles contracting around the sudden invasion. She goes <b>deep</b> on that first thrust, pushing tailmeat into you until ");
	if(olympia.tailGenitalArg == GLOBAL.TYPE_EQUINE) output("the medial ring is wedged inside you");
	else if(olympia.tailGenitalArg == GLOBAL.TYPE_CANINE) output("the knot is wedged between your cheeks");
	else if(olympia.tailGenitalArg == GLOBAL.TYPE_GRYVAIN) output("the bulbous base of her draconic member batters your ass-cheeks");
	else output("she’s fully buried inside you.");
	output(" Olympia lets out a little sigh, cocks twitching as she settles in.");

	output("\n\n<i>“Oh, that’s nice,”</i> she sighs. <i>“You were right, captain... I think I do have some steam to work off.”</i>");
	output("\n\nShe leans in, breasts pressing against your back and lips teasing your [pc.ear]. <i>“I hope I don’t break you.”</i>");

	output("\n\nOne of her hands closes around the back of your neck, pushing your down on the console as her tail wriggles inside you, thrashing like a bucking bronco. A whorish moan escapes your lips through gritted teeth as her tail swishes back and plunges in again, forcefully pounding your [pc.vagOrAss " + x + "]. Her other cock thrusts against your [pc.butt] with every buck of her hips, hands squeezing your cheeks together to make the closest proxy of a pussy for her to fuck. You can feel the heat of her cocks, the throbbing erections and the beading pre at their crowns inside you and out.");
	if(x >= 0) pc.cuntChange(x,olympia.tailCockVolume());
	else pc.buttChange(olympia.tailCockVolume());

	var olympiaCumQ:Number = olympia.cumQ();
	//Olympia has huge cumvol:
	if(olympiaCumQ >= 5000) 
	{
		output("\n\n<i>“Fuck... I feel like I’m so backed up thanks to you!”</i> the gynoid complains, raking her nails across your cheeks. <i>“That last bubble was so damn thick... but you were looking forward to this, weren’t you? Getting stuffed full of real, piping-hot cum saved up just for you.”</i>");
		output("\n\nShe groans, hips grinding hard against your ass, like she can barely restrain herself from cumming already. Maybe you overdid it!");
	}
	output("\n\n<i>“I’m not quite done with you yet,”</i> she says, as much to herself as you. <i>“Can’t let myself cum so soon...”</i>");
	output("\n\nOne of Olympia’s hands grips your shoulder, and the other tightens on your [pc.hip], holding you steady as her crotch starts to really <b>pound</b> you. Even as her hips make shallow thrusts, her tail has more than enough dexterity to plow its whole length in and out of you all on its own. Every second, her tail-dick goes from barely spreading you open to burying itself hilt-deep with enough power to make your whole body rock forward in Olympia’s arms. Your [pc.vagOrAss " + x + "] burns with pleasure, quivering with every deep thrust your lover delivers" + (pc.hasCock() ? " while your [pc.cocks] wobbles between your thighs. Pre starts to leak from your crown, drooling onto the deck in slimey ropes":"") + ".");
	output("\n\nYou can hear Olympia’s breath quickening, a programmed response to her efforts that makes her seem just that much more real. Her breasts heavy against your back, dusky nipples tracing your shoulders every time her broad hips slap against your ass. Her dick’s leaving a slimey trail of pre over your [pc.skinFurScales] now, thicker and thicker as her lusts grow. You know she’s close, she has to be, but every thrust is pushing you closer to your own edge. Closer and closer, moaning like a whore as the twice-hung gynoid takes you.");
	output("\n\nYour endurance cracks before Olympia’s does. What else would you expect, letting a bonafide sexbot have her way with you? Your teeth grit, trying to hold back your wanton moans of orgasmic pleasure as your ");
	if(pc.hasCock()) output("dick squirts down your thigh, [pc.cumColor] streaks spilling down your [pc.skinFurScales]");
	else output("[pc.vagOrAss " + x + "] starts going wild, squeezing madly around the plunging shaft of Olympia’s [olympia.tailCock].");
	output("\n\n<i>“That’s it, captain! Cum for me,”</i> she growls, voice husky in your ear. <i>“Show me just how much you love it.”</i>");
	output("\n\nYou couldn’t hide it anymore if you tried.");
	output("\n\nYour moans reach a crescendo, milked out by her steady thrusts - and in turn, your body works like mad to milk her [olympia.tailCock]. The stacked dragon growls, cocks throbbing in and against you, thrusting deep through your howling orgasm. You feel Olympia’s dick give its most powerful throb yet, swelling with potent need and leaking warmth into your [pc.vagOrAss " + x + "]... and then the dam breaks as your own orgasm’s nearly passed. A sudden surge of steaming-hot cum sprays into your battered " + (x >= 0 ? "womb":"ass") + ", hitting you in just the right spot to keep your climax raging on. More [olympia.cum] splatters across your back, leaving rivers of [olympia.cumColor] drooling down your flanks. Her primarily dick wedges itself between your ass-cheeks, humping your [pc.butt] while her tail fills you");
	//high olympia cumVol:
	if(olympiaCumQ >= 10000) output(" until your belly is stretched gravid by her impossible load");
	output(". Her claws rake your hips, hard enough to make you cry out amidst the last aftershots of her orgasm.");
	output("\n\nWhen her climax finally passes, Olympia sighs heavily and wraps her arms around your waist. Her breath comes hard and hot despite her synthetic nature, an uncanny mimicry of a real humanoid after a good, hard fuck. <i>“That was... a workout. You know just how to drive me mad with lust, captain. But I think you like it when I go all-out on you, don’t you?”</i>");
	output("\n\nYou can’t help but nod, leaning back against the draconic gynoid as she slips a hand up and cups your cheek, craning your [pc.face] around so she can kiss you. While your lips mingle, her cock slithers out from your batthered hole, leaking the last of its load down your thighs as she pops free. <i>“Thank you, captain... you were right. Sometimes it’s nice to unwind...”</i>");
	output("\n\nShe leaves you bent over the console, slowly recovering as your lover returns to her work.");
	processTime(25);
	pc.orgasm();
	if(x >= 0) pc.loadInCunt(olympia,x);
	else pc.loadInAss(olympia);
	IncrementFlag("OLYMPIA_SEXED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Ride Her
//Take Olympia back to your cabin and ride that draconic cock of hers.
public function rideOlympiaWheeee(x:int):void
{
	clearOutput();
	showOlympia(true);
	author("Savin");
	output("You take Olympia by the hand, smiling as her scaled digits close around your own, and lead her towards the hatch to the crew quarters. There’s a moment of discomfort and hesitation when she first steps away from the engines, but it lasts only a moment before she falls in line and lets you lead her out of her workspace. Every few seconds, you can feel her muscular tail sweep around to brush your thighs or rub against your ass, putting a spring in your step all the way to your quarters.");
	output("\n\nBy the time you reach your quarters and turn to face you synthetic lover, she’s ");
	if(olympia.armor is EmptySlot) output("already rock hard with her own arousal, tail wrapping around the base of her draconic shaft.");
	else if(olympia.armor is KhansLabCoat) output("so hard that her panties are sliding down her thighs under the pressure from her draconic cock. Her lab coat is sagging down her shoulders, retained only by the single button straining under her bust.");
	else output("already zipped her black-and-gold jumpsuit halfway down, revealing the crimson mounds of her cleavage straining the front of her uniform with every breath.");
	output(" As soon as the hatch seals behind you, you slip closer to the draconic sexbot and let your hands run up her bare chest, feeling those satin-soft mounds");
	if(olympia.armor is KhansLabCoat) output(" as you strip away her coat");
	else if(olympia.armor is SteeleTechSuit) output(" as you peel her uniform off around them");
	output(".");

	output("\n\n<i>“So that’s what gets your attention?”</i> she chuckles, putting her hands on yours. She guides you to her stiffening rust-red nipples, and you hungrily run your thumps across their pebbly heights. It isn’t long before you become aware of something hot and rigid pressing against your thigh, throbbing with need. Looks like you’ve gotten her attention in turn, it seems...");
	output("\n\n<i>“Well, captain?”</i> she murmurs, playing her hands down to your own loins and copping a feel. <i>“How do you want me?”</i>");
	output("\n\n<i>“On your back,”</i> you answer with a grin, spinning the dragon-bot around and pushing her towards the bed. She saunters back" + (!(olympia.armor is EmptySlot) ? ", shedding the last of her clothes as she goes":"") + " and sits herself on the foot of your bed. She leans back, wrapping a hand around the turgid shaft of her dick and spreading her legs; an invitation to come on and mount your big dragon-girl.");
	output("\n\nYou " + (!pc.isCrotchExposed() ? "strip off your own clothes and ":"") + "saunter forward, setting your hands on Olympia’s shoulders and pushing her back onto the bed. Her breasts sprawl out, jiggling as her back impacts the blankets, drawing your hands towards them like moths to flame. You give them both a firm squeeze, feeling her warm synth-flesh between your fingers. You climb into the bed over her while you knead your lover’s tits, straddling her broad hips and letting her rock-hard dragon dick press against your [pc.skinFurScales].");
	output("\n\nNow <i>that’s</i> what you want! You get your hands around her throbbing shaft and rock your hips forward, grinding her girth against your [pc.belly]. Olympia groans, wiggling back in the bed as you hump her stiff pole again and again. Every thrust brings her tapered crown a little closer to your [pc.vagOrAss " + x + "], inch by inch until her synthcock is pressing against your entrance.");
	output("\n\n<i>“Ready to lay the dragon, then?”</i> Olympia teases, slapping your [pc.butt] with the tip of her tail. Her hands come to rest on your [pc.hips], pulling you straight down on her reptilian dick.");
	output("\n\n<i>Damn right I am</i> you think, clenching hard around her cock to stop your descent halfway down her synthetic mast. Olympia gasps, unprepared for your sudden resistance, and again when you squeeze your hands on her breasts, using them as leverage to push yourself back up her rod despite her pulls.");
	output("\n\nShe grits her teeth, glowing gold eyes narrowing to bright slits. <i>“I guess you want to fight for it? Fine, captain. Let me flex my claws!”</i>");
	output("\n\nWith a playful little roar, Olympia sits up and grabs your shoulders, forcing your [pc.chest] against her pillowy tits. Her hands keep going, raking her sharpened nails across your [pc.skinFurScales] just hard enough to make your wince; they cross your neck and up to your cheeks, holding you steady while the dragoness locks eyes with you.");
	output("\n\nSomehow, you feel that this situation has suddenly reversed; your momentary control wrest away as Olympia leans against you, holding you close. Her lips brush yours, just for a moment, and her forked tongue flicks across your [pc.lipsChaste]. In that moment, all your resistance slips away from you, and you melt into the draconic gynoid’s tender embrace. Your [pc.vagOrAss " + x + "] glides down her length in a heartbeat, sending a shuddering gasp of pleasure through you and onto her dark red lips.");
	if(x >= 0) pc.cuntChange(x,olympia.cockVolume(0));
	else pc.buttChange(olympia.cockVolume(0));	
	output("\n\n<i>“I <b>was</b> made for this, you know?”</i> Olympia smirks, gently thrusting up into you. <i>“The perfect partner for the perfect captain.”</i>");
	output("\n\nShe knows just how to get to you. Your body just wants to go limp in her arms, to let the mighty dragon take you any way she wants. Her thick dragon-dick throbs inside you, stretching your [pc.vagOrAss " + x + "] around its girthy curves");
	var olympiaCumQ:Number = olympia.cumQ();
	//huge load:
	if(olympiaCumQ >= 5000) output(" and leaker her potent bubble-load inside you, adding an extra layer of lubricant to her thrusts");
	output(". You know you’ve gotta regain control soon, or she’s just going to bounce you in her lap until you cum.");

	output("\n\nYour hands tighten on Olympia’s breasts, bringing the dusky mounds up to meet your [pc.lipsChaste]. One good suck on a rust-hued teat is enough to make her stop mid-thrust, moaning as your hands cup and caress her in all the right ways. It slows her down just long enough for you to calm your frayed senses, pulling yourself back from the edge before Olympia starts thrusting again. This time she takes it slow, lifting you from her lap before rocking her hips up to meet your [pc.butt].");
	output("\n\nEvery thrust threatens to shatter your resolve, sending shockwaves of pleasure rippling through your loins all the way up to your teeth. Finally, realizing you can’t wrestle this sexual savant into submission, you realize there’s only one recourse left: if you can’t beat ‘em, join ‘em. So you start rising on your [pc.knees], adding your own momentum to your dragon ride. Olympia favors you with a smile, and her hips start to move faster, hammering her thighs against your [pc.butt]. Fuck, that’s good. Every time her cock sinks into you is an eruption of pleasure, and now her shaft is leaking a searing-hot slather of pre into you. It smears across your inner walls, and then next thrust glides through the slime.");
	output("\n\nBy the time you feel your orgasm building again, Olympia isn’t far from her own. Her breasts are heaving, nipples rubbing against you with every breath");
	//tech:
	if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" - why <i>does</i> she even breathe, anyway? Probably to make her seem more real");
	output(". Her tail’s curled around your [pc.leg], squeezing rhythmically to the beat of her thrusting hips. <i>“Synchronize with me, captain,”</i> she breathes, voice little more than a whisper. <i>“Come on!”</i>");
	output("\n\nHer command is all it takes to break the last of your resolve. You moan as orgasm washes through you, crashing through your body from your [pc.vagOrAss " + x + "] outwards. Your climax is complimented by your lover’s throbbing dragon-cock erupting in a surge of wet heat. Her cum smears your inner walls, filling your [pc.vagOrAss " + x + "] with rhythmic squirts of [olympia.cum]. Her claws rake your thighs, holding you tight on her bulbous base ");
	//smol/medium cum:
	if(olympiaCumQ < 500) output("until every last drop has poured into your " + (x >= 0 ? "womb":"bowels") + ".");
	//large:
	else if(olympiaCumQ < 10000) output("while her cock pours what feels like a gallon of steamy-hot [olympia.cum] directly into your hungry hole.");
	else output("while her cock injects you with gallons of [olympia.cum]. It’s a blink of an eye before your stomach is bulging with the sheer gravid mass of her orgasm, and the excess is leaking out of your [pc.vagOrAss " + x + "] onto the bedsheets.");
	output("\n\nWith a contented sigh, Olympia lays back on the bed and laces her fingers under her head, fixing you with those golden eyes of hers as you twitch and moan on her cock through the aftershots. When your muscles finally give out, her pillowy tits are there to catch your [pc.face], and her arms wrap around you while she slowly softens inside you.");
	output("\n\n<i>“Now that... was a pleasant diversion, captain. Now...”</i>");
	output("\n\nYou put a finger to her lips and shush her. No, it’s not time to get back to work. Right now, it’s time to bask in the fullness your feeling.");
	processTime(30);
	if(x >= 0) pc.loadInCunt(olympia,x);
	else pc.loadInAss(olympia);
	pc.orgasm();
	IncrementFlag("OLYMPIA_SEXED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Fuck Missionary
//Take Olympia back to your cabin and spread her legs to get at that synth-sheathe between them.
public function olympiaMissionaryFuck(x:int):void
{
	clearOutput();
	showOlympia(true);
	author("Savin");
	output("You put an arm around the synthetic dragon’s inhumanly broad hips and pull her close, feeling ");
	if(olympia.armor is SteeleTechSuit) output("the tight latex around her crotch stiffening against your thigh.");
	else if(olympia.armor is KhansLabCoat) output("her bulging panties rub against your thigh. They’re about ready to rip with how rigid her cock’s getting, just from your gentlest touch.");
	else output("her naked flesh pressing against your thigh. Her tapered dragon-dick rubs against your [pc.skinFurScales] with rising desire.");
	output(" She curls her tail around your [pc.leg], squeezing just enough to let you know she wants you.");

	output("\n\nWithout a word, you use your leverage over the mighty dragon to angle her out the hatch and towards the captain’s quarters. Olympia lets you push her along, grinning and swishing her tail as your hands migrate to her ass, groping and squeezing the massive mounds of supple synth flesh. By the time you’ve finally arrived in your quarters, you’re breathing hard with anticipation, [pc.cockOrStrapon " + x + "] turgid after watching your lover’s quaking cheeks.");
	output("\n\nWhen she arrives in the bedroom, Olympia ");
	if(!(olympia.armor is EmptySlot)) output("sheds her clothes with a slow, sexy confidence and ");
	output("bends down to touch her toes, exposing every inch of crimson-touched draconic syntheflesh to your wandering eyes. <i>“Something on your mind, captain?”</i> she murmurs, swaying her broad hips side to side. <i>“Or are you just admiring the view?”</i>");
	output("\n\nShe knows just how much she drives you wild. Alright, fine. You shed your gear and stride forward, grabbing her rump in both hands and squeezing. Your [pc.cockOrStrapon " + x + "] pushes between her meaty thighs, sliding between pliant, soft synth-flesh. Olympia moans and rocks back, rubbing her ass against your hips and curling her tail around you. Yeah, there’s a lot to admire here alright...");
	output("\n\n...But you’d rather see this draconic beauty’s face when you fuck her. You give her a push forward onto the bed, and she’s all too happy to roll over and spread her legs, letting her rust-red rod wobble freely. You get your fingers around it and give her a few quick pumps, enough to make Olympia’s thick pussylips wink and her back arch with a gasp of pleasure. <i>“C-captain...?”</i>");
	output("\n\n<i>“Just admiring everything,”</i> you say with a wink. Slowly, your hands migrate down to her thighs, spreading them further apart so you can get a good look at that clitless slit of hers. Just like a gryvain’s, it’s a smooth opening with fat lips and no hood; all her myriad clits are buried deep inside, ribbing her entrance for your pleasure. Moisture beads from it and from the crown of her dick, tempting you to lean down and run your [pc.tongue] through her opening.");
	output("\n\nAnother gasp, this time accompanied by a weighty throb through her cock. A bead of [olympia.cumNoun] drools down from the crown of it, slowly meandering down her veiny length until it smears across her knot-like hilt. That’s what you like to see. Satisfied that she’s already on edge just from your lightest teasing, you mount the bed and push her cock down against her belly, trapping it between your bodies as your own [pc.cockOrStrapon " + x + "] thrusts between her lips, so close to penetration before deflecting up through her channel. Olympia gasps, and her mighty legs lock around your [pc.hips].");
	output("\n\n<i>“Don’t tease me,”</i> she breathes, pulling you flush against her body. Breasts and leaking dick rub against your [pc.skinFurScales]. <i>“I want you, <b>need you</b>, too much...”</i>");
	output("\n\nThe feeling’s mutual. So you reach your hands up to cup the dragoness’s cheeks and lock lips with her, melting her vice-like grip on you just enough to wiggle your [pc.hips] and line your [pc.cockOrStraponHead " + x + "] with her quim. Her body beckons you in, swallowing your tip as your hips slowly press in. From the moment you first thrust until your ");
	if(x >= 0 && pc.hasKnot(x)) output("[pc.knot " + x + "]");
	else output("crotch");
	output(" comes to rest flush against her mons, Olympia’s voice is a single long, lewd moan that sings through the cabin.");
	if(x >= 0) pc.cockChange();
	output("\n\nYour hands slip down from her cheeks, feeling their way up the quaking inclines of her breasts. Her dusky teats are stiff as diamonds against your palms, begging for your touch. While your [pc.hips] slowly grind against Olympia’s, you trace your [pc.lipsChaste] down her chest until they find one of those chocolate teats, playing it between your teeth while your lover’s pussy squeezes around your length.");
	output("\n\nOh, she likes that.");
	output("\n\nYou roll the very tip of her stiff mount in your mouth and lavishing the flesh beneath it with your [pc.tongue]. Every flick of your tongue causes a firm throb to run op the draconic cock pinned between your bodies, and a warm wetness smears across her belly. When your [pc.cockOrStrapon " + x + "] strikes deep again, you’re able to feel just how much your lover wants it: she throbs and squirts, crooning into your shoulder as your shaft glides over her myriad clits. [olympia.Cum] rolls down the sides of her stomach and pools in her navel, running thicker with every [pc.knot " + x + "]-deep thrust. It feels like she’s already on the cusp of orgasm, and you’ve barely started.");
	output("\n\n<i>“I can’t help but be a gryvain,”</i> she laughs. <i>“Every thrust feels like a damn orgy in my vag. Don’t stop... I’ll cum as many times as it takes for you.”</i>");
	output("\n\nAs if to prove the truth of her worlds, Olympia’s pussy tightens around your [pc.cockOrStrapon " + x + "] and a long lance of [olympia.cum] shoots from the crown of her draconic dick, spraying between her tits all the way to her neck. She only looks more beautiful with her self-inflicted pearl necklace glistening in your cabin’s light, though plenty more of her first orgasm has wasted itself across the bottoms of her breasts and her soft stomach. Stars but she’s covered in it, and her dick’s not drying out.");
	output("\n\nAll you can do is keep going, as she demands. Though the way her legs tightly grip your hips arrests your speed, you steadily pick up the pace on her, thrusting your [pc.cockOrStrapon " + x + "] deep through her clit-encircled channel. Her claws rake your back, holding you tight while your hips piston down on her. As you steadily speed things up, the bed creaks beneath you, accepting the pounding as much as Olympia’s voluptuous frame does. Then again, she’s got so much cushion for your pushin’... your hands are wandering all over her now, squeezing hips and thighs and belly between inevitable returns to those succulent mountains on her chest.");
	output("\n\nInevitably, your hands end up running through the growing rivers of Olympia’s [olympia.cum], but she’s perfectly happy to lick the glazing clean when you present her with your slimey fingers. Her slender lizard’s tongue curls around each digit, sucking off her own cum as quick as you please.");
	output("\n\nOf course, her mouth’s not the only hole hungry for cum. Her pussy’s a soaked mess, desperately clenching around your [pc.cockOrStrapon " + x + "]. Every orgasm that rocks her body causes her pussy to seize up on you, tightening so hard that it takes all the force you can muster to thrust in again. It’s so very worth the effort, though; feeling her pussy mould itself around you, rubbing every inch of " + (x >= 0 ? "cockflesh":"coruscating hardlight") + " with her many clits. Every time your prick returns to her vice-like embrace brings you another step closer to climax.");
	output("\n\nYou reach your peak at a breathy command from your gynoid lover: <i>“Cum with me, captain.”</i>");
	output("\n\nThat’s an order you don’t dare defy. Locking lips with Olympia one last time, you slam yourself hilt-deep");
	if(x >= 0 && pc.hasKnot(x)) output(", wedging your [pc.knot " + x + "] in her");
	output(" as you finally join in her endless orgasms.");
	var cumQ:Number = pc.cumQ();
	//Strapon: 
	if(x < 0) output(" Your hardlight feeds back a mind-numbing cascade of pleasures, assailing your nerves from loins to eyes.");
	//smol cum: 
	else if(cumQ < 25) output(" A sweet little squirt of your [pc.cum] pours into her waiting pussy, milked out by those quivering clits running along your shaft.");
	//med cum:
	else if(cumQ < 1000) output(" You deposit a fat load of [pc.cum] straight through those clenching pussy-walls and into her deepest depths.");
	else output(" Your [pc.cockOrStrapon " + x + "] floods her with your massive load, filling her pussy with just the first squirt. The second stretches her, forcing her synthetic frame to accomodate the inhuman mass sloshing in her sex. Her stomach tightens against your [pc.belly], rubbing her leaking cock between you until another orgasm leaves Olympia a moaning, squirting mess.");

	output("\n\nA hand strokes your cheek as the last of your orgasm passes. Olympia’s fiery gold eyes wander over your [pc.face], before she finally manages a fatigued smile. <i>“Captain...”</i>");
	output("\n\nYou gasp as her muscles ripple, hilt to crown" + (x >= 0 ? ", bathed in your own spunk":"") + ". She grins a little wider, prompting you to lean down and give the dragon-slut a kiss. The [olympia.cum] glaze clinging to her dusky synth-skin glistens as your bodies part, shimmering as it slowly drools down her ribs.");
	output("\n\n<i>“I’m more used to being covered in engine grease, but... this is nicer,”</i> she laughs. <i>“Perhaps I should bathe before returning to duty.”</i>");
	output("\n\nOlympia slowly disentangles herself and turns towards your bathroom, giving you a wink over her shoulder as she moves off. You just lean back in bed and watch those red mountains of scaled ass-cheeks swaying off until the door slides closed.");
	output("\n\nHate to see her leave, but love to watch her go...");
	processTime(30);
	if(x >= 0) olympia.loadInCunt(pc,0);
	pc.orgasm();
	IncrementFlag("OLYMPIA_SEXED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Fuck Her Butt
//Bend Olympia over and enjoy that brick house bouncing behind her.
public function fuckOlympiasAsshole(x:int):void
{
	clearOutput();
	showOlympia(true);
	author("Savin");
	output("You nod towards one of the engineering consoles nearby, one with a flat top at the height of Olympia’s waist. <i>“I think you dropped something over there.”</i>");
	output("\n\n<i>“Oh?”</i> she asks innocently, walking over with an exaggerated sway in her hips that commands your full attention. <i>“Over here?”</i>");
	output("\n\nOlympia leans over the console, stretching out to her full length. Her breasts press heavily against the top of the metal, and her wide ass spreads out in front of you" + ((olympia.armor is SteeleTechSuit) ? ", straining the sheer material of her jumpsuit to the absolute limit":"") + ". God <b>damn</b>, that ass though. You can’t help but sidle up behind the draconic gynoid and sink your hands into her fleshy rear, getting both hands around it and squeezing until assflesh is spilling up between your fingers. Her tail wiggles between your arms, wrapping around your neck and pulling you in towards her spankable flanks.");
	output("\n\n");
	if(olympia.armor is EmptySlot) output("She’s already naked, and her pussy’s dripping for you. ");
	//Coat:
	else if(olympia.armor is KhansLabCoat) output("You slip a hand under her panties, feeling the wet heat radiating from her pussy as you slide them down around her thick thighs. ");
	else output("If you don’t do something about it, Olympia’s jumpsuit looks like it’s gonna rip around her beefy buttocks. You grab the zipper between her tits and yank in down, letting those russet mounds spill free onto the cold metal while you pull the zipper all the way to her waist. The gynoid glances at you over her shoulder, obediently allowing you to peel the tight latex off her and get access to that booty.");
	output(" You give her ass a sharp slap, watching with glee as the pillowy flesh quakes with the impact.");
	output("\n\n<i>“Should I brace for impact, captain?”</i> she laughs, wagging her ass side to side.");
	output("\n\nNo, she hasn’t been a bad enough girl to warrant a real spanking; you just like seeing her hypnotizing curves a movin’. Instead, you knead her plush cheeks and spread ‘em apart, opening the deep crevasse so you can really get a good look at her gryvain pussy and the thick mound of her anal ring. That blackest of holes winks deliberately at you, a visible open and close to remind you that your lover’s got some truly superhuman muscle control awaiting your pleasure.");
	output("\n\nAll you can think to do is start peeling off your gear, leaving Olympia to watch from her sprawling perch. When you’ve finished, you drop your [pc.cockOrStrapon] straight into the valley of her rump’s cleavage. Olympia gasps, biting her lower lip with unfettered lust as you slowly push your thighs forward against her fat cheeks. Your dick rubs heavily against her pussy and ass, making the gynoid clench both holes with little moans of pleasure.");
	output("\n\nHer asscheeks are hefty enough that, without your hands to spread them, they clap back together and bury your [pc.cockOrStrapon] in quaking booty. Fuck that feels good; it’s as tight and warm as a pussy, beckoning you to start thrusting into her ass-cleavage. Olympia giggles and pushes her rear back against your [pc.hips], helping you to ram every inch of dick as deep as you can between her cheeks.");
	output("\n\n<i>“Is everything up to spec back there, captain?”</i> Olympia purrs, fixing you with those glowing golden eyes. <i>“Because I feel desperately in need of some internal maintenance...”</i>");
	output("\n\nDoes she now?");
	processTime(10);
	clearMenu();
	addButton(0,"Indeed",fuckOlympiasButtForReal,x,"Indeed","Fuck Olympia’s butt.");
	if(x >= 0) addButton(1,"Surface Prob.",surfaceProblem,x,"Surface Problem","It’s just a surface issue. Easily buffed out with a little cum.");
	else addDisabledButton(1,"Surface Prob.","Surface Problem","You need to be using a real penis for this.");
	if(x >= 0) addButton(2,"Interface",interfaceWithOlympia,x,"Interface","Get yourself a feedback loop going via Olympia’s tailcock in your ass.");
	else addDisabledButton(2,"Interface","Interface","You need to be using a real penis for this.");
}

//Surface Prob
//It’s just a surface issue. Easily buffed out with a little cum.
//Requires a real cock.
public function surfaceProblem(x:int):void
{
	clearOutput();
	showOlympia(true);
	author("Savin");
	output("<i>“Nah,”</i> you tell her, groping her backside a little harder. <i>“Just needs a little grease.”</i>");
	output("\n\n<i>“Aye, captain,”</i> the gynoid agrees, caressing your cheek with the tip of her tail. <i>“Proceed.”</i>");
	output("\n\nSo you do, grinding your [pc.cock] through Olympia’s asscheeks. Every thrust slackens your journey with her juices, smearing them liberally across her flanks and the prominent mound of her pucker. You can feel when her muscles tense every time you slide between her pussylips; the way she gasps and shivers when your crown pokes her mound. Olympia’s knuckles whiten as you carry on, and her wetness increases perceptibly with every thrust. Her tail curls around your waist, holding you tight while you pound away at her rear.");
	output("\n\nYou’re starting to get the feeling she <b>likes</b> being used.");
	output("\n\nAn extra smack on the rear confirms it, in your eyes: she gasps and giggles, rocking her hips back as if asking for more - and you’re happy to give it. Watching her ass quake and tremble with every impact is positively hypnotic, and the way her cheeks always come clapping back together around your [pc.cock] is <i>divine</i>.");
	output("\n\nSo divine, indeed, that it’s not long before you feel a familiar tightness in your [pc.balls]. Olympia seems to sense it coming, and grins hungrily at you. <i>“It seems I need a wax, captain. Care to oblige?”</i>");
	output("\n\nYeah, you do. Digging both hands into lushous assflesh, you squeeze Olympia’s cheeks together as tight as you can. They’re so soft that no amount of force can keep your [pc.cock] from sliding back into her lubricated depths one last time before you blow your load through her crack. She gasps with glee as the first arcing shot of [pc.cum] squirts up from between her russet cheeks, splattering on her back.");
	var cumQ:Number = pc.cumQ();
	if(cumQ < 100) {}
	//Med cumvol:
	if(cumQ < 500) output(" Before long there’s a little pool in the small of her back, sloshing back and forth with every breath Olympia takes.");
	// large+ cumvol:
	else output(" The second shot creates a jiggle pool in her lower back, and the third overflows it, sending rivers of semen pouring down Olympia’s thick curves and onto the console. The gynoid clicks her tongue with annoyance and flicks the thickest wads off with the tip of her tail, but she’s smiling all the while as your [pc.balls] empt" + (pc.balls <= 1 ? "y":"ies") + " across her bare behind.");
	output("\n\nWhen the last aftershots have spent themselves across Olympia’s flawless red flesh, she props herself up on her elbows and locks eyes over her shoulder. <i>“Well captain, I feel like a new model already. Do you-”</i>");
	output("\n\nHer voice trails off as your hands run up her meaty flanks, rubbing your still-steaming [pc.cumNoun] over every inch of naked synthflesh and artificial scales. You did promise her a good buffing out, didn’t you? So you dig your fingers in, massaging your cum into her skin with just enough force to make Olympia moan.");
	output("\n\n<i>“I see...”</i> she sighs. <i>“Sometimes I forget how dirty you can be.”</i>");
	output("\n\nDespite her words, Olympia pushes her hips back against you and seems more than happy to let you carry out your lurid task until your hands have worked over ever inch and Olympia is glistening with a [pc.cumColor] sheen. <i>“Hmm, am I expected to wear this for the rest of the day?”</i>");
	output("\n\nOh, no, you’re going to love watching her wash this all off in your shower. Olympia smirks and stands, swaying her hips as she turns towards the hatch.");
	output("\n\nGod <b>damn</b> that’s a good look for her. You follow her to the shower with a smile on your lips...");
	output("\n\nIndeed");
	processTime(30);
	pc.orgasm();
	IncrementFlag("OLYMPIA_SEXED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Fuck Olympia’s butt.
public function fuckOlympiasButtForReal(x:int):void
{
	clearOutput();
	showOlympia(true);
	author("Savin");
	output("Yeah, this bottom-heavy ‘bot really <i>does</i> need an internal check-up, and you’ve got the perfect tool to do the deed. You slide your [pc.cockOrStrapon " + x + "] through the smooth lips of her cunt one last time, soaking up as much pussy-juice as you can before rubbing your crown into the plump ring of her ass. With a little shifting of your [pc.hips], you push your cock into the warm embrace of her asshole, spreading her dark entrance around your slicked-up " + (x < 0 ? "holographic ":"") + "crown.");
	output("\n\nOlympia tenses for a moment, then relaxes as you start feeding her your dick. Her tail curls around your [pc.leg], squeezing tight. <i>“Unnnf, yes,”</i> she moans, resting her forehead against console face and pushing her rear back against you. Your [pc.cockOrStrapon " + x + "] slides in without resistance; if anything, it feels like her back channel is molding itself perfectly around you, a silken glove that perfectly hugs your dick inch by inch.");
	output("\n\n<i>“What monster programmed my ass to feel this good?”</i> Olympia groans, halfway laughing. <i>“Maybe because my pussy’s so sensitive, I needed a normal way to get fucked?”</i>");
	output("\n\nOlympia sighs, but the way her draconic cock throbs between her thick thighs is proof enough that she’s enjoying every second of your slow sodomy. Before long, a little rope of [olympia.cumColor] is hanging from her tapered crown, wobbling as her hips rock between your waist and the console’s edge.");
	output("\n\nWell, if she’s this into it, then you’ll take that as encouragement to pick up the speed. You grip Olympia’s scaled hips, finding the perfect ledge to hang onto where they meet her synthflesh, and you slam the rest of your length down her tailpipe.");
	output("\n\n<i>“O-ohhh!”</i> she gasps, back arching. <i>“Captain...”</i>");
	output("\n\nHer tail tightens around you, holding you ");
	if(x >= 0 && pc.hasKnot(x)) output("[pc.knot " + x + "]");
	else if(pc.balls > 0) output("Balls");
	else output("crotch");
	output("-deep inside her for a moment. Cum leaks liberally from her dick, milked out by your sudden thrust, and pools on the deck between her clawed feet. Olympia glances at you over her shoulder, golden eyes narrowed with sultry desire as her tail slowly loosens its hold on you. Time to get moving.");
	output("\n\nYou give Olympia’s plump cheeks a good slap, enjoying the ripple effect it has inside and out, before you start grinding your hips back the way you came. It’s a heavenly experience, feeling her muscles guiding you out with steady squeezes and contractions. Every inch you surrender is bliss, urging you out until only the very tip is nestled in her plump ring, letting her squeeze around your crown with every breath.");
	output("\n\n<i>“Waiting for something?”</i> Olympia teases, wiggling her hips.");
	output("\n\nNot a thing. You use those big faux-breeders as leverage to slam your [pc.hips] right back home. Your draconic lover gasps, rocking forward with the impact. More pre leaks from the hanging faucet between her thighs, spattering down as you start to saw your rod in and out of her welcoming behind. Every thrust milks more cream from her cock and lusty moans from her lips. Hearing her sultry voice going wild just makes you want to fuck her harder - and you know that’s <i>exactly</i> why she’s doing it.");
	output("\n\nYou give Olympia a playful slap on the flank, making that booty jiggle around your [pc.cockOrStrapon " + x + "]. She sways her hips side to side, tempting another, harder smack across her scaley butt. This time she moans <b>loud</b>, arching her back and crooning to the stars. Oh yeah, she’s into it. You bring that hand back across, and you feel the impact across every inch of dick lodged inside her, like she’s rewarding your anal abuse.");
	output("\n\nThere’s no pretense that she isn’t enjoying it, that’s for sure: you can plainly feel her thick dick drooling down her leg every time you bottom out in her butt. Her moans are growing louder and more wild, until she finally breaks and howls, <i>“Yes, captain! Right there... harder, captain!”</i>");
	output("\n\nYou give her exactly what she wants, battering her ass as hard as you can. She’s got plenty of cushion to welcome your thighs every time they slap against her, driving that [pc.cockOrStrapon " + x + "] of yours to the hilt inside the rippling channel of her muscles. ");
	//PC has a knot:
	if(x >= 0 && pc.hasKnot(x)) output("Feeling Olympia going wild around you, you can’t help but finally drive your [pc.knot " + x + "] straight into the thick ring of her hungry ass. Olympia squeals in surprise, rocking forward against the console and shooting a climactic squirt of [olympia.cum] all across the floor. <i>“Fuuuuck yes!”</i> she groans, thrusting her ass back against you. <i>“That’s so <b>thick</b>. I love it!”</i>");
	else output("Your rapid thrusts finally drive your lustful companion over the edge with a roar of delight that thunders through the engine room. She sounds like a proper dragon in that moment, bellowing your name as her orgasm hits.");
	output("\n\nThat’s all it takes to get your [pc.cockOrStrapon " + x + "] aching for release. You hook your arms under Olympia’s waist and slam yourself " + (pc.balls > 0 ? "balls":"hilt") + "-deep; her awesome ass’s tight embrace is more than enough to give you the climax you crave.");
	if(x < 0) output(" The haptic sensors on your holographic cock overwhelm your nerves with pleasure, leaving you gasping and moaning as the digital orgasm spreads through your body.");
	//Low-Med Cum:
	else if(pc.cumQ() < 1000) output(" [pc.Cum] shoots from the crown of your [pc.cock " + x + "], filling the narrow channel of Olympia’s asshole.");
	else output(" A flood of [pc.cum] erupts from your [pc.cockHead " + x + "], pouring straight into Olympia’s synthetic stomach - all it’s good for is storing cum, you figure, and you’re happy to let her fulfil her destiny. She groans as a deluge of spooge fills her belly, stretching it out with the sheer weight of your load. One of her hands falls back to her taut stomach, testing the liquid weight sloshing inside her.");
	output("\n\n<i>“Ohhh, that feels nice, captain,”</i> she moans. <i>“Regular internal maintenance is so essential...”</i>");
	output("\n\nYou give her a firm squeeze as you " + (x < 0 ? "deactivate your hardlight, leaving her ass gaping for a moment as she slowly stands.":"pull your softening shaft out of her ass. No sooner have you done so than Olympia leans over to her personal drawer and finds her [olympia.tailCock], and jams it straight up her ass before more than a few droplets of your cum can leak out. <i>“For safekeeping,”</i> she says, grinning as she slowly stands and rests her hands on her belly."));
	output("\n\n<i>“Now then... are you going to stand around and watch a girl work?”</i>");
	output("\n\nWith an ass like that on display, you just might.");
	processTime(30);
	pc.orgasm();
	IncrementFlag("OLYMPIA_SEXED");
	if(x >= 0) olympia.loadInAss(pc);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Interface
//Get yourself a feedback loop going via Olympia’s tailcock in your ass.
//Requires a real cock
public function interfaceWithOlympia(x:int):void
{
	clearOutput();
	showOlympia(true);
	author("Savin");
	output("Well, if that’s the case, maybe it’s time you and Olympia interface properly... make sure you have the right diagnostic tools plugged in.");
	output("\n\n<i>“Captain?”</i> Olympia queries as you tell her to get her [olympia.tailCock] plugged in. She does as you command, leaning over to the drawer with her scant personal effects and fishing out her attachment. She passes it back to you and presents her thick, synth-scale-covered tail for your inspection. You run a hand up her soft scales and around the attachment ring at its tip. The internal muscles wink at you when you glance down the passage inside it. You can already imagine cum coming up that channel in geyser-like squirts.");
	output("\n\nBut first she needs a cock. You roll her [olympia.tailCock] in your fingers, feeling the heft and weight of it. Right now it feels just like any cold synthflesh dildo, but as soon as you insert the base into Olympia’s tail port, the veins stand out and it starts to throb. The texture softens in your hand, becoming more life-like as it interfaces with the gynoid’s nervous system. You guide her sinuous appendage back around your body, brushing its crown along the curve of your [pc.butt] until she’s brushing through your crack.");
	output("\n\n<i>“Ah, there’s something to plug into,”</i> Olympia grins, taking control and pressing her tailcock’s crown against your [pc.asshole].");
	output("\n\nYou return the gesture, grinding your [pc.hips] against her plush behind until your [pc.cock " + x + "] is nudging against the thick rim of her own dark star. You push forward, and feel her tail mimic your movements perfectly, easing on the pressure against your own hole. When you finally thrust into that tight, hot hole, your ability to bask in the sensation is immediately overridden by the sudden fullness rocking your [pc.asshole]. You groan and lean into it, taking the gynoid’s synthsheath ");
	if(x >= 0 && pc.hasKnot(x)) output("knot");
	else output("hilt");
	output("-deep.");
	pc.buttChange(olympia.tailCockVolume());
	output("\n\n<i>“Mmm, interface is online, captain,”</i> Olympia purrs. <i>“I can sense your pulse, your respiration rate... oh, and your boner, too.”</i>");
	output("\n\nYou roll your eyes and give Olympia’s fat cheeks a good slap for that. She just giggles and wiggles her tail, making the tip vibrate inside you until you relent and start moving again. She’s got plenty of cushion for the pushin’, soaking up full-power hip-thrusts with jiggling synthflesh and resounding echoes. Her ass squeezes wonderfully around every inch of [pc.cock " + x + "] you plunge into her. Those muscles of hers are perfectly tuned for this, sculpted from the factory to pleasure her sodomizer better than any human pussy ever could, and she’s all too happy to put that programming to use.");
	output("\n\nAnd of course, every time you pull back from that rippling rump, you end up taking her own dick right back up your own tailpipe.");
	output("\n\n<i>“Ah, I’m feeling better already, captain,”</i> Olympia moans. <i>“Though you could go a little deeper...”</i>");
	output("\n\nOn, really? Alright, you’ll see about that. You grab Olympia’s hips in both hands, getting the firmest grip you can before slamming yourself ");
	if(pc.balls > 0) output("balls");
	else if(pc.hasKnot(x)) output("knot");
	else output("hilt");
	output("-deep into the dragon-bot. She groans, rocking forward into the console. A thick, glistening rope of spunk drops from the crown of her draconic cock and smears down her scaled thigh. Looks like you found the spot!");
	output("\n\nYou keep hammering into her booty, plowing the thick donut between those cheeks until Olympia’s moans are echoing through the engine deck. You’re rewarded with a growing puddle of cum splattered on the deck between Olympia’s heels, milked out in glistening rivers every time your [pc.cockHead " + x + "] batters her hole... and even more is milked straight into your [pc.asshole], smearing your tunnel with [olympia.cumColor] pre.");
	output("\n\nFeeling her cock spearing your ass with every thrust only makes you harder, and before long, makes you start aching with need. Your [pc.balls] " + (pc.balls <= 1 ? "is":"are") + " churning, stirred up by Olympia’s anal probing. Her warm cum rubbing into your channel is a divine feeling, spurring you to fuck the gynoid even harder until that wonderful ass of hers finally tips you over the edge.");
	output("\n\nYou hilt yourself in Olympia’s ass and let yourself join her thunderous roars of pleasure as you climax, blasting [pc.cum] into her cum-craving asshole. <i>“A-ah! Lubricate me, captain,”</i> Olympia giggles, pushing back against your [pc.cock " + x + "]");
	if(x >= 0 && pc.hasKnot(x)) output(" until your [pc.knot " + x + "] finally wedges itself into her");
	output(". She wiggles her hips and thrusts her tail up into you, doing everything she can to milk more [pc.cum] out of you.");
	output("\n\nWhen your orgasm finally subsides, ");
	//huge cum vol:
	if(pc.cumQ() >= 10000) output(" Olympia is left with a severe paunch, straining the flesh around her stomach with liquid weight.");
	else output(" you find yourself leaning heavily against Olympia’s back, struggling to catch your breath.");
	output(" The gynoid slowly runs a hand over her belly, clearly enjoying the feeling of your load cooling side her. You can sympathize, with a fat wad of [olympia.cum] steaming in your own well-packed ass. With a moan, you let your hands wander up to Olympia’s weighty breasts, giving them a playful grope while you slowly soften inside each other.");
	output("\n\nWhen you finally slide out of your lover, it’s accompanied by a deluge of [pc.cum] trapped inside her. Olympia shudders and smirks over her shoulder, working her muscles to hasten the flood." + (celiseIsCrew() ? " <i>“Well captain, I suppose I’ll have to call Celise in to clean up the mess. Wouldn’t want somebody to slip, would we?”</i>":" <i>“What a mess! I’m going to have my work cut out for me cleaning all this... but it was <b>so</b> worth it.”</i>"));
	output("\n\nYou give her ass a parting squeeze as you start searching for your discarded kit...");
	processTime(30);
	pc.loadInAss(olympia);
	olympia.loadInAss(pc);
	pc.orgasm();
	IncrementFlag("OLYMPIA_SEXED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}