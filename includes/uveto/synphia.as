/*Serusynph - Most core-dwellers just call me "Synphia"
By: Fenoxo

No hood.
Goggles
Green scales, purple eyes, pink nips/slit?
Ram/Geddy-like horns - cybernetic psychic amps, just like fentaur. USUALLY NEON GREEN.
Black - Energy absorption, either as a means of defending against energy attacks or defeating foes by sucking the very heat from their flesh.
Purple - Spatial manip. Can't make portals but can make small things seem +/-20% bigger for a few seconds.
Blue - self-augmentation
Green - Healing and bodily adjustment. Limited. Changing someone permanently exhausts her, and she needs cum.
Yellow - Sensory enhancement. 10' clairvoyance.
Orange - Limited Time Control - can only change her perception of time's flow to be longer/shorter.
Red - Energy creation - Capable of making small electric shocks or powering an LED or lightbulb
Pink - Weak Mind Control, mostly just altering sensory input slightly. Overpowering any resistance is supremely draining for her.
White - Recharging/Cooldown. No powers save for touch-range telepathy. Vulnerable.
C-cup tid for wiggling into machinery.
Steeletech Suit + Toolbelt
Floor dragging tail
Working to keep her sister supplied on the rush. Iphedra.
*/
public function showSynphia(nude:Boolean = false):void
{
	showName("\nSYNPHIA");
	showBust("SYNPHIA" + (nude ? "_NUDE":""));
}

public function synphiaBonus(button:Number = 0):void
{
	if(flags["MET_SYNPHIA"] == undefined) output("\n\nThe station’s reptilian mechanic leans against a wall, twirling a wrench around a scaly finger while waiting on her next job.");
	else if(hours < 7) output("\n\nSynphia, the station mechanic, leans against the hangar wall and idly thumbs through her codex. Apparently it’s a slow day on station.");
	else if(hours < 10) output("\n\nYou spot the station mechanic, Synphia, near a back wall, taking inventory on a few crates that look big enough to live in.");
	else if(hours < 14) output("\n\nSynphia climbs out from underneath a freighter’s engine cowling half covered in grease. Her horns flash red, and the offending fluid sloughs off like water. Sidestepping the greasy puddle, the station mechanic saunters over to her favorite break location and pulls out a codex. You note her horns have shifted back to a steady green.");
	else if(hours < 20) output("\n\nSynphia proudly shakes a pilot’s hand in front of his gleaming ship. She mouths something inaudible, listening raptly for his equally incomprehensible reply. The pilot departs, and the slyveren plods toward the hangar wall with a huff of annoyance writ plain across her reptilian muzzle.");
	else output("\n\nSynphia, the station mechanic, leans against a wall, sipping a white-hued drink from a ruggedized bottle with power-indicating LEDs on the side. Must be some kind of self-refrigerating cup.");
	addButton(button,(flags["MET_SYNPHIA"] == undefined ? "Mechanic":"Synphia"),approachSynphia,undefined,(flags["MET_SYNPHIA"] == undefined ? "Mechanic":"Synphia"),"Approach the station mechanic.");
}
//Meet Synphia
public function approachSynphia(back:Boolean = false):void
{
	clearOutput();
	showSynphia();
	author("Fenoxo");
	//Back
	if(back) 
	{
		output("Synphia raises an eyebrow. <i>“Anything else I can do for you?”</i>");
		processTime(1);
	}
	else if(flags["MET_SYNPHIA"] == undefined)
	{
		output("Despite not even looking at you, the mechanic turns to face you well before she could’ve heard your approach. She smiles warmly, one-handedly adjusting the fit of her skin-tight Steeletech jumpsuit while her tail wags back and forth behind her, dragging heavily on the ground. " + (CodexManager.entryUnlocked("Slyverens") ? "She’s definitely one of the protein-hunting slyveren. It’s unusual to encounter one in core space, especially one with green-glowing cybernetic horns instead of the cobra-like hood you’d expect.":"Your Codex identifies her as a protein-hunting slyveren, a race that’s making a big play at the Rush frontier. Most of them have cobra-like hoods, but this one’s rocking a cybernetic horns that glow with sickly neon light."));
		output("\n\n<i>“Need something, Rusher?”</i> The snake-woman ennunciates her words quite clearly for a girl with a muzzle and thick, bee-stung lips. <i>“I’m the station’s lead mechanic, so if you " + (!pc.hasCock() ? "need some work done":"some star-worthy service") + ", you’ve found the right girl.”</i> She hefts her codex to skim a notification. <i>“That something you need?”</i>");
		CodexManager.unlockEntry("Slyverens");
		processTime(2);
		clearMenu();
		addButton(0,"Yes",yesSynphiaService);
		addButton(1,"No",noSynphiaService);
		return;
	}
	//Repeat Approach, Lost dick since last visit (and have gotten succ)
	else if(flags["FUCKED_SYNPHIA"] != undefined && (flags["SYNPHIA_DICKMEMORY"] != undefined && flags["SYNPHIA_DICKMEMORY"] > 0) && !pc.hasCock())
	{
		output("As expected, Synphia looks up at your approach long before she should have noticed you, but budding smile collapses into concern. <i>“[pc.name]! Are you okay? Something seems... off.”</i> Her eyes flick back and forth between your crotch and your face. Sizzling amber wreaths her horns as they flash bright yellow. <i>“Your... your cock" + (flags["SYNPHIA_DICKMEMORY"] > 1 ? "s":"") + "! You lost " + (flags["SYNPHIA_DICKMEMORY"] == 1 ? "it":"them") + "!”</i> Her tail propels her forward. <i>“Poor thing...”</i> Sadness wells in her eyes. <i>“Well, I guess you don’t need one of those for me to take care of your ship at least.”</i> Her fingers trail down your cheek before finally separating from your chin. <i>“Even if that’s all I can take care of.”</i>");
		flags["SYNPHIA_DICKMEMORY"] = -1;
		processTime(2);

	}
	//Regular Repeat Approach
	else
	{
		output("Synphia notices you coming her way and matches your pace, looking up at your ship and back at her tablet on the wall. <i>“Hey there, [pc.name]");
		if(pc.hasCock())
		{
			if(flags["FUCKED_SYNPHIA"] != undefined) output(", dick" + (pc.cockTotal() > 1 ? "s":"") + " needing drained again?”</i> She runs her tongue on a slow circuit around her lips while her tail slides up to rub against your [pc.hip]. <i>“It must be so hard to focus without that post-orgasm clarity. Good thing it’s one of the many services I can provide you... and this one’s free of charge.”</i>");
			else output(", need some servicing?”</i> Her tail slides up your [pc.leg] to gently rub your [pc.hip]. <i>“Repairs... fitting new parts... draining excess fluids. I can do it all.”</i>");
			pc.lust(2);
		}
		else output(", need some work done on the old star-chariot?”</i> She looks over your ship with a professional gaze. <i>“Bet she’d be real fun to work on...”</i>");
		processTime(1);
	}
	synphiaMenu();
}

//No
public function noSynphiaService():void
{
	clearOutput();
	showSynphia();
	author("Fenoxo");
	output("You shake your head and step away.");
	output("\n\n<i>“On behalf of the Camarilla and Steeletech, enjoy your stay on Uveto.”</i> She says so with the bored indifference of someone who has to spout that line dozens of times a day.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Yes
public function yesSynphiaService(back:Boolean = false):void
{
	clearOutput();
	showSynphia();
	author("Fenoxo");
	
	output("<i>“");
	if(pc.isBimbo()) output("Totally!");
	else if(pc.isBro()) output("Maybe.");
	else output("It just might be.");
	output("”</i> You glance back at your [pc.ship]. <i>“");
	if(pc.isBimbo()) output("What sorts of stuff can I pay you to do, cutie?");
	else if(pc.isBro()) output("What’s on offer?");
	else output("What are you offering?");
	output("”</i>");
	output("\n\nThe slyveren looks over your shoulder to your vessel and taps the id codes into her tablet. <i>“The standard services you’d expect. Upgrade module installation and removal. Repair work. You know-whoah whoah what’s this?”</i> She hunches over the tablet’s screen, her horns shifting blue while for a moment. <i>“There’s an open order me to offer repairs to you, free of charge, for the duration of the Rush.”</i> She straightens and squints, her cybernetic headgear fading to flickering white. <i>“Steeletech’s fronting the bill.... Who the hell are you?”</i>");
	output("\n\nYou tell her your name.");
	output("\n\n<i>“Like, Victor Steele Steele?”</i> A hardlight keyboard materializes just below the device’s bottom edge. The slyveren one-handedly pounds in a search. Her eyes dart across the screen, slowly widening as she absorbs the data. <i>“It is. You are... but you’re not actually in charge of anything. Ouch. Sorry about that.”</i> The keyboard vanishes into thin air, and the tool-toting snake-girl chews her mouth for moment before remembering to introduce herself. <i>“You can call me Synphia. Real name’s Serusynph, but nobody around here calls me that.”</i> She extends her hand for a businesslike handshake. " + (!pc.hasCock() ? "<i>“Just let me know what you need done, and I’ll do it.”</i>":"<i>“Just say the word, and I can start servicing you immediately.”</i> The pink of her tongue slides across her plush lower lip."));
	processTime(4);
	flags["MET_SYNPHIA"] = 1;
	synphiaMenu();
}

public function synphiaMenu():void
{
	clearMenu();
	addButton(5,"Gadgets",buyGadgetsFromSynphia,undefined,"Gadgets","Purchase gadgets for your [pc.ship] from Synphia.");
	addButton(6,"Upgrades",buyUpgradesFromSynphia,undefined,"Upgrades","Purchase upgrades for your [pc.ship] from Synphia.");
	if(shits["SHIP"].HP() < shits["SHIP"].HPMax()) addButton(4,"Repair",repairsWithSynphia,undefined,"Repair","Ask about getting your ship repaired. You know it’s free on station, but it pays to touch base.");
	else addDisabledButton(4,"Repair","Repair","Your ship is not damaged.");
	addButton(7,"Unfit",unfitSynphia,undefined,"Unfit","See about having an installed upgrade removed.");
	addButton(14,"Leave",leaveSynphia);
}

public function repairsWithSynphia():void
{
	clearOutput();
	showSynphia();
	author("Fenoxo");
	output("You ask Synphia about repairing the damages to your ship.");
	output("\n\n<i>“I’ve already dispatched some techs to take care of it. Depending on the damages, it could take a while, so why not avail yourself of our station’s amenities?" + (pc.hasCock() ? " Or pass the time with me.”</i> Her tail cups your [pc.butt]. <i>“The time will fly right by.":"") + "”</i>");
	processTime(1);
	if(pc.hasCock()) pc.lust(1);
	
	synphiaMenu();
	setButtonDisabled(4);
}

public function leaveSynphia():void
{
	clearOutput();
	showSynphia();
	author("Fenoxo");
	output("You bid Synphia farewell.");
	//nofucked
	if(flags["FUCKED_SYNPHIA"] == undefined) output("\n\n<i>“On behalf of the Camarilla and Steeletech, enjoy your stay on Uveto.”</i> She says so with the bored indifference of someone who has to spout that line dozens of times a day.");
	//fucked
	else output("\n\n<i>“Already? Well take care of yourself down on the surface, and if you need a warm-up or a tune-up, you know where to find me.”</i> The slyveren winks.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function buyGadgetsFromSynphia():void
{
	clearOutput();
	showSynphia();
	shopkeep = new Synphia();
	shopkeep.inventory.push(new CapacitorVampire());
	shopkeep.inventory.push(new ShieldVampire());

	output("Synphia looks back at your ship. <i>“Most gadgets are one-use only. I prefer upgrades that’ll make my ship better all the time, but if I had to fit a gadget, it’d be one of these.”</i> She taps her codex and pops out a display of her gadget inventory.\n\n");
	buyShipFitItem();
}

public function buyUpgradesFromSynphia():void
{
	clearOutput();
	showSynphia();
	shopkeep = new Synphia();
	shopkeep.inventory.push(new AdvancedQuarters());
	shopkeep.inventory.push(new AuxiliaryThrusters());
	shopkeep.inventory.push(new ThrustVectoringSystem());

	output("<i>“Upgrades? Yeah, I’ve got some really nice ones in stock - stuff you’ll have a hard time sourcing out on the rim,”</i> Synphia explains while pulling out a list of inventory via her codex.\n\n");

	buyShipFitItem();
}

public function unfitSynphia():void
{
	clearOutput();
	showSynphia();
	shopkeep = new Synphia();
	unfitShipItem();
}