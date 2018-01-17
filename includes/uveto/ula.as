//Princess Ula (Codename: OWO)
//Chance of finding in any Uvetan Cave

// ULA_CAVE			- Set to the room it procs in.
// ULA_LEAVE_TIMER 	- Once you approach her, there's a countdown timer till she leaves 5ever.
// ULA_SAVED		- 1 if given belt, 2 if given coat
// ULA_STARTALK		- 1 if talked in teh OG encounter
// ULA_DEFLOWERED	- 1 if hymen torn
// ULA_SEXED 		- Counter for number of times banged

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
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	showName("COLD\nKORGONNE");
	showBust("ULA" + nudeS);
}

public function showUla(nude:Boolean = false):void
{
	if(flags["MET_ULA"] == undefined) showName("KORGONNE\nPRINCESS");
	else showName("\nULA");
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	showBust("ULA" + nudeS);
}
public function ulaCapacity():Number 
{
	return 500;
}

//Meeting
//Bonustext
public function ulaBonus():void
{
	if(flags["ULA_CAVE"] == undefined)
	{
		if(rand(5) == 0)
		{
			flags["ULA_CAVE"] = currentLocation;
			rooms[flags["ULA_CAVE"]].addFlag(GLOBAL.NPC);
			generateMap();
		}
	}
	if(flags["ULA_CAVE"] == currentLocation && flags["ULA_SAVED"] == undefined)
	{
		if(flags["ULA_LEAVE_TIMER"] == undefined || flags["ULA_LEAVE_TIMER"] + 60*24*2 > GetGameTimestamp())
		{
			output("\n\nA shivering figure lurks in shadowy darkness at the rear of the cave, its large, canine ears quivering in distress. Features are difficult to make out without getting any closer, but it is clear from the mop of snow-soaked hair and chattering teeth that whatever is cowering back there is suffering from some serious hypothermia.");
			addButton(0,"Figure",caveMeetUla);
		}
		else
		{
			output("\n\nThe korgonne you met here is long gone. You’ll probably never see her again.");
		}
	}
}

public function ulaApproach(back:Boolean = false):void
{
	clearOutput();
	showUla();
	if(back)
	{
		output("<i>“Wait,”</i> you say.");
		output("\n\nUla stops and tilts her head. <i>“");
		if(!korgiTranslate()) output("Something else wanting");
		else output("You want to do something else");
		output("?”</i>");
	}
	else
	{
		output("<i>“Hey there,”</i> you call.");
		output("\n\nUla’s ears perk right up, their piercings rattling. The rest of her follows a second later. <i>“[pc.name]! Happying feels!”</i> She rushes forward to hug you tightly. <i>“Knew sure-visit.”</i> Wide green eyes stare up at you. <i>“Have talks or share warm?”</i> The final word is underlined with a throaty purr.");
		if(pc.tallness >= 7*12) output(" You’re keenly aware that her nose is inches away from your crotch.");
		output("\n\nBy the sound of it, she’s up for anything.");
	}
	ulaMenu();
}

public function ulaMenu():void
{
	clearMenu();
	addDisabledButton(0,"Appearance","Appearance","This hasn’t been written yet, sorry!");
	addButton(1,"Talk",ulaTalk);
	addButton(2,"Sex",ulaSexApproach);
	addButton(14,"Leave",mainGameMenu);
}

public function ulaTalk():void
{
	clearOutput();
	showUla();
	//Bimbo
	if(pc.isBimbo()) output("<i>“We can talk a bunch, cutie!”</i>");
	//Bro
	else if(pc.isBro()) output("<i>“Talks.”</i>");
	//Nice
	else if(pc.isNice()) output("<i>“I can talk.”</i>");
	//Misch
	else if(pc.isMischievous()) output("<i>“I can talk those big old ears of yours off.”</i>");
	//Hard
	else output("<i>“Talk is fine.”</i>");
	//Merge
	output("\n\nGrabbing you by the hand, the chubby korgonne leads you to the bed, tail wagging hard enough to whap you a half-dozen times on the way. She sits down and pats the place next to her. <i>“Alien stories amazing. Such strangeness and magic! Talking craftboxes! Ships of stars!”</i> She smiles a little shyly at you as you sit down next to her. <i>“Korg stories boring. Fish-journeys or metalfinds. Hunt slaying not bad, but best hunts with alien bang-bows. Elders no let Ula have any.”</i> She leans happily against you");
	if(pc.tallness >= 66) output(", looking up with wide eyes");
	else output(", looking over with wide eyes");
	output(". <i>“What want talk?”</i>");
	processTime(2);

	ulaTalkMenu();
}

public function ulaTalkMenu():void
{
	clearMenu();
	addButton(0,"Stars/Space",stayAndStarsTell,true);
	addButton(1,"Mining",ulaMiningTalk,undefined,"Mining","Ask Ula about the korgonne's own mining.");
	addButton(2,"Ula's Role",ulasRoleInTheClan,undefined,"Ula's Role","Ask Ula about her role in her clan.");
	addButton(3,"Other Tribes",otherTribesTalkarydooda,undefined,"Other Tribes","Ask Ula about other korgonne tribes.");
	addButton(4,"Explain:Guns",talkAboutGunsWithUla,undefined,"Explain: Guns","Explain guns too Ula.");
	addButton(5,"Exp:Electricity",explainElectricityToUla,undefined,"Explain: Electricity","Explain electricity to Ula.");
	addButton(6,"Exp:Savicite",talkAboutSavicite,undefined,"Explain: Savicite","Explain Savicite to Ula.");
	addButton(7,"Exp:Credits",ulaCreditsTalk,undefined,"Explain: Credits","Explain the universal galactic currency to Ula.");
	addButton(14,"Back",ulaApproach,true);
}

//Sex menu:
public function ulaSexApproach():void
{
	clearOutput();
	showUla();
	output("<i>“Warm,”</i> you say with authority, dipping your hand between her legs to feel for pussy hidden between.");
	output("\n\nThe fluffy princess shudders at your touch, hips haltingly pressing back until your digits slip into a suddenly slick slit. She pants, <i>“Naughty alien,”</i> but her hips don’t stop their sensuous grinding. Ula’s folds cling to your [pc.skinFurScales] as she drives you deeper, your thumb grazing the hood of a rapidly firming clit. <i>“Elders truthspeak: aliens sex-love more than korg matron. Naughty tease-[pc.boyGirl]!”</i>");
	output("\n\nYou tilt your head, <i>“Are you asking me to stop?”</i>");
	output("\n\n<i>“No,”</i> Ula pants, tongue refusing to retreat entirely within her mouth. She clutches tight, short-clawed fingers digging deep. You can feel her dripping into your hand, and the familiar scent of her minty lust creeps into the air. <i>“Want more!”</i> She jerks away, dragging your slick digits from her juicy muff. A visible blush has spread across her exposed skin, darkening her nipples and lips. She grabs you by the wrist and pulls your pussy-soaked hand between you. <i>“Want you horny like Ula.”</i> She extends her tongue and laps at her own juices. <i>“Want [pc.name] eyes big-desiring.”</i> Dropping your hand, she ");
	if(pc.tallness >= 6*12) output("hops up, legs around your waist, and ");
	output("kisses you, thrusting her tongue into your mouth. <i>“Want love-mate bond.”</i>");
	output("\n\nYou swoon when she breaks away, breathing hard. The near-naked native prances to nearby bin, retrieving a dildo. She drags and back and forth across her steamy slit, watching you all the while. A slow smile spreads across her features. <i>“Go on. Tell what want.”</i> Her pussy drips. <i>“Tell how Ula make happy.”</i>");
	addButton(14,"Back",ulaApproach,true);
	if(pc.hasCock()) addButton(0,"Breed Her",breedWithUla);
	else addDisabledButton(0,"Breed Her","Breed Her","You need a penis for this.");
	if(pc.hasVagina() && pc.blockedVaginas() == 0) addButton(1,"Lez Out",ulaPussyFuck,undefined,"Lez Out","You both have pussies. Use ‘em!");
	else if(pc.blockedVaginas() > 0) addDisabledButton(1,"Lez Out","Lez Out","Maybe you should take care of your vaginal obstruction first?");
	else addDisabledButton(1,"Lez Out","Lez Out","You’ll need a vagina for this!");
	addButton(2,"Watch",watchUlaFapturbate);
}



//[Figure]
public function caveMeetUla():void
{
	clearOutput();
	showCaveUla();
	if(flags["ULA_LEAVE_TIMER"] == undefined) flags["ULA_LEAVE_TIMER"] = GetGameTimestamp();
	output("You cautiously approach the mysterious stranger, hand on your [pc.weapon].");
	output("\n\n<i>“H-help?”</i> an almost inaudible voice squeaks. Watery green eyes peek at you from over a bangle-clad wrist. Ice shards trace trails of misery down the girl’s soft-furred cheeks where she was crying. Icy blue lips, plump with feminine appeal, quiver in misery. <i>“C-c-cold.”</i> She points");

	if(pc.hasItemByClass(HeatBelt) || pc.hasItemByClass(ArcticWarfareBelt) || pc.hasItemByClass(InsulatedCoat))
	{
		output(" to your ");
		if(pc.hasItemByClass(HeatBelt) || pc.hasItemByClass(ArcticWarfareBelt)) output("belt");
		else output("cloak");
	}
	output(". <i>“Share w-w-arm?”</i>");

	//CODEX UNLOCK
	if(!CodexManager.entryUnlocked("Korgonne"))
	{
		output("\n\nYour codex beeps. <i>“Korgonne identified. Tribal species native to Uveto VII that is frequently hostile to outsiders. Females are sexually aggressive and will use force and genital pheromones to entice mating. Use caution when traversing government-recognized korgonne lands.”</i>");
		CodexManager.unlockEntry("Korgonne");
		output(" <b>New Codex entry unlocked: Korgonne.</b>");
	}
	//Merge
	output("\n\nThis close, you can see the poor puppy-girl is ill-dressed for the icy weather outside.");
	if(flags["MET_FEMKORGONNE"] != undefined) output(" Other Korgonne you have encountered have come warmly dressed in furs, some with heat belts. She has neither.");
	else output(" Venturing out in anything less than a dozen pieces of thickly-padded clothing seems like an idiot idea, unless you have a heat belt. She does not.");
	output(" A diaphanous cloak is her only garment. Meant for little more than ornamentation, it does little more than highlight its wearer’s lack of modesty and awareness of Uveto’s dangers.");
	output("\n\nWill you help the foolish dog-girl?");

	processTime(10);
	clearMenu();
	addButton(4,"Nope",noHeatForYouUla);
	addButton(0,"Fuck",shareHeatWithKorgi);
	if(pc.hasItemByClass(ArcticWarfareBelt) || pc.shield is ArcticWarfareBelt) addButton(1,"Give AWBelt",giveUlaBelt);
	else if(pc.hasItemByClass(HeatBelt) || pc.shield is HeatBelt) addButton(1,"GiveHeatBelt",giveUlaBelt);
	else addDisabledButton(1,"Give Belt","Give Belt","You don’t have a belt to give her.");
	if(pc.hasItemByClass(InsulatedCoat) || pc.armor is InsulatedCoat) addButton(2,"Give Coat",giveUlaCoat);
	else addDisabledButton(2,"Give Coat","Give Coat","You don’t have a suitable coat.");
	//[Share Heat] [Give Belt] [Give Coat] [Nope]
}

//Nope
public function noHeatForYouUla():void
{
	clearOutput();
	showCaveUla();
	output("She’s cold now but safe in the cave. You have no doubt that the typical, plush korgonne fur will be more than enough to get her home once she dries off. <i>“Sorry.”</i>");
	if(pc.isAss()) output(" You don’t mean it.");
	output(" Turning away, you stomp back to the other side of the cave");
	if(!pc.isAss()) output(", feeling more and more like a monster with every step");
	else output(", wishing someone would uplift the lot of them so stupid shit like this would stop happening");
	output(".");
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Share heat:
public function shareHeatWithKorgi():void
{
	clearOutput();
	showCaveUla();
	output("<i>“I can warm you up,”</i> you offer, coming closer.");
	output("\n\n<i>“No!”</i> the korgonne reacts violently, scrabbling away to the far side of caves. <i>“Elders tell! Know aliens only take! Never give! Take holds, take coats, take warmings!”</i> She shivers and cries. <i>“Not trusting. You want be good alien, show be good alien!”</i>");
	output("\n\nLooks like if you want to help her out, you’ll need to give her something");
	if(pc.hasCock()) output(" other than a hard dicking.");
	else output(" other than sex.");
	processTime(1);
	//disable option
	addDisabledButton(0,"Fuck","Fuck","You already tried that.");
}

//Give Coat:
public function giveUlaCoat():void
{
	clearOutput();
	showCaveUla();
	//BINGE AND PURGE!
	if(pc.armor is InsulatedCoat) pc.armor = new EmptySlot();
	else pc.destroyItemByClass(InsulatedCoat);

	output("<i>“Here,”</i> you hand her the Korgonne-made garment from your inventory");
	if(pc.isNice()) output(" with an apologetic smile. You really hope she doesn’t ask you how you got it.");
	else if(pc.isMischievous()) output(" with a cheeky grin.");
	else output(" without a care. Beggar’s can’t be choosers.");
	output("\n\nThe sniffling canine snatches it from your hands in desperation, stuffing it onto herself overtop of her soaked cloak in a frenzy of motion. <i>“Nice,”</i> she offers, looking up to you once more. Her shivers slow, then fade as she begin to preen, wiping the crusted tears from her cheeks. <i>“Am having many thanks.”</i> Smiling shyly, the dog-girl crawls closer, still on her knees. A gentle pat to the cave floor invites you to sit with her. <i>“Tell of stars?”</i>");
	flags["ULA_SAVED"] = 2;
	clearMenu();
	addButton(14,"Leave",leaveAfterBelt);
	addButton(0,"Stars",stayAndStarsTell);
}

//Give belt
public function giveUlaBelt():void
{
	clearOutput();
	showCaveUla();
	if(pc.shield is HeatBelt || pc.hasItemByClass(HeatBelt))
	{
		if(pc.shield is HeatBelt) pc.shield = new EmptySlot();
		else pc.destroyItemByClass(HeatBelt);
	}
	else
	{
		if(pc.shield is ArcticWarfareBelt) pc.shield = new EmptySlot();
		else pc.destroyItemByClass(ArcticWarfareBelt);
	}
	output("<i>“Here,”</i> you toss her your heat-belt before you think better of it. The trip back will be cold, but by the look of her, she’s going to need it more.");
	output("\n\nThe sniffling canine snatches it from your hands in desperation, fastening it around her underbust instead of her waist, lifting and squeezing stiff-tipped breasts into an almost fetishistic display of jiggling titflesh. <i>“Nice,”</i> she giggles, her shivers slowing. She wipes the crusted tears from her cheeks and stretches, twisting this way and that. Her tail wags. <i>“Am having many thanks.”</i> Smiling shyly, the dog-girl crawls closer, still on her knees. A gentle pat to the cave floor invites you to sit with her. <i>“Tell of stars?”</i>");

	processTime(2);
	//set save flag
	flags["ULA_SAVED"] = 1;
	//[Stars] [Leave]
	clearMenu();
	addButton(14,"Leave",leaveAfterBelt);
	addButton(0,"Stars",stayAndStarsTell);
}

//[Leave]
public function leaveAfterBelt():void
{
	clearOutput();
	showCaveUla();
	output("You sigh. <i>“I don’t have time.”</i>");
	output("\n\n<i>“Understand.”</i> The Korgonne drops back on her ass, sprawling, hypothermia seemingly forgotten. <i>“You save, though. Maybe...”</i> The faint sound of her tail slapping into the wall drums excitedly. <i>“Maybe come Korg’ii Hold? Talk visit!”</i> She bounds up onto her hindlegs, eyes the size of dinner plates shining in excitement. <i>“Secret code! <b>One awoo in top sparklehole! Third from right.</b>”</i> She takes your hand in her chilly paws and squeezes, pulling it up to kiss the back of it.");
	output("\n\nThe cave suddenly feels a bit warmer...");
	output("\n\n<i>“Remember! Sparklehole! Three from right, topdeck!”</i> Bouncing about, the dog-girl lets you go to pump her fist in the air. <i>“Such kiss! Wow!”</i> She spins and totters out into the snow, suddenly unfazed by the cold.");
	output("\n\nYou’re left alone, secure in the knowledge that you should “awoo” into a specific “sparklehole,” should you encounter one.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Stay]
public function stayAndStarsTell(inVillage:Boolean = false):void
{
	clearOutput();
	showCaveUla();
	if(!inVillage)
	{
		output("<i>“Sure.”</i> You settle in next to the cold Korgonne");
		if(pc.isTaur()) output(", trying not to trample her as you settle your haunches into place");
		else if(pc.isNaga()) output(", careful not to bump her over with a stray coil as you wrap yourself into place");
		else if(pc.isGoo()) output(", carefully not to let your gooey body ooze into her as you spread out for comfort");
		else output(", careful not to slip on the slick floor");
		output(". ");
		if(pc.isBimbo()) output("She’s so cute! You barely stop from pinching her fuzzy little cheeks and kissing her. This is going to be fun! Like talking to a big, fuzzy stuffed animal that also has enormous knockers and super pretty lips!");
		else output("She might resemble a fluffy little stuffed animal, but you can pick up on a whiff of next-level pheromones now that you’re this close. The girl’s got pussy-scent stronger than a New Texan cow-girl. A few moments pass while you breathe heavily, sampling its every flavor.");
	}
	else
	{
		output("<i>“So... the stars, and space...”</i>"); 
	}

	output("\n\nLeaning close, ");
	if(flags["MET_ULA"] != undefined) output("Ula");
	else output("the Korgonne");
	output(" licks her cyan-blue lips and glances toward the entrance, suddenly unsure. After a second of indecision, she straightens her little shoulders and faces you. <i>“");

	if(!korgiTranslate())
	{
		if(inVillage) output("Space");
		else output("Aliens");
		output(" new. Never seen.”</i> A paw gingerly extends toward your [pc.face].");
	}
	else output("\n\n<i>“I don’t understand space. It’s too vast and strange to comprehend.”</i> A paw gingerly extends toward your [pc.face].");

	output("\n\nYou let it. <i>“Really?”</i>");

	output("\n\nA shy nod is the answer. <i>“");
	if(!korgiTranslate()) output("Keep inside. Clan Chief not trust, so run away.");
	else output("We keep inside, away. Besides, the Chief doesn’t trust me to go out on my own, so I have to run away just to see anything new.");
	output("”</i> That gentle touch morphs into a sharp poke at your ribs. <i>“");
	if(!korgiTranslate()) output("You talk! Tell of stars. Promised!");
	else output("Now talk! Tell me about the stars... You promised!");
	output("”</i> The sharp green glare cuts harder than a mining laser.");

	output("\n\n<i>“");
	if(pc.isBimbo()) output("You got it, toots!");
	else if(pc.isBro()) output("Fine.");
	else output("Okay!");
	output("”</i> You lean back, rubbing your chest where her clawed fingertip did its best to prick you. <i>“Where to start...”</i>");
	output("\n\nSettling down, the rambunctious dog-girl grabs your hand and examines it while she waits, working your fingers individually. Sometimes she pokes you, gently this time, not wanting to break your [pc.skinNoun]. The pads on her fingers");
	if(!pc.hasArmFlag(GLOBAL.FLAG_PAWS)) output(" tickle");
	else output(" match up nicely with your own, though hers are thicker, made plush by a life of good food and idleness");
	output(".");

	output("\n\nYou’re tempted to luxuriate in the silent attention, but you suppose a little talking wouldn’t hurt. ");
	if(!korgiTranslate()) output("Maybe you’re the extra translation work that will improve the algorithms a bit. Right now she sounds a bit like a cave-dweller from an old holo.");
	else output("Since upgrading the translator, it’s much easier to understand her. No more cave-man conversations for you two!");
	output(" Clearing your throat, you lead off with a basic explanation of space travel - ships, and how you need one to escape the planet.");
	if(!pc.isBimbo()) output(" Here and there, you stop yourself to clarify points, knowing your listener won’t be familiar with even the most basic terminology.");
	else output(" It’s super complicated, so you explain it in really simple terms. It’s way easier to talk like that anyhow. Easier to keep from stumbling over your words or getting distracted by how your listener’s titties move when she breathes.");

	output("\n\n");
	if(flags["MET_ULA"] != undefined) 
	{
		output("Ula is a fabulous student");
		if(flags["ULA_STARTALK"] != undefined) output(". No matter how many times you have this conversation, she’s always happy to hear your tales");
	}
	else output("The Korgonne is actually a pretty good student");
	output(". While her eyes may be roving <i>everywhere</i>, her ears always pivot to listen to your voice directly. She rarely interrupts, and when she does, it’s with a soft squeeze and quiet voicing of, <i>“");
	if(!korgiTranslate()) output("Question?");
	else output("May I ask a question?");
	output("”</i> After the tenth such query, you notice that she’s getting more handsy. Instead of curiously discovering what an alien feels like, she’s stroking your bicep and forearm, kneading the muscles below in awe");
	if(pc.tone < 20) output(", however petite they may be");
	output(".");

	if(!inVillage)
	{
		if(pc.isTreated()) output("\n\nThe fragrant scent of feminine arousal is building in the air like cloying perfume. You flex for her and sniff, smiling inwardly when the cloud of arousing pheromones thickens perceptively. The little snow-mynx is seriously turned on! So are you... maybe more than normal, but who cares? You’re pretty much always horny.");
		else 
		{
			output("\n\nThe cave is really warming up with two active bodies inside, humid and almost passably warm. ");
			if(flags["MET_FEMKORGONNE"] != undefined) output("The scent of aroused Korgonne tickles your nose, indescribably different from the ones you’ve encountered in the wild");
			else output("An indescribable scent tickles your nose, stronger the closer you get");
			output(". Shoulder to shoulder, she’s easy to smell... and quite pleasant, you admit.");
		}
	}
	output("\n\n<i>“Wow,”</i> ");
	if(flags["MET_ULA"] != undefined) output("Ula");
	else output("the woman’s");
	output(" awestruck voice whispers.");
	output("\n\nWere her thighs always spread so wide?");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Such journeys,");
	else output("You’ve had such incredible journeys,");
	output("”</i> the dog-girl grows, leaning into your arm, ");
	if(!inVillage && flags["ULA_SAVED"] == 2) output("coat-covered");
	else output("fluffy");
	output(" breasts pressed into your arm. She clings on tight. <i>“");
	if(!korgiTranslate()) output("Dangerous. Beautiful.");
	else output("The danger you’ve faced, and the beauty you’ve seen.... Wow.");
	output("”</i> Her tongue hangs out over a an icy bottom lip after the last word, panting quietly.");

	if(!inVillage)
	{	
		if(flags["ULA_SAVED"] != 2) 
		{
			output(" Erect nipples rub against your [pc.skinFurScales].");
		}
		else output(" Firm points rub against you, even through the thick hides of her jacket.");
	}
	output(" <i>“");
	if(!korgiTranslate()) output("You good [pc.manWoman]. Much saving, science-talking.");
	else output("You’re a good [pc.manWoman]. Doing all that, fighting pirates and talking about such strange sciences.");
	output("”</i>");
	if(!inVillage)
	{
		output(" Nosing into your neck, the lusty Korgonne reaches ");
		if(pc.legCount > 1) output("between your [pc.legs]");
		else output("down to your loins");
		output(". <i>“My thanks-having.”</i>");
		output("\n\n<i>“Oh.”</i> You stiffen");
		if(pc.hasCock()) output(" in more than one way");
		output(". <i>“My pleasure.”</i>");
	}

	flags["ULA_STARTALK"] = 1;

	if(!inVillage)
	{
		//Crotchless.
		if(!pc.hasGenitals() || pc.totalVaginas() <= pc.blockedVaginas())
		{
			output("\n\nThose thick fingers wriggle around but find nothing. A few awkward seconds of groping stretch on before the Korgonne girl pulls back, confused. <i>“No funhaving parts?”</i>");
			output("\n\n<i>“Yeah...”</i> you admit.");
			output("\n\n<i>“Huh. You weird. Fun-weird, but fun.”</i> Coy delight spreads across her features. <i>“No tempt. Wow! Such relief.”</i> Her tail waggles playfully. <i>“Come visit, Korg’ii Hold. More talks. Safe. You want secret code?”</i>");
			output("\n\nYou nod.");
			output("\n\n<i>“<b>Find sparklerock, awoo in top sparklehole, third from right.</b> I tell whole village you savior.”</i> She kisses you on the nose. <i>“I tell tale of good alien. Very good, weird alien.”</i> Prancing toward the cave’s entrance, the dog-girl giggles nervously. <i>“So weird-fun! Thanking last time! Farewelled!”</i> She spins and totters out into the snow, suddenly unfazed by the cold.");
			processTime(45);
			pc.lust(33);
			clearMenu();
			addButton(0,"Next",mainGameMenu);
		}
		//Genitals
		else
		{
			output("\n\nThose thick fingers ");
			if(!pc.isCrotchExposed()) output("wriggle into your [pc.lowerGarment] and ");
			output("brush your ");
			if(!pc.hasCock()) output("pussylips");
			else output("[pc.cockHeadBiggest]");
			output(" with slight, awestruck motions. Disbelieving gasps warm your neck as the hand slithers ");
			if(!pc.hasCock()) output("lower");
			else output("deeper");
			output(", exploring every inch with rapt attention. The touches are inexpert, questing. You get the impression she’s never done something like this before. It still feels good - better than good, in fact. Maybe it’s the intimateness of the situation, the knowledge that it’s just you and this lone Korgonne, seeking a moment of comfort in a cold and joyless wasteland....");
			output("\n\n...Maybe it’s that scent wafting up from between her legs. If this goes on much longer, you’re going to lose control.");
			processTime(45);
			pc.lust(33);
			clearMenu();
			//[Stop] [Fuck]
			addButton(0,"Stop",stopKorgiPlay);
			addButton(1,"Fuck",ulaFuckRouter);
		}
	}
	else
	{
		output(" Cuddling up next to you, Ula relaxes. <i>“");
		if(!korgiTranslate()) output("Other talks?");
		else output("Wanna talk some more?");
		output("”</i>");
		processTime(20);
		pc.lust(10);
		ulaTalkMenu();
		addDisabledButton(0,"Stars/Space","Stars/Space","You just told her about this.");
	}
}

//Stop
public function stopKorgiPlay():void
{
	clearOutput();
	showCaveUla();
	output("You gently pull her hand away, breathing hard. <i>“No.”</i>");
	output("\n\nThe Korgonne scampers back, shaking like a leaf. Her thighs are slick with moisture, fur fragrant with that maddening scent. She balefully glares at her palm, fiery emerald eyes threatening to bore straight through. <i>“Sorry. Too excite.”</i> A pitious whimper emerges, followed by a whisper: <i>“Too excite...”</i>");
	output("\n\n<i>“It’s okay,”</i> you nonechalantly explain. <i>“Really. I just ");
	if(pc.isNice()) output("don’t wait to take advantage of you");
	else if(pc.isMischievous()) output("don’t handle cold very well. Wouldn’t want a pretty thing like you to see me all shrunken from the cold.");
	else output("don’t want to be responsible for deflowering you, cute as you are.");
	output("”</i>");
	output("\n\n<i>“Oh.”</i> The Korgonne makes for the door, curled tail drooping. After a moment of thought, she turns back. <i>“Thanks... savinged me.”</i> Hey eyes go wide at the sight of your ");
	if(pc.hasCock()) output("exposed boner, as if seeing it for the first time. It’s still hard. Harder than before actually");
	else output("slippery slit, as if seeing it for the first time. It’s still wet. Wetter than before actually");
	output(", now that you can see her cunt drooling. <i>“Still like?”</i>");

	output("\n\nIt takes every ounce of your willpower to keep from grabbing her and shoving her face into your crotch, but you manage. <i>“Still like.”</i>");
	output("\n\nThe dog-girl blushes so strong her light blue lips and nipples tint purplish in the middle. <i>“Then come Korg’ii Hold. Talk visit.”</i> She wiggles her fingers hopefully. <i>“Maybe touch visit?”</i> Bouncing on her hind legs, the dog-woman bites her lips, and the smell thickens. <i>“Secret code! <b>One awoo in top sparklehole. Third from right.</b>”</i> She squirms in place, undecided. At the last second, she darts forward to plant a kiss on your ");
	if(pc.hasCock()) output("[pc.cocks]");
	else output("[pc.vaginas]");
	output(". <i>“Remember sparklecode! Visit! Share warm!”</i> She spins and totters out into the snow, suddenly unfazed by the cold.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function ulaFuckRouter():void
{
	if(pc.hasCock()) korgiCockFuck();
	else ulaCaveLesbo();
}

//Cave Fuck (Sappho-Doggo)
public function ulaCaveLesbo():void
{
	clearOutput();
	showCaveUla(true);
	output("<i>“More,”</i> you pant, [pc.vaginas] wet enough to melt a cave of your own into the ice.");

	var p:int = pc.pickUnblocked();
	//Treated no new pg:
	if(pc.isTreated()) 
	{
		output(" Vaguely-minty fuck-scent fills your sinuses, and still, you sniff the air, letting her hyper-powered pheromones grab hold of your brain and drag it between her legs. You ");
		if(pc.wetness(0) < 3) output("moisten her snow-wettened");
		else if(pc.wetness() < 5) output("soak her");
		else output("drench her");
		output(" fingers with [pc.girlCum]. <i>“You smell so good. I want...”</i> You gulp down a mouthful of saliva. <i>“...I want to taste your cunt.”</i> Quivering, you change your mind. <i>“I need to eat your cunt.”</i>");
	}
	//HasMuzzle
	else if(pc.hasMuzzle())
	{
		output(" Vaguely-minty fuck-scent fills your sinuses, and still you sniff the air. There’s something strange about it the way it reaches into your brain and flips switches you didn’t even know existed. You drench yourself, slipping into a strange kind of heat... only, you don’t want to be bred. You just want pussy. Your own pussy, her pussy, whatever. You want to stuff your snout into a quim and lick until she’s forced to do the same, creating an endless cycle of cunt-obsessed oral. <i>“You smell soooo good!”</i>");
	}
	//Normal
	else output(" Vaguely-minty fuck-scent tickles your sinuses as you sniff the air, savoring the arousal freely leaking from the eager korgonne’s crotch. She’s so deliriously wet that the air itself is humid with pussy. Every breath makes you wetter in response, hotter and hornier, more willing to lean into her crotch and while away the night happily licking. <i>“Your pussy...”</i> You pause to take a deep breath before continuing, juicing all over her fingers. The thought is forgotten. <i>“The pheromones are so strong!”</i>");

	output("\n\nThe dog-girl pulls away, staring at her soggy paw in horror. The added distance from her cloying cunt brings you a small measure of clarity... and a longing for its return. It looks as if she’s about to flee. <i>“Sorry!”</i>");

	output("\n\nYou beckon for her to come back. <i>“Please. Don’t leave.”</i>");

	output("\n\n<i>“But... my breed-scent.”</i> The horny fluffball squirms, thighs pressed together as if she could somehow contain the liquid lust that stains her fur. <i>“Strong.”</i> She hugs herself and looks down. <i>“Only girl who falls for own breed-scent. Others get so wet, keep calm.”</i> She jabs a thumb into her tits");
	if(flags["ULA_SAVED"] == 2) output(", compressing the jacket you gave her");
	output(". <i>“Stupid. Pussy-stupid. Belong alone, in home-room.”</i>");

	output("\n\n<i>“Nooo,”</i> you whine, crawling forward, modesty forgotten");
	if(!pc.isCrotchExposed()) output(", [pc.crotchCovers] left on the ground behind");
	output(". <i>“Look at how horny I am.”</i> You reach out for her thigh and stroke it, feeling the watery-slickness of her arousal slipping through your knuckles on drenched fur. <i>“I... I need your help now.”</i> Shuddering, you lean closer to her crotch, nostrils flaring to drink in her dizzying scent. <i>“I need your pussy so bad.”</i> The pudgy lips flush purple as you breathe on them. The clit visibly swells, glistening, promising to taste as lovely as it smells. <i>“Help.”</i>");
	output("\n\nThe puppy-girl stares down, eyes flicking back in forth in a panic. You note that she doesn’t back away. She doesn’t dare move, not with your [pc.lipsChaste] hovering next to her slit.");
	output("\n\n<i>“Please,”</i> you exhort, digging your fingertips into her thighs to hold her in place. <i>“Please?”</i>");
	output("\n\nThe dog-girl shudders. Strings of clear juices drool from her cyan slit. They smell like heaven. <i>“I... need... too,”</i> she whimpers, stepping forward, pressing her puss against your face, clit bumping your nose. Thick-lipped folds slide over your mouth, spread by pressure to exposed a dripping-wet tunnel. <i>“Want... tongue?”</i> The korgonne looks confused. <i>“Pups normal... but alien tongue. Inside!”</i> Her nose wrinkles. <i>“Pussy too! Pussies good-smell together!”</i>");
	output("\n\n<i>“Yeah,”</i> you mumble into her cunt. <i>Pussies smell real nice.</i> Reaching behind her, you grab her by the ass, delighted to discover that it’s as plush and squishable as her tits. Kneading her cheeks, you shove her into your face so hard");
	if(pc.hasMuzzle()) output(" that your muzzle slips inside, stretching her hymen but not quite breaking it");
	output(". A thrust of your tongue makes her whimper and quiver.");
	processTime(20);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",korgiCavePussPart2);
}

public function korgiCavePussPart2():void
{
	clearOutput();
	showCaveUla();
	var p:int = pc.pickUnblocked();
	output("<i>“Warmed licks!”</i> the korgonne cries.");
	output("\n\nStrength vanishes from the leaky bitch’s legs, dumping her pussy-first onto your face. Her weight bowls you over onto your back. You barely avoid cracking your head on the floor, but any complaints are swallowed whole by the electric taste of korgo-girl cunt. It makes your head swim and your snatch");
	if(pc.totalVaginas() > 1) output("es");
	if(pc.wettestVaginalWetness() < 3) output("dribble");
	else if(pc.wettestVaginalWetness() < 4) output("soak");
	else if(pc.wettestVaginalWetness() < 5) output("drip puddles onto the floor");
	else output("gush puddles onto the floor");
	output(". <i>“I love thish tashte!”</i> you cry, muffled by cunt and ambrosial juices.");

	output("\n\nSo enmeshed are you in the act cunnilingus that you only notice the korgonne moving around by the shifting of her clit. Instead of being high on your face, it rotates down near your chin. A second later, you feel fat, squishy tits pressing down on your [pc.belly] and a shock of virulent pleasure that makes your hungry mouth seize in ecstasy. <i>“Ahhh!”</i>");
	if(pc.hasMuzzle()) output(" Your ecstatic scream stretches her out around your snout, making the korgonne whimper back into your twat in sympathetic lust.");

	output("\n\nWas that an orgasm? It felt so good... so blissfully pleasant... but you still want her cunt. You can’t get enough of it. Right now it’s your favorite thing in the whole universe, a simmering delta of sinfully minty delights. Kissing it, you feel like its quivers are kissing you back, the shaking, climaxing korgonne expressing her shared affection through the sloppy, oozing girl-jizz that floods your maw.");

	//2cunts'
	if(pc.totalVaginas() == 2 && pc.blockedVaginas() == 0) output("\n\nA soaked finger slips into your second slit while the fuzzy alien’s mouth burrows deeper into the first, forcing you to new heights of pleasure. Another finger slips in a second later. Her digits may be short, but they’re delightfully thick, spreading you wide open as they skillfully find [pc.clits] to tease.");
	//3Cunts
	else if(pc.totalVaginas() > 2 && pc.blockedVaginas() == 0) output("\n\nSoaked fingers slip into your other slits while the fuzzy alien’s mouth burrows deeper into the first, forcing you to whole new heights of pleasure. Two more fingers join them a second later. Her digits may be short, but they’re delightfully, thick, spreading you wide open as they skillfully find [pc.clits] to tease.");
	//1cunt only
	else output("\n\nThe fuzzy alien’s mouth burrows deeper into your [pc.vagina " + p + "], forcing you to new heights of pleasure. Seconds later, a finger joins it. Her digits may be short, but this one is delightfully thick, spreading you wide open as it pumps in and out alongside her cunt-drunk, canine tongue.");
	//Merge no new PG!
	output(" You can scarcely believe how <i>good</i> it feels, how impossible it makes it to think about anything but keeping your tongue moving, sliding in a feedback loop of endless pleasure...");
	processTime(15);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",korgiCavePussPart3);
}

public function korgiCavePussPart3():void
{
	clearOutput();
	showCaveUla(true);
	output("For the next half-hour, you sixty-nine with the once-chilled alien, sharing warmth and wetness in equal measure. Counting the orgasms is impossible. One bleeds into the next with such suddenness that you feel like you spent more time black-out-blissed than cogent of her pussy’s texture. You’re left with little more than breathless exhaustion and an intimate familiarity with the fucked-out dog-girl’s cunt.");
	output("\n\nStill, you don’t quite feel satisfied. It’s more a sense of being burned-out, like your body got so amped up on her pheromones that it was forced to shut down before your mind broke with desire. The tawny fluffball snuggles against you. She must feel the same, from the exhausted look in her eyes. She’s feels nice, snuggled up against you. For once, you realize she smells more like your cunt than her own. Maybe you smell like her.");
	output("\n\nSmiling weakly, you fall asleep, cuddling tight to the alien.");
	processTime(40);
	for(var x:int = 0; x < 14; x++) { pc.orgasm(); }
	IncrementFlag("ULA_SEXED");
	clearMenu();
	addButton(0,"Next",korgiCavePussPart4);
}

public function korgiCavePussPart4():void
{
	clearOutput();
	showCaveUla();
	output("You wake to the feeling of the korgonne girl trying to disentangle herself from you. <i>“Hey,”</i> you whisper, smiling happily. <i>“Was it good for you?”</i>");
	output("\n\nThe dog-girl’s blush reaches all the way to her lips and nipples. She licks her lips, eyes flicking to your pussy, then nods rapidly.");
	output("\n\n<i>“Good. I had fun too.”</i>");
	output("\n\nThat sets her off. The busty canine pumps her fist in the air and spins around in pure happiness. When she turns back, she’s smiling wide enough to show off a set of sharp canines. <i>“Alien first girl-warm share! Delights-much filling!”</i> She drops to her knees and kisses your lips, softly nipping your nose after. <i>“First save, then teach sexings. You truly best alien. Elders wrong. Aliens nice! So much know!”</i>");
	output("\n\nYou kiss her back, then struggle up onto your elbows. <i>“Glad to be of service.”</i>");
	output("\n\n<i>“Maybe... you come visit Korg’ii hold? Teach more. Help see nice?”</i> She sniffs her fingers, then shudders. <i>“Share more warms?”</i>");
	output("\n\n<i>“Sure,”</i> you answer, too fucked out to care. Sounds like fun.");
	output("\n\n<i>“Yays!”</i> Bouncing back, the Korgonne hops in the air. <i>“Secret code telling! <b>One awoo in top sparklehole! Third from right.</b>”</i> She takes your hand in her slippery paws and squeezes. <i>“Remember! Sparklehole! Three from right, topdeck!”</i> Still bouncing about, the dog-girl turns away and totters out into the snow, seemingly unfazed by the cold. <i>“Tell all! Alien joy!”</i>");
	output("\n\nYou’re left alone, secure in the knowledge that you should “awoo” into a specific “sparklehole” if you wish to see the friendly korgonne once more. Perhaps her whole tribe is friendly?");
	processTime(35);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Cave Fuck (Cock Path)
public function korgiCockFuck():void
{
	clearOutput();
	showCaveUla(true);
	var x:int = pc.cockThatFits(ulaCapacity());
	if(x < 0) x = pc.biggestCockIndex();

	output("<i>“More,”</i> you pant, [pc.cocks] hard enough to pound through solid ice.");

	//Treated no new pg:
	if(pc.isTreated())
	{
		output(" Vaguely-minty fuck-scent fills your sinuses, and still you sniff the air, letting her hyper-powered pheromones chemically ");
		if(pc.inRut()) output("deepen your");
		else output("trigger an artificial");
		output(" rut. You dribble pre over her gently exploring paws while your chest heaves. <i>“Your pussy smells divine. Such pheromones...”</i> A full-body quake ripples through you, culminating in a throb hard enough to make the dog-girl nearly lose her grip. <i>“I need more than a paw.”</i>");
	}
	//HasMuzzle
	else if(pc.hasMuzzle())
	{
		output(" Vaguely-minty fuck-scent fills your sinuses, and still you sniff the air. There’s something primal about it that compels you to continue, every breath instinctively guiding your nose toward the korgonne’s crotch until you’re fighting to keep yourself from burrowing into her lap. <i>“Your scent...”</i> She couldn’t miss the sound of your bestial snuffling if her ears were packed full of snow. The dog-girl’s cunt has your full attention, mind and cock");
		if(pc.cockTotal() > 1) output("s");
		output(" alike. <i>“...so good. How can you smell so good?”</i>");
	}
	//Normalboi
	else 
	{
		output(" Vaguely-minty fuck-scent tickles your sinuses as you sniff the air, savoring the fuck-scent freely leaking from eager korgonne’s crotch. Every breath of it is a humid caress acros your glans. Every whiff makes the air seem warmer and your cock");
		if(pc.cockTotal() > 1) output("s");
		output(" warmer. <i>“Your pussy....”</i> You pause to take a deep breath before continuing. Pre spills into her paw in response. <i>“...pheromones?”</i>");
	}
	//Merge
	output("\n\nThe dog-girl pulls away, staring at her soggy paw in horror. The added distance from her cloying cunt brings you a small measure of clarity... and longing for its return.");
	if(pc.balls > 0)
	{
		output(" Your [pc.balls] churn");
		if(pc.balls == 1) output("s");
		output(" in anticipation.");
	}
	output(" It looks as if she’s about to flee. <i>“Sorry!”</i>");

	output("\n\nYou beckon for her to come back. <i>“Please. Don’t leave.”</i>");

	output("\n\n<i>“But... my breed-scent.”</i> The horny fluffball squirms, thighs pressed together as if she could somehow contain the liquid lust that stains her fur. <i>“Strong.”</i> She hugs herself and looks down. <i>“Only girl who falls for own breed-scent. Others get so wet, keep calm.”</i> She jabs a thumb into her tits");
	if(flags["ULA_SAVED"] == 2) output(", compressing the jacket you gave her");
	output(". <i>“Stupid. Pussy-stupid. Belong alone, in home-room.”</i>");
	output("\n\nYou look on ");
	if(!pc.isAss()) output("in sympathy. No wonder she started putting the moves on you; as soon as she got a little excited, the pheromones started a feedback loop.");
	else output("in fake sympathy. At least that explains why how this shy girl transformed into a simpering puddle of lust");
	output(". You know how she feels, come to think of. Just looking at her, you can feel the urge rising inside you, begging you to take her. Your nostrils flare as you try to think of what to say. <i>“It’s... not safe to go out like that. Who knows what kind of monster you’d run into?”</i>");
	output("\n\nThe puppy-girl sighs, in resignation, dropping to her knees. One hand goes to her chest, roughly squeezing the fattened orb. The other dibs between her legs, crudely rubbing at a blue-lipped entrance. <i>“R-right. But... can’t... want...”</i> She licks her lips, eyes fixated on your cock. <i>“Want pups.”</i> Falling on all fours, she crawls closer, tail curled up and wiggling with her juicy haunches. <i>“Want alien pups. Nice alien’s pups.”</i>");
	output("\n\nYou attempt to hold yourself back. She’s probably a virgin, and she obviously doesn’t know any better. The way she smells right now, she’d get pregnant just from looking at a dick... and she’s staring at yours right now. You subconsciously shift to better present it, body operating on instinct and raw desire without much input at all from your brain. <i>“Wait... uh.”</i>");
	output("\n\nThe furry vixen bends low to drag her tits across the ice, sensuously drawing closer");
	if(flags["ULA_SAVED"] != 2) output(", hard nipples all but digging furrows into the freeze");
	output(". Her eyes are liquid pools of lust, so earnestly wanton that you can see your dick reflected in the moist curve of her corneas.");
	output("\n\n<i>“You should...”</i>");
	output("\n\nA tongue rolls out, long and slick. Drool spatters your thighs.");
	output("\n\n<i>“Should... uh... wa-”</i>");
	output("\n\nWarmth devours you.");
	processTime(20);
	pc.lust(60);
	clearMenu();
	addButton(0,"Next",korgiCockFuck2);
}


public function korgiCockFuck2():void
{
	clearOutput();
	showCaveUla(true);
	var x:int = pc.cockThatFits(ulaCapacity());
	if(x < 0) x = pc.biggestCockIndex();

	output("You slide bonelessly onto your back as the tension is sucked from your body. Frenetic licks and slobbery kisses work their way along [pc.oneCock] unceasingly. Soft paws, wet from cunt, pre-cum, and melted snow join in explore the space around your [pc.knot " + x + "]. It all began so artlessly, but with each moment spent sealed around your dick, the proud puppy learns new ways to make you gasp. Her tongue curiously ventures over the musky skin, seeking out pockets of virile flavor, coaxing your pre to channel into the curved middle where she can hold and savor it.");
	output("\n\nYou nearly cum to the sound of her lurid gulp.");
	output("\n\nAnd then she swivels around, muzzle suddenly a vortex of pleasure. Furry thighs land to either side of your ");
	if(pc.tallness < 60) output("head");
	else
	{
		output("chest");
		if(pc.biggestTitSize() >= 4) output(", splayed nearly into a split by the width of your jiggling boobs");
	}
	output(". Fat, cyan cuntlips hover above your face, and that minty, deliriously erotic smell washes over you, tainting every breath with korgonne pussy-musk.");
	output("\n\n<i>“Put pups in hole.”</i> The command is spoken around a cheek full of dick.");
	output("\n\n[pc.EachCock] trembles");
	if(pc.cockTotal() > 1) output(", the one in her maw most of all");
	output(", threatening to go off like a geyser. You’re no medical expert, but with her legs splayed so wide, you’re pretty sure you can see the membrane of her alien hymen stretched thin, waiting to be slowly spread by a gentle lover - or broken in half in a frenzy of bestial breeding. <i>“But");
	if(pc.cockVolume(x) > ulaCapacity()) output(" I’m too biiii");
	output("-”</i>");
	output("\n\n<i>“No. Pups in hole.”</i> She silences you by dropping her hips and drowning you in her sodden slit, watery slickness pouring unrestrained into your maw. When she lifts off a minute later, everything reeks of minty quim. Your [pc.face] has been claimed by the lust-lost tribal girl, and every breath you take is swamped in a pheromonal wonderland.");
	if(pc.balls > 1) output(" It feels like your [pc.balls] are going to boil over.");
	output("\n\nYou dive upward to suck greedily upon her clit. You want that cunt more than anything. You need it in your life: on your face, on your dick, filled with seed. Still, you make one last token attempt to moderate her impulses. <i>“Let me eat you out. I’ll suck your clit till you pass out and swallow your cuntjuice till my mouth smells more like pussy than y-”</i> Your tongue stabs out for another lick, unwilling to go without the exotic flavor or korgonne cunt a minute longer.");
	output("\n\nThe warm, wet sheath around your [pc.cock " + x + "] vanishes, leaving you to twitch in cold air. <i>“Nooooooo! Thought you nice alien?”</i> the voice is delirious, and that gorgeous, blue cunt vanishes from view. Your short-stacked lover pops into view a second later, stuffing her nose against the side of your face and licking her flavor from your cheek. <i>“Please,”</i> she pants. <i>“Want you. Nice alien. Strong alien.”</i> Her tits weigh heavily on your ");
	if(pc.biggestTitSize() >= 1) output("own");
	else output("chest");
	output(". <i>“Deserve puppies.”</i> She shudders and squeezes your dick so hard you nearly spurt. <i>“Deserve whole clan of puppies.”</i>");
	output("\n\nStars, that sounds appealing. In this moment, you’d like nothing better than to bust a ");
	if(pc.perkv1("'Nuki Nuts") > 0) output("swollen ");
	else if(pc.ballFullness >= 90) output("backed-up ");
	else if(pc.cumQ() >= 9000) output("womb-flooding ");
	output("nut in this bitch. <i>“Yeaaahhh...”</i>");
	output("\n\nNo sooner is the word out of your mouth than the korgonne is shifting on top of you, hips rolling feverishly in an attempt to slide your [pc.cock " + x + "] inside.");

	//2Big
	if(pc.cockVolume(x) > ulaCapacity())
	{
		output("\n\nShe’s definitely a virgin. The first attempt does little more than smash her puffy puss into your [pc.cockHead " + x + "], futilely dragging the lust-engorged lump of her clit past your pre-weeping urethra. The second attempt fares no better. Growling in disatisfaction, she rocks back and forth, straining her tight cunny against your impossibly large cockhead, trying to wedge herself open far enough to take <i>any</i> part of you, even if it’s only the first inch of pole.");
		output("\n\n<i>“Ahp!”</i> the dog-girl gasps as she succeeds in ripping her hymen wide open, sinking a few millimeters in. She’s so tight. It feels like her clenches are going to pinch off your [pc.cockHead " + x + "]. Streamers of korgonne girl-cum stream down your length, but no amount of effusive ejaculate will allow her virginal tunnel to take your obscene tool any further. <i>“Big!”</i>");
		pc.cockChange();
		output("\n\nPleasure forces deflowered dog-girl to arch her back, leaning so far that her hair touches her tail, thrusting her breasts at your face. They bounce and clap against each other. Drops of fuck-warmed snowmelt rain over your [pc.chest] as the korgonne cums herself silly, hindpaws reaching back to grip you, smearing pussyjuices all the way down to your ");
		if(pc.balls > 0) output("[pc.sack]");
		else output("[pc.sheath " + x + "]");
		output(". <i>“Very stroooong! Many pups!”</i>");
		output("\n\nPuppies? You make an effort to hold yourself back, but she smells so good. Her feet squeeze you so wonderfully, milking you into her, fanning the compelling breed-scent into the air until your body obliges her request for cum with orgasmic clenching. <i>“I’m cumming!”</i> You pride yourself on the warning, futile though it might be.");
		output("\n\n<i>“Happiness! Give puppies.”</i> She grabs your ears and tugs your lips to a tit, hips rolling. <i>“Warm... Good... Motherness!”</i> Eyes closing, her tongues dangles stupidly out of her mouth as her body seizes. The cum-hungry tunnel flutters confusedly, stretched too full yet mostly empty.");
		if(pc.cumQ() < 8) output(" Nothing more than dribbles slips out, but she doesn’t seem to mind. She climaxes from the feeble [pc.cumNoun]-drops leaking into her passage, folds fluttering to escort the feeble fluids closer to her aching eggs.");
		else if(pc.cumQ() < 250) output(" The [pc.cumNoun]-shots fire in deep. Every lance makes her feel warmer and wetter, squelching and hot. You have no doubt that some is slipping upward into her womb, journeying to those aching eggs.");
		else if(pc.cumQ() < 10000) 
		{
			output(" She moans at the feeling of your thick, virile pumps of [pc.cumNoun]. [pc.cumVisc] blobs slip out of her stretched lips");
			if(pc.hasKnot(x)) output(" to shine your straining knot");
			output(". Whole streams of it must be pouring into her womb, ready to baste her aching eggs.");
		}
		else 
		{
			output(" Nothing could prepare her for the near-biblical flood of [pc.cumNoun] pouring into her womb, filling every crack and crevice. Rivers spray out around your [pc.cockHead " + x + "] as her belly bulges obscenely. She already looks like a mother");
			if(pc.cumQ() >= 25000)
			{
				output(", and you’ve barely begun to breed.");
				output("\n\n<i>“You asked for it,”</i> you pant, roughly groping a tit, squirting in endless passion. You’ve long since seeded every inch of exposed womb, yet your body is far from done, not with her scent so thick in your nose, grabbing you by the ");
				if(pc.balls > 1) output("balls");
				else output("cock");
				output(" and milking out thicker, heavier flows. You flood her middle until she’s absolutely spunk-pregnant, the once-virgin korgonne so fattened that the force of your shots inflating her belly theatens to roll her to the side");
			}
			output(".");
		}
		output("\n\nPlush lips press against yours as she relaxes, softly this time. The fire has gone out of the fluffy bitch, quenched by");
		if(pc.cumQ() >= 10000) output(" a lake of");
		output(" your cum. She nuzzles into you, tired arms on your shoulders");
		if(!pc.hasKnot(x))
		{
			output(" as she slowly drags herself off your dick.");
			if(pc.cumQ() >= 10000) output(" A river of spent jizz sprays from her uncorked cunt onto your [pc.belly].");
		}
		output(" <i>“Wow.”</i> She nuzzles your cheek, then licks your nose. <i>“Many cummies. Alien sex hurt-good.”</i> Her eyes twinkle. <i>“Need practice. Make pussy big for alien-cock.”</i>");
		//[Next] -> Same post-gasm as regular variant (though make sure the knotting variant isn’t referenced)
		processTime(20);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",korgiCockFuck3);
	}
	//Regular - no new PG
	else
	{
		output("\n\nShe’s definitely a virgin. The first two attempts do little more than cause your hypersensitized cock to slide through her folds and slip to the side. The third time’s the charm. Her devilishly tight cunny strains around your [pc.cockHead " + x + "], hymen flexing. She seems like she’s going to take it slow, right up until she grabs your face and stuffs her tongue into your mouth. Plush cyan lips hold you captive while her tongue savors your exotic taste, intermingled with the ripe flavor of her own heated puss. In that moment, her hips scissor downward, splitting her hymen on the altar of your virile masculinity.");
		pc.cockChange();
		output("\n\n<i>“Ah!”</i> the deflowered dog-woman gasps, drooling webs of spit and vaginal lube. She shudders, her hard nipples begging to be tugged. Further down, her tunnel ripples in mixed agony and ecstasy. The fertile folds feel like they’re milking you for how they clench and flutter, and you realize that you’ve already slipped past the point of no return. Even if you pulled out now, you’d cum from the pheromones clogging your nostrils. If she kissed you, you’d give her every sperm in your body and then some.");
		output("\n\n<i>“I’m cumming!”</i> you warn.");
		output("\n\n<i>“Good. Give puppies.”</i> She grabs your ears and kisses you again, hips rolling. <i>“Warm... Good...”</i> Eyes closing, her tongue goes still in your mouth as her body seizes everywhere except the cum-hungry tunnel still clenching down around your ecstatically spurting [pc.cockNounSimple " + x + "].");
		if(pc.cumQ() < 10) output(" Nothing more than dribbles slips out, but she doesn’t seem to mind. She grinds the feeble [pc.cumNoun]-drops throughout her passage, giving your deposit ample opportunity to swim upstream to her aching eggs.");
		else if(pc.cumQ() < 250) output(" The [pc.cumNoun]-shots fire in deep. Every lance makes her feel warmer and wetter, squelching and hot. You have no doubt that some is slipping upward into her womb, journeying to those aching eggs.");
		else if(pc.cumQ() < 10000) 
		{
			output(" She moans at the feeling of your thick, virile pumps of [pc.cumNoun]. [pc.cumVisc] blobs slip out of her stretched lips");
			if(pc.hasKnot(x)) output(" past your straining knot");
			output(". Whole streams of it must be pouring into her womb, ready to baste her aching eggs.");
		}
		else
		{
			output(" Nothing could prepare her for the near-biblical flood of [pc.cumNoun] pouring into her womb, filling every crack and crevice. Rivers spray out around your [pc.knot " + x + "] as her belly bulges obscenely. She already looks like a mother");
			if(pc.cumQ() >= 25000) 
			{
				output(", and you’ve barely begun to breed.");
				output("\n\n<i>“You asked for it,”</i> you pant, grinding against her, thrusting and squirting in endless passion. You’ve long since seeded every inch of exposed womb, yet your body is far from done, not with her scent so thick in your nose, grabbing you by the ");
				if(pc.balls > 1) output("balls");
				else output("cock");
				output(" and milking out thicker, heavier flows. You flood her middle until she’s absolutely spunk-pregnant, the once-virgin korgonne so fattened that the force of your shots inflating her belly theatens to roll her to the side");
			}
			output(".");
		}
		output("\n\nPlush lips press against yours, softly this time. The fire has gone out of the fluffy bitch, quenched by");
		if(pc.cumQ() >= 10000) output(" a lake of");
		output(" your cum. She nuzzles into you, tired arms on your shoulders");
		if(!pc.hasKnot(x))
		{
			output(" as she slowly drags herself off your dick.");
			if(pc.cumQ() >= 10000) output(" A river of spent jizz sprays from her uncorked cunt onto your [pc.belly].");
		}
		else output(" as she wiggles in place, stuck on your knot while still more [pc.cumNoun] pours in.");
		output(" <i>“Wow.”</i> She nuzzles your cheek, then licks your nose. <i>“Many cummies. You best heat-sharer. Not forget.”</i>");
		processTime(20);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",korgiCockFuck3);
	}
}

public function korgiCockFuck3():void
{
	clearOutput();
	showCaveUla(true);
	var x:int = pc.cockThatFits(ulaCapacity());
	if(x < 0) x = pc.biggestCockIndex();

	output("After a few minutes to rest");
	if(pc.hasKnot(x) && pc.cockVolume(x) <= ulaCapacity()) output(", de-knot,");
	output(" and recover, the beaming ball of fluff stumbles up off of you, rubbing her belly. <i>“Alien gave much good!”</i> [pc.CumNoun] drips from between her legs to splatter the floor. <i>“Warm inside. You visit? Give more pups?”</i> She looks to you hopefully, but between the cloud of pheromones and the energy-sapping orgasm, you’re tapped out.");
	output("\n\n<i>“I guess?”</i>");
	output("\n\n<i>“Yays!”</i> Trotting in a circle");
	if(pc.cumQ() >= 25000) output(", her taut tummy wobbling");
	output(", the Korgonne pumps her fist in the air. <i>“Visit Korg’ii Hold. Secret code telling! <b>One awoo in top sparklehole! Third from right.</b>”</i> She takes your hand in her slippery paws and squeezes. <i>“Remember! Sparklehole! Three from right, topdeck!”</i> Bouncing about, the dog-girl spins away and totters out into the snow, seemingly unfazed by the cold. <i>“Tell stories, and give pups!”</i>");
	output("\n\nYou’re left alone, secure in the knowledge that you should “awoo” into a specific “sparklehole” if you wish to see the friendly korgonne once more. Perhaps her whole tribe is friendly?");
	flags["ULA_DEFLOWERED"] = 1;
	IncrementFlag("ULA_SEXED");
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//First Time Dad/Chief Meeting
public function firstTimeKorgHoldMeeting():void
{
	clearOutput();
	showName("KORG\nMEETING");
	currentLocation = "KORGII R10";
	generateMap();
	output("The guards hustle you through winding tunnels and up a spiral staircase hewn from solid stone. In stark contrast to the frigid exterior, it’s nearly as warm as a sauna inside Korg’ii Hold. By the time you climb to the next level, you’re ");
	if(pc.faceType == GLOBAL.TYPE_CANINE) output("panting and ");
	output("sweating. No wonder the korgs you pass are naked, tongues hanging loose from their canine maws to assist their attempts to vent heat. You wipe moisture from your brow as your escort comes to a stop.");
	output("\n\nIntricately worked script and pictographs crawl across a stone door nearly two korgs tall, its surface polished to a mirror finish. For all the tribal banter and savage behavior, it would seem their clan is home to dedicated craftspeople with skill to rival coreward artisans, however primitive their tools.");
	output("\n\nThe bigger of your two guards raps the butt of his spear against the door, then leans to a hole, identical to the hundreds hiding the Hold’s entrance. <i>“Ula’s alien-friend arriving!”</i>");
	output("\n\n<i>“Come. Waiting such times!”</i> a gruff voice answers.");
	output("\n\nThe big one nods to his shorter compatriot, who twists a handle and pushes, swinging the huge monolithic portal back with surprising ease. From the corner of your eye you can spy a set of heavy hinges, polished to the same sheen as the door’s surface. Light from the chamber beyond dazzles your eyes.");
	output("\n\nOnce you adjust to the change in luminosity and uncover your eyes, you’re dazzled by the sheer display of opulence within. Every wall is hewn from whitish stone, the surface worked into carved murals of korgonne heroism. Glowing crystals held aloft by chains of gold cast amber luminance over rocky tapestries, flickering slightly. In one corner, you can see a single armored korg fighting off three frostwyrms single-handedly. In another, a horde of fluffy barbarians riding six-legged bears trample milodans underpaw.");
	output("\n\nFurniture of bone and rock decorates the interior. Fuzzy blankets and plush-looking pillows offer comfort to the otherwise unforgiving furniture. In the center of it all is an enormous throne. It dominates the view, and in its center is the undoubted leader of this tribe of korgonne. The heavyset elder regards you with milky blue eyes and strokes the wispy curls of a beard every bit as white as the rest of his fur. You could sit him down in front of a snow-drift and he’d disappear.");
	output("\n\n<i>“Huh. Thought bigger.”</i> He squints and leans closer. <i>“You alien? You save Ula?”</i>");
	output("\n\nYou nod");
	if(pc.isNice()) output(" and bow. <i>“It was my pleasure.”</i>");
	else if(pc.isMischievous()) output(", puffing up your chest boastfully.");
	else output(". <i>“Indeed.”</i>");

	output("\n\nThe chieftain regards you cautiously. <i>“You thanks having. Many aliens greedy. Cruel.”</i> He gestures to a place on the murals where a small group of Korgonne appear to be fighting with a much larger, better-armed battlegroup. <i>“Kill. Steal. Shatter holds for wall-shines.”</i> He waggles fingers decorated with green gemstones, likely emerald or savicite. <i>“You earn chance.”</i> He nods grimly. <i>“Prove not like others. Show friending, and we friending back.”</i>");
	output("\n\n");
	if(pc.isBimbo()) output("You rush forward to give the big, fluffy dog-guy a hug when the guards grab you by the collar. Well, you’re gonna hug somebody! You round on him and wrap your arms around his straining, muscular back, petting the his head and neck until you hear his tail wagging. <i>“Yay! Friends!”</i>");
	else if(pc.isBro()) output("You extend your hand for a handshake. He stares it. After a minute solid of waiting, you drop your hand and clear your throat. <i>“Uhh... yeah. Friends.”</i> Why can’t they just get with the program and pick up on normal galactic social cues? Ugh. You snort in irritation.");
	else if(pc.isNice()) output("You nod gravely. <i>“I shall.”</i>");
	else if(pc.isMischievous()) output("You nod, trying to hide a smirk at his crude use of language. <i>“Much friending! Very like! Wow!”</i>");
	else output("You nod severely. <i>“Of course.”</i>");
	output("\n\n<i>“Good.”</i> The white-furred elder staggers up to his feet, back cracking innumerable times. <i>“Sleepings times soon.”</i> He waddles past the chairs and tables toward a curtained-off doorway. <i>“Too old for leading. Go cold soon, am reckoning.”</i> Pausing halfway through the curtain, the old dog turns back to fix a keen eye on you. <i>“Behave self. Treat Ula - any korg - badly, you be wishinged for long cold.”</i> The fabric swishes closed.");
	output("\n\nBehind you, the guards shrug and pad off, quietly discussing your anatomy amongst themselves. It would seem <b>you’re now welcome in Korg’ii Hold!</b>");
	//[Next] -> Normal room descript
	processTime(25);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function ulaRoomBonusFunc():Boolean
{
	if(flags["MET_ULA"] == undefined)
	{
		ulaFirstTimeRemeet();
		return true;
	}
	else 
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
		else if(rand(3) == 0) output("\n\nUla is kneeling next to her bed, the surface of which is covered with at least 20 pieces of parchment. Cramped, alien script covers every inch of them. They look like ledges of some kind. She hastily gathers them into a bundle at the sight of you, clearing space on the bed for whatever you might have in mind.");
		else if(rand(2) == 0) output("\n\nUla looms over a dozen different model ships, carefully arranged into a mock battle. Some appear to be pillaged toys from the core, while others are carefully carved from the raw materials available to the korgonne: mostly bone and stone.");
		else output("\n\nUla sits on her beg cross-legged, reading from an ancient-looking Codex. The letters are english, not korgese. She jumps at the sound of you and hastily slips it into a basket. From what you saw, the text looked pretty steamy...");
		addButton(0,"Ula",ulaApproach);
	}
	return false;
}
public function ulaFirstTimeRemeet():void
{
	showUla(true);
	output("\n\nThe familiar form of the korgonne you saved is sprawled out on a cushy-looking bed, naked save for oodles of jangling jewelry and a fat, glossy dildo rammed between her legs. Lips parted mid-moan, she squeaks at your sudden intrusion and rolls ass-over-head over the bed to fall heavily on the floor. <i>“You!”</i> Her tail wiggles happily in the air as she climb back up onto her mattress.");
	output("\n\nYou note the dildo is still firmly clutched in her paw, dripping wet.");
	output("\n\n<i>“You come visit!”</i> Springing off her mattress, the excited ball of fluff and fuck tumbles into you");
	if(pc.tallness < 70) output(", tackling you to the ground");
	else output(", smacking into you. You hold her there for a moment before letting her weight carry you to the ground.");
	output(" Kisses pepper your nose. <i>“Savinged me!”</i> A slick, wet tongue smears across your cheek. <i>“You liking me!”</i>");

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
	pc.lust(33);
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

	output("\n\nThe korgonne shivers, full-body, sending her proportionally enormous tits bouncing and jiggling against one another. Her eyes roll back, and the dildo’s thrusts become distinctly wetter. Flecks of pussy-juice slobber over her thighs. The sheets are a soaked mess. Arching her back, the short, stacked puppy-girl keens high in the back of her throat, fingers scrabbling against a tit, and she cums. She cums so hard that her legs flail, toes reflexively clenching and unclenching.");

	output("\n\nA few droplets of her freely-spilled fluids");
	if(pc.hasCock())
	{
		output(" spatter your aching dick");
		if(pc.cockTotal() > 1) output("s");
		output(" spatter");
		if(pc.cockTotal() == 1) output("s");
		output(" your well-lubed folds");
	}
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
	output(" giggles from her bed, licking her fingers. <i>“");
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
	output("\n\nSmiling gleefully, the dog-girl springs up out of bed and bops a rusty-looking sanitation bot in the corner. It powers up with a clack and a whir, then sets to vaporizing the contaminants from her fur. The sheets");
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

		output("\n\nYou doubt step aside until you agree... <i>“");
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
	output("<i>“God yes,”</i> you pant, stumbling forward into her bed.");
	if(!pc.isCrotchExposed()) output(" Your [pc.crotchCovers] can’t come off fast enough. How fortunate that a second set of hands are there, easing you into nudity.");
	output(" Blood thrums in your ears, your heart hammering, sending volley after volley of cock-expanding blood into your loins, pumping your [pc.cocks " + x + "] into full, proud tumescence. ");
	if(flags["MET_ULA"] == undefined) output("The korgonne princess’s");
	else output("Ula’s");
	output(" belly fur tickles against your [pc.cockHead " + x + "].");

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
		output(" onto her back and take her. Gentleness and care aren’t in the equation, just bestial rutting. You wrinkle your nose, trying to control yourself, to keep yourself from breaking this korgonne princess’s twat in half with the force of your thrusts. It mostly works, right up until you mash your mouth to hers, kissing her feverishly. Her plump, blue lips are soft but press back just as hard. She wants it every bit as badly as you. It feels like torture, not being inside her yet, so you break the kiss to ask, <i>“Ready?”</i>");
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
	if(!korgiTranslate()) output("Give warm! Pups-filling-warm!");
	else output("Give me your cum! Fill me with your heat! Stuff me full of pups!");
	output("”</i>");

	output("\n\nYou grind your crotch against the princess’s soaking-wet loins and bear her down to the bed, smashing her clit down between your bodies until her impassioned requests transform into confused, ecstatic whimpers. You kiss her again, more forcefully, unable to help yourself. Your tongue thrusts into her lips");
	if(pc.cockVolume(x) > ulaCapacity()) output(" as you feed more inches into her snatch, distending her belly further. She’s like a big fuzzy condom, just waiting to be stretched over your dick");
	output(". She tries to kiss you back, but it’s weak and unfocused. Her jaw is slack, the tongue flopping around confusedly as the pressure on her clit overwhelms her nervous system. You guide it with your own, tasting every inch of her drooling maw in the process. From both ends, you spread her open and <i>thrust</i>.");

	output("\n\nPlush softness fills your fingers as your hand settles on a tit, and you squeeze it hard, fingers digging deep into the soft, furred mound. The tip of the dog-girl’s nipple feels as hard as diamond against your [pc.skinNoun]. You briefly consider sucking it, then resume frenching her, availing yourself of her kissable blue lips, letting your hands and loins enjoy her from the neck down.");

	output("\n\nA spasm drags your [pc.hips] back, and primitive instincts command you to thrust in, burying your boner with a girlcum-splattering squelch. Her pussy is everywhere: in every breath, soaking your [pc.legs], staining the sheets, so large in your mind that if you close your eyes you can see its rubbery folds, inviting you to fuck them raw. Now that you’ve started, you can’t stop. Your [pc.hips] bounce back, then slide back in, addicted to the friction shooting up your spine, shocking you with bolts of bliss that seem to make the smell of cunt that much stronger.");

	output("\n\nPadded paws scrabble over your back as the petite dog-woman cums. You can feel it in the fluttering motions of her cunt and the quivering of her thighs more than anything else. The warm dribbles sliding down your [pc.thighs] are a giveaway as well. You break the kiss to watch, fucking her with long, even strokes");
	if(pc.cockVolume(x) > ulaCapacity()) output(", dick obscenely visible every through layers of skin and fur");
	output(", watching her eyelashes flutter and her jaw work open and closed, only stopping when she bites down on a lip hard enough to draw a trickle of blood.");

	output("\n\n<i>Slap-slap-slap</i>. The clap of your hips banging away at her rings through the room, gradually rising in tempo to your ever-growing ardor. The korg-girl shivers and sighs, rag-dolling from the pounding and orgasmic aftershocks alike. That hardly seems to matter. The fucked-stupid glaze in her eyes may as well be an advertisement to your [pc.balls] to brew up an extra-virile load for how you feel. Burying your nose into her neck, you hump her powerfully, bestially, the way you know she wants to be taken.");

	output("\n\nWhen you cry out in ecstasy, the clan princess’s voice joins you. Her pussy clamps down in answer to your climactic throbbing, and when your " + (silly ? "cum cum" : "[pc.cumVisc] [pc.cumNoun]") + " boils out of you, it’s met by a torrent of syrupy, feminine orgasm.");
	if(pc.cumQ() >= 50) 
	{
		output(" You flood her quim with pulse after pulse of seed.");
		if(pc.cumQ() >= 300)
		{
			output(" Eruptions of it flood through her ");
			if(pc.cockVolume(x) > ulaCapacity()) output("stretchy ");
			output("cervix to pack her womb.");
			if(pc.cumQ() >= 2000)
			{
				output(" Rivers of jism spill out onto the sheets");
				if(pc.cumQ() >= 10000) 
				{
					output(", but still, you cum");
					if(pc.cumQ() >= 25000) output(". Her belly bloats obscenely from the volume, transforming her from chubby waif into gravid-looking broodmother, a look she is all too happy to have from how she gurgles and strokes her distended tummy");
				}
				output(".");
			}
		}
	}
	output("\n\n<i>“Ahhh...”</i> the korgonne sighs, body going completely limp.");
	output("\n\nThe scent of her pussy is everywhere, surrounding you, enveloping you, urging you to continue. You do.");
	output("\n\nShe doesn’t react when fuck your way through your own sloppy seconds aside from making murmurs of delight and leaking enough mixed sexual fluids to keep your mind hazy and filled with the absolute <i>need</i> to <i>flood her with cum</i>.");
	output("\n\nFriction, sweat, scent, and the compulsive need to move your hips drags you through orgasm after orgasm. You spill a sea of loads in the korgonne’s velvety snatch. She’s <i>yours</i> now, after all, and you can’t get that beautiful, gorgeous blue pussy out of your head...");
	processTime(45);
	IncrementFlag("ULA_SEXED");
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
	if(!korgiTranslate()) output("Father many pups.");
	else output("You could father so many pups.");
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
	if(!korgiTranslate()) output("Return and tell star-stories. Then breeding, maybe? Make Ula big-tummy mommy. Have strongest pups.");
	else output("Come back soon. I’d love to hear your stories. We could breed again, after. Or before. Just come back soon! I want you to see my tummy swell up with your pups, all rounded and gravid. Gods, our kids could be so </i>strong<i>!");
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
	output(" in her eagerness. Cerulian nipples tent ");
	if(pc.hasFuckableNipples()) output("into your [pc.nipples]");
	else if(pc.hasDickNipples()) output("spar with your [pc.dickNipples]");
	else output("against your [pc.nipples]");
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
	else output(", nose bumping her clit, her walls quivering from the rapid fast slurps.");
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

	output("\n\nYou release her clit and dive down to lap greedily at the river of girl-cum, nose nuzzling the sensitized nerve-cluster enough to satisfy the fluffy horn-dog. She tastes like mint-flavored ambrosia. Hints of her sweet, feminine honey linger in your maw in the aftermath of a particular large gulp. When you plunge your tongue back inside, you fall back in love with her cunt all over again. It’s heavenly, seemingly designed for you to obsess over. It’s the perfect size and shape for your tongue");
	if(pc.hasMuzzle()) output(" and muzzle");
	output(". Hypnotically plump lips linger behind your eyelids as you eat her out to one orgasm after another.");
	output("\n\nIgnoring how your face is drenched in her sloppy juices, painted from cheek to cheek in korgonne-cum, you’re still going, driving her wild. It feels like you’re addicted to pussy, like you can’t get enough. Your whole mouth aches from eating her out. You feel like you’ve swallowed gallons of girlish goo, but <i>you want more</i>. It’s like an addiction, only there’s no satisfying it. You always want more. No matter how horny you get, the desire for more delicious, savory slit overwhelms your personal need.");
	output("\n\n<i>Pussy!</i>");
	processTime(30);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",morePussThirst);
}

public function morePussThirst():void
{
	clearOutput();
	showUla(true);
	output("<i>“Mmmmmmph!”</i> the korgonne princess cries from beneath you, nose dipping into your [pc.vagina]. She’s shaking from the effort, her muscles long ago worn out from the orgasms you’re milking out of her. When her tongue enters you once more, it’s transcendental. One lick, and you’re blasting off into orgasm on a slick tongue of canine rapture. Your [pc.vaginas] seize");
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
	output(" Korgonne pussy is just so perfect. You cum while you taste her, eyes rolling back and hips rolling, grinding the princess’s face.");

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
	else output("I thought we'd talk about cool alien stuff, but nope! Korg stupidness.");
	output("”</i> She punches the bed. <i>“");
	if(!korgiTranslate()) output("Whole universe, but want talk dirt-dig like gem-heart rock-pup.");
	else output("There's a whole universe, but you want to talk about digging in the dirt like some gem-heart rock-pup.");
	output("”</i>");
	output("\n\nYou tilt your head. <i>“Gem-heart?”</i>");
	output("\n\nUla nods. <i>“");
	if(!korgiTranslate()) output("Digger. Sparkle-thirsty korg who prefer tunnel to clan. Rather hold pick than mate. Gem-heart.");
	else output("A digger. Gem-thirsty korg who prefer to tunnel than live with the rest of the clan. They'd rather hold a pick than a mate, thus, Gem-heart.");
	output("”</i> She shrugs. <i>“");
	if(!korgiTranslate()) output("Not understanding them. Live in hold too long, maybe. Nothing but rock, rock, and more rock. Maybe sparkle. Elders say gem-heart not from that. Say they just are. Just loving the finding. Alien word for it... thrill? Seek thrill. Want long dig boring just so can find moment of pretty sparkle!");
	output("I don't understand them. Maybe they've stayed in the hold too long? Their life is basically just rock, rock, and more rock. Maybe a gem here or there. The elders say gem-hearts just </i>are<i>. That they just love the act of finding new gems. There's a word in your language for it... thrill? They love the thrill. They love the long stretches of boredom just so they can have the jubilation of one rich find.");
	output("”</i>");
	output("\n\n<i>“Like gambling?”</i> you suggest.");
	output("\n\nRecoiling, the curvy korgonne’s ears flop. <i>“");
	if(!korgiTranslate()) output("What gam-bull-ing?”</i> Her nose wrinkles. <i>“Sound like gross.”</i>");
	else output("What's gam-bull-ing?”</i> Her nose wrinkles. <i>“Sounds gross.”</i>");
	output("\n\n<i>“No, no,”</i> you protest. You spend a few minutes explaining the concept of gambling before the little creature abruptly catches on.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Ohhhh! Like hormnolde! Male-korg game. Spin crystal and throw goal cubes. Such complex, but lots fun.");
	else output("Ohhhh! Like hormnolde! It's a male korg game. You spin a crystal and throw goal cubes. It's incredibly complex but lots of fun.");
	output("”</i> Ula grabs your hand and squeezes. <i>“");
	if(!korgiTranslate()) output("Ula not permitted join. Clan Chief daughter no get fun. No get go outside. No get court mate. Just stuck room. Always stuck room.");
	else output("I'm not permitted to join. The Clan Chief's daughter isn't allowed fun. No going outside. No courting mates. Just the inside of this room. Nothing but the inside of this room.");
	output("”</i> She stamps her foot. <i>“");
	if(!korgiTranslate()) output("Gem-heart better. Can do what want, even if just poke rocks all day.");
	else output("Gem-hearts have it better. They can do what they want, even if it's poking rocks all day.");
	output("”</i>");
	output("\n\nRather than upset her further, you decide to find out more about the gem-hearts. <i>“Did they create the entire hold?”</i>");
	output("\n\nUla laughs. <i>“Gem-hearts? Craft?”</i> She pats your ");
	if(pc.hasKnees()) output("knee");
	else output("[pc.leg]");
	output(". <i>“");
	if(!korgiTranslate()) output("Poor alien. So much star-light scramble brain. Gem-hearts only dig and like dig. Not think for hold, only sparkle. Elders plan hold. Tell gem-hearts where dig, how dig. Gem-hearts listen or exile.");
	else output("Poor alien. All that star-light must have scrambled your brain. Gem-hearts only like to dig. It's all they do. They don't think about the hold, just the gems they might find. The elders planned the hold. They tell the gem-hearts where to dig, and the gem-hearts have to listen if they don't want exiled to the snow.");
	output("”</i> She shivers. <i>“");
	if(!korgiTranslate()) output("Exile only cold. Saber-fang killers or alien-stolen.");
	else output("There's nothing out there but cold, milodan murderers, and thieving aliens.");
	output("”</i> Ula’s ears fold back apologetically. <i>“Not all aliens ");
	if(korgiTranslate()) output("are ");
	output("good.”</i> Soft fur tickles your forearm as she gently strokes your bicep. <i>“You");
	if(korgiTranslate()) output("'re");
	output(" nice though.”</i>");
	output("\n\nYou smile winningly, glad to have her endorsement. <i>“But they dug out the entire hold?”</i>");
	output("\n\nTail wagging, Ula leans herself completely into your side. She’s warm. <i>“");
	if(!korgiTranslate()) output("Whole hold. Gem-hearts think fun, digging. Think pick-sound music. Think sparkle-rocks give joy.");
	else output("The whole hold. Gem-hearts think digging is fun. To them, the sound of picks is like music and the sight of gems like pure joy.");
	output("”</i> The grinning fluffball jangles a bracelet in front of you. <i>“");
	if(!korgiTranslate()) output("Is nice, but not that nice. Not </i>fucking<i> nice.");
	else output("They're nice, but not that nice. Not </i>fucking<i> nice.");
	output("”</i> She paws gently at your [pc.chest], clawed fingers tracing down to your [pc.belly]. Her eyelashes flutter bashfully as she looks ");
	if(pc.tallness >= 66) output("up ");
	output("at you with undisguised ardor.");

	output("\n\n<i>“What do you do with it? All the ");
	if(korgiTranslate()) output("gems?");
	else output("sparkle-rocks?");
	output("”</i> You scratch the top of her head, right between the ears.");

	output("\n\nUla’s eyes drift closed, and her tongue slips out unthinkingly. <i>“");
	if(!korgiTranslate()) output("Sparkle-crusts. Tools. Crafty-korg trade for rocks, then make use. Rest dropped under ice. Under ocean. No signs for alien or fang-kitties to tracking.");
	else output("Jewelry. Tools. Craftskorg will trade for the useful gems. The rest get tossed under the ice, deep in the ocean. We don't leave any signs for alien miners of fang-kitties to track.");
	output("”</i> She purrs against you. <i>“");
	if(!korgiTranslate()) output("Korg smart. Live in Uveto’s bones. Invisibiling to fang-cats. Unbreakable. No attacking... till aliens come.");
	else output("We korg are smart. In Uveto's bones, we're invisible to the fang-cats. Our home was unbreakable. Impenetrable... until the aliens came.");
	output("”</i> She pulls away, brushing her hair into place. <i>“");
	if(!korgiTranslate()) output("Harder living now. Less places for korg settling. Digging deeper now. Bigger clans, in case need fight aliens. Bang tubes very kill, but korg many more.");
	else output("Everything is harder now. There's less places for other korg tribes to settle. We have to dig deeper. Clans have to be as big as possible to stand up to alien weapons. Thundersticks can kill many korg, but if enough of us come together, no amount of shots can stop us.");
	output("”</i>");
	output("\n\nYou hadn’t put much thought into what would happen if the korgonne got pushed too far by the mining on planet. Hopefully any violence can be avoided.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Want other talk");
	else output("Want to talk about something else");
	output("?”</i> Ula seems discomforted by the recent turns the conversation.");
	processTime(15);
	addDisabledButton(1,"Mining","Mining","You just spoke about this.");
}

//Ula’s Role
public function ulasRoleInTheClan():void
{
	clearOutput();
	showUla();
	output("<i>“So what are you, to your clan?”</i> You gesture around her spacious quarters, clearly decorated to her tastes. <i>“Chieftan’s daughter?”</i>");
	output("\n\nUla nods bashfully. Her tail hangs flat on the bed. <i>“");
	if(!korgiTranslate()) output("Very correct. Clan Chieftan fathering. Many elders uncle or aunt. All expecting much.");
	else output("Correct. The Clan Chieftan is my father. Many elders are my uncles and aunts. They all expect much.");
	output("”</i> She shrugs emphatically. <i>“");
	if(!korgiTranslate()) output("Too much. They saying too headstrong but also saying not leader! They saying need find mate, then no let visit males. All knowing Ula is pussy-dumb. Get horny-dumb like males.");
	else output("Too much. They say I'm too headstrong but also not a leader. They say I need to find a mate, then don't let any males visit me. They all know I'm pussy-dumb - that I get stupid-horny like a male.");
	output("”</i> She pats at her mostly-bared crotch. <i>“");
	if(!korgiTranslate()) output("After runninged away, they change minds, but now I change mine. No want korg visiting. Rather [pc.name] visit.");
	else output("After I ran away, they changed their minds, but now I've changed mine. I don't want male korg visiting. I'd rather [pc.name], you, visit.");
	output("”</i> The korgonne princess smiles sidelong at you.");

	//Bimb
	if(pc.isBimbo()) output("\n\n<i>“Awww, thanks so much!”</i> You squeeze her tight. <i>“I love visiting you, little cuddle-pup!”</i>");
	//Bro
	else if(pc.isBro()) output("\n\n<i>“Thanks, toots.”</i> You squeeze her shoulder affectionately.");
	//Nice
	else if(pc.isNice()) output("\n\n<i>“Awww, thanks!”</i> You squeeze her affectionately. <i>“I enjoy these visits too.”</i>");
	//Misch
	else if(pc.isMischievous()) output("\n\n<i>“Oh really?”</i> You ask, smiling broadly. <i>“Then I’ll have to visit twice as much.”</i>");
	//Hard
	output("\n\n<i>“Good thing I’m here then,”</i> you quip.");
	//Merge
	output("\n\nUla blushes. <i>“Good.”</i>");
	output("\n\nYou ask her if that means she’ll be the chief someday.");
	output("\n\nSnorting, the canine woman laughs. <i>“");
	if(!korgiTranslate()) output("Am doubting! Elders choosing next Chieftan. Usually old-Chief offspring. Not this time. Think me too crazy. Reckless. Weak.");
	else output("I'm doubting it! The elders choose the next Chieftan. Usually it is a child of the old Chief. Not this time. They think I'm too crazy, reckless, and weak.");
	output("”</i> She snorts. <i>“");
	if(!korgiTranslate()) output("We do better if learn from aliens. Learn alien science-magic so can make boom-tubes of own. Milodans not stand chance against korg with core-magic. Aliens no gloat in sky above if korg have fly-ships of own. No take holds from small tribes for steal sparkles! No take! Only respect!");
	else output("We would do better if we learned from the aliens. We could learn science-magic to make boom-tubes of our own. Milodans wouldn't stand a chance against korg with core-magic. Aliens couldn't gloat in the sky above if we had ships of our own. Nobody could take from the small tribes or steal our gems! No more thievery! Only respect!");
	output("”</i> Ula punches one fist into the other. <i>“");
	if(!korgiTranslate()) output("That what I do if got be chief.");
	else output("That's what I'd do if I got to be chief.");
	output("”</i>");
	output("\n\nYou rock back in surprise. She’s quite the little progressive firecracker!");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Want talk something else?");
	else output("Want to talk about something else?");
	output("”</i> Ula strokes your knee affectionately.");
	processTime(10);
	addDisabledButton(2,"Ula's Role","Ula's Role","You already spoke of this.");
}

//Other Tribes
public function otherTribesTalkarydooda():void
{
	clearOutput();
	showUla();
	output("<i>“How many other tribes does Uveto have?”</i>");
	output("\n\nUla shrugs. <i>“");
	if(!korgiTranslate()) output("How many stars in sky? Too many for one to know. Many. Uveto bigger than pregnant korg appetite, though less now than was.");
	else output("How many stars are in the sky? Too many for any one person to know. Very many. Uveto's bigger than a pregnant korg's appetite, though there are less clans now than there was.");
	output("”</i> She taps her palm. <i>“");
	if(!korgiTranslate()) output("Some milodan-killed. Some driven to snow by sparkle-mining.");
	else output("Some were milodan-killed. Some were driven to the snows by mining.");
	output("”</i> She punches her fist into her hand. <i>“");
	if(!korgiTranslate()) output("Small clans join together. Make bigger, stronger clan. This new. Korgonne no like much many snouts in one burrow, but do anyway. Better than lose war or starve.");
	else output("Smaller clans joined together to make bigger, stronger clans. This is a new thing. Korgonne don't like so many snouts in one burrow, but we do it anyway. Better than losing a war or starving.");
	output("”</i>");
	output("\n\nYou ask if her clan is such a conglomerate.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Nope! Korg’ii clan much success. Chief smart. Hide. Steal from dumb aliens.");
	else output("Nope! Korg'ii clan has had much success. Our Chief is smart. We hide and steal from the dumber aliens.");
	output("”</i> The princess pats your knee apologetically. <i>“");
	if(!korgiTranslate()) output("No offense. We not take so much as other clans. Not draw alien ire. Better hidden too. Right under nose. Secret entrance make tough find.");
	else output("No offense. We don't take as much as many other clans. We don't want to draw the other aliens' ire. We're better hidden too. Right under your noses. The secret entrance makes us tough to find.");
	output("”</i> She smiles proudly.");
	output("\n\n<i>“But other clans steal more?");
	output("\n\nUla chitters with mirth. <i>“");
	if(!korgiTranslate()) output("Many more! Sparkle-Claws pride selves on taking from aliens. Roam far from hold. Use magic belt, stay warm. Have flash-shooters, bang-sticks, and other core-magic. Strong fighters.");
	else output("Much more! Sparkle-Claws pride themselves on taking things from aliens. They roam far from their hold, using those magic belts to stay warm. They even have flash-shooters, bang-sticks, and all kinds of other core-magic. Formidable fighters!");
	output("”</i> She flexes a pudgy bicep. <i>“");
	if(!korgiTranslate()) output("Scare aliens. No try mine territory. Tech make strong. Stronger than Korg’ii.");
	else output("They scared off the aliens. Nobody tries to mine their territory. Tech makes them strong. Stronger than the Korg'ii.");
	output("”</i> The dog-girl’s expression becomes pensive. <i>“");
	if(!korgiTranslate()) output("But not know core-magics. Not keep tech strong. Rust-breaking or worse. Always needing more stealings.");
	else output("But they don't know core-magics. They don't keep their tech strong. Rust damages it or worse. Always they need to steal more.");
	output("”</i>");
	output("\n\nYou nod thoughtfully. Without knowledge of how to maintain a weapon, especially in these harsh climes, it wouldn’t last long.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Some clans no use core-magic. Only korgonne-craft. Those clans dumb. Do worst of all, unless very far from sky-spire,");
	else output("Some clans don't use any core-magic - only korgonne-craft. Those clans are dumb. They do the worst of all, unless very far from the sky-spire,");
	output("”</i> the fluffy princess explains. <i>“");
	if(!korgiTranslate()) output("Wyrm-Murder clan only exception. Strong people. Hunt frostwyrms. All hunters wear full suit of scales. Even stops some core-bangs.");
	else output("Wyrm-Murder clan are the only exception. A strong people. They hunt frostwyrms. All their hunters have full suites of frostwyrm scale. It even stops some core-bangs.");
	output("”</i> ");
	if(9999) output(" She runs her fingers over your armor. <i>“You know, yes?”</i>");
	else 
	{
		output("She sighs heavily. <i>“");
		if(!korgiTranslate()) output("Korg’ii only have few, but know how make, if scales getted.");
		else output("Korg'ii Clan only has a few, but we can make it, if someone has the scales.");
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
	processTime(10);
	addDisabledButton(3,"Other Tribes","Other Tribes","You've already had this conversation.");
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
	output("\n\nYou answer them all to the best of your ability, then go over basic maintenance. Should she get her hands on an old-style weapon, you’d like her to keep in good shape after all.");
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
	output("\n\nThe barbarian princess beams ");
	if(pc.tallness >= 66) output("up ");
	output("at you. <i>“Ula good stupid. Much learnings. Talk more? Tell of more core-magic?”</i>");
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
	if(!korgiTranslate()) output("Learn much. Maybe hunters let Ula have zap-gun that no zap no more. Then just need find charge-battery or so-lar paneling for own use. And warm-belt! Warm-belt can work again with elec-tric-it-y-filled battery?");
	else output("I learned so much. Maybe some hunters will let me have a zap-gun that doesn't zap any more. Then I just need to find a charged battery or so-lar paneling for me to use... And a warm-belt!”</i>");
	output("\n\n<i>“Yes.”</i>");
	output("\n\n<i>“Oooooh.”</i> Mischief dances in the korgonne’s eyes. <i>“");
	if(!korgiTranslate()) output("Much learn. Many thanks. Other talks now?");
	else output("I learned so much. Many thanks! Want to talk about something else now?”</i>");
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
	if(korgiTranslate()) output("That's your word for the green sparkly rocks?");
	else output("Alien word for green sparkles?");
	output("”</i>");
	output("\n\nYou nod.");
	output("\n\nUla looks at you cautiously. <i>“");
	if(korgiTranslate()) output("We know your people want it. We know they offered credits for them. Core silliness. [pc.name]. You're not hear to steal some, are you?")
	else output("Know aliens want. Knowing cretids offered for. Kedrits? Core silliness. [pc.name] not here here to steal?");
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
	else output("Maybe Korg wouldn't make puppies, if not for Savicite.");
	output("”</i> Her tongue lolls out. <i>“");
	if(!korgiTranslate()) output("Males no wear and not want much sex till girl-korg rubs nose in it. Maybe girls not want much sex either without green-sparkles?");
	else output("Males don't wear any, and they don't want sex much until a girl-korg rubs their noses in it. Maybe girls wouldn't want sex either without it?");
	output("”</i>");
	output("\n\nIt sounds like she knows about some of its more... recreational properties.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Why aliens wanting so bad");
	else output("Why do you aliens want it so bad");
	output("?”</i> Her nipples are firm but not too firm. Ula’s thirst for knowledge remains greater than her lust, for now. <i>“");
	if(!korgiTranslate()) output("Knowing aliens have own magic breeding potions and pink-cloud stuff. Hear of stuff call Throbb! Even korg boy want sex with Throbb. Not need Savicite!");
	else output("I know aliens have their own magic breeding potions and pink-cloud stuff. I've heard about Throbb! Even korg boys want sex after using Throbb. You don't need Savicite at all!");
	output("”</i>");
	output("\n\nYou explain its usage in a myriad of industries, everything from helping to make those aphrodisiacs to starship fuel and light drives. Without Savicite, the universe as a whole would be butt-fucked.");
	output("\n\nUla pulls her hands back and sighs. <i>“");
	if(!korgiTranslate()) output("Aliens not stop wanting then");
	else output("Aliens won't stop wanting it then");
	output("?”</i>");
	output("\n\n<i>“No.”</i> You shake your head sadly. <i>“I don’t think so.”</i>");
	output("\n\n<i>“Feces!”</i> The chieftain’s daughter slouches, any erotic energy in the room dissipating with her exclamation.");
	output("\n\nYou stroke her back and offer, <i>“Maybe someday... not too far from now, a new alien will be in charge of the mining. One who won’t be a threat to your people.”</i>");
	output("\n\nUla smirks. <i>“");
	if(!korgiTranslate()) output("Maybe. While wishing, me wanting ship-of-stars. See universe for self. Also smarter tribe.");
	else output("Maybe. While we're wishing, I want a starship to see the universe for myself. Also a smarter tribe.");
	output("”</i> She nods sharply. <i>“");
	if(!korgiTranslate()) output("Second one better wish. Maybe other-talk now?");
	else output("The second one is a better wish. Maybe we could talk about something else now?");
	output("”</i>");
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
	if(korgiTranslate()) output("I've heard of those. Why do core-folk care about them so much?");
	else output("Am hearing of. Why core-folk care so much?");
	output("”</i>");
	output("\n\nYou explain their convenience for trade and usefulness over the bartering systems most peoples use. Credits are merely a placeholder for valuable goods that any other coreward merchant would accept. Their ubiquitous acceptance is the source of their value. Anyone that wishes to trade with aliens would want to use them.");
	output("\n\nUla taps her chin. <i>“");
	if(!korgiTranslate()) output("So all alien take credits for trade-good?");
	else output("Every species will trade for them? At the same value?");
	output("”</i>");
	output("\n\nYou nod. <i>“Pretty much. Except for people like the korgonne who don’t really talk to the rest of the galaxy.”</i>");
	output("\n\nBrows knitting in thought, the nude princess asks, <i>“");
	if(!korgiTranslate()) output("And how muching credits for bang-sticks?");
	else output("And how many credits for bang-sticks?");
	output("”</i>");
	output("\n\nYou explain that there are many types, some basic ones for five or six hundred credits, but decent ones run well into the six or seven thousands.");
	output("\n\n<i>“Mmmhmmm...”</i> Ula taps her chin, running the numbers in her head. <i>“");
	if(korgiTranslate()) output("I think I can convince the merchants of the tribe to use credits, so long as they're chits, not just numbers on a screen.");
	else output("Thinking can convince merchants of tribe use credits, so long as chits, not numbers on tech-screen.");
	output("”</i>");
	output("\n\n<i>“Really?”</i>");
	output("\n\nUla nods. <i>“");
	if(korgiTranslate()) output("It won't be a good deal. They'll want big profits for the trouble, and I'll need to convince the elders to allow a brave korg to trade the credits back to your people.”</i> She all but bounces in excitement. <i>“Give me a day. Then you can trade, I'm thinking.");
	else output("Not be good deal. Will want big profit for trouble, and need convince elders send brave korg for trade credits with aliens. Chieftain too.”</i> She all but bounces in excitement. <i>“Give day. Then can trading, me thinking.");
	output("”</i>");
	output("\n\n<i>“Wow... thanks, Ula.”</i> You rub her shoulder fondly.");
	output("\n\nThe stacked woman snorts. <i>“");
	if(korgiTranslate()) output("Thank me if I succeed. Check with the merchants tomorrow, but in the meantime, keep talking to me. Unless you don't want to talk? Maybe you'd like to share some warmth?");
	else output("Be thanking if succeeding. Talk merchants tomorrow. But talk me now. Unless no want talk now? Maybe want share warm?");
	output("”</i> She snuggles closer, looking up at you with big, luminous eyes.");
	if(flags["ULA_CREDIT_TALK"] == undefined) flags["ULA_CREDIT_TALK"] = GetGameTimestamp();
	processTime(8);
	addDisabledButton(7,"Exp:Credits","Explain: Credits","You already discussed this!");
}

public function korgiiCredits():Boolean
{
	return (flags["ULA_CREDIT_TALK"] != undefined && flags["ULA_CREDIT_TALK"] + 60 * 24 < GetGameTimestamp());
}