//Male Milodan Barbarian
//By Wsan

//Unlike the picture, milodan on Uveto have white/blue/silver fur, kinda like snow leopards in pattern.
//Male and female Milodans share hunting and salvaging responsibilities. The males are more aggressive towards outsiders, deeming them a threat whereas the females, whilst fierce, are the friendlier face of the Milodans. Both male and female Milodan are dominant in bed and will gladly pull any dominant PC down a couple of notches if they win in battle. If the PC’s strength is high enough, then the tables turn and the fun and games really begin.

//Combat
//Pre-fite text
//Description of terrain goes here as prelude to encounter

//#Flags:
//MILO_MALE_CON_LOSSES	number of consecutive losses to the milodan male
//OMEGA_LOSS how many times player has lost under effects of omega oil

public function showMilodanMale(nude:Boolean = false):void
{
	showBust(bustDisplayMilodanMale(nude));
	showName("MALE\nMILODAN");
}
public function bustDisplayMilodanMale(nude:Boolean = false):String
{
	var sBust:String = "MILODANMALE";
	
	if(nude) sBust += "_NUDE";
	
	return sBust;
}
public function inOmegaHeat():Boolean
{
	//Used for the loss Omega Oil scenes and bad end. The reason I did this instead of pc.inAnalHeat is because the scenes specifically reference Omega Oil, and there may be Anal Heats coming from other sources in the future
	if (pc.hasStatusEffect("Strangely Warm") || pc.hasStatusEffect("Flushed") || pc.hasStatusEffect("Fuck Fever")) return true;
	return false;
}

public function milodanCombatPrep():Creature
{
	var milodan:Creature = new MilodanMale();
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(milodan);
	CombatManager.victoryScene(winVsMilodanMale);
	CombatManager.lossScene(lossSceneToMaleMilodanRouting);
	CombatManager.displayLocation("MILODAN");
	milodan.long = "The male Milodan stands at about seven and a half feet, ";
	//Pc tallness < 85: 
	if(pc.tallness < 85) milodan.long += "towering above you.";
	//Pc tallness > 85:
	else milodan.long += "looking you fiercely in the eye.";
	milodan.long += " His thick " + milodan.furColor + " fur serves to keep him warm in the blistering cold of the rift, a particularly shaggy tuft of it sticking out from his chest. He’s built like a goddamn house, his fur unable to conceal the thick muscle lurking beneath it. His feline ears are laid back and his fangs and claws are prominently displayed, ";
	//milodan_weapon = club: 
	if(milodan.meleeWeapon.longName == "heavy club") milodan.long += "but just to make matters worse he’s wielding a giant obsidian-looking club.";
	else if(milodan.meleeWeapon.longName == "axe") milodan.long += "but just to make matters worse he’s wielding a nasty obsidian-looking axe.";
	else milodan.long += "a sombre reminder that his entire body is a weapon.";
	milodan.long += " He’s naked save for a meagre loincloth";
	if(flags["SEXED_MILODAN_MALE9999"] == undefined) milodan.long += " which you know to be concealing a bulbous, feline dick somewhere around a foot long";
	milodan.long += ".";

	return milodan;
}

public function encounterAMilodan():void 
{
	var milodan:Creature = milodanCombatPrep();
	var milodan_color:String = milodan.furColor;
	showMilodanMale();
	author("Wsan");
	if (inOmegaHeat() && flags["MILO_MALE_CON_LOSSES"] >= 6)
	{
		author("Meaty Ochre");
		output("\n\nThe crunch of snow behind you startles you out of your reprieve, hand reaching for your [pc.weapon] as you spin around to face whoever has snuck up on you. Once again you’re face-to-face with the male of the Milodan species, but the hulking barbarian isn’t poised to attack. Your stance relaxes as you recall the more pleasurable aspects of your close encounters with these shaggy furred aliens. The urge to submit is sudden but familiar by now, and you contemplate going with your gut instinct to turn around and present your [pc.ass] to the dick-bearer before you.");
		output("\n\nEither the lust you feel is apparent enough that he takes it for an invitation or he’s just tired of waiting, but the Milodan steps forward to place his huge hands on your body. Hands the size of dinner plates quickly find their way to your butt and enthusiastically begin kneading the flesh there. Despite the chill of the tundra, warmth floods your body in response to the perverse groping, and you feel yourself start sinking into the creature’s ministrations. It would be so easy to let this burly feline do whatever he wants to you...");
		CombatManager.lossScene(omegaBadEndLoss);
		clearMenu();
		addButton(0,"Escape",omegaBadEndEscape);
		addButton(1,"Submit",omegaBadEndSubmit);
		addButton(2,"Fight", CombatManager.beginCombat);
		return;
	}
	output("\n\nA hulking, shaggy-furred shape appears out of Uveto’s unforgiving landscapes. ");
	//PC tallness < 85: 
	if(pc.tallness < 85) output("He’s markedly taller than you are, and his musculature is intense.");
	//Pc tallness >= 85 to 89:
	else if(pc.tallness <= 89) output("He’s about the same height as you are, and his musculature is intense.");
	//Pc tallness > 89:
	else output("Though he’s shorter than you are, his musculature is intense.");
	output(" You can sense the power lurking under his " + milodan_color + " fur; this guy might be primitive, but it doesn’t take a neuroscientist to ");
	//milodan_weapon = club:
	if(milodan.meleeWeapon.longName == "heavy club") output("hit someone upside the head with a club when you’re five hundred pounds.");
	//milodan_weapon = axe:
	else if(milodan.meleeWeapon.longName == "axe") output("be effective with an axe when you’re five hundred pounds.");
	//milodan_weapon = claws:
	else output("open someone up with claws like <i>that</i>.");

	output("\n\nHis mouth turns downwards in a menacing scowl, baring his saber-like fangs at you in a show of dominance. You brandish your [pc.weapon] at him and for a moment he looks uncertain, shrinking back a step. You realize just in time that he’s coiling for a leap! Sidestepping, you barely dodge the hulking barbarian barreling towards you. He stops himself in an impressive display of agility, flipping around to face you.");
	output("\n\n<i>“Crush you,”</i> he growls.");
	if(!CodexManager.entryUnlocked("Milodan")) 
	{
		output("\n\nYour Codex beeps a warning: <i>“New species detected. Milodan. Conflict aversion measures are recommended.”</i>\n\nYeah. Right. At least you’ll have a new Codex entry to read if you live...");
		CodexManager.unlockEntry("Milodan");
	}
	output("\n\n<b>It’s a fight!</b>");
	
	IncrementFlag("MET_MILODAN_MALE");
	
	clearMenu();
	addButton(0,"Next", CombatManager.beginCombat);
	//If PC has lost five times under Omega Oil effects, button remains, even if consecutive losses drops back down
	if (inOmegaHeat() && (flags["MILO_MALE_CON_LOSSES"] >= 5 || flags["OMEGA_LOSS"] >= 5)) addButton(4,"Submit",omegaLossToMiloMale,true,"Submit","Why fight when you both know what you want?");
}

//Victory scenes
//Post-fite text
public function winVsMilodanMale():void
{
	clearOutput();
	showMilodanMale();
	author("Wsan");
	
	flags["MILO_MALE_CON_LOSSES"] = undefined;
	
	//Beatdown
	if(enemy.HP() <= 1)
	{
		output("Having emerged victorious in the brawl with the barbarian, you watch him struggle to stay upright on one knee before he flops onto his side. He’s still conscious and breathing, albeit slightly labored given the beating you gave him. He looks up at you, the fight in his eyes gone.");
		output("\n\n<i>“Strong,”</i> he grunts, the corner of his mouth turning upwards in a grimace. <i>“Not... from here.”</i>");
		output("\n\nYou squat next to him,");
		if(pc.isNice()) 
		{
			output(" giving him a grin.");
			output("\n\n<i>“You got that right. Sorry about the beatdown, but you did ask for it,”</i> you say with a wink.");
			//, <i>“I’ll make it up to you.”</i>");
		}
		//mischievous:
		else if(pc.isMischievous())
		{
			output(" regarding his face with interest.");
			output("\n\n<i>“Don’t imagine you get too many people like me around here, huh? What a shame,”</i> you say with a sigh. <i>“You’ll never expand your horizons like this.”</i>");
		}
		//hard:
		else
		{
			output(" regarding him coolly.");
			output("\n\n<i>“Shouldn’t have come at me like that, buddy. Your own fault you’re lying here now, and frankly,”</i> you murmur, raising your head and making a show of looking around the wastes, <i>“I should leave you here for the critters.”</i>");
		}
	}
	//Lust
	else output("Defeated by your sensuous wiles, the barbarian gives up all pretense of fighting and drops to his knees, grunting in need. You walk over and casually kick his hands away from his loincloth, leaving him at your mercy.");
	output("\n\n");
	processTime(1);
	
	miloMaleWinMenu();
}

public function miloMaleWinMenu():void
{
	clearMenu();

	if(pc.lust() >= 33)
	{
		if(pc.hasCock())
		{
			if(pc.cockThatFits(enemy.analCapacity()) >= 0) addButton(0,"Doggystyle",doggieStyleDatSaberDoggie,undefined,"Doggystyle","Make this pussy-puppy take it like the bitch he is.");
			else addDisabledButton(0,"Doggystyle","Doggystyle","Your dick is too big to fit in his butt.");
		}
		else addDisabledButton(0,"Doggystyle","Doggystyle","You don’t have a penis to stuff in his poor boy-pussy.");

		if(pc.hasVagina() && pc.blockedVaginas() == 0)
		{
			if(!pc.isTaur()) addButton(1,"Vaginal Ride",rideVaginalMilodanMaleBecauseTHEYIFFENING,undefined,"Vaginal Ride","Take care of your lusts by riding him into the snow, though you aren’t sure if you’ll let him nut inside just yet...");
			else addDisabledButton(1,"Vaginal Ride","Vaginal Ride","Your tauric anatomy is ill-suited for this act.");
		}
		else if(pc.hasVagina()) addDisabledButton(1,"Vaginal Ride","Vaginal Ride","You'll want an unobstructed vagina to do this.");
		else addDisabledButton(1,"Vaginal Ride","Vaginal Ride","You need a vagina to take him in your vagina.");

		addButton(2,"Ride Anal",takeMaleMilodanForAnAnalRide,undefined,"Ride Anal","Take the barbarian in your ass for a little anal fun.");

		if(pc.isTaur())
		{
			if(pc.hasGenitals()) addButton(3,"Taurssionary",taurssionaryWithFloofyBoyslut,undefined,"Taurssionary","Sometimes when you’re a centaur, you have to be creative in how you get fucked.");
			else addDisabledButton(3,"Taurssionary","Taurssionary","If you’re going to get fucked missionary (or as close as your anatomy will allow), you should probably have some genitals. It seems like a good idea. Give it a try sometime, whynot. You’re missing out on so much otherwise.\n\nPlease!");
		}
		else addDisabledButton(3,"Taurssionary","Taurssionary","As the name would imply, you need to be a centaur or something similar for this particular act.");

		addButton(4,"Rimjob",giveMilodanMalesStinkyButtholeALick,undefined,"Rimjob","Tongue his ass until he’s squirting so much hot release into the snow that it steams.");
		addButton(5,"CockWorship",milodanCockWorship,undefined,"Cock Worship","You won the fight... that means you get to do what you want. That includes giving this studly catman some crotch worship." + (silly ? " No kink shaming here.":""));
	}
	else
	{
		addDisabledButton(0,"Doggystyle","Doggystyle","You aren’t aroused enough for that.");
		addDisabledButton(1,"Vaginal Ride","Vaginal Ride","You aren’t aroused enough for that.");
		addDisabledButton(2,"Ride Anal","Ride Anal","You aren’t aroused enough for that.");
		addDisabledButton(3,"Taurssionary","Taurssionary","You aren’t aroused enough for that.");
		addDisabledButton(4,"Rimjob","Rimjob","You aren’t aroused enough for that.");
		addDisabledButton(5,"CockWorship","Cock Worship","You aren’t aroused enough for that.");
	}
	addButton(14,"Leave",leaveDatMilodanHesASlutAnywayItsNotLiekYouLikedHimOrAnythingBaka);
}

//Doggystyle (requires dick)
public function doggieStyleDatSaberDoggie():void
{
	clearOutput();
	showMilodanMale(true);
	author("Wsan");
	var x:int = pc.cockThatFits(chars["MILODAN_MALE"].analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("You indicate he should get on all fours and given no choice in the matter, he shakily obeys your command. The furred barbarian looks back at you with some trepidation, clearly not too eager to be penetrated. Too bad for him that’s exactly what you have in mind.");
	if(pc.isTaur()) output(" Standing above him and casually");
	else output(" Casually");
	output(" aligning yourself, you begin to slide into his tight little asshole.");

	output("\n\nThe milodan wriggles on the end of your [pc.cock " + x + "], trying to acclimate himself to the feeling of penetration. Whether he knows it or not, it’s a nice feeling around your [pc.cockHead " + x + "]. The further you push in, the better it feels! Void, he’s so <i>warm</i> and <i>tight</i>! His insides are like a furnace, a sweltering wet heat wrapped around your dick.");

	output("\n\nIt takes some encouragement and cajoling until he can handle it, but the satisfaction when you hilt yourself is immense. Already");
	//pc.cumVolume <= 500:
	if(pc.cumQ() <= 500) output(" dribbling pre into his guts");
	else if(pc.cumQ() <= 2000) output(" drizzling pre into his guts");
	else if(pc.cumQ() <= 5000) output(" shooting ropes of pre into his guts");
	else if(pc.cumQ() <= 10000) output(" spurting long ropes of sticky pre into his guts");
	else output(" coating his guts with voluminous, sticky sprays of pre-cum");
	output(", you slowly slide yourself out, noting the low rumble from the milodan’s throat. You smirk at the thought that the big, buff barbarian is getting off on you fucking his juicy butt. It might be fun to get him off a few times before you cum, show him that being your anal slut has its benefits...");
	pc.cockChange();

	processTime(5);
	pc.changeLust(1000);
	//[Nah] [Yes]
	clearMenu();
	addButton(0,"Nah",dontLetTheMilodanGetOffHesADork,x,"Nah","Why would you worry about his pleasure?");
	addButton(1,"Yes",yesGetTheMilodanOff,x,"Yes","Get the Milodan off.");
}

//[Nah]
public function dontLetTheMilodanGetOffHesADork(x:int):void
{
	clearOutput();
	showMilodanMale(true);
	author("Wsan");
	output("<i>Nah, fuck it</i>, you decide. He lost fair and square, and now you’re going to take him for all he’s worth. You hilt yourself a few more times,");
	//pc has >1 balls:
	if(pc.balls > 1) output(" pressing your balls");
	else output(" pressing yourself");
	output(" right up against his furry backside to make sure he knows who’s boss, then slowly begin to increase the pace. He grunts the first time you pull out and slam back in, jerking forward before bracing himself against the ground.");
	output("\n\n<i>“Good boy,”</i> you murmur from above him. You’re not sure if he knows the words, but he’ll get the message. <i>“Sit there and take it.”</i>");
	if(!pc.isTaur()) 
	{
		output("\n\nYou work him up to being able to take your ever-increasing pace, your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("thighs");
		output(" thudding against his ass, the slapping sound of ");
		if(!pc.isGoo()) output("flesh");
		else output("goo");
		output(" on flesh resounding throughout the empty area. He’s panting now, and when he tries to reach under himself to get at his sheath you stop, grabbing his arm.");
		output("\n\n<i>“Uh-uh,”</i> you say, reaching for his other arm too. <i>“Bad boys don’t get to jerk off.”</i>");
		output("\n\nHolding both of his arms out, you pull backwards and he jerks upward a little with a surprised exclamation.");
	}
	else
	{
		output("\n\nYou work him up to being able to take your ever-increasing pace, your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("hindlegs");
		output(" thudding against his ass with every push, the slapping sound of ");
		if(pc.skinType != GLOBAL.SKIN_TYPE_GOO) output("flesh");
		else output("goo");
		output(" on flesh resounding throughout the empty area. He’s panting now, and when he tries to reach under himself to get at his sheath you bend down, grabbing his arm.");
		output("\n\n<i>“Uh-uh,”</i> you say, reaching for his other arm too. <i>“Bad boys don’t get to jerk off.”</i>");
		output("\n\nHolding both of his arms out, you pull upwards and he jerks a little with a surprised exclamation.");
	}
	output("\n\nThe angle you’re holding him at, he must be getting crazy stimulation across his prostate. That’s none of your concern, though - you’re more interested in how quickly his ass can bring you to orgasm. You start pumping him as hard as you can, a keening whine accompanying your rough grunt every time you hilt yourself.");
	output("\n\n<i>“You’re beginning to sound more like a bitch in heat,”</i> you pant between thrusts, not caring if he understands, the lack of responses spurring you to further bully him. <i>“What’s the matter? Can’t handle being fucked in the ass?”</i>");
	output("\n\nMaybe he did understand you that time, because you can feel his stretched-out ring tightening around you, his insides all but caressing your cock. You groan at the added stimulation, the telltale signs of orgasm making their presence known in your abdomen. Right when you’re at the peak, you roar and");
	if(pc.isTaur()) output(" let your front half drop on top of him, leaving his ass raised and his face pressed firmly into the ground.");
	else output(" let go of his arms, slamming him down into the ice and leaving his ass raised with his face pressed firmly into the ground.");
	output("\n\nYou groan loudly as");
	if(pc.cumQ() <= 500) 
	{
		output(" your [pc.cumNoun] shoots into him, ropes of seed spattering his insides until you’re dry. You pop free with a satisfied sigh, the milodan’s asshole staying gaped after your abusive treatment of him.");
		output("\n\nFreed from your grip, you find him whining as he desperately tries to jack himself off to orgasm, a semi-frozen pool of pre underneath him. You must have fucked that out of him, you realize with a smirk.");
		output("\n\n<i>“Good work, </i>slut<i>,”</i> you tell him as you step back and make to leave. He might not know the term immediately, but maybe someday he’ll learn.");
	}
	else if(pc.cumQ() <= 2000)
	{
		output(" you dump a heavy load of [pc.cumNoun] into his ass, coating his insides with your seed and marking him as yours. You pop free with a satisfied sigh, a trickle of your [pc.cum] rolling down his thigh.");
		output("\n\nFreed from your grip, you find him whining as he desperately tries to jack himself off to orgasm, a semi-frozen pool of pre underneath him. You must have fucked that out of him, you realize with a smirk.");
		output("\n\n<i>“Good work, </i>slut<i>,”</i> you tell him as you step back and make to leave. He might not know the term immediately, but maybe someday he’ll learn.");
	}
	else if(pc.cumQ() <= 5000)
	{
		output(" you dump a massive load of [pc.cumNoun] into his ass, absolutely soaking his insides with your seed and marking him as yours. You pop free with a satisfied sigh, your jizz immediately running out of his gaped asshole and down his legs.");
		output("\n\nFreed from your grip, you find him whining as he desperately tries to jack himself off to orgasm, a semi-frozen pool of pre underneath him. You must have fucked that out of him, you realize with a smirk.");
		output("\n\n<i>“Good work, </i>slut<i>,”</i> you tell him as you step back and make to leave. He might not know the term immediately, but maybe someday he’ll learn.");
	}
	else if(pc.cumQ() <= 10000)
	{
		output(" you dump multiple massive loads into his ass, drowning his insides in warm seed and marking him as yours. By the time you’re done filling him up, he has one hand clutched to his swollen belly. He grunts as you pop free with a satisfied sigh, your [pc.cumNoun] immediately splashing out of his gaped asshole and soaking his legs.");
		output("\n\nFreed from your grip, you find him whining as he desperately tries to jack himself off to orgasm, a semi-frozen pool of pre underneath him. You must have fucked that out of him, you realize with a smirk.");
		output("\n\n<i>“Good work, </i>slut<i>,”</i> you tell him as you step back and make to leave. He might not know the term immediately, but maybe someday he’ll learn.");
	}
	else if(pc.cumQ() <= 50000)
	{
		output(" you begin to dump the first of many massive loads into his ass, drowning his insides in warm seed and marking him as yours. You keep thrusting, teeth gritted as your bountiful orgasm continues. You rapidly fill up his tummy, his hands wrapped around his swollen midriff as the excess begins to drip, stream, and then spray back out around your cock.");
		output("\n\nWhen you finally find yourself fully empty (though you don’t think you’re ever <i>really</i> fully empty), you pull out with a satisfied sigh and admire your handiwork. You’ve left the barbarian looking like he’s pregnant with a litter of kits. You note there’s a semi-frozen puddle of pre underneath his stomach that you must have fucked out of him, and that he’s desperately trying to get himself off at least once. He whines pathetically, but can’t do it - he was already on the edge of unconsciousness, and your lengthy orgasm pushes him over.");
		output("\n\n<i>“Nice work, </i>slut<i>,”</i> you whisper to him as he flops onto his side, his mouth hanging open. He might not know what the word means, but maybe someday he’ll learn.");
	}
	else
	{
		output(" you begin to dump the first of many massive loads into his ass, drowning his insides in warm seed and marking him as yours. You keep thrusting, teeth gritted as your bountiful orgasm continues. You rapidly fill up his tummy, his hands wrapped around his swollen midriff as the excess begins to drip, stream, and then spray back out around your cock.");
		output("\n\nYou’re not even close to being done yet though, so you keep pounding him until he begins to cough. With the third or fourth, he sags in your grip as a gout of [pc.cumColor] seed erupts from his mouth, spraying outwards onto the ice. Finding nowhere else to go in his stretched-taut body, each huge load you pump into him forces its way through his lips until there’s as much spraying from his mouth as there is from his ass.");
		output("\n\nWhen you’re finally finished (though you’re never <i>really</i> finished), you pull out with a deeply satisfied sigh and admire your handiwork. The barbarian lies still, resting on the belly that looks every bit like he’s a day away from delivering a litter of a dozen kits. His slow breathing is punctuated every so often by swallows, his body unconsciously saving him from drowning in your spunk. With a smile, you step back and prepare to leave.");
		output("\n\n<i>“Nice work, </i>slut<i>,”</i> you call over your shoulder to the unconscious milodan. Not like he can hear you and even if he could he probably wouldn’t understand, but you figure it’s an important message to get across.\n\n");
	}
	processTime(20);
	enemy.loadInAss(pc);
	pc.orgasm();

	CombatManager.genericVictory();
}

//[Yes]
public function yesGetTheMilodanOff(x:int):void
{
	clearOutput();
	showMilodanMale(true);
	author("Wsan");
	output("<i>Oho, yes</i>, you think. What better way to make him sorry for attacking you than to slowly, sensually demonstrate that getting fucked in the ass is its own reward? ");
	if(!pc.isTaur()) output("You gently slide one hand down to his sheath, coaxing his considerable cock out into your hand. ");
	output("Slowly pulling out, you withdraw right to his entrance before pushing back in with a moan, and you’d swear you hear the milodan <i>purr</i> on your instroke before he abruptly stops. You allow yourself a smile - the sex is so much better when both parties are enjoying it, even if one of them doesn’t want to admit it. You work his hole with cheerful vigor, enjoying the different sounds he makes when you prod him in a particular place.");
	output("\n\nFinally, you settle on one particular spot that makes him shiver and mewl every time your cock slides over it. Given the slight bump you can feel yourself passing over, you guess you’re stroking his prostate. He gasps and begins flailing as you keep up the steady rhythm, making sure you rub him in the exact same spot over and over.");
	output("\n\n<i>“Oh, you </i>like<i> that feeling, don’t you?”</i> you murmur to him from ");
	if(pc.isTaur()) output("above. Bending down, you look him in his startled eyes and smile");
	else output("behind");
	output(". <i>“Like you’re constantly on the verge of cumming, but you just can’t get there? Don’t worry,”</i> you moan, beginning to pump him a little harder, <i>“Let me help you with that.”</i>");

	output("\n\nYou don’t know if he quite understands what you’re saying, but he gets the message. Giving the slightest of nods, he tries to relax with your cock all the way inside his ass. His hands flex and unflex every time you fuck him, his shameful grunts growing in volume until he’s crying out in lust every time you hilt yourself, his dick endlessly drooling pre-cum and desperate for release.");

	output("\n\n<i>“You get to cum since you’ve been such a good boy for me,”</i> you pant, ");
	if(pc.isTaur()) output("flexing your powerful hips downwards");
	else output("gripping his hips");
	output(" while you ramp up the intensity. <i>“Go ahead and - cum!”</i> you declare, ramming into him.");

	output("\n\nHe groans loudly, the almost-clear color of his pre-cum swiftly changing to a thick, milky white as it starts to spurt out in heavy ropes. He shudders around your cock, his hole contracting and seizing around your immovable rod deep inside him. You grit your teeth and manage to hold out, staving off your orgasm - you <i>really</i> want to get him off more than once, show him how fun being your anal slut can be.");
	output("\n\n<i>“Good boy,”</i> you coo, ");
	if(pc.isTaur()) output("bending down to ruffle his hair");
	else output("rubbing his lower back");
	output(" as he grunts, squirting out the last few ropes of cum he has in him. <i>“Wasn’t that good? Look at how much you came.”</i>");

	output("\n\nHe pants, his cock abnormally swollen. His knot is bulging outwards, you realize, and you can’t help but " + pc.mf("snicker","giggle") + ".");

	output("\n\n<i>“Probably the first time you’ve ever had </i>that<i> out without it being in a bitch, huh? You must be so confused. ");
	//PC’s current dick has a knot: 
	if(pc.hasKnot(x)) output("Don’t worry though, I’ll show you what it’s like to be on the receiving end.");
	else output("Don’t worry, that’s only the beginning.");
	output("”</i>");

	output("\n\nYou get right back to work, thrusting inside his unresisting hole. He jerks in surprise, perhaps not realizing that you didn’t cum, but stays still to let you pound his butt nonetheless. He moans at first, then bucks wildly in surprise as you rub his prostate again.");

	output("\n\n<i>“Sensitive now, huh? Enjoy!”</i> you exclaim, ");
	if(pc.isTaur()) output("bending your front half to weigh him down and keep him in place");
	else output("holding him down");
	output(" while he wriggles.");

	output("\n\nHe cries out, helpless under you, sounding every bit like the bitch you’re making him out to be. It’s only a scant few seconds before he’s cumming again, spasming and writhing on the ice as he ineffectually humps at the air, his senses overwhelmed to the point of confusion. You keep fucking him, driving him over the edge until he’s cumming with every thrust, seizing under you.");

	output("\n\nYou grit your teeth and groan in satisfaction as you finally let yourself go, your backed-up load spurting into the milodan’s ass and coating his insides in spunk. Giving him a few last lazy thrusts,");

	var timeBonus:Number = 0;
	//No knot:
	if(!pc.hasKnot(x)) 
	{
		if(pc.cumQ() <= 5000) output(" you pull out and watch his gaped asshole drizzle spunk down his legs.");
		else output(" you pull out, still spurting spunk all over his ass and back. By the time you’re done, his fur is coated in your sticky spunk. That’s going to be hell to get out - he’s well and truly marked as your bitch now.");
		output("\n\nYou bend down next to the groaning Milodan, who appears to be hovering on the verge of unconsciousness, and give him a cheerful smile.");
		output("\n\n<i>“Hope you had as much fun being my anal toy as I had using you as one! Remember, discretion is the better part of valor.”</i>");
		output("\n\nHis head slumps to the ground as you make to leave. You’re not sure he heard you properly and if he did, whether he understood you, but hopefully he gets the message.");
	}
	//Knot:
	else
	{
		timeBonus = 180;
		output(" you hilt yourself inside him, relishing the prospect of what’s to come.");
		//pc.cumVolume <50000:
		if(pc.cumQ() < 50000)
		{
			if(pc.cumQ() < 10000) output(" Your jizz splashes inside him, then finally stops spurting... but you don’t pull out.");
			else output(" Your jizz buckets into your newly-acquired cumdump, his stomach quickly sagging with the heaviness of your seed. He groans, but you don’t pull out.");
			output("\n\n You sigh happily when you feel your [pc.knot " + x + "] begin to swell, sealing your cum inside him and trapping him under you. You don’t think he was expecting to be knotted if his grunts of exertion as you spread him wide are any indicator, but having one himself he’s familiar with what happens.");
			if(!pc.isTaur()) output("\n\nYou lie on top of him, wrapping your arms around his furry body in a loose hug.");
			else output("\n\nYou slowly lie down on top of him, his massive frame more than able to withstand your tauric bulk and unable to escape with your cock so deep in his ass anyway.");
			output("\n\n<i>Void</i>, he’s warm. His body heat radiates outwards, providing you with the perfect bastion against the icy cold of the rift. You’ll probably be here a little while... might as well settle in. He grumbles as you snuggle against him, but doesn’t resist.");
			output("\n\nAfter a couple of hours and some intimate orgasms on the milodan’s part, you finally deflate enough to part ways. You give him a cheerful wave as you depart, watching him grumble as he stalks off, rubbing his rump.");
		}
		else
		{
			output(" You dump your first massive load into his ass with a grunt, swelling his ring every time your cumvein carries your next bulging barrelful of jizz into his warm insides. Groaning, you push into him as deep as you can, pressing into his ass to get your seed as far inside him as it’ll go. You grit your teeth as your knot begins to inflate, truly trapping him below you. ");
			if(!pc.isTaur()) output("You slowly climb on top of him, the weight of your cum making his stomach sag and expand outwards from underneath him.");
			else output("You slowly relax, sinking on top of him and weighing him down - not like he was moving anyway.");

			output("\n\nWith your knot well and truly sealing the milodan’s ass shut, there’s only one place your bountiful loads are going: in. He has no choice but to take it, your steady gouts of semen painting his insides and sloshing into his stomach. Your orgasm is far too bountiful to stop at just filling him up, though, and soon enough he lets out a hacking cough, his belly swollen to the point it looks like he’s carrying a litter of a dozen kits.");
			output("\n\nHe puts a hand to his throat, then opens his mouth as [pc.cumColor] cum starts to dribble past his lips, then spurts across his tongue and onto the ice. You’ve turned him into nothing more than a sex toy, each throb of your [pc.cock " + x + "] forcing your seed into his cheeks and past his lips. Soon enough he’s spraying jizz from his mouth and nose, unable to hold it down. Watching him unable to do anything but accept his role as your cumdump, you can’t help but be spurred further onwards - it feels <i>so good</i> to have someone to fill up like this.");
			output("\n\nIt takes a couple of hours for you to deflate enough to pull out, during which you make sure to use the barbarian to your advantage. By the time you wrest yourself free, you’ve left him an insensate wreck. The initial shame of being used as your leaking semen-tank has long since worn off to be replaced by resignation. A waterfall of backed-up jizz cascades down his legs from his ruined asshole, stretched out by your knot and still packed full of cum.");
			output("\n\nYou stretch out, reveling in the icy cold as a stark contrast to the heat of the milodan. You look back to see him dragging himself away from you, unable to get to his feet just yet. You shrug. Suppose you can’t blame him.");
		}
	}
	output("\n\n");
	processTime(30+timeBonus);
	enemy.loadInAss(pc);
	pc.orgasm();
	CombatManager.genericVictory();
}

//Ride vaginal (requires vagina, nontaur)
public function rideVaginalMilodanMaleBecauseTHEYIFFENING():void
{
	clearOutput();
	showMilodanMale(true);
	author("Wsan");
	output("Pushing him onto his back");
	if(!pc.isNude()) output(" and casually disrobing");
	output(", you clamber atop the furry barbarian and smile down at him.");
	output("\n\n<i>“I hope you fuck better than you fight,”</i> you remark, softly stroking his chest. He rumbles at your touch, and you feel his cock stiffening against your ass. <i>“This must be for me, huh?”</i>");
	output("\n\nYou’re content to tease him a little, slowly rubbing his length with your [pc.butt] until his prick begins to slowly drip pre-cum between your cheeks. Satisfied the both of you are wet enough, you lift your hips and slide backwards until your slick pussy is poised right over his throbbing cock. Slowly dropping your hips downwards, you moan in satisfaction as you feel his crown spread your folds apart.");
	output("\n\n<i>“That’s a good boy,”</i> you say breathlessly, feeling his inches slowly filling your cunt.");
	output("\n\nHis member sinks into the depths of your pussy, the heat of him assuaging the inner need you didn’t even know you had. Sighing with happiness, you slide down his length until your progress is arrested by his hips. You experimentally gyrate across his adonis belt, enjoying the feeling of the barbarian fully hilted inside your pussy.");

	var vIdx:int = pc.findEmptyPregnancySlot(1);
	if(vIdx < 0) vIdx = rand(pc.totalVaginas());

	output("\n\nAt ease atop the milodan, you start to raise your hips before dropping yourself back down. A little spike of pleasure radiates outwards from your groin, rebounding and growing in intensity until you’re crying out and shaking your ass, pulling your legs together and squeezing his cock in orgasm. Wriggling and bucking on top of him, you slowly come down from your high and look at him with a touch more respect.");
	output("\n\n<i>“Still hard, huh? Looks like you </i>do<i> fuck better than you fight. How long can you keep that up for me?”</i>");
	output("\n\nHe makes no show of understanding or replying, prompting you to shrug and put your hands on his chest.");
	output("\n\n<i>“I think I’m going to ride you until I’m bored.”</i>");
	
	pc.cuntChange(vIdx,enemy.cockVolume(0));
	
	output("\n\nYou follow through on exactly that, pounding his cock into your pussy over and over, repeatedly bringing yourself to the peak of orgasm and always reaching it before he does. His lower half is soaked in your [pc.girlCum], your [pc.pussy " + vIdx + "] still clinging tightly to his cock as you drag it up and down his shaft.");
	if(pc.biggestTitSize() >= 1) output("\n\nYour [pc.breasts] jiggle and shake with every slap of flesh");
	else output("\n\nYour chest heaves with every slap of flesh");
	output(", your sweat running down your body to be wicked away into the fur of the milodan’s stomach. Your face is flushed red ");
	if(pc.hasHair() && pc.hairLength >= 3) output("and your hair is in wild disarray");
	else output("and you’re panting");
	output(", riding this slab of muscle for all he’s worth. And by your estimation, he’s worth a <i>lot</i>.");

	output("\n\n<i>“Guys would kill to have your stamina, you know,”</i> you pant raggedly, looking him in the eye. <i>“You’ve been fucking me for close to an hour by now and you haven’t cum once. Although,”</i> you say playfully, corners of your mouth curling upwards, <i>“I guess that’s mostly on me, huh?”</i>");
	output("\n\nHe grunts noncommittally, but you see a measure of need in his expression. He definitely wants to blow his load inside you, the only question is whether you’ll let him.");
	processTime(50);
	pc.maxOutLust();
	clearMenu();
	addButton(0,"Yes",takeALootInYerCooterFromMildan,vIdx,"Yes","Take a load in the pussy.");
	addButton(1,"No",noPuppyPoppersForYou,undefined,"No","In the far future, the pull-out method has a 100% success rate.");
}

//[Yes]
public function takeALootInYerCooterFromMildan(vIdx:int):void
{
	clearOutput();
	showMilodanMale(true);
	author("Wsan");
	output("You might as well reward him for being such a good fucktoy. Getting to pump his jizz into your well-fucked pussy is the <i>least</i> you can grant him after letting you ride him to orgasm for so long.");
	output("\n\n<i>“Your lucky day, kittydog. I’m going to ride you, and I’m not going to stop until you pop,”</i> you declare, smiling down at him.");
	output("\n\nYou slowly gyrate your hips, encircling his cock before sliding down with deliberate slowness. You slowly increase your pace at a measured rate, bumping and grinding along his length until his entire shaft is being caressed by your passage. You pant and moan as you take his cock inside you over and over, not slowing at all in your frenzied lust. You feel his knot start to bulge and inflate right when you’re on the verge of orgasm, and grab a hold of his chest fluff with one hand.");
	output("\n\n<i>“Cum in me,”</i> you gasp, collapsing onto his chest even as your hips continue working him for all he’s got.");
	output("\n\nYour sodden fuckhole is rewarded for your efforts, the slap of flesh on flesh giving way to groans and tired panting as you feel the warmth of his seed beginning to spurt into your pussy. You can feel him fiercely squeezing your [pc.ass] with his mitts as he pumps you full, but you’re too far gone to care or protest.");
	output("\n\nTo his credit, he leaves the knot outside. When you regain the ability to move your hips, you idly scratch his chest fluff and stand, sighing a bit as he slips free, still hard.");
	output("\n\n<i>“Guess you’ll have to find someone else to take care of that, pup,”</i> you say cordially. <i>“Thanks for the good time, though.”</i>");
	output("\n\nYou ");
	if(!pc.isCrotchExposed()) output("throw your clothes back on and ");
	output("head out, leaving the milodan lying in the snow with orders to <i>“Stay”</i> until you’re gone.\n\n");

	pc.loadInCunt(enemy,vIdx);
	processTime(5);
	pc.orgasm();
	CombatManager.genericVictory();
}

//[No]
public function noPuppyPoppersForYou():void
{
	clearOutput();
	showMilodanMale(true);
	author("Wsan");
	output("He <i>has</i> been such a wonderful fucktoy... but he still lost, and losers don’t get to cum inside. You resume riding him, your butt bouncing off his groin while he grunts, curling and uncurling his fingers.");
	output("\n\n<i>“You’re fighting your instincts, huh?”</i> you ask with a knowing smile, throwing your head back in seductive exultation. <i>“You just wanna grab me... hold me down and fuck me senseless, don’t you?”</i>");
	output("\n\nYour own words excite you, your breath coming faster and faster as you describe the lurid acts the milodan would subject you to in whispers.");
	output("\n\n<i>“You’d keep me there and breed me like the brute you are, your knot keeping me tied up and docile, right? Just lying there like a loyal bitch and getting pumped full of hot, sticky cum?”</i>");
	output("\n\nYou cry out in triumph as you feel yourself cumming again, and slip his sizeable cock out of you right as he begins to spurt jizz across your ass.");
	output("\n\n<i>“But you don’t get to do any of that,”</i> you murmur, lying on his chest and looking down at him with hooded eyes. You wiggle your butt, feeling the warmth of his seed rain down on your buttcheeks and lower back with a moan. <i>“Oh, what a waste...”</i>");
	output("\n\nThe barbarian growls in dissatisfaction, but you only laugh it off. <i>“That’s what you get for losing, pup.”</i>");
	output("\n\nYou scratch his chest fluff and dismount, standing to");
	if(!pc.isNude()) output(" throw your clothes back on and");
	output(" head out, leaving the still-hard milodan lying in the snow with orders to <i>“Stay”</i> until you’re gone.\n\n");
	processTime(7);
	pc.orgasm();
	CombatManager.genericVictory();
}

//Ride anal (requires asshole, nontaur)
public function takeMaleMilodanForAnAnalRide():void
{
	clearOutput();
	showMilodanMale(true);
	author("Wsan");
	output("You give him a gentle push and he falls onto his butt, his loincloth already tented as he watches you ");
	if(!pc.isNude()) output("disrobe");
	else output("approach");
	output(". You give him a smirk as he hastily pushes the fabric aside.");

	output("\n\n<i>“Good boy. Just sit there and let me do the work,”</i> you murmur, putting your hands on his sturdy shoulders and slowly sitting down on his lap. <i>“Ooooh,”</i> you groan, feeling your [pc.asshole] stretch out to take him. <i>“You’re a big boy...”</i>");

	output("\n\nYou kneel halfway down, panting already as you acclimate to the feeling of having his nubbed cock inside your ass, then resume your sliding descent. He grunts, an extended exhalation issuing forth from his snout while you hilt yourself on his fat prick. Sitting more or less face-to-face with the brute, you grin.");
	pc.buttChange(enemy.cockVolume(0));

	output("\n\nNo words are necessary as you slowly raise yourself up and drop down, moaning in satisfaction at the feeling of fullness, ");
	if(pc.hasCock() && !pc.hasVagina()) output("your [pc.cocks] dripping pre-cum");
	else if(pc.isHerm()) output("your [pc.vaginas] and [pc.cocks] dripping");
	else if(pc.hasVagina()) output("your [pc.vaginas] dripping wet");
	else output("your stuffed hole clenching needfully");
	output(". You deliberately swivel your hips in his lap, enjoying watching his lip curl upwards to reveal his teeth. Grasping the scruffy fur on his cheeks, you lean in to whisper in his ear as you slide back up his pole.");
	output("\n\n<i>“I think you might be- ah! Enjoying this more than I am...”</i>");

	output("\n\nYou’re somewhat amused to see the effect your words have on him; he struggles to regain a semblance of a stoic appearance, evidently of the opinion that if he lost his honor in a fight he should reclaim it in fucking. Well, if that’s how it’s going to work, you’re going to have him pay you back in full. Bouncing up and down on your haunches, you let out a gasp every time he bottoms out in your ass.");

	output("\n\nTaking advantage of the closeness, you slyly press yourself against his broad chest, ");
	if(pc.biggestTitSize() >= 1) output("the [pc.skinFurScales] of your breasts rubbing softly against his pecs");
	else output("rubbing your [pc.skinFurScales] softly against his furred pecs");
	output(". Hanging your head over his shoulder, you breathlessly pant in his ear as you drag yourself up and down his swollen cock, pre-cum already slickening your passage. A sultry moan slips past your lips as you run your hands through the fur on his back, enjoying the feel of his muscles beneath.");
	output("\n\nYou can feel the familiar thrum of orgasm approaching while your butt bounces off his thighs with the muted slaps of [pc.skinFurScales] on fur, your ");
	if(pc.hasCock() && !pc.hasVagina()) output("[pc.cocks] drooling and hardening");
	else if(pc.isHerm()) output("[pc.vaginas] drooling and [pc.cocks] hardening");
	else if(pc.hasVagina()) output("[pc.vaginas] drooling");
	else output("pucker quivering");
	output(" as you get closer to the finish line. Clutching at his shoulderblades, you gasp and shudder as it overtakes you, the rush of endorphins making your lower body jerk erratically on his cock.");

	output("\n\nThe milodan grunts as you cum all over him, your");
	//cock+noPussy:
	if(pc.hasCock() && !pc.hasVagina()) 
	{
		output(" prick");
		if(pc.cockTotal() > 1) output("s");
		output(" pumping seed all over his stomach every time his nubbed dick stimulates your prostate");
	}
	else if(pc.isHerm())
	{
		output(" cunt");
		if(pc.totalVaginas() > 1) output("s");
		output(" covering his thighs in femcum and your prick");
		if(pc.cockTotal() > 1) output("s");
		output(" pumping seed all over his stomach every time his nubbed dick stimulates your prostate");
	}
	else if(pc.hasVagina())
	{
		output(" cunt");
		if(pc.totalVaginas() > 1) output("s");
		output(" covering his thighs in femcum. He begins to thrust from below as you bathe in the afterglow, and you’re more than content to let him.");
	}
	else output(" anus quivering in sublime pleasure");
	output(".");

	output("\n\nIt’s not long before he has you cumming a second time, your head tucked under his chin as he pummels you from underneath. Then a panting, groaning third. Realizing he’s going to keep this up until you tell him to cum, you grab onto his hair and force him to look down at you.");

	output("\n\n<i>“Just cum already,”</i> you gasp raggedly, your voice lilting as he bounces you up and down.");

	output("\n\nWith his giant hands on your [pc.butt], he lurches upward with tremendous strength to a standing position, carrying you with ease. Thrusting upwards with powerful bucks of his hips, he begins to growl every time he hilts himself, growing louder and louder until he lets loose a bestial roar and slams you down on his throbbing cock. Warm jizz begins to flood your ass, heating you up as it courses through your insides. The milodan grunts and thrusts into you a couple more times, leaving you hilted and panting hotly while his jizz runs down your quivering legs.");
	pc.loadInAss(enemy);

	output("\n\nYour own orgasm wasn’t far behind his, albeit far less muted in volume. The snow beneath you is a mess of your mixed fluids, seed dripping freely onto the ice to freeze there. The milodan kneels to lay you out on the untouched ground, his gentle extraction of his still-hard prick a stark contrast in comparison to how he fucked you. A rush of spunk pours from your gaped asshole as he stands and strides away, leaving you wondering whether you ever really won the fight against him. Something you’ll have to ponder later - it’s too cold to stick around here. You ");
	if(!pc.isAssExposed()) output("chuck your clothes on and ");
	output("set out again.\n\n");

	processTime(35);
	for(var x:int = 0; x < 4; x++) { pc.orgasm(); }
	CombatManager.genericVictory();
}

//Taurssionary (requires taur)
//Requires genitalia
public function taurssionaryWithFloofyBoyslut():void
{
	clearOutput();
	showMilodanMale(true);
	author("Wsan");
	output("<i>“Get up,”</i> you command, beckoning the milodan over. <i>“On your knees. Oof, that’s cold,”</i> you complain as you lie down, rolling onto your back with your legs spread. <i>“Get over here and warm me up.”</i>");
	output("\n\nThe milodan scuffles forward on his knees, eyes fixated on your [pc.vagOrAss] and his cock tenting his loincloth. Once it’s clear that you’re giving him the lead, he wastes no time in grabbing your hindlegs and sliding his prick into your warm fuckhole, a pleased grunt escaping his lips at the reprieve from the harsh wind. You throw your head back and moan while he pushes in, the nubs on his crown rubbing your sensitive walls in all the right ways as he spreads you wide around his cock.");
	output("\n\nThe milodan shoves himself to the hilt in your sweltering [pc.vagOrAss], sending a shiver up your spine that has nothing to do with the cold. Deigning to let this brute fuck you after beating him only turns you on all the more, and he certainly seems grateful for the chance. He’s fucking your [pc.vagOrAss] with a determination that suggests he wants to reclaim his honor - or maybe he just wants to breed your unfamiliar form. The mostly-silent barbarian is somewhat of an enigma, but if nothing else, he’s a fantastic fucktoy.");
	
	var vIdx:int = -1;
	if(pc.hasVagina() && pc.blockedVaginas() == 0){
		vIdx = pc.findEmptyPregnancySlot(1);
		if(vIdx < 0) vIdx = rand(pc.totalVaginas());
	}
	
	if(vIdx >= 0) pc.cuntChange(vIdx, enemy.cockVolume(0));
	else pc.buttChange(enemy.cockVolume(0));
	
	output("\n\nLeaning over your tauric stomach, he takes ahold of your underside with his left hand and begins hammering you with rough movements of his hips, reaching down with the other to ");
	if(vIdx >= 0) output("rub your [pc.clits " + vIdx + "], bringing you to thunderous orgasm in a matter of seconds. You unconsciously buck your hips, gritting your teeth as the rush of endorphins floods your body. The barbarian holds you down with a firm hand on your stomach, keeping you grounded while your back arches and your voice comes out in high-pitched moans.");
	else output("jack your [pc.cock], bringing you to a back-arching orgasm in a matter of seconds. Your legs flex and shake as you grit your teeth and grunt, [pc.cumColor] [pc.cum] spurting across your underside as the rush of endorphins floods your body. The barbarian holds you down with a firm hand on your stomach, keeping you grounded while he continues stroking your prostate with his cock and your voice comes out in stumbling utterances.");

	output("\n\nHe doesn’t let up, keeping a maddeningly pleasurable rhythm going all throughout your orgasm. You realize with some trepidation, amidst your sweaty, panting fucking, that the milodan shows no signs of wearing out or slowing down. His cock driving into you over and over makes it hard to maintain a semblance of conscious thought, but you wonder wildly what lucky bitch gets to be his breeding mate. By the time he fucks the next trembling, brain-melting orgasm out of you, you’re starting to realize he probably won’t stop until you actually tell him to. Part of you wonders what it’d be like to just let him keep going for as long as he wants...");
	
	processTime(30);
	pc.orgasm();
	pc.orgasm();
	//[Keep going] [Cum]
	clearMenu();
	addButton(0,"Keep Going",keepGoingAndBadEndYourselfOrSomeShitOnMilodanEndurance, vIdx);
	addButton(1,"Cum",cumFromMilodanButtpounds, vIdx);
}

//[Keep going]
public function keepGoingAndBadEndYourselfOrSomeShitOnMilodanEndurance(vIdx:int = -1):void
{
	clearOutput();
	showMilodanMale(true);
	author("Wsan");
	output("<i>“Don’t - stop!”</i> you pant wildly, your humanoid half supported only by your shaky arms as you close your eyes. <i>“Oh, </i>fuuuck!<i>”</i>");
	output("\n\nYour lower half completely locks up in orgasm, every muscle tensed to the point it’s almost painful while the waves of pleasure roll over you.");
	output("\n\n<i>“Fuh, fuu- guh! Fuuuck,”</i> you groan, realizing you might have bitten off more than you can chew. <i>“Oh, </i>god!<i>”</i>");
	output("\n\nDisplaying tremendous strength, he lifts your entire back half with his massive arms to get a better angle to fuck you into submission. You can scarcely keep ahold of your senses, your hands scrabbling through the snow as you try to steady your uncooperative body. The milodan is the one in control now, each stroke and touch making your body respond in turn, your ");
	if(vIdx >= 0) output("cunt");
	else output("ring");
	output(" tightening around him every time he pushes into you, your lips singing his praises every time he hilts himself.");

	output("\n\nAt some point over the next couple of hours he flips you onto your stomach, holding your legs apart and fucking your behind with abandon. He lets go to give your [pc.butt] a fierce slap knowing he can get away with it, and all you can do is give him a fucked-silly mewl of a moan as you ");
	if(vIdx >= 0) output("cum on his cock");
	else output("shudder in orgasm, your cock spurting spunk across the ground");
	output(". He’s pushing you further and further towards unconsciousness, his relentless conquest of your fuckhole continuing despite the fact your cries and gasps have become wordless grunts and ragged moans, your full-body bucks and twists now exhausted shaking and shuddering.");

	output("\n\nHe gives a bestial roar when he finally cums, flooding your abused hole with a torrent of built-up spunk as your eyes threaten to roll back into your head at the sensation. ");
	if(vIdx >= 0) output(" The feeling of his swollen knot pressing down on your [pc.clits " + vIdx + "] drives you to one last orgasm, unable to resist");
	else output(" The feeling of his pulsing cock pressing down on your prostate drives you to one last orgasm, unable to resist");
	output(". Your hindlegs involuntarily kick outwards as he dismounts, your lack of control self-evident. The milodan walks away, leaving you lying in the snow.");

	output("\n\nYou woozily remind yourself that you won the fight between the two of you, although your post-battle encounter has left you less certain of that fact. You uncertainly struggle to your feet, shakily stretching out your hindlegs ");
	if(!pc.isCrotchExposed() && !pc.isAssExposed()) output("and putting on your clothes ");
	output("before you head out.");

	processTime(145);
	if(vIdx >= 0) pc.loadInCunt(enemy, vIdx);
	else pc.loadInAss(enemy);
	for(var x:int = 0; x < 20; x++) { pc.orgasm(); }
	output("\n\n");
	CombatManager.genericVictory();
}

//[Cum]
public function cumFromMilodanButtpounds(vIdx:int = -1):void
{
	clearOutput();
	showMilodanMale(true);
	author("Wsan");
	output("As hard as it is to say so, having him cum now rather than in six hours is probably for the best. You reach down and grab a handful of his hair, resisting the urge to just run your fingers through it and moan like a whore, and pull his head up to meet your eyes.");
	output("\n\n<i>“Cum in me,”</i> you gasp, hoping he gets the message.");
	output("\n\nLetting go, you collapse back on the ground and shudder as you feel him start to pound you even harder. Displaying tremendous strength, he lifts your entire back half up and starts slamming his hips into your hindquarters, leaving you to helplessly cry out in submissive pleasure. You struggle to keep a grip on your senses, every thrust threatening to send your eyes rolling back into your head.");
	output("\n\nWhen he finally grunts through gritted teeth, sounding every bit like an unfettered beast, you feel a rush of intense gratitude as his warm jizz begins to flood your insides. You’re too tired to do anything but pant and take it, feeling his seed beginning to run down your ass. He might be an amazing fuck, but an off button might have been a nice feature. He dismounts, leaving you lying in the snow with your chest heaving.");
	output("\n\nAs he walks away, you find yourself dazedly wondering if you ever really won the fight at all. If nothing else, you’ll never forget the result. You shakily get to your feet and ");
	if(!pc.isCrotchExposed() && !pc.isAssExposed()) output("put your clothes on before you ");
	output("head out.");
	processTime(15);
	
	if(vIdx >= 0) pc.loadInCunt(enemy, vIdx);
	else pc.loadInAss(enemy);
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}

//Give rimjob
public function giveMilodanMalesStinkyButtholeALick():void
{
	clearOutput();
	showMilodanMale(true);
	author("Wsan");
	output("You indicate he should get on all fours and given no choice in the matter, he shakily obeys your command. The furred barbarian looks back at you with some trepidation, clearly not too eager to be penetrated. You smirk - boy, have you got a surprise for him. He squeezes his eyes shut and turns back around as you kneel behind him, bracing himself for the dick in his ass that never makes its appearance.");
	output("\n\nHe starts when you bend down and gently sweep your tongue across his pucker, a low rumbling emanating from his throat as you slide your hand down his muscular buttock and around to caress his sheath. Between your [pc.tongue] tenderly slipping across his slowly-relaxing asshole and your hand rubbing his sheath, it’s not long before you coax his cock out.");
	output("\n\nWith slow, deliberate strokes of your hand and tongue, you soon have him weakly thrusting into your palm, dripping sticky pre-cum all over your fingers. You gently bring him to merciful release, the milodan grunting as he thrusts into your encircling hand, his knot swelling in your velvet-soft grip. You don’t stop there, though, pushing your tongue into his slickened ring. You get the exact reaction you were looking for, a surprised intake of breath... and another dribbling spurt pumped from his cock.");
	output("\n\nWithin a minute he’s completely surrendered to your ministrations, face on the ice and ass pressing back into your [pc.tongue].");
	if (pc.hasTongueFlag(GLOBAL.FLAG_LONG)) 
	{
		output("\n\nPlanting your lips on his pucker, you drive your tongue into his asshole, further spurring him onto orgasm when you begin tongue-stroking his prostate. He makes a sound like you’ve impaled him, and you suppose you have. His stubby tail erratically jerks from side to side, enticing you to grab a hold of it as you force yourself as deep as you can get.");
		output("\n\nHe gasps like a girl, wriggling in your grip and unable to escape the insane pleasure of having your tongue all the way up in him. Thrusting into him, you revel in his girly moans while he drips in your hand like a faucet. With your face buried between his cheeks, you bring him to yet another strained orgasm, the milodan unable to help himself. He <i>really</i> bucks when you snake your tongue through his spasming walls and rub his prostate during his orgasm, trying to prevent his grunting and straining from rising a couple of octaves.");
	}
	else
	{
		output("\n\nPlanting your lips on his pucker, you drive your tongue into his asshole, further spurring him onto orgasm when you lick around his insides. He makes an uncharacteristically feminine noise, and you can’t help but grin at how surprised he must be. His stubby tail erratically jerks from side to side, enticing you to grab a hold of it as you force yourself as deep as you can get.");
		output("\n\nHe gasps like a girl, wriggling in your grip and unable to escape the insane pleasure of having your tongue inside him. Thrusting into him, you revel in his girly moans while he drips in your hand like a faucet. With your face buried between his cheeks, you bring him to yet another strained orgasm, the milodan unable to help himself. He <i>really</i> bucks when you snake your tongue through his spasming walls during his orgasm, trying to prevent his voice rising a couple of octaves.");
	}
	output("\n\nWhen his ass finally stops seizing around you and allows your tongue to slip free, he slumps onto the ice under the assumption you’re done. You don’t think he was quite ready for that particular sexual technique. His cock is still hard in your hand, though, and his knot hasn’t deflated; there’s no reason you couldn’t just keep him cumming his brains out from being tongue-fucked...");
	output("\n\n....");
	output("\n\nBy the time you let him go, you’ve made him paint both the ice and his stomach in pearlescent white jizz. His cock is still drooling pre-cum even now, but you’ve had your fun. Leaving the still-shaking barbarian on the ground, you walk away with a smile. Maybe you should do this more often.");
	processTime(60);
	pc.changeLust(30);
	output("\n\n");
	CombatManager.genericVictory();
}

//Leave
public function leaveDatMilodanHesASlutAnywayItsNotLiekYouLikedHimOrAnythingBaka():void
{
	clearOutput();
	showMilodanMale();
	author("Wsan");
	if(pc.isNice())
	{
		output("<i>“Not right now, though,”</i> you say, getting to your feet. <i>“Maybe next time, huh?”</i>");
		output("\n\nWalking away, you leave the ");
		if(enemy.lust() >= enemy.lustMax()) output("groaning milodan masturbating in the snow, unable to find release on his own");
		else output("battered milodan slumped in the snow");
		output(". Sucks to be him, but maybe he shouldn’t have tried attacking you.");
	}
	else if(pc.isMischievous())
	{
		output("<i>“I’m not really in the mood either, to be honest,”</i> you say, getting to your feet. <i>“Better luck next time!”</i>");
		output("\n\nWalking away, you leave the ");
		if(enemy.lust() >= enemy.lustMax()) output("groaning milodan masturbating in the snow, unable to find release on his own");
		else output("battered milodan slumped in the snow");
		output(". Sucks to be him, but maybe he shouldn’t have tried attacking you.");
	}
	else
	{
		output("<i>“In fact,”</i> you say, rising to your feet, <i>“I think I’m going to do just that.”</i>");
		output("\n\nWithout a second thought, you leave the ");
		if(enemy.lust() >= enemy.lustMax()) output("groaning milodan masturbating in the snow, unable to find release on his own");
		else output("battered milodan slumped in the snow");
		output(". None of your business what happens to a would-be attacker on a hostile planet.");
	}
	//Victory credits (and items?) go here
	output("\n\n");
	CombatManager.genericVictory();
}

//Added in Routing for if PC has Fuck Fever
public function lossSceneToMaleMilodanRouting():void
{
	if (inOmegaHeat()) omegaLossToMiloMale();
	else lossSceneToMaleMilodan();
}
//Loss scenes
//Post-fite text
public function lossSceneToMaleMilodan():void
{
	clearOutput();
	showMilodanMale(true);
	author("Wsan");
	
	IncrementFlag("MILO_MALE_CON_LOSSES");
	
	output("You collapse onto the ice, the savage beating of the milodan too much to bear. He saunters over to you casually, the confident hunter having secured his quarry. ");
	if(!pc.hasCock() && pc.blockedVaginas() > 0)
	{
		output("He sniffs you once, then prods your body. Finding your groin securely blocked, he snorts in disappointment and kicks you square in the gut.\n\nSeemingly satisfied, he leaves.");
		output("\n\n");
		CombatManager.genericLoss();
		return;
	}

	if(enemy.meleeWeapon.longName != "claw") output("Dropping his weapon");
	else output("Sheathing his claws");
	output(", the musclebound barbarian easily picks you up and hefts you ");
	if(pc.isTaur()) output("into a heap, your legs folding under you");
	else output("onto your stomach");
	output(". You hear the sound of fabric from behind you, then his loincloth lands next to your face. It smells unmistakably male, the odor of rut drifting past your nostrils.");

	processTime(8);
	//PC has vagina
	if(pc.hasVagina())
	{
		var vIdx:int = pc.findEmptyPregnancySlot(1);
		if(vIdx < 0) vIdx = rand(pc.totalVaginas());
		
		if(pc.isBimbo()) 
		{
			output("\n\nThe scent fills your head, visions of being bred dancing through your mind. Your ");
			if(pc.vaginas[vIdx].wetness() >= 3) output("already-slick ");
			output("pussy gushes a stream of fem-lube as you excitedly spread your ");
			if(pc.isTaur()) output("hindlegs");
			else if(pc.legCount > 1) output("[pc.legs]");
			else output("entrance");
			output(", already eager to be taken");
		}
		//non-bimbo:
		else
		{
			output("\n\nYou can’t help but get wet, the scent hanging around your head like a haze. You unconsciously spread your");
			if(pc.isTaur()) output(" hindlegs");
			else if(pc.legCount > 1) output(" [pc.legs]");
			else output("self open");
			output(", ");
			if(pc.vaginas[vIdx].wetness() >= 3) output("your pussy already slick");
			else output("your pussy slickening");
			output(" in your need to be roughly taken");
		}
		output(". The brute sinks to his knees behind you, ");
		if(pc.buttRating() < 12) output("lightly slapping your [pc.ass] and leaving his hand there.");
		else output("grabbing ahold of your [pc.butt] and pulling your cheeks apart to expose your dripping sex.");

		output("\n\nAligning himself, he wastes no time slipping inside your [pc.pussy " + vIdx + "]. The head of his cock spreads your inviting folds apart, and you discover to your delight that his crown is covered in bumpy nodules. The tactile sensation of him sinking further into your depths is enough to make you quiver in his grip, the milodan slapping your ass to keep you still.");
		
		pc.cuntChange(vIdx,enemy.cockVolume(0)/2);
		
		output("\n\nHe doesn’t hesitate at all in pushing straight up to your womb, fully intent on making you his breeding bitch. You can’t help but moan in pleasure at the feeling of being filled, your sweat being wicked away into his fur as he thrusts into you. He shifts his hands from your butt to your [pc.hips], his grip loosening somewhat. You could try wrestling him for dominance if you wanted to switch it up, ");
		if(pc.lust() >= pc.lustMax()) output("your pussy still burning with insatiable need");
		else output("even as battered as you are");
		output("...");

		//[Wrestle] [Don’t]
		clearMenu();
		addButton(0,"Wrestle",pussyWrasslin, vIdx);
		addButton(1,"Don’t",dontWrassleBecauseWrasslinIsDumbAndYourPussyNeedsFucked, vIdx);
	}
	//PC has no pussy
	else
	{
		output("\n\nYou unconsciously spread your");
		if(pc.isTaur()) output(" hindlegs");
		else if(pc.legCount > 1) output(" [pc.legs]");
		else output("self out");
		output(" in your need to be roughly taken, your [pc.asshole] vulnerable to the milodan’s touch. The brute sinks to his knees behind you, ");
		if(pc.buttRating() < 12) output("lightly slapping your [pc.ass] and leaving his hand there");
		else output("grabbing ahold of your [pc.butt] and pulling your cheeks apart to expose your pucker");
		output(".");

		output("\n\nAligning himself, he wastes no time slipping inside your asshole. The head of his cock spreads your ring apart, and you discover to your delight that his crown is covered in bumpy nodules. The tactile sensation of him sinking further into your depths is enough to make you quiver in his grip, the milodan slapping your ass to keep you still.");
		output("\n\nHe doesn’t hesitate at all in pushing straight up to the hilt, fully intent on making you his bitch. You can’t help but moan in pleasure at the feeling of being filled, your sweat being wicked away into his fur as he thrusts into you. He shifts his hands from your butt to your [pc.hips], his grip loosening somewhat. You could try wrestling him for dominance if you wanted to switch it up, ");
		if(pc.lust() >= pc.lustMax()) output("your insides still burning with insatiable need");
		else output("even as battered as you are");
		output("...");

		//[Wrestle] [Don’t]
		clearMenu();
		addButton(0,"Wrestle",cockwrassleTheMilodanMale);
		addButton(1,"Don’t",dontWrestleTheMilodanBecauseHisCockIsBetterThanYours);
	}
}

//[Wrestle]
public function pussyWrasslin(vIdx:int = 0):void
{
	clearOutput();
	showMilodanMale(true);
	author("Wsan");
	var win:Boolean = (pc.physique()/2 + rand(20) + 1 >= enemy.physique()/2 + 10);
	//nontaur success
	if(!pc.isTaur() && win) 
	{
		output("On his outward stroke, you pull yourself forward and flip over, kneeing the surprised milodan in the snout. He recoils momentarily, blinking and raising a hand to his face as you take the initiative and push him onto his back. In a flash, you’re the one on top and sliding down his cock with a self-satisfied grin.");
		output("\n\n<i>“Oooh, yes,”</i> you groan, lewdly wriggling your hips on his crotch. <i>“That’s more like it.”</i>");
		output("\n\nThe milodan recovers quickly enough and struggles to reclaim his position atop you, but having expected it, you have no problem holding him down. You also suspect that perhaps he’s not trying as hard as he could be; if his grunts are any indication, he’s enjoying this every bit as much as you are. On a downstroke that hilts him inside you with a satisfying wet slap, you notice the base of his cock beginning to swell outwards.");
		
		pc.cuntChange(vIdx,enemy.cockVolume(0));
		
		output("\n\n<i>“Oh, is kitty gonna knot me?”</i> you moan, running a hand through the scruffy fur on his face. <i>“You gonna tie up your bitch and breed [pc.himHer]? Make me all yours?”</i>");
		output("\n\nLeaning in close, you breathe hotly in his ear. <i>“Do it, you fucking pansy.”</i>");
		output("\n\nWhether or not he fully understands, you get exactly the reaction you were looking for. He surges up from beneath you, his muscles bulging as he wrests your giggling form back into submission, holding your hands together above your head. You moan in exquisite delight as he pumps you urgently, his knot stretching your lips every time it slips back out. There’s a desperation in his thrusting now, as if you’ve spurred him to try and reclaim his honor by fucking you into complete submission.");
		output("\n\nReveling in the rough treatment, you pant and groan as you begin to crest towards a powerful orgasm. You can feel your stomach tying itself in knots, your legs shaking perceptibly as you open your mouth and insensate, whorish moans slip right out of it. You buck under him, feeling his knot bulge and press against your rippling cunt. He holds you down as you thrust your hips into him, gyrating and gasping open-mouthed while you ride his cock.");
		output("\n\nHe roughly pulls you off the ground and into his lap with a loud grunt, thrusting upwards as you feel the first jets of seed begin to paint your vaginal walls. Panting, he buries himself as far into your pussy as he can get. With the tip of his cock pressed right up against your cervix, warm seed begins to ");
		if(pc.isPregnant(vIdx)) output("fill your passage, the gigantic knot preventing any cum from escaping.");
		else output("spray into your womb, eventually overflowing back into your passage, his gigantic knot preventing any cum from escaping.");

		output("\n\nCavorting in his lap, you ride him through his orgasm until the final few spurts of jizz spurt into your cunt and you collapse, panting with your arms thrown around each other. A few seconds passes before you feel him shift under you, and you moan slightly as you feel him beginning to pull out. A river of spunk and your own orgasmic fluids drips from your gaping cunt, but only for a few seconds. He surprises you by thrusting right back in, your back arching accompanied by a surprised gasp of pleasure.");
		output("\n\n<i>“I knew a guy like you had to have more in you,”</i> you growl affectionately, rubbing the side of your face against his. <i>“Show me what you’re good for?”</i>");
		output("\n\nHe’s more than happy to oblige you, spinning you around in his lap and looping his arms under your armpits to restrain you. You can scarcely do anything but gasp and cry out in his grip as he pumps you from below, thrusting his still-inflated knot in and out of your pussy. You orgasm in record time, your shaking and flexing kept in check by his iron grip. You’re certain now; he was sandbagging in your earlier fight. There’s no possibility you can do anything to resist right now, and the thought of fighting back is so far from your mind you don’t even care.");
		output("\n\nThe next few hours pass by in a blur, switching to positions that only a male of his build could support. He fucks you full of spunk over and over, at one point bouncing you on his hips while standing, the next moment lying under you with his legs holding yours apart and arms wrapped around yours to keep you immobile. He demonstrates a martial mastery of your own body, bringing you to restrained orgasms again and again.");
		
		if (milodanBadEndHandler()) return; 
	}
	else if(!pc.isTaur())
	{
		output("You struggle to rise to your [pc.feet], scrabbling for grip on the ice. Sensing your insubordination, the milodan sinks his hands into your [pc.skinFurScales] and begins pounding your lewdly-squelching cunt with reckless abandon. On your feet and panting, you elbow him in the ribs and shake in a desperate attempt to dislodge the barbarian from your hindquarters, but he manages to hang on and hold you steady. Only after a brief struggle do you notice you’ve started thrusting your ass backwards into him, crying out like a whore every time he fills your sodden fuckhole. Realizing you’ve been well and truly defeated, you dejectedly sink back to your knees.");
		output("\n\nThe milodan only gets rougher from there, seemingly punishing you for daring to try and disrupt the natural order: the winner does the fucking, the loser takes it like a bitch. You give him an embarrassed squeal when he spanks your [pc.butt], leaving it smarting. You’d hang your head in shame if he wasn’t thrusting so violently, jerking your body about ");
		if(pc.biggestTitSize() >= 1) output("and setting your [pc.breasts] jiggling against your chest");
		else output("and making it impossible to concentrate");
		output(".");

		output("\n\nEvery time he pounds your wet, slick passage you can feel the base of his cock begin to swell just enough to be noticeable, forcing your folds apart and spreading you wide for him. With each dominant push it grows just that little bit more, and soon enough your lusty moans give way to exhalations through gritted teeth and groans of exertion. It feels like his knot is hollowing you out, the milodan refusing to let it rest anywhere outside of your pussy and only giving you scant seconds to get used to its inflated bulk before he pulls it out and rams it back in.");
		
		pc.cuntChange(vIdx,enemy.cockVolume(0));

		output("\n\nDespite his treatment of you, or perhaps <i>because</i> of it, you find yourself rapidly cresting towards a powerful orgasm, your stomach tying itself in knots as you grunt. As frustrating as it is to cum under his ministrations, you can’t deny their effectiveness. When it’s finally all just too much to take, you lift your head to cry out to the heavens and cum explosively, your cunt rippling around and massaging his knot for all its worth. He doesn’t let up at all, mercilessly fucking your writhing form through your feminine orgasm.");

		output("\n\nWhen he grunts and you begin to feel the warmth of his seed jetting inside you, you actually feel a surge of gratefulness that he’s finally going to stop toying with you. You’d much rather be his subservient cumdump than try to fuck his knotted cock again - your legs are so shaky you doubt you’ll even be able to get up when he lets you go. Panting, he thrusts forward and buries himself as far into your hindquarters as he can get. With the tip of his cock pressed right up against your cervix, warm seed begins to ");
		if(pc.isPregnant(vIdx)) output("fill your passage, the gigantic knot preventing any cum from escaping.");
		else output("jet into your womb, eventually overflowing back into your passage, his gigantic knot preventing any cum from escaping.");

		output("\n\nA few minutes of feeling his jizz spurt into you in ropes passes by quickly, and soon enough you feel his knot begin to deflate. You’re forced to admit you’re almost disappointed, but as you go to rise you notice the milodan hasn’t loosened his grip on you at all. Pulling his knot free, your pussy finally lets go of the loads it was holding, running down your legs and onto the ground. You’re granted a few moments of reprieve before you gasp in shock, feeling his dick rub along your still-sensitive pussy.");

		output("\n\nHe’s still raging hard, a fact he’s only too eager to demonstrate when he thrusts right back into your gaped-wide hole. Slamming his hips against your rump, your voice comes out in sharp little cries of bliss. He begins to work himself back up to the same intensity you were just subjected to, and you begin to realize you’re going to be under him for quite some time...");

		output("\n\n....");

		if (milodanBadEndHandler()) return;
	}
	else
	{
		output("You struggle to rise to your feet, your back legs scrabbling for grip on the ice. Sensing your insubordination, the milodan sinks his hands into your [pc.skinFurScales] and begins pounding your lewdly-squelching cunt with reckless abandon. On your feet and panting, you shake and buck in a desperate attempt to dislodge the barbarian from your hindquarters, but he manages to hang on and hold you steady. Only after a brief struggle do you notice you’ve started thrusting your ass backwards into him, crying out like a whore every time he fills your sodden fuckhole. Realizing you’ve been well and truly defeated, you dejectedly sink back to your knees.");
		pc.cuntChange(vIdx,enemy.cockVolume(0));
		output("\n\nThe milodan only gets rougher from there, seemingly punishing you for daring to try and disrupt the natural order: the winner does the fucking, the loser takes it like a bitch. You give him an embarrassed squeal when he spanks your [pc.butt], leaving it smarting. You’d hang your head in shame if he wasn’t thrusting so violently, jerking your body about ");
		if(pc.biggestTitSize() >= 1) output("and setting your [pc.breasts] jiggling against your chest.");
		else output("and making it impossible to concentrate.");

		output("\n\nEvery time he pounds your wet, slick passage you can feel the base of his cock begin to swell just enough to be noticeable, forcing your folds apart and spreading you wide for him. With each dominant push it grows just that little bit more, and soon enough your lusty moans give way to exhalations through gritted teeth and groans of exertion. It feels like his knot is hollowing you out, the milodan refusing to let it rest anywhere outside of your pussy and only giving you scant seconds to get used to its inflated bulk before he pulls it out and rams it back in.");
		output("\n\nDespite his treatment of you, or perhaps <i>because</i> of it, you find yourself rapidly cresting towards a powerful orgasm, your stomach tying itself in knots as you grunt. As frustrating as it is to cum under his ministrations, you can’t deny their effectiveness. When it’s finally all just too much to take, you lift your head to cry out to the heavens and cum explosively, your cunt rippling around and massaging his knot for all its worth. He doesn’t let up at all, mercilessly fucking your writhing form through your feminine orgasm.");
		output("\n\nWhen he grunts and you begin to feel the warmth of his seed jetting inside you, you actually feel a surge of gratefulness that he’s finally going to stop toying with you. You’d much rather be his subservient cumdump than try to fuck his knotted cock again - your legs are so shaky you doubt you’ll even be able to get up when he lets you go. Panting, he thrusts forward and buries himself as far into your hindquarters as he can get. With the tip of his cock pressed right up against your cervix, warm seed begins to ");
		if(pc.isPregnant(vIdx)) output("fill your passage, the gigantic knot preventing any cum from escaping.");
		else output("jet into your womb, eventually overflowing back into your passage, his gigantic knot preventing any cum from escaping.");

		output("\n\nA few minutes of feeling his jizz spurt into you in ropes passes by quickly, and soon enough you feel his knot begin to deflate. You’re forced to admit you’re almost disappointed, but as you go to rise you notice the milodan hasn’t loosened his grip on you at all. Pulling his knot free, your pussy finally lets go of the loads it was holding, running down your legs and onto the ground. You’re granted a few moments of reprieve before you gasp in shock, feeling his dick rub along your still-sensitive pussy.");

		output("\n\nHe’s still raging hard, a fact he’s only too eager to demonstrate when he thrusts right back into your gaped-wide hole. Slamming his hips against your rump, your voice comes out in sharp little cries of bliss. He begins to work himself back up to the same intensity you were just subjected to, and you begin to realize you’re going to be under him for quite some time...");

		output("\n\n....");

		if (milodanBadEndHandler()) return;
	}
	processTime(250+rand(100));
	for(var x:int = 0; x < 15; x++)
	{
		pc.orgasm();
		pc.loadInCunt(enemy,vIdx);
	}
	output("\n\n");
	CombatManager.genericLoss();
}

//[Don’t]
public function dontWrassleBecauseWrasslinIsDumbAndYourPussyNeedsFucked(vIdx:int = 0):void
{
	clearOutput();
	showMilodanMale(true);
	author("Wsan");
	output("<i>No</i>, you think dreamily, you’re perfectly content to just lie there and take it. He did beat you, after all, and now he’s claiming his prize. Seemingly sensing your utter submission, the milodan tightens his grip around your hips and begins slamming into your sodden pussy over and over. Using his immense arm strength he pulls you down his cock by your hips, right to the base every time he thrusts. Before long, you’re unconsciously following along in his motions.");
	output("\n\n<i>“Good,”</i> he grunts in approval. He sure doesn’t talk much, but he’s clearly happy you’ve accepted your role.");
	output("\n\nYou’re only too happy to have accepted it yourself, crying out like a whore on the end of his swelling prick. Feeling him fill your cunny is closer to a reward than anything else, and then on top of that he’s going to breed you? Now that’s a good time. He rides you, bucking and shoving himself into you until you can scarcely help but give a low, orgasmic scream of debased pleasure as his rough treatment becomes too much to resist.");
	
	pc.cuntChange(vIdx,enemy.cockVolume(0));

	if(!pc.isTaur()) output("\n\nYour hips almost give out as you shudder, flex and tighten around the milodan’s cock, your [pc.feet] instinctively rising off the ground to press him into you from behind");
	else output("\n\nYou shake, flex and tighten around the milodan’s cock as he fucks you through your orgasm, your back half shuddering involuntarily");
	output(". So enthralled are you by the feeling of your own orgasm, you hardly notice that he’s on the verge of his until you feel his knot.");

	output("\n\nAnd <i>what</i> a knot it is. Gasping, you feel your pussy walls stretch to accommodate his thickening base, struggling to accept him. The muscled man grunts once, pulling your [pc.ass] into his hips until, accompanied by your scream of half-anguish half-bliss, he shoves his knot fully into your cunt. With the tip of his cock pressed right up against your cervix, warm seed begins to ");
	if(pc.isPregnant(vIdx)) output("fill your passage, the gigantic knot preventing any cum from escaping");
	else output("jet into your womb, eventually overflowing back into your passage, his gigantic knot preventing any cum from escaping");
	output(".");

	output("\n\n");
	if(!pc.isTaur()) output("In the throes of your sympathetic orgasm, you feel him press down on your lower back. Unable to muster any kind of reaction beyond a breathy moan, you’re pushed to the ground with ease. He spreads his legs on either side of you and lies atop you, keeping you pinned and warm underneath him with his knot all the way in your pussy");
	else output("In the throes of your sympathetic orgasm, you feel him stretch out and put his hands on your back, then he shuffles around to get his legs on either side of you. He’s practically hugging your tauric backside, warming up your hindquarters");
	output(". You half-lid your eyes in contentment as the heat diffuses through you; you didn’t think it was possible to be so comfortably warm out here, but he’s heating up both your insides and outside.");

	output("\n\nA few minutes of feeling his jizz spurt into you in ropes passes by quickly, and soon enough you feel his knot begin to deflate. You’re forced to admit you’re almost disappointed, but as you go to rise you notice the milodan hasn’t loosened his grip on you at all. Pulling his knot free, your pussy finally lets go of the loads it was holding, running down your legs and onto the ground. You’re granted a few moments of reprieve before you gasp in shock, feeling his dick rub along your still-sensitive pussy.");
	output("\n\nHe’s still raging hard, a fact he’s only too eager to demonstrate when he thrusts right back into your gaped-wide hole. Slamming his hips against your rump, your voice comes out in sharp little cries of bliss. He begins to work himself back up to the same intensity you were just subjected to, and you begin to realize you’re going to be under him for quite some time...");

	output("\n\n....");

	if (milodanBadEndHandler()) return;

	processTime(250+rand(100));
	for(var x:int = 0; x < 15; x++)
	{
		pc.orgasm();
		pc.loadInCunt(enemy,vIdx);
	}
	output("\n\n");
	CombatManager.genericLoss();
}

//[Wrestle]
public function cockwrassleTheMilodanMale():void
{
	clearOutput();
	showMilodanMale(true);
	author("Wsan");
	var win:Boolean = (pc.physique()/2 + rand(20) + 1 >= enemy.physique()/2 + 10);
	if(win && !pc.isTaur()) 
	{
		output("On his outward stroke, you pull yourself forward and flip over, kneeing the surprised milodan in the snout. He recoils momentarily, blinking and raising a hand to his face as you take the initiative and push him onto his back. In a flash, you’re the one on top and sliding down his cock with a self-satisfied grin.");
		output("\n\n<i>“Oooh, yes,”</i> you groan, lewdly wriggling your hips on his crotch. <i>“That’s more like it.”</i>");
		output("\n\nThe milodan recovers quickly enough and struggles to reclaim his position atop you, but having expected it, you have no problem holding him down. You also suspect that perhaps he’s not trying as hard as he could be; if his grunts are any indication, he’s enjoying this every bit as much as you are. On a downstroke that hilts him inside you with a satisfying wet slap, you notice the base of his cock beginning to swell outwards.");
		pc.buttChange(enemy.cockVolume(0));
		output("\n\n<i>“Oh, is kitty gonna knot me?”</i> you moan, running a hand through the scruffy fur on his face. <i>“You gonna tie up your bitch and breed [pc.himHer]? Make me all yours?”</i>");
		output("\n\nLeaning in close, you breathe hotly in his ear. <i>“Do it, you fucking pansy.”</i>");
		output("\n\nWhether or not he fully understands, you get exactly the reaction you were looking for. He surges up from beneath you, his muscles bulging as he wrests your giggling form back into submission, holding your hands together above your head. You moan in exquisite delight as he pumps you urgently, his knot stretching your ass every time it slips back out. There’s a desperation in his thrusting now, as if you’ve spurred him to try and reclaim his honor by fucking you into complete submission.");
		output("\n\nReveling in the rough treatment, you pant and groan as you begin to crest towards a powerful orgasm. You can feel your stomach tying itself in knots, your legs shaking perceptibly as you open your mouth and insensate, whorish moans slip right out of it. You buck under him, feeling his knot bulge and press against your prostate. He holds you down as you thrust your hips into him, gyrating and gasping open-mouthed while you ride his cock.");
		output("\n\nHe roughly pulls you off the ground and into his lap with a loud grunt, thrusting upwards as you feel the first jets of seed begin to paint your insides. Panting, he buries himself as far into your asshole as he can get. You can feel the tip of his cock pulsing in your depths, warm jizz beginning to fill you up like a good little cumdump.");
		output("\n\nCavorting in his lap, you ride him through his orgasm until the final few spurts of spunk spray into your ring and you collapse, panting with your arms thrown around each other. A few seconds passes before you feel him shift under you, and you moan slightly as you feel him beginning to pull out. A river of spunk drips from your gaping asshole, but only for a few seconds. He surprises you by thrusting right back in, your back arching accompanied by a surprised gasp of pleasure.");
		output("\n\n<i>“I knew a guy like you had to have more in you,”</i> you growl affectionately, rubbing the side of your face against his. <i>“Show me what you’re good for?”</i>");
		output("\n\nHe’s more than happy to oblige you, spinning you around in his lap and looping his arms under your armpits to restrain you. You can scarcely do anything but gasp and cry out in his grip as he pumps you from below, thrusting his still-inflated knot in and out of your ass. You orgasm in record time, your shaking and flexing kept in check by his iron grip. You’re certain now; he was sandbagging in your earlier fight. There’s no possibility you can do anything to resist right now, and the thought of fighting back is so far from your mind you don’t even care.");
		output("\n\nThe next few hours pass by in a blur, switching to positions that only a male of his build could support. He fucks you full of spunk over and over, at one point bouncing you on his hips while standing, the next moment lying under you with his legs holding yours apart and arms wrapped around yours to keep you immobile. He demonstrates a martial mastery of your own body, bringing you to restrained orgasms again and again.");
		
		if (milodanBadEndHandler()) return;
	}
	else if(!pc.isTaur())
	{
		output("You struggle to rise to your feet, scrabbling for grip on the ice. Sensing your insubordination, the milodan sinks his hands into your [pc.skinFurScales] and begins pounding your stretched-out asshole with reckless abandon. On your feet and panting, you elbow him in the ribs and shake in a desperate attempt to dislodge the barbarian from your hindquarters, but he manages to hang on and hold you steady. Only after a brief struggle do you notice you’ve started thrusting your ass backwards into him, crying out like a whore every time he fills your fuckhole. Realizing you’ve been well and truly defeated, you dejectedly sink back to your knees.");
		pc.buttChange(enemy.cockVolume(0));
		output("\n\nThe milodan only gets rougher from there, seemingly punishing you for daring to try and disrupt the natural order: the winner does the fucking, the loser takes it like a bitch. You give him an embarrassed squeal when he spanks your [pc.butt], leaving it smarting. You’d hang your head in shame if he wasn’t thrusting so violently, jerking your body about ");
		if(pc.biggestTitSize() >= 1) output("and setting your [pc.breasts] jiggling against your chest");
		else output("and making it impossible to concentrate");
		output(".");
		output("\n\nEvery time he pounds your slickening passage you can feel the base of his cock begin to swell just enough to be noticeable, forcing your ring apart and spreading you wide for him. With each dominant push it grows just that little bit more, and soon enough your lusty moans give way to exhalations through gritted teeth and groans of exertion. It feels like his knot is hollowing you out, the milodan refusing to let it rest anywhere outside of your ass and only giving you scant seconds to get used to its inflated bulk before he pulls it out and rams it back in.");
		output("\n\nDespite his treatment of you, or perhaps <i>because</i> of it, you find yourself rapidly cresting towards a powerful orgasm, your stomach tying itself in knots as you grunt. As frustrating as it is to cum under his ministrations, you can’t deny their effectiveness. When it’s finally all just too much to take, you lift your head to cry out to the heavens and cum explosively, your cock spraying the ground as your insides tighten around his rod. He doesn’t let up at all, mercilessly fucking your writhing form through your orgasm.");
		output("\n\nWhen he grunts and you begin to feel the warmth of his seed jetting inside you, you actually feel a surge of gratefulness that he’s finally going to stop toying with you. You’d much rather be his subservient cumdump than try to fuck his knotted cock again - your legs are so shaky you doubt you’ll even be able to get up when he lets you go. Panting, he thrusts forward and buries himself as far into your hindquarters as he can get. You can feel jizz beginning to fill your anal passage, the gigantic knot preventing any cum from escaping.");
		output("\n\nA few minutes of feeling his jizz spurt into you in ropes passes by quickly, and soon enough you feel his knot begin to deflate. You’re forced to admit you’re almost disappointed, but as you go to rise you notice the milodan hasn’t loosened his grip on you at all. Pulling his knot free, your asshole finally lets go of the loads it was holding, running down your legs and onto the ground. You’re granted a few moments of reprieve before you gasp in shock, feeling his dick rub along your still-sensitive butt.");
		output("\n\nHe’s still raging hard, a fact he’s only too eager to demonstrate when he thrusts right back into your gaped-wide hole. Slamming his hips against your rump, your voice comes out in sharp little cries of bliss. He begins to work himself back up to the same intensity you were just subjected to, and you begin to realize you’re going to be under him for quite some time...");
		output("\n\n....");
		
		if (milodanBadEndHandler()) return;
	}
	else
	{
		output("You struggle to rise to your feet, your back legs scrabbling for grip on the ice. Sensing your insubordination, the milodan sinks his hands into your [pc.skinFurScales] and begins pounding your stretched-out asshole with reckless abandon. On your feet and panting, you shake and buck in a desperate attempt to dislodge the barbarian from your hindquarters, but he manages to hang on and hold you steady. Only after a brief struggle do you notice you’ve started thrusting your ass backwards into him, crying out like a whore every time he fills your fuckhole. Realizing you’ve been well and truly defeated, you dejectedly sink back to your knees.");
		pc.buttChange(enemy.cockVolume(0));
		output("\n\nThe milodan only gets rougher from there, seemingly punishing you for daring to try and disrupt the natural order: the winner does the fucking, the loser takes it like a bitch. You give him an embarrassed squeal when he spanks your [pc.butt], leaving it smarting. You’d hang your head in shame if he wasn’t thrusting so violently, jerking your body about ");
		if(pc.biggestTitSize() >= 1) output("and setting your [pc.breasts] jiggling against your chest");
		else output("and making it impossible to concentrate");
		output(".");
		output("\n\nEvery time he pounds your slickening passage you can feel the base of his cock begin to swell just enough to be noticeable, forcing your ring apart and spreading you wide for him. With each dominant push it grows just that little bit more, and soon enough your lusty moans give way to exhalations through gritted teeth and groans of exertion. It feels like his knot is hollowing you out, the milodan refusing to let it rest anywhere outside of your ass and only giving you scant seconds to get used to its inflated bulk before he pulls it out and rams it back in.");
		output("\n\nDespite his treatment of you, or perhaps <i>because</i> of it, you find yourself rapidly cresting towards a powerful orgasm, your stomach tying itself in knots as you grunt. As frustrating as it is to cum under his ministrations, you can’t deny their effectiveness. When it’s finally all just too much to take, you lift your head to cry out to the heavens and cum explosively, your cock spraying the ground as your insides tighten around his rod. He doesn’t let up at all, mercilessly fucking your writhing form through your orgasm.");
		output("\n\nWhen he grunts and you begin to feel the warmth of his seed jetting inside you, you actually feel a surge of gratefulness that he’s finally going to stop toying with you. You’d much rather be his subservient cumdump than try to fuck his knotted cock again - your legs are so shaky you doubt you’ll even be able to get up when he lets you go. Panting, he thrusts forward and buries himself as far into your hindquarters as he can get. You can feel jizz beginning to fill your anal passage, the gigantic knot preventing any cum from escaping.");
		output("\n\nA few minutes of feeling his jizz spurt into you in ropes passes by quickly, and soon enough you feel his knot begin to deflate. You’re forced to admit you’re almost disappointed, but as you go to rise you notice the milodan hasn’t loosened his grip on you at all. Pulling his knot free, your asshole finally lets go of the loads it was holding, running down your legs and onto the ground. You’re granted a few moments of reprieve before you gasp in shock, feeling his dick rub along your still-sensitive butt.");
		output("\n\nHe’s still raging hard, a fact he’s only too eager to demonstrate when he thrusts right back into your gaped-wide hole. Slamming his hips against your rump, your voice comes out in sharp little cries of bliss. He begins to work himself back up to the same intensity you were just subjected to, and you begin to realize you’re going to be under him for quite some time...");
		output("\n\n....");
		
		if (milodanBadEndHandler()) return;
	}
	processTime(250+rand(100));
	for(var x:int = 0; x < 15; x++)
	{
		pc.orgasm();
		pc.loadInAss(enemy);
	}
	output("\n\n");
	CombatManager.genericLoss();
}

//[Don’t]
public function dontWrestleTheMilodanBecauseHisCockIsBetterThanYours():void
{
	clearOutput();
	showMilodanMale(true);
	author("Wsan");
	output("<i>No</i>, you think dreamily, you’re perfectly content to just lie there and take it. He did beat you, after all, and now he’s claiming his prize. Seemingly sensing your utter submission, the milodan tightens his grip around your hips and begins slamming into your asshole over and over. Using his immense arm strength he pulls you down his cock by your hips, right to the base every time he thrusts. Before long, you’re unconsciously following along in his motions.");
	output("\n\n<i>“Good,”</i> he grunts in approval. He sure doesn’t talk much, but he’s clearly happy you’ve accepted your role.");
	output("\n\nYou’re only too happy to have accepted it yourself, crying out like a whore on the end of his swelling prick. Feeling him fill your ass is closer to a reward than anything else. He rides you, bucking and shoving himself into you until you can scarcely help but give a low, orgasmic scream of debased pleasure as his rough treatment becomes too much to resist.");
	pc.buttChange(enemy.cockVolume(0));
	if(!pc.isTaur()) output("\n\nYour hips almost give out as you shudder, flex and tighten around the milodan’s cock, your [pc.feet] instinctively rising off the ground to press him into you from behind");
	else output("\n\nYou shake, flex and tighten around the milodan’s cock as he fucks you through your orgasm, your back half shuddering involuntarily");
	output(". So enthralled are you by the feeling of your own orgasm, you hardly notice that he’s on the verge of his until you feel his knot.");

	output("\n\nAnd <i>what</i> a knot it is. Gasping, you feel your anal passage stretch to accommodate his thickening base, struggling to accept him. The muscled man grunts once, pulling your [pc.ass] into his hips until, accompanied by your scream of half-anguish half-bliss, he shoves his knot fully into your asshole. You can feel the tip of his cock pulsing again and again, filling you with warm jizz.");

	if(!pc.isTaur()) output("\n\nIn the throes of your sympathetic orgasm, you feel him press down on your lower back. Unable to muster any kind of reaction beyond a breathy moan, you’re pushed to the ground with ease. He spreads his legs on either side of you and lies atop you, keeping you pinned and warm underneath him with his knot all the way in your asshole");
	else output("\n\nIn the throes of your sympathetic orgasm, you feel him stretch out and put his hands on your back, then he shuffles around to get his legs on either side of you. He’s practically hugging your tauric backside, warming up your hindquarters");
	output(". You half-lid your eyes in contentment as the heat diffuses through you; you didn’t think it was possible to be so comfortably warm out here, but he’s heating up both your insides and outside.");

	output("\n\nA few minutes of feeling his jizz spurt into you in ropes passes by quickly, and soon enough you feel his knot begin to deflate. You’re forced to admit you’re almost disappointed, but as you go to rise you notice the milodan hasn’t loosened his grip on you at all. Pulling his knot free, your asshole finally lets go of the loads it was holding, running down your legs and onto the ground. You’re granted a few moments of reprieve before you gasp in shock, feeling his dick rub along your still-sensitive butt.");
	output("\n\nHe’s still raging hard, a fact he’s only too eager to demonstrate when he thrusts right back into your gaped-wide hole. Slamming his hips against your rump, your voice comes out in sharp little cries of bliss. He begins to work himself back up to the same intensity you were just subjected to, and you begin to realize you’re going to be under him for quite some time...");
	output("\n\n....");
	
	if (milodanBadEndHandler()) return;

	processTime(250+rand(100));
	for(var x:int = 0; x < 15; x++)
	{
		pc.orgasm();
		pc.loadInAss(enemy);
	}
	output("\n\n");
	CombatManager.genericLoss();
}

public function milodanPregnancyEnds():void
{
	clearOutput();
	author("Wsan");
	showBust("");
	showName("\nBIRTHING!");

	var se:StorageClass = pc.getStatusEffect("Milodan Pregnancy Ends");
	
	// Failsafe
	if(se == null)
	{
		output("ERROR: 'Milodan Pregnancy Ends' Status Effect does not exist.");
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	var numChildren:int = se.value1;
	var bRatingContrib:int = se.value2;
	var pregSlot:int = se.value3;
	var babym:Boolean = (se.value4 == 1 ? false : true);

	if(currentLocation != "SHIP INTERIOR") 
	{
		output("Oh, jeez! You can feel a stirring in your stomach; it feels like the kit");
		if(numChildren > 1) output("s");
		output(" want");
		if(numChildren == 1) output("s");
		output(" out. Time to get back to your ship!");
		output("\n\nYou stumble aboard your ship, shutting yourself in your room and lying down on a blanket.");
	}
	else
	{
		output("Oh, jeez! The kit");
		if(numChildren > 1) output("s");
		output(" want");
		if(numChildren == 1) output("s");
		output(" out, and ");
		if(numChildren == 1) output("it wants");
		else output("they want");
		output(" out <i>now</i>. You shut yourself in your room and lie down on a blanket.");
	}
	//Hour passes
	output("\n\nBy the time you’re finished, there’s ");
	if(numChildren == 1) output("a lone kit");
	else
	{
		output(num2Text(numChildren) + " healthy kits");
	}
	output(" on your blanket, waving ");
	if(numChildren == 1)
	{
		if( babym ) output("his");
		else output("her");
	}
	else output("their");
	output(" little arms and feet about. Oddly enough, none of them are crying. That Milodan toughness at work, you suspect. With a tired smile, you gently wash ");
	if(numChildren > 1) output("each one");
	else output( babym ? "him" : "her" );
	output(" off with some warm water and bundle your ");
	if(numChildren == 1) output("child");
	else output("children");
	output(" up in some comfortable sheets before calling for the nursery pods.");
	output("\n\nWatching the kit");
	if(numChildren > 1) output("s");
	output(" disappear makes you forlorn for a while, but you remind yourself that it’d be wildly irresponsible to take your kids along on your incredibly dangerous space journey. This is for the best, really. You can see them on Tavros any time you want to.");
	output("\n\nAs for you, you quickly wash yourself off in the shower and practically crawl into your bed looking and feeling like some kind of half-dead sea slug. Giving birth is tiring work, and it’s definitely time for a nap.");

	moveTo("SHIP INTERIOR");
	pc.removeStatusEffect("Milodan Pregnancy Ends");
	//14 hours pass

	processTime(14*60);
	clearMenu();
	addButton(0,"Next",milodanPreggoEpilogue);
}

public function milodanPreggoEpilogue():void
{
	clearOutput();
	showName("MORNING\nAFTER");
	output("You wake up with a slight headache and a dry mouth, both of which dissipate when you rouse yourself from your well-deserved slumber and wash yourself. Time to get back to adventuring!");
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function milodanBadEndHandler():Boolean
{
	if (flags["MILO_MALE_CON_LOSSES"] < 2)
	{
		output("\n\nBy the time he finally pulls out with a groan, you’ve been fucked senseless. Your eyes are half-rolled back in your head, your tongue lolls from your drooling mouth and your chest is heaving with effort. It’s only when the milodan gives you a sharp slap on the ass that you woozily rouse yourself to consciousness, your butt stinging. By the time you look around, he’s already gone and you’re starting to get a little chilly. Feeling slightly used as his spunk continues to roll down your thighs, you ");
		if(!pc.isAssExposed()) output("chuck your clothes on and ");
		output("get moving again.");
	}
	else if (flags["MILO_MALE_CON_LOSSES"] < 4)
	{
		output("\n\nBy the time he finally pulls out with a groan, you’ve been fucked senseless. Your eyes are half-rolled back in your head, your tongue lolls from your drooling mouth and your chest is heaving with effort. It’s only when the milodan gives you a sharp slap on the ass that you woozily rouse yourself to consciousness, your butt stinging. As you gather your belongings and prepare to leave, something stops you - the milodan male you were just in coitus with is still here for once. He’s watching you with interest, seeming to be considering something for a few long moments. Is he going to go for another round? Finally though, seeing you watching him, the milodan shakes his head, grunts and departs into the snow without a word. Feeling confused as his spunk continues to leak out of your body, you ");
		if(!pc.isAssExposed()) output("chuck your clothes on and ");
		output("get moving again.");
	}
	else if (flags["MILO_MALE_CON_LOSSES"] < 5)
	{
		output("\n\nThe milodan begins to pull out but stops halfway, humming low and deep from the back of his throat - almost a purr. Then his warm weight is settling back onto your back, pinning you under hundreds of pounds of fur-covered muscle and sinew. <i>“Like you,”</i> the beastman grunts, placing one hand on the back of your head and sniffing you, inhaling your scent deeply before exhaling, his hot breath washing over your neck and drawing a happy shiver from you. He’s just so <b>warm</b> and powerful... you feel like you belong here, under him.");
		output("\n\n<i>“Frail. Weak. Soft,”</i> he continues gruffly, his hand moving to grip your right shoulder possessively. <i>“Always lose to tribsemen. But keep coming for more. Maybe you want to stay with us.”</i>");
		output("\n\nHe lays on top of you for a few more minutes, idly groping and toying with your body, then finally pulls out and collects his loincloth, walking into the snow without a word as his seed leaks down your thighs. It might be dangerous to keep losing to him, assuming you value your freedom...");
	}
	else if (flags["MILO_MALE_CON_LOSSES"] < 6)
	{
		output("\n\nThe milodan pulls himself out of you with a grunt and collects his loincloth... then stands over you silently for a moment. Too dazed from the incredible pounding your [pc.ass] just took, you barely even notice - until he begins to speak.");
		output("\n\n<i>“You make good ");
		if (pc.hasVagina()) output("wife");
		else output("bed-warmer");
		output(". If you come back again... I make you mine before someone else does,”</i> he warns, voice gruff and deep. Then he’s trekking into the snows of Uveto, not looking back as he leaves your jizz-leaking form behind.");
		output("\n\nWell, that was a pretty damn strong hint. If you don’t want to give up your quest and become a milodan hunter’s bitch, you’d best train up, or consider rushing on another planet for a while.");
	}
	else
	{
		output("\n\nThe milodan pulls out of your abused form with a low growl, standing and collecting his loincloth as he has so many times before... right before collecting you, picking your cum-leaking body up with frightening ease, dressing you clumsily and slinging you over one bulging, furry shoulder with no sign of strain, resting his palm possessively on your [pc.ass]. Dimly understanding that you’re being taken as a slave by this primitive, you struggle and squirm, but it’s useless - weak and battered as you are, your weapons freezing in the snow where you were just claimed, you have no chance whatsoever of escaping his iron grasp. He ignores your squirming for the most part, though his hand does tighten on your rump, further quashing your chances of regaining freedom.");
		
		pc.removeAll();
		
		output("\n\nSome thirty minutes later, shivering and afraid, you find yourself passing a thick wall of ice as you enter a village, other milodan tribe members watching curiously as you’re carried into a large tent and laid on your belly on a pile of sheets, still struggling and protesting feebly. The milodan climbs in with you, his furry weight pinning you down as he slides his hardening cock into your jizz-leaking ");
		if (pc.hasVagina()) output("cunt");
		else output("[pc.asshole]");
		output(", picking up a rhythm alarmingly quickly, railing your helpless form pronebone. When he finally finishes with you hours later, the edge taken off his libido by his romp with you in the snow, you’re too tired, too well-fucked to do much of anything besides leak jizz and whimper, your entire body now agonizingly sore from being pounded so brutally and cumming so many times. When he pulls a thick pelt over the two of you and begins to snore you make no protest, though a small whimper escapes your [pc.lips] before you drift into sweet, dreamless sleep.");
		if (pc.hasVagina())
		{
			output("\n\nYou try to escape, of course - more than once. Each time, your new alpha finds you in the snow, drags you back to his tent and spanks you like a disobedient child until your [pc.ass] is glowing red, until you can’t sit without whimpering in discomfort. Eventually, you realize it’s hopeless; he knows the terrain around the village too well - your only hope is that someone will come rescue you. They don’t though, and at some point during your first pregnancy ");
			if (pc.fertility() == 0) output("after the fertility priestesses ‘cure’ you of your barren womb, ");
			output("you stop wishing they would. Becoming this milodan’s wife, bearing and rearing this magnificent barbarian’s kits is the best thing that could have happened to you, you realize now. What does the quest matter, really? You’re <b>happy.</b> Content. Fulfilled. Every time your new alpha takes you into his bed and leaves you a squirming, writhing puddle of bitchmeat you care less and less about Steele Tech, about recovering the pods or protecting your inheritance from your cousin. Let them have the stupid company. You’ve got everything you need growing in your swollen belly.");
			output("\n\nIt’s not an easy life, of course. Your alpha demands that you learn to cook the food he brings home, clean and dress wounds and a myriad of other chores that always need doing around the village, even while you’re waddling about heavy with his spawn. You’re constantly sore for the first month or so of your new life, a result of your alpha’s insane libido and the work you’re always doing. It’s where you belong though, you know that now. Why else would you have kept coming back to be bred in the snow, if you didn’t want to become his forever?");
			output("\n\nYou’ve forgotten all about your ‘quest’ by the time the milodan who took you for his own is putting his third litter of kits in your tummy. All you can think about is how <i>happy</i> and <i>proud</i> you are to bear another litter for your mate, how good and <i>right</i> it feels to be under him, hundreds of pounds of pure muscle pounding you senseless before his familiar knot begins to do its work, opening your [pc.cunt] up and planting more gorgeous, strong kits in your womb, his musky scent permeating your nostrils. When the first jet of seed sprays your cervix you squeal happily and wrap your arms and legs around your mate, fingers clutching up handfuls of warm fur as your body seizes up, knowing you’re going to be a mother to his kits again, the way you were always meant to be.");
			output("\n\nYou’re home, where you belong, birthing and raising the next generation of milodan.");
			output("\n\nThe only home you’ll ever need.");
		}
		else
		{
			output("\n\nYou try to escape, of course - more than once. Each time, your new alpha finds you in the snow, drags you back to his tent and spanks you like a disobedient child until your [pc.ass] is glowing red, until you can’t sit without whimpering in discomfort. Eventually, you realize it’s hopeless; he knows the terrain around the village too well - your only hope is that someone will come rescue you. They don’t though, and at some point during your first few months of captivity you stop wishing they would. It’s not a bad life, if a hard one; the first few months are the hardest, learning your <i>true</i> place in the galaxy as a milodan’s bitch. You’re sore day in and day out; when he’s not fucking your [pc.ass] until you can’t walk, the milodan has you doing various chores around the village, cooking, cleaning, repairing and building new tents and igloos.");
			output("\n\nThe highlight of your new life as a fuckhole is when your alpha eventually trusts you enough to take you hunting with him, both to help hunt and to serve as a bedwarmer on the go. Eventually you even stop being sore all the time, your body toughening from the combination of hard work and hard dicking. Eventually you’re able (and willing) to give almost as good as you get, in bed and on the hunt. You even have chances to escape as time goes on, but of course you don’t take them. Why would you? You belong here now, and you’re okay - no, more than okay with that. What does the company, what does your inheritance matter anyway? Let [rival.name] have it if they want it that badly. You’ve got something better, you muse as your alpha pushes you down onto his makeshift bed of furs, his musky scent overwhelming you as he pushes into your bowels - it’s not as luxurious as the bed you had back home, so long ago, or even the bed you had on your ship, but as your alpha, your magnificent milodan master rails your brains out on top of it, your mouth opening to bite down on one of the fur blankets as he knots you and pumps your intestines full of cum... you come to a realization.");
			output("\n\nIt’s home. Your home.");
			output("\n\nThe only one you’ll ever need.");
		}
		
		pc.createStatusEffect("Milk Paused");
		pc.createStatusEffect("Cum Paused");
		processTime((360 * 24 * 60) + rand(1440));
		pc.removeStatusEffect("Milk Paused");
		pc.removeStatusEffect("Cum Paused");
		
		badEnd();
		return true;
	}
	return false;
}

//[UN.IMPL'd/AUGUST] Male Milodan Crotch Worship
// Patreon vote. Male Milodans will have a win scene added to their events where the PC performs crotch worship. After doing it enough times, the hulking catdog will dom the PC properly, more facefucking and less input from the PC. But with no downsides, it's just for subby players >.>

//[C. Worship]
// Tooltip: You won the fight... that means you get to do what you want. That includes giving this studly catman some crotch worship. {silly: No kink shaming here.}
// No restrictions. It's me, William, writing PC performing oral. You know what you're getting >:)

public function milodanCockWorship():void
{
	clearOutput();
	showMilodanMale(true);
	author("William");
	if(!inCombat()) setEnemy(new MilodanMale());
	// HP Victory
	if(enemy.HP() <= 1)
	{
		output("The heat of battle, you find, is quickly replaced by the heat of desire. Your eyes roll down the furry brute’s broad features, lingering on flexing muscles beneath black-dappled argent camouflage. This winter warrior is a beastly sight even in defeat. His determination continues to flicker behind his quietly defiant eyes. He lost the fight - he knows his place. Yet when your gaze settles on his crotch, your heart skips a beat. You slide the loincloth away, revealing an onyx chub, thick as a fist, resting atop a large pair of densely-furred balls.");
		//bimboOrCumAddict:
		if(pc.isBimbo() || pc.isDependant(Creature.DEPENDANT_CUM)) 
		{
			output("\n\nEverything becomes so very clear - you don’t just <b>want</b> this milodan’s dick, you <b>need</b> it. You’re completely fixated on his sexy, nubby prong, even as a stream of hot slaver flows off your slackened tongue. Just thinking about servicing it into a real expression of masculinity gives you a pleasant shudder - it’s what sluts do best, after all. And those balls look nice and full, ripe proof of his prowess as a breeder. There’s gotta be enough nut in there for plenty of women, and it’s all yours! Delirious whimpers build in the back of your throat when you think about getting a large, round belly stuffed with hot and creamy reward - oh yes!");
		}
		else if(pc.libido() < 33)
		{
			output("\n\nYou bite your lower lip, the erotic thought of having this burly male to yourself flashing in your throbbing mind. At first you feel a little uneasy, but you can’t look away from it. His manhood inspires admiration. Admitting that is embarrassing, but not shameful. That cock is there to be stroked into leonine tumescence, to be serviced. Maybe you got off on the wrong foot? With a face red enough to combat Uveto’s cold, you know what you must do.");
		}
		else if(pc.libido() < 66)
		{
			output("\n\nAlready your tongue is submerged in saliva. In fact, you’re drooling. Milodan men are mountains of sculpted masculinity, alphas, one and all. He’s not aroused, but you can smell him. His cock is so hypnotic that the real shame would be not touching it. Swallowing the lump in your throat (to make room for that, of course), you set about getting your ‘victory’ prize.");
		}
		else output("\n\nIt doesn’t take long for your animalistic urges to surface the way you’re fixated on his dick. It’s like one plus one - big, virile mate, and you, young, " + (pc.fertility() > 0 ? "fertile":"needy") + " [pc.raceShort]-[pc.boyGirl]. You’re drooling all over his powerfully-muscled thigh, thinking over all the reasons why you need this leopard-man’s cock. It gets you hot enough to ignore Uveto’s arctic winds.");
		
		if(pc.isBimbo()) output("\n\nSuddenly you feel terrible for hurting him. What will his tribe think if anyone finds out he lost to you? Fluttering your eyelashes, stroking his belly, you purr, <i>“Why don’t you stand up? I’ll make it up to you, big boy! I promise!”</i>");
		else if(pc.isBro()) output("\n\n<i>“Hrrm,”</i> you groan, smiling at him. <i>“Stand up.”</i>");
		else if(pc.isNice()) output("\n\n<i>“Now, do me a favor,”</i> you smile, running a [pc.hand] up his thigh. <i>“Stand up, please.”</i>");
		else if(pc.isMischievous()) output("\n\n<i>“Why don’t you go ahead and get up for me?”</i> you smirk, patting his stomach. <i>“You’ll see why.”</i>");
		else output("\n\n<i>“Stand up,”</i> you grunt, nostrils flaring. <i>“Don’t ask any questions.”</i>");
		output("\n\nSans protest, your would-be conqueror moves up, shifting the air around him with mountainous presence. Before you blink, he’s looming over you, staring down from his dominant elevation. He must like what he sees, because his smooth, feline dickskin is hardening, stretching out. The throbbing, thickening prong rapidly engorges with blood, swelling into a [pc.raceShort] tamer nearly a foot thick.");
		output("\n\nA crystal droplet of precum forms at the tip, and you unconsciously lick your lips.");
	}
	// Lust Victory
	else
	{
		output("It hits you right away. Snow and ice don’t smell, making the presence of a virile male’s pheromones all the more prevalent. Tendrils of sexual musk tickle your nose-hairs on their way to your brain. Even in a semi-erect state, the milodan before you, clutching his loins again, is a primal beast, an alpha in his own right. He lost the fight and he certainly knows his place... but when he shifts just a little, when you catch sight of the ebony-black pillar that is his distending phallus, you gulp. Just underneath it, below thick, boner-tending fingers, are his ripe, furred balls, weighed down by enough sperm to breed an entire village of women.");
		//bimboOrCumAddict:
		if(pc.isBimbo() || pc.isDependant(Creature.DEPENDANT_CUM)) output("\n\nFinally! With the fight out of the way and with a big, studly cat-man ready to fuck, you can get down " + (pc.hasKnees() ? "on your knees ":"") + "and <i>suck that yummy cock!</i> The speed at which you do so alarms him, though all he sees when he clears his eyes is a slutty [pc.raceShort] crouched at his groin, looking up past the trunk-thick chub of his barbed phallus, licking [pc.hisHer] lips like a trained and self-secure whore.");
		else if(pc.libido() < 33)
		{
			output("\n\nYou realize he’s that way because of you. You’ve aroused him so painfully that his blood surges with a frenzied heat akin to that of rut. That his girth is hardening before your eyes brings a twinge of erotic satisfaction. Your heart flutters, and you find yourself persuaded by his aroma of need. You shuffle a little closer, realizing that you need to make that cock cum. You can’t look away from it as you sink below it, supplicate to it.");
		}
		else if(pc.libido() < 66) output("\n\nYou got him hard for just this reason - you want that dick. As you lick your lips, sensitive and glossed with spit, you find yourself eager to wrap them around it. That sexy beast needs an outlet for all his frustrations. Good thing he has one slinking below him, opening [pc.hisHer] mouth in livid desire.");
		else output("\n\nRaw, animalistic urge strikes you - the milodan growing hard and firm in front of you, <i>because of you,</i> is a fine example of his species. A large, powerful male, heavy with breeding urge that he, incidentally, needs to fuck someone full of. Of course it’s going to be you. There’s no shame in admitting that you’re salivating for his cock, there’s no humiliation in sinking down below him, desperately wanting to suck it. All you have to do is open wide and let him know.");
		output("\n\nStanding upright, the milodan looks down at you past the bare, hot shaft of his black penis. Smooth, rippling dickskin hardens to near-fullness right before your eyes, beading the first pearl of precum at its tip. The barbs around the crown and the base bristle in the wind, and even the knot pulses warmly at the fluffy base of his wide crotch. Blood-pumping veins lace his musky girth, working to complete its transformation into a nearly foot-thick [pc.raceShort]-tamer.");
	}
	// merge
	output("\n\nThe fattest dick on Uveto throbs right in front of your [pc.face], dressing itself in a warm coat of pre. A visible cloud of rich musk lingers around the bobbing pillar, faint notes of sweetness present among an intensely masculine signature. The glans is slightly tapered, distinctly cat-like with interlocking layers of feline spines curling out from its most sensitive places. A radius of bulbous flesh girds the root of the all-important phallus: his knot, completing the image of a creature designed to succeed at fertilization with whatever mate he claims... or claims him.");
	output("\n\n<i>“No delaying,”</i> he growls, taking a step forward, jolting you out of your visual adoration by laying his steep, moist bulk against your forehead. You can feel his heartbeat all the way through the urethra, enlarging the globules of earthen precum " + (pc.hasHair() ? "lathering in your [pc.hairColor] hair":"glazing your scalp") + ". It actually warms you up more than being in his commanding presence, wearing his testosterone like a " + pc.mf("wedding","bride’s") + " veil. You won... but here you are, ");
	if(pc.libido() < 33) output("nuzzling his scented length, glad to feel protected");
	else if(pc.libido() < 66) output("rubbing yourself into his bulging mass, overjoyed at how hard he is, how good he smells");
	else output("tasting the wetness of his pre-soaked rod, kissing his cum-vein, drinking in his scent");
	output(". You have no doubt in your mind that this milodan is <i>your alpha.</i>");

	output("\n\nWhen you glance down, you’re made aware of the huge, silver gems dangling between his legs, swathed in a damp, soupy haze. The fuzzy testicles are so full that they sag and wobble, creating a seething space of sloped ballsflesh between scrotum and cock that you comfortingly lean into, enfolding your nose in his nutfuzz" + (pc.tailCount > 0 ? ", wagging your [pc.tails]":"") + ", and giving up on cognition. Smothered in fragrant fluffiness, you inhale, grip to his thighs, then huff again, heart racing and body quivering to the overwhelming musk of a born hunter. Supremacy is recognized between flashes of intense dopamine bursts and released neurotransmitters.");
	output("\n\nThe sound of the wind dies down, replaced with the content, rumbly purr of a pleased milodan that burns away the concept of <i>“negative temperature.”</i> You relax into the intimacy of this perverse embrace, softly licking one orb, sliding your [pc.tongue] from one end to the other, collecting a spicy blend of sweat, pre, and some long-stewed odor to plaster your palate with.");
	output("\n\nYou lick again, attempting to lift the milodan’s hefty encumbrance. They’re larger than the average apple, and much, <b>much</b> heavier. " + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? "Even with a tongue that can curl around the whole sack, you lack the strength to raise even one. They’re as defiant as the creature they’re attached to.":"You don’t get very far. Not only does your tongue lack in strength, it can’t even get a quarter of the way around a single testicle before it slides off, swinging with tremulous inertia.") + " His tremendous ‘nads jostle back and forth with aggressive aftershocks, densely taut with billions, maybe trillions of swimmers" + (pc.hasVagina() ? " ready to make a broodmother out of you":" ready to make the jump to your belly") + ". The taste is amazing, but the <i>feel</i> is out of this world.");
	output("\n\nNestled in this lewd sauna, you possessively grasp his virile jewels, fingers sinking into pheromone-drenched flesh. Roiling fluids audibly slosh inside, threatening to drown any who come closer. The lewd designs your squishing tongue draws into his pelt churn the waves of his swirling ocean. You purse your [pc.lips] into a slurping O-shape, kissing then sucking on the surfaces of his ecstatically contracting nuts. They gurgle unstably, squeezing tight to his crotch, forcing out the first rope of sperm in a premature ejaculation.");
	output("\n\nA clawed hand urgently pulls your head from the passionate darkness, firming it against his monolithic member. He meets you with an impatient expression that is understood without language. <i>“Start.”</i> The grip eases when you press your taste buds to the crest of his totem and glide down, coming back up on the broadside, going down on the other, then using a hand to smear as much of your slobber across his sizzling shaft. It shines like a rod of pure, polished latex, practically reflecting your obedient image.");
	output("\n\nHis cock has a woodsy taste on top of a saltiness that speaks to a thankless lifetime of labor. It’s a feral and bestial relish that flips switches in the primitive corner of your modern mind - it crashes your brain, like it can’t understand the contextual conflict of information it’s reading. Not having to think means you can focus more on enjoying that head-spinning flavor, savor it with sibilant hums of gourmet indulgence. What makes it special, however, is how the lingering aftertaste of his balls mixes with these many qualities to create an epicurean delight that’s too divine to be believed. No cocksucker could resist this perfect dick.");
	output("\n\nHe places that huge, savage paw on your cheek in a reassuring gesture, softly stroking his nails into your [pc.skinFurScales] as you joyfully service his dick with hand, mouth, and tongue. His short tail is wagging behind him, throwing falling snow in mostly-hidden happiness. You’re staring back, watching his furrowed eyes for any and all signs of pleasure, delighting in the slight wince and pupil dilation when you pepper drooly kisses upon the full scope of his tool with a machine gun’s rapidity.");
	output("\n\nThe back of his hand wipes over your brow when the climate threatens to cover it up. You have an idea why: he wants to see your [pc.eyes] the whole time. You’re submitting to him, the loser, making this all about him. He’s taking to it very well, maybe even a little inquisitively. After swallowing another load of pre, you see him smile. It’s a surprisingly fond and appreciative look for him, one that ignites the burning neediness in your belly.");
	// pc Aphrodisiac Spit / Myr Venom
	if (pc.hasPerk("Myr Venom") || pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED))
	{
		output("\n\nIt was a foregone conclusion that your venomous saliva would seep into his shaft, work its blissful magic on his girth. Strong muscles tense around you again, and out spools another white rope of spooge that melts away the ice around your [pc.footOrFeet]. Behind bared fangs a vicious growl sets his wickedly curled lips to rippling. All his pores split open like volcanic fissures, expelling sheer, raw heat in the wake of your injection of ecstasy. It seems he’s showing all the respect he can to the ‘victor’, but if you do what you just did again...");
	}
	// pc Long Tongue
	else if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("\n\nWielding the full length of your modified tongue, you see to it that the milodan gets a full wash. You wrap the organ around his base, stroking in proximity to his knot, and use the tip to knead his sack. He grunts and groans, so obviously pleased to have someone of your talents worshiping him. Your alpha encourages you to work a little faster and a little rougher, shifting his hips ever so slightly, beginning to please himself with deference to his subby conqueror.");
	// merge
	output("\n\nUnable to hold himself back, the leopard-man’s hips start humping your face, making you realize just how much strength and force is backing that glistening tower. Brutal balls slam into your chin and cheeks, flinging beads of their smutty lacquer into your orifices. Penile barbs curl against your [pc.skinFurScales] and then your ears. The milodan finally halts himself only after eclipsing you in his clenching ballsack, pulling back to present you with the tip of a hard, juicy cock that <b>needs your mouth.</b>");
	processTime(20);
	pc.changeLust(15);
	clearMenu();
	addButton(0,"Next",worshipMilodanPolePartDeus);
}

public function worshipMilodanPolePartDeus():void
{
	clearOutput();
	showMilodanMale(true);
	author("William");
	// There are two separate scenes here, randomly performed after the first time.
	// rand 1 (PC Performs Fellatio)
	if(flags["MILO_C_WORSHIPS"] == undefined || (flags["MILO_C_WORSHIPS"] > 1 && rand(2) == 0))
	{
		output("Not wanting to keep your alpha waiting any longer, you pucker your [pc.lips] into an ‘O’-shape and lean closer to the muscled milodan’s jutting girth, eyes up. You press his tip to the center of your oral gap and move forward, acutely delighted by this privilege and all the excitement it brings. Squeezes of varying force to your head follow your fluttering motion. Your [pc.lipsChaste] spread around his thick, imposing girth, strings of slaver leaking from your cock-stuffed maw. It plunges through the narrowness of your sucking cheeks and comes to rest at the entrance of your throat, where the steady deposit of almost boiling milo-pre is strongly felt. The raw flavor of a male combined with the inexorable trickle of lubricant spurs your eyes to water with joy.");
		output("\n\nAnother smile, this time wider than the last. He rubs your cheek, breathing heavier, also squirming. You slide back so that he has the pleasure of knowing what your [pc.lipColor] fuck-pillows can do. ");
		if(pc.lipRating() < 3) output("They’re thin and unsuited for the task of pleasing so large a dick, but although your master’s cock may be stretching them into a colorless band, he approves. There’s benefits to either end of the spectrum, like seeing you wholly debased.");
		else if(pc.lipRating() < 6) output("Your master immediately takes a liking to them, purring at the caress of your succulently plush cock-ring. It retains its color, glossing his most sensitive places under sensually sweeping smoothness.");
		else output("Your master purrs so vigorously that it can be felt through his cock. Your beautifully plump and lustrous DSLs soothe him in their sensual, shaft-encompassing sweep. Sparkling saliva clings to them, making him all the happier that he has a tailor-made pole-polisher at his beck.");
		output(" Pressing forward again, you wiggle your tongue under his turgid boner, ready to take him further, deviating from your task only to ensure that the texture of his erection will have a place in all your future dreams.");

		// pc Can’t Deepthroat
		if(!pc.canDeepthroat())
		{
			output("\n\nNo matter how dedicated you are to this brawny barbarian’s pleasure, your brain expresses its disdain at having to accommodate for immense insertions. You cough and hack, sputtering spit and pregasm, doing your best to bring him down your throat. The barbs on that lubricious stud-cock don’t make it any easier, stimulating you into more spasms of agonized ecstasy even as the tip firmly lodges itself over your quavering voice-box. You pull back, take a breath, swallow, and refresh, closing your eyes and sliding forward before your gag reflex can restart: it snaps like a twig. A fervid shudder explodes inside when you feel his knot bump your [pc.face] and his heavy balls pulsing warmly on your jaw.");
		}
		// pc Can Deepthroat
		else 
		{
			output("\n\nIt’s at once orgasmic and soulfully fulfilling when the milodan’s slimy cock-head effortlessly glides through the entrance of your throat, thrusting towards your belly without any resistance. You sense no small amount of surprise from the patient cat-man while your oral flume clamps down on him like any vagina would. His biology rewards your esophagus with warming splatters of feline precum, making the " + (silly ? "UwU-vula":"uvula") + "-smushing withdrawal and re-entry even easier. The brush of his barbs to your inner muscles is heavenly, and the sight of his many inches vanishing into your body is eye-crossingly arousing, and that’s before you strain yourself at his knot. Of course you take him to the hilt, happily pressing your jaw into the warm, loving embrace of his bouncing balls.");
			// pc Bimbo (Add-on to Can Deepthroat)
			if(pc.isBimbo())
			{
				output("\n\nYou could never hope to describe (at least succinctly) just how wonderful it feels to be speared on dick. When you’re not experiencing this unique and unmitigable sensation, you’re always looking forward to the next time! You can only imagine what’s going on behind your cat-master’s eyes as you gleefully nurse his veiny cock, siphoning the liquid burden from his nuts in absent-minded suckles. You’re doing your absolute best to memorize his flavor, hoping that you’ll still taste him when you lick your lips later. Maybe you’ll even be able to find this one milodan by his potent dickscent, train your nose to seek him out among the cold wastes just to attach yourself to his fuck-rod and be served up a bitch’s hot, wonderful reward - You cum. Thinking about it so hard has done it, it’s made you " + (!pc.hasVagina() ? "orgasm from top and bottom":"wriggle too hard into your [pc.clits]; you fill the air with the scent of a satisfied whore") + "!");
			}
			// pc SnakeByte (Add-on to Can Deepthroat)
			else if(flags["USED_SNAKEBYTE"] != undefined) output("\n\nRings of jizz-milking muscle seemingly alarm the brutish tribal. His attempts to pull away are futile and extra arousing. The clash of neck-massaging nubs with your ribbed, cock-clutching interior whites out your world in the exotic aftereffects of a single solitary second in oral paradise. <i>“Strange...”</i> he grunts, thrusting forward on his own, eager to understand just what’s going on in there. Of course he’ll never know of the grand science that’s gifted you these luxurious traits, but he doesn’t need to. He merely needs to enjoy them, like any other who may have such needs.");
		}
		// merge
		output("\n\nFitting a [pc.hand] around his balls, you squeeze his smooth kegs while your throat squeezes his prick. Bobbing up and down with a hand on your head, lewd shlucks and slurps echoing through the frozen terrain; he begins to buck under your expertly planned assault. His cock-head replaces your adams’ apple over a series of frictious lunges that nearly drive you to orgasm. The milodan, immersed in you, is struggling to hold himself together. The meaty paw that’s been on your head the whole time ramps up in response, pressuring you to take more and more and give up less and less." + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? " You make sure to keep your flexible tongue working, using it like a tendril of prick-pumping material to create a double-layered blowjob that no one else on this planet could emulate.":""));
		output("\n\nMaintaining eye contact is a little harder like this. He’s chewing his lips; occasionally, his mouth parts, and his tongue falls out. Steam billows from his flaring nostrils. His throat compresses for another growly swallow while yours cinches down on a pillar of bestial rigor. You start to see his reasoning for keeping you impaled: when your throat realizes there’s no hard, rigid dick to clamp down on, you feel startlingly empty. Your very existence is called into question by the lack of a bulge forming you around itself. It’s a worrying thought, but one easily dispelled by devotion");
		if(pc.tailCount > 0) output(" and " + (pc.tailCount == 1 ? "a ":"") + "wagging tail" + (pc.tailCount > 1 ? "s":""));
		output(".");
		output("\n\n<i>“Good,”</i> he puffs. That deep, oboe-like word rocks your world.");
		output("\n\nShifting upwards, your motions become fiercer, making every invasive drive of the native’s breed-stick rougher. The veins on his girth depress your [pc.lipsChaste] while you turn your mind and body to the task of total fellatio. Releasing his balls and gripping to his thighs, you curl forwards like an adrenaline-fueled piston. Enmeshed in the moistness of your thirsty throat, the milodan’s throbbing firmness snugly packs itself into the narrow band, raking surfaces of indulgent nerves with the agilely flexing touch of feline pleasure-nubs.");
		output("\n\nNo longer able to hold his thighs, dutifully blowing him in dangerous proximity of taking his knot, your fingers end up squeezing the firm, muscle-stacked ass cheeks behind him. They clench with every thrust of fur-coated hip, demonstrating that every tendon in his body is concentrated on the relief found by using you. " + (flags["USED_SNAKEBYTE"] == undefined ? "Some of your lingering anxiety is quelled when you notice he’s not worried about knotting you. You simply won’t be able to fit it without some serious changes. On the other hand, that is rather disheartening, seeing it swell like that, unable to plug a hole...":"You’ve undergone some serious mod-work for a reason, now it’s time to see if it can handle this situation. Spoiler: it does, because science is fucking awesome: thanks to your jaw’s ability to stretch even further as a result of Snakebyte, the swollen knot before your eyes is easily gobbled up into your serpentine maw, where it’s lavished like a spunk-factory. Whatever’s going on in your alpha’s head, you can’t wait to see how he reacts to being able to knot your amazing mouth."));
		output("\n\nA distinct whimper alerts you to the milodan’s approaching orgasm. Frothing spittle follows you into the plunge: you rise all the way to the lip, swirl your [pc.tongue] around the peak, and then slide back down to the base. Your sucking wetness overwhelms his willpower to the point that he grabs onto your head and lances you on his pulsating organ. You defy his grip and rear back, unsheathing him from your mouth entirely, letting it hang in the air, and just before the first surge of ardor erupts, you inhale, and slam your head into his crotch in a full, gurgling stroke" + (flags["USED_SNAKEBYTE"] != undefined ? ", fitting his bitch-making knot nicely in your tenderised maw":"") + ".");
		output("\n\nThe milodan’s inner flame conflagrates; burningly-white sperm surges through his phallus in vein-fattening volumes. The stretch gapes your girth-ringing lips wider, and the fullness you immediately feel in your throat becomes an intoxicating, feverish delight. Sperm-packed spooge floods your belly, splashing up through the entrance of your cum-gutter, coating all glowing membranes in the cat’s cream. Your voracious depths milk the buried barbarian of hot seed, the slow massage of passionately churning balls telling your mind that it’s done its job. You roll your face and neck, making sure to prolong his quiet, rumbling joy while your stomach expands into a pudgy shelter.");
		// pc Cums (Bimbo or SnakeByte Only)
		if(pc.isBimbo() || flags["USED_SNAKEBYTE"] != undefined)
		{
			output("\n\nYou can’t hold back any longer - the trembling, tender sensations of having your arousable throat screwed and spunked feed directly into your crotch. ");
			if(pc.isHerm()) output("Your [pc.cocks] bust, launching [pc.cum] into " + (!pc.isCrotchExposed() ? "your clothes":"the snow under his legs") + " next to your [pc.pussiesLight], expelling the victorious hermaphroditic discharge in light of services rendered.");
			else if(pc.hasVagina()) output("Your [pc.pussiesIsAre] lighting up, going hollow, until the moment of [pc.girlCumVisc] emission. Yes, " + (!pc.isSquirter() ? "you’re squirting":"you’re cumming") + ", all because you get exceptionally horny from the act of sucking cock... and you fucking love it.");
			else if(pc.hasCock()) output("Bloating, your [pc.cocks] detonate" + (!pc.hasCocks() ? "s":"") + ", busting your [pc.cumVisc] nut into " + (!pc.isCrotchExposed() ? "your clothes":"the snow underneath him") + ", ejaculatory expulsions timed with his own. Oral orgasm drains you dry in much the same way.");
			else output("An all-consuming warmth of relieved tension overtakes you. You can’t cum like him, but you don’t need to. Simply being his slut is enough to feel relief from arousal.");
			//[Next] \\ Go to [Finished]
			// sceneTag: PC cums
		}
	}
	// rand 2 (Milodan Facefucks PC) (ONLY after doing [C. Worship] once!)
	else
	{
		output("\n\nYour alpha places his other hand on your opposite cheek, lurching forward, pressing his lip-gaping sturdiness to the center of your [pc.lips]. You pucker up on instinct, the rush of his assertion and dominance spurring you into physical reactions of submission. He pushes forward, and the emotional satiation of being taken then and there proves to be too much. Your eyes try to roll back while the crown of his girth slaps against your tonsils. It’s giving your maw all the concentrated male lube it will need to prepare him for his journey. You drool around his throat-stuffing mass, sucking in your cheeks to wring out just a little more of his juice. It’ll help when he’s pounding away at your face.");
		output("\n\nWiggling your tongue, you glance up to find the ebullient expression of a grizzled warrior poised to claim his prize. He withdraws, dragging your head to the tip, groans of heated approval giving voice to the pleasure your [pc.lips] bring him. ");
		if(pc.lipRating() < 3) output("They may be small, and they may be easily strained by the rod you’re expected to swallow, but whilst they may not provide maximum pleasure, there <b>is</b> some joy your master will derive in seeing you twisted into a hard-fucked mess.");
		else if(pc.lipRating() < 6) output(" Your master almost loses himself to the firm yet plush, forgiving hug of your sublime sex-cushions. They retain their color and thickness, passing his dick’s test with flying colors, sweeping across his erection with the promise of a mind-blowing fuck.");
		else output(" Your master reflexively tightens and stops, the climax-sparking sweep of your blubbery DSLs proving to be more tempting an indulgence than the proverbial apple of eden. He’s purring so loudly that you feel it through his cock, held securely in the luscious, pouting, fuck-my-face lips of his star-walking suck-slut.");
		output(" Then his masculine mast is pushing back into your slavering suckhole, stretching you around lust-thickened hardness in an almost respectful manner.");

		// pc Can’t Deepthroat
		if(!pc.canDeepthroat()) output("\n\nHe doesn’t wait to see if you can handle it or not, he stuffs you full then and there, battering past your reflexively tightening trachea and shoving his way into the vice of your gagging throat. You cry out, tears streaming down your face almost immediately. It is simply too much. Aware of your discomfort, the milodan unsheathes himself and spares you a few seconds to recover before gliding back in. This time, his nodule-lined phallus drives into your throat with less resistance, and now that you’re making a conscious effort to suppress your brain’s proclivities, he’s quickly able to hilt himself halfway to your stomach, pressing his fat, supple nuts to your jaw and his knot to your lips.");
		// pc Can Deepthroat
		else 
		{
			output("\n\nAlthough he doesn’t act to see if you can handle his insertion, you’re suddenly very glad that you don’t have a gag reflex. The masterful milodan plows through your wet esophagus on a one-way trip to your belly, spurting goo on the journey before clapping his balls and knot to your fuck-drunk face. The fingers wrapped around your head all stroke in enthusiastic tandem, impressed at and grateful for your dick-pleasing abilities. He pulls back and thrusts in again, fast learning just how much fun it is to have someone to himself that can handle all he’s packing. You hollow your cheeks down around his tool, clamping down on that all-natural expression of undeniable maleness to keep it safe.");
			// pc Bimbo (Add-on to Can Deepthroat)
			if(pc.isBimbo())
			{
				output("\n\nThe only thing hotter than being speared on a powerful cock right now would be seeing yourself in the position. Nothing is better than sitting there and being taken so fully, having someone act out all their deep, unmet desires on you. This big, hunky cat is fucking your face, all the wet polish inside making the immodest and desperate act a well-lubricated one. You hope you’ll taste his penis when you lick your lips later, feel a phantom phallus in your neck when you swallow. Maybe if you focus hard enough (which <i>is, admittedly,</i> kind of hard to do at any point) you’ll train your nose to find him out here by his dickmusk alone. Either way, there’s no greater joy than being attached to a stud by the mouth and not having to think about doing more than obediently slurping at his penis.");
			}
			// pc SnakeByte (Add-on to Can Deepthroat)
			if(flags["USED_SNAKEBYTE"] != undefined) output("\n\n<i>“Urrggnnn...”</i> the barbaric leopard crows, hissing from the incidental caress of your now-acting muscles. Ribbed rings of ball-draining efficacy seal him in, preventing him from doing more than being swept away in a storm of writhing lust. Not only do you have zero issue in taking him knot- and balls-deep, but your erogenous suckhole is equipped with the rather uncanny trait of a modified interior capable of extracting even the most endurant facefuckers of all their creamy seed. At first, he pulled back in shock, but now that he’s had a taste of you, the avatar of oral euphoria... he can’t get enough of it.");
		}
		// merge
		output("\n\nNever have you felt so firmly gripped by another person than before this milodan put his genetically-perfected breeding potential into fucking your mouth. All you have to do is hold on to his thighs and remember to breathe while he hauls into your tenderised throat, tugging your [pc.face] as it clings to his hardness. He twitches with urgency, vigorous need boiling in the depths of his maw-stuffing bulk. Moaning so that your voice can pleasure him too, you coaxingly slide up and down his trunk-like dick, glorying in the shameful ease of being useful to your alpha. He is, for you can never relax around him, you must always be lost in that stern pace his thick pole sets for you in violent pumps.");
		output("\n\nA body meant to endure the harshest environs is throwing all its force into claiming you, pounding you full of pent-up bounty. The interior of your spasming throat-hole is drenched in his organic rapture. Precum squirts, spurts, streams, it’s everywhere, now also splattering from your lips. You’re the glistening toy of a beast who had no idea that the [pc.boyGirl] who defeated him would be his willing cum-slut. Neither of you can articulate your appreciation for one another, save by focusing solely on the cock giving it to you rough and deep.");
		output("\n\nThe steaming rush of being claimed by some alien is wonderful. Here you are, for all your tools, your education, your training, your expertise, your civilization, taking it in the throat from a primitive hunter on some cold planet, loving every second of it. You’re already considering doing it again. There’s a ferocity here that’d be disconcerting to others but that appeals to you on a personal level. It’s exhilarating, having those spunk-heavy balls mauling your chin. It’s intoxicating, watching him use you, yet not recklessly. There’s still some deference in the way he lunges for your belly, scratches behind your [pc.ears], and imposes himself in a way that protects you from the elements.");
		if(pc.isBimbo() || flags["USED_SNAKEBYTE"] != undefined) output(" Not that he needs to. The fact you keep cumming yourself stupid just from being an oral fuckpuppet gives you all the sinuous heat you require.");
		output("\n\nMaybe he doesn’t love you, but he cares about you. Your comfort is important to him, and not just because a lack of respect would lead to a lack of pleasure. Irresistible desire takes its toll on his sexual consistency, and it soon fades. But you’re already well too dizzy to care when he cranes your head up, positions himself firmly on your face, and jackhammers you into the snow-swept plain. Your entire body shakes and rattles while he goes knot-deep. " + (flags["USED_SNAKEBYTE"] == undefined ? "It concerns you that he might try to force it in, but he knows your limits. He knows you can’t handle it, and that trying it would hurt. The realization lets you float away in the storm of his urges.":"It takes him by surprise when you work your jaw in an obscene and magical way, accommodating his knot and even part of his nutsack past your lips. He’s mentally obliterated by the reality: that he can knot-fuck your mouth, truly use your cock-socket of a face like he would some trophy wife’s cunt. Even better? He’ll get to shove it all the way in when he’s ready to cum."));
		output("\n\nWhile you very faintly consider that giving up your quest and submitting to this milodan for the rest of your life, dominated by his masculine intent, it’s the whimper of impending climax that breaks you from your reverie. His pace collapses into a series of shuddery, disjointed thrusts that make the delicious aches in your well-fucked throat <b>shine</b> in bliss - helpless, spasming bliss. Realizing he’s ready, you give him a little push, [pc.lips] squirming around his shaft, feeling tension drain with every face-fucking cycle. The only alert you get that it’s happening is when he slides down and plants his feet" + (flags["USED_SNAKEBYTE"] != undefined ? ", fitting his knot between your happy cheeks":"") + ".");
		output("\n\nIt happens so fast that you can’t even register. Your [pc.eyes] bulge with the sudden flood of gouting milodan cum. White-hot sperm splatters your innards with gusto, building in your swelling, gravid belly. The liquid curtain falls, the rabid churn of his slowly-emptying balls lancing your wobbling stomach with heavy inflation. Pints of hot sperm gush rhythmically and unerringly into your belly, plugging you so full that it climbs back up the dirty, used gutter of your throat. You feel full, very comfortably full, with all that jizz pooling and settling in your innermost recesses. The torrents never cease, going on for minute after minute. This is what victory tastes like.");
		// pc Cums (Bimbo or SnakeByte Only)
		if(pc.isBimbo() || flags["USED_SNAKEBYTE"] != undefined)
		{
			output("\n\nYou can’t hold back any longer - the trembling, tender sensations of having your arousable throat screwed and spunked feed directly into your crotch. ");
			if(pc.isHerm()) output("Your [pc.cocks] bust, launching [pc.cum] into " + (!pc.isCrotchExposed() ? "your clothes":"the snow under his legs") + " next to your [pc.pussiesLight], expelling the victorious hermaphroditic discharge of an assertively claimed slut.");
			else if(pc.hasVagina()) output("Your [pc.pussiesIsAre] lighting up, going hollow, until the moment of [pc.girlCumVisc] emission. Yes, " + (pc.isSquirter() ? "you’re squirting":"you’re cumming") + ", all because you get exceptionally horny from the act of being facefucked... and you love it.");
			else if(pc.hasCock()) output("Bloating, your [pc.cocks] detonate, busting your [pc.cumVisc] nut into " + (!pc.isCrotchExposed() ? "your clothes":"the snow underneath him") + ", ejaculatory expulsions timed with his own. Oral orgasm drains you dry in much the same way.");
			else output("An all-consuming warmth of relieved tension overtakes you. You can’t cum like him, but you don’t need to. Simply being his slut is enough to feel relief from arousal.");
			//[Next] \\ Go to [Finished]
			// sceneTag: PC cums
		}
	}
	processTime(25);
	pc.loadInMouth(enemy);
	IncrementFlag("MILO_C_WORSHIPS");
	if(pc.isBimbo() || flags["USED_SNAKEBYTE"] != undefined) pc.orgasm();
	clearMenu();
	addButton(0,"Next",finishBlowingMiloBoi);
}

//[Finished]
public function finishBlowingMiloBoi():void
{
	clearOutput();
	showMilodanMale(true);
	author("William");
	output("You let yourself be used for a while longer. One orgasm, as it happens, is not enough to satisfy any milodan. That’s why you stayed where you were, turning into little more than his [pc.raceShort]-shaped condom. You sucked him off faster than every previous climax until his balls had diminished considerably, certainly providing his sweet meat with more intense orgasms than any of his kind had up to this point. By the time he unslotted himself from your throat, you had passed out to the sound of a wet pop.");
	output("\n\nNow you’re awakening. It’s been maybe ten or twenty minutes. You’re still outside, but it’s not cold. You’re completely embraced by the milodan, sharing his body heat for your protection. The moment you stir, he does, and he licks the back and sides of your neck in a half-possessive and half-... something else. Whatever it is, you like it. Then he does it again, pawing at your body, at once enjoying your tactility and coaxing your once-dormant muscles into readiness.");
	output("\n\nThere’s no conversation to be had. He says nothing, and you’re, quite frankly, finding it hard to disentangle, particularly since you’re still sway to the (luckily benign) weather patterns of wintry Uveto. Hopefully the stuffing you got keeps you warm. When you go to leave, he reluctantly allows it. The squeeze of his hand on your shoulder fills you with intense emotional fulfillment.");
	if(pc.isBimbo()) output(" You kiss him on the cheek then the tip of his still-exposed cock before going on your way. You’ll never forget him!");
	else if(pc.isBro()) output(" You give him a pat back and a friendly glance.");
	else if(pc.isNice()) output(" You simply smile at him, stroking his face before turning and trudging off.");
	else if(pc.isMischievous()) output(" You pinch his fluffy ear and give him a proud, cum-flecked smirk before trudging off.");
	else output(" You shrug your shoulders, wiping your mouth and trudging off.");
	output("\n\nFuck, now it’s colder.\n\n");
	CombatManager.genericVictory();
}
/*
Summary for Fuck Fever Interactions by Meaty Ochre
Just wanted to make something that made use of existing mechanics/fetishes. It seemed odd to me that Milodan males drop Omega Oil but using it only gives Steele a scene with Syri so I wrote this. The scene requires the Fuck Fever status effect through using Omega Oil or the Omega Fever perk. Upon loss to a Milodan male Steele catches a dick in the butt. Hopefully it isn’t a dumpster fire.

I decided to also try my hand at some progressive submission scenes based on the number of times getting buttfucked by the Milodan males while under the influence of Fuck Fever. The difference scenes are at the beginning and end of the sex scene.

Notes

The scenes become slightly more submissive with each subsequent loss until a Bad End occurs.
*/
public function omegaLossToMiloMale(submit:Boolean = false):void
{
	clearOutput();
	showMilodanMale(true);
	author("Meaty Ochre");
		
	//First time:
	if (flags["OMEGA_LOSS"] == undefined)
	{
		output("Like a marionette cut of its strings, you can no longer support yourself in the wake of");
		//HP Loss:
		if (pc.HP() <= 0) output(" the Milodan’s assault.");
		//Lust Loss:
		else output(" your rampaging lust.");
		//Merge
		output(" Gravity takes over and");
		//PC is naga:
		if (pc.isNaga()) output(" your long tail collapses under you");
		//PC is taur:
		else if (pc.isTaur()) output(" you crash down onto your bestial lower half");
		//else:
		else output(" brings you down" + (pc.isGoo() ? "":" to your knees") + "");
		output(" while your hips start moving of their own accord. The " + (pc.hasStatusEffect("Fuck Fever") ? "Fuck Fever":"anal heat") + " churning in your blood stokes your lust to a near-sickening intensity, making the terrifying emptiness you feel in your [pc.asshole] all the more anguishing.");
		if (pc.hasPerk("Buttslut")) output(" Coupled with the Buttslutinator’s mental programming you’re left shaking on the spot, seized by a minor orgasm at the very thought of having your slutty hole filled!");
	}
	//from [Submit]:
	else if (submit)
	{
		output("Losing to Milodans as often as you have still hasn’t lost the accompanying novelty. It’s because, like Pavlov’s dog, you’ve been conditioned to expect the mind-blowing reaming afterwards that your heart thumps in anticipation rather than terror. For instance, the sight of the behemoth of fur-covered muscle and claw before you should send claxons off in your mind warning you of danger. Instead you shimmy on the spot, rubbing your thighs together as electricity sparks through your nethers.");
		output("\n\nAcquiescent, you");
		//PC is naga:
		if (pc.isNaga()) output(" coil your tail beneath you");
		//else:
		else output(" lower yourself" + (pc.isGoo() ? "":" to your knees") + "");
		output(". The Milodan eyes you warily, unsure if this is a feint to catch him off guard. As an acolyte at prayer you remain kneeling and lower your hands and face to the ground. Like a wanton whore you raise your hips to display your [pc.ass], wiggling your butt lewdly as invitation. Seemingly gratified, loincloth tenting and then falling away, the muscle-bound male stomps around to your hindquarters, greeting your glutes with a casual slap that makes you yelp aloud.");
	}
	else
	{
		output("Being alone in the cold of a hostile planet and at the mercy of a 500lbs barbarian would make even a hardened adventurer’s heart pound in terror. With the");
		if (pc.hasPerk("Omega Fever")) output(" Omega Fever surging through your blood");
		else output(" Omega Oil you slathered your anus in");
		output(" addling your mind however, all you can think is that this is the perfect opportunity to once more get your ass stuffed the way you like. You moan in");
		if (pc.HP() <= 0) output(" slight pain, the bumps and bruises in your last battle an odd partner to the hunger in your ass");
		else output(" unbridled lust, so intense it becomes a kind of agony");
		output(", and gaze up at your conqueror with need as you lower yourself before him. There’s no fighting what comes next, but if you’re going to get the reaming you think you will then you have no intention of putting up a struggle.");
	}
	//merge
	output("\n\nYou paw at your throbbing ass and [pc.hips] needily; you want – no, you NEED a cock up your butt right now. Not just any cock either, the hot and thick bitch-breaker of a true Alpha is the only thing you want reaming you, and fortunately the feline barbarian has exactly what you need swinging between his legs. Brain boiling over with bubbling pink lust, you assume the position of a true bitch: ass up and face down.");
	//PC is nude: 
	if (pc.isNude())
	{
		output("\n\nWandering the frozen wastes of Uveto’s surface in the buff may not have been the wisest idea, but on the bright side it means less time between finding the right dick-bearer and getting your ass stuffed. Exposed like you are the Milodan can see your");
		if (pc.hasCock()) output(" [pc.cocks]");
		if (pc.isHerm()) output(" and");
		if (pc.hasVagina()) output(" [pc.vaginas]");
		if (pc.isSexless()) output(" [pc.crotch]");
		output(" swollen with desire, but the big brute tells you he has other plans for you when his plate-sized hands squeeze your [pc.asscheeks].");
	}
	else output("\n\nIt takes no time for the barbarian to part your [pc.gear] from you and toss it flippantly around the area. He’s so strong he can handle you like a toy and you can’t even fathom showing resistance. Instead you pant hotly as his enormous hands roam over your gradually exposed flesh and coo each time he gropes a sensitive spot. Grinding your aching ass into his crotch helps soothe your nerves a bit, but you need your [pc.asshole] to be filled!");
	//First time getting this scene:
	if (flags["OMEGA_LOSS"] == undefined)
	{
		output("\n\nFrom what little you know of them, the furry barbarians seem more like people of actions than words. The monolithic shaft of this particular Milodan, only partially obscured by loincloth, is full of intent and his cold eyes are full of promises. Promises of a long, hard fuck.");
		output("\n\nThe brute before you sniffs the frozen air, drawing in a couple lungs full of air through his nose and catching your scent. Suddenly there’s a rumbling that could be a lustful growl or the crashing off some far off avalanche that ends when the big brute speaks one word: <i>“Omega.”</i>");
	}
	//Repeat:
	else
	{
		output("\n\nAlthough stoic as ever, you’ve been fucked by enough Milodans to know just what the beastly male has in store for you. Drool rolls down your chin as you get lost in daydreams of reamings past, [pc.asshole] clenching happily at the memory. It’s been too long since a big strong Alpha came to claim you as their own, and you’re not going to let this opportunity go to waste.");
		output("\n\nThe earthy flavor of his lust is heavy on the frozen wind and so arousing that you wish you had a way to bottle the scent so you could always have it with you. The heat in the barbarian’s burly body suffuses your own as he presses his entire frame against you, pins your wrists, and snarls into your ear, <i>“Omega.”</i>");
	}
	//Merge:
	output("\n\nThe Alpha already knows what you are, no point in denying it. It’s practically written on your [pc.face]! <i>“Fuck,”</i> You groan, the pink haze in your mind blotting out any other responses. <i>“Yes, I am. I’m your Omega. I’m your bitch!”</i> Your dominator chuffs in approval and releases your hands, trailing his big mitts up your arms");
	//PC has breasts:
	output(", pausing to knead your [pc.breasts] a moment,");
	output(" and rubbing along your back. The pointed tips of his claws press ever so lightly into your flesh along the way. A hiss of pleasure is forced from your teeth when his hands finally");
	if (pc.isTaur()) output(" pass over your tauric lower body and");
	output(" come to rest on your ass.");
 
	output("\n\nNuzzling his way between your butt cheeks, the Milodan rips a whorish scream from your throat as he strokes your pucker with his coarse tongue. That dexterous muscle swirls in and around your rim, making your back entrance pliant and receptive for the reaming to come, whetting your anal appetite until you’re at the brink of starvation for his bulbous, veiny tool. Holding a thigh in each hand, he kneads the flesh of your [pc.legOrLegs] possessively, approving of your sexy body and libidinous behavior. It’s as if the muscular feline is a glutton indulging himself, and your [pc.ass] is appetizer, main course, and dessert!");
	output("\n\nSlathering your [pc.asshole] with spit doesn’t take long, so the brute withdraws his maw to slap his meaty dong down into your saliva-slick ass cleavage.");
	if (pc.buttRating() <= 4) output(" Your cute tush is a tad too petite to give a proper buttjob, but not for lack of trying. The Milodan grinds his cock over your perky, well-formed cheeks and against your hole with such insistence that you can recreate a mental image every nub and vein.");
	//PC has medium butt
	else if (pc.buttRating() <= 6) output(" Smaller cocks could fit snugly between your buns with no problem, but this big boy is anything but small. A plush booty like yours is definitely up for the challenge though! His big hands squeeze your ass cheeks into the sides of his prick and he eagerly begins humping away at your bottom.");
	//PC has big butt:
	else if (pc.buttRating() <= 8) output(" A big booty like yours demands attention however, and the Milodan eagerly pays his dues. He can’t seem to decide whether he wants to spank or knead or jiggle your ass flesh more, so he settles for a combination of all three as he saws his monolithic shaft through your butt cleavage.");
	//PC has biggest butt
	else output(" There’s only one thing a big fat ass like your own bouncy rear end was meant for: attracting big strong Alphas like the Milodan to molest you, and you both know it. The beastly male squeezes and slaps your too-juicy tushy hard enough to make you cry out in pleasure and pain, enraptured by the way your flesh bulges between his fingers and jiggles around his straining shaft. You groan, adoring the rough treatment and twerking your [pc.ass] against his hips as he saws through your abundant anal cleavage.");
	//Merge
	output(" The nubs on the head of his cock tug at your asshole with each pass of his long dick, smearing precum in your crack and creating sinfully slick sounds. Beneath it all your");
	if (pc.hasCock()) output(" [pc.cocks] twitch" + (pc.hasCocks() ? "":"es") + "");
	if (pc.isHerm()) output(" and");
	if (pc.hasVagina()) output(" [pc.vaginas] throb" + (pc.hasVaginas() ? "":"s") + "");
	if (pc.isSexless()) output(" [pc.crotch] throbs");
	output(" with unheeded need.");
 
	output("\n\nWhen the nubby head of his cock finally pops into your anus it’s so good that you sob a bit. It’s more than just physical pleasure; it’s the joy of fulfillment! Being pinned under a virile Alpha with your ass full of monster cock is your life’s purpose, and you bounce your butt on the Milodan’s dick in reaffirmation of that truth, elated at the mind blowing pleasure. You give up on containing the giddy squeals of pleasure that the Milodan’s thrusts elicit from you to focus on more important things. The rush of endorphins spiking your fevered blood. The warmth of the large body pressed firmly against you. The simple pleasure of just staying there and <i>taking it</i>. You can’t help but think that maybe, all the stuff you’ve done until now - the probe hunt, your inheritance, joining the Planet Rush - were all just stepping stones for this moment, right now.");
	output("\n\nHis unrelenting cock stretches you, breaching you slowly even as your greedy hole welcomes it.");
	//Buttslut
	if (pc.hasPerk("Buttslut")) output(" The Word flashes before your mind’s eye, radiant and true: Obey. That’s right, good, obedient buttsluts get fucked!");
	output(" There’s the sound again, what seems like an avalanche but really it’s just the pleased snarl of the beast on top of you. Though, the possessive way his hands roam over your ass and sides, back and chest tell you he’s planning a flood of white cum just for you.");
	if (!inCombat())
	{
		setEnemy(new MilodanMale());
	}
	pc.buttChange(enemy.cockVolume(0));
	output("\n\nEach slap of the burly barbarian’s balls against your ass pushes you a little further into the utmost depths of depravity. The Milodan male continues to ream your ass with the most wonderful long strokes of his girthy shaft, fueling your " + (pc.hasStatusEffect("Fuck Fever") ? "Fuck Fever":"anal heat") + " until pleasure is frothing through your veins. You can’t stop babbling submissive praise; you tell him how you much you love how well he fucks your ass, how the nubby spines and veins of his feline prick feel inside your colon, how badly you want his knot stretching you. Your babbling earns you a few slaps on the ass, but you thank him for those too, which earns you more affectionate slaps. It quickly devolves into a deliciously vicious cycle of incoherent praise and love taps.");
	//PC is DD cup or larger:
	if (pc.biggestTitSize() >= 5)
	{
		output("\n\nYour [pc.fullChest] demand almost as much attention as your ass does, and predictably the Milodan male can’t keep his hands off them. Whenever his hands aren’t molesting the flesh of your ass, he reaches around to cup one of your [pc.breastCupSize]s or roll your [pc.milkyNipples] between the pads of his fingers.");
		//PC is lactating
		if (pc.isLactating()) 
		{
			if (pc.milkQ() <= 500) output(" As the first drops are coaxed from your teats it takes only a little more teasing to work your boobs up to a respectable spray, streams running over the curves your udders and his hands, and soon the scent of sweet [pc.milkNoun] pairing with the spicy smell of raunchy sex.");
			//PC is lactating a large amount
			else output(" It’s a weak dam that holds back the flood of your [pc.milk] from the world, and the Alpha fucking you shatters it. A flood of [pc.milkColor] soaks the snow around you with [pc.milkVisc] sweetness and pride swells within your chest at the bountifulness of your bosom.");
		}
		output(" The sensation of having your jugs caressed" + (pc.isLactating() ? " and milked":"") + " is just another spoonful of the bliss you’re experiencing.");
	}
	//Merge
                                      	
	output("\n\nWith one last stroke the alien male sheaths his entire length in your [pc.asshole], his knot swollen so massively that it would tear anyone who doesn’t adore anal sex as much as you do. Your butt gobbles up every inch, barely a moment taken to savor swallowing the knot. That beautiful breeder bulb packs you full and seals your ass tight just as it swells to its full, turgid size.");
	output("\n\nHis limit finally reached, the Milodan blesses your ass with his own avalanche of sticky white spunk, thick ropes of the stuff basting your insides with baby batter. With no place else to go your stomach begins to swell as your bowels are pumped full. Even the barbarian’s virile, bulbous, veiny knot can’t hope to contain all the spunk he’s pumped into you. The back blast foams around your joining, runnels of the goop soaking your [pc.skinFurScales].");
	output("\n\nYou cum so hard you can’t even make a noise. Eyes screwed shut, you convulse like the possessed, defenseless against the searing intensity of your own orgasm,");
	//PC is goo
	if (pc.isGoo()) output(" your gelatinous form nearly losing its carefully maintained shape.");
	//else
	output(" your bones seemingly turning to goo.");
	//PC is sexless
	if (pc.isSexless()) output(" With no organic outlet for your burning arousal, your featureless crotch buzzes with directionless heat");
	else
	{
		output(" Untouched but driven to sympathetic orgasm,");
		if (pc.hasCock()) output(" [pc.eachCock] lance" + (pc.hasCocks() ? "":"s") + " sizzling hot spunk into the icy ground");
		if (pc.isHerm()) output(" and");
		if (pc.hasVagina()) output(" [pc.eachVagina] glaze" + (pc.hasVaginas() ? "":"s") + " the ground and your thighs with feminine fluids.");
	}
	//Merge
	output(" Suddenly your train of thought is derailed and chugs off into the night, taking you along with it, the world around you fading to black...");
 
	output("\n\n...Did you pass out for a moment there?  You must have, because the Milodan is pumping away at your hole again, this time taking you in a new position, determined to fill your colon with another load of hot cum.");
	processTime(45);
	pc.orgasm();
	pc.loadInAss(enemy);
	clearMenu();
	addButton(0,"Next",omegaLossToMiloMale2);
}
public function omegaLossToMiloMale2():void
{
	clearOutput();
	showMilodanMale(true);
	author("Meaty Ochre");

	IncrementFlag("MILO_MALE_CON_LOSSES");
	//First time:
	if (flags["OMEGA_LOSS"] == undefined)
	{
		output("After what feels like an eternity submerged in an ocean of pleasure, all you can manage are gasps, screams, and the most lurid, slutty moans to ever leave your lips. <i>“Fucked stupid”</i> doesn’t even begin to describe your current state; eyes glazed over and drooling, anyone who saw you would say you were buttfucked into a coma! When you burp you taste cum. Your behind has been relentlessly battered by the barbarian to the point that your slackened anus offers no resistance to the fleshy bulb of his knot plunging in and out.");
		output("\n\nIs it possible to be fucked for this many hours without the use of a machine? Has it even been hours or has it been days? Consciousness has come and gone as orgasm temporarily smashed your mind to bits, but you know the Milodan has taken your ass again and again in a variety of positions. The nonstop pummeling of your [pc.asshole] makes it hard to tell, but you know your Fuck Fever has finally been burned out and you are truly, deeply satisfied.");
		if (pc.hasPerk("Buttslut")) output(" Except, there’s no way a buttslut like yourself could ever get enough anal sex, is there? You can only be satisfied when that feeling of emptiness is dispelled by a rigid shaft in your bum, and luckily the Milodan has no intention of pulling out just yet.");
		output("\n\nIf fact, you’re so satisfied that you could use a good rest to let your worn-out body recuperate. Lulled to sleep by the fading sounds of flesh slapping flesh and the buzz of endorphins that surge up with every thrust of your Milodan Alpha, you allow the comfortable darkness to overtake you.");
		output("\n\nConsciousness returns only a short while later, quickly enough that you can still feel the residual heat from the Milodan’s body lingering in your flesh. The barbarian’s spunk warms you from within as well, but you blush radiantly when you realize just how much of the hot goop is pouring from your [pc.asshole]. A sharp gust of wind blows, reminding you that this warmth is temporary and that you should get a move on if you don’t want to become a Steelecicle.");
		output("\n\nStanding up is rather difficult at the moment so you’re reduced to crawling about the area to gather your equipment. You take the time to gather your thoughts as well, memories of your submission appearing before your mind’s eye. A shiver wracks your body but it’s not from the cold; even without the Fuck Fever clouding your mind you can’t deny how hot it was to be so completely used, to submit and have your ass bred by an Alpha. If you crossed paths with another of the fur-covered barbarians would the same thing happen again? Would he hold you down and ream your hole like the last one did?");
		output("\n\nYour hands have dipped down to your [pc.crotch] of their own accord, your scattered possessions momentarily forgotten. It’s hard to resist rubbing one out to the memory of getting so perfectly assfucked, but throwing a handful of snow in your own face cools you off quickly enough. Better to have a faceful of it than be buried under it because you spent too long fantasizing.");
	}
	//lose 2-3 times:
	else if (flags["MILO_MALE_CON_LOSSES"] < 4)
	{
		output("When you come to you’re still tied to your Alpha’s hips by his bitch breaker, [pc.ass] pressed snugly into his abdomen. You would have expected him to wrench his knot loose and stalk off into the snowy waste when he done slating his lusts on you, but here he is, purring in satisfaction and lazily running his hands over your");
		if (pc.isTaur()) output(" tauric flanks");
		else
		{
			output(" [pc.belly]");
			//PC has DD cups or larger
			if (pc.biggestTitSize() >= 5) output(" and [pc.fullChest]");
		}
		output(". Although his body is draped over your own he must have dragged you into some alcove to shield you from the worst of Uveto’s weather. Not so stoic after all, you suppose.");
		output("\n\nJust as you reach behind to give his feline ear an affectionate scratch, the Milodan decides it’s time to leave after all. Bracing his hands on your [pc.hips], he pops his deflating knot out with a grunt, sending shivers down your spine as his spunk oozes from your gaping hole. Pausing only to scoop up his loincloth off the snow, the barbarian stalks off into the tundra once more. You should probably start gathering up your things... but maybe you’ll just wait until you can feel your [pc.legs] again.");
	}
	//lose 4-5 times:
	//(6+ losses happens in the bad end scene)
	else if (flags["MILO_MALE_CON_LOSSES"] < 6)
	{
		output("The Milodan doesn’t let you leave right away when you wake up; his cum smeared cock is in need of cleaning and who are you to refuse your Alpha? You set to the task with relish when he pops his deflating knot free from your ass, slurping at every nodule and tracing every vein with your [pc.lips] and tongue. The taste of cum on the barbarian’s cock is amazing, a flavorful reminder of how perfect submitting to him feels.");
		//PC has DD cups or larger: 
		if (pc.biggestTitSize() >= 5) output(" Thinking that his cock should have something soft to rest on after working so hard, you add your [pc.breasts] to the mix, wrapping the pillowy flesh around his member as it stiffens once more.");
		output(" Soon you’ve coaxed another load from your dominator that’s just as potent as the ones he’s blessed your ass with.");
		output("\n\nYou savor the load of jism the way some do a bowl full of home cooking, humming in approval of the feeling of submission it gives you rather than the actual salty taste of your Alpha’s spooge. Cheek resting against his now spotless cock, ass angled toward him so you he can grope your bottom, you bask in the feeling of truly being owned. In the moments before your lover leaves you indulge in a fantasy of spending the rest of your life like this: submitting and servicing girthy, knotted cocks while in the throes of " + (pc.hasStatusEffect("Fuck Fever") ? "Fuck Fever":"your anal heat") + ", using your ass and mouth" + (pc.biggestTitSize() >= 5 ? " and tits":"") + " as targets for the lustful secretions of these burly barbarians you’ve come to adore.");
		output("\n\nSome small voice inside you speaks up; warning you about continued submission and making you think that soon you won’t be able to break away from the feline barbarians that have been reaming your ass. A much louder voice reminds you how fucking <i>amazing</i> it is to submit to these brutes, how having your rear entrance used like a sextoy makes your concerns melt away. <b>Nonetheless, you should avoid losing to Milodan males if you don’t want to become their butt-bitch.</b>");
		pc.applyCumSoaked();
		pc.loadInMouth(enemy);
	}
	output("\n\n");
	//merge
	//Next
	//End Scene, move time forward a few hours, applies maximum ass looseness, Anally Filled status effect, and removes Fuck Fever (so no Strangely Warm or Flushed leftovers).
	IncrementFlag("OMEGA_LOSS");
	for(var y:int = 0; y < 20;y++)
	{
		pc.orgasm();
		pc.loadInAss(enemy);
		pc.buttChange(enemy.cockVolume(0));
	}
	processTime(5*60);
	if(inCombat()) CombatManager.genericLoss();
	else
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}
//Bad End Escape:
public function omegaBadEndEscape():void
{
	clearOutput();
	showMilodanMale();
	author("Meaty Ochre");

	setEnemy(null);
	CombatManager.abortCombat();
	output("No, this isn’t what you want! You wring yourself free of the brute’s grasp, his clawed fingertips raking across your rear in a futile attempt to maintain hold on your cheeks. The Milodan snorts heavily, vexation plain on the creature’s otherwise impassive face, and starts towards you with clenching fists.  Unless you get away you’ll be dragged into a life of sexual servitude for the race of feline barbarians.");
	output("\n\nThere’s no way you’ll be taken so easily today, and the big dumb brute isn’t worth your time fighting; crouching low you scoop up as large a handful of snow as you’re able and chuck it and the barbarian’s snout. The white powder is only an annoyance but the few chunks of ice in the mix are enough to make him yowl. Pain and confusion are effective diversions, and you about-face and sprint as fast as your [pc.legOrLegs] will carry you, no destination in mind except for <i>away</i> and with plenty of space between the Milodan male and yourself.");
	output("\n\nSprinting until your lungs burn will only do so much to guarantee your safety; you have to hazard a look behind you to see if that walking tower of fuzzy muscle is pursuing you. Gathering your breath and your courage, you look behind you to see... no one. Either the brute gave up chasing after you or didn’t bother at all, but you aren’t in danger of being a lifelong anal whore yet. Strangely you feel a pang of something similar to regret at that thought, but dismiss it with a shake of your head. It’s time to resume your journey.");
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//Bad End Submit:
public function omegaBadEndSubmit():void
{
	clearOutput();
	showMilodanMale();
	author("Meaty Ochre");

	output("Yes, this is what you want! The Milodan hugs you against his chiseled torso as he deepens the massaging of your ass, tension melting out of you as relax into his embrace. Submitting to the " + (pc.hasStatusEffect("Fuck Fever") ? "Fuck Fever":"anal heat") + " so many times has cemented your true calling as an Omega. Thankfully these wonderful, masculine Alphas have recognized it as well and reamed your [pc.asshole] enough to make you crave the pleasure surrender brings. You gaze at the brute adoringly, thanking him for seeing your need to for domination, and he responds with a pleased rumble as he begins removing your things.");
	output("\n\nYour codex falls to the ground with a muffled thump, immediately forgotten. So too do all the other trappings of your previous life, such materials having no place in the future awaiting you. For a brief moment you think that your Alpha intends to let you freeze, but you banish the thought of him ever letting you down. Your faith is rewarded when the Milodan produces an enormous fur pelt to wrap you in and");
	if (pc.isNaga() || pc.isGoo()) output(" a kind of fur sheath for your [pc.leg]");
	else output(" a set of hefty snow boots to slip your [pc.legOrLegs] into");
	output(" for your journey. Despite the simplicity of your garb you feel toasty warm as you clutch it around you, setting out not a moment after to live the rest of your life.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",omegaBadEnd);
}
//Bad End Loss:
public function omegaBadEndLoss():void
{
	clearOutput();
	showMilodanMale();
	author("Meaty Ochre");

	output("Fate, you ponder ruefully, doesn’t care what you want.");
	if (pc.HP() <= 0) output(" Your accumulated injuries have");
	else output(" Your irrepressible lust has");
	output(" drained the fight out of you despite your best efforts. Now all you can do is cower before the Milodan who so handily beat you, apparently none the worse for wear as he looms over you with the air of one dealing with a minor inconvenience. When he leans down to start stripping you of your things you know your old life is truly over.");
	output("\n\nAnything that isn’t part of your flesh is immediately flung out into the white, never to be seen again. Your codex and all of your gear vanishes piece by piece and you’re so completely beaten that you can’t even muster an attempt to retain them. Neither do you resist when the barbarian swathes you in a fur pelt, partly to keep you alive and warm for the journey ahead you realize, but also to keep your limbs restrained. The shaggy brute hefts you over his shoulders and starts trekking across the frozen landscape, determined to carry his catch home himself.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",omegaBadEnd);
}
public function omegaBadEnd():void
{
	clearOutput();
	showBust(bustDisplayMilodanMale(true), "MILODAN_PRIESTESS", bustDisplayMilodanMale(true));
	author("Meaty Ochre");

	output("The journey is long but surprisingly not difficult when a Milodan leads the way. The muscle-bound male takes you across vistas of ice far away from anything remotely familiar, snowy hills and glaciers blending together as all manner of foul weather passes overhead. Yet, not once do you ever feel that you’re in danger here, not while you’re under the protection of the burly feline who’s taken charge of your fate. Rather it’s the idea of arriving at your destination that worries you, a mix of trepidation and anticipation that has your belly near bursting with butterflies.");
	output("\n\nThe Milodan does take good care of you along the way, mainly by pumping your ass full of cum every few hours, warming you from within as your fur cloak warms you from without. Like a true Alpha is supposed to he dominates you expertly, rarely speaking but making you moan so loudly and so whorishly that you’re sure that whatever place you’re being taken to will hear you coming well before seeing you on the horizon. Somehow you’re still able to keep pace with your Alpha despite the constant reamings, and soon you crest a frozen hilltop to finally lay eyes on your destination.");
	output("\n\nOn the coast next to the frozen ocean is a village of fur tents and snow huts, walled off behind stacked blocks of hewn ice. The butterflies in your belly multiply as you approach the defensive structure until they seem to solidify into a lead weight. As you’re led through a guarded gap in the structure you can feel the eyes of every Milodan you pass turning in your direction, all curious of the foreigner in their midst. Do outsiders ever come amongst these imposing people? Your guide grumbles at you to keep up as your attention is diverted by the appraising stares of his kin and you quickly fall in behind him for the final leg of your journey.");
	output("\n\nAt last you come upon your destination, the biggest structure that the rest of the village seems to radiate outwards from. It’s one of the few build from actual stone, probably a temple or some other type of community center. You’re not given much time to ponder that thought; the Milodan who has been guiding and reaming you across the tundra quickly snatches away the furs that he gave you before shoving you through the doorway into the sanctum beyond. The door slams shut with finality, and you are alone.");
	output("\n\nShivering, you wrap your arms around your naked body, but not for lack of heat; fire pits line the walls of the temple and cast strange, twitching shadows along the pelt-covered floors and high reaching stone walls. Heat suffuses your frame and wards off the chill from the outside, but another kind of warmth begins to pool in your loins. A gasp bursts from your lips as your");
	if (pc.hasVagina()) output(" [pc.vaginasLight] moisten" + (pc.hasVaginas() ? "":"s") + ", twitching hungrily");
	if (pc.isHerm()) output(", and your");
	if (pc.hasCock()) output(" [pc.cocksLight] immediately stiffen" + (pc.hasCocks() ? "":"s") + " to full, turgid length");
	if (pc.isSexless()) output(" crotch heats up");
	output(", but it’s your own asshole’s need that is at the forefront of your lust infused mind.");
	output("\n\nAs if tracing an electric wire from your nethers to its source, your eyes are drawn to a round dais in the center of the high ceilinged room. There sits a luminous stone, the source of your arousal, a round object a bit bigger than your fist. Squinting through the slightly eerie glow you see that it is polished completely smooth, a blunted tip at the top then bulging radically outward before a sudden narrow taper and a flared base. Factor in the green glow and you realize you’re looking at a Savicite butt plug, and the more you stare at it the more it fills your vision until you’re aware your [pc.legsNoun] have unconsciously carried you to the edge of the circular platform.");
	output("\n\n<i>“The off-worlder likes it,”</i> observes a voice from nearby, nearly making you jump out of your skin when you realize it’s coming from the other side of the dais. The voice belongs to a Milodan female, some kind of priestess judging by the sparse but ornate garb covering her fertile figure and staff capped with a similar piece of Savicite. Her bushy tail twitches lightly and she smiles knowingly at you. <i>“That is good. The spirits have brought you to the Totem. To us.”</i>");
	output("\n\nYou release a breath you didn’t realize you were holding. <i>“Actually, it was one of your males that brought me here.”</i>");
	output("\n\n<i>“It was the spirits who guided their actions,”</i> she corrects, <i>“and we are those who act on their guidance. Whether it’s for prey to hunt, off-worlder magic to salvage, or...”</i> Reverently, she kneels to pick up the radiant sex object and hops lightly off the raised stone circle to show it to you. This close the heat from the thing is all consuming, threatening to burn you with its lusty green fire. When she taps it gently against your abdomen a moan worms its way past your lips, your lust becoming painful in its intensity. <i>“Or if there’s an Omega out on the plains, looking for Alphas to serve.”</i>");
	output("\n\nYou try to tell her otherwise, that you’re a Rusher looking for probes, but all that comes out are mumbled words and whimpers. The Milodan female just chastises you. <i>“No, we know what you really are.”</i> She says smugly, a lewd glint in her green eyes. When she traces the sacred sex toy over your flesh you gasp hotly at the sensation, your need for some kind of satisfaction becoming unbearable. You’re rooted to the spot, unable to act on your own, reduced to moaning like a whore as the priestess continues the sensuous torture.");
	output("\n\nShe slides the object gently across your collarbone and up your neck, resting it on your cheek a moment. <i>“Now that you are here, you will serve.”</i> When she brushes it across your lips you can’t resist suckling the green tip a bit before it goes back down the other side of your face. More whimpering escapes you, any semblance of dignity draining out of you as lust fills its place.");
	output("\n\n<i>“You will serve in the manner befitting your true nature...”</i> The toy wanders down your chest and flicks a nipple before continuing down to the curve of your hip. With her free hand the fluffy female caresses the [pc.skinFurScales] untouched by Savicite, her delicate touch raising gooseflesh as it passes you’re your body.");
	//PC has DDs:
	if (pc.biggestTitSize() >= 5) output(" She takes great pleasure in hefting your breasts in her hand, taking ample time for each bouncy chest pillow.");
	//PC is lactating:
	if (pc.isLactating()) output(" Your body can’t help but let down your [pc.milkNoun] after so much stimulation, and when beads of [pc.milkColor] begin to form on your teats the priestess leans her head down to lap with feral hunger at your bosom, coaxing out more and more of your lactic excess.");
	output(" You’re completely flushed with submissive need, so bad that you’re ready to drop to the ground and follow the first order given to you. The fetish idol glides");
	if (pc.isTaur()) output(" over your tauric flank");
	else output(" over your hip");
	output(" and slides gently in to crack of your ass, gliding up and down, up and down through your anal cleavage.");
	
	output("\n\nA sharp spike of sensation bursts in the flesh of your buttcheek, slightly painful but sinfully gratifying after the prolonged teasing. Lurid moans are your only form of communication now; that and sticking your ass out invitingly, hoping to tempt the toy inside your salacious hole. The priestess continues stroking it up and down your valley, up and down with ever so slightly increasing firmness, up and down as it snags on the rim of your anus before dragging past once again. Just when you think the wonderful torment has no end in sight, the blunt point pauses atop your clenching pucker, settling into position for the imminent penetration.");
	output("\n\n<i>“...that of an Omega.”</i>");
	output("\n\nThe pressure on your sphincter comes to a tipping point, and finally your hole is forced to yield to the insistent idol. You moan as you feel your");
	if (pc.ass.looseness() <= 2) output(" narrow hole stretch to accommodate it");
	else if (pc.ass.looseness() <= 4) output(" loosened anus eagerly accept it");
	else output(" gaping hole gobble it up");
	output(", fireworks popping in your nethers as the toy settles in your colon.");
	if (pc.hasCock()) output(" Your [pc.cocks] "+ (pc.hasCocks() ? "twitch as they unload":"twitches as it unloads") + " volley after volley of stringy spunk with such power you can hear your cock squirting. So high are you on the pleasure of being penetrated that you can’t imagine ever using your cock to penetrate someone again. You were born to catch, and your own phallus is nothing but a benchmark to compare other pricks against!");
	else if (pc.hasVagina()) output(" Twitching and clutching at a cock that will never come, your [pc.vaginas] weep"+ (pc.hasVaginas() ? "":"s") + " tears of feminine joy despite being left out again. It’s not just the pleasure of anal that is making you into such a wanton slut, it’s the specific denial of your organ"+ (pc.hasVaginas() ? "s":"") + " made for penetration that drives you over the edge!");
	else if (pc.isHerm()) output(" Even though you’ve been blessed with both masculine and feminine genitals, your [pc.cocks] and [pc.vaginas] can only tremble and juice themselves in sympathy as your greedy ass is treated to pleasure.");
	else if (pc.isSexless()) output(" Most creatures with sexual urges have some sort of organ meant as an outlet for their pleasure, but your bare crotch has no such thing. Instead the pleasure you feel ricochets through your body, prisoner to a joyous sensation you have no words for.");
	output(" Unable to support yourself any longer, you collapse onto the fur pelts padding the ground, trying in vain to keep your hips raised. The orgasm that overtakes you in that moment is so intense that you’re at risk of disappearing beneath it forever, but are brought back with a woeful moan as it withdraws from your butt.");

	output("\n\n<i>“Onto the dais.”</i> The priestess instructs, and you hasten on wobbly limbs to comply, hurried by a quick spank on your ass. As you assume position in the center of the raised stone, you realize you have other witnesses to your submission");
	if (pc.exhibitionism() <=50) output(" and you flush pink in humiliation at the public depravity of your situation, your heart thumping so loudly you think it’s about to leap out of your throat.");
	else output(" and your heart sings as you feel the familiar lusty sting of having a crowd watch your depravity. You hope the entire village comes to see you!");
	output(" There’s more than a dozen Milodans stepping out from the flickering shadows, mostly males stroking their nubby dicks but a few females fingering their dripping slits as well. Each of them has their ravenous gaze fixed on your nude form and you shudder under the intensity of their stares. In time each of the spectators will have their turn with the [pc.race] in the center of the temple, but for now you surrender to your inoculation into Milodan society.");

	output("\n\nOnce more the molten heat of the Savicite buttplug makes contact with your flesh and the priestess begins plundering your ass with slow, methodical movements of the wrist. Soon she begins to fuck your ass in earnest with it, and explains to you in great detail the expectations of your new role in the Milodan village. <i>“Submission is your new way of life if it wasn’t already, and as an Omega you are an acolyte of the spirits and a receptacle of the lusts of any of the Alphas who wish to use you.”</i> Frantically you nod your head in assent. The enormous bulge of the buttplug doesn’t just pack your slutty ass full, it clears away any disagreements in your mind to make way for the priestess’ truth.");
	output("\n\nThe circle of barbarian catpeople is closer to the dias now, each masturbating themselves or their neighbor but beady eyes fixed predatorily on you. Deeper and deeper you fall into the trance of anal submission and indoctrination, swooning as the dominant female plugs your hole again and again. <i>“You will memorize and recite scripture on the necessity and intricacy of Domination and Submission, and you will maintain and preserve this temple and our –your beliefs. This [pc.ass] no longer belongs to you, it belongs to all of us, but you will love the work you will do.”</i> That sounds so right to your ears that you vocalize your joy at the prospect. <i>“Yes! Yes I will love it, I mmmm do love it!”</i>");
	output("\n\nSmells of lust are all around you as the Milodans now stand shoulder to shoulder around the platform. They jerk their turgid dicks with such forcefulness that flecks of pre splatter on your [pc.skinFurScales] and you moan more whorishly than ever at the debauchery of it. Above you, the priestess continues with her instruction, still fucking your asshole with the totem, lingering as it stretches you at its widest point. <i>“You will bounce your butt on all the cocks that pass through the temple threshold. If they do not have a cock then you will submit to them in other ways, use your other gifts – your hands, your mouth" + (pc.biggestTitSize() >=5 ? ", your breasts":"") + " – to please them. Communion with the spirits is the beginning and ending of your day. Anyone who wishes to use the Totem to stretch out your rear-hole, can. You will sate the lustful.”</i> She squeezes your [pc.ass], then reaches around to briefly grope your [pc.crotch]. <i>“You will not breed.”</i>");
	if (pc.isLactating()) output(" Her clawed mitts jiggle your [pc.breasts]. <i>“You will feed the hungry.”</i>");
	output(" She grabs you behind the head and pulls you into a searing kiss. When she pulls away, the priestess smiles and says, <i>“You will sing the praise of the spirits and be happy with us.”</i>");
	output("\n\nYou cum again. You cum, and with that sacrosanct release of lewdness you know the rest of your life has truly begun.");
	processTime(5*60);
	for(var y:int = 0; y < 10;y++)
	{
		pc.orgasm();
		pc.loadInAss(enemy);
	}
	clearMenu();
	addButton(0,"Next",omegaBadEndII);
}
public function omegaBadEndII():void
{
	clearOutput();
	showBust(bustDisplayMilodanMale(true), "MILODAN_PRIESTESS", bustDisplayMilodanMale(true));
	author("Meaty Ochre");

	output("From dawn until dusk and into the next morning each adult Milodan in the village has their way with you. Burly male barbarians force their boners into your butt, greedily propelling themselves to orgasm and using your body as  nothing but an object. Bushy tailed females take great pleasure in dominating you in other ways, mostly by assfucking you with the sacred sextoy.");
	if (pc.isLactating()) output(" Since you carry a bounty in your bosom you stagger about and nourish your flock with your [pc.milkyNipples] in between reamings, those who partake soon refreshed enough to have you once more.");
	output(" [pc.name] as the galaxy knows [pc.himHer] all but disappears into a fugue state, the last vestiges of your old personality vanishing and replaced by a true servant of the people.");
	output("\n\nWhen you next come back to consciousness the priestess greets you with warm familiarity and hot food which you consume ravenously. It’s a simple meal but surprisingly tasty and very filling; you need all the sustenance you can get after yesterday’s bout of intense sex. When you’ve licked your bowl clean the other temple servants appear to guide you to the bath and scrub you squeaky clean, whisking away all the sweat and cum that covered your body.");
	output("\n\nThe final touch is to dress you in adornment befitting your new role: a stiff hide collar and necklaces made of shaped stones and bleached bones, a similarly made belt that holds up no trousers but accentuates your [pc.hips], bangles for your upper arms, wrists, and [pc.legs]. There isn’t an inch of your body that’s actually covered, but what use are clothes to an Omega who lives to be fucked? You smile and shake your head at the silly notion.");
	output("\n\nOnce more the priestess plugs you with the Totem, and explains to you that it is the will of the spirits that you, the temple Omega, carry it within you at all times. It is only to be removed if it will be replaced with the flesh of an Alpha, and afterwards it must be immediately replaced. You don’t know how you will acclimate to your libido being supercharged all hours of the day, but don’t have time to ponder that as your daily duties begin. Another acolyte leads the biggest Milodan you’ve ever seen, a mountain of muscle and fur, into the inner sanctum. This hunter was away for a week tracking a mighty target, and although his prey was felled he still needs to soothe his boiling blood.");
	output("\n\n<i>“That’s where you come in.”</i> Says the priestess, motioning the imposing tower of muscle over. She pops the Totem out of you just as he scoops you up and hilts himself in your [pc.ass]. The brutish barbarian settles for a breakneck pace from the start, and the priestess educates you in the first of the spirits’ axioms: hard work is holy work, and holy work is happy work. A haze of bliss fills your mind just as the flood of cum fills your ass, and you have to admit, you’re feeling pretty holy right now.");
	processTime((2*60*24)+rand(1440));
	for(var y:int = 0; y < 10;y++)
	{
		pc.orgasm();
	}
	badEnd();
}