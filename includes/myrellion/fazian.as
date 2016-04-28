public function showHepane():void
{
	author("Nonesuch");
	showBust("HEPANE");
	showName("CABARET\nENTRANCE");
}

public function nozzleShowFirstTime():void
{
	clearOutput();
	showHepane();

	output("<i>“Hello!”</i> smiles the smartly-dressed myr when you approach her. <i>“Are you here for the cabaret? 160 credits entry.”</i>");

	flags["FAZIAN_SHOW"] = 1;
	
	output("\n\n<i>“What is it, exactly?”</i> you ask.");
	
	output("\n\n<i>“It’s great,”</i> says the myr, her professional smile breaking into an enthusiastic grin. <i>“I mean... I don’t know how it will compare to the things you’ve seen, starwalker,”</i> she amends. <i>“But Fazian is not of this world either, and our shows are very popular here. Tonight is... <i>“ she checks the clipboard in her hands.");

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

	clearMenu();
	if (pc.credits >= 160) addButton(0, "Pay", payForNozzleShow);
	else addDisabledButton(0, "Pay", "Pay", "You don't have enough credits.");
	addButton(1, "Don't", mainGameMenu);
}

public function nozzleShowRepeat():void
{
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

	clearMenu();
	if (pc.credits >= 160) addButton(0, "Pay", payForNozzleShow);
	else addDisabledButton(0, "Pay", "Pay", "You don't have enough credits.");
	addButton(1, "Don't", mainGameMenu);
}

public function hasSeenNozzleShow():Boolean
{
	return flags["NOZZLE_SHOW_PARADISE"] != undefined || flags["NOZZLE_SHOW_SHRIKE"] != undefined || flags["NOZZLE_SHOW_QUARAMARTA"] != undefined;
}

public function payForNozzleShow():void
{
	clearOutput();
	showHepane();

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

	clearMenu();
	addButton(0, "Next", nozzleGoPerformance);
}

public function nozzleGoPerformance():void
{
	if (days % 3 == 0) nozzlePerformanceQuaramarta();
	else if (days % 3 == 1) nozzlePerformanceShrike();
	else nozzlePerformanceParadise();
}

public function showFazianPerformance(n:String = null):void
{
	author("Nonesuch");
	showBust("FAZIAN");
	showName(n == null ? "\nFAZIAN" : n);
}

public function nozzlePerformanceParadise():void
{
	clearOutput();
	showFazianPerformance("\nPARADISE");

	output("Hepane is sat next to a vertically arranged instrument that looks like a combination of a hookah and an upturned piano. She picks out a throbbing bass rhythm on the round keys at the bottom; her other set of hands sit on the stem keys above, waiting. Her partner strides on.");
	
	output("\n\n");
	if (flags["NOZZLE_SHOW_PARADISE"] == undefined)
	{
		output("He’s an anat, immediately recognisable by his long, bone-mask face, his double-jointed legs and small, neat claws. His feather plumes are startling, though: rearing way out above his crown and elbows, they’re shades of aquamarine and magenta that continuously glitter and shift under the glare of the spotlights.");
	}
	else
	{
		output("Fazian the anat strides onto the stage; all rearing, flowing feathers, austere ivory and supple muscle.");
	}
	output(" He is dressed... it is not obvious how he is dressed. In each claw he has a vast, feathered fan, and he holds them so they obscure most of his lean, balletic frame.");
	
	output("\n\nHepane begins to press the upper keys of her instrument, adding piano-like notes to her sultry bass, deep but upbeat. Fazian is still for a moment longer - gazing out over the room, an impassive mask over lively, blue eyes - before beginning to stride across the stage, first with arch casualness and then sudden, dazzling whirls of movement. Because of the way he intersperses them with slinky, slow down-times, his pirouettes and leaps seem uncontrolled bursts of savagery and passion - except during them he wields his long, fluffy fans expertly, keeping most of his tight musculature behind a bright whip of color. Bare hints of dance-toned hips, butt and subtle abs are hurled out and then whipped back behind the festival-like shimmy of feathers.");
	
	output("\n\nIn keeping with the rest of the performance, the anat’s focus seems to shift, at times seemingly lost in his own whirling dance and then, suddenly, focused intensely on a single area of the room, feathers shaking furiously. When he does this towards where you’re sitting, it’s as if there’s nobody sitting near you at all - his wintery eyes bore into yours, and they are at a centre of a shaking kaleidoscope of reds and blues, a flower that moves just for you. Then he’s gone, folding it away and striding to another part of the stage, leaving you to wonder if he is actually naked under there, or?...");
	
	output("\n\nHepane ratchets up the beat to a rave-like climax, and in response Fazian finishes the performance with several minutes of intense action, working in back-flips and full air twists, violent, giddy precision during which you think you can glimpse, just glimpse what he’s packing between his tight hips, purple fronds... and then he’s finished, chest heaving and fans bent across his lower body, bowing with Hepane to rapturous applause.");
	
	output("\n\nAn unusual strip-tease to say the least. However, like Hepane suggested, you leave feeling frenetic and agitated, a desire to move your hips energetically in concert with someone else nagging at you. Going by the number of hands you can see creeping around waists and abdomens amongst the exiting crowd, you aren’t the only one.");

	if (flags["NOZZLE_SHOW_PARADISE"] == undefined) flags["NOZZLE_SHOW_PARADISE"] = 0;
	flags["NOZZLE_SHOW_PARADISE"]++;

	processTime(55+rand(10));

	if (!pc.hasStatusEffect("Paradise!"))
	{
		pc.createStatusEffect("Paradise!", 0, 0, 0, 0, false, "OffUp", "Fazian's Paradise performance has left a fire in your loins!\nMinimum list increased by 20.", false, 480, 0xFFFFFF);
	}

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function nozzlePerformanceShrike():void
{
	clearOutput();
	showFazianPerformance("\nSHRIKE");

	output("Hepane is sat next to a vertically arranged instrument that looks like a combination of a hookah and an upturned piano. She picks out a jaunty, chiming rhythm on the oblong keys at the top; her other set of hands sit on the round keys below, waiting. Her partner strides on.");
	
	output("\n\n");
	if (flags["NOZZLE_SHOW_SHRIKE"] == undefined)
	{
		output("He’s an anat, immediately recognisable by his long, bone-mask face, his double-jointed legs and small, neat claws. His feather plumes are startling, though: rearing way out above his crown and elbows, they’re shades of aquamarine and magenta that continuously glitter and shift under the glare of the spotlights.");
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

	if (!pc.hasStatusEffect("Shrike!"))
	{
		pc.createStatusEffect("Shrike!", 0, 0, 0, 0, false, "OffUp", "Fazian's Shrike performance has inspired you!\nExperience gains increased by 20%.", false, 480, 0xFFFFFF);
	}

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function nozzlePerformanceQuaramarta():void
{
	clearOutput();
	showFazianPerformance("\nQUARAMARTA");

	output("Hepane is sat next to a vertically arranged instrument that looks like a combination of a hookah and an upturned piano. She picks out a snaky bass rhythm on the round keys at the bottom; her other set of hands sit on the stem keys above, waiting. Her partner strides on.");
	
	output("\n\n");
	if (flags["NOZZLE_SHOW_QUARAMARTA"] == undefined)
	{
		output("He’s an anat, immediately recognisable by his long, bone-mask face, his double-jointed legs and small, neat claws. His feather plumes are startling, though: rearing way out above his crown and elbows, they’re shades of aquamarine and magenta that continuously glitter and shift under the glare of the spotlights.");
	}
	else
	{
		output("Fazian the anat strides onto the stage; all rearing, flowing feathers, austere ivory and supple muscle.");
	}
	output(" He’s dressed in a tight white shirt and long johns which are pretty conservative by strip-club standards - although when he flexes his balletic form so that his pert muscles bulge against the fabric, the audible intake of breath around the room informs you that it has an effect nonetheless.");
	
	output("\n\nFazian clicks his finger-claws, gazing out over the crowd, his visage an unreadable mask over two blue, lively eyes. Hepane begins to sing wordlessly as she caresses the top keys of her instrument, introducing echoing piano-like chimes to her propulsive, itchy, upbeat tune. The anat clicks his fingers, swings his hips and stamps his feet with careless grace, affecting casualness but stamping his feet down right in time with Hepane, drum to her double instrument.");
	
	output("\n\nYou realise suddenly that it’s not just the anat creating the percussion. The rhythm reverberates around the room, and looking around you see almost every gold myr drumming their tables with four fingers, grinning and entranced, keeping time with the cocky, feathered dancer. The beat ratchets up and up, Hepane’s fingers working furiously, Fazian throws off more and more his nonchalance with each flex of his hips, until -");
	
	output("\n\n<i>“QUARAMARTA!”</i> cries Hepane. Every gold myr in the room brings all four hands down on the nearest table with a ringing slam. Brilliant red and blue feathers twist furiously on the stage.");

	output("\n\nIt goes on and on, loosening out after each <i>“QUARAMARTA!”</i> before the jam is tightened up again, each time headier and faster than the last, Fazian’s stomping, writhing dance becoming more and more intense and the rap of fingers around you louder and louder until it’s impossible not to get caught up in it. When he rips off his shirt for the crescendo, light sweat glossing his tight frame, it doesn’t feel stage-managed; it seems absolutely what he should do in that moment.");
	
	output("\n\n<i>“QUARAMARTA!”</i> everyone in the room roars gleefully as he twirls into the air one last time, slamming their hands down so the walls shake, before standing up and applauding furiously. Eyes twinkling and chest heaving, Fazian bows with Hepane.");
	
	output("\n\nYou don’t know how they manage to applaud; your single pair of hands ache mightily. Nonetheless, you leave with the crowd feeling galvanized and feisty, grinning stupidly back at everyone else with whom, for a short while, you were a single, musical force.");

	if (flags["NOZZLE_SHOW_QUARAMARTA"] == undefined) flags["NOZZLE_SHOW_QUARAMARTA"] = 0;
	flags["NOZZLE_SHOW_QUARAMARTA"]++;

	//+ 1 hour, + 15% crits for next 8 hours
	processTime(55+rand(10));

	if (!pc.hasStatusEffect("Quaramarta!"))
	{
		pc.createStatusEffect("Quaramarta!", 0, 0, 0, 0, false, "OffUp", "Fazian's Quaramarta performance has sharpened your senses!\nCritical chance increased by 15%.", false, 480, 0xFFFFFF);
	}

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function showFazian():void
{
	author("Nonesuch");
	showName("\nFAZIAN");
	showBust("FAZIAN");
}

public function fazianApproach():void
{
	clearOutput();
	showFazian();

	if (flags["APPROACHED_FAZIAN"] == undefined)
	{
		flags["APPROACHED_FAZIAN"] = 1;

		output("\n\n<i>“Hey,”</i> you say, sidling up to the lean, brightly-feathered alien at the bar. <i>“You’re the dancer guy, right?”</i>");
		
		output("\n\n<i>“I hope so,”</i> Fazian replies affably in clear, well-enunciated tones, taking a pull on the straw leading behind his mask. <i>“Otherwise there’s some other anat around here making a fool of themselves.”</i> He turns to look at you with increasing interest. You think. It’s really quite difficult to tell with anatae. <i>“Hey, you’ve been to our performances, haven’t you? It’s great to see non-natives there, you know. It’s difficult to get unbiased views about the stuff we do from the myr.”</i> He fiddles with the stem of his glass. <i>“So... what did you think?”</i>");

		//[Liked It] [Eh]
		clearMenu();
		addButton(0, "Liked It", fazianLikedIt, "Liked It", "Tell him you liked the performance.");
		addButton(1, "Eh", fazianEh, "Eh", "Tell him you didn't like ");
		return;
	}
	else
	{
		output("<i>“Per Steele!”</i> Fazian’s eyes smile warmly at you as you sidle up to him at the bar. After only half a second’s pause, the anat dancer grasps your hand and shakes it, not so vigorously it might dislocate your wrist. He’s getting better at it.");
		fazianMenu();
	}
}

public function fazianLikedIt():void
{
	clearOutput();
	showFazian();

	if (pc.isBimbo()) output("<i>“It was good!”</i> you say enthusiastically. <i>“I like colors. And men. The two together! I’m a fan.”</i>");
	else if (pc.isBrute() || pc.isAss()) output("<i>“It was good,”</i> you say assertively. <i>“Makes me wonder why you’re performing it in a strip joint in the middle of nowhere, rather than somewhere people’d really appreciate it.”</i>");
	else output("<i>“It was good!”</i> you smile. <i>“Not something I would have expected to see in a strip joint on the fringes of nowhere.”</i>");

	output("\n\nFazian listens intently, clear blue eyes fixed on you.");
	
	output("\n\n<i>“That’s very kind of you to say,”</i> he replies. He doesn’t sound like he quite believes you. <i>“We’re just throwing ideas up on stage and seeing what works. It’s very difficult to reach an alien audience without just relying on brute physicality, and that’s the joy and frustration of it. It’s nice to hear someone off Myrellion liked it, though. What’s your name, per? Oh!”</i>");
	
	output("\n\nHe shoots out his hand, and shakes very enthusiastically when you put yours in his; you get the impression that the action is a novelty for him. You introduce yourself and tell him a little about yourself.");
	
	output("\n\n<i>“Wow,”</i> he says. <i>“The "+ pc.mf("son", "daughter") +" of a famous human industrialist, you say? That’s fascinating.”</i> He twiddles with his wine glass nervously. <i>“So, "+ pc.mf("Mr.", "Ms.") +" Steele, what would you like to know?”</i>");

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
	else if (pc.isBrute())
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

	//[Him] [Anatae] [Dancing] [Myr] [Appearance]
	fazianMenu();
}

public function fazianMenu(ff:Function = null):void
{
	clearMenu();
	if (ff != fazianAppearance) addButton(0, "Him", fazianHim, undefined, "Himself", "Ask Fazian about himself.");
	else addDisabledButton(0, "Him");

	if (ff != fazianAnatae) addButton(1, "Anatae", fazianAnatae, undefined, "Anatae", "Ask him about his race.");
	else addDisabledButton(1, "Anatae");

	if (ff != fazianDancing) addButton(2, "Dancing", fazianDancing, undefined, "Dancing", "Ask him about his trade.");
	else addDisabledButton(2, "Dancing");

	if (flags["FAZIAN_QUEST_STATE"] != FAZIAN_QUEST_COMPLETE) addButton(3, "Myr", fazianMyr, undefined, "Myr", "Ask him what he thinks about the myr.");
	else addButton(3, "Myr", fazianMyr, undefined, "Myr", "Ask if his opinion of the myr has changed, after his experience.");
	if (ff == fazianMyr) addDisabledButton(3, "Myr");

	if (ff != fazianDance && flags["FAZIAN_DANCE_UNLOCKED"] != undefined) addButton(4, "Dance", fazianDance, undefined, "Dance", "Go backstage and do some dance training with the anat.");
	else addDisabledButton(4, "Dance");

	
	if (ff != fazianAppearance) addButton(5, "Appearance", fazianAppearance);
	else addDisabledButton(5, "Appearance");

	addButton(14, "Back", mainGameMenu);
}

public function fazianAppearance():void
{
	clearOutput();
	showFazian();
	output("Fazian is a six foot tall anat, immediately recognisable as such by his digitigrade legs, four-clawed hands and flat, mask-like face. That impassive, ivory, vertical visage starts at his crown and tapers off to a dull point beyond where his chin would be, were he human. His dexterous... (jaws? Mandibles? Beak?) ...mouth-parts are not obvious when he’s facing you. Judging his mood and the impression your words have on him by his facial expression is clearly impossible; however, the anat has animated blue eyes and a restless body language which more than makes up for it.");
	
	output("\n\nHis rough skin is a dark navy, a dullness that offsets his remarkable feather plumes. Rearing out by at least two feet from where his mask ends on his head, his crown-plume is a bouquet of striking aquamarine and magenta into which unearthly beads of light and undertones of other shades seem to have been worked. The tufts that emerge from his elbows are the same, only in miniature. He seems to have a remarkable amount of control over all of them, able to curl, stiffen and shake them into a mesmerizing display of shifting colors when he chooses. Here though, away from the stage, he keeps them down and carefully still.");
	
	output("\n\nHe has the lithe, tightly muscular body of a male ballet dancer, with the flat, dune-like chest and hard, pert butt to go with it. As with his feathers though, whilst he’s evidently happy to flaunt it all on-stage, here and now he’s dressed in a plain white shirt and denim long johns, almost ascetic-like. What he keeps in his trousers is anyone’s guess - although you imagine you wouldn’t have to ask around here for very long to find out.");
	fazianMenu(fazianAppearance);
}

public function fazianHim():void
{
	clearOutput();
	fazianMenu();

	output("<i>“So how did you come to be strutting your stuff all the way out here, then?”</i> you ask.");
	
	output("\n\n<i>“Do you want the official reason, per?”</i> Fazian replies, looking at you sideways. <i>“If you’re an anat, you’ve got to have a very good one to be wasting a first grade artistic license out on a human-corporate-owned frontier world. Well, you’ve got to have a very good reason to get a first grade artistic license in the first place. But I always wanted to be a dancer, and your parents and career officer can only shower you with so many engineering pamphlets before they have to give up. My people aren’t brutes or... autistic, they do know the value of the arts,”</i> he goes on quickly, <i>“But it’s so hard to measure the value of a painting next to a new live-ship or block of apartments on a colony world, y’know?”</i>");
	
	output("\n\n<i>“And you’re here because... <i>“ you cajole.");
	
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
	addButton(0, "“Per”", fazianAnataePer, undefined, "“Per”", "Ask him what he means by that.");
	//addButton(1, "TouchFeather", fazianAnataeTouchFeather, undefined, "Touch Feather", "You've been wanting to do this for a while....");
}

public function fazianAnataePer():void
{
	clearOutput();
	showFazian();

	output("<i>“Per. You keep saying that,”</i> you observe. <i>“What does it mean?”</i>");

	output("\n\nFazian ducks his head and doesn’t immediately respond.");

	output("\n\n<i>“I... guess that isn’t coming through as a direct translation,”</i> he says. You realise he thinks he’s embarrassed himself. He shuffles in his trouser pocket, brings out a miniature codex and flicks through it for a few moments. <i>“Komm-rahd”</i>? It’s telling me that’s a very archaic expression though.”</i> He takes a long pull on his straw before going on, still looking rather uncomfortable.");

	output("\n\n<i>“The anatae have an empire, right? The largest number of colonies in the known galaxy. But we don’t have a leader on top of it all. It’s all owned by us, the people. So... Per. We are all emperors. That’s the idea, anyway.”</i>");

	fazianMenu(fazianAnatae);
}

/*
public function fazianAnataeTouchFeather():void
{
	clearOutput();
	showFazian();
}
*/

public function fazianDancing():void
{
	clearOutput();
	showFazian();

	output("<i>“So you like dancing, then?”</i> you grin.");
	
	output("\n\n<i>“Do the myr like honey?”</i> he replies, eyes flashing. He gesticulates passionately with his claws. <i>“I love all forms of theatre, performance art, acting... I even tried galotian pollocking, when I was first starting out. But dancing, yes, above all. I don’t... I can’t always find the right words when I am talking to others. When I am dancing, I feel as if I am expressing everything I am about perfectly. And here, I can communicate to innocents who just want to drink it in. It’s so </i>pure<i>, the way art should be.”</i>");
	
	output("\n\n<i>“You charge for your performances,”</i> you point out.");
	
	output("\n\n<i>“It all goes to Hepane, the other performers, and the club’s running,”</i> he replies mildly, scratching his mask. <i>“I have a food-facturer on my ship that will continue to function for another century. I mean, what it serves isn’t great,”</i> he admits. <i>“But then... <i>“ he takes a long pull of mead from his straw as way of finishing that sentence. <i>“My people’s goal is to move towards post-scarcity - and why would I charge when I’m self-sufficient and doing what I love, anyway?”</i>");

	//[Teach me?] [Back]
	clearMenu();
	addButton(0, "TeachMe", fazianDancingTeachMe, undefined, "Teach Me", "Ask if he's willing to teach you some dance moves.");
	addButton(1, "Back", fazianMenu, fazianDancing);
}

public function fazianDancingTeachMe():void
{
	clearOutput();
	showFazian();

	output("<i>“Alright, let’s say you’ve convinced me,”</i> you smile. <i>“Think you’ve got time to teach me some of your dance moves?”</i>");

	if (pc.isFeminine())
	{
		output("\n\nFazian stares at you. The tenseness in his frame, and then the way he quickly starts fiddling with his wine glass’s stem again, tells you he’s rather shocked by this proposition.");
		
		output("\n\n<i>“I, um, I don’t know if I can... that is to say, I don’t think there’s anything I could teach you,”</i> he mumbles. <i>“Which isn’t to say I don’t want to,”</i> he goes on. If his face had blood corpuscles in it, you imagine it would be glowing right now. <i>“But you’re naturally... you don’t need to dance. Or not the kind of dancing I know. Like the myr, you own grace and beauty just by </i>existing.<i> My training is for those who need to work to achieve such things.”</i>");
		
		output("\n\nThere will be times when you will be let down harder in your life.");

		clearMenu();
		addButton(0, "Back", fazianMenu, fazianDancing);
	}
	else
	{
		output("\n\n<i>“You... ? Sure, I guess,”</i> shrugs Fazian. He nods with increasing enthusiasm for the idea as he mulls it over. <i>“It’ll be fun! Come and see me after the evening performances. I don’t know how good a teacher I am, but I’m sure it wouldn’t take long to show you one or two things.”</i> He finishes his glass of wine with a long pull. <i>“Not doing anything right now, if you want to go backstage.”</i>");

		//[Dance] [Later]

		clearMenu();
		addButton(0, "Dance", fazianDance, undefined, "Dance", "Go backstage and do some dance training with the anat.");
		addButton(1, "Later", fazianDanceTeachMeLater, undefined, "Later", "Don't start learning dance moves right now.");
	}
}

public function fazianDanceTeachMeLater():void
{
	clearOutput();
	showFazian();

	output("<i>“Later, maybe,”</i> you say. The anat shrugs again and orders another glass of wine.");
	
	output("\n\n<i>“As said, I’m free after the evening shows if you change your mind.”</i>");

	//Add "Dance" to Fazian's main menu
	flags["FAZIAN_DANCE_UNLOCKED"] = 1;

	fazianMenu(fazianDancing);
}

public function fazianMyr():void
{
	clearOutput();
	showFazian();

	if (flags["FAZIAN_QUEST_STATE"] == FAZIAN_QUEST_COMPLETE) output("You guess you already know the answer to this, but surrounded by their orange softness and their high, twittering voices, it is the obvious question to ask.\n\n");

	output("\n\n<i>“What do you think of the myr?”</i>");
	
	output("\n\n<i>“They’re wonderful,”</i> says Fazian with happy, level conviction. <i>“Such a welcoming, intelligent and peaceful race. Not just the golds. Oh, the reds armor themselves up with their conventions more, but beneath that - they are women. They are born to be caring, loving beings. Being around them, and performing for them, is a pleasure.”</i> He takes a long pull on his glass of wine, blue eyes slightly misty.");

	if (pc.isBimbo() || pc.isBrute()) output("\n\nEven to your own love-swamped mind, this doesn’t sound quite right.");
	else output("\n\nYou don’t think you can let this go by entirely unchallenged.");

	output("\n\n<i>“They, uh, did kill each other in the hundreds of thousands. And are now on the brink of nuclear war,”</i> you point out.");
	
	output("\n\n<i>“It was a mistake,”</i> the anat replies stubbornly, feathers rustling. <i>“The whole war - it is a colossal mistake, caused by gender imbalance above and beyond anything else. You talk to any gold or red myr for long enough, it becomes obvious that what they are really craving is love or motherhood, and they never get enough opportunities for either.”</i> He sucks on his straw determinedly.");
	
	output("\n\n<i>“You do not understand, Steele - I am told much of the U.G.C. is female-orientated as well, perhaps these things aren’t as obvious to you. I come from a society dominated by males. Hard lines, an obsession with physical goals, emotionality locked away, those are the orders of the day. Here, I can feel the opposite is waiting to burst through, if anyone is willing to give it a chance to. Perhaps the kui-tan? I don’t know. In the meantime, I will share myself and my art with the myr as much as I can. Try and give them the happiness that is their true birth-right.”</i>");
	
	output("\n\nEven if you were minded to, you doubt you could persuade him otherwise.");

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

		if (pc.isBrute()) output("\n\n<i>“Dick,”</i> you say, with absolute certainty.");
		else if (pc.isNice()) output("\n\n<i>“Gallantry?”</i> you suggest.");
		else if (pc.isMisch()) output("\n\n<i>“Obsessive behaviour and emotional ineptitude?”</i> you suggest.");
		else output("\n\n<i>“Assertiveness,”</i> you say.");

		output("\n\n<i>“Confidence, per,”</i> Fazian corrects. He brings his snapping claws down to a gently swivelling hip. <i>“You’ve got to say with your body that you’re going to get what you want, and you aren’t going to have to grab or act like a thug to do it - you just </i>will<i>, because look at </i>you.</i>”</i> You’re slightly worried that the anat’s forgetting about you. He slaps his hands and does a little shimmy. <i>“Get it wrong and they’ll laugh at you. Get it right and they’ll laugh too - with you. You’ve got to convince your audience you’re worth watching, and you do that by having absolute confidence in what you’re doing.”</i> He whirls once and lands so he’s side-on to you, still considering intently.");
		
		output("\n\n<i>“I think there’s two dances that I could easily teach you. One’s a classic and fairly straightforward - the Edotto. The other’s a bit more, um, flamboyant. The Sunwalker. Opens you up to the audience a bit more, so greater risk, greater reward, potentially. Which grabs you?”</i>");
	}
	else
	{
		output("\n\n<i>“So, which will it be?”</i> asks Fazian. Click, click, go his claws. <i>“Edotto, or Sunwalker?”</i>");
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

	output("<i>“Alright then Steele,”</i> says Fazian. <i>“Position yourself like so, hands on hips. It always starts with your hips... <i>“");
	
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

	output("<i>“I thought you’d go for that one,”</i> laughs Fazian. <i>“Don’t say I didn’t warn you! Position yourself like so, hands down at your side. Then bring them up, framing your chest... <i>“");
	
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
	pc.createStatusEffect("Sore", 0, 0, 0, 0, false, "Icon_Crying", "You are sore and will regain energy slower. Working out is also impossible in this state. Sleep to recover.", false, 0);
}

public function fazianDanceOne(isSunwalker:Boolean = false):void
{
	clearOutput();
	showFazian();

	if (isSunwalker)
	{
		output("<i>“Alright Steele,”</i> says Fazian. <i>“Position yourself like so, hands down at your side. Then bring them up, framing your chest... <i>“");
		
		output("\n\nThe anat drills you relentlessly for the next few hours, practicing the same couple of stances over and over again. It’s tough physical work and pretty tedious, however by the end you think you’ve got the opening moves down pat.");
		
		output("\n\n<i>“Remember,”</i> Fazian says as you leave, wiping sweat from your brow. <i>“After you begin, lead with your chest. Try it out if you can, and come see me again when you’re ready for more.”</i>");
	}
	else
	{
		output("<i>“Alright then Steele,”</i> says Fazian. <i>“Position yourself like so, hands on hips. It always starts with your hips... <i>“");
		
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
		output("<i>“So,”</i> says Fazian. <i>“Once you’ve got their attention with the hips, you can start bringing in your upper body... <i>“");
		
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
		output("<i>“Now you’ve got the intro and basics down,”</i> grins Fazian, bringing up the 4/4 rhythm on his codex again, <i>“you’re all set to do some proper sunwalking! It’s a wave-like motion with your hips which, if you do it right, propels you forwards. See here... <i>“");
		
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
		
		output("\n\nYou go back to the drills, and each time you pull the whole sequence off, you learn the fine art of grasping your groin and pumping your hips. {No front genitals: Or as in your case, grasping a featureless expanse of flesh and pumping your hips, but it’s the thought that counts.}");
		
		output("\n\n<i>“You’ve got it, per!”</i> Fazian says, eyes twinkling. <i>“Lead with your hips, bring in your chest, shake your backside, back to your hips, and finish it off with your crotch. Do it with confidence and no girl or guy in the galaxy will be able to resist you. Come back any time if you want to practice.”</i>");
		
		output("\n\nYou leave, tired and sweaty but exultant.");
	}

	processTime(300+rand(50));
	flags[(isSunwalker ? "DANCE_SKILL_SUNWALKER" : "DANCE_SKILL_EDOTTO")] = 4;
	fazianDanceSore();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
