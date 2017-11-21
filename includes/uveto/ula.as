//Princess Ula (Codename: OWO)
//Chance of finding in any Uvetan Cave

// PRINCESS_CAVE
// PRINCESS_LEAVE_TIMER

/*PHYSICAL ATTRIBUTES:
4’9”</i> - on the edge of being a midget :3
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

//Meeting
//Bonustext
public function ulaBonus():void
{

	output("\n\nA shivering figure lurks in shadowy darkness at the rear of the cave, its large, canine ears quivering in distress. Features are difficult to make out without getting any closer, but it is clear from the mop of snow-soaked hair and chattering teeth that whatever is cowering back there is suffering from some serious hypothermia.");
}

//[Figure]
public function caveMeetUla():void
{
	clearOutput();
	showUla();
	output("You cautiously approach the mysterious stranger, hand on your [pc.weapon].");
	output("\n\n<i>“H-help?”</i> an almost inaudible voice squeaks. Watery green eyes peek at you from over a bangle-clad wrist. Ice shards trace trails of misery down the girl’s soft-furred cheeks where she was crying. Icy blue lips, plump with feminine appeal, quiver in misery. <i>“C-c-cold.”</i> She points");

	if(pc.hasItem(HeatBelt) || pc.hasItem(AWBelt) || pc.hasItem(KorgCoat))
	{
		output(" to your ");
		if(pc.hasItem(HeatBelt) || pc.hasItem(AWBelt)) output("belt");
		else output("cloak");
	}
	output(". <i>“Share w-w-arm?”</i>");

	//CODEX UNLOCK
	if(!CodexManager.entryUnlocked("Korgonne"))
	{
		output("\n\nYour codex beeps. <i>“Korgonne identified. Tribal species native to Uveto VII that is frequently hostile to outsiders. Females are sexually aggressive and will use force and genital pheromones to entice mating. Use caution when traversing government-recognized korgonne lands.”</i>");
		//CodexManager.unlockEntry("Korgonne");
	}
	//Merge
	output("\n\nThis close, you can see the poor puppy-girl is ill-dressed for the icy weather outside.");
	if(!CodexManager.entryUnlocked("Korgonne")) output(" Other Korgonne you have encountered have come warmly dressed in furs, some with heat belts. She has neither.");
	else output(" Venturing out in anything less than a dozen pieces of thickly-padded clothing seems like an idiot idea, unless you have a heat belt. She does not.");
	output(" A diaphanous cloak is her only garment. Meant for little more than ornamentation, it does little more than highlight its wearer’s lack of modesty and awareness of Uveto’s dangers.");
	output("\n\nWill you help the foolish dog-girl?");

	processTime(10);
	clearMenu();
	//9999
	//[Share Heat] [Give Belt] [Give Coat] [Nope]
}

//Nope
public function noHeatForYouUla():void
{
	clearOutput();
	showUla();
	output("She’s cold now but safe in the cave. You have no doubt that the plush fur typical of her race will be more than enough to get her home once she dries off. <i>“Sorry.”</i>");
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
	showUla();
	output("<i>“I can warm you up,”</i> you offer, coming closer.");
	output("\n\n<i>“No!”</i> the korgonne reacts violently, scrabbling away to the far side of caves. <i>“Elders tell! Know aliens only take! Never give! Take holds, take coats, take warmings!”</i> She shivers and cries. <i>“Not trusting. You want be good alien, show be good alien!”</i>");
	output("\n\nLooks like if you want to help her out, you’ll need to give her something");
	if(pc.hasCock()) output(" other than a hard dicking.");
	else output(" other than sex.");
	processTime(1);
	//9999 disable option
}

//Give Coat:
public function giveUlaCoat():void
{
	clearOutput();
	showUla();
	output("<i>“Here,”</i> you hand her the Korgonne-made garment from you inventory");
	if(pc.isNice()) output(" with an apologetic smile. You really hope she doesn’t ask you how you got it.");
	else if(pc.isMischievous()) output(" with a cheeky grin.");
	else output(" without a care. Beggar’s can’t be choosers.");
	output("\n\nThe sniffling canine snatches it from your hands in desperation, stuffing it onto herself overtop of her soaked cloak in a frenzy of motion. <i>“Nice,”</i> she offers, looking up to you once more. Her shivers slow, then fade as she begin to preen, wiping the crusted tears from her cheeks. <i>“Am having many thanks.”</i> Smiling shyly, the dog-girl crawls closer, still on her knees. A gentle pat to the cave floor invites you to sit with her. <i>“Tell of stars?”</i>");
	//9999
}

//Give belt
public function giveUlaBelt():void
{
	clearOutput();
	showUla();
	output("<i>“Here,”</i> you toss her your heat-belt before you think better of it. The trip back will be cold, but by the look of her, she’s going to need it more.");
	output("\n\nThe sniffling canine snatches it from your hands in desperation, fastening it around her underbust instead of her waist, lifting and squeezing stiff-tipped breasts into an almost fetishistic display of jiggling titflesh. <i>“Nice,”</i> she giggles, her shivers slowing. She wipes the crusted tears from her cheeks and stretches, twisting this way and that. Her tail wags. <i>“Am having many thanks.”</i> Smiling shyly, the dog-girl crawls closer, still on her knees. A gentle pat to the cave floor invites you to sit with her. <i>“Tell of stars?”</i>");

	processTime(2);
	//9999 set save flag
	//[Stars] [Leave]
	//9999
}

//[Leave]
public function leaveAfterBelt():void
{
	clearOutput();
	showUla();
	output("You sigh. <i>“I don’t have time.”</i>");
	output("\n\n<i>“Understand.”</i> The Korgonne drops back on her ass, sprawling, hypothermia seemingly forgotten. <i>“You save, though. Maybe...”</i> The faint sound of her tail slapping into the wall drums excitedly. <i>“Maybe come Korg’ii Hold? Talk visit!”</i> She bounds up onto her hindlegs, eyes the size of dinner plates shining in excitement. <i>“Secret code! <b>One awoo in top sparklehole! Third from right.</b>”</i> She takes your hand in her chilly paws and squeezes, pulling it up to kiss the back of it.");
	output("\n\nThe cave suddenly feels a bit warmer...");
	output("\n\n<i>“Remember! Sparklehole! Three from right, topdeck!”</i> Bouncing about, the dog-girl lets you go to pump her fist in the air. <i>“Such kiss! Wow!”</i> She spins and totters out into the snow, suddenly unfazed by the cold.");
	output("\n\nYou’re left alone, secure in the knowledge that you should <i>“awoo”</i> into a specific <i>“sparklehole,”</i> should you encounter one.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Stay]
public function stayAndStarsTell():void
{
	clearOutput();
	showUla();
	output("<i>“Sure.”</i> You settle in next to the cold Korgonne");
	if(pc.isTaur()) output(", trying not to trample her as you settle your haunches into place");
	else if(pc.isNaga()) output(", careful not to bump her over with a stray coil as you wrap yourself into place");
	else if(pc.isGoo()) output(", carefully not to let your gooey body ooze into her as you spread out for comfort");
	else output(", careful not to slip on the slick floor");
	output(". ");
	if(pc.isBimbo()) output("She’s so cute! You barely stop from pinching her fuzzy little cheeks and kissing her. This is going to be fun! Like talking to a big, fuzzy stuffed animal that also has enormous knockers and super pretty lips!");
	else output("She might resemble a fluffy little stuffed animal, but you can pick up on a whiff of next-level pheromones now that you’re this close. The girl’s got pussy-scent stronger than a New Texan cow-girl. A few moments pass while you breathe heavily, sampling its every flavor.");

	output("\n\nLeaning close, the Korgonne licks her cyan-blue lips and glances toward the entrance, suddenly unsure. After a second of indecision, she straightens her little shoulders and faces you. <i>“Aliens new. Never seen.”</i> A paw gingerly extends toward your [pc.face].");

	output("\n\nYou let it. <i>“Really?”</i>");

	output("\n\nA shy nod is the answer. <i>“Keep inside. Clan Chief not trust, so run away.”</i> That gentle touch morphs into a sharp poke at your ribs. <i>“You talk! Tell of stars. Promised!”</i> The sharp green glare cuts harder than a mining laser.");

	output("\n\n<i>“");
	if(pc.isBimbo()) output("You got it, toots!");
	else if(pc.isBro()) output("Fine.");
	else output("Okay!");
	output("”</i> You lean back, rubbing your chest where her clawed fingertip did its best to prick you. <i>“Where to start...”</i>");
	output("\n\nSettling down, the rambunctious dog-girl grabs your hand and examines it while she waits, working your fingers individually. Sometimes she pokes you, gently this time, not wanting to break your [pc.skinNoun]. The pads on her fingers");
	if(!pc.hasArmFlag(GLOBAL.FLAG_PAWS)) output(" tickle");
	else output(" match up nicely with your own, though hers are thicker, made plush by a life of good food and idleness");
	output(".");

	output("\n\nYou’re tempted to luxuriate in the silent attention, but you suppose a little talking wouldn’t hurt. Maybe your the extra translation work will improve the algorithms a bit. Right now she sounds a bit like a cave-dweller from an old holo. Clearing your throat, you lead off with a basic explanation of space travel - ships, and how you need one to escape the planet.");
	if(!pc.isBimbo()) output(" Here and there, you stop yourself to clarify points, knowing your listener won’t be familiar with even the most basic terminology.");
	else output(" It’s super complicated, so you explain it in really simple terms. It’s way easier to talk like that anyhow. Easier to keep from stumbling over your words or getting distracted by how your listener’s titties move when she breathes.");

	output("\n\nThe Korgonne is actually a pretty good student. While her eyes may be roving <i>everywhere</i>, her ears always pivot to listen to your voice directly. She rarely interrupts, and when she does, it’s with a soft squeeze and quiet voicing of, <i>“Question?”</i> After the tenth such query, you notice that she’s getting more handsy. Instead of curiously discovering what an alien feels like, she’s stroking your bicep and forearm, kneading the muscles below in awe");
	if(pc.tone < 20) output(", however petite they may be");
	output(".");

	if(pc.isTreated()) output("\n\nThe fragrant scent of feminine arousal is building in the air like cloying perfume. You flex for her and sniff, smiling inwardly when the cloud of arousing pheromones thickens perceptively. The little snow-mynx is seriously turned on! So are you... maybe more than normal, but who cares? You’re pretty much always horny.");
	else 
	{
		output("\n\nThe cave is really warming up with two active bodies inside, humid and almost passably warm. ");
		if(9999) output("The scent of aroused Korgonne tickles your nose, indescribably different from the ones you’ve encountered in the wild");
		else output("An indescribable scent tickles your nose, stronger the closer you get");
		output(". Shoulder to shoulder, she’s easy to smell... and quite pleasant, you admit.");
	}
	output("\n\n<i>“Wow,”</i> the woman’s awestruck voice whispers.");
	output("\n\nWere her thighs always spread so wide?");
	output("\n\n<i>“Such journeys,”</i> the dog-girl grows, leaning into your arm, ");
	if(9999 gave coat) output("coat-covered");
	else output("fluffy");
	output(" breasts pressed into your arm. She clings on tight. <i>“Dangerous. Beautiful.”</i> Her tongue hangs out over a an icy bottom lip after the last word, panting quietly.");
	if(99999 not coat) 
	{
		output(" Erect nipples rub against your [pc.skinFurScales].");
	}
	else output(" Firm points rub against you, even through the thick hides of her jacket.");
	output(" <i>“You good [pc.manWoman]. Much saving, science-talking.”</i> Nosing into your neck, the lusty Korgonne reaches ");
	if(pc.legCount > 1) output("between your [pc.legs]");
	else output("down to your loins");
	output(". <i>“My thanks-having.”</i>");
	output("\n\n<i>“Oh.”</i> You stiffen");
	if(pc.hasCock()) output(" in more than one way");
	output(". <i>“My pleasure.”</i>");

	//Crotchless.
	if(!pc.hasGenitals())
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
		addButton(0,"Stop",);
		addButton(1,"Fuck",);
	}
}

//Stop
public function stopKorgiPlay():void
{
	clearOutput();
	showUla();
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

//Cave Fuck (Sappho-Doggo)
public function ulaCaveLesbo():void
{
	clearOutput();
	showUla(true);
	output("<i>“More,”</i> you pant, [pc.vaginas] wet enough to melt a cave of your own into the ice.");

	//Treated no new pg:
	if(pc.isTreated()) 
	{
		output(" Vaguely-minty fuck-scent fills your sinuses, and still, you sniff the air, letting her hyper-powered pheromones grab hold of your brain and drag it between her legs. You ");
		if(pc.wetness(0) < 3) output("moisten her snow-wettened");
		else if(pc.wetness() < 5) output("soak her");
		else output("drench her");
		output(" fingers with [pc.girlCum]. <i>“You smell so good. I want...”</i> You gulp down a mouthful of saliva. <i>“...I want to taste your cunt.”</i> Quivering, you change your mind. <i>“I need to eat your cunt.”</i>");
	}
	//HasSnout
	else if(pc.hasSnout())
	{
		output(" Vaguely-minty fuck-scent fills your sinuses, and still you sniff the air. There’s something strange about it the way it reaches into your brain and flips switches you didn’t even know existed. You drench yourself, slipping into a strange kind of heat... only, you don’t want to be bred. You just want pussy. Your own pussy, her pussy, whatever. You want to stuff your snout into a quim and lick until she’s forced to do the same, creating an endless cycle of cunt-obsessed oral. <i>“You smell soooo good!”</i>");
	}
	//Normal
	else output(" Vaguely-minty fuck-scent tickles your sinuses as you sniff the air, savoring the arousal freely leaking from the eager korgonne’s crotch. She’s so delirious wet that the air itself is humid with pussy. Every breath makes you wetter in response, hotter and hornier, more willing to lean into her crotch and while away the night happily licking. <i>“Your pussy...”</i> You pause to take a deep breath before continuing, juicing all over her fingers. The thought is forgotten. <i>“The pheromones are so strong!”</i>");

	output("\n\nThe dog-girl pulls away, staring at her soggy paw in horror. The added distance from her cloying cunt brings you a small measure of clarity... and a longing for its return. It looks as if she’s about to flee. <i>“Sorry!”</i>");

	output("\n\nYou beckon for her to come back. <i>“Please. Don’t leave.”</i>");

	output("\n\n<i>“But... my breed-scent.”</i> The horny fluffball squirms, thighs pressed together as if she could somehow contain the liquid lust that stains her fur. <i>“Strong.”</i> She hugs herself and looks down. <i>“Only girl who falls for own breed-scent. Others get so wet, keep calm.”</i> She jabs a thumb into her tits");
	if(9999 gave coat) output(", compressing the jacket you gave her");
	output(". <i>“Stupid. Pussy-stupid. Belong alone, in home-room.”</i>");

	output("\n\n<i>“Nooo,”</i> you whine, crawling forward, modesty forgotten");
	if(!pc.isCrotchExposed()) output(", [pc.crotchCovers] left on the ground behind");
	output(". <i>“Look at how horny I am.”</i> You reach out for her thigh and stroke it, feeling the watery-slickness of her arousal slipping through your knuckles on drenched fur. <i>“I... I need your help now.”</i> Shuddering, you lean closer to her crotch, nostrils flaring to drink in her dizzying scent. <i>“I need your pussy so bad.”</i> The pudgy lips flush purple as you breathe on them. The clit visibly swells, glistening, promising to taste as lovely as it smells. <i>“Help.”</i>");
	output("\n\nThe puppy-girl stares down, eyes flicking back in forth in a panic. You note that she doesn’t back away. She doesn’t dare move, not with your [pc.lipsChaste] hovering next to her slit.");
	output("\n\n<i>“Please,”</i> you exhort, digging your fingertips into her thighs to hold her in place. <i>“Please?”</i>");
	output("\n\nThe dog-girl shudders. Strings of clear juices drool from her cyan slit. They smell like heaven. <i>“I... need... too,”</i> she whimpers, stepping forward, pressing her puss against your face, clit bumping your nose. Thick-lipped folds slide over your mouth, spread by pressure to exposed a dripping-wet tunnel. <i>“Want... tongue?”</i> The korgonne looks confused. <i>“Pups normal... but alien tongue. Inside!”</i> Her nose wrinkles. <i>“Pussy too! Pussies good-smell together!”</i>");
	output("\n\n<i>“Yeah,”</i> you mumble into her cunt. <i>Pussies smell real nice.</i> Reaching behind her, you grab her by the ass, delighted to discover that it’s as plush and squishable as her tits. Kneading her cheeks, you shove her into your face so hard{ that your muzzle slips inside, stretching her hymen but not quite breaking it}. A thrust of your tongue makes her whimper and quiver.");
	processTime(20);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",korgiCavePussPart2);
}

public function korgiCavePussPart2():void
{
	clearOutput();
	showUla();
	output("<i>“Warmed licks!”</i> the korgonne cries.");
	output("\n\nStrength vanishes from the leaky bitch’s legs, dumping her pussy-first onto your face. Her weight bowls you over onto your back. You barely avoid cracking your head on the floor, but any complaints are swallowed whole by the electric taste of korgo-girl cunt. It makes your head swim and your snatch");
	if(pc.totalVaginas() > 1) output("es");
	if(pc.wettestVaginalWetness() < 3) output("dribble");
	else if(pc.wettestVaginalWetness() < 4) output("soak");
	else if(pc.wettestVaginalWetness() < 5) output("drip puddles onto the floor");
	else output("gush puddles onto the floor");
	output(". <i>“I love thish tashte!”</i> you cry, muffled by cunt and ambrosial juices.");

	output("\n\nSo enmeshed are you in the act cunnilingus that you only notice the korgonne moving around by the shifting of her clit. Instead of being high on your face, it rotates down near your chin. A second later, you feel fat, squishy tits pressing down on your [pc.belly] and a shock of virulent pleasure that makes your hungry mouth seize in ecstasy. <i>“Ahhh!”</i>");
	if(pc.hasSnout()) output(" Your ecstatic scream stretches her out around your snout, making the korgonne whimper back into your twat in sympathetic lust.");

	output("\n\nWas that an orgasm? It felt so good... so blissfully pleasant... but you still want her cunt. You can’t get enough of it. Right now it’s your favorite thing in the whole universe, a simmering delta of sinfully minty delights. Kissing it, you feel like its quivers are kissing you back, the shaking, climaxing korgonne expressing her shared affection through the sloppy, oozing girl-jizz that floods your maw.");

	//2cunts'
	if(pc.totalVaginas() == 2) output("\n\nA soaked finger slips into your second slit while the fuzzy alien’s mouth burrows deeper into the first, forcing you to new heights of pleasure. Another finger slips in a second later. Her digits may be short, but they’re delightfully thick, spreading you wide open as they skillfully find [pc.clits] to tease.");
	//3Cunts
	else if(pc.totalVaginas() > 2) output("\n\nSoaked fingers slip into your other slits while the fuzzy alien’s mouth burrows deeper into the first, forcing you to whole new heights of pleasure. Two more fingers join them a second later. Her digits may be short, but they’re delightfully, thick, spreading you wide open as they skillfully find [pc.clits] to tease.");
	//1cunt only
	else output("\n\nThe fuzzy alien’s mouth burrows deeper into your [pc.vagina], forcing you to new heights of pleasure. Seconds later, a finger joins it. Her digits may be short, but this one is delightfully thick, spreading you wide open as it pumps in and out alongside her cunt-drunk, canine tongue.");
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
	showUla(true);
	output("For the next half-hour, you sixty-nine with the once-chilled alien, sharing warmth and wetness in equal measure. Counting the orgasms is impossible. One bleeds into the next with such suddenness that you feel like you spent more time black-out-blissed than cogent of her pussy’s texture. You’re left with little more than breathless exhaustion and an intimate familiarity with the fucked-out dog-girl’s cunt.");
	output("\n\nStill, you don’t quite feel satisfied. It’s more a sense of being burned-out, like your body got so amped up on her pheromones that it was forced to shut down before your mind broke with desire. The tawny fluffball snuggles against you. She must feel the same, from the exhausted look in her eyes. She’s feels nice, snuggled up against you. For once, you realize she smells more like your cunt than her own. Maybe you smell like her.");
	output("\n\nSmiling weakly, you fall asleep, cuddling tight to the alien.");
	processTime(40);
	for(var x:int = 0; x < 14; x++) { pc.orgasm(); }
	clearMenu();
	addButton(0,"Next",korgiCavePussPart4);
}

public function korgiCavePussPart4():void
{
	clearOutput();
	showUla();
	output("You wake to the feeling of the korgonne girl trying to disentangle herself from you. <i>“Hey,”</i> you whisper, smiling happily. <i>“Was it good for you?”</i>");
	output("\n\nThe dog-girl’s blush reaches all the way to her lips and nipples. She licks her lips, eyes flicking to your pussy, then nods rapidly.");
	output("\n\n<i>“Good. I had fun too.”</i>");
	output("\n\nThat sets her off. The busty canine pumps her fist in the air and spins around in pure happiness. When she turns back, she’s smiling wide enough to show off a set of sharp canines. <i>“Alien first girl-warm share! Delights-much filling!”</i> She drops to her knees and kisses your lips, softly nipping your nose after. <i>“First save, then teach sexings. You truly best alien. Elders wrong. Aliens nice! So much know!”</i>");
	output("\n\nYou kiss her back, then struggle up onto your elbows. <i>“Glad to be of service.”</i>");
	output("\n\n<i>“Maybe... you come visit Korg’ii hold? Teach more. Help see nice?”</i> She sniffs her fingers, then shudders. <i>“Share more warms?”</i>");
	output("\n\n<i>“Sure,”</i> you answer, too fucked out to care. Sounds like fun.");
	output("\n\n<i>“Yays!”</i> Bouncing back, the Korgonne hops in the air. <i>“Secret code telling! <b>One awoo in top sparklehole! Third from right.</b>”</i> She takes your hand in her slippery paws and squeezes. <i>“Remember! Sparklehole! Three from right, topdeck!”</i> Still bouncing about, the dog-girl turns away and totters out into the snow, seemingly unfazed by the cold. <i>“Tell all! Alien joy!”</i>");
	output("\n\nYou’re left alone, secure in the knowledge that you should <i>“awoo”</i> into a specific <i>“sparklehole”</i> if you wish to see the friendly korgonne once more. Perhaps her whole tribe is friendly?");
	processTime(35);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Cave Fuck (Cock Path)
public function korgiCockFuck():void
{
	clearOutput();
	showUla(true);
	output("<i>“More,”</i> you pant, [pc.cocks] hard enough to pound through solid ice.");

	//Treated no new pg:
	if(pc.isTreated())
	{
		output(" Vaguely-minty fuck-scent fills your sinuses, and still you sniff the air, letting her hyper-powered pheromones chemically ");
		if(pc.inRut()) output("deepen your");
		else output("trigger an artificial");
		output(" rut. You dribble pre over her gently exploring paws while your chest heaves. <i>“Your pussy smells divine. Such pheromones...”</i> A full-body quake ripples through you, culminating in a throb hard enough to make the dog-girl nearly lose her grip. <i>“I need more than a paw.”</i>");
	}
	//HasSnout
	else if(pc.hasSnout())
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
output("\n\n<i>“But... my breed-scent.”</i> The horny fluffball squirms, thighs pressed together as if she could somehow contain the liquid lust that stains her fur. <i>“Strong.”</i> She hugs herself and looks down. <i>“Only girl who falls for own breed-scent. Others get so wet, keep calm.”</i> She jabs a thumb into her tits{, compressing the jacket you gave her}. <i>“Stupid. Pussy-stupid. Belong alone, in home-room.”</i>");
output("\n\nYou look on {in sympathy. No wonder she started putting the moves on you; as soon as she got a little excited, the pheromones started a feedback loop./in fake sympathy. At least that explains why how this shy girl transformed into a simpering puddle of lust}. You know how she feels, come to think of. Just looking at her, you can feel the urge rising inside you, begging you to take her. Your nostrils flare as you try to think of what to say. <i>“It’s... not safe to go out like that. Who knows what kind of monster you’d run into?”</i>");
output("\n\nThe puppy-girl sighs, in resignation, dropping to her knees. One hand goes to her chest, roughly squeezing the fattened orb. The other dibs between her legs, crudely rubbing at a blue-lipped entrance. <i>“R-right. But... can’t... want...”</i> She licks her lips, eyes fixated on your cock. <i>“Want pups.”</i> Falling on all fours, she crawls closer, tail curled up and wiggling with her juicy haunches. <i>“Want alien pups. Nice alien’s pups.”</i>");
output("\n\nYou attempt to hold yourself back. She’s probably a virgin, and she obviously doesn’t know any better. The way she smells right now, she’d get pregnant just from looking at a dick... and she’s staring at yours right now. You subconsciously shift to better present it, body operating on instinct and raw desire without much input at all from your brain. <i>“Wait... uh.”</i>");
output("\n\nThe furry vixen bends low to drag her tits across the ice, sensuously drawing closer{, hard nipples all but digging furrows into the freeze}. Her eyes are liquid pools of lust, so earnestly wanton that you can see your dick reflected in the moist curve of her corneas.");
output("\n\n<i>“You should...”</i>");
output("\n\nA tongue rolls out, long and slick. Drool spatter your thighs.");
output("\n\n<i>“Should... uh... wa-”</i>");
output("\n\nWarmth devours you.");
output("\n\n[Next]");
output("\n\nYou slide bonelessly onto your back as the tension is sucked from your body. Frenetic licks and slobbery kisses work their way along [pc.oneCock] unceasingly. Soft paws, wet from cunt, pre-cum, and melted snow join in explore the space around your [pc.knot]. It all began so artlessly, but with each moment spent sealed around your dick, the proud puppy learns new ways to make you gasp. Her tongue curiously ventures over the musky skin, seeking out pockets of virile flavor, coaxing your pre to channel into the curved middle where she can hold and savor it.");
output("\n\nYou nearly cum to the sound of her lurid gulp.");
output("\n\nAnd then she swivels around, muzzle suddenly a vortex of pleasure. Furry thighs land to either side of your {head/chest{, splayed nearly into a split by the width of your jiggling boobs}.} Fat, cyan cuntlips hover above your face, and that minty, deliriously erotic smell washes over you, tainting every breath with korgonne pussy-musk.");
output("\n\n<i>“Put pups in hole.”</i> The command is spoken around a cheek full of dick.");
output("\n\n[pc.EachCock] trembles{, the one in her maw most of all}, threatening to go off like a geyser. You’re no medical expert, but with her legs splayed so wide, you’re pretty sure you can see the membrane of her alien hymen stretched thin, waiting to be slowly spread by a gentle lover - or broken in half in a frenzy of bestial breeding. <i>“But{ I’m too biiii}-”</i>");
output("\n\n<i>“No. Pups in hole.”</i> She silences you by dropping her hips and drowning you in her sodden slit, watery slickness pouring unrestrained into your maw. When she lifts off a minute later, everything reeks of minty quim. Your [pc.face] has been claimed by the lust-lost tribal girl, and every breath you take is swamped in a pheromonal wonderland.{ It feels like your [pc.balls] are going to boil over.}");
output("\n\nYou dive upward to suck greedily upon her clit. You want that cunt more than anything. You need it in your life: on your face, on your dick, filled with seed. Still, you make one last token attempt to moderate her impulses. <i>“Let me eat you out. I’ll suck your clit till you pass out and swallow your cuntjuice till my mouth smells more like pussy than y-”</i> Your tongue stabs out for another lick, unwilling to go without the exotic flavor or korgonne cunt a minute longer.");
output("\n\nThe warm, wet sheath around your [pc.cock] vanishes, leaving you to twitch in cold air. <i>“Nooooooo! Thought you nice alien?”</i> the voice is delirious, and that gorgeous, blue cunt vanishes from view. Your short-stacked lover pops into view a second later, stuffing her nose against the side of your face and licking her flavor from your cheek. <i>“Please,”</i> she pants. <i>“Want you. Nice alien. Strong alien.”</i> Her tits weigh heavily on your {own/chest}. <i>“Deserve puppies.”</i> She shudders and squeezes your dick so hard you nearly spurt. <i>“Deserve whole clan of puppies.”</i>");
output("\n\nStars, that sounds appealing. In this moment, you’d like nothing better than to bust a {swollen / backed-up / womb-flooding} nut this bitch. <i>“Yeaaahhh...”</i>");
output("\n\nNo sooner is the word out of your mouth than the korgonne is shifting on top of you, hips rolling feverishly in an attempt to slide your [pc.cock] inside.");
output("\n\n//2Big");
output("\n\nShe’s definitely a virgin. The first attempt does little more than smash her puffy puss into your [pc.cockHead], futilely dragging the lust-engorged lump of her clit past your pre-weeping urethra. The second attempt fares no better. Growling in disatisfaction, she rocks back and forth, straining her tight cunny against your impossibly large cockhead, trying to wedge herself open far enough to take <i>any</i> part of you, even if it’s only the first inch of pole.");
output("\n\n<i>“Ahp!”</i> the dog-girl gasps as she succeeds in ripping her hymen wide open, sinking a few millimeters in. She’s so tight. It feels like her clenches are going to pinch off your [pc.cockHead]. Streamers of korgonne girl-cum stream down your length, but no amount of effusive ejaculate will allow her virginal tunnel to take your obscene tool any further. <i>“Big!”</i>");
output("\n\nPleasure forces deflowered dog-girl to arch her back, leaning so far that her hair touches her tail, thrusting her breasts at your face. They bounce and clap against each other. Drops of fuck-warmed snowmelt rain over your [pc.chest] as the korgonne cums herself silly, hindpaws reaching back to grip you, smearing pussyjuices all the way down to your {[pc.sack]/[pc.sheath]}. <i>“Very stroooong! Many pups!”</i>");
output("\n\nPuppies? You make an effort to hold yourself back, but she smells so good. Her feet squeeze you so wonderfully, milking you into her, fanning the compelling breed-scent into the air until your body obliges her request for cum with orgasmic clenching. <i>“I’m cumming!”</i> You pride yourself on the warning, futile though it might be.");
output("\n\n<i>“Happiness! Give puppies.”</i> She grabs your ears and tugs your lips to a tit, hips rolling. <i>“Warm... Good... Motherness!”</i> Eyes closing, her tongues dangles stupidly out of her mouth as her body seizes. The cum-hungry tunnel flutters confusedly, stretched too full yet mostly empty.{ Nothing more than dribbles slips out, but she doesn’t seem to mind. She climaxes from the feeble [pc.cumNoun]-drops leaking into her passage, folds fluttering to escort the feeble fluids closer to her aching eggs./ The [pc.cumNoun]-shots fire in deep. Every lance makes her feel warmer and wetter, squelching and hot. You have no doubt that some is slipping upward into her womb, journeying to those aching eggs./ She moans at the feeling of your thick, virile pumps of [pc.cumNoun]. [pc.cumVisc] blobs slip out of her stretched lips{ to shine your straining knot}. Whole streams of it must be pouring into her womb, ready to baste her aching eggs./ Nothing could prepare her for the near-biblical flood of [pc.cumNoun] pouring into her womb, filling every crack and crevice. Rivers spray out around your [pc.cockHead] as her belly bulges obscenely. She already looks like a mother{, and you’ve barely begun to breed.");
output("\n\n<i>“You asked for it,”</i> you pant, roughly groping a tit, squirting in endless passion. You’ve long since seeded every inch of exposed womb, yet your body is far from done, not with her scent so thick in your nose, grabbing you by the {balls/cock} and milking out thicker, heavier flows. You flood her middle until she’s absolutely spunk-pregnant, the once-virgin korgonne so fattened that the force of your shots inflating her belly theatens to roll her to the side}.}");
output("\n\nPlush lips press against yours as she relaxes, softly this time. The fire has gone out of the fluffy bitch, quenched by{ a lake of} your cum. She nuzzles into you, tired arms on your shoulders{ as she slowly drags herself off your dick.{ A river of spent jizz sprays from her uncorked cunt onto your [pc.belly].}} <i>“Wow.”</i> She nuzzles your cheek, then licks your nose. <i>“Many cummies. Alien sex hurt-good.”</i> Her eyes twinkle. <i>“Need practice. Make pussy big for alien-cock.”</i>");
output("\n\n//[Next] -> Same post-gasm as regular variant (though make sure the knotting variant isn’t referenced)");
output("\n\n//Regular - no new PG");
output("\n\nShe’s definitely a virgin. The first two attempts do little more than cause your hypersensitized cock to slide through her folds and slip to the side. The third time’s the charm. Her devilishly tight cunny strains around your [pc.cockHead], hymen flexing. She seems like she’s going to take it slow, right up until she grabs your face and stuffs her tongue into your mouth. Plush cyan lips hold you captive while her tongue savors your exotic taste, intermingled with the ripe flavor of her own heated puss. In that moment, her hips scissor downward, splitting her hymen on the altar of your virile masculinity.");
output("\n\n<i>“Ah!”</i> the deflowered dog-woman gasps, drooling webs of spit and vaginal lube. She shudders, her hard nipples begging to be tugged. Further down, her tunnel ripples in mixed agony and ecstasy. The fertile folds feel like they’re milking you for how they clench and flutter, and you realize that you’ve already slipped past the point of no return. Even if you pulled out now, you’d cum from the pheromones clogging your nostrils. If she kissed you, you’d give her every sperm in your body and then some.");
output("\n\n<i>“I’m cumming!”</i> you warn.");
output("\n\n<i>“Good. Give puppies.”</i> She grabs your ears and kisses you again, hips rolling. <i>“Warm... Good...”</i> Eyes closing, her tongue goes still in your mouth as her body seizes everywhere except the cum-hungry tunnel still clenching down around your ecstatically spurting [pc.cockNounSimple].{ Nothing more than dribbles slips out, but she doesn’t seem to mind. She grinds the feeble [pc.cumNoun]-drops throughout her passage, giving your deposit ample opportunity to swim upstream to her aching eggs./ The [pc.cumNoun]-shots fire in deep. Every lance makes her feel warmer and wetter, squelching and hot. You have no doubt that some is slipping upward into her womb, journeying to those aching eggs./ She moans at the feeling of your thick, virile pumps of [pc.cumNoun]. [pc.cumVisc] blobs slip out of her stretched lips{ past your straining knot}. Whole streams of it must be pouring into her womb, ready to baste her aching eggs./ Nothing could prepare her for the near-biblical flood of [pc.cumNoun] pouring into her womb, filling every crack and crevice. Rivers spray out around your [pc.knot] as her belly bulges obscenely. She already looks like a mother{, and you’ve barely begun to breed.");
output("\n\n<i>“You asked for it,”</i> you pant, grinding against her, thrusting and squirting in endless passion. You’ve long since seeded every inch of exposed womb, yet your body is far from done, not with her scent so thick in your nose, grabbing you by the {balls/cock} and milking out thicker, heavier flows. You flood her middle until she’s absolutely spunk-pregnant, the once-virgin korgonne so fattened that the force of your shots inflating her belly theatens to roll her to the side}.}");
output("\n\nPlush lips press against yours, softly this time. The fire has gone out of the fluffy bitch, quenched by{ a lake of} your cum. She nuzzles into you, tired arms on your shoulders{ as she slowly drags herself off your dick.{ A river of spent jizz sprays from her uncorked cunt onto your [pc.belly].}/ as she wiggles in place, stuck on your knot while still more [pc.cumNoun] pours in.} <i>“Wow.”</i> She nuzzles your cheek, then licks your nose. <i>“Many cummies. You best heat-sharer. Not forget.”</i>");
output("\n\n[Next]");
output("\n\nAfter a few minutes to rest{, de-knot,} and recover, the beaming ball of fluff stumbles up off of you, rubbing her belly. <i>“Alien gave much good!”</i> [pc.CumNoun] drips from between her legs to splatter the floor. <i>“Warm inside. You visit? Give more pups?”</i> She looks to you hopefully, but between the cloud of pheromones and the energy-sapping orgasm, you’re tapped out.");
output("\n\n<i>“I guess?”</i>");
output("\n\n<i>“Yays!”</i> Trotting in a circle{, her taut tummy wobbling}, the Korgonne pumps her fist in the air. <i>“Visit Korg’ii Hold. Secret code telling! <b>One awoo in top sparklehole! Third from right.</b>”</i> She takes your hand in her slippery paws and squeezes. <i>“Remember! Sparklehole! Three from right, topdeck!”</i> Bouncing about, the dog-girl spins away and totters out into the snow, seemingly unfazed by the cold. <i>“Tell stories, and give pups!”</i>");
output("\n\nYou’re left alone, secure in the knowledge that you should <i>“awoo”</i> into a specific <i>“sparklehole”</i> if you wish to see the friendly korgonne once more. Perhaps her whole tribe is friendly?");

output("\n\nFirst Time Dad/Chief Meeting");
output("\n\nThe guards hustle you through winding tunnels and up a spiral staircase hewn from solid stone. In stark contrast to the frigid exterior, it’s nearly as warm as a sauna inside Korg’ii Hold. By the time you climb to the next level, you’re {panting and }sweating. No wonder the korgs you pass are naked, tongues hanging loose from their canine maws to assist their attempts to vent heat. You wipe moisture from your brow as your escort comes to a stop.");
output("\n\nIntricately worked script and pictographs crawl across a stone door nearly two korgs tall, its surface polished to a mirror finish. For all the tribal banter and savage behavior, it would seem their clan is home to dedicated craftspeople with skill to rival coreward artisans, however primitive their tools.");
output("\n\nThe bigger of your two guards raps the butt of his spear against the door, then leans to a hole, identical to the hundreds hiding the Hold’s entrance. <i>“Ula’s alien-friend arriving!”</i>");
output("\n\n<i>“Come. Waiting such times!”</i> a gruff voice answers.");
output("\n\nThe big one nods to his shorter compatriot, who twists a handle and pushes, swinging the huge monolithic portal back with surprising ease. From the corner of your eye you can spy a set of heavy hinges, polished to the same sheen as the door’s surface. Light from the chamber beyond dazzles your eyes.");
output("\n\nOnce you adjust to the change in luminosity and uncover your eyes, you’re dazzled by the sheer display of opulence within. Every wall is hewn from whitish stone, the surface worked into carved murals of korgonne heroism. Glowing crystals held aloft by chains of gold cast amber luminance over rocky tapestries, flickering slightly. In one corner, you can see a single armored korg fighting off three frostwyrms single-handedly. In another, a horde of fluffy barbarians riding six-legged bears trample milodans underpaw.");
output("\n\nFurniture of bone and rock decorates the interior. Fuzzy blankets and plush-looking pillows offer comfort to the otherwise unforgiving furniture. In the center of it all is an enormous throne. It dominates the view, and in its center is the undoubted leader of this tribe of korgonne. The heavyset elder regards you with milky blue eyes and strokes the wispy curls of a beard every bit as white as the rest of his fur. You could sit him down in front of a snow-drift and he’d disappear.");
output("\n\n<i>“Huh. Thought bigger.”</i> He squints and leans closer. <i>“You alien? You save Ula?”</i>");
output("\n\nYou nod{ and bow. <i>“It was my pleasure.”</i>/, puffing up your chest boastfully./. <i>“Indeed.”</i>}");
output("\n\nThe chieftain regards you cautiously. <i>“You thanks having. Many aliens greedy. Cruel.”</i> He gestures to a place on the murals where a small group of Korgonne appear to be fighting with a much larger, better-armed battlegroup. <i>“Kill. Steal. Shatter holds for wall-shines.”</i> He waggles fingers decorated with green gemstones, likely emerald or savicite. <i>“You earn chance.”</i> He nods grimly. <i>“Prove not like others. Show friending, and we friending back.”</i>");
output("\n\n{You rush forward to give the big, fluffy dog-guy a hug when the guards grab you by the collar. Well, you’re gonna hug somebody! You round on him and wrap your arms around his straining, muscular back, petting the his head and neck until you hear his tail wagging. <i>“Yay! Friends!”</i>/You extend your hand for a handshake. He stares it. After a minute solid of waiting, you drop your hand and clear your throat. <i>“Uhh... yeah. Friends.”</i> Why can’t they just get with the program and pick up on normal galactic social cues? Ugh. You snort in irritation./You nod gravely. <i>“I shall.”</i>/You nod, trying to hide a smirk at his crude use of language. <i>“Much friending! Very like! Wow!”</i>/You nod severely. <i>“Of course.”</i>}");
output("\n\n<i>“Good.”</i> The white-furred elder staggers up to his feet, back cracking innumerable times. <i>“Sleepings times soon.”</i> He waddles past the chairs and tables toward a curtained-off doorway. <i>“Too old for leading. Go cold soon, am reckoning.”</i> Pausing halfway through the curtain, the old dog turns back to fix a keen eye on you. <i>“Behave self. Treat Ula - any korg - badly, you be wishinged for long cold.”</i> The fabric swishes closed.");
output("\n\nBehind you, the guards shrug and pad off, quietly discussing your anatomy amongst themselves. It would seem <b>you’re now welcome in Korg’ii Hold!</b>");
output("\n\n[Next] -> Normal room descript");
