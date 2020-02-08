/* luca 2: you get to take her dick now
 * LUCA_SUBMISSION
 * LUCA_SAFEWORD
 * LUCA_ADDICTION: Luca's suppressants mean her addiction takes a while to build up. Yay drugs!
 * LUCA_JUST_TALKED: 4 activates [I Like You], 5 [Sex], 6 just removes the button
 * LUCA_ORAL_XP: 25+ lets player DP luca, 50+ gives PC oral orgasms
*/

public function leaveLotusEater():void
{
	moveTo("CANADAEXT");
	mainGameMenu();
}

public function lucaXP(arg:int = 0, apply:Boolean = false):int
{
	if (flags["LUCA_ORAL_XP"] == undefined) flags["LUCA_ORAL_XP"] = 0;
	if (apply) flags["LUCA_ORAL_XP"] = arg;
	else flags["LUCA_ORAL_XP"] += arg;
	if (flags["LUCA_ORAL_XP"] > 50) flags["LUCA_ORAL_XP"] = 50;
	if (flags["LUCA_ORAL_XP"] < 0) flags["LUCA_ORAL_XP"] = 0;
	return flags["LUCA_ORAL_XP"];
}

public function canThroatLuca():Boolean
{
	if (pc.canDeepthroat()) return true;
	if (lucaXP() >= 25) return true;
	return false;
}
public function lucaFixation():Boolean
{
	if (flags["USED_SNAKEBYTE"] != undefined) return true;
	if (lucaXP() >= 50) return true;
	return false;
}

public function lucaddiction(arg:int = 0, apply:Boolean = false):int
{
	if (flags["LUCA_ADDICTION"] == undefined) flags["LUCA_ADDICTION"] = 0;
	if (apply) flags["LUCA_ADDICTION"] = arg;
	else flags["LUCA_ADDICTION"] += arg;
	if (flags["LUCA_ADDICTION"] >= 100)
	{
		flags["LUCA_ADDICTION"] = 100;
		if (eventQueue.indexOf(lucaGotYouAddictedToHer) < 0 && arg > 0) eventQueue.push(lucaGotYouAddictedToHer);
	}
	if (flags["LUCA_ADDICTION"] < 0) flags["LUCA_ADDICTION"] = 0;
	return flags["LUCA_ADDICTION"];
}

public function lucaSubmission(arg:int = 0, apply:Boolean = false):int
{
	if (flags["LUCA_SUBMISSION"] == undefined) flags["LUCA_SUBMISSION"] = 0;
	if (apply) flags["LUCA_SUBMISSION"] = arg;
	else flags["LUCA_SUBMISSION"] += arg;
	if (flags["LUCA_SUBMISSION"] > 100) flags["LUCA_SUBMISSION"] = 100;
	if (flags["LUCA_SUBMISSION"] < 0) flags["LUCA_SUBMISSION"] = 0;
	return flags["LUCA_SUBMISSION"];
}

public function processLucaTimeStuff(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	var addiction:int = lucaddiction();
	var subbyness:int = lucaSubmission();

	//Max addiction and submissiveness: 5/week, linear

	//Values pulled directly out of LF's ass
	var lambda:Number = deltaT * ((addiction+subbyness)/50) / (7*24*60);
	if (100*Math.exp(-lambda) <= rand(100)) lucaDaydream(addiction, subbyness);

	// Cure addiction
	if (addiction <= 0) return;
	while(totalDays-->0)
	{
		if (addiction < 25) lucaddiction(-5);
		else if (addiction < 50) lucaddiction(-4);
		else if (addiction < 75) lucaddiction(-2);
		else if (addiction < 100) lucaddiction(-1);
	}
}

public function lucaDaydream(addiction:int, subbyness:int):void
{
	//Subbmissive daydreaming
	if (rand(addiction+subbyness) < subbyness)
	{
		//Submission 100
		if (subbyness > 99 && rand(3) == 0)
		{
			AddLogEvent("You shudder as a submissive euphoria overtakes your body. Your eyes flutter close and the world around you fades away. Your mind goes to the Lotus Eater and your enchanting mistress. You picture her delighted face as she looks down at your naked body. A thrill shakes your core when you think of her gentle smile and the way she tenderly caresses you. Then you envision her slowly and delicately binding you, molding you into shape completely at her whim. You remember the sensations of her cock filling you, of her using you to sate her lust and fuck you full of her wonderful semen. Her words of dominance and loving praise drift through your mind.\n\nYou want nothing more to fulfill her desires. The thought of her fucking you in the throes of pleasure, watching her face light up when she sees you, or even listening to her voice as she cares for your needs after a rough night of passion intensify your euphoria. You can’t help" + pc.cockAndVagina(" [pc.eachCock] becoming intensely rigid", " [pc.eachPussy] drenching itself") + " at the submissive fantasies.");

			if (pc.lustQ() < 75) pc.lust(75*pc.lustMax()/100, true);
		}
		else if (subbyness > 66 && rand(2) == 0)
		{
			AddLogEvent("Your focus dissipates on what you’re currently doing, your mind unable to think of things other than Luca. You imagine her gentle hands binding you, leaving you helpless in her grasp, her caress so light against your skin as she prepares you for her magnificent dick. She treats you like the most precious thing in the whole universe. Then she takes you, impales you on her girth, and fucks you like the submissive slut you are. Completely vulnerable and at her mercy as she uses you to fulfill her carnal desires. Then when she’s about-\n\nA sudden noise snaps you back to reality. You look around fully alert... and quite aroused.");
			
			if (pc.lustQ() < 75) pc.lust(75*pc.lustMax()/100, true);
		}
		else if (subbyness > 33 && rand(2) == 0)
		{
			AddLogEvent("As you go about your day your mind drifts to thoughts of Luca with her hands all over you. You’re overcome with a compulsion to have her take you and fuck you, making you hers. After idly daydreaming for a few minutes, you shake your head, trying to disperse the dirty thoughts.");
			
			pc.lust(Math.max(0, Math.min(75-pc.lust(), 15+pc.libido()/20)));
		}
		else
		{
			AddLogEvent("Your mind becomes filled with a lustful fantasy of Luca binding you - of her tying you down and having her way with you. When she’s finished, she leaves you bound and gagged, basking in the afterglow of your orgasm. You wipe away a bit of drool from your lips, thinking that it might be time to visit Luca again.");

			pc.lust(Math.max(0, Math.min(75-pc.lust(), 15+pc.libido()/20)));
		}
	}
	//Addict daydreaming
	else
	{
		// For Blurb 3
		var filledHole:int = -1;
		if (pc.hasStatusEffect("Orally-Filled") && pc.statusEffectv3("Orally-Filled") == GLOBAL.FLUID_TYPE_CUM) filledHole = 0;
		if (pc.hasStatusEffect("Vaginally-Filled") && pc.statusEffectv3("Vaginally-Filled") == GLOBAL.FLUID_TYPE_CUM && (rand(2) == 0 || filledHole < 0)) filledHole = 1;
		if (pc.hasStatusEffect("Anally-Filled") && pc.statusEffectv3("Anally-Filled") == GLOBAL.FLUID_TYPE_CUM && (rand(3) == 0 || filledHole < 0)) filledHole = 2;

		// Cum Addiction > 90
		if (addiction >= 90 && rand(3) == 0)
		{
			AddLogEvent("You drop what you’re doing as an unbelievable craving overcomes your mind. Carnal thoughts of Luca with her dick wedged in your throat fill your brain, her cock fucking your gullet until she blesses you with a load of her heavenly cum. Then after she’s done, she takes you again and again, each time fucking you full of more of her ambrosial seed. Your loins swell with the desire to be fucked and taken by your mistress.\n\nYou come out of your lust-driven haze after nearly twenty minutes, filled with the need to be fucked and fucked hard - especially by Luca. <b> It’s getting harder and harder to get her out of your head.</b> Perhaps it would be best to restrain your lustful desires for now, unless you truly want to give into them.\n\nStars, a load of Luca’s delicious jizz would be so perfect right now.");
			
			pc.lust(pc.lustMax());
		}
		// PC is filled with semen. Doesn't matter what orifice
		else if (addiction >= 60 && filledHole >= 0 && rand(2) == 0)
		{
			AddLogEvent("You stop to feel your cum-swollen [pc.belly]. With deep, heavy breaths, a warm fulfilling sensation spreads through your body, causing your [pc.skin] to pleasantly tingle and your nipples to " + (pc.isLactating() ? "tenderly moisten" : "become tenderly rigid") + ". The sensation fills you completely as you remember performing your duty as a cumslut. You idly wonder if Luca would be proud of how good you’ve gotten at " + (filledHole == 0 ? "swallowing" : "being a bottom") + ". It would be wonderful if she fucked you right now! The thought of her skewering your " + (rand(3) != 0 ? ["maw", "[pc.onePussy]", "[pc.ass]"][filledHole] : RandomInCollection("maw", "[pc.onePussy]", "[pc.ass]")) + " with cock feels <i>so</i> right.\n\nThe erotic ideas and fulfilling sensation fades after a few minutes.");

			pc.lust(Math.max(0, Math.min(75-pc.lust(), 15+pc.libido()/20)));
		}
		else if (addiction >= 30 && rand(2) == 0)
		{
			AddLogEvent("You stop when your throat begins feeling scratchy and your stomach achingly empty. You down a bottle of water to try to fix your sudden craving but groan when it does nothing to help. Some cum would fix your situation. A gal with a thick dick crammed down your gullet would be perfect. You can’t help but drool at the thought of Luca with her hands " + (pc.hasHorns() || (pc.hairStyle.indexOf("pigtail") != -1) ? "using your " + (pc.hasHorns() ? "[pc.horns]" : "pigtails") + " as handles" : "on the back back of your head") + " and face fucking you...\n\nYou happily daydream of the wonderful thought for a few minutes. You should give someone some oral affection to solve your problem.");

			pc.lust(Math.max(0, Math.min(75-pc.lust(), 15+pc.libido()/20)));
		}
		else
		{
			AddLogEvent("You suddenly feel parched and unbelievably thirsty. You down a bottle of water to quench it, but it barely helps. Your body craves something thick and creamy. You should find someone to blow - that should fix it! It would be even better if it was Luca. Her cum tastes so sweet! She deserves a nice, sloppy blowjob.\n\nYou shake your head free of your perverse thoughts, but the craving remains.");

			pc.lust(Math.max(0, Math.min(75-pc.lust(), 15+pc.libido()/20)));
		}
	}
}

public function lucasVRTalkButton(btnSlot:int):void
{
	if (lucaVRsTried() >= 2) addButton(btnSlot, "VR Content", lucaTalkVRs, undefined, "VR Content", "Ask Luca about the content in her VR Simulations.");
	else addDisabledButton(btnSlot, "VR Content", "VR Content", "Maybe you should try some so you know what you’re talking about.");
}

public function lucasJustTalkButton(btnSlot:int):void
{
	if (flags["LUCA_JUST_TALKED"] == undefined || flags["LUCA_JUST_TALKED"] < 4) addButton(btnSlot, "Just Talk", justTalkWithLuca, undefined, "Just Talk", "Talk with Luca.");
	else if (flags["LUCA_JUST_TALKED"] == 4) addButton(btnSlot, "I Like You", lucaDoTheConfessyThingy, undefined, "I Like You", (silly ? "Tell Luca that you want her to take you to pound town." : "Tell Luca that you like her."));
}

public function lucaTalkVRs():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(5);

	output("<i>“Can you be more specific?”</i> She asks you.");
	output("\n\n<i>“" + (pc.isBimbo () ? "Well they all seem to end with the player in a compromising position" : "They all end with bonkers sex") + ",”</i> you tell her.");
	output("\n\n<i>“Well, [pc.name], to be honest I’ve never really given it much thought. I just have a thing for submission and domination. I used to download tons of old visual novels with those themes and I would chase bad ends. I would spend days grinding through repetitive scenes just to get the next ending and see what happened. Apparently there was a market for that kind of thing. Anything else I can help you with?”</i>");
	
	addButton(0, "Next", lucaTalkChoices);
}

public function justTalkWithLuca():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");

	//Oh god this switch is huge
	switch (flags["LUCA_JUST_TALKED"])
	{
		case 0:
		case undefined:
		default:
			processTime(5);
			output("<i>“Hey Luca?”</i>");
			output("\n\n<i>“Yes [pc.name]?”</i>");
			output("\n\n<i>“What is your favorite holo?”</i> You ask her.");
			output("\n\nLuca stares at you and thinks for a moment.");
			output("\n\n<i>“There’s this super old holo, a B rate sci fi adventure named Solar Crusade. It’s about a ragtag crew of young people searching for the homeworld of an ancient alien race that disappeared and left clues about a hidden cache of advanced technology on their homeworld. It’s most definitely not a good holo, the dialogue is trashy, the sex scenes are awful and the plot is super generic. But I’ll always love it.”</i>");
			output("\n\nYou ask her why her favorite holo is a bad holo.");
			output("\n\n<i>“To be honest I’m not sure. I’ve tried watching other holos like it but none of them do it for me. I get about ten minutes in and just get bored. Fun fact I was originally going to take up a career in the extranet holo industry because of Solar Crusade. I had my university courses all laid out and set up.”</i>");
			output("\n\n<i>“What happened?”</i>");
			output("\n\n<i>“My best friend introduced me to a neurologist at a game convention we were attending. He had assisted in the development of the latest at home VR system that had just come out. I ended up missing nearly half a day because I was so fascinated by his work. I pestered him all day, but he wasn’t bothered by a flat chested, dark skinned Dzaan... After the convention I went home and immediately started looking at universities that he recommended.”</i>");
			output("\n\n<i>“Well I’m glad you changed your plans,”</i> you tell her.");
			output("\n\n<i>“And why is that?”</i>");
			output("\n\n<i>“If you did become a super successful and famous holomaker on some core world I wouldn’t have been able to meet you.”</i>");
			output("\n\n<i>“Is that your way of saying you’re happy to have met me?”</i>");
			if (pc.isBimbo()) output("\n\n<i>“Well duh silly.”</i>");
			else if (pc.isNice()) output("\n\n<i>“Well of course Luca.”</i>");
			else output("\n\n<i>“Was I being too subtle?”</i>");
			output("\n\n<i>“Well I’m happy to have met you too [pc.name].”</i>");

			IncrementFlag("LUCA_JUST_TALKED");
			addButton(0, "Next", lucaTalkChoices);
			break;

		case 1:
			processTime(10);
			output("You bring up something Luca mentioned the last time you flirted with her. <i>“So Luca, you were flat chested?”</i>");
			output("\n\nLuca lets out a deep sigh before answering. <i>“Once upon my teenage years I was the only one of my sisters to have the chest of a board. They would tease me non stop about it.”</i>");
			output("\n\n<i>“Was it at least playful?”</i>");
			output("\n\n<i>“It was for my eldest sister. She would massage my breasts claiming ‘If you rub them like this Luca they’ll grow bigger!’ but the joke’s on her because they grew bigger than hers once I hit my twenties.”</i>");
			output("\n\n<i>“I don’t believe you,”</i> you say teasing her. ");
			output("\n\n<i>“You know what? Here, hold on a second.”</i>");
			output("\n\nLuca pulls out a tablet and uses it for a bit. She places it onto the counter and turns it so you both can see it. On the screen are eight young Dzaan teenage girls each in school dresses. Of the eight, seven of them have well endowed breasts.");
			output("\n\n<i>“The one in the middle and on the right is me at sixteen,”</i> Luca says pointing at the picture. The young Luca is holding a bag close to her knees and she doesn’t look at the camera. Though her skin is bronze it’s easy to see the red in her face. <i>“Ugh I hate my hair in this picture.”</i> The young Luca’s hair is dark brown and bowl cut.");
			output("\n\nYou snicker and ask about her sisters.");
			output("\n\n<i>“From left to right is Alyissa, Katerina, Ophira, my twin Calidora, me, and the triplets Clotho, Lachesis, and Atropos. Our mothers were very interested in the mythology of other races especially Ausars and Terrans. They have this stupid story where they started saving up all their money to move to either Ausaril or Terra and flipped a coin to decide. Ausaril won the flip, but it was out of their price range. They looked at Terra, but that was expensive too. In the end they settled on Mars and moved when they were able to afford it. This picture was taken during Alyissa’s last year at our local academy.”</i>");
			output("\n\nLuca swipes the image. The next picture is of Alyissa in a suit looking nervously at the camera while the rest of her sisters make silly poses and faces behind her. Luca and her twin Calidora are blowing up their cheeks and squinting their eyes.");
			output("\n\n<i>“This was taken on Alyissa’s first day of business school. We’d never seen her like that before, so we decided to immortalize it.”</i>");
			output("\n\nLuca swipes the image. The next picture shows the next moment after the previous picture. Alyissa had spun around and begun chasing after her sisters.");
			output("\n\n<i>“She was less than happy with our shenanigans.”</i>");
			output("\n\nLuca swipes the image. The next picture is a selfie of a terran girl with neon blue hair covering her face and most of her body. Young Luca is in the background freaking out.");
			output("\n\n<i>“This one is of Nora and I, she’s my best friend. We met in my ninth year of the academy. A week after we met she shows up at our house to hang out and show off this new hair mod she got off the extranet. That stupid mod turned it into that obnoxious color, and she used too much, so it just started growing out. It kept growing and growing until I was panicking. She started laughing and said we just had to commemorate the moment with a picture.”</i>");
			output("\n\nLuca swipes the image. The next picture is of Luca and Nora dressed in cosplay. Luca is wearing a bikini made of chains and cloths. Nora is wearing a leather duster and dressed as a dashing rogue that looks a bit familiar. Nora’s hair in this picture is light brown and cut short for the costume.");
			output("\n\n<i>“This is us for Halloween. There was this huge extranet holo franchise remake that happened in the summer and we fell in love with the characters. I went as this space princess and she went as this dick head smuggler.”</i>");
			output("\n\nYou notice Luca lingering on the picture for a bit. She eventually swipes across the tablet. Luca spends the next hour showing off old pictures of her before her mods. You learn that her full name is Lucianna Vastnyr. Even though they’re twins, Calidora is actually a Beta Dzaan. On a dare from Nora, Luca got a butterfly tattoo above her ass for nearly a year before her parents found out. For prom Luca went with Nora as her date. They dated for a few months after, but decided to just be friends. ");
			output("\n\nEventually though Luca stops when she gets called away to finish a patron’s private session.");

			IncrementFlag("LUCA_JUST_TALKED");
			addButton(0, "Next", lucaTalkChoices);
			break;

		case 2:
			processTime(2);

			output("<i>“I have a question for you Luca. Something that’s been slightly gnawing at my curiosity for some time.”</i>");
			output("\n\n<i>“I’m not shy, [pc.name]. Shoot.”</i>");
			output("\n\n<i>“" + (pc.isBimbo() ? "How do you like to fuck? Position? Are you into S&M? What about genders? All of it,”</i> you ask giddily." : "What’s your sexual preferences?”</i> you ask as politely as you can."));
			output("\n\n<i>“Well now. I’ll answer your question if you answer it as well.”</i>");
			output("\n\n<i>“Deal.”</i>");
			output("\n\n<i>“I’ll start. I prefer women with thick thighs and bubble butts,”</i> Luca smiles fondly. <i>“With that said I’ve had some male partners... hnng...”</i> You see her shaft throb in excitement.");
			output("\n\n<i>“Luca?”</i>");
			output("\n\n<i>“Sorry. Sorry, I was just thinking of this one feminine guy I dated. He was really into cosplay, he could pull off so many dresses I felt jealous some days. Anyway you’re up.”</i>");

			var genderQuestion:Function = function(gender:int):void
			{
				clearMenu();
				clearOutput();
				showLuca();
				author("RequiemForAMeme");
				processTime(1);

				output("<i>“So do you prefer to be on top or bottom?”</i> you ask.");
				output("\n\n<i>“Top. Almost exclusively. I’ve tried being on the bottom before, never really liked it. How about you? " + (pc.hasCock() ? "Do you prefer top or bottom?" : "Do you prefer front door or back door?") + "”</i>");
				
				flags["LUCA_PC_GENDER_PREF"] = gender;
				
				addButton(0, (pc.hasCock() ? "Top" : "Front Door"), holeQuestion, 0);
				addButton(1, (pc.hasCock() ? "Bottom" : "Back Door"), holeQuestion, 1);
			};
			
			var holeQuestion:Function = function(hole:int):void
			{
				clearMenu();
				clearOutput();
				showLuca();
				author("RequiemForAMeme");
				processTime(1);
				
				output("<i>“So are you into bondage? If you are what role do you like?”</i> Luca asks. You notice her body shift slightly in anticipation.");
				
				flags["LUCA_PC_HOLE_PREF"] = hole;
				if (pc.hasCock()) flags["LUCA_PC_HOLE_PREF"] += 2;
			
				addButton(0, "Dom", domSubQuestion, 0);
				addButton(1, "Sub", domSubQuestion, 1);
				addButton(2, "Switch", domSubQuestion, 2);
				addButton(3, "Not Into", domSubQuestion, 3);
			};
			
			var domSubQuestion:Function = function(role:int):void
			{
				clearMenu();
				clearOutput();
				showLuca();
				author("RequiemForAMeme");
				processTime(1);

				switch (role)
				{
					case 0: output("Luca looks disappointed as Dom comes out of your mouth. <i>“I see [pc.name]. I’m in the same ship... We’ll have to exchange stories some time,”</i> she says with a sly smile."); break;
					case 1: output("Luca bites her lip as the word ‘sub’ leaves your mouth. <i>“Oh you are just <i>perfect</i> aren’t you [pc.name].”</i> A tingle goes down your spine as you see her emerald eyes stare you down with predator like focus. <i>“I personally love the dom position.”</i>"); break;
					default: output("<i>“I see. I prefer the dom role personally.”</i>"); break;
				}
				output("\n\nIt seems like Luca is about to say something else as a drone approaches her. She is called away to a booth to address a customer. As she’s walking away, you catch her enchanting eyes gazing back at you.");

				flags["LUCA_PC_ROLE_PREF"] = role;
				
				addButton(0, "Next", lucaTalkChoices);
			};
			
			IncrementFlag("LUCA_JUST_TALKED");

			addButton(0, "Men", genderQuestion, 0);
			addButton(1, "Women", genderQuestion, 1);
			addButton(2, "Herms", genderQuestion, 2);
			addButton(3, "Shemales", genderQuestion, 3);

			break;

		case 3:
			processTime(4);
			output("<i>“[pc.name],”</i> Luca says. <i>“I was just thinking about you.”</i>");
			output("\n\n<i>“Oh?”</i>");
			output("\n\n<i>“Yes. You’ve gotten to hear about me. Now I want to hear about you.”</i>");
			output("\n\n<i>“What would you like to know?”</i> You ask.");
			output("\n\n<i>“Tell me about your childhood. What was it like?”</i>");
			switch (flags["PC_UPBRINGING"])
			{
				case GLOBAL.UPBRINGING_PAMPERED: output("\n\n<i>“I grew up without ever really having to work for much. To be honest it probably hurt my impulse control.”</i>"); break;
				case GLOBAL.UPBRINGING_ATHLETIC: output("\n\n<i>“I’m pretty sure I was a part of more sport activities than classes at school. To be honest I spent more time outside on the field than inside studying.”</i>"); break;
				case GLOBAL.UPBRINGING_BOOKWORM: output("\n\n<i>“I spent most of my childhood reading and studying in a classroom or under a tutor. To be honest I didn’t get outside much.”</i>"); break;
				case GLOBAL.UPBRINGING_AUSTERE: output("\n\n<i>“It was strange to say the least. If I wanted something I had to earn it, which is probably not something you’d think the " + pc.mf("heir", "heiress") + " to a multi billionaire would say.”</i>"); break;
				default: case GLOBAL.UPBRINGING_BALANCED: output("\n\n<i>“To be fully honest I did so many things as a kid that it would probably be easier to list of things I didn’t do than the things I did do.”</i>"); break;
			}
			output("\n\n<i>“That sounds interesting. To be honest I couldn’t imagine growing up as an only child. I video chat with all my sisters at least once a week.”</i>");
			output("\n\n<i>“What are they up too?”</i> You ask.");
			output("\n\n<i>“Alyissa and Katerina became business partners with some of our cousins on our homeworld, Heloith IV. They’re each in charge of a resort with their harems. What did you do before the rush?”</i>");
			switch (pc.characterClass)
			{
				case GLOBAL.CLASS_SMUGGLER: output("\n\n<i>“Before the rush my job was basically a glorified delivery [pc.boyGirl]. I would be entrusted with a package and I’d get it to it’s destination in a timely and safe fashion. Other times I would have to liberate a parcel from some less than upstanding individuals and get it to its proper owners.”</i>"); break;
				case GLOBAL.CLASS_MERCENARY: output("\n\n<i>“Before the rush I was part of a mercenary group. We would usually just chase down pirates, but sometimes we’d get specific bounties to track down. Lots of boring traveling with small moments of intense firefights.”</i>"); break;
				default: case GLOBAL.CLASS_ENGINEER: output("\n\n<i>“Before the rush my job was essentially working security as a tech " + pc.mf("guy", "gal") + ". I’d set up, build, repair and or program all sorts of things. I worked on everything from turrets and robots to blasters and electrified clubs.”</i>");
			}
			output("\n\n<i>“" + (pc.characterClass == GLOBAL.CLASS_ENGINEER ? "I guess we have a lot in common [pc.name]." : "Well that’s much more exciting than my career.") + " I suppose I should tell you about Ophira. She’s one of the main singers and dancers for <i>“The Lost Stars”</i> opera group. She always says that if her group ever comes to Vesperia I’ll get front row seats.”</i>");
			output("\n\n<i>“What’s your twin up to?”</i>");
			output("\n\n<i>“Cali is a field medic in the Galactic Rush. Last time we spoke she was working in a triage center dealing with a bunch of idiot rushers that don’t understand that unexplored alien worlds are full of danger. What are you hoping to get out of the rush?”</i>");
			output("\n\nThus begins the story of your adventure. It takes a while and Luca asks a question here and there, but you manage to explain your quest and the things you’ve experienced so far. Luca quietly contemplates what you’ve told her. You break the silence by asking what her little sisters are up to.");
			output("\n\n<i>“Those three... Clotho, Lachesis and Atropos run a restaurant call ‘The Fates’ on Mars. They each offer a different menu based on who’s the head chef for the day. They opened it near our old home there. Once a year we all try to gather and meet up there... So your cousin. Do you hate [rival.himHer]?”</i>");

			var replyFunc:Function = function(yesNo:int):void
			{
				clearMenu();
				clearOutput();
				showLuca();
				author("RequiemForAMeme");
				processTime(1);
				
				switch (yesNo)
				{
					case 0: output("<i>“Yes. I hate [rival.name]. [rival.HeShe]’s trying to take my inheritance from me. They’re trying to take the last thing dad left me. I just can’t forgive that.”</i>"); break;
					case 1: output("<i>“No. I don’t hate [rival.name]. Despite everything [rival.heShe] has done and probably will do I can’t bring myself to hate them. Maybe it’s because we’re family or I’m too forgiving, but I don’t hate [rival.himHer].”</i>"); break;
					default: case 2: output("<i>“To be honest with you Luca? I’m not sure. [rival.name] has done some terrible things to spite me. And I’m not sure how I feel about it all. At times I’m angry beyond belief and then other times I’m sad knowing that a member of my family despises me for reasons I may never know.”</i>"); break;
				}

				output("\n\nLuca grabs your [pc.hand]. <i>“If you ever need to talk about it I’ll be here for you.”</i>");
				output("\n\n<i>“Thanks Luca,”</i> you let go of her. <i>“I should head out now.”</i>");
				
				addButton(0, "Next", lucaTalkChoices);
			};

			IncrementFlag("LUCA_JUST_TALKED");
				
			addButton(0, "Yes", replyFunc, 0);
			addButton(1, "No", replyFunc, 1);
			addButton(2, "Not Sure", replyFunc, 2);

			break;
	}
}

public function lucaDoTheConfessyThingy():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(9);

	output("<i>“Hi Luca,”</i> you look around the Lotus eater. <i>“Is there somewhere we could speak privately?”</i>");
	output("\n\nLuca cocks an eyebrow. <i>“Yeah, just hold on for a moment.”</i> She makes a few keystrokes on the hardlight display. One of her butler drones appears before you two after a brief moment. <i>“Sebastian, watch the desk for me.”</i>");
	output("\n\n<i>“As you wish, mistress,”</i> the drone replies.");
	output("\n\n<i>“Follow me, [pc.name].”</i> ");
	output("\n\nYou follow Luca into the back of the Lotus Eater. She takes you past all of the private rooms to a door with a handprint scanner. She unlocks the door and waves you inside.");
	output("\n\nYou step into a dimly lit room. In the back left corner you see a circular bed overflowing with pillows. Opposite is a workstation covered in tools, electronics, robotic parts and hardlight displays. Towards the door there is a couch and several reclining chairs sitting before an assortment of retro gaming consoles and flat screen monitors. On your left is a veritable library of classic holos and extranet shows. Finally there are dozens of sex toys and contraptions scattered throughout the room.");
	output("\n\n<i>“Welcome to my room [pc.name].”</i> Luca closes the door behind you. <i>“You wanted to talk privately.”</i>");
	output("\n\n<i>“" + (pc.isBimbo() ? "Luca I think we should like totally become fuck buddies.”</i>" : "I like you Luca, I wanted to ask how would you feel about dating a" + (pc.isNice() ? "" : pc.mf(" handsome", " beautiful")) + " rusher like me?”</i>"));
	output("\n\n<i>“Well that was straight to the point... I like you too [pc.name]...”</i>");
	output("\n\n<i>“That sounds like there’s supposed to be a ‘but’ after that.”</i>");
	output("\n\n<i>“I guess you’d call me a high maintenance woman. We should sit down. This is going to take a bit.”</i> Luca waves you over to her bed. Once you’re both seated she continues. <i>“So I have... no that sounds so bad when I start it like that... um fuck. This is more embarrassing than I thought it would be. I want you to know that I was planning this well thought out and heartfelt confession for you before you ruined it all by being upfront.”</i>");
	output("\n\nYou laugh and tell Luca that you’ll listen to whatever she has to say.");
	output("\n\n<i>“Ok story time.”</i> She breaths in and out a few times. <i>“So I’m a Dzaan. An alpha Dzaan to be specific and our semen has addictive properties. Now this wouldn’t be much of a problem as someone, well several someones actually, made drugs and treatments so that we can have sexual partners without getting them addicted to our dicks. It’s a problem for me because those things don’t work on me, well more specifically they stop working eventually.”</i>");
	output("\n\n<i>“Eventually?”</i> you ask.");
	output("\n\n<i>“I never told you the whole story of how Nora and I started dating after we graduated. It was fantastic, we were both young, we had known each other for years, and we took all the necessary precautions. We even asked my parents about what to do and what not to do, I thought my face was going to melt off that day... About a month into it Nora started to change, she became clingy and wanted to have sex more often, well even more often that usual for two horny teenagers. I didn’t notice it because I was living in blissful ignorance. Fast forward about two months and one day I was spending time with Cali. Nora barged in freaking out and demanding I fuck her on the spot... I don’t really want to go into specifics about that.”</i>");
	output("\n\nYou tell Luca if she doesn’t want to talk about it she doesn’t have to.");
	output("\n\n<i>“No. It’s fine [pc.name] I want you to know. You deserve to know if we ever want to make things work between us. Nora was given a medical examination and to no one’s surprise she had become addicted to me. Nora received treatment while doctors did several tests on me to figure out why the drugs I was taking stopped working in the first place. One of them eventually contacted a U.G.C. specialist due to how unusual my case was.”</i> Luca breathes deep. <i>“The specialist did some tests and then about week later sat me down with my parents. He explained that I was born with a genetic defect.”</i>");
	output("\n\n<i>“A defect?”</i> You ask.");
	output("\n\n<i>“Yup. Due to how my genes work any drugs, treatments or mods I use will either not work at all, barely do anything or have unforeseen consequences. It’s called Lasciel’s Disease, it’s not life threatening thankfully. It occurs in about one in a billion Dzaan, less than a thousand documented cases. And for me it took getting my best friend getting addicted to my cock to find out I had it.”</i>");
	output("\n\nLuca pauses for a moment to gather her thoughts.");
	output("\n\n<i>“Luckily it’s manageable and I eventually found gene mods that would work with my body. As for my dick, I’ve found a drug that dilutes the effects enough to prevent addiction as long as my partner and I aren’t fucking like rabbits. Every so often I get a one night stand with a close friend, usually Nora.”</i>");
	output("\n\n<i>“So you two are still friends.”</i>");
	output("\n\n<i>“Yes, we are. It took months of therapy before she showed signs of improvement, but she got back to her old self. Halfway through her therapy she escaped the hospital to break into my house and take me to dinner to celebrate the day we met. She never held a grudge, but she lost who she was because of me. I don’t- I don’t want that to happen to anyone else. I’m sorry [pc.name] I think I just talked myself out of this. I think-”</i>");
	output("\n\nYou pull Luca towards you and embrace her. <i>“It’s alright Luca. I’m not going to lose who I am. We can take it slow. We’ll go at whatever pace you want.”</i>");
	output("\n\nLuca wraps her arms around you. <i>“I’m- I’m not sure. I just... I don’t know [pc.name].”</i>");

	addButton(0, "Kiss Her", function():void
	{
		clearMenu();
		clearOutput();
		showLuca();
		author("RequiemForAMeme");
		processTime(1);

		output("You shift slightly and lock eyes with Luca. You draw her lips towards your own and kiss her. Luca responds by pulling you closer and spreading her plush lips against yours. For a split second you wonder if you should use your tongue, then Luca’s forces its way into your mouth. Slowly, but surely you both begin to relax and make out for a few minutes.");
		output("\n\nLuca pulls herself away, visibly panting. <i>“Alright [pc.name]. We’ll give this a chance. Let me know when you’re ready.”</i>");
		output("\n\n<i>“As you wish, mistress.”</i> You tease.");
		output("\n\nLuca laughs and playfully slaps your shoulder. You bid her farewell and leave for the time being.");
		
		flags["LUCA_JUST_TALKED"] = 5;
		
		addButton(0, "Next", leaveLotusEater);
	}, undefined, "Kiss Her", "Go for it.");

	addButton(1, "Be Friends", function():void
	{
		clearMenu();
		clearOutput();
		showLuca();
		author("RequiemForAMeme");
		processTime(1);

		output("<i>“Everything’s going to be alright Luca.”</i> You tell her. <i>“No matter what happens. I’ll always be your friend.”</i>");
		output("\n\n<i>“Thanks. Thank you.”</i> She tightens her arms around you. <i>“Thank you so much [pc.name].”</i>");
		output("\n\nYou hold Luca for a few minutes. Eventually she breaks the embrace to return to work. You make sure that she’s alright before you leave.");

		flags["LUCA_JUST_TALKED"] = 6;

		addButton(0, "Next", leaveLotusEater);
	}, undefined, "Be Friends", "Luca just needs you to be a friend. But you’ll never be anything more.");
}

public function lucaSexButton(btnSlot:int):void
{
	if (pc.hasStatusEffect("Luca Addiction Prevention"))
	{
		var statusMinutes:int = pc.getStatusMinutes("Luca Addiction Prevention");
		var remainingTime:String = "";
		if (statusMinutes >= 24*60)
		{
			if (statusMinutes >= 48*60) remainingTime += String(Math.floor(statusMinutes/(24*60))) + " days";
			else remainingTime += "1 day";
			statusMinutes %= 24*60;
		}
		if (statusMinutes >= 60)
		{
			if (remainingTime != "") remainingTime += ", ";
			if (statusMinutes >= 120) remainingTime += String(Math.floor(statusMinutes/60)) + " hours";
			else remainingTime += "1 hour";
			statusMinutes %= 60;
		}
		if (statusMinutes >= 0)
		{
			if (remainingTime != "") remainingTime += ", ";
			if (statusMinutes >= 2) remainingTime += String(statusMinutes) + " minutes";
			else remainingTime += "1 minute";
		}
			
		addDisabledButton(btnSlot, "Sex", "Sex", "You agreed with Luca to not have sex for a while. Remaining time: " + remainingTime);
	}
	else if (flags["LUCA_JUST_TALKED"] == 5) addButton(btnSlot, "Sex", lucaSexRouter, false, "Sex", "Ask Luca if she wants to fool around for a bit.");
}

public function get lucaSafeWord():String
{
	if (flags["LUCA_SAFEWORD"] == undefined) return "<b>ERROR: Flag LUCA_SAFEWORD used but not set.</b>";
	else if (flags["LUCA_SAFEWORD"] is String) return flags["LUCA_SAFEWORD"];
	else return "<b>ERROR: Flag LUCA_SAFEWORD isn’t a String.</b>";
}

public function lucaSetSafeword():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");

	if (flags["LUCA_SAFEWORD"] == undefined)
	{
		processTime(4);

		output("<i>“I know you said that you wanted this [pc.name], but I need to lay out some ground rules first. Is that alright with you?”</i> Luca says in a serious tone, her demeanor rigid.");
		output("\n\n<i>“Yes,”</i> you reply.");
		output("\n\n<i>“To start we’re not going to be mutually exclusive. Are you okay with that?”</i>");
		output("\n\nYou think for a moment. <i>“I wouldn’t have it any other way.”</i> You answer thinking of all the adventures you’ve been on.");
		output("\n\n<i>“Good. Now I am the dominant in this relationship. No exceptions.”</i> She says with intense eyes. <i>“I will never harm you or do anything you do not ask for. You may not need it often, but you will need a safe word.”</i>");
		output("\n\n<i>“And is that everything?”</i> You ask sarcastically.");
		output("\n\nLuca relaxes a bit. <i>“I’ll try to shove my cock down your throat as much as possible, but I’m guessing you might be into that considering everything you know about me. Now, what would you like your safe word to be?”</i>\n\n");
	}
	else
	{
		output("<i>“Of course [pc.name], what would you like it to be?”</i>\n\n");
	}

	userInterface.textInput.text = "";
	displayInput();

	addButton(0, "Next", lucaSetSafewordGo);
}

public function lucaSetSafewordGo():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(1);
	
	var firstTime:Boolean = flags["LUCA_SAFEWORD"] == undefined;

	flags["LUCA_SAFEWORD"] = userInterface.textInput.text;
	userInterface.textInput.text = "";
	removeInput();

	if (firstTime)
	{
		output("<i>“[lucaSafeWord]. Sounds good. Now then [pc.name], I know for some people that laying out ground rules can kill a mood, but would you like to join me in my room for a few hours?”</i>");

		addButton(0, "Yes", lucaIsVeryTasty, false);
		addButton(1, "No", function():void
		{
			clearMenu();
			clearOutput();
			showLuca();
			author("RequiemForAMeme");

			output("<i>“I think I’ll pass for the moment Luca. I need a bit to process everything.”</i>");
			output("\n\n<i>“I understand. I’m here for you if you need anything.”</i>");
			
			addButton(0, "Next", leaveLotusEater);
		});
	}
	else approachLuca(true);
}

public function lucaSexRouter(pushing:Boolean):void
{
	if (flags["LUCA_SAFEWORD"] == undefined) return lucaSetSafeword();

	clearMenu();
	showLuca();
	author("RequiemForAMeme");

	if (!pushing)
	{
		clearOutput();

		var addiction:int = lucaddiction();

		if (addiction < 20) output("What do you want to do?");
		else if (addiction < 35) output("You idly lick your lips in anticipation and notice a bit of dryness in the back of your mouth.");
		else if (addiction < 50) output("As you consider how to have your Mistress use you, your mind wanders to how much cum you’ll be able to milk from her this time.");
		else if (addiction < 65) output("Your mouth waters at the thought of your mistress violating your lips and throat.");
		else if (addiction < 80) output("Images of your mistress face-fucking you and filling your belly with her seed crowd your mind.");
		else if (addiction < 90 || flags["LUCA_ADDICTION_ACCEPTABLE"] != undefined) output("You openly tremble in anticipation for your mistress to use you, to satisfy her primal urges with all your holes, filling you full of her heavenly spunk.");
		else return lucaIsConcernedAboutAddiction();
	}

	var subbyness:int = lucaSubmission();

	addButton(0, "Give Oral", lucaIsVeryTasty, true, "Give Oral", "Give Luca some oral affection." + (lucaFixation() ? " You know you’ll enjoy it." : ""));
	if (subbyness < 5) addDisabledButton(1, "Anal", "Anal", "You’re not submissive enough for this yet.");
	else addButton(1, "Anal", lucaFucksYourAss, undefined, "Anal", "Have Luca fuck your ass good." + (pc.hasPerk("Buttslut") ? " You know you’ll love it." : ""));
	if (pc.hasGenitals())
	{
		if (subbyness < 10) addDisabledButton(2, "Denial", "Denial", "You’re not submissive enough for this yet.");
		else addButton(2, "Denial", lucaPleaseDontMakeMeCome, undefined, "Denial", "Luca will edge you.");

		if (subbyness < 20) addDisabledButton(3, "Fuck Toy", "Fuck Toy", "You’re not submissive enough for this yet.");
		else addButton(3, "Fuck Toy", lucaToyFuckSomethingFunctionNamesYeah, undefined, "Fuck Toy", "Luca will use her BDSM gear on you and fuck you silly.");

		if (subbyness < 60) addDisabledButton(5, "Public Oral", "Public Oral", "You’re not submissive enough for this yet.");
		else if (pc.exhibitionism() < 50) addDisabledButton(5, "Public Oral", "Public Oral", "Right here where everyone can see it?");
		else addButton(5, "Public Oral", lucaIsVeryTastyAndIDontWannaHideIt, undefined, "Public Oral", "Give Luca some mouth comfort while she works the front desk.");

		if (flags["LUCA_SWITCHED"] != undefined)
		{
			if (pc.hasStatusEffect("Luca Switch Cooldown")) addDisabledButton(6, "Sub Switch", "Sub Switch", "Wait a while before asking again.");
			else if (!pc.cockThatFits(luca.vaginalCapacity()) < 0 && !luca.cockThatFits(pc.biggestVaginalCapacity()*1.25) < 0) addDisabledButton(6, "Sub Switch", "Sub Switch", "You are too big for Luca and she’s too big for you.");
			else addButton(6, "Sub Switch", lucaIsTurnedOnBySwitches, undefined, "Sub Switch", "Fuck Luca while she’s in her own BDSM gear.");
		}
		if (flags["LUCA_GENTLE"] != undefined) addButton(7, "Gentle", lucaBeingALoveyDoveyDomme, undefined, "Gentle", "Have some slow and intimate sex with Luca.");
	}
	else
	{
		addDisabledButton(2, "Denial", "Denial", (subbyness < 10 ? "You’re not submissive enough for this yet." : "You need genitals to edge!"));
		addDisabledButton(3, "Fuck Toy", "Fuck Toy", (subbyness < 20 ? "You’re not submissive enough for this yet." : "You need genitals to do this!"));
		addDisabledButton(5, "Public Oral", "Public Oral", (subbyness < 60 ? "You’re not submissive enough for this yet." : "You need genitals for this one."));
		if (flags["LUCA_SWITCHED"] != undefined) addDisabledButton(6, "Sub Switch", "Sub Switch", "And what do you plan to fuck Luca with?");
		if (flags["LUCA_GENTLE"] != undefined) addDisabledButton(7, "Gentle", "Gentle", "Need Genitals.");
	}
	if (subbyness < 40) addDisabledButton(4, "Cum Dump", "Cum Dump", "You’re not submissive enough for this yet.");
	else addButton(4, "Cum Dump", lucaDepositingIntoTheNationalCumBankOfSteele, undefined, "Cum Dump", "Luca will deposit her seed in you for hours.");
	addButton(9, "Safe Word", lucaSetSafeword, undefined, "Safe Word", "Ask to change your safe word.");
	addButton(14, "Back", approachLuca, true);
}

public function lucaIsVeryTasty(fromSexRouter:Boolean):void
{
	clearMenu();
	clearOutput();
	showLuca(true);
	author("RequiemForAMeme");
	processTime(20);
	

	//Hide this paragraph if coming from "like" confession branch.
	if (fromSexRouter) output("Luca smiles and quickly switches places with Sebastian. She grabs your [pc.hand] and leads you to her room. As soon as the door hisses closed Luca tells you take a seat on the couch. She darts across the room to her workstation and starts messing with a panel built into the wall.\n\n");
	//Resume here for <i>“like”</i> confession branch.
	output("As you take a seat the lights dim and about a dozen silent little robots start floating across the room. At the bottom of each robot is a dull light source flickering like a candle. A moment later, a");
	// has had the sex 3-5+ times:
	if (flags["LUCA_SEXED"] >= 3 + rand(3))	output(" familiar");
	output(" smooth jazz song quitely fills the room. Luca joins you on the couch shortly after, " + (pc.tallness > 6*12+6 ? "taking a moment to rest her head on your shoulder." : "taking a moment to pull you close until your head is on her shoulder."));
	output("\n\nLuca hums in tune with the jazz while her hand idly strokes your [pc.leg]. You look down to see her other hand slowly moving the backside of her fingers up and down her girthy shaft. You watch entranced by the methodical movement as a small bead of pre starts to form on the tip of her crown.");
	output("\n\n<i>“I think I’m ready [pc.name].”</i> Luca tells you. <i>“Get in front of me, " + (pc.hasKnees() ? "on your [pc.knees]" : "on the ground") + " and mouth open.”</i>");
	output("\n\nYou don’t say a word as you get up and position yourself before Luca. You kneel before her and gently caress her thighs. You take your time moving your hands across her smooth skin. Your breathing gets heavy as you lean in.");
	if (flags["LUCA_SEXED"] == undefined) output(" This is the first time you’ve seen Luca’s cock up close.");
	output(" Nearly all eleven inches brush across your face as you take in her impossibly sweet scent.");
	output("\n\nLuca brings her hands to your head and lightly strokes your [pc.hair]. <i>“Remember, [pc.name], why you’re here.”</i> Luca pulls your head close until your nose is buried into her smooth crotch. <i>“To be my oral cum pump until I say stop. Understood?”</i>");
	output("\n\nHer grip loosens allowing you to nod yes. <i>“Good. Now don’t disappoint me.”</i>");
	output("\n\nYour body heats with arousal as you bring your [pc.tongue] to the base of her cock. You slowly drag your tongue up her length.");
	if (lucaFixation()) output(" Every inch you pass makes your mind jump ahead and your throat tingle in anticipation.");
	output(" But you stop just as you are about to reach her crown. You slowly move your tongue back down her broad shaft all the way to the base and back up again and again and again. Each time you stop just short of her dry, throbbing, untouched crown.");

	output("\n\n");
	if (pc.isHerm()) output("Your dick hardens and your pussy wets itself throughout your tongue ministrations. ");
	else if (pc.hasCock()) output("Your dick hardens throughout your tongue ministrations. ");
	else if (pc.hasVagina()) output("Your pussy wets itself throughout your tongue ministrations. ");
	output("You look up at Luca to see what your lavishing actions have done. Her mouth hangs opens ever so slightly, her breath is heavy and her eyes shut. Your heart quickens at the sight.");

	output("\n\nOne last time you bring your tongue up her cock. " + (pc.hasLongTongue() ? "This time you wrap your [pc.tongue] around her girth. You gently pump her shaft as you move your head up to your target." : "This time you drag your tongue around her girth. You make sure no spot is without your saliva as you move your head up to your target."));
	if (lucaFixation()) output(" Your mouth waters in impatience as you move up her cock.");
	output("\n\nYou stop as you reach the top of her dick. You bring your [pc.tongue] back into your mouth and lean forward. When your hot breath touches her crown, her whole cock twitches and starts pulsating. You look up again to see a pair of emerald eyes staring down at you intensely. Her lips tremble as her whole body tenses up in anticipation. You purse your [pc.lips] and lovingly kiss the neglected tip of her cock.");

	output("\n\n");
	if (lucaFixation()) output(" The moment your lips touches her cock your body clenches up. Each of your senses suddenly intensifies from a minor orgasm.");
	output(" You spread your [pc.lips] around her crown taking as much of it into your mouth as you can. You take her head into your oral fuck tunnel using your lips and tongue kiss and taste as much of her sweet and savory cock as you can.");

	output("\n\nYour vision blurs and ears ring as you take more of Luca into your mouth. She’s so thick you might dislocate your jaw, maybe you already did. Despite her girth you slide down her cock with ease with your drool acting as the perfect lubricant. You only stop when her head brushes against the entrance to your throat. You barely hear Luca whimper as her cock releases a spurt of precum.");
	output("\n\nYour eyes roll as you taste a sample of her delicious seed.");
	if (lucaFixation() || lucaddiction() >= 75) output(" It feels right knowing her cock is leaking pre in your mouth.");
	output(" For a moment you wonder if you’re doing good or not. The moment passes as Luca tenderly urges you forward with her hands. <i>“Don’t stop. You’re so close.”</i>");
	output("\n\nHer voice is all the motivation you need. " + (canThroatLuca() ? "Your pliant throat opens up greedily" : "Your gag reflex slows your descent") + " as you move down her shaft. Each inch that passes your [pc.lips] and enters your gullet sets off fireworks in your brain. Your [pc.tongue] can’t stop licking the underside of her cock, brushing against each and every vein it can.");
	output("\n\nYou fully deepthroat Luca. " + (canThroatLuca() ? "You find breathing with a cock in your gullet second nature." : "It’s difficult to breathe but you manage to take in a long and satisfying breath.") + " You use your lips as best you can to suckle and kiss the base of her manhood. You let your tongue rest to feel her member throb on top of it. You take your time to just feel her inside you. Her cock is leaking more delicious precum than before" + (lucaFixation() ? " and sadly it’s skipping your taste buds going straight to your stomach." : "."));

	output("\n\n<i>“You should start to feel it soon.”</i>");
	if (flags["LUCA_SEXED"] == undefined) output("\n\nFeel what soon? You don’t have the time to process the words. First your lips swell with heat and arousal. You instinctively tighten the seal you’ve made around Luca’s meat and elicit a whimper from her. Following your lips, your mouth and throat quickly radiate with heat and pleasure. Each and every subtle movement from Luca’s cock causes ecstasy to radiate through your body. You let out a body shaking moan at the foreign sensations.\n\n<i>“A gene mod I spent a great deal of credits on makes certain parts of my body have aphrodisiac-esque qualities.”</i> Luca presses her hands against the back of your head. <i>“Hnnng,”</i> Luca pants. <i>“I wanted it to be a surprise for you [pc.name].”</i>");
	else output("\n\nYou mind spirals in anticipation for what’s next. You don’t have to wait long either. First your lips swell with heat and arousal. You instinctively tighten the seal you’ve made around Luca’s meat and elicit a whimper from her. Following your lips, your mouth and throat quickly radiate with heat and pleasure. Each and every subtle movement from Luca’s cock causes ecstasy to radiate through your body. You let out a body shaking moan at the foreign sensations.");
	
	output("\n\nYou feel Luca’s cock expand as you deepthroat her. Your body tenses up as you experience " + (lucaFixation() ? "yet another" : "a") + " minor orgasm. She releases more precum into your stomach. You don’t think you can hold back much longer. You kiss the base of Luca’s cock then start to move again.");
	output("\n\nYou move back and feel Luca’s cock slide out of your throat. " + (pc.hasVagina() ? "It feels almost like she was fucking your pussy." : "It feels incredible as though your throat had become a pussy.") + " You make sure your [pc.lips] are firm as your drag them up her shaft. Every inch that passes your oral seal sends shivers down your spine. You pull away agonizingly slow, feeling more and more empty. You’re trapped in this torturous pleasure of slowly pulling her cock out of your throat. You need to taste her seed again.");
	output("\n\nLuca’s crown slips from your incredibly empty throat. Her cock is leaking precum like a faucet. Tasting so much of her pre at once nearly sets you off again. Your lips tighten down around her thick head as your tongue gets to work again. Your mind and senses have cleared. Every drop that touches your tongue sets off small fireworks in your mind. You wonder if Luca treats all her subs to such delicious jizz. The thought of Luca with another sub completely and utterly lavishing her in attention annoys you. You want her cock all to yourself and you’re going to prove that you deserve it.");
	pc.changeLust(pc.lustMax());
	
	addButton(0, "Next", lucaIsVeryTastyInYourMouth);
}

public function lucaIsVeryTastyInYourMouth():void
{
	clearMenu();
	clearOutput();
	showLuca(true);
	author("RequiemForAMeme");
	processTime(40);

	output("At this point Luca is panting uncontrollably and her hands can only gently caress your [pc.hair] lest she break the rhythm. You yourself can’t stop moaning like " + (pc.hasFur() ? "an animal in heat" : "a whore") + ". You don’t even know when you started bobbing your head, you just know it feels too good to stop. Each taste of precum in more delicious than the next. You want her to fill you with her seed, no--you need her to at this point.");
	output("\n\n<i>“If you’re making sounds like that, I guess you’re ready for the main course.”</i>");
	output("\n\nYou freeze at the words, your mind overloaded on far too many things at once. Then you move your head down. This time there’s no wait. Luca’s crown glides through the entrance of your throat. Your mouth and throat are coated with so much saliva and precum you slide down Luca’s shaft like a well lubed onahole. With one swift deepthroating you’re kissing her base again. But it’s not just for her now, it’s for the both of you.");
	output("\n\nYou’re going to milk her cock with your mouth and throat for every drop it has. You begin face fucking yourself on Luca’s throbbing cock. With the increasing amount of precum, you know she loves it. You slide up and down her shaft as tightly and quickly as you can. But she doesn’t cum. You moan louder and louder, knowing it causes your throat to vibrate around her perfect thickness. You’re so close, but she won’t give in.");
	output("\n\nYou have a lightbulb moment as you fuck your throat with Luca’s meat stick. You pull yourself forward with your arms. You try to push her as deep as you can as you press against her base. You look up at Luca with your needy and wanton [pc.eyes].");
	output("\n\nLocking eyes with you Luca gives out a whorish cry as something in her mind breaks. Her hands drop to her sides as her body seizes up. You feel her cock engorge as her seed surges up. With you hilted her spunk pumps straight into your stomach. Your [pc.belly] swells as you ride a euphoria you’ve never experienced before.");
	var cumQ:Number = (pc.hasCock() ? pc.cumQ() : 0);
	if (pc.isHerm()) output(" Your cock sprays " + (cumQ < 250 ? "drops" : (cumQ < 1000 ? "spurts" : "ropes")) + " of [pc.cum] and your pussy contracts in neglect as your [pc.girlCum] " + (pc.wettestVaginalWetness() < 3 ? "drips" : "streams") + " down your legs, drenching the floor below you.");
	else if (pc.hasCock()) output(" Your own cock starts spraying " + (cumQ < 250 ? "drops" : (cumQ < 1000 ? "spurts" : "ropes")) + " of [pc.cum] showering the floor below you.");
	else if (pc.hasVagina()) output(" Your own pussy contracts in neglect as your [pc.girlCum] " + (pc.isSquirter() ? "drenches the floor below you." : (pc.wettestVaginalWetness() < 3 ? "drips." : "streams down your legs.")));
	output("\n\nYou feel each thick, sticky, heavenly drop of her seed flow into you. Quickly her cum overflows from your throat and into your mouth. The taste is so perfect that you try to seal your lips around her base to keep it there, but there’s just too much cum. It begins leaking from the corners of your mouth and then starts falling from your lower lip like a fountain. ");
	output("\n\nYour body goes on autopilot as you slowly slip off of Luca’s cock. When her cock finally escapes your mouth, she showers you both with her apparently endless seed. Eventually the flow stops and her cock begins to soften. You kneel before Luca completely filled and covered with her spunk. You both stay like that in a blissful euphoric post-fuck state for nearly half an hour.");

	pc.orgasm();
	pc.loadInMouth(luca);
	pc.applyCumSoaked();

	addButton(0, "Next", lucaIsAlsoVerySpent);
}

public function lucaIsAlsoVerySpent():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	// Skip ahead four hours.
	processTime(180);

	output("Luca comes out of it first. She has a robot helper fetch towels for you both. She has her helper lift you onto the couch then she starts delicately cleaning you off. Even licking certain spots of you until it shines with spit. After you’re clean she wraps you in a blanket and excuses herself. <i>“I won’t be gone long. Call me for anything.”</i> Eventually your euphoria ends, and you blackout for a short time.");
	output("\n\nYou awaken on Luca’s lap with an extremely sore throat. She appears to have cleaned herself and the mess. She presents you with an " + (flags["LUCA_SEXED"] == undefined ? "oddly" : "familiar") + " sweet smelling drink. She tells you it will help with any pain you may experience. You slowly drink from the strange concoction. She asks if there’s any holo you would like to watch as a holoscreen appears across the room and proceeds to care for your needs like a dear lover you’ve known for years. When the holo ends and you’re feeling refreshed you bid Luca farewell.");

	// +2 Cum Addiction, +1 Oral Fixation, 
	lucaddiction(2);
	lucaXP(1);
	// If pc does not have Oral Fixation +1 Submission. Else +2 Submission.
	lucaSubmission((lucaFixation() ? 2 : 1));
	
	IncrementFlag("LUCA_SEXED");

	addButton(0, "Next", leaveLotusEater);
}

public function lucaFucksYourAss():void
{
	clearMenu();
	clearOutput();
	showLuca(true);
	author("RequiemForAMeme");
	processTime(60);

	output("Luca smiles and quickly switches places with Sebastian. She grabs your [pc.hand] and leads you to her room. As soon as the door hisses closed Luca tells you to stand next to her bed. She darts across the room to her workstation and starts messing with a panel built into the wall.");
	output("\n\nAs you take your place, the lights dim and about a dozen silent little robots start floating across the room. At the bottom of each robot is a dull light source flickering like a candle. A moment later a" + (flags["LUCA_SEXED"] + rand(3) >= 5 ? " familiar" : "") + " smooth jazz song quitely fills the room.");
	if (pc.isNude()) output("\n\nLuca turns from her workstation and looks you up and down. " + (pc.mf("a","b") == "b" && pc.thickness >= 50 ? "She sucks in a long breath and whistles. <i>“God you are just perfect." : "<i>“You are such a tease.") + " You know that right? I am going to fucking ravage that ass of yours.”</i>");
	else output("\n\nLuca turns from her workstation and looks you up and down. <i>“Take your clothes off. Put on a show for me.”</i> You remove your [pc.assCovers], taking your time doing your best to entertain your partner. " + (pc.mf("a","b") == "b" && pc.thickness >= 50 ? "She sucks in a long breath and whistles. <i>“God you are just perfect." : "<i>“You are such a tease.") + " You know that right? I am going to fucking ravage that ass of yours.”</i>");
	output("\n\nShe sashays towards you stopping only when her firm melons press against your [pc.chest]. She caresses your [pc.face] and pulls you into a passionate kiss. Her tongue invades your mouth, overpowering your own. You softly moan in response. Then she pulls away, letting her teeth lightly drag your bottom lip with her.");
	output("\n\n<i>“Turn around, crawl on the bed, and grab hold of the headboard,”</i> Luca orders.");
	output("\n\nYou try to speak, but Luca quickly moves a finger to your lips, clicking her tongue three times. <i>“Good sluts follow orders.”</i> She nods towards the headboard. <i>“On your knees" + (pc.hasKnees() ? "." : ", or whatever, I suppose.") + "”</i>");
	output("\n\nYou nod and hastily crawl across the expansive bed. You hear Luca following behind you as you grip the headboard. You wait patiently, listening to Luca move around searching the blanket folds for something. <i>“Ah,”</i> she says. From the corner of your eye, you watch Luca move to the side of the bed to a nightstand. She grabs a bottle of lube then approaches you.");
	output("\n\nYou feel her breath against the back of your neck and two hands on your [pc.hips]. In one is something made of leather and plastic. Her hands leisurely climb up your frame. You feel her breasts press against your back as her hands present a red and black ball gag. <i>“Open wide.”</i>");
	output("\n\nYou open up and bite down on the red plastic. Luca leans back slightly and pulls the leather straps back around your head. She tightens the gag and you feel your [pc.lips] stretch. <i>“Let go of the headboard for now slut. Bend down and get your ass as high as you can.”</i>");
	output("\n\nYou release the headboard and shove your face into a pile of pillows. Luca begins to grope and knead your [pc.ass]. Once satisfied, she relents and pulls her hands away. You hear a bottle open and a squirting noise. Immediately a cold liquid is smeared around your backdoor. A finger starts to play with your");
	if (pc.hasPerk("Buttslut")) output(" needy");
	output(" pucker. Luca probes at your ass liberally lubing you up for her monstrous member. She idly hums in tune with the background jazz as she slips two fingers into your " + (pc.isAssTight() ? "tight" : (pc.elasticity >= 5 ? "stretchy" : "open")) + " rear.");
	output("\n\nEven though she is preparing for the main event, you’re nearly getting off");
	if (pc.hasGenitals()) output(". " + StringUtil.capitalize(pc.cockAndVagina("[pc.EachCock] is rigid and throbbing, just begging to be touched", "[pc."+(pc.isHerm()?"e":"E")+"achPussy] is sopping wet and achingly empty", " and "), false));
	output(". You moan through the gag and fight the urge to cum just from her fingers.");
	output("\n\n<i>“Just a bit longer,”</i> she tells you. Your eyes roll as she plays with and stretches your backdoor. Each time you think you might orgasm, she changes the rhythm and number of fingers. You whine and beg with unintelligible noises hoping she’ll finally take you.");
	output("\n\nShe pulls her fingers out and lets her slick right hand slide down your back. You feel her shaft thread up through your buttcheeks. Her fingers firmly grab " + (pc.hasHair() ? "a handful of your [pc.hair]" : (pc.hasHorns() ? "one of your [pc.horns]" : "the back of your head")) + ". Her other hand steadies your trembling hips as she hotdogs her dick with your [pc.ass].");
	output("\n\nWith a single motion, Luca pulls her hips back and slams her bitch-breaker of a cock into your well prepared rear. Your cries of pleasure are muffled as she saws her length in and out of you. One moment you’re " + (pc.hasPerk("Buttslut") ? "perfectly" : "uncomfortably") + " filled; the next you’re" + (pc.hasPerk("Buttslut") ? " achingly" : "") + " empty.");
	pc.buttChange(luca.biggestCockVolume());
	output("\n\nLuca cries out in tandem with your suppressed moans. She stops momentarily to savor the feel her length fully buried deep in your rectum.");
	if (pc.thickness >= 50) output(" Squealing in delight, she kneads your doughy rear end. <i>“Your ass is heavenly. Like it was made to be fucked and taken.”</i>");
	output(" She tightens her grip on your " + (pc.hasHair() ? "hair" : (pc.hasHorns() ? "horn" : "head")) + ". <i>“I’ll never get tired of this feeling: a great ass desperately squeezing my dick. Listening to sluts like you beg and cry out all for me.”</i>");
	output("\n\nLuca ravages your [pc.ass] with long and slow motions. You fall into a rhythm of her cock utterly filling you then leaving you feeling empty. She delights in how " + (pc.hasPlumpAsshole() || pc.analCapacity() > 0.75*luca.biggestCockVolume() ? "soft it feels around" : "tightly it clings to") + " her dick. Then she slams her cock deep into you and holds you in place. You clench around her thick meat as your ass starts to heat up. You whine and fidget as the sudden warmth and insatiable craving spreads through your rectum.");
	output("\n\n<i>“There it is. If you wiggle your hips for me, </i>slut<i>, I’ll fuck you full of my cum,”</i> Luca says in a low husky voice. She teases you with a small thrust. Your ass clamps down around her cock hopelessly trying to milk it. <i>“Otherwise I’m going to stay just like this, watching you uselessly beg until I’m satisfied.”</i>");
	output("\n\nYour [pc.legOrLegs] " + (pc.hasLegs() ? "wobble" : "wobbles") + " as you desperately try to get your body to obey you. Your [pc.ass] is so hot and needy; you need her to fuck you. You whine as Luca starts to move back and forth. She uses quick, fast, and small movements just to make you squirm beneath her. It’s not enough stimulation for you. You need her to fuck you harder. Each time you try to move your hips, Luca drives her dick deep into you, and each time your moan shamelessly.");
	output("\n\n<i>“Aww, is my slut trying to wiggle [pc.hisHer] hips?”</i> she asks, pausing to let you answer. You moan and try your best to nod your head. Luca releases the grip of her right hand and brings it down softly on your");
	if (pc.thickness >= 50) output(" plump")
	output(" rump. <i>“Good [pc.boyGirl].”</i>");
	output("\n\nLuca pulls her dick back until just the crown is touching your pucker. Her hands move to firmly take hold of your [pc.hips]. She slams her schlong back into your [pc.ass] unrelentingly. Sawing back and forth once again, she absolutely ravages your ass. Her cock feels as hard as metal as she takes you both to your peaks. <i>“Ga- gonna- I’m gonna- I’m CUMMING!”</i> Luca smashes her hips into your backside, filling you completely with her dick as she unloads her seed into you.");
	output("\n\nYou orgasm along with her");
	var cumQ:Number = (pc.hasCock() ? pc.cumQ() : 0);
	if (pc.hasGenitals()) output("," + pc.cockAndVagina(" [pc.eachCock] spraying a " + (cumQ < 1000 ? "tiny" : (cumQ < 10000 ? "excessive" : "inhuman")) + " amount of seed down onto her sheets", " [pc.eachPussy] " + (pc.wettestVaginalWetness() < 3 ? "slightly" : (pc.wettestVaginalWetness() < 5 ? "somewhat" : "absolutely")) + " drenching your lover’s legs"));
	output(". Her cock blasts wave after wave of semen into your guts as she cums. Each and every gush");
	if (pc.hasPerk("Buttslut")) output(" sends a rush of pleasure to your slut-addled mind and");
	output(" fills you until your [pc.stomach] distends from the amount.");
	output("\n\nLuca keeps you in that position until her balls have fully emptied themselves. Slowly, she leans into your back and pulls you both down into your mess. You shudder as Luca pulls you into a tight embrace. <i>“Good slut,”</i> she purrs into your ears. You close your eyes and drift into sleep as Luca’s cock goes soft in your ass.");
	
	pc.loadInAss(luca);
	pc.orgasm();
	
	addButton(0, "Next", lucaAnalPartTwo);
}

public function lucaAnalPartTwo():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(180);

	output("You wake up wrapped up in several plush blankets. Luca is sitting upright next to you reading from a tablet. <i>“Good");
	if (hours < 6) output(" night");
	else if (hours < 12) output(" morning");
	else if (hours < 18) output(" afternoon");
	else if (hours < 22) output(" evening");
	else output(" night");
	output(", [pc.name],”</i> she says when she see you wiggle free of your warm confines. You feel bloated and find it painful to move your [pc.legOrLegs].");
	output("\n\n<i>“Hold on a second.”</i> Luca snaps her fingers, and a drone brings a familiar sweet smelling drink. <i>“Drink this.”</i> She helps you lean up and holds the cup while you drink. After you’re finished Luca and her drones help you to her bathroom where you both clean up. She dotes on you trying to do anything and everything for you, from washing your back to massaging your [pc.legOrLegsNoun].");
	output("\n\nAfter you’re clean, she dries you off and wraps you up in blankets again. During your shower her drones cleaned and changed the sheets on her bed. She lies down next to you, pulling you into her arms. She asks if there’s a holo you would like to watch as a holoprojector appears across the room, then proceeds to care for your needs like a dear lover you’ve known for years. When the holo ends and you’re feeling refreshed, you bid Luca farewell.");
	
	// +2 Cum Addiction
	lucaddiction(2);
	// If pc does not have Buttslutt +1 Submission. Else +2 Submission.
	lucaSubmission((pc.hasPerk("Buttslut") ? 2 : 1));
	// Return to the Lotus Eater.
	IncrementFlag("LUCA_SEXED");
	IncrementFlag("LUCA_ANAL");

	pc.shower();

	addButton(0, "Next", leaveLotusEater);
}

public function lucaPleaseDontMakeMeCome():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(10);

	if (flags["LUCA_DENIED"] == undefined)
	{
		output("You ask Luca if she would be willing to take your relationship a bit further.");
		output("\n\n<i>“I suppose it’s about time we got use out of your safe word. But only if you’re certain [pc.name].”</i> ");
		output("\n\n<i>“I’m certain.”</i>\n\n");
	}
	output("Luca smiles warmly and calls over Sebastian to switch places with. You take her hand before she can offer it and follow closely as she leads you to her room. <i>“I’m going to grab some things from the next room. You can set the mood.”</i> She points to the panel by her workstation. <i>“After you’re done I expect you to");
	if (!pc.isNude()) output(" strip and");
	output(" wait for me on the bed.”</i>");
	output("\n\nLuca walks into her library of holos and disappears. You hear the hiss of a door opening and closing. That leaves you to decide the atmosphere of the room. The panel has several options to choose from.");
	
	var musicFunc:Function = function(slot:int):void
	{
		showLuca();

		addDisabledButton(0, "Music: ");
		addButton(1, "Classical", musicFunc, 1);
		addButton(2, "Electronic", musicFunc, 2);
		addButton(3, "Jazz", musicFunc, 3);
		addButton(4, "Opera", musicFunc, 4);

		if (slot == 0) flags["LUCA_MUSIC"] = undefined;
		else
		{
			flags["LUCA_MUSIC"] = slot;
			if (slot == 1) addDisabledButton(1, "Classical");
			else if (slot == 2) addDisabledButton(2, "Electronic");
			else if (slot == 3) addDisabledButton(3, "Jazz");
			else if (slot == 4) addDisabledButton(4, "Opera");
			if (flags["LUCA_LIGHTS"] != undefined) addButton(14, "Next", lucaDenialGo);
		}
	};

	var lightFunc:Function = function(slot:int):void
	{
		showLuca();

		addDisabledButton(5, "Lights: ");
		addButton(6, "Romantic", lightFunc, 6);
		addButton(7, "Vibrant", lightFunc, 7);
		
		if (slot == 0) flags["LUCA_LIGHTS"] = undefined;
		else
		{
			flags["LUCA_LIGHTS"] = slot;
			if (slot == 6) addDisabledButton(6, "Romantic");
			else if (slot == 7) addDisabledButton(7, "Vibrant");
			if (flags["LUCA_MUSIC"] != undefined) addButton(14, "Next", lucaDenialGo);
		}
	};

	musicFunc(0);
	lightFunc(0);
}

public function lucaDenialGo():void
{
	clearMenu();
	clearOutput();
	showLuca(false);
	author("RequiemForAMeme");
	processTime(5);

	var musicType:String = ["classical", "electronic", "jazz", "opera"][flags["LUCA_MUSIC"] - 1];
	flags["LUCA_MUSIC"] = undefined;
	var romanticLight:Boolean = flags["LUCA_LIGHTS"] == 6;
	flags["LUCA_LIGHTS"] = undefined;

	output("Confirming your selection, you");
	if (!pc.isNude()) output(" strip out of your [pc.gear] and");
	output(" go to the bed to wait for Luca. As you take a seat a dozen all too familiar little robots start floating across the room. At the bottom of each robot is a " + (romanticLight ? "dull light source flickering like a candle" : "chromatic light source changing colors in a cycle") + ". A moment later " + musicType + " music begins to quietly fill the room.");
	output("\n\nLuca returns quickly with a container full of leather straps and sex toys. " + (musicType == "jazz" && romanticLight ? "<i>“Hmm,”</i> she grins. <i>“My favorite.”</i>" : "<i>“Interesting choices [pc.name].”</i>") + " She reaches into the container, pulls out a black sash and hands it to you. <i>“Wrap that around head to cover your eyes and lie down chest up. I’ll be with you shortly.”</i>");
	output("\n\nYou do as told and wrap the soft fabric around your head and tie it off in the back. The sash doesn’t fully block your vision, you can make out a dark blurry outline of Luca surrounded by floating " + (romanticLight ? "warm" : "chromatic") + " lights. You lie down on the bed and wait for Luca to give you more instructions.");

	if (flags["LUCA_DENIED"] == undefined)
	{
		output("\n\nLuca hums along with the music as she moves around the bed. You do your best to watch her blurry and dark form while she places smooth bracelets around your wrists and ankles. <i>“These are special gravity cuffs [pc.name]. Right now you can move your limbs freely.”</i> You wiggle your arms and legs a bit to check. <i>“And now...”</i> An electronic revving sound emanates from the bracelets. <i>“Try moving again.”</i> You try to move your [pc.arms] and [pc.legOrLegs], but only end up wiggling in place. <i>“Excellent. Now before we begin, I want to remind you that if at anytime you feel uncomfortable and want to stop you only need to say the word. All right?”</i>");
		output("\n\n<i>“I’ll remember.”</i>");
		output("\n\nLuca positions herself on the bed sitting next to you. <i>“Now then, we are going to play a simple game.”</i> She drags a single finger up from your waist to your [pc.chest]. <i>“The rules are simple. Rule one: until we’re finished I am your Mistress, and you are my pet slut.”</i> Her finger continues to travel up until she stops on your [pc.lipsChaste]. <i>“Rule two, you don’t move or speak unless I give you permission.”</i> She pushes her finger between them. <i>“If you break the rules, I punish you. Understood?”</i>");
		output("\n\nYou nod and lightly suck on her finger.");
	}
	else
	{
		output("\n\nLuca hums along with the music as she moves around the bed. You do your best to watch her blurry and dark from as she places smooth gravity cuffs around your wrists and ankles. <i>“Do you remember the rules?”</i> Luca asks.");
		output("\n\n<i>“Yes Mistress I remember. And if I feel uncomfortable I’ll use the safeword.”</i>");
		output("\n\nLuca positions herself on the bed sitting next to you. She leans down and kisses you.");
	}

	output("\n\n<i>“Good. Now let’s begin.”</i>");
	
	addButton(0, "Next", lucaDenialStarts);
}

public function lucaDenialStarts():void
{
	clearMenu();
	clearOutput();
	showLuca(true);
	author("RequiemForAMeme");
	processTime(5);

	output("Luca begins by caressing and massaging your body. Her fingers dance across your [pc.skin] as she explores your");
	if (pc.tone < 25) output(" soft");
	else if (pc.tone < 50) output(" average");
	else if (pc.tone < 75) output(" toned");
	else output(" chiseled");
	output(" form. With each stroke and touch, she barely misses your most sensitive areas, each time coming slightly closer to that oh-so-pleasurable than the last.");
	output("\n\nShe stops and places a hand on your waist right above" + pc.cockAndVagina(" [pc.eachCock]", " [pc.eachPussy]") + ". With her previous ministrations, your body is completely relaxed, and you melt to her touch. With utmost care she brings her hands down to your neglected " + (pc.isHerm() ? "sexes." : "sex."));
	output("\n\nUsing a delightfully slow and tender touch she brings" + pc.cockAndVagina(" [pc.eachCock] to a full rigid mast", " [pc.eachPussy] to a hot wet mess") + ". Unable to hold yourself back you thrust your [pc.hips] into her hands. Luca tsks and slaps the side of your [pc.thigh].");
	output("\n\n<i>“No moving,”</i> she barks. <i>“Time for a punishment.”</i>");
	output("\n\nLuca moves from your side, bringing a leg over your chest as she repositions herself into a kneeling position above your head. <i>“Deep breath, slut,”</i> she tells you before slowly lowering herself. You feel her erect rod fall " + (pc.hasBreasts() ? "into the valley of your breasts" : "onto your chest") + ". Her full balls rest against the bottom of your chin, and her wet feminine sex press against your [pc.lips].");
	output("\n\n<i>“If you want me to touch you again you had better put your tongue to use.”</i>");
	output("\n\nYou quickly follow your Mistress’s order and put your [pc.tongue] to work. " + (pc.hasLongTongue() ? "You dive into her pussy forcing your eager muscle deeper and deeper. She moans blithely as you start twisting your oral organ and lapping at her deepest parts." : "Your eager muscle dives into her pussy as deep as you can.") + " You remove your tongue and tilt your head ever so slightly to get at her clit. Luca sinks down a bit further onto your face in response, presenting you with the gift of even better access to her delectable love button. You alternate between diving into her sex and stimulating her pleasure bud.");
	output("\n\nLuca lets out a sigh of satisfaction as she returns to tending to" + pc.cockAndVagina(" [pc.eachCock]", " [pc.eachPussy]") + ". Just as you start to run out of air, she lifts herself from your face and brings her lips to your " + (pc.hasCock() ? "crown" : "own clit") + ". She plants a soft kiss before repositioning herself again. You stifle a grunt and keep yourself from moving as Luca leaves the bed.");
	output("\n\nLuca returns after a brief moment and crawls up the bed to you. She spreads your legs just a bit further as she gets to work on keeping you aroused. One hand tends to" + pc.cockAndVagina(" [pc.eachCock]", " [pc.eachPussy]") + " while the other begins to play with your backdoor. You feel her hot breath on you as she leans closer to your privates.");
	output("\n\nYou feel her lick your inner thighs then pull away. " + StringUtil.capitalize(pc.cockAndVagina("her hands return to [pc.eachCock] and with a hard ‘click’ locks a ring around " + (pc.hasCocks() ? "each" : "the") + " base.", "you feel a blunt ribbed object slide into [pc.eachPussy].", " Then "), false) + " Finally the first of several slime-covered metallic beads are crammed into your");
	if (pc.hasPerk("Buttslut")) output(" wanton");
	output(" pucker. Once the last bead is in, you feel your entire lower region start to faintly vibrate and buzz.");
	output("\n\n<i>“These will keep you nice and on edge while I go back to the lounge for a few hours,”</i> Luca tells you. <i>“Don’t think about cumming either. My little ones will be keeping an eye on you.”</i>");
	pc.changeLust(10+pc.libido()/4);
	
	addButton(0, lucaSafeWord, lucaWontDenyYou);
	addButton(1, "Say Nothing", lucaJustStayTiedUpAndHorny);
}

public function lucaWontDenyYou():void
{
	clearMenu();
	clearOutput();
	showLuca(true);
	author("RequiemForAMeme");
	processTime(5);

	output("<i>“[lucaSafeWord],”</i> you say before Luca has a chance to turn around.");
	output("\n\n<i>“I understand [pc.name]. Here, lean up,”</i> she says. You feel the cuffs become light again and use your arms to to prop yourself up as Luca gets behind you. She wraps her arms around you pulling you into a tight embrace. <i>“I know it can be frustrating to get all worked up and not climax. If you want, I can finish you off before we clean up.”</i>");

	addButton(0, "Yes", lucaWillEvenFinishYouOffYouLuckyDogYou);
	addButton(1, "No", lucaImOutJustOut);
}

public function lucaWillEvenFinishYouOffYouLuckyDogYou():void
{
	clearMenu();
	clearOutput();
	showLuca(true);
	author("RequiemForAMeme");
	processTime(65);

	output("<i>“I’d like that,”</i> you answer.");
	output("\n\n<i>“Excellent,”</i> Luca whispers into your ear.");

	// luca will play with this vag
	var x:int = rand(pc.vaginas.length);

	var cumQ:Number = (pc.hasCock() ? pc.cumQ() : 0);
	if (pc.isHerm())
	{
		output("\n\nHer hug loosens, and her hands drift down to your [pc.cocks] and your [pc.vaginas]. You hear a " + (pc.hasCocks() ? "series of hard ‘clicks’" : "hard ‘click’") + " once again as Luca removes the " + (pc.hasCocks() ? "rings" : "ring") + " around your " + (pc.hasCocks() ? "dongs" : "dong") + ". She then wraps one hand around [pc.oneCock] while the other grabs the end of " + (pc.hasVaginas() ? "a" : "the") + " dildo in your [pc.vagina]. <i>“Feel free to thrust, [pc.name]. This is all for you.”</i>");
		output("\n\nLuca starts working [pc.eachCock] with quick, light strokes that tighten into longer, slower ones, only to fade back into more rapid, feathery caresses. Meanwhile she uses the dildo to fuck your [pc.pussy " + x + "] lightly twisting it in circles then switching to long hard plunges. With the steady buzzing in your ass and the expert hands working your phallus and quim, you can’t help but thrust into her. You cry out and jerk helplessly in her grip as Luca brings you to climax. [pc.EachCock] sprays");
		if (cumQ < 1000) output(" drops");
		else if (cumQ < 6000) output(" spurts");
		else if (cumQ < 20000) output(" ropes");
		else if (cumQ < 50000) output(" gallons");
		else output(" an inhuman amount");
		output(" of [pc.cum] onto yourself and your lover at the same time your [pc.vaginas] " + (pc.hasVaginas() ? "contract" : "contracts") + " in delight. [pc.GirlCum]");
		if (pc.wettestVaginalWetness() < 3) output(" drips down onto");
		else if (pc.wettestVaginalWetness() < 5) output(" cascades down onto");
		else output(" absolutely drenches");
		output(" your the sheets below you.");
	}
	else if (pc.isMale())
	{
		output("\n\nHer hug loosens, and her hands drift down to [pc.eachCock]. You hear a " + (pc.hasCocks() ? "series of hard ‘clicks’" : "hard ‘click’") + " once again as Luca removes the " + (pc.hasCocks() ? "rings" : "ring") + " around your " + (pc.hasCocks() ? "dongs" : "dong") + ". She then wraps both hands around your " + (pc.hasCocks() ? "shafts" : "shaft") + ". <i>“Feel free to thrust, [pc.name]. This is all for you.”</i>");
		output("\n\nLuca starts working [pc.eachCock] with quick, light strokes that tighten into longer, slower ones, only to fade back into more rapid, feathery caresses. With the steady buzzing in your ass and the expert hands on your " + (pc.hasCocks() ? "phalli" : "phallus") + " you can’t help but thrust into her. You cry out and jerk helplessly in her grip as Luca brings you to climax.");
		if (cumQ < 1000) output(" Your [pc.cum] squirts out, covering your lover’s hands and your own thighs.");
		else if (cumQ < 6000) output(" Your [pc.cum] comes out in small ropes, covering your lover’s hands, your [pc.chest] and [pc.legOrLegs], and the sheets.");
		else if (cumQ < 20000) output(" Buckets of [pc.cum] blast from your " + (pc.hasCocks() ? "dicks" : "dick") + " as Luca continues to stroke your " + (pc.hasCocks() ? "shafts" : "shaft") + ". You drench yourself and your lover’s arms, along with the front of the bed in your seed.");
		else if (cumQ < 50000) output(" Gallons of [pc.cum] launch from your " + (pc.hasCocks() ? "dicks" : "dick") + " as Luca continues to stroke your " + (pc.hasCocks() ? "shafts" : "shaft") + ". You completely drench both yourself and your lover, along with her bed in your seed.");
		else output(" An inhuman amount of [pc.cum] erupts from your " + (pc.hasCocks() ? "dicks" : "dick") + " as Luca continues to stroke your " + (pc.hasCocks() ? "shafts" : "shaft") + ". A deluge of your spooge falls upon yourself and your lover. By the time you’re finished, it feels like you’ve ejected an entire tub of seed.");
	}
	else if (pc.isFemale())
	{
		output("\n\nHer hug loosens, and her hands drift down to [pc.eachPussy]. One hand grabs the end of " + (pc.hasVaginas() ? "a" : "the") + " dildo in your [pc.pussy " + x + "] while the other stops just above your " + (pc.totalClits() > 1 ? "clits" : "clit") + ". <i>“Feel free to move your hips, [pc.name]. This is all for you.”</i>");
		output("\n\nLuca starts working [pc.pussy " + x + "], lightly twisting the dildo in circles then alternating to long, hard plunges. Meanwhile her other hand relentlessly teases and pulls as your bitch " + (pc.totalClits() > 1 ? "buttons" : "button") + ". With the steady buzzing in your ass and the expert hands working your entire lower region you can’t help but thrust into her. You cry out and jerk helplessly in her grip as Luca brings you to climax. [pc.EachPussy] is wonderfully filled as [pc.girlCum]");
		if (pc.wettestVaginalWetness() < 3) output(" drips down onto");
		else if (pc.wettestVaginalWetness() < 5) output(" cascades down onto");
		else output(" absolutely drenches");
		output(" your lover’s hand and the sheets below you.");
	}

	output("\n\nBoth of you are breathing heavily as Luca pulls you into another embrace. You try to relax in the afterglow of your orgasm and allow yourself to rest in her arms. You tremble and shiver in her grasp every so often, each time eliciting a comforting coo and tender pet on the head. She holds you that way for roughly ten minutes before letting go.");
	output("\n\nLuca tells you to clean up first while she tends to the mess you two made.");
	if (cumQ >= 20000) output(" Feeling bad for making most of it, you volunteer to help, but she tells you this isn’t her first time dealing with a fuck-ton of cum and insists you clean up first.");
	output(" You carefully make your way to the shower and, once the water is flowing, you use the opportunity to remove the once buzzing beads in your backdoor. After you’re thoroughly clean, you come out " + (cumQ < 20000 ? "to find the bed perfectly clean and tidy." : "a squad of drones still cleaning your mess."));
	output("\n\nLuca walks by and boops you on the nose before taking your place in the shower. <i>“Don’t wait up [pc.name],”</i> she says with a wink as the door closes.");
	output("\n\nWith that said, you");
	if (!pc.isNude()) output(" get dressed and");
	output(" head out.");
	
	// First Time: -3 submission Else: -1 submission
	// -1 submission was cut
	if (flags["LUCA_SAFEWORDED_DENIAL"] != undefined) lucaSubmission(-3);

	pc.orgasm();
	pc.shower();
	IncrementFlag("LUCA_SEXED");
	flags["LUCA_SAFEWORDED_DENIAL"] = 1;
	// Luca shouldn't explain the rules again anyways
	if (flags["LUCA_DENIED"] == undefined) flags["LUCA_DENIED"] = 0;

	addButton(0, "Next", leaveLotusEater);
}

public function lucaImOutJustOut():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(35);

	output("<i>“I’d rather not,”</i> you answer.");
	output("\n\n<i>“I understand,”</i> Luca says with a hint disappointment in her voice.");
	output("\n\nShe " + pc.cockAndVagina("carefully undoes the " + (pc.hasCocks() ? "rings" : "ring") + " around your " + (pc.hasCocks() ? "cocks" : "cock"), "removes the dildo in your pussy", " then ") + ". You both head to her shower to remove the beads in your backdoor. After you’re clean and free of sex toys, you");
	if (!pc.isNude()) output(" grab your gear");
	output(" bid Luca farewell.");
	
	// First Time: -5 submission
	if (flags["LUCA_SAFEWORDED_DENIAL"] != undefined) lucaSubmission(-5);
	flags["LUCA_SAFEWORDED_DENIAL"] = 1;
	
	// Luca shouldn't explain the rules again anyways
	if (flags["LUCA_DENIED"] == undefined) flags["LUCA_DENIED"] = 0;
	
	pc.shower();

	addButton(0, "Next", leaveLotusEater);
}

public function lucaJustStayTiedUpAndHorny():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(215);

	output("You say nothing as you listen to your mistress walk away. You hear the pneumatic hiss of the door closing and you are left alone. The soft vibrations coming from your loins brings your focus to your " + pc.cockAndVagina("[pc.cocks]", "[pc.vaginas]", ", ") + " and stuffed backdoor. You hum in delight as the vibrations speed up over the passing minutes until they begin shake your very core.");
	output("\n\nJust as you feel your peak approaching, the vibrations comes to a dead halt. You twitch in place, wiggling your hips in confusion and frustration. You open your mouth to call out only to have a pair of satin panties stuffed into it. ");
	output("\n\n<i>“Mistress commanded you to remain in place and wait for her to return,”</i> a robotic male voice next to you says.");
	output("\n\n<i>“Yes. Yes,”</i> a second robotic female voice calls out. <i>“We can’t allow you to defy Mistress.”</i>");
	output("\n\nYou let out a muffled moan as " + pc.cockAndVagina("the cockring", "the dildo", ", ") + " and the anal beads begin vibrating once again. Having not fully come down from your peak, you helplessly thrust your hips into the sex toys. Your orgasm builds and builds until your lower body feels like it’s going to explode. Then it all stops dead once again.");
	output("\n\n<i>“Naughty slut,”</i> the drones call out. <i>“Time for punishment.”</i>");
	output("\n\nBefore you can wonder what the punishment is, you hear the music go quiet. It is quickly replaced with audio from a porno. A woman is panting and howling in ecstasy as some man rails into her backside. <i>“Ah! Harder. HARDER!”</i> You hear the couple fuck and fuck for several minutes before the audio switches to a different video. ");
	output("\n\nListening to more and more strangers fuck and climax over and over again is torturous to your ears. As you think it can’t get worse, the vibrations return. This time slow and steady, just enough to bring you back to the edge. You grunt, twisting in place. You’ve been so close so many times that all you need is a little bit more and you could cum. After a few minutes of fruitless thrusting, you give up and resign yourself.");
	output("\n\nThree hours of teasing and build-up pass, and you’re left a hot sweaty mess. Between the noisy thrusts and moans of the hundredth porno, you hear a familiar hiss. The happy hum of your mistress fills you with joy. Still bound and gagged, you cry for release.");
	output("\n\n<i>“I’ll have you know that I’ve been watching you Slut,”</i> your mistress tells you. <i>“I can’t begin tell you how delighted I was to see you so writhe in lust-filled agony.”</i> She takes a seat right next to you, placing a hand on your [pc.chest]. <i>“You did very well");
	if (flags["LUCA_DENIED"] == undefined || flags["LUCA_DENIED"] == 0) output(" for your first time");
	output(". But it’s time for our little session to end.”</i>");
	output("\n\nYour mistress removes the blindfold and stares into your eyes. She smiles, cups the back of your head, and leans down to kiss you on the forehead. <i>“I’m very proud of you [pc.name].”</i> She removes the makeshift pantie gag. <i>“Now for your final order I want you to go out and have a passionate, mind-numbing fuck. Understood?”</i>");
	output("\n\nYou nod in a lust addled haze <i>“Yes Mistress.”</i>");
	output("\n\nYou see her lips stretch wide before she says <i>“Wonderful.”</i>");
	output("\n\nLuca undoes the gravity cuffs and takes you to her shower. There she removes " + pc.cockAndVagina("the cockring", "the dildo", ", ") + " and the anal beads. She takes great care to make sure you don’t accidentally climax to her touch. Once the final bead is removed, Luca takes you into the shower and washes you down. She whispers praises into your ears as she cleans each and every part of your body. Only after nearly half an hour of tender love and care does she allow you to leave, with a light slap on your [pc.ass].");

	// First Time: +10 submission. Else: +4 Submission
	lucaSubmission((flags["LUCA_DENIED"] == undefined || flags["LUCA_DENIED"] == 0 ? 10 : 4));
	// If pc masturbates before having sex they -5 Submission
	/* If the player opens the masturbation menu while having this status, v1 is set to 1
	 * If the player orgasms while v1 1 is one, -5 submission
	 * It's tidier than adding a bit to every single masturbation scene
	*/
	pc.createStatusEffect("Denied By Luca");
	IncrementFlag("LUCA_DENIED");
	// Set Lust to max and give appropriate debuffs.
	pc.changeLust(pc.lustMax());
	pc.shower();

	addButton(0, "Next", leaveLotusEater);
}

public function lucaToyFuckSomethingFunctionNamesYeah():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(5);

	if (flags["LUCA_FUCKTOYD"] == undefined) output("You ask Luca if she would be willing to take your relationship a bit further.\n\n<i>“I want you to use me Mistress. I want you to satisfy all your urges with me.”</i>");
	else output("<i>“Mistress I want you to use me again.”</i>");
	output("\n\nHer eyes narrow at you, and she doesn’t speak for nearly a minute. <i>“Are you sure, [pc.name]?”</i> ");
	output("\n\n<i>“I am.”</i>");
	output("\n\nLuca gives you a mischievous smirk and switches places with Sebastian. She links arms with you, pulling you close as she leads you to her room. As soon as the door hisses closed Luca tells you");
	if (!pc.isNude()) output(" to strip and");
	output(" stand in the center. She leisurely walks across the floor to her workstation and starts messing with one of the panels built into the wall.");
	output("\n\nAs you");
	if (!pc.isNude()) output(" remove your [pc.gear] and");
	output(" take your place, the lights dim, and about a dozen familiar little robots start floating across the room. At the bottom of each one is a light flickering like a candle. A moment later, familiar smooth jazz quitely fills the room. As you watch the robots, a myriad of cords ending in leather straps descend upon you from the ceiling.");
	output("\n\nLuca laughs from across the room. You playfully flail your arms a bit, pushing the straps to the side and see Luca watching your display. <i>“Let me, [pc.name].”</i>");
	output("\n\nLuca approaches you and starts sorting the leather straps. She has you hold two sets in your hands while she works. <i>“Alright then. First I’m going to set you up using these.”</i> ");
	output("\n\nShe starts with three straps around each of your [pc.thighs], then six more straps around your [pc.chest] and back. Taking the straps from your hands, the dzaan pulls your arms behind your back. She uses them to bind your forearms together then wraps a set of long straps around your upper body, keeping your arms fully locked in place.");
	output("\n\nShe presses a button on a remote, and you feel yourself lifted off the ground slightly. You find yourself floating face-down a few feet off the ground, held up by nearly a dozen straps and cords. " + (pc.hasKnees() ? "Finally she bends your knees shut, bringing your ankles next to your thighs and binds your legs." : "Finally she bends your [pc.legOrLegs] into position to be securely bound."));
	output("\n\nLuca walks around you admiring you and her work. Her hands and fingers trail across your body as she moves. Finally she stops at your head and raises you up until your eye level. She pulls you into a deep kiss then pulls away just as quick to gaze into your [pc.eyes].");
	output("\n\n<i>“This is your last chance, [pc.name]. Either say our magic word or bite down.”</i> She presents you with " + (flags["LUCA_FUCKTOYD"] > 3 ? "the leather gag covered in your bite marks" : "a pristine leather gag") + ". <i>“If you don’t want this, we can call it quits right now. But if you bite down, then you are mine. My own personal fuck toy. I will use you however and whenever I want until I’m satisfied. Understood?”</i>");
	
	addButton(0, lucaSafeWord, lucaWontUseYouAsAFucktoy);
	addButton(1, "Bite Down", lucasGagIsTastyAsWell);
}

public function lucaWontUseYouAsAFucktoy():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(25);

	output("You look away from Luca and stare at the gag for a long moment. <i>“[lucaSafeWord],”</i> you tell her.");
	output("\n\nShe cups your cheek and pulls your gaze back to her. <i>“I understand [pc.name]. Just relax as I undo the bindings.”</i> Luca moves around you and undoes the straps on your [pc.legOrLegs] first and lowers you to the ground. After that she swiftly undoes the rest of bindings on your body. She checks your skin for bruises then pets your head. <i>“We’ll get there,”</i> she tells you with a smile.");
	output("\n\nWith nothing else to say, you");
	if (!pc.isNude()) output(" grab your gear and");
	output(" bid Luca farewell.");
	
	// First Time: -2 submission
	if (flags["LUCA_SAFEWORDED_FUCKTOY"] == undefined) lucaSubmission(-2);
	flags["LUCA_SAFEWORDED_FUCKTOY"] = 1;
	
	addButton(0, "Next", leaveLotusEater);
}

public function lucasGagIsTastyAsWell():void
{
	clearMenu();
	clearOutput();
	showLuca(true);
	author("RequiemForAMeme");
	processTime(235);
	
	var x:int = rand(pc.vaginas.length+1) - 1;

	output("You obediently bite down on the " + (flags["LUCA_FUCKTOYD"] > 3 ? "well used" : "pristine") + " leather. Luca brings the ends around, fastening the gag in place.");
	output("\n\n<i>“Bark for me,”</i> your mistress orders.");
	output("\n\nYou try to obey, but the leather gag has your mouth stretched wide around it. <i>“Bmmphh.”</i> Your voice comes out muffled.");
	output("\n\n<i>“Such a good toy,”</i> she praises. Luca then spins you around letting her hands touch and caress the exposed parts of your [pc.skin].");
	if (pc.thickness >= 50) output(" <i>“You might be my favorite cock sleeve.”</i>");
	output("\n\nAfter several minutes of fondling your body, your mistress pulls away and positions herself behind you. You hear her snap her fingers, then shortly after hear a squirting sound. A cream covered palm comes to rest against the crevice of your [pc.ass]. The cold sensation causes you to tense up, earning a slap on your cheeks.");
	output("\n\n<i>“Relax,”</i> she says rubbing the cream against " + (x < 0 ? "your [pc.asshole]" : "[pc.onePussy " + x + "]") + ". Her touch warms up as she spreads the cream around. Soon you’re " + (pc.catDog("a","b") == "a" ? "purring" : "humming") + " happily as her fingers starts to probe and stretch your depths. Gradually her attention to your " + (x < 0? "ass" : "pussy") + " has you moaning to her touch.");
	output("\n\nLuca pulls her hands away then draws you in close her. Her breath brushes against the back of your neck. She whispers softly. <i>“You’re ready.”</i>");
	output("\n\nShe releases you, and the cords holding you up readjust. Your body is angled so your face is lower to the floor and your [pc.butt] is raised up. Luca’s hands come to rest on your [pc.thighs]. The crown of her bitch-breaker presses against the " + (x < 0 ? "rim of your [pc.ass]" : "lips of your [pc.pussy " + x + "]") + ". <i>“");
	if (pc.thickness >= 50) output("With a body like this I might never stop fucking you. ");
	output("Feel free to cry out like the submissive little slut you are.”</i>");
	output("\n\nWith one thrust, she slams her thick shaft into you. You groan around your gag and delight in how good it feels to have her inside you. She pulls back and begins to fuck your [pc.vagOrAss " + x + "] with long hard thrusts. Your eyes roll back as she uses you as her own personal onahole.");
	pc.holeChange(x, luca.biggestCockVolume());
	output("\n\nYour stifled squeals of pleasure drown out the soft music as your mistress uses your body. <i>“That’s right, fuck-toy. Scream for me!”</i> Luca shouts, burying her cock into your [pc.pussyOrAss " + x + "]. An all too familiar heat begins the suffuse through your loins, followed by an increasing craving to be fucked long and hard. Your mistress doesn’t make you beg and continues her assault on your " + (x < 0 ? "back door." : "love tunnel."));
	if (pc.hasCock()) output(" [pc.EachCock] is unceasingly rigid from the constant violation of your " + (x < 0 ? "prostate." : (pc.hasVaginas() ? "pussies." : "pussy.")));
	output("\n\nDangling helpless in the air, fully bound and at whims of your mistress, all you can do is focus on her cock burrowing in and out of you. Each time she bottoms out against you, " + (x < 0 ? "she plunges deeper into your ass" : "her crown kisses your womb") + " and releases hot dollops of precum. <i>“You’ve been such an obedient fuck toy. I think you’ve earned a reward. Do you want it slut?”</i> ");
	output("\n\nYou nod fervently and cry out in your gag. You do your best to tense up the muscles in your lower region. Your [pc.pussyOrAss " + x + "] tightens around your mistress’ massive meat, milking her length. Your efforts elicit a grunt from Luca and hard thrust into your well stretched sluthole.");
	output("\n\n<i>“Such enthusiasm!”</i> Luca shouts. <i>“Here’s your reward!”</i>");
	output("\n\nShe pulls your hips towards her and pushes her cock into you. Her plump balls come to rest against your");
	if (pc.balls > 0)
	{
		output(" own scrotum");
		if (pc.hasVagina()) output(" and");
	}
	if (pc.hasVagina()) output(" clit");
	else if (pc.balls <= 0) output(" taint"); // no vag and internal balls get this -LF
	output(". Her member widens, stretching you further as a hot jet of semen blasts your " + (x < 0 ? "insides" : "womb") + ". Her cock ceaselessly unloads more and more of her seed into you. With a gagged scream of lust,");
	var cumQ:Number = (pc.hasCock() ? pc.cumQ() : 0);
	if (pc.isHerm()) output(" her orgasm sets off your [pc.cocks] and [pc.vaginas], unleashing a simultaneous burst of [pc.cum] and [pc.girlCum] all over the legs of you and your mistress, and the floor.");
	else if (pc.hasCock()) output(" her orgasm sets your [pc.cocks] off too, " + (cumQ < 250 ? "thin" : (cumQ < 1000 ? "thick" : "large")) + " ropes of your [pc.cum] " + (cumQ < 2000 ? "oozing" : "splattering") + " against the floor below.");
	else if (pc.hasVagina()) output(" her orgasm sets you off, your [pc.vaginas] " + (pc.isSquirter() ? "spurting" : "oozing") + " [pc.girlCum] uselessly against your mistress’s legs.");
	output("\n\n" + (cumQ < 250 && !pc.isSquirter() ? "Luca is still pumping more of her baby batter into you long after your orgasm is finished." : "You and Luca finish your lengthy orgasms around the same time.") + " Your [pc.belly] is stretched, looking a few months pregnant. Breathing heavily, Luca pulls out of your well used " + (x < 0 ? "pussy" : "ass") + ", her seed leaking from you like water from a faucet.");
	output("\n\nLuca walks around you");
	if (cumQ >= 2000 || pc.isSquirter()) output(" stepping in the mess you made");
	output(". She undoes the leather gag and caresses your face. <i>“You were perfect, [pc.name].”</i> She plants a soft kiss on your [pc.lipsChaste]. Her praise makes your chest well up with pride. <i>“Let’s get you cleaned up.”</i>");
	output("\n\nLuca moves around you and undoes the straps on your [pc.legOrLegs] first and lowers you to the");
	if (cumQ >= 2000) output(" [pc.cumVisc]");
	output(" ground. After that, she swiftly undoes the rest of bindings on your body. She checks your skin for bruises then pets your head. <i>“That was amazing,”</i> she tells you with a smile.");
	output("\n\nLuca snaps her fingers, and a drone brings you a sweet drink you’ve become all to familiar with. <i>“Drink up " + pc.mfn("handsome", "beautiful", "cute") + ".”</i> You down the drink and Luca leads you to her bathroom. She dotes on you, gently washing your body and massaging your muscles. After you’re both dry she takes you to a reclining chair in her room and pulls you onto her lap.");
	output("\n\nA drone places a blanket over you both while Luca uses a remote to bring up a selection of holos. <i>“What do you think? Comedy? Romance? Action? Adventure? Mystery? I can keep listing off genres.”</i>");
	output("\n\n<i>“I trust your judgement,”</i> you tell her, then bring your head to rest on her shoulder.");
	output("\n\nShe plants a kiss on your head then picks " + RandomInCollection("an adventure space fantasy epic about a champion defeating an evil demon", "a children’s holo about an alien in search of his son", "a comedy about a group of people stuck on a cruise ship with a murderer", "an action holo about a group of people stuck on a hostile alien planet looking for a tomb") + ". When the holo ends and you’re feeling refreshed and bid Luca farewell.");

	pc.orgasm();
	pc.shower();
	if (x < 0) pc.loadInAss(luca);
	else pc.loadInCunt(luca, x);
	
	IncrementFlag("LUCA_FUCKTOYD");
	IncrementFlag("LUCA_SEXED");
	
	// +3 Cum Addiction
	lucaddiction(3);
	// +3 Submission.
	lucaSubmission(3);
	
	addButton(0, "Next", leaveLotusEater);
}

public function lucaDepositingIntoTheNationalCumBankOfSteele():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(5);

	if (flags["LUCA_CUMDUMP"] == undefined) output("<i>“Mistress.”</i>\n\n<i>“Yes?”</i> Luca askes with a knowing smile and raised eyebrow.\n\n<i>“I want you to use me again Mistress. But this time... I want you to breed me, but not breed... um, how do I put it. Mistress, could I be your cum dump?”</i>");
	else output("<i>“Mistress I want you to use me again. Please let me be your cum dump again.”</i>");
	
	output("\n\nLuca’s face lights up, unable to contain her glee. <i>“Are you sure, [pc.name]?”</i> She asks with a stuttering, heavy breath. <i>“" + (flags["LUCA_CUMDUMP"] == undefined ? "I don’t know if I’ll be able to hold back. My refractory period is extremely short, and my loads are already pretty filling." : "Last time I could barely contain myself") + ".”</i>");
	output("\n\n<i>“I am, mistress. I just want to make you feel good.”</i>");
	output("\n\nLuca beams with excitement as she switches places with Sebastian, her cock throbbing in anticipation. You latch onto her left arm and receive a soft pet on your head. She then leads you to her room, slowly rubbing your head as you walk. Once the door hisses closed, you");
	if (!pc.isNude()) output(" strip away your [pc.gear] and");
	output(" kneel in the center of the room, watching her leisurely walk across the floor to her workstation and set mood.");
	output("\n\nSoon the lights dim, and about a dozen little robots start floating across the room. At the bottom of each one is a light flickering like a candle. A moment later, smooth jazz quitely fills the room. <i>“Come here, [pc.name].”</i>");
	output("\n\nYou obey and crawl across the floor to her. You see your mistress bite down on her lower lip and stifle a soft moan. Once you reach her, she crouches, grabs your chin and pulls your face towards her. <i>“You asked for this, and I plan on keeping your mouth occupied for most of the");
	if (hours < 6) output(" night");
	else if (hours < 12) output(" morning");
	else if (hours < 18) output(" day");
	else if (hours < 22) output(" evening");
	else output(" night");
	output(". This is your one chance to back out.”</i>");
	output("\n\nWith her free hand she presents you with a wide, stainless steel ring gag complete with a teeth guard.");

	addButton(0, lucaSafeWord, lucaIsLateAndTheCumBankIsClosed);
	addButton(1, "Open Wide", lucaProvesToHaveAWealthOfLiquidAssets);
}

public function lucaIsLateAndTheCumBankIsClosed():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(5);

	output("On second thought you don’t want to do this. <i>“[lucaSafeWord],”</i> you tell her.");
	output("\n\nShe looks visibly upset by your response. <i>“I understand, [pc.name],”</i> she sighs. <i>“Maybe next time.”</i> Luca helps you stand up and");
	if (!pc.isNude()) output(" after you get redressed");
	output(" leads you back to the Lotus Eater.");

	if (flags["LUCA_SAFEWORDED_CUMDUMP"] == undefined) lucaSubmission(-2);
	flags["LUCA_SAFEWORDED_CUMDUMP"] = 1;

	addButton(0, "Next", mainGameMenu);
}

public function lucaProvesToHaveAWealthOfLiquidAssets():void
{
	clearMenu();
	clearOutput();
	showLuca(true);
	author("RequiemForAMeme");
	processTime(235);

	output("You open your mouth wide as a sign to let her do as she pleases. Luca fits you with the ring gag then fastens it around your head. Your mouth is forced into a gape, and your mistress has you stand up to finish preparing you. She places a soft silk blindfold over your eyes and spins you around to tie it. Luca proceeds to feel up your body and explore your");
	if (pc.tone < 25) output(" pillowy");
	else if (pc.tone < 50) output(" soft");
	else if (pc.tone < 75) output(" well toned");
	else output(" rock solid");
	output(" form. Over the course of her invasive ravishment, she places " + num2Text(2+pc.legCount) + " smooth bands around your wrists and " + (pc.hasFeet() ? "ankles." : "[pc.legOrLegs]."));
	output("\n\nShe leads you over to her bed and has you sit while she grabs a few more things. Listening patiently to her moving around the room, you wonder what she’s gathering as she coos and hums in excitement. She returns after a few minutes and puts the head of a dildo through the ring. With a quick lick, you feel an open slit secreting some kind of liquid that tastes like peaches.");
	output("\n\n<i>“Suck this dry,”</i> Luca commands. ");
	output("\n\nYou tilt your head back to make draining the false dong as easy as possible. The cool liquid trickles down your throat. You feel your mistress sitting next to you, which compels you to dutifully fulfill her order. As you’re tonguing the head of the dildo, you feel it slide further into your mouth. It keeps going until it’s head is pushing against the entrance of your");
	if (canThroatLuca()) output(" pliant");
	output(" throat.");
	output("\n\nYour [pc.tongue] " + (pc.hasLongTongue() ? "wraps around the dildo" : "flattens against the bottom of the dildo") + " as it pushes into your gullet. The plastic schlong stretches your oral fuck tunnel as it goes deeper. The peach flavored liquid is spread throughout your throat as the dildo pulls out and pushes in. Soon the dildo is sliding in and out with slick wet sounds.");
	if (lucaFixation()) output("\n\nYou hum happily around the dildo. With each dive into your maw, pleasure radiates through you. The smooth and fast throat fucking you’re getting from the dildo is getting you close. Then it stops. You whine as the lovely toy is removed.");
	else output("\n\nAs the motions begin to feel pleasant the dildo stops. It is slowly removed with the last of the peach liquid being squeezed into your throat. You whine when it isn’t immediately replaced by the real thing.");
	output("\n\n<i>“Don’t worry slut. You won’t have to wait much longer,”</i> she tells you. <i>“<i>Zero gravity.</i>”</i>");
	output("\n\nYou feel a warm buzzing sensation spread through your body at her words. Luca scoops you up into her arms cooing joyfully at the act. <i>“I love holding " + (lucaSubmission() >= 100 ? "you" : "subs") + " like this.”</i> She cradles you in her arms and takes you across the room. Sitting in one of her reclining chairs, she begins binding your limbs. She starts by putting your hands behind your back then wrapping three soft straps around your forearms. After your arms are locked in place, she bends your " + (pc.hasKnees() ? "knees closed and binds them" : "[pc.legOrLegs] into position") + " as well.");
	output("\n\nYou hang weightlessly in the air just above your mistress. She pulls your face just close enough to her crotch for her cock to brush across your lips. She rubs the length of her dick rub across your face, teasing you. You whimper as you hang in the air. Your throat feels");
	if (!lucaFixation()) output(" almost");
	output(" painfully empty. You need Luca to violate it, to violate you however she sees fit. You need her to fill you with her thick creamy spunk until you look like a bloated, cum-stuffed whore. You whine and wordlessly beg for her to take you now.");
	output("\n\n<i>“You’re all mine,”</i> she murmurs below her breath.");
	output("\n\nLuca’s hands caress the back of your head and pull you down right onto her girthy futa cock. You’re dragged all the way to her base in one swift motion. Her dick fills your throat completely. She’s much thicker than the dildo and blessedly pauses to allow you adjust for a brief moment. " + (canThroatLuca() ? "You hum in delight at being so thoroughly filled, more excited than discomforted by the thick prong stretching your throat." : "You struggle not to gag and choke on her cock, forcing her to pull out so you can breathe."));
	output("\n\nShe ‘tsks’ with her tongue. <i>“I’ll go a bit slower. Remember to take proper breaths.”</i>");
	output("\n\nShe starts moving your head up and down, using your throat as her personal cock-sleeve. Long, slow motions are the order of the day. She pulls herself out until just her head remains in your mouth, letting you taste her precum, and then pushes you right back down. She’s clearly out to enjoy only herself, relishing in how your oral fuck-tunnel squeezes her dick when you’re pulled to her base then how your tongue laps at her crown when she pulls out.");
	output("\n\n" + (lucaFixation() ? "Your throat pulses with elation and tightens around Luca’s length" : "Your throat heats up") + " as the effects of her gene mods start to spread. Her schlong rubs all the right places in your prick-thirsty esophagus. Luca changes her pace as you moan around her meat. She bounces your face on the base of her cock, making tiny slow thrusts in and out of your throat-pussy. It becomes difficult to think as you experience a minor orgasm.");
	output("\n\n<i>“I think you’re ready for my first load.”</i>");

	output("\n\nLuca speeds up vigorously face fucking you. She saws in and out with her veiny meat, intent on gratifying herself as her climax approaches. Her cock bulges, widening your throat as her seed starts pumping into you. You experience your first true orgasm of the");
	if (hours < 6) output(" night");
	else if (hours < 12) output(" morning");
	else if (hours < 18) output(" day");
	else if (hours < 22) output(" evening");
	else output(" night");
	if (pc.hasGenitals())
	{
		var cumQ:Number = (pc.hasCock() ? pc.cumQ() : 0);
		output(", your body spasming in ecstasy,");
		if (pc.isHerm())
		{
			output(" [pc.cocks] and [pc.vaginas] cumming at the same time, your [pc.cum]");
			if (cumQ < 250) output(" dripping down to");
			else if (cumQ < 1000) output(" spraying");
			else if (cumQ < 5000) output(" splattering against");
			else output(" erupting towards");
			output(" the floor below and [pc.girlCum] " + (pc.isSquirter() ? "gushing" : "oozing") + " against your [pc.legOrLegs]");
		}
		else if (pc.hasCock())
		{
			output(" [pc.eachCock] sending your [pc.cum]");
			if (cumQ < 250) output(" dripping down to");
			else if (cumQ < 1000) output(" spraying");
			else if (cumQ < 5000) output(" splattering against");
			else output(" erupting towards");
			output(" the floor below");
		}
		else if (pc.hasVagina()) output(" [pc.eachPussy] " + (pc.isSquirter() ? "gushing" : "oozing") + " [pc.girlCum] against your [pc.legOrLegs].");
	}
	output(". She holds you in place to allow your gullet to finish milking her.");

	output("\n\nLuca pulls herself out of your creampied cock-socket. Your body is still shivering from the oral orgasm. She lifts you into the air and flips you around. Blood rushes to your head as she drags you to somewhere else in the room. When you stop, your throat is impaled right back onto Luca’s cock. This time, she uses your arms as handles while she thrusts her hips into your [pc.lips].");
	output("\n\nShe thoroughly violates your mouth and throat. You feel her previous load being used as lube for her heavenly length. The dickgirl gives you little time to breath in between her thrusts, but she knows when to slow down. You hum happily from the oral abuse you’re receiving, glad the vibrations make your maw more pleasurable for your mistress.");
	output("\n\nYour body turns once more, and you find yourself lying chest up in the air as Luca unceasingly face fucks you. She wraps her hands around your neck and keeps your head tilted back to use you like a living onahole.");
	if (lucaFixation()) output(" With the way she’s treating your throat, you want her to use you like this every day.");
	output(" She speeds up with long hard thrusts in and out of your well used gullet, her large balls slapping against the blindfold.");
	output("\n\n<i>“Oooh... Fuck you are perfect,”</i> she whispers huskily. <i>“So good. So good. So fucking good.”</i>");
	output("\n\nYou feel your eyes roll as Luca continues to violate your wholly stretched maw. When you feel her seed surge up through her cock, she doesn’t stop moving. She continues to thrust and fuck your throat the entire time her cream is pumping into you. Fireworks go off in your mind as you climax with her again.");
	output("\n\nWhen she’s finished, Luca removes her magenta rod and lowers you to the ground. She tilts your head down, her cum oozing from the ring gag holding your mouth open. You try to whine in protest, but it comes out as coughs and gurgles. You hear it splash as it hits the floor. Your throat still burns with desire even though you’ve climaxed twice now. Moaning shamelessly, you turn your face to your mistress, hoping she’ll recognize your need.");
	output("\n\n" + (flags["LUCA_CUMDUMP"] == undefined ? "<i>“That liquid I had you drain from the dildo did more than lube your throat. It’s from the same product line I used on my cock. I know you wanted to play the part of breeding bitch, but this is so much more fun.”</i>" : "<i>“Remember, slut, that you asked for this.”</i>") + " Luca pulls your head up and pets your cheeks. <i>“Until I’m satisfied, you’re going to be my very own submissive little cum-dump. So you don’t need to think about anything other than how good my dick feels in your throat.”</i>");
	output("\n\nYour mistress keeps her word and uses you as her personal cock sleeve. She uses you as her cum dump no less than seven more times. Each time, your oral orgasm is stronger and stronger. By the fourth time you don’t even care anymore about getting off with your " + pc.cockAndVagina((pc.hasCocks() ? "cocks" : "cock"), (pc.hasVaginas() ? "pussies" : "pussy"), " and ") + ". Near the end, her seed overflows from the ring gag down your face and chin. When Luca is finally done, she tells you it’s ok for you to rest. Still riding the ecstasy of your last orgasm you let yourself pass out.");

	//// [pc.orallyFilled], by like a lot.
	pc.loadInMouth(luca);
	pc.loadInMouth(luca);
	pc.loadInMouth(luca);
	pc.loadInMouth(luca);
	pc.loadInMouth(luca);
	pc.loadInMouth(luca);
	pc.loadInMouth(luca);
	pc.loadInMouth(luca);
	pc.applyCumSoaked();
	pc.orgasm();

	addButton(0, "Next", lucasDepositIsProcessedIntoSteelesWarmAndWetSlutvault)
}

public function lucasDepositIsProcessedIntoSteelesWarmAndWetSlutvault():void
{
	clearMenu();
	clearOutput();
	showName("\nHOLO-LUCA");
	author("RequiemForAMeme");
	processTime(240);
	
	if (flags["LUCA_CUMDUMP"] == undefined)
	{
		output("When you awaken, you find yourself lying on Luca’s bed, free from your bindings with your throat feeling oddly cold. One of Luca’s helper drones is silently hovering above you. Sensing your wakeful state, the drone plays a holo-recording of Luca.");
		output("\n\n<i>“Hi, [pc.name]. I’m super sorry for not being here- there- no here is right. Right? Whatever. I was gone for way too long, and had to go back to work, so I left one of my little ones with you. I told it to provide you with any food, drink and entertainment you want. I also gave you some salves for any pain you might feel. If you’re in any pain or feel bloated come find me immediately. Anyway, we’ll talk later.”</i>");
		output("\n\nYou take your time getting ready to leave. After all, Luca provided you with a helper drone all to yourself. You ask it for some");
		if (hours < 6) output(" food");
		else if (hours < 12) output(" breakfast");
		else if (hours < 18) output(" lunch");
		else if (hours < 22) output(" dinner");
		else output(" food");
		output(" and queue up a short holo from Luca’s extensive library. When the holo ends you finish eating, gear up and leave. You make sure to briefly talk to Luca on your way out.");
	}
	else if (lucaSubmission() < 100)
	{
		output("When you awaken you find yourself lying on Luca’s bed, free from your bindings and your throat feeling oddly cold. One of Luca’s helper drones is silently hovering above you. Sensing your wakeful state, the drone plays a holo-recording of Luca.");
		output("\n\n<i>“Hi [pc.name]. I’m sorry I couldn’t be there when you woke up. I had to return to work, so I left one of my little ones with you. As usual it will provide you with any food, drink and entertainment you want. I also gave you some salves for any pain you might feel. If you’re in any pain or feel bloated come find me immediately. We’ll talk later.”</i>");
		output("\n\nYou take your time getting ready to leave. After all, Luca provided you with a helper drone all to yourself. You ask it for some");
		if (hours < 6) output(" food");
		else if (hours < 12) output(" breakfast");
		else if (hours < 18) output(" lunch");
		else if (hours < 22) output(" dinner");
		else output(" food");
		output(" and queue up a short holo from Luca’s extensive library. When the holo ends, you finish eating, gear up and leave. You make sure to briefly talk to Luca on your way out.");
	}
	else
	{
		showLuca();

		output("You awaken groggily with a cold chill in your throat. You’re lying with your head on Luca’s left shoulder and her arm holding you against her. Her right hand light strokes your " + (pc.hasHair() ? "[pc.hair]" : "head") + ". Both of you are on her bed covered by a set of fuzzy blankets. Soft slow piano music fills the room.");
		output("\n\nYour eyes adjust to the dim lighting and you see her smiling down at you. <i>“Hello there sleepy,”</i> she says. <i>“Are you feeling alright? Do you need me to get you anything?”</i>");
		output("\n\nYou shake your head and nuzzle your head into her shoulder. <i>“Hold me like this, mistress.”</i> You place your left arm and leg over her body. <i>“At least for a few more minutes.”</i>");
		output("\n\nShe embraces you with her right arm and holds you tight. <i>“Anything for you.”</i>");
		output("\n\nLuca snuggles with you for nearly twenty minutes before you let go. She gives you kiss before returning to work. Feeling fully relaxed and refreshed, you stretch, grab your gear, and head out back to the Lotus Eater.");
	}

	// +5 Cum Addiction, +3 Oral Fixation, 
	lucaXP(3);
	lucaddiction(5);
	// First time: +10 Submission. Else: +5 Submission.
	lucaSubmission((flags["LUCA_CUMDUMP"] == undefined ? 10 : 5));
	IncrementFlag("LUCA_CUMDUMP");
	// Give pc the "Sore" status
	soreChange(4);

	addButton(0, "Next", mainGameMenu);
}

public function lucaIsVeryTastyAndIDontWannaHideIt():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(20);
	
	// Tess/Rand Woman/Rand Man
	var customer:int;
	if (rand(5) == 0) customer = 0;
	else if (rand(2) == 0) customer = 1;
	else customer = 2;

	output("You stare at Luca thinking of how wonderful she’s been to you. How great a dom she is, always willing to go out of her way to fulfill your submissive desires. A dutiful feeling washes over your body. A need rushes through you, a need to please your mistress, this captivating and gorgeous woman standing before you.");
	if (pc.isBimbo() || lucaFixation()) output(" Seeing how delectable her cock looks in the warm lighting and imagining the taste of her thick creamy cum is all the more encouragement you need.");
	output("\n\n<i>“Mistress.”</i>");
	output("\n\n<i>“Yes [pc.name]?”</i> Luca asks with a lascivious smile. <i>“Is there </i>anything<i> I can do for you?”</i>");
	output("\n\nYou dryly swallow as Luca knowingly brushes a couple fingers along the length of her dark magenta rod. Your [pc.eyes] gaze transfixed as her cock swells and throbs with each brush, slowly growing erect. You chew on your lip and quiver as your mistress teases you.");
	output("\n\n<i>“Mistress I-”</i>");
	output("\n\nShe raises a finger to your lips. She orders, <i>“Come here.”</i> She takes your hands and leads you around the counter where she pulls you into a hug. You feel her erect shaft press into your [pc.belly]. <i>“Now tell me everything that my " + pc.mfn("handsome", "beautiful", "cute") + " sub wants me to do to them.”</i>");
	output("\n\n<i>“I want to please you mistress. Please allow me to get on " + (pc.hasKnees() ? "my knees" : "the ground") + " and relieve you.");
	if (lucaSubmission() >= 100) output(" I love making you feel good.");
	output("”</i>");
	output("\n\nLuca releases you and pets your head. She brings her hand down and around your head until she’s caressing your cheek. She looks into your eyes and says with a smile, <i>“Very well [pc.name], but you’re not leaving until I’m satisfied.”</i>");
	output("\n\n<i>“I wouldn’t have it any other way, mistress,”</i> you chirp back happily.");
	output("\n\nShe pulls you in for a quick kiss. <i>“Now get under my counter like the dutiful slut you are.”</i>");
	if (flags["LUCA_PUBLIC_ORAL"] == undefined) output("\n\nWith Luca’s help, you get " + (pc.hasKnees() ? "on your knees" : "down") + " and position yourself under her work counter. There’s a surprising amount of space beneath the thing; around you is electronic hardware and assorted refreshments and supplies. Confusingly, the floor directly beneath you is comfortably padded, and when you look up you see a steel bar with built-in cuff restraints. Luca continues to position you beneath her, placing your hands into the cuffs and locking you in place. Once you’re situated, the light dims as Luca scoots her chair forward.");
	else output("\n\nWith Luca’s help you get " + (pc.hasKnees() ? "on your knees" : "down") + " and position yourself under her work counter. You take your place on the floor and are thankful for your mistress providing comfortable padding. You put your hands into the cuffs and wait for Luca to lock them in place. Once you’re situated, the light dims as Luca scoots her chair forward.");
	output("\n\nStuck under her counter and inbetween her legs, your eyes focus on the erect, magenta rod before you. You lean forward and softly kiss at her precum-beading head with your [pc.lips]. You breathe deep, taking in the heavy aroma of her dick, and proceed to suckle and lap at her crown. A hand comes to rest on your head and begins petting " + (pc.hasEmoteEars() ? "right between your [pc.ears]." : "your [pc.hair]."));
	output("\n\n<i>“Keep going, slut.”</i> ");
	output("\n\nYou close your eyes and lean forward, slowly taking her into your salivating mouth. You make sure to take your time. This is about pleasing your mistress after all. You spread your lips gradually over her cock, taking just the head for now. You put your [pc.tongue] to work lavishing her crown and soon your efforts are rewarded with a husky purr from your mistress. ");
	output("\n\n<i>“Your mouth is just- hnng. So lovely.”</i> She encourages you downward with her hand, and you happily oblige. You lean forward until her cock pushes against the entrance of your throat while your tongue " + (pc.hasLongTongue() ? "wraps around her length and pumps back and forth" : "strokes along her length") + ". <i>“I might have to keep you up front with me more often.”</i> With a forceful push, she shoves your head into her crotch and plows your throat with her hot shaft.");
	output("\n\nA few minutes of deep, long, and passionate throat-fucking pass by as you please your mistress.");
	if (lucaFixation()) output(" You love every minute of it as her dick pushes you into a panting, sweaty mess. From the way her pre tastes and dribbles into your mouth to the way her cock fills your maw, you love every moment of it.");
	output(" Then your body heats up with ecstasy as her gene mods take effect. You experience a minor oral orgasm while simultaneously staining " + (pc.isCrotchGarbed() ? "your [pc.crotchCoverUnder]" : "the floor") + " with your" + pc.cockAndVagina(" [pc.cum]", " [pc.girlCum]") + ". You relish in your bliss as an even bigger orgasm approaches, but you wait a bit too long. <i>“Did I say stop?”</i> your mistress asks before shoving your head down until your lips are kissing the base of her dick. <i>“Much better. I think that-”</i>");
	output("\n\n<i>“Excuse me Luca?”</i>");
	output("\n\nYour mistress pulls you off her dick and stands to greet the " + (customer < 2 ? "female" : "male") + " voice from above. <i>“How can I help you, " + ["Tess", "Miss", "Sir"][customer] + "?”</i> Her cock is still beneath the counter, tantalizingly close yet just out of reach. You were so close to orgasm! Leaning forward, you strain against the cuffs holding you in place. Your lips land true, and you pull her head into your mouth and suck. Thankfully, your mistress seems to appreciate your enthusiasm and steps forward, allowing you to suck her dick deep into your wanton maw.");
	output("\n\n<i>“I was wondering if you could set me up with " + (customer == 0 ? "my usual" : "some VR gear") + "?”</i> ");
	output("\n\n<i>“Of course.”</i> Your mistress pulls out and steps away this time. <i>“Follow me, " + ["Tess", "Miss", "Sir"][customer] + " and I’ll set you up. ...Is something wrong?”</i> Luca asks as she walks away.");
	output("\n\n<i>“Um... Nothing,”</i> " + (customer == 0 ? "Tess replies. <i>“I just, well I’m just jealous of your subs that can fit under the counter.”</i>" : "the patron replies. <i>“Ahem. If you’re busy then it can wait.”</i>"));
	output("\n\n<i>“" + (customer == 0 ? "Aww Tess, I know just how to make you feel better..." : "Nonsense, I would never let such a lovely patron...") + "”</i> The conversation fades as the two of them step away. Meanwhile you’re left hot and panting, your tongue lolling out of your mouth. Your orgasm is still so close. Your " + pc.cockAndVagina("[pc.cocks]", "[pc.vaginas]", " and ") + (pc.isHerm() || pc.hasCocks() || pc.hasVaginas() ? " are" : " is") + " burning with need.");
	
	pc.changeLust(pc.lustMax());

	addButton(0, "Next", lucaComesRightInYourMouthInPlainViewOfEveryone);
}

public function lucaComesRightInYourMouthInPlainViewOfEveryone():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(10);

	output("Your brief delirium abruptly ends when your mistress returns and slams her dick into your waiting and pliant gullet. <i>“Oh fuck yesss,”</i> she moans as she takes charge. Her precum grows thicker as she relentlessly fucks your throat. <i>“You know you make some of my patrons jealous right?”</i> She uses your " + (pc.hasHorns() ? "[pc.horns]" : (pc.hasHair() ? "[pc.hair]" : "head")) + " to pull you up her dick and then back down, again and again.");
	output("\n\n<i>“It’s because you’re my special sub, [pc.name].”</i> She begins alternating between letting her length rest deep in you and pulling out to let your tongue work. <i>“Everyone knows I’m a great fuck as long as they play by the rules. But you, you’re-”</i>");
	output("\n\nYou suckle and kiss at her head, letting your tongue lavish her slit and the underside of her cock.");
	output("\n\n<i>“Oh, oh, oh fuck. Keep that up.”</i>");
	output("\n\nLuca pulls you closer and returns to stroking your [pc.hair]. She whispers down to you, <i>“You are my one and only [pc.name] Steele.”</i> Slowly she starts to twist her hips back and forth. <i>“You’re so good. So great at this. At everything we do.”</i> You wiggle your tongue and bend your neck to take her length to the base on your own accord. <i>“I just- I just-”</i> she muffles a cry of pleasure.");
	output("\n\nHer cock engorges as her cum rushes up her dick and down into your [pc.belly]. <i>“I just love throat-fucking you, [pc.name]!”</i> She holds you in place as she orgasms. <i>“Oh fuck I love the way it feels.");
	if (pc.isBimbo() || lucaFixation()) output(" I can’t stop myself when I’m around you, the way you milk my cock with your mouth...");
	output("”</i> Her voice trails off into a wordless moan as she continues to climax. Your [pc.belly] swells with her seed. Her orgasm sets off" + pc.cockAndVagina(" [pc.eachCock]", " [pc.eachPussy]") + ", discharging a burst of" + pc.cockAndVagina(" [pc.cum]", " [pc.girlCum]"));
	if (pc.isHerm()) output(" at the same time");
	if (!pc.isCrotchGarbed()) output(" all over your legs and the floor.");
	else
	{
		output(" sullying your [pc.crotchCovers].");
		if (pc.hasCock()) pc.applyCumSoaked();
		if (pc.hasVagina()) pc.applyPussyDrenched();
	}
	output("\n\nLuca pants breathlessly and releases you, allowing you to slump back. Her dick is covered in a glossy sheen of her seed and your drool. " + (pc.isBimbo() || lucaFixation() ? "You wouldn’t forgive yourself if you let all that delicious cum go to waste." : "You have a duty to clean your mistress.") + " You breathe deep and hiccup while attending her cock, refusing to stop until it shines with your spit.");
	output("\n\nShe undoes your restraints and helps you out from beneath her counter. <i>“Thanks [pc.name]. I needed that.”</i> She kisses you on the cheek and send you on your way.");

	pc.orgasm();
	// [pc.orallyFilled]
	pc.loadInMouth(luca);
	// +2 Cum Addiction, +3 Oral Fixation 
	lucaXP(3);
	lucaddiction(2);
	// +3 Submission.
	lucaSubmission(3);

	IncrementFlag("LUCA_PUBLIC_ORAL");

	addButton(0, "Next", leaveLotusEater);
}

public function lucaIsTurnedOnBySwitches():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(2);

	if (flags["LUCA_SWITCHED"] == 0)
	{
		output("<i>“Luca.”</i>");
		output("\n\n<i>“Yes?”</i> she asks a little hesitant with a cocked eyebrow.");
		output("\n\n<i>“I want to try switching roles with you.”</i>");
		output("\n\nLuca’s face twists a bit in discomfort");
	}
	else
	{
		output("\n\n<i>“Luca. I’d like to switch roles again.”</i>");
		output("\n\nA lustful grin shows on her face");
	}
	output(". <i>“Are you sure, [pc.name]?”</i> she asks with a stuttered breath.");
	output("\n\n<i>“I’m sure.”</i>");
	output("\n\nLuca gives you a " + (flags["LUCA_SWITCHED"] == 0 ? "timid" : "shameless") + " smile and quickly switches places with Sebastian. She grabs your [pc.hand] and leads you to her room. As soon as the door hisses closed, Luca asks you take a seat on her bed while she sets the mood. <i>“Do you need me to grab you anything? Anything you want to use on me?”</i>");
	output("\n\n<i>“A ball gag, and maybe some leather straps. Those will do just fine.”</i>");
	output("\n\nShe nods in acknowledgement. <i>“What kind of music would you like");
	if (flags["LUCA_SWITCHED"] > 0) output(" this time");
	output("?”</i>");

	addButton(0, "Classical", lucaGetsFuckedToASoundtrack, "classical");
	addButton(1, "Electronic", lucaGetsFuckedToASoundtrack, "electronic");
	addButton(2, "Jazz", lucaGetsFuckedToASoundtrack, "jazz");
	addButton(3, "Opera", lucaGetsFuckedToASoundtrack, "opera");
}

public function lucaGetsFuckedToASoundtrack(music:String):void
{
	clearMenu();
	clearOutput();
	showLuca(true);
	author("RequiemForAMeme");
	processTime(3);

	output("<i>“" + StringUtil.capitalize(music) + ", please.”</i>");
	output("\n\nSoon the lights dim, and the room fills with her drones and soft " + music + " music. Luca approaches you with a box of sex toys. She hands the bin to you and steps back, waiting for your command. You filter through the box finding some good straps, a few leashes, a red ball gag, and even a large knotted vibrating dildo covered in bumps.");
	output("\n\nYou toss her the ball gag. <i>“Put this in and strip,”</i> you order.");
	output("\n\nLuca spins around, showing you the back of her starry dress. She reaches back with one arm, pulling her braid away and the other");
	if (flags["LUCA_SWITCHED"] == 0) output(" hesitantly");
	output(" pulling down a small zipper. Once it’s all the way down, she slips out of the dress, letting it fall to the floor. She then removes her crescent earrings and places them on her nightstand. Still facing away, Luca bites down on the ball gag, then fastens it tightly.");
	output("\n\nShe spins in place a few times, allowing you to bask in her naked form. How do you plan on using the submissive Dzaan before you?");

	var noButton:Boolean = true;

	if (!pc.hasCock()) addDisabledButton(0, "Fuck Her Pussy", "Fuck Her Pussy", "You need a dick.");
	else if (pc.cockThatFits(luca.vaginalCapacity()) < 0) addDisabledButton(0, "Fuck Her Pussy", "Fuck Her Pussy", "You don’t fit.");
	else
	{
		noButton = false;
		addButton(0, "Fuck Her Pussy", penisRouter, [lucaTriesBeingACocksleeveForAChange, luca.vaginalCapacity(), false], "Fuck Her Pussy", "Bend her over and use your dick to fuck her pussy.");
	}
	if (!pc.hasVagina()) addDisabledButton(1, "Ride Her Dick", "Ride Her Dick", "You need a vagina.");
	else if (luca.cockThatFits(pc.biggestVaginalCapacity()*1.25) < 0) addDisabledButton(1, "Ride Her Dick", "Ride Her Dick", "She’s too big for you.");
	else
	{
		noButton = false;
		addButton(1, "Ride Her Dick", vaginaRouter, [lucaLetsYouHaveACuntfulOfHerDick, luca.biggestCockVolume(), 0, 0, false], "Ride Her Dick", "Get her on her back and use your pussy and ride her dick.");
	}
	
	if (noButton)
	{
		output("\n\n<b>Error:</b> No suitable genitals found. Please report.");
		addButton(14, "Oh no!", mainGameMenu);
	}
}

public function lucaTriesBeingACocksleeveForAChange(x:int):void
{
	clearMenu();
	clearOutput();
	showLuca(true);
	author("RequiemForAMeme");
	processTime(45);

	output("Luca gazes at you with " + (flags["LUCA_SWITCHED"] == 0 ? "uncertain" : "hungry") + " eyes, and you notice a slight tremble in her stance. " + (flags["LUCA_SWITCHED"] == 0 ? "Despite her nervousness, you" : "You") + " see her cock swell eagerly, and a telltale stream of wetness dribbles down her legs.");
	output("\n\n<i>“Let’s get you on the bed now. On all fours.”</i>");
	output("\n\nYour soon-to-be cocksleeve nods and climbs atop her bed. You follow her");
	if (pc.hasKnees()) output(" on your knees");
	output(", kneading her well rounded ass as she moves. You watch with delight as she squirms in your hands, her cock becoming rigid and her pussy drenching itself in anticipation. She moans to your touch as you continue to tease the areas around her wanton sex.");	
	if (flags["LUCA_SWITCHED"] == 0) output(" An idea strikes you when you see her ass gape oh-so-slightly.");
	output("\n\nYou release Luca and reach out for the box of supplies she provided. <i>“Hands behind your back,”</i> you command. She does as you say and grunts, falling forward into her pillows and pushing her ass into the air. With her hands just above the dimples of her butt, you take a leather strap and bind her wrists together - not too tight, just enough to keep them in place.");
	output("\n\nWith her hands now bound, you return to teasing your horny Dzaan. This time you give her a bit more and let your digits play with the entrance of her pussy. She moans through her gag and tries to thrust back against your fingers. You slap her ass and reach back into the box. <i>“Tsk. Tsk. You will wait, slut,”</i> you bark.");
	output("\n\nYou remove the nubby dildo and bring it’s length against the lips of her sopping wet snatch. Letting her womanly sex lubricate the fake dong, you return to groping her behind. Once it’s completely dripping with Luca’s natural lube, you press the head of the dildo against the ring of her ass. She lets out a muffled yelp, but it turns into a long, drawn-out moan as the dildo slides into her.");
	output("\n\n<i>“" + (flags["LUCA_SWITCHED"] == 0 ? "That felt a lot easier than I expected," : "Still masturbating with your ass I see,") + "”</i> you say, flicking the on switch and bringing the dildo to life. Luca screams through her gag as she cums, her seed shooting down onto her bed and her pussy dousing you and her legs. You slap her ass");
	if (pc.isCrotchGarbed()) output(" and begin removing your [pc.lowerGarment]");
	output(". <i>“I didn’t say cum. Did I? Sluts who cum before their [pc.master] need to be punished.”</i>");
	output("\n\nYou kneel behind Luca, pressing your [pc.hips] against her voluptuous thighs. <i>“But luckily for you, I’m in the mood.”</i> You align [pc.oneCock] with the folds of her sex and repeat the process you performed with the vibrating dong currently massaging her backdoor. She continues to squirm in your grasp as your shaft rubs her against clit and along the entrance of her pussy. Her cock remains rigid, cum oozing from the tip while you use her femcum to lube your prick.");
	output("\n\n<i>“Does my horny slut want me to fuck her silly?”</i> you ask.");
	output("\n\nShe shudders at the question and wiggles her hips in an attempt to entice you. You take hold of your meat and align it with her sex. Holding yourself back, you savor the feeling of your cockhead pushing against her hot wet entrance. Unable to bear it, Luca lets out a cry of wanton need which spurs you forward. You push into her, spreading her lower lips with your [pc.cock " + x + "].");
	pc.cockChange();
	output("\n\nLuca’s adoringly clutching tunnel envelopes you when you slide into her. The exquisite slickness of her muff eases your passage as your prick pushes in until");
	if (pc.cLength(x) >= 12) output(" your crown presses against her womb and");
	output(" you bottom out. You hold [pc.cock " + x + "] in place, savoring the feeling of her hot folds squeezing down around you. When the aphrodisiac takes affect and carnal heat burns through your length, you groan happily. The vibration coming from the dildo in her ass makes the sensation all the better.");
	output("\n\nA soft whimper and a wiggle of her hips pulls you out of your momentary bliss, reminding you of the needy Dzaan before you. <i>“Good slut,”</i> you say with a low voice. You pull out of her and hum with pleasure when her hungry quim clamps down around [pc.cock " + x + "], amplifying the vibrations coming from above. You decide to give your shameless slut exactly what she wants and thrust back into her. Luca’s unleashes gagging squeals of delight as you stuff her full of cock.");
	output("\n\nYou repeat the motion, pulling out of her snatch and pushing in again. Each time you make sure you thrust a bit faster than before. Within a few minutes of pounding Luca’s pussy, you’re basking in her depraved cries of pleasure, and the sensations of your pulsing dong savoring lubricious folds. The utter intensity of your vigorous fucking brings your slut to orgasm.");
	var cumQ:Number = pc.cumQ();
	output("\n\nHer cum erupts from her cock once while her cunt spasms around your own. The sudden tightness combined with the vibrations just above your length push you to join her in climax. You pull back and thrust into your bound slut one last time as her girlcum gushes outward. Your [pc.cock " + x + "] swells and convulses, [pc.cum] " + (cumQ < 5000 ? "emptying" : "flooding") + " into her drenched pussy" + (pc.isHerm() ? " while [pc.eachPussy] climaxes uselessly with your male orgasm." : ".") + (cumQ < 5000 ? " You groan loudly while Luca whimpers beneath you as your load fills her womb." : " You groan loudly while Luca whimpers beneath you as your colossal load fills her womb, making her belly expand. You pump as much [pc.cum] into her as she can take and then some. Excess flows out of her cunt until she looks several months pregnant."));
	output("\n\nWith a satisfied sigh, you pull your cum-covered cock out of your lover and lean forward to undo the straps on her wrists. She shivers and twitches beneath you, recoiling from her orgasm while the dildo continues to vibrate within her ass. You switch the bumpy dong off and then remove it. Laying Luca on her side, you unfasten the gag. When the ball comes out you hear her take a long breath.");

	pc.orgasm();

	addButton(0, "Next", lucaIsDoneBeingFucked);
}

public function lucaLetsYouHaveACuntfulOfHerDick(x:int):void
{
	clearMenu();
	clearOutput();
	showLuca(true);
	author("RequiemForAMeme");
	processTime(45);

	output("Luca gazes at you with " + (flags["LUCA_SWITCHED"] == 0 ? "uncertain" : "hungry") + " eyes and you notice a slight tremble in her stance. " + (flags["LUCA_SWITCHED"] == 0 ? "Despite her nervousness, you" : "You") + " see her cock swell eagerly and telltale wetness trickle down her legs.");
	output("\n\n<i>“Let’s get you on the bed now. On all fours.”</i>");
	output("\n\nYour soon-to-be cocktoy nods and climbs atop her bed. Following after her");
	if (pc.hasKnees()) output(" on your knees");
	output(", you knead her well rounded ass as she moves, watching with delight as she squirms in your hands, her cock firming and her pussy oozing in anticipation. She moans at your touch as you continue to tease the areas around her wanton sex.");
	if (flags["LUCA_SWITCHED"] == 0) output(" An idea strikes you when you see her ass gape oh-so-slightly.");
	output("\n\nYou release Luca and reach out for the box of supplies she provided. <i>“Lie down on your back and put your hands above your head,”</i> you command. She does as you say, turning to face you then lowering herself until she’s flat. With her hands against the headboard, you take a leather strap and bind her wrists together - not to tight, just enough to keep them in place. Then you take a second strap and tie the binding to the headboard.");
	output("\n\nWith her hands now bound, you return to teasing your horny Dzaan. This time you give her a bit more and grasp and rub her bulging penis. She moans through her gag and tries to thrust into your hands. You slap her thigh and reach back into the box. <i>“Tsk. Tsk. You will wait, slut,”</i> you bark.");
	output("\n\nYou grab one of the leashes, one where the the more you pull, the tighter it becomes. You make a show of examining the leash as you position yourself above your immobile lover. Once her eyes are completely fixed on your hands, you lean down and fasten the leash around her neck. Luca takes a deep breath through her nostrils and shudders beneath you.");
	output("\n\nWith the end of the leash around your wrist, you reach back to the box and remove the nubby dildo. You then bring it’s length against the lips of her sopping wet snatch, letting her womanly sex lubricate the fake dong while you return to jerking her off. Once it’s completely soaked with Luca’s natural lube, you press the head of the dildo against the ring of her ass. She lets out a muffled yelp, but it turns into a long, drawn-out moan as the dildo slides into her.");
	output("\n\n<i>“" + (flags["LUCA_SWITCHED"] == 0 ? "That felt a lot easier than I expected," : "Still masturbating with your ass I see,") + "”</i> you say, flicking the on switch and bringing the dildo to life. Luca screams through her gag as she cums, her seed shooting up onto her chest and her pussy dousing her legs and bed. You slap her thigh once again");
	if (pc.isCrotchGarbed()) output(" and begin removing your [pc.crotchCovers]");
	output(". <i>“I didn’t say cum, did I? Sluts who cum before their [pc.master] need to be punished.”</i>");
	output("\n\nYou kneel above your subby Dzaan, positioning [pc.onePussy] atop the length of her rigid shaft. <i>“But luckily for you, I’m in the mood.”</i> You drag the entrance of your sex along her firm manhood, delighting in how wet it makes you. You indulge yourself in teasing her while lubricating her cock. Each time her head brushes against your netherlips, you lift up and bring yourself back down. She squirms beneath you as the vibrating dildo ravages her backdoor. Whenever she thrusts without your permission, you pull the leash taut and slap her thigh.");
	output("\n\nAfter your womanhood is sopping wet and throbbing with need, you stop the teasing. You lean forward, pressing your [pc.chest] against Luca’s firm melons. You stare into her eyes and say, <i>“Do you want me to fuck you, slut?”</i>");
	output("\n\nLuca nods slowly, her breathing heavy and ragged. You smile perversely and position yourself above her bulbous crown. You let her head slip just a bit into [pc.pussy " + x + "]. Knowing what happens when she thrusts, Luca trembles beneath you but is unable to remain still due to the pernicious vibrations pounding into her ass from the bumpy dildo. She cries through her gag, emerald eyes looking at you begging for release.");
	output("\n\n<i>“Good slut,”</i> you say petting her head.");
	output("\n\nYou wiggle your [pc.hips] just a bit and relax, sinking down slowly onto her fiercely erect cock. You relish in the sensation of her girth spreading your lubricious inner walls and completely filling [pc.pussy " + x + "]. She moans shamelessly beneath you as your hips twist and rotate to angle her throbbing prick every which way inside you. Despite how massive it feels in your " + (pc.isHoleTight(x) ? "tight" : "spacious") + " quim, you take her length until your netherlips touch her base.");
	pc.holeChange(x, luca.biggestCockVolume());
	output("\n\nThe sensations intensify as her cock kisses the entrance to your womb. Pulsating within you, Luca’s cock throbs with virbator-like intensity. You");
	// I SWEAR TO GOD EVERY TIME A SCENE LOOKS NICE AND SIMPLE
	if (pc.race() == pc.bovineRace()) output(" moo");
	if (pc.catDog("a","b",false) == "b") output(" howl");
	else output(pc.catDog(" purr", " hum"));
	output(" in delight as you begin to rock your hips. An abrupt thrust earns her a yank on the leash and another slap on her thigh. Her emerald eyes gaze up at you meekly as you resume screwing yourself on her cock, using her as your personal fuck toy. While riding her rigid mast, a carnal heat spreads through your loins, driving you to move faster and faster.");
	output("\n\nAs the minutes pass by, the dzaan’s passionate moans turn to disoriented mumbles and gasps. She has fully succumbed to her helpless position beneath you, accepting that you will have your way with her. You revel in the moment, delighting in how any change in the rhythm you make elicits a soft whimper from the deliriously horny Dzaan. Lost in your revelry, you nearly climax, but stop and lift yourself off her rigid length. Your [pc.pussy " + x + "] clenches around nothing, an aching empty feeling quickly spreading through you as you grit your teeth and take several deep breaths.");
	output("\n\nBefore the feeling fully fades, you once again position yourself above her girthy member. You look down at Luca and say, <i>“Feel free to thrust now, but don’t cum until I say so. Understood?”</i>");
	output("\n\nShe nods, needy arousal showing on her face. You lower your [pc.hips] and with one motion, sheath her cock in your completely-drenched cunt. She thrusts up from beneath you, forcing her throbbing meat deep into [pc.pussy " + x + "]. You return her passion by vigorously bouncing your [pc.ass].");
	output("\n\nThe sense of a massive, crest of pleasure announces the arrival of your budding orgasm. You ride Luca’s cock, howling in pleasure, your hands grabbing hold of her love-pillows while you hump her uncontrollably. With one final motion, you fully envelope her magenta length and cry out, <i>“Cum!”</i>");
	output("\n\nLuca moans below you, and you feel her cock swell as her seed rushes up into your waiting " + (pc.isPregnant(x) ? "channel" : "womb") + ". Your [pc.pussy " + x + "] contracts around her cock, holding it in place while it fills you with her cum, your [pc.girlCum] " + (pc.isSquirter() ? "spurting" : "oozing") + " around it.");
	if (pc.isHerm()) output(" [pc.EachCock] swells in sympathy with your womanly orgasm and convulses, [pc.cum] " + (pc.cumQ() < 1000 ? "emptying" : "erupting") + " onto her breasts and face.");
	output("\n\nWith a satisfied sigh, you pull your cum-soaked twat off of your lover and lean forward to undo the straps on her wrists. She shivers and twitches beneath you, recoiling from her orgasm while the dildo continues to vibrate within her ass. You switch the bumpy dong off, then remove it. You lay Luca on her side and unfasten the gag. When the ball comes out you hear her take a long breath.");

	pc.orgasm();
	// if PC did Use Pussy, have their pussy filled
	pc.loadInCunt(luca, x);
	lucaddiction(1);

	addButton(0, "Next", lucaIsDoneBeingFucked);
}

public function lucaIsDoneBeingFucked():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(45);

	output("You look around for something to clean up your mess, then you see Luca staring up at you. <i>“Come here, [pc.name],”</i> she says, opening her arms. <i>“Let me hold you. Please.”</i>");
	output("\n\n<i>“Sure thing,”</i> you answer, laying down and shuffling into her embrace.");
	output("\n\nLuca holds you tight and hums happily as you wiggle into a comfortable position. <i>“" + (flags["LUCA_SWITCHED"] == 0 ? "It’s been a long time since I tried something like that. This was very, </i>very<i> nice [pc.name]. I’m probably not going to be up for it all the time, but every once in a while should be fine." : "That was very satisfying [pc.name]. I needed that. I’ll be looking forward to next time... but not too soon mind you.") + "”</i>");
	output("\n\n<i>“I enjoyed myself as well, mistress.”</i>");
	output("\n\n<i>“Good.”</i> She plants a soft kiss on the back of your neck. You stay wrapped up in her arms until you both fall asleep.");
	output("\n\nYou awaken some time later, still held in Luca’s arms. You yawn and delicately nudge her until she releases you. <i>“You’re no fun,”</i> she mumbles while stretching her limbs. ");
	output("\n\n<i>“" + (pc.isNice() ? "Sorry mistress, but I have to get going." : "Only after I’ve satisfied my mistress. I have places to be unfortunately.") + "”</i>");
	output("\n\n<i>“I know. Join me for a shower at least?”</i>");
	output("\n\n<i>“Of course, mistress.”</i>");
	output("\n\nYou and Luca walk to her bathroom where you both clean up. You dote on each other. As she cleans each and every part of your body, you clean hers in turn. Once you’re both thoroughly washed you exit her shower, noticing that her drones are almost finished with the mess you two made. Your mistress gives you a kiss on the cheek before returning to work. You grab your gear and follow her back to the Lotus Eater.");

	pc.shower();

	IncrementFlag("LUCA_SWITCHED");
	pc.createStatusEffect("Luca Switch Cooldown");
	pc.setStatusMinutes("Luca Switch Cooldown", 7*24*60);
	// end scene
	// no changes to submission
	addButton(0, "Next", mainGameMenu);
}

public function lucaBeingALoveyDoveyDomme():void
{
	clearMenu();
	clearOutput();
	showLuca(true);
	author("RequiemForAMeme");
	processTime(60);

	if (flags["LUCA_GENTLE"] == 0) output("<i>“Mistress.”</i>\n\n<i>“Yes?”</i>\n\n<i>“I want to take you up on the offer you made earlier.”</i>");
	else output("<i>“Mistress, I want to have some more gentle sex again.”</i>");
	output("\n\nA wide grin spreads across Luca’s face. <i>“Are you certain, [pc.name]?”</i> she asks excitedly. <i>“" + (flags["LUCA_GENTLE"] == 0 ? "To be honest, I’ve been thinking about this so often lately" : "Last time was so incredible") + ". I’m not sure if I’ll be able to hold back.”</i>");
	output("\n\n<i>“I’m certain, mistress. I want you.”</i>");
	output("\n\nLuca radiates elation as you watch her switch places with Sebastian. You lick your [pc.lipsChaste] when you notice her cock swell in anticipation. You take each other’s hand and make your way to her room. Once the door hisses closed, you");
	if (!pc.isNude()) output(" strip away your [pc.gear] and");
	output(" kneel in the center of the room.");
	output("\n\nYou watch her leisurely remove her dress as she walks across the floor to her workstation. Her hips sashay back and forth, and you watch her round ass jiggle with the motions. She glances back at you from time to time as she sets the mood." + pc.cockAndVagina(" [pc.EachCock]", " [pc."+(pc.isHerm()?"e":"E")+"achPussy]") + (pc.isHerm() || pc.hasCocks() || pc.hasVagina() ? " heat" : " heats") + " up in a conditioned response to the soft jazz and dancing lights that fill the room.");
	output("\n\n<i>“So then...”</i> Luca turns and steps towards you. With each step, she twists her hips, forcing her cock to bounce as it swells. Her inner thighs are becoming slick with a womanly sheen. <i>“Based on the quiver of those lips and that hungry look in your [pc.eyes] I think I know what you want.”</i> She stops before you, her hands stroking her cock to full hardness. <i>“But I want to hear you say it. Tell me " + pc.mfn("handsome", "beautiful", "cutie") + ", what is it that you desire?”</i>");
	output("\n\nActions speak louder than words. You purse your [pc.lips] and kiss the underside of her shaft. You earn a soft coo from Luca as her hands travel up to the top of your head. You take the moment to let your [pc.tongue] lap at her magenta rod and taste her flavor. She pets your [pc.hair] and urges you onward with heavy breaths. <i>“Keep going,”</i> she whispers.");
	output("\n\nEager to earn a helping of her seed in your [pc.belly], you take her eleven inch cock into your hands. You pull and stroke the length as your lips and tongue move upwards. Finally, when your [pc.lips] meet her thick crown, you take her into your mouth, kissing and licking her precum-leaking head. <i>“Oh fuck, that’s intense,”</i> Luca whispers. The taste makes your eyes roll back, but you maintain focus and move your hands away from her shaft. One cups her cum swollen sack, feeling her balls churn with an inhuman load all for you. The other dives into her sweltering and drenched womanhood.");
	output("\n\nLuca squeals with pleasure as you assault her sexes. <i>“You’re so good,”</i> she moans. You laboriously work her cockhead, your [pc.lips] producing whorish slurping sounds with each suck. Unable to stay still, her hands relentlessly grip and knead your [pc.hair]. <i>“So <i>fucking</i> good, [pc.name].”</i>");
	output("\n\nAs her hands become more forceful and her hips start to shallowly thrust, you remind yourself to maintain steady breathing. Your hands continue to play with her cum-laden nuts and her leaking snatch. Her slick pussy clings to your digits as your mouth continues it’s oral affections. She gives you a deep guttural hum of satisfaction as her hands force you into her crotch, lodging her girthy meat into your throat, your lips kissing around the base of her dick while she holds you in place. <i>“I’m sorry [pc.name] I just can’t help myself!”</i> " + (pc.isBimbo() || lucaFixation() ? "Being face-fucked so suddenly induces a minor yet body-shaking oral orgasm," : "Being face-fucked so suddenly by your mistress causes your body to react,"));
	if (pc.isHerm()) output(" [pc.eachCock] and [pc.eachPussy] liberally leaking [pc.cum] and [pc.girlCum] respectively.");
	else if (pc.hasCock()) output(" [pc.eachCock] liberally leaking [pc.cum].");
	else if (pc.hasVagina()) output(" [pc.eachPussy] liberally leaking [pc.girlCum].");
	output("\n\nFireworks light up in your mind in anticipation for your favorite part. You don’t wait long either, your oral affections having earned your oncoming bliss. The heat and arousal starts in your [pc.lips], then it radiates spreading to your mouth and throat. Pleasure rocks your brain as your lips, mouth and throat become sex organs every bit as pleasurable as a penis or vagina - maybe more. You release out a body-shaking moan at the intimate sensations. ");
	output("\n\n" + (pc.isBimbo() || lucaFixation() ? "Being such " + (lucaFixation() ? "an oral cock slut" : "a bimbo") + ", your gag reflex is non existent," : "After servicing your mistress so many times before, suppressing your gag reflex is almost second nature,") + " making it all the easier to keep your mouth and gullet soft and pliant for her pleasure. You keep your [pc.lips] tightly sealed around her girth as she begins thrusting her voluptuous hips, her broad meaty prick delving in and out of your cock-inflated throat. <i>“Oh god yesss,”</i> she hisses, tightening her grasp on your " + (pc.hasHair() ? "[pc.hairNoun]" : "head") + ". <i>“I’m almost there. Almost. Almost.”</i>");
	output("\n\nYou look up at your mistress, somewhat desperate to see her writhing in pleasure. You’re instantly rewarded with Luca’s intensely flushed face and heaving chest pillows. She looks down at you with lust-filled eyes and gaping mouth. She abruptly stops her thrusting with her cock down your gullet. She stammers <i>“You- you can’t- you can’t look at me like that!”</i>");
	output("\n\nSeeing her flustered and so close to your sweet reward, you take matters into your own hands and continue your sensuous ministrations. Luca gasps and whimpers, holding you tightly as you bob your head up and down her throbbing cock. Her words are nonsensical-some mix between praising you and shameless moaning. Between her cock, her balls, and her pussy she can’t hold back a second longer and cums.");
	output("\n\n<i>“Oh fuck. Oh Fuck I can’t-”</i> She holds your firmly against her smooth groin while her cock swells, her load surges through it and directly into your gullet. <i>“You’re so goooood,”</i> her voice strains as she roughly handles your " + (pc.hasHair() ? "hair" : "head") + ". Luca’s copious spunk pumps into your stomach, filling and warming you until your [pc.belly] looks swollen with her seed.");
	var cumQ:Number = (pc.hasCock() ? pc.cumQ() : 0);
	if (pc.isHerm()) output(" [pc.EachCock] and [pc.vaginas] climax together, unleashing your [pc.cum] and [pc.girlCum] all over");
	else if (pc.hasCock()) output(" [pc.EachCock] unloads " + (cumQ < 1000 ? "spurts" : (cumQ < 5000 ? "ropes" : "gallons")) + " of [pc.cum] all over");
	else if (pc.hasVagina()) output(" Your [pc.vaginas] " + (pc.hasVaginas() ? "contract" : "contracts") + " in neglect as your [pc.girlCum] " + (pc.wettestVaginalWetness() < 3 ? "drips down" : (pc.wettestVaginalWetness() < 5 ? "streams down" : "completely drenches")));
	output(" your [pc.legOrLegs] and the floor below you.");
	output("\n\nAs Luca continues to orgasm, she pulls out into your mouth, filling it with freshly puddled futa cream before pulling out and showering your [pc.face] and [pc.hair]. She stumbles back, collapsing onto her bed with stuttered deep breaths. Pearlescent strands of spunk and spit link you to her glossy delicious looking cock.");

	pc.loadInMouth(luca);

	addButton(0, "Next", lucaDammitIAlreadyDidTheSlowRideThingWithAkana);
}

public function lucaDammitIAlreadyDidTheSlowRideThingWithAkana():void
{
	clearMenu();
	clearOutput();
	showLuca(true);
	author("RequiemForAMeme");
	processTime(120);

	var x:int = (pc.hasVagina() ? rand(pc.vaginas.length) : -1);

	output("You burp");
	if (pc.isBimbo()) output(" and giggle");
	output(" after swallowing the leftover cum in your mouth. Feeling a bit bloated, you manage to stand and wobble over to Luca.");
	output("\n\n<i>“Fuck that was good, [pc.name]. Come here.”</i>");
	output("\n\nYou sit down next to Luca. She uses her hands and tongue to wipe away and lick up her seed from your face.");
	output("\n\n<i>“There. Much better. You up for another round? I’m still hard, and we have a good coating of lube.”</i>");
	output("\n\nWith a sultry grin you reply, <i>“Absolutely, mistress.”</i>");
	output("\n\nWith her help you straddle her, arms wrapping around her slender shoulders, and " + (x < 0 ? "[pc.ass]" : "[pc.onePussy " + x + "]") + " hovering over her well slicked, cum and saliva covered shaft. Luca takes hold of your [pc.hips] and eases you down onto her thick cock. Your back slowly arches as her girth spreads your " + (pc.isHoleTight(x) ? "tight" : (x < 0 && pc.hasPlumpAsshole() ? "soft" : "loose")) + (x < 0 ? " pucker" : " nether lips") + ", your " + (x < 0 ? "backdoor" : "vulva") + " taking inch after inch of her lubricious dick.");
	if (pc.thickness >= 50) output("<i>“You are just my type. You know that right? You have all the right curves in all the right places. I can’t help but stare at your ass when you leave.”</i>");
	pc.holeChange(x, luca.biggestCockVolume());
	output("\n\nYou rock back and forth a bit, letting her well lubed prick stretch you wide. <i>“Oh god. I can’t wait to cum again and fill this perfect " + (pc.isHoleTight(x) ? "tight" : (x < 0 && pc.hasPlumpAsshole() ? "soft" : "loose")) + " squeeze you call " + (x < 0 ? "an ass" : "a pussy") + " with my seed. Don’t worry, [pc.name], we’ll go nice and slow.”</i>");
	output("\n\nAfter a few moments of leisurely sinking down onto her turgid flesh, your body relaxes and you ease into Luca’s embrace. You hug the magenta Dzaan closely, your [pc.chest] pressing against her ample breasts. <i>“That’s it " + pc.mfn("handsome", "beautiful", "cutie") + ", just breathe,”</i> Luca comforts. <i>“We’re in no hurry. Let’s make this moment last.”</i> She uses one hand to pet your " + (pc.hasHair() ? "hair" : "head") + " and the other to lightly scratch your back. <i>“Alright?”</i>");
	output("\n\nYou groan a simple, <i>“Yes mistress.”</i> With ragged breaths, you lean your head down into the nook between her neck and shoulder. You wrap your" + (pc.hasLegs() ? " [pc.legs]" : "self") + " around her and sink another inch onto her prick. You moan into her neck as you take her to the hilt and clench your limbs around her body, her shaft now fully enveloped by your [pc.pussyOrAss " + x + "]. The entire time you’re adjusting to her, she tenderly caresses your body and whispers soothing words into your ears.");
	output("\n\n<i>“I’m going to start moving a bit.”</i> She rocks her hips forward, shifting your lower body just enough to stir her veiny meat within you. Your eyes roll as she continues softly swaying her hips, a little bit of her girth pulling out then sliding right back in. Quickly, an all too familiar heat burns through your loins, filling you with cravings for more. You kiss your lover’s neck, muffling your lust-driven moans.");
	if (pc.hasCock()) output(" [pc.EachCock] is rendered perpetually hard from the steady violation of your " + (x < 0 ? "prostate." : "love tunnel."));
	output("\n\nOnly after several feverish minutes of Luca gently using your [pc.pussyOrAss " + x + "] to milk her dick do you start moving on your own. Using your arms for support, you move your [pc.hips] in tandem with hers. Her shaft pulls out of you a few inches at a time then glides right back in, filling you completely. <i>“Oh that’s... hnng. That feels great [pc.name].”</i> Luca praises, her voice lilting higher and her hands continuing to fondle you.");
	output("\n\nHeld so tenderly in her arms and fully intoxicated by your wanton lust, all you can think about is the hot throbbing cock casually burrowing in and out of you. Each time you sink down and bottom out against her, warm globs of precum pump into you while " + (x < 0 ? "her cock stuffs your ass." : "her blunt head kisses your womb."));
	output("\n\nLuca loosens the embrace just enough to pull your face in front of her own. You see thin trails of tears moving down her flushed face and her mouth agape with heavy gasps. <i>“Kiss me, [pc.name],”</i> she begs. <i>“Please.”</i> Your [pc.lipsChaste] greet hers before you have time to think, your [pc.tongue] interlocking with Luca’s. As you passionately kiss your mistress, her cock swells, flooding your " + (x < 0 || pc.isPregnant(x) ? "fuck tunnel" : "womb") + " with her seed.");

	var cumQ:Number = (pc.hasCock() ? pc.cumQ() : 0);
	if (pc.isHerm())
	{
		output("\n\nYour body tenses up, your limbs locking you in place around her. You both moan into each other reaching climax together. Your love tunnel spasms around her massive member as it fills you with its spunk. [pc.EachPussy] gushes, " + (pc.wettestVaginalWetness() < 3 ? "smearing" : (pc.wettestVaginalWetness() < 5 ? "splattering" : "covering")) + " Luca’s thighs with your [pc.girlCum]. At the same time");
		if (cumQ < 20000)
		{
			output(" [pc.eachCock] erupts,");
			if (cumQ < 5000) output(" smearing");
			else if (cumQ < 10000) output(" splattering");
			else output(" covering");
			output(" both of your chests with your [pc.cum], as you continue to ride Luca’s shaft.");
		}
		else output(" an inhuman amount of [pc.cum] explodes from [pc.eachCock] as you continue to ride Luca’s shaft, a spooge deluge falling upon yourself and your lover.");
		output(" Your lover luridly groans as her orgasm persists, her seed overflowing from your well-used womanhood.");
	}
	else if (pc.isMale())
	{
		output("\n\nYour body tenses up, your limbs locking you in place around her. You both moan into each other reaching climax together. Your [pc.ass] spasms around her massive member as it fills you with its spunk.");
		if (cumQ < 20000)
		{
			output(" [pc.EachCock] erupts,");
			if (cumQ < 5000) output(" smearing");
			else if (cumQ < 10000) output(" splattering");
			else output(" covering");
			output(" both of your chests with your [pc.cum], as you continue to ride Luca’s shaft.");
		}
		else output(" An inhuman amount of [pc.cum] explodes from [pc.eachCock] as you continue to ride Luca’s shaft, a spooge deluge falling upon yourself and your lover.");
		output(" Your lover luridly groans as her orgasm persists, her seed overflowing from your well-used backdoor.");
	}
	else if (pc.isFemale()) output("\n\nYour body tenses up, your limbs locking you in place around her. You both moan into each other, reaching climax together. Your love tunnel spasms around her massive member as it fills you with its spunk. [pc.EachPussy] gushes, " + (pc.wettestVaginalWetness() < 3 ? "smearing" : (pc.wettestVaginalWetness() < 5 ? "splattering" : "covering")) + " Luca’s thighs with your [pc.girlCum], as you continue to ride her shaft. Your lover luridly groans as her orgasm persists, her seed overflowing from your well-used womanhood.");

	output("\n\nOnce her orgasm subsides, you lean back into Luca’s embrace, your head falling once again onto her shoulders. You rest in her arms, basking in the aftershocks of your orgasm. At times you tremble, earning a pet and soothing whisper of praise from your mistress. You stay locked in her grasp for nearly twenty minutes as her cock goes soft within you.");

	if (x < 0) pc.loadInAss(luca);
	else pc.loadInCunt(luca, x);
	if (pc.hasCock()) pc.applyCumSoaked();
	pc.orgasm();

	addButton(0, "Next", lucaShowersAfterMakingLuuv);
}

public function lucaShowersAfterMakingLuuv():void
{
	clearMenu();
	clearOutput();
	showLuca(true);
	author("RequiemForAMeme");
	processTime(60);

	output("With a long ‘schlick’ sound, Luca helps you off of her now soft dick. A steady flow of her cum streams from your [pc.pussyOrAss " + x + "]. <i>“Come along, Love. Let’s get cleaned up.”</i> With her and her drones’ help, you’re taken to her shower.");
	output("\n\nYou hazily drink from one of her fruity concoctions as she delicately bathes you. In a combination of the hot water, heavy steam, and post orgasmic bliss you nearly fall asleep in her arms as she massages your limp muscles. But your focus is brought back when you feel her meaty shaft brush against you. A delicious thought crosses your mind,");
	if (flags["LUCA_GENTLE"] > 0) output(" thinking back to last time,");
	output(" but you wait for Luca’s drink to kick in before you try it.");
	output("\n\nLuca hums happily as she soaps up your back. <i>“" + (flags["LUCA_GENTLE"] == 0 ? "I’ve never done that before [pc.name]. Just a slow steady fuck. That build up was so intense. We absolutely need to do this again." : "That was fantastic as always [pc.name]. I love the slow steady fuck; the build up is so intense. I can’t wait to do this again.") + "”</i>");
	output("\n\n<i>“Yeah...”</i> you mumble rubbing your shrinking [pc.belly].");
	output("\n\nAfter a couple more minutes Luca declares. <i>“Done. You’re good to go.”</i> She stands before you and helps you up. As she goes to shut off the water, you grab her wrist.");
	output("\n\n<i>“Wait,”</i> you say turning her towards you. <i>“Mistress.”</i> You reach out to her big, firm breasts cupping them. Luca faintly whimpers as you give her melons a good grope. With a wry smile she returns the act, her hands falling upon your [pc.hips] and pulling you close. You continue to knead her thick bosom as her hands drift to your [pc.butt], lightly grabbing and pinching at your cheeks. Your reciprocated groping earns you a series of sloppy wet kisses from your now lust-driven lover.");
	output("\n\nYou pull away with a difficult breath. <i>“Mistress.”</i>");
	output("\n\n<i>“You don’t get to stop if that’s what you’re about to ask. Not after getting me riled up again,”</i> she says motioning to her erect cock.");
	output("\n\n<i>“No, that’s not what I want,”</i> you correct. You purse your [pc.lips] into a nice <i>“O”</i> and tantalizingly lick your way around. <i>“I want you to use me. Be rough with my mouth and don’t stop until you’re satisfied. Fast and hard, if you would, please.”</i>");
	output("\n\nLuca pulls you into a much more gentle kiss. <i>“What did I do to deserve such a perfect cumslut like you?”</i>");
	output("\n\n<i>“Just by being yourself mistress,”</i> you say with a wide grin.");
	output("\n\nYour lover’s wet, slippery hands touch the back of your head and " + (pc.hasHair() ? "run through your [pc.hair]" : "caress you") + ". She urges your downward, a bit forcefully, her emerald eyes locked on your [pc.lips]. You follow along with the dzaan herm’s silent orders and lower yourself. You do so at your own pace, however, and trail kisses down her drenched magenta skin, stopping at her firm E-cups. You give each aroused puffy nipple a few light, teasing licks followed by a soft peck, then continue on your descent.");
	output("\n\nHer swollen rod rubs against your [pc.chest] while you assume a kneeling position. Luca’s hands continue to " + (pc.hasHair() ? "run through your hair" : "rub your head") + " as your [pc.lipsChaste] meet her blunt crown and you plant a kiss. You take a brief moment to meet your mistress’s gaze. <i>“You’re sure? Last chance.”</i>");
	output("\n\nYou silently lower your head and use your [pc.tongue] to stroke her shaft from the base up, finishing by licking up a large dollop of precum from her head. <i>“I’m sure mistress.”</i>");
	output("\n\nThe dzaan thrusts forward into your pliant and cock-hungry maw, her hands " + (pc.hasHorns() || (pc.hairStyle.indexOf("pigtail") != -1) ? "using your " + (pc.hasHorns() ? "[pc.horns]" : "pigtails") + " as handles" : "taking hold of your " + (pc.hasHair() ? "hair" : "head")) + ". You take a series of quick breaths as she shallowly spears her length in and out of your mouth. The scent of her dick overpowers all else, your heart skipping a beat as it fills your nostrils. You do your best to keep your tongue and lips at work as she uses your head as a cocksleeve. <i>“Oh yeah. Keep wiggling your tongue... just like that...”</i>");
	output("\n\nHer grip around your " + (pc.hasHorns() ? "horns" : (pc.hasHair() ? "hair" : "scalp")) + " tightens as her thrusts come faster and harder, her cock beginning to fuck your sexed up gullet. <i>“Almost there, my precious cumdump!”</i> As she finishes her sentence, a nearly addicting heat and arousal spreads through your [pc.lips], then through your mouth and throat. The fantastic, oral ecstasy shakes you to the core, the rest of your body becoming pointless in the face of the pleasure you now feel.");
	output("\n\n<i>“Oh Fuck Yes! You are just the perfect cocksucker!”</i> Luca gasps, her cock plowing your maw wide. <i>“Oh god [pc.name], you make me want to be an Alpha. I wish I could keep you to myself, have you and your magical mouth at my beck and call. Doesn’t that sound great? I could keep you here as my Beta and fuck you like this every morning and every night.”</i> She holds you up tightly against her crotch for a particularly hard thrust, nearly choking you on her dick. <i>“Hoooh, fuck that’s such a good feeling.”</i>");
	output("\n\nShe then continues her fervent face-fuck. <i>“We’re absolutely doing this again. I won’t take no for an answer. Not when you have such a great cocksleeve for a mouth.”</i> Her approval gives you a warm feeling of euphoric submission. <i>“I know you’re thirsty, my " + pc.mfn("handsome", "beautiful", "cute") + " slut.”</i> You moan, low and stifled around her girthy, fragrant, throat-stretching shaft. <i>“Don’t worry I’m- fuck I’m so close now.”</i> The lustful desperation in her voice matches the imperativeness of her thrusts.");
	output("\n\nA few moments later into her feverish face-fuck, you hear Luca stutter, <i>“I’m so- so- I’m gonna- gonna- CUM!”</i> She hilts herself in you as her delicious spunk rushes down into your throat. Luca moans loudly and shamelessly, her hands keeping you in place, her cock throbbing as her load fills your stomach and distends your [pc.belly] once again. Her voluptuous hips jerk, rubbing your face against her smooth skin and forcing your widespread [pc.lips] to continually kiss the base of her thick meat. You accept it all with submissive joy, from her enraptured squeals of delight to her seed filling you until it overwhelms the sweet taste of her shaft.");
	output("\n\nAs your mistress’s orgasm dies down she pulls out of your well-used throat and mouth, her seed splashing your face and hair. <i>“Aw... damn...”</i> Her voice is heavy with quick shallow breathing. <i>“All my hard work for nothing...”</i> Her words trailing off into the sound of running water. She wipes away a layer of her spunk from your face and you look at the magenta futa with a wide, happy smile. She sighs, returning your sentiment with her own grin. She pets your head as you tend to her cum and spit-shined meat, only pulling away once her cock is fully clean of any excess fluids. <i>“You’re the best, [pc.name],”</i> she tells you. <i>“I wouldn’t trade " + (flags["LUCA_GENTLE"] == 0 ? "this moment" : "these moments") + " for anything.”</i>");
	// [pc.orallyFilled]
	pc.shower();
	pc.applyCumSoaked();
	pc.loadInMouth(luca);

	addButton(0, "Next", lucaHasTwoCleanYouUpAgainYouCumslut);
}

public function lucaHasTwoCleanYouUpAgainYouCumslut():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(240);

	output("After cleaning your mistress with your tongue, she washes you down once again. After you’re clean and dried, you both emerge from her bathroom and rest on her warm and freshly made bed. A hardlight monitor appears from the ceiling while a drone places a fuzzy blanket over you both. Luca uses a remote to bring up a selection of holos. <i>“What do you want [pc.name]?”</i>");
	output("\n\n<i>“I trust whatever choice you make.”</i> Then bring your head to rest on her shoulder.");
	output("\n\nShe plants a kiss on your head then picks " + RandomInCollection("an adventure space fantasy epic about a champion defeating an evil demon", "a children’s holo about an alien in search of his son", "a comedy about a group of people stuck on a cruise ship with a murderer", "an action holo about a group of people stuck on a hostile alien planet looking for a tomb") + ". Maybe it’s because your partner has such a soft, comfy embrace. Maybe your multiple orgasms have left you drained, but at some point you fall asleep during the holo.");
	output("\n\nYou awaken a bit groggy but warm and cozy. You’re lying with your head on Luca’s left shoulder and her arm holding you against her. Her right hand lightly strokes your " + (pc.hasHair() ? "[pc.hair]" : "head") + ". Both of you are on her bed, still covered by the fuzzy blanket. You see the menu screen of the holo you started and hear soft piano music filling the room.");
	output("\n\nYour eyes adjust to the dim lighting and you see her smiling down at you. <i>“Hello there, [pc.name],”</i> she says with a kind smile. <i>“Sleep well?”</i>");
	output("\n\nYou nod your head and nuzzle your head into her shoulder. <i>“Hold me like this mistress.”</i> You place left arm and leg over her body. <i>“At least for a few more minutes.”</i>");
	output("\n\nShe embraces you with her right arm and holds you tight. <i>“Anything for you.”</i>");
	output("\n\nLuca snuggles with you for nearly twenty minutes before you let go. She gives you kiss before returning to work. Feeling fully relaxed and refreshed you stretch, grab your gear and head out back to the Lotus Eater.");

	pc.shower();
	// +5 Cum Addiction, +3 Oral Fixation, 
	lucaddiction(5);
	lucaXP(3);

	IncrementFlag("LUCA_GENTLE");

	addButton(0, "Next", mainGameMenu);
}

public function lucaIsConcernedAboutAddiction():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(1);

	output("<i>“Hey [pc.name]... um there’s no easy way to say this, but we’ve been together a lot. And it looks like you’re starting to show real signs of becoming addicted to me.”</i>");
	output("\n\n<i>“Look I-”</i> You try to speak, but Luca raises her hand.");
	output("\n\n<i>“It’s alright, [pc.name]. We knew the risks going in. We just need to spend some time apart. Like... A lot of time actually.");
	if (lucaSubmission() >= 100) output(" And believe me when I say I’m going to miss you.");
	output("”</i>");
	output("\n\n<i>“Mistress please,”</i> you plead. The idea of spending time away from Luca sounds like the most painful thing you’ll ever go through. ");
	output("\n\nYou can either accept your mistress’s request or push her for what you want.");

	addButton(0, "Accept", fineLucaIllGoIntoRehab, undefined, "Accept", "Accept Luca’s request and not have sex for a couple weeks.");
	addButton(1, "Push", lucaJustLetMeSuckYourDickThisOneTime, undefined, "Push", "Push Luca for sex. (This is probably a bad idea)");
	if (lucaSubmission() >= 100) addButton(2, "Submit", lucaPlsKeepMeForever, undefined, "Submit", "Becoming addicted to Luca doesn’t sound so terrible. You could try to convince her.");
}

public function fineLucaIllGoIntoRehab():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(1);

	output("You begrudgingly accept your mistress’s request. ");
	output("\n\n<i>“Thanks [pc.name], I’m sorry about this,”</i> Luca tells you, <i>“but we’ll get through it. Until then you can still use my VR simulators and spend time with me.”</i>");
	
	pc.createStatusEffect("Luca Addiction Prevention");
	pc.setStatusMinutes("Luca Addiction Prevention", 14*24*60);
	
	addButton(0, "Next", approachLuca, true);
}

public function lucaJustLetMeSuckYourDickThisOneTime():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(4);

	output("You decide to push your mistress for what you want. <i>“I think you should reconsider, mistress.”</i>");
	output("\n\nShe raises an eyebrow at you and motions you to continue.");
	output("\n\n<i>“I feel fine. And we’ve been having great sex. I’m not worried about becoming addicted to you and you shouldn’t be either. Just because I think your cum is super yummy shouldn’t scare you. It just means I really like giving you blow jobs.”</i>");
	output("\n\n<i>“I don’t know [pc.name]...”</i>");
	output("\n\nYou place a hand on her shoulder and look into her nervous eyes. <i>“Everything will be fine. Like, what’s going to change if I become addicted to you? I deepthroat you slightly more often than I currently do?”</i>");
	output("\n\n<i>“There’s more to it that that-”</i>");
	output("\n\n<i>“I know the risks Luca. It’s not they’ve changed since we started this. So please don’t worry about me. And just worry about how much time you’re going to miss work while I have your cock holstered in my mouth.”</i>");
	output("\n\n<i>“I want you to know that I’ll always be worrying about you in some way. But damn if you don’t know what buttons to push with me. Fuck it. What do you have in mind, [pc.name]?”</i>");

	lucaSexRouter(true);
}

public function lucaPlsKeepMeForever():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(9);

	output("<i>“Allow me to pose you a question.”</i>");
	output("\n\n<i>“Alright, I’ll bite,”</i> Luca says. <i>“What’s the question, [pc.name]?”</i>");
	output("\n\n<i>“What if I want to be addicted to you?”</i>");
	output("\n\n<i>“Excuse you?!”</i>");
	output("\n\n<i>“Let me rephrase that. What would be different? I spend more time around here mounted on your cock?”</i>");
	output("\n\n<i>“There’s more to it that that... you lose the ability to choose. I won’t take that from you.”</i>");
	output("\n\n<i>“I’m giving you my choice right now Luca.”</i> Your words catch her off guard, causing her to visibly flinch. <i>“If I become addicted then it happens. If not then we continue our current sexcapades as normal. I want, no I need you to know that the thought of spending my life with you, fulfilling every carnal desire you have sounds like the best thing ever.”</i>");
	output("\n\n<i>“[pc.name]... what about your quest? Your father’s legacy and inheritance? Everything you’ve been through?”</i>");
	output("\n\n<i>“You’re more important to me than all those things,”</i> you tell her. <i>“So please stop worrying, and just focus on how good you’re about to feel.”</i>");
	output("\n\n<i>“I don’t know what to say [pc.name]... Fine. We’ll risk it. But if you start begging for my cum at all hours of the day, then I am one hundred percent dick-slapping you.”</i>");
	output("\n\n<i>“Deal,”</i> you reply with a quick lick of your [pc.lipsChaste].");
	
	flags["LUCA_ADDICTION_ACCEPTABLE"] = 1;
	
	lucaSexRouter(true);
}

public function lucaGotYouAddictedToHer():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(30);
	
	if (lucaSubmission() < 100)
	{
		output("As you start to leave the Lotus Eater, a thought crosses your mind: Luca is right there, and you’re not sucking her off. You decide to fix that. Not one to say no to a blow job, even while at work, Luca accepts your oral relief. You lazily get her off with your mouth, losing track of time and the number of loads you swallow. Only after your mistress tells you to go lie down and rest do you stop. With your [pc.belly] bloated and full of warm spunk, you let two drones help you to her room.");
		output("\n\nYou wake up wrapped in the arms Luca and shiver with excitement when you feel her morning wood between your [pc.thighs]. With a few playful wiggles of your [pc.hips], you wake your mistress up. She gently kisses the back of your neck. Not content to just be teased by her rigid meat, you use your hands to encourage your mistress, and after a couple words of shameless cumsluttery she fucks");
		if (pc.hasVagina()) output("[pc.eachPussy] and [pc.ass]"); //I’m not sure if I got this line right!!!
		else output(" your [pc.ass]");
		output(" full of cum. ");
		output("\n\nOne quick shower later, you decide to return to your ship, but the same thought from before crosses your mind again: Your gorgeous and wonderfully kind dzaan mistress is right there, and her dick isn’t in your mouth. The process repeats over the next four days. You suck her off at work, then she fucks you the next morning. Again and again... ");
		output("\n\nAt Luca’s insistence, you eventually continue your journey. But only a few days pass before you return, hungrier for her seed than ever and desperate for her touch. You orally service Luca four times the first hour you’re back at the Lotus Eater. Settled comfortably beneath her work counter, you purse your [pc.lips], kiss her crown and slide down until your face is buried deep into her crotch. Hours of guzzling her creamy nectar pass, and you never get hungry or wonder why. ");
		output("\n\n<b>Hours turned into days, and days turned into weeks...</b>");
		output("\n\nEvery moment with Luca is a heavenly experience, and thankfully you’re never apart for long. She even began teaching you how to help around the Lotus Eater, from interacting with patrons using the VR equipment. Over time, you become a mini attraction to the lounge, all due to the");
		if (pc.isNice()) output(" polite and kind");
		else if (pc.isMisch()) output(" playful and mischievous");
		else output(" firm and hard");
		output(" way you handle patrons along with the way you publically debase yourself for your mistress. Each day, new patrons show up to get a glimpse of Luca and her submissive cumslut.");
		output("\n\nIn between shifts Luca finds time to give you what you need: a good, hard, and especially long fuck while you’re tied up and at her mercy. The days where she teases you are the worst; her cock so close all the time, her shaft dripping with precum after just a few hours of not ejaculating, her balls so swollen with her seed that they push her dick forward with each step, and you’re forbidden to touch. But those nights are the best; after hours of constant teasing, she’ll take you passionately and use your body for hours, fucking you until her spunk is leaking from your well-fucked holes.");
		output("\n\nMonths pass, and you receive an invitation of some kind to a celebration for a relative. Apparently [rival.heShe] found some stuff during the rush and got a lot of money or something. You didn’t really read the invite, just kind of skimmed it. You delete it, knowing that you can’t be bothered to be away from your mistress for such pointless matters. You return to work and see Luca smile as she notices you. You blush and go to her side - that cock isn’t going to suck itself.");
	
		badEnd();
	}
	else
	{
		output("As you start to leave the Lotus Eater, a thought crosses your mind. Luca is right there, and you’re not sucking her off. You decide to fix that. Not one to say no to a blow job, even while at work, Luca accepts your oral relief. You eagerly get her off with your mouth, losing track of time and the number of loads you swallow. Only after your mistress tells you to go lie down and rest do you stop. With your [pc.belly] bloated and full of warm spunk, two drones help you to her room.");
		output("\n\nYou wake up wrapped in Luca’s arms and shiver with excitement when you feel her morning wood between your [pc.thighs]. With a few playful wiggles of your [pc.hips] you wake your mistress, feeling her gently kissing the back of your neck. Not content to just be teased by her rigid meat, you use your hands to encourage your mistress, and after a couple words of shameless cumsluttery, she fucks");
		if (pc.hasVagina()) output(" [pc.eachPussy] and [pc.ass]");
		else output(" your [pc.ass]");
		output(" full of cum.");
		output("\n\nOne quick shower later, you decide to return to your ship, but the same thought from before crosses your mind again. Your gorgeous and wonderfully kind dzaan mistress is right there, and her dick isn’t in your mouth. The process repeats over the next week. You suck her off at work, then she fucks you the next morning. Again and again... ");
		output("\n\nAt the end of the seventh day, Luca insists for you continue your journey. You agree on the condition that she give you some of her cum to take with you. She’s slow to accept, but your [pc.lips] and [pc.tongue] convince her to go along with it. After a slow, gentle cock-milking, you depart with several containers of your mistress’s seed. ");
		output("\n\nYou continue your journey until you run out. Upon returning, you orally service Luca four times the first hour you’re back at the Lotus Eater. Settled comfortably beneath her work counter, you purse your [pc.lips], kiss her crown, and slide down until your face is buried deep into her crotch. Hours of guzzling her cum pass, and you never get hungry or wonder why.");

		addButton(0, "Next", lucaBadEndWeeksLater);
	}
}

public function lucaBadEndWeeksLater():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");

	output("<b>Weeks later...</b>");
	output("\n\nYou return to the Lotus Eater triumphantly after finding yet another of your father’s probes. Your mistress, excited to see you and proud of your accomplishment, rewards you with a slow, gentle ride on her dick. You spend the next few days with Luca sharing the story of your adventure since you last saw her. You tell her of the danger you faced, the alien races you discovered, the people you encountered and the other people you ‘encountered’. All the while, she treats you to a wonderfully relaxing time, from scratching your head, massaging your back, and cuddling on her couch watching the newest netbuster holo to tending to" + (pc.hasGenitals() ? pc.cockAndVagina(" [pc.eachCock]", " [pc.eachPussy]") : " your [pc.nipples]") + " while your belly is full of her cum.");
	output("\n\nYour time together ends, and you return to your quest, taking an titanic supply of her seed with you, desperately hoping that this next probe is the last...");
	output("\n\nThree months pass before you finally return to the Lotus Eater. Having run out of your supply in the first month, you return driven by a primal need for her taste of her spunk and the feeling of her caresses. When you pass through the wooden doors Luca is right there, immediately taking you into her arms. With hoops and hollers from her regular patrons, you both go to her room. You emerge after three days.");
	output("\n\nYou explain to Luca how you managed to get the last few of your father’s probes in the time you’ve been gone. You even managed to reconcile things with [rival.name] after being stranded with [rival.himHer] and eventually saving [rival.hisHer] life. With the help of your crew, the allies you met, and a fuck-ton of determination, you finished your goal; you completed your quest and returned to her.");
		
	addButton(0, "Next", lucaBadEndYearsLater);
}

public function lucaBadEndYearsLater():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");

	output("<b>Years later...</b>");
	output("\n\nYou are [pc.name] Steele, the CEO of Steele Tech and one of the richest people in the universe, but you prefer to spend your days working alongside and getting fucked by your lover and mistress, Lucianna ‘Luca’ Vastnyr. You walk around the Lotus Eater tending to the patrons, the taste of cum on your lips and");
	
	if (pc.isHerm()) output(" your belly six months pregnant with two dzaan twins. You look around, seeing your first three little alphas playing with Sebastian, the robot drone somehow seeming worn out from their endless energy. At the back of the lounge is Luca, her hand rubbing her swollen belly, smiling dreamily at you. Without a doubt in your mind, you know this place is where you belong.");
	else if (pc.isFemale()) output(" your belly six months pregnant with two dzaan twins. You look around seeing your first three little alphas playing with Sebastian, the robot drone somehow seeming worn out from their endless energy. At the back of the lounge is Luca. She smiles dreamily at you. Without a doubt in your mind, you know this place is where you belong.");
	else output(" your bottom filled with Luca’s seed. It drips down your [pc.legOrLegs] as you walk along. You look around, seeing your first three little alphas playing with Sebastian, the robot drone somehow seeming worn out from their endless energy. At the back of the lounge is Luca, her hand rubbing her swollen belly, smiling dreamily at you. Without a doubt in your mind, you know this place is where you belong.");
	
	badEnd();
}