//Male Milodan Barbarian
//By Wsan

//Unlike the picture, milodan on Uveto have white/blue/silver fur, kinda like snow leopards in pattern.
//Male and female Milodans share hunting and salvaging responsibilities. The males are more aggressive towards outsiders, deeming them a threat whereas the females, whilst fierce, are the friendlier face of the Milodans. Both male and female Milodan are dominant in bed and will gladly pull any dominant PC down a couple of notches if they win in battle. If the PC’s strength is high enough, then the tables turn and the fun and games really begin.

//Combat
//Pre-fite text
//Description of terrain goes here as prelude to encounter

//#Flags:
//MILO_MALE_CON_LOSSES	number of consecutive losses to the milodan male

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

public function milodanCombatPrep():Creature
{
	var milodan:Creature = new MilodanMale();
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(milodan);
	CombatManager.victoryScene(winVsMilodanMale);
	CombatManager.lossScene(lossSceneToMaleMilodan);
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
	}
	else
	{
		addDisabledButton(0,"Doggystyle","Doggystyle","You aren’t aroused enough for that.");
		addDisabledButton(1,"Vaginal Ride","Vaginal Ride","You aren’t aroused enough for that.");
		addDisabledButton(2,"Ride Anal","Ride Anal","You aren’t aroused enough for that.");
		addDisabledButton(3,"Taurssionary","Taurssionary","You aren’t aroused enough for that.");
		addDisabledButton(4,"Rimjob","Rimjob","You aren’t aroused enough for that.");
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
	pc.lust(1000);
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
	processTime(30);
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
	pc.lust(30);
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
		output(" , picking up a rhythm alarmingly quickly, railing your helpless form pronebone. When he finally finishes with you hours later, the edge taken off his libido by his romp with you in the snow, you’re too tired, too well-fucked to do much of anything besides leak jizz and whimper, your entire body now agonizingly sore from being pounded so brutally and cumming so many times. When he pulls a thick pelt over the two of you and begins to snore you make no protest, though a small whimper escapes your [pc.lips] before you drift into sweet, dreamless sleep.");
		if (pc.hasVagina())
		{
			output("\n\nYou try to escape, of course - more than once. Each time, your new alpha finds you in the snow, drags you back to his tent and spanks you like a disobedient child until your [pc.ass] is glowing red, until you can’t sit without whimpering in discomfort. Eventually, you realize it’s hopeless; he knows the terrain around the village too well - your only hope is that someone will come rescue you. They don’t though, and at some point during your first pregnancy ");
			if (pc.fertility() == 0) output(" after the fertility priestesses ‘cure’ you of your barren womb, ");
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