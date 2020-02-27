import classes.Engine.Combat.DamageTypes.TypeCollection;
/*Rival Encounter
Notes
Approach
Fight
Insult
Dane Omni-explanation
Wait
Notes
Cousin has coordinates already, but he's so goddamn cocky that he leaves a copy for you, "just so you can stick around to see my inevitable victory."
Cousin has ausar mercenary by the name of Dane.
Dane has albino skin, white hair and fur, red eyes
Four arms - Dane is one of very few with the motor skills to independently use all of them for different tasks.
Dane has a tentacle dick that can extend up to 9' in length, studded with knots about every six inches.
Uses two high caliber pistols and a two electrified blades.
[Win] Cousin leaves dane to stall, picks him up after driving the PC back with a strafe from his gunship
[Lose] Dane violates the PC then hops on the gunship.
*/

public function rivalIsActive():Boolean 
{
	if(flags["RIVALCONFIGURED"] == undefined || flags["COUSIN_EXECUTED"] != undefined || flags["COUSIN_EGGSLUT"] != undefined || flags["COUSIN_BEDWARMER"] != undefined) return false;
	return true;
}
public function showRival(nude:Boolean = false):void
{
	showName("\n" + chars["RIVAL"].short.toUpperCase());
	showBust(rivalBustDisplay(nude));
}
public function rivalBustDisplay(nude:Boolean = false):String
{
	var sBust:String = chars["RIVAL"].short.toUpperCase();
	if(nude) sBust += "_NUDE";
	return sBust;
}
public function showDane(nude:Boolean = false):void
{
	showName("\nDANE");
	showBust(daneBustDisplay(nude));
}
public function daneBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "DANE";
	if(nude) sBust += "_NUDE";
	return sBust;
}
public function daneSexedTotal():int
{
	var nTimes:int = 0;
	if(flags["LOST_TO_DANE_ON_MHENGA"] != undefined) nTimes++;
	if(flags["TAURFUCKED_DANE"] != undefined) nTimes += flags["TAURFUCKED_DANE"];
	if(flags["DANE_SEXED"] != undefined) nTimes += flags["DANE_SEXED"];
	return nTimes;
}

//Approach
public function approachRivalOnMhenga():Boolean 
{
	// Room Descriptions
	var daneWins:Boolean = (flags["DIDNT_ENGAGE_RIVAL_ON_MHENGA"] != undefined || flags["LOST_TO_DANE_ON_MHENGA"] != undefined);
	var probeOnMhenga:Boolean = (flags["MHENGA_PROBE_CASH_GOT"] == undefined && !daneWins);
	if(probeOnMhenga) output("Buried halfway in a small crater of its own creation sits an oblong metal pod, perhaps ten feet long and three across. The surface is still glossy after its obviously hot reentry; you can see the way it blackened the ground and the plants around it. You immediately recognize it as one of the probes your father sent out - one of the keys to his fortune.");
	else
	{
		output("A small, vacant, impact crater is located on the jungle floor, the ground blackened and plants uprooted around it. It distinctly marks the site of one of your father’s probes");
		if(flags["MHENGA_PROBE_CASH_GOT"] != undefined) output(" you had since dug up");
		else output(" - the one your cousin stole from you");
		output(". The cavity now acts as a basin to collect rainforest water, turning it into a tiny lake.");
	}
	// Encounter
	if(flags["UNLOCKED_JUNKYARD_PLANET"] == undefined)
	{
		flags["UNLOCKED_JUNKYARD_PLANET"] = 1;
		showRival();
		output("\n\nYour cousin is here! [rival.Ey] was kneeling over the pod, but at the sound of your approach, [rival.ey] rises to [rival.eir] full height, trim form on full display under a simple, white bodysuit. [rival.Eir] hands fall on [rival.eir] hips. <i>“It looks like the slowest horse finally finished the race. That’s about what I’d expect from Uncle Vic’s kid.”</i> [rival.Ey] tosses [rival.eir] head, laughing uproariously. <i>“Don’t worry, cousin, I’ve copied the coordinates onto this data-chit. We are family, after all.”</i> [rival.Ey] smiles broadly at you. <i>“How else would you follow along to witness my glory?”</i>");
		output("\n\n[rival.short] tosses the chit over [rival.eir] shoulder into a bush. <i>“Whoops! I slipped. Guess you’ll have to scrabble around in the dirt for it, like one of the filthy locals.”</i> Shrugging, your cousin turns away. <i>“See ya at the next pod - if your weakass genes will let you stumble there in decent time. I can always leave you a love note if you don’t make it.”</i> [rival.Ey] snickers.");
		output("\n\nIf you wait, [rival.ey]’s going to leave! What do you do?");
		//[Fight] [Insult] [Wait]
		clearMenu();
		addButton(0,"Fight",fightYerRivalOnMhenga);
		addButton(1,"Insult",insultYourRivalOnMhenga);
		addButton(4,"Wait",letRivalGoOnMhenga);
		return true;
	}
	// Probe Options
	else 
	{
		if(probeOnMhenga)
		{
			output("\n\n<b>You’ve already gotten the data from this pod. It was a set of coordinates to");
			if(flags["UNLOCKED_JUNKYARD_PLANET"] >= 2) output(" Tarkus");
			else output(" another planet");
			if(flags["PLANET_3_UNLOCKED"] == undefined) output(", likely with its own pod");
			output(".</b> You can probably call Steele Tech to come in and retrieve it.");
			addButton(0,"Reclaim Pod",probeReclamationMhenga,0);
		}
		return false;
	}
}
public function probeReclamationMhenga(response:int = 0):void
{
	clearOutput();
	showName("STEELE\nTECH");
	author("Jacques00");
	
	if(response == 0)
	{
		output("With the data-less probe just sitting there, you decide it’s probably best to call in a pickup before you get complaints forwarded to you by Pyrite Industries if they happen to stumble upon it during construction. You flip out your Codex and dial Steele Tech for property retrieval. Communications tell you that they will dispatch a boat to your position as the probe’s signal is currently too weak to pinpoint. So with that, you wait.");
		processTime(60);
		clearMenu();
		addButton(0,"Next",probeReclamationMhenga,1);
	}
	else if(response == 1)
	{
		output("And wait...");
		processTime(60);
		clearMenu();
		addButton(0,"Next",probeReclamationMhenga,2);
	}
	else if(response == 2)
	{
		output("... and wait.");
		processTime(60);
		clearMenu();
		addButton(0,"Next",probeReclamationMhenga,3);
	}
	else if(response == 3)
	{
		showBust("MILLY");
		
		output("Over three-and-a-half hours pass and you start to wonder what is taking so long--but a mechanical humming noise breaks through the natural rainforest sounds, alerting you of an approaching hover bike.");
		output("\n\nWhen the bike finally arrives, it lands next to the probe. The driver, clad in an armored Steele Tech suit and bio-helmet, steps off and props the vehicle to the parking position, then activates a towing device in the back. As the hydraulics hum and the tractor beam warms up, the person takes off their helmet to reveal a cocoa-toned young");
		if(CodexManager.entryUnlocked("Dzaan")) output(" dzaan");
		else output(" alien");
		output(" female with bright violet eyes and platinum micro braids, tied up into a mid-ponytail. Her maroon-colored lips stretch into a brief smile as she deeply inhales.");
		output("\n\n<i>“Pick-up crew at your service, " + pc.mf("Mr.","Ms.") + " Steele,”</i> she says, giving you a two-finger salute with her gloved fingers.");
		if(!CodexManager.entryUnlocked("Dzaan"))
		{
			output("\n\n<b>(New Codex entry unlocked: Dzaan.)</b>");
			CodexManager.unlockEntry("Dzaan");
		}
		if(pc.isNice()) output("\n\n<i>“Greetings, was there trouble? I’ve been waiting for quite some time,”</i> you answer");
		else output("\n\n<i>“It’s about time, kid - what in the void took you so long?”</i> you retort");
		output(", <i>“...and ‘crew’? There’s only one of you.”</i>");
		output("\n\nThe girl blushes slightly of embarrassment. <i>“I’m incredibly sorry about the delay - we tried to send you updates, but our messenger systems were corrupted by the humidity when we landed. That and Ringo was too afraid to land deep in the jungles--he’s still a pilot-in-training, fresh out of the academy, and he didn’t want to lose the bird on his first pickup run--so we landed at port. Another hour was eaten up when we entered because Maggie wanted to make sure everything checked out with the authorities before going in - she’s the supervisor on this run. The thick jungle also made it impossible for us to enter as a party, so I was ordered to go in with this speeder to make the pickup while the others try to fix the comms.”</i>");
		output("\n\nYou accept her apology and take note of her crew’s novice-level experience.");
		output("\n\nA green light flickers on the control panel, letting the courier know the anti-gravity tractor is primed and ready. She unravels a wire from the back of the bike and latches its hook onto one of the probe’s internal rails. Flipping a switch, the wire reels in and the tractor beam helps lift the pod from the soft earth. A few creaks sound as the bike’s back end tilts under the weight being lifted. With a metallic clink, the line stops and the probe is connected to the vehicle.");
		output("\n\nThe young female kneels down and starts attaching some securing straps into place. As you help her with it, her hover bike’s onboard radio crackles to life with digital static.");
		output("\n\n<i>“--two--eck... --you read?”</i> A male voice can be heard through the comm-link.");
		output("\n\nThe girl’s ears and eyes perk up. She stretches herself across the bike, ass in the air, and taps the transmit button. <i>“Ten-nine, I can barely hear you, four-ten?”</i>");
		output("\n\nA soft hush, then, <i>“Check, one-two. Check, Milly, do you copy?”</i>");
		output("\n\n<i>“Five by five, Kitty Cat, over.”</i>");
		output("\n\n<i>“Ten-four--</i>ugh<i>, and stop calling me that! What’s your 20?”</i>");
		output("\n\n<i>“I have the package and I’m ready to return to the boat.”</i>");
		output("\n\n<i>“Copy that. Give Steele a big hello for me, will ya?”</i>");
		output("\n\nMilly looks over her rear and giggles, <i>“Ringo says hi.”</i> She then continues, <i>“Affirmative.”</i>");
		output("\n\n<i>“Alright, the bird should be ready in ten. Get your butt over here if you want to make the next shipment.”</i>");
		output("\n\n<i>“Ten-four, I’m 51 to you now.”</i>");
		output("\n\n<i>“Roger that, good buddy.”</i>");
		output("\n\nYou lightly chuckle at the radio chatter you just witnessed.");
		output("\n\n<i>“Oh, I almost forgot,”</i> she says, whipping out her Codex. <i>“These old probes still have a bounty attached to them, so I have to make sure you get paid before I jet.”</i> She waves her device next to yours and it gives a positive beep, alerting you to a new deposit of <b>10,000 credits</b> into your bank account.");

		pc.credits += 10000;
		processTime(60);
		restHeal();
		flags["MHENGA_PROBE_CASH_GOT"] = 1;
		variableRoomUpdateCheck();
		generateMapForLocation(currentLocation);
		
		if((pc.cockThatFits(600) >= 0 || pc.hasVagina()) && pc.lust() >= 33)
		{
			output("\n\nNice. Though there’s something else the cute dzaan could do for you if she has the time...");
			clearMenu();
			addButton(1,"Fuck",millyBonusSex,undefined,"Fuck","Have a quickie with Milly before she leaves.");
			addButton(0,"Thank Her",thankMilly,true,"Thank Her","Thank Milly and send her on her way.");
		}
		else
		{
			thankMilly(false);
		}
	}
}
public function thankMilly(newPage:Boolean = false):void
{
	if(newPage)
	{
		clearOutput();
		showName("\nMILLY");
		showBust("MILLY");
		author("Jacques00");
	}
	else output("\n\n");
	
	output("You thank the young woman, as she double-checks the straps. With everything secured, she dons her helmet, positions herself on the bike, releases the parking stand and revs up the engine, hovering along with the newly acquired load. Giving her two-finger salute again, she bids you farewell and blasts through the narrow jungle depths towards the exit with a loud hum and the probe in tow.");
	output("\n\nWhen she’s finally gone, you prepare your things and set out.");
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function millyBonusSex():void
{
	clearOutput();
	showName("\nMILLY");
	showBust("MILLY_NUDE");
	author("Wsan");
	//[Milly]
	//Have a quickie with Milly before she leaves.
	output("<i>“Hey Milly,”</i> you say, casually approaching her");
	// while she’s laid out on the bike and not transmitting
	output(". <i>“While we’re out here alone, just the two of us... up for a bit of fun?”</i>");
	output("\n\n<i>“I- uh,”</i> she stutters, her face instantly flushing at the attention. She turns from you to the radio, then back to you, glancing at it sideways. <i>“Yes, b-but what will we do about the crew?”</i>");
	output("\n\n<i>“Easy,”</i> you tell her, putting a hand on her voluptuous ass and leaning over the bike to key the transmitter. As you do, you can’t help but notice the amount of give to Milly’s plump butt. This girl might be thick, but she’s definitely fit. <i>“Steele here. We’re having some issues with the probe, but it’s nothing we can’t take care of. Keep up the good work and I’ll have Milly back to you soon.”</i>");
	output("\n\nThe affirmative reply comes back, but frankly you’re far more interested in Milly’s incredible assets.");
	output("\n\n<i>“C’mere, cutie,”</i> you tell her, giving her butt a fierce squeeze before letting go and stepping away.");
	output("\n\n<i>“Ah, um,”</i> she says, stumbling on her words nervously as she hastily dismounts the bike. <i>“I don’t really have that much experience so...”</i>");
	output("\n\n<i>“Relaaaax,”</i> you reassure her, flashing her a smile and helping her off the bike. <i>“I’m not here to grade you on your performance, y’know? We can leave all the company stuff behind us right now.”</i>");
	output("\n\nYou can tell she’s definitely just a bit starstruck, so you’re going to have to help her out.");
	output("\n\n<i>“Do you mind if I-?”</i> you ask, gesturing at the buckles and fasteners holding her breasts in place.");
	output("\n\n<i>“Oh, no,”</i> she says, smiling back and thrusting her chest out a little. The sight is to die for. <i>“Go ahead.”</i>");
	output("\n\nA few seconds later and you have her well-formed breasts exposed, every bit as luscious as her butt and just as nice to hold. You can see gooseflesh around the dark cocoa of her nipples, the studs in question jutting outwards and hard to the touch.");
	output("\n\n<i>“Damn, you’re curvy </i>everywhere<i>,”</i> you murmur, teasing her nips just a bit.");
	output("\n\n<i>“Nnnnmm,”</i> Milly sighs in satisfaction, subtly rubbing her thighs together as you play with her. <i>“I’m told that’s my best ass-et...”</i>");
	output("\n\n<i>“Jokes too?”</i> you say, grinning. <i>“This should be fun.”</i>");
	
	var cIdx:int = pc.cockThatFits(600);
	
	if(!pc.isCrotchExposed()) 
	{
		output("\n\n<i>“Can I see- uh, what you’re... packing?”</i> Milly asks hesitantly. <i>“Sorry, I’ve never been very good with dirty talk.”</i>");
		output("\n\n<i>“Sure,”</i> you say generously, lifting your hands off her perfect breasts. <i>“Get a good look.”</i>");
		output("\n\nShedding your [pc.crotchCovers], Milly ");
	}
	else output("\n\nShuffling between your legs, Milly ");

	if(!pc.isTaur()) 
	{
		output("puts her hands between your [pc.legs] and gets a nice handful of ");
		if(cIdx >= 0 && pc.balls > 0) output("your [pc.balls]");
		else if(cIdx >= 0) output("your [pc.cock " + cIdx + "]");
		else output("your [pc.pussy]");
		output(", her eyebrows raising before a grin crosses her face.");
	}
	else
	{
		if(cIdx >= 0) output("gets an immediate eyeful of your [pc.cock " + cIdx + "], a low whistle then a giggle issuing from underneath you");
		else output("stretches her hand up your hindquarters and gets a couple of fingers inside your [pc.pussy]");
		output(". You can hear the grin in her voice when she speaks.");
	}
	output("\n\n<i>“This </i>will<i> be fun,”</i> she agrees wholeheartedly, giving you a friendly stroke. <i>“We’d better hurry up, though.”</i>");
	output("\n\n<i>“You don’t want lub- oh...”</i> you trail off, watching her pull her tights down and spread those amazing asscheeks. Her pussy is sopping wet, drooling pearlescent strands of arousal down her thick brown thighs. <i>“Damn, Milly.”</i>");
	output("\n\n<i>“I get pretty wet,”</i> she admits, her face coloring itself a deep shade of scarlet once more. <i>“It’s a little embarrassing, actually.”</i>");
	output("\n\n<i>“Don’t be embarrassed, that’s hot as fuck,”</i> you tell her, shaking your head. <i>“Like anyone’s going to complain that you’re turned on for them.”</i>");
	output("\n\n<i>“Thanks, that does actually make me feel a little better,”</i> she says, giving you a lopsided grin. <i>“So... how do you want me?”</i>");
	
	if(cIdx >= 0 && !pc.isTaur()) 
	{
		output("\n\nGiven that you have a cock, you absolutely cannot pass up the opportunity to watch her jiggle from behind as you fuck her pussy. Some part of you harbors a slight suspicion about Steele Tech’s hiring criteria given Milly’s divine proportions, but you don’t see the issue. Regardless, you have a perfect d’zaan girl in front of you to fuck. You make a downward-pointing twirling motion with your finger and smile.");
		output("\n\n<i>“Turn that amazing ass of yours around, Milly. Might help to brace yourself on the bike.”</i>");
		output("\n\n<i>“Yes [pc.sir],”</i> she says, grinning as she turns. Putting her hands out on her bike, spreading her legs, and turning back to you, she flutters her eyelashes. <i>“Like what you see?”</i>");
		output("\n\n<i>“Fuck yeah I do,”</i> you murmur, taking a second just to appreciate the sight. But only a second. <i>“Hope you’re ready for a little rough action, Milly.”</i>");
		output("\n\n<i>“I’m well-equipped to handle it,”</i> she replies smugly, sighing lustily as you place your hands on her waspish waist. She’s not kidding, either. With this kind of padding you could probably rail her like she’s a New Texan cowgirl, but she did say she wasn’t too experienced. Best to start her off slow.");
		output("\n\nShe moans when she feels you at her entrance, gasps when you slip your [pc.cockHead " + cIdx + "] in, and gives a low, lengthy scream of pleasure as you slide yourself home.");
		
		pc.cockChange();

		if(pc.cocks[cIdx].cLength() < 12) output("\n\n<i>“Oh god, that’s goooood,”</i> she pants, squirming in your grasp. <i>“I can feel you so deep inside...”</i>");
		else if(pc.cocks[cIdx].cLength() < 24) output("\n\n<i>“Oohhh god,”</i> she groans in pleasure, shaking in your grip. <i>“You’re a lot bigger than anyone I’ve been with!”</i>");
		else output("\n\n<i>“Oh, god! Fuck!”</i> she screams into the forest, shuddering and bouncing on your cock. <i>“You’re fucking huge!”</i>");
		output("\n\nBy the time you’ve even gotten yourself properly acquainted with the pleasure of fucking Milly’s pussy, she’s cum on your cock three times, straining her voice to express her joy. This girl is on a hair-trigger, and not afraid to let you know about it. With the way she squirts so hard when she cums, it’s impossible not to know when it happens.");
		output("\n\n<i>“Ooooggggh god,”</i> she groans, head hanging low as your thighs bounce off her ass. <i>“Please cum in me before I go crazy! Please!”</i>");
		output("\n\n<i>“Whatever you say,”</i> you huff, beginning to fuck her as hard as you can, the staccato sound of [pc.skinFurScales] slapping skin resounding throughout the little clearing as you fuck the daylights out of Milly with her draped over her bike. Gritting your teeth, you pull her braided ponytail and cum in her with a rough grunt, your instincts telling you to get as deep as possible inside her while she squirts all over your ");
		if(pc.balls > 0) output("[pc.balls].");
		else output("[pc.cock " + cIdx + "].");
		output("\n\nOnce you’re satisfied with how much you’ve unloaded inside her, you pull out and let her drip all down her thighs. Her creamed cunt glistens with your and her fluids, a steady drool of spunk running down her legs.");
		output("\n\n<i>“Ooohhhh my god,”</i> Milly moans, rolling over onto her back and sending another cascade of spunk down her thighs. <i>“I have </i>never<i> fucked like that. Ever.”</i>");
		output("\n\n<i>“Glad to help,”</i> you say, tipping an imaginary ten-gallon hat and earning a breathless laugh. The sight of her lying on her back, chest heaving and sweat-slick caramel skin has you wanting to go all over again. Not to mention she’s still leaking <i>your</i> cum from that tight, quivering pussy...");
		output("\n\n<i>“Ooh, someone’s eager,”</i> Milly murmurs, spotting your unflagging erection. <i>“Well, I don’t think I can go another round right now,”</i> she admits, gingerly sitting upright before tilting her head and looking at you from the side. <i>“But I miiiight be able to fit in a beejay...”</i>");
		output("\n\nBy the time you send the happy girl back to her crew with a pat on the butt, spunk down her throat and up her pussy, and a kiss on the cheek, you’ve cum in her three times. You briefly entertain the notion that you’ve just encountered a succubus instead of a cute d’zaan chick before getting ready to head back into the jungle proper.");
	}
	//Havecock, taur
	else if(cIdx >= 0)
	{
		output("\n\nHer divine proportions, like those of an old Earth fertility goddess, have inspired both you and your [pc.cock " + cIdx + "]. You’ve got to have that wet, warm pussy wrapped around your dick. You make a downward-pointing twirling motion with your finger and smile.");
		output("\n\n<i>“Turn that amazing ass of yours around, Milly. Might help to brace yourself on the bike so I can mount you.”</i>");
		output("\n\n<i>“Ooooh, </i>mounting<i>,”</i> she murmurs, biting her lip as she turns. <i>“Has a sexy ring to it...”</i>");
		output("\n\n<i>“It does, doesn’t it?”</i> you agree, taking a step behind her as she bends.");
		output("\n\nPutting her hands out on her bike, spreading her legs, and turning back to you, she flutters her eyelashes. <i>“Like what you see?”</i>");
		output("\n\n<i>“Fuck yeah I do,”</i> you murmur, taking a second just to appreciate the sight. But only a second. <i>“Hope you’re ready for a little rough action, Milly.”</i>");
		output("\n\n<i>“I’m well-equipped to handle it,”</i> she replies smugly, sighing lustily as you place your hands on her waspish waist. She’s not kidding, either. With this kind of padding you could probably rail her like she’s a New Texan cowgirl, but she did say she wasn’t too experienced. Best to start her off slow.");
		output("\n\nShe moans when she feels you at her entrance, gasps when you slip your [pc.cockHead " + cIdx + "] in, and gives a low, lengthy scream of pleasure as you slide yourself home.");
		
		pc.cockChange();
		
		if(pc.cocks[cIdx].cLength() < 12) output("\n\n<i>“Oh god, that’s goooood,”</i> she pants, squirming in your grasp. <i>“I can feel you so deep inside...”</i>");
		else if(pc.cocks[cIdx].cLength() < 24) output("\n\n<i>“Oohhh god,”</i> she groans in pleasure, shaking in your grip. <i>“You’re a lot bigger than anyone I’ve been with!”</i>");
		else output("\n\n<i>“Oh, god! Fuck!”</i> she screams into the forest, shuddering and bouncing on your cock. <i>“You’re fucking huge!”</i>");
		output("\n\nBy the time you’ve even gotten yourself properly acquainted with the pleasure of fucking Milly’s pussy, she’s cum on your cock three times, straining her voice to express her joy. This girl is on a hair-trigger, and not afraid to let you know about it. With the way she squirts so hard when she cums, it’s impossible not to know when it happens.");
		output("\n\n<i>“Ooooggggh god,”</i> she groans, head hanging low as your thighs bounce off her ass. <i>“Please cum in me before I go crazy! Please!”</i>");
		output("\n\n<i>“Whatever you say,”</i> you huff, beginning to fuck her as hard as you can, the staccato sound of [pc.skinFurScales] slapping skin resounding throughout the little clearing as you fuck the daylights out of Milly with her draped over her bike. Gritting your teeth, you cum in her with a rough grunt, your instincts telling you to get as deep as possible inside her while she squirts all over your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("[pc.cock " + cIdx + "]");
		output(".");
		output("\n\nOnce you’re satisfied with how much you’ve unloaded inside her, you pull out and let her drip all down her thighs. Her creamed cunt glistens with your and her fluids, a steady drool of spunk running down her legs.");
		output("\n\n<i>“Ooohhhh my god,”</i> Milly moans, rolling over onto her back and sending another cascade of spunk down her thighs. <i>“I have </i>never<i> fucked like that. Ever. I’ve never even been with a ‘taur.”</i>");
		output("\n\n<i>“Glad to help,”</i> you say, tipping an imaginary ten-gallon hat and earning a breathless laugh. The sight of her lying on her back, chest heaving and sweat-slick caramel skin has you wanting to go all over again. Not to mention she’s still leaking <i>your</i> cum from that tight, quivering pussy...");
		output("\n\n<i>“Well, I don’t think I can go another round right now,”</i> she admits, gingerly sitting upright before tilting her head and looking at you from the side. <i>“But I miiiight be able to fit in a beejay...”</i>");
		output("\n\nBy the time you send the happy girl back to her crew with a pat on the butt, spunk down her throat and up her pussy, and a kiss on the cheek, you’ve cum in her three times. You briefly entertain the notion that you’ve just encountered a succubus instead of a cute d’zaan chick before getting ready to head back into the jungle proper.");
	}
	//Nocock, nontaur:
	else if(!pc.isTaur())
	{
		output("\n\nTaking a step closer to the beautiful young girl, you give her a light push and a grin as she steps back against the bike. <i>“We can start with you spreading those sexy legs of yours and see where we go from there.”</i>");
		output("\n\n<i>“That sounds like a pretty good idea coming from yo- ooh!”</i> Milly suddenly gasps, lapsing into a gentle moan as you slowly stroke her from within with your fingers. <i>“That was sudden...”</i> she murmurs before licking her lips flirtatiously. <i>“But I liked it.”</i>");
		output("\n\n<i>“Oh yeah?”</i> you say, leaning in as you place your thumb on her clit. <i>“How about this?”</i>");
		output("\n\nMilly arches her back fiercely the moment you start rubbing her both inside and out, a louder moan escaping her lips as her thighs start instinctively closing. With your free hand you keep them open, rubbing her more and more vigorously until she’s looking up at you with eyes wide and shimmering, gasping your name as she starts to cum.");
		output("\n\n<i>“Oh, [pc.name]! [pc.name]!”</i> Milly cries out before gritting her teeth, watching you hopelessly as you drive her to an orgasm so hard she forgets to breathe. She squirts all over your fingers again and again, shaking against your hand until you finally let her go and she follows suit, collapsing onto the bike’s seat and gasping. You lean over her and give her a vivacious smile.");
		output("\n\n<i>“So? Did you like th-”</i> you start, only to be cut off by Milly pulling you down on top of her and kissing you wildly");
		if(pc.hasHair()) output(", running her hands through your [pc.hair]");
		output(". <i>“Mmmm!”</i>");
		output("\n\nYou spend the next minute on top of Milly, touching the sensitive girl all over and letting her hands freely explore your body until they finally slip between your legs, a finger sliding right into your [pc.pussy].");
		output("\n\n<i>“Oohh, yes,”</i> you moan, looking down at her with lidded eyes. <i>“That’s a good girl...”</i>");
		output("\n\nIt quickly becomes apparent that Milly is a very fast learner, as she employs your own tactic against you to great effect, giving you an orgasm that has your eyes rolling in your head. The two of you lose track of time trading orgasms with your hands, capping off the wild, unrestrained experience by 69ing each other to a massive, body-shaking orgasm.");
		if(pc.isSquirter()) output(" You both squirt all over each other, unable to hold yourself back in the face of such sheer, unrelenting pleasure and an able tongue.");
		else output("Milly squirts all over your chin, unable to hold herself back in the face of such sheer, unrelenting pleasure and your able tongue.");
		output("\n\n<i>“Ooohhhh my god,”</i> Milly moans, wrapping an arm around you once you’re both the right way up. <i>“I have </i>never<i> fucked like that. Ever. I’ve never even been with another girl.”</i>");
		output("\n\n<i>“Glad to help,”</i> you say, giving her a quick peck on the cheek. Honestly, the sight of her lying on her back, chest heaving and sweat-slick caramel skin has you wanting to go all over again. Not to mention that first taste of her quivering pussy was utterly divine.");
		output("\n\n<i>“Well, I’m probably too exhausted to fuck more right now,”</i> she moans, gingerly sitting upright before tilting her head and looking at you from the side. <i>“But if you wanted to, say, ride my face...”</i>");
		output("\n\nBy the time you send the happy girl back to her crew with a pat on the butt, your juices all over her face, and a kiss on the cheek, you’ve cum three times and brought her to orgasm more times than you can count. You briefly entertain the notion that you’ve just encountered a succubus instead of a cute d’zaan chick before getting ready to head back into the jungle proper.");
		
		pc.applyPussyDrenched();
	}
	//Nocock, taur
	else
	{
		output("\n\n<i>“What I want,”</i> you tell her, grinning all the while, <i>“is to have that pretty little face buried between my hindlegs.”</i>");
		output("\n\n<i>“Wow, that might be the hottest thing anyone’s ever said to me,”</i> Milly says, eyebrows raised. <i>“Something to be said for pure, stark sexuality...”</i>");
		output("\n\nShe slowly walks behind you, arm out and stroking your flank until she reaches your back half.");
		output("\n\n<i>“I kinda wish I could kiss you when we do this,”</i> she admits, ");
		if(pc.hasTail() && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output("lightly tugging your [pc.tails] out of the way, ");
		output("placing both her hands on your [pc.ass] and sinking to her knees.");
		output("\n\n<i>“I’ve got another set of lips you can kiss, cutie,”</i> you murmur, giving Milly a ‘wink’ that elicits a small gasp.");
		output("\n\n<i>“Oh, wow...”</i> she says, sliding her hand down closer. <i>“Is that your clit?”</i>");
		output("\n\nYou answer by way of a loud, lusty groan when she strokes her finger across [pc.oneClit], your hindlegs shaking a little at the sensation.");
		output("\n\n<i>“Yup,”</i> Milly mutters, bringing her mouth closer.");
		output("\n\nYou moan happily when you feel the embrace of her lips on your own, parting your folds to plant a wet kiss right on your clit. What follows is a series of probing finger motions and experimental licks, sucks, and nibbles that soon have you crying out in pleasure, right on the edge of cumming. Milly’s a very fast learner, and taking note of all the spots that have you moaning like you’re in heat she manages to bring you to a massive, hip-shaking orgasm.");
		output("\n\nYou’ve barely recovered from that when you feel her dainty fingers stretching you open, Milly splaying her hand inside the entrance of your tight, wet folds before slowly sinking herself deeper. Now you <i>really</i> scream in pleasure, the d’zaan girl looking on in awe as she brings a woman more than twice her size to an earth-shattering orgasm with a hand. Unsure of your limits but unwilling to let it go when you’re clearly in ecstasy, she makes you cum twice more before your front legs buckle as your voice breaks.");
		output("\n\n<i>“Oh! A-are you okay?”</i> Milly says, uncertain. Slowly withdrawing her fist from your well-used pussy, she walks to your front to check on you. <i>“Oh... you’re definitely okay.”</i>");
		output("\n\n[pc.Breasts] heaving, you gasp for air and grope at your own nipples before dazedly realizing that Milly’s bent over in front of you. A prime target for unleashing your lust. Standing back up, she follows your ascent and gives an ‘eep!’ of surprise as you sweep her off her feet, laying her back on her bike and immediately diving into her sopping wet pussy.");
		output("\n\nYou bring her squealing and moaning to her first of many orgasms, the voluptuous d’zaan squirming in your inescapable grip and crying out your name over and over. By the time she cums a second time, she has those thick thighs wrapped around your head, begging you to stay in her pussy.");
		output("\n\nBy the time you realize you have to return the probe, Milly is practically delirious and bordering on unconsciousness. Not only is she a very emphatic squirter, but she orgasms on a hair trigger. You admit to feeling a little jealous of her capability to have multiple rolling orgasms at once, her hips jerking into the air so hard you had to hold her down to keep tonguefucking her.");
		output("\n\n<i>“Ooohhhh my god,”</i> Milly moans, lying spreadeagle with your chin resting on her abs. <i>“I have </i>never<i> fucked like that. Ever. I’ve never even been with another girl, let alone a ‘taur...”</i>");
		output("\n\n<i>“Glad to help,”</i> you say, giving her a quick kiss on her tummy. Honestly, the sight of her lying on her back, chest heaving and sweat-slick caramel skin has you wanting to go all over again. Not to mention that her quivering pussy tastes divine. You could spend all day eating her out, or having her between your legs.");
		output("\n\n<i>“I’m probably too exhausted to fuck more right now,”</i> she moans, gingerly sitting upright before tilting her head and looking at you from the side. <i>“But if you wanted to, say, ride my face and do all the work...”</i>");
		output("\n\nBy the time you send the happy girl back to her crew with a pat on the butt, your juices all over her face, and a kiss on the cheek, you’ve cum seven times and brought her to orgasm more times than you can count. You briefly entertain the notion that you’ve just encountered a succubus instead of a cute d’zaan chick before getting ready to head back into the jungle.");
		
		pc.applyPussyDrenched();
	}
	//mainmenu
	processTime(45);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	IncrementFlag("MILLY_FUCKED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Fight
public function fightYerRivalOnMhenga():void {
	clearOutput();
	showRival();
	output("<i>“");
	if(pc.isNice()) output("I won’t just sit here and take your insults. Why don’t we just settle this here and now? Fight me!");
	else if(pc.isMischievous()) output("You expect me to sit here and take your lame insults sitting down? I don’t think so, you cheating sack of crap, we’re fighting!");
	else 
	{
		output("I’m going to knock that sorry grin off your face, and when I’m done with you, you’re going to wish I had left enough of you for one of the ");
		if(flags["ENCOUNTERED_ZIL"] != undefined || flags["TIMES_MET_FEMZIL"] != undefined) output("zil");
		else output("locals");
		output(" to ream!");
	}
	output("”</i>");
	output("\n\n[rival.short] turns back around, sighing. <i>“Please. No offense, cousin, but you aren’t worth the drain on my plasma pistol’s fuel cells.”</i>");
	output("\n\nYou draw your " + pc.rangedWeapon.longName + ", resolute.");
	output("\n\n<i>“If you insist.”</i> [rival.short] snaps [rival.eir] fingers. <i>“Dane?”</i>");
	output("\n\nDane? Who the fuck is Dane? Your confusion must be evident.");
	output("\n\n[rival.short] chuckles and steps aside, revealing the form of a hulking brute behind [rival.em], in the shadows.");
	clearMenu();
	addButton(0,"Next",daneOmniExplanation);
}

//Insult
public function insultYourRivalOnMhenga():void {
	clearOutput();
	showRival();
	output("<i>“So first you cheat your way into a shot at stealing my inheritance, and now you have the gall to insult my father? Fuck you, you whiny, worthless little cheater.”</i> You can’t keep the hate out of your voice. <i>“I’d call you a conceited asshole, but that would make the conceited assholes of the universe look bad. You keep hiding behind your wealth, but you’re nothing more than a common thief and a thug.”</i>");

	//Track if the PC chose this incase of later bro expack
	flags["INSULTED_COUSIN_ON_MHENGA"] = 1;
	output("\n\n[rival.short] whirls on you, eyes wide, almost crazy. <i>“Why you ungrateful little shit! Dane! Come teach this rat some manners.”</i>");
	output("\n\nDane? Who the fuck is Dane? Your confusion must be evident.");
	output("\n\n[rival.short] sneers and steps aside, saying, <i>“Some people call ausar humanity’s lapdogs. Dane’s more of a guard dog.”</i> The form of a hulking brute emerges from behind [rival.em], in the shadows.");
	clearMenu();
	addButton(0,"Next",daneOmniExplanation);
}

//Dane Omni-explanation
public function daneOmniExplanation():void {
	flags["MET_DANE"] = 1;
	flags["FOUGHT_DANE_ON_MHENGA"] = 1;
	clearOutput();
	showDane();
	output("It’s huge, standing nearly eight feet tall, and as it steps into the light, your mouth drops. This creature, Dane, has four arms, each corded with thick muscle under his shining, white fur. For armor, he wears a silvery harness over his chest and upper legs, covered in glowing lights. A large, illuminated core sits square in the middle of it, glowing like a miniature sun. The ausar’s hair is as white as his fur, and his skin is paler than cream. Eyes like burning coals glare out at you from his sockets. He’s an albino.");
	output("\n\nYour cousin passes into the shadows, saying <i>“I’ll send a gunship to pick you up when you finish disciplining my uppity cousin. Don’t kill " + pc.mfn("him","her","it") + ", okay?”</i>");
	output("\n\nDane smiles, his pointed ears twitching. <i>“Wouldn’t think of it, boss. I’ve got better uses for a piece of meat like this.”</i>");
	output("\n\nShrugging, [rival.name] resumes [rival.eir] walk away. <i>“If you say so. Just don’t take too long. I’m not waiting to leave just because you’ve tied yourself deep in " + pc.mfn("his","her","its") + " ass.”</i> [rival.Ey] vanishes with a bemused laugh.");
	output("\n\nDane focuses his attention entirely on you. His uppermost arms pull a pair of curved blades from harnesses on his back, thumbing activation studs on the hilts. The air suddenly fills with the smell of ozone. They’re electrified! Down below, the lower arms grab a set of ancient-looking, chromed pistols from holsters. The ausar flexes. <i>“A lot of people think an extra set of arms will give them an edge in a fight, and it will. But...”</i> he pauses for effect, <i>“Our brains aren’t meant to control that many limbs. The ability to independently coordinate four or more arms exists in one thousandth of the population of two-armed races.”</i> Dane’s feet spread into a confident stance. <i>“You’re looking at one of them.”</i>");
	output("\n\nTwirling his blades while simultaneously cocking his guns, Dane whispers, <i>“Prepare your anus.”</i>");
	//Start fight
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new Dane());
	CombatManager.victoryScene(defeatDane);
	CombatManager.lossScene(loseToDane);
	CombatManager.displayLocation("DANE");
	
	clearMenu();
	addButton(0,"Next", CombatManager.beginCombat);
}

//Wait
public function letRivalGoOnMhenga():void {
	clearOutput();
	flags["DIDNT_ENGAGE_RIVAL_ON_MHENGA"] = 1;
	output("<i>“Alright Dane, let’s get out of here already,”</i> [rival.name] shouts as [rival.ey] jumps into [rival.eir] ship, the engines ablaze. The loud sound of cranks can be heard and you turn to see a thick magnetic chain reeling into [rival.eir] craft... pulling your dad’s probe up with it!");
	output("\n\n[rival.name] guffaws, <i>“You didn’t think I’d leave with just only the coordinates, did you? I’m gonna have a payday with this hunk o’ junk!”</i> Damnit, [rival.ey]’s trying to sap out as many credits as [rival.ey] can from you.");
	output("\n\nYou ball your fists in protest, but ultimately decide to let [rival.em] go. There’s no sense in wasting time with a fight when [rival.ey]’s already given you what you came for. Once [rival.ey]’s gone, you root around in the brush for a moment, ignoring the scratching branches to find the data-chit. It’s a little scuffed and damp dirt is plastered all over it, but it looks okay. You stand and dust it off before connecting it to your codex. The data is all there: coordinates for another planet, presumably one with another probe. All you had to do was not let your pride get the better of you.");
	output("\n\nYou’ll just have to get to the next one before your cousin.");
	processTime(10);
	variableRoomUpdateCheck();
	generateMapForLocation(currentLocation);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function defeatDane():void
{
	clearOutput();
	showBust(rivalBustDisplay());
	showName("DANE &\n" + chars["RIVAL"].short.toUpperCase());
	output("Slumping, the hulking ausar thug looks like he’s close to giving in. Before you can finish this, explosions stitch up the ground in front of you, forcing you to dive for cover. The bass hum of thrusters in atmosphere greets you before the gusting backwash does, giving you enough time to put your arm up to block the worst of it. Dane stumbles into the ship, one blade falling from a numb grip to the ground behind him.");
	output("\n\nThe hatch closes, but you’re able to see [rival.short]’s pearly teeth behind [rival.eir] smile as it does. You ");
	if(pc.rangedWeapon is Rock) output("chuck a few rocks");
	else output("crack off a few, half-hearted shots");
	output(" at the ship, but the armor is too thick. It disappears into the canopy, leaving you alone with your thoughts and the data-chit in the bush. A quick search turns it up, and as you’d expect, it has a set of coordinates on it.");
	output("\n\nThere’s still time. You can get to the next probe before your cousin, you’re sure of it!\n\n");
	flags["WHUPPED_DANES_ASS_ON_MHENGA"] = 1;
	variableRoomUpdateCheck();
	generateMapForLocation(currentLocation);
	CombatManager.genericVictory();
}

//Losses
//Omni Loss [Unwritten]
//Buttfuck!
public function loseToDane():void {
	clearOutput();
	showDane(true);
	//HP
	if(pc.HP() <= 0) 
	{
		output("You slump down, unable to fight anymore. Dane chuckles, <i>“Well, that wasn’t too hard. You crumpled like a house of cards.”</i> He holsters his weapons so that he can scratch his chin with one hand. <i>“I guess the boss must not be very tough [rival.himHer]self if [rival.he] didn’t feel like dealing with you.”</i> The ausar thug laughs harder, a rumbling baritone thing that you can feel in your bones. <i>“There’s no point in wasting time then; [rival.he]’ll be back shortly.”</i>");
	}
	//Lust
	else
	{
		output("You collapse,");
		if(!pc.isCrotchExposed()) output(" stuffing both hands in your [pc.lowerGarment] to get at your [pc.crotch] and");
		output(" squirming in the dirt. Dane chuckles, <i>“Well, aren’t you the randy little slut. Just a tiny taste of what I can offer and you’re already giving yourself up to me.”</i> He holsters his weapons to scratch at his chin with one hand while he admires your feverish undulations. <i>“I’m not sure why the boss didn’t handle an easy piece of chattel like you " + chars["RIVAL"].mf("him","her") + "self. All it takes a little show of superiority to put you in the dirt and ready to be taken.”</i> The ausar thug laughs harder, the sound deep enough to be felt in your bones.");
	}
	//Merge
	output("\n\nStrong hands tear your [pc.gear] from your body a piece at a time. Your codex is tossed over a broad shoulder and into the mud. Dane doesn’t seem to care about any of your possessions so long as they don’t get in his way. ");
	if(pc.lust() >= pc.lustMax()) output("You don’t really mind either, so long as he can take you again and again and again....");
	else output("You give a token protest but lack the ability to properly resist.");
	output(" The pale-skinned mercenary touches the clasps of his armor. It noisily clanks and clacks as the straps disengage, withdrawing into the shining body of the protective garment like snakes into burrows. It falls off him into his waiting hands, which carefully stow the armor into a pack on his back.");

	output("\n\nDane’s cock hangs large and half-erect, red and thick, pulsating visibly with the veins that web its surface. He smirks when he sees your eyes upon it and visibly stiffens, lurching to a fuller, harder state of tumescence. <i>“Now for the fun part.”</i> All four of his hands grab you at once, lifting you up and turning you to face the ground. Grimly, you think, <i>“Doggy-style, of course.”</i> His length presses between your butt-cheeks, just above your [pc.asshole], and the burly thug growls. <i>“More jobs need these kinds of perks.”</i>");

	output("\n\nThe multi-limbed warrior’s lower arms are firmly holding your [pc.hips] while his upper ones steady your shoulders. Together, they push you down on his pointed phallus, pressing the rigid, dog-like dick hard against your [pc.asshole]. Whether you were prepared for it or not, there’s too much force for you to do anything but stretch accommodatingly, accepting his hot, swollen tool into yourself. Its narrow-tipped, broadening shape does much to keep the insertion from being overly painful, but it doesn’t stop his already-swelling knot from slamming against you, too big to fit in just yet.");
	output("\n\nDane ");
	if(pc.hasHair()) output("grabs your [pc.hair], yanking your head back");
	else output("grabs the back of your neck, squeezing painfully hard");
	output(", and says, <i>“Loosen up, slut. There’s a lot more cock to go.”</i> He pushes you partway off and pulls back down, matching his words with potent, cock-burying thrusts. This time, ");
	if(pc.analCapacity() * .8 > enemy.cockVolume(0)) output("your capacitive anus allows him inside, letting the knot pop right on in.");
	else if(pc.analCapacity() * 1.2 > enemy.cockVolume(0)) output("your anus stretches enough to let him inside, tingling from how taut it has been pulled.");
	else output("your anus stretches painfully open, pulled far beyond its normal capacity to allow him entrance.");
	output(" Swollen, cum-filled nuts slap against you");
	if(pc.balls > 0) output("r own");
	output(".");
	if(pc.hasCock()) output(" Meanwhile, your prostate shoots tingles of bliss into your [pc.cocks], forcing you to drool out thick strands of pre-cum.");
	output(" The alien grunts and slaps your ass. Even taking a hand to do that, he’s still holding you vise-tight. It’s like his arms are all over your body, everywhere at once, forcing you to submit to his anus-ravaging whims.");
	if(pc.hasVagina()) output(" [pc.EachVagina] trickles lubricant at the thought. You manage to reach down to try and plug the leak with your fingers. It doesn’t work. You just get wetter.");
	//Buttchange
	pc.buttChange(enemy.cockVolume(0),true,true,false);
	output("\n\nThis time, Dane growls in satisfaction. <i>“That’s it, slut. Go ahead and take my dick.”</i> He pops his knot out and back in, sending surprisingly pleasant sensations shivering up your spine. <i>“Just relax and take it. Get used to it. We’re just getting started, and I’ve got a lot more cock to fill you with.”</i>");
	output("\n\nWait, what? You try to look back over your shoulder at him to voice your question, but his hand holds you firm.");
	output("\n\n<i>“Eyes down, bitch. You don’t get to look at me,”</i> Dane commands. As an afterthought, he adds, <i>“Never fucked somebody as spliced-up as me, have you?”</i> He doesn’t wait for an answer. <i>“If you thought four arms was the extent of my modifications, you’re sorely mistaken. The little bit of cock you’ve got inside you is just my tip.”</i> Dane thrusts, pushing his knot up into your large intestine. Incredibly, you feel inches more of his phallus pounding into you behind it, the insertion made easy thanks to the reaming he’s given you. <i>“I got myself a proper tentacle cock with an ausar twist. It can reach out nine feet, and every six inches, there’s another knot. I wonder how many I can push out into you?”</i>");
	output("\n\nYou groan in distress and arousal, shivering as you feel a second knot push up against your ring.");
	output("\n\n<i>“What’s the matter, slut? Don’t squeeze down just yet. I’ve got another foot I can slip inside you, I’m sure.”</i> Dane’s arms pump your body up and down, popping that first knot out and then thrusting two back in. You can feel a third emerging from the slit in his groin, pressing between your cheeks, hot and slick with some kind of lubricating oil. It’s making you feel so full, and yet... and yet you’re getting a little curious to see how much this chiseled, canine adonis will be able to cram into your [pc.asshole]. He’s pounding you full, taking you utterly, and there’s nothing you can do but sag in his grip and try to enjoy it. Your body certainly seems to be");
	if(pc.hasCock() || pc.hasVagina()) output(" if the dripping from your crotch is any indication");
	output(".");
	if(pc.hasCock()) output(" [pc.EachCock] is trembling, half-hard and bouncing along with the thrusts, too cowed by the pressure on your prostate to be fully hard but loving the pleasant squeezing too much to be soft.");

	output("\n\nYou moan out loud, unable to contain your pleasure. It erupts out of your lungs with the same fervent power as Dane’s savage, ass-rending thrusts. The third knot slips inside you, much more easily than the first two, and you shudder and shake within his firm grip, on the verge of anal orgasm. One of his hands shifts to ");
	if(pc.biggestTitSize() >= 2) output("cup your breast, kneading it gently as he thumbs your [pc.nipple].");
	else output("stroke your chest, thumbing at your [pc.nipple] as he pounds away.");
	output(" The ausar’s body feels like an implacable wall behind you, one you’re being battered against again and again, every stroke filling you fuller and more completely than the one before.");
	output("\n\nPop! Dane’s fourth knot slips in");
	if(pc.hasCock()) output(", sliding over your prostate exquisitely");
	output(", filling you to brimming with dick. Your gut is churning, but it’s pleasant too. His thrusts are getting longer and more intense each time, thanks to the many bulges he forces through your [pc.asshole], and you’re getting looser and more blissed out as well. Your eyes have started to roll partway back in their sockets. Even your [pc.legOrLegs]");
	if(pc.legCount == 1) output(" is");
	else output(" are");
	output(" quivering in insensate fulfillment. You whimper pleadingly.");
	output("\n\nDane barks in between gasps and growls of his own, turning your head to the side so he can meet your eye. <i>“What’s that bitch? Got a liking for my cock all’ a sudden?”</i> He slaps your ass for emphasis, still fucking you as hard and fast as ever.");
	output("\n\nYour mind says no, but your body and mouth say yes, quite loudly.");
	output("\n\n<i>“That’s what I’m talking about. Tell ya what...”</i> Dane pounds so fast and hard that you lose track of the bulges sliding in and out of your abused rectal star, <i>“whether you manage to beat my boss or not, you can come be my live-in cock-sleeve if you want. I’d be sure to introduce you to the rest of my harem.”</i> The word harem is punctuated by what feels like dozen of the bloating knobs forcing their way inside. Pleasure overwhelms you, and you start to shake, impaled on the throbbing, red length.");
	//Cunts
	if(pc.hasVagina()) 
	{
		output("\n\nYour [pc.vaginas] drench");
		if(pc.vaginaTotal() == 1) output("es");
		output(" your hand with moisture as you impulsively fill yourself as full as possible");
		if(pc.hasClit()) output(", thumb pressed hard on [pc.oneClit]");
		output(". Somehow, as wonderful as it feels, it can’t compare to the ass-filling ecstasy of Dane’s superlative length plowing your through your backdoor. You whimper all the same, overwhelmed from multiple sources.");
	}
	//Cocks
	if(pc.hasCock())
	{
		output("\n\n");
		if(pc.cumQ() <= 6) output("A tiny puddle of [pc.cum] forms below you. There just isn’t enough jizz in your [pc.balls] for you to make any more. Maybe take a break when you get a chance.");
		else if(pc.cumQ() <= 75) output("Drizzles of [pc.cum] pour out of your [pc.cocks] and into a puddle on the ground. Just when you think it’s over, a new, swelling knot slides past your prostate and milks out a fresh splatter of sexual fluid. It feels better than it has any right to.");
		else if(pc.cumQ() <= 500) output("Thick ropes of [pc.cum] spray out of your [pc.cocks], pooling together into a [pc.cumColor] puddle. Each time you’re just about done, a new one is squeezed out by the knots flowing past your prostate, sending ripples across the swelling love-lake.");
		else output("Huge splatters of [pc.cum] erupt from your [pc.cocks] in pulsating explosions, each one fueling the massive puddle that’s growing beneath you. They go on seemingly without end, but when Dane’s huge knots drag across the sensitive bulb of your prostate, the tidal waves of [pc.cum] feel even bigger and more powerful than ever before. It’s all you can do to hold onto your sanity as you’re milked from behind.");
	}
	output("\n\nDane loses his composure for once, throwing back his head and howling at your feverish clenching. The knots inside of you swell, preventing him from pulling out. At the same time, the length between the bulbous spheroids thickens, starting closer to his groin and spreading deeper within you. He erupts a moment after the swelling reaches his tip, so deep that all you feel is a gentle, warm pulsation, enough to make you feel full and contented without being overloaded, which is exactly what you need on the heels of your blissful climax.");
	output("\n\nYou sag, limp and panting, before you feel the jetwash crashing over you. Dane struggles to pull out, wrenching knot after knot free in a gut-stretching display of strength. He tosses you to the ground none-too-gently, looking down at his cum-leaking prize. <i>“Remember my offer. I could use a good knot-sleeve,”</i> he says. Your eyes drift closed, though not before you see him boarding [rival.name]’s gunship.\n\n");
	processTime(25+rand(10));
	pc.orgasm();
	pc.loadInAss(chars["DANE"]);
	clearMenu();
	addButton(0,"Next",daneFuckEpilogue);
}

//[Next]
public function daneFuckEpilogue():void {
	clearOutput();
	output("You wake all alone, naked, sore, and leaking white cum. You’re humiliated and debased - even the probe is missing, leaving behind a cold, empty crater - but the coordinates to the next planet in your father’s chain are in a data-chit lying next to you. Maybe next time you’ll have a better showing.\n\n");
	flags["LOST_TO_DANE_ON_MHENGA"] = 1;
	processTime(75+rand(10));
	CombatManager.genericLoss();
	variableRoomUpdateCheck();
	generateMapForLocation(currentLocation);
}
