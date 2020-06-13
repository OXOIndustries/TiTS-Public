// Plantation Quest: Director’s Cut
// by Nonesuch

/*
Plans/Ideas

The special fruit rewards Darnock promised. Similar sort of thing to the mangoes, useful combat effects.
Lah in Gastigoth. Will need a generic ausar pregnancy since the program is notionally all about the breeding.
Hardlight panty stuff for Quinn.
Quinn wants an heir, and will ask the PC to participate in a mating ritual with 2 other zil males (idea being there’s no jealousy over who actually knocked her up). PC can go along with it or as female just participate.
If dick-having PC is indeed the jealous type, they can go off and prove they’re worthy of being the sole progenitor by beating all the other competitors. This will have the effect of making Quinn extremely horny for them.
*/


// Part 1: Darnock’s Rewards
public function thareManorPQApproach():void
{
	if(flags["THARE_MANOR_ENTERED"] < 3) flags["THARE_MANOR_ENTERED"] = 3;
	
	if((GetGameTimestamp() - flags["PQ_REWARDS_TIMESTAMP"]) >= 7200)
	{
		var fruit:String = "";
		var fruitList:Array = [];
		
		if(flags["PQ_REWARD_DISPASSION"] == undefined || flags["PQ_REWARD_PLUMPKIN"] == undefined || flags["PQ_REWARD_PEPRIKA"] == undefined)
		{
			if(flags["PQ_REWARD_DISPASSION"] == undefined) fruitList.push("dispassion");
			if(flags["PQ_REWARD_PLUMPKIN"] == undefined) fruitList.push("plumpkin");
			if(flags["PQ_REWARD_PEPRIKA"] == undefined) fruitList.push("peprika");
		}
		else fruitList = ["dispassion", "plumpkin", "peprika"];
		
		if(fruitList.length > 0) fruit = RandomInCollection(fruitList);
		
		// First
		// Triggered when PC [Enter]s Plantation >5 days after Quest completed. Happens regardless of Quest outcome as long as the Plantation is still standing.
		if(	(fruit == "dispassion" && flags["PQ_REWARD_DISPASSION"] == undefined)
		||	(fruit == "plumpkin" && flags["PQ_REWARD_PLUMPKIN"] == undefined)
		||	(fruit == "peprika" && flags["PQ_REWARD_PEPRIKA"] == undefined)
		) {
			output("\n\n<i>“Ah, my young friend!”</i> Darnock is beaming genially as he steps down the manor house steps. <i>“Am I ever pleased to see you! Come inside, right this instant. I have something I’d like to show you.”</i>");
			output("\n\nThe old human seems even more ebullient than usual, practically prancing through the synth-marble hallways to a small lab unit in the west wing. There, in an incubator on a white table, is a");
			switch(fruit)
			{
				case "dispassion": output(" nobbly blue-and-yellow striped fruit of some kind"); break;
				case "plumpkin": output(" fruit of some kind. Round, fat, light orange, almost donut-like"); break;
				case "peprika": output(" thin, dark-red vegetable pod of some kind, not dissimilar to a long chili bean"); break;
			}
			output(".");
			output("\n\n<i>“The, ah, fruits of a very extensive labor,”</i> Darnock says happily. <i>“Fully tested and ready for intragalactic consumption. We’re calling this one");
			switch(fruit)
			{
				case "dispassion": output(" Dispassion Fruit"); break;
				case "plumpkin": output(" Plumpkin"); break;
				case "peprika": output(" Peprika"); break;
			}
			output(".”</i> He taps a control on the desk. Two delicate robot knives unfold either side of the specimen, and cut off a small segment. <i>“Try it!”</i>");
			output("\n\nYou open the incubator and, slightly apprehensively, pop the thin slice into your mouth.");
			switch(fruit)
			{
				case "dispassion": output(" It’s cool-flavored, rather like watermelon with mellow, pear-like tones. Warmth seems to fade from your [pc.skin] as it slides down into your gut, and after a few moments of savoring it you’re left feeling as clear and sedate as a glass of water."); break;
				case "plumpkin": output(" Oof. This stuff is bursting with calories - you can practically feel your veins widening as you bite into its moist, bready flesh, its sweet juices bursting inside your mouth. You feel slightly giddy after swallowing it down."); break;
				case "peprika": output(" The flavor is salty and jerky-like, not at all the spiciness you were expecting. Rather moorish, though. You feel frisky a few moments after swallowing it, energy crawling underneath your [pc.skin], as if your flight-or-fuck instinct has just stepped up a few notches."); break;
			}
			output("\n\n<i>“Interesting aftertaste, isn’t it?”</i> The professor has been watching your reaction with a knowing grin. He plucks the rest of the fruit out of the incubator and hands it to you. <i>“So many possibilities, once we get into gene-splicing it and refining it for galactic distribution. We can only produce it on a small scale for now, here at the plantation, but soon - who knows? The Snugglé inspector was beside himself with excitement when he tried it!”</i>");
			output("\n\nHe leads you back into the dining room, where the traditional spread awaits.");
			output("\n\n<i>“We’ll have plenty other delicacies for you and the rest of the galaxy to try in due course, " + pc.mf("master", "miss") + " Steele,”</i> he says, settling himself down in his sitting chair with a satisfied sigh. <i>“You’ll have to pay if you wish to purchase in bulk, of course, but - oh, just seeing your young, healthy face about the place makes me feel generous. As long as everything here at Thare continues to proceed swimmingly, there’ll be plenty of free samples for all!”</i>");
			output("\n\n");
			
			processTime(4);
			
			// Proceed to standard meal talks. Add [Lah?] option
			eventQueue.push(thareManorMeal);
		}
		// Repeat
		// If >5 days since last random sample
		else
		{
			output("\n\n<i>“Our young friend returns!”</i> beams Professor Darnock, coming down the steps as you approach the palatial grandeur of the manor. <i>“Here. Catch!”</i> He casually tosses a Mhen’gan fruit over to you. <i>“Remember, young " + pc.mf("master", "miss") + " Steele: An alien fruit a day keeps the Joybot at bay. Are you here to buy something? Or perhaps you fancy keeping an old man company up on the veranda.”</i>");
			output("\n\n");
			
			processTime(1);
			
			eventQueue.push(thareManorPQMenu);
		}
		
		// Dispassion Fruit/Plumpkin/Peprika added to Inventory.
		plantationQuestRewardFruit(fruit);
	}
	else
	{
		output("\n\n<i>“Our young friend returns!”</i> beams Professor Darnock, coming down the steps as you approach the palatial grandeur of the manor. <i>“Are you here to buy something? Or perhaps you fancy keeping an old man company up on the veranda.”</i>");
		output("\n\n");
		
		processTime(1);
		
		thareManorPQMenu();
	}
}
public function plantationQuestRewardFruit(fruit:String = ""):void
{
	var fruitList:Array = [];
	
	switch(fruit)
	{
		case "dispassion":
			fruitList.push(new DispassionFruit());
			IncrementFlag("PQ_REWARD_DISPASSION");
			break;
		case "plumpkin":
			fruitList.push(new Plumpkin());
			IncrementFlag("PQ_REWARD_PLUMPKIN");
			break;
		case "peprika":
			fruitList.push(new Peprika());
			IncrementFlag("PQ_REWARD_PEPRIKA");
			break;
	}
	
	if(fruitList.length > 0)
	{
		itemCollect(fruitList);
		flags["PQ_REWARDS_TIMESTAMP"] = GetGameTimestamp();
	}
}

// [Buy] [Meal] [Leave]
public function thareManorPQMenu():void
{
	clearMenu();
	addButton(0, "Buy", thareManorPQBuy);
	addButton(1, "Meal", thareManorMeal);
	addButton(14, "Leave", thareManorPQLeave);
}
public function thareManorPQLeave():void 
{
	thareManorMenu(true);
}

// Buy
public function thareManorPQBuy():void
{
	chars["THAREDRONE"].keeperBuy = "Able ushers you around to a small warehouse to the rear of the mansion, where plexiglass containers full of the Plantation’s produce are stacked. A small exchange drone floats nearby; entering your order and touching your credit stick to its screen automatically dispenses what you’re after.\n";
	
	chars["THAREDRONE"].inventory = [];
	
	// [D. Fruit] [Plumpkin] [Peprika] [D. Fruit x 5] [Plumpkin x 5] [Capsirun x 5]
	if(flags["PQ_REWARD_DISPASSION"] != undefined) chars["THAREDRONE"].inventory.push(new DispassionFruit());
	if(flags["PQ_REWARD_PLUMPKIN"] != undefined) chars["THAREDRONE"].inventory.push(new Plumpkin());
	if(flags["PQ_REWARD_PEPRIKA"] != undefined) chars["THAREDRONE"].inventory.push(new Peprika());
	
	shopkeep = chars["THAREDRONE"];
	buyItem();
	
	showBust("ABLE");
	author("Nonesuch");
}


// Part 2: Dog in a Box
// Available to vagina-havers only for now
public function rkLahImprisoned():Boolean
{
	return (flags["PQ_SECURED_LAH"] == 2 && flags["LAH_TO_GASTIGOTH"] != undefined && (GetGameTimestamp() - flags["LAH_TO_GASTIGOTH"]) > 4320);
}
public function lahPrisonRoom():void
{
	clearOutput();
	showLah(true);
	author("Nonesuch");
	
	if(flags["LAH_PRISONED"] == undefined)
	{
		output("Inside the cell, strapped securely to a seat, is one naked, fierce-eyed, dusky ausar, glowering at you. His thick, six inch cock fiercely erect, beading and practically glowing red from the aphrodisiacs it’s been pumped full of. He looks less pissed off than you envisaged. You remember that twitchy stick figure you met in the jungle, who jumped and snarled and bit at shadows cast in his own mind; that you tamed and drove back to his master, tail between his legs. If anything, prison looks like it’s been relatively kind to RK Lah. He’s thickened out a bit from his fakir-like Mhen’gan form, and no longer looks like he’s ready to jump off the rails at any second.");
		output("\n\n<i>“I knew - I knew it would be you,”</i> he growls, flexing against the bonds that hold his hands to the back of the chair. <i>“Who else would care? Who else is enough of a sadist? Not Darnock. Too many people to pay off to protect his sanctity.”</i> He shrugs, a ripple of motion along his lean, hard body. His red-hot cock bobs, a single drop of pre forming at the tip. <i>“Go on, have your fun. Do whatever you want. Give some kids to a dead-eyed corpo-merc, why not? My - my life can hardly get any weirder.”</i>");
		output("\n\nYou notice, on the table beside the door, there’s a remote control. The single button on it glows yellow. The inner strip of the cuffs which bind Lah to his seat glow the same color.");
	}
	else
	{
		output("<i>“You again?”</i> Lah growls, ears rising and flopping as you [pc.move] through the cell door. <i>“I thought you got what you wanted out of me.”</i>");
		if(pc.hasPregnancyOfType("LahPregnancy") && pc.bellyRating() >= 30) output(" His eyes come to rest on your [pc.belly]. <i>“In fact, I’m sure you did.”</i>");
		output("\n\nAs ever, the sandy, rakish ausar is naked and firmly cuffed to a chair, his red rocket of a dick erect and practically glowing with the fertility and aphrodisiac drugs he’s been ‘processed’ with. He awaits whatever you’ve got in store for him with a scowl that cannot conceal the extreme lust he’s currently experiencing.");
		output("\n\nThe remote control on the table beside the door catches your eye with the beady, yellow glow of its button.");
	}
	output("\n\n");
	
	processTime(1);
	
	// [Ask] [Ride Him] [Power Bottom]
	clearMenu();
	
	addButton(0, "Ask", lahPrisonRoomAsk, undefined, "Ask", "You aren’t really here to chat, but a how-do-you-do never hurts.");
	
	if(pc.hasVagina())
	{
		addButton(1, "Ride Him", lahPrisonSex, "ride him", "Ride Him", "Red rocket boy, red rocket.");
		addButton(2, "PowerBottom", lahPrisonSex, "power bottom", "Power Bottom", "Deactivate those cuffs, and see if you can’t... rouse him.");
	}
	else
	{
		addDisabledButton(1, "Ride Him", "Ride Him", "You need a vagina for this!");
		addDisabledButton(2, "PowerBottom", "Power Bottom", "You need a vagina for this!");
	}
	
	addButton(14, "Never Mind", backOuttaPrisonVisit);
}
public function lahPrisonRoomAsk():void
{
	clearOutput();
	showLah(true);
	author("Nonesuch");
	
	output("Lah’s ears rear and flop in faint surprise when you lean against the table and ask him how he’s doing.");
	output("\n\n<i>“Honestly? This is - this is better than the plantation,”</i> he replies. He laughs sardonically, jerking his head at his current situation. <i>“I know, right? But they’ve got me in the political prisoners wing. I’ve met some reeeaally interesting people. Way better than - better than busting my ass in a banana grove alongside a bunch of petty grifters and traffickers. And because I signed up for this, I’ve got some access to the extranet. I’m kind of a hero in the circles I used to hang out in, I guess. An inspiration for native-led insurrection. My last blog post got about 300 million hits.”</i>");
	output("\n\nHe pauses, staring at you.");
	output("\n\n<i>“To be - to be honest, I thought it was an easy deal to make. Corporate psychopaths just want to fuck and degrade pirate girls, don’t they? Who was going to want to do anything with some scrawny male anarchist? I forgot about you. I forgot how mercenaries think.”</i> He shifts around on his chair, muscles tensing in his shoulders. <i>“So - so are you going to fuck me, or what? The stuff they pump you full of really puts you on edge, not going to lie.”</i>");
	output("\n\n");
	
	// [Ride Him] [Power Bottom]
	addDisabledButton(0, "Ask");
}
public function lahPrisonSex(response:String):void
{
	clearOutput();
	showLah(true);
	author("Nonesuch");
	
	var vIdx:int = -1;
	var hasLahPregnancy:Boolean = (pc.hasPregnancyOfType("LahPregnancy") && pc.bellyRating() >= 30);
	
	switch(response)
	{
		// Ride Him
		case "ride him":
			vIdx = pc.findEmptyPregnancySlot(1);
			if(vIdx < 0) vIdx = pc.cuntThatFits(chars["LAH"].cockVolume(0));
			if(vIdx < 0) vIdx = rand(pc.vaginas.length);
			
			output("You smirk and admire the helpless ausar, taking your time stepping out of your [pc.gear] as you do. This wannabe rabble-rouser, with all his wild, revolutionary fervor, who made you climb a One-damned waterfall in order to stop him, now naked and strapped to a chair, nothing but a pup-shooter to do with as you please. He can’t do anything but watch you undress, his lean chest rising and falling, his red, pointed dick so hard that it looks like it might lift off.");
			if(pc.exhibitionism() >= 66) output(" You put plenty of bounce and wiggle into it, knowing full well there’ll be cameras in here, one probably trained on your [pc.ass] right now. Let them watch. Let them wish it was they who were tied up and at your mercy.");
			output("\n\nYou take your time though, relishing every second, knowing each is an agony of arousal for him. You stand over him, holding his restless eyes as you stick two fingers into your [pc.vagina " + vIdx + "], giving yourself a swirl, pleasant sensation and latent desire taking hold down there, [pc.femcum] moistening the tips. You climb onto his hard, hot thighs and press those self-same fingers against his nose, smearing those sensitive nostrils so all he can smell is your arousal. Lah groans woozily, eyes rolling back, no longer able to resolutely hold your gaze; a small droplet of pre works its way down his bulging doggie dick. Wonderful.");
			output("\n\nYou take hold of the back of the chair and push the mound of your [pc.vagina " + vIdx + "] against the thick bulge of his knot, lifting yourself up the length of his shaft... and then back down, up and down with little lifts of your [pc.thighs], exulting in the hot rub of his dick over your [pc.clit " + vIdx + "], pleasuring yourself whilst agonizing him with the touch of your pussy until your wetness is " + (!pc.isSquirter(vIdx) ? "seeping down your lips" : "drooling down onto the seat of the chair") + ".");
			output("\n\n<i>“Please,”</i> he grunts, all snark and anger in his voice replaced by urgent, all-conquering need. You trace the line of his angular jaw as you finally raise yourself up, position your opening so that you can feel that reddened, beading point poking into it, and then sink yourself down, groaning with delight as you fill more and more of your tender, slick insides with hot, thick dog-meat.");
			
			pc.cuntChange(vIdx, chars["LAH"].cockVolume(0));
			
			output("\n\nLah shudders and writhes underneath of you, uttering small, hoarse barks, using what little leverage is available to him to hammer his thin, muscular thighs into you the second you properly envelope him; you feel goopy liquid warming your pussy, oozing downwards to fill it with that filthily pleasurable sensation. Chest heaving, the redolent relief on the ausar’s face is there only for a few moments. You savor the dawning realization on his face, tightening your grip on his jaw as you do.");
			output("\n\n<i>“Oh dear,”</i> you coo, slowly moving your [pc.hips], making his still-very-much erect cock dig into your walls, little shoots of sensation firing off into your core, <i>“did the doggie think he could quickly jizz and get out of this straight away? Disappoint me, maybe? I think those drugs are gonna keep you hard regardless of how much you’ve spunked. Which is good, because--”</i> you emphasize your words by tightening your hips around his waist and thrusting into him firmly, making him spasm and groan. <i>“I’m gonna wring - every - last - drop - outta you.”</i>");
			output("\n\nCum oozes out of your [pc.vagina " + vIdx + "] as you continue to pump, working that stern, thick dick with intent flexes of your muscles, your pleasure ratcheting up with each forward jerk");
			if(pc.biggestTitSize() >= 3)
			{
				output(", bumping your boobs");
				if(hasLahPregnancy) output(" and baby bump");
			}
			output(" into the insensate ex-terrorist. For you, that instant orgasm of his is a boon - a generous load of lubricant which allows you to easily impale yourself right down on his girth, so that his bulging knot is bumping against your entrance and [pc.eachClit]. For Lah, though, it must be fairly agonizing. His dick must ache like a sore thumb, at the same time as pleasure and arousal inundate his senses, every time you bend it in your soaking depths.");
			output("\n\n<i>“How can you even think of cumming without getting your knot inside me?”</i> you husk, seizing his hair, intense arousal pulsing through you as you clutch the back of the chair hard and really ride him, [pc.ass] bouncing up and down in his tawny lap. <i>“What kind of stud are you?”</i>");
			output("\n\n<i>“One... damn...”</i> he groans, head thrown back, skin glowing with sweat underneath the harsh strip lighting. That hard, tough ball of heat sits stuck to the entrance of your sopping, leaking cunt, stretching it wide... and then in a small explosion sensation it’s inside, stopping it like a cork, and immediately Lah cums again, his hips jackhammering into you reactively, spilling another hot load of cum out into your [pc.vagina " + vIdx + "]. The giddy dual feeling sends you over the edge, ecstatic contractions practically ordering you to ride that dick for all you’re worth, clenching up around it so you can knead every last fertile drop out of your conquest.");
			if(pc.vaginaCanSuck(vIdx) || pc.vaginaHasFeelers(vIdx))
			{
				output(" The");
				if(pc.vaginaHasFeelers(vIdx))
				{
					output(" wonderful cilia");
				}
				else
				{
					output(" extra muscles");
					if(pc.isTreated() || pc.vaginas[vIdx].type == GLOBAL.TYPE_GABILANI) output(" that being " + (pc.vaginas[vIdx].type == GLOBAL.TYPE_GABILANI ? "gabilani" : "Treated") + " lend you");
				}
				output(" help: tender, insidious strokes that force the captive dick-flesh to give everything it has, at the same time as rewarding your breeding with tingles of sensual delight.");
			}
			output("\n\nYou keep going, setting your teeth in his shoulder and clenching down with every brilliant pulse, not a single drop of fertile ausar cum making it past your stuffed entrance, thrusting again and again into your wiry, enjoyably twitchy slave. He can’t wilt, after all; he may as well have a dildo strapped to his groin, he’s got that much aphro flowing in his veins. His angular, elegant features are rolled back, exhalations warming the ceiling in great gouts, by the time you’re coming down, still impaled deep on his rod.");
			output("\n\n<i>“How you doing, boy?”</i> you purr, touching the point of Lah’s chin, admiring the teeth-marks you’ve left in his shoulder. Need to leave more of those. Need for his block-mates to see what you’ve done to him. <i>“You’ve got one more in you, don’t you?”</i> You begin to move your [pc.ass] again, working that hard red rocket within your liquid, tender insides once more. <i>“I think you do. I think you do.”</i>");
			output("\n\nYou go at him slowly now, almost tenderly, little shucks of your [pc.hips] on his lap, simmering in the pleasure of rolling and squeezing his hot, obdurate dick, the tenderness orgasm has given you intensifying the sensation it gives. Even if he wanted to, the ausar couldn’t get away from you now; the fleshy ball of his knot is wedged inside of you, intensifying that wonderful feeling of your [pc.vagina " + vIdx + "] being filled from top to bottom.");
			if(hasLahPregnancy) output(" Your [pc.belly] may be swollen with pregnancy now, but there’s still a deep desire to milk your captive cum-pump for everything he’s got; remind him of his duty, who owns him, who can cuff him to this chair and have their way with him whenever [pc.he] wants.");
			else output(" There’s a deep desire to milk your captive cum-pump for everything he’s got, bathe your womb utterly in fertile semen so that the spark catching is assured, put this wayward fuck boy to the use he was put in this galaxy for, and you let those wonderful urges drive you, tightening up your inner muscles and coaxing him on, all the while rewarding yourself with the blissful pleasure coursing right through your packed, soaked pussy.");
			output("\n\nIntensifying clenches gripping your loins eventually push you to go at Lah harder again. He can do nothing but spasm against his bonds, groans and then barks forced past his thin lips as you set your teeth into his other shoulder, biting down hard as you cum again, pumping your wonderful, tortuous cock-trap around him, tightening your [pc.thighs] around his waist as hard as you can. That does it. You crow with triumph as you feel his cock swell and ooze out another fresh packet of warm, thick cum, throbbing fruitlessly after one or two pulses, his inflamed knot finally deflating. As threatened, you’ve wrung him like a damp cloth.");
			output("\n\nYou have to rest for a while on top of Lah, wait for the knot to shrink enough to disengage from him, but that’s fine - the feeling of his dick still thrust deep within your [pc.vagina " + vIdx + "], the steamy, slick satisfaction of post-coitus, the way you can flick and play with his long hair and sensitive ears all you want - it’s a very enjoyable way to spend a couple of minutes.");
			if(!pc.isPregnant(vIdx) && pc.fertility() > 0) output(" And, of course, the fact you don’t lose any cum needlessly splashed away makes insemination, a belly full of pups all of your own, almost certain. You spread your fingers over your own [pc.belly], imagining, almost gloating.");
			output(" The lanky ausar takes it all in a drug and exhaustion-induced haze, still unable to summon any spikiness or angry retorts after what you’ve done with him.");
			output("\n\nThe ausar does manage to rouse himself a bit, blearily examine the scratch and bite marks you’ve left on his taut, tawny frame, not to mention the mess of canine cum and [pc.femcum] slathered across his groin, once you’re briskly putting your [pc.gear] back on.");
			output("\n\n<i>“Better than not having extranet access,”</i> you hear him mumble, as you leave.");
			output("\n\n");
			
			pc.loadInCunt(chars["LAH"], vIdx);
			pc.orgasm();
			
			IncrementFlag("LAH_SEX_RIDE_HIM");
			IncrementFlag("LAH_PRISONED");
			break;
		// Power Bottom
		case "power bottom":
			vIdx = pc.findEmptyPregnancySlot(1);
			if(vIdx < 0) vIdx = pc.cuntThatFits(chars["LAH"].cockVolume(0));
			if(vIdx < 0) vIdx = rand(pc.vaginas.length);
			
			output("With a careless air, you pick up the remote, point it at him and press the button. The cuffs clang onto the white, synth-ceramic floor. Lah touches his wrists, looking at you suspiciously from underneath his mop of sandy hair.");
			if(flags["LAH_SEX_POWER_BOTTOM"] == undefined)
			{
				output("\n\n<i>“If you’re trying to - to trick me into attacking you, it’s not going to work,”</i> he says. Even putting aside his helplessly erect cock, the chemically-induced arousal radiates off of the lanky ausar: his skin is reddened, and barely-contained animal aggression shakes the bars of his tendons and hard, slim muscles. You get a little thrill in your gut as the naked ausar stands suddenly, shoving the chair to one side. <i>“We screw, and then you leave me alone. That’s the deal.”</i>");
				output("\n\n<i>“Ooh, really?”</i> you smirk. You lean back on the table");
				if(pc.hasArmor() && !pc.isCrotchExposedByArmor() && pc.hasLowerGarment()) output(", undoing just a little of your [pc.lowerGarmentOuter]... just enough to give a peak of your [pc.lowerGarment]");
				output(". <i>“The way I heard it, I get to do whatever I want with you.”</i> You bite your lip, letting your hand trail up to your [pc.chest], fingers trailing over " + indefiniteArticle(pc.nippleDescript()) + ", arousal beginning to bloom within you. You could be the clumsiest tease in the world and it would be having an effect on Lah right now. His clawed hands clench instinctively, fiery eyes fixed on the movement of your hand. You think he just needs a little bit of a push... <i>“To be honest, it’s the reason I decided to turn you in. So I’ve got a nice, energetic bitch boy in a box, there whenever I want to play.”</i>");
				output("\n\n<i>“Yeah, it was fucking nothing to you,”</i> he snarls. <i>“I know who you are, you didn’t - can’t even say you needed the money. It was just another adventure, another SAFARI - it was my fucking life, you over-privileged, store-bought, arrogant little - AARGH!”</i>");
			}
			else
			{
				output("\n\n<i>“You’re doing the thing again, aren’t you,”</i> he growls. Even putting aside his helplessly erect cock, the chemically-induced arousal radiates off of the lanky ausar: his skin is reddened, and barely-contained animal aggression shakes the bars of his tendons and hard, slim muscles. You get a little thrill in your gut as the naked ausar stands suddenly, shoving the chair to one side. <i>“This is how you get your kicks? Put activists in jail so you can antagonize them into hate-fucking you?”</i>");
				output("\n\n<i>“Absolutely!”</i> you beam. You letting your hand trail up to your [pc.chest], fingers trailing over " + indefiniteArticle(pc.nippleDescript()) + ", arousal beginning to bloom within you. You could be the clumsiest tease in the world and it would be having an effect on Lah right now. His clawed hands clench instinctively, fiery eyes fixed on the movement of your hand. He just needs a little push, as always. <i>“Doesn’t it make you mad? How rich and privileged I am, the way I treat the whole galaxy as a safari? And you’re stuck in here for years because of me--”</i>");
			}
			output("\n\nIn a wordless rage he lunges at you,");
			if(pc.isCrotchExposed()) output(" catching both of your wrists in his hot hands and slamming them down on the table, the weight of his wiry frame thrusting you down onto its surface, the red baton of his cock batting against [pc.eachVagina].");
			else output(" catches one of your wrists in a hot hand and slams it down onto the table, the weight of his wiry frame thrusting you down onto its surface. With the other he shoves down your [pc.lowerGarments], exposing [pc.eachVagina] to the air. The red baton of his cock bats against " + (((pc.hasArmor() && !pc.hasLowerGarment()) || (pc.hasArmor() && !pc.hasLowerGarment())) ? "it" : "them") + " as he pushes himself onto you.");
			output("\n\n<i>“Go on then,”</i> you growl, opening your [pc.thighs] and glaring straight into his wild eyes. <i>“Show me what it means to you.”</i>");
			output("\n\nPerhaps your incitement would be obvious in other circumstances, but Lah is pumped full of aphrodisiacs, and was never the most stable individual in the first place. He shoves two digits straight into your [pc.vagina " + vIdx + "], roughly fingering you, and you react to it in a primal way that no gentle, loving caress ever could, your cunt instantly watering itself at the intimation of a hard, no-holds-barred fucking. You pull yourself out of his grip to snatch at the maddened ausar’s hair, pulling it downwards, spurring him on; he snarls, slaps you across the face to make you let go, and in the next instant pulls his curling fingers out in order to ram his pointed dog dick home, stretching and filling you right up to the bumpy knot in a single fevered thrust.");
			
			pc.cuntChange(vIdx, chars["LAH"].cockVolume(0));
			
			output("\n\nYour [pc.vagina " + vIdx + "] practically foams to the red hot sensation of being taken so roughly");
			if(pc.hasCock()) output(", [pc.eachCock] hardening in sympathy, flapping against your [pc.belly]");
			output(".");
			if(pc.isBiped()) output(" You wrap your [pc.thighs] around his hard, narrow waist, [pc.feet] bumping against his back, urging his dick further in with violent thrusts.");
			else output(" You urge his dick further in with violent thrusts of your [pc.thighs].");
			output(" In response the ausar hammers it home with one fervid pump after another, his hot, sweaty weight pushing you down as his meat digs into your wet walls, one pulse of intense pleasure after another.");
			output("\n\nYou cum suddenly, just a shockwave of ecstasy emanating out of your convulsing pussy, forcing a wordless sound out of your mouth; you snatch at Lah’s rearing back as he continues to plough you heedlessly, slamming himself between your opened thighs, leaving deep scratch marks in his livid flesh. He responds by grabbing at your hands again, pinning you down to the hard surface of the table so he can go on firmly thrusting himself home into your [pc.vagina " + vIdx + "]");
			if(pc.isSquirter()) output(", slapping copious amounts of [pc.femcum] across his tawny skin and your [pc.skinFurScales]");
			output(". You writhe and struggle");
			if(pc.physique() >= 90) output(" (although not TOO much; you could easily overpower the skinny little bitch if you really wanted to)");
			output(", forcing him to keep fighting you down, making the weaselly struggle-fuck all the more electric.");
			output("\n\nYou bite your [pc.lips] as Lah forces his bulging knot in, crying out at the intense sensation of your pussy lips being stretched out by that tough ball, blotting the entrance out, the taut canvas of his gut molds into your [pc.belly], sweat swirling into sweat as he sets his sharp teeth into your shoulder and orgasms explosively, the motion of his jackhammering hips carrying all the way through you as hot cum blooms deep inside you. Your [pc.vagina " + vIdx + "] contracts up again in sensational climax, coaxing him on with flex after flex of your soft, wet walls around that pulsating, pointed cock, thrusting deep into your most sensitive spots.");
			output("\n\n<i>“Take it - take it all - you <i>bitch!</i>”</i> Lah growls savagely into the flesh of your shoulder, hot, humid breath ghosting down your [pc.skinFurScales]. You keep bucking against him, screaming with delirious sensuality of it all, lost in the animalistic pleasure of being savagely " + (!pc.isPregnant(vIdx) ? "bred" : "fucked") + " like this. The ausar cums far more copiously than you’d imagine him capable of - undoubtedly driven on by the concentrated aphro drugs he’s on - and you feel utterly packed by the time he slows down in an exhausted haze, thick, hot doggy cum squirting out around the throbbing ball of dick flesh corking your entrance.");
			output("\n\n<i>“I guess I understand how you feel,”</i> you grin at him, basking in sweaty post-coital bliss. You’re still conjoined, of course - that thing’s going to take some minutes to deflate.");
			if(!pc.isPregnant(vIdx) && pc.fertility() > 0) output(" In the meantime your womb is swimming in fertile ausar seed with nowhere else to go... practically ensuring you’re going to kindle from this feral breeding session.");
			output(" <i>“Could do with another reminder, though.”</i>");
			output("\n\n<i>“I could just kill you,”</i> Lah replies levelly. His sharp claws nip the [pc.skin] of your wrists. <i>“Wouldn’t - wouldn’t put all that much more on my sentence. You ever think about that?”</i>");
			output("\n\nYou indicate with your eyes your other hand, in which you’ve had the remote to his cuffs clutched the entire time. One click, and those anti-grav babies would be snapping back around his wrist and shoving him back down into the chair.");
			output("\n\n<i>“Anyway,”</i> you say, as his knot comes unstuck at last, and in a sluggish flood of semen he withdraws and lets you get back up, <i>“don’t pretend writing blog posts is anywhere near as fun as fucking me silly.”</i>");
			output("\n\nHe snorts derisively, flinging his naked, angular form back down onto his chair without answering. That’s no denial, though. You’re grinning as you put your [pc.gear] back on, feeling enjoyably tingly and achy as the cell door hisses shut behind you.");
			output("\n\n");
			
			pc.loadInCunt(chars["LAH"], vIdx);
			pc.orgasm();
			
			IncrementFlag("LAH_SEX_POWER_BOTTOM");
			IncrementFlag("LAH_PRISONED");
			break;
	}
	
	processTime(35 + rand(11));
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Lah Pregnancy Birth
public function lahPregnancyEnds(babyList:Array):void
{
	clearOutput();
	author("Nonesuch");
	showBust("");
	showName("\nBIRTHING!");
	
	var se:StorageClass = pc.getStatusEffect("Lah Pregnancy Ends");
	
	// Failsafe
	if(se == null)
	{
		output("ERROR: 'Lah Pregnancy Ends' Status Effect does not exist.");
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	var numChildren:int = se.value1;
	var bRatingContrib:int = se.value2;
	var pregSlot:int = se.value3;
	var inShip:Boolean = InShipInterior();
	var inPublic:Boolean = (InPublicSpace() || rooms[currentLocation].planet.toLowerCase().indexOf("station") != -1 || rooms[currentLocation].hasFlag(GLOBAL.INDOOR));
	
	output("Pain in your gut bends you over and fluid spills");
	if(pc.hasLowerGarment()) output(" into your [pc.lowerUndergarment]");
	if(inShip) output(" onto the deck");
	else output(" onto the ground");
	output(". Alarm grips you as you feel your cervix dilate. With as much calm as you can muster, you consider the best course of action.");
	if(inShip)
	{
		output("\n\nAs quickly as you can, you waddle into your room, switch the auto-medkit on in the bathroom, carefully place yourself on the bed");
		if(!pc.isNude()) output(", rip off your [pc.gear]");
		output(" and spread your [pc.thighs], biological imperative virtually ordering you what to do.");
	}
	else if(inPublic) output("\n\nAs quickly as you can, you waddle into the nearest restroom, grab the medkit drone off the wall (frontier bathrooms are thankfully readily equipped for this sort of thing), lock yourself in a cubicle and spread your [pc.thighs], biological imperative virtually ordering you what to do.");
	else if(rooms[currentLocation].hasFlag(GLOBAL.HAZARD)) output("\n\nGroaning at the timing, you shed your [pc.gear] and position yourself the best you can in the inhospitable and non-hospital-able terrain. The wish that you’d stayed somewhere indoors and safe hums through your thoughts like a mosquito, but there’s no helping it now -- you’ll have to deliver on your own.");
	output("\n\n");
	if(inShip || inPublic) output("The medkit drone monitors your pulse and places a large sheet beneath your thighs, instructing you to bear down rhythmically with soft, wordless beeps. ");
	output("Spasms wrack your pregnant body for the next hour, and your mind almost shuts down from the pain, operating on biological autopilot. There’s no relief when the first baby finally emerges via one gigantic clench, wailing heartily, none at all - because you know, from the weight and wriggling in your womb, that that’s simply one of two.");
	if(inShip || inPublic) output(" The drone hovers down, snipping the umbilical cord and cradling the child to one side whilst you grit your teeth and bear down again.");
	else output(" You grit your teeth and bear down again.");
	output("\n\nAt long last, in a sweaty daze of utter exhaustion, you’re looking down at your two, tiny children, curled up in your arms " + (!pc.isLactating() ? "and blinking suspiciously at the world they’ve found themselves in" : "nursing hungrily on your [pc.boobs]") + ". If you didn’t already know from the fact they’re twins, what they are is obvious from their floppy, isosceles ears and short, fluffy tails, twitching spasmodically as they " + (!pc.isLactating() ? "gaze around" : "feed on their mother’s milk") + ". Half-ausar puppies!");
	if(babyList[0].NumMale + babyList[1].NumMale >= 2) output(" They’re both boys, their facial features a mirror image of each other.");
	else if(babyList[0].NumMale + babyList[1].NumMale <= 0) output(" They’re both girls, their facial features a mirror image of each other.");
	else output(" One is a boy, the other is a girl.");
	if(babyList[0].skinTone == "bronzed" && babyList[1].skinTone == "bronzed") output(" They both have their father’s coloration - tawny skin and the barest beginnings of sandy fur on their heads and tails.");
	else if(babyList[0].skinTone == babyList[1].skinTone) output(" They both have " + babyList[0].skinTone + " skin and the barest beginnings of " + babyList[0].furColor + " fur on their heads and tails.");
	else if(babyList[0].skinTone == "bronzed") output(" One has " + (babyList[0].NumMale > 0 ? "his" : "her") + " father’s coloration - tawny skin and sandy fur - and the other has " + babyList[1].skinTone + " skin and " + babyList[1].furColor + " fur.");
	else if(babyList[1].skinTone == "bronzed") output(" One has " + (babyList[1].NumMale > 0 ? "his" : "her") + " father’s coloration - tawny skin and sandy fur - and the other has " + babyList[0].skinTone + " skin and " + babyList[0].furColor + " fur.");
	else output(" One has " + babyList[0].skinTone + " skin and " + babyList[0].furColor + " fur, and the other has " + babyList[1].skinTone + " skin and " + babyList[1].furColor + " fur.");
	output("\n\nYou spend a little time with them, cleaning them and playing with their cute pointed toes and brushing their nascent fur, drawing little whinnies and whines out of them, tiny paw-hands touching your face. Eventually, though, reality intrudes. With a heavy heart, you call up the incubation drone, which arrives altogether too fast, and carefully load the pair of them up. You watch the shuttle disappear, comforting yourself with the knowledge that you’ll be able to see them again soon at the Nursery.");
	output("\n\n");
	
	// Remove reflex modifier
	pc.removeStatusEffect("Lah Pregnancy Ends");
	pc.removeStatusEffect("Lah Pregnancy Reflex Mod");
	
	processTime(180 * rand(61));
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}


// Part 3: Further Quinnterest

// Handmaiden Threesome
// Trigger:
// PC has a dick < 12.5 inches
// Libido > 30%
// PC has done the ‘Every Hole’ scene with her in the last 24 hours, and chooses Sex again
public function showQuinnMaidens():void
{
	//showBust("FETCH", "CARRY");
	showBust("FETCH_AND_CARRY");
	showName("FETCH &\nCARRY");
}
public function quinnHandmaidenThreesomeAvailable(mommy:Boolean = false):Boolean
{
	return ( (pc.hasCock() && pc.smallestCockLength() < 12.5) && pc.libido() >= 30 && ((flags["QUINN_EVERY_HOLED"] != undefined && GetGameTimestamp() - flags["QUINN_EVERY_HOLED"] < 1440) || (mommy && flags["QUINN_MAIDENS_SEXED"] != undefined)) );
}
public function quinnHandmaidenThreesome(args:Array):void
{
	clearOutput();
	author("Nonesuch");
	clearMenu();
	
	var response:String = args[0];
	var cIdx:int = (args.length > 1 ? args[1] : -1);
	var vIdx:int = (args.length > 2 ? args[2] : -1);
	var cIdx2:int = (args.length > 3 ? args[3] : -1);
	var cIdx3:int = (args.length > 4 ? args[4] : -1);
	var cumQ:Number = (args.length > 5 ? args[5] : 0);
	var i:int = 0;
	
	switch(response)
	{
		case "intro":
			showBust(quinnBustDisplay(), "FETCH_AND_CARRY");
			showName("\nQUINN");
			
			output("<i>“Again?”</i> Quinn arches an eyebrow at you, something between exasperation and amusement pulling at the corner of her mouth. <i>“How are you not spent after how it went last time? No, it will not do,”</i> she goes on, chin up, lips thinned. <i>“A Quinn cannot be spending all her time seeing to your unnatural, star-born lusts. It’s unseemly, not to mention exhausting.”</i>");
			output("\n\nYour spirits sink... right up until Quinn claps once, and calls <i>“Handmaidens! See to my champion, will you? [pc.He] is being restless.”</i>");
			output("\n\nThe leader’s two young maids hurry over; they eye you up smirkingly, whispering in each other’s ears.");
			output("\n\n<i>“We were going to bathe you, our Quinn,”</i> says one saucily. <i>“Are we to do this instead?”</i>");
			output("\n\n<i>“Yes, yes,”</i> the zil leader says, putting her hands on your shoulders and pushing you towards them. <i>“Don’t come back until you’ve thoroughly exhausted [pc.him]. And, warrior...”</i> Her sweet scent tickles your nose as she breathes into your ear. <i>“...kindle them if you can, won’t you? They grow restless themselves. Restless handmaidens mean rebellion. Handmaidens with round bellies: not so restless. You will help your Quinn.”</i>");
			output("\n\nShe’s a born matriarch, alright. Still: you eye up the maidens’ long, gleaming curves, their smiling, youthful faces, and breathe in their honeyed smell as they wrap their arms around you. Yeah. You can help your Quinn.");
						
			processTime(3);
			// +Lust
			pc.changeLust(35);
			output("\n\n");

			addButton(0, "Next", quinnHandmaidenThreesome, ["next"]);
			break;
		case "mommy":
			showBust(quinnBustDisplay(), "FETCH_AND_CARRY");
			showName("\nQUINN");
			
			output("Quinn beckons to one of her handmaidens, who hastens over to take " + quinnBabyName() + " out of her hands. She then rises and silently heads up the hill, her bobbing abdomen and bottom beckoning you to follow.");
						
			processTime(3);
			// +Lust
			pc.changeLust(35);

			output("\n\n");
			
			// Sex proceeds as normal from here
			addButton(0, "Next", sexWithQuinnOmnigenderWHYYYY);
			break;
		case "maiden":
			showBust(quinnBustDisplay(), "FETCH_AND_CARRY");
			showName("\nQUINN");
			
			output("<i>“No,”</i> Quinn replies, regarding you with tired golden eyes, <i>“I need - I need to rest. My handmaidens will attend you.”</i>");
			// +Lust
			pc.changeLust(35);	
			processTime(3);
			
			output("\n\n");
			
			
			addButton(0, "Handmaidens", quinnHandmaidenThreesome, ["next"]);
			addButton(14, "Back", goBackToQuinnMain);
			break;
		case "next":
			showQuinnMaidens();
			
			output("<i>“So generous of our Quinn to let us have the star-person champion to ourselves for a while,”</i> says the taller, lither, saucy one, giving your [pc.ass] an inquiring squeeze.");
			output("\n\n<i>“Is it true what they say of you?”</i> asks the shorter, buxom, bubbly one. <i>“That you are a " + pc.mf("Kin", "Quinn") + " of a whole star, and own a zpirit that you captured in your bracelet that can answer any question?”</i>");
			output("\n\nEnergetically slinging comments, questions and laughter back and forth, they lead you into the pine-perfumed darkness of a yurt. It’s similarly sized to Quinn’s but much more utilitarian in nature: cramped with wicker tools, washing gear, tools and weapons, anything a zil leader might desire at a moment’s notice. The pair’s straw-stuffed bed is wedged in the corner behind all of this junk. For all its primitive nature, it’s a rather cosy nook that it’s pleasantness itself to impatiently tear your [pc.gear] off in and curl up with two lissom wasp-girls, breathe in their sugary, pheromonal perfume, feel their thin hands trail down your [pc.skinFurScales], allowing your ever-present lust to overwhelm your thoughts, replaced with nothing but the desire to fuck, fondle and feast upon as much scented, supple zil-flesh as you possibly can.");
			output("\n\nThe taller one’s chestplate is a whispering sigh as it slides apart, displaying her pert, neat breasts. You descend upon them hungrily, licking and biting at her penny-sized nipples until they stand out like black buds, and with powerful draws of your mouth you can taste droplets of her giddying, sweet honey. Your hand tightens on the shoulder of the other as you feel her smooth, chitinous fingers reach down between your [pc.thighs] and explore your [pc.groin] with interest.");
			output("\n\n");
			
			processTime(5);
			
			if(flags["QUINN_MAIDENS_MET"] == undefined) flags["QUINN_MAIDENS_MET"] = 1;
			
			// If PC meets multiple requirements, select at random
			var scene:String = "error";
			var sceneList:Array = [];
			var cocksThatFit:Array = [];
			
			for(i = 0; i < pc.cocks.length; i++)
			{
				if(pc.cocks[i].cLength() < 12.5) cocksThatFit.push(i);
			}
			if(pc.cocks.length >= 1 && cocksThatFit.length > 0)
			{
				cIdx = cocksThatFit[rand(cocksThatFit.length)];
				cocksThatFit.splice(cocksThatFit.indexOf(cIdx), 1);
			}
			if(pc.cocks.length >= 2 && cocksThatFit.length > 0)
			{
				cIdx2 = cocksThatFit[rand(cocksThatFit.length)];
				cocksThatFit.splice(cocksThatFit.indexOf(cIdx2), 1);
			}
			if(pc.cocks.length >= 3 && cocksThatFit.length > 0)
			{
				cIdx3 = cocksThatFit[rand(cocksThatFit.length)];
				cocksThatFit.splice(cocksThatFit.indexOf(cIdx3), 1);
			}
			if(cIdx < 0) cIdx = pc.smallestCockIndex();
			
			if(pc.hasVagina()) vIdx = rand(pc.vaginas.length);
			
			if(cIdx >= 0 && cIdx2 < 0) sceneList.push("cock");
			if(cIdx >= 0 && cIdx2 >= 0) sceneList.push("cocks");
			if(vIdx >= 0) sceneList.push("vagina");
			if(sceneList.length > 0) scene = sceneList[rand(sceneList.length)];
			
			addButton(0, "Next", quinnHandmaidenThreesome, [scene, cIdx, vIdx, cIdx2, cIdx3, cumQ]);
			break;
		// 1 < cocks less than 12.5 inches
		case "cocks":
			showQuinnMaidens();
			
			output("<i>“Ooh Fetch look,”</i> she coos, hands grasping your [pc.cock " + cIdx + "] and [pc.cock " + cIdx2 + "], <i>“[pc.he]’s just like the naleen!");
			if(pc.cocks.length > 2) output(" Only, um, more so.");
			output("”</i>");
			output("\n\n<i>“That’s nice, Carry,”</i> Fetch sighs blissfully, stroking " + (pc.hasHair() ? "you through your [pc.hair]" : "your bald pate" ) + ". Her hand tightens a second later, her tone sharpening. <i>“You aren’t a naleen, are you?”</i>");
			// Naleenmorph:
			if(pc.naleenScore() >= 5)
			{
				output("\n\nYou part from her nipples in order to loom above her, grinning wickedly");
				if(pc.faceHasFangs()) output(", displaying your fangs");
				output(".");
				output("\n\n<i>“What if I am?”</i>");
				output("\n\nThe lithe zil relaxes a moment later, grinning back and wriggling her luscious curves provocatively.");
				output("\n\n<i>“Zpirits, I hope the big nasty naleen isn’t going to take advantage of me,”</i> she simpers. <i>“Wrap me up in [pc.his] coils and do whatever [pc.he] wants with me...”</i>");
			}
			else
			{
				output("\n\nYou reluctantly part from her nipples in order to reassure her that there are plenty of people with more than one penis amongst the stars, and none of them are particularly interested in eating zil.");
				output("\n\n<i>“Really? That’s a shame,”</i> she simpers, relaxing and wriggling her luscious curves provocatively. <i>“I quite like being eaten, sometimes...”</i>");
			}
			output("\n\nIncensed, you grip Fetch around her slim waist and hoist her over [pc.eachCock], delighting in the resultant wriggles and squeals. Carry is laughing too as she grasps your [pc.cock " + cIdx + "], intensely erect from the zil oven you’re baking in here, and positions it so you can lower Fetch slowly down onto it. The soft warmth of her thighs brush over your [pc.cockHead " + cIdx + "], and then - you groan with delight - you enter the gooey magic of her cunt, the honey-leaking folds spreading around your diamond-hard head and then sinking down, down, down.");
			output("\n\nThe smell of fruit washes over your face as she grasps your shoulders, her tube tongue batting you in the face as it whips out in excited response to the first, prospective push of her thighs, her silky, nectar-slathered walls squelching delightfully around you.");
			
			pc.cockChange();
			cumQ += pc.cumQ();
			
			output("\n\n<i>“Oh zpirits yeahhhhh,”</i> she groans, tar-black eyes unfocused. <i>“You gotta get a piece of this, Carry.”</i>");
			output("\n\n<i>“Maybe if you’d stop jerking around for a moment...”</i> Fetch does nothing of the sort, excitedly digging her athletic hips into you and humping you for all you’re worth, pert buttocks slapping against your groin, an action you return with enthusiasm. But Carry persists - keeping a firm grip on your [pc.cock " + cIdx2 + "], chitinous calves sliding over your [pc.legs], determinedly butting into her peer to make her give up room, forming a two-girl conga-line with her. You arch your back with sheer ecstasy as, in a pause in the action, you feel Carry sink her wet pocket down on your [pc.cock " + cIdx2 + "], penetrating herself with a blissful sigh, so that " + (pc.cocks.length == 2 ? "both" : "two" ) + " of your dicks are mired in tight honey.");
			output("\n\n<i>“You like that, star-person?”</i> Fetch teases, beginning to work her hips again. <i>“Think you can satisfy us both? Our Quinn thinks you have too much energy - so why don’t youooooh!”</i> She trails off in a delighted coo as you thrust upwards hard, soft zil flesh bobbling on top of you, determined to pound both of those sugar-cunts into the next century.");
			output("\n\nLust coursing through your veins, you reach up, grip Fetch by the back of her head, fingers running through her sweaty brown quill hair as you take another drag on the erect taps of her petite tits, spots of sweetness dotting your [pc.tongue]. Face orange with lusty joy, Carry grips those pretty little handfuls from behind, fondling her friend at the same time as holding them steady for your questing mouth. Head thrown back, Fetch first moans huskily and then buzz-squeals with joy, pussy contracting around your thrusting cock.");
			output("\n\n<i>“She’s got such a pinchy tongue,”</i> Carry tuts. <i>“She’s soooo much better when somebody’s giving her this kind of attensh- mmm.”</i> You reach further forward to kiss her lasciviously, curling your tongue around her tube-appendage, lips mashing into hers as you continue to fuck the pair of them assiduously, the wicker bed creaking and complaining underneath you.");
			output("\n\n<i>“Don’t stop! Don’t stop!”</i> groans Fetch, and then opens up into a tongue-flailing wail, a flood of honey washing over your [pc.cock " + cIdx + "]. You power into orgasm yourself, both of your cocks bulging up and then spouting [pc.cum] into the pair of snatches they’re installed in");
			if(pc.balls > 0) output(", your [pc.balls] clenching up mightily as it prepares your reserves");
			output(". You thrust it deep with one reactive pump of your [pc.thighs] after another, bouncing the pair of them on top of you as hard as you can until");
			if(cumQ < 2000) output(" your load is dribbling back down onto your livid [pc.skin]");
			else output(" both of them have a bit of a pouch on their bellies you’ve packed that much into them, and the rest of it is streaming down onto your livid [pc.skin]");
			output(".");
			output("\n\n<i>“Aww,”</i> pouts Carry, watching Fetch slowly collapse down onto the woven blankets with an expression of pure bliss written on her features, your throbbing [pc.cock " + cIdx + "] flop free of her thoroughly creamed snatch. <i>“You done already? Oh well. It was fun while it last--”</i>");
			output("\n\nYou interrupt her by gripping her by the wide thighs, swinging her around and positioning her on her hands and knees, big butt and plump insect abdomen in the air. You admire her cream-and-honey oozing pussy as you consider which dick you’re going to stick in there this time.");
			if(cIdx3 >= 0) output(" Number three, definitely. Let it get some much-deserved action here. Carry buzzes with delight, hands sinking into the blankets as you line your [pc.cock " + cIdx3 + "] up and then dip it in, grunting with the sheer joy of slotting back into the groove, ardor still very much intact.");
			else if(pc.hasTailCock()) output(" An insistent buzz of impulses tickles your mind, your [pc.cockTail] rearing around, tumescent and ready to go. Good idea, that tail. Carry buzzes with delight, hands sinking into the blankets as you line your [pc.cockTail] up and then dip it in, grunting with the sheer joy of slotting back into the groove, ardor still very much intact.");
			else output(" Number one, you think. Let her experience a different flavor of you. Carry buzzes with delight, hands sinking into the blankets as you line your [pc.cock " + cIdx + "] up and then dip it in, grunting with the sheer joy of slotting back into the groove, ardor still very much intact.");
			output("\n\n<i>“Oh wow,”</i> Carry cries, her voice wavering as surely as her buttocks do with every stern slap of your [pc.thighs] against them, <i>“Quinn wasn’t - fzzz - lying about you, was she? Yeah, that’s it, fuck me, champion! Oh fuck me like that! Give me more of your strong seed!”</i>");
			output("\n\n<i>“Yeah,”</i> Fetch murmurs, lying on her side and watching the pair of you go. <i>“We didn’t even have to sting you.”</i> She catches your eye and sinks her hand between her thighs, biting her lip, fingering her [pc.cum] slickened folds as she watches you go at her partner. <i>“Hope you’ve got more when you’re done with her.”</i>");
			output("\n\nYou fully intend to.");
			output("\n\n");
			
			processTime(45);
			for(i = 0; i < 3; i++) { pc.orgasm(); }
			
			addButton(0, "Next", quinnHandmaidenThreesome, ["cocks next", cIdx, vIdx, cIdx2, cIdx3, cumQ]);
			break;
		case "cocks next":
			showQuinnMaidens();
			
			cumQ += pc.cumQ();
			
			output("After another good fifteen minutes of pounding the shorter zil silly, you thrust another hefty load of [pc.cum] deep into her snatch before immediately withdrawing, gripping the taller one and burying yourself into the lavender-scented straw with her, revelling in the feeling of her supple, athletic body and her thin fingers clutching at your back as you push your [pc.cock " + cIdx + "] into her tight honeyed squeeze again, and again, and again. [pc.EachCock] is aching a bit by now, but you’ve still got the energy and ability to lift Fetch to another buzzing orgasm, her flat belly palpitating against your [pc.belly] as her slim thighs clench your waist hard, a slurry of pheremonal honey and [pc.cum] warming your " + (pc.balls > 0 ? "[pc.balls]" : "[pc.thighs]") + ".");
			output("\n\n<i>“We need... more starwalking championzzz...”</i> is the last thing she murmurs before drifting off into the same blissful post-coital doze as Carry has long since disappeared into");
			if(cumQ < 2000) {}
			else if(cumQ < 5000) output(", both of their cunts unfurled and slick with the plentiful amount of [pc.cumColor] seed you’ve stuffed into them");
			else output(", both of their cunts gaped and drooling with the plentiful amount of [pc.cumColor] seed you’ve stuffed into them, their bellies faintly pouched with it");
			output(".");
			output("\n\nYou could slip between them, cuddle into that zil sandwich, maybe wake up a couple hours later and go at them all over again... certainly the sweet, horny smell rising up from them is bidding you to do that... but with all of your ardor spent, a more objective voice is telling you that perhaps losing yourself in a feedback loop with these pheremonal good time bugs would be a good way of waking up and finding a whole week has disappeared. You carefully extricate yourself, picking up your [pc.gear], groaning as a mighty, aching throb emanates from [pc.eachCock].");
			output("\n\n<i>“You are satiated now, I hope?”</i> Quinn says briskly, as she watches you cowboy your way back to her seat. You grin an affirmation. For now, anyway.");
			output("\n\n");
			
			processTime(15);
			for(i = 0; i < 3; i++) { pc.orgasm(); }
			// +female juices, +sweaty statuses
			pc.applyPussyDrenched();
			pc.applyPussyDrenched();
			sweatyDebuff(2);
			
			IncrementFlag("QUINN_MAIDENS_SEXED");
			
			addButton(0, "Next", mainGameMenu);
			break;
		// PC has pussy
		case "vagina":
			showQuinnMaidens();
			
			output("<i>“They were telling the truth you know, Fetch,”</i> she murmurs, one hand shifting around the base of your [pc.cock " + cIdx + "] whilst the other traces the lips of your [pc.vagina " + vIdx + "]. <i>“[pc.He]’s a woman-man! Or a man-woman. A something or other.”</i>");
			output("\n\n<i>“You’re alright about that, aren’t you Carry?”</i> Fetch sighs, hand stroking " + (pc.hasHair() ? "you through your [pc.hair]" : "your bald pate" ) + ". <i>“Knowing you.”</i>");
			output("\n\nCarry’s answer is to continue to stroke your [pc.cock " + cIdx + "] whilst crawling further back, hand brushing over your " + (pc.balls > 0 ? "[pc.balls]" : "[pc.knot " + cIdx + "]") + " as she dips her head between your opened thighs. Dark pulses of lust darting through you, you twist yourself so you can let the shorter zil do her thing whilst you continue to feast upon the taller one’s body, [pc.tongue] dancing over her flat, hard belly whilst clasping her crotch armor and forcing it open with your own hands, her squawk of laughter subsiding into sighs as you french her heady, perfumed snatch, seeking out her clit and flicking at it before delving deeper into her hole, sheerest sweetness flooding into your mouth.");
			output("\n\nCarry takes a little while to get going with you - a clumsy but ardent thing, her slick tube tongue darts over your hardening [pc.cockNoun " + cIdx + "] and then across your labia, perhaps unsure of where to land - but you direct her towards the bits which make you tingle with approving, muffled grunts and sighs, and soon enough she’s got her hands wrapped around your [pc.thighs], delightfully long tongue lapping and sucking at the buried, sensitive parts of your pussy, all the while you eat Fetch with gusto.");
			output("\n\nThe pheremonal honey you’re absorbing into your system with every hungry curl of your tongue drives you on, making you feel almost feral with lust; your [pc.cock " + cIdx + "] is incredibly hard, thrumming with lust in Carry’s lazily stroking hand, and intense pleasure courses through your [pc.vagina " + vIdx + "] to the wriggles of her flexible tongue. You lap at Fetch as deep as you can");
			if(pc.hasLongTongue()) output(" - which for you is <i>very</i> deep indeed - ");
			output(" and when she gasps, whines, slaps and writhes in the straw, you keep a firm grip on her, so that when wailing orgasm hits she’s forced to ride it out on your [pc.tongue], gooey fuck honey slathered right across your face and mouth by her energetic, buffeting bucks.");
			output("\n\n<i>“Ah! Ah! Ahhhhh,”</i> she sighs, as she finally relaxes her armored legs around your head. <i>“My, you </i>are<i> hungry, aren’t you? What does [pc.he] taste like, Carry?”</i>");
			output("\n\nThe only response is a blissful ‘mmm’, vibrating through your nether regions. You bite your lip and flinch a bit as the busy bee retracts her proboscis to direct the pinching, sucking tip onto [pc.eachClit], bulging well out of " + (pc.totalClits() == 1 ? "its" : "their") + " hood.");
			output("\n\n<i>“She’s so greedy,”</i> Fetch confides to you, touching your chin as she slithers back down your front to bat at her partner. <i>“What she really needs is somebody to stuff her completely full.”</i>");
			output("\n\n<i>“Umm...”</i> Carry emerges from between your legs, mouth slathered in [pc.girlcum], pupil-less eyes unfocused - at least until they land on your [pc.cock " + cIdx + "], tenting and veiny in front of her face. <i>“...yeah. That does sound nice...”</i>");
			output("\n\nThey swap positions, black plate slithering across soft yellowness. You lie back, drinking in the delightful sight of Fetch holding your cock steady whilst Carry slowly sits her plump rear down on it, sighing with pleasure as her hairless, gooey folds part around your [pc.cockHead " + cIdx + "], hands pinching into your [pc.chest] as more and more of your iron-hard length disappears into hot, tight bliss. It’s so good, and your libido is wound so tight, that you can’t help but allow a big dollop of [pc.cum] to escape you straight away, practically vacuumed into that soaked, kneading pocket.");
			
			pc.cockChange();
			cumQ = pc.cumQ();
			
			output("\n\n<i>“Aww, did you cum already?”</i> mumbles Carry, looking down. <i>“You must be very young for your k- ooh!”</i> You thrust upwards, sheathing " + (pc.cocks[cIdx].cLength() <= 8 ? "all" : "even more of your") + " ramrod-erect dick into her. You haven’t even gotten warmed up yet.");
			output("\n\nYou rock into the zil slowly, reveling in her glutinous walls sliding up and down your [pc.cock " + cIdx + "], jouncing her on until she’s bouncing on top of you energetically, tits bouncing a liquid rhythm on her chest, happily doing most of the work herself. Meanwhile Fetch’s tongue flickers and dips into [pc.eachVagina] like a hummingbird over a particularly rich flower, licking and suckling at your female sex until sheer lust has driven you to knit your [pc.legs] around her head and drive it into your snatch, not willing to let that long, wriggling, curling appendage escape your needy hole even for an instant. Gripping a pair of supple, yellow thighs, you pump your lower body up and down, embedded upon this delightful pair of wasp sluts you’ve been apportioned, your lust pulsating upwards to a shimmering, sugary high.");
			output("\n\nYour male and female orgasms come so hot on the heels of one another that they may as well be simultaneous. Inhuman pleasure creases you up as you fountain [pc.cum] into Carry’s kneading, honeyed twat at the same as your [pc.vagina " + vIdx + "] trembles and pulses heavily to the slippery movements of Fetch’s tongue");
			if(pc.isSquirter(vIdx)) output(", a small tidal wave of [pc.femcum] gushing onto her face");
			output(". Your eyes roll and you cry out, thrashing into them furiously, a slave to the brilliance of those pulses; you’re lucky you don’t pull a muscle.");
			if(cumQ >= 1000) output(" [pc.Cum] spurts out from Carry’s packed cunt, spattering onto the blankets, your [pc.thighs], and Fetch. The simultaneous cry of shock and filthy delight this draws is music to your ears.");
			output("\n\n<i>“Hmm,”</i> Fetch whisper-buzzes a few moments later, slinking up your flank");
			if(cumQ >= 1000)
			{
				output(", wiping the generous amounts of cum");
				if(pc.isSquirter(vIdx)) output(" and pussy juice");
				output(" off her face with the corner of a blanket");
			}
			output(". Carry has slid off on the other side, a huge beam on her face. <i>“Did you enjoy how we handmaidens treat you, champion? Better than Quinn, I expect. I bet you’d rather spend time w--”</i>");
			output("\n\nYou clinch her by the arm and by the butt, returning her earlier ass-squeeze with interest, and lead her hand down to feel your honey-slathered [pc.cockNoun " + cIdx + "]. Still throbbingly erect, still dense and simmering with lust for zil puss.");
			output("\n\n<i>“Ooh my,”</i> the lithe handmaiden murmurs, gripping it as you climb on top of her. You see naked excitement on her face, and a fresh surge of lust enters you - as if you needed any, with the amount of sex-sugar you’ve absorbed. <i>“Quinn wasn’t lying about you, was she? I didn’t even have to sting you.”</i> She hisses a sound of purest arousal into your ear as you enter her, sliding your [pc.cock " + cIdx + "] into a fertile sleeve of hot, clinging honey. It’s a sensation that will never get old.");
			output("\n\n<i>“Yeahzzz like that,”</i> she groans, arching her back and burying her hands into your [pc.ass], tube-tongue flicking at your ear. <i>“C’mon you strange, unstoppable beast, give it me for hours! Make me forget my name! Show me the stars!”</i>");
			output("\n\n<i>“Zpirits,”</i> you hear Carry mumble, shifting around and watching the two of you go with awe. You intensify your thrusts, obeying nothing but that shining, boiling imperative to fuck, and fuck, and fuck...");
			output("\n\n");
			
			processTime(45);
			for(i = 0; i < 3; i++) { pc.orgasm(); }
			
			addButton(0, "Next", quinnHandmaidenThreesome, ["vagina next", cIdx, vIdx, cIdx2, cIdx3, cumQ]);
			break;
		case "vagina next":
			showQuinnMaidens();
			
			cumQ += pc.cumQ();
			
			output("You do a pretty good job of meeting Fetch’s demands; her mouth is agape and her eyes unfocused by the time you tighten up and unload another hefty load of [pc.cum] deep into her snatch, a slurry of pheromonal honey and [pc.cum] warming your " + (pc.balls > 0 ? "[pc.balls]" : "[pc.thighs]") + ".");
			output("\n\n<i>“We need... more starwalking championzzz...”</i> is the last thing she murmurs before drifting off into the same blissful post-coital doze as Carry has long since disappeared into");
			if(cumQ < 2000) {}
			else if(cumQ < 5000) output(", both of their cunts unfurled and slick with the plentiful amount of [pc.cumColor] seed you’ve stuffed into them");
			else output(", both of their cunts gaped and drooling with the plentiful amount of [pc.cumColor] seed you’ve stuffed into them, their bellies faintly pouched with it");
			output(".");
			output("\n\nYou could slip between them, cuddle into that zil sandwich, maybe wake up a couple hours later and do it all over again... certainly the sweet, horny smell rising up from them is bidding you to do exactly that... but with [pc.eachCock] aching and your ardor spent, a more objective voice is telling you that perhaps losing yourself in a feedback loop with these pheremonal good-time bugs would be a good way of waking up one day and finding a whole week has gone by. You carefully extricate yourself, picking up your [pc.gear], groaning as a mighty, aching throb emanates from [pc.eachCock].");
			output("\n\n<i>“You are satiated now, I hope?”</i> Quinn asks briskly, as she watches you cowboy your way back to her throne. You grin an affirmation. For now, anyway.");
			output("\n\n");
			
			processTime(15);
			for(i = 0; i < 3; i++) { pc.orgasm(); }
			// +female juices, +sweaty statuses
			pc.applyPussyDrenched();
			pc.applyPussyDrenched();
			sweatyDebuff(2);
			
			IncrementFlag("QUINN_MAIDENS_SEXED");
			
			addButton(0, "Next", mainGameMenu);
			break;
		// Single dicked plebeians
		case "cock":
			showQuinnMaidens();
			
			output("<i>“So this is what starwalkers hide underneath their soft plates,”</i> giggles the shorter one, hand wrapping itself around your [pc.cock " + cIdx + "]. You groan your enjoyment as warm smoothness spirals its way up and down your shaft, obdurate heat swelling readily into it. <i>“" + (pc.cocks[cIdx].cLength() < 9 ? "Not as, uh, big as I imagined." : "Soooo big! No wonder Quinn tries to keep you all to herself.") + " What do you think, Fetch?”</i>");
			
			cumQ += pc.cumQ();
			
			// Pheromone Cloud + Dick > 9 inches
			if(pc.pheromoneLevel() >= 4 && pc.cocks[cIdx].cLength() >= 9)
			{
				output("\n\n<i>“Oh my,”</i> murmurs the taller one, gazing down at the thick tentpole you are now sporting between your [pc.thighs]. The two zil girls are not the only ones releasing gusts of pheromones here; you grin as you recognize the soft, unfocused, needy look stealing over both of them, unable to look away from your bestial, veiny penis. You can practically see the wild, musky smell of it hardwiring sheerest lust down to their groins, their mouths filling with saliva.");
				output("\n\n<i>“We were supposed to please [pc.him], weren’t we Carry?”</i> she goes on, pausing to swallow. <i>“We should see to our big... meaty... champion.”</i>");
				output("\n\n<i>“Yeah...”</i> sighs Carry dozily. Her tube-tongue flicks out, lands on your cock, carries your taste back into your mouth; her antennae quiver. <i>“Meat.”</i>");
				output("\n\nYou growl your approval as Fetch snakes her way downwards, hand trailing down your [pc.belly], whilst Carry slowly and lovingly pumps the base of your [pc.cock " + cIdx + "]. A few moments later they are both knelt in front of you, your [pc.legs] trailing over the side of the bed, their long, brilliant yellow tongues slathering up and down the straining shaft, hungry, happy hums of pleasure rising up to your ears. Their proboscis are flexible enough to wrap themselves right around your hot girth, wringing it in hot, wet pressure until pre courses freely from your engorged [pc.cockHead " + cIdx + "]; this is almost immediately vacuumed away by the other, the nibbling tip of her tongue greedily sucking away every last drop of your delicious, musky juices.");
				output("\n\nThe concentrated urge coursing through you eventually compels you to reach downwards and grip both zil by the head, directing them upward and downward, unwilling to allow those ribbons of smooth, wet pleasure undulating around your [pc.cock " + cIdx + "] to leave it even for a second. The two of them are pliant, happy, eyes closed as they submerge themselves in the role of pet cock-worshippers; you think you’d all be happy to sit here and simmer in shared arousal for hours. The smell of them, though. That’s having just as much an effect on you as yours is on them. The happier they are licking, suckling and kissing your bitch-tamer the headier the sweet tang in your nostrils gets, the more the blood in your vein quickens, the more the seed in your " + (pc.balls > 0 ? "[pc.balls]" : "glans") + " swells.");
				output("\n\nAs your lust mounts, you pull Carry up and position her wet, sucking mouth over your [pc.cockHead " + cIdx + "]. Fetch’s tongue wraps and strokes at your [pc.knot " + cIdx + "] whilst the short, buxom zil looks up at you with adoring, woozy, pupil-less eyes. That’s too much. Sheerest pleasure surges up your [pc.cock " + cIdx + "], your head dilates and you blast a huge wad of [pc.cum] into her waiting, hungry mouth. She coughs a bit, [pc.cumColor] fluid spotting out of her button nose as more and more cum shoots powerfully up your shaft into her waiting maw, but you keep your grip on the back of her head firm: girl has to learn, if she wishes to pleasure an otherworldly champion alpha like you. Fetch eggs you on with approving hums, firmly lapping away at the bottom of your flexing, bulging glans, easily wicking and suckling away any drop of semen that escapes her partner’s mouth. Your boiling heat finally easing a bit, you finish off by pulling out with a slobbery ‘pop’ and giving Carry a final couple of blasts of [pc.cum] in her pretty face, which she accepts with a gasp of shock and then a coo of filthiest pleasure. You sink back on to the bed’s furs, thoroughly gratified.");
							
				processTime(45);
				// - ½ PC’s current Lust
				pc.changeLust(-0.5 * pc.lustRaw);
				
				output("\n\n");

				addButton(0, "Next", quinnHandmaidenThreesome, ["cock pheromones", cIdx, vIdx, cIdx2, cIdx3, cumQ]);
			}
			// If Else
			else
			{
				output("\n\n");
				if(pc.cocks[cIdx].cLength() < 9) output("<i>“You’re, uh... not as big as I was expecting,”</i> murmurs the tall one, wrapping her hand around your [pc.cock " + cIdx + "].");
				else output("<i>“Oh wow,”</i> murmurs the tall one, eyes widening as she gazes down at your [pc.cock " + cIdx + "]. <i>“No wonder Quinn wants to keep you to herself.”</i>");
				output(" She shifts her grip up and down your cock, leer widening as heat and lust readily expands inside it, becoming hard and ready underneath her coiling, teasing fingers.");
				output("\n\n<i>“Would you like to see me and Carry have fun together?”</i> she whispers in your ear. She lets go of your [pc.cock " + cIdx + "] to");
				if(pc.biggestTitSize() < 3) output(" trace the muscles in your arms");
				else output(" cusp one of your boobs, thin fingertips caressing " + indefiniteArticle(pc.nippleDescript()));
				output("; short, buxom Carry immediately takes over where her friend left off, squashing a yellow boob into your smoldering length, grinning toothily at you as she swaddles it in soft flesh and kneads it briskly. Concentrated pleasure veins its way into your core as you listen to the taller one’s teasing whisper... <i>“Most of the boys do. We don’t do it for them very often, though. We’d only do it for someone very special... a brave... virile... champion.”</i>");
				output("\n\n<i>“Fetch, if you wanted to make out with me, you just had to say,”</i> sighs her partner.");
				output("\n\nThe bed is big enough for Fetch and Carry to clamber up together, kneeling at your [pc.feet]. You clutch your [pc.cock " + cIdx + "] and watch as the pair of them slowly prize each other’s groin plates open, long, thin fingers stealing into yellow crevices as they press their curves into each other, harsh black plate trading with soft, supple, yellow flesh. To begin with the female zil are giggly and self-aware, slyly eyeing you as they fondle each other, particularly Fetch, who in a different aeon you’re sure would have been an impresario. As they go on though they get more and more into it, forgetting about their breathless audience to coil their fingers into each other’s pussies with increasing gusto, deeper color appearing in their faces as they wrap their long, flexible tongues around each other for long, impassioned frenching. Carry quivers and moans as she goes nerveless in Fetch’s arms, her thick hips trembling to the movements of the latter’s fingers, deep in her snatch; the latter buzzes softly with laughter, holding her by the waist, the tendons in her other arm standing out as she flicks and she flicks and she flicks, little drops of golden sugar landing on the furs.");
				output("\n\nIt’s not just the sight of the two lissom wasp sluts fondling each other which is causing heavy lust to build like an approaching storm in your loins; the aroma coming off of them, good One, like an orchard of purest sex in the heat of summer. You are only hazily aware your hand is a blur around your [pc.cock " + cIdx + "]; the sight and smell is all. Fetch catches your eye, lusty and knowing, and suddenly you can’t hold yourself back; you leap forward and snatch the cooing, dazed Carry into your arms, hungry mouth seizing on a black, moist nipple as you lead her backwards, your insatiable erection digging into the softness of her inner thighs. She emits a husky, delighted buzz as your [pc.knot " + cIdx + "] bumps into her labia, already unfurled and gooey with honey from her partner’s effort; her abdomen twitches behind her, the sharp stinger thankfully burying itself into the dried, velvety furs.");
				output("\n\n<i>“That’s it,”</i> murmurs Fetch, lying on her side and watching. <i>“Let me see you go at her now...”</i> An approving, drunken-wasp-buzz of a sigh leaves her lips as you grip Carry’s waist and slot yourself home, sinking your [pc.cock " + cIdx + "] into the hot, honeyed magic of zil cunt. Void, it’s such a supremely enjoyable sensation you could just let yourself go right there and then... but you hold it back, determined to energetically thrust your [pc.hips] upwards into her instead, watching her bounce and squeal on top of you, D-cups rippling mesmerically as you pile-drive into that wonderful, honey-slathered pocket hard.");
				
				pc.cockChange();
				
				output("\n\nLying on her side, Fetch watches you fuck the other handmaiden, fingers dipping into her own honeypot as the wonderfully sensitive and wriggly Carry rides your [pc.cock " + cIdx + "] with gusto, more viscous sugar drooling down your throbbing meat with every energetic jounce of her thick hips; eventually the former’s own breath comes sharper, her eyes unfocused, and she, too, springs into instinctive action. Mouth open, you lie back and watch as she throws her long hip over your neck, exposing her bare, honey-slathered lips to your breath. An incredibly intense sweet smell washes over you, bearing the intense smell of pheromonal need into your nostrils. Fuck...");
				output("\n\n<i>“Lick me,”</i> she grits. You reach up and grab her armored hips and bear her straight down onto your [pc.tongue], an assertive action that makes her snarl with approval. <i>“Yeah, like that, c’mon! C’mon, show me why Quinn thinks you’re so fucking uncontrollable...”</i> You lap at her gooey tunnel as deep and vigorously as you can, her athletic hips digging into the sides of your temple, all the while you continue to pump your hard heat into the twat borne squashily down on it. Purest, sexual sweetness slides down your throat, and now, finally, it’s all too much.");
				output("\n\nYour groan is muffled by one sugary pussy as you cum explosively into the other, your [pc.cock " + cIdx + "] spurting length after length of [pc.cum] into its warm, soaking berth, painting Carry’s walls");
				if(cumQ < 1000) output(" with it");
				else output(" and bloating out her stomach with its sheer volume, spurting back out all over your [pc.groin]. The filthy cry of delight this draws out of her is music to your ears");
				output(". Your orgasm is made long and electric by the sheer amount of saccharine lust you’ve absorbed, one glorious clench after another, and you channel it into lapping at Fetch, finding her clit buried in her folds and attacking it with the tip of your [pc.tongue] until she’s cringing and wriggling, crying out with the ecstasy your forcing upon her.");
				output("\n\nYou feel Carry flop off you, trailers of [pc.cum] parting with your pulsing, leaking knob; Fetch levers herself off your honey-slathered face long enough for you to take in the shorter zil lying on her side, eyes unfocused and beaming happily.");
				output("\n\n<i>“Do you enjoy how we handmaidens treat you, champion?”</i> Fetch murmurs, grinning down at you, armored legs shifting against your shoulders. Her cunt is a few inches away, open, golden and delicious. <i>“Better than Quinn, I expect. I bet you’d rather spend time w--”</i>");
				output("\n\nYou clinch her by the arm and by the butt, returning her earlier ass-squeeze with interest, and lead her hand down to feel your honey-slathered [pc.cockNoun " + cIdx + "]. Still throbbingly erect, still dense and simmering with lust for zil puss.");
				output("\n\n<i>“Ooh my,”</i> the lithe handmaiden murmurs, gripping it as you climb on top of her. You see naked excitement on her face, and a fresh surge of lust enters you - as if you needed any, with the amount of sex-sugar you’ve absorbed. <i>“Quinn wasn’t lying about you, was she? I didn’t even have to sting you.”</i> She hisses a sound of purest arousal into your ear as you enter her, sliding your [pc.cock " + cIdx + "] into a fertile sleeve of hot, clinging honey. It’s a sensation that will never get old.");
				output("\n\n<i>“Yeahzzz like that,”</i> she groans, arching her back and burying her hands into your [pc.ass], tube-tongue flicking at your ear. <i>“C’mon you strange, unstoppable beast, give it me for hours! Make me forget my name! Show me the stars!”</i>");
				output("\n\n<i>“Spirits,”</i> you hear Carry mumble, shifting around and watching the two of you go with awe. You intensify your thrusts, obeying nothing but that shining, boiling imperative to fuck, and fuck, and fuck...");
				output("\n\n");
				
				processTime(45);
				for(i = 0; i < 3; i++) { pc.orgasm(); }
				
				addButton(0, "Next", quinnHandmaidenThreesome, ["cock next", cIdx, vIdx, cIdx2, cIdx3, cumQ]);
			}
			break;
		case "cock pheromones":
			showQuinnMaidens();
			
			output("<i>“Aww,”</i> buzzes Fetch, a few moments later. <i>“You gave Carry plenty of your seed, but none to me!”</i> She’s adopted a catty, teasing tone, hand reaching upward to graze her nails down your [pc.belly].");
			output("\n\n<i>“Oh, I’m sorry Fetch!”</i> Carry sounds genuinely contrite. Maybe with a face full of your pheromone-drenched cum, she’s still high and happy as a fuck-drunk kite. <i>“I’ll make it up to you. Would you like a lick? You usually do...”</i>");
			output("\n\n<i>“Yeah, bitch,”</i> her partner replies. You feel intense pressure wrap itself around your [pc.knot " + cIdx + "]. You look down, taking in the way Fetch archly sneers over her shoulder as she grasps your leaking [pc.cockNoun " + cIdx + "], her pert C-cups framing it perfectly. <i>“You get down there and lick me. Make it good.”</i> There’s a bit of shuffling around, and then Fetch tenses and opens her mouth with majestic glee. Oh One, that’s good just to watch. A powerful pulse of lust throbs up your [pc.cock " + cIdx + "].");
			output("\n\n<i>“Yeah, right there,”</i> the saucy tall one purrs, practically slow-dancing to what the out-of-sight Carry is doing. <i>“Riiiight there. You like that, big [pc.boy]?”</i> Her pupil-less eyes alight on you. She leans forward, pressing your dripping, spit-polished erection between her breasts. You groan, low and slow, as soft, warmth blankets it, and she presses them into your hard dick-meat and begins to move them, up and down. <i>“You like watching me getting eaten out? Most of the boys do. We don’t do it for them very often, though. Hhhhhhzzzzonly for the best. Only for the biggest...”</i> She closes her eyes and releases her tongue, curling it over your [pc.cockHead " + cIdx + "], withdraws it back into her mouth with a lascivious slurp. <i>“Only for the tastiest.”</i>");
			output("\n\nThank the One you’ve got the staying power to enjoy this. Thank the One that some of your seething libido has been boiled off already, so you can sit back and for long minutes luxuriate in the sight of this zil slowly tit-fuck you whilst her friend laps away at her honey-pot. You drool plentiful amounts of pre in juicy appreciation to that soft, smooth sleeve of boob-flesh she’s moving up and down your [pc.cock " + cIdx + "], and the unfocused neediness returns to Fetch’s heart-shaped face as she suckles on it, senses baking in your overwhelming, pheromonal haze.");
			output("\n\nSensitized as she is, she reaches it long before you do, biting her lip and squeezing her mounds into you tightly as Carry tongues her to an orgasm that makes her tremble and gape, high, tiny buzzes of ecstasy escaping her mouth, filthy, gooey sounds emanating from her honey-spurting back end. You pace yourself through it, savor every sound and movement the two horny wasp-maidens make, [pc.cock " + cIdx + "] throbbing with growing urgency. When she feels you begin to tighten up, a wanton groan tumbling out of your mouth, Fetch starts to pump her boobs around you with greater purpose, rubbing your shaft with brisk, quivering jounces.");
			output("\n\n<i>“That’s it, champion,”</i> she whispers. Her eyes close blissfully, her tongue tracing her lips; Carry is still hard at work down there. <i>“Thaaaat’s it. Give it to me. Give me your delicious, [pc.cumFlavor], virile...”</i> She’s interrupted by a small geyser of [pc.cum], delivered straight to her face. You groan as your " + (pc.balls > 0 ? ("[pc.balls] " + (pc.balls == 1 ? "is" : "are")) : "[pc.cock " + cIdx + "] is") + " seized by luscious contractions, and you throw your [pc.thighs] into it, determined to give the saucy zil the painting she deserves.");
			if(cumQ < 1000) output(" You’ve given her joyful, laughing face a pretty fair spattering by the time your cock has pulsed its last, one that easily matches the one you gave her partner.");
			else output(" An overclocked beast like your’s easily has enough to completely ice her face with cum, lines of [pc.cumColor] seed thrown over her brow and into her spiny hair; she jerks back, dripping and laughing in amazement, and you take the opportunity to spurt more across those delightful, pert boobs of hers. They deserve it.");
			output("\n\n<i>“Zpirits,”</i> she says, wiping a trailer of [pc.cum] off her brow and considering your [pc.cock " + cIdx + "] as it finally relaxes in her hand. <i>“What a beast you are. We are lucky to have you as our champion.”</i>");
			output("\n\nCarry giggles when she catches sight of the mess you’ve made of the other handmaiden’s face, peering up over the edge of the bed.");
			output("\n\n<i>“Maybe next time you’ll put the seed in our bellies instead?”</i> she murmurs, clambering up to pillow her plush breasts into your side. <i>“We need to stud a champion like you. Make lots of babies with your strength and... hmm... stamina.”</i>");
			output("\n\nYou clutch both of them to you, their warm, sweet smell in your nostrils, dozing in post-coital bliss. It’d be so easy to fall asleep between them, wake up re-energised, and do exactly that, spend a whole week in here just ploughing the two of them silly, over and over again... but with [pc.eachCock] aching and your ardor spent, a more objective voice is telling you that perhaps losing yourself in a feedback loop with these pheremonal good-time ladybugs would be a good way of waking up one day and finding a whole week has gone by.");
			output("\n\nYou carefully extricate yourself to a chorus of dozy ‘aww’s and throw your [pc.gear] back on, groaning as a mighty, aching throb emanates from [pc.eachCock].");
			output("\n\n<i>“You are satiated now, I hope?”</i> Quinn asks briskly, as she watches you cowboy your way back to her throne. You grin an affirmation. For now, anyway.");
			output("\n\n");
			
			processTime(15);
			// Drain remaining lust
			pc.orgasm();
			
			IncrementFlag("QUINN_MAIDENS_SEXED");
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "cock next":
			showQuinnMaidens();
			
			cumQ += pc.cumQ();
			
			output("You do a pretty good job of meeting Fetch’s demands; her mouth is agape and her eyes unfocused by the time you tighten up and unload another hefty load of [pc.cum] deep into her snatch, a slurry of pheromonal honey and [pc.cum] warming your " + (pc.balls > 0 ? "[pc.balls]" : "[pc.thighs]") + ".");
			output("\n\n<i>“We need... more starwalking championzzz...”</i> is the last thing she murmurs before drifting off into the same blissful post-coital doze as Carry has long since disappeared into");
			if(cumQ < 2000) {}
			else if(cumQ < 5000) output(", both of their cunts unfurled and slick with the plentiful amount of [pc.cumColor] seed you’ve stuffed into them");
			else output(", both of their cunts gaped and drooling with the plentiful amount of [pc.cumColor] seed you’ve stuffed into them, their bellies faintly pouched with it");
			output(".");
			output("\n\nYou could slip between them, cuddle into that zil sandwich, maybe wake up a couple hours later and do it all over again... certainly the sweet, horny smell rising up from them is bidding you to do exactly that... but with [pc.eachCock] aching and your ardor spent, a more objective voice is telling you that perhaps losing yourself in a feedback loop with these pheremonal good-time bugs would be a good way of waking up one day and finding a whole week has gone by. You carefully extricate yourself, picking up your [pc.gear], groaning as a mighty, aching throb emanates from [pc.eachCock].");
			output("\n\n<i>“You are satiated now, I hope?”</i> Quinn asks briskly, as she watches you cowboy your way back to her throne. You grin an affirmation. For now, anyway.");
			output("\n\n");
			
			processTime(15);
			for(i = 0; i < 3; i++) { pc.orgasm(); }
			// - Lust, sweaty status, female juices status
			pc.applyPussyDrenched();
			pc.applyPussyDrenched();
			sweatyDebuff(2);
			
			IncrementFlag("QUINN_MAIDENS_SEXED");
			
			addButton(0, "Next", mainGameMenu);
			break;
		default:
			showQuinnMaidens();
			
			output("ERROR! No scene available...");
			output("\n\n");
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

// Hard Light Fun
// Option appears in Quinn’s sex menu if PC has it on
public function quinnHardlightVolume():Number { return 500; }
public function quinnHardlightFun(args:Array):void
{
	clearOutput();
	author("Nonesuch");
	clearMenu();
	
	var response:String = args[0];
	var cIdx:int = (args.length > 1 ? args[1] : -1);
	var vIdx:int = (args.length > 2 ? args[2] : -1);
	var cumQ:Number = (args.length > 3 ? args[3] : 0);
	var girlCumQ:Number = (args.length > 4 ? args[4] : 0);
	var i:int = 0;
	
	switch(response)
	{
		case "intro":
			showQuinn(true);
			
			if(flags["QUINN_HARDLIGHT_PEGGED"] == undefined || flags["QUINN_HARDLIGHT_COWZIL"] == undefined)
			{
				output("<i>“Here, Quinn. Watch this.”</i>");
				output("\n\nThe female zil lies on her side, chin rested on hand and faintly frowning, as you strip yourself down to your [pc.lowerGarment]. Kneeling on the bed, you give her a rakish grin before turning the hardlight projector on. The normally placid wasp queen twitches like a startled cat as the gloom of her yurt is suddenly filled with an eerie, turquoise light, generated by the fluorescent, featureless dick you are now sporting.");
				output("\n\n<i>“What?!”</i> she snorts, caught somewhere between laughter and awe. <i>“Is that thing real? May I... ?”</i> You stand steady as she reaches a delicate finger out, immediately withdrawing it the second she touches it, as if it were pan of boiling water. You sigh with pleasure, sensation flooding into your groin, as she finally dares to fully grasp it, testing its sturdiness and warmth.");
				output("\n\n<i>“It’s not poisonous? And you feel this, do you?”</i> She shakes her head in amazement, stoical mouth curling into a small grin. <i>“You starlanders and your decadent magic. Why, with something like this, </i>we<i> could...”</i> Her smile becomes a bit wilder, her golden eyes sliding up to your face. <i>“...or </i>I<i> could...”</i>");
			}
			else
			{
				output("The female zil lies on her side, chin rested on hand and smirking, as you strip yourself down to your [pc.lowerGarment]. She knows what’s coming now, and bites her lip faintly as you flick the switch and bathe the room in the eerie, turquoise light of the hardlight strap-on.");
				output("\n\n<i>“My, my,”</i> she says, reaching out to gently stroke the thick, featureless erection. <i>“And what shall we do with our tool today, hmm?”</i>");
			}
			output("\n\n");
			
			processTime(15);
			if(pc.hasCock())
			{
				cIdx = rand(pc.cocks.length);
				cumQ = pc.cumQ();
			}
			if(pc.hasVagina())
			{
				vIdx = rand(pc.vaginas.length);
				girlCumQ = pc.girlCumQ();
			}
			
			addButton(0, "Get Pegged", quinnHardlightFun, ["pegged", cIdx, vIdx, cumQ, girlCumQ], "Get Pegged", "Have your Quinn do you up the bum.");
			addButton(1, "Cowzil", quinnHardlightFun, ["cowzil", cIdx, vIdx, cumQ, girlCumQ], "Cowzil", "Have her ride you.");
			break;
		case "pegged":
			showQuinn(true);
			
			if(flags["QUINN_HARDLIGHT_PEGGED"] == undefined)
			{
				output("You bite your lip demurely, slip your [pc.lowerGarments] off, and proffer them to Quinn. She sneers faintly at the prospect of wearing such a preposterous thing - zil are equipped with natural underwear, after all - but it’s clear also that the novelty of it appeals to her. Her fingers snap the elastic once she’s pulled the [pc.lowerGarment] up to waist level, admiring the unnaturally fine material, before they delicately curl around the main event. A strange note escapes her throat as she fondles the hard-light erection projecting out of the front of the commandeered underwear, somewhere between amazement and arousal.");
				output("\n\n<i>“And... this is what it feels like? To be male?”</i> she asks, eyes fixed upon ‘her’ penis.");
				output("\n\n");
				if(cIdx < 0) output("You shrug noncommittally. Since you discovered the magic of hard-light strap-ons, you’ve never felt an urge to find out.");
				else output("You tell her it’s better in some ways. Less mess, for instance. And the person using it is never going to get TOO excited, if she knows what you mean.");
				output("\n\nThere’s something very arousing about being bare before the proud zil whilst she’s still clad tight in her chitinous plates, with your underwear over the top; rather BDSM-y. Perhaps her thoughts run the same way, because she slides her upper armor back into place too as she eyes you with that small, coolly amused smile of hers, her pert breasts receding behind harsh, gleaming jet.");
				output("\n\nReactively you reach out, grasping her faux-cock yourself and begin to fondle it, its warmth and sturdiness shifting underneath your palm. Quinn freezes, and then slowly relaxes as you go on, her small mouth opening to the pleasure you’re stroking into her through the glowing horn you’ve gifted her. Her expression turns wilder, more feral, golden irises fixed upon you, making your heart beat faster. Aglow with submission, you hold her gaze as you bend down and lick the blunt, flavorless end, drawing another amazed, lusty groan out of her.");
				output("\n\n<i>“Turn around and raise your behind, then,”</i> your black-clad queen husks. <i>“Since I am to be the man here.”</i>");
				output("\n\nWith a delighted shiver you do so, arching your back and giving your [pc.ass] a little wiggle, showcasing it to its best advantage. You squeak as a thin, smooth hand slaps down on your shoulder, gripping you hard, whilst another gives a buttcheek a good, hard grope. A pillar of hard, warm light lays itself in your crack, sawing back and forth over your [pc.anus]. Quinn has taken to the pitching role like a wasp to overripe fruit.");
				if(vIdx >= 0) output("\n\n<i>“Where would you like it?”</i> the zil asks, angling her strap-on so the blunt end shifts over your taint and then rubs downwards over [pc.eachVagina], brushing over [pc.eachClit]. <i>“Actually... you don’t get to choose.”</i> Her hand tightens on your shoulder; you feel the dildo sliding back up, poking against your asshole. <i>“I’m in charge here. I’m going to put this manhood you’ve gifted me wherever I like.”</i>");
				else output("\n\n<i>“Imagine having a manhood, and then conjuring up this magic just so a lady can claim you instead,”</i> the zil murmurs. Her hands tightens on your shoulder, and you feel the dildo’s blunt end press against your asshole. <i>“You starwalkers are so strange. So <i>intoxicating</i>.”</i>");
				output("\n\nShe pushes her hips forward, roughly shoving the hardlight penis straight past your sphincter.");
				if(vIdx >= 0) output(" Fucking Void! You gasp in pain, instinctively tightening up against the sudden intrusion.");
				else output(" Even for an ass-pussy as well-trained as yours, that is too much, too soon, particularly as the thing isn’t lubricated. You tighten up instinctively and huff in discomfort.");
				
				pc.buttChange(quinnHardlightVolume());
				
				output("\n\n<i>“Oh! Sorry,”</i> says Quinn, high concern breaking through the husky seductress tones she’s traded in so far. She withdraws so that only the very tip is opening your [pc.anus]. <i>“Did that hurt? I did not mean it to. I have seen my menfolk do it to each other, and they can be very - but I suppose they often coat each other with seed first--”</i>");
				output("\n\nAs calmly as you can, you tell her it’s fine... just to do it slower. Much slower. You close your eyes and concentrate on the smell of her, that sweet, intoxicating scent which lulls you into feeling so soft, so sensual, as she takes a firm grip of you and with small jerks begins to work herself in again. Awkwardly at first, but with increasing confidence, as you direct her with small groans of gratification when she slides that warm, smooth light into you <i>just</i> right, until your [pc.anus] is relaxed and open enough for her to fill you with one nice, long, steady push after another.");
				output("\n\n<i>“Ooh that feels good,”</i> she sighs, her smooth, hard feet wriggling on top of your [pc.legs] as she seeks better leverage to go at you. <i>“And you like that, do you? Like that? And that?”</i> The calm authority is returning to her voice as she gets more into it, ratcheting up how vigorously she thrusts that baton of hard-light into your sensitive back-passage bit by bit. It’s such an intense, smutty sensation, getting held down and filled like that, and arousal bites into you with increasing spirit, the horny smell of lusty zil filling your nose as Quinn pushes into your " + (vIdx >= 0 ? "vaginal walls" : "bowels"));
				if(cIdx >= 0) output(" and the buried bitch button that is your prostate");
				output(".");
				output("\n\n<i>“I... I want to really hammer you now,”</i> she breathes in your ear, pausing for a moment to rest her plated chest on your back, strap-on buried deep in your [pc.ass]. <i>“The - thing is demanding I do. I guess that this is what having a manhood really is like.”</i> Her tube tongue tickles your ear and neck, sucking tip tasting your sweat. <i>“I can, can’t I? You’re ready for it, aren’t you? Say yes. Ask for it. Your Quinn demands it.”</i>");
				output("\n\n<i>“Please fuck me hard, Quinn,”</i> you moan in response, submissive lust thrumming through you");
				if(vIdx >= 0 || cIdx >= 0)
				{
					output(",");
					if(cIdx >= 0) output(" [pc.eachCock] hot and taut against your [pc.belly]");
					if(vIdx >= 0 && cIdx >= 0) output(" and");
					if(vIdx >= 0) output(" [pc.eachVagina] dripping with frustrated lust");
				}
				output(". The zil responds by drawing back, her hands sliding down your flanks until they clasp themselves around your [pc.hips], the hard-light sliding down your walls until the bulbous head is tugging at your sphincter... and then she shoves the whole of it in with one single athletic thrust, her slim thighs thumping against your [pc.ass]. You wail to the luscious intensity of it, probably loud enough for anyone outside the hut to hear. What do you care? Let the whole tribe know how much you enjoy being fucked in the ass by the lady.");
				output("\n\n<i>“You better come back for more of this,”</i> she growls, pumping into you hard, the obdurate dildo digging into you deep with each returning thrust. <i>“You with your star magic, and your honor and bravery... and yet you let me do whatever I want with you in bed. Yes!”</i> She gropes your [pc.chest] greedily with one hand, " + (pc.biggestTitSize() >= 3 ? "hand sinking deep into your soft breast" : "fingers finding " + indefiniteArticle(pc.nippleDescript()) + " and squeezing hard") + ". <i>“You’re everything I want in a " + pc.mf("husband", "wife") + ".”</i>");
				output("\n\nThe sensation of getting drilled like this by a lusty, energetic bee queen is so acute, so filthy, every returning clap of her armored thighs against your inflamed [pc.skinFurScales] driving all other thoughts from your head except how <i>good</i> it is to have your ass in the air and your insides filled with holographic dildo... you wish you could be in this moment forever... but being trapped in a still environment with an aroused zil, and the incessant grind and pressure of her pseudo-cock on your " + (vIdx >= 0 ? "tender walls" : "inner walls"));
				if(cIdx >= 0) output(" and bulging prostate");
				output(" is inescapably ratcheting your lust tighter, and tighter, and tighter, until you explode.");
				if(cIdx >= 0) output("\n\n[pc.Cum] is forced out of [pc.eachCock] in " + (cumQ >= 500 ? "hefty ribbons" : "dribbles and gobbets") + ", helplessly engorged by the internal milking Quinn’s giving your boy parts. You are wonderfully powerless to prevent it; you can only tense up again and again, [pc.cumVisc] seed forced out of you by the incessant thrust of your regal mistress’s strap-on.");
				if(vIdx >= 0) output("\n\n[pc.EachVagina] tremble" + (pc.vaginas.length == 1 ? "s" : "") + " in orgasm" + (cIdx >= 0 ? " too" : "") + ", flush with pheromonal lust, juicing itself in frustration at the rough penetration " + (pc.vaginas.length == 1 ? "it" : "they") + " can feel but aren’t getting. That frustration only heightens the submissive thrill of it; of <i>course</i> your pleasure should be denied, of course you must take it in the ass and get your cummies inferred from source, if your mistress demands it.");
				output("\n\nThe zil laughs as you shudder and moan around her, hands clutching up at the rough blankets, and retains a firm grip of your [pc.hip], continuing to hump you regardless, pushing that obdurate, luminescent knob into your quivering, tenderised back passage regardless. She’s still getting the same amount of pleasurable feedback, after all; she groans with pleasure every time she holsters the entirety of the thing beyond your opened sphincter. You’re a senseless, gurning mess");
				if(cIdx >= 0) output(", every last drop of [pc.cum] milked out of you,");
				output(" long before her passionate, hefty thrusts have begun to diminish.");
				output("\n\n<i>“So I myself do not experience the great joy?”</i> she queries at last, still mired deep within you. You can only manage a breathless groan in response, and shudder when she vigorously stirs herself within you");
				if(vIdx >= 0) output(", digging into your pussy walls");
				output(". <i>“I do not get to feel what it is like to shoot seed into you? Such... captivating magic, yet so taunting.”</i> You twitch as a chitinous hand slaps into your [pc.ass]. <i>“You are bad, my champion, for leading me on this way. The only honorable course of action is for you to bring this magic with you every time you visit, and then bend over for me enough times that I am satisfied.”</i> The hard-light dildo gradually withdraws, the bulbous end dragging at your [pc.anus] as it finally parts company with it. <i>“Mmm. I am Quinn! So it shall be.”</i>");
				output("\n\nYou collapse onto your side and look back at her, that small, enigmatic smirk of hers firmly in place, stroking and admiring the hard-light penis you gifted her. After you’ve rested a bit, you show her how to turn it off, after which her interest wanes and you manage to get your [pc.lowerGarments] back off her. There’s definitely still a gleam in her eye though, as she watches you [pc.move] back to her throne afterwards. You could have just created a monster there.");
			}
			else
			{
				output("<i>“You’ve come to pay tribute, have you?”</i> Quinn’s smile widens, becomes positively licentious. <i>“Come, then. Give me the magic.”</i>");
				output("\n\nYou bite your lip demurely, slip your [pc.lowerGarments] off, and hand them over to Quinn. Her fingers snap the elastic once she’s pulled the [pc.lowerGarment] up to waist level, admiring the unnaturally fine material, before they curl around the main event. A strange note escapes her throat as she fondles the hard-light erection projecting out of the front of the commandeered underwear, still enthralled by the sensations it brings.");
				output("\n\n<i>“I would never become male myself...”</i> she groans, golden eyes half-lidded. <i>“Driven by such urges, I see why their minds are constantly muddied by it... but to be one for a time, yes. This is an enjoyable thing.”</i>");
				output("\n\nThere’s something very arousing about being bare before the proud zil whilst she’s still clad tight in her chitinous plates, with your underwear over the top; rather BDSM-y. She definitely knows what she’s doing when she slides her upper armor back into place too as she eyes you with that small, coolly amused smile of hers, her pert breasts receding behind harsh, gleaming jet.");
				output("\n\n<i>“Touch me,”</i> your black-clad queen husks. <i>“Like you know how.”</i>");
				output("\n\nYou reach out, grasping her faux-cock yourself and begin to fondle it, its warmth and sturdiness shifting underneath your palm. Quinn sighs as you go on, her small mouth opening to the pleasure you’re stroking into her through the glowing horn you’ve gifted her. Her expression turns wilder, more feral, golden irises fixed upon you, making your heart beat faster. Aglow with submission, you hold her gaze as you bend down and lick the blunt, flavorless end, drawing another amazed, lusty groan out of her.");
				output("\n\n<i>“Bend over,”</i> she demands, <i>“like a good " + pc.mf("boy", "girl") + ". Bite the blankets if you like: I will be gentle only for a time.”</i>");
				output("\n\nWith a delighted shiver you do so, arching your back and giving your [pc.ass] a little wiggle, showcasing it to its best advantage. You squeak as a thin, smooth hand slaps down on your shoulder, gripping you hard, whilst another gives a buttcheek a good, hard grope. A pillar of hard, warm light lays itself in your crack, sawing back and forth over your [pc.anus].");
				output("\n\n");
				if(vIdx >= 0) output("<i>“Sometimes I think about taking you in the womanhood,”</i> the zil asks, angling her strap-on so the blunt end shifts over your taint and then rubs downwards over [pc.eachVagina], brushing over [pc.eachClit]. Then her hand tightens on your shoulder; you feel the dildo sliding back up, poking against your asshole. <i>“But then I remember how tight you feel here. And how sweetly you squeak when I put it there.”</i>");
				else output("<i>“I can see why my men enjoy doing this,”</i> the zil murmurs. Her hands tightens on your shoulder, and you feel the dildo’s blunt end press against your asshole. <i>“I should do it with all of them. Remind them of their place.”</i>");
				output("\n\nSlowly she presses forward, opening up your [pc.anus] by degrees, edging in, edging out, introducing more and more of that hard, warm protrusion into your bowels. She’s gotten the gist of this disturbingly quickly. Her own murmurs of pleasure, as she gets to taste more and more of your " + ((pc.analCapacity() < quinnHardlightVolume() || pc.ass.looseness() <= 1) ? "tight" : "well-trained") + " little heinie, increasing gradually in passion and volume, inform you that the textual interface is working just fine. Then she slides into you <i>just</i> right, that big, thick pseudo-cock filling you right up, and you can’t help but moan, fingers tightening into the bed.");
				
				pc.buttChange(quinnHardlightVolume());
				
				output("\n\n<i>“Ooh that feels good,”</i> she sighs, her smooth, hard feet wriggling on top of your [pc.legs] as she seeks better leverage to dip into you. <i>“And you like that, do you? Of course you do. You like it because your Quinn loves it, and you live to please her.”</i> The calm authority in her voice fills your mind as she gets more and more into it, ratcheting up how vigorously she thrusts that baton of hard-light into your sensitive back-passage bit by bit. It’s such an intense, smutty sensation, getting held down and filled like this, and arousal bites into you with increasing spirit, the horny smell of lusty zil filling your nose as Quinn pushes into your " + (vIdx >= 0 ? "vaginal walls" : "bowels"));
				if(cIdx >= 0) output(" and the buried bitch button that is your prostate");
				output(".");
				output("\n\n<i>“I’m going to really hammer you now,”</i> she breathes in your ear, pausing for a moment to rest her plated chest on your back, strap-on buried deep in your [pc.ass]. <i>“The - thing is demanding I do. And I am as one with it.”</i> Her tube tongue tickles your ear and neck, sucking tip tasting your sweat. <i>“I can, can’t I? You’re ready for it, aren’t you? Say yes. Beg for it. Your Quinn demands it.”</i>");
				output("\n\n<i>“Please fuck me hard, Quinn,”</i> you moan in response, submissive lust thrumming through you");
				if(vIdx >= 0 || cIdx >= 0)
				{
					output(",");
					if(cIdx >= 0) output(" [pc.eachCock] hot and taut against your [pc.belly]");
					if(vIdx >= 0 && cIdx >= 0) output(" and");
					if(vIdx >= 0) output(" [pc.eachVagina] dripping with frustrated lust");
				}
				output(". The zil responds by drawing back, her hands sliding down your flanks until they clasp themselves around your [pc.hips], the hard-light sliding down your walls until the bulbous head is tugging at your sphincter... and then she shoves the whole of it in with one single athletic thrust, her slim thighs thumping against your [pc.ass]. You wail to the luscious intensity of it, probably loud enough for anyone outside the hut to hear. What do you care? Let the whole tribe know how much you enjoy being fucked in the ass by the lady.");
				output("\n\n<i>“You better come back for more of this,”</i> she growls, pumping into you hard, the obdurate dildo digging into you deep with each returning thrust. <i>“You with your star magic, and your honor and bravery... and yet you let me do whatever I want with you in bed. Yes!”</i> She gropes your [pc.chest] greedily with one hand, " + (pc.biggestTitSize() >= 3 ? "hand sinking deep into your soft breast" : "fingers finding " + indefiniteArticle(pc.nippleDescript()) + " and squeezing hard") + ". <i>“You’re everything I want in a " + pc.mf("husband", "wife") + ".”</i>");
				output("\n\nThe sensation of getting drilled like this by a lusty, energetic bee queen is so acute, so filthy, every returning clap of her armored thighs against your inflamed [pc.skinFurScales] driving all other thoughts from your head except how <i>good</i> it is to have your ass in the air and your insides filled with holographic dildo... you wish you could be in this moment forever... but being trapped in a still environment with an aroused zil, and the incessant grind and pressure of her pseudo-cock on your " + (vIdx >= 0 ? "tender walls" : "inner walls"));
				if(cIdx >= 0) output(" and bulging prostate");
				output(" is inescapably ratcheting your lust tighter, and tighter, and tighter, until you explode.");
				if(cIdx >= 0) output("\n\n[pc.Cum] is forced out of [pc.eachCock] in " + (cumQ >= 500 ? "hefty ribbons" : "dribbles and gobbets") + ", helplessly engorged by the internal milking Quinn’s giving your boy parts. You are wonderfully powerless to prevent it; you can only tense up again and again, [pc.cumVisc] seed forced out of you by the incessant thrust of your regal mistress’s strap-on.");
				if(vIdx >= 0) output("\n\n[pc.EachVagina] tremble" + (pc.vaginas.length == 1 ? "s" : "") + " in orgasm" + (cIdx >= 0 ? " too" : "") + ", flush with pheromonal lust, juicing itself in frustration at the rough penetration " + (pc.vaginas.length == 1 ? "it" : "they") + " can feel but aren’t getting. That frustration only heightens the submissive thrill of it; of <i>course</i> your pleasure should be denied, of course you must take it in the ass and get your cummies inferred from source, if your mistress demands it.");
				output("\n\nThe zil laughs as you shudder and moan around her, hands clutching up at the rough blankets, and retains a firm grip of your [pc.hip], continuing to hump you regardless, pushing that obdurate, luminescent knob into your quivering, tenderised back passage regardless. She’s still getting the same amount of pleasurable feedback, after all; she groans with pleasure every time she holsters the entirety of the thing beyond your opened sphincter. You’re a senseless, sweaty mess");
				if(cIdx >= 0) output(", every last drop of [pc.cum] milked out of you,");
				output(" long before her passionate, hefty thrusts have begun to diminish.");
				output("\n\n<i>“You have pleased your Quinn,”</i> she declares at last, still mired deep within you. You can only manage a breathless groan in response, and shudder when she vigorously stirs herself within you");
				if(vIdx >= 0) output(", digging into your pussy walls");
				output(". <i>“But the fact I do not get great joy out of this means you must continue paying tribute like this, many more times.”</i> A teasing, loving hand strokes your [pc.hair] and back. <i>“You do not mind, do you? No, of course not. You love being my good, obedient champion.”</i>");
				output("\n\nYou collapse onto your side and look back at her, that small, enigmatic smirk of hers firmly in place, stroking and admiring the hard-light penis you gifted her. After you’ve rested a bit, you show her how to turn it off, after which her interest wanes and you manage to get your [pc.lowerGarment] back off her. There’s definitely still a gleam in her eye though, as she watches you daintily [pc.move] back to her throne afterwards. She’s insatiable.");
			}
			output("\n\n");
			
			processTime(55);
			// Lust reset, anus looseness up
			pc.orgasm();
			
			IncrementFlag("SEXED_QUINN");
			IncrementFlag("QUINN_HARDLIGHT_PEGGED");
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "cowzil":
			showQuinn(true);
			
			if(flags["QUINN_HARDLIGHT_COWZIL"] == undefined)
			{
				output("You’re the one that’s brought the weird piece of starwalker magic into the bedroom, so you guess you’re the one who should be doing the running here. You shift over on the bed towards the wide-eyed zil, peppering her round jawline with kisses, breathing in her sweet, horny scent as your fingers find her smooth, black breastplate. It slides to one side easily in your hand, exposing her soft, pert breast to your greedy, questing fingers.");
				output("\n\nQuinn hums deep in her throat, pleased as you stroke her nipple, bringing it to a lovely, sensitive point... but her eyes are still on the glowing pseudo-cock sprouting from your [pc.lowerGarment]. You sigh into her neck as you feel her spread her fingers around its thick base, experimentally shifting it upwards, spreading wonderful tactile feedback through your [pc.groin].");
				output("\n\n<i>“Is that what it feels like?”</i> she asks, curiosity and lust rolling over each other in her voice. <i>“To be male?”</i>");
				output("\n\n");
				if(cIdx < 0 && pc.cockVirgin) output("Since you discovered the magic of hard-light strap-ons you’ve never felt an urge to find out, and you tell her as much with gusto.");
				else output("You tell her it’s better in most ways. Less mess, for instance. And the person using it is never going to get TOO excited, if she knows what you mean.");
				output("\n\nThat seems to satisfy her. Her questioning grin widens, her eyes returning to your face as she opens her hips and allows her groin-plate, also, to slither to one side. You are instantly hit with the suffocating, horny smell of a female zil in heat, and you pause, momentarily blown away on a sweet, pheromonal breeze");
				if(vIdx >= 0) output(", [pc.femcum] sluicing through [pc.eachVagina] and staining your [pc.lowerGarments]");
				output(". Thin, black hands press gently into your [pc.chest], coaxing you downwards onto the furs. Your heart thuds as Quinn leans over you, candlelight flickering on her teeth and armor, and wraps her long, elegant fingers around the base of your hot erection.");
			}
			else
			{
				output("You make your intentions clear by shifting over on the bed towards the lounging zil peppering her round jawline with kisses, breathing in her sweet, horny scent as your fingers find her smooth, black breastplate. It slides to one side easily in your hand, exposing her soft, pert breast to your greedy, questing fingers.");
				output("\n\nYou’ve left your [pc.lowerGarment] exposed, the hard-light erection hanging out there like a leading question, and it’s answered a couple of moments later. You sigh into Quinn’s neck as you feel her spread her fingers around its thick base, experimentally shifting it upwards, spreading wonderful tactile feedback through your [pc.groin].");
				output("\n\n<i>“Our tool,”</i> she says, proud and possessive. <i>“What great joy it brings us.”</i>");
				output("\n\nHer teasing grin widens as she allows her groin-plate to slither to one side. You are instantly hit with the suffocating, horny smell of a female zil in heat, and you pause, momentarily blown away on a sweet, pheromonal breeze");
				if(vIdx >= 0) output(", [pc.femcum] sluicing through [pc.eachVagina] and staining your [pc.lowerGarments]");
				output(". Thin, black hands press gently into your [pc.chest], coaxing you downwards onto the furs. Your heart thuds as Quinn leans over you, candlelight flickering on her teeth and armor, and wraps her long, elegant fingers around the base of your hot erection.");
			}
			output("\n\n<i>“Bigger than my homegrown warriors,”</i> she remarks, a vein of husky excitement running through her tone. You groan softly as she moves her grip upwards, trails her fingertips over the glowing head, then slowly slinks them down again. <i>“You mustn’t show it to them. They will get very jealous.”</i>");
			output("\n\nHer cool thigh slides down your [pc.hip] as she climbs on top of you, boobs and abdomen jouncing slightly as she leads the oozing warmth of her honey-cunt up the underside of your [pc.cockOrStrapon -1]. She still has her hand around the base of it, clutching it tightly, lining it up with assured movements like a prized, personal tool - which you suppose it is. Your mind is drowned in the deep, sweet smell of zil, leaving nothing but an open, sugary eagerness, a sunny will to do exactly as your sexy, assertive queen demands.");
			output("\n\n<i>“That’s it,”</i> she sighs, other hand pressing down on your shoulder as she spreads her slick lips over your [pc.cockOrStraponHead -1]. <i>“You brought the tool. So now lie back and let me do with it as I will...”</i> You can’t help but groan and twitch as she slowly sits herself down. The silken feel of her narrow tunnel advancing down that glowing strap-on, drooling honey over the base, soaking into your [pc.lowerGarment] is so good you can feel the sweetness of Nirvana on your [pc.skinFurScales] and tongue. Instinctively you reach out and clasp her hourglass waist as she takes a good portion of the sturdy hard-light into her tight tunnel; you groan slightly as you feel syrup drip lazily down the rest of it. She strokes your hands fondly, before gently but firmly taking them off, leading them back and planting them on the thick, wide femurs of the bone trophy behind you.");
			output("\n\n<i>“Keep them there,”</i> Quinn murmurs. The pheromone fug seems to intensify, blood reaching up to your [pc.skin], and another wordless sound of pained joy escapes your [pc.lips] as she begins to move her hips, stirring you within her oozing, limber warmth. All your attention is upon how wonderful it feels when she finds her rhythm and begins to briskly ride you, tightening her strong athletic thighs around your waist, locking herself into you enthusiastically.");
			output("\n\n<i>“Such a strange, unnatural tool,”</i> she husks, fingers hooked around your shoulders. <i>“And yet it feels so right, so... yes!”</i> She throws her head towards the ceiling and emits a savage howl, bucking around you ferociously, petite tits jouncing up and down. The strap-on throbs in response, intense feedback pulsing into your groin, making you writhe beneath you. For several, ecstatic moments you thrash together gleefully, until finally the zil calms down enough for her to find words again.");
			output("\n\n<i>“And it doesn’t... you don’t reach the great joy?”</i> she asks, looking down at you, orange-cheeked and panting slightly, still firmly embedded on you. It takes you a few dazed moments for you to realize what she means.");
			output("\n\n<i>“No,”</i> you reply croakily. <i>“Not like that.”</i>");
			output("\n\n<i>“Good.”</i> You blink slightly as she begins to creak into action again, athletic hips clenching around yours, find a slow but purposeful rhythm. <i>“It wouldn’t do for you to finish before Quinn has got everything she needs, would it? Yes... I <i>like</i> this tool of yours a lot.”</i> A particularly hefty push of hers makes you inhale sharply, and a fresh flood of sugary pheromones overwhelms your senses. All is eager yellow. All is horny sugar.");
			output("\n\nQuinn slowly but stubbornly pumps her lean, round butt towards your [pc.belly] and then back, working your giddy pseudo-erection firmly. <i>“Yeessss...”</i> she breathes, stroking your " + (pc.hasBeard() ? "[pc.beard]" : "chin") + " and touching your [pc.chest]. <i>“You lie back and let your Quinn own you. Let me live your deeds and absorb your spirit.”</i>");
			output("\n\nFor a little while she rides you slowly, giving her time to");
			if(pc.isLactating()) output(" curiously play with your [pc.nipples], cooing when they spring leaks in response to her tweaks and caresses, descending to suckle [pc.milk] from you hungrily");
			else output(" curiously playing with your [pc.nipples], caressing and pulling at them until they are tender and " + (pc.hasErectNipples() ? "erect" : "bee-stung"));
			output(". Before too long though she begins to wring and clench you within herself vigorously again, snarling and clutching at your flesh like a wolverine attached to its prey.");
			output("\n\nIt’s a kind of pleasurable hell, letting an embodiment of insectile entitlement and pent-up libido sit on top of you and wring a cock that cannot cum inside her slick, drooling cunt, energetically levering herself to first one howling orgasm and then another. The pheromone fug, and the calm, sonorous words that came with it, are so powerful though, so alluring. When she cries out with delight, clenching her hips around yours and spattering clear syrup onto your [pc.belly] and [pc.legs], sheerest joy lights up your mind - you have pleased your Queen! - and the fact the seething pleasure in your [pc.groin] can find no release is only the right and proper price to pay.");
			output("\n\n<i>“Very good,”</i> she husks at last, still sat proudly on top of you. Her chitin-gloved hands slide over your sweaty [pc.chest], exploring alien flesh and feeling your muscles with sweeping, languorous massages. <i>“You will bring this tool with you again, next time. It is... very pleasing.”</i> She disengages from it, the slickness of her pussy walls carrying through to you perfectly as it finally comes free in a small gush of honey that drools all over your [pc.legs], and then drops to one side, the exploration of your naked, ravished body continuing with little flicks of her golden pupils. Although her smell remains overpowering, the pheromonal imperative of it seems to be fading - nothing stops you from slowly reaching out and clasping her thigh and beneath the arm, do a bit of tired, fond exploring yourself. Some part of you regrets that all-encompassing submissive goldenness receding. Wouldn’t it be nice to stay here forever as your savage queen’s fuck-pet?...");
			output("\n\nThere’s a click. The ghostly light filling the close space abruptly goes out, taking with it that intoxicating protrusion of lust and hard texture between your [pc.thighs]. Quinn smirks at you, withdrawing her hand from your [pc.lowerGarment].");
			output("\n\n<i>“You were right,”</i> she murmurs. Her hand touches you fondly behind the ear. <i>“Less mess. This is a fine gift you have brought me. We shall use it together often.”</i>");
			output("\n\nYou pass " + (flags["QUINN_MAIDENS_MET"] == undefined ? "a couple of handmaidens" : "Fetch and Carry") + " on the path from the Quinn’s yurt a couple of minutes later, laden with heated towels and sloshing buckets.");
			if(flags["QUINN_MAIDENS_SEXED"] != undefined) output(" They give you smirking, lingering gazes as they pass you.");
						
			processTime(45);
			// ++Lust
			pc.changeLust(50);

			output("\n\n");
			
			IncrementFlag("SEXED_QUINN");
			IncrementFlag("QUINN_HARDLIGHT_COWZIL");
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}


// Part 4: The Pollen Dance
// Activates if PC has had sex with her, PC has genitals, has used all talk options, Quest fully resolved (i.e. now trading with Esbeth or PC has seen plantation burnt down), and PC uses Talk again.
public function canQuinnTalkPollenDance():Boolean {
	if(flags["QUINNFEST_COMPLETE"] != undefined) return false;
	if(flags["QUINNFEST_TALKED"] != undefined) return false;
	if(pc.hasStatusEffect("Quinn Talk Cooldown")) return false;
	return ( flags["SEXED_QUINN"] != undefined && pc.hasGenitals()
		&&	flags["QUINN_TALK_HERSELF"] != undefined && flags["QUINN_TALK_ESBETH"] != undefined && flags["QUINN_TALK_NALEEN"] != undefined
		&&	flags["PQ_RESOLUTION"] > 0
	);
}
public function quinnTalkPollenDanceMenu(response:String = "intro"):void
{
	// [Why Group?] {[Kane n Lah] / [Kane]} [Spectate] [Hell Yeah]
	clearMenu();
	if(response == "why group") addDisabledButton(0, "Why Group?", "Why Group?", "You’ve just discussed this!");
	else addButton(0, "Why Group?", quinnTalkPollenDance, "why group", "Why Group?", "Ask why it has to be a gangbang.");
	if(rkLahIsFree())
	{
		if(response == "kane") addDisabledButton(1, "Kane & Lah", "Kane and Lah", "You’ve just discussed this!");
		else addButton(1, "Kane & Lah", quinnTalkPollenDance, "kane", "Kane and Lah", "There must be a reason why those two seem to be excluded from the equation here...");
	}
	else
	{
		if(response == "kane") addDisabledButton(1, "Kane", "Kane", "You’ve just discussed this!");
		else addButton(1, "Kane", quinnTalkPollenDance, "kane", "Kane", "You think you know who the strongest male zil in the tribe is. But the implication seems to be that the big, scowling lug will be absent?");
	}
	if(response == "spectate") addDisabledButton(13, "Spectate", "Spectate", "You’ve just discussed this!");
	else addButton(13, "Spectate", quinnTalkPollenDance, "spectate", "Spectate", "A big zil gangbang does not appeal. Say you’d rather sit this one out.");
	if(response == "hell yeah") addDisabledButton(14, "Hell Yeah", "Hell Yeah", "You’ve just discussed this!");
	else addButton(14, "Hell Yeah", quinnTalkPollenDance, "hell yeah", "Hell Yeah", "A big zil gangbang? Where do you sign?");
	
	// Appears after PC uses [Why Group?]
	if(pc.hasCock() && flags["QUINNFEST_TALK_WHY_GROUP"] != undefined)
	{
		if(response == "just me") addDisabledButton(10, "Just Me", "Just Me", "You’ve just discussed this!");
		else if(flags["QUINNFEST_TALK_JUST_ME"] != undefined) addDisabledButton(10, "Just Me", "Just Me", "You already decided against that!");
		else addButton(10, "Just Me", quinnTalkPollenDance, "just me", "Just Me", "You have no intention of sharing your Quinn around. You’re virile enough to knock her up on your own!");
	}
}
public function quinnTalkPollenDance(response:String = "intro"):void
{
	clearOutput();
	author("Nonesuch");
	
	switch(response)
	{
		case "intro":
			showQuinn();
			
			output("<i>“Talk,”</i> says Quinn, absently. Her golden irises rest upon you for a silent couple of moments. <i>“Yes, talk. We should do that, Steele. Come closer.”</i>");
			output("\n\nYou move close enough to her carved throne to lean on one of the armrests. Quinn’s body language is as relaxed and poised as ever, but when she speaks next it is low and serious. Her sweet, cloying perfume coils into your nostrils as she speaks.");
			output("\n\n<i>“The Pollen Festival is almost upon us, when we celebrate the fruit and suns and breezes which allow us to produce the golden sweetness: the source of all our joy and strength. We have much to celebrate this cycle, with");
			if(flags["PQ_RESOLUTION"] == 2) output(" our glorious victory over the landstealers");
			else output(" the interesting peace you have brought upon us");
			output(". It is a blessed time to plant babies. I want a baby.”</i> She pauses again, eyes upon the to-ing and fro-ing of her tribe. <i>“This is important to me, Steele. My mother only had one child - one that lived. I do not come from fertile stock. Zil leaders that do not produce children, do not last long. I must do all I can to have a child. So we shall perform the Droning Ball. I want you to take part.”</i>");
			output("\n\n");
			
			processTime(3);
			
			clearMenu();
			addButton(0, "Next", quinnTalkPollenDance, "next");
			break;
		case "next":
			showQuinn();
			
			if(pc.isFemale())
			{
				output("<i>“Um...”</i> How to put this. <i>“I don’t know if you’ve noticed, Quinn, but I can’t...”</i>");
				output("\n\nA wry smile reappears on the zil’s face.");
				output("\n\n<i>“Put a baby in my belly? Perhaps not literally, Steele. But you are a good omen to my tribe. Your coming");
				if(flags["PQ_RESOLUTION"] == 1) output(" dispelled the lying magic of the word wolf, and began our peace with the starwalkers of the white hives");
				else output(" heralded our victory over the terrible landstealers, and showed we need fear no-one");
				output(". Also, you are <i>very</i> exciting. My drones will outperform themselves if you are involved. Also...”</i> She puts her hand on yours, on the armrest. <i>“If I were in your place, I would ask: Why should Quinn be blessed with a baby, and not me? If you want that, my champion, it shall be yours.”</i>");
				output("\n\nYou ask what the Droning Ball entails.");
			}
			else if(pc.isMale() || pc.isHerm())
			{
				output("<i>“You... want me to be the father?”</i>");
				output("\n\n<i>“One of the fathers,”</i> Quinn corrects with a smile. <i>“Ordinarily I would have you compete with the others for the honor of pollinating your Quinn. But you are a good omen to my tribe. Your coming");
				if(flags["PQ_RESOLUTION"] == 1) output(" dispelled the lying magic of the word wolf, and heralded the beginning our peace with the starwalkers of the white hives");
				else output(" heralded our victory over the terrible landstealers, and showed we need fear no-one");
				output(". Also, you are <i>very</i> exciting. My drones will outperform themselves if you are involved.”</i> She puts her hand on yours on the carved armrest, squeezes it. <i>“I want you to be involved, Steele. You have demonstrated your great strength and cleverness already. Your place in the Ball is assured.”</i>");
				output("\n\nYou ask what it entails.");
			}
			output("\n\n<i>“There shall be a grand feast. Much dancing and merrymaking. Then all the menfolk who wish to sire my heir shall compete.”</i> She points at the circle of stones, in front of her throne. <i>“It is a test of will and cunning as much as strength, for in order to succeed you must not have over-indulged beforehand, you see?”</i> She squeezes your hand. <i>“Then we shall choose the most gallant, the most fetching, the most virile, you and I - two, three, maybe even five? - and then we shall... ball. All night. If you like.”</i>");
			output("\n\nQuinn’s eyes have grown slightly distant.");
			output("\n\n");
			
			processTime(3);
			
			quinnTalkPollenDanceMenu();
			break;
		case "why group":
			showQuinn();
			
			if(pc.isFemale())
			{
				output("<i>“Why does there need to be more than one male?”</i> you ask. <i>“Couldn’t you just choose the best?”</i>");
			}
			else if(pc.isMale() || pc.isHerm())
			{
				output("<i>“Why does there need to be more than one male?”</i> you ask, thrusting out your [pc.chest] as subtly as you can.");
			}
			output("\n\n<i>“I want the best chance I can possibly create,”</i> replies Quinn. Her eyes are on her tribe, but she again speaks low and serious, so that only you can hear. <i>“Perhaps one does not have strong enough seed, but another... you see? Your presence, at the time of the Pollen Festival, and the Droning Ball... all of these things, yes. I am Quinn, and I am the daughter of my mother. I cannot leave it to fate. Also <b>I</b> want an heir. If there are many fathers, it shall belong to the whole tribe, and no one male can claim a stake to my throne.”</i>");
			output("\n\n");
			
			processTime(1);
			flags["QUINNFEST_TALK_WHY_GROUP"] = 1;
			
			quinnTalkPollenDanceMenu(response);
			break;
		case "kane":
			showQuinn();
			
			if(pc.isFemale())
			{
				if(rkLahIsFree()) {
					output("You would’ve thought if she were aiming to make a baby out of the strongest and smartest material in the village you know who her two candidates would be, and you say as much.");
					output("\n\n<i>“The word wolf?”</i> She laughs, a single musical note. <i>“No. I believe his tastes run naturally in a different direction.”</i> She points discretely; the rangy ausar is at this moment chatting animatedly with a young male zil, who judging by his blush and toeing of the dirt is rather flustered by the attention.");
					output("\n\n<i>“As for Kane: An excellent male to have, in times of war. In times of peace? He chafes under my rule. He is proud enough to disdain being one of the fathers of his Quinn’s child. No, he has his sights set on... loftier ambitions, I think.”</i> She gazes at you steadily.");
				}
				else {
					output("You would’ve thought if she were aiming to make a baby out of the strongest material in the village you know who the candidate would be, and you say as much.");
					output("\n\n<i>“Kane? An excellent male to have, in times of war. In times of peace? He chafes under my rule. He is proud enough to disdain being one of the fathers of his Quinn’s child. No, he has his eyes set on... loftier ambitions, I think.”</i> She gazes at you steadily.");
				}
			}
			else if(pc.isMale() || pc.isHerm())
			{
				if(rkLahIsFree()) {
					output("You would’ve thought if she were aiming to make a baby out of the strongest and smartest material in the village you know who her two candidates would be, and you say as much.");
					output("\n\n<i>“The word wolf?”</i> She laughs, a single musical note. <i>“No. I believe his tastes run naturally in a different direction.”</i> She points discretely; the rangy ausar is at this moment chatting animatedly with a young male zil, who judging by his blush and toeing of the dirt is rather flustered by the attention.");
					output("\n\n<i>“As for Kane: An excellent male to have, in times of war. In times of peace? He chafes under my rule. He is proud enough to disdain being one of the fathers of his Quinn’s child. No, he has his sights set on... other things, I think.”</i> She gazes at you steadily.");
				}
				else {
					output("You would’ve thought if she were aiming to make a baby out of the strongest material in the village you know who the candidate would be, and you say as much.");
					output("\n\n<i>“Kane? An excellent male to have, in times of war. In times of peace? He chafes under my rule. He is proud enough to disdain being one of the fathers of his Quinn’s child. No, he has... loftier ambitions, I think.”</i> She gazes at you steadily.");
				}
			}
			output("\n\n");
			
			processTime(1);
			
			quinnTalkPollenDanceMenu(response);
			break;
		case "spectate":
			showQuinn();
			
			if(pc.isFemale())
			{
				output("As gracefully as you can, you say you’d be honored to be present at their festival - but you’d sooner not get impregnated by half-a-dozen zil guys.");
				output("\n\n<i>“I understand. The presence of my good omen at my chair shall be enough,”</i> Quinn replies. She eyes you knowingly. <i>“And perhaps a nice boy will take you to his hearth instead, hmm? It is an exciting time of the cycle.”</i>");
			}
			else if(pc.isMale() || pc.isHerm())
			{
				output("As gracefully as you can, you say you’d be honored to be present at their festival - but you’d sooner not be one dick in a parade of them.");
				output("\n\n<i>“I understand. The presence of my good omen at my chair shall be enough,”</i> Quinn replies. She eyes you knowingly. <i>“And perhaps a nice girl will take you to her hearth instead, hmm? It is an exciting time of the cycle.”</i>");
			}
			output("\n\n");
			
			processTime(1);
			flags["QUINNFEST_TALKED"] = -1;
			
			clearMenu();
			addButton(0, "Next", quinnTalkPollenDance, "finish");
			break;
		case "hell yeah":
			showQuinn();
			
			if(pc.isFemale())
			{
				output("The prospect of several zil doing you every which way until dawn is already firing off neurons in your brain, and you tell Quinn you’ll happily participate.");
			}
			else if(pc.isMale() || pc.isHerm())
			{
				output("The prospect of doing Quinn with one or two overexcited zil bois every which way until dawn is already firing off neurons in your brain, and you tell her you’ll happily participate.");
			}
			output("\n\n<i>“I am very pleased to hear that.”</i> She squeezes your hand again, and smiles at you happily. <i>“My good omen.”</i>");
			output("\n\n");
			
			processTime(1);
			flags["QUINNFEST_TALKED"] = 1;
			
			clearMenu();
			addButton(0, "Next", quinnTalkPollenDance, "finish");
			break;
		case "just me":
			showQuinn();
			
			output("<i>“You don’t need a ball of random guys to put a baby in you.”</i> You squeeze her hand back, looking her in the eye with all the smolder you can muster. <i>“I will do it. On my own. If the father is me, you don’t have to worry about claims to your throne: you know I have the birthright to be a... " + pc.mf("Ken", "Quinn") + " of a... tribe... regardless.”</i>");
			output("\n\nQuinn stares back at you, spots of tangerine appearing in her cheeks and a strange smile trembling on her lips. You think, for the very first time you’ve known her, she’s flustered. A moment later, the tremble is swallowed by trademark composure.");
			output("\n\n<i>“You wish to claim sole right to me, Steele?”</i> she breathes. <i>“How very bold of you. How very... daring.”</i> She wriggles on her perch a bit, evidently enjoying herself. <i>“I can guarantee your place in the Ball, but if you would dare declare yourself the only drone suitable to mate with Quinn, then you would have to stave off every other male who would challenge you. On your own. By the rules of the circle.”</i>");
			output("\n\n");
			
			processTime(2);
			
			clearMenu();
			addButton(0, "Yes", quinnTalkPollenDance, "just me yes", "Yes", "Kicking a bunch of bee boi butts beforehand will only make your dick harder.");
			addButton(1, "No", quinnTalkPollenDance, "just me no", "No", "Maybe not the best idea.");
			break;
		case "just me no":
			showQuinn();
			
			output("<i>“I admire your smartness as much as your strength, Steele,”</i> Quinn says, with an affectionate pat on the hand. <i>“The Droning Ball will be wonderful - set aside your inhibitions and you will enjoy yourself. You’ll see.”</i>");
			output("\n\n");
			
			processTime(1);
			flags["QUINNFEST_TALK_JUST_ME"] = -1;
			
			quinnTalkPollenDanceMenu("just me");
			break;
		case "just me yes":
			showQuinn();
			
			output("<i>“Well, then.”</i> Quinn touches your [pc.chest] lightly, trails her thin, black fingers down your " + (pc.isChestCovered() ? "[pc.upperGarmentOuter]" : "[pc.skinFurScales]") + ", fire guttering beneath her calm, cool expression. <i>“I look forward to seeing your performance in the ring. My champion.”</i>");
			output("\n\n");
			
			processTime(1);
			flags["QUINNFEST_TALKED"] = 1;
			flags["QUINNFEST_TALK_JUST_ME"] = 1;
			
			clearMenu();
			addButton(0, "Next", quinnTalkPollenDance, "finish");
			break;
		case "finish":
			showQuinn();
			
			output("<i>“Come back when the suns are beginning to set.”</i> Quinn dismisses you with a cool wave of her hand, and in a voice clear enough to resonate around the open space below her throne and. <i>“We shall begin the Pollen Festival as soon as my most honored guest is present.”</i>");
			output("\n\nAn excited murmur thrums around the circle, and the rather leisured atmosphere of the zil village becomes noticeably more purposeful.");
			output("\n\n");
			
			processTime(5);
			
			// Boot PC back to Chieftain’s Circle square. Add [Festival] to Quinn’s main options
			currentLocation = "12. Zil Village Winnar";
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

public function quinnFestivalActiveHours():Boolean
{
	return ((hours == 16 && minutes >= 45) || (hours > 16 && hours <= 19));
}
public function quinnFestivalButton(btnSlot:int = 4):void
{
	if(flags["QUINNFEST_COMPLETE"] == undefined && flags["QUINNFEST_TALKED"] != undefined)
	{
		// Ghost out unless time is 16:45-19:00
		if(!quinnFestivalActiveHours()) addDisabledButton(btnSlot, "Festival", "Festival", "You don’t think it’s the right time yet. Quinn indicated the early evening. Try checking back between 16:45 - 19:00.");
		else addButton(btnSlot, "Festival", quinnFestival, undefined, "Festival", "Tell Quinn you’re ready for the Pollen Festival to begin.");
	}
}
public function quinnFestivalCircleMenu():void
{
	// Remove each option as it’s used, except the village/circle interchange. Action is moved on once PC uses [Dance].
	// [Eat] [Drink] [Paint] [Village]
	clearMenu();
	if(flags["QUINNFEST_FEAST"] != undefined) addDisabledButton(0, "Eat", "Eat", "You’ve just done that!");
	else addButton(0, "Eat", quinnFestival, "eat", "Eat", "Stuff your face with whatever passes for zil delicacies.");
	if(flags["QUINNFEST_DRINK"] != undefined) addDisabledButton(1, "Drink", "Drink", "You’ve just done that!");
	else addButton(1, "Drink", quinnFestival, "drink", "Drink", "They’ve discovered alcohol, right?");
	if(flags["QUINNFEST_PAINT"] != undefined) addDisabledButton(2, "Paint", "Paint", "You’ve just done that!");
	else if(pc.hasArmor())
	{
		if(!pc.canDropItem(pc.armor)) addDisabledButton(2, "Paint", "Paint", "You can’t remove your [pc.armor] in order to do that!");
		else if(pc.inventory.length >= pc.inventorySlots()) addDisabledButton(2, "Paint", "Paint", "You don’t have enough space in your inventory (to place your [pc.armor]) in order to do that!");
		else addButton(2, "Paint", quinnFestival, "paint", "Paint", "Getting some body paint going on sounds like a pretty good time. (This will have you remove your [pc.armor] however.)");
	}
	else addButton(2, "Paint", quinnFestival, "paint", "Paint", "Getting some body paint going on sounds like a pretty good time.");
	
	addButton(4, "Village", quinnFestival, "village", "Go To Village", "Go down to the village and join in the festivities there.");
}
public function quinnFestivalVillageMenu():void
{
	// [Dance] [Fortune] [Circle]
	// [Dance] [Rope Jump] [Circle]
	clearMenu();
	addButton(0, "Dance", quinnFestival, "dance", "Dance", "Throw some shapes with the crowd. You can always say it’s starwalker custom to have no sense of rhythm.");
	if(flags["QUINNFEST_ROPE_JUMP"] != undefined) addDisabledButton(1, "Rope Jump", "Rope Jump", "You’ve just done that!");
	else addButton(1, "Rope Jump", quinnFestival, "rope jump", "Rope Jump", "There’s some rambunctious activity going on by the riverside. Could be fun...");
	
	addButton(3, "Circle", quinnFestival, "circle", "Go To Circle", "Head back up to the feast and drink.");
}
public function quinnFestival(response:String = "intro"):void
{
	clearOutput();
	author("Nonesuch");
	
	switch(response)
	{
		case "intro":
			rooms["12. Zil Village Winnar"].northExit = "ZIL FESTIVAL VILLAGE";
			generateMapForLocation("12. Zil Village Winnar");
			rooms["12. Zil Village Winnar"].northExit = null;
			
			showQuinn();
			showName("\nFESTIVAL!");
			
			output("<i>“Excellent.”</i> The zil leader smiles down at you serenely. <i>“Your place at the tables is to the right of mine. Eat, drink, be merry, do as you may - The Pollen Festival is a celebration of the freedom the life our people lead offers. Except don’t step into the circle. That is for later.”</i>");
			output("\n\nWith that she rises, and strides off towards her yurt. " + (flags["QUINN_MAIDENS_MET"] == undefined ? "Her two handmaidens" : "Fetch and Carry") + " hurry after her.");
			output("\n\nIronwood logs with shaven, flat tops - they must have been painstakingly cut down and then hoisted up the waterfall from the lower jungle - have been positioned around the chieftain’s circle. Onto them a smorgasbord of food is being ferried from the cooking fires, which are busy blazing away in the peripheries of the village. Stone urns filled with golden fluid hang from the cedar-like trees.");
			output("\n\nThe tribal zil are everywhere, either chatting with one another in groups, sweating over the fires, settling themselves down in front of the feast, or thronging excitedly in the village below. There seems to be way more of them than usual, most of them either painted or in the process of being painted in sticky, garish dyes. The hubbub is the low, ululating buzz of a swarm of drunken wasps. Are other tribes present here, or is it simply that, in the normal course of events, most of them are usually in the jungle below?");
			output("\n\nWhatever. You should follow Quinn’s advice and go have some fun.");
			output("\n\n");
			
			processTime(3);
			
			quinnFestivalCircleMenu();
			break;
		case "eat":
			showBust("");
			showName("\nFEAST");
			
			output("You sidle your way through the crowd to the chair next to the big, carved one. There are bowls filled with alien fruit, made stranger by the dim, flickering light, and roasts of things you can’t even begin to imagine would have looked like before they were hunted down, butchered, slathered in honey, and stuck over a fire for an hour. As discretely as you can, you check your codex. It doesn’t <i>seem</i> to be flashing a red alert about any nearby toxins...");
			output("\n\n<i>“Here, starwalker,”</i> coos the female zil sitting next to you, dangling a thin vine covered in bloated, oblong fruits. Going off her unfocused eyes, she’s already pretty drunk. <i>“Open wide...”</i> You let her lean over you, breathing in her fermented honey scent as she feeds you the fruits - watery, fizzy, citrusy. Those are - those are pretty nice! She giggles as, enthused, you reach out and tear off a leg of dark green meat. What do you know: It tastes like chicken.");
			output("\n\nYou rise from the table maybe an hour later, mouth greasy, gut full. You’ve got all the calories you’ll need to keep you going through the night, but... oof... you hope nobody’s going to ask you to move fast anytime soon.");
			output("\n\n");
			
			// +1 hour, -10% Reflexes -10% Physique for 10 hours, +100 energy
			processTime(64);
			eatHomeCooking(100);
			pc.createStatusEffect("Full Stomach", 0, 0, 0, 0, false, "Icon_Slow", "You are currently stuffed with food, dropping your physique and reflexes by 10%, each.", false, 600);
			
			flags["QUINNFEST_FEAST"] = 1;
			
			quinnFestivalCircleMenu();
			break;
		case "drink":
			showBust("");
			showName("\nDRINK");
			
			output("The lean male slaps away your hand when you tentatively reach for one of the stone jugs hanging from a nearby tree.");
			output("\n\n<i>“No. Unless you want blindness. Not properly brewed yet. Here.”</i> He picks up another, virtually identical jug, and pours out two cups, thrusting one into your hand. <i>“To the pollen! To our Quinn!”</i> You swallow it back with him. It’s mead, basically - mead, with its intense fire buried low under the crashing sweetness of honey.");
			output("\n\n<i>“All good things come from the sweetness,”</i> the male says, grinning as he watches you blink a couple of times. <i>“Come! Drink again! I insist. To the breezes! To our Quinn!”</i>");
			output("\n\nYeah! To the breezes! To the... thingie. You stagger through the crowd a bit later, cup still in hand, feeling much warmer, relaxed and friendly about all the nice, yellow and black people you’re spending this evening with.");
			output("\n\n");
			
			// +1 hour, +80% alcohol
			processTime(16);
			pc.imbibeAlcohol(20);
			processTime(16);
			pc.imbibeAlcohol(20);
			processTime(16);
			pc.imbibeAlcohol(20);
			processTime(16);
			pc.imbibeAlcohol(20);
			
			flags["QUINNFEST_DRINK"] = 1;
			
			quinnFestivalCircleMenu();
			break;
		case "paint":
			showBust("");
			showName("\nPAINT");
			
			output("The thin old female with the pots of dye twinkles as she watches you roll up to where she’s sat.");
			var hasArmor:Boolean = pc.hasArmor();
			if(hasArmor)
			{
				output("\n\n<i>“You’ll have to take your soft plates off first, starwalker.”</i> You");
				if(pc.hasLowerGarment())
				{
					output(" elect to keep your [pc.lowerUndergarment]");
					if(pc.hasUpperGarment()) output(" and [pc.upperUndergarment]");
					output(" on, but otherwise");
				}
				output(" bare your [pc.skinFurScales] to the cool, evening air, and the waiting brush of the artist.");
			}
			output("\n\n<i>“I see you as... a firebird. Yeeess,”</i> she breathes, painting cold stripes of orange and red dye onto your arms and face. You try not to flinch as she works. <i>“From the sky you come in your fiery silver bird, and you burn amongst us, changing everything and catching the eye with your rebirth. Yes!”</i> She plops her brushes back into her pots, beaming proudly at the wide patterns of fiery colors she’s painted onto you. <i>“Now go and dance, firebird. Shake your feathers!”</i>");
			output("\n\nYou’re slightly self-conscious of it as you mingle back amongst the crowd, but the stuff quickly dries, sinking into your [pc.skin], so that it’s only when you wave your arms around that you remember you look like you’ve had a serious accident with a sun tan bed.");
			output("\n\n");
			
			processTime(16);
			
			// Remove upper garments if present, +15% tease damage for 10 hours
			if(hasArmor)
			{
				var wornArmor:ItemSlotClass = pc.armor;
				wornArmor.onRemove(pc);
				pc.armor = new EmptySlot();
				itemCollect([wornArmor]);
			}
			pc.createStatusEffect("Body Paint", 0, 0, 0, 0, false, "Icon_LustUp", "Your face and body are painted with an alluring design, slightly amplifying your ability to tease.", false, 600);
			
			flags["QUINNFEST_PAINT"] = 1;
			
			quinnFestivalCircleMenu();
			break;
		case "village":
			rooms["12. Zil Village Winnar"].northExit = "ZIL FESTIVAL VILLAGE";
			generateMapForLocation("ZIL FESTIVAL VILLAGE");
			rooms["12. Zil Village Winnar"].northExit = null;
			
			showBust("");
			showName("\nVILLAGE");
			
			output("You skirt around the feasting logs, and [pc.move] down the wooden ramp towards the wax hive-homes and the throngs of zil down there.");
			output("\n\n");
			
			processTime(2);
			
			// Only shows IF Lah still present OR PC is submissive to Kane
			if((rkLahIsFree() || submissiveToKane()) && flags["QUINNFEST_INTERLUDE"] == undefined)
			{
				clearMenu();
				addButton(0, "Next", quinnFestival, "village interlude");
			}
			// If else simply display options
			else quinnFestivalVillageMenu();
			break;
		case "village interlude":
			// If Lah Still Present, not submissive to Kane
			if(rkLahIsFree() && !submissiveToKane())
			{
				showLah();
				
				output("You stumble into Lah at the bottom of the ramp. The ausar’s got a dangerously full stone jar in his hand, and he’s substituted his fur stole for a head-dress of white feathers.");
				output("\n\n<i>“Hear you’re taking part in - in Quinn’s big ritual later,”</i> he grins. <i>“That’s cool. If I’m honest I - I’ve never been big into these sexual dynamics all of these native races are into. Performo...performing... nervousness, I guess. It’s good you’re here to take on that kind of thing.”</i>");
				output("\n\nHe swills his mead around, standing with you and gazing over the swirling crowd of zil.");
				output("\n\n<i>“But it’s great, isn’t it?”</i> he slurs. <i>“Seeing all of these rituals of theirs. In... proteiny state. Centuries from now they’ll be carved in stone, unquestionable, but now, they’re still - still forming. And we’re part of that, me ‘n you.”</i> He slaps you on the shoulder, squeezes you into his lean side. <i>“We’re part of that - that slosh. Changing it for the better. Changing it for the... ooh I’m sloshed. S’cuse me, Steele...”</i>");
				output("\n\nHe staggers off towards the bushes. Shaking your head, you consider your options.");
				output("\n\n");
				
				processTime(5);
				
				flags["QUINNFEST_INTERLUDE"] = 1;
			}
			// PC 51% or more submissive to Kane
			// This is for content that is going to appear later
			else
			{
				showKane();
				
				output("<i>“So.”</i> Kane appears out of the gloom at the bottom of the ramp so suddenly and silently you gasp. And, of course, that fills your mouth and head with his scent. So intoxicating and powerful... black, horny memories bloom in your head, and your [pc.knees] turn to water.");
				output("\n\n<i>“You’re taking part in our Quinn’s little ritual,”</i> he says, pupil-less eyes trailing up and down your body. The driest of smiles twitches the corner of his mouth. <i>“As her champion.”</i>");
				output("\n\n<i>“Yes.”</i> You couldn’t lie to him even if it wasn’t pointless to; nor could you step away when he strides forward and takes you into his lean, strong arms, hands possessively roaming down your body, coming to rest on your [pc.ass] to give it a good, hard squeeze.");
				output("\n\n<i>“I do not mind,”</i> he growls. <i>“Relax.”</i> Instantly you do, relief washing through you. <i>“Let her have her fun, use you as");
				if(!pc.hasCock()) output(" her plaything");
				else output(" her packet of seeds");
				output(". I do not begrudge a female’s wish to have a child. It doesn’t matter to me.”</i> He pauses to lift his fingers, tracing your [pc.lips] with a rough index finger, sinking it into your unresisting mouth. <i>“Because I know who you really belong to, [pc.name].”</i>");
				output("\n\nThe tall zil withdraws his hands the next moment and is gone, disappearing back into the shadows as swiftly and silently as he appeared. As if he were nothing more than a sudden, horny apparition conjured up by your own mind. Trying to shake a little sense into yourself, you take stock of your options.");
				
				processTime(5);
				// +Lust
				pc.changeLust(35);
				
				output("\n\n");

				flags["QUINNFEST_INTERLUDE"] = 2;
			}
			quinnFestivalVillageMenu();
			break;
		case "dance":
			showBust("");
			showName("\nDANCE");
			
			output("Some leather drums are being enthusiastically thumped, along with wooden instruments rather like glockenspiels. The main sound moving the stamping, gyrating crowd though is the vocals, which every zil is joining in with - that wordless, soaring, buzzing sound, which builds and subsides, builds and subsides, seemingly mimicking the way dancers join and leave the central centrifuge of bodies.");
			output("\n\nIt’s a rhythm that makes it easy to wait for a dip and then join in, bouncing your [pc.hips] against countless carapace-clad counterparts, join hands, spin partners and be spun yourself, find the heady, suffocating centre and then be flung back out to the periphery. Build... then subside. Build... then subside. You do your best to mimic the sound, your partners laughing goodnaturedly at your clumsy attempts at it.");
			output("\n\nYour " + (!pc.hasArmor() ? "hand" : "[pc.armor]") + " is being tugged insistently. You turn to find yourself faced by an anxious looking young male.");
			output("\n\n<i>“Please, starwalker,”</i> he says. <i>“You must come.”</i>");
			output("\n\nBlinking and looking around, you realize many of the zil are filing their way up towards the chieftain’s circle. Where has the time gone? You were just getting warmed up. Shrugging, you make your way back towards the ramp.");
			output("\n\n");
			
			// +2 Hours, go to part 2
			processTime(122);
			
			clearMenu();
			addButton(0, "Next", quinnFestivalPart2, ["intro"]);
			break;
		case "rope jump":
			showBust("");
			showName("\nROPE JUMP");
			
			output("The eyes of the predominantly male revellers light up when they see you hove into view. You watch as one of them pulls on the fibrous, tightly-secured vine and then launches himself with it over the river... almost making it to the other side before falling with a bellow and a crash into the water below.");
			output("\n\n<i>“The starwalker!”</i> cheers one. <i>“[pc.He] conquered the cliff. Surely [pc.he] can conquer the river!”</i>");
			output("\n\nThe vine is pushed into your hands amongst shouts, laughter and swigs of honey liquor. You pull at it experimentally, consider the looming drop into the cold, swift water. Oh, what the hell. There’s no backing down in front of drunken teenagers.");
			// Reflexes test
			var success:Boolean = (pc.RQ() >= 75);
			// Fail
			if(!success)
			{
				output("\n\nYou firmly grab hold, run backwards a bit, and then launch yourself into thin air. Your heart races as you’re flung way out into the open air. You’re doing it! You’re doing it! You’re... not doing it. Oh One no, that is way too far to jump.");
				if(pc.hasWings() && pc.canFly()) output(" For a fleeting moment you consider opening your [pc.wings] and letting them do the rest, but then reflect that all of the winged males took their own dunkings fair and square.");
				output(" You let go and cannonball into the cold, deep water below. Refreshing is one word for it.");
				output("\n\nThe zil are laughing fit to burst as they haul you back onto the bank, but it’s pretty good-natured. A jar of warming mead is shoved into your hand, and the pleasant evening air quickly dries your [pc.skinFurScales]");
				if(pc.hasStatusEffect("Body Paint")) output(" - although your fiery body paint is ruined");
				output(".");
				output("\n\n<i>“I will conquer the river, and then I will be the champion!”</i> the cry goes up. You give the next valiant challenger a cheer, and then fade back into the throng.");
				
				processTime(3);
				
				// - Body Paint Buff if present, +10% alcohol
				pc.shower();
				pc.imbibeAlcohol(10);
				processTime(5);
			}
			// Succeed
			else
			{
				output("\n\nYou firmly grab hold, run backwards a bit, and then launch yourself into thin air. Your heart races as you’re flung way out into the open air. You fix your eye on the opposite shore. You aren’t going to have enough momentum to reach it... or worse, you’ll come down on the awkwardly on the lip... no, no, you’ve got this, you’ve got this! You let go at the apex of the swing, do a reasonable Tarzan impression as you fly through the air, and land in a cloud of sand, following it up with a perfect forward roll.");
				output("\n\nThe mob of male zil howl and cheer with amazement on the opposite side, and you allow yourself a couple of bows in their direction. STAR-WALK-ER! STAR-WALK-ER! Is still reverberating across the river as you swagger back towards the main party. Void, you feel so pumped after doing that!");
				
				processTime(3);
				
				// +Pumped buff for 10 hours: +15% Physique, +15% Aim
				pc.createStatusEffect("Pumped!", 0, 0, 0, 0, false, "Icon_OffUp", "You are feeling amped up! The temporary sensation increases your physique and aim by 15%, each.", false, 600);
			}
			output("\n\n");
			
			flags["QUINNFEST_ROPE_JUMP"] = 1;
			
			quinnFestivalVillageMenu();
			break;
		case "circle":
			rooms["12. Zil Village Winnar"].northExit = "ZIL FESTIVAL VILLAGE";
			generateMapForLocation("12. Zil Village Winnar");
			rooms["12. Zil Village Winnar"].northExit = null;
			
			showBust("");
			showName("\nCIRCLE");
			
			output("Maybe you’ll party with the joes a bit later. You clamber back up the ramp towards the flickering fires.");
			output("\n\nIronwood logs with shaven, flat tops - they must have been painstakingly cut down and then hoisted up the waterfall from the lower jungle - have been positioned around the chieftain’s circle. Onto them a smorgasbord of food is being ferried from the cooking fires, which are busy blazing away in the peripheries of the village. Stone urns filled with golden fluid hang from the cedar-like trees.");
			output("\n\nThe tribal zil are everywhere, either chatting with one another in groups, sweating over the fires, settling themselves down in front of the feast, or thronging excitedly in the village below. There seems to be way more of them than usual, most of them either painted or in the process of being painted in sticky, garish dyes. The hubbub is the low, ululating buzz of a swarm of drunken wasps. Are other tribes present here, or is it simply that, in the normal course of events, most of them are usually in the jungle below?");
			output("\n\n");
			
			processTime(2);
			
			quinnFestivalCircleMenu();
			break;
	}
}
public function quinnFestivalPart2(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	
	var response:String = (arg.length > 0 ? arg[0] : "intro");
	var vIdx:int = (arg.length > 1 ? arg[1] : -1);
	
	switch(response)
	{
		case "intro":
			showBust("");
			showName("THE\nMAIN EVENT");
			
			output("The suns have set entirely, and the mood is more serious and tense when you emerge back at the top of the village. The zil seated around the circle of logs are still talking to one another, but in a low murmur, and most of the food and drink has been cleared away.");
			output("\n\nA drum begins to thump, slow and precise, and the chatter dies entirely. Quinn appears in the torch-light, sedately making her way to her place, at the opposite end of the circle. She’s covered in bright blue dye, wavy patterns of it that subtly frame her small boobs and crotch plate, and her carapace is studded with pieces of amber that catch the light of the flames. On her head is a headdress which must be the skull of a creature with very impressive horns, beads and feathers swaying from its branches. Through the eye sockets, her golden eyes catch the flicker of the firelight.");
			// PC chose to fight
			if(flags["QUINNFEST_TALK_JUST_ME"] >= 1 && pc.hasCock())
			{
				output("\n\nYou realize your chair, that once stood next to hers, is no longer there. Oh... right. You allow the zil male that fetched you to lead you over to a table");
				
				var itemList:Array = [];
				if(pc.hasArmor()) itemList.push(pc.armor.longName);
				if(pc.hasMeleeWeapon()) itemList.push(pc.meleeWeapon.longName);
				if(pc.hasRangedWeapon()) itemList.push(pc.rangedWeapon.longName);
				if(itemList.length > 0)
				{
					output(", where you first take off all of your gear:");
					for(var i:int = 0; i < itemList.length; i++)
					{
						if(i > 0)
						{
							if((i + 1) == itemList.length) output(" and");
							else output(",");
						}
						output(" " + itemList[i]);
					}
				}
				output(". On the wooden surface are laid several short spears and bows. You have a choice to make.");
				output("\n\n");
				
				processTime(3);
				
				// [Spear] [Bow]
				clearMenu();
				addItemButton(0, new ZilSpear(), quinnFestivalPart2, ["fight spear"]);
				addItemButton(1, new ZilBow(), quinnFestivalPart2, ["fight bow"]);
			}
			else
			{
				output("\n\nThe seat to her right is empty. You don’t need any prompts from the runner to [pc.move] across and settle yourself down there. Quinn’s expression doesn’t waver; she looks carved, like some ancient deity that has stepped out of the night, a vision somewhere between life and death.");
				if(rkLahIsFree() || submissiveToKane())
				{
					if(rkLahIsFree() && !submissiveToKane()) output(" Lah is already in place to her left, resplendent in his white feathered headdress. He looks uncomfortable, but plentiful amounts of mead seem to have stilled his twitchiness for now.");
					else output(" Kane is already in place to her left. The rugged zil has made no particular effort to dress up for the occasion, and is slumped scowling in his chair. He can’t hide a certain amount of interest flickering on his face, though, as the drums begin to pick up.");
				}
				output("\n\n<i>“The time for the Droning Ball is upon us,”</i> Quinn intones. She rises and forms a U with her arms above her head, framing the skull crown. <i>“The zpirits demand I produce, for my tribe. To make use of this hallowed, fertile time and usher in the beginnings a new cycle. I have, on my side, one half of the new whole; my starwalker champion that has brought us");
				if(flags["PQ_RESOLUTION"] == 2) output(" glorious victory");
				else output(" unimagined prosperity");
				output(". Now, I require the other half. Draw, from the ancient stock of my people, the best, the brightest. Who would dare call themselves such?”</i>");
				output("\n\n<i>“Yes, my Quinn, I would.”</i> A tall, lean male steps into the ring, sinking his assegai into the sand.");
				output("\n\n<i>“Yes, Quinn, I would!”</i> A shorter, more boyish male strides forward, bow clutched in his hand.");
				output("\n\n<i>“Aye, Quinn, me, I would.”</i> Another pushes forward, chin thrust out, assegai leant over his shoulder.");
				output("\n\nOn and on it goes, more of the nimble, elven, boyish wasp males stepping forward into the firelight, war-painted, faces set, clutching weapons. Eventually, there are 15 of them, arranged in a semicircle in front of Quinn.");
				if(flags["PQ_RESOLUTION"] == 2) output(" You notice quite a few of them are armored in the battered white remnants of plasteel Snugglé turrets.");
				output("\n\n<i>“We who are about to dance, salute you Quinn!”</i> they chorus. The last word is echoed all around the circle, a thundering sound that draws the drumbeat to an end. The fighters fan out so that they are an equal distance between each other, and then with a bloodcurdling, buzzing cry, join battle.");
				output("\n\n");
				
				processTime(4);
				
				if(pc.hasVagina())
				{
					vIdx = pc.findEmptyPregnancySlot(1);
					if(vIdx < 0) vIdx = rand(pc.vaginas.length);
				}
				
				clearMenu();
				addButton(0, "Next", quinnFestivalPart2, ["ball next", vIdx]);
			}
			break;
		case "fight spear":
		case "fight bow":
			// Remove all gear, add Champion Assegai/Champion Short Bow, as in the Lah fight
			var bow:Boolean = (response == "fight bow");
			
			showBust(quinnBustDisplay(), "ZIL_CHAMPS");
			showName("VIRILE\nCOMBAT!");
			
			output("<i>“The starwalker champion has staked his claim.”</i> Quinn’s cool tones ring out over the assembly as you pick your chosen weapon, test it a few times. <i>“[pc.He] would be the father of my child, forge the future of our tribe, solely by way of [pc.his] own flesh.”</i> ");
			output("\n\nShe’s silent, allowing you time to step into the ring of stones. The cool air touches your naked [pc.skinFurScales]. The flicker of countless pupil-less eyes reflect back at you.");
			output("\n\n<i>“Is there any that would challenge that claim?”</i> Quinn’s voice carries out over the treetops.");
			output("\n\n<i>“Yes, my Quinn, I would.”</i> A tall, lean male steps into the ring, sinking his assegai into the sand.");
			output("\n\n<i>“Yes, Quinn, I would!”</i> A shorter, more boyish male strides forward, bow clutched in his hand.");
			output("\n\n<i>“Aye, Quinn, me, I would.”</i> Another pushes forward, chin thrust out, assegai leant over his shoulder.");
			output("\n\n<i>“Very well.”</i> Quinn raises her hand and the drum starts again, quicker this time. The hum from the crowd begins to build. <i>“You shall fight my champion, warriors. You have stepped forward together and so shall settle your claim together, should you triumph.”</i> You look over to her and see a soft, anticipatory smile spreading across the pretty mouth beneath the skull. <i>“Begin.”</i>");
			output("\n\nThe three males spread out, the two spear-wielders ahead of the archer. You clutch your weapon. You have to be the only one capable of walking out of the circle, if it’s you that’s going to claim the prize.");
			output("\n\n");
			
			processTime(3);
			
			// Fight
			quinnFestivalPrepFight(bow);
			break;
		case "ball next":
			showBust(quinnBustDisplay(), "ZIL_CHAMPS");
			showName("VIRILE\nCOMBAT");
			
			// ++Lust
			output("A few go down immediately; overconfident, overreaching, sent tumbling to the sand by a single, telling blow from a spear or club. You see what Quinn was saying about it being something of a test of cunning and stamina as well as strength. The biggest male overwhelms two others in a rhinoceros-like rampage, and then is simply taken out with a deft stab to the knee by another who was clearly just waiting for an opening to do so.");
			output("\n\nThe sweet, heady scent of horny zil boys rises up into the still, cool air. They are fighting, rutting really, to establish sexual dominance in the way of all zil, only instead of over each other, it’s for Quinn - and you. Stealing a look at the proud, skull-crowned monarch, you see that her mouth is slightly ajar, color in her cheeks, and she is squirming ever so slightly in her throne as she watches this display of male savagery.");
			output("\n\nYou’d be lying if it wasn’t having an effect on you also, the smell alone is... overwhelming. The lavender-like musk fills your lungs as you gaze at lean boy butts and slim chest clench and shudder as their blows thud into each other;");
			if(pc.hasGenitals())
			{
				if(pc.hasCock()) output(" [pc.eachCock] fill" + (pc.cocks.length == 1 ? "s" : "") + " with hard heat");
				if(pc.isHerm()) output(" and");
				if(pc.hasVagina()) output(" [pc.eachVagina] drip" + (pc.vaginas.length == 1 ? "s" : "") + " with primal excitement");
			}
			else output(" your [pc.asshole] pulses with primal excitement");
			output(" as you enter a kind of erotic trance, insect wings flickering and flint weapon flashing. It <i>is</i> a dance, kind of; male drones struggling and thronging together for the glory of their queen.");
			output("\n\n<i>“Well done, my warriors,”</i> says Quinn, rising. You blink, coming to slightly. There are three male zil still left standing, two clutching spears and the other a bow; battered, scratched, sweaty and chests heaving, they nonetheless look elated beyond words. Looking around, you can see that the ritual battle has had a similar effect on many as it had on you - the black-eyed faces you can see are entranced with lust, and you think you can already hear the sigh of crotch and breast- plates slithering to one side in the darkness. There’s going to be more than one baby planted tonight... if not a full-blown orgy breaking out.");
			output("\n\n<i>“All who fought today showed honor and bravery,”</i> Quinn continues. <i>“But it is your victory today that shall be spoken of for many moons to come. Step forward, you three. You have earned the chance to prove yourself in... other ways.”</i>");
			pc.changeLust(100);
			
			clearMenu();
			addButton(0, "Next", quinnFestivalPart2, ["ball to yurt", vIdx]);
			break;
		case "ball to yurt":
			rooms["12. Zil Village Winnar"].northExit = "ZIL FESTIVAL VILLAGE";
			generateMapForLocation("ZIL FESTIVAL YURT");
			rooms["12. Zil Village Winnar"].northExit = null;
			
			showBust("");
			showName("DRONING\nBALL");
			
			// PC chose to spectate
			if(flags["QUINNFEST_TALKED"] < 0 || !pc.hasGenitals())
			{
				output("You watch her rise and make her stately way towards the chieftain’s yurt, her pert ass and stinger-laden abdomen bobbing an invitation that the three victorious warriors gladly accept, scars and all. It’s a safe guess that you won’t see them again until sunrise at the very earliest. The spell of their skull-crowned deity broken, the rest of the tribal zil are now getting very involved with one another; the warriors who fell are having their wounds tended to, whilst hands are slipping into hands and groups of two or three are gliding into the darkness.");
				// PC is submissive to Kane
				if(submissiveToKane())
				{
					output("\n\n<i>“I misjudged you,”</i> a familiar voice growls into your ear. You start, and it breaks into harsh laughter.");
					output("\n\n<i>“I thought Quinn had you completely twisted around her little finger,”</i> Kane says from behind your chair. You close your eyes as you feel his hand reach down, pawing roughly at your [pc.chest], subsuming yourself once again in his scent and the sweet sensation of submission. <i>“But you chose not to be part of her whorish little romp, didn’t you? Loyalty. Dedication. That’s what I call that.”</i> His voice deepens and lowers, white-hot arousal gleaming through his words. <i>“I think it calls for a reward. More celebrations. I’ve got some ropes... and a desire to fuck every single one of those tight, loyal holes of yours. Come.”</i>");
					output("\n\nIn a daze you get up and follow your waspish master down the ramp, towards the waiting darkness of his yurt, head filled with nothing but aching horniness and a desire to please. Within ten minutes your hands are tied behind your back, your [pc.ass] is in the air and his thick, glossy dick is plunging into your [pc.vagOrass " + vIdx + "] deep, rutting you roughly. And it’s so good, so good to forget your name and for every other thought to be washed away by orgasm after orgasm, and for you to become an empty, slutty vessel for his seed, all night long...");
					
					if(vIdx >= 0) pc.cuntChange(vIdx, chars["KANE"].cockVolume(0));
					else pc.buttChange(chars["KANE"].cockVolume(0));
					
					processTime(11);
				}
				// PC has fucked Fetch and Carry
				else if(flags["QUINN_MAIDENS_SEXED"] != undefined)
				{
					output("\n\n<i>“Heeeeyyyyy,”</i> somebody croons into your ear. You start, and to the other side of you somebody giggles.");
					output("\n\n<i>“You’re looking a little lonely, sat up here,”</i> says Fetch, leaning down close enough for you to smell the sugary waves of mead and pheromones coming off of her. <i>“Did Quinn take all of those boys for herself and just leave you here?”</i>");
					output("\n\n<i>“She’s so greedy,”</i> pouts Carry, on the opposite side. Her hand slides " + (!pc.hasHair() ? "over" : "through") + " your [pc.hair]. <i>“Why don’t you come home with us, champion? We’ve got room, you know. You could show us the stars again...”</i>");
					output("\n\nYeah. That sounds like a very good idea indeed. You get up and clinch the two drunken handmaidens into your side, their armored hips meeting your [pc.hips], making them laugh and squeal, and the three of you make your meandering, tipsy way to their yurt.");
					
					processTime(10);
				}
				// If Else
				else
				{
					output("\n\nAn elfin male passing by your chair, hand-in-hand with a slightly taller female, catches your eye, and silently proffers you his hand. In the dreamy, sensual atmosphere at play here, there is no need for words. You lock fingers with those thin black digits, and the three of you make your meandering, tipsy way down towards the village and the waiting darkness of a yurt.");
					
					processTime(7);
				}
				output("\n\n");
				
				clearMenu();
				addButton(0, "Next", quinnFestivalPart2, ["ball spectate", vIdx]);
			}
			// PC chose to participate
			else
			{
				output("She rises, then pauses, waiting for you to follow suit. You know your role here as if it had been drilled into you; there’s an incredible erotic frisson at work here, a dark thrill that worms its way into your heart as you gaze at the lithe, sweaty bodies of the victorious male zil, that makes your breath come quick and fast.");
				output("\n\nYou and Quinn make your stately way back to her yurt, leading the three of them upwards, well aware their eyes are fixed upon her bobbing, stinger-laden abdomen and your [pc.ass]. The spell of their skull-crowned deity broken, you can hear the rest of the tribal zil now getting very involved with one another; the lavender-scented woods are alive with the sounds of sighs, gasps, the hum of insect wings and low voices. Clearly this is a night they all look forward to.");
				output("\n\n");
				
				// Go to sexings
				clearMenu();
				addButton(0, "Next", quinnFestivalSexingsRouter);
			}
			break;
		case "ball spectate":
			showBust("");
			showName("DRONING\nBALL");
			
			output("You emerge from the yurt into the heat of the Mhen’gan middle of the day, yawning and stretching. You had a thoroughly enjoyable, if strenuous night");
			if(submissiveToKane() || flags["QUINN_MAIDENS_SEXED"] != undefined) output(" - the festival certainly put " + (submissiveToKane() ? "Kane" : "those two") + " in the mood, as if zil weren’t always in the mood");
			output(". You leave " + ((submissiveToKane() || flags["QUINN_MAIDENS_SEXED"] == undefined) ? "him" : "them") + " slumbering off the excesses of the festival, quietly putting on your [pc.gear], your [pc.groin] throbbing mightily and the taste of honey juices in your mouth.");
			output("\n\nYou find Quinn already stationed back on her grand, carved chair. She looks unperturbed, glossy and clean, as if nothing transpired last night - except, perhaps, for a slightly wider smile stretched across her round face, and maybe a certain far-away gleam in her golden eyes. As tactfully as you can, you ask if everything went according to plan.");
			output("\n\n<i>“We shall see in the moons to come, won’t we?”</i> comes the cool response. She taps a thoughtful finger on her knee. <i>“But I believe the zpirits were pleased. Thank you for being present, [pc.name]. As I told you, you are a blessing upon this tribe, and if I cannot be gotten with child even if I have you by my side... then I shall know it was never meant to be. I hope you found our festival entertaining.”</i> She eyes you knowingly. <i>“I think you did.”</i>");
			output("\n\n");
			
			// +8 hours, -Lust, +Sweaty
			genericSleep((8 * 60) + 5);
			pc.orgasm();
			sweatyDebuff(1);
			
			// End. Boot to Chieftain’s Circle. Set Quinn to general preg
			tryKnockUpQuinn(true);
			currentLocation = "12. Zil Village Winnar";
			flags["QUINNFEST_COMPLETE"] = -1;
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
	}
}
// Fight
public function quinnFestivalPrepFight(bow:Boolean = false):void
{
	var zilDrones:Array = [new ZilChampionSpear(), new ZilChampionBow(), new ZilChampionSpear()];
	
	// No run away!
	zilDrones[0].createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
	// Take player weapons and armor and set new weapon based on choice.
	zilDrones[0].inventory.push(pc.meleeWeapon);
	zilDrones[0].inventory.push(pc.rangedWeapon);
	pc.meleeWeapon.onRemove(pc);
	pc.rangedWeapon.onRemove(pc);
	if(pc.hasArmor())
	{
		zilDrones[0].inventory.push(pc.armor);
		pc.armor.onRemove(pc);
		pc.armor = new EmptySlot();
	}
	if(bow)
	{
		pc.rangedWeapon = new ZilBow();
		pc.meleeWeapon = new Rock();
	}
	else
	{
		pc.meleeWeapon = new ZilSpear();
		pc.rangedWeapon = new Rock();
	}
	
	// Lock slots to prevent item switching from inventory!
	pc.lockItemSlot(GLOBAL.ARMOR, "<b>It is not of zil custom to change outfits while already in honorable combat!</b>");
	pc.lockItemSlot(GLOBAL.MELEE_WEAPON, "<b>You are unable to wield a different weapon right now--where is your honor?!</b>");
	pc.lockItemSlot(GLOBAL.RANGED_WEAPON, "<b>You can’t arm yourself with different weapons--you agreed to an honorable battle, remember?</b>");
	
	// Add passive effect
	pc.createStatusEffect("Zweet Breeze", 3, 0, 0, 0, false, "Icon_LustUp", "A pheromonal lust cloud looms over the area, affecting your arousal.", true, 0, 0xB793C4);
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(zilDrones);
	CombatManager.victoryScene(quinnFestivalFightWin);
	CombatManager.lossScene(quinnFestivalFightLose);
	CombatManager.displayLocation("ZIL TRIO");
	CombatManager.encounterText("You are fighting the trio of male zil who have chosen to contest your claim to Quinn. Generally speaking, they are typical lads for their species - equipped with hoverboard-sized insect wings, clad in sturdy black chitin everywhere except their yellow faces, antennae bobbing above their shaggy brown hair. They are all slathered in arresting, garish war paint. The two wielding short spears are 5\' 10\" and wiry, athletic and tall, jut-jawed and determined. The other is maybe 5\' 8\", equipped with a bow and is more effeminate: slim, full thighs and a cute, heart-shaped, yellow face bobbing around in the dusky light.");
	
	// go to fight
	clearMenu();
	addButton(0, "Next", CombatManager.beginCombat);
}
public function quinnFestivalEndFight():void
{
	var zilDrones:Array = CombatManager.getHostileActors();
	setEnemy(zilDrones[0]);
	
	//Give PC back gear.
	for(var i:int = 0; i < enemy.inventory.length; i++)
	{
		switch(enemy.inventory[i].type)
		{
			case GLOBAL.RANGED_WEAPON:
				pc.rangedWeapon = enemy.inventory[i];
				pc.rangedWeapon.onEquip(pc);
				break;
			case GLOBAL.MELEE_WEAPON:
				pc.meleeWeapon = enemy.inventory[i];
				pc.meleeWeapon.onEquip(pc);
				break;
			case GLOBAL.ARMOR:
			case GLOBAL.CLOTHING:
				pc.armor = enemy.inventory[i];
				pc.armor.onEquip(pc);
				break;
		}
	}
	enemy.inventory = [];
	
	//If neither PC or enemy has champion kit, set it up.
	if(!(pc.meleeWeapon is ZilSpear) && !pc.hasItemByClass(ZilSpear))
	{
		if(!enemy.hasItemByClass(ZilSpear)) enemy.inventory.push(new ZilSpear());
	}
	if(!(pc.rangedWeapon is ZilBow) && !pc.hasItemByClass(ZilBow))
	{
		if(!enemy.hasItemByClass(ZilBow)) enemy.inventory.push(new ZilBow());
	}
	
	// Unlock locked inventory slots!
	pc.unlockItemSlot(GLOBAL.ARMOR);
	pc.unlockItemSlot(GLOBAL.MELEE_WEAPON);
	pc.unlockItemSlot(GLOBAL.RANGED_WEAPON);
}
public function quinnFestivalFightLose(response:String = "intro"):void
{
	clearOutput();
	author("Nonesuch");
	
	switch(response)
	{
		case "intro":
			userInterface.hideNPCStats();
			userInterface.leftBarDefaults();
			generateMap();
			
			showBust("ZIL_CHAMPS");
			showName("DEFEAT:\nZIL TRIO");
			
			var zilDrones:Array = CombatManager.getHostileActors();
			var numZilAwake:int = 0;
			for(var i:int = 0; i < zilDrones.length; i++)
			{
				if(!zilDrones[i].isDefeated()) numZilAwake++;
			}
			
			output("You’re desperate to fight on, but");
			if(pc.HP() <= 0) output(" you simply cannot force your exhausted body on any further");
			else output(" you simply cannot ignore the arousal that’s been forced upon your overloaded senses any further");
			output(". You collapse into the sand and put your arms to signal your defeat.");
			output("\n\nThe");
			if(numZilAwake < zilDrones.length) output(" remaining");
			output(" zil warrior" + (numZilAwake == 1 ? " sighs" : "s sigh") + ", barely able to believe it, and then buzz" + (numZilAwake == 1 ? "es" : "") + " a harsh cheer into the night sky,");
			if(numZilAwake < zilDrones.length)
			{
				output(" hauling up " + (numZilAwake == 1 ? "his" : "their") + " fallen comrade" + (zilDrones.length - numZilAwake == 1 ? "" : "s") + " so that they can huddle");
			}
			else output(" huddling");
			output(" into a fierce group hug before turning their expectant, exultant faces back to Quinn.");
			output("\n\n<i>“All who fought today showed honor and bravery,”</i> Quinn says, calm and composed as a statue. <i>“But it is your victory today that shall be spoken of for many moons to come. Step forward, you three. You have earned the chance to prove yourself in... other ways.”</i>");
			output("\n\nYou watch her rise and make her stately way towards the chieftain’s yurt, her pert ass and stinger-laden abdomen bobbing an invitation that the three victorious warriors gladly accept, scars and all. They offer hands and hasty commiserations to you as they go, but that does little to salve the burn of humiliation.");
			output("\n\nIt’s a safe guess that you won’t see them again until sunrise at the very earliest. The spell of their skull-crowned deity broken, the rest of the tribal zil are now getting very involved with one another; hands are slipping into hands and groups of two or three are gliding into the darkness. Little attention is paid to you, about which you’re reasonably grateful. You");
			output(" wrap up your wounds");
			if(pc.HP() > 0) output(" give yourself some much needed manual relief");
			else output(", find a dark space beneath the boughs of a tree, and slip into blissful slumber.");
			output("\n\n");
			
			processTime(3);
			
			clearMenu();
			addButton(0, "Next", quinnFestivalFightLose, "next");
			break;
		case "next":
			showQuinn();
			
			output("You awake in the heat of the Mhen’gan middle of the day, yawning and stretching, and after a quick wash in the river make your back up to the circle. You find Quinn already stationed back on her grand, carved chair. She looks unperturbed, glossy and clean, as if nothing had transpired last night - except, perhaps, for a slightly wider smile stretching her round face, maybe a certain far-away gleam in her golden eyes. As tactfully as you can, you ask if everything went according to plan.");
			output("\n\n<i>“We shall see in the moons to come, won’t we?”</i> comes the cool response. She taps a thoughtful finger on her knee. <i>“But I believe the zpirits were pleased. I’m sorry you weren’t able to overcome my warriors, [pc.name]. But you fought honorably, and I believe the zpirits were pleased. As I told you, you are a blessing upon this tribe, and if I cannot be gotten with child even if I have you by my side... then I shall know it was never meant to be.”</i> She eyes you teasingly. <i>“And perhaps you learnt something about being content with just a slice of the fruit treat, rather than fight and get none, hmm?”</i>");
			output("\n\n");
			
			// +8 hours, -Lust, Health to 100%
			genericSleep((8 * 60) + 5);
			pc.orgasm();
			
			// End. Boot to Chieftain’s Circle. Set Quinn to general preg
			tryKnockUpQuinn(true);
			currentLocation = "12. Zil Village Winnar";
			flags["QUINNFEST_COMPLETE"] = -2;
			
			quinnFestivalEndFight();
			CombatManager.genericLoss();
			break;
	}
}
public function quinnFestivalFightWin():void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	clearOutput();
	showBust("ZIL_CHAMPS");
	showName("VICTORY:\nZIL TRIO");
	author("Nonesuch");
	
	output("The last of the zil challengers collapses into the sand, unable to continue. This one uses the last of his energy to lift his head and look you in the eye.");
	output("\n\n<i>“You... have become one with our ways, and have bettered us all,”</i> he grunts. <i>“You deserve her.”</i>");
	output("\n\n<i>“All who fought today showed honor and bravery,”</i> Quinn says, calm and stately as a graven idol. <i>“But it is your victory today that shall be spoken of for many moons to come. Step forward, my champion. You have earned the right to claim me as your own.”</i>");
	output("\n\nExultation fills your breast as you watch her rise and make her stately way towards the chieftain’s yurt, her pert ass and stinger-laden abdomen bobbing an invitation that you readily accept. The intoxicating, savage primacy of what you’ve done here - fought off three");
	if(flags["PQ_FOUGHT_TRIBE"] != undefined) output(" other");
	output(" young males in order to be the one and only mate of the swarm’s alpha bitch - becomes even more euphoric as the drum picks up again, and the word <i>“Zteele! Zteele! Zteele!”</i> rings out over the roaring fires in tones of awe, envy and naked lust.");
	output("\n\nYou follow Quinn upwards into the darkness. The spell of their skull-crowned deity broken, you can hear the rest of the tribal zil now getting very involved with one another behind you; the lavender-scented woods are alive with the sounds of sighs, gasps, the hum of insect wings and low voices. Clearly this is a night they all look forward to.");
	output("\n\n");
	
	processTime(3);
	
	// Go to sexings
	eventQueue.push(quinnFestivalFightWinNext);
	
	quinnFestivalEndFight();
	CombatManager.genericVictory();
}
public function quinnFestivalFightWinNext():void
{
	quinnFestivalSexingsDroneAlone([0]);
}
// Sexings
public function quinnFestivalSexingsRouter():void
{
	if(flags["QUINNFEST_TALKED"] > 0)
	{
		if(pc.isHerm())
		{
			clearOutput();
			showBust("");
			showName("CHOOSE\nROLE");
			
			output("It looks like you have two kinds of genitals. Which role would you like to participate as? (In either instance, your vagina will still be used.)");
			
			clearMenu();
			addButton(0, "Cock", quinnFestivalSexingsOneSausage, [0], "Use Your Cock", "Add another sausage to the party.");
			addButton(1, "Cunt", quinnFestivalSexingsPairOfQueens, [0], "Use Your Cunt", "Be treated like a queen alongside Quinn.");
			return;
		}
		if(pc.hasCock())
		{
			quinnFestivalSexingsOneSausage([0]);
			return;
		}
		if(pc.hasVagina())
		{
			quinnFestivalSexingsPairOfQueens([0]);
			return;
		}
	}
	
	clearOutput();
	showBust("");
	showName("\nERROR!");
	
	output("You shouldn’t be here as you didn’t choose to participate in the gangbang with Quinn!");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
// One Sausage at the Fest
// If PC chose to participate and has a dick
public function quinnFestivalSexingsOneSausage(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	clearMenu();
	
	var page:int = (arg.length > 0 ? arg[0] : 0);
	var cIdx:int = (arg.length > 1 ? arg[1] : -1);
	var vIdx:int = (arg.length > 2 ? arg[2] : -1);
	var zilDrones:Array = (arg.length > 3 ? arg[3] : [new ZilChampionSpear(), new ZilChampionBow(), new ZilChampionSpear()]);
	var i:int = 0;
	
	switch(page)
	{
		case 0:
			showBust(quinnBustDisplay(true), "ZIL_CHAMPS_NUDE");
			showName("\nQUINN");
			
			cIdx = pc.cockThatFits(zilDrones[1].analCapacity());
			if(cIdx < 0) cIdx = pc.smallestCockIndex();
			
			if(pc.hasVagina())
			{
				vIdx = pc.findEmptyPregnancySlot(1);
				if(vIdx < 0) vIdx = rand(pc.vaginas.length);
			}
			
			output("Quinn takes off her skull crown as she enters her yurt, laying it on a primitive table, her striped hair a beckoning, liquid motion down her back. Several clusters of candles have been lit inside, constellations in the darkness that contribute to the hot, close, dreamy atmosphere in here. It occurs to you that when the chosen warriors get in here, it’s going to get...");
			output("\n\nThe three of them pile in through the coarse tent flap, and instantly the space fills with their smell; sweet, intensely aroused zil, underlain by the musky salt of sweat, utterly overpowering, pulling the desire for sex up out of the deep currents of your mind and sending it crashing over every other thought you have. You exhale, long and low, as you feel heat power its way into [pc.eachCock]");
			if(pc.hasLowerGarment()) output(", tenting your [pc.lowerUndergarment] something fierce,");
			if(pc.hasVagina()) output(" and lavish amounts of [pc.femcum] drooling down your inner walls in rich anticipation");
			output(". A glance at those fey, lean insect males tells you that, for all that they themselves are producing the scent, they share a mind with you; you are all pure, sexual beings, horny, single-minded drones, who expended every effort to get here and at last copulate with your glorious queen.");
			output("\n\nQuinn sits herself back on her grand, fur-piled bed, one long, slim leg bent upwards, smiling that faint, familiar smile of hers, eyes flitting over the four of you. Her mouth opens slightly as, oh so slowly, her breastplate slithers apart, the soft, vulnerable yellow of her breasts swelling into view. Four pairs of eyes burn into her, unable to look away.");
			output("\n\n<i>“My drones,”</i> she sighs, warmth, affection and slyness coloring her husky tones. <i>“Why don’t you two come over here, and... [pc.name]... you see to my smallest.”</i>");
			output("\n\nThe shorter one, the archer boi, with his enjoyably full-looking hips and cute, heart-shaped face, looks up at you demurely; you are immediately put in mind of Able. Lust pumps through your veins as you take hold of him and forcibly lay him out at the bottom of the bed, climbing on top of him, tracing the shape of his slim, supple body beneath his hard, beetle-like carapace. He gasps slightly in response, and with an audible pop his groin-plate comes loose, his small, thick, foreskinned cock no longer willing to be caged. The sweet, horny smell intensifies... your head swims... and oh Void you could just eat him up! His thighs tremble as you grip that boi erection of his, a buzzing, thrilling moan escaping his lips as you begin to jerk him, hard and rough, drops of liquid gold adhering to your hand.");
			output("\n\nQuinn watches, entranced lust on her face, as the two males she’s laden herself with feast upon her body. They sandwich her, one lapping at her small, black nipples, the other peeling back her own groinplate so he can thirstily thrust his angular, elfen face deep between her thighs, putting that long tube tongue to the purpose it was surely made for.");
			output("\n\n<i>“Yeessss,”</i> she groans, hand gripping and relaxing in the boob-worshipper’s hair. <i>“Now do him. Do him like men do...”</i>");
			output("\n\nA great shiver runs right through the small zil’s body, his stubby little boi dick pulsates under your tight grip, and you laugh slightly in surprise as he squirts golden syrup all over your hand and arm. My word, the little guy must have been quite pent up! So pent up, indeed, that though he’s leaking seed copiously down his shaft and tight, trappy balls, he’s still firm as ever beneath your grip. He watches blearily as you reach down, smear your [pc.cock " + cIdx + "] in warm, glutinous zil seed; he murmurs, a sound somewhere between trepidation and lust as you flip him over, getting him on his knees so that he’s presenting those round, jet-black buttocks of his, with that soft, inviting pucker buried like a treasure between them. A mighty throb reverberates up your burningly erect cock at the sight.");
			output("\n\n<i>“Is... is this what you desire, my Quinn?”</i> he whispers, facing her as you press your honey-slathered head against his anus.");
			output("\n\n<i>“Yes, my good boy, my loyal, hard fighter,”</i> she groans, favoring him with a smile. One of the others has risen up, his own long, black penis exposed and pointing demandingly at her face. She pauses to give it a lick, teasing off the single drop of pre at the tip, making its owner shiver with joy. <i>“Put on a good display for your Quinn. Let your worries go... she is bountiful, and generous, and all shall know that before the night is done.”</i>");
			output("\n\nHe grips the furs and tenses up as you sink slowly inwards, opening him up gradually with your [pc.cockHead " + cIdx + "] and then spearing inside, pleasure volting up your honeyed shaft as it’s enveloped in warm, sheath-like tightness. You grip him by the hips and saw into him tenderly, letting the little guy get used to the feeling of being stretched out and filled by your [pc.cock " + cIdx + "], pushing more and more into his clenching heat with each steady push of your [pc.hips].");
			
			pc.cockChange();
			
			output("\n\nIt’s very difficult to keep your lust under control, not go hog wild on your groaning, tensing bottom, facing as you are the sight of what the other two are doing with Quinn. Black fingers dig into the softness of her inner thighs as the first feasts hungrily on the nectar-laden blossom nestled between them; the other’s mouth is open, eyes closed, knelt across her neck and receiving what is evidently a truly regal blowjob. Your [pc.hips] start pumping harder almost automatically, reaching your [pc.cock " + cIdx + "] into the zil boi’s tight asshole as you watch slender thighs shiver, Quinn’s fingers grip buttocks and a glorying, buzzing groan is drawn from thin, proud lips.");
			output("\n\nShe impels the lad to lie down beside her, orange seed leaking down her chin, her animated eyes immediately fixing themselves upon you. Her long legs wrap themselves around the head of the boy still tongue deep in her cunt, fixing him there whilst she watches you slap a fleshy rhythm into the partner she alloted you. His gasps and cries, in that magical cadence between discomfort and ecstasy, fill your head, and you’re suddenly cascading over the edge, gouting hot loads of [pc.cum] into the taut sweetness of his behind, your body whiplashing with unbearably pleasurable release.");
			if(pc.cumQ() >= 1200) output(" You’re trying to not overcommit here - there’s a long night ahead - but the sugar-laden air has had an inescapable effect on your souped up system, and [pc.cum] spurts like a burst pipe around your girth, the bee boi whimpering as you plump out his intestines with at least a liter of [pc.cumVisc], [pc.cumColor] seed.");
			output("\n\nQuinn’s mouth is open, and her eyelids flutter as the sight of you pounding the dickens out of one of her cute little warriors transports her, waves of motion rippling down the soft parts of her body, gleaming black legs gripping tightly around the devoted cunnilinguist, musical, wordless sounds of delight escaping her lips.");
						
			processTime(7);
			// 1/2 Lust down
			pc.changeLust((-0.5 * pc.lustRaw));

			output("\n\n");
			
			addButton(0, "Next", quinnFestivalSexingsOneSausage, [1, cIdx, vIdx, zilDrones]);
			break;
		case 1:
			showBust(quinnBustDisplay(true), "ZIL_CHAMPS_NUDE");
			showName("\nQUINN");
			
			cIdx = pc.cockThatFits(quinnAnalCapacity());
			if(cIdx < 0) cIdx = pc.smallestCockIndex();
			
			output("<i>“Now then,”</i> she says, once she’s come down, shooing away the male making oral love to her. <i>“You, my good boy... you lie down here. Yeeessss, that’s it,”</i> she whispers, as she slides herself over to the smallest zil, his narrow chest heaving, stubby dick stood to attention. His backside still gaped and leaking [pc.cum], he watches entranced, barely able to breathe, as the hands of Quinn advance up his frame, sparing caresses for his chest and chin. Instinctively he reaches out, grips her shoulders - and then immediately lets go, shocked at his own impropriety. His fresh, young face softens into delight when she takes his hands and tenderly places them back where they were.");
			output("\n\n<i>“Your Quinn is generous, your Quinn is true,”</i> she says, positioning her opened, gooey pussy over his jet-black erection. <i>“The last shall come first in her domain.”</i> She beckons the rest of you to move into her as she lowers herself down; the little guy moans, quivering, as her butt meets his thighs with a squelch. Her eyes are half-lidded as she reaches out and grips a foreskinned zil dick in each hand; deep in the otherworldly fantasy she’s spun around her, a sex goddess who needs only to extend a hand to find the ready erection of a worshipper.");
			output("\n\n<i>“You don’t need help, do you?”</i> she sighs over her shoulder at you, her abdomen and bare, peachy ass arched towards you, her stinger grazing over your [pc.chest].");
			if(pc.libido() < 33) output(" You grip your honey-slathered [pc.cockNoun " + cIdx + "] prospectively. Well, maybe just a bit... your hesitancy is all the reply Quinn needs. The inch-long barb sinks into your [pc.skin], the biting pain of the sting preceded by purest lust flooding into your veins, inflaming your senses and powering molten steel into [pc.eachCock]. You gasp, and groan as even more pheromones fill your lungs. Fuck, these bees... <b>fuck</b> these bees! Feverishly you reach forward and grip her by the tits, sinking your fingers into their softness as you trample over the zil boi’s legs in order to press your tautening erection against the orange ring of her anus, drawing a delighted cry out of her.");
			else output(" Of course you don’t. You answer her by glowering at her, clutching your dripping, [pc.cockNoun " + cIdx + "], drinking in her rich, slim body, and your barely caged libido reacts, powerful heat swelling up your semi-erect penis. She bites her lip as she stares at it, and she cries out delightedly as you sink your fingers into her tits, holding her steady as you press the head against the orange ring of her anus.");
			
			pc.cockChange();
			
			output("\n\nThe zil boys in front watch, hypnotized, as she pleasures their cocks with masterful shifts and coils of her hands, her soulful, golden eyes on them as she writhes her body, stirring the little guy within her pussy at the same as she gives back to you, working your [pc.cock " + cIdx + "] past her tight, hot entrance, her supple buttocks quivering. It’s the second ass you’ve been inside of tonight, and nope, you aren’t getting tired of that sensation even slightly; the fierce tightness, the slowly realized gratification as more and more of your throbbing cock is gloved by it, the way your lust is pumped up harder and harder until you’re all but forced to grip Quinn’s graceful body and hump into her, small explosions of pleasure going off in your mind as you slide out of her opened hole only to pummel yourself back in, spreading her deep...");
			if(flags["QUINN_EVERY_HOLED"] != undefined) output(" The fact it’s all down to you, carefully introducing her to the hitherto unknown pleasures of anal, only makes the pushing into her well-trained asshole all the more glorious.");
			output("\n\nShe shivers and sighs, and at last moans full-throated, affixed upon two dicks, all the while she lavishes two more with strokes and kisses and licks, eventually working the two taller lads into such a lather that they press themselves inwards, armored thighs catching the candlelight as they cram their glossy dicks into her mouth at the same time, rubbing against each other as they bathe in the wet, silky majesty of their ruler’s mouth, thrusting their athletic, boyish thighs into her face. The primmest matriarch in the galaxy couldn’t sound proper with that going on, and the sloppy, muffled smacks and saliva-flecked gulps fill your ears as you pump into her backside, her buttocks reverberating to the rhythm your [pc.thighs] beat upon them, intense lust now thrumming up your shaft and swelling your " + (pc.balls > 0 ? "[pc.balls]" : "ardor") + ".");
			output("\n\nThe little guy beneath her cries out, a sonorous, buzzing hymn to abandon as he shivers in orgasm, humping upwards into Quinn’s golden snatch with desperate heaves of his plump thighs. She rocks on top of him, dressed in gripping, fondling hands, pleasuring all four of her honor guard at the same time. How is one average-sized zil maiden doing it? You don’t care; right now she’s a fertility goddess, and you are extremely glad to be doing up the her ass. Your [pc.cock " + cIdx + "] bulges up, you groan mightily, and you are leaping over the edge again, channelling [pc.cumVisc] [pc.cumNoun] into her clenching, rubbing heat in a guttering torrent, ecstasy lighting up your nerves and making you thrash into the polished curve of her back, driven to push out every drop you have into her until it’s spurting richily out around it, drooling down her butt-cheeks in fat droplets.");
			
			pc.orgasm();
			
			output("\n\nYou relax backwards, sighing at the distinctive pleasure of drawing your spent cock up and out a cum-slathered colon, and watch her go, intently suckling on one male whilst juddering her hand up and down the other. A jet of orange spatters across her collarbone and breasts; the guy mired in her mouth shivers and cries out for joy, reactively gripping her hair and pumping forwards, a long string of honey-seed lolling down from her mouth.");
			output("\n\n<i>“Mmm,”</i> she coos at last, breaking away to spoon into you and the smallest, breasts against you, favoring you all with that characteristic, faint smile of hers, cheeks glowing, utterly undiminished by the fact she is now spattered with cum. <i>“That was pleasing. But we are barely started, are we, my brave warriors?”</i> She wriggles her body, hard boots touching your [pc.legs]; her arms snake around your shoulders, mischievously plucking at your alien [pc.skinFurScales]. You allow a long sigh to flume out of your nostrils. She can’t want more, can she?");
			output("\n\nYes. Yes she can. The two bigger zil boys watch, still deep under the pagan witchery she’s cast over the evening, as she spreads her legs, spreading her cum-and-honey oozing pussy for them.");
			output("\n\n<i>“Quinn is bountiful, Quinn is generous,”</i> she repeats, gazing up at them coquettishly. <i>“All who have proven themselves shall have their way with her. Yeeessszzzz...”</i> She groans, as one of the boys seizes the initiative, almost stumbling into her waiting embrace. It only takes a few strokes of his trembling hand for his six-inch jet dick to become firm again, and for him to sink it home into her thoroughly lubricated cunt. <i>“Love me like you danced. Love me like I love all of you! Yes!”</i>");
			output("\n\nCan you keep it up? Sexual honey wafts through your airways in sugared waves, blowing you onwards. The other tall zil advances on you, dark, helpless arousal on his face, beetle-black eyes on your [pc.chest], and the closer his wagging, gleaming erection gets, the more intense the smell gets, the harder it is to deny. You smile at him beatifically, position yourself on your side, letting him get a glance of your [pc.vagOrAss " + vIdx + "]. Eventually, you’ll have your turn in the all-loving embrace of Quinn. In the meantime... you will please her, and her other drones, the best way you know how.");
						
			processTime(15);
			pc.changeLust((0.5 * pc.lustMax()));

			output("\n\n");
			
			addButton(0, "Next", quinnFestivalSexingsOneSausage, [2, cIdx, vIdx, zilDrones]);
			break;
		case 2:
			showBust(quinnBustDisplay(true), "ZIL_CHAMPS_NUDE");
			showName("\nQUINN");
			
			output("It’s only after many sweaty, lusty hours frollicking with the four zil, rutting and licking and mashing their delightfully sweet organs into and onto your own in every combination you care to think of, that you get your chance. You are Quinn’s most treasured champion, after all, and the first shall come last.");
			output("\n\n[pc.EachCock] is aching by now, driven to pulsating orgasms that you’ve long since lost count of; but you are determinedly hard for her, clinched in her arms and sliding in and out of her widened honeypot, sensation fizzing up your shaft as you perform your dronely duty. You are being kindly aided in this by one of the tall zil boys; his strong fingers clutch your shoulders as his hard, strapping thighs slap against your [pc.ass], driving his dick into your [pc.vagOrAss " + vIdx + "] with gratified gasps and grunts. ");
			
			if(vIdx >= 0) pc.cuntChange(vIdx, zilDrones[0].cockVolume(0));
			else pc.buttChange(zilDrones[0].cockVolume(0));
			
			output("\n\nEvery fresh dip of that thick, smooth fuck-truncheon deep into your " + (vIdx >= 0 ? "pussy walls" : "colon") + " sends an almost electric surge through your body, driving your own penetration on in an almost helpless, frenzied manner. Laid back on her furs, Quinn watches it all in open-mouthed delight, golden eyes shining, emitting little squeaks and buzzes of pleasure as she simultaneously takes yet another good, hard breeding whilst acting the voyeur.");
			output("\n\nThe zil-boy pauses for a moment, positioning himself afresh, and then determinedly drills into you from a fresh angle. This time it’s nerve-janglingly, thrillingly telling, that honey-slathered blunt head of his butting into your " + (vIdx >= 0 ? "g-spot" : "prostate") + ". You can’t help yourself; you " + pc.mf("shout out", "wail") + " in wordless delight and cum for... who knows. The sixth time this night, maybe? You wouldn’t think there’d be a drop left in your poor, overworked " + (pc.balls > 0 ? "[pc.balls]" : "penile gland") + ", but that was before you got ");
			if(vIdx >= 0) output(" your [pc.vagina " + vIdx + "] pounded simultaneously by an overexcited insect stud");
			else output(" your prostate brutally milked by an overexcited insect stud");
			output(", your inward sex stretched and pummeled to its limit. The [pc.cum] is practically forced out of your [pc.cock " + cIdx + "], mired deep in Quinn’s gloopy, leaking pudding of a cunt, joining the many, many swimmers already in there, her womb utterly choked in fertile seed.");
			output("\n\n<i>“That’s it, all of it! All of it! Aallll,”</i> she groans, seemingly directing the instruction at both of you, her hot, sweaty belly and breasts molding into your [pc.skin]. Your cock is still throbbing dryly in her cum-soaked channel, every last drop of [pc.cum] kneaded out of it, as you feel your other amorous partner give a final, ecstatic shudder, draw himself out of your thoroughly gaped " + (vIdx >= 0 ? "pussy" : "backside") + " and spurt sweet gloopiness up your back. You can’t muster anything more than a woozy groan to this, so spent are you. A pair of lips press into your brow; a kind, motherly kiss.");
			output("\n\n<i>“Quinn was bountiful, Quinn was generous,”</i> she murmurs. She raises herself up, admiring the split, leaking, ravished sight between her legs. It looks like... well, it looks like " + (vIdx >= 0 ? "three guys and a shemale" : "four guys") + " went to town on it for the entire night. <i>“My loyal warriors proved their worth doubly. Sleep now, my strong drones. Sleep, knowing your duty is fulfilled.”</i>");
			output("\n\nThe other two obeyed that order some time ago by the looks of things; eyes closed and mouths open, chitinous legs entangled on the other side of the bed. Exhaustion pulling at your limbs and your [pc.groin] throbbing like you don’t think you’ve ever felt before, you are powerless to do anything but follow suit. You collapse into the sweat and honey-spattered furs and are deep asleep within moments.");
			output("\n\n");
			
			// Set time to 06:30, Lust to 0, -1 Libido
			processTimeToClock(6, 30);
			for(i = 0; i < 3; i++) { pc.orgasm(); }
			sweatyDebuff(2);
			pc.libido(-1);
			
			addButton(0, "Next", quinnFestivalSexingsOneSausage, [3, cIdx, vIdx, zilDrones]);
			break;
		case 3:
			showBust(quinnBustDisplay(true));
			showName("\nQUINN");
			
			output("You awake in stages, the heat of the Mhen’gan day eventually making the close interior of the yurt intolerable. You shiver slightly when you flop out of bed - hours of rest have not alleviated the mighty ache in your genitals. You may have only been part of the tag team but good <i>Void</i> did that waspy slut-queen-pagan-apparition-thing go for it last night. You are sticky with honey cum both male and female, and right now you doubt the taste of it will ever leave you.");
			output("\n\nPicking up your scattered [pc.gear] and leaving two zil boys still slumbering behind you, you tenderly make your way back down to the circle. Quinn is already there, stationed back on her grand, carved chair. She looks unperturbed, glossy and clean, as if nothing out of the ordinary transpired last night - except, perhaps, for a slightly wider smile stretched across her round face, and maybe a certain far-away gleam in her golden eyes. As tactfully as you can, you ask if everything went according to plan.");
			output("\n\n<i>“We shall see in the moons to come, won’t we?”</i> comes the cool response. She taps a thoughtful finger on her knee. <i>“But I believe the zpirits were pleased. Thank you for being part of it, [pc.name]. As I told you, you are a blessing upon this tribe, and if I cannot be gotten with child even if I have you by my side... then I shall know it was never meant to be. I hope you found the ritual entertaining.”</i> She eyes you knowingly. <i>“I think you did. Perhaps visit the river, though.”</i>");
			output("\n\n");
			
			// +6 hours, female juices stat, load in backside, load in cunt, generic zil preg chance if applicable
			genericSleep((60 * 6) + 3);
			pc.applyPussyDrenched();
			pc.applyPussyDrenched();
			if(vIdx >= 0)
			{
				pc.loadInCunt(zilDrones[0], vIdx);
				pc.loadInCunt(zilDrones[0], vIdx);
			}
			else
			{
				pc.loadInAss(zilDrones[0]);
				pc.loadInAss(zilDrones[0]);
			}
			
			// End. Boot to Chieftain’s Circle. Set Quinn to general preg
			tryKnockUpQuinn(true);
			currentLocation = "12. Zil Village Winnar";
			flags["QUINNFEST_COMPLETE"] = 1;
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
	}
}
// Pair of Queens
// If femPC chose to participate
public function quinnFestivalSexingsPairOfQueens(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	clearMenu();
	
	var page:int = (arg.length > 0 ? arg[0] : 0);
	var cIdx:int = (arg.length > 1 ? arg[1] : -1);
	var vIdx:int = (arg.length > 2 ? arg[2] : -1);
	var zilDrones:Array = (arg.length > 3 ? arg[3] : [new ZilChampionSpear(), new ZilChampionBow(), new ZilChampionSpear()]);
	var i:int = 0;
	
	switch(page)
	{
		case 0:
			showBust(quinnBustDisplay(true), "ZIL_CHAMPS_NUDE");
			showName("\nQUINN");
			
			if(pc.hasCock())
			{
				cIdx = rand(pc.cocks.length);
			}
			
			vIdx = pc.findEmptyPregnancySlot(1);
			if(vIdx < 0) vIdx = rand(pc.vaginas.length);
			
			output("Quinn takes off her skull crown as she enters her yurt, laying it on a primitive table, her striped hair a beckoning, liquid motion down her back. Several clusters of candles have been lit inside, constellations in the darkness that contribute to the hot, close, dreamy atmosphere in here. It occurs to you that when the chosen warriors get in here, it’s going to get...");
			output("\n\nThe three of them pile in through the coarse tent flap, and instantly the space fills with their smell; sweet, intensely aroused zil, underlain by the musky salt of sweat, utterly overpowering, pulling the desire for sex up out of the deep currents of your mind and sending it crashing over every other thought you have. You exhale, long and low, as you feel [pc.eachVagina] melt, lavish amounts of [pc.femcum] drooling down your inner walls in rich anticipation. A glance at those fey, lean insect males tells you that, for all that they are the ones producing the scent, they are themselves transformed into pure, sexual beings, horny, single-minded drones, who expended every effort to get here and at last copulate with their glorious queen.");
			output("\n\nOr queens. The lust-filled stares, the wing twitches, are not for Quinn alone. You feel their avid, pupil-less eyes crawl up your [pc.legs], your [pc.ass], your [pc.chest]. From her lounging position on the bed, the zil matriarch bobs her head almost imperceptibly, and you follow the signal. You give the trio bedroom eyes over your shoulder as you");
			if(!pc.isNude())
			{
				output(" peel off your [pc.gear]");
				if(pc.hasArmor() && (pc.hasUpperGarment() || pc.hasLowerGarment())) output(", piece by piece");
				if(pc.hasLowerGarment() && (pc.hasUpperGarment() || pc.hasArmor())) output(", leaving your [pc.lowerUndergarment] for last");
			}
			else output(" sashay over to the bed, letting your bare rump bounce ever-so-gently");
			output(".");
			output("\n\nYou join Quinn on her grand, fur-piled bed, one long, slim leg bent upwards, that familiar, faint smile written on her lips. You knit a hand with her and share the view, the three slim, fit males drinking in everything, slaves to their lust as, oh-so-slowly, her breastplate slithers apart, the soft, vulnerable yellow of her breasts swelling into view. You cheekily reach across with your other hand to caress one, sliding your hand under its beautiful curve and sinking your fingers into it, receiving an ostentatious, buzzing sigh in response. You’re not sure if it comes from her or the boys.");
			output("\n\n<i>“Yes, my good, loyal, warriors,”</i> she sighs, <i>“all of this is yours... for the entire night. Your Quinn is bountiful. Your Quinn is generous.”</i> She points languidly at the smallest. <i>“Come here, my little one. You two... there is the starwalker champion.”</i> Her hand dips between your [pc.thighs], warm finger sliding between the lips of your [pc.vagina " + vIdx + "], holding them up to the flickering light. <i>“See how ready [pc.he] is? Waste no more time.”</i>");
			output("\n\nThe shorter one, the archer boi, with his enjoyably full-looking hips and cute, heart-shaped face (you’re put in mind of Able), stumbles onto the bed in a kind of a trance. His groin-plate comes loose with a click and a gasp, his stubby, foreskinned erection no longer willing to be caged, as he watches his ruler prowl forwards, tenderly caressing his arms and chin... and then your view is blocked out by slim, athletic, jet-black hips, and strong, insectile hands grasp you by the waist.");
			output("\n\nThe two bigger males pull you onto your hands and [pc.knees], made feverish by their arousal, their curious hands questing over your alien flesh, stroking your [pc.skinFurScales] and gripping your [pc.thighs] and " + (pc.hasTail() ? "[pc.tail]" : "[pc.butt]") + ", searching for anchorage and your most erogenous of zones. The groin-plate of the one in front flicks away like a beetle’s carapace, and instantly the air is fogged with sexual sugar, the smell of the thick, glossy, six-inch zil cock that flops out arrowing into your body like a hyperderm of Dumbfuck. [pc.EachVagina] " + (!pc.isSquirter() ? "drips" : "drools") + " [pc.femcum] in response, wet with anticipation, and your whole body feels incredibly sensitized, desperate to be touched, stroked, grasped.");
			output("\n\nGazing upwards coquettishly, you lap the very end of his cock, chasing the little bud of pre of the very end, the sweet, horny taste fills your mouth, and you coo with delight as the one behind takes a firm grasp of your [pc.hips], hands moving up and down your flanks as he lines himself up. The boy in front watches, awe and sensual delight on his elfin face, as you lick and fondle his obdurate length of jet, lavishing and teasing it with kisses and rolls of your [pc.tongue], simmering in the sexual daze you’re feeling; then you squeal as you are roughly entered, hard, glossy meat sliding past the entrance of your [pc.vagina " + vIdx + "] and spreading your wet, tender insides. You reach forward with your mouth at the same time, enveloping that delicious zil cock in your mouth, practically cumming on the spot as a sea of pheromones and tactile sensation overwhelm you, making you moan in lewd delight.");
			output("\n\n<i>“That’s it, my strong warriors,”</i> husks Quinn, from somewhere. The bed creaks, and you hear the little guy she has annexed for herself cry out, pure, boyish sexual abandon. <i>“Give it to [pc.him] good. You deserve it. [pc.He] deserves it. Your Quinn... oh... deserves to watch.”</i>");
			output("\n\n");
			
			processTime(8);
			// Set Lust to 100%
			pc.maxOutLust();
			
			addButton(0, "Next", quinnFestivalSexingsPairOfQueens, [1, cIdx, vIdx, zilDrones]);
			break;
		case 1:
			showBust(quinnBustDisplay(true), "ZIL_CHAMPS_NUDE");
			showName("\nQUINN");
			
			output("The boys are too excited to pace themselves. The one at your back judders into you, hard, athletic hips slapping a frenetic rhythm against your [pc.ass] as the other takes a firm grip of your head and thrusts his hard sweet meat past your [pc.lips], slathering a steady drip of honey-pre across your tongue and inner cheeks, filling your head with oozing, summery delight. Your [pc.vagina " + vIdx + "] is being filled and rubbed at a startling rhythm, digging in to that particular spot again and again, and you’re quickly forced to orgasm, your over-stimulated body clenching itself up and letting go brilliantly repeatedly, fingers digging into the soft furs beneath you and emitting muffled squeals of delight as your [pc.vagina " + vIdx + "] " + (!pc.isSquirter() ? "dribbles" : "spurts") + " [pc.femcum] in a wet, glorious rush.");
			
			pc.cuntChange(vIdx, zilDrones[0].cockVolume(0));
			
			output("\n\nThe giddy spit-roasting lasts a little while longer - the sighs and groans of Quinn and her partner fill your ears as readily as thick, sweet dick fills your holes, pulsing arousal through your core and making you shiver with pleasure - before the boys are pushed over the edge. They groan and cry out in harsh, buzzing tones as they fountain hot, gloopy honey seed into you, thrusting themselves into your mouth and pussy as deep as they can to bury it within. You coax them onwards with tight, loving draws of your lips and clenches of your vaginal muscles, vacuuming their delicious semen into your hungry, lusty body.");
			output("\n\nYou collapse onto your side when they finally withdraw, curling yourself into the arms of one of the boys, enjoying the press and heat of his tautly muscular body. By the way he strokes and clasps you, returning your fondling with interest, you can tell he is of a mind as you - only mildly satisfied, cuddle convalescing until you’re ready to fuck like horny teenagers again.");
			if(pc.isLactating())
			{
				output(" Your [pc.boobs] began to bead freely during the frenetic sex, and seeing this he descends to fasten his hard, smooth lips around one and take long, thirsty drags on them, drawing [pc.milk] into his mouth, humming to the " + (!InCollection(pc.milkType, [GLOBAL.FLUID_TYPE_HONEY, GLOBAL.FLUID_TYPE_MILKSAP, GLOBAL.FLUID_TYPE_NECTAR]) ? "tantalizing taste of alien milk" : "familiar taste of mother honey") + ". You coo as profound pleasure radiates through your breast, and you cradle his sweaty head as he drains you.");
				pc.milked(150, true);
			}
			output("\n\nYou watch as Quinn rides the small male, her hips locked around him and their jouncing as firm and loving as a mother’s discipline. Your arousal continues to grow, pulsing within your cum-slathered pussy as you watch the drone shiver and cry out, holding onto her carapace-clad hips as he pumps into her reactively, a husky laugh and feminine sigh brushing the dark air as he paints her walls with boy sugar.");
			output("\n\n<i>“The last shall come first, in my domain,”</i> she murmurs, planting a kiss on the cute little guy’s sweaty brow. He looks up at her, bleary and hypnotized, snared in the spell she’s cast over this evening. It’s the same for the other two; even though the insect stud in your arms is becoming lustier, groping your [pc.ass] and rubbing his drooling, six-inch dick to hardness again against your [pc.belly], his eyes are fixed upon Quinn. She crawls across the bed like a prowling feline, grasping the other male’s outstretched knob. He exhales slowly as she wrings him briskly, gooey orange adhering to her hand.");
			output("\n\n<i>“Your Quinn is generous, your Quinn is bountiful,”</i> she repeats, curling the fingers of her other hand at the one in your arms. Hypnotized, he disengages from you, kneeling in front of her and watches in reverent delight as she masturbates them both at the same time, their leaking, foreskinned dicks inches away from her calm, pretty face. You are put out by this blatant piece of boy-stealing only for a moment - there are more of them here than there are of you, after all. A wink, a gentle smile, and a spreading of your [pc.thighs] is all it requires to attract the trappy wasp boy, discarded on the furs like you, over to your fragrant petals. His delicate fingers find purchase around your thighs, and his brilliant yellow tongue dabs of your oozing [pc.vaginaNoun " + vIdx + "], alighting on your [pc.clit " + vIdx + "], drawing an encouraging coo out of you as that sucking tip sends delicious tingles shivering into your core.");
			output("\n\nThe zil boi licks you, drawing away the sweet remains his fellow left inside you, whilst you watch Quinn lavish the other two with strokes and kisses and licks, eventually working them into such a lather that they press themselves inwards, armored thighs catching the candlelight as they cram their glossy dicks into her mouth at the same time, rubbing against each other as they bathe in the wet, silky majesty of their ruler’s mouth, thrusting their athletic, boyish thighs into her face. The most reserved matriarch in the galaxy couldn’t sound proper with that going on, and the sloppy, muffled smacks and saliva-flecked gulps fill your ears as another, shimmering orgasm begins to hove into view, driven on by the skilful flicks, sucks and curls of that lovely, long, warm tube-tongue inside you.");
			output("\n\nCan you keep it up? Sexual honey wafts through your airways in sugared waves, blowing you onwards. You feel utterly immersed in your role as a queen, providing mind-blowing sex to your faithful ball of drones, each one taking it in turns to wrap their strong, thin limbs around you and pounding you silly, lining your orifices with giddying liquid gold.");
						
			processTime(12);
			// Lust down 50%, load in vagina
			pc.changeLust((-0.5 * pc.lustRaw));
			pc.loadInCunt(zilDrones[0], vIdx);
			pc.loadInMouth(zilDrones[2]);

			output("\n\n");
			
			addButton(0, "Next", quinnFestivalSexingsPairOfQueens, [2, cIdx, vIdx, zilDrones]);
			break;
		case 2:
			showBust(quinnBustDisplay(true), "ZIL_CHAMPS_NUDE");
			showName("\nQUINN");
			
			output("It’s only after many sweaty, lusty hours frollicking with the four zil, rutting and licking and mashing their delightfully sweet organs into and onto your own in every combination you care to think of, things simmer down to a slow burn. The archer twink clasps your [pc.chest], his fat, stubby cock stretching the sensitive ring of your [pc.anus]; the one below has you sitting on his sturdy, longer length, wedged deep within your [pc.vagina " + vIdx + "]. They fuck you slowly but surely now, little jerks and rises of their hips, their energies almost spent but driven on by a determination to use every inch of the intoxicating alien queen, their fuck truncheons pressing into each other through your tender walls sending little jolts of pleasure up your spine and making [pc.eachVagina] shiver and course with [pc.femcum].");
			
			pc.buttChange(zilDrones[1].cockVolume(0));
			pc.cuntChange(vIdx, zilDrones[0].cockVolume(0));
			
			output("\n\nThis position lets you watch Quinn, her slim hips locked around the last boy, making sure he performs his dronely duty. She bites her lips and hums encouragement, mouth opening as his perky, chitinous buttocks clench and he picks up the pace, the impact of his thrusts sending shivers of motion through her pretty breasts.");
			output("\n\n<i>“That’s it, all of it! All of it! Aallll,”</i> she groans, seemingly directing the instruction at all of you, throwing her head back as orgasm overcomes her. The boy behind you sets his teeth into your shoulder, hot breath hissing over your [pc.skinFurScales] as he spreads your back passage as deep as he can and fills it with gloopy, warm sperm, surely the last his tight little balls have to offer. You coo and moan, upping the tempo of the bouncing of your own [pc.ass], stirring both dicks within your heavily honey-cummed walls, inspiring the one you’re riding to grasp your [pc.hips] hard and, with a harsh, almost pained groan, also squeeze out the very last he has to offer.");
			output("\n\nYou wheeze with exhausted delight; you feel glutted, stuffed with sweet seed, the stuff oozing from every hole you own. It’s all you can taste. You don’t care. In a daze you flop onto your side, watching as the zil goddess of fertility slowly allows the last drone to fall from her arms.");
			output("\n\n<i>“Quinn was bountiful, Quinn was generous,”</i> she murmurs. She raises herself up, admiring the split, leaking, ravished sight between her legs. It looks like... well, it looks like " + (!pc.hasCock() ? "three guys" : "three guys and a shemale") + " went to town on it for the entire night. <i>“My loyal warriors proved their worth doubly. Sleep now, my strong drones. Sleep, knowing your duty is fulfilled.”</i>");
			output("\n\nExhaustion pulling at your limbs and your [pc.groin] throbbing like you don’t think you’ve ever felt before, you are powerless to do anything but obey. You collapse into the sweat and honey-spattered furs and are deep asleep within moments.");
			output("\n\n");
			
			processTimeToClock(6, 30);
			for(i = 0; i < 3; i++) { pc.orgasm(); }
			sweatyDebuff(2);
			pc.libido(-1);
			
			addButton(0, "Next", quinnFestivalSexingsPairOfQueens, [3, cIdx, vIdx, zilDrones]);
			break;
		case 3:
			showBust(quinnBustDisplay(true));
			showName("\nQUINN");
			
			output("You awake in stages, the heat of the Mhen’gan day eventually making the close interior of the yurt intolerable. You shiver slightly when you flop out of bed - hours of rest have not alleviated the mighty ache in your genitals. Good <i>Void</i> did that waspy slut-queen-pagan-apparition-thing go for it last night; " + (pc.libido() > 66 ? "even as fuck-hungry a being as you" : "you") + " feel like you were caught up and washed out in her wake. You are sticky with honey cum both male and female, and right now you doubt the taste of it will ever leave you.");
			output("\n\nPicking up your scattered [pc.gear] and leaving two zil boys still slumbering behind you, you tenderly make your way back down to the circle. Quinn is already there, stationed back on her grand, carved chair. She looks unperturbed, glossy and clean, as if nothing out of the ordinary transpired last night - except, perhaps, for a slightly wider smile stretched across her round face, and a certain far-away gleam in her golden eyes. As tactfully as you can, you ask if everything went according to plan.");
			output("\n\n<i>“We shall see in the moons to come, won’t we?”</i> comes the cool response. She taps a thoughtful finger on her knee. <i>“But I believe the zpirits were pleased. Thank you for being part of it, [pc.name]. You are a blessing upon this tribe, and if I cannot be gotten with child even if I have you by my side... then I shall know it was never meant to be. I hope you found the ritual entertaining.”</i> She eyes you knowingly. <i>“I think you did. Perhaps visit the river, though.”</i>");
			output("\n\n");
			
			// +6 hours, load in backside, load in mouth, very high generic zil preg chance if applicable
			genericSleep((60 * 6) + 3);
			pc.applyPussyDrenched();
			pc.applyPussyDrenched();
			pc.loadInCunt(zilDrones[0], vIdx);
			pc.loadInCunt(zilDrones[0], vIdx);
			pc.loadInAss(zilDrones[1]);
			pc.loadInAss(zilDrones[1]);
			pc.loadInMouth(zilDrones[2]);
			pc.loadInMouth(zilDrones[2]);
			
			// End. Boot to Chieftain’s Circle. Set Quinn to general preg
			tryKnockUpQuinn(true);
			currentLocation = "12. Zil Village Winnar";
			flags["QUINNFEST_COMPLETE"] = 0;
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
	}
}
// Drone Alone
// If PC won the fight
public function quinnFestivalSexingsDroneAlone(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	clearMenu();
	
	var page:int = (arg.length > 0 ? arg[0] : 0);
	var cIdx:int = (arg.length > 1 ? arg[1] : -1);
	var cIdx2:int = (arg.length > 2 ? arg[2] : -1);
	var i:int = 0;
	
	switch(page)
	{
		case 0:
			showBust(quinnBustDisplay(true));
			showName("\nQUINN");
			
			var cocksList:Array = [];
			
			for(i = 0; i < pc.cocks.length; i++)
			{
				if(pc.cocks[i].cLength() < 7) cocksList.push(i);
			}
			if(cocksList.length > 0) cIdx = cocksList[rand(cocksList.length)];
			if(cIdx < 0) cIdx = pc.smallestCockIndex();
			
			if(pc.cocks.length > 1)
			{
				cocksList.length = 0;
				for(i = 0; i < pc.cocks.length; i++)
				{
					if(i != cIdx) cocksList.push(i);
				}
				if(cocksList.length > 0) cIdx2 = cocksList[rand(cocksList.length)];
			}
			
			output("Several clusters of candles have been lit inside Quinn’s yurt, constellations in the darkness that contribute to the hot dreamy atmosphere that envelopes you as the tent-flap brushes against your " + (pc.hasTail() ? "[pc.tail]" : "[pc.butt]") + ". She moves to take off her skull crown... and reflexively you stop her, pressing the strange, pale headpiece back down over her brow. She freezes, the candlelight catching her golden eyes behind those empty sockets, and you eat her with your eyes, the deadly aspect of her teardrop abdomen and the horned skull framing the slim womanliness of her body, beneath the stern carapace of which finally lie her soft, tender, delectable parts. Parts you now have sole claim to.");
			output("\n\nYou want it all.");
			if(flags["SEXED_QUINN"] != undefined) output(" You’ve fucked Quinn before, after all - you haven’t fucked the primal death-fertility goddess she has assumed the mantle of tonight.");
			else output(" Quinn, the primal death-fertility goddess she has assumed the mantle of tonight - all.");
			output(" You lower your hand from the crown, sweep it down the arc of her back, taking her into your arms so you can explore every black, gleaming curve of her body, rock hard but offering the tiniest, tantalizing give when you squeeze.");
			output("\n\nShe pulls away, sitting herself down on her bed, spreading her legs as she scooches further and further back on the furs. Of course with that thing on her head it’s impossible to catch her expression, but you think you see the gold of both understanding and excitement gleaming deep in the gloom of those eye sockets.");
			output("\n\n<i>“You proclaimed yourself the only champion worthy of claiming me,”</i> she says, in those same cool, certain intonations with which she presided over the duel. As she speaks her groin and breastplate slowly peel back, beetle wings splaying to reveal sweet yellow fields of plenty. Your heart begins to thump, intense arousal pulsing into your [pc.groin], as you gaze at the rise of her petite, pretty breasts and the long, plump lips of her pussy. They are gently parted, strings of honey hanging between them. She’s aroused. <i>“What’s more, you proved that you are. So now, my champion, my only champion...”</i> She trails off in a luxurious, husky drone, her long fingers dipping between her legs, sampling herself. <i>“You will have to do the work of three drones.”</i> Her tone thickens into one of urgent, lusty demand. <i>“Make me carry your child.”</i>");
			output("\n\nYou tear off your [pc.gear] in an impetuous hurry and clamber onto the bed. [pc.EachCock] is semi-erect already, and all it takes for " + (pc.cocks.length == 1 ? "it" : "them") + " to become taut with burning heat is to breathe Quinn in - that sweet, intoxicating smell pouring off her oozing pussy, wiring from your nostrils to seize at your maleness, her body reaching out with the same needy directive her voice did.");
			output("\n\nShe gasps as you clasp her, pushing your [pc.chest] against the lovely suppleness of her breasts, and then coos as you grip one bare yellow buttock and give it a rough squeeze, reacting readily to your savageness, twining her long legs around your [pc.legs] with barely concealed need. It’s the work of a moment to line yourself up and penetrate her, spreading her slickened labia around yourself and then in to the silky, sweltering dream that is her cunt.");
			
			pc.cockChange();
			
			output("\n\n");
			if(pc.cocks[cIdx].cLength() < 7) output("She could have been designed for you, so perfectly do her tight walls glove you. You could get addicted to the sensual perfection of that glide inwards, the buzzing sound her breath makes when it catches in her throat, the stern smoothness of her chitinous limbs contrasting to the softness of her innards. Perhaps you already are.");
			else output("Your massive cock is too big really for a petite insect girl like her, but she’s utterly determined; emitting little grunts, buzzes and moans as she pushes her long, svelte hips into you, stretching herself out so she can sample more and more of your [pc.cock " + cIdx + "]. You’re ruining her for any of her own race, and in your current, bestial mindset, that’s perfect. And you share that determination - this is your conquest, after all. You let her do the work, opening your [pc.thighs] slowly but surely to sink more and more of your thick girth into tight honey until you feel your [pc.cockHead " + cIdx + "] bump gently against her cervix.");
			output(" You’re far too turned on to give her respite once you’ve found your limit - you draw yourself back out, feeling the honey dripping down your naked shaft, only to piston yourself back in with a stern push of your [pc.hips], inundating her bare breasts and slim neck with wolfish licks, nibbles and kisses as you fuck her ardently.");
			output("\n\nThe sight of the horned skull in front of you is alarming, strange, disguising her whole face aside from her mouth - but that hangs open, emitting little huffs, buzzes and moans as you saw into her that are music to your ears. It’s enticing, like a mask, turning the person you’re fucking into the ground into a strange creature from the underworld. You think you feel her cum - sleek tightness rippling around you, honey coruscating off your [pc.cock " + cIdx + "], hips and taut stomach urgently flapping back into you - and you just keep on going, intent on turning that sopping little fuck-pocket of hers into a mold of your cock for all time.");
			output("\n\nWhen your own orgasm beats down the door, you seize her beneath the knees and lift her legs up, her heels tapping against your back as you screw her into the bed, livid with pheromonally-charged lust. When your [pc.cockHead " + cIdx + "] engorges and [pc.cum] surges up your shaft, it comes out in champagne-like flurries, giddy surges that you pump into her until it’s " + (!pc.cumQ() < 500 ? "dribbling" : "squirting") + " out around your girth. Quinn’s mouth is drawn up in a delighted, tautened sneer as you do it - a terrifying, exhilarating accompaniment to the skull - and husky, wordless sounds of delight are pushed out of her with every juicy pump, until she finally relaxes into a meandering, satisfied moan when you slow, release her legs, and gather her lithe frame into your arms again.");
			output("\n\n");
			
			processTime(11);
			pc.orgasm();
			
			addButton(0, "Next", quinnFestivalSexingsDroneAlone, [1, cIdx, cIdx2]);
			break;
		case 1:
			showBust(quinnBustDisplay(true));
			showName("\nQUINN");
			
			output("<i>“But you aren’t done yet, are you?”</i> she murmurs in your ear, long, clever fingers trailing down your ear, scratching lightly at your [pc.chest]. <i>“My chosen. My champion. Remember - you undertook the duties of three.”</i> Those smooth digits wrap themselves around your " + (cIdx2 < 0 ? "[pc.cock " + cIdx + "]" : "[pc.cock " + cIdx2 + "]") + ", gently tugging, coaxing sensual intent");
			if(cIdx2 < 0) output(" back into your throbbing, honey-slickened knob.");
			else output(" into it. Void, she knows exactly what she’s doing, picking on " + (pc.cocks.length == 1 ? "a" : "the") + " dick which didn’t get to sample the slick, tight give of her sex...");
			output(" You stiffen slightly as you feel something pointed scrape up the [pc.skin] of your [pc.legs]. <i>“Are you going to need help?”</i> whispers the skull goddess, her lethal three inch stinger pricking you with gentle, teasing intent, her poison-bloated insect abdomen rising and falling.");
			output("\n\n");
			if(pc.libido() < 33) output("You consider your semi-erect [pc.cockNoun " + cIdx + "] prospectively. Well, maybe just a bit... your hesitancy is all the reply Quinn needs. The barb sinks into your [pc.skin], the biting pain of the sting preceded by purest lust flooding into your veins, inflaming your senses and powering molten steel into [pc.eachCock]. You gasp, and groan as even more pheromones fill your lungs. Fuck, these bees... <b>fuck</b> these bees!");
			else output("Of course you don’t. You answer her by glowering at her, drinking in her rich, slim body, and your barely caged libido reacts, powerful heat swelling up the semi-erect penis in her hand. She bites her lip as she stares at it, and then cries out delightedly as you sink your fingers into her tits, holding her steady as you muffle her cries with your mouth, snogging her lasciviously.");
			output("\n\nFeverish with arousal, drunk on the role of alpha-drone, you roll her over, position her on her hands and knees, and push the [pc.cockHead " + cIdx + "] of your regained erection against her opened, leaking cunt; she rears her abdomen");
			if(pc.libido() < 33) output(" (her stinger dripping with your blood)");
			output(" and angles her pert bum up eagerly. Oozing a sorbet of honey and [pc.cum] and softened by the battering you just gave it you’d have no problem at all slipping yourself back in, but you take your time, dipping your bulging head in softly and then retracting, just enough to open her lips, reaching down to finger her exposed clit, enjoying the feeling subsuming your cockhead, teasing her with knowing strokes until she’s huffing, impatiently bucking backwards and leaking liquid sugar down her prim, pretty thighs.");
			output("\n\n<i>“Fuck me, make me feel it deep!”</i> the goddess snarls over her shoulder, sunken golden eyes flashing at you. <i>“I demand it!”</i> Those horns rearing up over her head catch your attention, and it is with deep satisfaction that you seize them and do as she orders, pressing yourself home into deep honey with a wondering groan, sheerest pleasure pulsing up your [pc.cockNoun " + cIdx + "].");
			output("\n\nVoid, maybe you are addicted to this, the Queen’s sweet pheromones overriding every impulse you have, a drone hand-picked to be her captive breeding slave until she has a hive packed with her children. If so, it’s the best fate of all, to buck your [pc.hips] into her soft backside, slap your " + (pc.balls > 0 ? "[pc.balls]" : "groin") + " into the small waterfall of honey and your own spent seed running down her thighs, to grip her sacred horns and lose yourself in the give and heft of the plush wetness running up and down your cock, rippling and clenching you intermittently, willing you on, bringing your arousal to another brilliant point.");
			output("\n\nYou’d pull out and shower her with [pc.cum] this time, demonstrate the virility of the Chosen Drone in the crudest, most glorious way possible... but no, you have a duty here, and it won’t be fulfilled until her womb is utterly packed with your thick, teeming cum. You groan mightily as orgasm overcomes you again, your muscles locking and forcing out great gobbets of [pc.cum], and you make sure every last drop of it is buried deep in Quinn’s pussy.");
			if(pc.cumQ() >= 1500) output(" You absolutely <i>can</i> do the duty of three sissy zil guys, and since she demanded it you give her it, unloading the entirety of your backed-up reserves into her. She gasps and then cries out in shock as her stomach pouches out with the vast amount you are ejaculating into her; you hold her steady, one hand gripping a horn and the other on her shoulder, even as [pc.cumColor] fluid feeds back and squirts out in every direction. You don’t stop until " + (pc.balls >= 2 ? "your [pc.balls]" : "[pc.eachCock]") + " ache and the zil matriarch has her barely-believing hands upon what looks like a third trimester pregnancy.");
			output(" The woozy, gratified ‘mmm’ you draw from her by the end, as you finally withdraw your dripping cock from her cum-choked hole, is pure poetry.");
			output("\n\n<i>“Sleep now, my champion,”</i> she whispers, once you’ve collapsed your sweat-streaked form into the welcoming embrace of the furs. You feel the plushness of her breasts press against your [pc.chest], her lithe arms spreading themselves around you. <i>“Regain your strength. I will require more of you - in the morning.”</i>");
					
			processTime(14);
			// -50% lust
			pc.changeLust((-0.5 * pc.lustRaw));
			
			output("\n\n");
			
			addButton(0, "Next", quinnFestivalSexingsDroneAlone, [2, cIdx, cIdx2]);
			break;
		case 2:
			showBust(quinnBustDisplay(true));
			showName("\nQUINN");
			
			output("Your last waking thoughts before you descend into a deep, deep sleep is that maybe she’s exaggerating. But, no, she wants that baby, and you are very much expected to do the work of three. You are awoken at dawn by alluring whispers in your ears, guileful touches and squeezes, a hand on [pc.eachCock] stroking you to hardness, leading you lovingly but firmly back into deepest, lustiest heat.");
			output("\n\nShe mounts you once you’ve fully awoken and are completely under her spell, sliding her slickness down the shaft of your [pc.cock " + cIdx + "]; she must have put the skull to one side whilst she herself slept, but has put it back on now, fully aware of the effect it’s had on you. You stare up at it, charms shaking and catching the candlelight as her small, perfectly proportioned butt clenches and subsides, her hands gripping you by the shoulders, briskly kneading your hot, tender fuck-pole with the walls of her cunt, little ‘wuff’ noises puffing out of her mouth, naked and lonely underneath the forbidding bone facade.");
			output("\n\nIt’s a beautiful, bizarre dream to be fucked like this and you are subsumed by it, gripping her buttocks, arms and breasts as you are coiled and coaxed upwards into one final, brilliant orgasm. You reach up and kiss her deeply as you reach it, [pc.tongue] dancing with her brilliant yellow proboscis as you go off like a firework, fountaining a fresh load of glorious [pc.cum] up into her waiting womb, willing the clenches on with little thrusts of your [pc.thighs]. Your [pc.cock " + cIdx + "] feels somewhat like a shrivelled piece of dried fish by the time it flops, aching, out of her cum-stuffed pussy, but it’s sheerest pride and gratification that throbs through the rest of you, particularly when she falls onto your [pc.chest] and [pc.belly], sighing and fondling the " + (pc.tone > 30 || pc.thickness < 30 ? "defined muscles" : "meaty suppleness") + " of her champion admiringly.");
			output("\n\nYou return to a well-earned doze after that, awakening a couple hours later in the full heat of the Mhen’gan day, the close interior of the yurt made intolerable. You shiver slightly when you flop out of bed - hours of rest have not alleviated the mighty ache in your genitals. Good <i>Void</i> did that waspy slut-queen-pagan-apparition-thing go for it last night. It’s difficult to believe the taste and smell of honey pussy will ever leave you.");
			output("\n\nPicking up your scattered [pc.gear], you tenderly make your way back down to the circle. A crown-less Quinn is already there, stationed back on her grand, carved chair. She looks unperturbed, glossy and clean, as if nothing out of the ordinary transpired last night - except, perhaps, for a slightly wider smile stretched across her round face, and maybe a certain far-away gleam in her golden eyes. As tactfully as you can, you ask if everything went as she hoped.");
			output("\n\n<i>“We shall see in the moons to come, won’t we?”</i> comes the cool response. She taps a thoughtful finger on her knee. <i>“But I believe the zpirits were pleased. Thank you for being part of it, [pc.name]. As I told you, you are a blessing upon this tribe, and if I cannot be gotten with child even by you... then I shall know it was never meant to be. I hope you found the ritual entertaining.”</i> She eyes you knowingly. <i>“I think you did. Perhaps visit the river, though.”</i>");
			output("\n\n");
			
			// -0 Lust, -2 Libido, female juices stat, + 8 hours
			genericSleep((60 * 8) + 3);
			pc.applyPussyDrenched();
			pc.applyPussyDrenched();
			for(i = 0; i < 3; i++) { pc.orgasm(); }
			sweatyDebuff(2);
			pc.libido(-2);
			
			// End. Boot to Chieftain’s Circle. Set Quinn to Steele preg
			tryKnockUpQuinn();
			currentLocation = "12. Zil Village Winnar";
			flags["QUINNFEST_COMPLETE"] = 2;
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

// Quinn stuff
public function tryKnockUpQuinn(gangbanged:Boolean = false):Boolean
{
	if(!gangbanged && (pc.virility() <= 0 || flags["QUINN_PREG_TIMER"] != undefined)) return false;
	
	// succesful impregnation
	if(gangbanged || pc.virility() > 0)
	{
		flags["QUINN_PREG_TIMER"] = 0;
		if(!gangbanged)
		{
			flags["QUINN_SIRED_KID"] = 1;
			pc.clearRut();
		}
		
		// Output <b>You should check in on Quinn every month or so, see how she’s doing.</b> at the end regardless of which scene was generated
		AddLogEvent("<b>You should check in on Quinn every month or so, see how she’s doing.</b>", "good");
		
		return true;
	}
	else return false;
}
public function processQuinnPregEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if(flags["QUINN_PREG_TIMER"] != undefined)
	{
		flags["QUINN_PREG_TIMER"] += totalDays;
		
		if(flags["QUINN_PREG_TIMER"] > 245)
		{
			var birthTimestamp:int = (GetGameTimestamp() + deltaT - (flags["QUINN_PREG_TIMER"] * 24 * 60) + (246 * 24 * 60));
			quinnBirth(birthTimestamp);
		}
	}
}
public function quinnBirth(birthTimestamp:int = -1):Boolean
{
	if(birthTimestamp < 0) birthTimestamp = GetGameTimestamp();
	
	var numKids:int = 1;
	
	if(flags["QUINN_KID_AGE"] == undefined || flags["QUINN_KID_SEX"] == undefined)
	{
		// Age
		flags["QUINN_KID_AGE"] = birthTimestamp;
		// Sex: 0 is Female, 1 is Male
		flags["QUINN_KID_SEX"] = (rand(2));
	}
	
	if(flags["QUINN_SIRED_KID"] != undefined)
	{
		StatTracking.track("pregnancy/quinn sired", numKids);
		StatTracking.track("pregnancy/total sired", numKids);
		
		flags["QUINN_SIRED_KID"] = undefined;
	}
	
	if(flags["QUINN_TOTAL_KIDS"] == undefined) flags["QUINN_TOTAL_KIDS"] = 0;
	flags["QUINN_TOTAL_KIDS"] += numKids;
	flags["QUINN_PREG_TIMER"] = undefined;
	
	return (flags["QUINN_KID_SEX"] == 1);
}
public function quinnPregDays():int
{
	if(flags["QUINN_PREG_TIMER"] == undefined) return 0;
	return flags["QUINN_PREG_TIMER"];
}
// Pregnant Quinn Texts
// Gestation time is 6-7 months
// Point about droning ball is that it stops the usual ‘scent-link’ that happens to pregnant zil from happening. If PC just fucked her solo she tries to stop it happening another way. PC choices determine how she regards and names the brat.
// Throw some comments in if PC is simultaneously zil-preg.
public function quinnAppearancePreg():String
{
	var pregDays:int = quinnPregDays();
	var msg:String = "";
	
	// Pregnancy 30-80 days
	if(pregDays <= 80) {
		msg += "From the top of her striped fuzzy hair to the tip of her black boots, the female zil who calls herself Quinn is about 5\' 8\". She is a bit taller than the zil average, as well as more svelte - underneath the sheer armor of her chest her breasts look to be maybe C cups, and the slimness of her thighs make her gleaming, armored legs look long and rather strict. Still, the presence of a tear-shaped abdomen and complete absence of clothes means she doesn’t stand out much from her fellows in purely physical terms. It’s the sense of control, the sedateness and the manner of someone used to getting their own way which do that.";
		msg += "\n\nShe’s not quite as lithe as she once was, though - her belly has started to take on a bit of a curve. Her hand strays down to her baby bump every once in a while.";
		msg += "\n\nHer pale, yellow face is quite round, with arching black eyebrows above her striking, golden-irised eyes; the smiles or frowns that appear on her mouth seem to touch only the barest corners of it. Her frizzy chestnut-and-platinum blonde hair falls freely down to the small of her back, pierced by the two bobbing antennae that all zil share.";
		msg += "\n\nUnderneath that implacable armor of hers you know that Quinn has the intoxicating, oozing honey cunt common to all female zil, as well as an extremely tight, orange back door between her cute, supple rump.";
	}
	// Pregnancy 81-130 days
	else if(pregDays <= 130) {
		msg += "From the top of her striped fuzzy hair to the tip of her black boots, the female zil who calls herself Quinn is about 5\' 8\". She is a bit taller than the zil average, but now she is well into her pregnancy she has started to fill out her frame a bit more, her C cup breasts swelling against her sheer armor and her thighs thickening a little more, weight piling on there to support her soccer-ball sized belly bump. Still, she retains that controlled calmness that you know her so well for.";
		msg += "\n\nHer pale, yellow face is quite round, with arching black eyebrows above her striking, golden-irised eyes; the smiles or frowns that appear on her mouth seem to touch only the barest corners of it. Her frizzy chestnut-and-platinum blonde hair falls freely down to the small of her back, pierced by the two bobbing antennae that all zil share.";
		msg += "\n\nUnderneath that implacable armor of hers you know that Quinn has the intoxicating, oozing honey cunt common to all female zil, as well as a tight, orange back door between her supple, widening rump.";
	}
	// Pregnancy 131-179 days
	else {
		msg += "From the top of her striped fuzzy hair to the tip of her black boots, the female zil who calls herself Quinn is about 5\' 8\". She is late in her pregnancy now - honey-swollen, D cup breasts sit atop her watermelon-like belly, and her black armor creaks occasionally with the strain of it. Her hips have definitely widened as well - baby’s got back now. Her air of calm control seems to have mellowed into a kind of dreamy serenity now, her legs spread and leant back on her throne.";
		msg += "\n\nHer pale, yellow face is quite round, with arching black eyebrows above her striking, golden-irised eyes; the smiles or frowns that appear on her mouth seem to touch only the barest corners of it. Her frizzy chestnut-and-platinum blonde hair falls freely down to the small of her back, pierced by the two bobbing antennae that all zil share.";
		msg += "\n\nUnderneath that implacable armor of hers you know that Quinn has the intoxicating, oozing honey cunt common to all female zil. It must be quite plump and spread these days. Between her increasingly pillowy rump she retains a tight, orange anus.";
	}
	return msg;
}
public function askQuinnAboutHerbs(response:String = "intro"):void
{
	clearOutput();
	showQuinn();
	author("Nonesuch");
	clearMenu();
	
	switch(response)
	{
		case "intro":
			output("<i>“Potent nature magic, handpicked and enchanted by my trusted wise-zil,”</i> she replies loudly, straight-backed. <i>“It shall nourish my body, ensure the health of my child.”</i> She drops her voice a little, looking at you sidelong. <i>“Do you know of the scent-link, [pc.name]? When my people make a baby together the female usually produces a smell that the father can immediately recognise. Yes, and the mother becomes... soft towards him. I do not wish this.");
			if(flags["QUINN_SIRED_KID"] == undefined) output(" The drone ball is meant to prevent it from happening, but these herbs are also meant to dampen the effect.");
			else output(" I wish the baby to mine and mine alone, and I do not wish to spend all day pining for you. These herbs dampen the effect.");
			output("”</i>");
			output("\n\nHer eye remains steady on you as she transfers another wad of greens from the bowl to her mouth.");
			output("\n\n<i>“Do you approve of what I am doing, starwalker?”</i> she asks, after she’s swallowed again.");
			output("\n\n");
			
			processTime(1);
			
			// [Yes] [No] [You Do You]
			addButton(0, "Yes", askQuinnAboutHerbs, "yes");
			addButton(1, "No", askQuinnAboutHerbs, "no");
			addButton(2, "You Do You", askQuinnAboutHerbs, "whatever");
			break;
		case "yes":
			if(flags["QUINN_SIRED_KID"] == undefined)
			{
				output("You think she’s made a sensible decision, not complicating matters by including a definitive father in her plans. It’s also pretty smart, in terms of consolidating her power over the tribe. You tell her as much.");
				output("\n\n<i>“Good. I value your opinion, my champion - you speak wisdom born of the stars,”</i> the statuesque zil replies, slumping slightly in her throne. <i>“I do sometimes wonder... but no. The path of power and responsibility is a lonely one, and I must be strong enough to walk it alone.”</i> She munches on another handful of herbs determinedly.");
			}
			else
			{
				output("It was her decision all along to have a kid - you just provided the seed and the red hot fucking. If she doesn’t want to be bonded to you and have a father involved, fine. You can see why she’d want that in terms of consolidating her power over the tribe. You tell her this.");
				output("\n\n<i>“Good. I value your opinion, my great champion - you speak wisdom born of the stars,”</i> the statuesque zil replies, slumping slightly in her throne. <i>“I do sometimes wonder... but no. The path of power and responsibility is a lonely one, and I must be strong enough to walk it alone.”</i> She munches on another handful of herbs determinedly.");
			}
			output("\n\n");
			
			processTime(1);
			
			talkedToQuinn();
			// +1 Nice point
			pc.addNice(1);
			flags["QUINN_TALK_HERBS"] = 1;
			
			addButton(0, "Next", talkToQuinnStuffGogogogogogogogogogo);
			break;
		case "no":
			if(flags["QUINN_SIRED_KID"] == undefined) output("Implicitly y");
			else output("Y");
			output("ou know you’ve been asked to speak frankly, so you do. You tell her you think she’s being unfair to");
			if(flags["QUINN_SIRED_KID"] == undefined)
			{
				output(" whoever the father is");
				if(flags["QUINNFEST_COMPLETE"] > 0) output(" - which may well be you, of course - ");
			}
			else output(" you");
			output(" and that she’s cutting herself off from emotional support that she will need, for no real reason. You throw in that, from personal experience, it kinda sucks to not have a dad.");
			output("\n\n<i>“I needed to hear that,”</i> the statuesque zil replies with a");
			if(flags["QUINN_SIRED_KID"] != undefined) output(" slow");
			output(" nod. <i>“None of my other subjects are brave enough to say such things.”</i> She’s silent for a time, chewing over your words, chewing on her herbal cud. <i>“It is a lonely path I have set myself upon, I know that. But it is the path of power, and responsibility. Once I admit that I need another to lean on, I can no longer call myself Quinn. I value your honesty");
			if(flags["QUINN_SIRED_KID"] != undefined) output(" and passion");
			output(", my champion. But you are not Quinn, and you are not a zil");
			if(pc.zilScore() >= 6) output(" as much as you have made yourself look like one");
			output(". You cannot fully understand why I do the things I do.”</i> She munches on another handful of herbs determinedly.");
			output("\n\n");
			
			processTime(1);
			
			talkedToQuinn();
			// -1 Nice point
			pc.addHard(1);
			// flag dis for later check
			flags["QUINN_TALK_HERBS"] = -1;
			
			addButton(0, "Next", talkToQuinnStuffGogogogogogogogogogo);
			break;
		case "whatever":
			output("You wouldn’t presume to question the motives of an alien queen - clearly your outlook on motherhood is very different from hers. It would be foolish of you to plaster your own opinions onto her situation, and you tell her as much.");
			output("\n\n<i>“You have been to many different stars, haven’t you, my champion?”</i> the statuesque zil says, with a dry rise of an eyebrow. <i>“I can see you saying such words to all sorts of different people, being very polite about all the strangeness you");
			if(flags["QUINN_SIRED_KID"] == undefined) output(" see");
			else output("’ve seen - and sired");
			output(". I do wonder what really is going through your mind, sometimes.”</i> She’s silent for a time, chasing bits of fibrous vegetable around her mouth. <i>“You value pragmatism, so I think you can understand my decision, as difficult as it was to make. That is good enough for me.”</i> She munches on another handful of herbs determinedly.");
			output("\n\n");
			
			processTime(1);
			
			talkedToQuinn();
			flags["QUINN_TALK_HERBS"] = 0;
			
			addButton(0, "Next", talkToQuinnStuffGogogogogogogogogogo);
			break;
	}
}
public function pregQuinnApproach(pregDays:int = 0):Boolean
{
	// >30 days, activates once when approached
	if(pregDays > 30 && pregDays <= 60 && (flags["QUINN_PREG_APPROACH"] == undefined || flags["QUINN_PREG_APPROACH"] < 1))
	{
		clearOutput();
		showQuinn();
		author("Nonesuch");
		
		output("Quinn is positively radiant, mouth curved into a proud smile. It’s not hard to guess why; underneath the harsh black veneer of her armor, her belly has taken on a slight curve.");
		output("\n\n<i>“Do you see, my champion?”</i> She grabs your hand, lays it onto that bump, insists you feel it. <i>“My call to the zpirits has been answered. Quinn has kindled! She was generous, and she is bountiful!”</i> Her face is alive with a wild joy you’ve never seen before; it’s tamped down on when you withdraw your hand, her characteristic composure reasserting itself. Still, you don’t think you’ve ever seen her so happy and proud, the very picture of a munificent matriarch.");
		output("\n\n<i>“What does my honored warrior wish of [pc.his] Quinn?”</i>");
		output("\n\n");
		
		flags["QUINN_PREG_APPROACH"] = 1;
		
		processTime(2);
		
		peacefulQuinnMenu();
		return true;
	}
	// >60 days, activates once when approached
	if(pregDays > 60 && pregDays <= 80 && (flags["QUINN_PREG_APPROACH"] == undefined || flags["QUINN_PREG_APPROACH"] < 2))
	{
		clearOutput();
		showQuinn();
		author("Nonesuch");
		
		output("Quinn barely registers your approach. She looks surly, lips pursed, her golden eyes focused on the middle distance. One thin hand is placed protectively over her baby bulge; the other fiddles with the empty bowl on her arm-rest.");
		output("\n\n<i>“What do you want, starwalker?”</i> she says with an irritated sigh.");
		output("\n\nYou ask if anything is wrong.");
		output("\n\n<i>“Nothing!”</i> she replies loudly. <i>“Everything is fine. My wise-zil has provided me with a remedy, and assured me there is nothing to worry about. Quinn was generous. Quinn is bountiful!”</i>");
		output("\n\nShe glares at you, as if daring you to suggest otherwise.");
		output("\n\n");
		
		flags["QUINN_PREG_APPROACH"] = 2;
		
		processTime(2);
		
		peacefulQuinnMenu();
		return true;
	}
	
	return false;
}
// If PC chooses [Sex] during this period
public function pregQuinnSexNo():void
{
	var pregDays:int = quinnPregDays();
	
	clearOutput();
	showQuinn();
	author("Nonesuch");
	
	var canHandMaiden:Boolean = quinnHandmaidenThreesomeAvailable();
	
	if(flags["QUINN_SIRED_KID"] == undefined)
	{
		output("<i>“No,”</i> Quinn replies curtly. <i>“I need - I need to be careful. " + (canHandMaiden ? "Go bother my handmaidens if you want that." : "Go into the lower forests and find the hunters if you want that.") + "”</i>");
	}
	else
	{
		output("<i>“It’s sweet of you to persist,”</i> Quinn replies, regarding you with twinkling golden eyes, <i>“But I still need to be careful. With you, getting rough - the temptation is always there. " + (canHandMaiden ? "My handmaidens will attend you." : "Go into the lower forests and find the hunters if you want that.") + "”</i>");
	}
	output("\n\n");
	
	clearMenu();
	//Handmaiden orgy option here if unlocked.
	if(canHandMaiden)
	{
		addButton(0, "Handmaidens", quinnHandmaidenThreesome, ["next"]);
		addButton(14, "Back", goBackToQuinnMain);
	}
	else addButton(0, "Next", goBackToQuinnMain);
}
// Revised Chieftain’s Circle blurb
public function chieftansCircleBonusQuinnPreg():Boolean
{
	var pregDays:int = quinnPregDays();
	
	author("Nonesuch");
	showBust("");
	
	output("You are on the small plateau that stands at the head of the zil village. The top of the promontory is flat, sandy and round, surrounded by the fungus-shaped zil homes, and has a circle of stones in the middle. On the opposite side of the natural terrace there is the ornate, trophy-laden chieftain’s chair. It’s empty.");
	if(pregDays > 0 && pregDays <= 180) output(" Where is Quinn?");
	output("\n\nSeveral small zil children run over at your approach, eager to stare at, ask questions of and most importantly play with the honored star-person guest. The place has plenty of bustle; male zil flicker in and out of the air carrying tools, cooking fires are lit, weapons are honed and conversation buzzes. It’s all around the edges, though. Nobody walks through the circle.");
	
	if(pregDays > 0 && !pc.hasStatusEffect("Quinn Post-Pregnancy"))
	{
		// Remove [Quinn], Add [Quinn?] option 
		clearMenu();
		addButton(0, "Quinn?", whereIsPregQuinn, pregDays, "Quinn?", "Ask where the zil leader’s got to.");
		
		return true;
	}
	return false;
}
public function whereIsPregQuinn(pregDays:int = 0):void
{
	var lahIsHere:Boolean = (flags["PQ_RESOLUTION"] == 2);
	
	clearOutput();
	if(lahIsHere) showBust("LAH");
	else showBust("FETCH_AND_CARRY");
	author("Nonesuch");
	clearMenu();
	
	if(pregDays <= 180)
	{
		output("<i>“She refused to come out this morning,”</i> says " + (lahIsHere ? "Lah" : "the handmaiden") + ", when you approach and ask. " + (lahIsHere ? "He" : "She") + " looks very discomfited, as you now realize most of the zil around you do. <i>“Shouts at anyone who tries and goes to see her.”</i> The " + (lahIsHere ? "ausar" : "zil") + " looks at you hopefully. <i>“Maybe if you went...? She trusts you more than anyone.”</i>");
		output("\n\n");
		
		processTime(1);
		
		addButton(0, "Visit Quinn", pregQuinnVisit);
	}
	// Babby = Popped
	// Plays when PC visits after 180 days have passed
	else
	{
		output("<i>“She asked to see you, as soon as you arrived,”</i> says " + (lahIsHere ? "Lah" : "the handmaiden") + " when you approach. " + (lahIsHere ? "He" : "She") + " is impressively poker-faced. <i>“Go on up.”</i>");
		output("\n\n");
		
		processTime(1);
		
		addButton(0, "Visit Quinn", pregQuinnBirthed);
	}
}
public function pregQuinnVisit(response:String = "intro"):void
{
	clearOutput();
	showQuinn();
	author("Nonesuch");
	clearMenu();
	
	switch(response)
	{
		case "intro":
			output("You [pc.move] back around the throne and up the hill towards Quinn’s yurt with a certain amount of trepidation. You flick at the heavy, woven entrance flap and ask if it’s alright to come in.");
			output("\n\n<i>“I told you to leave me alone! I am Q... Starwalker? Oh, starwalker...”</i> the figure on the bed moans, flopping back down into a nest of fur. It’s neither an invitation nor a demand to leave; you decide to step inside. With your eyes adjusting to the gloom, you can see Quinn is curled up in a fetal position, her abdomen and shoulders quivering with gentle sobs.");
			output("\n\n<i>“Starwalker...”</i> She turns her eyes to you, awash in golden misery. <i>“My child pains me. It drags downwards, it wants no part of me, because Quinn is just like her mother. She is not generous, and she will not be bountiful!”</i> Her words ascend into a terrible wail. <i>“I do not have her strength. I cannot do that - six and seven stillborn for the sake of a single child. The zpirits know that Quinn is a cruel woman, yes, and cruelty is all they can answer her with. All she can bring into this world is death!”</i> She buries her head back into the furs, heaving with buzzing sobs.");
			output("\n\n");
			
			processTime(2);
			
			// [Comfort] [Chastise] [Medical?]
			addButton(0, "Comfort", pregQuinnVisit, "comfort", "Comfort", "Soothe her, and bring the cuddles.");
			addButton(1, "Chastise", pregQuinnVisit, "chatise", "Chastise", "If you have the measure of Quinn, some tough love is called for here.");
			addButton(2, "Medical?", pregQuinnVisit, "medical", "Medical?", "You <i>do</i> own a state-of-the-art nursery on one of those stars. Might that not be of help?");
			break;
		case "medical":
			output("Quinn listens, blinking back her tears, as you describe the Nursery you own on Tavros. You could definitely transport her there and get her checked out, maybe in as little time as a day.");
			output("\n\nShe’s still and silent for a time, hand on her belly.");
			output("\n\n<i>“No...”</i> she says doubtfully, and then more firmly. <i>“No. I cannot run from this, flee into the soft arms of starwalker magic. I would no longer be able to call myself Quinn - yes, I would shed that name and become your servant, if I were to entreat the things that are <i>your</i> zpirits. I must stay here and accept this judgment, as terrible as it may be.”</i>");
			if(flags["QUINN_SIRED_KID"] == undefined) output("\n\nYou have calmed her down a bit just by talking sensibly, although she still looks utterly miserable.");
			else output("\n\nYou have soothed her a bit just by talking calmly, although she still looks utterly miserable.");
			output("\n\n");
			
			processTime(5);
			talkedToQuinn();
			currentLocation = "12. Zil Village Winnar";
			flags["QUINN_TALK_PREG"] = 0;
			flags["QUINN_PREG_APPROACH"] = 3;
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "chatise":
			output("You pull up a crude wooden stool by her bed, take her hand, and then lay down some home truths to her. That if her baby is showing, it’s fairly unlikely to miscarry. That she’s probably just suffering some common-or-garden stomach cramps like any pregnant mother, and is throwing histrionics over it. That she <i>chose<i> to be a mother alone, and so can hardly throw a wobbler about not having a shoulder to cry on");
			if(flags["QUINN_SIRED_KID"] != undefined) output(" now");
			output(". That, finally, she is Quinn, and this whole scheme she cooked up in order to secure her rule is getting more undermined the longer she mopes around in bed");
			if(flags["QUINN_SIRED_KID"] != undefined) output(" and leaves her people doubting her");
			output(".");
			output("\n\nQuinn frowns, and then her expression freezes as you go on, as if she were drawing more and more into herself, frost forming over her pretty features. She is silent for a few moments afterwards, mouthing a few words back to herself.");
			output("\n\n<i>“You are right,”</i> she says, and you’re relieved to hear her familiarly calm tones. She sits herself up and brusquely wipes her drying tears away. <i>“I thought through and carried out my own decisions every step of the way. If I cannot look my judgment firmly in the face, what does that say of me? That I am not Quinn. And I am. I am!”</i> she grits determinedly. <i>“My child shall feel my determination! It will fight!”</i>");
			output("\n\nYou give her an encouraging squeeze, and then leave her to pick herself up. She emerges into the Chieftain’s Circle a few minutes later, a picture of regal indifference, and receives the clamor of anxious, curious zil with cool explanations and directions.");
			output("\n\n");
			
			processTime(7);
			// -4 Nice Points, Re-add [Quinn], add [Pregnancy?] to Quinn talks
			pc.addHard(4);
			talkedToQuinn();
			currentLocation = "12. Zil Village Winnar";
			flags["QUINN_TALK_PREG"] = -1;
			flags["QUINN_PREG_APPROACH"] = 3;
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "comfort":
			output("Silently you get into her bed, spoon into Quinn from behind (zil abdomens are not helpful when it comes to this, but you manage) and for a little while just hold her, rubbing her swollen belly. She’s tense at first, but slowly relaxes in your grip, her sobs slowly trailing off into snotty sniffs.");
			if(flags["QUINN_SIRED_KID"] != undefined) output(" Do you smell something different about her? A particular, horny fragrance, different from the usual zil pheromones, that maybe are only for you? You think perhaps you can.");
			output("\n\nWhen you think she’s calmed down enough, you begin to talk softly into her ear. You tell her if she’s showing, she’s pretty unlikely to miscarry. That she’s probably suffering from stomach cramps, which is entirely normal, as is the anxiety. That there’s nothing weak about reaching out for emotional support, and that maybe the reason she feels this way now is because she’s been deliberately cutting herself off from it.");
			output("\n\nBy the time you’re done her sniffles have entirely run their course, and you think she might even have drifted off in your arms.");
			output("\n\n<i>“Thank you, [pc.name],”</i> she says, lowly. You’re relieved to hear her familiar cool tones returning. <i>“I was... silly. And perhaps I would not have made some of the decisions that I have, if I knew then what I know now.”</i> She draws herself out of your arms, straight-backed and solemn against the bone headboard. <i>“I am Quinn. I will look my judgment in the face, whatever it may be. I will be strong, because... because I know I can rely upon you.”</i>");
			output("\n\nYou give her another encouraging squeeze, and then leave her to pick herself up. She emerges into the Chieftain’s Circle a few minutes later, a picture of regal indifference, and receives the clamor of anxious, curious zil with cool explanations and directions.");
			output("\n\n");
			
			processTime(8);
			// +4 Nice Points, Re-add [Quinn], add [Pregnancy?] to Quinn talks
			pc.addNice(4);
			talkedToQuinn();
			currentLocation = "12. Zil Village Winnar";
			flags["QUINN_TALK_PREG"] = 1;
			flags["QUINN_PREG_APPROACH"] = 3;
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}
public function askQuinnAboutPregnancy():void
{
	var pregDays:int = quinnPregDays();
	var numChildren:int = ChildManager.numChildrenAtNursery();
	
	clearOutput();
	showQuinn();
	author("Nonesuch");
	clearMenu();
	
	// This talk option changes to this after she’s given birth
	if(pregDays <= 0 && flags["QUINN_KID_AGE"] != undefined)
	{
		var babyMale:Boolean = (flags["QUINN_KID_SEX"] == 1);
		
		output("You ask if she’s considered having any more children.");
		output("\n\n<i>“Absolutely not,”</i> Quinn replies with tranquil certainty, when you ask if she’d ever consider trying for another pregnancy. <i>“The way was painful and sometimes terrible. I asked much of the zpirits, granting me a single healthy child, and I know better to demand more. I shall pour my love into " + quinnBabyName() + ", and lead " + (babyMale ? "him" : "her") + " down the path of honor and cunning - as I do my own people.”</i> She smiles at you munificently. <i>“Sex is now for the joy of it, and to renew my bonds with my most favored. About that, I am relieved.”</i>");
		output("\n\n");
	}
	// 81-130 Days
	else if(pregDays <= 130)
	{
		output("You ask how it’s going.");
		output("\n\n<i>“It goes,”</i> she responds serenely to your question, as if you’d asked after the weather. She does give you a warm look, though. <i>“Would you like to feel?”</i>");
		output("\n\nYou know you’re being granted a favor to do this in public, so you do it with as much grace and ceremony as you can muster, showering her with remarks of how well she looks as you fondle and admire her swelling baby bump");
		if(flags["QUINN_SIRED_KID"] == undefined) output(", until she snorts with laughter and shoos you off.");
		else output(". You also inhale deeply, drawing the scent of her skin into your lungs, enjoying the feeling a radiant, protective arousal spreading through you. She may have done her best to dampen the effect of the ‘scent-link’, but her body knows who the father of her child is, and going off the soft, dilated expression she’s turned to you you wonder to what extent she’d deny it anyway.");
		output("\n\n<i>“Sometimes there is pain. Sometimes there is vomiting,”</i> the zil monarch says, leaning into you to speak quietly. <i>“Particularly in the morning, when the world is at its most quiet. Do you know what I do then?”</i> She touches your cheek. <i>“I think of your words, and then I am strong again. My lucky charm.”</i>");
		// If PC also zil preg:
		if(pc.hasPregnancyOfType("ZilPregnancy") && pc.bellyRating() >= 10)
		{
			output("\n\n<i>“And how are you? The zpirits chose to bless you, too.”</i> Quinn smiles at your [pc.belly]. <i>“Do you know what you are going to name it? Where will it be raised? Shall it become a wanderer of the stars, like you?”</i> She fires lots of these types of questions at you, and your answers draw a small crowd of zil women, who listen in rapt attention to your descriptions of your nursery, the droids and nurses that work there");
			if(numChildren > 0) output(", " + (flags["QUINN_SIRED_KID"] == undefined ? "and" : "as well as") + " your other children");
			output(".");
			output("\n\n<i>“They will grow up to be hardly zil at all,”</i> one of them murmurs, somewhere between awe and disquiet.");
			output("\n\n<i>“They will have a strong and wise mother,”</i> Quinn retorts, with supreme confidence. <i>“That " + (flags["QUINN_SIRED_KID"] == undefined ? "is" : "will be") + " enough.”</i>");
		}
		output("\n\n");
	}
	// 131-179 Days
	else
	{
		output("You ask how it’s going.");
		output("\n\n<i>“It is very irksome,”</i> she scowls, gesturing at her bulging midriff and increasingly bloated breasts. <i>“How am I meant to get anything done? How do I check my subjects are not being lazy when it takes me five minutes just to get down to the village? They are taking advantage of my current state, I am sure.”</i>");
		output("\n\nYou can tell she’s really proud to be fit to burst though. She doesn’t stop you when you approach her from the side, place your hand on that warm, rotund beachball of hers. She buzzes quietly in pleasure, deep in her throat as you rub her.");
		if(flags["QUINN_SIRED_KID"] != undefined) output(" That horny, particular smell - like regular zil sweetness but deeper and muskier - that only you can pick up is undeniable now, and you can tell ‘mine and mine alone’ is the furthest thought from her mind right now.");
		output("\n\n<i>“There is no pain anymore,”</i> she goes on, in the quiet tone she uses when she only wants you to hear. <i>“Just... warmth. And movement, sometimes. I think I will be bountiful. I believe the zpirits have judged me generous.”</i>");
		// If PC also zil preg:
		if(pc.hasPregnancyOfType("ZilPregnancy") && pc.bellyRating() >= 10)
		{
			output("\n\n<i>“And how are you? The zpirits chose to bless you, too.”</i> Quinn smiles at your [pc.belly]. <i>“Do you know what you are going to name it? Where will it be raised? Shall it become a wanderer of the stars, like you?”</i> She fires a lot of these types of questions at you, but asks in a confidential tone, keeping your answers all to herself, listening to them contentedly with half-closed eyes.");
			output("\n\n<i>“And you do not form the scent-link? Interesting,”</i> she drones. She strokes your belly ruminatively. <i>“You know, [pc.name], for all the wonders that you have seen, and the riches at your disposal - I think you would be most happy finding a kind, strong warrior-husband here, and building a home together. A zil boy who can fill your arms with children.”</i>");
		}
		output("\n\n");
	}
	
	addButton(0, "Next", talkToQuinnStuffGogogogogogogogogogo);
}

public function pregQuinnBirthed():void
{
	clearOutput();
	showQuinn();
	author("Nonesuch");
	
	var isSire:Boolean = (flags["QUINN_SIRED_KID"] != undefined);
	var isMale:Boolean = quinnBirth();
	
	output("Beyond the flap of the leader’s yurt you find Quinn, deep in her bed furs, looking both utterly exhausted and extremely satisfied. In her arms, nursing at one of her opened breasts, is the tiniest zil you ever did see");
	if(StatTracking.getStat("pregnancy/zil birthed") > 0) output(" - at least, not since you gave birth to one, anyway");
	output(". Her tiny smile broadens when you enter, and she extends an arm to you. You sit yourself down next to her and take her hand into yours.");
	output("\n\n<i>“This was the hardest thing I have ever done,”</i> she says, quietly but clearly. <i>“Harder than winning the right to be Quinn. Harder than");
	if(flags["PQ_RESOLUTION"] == 1 ) output(" making peace with the starwalkers");
	else output(" waging war against the land-stealers");
	output(". But look - look at the result.”</i> She gently pulls the child off her teat, presents it to " + (!isSire ? "her greatest warrior" : "the father") + ". You examine the little fetcher, blinking at you with golden eyes and grasping the air with tiny, chitinous fingers. Zil make it pretty easy to work out whether they’re male or female, even at a very young age.");
	
	if(isMale) output(" You stroke his gently twitching wings admiringly.");
	else output(" You stroke her tear-shaped abdomen admiringly.");
	output("\n\n<i>“See " + (isMale ? "his" : "her") + " perfect hands?”</i> Quinn crows raspily. <i>“See " + (isMale ? "his" : "her") + " wandering eyes, " + (isMale ? "his" : "her") + " straight back and beautiful " + (isMale ? "wings" : "stinger") + "? Quinn was generous, Quinn was bountiful! My child! " + (isMale ? "He" : "She") + " shall be the greatest leader my kind have ever known!”</i>");
	// If Steele impregnated her + PC used [No] and [Comfort] options in previous preg scenes:
	if(isSire && flags["QUINN_TALK_HERBS"] == -1 && flags["QUINN_TALK_PREG"] == 1)
	{
		output("\n\n<i>“Our child,”</i> you say, looking her in the eye. The zil leader pauses for a long moment, and then smiles again.");
		output("\n\n<i>“Our child,”</i> she agrees, taking the warm, black and yellow bundle back into her waiting arms.");
	}
	// If Else:
	else
	{
		output("\n\nYou feel a warm glow at seeing her so happy, particularly given the depths of misery she came to dwell in during the pregnancy. Perhaps it’s strange that she stuck so firmly to the task of denying the child a father, but could one ask for a more loving, competent, powerfully-placed mother? Probably not on this planet. You hand the warm, black and yellow bundle back into her waiting arms.");
	}
	output("\n\nYou spend a little more time with Quinn and her baby, before tiredness sags at her eyes, and a handmaiden slips in to take the child away. You leave her, hair still tangled and sweaty, sleeping peacefully, and [pc.move] back down to the Chieftain’s Circle. She’ll be back on her feet and ordering her minions around in a couple of days, you wouldn’t doubt.");
	
	processTime(76);
	
	// Remove [Quinn?], re-add [Quinn] after 40 hours
	pc.createStatusEffect("Quinn Post-Pregnancy");
	pc.setStatusMinutes("Quinn Post-Pregnancy", (60 * 40));
	
	currentLocation = "12. Zil Village Winnar";
	flags["QUINN_PREG_APPROACH"] = 4;
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Yummy Mummy Quinn
// Appearance
public function quinnAppearanceMommy():String
{
	var msg:String = "";
	
	msg += "From the top of her striped fuzzy hair to the tip of her black boots, the female zil who calls herself Quinn is about 5\' 8\". She has kept a little of the thickness of her pregnancy on: although her stomach is slim once again her boobs are somewhere between C and D cups these days";
	// If kid < 300 days young:
	if(quinnBabyAge() < 300) msg += " heavy and sticky-teated with the honey she feeds her young " + (flags["QUINN_KID_SEX"] == 1 ? "son" : "daughter");
	msg += ".";
	msg += "\n\nHer hips are wider than they were, and all-round she looks much more maternal than the slim, lithe wasp you once knew.";
	msg += "\n\nHer pale, yellow face is quite round, with arching black eyebrows above her striking, golden-irised eyes; the smiles or frowns that appear on her mouth seem to touch only the barest corners of it. Her frizzy chestnut-and-platinum blonde hair falls freely down to the small of her back, pierced by the two bobbing antennae that all zil share.";
	msg += "\n\nUnderneath that implacable armor of hers you know that Quinn has the intoxicating, oozing honey cunt common to all female zil. It is a plump and easily-spread treat these days, perfect for";
	if(StatTracking.getStat("pregnancy/quinn sired") > 0 && pc.hasCock()) msg += " a big, thick daddy cock";
	else msg += " a busy tongue to explore";
	msg += ". Between her round, soft rump she retains a tight, orange anus.";
	msg += "\n\n";
	
	return msg;
}
// Baby's age in days
public function quinnBabyAge():int
{
	if(flags["QUINN_KID_AGE"] == undefined) return 0;
	return Math.min(Math.floor((((GetGameTimestamp() - flags["QUINN_KID_AGE"]) / 60) / 24)), 1825);
}
public function quinnBabyName():String
{
	if(flags["QUINN_KID_NAME"] == undefined) return "the zil child";
	return flags["QUINN_KID_NAME"];
}
// 11:00-18:00 kid is with her, absent otherwise
public function quinnBabyActive():Boolean
{
	if(flags["QUINN_KID_AGE"] == undefined) return false;
	return (hours >= 11 && hours <= 18);
}

public function mommyQuinnApproach():Boolean
{
	if(flags["QUINN_KID_AGE"] == undefined) return false;
	
	var isSire:Boolean = (StatTracking.getStat("pregnancy/quinn sired") > 0);
	var babyAge:int = quinnBabyAge();
	var babyMale:Boolean = (flags["QUINN_KID_SEX"] == 1);
	
	clearOutput();
	showQuinn();
	author("Nonesuch");
	
	// Quinn Baby (0-365 Days Old)
	if(babyAge < 365 || flags["QUINN_KID_NAME"] == undefined)
	{
		// First [Quinn] after birth
		if(flags["QUINN_KID_NAME"] == undefined)
		{
			output("Quinn is cradling her child, and she presents it to you when you approach.");
			output("\n\n<i>“Look who’s come to visit!”</i> she coos. <i>“");
			if(!isSire) output("My smartest, fiercest warrior.");
			else output("Your daddy.");
			output(" [pc.He]’s probably come to tell us about the enemies [pc.he]’s slain and skulls [pc.he]’s piled high in our honor. Say hello to [pc.him]!”</i>");
			output("\n\nThe kid does nothing of the sort, of course; " + (babyMale ? "he" : "she") + " is still very young. " + (babyMale ? "He" : "She") + " simply gazes at you with a frown, those golden eyes taking in your deeply curious form, antennae twitching, toothless mouth forming inchoate shapes and expressions. Then " + (babyMale ? "he" : "she") + "’s whisked back into " + (babyMale ? "his" : "her") + " adoring mother’s arms.");
			output("\n\n<i>“Have you given " + (babyMale ? "him" : "her") + " a name?”</i> you ask.");
			output("\n\n<i>“Zil are not given names. Not unless they are slaves,”</i> Quinn tells you in a chiding, you-should-know-this tone. <i>“They earn them. For now though I own my child, so I call " + (babyMale ? "him" : "her") + "...");
			if(isSire)
			{
				output(" Owers.”</i> She smiles at you broadly, as " + (babyMale ? "he" : "she") + " paws intently at her chitin breastplate.");
				flags["QUINN_KID_NAME"] = "Owers";
			}
			else
			{
				output(" Myne.”</i> She smiles down broadly at " + (babyMale ? "him" : "her") + ", pawing intently at her chitin breastplate.");
				flags["QUINN_KID_NAME"] = "Myne";
			}
		}
		// Repeat
		// If kid present
		else if(quinnBabyActive())
		{
			output("Quinn is cradling " + quinnBabyName() + ", and she presents " + (babyMale ? "him" : "her") + " to you when you approach.");
			output("\n\n<i>“Look who’s come to visit!”</i> she coos. <i>“");
			if(!isSire) output("My smartest, fiercest warrior.");
			else output("Your daddy.");
			output(" [pc.he]’s probably come to tell us about the enemies [pc.he]’s slain and skulls [pc.he]’s piled high in our honor. Say hello to [pc.him]!”</i>");
			output("\n\nThe kid does nothing of the sort, of course; " + (babyMale ? "he" : "she") + " is still very young. " + (babyMale ? "He" : "She") + " simply gazes at you with a frown, those golden eyes taking in your deeply curious form, antennae twitching, toothless mouth forming inchoate shapes and expressions. You bounce " + (babyMale ? "him" : "her") + " around a little bit, blow a raspberry on " + (babyMale ? "his" : "her") + " chubby chitin-coated belly, and draw some wriggles and buzzing giggles out of " + (babyMale ? "him" : "her") + ", before handing " + (babyMale ? "him" : "her") + " back.");
			output("\n\n<i>“Did you come just to see " + quinnBabyName() + "?”</i> Quinn asks, with a familiarly arch raise of an eyebrow. <i>“Or was there something else you wish for?”</i>");
		}
		// If kid not present
		else
		{
			output("Quinn’s arms are empty.");
			output("\n\n<i>“" + quinnBabyName() + " is sleeping,”</i> she says, answering your question before you can ask it. <i>“Or making my handmaidens’ lives a living hell. I am Quinn. I do need time away from that.”</i> She considers you with her small, calm smile. <i>“What is it that");
			if(!isSire) output(" my great warrior");
			else output(" the father of my child");
			output(" desires?”</i>");
			
			// Handmaiden sex not possible in this case, grey out [Sex] if PC meets those parameters
		}
		output("\n\n");
		
		processTime(2);
		
		// Display standard options
		peacefulQuinnMenu();
	}
	// Quinn Toddler (>365 days)
	// Again it’s never going to be older than 5 no it isn’t so shut up
	else
	{
		output("<i>“My");
		if(isSire) output(" most virile");
		else if(flags["PQ_BEAT_LAH"] == 1 && flags["PQ_RESOLUTION"] == 1) output(" most honored");
		else output(" smartest, fiercest");
		output(" warrior returns,”</i> the motherly chieftain says, leaning back in her chair, one hand rested on a cushy thigh. She favors you with a serene and seductive smile. <i>“What does [pc.he] wish of [pc.his] Quinn?”</i>");
		
		if(quinnBabyActive())
		{
			output("\n\nSounds of " + (isSire ? "your" : "her") + " child playing in the back echos nearby.");
		}
		
		processTime(1);
		
		peacefulQuinnMenu();
	}
	return true;
}

public function quinnMomSexButton(btnSlot:int = 2):void
{
	if(pc.lust() < 33) addDisabledButton(btnSlot, "Sex", "Sex", "You aren’t aroused enough for this.");
	else if(quinnBabyAge() < 365)
	{
		// Non-handmaiden [Sex] chosen whilst kid present
		if(quinnBabyActive())
		{
			if(pc.hasVagina() || pc.cockThatFits(quinnVaginalCapacity()) >= 0) addButton(btnSlot, "Sex", quinnHandmaidenThreesome, ["mommy"]);
			else if(pc.hasCock()) addDisabledButton(btnSlot, "Sex", "Sex", "You’re too big for sex with her.");
			else addDisabledButton(btnSlot, "Sex", "Sex", "You have no suitable endowments for sex with her.");
		}
		// Handmaiden sex not possible in this case, grey out [Sex] if PC meets those parameters
		else
		{
			if(!pc.hasGenitals()) addDisabledButton(btnSlot, "Sex", "Sex", "You need genitals to do that!");
			else if(quinnHandmaidenThreesomeAvailable(true)) addButton(btnSlot, "Sex", quinnHandmaidenThreesome, ["maiden"]);
			else addDisabledButton(btnSlot, "Sex", "Sex", "You’ve worn out Quinn, and Fetch and Carry are otherwise occupied. No more bonking. Aren’t babies a bitch?");
		}
	}
	else
	{
		if(pc.hasVagina() || pc.cockThatFits(quinnVaginalCapacity()) >= 0) addButton(btnSlot, "Sex", sexWithQuinnOmnigenderWHYYYY);
		else if(pc.hasCock()) addDisabledButton(btnSlot, "Sex", "Sex", "You’re too big for sex with her.");
		else addDisabledButton(btnSlot, "Sex", "Sex", "You have no suitable endowments for sex with her.");
	}
}

// Revised Chieftain’s Circle Blurb
public function chieftansCircleBonusQuinnMomText():String
{
	var msg:String = "";
	var babyMale:Boolean = (flags["QUINN_KID_SEX"] == 1);
	
	msg += "You are on the small plateau that stands at the head of the zil village. The top of the promontory is flat, sandy and round, surrounded by the fungus-shaped zil homes, and has a circle of stones in the middle. On the opposite side of the natural terrace there is the ornate, trophy-laden chieftain’s chair. Quinn is there, observing you cannily as usual.";
	msg += "\n\nSeveral small zil children run over at your approach, eager to stare at, ask questions of and most importantly play with the honored star-person guest. One of these little guys is " + quinnBabyName() + "; " + (babyMale ? "he" : "she") + " stays at the back, watching you with silent shyness.";
	msg += "\n\nThe place otherwise has plenty of bustle; male zil flicker in and out of the air carrying tools, cooking fires are lit, weapons are honed and conversation buzzes. It’s all around the edges, though. Nobody walks through the circle.";
	
	return msg;
}

// [Myne / Owers]
public function approachQuinnBaby():void
{
	
	var isSire:Boolean = (StatTracking.getStat("pregnancy/quinn sired") > 0);
	var babyAge:int = quinnBabyAge();
	var babyMale:Boolean = (flags["QUINN_KID_SEX"] == 1);
	var numChildren:int = ChildManager.numChildrenAtNursery();
	
	clearOutput();
	
	if(!quinnBabyActive())
	{
		showBust("");
		showName("\nMAYBE NOT...");
		
		output((isSire ? "Your" : "Quinn’s") + " child is most likely sleeping at this time. Best not disturb " + (babyMale ? "him" : "her") + ".");
		
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	showQuinn();
	author("Nonesuch");
	
	output("<i>“" + quinnBabyName() + "!”</i> Quinn calls stridently, striking the armrest of her throne. <i>“Come greet");
	if(isSire) output(" your father");
	else output(" my most honored warrior");
	output(".”</i>");
	output("\n\nThe tiny zil toddles across from where " + (babyMale ? "he" : "she") + " was playing with the other village children. " + (babyMale ? "He" : "She") + " comes hesitantly, eyeing you shyly. You wonder what Quinn has told " + (babyMale ? "him" : "her") + " about you. Well, honestly, even if it were a couple of throwaway half-truths it’d be enough for a native Mhen’gan toddler to be overawed.");
	output("\n\nYou ask " + (babyMale ? "him" : "her") + " what game " + (babyMale ? "he" : "she") + "’s playing, what " + (babyMale ? "his" : "her") + " favorite color and animal is and quickly manage to loosen the kid up. Although " + quinnBabyName() + " never stops gazing at you with a certain shyness, " + (babyMale ? "he" : "she") + " is quite the chatterbox. You learn where their dens are, where the best mangoes in the jungle are to be found, and how to escape a naleen. You learn about the zil version of soccer, in which boys and girls have strictly regulated roles - but " + (babyMale ? "girls" : "boys") + " never follow, " + (babyMale ? "he" : "she") + " explains despairingly, because everyone knows " + (babyMale ? "girls" : "boys") + " always cheat.");
	output("\n\nAfter that you have a decent game of hide and seek, which all the kids love since you don’t know where all of their hiding places are");
	if(flags["QUINN_KID_PLAYS"] >= 5) output(" despite doing this a number of times now");
	output(", followed by a couple of sessions of horsie (which they call ‘pinser’ for reasons which sound faintly alarming).");
	output("\n\n<i>“You have a way with children, [pc.name],”</i> observes Quinn, when you finally say goodbye to " + quinnBabyName() + " with a hug and return to her throne, brushing the dust off of your [pc.armor]. <i>“Do you have many of your own?”</i>");
	// 0 nursery children:
	if(numChildren <= 0)
	{
		output("\n\nYou shrug and say you have");
		if(!isSire) output(" none");
		else output(" no others");
		output(" that you know of - perhaps that’s why you enjoy playing with them so much.");
		output("\n\n<i>“That’s very sad");
		if(pc.hasCock()) output(", particularly considering that vigorous manhood of yours");
		else if(pc.hipRating() >= 15) output(", particularly when you look at those child-bearing hips of yours");
		output(",”</i> Quinn replies, tapping her arm-rest. <i>“A " + pc.mf("Ken", "Quinn") + " in-waiting should have an heir, because if [pc.he] doesn’t, who shall take up [pc.his] baton should [pc.he] fall?”</i>");
	}
	// 1-20 nursery children:
	else if(numChildren <= 20)
	{
		output("\n\nYou have");
		if(numChildren == 1) output(" one");
		else if(numChildren == 2) output(" a couple");
		else output(" a few");
		output(", you assure her. You describe the nursery your father bequeathed you, and");
		if(numChildren == 1) output(" the kid ");
		else if(numChildren < 10) output(" the small brood");
		else output(" the unruly brood");
		output(" that is being taken care of there.");
		output("\n\n<i>“What a generous male your father was!”</i> Quinn remarks, tapping her arm-rest. <i>“Why, if a zil could have as many children as they chose, and still be free to set their strength and mind against the world...”</i> Her eyes gleam like hidden treasure. <i>“...the things she could do!”</i>");
	}
	// 21+:
	else
	{
		output("\n\nQuinn’s face pales as you describe the army of kiddywinks you have personally bred, all taken care of by the nursery your father bequeathed you.");
		output("\n\n<i>“Zpirits,”</i> she mutters. <i>“But will that not cause you unspeakable problems when it becomes time to decide on your own heir? What do you intend to do with all of them - conquer a star?”</i> She shakes her head, disturbed. <i>“The ways of aliens are truly beyond our ken. I shall be more than content with just one.”</i>");
	}
	output("\n\n");
	
	processTime(51);
	IncrementFlag("QUINN_KID_PLAYS");
	flags["QUINN_KID_PLAY_DAY"] = days;
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

