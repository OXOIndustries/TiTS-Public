//Stocks & Public Use, w/Random Preggo if possible
//Female, bondage via stocks in public, ring gagged, all three holes used resulting in pregnancy from a random <i>“father”</i> with differing potential offspring, or eggs laid in womb/ass/tits. If this is a <i>“crime punishment”</i> that also gives the PC a permanent tattoo because they’re publicly indecent, great - I didn’t get the ship pledge, but I suggest one capital ship to be organic, and have people locked in the engine room and milked with the milk/cum being used as ship fuel. More slaves, faster/long your ships goes! Just don’t accidentally step to close to a milker and get caught yourself or bad end!
//Fetysh

//Miscreant Manor - a pair of stocks on the main New Texas road. Very obviously a hokey, touristy set of ye olde timey stocks... except there are lots of stains on the ground, and a wood-burnt sign declaring that the rapscallion locked inside is ‘open for use’ - paying back society with her holes. Obviously self-latches with a digital timer. PC can voluntarily climb in for a little old timey new texan punishment.

public function showMiscreantManor():void
{
	showName("MISCREANT\nMANOR");
	showBust("MISCREANT_MANOR");
}

public function miscreantManorBonus():void
{
	output("\n\n");
	//Not used
	if(flags["MISCREANT_MANORED"] == undefined)
	{
		output("A set of old timey stocks sit alongside the road, placed in the center of a crudely hewn wooden platform. It has all the markings of your typical tourist trap, complete with a goofy-looking placard declaring it to be “Miscreant Manor.”");
	}
	//Used
	else output("The stocks are still in the same place as the last time, all but inviting you to place your head and hands into the restraints for another punishing visit to “Miscreant Manor.” Despite the hokey name, you know full well you’d be in for the gangbang of your life if you climbed inside.");
	addButton(0,"Approach",miscreantManorApproach,undefined,"Approach","Approach the stocks for a closer look.");
	vendingMachineButton(1, "XXX");
}

public function miscreantManorApproach():void
{
	clearOutput();
	showMiscreantManor();
	//Approach unused
	if(flags["MISCREANT_MANORED"] == undefined)
	{
		output("You climb up onto the platform and look around. Unsurprisingly, the slats are marred by white stains in nearly every direction. Not even the stocks themselves could escape a splattering of salty, New Texan seed. Old style nails and construction techniques hold most of it together - except for “Miscreant Manor” itself. While it looks to be built from simple wood and iron, a number of modern day modifications have been made, not the least of which is a one-hour timer and a high-strength, magnetic locking magnetism.");
		output("\n\nYou can even spot a few sensors - they must only activate the lock if a person is detected as being strapped in. Just below you spot a small warning sticker:");
		output("\n\n<i>Miscreant Manor is typically reserved as punishment for small crimes by citizens, but tourists are welcome to strap themselves in for an authentic taste of frontier justice! Warning: under New Texan law, patrons of Miscreant Manor are considered to consent to any and all sexual acts. New Texas is not liable for vaginal stretching, anal stretching, sexually transmitted pregnancies, muscle ache, residual soreness, or a desire to return to Miscreant Manor.</i>");
		output("\n\nIt looks like a one-way ticket to a massive gangbang.");
	}
	//Approach used
	else output("You climb up onto the platform and look around, wondering which of the white-hued markings are leftovers from your last visit. With all the farmer-cum gushing into, around, and over you last time, you have a hard time figuring out how come the whole platform hasn’t been completely whitewashed. Well, the “Miscreant Manor” sign is still hanging from the stocks, and the timer has reset. You could climb in for another <i>“punishment”</i> gangbang if you wanted.");
	clearMenu();
	addButton(0,"Use Stocks",useMiscreantManor,undefined,"Use Stocks","Let’s be honest, if you do this, you’re just going to get gang-banged.");
	addButton(14,"Back",mainGameMenu);
}

//Use ‘em
public function useMiscreantManor():void
{
	clearOutput();
	showMiscreantManor();
	output("Bending low, you place your head and wrist into the appropriate recesses, then use your free hand to flip the top half over on its hinge, threading your hand through the slot just before it slams down into place. Instead of rough, splintery plank, you find the cuffs and collar lined with a soft rubber. All told, it’s not very uncomfortable.");
	output("\n\nA faint hum thrums emanates below, and heavily accented bull’s voice bellows through a hidden speaker.");
	//No new PG - Preggoz
	if(pc.hasPregnancy())
	{
		output("\n\n<i>“Well howdy there, pilgrim. This kind of punishment might be a little strenuous for a pregnant possum like yourself! Be a dear and come on back once your body’s ready for a thorough breeding!”</i>");
		output("\n\nThe magnetic lock reverses, popping open the stocks in an instant. You’ll have to come back later, when you don’t have a bun in the oven.");
		processTime(1);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	//No vag - no new PG
	else if(pc.totalVaginas() == 0)
	{
		output("\n\n<i>“Well howdy there, pilgrim. This kind of punishment ain’t meant for someone so lacking in feminine endowments! Be a dear and come on back once your body’s ready for a thorough breeding!”</i>");
		output("\n\nThe magnetic lock reverses, popping open the stocks in an instant. You’ll have to come back later, when you have a vagina.");
		processTime(1);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	//Not preggoz. No new PG
	else
	{
		output("<i>“Well howdy there, pilgrim. Looks like you’ve gotten yourself into a plum pickle! ‘Course that’s just what a naughty cow-to-be like yourself wanted. Ain’t it? Well buckle up! A " + pc.mf("tough-looking filly like yourself will have all kinds of suitors lining up to break you in.","pretty filly like yourself will have all kinds of suitors lining up in a jiffy!") + "”</i>");

		output("\n\nThe magnetic lock activates, clicking as it binds the top and bottom of the stocks together so firmly not that even your mightiest heave could budge the sturdy restraints. Faint hisses emanate from the rubber linings around your wrists as they inflate. In the space of a few seconds they completely immobilize your hands. The rubber holds you tight, but not so tightly as to cut off your circulation, leaving you to realize just how completely, totally helpless you’ve become.");
	}
	processTime(2);
	clearMenu();
	addButton(0,"Next",useMiscreantManor2);
}

public function getNTStocksPregContainer(arg:String = ""):PregnancyPlaceholder
{
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	
	if(!pp.hasCock()) pp.createCock();
	switch(arg)
	{
		case "hellhound":
			pp.shiftCock(0, GLOBAL.TYPE_CANINE);
			pp.impregnationType = "AusarPregnancy";
			break;
		case "kaithrit":
			pp.shiftCock(0, GLOBAL.TYPE_FELINE);
			// 9999 pp.impregnationType = "KaithritPregnancy";
			break;
		case "farmer":
			pp.shiftCock(0, GLOBAL.TYPE_HUMAN);
			// 9999 pp.impregnationType = "HumanPregnancy";
			break;
		case "leithan":
			pp.shiftCock(0, GLOBAL.TYPE_SNAKE);
			// 9999 pp.impregnationType = "LeithanPregnancy";
			break;
		case "laquine":
			pp.shiftCock(0, GLOBAL.TYPE_EQUINE);
			pp.impregnationType = "LaquinePregnancy";
			break;
	}
	pp.ballFullness = 100;
	
	return pp;
}
//Randomly assign boners to mouth, each pussy, and asshole.
//Random dudes that can show: Zephyr, Unnamed Hellhound (Ausar Bull), Vacationing Kaithrit Heiress, Kiro, Leithan Male, Treated Male Laquine, New Texan farmer (Always at least one of these). Each gets 2-3 paragraphs per hole.
public function useMiscreantManor2():void
{
	clearOutput();
	showMiscreantManor();
	var x:int = rand(pc.totalVaginas());
	output("Left alone with your thoughts, there’s nothing to do but wait ");
	if(hours >= 6 && hours < 20) output("under the heat of the beating sun");
	else if(hours >= 20 && hours <= 22) output("under the brilliantly-colored evening sky’s radiance");
	else output("under the stars’ crystalline light");
	output(" to be released.");
	var inCunt:int = -1;
	//0 - Kiro
	//1 - Zephyr
	//2 - hellhound
	//3 - kaithrit futa
	//4 - texan farmer
	//5 - Leithan boyslut
	var options:Array = [];
	if(roamingKiroAvailable()) options.push(0);
	options.push(1);
	options.push(2);
	options.push(3);
	options.push(4);
	inCunt = options[rand(options.length)];
	
	//Kiro first
	if(inCunt == 0)
	{
		output("\n\n<i>“[pc.name]? How the... You know what - don’t even answer,”</i> chuckles a familiar voice. <i>“I guess I’d always known you’d sign up for a hard dicking at the first opportunity, but I didn’t expect you’d do it like this.”</i> Kiro steps in front of you, grinning wider than a cheshire cat. <i>“You really are a big-dick-addicted fuck-slut, aren’t you?”</i> She ");
		if(pc.hasHair()) output("ruffles your [pc.hairNoun]");
		else output("pats your head");
		output(". <i>“Good thing I was swinging by ");
		if(rand(4) == 0) output("to get new linings for my milker, huh?");
		else if(rand(3) == 0) output("to make a deposit at the barn, huh?");
		else if(rand(2) == 0) output("to give these bimbos their daily dose of vitamin K, huh?");
		else output("to sell some overpriced crap to these yokels.");
		output("”</i>");
		output("\n\nThe ecstatic raccoon-woman hitches up the edge of her dress, revealing her sheath a split-second before big, fat cock starts oozing out of it. The rich musk of her maleness fills the air as she shifts her hips forward to press the swelling tip of her dick against your cheek. Its fat, blunted tip bulges wider and harder with every beat of Kiro’s thumping heart, laying down a ribbon of pre across your face by the time it finishes growing.");
		output("\n\n<i>“This... this is going in your cunt. You know that right?”</i> She grabs it in both hands, as if it’s too large to wrangle with just one, and drums it playfully against your lips. <i>“And lucky me, I get first dibs. Every bull and blowhard that wanders out here is going to have to settle for sloppy seconds... or thirds...”</i> Kiro pivots on her heel and prowls around you");
		if(!pc.isCrotchExposed()) output(", working you out of your [pc.lowerGarments] as she goes");
		output(". <i>“All this ass...”</i> She flops her dick on your back and pulls your cheeks apart, letting her dick bubble pre-cum into your crack. <i>“...and you’re just hanging it out on her on display.”</i>");
		output("\n\nThe ecstatic kui-tan kneads your butt a little longer, letting her dick slide down... and down... until the pudgy equine cock-tip is lined up with your ");
		if(pc.vaginas[x].wetness() > 3) output("sluttily oozing");
		else output("surprisingly lubricated");
		output(" folds. <i>“I think you’re going to love this even more than I will.”</i> Rocking her hips forward, she spreads you like softened butter, slowly but surely filling your [pc.vagina " + x + "], with ever more dickmeat, pushing until you’re so stuffed that it feels like your hips are going to be dislocated by the sheer amount of prick between.");
		pc.cuntChange(x,chars["KIRO"].cockVolume(0));
		output("\n\nYou moan. There’s no other word for the sound that leaves your lips, no other description for the unquestionably whorish vibrations tickling past your uvula. Kiro thickens inside of you in response, and she thrusts harder, burying her rod so deeply that her glistening, sweat-soaked balls can slap against ");
		if(pc.totalClits() > 1) output("all ");
		output("your [pc.clits]");
		if(pc.totalClits() > 1) output(" simultaneously");
		output(". Her sheath bunches up against your netherlips, one sensitive set of folds kissing another. Moaning again, you notice another figure coming down the road, but it feels too good to do anything but cry out and hope the newcomer will make you feel even better.");
	}
	//Zephyr first
	else if(inCunt == 1)
	{
		output("\n\n<i>“Well, guess I just won the lotto!”</i> You look up to see ");
		if(flags["MET_ZEPHYR"] == undefined) output("a statuesque cow-girl");
		else output("Zephyr");
		output(" looming over you, flashing a toothy smile");

		if (!zephKnowsAboutKids())
		{
			output(". <i>“Tee’s gonna lose his mind when he hears that I got first dibs on the Steele [pc.boyGirl]. To think you’d just strap yourself in for a gangbang with anyone who happens to walk by.");
			if(pc.isTreated() && pc.isBimbo()) output(" Guess that’s to be expected since you took the treatment.");
			else if(pc.isBimbo()) output(" Guess that’s to be expected since you’re just another ditzy bimbo who wandered over to New Texas for a good drilling.");
			else output(" Guess it’s my lucky day.");
			output("”</i>");
		}
		else
		{
			output(". <i>“Is that [pc.name], all tied up and ready to be ridden hard? I’m gonna enjoy this, you loveable little slut. We can just skip the bet bullshit and get right to fucking you full of more kids.”</i>");
		}

		output("\n\nYou tilt your head up for a better look at the nine foot cow-girl, but all you manage to do is bump your forehead into her skirt-lifting erection, every bit as massive as the cow-girl herself... and twice as bestial. It’s bright red and pointed, like a dog’s, and it throbs menacingly the moment it brushes against your temple.");
		output("\n\n<i>“This is going in your pussy,");
		if (!zephKnowsAboutKids()) output(" rich-bitch");
		else output(" my little breeder");
		output(", and everyone that fucks you after is going to know it from the way you gape.”</i> ");
		if(flags["MET_ZEPHYR"] == undefined) output("Zephyr");
		else output("the dick-toting bitch");
		output(" slaps your cheek playfully as she prowls around you, skirting the wood posts to get in position.");
		if(!pc.isCrotchExposed()) output(" <i>“Clothing? You’re even stupider than you look.”</i> A hand strong enough to break you in half rips your [pc.lowerGarments] clean off you.");
		else output(" <i>“No clothes? Maybe you’re smarter than you look.”</i> A hand strong enough to break you in half slaps your ass, nearly bowling you over.");
		output("\n\nThen her cock is inside you. Not just part of the way either. She thrusted in with one powerful thrust, splitting you open and nestling her bone in all the way to the root. You can feel the thickness of her knot spreading your folds wide, promising to split you in half when she finally orgasms. Thigh muscles flex against your [pc.legOrLegs], and she pulls it back, giving you a moment’s respite before she pounds inside hard enough to squeeze the breath from your lungs.");
		pc.cuntChange(x,600);
		output("\n\nYou cry out, not in pleasure, not in pain, but something between. Zephyr doesn’t let that stop her, however. She pounds in and out with quick, firm strokes hard enough to make your rubber restraints flex and twist. Hard enough to make you whimper at your own helpless arousal. Despite the brutal pussy plowing, on some level your body is getting off on it, juicing at the prospect of more hard fucking");
		if(pc.vaginas[x].wetness() >= 3 && pc.legCount > 1) output(", puddling arousal on the wood between your [pc.legs]");
		output(".");
		output("\n\nWhen a figure approaches in the distance, you can’t stop yourself from continuing to cry out. You can’t even suppress the whorish lilt of your voice. All you can do is hope that the newcomer will fuck you every bit as well as ");
		if(flags["MET_ZEPHYR"] != undefined) output("Zephyr");
		else output("this butch cow");
		output(".");
	}
	//Hellhound 1st
	else if(inCunt == 2)
	{
		output("\n\nA loud snort, followed by a soft, pleased-sounding growl stirs you from your thoughts. Two broad, fur-covered feet prowl up to you, tipped with wicked-long claws. Looking up, you follow the carpet of shaggy black fur to the mid-thigh. There it transitions into bronzed skin, still dirty from the fields... and a bulging loincloth, damp with sweat and musk. It’s exactly at head height, and getting closer by the second. Further up you see a well-defined six-pack, gleaming pectorals... and clawed, bestial hands.");
		output("\n\n<i>“Give ‘em a lick.”</i> The command barks forth like plasma from a capital ship’s main battery");
		if(pc.isBimbo() && pc.isTreated()) output(", washing over your eager, treated mind like an irresistible enchantment");
		output(". A claw slices through a simple leather thong, and you are confronted with the sight of the male’s eagerness: a rapidly stiffening shaft, as crimson as the setting sun and flanked by a set of balls the size of oranges, dangling low under the weight of their budding load.");
		output("\n\nYou can smell the Treatment practically pouring off of him, suffusing and enhancing his own rich, animal scent with another odor you can’t quite place, something between cedar and the natural salt of his sweat. It trickles inside you a breath at a time, planting hooks in your head and dragging you forward until your lips are smashed against his balls, greedily tonguing the salty flesh, spreading your [pc.lips]. You can feel the virile load churning within, practically smell the creamy cuntfill just waiting to bubble out into your puss.");
		output("\n\nPre-cum smears over your face the longer you lick, matched only by the liquid excitement leaking from between your thighs, but just as you reach the apex of the jutting, boner, lapping at it with promiscuous promise, it is taken away, leaving your mouth hollow.");
		output("\n\nNot to worry, the hunky stud and his delicious dick reappear a moment later - behind you this time. His dick presses against your [pc.vagina " + x + "], reminding you that you have another set of lips. You arch your back as much as the restraints will allow, lifting your [pc.butt] to give him a better target, writhing in bliss once he finally thrusts inside, the tapered shape of his cock easily penetrating your gates. His hands grab hold of the wood to either side of your head, hard enough for you to hear the wood groan in protest, and you whimper with need as he begins to drill you proper.");
		pc.cuntChange(x,1000);
		output("\n\nCoarse hair and soft fur alike drag along your back as you’re fucked, pounding you into insensibility. A figure is approaching, but you can’t or won’t muffle your cries in the slightest. On some level, you realize, you want the newcomer to join in, praying he smells every bit as sexy as your new ausar stud.");
	}
	//Kaithrit Rich Futa 1st
	else if(inCunt == 3)
	{
		output("\n\n<i>“Oh my, aren’t you a lovely attraction!”</i> chirps a high-pitched voice. You look up at her");
		if(hours >= 10 && hours < 18) output(", squinting to block out the sun,");
		output(" and sigh in relief at the sight of a diminutive cat-girl. Looks like you won’t be getting drilled today.");
		output("\n\n<i>“");
		if(pc.isBimbo()) output("Uhmm, can you like, bring a boy over here to help me out?");
		else if(pc.isNice()) output("I’m not an attraction - I just thought I’d try out these stocks, and the stupid things locked me inside!");
		else if(pc.isMischievous()) output("If anyone here is an attraction, it’s you. Meow!");
		else output("Cool it lady, I was just screwing around with these stocks.");
		output("”</i>");
		output("\n\n<i>“Ohhhh,”</i> she answers, bending low to read the fine print, <i>“you’re a public use slut! You almost had me fooled!”</i> Wiggling her hips, the petite cat-girl pulls a single lace on her bodice, setting of a chain reaction from cleavage to crotch. Straps and buckles pop open. Laces slacken and slip through eyelets, allowing acres of breast-flesh to spill free of confinement - and the whole of her dress to part like a sea, falling behind her a second later.");
		output("\n\nNow that she’s suitably naked, you discover the sinful, shameful truth: she’s a hermaphrodite... and she’s hard. Rock hard. A six-inch kitty prick is jutting from between her legs, lined with rubbery-looking nodules. It twitches cutely, mere inches from your nose as its owner prances closer.");
		output("\n\n<i>“You aren’t allowed to bite, okay? No teeth, or I’ll tell the cops.”</i> She presses it to your [pc.lips]");
		if(pc.isBimbo()) output(", and you open immediately, rolling out your tongue like a red carpet.");
		else output(", and after a moment you let it on in. At least it’s something to do while you’re stuck here.");
		output("\n\nThe kaithrit throws back her head and moans. <i>“Ohhh fuck, you have no idea how badly I needed this. The cows barely pay attention to me, and the bulls are so gross... and sweaty.”</i> She ");
		if(pc.hasHair()) output("runs her fingertips through your [pc.hairNoun]");
		else output("dreamily plays her fingers across your scalp");
		output(". Her hips twitch adorably, feeding her whole length into your mouth until a slim, wet little puss is brushing your chin. <i>“Ohh, you know how to make a girl feel appreciated, slut. You really do.”</i>");
		//SILLY!
		if(silly)
		{
			output("\n\nA sudden sneeze makes you accidentally press your teeth against her nubby cock. She mewls and cums in reaction, quickly pulls out, and disappears before you realize what you have done. A few minutes later, you hear police sirens approaching the stocks.");
			output("\n\nGAME OVER.");
			output("\n\n\n\n\n\n\n\n\n\n\n\n(OR IS IT?)");
			processTime(15);
			pc.changeLust(10);
			pc.exhibitionism(1);
			clearMenu();
			addButton(0,"Next",mainGameMenu);
			return;
		}
		output("\n\nYou hollow your cheeks and suck a little, making her tremble in delight.");
		output("\n\n<i>“Oooohhh, fuck!”</i> The kaithrit staggers back, dick bouncing rhythmically, so hard that every beat of her heart drums it up against her taut belly. <i>“I gotta fuck you! I hope you don’t mind, but I just gotta try you out before you get all gross and cummy!”</i>");
		output("\n\nShe prances around, her heels clicking noisily as she leaves her discarded clothing behind.");
		if(!pc.isCrotchExposed()) output(" She pulls yours out of the way and ");
		else output(" She ");
		output("rubs your [pc.vagina " + x + "] experimentally. <i>“Oh, nice and wet!”</i>");
		output("\n\nYou twist against the rubber, but you can’t escape her fingers no matter how you writhe, nor the excitement she teases from your netherlips. In no time at all, she has your [pc.hips] twitching back against her, aching for her to slip another finger inside. She pushes her cock in instead, giving you a nice warm, cat-dick to tease your cunny. It’s still twitching, smacking into your g-spot, abusing your passage. Despite its small size, it soon has you mewling every bit as eagerly as its owner.");
		pc.cuntChange(x,5);
		output("\n\nYour perverse vocalizations soon lure another figure. That, or they heard the unsubtle ‘smack-smack-smack’ of a happy couple fucking... or they smelled the scent of a ");
		if(pc.inHeat() || pc.isBimbo() || pc.catDog("nyan", "bork", false) == "bork") output("bitch in heat");
		else output("woman in need");
		output(". Whatever the case, they jog faster once you start openly moaning from the sudden appearance of the cat-girl’s fingers on [pc.oneClit].");
	}
	//New Texan Farmer 1st
	else if(inCunt == 4)
	{
		output("\n\n<i>“Well, looks like another curious filly wound up in Miscreant Manor.”</i>");
		output("\n\nYou look up and spy a grinning New Texan farmer, his horns nearly as broad as his stacked shoulders. He’s wearing nothing but overalls, giving you a great look at his chiseled chest when he reaches out to pat your head, surprisingly gentle despite the calloused strength of his fingers.");
		output("\n\n<i>“Don’t you worry your " + pc.mf("ugly","pretty") + " little head. You’re gonna leave here a-grinnin’, that’s fer sure.”</i> The bull fumbles with one of the buttons on his overalls, his fingers too thick to easily work the small fastener. <i>“Stupid things.”</i> Snorting in irritation, he gives it a small tug, and the button snaps, spinning off into the grass. Another short tug later, and his overalls are falling down around his ankles, revealing a half-hard cock nearly as thick as your forearm, half hidden behind coarse pubic hair.");
		output("\n\nHe smells like sweat and sex, like he stumbled fresh out of his favorite cow-girl and on to the road a few minutes ago, the intermingled scents flooding your nose with enough Treatment-enhanced pheromones to flush your skin and make your vision swim. Saliva fills your mouth and bathes your tongue, and it isn’t until the hunky hick is wiping drool from your chin that you realize just how badly you want his dick in your mouth.");
		output("\n\nLucky for you, the hillbilly is getting off on watching you space out over his dick. His cock is rising up, lengthening and thickening until it juts far enough forward for you to get your lips against his glans. He tastes faintly of strawberries, a leftover of his previous lover no doubt, but mostly of his own natural, incredibly <i>male</i> flavor. You hollow your cheeks, drawing him deeper, noisily sucking ambrosial pre-cum from the tip of his dipstick, but he pushes you away, chuckling.");
		output("\n\n<i>“Silly cow, yer suckin’ all the cunt-juice off it.”</i> The horned cowboy slaps his tree trunk of a cock into the side of your face hard enough to make you wonder if it’ll leave an imprint, then stomps off the side, making his way around the back of the stocks. <i>“Guess we’ll see if your pussy makes as nice a coat as " + RandomInCollection(["Betty’s","Tabitha’s","Tammy’s","Mary-Lou’s","Helyah’s"]) + ".”</i> A finger fat enough to function as an axe-handle plunges inside, roughly testing the moisture of your sordid depths.");
		if(pc.vaginas[x].wetness() < 3) output(" You’re silently thankful that his scent made your womanhood drool every bit as eagerly as your mouth.");
		else output(" You’re silently thankful to have a vagina wet enough to drown a succubus.");
		output("\n\nRooting around inside you, the powerfully built male takes his time, leaving you no option but to respond by moistening further, your body helplessly aroused by the scent of him as much as by his raw power. His finger makes you clench. It makes you buck and squirm, and just when you’re considering giving up and grinding off on his palm, he pops the offending digit free - only to replace it with a far fatter, altogether lovelier instrument.");
		pc.cuntChange(x,950);
		output("\n\nThis farmer’s cock is a work of art. You can see that now - the perfect human specimen, and you have it nestled sweetly between your legs. The fattened, mushroom-like head proudly strokes every inch of your walls on its way through, and the arch of the shaft ensures that the pressure and texture vary from the start of the thrust to the cervix-kissing end. Even the veins squiggle in just the right way to make you squirm.");
		output("\n\nYou moan - stars above do you ever! Your body won’t accept anything else. Squeezing your thighs, you milk the cock between your legs like your life depends on it, accepting the fucking for what it is, accepting your own passive, helpless state. He’s going to drill you, and you’re going to love it. You’re probably going to love whatever the figure walking down the road is going to do to you to. Maybe you’ll get a dick back in your mouth.");
	}
	//Leithan Male 1st
	else if(inCunt == 5)
	{
		output("\n\n<i>“Oh wow, oh wow! Is this for real?”</i> Clattering hooves accompany the voice. When you look up, you see the six-legged form of a leithan male, grinning boyishly as he peers over the signage. <i>“It fucking is! This planet is THE - FUCKING - BEST! I get off pop’s ship, go through customs, and even the goddamn gift-shop lady is down to fuck. I can’t trot five paces without some big-breasted terran slut wanting to climb between my legs and sample a bit of six-legged love.”</i>");
		output("\n\nYou can see exactly what he’s talking about too: his girthy cock is already hard, peeking from between his knees with every shift of his body. It’s impossibly long, a result of his centaur-like stature you’re sure, and impossibly hard.");
		output("\n\n<i>“And these stocks have you in the perfect position too! I don’t think I’ve felt so welcomed on a vacation planet in a long, long time. And to think I thought this podunk pit-stop would be boring!”</i> The ecstatic Leithan practically prances around you, cock waggling all the way.");
		if(!pc.isBimbo()) 
		{
			output("\n\nYou briefly consider trying to talk him out of it, to send for help to release you, but knowing this place, it would just bring a bunch of bulls, horny bulls with a bent-over slut to fuck. At least he seems nice, if over-eager. ");
			if(pc.libido() < 33) output("Maybe this’ll even be enjoyable.");
			else if(pc.libido() < 66) output("Still, the younger eager ones typically make up for short fuses with endurance. This should be fun.");
			else output("Maybe he’ll actually be a good lay.");
		}
		else output("\n\nYou briefly consider opening your mouth, but then you realize the best thing you can do is wait. He’s going to be inside you in a moment, and you do so want him to enjoy himself. It’ll take all your considering skills to properly milk a dick like that!");
		output("\n\nThe leithan circles behind you, hooves clattering on the boards. He rears back, his mid-legs falling over your shoulders while his forelegs come to rest on the surprisingly sturdy stocks. You can actually touch the chitinous surface of his legs if you stretch your fingers, glossy and smooth, glowing with its own internal illumination. You don’t have long to appreciate it, however. Another more potent sensation appears between your legs: the sensation of a big, hard cock slipping and sliding past your [pc.vagina " + x + "], blindly thrusting.");
		output("\n\nOnce, twice, thrice, it slides by. It would appear that the third time is <i>not</i> the charm. That’s the fourth. His dick barrels into your pussy, forcefully pushing you wide, flexing to burrow in until it kisses your cervix. The head fattens within you, thickening and dribbling, lubricating itself as it stuffs you fuller than a Christmas turkey. You scream, partly in shock, partly in pleasure. Your body responds to the invasion whether you want it to or not, synapses firing shocks of sensuous delight straight into your cerebrum.");
		pc.cuntChange(x,1100);
		output("\n\nYou grunt, then groan, then moan as he takes you. His thrusts make make your vocalizations staccato, choked off affairs, but they do nothing to hinder the volume of your screamed pleasure.");
		if(pc.legCount > 1) output(" Your [pc.legs] spread wider, entirely on their own,");
		else output(" Your [pc.hips] lift, grinding back into him,");
		output(" rebellious, slutty things that they are. The happily humping leithan chuckles and swats your ass, waving down the closest passerby, inviting him to join in the fun.");
	}
	var args:Array = [inCunt,x];
	processTime(10);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",stocksOralIntros,args);
}

public function stocksOralIntros(args:Array):void
{
	clearOutput();
	showMiscreantManor();
	var x:int = args[1];
	var inCunt:int = args[0];
	//0 - Kiro
	//1 - Zephyr
	//2 - hellhound
	//3 - kaithrit futa
	//4 - texan farmer
	//5 - Leithan boyslut
	var options:Array = [];
	if(inCunt != 0 && roamingKiroAvailable()) options.push(0);
	if(inCunt != 1) options.push(1);
	if(inCunt != 2) options.push(2);
	if(inCunt != 3) options.push(3);
	if(inCunt != 4) options.push(4);
	var inMouth:int = options[rand(options.length)];
	//Kiro
	if(inMouth == 0)
	{
		output("The newcomer resolves into a familiar shape - Kiro, the kui-tan pirate.");
		output("\n\nShe grins at the sight of you, swaggering up with a knowing grin. <i>“Damn, [pc.name], you should’ve called me if you needed a hot dicking. I’ve got a couple gallons swimming around in here with your name on ‘em, ya know?”</i> Slapping your cheek, Kiro lifts them hem of her dress to reveal the full, shapely spheres dangling below her waist, the tubular horse-cock slowly sliding free of its sheath just above. <i>“Since it looks like you’re pussy’s getting nicely plowed, I’m going to put your mouth to use. Open wide!”</i>");
		output("\n\nLike she had to ask. Even assuming that you wanted to keep your mouth closed, the fucking keeps popping it back open, stretching wide with moans big enough to befit the cock plowing away at your [pc.vagina " + x + "].");
		output("\n\nKiro flops her stiffening dick onto your [pc.lips] and pushes it inside in a moment of distracted passion. She’s already oozing pre-cum, pouring a line of ball-brewed sweet cream onto your tongue as she goes. The more she thrusts inside, the thicker and harder she gets, stretching your mouth wider, tightening your lips into an obscene ‘O’. Your jaw threatens to pop by the time she’s reached her full size, thick around enough to choke a lesser cock-sucker and pulsing with so much virile might your mouth and pussy drool in hapless delight.");
		output("\n\n<i>“Aww fuck, your mouth feels good,”</i> Kiro drawls, letting her head loll back in delight.");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" Your lengthy tongue flicks out, casually lapping at her expansive ball-flesh.");
		else output(" You wiggle your tongue appreciatively along the underside, teasing her bestial veins.");
		output("\n\nGrunting, the kui-tan humps your face in response, wrapping her fingers around your head to establish better leverage. In spite of her passions, you can sense that she’s trying to be a gentle lover, pulling back when she senses ");
		if(!pc.isBimbo()) output("you trying not to gag");
		else output("you need to catch a quick breath");
		output(". <i>“I could do this all day,”</i> she quips before gently pushing back in, the ruffled edge of her flare tickling your tonsils. <i>“Mmm, I’m gonna take it slow - let the pleasure build so you can get a nice reward for being such an eager little cumslut.”</i> Her balls slap your chin, and you swear you can feel a thick wad of pre-cum splashing into your belly.");
		output("\n\nYou don’t doubt that she will. Already, you can feel her bloated balls expanding the longer she stays in your mouth.");
	}
	//Zephyr
	else if(inMouth == 1)
	{
		output("The new-comer resolves into ");
		if(flags["MET_ZEPHYR"] != undefined) output("a familiar shape - Zephyr, the Governor’s imposing, nine-foot tall secretary.");
		else output("an imposing shape - that of a nine-foot tall cow-girl dressed in a secretary’s garb.");
		output("\n\n<i>“I should’ve looked through the window sooner. If I had realized someone this fuckable had signed up for a gangbang, I would’ve been first in line, believe me.”</i> The cow-girl smirks and flips up her skirt, revealing a full");
		if (flags["ZEPHYR_RAWDOGGED_PUSS"] == undefined) output(" nine");
		else output(" fifteen");
		output(" inches of stiffening dog-dick. <i>“Good thing your mouth is still open, at least. Don’t feel like starting a brawl for first dibs on ");
		if(flags["MET_ZEPHYR"] != undefined) output("your");
		else output("some slut’s");
		output(" pussy today.”</i> She leans heavily on the stocks, aiming her bright red rocket between your lips. <i>“Start suckin’, bitch. It’ll be more fun for you that way.”</i>");
		output("\n\nWith how hard you’re getting pounded, keeping your mouth closed is an impossibility. Sucking dick is an inevitability.");
		if(pc.isBimbo()) output(" Good thing you’re like, super excited to get your lips around a dick again!");
		output(" You open wide, and ");
		if(flags["MET_ZEPHYR"] != undefined) output("Zephyr");
		else output("the amazonian cow-girl");
		output(" feeds herself inside. She’s thick and musky. Thankfully the tapered shape of it allows her to slide in with ease and begin pumping in and out, each time pressing more tool against your tongue than the time before. You moan around it, your passion vibrating her bestial cock, making it thicken.");
		output("\n\n");
		if(flags["MET_ZEPHYR"] != undefined) output("Zephyr");
		else output("The big-dicked herm-cow");
		output(" grabs ");
		if(pc.hasHair()) output("you by the [pc.hairNoun]");
		else output("you by the back of the head");
		output(" and abruptly pumps her hips, popping the fat bulge at the base of her spit-shined prick into your maw. <i>“Atta cow,”</i> she half-grunts, half-sighs, savoring the warmth for a few seconds, <i>“take it all.”</i> Her thighs flex, and she pistons back and forth, making your cock-stretched lips audibly pop over her knot again and again. <i>“I’m going to give you such a lovely snack.”</i>");
		output("\n\nYou don’t doubt that she will.");
	}
	//HELLHOUND
	else if(inMouth == 2)
	{
		output("The new-comer resolves into the shape of a hellishly large ausar wearing little more than a dirty-looking loincloth. He’s grinning, eyeing both you and your partner in equal measure, but his burning, coal-black gaze fixates on your mouth. Those eyes are unlike any others you’ve seen. Their casually dismissive yet incredibly possessive gaze makes you feel more like a piece of furniture than a [pc.manWoman], though judging by the way his loincloth is starting to lift, sex-toy may be more appropriate.");
		output("\n\n<i>“Open up, bitch,”</i> he growls, grabbing your cheeks in his meaty hands and squeezing until you’re forced to pop your mouth open. Not even his roughness can stifle your moans or the mounting pleasure between your thighs. Your [pc.tongue] flops out");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(", dangling to your [pc.chest]");
		output(", drooling from the pernicious excitement. Ripping off his loincloth with his free hand, the hellhound releases his tremendous bulge to the open air, and with it a cloud of long-contained musk, thick enough to tickle a sneeze from your nose.");
		output("\n\nThe black-furred stud laughs at that, letting go of your face if only to slap hit with the side of his meaty, bright-red pole. <i>“What’s the matter slut? ");
		if(flags["SUCKED_HELLHOUND"] != undefined) output("Forgot what a real man’s cock smells like?");
		else output("Never smelled a real man’s cock before?");
		output("”</i> The rich aroma clings to your reddened cheek in the wake of the tremendous impact. It’s dizzyingly masculine, and not necessarily in an unpleasant way. For a moment, you try to place it, but the dick plowing your pussy swiftly steals your concentration. What’s important that it smells like him, and in a moment of surprising clarity, you decide that you like it.");
		output("\n\nOr rather, your body likes it. Your [pc.vaginas] ");
		if(pc.totalVaginas() == 1) output("is");
		else output("are");
		output(" going from whorishly sopping to wantonly drooling just from breathing it in. You twitch your nose, subconsciously sniffing for greater concentrations of his pheromones, letting your tongue wiggle and lick your [pc.lips] until they shine. Then, you open wide, entirely of your own volition. He doesn’t have to pry your salivating mouth open. He doesn’t even have to talk, he just has to flop that bitch-breaking staff onto your [pc.tongue], and you’ll suck right on in.");
		output("\n\nHow fortunate that he does! You suck the built ausar’s prong into your slavering maw like your life depends on it, hollowing your cheeks and drawing him in until the swelling knot at his base is kissing your straining lips, forcing you to breathe through your nose. Cloying musk flows into you, worming from your lungs into your blood. There, it can pump all around your body - some to your head, making it so much easier to see the appeal and eroticism of this incredible specimen, but much, much to the delta");
		if(pc.totalVaginas() > 1) output("s");
		if(pc.legCount > 1) output(" between your [pc.legs]");
		else output(" below");
		output(", setting off cascades of endorphins, warming your cunn");
		if(pc.totalVaginas() == 1) output("y to a pool");
		else output("ies to pools");
		output(" of feverishly simmering slut.");
		output("\n\nYour mouth and your [pc.vagina " + x + "] both drool around their lucky dicks, and you wouldn’t have it any other way. Sucking cock seems almost automatic, and getting fucked like this takes no effort at all. You can hang in the stocks and squirm and moan, licking and lapping your hellhound lord’s length, savoring his taste just as much as his manly musk. He’s loving it too. You can tell by the way he saws in and out of your mouth and rolls back his eyes when your tongue braves the folds of his sheath.");
		output("\n\nThe nameless, treated ausar picks up the pace, his fuzzy nuts pulsing hotly. You can feel his passion practically boiling off of them as they go into overdrive, brewing you up a hot, creamy load of ausar cum. Maybe it’s the overpoweringly virile scent he exudes, but you swear you can actually smell the salty aroma of his churning seed.");
		output("\n\nPre-cum oozes onto your tongue. Your mouth waters, and your pussy creams.");
		IncrementFlag("SUCKED_HELLHOUND");
	}
	//KaithritFuta
	else if(inMouth == 3)
	{
		output("The new-comer resolves into the shape of a well-dressed kaithrit maiden, who despite her generous curves is clearly no Treated Texan. <i>“Ohh, what a lovely attraction,”</i> she purrs at the sight of you. Her eyes flick back to your current partner, but her grin only widens at the sight of you getting absolutely plowed from behind. <i>“You’re a public use slut then, I take it?”</i> She barrels on without waiting for a response. <i>“I am so in need of relief. The males here are so... gross... and uhm... sweaty.”</i> Her ears flick nervously. <i>“And the cow-girls won’t even give me the time of day. No matter! You’ll do nicely.”</i>");
		output("\n\nDelicate fingers tug at a single piece of lace on the cat-girl’s bodice, but from that one point comes a chain-reaction of popping buckles, whipping straps, and seam-opening movement. Just like that, the kaithrit transforms from prim and proper lady to naked, dick-girl slut, already hard. Her six-inch, nubby kitty-cock is bobbing eagerly, jutting accusingly in your direction, and her tails swish playfully behind her.");
		output("\n\n<i>“Just don’t use your teeth.”</i> She steps closer, grinning conspiringly at your other current user. <i>“If you do, I’ll call the cops. I mean it.”</i> Running her hands ");
		if(pc.hasHair()) output("through your [pc.hairNoun]");
		else output("over your head");
		output(", the horned-up tourist admires the sight of you, watching you heave and moan. <i>“We can both enjoy this, sweet pea. I’m told that a dick in the mouth can be quite invigorating when paired with one in the puss.”</i> She rocks her hips forward, placing her cock an inch away from her mouth. When it throbs, it bounces up almost high enough to bump your nose.");
		output("\n\n<i>“Go on, suck.”</i>");
		output("\n\nYou moan instead, thrashing against the cock in your [pc.vagina " + x + "], too enamored by the powerful fucking to pay attention to the six-inch dick in front of you.");
		output("\n\n<i>“Stupid slut,”</i> the cat-girl mumbles, shoving herself into your open mouth. Rather than fighting it, you wiggle your tongue and seal your lips around it, enjoying her exotic texture and foreign, almost spicy flavor. <i>“Oooh, that’s the stuff,”</i> she moans, shuddering against you. She grabs hold of the boards above and jerks her hips, humping your mouth with cute little thrusts. For a dick-girl, she’s remarkably feminine in how she fucks your face. She’s clearly conscious of your comfort, never pushing in too hard, never grinding her crotch into your [pc.lips].");
		output("\n\nAnd her dick itself seems every bit as courteous. Its pre-cum is sweet and tasty. It never leaks more than a droplet at a time, just enough to make your mouth slicker and wetter. Never enough to make you choke or gag. You hollow your cheeks and suck in response, figuring you should respond in kind, teasing the sensitive nublets with the tip of your tongue until her knees are knocking together and the cock-carrying kaithrit looks about to fall over.");
		output("\n\nShe doesn’t, of course. She just fucks your face, reveling in the vibrations your moans radiate through her pole. Sometimes, she even whimpers a polite <i>“Thanks”</i> or <i>“Yes please!”</i>");
	}
	//New Texan Farmer
	else if(inMouth == 4)
	{
		output("The new-comer’s shape resolves into a swaggering New Texan farmer. He’s still wearing his dirty overalls and carrying a pitchfork after a long day in the fields, but the big brute doesn’t look the least bit winded, despite his sweat-oiled skin. He looks eager and hungry.");
		output("\n\n<i>“Well aren’t you just a tall drink of water,”</i> he drawls, hooking his thumbs into his overalls and stepping up onto the platform. <i>“Just the thing a thirsty farmer needs on the way home to his loving wife.”</i> He chuckles and pulls, snapping the fasteners so that his denim garments fall to the ground. <i>“Shame she ain’t here. She’d love to french the spunk right out of your mouth once I’m done.”</i> Fingers thicker than a cow-girl’s wrist gently stroke your cheek. <i>“");
		if(pc.isTreated() && pc.isBimbo()) output("Aren’t ya glad ya gotcherself Treated?");
		else output("Shame ya aren’t treated yerself. But maybe this’ll change your mind. Even a core-hugging slut like you has to see Texans have more fun.");
		output("”</i>");
		output("\n\nYou start to answer, but a particularly forceful, cervix-kissing thrust sucks the words right out of the mouth, leaving nothing but delighted grunts and moans in their place.");
		output("\n\nHis cockhead plugs your [pc.lips] before you can gather your wits. The helmet alone is big enough to sorely stretch your mouth. The veiny tree trunk behind ");
		if(!pc.isBimbo()) output("seems an almost impossible task");
		else output("seems like the perfect through-plug to a bimbo like you");
		output(". He smells nice too, like sweat and hay and sex, all bundled up together until you can’t tell one from the other. And since you’re forced to breathe exclusively through your nose, you’ve no choice but drink in his manly aroma, all thick and hard and <i>urgent</i>.");
		output("\n\n<i>“Don’t fight it, sugar. Just let it happen.”</i> The built bull thrusts forward, popping his gloriously drooling crown past your [pc.lips] and onto the middle of your tongue. His cum doesn’t taste like normal cum at all! It’s ");
		if(pc.isBimbo()) output("like, ");
		output("way better, like a sugary drink that fizzes on your tongue, only syrupy and sensuous. You swallow it, the corners of your mouth straining to smile. Somehow the flavorful pre-spunk makes the troublesome girth almost pleasant - that or the pleasant plowing your pussy is receiving.");
		output("\n\nYou waggle your flattened tongue as he pushes in further. Calloused fingers play with your [pc.ears]. A thumb brushes the flushed skin alongside your chin. <i>“Atta girl, I knew you could do it.”</i>");
		output("\n\nHis dick feels like it goes on forever, just like the sweet cream it oozes. Whenever his cock feels overwhelming, you just swallow a little more of his slick treat and relax, letting him push in farther.");
		if(pc.isBimbo())
		{
			output(" You silently thank ");
			if(pc.isTreated()) output("the Treatment");
			else output("science");
			output(" for your complete lack of a gag reflex. You even give the drooly bull a wink when he burrows into your esophagus, milking him deeper with swallowing contractions.");
		}
		else output(" You keep expecting your gag reflex to kick in, but even when he’s pressed to the back of your throat, all you can feel are pleasure and excitement. Your uvula gets flattened to the roof of your mouth, pushed out of the way to make room for the dick burrowing into your throat. Experimentally, you swallow, the muscular contraction pulling him deeper into your esophagus - and earning you a deep, bass groan for your work.");
		output(" You gorge yourself on that dick, pulling it into your gullet until the farmer’s coarse pubes are pressed to your nose.");
		output("\n\nHis pre-cum can pour directly into your belly like this. You’re pretty sure you can feel it spurting out in out-sized globs, easily bigger than a lesser man’s orgasm. Gurgles ripple through your tummy in response, almost drowned out by the wet slapping sounds coming from your increasingly well-fucked haunches.");
		output("\n\nThen the farmer pulls his favorite tool out... most of the way, anyhow. His bloated mushroom stays just inside, keeping you plugged and happy, pouring enough pre-cum into you to lubricate you from lips to anus. He tastes <i>so good</i>. You whimper, and the pleasant vibrations spur him into thrusting back inside. It’s no gentle insertion this time. He’s fucking your mouth now, pumping what feels like two feet of cock in and out of your throat every second.");
		output("\n\nDroplets of sweat fall from your redneck Adonis like rain, smearing your forehead as he humps you. His balls slap your chin, heavy and wobbling, so full of cum that they feel more like gelatin than human organs. Your vision swims for some reason, maybe the pleasure or this dude’s pheromones. Whatever the case, you let your eyes drift closed to focus on the sensations themselves. You don’t need to see to suck. You don’t need to look to fuck.");
		output("\n\nAll you need to do is let them use you.");
	}
	pc.changeLust(100);
	processTime(10);
	var args:Array = [inCunt,inMouth,x];
	clearMenu();
	addButton(0,"Next",stocksMiddleUsageAndCumStart,args);
}
	
public function stocksMiddleUsageAndCumStart(args:Array):void
{
	clearOutput();
	showMiscreantManor();
	var x:int = args[2];
	var inCunt:int = args[0];
	var inMouth:int = args[1];
	//A bit of generic getting plowed from both ends and cumming
	output("The rubbery seals around your arms and neck hold you relatively still, but not even they can fully arrest the motions of your public fucking. You rock back and forth, bounced between the dicks impaling you on either end, feeling every ridge and vein on both ends as they use you. Your [pc.vagina " + x + "] squelches wetly, loud enough for passersby on the street to hear, loud enough to make you blush with shame and lust. What’s happening to you doesn’t sound like lovemaking");
	if(inMouth != 3) output(", not with those balls slapping so perversely against your chin");
	output(". It sounds like slut-fucking - brutal, licentious breeding, the kind you’d see recorded for pornography.");
	output("\n\nThe ");
	if(pc.libido() < 60 && !pc.isBimbo()) output("worst");
	else output("best");
	output(" part is how much you’re enjoying it. You could almost cry for how good it feels, how it makes your heart thump in your chest. Your nostrils flare like a beast in heat, not a civilized, reasoning being. Powerful clenches shiver through your [pc.vagina " + x + "], gripping the big, fat cock inside, coaxing it to give up its creamy treasure. At the same time, you moan whorishly, drunk on pleasure and dick, letting your tongue slip out to fondle the ");
	if(inMouth != 3) output("sweaty balls below.");
	else output("silken slit below.");

	output("\n\nA tidal wave swells inside you whether you want it to or not, building higher with every back-and-forth bounce, transforming the motions of your gifted partners’ thrusts into a splashing tsunami of white-hot ecstasy. You feel it roll out of your [pc.vagina " + x + "]");
	if(pc.isSquirter()) 
	{
		output(", splashing [pc.girlCum] on the ground");
		if(pc.legCount > 1) output(" between your [pc.legs]");
	}
	output(", bursting up through your quivering, boneless middle until your eyes roll back and your tongue flops limply against its prick, too pleasure-drunk for even the most basic of fellatio.");
	output("\n\nFloating away on bliss, your brain checks out on perceiving anything beyond the rough usage of your body. You may as well be two stuffed and drooling holes, connected by a body whose sole purpose is passing on the pleasure to your short-circuiting cerebrum. The cocks are getting fatter too, pumping up on blood and pre-cum the closer they get to climax, filling your greedy holes more effectively than ever before.");
	//Cuntgasms first!
	//Kiro
	if(inCunt == 0)
	{
		output("\n\nKiro loses it first. You can tell by the way her turgid totem pole bloats at the tip, expanding faster than the foam used to plug damage in deep space, and just like that same foam, it creates a perfect seal. There’s not room for a single droplet of cum to escape your [pc.vagina " + x + "], not even when Kiro dumps what feels like a gallon of kui-tan cum directly into your waiting womb. You feel the warmth explode inside you, curling up either side as your fallopian tubes flood with sticky spunk.");
		output("\n\nAnd that’s just the beginning. Kiro’s heavy balls jiggle against your [pc.thighs] as they begin to contract, forcing greater volumes of virile frosting into a body that was never designed to expand quite so quickly outside of pregnancy. Your [pc.belly] feels tighter and tighter as it swells");
		if(!pc.hasFur() && !pc.hasFeathers() && !pc.hasChitin() && !pc.hasScales()) output(", the [pc.skin] turning glossy and stretched");
		output(" in the span of a few seconds. Still, Kiro keeps climaxing and slapping your ass, letting the pressure build so high that her massive flare is finally forced to give way.");
		output("\n\nStreamers of jism fountain back against the tanuki-like alien, bathing her balls in her own ridiculous sexuality. The cum is everywhere. It sloughs down your [pc.legOrLegs] and splatters noisily against the wooden planks. It sounds almost like there’s a farmer there, dumping out bucketfuls of milk. You shudder, shamed at being used so publicly and simultaneously aroused by the idea of bathing your eggs in so much hyper-potent sperm.");
		output("\n\nKiro gasps when her prodigious flow finally slows. <i>“Just what we both needed, I think.”</i> She pats your reddening ass with a grin and pulls out, releasing a second tide of warm white, allowing your straining middle to partially deflate.");
		output("\n\nPart of you misses the feeling already.");
		pc.loadInCunt(chars["KIRO"], x);
	}
	//Zephyr
	else if(inCunt == 1)
	{
		output("\n\n<i>“Let’s hear your best moo, slut!”</i> Zephyr cries at the edge of her own climactic peak. <i>“Moo!”</i>");
		output("\n\n");
		if(pc.isTreated() || pc.race().indexOf("cow") != -1) output("If your mouth weren’t so full of cock, you’d be grinning deliriously, but you try your best. <i>“Mmmrrphhh!”</i> The happy, oozing cock in your mouth throbs on your tongue from the vibrations, so you try again, this time louder, <i>“MMMRRPHWW~!”</i>");
		else output("You’d probably feel a little offended if it didn’t feel so goddamned <i>sexy</i>. She humps you to the hilt, popping that knot inside, and you do the only thing you can think of: you try to moo through the prick in your mouth. It comes out as a muffled, <i>“Mmmrph,”</i> but that seems to do the trick.");
		output(" Zephyr roars triumphantly and yanks down on your hips, flattening your [pc.butt] against her gleaming abdominals, forcing every millimeter of her bestial dong inside your lips’ slick embrace.");
		output("\n\nThe amazon’s knot pumps up in seconds, massively inflating to the rhythm of her powerful heart. It’s delicious, the way it stretches you, pauses, then stretches you some more. You could probably cum from this alone, but the horny she-stud isn’t content with merely cumming. She keeps trying to hump you, jerking her hips in tiny back-and-forth movements, dragging a knot that feels more like a beach ball than part of her anatomy through your vulnerable passage.");
		output("\n\nThen you feel the cum, not in your pussy but in your womb. It manifests as a muted, half-felt warmth. In a way, it reminds you of taking a shot of whiskey. That warmth intensifies, radiating outward with every spurt of spunk, twisting to fill up every inch of your fallopian tubes. And still, the cow-girl keeps cumming. It feels like it has gone on for minutes already, but her knot will not deflate. She hump and humps, and you’re left with the impression that even though her orgasm has wound down, she’s still pouring spooge into your body the moment her balls finish brewing it.");
		output("\n\nAt some point in the half-hour long dick-binding, you cum again, but it’s difficult to tell when it starts and when it stops. You’re floating on cloud nine as it is, caught between orgasmic afterglow, sensuous pleasure, and the ecstasy of giving yourself to potential impregnation.");
		output("\n\nYou’re too out of it to notice when Zephyr reluctantly withdraws, audibly popping her knot from your ruined-looking pussy. White trickles down your well-used thighs while you feel a cool breeze against parts of you never meant to be exposed to open air.");
		if (zephKnowsAboutKids()) output(" She whispers loving words into your ear before leaving.");
		output("\n\nYou miss her already.");
		pc.orgasm();
		var ppZephyr:PregnancyPlaceholder = getZephyrPregContainer();
		pc.loadInCunt(ppZephyr, x);
	}
	//Hellhound
	else if(inCunt == 2)
	{
		output("\n\nThe savage ausar doesn’t bother giving you a warning.");
		if(pc.hasHair()) output(" He just reaches across the stocks to grab your [pc.hair] and give a painful yank.");
		else output(" He just grabs hold of your middle with a hand big enough to palm a prize-winning watermelon and shifts your whole body to better accept his cock.");
		output(" Then, he cums. He slams his knot home a split-second before it expands to its full, pussy-gaping size. It feels like it inflates all at once, forcing you so wide open that the pain and pleasure war for your attention, mixing together into a soup of confused sensation that restarts your orgasm all over again.");
		output("\n\nYou whine as you climax, nearly inaudible beneath the hellish hound’s bass rumbles of pleasure. His seed shoots into you in thick, potent jets, first flooding your passage with perverse heat, then flooding into your womb thanks to the pressure his expansive knot generates. It’s a bizarre but not entirely unwelcome sensation, and as the jizz sloshes into your uterus, you realize the pain of being so sorely stretched has faded. There’s only a little irritation left in your [pc.vagina " + x + "], the kind of soreness that says, <i>“I’ve been fucked so hard I’m going to walk bow-legged... and I’d do it again in a heartbeat.”</i>");
		output("\n\nMoments pass like that: two bodies shuddering against one another, bathing the other in their reproductive fluids. He calms first, but that dick... oh stars, that dick. It doesn’t soften in the slightest. You’re stuck to the brute, but his attentions have turned tender.");
		if(pc.hasHair()) output(" He strokes your hair apologetically");
		else output(" He lovingly strokes your [pc.hips]");
		output(", muttering tender nothings so deep that you feel the vibrations more than hear the words. When you gurgle around the dick in your mouth, he caresses your back comfortingly, and you swear his turgid doggie-dick pulses reassuringly.");
		output("\n\nAn eternity passes like that, but it must be closer to an hour. Eventually, his dick does soften, allowing him to pop free and stagger off, whistling happy. The studly ausar doesn’t bother to look back over his shoulder, but you do catch sight of him out of the corner of your eye. He gathers the mixed sex-juice from his prick with a finger and lifts it to his lips, then resumes his jaunty tune. Evidently he liked what he tasted.");
		output("\n\nYour thoroughly gaped, cum-drooling vagina did too. It wants more. You could always come back later and hope he remembers you. You won’t forget him.");
		// lazyfen is too lazy to bother wiring up an ausar cumdump atm.
		var ppHellhound:PregnancyPlaceholder = getNTStocksPregContainer("hellhound");
		pc.loadInCunt(ppHellhound, x);
	}
	//Kaithrit
	else if(inCunt == 3)
	{
		output("\n\n<i>“O-oh! Oh! Ohhhh!”</i> the kaithrit cries from behind you, thrusting in as hard as her petite body will allow. Her jiggling udders bounce hard enough to slap into the small of your back, and then you feel her cumming, pouring all of her pent-up lusts directly into your sweltering pussy. It’s a lovely little orgasm, one that bathes your g-spot in warm, delicious cum. The feeling almost restarts your own orgasm, making your [pc.hips] shudder in hyper-sensitive aftershocks.");
		output("\n\nCat-cum pools along the bottom of your [pc.vagina " + x + "] by the time the sex-kitten finishes releasing her load. When she pulls out, some of it slops out with her, smacking wetly to the boards below, but you’re fairly certain that some got into your womb as well, if the pleasant glow emanating from your belly is any indication.");
		output("\n\n<i>“Thanks for that. If I see your boss, I’ll be sure to recommend you for a promotion,”</i> the panting kaithrit purrs, <i>“I swear it felt like your pussy was actually begging for me to cum inside it.”</i> She staggers away, shaking her head, mumbling, <i>“What a pro...”</i>");
		output("\n\nYour [pc.vagina " + x + "] may have acquired a healthy glaze, but without the warm, pulsing rod inside, it just feels empty.");
		// lazyfen is too lazy to bother wiring up a kaithrit cumdump atm.
		var ppKaithrit:PregnancyPlaceholder = getNTStocksPregContainer("kaithrit");
		pc.loadInCunt(ppKaithrit, x);
	}
	//New Texan Farmer
	else if(inCunt == 4)
	{
		output("\n\n<i>“Good girl,”</i> the burly bull grunts, savaging you with pussy pleasing thrusts. Strings of pre and feminine excitement leak down your thighs, dragged out by the backstroke and immediately replaced by fresh squirts of liquid farmer. <i>“Don’t strain yerself too hard from cummin’ yer brains out, sugar, but I reckon I’m gonna cum myself.”</i>");
		output("\n\nHe’s gonna wha... <i>OH!</i> You feel him go off inside you halfway through the thought, gushing like a shaken soda bottle. The spunk goes everywhere. It floods your insides, pushing bits of it into your womb. It backwashes out over his balls. There’s even small squirts that puddle on the boards below. Somehow he keeps cumming too, keeps squirting fresh lances of baby-making goo directly into your womb. You’re pretty sure you can feel it inside you, making your [pc.belly] pooch out a little farther, making sure that every square inch of reproductive systems is absolutely, torrentially drenched.");
		output("\n\nGrunting heavily, the beast of a man makes a few last thrusts against your upraised ass, then stills, breathing heavily. <i>“That was a downright respectable ride, little missy.”</i> More spunk puddles out of your stuffed cunny. <i>“");
		if(pc.isTreated()) output("We’ll make a citizen out of you yet.");
		else output("Better than most girls who ain’t been Treated yet. Give it a try. I think a sweet thing like you ought to like it.");
		output("”</i> Then he pulls away, allowing a foot of half-hard dick to flop out, dripping. The New Texan hikes up his overalls, and after a few minutes of fumbling with fasteners a touch too small for his fingers, ambles on his way.");
		output("\n\nPart of you is pleased as peaches that he didn’t bother to clean off his dick. He’s going to smell like you for the rest of the day. The rest of you, mostly ");
		if(pc.legCount > 1) output("between your [pc.legs]");
		else output("your [pc.vagina " + x + "]");
		output(", misses his powerful, confident strokes. At least you can squeeze your muscles and feel his creamy deposit rolling around inside of you.");
		// lazyfen is too lazy to bother wiring up a texan farmer cumdump atm.
		var ppFarmer:PregnancyPlaceholder = getNTStocksPregContainer("farmer");
		pc.loadInCunt(ppFarmer, x);
	}
	//Leithan
	else if(inCunt == 5)
	{
		output("\n\nThe Leithan’s thrusts are getting less coordinated, but far more powerful. He slams into you hard enough to make the otherwise forgiving restraints bite into your [pc.skin]. Animalistic hips slap into your [pc.butt] unceasingly. <i>“Oh shit! Oh shit, I’m gonna cum! I’m gonna cum in some New Texan slut!”</i> He sounds almost in awe, begging you to wonder ");
		if(flags["LEITHAN_STOCKED"] != undefined) output("if he’s ever fucked anyone else");
		else output("if he’s ever fucked anyone before");
		output(".");
		output("\n\nThe eager male buries himself in to the hilt and erupts. What he lacks in experience, he makes up for in volume. You can feel his passionate discharge surging into you, flooding your channel so thickly that luxurious wads pour out from between your [pc.thighs]. It’s a sloppy, animalistic climax, no doubt about it. You shudder beneath him and nearly cum all over again. Thrilling at the feeling of his spunk coursing inside of you, you lift your [pc.hips] to better collect it, never mind that gallons are likely trickling into your womb. Never mind that the raw sensation of getting used like this, getting bred on a first come, first serve basis, is nearly as powerful a pleasure as orgasm itself.");
		output("\n\nAfter he finishes cumming, your lucky suitor awkwardly canters back, leaking enough cum in his wake that a tracker might mistake him for a white-hued galotian.");
		output("\n\n<i>“Sweet fuck, that was awesome.”</i> The leithan slaps your ass, then nervously giggles. <i>“Uh, thanks again for that! I better get back before they find out I was here!”</i> He trots away, waving giddily on his way by. <i>“Thanks again!”</i>");
		output("\n\nPart of you is glad the bulky brute is no longer weighing down on you. The rest of you, mostly between your [pc.thighs], is wondering if anyone is going to come get sloppy seconds.");
		IncrementFlag("LEITHAN_STOCKED");
		// lazyfen is too lazy to bother wiring up a leithan cumdump atm.
		var ppLeithan:PregnancyPlaceholder = getNTStocksPregContainer("leithan");
		pc.loadInCunt(ppLeithan, x);
	}
	processTime(10);
	pc.orgasm();
	var args:Array = [inCunt,inMouth,x];
	clearMenu();
	addButton(0,"Next",stocksMouthgasms,args);
}
	
public function stocksMouthgasms(args:Array):void
{
	clearOutput();
	showMiscreantManor();
	var x:int = args[2];
	var inCunt:int = args[0];
	var inMouth:int = args[1];
	//Changing of the guard!
	output("You suck the cock in your mouth like it’s your favorite flavor of popsicle, humming and bobbing back and forth on the masculine length. It’s as close as you’re going to get to another cock in your pussy, at least for now, and you satisfy yourself with it as best you can.");
	output("\n\nIt’s not good enough. No matter how lewdly you slurp or how voraciously you fellate, you’re still unquenchably horny and unfulfilled. You need orgasms, and you need them now. You need a big, fat dick");
	if(pc.legCount > 1) output(" between your [pc.legs]");
	else output(" between your [pc.thighs]");
	output(", sloshing around in the sea of spent sperm, plugging the leak between your legs with more virile fluid. It’s unfair! Why is there only cock in your mouth, leaking onto your tongue and turning you on when you have no way to sate the devilish itch below?");
	output("\n\nWhat’s that? Is that... yes! It is! A small crowd is meandering up to the platform, chuckling something about how Miscreant Manor is worth its weight in gold. The whole lot circle behind you, shuffling as they do so that you have no idea which will take you first. All you know is that most of them are New Texans. A few looked like tourists, and some might be hermaphrodites or shemales, judging by their feminine faces.");
	output("\n\nYou cannot ponder long. Cock soon finds its way into your sodden, well-fucked gash. The oozing, leftover spunk lets it slip right in with a modicum of effort, and you’re launched back onto cloud nine before you can complete a single, grateful thought. Cum drips down your [pc.thighs], thick and heavy, mixed with your new friend’s pre as well as your [pc.girlCum]. You swoon at the feel of it, barely able to keep your tongue moving along the underside of the twitching, orgasmic dick in your mouth.");
	//Mouthgasms!
	//Kiro
	if(inMouth == 0)
	{
		output("\n\n<i>“Here it comes!”</i> Kiro bellows, slamming her fuzzy crotch into your [pc.lips], her musky equine sheath bunching lewdly against you. You feel the titanic cum-vein on the underside bulge. At first, it merely thickens. Then, balloon-like bulges pump down its length, deforming against your tongue as they migrate deep into your throat. Squirting out into your belly, the kui-tan cum leaves you feeling warm from head to toe. It fills you in a way that nothing else ever could, and it never seems to run out.");
		output("\n\nSperm trickles from the corners of your mouth as the hyper-endowed tanuki continues to climax. Your [pc.belly] bloats and expands");
		if(pc.bellyRating() > 35) output(", more than it was already. More than you ever thought possible");
		else output(" larger by the second, wobbling obscenely with its own liquid weight");
		output(". You feel more like a balloon than a [pc.manWoman], and once it finally becomes too much to bear, Kiro begrudgingly pulls out.");
		output("\n\nWhite gunk explodes onto your face like water from a firehose, forcing you to close your eyes. It cascades down your chin, and when you do manage to blink past the gummy stuff enough to see, all you can make out are Kiro’s hands frantically pumping, birthing another wave of blinding alabaster. You let your tongue hang out and revel in the liquid debauchery of it all. Cum paints your face and sloshes in your [pc.vagina " + x + "].");
		output("\n\nYou’re practically creme-filled... and still getting glazed. You shudder in climax, moaning louder and hotter, spurring Kiro to squirt still more upon you. It splatters the boards and coats your back. Pearly bliss oozes down your [pc.hips] and elbows, completing the thickest coat of paint you’ve ever seen.");
		output("\n\nAt some point, the orgasmic splashes stop falling. A familiar voice says something grateful sounding, and another cock winds its way into your lips. You hum happily and suck, curious how they’ll match up to the kui-tan cum cannon.");
		pc.loadInMouth(chars["KIRO"]);
		pc.applyCumSoaked();
		pc.orgasm();
	}
	//Zephyr
	else if(inMouth == 1)
	{
		output("\n\nZephyr grunts and growls, then bellows, <i>“Here it comes ");
		if(pc.isTreated() || pc.race().indexOf("cow") != -1) output("cow");
		else output("bitch");
		output("!”</i> Her knot pops in, right behind your teeth, and swells, expanding with enough force to pry your jaw wide open. It aches, only mildly dulled by the pleasure coursing through the rest of you, but the amazonian dick-girl doesn’t seem to care in the slightest.");
		output("\n\nYou ");
		if(!pc.isBimbo()) output("nearly gag from the first squirt of her cum");
		else output("nearly cream yourself from the first taste of her yummy, Treated cum");
		output(", squirted directly into the back of your throat, but once you begin to swallow, milking the tip of her dick with your esophagus, ");
		if(pc.isBimbo()) output("it’s easy to fall into a blissed out, almost bovine rhythm");
		else output("any nausea fades, allowing you to enjoy the sensation of drinking down such a lovely woman’s pleasure");
		output(". She makes so much too! You can feel it swirling around in your stomach. In short order, you can even tell that it has added a little jiggle to your middle - an obvious declaration to any wandering bulls that you’re Zephyr’s cum-drunk slut.");
		output("\n\nGrabbing you by the back of the head, she grinds against your [pc.lips] for a few more moments, shooting her last thick lances of seed. Her knot, however, does not deflate in the slightest. It stays right where it is, trapping her dick in your mouth, allowing it to leak alabaster bliss into you the moment her balls finish brewing it.");
		output("\n\nIt feels like hours are passing. You orgasm repeatedly from the hard fucking, your pleasured groans egging Zephyr to spurt a little more inside you before she finally, belatedly deflates. Your jaw aches, and your tongue tingles. Your teeth feel like they’re swimming in jism.");
		output("\n\nThe wet ‘pop’ of her withdraw jars you from your cummy reverie.");
		output("\n\n<i>“Next!”</i> Zephyr’s call is loud and brazen, and you watch with lidded eyes as she leads the next willing participant around to your mouth.");
		output("\n\nOpening wide, you let them thrust inside, savoring the unique, musky flavor of the mystery dick. You didn’t bother to get a good look at the owner. It doesn’t matter. They’re just there to give you something to do while you cum your brains out to the pounding ");
		if(pc.legCount > 1) output("between your [pc.legs].");
		else output("from behind.");
		var ppZephyr:PregnancyPlaceholder = getZephyrPregContainer();
		pc.loadInMouth(ppZephyr);
	}
	//Hellhound
	else if(inMouth == 2)
	{
		output("\n\n<i>“Swallow, bitch!”</i> the hellhound bellows, the command vibrating through you from head to toe. He slaps all the way in, popping a rapidly expanding knot in behind your teeth mere seconds before it inflates. Oh stars, does it inflate! Your jaw is pulled open to the limit and then some. It aches, but you salivate all the same, giving in to the alpha dog’s barked command with thoughtless subservience.");
		output("\n\nHis cum barrels directly into your gulping throat, thick enough that it reminds you of yogurt yet alien enough to tingle deliciously on the rearmost part of your tongue. It was so nice of him to give you advanced warning. You glow with happiness as you swallow - mostly from the knowledge that you’ve brought off such a strapping male, but a little from the lovely cunt-fucking still going on just across the stocks.");
		output("\n\nYou almost forget about the apple-sized distention keeping your mouth at a healthy gape. There’s just too many other things going on to worry about a little discomfort, too much cum pumping into you, slopping out of you, and dribbling down your [pc.thighs] in lazy, winding streams. Your [pc.belly] gurgles happily, and you join it a second later, vibrating your tongue against the domineering ausar’s throbbing cum-vein in between swallows.");
		output("\n\n<i>He’s just so fantastically virile!</i> You drink in his masculine musk when you can. It makes you feel a little dizzy, maybe a little drunk, but you’re being such a good girl. He’s rubbing your head and telling you so! You swallow harder, noisily polishing his knob until the spunky flow slows to a trickle. He’s not going to leave, is he?");
		output("\n\nThe ausar pulls back with his hips, but there’s simply no room for his massively swollen knot to escape. He’s tied to you - you hope forever. You tongue the sensitive bulb as best you can, coaxing more of his blissful goo into your throat, hoping to keep him inside you as long as you possibly can. Maybe if you milk out every single drop of sperm, he’ll take you with him when he leaves.");
		output("\n\nRegrettably, it isn’t to be. No amount of feverish tonguing will keep the black-furred ausar’s melon-like knot at full size. After fifteen or twenty minutes, he begins to deflate. You drink in more of his pheromonal fragrance through your nose, savoring it one last time, then give him a loving, parting suck before he can pull out. He waits, gracious man that he is, then pops his rod out into the open air, patting you on the head again and grumbling something about, <i>“");
		if(!pc.isTreated()) output("Fucking cock-thirsty tourists");
		else output("Fucking greedy cows");
		output(".”</i>");
		output("\n\nYou’re still dizzy on his aroma when another body steps in front of you. He doesn’t smell as nice as your dog-dicked boyfriend, but you open nice and wide, rolling out your [pc.tongue] like a red carpet. The newcomer smirks, mutters something about how <i>“hellhounds always get them in the right mood.”</i> He thrusts in, and you resume sucking and slurping, careful not to bite when you cum real hard.");
		var ppHellhound:PregnancyPlaceholder = getNTStocksPregContainer("hellhound");
		pc.loadInMouth(ppHellhound);
	}
	//Kaithrit Futa
	else if(inMouth == 3)
	{
		output("\n\n<i>“Oh gosh, I’m gonna cum!”</i> The prissy kaithrit shivers fitfully, then humps your face, her tails twitching cutely.");
		output("\n\nSmiling knowingly around the dick in your mouth, you suck on her pulsing member, feeling the nubby little bulges flexing orgasmicly a half-second before you feel her creamy release spilling onto your [pc.tongue]. For such a petite package, she delivers enough cum to rival or beat better-endowed terrans. You have to gulp down each ejaculation as soon as it pumps into your maw if you want to keep from drowning in it. Even then, thin trickles of kitty-spooge escape the corners of your [pc.lips], clear evidence of just how much the cat-girl loves your mouth.");
		output("\n\nShe humps you like her life depends on it, squirting thinner and thinner flows of jism down your throat until she goes completely dry. A complete lack of ejaculation doesn’t stop her from cumming, though. She’s still shaking and whimpering, moaning <i>“Yes, yes, YES!”</i> with every quick thrust against your tongue. You let her keep going, not that you can do anything about it, feeling echoing thrills of delight in your [pc.vagina " + x + "] whenever her delightful dick throbs.");
		output("\n\nLooking about to collapse, the pretty kitty staggers back, gaping at the web of sperm that hangs between your spunk-glossed lips and her still-turgid member. <i>“That was... that was pretty good.”</i> She staggers around, gathering the discarded pieces of her dress. <i>“I’ll be sure to uhm... put in the good word for you with uh, your supervisor.”</i> Glancing back over her shoulder, she flashes a tired-looking grin. <i>“Maybe I’ll even be a repeat customer!”</i>");
		output("\n\nYou don’t bother to inform the clueless cat-girl. Part of the reason might be that you just want to swallow the last of her cum and have a few seconds to breathe, but the real reason is that a much bigger stud is sauntering up to you, drawing all of your attention to the tree trunk between his legs.");
		output("\n\nAny attempt at modesty would be wasted by now, so you do the only thing a girl stuck in stocks on New Texas can do: open your mouth and try to enjoy the taste of the cock sliding into you. If the dripping from below is any indication, your pussy does.");
		var ppKaithrit:PregnancyPlaceholder = getNTStocksPregContainer("kaithrit");
		pc.loadInMouth(ppKaithrit);
	}
	//New Texan farmer
	else if(inMouth == 4)
	{
		output("\n\nYou aren’t sure how, but you can smell that the farmer fucking your mouth is about to orgasm.");
		if(pc.isTreated()) output(" Must be a Treated instinct, you surmise. Your intuitive understanding of all things sexual is always a pleasant surprise to you, like you’ve got extra-sense... extra-sweet per... extra-sweet pillows. Yeah, your cock-pillows are just about to make this guy cream.");
		else output(" There’s just something about the rich aroma of his pubes that reaches into your nose and tweaks your [pc.clits], begging you to start ovulating. New Texans truly are the masters of inaudible communication.");
		output(" Puckering up, you drag your bleary eyes open and try to meet the <i>man’s</i> gaze.");
		output("\n\nHis eyes nearly cross from the smoky look you just flashed, and his cock seems to double in girth in an instant, transitioning from mere phallic firmness into diamond-hard fuck-tool. <i>“Hold onto yer horse!”</i> the yokel grunts, half-chuckling, <i>“‘Cause he’s about to cum!”</i>");
		output("\n\nThrusting deep, the farmer plows so far into your mouth that you can’t even taste the spunk he’s jetting out. You’re forced to feel it in the way his urethra bulges on your tongue and in the warm, healthy gurgles coming from your stomach. He cums and cums, but as the orgasm drags on, he pulls back, finally allowing you savor the salty ambrosia. He’s even courteous enough to pop his still-spurting dick out of your insatiable lips and paint a thick layer of bull-boy bliss across your features, showing everyone exactly how good of a cock-sucker you are.");
		output("\n\nStars, these hicks know how to live! Just when you’re sure that another drop of jism couldn’t possibly fit on your face, he slaps his cock back onto your tongue, letting you gratefully swallow the last few pulses of your reward.");
		if(!pc.isBimbo()) output(" You never knew dicks could be so... demanding, or that servicing them could feel so good! You’re practically dizzy on cock-sucking bliss, and your [pc.vagina " + x + "] won’t stop spasming. It’s like one constant, orgasmic high that never stops feeling better, not when you’ve got cock in both ends.");
		else output(" You don’t think you’ll ever get sick of this. The headrush from serving a big, thick slab of lusty prick always feels just as good as the first time. You’re practically dizzy with it, but that doesn’t stop you from working your vaginal muscles like a finely-honed sex-toy. You doubt any force in the universe could stop you from pleasing all these people. It’s like, what you’re best at.");
		output("\n\n<i>“Good [pc.boyGirl],”</i> the bull drawls in this thick accent, patting you on the head. <i>“");
		if(!pc.isTreated()) output("You did real good considerin’ you ain’t been proper Treated yet.");
		else output("You did pretty good. Your must practice on your boyfriend all the time, huh?");
		output("”</i> He slips his cock out from your lips without another word. You try to fight it, but no matter how you suck, he’s just so strong and manly! The crown escapes with an audible ‘pop,’ and you’re left pouting until another dick appears in front of your face, this one veiny and rock-hard.");
		output("\n\nIt definitely <i>needs</i> sucked. You can smell it as easily as the big-dicked farmer’s orgasm. You decide to do the responsible thing and meet the newcomer’s gaze through your mask of spent seed, rolling out your tongue in greeting. If the mess bothers him, it doesn’t show in the slightest. He pushes right in, giving you something besides the pure pleasure from your pussy to enjoy.");
		var ppTexan:PregnancyPlaceholder = getNTStocksPregContainer("farmer");
		pc.loadInMouth(ppTexan);
	}
	processTime(10);
	pc.orgasm();
	pc.changeLust(50);
	var args:Array = [inCunt,inMouth,x];
	clearMenu();
	addButton(0,"Next",stocksEpilogue,args);
}
	
public function stocksEpilogue(args:Array):void
{
	clearOutput();
	showMiscreantManor();
	var x:int = args[2];
	var inCunt:int = args[0];
	var inMouth:int = args[1];
	var rn:int;

	output("Life in Miscreant Manor is a parade of cocks. Cocks that thrust into every hole. Cocks that jet cum into you. Cocks that throb and pleasure and cum without end. You can’t count how many times you orgasm or how many loads are swimming around in your abused womb");
	if(pc.totalVaginas() > 1) output("s");
	output(". What you are aware of is the deep and fulfilling sense of satisfaction, one that goes beyond mere sexual contentment.");
	output("\n\nThe mag-lock beeps and releases, but you don’t bother to budge - not until you’ve let bulls in front and behind finish up. You look like the universe’s biggest cum-slut. Hell, you feel like one too. It could be days before you stop tasting spunk with every swallow. Regardless, it was worth it.");
	IncrementFlag("MISCREANT_MANORED");

	var ppRando:PregnancyPlaceholder;
	var stocksCums:int = 3 + rand(4);
	for(var y:int = 0; y < stocksCums; y++)
	{
		//Pick random pussy
		x = rand(pc.totalVaginas());
		//Pick a cumshot - mostly placeholder
		rn = rand(10);
		//Hellhound
		if(rn == 0) ppRando = getNTStocksPregContainer("hellhound");
		//Kaithrit
		else if (rn <= 2) ppRando = getNTStocksPregContainer("kaithrit");
		//laquine
		else if (rn <= 4) ppRando = getNTStocksPregContainer("laquine");		
		//New Texan/Terran Tourist
		else ppRando = getNTStocksPregContainer("farmer");
		pc.loadInCunt(ppRando,x);
		pc.loadInMouth(ppRando);
		pc.orgasm();
		pc.exhibitionism(2);
	}
	pc.libido(1);
	processTime(18);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}