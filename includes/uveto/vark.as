/*
 * here's the flags of the thing:
 *	- MET_VARK: -1 for disabled, 1 for regular, 2 for rebel
 *	- VARK_OFFERED_COLLAR: goes up every time vark offers the pc a cookie (cookie as in collar)
 *	- VARK_SEXED times fucked by vark, also used for his progression since any way
 *				 to access other sex scenes would lock out his default progression anyway
 *	- VARK_TEASE_COUNTER: goes up when you leave without shagging, goes back to 0 when you shag him
 *	- VARK_CAN_ASK_PAST, VARK_SEXED, VARK_SPANKED: says in tin
 *	- VARK_COLLAR_IN_A_ROW: Set to 0 when leaving without sex, Increases with collared sex (triggers bad end option at 2)
 *	- VARK_EX_NAME/EX_SON: Doln/Muri's name and son/daughter thingyword. Should be set according to pc's femininity if undefined.
 *	- VARK_PUNISHED: Triggered the varkHasHadEnoughOfYourTease scenes
 *
*/

public var varkCaveRoom:String = "UVIP T46";

public function showVark(nood:Boolean = false, showAuthor:Boolean = true):void
{
	showBust((!nood ? "VARK" : "VARK_NUDE"));
	if (flags["MET_VARK"] != undefined) showName("\nVARK");
	else showName("\nMILODAN");
	if (showAuthor) author("Damiekinz♥");
}

public function varkGotCollar():Boolean
{
	return pc.hasKeyItem("Vark's Collar");
}

public function varkCaveBonus():void
{
	//Shoo
	if (pc.isTaur()	|| !pc.hasGenitals()) return;
	
	if (flags["MET_VARK"] == undefined) output("\n\nTrudging through the snow, you come upon the wide mouth of an icy cave. Deep, imposing gashes line the edges of the entrance, made by the claws of something large by the looks of it. You think you hear deep, bassy rumbles echoing from within, but that’s probably just the wind, right?");
	else if (varkGotCollar())
	{
		output("\n\nYou come upon the familiar cave of your master, and your head is filled with happy, lustful memories of your time together.");
		if (flags["VARK_PUNISHED"] != undefined) output(" You bite your lip, knowing that if you go in, Master will have his way with you.");
		if (flags["VARK_OFFERED_STAY"] == 2) output(" You " + (flags["VARK_PUNISHED"] != undefined ? "also" : "") + " remember that he told you not to come back unless you were ready to stick around for good.");
	}
	else
	{
		output("\n\nYou come across Vark’s cave.");
		if (flags["VARK_SEXED"] == 6) output(" You hesitate a moment more than usual at the entrance, remembering the gruff warning Vark gave you. If you go inside, he’ll collar you whether you like it or not.");
		if (flags["VARK_PUNISHED"] != undefined) output(" After " + (flags["VARK_SEXED"] == 6 ? "another" : "a") + " brief pause you remember that you won’t have a choice in whether or not he punishes you after the way you roused him to act.");
	}
	if (varkGotCollar() && pc.getKeyItem("Vark's Collar") != getWornCollar())
	{
		output("\n\nYour master wouldn’t be happy to see you without your collar.");
		setNavDisabled(NAV_SOUTH_DISABLE);
	}
}

public function varkMenu():Boolean
{
	//sneaky buggers
	if (!pc.hasGenitals() || pc.isTaur() || (varkGotCollar() && pc.getKeyItem("Vark's Collar") != getWornCollar()))
	{
		moveTo(rooms[currentLocation].northExit);
		addButton(0, "Next", mainGameMenu);
		return true;
	}

	clearMenu();
	clearOutput();
	showVark();
	processTime(4);

	if (flags["MET_VARK"] == undefined)
	{
		flags["VARK_CAN_ASK_PAST"] = 1;
		output("Journeying into the cave, a mild shudder passes over you as the deep rumbling gradually gets louder. You discover the source of the noise to be a massive furred creature, snoring quite loudly, lying on a bed of furs. Your codex suddenly chimes in, startling you:");
		if(!CodexManager.entryUnlocked("Milodan"))
		{
			output(" <i>“New Species Detected: Milodan. Interaction highly discouraged.”</i>");
			CodexManager.unlockEntry("Milodan");
		}
		else output(" <i>“Milodan Male detected. Highly aggressive when intruded upon. Evasion recommended.”</i>");
		output(" Unfortunately you have little choice, as the noise rouses the sleeping giant. Fantastic.");
		output("\n\nThe Milodan lunges to his feet, surprisingly agile for his size, and snarls noisily at you, his hot breath blooming across the [pc.skinFurScalesNoun] on your face. He’s an imposing figure, fur pockmarked with various scars, deep and shallow alike. His eyes are a piercing blue, and he’s clad in only a fur loincloth that does a <b>very</b> poor job of concealing his bulbous cat-dick. Your eyes trail up to his face, where you discover his largest scar to be a diagonal gash across his right eye. <i>“Not welcome,”</i> he grunts, clearly displeased that you’ve interrupted his naptime. <i>“Leave, or Vark punish.”</i> Evidently, the big lug’s name is Vark. You aren’t entirely sure how he intends to punish you, but you don’t have long to decide if you want any choice in the matter.");
	}
	else if (varkGotCollar()) output("You delightedly enter the cave of your master, sitting obediently down in front of him, and he smiles warmly down at you. Well, as warmly as a tusked, 300 pound cat-man can. He reaches down and pets your " + (pc.hasHair() ? "[pc.hair]" : "head") + " affectionately. <i>“Hello Toy,”</i> he grunts. His short, barking tones and heavy musk sending shivers of warm pleasure up your spine and into your belly. You’ve missed him.");
	else if (flags["VARK_SEXED"] == undefined)
	{
		output("Vark raises his head to look at you and snarls with arousal when you enter. Standing to stalk over to you, he seizes your [pc.ass] in his massive, furred hands. Somewhat cowed by his size and the suddenness of the act, you stare up at him and whimper.");
		output("\n\n<i>“Vark knew alien come back. Alien want punish again?”</i> You shift in his grasp as you mull it over.");
	}
	else
	{
		output("As soon as you reach him, Vark confidently strides over to you,");
		if (pc.hasHair()) output(" threading his fingers through your hair and");
		output(" squeezing your head softly with his massive hand. <i>“Toy.”</i> The nickname makes you shudder a bit, but you do your best to stay composed. It isn’t easy, your romp from last time replaying in your head and setting your [pc.groin] aquiver. <i>“Vark want more. Toy want more?”</i>");
	}

	if (varkGotCollar()) addButton(0, "Make Love", varkSpanksForSkanks);
	else addButton(0, "Get Punished", varkSpanksForSkanks, undefined, "Get Punished", "You suppose you have been pretty naughty...");
	if (flags["VARK_CAN_ASK_PAST"]) addButton(1, "Question Him", varkGimmeAnswers, undefined, "Question Him", "Why is he here all by himself?");
	else addDisabledButton(1, "Question Him");
	if (flags["VARK_PUNISHED"] == undefined) addButton(14, "Leave", varkLeaveCave, undefined, "Leave", "You don’t think you should be here.");
	else addDisabledButton(14, "Leave");
	
	return true;
}

public function varkLeaveCave():void
{
	clearMenu();
	clearOutput();
	showVark();
	processTime(1);

	var tooMuchTease:Boolean = flags["VARK_TEASE_COUNTER"] == 2;
	
	if (flags["MET_VARK"] == undefined)
	{
		output("You’re not particularly in the mood for punishment, so you nod apologetically and exit the cave into the icy plains outside.");
		flags["MET_VARK"] = -1;
	}
	else if (varkGotCollar() && tooMuchTease) output("<i>“No,”</i> Vark grunts, seizing your ass. <i>“Tired of Toy leave. Obey Vark. Take punish.”</i> You tremble and look up at him, his musk inundating your senses. He’s right, you shouldn’t tease him like this.");
	else if (varkGotCollar()) output("You whine pathetically, telling your master that you can’t stay, and beg him for forgiveness, worshipfully grooming his chest fur with your [pc.tongue]. He grunts and lets you go with a firm slap on the ass, growling angrily. You probably shouldn’t upset your master...");
	else if (tooMuchTease) output("Vark snarls furiously, grabbing you by the back of the neck and looming over you, staring deep into your eyes. His scent and the roughness of his actions making your belly lurch. <i>“Vark tired of this. Come.”</i> You don’t really have any ability to run and you suppose you knew what would happen if you came back.");
	else 
	{
		output("You tell him that you can’t stay, and he grunts in annoyance.");
		if (flags["VARK_TEASE_COUNTER"] == 1) output(" Vark glares daggers at you, standing and stalking over to grip your shoulder tightly, the tips of his claws threatening to scratch you. <i>“No come back if don’t want Vark. Vark punish next time.”</i> It’s probably in your best interest to stay away if you don’t want some...");
		output(" He sends you off with a firm slap on the ass and grumble.");
	}

	if (tooMuchTease) flags["VARK_TEASE_COUNTER"] = 0;
	else IncrementFlag("VARK_TEASE_COUNTER");
	flags["VARK_COLLAR_IN_A_ROW"] = 0;

	addButton(0, "Next", (tooMuchTease ? varkHasHadEnoughOfYourTease : varkLeavePhysically));
}

public function varkLeavePhysically():void
{
	moveTo(rooms[currentLocation].northExit);
	mainGameMenu();
}

public function varkHasHadEnoughOfYourTease():void
{
	clearMenu();
	clearOutput();
	showVark();
	
	var tempVark:Creature = new MilodanMale();
	
	if (varkGotCollar())
	{
		output("He drags you by a wrist to his bed, where it seems he’s recently mounted stone handcuffs to the floor above his pillow. It doesn’t take a genius to figure out who they’re for. He");
		if (!pc.isNude()) output(" forcefully strips you down and");
		output(" guides you onto your hands and knees, pillow under your crotch and hands locked into the restraints. Your ass is raised and unprotected, and he kneels to begin his work. His paws come down hard and fast on your [pc.ass], and you whine as pain floods your cheeks. These aren’t the rough and tumble love taps from before, he’s genuinely punishing you now. While your writhing against his bed stimulates your [pc.groin] a little, it’s quickly counteracted by the burning sensation he relentlessly pushes into your rear. He does this for about an hour, until you’re gasping and whimpering and squirming, desperately trying to get the heat out of your ass. He coos and massages the cheeks, spurring you to arch your back and groan in an odd mix of discomfort and satisfaction.");
		output("\n\n<i>“Toy bad. Toy show sorry.”</i> He effortlessly flips you onto your back and readjusts your restraints, straddling your neck. The musk of his shaft obliterates every sliver of resistance in an instant, dragging a delirious moan from your throat. He grins above you, hastily removing his loincloth to lower his front half and hold himself up with his arms, tip pressing against your lips. The salty-sweet taste overwhelms you, and you pliantly slurp away at his fat, barbed cockhead, submissive shivers coursing through you. He grabs the back of your head roughly and presses inexorably forward, spearing into your throat. You gag at first, but force yourself to relax when he glares down at you for the briefest of moments. As you acclimate your throat to his fat cock, you open it wider, letting him ride it like a drooling cunt. Every gasp for air between thrusts inundates you with his scent, and your eyes roll back into your head not long after the third drag, your face becoming little more than an onahole. You vaguely feel him force his knot past your lips as he bottoms out in your throat, but you’re so busy using your remaining brain cells to obediently chug his cum that you don’t even notice.");
		output("\n\nHe fucks your mouth like that for hours, nearly knocking you unconscious with the force of his humping and the blockage in your throat. You stumble back into your mind on the tail end of his final orgasm, your throat quivering as you gulp it down and lick desperately at the delicious glaze on his shaft as he pulls it free. You whine in your daze, capable of little else, and feel his cum dripping down your chin. <i>“Toy do good. Vark forgive.”</i> You pant and thank your master for his generosity, but in this state it comes out as little more than a slurred babble. He seems to understand the basic message, and unbinds you from the ground, lecherously watching you try and fail to properly");
		if (!pc.isNude()) output(" get your [pc.gear] back on and");
		output(" exit his cave. He’s quite entertained by how dumb he was able to fuck you, and he rises to pad over, massaging your scalp. He leads you to the exit and once there, gives you a predatory lick on the neck, filling you with shudders and making you whine. At your feeble response he lets loose a barking laugh and lazily sends you off with a fat smack on your already heat-flooded rump.");
	}
	else
	{
		output("He leads you to his bedding and " + (pc.isNude() ? "begins" : "watches as you strip,") + " inspecting your nude body. He licks his tusks and grabs you by the back of your neck, tilting your head up to forcefully kiss you. This throws you completely off-guard, his bumpy tongue sliding past your [pc.lips] to taste the inside of your mouth, and he purrs in approval at what he finds. He’s relatively quick to pull back though, your gasping mouth connected to his grin by a thin trail of saliva. He takes advantage of your dizziness and lowers your barely resisting flesh belly-down onto his bedding, tugging your arms above your head to clamp them into stone handcuffs of sorts. You whine and tug on your restraints, but he ignores you with a chuckle, gripping both ankles in one massive hand as he raises your legs and begins to light up your [pc.ass] with hard, firm swats. You throw your head back and gasp, squirming helplessly in your cuffs as he relentlessly heats up your rump. He spends several minutes methodically punishing every inch of your cheeks, before unceremoniously dropping your legs to the ground, flipping you over and binding them in similar manacles. You’re completely held down, all four limbs secured. Even if you weren’t weak from your punishment and his domination, you wouldn’t stand a chance in your chains. He grins down at you and removes his loincloth, turning away and squatting down to press his plump ass against your face, his tight pucker flexing softly in front of you.");
		output("\n\n<i>“Lick,”</i> comes the order, and you do. You whine needily as you slather his pucker with wet licks and kisses, doing anything to appease him and save your bottom from another round of slaps. He groans softly and flexes his hole against your face, pushing back farther to smother you in his muscle-bound cheeks. They’re firm and taut from years of rigorous activity, yet they still manage to be plump and soft enough to jiggle against your face as you tonguefuck his ring. He begins to gracefully roll his hips, riding your tongue and giving you only seconds to breathe between bounces of his fat ass. You groan quietly into his hole, dizzy off of the smothering, but you find you’re enjoying it immensely. Your" + pc.cockAndVagina(" [pc.cocks]", " [pc.pussies]") + " quivering and flexing as shameful, leaden heat floods into " + (pc.isHerm() || pc.hasCocks() || pc.hasVaginas() ? "them" : "it") + ". Evidently he is too, as he finds orgasm a few minutes later, howling as his hole tightens on your taste organ, his cock painting your [pc.chest] with a thick load. He does this for hours, giving you short breaks where he dips his fat nuts in your mouth or makes you clean a load off of his tip. When all is said and done, you’re barely coherent, your tongue sore and twitching from fighting against the resistance of the warrior’s ring for so long. He turns and slaps his dick against your face, humping your nose as you weakly slobber across the underside. He grunts in satisfaction, undoing your bindings and leaving you to exit whenever you come to your senses.");
	}
	
	pc.maxOutLust();
	pc.loadInMouth(tempVark);
	pc.loadInMouth(tempVark);
	pc.loadInMouth(tempVark);
	
	processTime(2*60+rand(2*60+1));
	IncrementFlag("VARK_PUNISHED");
	
	addButton(0, "Next", varkLeavePhysically);
}

public function varkGimmeAnswers():void
{
	clearOutput();
	showVark();
	
	//Grays out questioning him until the pc is collared
	flags["VARK_CAN_ASK_PAST"] = 0;
	addDisabledButton(1, "Question Him");
	
	//Locking in the milo's gender
	var askedBefore:Boolean = true;
	if (flags["VARK_EX_SON"] == undefined)
	{
		askedBefore = false;
		flags["VARK_EX_NAME"] = pc.mf("Duln", "Mori");
		flags["VARK_EX_SON"] = pc.mf("son", "daughter");
	}
	
	if (!varkGotCollar())
	{
		output("<i>“What are you doing out here all by yourself?”</i> you ask, inspecting his improvised home. <i>“Don’t Milodan usually live in villages together?”</i> He narrows his eyes at you and grimaces, his jaw shifting a bit from side to side. Apparently he didn’t like that question.");
		output("\n\n<i>“Exile. Vark bed with chief’s " + flags["VARK_EX_SON"] + ".”</i> Out of all the possible explanations for his solitude, that wasn’t anywhere near the top of your list. It seems like Vark is a bit of a troublemaker. Nice.");
		output("\n\n<i>“And was it the chief or his " + flags["VARK_EX_SON"] + " who took issue with that?”</i> Vark snarls, baring his claws. He <b>Really</b> didn’t like that one, apparently you hit a nerve.");
		output("\n\n<i>“Mind own thoughts. It Vark life, not yours,”</i> he hisses, grinding his teeth together in annoyance. He squares his shoulders and stalks towards you menacingly. Guess you’ll have to get out of here, or stay for your punishment.");
	}
	else if (askedBefore)
	{
		output("You look up at your master, remembering what he told you about his mate. <i>“Master? Why did the chief make you leave your village?”</i> Vark stares at you for a long while, and then sighs quietly.");
		output("\n\n<i>“" + (flags["VARK_EX_SON"] == "son" ? "Could not kit-make." : "Think Vark too weak. Not worthy for heir-make.") + "”</i> You frown, saddened by the injustice of his loss, and gently kiss his abs, looking up at him.");
		output("\n\n<i>“Do you need me to help you forget master?”</i> You say as softly and lovingly as you can. It seems to help, and he purrs and rubs behind your [pc.ears] gently, nodding.");
		output("\n\n<i>“Toy mate now. Toy make Vark happy.”</i> Your heart lights up when he says it, and you smile blissfully as you gently kiss his loincloth. You’re the luckiest [pc.boy] in the universe.");
	}
	else
	{
		output("A thought occurs to you, and you look up at your master. <i>“Master, why are you all alone out here?”</i> It really doesn’t seem fair, your master is a wonderful person, he must have a good reason for keeping it all to himself. He looks down at you and thinks for a moment, his handsome features shifting subtly.");
		output("\n\n<i>“Vark loved " + flags["VARK_EX_SON"] + " of Chief. Chief did not like. Send Vark away.”</i> He stares soberly towards the storm raging outside. You’ve never seen him like this, and your belly churns with the need to make him feel better. You climb into his lap, nestling into his chest to comfort him. He looks down at you and smiles, gently stroking your head.");
		if (flags["VARK_EX_SON"] == "son") output(" <i>“Chief want heir to Son. Vark can’t. No make kit.”</i> You stare up at your master’s sorrowful face and snuggle closer to his chest. His heartbeat is slow and somber, as if it were mourning his loss somehow.");
		else output(" <i>“Chief think Vark weak. Not good to heir-make. Make Vark leave tribe. Vark go on hunt, try prove he strong. When got back, she mate with Akto.”</i> You lay your head against his chest and gaze up at his throat, watching his Adam’s apple bob slowly as he swallows his sorrow.");
		output("\n\nYou feel his loss as if it were your own. To think that someone could be so cruel to your master is unforgivable. You lay with him for a while longer, kissing him on the neck gently, and look deep into his eyes.");
		output("\n\n<i>“What was " + (flags["VARK_EX_SON"] == "son" ? "his" : "her") + " name?”</i> You ask quietly, and it takes him a bit to speak.\n\n<i>“");
		output(flags["VARK_EX_NAME"] + "”</i>. His voice is a bit strained, and you feel a sharp pang of regret for making him recount such painful memories. You want to make it up to him, so you begin to lick his chest fur gingerly with your [pc.tongue], humming as you work. He gently massages the back of your head as you do so, purring deeply.");
		output("\n\n<i>“Can I make you feel better Master?”</i> you whisper softly as you pull away, and he gently cups your [pc.butt] with a paw, nodding.");
	}
	
	processTime(5);
	
	if (varkGotCollar())
	{
		clearMenu();
		addButton(0, "Next", varkSpanksForSkanks);
	}
}

public function varkSpanksForSkanks():void
{
	clearMenu();
	clearOutput();
	showVark(true);
	
	var vagUsedInt:int = (pc.hasVagina() ? rand(pc.vaginas.length) : -1);
	var vagUsed:String = String(vagUsedInt);
	var tempVark:Creature = new MilodanMale();
	
	if (flags["MET_VARK"] == undefined)
	{
		flags["MET_VARK"] = 1;

		output("Your curiosity gets the better of you, and despite knowing what this feline is undoubtedly capable of, you’re compelled to stay put. You shift a bit nervously as your heart pounds softly in your ears. You don’t know what he plans to do to you, and that makes your gut stir with anticipation.");
		if (pc.isNude()) output("\n\nAlready nude,");
		output("\n\n<i>“Naked, now, ”</i> Vark curtly insists, and you obey, a shiver running through you. Laying your [pc.gear] aside,");
		output(" you stand there expectantly, and he suddenly grabs you roughly by the scruff of your neck. Vark snarls deep in his throat as he seats himself on a bench-like protrusion in the cave wall, guiding you over his legs to leave your [pc.ass] propped up slightly, exposed and vulnerable.");
		if (pc.isHerm()) output("\n\nYour [pc.groin] rubs against his soft, muscular thigh, the pleasant sensation making you shiver.");
		else if (pc.hasCock()) output("\n\nYour [pc.cocks] " + (pc.hasCocks() ? "jump" : "jumps") + " from the guilty pleasure you get from being put in this position, and " + (pc.hasCocks() ? "they gently rub" : "it gently rubs") + " against his furred thighs as you wriggle nervously, tingling butterflies filling the pit of your stomach.");
		else if (pc.hasVagina()) output("\n\nYour [pc.cunt] rubs against his thigh fur, and you quiver at the tactile pleasure, your belly tingling.");
		output(" He places his thick, rough palm over your [pc.butt], and begins to hungrily knead the flesh a bit, drawing a submissive moan from you. This clearly excites him, and you’re almost certain you can hear the smirk in his gruff voice.");
		output("\n\n<i>“Vark think alien like. ”</i> You feel yourself flush at that, and consider yourself fortunate to be face down, so that he doesn’t get the satisfaction of knowing he’s right.");
		output("\n\nWith relatively little warning, he raises his hand and swings it down, the impact of the swing causing you to yelp. A powerful heat sinks into your assflesh, replaced after a bit by burgeoning warmth. It’s almost.... satisfying. You can feel yourself getting a bit lightheaded, and you barely have time to breathe before he’s pulled back for a second swat. The loud <b>plap</b> it makes against your [pc.butt] is oddly cathartic, and the heat in your cheeks returns with a vengeance, sinking far deeper this time to leave your ass with an unusually pleasant sting.");
		output("\n\nYou can’t help but gasp when the cold wind soothes your burning cheeks for a moment before his palm restlessly delivers a fresh round of strikes. Your [pc.ass] is throbbing, and your [pc.groin] " + (pc.isHerm() || pc.hasCocks() || pc.hasVaginas() ? "are" : "is") + " bumped endlessly against his thighs, the soft fur there stroking your taxed nerves and sending electric tingles up your spine. You’re no longer able to seperate the brief pain of his stinging palms from the immense pleasure of your improvised pelvic massage, your rump riddled with a toe-curling sting that never quite goes away, even as the dense heat settles into it. Your confused nerve endings misfire constantly, the white-hot pleasure causing your brain to go numb and your thoughts to jumble. It isn’t long before you whimper happily, your head spinning with the chemical ecstasy he’s forced upon you as you orgasm.");
		if (pc.isHerm()) output("\n\nYour [pc.cocks] and [pc.cunts] seize up in equal measure, your fluids absolutely drenching the ice beneath you,");
		else if (pc.hasCock()) output("\n\nYour [pc.cocks] " + (pc.hasCocks() ? "pump" : "pumps") + " [pc.cum] all over his thighs,");
		else if (pc.hasVagina()) output("\n\nYour [pc.pussy] clenching desperately as you baste his thighs in your [pc.girlCum],");
		output(" and he continues right through your orgasm, chuckling to himself. Honestly, you barely have the coherence left to care. He speaks firmly to you, his deep voice burrowing into your lust-addled brain and settling there.");
		output("\n\n<i>“Alien love punish. Will come back.”</i>");
		output("\n\nYour [pc.ass] is relentlessly peppered all the while, his palm ceaselessly heating up your wobbling cheeks. Through the haze of lust and the euphoric heat in your rear, you can’t bring yourself to deny that the prospect of a repeat performance might be tantalizing. When he finally relents, your thoroughly smacked ass is throbbing and blazing hot. He firmly begins to stroke your sensitive [pc.skinFurScales], massaging the greater half of the pain out.");
		output("\n\n<i>“Alien no come back...”</i> He pauses, and you hear the wry smile in his suggestion. <i>“Unless [pc.heShe] want more.”</i>");
		output("\n\nHe gets up and leaves you to recover, casting a cursory glance down at you. You can’t quite tell how he feels by the impassive expression on his tusked face, but he grunts in satisfaction and waves you off, nestling back into his bed to nap once again. You lay there and pant quietly, feeling your pulse thrumming throughout your entire body. There’s something inherently satisfying about being left with a reminder of your treatment, and when you finally");
		if (!pc.isNude()) output(" put your [pc.gear] back on and");
		output(" head out, your [pc.butt] is still burning");
		if (!pc.isAssExposed()) output(" in your [pc.lowerUndergarment]");
		output(". You feel compelled to cast the occasional glance back at the cave, your stomach tingling as you recount the experience in your head.");
		pc.changeLust(30);
	}
	else if (varkGotCollar())
	{
		output("You rise to stand and he’s quick to scoop you up, gracefully sliding his paws along your [pc.ass] and thighs to hold you aloft. You open your mouth to gasp but he catches your lips in a sloppy kiss, heavy purrs rolling through his chest and into yours. He somehow manages to soothe and excite you in equal measure, the powerful thudding of his heartbeat dwarfing yours as it works to fuel his savage passion. His hunger for your body is endless, and he");
		if (pc.isNude()) output(" comes close to damaging your [pc.skinFurScalesNoun] as his claws greedily roam your curves.");
		else output(" barely manages to avoid tearing your [pc.gear] apart in his effort to bare you.");
		output(" The cold makes you shiver, but he’s quick to pull you close, his tongue roaming along your collared neck and collarbone as he lavishes it with affection. You feel weightless in his grip, content to let him play with you as he sees fit. He adjusts you carefully to balance you on one arm, his newly freed paw quick to explore your [pc.groin], petting and pumping and setting it alight with heat so potent you find it impossible to care about the biting wind.");
		output("\n\n<i>“Toy,”</i> he whispers, gentler than usual, and your heart flutters, your body relaxing into his. This softness is your reward for giving yourself to him, for letting him give himself to you. His hand trails back to your rear, and he kneads it carefully, lovingly. The need to take you is still there, but it’s different now. He wants to make you both feel good together. He was harsh on you before, but you needed that, you needed him to teach where you belonged, so that you could see this side of him. You’re happiest as the vessel into which he pours his lust and affection, and you’re more than happy to keep it that way. He softly pulls a paw back to smack your rump, but it’s clearly a mere formality at this point. It didn’t hurt, you barely even felt it, but it still fills your body with unparalleled warmth, his breath washing down your chest to explore you as readily as his paws do.");
		output("\n\nHe carries you tenderly to his bed and lowers himself to the ground on his back, setting you softly in his lap. His strong paws slide away from your [pc.ass] and glide to your chest, " + (pc.hasBreasts() ? "filling them with your [pc.breasts]" : "splaying his fingers across your pecs.") + " You moan softly as he plays carefully with your [pc.nipples] and chuckles, toying with your upper body to learn what makes you tick.");
		output("\n\nYou feel compelled to press forward into his sensual mauling, and he grunts as you grind back against his tented loincloth as a result, his musk subtly filling the air around you. You wiggle your behind against his bulge until the cloth slides off of him, his aroma intensifying tenfold and pressing in on your mind. You moan deliriously at the heat his familiar scent wracks your body with, falling prey to the sensations inundating your mind. You’re so enraptured by his scent and his fervent, hungry caressing that you almost fail notice when he grabs you gently by the [pc.hips] and slides into your [" + (pc.hasVagina() ? "pc.vagina " + vagUsed : "pc.asshole") + "], all the way down to the knot.\n\n");
		
		if (pc.holeChange(vagUsedInt, tempVark.biggestCockVolume(false), true, false)) output("\n\n");

		output("You scream in ecstasy and cum in an instant, your [pc.groin] wracked with spasms as his barbs scrape lines of white hot euphoria across your seizing walls. His fur is matted by your fluids, but he doesn’t seem to mind, opting to begin bouncing you in his lap as your body quivers around him. Your [" + (pc.hasVagina() ? "pc.vagina " + vagUsed : "pc.asshole") + "] has never felt so full, and you claw desperately at his chest to find purchase in the sea of bliss being forced into your body as he makes you into his perfect little love-sleeve.");
		if (pc.hasCock()) output(" He reaches up and grips your [pc.biggestCock], pumping it smoothly as he rolls his hips beneath you, your cheeks wobbling against his knot.");
		output(" Your " + (pc.hasVagina() ? "cunt" : "asshole") + " is shivering around him as he spreads you again and again, the sensitivity driving you insane after your orgasm. He draws moans and screams and whimpers out of you constantly, the look on his face telling you he loves every one of them.");

		output("\n\n<i>“Hnngh. Toy good lap[pc.boy],”</i> he huffs, scrunching up his face as his balls tighten up beneath you. He’s oh so close, and you need it <b>all </b> inside of you. You whine happily and slam your [pc.vagOrAss] onto his knot, making him howl as he seizes your [pc.ass] in his paws and pumps what feels like gallons of silky cream inside of you. You whimper pitifully, his grunting and groaning drawing another orgasm from you, your " + (pc.hasVagina() ? "pussy" : "ass") + " seizing up around his cock");
		if (pc.hasCock()) output(" as your own member" + (pc.hasCocks() ? "s flex and coat" : " flexed and coats") + " his herculean abs like icing on a rock hard cupcake.");
		else output(" as you throw your head back and gasp, feeling your belly release the heat he’s been pumping into you.");
		output(" Your muscles melt in his grip like ice cream in a sauna as he tugs his knot out and wrests the two of you into a fresh position. You’re left belly down with your face pressed into his fur bedding as he turns away and does a push-up, lining his tip up with your gaping " + (pc.hasVagina() ? "lips." : "ring."));
		output("\n\nHe slams his lower half downwards, spearing into you and spurring you to wail blissfully into the furs beneath you, your lower body racked with spasms as he forces your cream-lubed innards to yield to his insatiable lust. He begins to roll his body gracefully, supporting himself on only his tensing arms as he grinds into your helpless hole. You’re too blissed out to do much but struggle for air and squirm, his cock hammering your " + (pc.hasVagina() ? "cervix" : "prostate") + " on the apex of every mind-shattering thrust. Your body shudders in orgasm, but you’re too far gone to feel it to its full extent, your nerves screaming uselessly into the chemical fog around your brain.");

		output("\n\nYou’ve turned into a whimpering puddle of satisfied meat for him to fuck, and you sure as hell aren’t complaining. Not that you could even if you wanted to, his cock having pummeled your brains out an hour ago. You orgasm countless times beneath him, his knot effortlessly gaping you every few thrusts, just to prove to himself that he can. You drown in the pleasure he’s riddled you with, barely even noticing when he grabs your body again, tugging his fat breeding bulb out to stand and hoist you up. He loops his bulging biceps under your arms to hold you against his waist, thrusting into the air to bounce your lower half away from him, letting gravity do the rest");
		if (pc.hasCock()) output(" Your cock" + (pc.hasCocks() ? "s are" : " is") + " bobbing uselessly between your legs, having unloaded everything you had and then some, but your body still spasms with orgasm every few thrusts, desperately trying and failing to dispense proof that you love every second of this.");
		else if (pc.hasVagina()) output(" Your cervix has long since yielded to his battering ram of a cock, and he slams into your womb every time his knot pops through your lips. If you’re not pregnant by now, nothing in the universe ever could have knocked you up.");
		output("\n\nHe fucks you like this for hours, maybe even days, time isn’t even a four letter word to you anymore. Your muscles are sore and screaming, your holes devastated by what might’ve been hundreds of thick, virile loads, and you love it. You love every cubic inch he feeds into you, driving everything out of your mind but the need to sag in his arms and relax your holes for him. He’s a beast unlike any other, and it’s more than a privilege to serve him.");
	}
	else if (flags["VARK_SEXED"] == undefined)
	{
		output("You nod slowly and he grins, massaging your body. <i>“Make right choice. Come.”</i> He leads you back to the makeshift seat, sitting down and guiding you to stand between his knees, where he pulls you into a deep, almost romantic kiss. His warm, bumpy tongue and furred lips feel wonderful against your face, and you press into him, a quiet moan escaping you to be captured in his maw. Vark rubs your face almost delicately, and then whispers <i>“Toy.”</i>");
		output("\n\nYou’re wracked with shudders, yet your body feels like it’s been doused in warm water. You sigh weakly, and you suppose... being his toy would be pretty fun. Seeing your reaction to the assertion, he grins lecherously and licks your neck, sending a tingle down your spine. You whine as he starts to purr and kneads your [pc.ass] aggressively, the nerves in your [pc.groin] humming like an engine.\n\n");
		output("<i>“Nude,”</i> He purrs, fingers pulling away from your [pc.butt] to allow you to strip. You peel your [pc.gear] off as quickly as you can, shivering gently at the cold as it sinks into your [pc.skinFurScalesNoun]. ");
		output("He’s quick to warm your bare form up, his paws roaming along your sides and landing once again on your rear with a firm grope. <i>“Time for punish,”</i> he grunts softly.");
		output("\n\nHe guides you over his knees, leaving you exposed, but he’s quick to gently pet your bare back, your [pc.skinFurScales] sensitive to his touch. <i>“Toy is bad " + pc.mf("Boy", "Girl") + ".”</i> He’s right; you are, and you whimper your agreement as he moves his massive paw to your rear, squeezing hard. It makes your body tingle, and you can barely stifle your whimpering under the assault.");
		if (pc.hasStatusEffect("SPANKED BY VARK")) output(" The sordid heat from your previous punishment still lingers beneath your [pc.skinFurScalesNoun], and as he gropes you it sends jolts of dizzying sensation into your brain.");

		output("\n\nHe begins not long after, his paw raising and confidently swinging back down to set your cheeks wobbling, " + (pc.hasStatusEffect("SPANKED BY VARK") ? "the existing heat reigniting, drawing a satisfied groan from you." : "the usual sting molded into a deep, tingling heat the longer it goes on.") + " Your [pc.ass] is helpless to escape him, but you wouldn’t have it any other way.");

		if (pc.isHerm()) output("\n\nYour [pc.groin] is forcefully rubbed against his thighs by the force of his strikes, coupling the heat and pain with unspeakable ecstasy. Your [pc.cocks] and [pc.pussies] are throbbing almost as hard as your ass, and they pulse in time with your heartbeat, your head dizzied by the synchronicity.");
		else if (pc.hasCock()) output("\n\nYour dick" + (pc.hasCocks() ? "s are" : " is") + " harder than you can ever remember " + (pc.hasCocks() ? "them" : "it") + " being, and every swat on your [pc.ass] drives " + (pc.hasCocks() ? "them" : "it") + " to slide against his thighs, unbearable leaden heat burrowing into your gut. You grunt and whine, already close to orgasm, as your member" + (pc.hasCocks() ? "s are" : " is") + " stroked repeatedly by his thighs.");
		else if (pc.hasVagina()) output("\n\nYour [pc.cunts] " + (pc.hasVaginas() ? "are" : "is") + " slid across his soft, muscular thighs with each slap against your cheeks, your thighs endlessly rubbed together by the involuntary flexing of your muscles.");
		output(" He doesn’t relent until you cum, and");
		if (pc.isHerm()) output(" you scream in ecstasy as your [pc.groin] unload your fluids all over him.");
		else if (pc.hasCock()) output(" you whine loudly as your [pc.cocks] clench" + (pc.hasCocks() ? " and blast" : "es and blasts") + " his legs with seed, all the heat he slowly worked into your belly exploding outwards.");
		else if (pc.hasVagina()) output(" your voice catches in your throat as you absolutely ruin the fur on his thighs with a flood of your [pc.girlCum].");
		output(" He doesn’t give you time to come down, beginning to squeeze and massage your quivering [pc.ass].");

		output("\n\n<i>“Toy having fun?”</i> You whimper out an incoherent answer, and he chuckles. <i>“Vark’s turn.”</i> He lifts you off his knee, drawing a surprised gasp from you, and points to his bed of furs. <i>“Get down.”</i> You shiver and meekly do as he says, your head spinning from your release. You aren’t entirely sure what he intends to do until he kneels behind you, fingers diving into your [pc.vagOrAss]. You gasp and whine, pleasure shooting through your gut, as he begins to toy with you, his soft, massive fingers massaging your inner flesh.");
		if (pc.hasVagina()) output(" The oversensitive walls of your pussy clench and twitch around them, your recent orgasm rendering the sensation unbearable, and you bite down on the fur beneath you, moaning sultrily.");
		else output(" Your ring quivers and clenches around his fingers, and it takes you a moment to get used to them, moans being dragged from you as he glides over your prostate. He hears you cry out at the pressing of your bump, and slides back to it, beginning to massage your button. This drags a squeal of ecstasy from your throat, and he chuckles.");
		output("\n\n<i>“Toy ready,”</i> he says, inviting no opposition, and pulls his fingers out none too carefully, drawing a shudder from you. He plants his knees on either side of your legs with a heavy thud, and sheds his loincloth, the tip of his barbed cock prodding impatiently at your " + (pc.hasVagina() ? "lips" : "ring") + ". He eagerly presses inside you, your walls quivering around him and your head spinning as it melts under the pressure.");
		if (pc.hasVagina()) output(" As he impatiently fills your cunt, the barbs draw defeated whines from you. When he bottoms out against your ass, the heat in your cheeks starts anew, and you groan woozily at the sensation. He grunts quietly at the quivering of your walls, and slaps your ass. <i>“Good Toy.”</i>");
		else output("Your cock" + (pc.hasCocks() ? "s jump" : " jumps") + " as he rides over your prostate, and he leans over to press his chest against your back, guiding your body down with firm, insistent pressure as he bottoms out. His knot presses to your [pc.asshole], and his hips to your cheeks, sending warm and stinging tingles into you. You whine at the sensation of his barbs scraping against your bowels, and clench down on him, drawing a grunt of pleasure from his maw. <i>“Good Toy.”</i>");

		if (pc.holeChange(vagUsedInt, tempVark.biggestCockVolume(false), true, false)) output("\n\n");
		
		output("\n\nSeemingly pent up, he draws back and begins to pound your hole, causing you to squeal at the sudden and rapid friction of his barbs. You’re quickly brought to another brain-numbing orgasm,");
		if (pc.hasVagina()) output(" your [pc.pussy " + vagUsed + "] clenching wildy and");
		if (pc.hasCock()) output((pc.balls > 0 ? "your balls drawing up " : "") + "as your [pc.cocks] " + (pc.hasCocks() ? "begin" : "begins") + " pumping out [pc.cum],");
		output(" ruining his bedding with your fluid lust. He doesn’t even seem to notice, his hips endlessly slapping your well-punished asscheeks as his knot batters against your [" + (pc.hasVagina() ? "pc.vagina " + vagUsed : "pc.asshole") + "]. Your brain spins with endorphins and you moan deliriously, shocked out of your reverie only by the insistent shallow thrusts he begins to make, his knot gradually forcing open your [" + (pc.hasVagina() ? "pc.vagina " + vagUsed : "pc.asshole") + "]. You whine and find release again, fluids weakly drenching your thighs, as he pops inside you, beginning to baste your " + (pc.hasVagina() ? "womb" : "bowels") + " with hot, virile cum.");
		if (pc.hasVagina()) output("\n\n<i>“Toy have kits.”</i>");
		else output("\n\n<i>“Toy good cocksleeve.”</i>");
		output(" You shudder at his words, barely able to comprehend them after such a rough fuck, but he isn’t done yet. As soon as his knot begins to deflate, he drags it out of your cum-soaked [" + (pc.hasVagina() ? "pc.vagina " + vagUsed : "pc.asshole") + "], his still-raging erection beginning its hard, carefree pounding all over again.");
	}
	else
	{
		output("You nod slowly, smiling up at Vark, and he licks his tusks hungrily. <i>“Come.”</i> He ");
		if (!pc.isNude()) output(" strips you down and");
		output(" leads you to a pair of jade green manacles mounted into the ice, set about as high as you can stretch your arms comfortably. He guides your wrists into the padded stone, and as soon as they lock, you squeal. Powerful heat surges down your limbs and into your shoulders, tingly starbursts of momentary ecstasy, driving your entire body into a veritable hot tub of sensation and lust.");
		if (pc.isHerm()) output(" Your [pc.groin] are vibrating with leaden love,");
		else if (pc.hasCock()) output(" Your [pc.cocks] " + (pc.hasCocks() ? "are" : "is") + " jerking and bouncing as a knot of euphoric heat fills your belly.");
		else if (pc.hasVagina()) output("\n\nYour [pc.pussy " + vagUsed + "] is dripping and quivering as your walls rub together");
		output(" and you can’t help but cry out in pure bliss as he slaps your bare [pc.ass].");

		output("\n\n<i>“Good Toy,”</i> he growls, and it makes your spine tingle, his words and these strange bindings driving you to sexual rapture. He toys absently with the manacles, driving the stones against your [pc.skinFurScalesNoun], and it’s not long before you cum, hard. His smacks, gropes, and verbal assault continue, unfazed entirely by the event. He brings you to a second and third before he finally relents, leaving you gasping and hanging there by your tingling wrists. He sheds his loincloth and grips your [pc.hips], purring and pressing slowly into your [" + (pc.hasVagina() ? "pc.vagina " + vagUsed : "pc.asshole") + "]. You squeal happily as you cum again, quivering around his tip as");
		output(pc.vaginaAndCock(" your [pc.pussy " + vagUsed + "] clenches",
								" your [pc.cocks] " + (pc.hasCocks() ? "bounce" : "bounces")));
		output(", spurting your release all over your own thighs.");

		if (pc.holeChange(vagUsedInt, tempVark.biggestCockVolume(false), true, false)) output("\n\n");
		
		output("\n\nHe pushes in deeper and begins to pound you mercilessly, the stones on your wrists enhancing every sensation and driving you to scream, your eyes rolling back as his cock gapes your " + (pc.hasVagina() ? "cunt" : "pucker") + ". You barely have time to scream as he pops his knot in, his thrusts forced to shallow but arrive just as quickly, driving you to a strained, clenching orgasm all over again as you wail his name.");
		output("\n\nHe grunts loudly as he cums, balls jumping against your cheeks as he floods your " + (pc.hasVagina() ? "womb" : "bowels") + " with cream, licking slowly up the back of your neck. The hot, silky load is a godsend to your powerfucked " + (pc.hasVagina() ? "pussy" : "asshole") + ", and you whine blissfully at the relief.");
		output("\n\n<i>“Mm. Toy good fuck.”</i> The praise brings a soft buzz of pleasure to some buried corner of your mind, and you nod, whimpering dizzily. He pops his knot out and begins just as quickly as he finished, his sloppy, powerful thrusts causing his cum to be forcibly pushed out all over his balls and thighs. If it weren’t for the restraints and his confident paws on your [pc.hips], you wouldn’t be standing.");
		output("\n\nHe does this to you for hours, your limbs giving out after only one, leaving you dangling by your wrists as he hoists your lower half and fucks your brains out. When he knots you one final time, he roars in a way that makes you shrink in his grasp, some primal part of your brain cowed powerfully by the carnal fury of his release. His finale is a firm, messy stuffing, his voice softly groaning out the last of his commendations. " + (pc.hasVagina() ? "<i>“Toy take kits well.”</i>" : "<i>“Toy take cock well.”</i>") + " At that declaration, you squeal and buck in your restraints and his paws as you cum one final time, moaning deliriously and sinking into the inky black.");
	}
	
	processTime(30);
	flags["VARK_TEASE_COUNTER"] = 0;
	IncrementFlag("VARK_SPANKED");
	
	//Some scenes change if spanked within the last 8 hours
	if (!pc.hasStatusEffect("SPANKED BY VARK")) pc.createStatusEffect("SPANKED BY VARK");
	pc.setStatusMinutes("SPANKED BY VARK", 8*60);
	
	if (flags["VARK_SPANKED"] > 1)
	{
		if (pc.hasVagina()) pc.loadInCunt(tempVark, vagUsedInt);
		else pc.loadInAss(tempVark);
		processTime(45);
		pc.orgasm();
		addButton(0, "Next", varkSpanksTwoSpankHarder);
	}
	else addButton(0, "Next", varkLeavePhysically);
}

public function varkSpanksTwoSpankHarder():void
{
	clearMenu();
	clearOutput();
	showVark(true);
	
	var nextButton:Boolean = true;
	
	IncrementFlag("VARK_SEXED");
	
	if (varkGotCollar())
	{
		nextButton = false;
		IncrementFlag("VARK_COLLAR_IN_A_ROW");
		output("You don’t know how long you sleep, your body nigh-comatose from your time as his " + (pc.hasVagina() ? "breeder" : "bitch") + ", but when you finally awaken, you muscles are heavy as if he was still on top of you. Your overtaxed nerves are faintly tingling even now, the lingering scent of your potent lovemaking forcing you to long for him to return. You simply bask in the deluge of your memories as you lay there, shivering in the cold and absolutely drenched in your combined fluids. He returns to you eventually, kneeling down to gently rub a warm washcloth along your [pc.skinFurScalesNoun].");
		output(" You have no idea where he got the cloth or hot water, but you don’t care, it feels like being kissed by angels on every inch of your body. He works tirelessly to rub the sting and tension out of your limbs, and the cum off of them. When he’s finally done cleaning you, he plops down beside you, rolling your limp body over to snuggle you back into his chest. He licks the back of your neck softly and you sigh in exhaustion, fading back into the warmth of his embrace until you’re unconscious yet again.");
		if (flags["VARK_COLLAR_IN_A_ROW"] == 2 || flags["VARK_OFFERED_STAY"] == 2) varkOfferStay();
		else
		{
			nextButton = true;
			output("\n\nAfter a few days of tender aftercare, you’re ready to leave his cave, and he carefully helps you get dressed, sending you off with a gentle kiss and a grope.");
			//Day + up to two extra days
			processTime(24*60+rand(24*60*2+1))
		}
	}
	else if (flags["VARK_SEXED"] == 1)
	{
		output("You return to consciousness hours later, your entire body sore and violently tingling, in Vark’s massive furred arms. You shudder as you inhale the salty, masculine smell of his fur. Being this close to him, and so soon after hours of violent lovemaking, it’s as potent a dose as you’ll ever get. You’re still a bit dizzy, and you bask in it for what feels like days before you finally feel ready to leave. He’s snoring softly, oddly peaceful for such a massive guy, and you carefully peel yourself away from him,");
		if (!pc.isNude()) output(" putting on your [pc.gear] and");
		output(" journeying back out into the unforgiving cold.");
	}
	else 
	{
		nextButton = false;
		if (flags["VARK_SEXED"] == 7) varkForceCollar();
		else if (flags["VARK_SEXED"]%2 == 0) varkOfferCollar();
		else
		{
			showBust();
			author("Damiekinz♥");
			showName("VARK’S\nCAVE");
			nextButton = true;
			output("You awaken some time later, and Vark is nowhere to be seen.");
			if (pc.isNude()) output(" Free of your bindings, your shrug it off and return to the raging wind outside.");
			else output(" You’ve been freed of your bindings and sloppily refitted with your [pc.gear]. It seems he tried to do a favor, albeit poorly. You right yourself and put your gear in proper order, marching back into the unforgiving cold.");
		}
	}
	
	processTime(3*60 + rand(121));
	
	if (nextButton) addButton(0, "Next", varkLeavePhysically);
}

public function varkOfferCollar():void
{
	switch (flags["VARK_SEXED"])
	{
		case 2: output("When you finally awaken, you find Vark crouching over you, thoughtfully inspecting your neck and reaching down to stroke it, sending a shudder through you. <i>“Neck bare. Too bare for Toy. Vark fix. Vark make for Toy.”</i> He holds out a thick leather collar, adorned with smooth emerald stone on all of its facets. You reach out to touch it, and the glimmering surfaces sends jolts of pleasure down your arm, causing you to gasp softly and pull back. <i>“Toy want?”</i>"); break;
		case 4: output("Vark is massaging that collar from before in his paw, staring down at you thoughtfully. He says in strained, yet gentle tone that borders on commanding, clearly not looking to be refused again. <i>“Toy put on. Toy will like.”</i>"); break;
		default: output("You awaken with Vark’s paw possessively on your neck, a glint of impatience in his eyes. He speaks curtly, commanding without doing so directly. <i>“Toy put on. Vark know best.”</i> His stubborn insistence is a bit disconcerting, but after a moment his expression lightens. <i>“Vark want Toy happy.”</i> You imagine he does, but he seems to think this is the only way to make sure that happens."); break;
	}

	addButton(0, "Yes", varkCollarChoice, true, "Yes", "He’ll probably be a bit more welcoming to your presence here if he thinks he owns you...");
	addButton(1, "No", varkCollarChoice, false, "No", "You don’t really want to be Vark’s pet.");
}

public function varkForceCollar():void
{
	output("Deigning not to give you proper time to recover, Vark kneels down beside you and rolls you over to grip your neck. You whine and squirm, but he calmly and firmly holds you still, placing the collar around your neck and securing it in place. As soon as it locks around your skin, pleasure shoots through your body, making you wail deliriously. He chuckles and straddles your stomach, facing your lower half and");
	if (pc.isHerm()) output(" sliding his fingers into your pussy while gripping your shaft, rubbing them in sync with your caterwhauling.");
	else if (pc.hasCock()) output(" gripping your shaft firmly in his strong, soft paw, stroking you sensually. The overtaxed nerves of your [pc.cocks] drawing whimpers of forced pleasure out of you, and you bite your lip to avoid crying out.");
	else if (pc.hasVagina()) output(" his fingers diving into your muff, spreading you and playing with your walls. The penetration so soon after sex makes you squeal and writhe, gasping for air.");
	output(" The thrumming tingles fill a space beneath your [pc.skinFurScalesNoun] you didn’t even know was there, and you’re utterly helpless against the assault his paw" + (pc.isHerm() ? "s levy" : " levies") + " against your [pc.groin].");
	output("\n\n<i>“Toy learn. Toy in place.”</i> He continues pleasuring you, sending blasts of molten heat into your belly and an orgasm thundering through your brain, your entire body flailing, almost insensate, as you unload your sexual fluids all over his " + (pc.isHerm() ? "paws" : "paw") + ". He stands and walks away, leaving you to wrestle with this newly inspired mental submission. After a while you manage to drag yourself to your feet, stroking the collar thoughtfully and flinching as it bathes you in pleasurable heat on contact. You gather your [pc.gear] and exit his cave, looking down and tentatively touching the collar again. You suppose nothing is forcing you to keep it on, especially after not asking for it, but...");

	addButton(0, "Keep Collar", varkCollarChoice, true, "Yes", "You can’t lie, Vark is right. You belong this way.");
	addButton(1, "Toss Collar", varkCollarChoice, false, "No", "After he forced this collar on you like that that, you don’t want to risk going back there.");
}

public function varkCollarChoice(accept:Boolean):void
{
	clearMenu();
	clearOutput();
	showVark();
	
	processTime(5);
	
	var nextFunction:Function = varkLeavePhysically;
	var tempVark:Creature = new MilodanMale();
	
	if (accept)
	{
		pc.createKeyItem("Vark's Collar", 0, (/* forced */ flags["VARK_SEXED"] == 7 ? 1 : 0), 0, 0);
		flags["VARK_CAN_ASK_PAST"] = 1;
		toggleCollar("Vark's");
		switch (flags["VARK_SEXED"])
		{
			case 7:
				output("You hum softly and stroke the collar, luxuriating in the warm, pleasant waves it pushes into your body, and decide it’s not so bad after all. Vark was... no, <i>your master</i> was right all along.");
				break;
			default:
				output("You take the collar out of his hand, shivering all over from the electric tingling the stone pumps into your nerves. You look up at him and nod, spurring him to smile in a way that makes your heart leap. <i>“Vark glad. Toy make good choice.”</i> He gently unlatches it, putting it carefully around your bare throat and clasping it. When it’s finally secure, you sit there shivering, the constant contact with the pleasure-inducing stone setting your nerves awash with warmth. He kisses you on the forehead and you sigh, happy to have pleased him.");
				output("\n\nYou whine quietly at the overwhelming arousal coursing through your veins, spurred by your master’s musk and the stones of your collar. You look up at him pleadingly and he smirks. You can tell quite plainly that he knows what you want. He cups your chin and grips his cum-laden shaft. <i>“Good Toy. Take Reward,”</i> he purrs. A reward? Your master sure is generous. You press forward and wrap your lips around the barbed head of his cock, your [pc.groin] tingling uncontrollably at the taste of his seed. You resist the urge to play with yourself, confident in Master’s ability to get you there; he always does. His paw grips your head as you inhale his wonderful scent,");
				output(" the dizzying mix of sensations driving you to moan around his fat shaft. He presses eagerly to the back of your throat, a long purr rolling through his belly. You can’t even dream of gagging, of not readily taking every inch of him inside you. He is your generous master, and you will not squander this reward. He grunts and begins to fuck your mouth, his furry balls slapping your chin, surely churning as they prepare your gift. Just the thought that he’ll soon grace you with the taste of his release has you cumming, your thighs and the ground beneath you basted in your fluids as your [pc.groin] " + (pc.isHerm() || pc.hasCocks() || pc.hasVaginas() ? "overload" : "overloads") + " with heat and sensation.");
				output("\n\n<i>“Good Toy,”</i> he grunts, and you know it to be fact. Your master would never lie to you, and it pleases you to know that he’s satisfied by your efforts. His wants are yours, and as he wants to grace you with his delicious cream, you desire more than anything to receive it. And so, drowning in his musk and grunted praise, you do. Over and over, for hours. Your stomach filling with his bountiful heat, until at last darkness takes you.");
				pc.loadInMouth(tempVark);
				pc.loadInMouth(tempVark);
				pc.changeLust(60);

				nextFunction = varkCollarFuckEpilogue;
				break;
		}
	}
	else
	{
		switch (flags["VARK_SEXED"])
		{
			case 2:
				output("You tell Vark that you don’t want to take it this far.");
				output("\n\nVark grunts and massages the collar in his paw, disappointment blooming on his face as he waves you off. You feel a spike of " + (pc.isNice() ? "shame in your gut" : (pc.isMisch() ? "embarrassment" : "annoyance")) + " as you gather up your belongings and exit his cave.");
				break;
			case 4:
				output("You tell Vark again that you don’t want to take it this far.");
				output("\n\nHe stares coldly at you for a while, long enough that your heart begins to race. Is he going to do something? He sees the reactionary tension in your body and his face softens, purring gently as he pets your head. <i>“Is okay. Vark know Toy. Toy make right choice. Ask later.”</i> He sends you away with a gentle pat on the ass, leaving you to gather your thoughts in the cold outside.");
				break;
			case 6:
				output("You tell Vark yet again that you don’t want to take it this far.");
				output("\n\nVark grimaces, his hand twitching around the collar, but he stays still. Then he closes his eyes and huffs, his jaw shifting as he visibly prevents himself from lashing out. When his eyes open again, they are softer, and he sighs. <i>“Next time Vark choose. Toy not know what best.”</i> A bit bewildered by the blunt implication of his statement, you exit his cave.");
				break;
			case 7:
				output("You tear the collar off and toss it into the snow at your feet, rubbing your bare neck. What an asshole. You resolve to never return, refusing to allow him to take control of you against your will.");
				flags["MET_VARK"] = 2;
				break;
		}
	}
	
	addButton(0, "Next", nextFunction);
}

public function varkCollarFuckEpilogue():void
{
	clearMenu();
	clearOutput();
	showVark();
	
	var tempVark:Creature = new MilodanMale();
	
	output("When you awaken, your master sleeps among his furs, snoring peacefully after having slaked his lusts with your eager mouth. You sigh wistfully");
	if (pc.isNude()) output(" and gather your [pc.gear]");
	output(", exiting into the snow outside.");

	if (pc.hasVagina()) pc.loadInCunt(tempVark, rand(pc.vaginas.length));
	pc.loadInAss(tempVark);
	
	pc.orgasm();
	processTime(4+rand(181));
	IncrementFlag("VARK_SEXED");
	
	addButton(0, "Next", varkLeavePhysically);
}

public function varkOfferStay():void
{
	flags["VARK_COLLAR_IN_A_ROW"] = 0;
	IncrementFlag("VARK_OFFERED_STAY");
	if (flags["VARK_OFFERED_STAY"] < 3)
	{
		output("\n\nWhen you next awaken, Vark is straddling your belly");
		if (flags["VARK_OFFERED_STAY"] == 2) output(" again");
		output(", gently massaging your [pc.chest]. You moan weakly and smile up at him, reaching towards his loincloth to return the affection, but he softly bats your hand away. <i>“No. Toy only get if stay.”</i> You nod and smile, telling him that you’d love to stick around for some more fun, he’s such a great- <i>“No,”</i> Vark clarifies, <i>“Toy stay for life.”</i> He stares deep into your eyes as he slides one paw up to grip your collar, pressing the Savicite into your skin and sending pulses of bliss into your core. You bite your lip and huff, that’s cheating!");
		output(" You fume for a bit before the cold realization of his statement washes over you, and you return his gaze. He really means it, that he wants you to stick around for good. You’d be abandoning everything you’ve worked up until now, you’d be submitting yourself to a life of servitude beneath this bundle of muscle and fur... having amazing sex for the rest of your life.");
		output(" He uses his free hand to tug off his loincloth, his cock hardening against your stomach as he pins your wrists down on either side of your head to prevent you from touching him. The wave of potent musk that rolls off of his shaft makes you dizzy, and you moan. You can’t think about much of anything besides the fact that you really want it inside you right now. That is, until he breaks you out of your daze with a grunted ultimatum: <i>“Alien stay, Alien get cock.”</i>");
	
		addButton(0, "Yes", varkStayForever, true, "Yes", "You doubt you’ll ever leave his cave if you agree to this.");
		addButton(1, "No", varkRefuseStay, undefined, "No", "As enticing as the experience sounds, you’d rather not give up your inheritance to your Cousin.");
	}
	else varkStayForever(false);
}

public function varkRefuseStay():void
{
	clearMenu();
	clearOutput();
	showVark();
	
	output("You shake yourself free from the lustful thoughts he’s forced upon you and look up at him, slowly shaking your head. <i>“I’m sorry master, I can’t give up everything I’ve worked for, not yet.”</i>");
	if (flags["VARK_OFFERED_STAY"] == 1) output(" He frowns and shakes his head, getting up off of you and helping you get geared up before waving you off somewhat somberly.");
	else output(" He scowls in disappointment, but his grip on you doesn’t relent.\n\n<i>“When ready, Toy come back. Vark take then.”</i> He stands up off of you, helping you to your feet and sending you off after you redress with a swat on the butt.");

	addButton(0, "Next", varkLeavePhysically);
}

public function varkStayForever(agreed:Boolean):void
{
	
	if (agreed) 
	{	
		clearMenu();
		clearOutput();
		showVark();
		output("You can’t lie to yourself anymore, he’s all you’ve ever wanted, you can’t dream of a life without being his mate, without " + (pc.hasVagina() ? "raising his kits." : "warming his bed.") + " You nod happily, melting into his ravenous, sloppy kisses. His dick hardens and throbs against your belly as you give yourself to him, his hot pre-cream glazing you with the realization that he gets to keep you forever. You wouldn’t have it any other way.");
	}
	else
	{
		output("You awaken to Vark straddling your stomach yet again, but this time the look in his eyes is determined and confident. He doesn’t care what you think you want anymore, he’s going to give you what you need. You knew this would happen. He warned you, but you couldn’t resist him anyway. You wanted this whether you were willing to admit it to yourself or not. More than anything, you realize you needed to put this in his capable, loving hands. You needed to let him show you where you belong.");
		output(" You were too weak to give yourself up all on your own, but you knew exactly what you had to do to get Vark to take charge. You look up at him and whine, shivers running through you at the toothy smile that it draws from him.\n\nHe carelessly tosses his loincloth aside, letting his musk wash over you to push you into the splendid void of submission. Part of you struggles against it for a moment, the part of you that wants to complete the quest your father laid out for you, but the rest of you doesn’t give the slightest fuck.");
	}
	
	addButton(0, "Next", varkBadEnd, agreed);
}

public function varkBadEnd(agreed:Boolean):void
{
	clearMenu();
	clearOutput();
	showVark();
	if (agreed)
	{
		output("He spends the next month and a half fucking your brains out, making sure every hole big enough to house his cock gets thoroughly reamed. You find that most days you don’t remember much that happened before this. Was there anything before this? It doesn’t really matter, Master is home. He smiles at the sight of you, and it makes your body buzz and your mind sizzle. He lights a star in your chest, and you don’t bother trying to contain it, crawling over to worshipfully kiss and lick the fur on his thighs as you moan with sincere need.");
		if (pc.isHerm()) output("\n\nYour [pc.cocks] " + (pc.hasCocks() ? "are" : "is") + " all bound at the base by savicite rings that never come off, a pair of thinner bands inside your nipples. They keep you endlessly on the brink, every hole relaxed and dripping for him. It’s frustrating when he leaves you alone for hours sometimes, you’re never able to sate the fire it puts inside by yourself. You can’t complain though, it makes Master happy, and makes the sex <b>phenomenal</b> when he is around. He strokes your pregnant belly, purring as you moan and quiver, the slightest grace of a claw-tip like a white hot lance of ecstasy. You hope he fucks you soon, it’s getting unbearable to be away from him for this long.");
		 else if (pc.hasCock())
		{
			if (pc.hasCocks()) output(" Your [pc.cocks] are bound at the base by savicite rings that never come off, keeping your shafts");
			else output(" Your [pc.cocks] is bound at the base by a savicite ring that never comes off, keeping your shaft");
			output(" endlessly erect" + (pc.balls > 0 ? ", your nuts broiling" : "") + " and your [pc.anus] feeling achingly empty. You work tirelessly when he’s around to please him and sate the boundless heat that fills your flesh. You never can, and part of you knows the truth: you never will. You wait obediently, shivering from the cold and your lust, for him to fuck you.");
		}
		else if (pc.hasVagina()) output(" Master pierced your nipples as soon as you began showing the first signs of pregnancy, your [pc.chest] slightly plumping with every day that slides by. The rings of emerald stone keep your holes gooey and pliant and agonizingly alight with pleasure, and you’d sell your soul and then some to have him inside you, but you wait patiently for him to ask, as you’ve been trained.");

		output("\n\nToday though, he seems to have different plans, he hooks your collar into your leash and helps you into a fur harness. You realize that he must be taking you somewhere, it’s the only reason you’d need it. You haven’t worn clothes since the day you took your rightful place beneath him, and you can’t say you miss them. It was always such a chore to take all of that clunky gear off when you wanted to service your Master.");
		output("\n\n<i>“Come, Toy,”</i> he barks, and you obediently crawl after him as he exits into the snow and biting wind outside. You’re pretty sure you had a name before you met Master, but you don’t remember it anymore. You like <i>“Toy”</i> better anyway, it does what names are supposed to do: describe the function of the object. He leads you through the snow for a long time and you begin to shiver. The fur cloaking your body is warm and soft, but the snow makes the bottom of it wet, and that makes it a bit uncomfortable to take a trip this long in the cold. You do your best to ignore it, Master clearly has something important planned if he’s putting you through this to get there.");
		output("\n\nYou finally come upon a thick icy wall around what appears to be a small village of tents. The people milling about look a lot like Master, and a shiver of excitement runs through you. Are you going to get to play with all of them? He notices you lagging behind as you stare, and tugs on your leash, shocking you out of your wonder. You whine in apology and trot obediently beside him until he stops in front of the biggest tent in the compound.");
		output("\n\nFrom within comes a very handsome elderly cat-man. He looks a lot like Master, and you smile up at him, hoping you get to see what’s under his robes soon. Master and the older man speak in Master’s secret kitty talk, and you sit there contentedly, smiling warmly at the other kitties as they give you odd looks. Some of them regard you with curiosity, others with obvious lust, palming their loincloths. You give them an eager look that you hope lets them know you want them as much as they want you. At last, Master turns to you, dropping his loincloth and smiling. <i>“Lick, Toy.”</i> Every cell in your body jumps with joy, and you obey.");
		
		addButton(0, "Next", varkBadEndII);
	}
	else
	{
		output("The next few weeks consist entirely of the two of you in a sweaty tangle, every inch of your body becoming acquainted with fresh batches of your mate’s thick, silky cream. He breaks you, tenderly soothes your aching body, then breaks you again. It’s an endless cycle that nearly makes you forget ever having set foot outside of his cave.");
		if (pc.hasCock()) output(" Vark seems to respect how long you held out against his advances, and on days where you manage to bring down unusually large game together, he celebrates by taking you inside him, his plump, furry cheeks wobbling hypnotically against your lap as he bounces on your [pc.biggestCock] and greedily kneads your thighs.");
		if (!pc.hasVagina()) output(" You cling to each other night after night, your combined grunts and gasps echoing against the cave walls as you make vigorous love, your bodies melting and sliding against each other until you’re one together among his furs.");
		if (pc.hasVagina()) output(" He makes sure to be gentle on you when you begin swelling with his litter, deigning to carefully stuff your [pc.anus] instead. He spends hours basking in the afterglow with you, massaging your hormone-addled body and tenderly licking and kissing every inch of your flesh. After a few glorious years in his bed your shared den begins filling with new life, a big happy family growing around you.");
		output("\n\nSome nights you venture outside and gaze up at the distant stars, wondering what could’ve been, where your cousin ended up. After all this time, you wonder if anybody even noticed you were gone. Your mind wanders for a while longer, but then his paws are on you, tracing every curve and feature, pulling you closer to bathe you in his familiar musk and tender embrace. He draws those thoughts right out of you with kisses and strokes as he leads you back home, suggestive purrs and whispered promises tickling your ears and pushing a tingling heat into your loins. Barely a minute later you’re pressed to his bedding again, grinding and panting and screaming each other’s names as you give in to your passion and forget everything else. He is your mate, your love, the one you chose to throw everything away for. You spend the rest of your days there with him, and you don’t regret a single one.");
	
		badEnd("The End.");
	}
}

public function varkBadEndII():void
{
	clearMenu();
	clearOutput();
	showVark();

	output("After a lengthy demonstration of your many talents as Master’s Toy, you and Master are given your own sizeable tent where you eat, sleep, and fuck, all day long. You spend your days in the company of Master and his many other big kitty friends, serving them the same way you used to only serve him, and you have the time of your life. Your master is perfect of course, but he has to stop fucking you <b>sometimes</b>, probably to make sure he doesn’t hurt you or something.");
	output("\n\nAll of these other gorgeous felines don’t though, and when he lets them, they use your body all day and all night, only letting you rest for a few hours in between. On the rare occasion you sleep deeply enough to dream, you dream of those same fat feline dicks in every hole. Fortunately for you, it’s a dream you live every morning when you wake up.");

	badEnd("Game Over.");
}
