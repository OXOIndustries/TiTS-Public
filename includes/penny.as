//ZIL_PROBLEM_DEALT_WITH

/*Notes:
Short, silky-smooth fur.
Hair is a close-cropped and auburn (reddish-brown) mohawk.
Blue eyes
Big Ol’ Ears with very keen hearing.
Ears are sensitive, loves having them played with.
Shy about how good her ears feel.
DD-cup tits.
Pink, puffy, Inverted nipples.
Nipples pop out like lil’ turkey timers.
Pink pussy with a very tiny, almost unnoticeable clit.
Wetness is good enough for easy lubing but doesn’t squirt or anything.
The outer lips are nice, large, and puffy, while her inner labia are small enough that you can barely see them through Penny’s swollen mound.
Lithe and quick.
Five foot even in height.
About 115 lbs in weight.
Former asian (of japanese ancestry) human who took out loans and a shitty but high paying post to pay for her splices.
She is literally a furry taken to the scifi extreme.
Very business-like most of the time. Doesn’t like the planet and is a little lonely since she’s only been there a short time.
Very predatory and femdommy in the bedroom. She does have a submissive side when surprised.
Likes to call her lovers prey when being dommy and beasts or predators when subbing.
Uses tonfas for weapons.
Is Asian. Has Asian last name: Inoue
*/

function pennyAffection(arg:int = 0):Number {
	if(flags["PENNY_AFFECTION"] == undefined) flags["PENNY_AFFECTION"] = 0;
	if(arg != 0) flags["PENNY_AFFECTION"] += arg;
	if(flags["PENNY_AFFECTION"] > 100) flags["PENNY_AFFECTION"] = 100;
	else if(flags["PENNY_AFFECTION"] < 0) flags["PENNY_AFFECTION"] = 0;
	return arg;
}

function pennysOffice():void {
	pennyRoomDesc();
}

//First Encounter
//Appended to room description!
function pennyRoomDesc():void {
	this.userInterface.showBust("PENNY");
	if(flags["ZIL_PROBLEM_DEALT_WITH"] == undefined) {
		if(flags["MET_PENNY"] == undefined) {
			flags["MET_PENNY"] = 1;
			output("\n\nBehind the desk, sits a female... fox-girl? She’s definitely a girl, or at least very feminine, judging by the DD-cup bosom, barely constrained by her white wrap and loose, open black vest. An armband stamped with the words “U.G.C. Peacekeeper” adorns her right arm, marking her as a source of law on this backwater planet. The frown she’s giving you is spread across a vulpine muzzle, her blue eyes narrowed as she sizes you up. Two pointed ears swivel like radar dishes, each almost as large as her head. A quarter of the way up those ears, a close-cropped, auburn mohawk sweeps back towards the nape of her neck. With ears like that, her species seems closer to the fennec foxes of earth, almost perfectly so.");
			output("\n\n<i>“Something I can help you with, " + pc.mf("Mister","Miss") + "... ?”</i>  the law woman asks.");
			output("\n\nReturning her level gaze, you realize that the seated fennec is remarkably short. She can’t be any taller than five feet standing up! You inform the short, chesty fennec that you were merely getting to know the town and to introduce yourself to the locals.");
			
			output("\n\nThe police lady runs an sandy-furred hand through her mohawk, clearly exasperated. <i>“I guess you’re new here, huh?”</i>  With no better response, ");
			if(pc.isNice()) output("you nod");
			else if(pc.isMischievous()) output("you shrug noncommittally");
			else output("you smirk and tip your head");
			output(".");
			
			output("\n\nShe continues, <i>“Well, I’m Penny, and I’m what passes for the law out here. I keep things civil and legal. At least, as civil as they can be, given the current collection of laws we call civilization. Lucky for me, Flahne’s got an eye for paperwork, so between the two of us, we’ve cobbled together a few local statutes to keep things running smooth here.”</i>  Penny begins to tic off her fingers as she rattles off a list of regulations, inadvertently showing off clawlike nails and padded fingertips. <i>“No murdering anybody. No killing the locals, at least, not if you can help it. Don’t start fights. Don’t rape nobody, and most of all, don’t piss off Penny. Consider that your education. Any questions?”</i> ");
			
			output("\n\nWell, that was... simple.");
			output("\n\n<i>“Look, just use your common sense and you’ll do fine. I’ve got my hands full trying to keep the Zil from running us out of town. And I’d rather not have to spend time scraping anybody off the floor at Burt’s or wasting time when one of you decides to kill the other,”</i>  Penny huffs.");
			output("\n\nShe sounds like she has her hands full. Is there something you’d like to ask her?");
		}
		//Repeat Pre-Problem Encounter
		else {
			output("\n\nPenny is sitting behind her desk like normal. Scratching at the fur under her overlarge ear in consternation, the busty fennec fox is grumbling at some notes. She looks to be having a problem with the locals.");
		}
		this.userInterface.addButton(0,"Need Help?",askPennyIfSheNeedsHelp);
	}
	//Friendly penny
	else if(flags["SEXED_PENNY"] == undefined) {
		output("\n\nPenny is seated behind her desk and typing away at a cheap terminal. She seems pleased to see you here, flicking a warm smile your way before turning back to her work.");
		this.userInterface.addButton(0,"Approach",approachFriendPenny);
	}
	//Girlfriend penny
	else {
		//Non-Futa
		//Appearance blurb: 
		if(!penny.hasCock()) output("\n\nPenny is hard at work as ever, though once you enter, she flashes a knowing smile in your direction. She doesn’t stop working for you, however. The gene-spliced fennec seems content to leer at you from time to time, getting a bit of a show at her job.");
		//FUTA!
		//Appearance Blurb: 
		else output("\n\nPenny is hard at work as ever, though once you enter, she flashes a knowing smile and a brazen leer in your direction. Her nipples are so hard that they’ve popped out and become visible through her bra and wrappings, though given that she’s packing sex organs for two, you suppose it makes sense. The fennec tries her best to keep working in spite of her rampant hormones.");
		this.userInterface.addButton(0,"Approach",approachGirlfriendPenny);
	}
}

//[Need Help?]
function askPennyIfSheNeedsHelp():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("<i>“I’ve got two Zil locked up out back. High Command doesn’t care what I do with them, and Flahne is too busy trying to suck golf balls through garden hoses. The Zil just keep dosing me with their pheromones, trying to fuck me whenever I try to talk them.”</i>  Penny pulls a hand out from under the waistband of her pants and wipes her moist digits off on a damp rag, alerting you to a clearly feminine scent. <i>“I’m trying to get some kind of sensible communication established, but all I’ve wound up with is sticky fingers. The morons that go prancing out into the jungle know more about these waspy bastards than me.”</i> ");
	output("\n\nHuge ears pivot towards you a moment before Penny glances back your way. <i>“You’re one of those crazies aren’t you? From what I hear, when the Zil aren’t in their villages, they’re pretty much rutting. So the long and short of it is that I’ve got two sex-crazed insects both trying to fuck the nearest hole, and if I want to figure out what they want, I’ve got to walk into a literal hornet’s nest.”</i> ");
	output("\n\nPenny steeples her fingers in thought. <i>“I can’t keep them captive forever...”</i>  She shakes her head. Her gaze is directed down at the desk, so absorbed in her problem that she’s no longer talking to you.");
	output("\n\nYou could offer to beat the lust out of them yourself, or let them sate themselves on your body. You could also just suggest she get an intercom. Or you could always leave and worry about it later. What do you do?");
	processTime(2+rand(3));
	//[Fuck Zil] [FightThem] [Get an Intercom]
	this.userInterface.clearMenu();
	this.userInterface.addButton(2,"Get Intercom",getAnIntercom);
	this.userInterface.addButton(0,"Fuck Zil",fuckTheZilForPennyBecauseYouAreADumbStupidSlut);
	this.userInterface.addButton(1,"Fight Them",fightDemZil);
	this.userInterface.addButton(14,"Leave",mainGameMenu);
}

//[Get an Intercom]
function getAnIntercom():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("You suggest she toss an intercom into the cell and save herself a lot of time and effort.");
	output("\n\nPenny sighs. <i>“Don’t you think I thought of that? The primitives don’t even know what to do with them. The first ’com got smashed on the wall. When I tried giving them a baby monitor, they just kept trying to get me to come fuck them, and they promised they’d tell me everything I needed to know...”</i>  She shakes her head. <i>“No, I need to solve this in a way that doesn’t end with me on my back.”</i> ");
	//Same menu
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Fuck Zil",fuckTheZilForPennyBecauseYouAreADumbStupidSlut);
	this.userInterface.addButton(1,"Fight Them",fightDemZil);
}

//[Fuck Them]
function fuckTheZilForPennyBecauseYouAreADumbStupidSlut():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	if(pc.isNice()) output("<i>“Why don’t I just fuck them until they’re spent, and you can interrogate them after they can’t get it up anymore?”</i> ");
	else if(pc.isMischievous()) output("<i>“What if I tire out the little bugs for you... you know, sexually,”</i> ");
	else output("<i>“Quit being a pussy. I’ll go fuck them so they’ll calm down and you can interrogate them,”</i> ");
	output("  you offer.");
	
	output("\n\nPenny perks up at your words. <i>“You know, that just might work, but aren’t you worried about, you know, picking up some kind of disease?”</i> ");
	//[Explain] [FlirtItOff] [Nevermind(Back)]
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Explain",explainWhyYoureAHugeSlut);
	this.userInterface.addButton(1,"FlirtItOff",flirtySlutPCsTellPennyFlirts);
	this.userInterface.addButton(4,"Nevermind",askPennyIfSheNeedsHelp);
}

//[Explain]
function explainWhyYoureAHugeSlut():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("You explain to Penny that you’re in possession of a supplemented immune system that should eradicate all known pathogens. No bug in the universe can stand up to your microsurgeons; at most, the worst you would have to deal with would be some subtle mutations. And that’s only if you don’t get yourself checked up.");
	output("\n\nPenny idly licks her fingers to clean them the rest of the way and pauses as you finish. She raises an eyebrow, remarking, <i>“Is that so? I suppose I shouldn’t be surprised.”</i>  She rolls her eyes and quotes the old Xenogen Biotech slogan, <i>“The wonders of biotechnology never cease!”</i>  She stands up and sighs, grabbing a pair of tonfas off the desk. With a look at the expression on your face, she smiles and assures you that they’re just there for personal protection.");
	//[Yes] [Nope-goes back to last choice.]
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Yes",getSpitRoastedForPenny);
	this.userInterface.addButton(1,"Nope",fuckTheZilForPennyBecauseYouAreADumbStupidSlut);
}

//[Flirt Off]
function flirtySlutPCsTellPennyFlirts():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("You smirk and tell her not to worry about it. Besides, the idea of having a sexy fennec like her watching you fuck some horny aliens is worth every medical bill you might incur. Penny’s tail flutters briefly, twitching in the air before settling back down. It stills just as quickly.");
	output("\n\n<i>“I-is that so?”</i>  she coyly remarks in between a few last licks of her fingers, cleaning the remnants of pussy juices from her fur. She pushes back her chair, stands up, and smiles, grabbing a pair of tonfas off the desk, which she assures you are just for protection. <i>“You ready for this, lover-" + pc.mf("boy","girl") + "?”</i> ")
	//Adds to affection
	pennyAffection(3);
	//[Yes] [Nope-goes back to last choice.]
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Yes",getSpitRoastedForPenny);
	this.userInterface.addButton(1,"Nope",fuckTheZilForPennyBecauseYouAreADumbStupidSlut);
}

//[Yes] (Go Get Spit-Roasted for Penny)
function getSpitRoastedForPenny():void {
	clearOutput();
	this.userInterface.showBust("ZILPACK");
	output("<i>“Alright, I hope you weren’t attached to your virginity,”</i>  Penny remarks dryly as she steps out from behind the desk, giving you a good look at her lower body. Her legs are digitigrade, meaning they bend twice, like some earth animals’. Those limbs end with fluffy, sandy, fur-covered paws, unhindered by any kind of footwear. Her pants are baggy around the calves and bottoms to accommodate her unique physiology but tighten up noticeably around her pert bottom. The fennec fox-girl’s tail emerges from a hole cut just under the waistline, and it sways enticingly as you follow her into the holding area.");
	output("\n\nPenny grabs a breathing apparatus off the wall. The device looks like a clear faceplate with a cluster of tubes attached to a number of filters that dangle low. A single black band loops around the back of the head, and a foam and rubber seal is there to fit it to just about any humanoid face. The fox-girl fits it over her muzzle, then opens the door. The musk that rolls out from the cells hits you with all the subtlety of a hammer. You cast a baleful look in Penny’s direction for not offering you any protection, but you’ve already breathed in a deep lungful of the sweet yet musky aroma. Slowly, the musk becomes less noticeable to you, while the sweet notes remain. You can feel your heartbeat in your ears and your ");
	if(pc.hasCock() || pc.hasVagina()) output("genitals engorge with heat, puffy and sensitive");
	else output("[pc.asshole] tingles, becoming more sensitive");
	output(". You stand there shuddering, breath coming so fast that you’re hyperventilating. As you fill with lust, Penny just pushes you in.");
	output("\n\nYou stumble forward into a set of vertical bars, and the moment you regain your balance, you grind your feverish body against them in need. Your half-lidded eyes settle upon two insectile forms just inside the cell. Most of their bodies are covered in shining black chitin, though some of the exoskeletal plates retract from their faces, chests, and, most importantly, their crotches. One of them has black colored skin, where it is exposed, and the other yellow. Each of their cocks is on display, wreathed in foreskin and already hard, and both are leaking amber pre-cum. What appear to be shimmering capes hang behind them, though you soon realize that the iridescent drapes are folded, sharply triangular wasp wings.");
	output("\n\nOne zil buzzes, <i>“Open the door....”</i> ");
	
	output("\n\nThe other finishes, <i>“We’ll give you the fucking you crave, teach you your place.”</i>  He strokes his cock down, and as his foreskin peels back, you can practically see the cloud of pheromones filling the air. You tremble as you breathe them in, feeling them invading your system. You practically cum on the spot as the second zil repeats the same action, revealing his shiny cockhead and dosing you with another potent blast of sweet zil perfume.");
	
	output("\n\nThey stalk closer and speak in unison, <i>“Fuck you senseless,”</i>  but you’re nearly beyond hearing.");
	output("\n\nPenny intervenes at this point; her voice is muffled by the mask she’s wearing. <i>“Fuck this " + pc.mfn("guy","girl","person") + ", and we can all talk when you’ve cleared your heads, bee-brain.</i> The door clicks open, and Penny shoves you through, though really, you hardly needed any encouragement. You nearly bowl over the wonderful-smelling insects before one stops you in your tracks, clutching you tightly to his slim chest in his lithe arms. Behind you, the bars ‘Ka-CHUNK’ into place, but you don’t particularly care. It feels like you’ve been waiting an eternity to get to the zil, and now that you’re here, you wouldn’t even dream of leaving.");
	
	output("\n\n<i>“Thanks, foxy,”</i>  the wasp-like man coos past your ear, his exposed skin dusky and covered with a sheen of what appears to be oily sweat. It smells far better than it should, and before you realize what you’re doing, you begin nuzzling against his chest, your tongue slipping out from between your [pc.lips] and lapping experimentally at his slick, onyx skin. Rubbing your cheek submissively against his inky nipple, you lap at his skin, tasting the salty oils, taking in deep breaths through your nose as you seek out the source of his hypnotic scent. He ruffles his fingers ");
	if(!pc.hasHair()) output("across your head");
	else output("through your [pc.hair]");
	output(", patiently letting you explore his body. Inch by inch, you search, barely aware of the plaintive mews coming from your mouth. Your tongue and lips trace the landscape of his chest, down the hardened plates that protect his abs, until you locate the source of his delicious musk: his crotch. You pant in triumph, mouth watering as, unthinkingly, you fold your [pc.knees] beneath you. With a single exhalation against his body, you sink down, your nose tracing against his skin and down his cock, nuzzling to one side while you bite your lower lip at the sight of his smooth, hairless ballsack. It clings rather tightly to his taint, clearly displaying the heft of his nicely-rounded balls to your eager eyes.");
	
	output("\n\n<i>“Suck,”</i>  comes the insistent command. Your jaw is open before the word is over, bending down to catch his cock in your mouth. The salty-sweet taste is divine, and you slither your tongue to peel back the sable skin. His glans is immediately exposed to your sucking, hungry hole, his slick cockhead oozing hot, alien honey onto your tongue, inundating your senses with his succulent flavor. You let out a content moan as you begin to bob on his shaft. The taste is addictive in your current, hedonistic state. Better than any food or drink you’ve ever had, the honey-cum is so ambrosial that you can’t even think about stopping, not until you feel it gushing into your mouth like a river of sweet, sweet nectar, bulging your cheeks, and flooding your throat with its syrup heat.");
	
	output("\n\nThe other prisoner finally makes his move. You catch a glimpse of his yellow dermis out of the corner of your eye, closing in on you from behind. When his shadow falls over you and your sugar-daddy’s honey nozzle, you shiver in intuitive delight. His hands grab you by your [pc.hips], guiding your [pc.butt] higher until you’re standing, bent over to service your ebony friend, with your [pc.butt] on level with your new partner’s crotch. ");
	if(!pc.isNude()) output("He removes your [pc.gear]. ");
	output("Your [pc.vagOrAss] is completely unprotected, and you wouldn’t have it any other way. You balance precariously on one hand to reach back with the other, grabbing your own asscheek to spread yourself hospitably wide for your new friend. His hand mirrors yours, spreading your opposite cheek, his grip firm and commanding on your backside. You let out a babbling groan when his finger slips inside you ");
	if(pc.hasVagina()) output("to gauge your wetness");
	else output("to gauge your tightness");
	output(". Your nerves spark like live wires, and every touch from the Zil sends short-circuiting bursts of ecstasy into your skull. Your eyes roll back as you moan like a greedy whore, drooling around the cock in your mouth.");
	
	output("\n\nA matching moan echoes from the other side of the musk-hazed chamber. In the second that you eyes wander away from your black-chitined lover, you glance at the form of Penny, crouched on a nearby bench. You give a shaky grin and an extra swallow at the sight of Penny’s predicament. The busty fennec’s pants are around her ankles and her fingers are stuffed up to the knuckles in her twat. Her rapid breathing rasps inside her breathing apparatus, the pheromone-filtering capabilities of the device obviously failing. She’s frigging her cunt with desperate abandon, wordlessly shuddering as her jealous eyes watch you through her fogging visor. The cheap plastic bench she reclines on is already slick and glossy with her dripping juices.");
	
	output("\n\nAbruptly, your [pc.vagOrAss] is split wide by a thick, throbbing zilcock. You can feel the honey spurt from your nethers as the zil’s fuckstick shoves deliciously into your hole. ");
	if((pc.vaginalVirgin && pc.hasVagina()) || (!pc.hasVagina() && pc.analVirgin)) {
		output("With a single plunge, it claims your virginity, in mere moments, conditioning your satisfied hole to accept its slightly-curved shape and thickness, the oily skin and slippery foreskin making the loss of your ");
		if(!pc.hasVagina() && pc.analVirgin) output("anal ");
		output("innocence surprisingly bearable. ");
	}
	if(pc.hasVagina()) {
		cuntChange(rand(pc.vaginas.length),zilpack.cockVolume(0),false, false,false);
	}
	else {
		buttChange(zilpack.cockVolume(0),false, false,false);
	}
	output(" You swoon as it presses down on your misfiring nerve-endings and batters straight into your core with a hard, almost feral plunge. Your eyes roll partway back, half-hidden under your heavy eyelids as you surrender to the pleasure");
	if(pc.hasCock()) output(", [pc.eachCock] drooling a steady trickle of pre-cum onto the ground");
	else if(pc.hasVagina()) output(", [pc.eachVagina] dripping with moisture as your walls tremble around the invader");
	output(".");
	if(pc.balls > 0) {
		output(" Your [pc.balls] ");
		if(pc.balls > 1) output("are");
		else output("is");
		output(" quickly soaked with leaking alien pre-ejaculate, shining with a coat of amber honey as they ready their own copious load.");
	}
	
	output("\n\nBoth zil share a smile at your descent into debauchery, one grabbing you by the head and the other seizing you by the hips, sawing your body back and forth on their slick honeysticks. You aren’t inclined to protest with how good this feels, and the zil don’t seem to have any intention of slowing. The black-skinned one in front jams his dick all the way into your throat, pressing his smooth sack against your lower lip. Grinding up against your nose, the smell is even more potent than the haze already suffusing the metal-paneled cell");
	if(pc.hasCock() && pc.cumQ() >= 50) output(", making your naughty bits drip like a faucet");
	output(". The ebony zil’s cock slides back out from your lips, leaving only its honeysweet head against your lips. You gasp, catching your breath but immediately seal your lips back around the cock in an airtight “O” of need. You tremble, feeling your ");
	if(!pc.hasVagina()) output("bowels are plugged full of rigid zil-cock");
	else output("[pc.vagina] is stuffed full of rigid zil-cock");
	output(". As the cock in your mouth withdraws, you are hilted; yellow balls slap against your butt. They saw into you, their athletic forms building speed. The aliens use you as little more than a sentient cock-sleeve. A thrill of pleasure runs through your body, feeling like a soft sex-toy just waiting to be turned into a double cum-dump.");
	
	output("\n\nIf the throbbing of their dicks is any indication, the zil are clearly enjoying dominating your submissive body. You rock back and forth, greedily gulping down pre-cum, desperately working your muscles to coax ever more from them. They don’t keep you waiting much longer. As one, the break their rhythm, and both cocks are rammed into you. The throbbing ballsacks grind against your [pc.skinFurScales], and a torrent of honeyed jism erupts into your mouth, flooding your cheeks. Diffirent from the syrupy pre, the zil’s cum is creamy and thick, satisfying a deep desire you didn’t even know you had until you started to swallow. You gulp it down with a blissful smile, feeling only wanton abandon at amber trails slopping out of the corners of your mouth and down your chin. At the same time, the yellow zil explodes in your [pc.vagOrAss], hot, thick spunk flooding your insides, jet after jet of it lancing deep into your ");
	if(!pc.hasVagina()) output("bowels");
	else if(!pc.isPregnant()) output("womb");
	else output("passage");
	output(".");
	
	output("\n\nGurgling happily, you lose yourself in a mind-bending orgasm.");
	if(pc.hasCock()) {
		output(" [pc.EachCock] gushes [pc.cum] onto the cell floor, spattering the tile with [pc.cumColor] globs.");
		if(pc.cumQ() >= 200) output(" You giggle, nearly out of your mind in pleasure as cum saturates and slathers over you until the three of you, zil and human, are in an orgasmic puddle of your own creation.");
	}
	if(pc.hasVagina()) {
		output(" [pc.OneVagina] clutches tight around the invader");
		if(pc.totalVaginas() == 2) output(" while the other trembles in futile bliss");
		else if(pc.totalVaginas() > 2) output(" while the others tremble in futile bliss.");
		if(pc.wetness() <= 2) output(" A trickle of [pc.girlCum] escapes your pussy lips.");
		else if(pc.wetness() <= 4) {
			output(" What feels like a torrent of [pc.girlCum] leaks from your quivering cunt");
			if(pc.cockTotal() > 1) output("s");
			output(".");
		}
		else output(" Gushing freely, your [pc.girlCum] washes out in an sticky wave, splattering your [pc.legs], the zil’s armored thighs, and the floor with liquid lust.");
	}
	else output(" Your [pc.asshole] clenches tight around the intruder, milking the jism deep inside you with pleasured contractions.");
	if(pc.isLactating()) {
		if(pc.lactationQ() < 500) output(" [pc.Milk] dribbles from your [pc.nipples], coaxed out by the tremors of pleasure running through your body.");
		else {
			output(" [pc.Milk] spurts from your nipples, splashing ");
			if(pc.hasCock() && pc.cumQ() >= 200) output("into the pooling fluids");
			else output("onto the floor");
			output(".");
		}
		if(pc.milkType == GLOBAL.MILK) output(" If your mouth wasn’t full of cock, you’d moo like the universe's sluttiest cow.");
	}
	
	output("\n\nYour waspish suitors pull out of you at the same time, wings buzzing. Your shaking limbs tremble, trying to hold you up as they switch places, floating past each other as they reposition, presenting you with a yellow-skinned, cum-covered cock to suck. You smile drunkenly up at the Zil and open wide to the sound of Penny’s moans.");
	
	output("\n\nThe fox-morph watches you fuck these bug-men with her cunt dribbling on the tiled floor. Her mask fell off during her frenzied self-pleasure. She pants as she aggressively mooshes her hands deep into her now-esposed tits, burying her palms wrist-deep in boob. Her other hand is halfway buried in her snatch, leaving only her thumb to tend to a tiny, barely-visible clit. Penny grunts bestially as her muscles lock, her body shivering lustily before she sags against the wall, still watching. Her hand comes partway out of her reddened slit, though she continues to idly stroke a single digit through her folds as she watches the cum ooze from you.");
	output("\n\nYou’re filled on both sides once more, each zil getting sloppy seconds in one of your holes. Gushing everywhere, the honey quickly coats the floor");
	if(pc.wetness() >= 3) output(" along with your own moisture");
	output(", squirting from your well-used holes. The constant sexual onslaught sends you to orgasm after orgasm, almost one on top of the other. Your mind seems to be turning to putty under the ecstatic assault, shutting down one thought process after another as you ride pleasure unending. Dimly, you’re aware of one sloppy honey injection after another...");
	pc.orgasm();
	//Cum, pregnancy chances, sensitivity reduction
	//Pass 2 hours.
	processTime(120+rand(20));
	flags["ZIL_PROBLEM_DEALT_WITH"] = 1;
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",getFucked4PennyEpilogue);
}

//[Next]
function getFucked4PennyEpilogue():void {
	clearOutput();
	this.userInterface.showBust("ZILPACK");
	output("You wake to the sound of flesh impacting flesh, the hard clap of it ringing out through the confined prison. Your jaw and [pc.vagOrAss] are both incredibly sore and dripping, though there is a palpable, satisfying tingle coming from both orifices to make it more bearable. Looking over, you see Penny entangled with one of the zil, legs splayed as she grapples with him, slapping him across the face repeatedly.");
	output("\n\n<i>“You jackasses! You damn near fucked [pc.name] to death! Look at " + pc.mf("him","her") + ", not a single spot that isn’t sticky!</i>  Penny slaps the zil again. <i>“What do you have to say for yourself?”</i> ");
	output("\n\nThe zil, looking confused and hurt, answers, <i>“Is custom when meeting other tribes. Sex establishes dominance and who is to be obeyed. Even though you’re aliens, we assumed you worked the same. We thought if we could dominate you, you would acknowledge us and leave.”</i>  He slumps, looking defeated.");
	output("\n\nYou note that Penny has a trickle of golden goo escaping from between her legs. Obviously she stepped in for you at some point and took them the rest of the way down. Her lip pulls back in a sneer. <i>“Well since you two are my... </i>prey<i>, I guess you’ve gotta listen to me now, huh?”</i> ");
	output("\n\nBoth zil nod.");
	output("\n\n<i>“Good. I’m going to lead you out of here on leashes in a minute. You be sure to and tell your people that we’ll kill anyone that comes into town trying to force customs on us again. Make sure that message spreads through all your villages. I don’t care if you have to fuck or get fucked by every one of them to do it,”</i>  Penny declares while separating herself from the beaten zil. She grabs her pants and throws them on in a huff, closely followed by her wraps, bra, and vest.");
	output("\n\nYou stagger up after the fox-girl, groggily grabbing your things, all of them covered in sexual fluids. She smirks and points you to a shower while she finds some restraints.");
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",postSexShower);
}

//[Next]
function postSexShower():void {
	clearOutput();
	setLocation("THE\nSHOWER",rooms[currentLocation].planet,rooms[currentLocation].system);
	output("The shower is blessedly warm, washing the away the filth of the encounter and easing the pain on your sore form. Flashes of memory play through your mind as you work clean, and your breathing slowly becomes heavier and more aroused as you remember the lascivious way in which you acted. You stop before you wind up on the floor masturbating, but you definitely think your libido has increased as a result.");
	output("\n\nWhen you step out, the cell room is empty and the wonderful-smelling zil are gone....");
	
	//Boost libido and stick PC in empty jail room.
	pc.libido(1);
	processTime(50);
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

//[Fight Them]
function fightDemZil():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("<i>“I bet I could take them down before their pheromones stop me,”</i>  you offer confidently with ");
	if(pc.isNice()) output("an open smile");
	else if(pc.isMischievous()) output("a knowing smirk");
	else output("a confident grin");
	output(".");
	
	output("\n\nPenny’s gaze jerks up to meet yours. <i>“You sure about that? I get all of two sentences out before my fingers start winding between my legs. I don’t think I could stay in there long enough to fight, and even with a breathing filter, it’d still get to me in a minute or two.”</i>  The giant-eared fox gestures towards some breath masks suspended from the wall. <i>“They’re meant for dealing with tear gases and similar airborne weapons, though some of the pheromones seem to slip past the filter. They’ll give you a fighting chance if you want to risk it.”</i> ");
	output("\n\n<i>“Last chance to pussy out,”</i>  the fennec growls, <i>“What are you gonna do?”</i> ");
	//[Pussy Out] Goes back
	//Fight them
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Pussy Out",askPennyIfSheNeedsHelp);
	this.userInterface.addButton(1,"Fight Them",seriouslyFightTheZil);
}

function seriouslyFightTheZil():void {
	clearOutput();
	this.userInterface.showBust("ZILPACK");
	//[Fight Them (Confirmed)]
	output("The fairly buxom fox gets up, giving you a good look at her lower body. Her legs are obviously digitigrade like those of an animal, capped off by large, fluffy, fur-covered paws, uncovered by any kind of shoe. Her pants are baggy around the leg to accommodate her unique physiology, but they tighten up quite noticeably around her pert bottom. The fennec fox-girl’s tail emerges from a hole cut just under the waistline, and it wags slightly as you follow her into the holding area.");
	
	output("\n\nGrabbing a pair of masks, she tosses one towards you and says, <i>“I hope you’re half as determined as you sound, because otherwise I’m going to wind up schlicking to a threesome until they sate themselves.”</i>  Penny fastens her into place, then watches you as you do the same. A rueful smile graces her face as she glances back your way. <i>“Let’s do this.”</i> ");
	output("\n\nPenny leads you into the holding area, stopping at a sealed door. <i>“Heads up,”</i>  she warns before depressing the switch. The door opens with snappy, pressurized hiss, and a wave of musk rolls out. You can smell it through your breather, tickling at your nose and speeding the beat of your heart already. Penny pushes you in, following shortly behind, her tail waving mischievously behind. Two nude aliens stand on the other side of a barred enclosure, their thick, foreskin-enclosed cocks hard and dripping as they regard you.");
	
	output("\n\nThe fox-girl gives you an appraising look, and you nod, indicating you’re ready. She unlocks the cell door for you, guiding you in with a quick push. It slams shut behind you as soon as you’ve stumbled the whole way into the enclosure.");
	output("\n\n<i>“Good luck,”</i>  Penny’s muffled voice encourages. She’s seating herself on a bench across the room. The wrappings around her chest have already begun to tent. Even through all that cloth, it’s easy to tell the aliens’ arousing aroma is having an effect on her, just as it is on you. You turn to regard the two bug-men, who are even now advancing on you with confident swaggers. Your gaze flicks down to behold their dripping genitalia, and you idly find yourself wondering what they would look like cumming helplessly beneath you. Right... you came here to defeat them.");
	this.userInterface.clearMenu();
	//Start combat
	this.userInterface.addButton(0,"Next",startCombat,"zilpack");
}

//	AI: Utilizes lust attacks unless damaged. Then has physical probability of 2 * missing HP (50% HP = 100% physical attacks). Flurry of blows or facehump if PC is stunned. 50% chance of using harden when below 75% HP.
function zilpackAI():void {
	//Physical attacks
	//trace("ZIL AI SHIT: " + ((foes[0].HPMax() - foes[0].HP())/foes[0].HPMax()) * 200);
	//trace("ZIL HPMAX: " + foes[0].HPMax() + " ZIL HP: " + foes[0].HP());
	if(((foes[0].HPMax() - foes[0].HP())/foes[0].HPMax()) * 200 > rand(100))
	{
		if(pc.statusEffectv1("Round") % 4 == 0) pluralZilHarden();
		else if(rand(3) == 0) flurryOfBlowsPlural();
		else if(rand(2) == 0) zilFlyingSpinKick();
		else enemyAttack(foes[0]);
	}
	else {
		if(rand(3) == 0) zilCrotchGrindPlural();
		else if(rand(2) == 0) zilPheromoneFanPlural();
		else zilHoneyDripPlural();
	}
	pennyFapActions();
}

//Crotch Grind:
function zilCrotchGrindPlural():void {
	output("Zipping forward, the zil bring their ");
	if(foes[0].lust() < 33) output("sensitive");
	else if(foes[0].lust() <= 66) output("stiff");
	else if(foes[0].lust() <= 75) output("throbbing");
	else if(foes[0].lust() <= 85) output("dripping");
	else output("drooling");
	output(" dicks right into your [pc.face]. The soft shroud of their foreskins rubs hotly against you, peeling back to barely expose the ebony and yellow glans that are prodding your forehead. You gasp and stumble away, not realizing your mistake until the chemical deluge hits your senses.");
	if(pc.lust() <= 33) output(" Uh, wow... you could probably go for another sniff of that.");
	else if(pc.lust() <= 66) output(" Mmmm, they smell so good that you could just drop down to your knees and let them drag it all over.");
	else if(pc.lust() <= 75) output(" Yum! You inhale another deep drag of their diminishing aroma and wonder if it wouldn't be too bad to give in to them.");
	else output(" Ungh, why aren't you letting them fuck your mouth so that you can breathe in more?");
	if(flags["TIMES_LOST_TO_ZIL"] == 1) output(" You've done it before and nothing bad came of it, what's wrong with one more submission?");
	else if(flags["TIMES_LOST_TO_ZIL"] == 2) output(" You've given into these aliens twice already. Surely the third time is the charm...");
	else if(flags["TIMES_LOST_TO_ZIL"] == 3) output(" You've let them use you a handful of times. What's once more?");
	else if(flags["TIMES_LOST_TO_ZIL"] != undefined) output(" You've given in countless times already, why not live it up?");
	pc.lust(10+pc.libido()/10);
	processCombat();
}

//Pheromone Fan:
function zilPheromoneFanPlural():void {
	output("The two zil abruptly begin to fondle their rigid members, stimulating the organs as they alter their wingbeats to gust musk-laced air your direction. There's nothing to do but try and hold your breath!");
	//{Moderate toughness check pass}
	if(pc.physique() + rand(20) + 1 > 20) {
		output("\nThey get tired long before you do and give up, but it still leaves a cloud of his delicious aroma floating around you. It's strong enough to make your pulse quicken.");
		pc.lust(5+pc.libido()/20);
	}
	else {
		output("\nEventually, you can hold your breath no longer, and you're forced to inhale the potent cloud deep into your lungs. Your heart hammers in your chest faster and faster while your [pc.skin] flushes and your lips unconsciously purse.");
		if(pc.lust() < 33) output(" A tingling warmth in your crotch leaves no doubts as to the effectiveness of your alien foes' sensuous attack.");
		else if(pc.lust() <= 66) output(" The warm, incessantly building heat in your loins is getting hotter and hotter with every breath you take.");
		else
		{
			output(" Your crotch feels so hot that you know you just HAVE to touch it soon. Damn these aliens and their ");
			if(silly) output("stupid ");
			output("sexy dick-scent!");
		}
		pc.lust(10+pc.libido()/10);
	}
	processCombat();
}

//Honey Drip:
//Fly by pre-cum dripping!
function zilHoneyDripPlural():void {
	output("Flying up into the air, the two zil begin to jack themselves off, stroking their thick, scented dongs while amber droplets drip from their thick dickskin. Their pre-cum drips down around you in long strings, some falling across your shoulders, head and face. It smells sweet and floral like honey, and though it doesn't seem laced with his pheromones, the lewdness of it all quickens your pulse.");
	pc.lust(5+pc.libido()/20);
	processCombat();
}

//Flurry of Blows:
//5x standard attacks with heightened miss chance. Doesn't miss if PC is stunned.
function flurryOfBlowsPlural():void {
	output("Together, the zil launch a flurry of blows in your direction!\n");
	attack(foes[0],pc,true,1);
	attack(foes[0],pc,true,1);
	attack(foes[0],pc,true,1);
	attack(foes[0],pc,true,1);
	attack(foes[0],pc,true,1);
	attack(foes[0],pc,false,1);
}

//Flying Spinkick:
//Stuns the PC.
function zilFlyingSpinKick():void {
	var target:Creature = pc;
	var attacker:Creature = foes[0];
	output("An irritated snarl crosses the aliens' smooth lips, and they launch themselves towards you. Their bodies pivot in mid-air, accelerated by their wings, and they snap their heels out toward your face at the last second.");
	if (combatMiss(foes[0],pc)) 
	{
		output("\nYou duck aside of their flying heels!");
	}
	else 
	{
		//Damage bonuses:
		var damage:int = attacker.meleeWeapon.damage + attacker.physique()/2;
		//Randomize +/- 15%
		var randomizer = (rand(31)+ 85)/100;
		var sDamage:Array = new Array();
		//Apply damage reductions
		if (target.shieldsRaw > 0) {
			sDamage = shieldDamage(target,damage,attacker.meleeWeapon.damageType);
			if (target.shieldsRaw > 0) 
				output(" Your shield crackles but holds. (<b>" + sDamage[0] + "</b>)");
			else 
				output(" There is a concussive boom and tingling aftershock of energy as your shield is breached. (<b>" + sDamage[0] + "</b>)");
		}
		if(damage >= 1) 
		{
			damage = HPDamage(target,damage,attacker.meleeWeapon.damageType);
			if (sDamage[0] > 0) 
				output(" The armored bootheel connects with your cheek hard enough to turn your head and leave you seeing stars. (<b>" + damage + "</b>)");
			else 
				output(" (<b>" + damage + "</b>)");	
			if (!pc.hasStatusEffect("Stunned"))
			{
				output("<b> It's concussive enough to leave you stunned.</b>");
				pc.createStatusEffect("Stunned",1,0,0,0);
			}
		}
	}
	processCombat();
}
//Harden:
//Buffs kinetic defenses?
function pluralZilHarden():void {
	output("Closing his onyx eyes, the zil flex, and you hear quiet, barely audible cracks filling the air. You peer closer and realize that the zil's carapace seems shinier, and perhaps a bit more formidable... just barely thicker, somehow.");
	foes[0].resistances[GLOBAL.KINETIC] *= .8;
	foes[0].resistances[GLOBAL.SLASHING] *= .8;
	foes[0].resistances[GLOBAL.PIERCING] *= .8;
	processCombat();
}

function pennyFapActions():void {
	//1) 
	if (pc.statusEffectv1("Round") == 1) 
		output("\n\nPenny slips a furred hand under the waistband of rapidly-dampening pants as she watches the spectacle, already falling under the influence of the zils’ insidious pheromones.");
	else if (pc.statusEffectv1("Round") == 2) 
		output("\n\nPenny’s ears flatten partway back on her head while she shimmies her hips, wiggling out of her pants. Her fingers stay busy under the white fabric of her sorely soaked panties, pumping in and out with lurid schlicks.");
	else if (pc.statusEffectv1("Round") == 3) 
		output("\n\nPenny whimpers and shrugs out of her top. The wrappings and the bra they cover disappear a moment later, forgotten when the fox’s spare hand begins to knead her tits with unrelenting passion.");
	else if (pc.statusEffectv1("Round") == 4) 
		output("\n\nPenny is openly humping her palm at this point. Her poor, soaked panties are fairly drenched with girlish moisture, clinging to her fur while fingers slip and slide underneath the gusset. Her gaze never seems to leave you.");
	else if (pc.statusEffectv1("Round") == 5)
	{
		output("\n\nPenny’s lust-filled gaze locks on the two zil, sliding over their bodies with all the subtlety of a drunken sorority girl. She’s fingerfucking herself hard, peeling her panties away from her snatch to show the zil what they’ve done to her. Their erections seem to stiffen in response.");
		//Plus zil lust
		foes[0].lust(10);
	}
	else if (pc.statusEffectv1("Round") == 6)
		output("\n\nPenny cums around her fingers. Her voice pitches up an octave as she screams through her breathing mask, her secretions trapped inside her undergarments.");
	else if (pc.statusEffectv1("Round") == 7)
		output("\n\nThe fox-girl is still at it, though trickles of moisture are running down her thighs whenever the she shifts position, escaping through the imperfect seal between her underwear and her furred thighs.");
	else
		output("\n\nPenny’s tongue is lolling from her mouth, uncontrolled. Her eyelids hang low and heavy, and her pupils keep rolling back under them whenever she has an orgasm, something that happens every few times her fingers dive into her soaked muff. Conscious thought seems to be beyond her at this point, and her pussy-scent is so heavy in the air that it almost overpowers the zils’ mixed aromas.");
}

//Lose to Zil Pair
//By Savin
//Get fucked from both ends until the Zil sate themselves. Penny schlicks in the corner until they’re done, then she takes em down, actually converses with them. They say forcing sex with strangers is a cultural thing, penny says she’ll kill any that try that in town, and turns them loose to tell the rest of their people (by leading them out on leashes)
function loseToZilPair():void {
	author("Savin");
	
	output("The onslaught of ");
	if(pc.HP() <= 0) output("physical punishment");
	else output("sexual pheromones");
	output(" is just too much for you. Your [pc.knees] buckle, and you slump down to the cold, hard floor of the jail cell. You hear Penny rush toward you, momentarily recovering from her fap session enough to realize you're in trouble. But even with her gas mask, she's unable to withstand the growing power of the fuck-scent filling the room, growing muskier and more irresistible, more... intoxicating... with every second. You twist around to see the foxy police girl collapse, spreading her legs as she mindlessly pulls her mask off, drinking deep of the mind-numbing Zil odor. Separated by the cell bars, Penny's safe from the wrath of the two horny breeders as she starts to furiously masturbate, fingers diving back into her womanly gash, still soaked with the last flow of her pleasure.");
	output("\n\nYou, however, have nothing to save you. You feel a pair of chitiny hands, so slick they're almost like latex, grab your neck. Through the mad haze rushing through your mind, you're only dimly aware of the mounting pressure on your lips. You look up, only to see your entire world dominated by a pair of swinging gonads dangling beneath a bright yellow cock wrapped in a tight layer of foreskin. The Zil boy looming over you licks his lips, grinding his hips on your face, his rock-hard prick dragging across your lips. A slick, oily trail is left in the alien cock's wake, a heady mix of pre and sex pheromone deposited right on your nose.");
	output("\n\nWhatever cognition you had left after that fight quickly evaporates as the Zil boy spurts a thin, honey-colored drop of pre-cum right on your upper lip. The potent musk overwhelms your last mental defenses in the blink of an eye, and like an eager whore, you open your mouth, tongue rushing out to taste of the magnificent meat dangling before you. <i>\"Ahhhh, much better,\"</i>  the yellow Zil grins as your lips wrap around the head of his throbbing erection, sucking in the first inches of his girth. <i>\"You learn your place quickly, " + pc.mfn("boy","girl","little toy") + ". And a talented tongue. See, brother, I told you: patience is key.\"</i>");
	
	output("\n\nThe other Zil chuckles, dusky body moving out of sight behind you. Some part of you screams out in worry, but is soon suppressed as you feel the potent amber elixir dribbling down your throat, its source responding to your every touch and lick. The yellow Zil runs dark-armored fingers ");
	if (pc.hasHair()) output("through your [pc.hair]");
	else output("across your head");
	output(", gently guiding you down his dick until your lips press against his base, cock utterly buried in your mouth. You almost gag as the last inches push past your lips, but at a word from your master, your entire body seems to go limp, easily accepting his delicious offering of cock.");
	
	output("\n\n<i>\"Good, good,\"</i>  the yellow Zil coos, slowly guiding you down ");
	if (pc.tallness >= 48) output("onto all " + plural(num2Text(pc.legCount)));
	else output("as he gets on his knees");
	output(", never letting even the tiniest amount of his prick escape your hungry hole. Reclining, the Zil locks his fingers around your [pc.face], holding you perfectly still. Instinctively you nuzzle into his palm, looking up at the sexual beast with pleading eyes as he slowly moves his hips back, dragging every last inch of his wonderful tool out of you until just the head remains, glans planted on the tip of your tongue. Like the good, hungry slut you are, you lap and lick and kiss his cock head, suckling from it like a teat as ever more of his marvelous amber seed stains your tongue, as sweet as honey and as potent as a drug.");
	
	output("\n\n<i>\"[pc.name],\"</i>  Penny groans behind you, voice filled with unbridled pleasure. Though you can't see her, it's easy to imagine her furiously fapping, fingers fucking her hole with abandon. The thought is alluring, but the sudden influx of eight inches of Zil cock drives any thought of Penny from your mind. The yellow jacket pumps his prick back into your eager mouth, then out again, soon settling into a steady rhythm of face fucking that leaves you drooling and moaning around his cock. You barely notice as your gear is stripped away by his brother, piece after piece clattering to the floor. When a hand caresses your [pc.butt], fingers digging into the full cheeks, you instinctively wiggle your ass enticingly, relaxing your [pc.asshole] as a latexy thumb pushes up against the dark little hole.");
	
	output("\n\nYou shiver with shameless excitement as a spit-slick digit prods into your ass, smearing your quivering walls with just enough lubricant to make the coming rape bearable. Rather than dread, you mind flushes with eager anticipation, and you hump back against the hand planted against your butt, drawing the rawest bit of pleasure from the anal fingering before the dark Zil boy withdraws, clasping his hands on your [pc.hips]. You scream around the cock buried in your throat in what your addled mind demands is ecstasy as a big, thick alien cock presses hard against your [pc.asshole], sinking into the slick, unresisting hole with agonizing slowness. You groan as the Zil dick sinks steadily into your ass; you try to busy yourself on the yellow prick in your face, reaching up to fondle the Zil boy's heavy sack as you suck his shaft, but your mind is relentlessly distracted by the swelling pressure in your backside, insatiably eager for a direct suppository of the Zil's potent seed.");
	buttChange(zilpack.cockVolume(0));
	output("\n\n<i>\"Oh GOD YES!\"</i>  Penny screams from beyond the bars, <i>\"Fuck " + pc.mf("him","her") + " hard, you beasts! Yes! I wanna see your seed pouring from every hole! Oh yeah,\"</i>  she cries, masturbating with such furious abandon that you can hear her fingers fucking herself even over your own cries and moans and the buzzing of your Zil masters.");
	
	output("\n\n<i>\"As you say,\"</i>  the black jacket laughs, giving you a hard swat on that ass. You reflexively tighten, anal muscles gripping hard on his manhood as it slowly slides out, and in again. This Zil doesn't even try to match his brother's frantic, face-fucking pace; instead, he goes slowly on you, enjoying the squeeze and spasm of your sphincter around his cock.");
	if(pc.hasCock()) output(" Your own prick twitches in response; dribbling a thick [pc.cumColor] stream onto the cell floor as the alien prick pumps onto your prostate, accidentally massaging your sensitive anal bud.");
	output(" Submissive, addled, and eager for seed, you can't help but wiggle your ass and suck as hard as you can, reveling in the bliss of the Zil's perfect sexual dominance, the aromatic cock shoved down your throat and the carnal anal pleasure of the Zil fucking your butt.");
	
	output("\n\nSuddenly, the yellow jacket seems to seize up, fingers clutches at your cheeks as his fuckstick slams into your throat with a sudden force and speed that makes his previous oral assault seem like foreplay. You groan as his pelvis slams into your face, cock thrusting down your throat again and again until a sudden feral groan escapes his lips, and you feel a rushing flood of sweet honey pouring down your throat. The unstoppable wave of seed shoots into you in great pulsing bursts that soon have you feeling utterly, impossibly full; ever so contented and sated. But a moment later, that satisfaction feels like a distant memory when the dusky Zil buried eight inches in your ass grips your [pc.hips] tight and throws his head back, pounding like a jackhammer as the first sticky flood of his own seed joins his brother's, bursting into your abused asshole like a geyser.");
	if (silly) output(" The two Zil reach over your insensate form, high-fiving each other");
	else output(" The two Zil grunt and groan");
	output(" as they cum in unison deep into your bowels, filling you with all the sweet alien seed their eager cocksleeve deserves.");
	
	output("\n\n<i>\"YES! Yesyesyes!\"</i>  Penny screams as she, too, climaxes, turned on far beyond her normal sexual limits by the potent musk of the Zil climax that fills the room like a haze, dominating her with sexual need that she can barely strive to fulfil. As the two Zil boys push your off their cocks, thoroughly used and now discarded until next they need release, you roll over in time to see Penny's cunt gush around her fingers, soaking the floor in her release.");
	pc.lust(100);
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",loseToZilpackPartTwoLoseHarder);
}

function loseToZilpackPartTwoLoseHarder():void {
	clearOutput();
	output("With amber seed leaking from your lips and gaping ass, you crawl away from the two zil, your own lusts seeming to regulate as the Zils calm down, finally sated. The yellow and black aliens relax against the far wall of the cell, yellow jacket grabbing you and pulling you back onto his cock as they regard the foxy police girl. You groan as the potent alien pulls you into his lap, one hand stroking his brightly colored cock as the other swirls his brother's seed around in your abused hole, readying you for round two.");
	output("\n\n<i>\"T-that's enough,\"</i>  Penny groans, pulling herself up off the floor. <i>\"You two bastards have had your fun, now talk.\"</i>");
	
	//If PC has a vag:
	if (pc.hasVagina()) 
	{
		output("\n\nThe Yellowjack laughs in the police girl's face as he lowers your defenseless body down on his prick, spearing into your so-far untouched [pc.vagina]. <i>\"We came to this town to breed, little girl. We'll talk, but first...\"</i>  He pushes you down, making you support yourself on your arms, hands planted on the cold, cum-slick ground. Digging his fingers into your [pc.butt], the Zil soon has you humping up and down on his prick, taking his cock deep into your womb. You look helplessly up at Penny, but there's nothing she can do to save you now. Not without meeting the same fate.");
		cuntChange(0,foes[0].cockVolume(0));
	}
	//IF PC don't have a cunt: 
	else
	{
		output("\n\nThe Yellowjack laughs in the police girl's face as he lowers your defenseless body down on his prick, spearing into your ass, using his brother's cum as lube for a nice, easy sloppy second. <i>\"We came to this town to breed, little girl. We'll talk, but first...\"</i>  He pushes you down, making your support yourself on your arms, your hands planted on the cold, cum-slick ground. Digging his fingers into your [pc.butt], the zil soon has you humping up and down on his prick, taking his cock deep into your bowels. You look helplessly up at Penny, but there's nothing she can do to save you now. Not without meeting the same fate.");
	}
	output("\n\nWith little other choice, Penny begins interrogating the Zil, trying to drag information out of him as the yellowjacket busily defiles your [pc.vagOrAss].");
	output("\n\n<i>“Does everyone out here on the rim spend all their time trying to fuck everyone else?”</i>  Penny asks, watching with a mix of arousal and disgust as you start to bounce on the Zil's cock, unable to mask the pleasure that's taking hold in your abused body. The Zil laughs, holding onto your hips as you move, guiding your motions. The dusky brother joins in, too, getting to his feet and presenting his cock to you: the sudden influx of his returning aroma has you sucking it in seconds.");
	output("\n\nThe triumphant Zil laughs, <i>“It is a custom when meeting other tribes. Sex establishes dominance and who is to be obeyed. Even though you’re aliens, we see now that your culture is similar. We thought if we could dominate you, you would acknowledge us and leave.”</i>  He grins through the bars, but grits his teeth as he cums again, filling your ");
	if(pc.hasVagina())
		output("womb");
	else
		output("bowels");
	output(" with another hot, sticky load of honey-colored cum. <i>“And what are you going to do about it, hmm? Clearly your friend likes it... " + pc.mf("he","she") + " knows the way of the world. Dominate, or submit. There is no other choice.”</i>");
	output("\n\nYou note that the crotch of Penny’s trousers has begun to soak through. She just can’t hide how hard she got off to watching you tangle with the slutty aliens. She bites her lip. <i>“But you're the ones behind bars. You're </i>my<i> prey, now. You'll submit to me, or rot in here.”</i>");
	output("\n\nA moment passes. You gag as the dusky Zil brother fills your mouth with a heady load of sweet cum. Then, glumly, they nod. They're sexual predators, but not stupid... and they're awfully sexy. Dominant beasts of sensual prey - you shake your head and spit out the cum, trying to focus.");
	output("\n\nPenny continues more confidently, <i>“Good. If you want to be left alone, then don't come into town trying to fuck everyone. I'm going to release you, but you WILL listen to me: be sure to and tell your people that we’ll kill anyone that comes into town trying to force ‘customs’ on us again. I don't give a damn about your sick take on dominance; we do NOT exist to be fucked by your people. Do you fuckheads understand that? We will </i>kill<i> the next one that tries to rape an offworlder. Make sure that message spreads through all your villages. I don’t care if you have to fuck or get fucked by every one of them to do it,”</i>  Penny declares while pulling her mask back on and hastily twining her wraps back around her torso, covering them them partway with her vest a minute later. <i>“Gotta keep the girls in place,”</i>  she mutters as her hard nipples press plainly through the fabric.");
	output("\n\nPenny smirks and points you to a shower while she finds some restraints. <i>“Get cleaned up, I’ll take care of the hooligans.”</i>  You are a bit worked up from the fight. A shower would be nice.");
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",finishLosingToZilYouLoser);
}

//[Next]
function finishLosingToZilYouLoser():void {
	clearOutput();
	output("The shower is blessedly warm, washing the away the filth of the encounter and easing your worked-up body. By the time you finish, you’re feeling a little calmer and more in control of your rampantly sexual urges.");
	output("\n\nWhen you step out, the cell room is empty and the wonderful-smelling zil are gone...");
	//Reduce libido and stick PC in empty jail room.
	//(NO WAY SAV-O)
	pc.libido(2);
	//Pass 30m
	processTime(30);
	flags["ZIL_PROBLEM_DEALT_WITH"] = 1;
	combatOver();
}

//Win to Zil Pair
function defeatZilPair():void {
	clearOutput();
	output("The zil slump over into a pile, ");
	if (foes[0].HP() <= 0) 
		output("no longer aroused and very much looking like the fight has been beaten out of them");
	else 
		output("sucking each other’s cocks idly while presenting their bottoms to you");
	output(". Exposed to their pheromones as you were, you do realize that you’ve become aroused by fighting in their presence");
	if (pc.hasCock() && pc.hasVagina())
		output(", and both your [pc.vaginas] and [pc.cocks] are engorged and ready");
	else if (pc.hasCock())
		output(", and [pc.eachCock] is hard and ready");
	else if (pc.hasVagina())
		output(", and [pc.eachVagina] is moist and ready");
	else
		output(", and your [pc.asshole] tingles in anticipation");
	output(". You’re in the process of considering scratching your itch when a satisfied from groan from Penny catches your attention.");
	
	output("\n\nPants slip up over the fox-girl’s delta just as you turn back to regard her, obscuring the thoroughly juiced panties from view. She catches you looking and smirks, mirth twinkling in her eyes. <i>“Ease up there, lover-" + pc.mf("boy","girl") + ". These are my prisoners and it’s time to interrogate them. One of us has to keep a clear head.”</i>  Penny wipes her stained fingers on her trousers as she steps between you and the zil, snapping her bra back into place as she goes.");
	output("\n\n<i>“Hey, native jackasses!</i> Penny slaps one of the zil. <i>“Why’d you have to make things so goddamned hard on me?”</i>  Penny growls in the back of her throat. <i>“Does everyone out here on the rim spend all their time trying to fuck everyone else?”</i>");
	output("\n\nThe zil, looking confused and hurt, answers, <i>“Is custom when meeting other tribes. Sex establishes dominance and who is to be obeyed. Even though you’re aliens, we assumed your culture is similar. We thought if we could dominate you, you would acknowledge us and leave.”</i>  He slumps, looking defeated. <i>“Are you going to take us now?”</i>");
	output("\n\nYou note that the crotch of Penny’s trousers has begun to soak through. She just can’t hide how hard she got off to watching you tangle with the slutty aliens. She bites her lip. <i>“Well since you two are my... </i>prey<i>, I guess you’ve gotta listen to me now, huh?”</i>");
	output("\n\nBoth zil nod.");
	output("\n\nPenny continues more confidently, <i>“Good. I’m going to lead you out of here on leashes in a minute. You be sure to and tell your people that we’ll kill anyone that comes into town trying to force ‘customs’ on us again. Make sure that message spreads through all your villages. I don’t care if you have to fuck or get fucked by every one of them to do it,”</i>  Penny declares while separating herself from the beaten zil. She grabs her wraps and hastily twines them around her torso, covering them partway up with her vest a minute later. <i>“Gotta keep the girls in place,”</i>  she mutters as her hard nipples press plainly through the fabric.");
	output("\n\nPenny smirks and points you to a shower while she finds some restraints. <i>“Get cleaned up, I’ll take care of the hooligans.”</i>  You are a bit worked up from the fight. A shower would be nice.");
	//[Next]
	pc.lust(10);
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Neat",beatPennysZilPartII);
}
function beatPennysZilPartII():void {
	clearOutput();
	output("The shower is blessedly warm, washing the away the filth of the encounter and easing your worked-up body. By the time you finish, you’re feeling much calmer and more in control of your urges.");
	output("\n\nWhen you step out, the cell room is empty and the wonderful-smelling zil are gone....\n\n");
	//Reduce libido and stick PC in empty jail room.
	flags["ZIL_PROBLEM_DEALT_WITH"] = 1;
	pc.libido(-.5);
	//Pass 30m
	processTime(30);
	genericVictory();
}

//Visit Penny Post Problem 1x
//Penny admits to all her second-hand gene splices making her libido rather out of control, accidentally lets slip that’s actually kind of lonely which makes it worse. Opens up repeat talk options but not sex.
//Repeat Greetings
//Friendly stuff - all her talk options. Doing all the talks opens up options for sexy.
//Despite earlier sexiness
	//Appearance blurb: 
	//Actual approach:
function approachFriendPenny(outputT:Boolean = true):void {
	this.userInterface.showBust("PENNY");
	if(outputT) {
		clearOutput();
		output("Penny turns back up at you, greeting, <i>“’Sup, crazy? Need a hand for anything? I still owe you, you know.”</i>  Her voice carries a playful undertone, like she’d rather not be working. Perhaps you could offer her a welcome distraction.");
	}
	this.userInterface.clearMenu();
	this.userInterface.addButton(14,"Back",mainGameMenu);
	this.userInterface.addButton(0,"Talk:Yourself",talkToPennyAboutYourself);
	this.userInterface.addButton(1,"Talk:Youth",pennysYouth);
	this.userInterface.addButton(2,"Talk:Fun",whatDoesPennyDoForFun);
	this.userInterface.addButton(3,"Talk:Species",talkToPennyAboutSpecies);
	if((pc.hasCock() || pc.hasVagina()) && pc.lust() >= 33) this.userInterface.addButton(4,"Sex",pennySexFirstTime);
	else this.userInterface.addDisabledButton(4,"Sex");
}

//[Sex]
function pennySexFirstTime():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	//Not Done All Talks Yet
	if (flags["TALK_WITH_PENNY_ABOUT_YOURSELF"] == undefined || flags["TALK_WITH_PENNY_ABOUT_YOUTH"] == undefined || flags["TALK_WITH_PENNY_ABOUT_FUN"] == undefined || flags["TALK_WITH_PENNY_ABOUT_SPECIES"] == undefined)
	{
		output("You suggest that the two of you could slip into the shower for a little fun if work is getting her down.");
		output("\n\n<i>“Look, [pc.name], I know things were a bit weird earlier, but that doesn’t mean I shimmy out of my shorts for just anyone,”</i>  Penny says with a sigh. <i>“I mean, we don’t even know each other all that well yet. Heck, you don’t even know </i>");
		var shitPennySays:Array = new Array();
		if(flags["TALK_WITH_PENNY_ABOUT_YOURSELF"] == undefined) shitPennySays[shitPennySays.length] = "if I like you that way";
		if(flags["TALK_WITH_PENNY_ABOUT_YOUTH"] == undefined) shitPennySays[shitPennySays.length] = "my last name";
		if(flags["TALK_WITH_PENNY_ABOUT_FUN"] == undefined) shitPennySays[shitPennySays.length] = "what kinds of things I do for fun";
		if(flags["TALK_WITH_PENNY_ABOUT_SPECIES"] == undefined) shitPennySays[shitPennySays.length] = "what species I am";
		output("<i>" + shitPennySays[rand(shitPennySays.length)] + "</i>");
		output("<i>!”</i>  She chuckles to herself before dazzling you with a open smile. <i>“That doesn’t mean I don’t appreciate the attention - I do... but even a lonely law woman on a crazy alien planet has to have standards.”</i>");
		output("\n\nThe foxy fennec fiddles nervously with the back edge of her mohawk, where it meets the nape of her neck. <i>“Stick around, crazy, and maybe sometime you might talk me into it.”</i>  The way she fidgets, you swear she should be blushing, but it’s impossible to tell through her fur. Perhaps this is one case where her inhumanity provides an advantage.");
		processTime(4);
		approachFriendPenny(false);
	}
	//Done All Talks (Req’s Gender)
	else {
		output("You suggest that the two of you could slip into the shower for a little fun if work is getting her down.");
		output("\n\nPenny looks up at you with a little bit of red tinge in her big blue eyes. <i>“You aren’t joking, are you?”</i>");
		output("\n\nSmiling warmly, you confirm that you aren’t.");
		output("\n\n<i>“Even after... knowing what I am, and what a... what a loudmouth I can be? You still want to fuck me?”</i>  The words ‘fuck me’ are almost whispered.");
		output("\n\nYou nod");
		if(pc.isNice()) output(" and tell her she’s quite a specimen, fur and all.");
		else if(pc.isMischievous()) output(" and tell her that you don’t mind, so long as she doesn’t start smelling like a wet dog after she cums.");
		else output(" and tell her that you won’t be satisfied until you’ve had her.");
		
		output("\n\nPenny stands up at that point, sending her chair skittering against the wall behind her. One narrow finger depresses a key on her keyboard, and you hear the whole unit power down, followed closely by the solid ‘ka-chunk’ of the outside door sealing. She kicks out of her pants without a word, a pair of panties following shortly behind. Swaying back and forth, the bottomless fennec sheds her unclosed vest and begins unwrapping the bindings that keep her chest in place. Her mammaries seem to swell larger and larger with each and every piece of fabric that is removed, eventually resolving into a pair of double D’s held snugly aloft by a white bra. Even that soon vanishes, forgotten by both of you as it falls into the mound of discarded garments.");
		output("\n\nStrutting over to you, the naked fox waves her tail gracefully around herself, concealing and revealing her assets with surprising dexterity. You have a moment to admire Penny, and you take it, brazenly leering at her body. Her nipples are bright pink and about the size of quarters. They look to be entirely areola until you see the slit in the middle, revealing that the fox woman has inverted nipples. The whole of their surface is already puffy and somewhat engorged, eager to be touched and squeezed. Her middle is white with lighter colored fur, blending into the orangey-yellow that wraps the rest of her body near her hips and sides. Further down, just around her sex, Penny’s fur fades away entirely, though you’re unsure if it is a genetic quirk of her mutations or simple grooming. Regardless, there’s a nice, moist slit at the juncture of the vulpine’s legs. The outer lips are nice, large, and puffy, while her inner labia are small enough that you can barely see them through Penny’s swollen mound. Around the entrance the pink gives way to a deeper, almost purplish-red.");
		output("\n\n<i>“Like what you see?”</i>  Penny asks.");
		output("\n\nYou nod eagerly, flushing a bit with your own lust at the completely exposed vixen");
		if (pc.hasCock() && (pc.armor.shortName != "" || pc.lowerUndergarment.shortName != ""))
		{
			output(", tenting your ");
			if (pc.armor.shortName != "") output("[pc.armor]");
			else output("[pc.lowerUndergarment]");
			output(" noticeably with your engorging mast");
			if(pc.cockTotal() > 1) output("s");
		}
		else if(pc.hasCock())
		{
			output(", growing hard with shameful rapidity");
		}
		else if(pc.hasVagina()) output(", [pc.eachVagina] moistening enough that you wonder if the fennec’s keen nose can smell it");
		output(".");
		
		output("\n\nPenny presses herself up against you, tilting her head");
		if(pc.tallness >= 65) output(" back");
		else if(pc.tallness <= 55) output(" down");
		output("to peer into your eyes. Her moistening cleft presses against your [pc.leg] as she looks at you");
		if(!pc.isNude()) output(", slowly tracing her fingers across your gear, undoing it with quick pulls");
		else
		{
			output(", slowly letting her hands explore your exposed torso");
			if(pc.biggestTitSize() >= 1) output(", focusing mostly on your [pc.fullChest]");
		}
		output(". <i>“So, you’re trapped in here with a sexy fox,”</i>  Penny says with an almost feline purr. <i>“A sexy, hungry vixen.”</i>  She takes your hand and presses it against her moist mons. <i>“Now, you’d better not disappoint her,”</i>  she says with a nip at ");
		if(pc.tallness <= 60) output("your ear");
		else if(pc.tallness <= 72) output("your neck");
		else output("your side");
		output(", <i>“...or who knows what she’ll do.”</i>");
		
		output("\n\nThe fox-morph grabs your [pc.butt] in her hands, squeezing your cheeks momentarily, distracting you from the loss of heat against your front. Once she lets go, you discover that Penny has circled around you. She’s at a doorway now, her butt wiggling in your direction with her tail upraised as she fiddles with the portal’s control panel. You come after her, but the door chooses that moment to open, allowing Penny to slip away. The last thing you see is the flash of a tail vanishing into the darkness. Well, you may as well follow and finish....");
		//[Next]
		processTime(10);
		this.userInterface.clearMenu();
		if(pc.hasCock()) {
			if(pc.cockThatFits(penny.vaginalCapacity()) >= 0) this.userInterface.addButton(0,"Next",firstTimePennyShowerSex);
			else this.userInterface.addButton(0,"Next",stickAHugeDickInPennysWorld);
		}
		else this.userInterface.addButton(0,"Next",femaleFirstTimePennyLesboz);
		flags["SEXED_PENNY"] = 1;
	}
}

//Male First Time Shower Sex
function firstTimePennyShowerSex():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	var x:int = pc.cockThatFits(penny.vaginalCapacity());
	if(x < 0) x = 0;
	var y:int = pc.cockThatFits2(penny.vaginalCapacity());
	output("Stepping into the next room, you hear the gentle sound of a running shower. You follow the auditory trail through another doorway, getting hit by a wave of steam and a view of feminine curves all at once. Penny is standing in a surprisingly large shower stall with the door open and the water running down her back, slicking her fur down so that it shines with the moisture. She beckons you closer, saying, <i>“I don’t bite... much.”</i>");
	output("\n\nYou step in alongside her, letting the hot water run over your [pc.skinFurScales]. The heat practically melts the soreness and exhaustion from your body, though it does nothing for the different warmth blooming in your loins. In fact, the burgeoning lust seems to expand, spreading through your limbs when Penny presses her warm, wet form against you, her arms winding their way to your groin, sliding her palms down your [pc.belly] until they press against the turgid mass of [pc.oneCock].");
	output("\n\n<i>“Mmm, a fitting tribute, prey,”</i>  Penny coos from behind you. One hand wraps around your " + num2Text(pc.cocks[x].cThickness) + " of girth, squeezing it softly. <i>“I like to play with my food.”</i>  True to her word, she begins to stroke you, sliding her water-slicked palm up and down along your length. Her other hand ");
	if(pc.hasVagina()) 
	{
		output("seeks out your [pc.vagina]");
		if(pc.balls > 0) output(", though first it has to burrow behind your [pc.balls], eventually");
		output(",");
		output(" sinking into your folds to explore your channel.");
	}
	else if(pc.balls > 0) output("seeks out your [pc.balls], cupping them gently. She rolls them around while she works your shaft, careful to heft them gently, lest she damage the sperm inside.");
	else output("curls into a tight ‘o’ around your base, trapping the blood there so that you grow bigger and more sensitive in her grip.");
	output("\n\nYou brace your hand against the wall to keep your balance in the face of the sensations rushing out of your groin. Your [pc.legs] seem weak while your [pc.hips] seem determined to thrust, but to do so now would only tear your maleness from the aggressive fennec’s wonderful fingers.");
	
	output("\n\nThe gentle slap Penny’s hand makes whenever she bottoms out against your ");
	if(!pc.hasSheath(x)) output("crotch");
	else output("sensitive sheath");
	output(" soon fills the shower. ");
	if(pc.cockTotal() > 1)
	{
		output("Her other hand moves away from your ");
		if(pc.hasVagina()) output("[pc.vaginas]");
		else if(pc.balls > 0) output("[pc.sack]");
		else output("dick");
		output(" and over to another penis, allowing her to double the handjob. She works the [pc.cock " + y + "] with matched pumps, gleefully using your array of handholds to her advantage. ");
	}
	output("Plush breasts push up against your back, grinding against you as Penny’s eager handjob becomes more enthusiastic.She leans ");
	if(pc.tallness >= 72) output("under your arm");
	else if(pc.tallness >= 55) output("around you");
	else output("over top of you");
	output(" and looks ");
	if(pc.tallness <= 55) output("up");
	else output("toward you");
	output(", grinning in the sharp-toothed, almost frightening way that only predators can. Her fluffy ears tickle you slightly, and before long the smile is replaced by an open mouth and panting tongue. You shudder slightly, rocking your waistline back and forward with her strokes, no longer able to completely restrain yourself. <i>“Atta " + pc.mf("boy","girl") + ",”</i>  she whispers encouragingly.");
	
	output("\n\nDollops of pre-cum begin to leak from your tip, though the water mixes with them almost immediately, diluting them even as they decrease the friction you’re feeling on your rod");
	if(pc.cockTotal() > 1) output("s");
	output(". Penny’s palm becomes so slick that she starts to slide faster without meaning to, pumping harder and faster, making you mast and thicken in her hand, your member leaking its love-juice more freely in response.");
	if(y >= 0) output(" The second lucky cock is soon sluicing its own prejaculate over the fox-girl’s other hand.");
	output(" Giggling, the chesty fennec pulls her hand");
	if(y >= 0) output("s");
	output(" away and sidles around your side, making a show of smearing her well-lubricated hands along her chest, massaging her hefty globes. Her rounded areolae grow larger and more prominant thanks to the attention until she squeezes them. Like sexual turkey timers, two nubs pop out of their hidden slits, each standing proud and erect, nearly three quarters of an inch long. It seems Penny is ready to go.");
	
	output("\n\nYou gawk as she ");
	if(pc.tallness >= 78) output("climbs up onto the lip of the tub, grabbing hold of your shoulders for balance as she lines herself up for penetration.");
	else output("comes the rest of the way in front of you, pressing her lips against the curve of your shaft as she prepares to penetrate herself on you.");
	output(" The fox-girl jumps without any kind of warning, using her arms to hold herself while she aligns her wet nethers with your equally-soaked cock.");
	if(y >= 0) output(" The second flops around, unused, until you grab it and angle it toward the vixen’s unclaimed asshole.");
	output("<i>“Now, to take you as mine,”</i>  Penny hisses, slowly lowering herself towards your waiting " + pc.cockHead(x));
	if(y >= 0) output(" and " + pc.cockHead(y));
	output(". Her velvety-soft lips slowly, exquisitely part around you, kissing the most sensitive parts of your dick");
	output(" with soaked, silken kisses. Her tunnel stretches to hold you");
	if(y >= 0) output(", just as her pucker gives into persistent, back-door prodding");
	output(", and Penny sighs comfortably, languidly filling herself with cock, one inch at a time.");
	
	output("\n\nPenny’s pussy devours your " + pc.cockDescript(x) + " over the span of a minute or so. Every time you twitch or move to thrust inside her, she backs off, lifting an inch or two away, forcing you to calm the instincts that madly demand you rut the bitch.");
	output("\n\n<i>“Mine,”</i>  the vixen growls, suddenly slamming herself down to your " + pc.sheathDescript(x) + " with a powerful thrust. Her innards squeeze down around your " + pc.cockDescript(x));
	if(y >= 0) output(" and " + pc.cockDescript(y));
	output(", binding you in the fennec’s sex. Legs wrap around your [pc.butt], and Penny suddenly kisses you. Her tongue slithers into your mouth, prying your lips apart so that it can caress your own. You find yourself kissing back; you’re far too turned on not too. Your hips buck against her, slamming her into the wall in your eagerness to truly fuck her, but she’s already fully impaled. There’s no further penetration to be gained by such an act, and unless she unwraps her legs, she’s going to stay that way. Her claw-like fingernails dig into your back hard enough to draw lines of blood, the pain actually pulling you from your rutting stupor.");
	
	output("\n\nPenny growls, <i>“Be still, my lucky, " + pc.mf("handsome","sexy") + ", prey.”</i>  She does not merely command you, however. Her hips lift with her words, and she begins to slide herself up and down your pole. Your newly inflicted wounds ache, but she tenderly begins to wash them, using the water that’s pouring over you both to care for the damage she’s done. From her position, Penny can fuck you quite well. Her heavenly slit stretches wonderfully with each fuck");
	if(y >= 0) output(", her ass tighter and differently textured but equally pleasant");
	output(", making you throb with such need that [pc.eachCock] feels ready to explode.");
	if((pc.cockTotal() == 2 && y == -1) || pc.cockTotal() > 2)
	{
		output(" The untaken portion of your genitals are suddenly wrapped in tail, the fluffy, silky fur stroking your heated boner");
		if(pc.cockTotal() > 1) output("s");
		output(" with long, wet caresses.");
	}
	
	output("\n\nRiding you faster and faster, the vixen starts to groan and growl in equal measure. Her facade is cracking away, allowing you to see her sinking into the pleasure, submerging herself in lust with each drop down onto your dick");
	if(y >= 0) output("s");
	output(". The growls eventually give way to plaintive whines, and her authoritative grip loosens, slackening under her growing heat. You take the opportunity to thrust against her, pounding her pussy with every downstroke she makes, slamming your hips hard into hers. You passionately kiss her, wrapping one arm around her waist to allow you to control the pace more readily, not that it matters. You’re both operating like two halves of a sexual machine, running at the red-line, shaking your bodies so that your piston is plowing through her oil-slick snatch so fast it feels like a blur of pleasure.");
	output("\n\nPenny breaks the kiss, but only to cry out. Her orgasmic scream is muffled by your shoulder, as she bites down on it a moment later, hard enough that for a moment, you worry she’s wounded you again. That thought is obliterated by the sudden onslaught of attention from her pussy, which is wringing you tightly within her folds, squeezing, twitching, and fluttering around your " + pc.cockDescript(x) + " in an attempt to share the orgasmic delights it’s experiencing.");
	if(y >= 0) output(" Her asshole is not nearly as active, but her ring does squeeze tight, forcing your dick to bloat within her to what feels like elephantine proportions.");
	output(" The feelings the fox-girl is forcing into you obliterate your worry and replace it with pleasure, starting in a knotted up ball of heat inside you. You unthinkingly plow the whole way inside her and hold her there, cock-stuffed as you begin to spew your load.");
	
	output("\n\nPenny’s convulsing cunny gleefully accepts the [pc.cum] you spray into it, taking it deep inside her pussy, perhaps even all the way into her womb.");
	if(pc.hasKnot(x))
	{
		output(" She grunts as your knot swells within her, eyes wide as her gene-spliced pussy starts a second orgasm from being mated the way she was meant to be. Her body goes limp in your arms, and you’re forced to support the pleasure-drunk fox, your gushing goo filling her with an instinctual lust that drowns reason and leaves only a savage, primal love.");
		if(pc.cumQ() < 750) {}
		else if(pc.cumQ() < 2000) output(" Her belly rounds slightly from all you put into her, but the way her eyes are rolling back, you’re sure she doesn’t mind the added weight.");
		else
		{
			output("Her belly balloons from all the spunk you pour into her, but the way her eyes roll back and her mouth mouths ‘more,’ you’re sure she doesn’t mind.");
			if(pc.cumQ() >= 5000)
			{
				output(" Of course, after that the pressure becomes to great, and your [pc.cum] runs out in a wave, ");
				if(pc.cumQ() <= 10000) output("puddling at the bottom of the tub");
				else if(pc.cumQ() <= 20000) output("slowly filling the tub");
				else output("slowly filling the tub until you fear it will overflow");
				output(".");
			}
		}
	}
	else
	{
		if(pc.cumQ() <= 50) output(" Droplets of it leak down her legs to be washed away before they can dry, and you stay inside her until you’ve squeezed out every drop.");
		else if(pc.cumQ() <= 250) output(" Some of it oozes down her legs in thick streams. The water ensures it doesn’t get to dry there, but you’re cumming hard enough for it not to matter.");
		else
		{
			output(" Waves of [pc.cumColor] fluid roll down the fennec’s thighs, drenching her legs faster than the water can wash it away. Penny’s pussy is turned into a [pc.cum] fountain by your orgasm, and all she can do is hang there, orgasming so powerfully that she looks about to lose consciousness.");
			if(pc.cumQ() >= 1000) output(" Her belly expands under your sordid care, rounding nicely into a little paunch, filled with [pc.cum].");
			if(pc.cumQ() >= 3000) output(" Your body refuses to stop there, and soon that paunch transforms into a gravid tummy, packed full of your fluid.");
			if(pc.cumQ() >= 5000) 
			{
				output(" She whimpers when her body becomes to full to handle any more, and the cum running out of her speared slit begins to fill the tub faster than it can drain, turning the enclosure into a ");
				if(pc.cumQ() <= 5500) output("inch deep puddle");
				else if(pc.cumQ() <= 6000) output("two inch deep puddle");
				else if(pc.cumQ() <= 6500) output("four inch deep puddle");
				else output("almost a foot deep puddle/tub full of sex-juice");
				output(".");
			}
		}
	}
	output("\n\nGradually sliding down, ");
	if(pc.hasKnot(x)) output("hanging for a moment before she pops off, ");
	output("Penny eventually frees herself from your manhood and collapses into the tub. She looks at you through bleary eyes and abruptly climbs back up, ");
	if(pc.cumQ() >= 2000) output("cradling her stuffed middle and ");
	output("kissing you on the lips. You kiss her back until you both tire of dueling tongues and simply enjoy feeling of the shower washing you clean, helping each other to scrub off.");
	output("\n\n<i>“My mate...”</i>  Penny muses out loud, <i>“I like the sound of that.”</i>  She looks at you with a warm smile, putting an arm around your ");
	if(pc.tallness <= 55) output("shoulder");
	else if(pc.tallness <= 75) output("waist");
	else output("hips");
	output(". <i>“My </i>");
	if(pc.tallness <= 50) output("<i>little </i>");
	else if(pc.tallness >= 70) output("<i>big </i>");
	output("<i>mate. We’ll have to do something like this again, and soon.”</i>  She smiles. <i>“It is nice to finally cut loose with someone. I just hope you don’t mind to much when I get all riled up and get a little predatory on you.”</i>  Her hand traces down your flank. <i>“You are one delicious piece of prey, though.”</i>");
	output("\n\nThe conversation dies away, and the two of you get dressed to go on your separate ways. You find yourself on the receiving end of a tonguing kiss before Penny goes back to work, looking more satisfied than you’ve ever seen her.");
	pc.orgasm();
	processTime(75+rand(25));
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}
//Female First Time Shower Sex
function femaleFirstTimePennyLesboz():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("Stepping into the next room, you hear the gentle sound of a running shower. You follow the auditory trail through another doorway, getting hit by a wave of steam and a view of feminine curves all at once. Penny is standing in a surprisingly large shower stall with the door open and the water running down her back, slicking her fur down so that it shines with the moisture. She beckons you closer, saying, <i>“I don’t bite... much.”</i>");
	output("\n\nYou saunter closer, feeling the telltale moistness of your arousal building in [pc.eachVagina]");
	if(pc.wetness() >= 5) output(", cascading down your [pc.legs] as it passes far beyond what any normal woman could hope produce");
	else if(pc.wetness() >= 3) output(", dripping down your [pc.legs] thanks to your copious secretions");
	output(". Before you’re halfway there, Penny is over the lip of the tub and bounding into you, her water-soaked fur crashing into your [pc.skinFurScales], pressed against your body by her heaving tits. You allow her to take your hand and lead you back to the shower. Her eyes flick ");
	if(pc.tallness >= 66) output("up");
	else if(pc.tallness >= 55) output("over");
	else output("down");
	output(" at you as she leads you into the streams of heated moisture, visibly shivering with delight at the feeling of the water jets on her back. She drops your hand, and you numbly look at the glistening fox, watching drops of water roll across her pebbly nipples, her glossy breasts moving from side to side, hypnotically.");
	
	output("\n\nSuddenly pressing into your lubricated nethers, the vulpine’s fingers splash down in [pc.oneVagina], hooking up inside you to press on your sensitive places, her thumb coming to rest upon ");
	if(pc.totalClits()/pc.vaginaTotal() > 1) output("a ");
	else output("your ");
	output(" clit");
	output(". A smile spreads across her face as your [pc.legs] turn to rubber, and Penny presses herself against you, toying with you while she mouths, <i>“Gotcha.”</i>  Her other hand paws at your [pc.fullChest], grabbing ");
	if(pc.biggestTitSize() >= 1) output("a breast");
	else output("a pec");
	output(" and rubbing around the [pc.nipple]. <i>“Now, what to do with my poor, trapped prey,”</i>  she says, giggling when her fingers hit a sensitive spot and drop some of your weight into her arms. <i>“Atta " + pc.mf("boy","girl") + ".... I’m going to take you and make you mine... my mate. You don’t mind, do you?”</i>");
	
	output("\n\nYou open your mouth, but as soon as you do, Penny’s thumb graces the sensitive flesh around your [pc.oneClit] with steady circles. Her other exposed fingers spread apart your lips, dilating your entrance to better allow her middle fingers to penetrate you. All that escapes your mouth is a pleasured gasp, and it turns into a moan a moment later. You writhe on the pretty fox’s fingers with sensuous need, bucking your [pc.hips] against her for more: more touches, more penetration, more teasing of your nipples. You want it all.");
	if(pc.tallness >= 84) output(" If you were more conscious of the scenario, you’d find it almost comical how the little fennec is supporting your larger frame. Instead, you luxuriate in the moment, leaning back against the wall while Penny helps to keep you on your [pc.feet] in the water.");
	
	output("\n\n<i>“Speak up,”</i>  Penny says encouragingly, <i>“I couldn’t hear you. You came into this shower, my little trap, and now you’re not leaving until I’ve made you my mate. Or would you rather remain my prey, to be taken and discarded once you satisfy me?”</i>");
	output("\n\nAll you can manage to do is moan and nod, almost gibbering from pleasure.");
	if(pc.hasNippleCocks()) output(" Your [pc.nippleCocks] reveal themselves a moment later, springing out from your areolae, the flesh of your nipples looking like little more than an a sheath for your strange penises upon your chest. Each of them is already beading pre, and when Penny squeezes one, you almost gush more of the stuff on her arm, a prelude of the [pc.milk] to come. Penny purrs, <i>“Go on, squirt for me, my little mutant pet.”</i>");
	else if(pc.hasFuckableNipples())
	{
		output(" Penny’s fingers soon prod at the tips of your [pc.nipples], finding purchase at their apex that she clearly didn’t expect, judging by the shocked look on her face. She nervously pushes on, and her slender digits are soon sliding into your [pc.nippleCunts], disappearing into the improbable orifices with lewd squelches. You moan louder at this, assaulted by pleasures from sexes above and below, and [pc.milk]y moisture begins to leak out around her probing tips. Penny purrs, <i>“Go on, soak my fingers, </i>");
		if(pc.tallness <= 55) output("<i>little </i>");
		output("<i>pleasure pet.”</i>");
	}
	else if(pc.isLactating()) output(" [pc.Milk] has started to leak from your nipples, even though Penny barely touches them. She’s only squeezing them every now and again, mainly letting her fingers circle just beyond the areola, gathering up your leaking, lactic lube and smearing it over your breasts, painting them [pc.milkColor] until the water washes it away. Penny purrs, <i>“Should you moo for me, little cow?”</i>  You let out more, dripping the stuff.");
	else 
	{
		output(" Your [pc.nipples] are achingly hard by this point, ");
		if(pc.breastRows[0].nippleType == GLOBAL.FLAT) output("even though they have no proper tips, only engorged areolae, ");
		output("and Penny begins to properly work them, gliding her fingers in circles over their soft surface, gripping them between her thumb and index finger, gently tugging or rolling them in between. You gasp, arching your back to allow her better access, and the fox is more than happy to oblige, purring, <i>“A pity you don’t lactate, like proper prey.”</i>  She pinches, <i>“But, perhaps you might be a worthy mate after all.”</i>  Her digits hurriedly work your box, making you moan again. <i>“Maybe not.”</i>");
	}
	output("\n\nThe fox-girl pushes onward, guiding you down to the base of the tub. She quickly arranges your [pc.legs] to allow her the best possible access to [pc.oneVagina]");
	if(pc.totalVaginas() > 1)
	{
		output(", though she runs a hand over the other");
		if(pc.totalVaginas() > 2) output("s");
		output(", not wanting any part of you to feel left out");
	}
	else output(", admiring its flush, aroused state with a gentle squeeze of her hand");
	output(". You cry out and arch your back, battling momentarily being bereft of sensation and then soaking in lust, knowing only that you need to be touched. There’s a fire raging in your loins, and you know that to quench it, Penny has to give you more. Just as you’re lifting your [pc.hips], ");
	if(pc.totalVaginas() > 1) output("one of ");
	output("your hungry box");
	if(pc.totalVaginas() > 1) output("es");
	output(" is filled with fingers again, though they run over the vulvae before slipping through the curtains of your labia, eventually disappearing entirely into your rabbit hole. You feel yourself climbing up a cliffside, mounting the edge of a precipice involuntarily, pushed by Penny’s noisily pumping hand, her palm grinding the exterior of your sex while the fingers take you higher. You’re shuddering and twitching involuntarily, and you watch your new mate’s smile widen as she pushes you off the cliff.");
	
	output("\n\nYou bite your lip and let your eyes roll back, humping Penny’s hand as it carries you into orgasm. The contractions of pleasure run up from your [pc.feet], through your [pc.legs], across your spasming puss");
	if(pc.cockTotal() == 1) output("y");
	else output("ies");
	if(pc.cockTotal() > 0)
	{
		output(", into ");
		if(pc.cockTotal() > 1) output("each ");
		else output("your ");
		output("spurting erection");
	}
	output(", over your [pc.belly], and into your [pc.fullChest], causing your whole body to clench and relax over and over again. As you shudder and shake your way through release, the small fennec seems content to continue her ministrations, cooing, <i>“Good " + pc.mf("boy","girl") + ", cum for me.... Such obedient prey.”</i>");
	if(pc.hasCock())
	{
		output(" A look of irritation covers her face when [pc.cum] ");
		if(pc.cumQ() <= 1000) output("stains her fur");
		else if(pc.cumQ() <= 2000) output("fills the bottom of the tub");
		else if(pc.cumQ() <= 15000) output("turns the tub into a half-full bath");
		else output("floods the entire tub, covering you to your neck and her to her waist");
		output(", but it is soon forgotten once she sees your eyes roll back.");
		if(pc.isLactating())
		{
			output(" Your milk pours out to join the rest of the fluid in the tub");
			if(pc.cumQ() + pc.lactationQ() <= 1000) output(", vanishing down the drain as quickly as it appears");
			else if(pc.cumQ() + pc.lactationQ() <= 10000) output(", filling it a little bit higher");
			else if(pc.lactationQ() + pc.cumQ() <= 15000) output(", filling it to the brim");
			else output(", pouring out over the sides, wasted");
			output(".");
		}
	}
	if(pc.wetness() >= 5) {
		output(" Her hand is drenched with your secretions, suddenly soaked by your squirting cunt");
		if(pc.totalVaginas() > 1) output("s");
		output(". Feeling you gush around her intruding fingers brings a smile to the fox’s face.");
	}
	else if(pc.wetness() >= 2) {
		output(" Her hand is soaked with your copious secretions, coated with by your climaxing cunt");
		if(pc.totalVaginas() > 1) output("s");
		output(" secretions. Feeling you leak around her intruding fingers brings a smile to the fox’s face.");
	}
	else output(" Her hand grows even wetter thanks to your orgasmic secretions, and Penny smiles as she feels it happen.");
	pc.orgasm();
	output("\n\nOnly after you’ve finished thrashing orgasmically does the vixen deign to release your sex. You sag down into the tub, luxuriating in the wet heat after experiencing such bliss, but the look on Penny’s face makes it clear that she’s far from done. She steps forward, straddling your chest");
	if(pc.biggestTitSize() >= 20) 
	{
		if(!pc.hasNippleCocks()) output(" and gasping as your mammoth boobs barely fit beneath her");
		else output(" and gasping as your mammoth boobs push your engorged nipple-dicks up to grind against her lower lips");
	}
	output(", making her way up to present her plush, pink pussy your face. Her hand comes to rest affectionately on your head");
	if(pc.hasHair()) output(", stroking fondly through your [pc.hair]");
	output(", and she says, <i>“I showed you what I can do, darling. Now it’s time to return the favor.”</i>  As she speaks, her lips redden slightly, and you can tell she’s very horny, not just by the sight but by the smell as well. The fragrant scent of a woman in need is just inches from your nostrils.");
	
	output("\n\nYou let your fingers dive back into [pc.oneVagina]");
	if(pc.vaginaTotal() > 1) output(", a second hand finding another twat to fondle,");
	output(" and demurely lick your [pc.lips], egging the lusty fox on. You even lean up and extend your [pc.tongue], letting it hang out as an open invitation. Penny growls and throws her hips forward, pressing her fur-ringed mound into your face, the top of her folds parting on your nose while the majority of her channel rubs upon your unresisting mouth. She grabs you by the head and pushes harder, grinding her slippery snatch into your face, sliding her lower lips against your upper ones and alternatively releasing assertive growls and pleasured groans.");
	output("\n\n<i>“Ahhhh,”</i>  the fennec moans, <i>“I knew that mouth would be good down here, a perfect slit-stuffer, huh, my mate?”</i>  She doesn’t allow you to answer her rhetorical question, and instead gyrates in lewd semi-circles on your face. Her tiny button can be felt through her engorged mons, concealed with her small, inner labia behind the puffy, outer portion of her twat. Her juices are both sweet and tangy on your [pc.tongue], and you allow your hungry mouth-muscle to slide into her, burrowing as deeply as you can into her channel.");
	if(pc.hasTongueFlag(GLOBAL.LONG)) 
	{
		output(" Of course, you have a rather long tongue, so you’ve completely filled her gash with squirming oral appendage in no time flat.");
		if(pc.hasTongueFlag(GLOBAL.PREHENSILE)) output(" Your dextrous muscles make it easy to control your tongue inside her, and you coil it so that it can press on all the portions of her walls at once, sliding over every fold and sensitive portion with skilled licks.");
	}
	
	output("\n\nPenny’s pussy isn’t the only one getting attention; your talented fingers have been busy at your crotch, stirring your your soaked nethers until they’re ready to go off again. The fennec woman’s juicy slit isn’t far from climax either. Her hot little box is trembling around your tongue, dancing on the edge of orgasm. It’ll just take one little push to send her careening off into sexual ecstasy. You tip your head back and let your nose slip across the hidden bud, pressing just so on it, giving the fox-girl the stimulation her needy cunt is aching for. The reaction is as immediate as it is violent. Penny holds you firmly, grinding herself so hard against you that she must feel your teeth through your [pc.lips], her whole body quaking. Juices drip down your tongue, letting you know that the fennec is far from a squirter, but she’s plenty wet, judging by the way your throat is bobbing as you swallow. You reach another nice cum while your face is used by Penny’s pussy, providing a blissful memory to associate with the taste of her twat.");
	output("\n\nGradually slowing down, Penny’s frenzied humping eventually drains away to nothing, and she slides down your [pc.fullChest], groaning at the passage of each [pc.nipple], eventually perching atop your [pc.belly] in a fucked out puddle of fur. She looks at you through bleary eyes and abruptly kisses you on the lips, tasting herself on you and not caring in the slightest. You kiss her back until you both tire of dueling tongues and simply enjoy feeling the shower washing you clean, both standing to finish the job.");
	output("\n\n<i>“My mate...”</i>  Penny muses out loud, <i>“I like the sound of that.”</i>  She looks at you with a warm smile, putting an arm around your ");
	if(pc.tallness <= 65) output("shoulder");
	else if(pc.tallness <= 84) output("waist");
	else output("hips");
	output(". <i>“My ");
	if(pc.tallness <= 55) output("little ");
	else if(pc.tallness >= 72) output("big ");
	output("mate. We’ll have to do something like this again, and soon.”</i>  She smiles. <i>“It is nice to finally cut loose with someone. I just hope you don’t mind too much when I get all riled up and get a little predatory on you.”</i>  Her hand traces down your flank. <i>“You are one delicious piece of prey, though.”</i>");
	output("\n\nThe conversation dies away, and the two of you get dressed to go on your separate ways. You find yourself on the receiving end of a tonguing kiss before Penny goes back to work, looking more satisfied than you’ve ever seen her.");
	processTime(55+rand(25));
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

//Huge Dick First Time Sex
function stickAHugeDickInPennysWorld():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	var x:int = pc.biggestCockIndex();
	output("Stepping into the next room, you hear the gentle sound of a running shower. You follow the auditory trail through another doorway, getting hit by a wave of steam and a view of feminine curves all at once. Penny is standing in a surprisingly large shower stall with the door open and the water running down her back, slicking her fur down so that it shines with the moisture. She beckons you closer, saying, <i>“I don’t bite... much.”</i>");
	
	output("\n\nYou step over the lip of a large basin at the base of the shower, similar to a giant-sized tub, and let the water wash over your nude form. [pc.EachCock] is already suitably hard after the striptease Penny gave you. This is only a problem due to the mass of your [pc.cockBiggest]. It juts hard out in front of you, pressing against Penny’s belly button when you first enter, eager to reach inside her but so big that there’s no way the petite fennec could handle such a big, bitch-breaking fuck-stick. She shifts sideways, dragging it across her moisture-glossed fur inadvertently in a way that makes you groan. No matter how you move, your titanic endowment always seems to butt up against her body, forcing her to acknowledge your dick while simultaneously dulling your wits, flooding your mind with a haze of lustful impulses.");
	output("\n\nGrabbing hold of your [pc.cockBiggest], the fox-girl giggles, pointing it up so that it’s a bit less obtrusive. Her fingers can’t even fully encircle its thickness; the best she can do is lamely heft the shaft, her fingers sinking slightly into the fleshy mast due to its weight. <i>“You know, I had meant to ambush you and take you as my prey, but hung like that...”</i>  Penny half growls, half purrs, <i>“...there’s no doubt about it. You’re my mate... my thick... pulsating... monstrously endowed mate.”</i>  Penny leans forward to lick you, letting her warm, slippery tongue slide across every vein and feature, her moist nose exhaling panting breaths that wash across the rest of the twitching package.");
	
	output("\n\nYou lean against the wall and grab a nearby shower rung, nonchalantly standing there as the prick-hungry vixen worships your musky tool, rubbing her face against it with great enthusiasm. ");
	if(pc.hasKnot(x)) output("When she sees your knot, she gives it a happy squeeze.");
	else if(pc.hasCockFlag(x,GLOBAL.FLARED)) output("When she sees your flare, she licks around the edge of the expanding dick-rim with a happy hum.");
	else if(pc.hasCockFlag(x,GLOBAL.NUBBY)) output("When she feels the nubs, she stops and suckles on them one after another, happiness plastered on her face.");
	else if(pc.hasCockFlag(x,GLOBAL.STINGER_TIPPED)) output("When she feels the tendrils pricking on her cheek, she gasps and turns, unintentionally getting stung all over her lips. They swell slightly, but her eyelids lower as the aphrodisiac venom sinks in. Her oral service resumes in short order with even greater enthusiasm.");
	else if(pc.hasCockFlag(x,GLOBAL.AMORPHOUS)) output("When the heat half-melts your gooey boner, Penny purrs, blowing bubbles over your semi-liquid shaft to happily pleasure it. The bubbly bliss is intimately pleasurable, and Penny seems to greatly be enjoying the goo-play.");
	else output("When she notices you watching, she gives you a happy smile, nuzzling your dick with great enthusiasm.");
	output(" The short auburn hairs of her mohawk tickle your [pc.cockHeadBiggest] occasionally, causing you to jerk back a half-inch involuntarily before your lustful urges reassert themselves, compelling you to get closer and plant your dick back on the fennec’s whorishly-pleased face.");
	
	output("\n\nPenny inches her face to the side so that her hair will stop bothering you, which in turn causes your [pc.cockHeadBiggest] to slide through her soft fur and over the velvety interior of her fluffy ear, pushing it partway back. The sensation summons dollops of pre-cum up from inside you. It oozes out to be sloppily smeared over her auditory orifice’s plush covering, dripping down the side of her cock-obsessed visage quite fittingly.");
	if(pc.balls > 0) output(" Grabbing hold of you by your [pc.sack], a dangerous glint reappears in the fennec’s blue eyes. <i>“Gotcha.”</i>  Her fingers sink into the soft skin, just barely squeezing on your [pc.balls]. The touches are firm enough to make you wince, but pleasant enough that Penny’s ear catches a fresh coat of goo. You stand completely stock still; to move would risk injury, and there’s no way you’re getting out of her hand with the grip she has.");
	else if(pc.hasVagina()) output(" Hooking a finger in [pc.oneVagina], she crooks it to press on a sensitive bundle of nerves along the upper interior. A moment later, a second follows, giving her a firm grip on your cooch. <i>“Gotcha.”</i>  Penny’s grip is pleasant, but every little movement you make risks twisting or pushing her digits against your sensitive canal unpleasantly. She has you, hook, line, and sinker.");
	else output(" Slipping a finger behind you, Penny inserts the rogue digit into your unprepared anus. You try to pull away, but she curls it upward, hooking inside of you and arresting your movement rather suddenly. There’s a moment of pain, but once you still, you realize that the tip is moving in little circles inside you, orbiting a sensitive spot, you are overwhelmed by anal pleasure.");
	output(" <i>“Mmm, maybe I trapped some prey after all,”</i>  the vixen drawls.");
	
	output("\n\nImmobilized by firm fingers in your most tender areas, you have no choice but to let Penny play with your rod");
	if(pc.cockTotal() > 1) {
		output(", though sometimes she licks ");
		if(pc.cockTotal() == 2) output("your other member");
		else output("some of your other members");
	}
	output(", always returning to big, meaty focus of her attentions. She says, <i>“So much meat,”</i>  while licking it up from " + pc.sheathDescript(x) + " to [pc.cockHeadBiggest] again and again. <i>“I could just feast on this all day...”</i>  The busty vulpine rises up a bit to let the middle of your mast fall between her soaked breasts, lubricated with a mixture of water and your copious drippings, coming harder now thanks to what her busy fingertips are doing down south. Squishy, soft boobs wrap around you from either side. They’re not big enough to fully engulf your [pc.cockBiggest], but they compress quite nicely along your side, caressing you with squishy chest.");
		
	output("\n\nYou groan and pump your [pc.hips] in response, sliding your [pc.cockBiggest] through the chesty valley. ");
	if(pc.cockTotal() == 2) output("Your other penis slips under Penny’s armpit, squeezed into another tight crevice, surrounded by the perfect combination of heat, moisture, and pressure. ");
	else if(pc.cockTotal() > 2) output("Your other penises slip under Penny’s armpits, squeezed into two similar, tight crevices, surrounded by the perfect combination of heat, moisture, and pressure. ");
	output("Slobbering over the tip, Penny kisses it each time it lurches up to the apex of its pistoning motions. Sometimes she swirls her tongue over its entire crown, turning her saliva-oiled muscle into a vortex of salacious delight. You give up a fresh squirt of pre-cum and watch it adhere to the fox-babe’s tongue, stretching into a gossamer strand when you slide away from her increasingly-glazed maw.");
	
	output("\n\n<i>“Too bad... this mammoth... is too beastly... even for me,”</i>  Penny comments in between mouth-filling tit-fucks. <i>“I’d love to... feel it... inside me.”</i>  The next sound to come out of her mouth is a muffled moan that vibrates through your [pc.cockBiggest] and all the way into your spine, bringing you to the cusp of climax in an instant. Penny realizes this and holds you there, releasing her restraining grip on your ");
	if(pc.balls > 0) output("[pc.sack]");
	else if(pc.hasVagina()) output("[pc.vagina]");
	else output("[pc.asshole]");
	output(" so that she can handle a tit in each hand, bouncing them up and down alternatively. The waves of slick, mammary sensation wash across your pulsating length with such rapidly that your abdomen begins clenching and your dick begins flexing, building to an unavoidable, orgasmic deluge. Penny purrs, <i>“Give it to me, my new mate... my big, hung " + pc.mf("stud","breeder") + ". I want to taste it.”</i>");
	
	output("\n\nYour urethra bulges, first at the base and then at the tip. A moment later, your cum-slit opens up, and a thick jet of [pc.cum] launches forth, straight into the fox-girl’s open maw. Her eyes are twinkling happily while she watches lust consume your mind. Then, the next rope comes and paints her from nose to forehead, causing her to unintentionally blink over her beautiful blue orbs. She holds them closed while you pool cum on top of them, even getting some into her short mohawk.");
	if(pc.cumQ() >= 500)
	{
		output(" You grunt, your [pc.hips] lurching slightly with the spasms of ecstasy rolling through your body, flinging a steady flow of [pc.cum] across the few portions of her muzzle still unpainted. One spurt after another claims those rogue patches of fur, soaking them before sloughing off her cheekbones to drip down her body. The puddle in her maw deepens when a few blobs fall on her tongue and roll on in, but she doesn’t seem to mind.");
		if(pc.cumQ() >= 1000) output(" When you adjust your aim and completely fill the orifice with [pc.cum],not much changes. She pushes some out, and big blobs of your ejaculate splatter off her tits. This only serves to give your orgasm-riddled consciousness an idea. You aim lower and soak the nape of her neck, her tits, and then draw a line down her navel towards her unclaimed sex, painting the pink lips in your efflux.");
		if(pc.cumQ() >= 3000) 
		{
			output(" [pc.Cum] fills up the tub around your [pc.feet] thanks to your immense virility");
			if(pc.cumQ() >= 5000) 
			{
				if(pc.cumQ() >= 7000)
				{
					output(", and it just gets higher and higher ");
					if(pc.cumQ() <= 10000) output("before thankfully stopping halfway up");
					else output("until you worry it’ll overflow. Thankfully, your worry puts the brakes on your excessive orgasm, cutting it off before you flood the whole bathroom");
				}
			}
			output(".");
		}
	}
	output(" The corners of her mouth twist upward around the [pc.cumColor] puddle filling her mouth, luxuriating in the lewd face-painting you’ve doled out with a happy sigh.");
	
	output("\n\nPenny tips her head back under the shower to wash her eyes clear, making a show of swallowing the portion of your load still in her mouth while she does. <i>“Ahhh, tasty.”</i>  She gathers some up on her fingers and makes a show of sucking them clean. All the while, the cascading sheets of cleaning hydration clear her upper body completely. ");
	if(pc.cumQ() >= 3000) output("The drain gurgles under the load, but the ocean of love juice and h2o IS lowering. ");
	output("Safe to open her eyes, the fox-girl blinks her sticky eyelids apart, and she growls, <i>“I’m still horny.”</i>  Penny rises up out of the accumulated mess, hooking her leg behind yours so fast you that you’re barely aware of what’s going on before you’re falling, dropping straight into her waiting arms. She eases your climax-slackened musculature into a seated position and steps over your torso");
	if(pc.biggestTitSize() >= 1) output(", dragging her puffy, pink pussy across your [pc.nipples] with an agonizingly aroused moan");
	output(". Her soaking-wet cunt gradually finds its way up in front of your [pc.face], dripping water and feminine juices in almost equal measure.");
	
	output("\n\n<i>“I think,”</i>  Penny states, <i>“that it’s time for you to return the favor and show my just how good my new mate is at playing prey.”</i>  Her eyes twinkle mischievously. <i>“Lick.”</i>");
	//Should I ever feel like making a more dommy fork, this would be a good spot to insert it.
	output("\n\nThe pretty pussy in front of you is tempting enough that you don’t really need much encouragement to dive in. Its outer lips are plush with lust, while the inner labia are small enough to be barely visible in Penny’s current state. Prying her vulvae open, you take a good look at the slippery passage, noting that while her clit is exposed, it is quite tiny, almost undersized. The fox-girl responds to your touches by placing her hands on your head");
	if(pc.hasHair()) output(" and running her fingers through your [pc.hair] affectionately");
	output(", shifting position to rub herself against your digits. She’s so horny, and so very, very wet that you can feel her trembling against your touches.");
	
	output("\n\nYou lean forward, opening your mouth, and explore her interior of her sodden box with your [pc.tongue], letting her walls clamp down invitingly around the intruding muscle. Penny’s controlled demeanor evaporates at that point. She moans, her voice jumping an octave halfway through when your nose brushes her petite clitty. You shift to fit the sensitive buzzer in your mouth while you lick, and ever so gently apply a bit of suction, pumping your [pc.tongue] through her ecstatically trembling tunnel.");
	
	output("\n\n<i>“Oh fuck, [pc.name], ungh... oooohhh, here it comes!”</i>  she cries with a forceful thrust of her hips, slamming her twat square against your mouth, grinding her perky little button as hard against you as she can. Her legs tremble wildly, and she holds onto your ");
	if(pc.hasHair()) output("[pc.hair]");
	else output("head");
	output(" for dear life. Your poor [pc.tongue] is ruthlessly squeezed, milked for nonexistent ejaculate while being drenched in tasty girl-cum. There’s enough that you’re swallowing a mouthful of the stuff by the time the fennec’s pleasured twitches finally die down. Her body goes limp at last, the orgasmic bliss finally robbing her of her strength. She slumps down the rest of the way in a fucked-out mess of soaked fur and weakly trembling limbs.");
	
	output("\n\nPenny comes to rest against [pc.fullChest], groaning and nearly insensate. She looks at you through bleary eyes and abruptly kisses you on the lips, tasting herself on you and not caring in the slightest. You kiss her back until you both tire of dueling tongues and simply enjoy feeling of the shower washing you clean, both standing to finish the job.");
	
	output("\n\n<i>“My mate...”</i>  Penny muses out loud, <i>“I like the sound of that.”</i>  She looks at you with a warm smile, putting an arm around your ");
	if(pc.tallness <= 65) output("shoulder");
	else if(pc.tallness <= 84) output("waist");
	else output("hips");
	output(". <i>“My ");
	if(pc.tallness <= 50) output("little ");
	else output("big ");
	output("mate. We’ll have to do something like this again, and soon.”</i>  She smiles. <i>“It is nice to finally cut loose with someone. I just hope you don’t mind that I can’t fit this monster.”</i>  Her hand traces down to your crotch. <i>“You are one delicious piece of prey, though.”</i>");
	output("\n\nThe conversation dies away, and the two of you get dressed to go on your separate ways. You find yourself on the receiving end of a tonguing kiss before Penny goes back to work, looking more satisfied than you’ve ever seen her.");
	pc.orgasm();
	processTime(45+rand(25));
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}


//[Species]
function talkToPennyAboutSpecies():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	flags["TALK_WITH_PENNY_ABOUT_SPECIES"] = 1;
	output("Without worrying too much, you ask Penny what species she is. Your codex hasn’t turned up anything, but you’ve never seen someone with her particular features before.");
	output("\n\nThe fox-girl smirks at that. <i>“You don’t say? Well, there’s a good reason for that. Technically, I’m human... or at least I was.”</i>  Your surprise must show on your face, because Penny sighs before continuing, <i>“Not everyone wants to be a plain-jane human all their lives, ya know? Sometimes... you want to be something more, or something different.”</i>  She drums her fingers on the table, a sound muffled slightly by her fur. <i>“I’d been called foxy before by boys, so I guess I was pretty enough. I just... never really felt comfortable in my own skin. When I learned some actresses had spliced themselves in order to appear inhuman for certain roles, the idea just kind of... hooked inside me.”</i>");
	output("\n\nYou nod understandingly. As gene splicing and modification has become more popular, cosmetic uses for the tech have become more and more common. There’s actually whole communities of modded individuals that have sprung up in some areas of the core worlds. Surprisingly, they haven’t drawn much ire from the rest of the populace. It’s hard to give a crap about folks running around with lizard tails or horse weiners when there’s sentient goo women and four-mouthed horrors running corner shops.");
	output("\n\nSeeing your understanding, Penny prattles on faster and faster, the words tumbling out of her in a rush now that she ");
	if(pc.isNice()) output("realizes you won’t judge her for her choices");
	else output("thinks you won’t judge her for her choices");
	output(". <i>“I’ll admit, I may have seen some racier footage out there on the extranet that gave me the extra push to do this. I mean, what young single girl doesn’t want to be unique and sexy, to literally embody an animal associated with pleasing female forms?”</i>  Penny smiles and stretches, arching her back for good measure. <i>“I never really took it seriously until I was in the academy though...”</i>");
	output("\n\n<i>“What happened in the academy?”</i>  you ask.");
	output("\n\nPenny answers, <i>“I met someone that was doing it already, and... she loved it. She even changed her name to Kit after her cat ears grew in. I wound up being pretty good friends with her... great friends actually, and I decided I was going to go for it.”</i>  The way she talks, it sounds like her and this cat-girl might have been a little more than friends, but you don’t push the issue. <i>“Unfortunately, I didn’t have a nice inheritance from a rich aunt to pay for my changes. Instead, I took the toughest, best paying posts I could.”</i>  Penny growls low in her throat. <i>“It was hell, but I stuck it out. I knew what I wanted, and bit by bit, I saved up the cash for some splices.”</i>");
	output("\n\nThe fox-girl curls her left hand into a fist. <i>“I had to take out a huge loan for the rest, but I managed to afford what I wanted: a fox transformation, and not just any fox, a fennec fox.”</i>  Her ears flit this way and that. <i>“Not to sound all girly or anything, but don’t fennecs just have the cutest ears?!”</i>  They swivel your direction. <i>“First my ears moved up and started reshaping. Then, my face started to reshape and the fur began growing out. It wasn’t long before I wound up with digitigrade legs and footpaws.”</i>  Penny snugs her vest a bit more tightly around her chest wrap. <i>“I actually managed to get some breast enhancement included with it. As a flat-chested asian girl, I always wanted a big pair. Given my vocation, I think I went a bit overboard. I gotta keep the girls packed pretty tight if I want to be able to run or fight worth a damn.”</i>");
	
	output("\n\nYou’re a little stunned by the information she’s piled onto you, but it seems to have lifted the big-eared vixen’s attitude a bit. <i>“I better get this report filed, [pc.name]. Thanks for listening. It’s nice to get things off your chest every once and a while.”</i>  She chuckles at her inadvertant pun as she turns back to her computer.");
	
	//Pass 30m
	processTime(30);
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

//[Do For Fun?]
function whatDoesPennyDoForFun():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	flags["TALK_WITH_PENNY_ABOUT_FUN"] = 1;
	output("You ask Penny what kinds of things she does for fun, besides being the long arm of the law, that is.");
	output("\n\n<i>“Oh, this and that,”</i>  she says as she pulls her attention away from her computer. <i>“I used to be really into anime - Japanese-style cartoons. It’s amazing that the art form has stuck around, and there’s something therapeutic about coming home from a day of wrangling drunks, drug-dealers, and criminals to watch magical girls or reluctant heroes firing energy out of their hands like some kind of psychic super hero.”</i>  She taps her chin. <i>“There was this one I really liked, Cowboy Star. It was about a bounty hunter and his android sidekick. I really got into it.”</i>");
	output("\n\nYou didn’t expect her to be into such a niche activity, and say as much.");
	output("\n\nThe vixen smirks, <i>“Don’t judge a book by its cover, crazy. That’s far from my only interest. A good game of Tamball and a good glass of wine beats out cartoons just about any day. It just so happens that the season doesn’t run all year, and my team can’t play every day. Maybe I could see if any of the other crazies around town want to throw together a team.”</i>");
	output("\n\n<i>“It couldn’t hurt,”</i>  you offer.");
	output("\n\n<i>“I know, but who would we play against? The zil? I need to wait for this planet to get more than a dozen permanent, civilized residents before I try anything like that,”</i>  Penny declares. <i>“Other than that, fitness is my real hobby. Being a girl, I’ve got to keep in good shape to take down some of the more burly customers I get. I can run laps around just about everyone I’ve met. The extra animal vitality I’m packing might be helping a little bit with that.”</i>  She winks. <i>“That isn’t all, but if you want the whole scoop, you’ll just have to keep coming around and getting me talking until I’m comfortable telling you about my... racier hobbies.”</i>");
	processTime(25);
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

//Her Youth
function pennysYouth():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	flags["TALK_WITH_PENNY_ABOUT_YOUTH"] = 1;
	output("You ask Penny what she was like when she was younger. Did something motivate her to become a U.G.C. Peacekeeper?");
	output("\n\n<i>“Oh, hell yes something motivated me to be a peacekeeper,”</i>  Penny answers. <i>“I was always a smaller kid. I had small parents who didn’t really get behind the whole gene selection technologies a lot of richer couples take advantage of. I was a genetic roll of the dice, and I came short. I didn’t have that much trouble for it myself, but I always saw nerdier or fatter kids getting beat up on. I lived in a bad neighborhood too, so witnessing crime was an almost everyday affair.”</i>  Penny’s visage hardens. <i>“I was too little to do anything about either one.”</i>");
	output("\n\nThe fennec-girl relaxes as she continues, <i>“I actually got mugged, or near enough to it, as a teenager. A peacekeeper was passing through the neighborhood and saved my bacon that day. He wasn’t big or particularly strong, just smart and skilled. He had the perp disarmed and stunned before I knew what happened.”</i>  Penny smiles enthusiastically. <i>“At that moment, I realized what I wanted to do with my life.”</i>");
	output("\n\nYou ask her if she ran off to join up after that.");
	output("\n\n<i>“Don’t be crazy, Crazy. I finished school first before I enrolled. I wanted to protect people, even though I’m not the biggest or the strongest, and the U.G.C. gave me a chance to do that.”</i>  Penny beams. <i>“The academy wasn’t easy, particularly not for a small Penny Inoue. I toughed it out all the same. You don’t get to serve law and order if you can’t take a few hits.”</i>");
	processTime(20);
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

//[PC Name]
function talkToPennyAboutYourself():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	flags["TALK_WITH_PENNY_ABOUT_YOURSELF"] = 1;
	output("<i>“So, what do you about me?”</i>  you ask");
	if(pc.isNice()) output(" openly");
	else if(pc.isMischievous()) output(" with the corner of your mouth lifted partway into a smirk");
	else output(" expectantly");
	output(".");
	output("\n\nPenny sighs, <i>“Narcissist much?”</i>  The mischievous twinkle buried in her eyes exposes the jest’s true nature. <i>“Not that I mind telling anyone just what I think of them. I suppose that’s one of the perks of authority: I get to do it on a daily basis. At least, that’s the case out in backwaters like this. I do still have to guard my tongue coreward - after all, you never know when the youth you’re tongue-lashing is a senator’s son.”</i>  Penny chuckles, <i>“Of course I’m not going to fire anti-alien slurs at anyone - not that I ever would. There’s no point in calling anyone a freak when you look like I do.”</i>");
	
	output("\n\nYou clear your throat and give Penny a meaningful look, reminding her that she’s deviated from the original topic.");
	output("\n\n<i>“You’re an impatient cuss, aren’t you, [pc.name]? Alright, fine,”</i>  Penny says as she folds her arms across her chest. <i>“I think you’re capable but reckless. I think you’re a little happy to stick your nose into other people’s thoughts.”</i>  Penny’s lips pull back to display surprisingly sharp teeth. <i>“I also happen to think you’d be cute if you’d get taken down a peg or two.”</i>  There’s humor behind that, but you get the impression she definitely means what she’s saying. Her blue eyes openly leer at you");
	if(!pc.isNude()) output(", seeming to penetrate beneath your gear with the ease of a freight scanner");
	output(". <i>“Maybe three.”</i>");
	
	output("\n\nBefore you can react, Penny shifts the discussion, realizing that she’s just said some rather unprofessional things. <i>“We need more people like you here in Esbeth - go-getters who aren’t afraid to get their hands or tentacles dirty, people who will help bring this rock up to snuff before a mining syndicate discovers something valuable and levels the jungles to save a few creds.”</i>");
	output("\n\nYou say, <i>“I never took you for an environmentalist.”</i>");
	output("\n\n<i>“I’m not, but that doesn’t mean I want to see this planet turned into some corporation’s whore. God knows enough of planets out here on the rim are going to wind up that way,”</i>  Penny retorts with an irritated flick of her prodigious ears. <i>“Don’t get me wrong, I hope we find a place in the galactic economy. I just hope that Mhen'ga climbs to prominence on hard work and responsibility, not as some corporation’s cash cow.”</i>");
	output("\n\nOnce more, you direct Penny’s attention to you, asking her if she has anything else to say about you.");
	
	output("\n\nEars standing straight up, Penny bristles, <i>“No, I think I’ve said it all. Now, unless you have something else to discuss, I do have work to do, you know.”</i> You shrug, letting the conversation end, but before you can go anywhere, Penny looks back up at you again. <i>“Come back soon, okay crazy?”</i>");
	processTime(20);
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}
	
//Girlfriend Greetings
function approachGirlfriendPenny():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	//Actual approach: 
	if (!penny.hasCock()) 
	{
		output("Penny glances up at you with a knowing smile, <i>“How’re you doing, my </i>");
		if(pc.tallness >= 66) output("<i>big, </i>");
		output("<i>crazy</i>");
		if(pc.tallness <= 55) output("<i>, little</i>");
		output("<i> mate?”</i>");
		//Lusty:
		if(penny.lust() >= 66) output("  Her voice is rife with affection, and she doesn’t hesitate to add, <i>“I know I’ve been wondering when you’d stop in. Maybe being exposed to those zil so much did something to my libido, but I’m up for a little jailhouse rock, if you catch my meaning.”</i>");
		else output("  Her voice is rife with affection, but she soon turns business-like. <i>“Need anything? I’m a bit busy but I can usually find time for you.”</i>");
	}
	//Actual Approach:
	else
	{
		output("Penny’s fluffy tail wags behind her, faster and faster the closer you come. When you’re right in front of her desk, she looks up at you with a lusty look and admits, <i>“I was just thinking of how much I enjoyed using this with you, my mate.”</i>");
		//Max size {17-20}
		if(penny.longestCockLength() >= 17) output("  There’s the sound of fabric starting to rip, cut short by the sound of a zipper and the heavy thud of flesh contacting wood. Penny sighs and looks at you meaningfully. <i>“I’m not sure making it so big was a great idea...”</i>  Her voice trails off as one of her hands moves under the desk. <i>“It does feel nice, of course.... Did you come by to get cavity searched?”</i>");
		//Normal size {10-16”}
		else if(penny.longestCockLength() >= 10) output("  A quiet, stifled groan starts in her throat after her admission, and Penny scoots a little lower in her chair, hiding what can only be a nice, big bulge beneath the desk. The groan turns into a whimper, and then you hear the zipper on her trousers lowering. Gasping with relief, the fennec makes love to you with her eyes and offers, <i>“Up for being violated by your favorite prison guard?”</i>");
		//Small size
		else output("  There’s the quiet sound of a zipper opening from beneath the desk. <i>“Did you want to play with the toy you talked me into getting? I must admit, I’m rather taken by the little guy.”</i>");
	}
	processTime(1);
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Talk",talkToGirfriendPenny);
	if(pc.lust() >= 33) this.userInterface.addButton(1,"Sex",pennySexMenu);
	else this.userInterface.addDisabledButton(1,"Sex");
	this.userInterface.addButton(14,"Back",mainGameMenu);
}

//Talk to Girlfriend Penny
function talkToGirfriendPenny():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("You tell Penny you just want to talk about something today.");
	output("\n\n<i>“Well, I suppose we can do that for now,”</i>  she says");
	if(penny.lust() >= 66)
	{
		if (penny.hasCock())
			output(", shifting in her seat as she tries to settle her rambunctious third leg down");
		else 
			output(", wiggling a little uncomfortably as she tries to suppress her arousal");
	}
	output(". <i>“I’m pretty much an open book for you at this point, my mate.”</i>  Penny’s tail wiggles up alongside her like a snake-charmer’s viper. <i>“Though you could always touch my fluffy tail instead of talking.”</i>  She smirks and waves it back and forth as she awaits your response.");
	//[Her ‘Species’] [Happy?] [Goals] [TouchFluffyTail]
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Her ‘Species’",askGFPennyAboutSpecies);
	this.userInterface.addButton(1,"Happy",isGFPennyHappy);
	this.userInterface.addButton(2,"Goals",goalsForGFPenny);
	this.userInterface.addButton(3,"TouchFluffTail",touchFluffyTail);
	if(flags["HAD_PENNY_GOAL_CHAT"] == 1) this.userInterface.addButton(4,"Futanari",pennyFutanariTalk);
	if(flags["PENNY_THROBB_PURCHASE_UNLOCKED"] == 1) this.userInterface.addButton(5,"Buy Throbb",buySomeThrobbFrompenny);
	this.userInterface.addButton(14,"Back",approachGirlfriendPenny);
}

//[Touch Fluffy Tail]
function touchFluffyTail():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("You look at Penny, then back at her tail... then back at her for a split-second before zeroing back in on her soft, twitching, posterior adornment. Your hand reaches out almost of its own volition, creeping closer and closer to the wiggly brush. Darting back, the tail stays just out of reach, forcing you to edge closer and closer until you’re leaning partway over the desk and stretching past Penny’s shoulder. You strain a little farther, and finally, you make contact with the some of the softest, fluffiest fur you’ve ever felt.");
	output("\n\nPenny grins and grabs hold of your wrist and shoulder, snarling, <i>“</i>");
	if(silly) output("<i>You’ve just activated my trap card,</i>");
	else output("<i>Gotcha!</i>");
	output("<i>”</i>  before springing out of her chair and over the table, crossing the distance between you in a flash");
	if(penny.hasCock() && penny.longestCockLength() >= 10) output(", her swollen meat swinging freely between her legs, pulsating merrily");
	output(". She crashes into your core with enough force to stagger you off-balance and carry you to the floor, landing hard with the victorious vixen atop you");
	if(penny.hasCock())
	{
		output(", her throbbing cock ");
		if(penny.longestCockLength() < 10) output("lewdly pressed against the underside of your chin");
		else if(penny.longestCockLength() < 17) output("sliding lewdly across your cheek");
		else output("lewdly draped across your face, forcing you to catch your breath with the scent of her sex in your nose");
	}
	output(". One of her hands is ");
	if(pc.hasCock() || pc.hasVagina()) output("at your groin");
	else output("grabbing your [pc.butt]");
	output(" almost immediately, rubbing your most sensitive places with knowing caresses.");
	
	output("\n\n<i>“Now, my prey, I think it’s time you...”</i>  Penny leans over, bending almost double to put her face next to your ear, <i>“...satisfy the predator, don’t you think?”</i>  The ‘k’ in think is punctuated by the sound of her jaws snapping closed.");
	output("\n\nIt looks like Penny has got you where she wants you. What do you do?");
	pc.lust(15);
	//Display sex menu.
	pennySexMenu(false);
}

//[Her ‘Species’]
function askGFPennyAboutSpecies():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("<i>“My ‘species’?”</i>  Penny asks. <i>“You want to hear more then?”</i>");
	output("\n\nYou nod and motion for her to go on.");
	output("\n\nIdly playing with her ear, the tawny fox mulls it over until her eyes light up. <i>“There are some things I wasn’t comfortable telling you about before that you might like to hear.”</i>  She winks knowingly and pulls back on her vest to display the curves of her breasts to you. <i>“My libido definitely spiked with the size of my boobs. That was one thing I didn’t mind at the time, but it’s been a pain in my ass ever since.”</i>  During the discussion, one of her hands had begun to squeeze at a breast, pawing at the plush orb. She tears it away with a look of infinite irritation. <i>“It’s hard as hell when you take down some muscly hunk, really pin him to the ground, and all you want to do is shag his balls off instead of dragging him back to a cell. I’ve gotten pretty damned good at reining myself in as a result.”</i>");
	output("\n\nYou suppose that explains why she was fingering herself at her desk so often when you met her.");
	output("\n\n<i>“No,”</i>  Penny asserts, <i>“That was my sex drive combined with alien fuck pheromones. I may not have shown it, but I was pretty much in heat from breathing in so much of their musk. The only way to keep my head was with a steady diet of climaxes. So, I did what I had to do. I spent so much time schlicking that I gave up on running to the restroom to hide it after the first few hours. ‘Turns out that fingerfucking yourself in between report pages is one way to get through the day.”</i>  Penny casually runs her tawny hand through her close-cropped mohawk. <i>“It’s not really an approved tack, though.”</i>");
	
	if(pc.isNice()) output("That’s quite the confession! You had no idea she had so much trouble with her baser urges and ask her if there’s anything else about the transformation that she held back.");
	else if(pc.isMischievous())
	{
		output("That’s a hell of a confession! You ask her if she’d like you to see if you can synthesize some zil pheromones for " + pc.mf("cologne","perfume") + ". Penny’s response is a slow, salacious lick over the periphery of her mouth, glossing her lips with a clear invitation. Well, that might be something to try if you can ever get your hands on them! Back to the matter at hand, you ask her if there were any other changes she’d like to share.");
	}
	else output("Well, maybe you should have flirted a bit more heavily back then. You could have gotten this vixen wrapped around your finger a great deal more quickly. Smirking, you ask her if there’s any other tidbits she held back.");
	
	output("\n\nPenny is quick to answer. <i>“That’s the main one. I also found myself eating a LOT more protein.”</i>  ");
	if(pc.hasCock()) output("Seeing the look on your face she shouts, <i>“NOT THAT KIND!”</i>  ");
	output("The fox-girl flashes you a toothy smile. <i>“Squirrel, rabbit, beef, Teladren meat beast.... If it was once alive, it probably tastes great to me now.”</i>  Scratching under her ear, she comments, <i>“It’s hard as hell to getting a food splicer here to make decent, rare steak. I swear to god, I’m going to learn how to program one just so I can get a good meal out here.”</i>");
	output("\n\nLeaning back, the vixen flashes you an easy smile. <i>“That’s the long and short of it. I got turned into a sexy, busty, nympho predator bitch. And I love it.”</i>");
	output("\n\nYou return an affable grin.");
	
	output("\n\n<i>“Be sure and let me know if you want a roll in the hay later, okay? </i>");
	if(!penny.hasCock()) output("<i>I may not always be horny, but it’s worth getting a little riled up to have a clear head later,</i>");
	else output("<i>You know how I feel about fucking: the more the better. And thanks to you, I have the best tool to do it with,</i>");
	output("<i>”</i>  Penny offers as she turns back to her job.");
	this.userInterface.clearMenu();
	processTime(25);
	this.userInterface.addButton(0,"Next",approachGirlfriendPenny);
}

//[Happy?]
function isGFPennyHappy():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("<i>“Am I happy?”</i>  Penny answers with another question. Scratching at her chin, she mulls it over for a moment. <i>“No, not really.”</i>  The fennec chuckles. <i>“Is anybody? I don’t know, but I don’t think it’s in human nature to ever be truly happy. We’re happy when we get what we want, and then we get used to it. Then we feel exactly the same again and find something new to want. Contentment just isn’t something we’re built for as a species, ya know?”</i>");
	output("\n\nThat’s a little depressing to hear. You mention that after all she’s gone through, she ought to be at least a LITTLE happy to have reached her goal.");
	output("\n\nSighing, the fox-girl looks you dead in the eyes. <i>“Don’t get me wrong, I AM happier, really. That doesn’t mean everything is perfect. I’d love to be getting a big fat paycheck for what I do. I’d be thrilled if I could feel like I’m doing more than running a glorified drunk-tank, or if I didn’t also feel that I’m the only decent line of defense between these folks and a nasty wasp orgy.”</i>  Moisture beads at the corners of her eyes. <i>“The truth is... everything is pretty great. I look great, I found myself a cute mate, and we’re making some real headway with the town now. It’s hard to hate the place when there’s people like you and Flahne helping me out.”</i>");
	
	output("\n\nPenny props her chin on her fist and leans over her desk at you. <i>“Is that more the answer you were looking for, mate?”</i>");
	output("\n\nThere’s really nothing to do but nod at that.");
	output("\n\n<i>“Good. People like you and me, we make a difference, even if we have to slog through shit sometimes to do it,”</i>  Penny quips. <i>“Now, I have to do some checks on the calibrations of the turrets, but holler at me if you need anything else.”</i>");
	processTime(25);
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",approachGirlfriendPenny);
}

//[Goals]
function goalsForGFPenny():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("<i>“My goals?”</i>  Penny muses. <i>“That’s a good question.”</i>  The fox-girl drums her fingers on the table, clicking noisily thanks to her claw-like nails. <i>“First and foremost: I need to pay off my debts. Another five years in this post and I’ll finally be out from under my bank’s thumb. My credit might even be good enough at that point to finance a place of my own. U.G.C. standard issue bunks aren’t the most comfortable thing in the universe, ya know.”</i>  She idly rubs her back for emphasis.");
	output(" Looking at her chest, you aren’t sure her back pain is entirely due to her sleeping accommodations, but keep it to yourself for now.");
	output("\n\n<i>“Anything else?”</i>  you ask.");
	output("\n\nPenny puffs out her chest proudly. <i>“I’m gonna keep training in my off time until I’m the best damned fighter on the planet... as much as that would mean.”</i> She pulls out one of her tonfas and flicks it around expertly, slamming the nightstick-like weapon down onto her table with an accompanying crackle of electricity. <i>“Sometimes it takes more than a kinetic hit to drop a criminal,”</i>  she explains. The smell of ozone hangs in the air while Penny puts her weapon away. <i>“I’m not taking a club to a gunfight either. If need be, I’ve got sentry turrets up all over town and a locker full of guns I can get to without much fuss.”</i>");
	output("\n\nYou ask, <i>“What if someone else shoots first, when you aren’t near the station?”</i>");
	
	output("\n\n<i>“I’ve got a pretty great shield to cover my tail while I get away then,”</i>  Penny replies. <i>“People are a little more comfortable around you without a gun. Besides, this isn’t some gang-filled ghetto - at least, not yet. We’re still small enough that it’s pretty hard for me to be far away from the office. You won’t catch me out in the jungle.”</i>  Penny explains, <i>“I don’t think I’d get to come back. I’d probably be hugging a tree while those wasp-looking assholes took turns drilling my holes.”</i>");
	
	output("\n\nChuckling at that, you ask if she had any other goals she meant to discuss before the discussion got sidetracked.");
	
	output("\n\nBiting her lip, the vixen considers for a moment. <i>“Nah, I don’t think so. Get things paid for, train, and maybe make enough scratch to get a comfy place to call my own.”</i>  Her eyes twinkle mischieviously, <i>“Maybe someday I’ll let someone talk me into being a wife and not a mate. Heck, maybe I’ll go nuts and decide to retire to chase adventures with you among the stars.”</i>  She shakes her head. <i>“No sense worrying about that now. Esbeth needs me here.”</i>");
	
	output("\n\n<i>“Oh!”</i>  Penny adds, <i>“There was one other thing I’ve been thinking about.”</i>  She wrings her hands. “It’s a little weird, but I’ve been entertaining the idea of growing myself a cock. Maybe we should talk about that later, though.”</i>  Her eyes flick back to her monitor. <i>“I probably need to get back to work. Give me a yell if you need anything else, [pc.name].”</i>");
	processTime(25);
	this.userInterface.clearMenu();
	flags["HAD_PENNY_GOAL_CHAT"] = 1;
	this.userInterface.addButton(0,"Next",approachGirlfriendPenny);
}

//[WhatSheLookedLikeB4]
function whatSheLookedLikeBFour():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("<i>“What I used to look like?”</i>  Penny asks. <i>“Mousy little asian girl, about yay tall.”</i>  She motions with her hand, indicating a slightly shorter girl. <i>“Slanted eyes, olive skin, pitch-black hair. You know the look. I looked different from most folks, but I don’t know, I always felt kind of frumpy and plain.”</i>  She nervously scratches at the tip of one expansive ear. <i>“Oh, I nearly forgot. I can probably dig up an old pic of myself off the extranet. Give me a moment.”</i>");
	output("\n\nPenny turns to her computer and begins to click away in a frenzy, pounding out access codes one after another as she searches for records of her previous self. Her tail is flicking back and forth like a metronome as she works. <i>“One more... hang on,”</i>  she says. Clattering one last time, her fingers work the cheap keys over, and the fox-girl announces, <i>“Done!”</i>");
	output("\n\nSpinning the monitor around, Penny shows you what she looked like. The picture on screen is... well, plain. A pretty average looking asian girl. You probably wouldn’t have looked at her twice if you had met her on the street all grown up.");
	output("\n\n<i>“See? I told you,”</i>  Penny says with a smile. <i>“Not much to look at it.”</i>");
	output("\n\nYou scratch your chin as you look at it, lost in thought. She’s changed so much....");
	output("\n\nPenny swivels the monitor away from you and swiftly closes the image. <i>“That was me.”</i>  She runs her hands up her front, emphasizing the size of her rack and her sinuous curves. <i>“Now, this is me.”</i>  She cocks an eyebrow at you. <i>“Any questions?”</i>");
	output("\n\nNone.");
	output("\n\n<i>“Good, now let me get this requisition typed up.”</i>  She winks at you. <i>“Just holler up when you need something.”</i>");
	processTime(25);
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",approachGirlfriendPenny);
}

//[Futanari] - Option to have her go futa!
//Requires her mentioning futa already!
function pennyFutanariTalk():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	if (flags["PENNY_FUTA_TALK"] == undefined)
	{
		flags["PENNY_FUTA_TALK"] = 1;
		output("<i>“Grow a dick?”</i>  Penny states with a dumbfounded look. Ears flattening back on her head, she admits, <i>“I did mention that, didn’t it?”</i>");
		output("\n\nYou nod expectantly.");
		output("\n\nThe fox-girl snorts and sets some paperwork aside in a huff, swivelling her chair to more directly face you. She searches your eyes for something for a long moment before talking. <i>“Yeah, I guess... I was thinking about it....”</i>  Penny’s ears gradually rise again. <i>“The girl I told you about at the academy... she had one, and all things considered, she was pretty happy with it. Once we got comfortable, she kept finding excuses to show it to me. She even let me watch her masturbate!”</i>");
		output("\n\nCoughing nervously, the vixen adds, <i>“I thought a vagina was plenty enough to please, but watching her hands dance over two sets of genitals.... I think I might want one too, [pc.name]. It was dirty and decedent and wet in all the right ways. You should see the way she squirted - from both holes!”</i>  Penny’s breathing has gotten heavier from recounting this sordid tale, though her nipples have yet to pop out to visibility. <i>“Could you imagine, mate? Could you see me with a big, throbbing dick just cumming all over you while you fuck me or stretching out your [pc.pussyOrAsshole]? Fuck, that’s hot!”</i>");
		output("\n\nYou ready a response, but Penny plows on, obviously wanting to get a bit more out before she takes in your feedback.");
		output("\n\n<i>“There’s one complication though. I can’t afford a high grade, custom tailored phallus like Jen did. That’s her name, by the way. Anyway, there’s another way I could grow a dick: a drug called Throbb,”</i>  the fox-girl offers. <i>“It was originally developed as a hormone and body altering cocktail that could grow or enlarge penises on just about anyone for cheap. Of course, when the people taking it were found to be four times more likely of attempting rape, it started getting pulled off the market. Apparently it ratchets up the libido rather effectively. The drug’s situation didn’t get any better once holos of binge users showed up on the extranet. Some people grew dicks and balls so big they couldn’t move. Can you believe that?”</i>");
		
		output("\n\nActually, you can. Some of your old coworkers exposed you to some rather questionable things on the ‘net, and that doesn’t even count the weird shit you stumbled onto by yourself.");
		
		output("\n\nPenny smirks, <i>“So it’s illegal almost everywhere! A self-respecting police-girl could never get into something like that. Unless she was stationed on a rim world where no statutes against it had been established yet. A world that didn’t even have a decent tax on imports.”</i>  Penny looks up at you with big, wide eyes. <i>“I might have bought myself a pretty big batch of it, but I wanted to ask you what you think.”</i>");
		
		output("\n\nScratching at her mohawk, the policewoman asks, <i>“If I say... had a big cache sitting around, waiting to give me a huge dick, do you think I could handle it? Would you be okay with me getting a penis? I don’t think I can really judge myself here.”</i>  She sighs. <i>“Being a herm would really open things up to me sexually, but am I getting self-destructive here? Would you like me better as a girl?”</i>");
		//[Stay Girl] [Get A Dick]
		this.userInterface.clearMenu();
		this.userInterface.addButton(0,"Stay Girl",stayAGirlYouBitch);
		this.userInterface.addButton(1,"Get A Dick",pennySproutsAWeiner);
	}
	//Repeat Futanari Talk
	else
	{
		//Not yet futa
		if (!penny.hasCock())
		{
			output("<i>“Oh, you want to talk about me growing a dick again?”</i>  Penny asks. <i>“You know, if I dose myself with Throbb I’m going to wind up horny and dripping more often than normal. My self control will probably slip a little too. However, I’ll be able to fuck you like freight train, and oh god I bet the orgasms will feel great.”</i>");
			output("\n\nFrom the sounds of it, Penny’s panties are already more than a little moist at the idea. Do you tell her to take some Throbb?");
			//[Stay Girl] [Get A Dick]
			this.userInterface.clearMenu();
			this.userInterface.addButton(0,"Stay Girl",stayAGirlYouBitch);
			this.userInterface.addButton(1,"Get A Dick",pennySproutsAWeiner);
			
		}
		//Already futa
		else
		{
			if(penny.longestCockLength() < 10)
			{
				output("<i>“So you like my dick as much as me, right?”</i>  a hopeful Penny asks. <i>“You don’t mind if I take another dose of Throbb, do you? I just want to get a little bit bigger - you know, like a foot long. That way I’d have a cock big enough to get into porn if the police gig ever falls through.”</i>  Her tentpole swells a little at that admission.");
				output("\n\nShe’s as horny as an animal in heat, but she hasn’t had any trouble keeping herself under control thus far. Do you suggest she take it again?");
				this.userInterface.clearMenu();
				this.userInterface.addButton(0,"Give Throbb",pennyToBigPenny);
				this.userInterface.addButton(14,"Back",approachGirlfriendPenny);
			}
			//Footlong Penny
			else if(penny.longestCockLength() < 17)
			{
				output("<i>“Ohgod, you want me to get bigger, don’t you?”</i>  Penny asks with a full-body shudder. She wraps one hand around her [penny.cock] and begins to languidly stroke it, barely caring that the door is unlocked. Her male endowment is big enough to be visible over the edge of her desk. <i>“Nnnngh, it’ll feel so good! I... uh... don’t know how I’ll fit in my pants. Fuck, my sheath will probably bulge through even when I’m not horny.”</i>  The lust-drunk vixen giggles as she bends double to slurp a drop of pre-cum off her [penny.cockHead]. <i>“Yeaaaah, lets give me a real monster!”</i>");
				output("\n\nTo say that Penny is enthused by the prospect of a bigger member and a heightened libido would be an understatement. She’s jubilant at the prospect and nearly beyond reason with lust from at the prospect of taking more. With her self-control obviously slipping, do you give her the okay to take another dose?");
				this.userInterface.clearMenu();
				this.userInterface.addButton(0,"Give Throbb",pennyBecomesHYPERPENNY);
				this.userInterface.addButton(14,"Back",approachGirlfriendPenny);
			}
			//Hyper Penny
			else {
				output("<i>“Mmmoooore?</i> Penny moans as she starts to masturbate in front of you. Her hand can’t even close around her girth at this point, and the tip is so tall that it smacks her in the chin whenever she gets careless. She grabs hold of it with both hands, one sliding over the half facing you while the other ");
				if(penny.balls > 0) output("cradles her balls");
				else output("dips into her sheath to play with it");
				output(". Her womanly folds are almost entirely forgotten as she babbles, <i>“I think I want more, [pc.name].... I mean, I remember not wanting to turn myself into a hyper-dicked freak, but now... I kind of want to see how big it can get. Each time it feels better!”</i>  She slurps at her tip as you consider the situation. <i>“Umph! So good! Come on, give me a monster cock! I promise I won’t split you in half with it!”</i>");
				output("\n\nPenny will surely lose it if you give her the go ahead to take any more. Her already lustful nature seems to be stoked to a high degree already, and giving her more Throbb would certainly lead to her losing her post. No, she can’t have any more now, and you tell her as much.");
				output("\n\nAmazingly, she actually wilts a little at that. Her masturbation stops as the fennec dreamily says, <i>“Okay, okay, I guess. I’m getting a little out of hand, aren’t I?”</i>  You nod. <i>“Good, cause it seems to be keeping you around. I’m going to fuck you so hard as soon as I get caught up on work!”</i>  She turns back towards what she was doing while trying to pack her monster dick into her pants. It doesn’t work all that well.");
				this.userInterface.clearMenu();
				this.userInterface.addButton(14,"Back",approachGirlfriendPenny);
			}
		}
	}
}

//Get A Dick
function growADickPenny():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("<i>“You’ll be fine,”</i>  you suggest, letting a hint of a lascivious smile creep onto your [pc.face]. <i>“I’m sure a girl like you can handle a little bit of extra arousal from time to time, and if it ever gets too much, well, I’m right here.”</i>");
	output("\n\nPenny gives you a doubtful look, but she reaches into her desk all the same, coming out with a vial full of cyan fluid so transparent you can barely identify the color. She twists it between her fingers, looking meaningfully at it as she works up her courage. <i>“This stuff is going to give me a dick, likely forever. My genome is so hacked up by the fennec splicing that most transformation won’t even take anymore - part of the downsides of going as cheap as I did on it. So if I grow this dick, it’ll be hard as hell to get rid of, and maybe the only thing about me we can transform. Are you sure you want me to be your foxy little futanari girlfriend?”</i>");
	//[Grow It] [Nevermind] - back to talk menu.
	this.userInterface.addButton(0,"Grow It",pennySproutsAWeiner);
	this.userInterface.addButton(1,"Nevermind",stayAGirlYouBitch);
}
//Penny Grows Her Dick NOW!
function pennySproutsAWeiner():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("You smile and let her know that you’re more than fine with her having a package. If anything, you’re anticipating the change. The idea of the vixen sporting a nice, thick cock to tease along with her vagina is imminently pleasing.");
	output("\n\n<i>“Really?”</i>  Penny smiles, though her hand is shaking. <i>“I guess... there’s no time like the present then.”</i>  Typing one handed, she powers off her workstation and seals the doors in short order. <i>“Just, unlock the doors and call for help if anything goes wrong, okay mate?”</i>");
	output("\n\nYou nod.");
	output("\n\nPenny exhales, <i>“Okay.”</i>  She gingerly sets the expensive, barely-legal drug on her desk and unbuttons her pants with a grunt of irritation, lifting up her cute little bottom so she can slide the stifling garment down to the floor. A pair of white panties with a noticeable dark patch at the gusset follow it, exposing Penny’s glistening-wet sex to your eyes. She leans back, spreading her legs to give you a better view, her vulva engorging with every breath she takes. Grabbing hold of the vial, Penny pops the plastic guard off the needle and gulps. <i>“This is it,”</i>  she says to herself, <i>“the moment of truth.”</i>");
	
	output("\n\nThe shaking vial slowly descends toward her pubic mound clasped as it is in the fennec’s quaking fingers. It stops a perhaps a millimeter above her exposed skin, just above her slit but below the line where her tawny fur begins. She whimpers, glances at you for support, and without another word, she plunges the needle into herself. Startled, Penny gasps, <i>“It didn’t hurt at all! The anesthetic coating on these needles is perfect!”</i>  She depresses the plunger with one firm push, her previous worries forgotten.");
	output("\n\nThere’s no change at first. Penny glances up at you with a worried look while she works the needle free and places it on her desk. <i>“Was it a d... dud?”</i>  she wonders. One of her eyes starts to dilate, and then the other. Her tongue doesn’t even make it the whole way back into her mouth. It just kind of flops out to the side and twitches slightly. <i>“F-feeling it aowww...”</i>  she slurs, her breaths coming hard and fast. Her left nipple and then her right pop out, sticking out through her wraps as lust overwhelms her. At the same time, her pussy lips clench and then relax, opening as wide as that orifice can, leaking clear, feminine fuck-slime onto her chair.");
	output("\n\nThe insensate fennec slams her hand down onto her pussy hard enough to splatter her lubricants onto her desk, three fingers immediately buried to the knuckle in her simmering slot. Her hips lift and grind against her hand, and a lazy, ecstatic grin spreads across her face as she masturbates. <i>“Sho good,”</i>  she babbles while fucking herself. <i>“So hot... so hot!”</i>  Her movements grow jerky, and an ugly-looking lump begins to rise at the injection site, discolored and red.");
	output("\n\nPenny doesn’t seem to care about the growth in the slightest. She’s worked a fourth finger into her twat and is so busily fucking herself that she looks about ready to start fisting any moment now. Meanwhile, the red lump is nearly an inch tall. Veins rise on the surface, visibly expanding with each pump of heated blood, seeming to feel the object as it rises higher. Around the border of the protrusion, her skin bunches up, folds stacking upon folds into something not dissimilar from foreskin or an animal’s sheath. Penny’s fur spreads down as it thickens, confirming that it is a sheath, which means the red bulge is... her cock. It’s risen up to a full two inches in height already, and the rate of its grown is only accelerating.");
	output("\n\nBlinking as she starts to fistfuck herself, Penny seems to suddenly become aware of the new, growing organ. Her free hand wraps around it, and she gasps. A narrow tip peeks through her fingers while the base thickens, fed by the spiderwebs of fresh veins that feed further engorgement. Her cock swells further, slowly straining her tightly-clasped fingers apart to reveal a bulging knot. At the same time, a tiny slit appears at the tip and begins to weep white droplets of liquid lust.");
	output("\n\nThe lust-drugged vixen throws her head back and moans in orgasmic bliss while her expanding fox-cock flexes in her grip, just in time to launch long ropes of jism up onto it’s owner’s tits. Again and again, sticky semen is sprayed up onto the underside of Penny’s breasts. Some falls on her belly after a few moments, losing momentum as the drug’s potential is expended. Slouching into her chair, Penny shudders and sighs, pulling her hand free of her momentarily-gaped snatch with a lewd-sounding pop.");
	output("\n\nThe newly-minted hermaphrodite uncurls her fingers from around her prized possession, gazing on it with a sense of wonder. It’s definitely a dog-dick; it has a clearly visible but shrinking knot at its base. The new-grown tool looks to stand about six inches tall when hard, but it’s already starting to retract into its fleshy sheath. <b>Penny has a cock!</b> She doesn’t have balls, but from her description of the drug, she’s liable to get some if you give her more.");
	output("\n\nPenny interrupts your speculations with a ringing endorsement, <i>“Oh god, it’s perfect! It’s just like I always imagined.”</i>  She flutters her lashes in your direction, letting her eyebrows sink low as she says, <i>“And it felt better than I ever expected. I can’t wait to try it out with you!”</i>  In confirmation of her statement, her sheath spreads to expose an inch of the pointed tip, sliding out to point accusingly in your direction. She idly gathers some of her cum off her chest to taste, each swallow aiding another inch of erection in slipping free. By the time she’s cleaned, her cock is out and throbbing again.");
	output("\n\nPenny purrs, <i>“Oh, it wants to go again!”</i>");
	output("\n\nThe fox-girl’s libido has definitely jumped up a notch - she’s probably always going to be lusting after you now. Hell, the way she’s eyeing you up, you wouldn’t be surprised if she leapt across the desk right now. She shows some restraint, luckily, and instead slides her bottoms back up. Though, she does leave the fly undone so that her new addition can breathe. <i>“Maybe later though, little guy. I’ve got work to do.”</i>  Her smile turns your way. <i>“Thanks again, mate. I’m gonna get things cleaned up and work, but come back as soon as you have time for a little prison fun, okay?”</i>");
	if(silly) output("\n\nYou’ll have to be careful not to drop the soap around her from now on.");
	this.userInterface.clearMenu();
	processTime(20);
	penny.createCock();
	penny.shiftCock(0,GLOBAL.VULPINE);
	penny.cocks[0].cLength = 6;
	penny.cumMultiplier += 1;
	penny.ballEfficiency += 2;
	penny.orgasm();
	flags["PENNY_THROBB_USES"] = 1;
	flags["PENNY_THROBB_PURCHASE_UNLOCKED"] = 1;
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

//Penny Turns To Big Penny
function pennyToBigPenny():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("Penny cheers, <i>“I knew you would!”</i>  in between strokes on her [penny.cock]. Tearing into a drawer one-handed, she comes up with another vial of Throbb. This one looks exactly like the last - a syringe filled with transparent, pale blue fluid. She bites the plastic cap off the needle and casually spits it aside, spinning the injector in her fingers until she has it aimed point-down at herself. Breathing in anxious puffs, she declares, <i>“I’m going to have a hard time hiding this, [pc.name]...”</i>");
	output("\n\nThe lusty prick-vixen jams her chosen enlargement method into her [penny.sheath] with alarming suddenness. Pushing in the plunger, she yanks out the spent syringe to toss aside, forgotten by the time it hits her desk. Instead, the fox is bent down to look at her dick as she masturbates, sliding her hand slowly across every spot of exposed erection. Like the last time, there are a scant few seconds where nothing happens, but then, the fox-girl begins to drool. At first, only strings of saliva escape her open maw, but all too soon, she’s dripping all over her dick while she jacks off.");
	output("\n\nAt the same time, Penny’s [penny.cock] visibly swells, starting inside the sheath, stretching her fur-lined orifice wide. The tremors of growth pass up the shaft, compressed as it is in her hand, and force her fingers apart with newfound girth. Last, the fennec’s [penny.cockHead] blooms with fresh size before elongating upward, stretching with new length. The cock quivers and pulses as it builds higher, passing eight inches of height with ease. As it hits ten, the lust-doped fox-girl whimpers, and a flow of white begins to flow from her tip in languid spurts.");
	output("\n\nPenny bends low, her tongue hanging down to catch her [penny.cockHead]’s juices, tasting herself as her cock inexorably reaches towards her mouth. You estimate her [penny.cock] to be about eleven inches long when the fox-girl’s lips touch down. The contact between the two must feel exquisitely good, because you actually see her urethra bulge with a heavy load, and the tip surges up into the vixen’s hungry maw in time to spray the cum straight into her throat. Her cheeks bulge from the spunky volume, pressurized to their limit. Penny goes straight into swallowing while her eyes roll back from bliss. Her body is running on automatic at this point, stroking, licking, and swallowing on the altar of her swelling phallus until it becomes satisfied.");
	if(penny.balls == 0) output("\n\nMid-orgasm, the flesh between Penny’s [penny.cock] and pink slit bulges out, her skin ballooning slowly, coming to rest flat and empty upon her quivering folds. A second later, something squeezes out of the fox-girl and into the sack of pink skin. It’s a rounded, egg-shaped little bulge that you identify as a testicle almost immediately. A second falls into the other side, and both bounce happily in their new home as they grow, swelling up to the size of golf balls before stopping. Fine amber hairs sprout all over the pouch a moment later, blending in with the sheath above and the fur to either side. <b>Penny grew a ballsack!</b>");
	output("\n\nGulping noisily, the now-hung hermaphrodite works to keep up with her prodigious alabaster flow. Her [penny.cock] seems to have finished the worst of its growth and appears content to serve as a sperm highway straight into Penny’s belly. Her taut tummy bulges slightly with hastily-swallowed, liquid weight, distending under the size of the drug-born load. Still, even such ludicrous orgasms have to come to an end, and Penny’s tapers down to an unsubtle white-leaking drip.");
	
	output("\n\nYou watch the fennec come down from her orgasmic high with a bit of uncertainty. She’s gotten pretty big, and you can’t even see the whole size of her member with it buried in her throat. Penny answers your unasked questions a moment later by pulling off and gasping for breath. <b>Her cock has grown to somewhere just under twelve inches, maybe eleven and a half.</b> The tip is still leaking white, but it does begin to recede into the vixen’s enlarged sheath. Her balls have nowhere to go, and she comments, <i>“</i>");
	if(penny.balls == 0) output("<i>I guess I better be careful how I sit from now on.... </i>");
	output("<i>That felt better than last time!”</i>");
	output("\n\nYou cock your head to the side.");
	
	output("\n\n<i>“Seriously! Last time, it was like I was supremely horny and HAD to bring myself off right now,”</i>  Penny explains. <i>“This time, it’s like I was getting more and more aroused with each passing second. I didn’t have to touch myself, I <b>knew</b> I’d be coming in ten or fifteen seconds, I just touched myself because I wanted it to feel even better, and boy did it ever! When it started growing, it was like I was having this beautiful, perfect, slow orgasm, and then when it went into my mouth, I started cumming all over again! I got off on jizzing into my own throat and I came forever! I can still feel it sloshing inside of me...”</i>  She cradles her belly, but her shaft has apparently re-engorged, ready to go again.");
	
	output("\n\nSlapping at it, the fox giggles, <i>“Not now... but maybe we can take a break in an hour to drain you.”</i>  She adjusts herself to be half presentable before turning back to thank you. <i>“You’re the best, my mate. I never would have done something like this, and let me tell you that I’m having a hard time trying not to mount you right now. I mean... your butt is just... wow.”</i>  She covers her mouth and swivels back to her computer to work, but you overhear her whisper, <i>“Okay, maybe a break in five minutes...”</i>  Her enhanced tentpole twitches in agreement.");
	processTime(25);
	if(penny.balls == 0) {
		penny.balls = 2;
		penny.ballSize = 2;
	}
	penny.cumMultiplier += 2;
	penny.ballEfficiency += 3;
	penny.cocks[0].cLength = 11.5;
	penny.cocks[0].cThickness = 2.5;
	if(penny.cocks[0].knotMultiplier < 1.5) penny.cocks[0].knotMultiplier = 1.5;
	penny.orgasm();
	flags["PENNY_THROBB_USES"] = 2;
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

//Penny Goes Hyper Penny
function pennyBecomesHYPERPENNY():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("Penny’s only response to your decree is to eagerly slam her face down on her [penny.cock], wrapping her lips around the [penny.cock] into a vacuum tight seal. Holding that position, she reaches into her drawer, fumbling around a little while before she comes up with the object she sought: a small injector filled with bluish fluid. The fennec pops off her spit-slicked rod, but only long enough to say, <i>“Are you ready, my mate? Ready to see my cock get so huge that I don’t even have to lean over to self-suck anymore?”</i>  She shivers with uncontained anticipation. <i>“It’s gonna get sooooo big.”</i>");
	output("\n\nYour mouth splits into a slight grin as you nod to her. You’re definitely ready to see this.");
	output("\n\n<i>“Okay thenmrph!”</i>  she gurgles as she slurps down her [penny.cockHead] once more. The vial of cyan drug has its plastic safety sheath removed by Penny’s practiced fingertips, and it’s unceremoniously jammed needle-first into her sheath. The fox-girl barely whimpers at this. She didn’t even miss a stroke; her hand is pumping as fast and ready as before. At the same time, she pumps in a whole other way, depressing the plunger to inject the chemical into herself, tossing the empty syringe away as soon as it’s completed its mission inside her genitals.");
	output("\n\nPenny lazily looks at you as she slurps upon her foot-long rod, popping off long enough to say, <i>“Here it comes, [pc.name]. Watch closely.”</i>");
	output("\n\nThe first difference you notice is actually Penny’s tail. It had been waving back and forth until now, but it’s stopped and fallen limp behind her. Next, a full-body shiver works its way through the fennec’s form, starting at her footpaws before traveling the whole way up to her head. That actually interrupts the vixen’s autofellative masturbation, at least for a few seconds. She goes right back into sucking her [penny.cock] like a horny gutterslut the moment the involuntary twitches cease.");
	output("\n\nYou watch this with a lusty smile, grinning wider when you see her ears begin to lazily droop backwards. At the same time, her cock pulsates powerfully, throbbing so powerfully that you’re reminded briefly of someone inflating a toy. You shake your head to cast off the idle thoughts and watch, noticing the way Penny’s sheath has begun to swell first. The fleshy lips of it are thickening nicely while the orifice opens wider. Stranger still, that entrance (or is it an exit?) migrates further up the fox-woman’s groin as it deepens in order to handle the soon-to-be swelling organ, surely immense in its flaccid state.");
	//No balls
	if(penny.balls == 0) {
		output("\n\nThe flesh between Penny’s [penny.cock] and pink slit bulges out, the skin ballooning out slowly, coming to rest flat and empty upon her quivering folds. A second later, something squeezes out of the fox-girl and into the sack of pink skin. It’s a rounded, egg-shaped little bulge that you identify as a testicle almost immediately. A second falls into the other side, and both bounce happily in their new home as they grow, swelling up to the size of golf balls before stopping. Fine amber hairs sprout all over the pouch a moment later, blending in with the sheath above and the fur to either side. <b>Penny grew a ballsack!</b>");
		penny.balls = 2;
		penny.ballSize = 2.5;
	}
	//Balls below max size
	if(penny.ballSize < 4) {
		output("\n\nThe nicely formed sack below Penny’s [penny.cock] abruptly begins to tighten as its contents swell with fresh virility, practically sloshing against each other as they fill the rapidly stretching pouch. That pouch gets larger and larger before your very eyes, and the vixen’s seed-producing organs become more perfectly spherical as they enlarge, the only flaw in their perfect, rounded shapes visible in the way their bottoms compress flat against Penny’s seat under their own weight. <b>Her balls have grown to the size of grapefruits!</b>");
		penny.ballSize = 4;
	}
	//Resume!
	output("\n\nChange arrives at the vixen’s prick at last, starting at the ");
	if(penny.hasKnot(0)) output("knot");
	else output("base");
	output(", which blooms into a full, girthy, ");
	if(penny.hasKnot(0)) output("six-inch, orgasmicly enlarged sphere");
	else output("three-inch thickness");
	output(" well ahead of the rest of the organ. Penny’s cheeks abruptly fill with what must be a momentous amount of seed, forcing her to gulp and swallow to keep up. Meanwhile, the shape of her phallus is stretching lengthwise, thickening to keep it proportional. Her urethra pulsates and jumps with each hot load of jism that it’s forcing into the fox-girl’s mouth, stretching larger with each shot in order to handle the growing copiousness of her ejaculations.");
	output("\n\nPenny’s lips stretch a little bit around the thickening tip, but the true entertainment lies in watching it reach deeper into her throat. The fox soon reaches her limit, and you get to watch her slowly be pushed up out of her own groin and into a more upright position. Her meaty fuck-piston is actually lifting her into a proper, upright sitting stance by the force of its multiplying erectile tissues. Not long after that, cum starts to pour out around the corners of her mouth, and she pulls off with a gagging cough, spewing unswallowed jism over her tits while her growing cock dumps a load of the stuff across her mohawk.");
	output("\n\nWith her cock acting as a spooge geyser, Penny can do naught but lie back and try to clear her throat while she showers herself in more. You’re certain she’s at least fifteen or sixteen inches long by this point, and still growing. Heck, even her balls look swollen; they’re currently as big as cantaloupes, but they do look to be shrinking a little with each blast of warm goo. The hugely endowed prick-vixen jacks herself off through the next few sordid splatters, gasping out a sigh when the blasts of seed trail off into a steady flow of dribbling white. She uses that as lubricant for a few lazy strokes, but after that orgasm, Penny seems completely wiped out. <b>Her cock is standing up a proud eighteen inches, rock hard</b>.");
	output("\n\nThe white-painted fox gasps, <i>“Ohhhhhhhhhhhh,”</i>  and lets her head hang back limply over the back of her chair, cum dripping off her to splatter onto the dozens of puddles on the floor around her. The corners of her mouth are twisted into an ecstatic smile, and she is soon back to properly stroking herself once more. <i>“[pc.name], you gotta try this. It feels so good. I just came but like, I know if I just keep stroking it I won’t get very soft. I can feel it in my balls. I’ll be able to cum again real soon. I’ll be able to cum so often!”</i>  She shudders as she cups one of her engorged nuts. <i>“Damn, it sucks that I have to work!”</i>");
	output("\n\nYou chuckle and point out that she’s got quite a bit of cleaning to do before she can even do that.");
	output("\n\n<i>“You’re right...”</i>  Penny drawls with a lazy stroke of her sperm-soaked phallus. <i>“I’ll get this cleaned right up, and then I can take care of myself in the shower!”</i>  Her cock pulsates powerfully along with that last statement, giving you a clear picture of exactly what she plans to do in the shower.");
	penny.cocks[0].cLength = 18;
	penny.cocks[0].cThickness = 3.5;
	if(penny.cocks[0].knotMultiplier < 2) penny.cocks[0].knotMultiplier = 2;
	penny.cumMultiplier += 5;
	penny.ballEfficiency += 3;
	penny.orgasm();
	this.userInterface.clearMenu();
	flags["PENNY_THROBB_USES"] = 3;
	this.userInterface.addButton(0,"Next",mainGameMenu);
}
//Stay Girl
function stayAGirlYouBitch():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("You calmly tell Penny that it would probably be best for her to remain a girl. After all, she’s already spoken about her lustful nature. Taking anything that would exacerbate it is probably a bad idea. Imagine what it would be like if she bumped into a zil with twice the libido and an irresistible desire to fuck?");
	output("\n\nGrowling, Penny says, <i>“Rrrr, I think you’re right, but fuck, it’d be fun to try.”</i>  She looks meaningfully down at one of her desk drawers and continues. <i>“Well, maybe you’ll change your mind later on. I’ll just hold on to the Throbb for now, unless maybe you want to buy some of it to help me recoup the cost.”</i>  Her ears perk up a bit. <i>“Just ask me later, I can probably give you the hookup for something like 300 creds a pop. Remember, don’t overdo it with this stuff unless you want to wind up a mindless fuckbeast or an immobilized, orgasm-addicted dick-stroker.”</i>");
	output("\n\nThe fox-girl giggles, <i>“If you do decide to do that, let me know! I want to watch.”</i>  She swivels her chair back. <i>“Right now, I have work to do. You know the drill.”</i>");
	flags["PENNY_THROBB_PURCHASE_UNLOCKED"] = 1;
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}
	
//Buy Throbb - Unlocked by futa talk, rejected or accepted
function buySomeThrobbFrompenny():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("Penny gives you a saucy smile as she reaches into her desk to retrieve a little injector needle. <i>“It goes straight into </i>");
	if(pc.hasCock()) output("<i>your dick</i>");
	else output("<i>your crotch</i>");
	output("<i>, [pc.name]. It shouldn’t hurt much if at all - the needles are coated in a numbing agent for easy application. The effects will be immediate and powerful. 300 credits, and don’t tell anybody you got them from me. It may not be illegal, but I don’t necessarily want my baser impulses told to the whole town, okay?”</i>");
	output("\n\nYou nod");
	if(pc.credits < 300) output(", but inform her that <b>you cannot afford a dose of Throbb</b>");
	else output(" and wonder if you’re sure that you want to spend 300 credits for a back-alley dick-enlargement formula");
	output(".");
	this.userInterface.clearMenu();
	if(pc.credits >= 300) this.userInterface.addButton(0,"Buy It",buyThrobbTransact);
	else this.userInterface.addDisabledButton(0,"Buy It");
	this.userInterface.addButton(14,"Back",approachGirlfriendPenny);
}
//[Buy] [Back]
//Transact It
function buyThrobbTransact():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("<i>“Thanks, mate,</i> Penny says as she checks her cred account. <i>“Looks like everything came through okay. Maybe I’ll get my loans paid off faster I thought!”</i>");
	
	//Acquire 1x throbb
	//lootList[lootList.length] = clone(throbb);
	//-300 credits
	pc.credits -= 300;
}

//Penny Sex Menu
function pennySexMenu(outputT:Boolean = true):void {
	this.userInterface.showBust("PENNY");
	if (outputT)
	{
		clearOutput();
		//Non-futa
		if (!penny.hasCock())
		{
			//Horny
			if(penny.lust() >= 66) output("Penny’s ears perk right up when you admit that you’re want to have sex. She even says, <i>“Ohhh, this is just what I need, [pc.name]!”</i>  Out of her seat a moment later, the busty, aroused vixen coos, <i>“So, any preference as to how I take you today, mate?”</i>");
			//Not Horny
			else output("Glancing up at you, Penny sighs, <i>“Right now?”</i>  She doesn’t really look up for it right now, but after a moment, a sly look spreads across her face. <i>“I suppose it’s as good an excuse for a break as any.</i> She shimmies a hand into the waistband of her pants as she lazily stands. Her eyelids drop seductively as she pulls her fingers out, glistening with moisture. <i>“I guess your scent has about as much effect on me as the zil, huh?”</i>  she jokes, though you wonder if there’s a bit of truth sliding underneath the jest.");
		}
		//Futa
		else
		{
			output("Penny is up and out of her chair almost as soon as you mention the idea of sex. Her fly is undone, leaving her [penny.cock] to point up at you, almost accusingly. She touches it experimentally and shivers from the rush of pleasure that courses out of it in response. <i>“I think so, [pc.name].”</i>  Rubbing it a little faster, the fennec enthusiastically offers, <i>“Does my mate have any preference for how I take " + pc.mf("him","her") + "?”</i>");
		}
	}
	this.userInterface.clearMenu();
	if (pc.hasCock())
	{
		if(penny.hasCock()) this.userInterface.addButton(0,"Onahole Her",jackinPennyOffWithAnOnahole);
		else this.userInterface.addDisabledButton(0,"Onahole Her");
		//Needs dick or strap-on
		trace("COCK SIZE: " + pc.cockVolume(0) + " PENNY CAPACITY: " + penny.vaginalCapacity());
		if (pc.cockThatFits(penny.vaginalCapacity()) >= 0) this.userInterface.addButton(1,"OverDeskFuck",pennyOverTheDeskRoughFuck);
		else this.userInterface.addDisabledButton(1,"OverDeskFuck");
		if(penny.hasCock()) this.userInterface.addButton(2,"Frottage",pennyFrottage);
		else this.userInterface.addDisabledButton(2,"Frottage");
		this.userInterface.addButton(3,"Pawjob",penniliciousPawjob);
		this.userInterface.addButton(4,"FaceFuckHer",faceFuckPenny);
	}
	else 
	{
		this.userInterface.addDisabledButton(0,"Onahole Her");
		this.userInterface.addDisabledButton(1,"OverDeskFuck");
		this.userInterface.addDisabledButton(2,"Frottage");
		this.userInterface.addDisabledButton(3,"Pawjob");
		this.userInterface.addDisabledButton(4,"FaceFuckHer");
	}
	this.userInterface.addButton(5,"EatHerOut",gardeFordWritesPennySmex);
	this.userInterface.addButton(14,"Back",approachGirlfriendPenny);
	
}

//Face Fuck Penny
function faceFuckPenny():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	author("Savin");
	output("Even while she's sitting, you can barely keep your eyes off Penny's tight little ass, barely concealed by her skin-tight uniform. Catching onto your attentions, Penny shifts ");
	if(!penny.hasCock()) output("excitedly");
	else output("uncomfortably");
	output(" in her seat, legs crossing and big fennec ears perking.");
	if(pc.legCount == 2) output(" You sit down on the corner of the police girl's desk");
	else output(" You lean your inhuman body against the police girl's desk");
	output(" and snake a hand in between her ears; you could swear you see her flush as you scratch her.");
	
	output("\n\n\<i>\"Mmm, see something you like " + pc.mf("handsome","beautiful") + "?\"</i>  Penny purrs, fluffy tail swishing happily at your merest touch. Grinning down at her, you twirl your finger, still staring at her bountiful butt.");
	
	output("\n\nWith a quick look around to make sure nobody's around to see, Penny slips out of her chair and pirouettes on a heel. Her hands brace against the wall behind her desk as she gives her hips a little wiggle for you, straining the tight fabric of her pants");
	if(penny.hasCock()) output(" as her bulge grows, clearly aroused by your undivided attention");
	output(". She moves faster, swaying her hips and wiggling her butt in a hypnotic dance, filling your gaze with a display of raw, animalistic sexuality: every move meant for your sexual gratification. And hers, by the looks of things. Turning back around to face you, Penny slides down the wall, spreading her legs to reveal a growing ");
	if(penny.hasCock())
	{
		output(" tent with a damp patch from its peak all the way down to its base");
	}
	else output(" damp patch over her crotch");
	output(". Her fingers dip in, swirling across the dark, taut fabric, teasing and caressing her sensitive bud.");
	
	output("\n\n\<i>\"I love the way you look at me,\"</i>  Penny sighs, voice husky with desire. <i>\"Why don't you come prove that you liked the show?\"</i>");
	
	output("\n\nShe licks her lips seductively, mouth wide open and inviting. You stip your gear off and slip around the desk as Penny adjusts her stance, getting her face at just the perfect height to accept your throbbing need. Her nose brushes your underside, lifting your [pc.cock] up as her tongue darts out, lapping at your base. Your shiver at her cool touch, her inhuman nose wet on your pecker as her tongue slides across your length.");
	
	output("\n\n<i>\"Did just a little show like that get you this turned on?\"</i> she teases, nuzzling your erection.");
	
	output("\n\nYou growl an affirmative, stroking the fox girl's huge ears as she wraps her lips around your [pc.cock], sucking it in. Her tongue plays across your glans, wrapping around the [pc.cockHead] and slathering it with warmth. Oh, that feels good. You urge her on, bucking your [pc.hips] slightly, pushing ");
	if(pc.cocks[0].cLength <= 10) output("every inch down her throat");
	else output("as much of your cock as she can take past her lips until she threatens to gag");
	output(". The fennec fox-girl groans as you push in, filling her mouth with cock, letting the first drooling drop of pre slide right down her throat. Leaning back against the wall, Penny tries to say something around her mouthful of dick, which sounds like an invitation to you. Grinning down at the hapless fox, you grab the sides of her head and ram your hips in!");
	
	output("\n\nYou launch into a brutal face-fucking, holding the fox's head steady as you pound your prick down her throat like a battering ram. She gurgles and squirms in your iron grip, unable to resist your [pc.cock]'s assult on her mouth. Eventually, she slumps back and takes it like a champ, letting her mouth hang agape as you press in, slathering up your prick in her drool until it drips from her lips in sticky strands. Her eyes roll back in her head, chest heaving as her fingers dip further and further into her honeypot, loosening her pants until they fall down to her ankles");
	if(penny.hasCock()) output(", letting her cock pop free. Her hands wrap around her throbbing erection, furiously stroking her [penny.cock]");
	output(". Masturbating with wild abandon, she moans around your spasming [pc.cock], gurgling as viscous streams of your salty pre swell down her throat, her spittle turning more and more white with every thrust into her maw.");
	
	output("\n\nThrowing your head back and screaming in pleasure, you thrust in as hard as you can");
	if (pc.cocks[0].cLength <= 10)
	{
		output(" until your ");
		if(pc.balls == 0) output("base");
		else if(pc.balls > 0) output("[pc.balls] ");
		if(pc.balls == 1) output("slaps");
		else if(pc.balls > 1) output("slap");
		if(pc.balls > 0) output(" against her chin");
	}
	output(". Penny yelps as your [pc.cock] invades her throat, ramming down as your prick spasms and spurts, flooding her tight throat with a deluge of your [pc.cumColor] seed. Her wet, warm tongue lashes at the underside of your twitching staff, thrashing wildly as its owner desperately copes with the rush of cum pouring into her mouth. The feeling's heavenly, throat and lips squeezing your [pc.cock] as you try and pull out of the well and truly face-fucked fennec fox; your body responds to the sensations by squeezing out another thick spurt of cream, depositing the glistening [pc.cumColor] dollop right on the tip of her tongue as it rolls out of her mouth, trailing behind your prick's exodus with thick, slimy strands connecting her to you, tinted [pc.cumColor] by the mouthful of cum she just swallowed.");
	
	output("\n\nCollapsing to the floor, Penny wipes her mouth with the back of her hand, staining her thick fur with the evidence of your oral pleasure. <i>\"That was... you're an absolute beast, [pc.name]. And I can't say I don't love it.”</i> You sigh with relief, leaning back against her desk with [pc.cock] still twitching, the last, most viscous drops of cum pooling on your [pc.cockhead] before dropping onto the floor between the panting fox's legs.");
	
	output("\n\nLike a charm, Penny's ears perk and her tongue licks her lips.");
	
	output("\n\n<i>\"Mmm, that was fun, you </i>");
	if(pc.cockVolume(0,false) >= 200) output("<i>big, hung </i>");
	output("<i>beast, but I still haven't had my fill.\"</i> She saunters over, hips swaying suggestively as she slips into your arms, pushing you back up against the desk. <i>\"Wanna finish what you started, lover " + pc.mf("boy","girl") + "?\"</i>");
	
	processTime(30+rand(15));
	pc.orgasm();
	//[Fuck her butt] [Get ass fucked] [Nah, girl]
	this.userInterface.clearMenu();
	if(pc.hasCock()) this.userInterface.addButton(0,"Fuck Her Butt",fuckPennyButtFromFraceFuckSceneNyahhhh);
	if(penny.hasCock()) this.userInterface.addButton(1,"GetButtFucked",getAssFuckedByPenny);
	this.userInterface.addButton(2,"Nah, girl",nahhhhGurrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrllllllllllllllllllllllllllllllllllll);
}

//Nah,girl
function nahhhhGurrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrllllllllllllllllllllllllllllllllllll():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	author("Savin");
	output("Way too exhausted after the furious face-fucking you just gave Penny, you sadly must decline. The pretty fox girl seems to deflate in your arms, but still gives you a hug and tells you to come back soon. <i>\"After all, I owe you a good fucking for this!\"</i>");
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

//Get ass fucked (Penny gotta have the D, yo)
function getAssFuckedByPenny():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	author("Savin");
	if(pc.hasCock())
	{
		output("You grin ");
		if(pc.tallness <= 55) output("up ");
		else if(pc.tallness >= 66) output("down ");
		output("at the lusty fox-girl, and give her a little push. With a gasp, Penny flops back into her chair, rolling it right back against the wall. You pounce on her, straddling her and her big, throbbing cock, pointed right up at you like a third arm. Still reeling from the push and roll, Penny's breath catches in her well-fucked throat as your fingers wrap around her [penny.cock], roughly stroking her prick until it's as hard as diamonds in your grasp.");
		
		output("\n\n<i>\"Mmm, you really want it, hmm?\"</i>  Penny says, hands reaching around your waist. A low moan escapes your lips as her small fingers, so delicate and yet so strong, dig into your [pc.butt], pulling you hard against her. You can't resist the urge to kiss your lover, leaning in and pressing your lips to hers, tasting your seed still hot on her lips. Her tongue probes in, playing across your own, delving deep into your mouth as the predatory fox starts to take back control, kneading your flesh as she holds you fast to her, trapping your hand around her cock between your two bodies. She cups your cheek, holding the kiss a moment longer before you can lean back, still nuzzling her hand as you slip out of her lap and down onto your [pc.knees]. Your head rests gently in her lap, chin barely an inch from her erection which is twitching of its own accord, a pearly bead forming at its tip. Cooing happily, Penny strokes your hair, urging you on with a few growled words of encouragement. <i>\"I did it for you, [pc.name]. The least you could do is return the favor...\"</i>");
		
		output("\n\nGrinning up at her, you figure ");
		if(pc.isNice()) output("fair's fair, after all");
		else if(pc.isMischievous()) output("you might as well lube her up before she gets any ideas of her own");
		else output("you might as well make her squirm before the main course");
		output(". You give her shaft a few experimental strokes, and in no time the police girl's legs are trembling, breath quickening and cunt wettening, the sodden box drooling its feminine slime freely onto Penny's chair. How cute. Your free hand snakes over, twirling around her prominent little clit until she gasps, back arched. You pick up the pace, jerking her off faster and faster until she squeaks a cute little moan, biting her lip as her hips buck, trying to fuck your hand like her personal onahole.");
	}
	else 
	{
		//Get Buttfucked (Alt. Intro, for dickless characters. Selectable from sex menu)
		output("Looking down at the lusty hermaphroditic fox-girl sitting before you, you can't help but notice the bulge in her pants - the very thick, beautiful cock you convinced her to grow. Licking your lips, you slip down onto her desk, sitting with [pc.legs] dangling just inches from Penny's lap. Seeing where your eyes are going, the fox-girl crosses her legs, blushing under her dark fur. You lean in and give her a scratch between the ears, running your fingers through her short, punky mohawk. Almost unconsciously, Penny nuzzles your hand, moaning lightly.");
		output("\n\n<i>\"Got a few minutes, officer?\"</i>  you ask, grinning, <i>\"I've got a real problem, and I think you and that [penny.cock] of yours are just the thing to help.\"</i>");
		output("\n\nPenny gulps as you slip into her lap, pushing her rolling chair back against the wall as you press your lips to hers. You pounce on her, tearing off her pants and straddling her and her big, throbbing cock, freed and pointing right up at you like a third arm. Still reeling from the push and roll, Penny's breath catches in throat as your fingers wrap around her [penny.cock], roughly stroking her prick until it's as hard as diamonds in your grasp.");
		output("\n\n<i>\"I-is that so,\"</i>  Penny says, hands reaching around your waist as you unbotton her shirt, groping and sucking at her perky little tits. A low moan escapes your lips as her small fingers, so delicate and yet so strong, dig into your [pc.butt], pulling you hard against her. You can't resist the urge to kiss your lover, leaning in and pressing your lips back to hers, tasting her hot breath, growing faster and more shallow as your tongue probes hers; it counters, delving deep into your mouth as the predatory fox starts to take back control, kneading your flesh as she holds you fast to her, trapping your hand around her cock between your two bodies. She cups your cheek, holding the kiss a moment longer before you can lean back, still nuzzling her hand as you slip out of her lap and down onto your [pc.knees]. Your head rests gently in her lap, chin barely an inch from her erection which is twitching of its own accord, a pearly bead forming at its tip. Cooing happily, Penny strokes your hair, urging you on with a few growled words of encouragement.");
		output("\n\nYou give her shaft a few experimental strokes, and in no time the police girl's legs are trembling, breath quickening and cunt wettening, the sodden box drooling its feminine slime freely onto Penny's chair. How cute. Your free hand snakes over, twirling around her prominent little clit until she gasps, back arched. You pick up the pace, jerking her off faster and faster until she squeaks a cute little moan, biting her lip as her hips buck, trying to fuck your hand like her personal onahole.");
	}
	//[Dickless scene intro combines back here]
	output("\n\nBut you'll have none of that! You put a firm hand on her thigh, pushing her back down against the chair. Penny groans but doesn't resist, letting you hold her down as you slip down between her legs, tongue rolling out down across her cock's base. Slowly, you trail up and up her shaft, leaving a nice slick trail from stem to stern. Whining with pleasure, Penny tears her shirt open, bearing her nicely-rounded tits; she cups the two swollen mounds, squeezing her pink teats as you plant an affectionate kiss on her cockhead.");
	//{If PC has C+ cup tits:
	if(pc.biggestTitSize() >= 3) output(" The sight of the sexy fox playing with her own tits gives you an idea, though....");
	
	//Con't: 
	output("\n\nYou rise up on your [pc.knees] and grab your [pc.chest], cupping the two heavy orbs and squeezing them together, giving Penny the perfect view of your sizable cleavage. Giving your tits a little jiggle for her, you lean in and let them wrap around her shaft, burying Penny's cock in a bed of boobage. Slowly, you drag her [penny.cock] through the valley of your cleavage, lifting your tits up and down her girth until she's left you a nice, pearly trail between your tits, her [penny.cockHead] just poking out between the two soft orbs. You gobble it up, sucking down the first inches of her cock as your tits work her length, sending the sensitive fox girl into a whole new realm of pleasure that soon has her panting and gasping, cock bubbling pre freely.");
	
	output("\n\nYou don't let up, continuing to jerk the foxy fox off until she's putty in your hands, whimpering and moaning in pleasure, alternating between stroking her tits, pulling you down on her cock, and fingering her sodden box. You let her guide your head down her shaft, parting your lips to take every inch of her throbbing erection. You easily suck up her salty, musky cock, wrapping your tongue around the pulsing shaft until your lips brush her crotch. You look up at Penny expectantly, but find her eyes closed, head rolled back in pleasure, trying hard not to cum right in your mouth.");
	
	output("\n\nWith Penny's pulsating prick nice and slathered in spit and drooling her musky pre, you deem her nice and ready for a real fucking. You slip up her svelte, vulpine body, trailing kisses and caresses up her belly to the peaks of her breasts, pushing her fingers aside to wrap your lips around one of the erect teats. You give the red bud a hard suck, pulling it back until it slips from your lips with a wet pop; Penny gasps, breath quickening as you shower her in affection. Her hands cup around your [pc.butt], lifting you into her lap, resting your head on her shoulder. She spreads your cheeks, squeezing them roughly as her [penny.cock] slips in, sliding into your [pc.butt]'s cleavage before her fingers let go, trapping her meaty shaft in your cheeks.");
	
	output("\n\nGrabbing the fox's lithe shoulders for support, you start to move your hips, gently sliding along the length of her " + num2Text(Math.round(penny.cocks[0].cLength)) + "-inch shaft. You take every inch slowly, tenderly squeezing and rubbing her thick pole's entire length until just the head is parting your cheeks before you slide back down. Penny cries out, practically trembling in your grasp as your [pc.butt] pleasures her prick, humping away until you can feel her [penny.cock] twitch violently, practically spasming as it spurts a glob of pre right on your [pc.asshole]. Warm and wet and oh so sinfully sticky, you shudder with pleasure as Penny gives you her very own lube, adding to the slick coating you've given her cock already. Well, she's clearly ready and raring to go, and you can't deny the burning need growing in your loins.");
	
	output("\n\nYou press your lips to hers, locking Penny in a kiss as you rear up, grabbing her cock and holding it steady. Her fingers lock around yours, holding you for a brief second before spreading your cheeks wide, letting you glide down her throbbing shaft. It parts your walls with a second of mind-numbing pressure, her head spearing past your sphincter a second later. You both moan with shared breathless pleasure as your [pc.hips] slide down, taking inch after inch of [penny.cock], feeling your stomach churn as the thick member spreads you wide. Penny's hands lock on your hips, guiding your descent until your butt's on her lap, balancing on her legs as her cock twitches and spurts inside you, filling your ass with juicy fox-pre.");
	
	
	output("\n\n<i>\"So good...\"</i>  Penny whimpers, ");
	//if PC is tight
	if(pc.ass.loosenss <= 1 || (pc.ass.looseness <= 2 && penny.cocks[0].cLength >= 10)) output("<i>\"so t-tiiiight...\"</i>");
	else if(pc.ass.loosenss <= 3 || (pc.ass.looseness <= 4 && penny.cocks[0].cLength >= 17)) output("<i>\"fits just like a glove...\"</i>");
	//if PC is SUPAH LOOSE:
	else output("<i>\"m-maybe I ought to grow this beast out a little, [pc.name]. I wanna fill this [pc.asshole] of yours someday....\"</i>");
	buttChange(penny.cockVolume(0));
	
	output("\n\nYou silence her with another kiss, pinning her back as your arms wrap around her neck, steadying yourself as your hips begin to rise. Your breath comes ragged as you rise off her cock, feeling the hollow emptiness overwhelm your hole as you nearly dismount her rod, only to be filled with inch after inch of foxy cock again. The feeling of completeness, of wholeness, is undeniable. You sit a moment, relishing the sensation, before rising again, dragging out the heavenly feeling your anal walls being spread and sphincter ravaged across bounce after bounce.");
	
	output("\n\nYou don't have any warning at all when Penny cums: only a quiet, feminine grunt and a sudden warmth in your ass as her [penny.cock] twitches and churns, blasting in a sticky white load deep in your bowels. You gasp and moan, quickening your pace to milk her spasming prick.");
	if(pc.biggestTitSize() >= 3) output(" Throwing her head back, Penny grabs your tits, roughly squeezing the full mounds of your breasts as you ride her cock to fulfilment.");
	else output(" Throwing her head back, Penny reaches around to grab your ass, squeezing the full cheeks as you ride her cock to fulfilment.");
	output(" Both groaning in pleasure, you buck and bounce on the fox's cock while she shoots load after load of bubbling fox cream deep up your ass, painting your rectal walls white with seed.");

	//If PC has a cock:
	if(pc.hasCock()) 
	{
		output("\n\nThe feeling of Penny's seed coating your prostate, slathering the sensitive bud in hot cum, is too much for you. With " + pc.mf("primal roar","feminine whimper") + " you feel [pc.eachCock] spasming, [pc.balls] churning as your own [pc.cumColor] spunk rushes up your cumvein");
		if(pc.cockTotal() > 1) output("s");
		output(". Penny yelps as a blast of hot, sticky jizz splats onto her belly, staining her dark fur [pc.cumColor]");
		if(pc.cumQ() >= 50) output(" as a particularly powerful spurt shoots upward, smearing onto her neck to dribble down onto her breasts");
		output(".");
	}
	//IF PC has a cunt:
	if (pc.hasVagina())
	{
		output("\n\nYour quim clenches and spasms as Penny's cock spears your ass, desperate for some semblance of pleasure, for a big, thick foxcock to milk. Your fingers delve into your [pc.vagina], swirling around [pc.oneClit], trying to bring it a little pleasure, tiding it over as your [pc.asshole] clenches hard on Penny's [penny.cock], an anal orgasm working through your body until your shivering and moaning in rectal pleasure.");
	}
	output("\n\nExhausted, you collapse onto Penny, chin resting on her shoulder as you both heave and sigh, basking in the exquisite pleasure, feeling your lover's rod still moving inside you, depositing its last drops of salty seed deep in your bowels. Penny groans, holding you close as her ");
	if(penny.hasKnot(0)) output("knot");
	else output("cock");
	output(" starts to deflate, letting her slowly pull it from your battered hole. You shudder as the feeling of absolute emptiness overwhelms you, but that sensation quickly gives way to warmth and wetness as her seed follows her cock, drooling out of your [pc.asshole] to pool between your lover's legs.");
	
	output("\n\n<i>\"Such a little buttslut, my mate,\"</i>  Penny growls, giving you a nip on the ear. <i>\"And I love it.\"</i>");
	
	output("\n\nYou stumble to your [pc.feet], helping the weary fox-girl up and pulling her into a tight hug. <i>\"Alright, alright,\"</i> she laughs, giving you a quick kiss, <i>\"go on, get going. I've gotta clean up before someone comes by.\"</i>");
	
	output("\n\nYou give the lusty fox a quick pat on the rear and saunter off, walking a bit stiffly as your anus recovers from the pounding it just took.");
	pc.orgasm();
	processTime(32);
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

//Fuck Her Butt (From Facefuck scene)
//Read the function name in Lothar's voice.
function fuckPennyButtFromFraceFuckSceneNyahhhh():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	var x:int = pc.cockThatFits(penny.analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("Finish what you started? As if she had to ask.");
	output("\n\nYou grab Penny's tight ass, pulling her close against yourself as you kiss her, tasting your seed still hot and salty on her lips, her breath still heavy and tainted with lusty moans. Her arms slip around your waist, squeezing your [pc.butt] right back before they trace around your [pc.hips], furry fingertips brushing along sensitive [pc.skin] until they delve into your groin, wrapping around your spit-slick cock, still brimming with juicy cum and ready to fuck it into the lusty fox until she's screaming for more.");
	output("\n\nWith one easy motion, you flip Penny around so she's lying on her belly, legs spread and heiny hiked in the air, swaying seductively as the dazed fox recovers. You sink your fingers into that ass, kneading her taut, tight bum until Penny is squirming in your grasp. Her breath is shallow and ragged as you savage her butt, lavishing every inch with gropes and caresses, sliding your fingers through her thin, velvet-soft fur. Slowly, you work your way down, gently spreading her legs even further until you can slide a finger into her drenched cunt, still sodden with feminine slime. Penny lets out a low, sensual moan as your fingers dip into her honeypot, swirling around the quivering walls of her quim until your fingers are nice and soaked with the fox girl's own lubricant.");
	output("\n\nWhen you pull out, fingers trailing with shimmering slime, Penny rolls over to face you, chest heaving as she stares down at you. Her hips wiggle, legs wrapping around your shoulders as you get down on your [pc.knees], grinning at the puckered little hole hidden between her tight, furry cheeks.");
	
	output("\n\n");
	//If First time anal:
	if (flags["PENNY_TIMES_ANAL_SEXED"] == undefined)
	{
		output("Penny squirms as your fingers trace along the crescent of her cheek, breath catching as your slick finger presses gently against her ass. <i>\"Be gentle, my mate... I haven't done a lot of this before.\"</i>");
		
		output("\n\nYou grin at the police girl and pat her thigh, telling her you'll be extra gentle. ");
		flags["PENNY_TIMES_ANAL_SEXED"] = 1;
	}
	else flags["PENNY_TIMES_ANAL_SEXED"]++;
	output("Leaning up to plant a quick kiss on her prominent red bud, you press two fingers down with a gentle but unyielding force against Penny's tightly-clenched sphincter. With a gasp and a pop, the tips slide in, vanishing through the clenching hole into the dark, smooth, and sinfully tight confines of her anal passage. Her whole body seems to react to the moment of penetration: her back arches, legs writhing around you. Penny's fingers dig into the desk, teeth gritting as your first knuckle passes through her sphincter, pushing through the madly contracting muscle and into the dark depths of her hole. The second knuckle passes a long moment later, and Penny's practically crying with pleasure and pressure, squirming and straining against the desk as you gently move back out and in again, smearing her feminine lube liberally on her warm walls, getting her nice and wet and loose for you.");
	output("\n\nWith a few final, furious thrusts, you pull your fingers from the fox's butt, letting her catch her breath from the relentless finger-fucking. You stand, bracing your hands on her shaking knees as your stiff, [pc.cock " + x + "] comes to rest against her thigh, both your cock and her tender flesh practically quivering in sexual anticipation. You stroke your member, guiding the mighty shaft to Penny's slick ass, letting the [pc.cockHead " + x + "] gently press against the clenched hole. The foxy beauty stops you, though, just a moment before penetration: Penny grabs your hands in hers, guiding them to her hips and lacing her fingers through yours, holding you tight as you finally push in.");
	
	output("\n\nThe entrance is pure bliss. Penny's ass is a silken vice around your [pc.cock " + x + "], a perfect glove to fit your probing member, glistening with feminine lubricant to ease the entry past her quivering muscles, contracting and squeezing in mindless quasi-rhythm. Your head rolls back, a pleasured sigh escaping your lips as you revel in the milking vice churning around your prick. Your hips sink in, slowly spearing your [pc.cock " + x + "] deeper into Penny, making the poor police girl moan and scream, arching her back and squeezing her breasts, trying desperately to take your length in her tight hole. Finally, after long moments of pressure and exertion, you feel your [pc.cock " + x + "] ");
	if(pc.cockVolume(x) < penny.analCapacity()) output("bottom out inside her, your groin pressing against her tight cheeks");
	else output("has reached the limit of what the little fox can take, leaving inches of your massive girth outside in the cold air");
	output(". Breathing hard, Penny looks up at you with lust-glazed eyes, whimpering with need.");
	
	output("\n\n<i>\"G-go on... fuck me. Please...\"</i> she moans, jerking her hips ever so slightly, trying to get a little more of your prick. With a face like that, torn apart by lust and need, you can't help but give her what she so desperately wants.");
	
	output("\n\nGripping Penny's hips, you start to move. Slowly at first, giving the fennec girl a chance to adjust to the anal assault, each motion taking several seconds from pull to thrust. She moans and groans, voice steadily growing from primal grunts of pleasure and pain to ecstatic cries of sexual satisfaction, screaming your name and her love for your [pc.cock " + x + "] as you pick up the pace, jackhammering her ass with abandon. Her legs lock around your waist, pulling you harder against her, jamming your prick deep in her hole, forcing you to go faster and faster until your hips feel like they're on automatic, furiously buttfucking the fox until she's screaming at the top of her lungs. Stacks of data slates and jars of pens go flying off her desk as your [pc.legs] slam into it, the whole room seeming to shake as your lovemaking approaches its crescendo.");
	
	output("\n\nThrowing your head back with a cry of pleasure to rock the heavens, your [pc.cock " + x + "] discharges its load deep into the fox's ass, hips humping and her muscles squeezing, milking the first thick globs of [pc.cumColor] seed to paint her anal walls. Her ass contracts around you, muscles running rampant as the fox joins you in orgasmic bliss, bucking her hips on your thrusting member until you can see her cunt spasming, soaking her fur as she cums and cums.");
	
	output("\n\nMinutes pass in ecstasy, feeling the slow deluge of your seed pouring into Penny's bowels, enjoying her muscles around your member and the cute moans she makes as she soaks herself in femcum. Eventually, your joint orgasms wear down, and you're able to gently pull yourself from the fox's gaping hole, letting the excess cum pour out and pool on the floor. Penny groans, trying to stand and failing miserably. Eventually, she just rolls onto her belly and smiles absently as you grab your gear, a fuck well done.");
	
	output("\n\n<i>\"That was amazing, my mate,\"</i> she purrs, patting her well-fucked ass. <i>\"Let's do it again... and soon.\"</i>");
	pc.orgasm();
	processTime(27);
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

//Pennilicious Pawjob
function penniliciousPawjob():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("<i>“A little paw-play, huh? Well I guess I do have the fluffiest feet on the planet,”</i>  Penny muses as she rounds the desk. Her hips swish back and forth seductively, drawing your eyes down to her hip-hugging pants");
	if(penny.hasCock()) output(", her [penny.cock] hard and free, bouncing with anticipation");
	output(". She rubs a furred paw against your [pc.leg] affectionately before turning away towards the cells. Rather than take you into the general holding cells, she veers a left down a dank-looking corridor toward a single metal door.");
	
	//First time
	if (flags["TIMES_PENNY_PAWJOBBED"] == undefined)
	{
		output("\n\nThe short, stacked vixen arches her back and looks over her shoulder, raising one paw to lewdly press on your crotch");
		if (pc.armor.shortName != "" || pc.lowerUndergarment.shortName != "")
		{
			output(" through your ");
			if(pc.armor.shortName != "") output("[pc.armor]");
			else output("[pc.lowerUndergarment]");
		}
		output(". The oh-so-soft pads upon the bottoms of her feet compress nicely against you as she soothingly prattles, <i>“Don’t worry about the decor, mate. There’s no more private place than the inside of a solitary confinement cell.”</i>  She jangles the key ring on her hips, but you barely notice. You’re openly grinding against her foot as she talks, so into the act that you’re really beyond caring. <i>“Do my squeezing, caressing little toes have you feeling so good that you don’t even care about potentially getting locked in a cell?”</i>  the vixen purrs. You nod, explaining in panting breaths that you trust her");
		if(pc.isAss()) output(", to avoid pissing her off");
		output(".");
	}
	//Repeat
	else
	{
		output("\n\nThe vixen glances your way, seeing the smile on your face, and she slowly raises a paw in your direction, holding it up at crotch level but not quite against you. <i>“Ready for another night in solitary confinement?”</i>  she asks with a lewd smile.");
		output("\n\nYou step forward so that her fluffy paw is pressing against [pc.oneCock]");
		if (pc.armor.shortName != "" || pc.lowerUndergarment.shortName != "")
		{
			output(" through your ");
			if(pc.armor.shortName != "") output("[pc.armor]");
			else output("[pc.lowerUndergarment]");
		}
		output(", squeezing it with tantalizing soft pads. You cheerfully answer, <i>“Ohh yeah,”</i>  and grind your [pc.hips] up against it.");
		output("\n\nPenny sighs ruefully, jangling her keys to double-check that she brought them while you busy yourself on her supple toes. <i>“Atta " + pc.mf("boy","girl") + ", come along now.”</i>");
	}
	//Merge
	output("\n\nSliding open the door, Penny takes her time in order to allow to you to really work yourself up on her fluffy extremity. She does not give you too long to enjoy the paw-grinding. Instead, she pulls her leg away and enters the room, leaving you to chase along after her.");
	output("\n\nYou enter the darkened room behind her");
	if(!pc.isNude()) output(", stripping out of your equipment as you go");
	else output(", setting your possessions aside");
	output(", and turn to take in your surroundings. There’s not much to see - a simple cot with clean sheets, a toilet in the corner, and a light fixture that only has one working light source. That’s discounting the other occupant of this little cell. The tawny girl stripped naked while you were divesting yourself of your belongings, and she’s now sealing the door. This gives you a perfect view of her pert, almost heart-shaped rump, exposed by her upraised tail. It wags back and forth above her while she ensures your privacy, allowing you to see everything from the pink lips of her sex to the darker pucker of her anal star.");
	
	output("\n\nYou’re considering throwing your earlier suggestion out the window, but the foxy fennec finishes up and turns around, catching you mid-stare. She smiles genuinely and turns back around, walking backwards with an exaggerated sway to her steps, wiggling her bottom with almost hypnotic motions. Tickling at your nose, the vixen’s tail slides down your chest to press back on you, guiding you towards the bed. You flop back onto the simple prison bunk, looking up at the short");
	if(pc.tallness >= 65) output("er");
	output(" woman while she circles around, shaking her body for your enjoyment until she sits down beside you.");
	
	output("<i>“So, mate, do you mind licking me out</i>");
	if(pc.hasCock()) output("<i> or sucking me off</i>");
	output("<i> while I do this, or we going to forget this foot business and just get naughty?”</i>  Penny asks.");
	//[Lick Out] [Suck Off] [GetGroundOn] [Frot]
	//The first two go to the same scene with variations. The second two are unique.
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Lick Out",lickOutSomePennyDawg);
	if(penny.hasCock()) this.userInterface.addButton(1,"Suck Off",suckOffPennyDawgYoMahDiggity);
	this.userInterface.addButton(2,"GetGroundOn",getGroundOnByPenny);
	if(penny.hasCock()) this.userInterface.addButton(3,"Frot",pennyFrottage);
}

//Lick Out
function lickOutSomePennyDawg():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("You motion for Penny to mount your face and recline back onto the meager cushions your temporary bunk affords you. Gleefully giggling, the fox-girl sweeps herself up onto your middle, assailing you with her body heat for a moment until she begins to drag herself upwards. Her moisture is leaking from her slit just enough for you to feel it trickling on your [pc.skinFurScales] as she moves. You reach up, grabbing her supple butt, and you drag her the rest of the way to your face, setting her down so that she’s straddling your head, her moist slit kissing your lips with leaking liquid affection. It seems to draw your tongue inside it without any action from you, but that can’t be the case. Your anticipation has risen to maddening levels, giving you all the motivation you need to service the fennec while you await the reciprocation of pleasure.");
	suckAndLickAtPennyYouDildo(false);
}
//Suck Off
function suckOffPennyDawgYoMahDiggity():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("You open your mouth into a wide-stretched ‘o’ and flop out your tongue, reclining back onto the meager cushions of your bunk as the message sinks into Penny’s lusty, hermaphroditic psyche. She squeals a moment later, leaping up onto the cot with you. Her [penny.cock] flops down squarely between your [pc.fullChest], and ");
	if(pc.biggestTitSize() >= 1) output("you teasingly squeeze them down around her in a breasty hug");
	else output("you teasingly press it against your flat body to give her a little more sensation");
	output(". Penny groans, but she keeps moving higher, dragging her twitching, erect boner up your body to your face. A single dollop of pre beads on the tip, hanging lower and lower. Penny aims it down and slides it straight through your open lips. Gurgling, you accept her [penny.cock] as well as you can, taking it deep inside you, suppressing your gag reflex as well as you’re able. A single, muffled moan vibrates through her boner as you lick at the shaft, aching for her to touch you down below.");
	suckAndLickAtPennyYouDildo(true);	
}

//Merge suck off and lick out
function suckAndLickAtPennyYouDildo(dick:Boolean = true):void {
	output("\n\nPenny gasps, <i>“Oh, mate, you are something else.... Your mouth, god! It’s good!”</i>  She whimpers a little, coupled with a sexy wriggle atop you to press her genitals more firmly into your accomodating mouth. <i>“I guess it’s time I held up my-ooohhhh... umm, end of the bargain.”</i>  A second later, there’s soft fur tickling at [pc.oneCock], pressing down on it from both sides at once. The vixen’s supple paws push down on either side. Her pads feel heavenly against your [pc.cockBiggest], perfectly textured with their puffy, super-soft pads. Groaning into Penny’s crotch, you struggle to hold still so that her feet can properly tend to you.");
	output("\n\n<i>“You like that, don’t you, [pc.name]? You like my foxy paws wrapping around your cock and stroking it, jacking you off with my feet,”</i>  Penny states with a sigh. Her toes interlace around your [pc.cockBiggest]");
	if(pc.biggestCockVolume() >= 500) output(" as well as they can, given its girth");
	output(", and she begins to pleasure you. Twisting them around, she keeps one on top for a while, slowly pumping up and down, squeezing your naturally secreted lubricant onto the other before switching. Then, the process begins anew, making Penny’s feet shine with sexual juices while they clasp your cock in their honeyed embrace. It’s all you can do not to thrust and try to fuck her feet right then and there.");
	output("\n\nGrabbing hold of the fennec-morph by her curvy bottom, you try to focus on the oral you’re providing - anything to distract your body from its building need to fuck, to thrust wildly and with reckless abandon into the faux orifice surrounding it. Sensing this, Penny takes her slick paws and begins to go faster, polishing your [pc.cockBiggest] with with its own juices. The alternating textures of her soft fur and pleasant pads are stoking your ardor until you feel like your whole body is a blaze of sexual need, but you strain to hold still. You’re determined to let her feet bring you to climax, after all.");
	output("\n\nYou start to moan enthusiastically into Penny’s crotch. The vibrations only serve to turn her strokes jerky and irregular, which in turn heightens your own excitement. The fox-girl grunts, <i>“Come on, my </i>");
	if (dick) output("<i>cock</i>");
	else output("<i>cunt</i>");
	output("<i>-pinned prey! Cum for me! Shoot it out all over my paws!”</i>");
	
	output("\n\nPenny’s feet are completely soaked with your pre-cum by this point, and each sloppy stroke is squelching quite noisily in the confined space. A knot of pressure has begun to well up inside you, signaling that your impending climax is but a moment away and growing more and more noticeable with each passing heartbeat. You whip your tongue around ");
	if (!dick) output("inside the fox-girl’s clenching cunt with wild abandon, suddenly hungry to taste her climactic juices.");
	else 
	{
		output("the fox-girl’s trembling shaft with wild abandon, suddenly hungry to feel her pump her hot load straight into your throat.");
		if(pc.balls > 0) output(" Her balls are tightening above you and alert you to the success of your actions.");
	}
	output(" Then, she cums, pouring her juices into your mouth, and you find yourself cumming with her.");
	
	output("\n\nYour hot load spews out onto your belly, one jet after another. Penny intervenes mid-climax, rubbing a paw against the topside of your spurting cock and guiding her other in the way of your slippery stream. Your [pc.cumColor] pleasure washes across her foot, and she grunts, still cumming into your mouth while she enjoys watching your [pc.cum] cling to her soles.");
	if (pc.cumQ() >= 40) 
	{
		output(" The excess rolls off you to either side to soak into the mattress pad, turning your bunk into a sopping mess");
		if(pc.cumQ() >= 500) output(", eventually overwhelming its meager absorptive capabilities to cascade onto the floor");
		output(".");
		if(pc.cumQ() >= 1000) output(" Luckily, there’s a drain to catch the waves of spooge you put out, and you don’t wind up flooding the entire cell.");
	}
	if(dick) output(" The prick-toting vixen is no slouch when it comes to cum production, and you’re actually grateful that she’s buried so deeply into your throat, as it saves you the trouble of having to swallow. She shoots straight into your belly until you’re feeling full.");
	
	output("\n\nEventually, both your climaxes die down. Penny lazily mops up some of the jizz that missed her with the clean paw, soaking it in [pc.cum]. Your juices trail from her padded foot in a sticky web, and the fox-girl giggles at her ineffectual attempts to clean you up. She even spends a few moments rubbing her drenched soles over [pc.eachCock], soaking you with your liquified bliss, allowing you to luxuriate in post-climactic ecstasy.");
	
	output("\n\nOnce you’ve had your fill, you push the lewd little fox-girl off of you, feeling quite sated and sticky. Penny teases, <i>“Ohhh, mate, you’ve soiled my feet! I need a shower now!”</i>  That doesn’t stop her from walking in a way that has her slippery limbs sliding against each other, smearing your leavings higher and higher up her calves on her way to the door. There’s the satisfying click of a lock being disengaged, and Penny scampers away, ");
	if(penny.hasCock()) output("[penny.cock] flopping comically between her legs, ");
	output("leaving [pc.cumColor] footprints in her wake. You grab your gear and see your way back out to her office now that you’ve gotten a handle on your baser urges.");
	processTime(34);
	pc.orgasm();
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

//GetGroundOn
function getGroundOnByPenny():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("<i>“Huh,”</i>  Penny responds, <i>“I was kind of looking forward to seeing how much of your [pc.face] and [pc.tongue] I could cram in my pussy.”</i>  She shrugs noncommittally. <i>“A cock is fine too.”</i>");
	output("\n\nYour [pc.cockBiggest] is suddenly squeezed by the vixen’s soft fingertips. She caresses it lovingly while admitting, <i>“Oh, I’m definitely going to enjoy this.”</i>  One furry thigh after another, Penny throws herself up onto the cot to straddle your [pc.hips]. Your member, previously hard and jutting slightly upward, is swiftly pinned between your two bodies. Penny’s plush mound and petite cleft grind against it, spreading slightly over your urethral bulge. Her legs splay wider, almost into a perfect split as she settles in, rubbing her plush, pink cunt back and forth along your length gently, smearing a trickle of lubricants onto your dick. You sigh and look up at the big breasted fennec. Her curvy breasts bounce slightly, and your eyes fixate on the pink nipples while you enjoy the feel of her sex on you.");
	output("\n\nPenny sighs and leans forward, letting her elbows drop down to either side of your face. Her big, blue eyes peer into yours, and she abruptly licks the side of your face. You frown up at her until she tilts her head to plant a proper kiss upon your [pc.lips], putting that tongue to work in your mouth. At the same time, her rump begins to shake, ass-cheeks jiggling. The bouncing can be felt through the soft folds shrouding part of your [pc.cockBiggest]. Shivers of excitement radiate out around the point of sensuous contact, causing you to moan excitedly. Giggling, the fox-girl slides herself forward, dragging her posh cunt across your cock, the velvet curtains massaging your flesh every bit as wonderfully as a masseuse’s hands.");
	//{Boobiegrind}
	if (pc.biggestTitSize() >= 1) 
	{
		output("\n\nYour [pc.nipples] drag across Penny’s lush breasts as she moves into position. She giggles and squeezes your breasts with one hand - an act that requires her to balance quite oddly on the other. She manages it quite well, letting you enjoy the feeling of her furry teats pressed against yours, rubbing back and forth the same way her twat is gliding along your [pc.cockBiggest]. You grab hold of the matched bosoms and let your hands do what they want, sometimes squeezing Penny’s teats and other times groping your own. Sometimes you your fingers find your way into the sea of nipples to pinch, tug, and tweak.");
	}
	//{No boobies}
	else
	{
		output("\n\nWith her tits hanging down like that above you, there’s no way you couldn’t grab hold of them and squeeze. Your hands reach up to cup Penny’s soft bosom, caressing her heaving mammaries, feeling the sweat beading on her skin under the fur. It makes your hands slide all the more easily across the plush orbs. You arrest your slippery gropes and let your digits find her pink, puffed up nipples. They’re pebbly and humanlike in shape in texture, unlike much of the rest of the vixen, and you grab them, tugging Penny’s perky nipples up and down to guide her cunt across your [pc.cockBiggest].");
	}
	//Merge
	output("\n\nThe fox-girl’s kisses become more passionate as you play with her mammaries and nipples. Her tongue is now violently spearing through your [pc.lips], plunging again and again into your mouth with rapacious delight. Simultaneously, Penny’s hips undulate so fast that she’s had to stop shaking her ass. Her pussy is so hot and wet that you swear it’s practically steam-bathing your [pc.cockBiggest], and every time that wet gash slides back down, the angle presses the tiny, tight bud of Penny’s clit against you. She moans into your mouth whorishly, finally abating her eager mouth-fucking long enough for you to wrangle her tongue back inside her maw, pushing it with your own. Wet warmth drips over your [pc.cockBiggest]. The fennec is creaming herself all over your cock right now.");
	
	output("\n\nFinding Penny far less assertive with her faculties softened by pleasure, you grab hold of her hips and begin to vigorously fuck your cock through her spasming slit. The bits of her walls that you can feel are trembling with orgasmic pleasure, and her dripping ladyspunk visibly shines your [pc.cockBiggest]. Your phallus becomes so drenched with it that it shines. Coming near climax yourself, you rub her body faster and faster atop you, letting her mouth fall completely away from yours while you piledrive her insensate form. At long last, you feel your own climax approaching, and you make one last, long thrust from [pc.cockHeadBiggest] to [pc.sheath] through her gates.");
	output("\n\n[pc.Cum] bubbles up out of your dilating cum-slit, launching out in long ropes that spatter between Penny’s body and your own. Her fur slickens, and her body soon feels both slippery and stuck against you. Enjoying your ecstasy, you nip at Penny’s ear, licking along behind the edge of it. Her entire body quakes as soon as you touch that sensitive dish. When your tongue contacts it, her pussy gushes a fresh deposit of girlcum onto your boner, and her legs begin to tremblea top your");
	if(pc.legCount > 1) output("s");
	else output("[pc.legs]");
	output(".");
	if (pc.cockTotal() > 1)
	{
		output(" Your other erection");
		if(pc.cockTotal() > 2) output("s spew");
		else output(" spews");
		output(" a little off to the side, over your hip and onto the mattress.");
	}
	output("\n\nYou hold her there, pumping out your [pc.cum] onto both your bodies, forcing her to feel the warm, wet juices sliding into her fur. Her mouth falls open and her tongue lolls out. An unmistakably happy smile is painted upon her face, even if the spark of intelligence behind her eyes is still missing. All that you can see is animal pleasure, a feeling matched by the pulsing throbs down below.");
	if(pc.cumQ() <= 100) {}
	else if(pc.cumQ() <= 500) output(" [pc.Cum] spills off your sides to soak into the mattress by the time you finish, soaking it with [pc.cumColor].");
	else
	{
		output(" [pc.Cum] spills off your sides, soaks the mattress, and falls in syrupy waterfalls down to puddle on the floor.");
		if(pc.cumQ() >= 2000) 
		{
			output(" That puddle doubles in size, then triples");
			if(pc.cumQ() >= 10000) output(", then the entire floor is filling");
			output(".");
		}
	}
	output("\n\nOnce you’re done cumming and Penny has come back to consciousness, the fox-girl throws herself off of you with an accusing glare. <i>“Careful with the ears, they’re sensitive, ya know?”</i>  she says, scratching herself behind the ear you were playing with. She shivers from her own touches, barely aware of the cum dripping from her front. <i>“Come, lets get a shower to get cleaned up. I’ll even polish THAT personally.”</i>");
	output("\n\nSmiling, you follow after....");
	//Reset lust, pass 50 minutes.
	processTime(50);
	pc.orgasm();
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

//Frottage
function pennyFrottage():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("<i>“Really?”</i>  Penny says in response. She may be surprised, but her [penny.cock] twitches at your suggestion, becoming more engorged than you would’ve thought possible a moment ago. The chesty");
	if(penny.biggestCockVolume() >= 200) output(", well-hung");
	output(" futanari fox wraps her hand around her stiff meat for one long stroke. She bites her lip in nervous anticipation, eyes fixed on your [pc.cockBiggest]");
	if(pc.cockTotal() == 2) output(" rather than your other penis");
	else if(pc.cockTotal() > 2) output(" rather than your other penises");
	output(". A salacious grin gradually spreads across her face, and she admits, <i>“</i>");
	if (flags["TIMES_FROTTAGED_PENNY"] == undefined)
	{
		output("<i>I’ve wanted to do this since I got one of these.</i>");
		flags["TIMES_FROTTAGED_PENNY"] = 1;
	}
	else
	{
		output("<i>I was hoping I’d get to do this with you again. I love watching us cum together, particularly when you’re the one getting painted, </i>");
		if(pc.biggestCockVolume() < 50) output("<i>little</i>");
		else output("<i>my meaty</i>");
		output("<i> mate.”</i>");
	}
	output("\n\nYou reply, <i>“</i>");
	if(pc.isNice()) output("<i>Then get up on here. You’ve gotten me plenty hard already!</i>");
	else if(pc.isMischievous()) output("<i>Then why not get up here and get started? I bet you’ll cum first anyway.</i>");
	else output("<i>Then get your furry ass up here and start rubbing my dick, bitch.</i>");
	output("<i>”</i>");
	output("\n\nThe fox-girl’s ears twitch nervously, and you can tell she’s blushing by the way her bare genitalia darken. This time, she can’t hide behind her fur. She launches herself onto the cot in a huff, causing the frame to rock and creak dangerously in spite of her modest weight. You catch her hips to guide her into place, and Penny seems truly grateful for the assistance. She even leans down to kiss you as you line her up on top of you, pushing her [penny.cock] against your [pc.cockBiggest] such that the two turgid organs compress slightly but pleasurably. Sighing, she groans and reaches down to handle the doubled dongs");
	if(pc.cockTotal() > 1) output(", letting her fingers play across the entirety of your assembled packages before settling on her favorite");
	output(".");
	
	output("\n\n<i>“Oooh, this is quite nice,”</i>  Penny gleefully announces, and she starts to wiggle her hips. You gasp out an agreement when the feelings surging from your loins hit your brain. Twitching encouragingly beneath the fox-girl’s ");
	if(pc.biggestCockVolume() * 1.25 < penny.cockVolume(0)) output("bigger ");
	else if(pc.biggestCockVolume() * .75 > penny.cockVolume(0)) output("smaller ");
	output("phallus, your erection swells with passion. You cannot help but squeeze her pert bottom in response. Her delicate fingers caress the throbbing veins ringing both tools tenderly, and as she shifts to slide herself across you, the sensitive flesh tingles with hot and heavy need.");
	if(penny.balls > 0 && pc.balls > 0) output(" Her balls roll across your own, each sack grinding and rolling against the other.");
	else if(penny.balls > 0) output(" Her balls roll across your " + pc.sheathDescript(pc.biggestCockIndex()) + ", slipping and sliding as they prepare a hot load for you.");
	else if(pc.balls > 0) output(" Your [pc.balls] rub against her pink little pussy, aching to unload into her honeyed hole but knowing their load is meant to be wasted.");
	output("\n\nYour hands knead and caress her perky ass with eager attentiveness, while she grinds atop you, working her [penny.cock]. The phalluses slide against one another, both beginning to drip pre from stimulation. Gathering up the leaking cock-lube, Penny uses her hand to slather it over the pulsating pair of pricks. You grunt at that and look in the eye, begging for more.");
	
	output("\n\nWinking back at you, Penny takes your [pc.cockBiggest] in a two handed grip and eagerly announces, <i>“I can’t take much more of this!”</i>  Lifting the doubled dicks up partway, the fox-girl begins to mount your cock, sliding her pre-greased tool back and forth eagerly. Her own liquid ardor spills out in thick ribbons onto your ");
	if(pc.biggestCockVolume() * 1.25 < penny.cockVolume(0)) output("bigger dick");
	else output("[pc.belly]");
	output(", polishing your skin with her leaky anticipation. [pc.EachCock] is throbbingly, achingly erect, surging with each beat of your hammering heart. Little muscle spasms wrack your crotch, making your genitals dance beneath the busily humping fox, and you start to lift your hips with anticipation. Your [pc.cockBiggest] slides against the vixen’s [penny.cock] faster and faster.");
	
	output("\n\nThe both of you are eagerly humping the other’s cock at this point, possessed by the unflinching need to reach the apex of pleasure that’s just moments away. Giving up all sense of restraint, Penny whines and squeezes her hands down into a pair of tight rings");
	if (pc.totalGirth() + penny.totalGirth() >= 5) 
	{
		output(", or as close as she can come given ");
		if(penny.totalGirth() * .75 > pc.totalGirth()) output("her girth");
		else if(pc.totalGirth() * .75 > penny.totalGirth()) output("your girth");
		else output("your girths");
	}
	output(". Each surging, blissful sausage fucks an artificial fingercunt with a brutal, rutting pace, sliding its expanding tip against the other’s bottom during the backstroke.");
	
	output("\n\nLoud gasps draw your attention away from the frotting cocks, though the way pleasure is rising up in your loins, you’re going to be aware of your building bliss regardless. Penny’s eyes are half closed and droopy at this point, and she’s panting like a dog. Her tongue is lolling so far out of her mouth that her spittle is falling on her [penny.cock], frothing into a foam from the way the pistoning meat-pillars move. You forget the vixen’s face when the saliva soaks its way down your entire circumference, and your abdominal muscles clench. Magma-hot heat erupts from your ");
	if (pc.balls > 0)
	{
		if (pc.balls > 1) output("clenching balls");
		else output("clenching ball");
	}
	else output("middle");
	output(", and the need for release becomes as irresistible as it is enticing.");
	
	output("\n\nA low grunt works its way up the back of your throat, but before it can tear its way out of your [pc.lips], Penny groans startlingly loudly. A flow of warm, girlish juice drips onto ");
	if(pc.balls > 0) output("your [pc.balls]");
	else output("your " + pc.sheathDescript(pc.biggestCockVolume()));
	output(", setting off a mind-blanking pleasure-cascade. Two streams of cum erupt from the doubled-up dicks");
	if(pc.cockTotal() > 1) output(", boosted by the stuff spraying from the rest of your [pc.cocks]");
	output(". Penny’s is alabaster white and gooey as it falls over your [pc.fullChest]. Yours ");
	if(pc.cumType == GLOBAL.CUM) output("matches it nicely");
	else output("is similarly gooey but [pc.cumColor] in coloration");
	output(" when it ");
	if(pc.biggestCockLength() < penny.biggestCockLength() * .5) output("leaks lamely into your belly, unable to launch far due to the overwhelming size of the fennec’s superior shaft");
	else if(pc.biggestCockLength() < penny.biggestCockLength() * 1.5) output("blasts up to mix with the fox-girl’s");
	else if(pc.biggestCockLength() < pc.tallness * .33) output("blasts up against your chin");
	else output("blasts over your shoulder to splatter off the wall");
	output(". The twinned streams launch in matched pulses, their respective cum-slits splaying wide to allow the passage of such tremendous ejaculations. Penny’s urethra bulges against you with each load, compressing your own slightly before it fights back, reversing the pressure with your next jet.");
	
	output("\n\nYour bodies continue to slide against one another throughout, not stopping until the free-flowing spunk has slowed to a dripping trickle. Penny’s cock and yours are both soaked with mixed up spooge, saliva, and pre, all mixed together into a frothing, bubbling mess. Neither of you seems to care; the fox flops down onto you once her pleasure is totally spent, sliding over your spunky [pc.skinFurScales]. You wrap your arms against her and grind your slick form against hers, luxuriating in the pleasure before everyday worries can return to haunt you. Cleanliness can come later...");
	processTime(35);
	pc.orgasm();
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",postPennyFrottage);
}

function postPennyFrottage():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("<b>A little later...</b>");
	output("\n\nPenny’s body looks three times as big after toweling off. She looks like a giant puff-ball thanks to the aggressive toweling off you gave her");
	if(pc.hasHair()) output(", and your [pc.hair] didn’t fare much better");
	output(". Giggling, the bundle of fluff snaps you with her towel before ducking around the corner. You chase after her, towels snapping each other until you’ve dried the rest of the way off and had time to get ready to go. She’s sure to pinch your bottom before flouncing off towards her desk, calling, <i>“I’ll be doing some reports if you need anything! Stay out of trouble, mate!”</i>");
	output("\n\nYou follow after her, glad for her shower facilities.");
	//Reset lust
	//Pass 50 minutes.
	processTime(15);
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

//Rough Over The Desk Fuck (AKA Penny Is The Prey DOHOHOH) - UNWRITTEN
//Bend dat bitch over a desk, make her all nervous, play with her ears till she cums and then rail her like nobodies business.
//Needs dick that fits or strap-on
function pennyOverTheDeskRoughFuck():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("You tell Penny to seal the room; you want to take her right here. She looks curiously in your direction, but does as you say. Typing something into her keyboard, she finishes with a single button press, and the door seals behind her. The busty fox springs out of her chair and turns around to undress, teasingly looking over her shoulder to say, <i>“No peeking!”</i>  Her vest slides down her arms, and you choose that moment to act.");
	output("\n\nCrossing the room in a flash, you grab hold of the garment as it falls to her wrists and twist. The fabric goes taut, turning from clothing to improvised handcuffs. Penny stumbles in your grip, but you hold her in place. “”W-what are you doing?”</i>  she grunts, not really fighting back just yet. <i>“I can’t take you like this!”</i>");
	
	output("\n\nYou grab hold of the hem of her pants, digging your fingers into the back of her panties as well, and yank. Strong-arming her over the edge of her desk at the same time, you marvel at the expanse of tush laid out before you. A peach-colored slit divides the two amber-furred globes into a pair of nice-looking handholds, but that isn’t what you’re here for. You growl, <i>“I’m taking you this time, Penny,”</i>  as you ");
	if (pc.hasCock())
	{
		if(!pc.isNude()) output("free your [pc.cocks] from your gear and ");
		output("handle the thickening tool you plan to use on her");
	}
	else output("affix a strap-on to yourself");
	output(". <i>“And you, my dear, are going to sit there and take it.”</i>");
	
	output("\n\nYou push the fox-girl down the rest of the way against the table, compressing her tits so that they bulge outlandishly. The avalanche of titty flesh sends her pens and papers flying off the side and onto the floor. Squirming against you, Penny starts to twist and turn, but she’s small and has no leverage. The panties around her knees do a good job of preventing her from using any martial arts to counter your dominant position. In a nutshell, she’s helpless - bound, exposed, and presenting her pretty pink pussy for inspection. You bend low over her back, taking your hand away from your ");
	if(!pc.hasCock()) output("strap");
	else output("hard");
	output("-on long enough to grip her neck and immobilise her. She let her guard down, and there’s nothing she can do to stop you from doing whatever you want to her.");
	
	output("\n\nYou lick against the lobe of the pinned vixen’s ear and let her writhe beneath you. Your voice comes out in a hot exhalation, <i>“Shall I continue?”</i>  The end of your question is marked by a lick along the outer edge of her dish-like ears. Shivering, Penny whimpers. It’s a weak, whining sound, like an animal caught in a trap. She speaks as soon as your [pc.tongue] separates from her ears, <i>“Ahhh... yes please, you... you ravenous beast. You caught me.”</i>");
	
	output("\n\nAtta girl. You knew she’d be up for a little role reversal");
	if (flags["PENNY_TIMES_OVER_DESK_FUCKED"] == undefined)
	{
		output(" after the way she came last time");
		flags["PENNY_TIMES_OVER_DESK_FUCKED"] = 1;
	}
	else flags["PENNY_TIMES_OVER_DESK_FUCKED"]++;
	output(". Letting go of her neck, you split two of your fingers into a V and position them to either side of her mohawk, tracing them along the edge of where her ears join with her skull. The sentivity of her aural organs is immediately apparent from the way she begins to thrash anew against your restraining grip. This time it isn’t an attempt at escape, but a simple combination of extreme arousal combined with a surprisingly sensitive erogenous zone.");
	output("\n\nFeeling moisture against your [pc.foot], you glance down in irritation. That irritation turns into irrepressible excitement when you realize that the fennec has transformed from a prim police-girl into a leaky faucet. Her pink nethers have grown flush and wet with arousal. The lips have a visible shine so thick that it looks like painted-on gloss, and a single bead of moisture hangs from them, waiting to fall after its sister. You gingerly insert a finger to test the waters, surprised when it vanishes into her greedy slit in a single swallow. Her pussy is practically pulling you inside of it! Reluctantly, you remove your soaked digit and turn your attention back to the fox’s upper half.");
	
	output("\n\n<i>“You got my finger wet. Here, clean it up,”</i>  you say as you wag your soiled fingertip in front of the fennec’s face.");
	output("\n\nPenny whines, <i>“Fuck meeeeee,”</i>  but she does not do as you asked.");
	output("\n\nYou wipe her feminine juices across her nose, making her sneeze. <i>“Clean it up,”</i>  you command again, <i>“Hurry up if you want to get fucked.”</i>");
	
	output("\n\nTwisting as far as she can, Penny wrenches her body to the side to swallow your finger, not stopping until her lips are kissing the knuckle joint. Her tongue swirls around and around with single-minded attention. Sometimes, it draws deeper into her maw, and you hear her swallowing her own sexual juices. <i>“Lewd little fox, aren’t you?”</i>  you comment as you take your freshly cleaned finger away. There is an audible pop when the tip is pulled free.");
	output("\n\nPenny gasps, <i>“Yes... I’m a lewd little fuck-hungry fox! A dirty dripping fennec whose pussy gushes when she’s tied down. Fuck me, predator! Claim your right!”</i>");
	
	output("\n\nWell, that’s a little dirtier than usually, but you want to key her up a bit more before you fuck her. Holding back is difficult as ");
	if(!pc.hasCock()) output("turned on ");
	else output("hard ");
	output("as you are. Particularly since ");
	if(pc.hasCock()) output("[pc.EachCock] is twitchingly, aching erect and ready to go");
	else output("[pc.oneVagina] is being pressed on quite presently by your faux phallus");
	output(", sapping your will with potent physical need in a way that must mirror what Penny is experiencing. You battle with your baser instincts for a second until self control wins out... for now.");
	
	output("\n\n<i>“Not yet,”</i>  you announce. Curious about how far you can push her with her ears alone, you resume fondling her immense auditory sensors, tracing a finger along the outer edge of one of them. Penny bites her lip to stifle a moan, but you hear it all the same. She can’t hold it all in, and by muffling it, she’s just makes it more clear how completely and totally she’s being aroused by this. When you reach the bottom edge, you take your finger back up alongside her mohawk, watching her squirm.");
	
	output("\n\nThis time, the dripping-wet vixen doesn’t even remember to try to suppress herself. <i>“Fuuuuuuckitsgood!”</i>  Her gash drips, and she actually shifts to press herself against you, rubbing her plump labia against your [pc.leg]. Your hand pulls away from her ears long enough to smack hard upon her upraised bottom. Penny yelps and pulls away, just in time for your digits to return to their previous occupation, caressing and touching every part of her sensitive ears. At first, they flicked this way and that. The fennec was trying to keep them away from you. But now, her ears are leaning back into your touches, and Penny’s thighs are trembling with need.");
	
	output("\n\n<i>“Oh dear,”</i>  you comment, <i>“I think you might actually get off from this, little fox.”</i>");
	
	output("\n\nPenny gasps, <i>“More!”</i>  Her statement is simple, passionate, and followed by another, <i>“Please!”</i>  The way her body is writhing has changed. It’s become less uncontrolled... more focused. You idly play with the very tips of her ears as you figure it out. Her motions are sliding her breasts across the desk, making a mess but likely causing her to receive some stimulation even through her bra. You twist her to the side to lift one of the orbs and see your suspicions confirmed when the outline of a large, prominent nipple becomes visible.");
	
	output("\n\nPushing her back down, even harder than before, you really grind her chest against the desk. At the same time, you spread your fingers wide around her mohawk and begin to stroke madly back and forth across both her ears and the top of her skull, making sure to hit every spot that made her squirm and drip earlier. <i>“Ohhh, g-g-g-g-od!”</i>  Penny cries. Her legs are straining against her pants and panties so hard that you can see the muscles clearly outlined under her fur. The sounds of tearing seams reach your ears, but not before you deliver the coup de grace to hers: a fluttering series of strokes from tip to base.");
	
	output("\n\nPenny’s voice moans its way into a high-pitched scream, covering at least two octaves in the process. Her pants shred, and her legs begin to thrash so hard that you have to twist to avoid being kicked. Penny’s leaky pussy drools so much moisture that the fur on the inside of her thighs is being coated in waves of shining girlcum.");
	if(penny.hasCock()) output(" Her [penny.cock] twitches against the side of the desk, thickening noticeably. A second later, cum launches from it so forcefully that it audibly splatters off the floor, liberally coating the items that fell before, and that was just the first jet. Each successive blast seems more voluminous and decadent than the last. Penny’s prostate is working harder than you’ve ever seen it.");
	output(" Getting shriller by the minute, her blissful screeches climb to the point where you worry that someone will hear. Then, the wind goes out of her sails and she slumps down, limp. Her legs do still twitch, but now they move with lame little spasms. Their owner’s voice gibbers, <i>“Fuckmpleasebeastmasterfuckfuckfuckme....”</i>");
	
	output("\n\nSeeing no reason to not to oblige the lady’s request, you lift your ");
	var x:int = pc.cockThatFits(penny.vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	if(pc.hasCock()) output(pc.cockDescript(x));
	else output("fake cock");
	output(" up to the drooling slit and press inside. Her tunnel is so slick that you slide in without a second of hesitation");
	if(pc.cockVolume(x) > penny.vaginalCapacity()) output(" in spite of your size");
	output(". The walls are still trembling with the aftershocks of Penny’s explosive orgasm, and at your touch, they ripple and squeeze delightfully around your ");
	if(!pc.hasCock()) output("faux ");
	output("girth.");
	if(pc.balls > 0) output(" Her juices run unchecked over your [pc.sack], painting it in the same clear moisture that’s now threatening to overtake the fennec-girl’s knees.");
	else
	{
		output(" Her juices run unchecked past your ");
		if(!pc.hasCock()) output("harness");
		else output(pc.sheathDescript(x));
		output(" and onto your [pc.legs], coating you in the same clear moisture that’s threatening to overtake the fennec-girl’s knees.");
	}
	output(" You’ve never seen her this wet");
	if (flags["PENNY_TIMES_OVER_DESK_FUCKED"] > 1) output(", at least not since the last time you bent her over like this");
	output(".");
	
	output("\n\nPenny starts moaning again, and in a surprising show of coherence, she blubbers, <i>“Ohhhh, fuck me, [pc.name]! Fuck me raw! Use my juicy, dripping prey-cunt as your personal cock-sheath!”</i>  She whimpers at that last exclamation and lets her legs wrap around you, exerting gentle pressure whenever you slide too far out. She wants you inside her.... No, she wants you deep inside her, buried to the hilt and spewing a hot, thick load directly into her orgasmically contracting twat.");
	if(!pc.hasCock()) output(" It’s a shame the poor, blissed fox is going to have to settle for your toy.");
	
	output("\n\nYou give her exactly what she wants. Your ");
	if(pc.hasCock()) output(pc.cockDescript(x));
	else output("toy");
	output(" plows her pussy wide open as you ram it in to the hilt, not pausing at all before it yanks back out, ready to start all over again.. The desk creaks with each ass-slapping impact");
	if (pc.hasCock())
	{
		if(penny.balls > 0 && pc.balls > 0) output(", and you feel a terrible pressure rising in your [pc.balls] each time they clap against the fennec’s own");
		else if(pc.balls > 0) output(", and you feel a terrible pressure rising in your [pc.balls] each time you clap against the fennec");
	}
	else if (pc.hasVagina()) output(", and you feel a terrible need rising in [pc.eachVagina] each time you clap against the fennec");
	output(". After so much foreplay, you are primed and ready to go. You can actually feel ");
	if(!pc.hasCock()) output("your girlish lust leaking out through the toy");
	else output("the pre-cum pouring out of your urethra");
	output(" and into the swampy snatch. There, it mixes into a lewd, sexual slush. You let go of her arms, finally, grab hold of her hips with both hands and bury your");
	if(!pc.hasCock()) output(" toy");
	else output("self");
	output(" inside with one last, bone-jarring impact, leaning over the dominated girl to bite her ear as you feel your breeding fluids flow.");
	
	//Girl
	if(!pc.hasCock())
	{
		output("\n\nThe submissive fox’s sordid snatch devours the [pc.girlCum] that leaks out through your fake erection. Each ");
		if(pc.wetness() <= 2) output("drop");
		else if(!pc.isSquirter()) output("flow");
		else output("squirt");
		output(" disappears deep into her furthest recesses, nestled firmly inside. Only after [pc.eachVagina] stops fluttering with passion do you pull free to admire the mixed [pc.girlCumColor] creampie. It’s small, all things considered, but Penny’s cunt seems to have a powerful thirst.");
	}
	//Small cum
	else if (pc.cumQ() <= 100)
	{
		output("\n\nThe submissive fox’s sordid snatch devours your [pc.cum] with aplomb. Each jet disappears deep inside her furthest recesses, nestled firmly inside. Only after your [pc.cockBiggest] is empty and softening do you pull free to admire the [pc.cumColor] creampie. It’s small, all things considered, but Penny’s cunt seemed to have a powerful thirst.");
	}
	//Med cum
	else if (pc.cumQ() <= 1000)
	{
		output("\n\nThe submissive fox’s sordid snatch devours your [pc.cum] with a seemingly insatiable thirst. Yet even with such an appetite, your bountify virility quickly gains the upper hand. [pc.cumColor] trickles become visible around your [pc.cock] as you fill the fox, and after so much teasing, this orgasm seems particularly long and potent. Penny’s pussy is thoroughly glazed with [pc.cum] by the time you start to soften and pull out. Better yet, there’s enough fuck-slime that a significant stream leaks out in your wake. It gets all over the items from her desk.");
	}
	//Large cum with XLarge and XXlarge options
	else
	{
		output("\n\nThe submissive fox’s sordid snatch devours your [pc.cum] with a seemingly insatiable thirst. It proves inadequate when compared to your unholy virility. Midway through the second, long jet of [pc.cum], you feel her passage pressurize. The third jet causes spurts of fuck-slime to backwash out onto the floor, where it falls across Penny’s scattered possessions. You pump inside her until her belly rounds slightly under the lusty deluge, and then you inject some more.");
		if (pc.cumQ() >= 5000)
		{
			output(" By the time you’ve finally started to soften inside her, she’s leaking [pc.cumColor] joy down the inside of her legs and sporting a belly that would make any who saw her assume pregnancy. Pulling out rewards you with the sight of a river of escaping [pc.cum] and the sight of a fox helplessly cumming a second time from the sensation.");
		}
		else
		{
			output(" Bigger and bigger, you fill her until she cannot accept a single drop more. At that point, each sloppy squirt is matched ounce for ounce by a vaginal [pc.cum] ejaculation that would make a horse jealous. Your [pc.cumColor] juices puddle high on the floor by the time you finally start to soften inside her. She’s leaking like a sieve, and when you pull out, so much escapes that she cums a second time on the spot, cradling her distended middle. Apparently the twisted-up vest wasn’t that hard to wriggle free from.");
		}
	}
	
	output("\n\nYou spend the next minute cooling off and helping Penny out of her ruined clothes. At first, she lets you do it with a dopey smile and eyes that look half-vacant, but as time passes, more of her fucked-out personality seems to return.");
	output("\n\n<i>“Ohhhh, god damn that was hot!”</i>  she giggles. <i>“You know, you’re a great mate, right? The absolute best.”</i>  After that uninhibited declaration, she staggers up onto her feet, slipping and sliding around the accumulated juices. <i>“Fuck! [pc.name], help me out here. We’ve got to get a mop and bucket!”</i>");
	
	output("\n\nYou watch the bow-legged fox’s shapely rump as she wobbles and let her words sink in. Oh right! ");
	if(pc.isNice()) output("You happily help her to a supply closed where the two of you can gear up for a bit a cleaning. Two bodies make it go twice as fast!");
	else if(pc.isMischievous()) output("You playfully escort her to a supply closet, pretending to slip a few times for a laugh. After the first two times, Penny gets tired of the joke and socks you on the shoulder, but together you clean the place up and have a surprising amount of fun doing it.");
	else output("You begrudgingly help her to the closet and to clean up. Toying with her like that was a lot of fun, and you aren’t about to throw away the opportunity to repeat it over a little bit of cleaning.");
	//Reset lust.
	//Pass two hours.
	processTime(110+rand(20));
	pc.orgasm();
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

//Jack Penny off with an Onahole
function jackinPennyOffWithAnOnahole():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	//First Time!
	if (flags["TIMES_JACKED_PENNY_OFF_WITH_ONAHOLE"] == undefined)
	{
		output("<i>“Got a sex-toy for your new toy?”</i>  you ask.");
		output("\n\nStammering, Penny goes wide eyed and nervous. After a moment, her confidence returns, and she admits, <i>“I might. Why? I thought we were going to fuck.”</i>  Her ears twist the side apprehensively.");
		output("\n\nYou lean over her desk, putting your hands down on either side the fox’s, and you gamely look straight down at her bulging erection. <i>“I want to play with that.”</i>  One handed, you give the [penny.cock] a slow stroke. It twitches happily. <i>“I want to watch this bounce while I jerk you off with a fake pussy.”</i>  You give it a firm squeeze, and it pulses in your hand. <i>“A horny girl like you has one, right?”</i>  The fennec groans and slumps back in her chair a bit.");
		output("\n\n<i>“Ahhh, I do.... Let me... mmmm... let me get the doors closed first, and you can use it on me, okay?”</i>");
		output("\n\nSomewhat reluctantly, you release the prick-vixen’s swollen boner. <i>“Be my guest.”</i>");
		output("\n\nPenny doesn’t waste a second. She busily types on her computer to finish what she’s doing. Every now and again, she flicks her eyes up to you and gives an eager smile before resuming her feverish work upon the keys. At last, the door locks click into place, and Penny’s computer powers down. She spins around in her chair, throws herself up onto her feet, and hops over to an equipment locker, cock slapping awkwardly against her belly as she goes. The compartment rattles noisily as it opens.");
		output("\n\nRotating around, the foxy policewoman presents her faux pussy and a nanofiber condom. <i>“I got it off the extranet, even before I got a cock. There’s this company called Naughty Wyvern that I ordered it from. They make all kinds of specialty toys, but I went with a plain ol’ onahole.”</i>  She hands it to you. <i>“What a weird name for a sex toy, huh? It’s interior is self-lubricating, so long as I keep it maintained.”</i>  Putting the condom on, she explains, <i>“We wouldn’t want to make a mess out of my office, would we? Besides, these suckers are so thin that it feels like you're wearing nothing at all.”</i>");
		if(silly) output(" Stupid sexy flanders.");
		flags["TIMES_JACKED_PENNY_OFF_WITH_ONAHOLE"] = 1;
	}
	//Repeat
	else
	{
		flags["TIMES_JACKED_PENNY_OFF_WITH_ONAHOLE"]++;
		output("<i>“Ready for another cock milking?”</i>  you ask.");
		output("\n\nPenny is up and out of her chair about as soon as you ask, slapping a button on her way out that seals the doors and powers off her workstation. Her locker is opened and closed in a flash. Flopping lamely about in her hand, the fake pussy jiggles about with the promise of artificial pleasure. <i>“You know I’m always ready to drain off some lust,”</i>  the ");
		if(silly) output("hung ");
		output("vixen quips. She tosses the onahole at you with an eager grin. <i>“Now to get this bad boy on. No muss, no fuss!”</i>  The sound of tearing plastic and something sheer being stretched over a masculine attribute reaches your ears.");
	}
	//Merge
	output("\n\nYou examine the onahole for a moment. It’s big, pink, and transparent. The inside is filled with concentric rings of varying sizes that look quite pleasing to your eye. Sticking a finger inside it, you find the lubrication instantly soaks your digit in pleasing slickness. When you remove it, the moisture that clings to your [pc.skinFurScales] silently evaporates. The whole process takes perhaps twenty or thirty seconds, but when it’s complete its as if nothing at all had happened. Penny is going to enjoy this.");
	output("\n\nStepping over to her chair, ");
	if(pc.legCount == 2) output("you seat yourself on it, gesturing for Penny to rest on your lap");
	else output("you shove it aside and lean against the desk, gesturing for Penny to come over and lean herself back against you");
	output(". She gleefully snugs her tush right up against your ");
	if(pc.armor.shortName == "" && pc.lowerUndergarment.shortName == "") output("exposed");
	else output("girded");
	output(" loins, wiggling back and forth excitedly. <i>“Like this?”</i>");
	
	output("\n\nYes, just like that. You reach around the fennec, holding her tight, feeling the press of the warm fur on her bottom against you. One hand quickly finds her [penny.cock] while the other explores her boobs through her wrappings. The small bumps of her nipples are concealed from your questing fingers just yet, but a simple kneading motion swiftly remedies that. Popping up against the layers of fabric, Penny’s perky buds strain to be seen, and more importantly, felt. You tweak one while getting the pink toy lined up with her [penny.cockHead]. The vixen’s panting breaths along with the way she squirms whenever you squeeze her make proper alignment difficult, but you manage.");
	
	output("\n\n<i>“Mmmm,”</i>  Penny moans, <i>“Push it down!”</i>  She grabs hold of your ");
	if(pc.isTaur() || pc.isDrider()) output("fore-");
	output("[pc.legs] for support while the tip of her condom is lubricated by the faux fuckhole. She throbs powerfully under your affections, but you hold back for now, getting in a good, long feel up top before you progress. This leaves the fox with nothing to do but squirm against you. Her body is getting warmer and warmer as she gets turned on, and the steaming heat emanating from her female sex seems a few degrees hotter than the rest of her. There’s enough moisture leaking from her slit that you can feel a touch of dampness condensing on your own [pc.skin].");
	
	output("\n\nThe horny little futa fox has waited long enough, you decide, and you gently begin to push the device down her ");
	if(penny.biggestCockLength() < 10) output("average ");
	else if(penny.biggestCockLength() < 17) output("meaty");
	else output("over-sized");
	output(" length. Inch after inch of cock slides down the squishy toy’s passage. Lubricated as it is, the onahole must feel wonderfully slick on Penny’s throbbing phallus. Indeed, she’s quietly whining, almost inaudibly, while the toy smoothly glides down to surround more and more of her. ");
	if(penny.biggestCockLength() < 10) output("You push it down until it’s bunching up the sheath at her base. Inside, you can see the reservoir at the tip swell slightly with pre-seed.");
	else if(penny.biggestCockLength() < 17) output("You push it down until the [penny.cockHead] is protruding garishly from the top and slowly filling the reservoir with pre-seed.");
	else output("You push it down until the [penny.cockHead] and a half-dozen inches of dick have thrust out the opposite end to lewdly bob in the air. The reservoir at the tip is clearly exposed and slowly filling up with pre-seed before your very eyes.");
	output(" She’s clearly enjoying the attention.");
	
	output("\n\nYou nip at one of Penny’s ears to get her attention. Instead, she winds up closing her eyes and lifting her hips hard against the onahole’s entrance, mashing herself as firmly into it as she can. Her tongue spills out of her mouth, and her eyelashes flutter. Bestial groans filter out of her throat, intermingled with feminine pants of need. With her so lost to passion already, you settle for enjoying the weight of her teats in your hand, openly pinching and tugging on her nipples through the wraps and bra between you. The fabric soon grows bothersome, and you wriggle your hand underneath her coverings to get a better grip on things. The pebbly texture of the nipple you locate is exquisite, and you delight in playing with it, tugging and pinching to watch the way it changes Penny’s lascivious mask.");
	
	output("\n\nThe vixen is all too happy to let you have your way with her. Her body is responding with the eagerness of an aphrodisiac-dosed animal in heat. You reward her by giving her what she wants: long slow strokes along her [penny.cock]. The toy’s slippery fluids cause it to noisily slurp and squelch along the shaft as it goes. Through the transparent surface, you can see the folds compressing around Penny’s penis, clinging to each ridge and vein briefly before slipping past the obstruction. Her [penny.cock] is rock-hard. You can feel it even through the squishy-soft onahole.");
	
	output("\n\n<i>“Faster,”</i>  the fox-girl pants. <i>“More!”</i>");
	
	output("\n\nYou give her exactly what she wants. A quick pump here, a fast thrust there, and before you know it, you’re sliding the pleasure tool along her shaft so quickly that it seems a blur.");
	
	output("\n\nPenny blurts, <i>“Fuuuuck! I love my cock! I love you, [pc.name]! I love cumming! Make my cock cum, please, mate!”</i>");
	if(penny.balls > 0) output(" Her balls are quaking just below your busy hand. It won’t be long now.");
	
	output("\n\nTweaking her nipple, you nuzzle at the edge of her ear and whisper, <i>“Cum whenever you want, Penny. I want to see you fill that condom for me. I want my horny, futanari fox girl-friend to jizz herself silly from a cheap sex-toy!”</i>");
	
	output("\n\n<i>“Oh god,”</i>  she whimpers in reply.");
	
	output("\n\nYou go a little faster while your hand locates the other unmolested nipple. <i>“That’s right, I want to watch you make me the fattest, sloppiest jizz balloon possible,”</i>  you say.");
	
	output("\n\nThe prick vixen’s body tenses");
	if(penny.balls > 0) output(", balls quaking");
	output(", and her [penny.cock] begins to violently spasm in your insulated grip. Her urethra expands to its full size a moment before the condom-sheathed cumslit dilates with the first batch of fox-cum. The filthy flow bursts into the reservoir in an explosion of white, stretching it almost four whole inches out from Penny’s [penny.cock] before it snaps back into a bubble of obscene white");
	if(penny.biggestCockLength() < 10) output(", barely cresting past the tip of the onahole");
	output(". You keep going, twisting back and forth around the foxy girl’s load-spewing meat to wring out every drop. Growing larger by the second, the bubble at the tip expands from the size of a dime to the size of a quarter. It doesn’t stop there, though the bigger that bubble gets, the slower it seems to fill. It soon passes the size of a plum. The weight of the sexual fruit causes it to dangle down, weighing heavily upon the fox-girl’s cock. There, it fills to the size of an apple.");
	
	output("\n\nSeemingly spent, Penny sags back against you with a smile. Her tongue is still hanging out of her mouth to drool all over her tits, of course, but she’s moved beyond the body-seizing orgasm that claimed her.");
	
	output("\n\n<i>“That was just what I needed, mate,”</i>  Penny confesses.");
	if(flags["TIMES_JACKED_PENNY_OFF_WITH_ONAHOLE"] > 1) output(" <i>“You aren’t going to do that again, like the last time, are you?”</i>");
	
	output("\n\nYou smile and respond, <i>“</i>");
	if(pc.isMischievous() || pc.isNice()) output("<i>You know I am. How else will I see how big you can make it?</i>");
	else output("<i>We aren’t done yet. You’re going to go again. After all, how else will we see how big a balloon you can make?</i>");
	output("<i>”</i>");
	
	output("\n\nPenny’s tongue is back up in her mouth in a moment, and she growls, <i>“It’s too soon!”</i>");
	
	output("\n\nYou answer by resuming stroking her, this time at a leisurely pace in order to rest your arm. Throwing back her head, the fox-girl redoubles her grip on your [pc.legs] and futilely kicks for a second. Her oversensitive shaft is clearly not quite ready to feel the bliss of a tight, wet fuck-tunnel like this one. She gradually relaxes as her body adjusts to the sensations. The cock inside your grip is softer than it was before, partially turgid after spewing so hefty a load. You keep at it, pumping, twisting, and sometimes squeezing through the soft toy to give Penny the best possible experience.");
	
	output("\n\nSlowly, life comes back to her partly sagging boner. The first sign is a twitch that you can feel even through the onahole. The second is the way Penny’s eyelashes lower again. The third and final sign is a gradual increases in the firmness between your fingers. Encouraged by this, you stroke her faster, the groping of her breasts forgotten momentarily as you enjoy the sight of your foxy lover’s thickening fuckstick. When her tongue rolls back out and she begins to pant and gasp anew, you know you’re going to be able to pull this off.");
	
	output("\n\nThroughout this entire time, Penny’s captured load has been hanging there, bobbing in the science-toughened material’s encapsulating transparency. <i>“Naughty fox,”</i>  you comment, <i>“Buying such perverted toys and setting herself up to be milked by lusty offworlders.”</i>  You squeeze her through the onahole. <i>“You probably bought this just so something like this could happen, didn’t you?”</i>");
	
	if(flags["TIMES_JACKED_PENNY_OFF_WITH_ONAHOLE"] == 1) output("\n\nPenny surprises you by meekly nodding and throbbing all at once.");
	else output("\n\nPenny nods and throbs in your hand, just like last time. <i>“You know I did...”</i>");
	
	output("\n\nYou begin to move slightly faster and far more firmly, smashing the onahole down against the fox-girl’s sheath with greater vigor than before. <i>“Are you gonna give me another big load?”</i>");
	
	output("\n\nThe vixen nods.");
	
	output("\n\nYou keep the stroking motions going as you tickle at Penny’s ears with your lips. <i>“I bet I could make you do this all day, couldn’t I?”</i>  Extracting your hand from under her bra, you reach down to ");
	if(penny.balls > 0) output("cup and squeeze her balls");
	else output("cup her mound before slipping a finger inside");
	output(". <i>“I could have you sitting here squirming for me in this chair until your jizz-balloon is as big as you, couldn’t I?”</i>");
	output("\n\nPenny blurts, <i>“Yes! Milk my cock whenever you want! I’m so horny all the time ever since I got it... I-ahhh... I’m always thinking of naughty things I could do with it to you. You’ve made me such a horny herm fuckslut that I can barely do my job and I love it!”</i>");
	
	output("\n\nHer hips twitch violently against you. She’s close! You squeeze your palm a bit to tighten your grip. The extra stimulation should push her the rest of the way to orgasm, and if that doesn’t speeding up will. Faster and faster, you give Penny’s [penny.cock] the stroking of a lifetime. You’re jacking her off with some toy she got off the internet, and she’s just letting you! The horny vixen loves it, and she says as much when she finally climaxes.");
	
	output("\n\n<i>“C-cumming for you, mate!”</i>  Penny babbles, <i>“I’m giving you so much dickmilk, [pc.name]! I’m cumming it all out for you!”</i>  True to her words, the balloon on the tip is swelling faster than before. It’s rounding out deliciously, now as big around as an orange. Penny’s hips continue to lurch, firing huge ropes of spunk. Each time they distend the opposite side of the bubble with the force of their ejaculation before settling back down into a lusty sphere. The vixen’s liquid lust pours out until the condom reaches the size of a grapefruit. It wobbles there a few times and stops.");
	
	output("\n\nPenny goes limp in your arms, her eyes drifting almost entirely closed as she lets out a satisfied sigh. Her voice pipes up after to breathily ask, <i>“Did I cum enough?”</i>");
	
	output("\n\nYou yank the toy off of her, squeezing the bloated, spermy bubble through the well-used passage before you can fully extricate it from the hermaphrodite vixen. She shudders at the friction but otherwise holds still until you can heft both her packages. You carefully weigh the balloon in your hand while you decide what to do with it. You could tie it off to throw away. Then again, if you bit it, you could get a huge facial to wear like some kind of slut. Or you could always make Penny drink her milk.");
	
	processTime(30);
	penny.orgasm();
	//+10 lust
	pc.lust(10);
	this.userInterface.clearMenu();
	
	
	//[Throw It Away] [Bite It] [Feed2Her]
	this.userInterface.addButton(0,"Throw Away",throwPennysCumAway);
	this.userInterface.addButton(1,"Bite It",bitePennysCondom);
	this.userInterface.addButton(2,"Feed2Her",feedPennysCondomToHer);
}

//Throw It Away
function throwPennysCumAway():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("Carefully tugging the filled balloon off the spent fox’s deflating member, you tie it off and toss it in the nearest trash receptacle. You ease Penny into her chair and push her back up to her desk with her cock still hanging out");
	if(pc.biggestCockLength() >= 17) output(", making sure that the mammoth shaft is up on top where it belongs");
	output(". She shudders but allows you to pose her as you will, not even struggling when you blatantly wrap her hand around her cock and fetch her another condom from her locker, just in case she wants to practice while you’re out.");
	output("\n\nPenny’s dick twitches at that, and she groans, <i>“Thanks for that [pc.name], but you can’t really milk me all day! I need to get some work done, you know.”</i>  You nod and tell her that you believe her, even if her horny cock doesn’t. She twitches again, but resolutely returns to her work.");
	//Pass 35 minutes.
	processTime(5);
	penny.lust(70);
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}
//Bite It
function bitePennysCondom():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("Easing out from around the fox, you set her down in her chair so that her ass is just barely on the edge of her seat. This leaves her spent cock to hang out over the edge with its juicy surprise hanging there, just waiting to be picked. You kneel down before the alabaster fruit almost worshipfully and open wide, letting some of the liquid weight sag into your mouth. You’ve positioned it so that it’s resting flat on your [pc.face]. Whatever they make these condoms out of is slippery and super thin. You’re sure that despite its surprising strength, a simple bite would pop the balloon and give you a huge facial.");
	
	output("\n\nClosing your jaw slightly, you feel the teeth catch on the condom. There’s a moment of delicious, almost exquisite tension while you slowly increase the pressure, unsure when or if this ball of saved-up fox-cum is going explode on your face. Then, the moment you’ve waited for arrives, punctuated by a boom loud enough to make you jump. What feels like gallons of Penny’s fuck-juice fills your mouth and throat. You swallow it compulsively as your face is basted with alabaster spunk. Thick rivulets of it cling to your [pc.hair] and [pc.face], dangling from your chin in ropes of salty spooge. Semen drips down onto your [pc.chest], unnoticed as you gulp the animal-girl’s cream down.");
	
	output("\n\nThe knowledge that you’re completely painted with Penny’s warm lust brings a pleasant fire to your nethers and a smile to your face. The fox-girl looks down at you as you blink strands of the stuff out of your eyes and lick some of the accumulated mess from your lips. She’s practically aglow with delight, but she does stop you to say, <i>“Hang on, you missed a spot.”</i>  One handed, she lazily drags her drooling [penny.cockHead] up your cheek, smearing you with her sweat- and cum-soaked shaft. <i>“Got it!”</i>  she declares. <i>“It’s a good look for you!”</i>");
	
	output("\n\nYou give her a grin and thank her for the mask, teasing her that you’ll show everyone where you got it. You even go so far as to encourage her to practice her condom filling for next time. Maybe she’ll give you a proper bath if she trains her dick hard enough. Penny goes wide eyed at that, but she promises, <i>“Oh I’ll try!”</i>  while removing the other half of her broken condom from her member.");
	
	output("\n\nShe’s cleaning up the wet spot on the floor when you prepare to leave, but you see another condom has been laid out on her desk.");
	//Pass 35 minutes.
	processTime(5);
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}
//FeedIt2Her
function feedPennysCondomToHer():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	output("Easing the sagging fox into her chair as you stretch, you admire the way she looks right now: sexually spent at your hands and still delectable. You have no doubt that she’d be up for another round if you phrased it right, but as you eye the bobbing present that hangs from the end of her [penny.cock], you know exactly what you want to do.");
	output("\n\nYou cup the weighted sphere in the palm of one hand while you gently work the condom free of the prick-vixen’s half-deflated tool. It takes a little work to slide the last of the superthin material free, but you manage to do it without spilling a drop. Penny doesn’t react at all aside from watching you with a lazy smile.");
	output("\n\n<i>“Open up,”</i>  you command with a grin of your own. <i>“I got you a present.”</i>");
	
	output("\n\nThe fennec obeys without a second thought, too tired and conditioned by pleasure to care what you do to her at this point. Her sharp teeth glint in the light as you feed one end of the narrow tube between them. Then, you put a curled finger under her chin and tip her head back as you lift her sphere of condensed love. Salty girl-jizz runs into the fox’s mouth in a rush as gravity asserts itself, bulging her cheeks and forcing her throat to work. Her eyes open wide, looking accusingly at you, but she doesn’t stop. If anything she chugs harder, gulping her spunk down like a true pro. For nearly thirty seconds straight, she drinks her cum.");
	
	output("\n\nWhen the condom is empty, you pull it out and look at Penny, seeing the trails of white on her lips and the way her taut middle has a little bit more paunch to it. She lazily belches before patting her middle. <i>“I guess that’s one way to clean up my mess.”</i>  She glances around a little nervously. <i>“I... could get used to that taste, honestly.”</i>");
	
	output("\n\nShe goes on to thank you for the fun but admits she needs to get to work. <i>“Just give me a yell if you need anything. Knowing this thing, I’ll be good to go in a minute.”</i>");
	//Pass 35 minutes.
	processTime(5);
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

function gardeFordWritesPennySmex():void {
	clearOutput();
	this.userInterface.showBust("PENNY");
	author("Gardeford");
	output("Your attention keeps drifting back to the large ears on the fox girl’s head. You stroll around Penny’s desk, trying to look as nonchalant as possible. A grin raises the ends of your mouth as you see the large furry fox ears twitch and move at small sounds. Soon you are positioned directly behind her chair, ready to strike at a moment’s notice. Before she can turn to look you pounce on her from behind.");
	output("\n\nThe fur on her head feels as soft as silk as your hands caress the base of her ears. Penny begins to stand at first but falls forward onto her desk. Her body tenses at your rubbing, barely managing to hit the button to lock the door. You move a hand down her back, pressing lightly on her vest but making no attempt to remove it. Penny hums lightly and shivers at the attention you’re giving her. Her tail thrashes to-and-fro, batting against your [pc.legs] as it goes.");
	output("\n\nYou trace a finger across her pinna, eliciting a sigh of pleasure from the foxy girl. Your other hand moves along the inner line of her panties before pulling them -and her pants along with them- down to her feet. You lean in close and give the unattended ear a quick kiss, finding it warm against your lips. Heat had rushed to her face, making her feverish with need. ");
	if(pc.biggestTitSize() >= 3) output("Your [pc.chest] presses into the back of her vest. ");
	output("You blow on the sensitive lobe and it flops down for a second to escape. The finger at her pelvis rubs her rapidly wettening slit. It feels as if your digit will be sucked into her depths, but first you move it up all the way to the base of her fluffy tail. When you give the area around her tail a playful tickle it sends her over the edge.");
	
	output("\n\nPenny’s knuckles turn white as they grip the desk while she cums from your playing. Feminine juices run down her legs, and she lets out a long moan as the tension leaves her body. You move your head down to her nethers, licking your lips as you appraise the fur-less snatch. One of your hands continues to massage her ears, alternating between the two and brushing her fuzzy mohawk as it transitions. The fox girl’s tail wags weakly but somehow manages to stay aloft.");
	
	// height < 5 feet
	if (pc.tallness < 60)
	{
		output("\n\nYou plant a sloppy kiss on the fennec’s puffy mound, rubbing your tongue against her tiny clit. Penny’s legs give out for a moment, and she grips the desk before sliding off. Her knees lock her in a half-standing position as you continue to assault her pussy with licks and kisses. The slippery combo of her juices and your saliva trails down her knees, dripping down to the floor and pooling on the ground.");
		output("\n\nPenny’s wagging tail bats against your head whenever it comes by, and her fur feels wonderfully soft against your [pc.skin]. Your [pc.tongue] pushes aside the fox-girl’s pussy lips and slides into her depths. Penny lets out a long moan as your tongue explores her moist cleft. “Ooohhh, [pc.name], pull me down and devour me like the beast you are!” Penny shouts with a growl of lust. You happily oblige, and the busty fennec’s knees buckle as your licking intensifies. One of your hands continues to stroke the feisty fox girl’s sonar dishes, rubbing with the fur to make sure it feels the best. Your other hand helps to steady her legs.");
		output("\n\nThe foxy police-woman’s moans escalate as your tongue stretches as far as it can inside her love tunnel. ");
		if(!pc.hasTongueFlag(GLOBAL.LONG)) output(" You slather her walls with your saliva, and it mixes with her juices as the combined fluids run down her legs like a softly flowing stream.");
		else output(" Your tongue snakes all the way to her womb and swirls around her cervix in short circles. She gives out a little squeak with the completion of each rotation. Her juices flow into your mouth and down her legs to drip into the growing pool at your feet.");
		output(" Penny’s entire body gives a great shiver as you explore her depths, and you greedily lap at the escaping ");
		if(!pc.hasTongueFlag(GLOBAL.LONG)) output("juices");
		else output("fluid");
		output(".");
		
		output("\n\nSuddenly the fennec girl’s moans escalate to screams of pleasure. Her lower legs nearly give out as they slip on the massive puddle of juices. Her hands splay out and her tail stands on end as she cums with all her might. You pull your tongue out of her pussy and suck on her tiny clit to push her even further into a whirlpool of pleasure.");
		if(penny.hasCock()) output(" Penny’s unused [penny.cock] blows its load, spattering all over the fox girl’s buckled knees. You wrap one hand around the swelling knot and give it light squeezes to simulate pulling it out. A short burst of jizz escapes the [penny.cock] with every tug accompanied by a yip of pleasure from its owner.");
	}
	//height > 5 feet
	else
	{
		output("\n\nYou position one arm under Penny’s leg and lift her pelvis up to your face. Her upper body is pushed further onto her desk, knocking papers onto the floor. You give her lust-engorged pussy a big lick, starting at her tiny clit and travelling all the way up to the base of her tail. The fox girl’s legs dangle in the air, her feet stretching out as far as they can in her spasms of pleasure. The foxy police-woman struggles to maintain a grip to stop herself from sliding over the edge of the desk. A combination of her juices and your saliva trickles down her belly all the way to the cleft of her breasts.");
		output("\n\nThe fennec’s tail bats against your face with every pass, the soft fur feeling wonderful against your [pc.skinFurScales]. You move your tongue back down to her vagina and circle it around the edge. When you reach her hole you slide in and lick around her inner walls. “Ahh, f-fuck, eat me like the predator you are, Steele,” Penny slurs through her moans. You happily oblige, moving her legs over your shoulders for easier holding. Her thighs tighten around your head as your licks intensify, and you return both hands to Penny’s sonar dishes.");
		output("\n\nThe fiesty fox-girl’s moans escalate as you stretch your tongue as far as it can go. ");
		//if short tongue: 
		if(!pc.hasTongueFlag(GLOBAL.LONG)) output("You slather her walls with your saliva, mixing it with her juices and letting it run into your mouth and down her body like a mountain stream.");
		else output("Your tongue reaches all the way to her womb and runs little circles around her cervix. Her thighs tense against your head as each rotation is completed. The juices flow into your mouth and down her own body to pool on the table.");
		output(" The full length of Penny’s body shivers as you explore her depths, and you greedily lap at the fluid that escapes.");
		output("\n\nSuddenly the fox-girl’s legs tense and her moans grow into screams of ecstasy. You remove one hand from her head and drag it seductively along her trembling body till it reaches her nethers. When it arrives you slowly rub its thumb in circles around her budding clit, and the fur on Penny’s body stands on end as she explodes in orgasm.");
		if(penny.hasCock()) output(" The fox-girl’s unused [penny.cock] blows its load and spatters on the floor. You slide your hand around her swelling knot and give it light squeezes to simulate pulling out. With each tug Penny’s voice raises to a yip of pleasure before lowering back to soft moans.");
	}
	//size variation end
	output("\n\nThe fox-girl lies panting against the table, looking thoroughly exhausted from the ordeal. Little does she know that the pleasure is only half over; ");
	if(pc.hasCock() || pc.hasVagina()) output("you have yet to be pleasured yourself.");
	else output("you have a lot more pleasure to give her.");
	output(" You give both of Penny’s furry buttcheeks a big squeeze and begin to move up her body, planting kisses along her athletic form as you go. As you pass her chest you kiss the side of her DD-cup boobs before moving up to her ears.");
	
	output("\n\n“Huh? It’s not over? I don’t know how active I’ll be-eeee” Penny says weakly before you assault her ears with kisses. Starting at the base you kiss all the way up the large lobes. Her ears try to duck away as your hot breath assails them, but you use your lips to mock bite them. The second ear twitches with anticipation as you finish with the first, and you have no plans to leave it wanting. This time you start with a false bite to the tip, then brush your lips softly against the back till you kiss the base. As you work on her ears, you ");
	if(!pc.isNude()) output("remove your [pc.gear] and ");
	if(pc.hasCock() && pc.hasVagina()) output("slip your fingers around your [pc.cocks] to play with your [pc.vaginas].");
	else if(pc.hasCock()) output("rub your stiff [pc.cocks].");
	else if(pc.hasVagina()) output("rub your fingers into your soaked [pc.vaginas].");
	else output("prepare your fingers to penetrate her.");
	
	output("\n\nPenny moans weakly, her eyes rolling back in her head as she’s overwhelmed by pleasure. ");
	if(pc.hasCock()) output(" You line up your [pc.cock] and slide it between the fox-girl’s thighs. The top of your throbbing member parts the lips of her pussy and rubs against her vulva and clit as you slowly rock your hips back and forth. The busty fennec’s thighs tighten and form a ring of pleasure around your [pc.cock]. With every repetition of your thrusting it becomes easier to increase the pace.");
	//female:
	else if(pc.hasVagina()) output(" You slide a leg between the fox-girl’s own and begin grinding [pc.oneVagina] against her upper thigh. Your own leg grinds against her smooth cleft as you thrust against it. The busty fennec’s thighs tighten around your leg, but it does little to slow your femcum-slicked efforts.");
	else output(" You plunge your fingers into the fox-girl’s waiting cunt, using two for easier penetration. Penny’s tail begins wagging faster at this, but hits your arm at the halfway point and stops for a moment before repeating the process. You slip your other hand under her body and play with her clit, starting her moans anew.");
	output(" Penny’s moans catch in her throat as she cums again.");
	if(penny.hasCock()) output(" You hear a thud as her [penny.cock] rises to full hardness and knocks the underside of the desk, splattering the floor with pearly jizz.");
	
	//male:
	if (pc.hasCock()) 
	{
		output("\n\nPenny moans numbly as you thrust faster and faster between her legs. You grit your teeth as you cum, adding your fluids to the veritable pool of sexual liquid.");
		if(pc.hasVagina()) 
		{
			output(" Your unused [pc.vaginas] explode");
			if(pc.vaginaTotal() == 1) output("s");
			output(" in orgasm, soaking your legs in femcum.");
		}
		output(" As your torrent slows, you pull out of her thighs and reposition your cock closer to her head. Penny’s furry ears twitch as you empty ");
		if(pc.balls > 0) output("your [pc.balls]");
		else output("the last of your reserves");
		output(" onto them. The steamy cum nearly paints the fox-girl’s sonar dishes [pc.cumColor].");
	}
	//female:
	else if(pc.hasVagina()) 
	{
		output("\n\nYou pick up the grind against Penny’s leg until you feel yourself on the edge of exploding. Suddenly you can’t hold on any longer, and your mind goes white momentarily as you explode in orgasm. As you regain your senses you put one leg onto the desk and move your pelvis next to her head. You rub your juices onto the fox-girl’s large ears to mark your territory. The softness feels wonderful and the fuzzy fur tickles a bit.");
	}
	//genderless:
	else 
	{
		output("\n\nAs the helpless police-woman cums you move your fingers faster, trying to push her even deeper into the sea of pleasure. “N-nooo, I d-don... want moooorrrreee” Penny moans in futile resistance as she cums for a second time in rapid succession. ");
		if(penny.hasCock()) 
		{
			output("The busty fox’s [penny.cock] spurts weakly into the puddle of fluids, ");
			if(penny.balls == 0) output("her prostate ");
			output("thoroughly drained of its reserves. ");
		}
		output("You pull your hand from her soaked box and rub her fluids into her ears, brushing her fuzzy mohawk as you do so.");
	}
	
	output("\n\nYou lean down and kiss Penny’s upside down mouth before retrieving your equipment. The exhausted fox-girl returns your kiss weakly before falling asleep atop her desk.");
	if(pc.isNice()) output(" You find a mop and clean up some of the mess before you leave, moving Penny’s body to a more comfortable sleeping position on her chair.");
	else if(pc.isMischievous()) output(" You find a mop and clean up some of the mess before leaving Penny to sleep.");
	else output(" You grin as you leave Penny asleep atop her desk. She can clean up the mess when she awakens.");
	
	processTime(44+rand(6));
	if(pc.hasCock() || pc.hasVagina()) pc.orgasm();
	penny.orgasm();
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}
