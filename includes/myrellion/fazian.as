public const FAZIAN_QUEST_NOTSTARTED:* = 0;
public const FAZIAN_QUEST_COMPLETE:int = 1;
public const FAZIAN_QUEST_OFFERING:int = 2;
public const FAZIAN_QUEST_STARTED:int = 3;
public const FAZIAN_QUEST_REJECTED:int = 4;
public const FAZIAN_QUEST_FAILED:int = 5;
public const FAZIAN_QUEST_INVESTIGATED:int = 6;
public const FAZIAN_QUEST_RESCUE:int = 7;
public const FAZIAN_QUEST_BRIBED:int = 8;

public function showHepane(nude:Boolean = false):void
{
	author("Nonesuch");
	if (flags["MET_HEPANE"] == undefined) showName("MYR\nWOMAN");
	else showName("\nHEPANE");
	if (!nude) showBust("HEPANE");
	else showBust("HEPANE_NUDE");
}

public function nozzleShowFirstTime():void
{
	clearOutput();
	showHepane();
	showName("CABARET\nENTRANCE");

	output("<i>“Hello!”</i> smiles the smartly-dressed myr when you approach her. <i>“Are you here for the cabaret? 160 credits entry.”</i>");

	flags["FAZIAN_SHOW"] = 1;
	
	output("\n\n<i>“What is it, exactly?”</i> you ask.");
	
	output("\n\n<i>“It’s great,”</i> says the myr, her professional smile breaking into an enthusiastic grin. <i>“I mean... I don’t know how it will compare to the things you’ve seen, starwalker,”</i> she amends. <i>“But Fazian is not of this world either, and our shows are very popular here. Tonight is...”</i> she checks the clipboard in her hands.");

	if (days % 3 == 0)
	{
		output(" <i>“The Quaramarta. Oh, you’ll like that, starwalker: a slice of real Gildenmere culture, and not the kind that hangs on walls. You’ll leave with a spring in your step!”</i>");
	}
	else if (days % 3 == 1)
	{
		output(" <i>“As You Shrike It. That’s very funny. Probably our most popular performance, because... people need a laugh at times like these, I guess.”</i>");
	}
	else
	{
		output(" <i>“Of Paradise. Ah, yes. If you’re anything like us, starwalker, you’ll enjoy that. A lot. Just, um, be aware you might leave feeling a bit... frisky.”</i>");
	}
	
	processTime(3);

	clearMenu();
	if (pc.credits >= 160) addButton(0, "Pay", payForNozzleShow);
	else addDisabledButton(0, "Pay", "Pay", "You don’t have enough credits.");
	addButton(1, "Don’t", mainGameMenu);
}

public function nozzleShowRepeat():void
{
	if (flags["FAZIAN_QUEST_STATE"] == FAZIAN_QUEST_COMPLETE)
	{
		CodexManager.unlockEntry("Tarratch");
		fazianQuestCompleteBlurbs();
		return;
	}

	clearOutput();
	showHepane();

	output("<i>“Hello again!”</i> says");
	if (flags["MET_HEPANE"] == undefined) output(" the smartly-dressed myr");
	else output(" Hepane");
	output(" as you approach her. <i>“Here for tonight’s show? It’s 160 credits, as always.”</i>");

	output("\n\n<i>“What’s on?”</i> you ask. She checks her clipboard.");

	if (days % 3 == 0)
	{
		if (flags["NOZZLE_SHOW_QUARAMARTA"] == undefined) output(" <i>“The Quaramarta. Oh, you’ll like that, starwalker: a slice of real gold myr culture, and not the kind that hangs on walls. You’ll leave with a spring in your step!”</i>");
		else output(" <i>“The Quaramarta. Difficult to forget once the beat has gotten into your chitin, isn’t it?”</i>");
	}
	else if (days % 3 == 1)
	{
		if (flags["NOZZLE_SHOW_SHRIKE"] == undefined) output(" <i>“As You Shrike It. That’s very funny. Probably our most popular performance, because... people need a laugh at times like these, I guess.”</i>");
		else output(" <i>“As You Shrike It. Well worth watching again. So many gags pass you by the first time, and we always mix the slapstick up a bit.”</i>");
	}
	else
	{
		if (flags["NOZZLE_SHOW_PARADISE"] == undefined) output(" <i>“Of Paradise. Ah, yes. If you’re anything like us, starwalker, you’ll enjoy that. A lot. Just, um, be aware you might leave feeling a bit... frisky.”</i>");
		else output(" <i>“Of Paradise. Never gets old, does it? The way he makes you feel </i>special<i>... our males don’t have the upbringing to really do that.”</i>");
	}

	processTime(3);
	
	clearMenu();
	if (pc.credits >= 160) addButton(0, "Pay", payForNozzleShow);
	else addDisabledButton(0, "Pay", "Pay", "You don’t have enough credits.");
	addButton(1, "Don’t", mainGameMenu);
}

public function hasSeenNozzleShow():Boolean
{
	return flags["NOZZLE_SHOW_PARADISE"] != undefined || flags["NOZZLE_SHOW_SHRIKE"] != undefined || flags["NOZZLE_SHOW_QUARAMARTA"] != undefined;
}

public function payForNozzleShow():void
{
	clearOutput();
	showHepane();

	pc.credits -= 160;

	if (flags["NOZZLE_SHOW_PARADISE"] == undefined || flags["NOZZLE_SHOW_SHRIKE"] == undefined || flags["NOZZLE_SHOW_QUARAMARTA"] == undefined)
	{
		output("Why not? You came in here to enjoy yourself, after all.");
		if (flags["MET_HEPANE"] == undefined)
		{
			output("\n\n<i>“Thanks!”</i> beams the myr as you hand her the credits. <i>“My name is Hepane, by the way. I do the music. Go through and take a seat wherever you like.”</i>");
			flags["MET_HEPANE"] = 1;
		}
		else
		{
			output("\n\n<i>“Thanks!”</i> beams Hepane as you hand her the credits. <i>“Go through and take a seat wherever you like.”</i>");
		}
	}
	else
	{
		output("You never turn down a chance to see the myr and anat perform.");
		
		output("\n\n<i>“Our favourite patron,”</i> beams Hepane, taking your credits. <i>“Where you like to sit is still free, if you get in there quick.”</i>");
		
		output("\n\nYou duck under the curtain into a small, crimson-decorated, sparsely-lit theatre, furnished with round tables and a wooden stage at one end. It’s thronged with people; mostly gold myr, the air dense with their high, twittering voices and sweet smell, but you spot a smattering of other off-worlders here as well. You find yourself a seat near the front and make yourself comfortable. A few moments later, the lamps and conversation dip, and the stage lights come on.");
	}

	processTime(3);
	
	clearMenu();
	addButton(0, "Next", nozzleGoPerformance);
}

public function nozzleGoPerformance():void
{
	if (days % 3 == 0) nozzlePerformanceQuaramarta();
	else if (days % 3 == 1) nozzlePerformanceShrike();
	else nozzlePerformanceParadise();
	
	CodexManager.unlockEntry("Anatae");
}

public function nozzlePerformanceParadise():void
{
	clearOutput();
	author("Nonesuch");
	showBust("FAZIAN_1");
	showName("\nPARADISE");

	output("Hepane is sat next to a vertically arranged instrument that looks like a combination of a hookah and an upturned piano. She picks out a throbbing bass rhythm on the round keys at the bottom; her other set of hands sit on the stem keys above, waiting. Her partner strides on.");
	
	output("\n\n");
	if (flags["APPROACHED_FAZIAN"] == undefined)
	{
		output("He’s an anat, immediately recognizable by his long, bone-mask face, his double-jointed legs and small, neat claws. His feather plumes are startling, though: rearing way out above his crown and elbows, they’re shades of aquamarine and magenta that continuously glitter and shift under the glare of the spotlights.");
	}
	else
	{
		output("Fazian the anat strides onto the stage; all rearing, flowing feathers, austere ivory and supple muscle.");
	}
	output(" He is dressed... it is not obvious how he is dressed. In each claw he has a vast, feathered fan, and he holds them so they obscure most of his lean, balletic frame.");
	
	output("\n\nHepane begins to press the upper keys of her instrument, adding piano-like notes to her sultry bass, deep but upbeat. Fazian is still for a moment longer - gazing out over the room, an impassive mask over lively, blue eyes - before beginning to stride across the stage, first with arch casualness and then sudden, dazzling whirls of movement. Because of the way he intersperses them with slinky, slow down-times, his pirouettes and leaps seem uncontrolled bursts of savagery and passion - except during them he wields his long, fluffy fans expertly, keeping most of his tight musculature behind a bright whip of color. Bare hints of dance-toned hips, butt and subtle abs are hurled out and then whipped back behind the festival-like shimmy of feathers.");
	
	output("\n\nIn keeping with the rest of the performance, the anat’s focus seems to shift, at times seemingly lost in his own whirling dance and then, suddenly, focused intensely on a single area of the room, feathers shaking furiously. When he does this towards where you’re sitting, it’s as if there’s nobody sitting near you at all - his wintery eyes bore into yours, and they are at a center of a shaking kaleidoscope of reds and blues, a flower that moves just for you. Then he’s gone, folding it away and striding to another part of the stage, leaving you to wonder if he is actually naked under there, or...?");
	
	output("\n\nHepane ratchets up the beat to a rave-like climax, and in response Fazian finishes the performance with several minutes of intense action, working in back-flips and full air twists, violent, giddy precision during which you think you can glimpse - just a glimpse - of what he’s packing between his tight hips, purple fronds... and then he’s finished, chest heaving and fans bent across his lower body, bowing with Hepane to rapturous applause.");
	
	output("\n\nAn unusual strip-tease to say the least. However, like Hepane suggested, you leave feeling frenetic and agitated, a desire to move your hips energetically in concert with someone else nagging at you. Going by the number of hands you can see creeping around waists and abdomens amongst the exiting crowd, you aren’t the only one.");

	if (flags["NOZZLE_SHOW_PARADISE"] == undefined) flags["NOZZLE_SHOW_PARADISE"] = 0;
	flags["NOZZLE_SHOW_PARADISE"]++;

	processTime(55+rand(10));

	
	pc.createStatusEffect("Paradise!", 0, 0, 0, 0, false, "LustUp", "Fazian’s Paradise performance has left a fire in your loins!\nMinimum lust increased by 20.", false, 480, 0xFFFFFF);
	pc.setStatusMinutes("Paradise!", 480);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function nozzlePerformanceShrike():void
{
	clearOutput();
	author("Nonesuch");
	showBust("FAZIAN_2");
	showName("\nSHRIKE");

	output("Hepane is sat next to a vertically arranged instrument that looks like a combination of a hookah and an upturned piano. She picks out a jaunty, chiming rhythm on the oblong keys at the top; her other set of hands sit on the round keys below, waiting. Her partner strides on.");
	
	output("\n\n");
	if (flags["APPROACHED_FAZIAN"] == undefined)
	{
		output("He’s an anat, immediately recognizable by his long, bone-mask face, his double-jointed legs and small, neat claws. His feather plumes are startling, though: rearing way out above his crown and elbows, they’re shades of aquamarine and magenta that continuously glitter and shift under the glare of the spotlights.");
	}
	else
	{
		output("Fazian the anat strides onto the stage; all rearing, flowing feathers, austere ivory and supple muscle.");
	}
	output(" He’s dressed in a florid kimono and neck-tie type thing, presumably what passes for smart attire for a male Gildenite. He looks terrifically uncomfortable in it, constantly preening and re-preening his feathers, shooting looks left and right. He jumps when a gold myr with an upturned nose dressed in royal regalia strides onto the stage. The audience titters as another myr, dressed in a maid outfit, follows her closely, carrying a massive, cardboard abdomen.");
	
	output("\n\nIt develops into a pretty standard boy-meets-girl, boy-gets-into-increasingly-farcical-scrapes-as-a-result-of-trying-to-impress-girl play, delivered silently except for Hepane’s expert vaudeville: twisting from mockingly serious martial beat to a panicked plinky-plonk as the mime demands. You’d have doubts about how well it translates to a myr audience, but you guess some things - the queen’s complete indifference to the suitor’s advances, the suitor’s crippling nervousness, his best friend’s sliminess - hit a universal chord, because the audience giggles and guffaws along. The actors’ naturalness helps. The biggest laugh of the evening comes when someone at the back drunkenly yells <i>“Take it off!”</i> After a moment’s pause, the anat fastidiously takes off his wrist cuffs and then carries on with what he was doing.");
	
	output("\n\nIt culminates in the anat somehow believing hanging a lot of dead vermin from a tree will win the queen’s heart - and then, when that ends terribly, marrying the huge predatory bird it does attract (is that a wetraxxal?). The actors all bow at the end and the audience clap enthusiastically.");
	
	output("\n\nIt was all very silly, but leaving with the crowd you feel inspired and enlivened by how much was conveyed without a single word being used. Perhaps with the performance fresh in your mind, you’ll be more able to perceive things about the world and people around you.");


	if (flags["NOZZLE_SHOW_SHRIKE"] == undefined) flags["NOZZLE_SHOW_SHRIKE"] = 0;
	flags["NOZZLE_SHOW_SHRIKE"]++;

	//+ 1 hour, +20% experience gained for next 8 hours
	processTime(55+rand(10));

	pc.createStatusEffect("Shrike!", 0, 0, 0, 0, false, "Icon_Haste", "Fazian’s Shrike performance has inspired you!\nExperience gains increased by 20%.", false, 480, 0xFFFFFF);
	pc.setStatusMinutes("Shrike!", 480);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function nozzlePerformanceQuaramarta():void
{
	clearOutput();
	author("Nonesuch");
	showBust("FAZIAN");
	showName("\nQUARAMARTA");

	output("Hepane is sat next to a vertically arranged instrument that looks like a combination of a hookah and an upturned piano. She picks out a snaky bass rhythm on the round keys at the bottom; her other set of hands sit on the stem keys above, waiting. Her partner strides on.");
	
	output("\n\n");
	if (flags["APPROACHED_FAZIAN"] == undefined)
	{
		output("He’s an anat, immediately recognizable by his long, bone-mask face, his double-jointed legs and small, neat claws. His feather plumes are startling, though: rearing way out above his crown and elbows, they’re shades of aquamarine and magenta that continuously glitter and shift under the glare of the spotlights.");
	}
	else
	{
		output("Fazian the anat strides onto the stage; all rearing, flowing feathers, austere ivory and supple muscle.");
	}
	output(" He’s dressed in a tight white shirt and long johns which are pretty conservative by strip-club standards - although when he flexes his balletic form so that his pert muscles bulge against the fabric, the audible intake of breath around the room informs you that it has an effect nonetheless.");
	
	output("\n\nFazian clicks his finger-claws, gazing out over the crowd, his visage an unreadable mask over two blue, lively eyes. Hepane begins to sing wordlessly as she caresses the top keys of her instrument, introducing echoing piano-like chimes to her propulsive, itchy, upbeat tune. The anat clicks his fingers, swings his hips and stamps his feet with careless grace, affecting casualness but stamping his feet down right in time with Hepane, drum to her double instrument.");
	
	output("\n\nYou realize suddenly that it’s not just the anat creating the percussion. The rhythm reverberates around the room, and looking around you see almost every gold myr drumming their tables with four fingers, grinning and entranced, keeping time with the cocky, feathered dancer. The beat ratchets up and up, Hepane’s fingers working furiously, Fazian throws off more and more his nonchalance with each flex of his hips, until -");
	
	output("\n\n<i>“QUARAMARTA!”</i> cries Hepane. Every gold myr in the room brings all four hands down on the nearest table with a ringing slam. Brilliant red and blue feathers twist furiously on the stage.");

	output("\n\nIt goes on and on, loosening out after each <i>“QUARAMARTA!”</i> before the jam is tightened up again, each time headier and faster than the last, Fazian’s stomping, writhing dance becoming more and more intense and the rap of fingers around you louder and louder until it’s impossible not to get caught up in it. When he rips off his shirt for the crescendo, light sweat glossing his tight frame, it doesn’t feel stage-managed; it seems absolutely what he should do in that moment.");
	
	output("\n\n<i>“QUARAMARTA!”</i> everyone in the room roars gleefully as he twirls into the air one last time, slamming their hands down so the walls shake, before standing up and applauding furiously. Eyes twinkling and chest heaving, Fazian bows with Hepane.");
	
	output("\n\nYou don’t know how they manage to applaud; your single pair of hands ache mightily. Nonetheless, you leave with the crowd feeling galvanized and feisty, grinning stupidly back at everyone else with whom, for a short while, you were a single, musical force.");

	if (flags["NOZZLE_SHOW_QUARAMARTA"] == undefined) flags["NOZZLE_SHOW_QUARAMARTA"] = 0;
	flags["NOZZLE_SHOW_QUARAMARTA"]++;

	//+ 1 hour, + 15% crits for next 8 hours
	processTime(55+rand(10));

	pc.createStatusEffect("Quaramarta!", 0, 0, 0, 0, false, "OffenseUp", "Fazian’s Quaramarta performance has sharpened your senses!\n\nCritical chance increased by 15%.", false, 480, 0xFFFFFF);
	pc.setStatusMinutes("Quaramarta!", 480);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function showFazian(nude:Boolean = false):void
{
	author("Nonesuch");
	showName("\nFAZIAN");
	if (!nude) showBust("FAZIAN");
	else showBust("FAZIAN_1");
}

public function fazianApproach():void
{
	clearOutput();
	showFazian();

	if (flags["APPROACHED_FAZIAN"] == undefined)
	{
		flags["APPROACHED_FAZIAN"] = 1;

		output("<i>“Hey,”</i> you say, sidling up to the lean, brightly-feathered alien at the bar. <i>“You’re the dancer guy, right?”</i>");
		
		output("\n\n<i>“I hope so,”</i> Fazian replies affably in clear, well-enunciated tones, taking a pull on the straw leading behind his mask. <i>“Otherwise there’s some other anat around here making a fool of themselves.”</i> He turns to look at you with increasing interest. You think. It’s really quite difficult to tell with anatae. <i>“Hey, you’ve been to our performances, haven’t you? It’s great to see non-natives there, you know. It’s difficult to get unbiased views about the stuff we do from the myr.”</i> He fiddles with the stem of his glass. <i>“So... what did you think?”</i>");

		processTime(3);
		
		//[Liked It] [Eh]
		clearMenu();
		addButton(0, "Liked It", fazianLikedIt, undefined, "Liked It", "Tell him you liked the performance.");
		addButton(1, "Eh", fazianEh, undefined, "Eh", "Tell him you didn’t like the performance.");
		return;
	}
	else
	{
		output("<i>“Per Steele!”</i> Fazian’s eyes smile warmly at you as you sidle up to him at the bar. After only half a second’s pause, the anat dancer grasps your hand and shakes it, not so vigorously it might dislocate your wrist. He’s getting better at it.");
		fazianMenu();
	}
	
	CodexManager.unlockEntry("Anatae");
}

public function fazianLikedIt():void
{
	clearOutput();
	showFazian();

	if (pc.isBimbo()) output("<i>“It was good!”</i> you say enthusiastically. <i>“I like colors. And men. The two together! I’m a fan.”</i>");
	else if (pc.isBro() || pc.isAss()) output("<i>“It was good,”</i> you say assertively. <i>“Makes me wonder why you’re performing it in a strip joint in the middle of nowhere, rather than somewhere people’d really appreciate it.”</i>");
	else output("<i>“It was good!”</i> you smile. <i>“Not something I would have expected to see in a strip joint on the fringes of nowhere.”</i>");

	output("\n\nFazian listens intently, clear blue eyes fixed on you.");
	
	output("\n\n<i>“That’s very kind of you to say,”</i> he replies. He doesn’t sound like he quite believes you. <i>“We’re just throwing ideas up on stage and seeing what works. It’s very difficult to reach an alien audience without just relying on brute physicality, and that’s the joy and frustration of it. It’s nice to hear someone off Myrellion liked it, though. What’s your name, per? Oh!”</i>");
	
	output("\n\nHe shoots out his hand, and shakes very enthusiastically when you put yours in his; you get the impression that the action is a novelty for him. You introduce yourself and tell him a little about yourself.");
	
	output("\n\n<i>“Wow,”</i> he says. <i>“The "+ pc.mf("son", "daughter") +" of a famous human industrialist, you say? That’s fascinating.”</i> He twiddles with his wine glass nervously. <i>“So, "+ pc.mf("Mr.", "Ms.") +" Steele, what would you like to know?”</i>");

	processTime(5);
	
	fazianMenu();
}

public function fazianEh():void
{
	clearOutput();
	showFazian();

	if (pc.isBimbo())
	{
		output("You wrinkle your nose.");
		output("\n\n<i>“It was alright,”</i> you sigh. You gaze meaningfully over at the gold myr strippers. <i>“Think you should be more, like, up front with the goods, you know?”</i>");
	}
	else if (pc.isBro())
	{
		output("You lean your arm onto the counter and flex.");
		output("\n\n<i>“That’s what the ladies are paying to see, bro,”</i> you say. <i>“Doing ‘em a disservice with all the jumping and flopping around, if you ask me.”</i>");
	}
	else if (pc.isAss() || pc.isMisch())
	{
		output("<i>“Didn’t grab me,”</i> you say dismissively. <i>“Alright for an audience of natives starved of boy butts, but I wouldn’t put it on in the Core.”</i>");
	}
	else
	{
		output("<i>“It was alright,”</i> you say carefully. <i>“But I wouldn’t try performing it in the Core. Bit rough around the edges.”</i>");
	}

	output("\n\nFazian listens intently, clear blue eyes fixed on you.");
	
	output("\n\n<i>“You’re probably right,”</i> he nods, tapping his claws on the wine-stained wood pensively. <i>“It’s so difficult to pitch things to an alien audience without just relying on brute physicality, and the tone’s all over the place as a result. Thanks for not sugar coating it. I’m Fazian, by the way. How do you do? Oh!”</i>");
	
	output("\n\nHe shoots out his hand, and shakes very enthusiastically when you put yours in his; you get the impression that the action is a novelty for him. You introduce yourself and tell him a little about yourself.");
	
	output("\n\n<i>“Wow,”</i> he says. <i>“The "+ pc.mf("son", "daughter") +" of a famous human venture capitalist, you say? That’s fascinating.”</i> He twiddles with his wine glass nervously. <i>“So, "+ pc.mf("Mr.", "Ms.") +" Steele, what would you like to know?”</i>");

	processTime(6);
	
	//[Him] [Anatae] [Dancing] [Myr] [Appearance]
	fazianMenu();
}

public function fazianMenu(ff:Function = null):void
{
	clearMenu();
	if (ff != fazianHim) addButton(0, "Him", fazianHim, undefined, "Himself", "Ask Fazian about himself.");
	else addDisabledButton(0, "Him");

	if (ff != fazianAnatae) addButton(1, "Anatae", fazianAnatae, undefined, "Anatae", "Ask him about his race.");
	else addDisabledButton(1, "Anatae");

	if (ff != fazianDancing) addButton(2, "Dancing", fazianDancing, undefined, "Dancing", "Ask him about his trade.");
	else addDisabledButton(2, "Dancing");

	if (flags["FAZIAN_QUEST_STATE"] != FAZIAN_QUEST_COMPLETE) addButton(3, "Myr", fazianMyr, undefined, "Myr", "Ask him what he thinks about the myr.");
	else addButton(3, "Myr", fazianMyrQuestComplete, undefined, "Myr", "Ask if his opinion of the myr has changed, after his experience.");
	if (ff == fazianMyr) addDisabledButton(3, "Myr");

	if (flags["FAZIAN_DANCE_UNLOCKED"] != undefined)
	{
		if (ff != fazianDance)
		{
			if (pc.isWornOut()) addDisabledButton(4, "Dance", "Dance", "Your muscles are too sore to do that!");
			else addButton(4, "Dance", fazianDance, undefined, "Dance", "Go backstage and do some dance training with the anat.");
		}
		else addDisabledButton(4, "Dance");
	}
	
	if (ff != fazianAppearance) addButton(5, "Appearance", fazianAppearance);
	else addDisabledButton(5, "Appearance");

	addButton(14, "Back", mainGameMenu);
}

public function fazianAppearance():void
{
	clearOutput();
	showFazian();
	output("Fazian is a six foot tall anat, immediately recognizable as such by his digitigrade legs, four-clawed hands and flat, mask-like face. That impassive, ivory, vertical visage starts at his crown and tapers off to a dull point beyond where his chin would be, were he human. His dexterous... (Jaws? Mandibles? Beak?)... mouth-parts are not obvious when he’s facing you. Judging his mood and the impression your words have on him by his facial expression is clearly impossible; however, the anat has animated blue eyes and a restless body language which more than makes up for it.");
	
	output("\n\nHis rough skin is a dark navy, a dullness that offsets his remarkable feather plumes. Rearing out by at least two feet from where his mask ends on his head, his crown-plume is a bouquet of striking aquamarine and magenta into which unearthly beads of light and undertones of other shades seem to have been worked. The tufts that emerge from his elbows are the same, only in miniature. He seems to have a remarkable amount of control over all of them, able to curl, stiffen and shake them into a mesmerizing display of shifting colors when he chooses. Here though, away from the stage, he keeps them down and carefully still.");
	
	output("\n\nHe has the lithe, tightly muscular body of a male ballet dancer, with the flat, dune-like chest and hard, pert butt to go with it. As with his feathers though, whilst he’s evidently happy to flaunt it all on-stage, here and now he’s dressed in a plain white shirt and denim long johns, almost ascetic-like. What he keeps in his trousers is anyone’s guess - although you imagine you wouldn’t have to ask around here for very long to find out.");
	fazianMenu(fazianAppearance);
}

public function fazianHim():void
{
	clearOutput();
	showFazian();

	output("<i>“So how did you come to be strutting your stuff all the way out here, then?”</i> you ask.");
	
	output("\n\n<i>“Do you want the official reason, per?”</i> Fazian replies, looking at you sideways. <i>“If you’re an anat, you’ve got to have a very good one to be wasting a first grade artistic license out on a human-corporate-owned frontier world. Well, you’ve got to have a very good reason to get a first grade artistic license in the first place. But I always wanted to be a dancer, and your parents and career officer can only shower you with so many engineering pamphlets before they have to give up. My people aren’t brutes or... autistic, they do know the value of the arts,”</i> he goes on quickly, <i>“But it’s so hard to measure the value of a painting next to a new live-ship or block of apartments on a colony world, y’know?”</i>");
	
	output("\n\n<i>“And you’re here because...”</i> you cajole.");
	
	output("\n\n<i>“Inspiration,”</i> he answers, gesturing grandly at the dimly lit club. <i>“It is accepted by the anatae administrata that artists need to travel and absorb experience, view the empire from outside as well as from within, to be able to properly express themselves. To be able to dance and - for it to seize and move and exhilarate people very different from you - that is a noble goal. And useful. Who knows! We could discover a race that only communicates through body language in this very rush.”</i>");
	
	output("\n\n<i>“What’s the unofficial reason?”</i> you ask. Fazian laughs, and looks at you shyly.");
	
	output("\n\n<i>“How much do you know about our race, Steele?”</i> he says. He shakes his head, feathers hissing softly, before you can answer. <i>“I love women. All I want to do is make them laugh and smile and feel pleasure, as many of them as possible. To be on a world that has nothing but women who are desperately craving a good time - it is a dream come true for me.”</i> He twiddles with his wine glass. <i>“So much so that I am finding it difficult to move on. I hope the administrata are not keeping a very close eye on me, because otherwise I’m going to have some explaining to do when I do finally get back home.”</i>");

	processTime(10+rand(5));
	fazianMenu(fazianHim);
}

public function fazianAnatae():void
{
	clearOutput();
	showFazian();

	output("<i>“Do all anatae have those?”</i> you ask, gesturing at his crown plume.");
	
	output("\n\n<i>“All the males do,”</i> replies Fazian, unfolding and craning his feathers with pride so they catch the bar’s dim lights. <i>“Well, I mean. They have feathers. I had mine modified, colored them, made them fuller, tweaked them so I could move them around better, so I could involve them in my performances. Having an artistic license, I was able to jump a lot of the queue to get them done. As well as, uh, a couple of other things.”</i> He shifts in his seat slightly.");
	
	output("\n\n<i>“You </i>queue<i> for gene-mods?”</i> you say.");
	
	output("\n\n<i>“Yes,”</i> answers Fazian stiffly. <i>“Gene-mods are free to all under the anatae state - you just have to wait, based on your need. As opposed to them being immediately available to the ordinary person only if they are willing to sell a sizable part of their future away.”</i> His tone does not encourage further inquiry.");
	
	output("\n\n<i>“There are a lot of differences between our cultures, I know,”</i> he goes on, conciliatory, <i>“I had to take a month long course in U.G.C. customs before I was allowed out here. Even then, there were many things... I found difficult to believe. The flesh and cream slaves on Tavros... the shuttling of newly discovered natives towards life on a lab slide in some corporate compound... next to such sights and sounds! Explosions on the senses! It was like being hit on the head with perfumed fireworks when I first arrived there per, let me tell you!”</i> His eyes flash excitedly. The bright feathers at his elbows become more fanned out the more animated he gets.");

	processTime(5+rand(3));
	clearMenu();
	addButton(0, "“Per”", fazianAnataePer, undefined, "“Per?”", "Ask him what he means by that.");
	//addButton(1, "TouchFeather", fazianAnataeTouchFeather, undefined, "Touch Feather", "You’ve been wanting to do this for a while....");
	addButton(14, "Back", fazianMenu, fazianAnatae);
}

public function fazianAnataePer():void
{
	clearOutput();
	showFazian();

	output("<i>“Per. You keep saying that,”</i> you observe. <i>“What does it mean?”</i>");

	output("\n\nFazian ducks his head and doesn’t immediately respond.");

	output("\n\n<i>“I... guess that isn’t coming through as a direct translation,”</i> he says. You realize he thinks he’s embarrassed himself. He shuffles in his trouser pocket, brings out a miniature codex and flicks through it for a few moments. <i>“‘Komm-rahd’? It’s telling me that’s a very archaic expression though.”</i> He takes a long pull on his straw before going on, still looking rather uncomfortable.");

	output("\n\n<i>“The anatae have an empire, right? The largest number of colonies in the known galaxy. But we don’t have a leader on top of it all. It’s all owned by us, the people. So... Per. We are all emperors. That’s the idea, anyway.”</i>");

	processTime(3);
	fazianMenu(fazianAnatae);
}

public function fazianDancing():void
{
	clearOutput();
	showFazian();

	output("<i>“So you like dancing, then?”</i> you grin.");
	
	output("\n\n<i>“Do the myr like honey?”</i> he replies, eyes flashing. He gesticulates passionately with his claws. <i>“I love all forms of theatre, performance art, acting... I even tried galotian pollocking, when I was first starting out. But dancing, yes, above all. I don’t... I can’t always find the right words when I am talking to others. When I am dancing, I feel as if I am expressing everything I am about perfectly. And here, I can communicate to innocents who just want to drink it in. It’s so </i>pure<i>, the way art should be.”</i>");
	
	output("\n\n<i>“You charge for your performances,”</i> you point out.");
	
	output("\n\n<i>“It all goes to Hepane, the other performers, and the club’s running,”</i> he replies mildly, scratching his mask. <i>“I have a food-facturer on my ship that will continue to function for another century. I mean, what it serves isn’t great,”</i> he admits. <i>“But then...”</i> he takes a long pull of mead from his straw as way of finishing that sentence. <i>“My people’s goal is to move towards post-scarcity - and why would I charge when I’m self-sufficient and doing what I love, anyway?”</i>");

	processTime(3);
	
	//[Teach me?] [Back]
	clearMenu();
	if (pc.isWornOut()) addDisabledButton(0, "TeachMe", "Teach Me?", "You could ask if he’s willing to teach you some dance moves, but you are too sore to do any actual dancing...");
	else addButton(0, "TeachMe", fazianDancingTeachMe, undefined, "Teach Me?", "Ask if he’s willing to teach you some dance moves.");
	addButton(14, "Back", fazianMenu, fazianDancing);
}

public function fazianDancingTeachMe():void
{
	clearOutput();
	showFazian();

	output("<i>“Alright, let’s say you’ve convinced me,”</i> you smile. <i>“Think you’ve got time to teach me some of your dance moves?”</i>");

	processTime(3);
	
	if (pc.isFeminine())
	{
		output("\n\nFazian stares at you. The tenseness in his frame, and then the way he quickly starts fiddling with his wine glass’s stem again, tells you he’s rather shocked by this proposition.");
		
		output("\n\n<i>“I, um, I don’t know if I can... that is to say, I don’t think there’s anything I could teach you,”</i> he mumbles. <i>“Which isn’t to say I don’t want to,”</i> he goes on. If his face had blood corpuscles in it, you imagine it would be glowing right now. <i>“But you’re naturally... you don’t need to dance. Or not the kind of dancing I know. Like the myr, you own grace and beauty just by </i>existing.<i> My training is for those who need to work to achieve such things.”</i>");
		
		output("\n\nThere will be times when you will be let down harder in your life.");

		clearMenu();
		addButton(0, "Next", fazianMenu, fazianDancing);
	}
	else
	{
		output("\n\n<i>“You...? Sure, I guess,”</i> shrugs Fazian. He nods with increasing enthusiasm for the idea as he mulls it over. <i>“It’ll be fun! Come and see me after the evening performances. I don’t know how good a teacher I am, but I’m sure it wouldn’t take long to show you one or two things.”</i> He finishes his glass of wine with a long pull. <i>“Not doing anything right now, if you want to go backstage.”</i>");

		//Add "Dance" to Fazian's main menu
		flags["FAZIAN_DANCE_UNLOCKED"] = 1;

		//[Dance] [Later]

		clearMenu();
		addButton(0, "Dance", fazianDance, undefined, "Dance", "Go backstage and do some dance training with the anat.");
		addButton(1, "Later", fazianDanceTeachMeLater, undefined, "Later", "Don’t start learning dance moves right now.");
	}
}

public function fazianDanceTeachMeLater():void
{
	clearOutput();
	showFazian();

	output("<i>“Later, maybe,”</i> you say. The anat shrugs again and orders another glass of wine.");
	
	output("\n\n<i>“As said, I’m free after the evening shows if you change your mind.”</i>");
	
	processTime(2);

	fazianMenu(fazianDancing);
}

public function fazianMyr():void
{
	clearOutput();
	showFazian();

	if (flags["FAZIAN_QUEST_STATE"] == FAZIAN_QUEST_COMPLETE) output("You guess you already know the answer to this, but surrounded by their orange softness and their high, twittering voices, it is the obvious question to ask.\n\n");

	output("<i>“What do you think of the myr?”</i>");
	
	output("\n\n<i>“They’re wonderful,”</i> says Fazian with happy, level conviction. <i>“Such a welcoming, intelligent and peaceful race. Not just the golds. Oh, the reds armor themselves up with their conventions more, but beneath that - they are women. They are born to be caring, loving beings. Being around them, and performing for them, is a pleasure.”</i> He takes a long pull on his glass of wine, blue eyes slightly misty.");

	if (pc.isBimbo() || pc.isBro()) output("\n\nEven to your own love-swamped mind, this doesn’t sound quite right.");
	else output("\n\nYou don’t think you can let this go by entirely unchallenged.");

	output("\n\n<i>“They, uh, did kill each other in the hundreds of thousands. And are now on the brink of nuclear war,”</i> you point out.");
	
	output("\n\n<i>“It was a mistake,”</i> the anat replies stubbornly, feathers rustling. <i>“The whole war - it is a colossal mistake, caused by gender imbalance above and beyond anything else. You talk to any gold or red myr for long enough, it becomes obvious that what they are really craving is love or motherhood, and they never get enough opportunities for either.”</i> He sucks on his straw determinedly.");
	
	output("\n\n<i>“You do not understand, Steele - I am told much of the U.G.C. is female-orientated as well, perhaps these things aren’t as obvious to you. I come from a society dominated by males. Hard lines, an obsession with physical goals, emotionality locked away, those are the orders of the day. Here, I can feel the opposite is waiting to burst through, if anyone is willing to give it a chance to. Perhaps the kui-tan? I don’t know. In the meantime, I will share myself and my art with the myr as much as I can. Try and give them the happiness that is their true birth-right.”</i>");
	
	output("\n\nEven if you were minded to, you doubt you could persuade him otherwise.");

	if (flags["FAZIAN_QUEST_STATE"] == FAZIAN_QUEST_NOTSTARTED)
	{
		flags["FAZIAN_QUEST_STATE"] = FAZIAN_QUEST_OFFERING;
		flags["FAZIAN_QUEST_TIMER"] = GetGameTimestamp();
	}

	processTime(6);
	
	fazianMenu(fazianMyr);
}

public function fazianDance():void
{
	clearOutput();
	showFazian();

	output("<i>“You on for some dance training?”</i> you say.");
	
	output("\n\n<i>“Of course!”</i>");

	output("\n\nFazian scrapes his stool back, and you follow his bright, bobbing feathers through the thronged, dusky room to a door behind the main stage. A tough-looking gold myr stationed here gives you a menacing eyeball, but holds it open for both of you.");
	
	output("\n\nBackstage is a wooden, airy space sparsely populated by props, double-tiered chin-up bars and boxes stuffed with stripper gear. The few gold myr guys back here taking a break or doing their hair give you quizzical looks but otherwise leave you alone.");

	if (flags["FAZIAN_DANCE_TRAINS"] == undefined)
	{
		flags["FAZIAN_DANCE_TRAINS"] = 1;

		output("\n\n<i>“This’ll be... interesting,”</i> says Fazian thoughtfully, clicking his claws as he looks you up and down.");
		if (pc.isNaga() || pc.isGoo()) output(" <i>“I can’t say I ever expected to teach someone with no legs how to dance.");
		else if (pc.isTaur() || pc.isDrider()) output(" <i>“I mean, I imagine with all those legs you </i>can<i> dance, very well. But to begin with I’ll, uh, I’ll stand back a bit, if that’s alright.")
		else if (pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output(" <i>“But you’ve got similar sort of limbs to me, so there’s that at least.");
		else output(" <i>“Watching species with bent-forward knees walk around is so </i>eery<i>.");
		output(" Do you mind just moving around a bit? Let me see you strut your stuff.”</i>");

		output("\n\nFeeling self-conscious - particularly with an audience of ripped male myr watching you out of the corner of their eyes - you");
		if (pc.hasLegs()) output(" walk");
		else output(" move");
		output(" up and down on the boards in front of Fazian. He watches you intently, still clicking his claws as if listening to an invisible beat, his pale blue eyes flickering over where your muscles tighten up and where most of your weight lands.");

		output("\n\n<i>“Alright,”</i> he says, bringing you to a halt. <i>“There’s one thing above everything else you need to understand about dancing. It doesn’t matter who you’re doing it with, on what stage, for whatever reason. When you dance, you are communicating a universal: what all girls, and guys, find attractive about the masculine. What is that?”</i>");

		if (pc.isBro()) output("\n\n<i>“Dick,”</i> you say, with absolute certainty.");
		else if (pc.isNice()) output("\n\n<i>“Gallantry?”</i> you suggest.");
		else if (pc.isMisch()) output("\n\n<i>“Obsessive behaviour and emotional ineptitude?”</i> you suggest.");
		else output("\n\n<i>“Assertiveness,”</i> you say.");

		output("\n\n<i>“Confidence, per,”</i> Fazian corrects. He brings his snapping claws down to a gently swivelling hip. <i>“You’ve got to say with your body that you’re going to get what you want, and you aren’t going to have to grab or act like a thug to do it - you just </i>will<i>, because look at </i>you.</i>”</i> You’re slightly worried that the anat’s forgetting about you. He slaps his hands and does a little shimmy. <i>“Get it wrong and they’ll laugh at you. Get it right and they’ll laugh too - with you. You’ve got to convince your audience you’re worth watching, and you do that by having absolute confidence in what you’re doing.”</i> He whirls once and lands so he’s side-on to you, still considering intently.");
		
		output("\n\n<i>“I think there’s two dances that I could easily teach you. One’s a classic and fairly straightforward - the Edotto. The other’s a bit more, um, flamboyant. The Sunwalker. Opens you up to the audience a bit more, so greater risk, greater reward, potentially. Which grabs you?”</i>");
		
		processTime(10);
	}
	else
	{
		output("\n\n<i>“So, which will it be?”</i> asks Fazian. Click, click, go his claws. <i>“Edotto, or Sunwalker?”</i>");
		
		processTime(3);
	}

	//[Edotto] [Sunwalker] 
	clearMenu();
	addButton(0, "Edotto", fazianDanceRouter, false);
	addButton(1, "Sunwalker", fazianDanceRouter, true);
}

public function fazianDanceRouter(isSunwalker:Boolean = false):void
{
	var t:String;
	var o:String;

	if (isSunwalker)
	{
		t = "DANCE_SKILL_SUNWALKER";
		o = "DANCE_SKILL_EDOTTO";
	}
	else
	{
		o = "DANCE_SKILL_SUNWALKER";
		t = "DANCE_SKILL_EDOTTO"
	}

	if (flags[t] == undefined && flags[o] == undefined)
	{
		(isSunwalker ? fazianDanceSunwalkerFirst : fazianDanceEdottoFirst)();
	}
	else
	{
		var k:int = 0;
		if (flags[t] != undefined) k = flags[t];

		var p:Array = [fazianDanceOne, fazianDanceTwo, fazianDanceThree, fazianDanceFour, fazianDanceFive, fazianDanceFive];
		p[k](isSunwalker);
	}
}

public function fazianDanceEdottoFirst():void
{
	clearOutput();
	showFazian();

	output("<i>“Alright then Steele,”</i> says Fazian. <i>“Position yourself like so, hands on hips. It always starts with your hips...”</i>");
	
	output("\n\nThe anat drills you relentlessly for the next few hours, practicing the same couple of stances over and over again. It’s tough physical work and pretty tedious, however by the end you think you’ve got the opening moves down pat.");
	
	output("\n\n<i>“Remember,”</i> Fazian says as you leave, wiping sweat from your brow. <i>“After you begin, lead with your hips. Try it out if you can, and come see me again when you’re ready for more.”</i>");

	processTime(300+rand(50));
	clearMenu();
	addButton(0, "Next", mainGameMenu);

	flags["DANCE_SKILL_EDOTTO"] = 1;
	fazianDanceSore();

	//Gain "sore" status, time brought forward 325 mins, "Begin Dance" added to Tease menu, "Edotto" added to Begin Dance menu, Edotto count set to 1
}

public function fazianDanceSunwalkerFirst():void
{
	clearOutput();
	showFazian();

	output("<i>“I thought you’d go for that one,”</i> laughs Fazian. <i>“Don’t say I didn’t warn you! Position yourself like so, hands down at your side. Then bring them up, framing your chest...”</i>");
	
	output("\n\nThe anat drills you relentlessly for the next few hours, practicing the same couple of stances over and over again. It’s tough physical work and pretty tedious, however by the end you think you’ve got the opening moves down pat.");
	
	output("\n\n<i>“Remember,”</i> Fazian says as you leave, wiping sweat from your brow. <i>“After you begin, lead with your chest. Try it out if you can, and come see me again when you’re ready for more.”</i>");

	processTime(300+rand(50));
	clearMenu();
	addButton(0, "Next", mainGameMenu);

	flags["DANCE_SKILL_SUNWALKER"] = 1;
	fazianDanceSore();

	//Gain “sore” status, time brought forward 325 mins, “Begin Dance” added to Tease menu, “Sunwalker” added to Begin Dance menu, Sunwalker count set to 1
}

public function fazianDanceSore():void
{
	soreDebuff(3);
}

public function fazianDanceOne(isSunwalker:Boolean = false):void
{
	clearOutput();
	showFazian();

	if (isSunwalker)
	{
		output("<i>“Alright Steele,”</i> says Fazian. <i>“Position yourself like so, hands down at your side. Then bring them up, framing your chest...”</i>");
		
		output("\n\nThe anat drills you relentlessly for the next few hours, practicing the same couple of stances over and over again. It’s tough physical work and pretty tedious, however by the end you think you’ve got the opening moves down pat.");
		
		output("\n\n<i>“Remember,”</i> Fazian says as you leave, wiping sweat from your brow. <i>“After you begin, lead with your chest. Try it out if you can, and come see me again when you’re ready for more.”</i>");
	}
	else
	{
		output("<i>“Alright then Steele,”</i> says Fazian. <i>“Position yourself like so, hands on hips. It always starts with your hips...”</i>");
		
		output("\n\nThe anat drills you relentlessly for the next few hours, practicing the same couple of stances over and over again. It’s tough physical work and pretty tedious, however by the end you think you’ve got the opening moves down pat.");
		
		output("\n\n<i>“Remember,”</i> Fazian says as you leave, wiping sweat from your brow. <i>“After you begin, lead with your hips. Try it out if you can, and come see me again when you’re ready for more.”</i>");
	}

	processTime(300+rand(50));
	flags[(isSunwalker ? "DANCE_SKILL_SUNWALKER" : "DANCE_SKILL_EDOTTO")] = 1;
	fazianDanceSore();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianDanceTwo(isSunwalker:Boolean = false):void
{
	clearOutput();
	showFazian();

	if (isSunwalker)
	{
		output("<i>“So,”</i> says Fazian. <i>“Once you’ve got their attention with your chest, it’s time to bring your hips into it.”</i> He fiddles with his codex, and it begins to pump out a stock 4/4 rhythm. <i>“Move them like this.”</i>");
		
		output("\n\nThe anat drills you relentlessly for the next few hours, practicing the same couple of stances over and over again. It’s tough physical work and pretty tedious, however by the end you’re starting to see how the dance develops.");
		
		output("\n\n<i>“Remember,”</i> Fazian says as you leave, wiping sweat from your brow. <i>“Lead with your chest, then bring in your hips. Try it out if you can, and come see me again when you’re ready for more.”</i>");
	}
	else
	{
		output("<i>“So,”</i> says Fazian. <i>“Once you’ve got their attention with the hips, you can start bringing in your upper body...”</i>");
		
		output("\n\nThe anat drills you relentlessly for the next few hours, practicing the same couple of stances over and over again. It’s tough physical work and pretty tedious, however by the end you’re starting to see how the dance develops.");
		
		output("\n\n<i>“Remember,”</i> Fazian says as you leave, wiping sweat from your brow. <i>“Lead with your hips, then bring in your chest. Try it out if you can, and come see me again when you’re ready for more.”</i>");
	}

	processTime(300+rand(50));
	flags[(isSunwalker ? "DANCE_SKILL_SUNWALKER" : "DANCE_SKILL_EDOTTO")] = 2;
	fazianDanceSore();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianDanceThree(isSunwalker:Boolean = false):void
{
	clearOutput();
	showFazian();

	if (isSunwalker)
	{
		output("<i>“Now you’ve got the intro and basics down,”</i> grins Fazian, bringing up the 4/4 rhythm on his codex again, <i>“you’re all set to do some proper sunwalking! It’s a wave-like motion with your hips which, if you do it right, propels you forwards. See here...”</i>");
		
		output("\n\nThe anat drills you relentlessly for the next few hours, practicing hip and [pc.leg] movements over and over again. It’s tough physical work and pretty tedious, however by the end you think you’re able to sunwalk up and down pretty effectively.");
		
		output("\n\n<i>“Remember,”</i> Fazian says as you leave, wiping sweat from your brow. <i>“Lead with your chest, then bring in your hips, then </i>style<i> with your hips. Try it out if you can, and come see me again when you’re ready for more.”</i>");
	}
	else
	{
		output("<i>“Let’s see how well you remember it,”</i> says Fazian, standing back. You shake and shimmy your hips rhythmically, whirl and puff out your [pc.chest], whilst he watches critically.");
		
		output("\n\n<i>“Not bad,”</i> he adjudges. <i>“I can almost believe you know what you’re doing. Let’s move on - you’re at a stage now where you can take your eyes off the audience. Bring in some whirls, showboat, let them see your tail.”</i>");
		
		output("\n\nThe anat drills you relentlessly for the next few hours, practicing pirouettes over and over again. It’s tough physical work and pretty tedious, however by the end you’re able to do it without getting motion sick.");
		
		output("\n\n<i>“Remember,”</i> Fazian says as you leave, wiping sweat from your brow. <i>“Lead with your hips, bring in your chest, then shake your backside. Try it out if you can, and come see me again when you’re ready for more.”</i>");
	}

	processTime(300+rand(50));
	flags[(isSunwalker ? "DANCE_SKILL_SUNWALKER" : "DANCE_SKILL_EDOTTO")] = 3;
	fazianDanceSore();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianDanceFour(isSunwalker:Boolean = false):void
{
	clearOutput();
	showFazian();

	if (isSunwalker)
	{
		output("<i>“Let’s see how you do it,”</i> says Fazian, clicking on the beat and standing back. You feel self-conscious at first as you brazenly display your [pc.chest], and you stumble a little when you start going to town on your [pc.hips], but towards the end you feel like you’re as one with the rhythm, sliding confidently back and forth on your snaking hips. This is getting good!");
		
		output("\n\n<i>“Excellent!”</i> says Fazian, cracking the air with his claws exuberantly. <i>“You’ve almost got it. Now let’s see how well you can do a crotch grab. Sunwalking is pure flamboyancy - if you’re doing it right, by this stage you can pull anything off!”</i>");
		
		output("\n\nYou go back to the drills, but it’s coming naturally to you now. After a few hours of tough practice, you feel like you’re almost on top of it. You’re a crotch-pumping natural.");
		
		output("\n\n<i>“Remember,”</i> Fazian says as you leave, wiping sweat from your brow. <i>“Lead with your chest, bring in your hips, style with your hips, then show them what you’re packing with your groin. Try it out if you can, and come see me again when you’re ready for more.”</i>");
	}
	else
	{
		output("<i>“Let’s see how well you remember it,”</i> says Fazian, standing back. You feel self-conscious at first as you shimmy your hips and brazenly display your [pc.chest], however by the time you’re pirouetting wildly, flexing and tensing your [pc.ass], most of it has fallen away. This is getting good!");
		
		output("\n\n<i>“Excellent!”</i> says Fazian, cracking the air with his claws exuberantly. <i>“You’ve almost got it. Now bring it all down, Steele. Back to the hips. They’re in the palm of your hand, work it like you know it!”</i>");
		
		output("\n\nYou go back to the drills, but it’s coming naturally to you now. After a few hours of tough practice, you feel like you’re almost on top of it.");
		
		output("\n\n<i>“Remember,”</i> Fazian says as you leave, wiping sweat from your brow. <i>“Lead with your hips, bring in your chest, shake your backside, then back to your hips. Try it out if you can, and come see me again when you’re ready for more.”</i>");
	}

	processTime(300+rand(50));
	flags[(isSunwalker ? "DANCE_SKILL_SUNWALKER" : "DANCE_SKILL_EDOTTO")] = 4;
	fazianDanceSore();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianDanceFive(isSunwalker:Boolean = false):void
{
	clearOutput();
	showFazian();

	if (isSunwalker)
	{
		output("<i>“Bring it,”</i> says Fazian simply, standing back. With no hesitation whatsoever you gesture with your arms, before throwing out shape after shape with easy confidence, finishing with a confident grab and pump. You’re stirred out of your final stance by a clatter of applause and amused whoops - the myr strippers stopped pretending they weren’t watching a while ago.");
		
		output("\n\n<i>“There’s not much more I can teach you,”</i> laughs Fazian. <i>“But it’s easy to over-egg this dance. Bring it all back down, subtler and simpler, and then finish it off with your tail feather. It’s the perfect way to end - if you’ve done it right.”</i>");
		
		output("\n\nYou go back to the drills, and learn how to pack the dance away, how to match exuberance with control. Each time you manage it, you finish it off sideways with a smouldering gaze and a jounce of your [pc.butt].");
		
		output("\n\n<i>“You’ve got it, per!”</i> Fazian says, eyes twinkling. <i>“Lead with your chest, bring in your hips, style with your hips, give them a crotch pump, and finish off with your backside. Do it with confidence and no girl or guy in the galaxy will be able to resist you. Come back any time if you want to practice.”</i>");
		
		output("\n\nYou leave, tired and sweaty but exultant.");
	}
	else
	{
		output("<i>“Bring it,”</i> says Fazian simply, standing back. With no hesitation whatsoever you snake into motion, throwing out shape after shape with easy confidence, finishing with an insouciant wiggle of the hips. You’re stirred out of your final stance by a clatter of applause and amused whoops - the myr strippers stopped pretending they weren’t watching a while ago.");
		
		output("\n\n<i>“There’s not much more I can teach you,”</i> laughs Fazian. <i>“You’ve just got to finish it all off with a good, old-fashioned crotch grab. Can’t get away with that unless you’ve already brought the house down! But you have, theoretically. Go on - you’ve earned it.”</i>");
		
		output("\n\nYou go back to the drills, and each time you pull the whole sequence off, you learn the fine art of grasping your groin and pumping your hips.");
		// No front genitals:
		if (pc.genitalLocation() >= 2) output(" Or as in your case, grasping a featureless expanse of flesh and pumping your hips, but it’s the thought that counts.");
		
		output("\n\n<i>“You’ve got it, per!”</i> Fazian says, eyes twinkling. <i>“Lead with your hips, bring in your chest, shake your backside, back to your hips, and finish it off with your crotch. Do it with confidence and no girl or guy in the galaxy will be able to resist you. Come back any time if you want to practice.”</i>");
		
		output("\n\nYou leave, tired and sweaty but exultant.");
	}

	processTime(300+rand(50));
	flags[(isSunwalker ? "DANCE_SKILL_SUNWALKER" : "DANCE_SKILL_EDOTTO")] = 4;
	fazianDanceSore();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianQuestOpening():void
{
	clearOutput();
	showHepane();

	output("<i>“The cabaret on?”</i> you ask.");
	
	output("\n\n<i>“No,”</i> she replies distractedly, looking past you and wringing all four hands. <i>“I... I don’t suppose you’ve seen Fazian anywhere?”</i>");
	
	output("\n\n<i>“He not around?”</i>");
	
	output("\n\n<i>“He hasn’t shown up to the club for the last two nights running,”</i> she says, unease etched on her pretty, pointed face. <i>“I thought maybe he was feeling poorly last night... but now, nobody seems to know what’s happened to him. The port authorities won’t tell me anything, except that he’s not on his ship. If he were a myr I could ask the royal guard about it, but...”</i> She looks helpless.");

	processTime(5);
	
	//[Help] [Delay] [Not My Problem]
	
	if (flags["FAZIAN_QUEST_SUCCESSES"] == undefined) flags["FAZIAN_QUEST_SUCCESSES"] = 0;
	if (flags["FAZIAN_QUEST_FAILURES"] == undefined) flags["FAZIAN_QUEST_FAILURES"] = 0;
		
	clearMenu();
	addButton(0, "Help", fazianQuestHelp, undefined, "Help Out", "Your intuition tells you to be careful here. It’s possible you could muck this up.");
	addButton(1, "Delay", fazianQuestDelay, undefined, "Delay", "Perhaps you could help. A bit later, though.");
	addButton(2, "NotMyProb", fazianQuestNotMyProblem, undefined, "Not My Problem", "If you choose this, it’s likely you’ll never see Fazian again.");
}

public function fazianQuestNotMyProblem():void
{
	clearOutput();
	showHepane();
	
	output("<i>“Sorry to hear that,”</i> you say. <i>“Hope he turns up eventually.”</i>");
	
	output("\n\n<i>“Yes...”</i> Hepane’s attention has already drifted past you to the entrance of the club again.");

	flags["FAZIAN_QUEST_STATE"] = FAZIAN_QUEST_REJECTED;
	
	processTime(2);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianQuestDelay():void
{
	clearOutput();
	showHepane();

	if (flags["FAZIAN_QUEST_DELAY"] == undefined)
	{
		flags["FAZIAN_QUEST_DELAY"] = 1;
		output("<i>“I might be able to look for him,”</i> you say. <i>“Just give me some time, okay?”</i>");
		
		output("\n\n<i>“It would be wonderful if you could,”</i> says Hepane, focusing on you at last. She reaches out to grasp your hand tightly. <i>“Another starwalker might be able to... please hurry.”</i>");
	}
	else
	{
		output("<i>“He... he still hasn’t shown up,”</i> says Hepane the moment you roll into view. Watching a gold myr wring her hands is mesmerizing, in its own way. <i>“Can you help?”</i>");
	}
	
	processTime(5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianQuestHelp():void
{
	clearOutput();
	showHepane();

	if (pc.isNice()) output("<i>“I’ll find him,”</i> you say, with all the confidence you can muster. <i>“Don’t worry about a thing. Just tell me where you saw him last.”</i>");
	else if (pc.isMisch()) output("<i>“I’ll find him, no problem,”</i> you say, trying to lighten her mood. <i>“No matter how well a bone-headed brightly-feathered dude blends into the crowd here. Where did you see him last?”</i>");
	else if (pc.isAss()) output("<i>“He’ll have got himself involved in some orgy, forgotten all about you,”</i> you say, rolling your eyes. Maybe you believe that, maybe you don’t; the point is to put the lady at ease. <i>“I’ll find him, no problem. Slap some sense into him while I’m at it. Where did you see him last?”</i>");

	output("\n\n<i>“I last saw him a few nights ago,”</i> says Hepane, brow crinkling in thought. <i>“We did our usual performance, and then he went to the bar as usual. I didn’t really see him after that. I didn’t - I can’t remember anything unusual happening. He often goes off with other myr, it’s... we have a professional relationship.”</i> Her tone suggests one half of the pair is happier with this arrangement than the other. <i>“We usually do a rehearsal in the afternoon, and he didn’t turn up then. I haven’t seen him since.”</i>");
	
	output("\n\n<i>“Try asking around?”</i> she suggests after a heavy pause. <i>“I already have, around the club at least, but maybe - you’re a starwalker, too. You must know sophisticated questions to ask, get people to open up more. If you find anything out, come back to me. I’ll wait here, in case he does show up in the meantime.”</i>");
	
	output("\n\nAs you leave she grabs your hand. <i>“Thank you for doing this,”</i> the accompanist says tremulously. <i>“I’d hate if something bad had happened to him. I think - I don’t think Fazian knows how bad this world can be.”</i>");
	
	output("\n\nYou go to the Honey Nozzle’s bar and take stock. Who in the club, Gildenmere and the nearby spaceport might know where the gene-modded anat has gotten to?");

	flags["FAZIAN_QUEST_STATE"] = FAZIAN_QUEST_STARTED;
	
	processTime(8);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);

	//Add [Gold Myr], [Barkeep] to Honeypot's main menu. Add [Fazian] to Dally's menu, Gene's menu and Juro's menu. 

	//Ghost [Hepane] until Fazsuccess count = 3 or Fazfail count = 3.
}

public function fazianQuestGoldMyr():void
{
	clearOutput();
	showName("GOLD\nMYR");
	showBust("GOLDMYR", "GOLDMYR", "GOLDMYR");
	author("Nonesuch");

	output("<i>“Excuse me ladies,”</i> you say, breaking the tipsy chatter of the gold myr grouped near one of the strip poles, <i>“but I wonder if any of you have seen the dancer Fazian? He’s got feathers, about yay high...”</i>");
	
	output("\n\n<i>“Ooh yes,”</i> replies one immediately. <i>“He’s a nice piece of honeycomb, isn’t he? Shame you have to pay to go see him.”</i>");
	
	output("\n\n<i>“W’s up with that, anyway?”</i> slurs another, trying to reach up and pinch the passing legs of a myr stripper. <i>“Starwalker charging us. What - why - how could they need our money? Pointing their stalag-cannons at us all the while. S’isn’t right.”</i>");
	
	output("\n\n<i>“It’s to keep cheap, pinching wetra-wives like you away from the prime stock!”</i> shrills another. They all dissolve into laughter.");
	
	output("\n\n<i>“The thing is, he’s gone missing,”</i> you try.");
	
	output("\n\n<i>“It does raise the question,”</i> says a more bookish one, <i>“about the universal nature of monetary exchange. To think that, for all their sophistication, starwalkers are still using a form of bargaining which is recognisable to us...”</i>");
	
	output("\n\n<i>“Oh here we go,”</i> retorts the first. <i>“She gets one study published in the Gildenglobe and suddenly she’s the expert.”</i>");
	
	output("\n\n<i>“We’re here to have a good time!”</i> wails another.");

	processTime(8);
	
	//[Good Cop] [Bad Cop]
	clearMenu();
	addButton(0, "Good Cop", fazianQuestGoldMyrGood, undefined, "Good Cop", "Encourage them to keep talking. Maybe they’ll reveal something interesting.");
	addButton(1, "Bad Cop", fazianQuestGoldMyrBad, undefined, "Bad Cop", "Insist they get back to the point, emphasizing how important this is.");
}

public function fazianQuestGoldMyrGood():void
{
	clearOutput();
	showName("GOLD\nMYR");
	showBust("GOLDMYR", "GOLDMYR", "GOLDMYR");
	author("Nonesuch");

	output("<i>“So where are you ladies from?”</i> you say, pulling up a chair. <i>“You all researchers?”</i>");
	
	output("\n\nOver the next hour or so you learn an awful lot about the current state of philosophical and economical debate in Gildenmere.");
	if (pc.isMasculine()) output(" You also get rather unsubtly groped and hit upon.");
	output(" The party of gold myr exit the club eventually, blowing kisses at you and tittering into each other’s arms, leaving you with a minor headache and absolutely no further clue as to what happened to Fazian.");

	//Fazfail + 1, remove "Gold Myr" from Honeypot menu
	flags["FAZIAN_QUEST_GOLDMYR"] = -1;
	flags["FAZIAN_QUEST_FAILURES"]++;

	processTime(4);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianQuestGoldMyrBad():void
{
	clearOutput();
	showName("GOLD\nMYR");
	showBust("GOLDMYR", "GOLDMYR", "GOLDMYR");
	author("Nonesuch");

	output("<i>“Listen to me, dammit,”</i> you bark, banging your fist on the table. <i>“A young man who performs for you has gone missing. Would you be this careless if it was one of your own brothers? Stop taking the piss for a moment and think. When was the last time any of you saw him?”</i>");
	
	output("\n\nThe table goes quiet.");
	
	output("\n\n<i>“Sorry, starwalker,”</i> says one in a small voice. They all look at each other uneasily, antennae twitching.");
	
	output("\n\n<i>“We don’t know where he is,”</i> goes on another. <i>“But... if some gold myr had kidnapped him, we’d know about it.”</i>");
	
	output("\n\n<i>“Wouldn’t be able to keep that quiet around here,”</i> agrees a third. <i>“And everyone would be pissed. He’s the star performer of this place, no-one likes the cabaret being closed. Someone would roach.”</i>");
	
	output("\n\nThat’s something, at least. You thank the party stiffly and leave.");

	//Fazsuccess + 1, remove "Gold Myr" from Honeypot menu
	flags["FAZIAN_QUEST_GOLDMYR"] = 1;
	flags["FAZIAN_QUEST_SUCCESSES"]++;

	processTime(4);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianQuestBarkeep():void
{
	clearOutput();
	showBust("GOLDMYR");
	showName("\nBARKEEP");
	author("Nonesuch");

	output("The barkeep eyes you as you sit down near her. For a gold myr, she’s pretty tough-looking; flat-nosed and drawn features. She gazes back at you impassively, cleaning two glasses at once.");
	
	output("\n\n<i>“You know the dancer Fazian, right?”</i> you say. <i>“Used to perform here. Have you seen him recently?”</i>");
	
	output("\n\n<i>“Yes,”</i> she replies. <i>“No.”</i>");
	
	output("\n\n<i>“Do you know anyone who might?”</i> She snorts.");
	
	output("\n\n<i>“Sure. Want me to sort you out with some red venom, too? Maybe one or two girls who’ll do </i>anything<i> if you can smuggle them off this world, while you’re waiting.”</i> She examines one of the glasses in her hands critically. <i>“Lot of business flows through here. Why? Because the staff don’t know and they don’t tell. Particularly not to some starwalker who got put up to it by the royal guard.”</i>");

	processTime(8);
	
	//[Good Cop] [Bad Cop]
	clearMenu();
	addButton(0, "Good Cop", fazianQuestBarkeepGood, undefined, "Good Cop", "Appeal to empathy. Encourage her to open up a bit.");
	addButton(1, "Bad Cop", fazianQuestBarkeepBad, undefined, "Bad Cop", "Force the information out of her.");
}

public function fazianQuestBarkeepGood():void
{
	clearOutput();
	showBust("GOLDMYR");
	showName("\nBARKEEP");
	author("Nonesuch");

	output("<i>“Okay. You got me right,”</i> you say, quietly. <i>“I am an outsider, looking for another outsider. You know what my interest is? Knowing how much it would suck to be lost and alone on an alien planet, without anyone looking for me. I don’t want to incriminate anyone. I just want to know where to look.”</i>");
	
	output("\n\nThe barkeep is silent for a time, turning the glass around and around in her hands. Her pupil-less eyes are unreadable.");
	
	output("\n\n<i>“If I were looking for that friend of yours...”</i> she says at last. <i>“...I would look in Kressia. I cannot say any more than that, "+ pc.mf("Mr.", "Mrs.") +" Outsider. Not without there being... repercussions.”</i>");
	
	output("\n\nYou cannot get anything more from her. Still, it’s something.");

	processTime(4);
	
	//Fazsuccess + 1, remove "Barkeep" from Honeypot menu
	flags["FAZIAN_QUEST_BARKEEP"] = 1;
	flags["FAZIAN_QUEST_SUCCESSES"]++;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianQuestBarkeepBad():void
{
	clearOutput();
	showBust("GOLDMYR");
	showName("\nBARKEEP");
	author("Nonesuch");

	output("<i>“I know you know something,”</i> you growl menacingly. <i>“I suggest you cough up, or things are going to get real unpleasant in here.”</i>");
	
	output("\n\nShe shakes her head disbelievingly.");
	
	output("\n\n<i>“Trying to kick off a fight so you can charge me? Really?”</i> she sneers. <i>“You are beyond pathetic. If you have any proof whatsoever I’ve done something wrong, charge me. Because I know you don’t, you can get out of my face.”</i> She strides off to serve someone at the other end of the bar. No amount of cajoling or threatening will get her to talk to you again.");

	processTime(4);
	
	//Fazfail + 1, remove “Barkeep” from Honeypot menu
	flags["FAZIAN_QUEST_BARKEEP"] = -1;
	flags["FAZIAN_QUEST_FAILURES"]++;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianQuestDally():void
{
	clearOutput();
	showBust("DALLY");
	showName("\nDALLY");
	author("Nonesuch");

	output("<i>“Hey,”</i> you say, sidling into a free space next to the myr stripper’s stage. <i>“You must know Fazian, right? Feathered guy, used to do the cabaret. Do you know what’s happened to him?”</i>");
	
	output("\n\n<i>“You want to talk?”</i> replies Dally breezily, not slowing down his slow gyration around his pole. <i>“That is fine, I’ll talk with you. But it costs. Just the same as anything or anybody else.”</i>");

	processTime(2);
	
	//[Pay 250 credits] [Don't]
	clearMenu();
	if (pc.credits >= 250) addButton(0, "Pay 250c", fazianQuestDallyPay, undefined, "Pay 250 credits", "");
	else addDisabledButton(0, "Pay 250c", "Pay 250 credits", "You don’t have enough credits.");
	addButton(1, "Don’t Pay", fazianQuestDallyNoPay);
	addButton(14,"Back", dallyMenu);
}

public function fazianQuestDallyNoPay():void
{
	clearOutput();
	showBust("DALLY");
	showName("\nDALLY");
	author("Nonesuch");

	output("You can barely believe this guy’s mercantilism.");
	
	output("\n\n<i>“I don’t want - this is an investigation!”</i> you cry, outraged. A few other myr look over. <i>“I’m not paying you for that! Where did you see Fazian last?”</i>");
	
	output("\n\nBut Dally walls you completely, continuing on to where two gold myr are eagerly rubbing paper notes at him. Even when he’s finished with them, no amount of cajoling can bring him back to the subject.");

	//Fazfail + 1, remove "Fazian" from Dally menu
	flags["FAZIAN_QUEST_DALLY"] = -1;
	flags["FAZIAN_QUEST_FAILURES"]++;

	processTime(3);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianQuestDallyPay():void
{
	clearOutput();
	showBust("DALLY");
	showName("\nDALLY");
	author("Nonesuch");

	output("You roll your eyes, but produce a credit chit.");
	
	output("\n\n<i>“Thank you,”</i> says Dally, squirreling it away and sitting down facing you with his legs dangling off the stage and his bulging abdomen on it. <i>“Now come here. Don’t worry... don’t be tense...”</i> He puts his smooth hands on either side of your head and brings his face close. <i>“Now it looks professional, you see?”</i> he murmurs. <i>“Please don’t think I’m selfish. I don’t know who listens in here, who makes dancers disappear in the middle of the night. But I have some idea, yes.”</i> You realize the male myr is quite scared.");
	
	output("\n\n<i>“Your friend Fazian, he didn’t really get it. You’ve got to keep some professional distance if you’re a male performer here. If you don’t... you share yourself with everyone, you go off with just anyone who asks... you attract predators. The myr he was talking to, three nights ago? I would hide behind the curtains sooner than perform for that type. She does business. Lot of people want to get in and out of gold territory discretely - lot of people want </i>other<i> people to get in and out of gold territory discretely - and she can make that happen. I always warned Fazian - just generally, you know - but he just laughed. He didn’t get it...”</i>");
	
	output("\n\n<i>“Know anything else?”</i> you murmur. <i>“What they talked about?”</i>");
	
	output("\n\n<i>“I’m sorry, starwalker,”</i> he replies softly. <i>“Sounded like she was making him an offer. All I know is that myr hasn’t been around since. Fazian was there the night afterwards, and no-one at the club has seen him since. Good luck finding him - and be careful yourself.”</i> He releases his gentle hold on your head and gets up, returning to his dancing with a final mournful look.");
	
	output("\n\nThat sounded significant.");

	pc.credits -= 250;
	processTime(8);
	
	//Fazsuccess + 1, remove "Fazian" from Dally menu
	flags["FAZIAN_QUEST_DALLY"] = 1;
	flags["FAZIAN_QUEST_SUCCESSES"]++;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianQuestGene():void
{
	clearOutput();
	showName("\nGENE");
	showBust("GENE");
	author("Nonesuch");

	output("<i>“Did you know Fazian?”</i> you ask. <i>“Anat, bright feathers?”</i>");
	
	output("\n\n<i>“‘Did?’,”</i> repeats Gene, swishing his tails ponderously. <i>“A portentous tense indeed! Has something befallen the kaleidoscopic popinjay?”</i>");
	
	output("\n\n<i>“He’s gone missing,”</i> you say. <i>“Wondered if you knew anything about him, what might have happened to him.”</i>");
	
	output("\n\n<i>“Yes, I... knew... him,”</i> rumbles Gene. <i>“He came in here a few times to peruse my stock, talk about mods and how exactly we fellow emperors had washed up here. Nice chap but </i>frightfully<i> naive, both on the subject of myr and post-neocapitalist theory. As to what’s happened to him - Huh!”</i>");
	
	output("\n\nHe snorts like a halting train.");
	
	output("\n\n<i>“That is as obvious to me as it should be to you, dear Steele. Some group of myr, or maybe even nyrea, have had enough of his endless flirting and have snaffled him up to enjoy all for themselves. No doubt he is enjoying the hospitality of the peaceful, loving denizens of this planet even as we speak.”</i> He shrugs.");
	
	output("\n\n<i>“As to which flavor of sex-starved arthropod, I’m afraid I have no clue.”</i> He taps his horn lips thoughtfully, though. <i>“Hmm. He did drop by a few days ago. I wasn’t paying much attention to him because I was rather anticipating one of my favourite lady callers. What were we talking about? Fazian gets it into his head to criticize my method of delivering mods to the denizens of this planet. He comes at it so </i>politely<i>, each time from a new angle, the very model of the eager, unwavering proselytizer. So here I am, afire with anticipatory passion, wondering how in the galaxy I am going to swat aside this tiresome socialist in the fastest yet most graceful way possible...”</i> His rich voice fills the shop’s space like an orchestra playing the opening chords of an extremely long aria.");

	processTime(8);
	
	// [Listen] [Leave]
	clearMenu();
	addButton(0, "Listen", fazianQuestGeneListen, undefined, "Listen", "Wait to see if he does, in the event, have anything worthwhile to say.");
	addButton(1, "Leave", fazianQuestGeneLeave, undefined, "Leave", "Time is of the essence.");
}

public function fazianQuestGeneListen():void
{
	clearOutput();
	showName("\nGENE");
	showBust("GENE");
	author("Nonesuch");

	output("<i>“...which is why burgundy is the true stripe of masculinity, and not a splurge of gaudy rainbow, whatever other examples of avian sentience have to say on the matter,”</i> Gene continues, some time later. He pauses finally, frowning. You stir, coming to your senses slightly.");
	
	output("\n\n<i>“Now, what was it that he was wittering on about that day? Ah, yes! He said he had an invitation to do a private performance with some very select myr that night, after he finished at his club. I can’t tell you what kind of myr, or where... but it sounded as if he was preparing for a fair bit of travel.”</i> He sniffs. <i>“That’s all I know I’m afraid, Steele. Best of luck finding the silly little peacock.”</i>");

	//Fazsuccess + 1, remove "Fazian" from Gene's talk menu
	flags["FAZIAN_QUEST_GENE"] = 1;
	flags["FAZIAN_QUEST_SUCCESSES"]++;

	processTime(5);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianQuestGeneLeave():void
{
	clearOutput();
	showName("\nGENE");
	showBust("GENE");
	author("Nonesuch");

	output("<i>“I’m sorry, Gene,”</i> you interrupt. <i>“But I’ve got to go.”</i>");
	
	output("\n\n<i>“Oh, of course,”</i> blinks the fanfir, stopped mid-flow. <i>“Best of luck finding the silly little peacock, I suppose.”</i>");

	flags["FAZIAN_QUEST_GENE"] = -1;
	flags["FAZIAN_QUEST_FAILURES"]++;

	processTime(3);
	
	clearMenu();
	//addButton(0, "Next", mainGameMenu);
	addButton(0, "Next", move, rooms[currentLocation].eastExit);
}

public function fazianQuestJuro():void
{
	clearOutput();
	juroDisplay();
	author("Nonesuch");

	output("<i>“Do you know Fazian?”</i> you ask. <i>“About yay tall, bright feathers. He lives on his ship, he must have walked past here most days.”</i>");
	
	output("\n\n<i>“The anat? Yes, I know him,”</i> replies the kui-tan. He fiddles with his pile of paperwork distractedly. <i>“I know him to look at, that is to say; difficult to miss. I don’t believe we’ve ever exchanged a word. Why?”</i>");
	
	output("\n\n<i>“He’s gone missing,”</i> you say. <i>“Wondered if you had any idea what might have happened to him.”</i>");
	
	output("\n\n<i>“Bluntly, no,”</i> says Juro with an exasperated sigh. <i>“I’ve got more than enough on my plate right now than to keep tabs on every adventurer who drifts through here, [pc.name] Steele.”</i> He slides a file out of his teetering in-box. <i>“I wouldn’t presume to pay too much attention to anatae at the best of times. They have this nasty tendency to pay attention back.”</i>");
	
	output("\n\n<i>“You must have security footage of this spaceport,”</i> you frown, looking around. <i>“You wouldn’t mind me having a look, if you’re busy?”</i>");
	
	output("\n\n<i>“Goodness me. Hand that kind of data over to a non-affiliated with a missing friend story during an extremely precarious ceasefire?”</i> he replies with a dry snort, scribbling away. <i>“I would require a warrant from the empire itself if you wanted that. Do stop pestering me with this, Steele. I have absolutely no idea what happened to this Fazian of yours.”</i>");

	processTime(8);
	
	// [Make a scene] [Anatae.] [Leave]
	clearMenu();
	addButton(0, "Make Scene", fazianQuestJuroScene, undefined, "Juro", "Try and fluster the kui-tan into giving you what you want.");
	addButton(1, "Anatae", fazianQuestJuroAnatae, undefined, "Anatae", "Threaten Juro with his own advice.");
	addButton(14, "Leave", fazianQuestJuroLeave, undefined, "Leave", "He’s right, this is pointless. Leave him be.");
}

public function fazianQuestJuroLeave():void
{
	clearOutput();
	juroDisplay();

	output("Seeing that it is no use, you leave the kui-tan alone.");
	
	processTime(1);
	
	flags["FAZIAN_QUEST_JURO"] = -1;
	flags["FAZIAN_QUEST_FAILURES"]++;
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianQuestJuroAnatae():void
{
	clearOutput();
	juroDisplay();
	author("Nonesuch");

	output("<i>“Alright then, Juro,”</i> you say with a heavy sigh. <i>“I’ll go back to Tavros. I’ll find where the anatae commission is stationed. I’ll explain the situation to them and jump through whatever hoops they want. Then I’ll come back with your warrant. By then Fazian will be gone for good, and you know all that will be left? His people’s empire gaining a sudden interest in one obfuscating kui-tan bureaucrat, and the planet he is hoping to colonize.”</i>");
	if (flags["JURO_LYRALLA_CLOSET_SEEN"] != undefined) output(" You lean forward on his desk and lower your voice. <i>“A kui-tan who has a hopeless conflict of interests, given he’s fucking one of the local representatives.”</i>");

	output("\n\nYou turn and begin to head eastwards towards your ship.");
	
	output("\n\n<i>“Wait!”</i> cries Juro after you’ve gotten ten feet. <i>“Wait. Alright. You can look at the spaceport’s security footage. Just... don’t tell anyone, okay?”</i> He gets up, heads into a back room, and comes back ten minutes later with a small, gray box. <i>“And make it worthwhile, okay, Steele?”</i> he parts gruffly.");
	
	output("\n\nYou settle yourself down in a quiet corner and fiddle around with the holographic projector, flicking moving images of the spaceport, captured by a flotilla of U.G.C. microbots, into the air around you. As you had guessed, Juro was being an ass; it doesn’t take five minutes to get the AI inside to provide you with the most recent footage of Fazian.");
	
	output("\n\nThere he goes, fast-forwarding his technicolor feathers past the front desk every afternoon, usually returning to his ship in the very early hours. On the last night he’s seen, he goes past the front desk, and... simply doesn’t come back. It gives you a bit of a chill watching it, exactly because there’s nothing unusual about the scene at all. If the lean, mask-faced dancer knew what was going to happen to him he’s not showing it, strolling out of the microbot’s view looking as carefree as you can remember him.");
	
	output("\n\nYou frown and rewind to the previous night, when he comes back to his ship. Again, there’s nothing unusual. He walks past the ambassadors’ offices, glances at his codex’s screen, and heads towards his ship... he walks past the ambassadors’ offices, glances at his codex’s screen... he glances at his codex’s screen... you freeze the image.");

	output("\n\n<i>“There’s something written on it,”</i> you say aloud. <i>“Do you think you can enlarge it and tell me what it is?”</i>");
	
	output("\n\n<i>“Ehm. Jay. Arr. Ehstraffe, 11 sharp,”</i> the AI replies promptly.");
	
	output("\n\n<i>“Do you know any Ehstraffes?”</i> you ask gingerly.");
	
	output("\n\n<i>“Major Ehstraffe. Red myr officer. Female. Stationed in Kressia,”</i> the tinny voice says.");
	
	output("\n\n<i>“What does she do?”</i> you ask after a moment.");
	
	output("\n\n<i>“That information is classified,”</i> replies the AI sweetly.");
	
	output("\n\nYou turn it off and return it to Juro, your mind buzzing.");

	processTime(10);
	
	// Fazsuccess + 1, remove "Fazian" from Juro's menu
	flags["FAZIAN_QUEST_JURO"] = 1;
	flags["FAZIAN_QUEST_SUCCESSES"]++;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianQuestJuroScene():void
{
	clearOutput();
	juroDisplay();

	output("<i>“Bullshit, Juro,”</i> you say loudly, making the kui-tan jerk. <i>“A U.G.C. citizen goes missing and your response is to hide behind a bunch of paper? If you aren’t going to help, at least stop getting in the way of someone who actually gives a fuck!”</i>");
	
	output("\n\n<i>“That’s enough, friend,”</i> says a voice behind you. You turn around and find a knot of uniformed gold myr guards has formed around you.");
	
	output("\n\n<i>“Just... take [pc.himHer] back to their ship,”</i> says Juro, slightly shakily. <i>“Let [pc.himHer] cool off.”</i>");
	
	output("\n\nThere’s no arguing with them, and fighting will only make things a lot worse. You allow the gold myr to march you back to the boarding ramp of your ship.");
	
	output("\n\n<i>“This world’s got enough spare aggression flying around right now,”</i> observes their officer, sympathetic but firm. <i>“If you can’t manage yours, I’d suggest taking it elsewhere.”</i>");

	flags["FAZIAN_QUEST_JURO"] = -1;
	flags["FAZIAN_QUEST_FAILURES"]++;

	currentLocation = "SHIP INTERIOR";

	processTime(5);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianQuestInvestigationDun():void
{
	clearOutput();
	showHepane();

	var f:int = (flags["FAZIAN_QUEST_FAILURES"] == undefined ? 0 : flags["FAZIAN_QUEST_FAILURES"]);
	var s:int = (flags["FAZIAN_QUEST_SUCCESSES"] == undefined ? 0 : flags["FAZIAN_QUEST_SUCCESSES"]);
	
	output("<i>“How did it go?”</i> asks Hepane anxiously, standing up when she sees you coming. <i>“Any idea where he’s gone?”</i>");
	
	if (f >= 3)
	{
		output("\n\nYou shrug.");
		
		output("\n\n<i>“I’ve got one or two, but...”</i> You tell her about your interviews and the slivers of information you managed to picked up. Even to your ears, it’s desperately thin stuff. Hepane shakes her head miserably when you finish.");
		
		output("\n\n<i>“It’s not enough, I wouldn’t know where to start with that,”</i> she says. She puts a hand on your shoulder. <i>“Thank you for trying, starwalker. Maybe if... just the knowledge that someone is looking for him might cause him to resurface, you know?”</i>");
		
		output("\n\nYou privately doubt that, but there’s nothing to be gained from saying otherwise. Nothing at all.");
		
		output("\n\nYou squeeze her hand and leave.");

		//Remove "Gold Myr", "Red Myr", "Dally: Fazian", "Gene: Fazian" and "Juro: Fazian" options if they still exist. Remove "Hepane" option from Honeypot menu.
		flags["FAZIAN_QUEST_STATE"] = FAZIAN_QUEST_FAILED;
		
		processTime(5);

		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	else if (s < 5)
	{
		
		output("\n\n<i>“He was lured out of Gildenmere and taken to Kressia,”</i> you say. <i>“Probably by some red myr.”</i>");
		
		output("\n\n<i>“A-are you sure?”</i> replies Hepane hesitantly. <i>“I think some people around here... if you asked them about someone missing, they might--”</i>");
		
		output("\n\nYou lay down your cards one after the other, going through each piece of information you wrangled out of your interviewees, showing her how everything points to your conclusion.");
	}
	else
	{
		output("\n\n<i>“He was led into believing he was going to perform at a red myr function in Kressia,”</i> you say crisply. <i>“Pretty sure he journeyed there himself. The red myr are acting under one Major Ehstraffe, and presumably they’ve still got hold of him in Kressia. Why him? He was a lot easier to ensnare than any gold male, and far fewer people missed him. For what purpose? That I do not know. Kidnapping an alien to use as a sex slave seems extreme, but that’s the only motive that anyone has so far suggested.”</i>");
		
		output("\n\nHepane stares at you, mouth slightly ajar.");
		
		output("\n\n<i>“You - you worked all that out by yourself?”</i> she says. <i>“How?”</i>");
		
		output("\n\nYou lay down your cards one after the other, going through each piece of information you wrangled out of your interviewees, showing her how everything points to your conclusion.");
	}

	output("\n\n<i>“That - that does seem pretty undeniable,”</i> Hepane agrees sorrowfully when you’re done. <i>“I was hoping maybe he’d wandered off... or some gold myr had taken him. That would have been a lot easier to sort out than this...”</i> She swallows and raises her chin. <i>“I’m going to try and talk to some people I know in Kressia. See if I can’t find out a few things myself. I’ll be back in a day or so. I hope.”</i>");
	
	output("\n\nShe picks up her bag and exits the Honey Nozzle, determination and anxiety quickening the swing of her arms and bounce of her bosom. <b>You should probably come back in a day or two to see if she finds out anything else.</b>");

	flags["FAZIAN_QUEST_STATE"] = FAZIAN_QUEST_INVESTIGATED;
	flags["FAZIAN_QUEST_TIMER"] = GetGameTimestamp();
	
	processTime(8);

	//Remove "Gold Myr", "Red Myr", "Dally: Fazian", "Gene: Fazian" and "Juro: Fazian" options if they still exist. Remove "Hepane" option from Honeypot menu.

	//After 24 hours, re-add "Hepane" option to Honeypot menu.

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianQuestInvestigationFollowup():void
{
	clearOutput();
	showHepane();

	output("<i>“I know where he’s being held,”</i> she says without preamble when you sit down opposite her. There’s a small pile of shredded tissue paper on the table. She’s working on fretfully destroying another napkin even as she starts talking.");
	
	output("\n\n<i>“There’s some large warehouses on the southeast side of Kressia. They have been appropriated for use by the Federation. A sister of mine says she saw someone in a mask with bright antenna being led inside on the night he disappeared... and no-one’s seen anyone matching that description since.”</i> Hepane’s pupil-less eyes lock with yours.");
	
	output("\n\n<i>“It’s... a bad place, [pc.name] Steele,”</i> she says, with a slight quaver. <i>“It took me a while to find anyone willing to tell me even that. Nobody knows what the Federation are doing there, but...”</i> she trails off, and puts her hand on top of yours. <i>“Please get him out of there. I don’t know who else to ask. My queen has no power over what happens in Kressia anymore, and your government does not seem to care. I can’t offer you anything except gratitude. Please.”</i> She squeezes your hand. <i>“And be careful if you do, kind starwalker. I think you are much less naive than Fazian, but... both of you going missing would be very hard to take.”</i>");

	output("\n\nShe leaves you with a lot to think about.");

	flags["FAZIAN_QUEST_STATE"] = FAZIAN_QUEST_RESCUE;
	
	processTime(5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianQuestApproachWarehouse():void
{
	clearOutput();
	showBust("MYR_RED_GUARD");
	showName("RED\nMYR");
	author("Nonesuch");

	output("<i>“This is not a place");
	if (pc.race().indexOf("gold myr") != -1) output(" for a gold myr to be");
	else if (pc.race().indexOf("red myr") != -1) output(" for you to be, sister");
	else if (pc.race().indexOf("orange myr") != -1) output(" for a... gold myr to be");
	else output(" for a starwalker to be");
	output(",”</i> says the tough-looking soldier when you cautiously approach the warehouse’s entrance, watching you impassively. <i>“Move along.”</i>");
	
	processTime(2);

	fazianQuestApproachMenu();
}

public function fazianQuestApproachMenu():void
{
	clearMenu();

	if (flags["FAZIAN_QUEST_DOOR"] == undefined || flags["FAZIAN_QUEST_DOOR"] + (6 * 60) < GetGameTimestamp())
	{
		addButton(0, "The Back", fazianQuestApproachBack, undefined, "The Back", "See if you can find some way into the warehouse around the back of it.");
	}
	else
	{
		addDisabledButton(0, "The Back", "The Back", "The guards are still keeping an eye on the back of the building. Best to stay away from there for now.");
	}
	
	if (flags["GUARD_BRIBE"] == undefined)
	{
		if (pc.credits >= 500) addButton(1, "Bribe", fazianQuestApproachBribe, undefined, "Bribe", "Try and bribe the woman to let you in.");
		else addDisabledButton(1, "Bribe", "Bribe", "You probably don’t have enough credits to make it worth the guards while.");
	}
	else
	{
		addDisabledButton(1, "Bribe", "Bribe", "You’ve already attempted to bribe the guard, and it didn’t exactly go your way!");
	}
	
	addButton(2, "Fight", fazianQuestApproachFight, undefined, "Fight", "This probably isn’t a good idea.");

	addButton(14, "Leave", mainGameMenu);
}

public function fazianQuestApproachBack():void
{
	clearOutput();
	clearBust();
	author("Nonesuch");
	
	moveTo("FAZIAN_RESCUE_ROOM");
	showName("WAREHOUSE:\nBACK");

	output("You make a show of apologetically putting your hands in the air and stepping back to the main road, nothing more than a clueless tourist having a nosey around. You walk off and loop back around, carefully approaching the vast warehouse from the side jutting out of the cavern wall.");
	
	output("\n\nFor a building apparently repurposed by the Federation, security seems very lax indeed; you can only see the one guard stationed in front of the main doors. Perhaps it doesn’t need any more protection. You can’t see any more entrances here, except for a very sturdy-looking side door and a medium-sized window, twelve feet up. You can hear heavily muffled activity inside: what sounds like a lot of people moving around.");

	processTime(4);
	
	fazianQuestApproachBackMenu();
}

public function fazianQuestApproachBackMenu():void
{
	clearMenu();

	if (flags["FAZIAN_QUEST_DOOR"] == undefined)
	{
		addButton(0, "Door", fazianQuestApproachBackDoor, undefined, "The Door", "Maybe you can force the door?");
	}
	else
	{
		addDisabledButton(0, "Door", "The Door", "You don’t think you can make it through the door without alerting the guards to your presence... like last time.");
	}

	if (flags["FAZIAN_BACK_WINDOW"] == undefined)
	{
		if (pc.canFly() || (pc.accessory is Hoverboard) || pc.hasItemByClass(Hoverboard)) addButton(1, "Window", fazianQuestApproachBackWindow, undefined, "The Window", "Perhaps you have something that will enable you to get up there...");
		else addDisabledButton(1, "Window", "The Window", "You can’t possibly reach that.");
	}
	else
	{
		addDisabledButton(1, "Window", "The Window", "You’ve already tried that, and it didn’t work out for you.");
	}

	addButton(3, "Wait", fazianQuestApproachBackWait);

	addButton(14, "Back", fazianQuestApproachLeave);
}

public function fazianQuestApproachBackWait():void
{
	clearOutput();
	showBust("MYR_RED_GUARD","REDMYR");
	showName("WAREHOUSE:\nBACK");
	author("Nonesuch");

	output("You settle yourself down behind some crates near the door, keeping a close watch. At least, that’s what you set out to do - after about ten minutes have crawled by you take your codex out and begin to extranet surf. Another forty minutes drift by, the pins and needles in your [pc.lowerBody] getting steadily more annoying. You’re about to give up and head back to the street when the door bangs open.");
	
	output("\n\n<i>“ - shouldn’t do this, not on duty,”</i> hisses one of the two red myr in uniform who come tip-tapping out. <i>“Ehstraffe will kill us if she finds out.”</i>");
	
	output("\n\n<i>“She can sanction me, for all I care,”</i> says the other, clutching the other’s hand. <i>“I need a break from watching </i>that<i>, and I need... this.”</i>");
	
	output("\n\nShe embraces the other myr passionately, spreading her hands across her fabric-stretching rump. Their lips meet, and the first slides her leg between the other’s thighs, the vertical lovemaking getting more urgent as the aphrodisiac hits.");

	processTime(35+rand(10));

	// [Head in] [Leave]
	clearMenu();
	addButton(0, "Head In", fazianQuestApproachBackHeadIn, undefined, "Head In", "Use this opportunity to sneak inside.");
	addButton(1, "Leave", fazianQuestApproachBackWaitLeave, undefined, "Leave", "How awkward would it be if they see you now? Very. Beat a retreat while you can.");
}

public function fazianQuestApproachBackHeadIn():void
{
	clearOutput();
	clearBust();
	showName("WAREHOUSE:\nBACK");
	author("Nonesuch");

	output("As unobtrusively as you can, you sneak out from behind the crates and slink through the open door. You think you could have made as much noise as you wanted to, really; those two are miles away.");

	processTime(2);
	
	clearMenu();
	addButton(0, "Next", fazianQuestWarehouseBack);
}

public function fazianQuestApproachBackWaitLeave():void
{
	clearOutput();
	author("Nonesuch");
	
	moveTo("817");
	showLocationName();

	output("You unobtrusively head back to the street, the sound of enthusiastic macking following you all the way.");

	pc.changeLust(5);
	processTime(20+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianQuestApproachBackDoor():void
{
	clearOutput();
	clearBust();
	showName("WAREHOUSE:\nDOOR");
	author("Nonesuch");

	output("You go up to the door and rattle the handle. Locked. You put your shoulder to it and throw your weight against it with a bang. It doesn’t budge.");
	
	output("\n\nWhat now?");
	
	processTime(2);

	//[Keep trying] [Get back]
	clearMenu();
	addButton(0, "Keep Trying", fazianQuestApproachBackDoorForce, undefined, "Keep Trying", "It’s bound to give eventually.");
	addButton(14, "Get Back", fazianQuestApproachBackDoorBack, undefined, "Get Back", "Maybe forcing the door isn’t such a good idea.");
}

public function fazianQuestApproachBackDoorForce():void
{
	clearOutput();
	showBust("MYR_RED_GUARD");
	showName("WAREHOUSE:\nDOOR");
	author("Nonesuch");

	output("You slam your frame into the door again, and again, and - it opens, throwing you off balance.");
	
	output("\n\n<i>“What the hell,”</i> says the red myr guard, glaring at you from behind the barrel of her semi-automatic, <i>“do you think you’re doing?”</i>");
	
	output("\n\n<i>“ - looking for the bathroom?”</i> is the best you can come up with.");
	
	output("\n\n<i>“You are trying to break into a military installation,”</i> says the red myr slowly, as if speaking to a complete idiot. <i>“If you leave immediately, and I never see you again, maybe you won’t spend the next ten years in prison.”</i>");
	
	output("\n\nUnder the sharp gaze of the ant woman, you rather shamefacedly head back out to the road.");
	
	output("\n\nYou’re going to have to try something different.");

	flags["FAZIAN_QUEST_DOOR"] = GetGameTimestamp();

	processTime(5);
	
	clearMenu();
	addButton(0, "Next", fazianQuestApproachLeave);
}

public function fazianQuestApproachBackDoorBack():void
{
	clearOutput();
	clearBust();
	showName("WAREHOUSE:\nDOOR");
	author("Nonesuch");

	output("You smartly head over to some crates and duck behind them. Moments later the door swings open, and an angry-looking red myr peers out. You keep very still, and eventually, with one last suspicious glare towards the street, she slams the door shut. There’s the click and thunk of several locks being turned.");

	output("\n\nTime to try something else.");
	
	processTime(2);

	fazianQuestApproachBackMenu();
}

public function fazianQuestApproachBackWindow():void
{
	clearOutput();
	clearBust();
	showName("WAREHOUSE:\nWINDOW");
	author("Nonesuch");

	if (pc.canFly())
	{
		output("You easily swoop up to the window, holding yourself in mid-air as you grip the ledge and wrestle with the latch.");

		if (pc.tallness > 63)
		{
			flags["FAZIAN_BACK_WINDOW"] = 1

			output("\n\nYour heart leaps when, with a rusty bark, the window opens, coughing decades of age into your face, allowing you to see into a darkened storeroom. Your heart sinks when, after several optimistic attempts, it becomes very obvious that there is no way you are going to fit your considerable frame through it. You almost hurt your");
			if (pc.hasWings()) output(" [pc.wingsNoun]");
			else output("self");
			output(" at the third attempt, and reluctantly you glide your way back down. You are going to have to try something else.");

			fazianQuestApproachBackMenu();
		}
		else
		{
			output("\n\nYou heart leaps when, with a rusty bark, the window opens, coughing decades of age into your face, allowing you to see into a darkened storeroom. You gingerly work your way through it. It’s dirty and undignified");
			if (pc.buttRating() > 6) output(" - particularly when your [pc.butt] gets stuck -");
			output(" but eventually you manage to get through, pooling onto a broad set of shelves you can clamber down. Although to your ears you made a hell of a racket getting in, it doesn’t seem to have alerted anyone. Score one for lateral thinking!");

			clearMenu();
			addButton(0, "Next", fazianQuestWarehouseBack);
		}
	}
	else
	{
		output("You take out your pink hoverboard and, after fiddling around with it a bit, convince it to slowly convey you upwards until you are level with the window. As quietly as you can, you grip the ledge and wrestle with the latch, precariously leaning off an old hoverboard twelve feet off the ground.");

		if (pc.tallness > 63)
		{
			flags["FAZIAN_BACK_WINDOW"] = 1;

			output("\n\nYour heart leaps when, with a rusty bark, the window opens, coughing decades of age into your face, allowing you to see into a darkened storeroom. Your heart sinks when, after several optimistic attempts, it becomes very obvious that there is no way you are going to fit your considerable frame through it. You almost fall off at the third attempt, and reluctantly you get the hoverboard to take you back down. You are going to have to try something else.");

			fazianQuestApproachBackMenu();
		}
		else
		{
			output("\n\nYou heart leaps when, with a rusty bark, the window opens, coughing decades of age into your face, allowing you to see into a darkened storeroom. You bring the hoverboard as close as you can to the sill, and then gingerly work your way through it. It’s dirty and undignified");
			if (pc.buttRating() > 6) output(" - particularly when your [pc.butt] gets stuck - ");
			output(" but eventually you manage to get through, pooling onto a broad set of shelves you can clamber down. Although to your ears you made a hell of a racket getting in, it doesn’t seem to have alerted anyone. Score one for lateral thinking!");

			clearMenu();
			addButton(0, "Next", fazianQuestWarehouseBack);
		}
	}
	
	processTime(5);
}

public function fazianQuestApproachBribe():void
{
	clearOutput();
	showBust("MYR_RED_GUARD");
	showName("RED\nMYR");
	author("Nonesuch");

	output("How much?");

	clearMenu();
	addButton(0, "500c", fazianQuestBribeGo, 500, "500 Credits", "Try and bribe the woman to let you in.");
	
	if (pc.credits >= 1000) addButton(1, "1000c", fazianQuestBribeGo, 1000, "1000 Credits", "Try and bribe the woman to let you in.");
	else addDisabledButton(1, "1000c", "1000 Credits", "You don’t have enough credits.");

	if (pc.credits >= 3000) addButton(2, "3000c", fazianQuestBribeGo, 3000, "3000 Credits", "Try and bribe the woman to let you in.");
	else addDisabledButton(2, "3000c", "3000 Credits", "You don’t have enough credits.");
}

public function fazianQuestBribeGo(amt:int):void
{
	clearOutput();
	showBust("MYR_RED_GUARD");
	showName("RED\nMYR");
	author("Nonesuch");

	output("<i>“Must be pretty thirsty work, guarding a door,”</i> you suggest. <i>“Unrewarding, too.”</i>");
	
	output("\n\n<i>“I don’t see why that would be any of your concern,”</i> the guard deadpans.");
	
	output("\n\n<i>“It isn’t,”</i> you agree. You tap up a credit chit and push it into the lapel of her coat. <i>“But maybe you could go address those personal concerns someplace else? Just for a bit.”</i>");

	if (amt == 500)
	{
		pc.credits -= 500;

		output("\n\nThe guard retrieves the credit chit, and regards it and then you with silent contempt.");
		
		output("\n\n<i>“You have a very low opinion of");
		if (pc.race().indexOf("red myr") != -1) output(" me, sister");
		else
		{
			output(" my race, ");
			if (pc.race().indexOf("gold myr") != -1) output(" goldie");
			else output(" starwalker");
		}
		output(",”</i> she says at last. <i>“Also of the kind of prices Kressia merchants charge reds. Now, if you don’t want me to turn this in and convict you of bribery, I suggest you fuck off.”</i>");
		
		output("\n\nDamn. You’re going to have to try something else.");
		flags["GUARD_BRIBE"] = 500;
		
		processTime(5);

		fazianQuestApproachMenu();
	}
	else if (amt == 1000)
	{
		pc.credits -= 1000;

		output("\n\nThe guard retrieves the credit chit, and regards it, then you, then the street behind you impassively for what seems like an age.");
		
		output("\n\n<i>“Ten minutes,”</i> she says at last. <i>“I have no idea who you are or how you got in.”</i> She pockets the chit and hurries off.");
		
		output("\n\nYou breathe out and then, when you’re sure she hasn’t gone off just to get a patrol, you sidle through the gate.");

		processTime(8);
		
		clearMenu();
		addButton(0, "Next", fazianQuestWarehouseFront);
	}
	else if (amt == 3000)
	{
		pc.credits -= 3000;

		output("\n\nThe guard retrieves the credit chit and regards it with a slight frown. She looks at you and then at the street behind you, lips moving silently as if working something out.");
		
		output("\n\n<i>“Well, to hell with this job, and to hell with this world,”</i> she says at last. <i>“I’m going to go tell the captain what I think of her, and then I’m going to buy my way to the sky. Thanks,");
		if (pc.race().indexOf("red myr") != -1) output(" sister");
		else if (pc.race().indexOf("gold myr") != -1) output(" goldie");
		else output(" starwalker");
		output("!”</i>");
		
		output("\n\nShe pockets the chit and hurries off.");
		
		output("\n\nYou suspect you overpaid a bit there. It’s had the effect you were looking for, at least. When you’re sure she really has gone, you sidle through the gate.");

		processTime(8);
		
		clearMenu();
		addButton(0, "Next", fazianQuestWarehouseFront);
	}
}

public function fazianQuestApproachFight():void
{
	clearOutput();
	showBust("MYR_RED_GUARD");
	showName("RED\nMYR");
	author("Nonesuch");

	output("The red myr looks completely taken aback when you suddenly draw your weapon and fly at her. <b>Maybe if you finish this quickly...</b>");

	processTime(2);
	
	var tEnemy:RedMyrFrontGuard = new RedMyrFrontGuard();
	if (flags["GUARD_BRIBE"] != undefined) tEnemy.credits += flags["GUARD_BRIBE"];

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(fazianQuestOutdoorGuardVictory);
	CombatManager.lossScene(fazianQuestOutdoorGuardLoss);
	CombatManager.lossCondition(CombatManager.ESCAPE, 2);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.displayLocation("WAREHOUSE\nGUARD");

	clearMenu();
	addButton(0, "Next", CombatManager.beginCombat);
}

public function fazianQuestOutdoorGuardLoss():void
{
	author("Nonesuch");
	
	output("You can try fighting the entire red myr garrison, in which case your bullet-riddled corpse will fall to the ground in short order. You can try surrendering and arguing your case that another starwalker is being held in the warehouse, and you were just trying to rescue them. This will fall on unfavorable ears, both on the red myr and the U.G.C.’s side, given you assaulted a soldier in occupied territory during a fragile ceasefire. It will be many years before Steele Corp manage to wrangle a release for you from Kressia’s military prison. Whichever the case, your adventure is over.");
	
	CombatManager.genericLoss();
	
	processTime(5);

	badEnd("GAME OVER");
}

public function fazianQuestOutdoorGuardVictory():void
{
	author("Nonesuch");
	
	if (enemy.HP() <= 0)
	{
		output("An iron whistle clatters into the dust as the red myr crumples to the ground, unconscious. You shoot a nervous look over both shoulders. Fortune is still with you; in this quiet corner of Kressia, nobody seems to have seen your assault. Or if they have, they’re gold, and quietly approve. Quickly you grab hold of the guard and drag her, limbs dangling, behind the warehouse and into the cover of some crates.");
	}
	else
	{
		output("An iron whistle clatters into the dust as the red myr’s eyes cloud, her mouth hanging open.");
		
		output("\n\n<i>“G-goddess,”</i> she groans, clutching herself between the legs. <i>“Stop! Alright, I’ll let you in if - can we go around the back - ?”</i>");
		
		output("\n\n<i>“Nope,”</i> you reply, picking up her rifle and stunning her with a smart blow to the temple. You shoot a nervous look over both shoulders. Fortune is still with you; in this quiet corner of Kressia, nobody seems to have seen your assault. Or if they have, they’re gold, and quietly approve.");
		
		output("\n\nQuickly you grab hold of the guard and drag her, limbs dangling, behind the warehouse and into the cover of some crates.");
	}

	output("\n\nBrushing yourself down, you head back to the front gate and sidle inside.");

	CombatManager.genericVictory();

	processTime(5);
	
	clearMenu();
	addButton(0, "Next", fazianQuestWarehouseFront);
}

public function fazianQuestApproachLeave():void
{
	moveTo("817");
	showLocationName();
	
	/*
	clearOutput();
	showBust("REDMYR");
	*/

	//mainGameMenu();
	fazianQuestApproachMenu();
}

public function fazianQuestWarehouseFront():void
{
	clearOutput();
	clearBust();
	author("Nonesuch");
	
	moveTo("FAZIAN_RESCUE_ROOM");
	showName("WAREHOUSE:\nENTRANCE HALL");
	
	output("You are standing in a broad, well-lit entrance hall. There is a hubbub coming from the room opposite; the sound of many people moving around and... clapping? Peering carefully into the ajar door to your left you can see half a dozen red myr in military uniform sat around a table, playing some sort of game involving small crystals and counters. You are easily able to sneak past them, and open the door to the main chamber.");
	
	processTime(3);
	
	clearMenu();
	addButton(0, "Next", fazianQuestWarehouseMainChamber);

}

public function fazianQuestWarehouseBack():void
{
	clearOutput();
	clearBust();
	author("Nonesuch");
	
	moveTo("FAZIAN_RESCUE_ROOM");
	showName("WAREHOUSE:\nSTOREROOM");
	
	output("You are standing in a dim storeroom. Dusty industrial gear crowd the shelves. It’s obvious no-one’s used this room in a while.");
	
	output("\n\nYou gingerly open the door opposite the back entrance, and find yourself in a brightly lit corridor. There is a hubbub coming from the room at the far end; the sound of many people moving around and... clapping? You quickly head down the corridor and open the door to the main chamber.");

	processTime(3);
	
	clearMenu();
	addButton(0, "Next", fazianQuestWarehouseMainChamber);
}

public function fazianQuestWarehouseMainChamber():void
{
	clearOutput();
	clearBust();
	author("Nonesuch");
	
	moveTo("FAZIAN_RESCUE_ROOM");
	showLocationName();

	output("You are standing in a massive, echoing, concrete-floored space. Most of it is taken up by a seven foot deep depression in the middle, around which maybe a dozen red myr are stationed. It is filled, almost shoulder-to-shoulder, with female gold myr. There must be hundreds, maybe thousands, in it. They all look drawn and rather dirty, dressed in thin prison smocks. Some lean on crutches; others are shaven bald. And yet, on virtually every face you can see down there, there is an expression of shared joy. They are all facing towards one end of the warehouse, where a small stage has been erected overlooking the pit. Before you can entirely discern what’s going on at that end, every single gold myr in the room raises her hands and claps in time, making the room shake and your ears ring.");
	
	output("\n\n<i>“QUARAMARTA!”</i> they yell. On the stage, the bare-chested Fazian comes to a juddering halt. He looks utterly exhausted, feathers askew, soaked in sweat. Still, he raises his arms in acknowledgement to the thunderous applause which comes his way.");
	
	output("\n\n<i>“This way, sweet maidens,”</i> says a smooth voice, close enough to be discernable beneath the clamor. You turn to see thin androgynes with moth-like antennae neck-ruffs, dressed in sleek, modern, purple armor, gracefully picking happily dazed gold myr out of the crowd near you and leading them towards a door behind the stage. <i>“Where you are going, there are plenty more like him. No honeysweet, do not worry about your injuries. The tarratch shall see to them. We shall fix you, and take you somewhere better...”</i>");
	
	CodexManager.unlockEntry("Tarratch");
	
	output("\n\n<i>“Per [pc.name]?”</i> says Fazian hoarsely, catching sight of you. Most of the room turns to you.");
	
	output("\n\n<i>“What,”</i> snarls a husky voice, <i>“do you think you’re doing here?”</i> A tall, thin red myr, a crimson eye-patch slung across her face, marches over to you. By the number of medals on her jacket and the look of fury on her face, you’re guessing she’s the one in charge here.");

	processTime(8);
	
	// [Rescue.] [Hands up]
	clearMenu();
	addButton(0, "Rescue", fazianQuestDoRescue, undefined, "Rescue", "You’re here to rescue Fazian. And anyone else that is in need of it.");
	addButton(1, "Hands Up", fazianQuestHandsUp, undefined, "Hands Up!", "You are the space police! This is a bust!");
}

public function fazianQuestDoRescue():void
{
	clearOutput();

	output("<i>“I intend to leave here with that anat,”</i> you say levelly. <i>“And I want to know what exactly is going on here.”</i> The commander snorts.");
	
	output("\n\n<i>“Rescue him? He came here of his own free will, to perform exclusively for the poor PoWs in our care. Isn’t that right, Fazian?”</i>");

	processTime(2);
	
	fazianQuestChamberMerge();
}

public function fazianQuestHandsUp():void
{
	clearOutput();
	
	output("<i>“I am here on the authority of the U.G.C.,”</i> you say with all the conviction you muster, <i>“to apprehend the kidnappers of a free citizen of the outer galaxy. I suggest you get your hands in the air.”</i> Several of the red myr guards nearby look at each other and lower their weapons uncertainly. The commander, however, just snorts.");
	
	output("\n\n<i>“No warrant, no uniform, no squad of fur-things armed with death-torches,”</i> she says to her fellows. <i>“No correct information, either. We didn’t kidnap him. He came of his own free will, to perform exclusively for the poor PoWs in our care. Isn’t that right, Fazian?”</i>");

	processTime(3);
	
	fazianQuestChamberMerge();
}

public function fazianQuestChamberMerge():void
{
	author("Nonesuch");
	showBust("EHSTRAFFE");
	
	output("\n\n<i>“Major Ehstraffe, I--”</i> stammers Fazian. Ehstraffe claps once sternly.");
	
	output("\n\n<i>“Dance! You know what happens if you do not.”</i> The anat heaves outwards - and then begins to tap out a steady rhythm on the boards with his hind talons. Slowly the gold myr’s attention turns back to him.");
	
	output("\n\n<i>“So...”</i> you say slowly to the major. <i>“You’re forcing a civilian to perform for the PoWs in your care to keep them sedated? Whilst you’re selling them off to alien slave traders.”</i> The group of purple-armored, pale-skinned androgynes are stood quite still, watching you inscrutably with their black, pupil-less eyes, ruffs fluttering.");
	
	output("\n\n<i>“You think this is easy?”</i> replies Ehstraffe slowly, staring at you with her one good eye. <i>“You think looking after tens of thousands of prisoners who despise you, with the lowest amount of food and personnel allotted in the entire Federation because </i>fuck<i> looking after gold soldiers before anyone else, is easy? To a starwalker who decided to edotto in here in order to be a fucking hero, I suppose it would. You didn’t have to preside over a prison riot every week for two months. You didn’t have to start making decisions in order to stop anyone else dying.”</i> She snaps a chitin-gloved hand at the crowded pit.");
	
	output("\n\n<i>“Former peasants, factory workers, mostly. Their land belongs to the Federation now. Their queens cannot support them, do not want them. Nothing remains for them here. The tarratch offered to buy them for supplies we can use immediately to keep the rest fed and secure, and more besides. It is the best solution. But no, I would not expect a starwalker like you to understand having to make such decisions.”</i> Her face is as red as her chitin. <i>“Not you, who quarter with the golds and lap up their tragedies, their poisonous tales about us. Not you, who send your artists and your money and your men and your science to their capital and spurn us, us, the conquerors, the barbarians.”</i> She slaps her eye-patch furiously. <i>“Where is MY mechanical eye? What happened to MY Lehnaza in the trenches?”</i>");

	processTime(5);
	
	clearMenu();
	addButton(0, "Next", fazianQuestChamberMergeII);
}

public function fazianQuestChamberMergeII():void
{
	clearOutput();
	showBust("EHSTRAFFE","TARRATCH");
	author("Nonesuch");

	output("Ehstraffe takes a deep breath, almost visibly packaging herself back up behind a controlled, authoritative facade, before speaking again.");
	
	output("\n\n<i>“The masked dancer stays.”</i>");
	
	output("\n\n<i>“Excuse me,”</i> says a voice as smooth as oil on water. The tarratch who has strolled over smiles at you with a stall-owner’s geniality, hand in his (her?) pocket. <i>“I think perhaps there has been a misunderstanding. Which I am sure our friend here, having listened to the good major’s explanation, is perfectly willing to resolve, starwalker to starwalker. I think what [pc.heShe] is looking for is a... let’s call it a finder’s fee. For the anat male. And [pc.hisHer] discretion in this matter, in perpetuity.”</i>");
	
	output("\n\nShe (he?) snaps off the credit chit in his (her?) hand and proffers it you. Behind the pale androgyne, you can see Fazian, dancing and whirling away. He stares at you helplessly.");

	processTime(5);
	
	// [Take it] [Don't]
	clearMenu();
	addButton(0, "Take It", fazianQuestGetBribed, undefined, "Take It", "20,000 credits. Not insubstantial.");
	addButton(1, "Don’t", fazianQuestDontGetBribed, undefined, "Don’t", "Refuse his (her?) bribe.");
}

public function fazianQuestGetBribed():void
{
	clearOutput();
	showBust("TARRATCH","EHSTRAFFE");
	author("Nonesuch");

	output("<i>“No!”</i> says Fazian hoarsely, as you take the check. You think. It’s lost under the movement of the crowd.");
	
	output("\n\n<i>“You’re just going to let [pc.himHer] walk out of here?”</i> queries Ehstraffe reluctantly. <i>“I don’t think--”</i>");
	
	output("\n\n<i>“Please, major!”</i> says the tarratch, smiling the cold, bright beam of a neutron star. <i>“By taking this payment " + pc.mf("Mr.","Ms.") + " Steele has shown themselves to be a reasonable, rational individual. Rational individuals can be trusted. Business can be done with rational individuals.”</i> She (he?) claps you on the shoulder and leads you to the front door. <i>“And I very much hope to do business with you again in the future, Steele, earn some of those credits back. Our brothers and sisters offer the finest indentured servants in the galaxy, exactly because of rational individuals like yourself. Just don’t go chasing after every lost lamb you hear about on the frontier in future, okay? There’s a good rue collar.”</i>");
	
	output("\n\nThe door clicks shut behind you, and two red myr lead you out onto the road.");
	
	output("\n\nWell, Hepane did say she couldn’t reward you, didn’t she? So you’re 20,000 credits up. You probably shouldn’t go back to her, though. You suspect a rational argument of your actions might not wash with her.");

	processTime(5);
	
	pc.credits += 20000;
	pc.addHard(6);
	flags["FAZIAN_QUEST_STATE"] = FAZIAN_QUEST_BRIBED;
	
	clearMenu();
	addButton(0, "Next", move, "817");
}

public function fazianQuestDontGetBribed():void
{
	clearOutput();
	showBust("TARRATCH","EHSTRAFFE");
	author("Nonesuch");

	output("You knock the chit out of his (her?) hand and [pc.readyWeapon].");
	
	output("\n\n<i>“I’m breaking up this sick little operation,”</i> you growl. <i>“Fazian is coming with me. And then we’ll see exactly what the U.G.C. and your superiors have to say about what’s going on here.”</i>");
	
	output("\n\n<i>“You aren’t just going to let this happen, are you?”</i> snaps Ehstraffe.");
	
	output("\n\n<i>“WE are not armed,”</i> replies the tarratch pointedly, brushing her (his?) thin hands and stepping back. <i>“We can discuss disposal once you’ve brought this moron to heel.”</i>");
	
	output("\n\n<i>“Grab [pc.himHer]!”</i> orders Ehstraffe. Ten armed, stern-faced red myr hurry across.");
	output("\n\n<b>Looks like you’ve got a hell of a fight on your hands.</b>");

	processTime(5);
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(fazianQuestEhstraffeVictory);
	CombatManager.lossScene(fazianQuestEhstraffeLoss);
	CombatManager.setHostileActors([new Ehstraffe(), new RedMyrGuard(), new RedMyrGuard(), new RedMyrGuard()]);
	CombatManager.displayLocation("EHSTRAFFES\nDETAIL");
	CombatManager.encounterText("You are fighting <b>Ehstraffe’s detail</b>: Fully a dozen trained, chitin-armored red myr soldier women, all dressed in Federation standard trench-coats and berets, armed with semi-automatic slug-launchers and axes. Fortunately, you do not have to fight them all at once; a couple of them are keeping watch on the prisoners, and as long as you keep moving in close to at least one of them, the others cannot simply stand back and riddle you with bullets. Still, against their crude but effective machine guns, their heavy, well-aimed blows and the saliva they keep trying to forcibly introduce you to, you aren’t going to last forever against all of them.")
	CombatManager.victoryCondition(CombatManager.SURVIVE_WAVES, 4);

	clearMenu();
	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function fazianQuestEhstraffeLoss():void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	showBust("EHSTRAFFE","MYR_RED_GUARD_MASK","MYR_RED_GUARD_MASK","MYR_RED_GUARD_MASK");
	author("Nonesuch");
	
	output("You collapse, hands smacking onto the concrete. When you desperately try and rise again the red myr smother you, surrounding you in the brisk smell of their coat fabric as they lock your limbs in their strong grip, latching their lips onto your bare [pc.skin] in a dozen places. You shudder and writhe as the aphrodisiac surges into your veins, heat blossoming under your skin,");
	if (pc.hasCock()) output(" [pc.eachCock] becoming hopelessly erect");
	if (pc.isHerm()) output(" and");
	if (pc.hasVagina()) output(" [pc.eachVagina] needily dribbling eager arousal");
	if (pc.hasGenitals()) output(",");
	output(" incapacitated with lust.");
	
	var i:int = 0;
	for(i = 0; i < 8 ; i++) { imbibeVenomEffects(); }
	
	if (pc.isFeminine())
	{
		output("\n\n<i>“You eight, get the golds and the dancer under control,”</i> orders someone, somewhere. You try hard to care, but it’s impossible; there’s only the aphrodisiac glow, and the fact nobody is seeing to the heat between your [pc.hips]. You groan woozily, and someone strokes your chin kindly.");
		
		output("\n\n<i>“So, we can offload her to you as well... ?”</i> the husky voice goes on.");
		
		output("\n\n<i>“A pretty, feisty rue collar like her?”</i> says a smooth voice. <i>“Won’t be a problem. We will be taking, not buying, though. The latest shipment of gold, too. This was your security lapse, and we are cleaning it up. If you want our continued support and discretion...”</i>");
		
		output("\n\n<i>“Of course,”</i> Ehstraffe agrees hurriedly. You are hauled to your feet and presented to the thin, pale-faced alien. He (she?) gazes into your eyes touches your chin again thoughtfully, diaphanous ruff trembling. Right now, as much as you want to curse and spit at them, any tender touch at all is sending a thrill into your core");
		if (pc.hasGenitals()) output(", making");
		if (pc.hasVagina()) output(" your pussy clench up");
		if (pc.isHerm()) output(" and");
		if (pc.hasCock()) output(" your erection twitch eagerly");
		output(".");
		
		output("\n\n<i>“Some of that venom of yours would be helpful,”</i> she (he?) says. <i>“And I’d get that dancer of yours hooked up onto it, as well. Far too restive for anyone’s good.”</i>");
		
		output("\n\n<i>“I - we didn’t want to. But given what happened... yes. You’re right.”</i>");
		
		output("\n\n<i>“Come,”</i> directs the tarratch brusquely. You are led stumbling past the stage and a knocked out Fazian into a dully lit back area, populated by naked gold myr. They all look happily stoned, honey-swollen boobs gently bobbing. Tarratch slavers weave between them, their eerie, hypnotic ruffs fluttering and buzzing, bending over each so that they can fasten... something clicks into place around your neck. You touch the cold circle of metal... and then squeal as fresh arousal suddenly buzzes into you");
		if (pc.hasVagina()) output(", [pc.eachVagina] seizing up and gushing [pc.femcum] down your [pc.hips]");
		else if (pc.hasCock()) output(", [pc.eachCock] bulging up, building towards an unstoppable orgasm... and then agonizingly climbing down again, leaving you even more helplessly aroused than before");
		output(".");
		
		output("\n\n<i>“I wonder how much we should sell you for,”</i> the tarratch leader smirks, teasing the collar control in his (her?) hand. <i>“I’m thinking... 20,000 credits.”</i>");
		
		processTime(15);
		
		pc.removeAll();
		pc.createStatusEffect("Psi Slave Collar", 0.5, 0.5, 200, 0, false, "Radio", "This metal collar limits your intelligence capacity and willpower while worn, making you completely subservient to the will of the one who operates it.", false, 0, 0xFF0000);
		pc.changeLust(75);
		
		clearMenu();
		addButton(0, "Next", function():void {
			clearOutput();
			showBust("");
			showName("CINDI\nLUVSCOCK");
			author("Nonesuch");
			
			moveTo("GAME OVER");
			
			output("Once they have smuggled you off Myrellion, under the effects of various cocktails of brainwashing drugs and electrotherapy, the skilful insectile slavers extract the details of your identity and bank account. They proceed to wipe both clean, liquidate your assets and provide you with a new identity: Cindi Luvscock. This obviously costs money, which Cindi begins the long, slow process of paying back by working a glory hole on one of the frontier’s sleazier space stations.");
			
			output("\n\nOnce sufficiently trained at servicing even the biggest, most outlandishly shaped dick, the tarratch sell you to an ausar pirate warlord operating on the fringes of known space. He disdains drugs in favor of using your ever-present collar - as well as his almost limitless libido, creative sadism and three, fourteen-inch, knotted wolf cocks - to mold you into his perfect slave. Your contract stipulates that you yourself will work off the cost of any modification made to you, so your owner is sure to shift your body around whenever the whim takes him - six extra months of servitude for the cunt nipples, another year for the long, dextrous, extra-sensitive tongue, five more years for the special gastro-implants that allow you to live entirely off sexual fluids... sheer curiosity eventually causes him to work out your former identity, which only increases his appetite for using you. Where you’re concerned though, the name of [pc.name] Steele becomes a strange, unimportant memory in the extremely vigorous, cum-soaked life of Cindi Luvscock.");
			
			days += 50 + rand (21);
			hours += rand (24);
			processTime(rand(60));
			
			var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
			if (pp.cocks.length < 1) pp.createCock();
			if (pp.cocks.length < 2) pp.createCock();
			if (pp.cocks.length < 3) pp.createCock();
			for(i = 0; i < pp.cocks.length ; i++)
			{
				pp.shiftCock(i, GLOBAL.TYPE_CANINE);
				pp.cocks[i].cLengthRaw = 14;
			}
			
			pc.credits = -1 * (856000 + rand(985));
			pc.short = "Cindi";
			pc.tongueType = GLOBAL.TYPE_DRACONIC;
			pc.tongueFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_SMOOTH, GLOBAL.FLAG_PREHENSILE];
			for(i = 0; i < pc.breastRows.length ; i++) { pc.breastRows[i].nippleType == GLOBAL.NIPPLE_TYPE_FUCKABLE; }
			if (pc.hasVagina())
			{
				for(i = 0; i < pc.vaginas.length ; i++) { pc.cuntChange(i, pp.cockVolume(0), false); }
				for(i = 0; i < pc.vaginas.length ; i++) { pc.cuntChange(i, pp.cockVolume(1), false); }
				for(i = 0; i < pc.vaginas.length ; i++) { pc.cuntChange(i, pp.cockVolume(2), false); }
			}
			pc.buttChange(pp.cockVolume(0), false);
			pc.buttChange(pp.cockVolume(1), false);
			pc.buttChange(pp.cockVolume(2), false);
			
			CombatManager.genericLoss();
			
			badEnd("GAME OVER");
		});
	}
	else
	{
		output("\n\n<i>“You eight, get the golds and the dancer under control,”</i> orders someone, somewhere. You try hard to care, but it’s impossible; there’s only the aphrodisiac glow, and the fact nobody is seeing to the heat between your [pc.hips]. You groan woozily, and someone strokes your chin kindly.");
		output("\n\n<i>“So, we can offload him to you as well... ?”</i> the husky voice goes on.");
		
		output("\n\n<i>“I know this is hard for you to grasp,”</i> says a smooth voice, <i>“but "+ pc.rawmf("men", "manly women") +" are more difficult for us to sell. Much more specialist market, outside this planet.”</i> You are hauled to your feet and presented to the thin, pale-faced alien. He (she?) touches your chin again thoughtfully, diaphanous ruff trembling. Right now, as much as you want to curse and spit at them, any tender touch at all is sending a thrill into your core");
		if (pc.hasGenitals()) output(", making");
		if (pc.hasVagina()) output(" your [pc.pussies] clench up");
		if (pc.isHerm()) output(" and");
		if (pc.hasCock()) output(" your erection" + (pc.cockTotal() != 1 ? "s" : "") + " twitch eagerly");
		output(".");
		
		output("\n\n<i>“So you aren’t going to help us with him,”</i> says Ehstraffe coldly.");
		
		output("\n\n<i>“What a </i>tragedy<i> for you to endure, major,”</i> smirks the tarratch. <i>“What </i>possible <i> use could you put him to around here, I wonder? This venom of yours, that I am interested in. We’ll talk later. For now, put him somewhere out of the way. Hook the dancer up, too. Far too restive for anyone’s good.”</i>");
		
		output("\n\nEhstraffe gestures at the two red myr holding you, and they drag you away, past an unconscious Fazian, to a reasonably sized room with a bed. You struggle to form cogent thoughts through the fog of arousal, the all-conquering need in your [pc.groin]. Do these two have to be holding you as tightly as they are? Do their chitinous hands really have to be drifting across your [pc.chest]...? The door clicks shut, and immediately one of them shoves you onto the bed");
		if (!pc.isNude()) output(" and begins briskly tearing your garments off");
		output(".");
		
		output("\n\n<i>“You fight good, brave starwalker,”</i> she says, yanking her combat trousers down, exposing her full, muscular thighs and pinning you underneath her. She pauses only to kiss you fiercely. You groan as your tongues meet and fresh arousal surges into your bloodstream. <i>“Which means you fuck good, too. I’m not missing this chance - Ehstraffe’s a greedy sow who’ll have you all to herself.”</i> Talking done, she");
		if (pc.hasCock())
		{
			output(" sinks the hot, slick cling of her pussy down on your helplessly erect [pc.cockNoun] and begins to urgently thrust her athletic frame into you, holding you down by the shoulders.");
			pc.cockChange();
		}
		else output(" latches her hip firmly around yours, molds her hot, slick pussy into your " + (pc.hasVagina() ? "[pc.vagina]" : "[pc.crotch]") + " and begins to urgently thrust her athletic frame into you, holding you down by the shoulders.");
		
		output("\n\n<i>“Be quick,”</i> says the other, keeping watch at the door. <i>“I want a turn with that, too.”</i>");

		processTime(15);
		
		clearMenu();
		addButton(0, "Next", function():void {
			clearOutput();
			showName("VENOM\nSLUT");
			showBust("EHSTRAFFE","FAZIAN");
			author("Nonesuch");
			
			moveTo("GAME OVER");
			
			output("Days, weeks pass by in a venom-induced haze. You eventually come to welcome the burn of it entering your veins; the peace, tranquillity and all-conquering arousal it brings. It focuses you wonderfully for your sole occupation - being one of two primary sources of stress relief for a whole base of healthy, overworked, uptight red myr. Sure, Major Ehstraffe does make use of you a lot, bordering on the sadistic - keeping you locked for hours beneath her desk and between her thighs. But she quickly sees the benefits of sharing you around.");
			
			output("\n\nOnce as hopelessly addicted to red myr saliva as you are, Fazian comes to accept his new role in life, too. As he points out philosophically, the two of you <i>are</i> making a lot of ordinary people happy with your presence, and it’s not exactly a suffering to");
			if (pc.hasCock()) output(" plough dripping myr cunt with [pc.eachCock] all day along");
			else output(" send myr into paroxysms of ecstasy with your fingers and [pc.tongue] all day long");
			output(". He eventually teaches you to be as good a dancer as he is, and you perform with him most nights to a constantly changing but always delirious gold myr audience. If she’s in a good mood, Ehstraffe sometimes lends you to well-behaved groups of golds as well. In either case, some of the orgies you have after particularly well-received performances are spectacular.");
			
			output("\n\nYour mission is over, but hey, if the goal was to slay as much pussy as possible, mission accomplished.");
			
			days += 32 + rand (8);
			hours += rand (24);
			processTime(rand(60));
			
			for(i = 0; i < 8 ; i++) { imbibeVenomEffects(); }
			myrAddiction(100);
			
			CombatManager.genericLoss();
			
			badEnd("GAME OVER");
		});
	}
}

public function fazianQuestEhstraffeVictory():void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	showBust("GOLDMYR","GOLDMYR","GOLDMYR");
	showName("VICTORY:\nEHSTRAFFE");
	author("Nonesuch");
	
	output("One moment you are desperately fending off a clutch of armed guards - the next they are overwhelmed in a tidal wave of furious gold myr prisoners, who kick, bite and trample them to the ground. The red myr desperately fight back, more soldiers hurry in from the front to help, but they are hopelessly outnumbered.");
	
	output("\n\nYou bundle your way through the crowd, many of whom are now surging through the exits, battling your way towards the stage. You can hear Ehstraffe screaming out orders from somewhere - there’s no sign of the tarratch... your hands touch wood and you clamber up onto the stage, just in time to see a gold myr pick a groggy Fazian up by the shoulder.");
	
	output("\n\n<i>“Through the back,”</i> she says. She’s missing an arm but looks exultant, a Federation beret skewed across her crown. Together you half carry, half lead the anat dancer out of the main warehouse and through the back entrance. Gold myr are streaming out of the main gateway in all directions, fighting red myr, being tackled to the ground, or simply running into Kressia or towards No Myr’s Land as fast as they possibly can. Keeping in the back alleys and close to the cavern wall, you limp northwards with Fazian and the gold myr. A siren wails over the sounds of the riot, followed by the crackle of open fire. Nobody stops you, though. Presumably to the red myr soldiers you glimpse charging past, your group looks like an alien who has been caught in the crossfire, his friend, and a helpful, Federation-affiliated local.");
	
	output("\n\n<i>“They’ll recapture most of us before the night is out,”</i> says the gold myr, as you finally stop in a quiet street some distance north. She trails the fingers of her sole left hand down Fazian’s back and then squeezes your palm with a thin smile. <i>“Most of us. Make it count, starwalker.”</i> The last you see of her is her abdomen, disappearing around another corner. After you’ve rested a little while, you and Fazian continue to head northwards towards the airfield. You both silently listen to the fading sounds of violence behind you.");
	
	clearMenu();
	addButton(0, "Next", fazianQuestEhstraffeVictoryII);
}

public function fazianQuestEhstraffeVictoryII():void
{
	clearOutput();
	showFazian();

	output("<i>“Do you know what Quaramarta means?”</i> he says, after a bit. <i>“It roughly translates as ‘All Four Hands’. It’s an old tribal song which appears in a great many gold myr traditions. It’s supposed to mean: We are all the same. We can set differences aside in the end, because we are all thinking people with the same hopes and needs. I was performing that... to them.”</i> He brings up his claws and stares at them with his pale blue eyes. You can see them trembling. <i>“To keep them there, I performed that to them.”</i>");
	
	output("\n\nYou stop at the intersection leading to the airfield.");
	
	output("\n\n<i>“I will not let them bury this, [pc.name],”</i> he says, the same quiet tremble in his voice. <i>“Not just the Federation - it will be better for Xenogen if none of this comes to light. Allowing slavers onto the planet... the threat to the ceasefire... but this is my fight now. I will take it to the U.G.C., the empire itself if they will not listen. Such atrocities cannot be allowed to continue because it’s tidier if some people simply don’t exist.”</i> He takes your hand in his claws. <i>“To you, I owe a life debt. I cannot offer you anything but a promise that if there is anything you need that is in my power to give, you will have it. But you know, I do not worry that I have no money to give you. You have already shown you care about much more valuable things than that.”</i>");
	
	output("\n\nHe squeezes your hand, and hurries eastwards towards the planes.\n\n");

	CombatManager.genericVictory();
	userInterface.mainButtonsReset();
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	moveTo("805");
	processTime(120+rand(15));
	pc.addNice(5);
	flags["FAZIAN_QUEST_STATE"] = FAZIAN_QUEST_COMPLETE;
	flags["FAZIAN_QUEST_RESCUE_TIMER"] = GetGameTimestamp();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fazianQuestCompleteBlurbs():void
{
	clearOutput();
	showHepane();

	output("When Hepane sees you coming, she immediately puts down her clipboard and hurries across to give you a four-armed embrace.");
	
	if (flags["MET_HEPANE"] <= 1)
	{
		output("\n\n<i>“Thank you so much for what you did,”</i> she says, her fair-sized bosom pressed into your [pc.chest]. Her high voice is rather choked. <i>“I couldn’t sleep after I sent you to Kressia. I kept thinking that I’d sent one of my guests to face danger I wouldn’t have - for nothing at all. Fazian told me about what was going on in that place, and - you are brave and selfless beyond words, starwalker. I hope one day my people and the reds can join you above the sky, so we too can learn the lessons of nobility your race clearly have.”</i>");
		
		output("\n\n<i>“...the shows are back on, right?”</i> you say after a moment, slightly embarrassedly. The gold myr smiles toothily.");
		
		flags["MET_HEPANE"] = 2;
		
		processTime(10);
	}
	else
	{
		output("\n\n<i>“Hello again! I’m so happy you’ve come,”</i> she says, her fair-sized bosom pressed into your [pc.chest].");
		
		output("\n\nAfter a moment, you ask her if there is a show playing soon. The gold myr smiles toothily.");
		
		processTime(3);
	}

	output("\n\n<i>“Yes! Free entry for you, of course. What do you say to relaxing to a performance of");
	if (days % 3 == 0) output(" Quaramarta");
	else if (days % 3 == 1) output(" As You Shrike It");
	else output(" Paradise");
	output("?”</i>");

	//No charge from use of [Show] from then on
	clearMenu();
	addButton(0, "Show", goFreeNozzleShow);
	addButton(14, "Back", mainGameMenu);
}

public function goFreeNozzleShow():void
{
	clearOutput();
	showHepane();

	if (flags["NOZZLE_SHOW_PARADISE"] == undefined || flags["NOZZLE_SHOW_SHRIKE"] == undefined || flags["NOZZLE_SHOW_QUARAMARTA"] == undefined)
	{
		output("Why not? You came in here to enjoy yourself, after all.");
		output("\n\n<i>“Go through and take a seat wherever you like.”</i>");
	}
	else
	{
		output("You never turn down a chance to see the myr and anat perform.");
		
		output("\n\n<i>“Our favourite patron,”</i> beams Hepane. <i>“Where you like to sit is still free, if you get in there quick.”</i>");
		
		output("\n\nYou duck under the curtain into a small, crimson-decorated, sparsely-lit theatre, furnished with round tables and a wooden stage at one end. It’s thronged with people; mostly gold myr, the air dense with their high, twittering voices and sweet smell, but you spot a smattering of other off-worlders here as well. You find yourself a seat near the front and make yourself comfortable. A few moments later, the lamps and conversation dip, and the stage lights come on.");
	}
	
	processTime(3);

	clearMenu();
	addButton(0, "Next", nozzleGoPerformance);
}

public function fazianMyrQuestComplete():void
{
	clearOutput();
	showFazian();

	output("<i>“What do you think about the myr now?”</i> you ask. <i>“Given what happened.”</i>");
	
	output("\n\nThe anat is silent for a long time, twirling his wine glass around and around.");
	
	output("\n\n<i>“I have learnt that it is wrong to assume whole races cannot be motivated by hatred, based purely on their gender,”</i> he says at last. <i>“By doing that, I was simply practicing a different form of racism against the myr. That was a hard lesson to learn - something positive I had always believed, disproven - and maybe I would never have learned it if Ehstraffe had not lured me into that horrible place.”</i> He closes his eyes and curls his claws when he says the name.");
	
	output("\n\n<i>“You still perform for them, though?”</i> you say.");
	
	output("\n\n<i>“Yes. The red myr too, if they asked, and the offer was genuine. It is wrong to take away from the masses because of an individual’s crimes. I am just... more cautious now.”</i> He sighs wearily. <i>“It is so difficult to live in a world with shades of gray, y’know? I long to be that poor fool who </i>knew<i> all ant women meant well again.”</i>");
	
	output("\n\n<i>“You told the authorities about what was going on there?”</i> Fazian’s blue eyes turn flinty.");
	
	output("\n\n<i>“Yes. I have filed a report with the U.G.C. I have told the Nehzara woman at the port everything, and in no uncertain terms told her what I think of inveiglement, slavery and ethnic cleansing. I have attended an audience with the gold queens, and told </i>them<i> in no uncertain terms what I think of their negligence towards their subjects under foreign rule. No, none of them are happy, but I will not have them ignore me. I will not have them ignore </i>them.<i> Part of everything I earn here now goes towards helping the gold myr PoWs - as soon as I can work out a safe way of providing it to them. This is my fight, now.”</i> He shakes his head, feathers rustling and laughs slightly.");
	
	output("\n\n<i>“I have even updated the anatae administrata about my whereabouts, and what is happening here. They are equally unhappy about my having spent so much time here... but ironically if anything ever </i>did<i> happen to me now they’d be delighted, because it would mean they could come down like a ton of prefabs on Xenogen and the kui-tan.”</i> He finishes his wine and gazes at you, merry, mischievous glint in his eye. <i>“I am more cautious now, per.”</i>");

	processTime(6);
	
	fazianMenu(fazianMyr);
}