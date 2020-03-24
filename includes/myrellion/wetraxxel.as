import classes.Characters.WetraHound;
import classes.Characters.WetraxxelBrawler;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.GameData.CombatManager;
public function wetraxxelCaveEncounters():void
{
	if (flags["WETRAXXEL_ENCOUNTER_WEIGHT"] == undefined)
	{
		flags["WETRAXXEL_ENCOUNTER_WEIGHT"] = 0;
	}

	if (flags["WETRAXXEL_SUBMISSION"] == undefined)
	{
		flags["WETRAXXEL_SUBMISSION"] = 0;
	}

	if (rand(15) <= flags["WETRAXXEL_ENCOUNTER_WEIGHT"])
	{
		encounterWetraxxelBrawler();
	}
	else
	{
		encounterWetraHound();
	}
}

/*********************
	WETRA HOUND
*********************/
public function wetraHoundHeader():void
{
	showName("WETRA\nHOUND");
	showBust("WETRAHOUND");
	author("Savin");
}

public function encounterWetraHound():void
{
	wetraHoundHeader();
	
	IncrementFlag("MET_WETRA_HOUND");

	output("\n\nAs you’re making your way through the rough cavern, you start to hear the sound of claws clattering on the cold stone. You turn, just in time to see a heavy, muscular mass stepping out of the shadows, showing you a mouth full of glistening white fangs. It looks like some unholy amalgamation of a crocodile and a gorilla, covered in scraggly gray fur on its back and its muscle-bound arms, and plates of leithan-like scales coat its back, chest, and hind-legs.");
	
	output("\n\nThe creature growls, opening its slavering maw into a bestial howl before charging at you!");

	clearMenu();
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new WetraHound());
	CombatManager.victoryScene(wetraHoundPCVictory);
	CombatManager.lossScene(wetraHoundPCLoss);
	CombatManager.displayLocation("WETRA HOUND");
	
	addButton(0, "Next", CombatManager.beginCombat);
}

public function wetraHoundAnimalIntellect():void
{
	//Play when the PC tries to Tease the wetra hound.

	output("The wetra hound looks at you confusedly as you strut your stuff, but it shows no visible signs of arousal. Not surprisingly, you have a hard time turning on an animal!");
}

public function wetraHoundPCVictory():void
{
	clearOutput();
	wetraHoundHeader();
	showName("VICTORY:\nWETRA HOUND");

	output("Yowling in pain, the wetra hound stumbles back and licks at its wounds. You take a threatening step forward, and the wounded hound yelps and starts loping away, hustling off into the shadows. The sounds of the beast howling echo back to you through the caverns.");

	output("\n\nNo way that sound is going to go unnoticed...\n\n");

	//Increase chance of Wetraxxel Brawler encounter.
	flags["WETRAXXEL_ENCOUNTER_WEIGHT"] += 1;

	clearMenu();
	CombatManager.genericVictory();
}

public function wetraHoundPCLoss():void
{
	clearOutput();
	wetraHoundHeader();
	showName("DEFEAT:\nWETRA HOUND");

	//+1 Submission
	flags["WETRAXXEL_SUBMISSION"] += 1;

	output("The wetra hound slams into you like a freight train, barreling you to the ground and pinning you under its massive weight. The beast snarls and snaps, its razor-like fangs looming over your face, drooling and snarling and snapping. The creature doesn’t maul you, however, it just keeps you pinned.");
	
	output("\n\nOver the sounds of its snarling, you begin to hear footsteps rapidly approaching.");
	if (!CodexManager.entryUnlocked("Wetraxxel"))
	{
		output(" A huge, muscular, insectile creature");
	}
	else
	{
		output(" The wetraxxel male who masters these caves");
	}
	output(" steps out of the shadows, cracking his knuckles and scowling at you.");
	if (!CodexManager.entryUnlocked("Wetraxxel"))
	{
		output(" Your codex beeps out an identification, barely audible over the hound’s growling: this creature is a wetraxxel, a towering brawler who is dangerously territorial.");

		CodexManager.unlockEntry("Wetraxxel");
	}
	output(" The wetraxxel whistles sharply, barking something in his guttural language that brings the hound off of you. The beast retreats, bounding off into the darkness, and leaving you at the mercy of its master...");

	//Play Wetraxxel loss scenes as appropriate.
	clearMenu();
	addButton(0, "Next", wetraxxelLossScene(true));
}

public function wetraxxelLossScene(wetraHound:Boolean = false):Function
{
	if (!wetraHound && flags["WETRAXXEL_SUBMISSION"] >= 10) return wetraxxelBrawlerBadEnd;

	var scenes:Array = [];

	scenes.push(wetraxxelBrawlerPCLossButtfucking);
	if (flags["WETRAXXEL_SUBMISSION"] <= 6) scenes.push(wetraxxelBrawlerPCLossPinnedAndFingered);
	if (flags["WETRAXXEL_SUBMISSION"] >= 6) scenes.push(wetraxxelBrawlerPCLossTonguePolish);

	return scenes[rand(scenes.length)];
}

/*********************
	WETRAXXEL BRAWLER
**********************/

public function wetraxxelBrawlerHeader(nude:Boolean = false):void
{
	showName("WETRAXXEL\nBRAWLER");
	if(!nude) showBust("WETRAXXEL");
	else showBust("WETRAXXEL_NUDE");
	author("Savin");
}

public function encounterWetraxxelBrawler():void
{
	flags["WETRAXXEL_ENCOUNTER_WEIGHT"] = 0;
	
	IncrementFlag("MET_WETRAXXEL_BRAWLER");

	output("\n\nAs you’re wandering through the strange passage, you take a slight turn in the winding caverns and gasp as you nearly run face-first into the chest of a towering, insectile pile of muscle. The man scowls");
	if (pc.tallness < 120) output(" down at you");
	else output(", looking you dead in the eye");
	output(". Small, black eyes regard you with cold menace, and the chitinous bug man cracks his knuckles.");
	
	output("\n\nSomething tells you he isn’t happy to see you in his domain.");
	
	if (!CodexManager.entryUnlocked("Wetraxxel"))
	{
		output("\n\nYour Codex beeps out a warning: <i>“Danger! This creature is a male wetraxxel, a highly territorial, intelligent, and taciturn inhabitant of Myrellion. Early studies indicate it will defend its territory and females with its life. User beware: submission to a wetraxxel male may result in capture and imprisonment.”</i>");

		CodexManager.unlockEntry("Wetraxxel");
	}
	else
	{
		if (pc.isFeminine())
		{
			output("\n\nLooks like you’ll have to defend yourself if you don’t want to be dragged off into the barbarian bug-man’s harem!");
		}
		else
		{
			output("\n\nThe wetraxxel stomps his feet on the cavern floor, assuming a very practiced fighting stance with fists raised to you. You blink as the mighty warrior gestures at you in what could only be construed as a <i>“come get some”</i> gesture. It seems like he’s challenging you to a fight!");
		}
	}

	clearMenu();
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new WetraxxelBrawler());
	CombatManager.victoryScene(wetraxxelBrawlerPCVictory);
	CombatManager.lossScene(wetraxxelBrawlerPCLoss);
	CombatManager.displayLocation("WETRAXXEL");
	
	addButton(0, "Next", CombatManager.beginCombat);
}

public function wetraxxelBrawlerPCLoss():void
{
	clearOutput();
	wetraxxelBrawlerHeader(true);
	showName("DEFEAT:\nWETRAXXEL");

	output("You collapse, too");
	if (pc.HP() <= 0) output(" battered");
	else output(" turned on"); 
	output(" to put up any further resistance to the huge bug-man.");
	if (flags["WETRAXXEL_SUBMISSION"] >= 6) output(" You assume the familiar position of submission, lowering your head meekly as the wetraxxel approaches you.");
	else output(" You grunt, slumping to the ground. You pointedly avoid the wetraxxel’s leering gaze as he approaches you.");
	output(" The brawler’s fists relax, coming to rest on his hips.");
	
	if (flags["WETRAXXEL_SUBMISSION"] <= 5)
	{
		output("\n\n<i>“You are not welcome here,”</i> he growls, his voice like grinding gravel that echoes through the cavern. <i>“I will teach you what happens to intruders.”</i>");
	}
	else if (flags["WETRAXXEL_SUBMISSION"] <= 7)
	{
		output("\n\n<i>“Again and again you return,”</i> the wetraxxel growls, looming over you now. You pointedly avoid his gaze, already starting to pull away your burdensome gear. <i>“You must enjoy these lessons, then? You still have too much fire, though, alien. I will continue to break you.”</i>");
	}
	else if (flags["WETRAXXEL_SUBMISSION"] <= 9)
	{
		output("\n\n<i>“You still return?”</i> the wetraxxel sighs, looming over you. You pointedly avoid his gaze, already starting to pull away your burdensome gear, shame-facedly trying to hide your mounting sexual excitement. <i>“You enjoy your submission, I see. As do I. Perhaps you would make a fine addition to my harem after all...”</i>");
	}

	clearMenu();
	addButton(0, "Next", wetraxxelLossScene(false)); // Autobadends if appropriate.
}

public function wetraxxelBrawlerPCLossPinnedAndFingered():void
{
	clearOutput();
	wetraxxelBrawlerHeader(true);
	showName("DEFEAT:\nWETRAXXEL");

	output("You wince as the wetraxxel’s large, strong hand clenches around your neck - though rather than a chokehold, the giant brawler picks you up by the scruff of your neck. You quickly find yourself pinned against the stone wall of the cavern, the weight of your body resting against an outcropping of sand-colored, gritty rock. The wetraxxel male’s hand is firmly against your neck, using his forearm to press you into the rockface. Still, despite the man’s intimidating power and size, the hold he keeps you in is completely painless.");
	
	output("\n\nThe wetraxxel looks you over appraisingly, his small black eyes wandering across your body. Slowly, the hand not pinning you begins to strip your of your [pc.gear]. When you’re left bare by the bug-man’s hand, his smoothly chitinous fingers");
	if (pc.hasCock()) output(" wrap around your [pc.cock]");
	else output(" grab your [pc.crotch]");
	output(". It’s impossible to stifle a moan of fear and pleasure as");
	if (flags["WETRAXXEL_SUBMISSION"] >= 5) output(" you feel the familiar hand groping you");
	else output(" the wetraxxel explores your body");
	output(". It doesn’t take long before his roaming hand slips");
	if (!pc.isTaur()) output(" between your [pc.legs]");
	else if (pc.hasVagina()) output(" over your [pc.vagina]");
	else output(" around your [pc.hips]");
	output(", and you gasp as a single long, smooth digit nears your [pc.vagOrAss]. You squirm, desperately writhing in the brawler’s grasp, but he holds you perfectly firm as his finger presses inexorably towards your clenching");
	if (pc.hasVagina()) output(" cunt");
	else output(" asshole");
	output(".");
	
	output("\n\nConsidering his tremendous size, the wetraxxel’s digit is bigger and as thick around as a human cock. It feels like one, too - so smooth and hot as its rounded tip pushes against the");
	if (pc.hasVagina()) output(" lips");
	else output(" rim");
	output(" of your [pc.vagOrAss]. With a grunt of effort, the wetraxxel shoves himself inside you, spreading your hole wide around the rigid girth of his plated finger. You shiver in pleasure as the bug-man’s finger slides into you, teasing through your");
	
	var holeTightness:Number;
	if (pc.hasVagina()) holeTightness = pc.vaginas[0].looseness();
	else holeTightness = pc.ass.looseness();
	
	if (holeTightness <= 1) output(" tight");
	else if (holeTightness <= 4) output(" loose");
	else output(" ruined");
	output(" passage until his palm is pressed against your thighs.");
	
	output("\n\nHe gives you the span of a heartbeat to get used to him before he starts to move. He starts to thrust quickly, hammering your hole with agonizing abandon. You scream in pleasure, throwing your head back in a primal gesture of ecstasy. The wetraxxel only moves faster, spurred on by your screams; he’s jackhammering you before long, pounding your [pc.vagOrAss] until you’re completely unable to hold back. A few moments later and you’re cumming,");
	if (pc.hasCock()) output(" spraying a thick gout of spooge across the brawler’s chest");
	else if (pc.hasVagina()) output(" gushing fem-cum out around his finger");
	else output(" crying out in agonizing pleasure as your sexless body convulses");
	output(".");
	
	output("\n\nEven as you’re forced to orgasm, the wetraxxel relentlessly continues. You aren’t given a moment’s respite as your climax subsides; his finger continues to move at the same brisk pace throughout, and well after it. Your body’s sensitivity spikes in the aftermath, and you find your voice breaks into shameless cries of pleasure again and again as you’re continuously fucked.");
	
	output("\n\nAnother finger slips in with the first, stretching your [pc.vagOrAss] wide. The wetraxxel makes a simple grunt in answer to your pleas and moans, his four-part insectile mouth contorting into a scowl.");
	if (flags["WETRAXXEL_SUBMISSION"] >= 5) output(" You whimper as you realize your captor is less than pleased, and quickly find yourself cupping your hands around your mouth, trying not to scream.");
	output(" All you can do is try to hold on, desperately clenching around his pounding digits. Your squirming, now well-fucked hole can offer no resistance anymore, and you quickly find a third finger jamming its way in with the first pair.");
	
	output("\n\nThe insertion, now stretching you as wide as three cocks, wrenches another orgasm from you.");
	if (pc.hasCock()) output(" More spooge jettisons from your [pc.cock], smaller than the first load, and weaker too.");
	else if (pc.hasVagina()) output(" Your pussy squirms and soaks itself again around the wetraxxel’s thrusting fingers, soaking his plated hand in your girl-juices.");
	output(" He makes an approving grunt, but the scowl on his features doesn’t relent - and neither does his hand. The wetraxxel keeps forcefully fingering you, his small black eyes intent upon you.");
	
	output("\n\n<b>Time passes...</b>");

	processTime(20 + rand(10));

	clearMenu();
	addButton(0, "Next", wetraxxelBrawlerPCLossPinnedAndFingeredII);
}

public function wetraxxelBrawlerPCLossPinnedAndFingeredII():void
{
	clearOutput();
	wetraxxelBrawlerHeader(true);
	showName("DEFEAT:\nWETRAXXEL");

	output("Orgasm after orgasm washes over you, wracking your mind and body with pleasure and that borders on pain. You’ve lost track of time, of pleasure, of anything but moaning weakly and writhing under your captor’s ceaseless ministrations. Your body is completely limp in his hands, overwhelmed to the point of nonresponse by the vigorous finger-fucking you’ve receieved.");
	
	output("\n\nThis wetraxxel male is utterly relentless, completely intent on sexually punishing you for your intrusion. His entire fist is inside you now, stretching your [pc.vagOrAss] to the absolute limit. You feel like you’re being fucked by a smooth, hard watermelon. Your gut strains around the massive insertion");
	if (pc.tallness <= 72) output(", feeling like you’re about to be torn in half");
	output(".");
	
	output("\n\nFinally, on the tail of another dry orgasm - the most recent of so very, very many - the wetraxxel grunts and pulls himself out of you. Left suddenly empty, your body deflates in on itself, collapsing around your stretched-out");
	if (!pc.hasVagina()) output(" asshole");
	else output(" cunt");
	output(". When the bug-man’s hands release you, you slump lifelessly to the ground, barely conscious after the rigorous fucking you’ve just taken.");
	
	output("\n\nSeemingly satisfied with the punishment he’s meted out, the wetraxxel steps back and growls, <i>“Leave this place, alien. You are not welcome");
	if (pc.isFeminine()) output(" yet");
	output(".”</i>");
	
	output("\n\nWith a grunt, the wetraxxel stalks off into the caverns, leaving you to gather your gear and weakly stumble off.\n\n");

	processTime(200+rand(40));

	for (var i:int = 0; i < 4; i++)
	{
		pc.orgasm();
	}

	//Return PC to the entrance to the wetraxxel's territory. 
	currentLocation = "1X11";
	flags["WETRAXXEL_SUBMISSION"] += 1;
	clearMenu();
	CombatManager.genericLoss();
}

public function wetraxxelBrawlerPCLossButtfucking():void
{
	clearOutput();
	wetraxxelBrawlerHeader(true);
	showName("DEFEAT:\nWETRAXXEL");

	//PCs of any gender. Any Submission.
	
	output("Looming over you, the wetraxxel starts to tear away your [pc.gear] with rough, powerful motions. You cry out and squirm, trying to avoid his hands; in your state, though, there’s little you can do to resist his wishes. He makes quick work of your gear, throwing it aside until you’re bare-ass naked against the cold stone of the cavern.");
	
	output("\n\n<i>“You wish to invade my territory - my harem?”</i> the wetraxxel growls, kicking your equipment aside and hauling you up to your [pc.feet]. <i>“I will show you what you must so wish to see...”</i>");
	
	output("\n\nA whimper escapes your lips as the wetraxxel shoves you up against the craggy wall, face first into the stone. The wetraxxel’s hands dig into your [pc.butt], squeezing hard enough to make you yelp in a mix of pleasure and pain. His fingers are bigger than a human’s cock, and each plated in smooth, warm chitin that lets him slip easily across your defenseless body. A lone digit slips between your ass cheeks and shoves its way into your [pc.asshole]. You can’t help but squeal, crying out in shock as the smooth, thick finger plunges into you. It really does feel like a cock - or maybe a dildo, featureless and smooth as it is - spreading your ass wide around its girth.");
	
	if (pc.hasVagina())
	{
		output("\n\n<i>“You are not worthy to bear my offspring,”</i> the bug grunts, sliding deep into your asshole. <i>“By right of conquest, I claim your barren hole until you are.”</i>");
	}
	
	output("\n\nThe wetraxxel makes a few experimental thrusts into you, burying himself up to the palm each time. A couple of forceful jackhammer-blows seem to satisfy him, and the wetraxxel withdraws with an approving grunt. A shiver wracks through your body as the dildo-like digit slides out of you, leaving your [pc.asshole] agape. You don’t have to think hard to realize what comes next, and all you can do is dig your fingers into the rocks and hold on.");
	
	output("\n\nSure enough, a moment later you hear the wetraxxel ripping aside his loincloth, freeing the heavy package hidden behind it. He shifts his burly hips, swinging his insectile shaft up into the crack of your ass. You can immediately tell it’s utterly inhuman: the wetraxxel’s cock is covered from base to crown in small, uneven nubs, and its crown is split more than an inch deep, forming a v-like fork. It’s hard not to shiver as you feel three trickles of hot wetness brush your [pc.skinFurScales], hinting at three distinct cumslits adorning the brawler’s manhood.");
	
	output("\n\nSlowly but surely, the wetraxxel slides his huge member down through your crack until its two-pronged crown aligns with the still-gaping hole of your [pc.asshole]. A whimper escapes your lips as the two tips of his cock press into you, easily snagging the opened rim of your back door and spreading you open for the shaft that follows them.");
	pc.buttChange(enemy.biggestCockVolume(), true, true, false);
	
	output("\n\nAs the wetraxxel’s hips start to move, you find yourself shoved up against the wall again, one of his arms firmly planting itself against the back of your shoulders. The other sinks into your [pc.butt], fingers squeezing and pulling at your cheeks. Between his strong hands and his thrusting hips, he keeps you spread wide open as his cock starts to spear you.");
	
	output("\n\nIt’s a wonderfully stretching sensation, feeling that massively long cock sliding into you. This bug is hung more like a bull, and has the strength to back it up! He moves inexorably onwards, shoving inch after inch of cockflesh into your helpless hole.");
	if (pc.tallness <= 66) output(" You feel your stomach bulging, distending to accommodate the tremendous mass of dickflesh.");
	output(" The feeling of penetration seems to never end, as if he’ll be sliding into you for an eternity.... Finally, when you’re sure you can take no more, his relentless advance stops. One of your hands manages to slip down from the rocks, and to your swollen belly full of dick.");
	
	output("\n\nWith a grunt, the wetraxxel shifts his stance and locks a hand onto your [pc.hip], holding you steady. You moan as his plated fingers sink into your ass, squeezing your cheek until you can’t help but clench down hard around his cock with a wail of straining pleasure.");
	
	output("\n\n<i>“You stray too close to my harem,”</i> the bug-man growls, his mouth close enough that you can feel his breath hot against your [pc.ear], <i>“so you must wish to join it. Is that right? I will show you what to expect.”</i>");
	
	output("\n\nAll you can manage is a whimper as the huge bug-man starts to move. He doesn’t hold back, just hauls himself out almost to the tip in one lengthy motion, then slams back again - so deep you can feel his plated balls slapping heavily against your [pc.butt]. You grunt and moan, gasping as his cock rams into you, only to slide out again. Before long his hips are piston-like, hammering your ass with force enough to pound you into the rough rock wall. You feel like the rocks will crumble under the agonizing force of the wetraxxel’s fucking - or you will!");
	
	output("\n\nUnder the constant assault of the forked, insectile cock straining your [pc.asshole], your voice breaks into a series of low and throaty moans. At the apex of a particularly shrill cry of pleasure, you hear your bug-like captor grunt disapprovingly. <i>“Quiet!”</i> he bellows, smacking your ass hard enough to make you cry out. That only seems to annoy him more, as his next thrust into you all but lifts you off the ground.");
	
	if (pc.hasCock())
	{
		output("\n\nYour cock responds to the gut-deep pounding with twitches and spurts, growing to half mast and starting to drool a thick mess of pre down your thighs. You groan and try and grab yourself, but your arm is quickly restrained by your captor, shoved against your back. A whine escapes your lips as you’re reduced to a hands-free climax, having to squirt your load onto the cold rocks only by the force of the wetraxxel’s buttfucking.");
	}
	if (pc.hasVagina())
	{
		output("\n\nYour untouched cunt clenches and drools, begging for some stimulation to match the pleasure burning through your ass.");
		if (flags["WETRAXXEL_SUBMISSION"] >= 4) output(" Your mind floods with unwanted thoughts: what do you have to do do be worthy of being bred by the towering bug-man?");
		output(" You cry out as your body reacts to the hard fucking, sending shockwaves of pleasure through your lower half, from your [pc.asshole] to your [pc.cunt]. Your hole spasms and trickles a weak river of fem-spunk between your [pc.legs], the best it can do without some tender touch to spur it on through your climax.");
	}
	
	output("\n\nWith a final, fearsome roar, the bug-man slams himself in to the balls and unleashes a torrent of cum into your well-fucked ass. You can’t even manage a scream anymore, just a weak moan as your bowels are bloated with wasted seed. You can feel his apple-sized nads churning as they unload, twitching against your battered [pc.butt] until they’re shot every drop of wetraxxel cum deep into your gut.");
	
	output("\n\n<i>“Take this as a warning,”</i> the bug-man grunts, withdrawing himself from your gaping hole. <i>“Do not return here, if you value your freedom.”</i>");
	
	output("\n\nSeemingly satisfied by the punishment he’s meted out, the bug-man turns on a heel and walks away, disappearing into the deeper caves. Woozily, you gather up your [pc.gear] and stumble off.\n\n");

	processTime(40+rand(20));
	pc.orgasm();

	//Return PC to the entrance to the wetraxxel's territory. 
	currentLocation = "1X11";
	flags["WETRAXXEL_SUBMISSION"] += 1;
	clearMenu();
	CombatManager.genericLoss();
}

public function wetraxxelBrawlerPCLossTonguePolish():void
{
	clearOutput();
	wetraxxelBrawlerHeader(true);
	showName("DEFEAT:\nWETRAXXEL");

	//PCs of any gender. Submission 6 or higher.

	output("Growling something under his breath in his guttural, gravelly voice, the wetraxxel grabs you by the top of your head. His smooth, chitinous fingers grasp your scalp and turn your head up, forcing you to look him in the eye. <i>“Again and again, I find you invading my territory,”</i> he grunts, eying you top to bottom with those small black eyes of his. <i>“I threaten you with imprisonment, and you still return. You must enjoy serving me near as much as my harem does...”</i>");
	
	output("\n\nYou’re too");
	if (pc.HP() <= 0) output(" battered");
	else output(" horny");
	output(" to respond, only able to manage a pathetic whine. The wetraxxel grunts contemptuously, forcing you down on your [pc.knees]. <i>“Let us see how able you are to serve me,”</i> he says. <i>“There is still much fire in you... but that can be broken out. Now, I will show you how you will service me.”</i>");
	
	output("\n\nThe wetraxxel takes a step back and sits on an outcropping of rock, peeling off his loincloth and tossing it aside. Your eyes grow wide, drawn to the arm-sized alien member hanging between his legs. It’s long, more so than a human’s cock scaled up for his size, and its crown is split into a two-prong head. Three perfectly circular slits adorn it, one on each prong and a larger in the cleft between them. A hefty set of apple-sized balls hang pendulously beneath his shaft, plated with flexible black chitin. Seeing your gaze locked on his manhood, the wetraxxel gives an approving nod, spreads his legs out, and pats his thigh.");
	
	output("\n\nYou know how this goes by now. You meekly crawl towards your captor until your cheek brushes the inside of his leg, bringing you so close that you’re enveloped in the thick haze of musk wafting up from the brawler’s cock. Your heart hammers in your chest as you near the source of the intoxicating aroma, your mouth slowly opening as you near the crown.");
	
	output("\n\nBefore you can wrap your lips around the wetraxxel’s throbbing, forked crown, his hand tightens around your head. You’re forced upwards, avoiding the hardening shaft and find your mouth coming to rest against the brawler’s lighter-hued chest. <i>“The hunt today seems to have worked up a sweat in me,”</i> he says, and you’re almost sure you can hear him laughing. <i>“It would be unkind of me to return to my wives in such a state. </i>You<i> will clean me.”</i>");
	
	output("\n\nThe wetraxxel pushes your face against his chest, and you find your [pc.tongue] slithering out between your [pc.lips], caressing the smooth plates of the brawler’s chest. You shiver at the strong taste hits you: it’s as if his chitin is covered in a thin veneer of oily slickness, vaguely coconut in taste. You draw your tongue along his chest in a single long stroke, from where a human’s nipples might be up to the collar of his neck. Your captor groans, and his grasp on your head relaxes to an almost affectionate embrace.");
	
	output("\n\n<i>“Continue,”</i> he commands, guiding you back down again. Your tongue rolls out again on cue, lapping across his broad and burly chest again and again, wiping away the thick coating of alien sweat clinging to his chitinous body. Slowly but surely, you tongue bathe the brawler’s chest until it glistens, meticulously cleaning every inch of his rippling muscles and smooth plates. Once he’s sated with your efforts, his hand guides you elsewhere, pulling you into his lap to allow you easy access to his underarms. Despite the more intense taste and growing cloud of heady musk surrounding you - or perhaps because of it - your movements become more intent the more of his arms you clean.");
	
	output("\n\nAs you work, it’s impossible not to take note of the hard shaft pressing against your [pc.leg], firm as diamonds and throbbing with every lick you make. The urge to start bathing it instead is becoming more and more difficult to resist, until with a lustful moan you break your tongue-slathering kiss from one of the brawler’s rippling muscles and slink down from his lap, taking his oversized shaft in both hands. You venture a glance up at your master’s face - <i>master</i>? Why does it feel so <i>right</i> to think that? - and find an approving smirk upon the insectile brute’s black lips.");
	
	output("\n\nYour heart beats a little faster, and your eyes drop back down to the forked crown of the wetraxxel’s cock. Slowly, you lower your well-used mouth towards the alien cockhead and breathe deep of the musky, alluringly masculine aroma. Your tongue lolls out of its own volition, lapping at the base of the wetraxxel’s lengthy shaft. Your hands gravitate to the heavy, plated orbs of his balls, cupping them worshipfully and gently rolling them in your hands. Even through the curving chitin, you can feel just how cum-heavy they are - your master is churning with pent-up seed, waiting to grace your eager lips.");
	
	output("\n\nBetween soft squeezes and rolling his balls between your fingers, you slowly draw your [pc.tongue] along his smooth underside and up towards his alien crown. Smiling lustily up at your captor, your tongue slithers in between the forked crowns on the end of his shaft. You tease and lap at the largest of his three cumslits, shivering at the rich taste of pre gracing its tip.");
	
	output("\n\nThe wetraxxel sucks in a long, low breath as your tongue lavishes his alien cockhead with wet licks and kisses. After a few minutes of this attention, you shift on your [pc.knees] to position your lips around his triple-holed crown. Eagerly, you find yourself sliding down the wetraxxel’s cock, sucking up inch after inch after inch of dickflesh until his prongs are digging into the back of your throat, refusing to bend or budge. Your lips can’t make it to the base of his cock like this, but your efforts have the desired effect regardless of how little you can manage to swallow down at once: the wetraxxel grunts and leans back against the rock behind him, letting you polish his shiny black rod like the well-trained slut you are.");
	
	output("\n\nYour hands wander up from his sack, wrapping around what cockflesh you can’t get your mouth around and start pumping in time with the movement of your lips. Your tongue laps and wraps around his shaft, bobbing your head up and down your master’s cock. Minutes pass in worship of your master’s shaft, suckling and lick and jacking with every ounce of passion you can muster. The rising cloud of musk and lust spurrs you ever onward, driving you into a frenzy of face-fucking; your whole body bobs on his rod, up and down with rhythmic passion.");
	
	output("\n\nIt doesn’t take long like that to feel a sudden tension in the brawler’s cock, and then the surge of seed rising to meet you. Your breath catches as your mouth and throat is suddenly filled with an explosion of hot, sticky wetness. You swallow eagerly, gulping down your master’s bountiful offering as quick as he can give it.");
	
	output("\n\nFinally, coughing and licking at your lips, you’re pulled off his cock and left to slump to the ground.");
	
	output("\n\n<i>“Acceptable,”</i> the wetraxxel grunts, standing and wiping off his cockhead on your cheek. <i>“Now begone from this place. I will not suffer many more of your invasions before more drastic punishments must be given out.”</i>");
	
	output("\n\nSeemingly satisfied by the punishment he’s meted out, the bug-man turns on a heel and walks away, disappearing into the deeper caves. Woozily, you gather up your [pc.gear] and stumble off.\n\n");

	processTime(15+rand(5));
	pc.changeLust(15);

	//Return PC to the entrance to the wetraxxel's territory. 
	currentLocation = "1X11";
	flags["WETRAXXEL_SUBMISSION"] += 1;
	clearMenu();
	CombatManager.genericLoss();

}

public function wetraxxelBrawlerPCVictory():void
{
	clearOutput();
	wetraxxelBrawlerHeader();
	showName("VICTORY:\nWETRAXXEL");

	//Beat dat brawler down. 

	if (enemy.lust() >= enemy.lustMax())
	{
		output("The wetraxxel’s simple loincloth is barely hanging on under the strain of his hardening alien cock. His breath grows heavy and fast, and his steps a little slower. The brawler’s eyes are wholly focused on your sensual movements - in the state he’s in, it’s all to easy for you to sidle on up close to him and, with a few caressing motions, have the brawler eating out of your hands. It’s easy to push him down onto his knees, completely at your mercy.");
	}
	else
	{
		output("With a grunt, the brawler slumps to his knees, leaning heavily against the craggy rockface beside himself. <i>“I yield,”</i> he groans, relaxing his fists into raised hands. <i>“You fight with fire, alien. Fire and honor. Do with me as you will.”</i>");
	}
	output("\n\n");

	clearMenu();

	if (pc.hasCock() && flags["WETRAXXEL_SUBMISSION"] <= 6) addButton(0, "Buttfuck", wetraxxelBrawlerPCVictoryFuckHisButt, undefined, "Buttfuck", "Buttfuck the Wetraxxel.");
	else
	{
		if (!pc.hasCock()) addDisabledButton(0, "Buttfuck", "Buttfuck", "Buttfuck the Wetraxxel. (Requires a cock)");
		else if (flags["WETRAXXEL_SUBMISSION"] > 6) addDisabledButton(0, "Buttfuck", "Buttfuck", "The table is currently too heavily weighted in the brawlers favor...");
	}

	addButton(1, "Ass Ride", wetraxxelBrawlerPCVictoryRideHim, false, "Ride Him - Ass", "Ride the Wetraxxel’s massive cock with your ass.");
	if (pc.hasVagina()) addButton(2, "Vag Ride", wetraxxelBrawlerPCVictoryRideHim, true, "Ride Him - Vagina", "Ride the Wetraxxel’s massive cock with your cunt.");
	else addDisabledButton(2, "Vag Ride", "Ride Him - Vagina", "Ride the Wetraxxel’s massive cock with your cunt. (Requires a Vagina)");

	if (flags["WETRAXXEL_SUBMISSION"] >= 4) addButton(3, "Wank Him", wetraxxelBrawlerPCVictoryWankHim, undefined, "Wank Him", "Jerk the brawler off.");
	else addDisabledButton(3, "Wank Him", "Wank Him", "You are not submissive enough towards the brawler to consider doing this to him...");

	addButton(14,"Leave",CombatManager.genericVictory);
}

public function wetraxxelBrawlerPCVictoryFuckHisButt():void
{
	clearOutput();
	wetraxxelBrawlerHeader(true);
	showName("VICTORY:\nWETRAXXEL");

	//PCs with dicks. Submission 6 or less. 

	output("With a big, bare, burly body on display like that, you feel your lust steadily rising - and your [pc.cock] stiffening");
	if (pc.isCrotchGarbed()) output(" beneath your [pc.lowerGarment]");
	output(". You step slowly over to the defeated bug man, step by step discarding your [pc.gear] to leave yourself bare. The bug man’s eyes go a bit wider when he sees what you’re packing, and he starts to try and scramble back. He comes upon a cavern wall quite quickly, though, leaving him nowhere to go. With a grunt, the brawler seems to submit himself over again, and doesn’t try to escape any further.");
	
	output("\n\nYou grin down lecherously at him, wrapping your finger around your own sex and starting to slowly stroke yourself. <i>“On your hands and knees,”</i> you command, motioning towards the cavern floor. Eyeing you warily, the wetraxxel does as you command, rolling onto all fours digging his plated digits into the dusty ground. Much better!");
	
	output("\n\nYou spit into your hand, rolling it around in your fingers before grabbing a handful of the brawler’s ass. He sucks in a sharp breath and lets it out with a gravel-voiced groan as you reach down and press one of your slick fingers against his tight little ass. You’d almost think he’s a virgin, the way he groans and pushes back. He’s tight enough for it, too...");
	
	output("\n\nEasing your finger into him is slow, hard work. No amount of lube can make up for the way he’s clenching, but that just makes your lubing him up all the sweeter. You take your time on it, making sure the lube-job is absolutely perfect - and taking no small amount of pleasure in seeing his huge alien cock, the strange two-pronged beast that is is, start to swell under his shaggy loincloth. It’s easy enough to rip the cloth away, leaving him as nude as you are, completely vulnerable to your ministrations.");
	
	output("\n\nFeeling satisfied with your efforts, you slowly withdraw your finger from the wetraxxel’s ass. It comes out with a wet pop, leaving the tight hole between his muscular cheeks ever so slightly agape. He’s splayed perfectly apart in eager readiness for your cock.");
	
	output("\n\nYou slap your hand against his plated ass, rubbing the smooth chitin and sliding down onto your [pc.knees] behind him, leaving your crotch level with his behind. A smile twitches its way across your [pc.lips], your eyes drawn down to the throbbing mass of half-erect alien cock hanging between his legs. Before you partake of the main treat, you slip your hand down his curving chitin plates to cup his heavy nads, rolling the meaty balls between your fingers before starting to caress the base of the shaft.");
	
	output("\n\nBetween strokes of the wetraxxel’s shaft, you grab your own [pc.cock] with your other hand and press the trip into the slowly closing ring of the brawler’s ass. He grunts, looking at you over his shoulder, but your [pc.hips] push inexorably onwards.");
	
	if (pc.biggestCockLength() <= 16)
	{
		output("\n\nThe lubed-up ring of the wetraxxel’s ass caves in, resisting for only a split second before yielding to your steadfast advance. The brawler lets out a guttural curse, fingers digging into the dusty earth. For your part, you groan in pleasure as your [pc.cock] pushes into the vice-tight channel of the alien’s asshole. It’s agonizingly slow going, his ass clenching so hard that you’re reduced to a snail’s pace. But sinking your cock into that wonderfully hot hole makes every second more than worthwhile - especially when you see his own shaft grow to full hardness in your hand, drooling pre onto the ground while your shaft caresses his prostate.");
	
		output("\n\nThe way he groans and shifts his weight back against you, you’d almost think the big man’s enjoying it!");
	
		output("\n\nYou give him a smack on the ass and tell him as much, earning a look of loathing from him over his shoulder. Grinning at him, you start to move a little faster, stroking his lengthy black cock and rocking your hips in as close to tandem as you can manage. If nothing else, that gets him clenching tight around you again, making it pleasurably hard to move.");
	
		output("\n\nEventually, though, he starts to loosen up - enough that you can start to really move, at least. You pick up the pace, alternating between thrusts and strokes. Your captive wetraxxel groans, buckling under your hammer-blow hip-thrusts; his cock throbs powerfully in your fingers. The black insectile rod starts to swell, its two-pointed crown starting to twitch and drool out a little pool of precum beneath his chest.");
	
		output("\n\nWith a sudden gasp, the bug-man’s entire body tenses around you... and a geyser of cum squirts from his three slits, spraying out between his splayed hands in a tidal wave of musky seed. Your eyes go wide with surprise as the wetraxxel unleashes a torrent of spunk across the cave floor, and his ass clenches down on you tighter than ever before. The whole passage of his asshole writhes as his body is wracked by climax, pulling you over the edge with him.");
	
		output("\n\nYour [pc.cock] throbs, straining the wetraxxel’s ass one last time before busting its nut with a violent squirt that bastes his bowels in [pc.cumNoun]. Your spasming bug-man lets out a grunting gasp when he feels your shot of hot seed spill into him, filling him as fast as he can empty his own balls onto the dusty ground.");
	
		output("\n\nA minute passes after that, both of your panting heavily as your orgasm passes, leaving your cocks drooling the remnants of your climax. Finally, with a grunt of effort, you rock back and withdraw your dong, letting it pop out of the wetraxxel’s well-fucked ass. The moment you’re out of him, the oversized bug collapses face-first into the dirt.");
	
		output("\n\nYou chuckle, patting his muscular flank as you gather your gear and head out. Somehow, you doubt he’ll be happy to see you the next time...");
	}
	else
	{
		output("\n\nAfter a few agonizing moments, though, you come to the conclusion that your massive prick just isn’t going to fit. The bug-man’s much, much too small for your prodigious girth no matter how you try to wrangle it. With a grunt of frustration, you abandon that attempt, and start to approach the problem from another angle; you grab the brawler’s hips and thrust in hard against his backside. Your cock glides along the crack of his ass, trapped between two smooth-plated cheeks that you’re pushing fiercely together.");
	
		output("\n\nHe doesn’t have the biggest ass in the galaxy, but it’s firm and strong. They clench hard around your [pc.cock], holding your length tight enough to send shivers of pleasure through your body with every thrust. You pound away at him, harder and faster, grinding through the tight crack on offer until your cock is trembling with rising need. Sure, it’s not as good as a proper assfucking, but hotdogging the wetraxxel’s muscular rump is as close a second as you’re going to get.");
		
		output("\n\nWith a roar of pleasure, you let yourself go - utterly surrendering to the pleasure. You buck your [pc.hips] against his butt as hard as you can, going along with the thunderous pleasure rocking your body until your cock erupts in a geyser of [pc.cumNoun], spraying hot seed across the towering bug-man’s back. Rivulets of spunk trickle down onto his ass, down through his crack and slathering your [pc.cock] in your own drooling spunk.");
		
		output("\n\nYou let out a heavy sigh and sit back, dragging your dick through his crack one last time before letting it flop clear. The bug-man grunts, looking back at you with his black insectile eyes before grabbing his loincloth and stalking away in silence. You just smile to yourself, basking in the afterglow...");
	}

	processTime(20+rand(15));
	pc.orgasm();
	if (flags["WETRAXXEL_SUBMISSION"] > 0) flags["WETRAXXEL_SUBMISSION"] -= 1;
	clearMenu();
	output("\n\n");
	if (CombatManager.inCombat)	CombatManager.genericVictory();
	else addButton(0, "Next", mainGameMenu);
}

public function wetraxxelBrawlerPCVictoryRideHim(useVag:Boolean = false):void
{
	clearOutput();
	wetraxxelBrawlerHeader(true);
	showName("VICTORY:\nWETRAXXEL");

	//vagOrAss. Any Submission.

	var holeTag:String;

	if (useVag) holeTag = "[pc.cunt]";
	else holeTag = "[pc.asshole]";

	var holeTightness:Number;
	if (useVag) holeTightness = pc.gapestVaginaLooseness();
	else holeTightness = pc.ass.looseness();

	output("Your eyes wander across the beaten brawler’s huge and muscular body, across smooth chitinous curves and fanged mandibles, down to the simple loincloth covering his groin. The cloth is tenting under your intent gaze, giving way until his alien member peeks out from underneath it. You give the bug-man a gentle push onto his back: he goes down with a solid, heavy sound that echoes through the dark caverns. His loincloth flops out of the way, revealing the full length of his member: a strange and over-long appendage, crowned with a distinctly forked crown that bears a trio of dark slits.");
	
	output("\n\nYour curiosity mixes with arousal, spurring you to get down on your [pc.knees] and wrap your fingers around his lengthy manhood. The wetraxxel’s cock throbs in your grasp, twitching in time to his thunderous heart beat, and his forked crowns swell with a rush of excitement. As he reaches full hardness under your experimental strokes, you can see he’s easily bigger than a human ought to be, even proportionally: he’s close to the length of your arm, though not quite as thick around.");
	
	output("\n\nIt’s hard to resist the urge to just spear yourself on that monstrous rod of his on the spot. Instead, you summon up the willpower to push his shaft back, down against his muscular gut. You follow it down, lowering yourself over him and letting your tongue loll out and along the underside of his manhood. Your captive bug groans, his body shifting into the path of your tongue until you’re licking through the valley between his pair of twitching crowns.");
	
	output("\n\nThis close to the prostrated warrior bug, you find yourself submerged in a cloud of masculine musk - the mixing smells of sweat and desire that hammer at your nose until your find your mouth opening wide around his crown. You swallow it down with gusto, slurping down inch after inch of black, smooth alien cockflesh until his brace of points batter the back of your throat. Moaning throatily, you let your tongue lap and caress the bug’s underside and back up to his crown as you bob your head back - and down again.");
	
	output("\n\nAs you move, the burly bug-man’s hands slip down your body, pulling at your [pc.gear]. You give him an approving nod, letting him start to peel your gear off of you, piece by piece until he’s got you completely bare");
	if (flags["WETRAXXEL_SUBMISSION"] >= 6) output(" and worshipping his cock, firmly planted in your rightful place");
	output(". With your [pc.lips] wrapped around the brawler’s cock, you’re left in the perfect place to look up across his broad chest and look into his black eyes at the apex of a suck. His cock throbs powerfully in your mouth, drooling a salty-sweet trickle of hot pre against your lips.");
	
	output("\n\nBefore it’s too late, you pull yourself off the delectable black cock you’ve been feasting on and sidle up to the wetraxxel’s waist, planting your [pc.knees] on either side of his body. Your captive bug-man looks up at your with a wry grin etched upon his mandibles, taking in the beauty of your naked body. While he’s busy gawking, you lick a pair of fingers and slip them down to your "+holeTag+", caressing the");
	if (useVag) output(" lips");
	else output(" rim");
	output(" of your");
	if (useVag) output(" pussy");
	else output(" ass");
	output(". One of your fingers glides in easily, teasing your tender muscles and spreading the coating of spit around. With a cock as big as the wetraxxel’s, every bit of lube is going to help for what you have in mind.");
	
	output("\n\nA moan escapes your lips, spurred on by the wonderful pleasure even a lone finger can bring while you’re so mind-numbingly horny. Finally, you can’t stand it anymore, and grab the brawler’s cock. He grunts, back rising from the stone floor while you angle his hefty member towards you. You have to stand way up to get his lengthy alien cockhead angled with your "+holeTag+". The forked heads press against your hungry hole, spreading you further open the more you press down on them until his crown is buried in your");
	if (useVag) output(" cunt");
	else output(" ass");
	output(".");
	if (useVag) pc.cuntChange(pc.biggestVaginaIndex(), enemy.biggestCockVolume(), true, true, false);
	else pc.buttChange(enemy.biggestCockVolume(), true, true, false);
	
	output("\n\nYou chew on your lip, trying to stifle a cry of pleasure as you sink down on the pillar of wetraxxel cockflesh. It’s an effort not to scream out, letting your voice echo through the corridors and announcing your ecstasy to the world. The wetraxxel makes that decision for you, grabbing your [pc.hips] and yanking you down on his rod: you can’t help but scream as he tries to ram a foot of cockflesh into the straining");
	if (useVag) output(" lips");
	else output(" ring");
	output(" of your "+holeTag+".");
	
	output("\n\nYour wrest yourself out of his grip and bat the brawler’s strong hands away from your waist. You get the feeling he’s just going along with it, allowing you to have your way with him. Smirking down at him, you figure you might as well take advantage of his acquiescence. You plant your hands on his plated chest and use it as support to start pulling yourself up and off his body. Shivers wrack your pleasure-sensitive body in response to his strange, thick, two-pointed prick dragged back through your "+holeTag+" and rubbing against your tenderest parts. It’s hard to really bounce on the wetraxxel’s cock, massive as it is, so much as you’re able to rise and fall along his length, taking him as deep as you dare each time,");
	if (holeTightness < 5) output(" but never quite to the base of his tremendous shaft.");
	else output(" swallowing more and more cockflesh into your eager hole with every motion until you can feel your partner’s big, heavy balls pressing into your [pc.butt].");
	
	if (pc.hasCock())
	{
		output("\n\nYour own [pc.cock] throbs, bouncing against the brawler’s belly with every wannabe-bounce you make. Pre is starting to bead on your [pc.cockHead], drooling onto the chitinous belly beneath you. ");
	}
	else output("\n\n");
	output("Stretching your body to the limit, it doesn’t take long for the gut-straining alien cock to bring you agonizingly close to orgasm. Your motions become faster and faster, almost frenzied - your body becomes ever more hungry for the brawler’s cock, hammering down on his hips until you’re groping at your [pc.chest] and moaning loud enough to let anybody in the caves hear you for miles around.");
	
	output("\n\nThe wetraxxel joins you with a gruff grunt of pleasure, and a sudden flood of wet heat into your "+holeTag+" as he cums. With one final push, you take him as deep as you can and surrender yourself to pleasure, letting orgasm wash over you in tidal waves of ecstasy. Your "+holeTag+" clenches powerfully around the wetraxxel’s dick, milking his hot seed out with your every orgasmic motion.");
	if (useVag) pc.loadInCunt(enemy, pc.biggestVaginaIndex());
	else pc.loadInAss(enemy);
	
	output("\n\nWhile you cum, you feel the brawler’s hands wrap around your hips, holding you steady until your climax has passed, and you slump down against his chest. You find your cheek resting against the lighter plates of the brawler’s abs while you catch your breath, letting the wetraxxel’s cock slowly wilt and slide out of you, leaving a sticky trail of seed that clings to your thighs. You slip off to sleep, held tight against the insectile brute’s chest");
	if (flags["WETRAXXEL_SUBMISSION"] >= 6) output(", right where you belong...");
	output(".\n\n");

	processTime(30+rand(15));
	pc.orgasm();
	if (flags["WETRAXXEL_SUBMISSION"] > 0) flags["WETRAXXEL_SUBMISSION"] -= 1;
	clearMenu();
	CombatManager.genericVictory();
}

public function wetraxxelBrawlerPCVictoryWankHim():void
{
	clearOutput();
	wetraxxelBrawlerHeader(true);
	showName("VICTORY:\nWETRAXXEL");

	//PCs of any gender. Submission 4+.

	output("You may have beaten the brawler, but after all the times he could have killed you for your trespasses - much less taken you in for a life of sexual slavery - you feel you owe the towering bug-man a little respect. And maybe a little service, too. You slowly approach the wetraxxel, stripping out of your [pc.gear] until you’re as naked as he is. Except for that pesky loincloth, anyway. His small black eyes regard you with cool curiosity while you strip, softening when you start to approach.");
	
	output("\n\n");
	if (flags["WETRAXXEL_SUBMISSION"] >= 6) output("<i>“You’re learning your place,”</i> the wetraxxel grunts, an oddly approving tone in his voice that sends a shiver of happiness through your increasingly submissive brain. ");
	output("You slink down onto your hands and [pc.knees], gently nudging the wetraxxel’s knees apart to reveal the thick brown strip of his loincloth. You eagerly lift the obstructing bit of cloth, revealing the soft shaft of chitinous bug-dick beneath it. Licking your lips, your toss the loincloth aside and urge the wetraxxel to sit up on an outcropping of rock, facing you with legs spread.");
	
	output("\n\nOnce the towering bug-man has complied, giving you absolute access to his over-sized alien schlong, you take the lead. Your hands slide up his chitinous thighs, drawing yourself inexorably towards his crotch. Your fingers reverently cup the plated orbs of the brawler’s balls, rolling the churning sack around in your fingers. They’re like a pair of apples, swollen and thick with unspent seed, awaiting a fertile hole to sow.");
	if (pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG) == -1) output(" You may not have one of those, but you’re sure your lips will make a more than adequate substitute");
	else output(" For now, though, you’re sure he’ll be able to make do with your lips instead. You did win this time, after all");
	output("...");
	
	output("\n\nSubjected to your teasing hands, the brawler bug grunts with pleasure. His plated fingers dig into the rock, and his mammoth shaft stirs before your eyes. You watch with glee as the pronged crown of the wetraxxel’s dick starts its slow but inexorable journey towards your [pc.lips], the three slits on its head looking like dark little eyes gazing down upon you. After a moment’s restraint, your willpower seems to evaporate as the alien prick draws nearer, bringing with it the thick and musky odor of masculinity you’ve come to crave.");
	
	output("\n\nReverently, you open your [pc.lips] and reach out with your [pc.tongue], licking across the valley of fleshy cockhead. Between your tongue’s caress and your hands’ worshipful groping of his sack, the wetraxxel can’t suppress a groan of pleasure. His cock rises faster, meeting your lips and parting them with practiced ease. You barely have time to blink before his pronged cockhead is battering the back of your throat, and one of his strong hands is on top of your head trying to force you down on more of his monumental man-meat.");
	
	output("\n\nYou put up a token resistance to his efforts - just enough to say <i>“I’m in charge this time”</i> - before sliding your head as deep down his cock as you can. The pronged cockhead refuses to bend with your throat, battering against the back of your mouth until your tonsils are slathered with a thick glaze of salty-sweet alien pre. The length of cockmeat you can’t swallow down earns the attention of your hands, pumping his shaft from the balls and base all the way to your lips.");
	
	output("\n\nYour eyes wander up to the brawler’s, across his mandibled maw and slender antennae, to the small black eyes set deep on his chitined face. His four jaws contort into something that might be a smile, and his large hand caresses the top of your head. You can feel he’s getting close to the edge already, his cock throbbing and twitching with every stroke.");
	
	output("\n\nIt doesn’t take much more to push him over.");
	
	output("\n\nThe wetraxxel’s voice comes as a low, graveley grunt that punctuates the silence. His back arches into you, and his cock swells with a sudden surge of seed. You have just enough time to brace for it before the brawler’s orgasm hits you like a tidal wave, flooding your belly with an unstoppable deluge of spunk. You’re forced to swallow as fast as you can to keep up with the torrent, feeling like your whole body is bloating as the apple-sized nuts between the wetraxxel’s legs completely empty into your gut.");
	if (pc.bellyRating() >= 16) output(" And you thought your belly was straining before...");
	pc.loadInMouth(enemy);
	
	output("\n\nFinally, the huge bug-man’s orgasm abates. You slide off his cock like a well-used condom, flopping to the ground and drooling spunk from your [pc.lips]. Now that’s a meal you wouldn’t mind getting seconds of...");
	
	output("\n\nThe brawler grunts and leans back against the rockface, looking completely exhausted. While he recovers, you take the opportunity to crawl off and collect your gear, trying not to move too quickly for fear of all that cum in your belly sloshing around...\n\n");

	// something about cumflation
	pc.maxOutCumflation("mouth", enemy);

	processTime(30+rand(15));
	pc.orgasm();
	if (flags["WETRAXXEL_SUBMISSION"] > 0) flags["WETRAXXEL_SUBMISSION"] -= 1;
	clearMenu();
	CombatManager.genericVictory();
}

public function wetraxxelBrawlerBadEnd():void
{
	clearOutput();
	wetraxxelBrawlerHeader(true);
	showName("BAD END:\nWETRAXXEL");

	output("<i>“You refuse to learn,”</i> the wetraxxel’s familiar, grinding voice booms throughout the caves, sending reverberations shivering up your spine. You meekly look up as the towering, ten-foot-tall bug-man approaches you with his hands firmly locked behind his back.");
	
	output("\n\nWith a grunt of disgust, the brawler grabs you by the scruff of the neck, forcing you to look up at him. <i>“Or perhaps you have? I beat you again and again, and still you return to be beaten and used for my pleasure once again. Do you like it?”</i>");
	
	output("\n\nYou hesitate a moment, unsure what to say to a question so poignantly posed. The brawler stares down at you, his small insectile eyes cold and unreadable; his grip is firm around your neck, inviting no refusal.");
	
	output("\n\nAfter a long moment, you force yourself to nod. You can’t lie to yourself, much less the masterful man towering over you: you’ve come to enjoy the feeling of utter submission, the forceful surrender and the mind-blowing pleasure you’re rewarded with every time you cross his path. Your");
	if (pc.hasCock()) output(" [pc.cock] instinctively stiffens at the thought of another rough fucking at the brawler’s hands.");
	else if (pc.hasVagina()) output(" [pc.cunt] flushes with an uninvited onset of arousal, starting to soak your thighs at the thought of another brutal fucking at the brawler’s hands.");
	else output(" skin flushes with unbidden arousal, eagerly anticipating another rough fucking from your insectile lover.");
	
	output("\n\nSeeing you nod, the huge wetraxxel grunts and grabs your [pc.gear], stripping you down of all your equipment before he hooks his arms under yours and hefts you up off the ground. You yelp, expectations of sex flipped on their heads as you’re throwing over the brawler’s shoulder like a sack of grain. <i>“No more of your foolishness, then. I tire of having to beat you to give you what you want.”</i>");
	
	pc.removeAll();
	
	output("\n\nYou can’t deny that skipping that particular flavor of foreplay wouldn’t be the worst thing in the world... but something in the wetraxxel’s voice carries a hint of menace in it. You can’t summon up the will to struggle, though: not with your lusts running rampant through you, and his strong, plated hand resting suggestively against your [pc.butt].");
	
	output("\n\nThe wetraxxel starts to walk, carrying you through the darkened caves with a sure and steady gait. It takes only a few minutes for you to arrive at a large door set into the western-most part of the cavern wall, which he opens with a key previously secreted on his body. The door slides open, revealing a large and wide-open chamber ahead. The room looks to have been carefully excavated, creating a circular basin some five feet below the door connected by a simple set of stairs.");
	
	output("\n\nThe room would be fairly unremarkable, were it not for the dozen writhing bodies splayed out on the covering of pillows and blankets across the glistening stone floor.");
	
	output("\n\nSeveral chitinous, insectile girls perk up at your arrival. The sounds of sexual bliss abates as the harem’s master makes his triumphant return with you in tow. He sets you down with surprising gentleness, planting you on your [pc.feet] and facing his several wives.");
	
	output("\n\nThe harem girls look nothing like their master: small even by human standards, every one of them lithe and attractive. Most have small breasts, budding out between gaps in their chestplates; a few are extraordinarily buxom, letting other girls rest their heads against their pillow-like chests. Some of them click their mandible-like mouths at you, while others smile with an unexpected warmth, beckoning you closer.");
	
	output("\n\nYour wetraxxel master gives you a push towards the women filling the chamber, and turns back to the door. You knew what was coming, but still, your heart seems to fall in your chest when you hear the meaty <i>ka-chunk</i> of the door’s lock settling into place. You’re trapped, naked, and completely at the wetraxxels’ mercies.");
	
	output("\n\nAfter a tense moment, a powerful feeling of vulnerability settles over you. Every set of black, featureless insect-eyes is on you now, waiting for... something. You don’t know what to do, until the alpha male gives you another soft push towards the women. Slowly, you walk towards them, finally working up the courage to introduce yourself - and hoping your translators get the message across.");
	
	output("\n\nThe girls smile, and several of them says variations of <i>“Hello, [pc.name].”</i> As they speak, a few stand and slip towards you. Their movements are subtly sensual, smooth hands reaching out to caress you and draw you into the orgiastic pile of your new master’s wives. You’re pulled sweetly down onto the covering of cushions that coat the floor, rolled onto your back with gentle hands playing all over you. Your master strides over to you, looming over your prostrate form with a look of immense satisfaction across his mandibled mouth.");
	
	if (pc.cocks.length == 1)
	{
		output("\n\nThe brawler looks you up and down with an appraising eye, before settling on your [pc.cock] hanging half-erect between your legs. After a moment’s thought, he strides away from you, over to a small chest against the far wall. He rustles through it, retrieves something, and returns. Your eyes are drawn to a small metal cage. Grinning, the brawler reaches down and grabs your [pc.cock]. You suddenly realize what’s about to happen, and a panicked struggle ensues; his wives manage to both calm and restrain you, preventing your from putting up more than a token resistance as the hulking bug-man cages your prick. A little whine escapes your throat as your cock is encased in cold, unrelenting metal, completely shut-off from all sexual stimulation.");
	
		output("\n\nSomething tells you this addition’s going to be permanent.");
	
		output("\n\n<i>“My wives are my own,”</i> he states, matter-of-factly. You have not earned the right to breed with them. Is this understood?”</i>");
	
		output("\n\nYou nod. You suppose you didn’t need to use your cock after all - your [pc.vagOrAss] will more than suffice to pleasure your insectile lover.");
		
		pc.lowerUndergarment = new PlainBriefs();
		pc.lowerUndergarment.longName = "iron chastity cage";
		pc.lowerUndergarment.description = "a iron chastity cage";
	}
	else if (pc.cocks.length > 1)
	{
		output("\n\nThe brawler looks you up and down with an appraising eye, before settling on your [pc.cocks] hanging half-erect between your legs. After a moment’s thought, he strides away from you, over to a small chest against the far wall. He rustles through it, retrieves something, and returns. Your eyes are drawn to a handful of small metal cages. Grinning, the brawler reaches down and grabs the largest of your cocks. You suddenly realize what’s about to happen, and a panicked struggle ensues; his wives manage to both calm and restrain you, preventing your from putting up more than a token resistance as the hulking bug-man cages the first of your pricks. A little whine escapes your throat as your cock is encased in cold, unrelenting metal, completely shut-off from all sexual stimulation. Your second cock is given the same treatment");
		if (pc.cocks.length == 3) output(", and the third");
		else if (pc.cocks.length > 3) output(" and all the others");
		if (pc.cocks.length >= 3) output(" after it");
		output(".");
	
		output("\n\nSomething tells you this addition’s going to be permanent.");
		
		output("\n\n<i>“My wives are my own,”</i> he states, matter-of-factly. You have not earned the right to breed with them. Is this understood?”</i>");
		
		output("\n\nYou nod. You suppose you didn’t need to use your cock after all - your [pc.vagOrAss] will more than suffice to pleasure your insectile lover.");
		
		pc.lowerUndergarment = new PlainBriefs();
		pc.lowerUndergarment.longName = "iron chastity cage";
		pc.lowerUndergarment.description = "a iron chastity cage";
	}
	
	if (pc.hasVagina())
	{
		output("\n\n<i>“You belong to me now,”</i> the brawler says sternly, looking down upon you with satisfaction. <i>“Your </i>womb<i> belongs to me. I will breed you again and again, like all my other wives.”</i>");
	
		output("\n\nReaching down to grab your cheek, the brawler looks you in the eye and says again, <i>“You’re mine now.”</i>");
	}
	
	output("\n\nSlowly, confidently, the wetraxxel sheds his simple loincloth. His huge, heavy cock is already half-hard, and the sight of it sends the women surrounding you into a lustful frenzy. Several of them crawl up towards their husband, fawning over his lengthy shaft with hands and mouth. Every one of them seems eager for a taste, and their caresses quickly bring the bug-man to full hardness.");
	
	output("\n\nHis eyes aren’t on his wives, though: they’re on you, utterly and completely. Your skin flushes darkly, and you find your");
	if (pc.hasLegs()) output(" [pc.legs] instinctively spreading out");
	else output("self instinctively bending over");
	output(" invitingly for your master. You relax as much as you can given what’s happening to you, completely surrendering to the wetraxxel as he mounts you, planting his knees around your [pc.hips] and aligning his two-pronged crown with your [pc.vagOrAss]. Right where it belongs.");
	
	if(pc.hasVagina()) pc.cuntChange(0, chars["WETRAXXEL BRAWLER"].cockVolume(0), false);
	else pc.buttChange(chars["WETRAXXEL BRAWLER"].cockVolume(0), false);
	
	output("\n\nNow, and for the rest of your life.");
	
	processTime(25 + rand(16));
	
	badEnd();
}
