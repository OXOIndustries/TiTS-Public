//Princess Ula (Codename: OWO)
//Chance of finding in any Uvetan Cave

// ULA_CAVE			- Set to the room it procs in.
// ULA_LEAVE_TIMER 	- Once you approach her, there's a countdown timer till she leaves 5ever.
// ULA_SAVED		- 1 if given belt, 2 if given coat
// ULA_STARTALK		- 1 if talked in teh OG encounter
// ULA_DEFLOWERED	- 1 if hymen torn
// ULA_SEXED 		- Counter for number of times banged
// ULA_CREDIT_TALK 	- GetGameTimeStamp of when the talk happens. Used in korgiiCredits() to know if vendors take credits.

// ULA_TOTAL_KIDS	- Total number of kids popped out
// ULA_NUM_BABIES	- Number of babies presently impregnated with. Undefined if not preggo.
// ULA_THIS_PREG_MET- Have you see the pregnancy alert yet?
// ULA_BIRTH_TIMER	- Days since her last birth. For tracking nursing scenes and the like :3
// ULA_PREG_TIMER	- Tracks incubation in days. 170 can pop in room, 185 does email pop if not around.

// WARGII_PROGRESS	- If 3, Wargii content is over, and Ula and her dad have swapped places.
/*PHYSICAL ATTRIBUTES:
4' 9" - on the edge of being a midget :3
125 lbs. Chubby thighs and a tiny bit of squish
Plush E cuparoonis. Light blue nips
Light blue cunt/butt
Light blue lips
Blue padded tips
Onyx and Savicite Earrings, Bracelets, necklace
Green eyes
Straw blonde hair
White bellyfur
Virgin

PERSONALITY/HISTORY:
A little prideful but determined - a dash of princess Leia but without the skill.
Curious about the outside world and for too long kept from it.
Very susceptible to pheromones (including her own - which are quite strong), so she has been kept in relative seclusion from her people.
Snuck out to go alien hunting... and didn’t bring clothing for the cold.
*/

public function showCaveUla(nude:Boolean = false):void
{
	if(flags["MET_ULA"] == undefined) showName("COLD\nKORGONNE");
	else showName("\nULA");
	
	showBust(ulaBustDisplay(nude));
}
public function showUla(nude:Boolean = false):void
{
	if(flags["MET_ULA"] == undefined) showName("KORGONNE\nPRINCESS");
	else showName("\nULA");
	
	showBust(ulaBustDisplay(nude));
}
public function ulaBustDisplay(nude:Boolean = false):String
{
	if(ulaPregBelly() >= 2) return "ULA_PREG";
	
	var sBust:String = "ULA";
	if(nude) sBust += "_NUDE";
	
	return sBust;
}

public function ulaCapacity():Number 
{
	return 500;
}

public function ulaChief():Boolean
{
	return (flags["WARGII_PROGRESS"] == 3);
}

public function korgiTranslate():Boolean
{
	return (flags["KORGI_TRANSLATING"] == 1);
}
public function translateKorgii():void
{
	clearOutputCodex();
	showUla();
	showName("\nTRANSLATION!");
	outputCodex("You send in the language data your Codex has stealthily assembled during your time in Korg’ii Hold. The upload takes but a moment, yet the waiting seems to take forever.");
	outputCodex("\n\n...");
	outputCodex("\n\n...");
	outputCodex("\n\n...");
	outputCodex("\n\n...");
	outputCodex("\n\n.......");
	outputCodex("\n\n...");
	outputCodex("<i>Translation subroutine for ‘korgonne’ species updated!</i>\n\nThat ought to do it. From now on, you should have an easier time understanding Uveto’s fluffy dog-people.");
	flags["KORGI_TRANSLATING"] = 1;
	clearGhostMenu();
	addGhostButton(4, "Back", showCodex);
	userInterface.outputCodex();
}
public function translationToggle():void
{
	clearOutputCodex();
	showUla();
	showName("\nTRANSLATION!");
	if(flags["KORGI_TRANSLATING"] == 1)
	{
		outputCodex("You’ve got to admit, you liked the way the translator made the korgonne sound <i>before</i> you updated it. A quick software rollback should have them back to sounding like adorable savages once more. Annnnd... <b>done</b>.");
		flags["KORGI_TRANSLATING"] = -1;
	}
	else
	{
		outputCodex("With a heavy sigh, you pull the latest software update for your translator back off the extranet. Now <b>you’ll hear the korgonne sounding like normal people once more.</b>");
		flags["KORGI_TRANSLATING"] = 1;
	}
	clearGhostMenu();
	addGhostButton(4, "Back", showCodex);
	userInterface.outputCodex();
}
public function korgiTranslateProgress():Number
{
	var qualifyingEvents:Number = 0;
	//Tuuva
	if(flags["TUUVA_SELF_TALK"] != undefined) qualifyingEvents++;
	if(flags["TUUVA_SMITHING_TALK"] != undefined) qualifyingEvents++;
	if(flags["TUUVA_SCAVENGING_TALK"] != undefined) qualifyingEvents++;
	if(flags["TUUVA_DICK_TALK"] != undefined) qualifyingEvents++;
	if(tuuva.hasCock(GLOBAL.TYPE_EQUINE)) qualifyingEvents++;
	if(flags["TUUVA_SAVED"] == 2) qualifyingEvents++;
	if(flags["TUUVA_COOKIES"] != undefined) qualifyingEvents++;
	//Heidrun
	if(flags["MET_HEIDRUN"] != undefined) qualifyingEvents++;
	if(flags["SEXED_HEIDRUN"] != undefined) qualifyingEvents++;
	//Maja
	if(flags["MAJA_RENT"] != undefined) qualifyingEvents++;
	if(flags["MAJA_TRUST_TALK"] != undefined) qualifyingEvents++;
	if(flags["MAJA_TAMING_TALK"] != undefined) qualifyingEvents++;
	if(flags["MAJA_SPACE_TALK"] != undefined) qualifyingEvents++;
	//Nenne
	if(flags["NENNE_FAMILY"] != undefined) qualifyingEvents++;
	if(flags["NENNE_BELLY_RUBS"] != undefined) qualifyingEvents++;
	if(flags["NENNE_SHOP_TALK"] != undefined) qualifyingEvents++;
	if(flags["NENNE_UVETO_TALK"] != undefined) qualifyingEvents++;
	if(flags["NENNE_COOKIES"] != undefined) qualifyingEvents++;
	if(flags["SEXED_NENNE"] != undefined) qualifyingEvents++;
	//Ula
	if(flags["ULA_SAVED"] != undefined) qualifyingEvents++;
	if(flags["ULA_STARTALK"] != undefined) qualifyingEvents++;
	if(flags["ULA_SEXED"] != undefined) qualifyingEvents++;
	if(flags["ULA_CREDIT_TALK"] != undefined) qualifyingEvents++;
	if(flags["ULA_SAVICITE_TALK"] != undefined) qualifyingEvents++;
	if(flags["ULA_ELECTRICITY_TALK"] != undefined) qualifyingEvents++;
	if(flags["ULA_GUN_TALK"] != undefined) qualifyingEvents++;
	if(flags["ULA_OTHER_TRIBES"] != undefined) qualifyingEvents++;
	if(flags["ULAS_ROLE"] != undefined) qualifyingEvents++;
	if(flags["ULA_MINING_TALKED"] != undefined) qualifyingEvents++;
	// Lund
	if(flags["LUND_FUCKED_OFF"] != undefined) qualifyingEvents++;
	if(flags["LUND_GO_AWAY"] != undefined) qualifyingEvents++;
	if(flags["LUND_LEFT_FOOLISH"] != undefined) qualifyingEvents++;
	if(flags["LUND_LAST_SEX"] != undefined) qualifyingEvents++;
	if(flags["WARGII_PROGRESS"] == 3) qualifyingEvents += 3;
	//Kiona
	if(flags["KIONA_TALK"] != undefined) qualifyingEvents++;
	if(flags["KIONA_TALK_KIONA"] != undefined) qualifyingEvents++;
	if(flags["KIONA_TALK_YOU"] != undefined) qualifyingEvents++;
	if(flags["KIONA_TALK_HUNTING"] != undefined) qualifyingEvents++;
	if(flags["KIONA_TALK_SHOP"] != undefined) qualifyingEvents++;
	if(kionaLuciniteQuestStage() > 0) qualifyingEvents += kionaLuciniteQuestStage();

	qualifyingEvents *= 4;
	if(qualifyingEvents >= 100) qualifyingEvents = 100;
	if(qualifyingEvents < 0) qualifyingEvents = 0;
	return qualifyingEvents;
}

public function korgChiefBustString():String
{
	if(silly) return "KORG_CHIEF_SILLY";
	else return "KORG_CHIEF";
}

public function ulaRoomUpdater():void
{
	if(ulaChief()) 
	{
		if(rooms["KORGII T14"].roomName == "ULA’S\nCHAMBERS") rooms["KORGII T14"].roomName = "ELDER’S\nCHAMBERS";
		if(rooms["KORGII T10"].hasFlag(GLOBAL.NPC)) rooms["KORGII T10"].removeFlag(GLOBAL.NPC);
		if(!rooms["KORGII R10"].hasFlag(GLOBAL.NPC)) rooms["KORGII R10"].addFlag(GLOBAL.NPC);
	}
	else 
	{
		if(rooms["KORGII T14"].roomName == "ELDER’S\nCHAMBERS") rooms["KORGII T14"].roomName = "ULA’S\nCHAMBERS";
		if(!rooms["KORGII T10"].hasFlag(GLOBAL.NPC)) rooms["KORGII T10"].addFlag(GLOBAL.NPC);
		if(rooms["KORGII R10"].hasFlag(GLOBAL.NPC)) rooms["KORGII R10"].removeFlag(GLOBAL.NPC);
	}
}

public function ulaRoomBonusFunc():Boolean
{	
	//New variable room descs for Ula's room. Changing room names handled by the variableRoomUpdate check.
	if(currentLocation == "KORGII T14")
	{
		if(ulaChief()) 
		{
			output("While this room may have once been vastly different from others in the hold, that uniqueness has been smothered in tradition since Ula’s ascension to Chieftess and the resulting relocation of her father. Tribal art decorates the walls. Squared off, angular corners are hidden by woven blankets and intricate sculptures. Furniture not that dissimilar from your own has been replaced with baskets, stoneware, and crude metal bins. The only feature to survive the transition unharmed is the majestic, transparent aluminum window on the southern wall, looking out of across the deadly-beautiful snows of Uvetan countryside.");
			output("\n\nUla’s father, the former Chieftain of Korg’ii Hold, sits heavily upon the edge of his bed. He doesn’t seem to be aware of you just yet, too focused on the ancient tome in his paw.");
			addButton(0,"Ula’s Father",approachUlasDad);
			return false;
		}
		else output("Straight away, you can tell this room is vastly different from the others in Korg’ii Hold. It seems to exist in an entirely different time period. The walls are cut perfectly square with the kind of sharp, mechanically precise geometry you’d expect to find in a UGC warship. Angular grooves split and rejoin each other in an artist’s impression of futuristic adornment. One wall even has a transparent aluminum window, looking out over the deadly-beautiful Uvetan countryside.");
	}

	if(flags["WARGII_SETUP"] == 1 && flags["WARGII_PROGRESS"] == undefined && ulaPregBelly() == 0)
	{
		startWargiiQuestOnEnterUlaRoom();
		return true;
	}
	if(flags["WARGII_FIGHTS_RAN"] == undefined && flags["WARGII_NORAN_REWARD"] == undefined && ulaChief()) 
	{
		neverRanBonusUlaGift();
		return true;
	}
	// Proc this scene as soon as the Warg’ii event is over for one week and the PC goes to Ula, but only if the PC suggested she be “Middle” with her punishment
	if(flags["ULA_HELP_MILO_NOT_NOW"] == undefined && !pc.hasKeyItem("Token of Ula's Favor") && flags["WARGII_MILO_SOLUTION"] == 2 && (flags["WARGII_OVER_TIMESTAMP"] == undefined || GetGameTimestamp() - flags["WARGII_OVER_TIMESTAMP"] > 7*24*60))
	{
		ulaEitanBonus();
		return true;
	}
	//20% chance and Ula has kids older than 7 days
	if(rand(5) == 0 && (flags["ULA_BIRTH_TIMER"] > 7 || flags["ULA_TOTAL_KIDS"] > 4))
	{
		var blurbs:Array = new Array();
		blurbs.push("Two tiny korgonne run screaming out of the room as you open the door. One is chasing the other with a gun-shaped piece of rock and making a crude approximation of gun sounds.");
		blurbs.push("A shy-looking korgonne scampers between your legs on the way out the door. Was that one of yours?");
		blurbs.push("A toddler-sized korgonne wobbles out the door wearing a basket on its head like an oversized helmet.");
		blurbs.push("Bits of soft stone with crudely carved milodans are piled up in the corner, the clear result of your children’s attempts at art.");
		output("\n\n" + blurbs[rand(blurbs.length)]);
	}
	
	if(flags["MET_ULA"] == undefined)
	{
		ulaFirstTimeRemeet();
		return true;
	}
	//IMMEDIATELY proc birth
	else if(flags["ULA_PREG_TIMER"] >= 170)
	{
		ulaBirthHook();
		return true;
	}
	else if(pc.hasStatusEffect("Afraid of Ula Pussy"))
	{
		if(ulaChief()) move(rooms[currentLocation].southExit);
		else move(rooms[currentLocation].northExit);
		output("\n\n<b>You’d best wait a bit for the pheromones to thin.</b>");
	}
	//Ula breast-feeding blurb
	else if(flags["ULA_BIRTH_TIMER"] <= 7)
	{
		output("\n\nUla is sitting on her bed with " + (flags["ULA_BABIES_NURSING"] > 2 ? "two of " : "") + "her pups in her arms, busily suckling at her nipples. She smiles radiantly in your direction.");
		addButton(0,"Ula",ulaApproach);
	}
	//Reveal and post-reveal preggo stuff
	else if(ulaPregBelly() >= 1)
	{
		if(ulaPregBelly() == 1) output("\n\nUla is sitting on her " + (ulaChief() ? "modest throne":"bed") + " as usual, though with one hand on her belly. She wears a strangely distant smile.");
		else if(ulaPregBelly() >= 2)
		{
			if(rand(5) == 0) output("\n\nUla is here and looking quite pregnant by the shape of her swollen midriff. She contents herself with a slow back-and-forth stroke of the gravid dome, seemingly beyond pleased to be a mother.");
			else if(rand(4) == 0) output("\n\nA very pregnant-looking Ula is lounging in her bed, eating strips of dried fish off a tray precariously balanced on her gravid middle.");
			else if(rand(3) == 0) output("\n\nUla is sprawled out on " + (ulaChief() ? "some furs, too large for to comfortably fit her throne":"her bed") + ", idly reaching around a very swollen midsection to prod at her puffy, wet sex. Pregnancy hormones have apparently swollen her mound and her appetites right alongside her belly.");
			else if(rand(2) == 0) output("\n\nUla is propped up against the wall, reading an old-style codex computer that she keeps balanced on her big, pregnant belly.");
			else output("\n\nUla’s dosing in " + (ulaChief() ? "":"her bed") + ", surrounded by wadded up sheets and a few glistening dildos. The same hormones that helped give her such a big, pregnant belly must be playing hell with her libido.");
			if(ulaChief()) output(RandomInCollection([" The elders, you note, are nowhere to be seen, giving Ula a wide berth unless summoned."," The chamber is otherwise deserted, the tribe’s elders giving her space during her pregnancy."," There isn’t a single advisor to be seen, though you’re sure the Chieftess of the hold could summon them with a single word to one of the guards outside."," You note that the Chieftess has been given plenty of space by her advisors since becoming pregnant."," None of her advisors are anywhere to be seen."]));
		}
		addButton(0, "Ula", ulaPregApproach);
	}
	else 
	{
		if(!ulaChief())
		{
			if(rand(8) == 0) output("\n\nUla is lounging on her bed, flipping through an ancient-looking tome full of foreign script. She glances coyly at you from behind the yellowed pages.");
			else if(rand(7) == 0) output("\n\nUla sits on the edge of her bed. In her hands, she clutches a piece of bone and works at it with a small knife. The partially-completed carving bears a passing resemblance to you.");
			//Rare	
			else if(rand(6) == 0) 
			{
				output("\n\nUla stuffs a ");
				if(flags["ULA_SAVED"] == 2) output("familiar-looking");
				else output("robust");
				output(" korgonne coat beneath her bed as you enter the room. She sags with relief after recognizing you. <i>“Whew!”</i>");
			}
			else if(rand(5) == 0) output("\n\nUla sprawls across her bed, feet idly bouncing. When she hears you enter, she props herself up on her arms and smiles, happy to have your company.");
			else if(rand(4) == 0) output("\n\nUla slurps a savory-smelling soup from a stone bowl. When she notices you, she sheepishly sets the snack aside and flashes a pretty smile.");
			else if(rand(3) == 0) output("\n\nUla is kneeling next to her bed, the surface of which is covered with at least 20 pieces of parchment. Cramped, alien script covers every inch of them. They look like ledgers of some kind. She hastily gathers them into a bundle at the sight of you, clearing space on the bed for whatever you might have in mind.");
			else if(rand(2) == 0) output("\n\nUla looms over a dozen different model ships, carefully arranged into a mock battle. Some appear to be pillaged toys from the core, while others are carefully carved from the raw materials available to the korgonne: mostly bone and stone.");
			else output("\n\nUla sits on her beg cross-legged, reading from an ancient-looking Codex. The letters are english, not korgish. She jumps at the sound of you and hastily slips it into a basket. From what you saw, the text looked pretty steamy...");
		}
		else
		{
			if(rand(7) == 0) output("\n\nUla is lounging in her throne, flipping through an ancient-looking tome full of foreign script. She glances coyly at you from behind the yellowed pages.");
			else if(rand(6) == 0) output("\n\nUla slouches on her throne, listening with a bored expression to the irritated grumbling of a shaggy-furred korgonne elder. At the sight of your entrance, her ears perk right up, and a slight smile spreads across her features.");
			else if(rand(5) == 0) output("\n\nUla slurps a savory-smelling soup from a stone bowl while balancing a written report in her other hand. To one side, a young messenger looks to her deferentially.");
			else if(rand(4) == 0) output("\n\nRather than sitting upon the throne, Ula has positioned herself at a nearby desk with a primitive pen in paw. Scribbled parchment crowds the wide stone desk. One of her ears pivots at your entrance, but she resolutely attends to her tribe’s work.");
			else if(rand(3) == 0) output("\n\nUla rests upon a haphazard mound of cushions and furs, lost in thought.");
			else if(rand(2) == 0) output("\n\nUla slouches upon her father’s former throne, reading from an ancient-looking codex. The lettering is in english, not korgish. At the sound of your entrance, she briefly peers up over it with a happy twinkle in her eye.");
			else output("\n\nUla paces back and forth while a grizzled korgonne elder finishes relaying some facet of information to her. Once he finishes, she nods and dismisses him with a jewelry-jingling wave and a heavy sigh.");
		}
		addButton(0,"Ula",ulaApproach);
	}
	return false;
}
public function ulaFirstTimeRemeet():void
{
	showUla(true);
	output("\n\n");
	showImage("UlaDildo");
	output("The familiar form of the korgonne you saved is sprawled out on a cushy-looking bed, naked save for oodles of jangling jewelry and a fat, glossy dildo rammed between her legs. Lips parted mid-moan, she squeaks at your sudden intrusion and rolls ass-over-head over the bed to fall heavily on the floor. <i>“You!”</i> Her tail wiggles happily in the air as she climbs back up onto her mattress.");
	output("\n\nYou note the dildo is still firmly clutched in her paw, dripping wet.");
	output("\n\n<i>“You come visit!”</i> Springing off her mattress, the excited ball of fluff and fuck tumbles");
	if(pc.tallness < 70) output(" into you, tackling");
	else output(", smacking into you. You hold her there for a moment before letting her weight carry");
	output(" you to the ground. Kisses pepper your nose. <i>“Savinged me!”</i> A slick, wet tongue smears across your cheek. <i>“You liking me!”</i>");

	//Fucked
	if(flags["ULA_SEXED"] != undefined)
	{
		output("\n\nKissing her back, you laugh. <i>“Of course I like you.”</i> You hug her, pressing your lips to her cupped ear for a whisper, <i>“It’s why I fucked you.”</i>");
		output("\n\nThe giggling girl gasps audibly. <i>“Again?”</i> Her voice is plaintive, whining. You can smell the arousal clinging to her fur, a rich aroma laced with hints of minty desire. The dildo she wiggles in front of you doesn’t help, soaked as it is in her pheromonal secretions.");
	}
	//Didnt fuck
	else
	{
		output("\n\nLooking at her eager eyes, it seems impossible to disagree. <i>“Of course.”</i>");
		output("\n\n<i>“Then ");
		if(pc.hasCock()) output("breed");
		else output("heat");
		output("-share?”</i> She bats her eyelashes playfully, and you’re abruptly reminded that she was masturbating when you walked in. Her scent is thick in the air, rich and feminine with a hint of minty desire. The dildo clutched in her paw is soaked in it, filling the air with her pheromonal secretions.");
	}
	//Merge
	output("\n\nA little dizzily, you mull over your options. There doesn’t seem to be enough blood for your brain and everything else that’s waking up. You could say no, you guess. If you really wanted to.");

	//CHOICES
	processTime(5);
	pc.changeLust(33);
	clearMenu();
	if(pc.hasCock()) addButton(0,"Breed Her",breedWithUla);
	else addDisabledButton(0,"Breed Her","Breed Her","You need a penis for this.");
	if(pc.hasVagina()) addButton(1,"Lez Out",ulaPussyFuck,undefined,"Lez Out","You both have pussies. Use ‘em!");
	else addDisabledButton(1,"Lez Out","Lez Out","You’ll need a vagina for this!");
	addButton(2,"Watch",watchUlaFapturbate);
}

public function watchUlaFapturbate():void
{
	clearOutput();
	showUla(true);
	//Watch
	output("<i>“Why don’t I watch?”</i> you offer, pushing the eager korgonne back.");
	output("\n\nA neon-blue lip quivers in a plaintive pout. <i>“");
	if(!korgiTranslate()) output("Naked too?");
	else output("How about some motivation?");
	output("”</i>");
	output("\n\n<i>“");
	if(pc.isBimbo()) output("Oooh, sure!");
	else if(pc.isBro()) output("I ‘spose.");
	else if(pc.isNice()) output("I think I can manage that.");
	else if(pc.isMischievous()) output("I could. Hope you’re ready to jill off in record time.");
	else output("I guess.");
	output("”</i> ");
	if(!pc.isChestExposed() && !pc.isCrotchExposed()) output("You strip naked. ");
	if(!pc.isChestExposed()) output("You tug your [pc.chestCovers] over your head. ");
	else if(!pc.isCrotchExposed()) output("You tug your [pc.crotchCovers] down and out of the way. ");
	else output("You run your hands across your exposed body. ");
	output("Bits and pieces of equipment fall to the floor. You won’t be needing any of it here.");

	output("\n\nAcross the room, ");
	if(flags["MET_ULA"] == undefined) output("the korgonne princess");
	else output("Ula");
	output(" bounces back onto her bed, legs splaying outlandishly to reveal the sodden gash of her puffy, cyan cunt. She smiles shyly at you, then places one paw over her netherlips, rubbing herself off with slow, sensuous presses of her padded palm. Her other hand slides the dildo against her inner thigh. Residual pussy-juice mats her fur down and thickens the scent of feminine need in the air.");

	output("\n\nNose twitching, you watch in rapt attention. The plush-bodied slut is right there, jilling herself off to your naked body, and its all you can do not to jump on top of her and take her right then and there. Instead, you settle for letting your hands roam across your body, your fingertips teasing across your [pc.chest] to find your [pc.nipples]");
	if(pc.hasFuckableNipples()) output(", thumbs slipping inside");
	else if(pc.hasDickNipples()) output(", thumbs coaxing out the [pc.dickNipples] until they jut forward, massively lewd and erect");
	output(". You swivel your hips sensuously");
	if(pc.hasGenitals()) output(", blood rushing to your crotch");
	output(".");
	if(pc.hasCock())
	{
		output(" Your [pc.cocks] ");
		if(pc.cockTotal() > 1) output("thrust achingly forward, as if they");
		else output("thrusts achingly forward, as if it");
		output(" could slip inside the busty dog-girl if only you got a little more erect.");
	}
	if(pc.hasVagina())
	{
		if(pc.wettestVaginalWetness() < 2) output(" Moisture graces your thighs.");
		else if(pc.wettestVaginalWetness() < 3) output(" Moisture soaks your thighs.");
		else if(pc.wettestVaginalWetness() < 4) output(" Wetness trickles down your thighs.");
		else if(pc.wettestVaginalWetness() < 5) output(" Wetness spills down your thighs.");
		else output(" Wetness soaks your thighs.");
		output(" Breathing in the scent of her puss has you basting in reciprocal sapphic desire.");
	}
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Naughty alien. Eyes no lie.");
	else output("Naughty alien. Your eyes don’t lie.");
	output("”</i> Smearing her slippery palm up her cushy-looking middle, the playful puppy exposes herself to you just long enough to press the dildo to her entrance. The arousal-plumped folds part with ease as she feeds it in, mouth widening in mounting pleasure. Her hand reaches for her breasts in that moment and grabs hold of one, fingers sinking deep. A fuzzy thumb stretches for a nipple, and upon finding it, circles it with quick, jerky strokes. The dildo bottoms out at the same time, prompting the lust-drunk korgonne to commence fucking herself with it, pumping it in and out with such forceful strokes that you can hear her cunt squelching from the self-administered pussy-pounding.");
	output("\n\nYou join ");
	if(flags["MET_ULA"] == undefined) output("her");
	else output("Ula");
	output(", not in lovemaking but in masturbation. Between the sight of that glossy dildo rocking her world and the earnest ardor in her eyes, staring back at you, the moment feels almost as tender as proper intercourse. Yes, your fingers supply the stimulation, but it’s her plaintive moans and absolute wantonness on display that has your motor so revved up. And on top of it all, the air is filled with the cloying, needful scent of her juicing cunt, triggering ");
	if(!pc.isTreated() && !pc.isBimbo()) output("long-dormant");
	else output("gene-augmented");
	output(" receptors in your nose that make it hard to think of anything but orgasming with the mint-flavored trollop again and again");
	if(pc.hasCock()) output(", spilling load after load until you pass out from pleasure or exhaustion.");
	else if(pc.hasVagina()) output(", cumming again and again until your overheated folds climax you into unconsciousness.");
	else output(".");

	output("\n\nThe korgonne shivers, full-body, sending her proportionally enormous tits bouncing and jiggling against one another. Her eyes roll back, and the dildo’s thrusts become distinctly wetter. Flecks of pussy-juice slobber over her thighs. The " + (ulaChief() ? "furs":"sheets") + " are a soaked mess. Arching her back, the short, stacked puppy-girl keens high in the back of her throat, fingers scrabbling against a tit, and she cums. She cums so hard that her legs flail, toes reflexively clenching and unclenching.");

	output("\n\nA few droplets of her freely-spilled fluids");
	if(pc.hasCock())
	{
		output(" spatter your aching dick");
		if(pc.cockTotal() > 1) output("s");
	}
	else if(pc.hasVagina()) output(" spatter your well-lubed folds");
	else output(" spatter your [pc.chest]");
	output(", and you cum with her");
	if(pc.hasCock() || pc.isSquirter()) output(", heedless of the mess you’re making");
	output(". It’s better than it ought to be, more compelling, anyhow. Your orgasm drags on for seemingly ever, long undulations of ecstasy that ebb and flow like gentle ocean waves. When your body can take no more, it stops as suddenly as started, and you collapse to the floor like a marionette with its strings cut, one hand idly toying with a ");
	if(!pc.hasDickNipples()) output("[pc.nipple]");
	else output("[pc.nippleCock]");
	output(".");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Mmm... very funs,");
	else output("Mmm... was delightful,");
	output("”</i> ");
	if(flags["MET_ULA"] == undefined) output("the princess");
	else output("Ula");
	output(" giggles" + (!ulaChief() ? " from her bed":"") + ", licking her fingers. <i>“");
	if(!korgiTranslate()) output("More honest being, next time.");
	else output("Be more honest next time.");
	output("”</i> She sucks the dildo so hard you worry she’s going to swallow it, then pops the cleaned toy into a primitive bin. <i>“");
	if(!korgiTranslate()) output("Know you wanting heat-sharing");
	else output("I know you want more");
	output(".”</i> She gently pries open the lips of her satiated snatch. <i>“");
	if(!korgiTranslate()) output("Want you here.");
	else output("Right here.");
	output("”</i> A trickle of clear girl-cum spills onto her slick, ruined sheets. <i>“");
	if(!korgiTranslate()) output("Want alien touch.");
	else output("You can touch it. Any time you want.");
	output("”</i>");
	output("\n\nTruth be told, you want that too, but this close after an orgasm, the effects of her pheromones are dulled enough for you to act with some degree of normalcy. <i>“Yeah...”</i>");
	output("\n\nSmiling gleefully, the dog-girl springs up out of bed and bops a rusty-looking sanitation bot in the corner. It powers up with a clack and a whir, then sets to vaporizing the contaminants from her fur. The " + (ulaChief() ? "furs":"sheets"));
	if(pc.hasCock() || pc.isSquirter()) output(" and floor");
	output(" come next.");
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",ulaMutualMastEpi);
}
public function ulaMutualMastEpi():void
{
	//First time epilogue
	if(flags["MET_ULA"] == undefined)
	{
		clearOutput();
		showUla(true);
		output("<i>“What is alien call-word?”</i> the korgonne princess looks almost prim and proper with her dildo hidden away and her legs crossed, concealing the blue-tinged treasure between from view.");
		output("\n\nYou pull your mind out of her crotch and back to the matter at hand. <i>“My what?”</i>");
		output("\n\n<i>“Call-word.”</i> She points at her chest. <i>“Ula.”</i> Then she points at you and tilts her head.");
		output("\n\nOhhh! <i>“[pc.name],”</i> you answer, <i>“of the, uh... Steele clan.");
		if(pc.isNice()) output(" Nice to meet you, Ula.");
		output("”</i>");

		output("\n\n<i>“[pc.name],”</i> the curvy korgonne mouths, handling each phoneme like an exotic treasure. <i>“[pc.name].”</i> It comes easier the second time. She beams");
		if(pc.tallness < 66) output(" up");
		output(" at you. <i>“Nice call-word. Is proper, us knowing other.”</i> She hugs you tight. <i>“First save, now know. Visiting again soon?”</i>");

		output("\n\nYou doubt she’ll step aside until you agree... <i>“");
		if(pc.isNice()) output("Of course!");
		else if(pc.isMischievous()) output("As if I could stay away!");
		else output("Sure.");
		output("”</i>");
		output("\n\n<i>“Happiness!”</i> Ula kisses you on the nose. <i>“Return and tell star-stories.");
		if(pc.hasCock()) output(" Maybe breed? Lots of breed. Make Ula big-tummy mommy.");
		else if(pc.hasVagina()) output(" Maybe share heat-water?");
		output("”</i>");
		flags["MET_ULA"] = 1;
	}
	else mainGameMenu();
}

//Breed	
public function breedWithUla():void
{
	clearOutput();
	showUla(true);
	var x:int = pc.cockThatFits(ulaCapacity());
	if(x < 0) x = pc.biggestCockIndex();
	output("<i>“God yes,”</i> you pant, stumbling forward into her bed" + (ulaChief() ? " of furs":"") + ".");
	if(!pc.isCrotchExposed()) output(" Your [pc.crotchCovers] can’t come off fast enough. How fortunate that a second set of hands are there, easing you into nudity.");
	output(" Blood thrums in your ears, your heart hammering, sending volley after volley of cock-expanding blood into your loins, pumping your [pc.cocks " + x + "] into full, proud tumescence. ");
	if(flags["MET_ULA"] == undefined) output("The korgonne princess’s");
	else output("Ula’s");
	output(" belly fur tickles your [pc.cockHead " + x + "].");

	output("\n\nWide-eyes set in cute, canine face stare up at you. <i>“");
	if(korgiTranslate()) output("Good. I want you. I can’t stop thinking about you...");
	else output("Good. Want you. Thinkings of you.");
	output("”</i> She holds up the sloppy dildo almost guiltily. <i>“");
	if(korgiTranslate()) output("This is your fault.");
	else output("Alien-thoughts make.");
	output("”</i> It is absolutely drenched. A cloud of pussy-scent radiates from it, tinging every breath with potent whiffs of fuckable, pheromonal cunt. <i>“");
	if(!korgiTranslate()) output("Strong heat-scent.");
	else output("I smell like I’m in heat.");
	output("”</i> She sniffs at it, nipples firming up. One of her thighs quivers against your [pc.leg]. <i>“Always wanting, ");
	if(!korgiTranslate()) output("since met you.");
	else output("always desiring. You’ve been my fantasy ever since we met.");
	output("”</i> ");
	if(flags["MET_ULA"] == undefined) output("The korgonne");
	else output("Ula");
	output(" waves her dildo back and forth in front of your nose, watching your nostrils twitch, then tosses it aside. <i>“");
	if(!korgiTranslate()) output("Dildo no good.");
	else output("And the dildo doesn’t measure up.");
	output("”</i> She scooches closer. <i>“");
	if(!korgiTranslate()) output("You good.");
	else output("You do.");
	output("”</i>");

	//Dick too big for proper fuck
	if(pc.cockVolume(x) > ulaCapacity())
	{
		output("\n\nEvery ounce of your body is screaming at you to throw ");
		if(flags["MET_ULA"] == undefined) output("her");
		else output("Ula");
		output(" on her back and thrust yourself in to the hilt. Your instincts don’t care that you’ll split her in half. They just want to feel her tight channel stretching around your girth. You mash your mouth to hers, kissing her feverishly. Her plump, blue lips are soft but press back just as hard. She wants it, and she wants it bad. It feels like torture, not being inside her yet, but you manage to pull back and gesture at the elephant-cock in the room. <i>“It won’t fit.”</i>");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Fit. Magic fuck-butter");
		else output("It’ll fit. I have some magic lube!");
		output("”</i> the horny bitch promises, stretching out to retrieve a bottle of something from a primitive bin. It’s <i>“Peggy’s Elasticizing Oil,”</i> a well-known lubricant-slash-elasticizer favored by mismatched couples in the core. She wastes no time in unscrewing the cap and stuffing the top into her needy quim, squeezing huge dollops of slimy, pussy-loosening lube into her deepest recesses. <i>“");
		if(!korgiTranslate()) output("Make stretchy girl!");
		else output("I’ll be your stretchy girl!");
		output("”</i> The empty bottle is tossed away, and her slickened paws grab hold of your dick. <i>“");
		if(!korgiTranslate()) output("Breed now. You like. Can’t help seeding!");
		else output("Breed me now! You’ll love it so much you won’t be able to stop yourself from knocking me up!");
		output("”</i>");
	}
	//Dick fits
	else
	{
		output("\n\nEvery ounce of your body is screaming at you to throw ");
		if(flags["MET_ULA"] == undefined) output("her");
		else output("Ula");
		output(" onto her back and take her. Gentleness and care aren’t in the equation, just bestial rutting. You wrinkle your nose, trying to control yourself, to keep yourself from breaking this korgonne " + (ulaChief() ? "chieftess":"princess") + "’s twat in half with the force of your thrusts. It mostly works, right up until you mash your mouth to hers, kissing her feverishly. Her plump, blue lips are soft but press back just as hard. She wants it every bit as badly as you. It feels like torture, not being inside her yet, so you break the kiss to ask, <i>“Ready?”</i>");
		output("\n\nBiting her lip, the horny bitch nods vigorously, tail wagging behind her. <i>“");
		if(!korgiTranslate()) output("Put in. Fuck hard. Give pups!");
		else output("Put it in, and fuck me hard! Give me your pups!");
		output("”</i>");
	}
	//Merge
	output("\n\nYou aren’t going to get a better invitation than that. Grabbing her by the hips, your fingers sinking deep, you tug her crotch closer. She flops back onto her elbows with her mouth hanging open in delight, long blue tongue lolling. Your [pc.cockHead " + x + "] is right there, all but kissing her cunt. A trickle of clear, alien girl-cum dribbles out like a crystalline welcome mat. You thrust ");
	if(pc.cockVolume(x) > ulaCapacity()) output("against her lips. Their unsubtle tightness strains against you, then gives an inch at a time, slowly widening, yielding with unnatural flexibility to accept everything that you have to offer. Her pubic mound visibly lifts, distorting in the shape of your [pc.cockHead " + x + "] as you slide inside. It gives the impression that the korgonne is more stretchy sex-doll than consenting sapient.");
	else output("into her lips, and try not to swoon. The luscious alien folds quiver at your touch, begging you to drive deeper. You do. Pushing onward, you bury yourself to the [pc.knot " + x + "], delighting in the muscular ripples and contractions that beg you to bust a nut here and now.");
	pc.cockChange();

	output("\n\nA sharp exhalation of alarm shifts into a sigh of delight");
	if(flags["ULA_DEFLOWERED"] == undefined)
	{
		output(" as the korgonne’s hymen breaks, <b>robbing her of her virginity</b>");
		flags["ULA_DEFLOWERED"] = 1;
	}
	else output(" as her passage is spread into the shape of your [pc.cock " + x + "] once more");
	output(". <i>“More!”</i> She loops her arms around your ");
	if(pc.tallness < 60) output("neck");
	else output("back");
	output(". <i>“");
	if(!korgiTranslate()) 
	{
		if(ulaPregBelly() < 1) output("Give warm! Pups-filling-warm!");
		else output("Give more warm! Make Ula have even more pups!");
	}
	else 
	{
		if(ulaPregBelly() < 1) output("Give me your cum! Fill me with your heat! Stuff me full of pups!");
		else output("Give me all your cum! Fuck me even more pregnant!");
	}
	output("”</i>");

	output("\n\nYou grind your crotch against the " + (ulaChief() ? "chieftess":"princess") + "’s soaking-wet loins and bear her down to the bed, smashing her clit down between your bodies until her impassioned requests transform into confused, ecstatic whimpers. You kiss her again, more forcefully, unable to help yourself. Your tongue thrusts into her lips");
	if(pc.cockVolume(x) > ulaCapacity() && ulaPregBelly() < 1) output(" as you feed more inches into her snatch, distending her belly further. She’s like a big fuzzy condom, just waiting to be stretched over your dick");
	output(". She tries to kiss you back, but it’s weak and unfocused. Her jaw is slack, the tongue flopping around confusedly as the pressure on her clit overwhelms her nervous system. You guide it with your own, tasting every inch of her drooling maw in the process. From both ends, you spread her open and <i>thrust</i>.");

	output("\n\nPlush softness fills your fingers as your hand settles on a tit, and you squeeze it hard, fingers digging deep into the soft, furred mound. ");
	if(ulaPregBelly() >= 2 || flags["ULA_TOTAL_KIDS"] != undefined) output("Milk squirts over your fingers. ");
	output("The tip of the dog-girl’s nipple feels as hard as diamond against your [pc.skinNoun]. You briefly consider sucking it, then resume frenching her, availing yourself of her kissable blue lips, letting your hands and loins enjoy her from the neck down.");

	output("\n\nA spasm drags your [pc.hips] back, and primitive instincts command you to thrust in, burying your boner with a girlcum-splattering squelch. Her pussy is everywhere: in every breath, soaking your [pc.legs], staining the " + (ulaChief() ? "furs":"sheets") + ", so large in your mind that if you close your eyes you can see its rubbery folds, inviting you to fuck them raw. Now that you’ve started, you can’t stop. Your [pc.hips] bounce back, then slide back in, addicted to the electric sparks shooting up your spine, shocking you with bolts of bliss that seem to make the smell of cunt that much stronger.");

	output("\n\nPadded paws scrabble over your back as the petite dog-woman cums. You can feel it in the fluttering motions of her cunt and the quivering of her thighs more than anything else. The warm dribbles sliding down your [pc.thighs] are a giveaway as well. You break the kiss to watch, fucking her with long, even strokes");
	if(pc.cockVolume(x) > ulaCapacity() && ulaPregBelly() < 1) output(", dick obscenely visible every through layers of skin and fur");
	output(", watching her eyelashes flutter and her jaw work open and closed, only stopping when she bites down on a lip hard enough to draw a trickle of blood.");

	output("\n\n<i>Slap-slap-slap</i>. The clap of your hips banging away at her rings through the room, gradually rising in tempo to your ever-growing ardor. The korg-girl shivers and sighs, rag-dolling from the pounding and orgasmic aftershocks alike. That hardly seems to matter. The fucked-stupid glaze in her eyes may as well be an advertisement to your [pc.balls] to brew up an extra-virile load for how you feel. Burying your nose into her neck, you hump her powerfully, bestially, the way you know she wants to be taken.");

	output("\n\nWhen you cry out in ecstasy, the clan " + (ulaChief() ? "chieftess":"princess") + "’s voice joins you. Her pussy clamps down in answer to your climactic throbbing, and when your " + (silly ? "cum cum" : "[pc.cumVisc] [pc.cumNoun]") + " boils out of you, it’s met by a torrent of syrupy, feminine orgasm.");
	var cumQ:Number = pc.cumQ();
	if(cumQ >= 50) 
	{
		output(" You flood her quim with pulse after pulse of seed.");
		if(cumQ >= 300)
		{
			if(ulaPregBelly() < 1)
			{
				output(" Eruptions of it flood through her ");
				if(pc.cockVolume(x) > ulaCapacity()) output("stretchy ");
				output("cervix to pack her womb.");
			}
			else output(" Eruptions of it flood her passage, blocked from further progress by her well-inseminated womb.");
			if(cumQ >= 2000)
			{
				output(" Rivers of jism spill out onto the sheets");
				if(cumQ >= 10000) 
				{
					output(", but still, you cum");
					if(cumQ >= 25000 && ulaPregBelly() < 1) output(". Her belly bloats obscenely from the volume, transforming her from chubby waif into gravid-looking broodmother, a look she is all too happy to have from how she gurgles and strokes her distended tummy");
				}
				output(".");
			}
		}
	}
	output("\n\n<i>“Ahhh...”</i> the korgonne sighs, body going completely limp.");
	output("\n\nThe scent of her pussy is everywhere, surrounding you, enveloping you, urging you to continue. You do.");
	output("\n\nShe doesn’t react when you fuck your way through your own sloppy seconds aside from making murmurs of delight and leaking enough mixed sexual fluids to keep your mind hazy and filled with the absolute <i>need</i> to <i>flood her with cum</i>.");
	output("\n\nFriction, sweat, scent, and the compulsive need to move your hips drags you through orgasm after orgasm. You spill a sea of loads in the korgonne’s velvety snatch. ");
	if(ulaPregBelly() < 1) output("She’s <i>yours</i> now, after all, and you can’t get that beautiful, gorgeous blue pussy out of your head...");
	else output("She’s <i>yours</i> after all. That gorgeous blue pussy of hers is pregnant with your kids, well and truly. The knowledge that you’ve claimed " + (ulaChief() ? "the korgonne chieftess":"her") + " so completely sends feral thrill up your spine.");
	processTime(45);
	IncrementFlag("ULA_SEXED");
	tryKnockUpUla();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",ulaBreedingEpi);
}
public function ulaBreedingEpi():void
{
	clearOutput();
	showUla(true);
	output("Licks tickle your nose. You grumble, and try to brush them aside, but they return, wetter and sloppier. When you can bear it no longer, you open your eyes to find ");
	if(flags["MET_ULA"] == undefined) output("the korgonne princess");
	else output("Ula");
	output(" beaming down at you. <i>“");
	if(!korgiTranslate()) output("Good fuck.");
	else output("I came so hard.");
	output("”</i> A hand pats your tender junk. <i>“");
	if(ulaPregBelly() < 1)
	{
		if(!korgiTranslate()) output("Father many pups.");
		else output("You could father so many pups.");
	}
	else
	{
		if(!korgiTranslate()) output("Would father many pups if not already pregnant!");
		else output("You could father a tribe’s worth of pups with cumshots like that. Of course... you’ve already gotten me started on that, haven’t you?");
	}
	output("”</i>");
	output("\n\nMemories of your activities come back to you, the way you took her, how you couldn’t help yourself... the simmering pleasure of her overheated slit. An almost painful surge of blood races into your crotch. <i>“Thanks?”</i>");
	if(flags["MET_ULA"] == undefined)
	{
		output("\n\nThe korgonne princess scampers back and takes your hand, pulling you up to a sitting position. <i>“What is call-word?”</i> She looks almost proper with her legs crossed, not at all like a factory for fuck-compelling pheromones.");
		output("\n\nYou pull your mind out of your nose and back to the matter at hand. <i>“My what?”</i>");
		output("\n\n<i>“Call-word.”</i> She points at her chest. <i>“Ula.”</i> Then she points at you and tilts her head.");
		output("\n\nOhhh! <i>“[pc.name],”</i> you answer, <i>“of the, uh... Steele clan.");
		if(pc.isNice()) output(" Nice to meet you, Ula");
		output("”</i>");
		output("\n\n<i>“[pc.name],”</i> the curvy korgonne mouths, handling each phoneme like an exotic treasure. <i>“[pc.name].”</i> It comes easier the second time. She beams");
		if(pc.tallness >= 66) output(" up");
		output(" at you. <i>“Nice call-word. Is proper, us knowing other.”</i> She hugs you tight. <i>“Pups know father name. Visiting soon? Want give all pups. Whole clan.”</i>");
		output("\n\nYou doubt she’ll step aside until you agree... <i>“");
		if(pc.isNice()) output("Of course!");
		else if(pc.isMischievous()) output("As if I could stay away!");
		else output("Sure.");
		output("”</i>");
		flags["MET_ULA"] = 1;
	}
	output("\n\n<i>“Happiness!”</i> Ula kisses you on the nose. <i>“");
	if(ulaPregBelly() < 1)
	{
		if(!korgiTranslate()) output("Return and tell star-stories. Then breeding, maybe? Make Ula big-tummy mommy. Have strongest pups.");
		else output("Come back soon. I’d love to hear your stories. We could breed again, after. Or before. Just come back soon! I want you to see my tummy swell up with your pups, all rounded and gravid. Gods, our kids could be so </i>strong<i>!");
	}
	else
	{
		if(!korgiTranslate()) output("Return and tell star-stories. Then share warmth, maybe? Ula gonna be big tummy mommy soon. Will have strongest pups!");
		else output("Come back soon. I’d love to hear your stories. Maybe we could share some warmth again, after. Or before. Just come back soon! I’m so horny ever since my belly started to swell up, all round and gravid. Gods, you make me hot.");
	}
	output("”</i>");
	processTime(60);
	for(var i:int = 0; i < 6; i++)
	{
		pc.orgasm();
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function ulaPussyFuck():void
{
	clearOutput();
	showUla(true);
	//Bimbo
	if(pc.isBimbo()) output("<i>“Fuck yes!”</i> you cheer enthusiastically.");
	//Bro
	else if(pc.isBro()) output("<i>“Yeah,”</i> you grunt.");
	//Nice
	else if(pc.isNice()) output("<i>“Sounds nice,”</i> you reply.");
	//Misch
	else if(pc.isMischievous()) output("<i>“Tongue share, maybe.”</i> You let it loll out invitingly.");
	//Hard
	else output("<i>“Hell yeah.”</i> You brazenly eye-hump the horny little mynx.");
	//Merge
	output("\n\nThe dildo disappears into a nearby bin. <i>“");
	if(korgiTranslate()) output("Then we won’t be needing this.");
	else output("Then not need this.");
	output("”</i> ");
	if(!pc.isCrotchExposed()) output("Fluffy hands help you out of your [pc.crotchCovers]. <i>“Or this.”</i> ");
	if(flags["MET_ULA"] == undefined) output("The korgonne");
	else output("Ula");
	output(" pulls you toward the bed, and you let yourself be lead. Silky fur slides through your fingers as you slide sideways into the warm cushions. They smell like her: a little spicy and a little minty, warm and inviting.");
	output("\n\nYou sink into the cushions. The bejeweled dog-girl rolls onto you, thick thighs");
	if(pc.hipRating() >= 14) output(" straining to stretch over your expansive hips");
	else output(" wrapping around your hips");
	output(". She smiles down at you as her tail nervously wags behind. After a moment of indecision, she plants a kiss on your [pc.lipsChaste]. <i>“");
	if(korgiTranslate()) output("The moment we finish, I start wanting this all over again...");
	else output("Wanting this for such long.");
	output("”</i> She kisses you again, more passionately, tongue probing deep to meet your own, and the pillowy breasts, just below, squish against ");
	if(!pc.hasTits() < 1) output("your chest");
	else output("yours");
	output(" in her eagerness. Cerulean nipples tent ");
	if(pc.hasFuckableNipples()) output("into your [pc.nipples]");
	else if(pc.hasDickNipples()) output("spar with your [pc.dickNipples]");
	else output("against your [pc.nipples]");
	if(ulaPregBelly() >= 2 || flags["ULA_TOTAL_KIDS"] != undefined) output(" and leak milk all over them");
	output(".");

	output("\n\n<i>“More,”</i> ");
	if(flags["MET_ULA"] == undefined) output("she");
	else output("Ula");
	output(" pants, grinding her juicing quim up and down your ");
	if(pc.hasCock()) output("[pc.cocks]");
	else output("[pc.thighs]");
	output(". Streaks of passion glisten in her wake.");

	output("\n\nTwisting to the side, you toss her onto her back and pivot off the bounce to pounce right onto that juicy quim. Your waist shimmys into place just after, coming to rest above her face");
	if(pc.legCount == 1) output(" with your [pc.leg] curled around her neck");
	else output(", [pc.legs] on either side of her neck");
	output(".");
	output("\n\nStars, she smells <i>good</i>. You stare in disbelief for a long moment, taking in the sight of creamy, blue-flushed cunt, admiring the slippery folds, parted slightly by the earlier dildo-play. A shining blue clitty beckons you to kiss it. You could lose yourself in a cunt like this. Maybe it’s the cloud of pheromones swimming around your head, but you can’t contain your hunger. You push your [pc.tongue] into the korgonne’s enchanting quim and sigh into her muff, the taste satisfying you in ways that no food ever could.");
	output("\n\nWhen a heated sigh washes over your [pc.vaginas] in return, you nearly cream yourself. So enamored of the dog-girl’s pussy-flavor, you had forgotten that the beautiful little crease was attached to another person - one with a nice, long tongue that’s ready to vanish ");
	if(pc.legCount > 1) output("between your [pc.legs]");
	else output("into your loins");
	output(". It burrows in without further warning. Your [pc.thighs] clench in sympathetic pleasure, and for a single heartbeat, you forget all about eating her out. You moan huskily in the korgonne’s chubby pussy, hips rocking back against the strokes of her tongue.");

	output("\n\nAll it takes is a few deep breaths to yank your attention back to the matter at hand: devouring every drop this sodden slit has to offer. You thrust your face deep");
	if(pc.hasMuzzle()) output(", burying your muzzle inside, the walls quivering against your nose as you slurp hard and fast, literally fucking her with your face.");
	else output(", chin bumping her clit, her walls quivering from the rapid fast slurps.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" Extending your elongated tongue the rest of the way inside shuts down the dog-girl’s answering affections. With your flesh circling her cervix, coiling to massage her deepest recesses, she can’t");
	else output(" Working her to a frenzy, you assault her channel until can’t");
	output(" manage much more than curling her toes and holding onto your head for dear life.");

	output("\n\nYou pull back. <i>“How’s this?”</i> Your thumb circles ");
	if(flags["MET_ULA"] == undefined) output("her");
	else output("Ula’s");
	output(" clit, massaging the delicate hood against the firm nub.");

	if(korgiTranslate()) output("\n\n<i>“Good! Such good!”</i> ");
	else output("\n\n<i>“Good! Sooo good!”</i> ");
	if(flags["MET_ULA"] == undefined) output("The korgonne");
	else output("Ula");
	output(" quivers and shakes, pussy-juices dripping. Any attempt to return the favor is forgotten beneath the avalanche of pussy-polishing pleasure.");

	output("\n\nYou release her clit and dive down to lap greedily at the river of girl-cum, chin nuzzling the sensitized nerve-cluster enough to satisfy the fluffy horn-dog. She tastes like mint-flavored ambrosia. Hints of her sweet, feminine honey linger in your maw in the aftermath of a particular large gulp. When you plunge your tongue back inside, you fall back in love with her cunt all over again. It’s heavenly, seemingly designed for you to obsess over. It’s the perfect size and shape for your tongue");
	if(pc.hasMuzzle()) output(" and muzzle");
	output(". Hypnotically plump lips linger behind your eyelids as you eat her out to one orgasm after another.");
	output("\n\nIgnoring how your face is drenched in her sloppy juices, painted from cheek to cheek in korgonne-cum, you’re still going, driving her wild. It feels like you’re addicted to pussy, like you can’t get enough. Your whole mouth aches from eating her out. You feel like you’ve swallowed gallons of girlish goo, but <i>you want more</i>. It’s like an addiction, only there’s no satisfying it. You always want more. No matter how horny you get, the desire for more delicious, savory slit overwhelms your personal need.");
	output("\n\n<i>Pussy!</i>");
	processTime(30);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",morePussThirst);
}

public function morePussThirst():void
{
	clearOutput();
	showUla(true);
	output("<i>“Mmmmmmph!”</i> the korgonne " + (ulaChief() ? "chieftess":"princess") + " cries from beneath you, nose dipping into your [pc.vagina]. She’s shaking from the effort, her muscles long ago worn out from the orgasms you’re milking out of her. When her tongue enters you once more, it’s transcendental. One lick, and you’re blasting off into orgasm on a slick tongue of canine rapture. Your [pc.vaginas] seize");
	if(pc.totalVaginas() == 1) output("s");
	if(pc.isSquirter())
	{
		if(pc.girlCumQ() >= 5000) output(", blasting [pc.girlCumNoun] everywhere. You feel more firehose than " + pc.mf("person","girl") + ", squeezing out geysers of feminine pleasure over her head.");
		else 
		{
			output(", squirting [pc.girlCumNoun] all over her. You feel like a sponge being wrung out. Blizzful contractions empty your quim");
			if(pc.totalVaginas() > 1) output("s");
			output(" of every drop of moisture.");
		}
	}
	else if(pc.wettestVaginalWetness() >= 2) output(", leaking [pc.girlCumNoun] into her tired maw, the feminine fluid sliding down her channeled tongue and into her gulping throat.");
	else output(", dribbling drops of [pc.girlCumNoun] into her tired maw. A canine tongue stuffs deeper into you, trying to get more. For a moment, you wish you were wetter, but then that too vanishes under the deluge of blended <i>pussy</i>-thought and climax.");
	output("\n\n<i>“Ahhhh!”</i> you cry. You stuff your face back into your lover’s sloppy, purple-blushed cunt, screaming your ecstasy into it. It’s exactly where you want to be, thrusting deep inside her, filling her with... pleasure.");
	if(pc.hasCock()) output(".. or cum. Oh how you wish you had chosen to use your dick. It would be so satisfying!");
	output(" Korgonne pussy is just so perfect. You cum while you taste her, eyes rolling back and hips rolling, grinding the " + (ulaChief() ? "chieftess":"princess") + "’s face.");

	output("\n\nThe moment the pleasure dies down, you collapse back onto her cunt, nuzzling happily against it while exhaustion takes you.");
	processTime(55);
	pc.applyPussyDrenched();
	pc.energy(-100);
	pc.orgasm();
	IncrementFlag("ULA_SEXED");
	clearMenu();
	addButton(0,"Next",pussThirstEpilogue);
}

public function pussThirstEpilogue():void
{
	clearOutput();
	showUla();
	output("Licks tickle your nose. You grumble, and try to brush them aside, but they return, wetter and sloppier. When you can bear it no longer, you open your eyes to find ");
	if(flags["MET_ULA"] == undefined) output("the korgonne princess");
	else output("Ula");
	output(" beaming down at you. <i>“");
	if(korgiTranslate()) output("You have the best tongue.");
	else output("Best tongue.");
	output("”</i> A hand pats your tender pussy. <i>“");
	if(korgiTranslate()) output("And this is... mouthwatering.");
	else output("Much thirsty.");
	output("”</i>");
	output("\n\nMemories of your activities come back to you, the way you took her, how you couldn’t help yourself... the simmering pleasure of her overheated slit. An almost painful surge of blood races into your crotch. <i>“Thanks?”</i>");
	if(flags["MET_ULA"] == undefined)
	{
		output("\n\nThe korgonne princess scampers back and takes your hand, pulling you up to a sitting position. <i>“What is call-word?”</i> She looks almost proper with her legs crossed, not at all like a factory for fuck-compelling pheromones.");
		output("\n\nYou pull your mind out of your nose and back to the matter at hand. <i>“My what?”</i>");
		output("\n\n<i>“Call-word.”</i> She points at her chest. <i>“Ula.”</i> Then she points at you and tilts her head.");
		output("\n\nOhhh! <i>“[pc.name],”</i> you answer, <i>“of the, uh... Steele clan.");
		if(pc.isNice()) output(" Nice to meet you, Ula.");
		output("”</i>");
		output("\n\n<i>“[pc.name],”</i> the curvy korgonne mouths, handling each phoneme like an exotic treasure. <i>“[pc.name].”</i> It comes easier the second time. She beams");
		if(pc.tallness >= 66) output(" up");
		output(" at you. <i>“Nice call-word. Is proper, us knowing other.”</i> She hugs you tight. <i>“Not forget Ula. Returning for visits?”</i>");
		output("\n\nYou doubt she’ll step aside until you agree... <i>“");
		if(pc.isNice()) output("Of course!");
		else if(pc.isMischievous()) output("As if I could stay away!");
		else output("Sure.");
		output("”</i>");
		flags["MET_ULA"] = 1;
	}
	output("\n\n<i>“");
	output("Happiness!");
	output("”</i> Ula kisses you on the nose. <i>“");
	if(korgiTranslate()) output("If you get a chance, come back and tell me some more of your stories. We can have some more tongue-fun afterward, get all drunk all on my pheromones together.");
	else output("Return and tell star-stories. Then tongue-fun. Get pussy-dumb together!");
	output("”</i>");
	processTime(35);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Tentatail Fuck
public function tentatailFuckUla():void
{
	clearOutput();
	showUla(true);
	output("The scent of the korgonne " + (ulaChief() ? "chieftess":"princess") + "’s steaming snatch is fascinating. You [pc.move] closer, nostrils flaring, [pc.tails] waving. There, more than elsewhere, you can feel the effects of her pheromones, pooling in the bottom of your [pc.cockTail], making it stiff and inflexible. Desire leaks from the tip in slick dribbles to patter on the stone below.");
	if(pc.hasKnees()) output(" Your [pc.knees] knock in eagerness.");
	output(" Grinning foolishly, you revel in the feel of alien engorgement shivering up your spine. Foreign urges twist your hips, flinging your trunk-mounted tool to the fore, mere inches from Ula’s cunt.");
	output("\n\n<i>“Ooh!”</i> Ula barks, innocent eyes wide at the sight of your parasitic endowment. <i>“");
	if(!korgiTranslate()) output("Bone on tail?");
	else output("A cock on a tail?");
	output("”</i> She stretches out, padded fingertips gingerly exploring the underside. <i>“");
	if(!korgiTranslate()) output("It feel good?");
	else output("It feels good?");
	output("”</i>");
	output("\n\nThe rigid flesh thrusts forward across her palm in excitement.");
	output("\n\n<i>“Wow!”</i> The plush " + (ulaChief() ? "chieftess":"princess") + " snaps back in surprise, bringing her other hand up to catch your vigorously lusty member. <i>“");
	if(!korgiTranslate()) output("Such excite!");
	else output("It’s so excited!");
	output("”</i> She purses her lips mischievously and bats her eyelashes. <i>“What if...”</i> The tiniest lean forward is all it takes for her lips to press against the meatus of your tail-bound member, but it’s enough - enough for too-tight muscles to impulsively thrust the alien length into her spit-slick maw.");
	output("\n\nBlue tongue lolling, Ula grabs onto your coiling, mouth-humping tail, arresting its motions before its eager assaults slam it dick-first into her gag-reflex. That doesn’t slow your parasitic half’s ardor in the slightest; it merely reverses direction to begin thrusting anew, splitting the plush korgonne girl’s maw around powerfully pulsating prickflesh. At the apex of your tail’s motions, you can hear a syrupy-sounding ‘gluk’ from the back of Ula’s throat, and spit dribbles from either side of her mouth.");

	output("\n\nYou grab onto the chubby puppy-girl’s sandy hair for stability, suddenly feeling a little weak in the knees.");
	if(pc.tailCount > 1)
	{
		output(" Your other tail");
		if(pc.tailCount > 2) output("s undulate");
		else output(" undulates");
		output(" wildly against the side of her face, smearing pre up and down her cheek fur in frustration. Ula has neither the hands or the attention to deal with ");
		if(pc.tailCount == 2) output("it");
		else output("them");
		output(", and lets ");
		if(pc.tailCount == 2) output("it have its");
		else output("them have their");
		output(" fun for the time being.");
	}
	output(" A low moan signals your enjoyment to the slobbering korg. She switches grip, increasingly familiar with your alien anatomy. It only takes her one hand to wrangle your tentacle’s passionate plunges. The other is free to tease the shaft, exploring the saliva-slicked flesh with quick back-and-forth pumps that make you want to blow your load on the spot.");

	output("\n\nUla yanks your cock-tail from her mouth, and laps the frothing mixture of spit and pre from her lips. <i>“");
	if(!korgiTranslate()) output("Not want cumming in mouth!");
	else output("Don’t cum in my mouth!");
	output("”</i> She wiggles playfully, your tender parasite held still by one fluffy paw. Thick, soft-furred thighs slowly spread, revealing folds made glossy with desire. <i>“");
	if(!korgiTranslate()) output("Cumming in cunt.");
	else output("Cum in my cunt.");
	output("”</i> She handles your tail-dick like a dildo, rubbing it back and forth through her slippery gates, tormenting you with a small taste of the heat and moisture her body can bring to bear. <i>“");
	if(ulaPregBelly() < 1)
	{
		if(!korgiTranslate()) output("Alien-tentacle ready for breed?");
		else output("Is your tentacle ready to breed?");
	}
	else 
	{
		if(!korgiTranslate()) output("Alien-tentacle ready for mommy-cunt?");
		else output("Is your tentacle ready to please a mother’s cunt?");
	}
	output("”</i> She holds it an inch away from her dripping slit, looking at you with eager, earnest eyes. <i>“");
	if(!korgiTranslate()) output("Ready for fuck?");
	else output("Ready to fuck?");
	output("”</i>");

	output("\n\nWhich part of you nods your head? Is it the rational sapient, or the coiled bundle of nerves and lust hanging off your [pc.ass]? Whoever is in control, they leave you nodding like a bobblehead.");

	output("\n\n<i>“Good!”</i> Ula barks and lets go.");

	output("\n\nHot, soaked folds swallow up an entire foot of your [pc.cockTail] in a second. Your body buries it in up to her cervix, and then pushes a little harder, coiling the flexible stalk around itself inside her. Meanwhile, grunting passionately, you grab two fistfuls of fluffy tit and bend over the petite " + (ulaChief() ? "chieftess":"princess") + "’s bed, kissing her hard while your inhuman anatomy goes to work on her royal slit. Mint-flavored girl-cum drips from where your tentacle flexes, splattering off your [pc.thighs]");
	if(pc.hasCock()) output(" and [pc.cocks]");
	output(".");
	//Have cocks.
	if(pc.hasCock())
	{
		output("\n\nUla’s eyelashes flutter closed, but her canine snout grows a mischievous smile. You feel why a second later: her fluffy little feet have wound their way to your groin to wrap around [pc.oneCock]. Soft-furred toes lace up from either veiny side while plump, soft pads knead at your neglected penis’s [pc.cockColor] skin. She carelessly jacks you off with her feet, but the Korg’ii Princess’s form is so squishy and fuckable that she might as well be servicing you with the skill of a whore. She could rub any part of her up against your [pc.cocks], and you’d be swooning, begging for more - which you do.");
		output("\n\n<i>“More!”</i> you pant.");
	}
	//No cocks
	else
	{
		output("\n\nUla’s eyelashes flutter closed, but her canine snout radiates contentment. You feel it in the way her breasts bounce into your palm, every pussy-drilling stroke of your [pc.cockTail] has the soft-bodied puppy bouncing along to the rhythm, her whole body rippling and jiggling to the erotic tempo. She’s not much good for doing anything but squeaking, leaking, and soon, cumming. You can’t get enough of her pussy either. That alien slit grips your [pc.cockTail] just right, pleasing you so well that you feel like swooning and begging for more. You do.");
		output("\n\n<i>“More!”</i>");
	}
	//Merge
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Such w-warm");
	else output("Sooo w-warm");
	output("!”</i> Ula whimpers");
	if(pc.hasCock()) output(", paws flying faster");
	output(".");

	output("\n\nYour [pc.cockTail] does exactly what cocks are designed to do - fuck progressively faster until it overloads its nervous system with pleasure and releases an enormously creamy load. Ula holds onto her sheets for sheer life. If you weren’t hanging onto them, her tits would be slapping together with painful force.");
	if(pc.hasCock()) output(" Her feet quiver and stroke, toe-claws occasionally pricking your skin in excitement. Pre-cum soaks the spaces between her toes and lubricates her efforts.");
	output(" A long blue tongue rolls out, panting, as you kiss on the tribal maiden. She turns up her head to expose her neck to you, and in the moment of climbing pleasure, you nip at it.");
	output("\n\nUla moans deliriously and clamps down around you");
	if(pc.hasCock()) output(" with her feet as well as her pussy");
	output(". <i>“");
	if(!korgiTranslate()) output("Yessss! Give warm! Give such warms!");
	else output("Yessss! Give me your warmth! Make me so fucking warm!");
	output("”</i> Her folds flutter imploringly, begging you to seed her. <i>“Cumming!”</i>");
	if(flags["ULA_TOTAL_KIDS"] != undefined) output(" Milk arcs into the air from her leaky nipples, proof that you’ve transformed the virginal " + (ulaChief() ? "chieftess":"princess") + " into a slutty mommy.");

	output("\n\nBiting harder, you feel the orgasm start at the base of your spine and race down the alien flesh attached to your [pc.ass], culminating in a flash of explosive bliss that has you seeing stars.");
	if(pc.hasCock()) output(" An answering spasm from your middle reminds you of your other phallic flesh a half-second later and has you spooling long ropes of [pc.cum] into Ula’s wiggling toes, glazing her feet in layer after layer of [pc.cumGem].");
	output(" Back arched, you savor the blissful relief that comes with draining the parasitic cum from your tail");
	if(pc.tailCount > 1) output("s");
	output(", watching the korgonne’s blue-lipped cunt grow progressively more soaked.");

	var cumQ:Number = pc.cumQ();
	output("\n\nWhen you pull out a moment later, her cupped pussy dribbles slightly, thoroughly creampied.");
	if(pc.hasCock() && cumQ >= 1000) {
		output(" Ula isn’t done with you, however. Not while [pc.eachCock] is still shooting ropes, not while she can stroke you with her feet and milk thicker flows of virile seed onto her fluffy chest. She purrs as you bury her in a layer of [pc.cumColor], even shovels some of the excess into the creamy alien deposit presently lingering between her thighs. She showers with your seed and seemingly revels in it. <i>“");
		if(!korgiTranslate()) output("Such");
		else output("Sooo");
		output(" virile! Wow...”</i>");
	}
	else
	{
		output(" ");
		if(!korgiTranslate()) output("<i>“Mmm... fun with strange butt-cock.”</i> She strokes your tail like a pet. <i>“Good boy. Give Ula good cummies.”</i>");
		else output("<i>“Mmm... pretty good, for a tentacle-cock.”</i> She strokes your tail like a pet. <i>“Good boy. You gave me some good orgasms.”</i>");
	}
	output("\n\nYou won’t get a more glowing endorsement than that...");
	if(cumQ >= 1000)
	{
		output("\n\nUla turns away from you to groom the... excessive amounts of semen from her coat... with her tongue.");
		if(pc.isBimbo()) output(" You salivate in jealousy. Maybe you should collect a little for yourself next time!");
		else output(" Hot.");
	}
	processTime(30);
	pc.orgasm();
	IncrementFlag("ULA_SEXED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);

}

//Centaur Service
//Centaur with at least 6”</i> dick. Must be at least 5’6”</i> tall.
public function centaurServiceForUla(x:int):void
{
	clearOutput();
	showUla(true);
	output("The sudden diversion of blood from your skull to your crotch ought to leave you dizzy, maybe even drop you to your knees - if you were a lesser creature. Bracing your [pc.feet], you");
	if(pc.tailCount > 0) output(" flick your tail and");
	if(!pc.isErect()) output(" let your [pc.cocks] engorge as nature intended - swinging from between your upright hindlegs");
	else output(" let your [pc.cocks] swing as nature intended - dangling between your upright hindlegs");
	output(". <i>“Get your ass up on the edge of the " + (ulaChief() ? "throne":"bed") + ".”</i> You prance forward, proud flesh bouncing at what must be eye-level for the horny korgonne.");

	output("\n\nThe scent of her need redoubles, and the thickness of your package surges along with it, heavy with potential pleasure.");

	output("\n\n<i>“Like this?”</i> Ula asks, bent over the side of " + (ulaChief() ? "her throne":"the bed") + ", her thick thighs quivering excitedly. Pussyjuice beads from her cyan blue lips, drip-drip-dripping into a clear puddle below. The pose has her cunt popping open and closed with her breathing, all but begging you to canter forward and lay claim to it once and for all.");

	var cumQ:Number = pc.cumQ();
	//Too big
	if(pc.cockVolume(x) > ulaCapacity())
	{
		output("\n\n<i>“Like that,”</i> you growl as you step into position. Your [pc.cock " + x + "] slaps against your bestial half’s belly");
		if(cumQ >= 100) output(", flinging strands of wet, animalistic pre-cum over everything from the floor to your conquest’s upraised ass");
		if(cumQ >= 1000) output(". Dollops of the stuff pump out by the time you’re lined up, individually thicker than the average man’s orgasm");
		output(".");

		output("\n\nWhimpering, Ula peers through your legs with no small measure of concern on her features. <i>“");
		if(!korgiTranslate()) output("No fit. Too... big. Break Ula in half.");
		else output("That won’t fit! It’s too... big. It’ll break me in half!");
		output("”</i>");
		output("\n\n<i>“But...”</i> You gesture at the horny bitch splayed out in front of you. Everything from her juicing cunt to lush butt to widespread sideboob is begging you to take her on the spot. <i>“What about lube?”</i>");
		output("\n\n<i>“Right!”</i> Ula perks up, but only from the waist. Much to your pleasure, she keeps her ass right where it is, even as your forelegs stamp into position on either side of her. <i>“");
		if(!korgiTranslate()) output("Have core-magic for making fit. Nearly forgot!");
		else output("I have some core-magic for making such things fit. I nearly forgot!");
		output("”</i> She stretches and wiggles, tail tickling your underside, and at long last produces of a bottle of <i>“Peggy’s Elasticizing Oil.”</i> Rather than ask her where she found it, you’re happy to watch her stuff the tip up her snatch and squeeze it out into her body. <i>“");
		if(!korgiTranslate()) output("Fit any dick with this.");
		else output("I could fit any dick with this.");
		output("”</i> She stretches one foot back to cup your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("[pc.knotOrSheath " + x + "]");
		output(". <i>“");
		if(!korgiTranslate()) output("Breed Ula good now, right?");
		else output("Breed me good now, all right?");
		output("”</i>");

		output("\n\n<i>“Right,”</i> you agree, lining your [pc.cockHead " + x + "] with the diminuative slit. <i>“You sure you want me to breed you?”</i>");
	
		output("\n\nUla vigorously nods, humping back a bit so that you can feel her tiny cunt grinding on your fattened tip. <i>“");
		if(!korgiTranslate()) output("Give pups. Strong alien-korg pups.");
		else output("Give me pups - strong, alien-korg pups.");
		output("”</i>");
		output("\n\nYou won’t get a more clear invitation than that. You grab hold of her bed’s headboard and rear up, putting every ounce of your considerable weight into the act of penetrating the petite korgonne. At first, she squeals in discomfort, but your [pc.cockHead " + x + "] pries her cunt open by pressure alone. The moment it slips into her gates, the elasticized flesh behind opens up like a sex-toy built for taurs, swallowing you whole. ");
		if(flags["ULA_DEFLOWERED"] == undefined)
		{
			output(" Something inside her snaps, <b>robbing her of her virginity in a moment of raw, animal carnality.</b>");
			flags["ULA_DEFLOWERED"] = 1;
		}
		output("You wish you could see her chubby belly distending into the shape of your cock. It must be, from how you can feel the wadded up sheets through her straining, silk slit.");
		pc.cockChange();
		output("\n\n<i>“Gods! ");
		if(korgiTranslate()) output("You’re breaking me!");
		else output("Cock break Ula!");
		output("”</i> Her voice is shocked and laden so thickly with pleasure that she slightly slurs. <i>“");
		if(!korgiTranslate()) output("Make one big pussy. Having stretch-pleasure everywhere!");
		else output("I’m like one big pussy! Everything is all stretching and pleasure!");
		output("”</i>");
		if(pc.cocks[x].cLength() >= 30) output(" The vague compression of her tits to either side of your shaft makes it clear just how deeply you’ve taken her.");
		output(" Tiny paws stroke along the sides of your [pc.cock " + x + "] in awe, massaging the sensitive veins through the korgonne’s distended tummy.");
	}
	//Fits
	else
	{
		output("\n\n<i>“Like that,”</i> you growl as you step into position. Your [pc.cock " + x + "] slaps against your bestial half’s belly");
		if(cumQ >= 100) output(", flinging strands of wet, animalistic pre-cum over everything from the floor to your conquest’s upraised ass");
		if(cumQ >= 1000) output(". Dollops of the stuff pump out by the time you’re lined up, individually thicker than the average man’s orgasm");
		output(".");
		output("\n\nYou grab hold of the bed’s headboard and rear up, putting every ounce of your considerable weight into the act of penetrating the petite korgonne. She’s a fine fit for your [pc.cock " + x + "], judging by the way her body smoothly parts to accept your [pc.cockHead " + x + "], tight on the inside but not so tight as to slow your passage into her chubby cunny. She’s whimpering by the time you bury yourself up to the [pc.knotOrSheath " + x + "], but you’re on floating cloud nine. While it’s only been a few minutes, it felt like her scent had been tormenting you for years.");
		if(flags["ULA_DEFLOWERED"] == undefined)
		{
			output(" Something inside her snaps, <b>robbing her of her virginity in a moment of raw, animal carnality.</b>");
			flags["ULA_DEFLOWERED"] = 1;
		}
		pc.cockChange();
		output("\n\nThe nerves in your cock dazzle at the feel of spreading open the dog-girl’s glistening folds beneath you. Your bestial hips twitch once, violently thrusting to ensure you’ve fully claimed the bitch. A second time, they repeat the motion, throwing Ula a few inches down the bed before she can scrabble back to properly re-embed herself. That’s a good bitch. You reward her twisting down between your forelegs to scratch behind her right ear.");
		output("\n\n<i>“Gods! ");
		if(!korgiTranslate()) output("Ula broken");
		else output("I’m breaking");
		output("!”</i> she babbles, legs quivering so hard you can feel the muscular contractions through her cunt.");
		if(pc.balls > 0) output(" She reaches down to paw at your [pc.balls] and worshipfully caress your [pc.sack].");
		output(" <i>“");
		if(!korgiTranslate()) output("One thrust and fillinged up! Alien so big and strong! Big body everywhere. Ula not even see eyes, just warm and cock!");
		else output("One thrust, and I’m filled up! You’re so big and strong! That huge body is everywhere. I can’t even see your face, just you and your cock!");
		output("”</i> She bounces herself back and forth on your dick. <i>“");
		if(ulaPregBelly() < 1)
		{
			if(!korgiTranslate()) output("Breed now! Give pups!");
			else output("Breed me now! Give me pups!");
		}
		else
		{
			if(!korgiTranslate()) output("Take now! Already-pregnant no matter! Need more dick!");
			else output("Take me now! I don’t care that I’m already knocked up. I need more dick!");
		}
		output("”</i>");
	}
	//Merge
	output("\n\n<i>“");
	if(ulaPregBelly() < 1) output("So you want bred?");
	else output("So you want fucked?");
	output("”</i> You offer while yanking your hips backward, emptying the korgonne’s cunt just in time to fill it right back up. <i>“You want this?”</i> You pound her back and forth. The little thing is no match for your animalistic body’s attentions. Your thrusts drag her " + (ulaChief() ? "across the cushions":"through the sheets") + " like a ragdoll.");
	output("\n\n<i>“Yes! ");
	if(!korgiTranslate()) output("Ula want");
	else output("I want it");
	output("!”</i>");
	output("\n\nUla does her best to hold herself in position, but with all the dick occupying her pretty blue pussy, she’s not going to be much good for anything but getting knocked up. You thrust harder into her. Solid construction is no match for hundreds of pounds of transformed Rusher. The " + (ulaChief() ? "legs":"frame") + " creaks dangerously when you bottom out, and Ula squeaks right along with it. Grunting with the effort, you give yourself over to your animal instincts and let the fluffy " + (ulaCapacity() ? "chieftess":"princess") + " truly have it. <i>“You want fucked like a horny bitch?”</i>");
	output("\n\nThe impaled korgonne whimpers. <i>“");
	if(!korgiTranslate()) output("Am! Am! Am such love! Pussy in-loving with cock! Want more!");
	else output("I am! I’m a horny bitch in love! My pussy loves your cock, and I want moooore!");
	output("”</i> She yips plaintively, <i>“");
	if(ulaPregBelly() < 1)
	{
		if(!korgiTranslate()) output("Cock! Give cock again and again! Fill with pups! Puppy-love!");
		else output("More cock! Again and again! Fill me with your love... and pups!");
	}
	else
	{
		if(!korgiTranslate()) output("Cock! Give cock again and again! Love pregnanted! Puppy-love!");
		else output("More cock! Again and again! I love pregnant sex! Having puppies makes me so wet!");
	}
	output("”</i>");
	output("\n\nRestraint forgotten, you focus on giving her exactly what she wants: a load of hot, thick [pc.cumNoun] as deep inside her horny puss as possible.");
	if(ulaPregBelly() < 1)
	{
		output(" Your [pc.legs] power successively firmer assaults on her cervix");
		if(pc.cockVolume(x) > ulaCapacity()) output(", an organ that long ago stretched out of the way and is now being compacted out of the way into her cuntwalls");
	}
	else
	{
		output(" Your [pc.legs] power firm assaults on her tunnel");
		if(pc.cockVolume(x) > ulaCapacity()) output(", stopping just shy of bashing into pregnant cervix");
	}
	output(". ");
	if(flags["ULA_TOTAL_KIDS"] != undefined) output(" Milk cascades around her as it squirts powerfully from her nipples. She grabs them in desperation, but it just makes her shoot all the harder, coating everything in nutritious cream. ")
	output("Pussy-juice splatters the sheets as Ula cums under the assault. She goes limp, but that doesn’t stop you from fucking her.");

	output("\n\nIt makes it easier. You hump Ula’s semi-conscious, blissed-out body faster and faster");
	if(pc.balls > 0) output(" until your [pc.balls] are churning and ready to blow");
	else output("until your [pc.cock " + x + "] is throbbing and ready to blow");
	output(". <i>“");
	if(ulaPregBelly() < 1) output("I’ve got your pups right here,");
	else output("I’ve got your cum right here,");
	output("”</i> you promise, bottoming out inside her one last time. Surges of ecstasy radiate out from your abdomen in rhythmic");
	if(pc.balls > 0) output(", ball-draining");
	output(" pulses.");

	output("\n\nThe proclamation rouses Ula enough for one last, impassioned, <i>“Yesssss!”</i> and another squirting climax. Breathing deeply of the pheromone-saturated air, you pour your [pc.cum] into Ula in ecstatic pump after ecstatic pump, flanks heaving, ");
	if(pc.balls > 0) output("[pc.balls] quivering, ");
	output("[pc.cocks] jerking, and eyes rolling back delightedly.");
	var sheetsoak:Boolean = false;
	if(cumQ >= 4000) output(" There’s so much that you can hear jism squelching into your petite lover’s middle, pumping her up with virile goo.");
	if(cumQ >= 25000) 
	{
		sheetsoak = true;
		pc.applyCumSoaked();
		output(" High-pressure [pc.cumColor] cascades out around you before long. A creature Ula’s size simply isn’t made to contain the ludicrous amounts of semen a being like you can produce. ");
		if(ulaPregBelly() < 1) output("Nevertheless, your body does its best to absolutely bathe her eggs in it, never mind that most of it is left to impregnate her sheets.");
		else output("Nevertheless, your body its absolute best to ensure that the sheets are just as pregnant as the woman being fucked atop them.");
	}
	tryKnockUpUla();
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",ulaTaurLovePart2,sheetsoak);
}
public function ulaTaurLovePart2(sheetsoak:Boolean):void
{
	clearOutput();
	showUla();
	output("Ula giggles when you withdraw, dragging her a good two feet through her ");
	if(!sheetsoak) output("spunk-soaked ");
	output("sheets. <i>“Ahh! Good alien-daddy, make pussy too happy. ");
	if(ulaPregBelly() < 1) output("Will want breeding fucks every night!");
	else output("Will want breeding fucks til belly too big!");
	output("”</i>");
	output("\n\nYou assure her that you’d be delighted to tend to that want as often as possible.");
	processTime(5);
	IncrementFlag("ULA_SEXED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Mining
public function ulaMiningTalk():void
{
	clearOutput();
	showUla();
	//Bimb
	if(pc.isBimbo()) output("<i>“I know it’s like, supes boring, but what do you guys mine? Anything sparkly?”</i>");
	//Bro
	else if(pc.isBro()) 
	{
		output("<i>“Mining.”</i> You stare");
		if(pc.tallness >= 66) output(" down");
		output(" at her. <i>“Gotta be some nice stuff here.”</i>");
	}
	//Else
	else output("<i>“Could you tell me about your clan’s mining?”</i>");
	//Merge
	output("\n\nUla gives you a pained expression. <i>“");
	if(!korgiTranslate()) output("Think we having cool Alien-stuff talk, but nope! Korg stupidness!");
	else output("I thought we’d talk about cool alien stuff, but nope! Korg stupidness.");
	output("”</i> She punches the bed. <i>“");
	if(!korgiTranslate()) output("Whole universe, but want talk dirt-dig like gem-heart rock-pup.");
	else output("There’s a whole universe, but you want to talk about digging in the dirt like some gem-heart rock-pup.");
	output("”</i>");
	output("\n\nYou tilt your head. <i>“Gem-heart?”</i>");
	output("\n\nUla nods. <i>“");
	if(!korgiTranslate()) output("Digger. Sparkle-thirsty korg who prefer tunnel to clan. Rather hold pick than mate. Gem-heart.");
	else output("A digger. Gem-thirsty korg who prefer to tunnel than live with the rest of the clan. They’d rather hold a pick than a mate, thus, Gem-heart.");
	output("”</i> She shrugs. <i>“");
	if(!korgiTranslate()) output("Not understanding them. Live in hold too long, maybe. Nothing but rock, rock, and more rock. Maybe sparkle. Elders say gem-heart not from that. Say they just are. Just loving the finding. Alien word for it... thrill? Seek thrill. Want long dig boring just so can find moment of pretty sparkle!");
	else output("I don’t understand them. Maybe they’ve stayed in the hold too long? Their life is basically just rock, rock, and more rock. Maybe a gem here or there. The elders say gem-hearts just </i>are<i>. That they just love the act of finding new gems. There’s a word in your language for it... thrill? They love the thrill. They love the long stretches of boredom just so they can have the jubilation of one rich find.");
	output("”</i>");
	output("\n\n<i>“Like gambling?”</i> you suggest.");
	output("\n\nRecoiling, the curvy korgonne’s ears flop. <i>“");
	if(!korgiTranslate()) output("What gam-bull-ing?”</i> Her nose wrinkles. <i>“Sound like gross.”</i>");
	else output("What’s gam-bull-ing?”</i> Her nose wrinkles. <i>“Sounds gross.”</i>");
	output("\n\n<i>“No, no,”</i> you protest. You spend a few minutes explaining the concept of gambling before the little creature abruptly catches on.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Ohhhh! Like hormnolde! Male-korg game. Spin crystal and throw goal cubes. Such complex, but lots fun.");
	else output("Ohhhh! Like hormnolde! It’s a male korg game. You spin a crystal and throw goal cubes. It’s incredibly complex but lots of fun.");
	output("”</i> Ula grabs your hand and squeezes. <i>“");
	if(!ulaChief())
	{
		if(!korgiTranslate()) output("Ula not permitted join. Clan Chief daughter no get fun. No get go outside. No get court mate. Just stuck room. Always stuck room.");
		else output("I’m not permitted to join. The Clan Chief’s daughter isn’t allowed fun. No going outside. No courting mates. Just the inside of this room. Nothing but the inside of this room.");
		output("”</i> She stamps her foot. <i>“");
		if(!korgiTranslate()) output("Gem-heart better. Can do what want, even if just poke rocks all day.");
		else output("Gem-hearts have it better. They can do what they want, even if it’s poking rocks all day.");
	}
	else
	{
		output("<i>“");
		if(!korgiTranslate()) output("Ula not have time to join. Clan Chieftess having many responsables, and much danger to outside-going. Not have time to court mate, even. Work in throne room.”</i>");
		else output("I don’t have time to join in. The Clan Chieftess always has more responsibilities, and going outside is too dangerous - as you well know, after what happened with my father. I don’t even have to properly court a mate. There’s always more work to see to in the throne room.”</i>");
		output(" She stamps her foot. ");
		if(!korgiTranslate()) output("<i>“Gem-heart some better. Get do what want, even if just poke rocks all day. Still, Ula get satisfaction making whole tribe life better.”</i>");
		else output("<i>“Gem-hearts have it better. They can do what they want, even if it’s poking rocks all day. Still, I get some satisfaction knowing that I’m making life better for my whole tribe.”</i>");
	}
	output("”</i>");
	output("\n\nRather than upset her further, you decide to find out more about the gem-hearts. <i>“Did they create the entire hold?”</i>");
	output("\n\nUla laughs. <i>“Gem-hearts? Craft?”</i> She pats your ");
	if(pc.hasKnees()) output("knee");
	else output("[pc.leg]");
	output(". <i>“");
	if(!korgiTranslate()) output("Poor alien. So much star-light scramble brain. Gem-hearts only dig and like dig. Not think for hold, only sparkle. Elders plan hold. Tell gem-hearts where dig, how dig. Gem-hearts listen or exile.");
	else output("Poor alien. All that star-light must have scrambled your brain. Gem-hearts only like to dig. It’s all they do. They don’t think about the hold, just the gems they might find. The elders planned the hold. They tell the gem-hearts where to dig, and the gem-hearts have to listen if they don’t want exiled to the snow.");
	output("”</i> She shivers. <i>“");
	if(!korgiTranslate()) output("Exile only cold. Saber-fang killers or alien-stolen.");
	else output("There’s nothing out there but cold, milodan murderers, and thieving aliens.");
	output("”</i> Ula’s ears fold back apologetically. <i>“Not all aliens ");
	if(korgiTranslate()) output("are ");
	output("good.”</i> Soft fur tickles your forearm as she gently strokes your bicep. <i>“You");
	if(korgiTranslate()) output("’re");
	output(" nice though.”</i>");
	output("\n\nYou smile winningly, glad to have her endorsement. <i>“But they dug out the entire hold?”</i>");
	output("\n\nTail wagging, Ula leans herself completely into your side. She’s warm. <i>“");
	if(!korgiTranslate()) output("Whole hold. Gem-hearts think fun, digging. Think pick-sound music. Think sparkle-rocks give joy.");
	else output("The whole hold. Gem-hearts think digging is fun. To them, the sound of picks is like music and the sight of gems like pure joy.");
	output("”</i> The grinning fluffball jangles a bracelet in front of you. <i>“");
	if(!korgiTranslate()) output("Is nice, but not that nice. Not </i>fucking<i> nice.");
	else output("They’re nice, but not that nice. Not </i>fucking<i> nice.");
	output("”</i> She paws gently at your [pc.chest], clawed fingers tracing down to your [pc.belly]. Her eyelashes flutter bashfully as she looks ");
	if(pc.tallness >= 66) output("up ");
	output("at you with undisguised ardor.");

	output("\n\n<i>“What do you do with it? All the ");
	if(korgiTranslate()) output("gems?");
	else output("sparkle-rocks?");
	output("”</i> You scratch the top of her head, right between the ears.");

	output("\n\nUla’s eyes drift closed, and her tongue slips out unthinkingly. <i>“");
	if(!korgiTranslate()) output("Sparkle-crusts. Tools. Crafty-korg trade for rocks, then make use. Rest dropped under ice. Under ocean. No signs for alien or fang-kitties to tracking.");
	else output("Jewelry. Tools. Craftskorg will trade for the useful gems. The rest get tossed under the ice, deep in the ocean. We don’t leave any signs for alien miners or fang-kitties to track.");
	output("”</i> She purrs against you. <i>“");
	if(!korgiTranslate()) output("Korg smart. Live in Uveto’s bones. Invisibiling to fang-cats. Unbreakable. No attacking... till aliens come.");
	else output("We korg are smart. In Uveto’s bones, we’re invisible to the fang-cats. Our home was unbreakable. Impenetrable... until the aliens came.");
	output("”</i> She pulls away, brushing her hair into place. <i>“");
	if(!korgiTranslate()) output("Harder living now. Less places for korg settling. Digging deeper now. Bigger clans, in case need fight aliens. Bang tubes very kill, but korg many more.");
	else output("Everything is harder now. There’s less places for other korg tribes to settle. We have to dig deeper. Clans have to be as big as possible to stand up to alien weapons. Thundersticks can kill many korg, but if enough of us come together, no amount of shots can stop us.");
	output("”</i>");
	output("\n\nYou hadn’t put much thought into what would happen if the korgonne got pushed too far by the mining on planet. Hopefully any violence can be avoided.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Want other talk");
	else output("Want to talk about something else");
	output("?”</i> Ula seems discomforted by the recent turns in the conversation.");
	processTime(15);
	flags["ULA_MINING_TALKED"] = 1;
	addDisabledButton(1,"Mining","Mining","You just spoke about this.");
}

//Ula’s Role
public function ulasRoleInTheClan():void
{
	clearOutput();
	showUla();
	if(!ulaChief())
	{
		output("<i>“So what are you, to your clan?”</i> You gesture around her spacious quarters, clearly decorated to her tastes. <i>“Chieftan’s daughter?”</i>");
		output("\n\nUla nods bashfully. Her tail hangs flat on the bed. <i>“");
		if(!korgiTranslate()) output("Very correct. Clan Chieftan fathering. Many elders uncle or aunt. All expecting much.");
		else output("Correct. The Clan Chieftan is my father. Many elders are my uncles and aunts. They all expect much.");
		output("”</i> She shrugs emphatically. <i>“");
		if(!korgiTranslate()) output("Too much. They saying too headstrong but also saying not leader! They saying need find mate, then no let visit males. All knowing Ula is pussy-dumb. Get horny-dumb like males.");
		else output("Too much. They say I’m too headstrong but also not a leader. They say I need to find a mate, then don’t let any males visit me. They all know I’m pussy-dumb - that I get stupid-horny like a male.");
		output("”</i> She pats at her mostly-bared crotch. <i>“");
		if(!korgiTranslate()) output("After runninged away, they change minds, but now I change mine. No want korg visiting. Rather [pc.name] visit.");
		else output("After I ran away, they changed their minds, but now I’ve changed mine. I don’t want male korg visiting. I’d rather [pc.name], you, visit.");
		output("”</i> The korgonne " + (ulaChief() ? "chieftess":"princess") + " smiles sidelong at you.");

		//Bimb
		if(pc.isBimbo()) output("\n\n<i>“Awww, thanks so much!”</i> You squeeze her tight. <i>“I love visiting you, little cuddle-pup!”</i>");
		//Bro
		else if(pc.isBro()) output("\n\n<i>“Thanks, toots.”</i> You squeeze her shoulder affectionately.");
		//Nice
		else if(pc.isNice()) output("\n\n<i>“Awww, thanks!”</i> You squeeze her affectionately. <i>“I enjoy these visits too.”</i>");
		//Misch
		else if(pc.isMischievous()) output("\n\n<i>“Oh really?”</i> You ask, smiling broadly. <i>“Then I’ll have to visit twice as much.”</i>");
		//Hard
		else output("\n\n<i>“Good thing I’m here then,”</i> you quip.");
		//Merge
		output("\n\nUla blushes. <i>“Good.”</i>");
		output("\n\nYou ask her if that means she’ll be the chief someday.");
		output("\n\nSnorting, the canine woman laughs. <i>“");
		if(!korgiTranslate()) output("Am doubting! Elders choosing next Chieftan. Usually old-Chief offspring. Not this time. Think me too crazy. Reckless. Weak.");
		else output("I’m doubting it! The elders choose the next Chieftan. Usually it is a child of the old Chief. Not this time. They think I’m too crazy, reckless, and weak.");
		output("”</i> She snorts. <i>“");
		if(!korgiTranslate()) output("We do better if learn from aliens. Learn alien science-magic so can make boom-tubes of own. Milodans not stand chance against korg with core-magic. Aliens no gloat in sky above if korg have fly-ships of own. No take holds from small tribes for steal sparkles! No take! Only respect!");
		else output("We would do better if we learned from the aliens. We could learn science-magic to make boom-tubes of our own. Milodans wouldn’t stand a chance against korg with core-magic. Aliens couldn’t gloat in the sky above if we had ships of our own. Nobody could take from the small tribes or steal our gems! No more thievery! Only respect!");
		output("”</i> Ula punches one fist into the other. <i>“");
		if(!korgiTranslate()) output("That what I do if got be chief.");
		else output("That’s what I’d do if I got to be chief.");
		output("”</i>");
		output("\n\nYou rock back in surprise. She’s quite the progressive little firecracker!");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Want talk something else?");
		else output("Want to talk about something else?");
		output("”</i> Ula strokes your knee affectionately.");
	}
	else
	{
		output("<i>“So what are you, to your clan?”</i> You gesture around her spacious quarters, clearly decorated to her tastes. <i>“Chieftess?”</i>");
		output("\n\nUla nods bashfully. Her tail hangs flat on the bed. <i>“");
		if(!korgiTranslate()) output("Very correct. After battle for hold, father make Clan Chieftess. Many elders big doubting until fight, when Ula’s friend save hold and Ula rally fighters for battling.");
		else output("Correct. After the battle for the hold, my father made me Clan Chieftess. Many of the elders, my uncles and aunts, doubted me until that fight, when you saved the hold and I rallied our warriors to clear the hold.");
		output("”</i> She blushes emphatically. <i>“");
		if(!korgiTranslate()) output("Such silly! They sayinged Ula too headstrong and also not leader! Sayinged needed mate but not let visit males. Though pussy-dumb and useless, but Ula show them! Alien show them! If Ula not got mad and run away to meet [pc.name], whole hold be fang-cat city now!");
		else output("So silly! They said I was too headstrong and lacked the qualities of a leader. They said I needed a mate but wouldn’t let me visit males. They thought I was pussy-dumb and useless, but I showed them! You did too! If I hadn’t gotten mad and run away to meet you, the whole hold would be a milodan city by now!");
		output("”</i> She pats at her mostly-bared crotch. <i>“");
		if(!korgiTranslate()) output("Now no elder can tell Ula what do about males, but Ula not care. Not need korg visiting. Rather [pc.name] visit.");
		else output("Now no elder can tell me what to do about males and mating, but I don’t care. I don’t need a male korg to visit. I’d rather you visit.");
		output("”</i> The korgonne " + (ulaChief() ? "chieftess":"princess") + " smiles sidelong at you.");

		//Bimb
		if(pc.isBimbo()) output("\n\n<i>“Awww, thanks so much!”</i> You squeeze her tight. <i>“I love visiting you, little cuddle-pup!”</i>");
		//Bro
		else if(pc.isBro()) output("\n\n<i>“Thanks, toots.”</i> You squeeze her shoulder affectionately.");
		//Nice
		else if(pc.isNice()) output("\n\n<i>“Awww, thanks!”</i> You squeeze her affectionately. <i>“I enjoy these visits too.”</i>");
		//Misch
		else if(pc.isMischievous()) output("\n\n<i>“Oh really?”</i> You ask, smiling broadly. <i>“Then I’ll have to visit twice as much.”</i>");
		//Hard
		else output("\n\n<i>“Good thing I’m here then,”</i> you quip.");
		//Merge
		output("\n\nUla blushes. <i>“Good.”</i>");

		output("\n\nYou ask her if she’s ever going to retire from being chieftess someday.");

		output("\n\nSnorting, the canine woman laughs. <i>“");

		if(!korgiTranslate()) output("Am doubting! Ula stubborn like father, probably. Stay Chieftess till be fat longfur. Too many korg wanting stay old ways, but old ways dumb and doom. Bad aliens or fang-cats destroy if clinging tradition. Need think smart and use all tools. Even alien bang-sticks and shimmerfield belts.");
		else output("I doubt it! I’m more like my father than I’d care to admit - stubborn as the hardest rock. I’ll be Chieftess till I’m a chubby longfur and it hurts to stand up in the morning. There are too many sentimental korg who want to cling to the old ways, but those traditions are useless. They’ll lead us to our doom. Greedy aliens or fang-cats will destroy the entire clan if we don’t evolve. We need to be smart and use all tools, even core magics like bang-sticks and shimmerfield belts.");
		output("”</i> She snorts. <i>“");
		if(!korgiTranslate()) output("Ula make grumpy korgs learn alien words. Learn science-magics so craft boom-tubes of own. Already craftskorg puzzle out fire-powder recipe. Milodans not stand chance against korg with core-magic of own, especially after bringing so much to hold! Having weapons and protect-crusts for all hunters with leftovers now. Someday we even have fly-ships of our own. No take holds from small tribes for stealing sparkles! No take! Only respect!");
		else output("I’m making the Korg’ii learn alien words. We’re figuring out your science-magics too, so we can craft guns of our own. The craftskorg have already puzzled out the recipe for gunpowder. Milodans won’t stand a chance against korg with core-magics of our own, especially after delivering so many to our hold! We have weapons and shields and armors for every hunter in the hold - with leftovers! Someday we’ll even have ships of our own, so that nobody can steal from the smaller or claim our gems! We won’t need to hide ourselves away and can be respected in our own right!");
		output("”</i> Ula punches one fist into the other. <i>“");
		if(!korgiTranslate()) output("That’s what Ula do.");
		else output("That’s what I’m doing.");
		output("”</i>");
		output("\n\nYou rock back in surprise. She’s quite the progressive little firecracker!");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Want talk something else?");
		else output("Want to talk about something else?");
		output("”</i> Ula strokes your knee affectionately.");
	}
	flags["ULAS_ROLE"] = 1;
	processTime(10);
	addDisabledButton(2,"Ula’s Role","Ula’s Role","You already spoke of this.");
}

//Other Tribes
public function otherTribesTalkarydooda():void
{
	clearOutput();
	showUla();
	output("<i>“How many other tribes does Uveto have?”</i>");
	output("\n\nUla shrugs. <i>“");
	if(!korgiTranslate()) output("How many stars in sky? Too many for one to know. Many. Uveto bigger than pregnant korg appetite, though less now than was.");
	else output("How many stars are in the sky? Too many for any one person to know. Very many. Uveto’s bigger than a pregnant korg’s appetite, though there are less clans now than there were.");
	output("”</i> She taps her palm. <i>“");
	if(!korgiTranslate()) output("Some milodan-killed. Some driven to snow by sparkle-mining.");
	else output("Some were milodan-killed. Some were driven to the snows by mining.");
	output("”</i> She punches her fist into her hand. <i>“");
	if(!korgiTranslate()) output("Small clans join together. Make bigger, stronger clan. This new. Korgonne no like much many snouts in one burrow, but do anyway. Better than lose war or starve.");
	else output("Smaller clans joined together to make bigger, stronger clans. This is a new thing. Korgonne don’t like so many snouts in one burrow, but we do it anyway. Better than losing a war or starving.");
	output("”</i>");
	output("\n\nYou ask if her clan is such a conglomerate.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Nope! Korg’ii clan much success. " + (ulaChief() ? "father-Chief":"Chief") + " smart. Hide. Steal from dumb aliens.");
	else output("Nope! Korg’ii clan has had much success. Our " + (ulaChief() ? "father-Chief was":"Chief is") + " smart. We hide and steal from the dumber aliens.");
	output("”</i> The " + (ulaChief() ? "chieftess":"princess") + " pats your knee apologetically. <i>“");
	if(!korgiTranslate()) output("No offense. We not take so much as other clans. Not draw alien ire. Better hidden too. Right under nose. Secret entrance make tough find.");
	else output("No offense. We don’t take as much as many other clans. We don’t want to draw the other aliens’ ire. We’re better hidden too. Right under your noses. The secret entrance makes us tough to find.");
	output("”</i> She smiles proudly.");
	output("\n\n<i>“But other clans steal more?”</i>");
	output("\n\nUla chitters with mirth. <i>“");
	if(!korgiTranslate()) output("Many more! Sparkle-Claws pride selves on taking from aliens. Roam far from hold. Use magic belt, stay warm. Have flash-shooters, bang-sticks, and other core-magic. Strong fighters.");
	else output("Much more! Sparkle-Claws pride themselves on taking things from aliens. They roam far from their hold, using those magic belts to stay warm. They even have flash-shooters, bang-sticks, and all kinds of other core-magic. Formidable fighters!");
	output("”</i> She flexes a pudgy bicep. <i>“");
	if(!korgiTranslate()) output("Scare aliens. No try mine territory. Tech make strong. Stronger than Korg’ii.");
	else output("They scared off the aliens. Nobody tries to mine their territory. Tech makes them strong. Stronger than the Korg’ii.");
	output("”</i> The dog-girl’s expression becomes pensive. <i>“");
	if(!korgiTranslate()) output("But not know core-magics. Not keep tech strong. Rust-breaking or worse. Always needing more stealings.");
	else output("But they don’t know core-magics. They don’t keep their tech strong. Rust damages it or worse. Always they need to steal more.");
	output("”</i>");
	output("\n\nYou nod thoughtfully. Without knowledge of how to maintain a weapon, especially in these harsh climes, it wouldn’t last long.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Some clans no use core-magic. Only korgonne-craft. Those clans dumb. Do worst of all, unless very far from sky-spire,");
	else output("Some clans don’t use any core-magic - only korgonne-craft. Those clans are dumb. They do the worst of all, unless very far from the sky-spire,");
	output("”</i> the fluffy " + (ulaChief() ? "chieftess":"princess") + " explains. <i>“");
	if(!korgiTranslate()) output("Wyrm-Murder clan only exception. Strong people. Hunt frostwyrms. All hunters wear full suit of scales. Even stops some core-bangs.");
	else output("Wyrm-Murder clan are the only exception. A strong people. They hunt frostwyrms. All their hunters have full suits of frostwyrm scale. It even stops some core-bangs.");
	output("”</i>");
	if(pc.armor is FrostbaneMail || pc.armor is FrostbanePlate || pc.armor is FrostbaneBikini) output(" She runs her fingers over your armor. <i>“You know, yes?”</i>");
	else 
	{
		output(" She sighs heavily. <i>“");
		if(!korgiTranslate()) output("Korg’ii only have few, but know how make, if scales getted.");
		else output("Korg’ii Clan only has a few, but we can make it, if someone has the scales.");
		output("”</i>");
	}
	output("\n\n<i>“Impressive.”</i>");
	output("\n\nUla grins. <i>“");
	if(!korgiTranslate()) output("Good see korgonne wow alien.");
	else output("Good to see we korgonne can wow you.");
	output("”</i> She ");
	if(pc.tallness >= 66) output("reaches up to ");
	output("boop");
	if(pc.tallness < 66) output("s");
	output(" you on the nose. <i>“");
	if(!korgiTranslate()) output("Have magic of own. Now, you want talk something else? Or want snuggle?");
	else output("We have magic of our own. Now, do you want to talk about something, or snuggle in?");
	output("”</i>");
	flags["ULA_OTHER_TRIBES"] = 1;
	processTime(10);
	addDisabledButton(3,"Other Tribes","Other Tribes","You’ve already had this conversation.");
}

//Explain: Guns
public function talkAboutGunsWithUla():void
{
	clearOutput();
	showUla();
	output("<i>“Why don’t I tell you about guns?”</i>");
	output("\n\n<i>“Boomers?”</i> Ula’s ears perk up, and her eyes brighten. <i>“Want know.”</i> Her tail wags hard, slapping your back as she leans in, locking her arm with yours.");
	output("\n\nYou start off by giving a basic explanation of gunpowder weapons: what gunpowder is and how it propels the bullet, the different kinds of actions and shells that exist.");
	output("\n\nUla often interrupts you with specific questions. She asks why so many different techniques of measuring bullets and competing specifications exist, why some shells contain single bullets and others explosive, and why it’s called gunpowder when modern formulations are more of a paste.");
	output("\n\nYou answer them all to the best of your ability, then go over basic maintenance. Should she get her hands on an old-style weapon, you’d like her to keep it in good shape after all.");
	output("\n\nPulling cloths and furs from a nearby container, Ula assembles herself a primitive cleaning kit. She meticulously arranges them, then sets them aside after making a note to acquire some oil. <i>“Know so much.”</i>");
	//Bimbo
	if(pc.isBimbo()) output("\n\nYou giggle at that. <i>“Just like sex, you gotta like, have proper lubrication!”</i>");
	//Bro
	else if(pc.isBro()) output("\n\nYou let out a pleased grunt.");
	//Else not hard
	else if(!pc.isAss()) output("\n\nYou wave your hand dismissively. <i>“It only seems that way because I’ve been exposed to it my entire life. I am sure there are many techniques your tribe knows that would stump me at first blush.");
	//Hard
	else output("\n\nYou snort. <i>“I know what I’ve been around my whole life. Same as you.");
	//Merge hard/non-hard
	if(!pc.isBimbo() && !pc.isBro()) output(" Keep an open mind, and you’ll be surprised what you can learn.”</i>");
	//Merge all
	output("\n\nThe barbarian " + (ulaChief() ? "chieftess":"princess") + " beams ");
	if(pc.tallness >= 66) output("up ");
	output("at you. <i>“");

	if(!korgiTranslate()) output("Ula good stupid. Much learnings. Talk more? Tell of more core-magic?");
	else output("Exactly. I don’t know that much yet, but I’m learning fast. Want to talk more? Tell me of more core-magics?");
	if(ulaChief())
	{
		if(!korgiTranslate()) output(" Ula share with tribe. Make Pyrite guns last longer.");
		else output(" I’ll be sharing this with the tribe. Hopefully we can make the Pyrite-issue guns last longer.");
	}
	output("”</i>");
	flags["ULA_GUN_TALK"] = 1;
	processTime(10);
	addDisabledButton(4,"Explain Guns","Explain Guns","You already spoke of this.");
}

//Explain: Electricity
public function explainElectricityToUla():void
{
	clearOutput();
	showUla();
	output("<i>“I’d like to explain electricity to you.”</i>");
	output("\n\nUla seems confused. <i>“Elec...tit-city?”</i>");
	output("\n\n<i>“Sparks? Lightning?”</i> You jerk your hand down toward the ground and mimic the sound of thunder.");
	output("\n\n<i>“Oooooh,”</i> the curvaceous cutie mouths. <i>“");
	if(!korgiTranslate()) output("You mean zaps!");
	else output("You mean shocks!");
	output("”</i>");
	output("\n\n<i>“Suuure.”</i> You avoid getting into the theory of it.");
	if(pc.isBimbo()) output(" Not like you care to remember. Booooring!");
	output(" Instead you focus on the practical: conductors and insulators, explaining how it can travel through certain metals with ease but can be stopped by a thin layer of rubber or certain hides.");
	output("\n\nUla’s face is a studious mask, but she interrupts you before your lecture can get too far. <i>“");
	if(korgiTranslate()) output("How do you get it? How do you store it?");
	else output("How get? How pocket zaps?");
	output("”</i>");
	output("\n\nOnce more, you try to keep it simple. Rather than get into the theory of how various generators work, you tell her about solar panels and how they capture light - sunpower - and turn it into electrical power, carrying it via rubber-wrapped wires to charge a chemical power cell. You compare the battery to a jar and the wires to a pipe, slowly filling it so that it can be carried around and used elsewhere.");
	output("\n\nThis seems to placate the ever-curious Ula for now, though you have no doubt that she’d love a chance to understand it in more detail.");
	output("\n\n<i>“Thanks-having!”</i> The fluffy dog-girl hugs you tight. <i>“");
	if(!ulaChief())
	{
		if(!korgiTranslate()) output("Learn much. Maybe hunters let Ula have zap-gun that no zap no more. Then just need find charge-battery or so-lar paneling for own use. And warm-belt! Warm-belt can work again with elec-tric-it-y-filled battery?");
		else output("I learned so much. Maybe some hunters will let me have a zap-gun that doesn’t zap any more. Then I just need to find a charged battery or so-lar paneling for me to use... And a warm-belt!");
	}
	else
	{
		if(!korgiTranslate()) output("Learn much. Hunters not need throw out zap-gun with no more zaps. Just need find charge-battery or so-lar paneling for good use. And warm-belt! Warm belt can work again with elec-tric-it-y-filled battery?");
		else output("I learned so much. Our hunters won’t need to throw out zap-guns that don’t zap any more. I just need to have them find some charged batteries or a so-lar panel to charge them back up. We can even make the warm-belts that have gone cold work again!");
	}
	output("”</i>");
	output("\n\n<i>“Yes.”</i>");
	output("\n\n<i>“Oooooh.”</i> Mischief dances in the korgonne’s eyes. <i>“");
	if(!korgiTranslate()) output("Much learn. Many thanks. Other talks now?");
	else output("I learned so much. Many thanks! Want to talk about something else now?”</i>");
	flags["ULA_ELECTRICITY_TALK"] = 1;
	processTime(10);
	addDisabledButton(5,"Exp:Electricity","Explain: Electricity","You already discussed this.");
}

//Explain: Savicite
public function talkAboutSavicite():void
{
	clearOutput();
	showUla();
	output("<i>“Do you know about Savicite?”</i>");
	output("\n\n<i>“Savicite...”</i> Ula mouths. <i>“");
	if(korgiTranslate()) output("That’s your word for the green sparkly rocks?");
	else output("Alien word for green sparkles?");
	output("”</i>");
	output("\n\nYou nod.");
	output("\n\nUla looks at you cautiously. <i>“");
	if(korgiTranslate()) output("We know your people want it. We know they offered credits for them. Core silliness. [pc.name]. You’re not here to steal some, are you?")
	else output("Know aliens want. Knowing cretids offered for. Kedrits? Core silliness. [pc.name] not here to steal?");
	output("”</i>");
	output("\n\nYou assure her that you aren’t here to steal from her tribe");
	if(pc.isAss()) output(", however tempting the idea may be");
	output(".");

	output("\n\n<i>“Good.”</i> Ula takes your hand and squeezes it gently, kneading your palm in her padded fingers. <i>“");
	if(korgiTranslate()) output("Savicite is a pretty rock. Makes for good jewelry after being refined. Craftskorg made me these.");
	else output("Savicite pretty rock. Make good jewelry after refine. Crafty-korg make me these.");
	output("”</i> She jingles several green-tinged bracelets in front of you, then lifts a necklace with a brighter piece in the center. <i>“");
	if(korgiTranslate()) output("Males think jewelry is silly, but we females know better. It makes and pretty... and more. Can I tell you a secret?");
	else output("Male korg thinking jewelry silly, but females knowing better. Make pretty! And can tell secret?");
	output("”</i>");
	output("\n\n<i>“Sure.”</i>");
	output("\n\nShe ");
	if(pc.tallness < 66) output("leans close");
	else output("all but crawls up your shoulder");
	output(" to whisper in your ear. <i>“");
	if(!korgiTranslate()) output("Ula thinking Savicite help give breed-urges.");
	else output("I think Savicite helps give us our breeding urges.");
	output("”</i> She rubs herself against you, fluffy fur warm and soft. You’re very conscious of the weight of her luscious breasts on your side. <i>“");
	if(!korgiTranslate()) output("Make want share warm much.");
	else output("Makes us want to share warmth, very much.");
	output("”</i> A paw lands in your lap. <i>“");
	if(!korgiTranslate()) output("Maybe korg not make puppies if no Savicite.");
	else output("Maybe Korg wouldn’t make puppies, if not for Savicite.");
	output("”</i> Her tongue lolls out. <i>“");
	if(!korgiTranslate()) output("Males no wear and not want much sex till girl-korg rubs nose in it. Maybe girls not want much sex either without green-sparkles?");
	else output("Males don’t wear any, and they don’t want sex much until a girl-korg rubs their noses in it. Maybe girls wouldn’t want sex either without it?");
	output("”</i>");
	output("\n\nIt sounds like she knows about some of its more... recreational properties.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Why aliens wanting so bad");
	else output("Why do you aliens want it so bad");
	output("?”</i> Her nipples are firm but not too firm. Ula’s thirst for knowledge remains greater than her lust, for now. <i>“");
	if(!korgiTranslate()) output("Knowing aliens have own magic breeding potions and pink-cloud stuff. Hear of stuff call Throbb! Even korg boy want sex with Throbb. Not need Savicite!");
	else output("I know aliens have their own magic breeding potions and pink-cloud stuff. I’ve heard about Throbb! Even korg boys want sex after using Throbb. You don’t need Savicite at all!");
	output("”</i>");
	output("\n\nYou explain its usage in a myriad of industries, everything from helping to make those aphrodisiacs to starship fuel and light drives. Without Savicite, the universe as a whole would be butt-fucked.");
	output("\n\nUla pulls her hands back and sighs. <i>“");
	if(!korgiTranslate()) output("Aliens not stop wanting then");
	else output("Aliens won’t stop wanting it then");
	output("?”</i>");
	output("\n\n<i>“No.”</i> You shake your head sadly. <i>“I don’t think so.”</i>");
	output("\n\n<i>“Feces!”</i> The chieftain’s daughter slouches, any erotic energy in the room dissipating with her exclamation.");
	output("\n\nYou stroke her back and offer, <i>“Maybe someday... not too far from now, a new alien will be in charge of the mining. One who won’t be a threat to your people.”</i>");
	output("\n\nUla smirks. <i>“");
	if(!korgiTranslate()) output("Maybe. While wishing, me wanting ship-of-stars. See universe for self. Also smarter tribe.");
	else output("Maybe. While we’re wishing, I want a starship to see the universe for myself. Also a smarter tribe.");
	output("”</i> She nods sharply. <i>“");
	if(!korgiTranslate()) output("Second one better wish. Maybe other-talk now?");
	else output("The second one is a better wish. Maybe we could talk about something else now?");
	output("”</i>");
	flags["ULA_SAVICITE_TALK"] = 1;
	processTime(10);
	addDisabledButton(6,"Exp:Savicite","Explain: Savicite","You already spoke of this.");
}

//Explain: Credits
//Unlocked via Savicite convo
public function ulaCreditsTalk():void
{
	clearOutput();
	showUla();
	output("<i>“So credits...”</i>");
	output("\n\n<i>“Cred-its,”</i> Ula replies haltingly. <i>“");
	if(korgiTranslate()) output("I’ve heard of those. Why do core-folk care about them so much?");
	else output("Am hearing of. Why core-folk care so much?");
	output("”</i>");
	output("\n\nYou explain their convenience for trade and usefulness over the bartering systems most peoples use. Credits are merely a placeholder for valuable goods that any other coreward merchant would accept. Their ubiquitous acceptance is the source of their value. Anyone that wishes to trade with aliens would want to use them.");
	output("\n\nUla taps her chin. <i>“");
	if(!korgiTranslate()) output("So all alien take credits for trade-good?");
	else output("Every species will trade for them? At the same value?");
	output("”</i>");
	output("\n\nYou nod. <i>“Pretty much. Except for people like the korgonne who don’t really talk to the rest of the galaxy.”</i>");
	output("\n\nBrows knitting in thought, the nude " + (ulaChief() ? "chieftess":"princess") + " asks, <i>“");
	if(!korgiTranslate()) output("And how muching credits for bang-sticks?");
	else output("And how many credits for bang-sticks?");
	output("”</i>");
	output("\n\nYou explain that there are many types, some basic ones for five or six hundred credits, but decent ones run well into the six or seven thousands.");
	output("\n\n<i>“Mmmhmmm...”</i> Ula taps her chin, running the numbers in her head. <i>“");
	if(korgiTranslate()) output("I think I can convince the merchants of the tribe to use credits, so long as they’re chits, not just numbers on a screen.");
	else output("Thinking can convince merchants of tribe use credits, so long as chits, not numbers on tech-screen.");
	output("”</i>");
	output("\n\n<i>“Really?”</i>");
	output("\n\nUla nods. <i>“");
	if(korgiTranslate()) output("It won’t be a good deal. They’ll want big profits for the trouble, and I’ll need to " + (ulaChief() ? "shout down the elders":"convince the elders") + " to allow a brave korg to trade the credits back to your people.”</i> She all but bounces in excitement. <i>“Give me a day. Then you can trade, I’m thinking.");
	else output("Not be good deal. Will want big profit for trouble, and need " + (ulaChief() ? "yelling at":"convince") + " elders send brave korg for trade credits with aliens." + (!ulaChief() ? " Chieftain too.":"") + "”</i> She all but bounces in excitement. <i>“Give day. Then can trading, me thinking.");
	output("”</i>");
	output("\n\n<i>“Wow... thanks, Ula.”</i> You rub her shoulder fondly.");
	output("\n\nThe stacked woman snorts. <i>“");
	if(korgiTranslate()) output((!ulaChief() ? "Thank me if I succeed. ":"") + "Check with the merchants tomorrow, but in the meantime, keep talking to me. Unless you don’t want to talk? Maybe you’d like to share some warmth?");
	else output((!ulaChief() ? "Be thanking if succeeding. ":"") + "Talk merchants tomorrow. But talk me now. Unless no want talk now? Maybe want share warm?");
	output("”</i> She snuggles closer, looking up at you with big, luminous eyes.");
	if(flags["ULA_CREDIT_TALK"] == undefined) flags["ULA_CREDIT_TALK"] = GetGameTimestamp();
	processTime(8);
	addDisabledButton(7,"Exp:Credits","Explain: Credits","You already discussed this!");
}

public function korgiiCredits():Boolean
{
	return (flags["ULA_CREDIT_TALK"] != undefined && flags["ULA_CREDIT_TALK"] + (60 * 24) < GetGameTimestamp());
}

//ULA PREG AS DONE BY UPCASTDRAKE STARTS HERE

//Return value is true if she gets impregnated, else false - not necessarily used for anything but :shrug:
public function tryKnockUpUla():Boolean
{
	var x:Number;
	
	//If pc is infertile or Ula is already preggo return false
	if(pc.virility() == 0 || flags["ULA_PREG_TIMER"] != undefined) return false;
	
	//Average of pc's virility and Ula's fertility which is hard-coded 3.00 for now
	x = (pc.virility()+3.00)/2;
	
	//Fancy math function I made that gives a nice pregnancy chance curve
	if(rand(10000) <= (1 - 1.15*Math.exp(-0.38*x))*10000)
	{
		//succesful impregnation
		flags["ULA_PREG_TIMER"] = 0;
		pc.clearRut();
		
		//Time to figure out baby state info i.e. how many
		
		//Different fancy math functions to figure out how many babby
		//4 Babies!
		if(rand(10000) <= ((Math.atan(x - 2) + Math.PI/2)/Math.PI)*10000)
		{
			flags["ULA_NUM_BABIES"] = 4;
		}
		//3 Babies!
		else if(rand(10000) <= ((Math.atan(x - 1) + Math.PI/2)/Math.PI)*10000)
		{
			flags["ULA_NUM_BABIES"] = 3;
		}
		//2 Baby!
		else
		{
			flags["ULA_NUM_BABIES"] = 2;
		}
		
		return true;
	}
	else return false;
}

//true if she's pregnant, else false
public function ulaIsPregnant():Boolean
{
	return flags["ULA_PREG_TIMER"] != undefined;
}

//This is where all the time-based procs are processed - processes on a per-day basis
public function processUlaPregEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if(ulaIsPregnant())
	{
		//update the timer
		flags["ULA_PREG_TIMER"] += totalDays;
		var extraDays:int = 0;
	
		//Ideally birth will be triggered by the PC proccing the birth scene, otherwise she's gotta blow sometime
		if(flags["ULA_PREG_TIMER"] > 185)
		{
			extraDays = (flags["ULA_PREG_TIMER"] - 186);
			var birthTimestamp:int = (GetGameTimestamp() + deltaT - (flags["ULA_PREG_TIMER"] * 24 * 60) + (186 * 24 * 60));
			//EMAIL SHIIIIIIIIIIIIIIIIIIIIIT
			resendMail("ula_birth", birthTimestamp);
			ulaBirth(birthTimestamp);
		}
	}
	
	//if Ula's given birth increment the "time since last birth" timer
	if(flags["ULA_BIRTH_TIMER"] != undefined) flags["ULA_BIRTH_TIMER"] += extraDays;
}

public function ulaPregEmailText():String
{
	var eText:String = "";
	if(flags["ULA_TOTAL_KIDS"] == undefined)
	{
		//It's her first time shitting kids and you couldn't even be there, what's wrong with you
		eText += "[pc.name]! Hope am using right. Hunter Korg get core-magic tablet so can writing to you. Old owner not missing it. Hunter make sure. She gived much warm, but not important. Important thing happen! Ula have " + flags["ULA_NUM_BABIES"] + " puppies! No worry, they perfect. Cute korg with floppy ears and good fang-smiles. Already strong. Take all Ula milk and more. Already can walking! Your pups all over Korg’ii Hold, chasing other Korg-moms for milk. Such energy!";
		eText += "\n\nAm missing you. Come visit soon? Core stories the best. In meantime, here is picture of Ula now. You make good mommy.";
		eText += "\n\n<i>Attached is a picture of the now-motherly korgonne with her tits hanging out, dripping milk.</i>";
	}
	else
	{
		//Alright at this point it's routine can't really blame you
		eText += "[pc.name]! Ula have more puppies! Never just one. Always many. Core-seed such strong, make Ula’s belly fattest in tribe. When return? Missing Steele-snuggles! Can give you more pups, if you wanting...";
		eText += "\n\n<i>Attached is a picture of your MILFY korgonne breeding buddy with her tits hanging out and gushing milk. She’s quite the productive mommy.</i>";
	}
	
	return doParse(eText);
}

//The purely game-state centric parts of birth
public function ulaBirth(birthTimestamp:int = -1):void
{
	if(birthTimestamp < 0) birthTimestamp = GetGameTimestamp();
	
	StatTracking.track("pregnancy/ula sired", flags["ULA_NUM_BABIES"]);
	StatTracking.track("pregnancy/total sired", flags["ULA_NUM_BABIES"]);
	
	if(flags["ULA_TOTAL_KIDS"] == undefined) flags["ULA_TOTAL_KIDS"] = 0;
	flags["ULA_TOTAL_KIDS"] += flags["ULA_NUM_BABIES"];
	flags["ULA_PREG_TIMER"] = undefined;
	flags["ULA_THIS_PREG_MET"] = undefined;
	
	//This tracks how long it's been since she last gave birth for the after birth scenes and such
	flags["ULA_BIRTH_TIMER"] = 0;
	//This tracks how many babies she had last pregnancy in order to know how many pups she's nursing and stuff
	flags["ULA_BABIES_NURSING"] = flags["ULA_NUM_BABIES"];
	
	flags["ULA_NUM_BABIES"] = undefined;
}

//Tracks how big Ula's preggo belly is
//0 - not pregnant or no belly/less than 30 days preg
//1 - little belly/less than 75 days preg
//2 - big belly/more than 75 days preg
public function ulaPregBelly():int
{
	if(!ulaIsPregnant() || flags["ULA_PREG_TIMER"] <= 30) return 0;
	else if(flags["ULA_PREG_TIMER"] <= 75) return 1;
	else return 2;
}

public function ulaPregApproach():void
{
	clearOutput();
	showUla();
	clearMenu();
	
	//Reveal
	if(flags["ULA_THIS_PREG_MET"] == undefined)
	{
		//You can use flags["ULA_TOTAL_KIDS"] to determine if she's been pregnant before, if it's undefined she's got a virgin womb, else she's shot some out
		switch(ulaPregBelly())
		{
			case 1:	
				//insert little-belly reveals here
				if(flags["ULA_TOTAL_KIDS"] == undefined)
				{
					output("<i>“[pc.name]!”</i> Ula chirps. <i>“");
					if(!korgiTranslate()) output("You be daddy soon.");
					else output("You’re going to be a daddy soon.");
					output("”</i> She grabs your hand and places it on her tummy, which she resumes stroking. <i>“");
					if(!korgiTranslate()) output("Medicine Korg say Ula strong with pups. Very fertile.");
					else output("The medicine Korg says I’m strong with pups - very fertile.");
					output("”</i> Her grin couldn’t be any wider. <i>“");
					if(!korgiTranslate()) output("I not tell her alien father. Not tell anybody but you. Our pups be strong, but not want treating badly from father-knowledge.");
					else output("I didn’t tell her that an alien was the father. Not telling anybody but you. Our pups will be strong, but I don’t want them treated badly because of their heritage.");
					output("”</i> She casts her eyes down apologetically. <i>“");
					if(!korgiTranslate()) output("Hope okay.");
					else output("I hope that’s okay.");
					output("”</i>");
					output("\n\nYou assure her that you trust her decision on how to raise your future young. It’s not like you’ll be able to spend all your time on Uveto at the moment.");
					output("\n\n<i>“");
					if(!korgiTranslate()) output("Pleasings");
					else output("Good");
					output("!”</i> Ula continues to rub her belly, and you join her for a few moments, marveling at the knowledge that she’ll soon give birth to the new life you created together.");
				}
				else
				{
					output("<i>“[pc.name]!”</i> Ula chirps. <i>“");
					if(!korgiTranslate()) output("You be daddy again.");
					else output("You’re a daddy again.");
					output("”</i> She grabs your hand and places it upon her fertile tummy, which she resumes stroking. <i>“");
					if(!korgiTranslate()) output("Medicine korg say Ula meant be mommy. Body make pups so easy should just stay pregnant all times!");
					else output("The medicine Korg says I’m meant to be a mother. My body makes pups so easy she thinks I should just be pregnant all the time.");
					output("”</i> Her grin couldn’t be any wider. <i>“");
					if(!korgiTranslate()) output("You do that, right? You keep Ula happy-pregnant after give birth? Keep belly round and face smile.");
					else output("You’ll do that, right? Keep me happily pregnant after this birth? Make my belly so round I can’t help but smile.");
					output("”</i> She casts her eyelashes low and licks her lips. <i>“");
					if(!korgiTranslate()) output("Alien-mate come through deepest snow to give Ula-wife more babies.");
					else output("Come through the deepest snow to give your Korg’ii wife more babies?");
					output("”</i>");
					output("\n\nYou assure her that you’ll do your best whenever you’re in the neighborhood.");
					output("\n\n<i>“");
					if(!korgiTranslate()) output("Pleasings!");
					else output("Good!");
					output("”</i> Ula continues to rub her belly, and you join her for a few moments, marvelling at the knowledge that she’ll be giving birth to yet another set of your pups.");
					//Fen note - recheck talk scenes and sex scenes to make compatible with mild preggomancy. No huge insertions. Mention of cervix closure, for ex.
				}
				break;
			case 2:	
				//insert big-belly reveals here
				if(flags["ULA_TOTAL_KIDS"] == undefined)
				{
					output("<i>“[pc.name]!”</i> Ula calls, stretching toward you.");
					output("\n\nYou rush to the pregnant korg’s side. Her belly is absolutely enormous on her small frame. Just walking around must be getting difficult for her.");
					output("\n\n<i>“");
					if(!korgiTranslate()) output("Ula pregnant!");
					else output("I’m pregnant!");
					output("”</i> She beams up at you like it’s the greatest thing in the world. <i>“");
					if(!korgiTranslate()) output("You daddy! Made pups! Lots of pups.");
					else output("You’re a daddy! You made pups! Lots of pups.");
					output("”</i> Grabbing your hand, the pregnant " + (ulaChief() ? "chieftess":"princess") + " places it on her baby-fattened middle. Her own happily drums at the taut skin, a motion you rapidly feel repeated from other side. <i>“");
					if(!korgiTranslate())
					{
						output("Smart pups already learn belly-drum!");
						if(pc.isBimbo()) output(" Must have got Ula-brain. [pc.name] is body-smart, not brain-smart.");
					}
					else
					{
						output("They’re so smart. They’ve already learned how to play the belly-drum!");
						if(pc.isBimbo()) output(" They must have gotten it from me. You’re more body-smart than brain-smart.");
					}
					output("”</i> She smiles bashfully. <i>“");
					if(!korgiTranslate()) output("Proud?");
					else output("Are you proud?");
					output("”</i>");
					output("\n\nYou assure her that you are so proud, both of her and her unborn children.");
					output("\n\n<i>“");
					if(!korgiTranslate()) output("Good. Ula not tell anybody you daddy. Not tell pups either.");
					else output("Good. I’m not going to tell anyone you’re the father. Not the pups either.");
					output("”</i> She seems genuinely saddened to say it. <i>“");
					if(!korgiTranslate()) output("Not want tribe treat different. Girl hunters having mystery pups too. All tribe still love. This way no harm. No hurt-words from fool-korg.");
					else output("I don’t want the tribe to treat them differently. Female hunters have mystery pups, and the tribe still loves them. This way they won’t get hurt by mean words from fool korgonne.");
					output("”</i>");
					output("\n\nYou hug her and mouth, <i>“It’s okay.”</i>");
					output("\n\nUla nods and wipes a tear from her eye. <i>“");
					if(!korgiTranslate()) output("Ula know. Still... you daddy now!");
					else output("I know. Still... you’re a daddy now!");
					output("”</i> She grabs you by the neck and pulls your head into her tits. <i>“");
					if(korgiTranslate()) output("You gave me mommy-boobs! Feel all that milk?");
					else output("Give Ula mommy-boobs! Feel milk?");
					output("”</i> She squishes them on your head, and you’re suddenly reminded of the strength of her pheromones by the little bit wafting from between her thighs.");
					output("\n\nYou nod.");
					output("\n\nReleasing you, the pregnant puppy-girl bounces her tits and brazenly eye-humps her babies’ future daddy. <i>“");
					if(!korgiTranslate()) output("Do favor for mommy Ula");
					else output("Do a favor for me");
					output("?”</i> She gestures at her thighs. <i>“");
					if(!korgiTranslate()) output("Need tongue-in-thighs. All time. As much as possible.");
					else output("Eat me out. I need your tongue in my thighs as much as possible. All the time.");
					output("”</i> Her lips blush a darker blue. <i>“");
					if(!korgiTranslate()) output("But if want just talk, supposing can wait for toy-use.");
					else output("But if you want to talk, I suppose I can wait to use a toy.");
					output("”</i>");
				}
				else
				{
					//Repeat preggo reveal
					output("<i>“[pc.name]!”</i> Ula calls, stretching toward you.");
					output("\n\nYou rush to the pregnant korg’s side. With her belly so swollen, getting around must be getting tough for her.");
					output("\n\n<i>“");
					if(!korgiTranslate()) output("Ula pregnant again");
					else output("I’m pregnant again");
					output("!”</i> She beams up at you like it’s the greatest thing in the world. <i>“");
					if(!korgiTranslate()) output("You daddy! Made more pups! Lots more pups.");
					else output("You’re a daddy! You made more pups... lots more pups.");
					output("”</i> Grabbing your hand, the pregnant " + (ulaChief() ? "chieftess":"princess") + " places it on her baby-fattened middle. Her own happily drums at the taut skin, a motion you rapidly feel repeated from other side. <i>“");
					if(!korgiTranslate())
					{
						output("Smart pups already learn belly-drum!");
						if(pc.isBimbo()) output(" Must have got Ula-brain. [pc.name] is body-smart, not brain-smart.");
					}
					else
					{
						output("They’re so smart. They’ve already learned how to play the belly-drum!");
						if(pc.isBimbo()) output(" They must have gotten it from me. You’re more body-smart than brain-smart.");
					}
					output("”</i> She smiles proudly. <i>“");
					if(!korgiTranslate()) output("You give another litter after this?");
					else output("Will you give me another litter after this?");
					output("”</i>");
					output("\n\nYou assure her that you’ll knock her up as often as she’d like.");
					output("\n\n<i>“");
					if(!korgiTranslate()) output("Good. Medicine-Korg say Ula is mommy-korg. Body make pups so easy, should just stay pregnant all the time!");
					else output("Good. The medicine Korg says I’m meant to be a mother. My body makes pups so easy that I should just stay pregnant all the time!");
					output("”</i> Her grin is infectious. <i>“");
					if(!korgiTranslate()) output("Keep you busy in Korg’ii Hold, not have time for much else.");
					else output("You’ll be so busy keeping me pregnant, you won’t have time for much else.");
					output("”</i> She gestures between her legs. <i>“");
					if(!korgiTranslate()) output("Have free time for warm-licking? Ula so wet </i>all the time<i>. Need alien tongue cool down heart-fire!");
					else output("Do you have a moment for to give me a little lick? I’m so wet </i>all the time<i>. I need your tongue to cool it down!");
					output("”</i> Shifting a little closer in her bed, she bats her eyelashes. <i>“");
					if(!korgiTranslate()) output("Only [pc.name]-husband calm Ula down. Tried all toys. No work. Need tonguings. Lots tonguings.");
					else output("Only you can calm me down. I’ve tried my toys. They don’t work. I need your tongue. Lots of your tongue.");
					output("”</i>");
				}
				break;
		}
		flags["ULA_THIS_PREG_MET"] = 1;
		
		//You'll need to handle any preg sex or preg talk options in ulaMenu()
		ulaMenu();
	}
	else
	//Already know she's preggo
	{
		//Fen note: modded ula approach for preggo support :3
		ulaApproach();
	}
}

public function ulaBirthHook():void
{
	clearOutput();
	clearMenu();
	showUla();
	//INSERT BIRTHING SCENE HERE
	//Ula always gives birth to a minimum of 2 babus.
	//PC is in the room:
	output("Ula’s eyes go wide as liquid gushes between her thighs. The look on her face is not one of pleasure but one of surprise. <i>“<b>");
	if(!korgiTranslate()) output("Babies coming! Get medicine korg!");
	else output("The babies are coming! Get the medicine korg!");
	output("</b>”</i>");
	output("\n\nRight! You rush out of the room to seek the services of the tribe’s healer. She’s easy to locate, once you make the situation clear to the nearest native, and a short time later, you find yourself standing in the hall, forced to listen to Ula giving birth through the door. Judging from the sounds you’re hearing, it isn’t as painful as a typical a typical terran birth. In fact, the whole process takes less than thirty minutes according to your Codex’s chronometer.");
	if(ulaChief()) currentLocation = rooms[currentLocation].southExit;
	else currentLocation = rooms[currentLocation].northExit;
	generateMap();
	//First time:
	if(flags["ULA_TOTAL_KIDS"] == undefined) 
	{
		output("\n\nYou’re reading an article on the birthing habits of korgonne women when the medicine woman steps out with a basket full of soiled bedding. She smirks knowingly at you. <i>“");
		if(!korgiTranslate()) output("Birthing done. Ula natural mommy. Go in, see pups, and not worry. I no tell.");
		else output("The birthing is done. Ula’s a natural mommy. Go in, see your pups, and don’t worry. I won’t tell anyone.");
		output("”</i> After a pause, she adds, <i>“");

		if(!korgiTranslate()) output("Maked " + num2Text(flags["ULA_NUM_BABIES"]) + " pups in one breeding... Maybe Ula right. Maybe korgonne need core-strengths.");
		else output("She made " + num2Text(flags["ULA_NUM_BABIES"]) + " pups in one breeding. Maybe Ula’s right. Maybe we need a little core strength.");
		output("”</i>");
		output("\n\nUla will be pleased to hear that. It sounds like you’re a daddy.");
	}
	//Repeat
	else
	{
		output("\n\nYou’re wondering how many kids she’s going to pop out when a familiar-looking medicine woman emerges with a basket of soiled bedding and a smile. She nods to you, apparently pleased that you’ve remained through the entire birth. <i>“");
		output(StringUtil.upperCase(num2Text(flags["ULA_NUM_BABIES"])) + " pups this time.");
		output("”</i> Her eyes unconsciously flick to your crotch. A sly smile crosses her lips. <i>“");
		if(!korgiTranslate()) output("Ula right. You are good alien. Good warm-sharing and heart-love. I no tell tribe you sire, but you stay good to Ula. Girl need love, not problem.");
		else output("Ula’s right. You are a good alien. Good in bed and full of love too. I won’t tell the tribe you’re the sire, but you better stay good to Ula. She needs love, not more problems.");
		output("”</i>");
		output("\n\nYou nod, pleased that Ula’s birth went without complications.");
	}
	processTime(30);
	//This just handles flags for birth
	ulaBirth();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//BigBelly Eat Her Out
public function eatOutPregnantUla():void
{
	clearOutput();
	showUla(true);
	output("Ula looks positively ripe. From her milk-swollen breasts to the taut dome of her pregnant belly, she looks like a peach waiting to be plucked. Her thighs, naturally thick, squeeze together involuntarily as you look her over. The Korg’ii " + (ulaChief() ? "chieftess":"princess") + " whimpers looks up, unable to conceal her ice-blue nipples from your rapacious gaze. <i>“");
	if(!korgiTranslate()) output("What [pc.name] doing to Ula?");
	else output("What are you going to do to me?");
	output("”</i>");
	output("\n\nYou lick your ");
	if(pc.hasMuzzle()) output("chops");
	else output("[pc.lipsChaste]");
	output(" and prowl closer. <i>“");
	if(pc.isBimbo()) output("I’m going to snuggle into your thighs and give your pretty pregnant pussy like, a million kisses!");
	else if(pc.isBro()) output("Eating you.");
	else output("Eating you out.");
	output("”</i>");

	output("\n\n<i>“Oh.”</i>");
	output("\n\nYou pry her thighs open. It isn’t hard. The motherly-looking korgonne’s token resistance amounted to little more than a single hesitant quiver. She looks shyly to the side as you take in the sight of her gloriously engorged cunt, flushed almost purple-blue with desire. The lips are plump and coated in a more than generous layer of feminine excitement. Webs of it cling to her inner thighs, plastering her fur to the skin beneath.");
	output("\n\nUla’s nose wrinkles as she sniffs at the air. Her tongue lolls out, and her thighs open up, pulling her cuntlips apart so that you can see just how juicy the folds inside have grown. The temperature of the room rockets up a few degrees from her minty, feminine musk alone. <i>“");
	if(!korgiTranslate()) output("Ula have horny bitch smell all the time. Keep legs closed or always pussy-playing.");
	else output("I smell like a horny bitch all the time. If I don’t keep my legs closed, I’ll be playing with my pussy all day.");
	output("”</i> She rocks her hips at you, openly dripping. Spit drools from her tongue onto her tits. <i>“");
	if(!korgiTranslate()) output("Please tongue. Need tongue.");
	else output("Please start. I need your tongue.");
	output("”</i>");
	output("\n\nAs she talks, her delectable blue cunt grows closer and closer. Without even thinking about it, you’ve been drifting forward, hooked by a pheromonal siren’s call. Eyes fixated her folds, you lick your lips in anticipation. That sweet scent is making your mouth water. Her cute little clit is begging for a kiss, and the tunnel below tempting you with the promise of its ambrosial taste. Bracing your hands on her soaking-wet thighs, you take a deep breath and get ready to muff-dive in earnest.");
	output("\n\nOverwhelming, pure arousal slams into the back of your head, shoving you face-first into Ula’s syrupy quim. Your throat feels parched, and somehow you know that the only relief you’ll get is when she squirts into your maw. Instinctively, you thrust your [pc.tongue] deep to scrape at her innermost places, triggering her slit’s hormonally-overcharged glands to release a fresh wave of glistening alien goo. Cunt drenches you, saturating every scent. You tastebuds wallow in it. Your breath is flavored with it. The slickness on your cheeks compels you to dive deeper and fills your ears with the sonorous beauty of squelching pussy. Best of all, when you open your eyes, you’re treated to the sight of luscious, blue lips quivering from your touch.");
	output("\n\nUla makes to grab the back of your head, but your a press from your tongue obliterates her muscle control and leaves her a squealing, pregnant puddle. You take advantage by bearing down on her, shoving her back into her blankets, wadding them up under her ass. The rapid back-and-forth wagging of her tail drags them around to the tempo of your hard-working tongue, at least until you fold her legs up into the air and pin it underneath her cushion, girlcum-soaked butt.");
	output("\n\n<i>“Ooooh, cu-cuuuummings!”</i> Ula cries, voice devolving into a high pitched whine of pleasure. She gushes onto your tongue, her pussy a wellspring of loving lady lust. You gulp it down, and pull back to breathe, drooling spit and cunt-slobber onto Ula’s creamy thighs as you sub in a full three fingers. That just makes her screech and cum harder. Her back arches, and her gravid tummy wobbles delightfully. You kiss it as you frig her through the rest of her orgasm, adding a fourth finger before transitioning to full fist.");
	var ula:Creature = new KorgonneFemale();
	pc.girlCumInMouth(ula);
	output("\n\nUla’s eyes cross, then roll up. Her sordid tunnel clamps down around your wrist, and ribbons of girlish ejaculate spray everywhere. With your free hand, you rub one of her quivering thighs, massaging the pussy-oiled muscle into a flax complacency. Burning with desire, you withdraw your fist and plunge your face back onto Ula’s cunt, savoring the fresh, orgasmic juices");
	if(pc.hasMuzzle()) output(" as your snout burrows deep");
	output(". You flail about inside her");
	if(pc.hasLongTongue()) output(" and stretch, rubbing against her sealed cervix");
	output(" until your teeth are swimming mint-flavored love, and you feel positively dizzy.");
	output("\n\nYou don’t let something silly like the end of your furry lover’s orgasm stop you from eating her out. Not even when her thighs lock around your ears. If anything, trapping you in an enclosed space with nothing but juicy cunt to breathe makes you crave it even more. High on concentrated korgonne pheromones, it’s easy to forget about ");
	if(pc.hasCock())
	{
		output("the tightness of your [pc.cocks]");
		if(pc.balls > 1) output(" and how full your [pc.balls] feel");
	}
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina())
	{
		output("your empty, fruitlessly clenching puss");
		if(pc.totalVaginas() == 1) output("y");
		else output("ies");
	}
	if(!pc.hasGenitals()) output("your deliriously empty anus");
	output(". You nuzzle her clit lovingly and grab hold of her ass, squeezing the pliant flesh until it bulges through the gaps between your fingers. Ula’s pussy is all-consuming, devouring any other thought that might arise and replacing it with mint-flavored adoration.");

	output("\n\n<i>“Yesss,”</i> you purr into the addictive, alien folds. You gave this cunt all the seed it could ever want, and now it’s paying you back with all the hyper-concentrated desire of a woman denied penetration by her body’s gravid state. Kissing Ula’s quim, you pant into it and think back on how you wound up trapped under a soaking-wet korgonne: how even on your first meeting, you could lose yourself in her pussy’s inviting perfume, how visits that might have started with honest friendship were twisted by her fertile aroma into debauched, hard-core fucking.");
	output("\n\nMuffled, you hear Ula scream her way through another climax, and as you swallow another heaping helping of ambrosial juices, you realize that if you don’t pull away soon, you’re going to lick her until you go unconscious. That wouldn’t be so bad, would it?");
	pc.girlCumInMouth(ula);

	processTime(30);
	pc.changeLust(50);

	//Pull Away - requires WQ 50%+ //Enjoy Pussy
	clearMenu();
	addButton(0,"Enjoy Pussy",enjoyUlasPussyWhoCaresIfYouBadEnd);
	addButton(1,"Pull Away",pullAwayFromPregUlaCunt);
	if(pc.WQ() < 25) addDisabledButton(1,"Pull Away","Pull Away","You’re far too weak-willed to pull away from something so tempting.");
}

//Pull Away
public function pullAwayFromPregUlaCunt():void
{
	clearOutput();
	showUla(true);
	output("No! You have things to do. Gathering up every ounce of willpower in your body, you push away from the " + (ulaChief() ? "chieftess":"princess") + "’s slickened thighs and straighten up.");
	output("\n\nUla stares up at you in confusion, panting and tugging her nipples. <i>“");
	if(!korgiTranslate()) output("No more lick?");
	else output("You’re done licking?");
	output("”</i> Her nostrils widen as she sniffs the vaginally-tainted air. <i>“");
	if(!korgiTranslate()) output("Sooo wet.");
	else output("I’m sooo wet.");
	output("”</i> Her fingers slide into her slick honeypot and begin to stroke. <i>“");
	if(!korgiTranslate()) output("[pc.Name] so good. Make Ula horny preg-mommy! See?");
	else output("You’re so good, you turned me into a horny preg-momma.");
	output("”</i> She holds up her soaked fingers and sucks on them, her other hand tagging into massage her inflamed mound. <i>“");
	if(!korgiTranslate()) output("Ah! Understanding if have go, but...");
	else output("Ah! I understand if you have to go, but...");
	output("”</i> Ula digs the fingers of both hands into her leaky slit and pulls it open <i>“");
	if(!korgiTranslate()) output("...pussy always wanting you! Loving you!");
	else output("...my pussy is always wanting you! Loving you!");
	output("”</i> She shudders. <i>“");
	if(!korgiTranslate()) output("Lick again when have time, make Ula even more stupid-love.");
	else output("Lick me some more when you have time. I think it’ll make me even more stupidly in love.");
	output("”</i> Smiling drunkenly, she goes to work on her cunt, whimpering your name again and again.");
	output("\n\nStaggering out the door is like walk through a bed of coals, but somehow, you manage.");
	processTime(5);
	pc.changeLust(20);
	clearMenu();
	if(!ulaChief()) addButton(0,"Next",move,rooms[currentLocation].northExit);
	else addButton(0,"Next",move,rooms[currentLocation].southExit);
	//prevent ula room entering for 60m
	pc.createStatusEffect("Afraid of Ula Pussy");
	pc.setStatusMinutes("Afraid of Ula Pussy",60);
}

//Enjoy Pussy
public function enjoyUlasPussyWhoCaresIfYouBadEnd():void
{
	clearOutput();
	showUla(true);
	output("Yeah, pussy sounds real nice right about now. Using long licks, you roll your tongue from Ula’s taint, through her sodden gates, and up to the hood of her clit, then back down again. It’s a strangely satisfying way to ensure that every single taste bud is coated in a layer of sweet love. Closing your eyes, you give yourself over to the taste and the smell, the concentrated essence of korgonne pussy. It surrounds and consumes you. [pc.name] Steele the [pc.manWoman] seems a fuzzy memory next to [pc.name] the pussy-addict.");
	output("\n\nAnd you do so love pussy. Tasting it and pleasing it seems like the most important task in the galaxy. Sniffing deeply, you fill yourself with Ula’s erotic scent and do what you were meant to do - service any cunt you can smell. Sometimes, after your pregnant lover squirts a particularly voluminous spray into your mouth, you sigh contentedly. Other times you gulp in down in your eagerness to return your tongue to where it belongs.");
	output("\n\nIt’s sort of funny that after spending so long pleasing the royal korgonne, your [pc.tongue] no longer feels at home within the confines of your own mouth. It’s too clammy, not slippery enough to soothe your overheated muscle’s craving for sensual friction. So you bury it deep inside her. You slither it through clutching, squeezing folds and flex to make it push against opposing walls. With practice, you discover you can do that slow, up-and-down lapping while breathing, uncaring that it leaves you dizzy and horny");
	if(pc.hasCock()) output(", trickles of [pc.cum] oozing down your [pc.thighs]");
	output(".");
	output("\n\n<i>“Good father,”</i> Ula purrs, scooting backward, deeper into the soaked bedsheets. <i>“");
	if(!korgiTranslate()) output("Love Ula so much...");
	else output("Loving me so much...");
	output("”</i>");
	output("\n\nYou climb in after her, slavishly following the blue-tinted heaven between her thighs, darting in to lick at her clit. Of course you love her! How could you do anything else? Her mound’s beauty is stunning. Her taste is heavenly. And now that she’s pregnant, you’re pretty sure just the smell of her awe-inspiring twat is enough to make you cum");
	if(pc.isCrotchExposed()) output(" all over yourself");
	else output(" in your [pc.crotchCover]");
	output(". Murmuring, <i>“Love you,”</i> you dip your nose into her slit and slurp the drippings from her taint.");

	output("\n\nYou don’t protest when Ula guides you to roll onto your back. When she climbs onto your [pc.face], you roll your [pc.tongue] like a red carpet. Squishy asscheeks blot out your vision, and even if they didn’t, the curved dome of her baby-bloated belly would. You can feel it rest on your [pc.chest]. Things are easier this way. You can’t really move anything aside from your hands, which lovingly stroke your fluffy mate’s tummy. There’s only one thing to do: lick.");
	output("\n\nUla giggles. <i>“");
	if(!korgiTranslate()) output("[pc.name] all pussy-dumb! Can tell.");
	else output("You’ve gone all pussy-dumb! I can tell.");
	output("”</i> She grinds her slit back and forth on your face, smearing you with more of the pheromonal smell you crave. <i>“");
	if(!korgiTranslate()) output("Thinking you best breeder.");
	else output("I think you’re the best breeder.");
	output("”</i>");
	if(pc.hasCock()) output(" She reaches down and pats your cock. The touch comes as such a shock that you cum as if on command, spurting [pc.cumColor] over your belly.");
	else output(" She reaches out and pats your crotch, saddened that there’s no dick to play with at the moment.");
	output(" <i>“");
	if(!korgiTranslate()) output("Even though can’t fuck, still loving pussy. Hours and hours, still licking pussy.");
	else output("Even though we can’t fuck, you’re still loving my pussy. Hours and hours go by, and you’re still licking.");
	output("”</i> Relaxing her legs, she lets more of her weight come to rest on your face, smothering you in juicy canine cunt. <i>“");
	if(!korgiTranslate()) output("Bury face in pussy like horny bone. Still lick. Still happy.”</i>");
	else output("You bury your face in there like a horny dick. And you’re still licking! And happy to do it.”</i>");
	output("\n\nCovered in cunt, you sigh happily and slobber over every inch of her internal passage that you can reach");
	if(pc.hasLongTongue()) output(", which considering the obscene length of your tongue, is basically all of it");
	output(".");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("That yes?");
	else output("Is that a yes?");
	output("”</i> Ula’s claws ");
	if(pc.hasHair()) output("rake through your [pc.hair]");
	else output("gently stroke your head");
	output(". She wiggles, grinding her clit on your nose.");
	output("\n\nYou vocalize your muffled agreement into your favorite thing in the universe.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Thinked so.");
	else output("Thought so.");
	output("”</i> Ula’s cunt drips more in her excitement. <i>“");
	if(!korgiTranslate()) output("You pussy-heart now.");
	else output("You’re a pussy-heart now.");
	output("”</i> She grinds herself off against your face, moaning at your tongue’s rapt attention. <i>“");
	if(!korgiTranslate()) output("Too much cunt in brain, break head. So soggy with girl-juice that just want more.");
	else output("Too much cunt in your brain broke your head. Got it so soggy with girl-juice that all you want is more.");
	output("”</i> She graduates from grinding to openly humping, her slick, pregnant underbelly smothering you in gravid fluff. <i>“");
	if(!korgiTranslate()) output("Ula pussy too strong for alien, guessing, but you like strong pussy, yes?");
	else output("My pussy is too strong for you, I guess, but you like it strong, don’t you?");
	output("”</i>");
	output("\n\nYou want to babble, <i>“Oh-god-yes-give-me-more!”</i> but all that comes out is <i>“Mmmrphrmph!”</i>");
	output("\n\nIt seems enough for the sultry, knocked-up korgonne.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Then Ula take care of.");
	else output("Then I’ll take care of you.");
	output("”</i> The royal bitch is so delightful <i>wet</i>. <i>“");
	if(!korgiTranslate()) output("Giving you pussy all time. Having all the horny-wet from pregnant, can get licks for days.");
	else output("I’ll give you pussy all the time. I have all the horny wetness of a pregnant slut. I can let you lick me for days.");
	output("”</i> She bounces and cums, shouting, <i>“");
	if(!korgiTranslate()) output("Ula cunt loving [pc.name] too! Let lick even after babies come. Ula train pussy stay wet for pussy-heart mate.");
	else output("My cunt loves you too! I’ll let you lick it even after the babies come. I’ll train it to stay wet for my pussy-heart mate.");
	output("”</i>");
	output("\n\nShowering in her fragrant, mint-tinted lust, you thrill at her promise. Your heart sings with the knowledge that she’ll never deny you this pleasure, that she’ll do whatever it takes to stay wet and ready for your tongue at all hours of the day. As you slurp at her juices, you imagine yourself crawling around on all fours, blindfolded, following Ula around wherever she goes. When the urge takes her, she spreads her legs to reveal the glimmering mound at the center of all your thoughts, allowing you to slide into place by the increase in scent alone.");
	output("\n\nYou cum, imagining all the depraved ways you can slide your tongue inside her, all but forgetting what the rest of Ula looks like as you focus in on every detail of her cunt. You memorize the best places to press on, the texture of an orgasm-engorged fold sliding against your cheek. Pussy enfolds you in bliss, wrapping your short-circuiting brain in folds of slick, velvet desire.");
	if(pc.hasCock() && pc.cumQ() >= 200) output(" [pc.Cum] is everywhere, fountaining out of you, messily. Some lands on Ula’s belly. You can hear her coo in delight and smear it into the fur.");
	if(pc.hasVagina() && !pc.isSquirter()) output(" [pc.GirlCum] dribbles weakly out of you. It’s a weaker, forgettable emission next to Ula’s.");
	else if(pc.hasVagina())
	{
		output(" [pc.GirlCum] sprays out of you");
		if(pc.girlCumQ() >= 3000) output(" in tremendous, bed-soaking torrents");
		output(". It’s a weaker, forgettable emission next to Ula’s.");
	}
	output("\n\nConsciousness fades beneath a wave of syrupy mint and ecstatic pulsations of release. No matter how your body bucks and cums, your mouth remains attentively fixed to Ula’s snatch, licking, and lapping, and twirling... and licking... and sucking...");
	output("\n\nThere are flashes of sensation: warm feelings of affection and contentment mostly. Interspersed amongst the emotional satiation are bursts of erotic pleasure, heavenly in intensity. You lick, mind as full of cunt as your mouth, and until your exhaustion shuts you down. And even then, Ula’s pussy lingers in your thoughts, filling your dreams with creamy cyan folds that taste better than any food in the galaxy.");
	processTime(240);
	var ula:Creature = new KorgonneFemale();
	pc.girlCumInMouth(ula);
	pc.girlCumInMouth(ula);
	pc.girlCumInMouth(ula);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",ulaVoluntaryPregPussyMunchEpilogueWithBadEndChance);
}

public function ulaVoluntaryPregPussyMunchEpilogueWithBadEndChance():void
{
	clearOutput();
	showUla(true);
	//Willpower Pass
	if(!pc.hasStatusEffect("Ula Pussthirst") || pc.willpower()/3 + rand(20) + 1 >= 22)
	{
		if(!pc.hasStatusEffect("Ula Pussthirst")) pc.createStatusEffect("Ula Pussthirst");
		pc.setStatusMinutes("Ula Pussthirst",60*24*4);
		output("When you wake up, you find yourself snuggled safely between Ula’s legs. Her pussy still glistens, and the scent of it makes you long to bury yourself between her thighs once more. Shaking your head, you pull away. With distance comes clarity, and the knowledge of how easy it would be lose yourself in her sodden embrace. A few licks, and your mouth would be affixed to the korgonne " + (ulaChief() ? "chieftess":"princess") + "’s cunt for at least an age.");
		output("\n\n<i>“Good morning!”</i> Ula flashes you a shining smile. <i>“");
		if(!korgiTranslate()) output("Not want more pussy");
		else output("You don’t want any more pussy");
		output("?”</i> She spreads her thighs invitingly. <i>“");
		if(!korgiTranslate()) output("Already wet again!");
		else output("It’s already wet again!");
		output("”</i>");
		output("\n\nYou... shake your head and gather your things. Everything smells like her pussy, especially your face, cheeks, hands... and everything else, but it doesn’t seem to addle you quite as much as direct exposure to your horny mate. <i>“Sorry... but I should head out.”</i>");
		output("\n\nClosing her thighs, Ula nods. <i>“");
		if(!korgiTranslate()) output("Good. You strong mate. Not break from Ula pussy.");
		else output("Good. You’re a strong mate, not breaking from a little pussy.");
		output("”</i> She clenches her thighs. <i>“");
		if(!korgiTranslate()) output("When have time, visiting. Maybe meet pups?");
		else output("When you have time, visit. Maybe you’ll get to meet your pups.");
		output("”</i>");
		output("\n\nThat sounds good to you. You leave the " + (ulaChief() ? "chieftess":"princess") + " smelling like her slit from your head to your ");
		if(pc.legCount > 1) output("[pc.feet]");
		else output("[pc.foot]");
		output(". Maybe you ought to find a shower.");
		processTime(50);
		pc.applyPussyDrenched();
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//Willpower fail
	else
	{
		output("When you wake, you’re horny, which makes sense, considering that your face is resting between Ula’s thighs. You snuggle in for a lick. Your tongue may be sore, but the taste is so overwhelmingly potent that such meager concerns are forgotten beneath her all-important pussy.");
		output("\n\n<i>“Ooooh, naughty [pc.name] sneaking licks!”</i> Ula grabs your face and drags out it from between her legs. <i>“Don’t you have space-jobs?”</i> Your eyes dart to her folds. <i>“");
		if(!korgiTranslate()) output("Maybe really broke head.");
		else output("Maybe you really broke your head.");
		output("”</i> She waves a hand in front of your eyes, blocking your view of her cunt long enough for you to try to peer around it. <i>“");
		if(!korgiTranslate()) output("Really are pussy-heart?");
		else output("Are you really a pussy-heart?");
		output("”</i>");
		output("\n\nYou nod vigorously and let your tongue hang out. Language seems too hard to bother with compared to the heavenly sight just a few inches away.");
		output("\n\nUla sighs, grabs you by the hair, and thrusts your face into her steamy delta. The pheromonal scent is over stronger than before, owing to your endless hours of service the night before. <i>“");
		if(!korgiTranslate()) output("Am sorrying [pc.name] breaked, but take care of.");
		else output("I’m sorry I broke you, but I’ll take care of you.");
		output("”</i> Ula humps your face, her voice rising in pitch. <i>“");
		if(!korgiTranslate()) output("Give all pussy forever!");
		else output("Give you all the pussy you want forever!");
		output("”</i>");
		output("\n\nThat sounds just perfect to you.");
		processTime(60);
		pc.changeLust(50);
		clearMenu();
		addButton(0,"Next",ulaPregPussBadEnd);
	}
}

public function ulaPregPussBadEnd():void
{
	clearOutput();
	showUla(true);
	output("As the years pass, you think less and less of your inheritance. Why bother? [rival.name] likely claimed it an age ago. Your presence as Ula’s personal pussy-worshipper is accepted by the Korg’ii Tribe. In fact, the knowledge that she broke you into a cunt-obsessed, slobbering pet with nothing more than her pregnant pheromones earned her no small amount of esteem amongst the younger warriors.");
	output("\n\nUla celebrated her ascension to chieftess by giving you an all-night pussy buffet, and from that point on, she ruled from a throne that would allow her legs to remain spread wide and her favorite lover-slash-pet between them.");
	
	pc.createStatusEffect("Milk Paused");
	pc.createStatusEffect("Cum Paused");
	processTime((3 * 365 * 24 * 60) + rand(1440));
	pc.removeStatusEffect("Milk Paused");
	pc.removeStatusEffect("Cum Paused");
	
	badEnd("BAD(GOOD?) END!");
}