/*Serusynph - Most core-dwellers just call me "Synphia"
By: Fenoxo

No hood.
Goggles
Green scales, purple eyes, pink nips/slit?
Ram/Geddy-like horns - cybernetic psychic amps, just like fentaur. USUALLY NEON GREEN.
Black - Energy absorption, either as a means of defending against energy attacks or defeating foes by sucking the very heat from their flesh.
Purple - Spatial manip. Can’t make portals but can make small things seem +/-20% bigger for a few seconds.
Blue - self-augmentation
Green - Healing and bodily adjustment. Limited. Changing someone permanently exhausts her, and she needs cum.
Yellow - Sensory enhancement. 10’ clairvoyance.
Orange - Limited Time Control - can only change her perception of time’s flow to be longer/shorter.
Red - Energy creation - Capable of making small electric shocks or powering an LED or lightbulb
Pink - Weak Mind Control, mostly just altering sensory input slightly. Overpowering any resistance is supremely draining for her.
White - Recharging/Cooldown. No powers save for touch-range telepathy. Vulnerable.
C-cup tid for wiggling into machinery.
Steeletech Suit + Toolbelt
Floor dragging tail
Working to keep her sister supplied on the rush. Iphedra.
*/
public function showSynphia(unzipped:Boolean = false):void
{
	showName("\nSYNPHIA");
	showBust("SYNPHIA" + (unzipped ? "_UNZIP":""));
}

public function synphiaCockLoveLevel():Number
{
	var amount:Number = 0;
	if(flags["SYNPHIA_DICKGASMS"] != undefined) amount += flags["SYNPHIA_DICKGASMS"];
	if(flags["SYNPHIA_SUCKS"] != undefined) amount += Math.floor(flags["SYNPHIA_SUCKS"]/2);
	return amount;
}

public function synphiaCanSuck(x:int):Boolean
{
	if(pc.cocks[x].cLength() < 36 && pc.cocks[x].thickness() < 8) return true;
	return false;
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
		output("Despite not even looking at you, the mechanic turns to face you well before she could’ve heard your approach. She smiles warmly, one-handedly adjusting the fit of her skin-tight Steele Tech jumpsuit while her tail wags back and forth behind her, dragging heavily on the ground. " + (CodexManager.entryUnlocked("Slyverens") ? "She’s definitely one of the protein-hunting slyveren. It’s unusual to encounter one in core space, especially one with green-glowing cybernetic horns instead of the cobra-like hood you’d expect.":"Your Codex identifies her as a protein-hunting slyveren, a race that’s making a big play at the Rush frontier. Most of them have cobra-like hoods, but this one’s rocking cybernetic horns that glow with sickly neon light."));
		output("\n\n<i>“Need something, Rusher?”</i> The snake-woman enunciates her words quite clearly for a girl with a muzzle and thick, bee-stung lips. <i>“I’m the station’s lead mechanic, so if you need some " + (!pc.hasCock() ? "work done":"star-worthy service") + ", you’ve found the right girl.”</i> She hefts her codex to skim a notification. <i>“That something you need?”</i>");
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
	output("\n\n<i>“On behalf of the Camarilla and Steele Tech, enjoy your stay on Uveto.”</i> She says so with the bored indifference of someone who has to spout that line dozens of times a day.");
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
	output("\n\nThe slyveren looks over your shoulder to your vessel and taps the id codes into her tablet. <i>“The standard services you’d expect. Upgrade module installation and removal. Repair work. You know-whoah whoah what’s this?”</i> She hunches over the tablet’s screen, her horns shifting blue for a moment. <i>“There’s an open order me to offer repairs to you, free of charge, for the duration of the Rush.”</i> She straightens and squints, her cybernetic headgear fading to flickering white. <i>“Steele Tech’s fronting the bill.... Who the hell are you?”</i>");
	output("\n\nYou tell her your name.");
	output("\n\n<i>“Like, Victor Steele Steele?”</i> A hardlight keyboard materializes just below the device’s bottom edge. The slyveren one-handedly pounds in a search. Her eyes dart across the screen, slowly widening as she absorbs the data. <i>“It is. You are... but you’re not actually in charge of anything. Ouch. Sorry about that.”</i> The keyboard vanishes into thin air, and the tool-toting snake-girl chews her mouth for moment before remembering to introduce herself. <i>“You can call me Synphia. Real name’s Serusynph, but nobody around here calls me that.”</i> She extends her hand for a businesslike handshake. " + (!pc.hasCock() ? "<i>“Just let me know what you need done, and I’ll do it.”</i>":"<i>“Just say the word, and I can start servicing you immediately.”</i> The pink of her tongue slides across her plush lower lip."));
	processTime(4);
	flags["MET_SYNPHIA"] = 1;
	synphiaMenu();
}

public function synphiaMenu():void
{
	clearMenu();
	addButton(0,"Appearance",synphiaAppearance);
	addButton(1,"Talk",synphiaTalkScreen,undefined,"Talk","Talk to Synphia.");

	if(pc.hasCock()) addButton(2,"“Service”",synphiaServiceOption,undefined,"“Service”","Get some world-class phallus service.");
	else addDisabledButton(2,"“Service”","“Service”","Synphia only offers this service to those with a phallus.");
	if(shits["SHIP"].HP() < shits["SHIP"].HPMax()) addButton(4,"Repair",repairsWithSynphia,undefined,"Repair","Ask about getting your ship repaired. You know it’s free on station, but it pays to touch base.");
	else addDisabledButton(4,"Repair","Repair","Your ship is not damaged.");
	addButton(5,"Gadgets",buyGadgetsFromSynphia,undefined,"Gadgets","Purchase gadgets for your [pc.ship] from Synphia.");
	addButton(6,"Upgrades",buyUpgradesFromSynphia,undefined,"Upgrades","Purchase upgrades for your [pc.ship] from Synphia.");
	addButton(7,"Unfit",unfitSynphia,undefined,"Unfit","See about having an installed upgrade removed.");
	addButton(14,"Leave",leaveSynphia);
}
public function synphiaAppearance():void
{
	clearOutput();
	showSynphia();
	author("Fenoxo");
	output("Synphia is a member of the snake-like slyveren race, known the galaxy over as seductive protein feeders, and you can see how they’d garner such a reputation with one look at her face; her features are the epitome of classical beauty applied to bone structure with reptilian sensibilities. Vertically slit purple eyes meet your own, looking back at you with ");
	var synCockLuvLvl:Number = synphiaCockLoveLevel();
	if(synCockLuvLvl < 1) output("a professional sort of friendliness");
	else if(synCockLuvLvl < 3) output("keen interest");
	else if(synCockLuvLvl < 4) output("a knowing sort of interest");
	else if(synCockLuvLvl < 5) output("half-hidden desire");
	else if(synCockLuvLvl < 6) output("barely suppressed excitement");
	else if(synCockLuvLvl < 7) output("passionate familiarity");
	else output("adoring, almost addicted-seeming desire");
	output(". Above, ram-like horns curl out of her brow, around her head, and down toward her shoulders. They glint and shine and glow with their own inner light, and the bases clearly show the obvious metallic highlights of cybernetic implants.");
	output("\n\nBetween the sharp-looking horntips are the soft pillows of her lips. Like most slyverens, Synphia is gifted with a pouty pucker, and she’s chosen to accentuate her mouth’s natural shapeliness by applying an exquisitely high-gloss coating it. When she speaks, it’s difficult not to watch the lights glitter and dance across those plump expanses. Inside, her mouth and tongue and light pink.");
	output("\n\nExtreme curviness may be the intended slyveren look, but Synphia’s 5\' 3\" frame is anything but. Even with a Steele Tech jumpsuit layered across her green scales, there’s no concealing her pert, C-cup breasts, tight derriere, or limber legs. She has the look of a girl who works hard and either chooses to watch what she eats or can’t quite afford to eat well, though knowing her job and slyveren diets, she probably just spends less time sucking dick than she should.");
	//Sucked
	if(flags["SYNPHIA_SUCKS"] != undefined)
	{
		output("\n\nYou’ve seen hints of her pink nipples during your own attempt" + (flags["SYNPHIA_SUCKS"] != 1 ? "s":"") + " to feed her, and you can only assume her pussy shares a similar shade, down below. For now, all you can do is glance at her camel-toe and guess.");
	}
	//Else
	else
	{
		output("\n\nYou can check out her camel-toe pretty easily. Synphia makes no attempts to adjust her suit’s fabric to hide it, and when she catches someone looking at it, like you right now, amusement appears on her features instead of irritation.");
	}
	//merge
	output("\n\nA tail long enough to drag on the ground but strong enough to carry itself a few inches above dangles out from the base of the slyveren mechanic’s spine, emerging from a hole in her tailored outfit to wiggle seductively behind her. No matter how she moves, it’s both perfect counterbalance and eye-catching accent for her tight butt.");
	output("\n\nYou suppose she probably has one rectum in there as well, right where it belongs.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",approachSynphia,true);
}

public function synphiaTalkScreen():void
{
	clearOutput();
	showSynphia();
	author("Fenoxo");
	output("What will you ask Synphia?");
	clearMenu();
	addButton(0,"Mechanic?",mechanicTalkWivSynphia,undefined,"Mechanic?","Ask her how she became a mechanic.");
	addButton(1,"SteeleTech?",steeletechSynphiaTalk,undefined,"Steele Tech?","What does Synphia think about Steele Tech? She works for them, after all.");
	if(flags["SYNPHIA_JOBTALK"] != undefined)
	{
		addButton(2,"Mods?",modTalkWithSynphia,undefined,"Mods","She mentioned mods but doesn’t seem to have any aside from the horns...");
		addButton(3,"Psychic?",psychicTalkWithSynphia,undefined,"Psychic?","Ask her about her psychic abilities.");
	}
	else 
	{
		addDisabledButton(2,"Locked","Locked","You don’t know her well enough for this.");
		addDisabledButton(3,"Locked","Locked","You don’t know her well enough for this.");
	}
	if(flags["SYNPHIA_STEELETECHTALK"] != undefined || flags["SYNPHIA_MODSTALK"] != undefined) addButton(4,"Sister?",synphiaSisterTalk,undefined,"Sister?","Get some more intel on that sister she’s supporting.");
	else addDisabledButton(4,"Locked","Locked","You don’t know her well enough for this.");
	addButton(14,"Back",approachSynphia,true);
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
	if(flags["FUCKED_SYNPHIA"] == undefined) output("\n\n<i>“On behalf of the Camarilla and Steele Tech, enjoy your stay on Uveto.”</i> She says so with the bored indifference of someone who has to spout that line dozens of times a day.");
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
	shopkeep = chars["SYNPHIA"];
	shopkeep.inventory = [];
	shopkeep.inventory.push(new CapacitorVampire());
	shopkeep.inventory.push(new ShieldVampire());

	output("Synphia looks back at your ship. <i>“Most gadgets are one-use only. I prefer upgrades that’ll make my ship better all the time, but if I had to fit a gadget, it’d be one of these.”</i> She taps her codex and pops out a display of her gadget inventory.\n\n");
	buyShipFitItem();
}

public function buyUpgradesFromSynphia():void
{
	clearOutput();
	showSynphia();
	shopkeep = chars["SYNPHIA"];
	shopkeep.inventory = [];
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
	shopkeep = chars["SYNPHIA"];
	shopkeep.inventory = [];
	unfitShipItem();
}

//"Service"
public function synphiaServiceOption():void
{
	clearOutput();
	showSynphia(true);
	author("Fenoxo");
	if(flags["SYNPHIA_SUCKS"] == undefined)
	{
		//Bimbo
		if(pc.isBimbo()) 
		{
			output("<i>“Wait...”</i> You pause to try and put your thoughts to words, but they’re just too sexy to be shaped into anything but a blunt declaration. <i>“You wanna... suck </i>my<i> cock?”</i>");
			output("\n\nSynphia grabs you by the wrist and pulls you between a pair of gargantuan crates. <i>“Shhh. Not in public... at least not on </i>this<i> station. And yes, yes I do. Come on.”</i> She drags you through the boxed-in canyon then swings a left to find a shadowed corner. <i>“Core-dwellers are so fucking silly sometimes. It’s just a bit of cock-sucking. Nothing serious.”</i>");
		}
		//Bro
		else if(pc.isBro())
		{
			output("You raise an eyebrow and slowly reach down to your loins, whereupon you gently squeeze your " + (pc.cockTotal() > 1 ? "bundled ":"") + "maleness. <i>“This kinda service?”</i>");
			output("\n\nSynphia bites her lip and, after a furtive glance around, grabs your wrist to drag you into the darkened canyon between truck-sized crates. You resist at first, until she glances back plaintively, then amble along with a smug smirk.");
			output("\n\nShe wants it.");
			output("\n\n<i>“Careful. This station isn’t exactly friendly toward a casual public rut, and yes, that is exactly the kind of service you’re getting.”</i> Synphia leads you around a bend and into a dimmer corner. <i>“Silly core-dwellers all wanna get their rocks off, but don’t wanna be seen doing it. Besides, it’s just a little cock-sucking - not like we’re breeding an army of alien babies or nothing. You’re just gonna give me a nice, filling snack.”</i>");
		}
		else
		{
			//Nice
			if(pc.isNice()) output("<i>“So when you say service, are you offering... you know.”</i> You rock your hips in an obviously sexual undulation.");
			else if(pc.isMischievous()) output("<i>“Did I just win a lottery? Because I could swear the station’s prettiest mechanic offered me some supernova-tier service, and I could buy that all day long.”</i>");
			//Hard
			else output("<i>“I’ll take some of that oral service you’re offering,”</i> you declare, rocking your pelvis forward.");
			//3 normies
			output("\n\nSynphia shushes you with a finger to your lip and gestures toward a gap in the nearby crates, whispering, <i>“If you actually want your dick sucked, this way.”</i> She steps away slowly, increasing her pace when she hears you following after. <i>“Core-dwellers always get their panties in a bunch about somebody getting their rocks off in public, like they don’t also wanna bust a fat load down a hot alien’s throat.”</i> She chuckles, then swings a loui between truck-sized boxes to deposit you in a dim corner. <i>“Station policy is that you can swab my tonsils as much as you like, so long as nobody else sees it, and it’s easier to find a quiet corner than file for an exemption.”</i>");
		}
	}
	//REPEATS
	else
	{
		//Bimbo
		if(pc.isBimbo()) output("You flush at the memory of the last time you experienced Synphia’s service, dick" + (pc.cockTotal() > 1 ? "s":"") + " " + (pc.isCrotchExposed() ? "throbbing urgently":"tenting painfully") + ". <i>“Got time for a little spit and polish?”</i> After a few seconds of air-headed giggling, you remember to add a wink, so she knows you’re talking about getting your weiner sucked again.");
		//Bro
		else if(pc.isBro()) output("Wrapping an arm around the scaly slut’s waist, you lean down and gruffly whisper a request in Synphia’s cute little ear, <i>“Service me.”</i>");
		//Else
		output("<i>“More service, please,”</i> you say with a wink.");
		//Merge
		output("\n\nSmiling broadly, the slyveren grease-monkey loops her tail around your waist and bodily leads you into the crate-forest’s darkened gaps. Just like before, she swings a left at an intersection, depositing you neatly into a darkened corner, free from prying eyes. <i>“I wish we could do this out in the open,”</i> she whispers, stroking a luminescent horn as she openly eyefucks your ");
		if(!pc.isCrotchExposed()) output("bulge");
		else output("free-hanging member" + (pc.hasCocks() ? "s":""));
		output(".");
	}
	//Merge all intros here.
	output("\n\nSynphia slides onto her knees with serpentine grace exceeding that of even the most practiced of sex-workers. Perhaps with effort, a galotian" + (CodexManager.entryUnlocked("Naleen") ? ", or perhaps naleen,":"") + " could match the slyveren’s sinful undulations, but they’d lack her intense amethyst eyes, almost sparkling as the predatory slits widen with desire. She nudges the zipper of her jumpsuit lower to display her modest cleavage, the better to stiffen your dick" + (!pc.isCrotchExposed() ? ", then lifts a hand, inches away from spilling your [pc.cocks] into the hangar air... then her mouth":"") + ".");
	var precummies:Number = pc.cumQ();
	if(precummies >= 40000) precummies = 4;
	else if(precummies >= 10000) precummies = 3;
	else if(precummies >= 1000) precummies = 2;
	else if(precummies >= 100) precummies = 1;
	else precummies = 0;
	//Cocks concealed.
	if(!pc.isCrotchExposed())
	{
		output("\n\n<i>“Are you eager?”</i> she asks.");
		output("\n\nYou nod, aware of just how " + (pc.isErect() ? "stiff you’ve been":"you’re getting") + ".");
		output("\n\n<i>“Are you ready?”</i> Synphia’s tail appears behind your [pc.butt] to push you closer, so close that her hand is resting upon that hard and ready bulge. <i>“Ready for this?”</i> She tugs her suit’s seal so low that the smooth crests of her nipples peek into view. <i>“Are you ready to be... <b>serviced?</b>”</i>");
		output("\n\nYour answer is automatic: a long declaration of affirmation that trails into a hiss of anticipation. <i>“Yesssssssss...”</i>");
		output("\n\nA blur of motion about your groin keeps you from being too aware of how Synphia does it, but she has your [pc.crotchCovers] almost ready to fall off. Then she slows down, biding her time. The pressure against your [pc.cockBiggest] slowly eases as she pulls away");
		if(precummies >= 3) output(", licking her lips at the webs of pre-cum soaking into <i>everything</i>");
		else if(precummies >= 2) output(", licking her lips when she sees the strings of pre-cum glossing your garment’s interior");
		else if(precummies >= 1) output(", licking her lips when she sees the bead of happy pre-cum manifesting at your apex");
		else output(", giggling at the sudden appearance of very erect penis");
		output(". She toys with you a minute longer, leaning closer and closer, letting your anticipation and erect" + (pc.hasCocks() ? "ions":"") + " build alike.");
		output("\n\nFinally hearing your gear hit the ground is enough to make your [pc.multiCocks] twitch.");
		output("\n\n<i>“There we go. All better.”</i> Synphia’s breathing fast, you note, the once predatory slits of her eyes dilated into wide-open circles.");
		if(pc.balls > 0) 
		{
			output(" <i>“Now would you rather have me start up here,”</i> she exhales onto your [pc.cockHeadBiggest], <i>“or down here.”</i> The snake-girl’s neck displays heretofore unseen flexibility by allowing her to crane all the way down to your [pc.sack], which she hefts experimentally ");
			if(pc.ballDiameter() < 4) output("in one palm");
			else if(pc.ballDiameter() < 8) output("in her hands");
			else output("in hands that seem to vanish into your testicular bulk");
			output(".");
		}
	}
	//Cocks out
	else
	{
		output("\n\n<i>“I like how you keep " + (!pc.hasCocks() ? "it":"them") + " on display,”</i> she admits, swiveling to either side for a better look at your dangling snake-tamer" + (pc.hasCocks() ? "s":"") + ". <i>“It lets the whole station know you’re a " + (pc.biggestCockLength() >= 7 ? "big, thick":"stiff") + " snack for the closest slyveren. That you’re the kind of [pc.guyGirl] who just smiles and nods when one of those gross goo-sluts slides under your table. As long as somebody’s servicing this... this marvellous thing, you’re happy, right?”</i>");
		output("\n\nThe silver-tongued snake’s words have your [pc.multiCocks] throbbing in happy agreement. Hissing, <i>“Yesssss...”</i> might not be one hundred percent accurate, but in the moment it <i>feels right</i> to advertise yourself as a willing cum-spout for thirsty aliens.");
		output("\n\nSynphia tugs the seal of her suit a little lower, baring the glossy upper expanses of her nipples. <i>“Or maybe...”</i> She shrugs, delivering a slight jiggle to her perky, half-bared breasts. <i>“Maybe you just dangle " + (!pc.hasCocks() ? "it":"them") + " out like " + (!pc.hasCocks() ? "a fishing lure":"fishing lures") + ", knowing girls like me can’t help but want a taste.”</i> Slick, shined lips drift closer, stopping at the last second. <i>“Rushers like you take what they want, and all this is just so you can take a girl like me. Is that it? Is that what you’re really up to?”</i>");
		output("\n\nYou stammer for a reply, too hard boner attempting to follow her mental gymnastics.");
		output("\n\nA fit of giggles from Synphia all but erases the worry from your mind. She’s smiling playfully. <i>“Who cares why you’re doing it, right?");
		if(pc.balls == 0) output("”</i>");
		else output(" The real question is, should I start up here...”</i> Synphia blows a kiss at your [pc.cockHeadBiggest], <i>“or down here?”</i> She arches her back like the galaxy’s greatest limbo champion and drops down until your [pc.sack] could rest on her face. You’d just have to lower yourself a quarter of an inch down. <i>“Tell me where to start, [pc.name]. Tell me how I can make you cum.”</i>");
	}
	processTime(10);
	pc.lust(50);
	flags["SYNPHIA_DICKMEMORY"] = pc.cockTotal();
	//Balls or cokk
	clearMenu();
	if(pc.balls == 0) addButton(0,"Next",penisRouter,[synphiaCockForeplay,9000000,false,0]);
	else
	{
		addButton(0,"Cock",penisRouter,[synphiaCockForeplay,9000000,false,0],"Cock","Put her to work on your dick.");
		addButton(1,"Balls",synphiaBallForeplay,undefined,"Balls","Put her to work on your [pc.balls] to warm you up.");
	}
}

//Cock Foreplay (1)
public function synphiaCockForeplay(x:int):void
{
	clearOutput();
	showSynphia(true);
	author("Fenoxo");
	output("You don’t need to say a thing. Looking at your prickhead is enough.");
	output("\n\nSynphia straightens, gently kissing her way up your [pc.cock " + x + "] as she goes");
	if(pc.hasCocks()) output(", one hand idly wiggling fingertips against " + (pc.cockTotal() == 2 ? "your":"a") + " spare shaft");
	output(". <i>“Oh, of course this is what you want.”</i> She wraps her fingers around your [pc.knot " + x + "] and gently squeezes. <i>“Everyone wants all the attention they can get up here.”</i> A long, wet kiss blesses the sensitive patch of skin below your [pc.cockHead " + x + "]. <i>“They want to be stroked and squeezed and kissed again and again.”</i> She peppers you with more smooches, leaning around the side to plant them to either side of a lust-fattened vein.");
	output("\n\nAfter all that teasing, you find yourself nearly overwhelmed by the intensity of tactile sensation. Synphia’s fingerscales are smooth, almost naturally slick as your tumescent flesh squirms in her grip. Her lips are preternaturally soft, like touching fresh-baked angel food cake frosted with slippery, alien saliva. They placate your rampaging libido with whisper-soft caresses chased by the steaming-hot warmth of her exhalations, coaxing you to throb in ecstatic delight at the quality of shaft-polishing service you’re getting.");
	output("\n\nWhen her lips break away, it takes great effort to roll your eyes back around and actually look at the grinning slut. Synphia’s still stroking you, of course, still providing a languid up-and-down pump, but her eyes are twinkling with the fire of a pair of distant quasars. She giggles, slapping her cheek with your [pc.cockNounSimple " + x + "].");
	//COCK COMMENTS!
	var comments:Array = [];
	var cummies:Number = pc.cumQ();
	var drippy:Boolean = (cummies >= 100);
	//Smol
	if(pc.cocks[x].cLength() < 6) 
	{
		if(!drippy) comments.push("So little! I’m always surprised to find someone with a nice, tight package like this. They’re always so easy to handle and even easier to stimulate. A cute dick like this? Of course I’m gonna make it cum. I’m gonna tease it and squeeze it and suck it until the poor thing is so bullied with pleasure that feeds me every drop of cum you’ve got.");
		//Drippysmol
		else comments.push("Stars, I love it when they’re little </i>and<i> drippy! Like, it’s already just the tightest, cutest little cock, and all that tasty pre-cum makes it impossible not to suck! How am I supposed to think around you when I know you’re packing this much virility into this cute of a package?");
	}
	//Huge
	if(pc.cocks[x].cLength() >= 24)
	{
		if(!drippy) comments.push("Fuck, just touching it makes my jaw start to unhinge. You’re </i>huge<i>, you know that right? I mean, I’m a slyveren. Sucking big, monster-dicks is in my genome, but I might struggle with this monster. The raw size... of it. There’s so much to serve... so much to taste. I feel like it’d take an hour just to explore every smutty facet of this supercock.");
		//Hugewet
		else comments.push("How you can get anything done with a dick that just... dribbles the moment a cute girl gets it hard? Look at it! My jaw started unhinging itself from that little slap, you’re making puddles on the floor, and this pillar of slut-breaking cock just has so many places I could please it. I think... one of those veins might be as thick as my pinky. This is going to be so good, [pc.name].");
	}
	//Treated
	if(pc.isTreated()) comments.push("Mmm, I love sucking treated " + pc.mf("studs","sluts") + ". Nobody’s dick smells as nice as one of you pheromone-factories. Give me long enough and I bet I’d actually cum, just from sniffing this musky bitch-breaker. Hell, I might even be tempted to let you f-fuck me, not that I will. Not when I can let my nose fill up with all those nasty, slut-making pheromones while I suck you dry...");
	//Multiple
	if(pc.hasCocks()) 
	{
		if(!drippy) comments.push("Look at this!”</i> She slaps your " + (pc.cockTotal() == 2 ? "second":"other") + " dick onto her other cheek. <i>“Look at this cock! You’re walking around with enough meat to satisfy a herd of galotians, and I have to pick one to cum down my throat? It’s almost paralyzing, but I guess it means that I always have something nice to look while my mouth’s busy ruining you for other girls.”</i>");
		else comments.push("Stars, you’re going to make such a mess of me! It doesn’t matter how much I swallow when you have " + (pc.cockTotal() == 2 ? "a second cock":"more cocks") + " right here, drizzling pre everywhere. It’s a good thing I opened up my jumpsuit to give you somewhere to aim it, huh? My scales always get so shiny after a fresh coat.");
	}
	//Equine
	if(pc.cocks[x].cType == GLOBAL.TYPE_EQUINE) comments.push("Oooh, somebody fancies [pc.himHer]self a stallion! I always had a soft spot for these. The head is always so </i>thick<i> that I can feel it rubbing me the whole way down my throat, and that sheath - mmph! It just begs for me to wiggle my tongue in and explore, drowning me in that salty-spicy mix of sweat and cock. There’s nothing better than the distilled taste of dick to a protein feeder, and I can’t wait to taste yours.");
	//Canine nosheath
	if(pc.cocks[x].cType == GLOBAL.TYPE_CANINE)
	{
		if(!pc.hasSheath()) comments.push("Ausar-dick’s always fun. There’s no sheath for it to hide in, so it has to hang out, nicely tapered and begging for a mouth to slurp it down. Think about it. It has that pointed tip that’s to get inside and easier to swallow, and then there’s the nice thick knot at the base, perfectly sized fill up your mouth with a heaping helping of sensitive dickflesh. Why do you think everyone loves the cummy puppies?");
		//Better dogdicks
		else comments.push("Oh! A real, bonafide dog-dick! Not one of those ausar imposters, huh? How’d you know these are my favorite? Seriously. It’s like they’re shaped for a slyveren to suck. The tip is nice and narrow to slowly open up my lips and maw, then when I’m swallowing it down my throat, there’s a lovely bulb for me to feast upon. I can pop it inside and run my tongue all around while the day’s built up dick-scent wafts out of your sheath into my nostrils, and there’s nothing better to a slyveren than getting to taste, smell, and feel all that at once.");
	}
	//Tendrils
	if(pc.cocks[x].hasFlag(GLOBAL.FLAG_TENDRIL) || pc.cocks[x].hasFlag(GLOBAL.FLAG_STINGER_BASED) || pc.cocks[x].hasFlag(GLOBAL.FLAG_STINGER_TIPPED)) comments.push("Oh, the tendrils are going to feel so weird inside me. Not bad though, not at all, especially if they’re full of that lust venom that suulas have. Of course, slyveren are mostly immune to it, but it’s still a naughty thrill to take a [pc.boyGirl]s dick deep in my throat and let [pc.himHer] get me extra blushy with it. Mmm, I could just sit there throat-deep for hours, letting those little wigglers kiss my lips and stroke my esophagus.");
	//Other knot
	if(pc.hasKnot(x) && pc.cocks[x].cType != GLOBAL.TYPE_CANINE) comments.push("Oooh, a knot! Did you get this just for little ol’ me? Did you know that my favorite part about knots is letting them pop in and out of my mouth, and then when they cum, I just </i>have<i> to keep it inside so it can pin my tongue down and bulge out my cheeks when it swells. Of course, if it doesn’t trap my tongue the whole way, I’ll be able to lick that poor, tender flesh for half an hour while you’re trapped in there, making sure you work out every drop.");
	//Other sheath
	if(pc.hasSheath()) comments.push("I’m glad you have a sheath, [pc.name]. Really. It’s like you’ve got this perfect, soft home for your cock, and if I suck well enough, I get to kiss it.”</i> She smiles slyly, the tip of her tongue appearing at the corner of her mouth. <i>“And somehow, it tastes and smells more like dick than your actual dick does. After I’m sucking awhile, I get used to the flavor, but all I have to do is lean close and </i>inhale<i>, and suddenly I can smell every little phallus-facet! It’s like it’s suck-bait, begging me to go deeper.");
	//Other blunt
	if(pc.cocks[x].hasFlag(GLOBAL.FLAG_BLUNT) && pc.cocks[x].cType != GLOBAL.TYPE_EQUINE) comments.push("Oh, these flat-tipped dicks always drive me wild, like it’s a column of pure, carnal cock designed to perfectly match my throat. I don’t have to open any more or less. Once it’s inside, I can focus on giving it all the suction and friction it needs for a good cum, and if I wanna focus on the taste, I just lay my tongue nice and flat to taste every inch on its way by.");
	//Tentacle
	if(pc.cocks[x].cType == GLOBAL.TYPE_TENTACLE) comments.push("You’re gonna keep this beast from getting too wiggly on me, right? I know </i>all<i> about tentacle dicks. I know how you can stretch them or pump them in and out without help from your hips, but if you’re gonna let me service you, I’m gonna need your delicious little wiggler to be a good boy and stay nice and straight until he pops.");
	//Kitty nodules
	if(pc.cocks[x].cType == GLOBAL.TYPE_FELINE) comments.push("Oh, these little spines are so fun to play with! They look like they’d hurt but they’re just squishy little toys, rubbing every which way while they fuck a hole. Of course, for a slyveren like myself, the extra texture doesn’t matter. What does matter are all the lovely little flavor pockets under each one. I can slide my tongue in, one at a time, whenever I want a spark of concentrated </i>dick<i> to make me drool.");
	//Purple
	if(pc.cocks[x].cockColor == "purple") comments.push("Nice coloration, " + pc.mf("stud","sexy") + ". You’re packing a real stylish pole, and it’s going to look so good sliding into me that I almost wish I rigged up a holocam back here. Purple and green just go together too well. I love it when I can watch a spit-glossed, purple " + (pc.cocks[x].cLength() >= 10 ? "throat-swabber":"mouth-filler") + " vanishing into my maw. It’s such a pretty sight. Void, if we did record this, we’d probably make some credits off it.");
	//Pure black
	if(InCollection(pc.cocks[x].cockColor,["black","onyx","ebony","pure black","glossy black","ink black","inky"])) comments.push("This cock is black as the void, [pc.name]. If it wasn’t for all my spit and kissmarks" + ((pc.hasStatusEffect("Cum Soaked") || pc.hasStatusEffect("Pussy Drenched")) ? " and the leftovers you left me":"") + ", I could almost lose track of it in the dark, but when the little bit of light back here catches it... wow. It shines like wet latex. Maybe next time we can find somewhere darker, and you can let me try to find it with nothing but scent.");
	//Green
	if(InCollection(pc.cocks[x].cockColor,["green","light green","dark green","leaf green"])) comments.push("Green on green! We match, [pc.name]. How about that! If we get caught, nobody’s gonna be able to tell where you end and I begin. They’ll just have to watch, confused, until I finish milking a monster load from you.");
	//Red
	if(InCollection(pc.cocks[x].cockColor,["red","crimson","scarlet","bright red"])) comments.push("You know, you’re redder now than you were a few minutes ago. I can tell. All that blood pouring into your cock, pumping it up, surging out with every kiss I plant... it’s lit you up nice and bright. You’ll be easy to keep track of. I can just glance at your dick and let the color tell me how close you are to spooging for me.");
	//Blue
	if(InCollection(pc.cocks[x].cockColor,["blue","cyan","light blue","sky blue","navy","navy blue","dark blue"])) comments.push("Don’t worry. Just because I’m working you up slowly doesn’t mean I’ll leave " + (pc.balls > 1 ? "your balls":"you as blue") + " as your dick. I’m going to spoil you rotten, and when I’m done, you’ll be so sucked-spent you’ll be purple.");
	//Gigacum
	if(cummies >= 10000) comments.push("There’s so much fucking pre! You drip like New Texan bull-studs cum. Look at this! I’m kneeling in a puddle of it, and you’re bathing the rest of me in it. When I bring you off, you’re gonna stuff me so full I won’t need to eat for a week. The station’ll think I’m pregnant, and nobody will know but you, me, and the gallons upon gallons of spooge you’re gonna fill me with.");
	//Full beast-mode package (sheath, knot, flare)
	if(pc.hasSheath() && pc.hasKnot(x) && pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) 
	{
		if(flags["SYNPHIA_BEASTSEEN"] == undefined) 
		{
			comments = ["Fucking stars, this dick is the total package. You didn’t just get some garden-variety horse-dick to stuff your loyal slyveren mechanic’s face with - you got all the best parts of every beast-wang in the universe and mixed them together into a drool-worthy package! How am I supposed to resist a flare like that, knowing it’ll balloon nice and wide and seal every drop in my belly? Or a big fat knot that I know’ll keep my tongue pinned down when it swells full of jizz. Ausars wish they had dick this good! Fuck, if I deepthroat you, I’m gonna wind up lost in that sheath, just sort of licking around and savoring all the pheromonal musk. I’m so glad I didn’t miss out on this... This is the best dick."];
			flags["SYNPHIA_BEASTSEEN"] = 1;
		}
		//Repeat bestmode
		else comments.push("I love this fucking cock. You know that, right? The flare, the knot, the sheath - hell, the fucking smell of it actually gets me wet. Do you know how rare that is? We don’t usually get that horny for dick, even if our version of hungry sounds and looks a lot like it, but this dick - this fucking bitch-tamer... it gets me wet every time. I can’t fucking wait to make you cum.");
	}
	//Normies!
	if(comments.length == 0) comments.push("What a wonderfully </i>serviceable<i> dick! Not too big, not too small, not modified to look like some dumb terran farm creature. No, this is clearly a proper cock for breeding, right? One that’s meant to make babies and look good doing it, and you’re going to let me steal all that juicy virile cum with my mouth. I’m so blessed!");

	output("\n\n<i>“" + comments[rand(comments.length)] + "”</i>");

	//Mergies wurgies
	//2hueg for sucks
	if(!synphiaCanSuck(x))
	{
		output("\n\nNodding along while you’re a little light-headed from arousal might be a gamble, but it’s one you’re happy to take. It’s all part and parcel of having a hyper-sized schlong: when you’re packing enough dick to please a dragon, you’ve got to accept being a little wobbly when you’re teased to absurd rigidity.");
		output("\n\nSynphia loves it anyway. Her unbridled cocklust has her grabbing you with both hands, struggling to wrangle your python into a more suckable position. Her brows knit with effort, and the snake-woman grunts when she finally arranges your [pc.cockHead " + x + "] in front of her pursed lips, her gaze slightly vacant while her mind plots out exactly how she’s going to milk your colossal cock. The size should bother her, but it doesn’t. She wants every inch, even if doing so would put you all the way through her petite frame.");
		output("\n\n<i>“I’m gonna have to use my hands,”</i> Synphia admits, kissing your cumslut. <i>“And maybe my tail, now that I think about it.”</i>");
		processTime(5);
		pc.lust(15);
		//[Next] -> Stroke & Headpolish
		clearMenu();
		addButton(0,"Next",synphiaVenomRouter,[x,false]);
	}
	//Not 2big bois
	else
	{
		output("\n\nCarried along in a verbal current of unfettered, carnal thirst, you let your head bob agreeably while the scaled succubus finishes her diatribe and positions her seductively shining mouth in prime position for spit-polishing.");
		output("\n\n<i>“Yesss...”</i> This time it’s Synphia who’s hissing, a moment later parting her plump, fuckable lips around your [pc.cockHead " + x + "]. She sucks it in slowly, letting those plush, cock-slobbering pillows spread across your most sensitive skin until they’ve locked back down on the other side. She stops long enough for you to recover from the pleasure and look down, then it’s her tongue’s turn. That delightfully whorish organ dances in circles across your crown, swirling and twirling in dick-tickling spirals of maddening ecstasy.");
		output("\n\n" + (pc.hasToes() ? "Your toes curl, and y":"Y") + "ou’re forced to lean back on a crate to keep from tumbling down." + (!pc.hasToes() ? " Your toes would be curling, if you had them.":""));
		output("\n\nStroking a hand along the underside, Synphia coaxes a dangerously blissful throb from your taut [pc.cockNounSimple " + x + "], and just when you think she’s going to work you off right there, her lips ‘<i>POP</i>’ right off. The coils of her tongue slurp back inside. Your slobbering snake-slut coos, <i>“Did you prefer that, or would you rather... this?”</i>");
		output("\n\nThe second time she swallows your [pc.cock " + x + "], she does not pause at the apex like a gloating mountain climber. No, she hollows her cheeks and effortlessly slides along your shaft, the plump cushions of her lips almost vibrating with erotic potential as they bump across vein after trembling vein. Her spit slathers everything in a layer of perfect slickness such that by the time she’s finally kissing around your [pc.sheathOrKnot " + x + "]" + (pc.hasSheath() ? ", nosing deep into the wrinkled folds there":"") + ", you feel like she’s taken ownership of your orgasm and could bring you to it at any second.");
		output("\n\nEverything goes cold a moment later when she catapults herself backwards, watching you with a coy smile and a flicker of blue from her horns. <i>“How do you wanna come, baby?”</i>");
		//Menu: headpolish or deepsuck
		processTime(6);
		clearMenu();
		addButton(0,"Suck&Jack",synphiaVenomRouter,[x,false]);
		addButton(1,"Deep Sucks",synphiaVenomRouter,[x,true]);
	}
}

//Venom Choice for headpolish or deepthroat
public function synphiaVenomRouter(args:Array):void
{
	clearOutput();
	showSynphia(true);
	author("Fenoxo");

	var x:int = args[0];
	var deepthroat:Boolean = args[1];

	output("You make your choice, but Synphia doesn’t jump to start yet. She strokes you, two-handed, working your spit-lubed length to keep you nice and hard" + (pc.cumQ() >= 100 ? " and dribbly":"") + " while she asks another question.");
	//first time, no new PG:
	if(flags["SYNPHIA_SUCKS"] == undefined) output(" <i>“And what about my venom?”</i> She opens wide, unhinging her jaw to proudly show you a pair of needle-like fangs springing down. <i>“" + (deepthroat ? "If I pump you full of venom before I start sucking... you’re gonna grow. You’ll be even bigger and harder for the next time you wanna fuck my face. Sounds nice, right? It won’t hurt at all. In fact... I guarantee you’ll love it.":"It won’t hurt at all, and help you cum so much harder. I promise, one little snakebite, and you’ll never want it any other way.") + "”</i>");
	//Repeats - did it last time no new pg
	else if(flags["SYNPHA_LASTVENOM"] == true)
	{
		output(" <i>“And my venom?”</i> She opens wide, showing off those fangs that helped bring you so much pleasure. <i>“You won’t mind if I give you a little nibble again, will you? It’ll be just the thing to help you spurt out all that backed up seed for me" + (deepthroat ? ", and I promise all the venom and the suction together’ll make you </i>bigger<i>":"") + ".”</i>");
	}
	//Repeats - didnt last time
	else
	{
		output(" <i>“And my venom?”</i> She opens her mouth halfway, letting the tips of her fangs spring out of confinement. <i>“It’s never too late to give it a try. Trust me when I say it’ll help you cum so much harder. Please please please tell me I can give you one, little, painless nibble so you’ll get the biggest, fattest, cummiest load you’ve ever shot. Please?" + (deepthroat ? " I’ll even suck extra hard so the venom’ll help you grow bigger!":"") + "”</i>");
	}
	//merge & display choices for venom or no venom.
	processTime(2);
	pc.lust(4);
	clearMenu();
	addButton(0,"Venom",getVenomedUpSon,[x,deepthroat]);
	addButton(1,"No Venom",noVenomSynphia,[x,deepthroat]);
}

//Venom
//for stroke+polish AND long sucks. Long sucks gives dick length.
public function getVenomedUpSon(args:Array):void
{
	clearOutput();
	showSynphia(true);
	var x:int = args[0];
	var deepthroat:Boolean = args[1];
	author("Fenoxo");
	output("<i>“Okay,”</i> you " + (flags["SYNPHIA_VENOMS"] == undefined ? "begrudgingly accept.":"eagerly blurt, filled with memories of your last envenomed slyveren blowjob."));
	output("\n\nThe blue in her horns flickers to an unstable pink as the snake-woman resumes kissing you, smashing her lips against your [pc.cock " + x + "] again and again. The kisses form a slowly descending sequence, counting down until she finally reaches your [pc.knot " + x + "], whereupon she stops, maw spread wide so you can feel the warm, spongy interior of her palate pressing firmly into you. Something - no, two somethings tickle at your dickskin for a half-second before a current of warm relaxation soothes them away.");
	output("\n\nYou realize a second later that she’s already bitten you, and that warm, ooey-gooey sensation that’s sliding into your dick and radiating into your hips is her venom. When it reaches your [pc.legOrLegs], you get a little wobbly but manage to keep yourself upright. You lean back against the crate’s woodgrain because it makes everything easier; your arms can dangle limp while your [pc.cockNounSimple " + x + "] twitches higher and harder, its entire length trembling and pulsating with the sensation of ripeness.");
	output("\n\n<i>“There you go,”</i> Synphia’s voice thrums inside your head, matched by the flaring pink that radiates from her horns. <i>“A little more won’t hurt, right?”</i>");
	//Balls
	if(pc.balls > 0)
	{
		output("\n\nYeah - you doubt much of anything would hurt right now, though your [pc.balls] " + (pc.balls == 1 ? "is":"are") + " getting awfully heavy. That incredible, indescribable heat feels like it’s dripping down into your sack, bathing your test" + (pc.balls == 1 ? "icle":"es") + " and triggering some kind of " + (pc.hasPerk("’Nuki Nuts") ? "cum-cascade":"nut-flooding rut") + ". Maybe her venom’s getting to you. You feel a bit woozy, looking down at her with her cock-mated maw affixed to your length. It’s hard to look at her without thinking about dumping all this jizz into her. Harder to adjust the increasingly weighty bulge just below. Her horns are pink like a pussy, just like the inside of her mouth, and it’d feel so nice to cum there...");
	}
	//No balls
	else output("\n\nYeah - you doubt much of anything could hurt right now, though your [pc.cocks] " + (pc.cockTotal() == 1 ? "is":"are") + " getting pretty heavy - heavy with cum, heavy with pleasure. Everything is full and flush and so unsubtly <i>meaty</i> that if your arms felt like moving, you’d probably be jacking off right now. Instead, you’re panting, harder than rock hard and kind of woozy, intensely aware of how <i>pink</i> the inside of the snake-woman’s mouth is - pink like a pussy. It’ll be so easy to cum into there, especially since you’re starting to feel kind of full and tight inside, like your body’s been thrown deep into an extra-virile rut.");
	//Merge
	output("\n\n<i>“Annnd, all done!”</i> Synphia pulls away, the pink swirling through the rainbow back to a steady blue. She’s smiling broadly, both hands on a dick so angry with blood and veins that it almost seems to belong to someone else.");
	output("\n\nFor a moment, your mind rebels at the strangeness of it all. The vivid need to flood her with seed has abated slightly, and you wonder if it’s normal for everything pink to look like a pussy... a creampie-hungry pussy.");
	output("\n\nYou forget about all that when Synphia starts to service you proper.");
	IncrementFlag("SYNPHIA_VENOMS");
	flags["SYNPHA_LASTVENOM"] = true;
	clearMenu();
	addButton(0,"Next",synphiaDickSuckSceneRouter,[x,deepthroat,true]);
}

//No Venom
public function noVenomSynphia(args:Array):void
{
	clearOutput();
	showSynphia(true);
	author("Fenoxo");

	var x:int = args[0];
	var deepthroat:Boolean = args[1];

	flags["SYNPHA_LASTVENOM"] = false;

	output("You turn Synphia down.");
	output("\n\n<i>“Awww, really?”</i> the snake-slut whines, still stroking despite her apparent disappointment. <i>“I guess I’ll just have to make you squirt </i>au natural<i>, but that’s fine.”</i> She kisses your [pc.cockHead " + x + "], staring up into your eyes while her voice thrums inside your head, <i>“Slyveren mouths are better than the wettest pussy.”</i> You blink from the sudden pink-flaring brightness from her horns, stiff and hard for Synphia’s mouth and not entirely sure her blue horns ever changed color.");
	output("\n\nYou forget about all that when Synphia starts to service you proper.");
	processTime(1);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",synphiaDickSuckSceneRouter,[x,deepthroat,false]);
}

public function synphiaDickSuckSceneRouter(args:Array):void
{
	//Args setup: 
	//[0] = x.
	//[1] = deepthroatBool
	//[2] = venomBool
	//[3] = cummies
	if(!args[1]) strokeAndHeadPolishingBySynphia(args);
	else longSucksWithSynphia(args);
}

//Stroke & Headpolish
public function strokeAndHeadPolishingBySynphia(args:Array):void
{
	clearOutput();
	showSynphia(true);
	author("Fenoxo");
	var cummies:Number = pc.cumQ();
	var x:int = args[0];
	var venomBool:Boolean = args[2];
	//Setting up cum tracking.
	args[3] = cummies;
	//setting up synphia cummies
	args[4] = false;

	//Reg head
	if(synphiaCanSuck(x)) output("It takes no time at all for Synphia to swallow up your [pc.cockHead " + x + "]. Maybe it’s her reptilian biology, but the sudden attack on your [pc.cockNounSimple " + x + "]’s freedom came lightning quick, surrounding you in the gentle warmth and pressure of her " + (venomBool ? "seemingly ":"") + "toothless maw. Her eyes drift closed almost immediately, and the plump ‘o’-ring of her mouth glistens from the moderate distention of your girth.");
	//Huge head
	else output("Despite her similarity to a snake, Synphia doesn’t strike like one - at least not with a target this big and bloated. Instead, she starts with a chaste, closed-mouth kiss, her sizable lips smushing outward from the pressure, then slowly sliding wider and wider on a curtain of miraculously produced spit. Her cheeks ripple when her jaw unhinges, and the pudgy ‘O’ ring of her mouth thins to slide wider, reaching out for the edge of your [pc.cockHeadNoun " + x + "]. Synphia doesn’t look worried about though. Her eyes are completely closed as if she’s too caught up in her sense of touch for anything else, too busy working her maw until it’s snugly seated in place: a warm, wet vice to wring dry your most sensitive nerves while leaving the rest exposed to her slippery palms.");
	//Merge
	output("\n\nYou ");
	if(venomBool) output("groan in semi-relaxed delight, pumping out " + (cummies >= 500 ? "a river":"a glob") + " of pre-cum for your thirsty friend.");
	else 
	{
		output("groan and clench, dripping ");
		if(cummies >= 10000) output("a river");
		else if(cummies >= 500) output("a stream");
		else if(cummies >= 100) output("a glob");
		else output("a droplet");
		output(" of pre-cum onto her tongue for her efforts.");
	}
	if(flags["SYNPHIA_HEADPOLISHES"] == undefined) output(" If you had known pleasure like this was so close all this time, would you have bothered to go on the rush at all?");
	else output(" If you weren’t currently groaning in inarticulate pleasure, you’d probably be uttering a prayer of thanks to any god who would listen. Synphia’s the kind of cock-pleasing treasure you count yourself lucky to have discovered on your journey.");

	output("\n\n<i>“");
	var synCockLuvLvl:Number = synphiaCockLoveLevel();
	switch(synCockLuvLvl)
	{
		case 0: output("Thank you."); break;
		case 1: output("Mmm, thanks for coming back."); break;
		case 2: output("I’m so glad you fell into my mouth again."); break;
		case 3: output("You have the best dick on the station, you know."); break;
		case 4: output("Mmm, I love this cock."); break;
		case 5: output("Mmm, you’re gonna get me addicted to this cock."); break;
		default: output("Oh, thank you so much, [pc.name]. I missed this dick. I missed it so much, and it tastes so goood..."); break;
	}
	output("”</i> Coral tones flash through the slyveren’s artificial horns along with the thought-transmitted words. <i>“");
	if(synCockLuvLvl < 5) output(" Now let’s give you the pleasure I promised...");
	else output("I know, I ought to shut up and start really servicing, but I just had to appreciate this... for a moment. Let’s make you cum, ‘kay?");
	output("”</i>");

	output("\n\nSynphia’s cheeks hollow to trap your [pc.cockHead " + x + "] right where it is, unintentionally causing it to ");
	if(!venomBool) output("swell further");
	else output("fill with more of her venom, the skin made torturously sensitive");
	output(". The hands on your shaft move again, stroking slowly. They slide with ease on skin thoroughly lubed in spit and sweat, helped by the teflon-smoothness of her palms.");
	if(pc.cocks[x].thickness() >= 6) 
	{
		output(" Her fingers can’t even wrap the whole way around your girth, but the scaly service-worker doesn’t need to " + (venomBool ? "after making every inch of you so wonderfully sensitive":"with how she strokes, using both hands together and rotating them as she pumps to touch every inch of sex-craving skin") + ".");
	}
	else if(pc.cocks[x].cLength() >= 6) output(" Her fingers form a slick tunnel for the scaly service-worker to milk you with, slowly accelerating her up-and-down pumping motions as she works you toward climax.");
	else output(" She doesn’t need to use both hands, small as you are, but she does anyway. One palm jacks back forth slowly, gradually increasing the tempo, while the other teases your briefly exposed skin with tantalizing strokes from a claw-tip.");
	if(venomBool) output(" It’s enough to trick your venom-dosed system into leaking sperm with your pre. Something’s broken open inside you, but it feels too good to care that she’s getting to suck the spunk right out of you.");

	output("\n\nYou don’t have to do a thing. This emerald beauty takes care of your [pc.cock " + x + "] for you");
	if(pc.hasCocks()) 
	{
		if(!venomBool) output(", though she doesn’t seem to mind when you reach down and grab hold of " + (pc.cockTotal() == 2 ? "your other":"another") + " drippy pole.");
		else output(", though you wouldn’t mind stroking your other pole" + (pc.cockTotal() > 2 ? "s":"") + "... if you weren’t so relaxed and blissful.");
	}
	else if(venomBool) output(", and everything is as it should be. You can’t muster the arm strength to jack yourself off, so why not just lean back and enjoy yourself?");
	else output(", and there’s nothing for you to do but lay an approving hand on top of her head, stroking her scales in the few moments you aren’t overwhelmed with pleasure.");
	output(" It’s exactly what you need after working so hard for so long. You don’t even find yourself shuddering or twitching overmuch, like your [pc.cockNoun " + x + "] knows that it’s being brought to orgasm and doesn’t need to do a thing.");
	output("\n\n<i>“That’s right, baby,”</i> Synphia’s voice coos inside your head, blushing her horns once more. <i>“" + (!venomBool ? "You don’t have to do anything but let me please you.":"Just enjoy what my venom and I can do. You’re going to love being sucked dry...") + "”</i> Her psi-amplifying horns swap back to blue, and she speeds up her strokes. Her spit-slicked palms slide fast enough to make the saliva bubble around her knuckles, then a fingertip rides your urethral vein from base to tip, squeezing out the most recent bit of " + (!venomBool ? "pre-":"drugged-") + "sperm to collect there.");
	output("\n\nEyes crossed, you smile " + (venomBool ? "dizzily":"broadly") + ", unaware that you’ve forgotten about Synphia’s tongue.");
	output("\n\nThat reptilian cock-polisher makes its presence known by slithering between the slyveren’s cheek and your [pc.cockHead " + x + "], curling up to wrap around the top and back down the other side. It burrows deeper, under your pulsating, drooling cock-tip before making a play to slip past her " + (pc.cocks[x].thickness() >= 5 ? "taut":"pillowy") + " lower lip. Once there, the whole thing begins to slowly rotate, drowning your prickhead in pleasure while Synphia drools. Spit splatters the floor wetly, but your every drop is perfectly devoured, sucked deep into the mechanic’s thirsty maw. The excess saliva is just lube for her hands.");
	//Venomed
	if(venomBool) 
	{
		output("\n\nYour head lolls back as conscious thought becomes too challenging to maintain in the face of the rising waves of pleasure. They lap at the edges of your mind, saturating every sense with a sodden undercurrent of sexual bliss. You feel horny but strangely satisfied, like you’re supposed to be this horny - like you can cum at any moment but it doesn’t really matter when so long as you can keep feeling Synphia’s hands and mouth working their magic on you.");
		output("\n\nHer tongue swirls.");
		output("\n\nTwo skillful hands massage you, faster and faster.");
		output("\n\nThe suction in Synphia’s throat warbles in and out of existence, feathering your [pc.cockHead " + x + "] with her cheeks’ velvet caresses.");
		output("\n\nYou are so hard that your [pc.cock " + x + "] is taut.");
		if(pc.balls > 0) output(" Your [pc.balls] hitch" + (pc.balls == 1 ? "es and sways":" and sway") + ", ready to empty any second.");
		output(" Even without all the spit, your skin would be glossy from how hard your pumped-up penis has swollen. The raw weight of it hangs in the back of your bliss-addled mind, reminding you of just how much you wanted to fuck Synphia’s face - of how badly you wanted to blow the universe’s biggest, fattest nut into her slow-sucking cum-receptacle.");
		output("\n\nThe snake-girl bats her eyelashes at you, and you hear one word: <i>“Cum.”</i>");
	}
	//Nonvenomed
	else
	{
		output("\n\nYou grunt louder than you mean to as the pleasure rises, lapping at the edges of your thoughts, making it difficult to think of anything but finally feeding the slut-snake what she wants. She has you so horny, riding the edge between ecstasy and orgasm, like she could push you over the edge at any second.");
		output("\n\nHer tongue swirls.");
		output("\n\nTwo skillful hands massage you, faster and faster.");
		output("\n\nThe suction in Synphia’s throat warbles in and out of existence, feathering your [pc.cockHead " + x + "] with her cheeks’ velvet caresses.");
		output("\n\nHolding out seems impossible, but thrusting to hurry your climax along at this point feels... rude. You look down and watch Synphia work instead. Her saliva-soaked fingers squish with every back and forth. She blinks and glances up, corners of her " + (pc.cocks[x].cLength() >= 18 ? "too-stuffed":"greedy") + " mouth lift. The tip of her tongue emerges as she whips the spiral into a vortex of hot muscle. Her horns flash pink again, and you hear the solitary word: <i>“Cum.”</i>");
	}
	//Merge. Cummies - all venom/nonvenom get main volume variations, then venom gets extra <i>“leftover”</i>
	//Venom adds +50mLs and +50% cummies.
	if(venomBool) 
	{
		cummies *= 1.5;
		cummies += 50;
	}
	
	//<6 mLs, only unvenomed should see
	if(cummies < 6) output("\n\nYou feel like you’re winding tighter, and tighter, and then there is blessed, pulsating relief. You spill your meager load into Synphia’s maw in trickles and dribbles, your reserves already exhausted before she started sucking. She looks a little disappointed, like the load you gave her wasn’t worth the effort, but nevertheless, the dutiful cock-sucker continues to pump and swallow until she’s sure every single droplet you’ve offered her is securely in lodged in her tummy.");
	//< 100 mLs
	else if(cummies < 100)
	{
		output("\n\nLike a switch is flipped in the back of your head, you cum. Your eyes roll back while your [pc.cocks] do what nature intended and fling thick ropes of [pc.cumNoun] into Synphia’s wide-open throat" + (pc.hasCocks() ? " and across her face":"") + ". Her eyes smile beautifully" + (pc.hasCocks() ? " under the webs of jism":"") + ", and she noisily gulps, still sucking and stroking, adding more rotation to her hands as she milks you for the full duration of your slyveren-feeding climax. The volume isn’t a problem for her in the slightest. As a matter of fact, Synphia is sucks even harder for the last half of your orgasm, laying out her tongue like a red carpet to ensure every droplet of [pc.cumColor] protein is collected.");
	}
	//< 500 mLs Happysnek.
	else if(cummies < 500)
	{
		output("\n\nSomehow, that command was all it took to unblock your virile pressure. Your [pc.cock " + x + "] distends slightly with the first jet, but Synphia’s smooth sucking continues unabated. She audibly swallows for sure, but her eyes are still twinkling as the next spurt arrives. She coos in between pulses, stroking you with ravenous-seeming hunger, coaxing you to flood her maw with the thickest, creamiest, most densely virile [pc.cumNoun] you can feed her. You erupt as hard as you can, and the scaly seed-addict takes it all with a happy sigh and a small shudder of satisfaction.");
	}
	//< 2000 mLs Snekcheeks bulge once.
	else if(cummies < 2000)
	{
		output("\n\nNow that you’ve been " + (!venomBool ? "given permission":"received the universe’s most persuasive command") + ", you finally achieve the ecstatic release Synphia’s been teasing you with the entire time. Your [pc.cocks] let" + (!pc.hasCocks() ? "s":"") + " loose a deluge of [pc.cumVisc], [pc.cumColor] [pc.cumNoun] directly into her waiting maw" + (pc.hasCocks() ? " and across her face, tits, and horns":"") + ". The sheer volume of it actually catches her off guard. The lithe, confident mechanic’s cheeks bulge with your first virile deposit, and she’s forced to take a heavy, near-choking gulp to get it all down. You spray in again, but this time, Synphia’s waiting for it. She watches you with twinkling, slitted eyes as you spray directly into her throat. Your spunky load feeds her better than any home-cooked meal and fills her better than a Thanksgiving turkey. You can see the proof in how her jumpsuit bulges slightly at the middle.\n\nShe’s gained a pound or two of liquid cum-weight.");
	}
	//< 10000 mLs Snek works hard to swallow the whole meal. Deece paunch.
	else if(cummies < 10000)
	{
		output("\n\nYour body’s answer is immediate an automatic. You flood the snake-girl’s toothless" + (venomBool ? "-feeling":"") + " maw with [pc.cum]. Her cheeks bulge obscenely from the raw volume, but she manages to get it all down with one exceedingly lurid-sounding gulp. Your next pulse finds her more ready; it sprays down the back of her throat, yet there’s so much of the sperm-infused goo that some of it piles up in the back of the shocked snake-woman’s mouth before it can finish sloughing down into her belly. Surprised, Synphia gulps at it, her eyes filled with something that looks like a mixture of shock and delight. Each eruption finds her maw more prepared for it than the last. She adapts to your cumshot. By the end of the meal, she’s suckling needily at your [pc.cockHead " + x + "] and gently rubbing a visible belly bulge.");
	}
	//< 25000 mLs Snek cums from meal. Big paunch. One dribble onto a tit.
	else if(cummies < 25000)
	{
		output("\n\nIt feels like Synphia’s " + (!venomBool ? "suggestion":"command") + " reaches into your [pc.balls] and pops the cork. Suddenly you’re spraying, dumping a torrential flow of [pc.cum] straight into the willing snake-girl’s maw. Her cheeks balloon for a moment before the well-practiced protein-guzzler’s instincts kick in and force it all down the wide-open tunnel of her throat. It must not be easy for her; she lets go of your shaft to grab onto your [pc.butt], pulling herself forward with each torrential ejaculation to keep the pressure from tossing her off.");
		output("\n\nA cummy trickle escapes from the corner of her otherwise " + (pc.cocks[x].thickness() >= 4 ? "taut":"sealed") + " maw, dripping slowly into the jumpsuit-encased cleavage, but that’s it. The rest of your climax’s volume securely winds its way through the gagless girl’s throat and straight into the straining spunk-dumpster that is her middle. A body that size wasn’t meant to store that much fluid, not all at once. Her tummy is bulging and pregnant-looking, and as your high-pressure sperm-jets die down, she’s free to stroke her hands across it in slow wonder.");
		output("\n\nSynphia’s darkened crotch and daggerpoint-nipples would tell you how she enjoyed her meal, even if her lazy, hooded eyes and [pc.cumColor]-saturated smile didn’t.");
	}
	//< 60000 mLs Snek cums and makes a mess. Very preggo belly.
	else if(cummies < 60000)
	{
		output("\n\nSynphia’s " + (!venomBool ? "suggestion":"command") + " hits you like a hovertruck knocking over an old-style fire hydrant. You feel your [pc.cocks] urethra" + (pc.hasCocks() ? "s":"") + " ballooning, distending with raw liquid payload, then the cummy deluge is spraying out, flooding the snake-woman’s maw" + (pc.hasCocks() ? " and cascading over her in a bath of [pc.cumVisc] [pc.cumColor]":"") + ". She grabs onto your ass instead of your shaft almost instantly. Her petite biceps flex with the effort of holding on against the pressure, but what’s truly impressive is her throat: it dilates wide-open, letting her belly fill with audible ‘glugorps’ one cumshot at a time.");
		output("\n\nStreamers of [pc.cumGem] goo cast virile webs across your [pc.legOrLegs] when the straining seal of Synphia’s lips finally gives out. She looks up at you, half-panicked and half aroused, a prisoner to the power of your climax. Her nipples stand out like daggerpoints above the slow-rounding dome of her inflating belly. Lashing behind her, the snake-woman’s tail suddenly goes straight and rigid. Her eyes roll back, and the fragrant smell of pussy mixes into your own sexual bouquet. You can’t see her crotch, but you can see the clear puddle spreading beneath her, slowly diluting into the mess around it.");
		output("\n\nEventually, she blinks her reptilian eyes back into position and looks up at you blearily, somewhat uncomprehending as to why her belly’s slow wobbles persist. You reach down and pat Synphia on her head, sighing as the final, stomach-impregnating spunkblast fires out of you" + (pc.balls > 0 ? "r [pc.balls]":"") + ". She’s a little dizzy and confused, with a trickle of cum leaking from a nostril, but there’s no hiding the aura of satisfaction she radiates.");
		output("\n\nEven her horns have gone white, seemingly short-circuited by the sperm-stuffing.");
		args[4] = true;
	}
	//2much4snek. - Huge mess. Snake falls off and corner of room floods.
	else
	{
		output("\n\nThat’s all it takes to transform you into a living [pc.cumNoun]-volcano. Your [pc.cocks] strain, urethra" + (pc.hasCocks() ? "s":"") + " ballooning to comic size, and you cum. A tidal wave of spooge sprays into Synthia’s unprepared maw, slamming her backward. It doesn’t matter how wide-open her throat is or how adapted to taking down huge cum-loads her species is: the simple physics of the equation slam you the rest of the way back against the crate and fling her into the opposite wall, hosing her down with the near-continuous flow of [pc.cumVisc] relief.");
		output("\n\nThat’s fine though. She wanted this cum!" + (!venomBool ? " You grab hold of yourself two-handed and milk out the next shot, and the next shot, and the next.":" You let the venom-empowered shots launch forth, again and again and again."));
		output("\n\nSynthia takes it like a champ, kicking out her feet to hold herself steady and opening wide to catch as much delicious goo in her gullet as possible. She’s loving it, too. You can tell, even with her eyes closed. Her hands are smearing the juices all over her - especially into her jumpsuit, eventually concealing the daggerpoints of her nipples from view. Her crotch is dark and damp from within, though you can’t see it for long. Sheets of hanging [pc.cumNoun] quickly cover it and the rest of Synphia’s body.");
		output("\n\nYou bury her in the sinful tide until there’s no seeing any of her colors, not even her horns, and then you cum some more, building up a pool around her. She shudders and stuffs a hand down her suit, jilling her way to a second climax while you build up enough layers to completely conceal her identity. She’s not a person anymore, just a humanoid cum-figure frigging itself off.");
		output("\n\nOnly when you finish up does gravity assert enough of its dominance to unsheath her features once more. Synphia burps and giggles, <i>“Wow.”</i>");
		args[4] = true;
	}
	processTime(10);
	pc.orgasm();
	if(venomBool) pc.lust(25);
	clearMenu();
	//Making sure accurate cummies :3
	args[3] = cummies;
	if(venomBool && pc.cumQ() >= 100) addButton(0,"Next",extraCumLeakingPostSynphia,args);
	else addButton(0,"Next",synphiaEpilogue,args);
}	//[0] = x.
	//[1] = deepthroatBool
	//[2] = venomBool
	//[3] = cummies
	//[4] = synphia cummies

//Venom’ed and still have cum left
public function extraCumLeakingPostSynphia(args:Array):void
{
	clearOutput();
	showSynphia(true);
	author("Fenoxo");
	
	var x:int = args[0];
	var venomBool:Boolean = args[2];
	var cummies:Number = args[3];
	var cumLeft:Number = pc.cumQ();
	var synCum:Boolean = args[4];

	output("Imagine your surprise when Synphia resumes stroking you, and you cum again. The first one was just a warm-up. It primed the pump, and the dickload of venom you’re carrying makes it so easy to clench and erupt again and again.");
	if(!synCum) output(" Synphia slithers forward add the second course to her meal. This time she toys with it, running your [pc.cockHead " + x + "] over her lip to give it a nice coating before taking her drink.");
	else output(" Synphia doesn’t even bother to try to drink it. You’ve already satisfied her. Instead, she focuses on making sure she milks out every drop.");
	output(" Standing upright while your sensitized shaft is so abused is impossible; you drop to the cement, <i>still</i> squirting" + (!synCum ? " with a snake-woman’s slobbering maw drinking every drop":", flinging slowly weakening ropes across the snake-woman’s messy jumpsuit") + ".");
	output("\n\n<i>“I promised you, didn’t I?”</i> Synphia burbles, rolling a blob of [pc.cumNoun] around in her maw. <i>“I told you you’d love my venom - that it’d help me milk you dry.”</i> She slides closer, grinding her sticky chest to your spunk-distended underside. A fresh rope dangles from her glowing horns. <i>“I told you it’d make you cum </i>so hard<i>.”</i> She milks a long, wet stream onto her collarbone. <i>“And you can’t help but shoot every drop and love doing it,”</i> Synphia giggles. <i>“Let it all go.”</i>");
	output("\n\nYou do.");
	if(cumLeft >= 4000) output(" It might flood the corner" + (cummies >= 60000 ? " even more":"") + ", but you do. There’s something so intrinsically satisfying about splashing absurd ropes of seed into the building protein puddle. She was right: you adore this.");
	else if(cumLeft >= 350) output(" It might be longest, most uncontrollable orgasm of your life, but you have to agree: you adore this.");
	else output(" It might not be all that much, but you give up every drop. She was right: you adore this.");
	processTime(6);
	pc.orgasm();
	pc.ballFullness = 0;
	clearMenu();
	addButton(0,"Next",synphiaEpilogue,args);
}

public function synphiaEpilogue(args:Array):void
{
	clearOutput();
	showSynphia(true);
	author("Fenoxo");
	var x:int = args[0];
	var synCum:Boolean = args[4];
	var throbhelp:Boolean = false;
	var cummies:Number = args[3];
	var deepthroat:Boolean = args[1];
	//Messed jumpsuit fix
	if(synCum) output("Synphia staggers back, dripping, and reaches for her toolbelt. Whatever she’s going for must be small; the spunked-up snake sure is having a tough time finding it. She gasps and straightens, letting a small hovering drone float off her hand. It spins about and begins the arduous process of somehow zapping away the collected mess, unearthing wide expanses of Steele Tech jumpsuit to shine like it’s brand new. <i>“There we go. All better,”</i> Synphia coos, turning this way and that to ensure every drop is evaporated.");
	//Nonmess
	else output("Synphia stretches and steps back, checking her appearance in her codex to make sure she’s not too slimed with dick to work. <i>“Looking fine, sister,”</i> she whispers to herself, turning this way and that with her lips puckered. <i>“Looking fine.”</i>");
	//Came
	if(synCum) 
	{
		output("\n\nYou smile broadly");
		if(!pc.isCrotchExposedByLowerUndergarment()) output(" and indicate the waist-high damp patch. Marinating your garment’s interior lining in one’s own pussyjuice can’t be good for it");
		output(".");
		//First cum
		if(flags["SYNPHIA_DICKGASMS"] == undefined || flags["SYNPHIA_DICKGASMS"] <= 1) output("\n\n<i>“Hey!”</i> Synphia slaps your shoulder. <i>“It’s not like I wanted to cum. I was just getting a meal. You were the one who had to make it all... sexy.”</i> She licks her lips and squirms. <i>“Besides, everything’s covered up. I’ll be fine.”</i> A tug at the constricting fabric does little to fix how much of her camel-toe is on display. <i>“And umm... I guess if you ever feel... backed-up again, don’t hesitate to ask. This was fun.”</i>");
		//Second Cum
		else if(flags["SYNPHIA_DICKGASMS"] <= 2) output("\n\n<i>“Yeah yeah,”</i> Synphia grumbles, half-heartedly attempting to adjust the fabric so that it doesn’t display her camel-toe quite so clearly. <i>“There’s worse things than cumming myself rotten from sucking off the future heir to my company. Besides, we both know you like it. You always squirt a little harder once I get all squirmy for you.”</i>");
		//Third Cum
		else if(flags["SYNPHIA_DICKGASMS"] <= 3) output("\n\n<i>“Mmmhmmm,”</i> Synphia hums, wiggling her hips and tugging at her suit with both hands. No matter how she adjusts herself, it winds up clinging perfectly to her vaginal lips, presenting you with a clear view of her camel-toe. <i>“I’m gonna ruin this suit because of you. You keep making me squirt into it. Do you have any idea how many times I have to wash it to get the smell of pussy out of it? Of course you don’t. You just sit there and cum all sexy for me.”</i> She shudders, pulling a finger out of her shrink-wrapped vaginal crease. <i>“I guess I can’t complain...”</i>");
		//Fourth Cum
		else if(flags["SYNPHIA_DICKGASMS"] <= 4) output("\n\n<i>“So?”</i> Synphia shrugs. <i>“My boss complained after last time. Told me he could smell my cunt across the hangar and asked me why I was fucking on the clock.”</i> She lazily slides a finger through her sodden delta. <i>“I explained that I was on a meal break, of course - a very good meal break. He didn’t care. Said I was gonna break his dick with a scent like that, and that if I was gonna smell like a slut, I’d need to make sure it wouldn’t distract him.”</i> Shaking her head, Synphia titters, <i>“I guess what I’m saying is, you make my cum so hard that I’ll blow my boss every day as long as I get to wait here for more of this dick.”</i>");
		//Fifth
		else if(flags["SYNPHIA_DICKGASMS"] <= 5)
		{
			output("\n\n<i>“Yeah, you fucking " + pc.mf("stud","goddess") + ".”</i> Synphia leans back and slides her fingers through her soaked delta. <i>“You got me off again.”</i> She holds her fingers up and sniffs, snaking her tongue out a second later to harvest the dripping fluid. <i>“We’re supposed to be attracted to girls with pussies to mate, but somehow you keep getting me off. How is that, [pc.MisterMiss] Steele? How is it you’re taming this slyveren?”</i> She shrugs. <i>“Only way to find out is to give me more later.”</i>");
		}
		//Sixth
		else if(flags["SYNPHIA_DICKGASMS"] <= 6) output("\n\n<i>“Yep,”</i> Synphia steps forward and presses her crotch to you, sliding it along your [pc.leg]. <i>“Feel that? That’s soaking wet slyveren pussy. You did that. You and that big, dumb dick of yours.”</i> She grinds in a slow circle. <i>“And you keep doing it to me. You’re ruining my jumpsuit. I don’t think the smell of ready cunt ever completely dissipates, and it’s getting stronger each time you make me squirt. You’re torturing my poor boss with this, you know that right?”</i> Synphia winks.");
		//7th
		else if(flags["SYNPHIA_DICKGASMS"] <= 7) output("\n\n<i>“Yeah, that’s your trophy patch,”</i> Synphia explains. <i>“That’s the part of the suit that’s always smelling like pussy. The part that reminds me of you every time I get a whiff of it.”</i> She squirms this way and that, stepping up to rub it against your leg. <i>“Because you get me wet, [pc.name]. You get me wet, and hot, and make me cum, and I don’t know why.”</i> She pants, tongue lolling out. <i>“And you better not stop. See me soon?”</i>");
		//8+
		else output("\n\n<i>“Oh yeah, does somebody like [pc.hisHer] tamed slyveren?”</i> She swings her hip around, planting her sopping cunt square on your [pc.leg], smearing her leaking juices about. <i>“You got my cunt trained, [pc.name]. When I see you, I start getting damp. When I smell my cunt, I think of you, and you’ve ruined my jumpsuits. Everybody knows I’m the horny slyveren mechanic, the one who jills off while she sucks off her boss, imagining it’s your dick I’m sucking the whole time.”</i> Her voice trembles, and rivulets of fragrant juice slide down your [pc.foot]. <i>“You can fuck my face any time, [pc.name]. Just say the words, and my mouth’s your personal pocket-pussy... but until then, I should probably pretend to get some work done... and definitely not masturbate thinking about all that cum.”</i>");
		
	}
	//Didn’t cum
	else
	{
		output("\n\nYou clean yourself up as best you can.");
		//DIDNT CUM ENOUGH VARIANT
		if(cummies < 25) 
		{
			output("\n\n<i>“You know, I expected a little more than that,”</i> the proud mechanic explains. <i>“This is supposed to be a meal, after all. Here,”</i> she produces a vial of Throbb, <i>“maybe this’ll help you out for next time, okay? I’m not giving up on you, [pc.name].”</i>");
			throbhelp = true;
		}
		//First sukk
		else if(flags["SYNPHIA_SUCKS"] == undefined) output("\n\n<i>“How would you rate your service?”</i> the proud mechanic leans forward to pat your crotch, burping. <i>“10/10 right? Well let me tell you, your dick isn’t bad either, [pc.misterMiss]. I’ll suck you again any time. Just ask.”</i>");
		//Second sukk
		else if(flags["SYNPHIA_SUCKS"] <= 1) output("\n\n<i>“Mmmm, that hits the spot,”</i> the proud mechanic coos. Squeezing your crotch possessively, she adds, <i>“I gotta say, I really enjoy your flavor. There’s something about it that leaves me smiling every time.”</i>");
		//Third sukk
		else if(flags["SYNPHIA_SUCKS"] <= 2) output("\n\n<i>“Oh yeah, this is good dick,”</i> the proud mechanic spouts, squeezing your crotch possessively. <i>“Bring it back for your next scheduled service in... whenever your next free time is, okay? You’re the tastiest meal I’ve had in ages.”</i>");
		//4th sukk
		else if(flags["SYNPHIA_SUCKS"] <= 4) output("\n\n<i>“Mmm, like fucking gourment spooge,”</i> the proud mechanic gasps. <i>“I can’t fucking get enough of this dick.”</i> She squeezes your crotch, wrapping her tail around your [pc.butt] affectionately. <i>“I wake up in the morning, and all I can think about is how good you’d be for breakfast - how fucking tasty a good suck would be.”</i>");
		//5th sukk
		else if(flags["SYNPHIA_SUCKS"] <= 5) output("\n\n<i>“You know you get me wet, right?”</i> the proud mechanic admits. <i>“Sucking you off, I mean. I don’t even have to touch myself. I just get all juicy from your taste and your smell and how nice your cum feels sliding into my stomach.”</i> Synphia shudders from her head to the tip of her tail. <i>“A girl could get used to meals like you.”</i>");
		//6th sukk
		else if(flags["SYNPHIA_SUCKS"] <= 6) output("\n\n<i>“I think you’re giving me a kink for cock, [pc.name],”</i> the proud mechanic admits. <i>“I mean, slyverens always want cock, but it’s actually kind of sexual with you. It’s not just a feeding things, it’s a physical-emotional thing that gets me all wet and squirmy. I just... I want all my meals to be your dick. Maybe consider retiring to Uveto when the rush is done, okay?”</i>");
		//7th sukk
		else if(flags["SYNPHIA_SUCKS"] <= 7) output("\n\n<i>“Mmm, good dick.”</i> The proud mechanic pats your crotch, squirming slightly as she does. <i>“You’re always so sexy to blow, getting me all worked up. I put a camera back here, you know... so I have something to help me remember what it looks like... how it tastes... how it soaks my pussy right up. And uh, call me whenever you need relief. I don’t care if there’s six starving galotians begging for it - I deserve your climaxes.”</i>");
		//8th sukk
		else output("\n\n<i>“Oh, you don’t need to clean yourself, darling.”</i> The proud mechanic wiggles closer, gently stroking your still-sensitive bulge. <i>“I sucked you spotless, right? I take care of everything. Whatever your dick wants, it gets.”</i> She puckers up and kisses your neck, whispering " + (pc.tallness >= 72 ? "up to":"into") + " your ear, <i>“This maw... is property of [pc.name] Steele’s dick.”</i> Her fingers stroke and squeeze for a moment before she breaks away. <i>“And that means getting to fuck my face whenever you want.”</i> She steps back. <i>“I hope you want it soon.”</i>");
	}
	//Sukkcount merge, then use walk away text.
	output("\n\nShe departs back to the hangar. You follow a moment later.");

	//Feed her a load :3
	chars["SYNPHIA"].loadInMouth(pc);
	//A feeding is good for a rest, right? Clear the Cooldown timer on ballswelling.
	pc.removeStatusEffect("Synphia_Tired");
	//Increment times sukked
	IncrementFlag("SYNPHIA_SUCKS");
	//Increment times headpolished/throated
	if(deepthroat) IncrementFlag("SYNPHIA_HEADPOLISHES");
	else IncrementFlag("SYNPHIA_DEEPTHROATS");
	//Increment times she came if she came
	if(synCum) IncrementFlag("SYNPHIA_DICKGASMS");
	//fully empty balls if venomed & slightly increase output.
	if(args[2]) 
	{
		//Deepthroat gets a smaller cum boost due to being used for grosuck
		if(args[1]) pc.boostCum(1);
		else pc.boostCum(3);
		if(pc.hasPerk("Potent")) pc.boostCum(2);
	}
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	if(throbhelp)
	{
		output("\n\n");
		quickLoot(new Throbb());
	}
}

//Args setup: 
	//[0] = x.
	//[1] = deepthroatBool
	//[2] = venomBool
	//[3] = cummies
	//[4] = synphia cummies

//Long Sucks
public function longSucksWithSynphia(args:Array):void
{
	clearOutput();
	showSynphia(true);
	author("Fenoxo");

	var cummies:Number = pc.cumQ();
	var x:int = args[0];
	var venomBool:Boolean = args[2];
	//Setting up cum tracking. Will probably rework anyway.
	args[3] = cummies;
	//setting up synphia cummies
	args[4] = false;

	//Reg size
	if(pc.cocks[x].thickness() < 4)
	{
		output("It takes no time at all for Synphia to properly affix herself to your [pc.cock " + x + "]. Maybe it’s her reptilian biology, but she strikes forward like lightning, swallowing up inches of length in microseconds. She sheaths you like her mouth was made solely for this purpose: a perfect inverse mold of your dick cast from the universe’s softest, wettest, most fuckable substance. The slyveren devours you to the root");
		if(pc.hasKnot(x)) output(", smiling around your bulbous knot");
		else if(pc.hasSheath()) output(", nosing into your sheath");
		else output(", angling herself to comfortably guide your length into her throat");
		output("." + (venomBool ? " It’s the perfect place for a venom-tenderized prick to be, swaddled up in slick friction and warm appreciation.":""));
	}
	//Upper limit size
	else
	{
		output("Synphia takes her time swallowing you up, spreading her luscious lips into a wide ‘o’ before smashing them against your [pc.cockHead " + x + "] and letting it stretch her maw the rest of the way. Swallowing your length is no easy feat, even for her. For every inch that vanishes into her maw, she gulps, distending her neck a little more, feeding you deeper into her throat." + (venomBool ? " The venom makes it easy for your shaft to bend and flex, and it may be responsible for the halfhearted throbs that fling strands of pre into her tummy.":"") + " The snake-woman’s nose ");
		if(pc.hasSheath()) output("burrows deep into your sheath, saturating her breaths with your phallic musk. She seems to revel in it, wiggling in an attempt to get deeper, huffing on your crotch.");
		else if(pc.hasKnot(x)) output("eclipses the bulbous surface of your knot, wrapping in the tight, wet, hot tunnel that is her mouth.");
		else output("boops into your loins a second before her suckling lips kiss your base.");
	}
	//Merge
	output("\n\nYou are exactly where she wants you.");
	output("\n\nA mischievous little muscle announces itself by sliding against your [pc.cockNoun " + x + "]: Synphia’s tongue. It’s long and thick on the edges - perfect for sandwiching between the bottom of her mouth and your curved underside, and when it does slide, it does so knowingly, tweaking tender spots that make your toes curl and you dick momentarily swell, stretching her maw further.");
	if(venomBool) output(" Something thick and viscous and <i>pleasant</i> slides out of you when she does it. The venom has pried something open inside you, something that’s making your pre pour out with a bit of sperm mixed in. If the beginning of the blowjob feels like this, how good is going to feel to cum?");
	else output("There’s something so arousing about the situation, leaning here, looking down while you dribble pre-cum " + (pc.cocks[x].cLength() >= 10 ? "right down the back of her throat":"onto the central groove of her tongue") + ".");
	//ball licking
	if(pc.balls > 0)
	{
		output("\n\n<i>“More,”</i> Synphia’s voice flashes pink against your mind, and her tongue slides further, wiggling between your trembling dickflesh and the pouty pillow of her bottom lip to find your sack. It twirls and curls around the testicular pouch, tasting every inch. She laps at your ballbag like it’s her lollipop, and every lick drags the velveteen surface of her tongue along " + (pc.cocks[x].cLength() < 10 ? "the rest of your [pc.cockNounSimple " + x + "].":"the parts of your [pc.cockNounSimple " + x + "] not yet devoured by throat.") + " <i>“Mmm, tasty" + (pc.ballDiameter() < 2 ? " little":"") + " cum-tanks you got here.”</i> It wraps around your [pc.sack] like some kind of prehensile tentacle, nearly tying up your ball" + (pc.balls > 1 ? "s":"") + ".");
	}
	//Venomed suckbigger
	if(venomBool && pc.cocks[x].cLength() < 36)
	{
		output("\n\nNothing prepares you for Synphia’s suck. You thought the warm, sopping pleasure of her maw was incredible, yet it’s her suckling that blows your mind. Your envenomed [pc.cockNounSimple " + x + "] swells so pleasantly in the presence of vacuum. It feels like it’s being stretched out, like when her wondrous suckles are helping you to fill every crack and crevice of her mouth. <i>“That’s it,”</i> Synphia’s voice whispers. <i>“So big and virile.”</i> Her horns flicker from pink back to blue, and she hollows her cheeks once more, puffing up your dick to the point that it feels heavy and swollen.");
		output("\n\n<i>“More.”</i> She sucks harder, and your flesh swells obediently. The glow from her horns shifts to green, but there’s too much pleasure in being sucked bigger to care about the serpentine rainbow. You can feel your [pc.cock " + x + "] expanding, ballooning. It’s getting longer, growing to satisfy the insatiable alien, and you want to satisfy. [pc.CumColor] pre drips down her throat, pushed a little deeper every time. You could cum from this, you realize. Growth is its own kind of ecstasy, the expanded surface of your prong tingling from the sparking appearance of thousands of sensitive new nerves.");
		output("\n\nThe glow from the snake-woman’s horns fades to background levels, but the added size remains. Her eyes twinkle knowingly when she looks up, and her tongue rewards you with a slow, steady lick from throat to spit-slathered loins. The shape of your upgraded member shows clearly through Synphia’s scaled throat.");
		pc.cocks[x].cLengthRaw += 0.5;
		if(pc.hasPerk("Hung")) pc.cocks[x].cLengthRaw += 0.5;
		else pc.cocks[x].cLengthRaw -= 0.25;
	}
	//novenom promises
	else
	{
		output("\n\nNothing can prepare you for the sudden intrusion of her voice into your mind, projected with a pink glow from her horns. <i>“" + (!venomBool ? "Imagine how much hotter this would be if you let me use my venom. I’d be sucking you so big and so hard." : "You’re so big I can’t suck you any bigger! My throat is crammed completely full, you beast.") + "”</i> Her hands stroke your thighs while she promises you pleasure. <i>“" + (!venomBool ? "I’d suck, and you’d swell, and I’d suck, and you’d get the fattest, drippiest boner - the kind of cock that really fills my throat. Wouldn’t that be lovely?" : "I’ll just cling to you like shrink-wrap while I work you with my throat, and you’ll get to dribble all that pre straight into my gut, fucking my face like some tight virgin’s pussy. Won’t that be lovely?") + "”</i>");
		output("\n\nIt would be so lovely... or at least it seems that way until the pink light fades back to its normal blue.");
	}
	//merge
	output("\n\nLips assault you next. Gently pushing on your [pc.belly], Synphia slides her head back, gliding her plump cock-suckers back on a curtain of her own saliva. She only goes about halfway, leaning back enough for your [pc.cockHead " + x + "] to rub against the bend in the back of her throat. Then she gobbles you back up, noisily swallowing down your dick until she can bounce her lips off your well-slobbered " + (pc.hasSheath() ? "sheath":"abdominals") + " and do it all over again. Spit froths at the corners of her ");
	if(pc.cocks[x].cLength() < 10) output("greedy");
	else if(pc.cocks[x].cLength() < 20) output("stuffed");
	else output("straining");
	output(" maw as Synphia’s tempo increases. Audible claps ring out when her dick-sucking pillows slap off your skin, and with all the churning, wet sounds from her throat, it sounds like you’re fucking her pussy, not her face.");
	output("\n\nSynphia looks up from above her mouthcunt and watches you for the signs of encroaching orgasm, not that she needs to. She can feel your pleasure in the way your [pc.cock " + x + "] twitches on her tongue. She can sense how close you are by the ever-increasing creaminess of your pre. Slyveren senses are so keen when it comes to cum, so keen that she must know exactly how you feel when she’s sucking you to the root, batting her eyelashes at you innocently and asking with pink-flashed words, <i>“Are you ready to cum?”</i>");
	output("\n\nThe answer to a question like that doesn’t need spoken out loud, ");
	processTime(15);
	pc.lust(70);
	clearMenu();

	if(!venomBool) 
	{
		output("but you do need to decide how you want to cum. Are you going to let her bring you off like this or grab her by the horns and take charge?");
		addButton(0,"Let Her",letSynphiaDeepDrainYou,args);
		addButton(1,"Handlebars",faceFuckDeepSnake,args);
	}
	else 
	{
		output("especially not when talking seems so hard, and it’s so much easier to lean back against the crates and moan for Synphia. She’s sucking you so well; she’s more than earned the load you’re about to feed her...");
		addButton(0,"Next",letSynphiaDeepDrainYou,args);
	}
	//[Next] or menu for facefuck or let her. Next = Let Her
}

//Facefuck [Cummies]
public function faceFuckDeepSnake(args:Array):void
{
	clearOutput();
	showSynphia(true);
	author("Fenoxo");

	var x:int = args[0];
	var venomBool:Boolean = args[2];
	var cummies:Number = pc.cumQ();
	if(venomBool) 
	{
		cummies *= 1.5;
		cummies += 50;
	}
	args[3] = cummies;

	output("Grabbing the snake by the horns, you give her a little yank to stop her ceaseless writhing and take command of the situation.");
	output("\n\nSynphia does not issue so much as one single peep of protest. Folding her hands obediently into her own lap, she bats her eyelashes at you, giving you all the permission you need to hoist your [pc.hips] back and plow your [pc.cock " + x + "] throat-deep once more. The potent suction and tight seal of slyveren lips fades slightly, just in time for you to do it again and again... and again. You rut the pillow-mouthed cum-junkie’s maw, pounding it like you could knock it up by force alone. Wisps of bluish fog rise from Synphia’s flashing horns as she taps whatever psionic power she has to endure you mouth-fucking her silly.");
	output("\n\nShe can’t quite meet your gaze through all the shaking and humping, but she can drool. She can drool enough spit to make her mouth feel wetter than a galotian’s cunt. She can drool enough to splash your [pc.skinFurScales] whenever you burrow bone deep. She can drool enough for stringy excess to dangle from her chin and slap into a tit.");
	output("\n\nThat’s what really sets you off: the sight of a professional spooge-sucker barely hanging on, letting you use her face like your own personal fucktoy. She doesn’t seem like she cares how rough you get so long as your [pc.cockNounSimple " + x + "] pops inside before you pop... and you do. You ram that bliss-infused tool so deep that Synphia’s lips bubble outward, pinned between the rest of her face and your ruinously aroused loins.");

	//<1000
	if(cummies < 1000)
	{
		output("\n\n[pc.Cum] injects itself directly into the snake-woman’s stomach. Each blissful clench is answered by a widening of Synphia’s eyes. ");
		if(cummies >= 25) output("Her expression mellows with your consecutive shots until her eyes are closed with a patient sort of satisfaction. The rest of your climax is a calming, quiet sort, just the sound of your own heart hammering in your ears and the occasional contented gurgle from Synphia’s tummy. By the end, you realize that she’s working her lips again, squeezing them at your root and sucking the final virile droplets free.");
		else 
		{
			output("Her expression begins to mellow, then turns to disappointment as your load runs dry.");
			//" She offers a vial of Throbb, not even bothering to pull back, but she offers it nonetheless. Her horns glow faint coral as her disembodied voice suggests, <i>“A few doses of Throbb might do you some good for next time.”</i>\n\nIt just might. You push her off a little harder than you meant to. Your [pc.cock " + x + "] flies free, slinging old spit across Synphia’s snout. <i>“I’ll have to think about it.”</i>\n\nThe snake-girl nods, casually gathering the juices up with her tongue, and leaves with a carefree smile.");
			//special outro
			//Fen note: cut dis for main outro.
		}
	}
	//< 4000 - smolpaunch. Happysnek
	else if(cummies < 4000)
	{
		output("\n\n[pc.Cum] injects itself into the snake-woman’s hungry stomach with audible burbles, yet she shows nothing but pleasure. When your second shot slides into place, so thick and virile that you feel a bit of it continuing to cling to your [pc.cockHead " + x + "], Synphia closes her eyes and leans her shoulder against your [pc.leg] for support. Her primly folded hands make their way to her stomach, and as you continue to fill her, she excitedly strokes her rounding, cum-pregnant tummy.");
		output("\n\nIt isn’t a very ‘pregnant’ bulge - just enough to let the rest of the station know that she’s been fed and fed well. Synphia surprises you by starting to suck again, working her lips around your root to make sure every single virile droplet your body has produced makes its way into the soupy mixture in the bottom of her belly.");
	}
	//< 15000 - medpaunch dopysnake
	else if(cummies < 15000)
	{
		output("\n\n[pc.Cum] roars into the snake-woman’s stomach, hitting her mid-section with tummy-shaking force. Synphia’s eyes widen in alarm, but she doesn’t struggle. She grabs onto her middle two-handed and <i>feels</i> the cumflation for herself, like she doesn’t trust what the rest of her body is telling her. You shoot again, and the alarmed look fades somewhat. Hands squeeze the puffed-out belly in awe, and Synphia’s lips ratchet tighter, forming a perfect seal around your spraying tool. Her cheeks crinkle with a hint of a smile, and she closes her eyes to feel the rest of what’s to come.");
		output("\n\nGripping tighter, you unload the rest of your climax inside her. If Synphia doesn’t mind turning into a cum-thickened chunker, so be it. You cry out in bliss and fill her. Scales creak beneath scrabbling fingertips, and Synphia’s throat gives you a healthy squeeze as if to say, <i>“More. Cum in me more.”</i> You do. You shoot until you’re panting and drained. The snake-woman could pass for pregnant if she wanted to, though with how she wobbles and sloshes, the illusion wouldn’t last for long.");
	}
	//else - huge paunch unconscious snek
	else
	{
		output("\n\n[pc.Cum] erupts out of you like water from a fire extinguisher, only you have a snake-shaped balloon trapped on the end of the ‘hose.’ Synphia goes wide-eyed when the first sperm-thickened deluge completely fills her belly, gurgling and roiling. She reaches down in shock and confusion, prodding her flesh in disbelief, and the second shot hits. Your scale-covered condom whines through a throat full of dick and tightens down her lips. The pressure is maddening; you react by firing out enough seed to knock up a whole harem of ausar babes.");
		output("\n\nOnly, every drop is pouring into one girl. Synphia gets kind of chubby-looking. She’s stroking her belly and her cunt even though you can’t see the sopping slit beneath the blossoming belly bloat. The sight makes you shoot hard enough to send rippling wobbles through the snake’s distended body, pumping her up further. She’s like a cummy balloon, rounding with each passing second. Squirming, the slyveren lashes her tail. It cracks ineffectively against the wall, and Synphia gulps against your spunk-distended cock, cumming her brains out.");
		output("\n\nGirljizz spatters the floor, ruining the crotch of Synphia’s jumpsuit, but she’s beyond caring. She’s a blissed-out cum-bucket on the verge of overflowing. Warm, spent spoo backs up high enough to bathe your [pc.cockHead " + x + "], and you wisely decide to pull out before you do her any serious harm.");
		output("\n\nSynphia doesn’t mind being tossed on the floor like a wet cum-rag if her moans are anything to go by. In fact, she pulls out her tits for you and begs you to keep going. You do. You paint her [pc.cumColor], then paint her again, then divert to give her face a nice thick mask of excess goo. She gurgles, coughing up a load worth of jism, then cums again, her every sense utterly infused with the scent and feeling of jism.");
		output("\n\nIt’s a surprise when, after your ropes have turned to dribbles and then to a single droplet, Synphia springs out of the puddled sex-juice to suck the last bits of thinner, runnier goo from your [pc.cockHead " + x + "]. She hums and sighs, utterly content.");
		args[4] = true;
	}
	processTime(10);
	pc.orgasm();
	if(venomBool) pc.lust(25);
	clearMenu();
	//Making sure accurate cummies :3
	args[3] = cummies;
	if(venomBool && pc.cumQ() >= 100) addButton(0,"Next",extraCumLeakingPostSynphia,args);
	else addButton(0,"Next",synphiaEpilogue,args);
}

//Let Her
public function letSynphiaDeepDrainYou(args:Array):void
{
	clearOutput();
	showSynphia(true);
	author("Fenoxo");
	var x:int = args[0];
	var venomBool:Boolean = args[2];
	var cummies:Number = pc.cumQ();
	if(venomBool) 
	{
		cummies *= 1.5;
		cummies += 50;
	}
	args[3] = cummies;


	output("Letting your head loll back, you manage to groan a warning. The lady did ask, after all.");
	output("\n\nSynphia seems to appreciate it too, hollowing her cheeks and suckling ravenously, her eyes smiling up with something that looks like a mixture of pride and possessiveness. She bobs slightly, maybe a half-inch at a time, driving you closer and closer to the precipice until you know you can’t hold it back any longer. Synphia sucks the lewdest-sounding gasp from you, and then you’re cumming - cumming while you stare adoringly into her eyes. You’re cumming, and you doubt anything could be as sexy as the expression on Synphia’s face.");

	//2Low - quickie + complain
	if(cummies < 25)
	{
		output("\n\nThat beautiful visage sours at the end of your brief climax. Scowling slightly, the disappointed mechanic slowly extracts your [pc.cock " + x + "] from her spit-greased throat, smacking her lips for a moment. <i>“That’s it?”</i>");
		//Fen note: cut dis so can feed into outro.
		//" She squints at your dick before rooting around in her toolbelt and coming up with a vial of Throbb. <i>“Here. Take this. From what I understand, it’s exactly the sort of thing you’re gonna need if you plan to feed slyverens.”</i>");
		//output("\n\nShe saunters off, leaving you holding your own spent dick and a handful of drugs.");
		//throbb
	}
	//< 1000 - Happy slyveren, easy sukk
	else if(cummies < 1000)
	{
		output("\n\nCompared to face-fucking, your orgasm is almost silent. Without much motion, there’s not much noise, just the deeply muffled sound of your [pc.cum] shooting directly into Synphia’s waiting stomach. Rubbing her tummy, she nurses at your prick, utilizing her tongue to the fullest." + (pc.balls > 0 ? " It strangles your [pc.balls], trying to squeeze out more.":"") + " She closes her eyes to focus on the rhythmic throbbing. Inside her throat, the alien’s muscles contract and squeeze to milk out every drop.");
		output("\n\nYou’re giving Synphia exactly the [pc.cumNoun] she needs, and it feels so good.");
	}
	//< 4000 - Very Happy slyveren. Slight paunch.
	else if(cummies < 4000)
	{
		output("\n\nThat beautiful visage blossoms into a mask of ecstasy at the size of your first ejaculation. Synphia grabs your ass and pulls you tighter, seemingly forgetting that she has your [pc.cock " + x + "] mated to her throat, so desperate for your plus-sized [pc.cumNoun]-shots that she’s squeezing you with her throat, milking that hot load into her stomach. The sultry mechanic all but purrs as you pump it out for her, and as your climax winds down, you watch her rubbing at the slight paunch you’ve produced on her belly in pleasure.");
	}
	//< 15000 - Tummy bulging slyveren. Wet
	else if(cummies < 15000)
	{
		output("\n\nThat beautiful visage contorts into surprise, then ecstasy, when your first ejaculation splashes into her hungry belly. Synphia grabs hold of your ass for support and gurgles at the second ejaculation, closing her eyes while her throat goes mad around your girth. Every inch of this girl demands you feed her as much cum as possible. She whimpers, a patch of darkness spreading around her crotch from the sheer eroticism of her own cum-guzzling, but it soon vanishes beneath the rounding bulk of her [pc.cumNoun]-inflated middle.");
	}
	//< 60000 - Pregnant and cumming
	else if(cummies < 60000)
	{
		output("\n\nThat beautiful visage screws up in sudden ecstasy when Synphia realizes just how unspeakably virile you are. Cradling her stomach in one hand, she pulls herself tighter against you with the other (and her tail). A river of [pc.cumVisc] [pc.cumNoun] seed flows through her throat, and it squeezes back, begging for more. You ruin her trim figure. A once taut belly is made to look soft and pudgy, and that’s just your first shot.");
		output("\n\nThe second ejaculation causes the suck-hungry slut to gurgle, and you hear a dribbling sound from below that could only come from the slyveren’s own orgasm. A clear puddle, half-hidden by her ballooning belly, provides plenty of evidence of her passion, and you respond to it the only way you know how: by continuing to cum until Synphia looks like pregnant with a whole litter worth of your kids. Dumbly, she cradles her obscene middle as it wobbles and sloshes with the final spurts of your monstrous load.");
		args[4] = true;
	}
	//yuge - Massive cumflake & bukkake
	else
	{
		output("\n\nThat beautiful visage displays equal parts shock and lust as you unleash the monstrous torrent of your load. Your seed flows thickly enough to distend your cock and her shrink-wrapped throat with it. Synphia’s eyes flutter, then roll back while you listen to the torrential churning of roiling seed from within. She whimpers, but she can’t stop drinking, not while you’re plugged directly into her stomach. All she can do is try to hang on while you continue to inflate her.");
		output("\n\nA hot spatter soaks your [pc.footOrFeet] when the snake-girl violently orgasms at the end of your first shot. She cums again with the second, shaking like a leaf caught in fighter jet’s engine wash. By the third, Synphia is more or less limp. She’s attached to your [pc.cock " + x + "] like an organic condom, inflating with each passing second. Her balloon-like tummy rounds well past the point of a twin pregnancy, then stretches beyond. Her suit becomes almost transparent around the middle, allowing you to watch her reaching the limits of her own alien biology: belly scales pull apart, no longer able to conceal the glossy skin beneath. She’s reached her limit.");
		output("\n\nYou step back, lest you hurt her, snaking all " + num2Text(Math.floor(pc.cocks[x].cLength())) + " inches out of her throat in time for the last couple shots to web the slyveren to the wall. The [pc.cumVisc] globs pile up thick enough to anonymize some of her features... at least until gravity begins to pull it down in bunched-up waves." + (venomBool ? " You watch with pride, unable to stop dripping [pc.cum] thanks to her venom.":""));
		output("\n\nShe comes to a little later.");
		args[4] = true;
	}
	//Should be able to merge into the [next] stuff for the other variants.
	processTime(10);
	pc.orgasm();
	if(venomBool) pc.lust(25);
	clearMenu();
	//Making sure accurate cummies :3
	args[3] = cummies;
	if(venomBool && pc.cumQ() >= 100) addButton(0,"Next",extraCumLeakingPostSynphia,args);
	else addButton(0,"Next",synphiaEpilogue,args);
}

//Ball Foreplay
public function synphiaBallForeplay():void
{
	clearOutput();
	showSynphia(true);
	author("Fenoxo");
	//Regular size
	if(pc.ballDiameter() < 7)
	{
		output("A simple gesture to your [pc.sack] is all it takes to set the slyveren into motion.");
		output("\n\nLifting your [pc.cock] out of the way" + (pc.cocks[0].cLength() >= 18 ? " two-handed":"") + ", Synphia leans in close and takes a deep breath, nostrils flaring as her tongue snakes out across her lip. <i>“");
		if(pc.ballFullness > 80) output("Smells nice and full. No wonder you needed that service.");
		else if(pc.ballFullness >= 33) output("Hmmm, smells like you didn’t really </i>need<i> the service. " + (!pc.balls == 1 ? "This bad boy":"These bad boys") + " have plenty more room to fill up.");
		else output("Huh. Not a fan of letting yourself get backed up, I take it. Somebody’s a busy slut.");
		output("”</i> Unfurling her tongue the rest of the way, the scaly mechanic caresses it against your underpouch; she rolls it up one side, then gradually works across the front in order to slide down the other.");
		output("\n\nYou’re " + (pc.isErect() ? "quaking":"fully erect") + " by the time she finishes her first foray into polishing your [pc.balls].");
		output("\n\n<i>“Mmm,”</i> the nut-loving seductress hums, <i>“I love balls.”</i> She reels her roving muscle up and gives your sack a sloppy kiss. <i>“Not as much as cocks, mind you, but there’s something wonderful knowing that " + (pc.balls == 1 ? "this... this benign little thing is":"these... these benign little things are") + " the source of the most ambrosial flavor in all the galaxy.”</i> She cranes her head around to kiss the other side. <i>“And I love that I can caox out even more by giving " + (pc.balls == 1 ? "it":"them") + " a little attention. That every kiss and slurp is paid back an extra helping for little ol’ me.”</i> Again and again, she peppers the source" + (pc.balls > 1 ? "s":"") + " of your virility with sweet affection. <i>“Think I can fit " + (pc.balls == 1 ? "it":"one") + " in my mouth?”</i>");
		//EZfit
		if(pc.ballDiameter() <= 3.5)
		{
			output("\n\nKnowing a rhetorical question when you see one, you content yourself with a simple nod. Anything else seems excessive with a slyveren slithering around your [pc.balls].");
			output("\n\n<i>“Of course... I shouldn’t make you wait. " + (pc.balls == 1 ? "It":"They") + " must be so cold!”</i> Synphia’s eyes twinkle with playful mirth as she opens wide, yawning her lips apart to display just how far she can go. The pink canyon she displays looks soft and toothless, glossy with spit, and it takes little more a slight adjustment to her position to accept your entire pouch inside. She feels even better on the inside, bathing you in warmth and spit. The snake-woman’s tongue spins in lazy circuits around your [pc.balls], at first simply tasting, then caressing with singular intent and focus.");
			output("\n\nYou relax, as much as you can while getting your sack sucked, but Synphia is insatiable. She won’t stop working your tender orb" + (pc.balls > 1 ? "s":"") + ", won’t stop slurping and suckling and coaxing you to brew up a nice thick load for her. Her eyes say it all: <i>Fill for me</i>. They implore you... no - your ball" + (pc.balls > 1 ? "s":"") + " - to brew the thickest, stickiest, most virile cumshot of your life for her, all while her tongue continues to twist and twirl, dancing across your [pc.sack] with an addict’s passion. She sucks you rapaciously for what feels like hours but can’t be more than ten minutes.");
		}
		//Pretty big
		else
		{
			//Repeat
			if(flags["SYNPHIA_BALLSUCKS"] != undefined) output("\n\n<i>“I know you can.”</i>");
			//Bimbo
			else if(pc.isBimbo()) output("\n\n<i>“Omigosh, I fucking hope so!”</i>");
			//Bro
			else if(pc.isBro()) output("\n\n<i>“Try.”</i>");
			//Else
			else output("\n\n<i>“Oh, I hope so.”</i>");
			//merge pers variants
			output("\n\nSynphia’s eyes twinkle with half-concealed pleasure, the sort of knowing gleam one gets from a well executed con. <i>“Of course I can.”</i> Her mouth opens wide, lips yawning apart to reveal the pink-hued chasm of her mouth and the grooved, undulating mass of her tongue. Snake-like, it rises up and slithers out, pressing against the back of your [pc.sack] and looping back and forth to fold itself into a supportive scaffolding. She juggles your [pc.balls]" + (pc.balls > 1 ? " back and forth":"") + " upon that magical organic carpet, lowering you down with every successive bounce until " + (pc.balls > 1 ? "one of ":"") + "your nut" + (pc.balls > 1 ? "s":"") + " slips into her outstretched maw.");
			output("\n\nWarmth envelops your tender flesh followed by a gentle, tugging suction. Synphia’s luminous eyes stare up at you while her lips close down on your sack, and with a purr of delight, she gently rolls her tongue around the weighty circumference, all but worshipping " + (pc.balls > 1 ? "that":"your") + " nut. She reverently polishes the virile sack from within the secure, doting embrace of her snake-like muzzle, never so much as grazing you with a hint of tooth or fang.");
			output("\n\nSynphia’s too good for that. " + (pc.balls > 1 ? "She releases the tongue-tied orb from captivity with a slow slurp and rotates to take in the other, casually stretching her glossy lips far beyond typical limits to show you just how built for service she is. She can hot-swap nuts with ease.":"She releases the tongue-tied orb from captivity with seeming regret, then slurps it back in with ease, her glossy lips stretching far beyond meager human limits. If you had another testicle, she’d probably be polishing it right this moment, but instead she slurps the same tender nad back inside.") + " Your size isn’t a problem for her in the slightest. In fact, she’s staring up at you with her mouth sealed around your crinkling sack, teasing your [pc.balls] into brewing up a fresh batch of [pc.cumNoun]. You know that whatever she’s doing is working because you can feel the weight building up, loading you down with unspent, seething passion.");
		}
		//Merge
		output("\n\nSlowly, the slyveren nut-licker eases back, allowing your sopping wet sphere to slide out of her mouth on the slick, pink carpet that is her tongue. The hangar air feels chilly against the wet skin, but Synphia’s hands return to cradle your ball" + (pc.balls > 1 ? "s":"") + " as she grants " + (pc.balls == 1 ? "it":"them") + " one last kiss, her tongue snaking and sliding across your increasingly filled cum-factor" + (pc.balls == 1 ? "y":"ies") + ". She blinks, sighing a delightful current of warm air across the tender scrotum, and says, <i>“Now... shall let’s see about emptying " + (pc.balls == 1 ? "this bad boy":"these bad boys") + "... unless you wanted your ball" + (pc.balls > 1 ? "s":"") + " sucked ");
		if(flags["SYNPHIA_BALLAUGS"] != undefined) output("bigger again.");
		else output("because you wanted " + (pc.balls == 1 ? "it":"them") + " to get bigger.");
		output("”</i>");
		output("\n\nThe grinning girl licks her lips. <i>“");
		if(flags["SYNPHIA_BALLAUGS"] != undefined) output("You know I could do it again.");
		else output("I could do that, you know... with my psi.");
		output("”</i> Her horns flicker green. <i>“");
		if(flags["SYNPHIA_BALLAUGS"] == undefined) output("But I’d be too drained to suck you after. I’d have to make you cum fast... make you spurt and grow at the same time so I don’t pass out, but you wouldn’t mind cumming to the feel of your sack stretching, would you?");
		else output("And I’d need you to cum nice and fast again, just like last time. Does that sound fun? Does blasting a creamy load across me while your nut" + (pc.balls > 1 ? "s":"") + " inflate" + (pc.balls == 1 ? "s":"") + " with even more sound like a good time to you? Because it’s good practice for me and an even better meal...");
		output("”</i>");
	}
	//Alternate huge nut worship
	else
	{
		output("A simple gesture to your [pc.sack] is all it takes to set the slyveren into motion.");
		output("\n\n<i>“Look at all this... goodness,”</i> she purrs, leaning close, and pushing your [pc.multiCocks] up and onto the top of her head, out of the way. She buries her nose in the fragrant nutfolds and inhales, wrapping her arms behind to pull your monstrous testicle" + (pc.balls > 1 ? "s":"") + " tighter. <i>“Mmm, it even smells like [pc.cumNoun], and there’s so much.”</i> She tilts her head to look up at you, tongue flickering out to taste the skin in between words. <i>“You know what slyverens like, don’t you?”</i> She kisses a tender spot, making you squirm. <i>“You know there’s nothing more fulfilling to a girl like me than draining every drop from cum-tanks like these.”</i>");
		output("\n\nRelaxing while the anthropomorphic woman explores the buffet of bulge, you nod along with whatever she’s saying, focusing instead on how good she feels down there.");
		output("\n\n<i>“Ohhh, is somebody getting distracted?”</i> Synphia teases. She runs a fingertip from your taint down the backside of your swollen sack, earning a wobble and a gurgling quiver from inside. <i>“Are somebody’s big fat balls so sensitive that the mean ol’ Steele Tech mechanic can shut [pc.himHer] down with little kisses and strokes?”</i> She kisses one side wide-mouthed, her tongue slowly easing out to caress eight inches of exposed genitalia. <i>“Are you just going to agree with me as long as I keep doing this?”</i>");
		output("\n\nYou could shut her down, but the slyveren is right about one thing: what she’s doing feels damned good, and you don’t want it to stop.");
		output("\n\nYou nod.");
		output("\n\n<i>“Wonderful.”</i> Synphia does that thing with her finger again, but this time with both hands");
		output(" on ");
		if(pc.balls > 2) output("two nuts");
		else if(pc.balls == 2) output("both nuts");
		else output("each side of your nut");
		output(". <i>“Then you won’t mind if we spend another ten minutes like this.”</i> She licks her tongue up a crease, moaning from the taste alone. <i>“Another ten minutes of me licking and slurping and worshipping.”</i> Hefting them in her arms, the scaled sack-sucker jiggles your churning cum-factor" + (pc.balls == 1 ? "y":"ies") + ". <i>“Another ten minutes of " + (pc.balls == 1 ? "this":"these") + " filling up, getting heavier and heavier.”</i> Synphia can’t help but moan at her own erotic implications. <i>“Yeah, you’re gonna give me the biggest, fattest load, aren’t you?”</i>");
		output("\n\nYou are. <i>“Yes.”</i> Just saying it makes your [pc.sack] feel tighter, heavier, and somehow more exposed to the slurping snake.");
		output("\n\nTime passes in a haze of plump-lipped kisses, roving fingertips, and the long, drawn-out sighs that follow Synphia’s every sniff. She’s right about you filling up for her. The longer this goes on, the more backed-up you feel, yet you feel in no hurry to do anything about it. Besides, what’s wrong with having a thicker load to feed her?");
		output("\n\n<i>“What if...”</i> Synphia trails off for a second, burying her whole face in your fragrant skin and taking a long, slow inhale. <i>“Ahhh... um... what if I made " + (pc.balls == 1 ? "it":"them") + " bigger.”</i> She reverently caresses a full curve. <i>“What if we didn’t bother with the whole dick-sucking thing, I just used my psi to make you swell and cum.”</i> You notice that the slits of her eyes are almost circular with how they’ve dilated. <i>“You’ll need to feed me lots so I don’t pass out, though I don’t think that’ll be a problem for you, will it big [pc.guyGirl]?”</i> She kisses the joint between [pc.sack] and [pc.cocks]. <i>“Or I could just suck out all this cum like normal, but wouldn’t it be nice to be capable of feeding a whole harem of slyverens? Wouldn’t it be nice to have so much [pc.cumNoun] that you could stuff " + ((flags["SYNPHIA_STEELETECHTALK"] != undefined || flags["SYNPHIA_MODSTALK"] != undefined) ? "my sister and I":"me") + " to the brim, multiple times a day? Think about it.”</i>");
	}
	//Ends in choice between Psi Aug and Cock Foreplay(1)
	processTime(14);
	IncrementFlag("SYNPHIA_BALLSUCKS");
	pc.ballFullness += 35;
	if(pc.ballFullness > 100) pc.ballFullness = 100;
	pc.lust(45);
	clearMenu();
	addButton(0,"Cock",penisRouter,[synphiaCockForeplay,9000000,false,0],"Cock","Put her to work on your dick.");
	if(!pc.hasStatusEffect("Synphia_Tired")) addButton(1,"Psi Aug",nutswellomaticWithYourHostCOLONGOESHERESynphiaEXCLAMATIONPOINT,undefined,"Psi Aug","Get your [pc.sack] enlarged by psionic means.");
	else addDisabledButton(1,"Psi Aug","Psi Aug","Synphia is too tired to do this right now.");
}


public function nutswellomaticWithYourHostCOLONGOESHERESynphiaEXCLAMATIONPOINT():void
{
	clearOutput();
	showSynphia(true);
	author("Fenoxo");
	output("You tell the sack-slobbering snake-woman to do it - to make your [pc.ballsNoun] bigger.");
	output("\n\n<i>“Aww yesss! Okay, now try and hold still.”</i> Synphia ");
	if(pc.ballDiameter() >= 5) output("clutches your churning spunk-bunker" + (pc.balls > 1 ? "s":"") + " closer");
	else output("rolls your churning spunk-generator" + (pc.balls > 1 ? "s":"") + " in her palm" + (pc.ballDiameter() >= 2 ? "s":""));
	output(", stroking " + (pc.balls == 1 ? "it":"them") + " with possessive familiarity. <i>“");
	if(flags["SYNPHIA_BALLAUGS"] == undefined) output("This is going to feel very, very good, but if you thrash around too much, " + (pc.balls == 1 ? "it":"they") + " won’t properly swell, and you definitely won’t hit me with enough spooge to make up for all this effort.");
	else output("I know exactly how squirmy this gets you, but I know you can do it this time, [pc.name]. I know you won’t let me ruin you with pleasure.");
	output("”</i> She stares up at you with incredible seriousness for a woman with your [pc.cocks] resting on her head. <i>“" + (flags["SYNPHIA_BALLAUGS"] == undefined ? "Got it":"Right") + "?”</i>");
	output("\n\n" + (flags["SYNPHIA_BALLAUGS"] != undefined ? "Squirming?":"Thrashing?") + " At worst you might pump your hips a few times, and you tell the snake-woman as much.");
	output("\n\n<i>“Oh ho, that sure of yourself, huh?”</i> Synphia winks, her horns’ blue glow slowly picking up green notes. The verdant light shift towards radiant emerald with increasingly luminous pulses. <i>“Fuuuuck, this is always a pain. It’s like trying to jump straight from park into Light Drive!”</i> She pinches at her brow, eyes closed, while the glare jumps another notch, already brighter than the blue had ever been. <i>“Remember, hold still.”</i>");
	output("\n\nLeaning her head into your [pc.sack], the smooth metallic curve of her horn grazing your tender flesh, Synphia’s wrinkled brow smoothes, and something potent and powerful pours into you. It feels like a low-grade electric shock, like the strange energy is bouncing from misfiring nerve to misfiring nerve, sparking off erotic, scrotum-tightening tingles. Holding still is harder than you thought. Your body wants you to react with a thrust. It wants you to hump Synphia hard: to pin her down and face-fuck her into the floor.");
	output("\n\nA feral-sounding growl escapes your throat, but you restrain yourself for now.");
	output("\n\n<i>“Good [pc.boyGirl],”</i> Synphia coos, rubbing her cheek against a slightly bigger ball. She exhales over your [pc.sack], washing it and breath and incredible, inexplicable power as well. Two handed, she grabs your nut" + (pc.balls > 1 ? "s":"") + " and grinds her face into " + (pc.balls == 1 ? "it":"them") + ", slobbering half-kisses that culminate in brain-addling sparks. <i>“Getting so <b>thick</b> and <b>virile</b> for me.”</i>");
	//No new PG
	//Smol. < 1
	var ballDiameter:Number = pc.ballDiameter();
	if(ballDiameter < 1)
	{
		output("\n\nAnd sure enough, you are. Your [pc.balls] " + (pc.balls == 1 ? "is":"are") + " ballooning in her palms, pushing back against her cheek and the incredible softness of her lips. It’s almost scary how fast you’re growing, producing more tender flesh so fast that your sack grows momentarily taut and smooth before the skin can catch up. <b>You’re going to have to get used to having large balls.</b>");
	}
	//Large/Baseball < 3
	else if(ballDiameter < 3)
	{
		output("\n\nAnd of course, you are. Already reasonably endowed in that department, you find yourself delighting in the outward expansion of your [pc.balls], reveling in the way it tightens your sack and further fills Synphia’s palms. The more you grow, the more of you is in contact with her head and horns - the source of this literal growing pleasure.");
	}
	//Apple/Grapefruit < 5
	else if(ballDiameter < 5)
	{
		output("\n\nHow could you not? You came into this with " + (pc.balls == 1 ? "a ":"") + "ripe, well-developed nut" + (pc.balls > 1 ? "s":"") + "; now you’re overflowing Synphia’s palms. Your [pc.balls] " + (pc.balls > 1 ? "jostle and wobble against each other":"wobbles under its own weight") + ", fuller by the second. Spooge churns inside while you continue to grow for the snake-woman, gasping in delirious want.");
	}
	//Cantaloupe < 7
	else if(ballDiameter < 7)
	{
		output("\n\nEvery word she speaks is true. Your big fat balls were already too large for her to comfortable carry in her palms, and now the cartoonish endowment" + (pc.balls > 1 ? "s are":" is") + " getting even bigger - nearly the size of Synphia’s head. Sometimes, when the steady expansion sets off a large enough wobble, you’ll lose the snake-woman in the ocean of swelling scrote, but she’s in there, pumping you full of juicy, spunk-boosting power.");
	}
	//Watermelon < 15
	else if(ballDiameter < 15)
	{
		output("\n\nAnd sure enough, you are, in spite of the relative size differences. Your [pc.balls] " + (pc.balls == 1 ? "was":"were") + " already bigger than the nut-drunk slyveren’s face, and now " + (pc.balls == 1 ? "it’s":"they’re") + " getting bigger and heavier. If you lost control and squirmed even the slightest amount, you’d send the titanic spunksacks wobbling like a galotian jogger’s tits, but for now you hold yourself to no more than rhythmic, cum-churning jiggling.");
	}
	//Else
	else
	{
		output("\n\nNot that you weren’t already. The enormous weight of your swollen cumsack" + (pc.balls > 1 ? "s":"") + " is enough to give the slyveren momentary pause - but not enough to dim the glow from her horns or slow the dancing of her fingertips as you swell. Burying herself in fragrant nutskin, the slyveren lets out a muffled moan and pulls you tighter. Her power flares, and your [pc.balls] flow" + (pc.balls == 1 ? "s":"") + " outward like liquid, growing in direct violation of every law of physics you ever learned.");
	}
	//merge
	output("\n\n<i>“Almost done,”</i> Synphia mutters. " + StringUtil.capitalize(num2Text(pc.balls)) + " tiny snaps of pain momentarily jolt you from your erotic reverie. You glance down, an amateur psychic is smiling as she caresses " + (pc.balls > 1 ? "one":"your") + " cum-swollen nut. Where there was pain, now you feel warmth. The heat feels like just before an orgasm, that tight, effervescent sensation of almost boiling over but two or three times as strong as normal.");
	output("\n\nSuddenly holding still seems impossible. Your [pc.hips] shudder, swinging your [pc.balls] around to slap Synphia’s face. She holds on for dear life, dragging back and forth, pouring more power into you, making everything almost painfully tight with how loaded down you are. You feel like you could impregnate a whole capital ship worth of sluts. Crying out in bliss, you barely notice [pc.cum] pouring out of your [pc.cockHeads] in a stream, and you definitely don’t hear it splattering the wall.");
	output("\n\nSynphia’s hands slip, and she flops back, panting heavily. Her horns flicker and fade to a dull white as she stares up at your orgasmic writhing, eyelids already half closed.");
	output("\n\nUnthinkingly, you pinch her lower lip between your thumb and forefinger and yank her jaw open, aiming your [pc.cockBiggest] inside just in time for an enormous rush of [pc.cumNoun] to emerge. Then you shift your grip to her horns and push forward, thrusting yourself into her throat so that you have a nice, tight hole to cum into.");
	output("\n\nYou tell yourself that you’re doing this to make sure she recovers, not because you want to face-fuck the insensate snake, but then you’re grunting like a beast and sawing in and out of her mouth, slopping spooge and spit every which way. Synphia’s belly rounds with the size of your load well before you’ve finished, so you pull out and let the rest rain down upon her in the form of a [pc.cumColor] monsoon.");
	output("\n\nShe’s drenched, but she’s smiling underneath the spunky mask, even managing to reach out with a toe to cup your [pc.sack] as the last spurts land on her chest.");
	output("\n\n<i>“Good... [pc.boyGirl]...”</i> Synphia murmurs, wiping the mess out of her eyes to look at you.");

	//do growth here. Track before/after for chex	
	var bonus:Number = 2 + rand(3);
	if(ballDiameter > 5) bonus++;
	if(ballDiameter > 8) bonus++;
	if(ballDiameter > 12) bonus++;
	if(pc.hasPerk("Mini")) bonus = Math.ceil(bonus/2);
	if(pc.hasPerk("Hung")) bonus += 2;
	if(pc.hasPerk("Bulgy")) bonus += 4;
	pc.ballSizeRaw += bonus;
	var newDiameter:Number = pc.ballDiameter();
	//Reactions!
	//First time congrats :3
	if(flags["SYNPHIA_BALLAUGS"] == undefined) output(" <i>“See? It was everything I promised, and it’s not like you missed out on anything. I can suck you throat-deep next time, and this time you’ll be packing even more jizz.”</i>");
	//Achieve baseball size <3
	else if(newDiameter >= 2 && ballDiameter < 2) output(" <i>“<b>Already up to baseball size, I see</b>.”</i> She leans closer. <i>“I bet we could get you packing " + (pc.balls == 1 ? "a basketball":"basketballs") + ", if you wanted.”</i>");
	//Achieve Apple <4
	else if(newDiameter >= 3 && ballDiameter < 3) output(" <i>“Mmm, <b>look at " + (pc.balls == 1 ? "that apple":"those apples") + "</b>.”</i> She caresses one with a cummy fingertip. <i>“You’re bigger than most aliens. Hell, you’re packing more than a horse.”</i>");
	//Achieve Grapefruit <5
	else if(newDiameter >= 4 && ballDiameter < 4) output(" <i>“And <b>" + (pc.balls == 1 ? "this fucking grapefruit":"these fucking grapefruits") + "...</b>”</i> She sighs in exhausted contentment. <i>“Look at " + (pc.balls == 1 ? "it":"them") + ". You’re bigger than most pornstars now.”</i>");
	//Cantaloupe <7
	else if(newDiameter >= 5 && ballDiameter < 5) output(" <i>“What a change! <b>" + (pc.balls == 1 ? "It’s like a cantaloupe":"They’re like cantaloupes") + " now</b>. I bet it takes two hands just to properly hold " + (pc.balls == 1 ? "it":"one") + ". You can probably feel " + (pc.balls == 1 ? "it":"them") + " slosh when you walk, stars.”</i>");
	//Socceball < 9
	else if(newDiameter >= 7 && ballDiameter < 7) output(" <i>“And what a ballsack, by the stars! <b>I could use your nuts for pillows</b>. Heck, you can probably jerk off by fucking your own ballcrease now.”</i>");
	//basketball < 12
	else if(newDiameter >= 9 && ballDiameter < 9) output(" <i>“...and how strappingly virile you’ve become! " + (pc.balls == 1 ? "It":"They") + " must feel so heavy now, <b>hanging " + (pc.legCount > 1 ? "between your [pc.legsNoun]":"down") + " like " + (pc.balls == 1 ? "a ":"") + "basketball-sized pendulum" + (pc.balls > 1 ? "s":"") + "</b>! And your cum is getting so </i>rich<i> as well.");
	//Watermelon < 15
	else if(newDiameter >= 12 && ballDiameter < 12) output(" <i>“Wow, <b>you’re already as big as a watermelon</b>. I must say, I was surprised when you agreed to pursue this little experiment with me. Most sapients don’t want floor-dragging nuts weighing down on their every step, but you want that and more, doncha?”</i>");
	//Beachball < 25
	else if(newDiameter >= 15 && ballDiameter < 15) output(" <i>“Fuck, <b>you’re packing " + (pc.balls > 1 ? "beach balls":"a beach ball") + " now</b>!”</i> She giggles. <i>“You look like you could bounce around on " + (pc.balls == 1 ? "it":"them") + ", you know: to get around. Little blurbs of cum would squeeze out with every hop...”</i> Now she’s laughing for real, but her eyes won’t leave your expanded spunkpurse. <i>“How wonderful.”</i>");
	//Person < 40
	else if(newDiameter >= 40 && ballDiameter < 40) output("<i>“You know <b>you’ve got " + (pc.balls == 1 ? "a bigger jewel":"bigger jewels") + " than some people have bodies</b>, which makes sense I guess, given how much you just shot, but damn! I really am powerful... and " + (pc.balls > 1 ? "these... these are":"this... this is") + " beautiful.”</i>");
	else
	{
		var speechBlurbs:Array = [];
		//Mini:
		if(pc.hasPerk("Mini")) speechBlurbs.push(" <i>“I must be weaker than I thought, or maybe you’re just naturally inclined toward petiteness.”</i>");
		//fat balls
		if(pc.hasPerk("Hung") || pc.hasPerk("Bulgy")) speechBlurbs.push(" <i>“Oh wow. I must be stronger than I thought! Look at how much you swelled.”</i> She leans closer. <i>“Imagine how much bigger we could make you if we did this again. You’d be so virile that I’d smell your cum the second you landed on station.”</i>");
		//broken
		if(ballDiameter >= 40) speechBlurbs.push(" <i>“Fuck, <b>" + (pc.balls == 1 ? "this nut":"these nuts") + " are obscene</b>! So fucking big I can barely think around " + (pc.balls == 1 ? "it":"them") + "... and so fragrant with that virile musk. Every time I breathe around you, I can smell the cum " + (pc.balls == 1 ? "it’s":"they’re") + " making, even now, so soon after tapping you.”</i>");
		//other random ansers:
		//Getting Better At This
		if(flags["SYNPHIA_BALLAUGS"] < 8) speechBlurbs.push(" <i>“I think I’m getting better at this. I must be - look at what I did to you! ...so fucking virile!”</i>");
		//Multiball is a handful
		if(pc.balls > 2) speechBlurbs.push(" <i>“Oh, it’s so hard with that many nuts. I’m sitting there pumping out power, and I need to keep stopping and shifting and shifting again because you’ve got so much to enlarge!”</i> She licks her lips. <i>“Totally worth it.”</i>");
		//Singlenut is actually the best for this.
		if(pc.balls == 1) speechBlurbs.push(" <i>“Mmmm, just like I thought - having just the one nut makes this so much easier. There’s no needing to split my power. I can just dump every ounce of ball-swelling psi into you directly, and the results speak for themselves.”</i>");
		//Apology for not making you bigger
		if(ballDiameter < 8) speechBlurbs.push(" <i>“Nice volume, but... I’m sorry I couldn’t make you bigger. That isn’t to say that you aren’t bigger.”</i> She wipes away some cum. <i>“But you deserve " + (pc.balls == 1 ? "a nut":"nuts") + " as fat as you want. Let me rest a bit, and we can try again.”</i>");
		//Big nuts no new threshold
		else if(ballDiameter < 15) speechBlurbs.push(" <i>“Just how big do you think we can get you? You know... the bigger you get, the more growth it takes to make a discernable difference, but if we do this enough.”</i> She pauses dramatically. <i>“You could do ultraporn... or flood one of these crates. Or this snake.”</i>");
		//Huge nuts no new threshold
		else speechBlurbs.push(" <i>“And you’re such a slave-driver! Look at your enormous fucking nut" + (pc.balls > 1 ? "s":"") + "! Look at " + (pc.balls == 1 ? "it":"them") + "! If we keep doing this, you’re going to wind up immobile - immobile and fucking tasty.”</i> She grins.");
		//Output the lucky blurb!
		if(speechBlurbs.length > 0) output(speechBlurbs[rand(speechBlurbs.length)]);
	}
	processTime(20);
	//load in Synphia.
	chars["SYNPHIA"].loadInMouth(pc);
	//Increment SYNPHIA_SUCKS
	IncrementFlag("SYNPHIA_SUCKS");
	//Increment SYNPHIA_BALLAUGS
	IncrementFlag("SYNPHIA_BALLAUGS");
	IncrementFlag("SYNPHIA_DICKGASMS");
	//orgasm, fully empty nuts.
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	pc.createStatusEffect("Synphia_Tired");
	pc.setStatusMinutes("Synphia_Tired",120);
}

//WhyMechanic
public function mechanicTalkWivSynphia():void
{
	clearOutput();
	showSynphia();
	author("Fenoxo");
	output("You ask Synphia why she became a mechanic.");
	output("\n\nStepping back, Synphia asks, <i>“Do you mean: ‘why are you juggling wrenches in a hangar instead of sucking down cock in a brothel somewhere?”</i> Her horns’ glow intensifies luminous cyan. <i>“I know the stereotypes. Just because I suck cock for sustenance doesn’t mean it’s the only noteworthy thing about me.”</i> She looks over her shoulder at your ship. <i>“I’m <b>good</b> at this. Real good, [pc.name].”</i>");
	if(pc.isNice()) output("\n\nYou wave your hands apologetically and try to explain that you didn’t mean it like that.");
	else if(pc.isMischievous()) output("\n\nYou point out that she’s the one who brought up sucking dicks. You just wanted to know more about her.");
	else output("\n\nYou shrug and point out that she never answered your question.");
	//merge
	output("\n\n<i>“Sorry, sorry. I should fucking know better.”</i> Synphia pulls an extremely complicated tool from her belt and raises it in anger, shaking it as she says, <i>“I just get sick and fucking tired of catching flack from all the too-dumb-to-fuck muppets and fat ausar on station for being born a protein-feeder.”</i> On the cusp of smacking a crate with what looks to be an extremely expensive tool, the snake-woman backs down. <i>“Besides, slyverens aren’t galotians. We don’t just shake our tits in a window and wait for some overexcited sap to splash us with spoo. We hunt... generally. I know... I know, there’s more than one slyveren brothel queen, but that’s the exception - not the rule, damnit!”</i>");
	output("\n\nYou listen attentively before trying to guide the passionate reptilian back toward the question at hand.");
	output("\n\n<i>“Right, right. You wanted to ask about me getting into being a mechanic.”</i> Synphia sighs heavily and shrugs. <i>“I was born without a hood, which meant being a shit psychic, which meant becoming a Rusher would be even more dangerous for me.”</i> Rubbing one of her horns nervously, she admits. <i>“I wasn’t exactly born curvy either, so... I couldn’t work a brothel anyway - not without some mods, so I had to find a way to afford some mods... which meant learning a trade or becoming a pirate... and I think I’d have needed psychic powers to be any good at that anyway.”</i>");
	output("\n\n<i>“So?”</i> You lean closer.");
	output("\n\n<i>“So I dulled my scales with how hard I worked in school.”</i> She pauses. <i>“That translate okay? Some idioms just don’t carry across language.”</i>");
	output("\n\n<i>“I got the gist of it.”</i>");
	output("\n\nSynphia’s horns fade to a gentle white, and a broad smile lights up the rest of her face. <i>“Good. But like I was saying, I went hard in school, realized I had a good mind for engineering and steady enough hands to be a surgeon, and decided fixing ships would get me across as many star systems as I wanted to see - sort of like being a Rusher myself, but without all the fighting.”</i> She looks proud, not just of her accomplishments but also that she’s getting to relay them to her megacorp’s heir apparent. <i>“I had a few jobs working engine rooms in cargo haulers before I wound up Uveto, and once we landed here, I found myself a new job.”</i>");
	output("\n\nYou ask how she pulled that off.");
	output("\n\n<i>“Pretty simple,”</i> Synphia adjusts her toolbelt. <i>“We had a Steele Tech ship docked next to us with engine troubles and a kaithrit mechanic too drunk to stumble down a hallway. I volunteered to lend them a hand since we’d be stuck loading for the rest of the day, and I guess the repair job I did got noticed. I got a job offer as a regular on station that night... for three times what I was getting paid, and that was </i>before<i> I made head mechanic. ‘Course I didn’t know the planet was a frigid iceball back then, but why would I care? All the ships are up here. I’m getting paid rates like I’m living in absolute zero, and I’ll never have to freeze my scales off on the surface.”</i>");
	output("\n\nYou congratulate Synphia on her good fortune.");
	output("\n\n<i>“Thank you, [pc.name].”</i> The green-scaled woman’s flit back to her usual business-like blue.");
	processTime(4);
	flags["SYNPHIA_JOBTALK"] = 1;
	clearMenu();
	addButton(0,"Next",synphiaTalkScreen);
//Unlocks psychic?
//Unlocks mods?
}

//Psychic?
public function psychicTalkWithSynphia():void
{
	clearOutput();
	showSynphia();
	author("Fenoxo");
	output("Synphia mentioned a lack of psychic powers, but there’s definitely something going on with her cybernetic horns. You ask about it.");
	output("\n\n<i>“Oh, these little old things?”</i> Synphia feigns surprise. <i>“Yeah, they’re psychic amplifiers. Cost me half a year’s salary and my promotion bonus, but they’re worth it.”</i> She closes her eyes, and they rapidly flash through nearly every color in the rainbow. <i>“See, slyveren hoods are like antennae for our psychic powers, so being born without one, I was basically crippled - couldn’t even communicate telepathically. You can imagine how that played out in school, half the class gossiping about me without saying a word.”</i> She shivers. <i>“So once I had the means and the research on the extranet to fix my little ‘problem,’ I did.”</i>");
	output("\n\nLeaning to either side of her, you take a closer look at the luminous mechanical parts, noting the clearly demarcated sockets and joint.");
	output("\n\n<i>“And it turns out that I’m a better psychic than most. I have some degree of aptitude for almost every kind of psychic power, and these horns amplify all of them.”</i> She taps the blue-glowing arches. <i>“When they’re blue, I’m essentially feeding psychic power into my own body for extra energy and maybe even a little bit of extra durability, but I’m not gonna start whacking myself with hammers to test it.”</i> Cyan fades into fluttering coral, and Synphia’s voice dances through your head. <i>“Pink’s basically telepathy. I could do more with if it, if I was the nefarious type, but I’d have to be an idiot to get caught dabbling in mind control when I’ve got a gig this sweet.”</i> She winks.");
	output("\n\nShe might have meant that reassuringly, but the knowledge that she could mess with your head is a little intimidating.");
	output("\n\n<i>“But that’s just the tip of the fang! I can slow or speed my perception of time, absorb energy directly - handling live wires is a helluva party trick - feel how the wires on the other side of a bulkhead are arranged, and so much more! I could even reshape bodies a little bit, though the one time I tapped that power I damn near put myself in a coma.”</i> Glancing down, Synphia adds, <i>“Totally worth it to graduate to C-cup.”</i>");
	output("\n\nYou ");
	var libido:Number = pc.libido();
	if(pc.isBimbo() || pc.isTreated() || libido >= 100) output("openly ogle her tits");
	else if(libido >= 66) output("can’t help but ogle her tits a little bit");
	else if(libido >= 50) output("glance at her tits once or twice");
	else if(libido >= 33) output("can’t stop yourself from stealing a downward glance at her tits");
	else output("studiously keep your eyes on her face");
	output(" and ask who she bought such a fabulous implant from. Cybernetics that potent seem like they’d be very popular.");
	output("\n\n<i>“They would be... if they weren’t a custom order from single seller on the extranet: Kel’korri Tsungmyre. My job was the last one she said she’d take. Word on the ‘net is she vanished when the Rush started to hunt down somebody that stole a prototype.”</i> Synphia shrugs. <i>“Can’t say I blame her, but I’m just happy I got taken care of before she hit the wind.”</i>");
	output("\n\nThere’s nothing more to say.");
	processTime(7);
	clearMenu();
	addButton(0,"Next",synphiaTalkScreen);
}

//Mods
public function modTalkWithSynphia():void
{
	clearOutput();
	showSynphia();
	author("Fenoxo");
	output("Synphia mentioned getting mods earlier, but aside from her horns you don’t see any. You ask if she wound up buying any after landing the sweet gig on Uveto.");
	output("\n\n<i>“I thought about it. I really did.”</i> Synphia stretches out, intentionally displaying her lithe body. <i>“Tits any bigger than this would get me stuck in an engine housing, and it’s not like I need a wetter pussy, bigger lips, or help with a gag reflex. I’m a slyveren, and even with an undersized chest, I’m still hotter and better in the sack than damn near anybody else on this iceball. Sometimes you grow up thinking you lost the genetic lotto, but when you move out, you realize you’re still better off than the rest of the galaxy.”</i>");
	output("\n\nYou raise an eyebrow in disbelief. <i>“None at all?”</i>");
	output("\n\n<i>“None... aside from the horns, but they’re more of a cybernetic augment than some kind of genome-rewriting mod. Besides, skipping expenses like that means I can keep my sister fitted in top-end gear for the rush.”</i> Synphia’s squeezes her tail fondly underneath an arm. <i>“Hope she’s doing okay. Almost due to come back for a refit, but yeah, that’s it. I’m almost entirely au natural.”</i>");
	flags["SYNPHIA_MODSTALK"] = 1;
	//Unlock sistalk
	processTime(4);
	clearMenu();
	addButton(0,"Next",synphiaTalkScreen);
}

//Sister
public function synphiaSisterTalk():void
{
	clearOutput();
	showSynphia();
	author("Fenoxo");
	output("You ask her about her sister, the one whose Rush expeditions she’s funding.");
	output("\n\n<i>“Oh, Iphedra?”</i> Synphia’s tail squirms around, and she holds it gently in her hands. <i>“She’s the reason I made it through school in the first place. It’s only fair for me to have her back on the Rush. Besides, it’s pretty much my duty as a slyveren to do everything I can to help us secure some frontier colonies.”</i>");
	output("\n\nScratching the back of your neck, you ask why.");
	output("\n\n<i>“Because the fucking galotians have been doing everything possible to strangle us out of existence for centuries. Hell, as soon as we got discovered by the UGC, they rushed to colonize nearly every surrounding system, then undercut our investments in industry at nearly every opportunity. Slyveren shipyard opening up? They opened one a system over that operates at a slight loss, just to keep us landlocked and poor.”</i> Synphia spits with surprising volume, splattering a few feet of the floor. <i>“I don’t know how brain-dead fuck-junkies have that kind of clout or organization, but they do, and they hate us, probably because we suck dick better than them.”</i>");
	output("\n\n<i>“Wow.”</i>");
	output("\n\nSynphia slaps you with her tail. <i>“Don’t be fucking impressed by those drippy bitches. Be impressed that my whole damn race is throwing themselves into danger just to secure a fucking foothold. Be impressed that I’m spending 80 percent of my income to kit out Iphedra’s ship with the best equipment money can buy. Be impressed that with her staking claims and me running paperwork that we’re personally responsible for control of a resource rich planet more livable than Uveto. Be impressed that Iphedra’s taken down two hired corporate guns and broken them into her personal cum-taps.”</i> Synphia stands as proudly as you’ve ever seen. <i>“She’s a stronger psychic than me on my best day, a better fighter than anyone in our graduating class, and despite not paying much attention in school, she’s as smart as anyone I’ve ever met.”</i>");
	output("\n\nYou don’t need to say a thing to show just how impressed you are.");
	output("\n\n<i>“Exactly. You’re not just talking to the best mechanic on this iceball: you’re talking to a woman from one of the best families in the galaxy.”</i> She looks at you and smiles. <i>“And I guess " + (pc.mf("","f") == "f" ? "so am I":"I know exactly how you feel, Mister Steele") + ".”</i> She shakes your hand. <i>“I hope you’re out there trying to make the galaxy a better place, just like she is.”</i>");
	processTime(5);
	clearMenu();
	addButton(0,"Next",synphiaTalkScreen);
}

//SteeleTech
public function steeletechSynphiaTalk():void
{
	clearOutput();
	showSynphia();
	author("Fenoxo");
	output("You ask her what she thinks of Steele Tech.");
	output("\n\n<i>“That’s a loaded question, [pc.MisterMiss] Steele.”</i> Synphia eyes you up warily. <i>“Though I suppose you’re looking for an honest appraisal of your father’s work since you hold no post in the company... yet.”</i> She rests a hand on her hip, her fingertips tapping. <i>“As far as megacorps go, it’s one of the best of the bunch. Everyone else has scandals two or three times a day. Xenogen? Four or five. Steele Tech? We might get caught up in something once a week, and it’s almost always due to ignorance or an individual bad actor who got the boot. So yeah, I guess I’m as close to a corporate fan-girl as I’m likely to get at this point.”</i>");
	output("\n\nThe way she talks makes it sound like she’s still hesitating about something. You ask.");
	output("\n\n<i>“Well,”</i> Synphia pauses, sweeping the hangar with her eyes. <i>“If you tell anyone I said this, I’ll deny it up and down the station, but I think things are starting to slip with the old corp. Almost as soon as Vic died, we got word yearly raises were being adjusted downward due to ‘unexpected Rush cost overruns.’ Then there was that story out of Accadia about a Steele Tech freighter hauling a load of indentured servants with contracts way below company spec.”</i> She shakes her head. <i>“My hunch is the board’s getting lazy now that they’re the top of the food chain. If things keep trending this way for another year or two... I’ll probably quit, but by then the Rush’ll be over, and I can retire with my sis. She’ll owe me pretty hard by then.”</i>");
	output("\n\nYou ask her what she would do if she was in charge.");
	output("\n\n<i>“That’s just it: I don’t want to be in charge.”</i> Synphia actually hisses in annoyance. <i>“I can barely manage my team’s corporate culture as it is. I can’t imagine being responsible for a planet’s worth of employees, and having to deal with all competing corporate bullshit. Heavy is the head that wears the crown, [pc.name], but I guess you know that already, or you’d be my boss right now, right.”</i>");
	output("\n\nIt’s probably best you don’t clear up that misconception for now.");
	processTime(5);
	flags["SYNPHIA_STEELETECHTALK"] = 1;
	clearMenu();
	addButton(0,"Next",synphiaTalkScreen);
}