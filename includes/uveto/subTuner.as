//Finding the Collar
//This text should go up in some room on Uveto Station.

public function subTunerBonusButts():void 
{
	if(((pc.hasCock() && pc.smallestCockVolume() < 1000) || pc.hasVagina()) && !pc.isTaur() && !pc.isNaga())
	{
		if(flags["SUB_TUNERED"] == undefined)
		{
			output("\n\nThere’s a small parlour table nearby, all white and shiny with a pair of chairs to match, but more importantly, you can see the tell-tale glint of light on metal beneath one of the ivory seats.");

			//[Metal] Check out whatever is under that chair. //PC cannot be taur or naga, requires cock or vag. Probably shouldn’t appear for those that can’t use it in the first place.
			addButton(0,"Metal",uvetoSubtunerCollectionBootyButtsSupremeEatDabootyLikeGroceries,undefined,"Metal","Check out whatever is under that chair.");
		}
		else 
		{
			output("\n\nThe door to Accu-Pitch labs is here to the south, but it's locked. Do you want to find a way back in?");
			addButton(0,"Enter Lab",accupitchLabBonus);
		}
	}
	setNavDisabled(NAV_SOUTH_DISABLE);
}

public function showBelle(nude:Boolean = false):void
{
	showName("\nBELLE");
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	showBust("BELLE" + nudeS);
}

public function subTunerUpgraded():Boolean
{
	return false;
}

//[Metal]
public function uvetoSubtunerCollectionBootyButtsSupremeEatDabootyLikeGroceries():void
{
	clearOutput();

	output("Walking over to the sleek white table, you ");
	if(pc.isBimbo()) output("bend all the way over");
	else output("kneel down");
	output(" to get a better look at whatever it is that’s under there. It seems as though it’s not entirely metal, but some sort of more pliable material covered in circuitry and wiring. With your curiosity piqued you extend a hand to reach for the strange mess of electronics.");
	output("\n\nStraightening yourself again, you bring the device a bit closer to your face in order to get a better look: It’s a collar, no doubt, made of leather, all black and shiny. It’s covered in complex circuitry, ");
	if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output("all leading to what appears to be acoustical equipment, ");
	output("and where you’d expect a normal buckle to be is an electro-magnetic seal. On one of the larger pieces of wiring, you’re able to make out the words <i>“Sub-Tuner”</i> stamped into the metal.");
	output("\n\nWeird.");
	output("\n\nIf you were the adventurous sort you could probably try this thing on, and if you’re not: you could always just put the collar back where it was, safe and sound.");

	processTime(5);
	//[Put It On] Try this thing on. Obviously something could go very, VERY wrong.
	//[Leave It] Put the collar back where you found it.
	clearMenu();
	addButton(0,"Put It On",putOnACyberneticDoggieCollarBecauseYoureNotVerySmart,undefined,"Put It On","Try this thing on. Obviously something could go very, VERY wrong.");
	addButton(1,"Leave It",leaveTheSubTuner,undefined,"Leave It","Put the collar back where you found it.");
}

//Put it on
//[Put it on]
public function putOnACyberneticDoggieCollarBecauseYoureNotVerySmart():void
{
	clearOutput();

	output("Abandoning whatever caution you may have had before, you bring the collar to your neck, slowly wrapping it around your nape until the two ends of its buckle are right next to each other. Well, you’ve come this far already, no turning back now. You let the two electro-magnets snap closed together with a metallic <i>ca-thunk</i>, and as soon as the buckle is well and shut, a small red light turns on. Shortly after the crimson beacon starts blinking in the corner of your eye, the collar starts to emit a soft metallic hum. You feel your thoughts growing hazy as that gentle noise floods your mind.");
	output("\n\nIt’s as if your own body is becoming heavier under the weight of the sound, almost to the point where you consider sitting down before a static-filled voice coming from the collar breaks your focus.");
	output("\n\n<i>“Well, well,”</i> is the first thing you hear; the voice is poised, and most definitely feminine, <i>“Looks like someone other than me finally found my collar.”</i>");
	output("\n\nYou try to respond but nothing comes out. <i>All you feel is that static hum compelling you to stand there and wait for that voice again.</i>");
	output("\n\n<i>“Just be a dear and stay there for a moment,”</i> the voice calls out from the collar again, <i>“I’ll be there soon to get my property back.”</i>");
	output("\n\n<i>That... that sounds exactly like what you want to do.</i> Once again that steady humming makes your body feel heavy and you think you should take a seat some- no, no... that won’t do; <i>you need to lower yourself, and wait for whoever’s voice that was to come get you</i>.");
	output("\n\nYou quickly fall to the ground on all fours; <i>yeah, that feels good</i>.");

	processTime(10);
	//[Next] //Should go to <i>“Meeting Belle”</i>.
	clearMenu();
	addButton(0,"Next",meetingBelle);
}

//Leave it
//[Leave it]
public function leaveTheSubTuner():void
{
	clearOutput();

	output("Knowing full well that this thing is not your average collar, you carefully place the ring of leather and wires back where you found it, right under the chair.");
	output("\n\nMaybe someone meant to leave it there?");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Meeting Belle
public function meetingBelle():void
{
	clearOutput();

	output("You wait there for a while, not feeling any need to move from where you are. <i>Resting here on your hands and knees feels perfect.</i> A few passersby give you strange looks, but you can’t really bring yourself to care; all you can really do is wait here on all fours, feeling happy more than anything else.");
	output("\n\nOnly a little more time passes before you hear the same voice you heard from the collar, though this time it’s free of the static from earlier.");
	output("\n\n<i>“Ah, there you are,”</i> the voice says, causing you to turn your gaze towards what looks to be a human woman. She’s got a very wide set of hips that only draw attention to an even more impressive derriere... along with the enormous bulge opposite that. You move your gaze up past her slim waist and comparatively large breasts, double-Ds at the least, to a jaw-droppingly feminine face: pouty lips and green eyes. Her long, black hair is being kept in a ponytail, keeping it away from her fair skin and the lab coat she’s wearing. All you can feel looking at her is an overwhelming want, your whole body eagerly awaiting whatever it is she has to say.");
	output("\n\n<i>“Mmmm,”</i> she coos, letting her eyes run up and down your form, <i>“What do we have here?”</i>");
	output("\n\nYou try to speak, but nothing’s coming out of your mouth, your [pc.lipsChaste] refusing to move. <i>No, silence will do for now.</i>");

	output("\n\nThe woman suddenly reaches a hand down toward your head followed by a sense of growing eagerness on your part. You close your eyes in anticipation, awaiting her touch, <i>no longer worrying about that pesky collar</i>");
	if((pc.race().indexOf("ausar") >= 0 || pc.race().indexOf("kaithrit")) && pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG))
	{
		output("; your [pc.tail] even start");
		if(pc.tailCount == 1) output("s");
		output(" to wag without you noticing");
	}
	output(".");

	output("\n\nThen your [pc.ears] are greeted by the gentle <i>clink</i> of metal on metal.");
	output("\n\nYou open your eyes to reveal your mystery woman straightening herself, holding a leash in her hand as you come to the realization that you’ve just been thoroughly collared and tethered; <i>but that’s not really a bad thing is it?</i>");
	output("\n\n<i>“Unfortunately for you,”</i> the woman says with more than a bit of condescension in her voice, <i>“Before I can take the collar off, I’m going to have to bring you back to my lab and you’re going to have to participate in a few... experiments, but by the looks of things you don’t mind that. Do you?”</i>");
	output("\n\n<i>No! Of course you don’t mind. You don’t think you could find a way to mind with such a lovely lady holding your leash,</i> and you shake your head to tell her such.");
	output("\n\nThe woman smiles before reaching a hand down to give you a pat on the head, causing a wave of ecstasy to shoot down your spine when her hand makes contact, <i>“Good, then come along, </i>pet<i>.”</i>");
	processTime(7);
	clearMenu();
	addButton(0,"Next",getSubTunered);
}

public function getSubTunered():void
{
	clearOutput();
	showBelle();
	currentLocation = "SUBSHIT";
	generateMap();
	output("You are led around by this wonderful woman around the wabeship that is Uveto station, crawling along the floor until you reach what must be the scientist’s lab.");
	output("\n\nFinally walking inside behind the scientist, your eyes are greeted by a wealth of scientific equipment: blinking lights and computers, and bundles of wires lining the walls of the small lab. Though, beyond that most of the equipment seems to be related to audio: radios and speakers, various instruments lined up next to microphones, even a row of wine glasses and spoons placed carefully near a group of transceivers.");
	output("\n\n<i>“Welcome,”</i> the lady-scientist exclaims, extending an arm, <i>“To Accu-Pitch labs, or </i>my lab<i>, if you want to get specific.”</i> She turns around to look down at you, <i>“What you’re wearing there is one of my inventions. I call it the Sub-Tuner. It releases a series of harmonic frequencies that alter brain patterns, making the wearer more submissive and... suggestible, but I’m sure you’ve already noticed that.”</i>");
	output("\n\nWell, that does explain a lot, but you can’t work up the drive to question anything that’s going on right now. <i>All you want to do is await more orders</i>, so you content yourself to sitting there on your hands and knees, looking up at the black-haired woman with a smile on your face ");
	if((pc.race().indexOf("ausar") >= 0 || pc.race().indexOf("kaithrit")) && pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output(", [pc.tails] swaying gently");
	output(".");

	output("\n\nShe grins back down at you before continuing, <i>“The specific collar you’re wearing is one of my latest prototypes, and it has a few new features which you’re going to help me test; isn’t that right?”</i>");

	output("\n\n<i>Of course! That’s what you’re here for.</i> You turn to gaze up at the lady-scientist, giving her a nod and a big grin.");

	output("\n\n<i>“Good,”</i> she begins, <i>“I assure you I will have that collar off you once all my tests are complete, but in the meantime, I suppose we should get started.”</i> The wide-hipped woman takes a few strides closer to you, <i>“I’m Belle, by the way, and you... you’re my little pet, for now.”</i>");
	flags["MET_BELLE"] = 1;

	output("\n\n<i>That sounds wonderful.</i>");

	processTime(13);

	//[Next] //Should go to the kennel scene.
	clearMenu();
	addButton(0,"Next",kennelSubTuner);
}

//Repeatable opening
//Text for Accu-Pitch Labs tiles.
public function accupitchLabBonus():void
{
	clearOutput();
	showBelle();
	currentLocation = "SUBSHIT";
	generateMap();
	//firstTime:
	if(flags["ACCUPITCH_VISIT"] == undefined)
	{
		output("Making your way up to Accu-Pitch labs, you can see that the door is sealed and well-locked, but there’s a small scanner next to the entrance. Maybe it will recognize one of Doctor Belle’s test subjects?");
		output("\n\nYou start with your eye, but the scanner does nothing, then your palm, then your fingertips, but nothing seems to be doing the trick.");
		output("\n\nWait, could it be that barcode the woman-scientist put on your ass? Well, it’s worth a shot. You ");
		//notNude:
		if(!pc.isAssExposed()) output("drop your [pc.assCover] just enough so that the tattoo peeks out and} place your [pc.butt] close to the scanner. Sure enough, the little holo-pad picks up on your barcode and scans it with an approving <i>blip</i>, the door hissing open soon after...");
	}
	//repeat:
	else
	{
		output("Walking your way up to Accu-Pitch labs, you can see that the door is once again sealed and locked, that all-too familiar scanner sitting next to the entrance.");
		output("\n\nJust like last time, you ");
		if(!pc.isAssExposed()) 
		{
			output("drop your [pc.assCover]");
			output(" just enough so that the tattoo peeks out and ");
		}
		output("place your [pc.butt] close to the scanner.");
		if(pc.exhibitionism() >= 33 || pc.isBimbo()) output(" You feel a slight rush as your private-areas are examined by the door, loving something about being treated like this.");
		else output(" You’re met with a slight pang of embarrassment when your ass meets the scanner, though, you feel as though some part of you is actually enjoying the experience.");
		output(" Sure enough, the little holo-pad picks up on your barcode and scans it with an approving <i>blip</i>, the door hissing open soon after...");
	}
	output("\n\nWalking into Accu-Pitch labs again, your eyes are greeted by a wealth of scientific equipment: blinking lights and computers, and bundles of wires lining the walls of the small lab. Though, beyond that most of the equipment seems to be related to audio: radios and speakers, various instruments lined up next to microphones, even a row of wine glasses and spoons placed carefully near a group of transceivers.");
	output("\n\nBelle is nearby, her pants looking as full as ever, jotting down notes on a holo-pad as she moves from terminal to terminal, working diligently.");
	clearMenu();
	addButton(0,"Belle",approachBelle,undefined,"Belle","");
	addButton(14,"Leave",move,rooms[currentLocation].northExit);
}

//[Belle]
public function approachBelle():void
{
	clearOutput();
	showBelle();

	output("You walk up to Belle, alerting her to your presence along the way. She quickly turns around and greets you with a smile.");
	
	clearMenu();
	if(((pc.hasCock() && pc.smallestCockVolume() < 1000) || pc.hasVagina()) && !pc.isTaur() && !pc.isNaga()) 
	{
		output("\n\n<i>“Ah, hello again. Here to assist me with some more experiments?”</i>");
		addButton(0,"Experiments",experimentsWithBelle);
	}
	else
	{
		output("\n\n<i>“Ah, hello again. It seems you don't have quite the right body for more experiments. Come back when ");
		if(pc.isNaga() || pc.isTaur()) output("you can properly crawl around like a pet");
		else if(pc.hasCock() && pc.smallestCockVolume() >= 1000 && !pc.hasVagina()) output("you have a reasonably sized phallus.");
		else output("you have decent genitalia");
		output(".”</i>");
		addDisabledButton(0,"Experiments","Experiments","You don't have the right body for the experiments she wants to perform.");
	}
	addButton(14,"Leave",move,"UVS F9");
}

public function wearingSubTuner():Boolean
{
	return ((pc as PlayerCharacter).hasKeyItem("Sub-Tuner Collar"));
}

//[Experiments]
//Experiments
public function experimentsWithBelle():void
{
	clearOutput();
	showBelle();
	output("You tell Belle that you would very much like to help her with more of her experiments, resulting in a big grin from your soon-to-be master.");

	//notWearingSubTuner:
	if(!wearingSubTuner())
	{
		output("\n\nFumbling around for a moment, you take out the Sub-Tuner and hand it to the lady scientist, who quickly accepts the collar, wraps it around you neck, and closes it nice and tight.");
	}
	output("\n\nBefore another word can be said, the wide-hipped woman reaches out, and flips a single switch on the wired-up ring of ");
	//upgradedSubTuner:
	if(subTunerUpgraded()) output("metal");
	else output("leather");
	output(" around your nape. You can already feel submissive thoughts flooding your mind. <i>Void, you need orders, to be put in your place!</i>");

	output("\n\nLuckily for you, Belle is an attentive master, and is already giving you commands. <i>“Down, " + pc.mf("boy","girl") + ",”</i> she says, her voice gentle but commanding.");
	output("\n\nYou heed her order and quickly bring yourself down to all fours, ready as ever for what’s to come. A moment later, the lady scientist kneels down and attaches her leash to your collar, then brings herself to stand up straight again.");
	output("\n\n<i>“Alright then, pet,”</i> your new master says, <i>“Where do we start with you today?”</i>");

	processTime(3);

	clearMenu();
	//[Next] //Go to kennel
	addButton(0,"Next",kennelSubTuner);
}

//Kennel
//Cock takes priority over vag.
public function kennelSubTuner():void
{
	clearOutput();
	showBelle();
	//notNude:
	if(!pc.isNude())
	{
		output("Belle keeps a tight grip on your leash, tracing a circle around you and stroking her chin. <i>“Hmmm,”</i> she deliberates, <i>“No, these clothes you’re wearing won’t do at all. They’ll obstruct my readings, so I guess we’ll have to get them off won’t we?”</i>");
		output("\n\nYou can feel your mind go blank at that question, <i>unable to feel anything but excitement at that proposition</i>. Quickly pulling yourself together, you give Belle a nod, resulting in a confident smirk from the scientist.");
		output("\n\n<i>“Alright then, " + pc.mf("boy","girl") + ", sit up,”</i> she commands.");
		output("\n\nWithout a thought you heed her order, sitting yourself up on your knees, keeping your [pc.arms] curled up like a puppy’s and looking up at your master with growing eagerness. Belle slips down onto her knees, getting herself close enough to you that you can feel the heat radiating off her immense bulge. She grabs at your equipment and pulls it away until all your flesh is laid bare before her, leaving the lady scientist with a wide grin on her face, <i>“That’s more like it.”</i>");
	}
	else
	{
		output("Before she continues, your master takes a brief walk over to a nearby lab bench, turns on her computer, and grabs a rather familiar, small, rectangular device. Leaning down, Belle brings the device to the barcode she printed on your ass and flips it on, and before you can even say <i>“Science!”</i> a file labeled ");
		//anno/SyriCrew/SavedKiro:
		if(flags["SUBTUNER_NAMED"] != undefined) output("<i>“[pc.name] Steele”</i>");
		else output("<i>“Subject 69”</i>");
		output(" is brought up on Belle’s computer. Almost simultaneously, a little holo-tag appears on your collar: bright blue and ");
		//anno/SyriCrew/SavedKiro: 
		if(flags["SUBTUNER_NAMED"] != undefined) 
		{
			if(flags["SUBTUNER_NAMED"] == 1) flags["SUBTUNER_NAMED"] = 2;
			output("emblazoned with the name <i>“[pc.name].”</i>");
		}
		else output("bearing the same label as the file on Belle’s terminal.");
	}
	output("\n\nYour new master gazes at your naked form for a long moment before taking up a position behind you,  and you can practically feel her eyes scan your [pc.butt]. <i>You don’t turn to face her, though, because a good pet waits for their orders</i>. All you can do is sit there and tremble with anticipation as Belle kneels down behind you, <i>“I suppose you should be punished for taking things that don’t belong to you.”</i>");
	output("\n\nWith that said, a palm caresses one of your lower cheeks, causing you to gasp at the sudden sensation of your master’s warm flesh on yours, <i>“Yes, I think  you’ve been a very bad " + pc.mf("boy","girl") + ", taking my collar without my permission.”</i>");
	output("\n\nWithout a single warning you feel a second hand smack against your [pc.butt] with a great <i>slap</i>, making you cry out as your assflesh is reddened by Belle’s punishing strike.");
	output("\n\n<i>“Bad " + pc.mf("boy","girl") + ",”</i> she chides before delivering another slap to your more neglected cheek, sending a jolt of pleasure shooting through your spine, <i>“That’s a very bad " + pc.mf("boy","girl") + ".”</i>");
	output("\n\n<i>You can’t help but feel some sort of bliss when she does that, her words and strenuous smacks culminating in some burning desire deep within you.</i> <i>Yes, it feels so good to be put in your place.</i> You’re so turned on you barely notice your ");
	if(pc.hasCock()) output("[pc.cocks] stiffening with white-hot lust.");
	else if(pc.hasVagina()) 
	{
		output("needy quim");
		if(pc.totalVaginas() > 1) output("s");
		output(" leaking fem-lube onto the ground beneath you.");
	}
	output(" Your master notices, though.");

	output("\n\n<i>“What’s this?”</i> Belle questions, reaching a hand down ");
	if(pc.hasCock()) output("and around your back to get a firm grip on your [pc.cockBiggest],");
	else if(pc.hasVagina()) output("to trace a finger across your lube-leaking slit,");
	output(" <i>“Are you getting off on this, you dirty " + pc.mf("boy","girl") + "?”</i>");

	output("\n\nShe gives your ass another rough slap before ");
	if(pc.hasCock()) output("wraping her fingers around your already diamond-hard shaft and giving it a few pumps, drawing a little whimper from you in the process.");
	else if(pc.hasVagina()) output("sending a pair of her fingers into your sodden cunt, spreading your nether lips and drawing a little whimper from you in the process.");

	//hasCock:
	if(pc.hasCock()) output("\n\nWhile you’re suffering a barrage of spanks from one of Belle’s hands, reddening your ass with each repeated strike, her other hand slowly jerks you off until you’re lost in a sea of pleasure and pain.");
	//hasVag:
	else output("\n\nThe sensations of pleasure and pain leave your body tingling with bliss, with Belle’s fingers thoroughly filling your pussy, drawing in and out of your slick hole until you’re left moaning and whimpering, all the while her free hand delivers ass-reddening spanks to your [pc.butt].");

	output("\n\n<i>“Does the bad, dirty " + pc.mf("boy","girl") + " like that?”</i> the wide-hipped woman asks, giving your lower-cheeks another firm slap, making you moan.");

	output("\n\nYou’re only able to give the lady scientist a nod and a pitiful whimper, the need to cum overtaking your mind as pleasure burns in your loins, <i>but you can’t cum without your master’s permission</i>, and she knows that. Turning back to face Belle, you give her a good view of your needy gaze and a lustful whine.");
	output("\n\n<i>“What’s wrong, " + pc.mf("boy","girl") + "?”</i> she asks, <i>“Can’t cum?”</i>");

	output("\n\nYou give her another nod, barely able to hold back the wave of endorphins trying to flood your mind.");

	output("\n\n<i>“Good,”</i> she says plainly, ");
	if(pc.hasCock()) output("releasing her grip on your [pc.cockBiggest], leaving it there to twitch with near-orgasm and you to whimper,");
	else output("removing her fingers from your quivering cunt, leaving you leaking girlcum onto the floor with a whimper,");
	output(" <i>“That means the submission protocols are working better than I could have expected.”</i>");

	output("\n\nBelle stands herself up again, keeping a tight grip on your leash as she walks around in front of you again. Before she says anything else, the human woman bends down and gives you ");
	if((pc.race().indexOf("ausar") >= 0 || pc.race().indexOf("kaithrit"))) output("a scritch between your [pc.ears]");
	else output("an appreciative pat on the head");
	output(", <i>“Nice job with that test, " + pc.mf("boy","girl") + ".”</i>");
	output("\n\n<i>You did do a good job with that, didn’t you?</i> Though, a <i>“good job”</i> doesn’t exactly give your ");
	if(pc.hasCock()) output("painfully hard [pc.cockNounBiggest]");
	else if(pc.hasVagina()) output("slobbering pussy");
	output(" or your sorely-spanked bottom any relief.");

	processTime(25);
	pc.lust(75);
	clearMenu();
	addButton(0,"Next",walkiesWithBelleButt);
}


//[Next] //Go to walkies.
//Walkies
public function walkiesWithBelleButt():void
{
	clearOutput();
	showBelle();
	output("<i>“But,”</i> Belle begins, giving her finger a little waggle and walking towards the door of her lab in a way that makes her booty quake in the most perfect way, <i>“Why don’t we see just how far we can push those protocols?”</i>");
	output("\n\nYou’re not quite sure what that means, but ");
	//pcAusar/Kaithrit/Half:
	if((pc.race().indexOf("ausar") >= 0 || pc.race().indexOf("kaithrit")) && pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG))
	{
		output("your tail");
		if(pc.tailCount > 1) output("s wag");
		else output(" wags");
		output(" eagerly in anticipation for what’s to come");
	}
	else output("you smile up at your master, nothing but anticipation written across your face");
	output(".");

	output("\n\nBelle turns around to look over her shoulder at you, giving you a wide grin, <i>“How about we go for a walk, " + pc.mf("boy","girl") + "? Really put the Sub-Tuner to the test, how does that sound?”</i>");

	output("\n\n<i>");
	if(silly) output("WALKIES?!");
	else output("A WALK?!");
	output(" As if you could say no!</i> You quickly nod your head without any hint of hesitation, ready to heed any command the wide-hipped woman before you has to offer.");
	output("\n\nSmiling at your compliance, Belle gives your leash a tug and starts to walk out of the lab, <i>“Well then let’s get going, " + pc.mf("boy","girl") + ". We haven’t a moment of time to lose on this precious research.”</i>");

	processTime(3);
	clearMenu();
	addButton(0,"Next",walkiesPart2);
}

public function walkiesPart2():void
{
	clearOutput();
	showBelle(true);
	currentLocation = "UVS B9";
	generateMap();
	output("Belle leads you around Uveto station for quite some time, testing the abilities of her collar in all different ways. Sometimes she encourages you to go receive all manners of pets and praise from passersby, only to later chide you for talking to strangers, though, you can’t find yourself upset about it. <i>Your master knows best, after all.</i> Other times she instructs you to provide passing huskar, toves, and other aliens with a show, making you wiggle your butt in the air for them. Some of them respond to your teasing movements with slaps and gropes, ");
	//highExhib:
	if(pc.exhibitionism() >= 66) output("but you don’t mind, this being something you’d do without the help of Belle’s collar.");
	else output("but you don’t mind, <i>because being a good little pet is all the reward you need</i>.");

	//Random chance for one of these variant to occur if more than one requirement is met.
	
	var lover:Boolean = false;
	var choices:Array = [];
	if(annoIsCrew()) choices.push(0);
	if(syriIsCrew()) choices.push(1);
	if(roamingKiroAvailable()) choices.push(2);
	var select:int = -1;
	if(choices.length > 0) select = choices[rand(choices.length)];
	//annoCrew:
	if(select == 0)
	{
		output("\n\nAt one point, you’re walking through the pathways of the re-purposed wabeship when you come across your own white-haired ausar slut: Anno. She approaches you and Belle with a wide grin on her face, seeing you in a collar obviously being something she enjoys.");
		output("\n\n<i>“Hey there, boss,”</i> the ausar beauty calls out, causing you to look up at her, <i>“Hope you’re not having too much fun without me out here.”</i> Tossing you a quick wink, Anno turns her attention to Belle, who is just as interested in the snowy-haired pup as she is in you.");
		output("\n\n<i>“Oh, you must be a friend of my pet then?”</i> she asks, extending a hand and introduces herself as <i>“Dr. Belle Baslocvicz”</i> before she continues. <i>“Your ‘boss’ has been oh-so kind enough to help me with a few experiments here.”</i> Running her eyes up and down Anno’s curvy form for a moment, she continues her introductions, <i>“And I must say, I wouldn’t mind getting your help for a few experiments.”</i>");
		output("\n\nAnno giggles and extends her hand to shake Belle’s, <i>“Well, it looks like [pc.name] is having fun, so I may have to take you up on that offer.”</i>");
		output("\n\nThe two say their goodbyes, leaving you and Belle relatively alone in the wide open dome of Uveto station.");
		if (flags["SUBTUNER_NAMED"] == undefined) flags["SUBTUNER_NAMED"] = 1;
		lover = true;
	}
	//SyriCrew:
	if(select == 1)
	{
		output("\n\nAt one point, you’re walking through the pathways of the re-purposed wabeship when you come across a very familiar ravenette ausar: Syri. She approaches you and Belle with ");
		//pcAusar/Half: 
		if((pc.race().indexOf("ausar") >= 0 || pc.race().indexOf("kaithrit"))) output("a big roll of her blue eyes, her disdain for your perpetuation of stereotypes clear on her face.");
		else output("a confused look on her face, clearly intrigued by the sight of you in a collar.");

		output("\n\n<i>“Hey there, Steele,”</i> the ausar beauty calls out, causing you to look up at her, ");
		if((pc.race().indexOf("ausar") >= 0 || pc.race().indexOf("kaithrit"))) output("<i>“Out here giving the rest of us a bad name, I see.”</i>");
		else output("<i>“Having fun out here?”</i>");
		output(" Giving you an odd, slightly lustful look, Syri turns her attention to Belle, who is just as interested in the wolfy bitch as she is in you.");
		
		output("\n\n<i>“Oh, you must be a friend of my pet then?”</i> she asks, extending a hand and introduces herself as <i>“Dr. Belle Baslocvicz”</i> before she continues. <i>“Your ‘Steele’ here has been oh-so kind enough to help me with a few experiments here.”</i> Running her eyes up and down Syri’s curvy form for a moment, she continues her introductions, <i>“And I must say, I wouldn’t mind getting your help for a few experiments.”</i>");
		output("\n\n<i>“Uh, yeeeeah,”</i> Syri says, clearly not interested in such a deal, <i>“Well, uh, I gotta get going, later, [pc.name]”</i>");
		output("\n\nThe ausar quickly starts walking the opposite direction of the two of you, leaving you and Belle relatively alone in the wide open dome of Uveto station.");
		if (flags["SUBTUNER_NAMED"] == undefined) flags["SUBTUNER_NAMED"] = 1;
		lover = true;
	}
	//savedKiro:
	if(select == 2)
	{
		output("\n\nAt one point, you’re walking through the pathways of the re-purposed wabeship when you come across a very familiar, chestnut-furred kui-tan woman: Kiro, her balls as full as ever. She approaches you and Belle with a curious look on her face, clearly intrigued, or aroused, by the sight of you in a collar.");
		output("\n\n<i>“Is that you, angel?”</i> the tanuki pirate calls out, causing you to look up at her, <i>“You having fun out here?”</i> Giving you an odd, slightly lustful look, Kiro turns her attention to Belle, who is just as interested in the raccoon-girl as she is in you.");
		output("\n\n<i>“Oh, you must be a friend of my pet then?”</i> she asks, extending a hand and introduces herself as <i>“Dr. Belle Baslocvicz”</i> before she continues. <i>“Your ‘angel’ here has been oh-so kind enough to help me with a few experiments here.”</i> Running her eyes up and down Kiro’s stout, curvy form for a moment, she continues her introductions, <i>“And I must say, I wouldn’t mind getting your help for a few experiments.”</i>");
		output("\n\n<i>“I think I’ll have to pass,”</i> Kiro scoffs, clearly thinking herself above Belle, and the rank of being her pet, <i>“Hopefully I’ll see you later, though, [pc.name].”</i> ");
		output("\n\nThe kui-tan quickly says her goodbyes to you and starts walking the opposite direction of the two of you, leaving you and Belle relatively alone in the wide open dome of Uveto station.");
		if (flags["SUBTUNER_NAMED"] == undefined) flags["SUBTUNER_NAMED"] = 1;
		lover = true;
	}
	//highExhib/Repeat: 
	if(lover && pc.exhibitionism() >= 66) 
	{
		output("\n\nYou can only feel your lust grow after that encounter, being displayed in front of your lover all collar-bound and nude, already feeling blood rushing to your genitals.");
	}
	//Else: 
	else output("\n\nYou feel a small pang of shame at the fact that you were caught in the act like that. Maybe that’ll teach you to not fiddle with weird collars you find on space stations.");
	//This blurb should trigger for any encounter, not just Kiro.

	output("\n\nIt isn’t long before your master decides it’s about time to take a break, propping herself up against a nearby wall and giving you an order of <i>“Sit, " + pc.mf("boy","girl") + ".”</i> She waits there for a moment, scanning the foot traffic around her before calling you over to her.");
	output("\n\nQuickly heeding her command, you crawl your way over to Belle on your hand and knees until you’re right in front of her, looking up at her with eager eyes. Without any ritual or hesitation, the lady scientist quickly unbuckles her pants, and lets her package dangle free before you.");
	output("\n\nYour eyes bulge and your tongue lolls at what you’re presented with: two knotted human cocks, each easily measuring a foot in length, with a nice, plump pair of balls to match, <i>and it all looks so delicious.</i> All you can think of is having both of those wonderful dongs between your lips, shooting their hot load down your throat, but all you can do is sit here and wait for your master’s next command, <i>like a good pet</i>.");
	output("\n\n<i>“Like what you see, " + pc.mf("boy","girl") + "?”</i> Belle asks with a smile, reaching a hand down to cup your cheek while simultaneously yanking your leash to pull your face into her crotch.");
	output("\n\nThe smell is heavenly, so earthy and musky, and paired with the heat radiating off her package and onto your cheeks, all you can do is look up at her and pant in answer.");
	output("\n\n<i>“Well, come on then,”</i> the dual-dicked woman says, <i>“Fetch.”</i>");
	output("\n\nThat’s all the invitation you need. You dart for her lower shaft almost immediately, taking her cockhead into your mouth and starting to slide your [pc.lips] down her shaft, barely giving yourself any time to breath. Belle places a hand on your head, letting a pleasured, shuddering breath escape her lips as the molten cockflesh of her upper dong carresses your cheek. Speaking of her other cock, it seems a little neglected, desperately and enviously leaking pre onto your face. <i>That won’t do at all; you need to make sure your master feels as good as possible.</i> Far beyond being able to have second thoughts at this point, you reach a hand up and take hold of Belle’s other cock, gently stroking it as you start bob your head up and down her lower, equally turgid and lengthy rod.");
	output("\n\n<i>“</i>Ah<i>, yes!”</i> The lady scientist moans, ");
	if((pc.race().indexOf("ausar") >= 0 || pc.race().indexOf("kaithrit"))) output("giving your ears a scritch, ");
	output("<i>“Good " + pc.mf("boy","girl") + ", keep going, just like that.”</i>");

	output("\n\nYou can almost feel the woman’s grip on your leash tighten as you start to move your tongue along the cock lodged firmly in your mouth, tracing all along her shaft and wetting her cockflesh with your saliva. Even though you can’t see it, you can definitely sense a crowd gathering behind you to watch this little spectacle unfold, <i>but you can’t focus on that right now, because all that matters is making your master cum</i>.");

	output("\n\nRedoubling your efforts, you start to move your mouth and hand faster, striving to bring Belle to orgasm. Your hard work quickly pays off, because soon after you hear a long, lewd groan force its way past the human woman’s pouty lips, her grip on your head tightening. You can already feel her cocks spasm in your mouth and dexterous grip.");

	output("\n\nYou’re rewarded with a big, salty load down your throat, creamy spunk flowing down your gullet as your master rides out her climax, swelling your stomach until you’re feeling quite full and looking positively pregnant. Meanwhile, her other dong discharges all over your face, [pc.hair], and hand, leaving you thoroughly covered in hot white Terran cum.");

	output("\n\nPulling yourself off Belle’s twin cocks as she cums down from her peak, you look up at her expectantly, your face glazed with her seed and your tummy filled with her bountiful load.");

	output("\n\n<i>“Good " + pc.mf("boy","girl") + ",”</i> she manages to coo between lengthy breaths, her large chest heaving.");

	output("\n\nYou smile at her words, <i>and why wouldn’t you? You did such a good job making your master cum like that</i>.");
	output("\n\n<i>“Well, looks like those ‘master first’ subroutines I programmed are working perfectly now, unlike the last time I tried this,”</i> Belle says, pulling her pants back up and taking a good look at the now dispersing crowd, <i>“Come then, " + pc.mf("boy","girl") + ", there’s just one last thing I need to test before we can get that collar off you.”</i>");

	processTime(30);
	applyCumSoaked(pc);
	clearMenu();
	addButton(0,"Next",postWalkiesHeat);
}

//Heat
public function postWalkiesHeat():void
{
	clearOutput();
	showBelle();
	output("Belle walks you back to her lab, keeping a firm grip on your leash in an attempt to avoid any further distractions, although your naked form and cum-covered [pc.face] draw more than a few lustful looks on the way back. Your master keeps you in line though, all the way back to her scientific workspace.");
	currentLocation = "SUBSHIT";
	generateMap();
	processTime(2);
	clearMenu();
	addButton(0,"Next",postWalkiesHeat2);
}

public function postWalkiesHeat2():void
{
	clearOutput();
	showBelle();
	output("Once you’re well within the relative privacy of Belle’s lab, the lady scientist walks over to a nearby bench and picks up a small remote, still leading you by your leash.");
	output("\n\n<i>“This,”</i> she begins, holding up the remote for you to see, <i>“Is the newest addition to the Sub-Tuner, and I’ve still yet to test it. So, you’re going to be the very first person to try out the new ‘heat’ functions.”</i> The green-eyed woman goes to press a small button on the remote before continuing, keeping her eyes fixed on you, <i>“You may notice some... unpleasant sensations.”</i>");
	output("\n\nAlmost immediately after that little switch is flicked, you can feel your ");
	if(pc.hasCock()) output("[pc.cocks] start to swell and stiffen with need");
	else if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) output("[pc.vaginas] slobbering with a want to be filled");
	output(". Heat flushes through your body, a sign of your hunger that can only be sated by one thing: sex. There’s no doubt about it: you’re in ");
	if(pc.hasCock()) output("a rut");
	if(pc.isHerm()) output(" <i>and</i> ");
	if(pc.hasVagina()) output("heat");
	output(", and you need to breed.");
	output("\n\nYou look up to your master and whine, whimpering to let her know of your sexual distress. She responds with a smirk before speaking up again, <i>“Hmm, looks like it’s working.”</i>");

	var x:int = -1;
	x = pc.cockThatFits(1000);
	//hasCock:
	if(x >= 0)
	{
		output("\n\nYour master takes one look at your throbbing, needy cocks");
		if(pc.cockTotal() > 1) output("s");
		output(" before giving you a knowing smile, <i>“What’s wrong, " + pc.mf("boy","girl") + ", feeling pent up?”</i>");
		output("\n\nYou nod as fast as you can, hoping Belle can do something to fix this terrible rut you’re in, with your desire to cum only having grown since your earlier escapades with the human woman.");
		output("\n\n<i>“Just wait here a moment,”</i> she says, dropping your leash and walking towards another room in her lab, <i>“I have just the thing you need.”</i>");
		output("\n\nA strange feeling of sorrow overtakes your lust for a moment as your master leaves you there, <i>because what’s a pet without their master</i>. You don’t have to endure that pain for long though, because soon after she leaves, Belle is back again, and with a new friend: she’s got a pretty blonde ausar girl on a leash, wearing a collar similar to yours, and by all standards she’s quite the beautiful bitch, with her flowing mane, womanly figure and full breasts all put on display.");
		output("\n\n<i>“This is Saec,”</i> the human woman starts, leading her blonde ausar beauty over to you, <i>“She’s another one of my pets, and she just </i>loves<i> being bred by big, thick cocks; don’t you, girl?”</i> The ausar gives a happy little bark in response, like a good puppy, before her master turns back to you, <i>“And I want </i>you<i> to breed her for me. How does that sound?”</i>");
		output("\n\nYou take one look at Saec before nodding eagerly, ");
		//pcAusar/Kaithrit/Half:
		if((pc.race().indexOf("ausar") >= 0 || pc.race().indexOf("kaithrit"))) output("[pc.tail] wagging in an off-beat rhythm, ");
		output("barely able to contain your excitement.");
		output("\n\n<i>“Good,”</i> the lady scientist coos, smiling at your impatience before turning to face her other pet and giving the ausar a scratch between her ears, <i>“Alright, girl, think you’re ready for more pups?”</i>");
		output("\n\nThe blonde-haired girl takes her gaze off Belle for a moment to look at you, and your [pc.cocks] in particular before a big, dumb grin appears on her face. Turning back to her master, she nods vigorously, clearly ready to take what you plan to give her. Belle gives the pup one last <i>“Good girl”</i> as she lets go of Saec’s leash, allowing the happy ausar to crawl her way over to you on her fluffy hands and her fuzzy knees before she throws herself onto her back. Once she’s well and in position, the slutpuppy spreads her shapely legs for you, giving you a good view of her slobbering cunt, looking at you with a gaze that’s just as hungry as yours.");
		output("\n\nThat’s all the invitation you’ll ever need. You’re on the horny ausar in seconds, mounting her, straddling her on all fours and driving your [pc.cock " + x + "] deep into her pussy. The blonde beauty cries out with pleasure, throwing her legs around your back as you shove more and more cock into her drooling pink slit. {isLactating: Saec takes quick notice of your [pc.nipples] as you spread her lower-lips wide open, and eagerly takes one into her mouth, voraciously suckling on your [pc.breasts] and setting you moaning.");
		output("\n\nWith the onslaught of pleasure you’re experiencing, all you can stand to do is move your hips, dragging your [pc.cock " + x + "] in and out of Saec’s cunt as it squeezes and hugs at your tool, all while Belle watches happily and pleasured tones fill the room. <i>It just feels so good to breed this ausar like a proper bitch.</i>");
		pc.cockChange();
	}
	//hasVag:
	if(pc.hasVagina())
	{
		output("\n\nYour master circles around behind you, getting a good look at your wet, needy pussy as she kneels down, getting her hands all over your [pc.hips]. Shortly after, you feel a finger run along your nether-lips, gathering up beads of [pc.girlCum] as it makes its way towards your taint.");
		output("\n\n<i>“My, my,”</i> Belle breaths lustfully, <i>“Looks like the heat harmonics might have been tuned a little too high, judging by how wet you are. What do you say, " + pc.mf("boy","girl") + ", want me to fix that problem for you?”</i>");
		if(x >= 0) output("\n\nAs you’re still fucking Saec with as much vigor as you can muster, you manage to look over your shoulder");
		else output("\n\nYou manage to look over your shoulder at the human woman");
		output(" and give her a whimper and a nod");
		//noCock:
		if(x == -1) output(", with your desire to cum only having grown since your earlier escapades with the lady scientist");
		output(".");

		output("\n\nTurning back around, you need only wait a moment before your feel one of Belle’s cockheads press againt your [pc.vagina], and another against your [pc.asshole]. The sudden pressure on both of your sodden holes makes you whimper with pleasure and pain");
		if(x >= 0) output(", still breeding Saec and pumping your [pc.hips] as fast as you can");
		output(". Before you can try to relax, your master thrusts her hips forwards, slipping her twin dongs into both of your holes. You cry out with pleasure as you’re penetrated by both of Belle’s cocks at once, spreading your pucker wide open and leaving your pussy wonderfully agape. Barely giving you any time to recover from her dual-dicks, the lady scientist behind you starts to shove more and more Terran cock into you.");
		output("\n\nIt isn’t long before your master’s ever-expansive hips start to move, fucking you like the bitch in heat you are, her knots spreading your supple entrances with each thrust. <i>The feeling of being bred like this, of having your hungers sated, it all feels so good.</i> You moan as loud as you can with each thrust of Belle’s foot-long cocks, crying out as your inner walls hug at her shafts, eagerly accepting her turgid dicks into your waiting holes.");
		pc.cuntChange(0,300);
		pc.buttChange(300);
	}
	//hasCock:
	if(x >= 0)
	{
		//hasKnot:
		if(pc.hasKnot(x))
		{
			output("\n\nYou can already feel your impending orgasm growing as Saec moans under you, ");
			if(pc.isLactating()) output("still suckling on your [pc.chest] and ");
			output("letting your [pc.cock " + x + "] fill her. <i>She needs to be bred like a proper bitch, and that means she needs a proper knot.</i> Without a second thought, you slam your hips forward, letting your [pc.knot " + x + "] spread Saec’s lube-leaking ausar pussy. She cries out as you widen her slick slit, the mind blowing pleasure of your breeder’s knob filling her apparently enough to bring her to climax; her whole body tenses, slobbering cunt spasming as crystal-clear girlcum spills out around your [pc.cock " + x + "].");
		}
		//Else:
		else
		{
			output("\n\nYou can already feel your impending orgasm growing as Saec moans under you, ");
			if(pc.isLactating()) output("still suckling on your [pc.chest] and ");
			output("letting your [pc.cock " + x + "] fill her. <i>She wants to be bred like a proper bitch, and that means she needs a big, potent load of cum to fill her.</i> With your thoughts hazed with heat and lust, you start to move your [pc.hips] faster in a desperate attempt to reach release, though, it seems the pleasure of your [pc.cock " + x + "] punishing her pussy is enough to bring Saec to orgasm; the ausar cries out with pleasure, her whole body tensing, slobbering cunt spasming as crystal-clear girlcum spills out around your [pc.cock " + x + "].");
		}

		output("\n\nEager to join your lover in orgasm, you start to roll your hips at a blinding place, ");
		if(pc.hasKnot(x)) output("grinding your knot against the inner walls");
		else output("dragging your cock in and out");
		output(" of Saec’s now loosened hole until you can feel your molten [pc.cumNoun] pooling in your urethra.");

		output("\n\nNo point in holding back now. You let your willpower slip away and allow the pleasure of climax to wash over your body, shivering with bliss as you blow your load inside this breeding bitch’s cum-slick pussy. ");
		//lotsOfCum:
		if(pc.cumQ() >= 2000) output("Your tremendous bounty floods Saec’s cunt, building up pressure until it starts to swell her tummy, distending it to the point where she’s already looking pregnant, oh-so full of [pc.cum].");
		else output("Your [pc.cum] floods Saec’s cunt, painting her love tunnel [pc.cumColor] and causing her to whimper with renewed pleasure at the sudden sensation of your warm [pc.cumNoun] filling her to the brim.");
	}
	//HasVag:
	if(pc.hasVagina())
	{
		//hasCock:
		if(x >= 0)
		{
			output("\n\nIn sync with your [pc.cocks], your cock-hungry cunt");
			if(pc.totalVaginas() > 1) output("s begin");
			else output(" begins");
			output(" to spasm around Belle’s pussy-filling phallus while your [pc.asshole] does the same. You can hear your master groan with bliss as your holes tighten around her dual-dongs, still slamming her wide hips against yours. With climax overtaking your mind, you’re hardly able to notice your master’s own orgasm beginning.");
		}
		//Else:
		else
		{
			output("\n\nWith Belle’s twin cocks punishing your pussy and [pc.asshole] alike, you can already feel an overwhelming desire to cum swelling inside your heat-addled mind, <i>but you can’t cum without your master’s permission</i>.");
			output("\n\nIn a desperate attempt to reach climax, you turn your head to look back at the human woman fucking you, giving her a whine to let her know of your desires.");
			output("\n\n<i>“What’s wrong, " + pc.mf("b-boy","g-girl") + "?”</i> Belle manages to blurt out, sounding like she’s on the verge of orgasm herself, <i>“Want to cum? Well, c-come on, " + pc.mf("boy","girl") + ", CUM!”</i>");
			output("\n\n<i>Yes! Yes! You have to cum now, your master told you too!</i> Your cock-hungry cunt");
			if(pc.totalVaginas() > 1) output("s begin");
			else output(" begins");
			output(" to spasm around Belle’s pussy-filling phallus while your [pc.asshole] does the same. You can hear your master groan with bliss as your holes tighten around her dual-dongs, still slamming her wide hips against yours. With climax overtaking your mind, you’re hardly able to notice your master’s own orgasm beginning.");
		}
		output("\n\n[pc.Girlcum] spills out around one of Belle’s turgid Terran rods as it spasms inside your [pc.vagina], her upper cock doing the same, already dispensing their white, molten loads into both of your holes. With not a moment to lose, the multi-cocked human slams her hips forward, driving her knots into your holes. You cry out as your [pc.vagina] and [pc.asshole] are spread even wider by the balls of cockflesh, stretching your orifices until they finally pop in, leaving you in bliss. You whimper as you’re pumped full of your master’s seed for the second time today, feeling her hot cum distend your [pc.stomach] until you’re feeling and looking full all over again. The lady scientist’s orgasm persists for quite some time, fully emptying her large pair of balls into you until the pressure is so great cum can only dribble out of your sodden, well-used holes. <i>You did a good job making your master cum like that.</i>");
	}
	//hasCockOnly:
	if(x >= 0 && !pc.hasVagina())
	{
		output("\n\nWith ");
		if(pc.hasKnot(x)) output("your [pc.cock " + x + "] thoroughly knotted inside Saec’s pulsing cunt");
		else 
		{
			output("your bitch thoroughly bred and filled with cum");
			if(pc.isLactating()) output(" (and [pc.milk])");
		}
		output(", you’re left with your [pc.chest] heaving over the blonde ausar. Looking towards your master for some sign of approval, she gives you a smile and a nod, along with an assortment of <i>“Good " + pc.("boy","girl") + ",”</i> and other praises.");
		output("\n\n<i>What a good pet you are, no doubt you’re a good breeder as well now.</i>");
	}
	//Else:
	else
	{
		output("\n\nYou’re left panting under the weight of your post-orgasmic bliss, with ");
		if(x >= 0) output("both Saec and ");
		output("Belle’s chest");
		if(x >= 0) output("s");
		output(" heaving with every breath ");
		if(x < 0) output("she");
		else output("they");
		output(") take. Looking back at your master for some sign of approval, she gives you a slap on your [pc.butt] along with a tired, out-of-breath <i>“Good " + pc.mf("boy","girl") + ".”</i>");
		output("\n\n<i>What a good pet you are.</i>");
	}
	//[Next]
	processTime(30);
	pc.orgasm();

	if(pc.hasVagina())
	{
		var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
 		if(!pp.hasCock()) pp.createCock();
		pp.createPerk("Fixed CumQ",1000,0,0,0);
		pc.loadInCunt(pp,0);
		pc.loadInAss(pp);
	}
	clearMenu();
	addButton(0,"Next",subTunerOvah);
}

public function subTunerOvah():void
{
	clearOutput();
	showBelle();
	var x:int = -1;
	x = pc.cockThatFits(1000);
	if(x >= 0 && !pc.hasVagina())
	{
		output("After giving you and Saec some time to rest, Belle returns the happy, cum-filled ausar back to her place before returning to the matter at hand again: You.");
	}
	else 
	{
		output("After giving her knots some time to deflate, your master pulls her foot-long, twin dongs out of your cum-filled, gaping entrances, leaving you there to shudder as you’re emptied. Belle quickly picks herself up and pulls herself together");
		if(x >= 0) output("; she gives you and Saec some time to rest before she returns the happy, spunk-filled ausar back to her place and returns to the matter at hand again: you.");
		else output(" before returning to the matter at hand again: you.");
	}
	//firstTime:
	if(flags["ACCUPITCH_VISIT"] == undefined)
	{
		output("\n\n<i>“Before I let you go,”</i> Belle begins, reaching over to a nearby lab bench and grabbing a small, black, rectangular box, <i>“There’s just one last thing I need to give you.”</i>");
		output("\n\nWith that said, the Lady scientist walk around behind you, taking up a position just behind your [pc.butt]. <i>You’re unable to control your excitement, expecting another treat from your master");
		//pcAusar/Kaithrit/Half:
		if((pc.race().indexOf("ausar") >= 0 || pc.race().indexOf("kaithrit")) && pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output(", [pc.tails] wagging uncontrollably");
		output(".</i>");

		output("\n\nThen you feel plastic press against your [pc.skinFurScales] followed by a light tingling sensation from what you can only assume to be the strange device only moments before Belle pulls herself back with a quiet <i>“There we go.”</i>");
		output("\n\nTurning your head to try and get a look at what just happened, you’re able to make out what seems to be a barcode on your rump; it’s black, sleek, and more than a bit demeaning.");
		output("\n\nYou gaze back up at your master with a confused look on your face, expecting some sort of explanation from the woman, though, <i>she doesn’t have to answer to her pet</i>.");
		output("\n\nThe woman returns your curious mien with a smirk, <i>“I keep very detailed files on all of my test subjects, and I need one for you, especially.”</i>");
		output("\n\n<b>You’ve got a barcode on your ass now!</b>");
		//For when the tattoo system is implemented: Should give the PC’s ass a <i>“barcoded”</i> tag or descriptor.");
		//This could also behave like Sera’s Slut Stamp, as a perk of sorts, if this is the case, then: Barcode Perk Description: A sleek black barcode is printed on your ass, left there by Dr. Belle for purely scientific purposes.
		//Appearance screen blurbs: <i>“There’s a barcode on your left butt cheek, forever marking you as the property of Belle and AccuPitch Labs.”</i> OR (Random 50/50) <i>“On one of your ass cheeks is a barcode, placed there by Dr. Belle for her scientific research, and to remind you of your place as her pet.”</i>
		//9999
	}
	output("\n\nBelle goes to grab your leash, giving you and order of <i>“Up, " + pc.mf("boy","girl") + "”</i> as she pulls your tether taut, and quick to follow orders, you stand up.");
	output("\n\n<i>“Everything’s working better than I could have hoped,”</i> your master exclaims, reaching to unhook her leash from your collar, <i>“Which means this little endeavor has yielded more potential than I would have ever believed, and I couldn’t have done it without you, good " + pc.mf("boy","girl") + ".”</i> She ");
	//pcAusar/Kaithrit/Half: 
	if((pc.race().indexOf("ausar") >= 0 || pc.race().indexOf("kaithrit"))) output("scratches your [pc.ears]");
	else output("ruffles your [pc.hair]");
	output(", giving you the most profound sense of fulfillment you’ve felt in a while.");

	output("\n\nThen Belle extends a single finger, and turns your collar off. All your pet-like feelings fade in an instant, dying down until you realize what you’ve been doing for the past few hours, though, you can’t find yourself upset about any off it, as if a hint of the ");
	//upgradedSubTuner:
	if(subTunerUpgraded()) output("metal");
	else output("leather");
	output(" ring’s subbiness has rubbed off on you. You also couldn’t deny that all that sex was mind-blowing... even if you wanted to.");

	output("\n\nAt this point you can only give your former-master a blank stare, finding yourself at a loss for words. Belle knows just what to say though: <i>“");
	//firstTime: 
	if(flags["ACCUPITCH_VISIT"] == undefined) output("Hmm, why don’t you keep that collar; no doubt I’ll be working on a new prototype for quite some time. I must say, you’re one of the best subjects I’ve ever had, and it would just be </i>wonderful<i> if you ever felt like running some more tests with me. Don’t worry about that thing turning on, by the way. It’s got a proximity limiter installed, and can’t be activated unless you’re well and deep inside my lab. ");
	//notNude: 
	if(!pc.isNude()) output("Well, I suppose you should get dressed and be on your way.");
	else output("Well, I suppose you should be on your way then, my pet.");
	output("”</i>");
	output("\n\nYeah, that sounds like a good idea right about now.");

	if(flags["ACCUPITCH_VISIT"] == undefined)
	{
		output("\n\n<b>You got the Sub-Tuner collar!</b>");
		//Should give and equip the Sub-Tuner, as well as add it to the collar selection. Description: Collar - Sub-Tuner: a black leather collar covered in a web of wiring and circuitry.
		pc.createKeyItem("Sub-Tuner Collar",0,0,0,0);
		
		//Actually equip it
		var itm:StorageClass = pc.getKeyItem("Sub-Tuner Collar");
		// If this collar is already on, just remove it
		if (itm.value1 == 1)
		{
			itm.value1 = 0;
		}
		// Otherwise determine if we currently have a collar, unequip it, and then equip the new one
		else
		{	
			var wornCollar:StorageClass = getWornCollar();
			if (wornCollar != null) wornCollar.value1 = 0;
			itm.value1 = 1;
		}
	}
	//[Next] //Should return the PC to outside of AccuPitch labs, adds some libido.

	IncrementFlag("ACCUPITCH_VISIT");
	IncrementFlag("SUB_TUNERED");
	processTime(10);
	clearMenu();
	addButton(0,"Next",move,"UVS F9");
}