//Finding the Collar
//This text should go up in some room on Uveto Station.

public function subTunerBonusButts():void 
{
	if(rooms["SUBSHIT"].hasFlag(GLOBAL.NPC))
	{
		rooms["SUBSHIT"].removeFlag(GLOBAL.NPC);
		generateMap();
	}
	if(((pc.hasCock() && pc.smallestCockVolume() < saecVaginaCapacity()) || (pc.hasVagina() && pc.blockedVaginas() == 0)) && !pc.isTaur() && !pc.isNaga())
	{
		if(flags["SUB_TUNERED"] == undefined)
		{
			output("\n\nThere’s a small parlor table nearby, all white and shiny with a pair of chairs to match, but more importantly, you can see the tell-tale glint of light on metal beneath one of the ivory seats.");

			//[Metal] Check out whatever is under that chair. //PC cannot be taur or naga, requires cock or vag. Probably shouldn’t appear for those that can’t use it in the first place.
			addButton(0,"Metal",uvetoSubtunerCollectionBootyButtsSupremeEatDabootyLikeGroceries,undefined,"Metal","Check out whatever is under that chair.");
		}
		else 
		{
			output("\n\nThe door to Accu-Pitch labs is here to the south, but it’s locked. Do you want to find a way back in?");
			addButton(0,"Enter Lab",newSubTunerOpening);
		}
	}
	setNavDisabled(NAV_SOUTH_DISABLE);
}

public function wearingSubTuner():Boolean
{
	var itm:StorageClass = pc.getKeyItem("Sub-Tuner Collar");
	if(itm != null) return (itm.value1 == 1);
	return false;
}

public function showBelle(nude:Boolean = false):void
{
	showName("\nBELLE");
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	showBust("BELLE" + nudeS);
}
public function showSaec(nude:Boolean = true):void
{
	showName("\nSAEC");
	showBust(saecBustString(nude));
}

public function getBellePregContainer():PregnancyPlaceholder
{
	var ppBelle:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppBelle.removeCocks();
	for(var i:int = 0; i < 2; i++)
	{
		ppBelle.createCock();
		ppBelle.shiftCock(i, GLOBAL.TYPE_HUMAN);
		ppBelle.cocks[i].cLengthRaw = 12;
		ppBelle.cocks[i].flaccidMultiplier = 0.50;
		ppBelle.cocks[i].addFlag(GLOBAL.FLAG_KNOTTED);
	}
	ppBelle.createPerk("Fixed CumQ", 1000, 0, 0, 0);
	
	return ppBelle;
}

public function saecVaginaCapacity():Number { return 1000; }
public function saecPreg():Boolean { return false; }
public function pregSaec():Boolean { return saecPreg(); }
public function fuckedSaec():Boolean { return (flags["SEXED_SAEC"] != undefined); }
public function ausarKaithrit():Boolean { return (pc.race().indexOf("ausar") != -1 || pc.race().indexOf("kaithrit") != -1); }
public function saecBustString(nude:Boolean = true):String
{
	if(nude) return "SAEC_NUDE";
	return "SAEC";
}
public function equipTheSubTuner():void
{
	var itm:StorageClass = pc.getKeyItem("Sub-Tuner Collar");
	if(itm != null) itm.value1 = 1;
}

public function subTunerUpgraded():Boolean
{
	return false;
}

//[Metal]
public function uvetoSubtunerCollectionBootyButtsSupremeEatDabootyLikeGroceries():void
{
	clearOutput();
	showName("SUB-\nTUNER");
	showBust("SUBTUNER");
	author("HugsAlright");
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
	author("HugsAlright");
	showBust("SUBTUNER");
	output("Abandoning whatever caution you may have had before, you bring the collar to your neck, slowly wrapping it around your nape until the two ends of its buckle are right next to each other. Well, you’ve come this far already, no turning back now. You let the two electro-magnets snap closed together with a metallic <i>ca-thunk</i>, and as soon as the buckle is well and shut, a small red light turns on. Shortly after the crimson beacon starts blinking in the corner of your eye, the collar starts to emit a soft metallic hum. You feel your thoughts growing hazy as that gentle noise floods your mind.");
	output("\n\nIt’s as if your own body is becoming heavier under the weight of the sound, almost to the point where you consider sitting down before a static-filled voice coming from the collar breaks your focus.");
	output("\n\n<i>“Well, well,”</i> is the first thing you hear; the voice is poised, and most definitely feminine, <i>“Looks like someone other than me finally found my collar.”</i>");
	output("\n\nYou try to respond but nothing comes out. <i>All you feel is that static hum compelling you to stand there and wait for that voice again.</i>");
	output("\n\n<i>“Just be a dear and stay there for a moment,”</i> the voice calls out from the collar again, <i>“I’ll be there soon to get my property back.”</i>");
	output("\n\n<i>That... that sounds exactly like what you want to do.</i> Once again that steady humming makes your body feel heavy and you think you should take a seat some- no, no... that won’t do; <i>you need to lower yourself, and wait for whoever’s voice that was to come get you</i>.");
	output("\n\nYou quickly fall to the ground on all fours; <i>yeah, that feels good</i>.");

	processTime(10);
	//[Next] //Should go to “Meeting Belle”.
	clearMenu();
	addButton(0,"Next",meetingBelle);
}

//Leave it
//[Leave it]
public function leaveTheSubTuner():void
{
	clearOutput();
	author("HugsAlright");
	showBust("SUBTUNER");
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
	showBust("BELLE");
	author("HugsAlright");
	output("You wait there for a while, not feeling any need to move from where you are. <i>Resting here on your hands and knees feels perfect.</i> A few passersby give you strange looks, but you can’t really bring yourself to care; all you can really do is wait here on all fours, feeling happy more than anything else.");
	output("\n\nOnly a little more time passes before you hear the same voice you heard from the collar, though this time it’s free of the static from earlier.");
	output("\n\n<i>“Ah, there you are,”</i> the voice says, causing you to turn your gaze towards what looks to be a human woman. She’s got a very wide set of hips that only draw attention to an even more impressive derriere... along with the enormous bulge opposite that. You move your gaze up past her slim waist and comparatively large breasts, double-Ds at the least, to a jaw-droppingly feminine face: pouty lips and green eyes. Her long, black hair is being kept in a ponytail, keeping it away from her fair skin and the lab coat she’s wearing. All you can feel looking at her is an overwhelming want, your whole body eagerly awaiting whatever it is she has to say.");
	output("\n\n<i>“Mmmm,”</i> she coos, letting her eyes run up and down your form, <i>“What do we have here?”</i>");
	output("\n\nYou try to speak, but nothing’s coming out of your mouth, your [pc.lipsChaste] refusing to move. <i>No, silence will do for now.</i>");

	output("\n\nThe woman suddenly reaches a hand down toward your head followed by a sense of growing eagerness on your part. You close your eyes in anticipation, awaiting her touch, <i>no longer worrying about that pesky collar</i>");
	if(pc.isPuppyorKitten() && pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG))
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
	rooms["SUBSHIT"].addFlag(GLOBAL.NPC);
	moveTo("SUBSHIT");
	author("HugsAlright");
	output("You are led around by this wonderful woman around the wabeship that is Uveto station, crawling along the floor until you reach what must be the scientist’s lab.");
	output("\n\nFinally walking inside behind the scientist, your eyes are greeted by a wealth of scientific equipment: blinking lights and computers, and bundles of wires lining the walls of the small lab. Though, beyond that most of the equipment seems to be related to audio: radios and speakers, various instruments lined up next to microphones, even a row of wine glasses and spoons placed carefully near a group of transceivers.");
	output("\n\n<i>“Welcome,”</i> the lady-scientist exclaims, extending an arm, <i>“To Accu-Pitch labs, or </i>my lab<i>, if you want to get specific.”</i> She turns around to look down at you, <i>“What you’re wearing there is one of my inventions. I call it the Sub-Tuner. It releases a series of harmonic frequencies that alter brain patterns, making the wearer more submissive and... suggestible, but I’m sure you’ve already noticed that.”</i>");
	output("\n\nWell, that does explain a lot, but you can’t work up the drive to question anything that’s going on right now. <i>All you want to do is await more orders</i>, so you content yourself to sitting there on your hands and knees, looking up at the black-haired woman with a smile on your face ");
	if(pc.isPuppyorKitten() && pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output(", [pc.tails] swaying gently");
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

/* OLD: Repeatable opening
//Text for Accu-Pitch Labs tiles.
public function accupitchLabBonus():Boolean
{
	clearOutput();
	showBelle();
	rooms["SUBSHIT"].addFlag(GLOBAL.NPC);
	moveTo("SUBSHIT");
	author("HugsAlright");
	//firstTime:
	if(flags["ACCUPITCH_VISIT"] == undefined)
	{
		output("Making your way up to Accu-Pitch labs, you can see that the door is sealed and well-locked, but there’s a small scanner next to the entrance. Maybe it will recognize one of Doctor Belle’s test subjects?");
		output("\n\nYou start with your eye, but the scanner does nothing, then your palm, then your fingertips, but nothing seems to be doing the trick.");
		if(!pc.hasPerk("Barcoded"))
		{
			output("\n\nYou guess it’s no good to keep trying so you turn around and leave....");
			processTime(1);
			clearMenu();
			addButton(0, "Next", leaveAccuPitchLabs);
			return true;
		}
		output("\n\nWait, could it be that barcode the woman-scientist put on your ass? Well, it’s worth a shot. You ");
		//notNude:
		if(!pc.isAssExposed()) output("drop your [pc.assCover] just enough so that the tattoo peeks out and ");
		output("place your [pc.butt] close to the scanner. Sure enough, the little holo-pad picks up on your barcode and scans it with an approving <i>blip</i>, the door hissing open soon after...");
		
		flags["ACCUPITCH_VISIT"] = 1;
	}
	//repeat:
	else
	{
		output("Walking your way up to Accu-Pitch labs, you can see that the door is once again sealed and locked, that all-too familiar scanner sitting next to the entrance.");
		if(!pc.hasPerk("Barcoded"))
		{
			output("\n\nUnfortunately, you are lacking the barcode to get past the door locks so you turn around and leave....");
			processTime(1);
			clearMenu();
			addButton(0, "Next", leaveAccuPitchLabs);
			return true;
		}
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
	
	processTime(2);
	
	clearMenu();
	addButton(0,"Belle",approachBelle,undefined,"Belle","Meet with the doctor.");
	addButton(14,"Leave",leaveAccuPitchLabs);
	
	return true;
}

//[Belle]
public function approachBelle():void
{
	clearOutput();
	showBelle();
	author("HugsAlright");
	output("You walk up to Belle, alerting her to your presence along the way. She quickly turns around and greets you with a smile.");
	
	clearMenu();
	if(((pc.hasCock() && pc.smallestCockVolume() < saecVaginaCapacity()) || pc.hasVagina()) && !pc.isTaur() && !pc.isNaga()) 
	{
		output("\n\n<i>“Ah, hello again. Here to assist me with some more experiments?”</i>");
		addButton(0,"Experiments",experimentsWithBelle);
	}
	else
	{
		output("\n\n<i>“Ah, hello again. It seems you don’t have quite the right body for more experiments. Come back when ");
		if(pc.isNaga() || pc.isTaur()) output("you can properly crawl around like a pet");
		else if(pc.hasCock() && pc.smallestCockVolume() >= saecVaginaCapacity() && !pc.hasVagina()) output("you have a reasonably sized phallus.");
		else output("you have decent genitalia");
		output(".”</i>");
		addDisabledButton(0,"Experiments","Experiments","You don’t have the right body for the experiments she wants to perform.");
	}
	addButton(14,"Leave",leaveAccuPitchLabs);
}

//[Experiments]
//Experiments
public function experimentsWithBelle():void
{
	clearOutput();
	showBelle();
	author("HugsAlright");
	output("You tell Belle that you would very much like to help her with more of her experiments, resulting in a big grin from your soon-to-be master.");

	//notWearingSubTuner:
	if(!wearingSubTuner())
	{
		output("\n\nFumbling around for a moment, you take out the Sub-Tuner and hand it to the lady scientist, who quickly accepts the collar, wraps it around you neck, and closes it nice and tight.");
		if(!pc.hasKeyItem("Sub-Tuner Collar")) pc.createKeyItem("Sub-Tuner Collar",0,0,0,0);
		toggleCollar("Sub-Tuner");
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
}*/
public function leaveAccuPitchLabs():void
{
	rooms["SUBSHIT"].removeFlag(GLOBAL.NPC);
	processTime(1);
	currentLocation = "UVS F9";
	mainGameMenu();
}


//Kennel
//Cock takes priority over vag.
public function kennelSubTuner():void
{
	clearOutput();
	showBelle();
	author("HugsAlright");
	//notNude:
	if(!pc.isNude())
	{
		output("Belle keeps a tight grip on your leash, tracing a circle around you and stroking her chin. <i>“Hmmm,”</i> she deliberates, <i>“No, these clothes you’re wearing won’t do at all. They’ll obstruct my readings, so I guess we’ll have to get them off won’t we?”</i>");
		output("\n\nYou can feel your mind go blank at that question, <i>unable to feel anything but excitement at that proposition</i>. Quickly pulling yourself together, you give Belle a nod, resulting in a confident smirk from the scientist.");
		output("\n\n<i>“Alright then, " + pc.mf("boy","girl") + ", sit up,”</i> she commands.");
		output("\n\nWithout a thought you heed her order, sitting yourself up on your knees, keeping your [pc.arms] curled up like a puppy’s and looking up at your master with growing eagerness. Belle slips down onto her knees, getting herself close enough to you that you can feel the heat radiating off her immense bulge. She grabs at your equipment and pulls it away until all your flesh is laid bare before her, leaving the lady scientist with a wide grin on her face, <i>“That’s more like it.”</i>");
		output("\n\n");
	}
	if(pc.hasPerk("Barcoded"))
	{
		output("Before she continues, your master takes a brief walk over to a nearby lab bench, turns on her computer, and grabs a rather familiar, small, rectangular device. Leaning down, Belle brings the device to the barcode she printed on your ass and flips it on, and before you can even say <i>“Science!”</i> a file labeled ");
		//anno/SyriCrew/SavedKiro:
		if(flags["SUBTUNER_NAMED"] != undefined) output("“[pc.name] Steele”");
		else output("“Subject 69”");
		output(" is brought up on Belle’s computer. Almost simultaneously, a little holo-tag appears on your collar: bright blue and ");
		//anno/SyriCrew/SavedKiro: 
		if(flags["SUBTUNER_NAMED"] != undefined) 
		{
			if(flags["SUBTUNER_NAMED"] == 1) flags["SUBTUNER_NAMED"] = 2;
			output("emblazoned with the name “[pc.name].”");
		}
		else output("bearing the same label as the file on Belle’s terminal.");
		output("\n\n");
	}
	output("Your new master gazes at your naked form for a long moment before taking up a position behind you, and you can practically feel her eyes scan your [pc.butt]. <i>You don’t turn to face her, though, because a good pet waits for their orders</i>. All you can do is sit there and tremble with anticipation as Belle kneels down behind you, <i>“I suppose you should be punished for taking things that don’t belong to you.”</i>");
	output("\n\nWith that said, a palm caresses one of your lower cheeks, causing you to gasp at the sudden sensation of your master’s warm flesh on yours, <i>“Yes, I think you’ve been a very bad " + pc.mf("boy","girl") + ", taking my collar without my permission.”</i>");
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
	if(pc.isPuppyorKitten() && pc.hasEmoteEars()) output("a scritch between your [pc.ears]");
	else output("an appreciative pat on the head");
	output(", <i>“Nice job with that test, " + pc.mf("boy","girl") + ".”</i>");
	output("\n\n<i>You did do a good job with that, didn’t you?</i> Though, a “good job” doesn’t exactly give your ");
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
	author("HugsAlright");
	output("<i>“But,”</i> Belle begins, giving her finger a little waggle and walking towards the door of her lab in a way that makes her booty quake in the most perfect way, <i>“Why don’t we see just how far we can push those protocols?”</i>");
	output("\n\nYou’re not quite sure what that means, but ");
	//pcAusar/Kaithrit/Half:
	if(pc.isPuppyorKitten() && pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG))
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
	author("HugsAlright");
	rooms["SUBSHIT"].removeFlag(GLOBAL.NPC);
	moveTo("UVS B9");
	output("Belle leads you around Uveto station for quite some time, testing the abilities of her collar in all different ways. Sometimes she encourages you to go receive all manners of pets and praise from passersby, only to later chide you for talking to strangers, though, you can’t find yourself upset about it. <i>Your master knows best, after all.</i> Other times she instructs you to provide passing huskar, toves, and other aliens with a show, making you wiggle your butt in the air for them. Some of them respond to your teasing movements with slaps and gropes, ");
	//highExhib:
	if(pc.exhibitionism() >= 66) output("but you don’t mind, this being something you’d do without the help of Belle’s collar.");
	else output("but you don’t mind, <i>because being a good little pet is all the reward you need</i>.");

	//Random chance for one of these variant to occur if more than one requirement is met.
	
	var lover:Boolean = false;
	var choices:Array = [];
	if(annoIsCrew()) choices.push(0);
	if(syriIsCrew() || (/*syriRecruited() &&*/ syriAtFreeezer())) choices.push(1);
	if(roamingKiroAvailable()) choices.push(2);
	var select:int = -1;
	if(choices.length > 0) select = choices[rand(choices.length)];
	//annoCrew:
	if(select == 0)
	{
		output("\n\nAt one point, you’re walking through the pathways of the re-purposed wabeship when you come across your own white-haired ausar slut: Anno. She approaches you and Belle with a wide grin on her face, seeing you in a collar obviously being something she enjoys.");
		output("\n\n<i>“Hey there, boss,”</i> the ausar beauty calls out, causing you to look up at her, <i>“Hope you’re not having too much fun without me out here.”</i> Tossing you a quick wink, Anno turns her attention to Belle, who is just as interested in the snowy-haired pup as she is in you.");
		output("\n\n<i>“Oh, you must be a friend of my pet then?”</i> she asks, extending a hand and introduces herself as “Dr. Belle Baslocvicz” before she continues. <i>“Your ‘boss’ has been oh-so kind enough to help me with a few experiments here.”</i> Running her eyes up and down Anno’s curvy form for a moment, she continues her introductions, <i>“And I must say, I wouldn’t mind getting your help for a few experiments.”</i>");
		output("\n\nAnno giggles and extends her hand to shake Belle’s, <i>“Well, it looks like [pc.name] is having fun, so I may have to take you up on that offer.”</i>");
		output("\n\nThe two say their goodbyes, leaving you and Belle relatively alone in the wide open dome of Uveto station.");
		if (flags["SUBTUNER_NAMED"] == undefined) flags["SUBTUNER_NAMED"] = 1;
		lover = true;
	}
	//SyriCrew:
	if(select == 1)
	{
		var isAusar:Boolean = pc.isAusar();
		
		output("\n\nAt one point, you’re walking through the pathways of the re-purposed wabeship when you come across a very familiar ravenette ausar: Syri. She approaches you and Belle with ");
		//pcAusar/Half: 
		if(isAusar) output("a big roll of her blue eyes, her disdain for your perpetuation of stereotypes clear on her face.");
		else output("a confused look on her face, clearly intrigued by the sight of you in a collar.");

		output("\n\n<i>“Hey there, Steele,”</i> the ausar beauty calls out, causing you to look up at her, ");
		if(isAusar) output("<i>“Out here giving the rest of us a bad name, I see.”</i>");
		else output("<i>“Having fun out here?”</i>");
		output(" Giving you an odd, slightly lustful look, Syri turns her attention to Belle, who is just as interested in the wolfy bitch as she is in you.");
		
		output("\n\n<i>“Oh, you must be a friend of my pet then?”</i> she asks, extending a hand and introduces herself as “Dr. Belle Baslocvicz” before she continues. <i>“Your ‘Steele’ here has been oh-so kind enough to help me with a few experiments here.”</i> Running her eyes up and down Syri’s curvy form for a moment, she continues her introductions, <i>“And I must say, I wouldn’t mind getting your help for a few experiments.”</i>");
		output("\n\n<i>“Uh, yeeeeah,”</i> Syri says, clearly not interested in such a deal, <i>“Well, uh, I gotta get going, later, [pc.name]!”</i>");
		output("\n\nThe ausar quickly starts walking the opposite direction of the two of you, leaving you and Belle relatively alone in the wide open dome of Uveto station.");
		if (flags["SUBTUNER_NAMED"] == undefined) flags["SUBTUNER_NAMED"] = 1;
		lover = true;
	}
	//savedKiro:
	if(select == 2)
	{
		output("\n\nAt one point, you’re walking through the pathways of the re-purposed wabeship when you come across a very familiar, chestnut-furred kui-tan woman: Kiro, her balls as full as ever. She approaches you and Belle with a curious look on her face, clearly intrigued, or aroused, by the sight of you in a collar.");
		output("\n\n<i>“Is that you, angel?”</i> the tanuki pirate calls out, causing you to look up at her, <i>“You having fun out here?”</i> Giving you an odd, slightly lustful look, Kiro turns her attention to Belle, who is just as interested in the raccoon-girl as she is in you.");
		output("\n\n<i>“Oh, you must be a friend of my pet then?”</i> she asks, extending a hand and introduces herself as “Dr. Belle Baslocvicz” before she continues. <i>“Your ‘angel’ here has been oh-so kind enough to help me with a few experiments here.”</i> Running her eyes up and down Kiro’s stout, curvy form for a moment, she continues her introductions, <i>“And I must say, I wouldn’t mind getting your help for a few experiments.”</i>");
		output("\n\n<i>“I think I’ll have to pass,”</i> Kiro scoffs, clearly thinking herself above Belle, and the rank of being her pet, <i>“Hopefully I’ll see you later, though, [pc.name].”</i> ");
		output("\n\nThe kui-tan quickly says her goodbyes to you and starts walking the opposite direction of the two of you, leaving you and Belle relatively alone in the wide open dome of Uveto station.");
		if (flags["SUBTUNER_NAMED"] == undefined) flags["SUBTUNER_NAMED"] = 1;
		lover = true;
	}
	//highExhib/Repeat: 
	if(lover && pc.exhibitionism() >= 66) 
	{
		output("\n\nYou can only feel your lust grow after that encounter, being displayed in front of your lover all collar-bound and nude, already feeling blood rushing to your genitals.");
		pc.lust(15);
	}
	//Else: 
	else output("\n\nYou feel a small pang of shame at the fact that you were caught in the act like that. Maybe that’ll teach you to not fiddle with weird collars you find on space stations.");
	//This blurb should trigger for any encounter, not just Kiro.

	output("\n\nIt isn’t long before your master decides it’s about time to take a break, propping herself up against a nearby wall and giving you an order of <i>“Sit, " + pc.mf("boy","girl") + ".”</i> She waits there for a moment, scanning the foot traffic around her before calling you over to her.");
	output("\n\nQuickly heeding her command, you crawl your way over to Belle on your hand and knees until you’re right in front of her, looking up at her with eager eyes. Without any ritual or hesitation, the lady scientist quickly unbuckles her pants, and lets her package dangle free before you.");
	output("\n\nYour eyes bulge and your tongue lolls at what you’re presented with: two knotted human cocks, each easily measuring a foot in length, with a nice, plump pair of balls to match, <i>and it all looks so delicious.</i> All you can think of is having both of those wonderful dongs between your lips, shooting their hot load down your throat, but you can only sit here and wait for your master’s next command, <i>like a good pet</i>.");
	output("\n\n<i>“Like what you see, " + pc.mf("boy","girl") + "?”</i> Belle asks with a smile, reaching a hand down to cup your cheek while simultaneously yanking your leash to pull your face into her crotch.");
	output("\n\nThe smell is heavenly, so earthy and musky, and paired with the heat radiating off her package and onto your cheeks, all you can do is look up at her and pant in answer.");
	output("\n\n<i>“Well, come on then,”</i> the dual-dicked woman says, <i>“Fetch.”</i>");
	output("\n\nThat’s all the invitation you need. You dart for her lower shaft almost immediately, taking her cockhead into your mouth and starting to slide your [pc.lips] down her shaft, barely giving yourself any time to breathe. Belle places a hand on your head, letting a pleasured, shuddering breath escape her lips as the molten cockflesh of her upper dong carresses your cheek. Speaking of her other cock, it seems a little neglected, desperately and enviously leaking pre onto your face. <i>That won’t do at all; you need to make sure your master feels as good as possible.</i> Far beyond being able to have second thoughts at this point, you reach a hand up and take hold of Belle’s other cock, gently stroking it as you start bob your head up and down her lower, equally turgid and lengthy rod.");
	output("\n\n<i>“</i>Ah<i>, yes!”</i> The lady scientist moans, ");
	if(pc.isPuppyorKitten() && pc.hasEmoteEars()) output("giving your ears a scritch, ");
	output("<i>“Good " + pc.mf("boy","girl") + ", keep going, just like that.”</i>");

	output("\n\nYou can almost feel the woman’s grip on your leash tighten as you start to move your tongue along the cock lodged firmly in your mouth, tracing all along her shaft and wetting her cockflesh with your saliva. Even though you can’t see it, you can definitely sense a crowd gathering behind you to watch this little spectacle unfold, <i>but you can’t focus on that right now, because all that matters is making your master cum</i>.");

	output("\n\nRedoubling your efforts, you start to move your mouth and hand faster, striving to bring Belle to orgasm. Your hard work quickly pays off, because soon after you hear a long, lewd groan force its way past the human woman’s pouty lips, her grip on your head tightening. You can already feel her cocks spasm in your mouth and dexterous grip.");

	output("\n\nYou’re rewarded with a big, salty load down your throat, creamy spunk flowing down your gullet as your master rides out her climax, swelling your stomach until you’re feeling quite full and looking positively pregnant. Meanwhile, her other dong discharges all over your face, [pc.hair], and hand, leaving you thoroughly covered in hot white terran cum.");

	output("\n\nPulling yourself off Belle’s twin cocks as she cums down from her peak, you look up at her expectantly, your face glazed with her seed and your tummy filled with her bountiful load.");

	output("\n\n<i>“Good " + pc.mf("boy","girl") + ",”</i> she manages to coo between lengthy breaths, her large chest heaving.");

	output("\n\nYou smile at her words, <i>and why wouldn’t you? You did such a good job making your master cum like that</i>.");
	output("\n\n<i>“Well, looks like those ‘master first’ subroutines I programmed are working perfectly now, unlike the last time I tried this,”</i> Belle says, pulling her pants back up and taking a good look at the now dispersing crowd, <i>“Come then, " + pc.mf("boy","girl") + ", there’s just one last thing I need to test before we can get that collar off you.”</i>");

	processTime(30);
	
	var ppBelle:PregnancyPlaceholder = getBellePregContainer();
	pc.loadInMouth(ppBelle);
	pc.applyCumSoaked();
	pc.exhibitionism(1);
	
	clearMenu();
	addButton(0,"Next",postWalkiesHeat, ppBelle);
}

//Heat
public function postWalkiesHeat(ppBelle:PregnancyPlaceholder):void
{
	clearOutput();
	showBelle();
	author("HugsAlright");
	output("Belle walks you back to her lab, keeping a firm grip on your leash in an attempt to avoid any further distractions, although your naked form and cum-covered [pc.face] draw more than a few lustful looks on the way back. Your master keeps you in line though, all the way back to her scientific workspace.");
	rooms["SUBSHIT"].addFlag(GLOBAL.NPC);
	moveTo("SUBSHIT");
	processTime(2);
	clearMenu();
	addButton(0,"Next",postWalkiesHeat2, ppBelle);
}

public function postWalkiesHeat2(ppBelle:PregnancyPlaceholder):void
{
	clearOutput();
	showBelle();
	author("HugsAlright");
	output("Once you’re well within the relative privacy of Belle’s lab, the lady scientist walks over to a nearby bench and picks up a small remote, still leading you by your leash.");
	output("\n\n<i>“This,”</i> she begins, holding up the remote for you to see, <i>“Is the newest addition to the Sub-Tuner, and I’ve still yet to test it. So, you’re going to be the very first person to try out the new ‘heat’ functions.”</i> The green-eyed woman goes to press a small button on the remote before continuing, keeping her eyes fixed on you, <i>“You may notice some... unpleasant sensations.”</i>");
	output("\n\nAlmost immediately after that little switch is flicked, you can feel your ");
	if(pc.hasCock()) output("[pc.cocks] start to swell and stiffen with need");
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) output("[pc.vaginas] slobbering with a want to be filled");
	output(". Heat flushes through your body, a sign of your hunger that can only be sated by one thing: sex. There’s no doubt about it: you’re in ");
	if(pc.hasCock()) output("a rut");
	if(pc.isHerm()) output(" <i>and</i> ");
	if(pc.hasVagina()) output("heat");
	output(", and you need to breed.");
	output("\n\nYou look up to your master and whine, whimpering to let her know of your sexual distress. She responds with a smirk before speaking up again, <i>“Hmm, looks like it’s working.”</i>");

	var x:int = -1;
	if(pc.hasCock()) x = pc.cockThatFits(saecVaginaCapacity());
	var v:int = -1;
	if(pc.hasVagina()) v = rand(pc.vaginas.length);
	//hasCock:
	if(x >= 0)
	{
		showName("BELLE\n& SAEC");
		showBust("BELLE","SAEC");
		output("\n\nYour master takes one look at your throbbing, needy cock");
		if(pc.cockTotal() > 1) output("s");
		output(" before giving you a knowing smile, <i>“What’s wrong, " + pc.mf("boy","girl") + ", feeling pent up?”</i>");
		output("\n\nYou nod as fast as you can, hoping Belle can do something to fix this terrible rut you’re in, with your desire to cum only having grown since your earlier escapades with the human woman.");
		output("\n\n<i>“Just wait here a moment,”</i> she says, dropping your leash and walking towards another room in her lab, <i>“I have just the thing you need.”</i>");
		output("\n\nA strange feeling of sorrow overtakes your lust for a moment as your master leaves you there, <i>because what’s a pet without their master</i>. You don’t have to endure that pain for long though, because soon after she leaves, Belle is back again, and with a new friend: she’s got a pretty blonde ausar girl on a leash, wearing a collar similar to yours, and by all standards she’s quite the beautiful bitch, with her flowing mane, womanly figure and full breasts all put on display.");
		output("\n\n<i>“");
		if(flags["MET_SAEC"] == undefined)
		{
			output("This is Saec,”</i> the human woman starts, leading her blonde ausar beauty over to you, <i>“She’s another one of my pets, and she just </i>loves<i> being bred by big, thick cocks");
			flags["MET_SAEC"] = 1;
		}
		else output("I think Saec is ready to be bred by a big, thick cock");
		output("; don’t you, girl?”</i> The ausar gives a happy little bark in response, like a good puppy, before her master turns back to you, <i>“And I want </i>you<i> to breed her for me. How does that sound?”</i>");
		output("\n\nYou take one look at Saec before nodding eagerly, ");
		//pcAusar/Kaithrit/Half:
		if(pc.isPuppyorKitten() && pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output("[pc.tail] wagging in an off-beat rhythm, ");
		output("barely able to contain your excitement.");
		output("\n\n<i>“Good,”</i> the lady scientist coos, smiling at your impatience before turning to face her other pet and giving the ausar a scratch between her ears, <i>“Alright, girl, think you’re ready for pups?”</i>");
		output("\n\nThe blonde-haired girl takes her gaze off Belle for a moment to look at you, and your [pc.cocks] in particular before a big, dumb grin appears on her face. Turning back to her master, she nods vigorously, clearly ready to take what you plan to give her. Belle gives the pup one last <i>“Good girl”</i> as she lets go of Saec’s leash, allowing the happy ausar to crawl her way over to you on her fluffy hands and her fuzzy knees before she throws herself onto her back. Once she’s well and in position, the slutpuppy spreads her shapely legs for you, giving you a good view of her slobbering cunt, looking at you with a gaze that’s just as hungry as yours.");
		output("\n\nThat’s all the invitation you’ll ever need. You’re on the horny ausar in seconds, mounting her, straddling her on all fours and driving your [pc.cock " + x + "] deep into her pussy. The blonde beauty cries out with pleasure, throwing her legs around your back as you shove more and more cock into her drooling pink slit.");
		if(pc.isLactating()) output(" Saec takes quick notice of your [pc.nipples] as you spread her lower-lips wide open, and eagerly takes one into her mouth, voraciously suckling on your [pc.breasts] and setting you moaning.");
		output("\n\nWith the onslaught of pleasure you’re experiencing, all you can stand to do is move your hips, dragging your [pc.cock " + x + "] in and out of Saec’s cunt as it squeezes and hugs at your tool, all while Belle watches happily and pleasured tones fill the room. <i>It just feels so good to breed this ausar like a proper bitch.</i>");
		IncrementFlag("SEXED_SAEC");
		pc.cockChange();
	}
	//hasVag:
	if(v >= 0)
	{
		if(x >= 0)
		{
			showName("BELLE\n& SAEC");
			showBust("BELLE_NUDE","SAEC");
		}
		output("\n\nYour master circles around behind you, getting a good look at your wet, needy pussy as she kneels down, getting her hands all over your [pc.hips]. Shortly after, you feel a finger run along your nether-lips, gathering up beads of [pc.girlCum] as it makes its way towards your taint.");
		output("\n\n<i>“My, my,”</i> Belle breaths lustfully, <i>“Looks like the heat harmonics might have been tuned a little too high, judging by how wet you are. What do you say, " + pc.mf("boy","girl") + ", want me to fix that problem for you?”</i>");
		if(x >= 0) output("\n\nAs you’re still fucking Saec with as much vigor as you can muster, you manage to look over your shoulder");
		else output("\n\nYou manage to look over your shoulder at the human woman");
		output(" and give her a whimper and a nod");
		//noCock:
		if(x == -1) output(", with your desire to cum only having grown since your earlier escapades with the lady scientist");
		output(".");

		output("\n\nTurning back around, you need only wait a moment before your feel one of Belle’s cockheads press against [pc.oneVagina], and another against your [pc.asshole]. The sudden pressure on both of your sodden holes makes you whimper with pleasure and pain");
		if(x >= 0) output(", still breeding Saec and pumping your [pc.hips] as fast as you can");
		output(". Before you can try to relax, your master thrusts her hips forwards, slipping her twin dongs into both of your holes. You cry out with pleasure as you’re penetrated by both of Belle’s cocks at once, spreading your pucker wide open and leaving your pussy wonderfully agape. Barely giving you any time to recover from her dual-dicks, the lady scientist behind you starts to shove more and more terran cock into you.");
		output("\n\nIt isn’t long before your master’s ever-expansive hips start to move, fucking you like the bitch in heat you are, her knots spreading your supple entrances with each thrust. <i>The feeling of being bred like this, of having your hungers sated, it all feels so good.</i> You moan as loud as you can with each thrust of Belle’s foot-long cocks, crying out as your inner walls hug at her shafts, eagerly accepting her turgid dicks into your waiting holes.");
		pc.cuntChange(v,ppBelle.cockVolume(0));
		pc.buttChange(ppBelle.cockVolume(1));
		//IncrementFlag("SEXED_SAEC");
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
	if(v >= 0)
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
		output("\n\n[pc.Girlcum] spills out around one of Belle’s turgid terran rods as it spasms inside your [pc.vagina " + v + "], her upper cock doing the same, already dispensing their white, molten loads into both of your holes. With not a moment to lose, the multi-cocked human slams her hips forward, driving her knots into your holes. You cry out as your [pc.vagina " + v + "] and [pc.asshole] are spread even wider by the balls of cockflesh, stretching your orifices until they finally pop in, leaving you in ecstasy. You whimper as you’re pumped full of your master’s seed for the second time today, feeling her hot cum distend your [pc.stomach] until you’re feeling and looking full all over again. The lady scientist’s orgasm persists for quite some time, fully emptying her large pair of balls into you until the pressure is so great cum can only dribble out of your sodden, well-used holes. <i>You did a good job making your master cum like that.</i>");
	}
	//hasCockOnly:
	if(x >= 0 && v < 0)
	{
		output("\n\nWith ");
		if(pc.hasKnot(x)) output("your [pc.cock " + x + "] thoroughly knotted inside Saec’s pulsing cunt");
		else 
		{
			output("your bitch thoroughly bred and filled with cum");
			if(pc.isLactating()) output(" (and [pc.milk])");
		}
		output(", you’re left with your [pc.chest] heaving over the blonde ausar. Looking towards your master for some sign of approval, she gives you a smile and a nod, along with an assortment of <i>“Good " + pc.mf("boy","girl") + ",”</i> and other praises.");
		output("\n\n<i>What a good pet you are, no doubt you’re a good breeder as well now.</i>");
	}
	//Else:
	else
	{
		output("\n\nYou’re left panting under the weight of your post-orgasmic euphoria, with ");
		if(x >= 0) output("both Saec and ");
		output("Belle’s chest");
		if(x >= 0) output("s");
		output(" heaving with every breath ");
		if(x < 0) output("she takes");
		else output("they take");
		output(". Looking back at your master for some sign of approval, she gives you a slap on your [pc.butt] along with a tired, out-of-breath <i>“Good " + pc.mf("boy","girl") + ".”</i>");
		output("\n\n<i>What a good pet you are.</i>");
	}
	//[Next]
	processTime(30);
	pc.orgasm();

	if(v >= 0)
	{
		pc.loadInCunt(ppBelle, v);
		pc.loadInAss(ppBelle);
	}
	
	clearMenu();
	addButton(0,"Next",subTunerOvah);
}

public function subTunerOvah():void
{
	clearOutput();
	showBelle();
	author("HugsAlright");
	var x:int = -1;
	if(pc.hasCock()) x = pc.cockThatFits(saecVaginaCapacity());
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
	if(!pc.hasPerk("Barcoded"))
	{
		output("\n\n<i>“Before I let you go,”</i> Belle begins, reaching over to a nearby lab bench and grabbing a small, black, rectangular box, <i>“There’s just one last thing I need to give you.”</i>");
		output("\n\nWith that said, the Lady scientist walk around behind you, taking up a position just behind your [pc.butt]. You’re unable to control your excitement, expecting another treat from your master");
		//pcAusar/Kaithrit/Half:
		if(pc.isPuppyorKitten() && pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output(", [pc.tails] wagging uncontrollably");
		output(".");

		output("\n\nThen you feel plastic press against your [pc.skinFurScales] followed by a light tingling sensation from what you can only assume to be the strange device only moments before Belle pulls herself back with a quiet <i>“There we go.”</i>");
		output("\n\nTurning your head to try and get a look at what just happened, you’re able to make out what seems to be a barcode on your rump; it’s black, sleek, and more than a bit demeaning.");
		output("\n\nYou gaze back up at your master with a confused look on your face, expecting some sort of explanation from the woman, though, <i>she doesn’t have to answer to her pet</i>.");
		output("\n\nThe woman returns your curious mien with a smirk, <i>“I keep very detailed files on all of my test subjects, and I need one for you, especially.”</i>");
		output("\n\n<b>You’ve got a barcode on your ass now!</b>");
		//For when the tattoo system is implemented: Should give the PC’s ass a “barcoded” tag or descriptor.
		//This could also behave like Sera’s Slut Stamp, as a perk of sorts, if this is the case, then: Barcode Perk Description: A sleek black barcode is printed on your ass, left there by Dr. Belle for purely scientific purposes.
		//Appearance screen blurbs: “There’s a barcode on your left butt cheek, forever marking you as the property of Belle and Accu-Pitch Labs.” OR (Random 50/50) “On one of your ass cheeks is a barcode, placed there by Dr. Belle for her scientific research, and to remind you of your place as her pet.”
		pc.createPerk("Barcoded",0,0,0,0,"A sleek black barcode is printed on your ass, left there by Dr. Belle for purely scientific purposes.")
	}
	output("\n\nBelle goes to grab your leash, giving you and order of <i>“Up, " + pc.mf("boy","girl") + "”</i> as she pulls your tether taut, and quick to follow orders, you stand up.");
	output("\n\n<i>“Everything’s working better than I could have hoped,”</i> your master exclaims, reaching to unhook her leash from your collar, <i>“Which means this little endeavor has yielded more potential than I would have ever believed, and I couldn’t have done it without you, good " + pc.mf("boy","girl") + ".”</i> She ");
	//pcAusar/Kaithrit/Half: 
	if(pc.isPuppyorKitten() && pc.hasEmoteEars()) output("scratches your [pc.ears]");
	else output("ruffles your [pc.hair]");
	output(", giving you the most profound sense of fulfillment you’ve felt in a while.");

	output("\n\nThen Belle extends a single finger, and turns your collar off. All your pet-like feelings fade in an instant, dying down until you realize what you’ve been doing for the past few hours, though, you can’t find yourself upset about any off it, as if a hint of the ");
	//upgradedSubTuner:
	if(subTunerUpgraded()) output("metal");
	else output("leather");
	output(" ring’s subbiness has rubbed off on you. You also couldn’t deny that all that sex was mind-blowing... even if you wanted to.");

	output("\n\nAt this point you can only give your former-master a blank stare, finding yourself at a loss for words. Belle knows just what to say though: <i>“");
	//firstTime: 
	if(flags["SUB_TUNERED"] == undefined) output("Hmm, why don’t you keep that collar; no doubt I’ll be working on a new prototype for quite some time. I must say, you’re one of the best subjects I’ve ever had, and it would just be </i>wonderful<i> if you ever felt like running some more tests with me. Don’t worry about that thing turning on, by the way. It’s got a proximity limiter installed, and can’t be activated unless you’re well and deep inside my lab. ");
	//notNude: 
	if(!pc.isNude()) output("Well, I suppose you should get dressed and be on your way.");
	else output("Well, I suppose you should be on your way then, my pet.");
	output("”</i>");
	output("\n\nYeah, that sounds like a good idea right about now.");

	if(!pc.hasKeyItem("Sub-Tuner Collar"))
	{
		output("\n\n<b>You got the Sub-Tuner collar!</b>");
		//Should give and equip the Sub-Tuner, as well as add it to the collar selection. Description: Collar - Sub-Tuner: a black leather collar covered in a web of wiring and circuitry.
		pc.createKeyItem("Sub-Tuner Collar",0,0,0,0);
		
		//Actually equip it
		toggleCollar("Sub-Tuner");
	}
	//[Next] //Should return the PC to outside of Accu-Pitch labs, adds some libido.

	IncrementFlag("SUB_TUNERED");
	processTime(10);
	clearMenu();
	addButton(0,"Next",leaveAccuPitchLabs);
}

//Saec is not impregnable right now, pregnant variants are for further expansion.
//Variants that apply to ausar should also apply to huskar.
//Total: 31831 Words.
//New Opening Blurbs
public function newSubTunerOpening():void
{
	clearOutput();
	author("HugsAlright");
	moveTo("SUBSHIT");
	showName("ACCUPITCH\nLABS");

	//firstTime:
	if(flags["ACCUPITCH_VISIT"] == undefined)
	{
		output("Making your way up to Accu-Pitch labs, you can see that the door is sealed and well-locked, but there’s a small scanner next to the entrance. Maybe it will recognize one of Doctor Belle’s test subjects?");
		output("\n\nYou start with your eye, but the scanner does nothing, then your palm, then your fingertips, but nothing seems to be doing the trick.");
		output("\n\nWait, could it be that barcode the woman-scientist put on your ass? Well, it’s worth a shot. You ");
		//notNude: 
		if(!pc.isAssExposed()) 
		{
			output("drop your [pc.assCover] ");
			output("just enough so that the tattoo peeks out and ");
		}
		output("place your [pc.butt] close to the scanner. Sure enough, the little holo-pad picks up on your barcode and scans it with an approving <i>blip</i>, the door hissing open soon after...");
		flags["ACCUPITCH_VISIT"] = 1;
	}
	//repeat:
	else
	{
		output("Walking your way up to Accu-Pitch labs, you can see that the door is once again sealed and locked, that all-too familiar scanner sitting next to the entrance.");
		output("\n\nJust like last time, you ");
		if(!pc.isAssExposed()) output("drop your [pc.assCover] just enough so that the tattoo peeks out and ");
		output("place your [pc.butt] close to the scanner.");
		if(pc.exhibitionism() >= 66 || pc.isBimbo()) output(" You feel a slight rush as your private-areas are examined by the door, loving something about being treated like this.");
		else output(" You’re met with a slight pang of embarrassment when your ass meets the scanner, though, you feel as though some part of you is actually enjoying the experience.");
		output(" Sure enough, the little holo-pad picks up on your barcode and scans it with an approving <i>blip</i>, the door hissing open soon after...");
	}
	rooms["SUBSHIT"].addFlag(GLOBAL.NPC);
	processTime(1);
	clearMenu();
	addButton(0,"Next",move,"SUBSHIT");
}
public function accupitchLabsBonus():Boolean
{
	if(pc.hasStatusEffect("Belle Hypno") && pc.hasGenitals()) 
	{
		labWalkInHypnoEvent();
		return true;
	}
	author("HugsAlright");
	var msgList:Array = [];
	//Along with the original opening with the original opening scanner and Accu-Pitch descriptions, these blurbs can show up after that, random chance for each:
	msgList.push(
		"\n\nBelle is nearby, her pants looking as full as ever, jotting down notes on a holo-pad as she moves from terminal to terminal, working diligently."
	);
	//OR
	//noSaec:
	if(flags["MET_SAEC"] == undefined) msgList.push(
			"\n\nBelle is nearby, sitting in a chair and playing with what looks to be a pretty blonde ausar girl. She’s wearing a collar very similar to yours, nuzzling against Belle’s legs as she’s pet and showered with praise by the lady scientist, fluffy tail swaying happily." + 
			"\n\nYou can’t help but feel a pang of jealousy seeing Belle treat someone else like that. Maybe you could do something like that with her one day..."
		);
	else {
		//OR
		//datedSaec:
		if(flags["SAEC_DATES"] != undefined) msgList.push(
			"\n\nBelle is nearby, working at a computer terminal with Saec on a leash... right between her legs. You’re able to catch a glimpse of the ausar’s head as it bobs back and forth on one of her master’s foot-long cocks, moaning and whining gently." + (pregSaec() ? " Her swollen, pregnant belly is easily visible as its taut flesh is caressed by one of Saec’s blonde-furred hands." : "") +
			"\n\nYou wince with jealousy " + (pregSaec() ? ", seeing your knocked-up bitch sucking someone else’s shaft like that, but at the same time you wish" : ", wishing") + " it was you between Belle’s legs right now."
		);
		//OR
		//pregSaec:
		if(pregSaec()) msgList.push(
			"\n\nBelle is nearby, working at one of her benches, but she’s got Saec on a leash next to her. The ausar girl affectionately nuzzles and rubs against the lady scientist’s legs while she goes about her business, seeming happy to just be next to her master." +
			"\n\nMore importantly, though, Saec’s normally flat tummy seems quite a bit swollen, and her breasts quite a bit fuller. By your guess, she’s most definitely pregnant, and you think that might be your doing." +
			"\n\nWhoops."
		);
		//OR
		//metSaec:
		else msgList.push(
			"\n\nBelle is nearby, and she’s sitting down with Saec in her lap, showering the blonde pup with kisses who in turn giggles happily. You can see her master’s hands work their way all over the ausar girls body, caressing all her curves." +
			"\n\nA very tangible feeling of jealousy washes over you at the sight of that, leaving you to wonder why you haven’t received a greeting like that..."
		);
	}
	output(msgList[rand(msgList.length)]);
	processTime(2);

	addButton(0,"Belle",newApproachBelle,undefined,"Belle","Meet with the doctor.");
	return false;	
}


//[Belle]
public function newApproachBelle(back:Boolean = false):void
{
	clearOutput();
	showBelle();
	author("HugsAlright");
	if(back) output("What now?");
	else
	{
		output("You walk up to Belle, alerting her to your presence along the way. She quickly turns around and greets you with a smile ");
		//met/preg/datedSaec:
		if(flags["MET_SAEC"] != undefined) output(", sending Saec away before you reach her");
		output(".");

		output("\n\n<i>“Ah, hello again. Here to assist me with some more experiments?”</i>");
		processTime(2);
	}
	clearMenu();
	//[Appearance] Get a look at this lovely-looking lady.
	//[Experiments] Ask to participate in more experiments for Belle.
	//[Talk] See if you can have a chat with the woman.
	//[Dates] Maybe you can have some alone time with your favourite master? //Requires more than 3 experiments to have been done.
	addButton(0,"Appearance",belleAppearance,undefined,"Appearance","Get a look at this lovely-looking lady.");
	addButton(1,"Experiments",newExperimentsWithBelle,undefined,"Experiments","Ask to participate in more experiments for Belle.");
	addButton(2,"Talk",talkToBelle,undefined,"Talk","See if you can have a chat with the woman.");
	addButton(3,"Dates",datingBelle,undefined,"Dates","Maybe you can have some alone time with your favorite master?");
	addButton(14,"Leave",mainGameMenu);
}

////Appearance
//[Appearance] //New option in Belle’s menu.
public function belleAppearance():void
{
	clearOutput();
	showBelle();
	author("HugsAlright");
	output("Dr. Belle Baslocvicz is a 5\' 11\", slightly-modded human woman. Her hair is black, long, and kept in a ponytail to keep it out of the way of the lady scientist’s fair-skinned face and equipment. With her locks pulled away like curtains, Belle’s face is easily visible, from the soft, feminine curves of her face, to her pouty lips and green eyes; a lovely-looking woman if you ever saw one.");
	output("\n\nPast the features of her visage, Dr. Baslocvicz’s body is truly something to behold. She’s got very large breasts that jiggle and quake with every step she takes, double-Ds at the least, though, you can’t help but wonder if they get in the way of her work. Past her chest rests Belle’s svelte midsection, along with a comparatively wide, impressive set of hips below that, and an even more impressive derriere behind that.");
	output("\n\nThough, most of your interest lies in what’s inside Belle’s pants, mainly her twin Terran cocks. Each one easily measures a foot in length, with a big, bitch-breaking knot at the bottom of each of her shafts, just perfect for taking care of her pets. Her large balls swing heavily between her legs, oh-so full of cum. Opposite her dual-dongs rest a pink human pussy, rarely used by the lady scientist herself.");
	output("\n\nAll of Belle’s body is covered by a labcoat, and scientist fatigues below that, hugging her massive bust well enough, and serving to display her massive bulge in a way that almost makes your tongue loll and your ");
	if(pc.hasCock()) output("[pc.cocks] stiffen");
	else output("[pc.vaginas] drool");
	output(".");

	//metSaec:
	if(flags["MET_SAEC"] != undefined) 
	{
		output("\n\nNearby Belle at almost anytime is Saec, the human woman’s loyal ausar pet, all blonde and pretty and ready to heed her master’s commands.");
		output("\n\nAs you’ve seen before, Saec is a very beautiful bitch, with her womanly visage, curves, and those lovely golden locks flowing around her face, parted briefly by her big, fluffy puppy ears. She’s very well-endowed, even compared to Belle, her big E-cups dwarfing her master’s bust by comparison. With the ausar bent over on all fours almost all the time, it’s very easy to see her big, squishy butt and shapely thighs put on display, all topped with her swishing, fluffy blonde tail, colored the same hue as the fur on her limbs. Though, even on her hands and knees, it’s easy to tell Saec is a <i>very</i> big girl, a foot taller than her master <i>at the least</i>.");
		if(pregSaec()) output(" Her normally flat tummy is swollen and pregnant, most likely due to your escapades with her.");

		output("\n\nHer skin is tanned and fair, but you can spot a few small scars on her near blemishless flesh, hard to see and very old from the looks of them, definitely from before Belle met the pup.");
		output("\n\nShe’s, of course, not wearing any clothes, but you spot a collar similar to yours around her neck, covered in wiring and electronics, though it seems to be turned off.");
	}
	clearMenu();
	addButton(0,"Next",newApproachBelle,true);
}

//Talk
//[Talk] //New option in Belle’s menu.
public function talkToBelle():void
{
	clearOutput();
	showBelle();
	author("HugsAlright");
	output("<i>“Oh?”</i> Belle coos, bringing one of her hands up to cup your cheeks, stroking your [pc.skinFurScales] with her thumb, <i>“Have something you want to ask me, my little pet?”</i>");

	processTime(1);
	belleTalkMenu();
}

public function belleTalkMenu():void
{
	clearMenu();
	addButton(0,"Her",talkToBelleAboutHer,undefined,"Her","Ask the lady scientist what it’s like being her.");
	addButton(1,"Work",workWithBelle,undefined,"Work","What exactly does she do here at Accu-Pitch.");
	addButton(2,"Master",belleMasterTalk,undefined,"Master","Belle seems pretty into pet-play, maybe you could ask her about her affinity for it.");
	addButton(14,"Back",newApproachBelle,true);
	
}

public function talkToBelleAboutHer():void
{
	clearOutput();
	author("HugsAlright");
	showBelle();
	output("<i>“Me?”</i> Belle asks, placing a hand just above her impressive bust, <i>“Well, if you really want to know, I could share a few things.”</i> The woman walks over to nearby pair of chairs before extending an arm, <i>“Here, [pc.name], have a seat.”</i>");
	output("\n\nYou do as she says and sit down in one of the chairs, and she does the same in the seat across from you. The piece of furniture is rather cushy for being in a lab.");
	output("\n\n<i>“I’m from Terra, if you couldn’t tell, and I was born into a rather wealthy family,”</i> she pauses and smiles, giving a light chuckle before she continues, <i>“I remember when I grew up my parents had archived some old articles exclaiming that the ‘heir to the Baslocvicz fortune’ was born. Most of them were tabloids, really, but it was just an odd experience to see myself get so much recognition just because my parents decided to have a child. I certainly grew up like the daughter of a wealthy couple: parties, dresses, long visits to places I didn’t particularly care about, you name it.”</i>");
	output("\n\nBelle takes a deep breath and adjust her poster before setting her gaze on you, <i>“Well, I didn’t like the thought of just sitting around being my parents’ daughter all my life, so I did what I always wanted to do and became a scientist. It took quite a while, but, here I am today, my own lab and everything.”</i>");
	output("\n\nThe lady scientist is left smiling wide after that, content in her own achievements, but it prompts you to ask her what she actually specialized in, what kind of education she got, and what got her this lab.");
	output("\n\n<i>“My parents insisted I got the best money could buy,”</i> Belle starts to explain, <i>“and no matter how much I told them that I would pay my own tuition at a much less... prestigious university, mother and father sent me all the way to Luna Polytechnic, on the lunar colonies. While I was there I got my doctorate in acoustical engineering, my degrees xenobiology and neurobiology, specializing in how the brain receives audio feedback, of course, and learned to play piano quite a bit. Accu-Pitch employed me almost immediately after I graduated, no doubt partly due to my parents’ reputation, but I like to think my thesis did most of the work.”</i> The woman gives you a little wink after that, almost like you know something you probably don’t, <i>“And, after a few secured grants and hefty patents, Accu-Pitch gave me my own lab here on Uveto, mostly so I could keep to myself.”</i>");
	output("\n\nBelle gives you a little smirk and leans a bit closer to you, <i>“Though, none of that is nearly as interesting as you, is it, " + pc.mf("Mister","Misses") + " Steele?”</i>");
	if(flags["SUBTUNER_NAMED"] == undefined || flags["SUBTUNER_NAMED"] == 1)
	{
		output("\n\nYour eyes go wide at that little accusation, and you tentatively ask the woman how much she actually knows about you.");
		output("\n\n<i>“Oh, quite a bit,”</i> Belle says cheerfully, standing up from her seat to walk over towards a nearby terminal, <i>“Like I said before, I keep quite detailed files on all my pets and subjects.”</i> With that she flicks the holo-terminal on and scrolls through all the text lining the screen, <i>“");
		//ifNotALoser: 
		if(flags["PLANET_3_UNLOCKED"] != undefined) output("Mhen’ga, Tarkus, Myrellion...");
		else
		{
			output("From ");
			if(9999 == 9999) output("Mhen’ga");
			else output("Phaedra");
			output(" all the way to Uveto...");
		}
		output(" quite the little adventure you’ve been on, hmm?”</i>");
		output("\n\nSeems like Belle is quite the knowledgeable individual, either that or she just really likes you.");

		//annoCrew:
		if(annoIsCrew()) 
		{
			output("\n\n<i>“I also hear you’re friends with the esteemed Anno Dorna,”</i> the scientist chimes in again with a big smile on her face, <i>“Maybe she’d like to come down to my lab for some friendly discussions with a fellow lady of science, or maybe participate in a few experiments with you.”</i>");
			output("\n\n<i>Yeah... maybe she would.</i>");
		}
		//[Next] //This scene should give the same “Belle knows the PC’s name” flag that the random encounters with Anno, Syri, and Kiro give.
		flags["SUBTUNER_NAMED"] = 2;
	}
	processTime(15);
	//belleTalkMenu();
	addDisabledButton(0,"Her","Her","You just had this discussion!");
}

//Work
//[Work]
public function workWithBelle():void
{
	clearOutput();
	author("HugsAlright");
	showBelle();
	output("<i>“You mean what I do here at the lab?”</i> Belle asks, <i>“Well, I’m an acoustical engineer of sorts, and over the past few years I’ve been looking deeper and deeper into how exactly you can affect the thought-patterns of sentient creatures with it.”</i>");

	//wearingSubTuner:
	if(wearingSubTuner())
	{
		output("\n\nYou toy with the collar around your neck for a moment, rolling wires between your fingers ");
		if(pc.isBimbo()) output("guessing that it <i>probably</i> has something to do with that Belle is talking about");
		else output("pondering what the true purpose Belle gave it could be");
		output(".");
	}
	//Else: 
	else
	{
		output("\n\nYou reach into your things quickly and pull out the collar Belle gave you, covered with circuitry and metal, ");
		if(pc.isBimbo()) output("guessing that it <i>probably</i> has something to do with that she’s talking about");
		else output("pondering what the true purpose she gave it could be");
		output(".");
	}
	output("\n\n<i>“The Sub-Tuner is one of my latest developments in that field,”</i> Belle says with a smile before walking over to a nearby pair of chairs, which look rather elegant for lab furniture, and sitting down in one, <i>“Here, [pc.name], take a seat and I’ll explain what I’m working on.”</i>");
	output("\n\nDoing as she says, you plop yourself down on the soft cushions of the chair, ready to listen to what your scientist friend and master has to say.");

	output("\n\n<i>“Now, what I’m creating isn’t actually going to look like what ");
	//wearingSubTuner:
	if(wearingSubTuner()) output("you’re wearing");
	else output("I gave you");
	output(",”</i> Belle explains leaning to the side in her chair, resting her chin on her fingers in a very practiced, poised manner, <i>“The Sub-Tuner is more of a proof of concept, a thesis of sorts on how sound can make a person more... compliant. The real purpose of the technology embedded in that collar is non-lethal weaponry, crowd-control, riot pacification without casualties, that kind of thing. Of course, I made the Sub-Tuner to help me test specific programs and frequencies on individuals rather than full crowds of people this technology would most likely be used on... and I’m very fond of collars.”</i>");

	output("\n\nBelle smiles and leans forward in her seat, taking up a less elegant post and resting a cheek in her own hand, <i>“It’s amazing, isn’t it, what simple vibrations in the air can do to the brain? Order notes in a song just the right way and you can bring an entire crowd to tears, or applause... that was just the beginning of what got me interested in this particular field of study. I always wondered how far sound alone could push the mind, and now I’m learning. The simplest of tones played at the right frequencies can have a very calming effect on subjects, as I’ve found out with my little prototype that you’re wearing, but I’ve yet to explore the other side of the spectrum, with...”</i>");

	output("\n\nAs Belle drones on about her work, you can feel your eyelids becoming heavy, head drooping and leaning every which way until you’re continuously pulling yourself from the grips of sleep while the scientist’s story continues.");

	output("\n\nIt isn’t until the woman is on the topic of xenobiology that Belle notices your current state, <i>“Ausar are particularly interesting, since they can hear much farther and much higher pitches than humans, I’ve had too... oh, my apologies, [pc.name].”</i>");

	output("\n\nShe reaches over to your seat and gives you a little pat on the head, waking you up quite bit and sending a little rush of pleasure down your spine.");

	output("\n\n<i>“I’ve been known to get a little... carried away when talking about my work,”</i> Belle explains with a fair bit of blush on her face, <i>“But I’m glad you took some interest as to what your master is up to.”</i>");

	processTime(15);
	addDisabledButton(1,"Work","Work","You just had this discussion!");
}

//Master?
//[Master]
public function belleMasterTalk():void
{
	clearOutput();
	showBelle();
	author("HugsAlright");
	output("<i>“Oh, aren’t pets just lovely?”</i> Belle exclaims, clasping her hands together and smiling, <i>“No matter what happens you love them and they love you, as unconditional as anything good in the world can get.”</i>");
	output("\n\nStill grinning wide, Belle looks at you and continues her happy little explanation, ");
	//metSaec:
	if(flags["MET_SAEC"] != undefined) output("<i>“Speaking of, you’ve met Saec already, right?”</i> The lady scientist turns away from you for a moment and starts to call out, <i>“Saec, girl, why don’t you come out and say ‘hi’ to [pc.name] while they’re here?”</i>");
	else output("<i>“Speaking of, I don’t think you’ve met my pet, Saec, have you?”</i> After you give the woman a shake of your head, she starts to call out, <i>“Saec, girl, why don’t you come out here? I’ve got a guest that would like to meet you.”</i>");

	//metSaec:
	if(flags["MET_SAEC"] != undefined)
	{
		output("\n\nSoon after Belle calls for her, you hear the patter of Saec’s furred limbs on the floor as she approaches on all fours, looking as happy as ever. She quickly makes her way to her master, rubbing her naked flesh against the lady scientist’s clothes and nuzzling her fluffy blonde mane into her legs.");
		output("\n\n<i>“Good girl,”</i> Belle coos, reaching down to scritch at Saec’s ears before giving the ausar a little nudge over to you. The blonde pup takes the hint and makes her way closer to you for a similar treatment, rubbing all her blonde fluff against your legs, aching for a good petting.");
		//pregSaec:
		if(pregSaec()) output(" Her belly is swollen with what you can only assume to be little half-breed pups.");

		output("\n\nYou give the girl what she wants and run your hand through her mane and across her ears, all the way down to her collar, which you can see is actually turned off now that you can get a better look at it.");
	}
	//Else:
	else
	{
		output("\n\nSoon after Belle calls for her, you hear the patter of fur on the ground, and look to see a pretty blonde ausar girl approaching on all fours from the other room. She’s got a rich, golden mane that’s parted by her ears, and has a fluffy tail to match, along with more soft fur lining her limbs. She’s also completely naked, with her womanly curves and full breasts put on display for her master to see.");
		output("\n\nSaec quickly makes her way to Belle, rubbing her naked flesh against the lady scientist’s clothes and nuzzling her fluffy blonde mane into her legs.");
		output("\n\n<i>“Good girl,”</i> Belle coos, reaching down to scritch at Saec’s ears before giving the ausar a little nudge over to you, <i>“Why don’t you got say ‘hi’ to my new friend over there?”</i> The blonde pup takes the hint and makes her way closer to you for a similar treatment, rubbing all her blonde fluff against your legs, aching for a good petting.");
		output("\n\nYou give the girl what she wants and run your hand through her mane and across her ears. Looking down at Saec, you can see she’s wearing a collar that’s very similar to yours, but it appears to be turned off.");
		flags["MET_SAEC"] = 1;
	}

	output("\n\n<i>“Such a good girl, isn’t she?”</i> Belle asks, looking fondly upon her pet as she nuzzles against you, <i>“I first met Saec when this project was just getting started. I had put out notices for willing test subjects: notified them of the risks, the pay, and she was one of the few who were willing to aid me in my experiments. Poor girl was desperate for credits, homeless, abandoned, so we went through the tests and I paid her accordingly, but then she asked to stay with me... begged me, and what else could I do besides let her?”</i> She lets out a long sigh before calling the ausar over to her again, petting her gently and looking down at her pet, <i>“So, here she is, right where she belongs, happy with her master.”</i>");
	output("\n\n<i>“Imagine for a moment, [pc.name],”</i> Belle instructs, running a finger along the edge of one of Saec’s big fluffy ears, <i>“How happy everyone would be if they could have something like this, a master or a pet, someone to love or someone to take care of...”</i> The woman lets out a long sigh and looks back up at you, Saec following suite and beaming up at you, her tail wagging gently, <i>“So, yes, you could say I’m privy to this lifestyle, and I love all my pets dearly.”</i>");

	output("\n\nBelle bends down and gives Saec a little kiss on her forehead before sending the ausar on her merry way, leaving the two of you alone again, and the lady scientist with a smile on her face.");

	processTime(15);
	//[Next] //Should give a “met Saec” type flag.
	addDisabledButton(2,"Master","Master","You just had this discussion!");
}

//New Experiments
//[Experiments]
//This should replace the old experiments button.
public function newExperimentsWithBelle():void
{
	clearOutput();
	showBelle();
	author("HugsAlright");
	output("You tell Belle that you would very much like to help her with more of her experiments, resulting in a big grin from your soon-to-be master.");

	//notWearingSubTuner:
	if(!wearingSubTuner()) output("\n\nFumbling around for a moment, you take out the Sub-Tuner and hand it to the lady scientist, who quickly accepts the collar, wraps it around you neck, and closes it nice and tight.");
	output("\n\nBefore another word can be said, the wide-hipped woman reaches out, and flips a single switch on the wired-up ring of ");
	//upgradedSubTuner:
	if(subTunerUpgraded()) output("metal");
	else output("leather");
	output(" around your nape. You can already feel submissive thoughts flooding your mind. <i>Void, you need orders, to be put in your place!</i>");
	output("\n\nLuckily for you, Belle is an attentive master, and is already giving you what you want. <i>“Down, [pc.boyGirl],”</i> she says, her voice gentle but commanding.");
	output("\n\nYou heed her words and quickly bring yourself down to all fours, ready as ever for what’s to come. A moment later, the lady scientist kneels down and attaches her leash to your collar, then brings herself to stand up straight again.");
	output("\n\n<i>“Alright then, pet,”</i> your new master says, <i>“Where do we start with you today?”</i>");

	processTime(4);
	belleExperimentsMenu();
}

public function belleExperimentsMenu():void
{
	clearMenu();
	addButton(0,"Trifecta",kennelSubTuner,undefined,"Trifecta","Get spanked, walked, and thoroughly bred.");
	if(flags["SUBTUNER_TENTACLES"] == undefined) addButton(1,"MorePets?",morePetsSlashTentacles,undefined,"More Pets?","Belle seems like an adamant master, surely she has more pets you could play with!");
	else addButton(1,"Tentacles!",morePetsSlashTentacles,undefined,"Tentacles!","Have some more fun with Belle’s <i>“pet”</i> tentacle monster.");
	//[Exhibition] Get stuffed with toys and sent out on an experiment.
	addButton(2,"Exhibition",exhibitionismCollarWithBelle)
	addButton(3,"Hypnotism",subTunerHypnoShit,undefined,"Hypnotism","Have some fun with Belle’s personal project.");
}

//[MorePets?/Tentacles!]
public function morePetsSlashTentacles():void
{
	clearOutput();
	author("HugsAlright");
	showName("\nTENTACLES!");
	showBust("ROSWELL",saecBustString());

	//firstTime:
	if(flags["SUBTUNER_TENTACLES"] == undefined)
	{
		output("<i>“You know...”</i> Belle ponders for a moment, rapping a finger on her chin, <i>“There’s been something I’ve been meaning to try out with the Sub-Tuner involving psionic suggestion and if it will affect subjects the same way it does with verbal suggestion.”</i> The lady scientist looks back at you again, <i>“Well, [pc.boyGirl], I guess now is a good time as any to test out my hypothesis, follow me.”</i>");
		output("\n\nWith that she’s walking off to a room not far from her and leading you along with her. <i>It’s always a good time to help your master with her experiments.</i> ");
		output("\n\nIt’s a short walk, and once you’re both at the door, Belle unlocks it, opening the entryway with a hiss... and you’re shocked by what you see: a giant, writhing mass of green tentacles. <i>If it wasn’t for your master being here, you’d be very tentative about going into this room, but you follow her in bravely.</i>");
		output("\n\nAlmost as soon as you’re through the door, a voice starts to fill your thoughts, but you’re not thinking of it. The sounds are in your head but coming from some outside source, and it feels very, <i>very</i> odd.");
		output("\n\n<i>“Belle!”</i> it cries out, sounding jubilant and almost playful, <i>“Are we gonna play today Belle? I could use a snack! Oh, and you brought a new friend! What’s [pc.hisHer] name?!”</i>");
		output("\n\nWait, is that voice coming from the tentacles?! You gaze up at your master looking for answers, only to see her chuckle and extend an arm towards you. <i>“This is [pc.name],”</i> she says with her usual poised tone, but sounding very gentle towards that mass of tendrils, <i>“And you’re going to be having a lot of fun with [pc.hisHer] today.”</i>");
		output("\n\nA joyous cry of <i>“Yaaaaaay!”</i> fills your mind as the mass of squirming appendages wiggles happily.");

		output("\n\nBelle turns to look at your clearly confused face, clasping her hands before getting ready to speak, <i>“This is Roswell, [pc.name], and he’s... well, he’s my son.”</i> Your eyes go wide at that, and you cock your head to the side, expecting some answers to your confusion, <i>not that masters have to answer to their pets.</i> The lady scientist smiles and sighs, <i>“You see, [pc.boyGirl], when I first started this project, the Sub-Tuner, I needed some sort of spark, inspiration for this technology.”</i> She pauses, and looks towards the mass of tentacles sitting in the room, <i>“Roswell’s species is naturally psionic, able to manipulate matter and transmit thoughts with their minds, so I thought them an excellent starting point for my research. After I procured Roswell’s egg through... less legal means, I failed to take the proper precautions with him and ended up ‘impregnated’ for his incubation period after he hatched.”</i>");

		output("\n\nThe Terran takes a few steps closer to Roswell, reaching out and running a hand along one of his tendrils, <i>“And well, we formed quite the bond since then, and I can safely say I love him with all my heart.”</i>");

		output("\n\nOnce again Roswell’s happy voice fills your head, <i>“Awww, I love you too Belle!”</i>");

		output("\n\nThe lady scientist rubs her cheek against the tentacle she’s holding for a moment before making her way back to you, <i>“And you, [pc.boyGirl] are going to be giving him a meal today.”</i>");
		output("\n\n<i>You know your master wouldn’t do anything to hurt you</i>, but that whole phrase makes you a bit nervous.");
		output("\n\n<i>“Don’t you worry, [pc.boyGirl],”</i> comforts the woman, reaching a hand down to ");
		//pcAusar/Kaithrit/Half:
		if(pc.race().indexOf("ausar") != -1 || pc.race().indexOf("kaithrit") != -1) output("scratch at your [pc.ears]");
		else output("pat your head");
		output(", <i>“Roswell’s species is quite keen on getting sustenance from the sexual fluids from other sapient species.”</i> She grins wide at you, <i>“Meaning that you’re going to have a </i>very<i> fun time.”</i>");

		output("\n\n<i>“Yeah!”</i> exclaims Roswell’s lively voice inside your head, <i>“I’ll make you feel real good! Promise!”</i>");

		output("\n\n<i>Well, that doesn’t sound too bad at all,</i> so you look up at Belle, giving her a big smile and a nod.");

		output("\n\n<i>“I’m glad you’re up for it, [pc.boyGirl],”</i> then she drops your leash, and walks towards the door again, <i>“Now I have to go get something quick, you just wait here for a few seconds and keep Roswell company.”</i>");
		output("\n\nThen like that, she’s gone, leaving you alone with Roswell who seems to think it better that he quiet himself until Belle gets back. Luckily you don’t have to endure that pain that is a masterless existence for long, because she’s back... and with ");
		if(flags["MET_SAEC"] != undefined) output("Saec");
		else output("a pretty blonde ausar girl");
		output(" on a leash.");

		//metSaec:
		if(flags["MET_SAEC"] != undefined)
		{
			output("\n\n<i>“Well,”</i> the Terran begins, pulling her puppy into the room with you, <i>“I told Saec that you and Roswell were going to have some fun with each other, and she wanted to join in... if I didn’t know better I’d say she’s jealous of Roswell.”</i> The lady scientist smiles down at her pet, making her fluffy, golden tail wag eagerly.");
		}
		//Else:
		else
		{
			output("\n\n<i>“This is Saec,”</i> the Terran explains, pulling her puppy into the room with you, <i>“I told her that Roswell and a new pet of mine were going to have some fun, and she wanted to join in... poor girl’s been needing a new playmate for a while, and if I didn’t know better I’d say she’s jealous of Roswell.”</i> The lady scientist smiles down at her pet, making her fluffy, golden tail wag eagerly.");
			flags["MET_SAEC"] = 1;
		}
	}
	//Else:
	else
	{
		output("\n\n<i>“What about Roswell?”</i> Belle ponders for a moment, rapping a finger on her chin, <i>“I’d like to further investigate the effect of psionic vocalization on the Sub-Tuner’s suggestion protocols... and I’m sure he’s feeling hungry this time of day.”</i> The lady scientist looks back at you again, <i>“Well, [pc.boyGirl], I guess now is a good time as any to test out my hypothesis, follow me.”</i>");
		output("\n\nWith that she’s walking off to a room not far from her and leading you along with her. <i>It’s always a good time to help your master with her experiments.</i>");
		output("\n\nIt’s a short walk, and once you’re both at the door, Belle unlocks it, opening the entryway with a hiss... and there it is again: the giant green mass of tentacles that is Roswell. You’re much less pensive about following your master into the room now that you know what all those writhing tendrils actually are, and you happily follow your master into the room.");
		output("\n\n<i>“Belle! [pc.name]!”</i> Roswell’s happy voice calls out inside your head... somehow, <i>“Is [pc.name] gonna feed me today?”</i>");
		output("\n\nBelle chuckles and gives the psychic tentacle monster a nod.");
		output("\n\nA joyous cry of <i>“Yaaaaaay!”</i> fills your head as the mass of squirming appendages wiggles happily.");
		output("\n\nThat jubilant shout makes your master laugh before she turns to you again, <i>“Now I have to go get something quick, you just wait here for a few seconds and keep Roswell company.”</i>");
		output("\n\nThen like that, she’s gone, leaving you alone with Roswell who seems to think it better that he quiet himself until Belle gets back. Luckily you don’t have to endure that pain that is a masterless existence for long, because she’s back... and with Saec on her leash.");
		output("\n\n<i>“Well,”</i> the Terran begins, pulling her puppy into the room with you, <i>“I told Saec that you and Roswell were going to have some fun with each other, and she wanted to join in... if I didn’t know better I’d say she’s jealous of Roswell.”</i> The lady scientist smiles down at her pet, making her fluffy, golden tail wag eagerly.");
	}
	output("\n\nWith that, the woman reaches down and undoes <i>both</i> of your leashes, wrapping the tethers up and straightening herself again. <i>“And now,”</i> she begins walking towards the door, <i>“I believe I’m going to give the three of you some privacy... don’t have too much fun without me.”</i> With a final wink, the lady scientist walks through the door and closes it behind her leaving you, Saec, and Roswell alone.");
	output("\n\nThere’s an awkward silence for a moment after Belle leaves, with you and your fellow pet looking at each other until the green elephant in the room speaks up.");
	output("\n\n<i>“Oh! I guess I should get us started,”</i> Roswell exclaims, with a multitude of prehensile limbs stretching out towards you and Saec, <i>“Here.”</i>");
	output("\n\nLike that his tentacles are wrapping around you and your playmate, getting a good grip on your arms and legs before hoisting you into the air and ");
	if(!pc.isCrotchExposed() && !pc.isAssExposed() && !pc.isChestExposed()) output("stripping you of your [pc.gear]");
	else output("pulling you closer");
	output(". You can’t help but giggle at the sudden feeling of weightlessness, only to gasp when those same tendrils spread your [pc.legs] wide apart, and do the same to Saec.");

	output("\n\nRoswell doesn’t let up, as soon you feel something, warm, slippery, and phallic slip between your lower cheeks and press against your clenching pucker. You squirm in your place as your [pc.asshole] is slathered with what must be some kind of natural lube, trying to look over your shoulder.");

	output("\n\nIt seems Belle’s pet monster picks up on your distress, and talks to you in a rather soothing voice through your thoughts, <i>“Don’t worry, this’ll feel good, promise.”</i>");

	output("\n\nWith that, the pressure building on your asshole builds greater, causing you to whimper until you’re finally penetrated by one of Roswell’s appendages, leaving you to pant and groan. The psychic alien doesn’t stop and continues to shove more and more tentacle into you, all the lubricant helping to ease its way in as your pucker is stretched wide. Then the tendril starts to thrust slowly, rubbing along your inner walls and setting you moaning");
	if(pc.hasCock()) output(", [pc.cocks] stiffening as your prostate is gently milked");
	output(".");
	pc.buttChange(40);

	//hasVag:
	if(pc.hasVagina())
	{
		output("\n\nJust as Roswell’s first tentacle is done with its trip into your bowels, a second one busies itself on [pc.oneVagina]. It presses itself against your sopping labia, gingerly spreading your lower lips and working its way in with practiced slowness, allowing you to enjoy every movement of alien cockflesh against all your sensitive bits. You look down to see the tendril bulging an outline on your tummy as Roswell works his way into you, filling you until all your feminine fluids have nowhere to go but leak out onto the xeno’s limbs. In fact, Belle’s <i>“son”</i> seems to be quite the gentle lover, keeping his pace slow and steady, edging onward to orgasm.");
		pc.cuntChange(0,40);
	}
	//hasCock:
	if(pc.hasCock())
	{
		output("\n\nBefore you can start to get yourself comfortable, another, less phallic tentacle makes its way up to your crotch. Looking at it, the appendage looks like a slippery, fleshy fleshlight, leaking natural lubricants all over the floor. The squirming limb presses its vagina-like opening against your [pc.cockHeadBiggest] and starts to stretch around it. You quiver and whimper as the specialized tentacle works its way onto your shaft, hugging at your girth until you’re leaking pre into it. The tendril’s trip onto your [pc.cockBiggest] is almost <i>painfully</i> slow, but it all pays off when your tool is well sheathed in blissful warmth and wetness, and when the inner walls of Roswell’s cock-eater start to shift, milking your cock.");
	}
	//isLactating:
	if(pc.isLactating())
	{
		output("\n\nThe fun doesn’t stop there, as a pair of tentacles make their way up to your [pc.breasts]. They seem to be topped with some sort of suction-cups, so no doubt you’re in for a bit of milky fun. Sure enough, the appendages press themselves against your ");
		if(pc.bRows() > 1) output("topmost ");
		output("pair of nipples before they impose a gentle suckling sensation, coaxing [pc.milk] from your bountiful buds. You moan quietly at the sensation, almost losing focus before another pair of prehensile green limbs wrap around your [pc.breast] and start to tenderly squeeze, drawing more and more of your fluids out and into Roswell’s specialized suckers.");
	}
	output("\n\nSaec’s getting the same treatment as you at the moment, moaning loudly as she’s doubly-penetrated by a pair of phallic tentacles pumping in and out of wet ausar pussy and pucker while a quartet of tendrils milks her big E-cups silly.");
	output("\n\nLooking at the puppy-girl’s tongue loll, Roswell’s voice fills your head again. <i>“She feels really nice,”</i> he says, almost feeling like he’s right next to your ears, <i>“and I know you feel really nice too.”</i>");
	output("\n\nAnother pump of his tentacles accentuates those last words, making you gasp and clench your body in an attempt to quell the pleasure. It’s no use though, <i>Roswell’s right... it just feels so good</i>.");

	output("\n\n<i>“C’mon, [pc.name],”</i> the happy psychic beast pleads, <i>“don’t you and Saec wanna cum and give me a snack?”</i>");

	output("\n\n<i>Yes, you </i>do<i> want to cum</i>, and it seems like that single thought is enough to bring you over your edge. Your mind fizzles blank with orgasmic pleasure, your ");
	if(pc.hasVagina()) output("[pc.vagina] and ");
	output("asshole clamp");
	if(!pc.hasVagina()) output("s");
	output(" down around the tentacle");
	if(pc.hasVagina()) output("s filling it");
	else output(" filling them");
	//hasCock:
	if(pc.hasCock()) output(", and your [pc.cockBiggest] spasms inside Roswell’s grasp, giving him a big load of [pc.cum] to snack on");
	output(".");
	//isLactating:
	if(pc.isLactating()) output(" With rigorous squeezing, your alien lover almost milks you dry into his specialized, milk-sucking limbs.");
	output(" You shiver with bliss and buck your hips against all of Roswell’s writhing appendages, riding out the remaining moments of your orgasm until it all comes to a stop and your senses return.");
	output("\n\nLooking towards Saec, it seems like she’s coming down from her climax as well, panting as she’s suspended in the air, leaking milk and girlcum onto the ground. A good time was obviously had by all.");
	output("\n\n<i>“Mmm, delicious!”</i> Roswell coos, gently placing you and an exhausted Saec down on the floor, <i>“Well, uh... thanks for that! I think Belle should be back soon!”</i>");
	output("\n\nWell, you feel too tired at this point to go get the lady scientist herself, so you resign yourself to just lie down on the floor, [pc.chest] heaving. Your blonde ausar playmate decides to cuddle up next to you, shuffling her way over to you and resting her head on your shoulder with a contented sigh. You smile and wrap an arm around the golden-hued puppy nuzzling her head against you. A loud yawn forces its way out of your lungs, signaling your need for a good rest after all that sexual milking. So, you let your heavy eyelids shut, and drift off to sleep alongside Saec.");

	processTime(34);
	if(pc.isLactating()) pc.milked();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",tentacleStuffSubTwo);
}

public function tentacleStuffSubTwo():void
{
	clearOutput();
	author("HugsAlright");
	showBust("BELLE","ROSWELL",saecBustString());
	output("The sound of Belle’s voice wakes you from your post-coital slumber, still with Saec in your arms, <i>“Well, it looks like you all had a good time.”</i> You open your eyes to see the lady scientist standing in the doorframe for a moment before walking towards you.");
	output("\n\n<i>“Oh!”</i> Roswell exclaims through your thoughts as his “mother” approaches, wriggling joyously, <i>“Yeah we had lots of fun together! I think they’re still pretty tired though...”</i>");
	output("\n\nYour master chuckles as she nears you, <i>“I think they’ll be just fine, Roswell, c’mon " + pc.mf("boy, girl","girls") + ", up.”</i>");
	output("\n\n<i>You still feel tired, but Belle’s command sends a burst of adrenaline through your veins,</i> and you’re back on your knees alongside your ausar companion, looking up at your mutual master with smiling faces");
	if(pc.race().indexOf("ausar") != -1 && pc.tailCount > 0) output(" and wagging tails");
	output(".");
	output("\n\nBelle beams down at the two of you and attaches a leash to Saec’s collar before reaching over and flipping a single switch on your own Sub-Tuner, turning it off. ");
	output("\n\nThough, your pet-like feelings don’t so much as fade this time, quite enjoying the feeling of being this lovely lady’s pet, still smiling at her with your heart fluttering. After a few more moments of silence though, your master speaks up: <i>“Well, I suppose you should be on your way then, my pet. I’ll have to go get Saec cleaned up, for the time being.”</i>");

	output("\n\nYeah, that sounds like a good idea right about now.");
	processTime(60);
	IncrementFlag("SUBTUNER_TENTACLES");
	IncrementFlag("SEXED_SAEC");
	clearMenu();
	addButton(0,"Next",leaveAccuPitchLabs);
	//[Next] //Returns the PC outside Belle’s lab.
}

//Exhibition
//[Exhibition]
public function exhibitionismCollarWithBelle():void
{
	clearOutput();
	author("HugsAlright");
	showBelle();
	output("<i>“Hmm,”</i> Belle deliberates for a moment, <i>“");
	if(flags["SUBTUNER_EXHIBITIONISM"] == undefined) output("I was going to go through a few more beta versions before testing these, but now that you’re here, it seem like the perfect time to try them out.");
	else output("I think you’re going to run a few more tests with my special toys today. How does that sound, " + pc.mf("boy","girl") + "?");
	output("”</i>");

	//firstTime:
	if(flags["SUBTUNER_EXHIBITIONISM"] == undefined) output("\n\n<i>You’re always ready to help your master</i>, but you cock your head at Belle as she moves over to one of her lab benches and grabs a large black box off it, rattling like it’s filled with plastic and rubber.");
	else output("\n\n<i>What kind of pet wouldn’t want to help their master?</i> You nod your head eagerly at Belle’s proposition, and she smiles back at your optimism before moving to a nearby lab bench and grabbing that box of hers, filled with toys for all your holes.");

	//notNude:
	if(!pc.isChestExposed() && !pc.isAssExposed() && !pc.isCrotchExposed()) output("\n\nWith a grin, Belle kneels down in front of you, scanning your still-clothed form for a moment before speaking up and reaching for your [pc.gear] to pull it off. <i>“You won’t be needing these today,”</i> she says, placing the last of your clothing aside, <i>“Don’t worry, I’ve the perfect outfit picked out for you today.”</i>");
	//Else:
	else output("\n\nWith a grin, Belle kneels down in front of you, scanning your already naked form for a moment before speaking up, <i>“Hmm, I think I have a nice outfit I want you to try out today... but first...”</i>");

	output("\n\nWith that said, Belle reaches into that box she grabbed and slowly reveals a rather large dildo or vibrator, a big smirk on her face. The phallic object is pretty human in its design, with its smooth shaft and mushroom tip, but you notice a wire trailing from from the dildo to a small metal box, no bigger than your thumb.");

	output("\n\n<i>“Bend over, " + pc.mf("boy","girl") + ",”</i> the lady scientist commands, brandishing her toy like a big, bitch-breaking weapon.");
	output("\n\nYou do as she says and bend yourself over with your [pc.butt] in the air, ");
	if(pc.tailCount > 0) output("[pc.tail] wagging with visible anticipation, ");
	output("<i>already able to feel an ache to be filled as your master nears you</i>.");

	output("\n\n<i>“First things first, " + pc.mf("boy","girl") + ",”</i> the woman says, opting to move to your front rather than your very exposed rear, placing the big dildo right before your [pc.lipsChaste], <i>“I think you deserve to lube this up a bit first, hmm?”</i>");

	output("\n\n<i>If your master thinks you deserve to, of course you do!</i> You dart forward, opening your mouth and taking the human-like cockhead of Belle’s toy into your mouth, lavishing it with your tongue. The domineering woman smiles at your eagerness and starts to push the dildo deeper down your throat, causing you to gag a bit, but you take it all happily between your lips. You circle the plastic and rubber with your [pc.tongue], coating it in your saliva.");

	output("\n\nOnce she’s sure you’ve gotten your new toy nice and wet, Belle withdraws the cold, unfeeling phallus from your lips with a soft squelch. You look back up at your master with a smile");
	if(pc.tailCount > 0) output(" and a wagging tail");
	output(".");

	output("\n\n<i>“Here, " + pc.mf("boy","girl") + ",”</i> Belle says, bringing the toy around behind you, <i>but you don’t turn around to face her, because you trust her to make you feel good</i>. A moment later and you feel the cold, spit-slick tip of that plastic cock press against your [pc.asshole], causing you to gasp and clench just about every muscle in your body. <i>“Just relax, [pc.boyGirl],”</i> your master whispers, applying just enough pressure on your sodden hole to make you whimper. With a little added force, the long bedroom-aid penetrates your pucker with little more than a yelp torn from your lips, Belle cooing a single <i>“Good [pc.boyGirl]”</i> before she continues to force more of her special toy into you. You moan quietly as your [pc.asshole] is spread wide by the lady scientist’s dildo, sliding into you rather easily thanks to your oral lubrication.");

	output("\n\nBelle doesn’t stop her penetration until the plastic phallus is buried in you to the hilt, leaving you panting and your master with another big smile on her face.");
	pc.buttChange(60);

	//hasVag:
	if(pc.hasVagina())
	{
		output("\n\nBarely recovered and still whimpering and groaning from the pleasurable ache of the big fake cock lodged in your ass, the lady scientist behind you reaches toward that container of toys, evidently getting ready to give you another to play with.");
		output("\n\n<i>Oh boy, more treats from your master!</i>");
		output("\n\n<i>“I hope you’re not feeling too full yet,”</i> Belle says playfully, pulling another dildo from her box, this one being more of an ausar shape with a tapered tip and big knot at the bottom, and attached to the same metal device as the one in your ass, <i>“Because I’ve got something more for you right here, " + pc.mf("boy","girl") + ".”</i>");

		output("\n\nWith that, you feel the pointed tip of the dildo press against your wet folds. Belle decides to tease you for a moment and slides the tapered cockhead across your [pc.clit], making you whimper, [pc.vaginas] sopping with a need to be filled. Your needy noises seem to please your master, as you soon feel her toy slip between your folds, drawing a gasp from your [pc.lipsChaste]. Your quiet gasps and whimpers turn to moans as Belle pushes more of her ausar-dildo into you until that thick, plastic knot meets your spread nether-lips. You yelp when Belle applies a little added force to her penetration, the human herm stretching your [pc.vagina] to its limits as she drives that unfeeling breeder’s knob into you with a single good thrust, leaving you to moan as you adjust to the girth.");
		pc.cuntChange(0,60);
	}
	output("\n\nIt doesn’t seem like your master is done with her box of toys yet, because you see her reaching into it before pulling out a pair of bullet vibrators, attached to the same metallic device as the dildo");
	if(pc.hasVagina()) output("s");
	output(" currently inside you.");

	output("\n\n<i>“Up, " + pc.mf("boy","girl") + ",”</i> Belle commands with an added flick of her wrist, holding up the vibrators for you to see.");
	output("\n\nYou’re quick to do as the woman says and bring yourself up to your knees, your master quickly circling around to your front with vibrators in hand. She gazes at your naked form for a moment, her eyes drawn to your ");
	if(pc.bRows() > 1) output("topmost ");
	output("pair of [pc.nipples]. Not allowing another moment to pass, Belle presses the tiny balls against your [pc.nipples], and suprisingly, they stay there when she pulls her hands back. You look down at the vibrators stuck to your chest and smile.");

	//firstTime:
	if(flags["SUBTUNER_EXHIBITIONISM"] == undefined)
	{
		output("\n\n<i>“Like those, [pc.boyGirl]?”</i> Belle asks giving you a grin, <i>“They’re made of special polymers, and they’ll stick to just about every skin and fur in the galaxy.”</i>");
		output("\n\n<i>Your master is so smart!</i>");
	}
	output("\n\nNow that you’re all filled and wired up with all your master’s special toys, you look up at her with growing anticipation in your gaze, loins aching for release as your desperate hole");
	if(pc.hasVagina()) output("s");
	output(" clench");
	if(!pc.hasVagina()) output("es");
	output(" around the vibrator");
	if(pc.hasVagina()) output("s");
	output(" inside you.");
	if(pc.hasCock()) output(" You can already feel your [pc.cocks] stiffening with white-hot arousal.");
	;

	output("\n\n<i>“Now just stay there,”</i> Belle says, standing up and turning away from you for a moment before she walks over to a small storage room. After a few seconds of fumbling around in the doorframe, the lady scientist turns back to you, a hanger in her hand. Hanging from said hanger is what looks to be a sleek black jumpsuit with blue and white highlights, bearing the Accu-Pitch logo on its shoulders. The whole thing seems more like a catsuit, actually.");

	output("\n\nYour master grins and walks back towards you, <i>“Should be just your size, [pc.boyGirl].”</i>");

	output("\n\nBelle kneels down before you once more, Accu-Pitch jumpsuit in hand, giving your naked frame one more once-over before holding ");
	//firstTime:
	if(flags["SUBTUNER_EXHIBITIONISM"] == undefined) output("your new");
	else output("the familiar");
	output(" clothing to your frame. Belle smiles all the while she dresses you in the smooth suit, wrapping you with latex until you’re good and decent. The jumpsuit hugs at all your ");
	if(!pc.hasChitin()) output("curves");
	else output("ridges");
	output(", ");
	if(pc.hasCock()) output("leaving quite the noticeable bulge around your [pc.cocks] and ");
	output("serving to highlight the outlines of all the toys your master gave you.");

	output("\n\n<i>“Up, " + pc.mf("boy","girl") + ",”</i> Belle commands once she’s got you dressed.");

	output("\n\nYou do as she says and quickly rise to your feet, keeping a rigid stance for your master while you await more orders.");

	output("\n\nRather than giving you another command right away, the lady scientist clasps her hands together and coos happily, <i>“Well don’t you just look adorable,”</i> and after giving herself another moment to take in your catsuit-clad body, she brings a finger and thumb up to stroke her chin. <i>“Now where did that...”</i> she asks herself, circling you and scanning your body for something until she’s behind you, <i>“Ah, there it is.”</i>");

	output("\n\nNot even a second after Belle says that, her hands grasp at your [pc.hips], working their way upward until they reach a small metal bump underneath your clothes. The human woman works her hands gently and diligently to move the small object upward, sliding its cold metallic surface across your [pc.skinFurScales] until she pushes it up and out the collar of your jumpsuit.");

	output("\n\n<i>“Here we go,”</i> Belle says, stepping in front of you again, except now she’s holding that little metal box connected to all your vibrators in her hand... and pressing the single button on it.");

	output("\n\nImmediately after that single circuit is completed, the dildo");
	if(pc.hasVagina()) output("s");
	output(" in your [pc.asshole]");
	if(pc.hasVagina()) output(" and [pc.vagina]");
	output(", as well as the bullet vibes on your nipples start vibrating. They’re very weak, though, almost like they’re lacking power, just barely rattling, teasing you, quickly making you hungry for more.");

	output("\n\nYou turn to your master and whine pitifully, informing her of your distress and hoping she can do something to fix your toys.");

	//firstTime:
	if(flags["SUBTUNER_EXHIBITIONISM"] == undefined)
	{
		output("\n\n<i>“Don’t worry, " + pc.mf("boy","girl") + ",”</i> Belle utters with a gentle tone, bringing a hand to your head and ");
		//pcAusar/Kaithrit/Half: 
		if(pc.race().indexOf("ausar") != -1 || pc.race().indexOf("kaithrit") != -1) output("scratching at your [pc.ears]");
		else output("patting it");
		output(", <i>“They’re working just fine, but if you want them to work better you’ll have to... pleasure someone else. These vibrators are more of a pet project than anything else, the better your partner feels the better they’ll make you feel, but they’ll do well to help me test out the Sub-Tuner.”</i>");
		output("\n\nShe takes up your leash once more and leads you to the entrance of her lab, trailing you behind her while you attempt to suppress tiny whimpers and moans.");
		output("\n\nBelle stops on a dime right in front of the main door’s control panel, turning on a heel to face you again, <i>“Here’s what my theory is, [pc.boyGirl]: with the Sub-Tuner and those toys on and in you, I don’t think you’re going to cum unless you get someone else off... and if you can, well, then it looks like the collar’s subroutines will need some recalibrating.”</i>");
		output("\n\n<i>Make someone cum? Well... that’s easy enough.</i>");
		output("\n\nYou look down at your master’s bulge and gulp, expecting a command to fetch... or sit.");
		output("\n\nBelle notices your gaze and smirks, <i>“No, not me, [pc.boyGirl]. I want you to go </i>outside<i> the lab and look for someone to have fun with... without me.”</i>");
		output("\n\n<i>What?! You? Out there? Alone? Without your master? She knows best, but you think Belle might be joking.</i>");
		output("\n\nSure enough, though, Belle reaches up and unhooks her leash from your collar, leaving you free to move without her guidance. The lady scientist then opens the door and invites you out with a warm smile and a little pat on the head. <i>“Well, off you go, [pc.boyGirl],”</i> she says, taking a few steps over towards one of her terminals, <i>“And don’t worry, I’ll be keeping an eye on you from here, and I’ll be out there to get you at the first sign of trouble.”</i>");
	}
	//Else:
	else
	{
		output("\n\n<i>“Alright, [pc.boyGirl],”</i> Belle utters with a gentle tone, bringing a hand to your head and ");
		//pcAusar/Kaithrit/Half: 
		if(pc.race().indexOf("ausar") != -1 || pc.race().indexOf("kaithrit") != -1) output("scratching at your [pc.ears]");
		else output("patting it");
		output(" before taking up your leash again, <i>“I think it’s time you’ve gotten outside the lab for some more fun, hmm?”</i>");

		output("\n\nWith a firm grip on your tether, the human woman leads you to the entrance of her lab, trailing you behind her while you attempt to suppress tiny whimpers and moans.");

		output("\n\nBelle stops on a dime right in front of the main door’s control panel, turning on a heel to face you again. She’s quick to open the door and invite you out with a warm smile and a little pat on the head.");

		output("\n\n<i>“Well, off you go, [pc.boyGirl],”</i> she says, taking a few steps over towards one of her terminals, <i>“And don’t worry, I’ll be keeping an eye on you from here, and I’ll be out there to get you at the first sign of trouble.”</i>");

		output("\n\n<i>Well, it’ll be pretty sad to be out there without your master again, but you’ll do it for her. She knows best after all.</i>");
	}

	output("\n\nRubbing your hands together nervously, you gulp and face the doorway. You’re a bit scared, but your master’s orders and the burning lust induced by your slowly shaking vibrators fill you with determination to make that first step out. So, you place one [pc.leg] in front of the other and take a step out of the lab, and then another, and another, continuing your nervous march out until you’re well into the wide open wabeship of Uveto station... horny and masterless.");
	processTime(22);
	pc.lust(10);
	//[Next] //This button triggers one of the following variants based on the requirements for each. 
	clearMenu();
	addButton(0,"Next",subTunerExhibRouter);
}

public function subTunerExhibRouter():void
{
	var options:Array = [subTunerRivalBullshit];
	if(annoIsCrew()) options.push(subTunerAnnoExhib);
	if(syriIsCrew() || (/*syriRecruited() &&*/ syriAtFreeezer())) options.push(syriExhibStuff);
	if(roamingKiroAvailable()) options.push(subTunerKiroExhib);
	moveTo("UVS B9");
	options[rand(options.length)]();
}
public function subTunerExhibEnd():void
{
	clearOutput();
	author("HugsAlright");
	showBelle();
	output("Belle takes good care of you, stripping you of your soiled suit and removing all her toys from your nipples and sodden, well-used hole");
	if(pc.hasVagina()) output("s");
	output(" before she gives you a nice warm bath to clean all those sexual fluids off you. She’s even kind enough to give you a little reward ");
	if(pc.hasCock()) output("handjob");
	else output("fingering");
	output(" while you’re getting clean because you did such a good job, your master reminding you of what a good pet you are all the while.");
	output("\n\nOnce you’re good and clean, Belle ");
	if(!pc.isNude()) output("gives you back all your clothes and ");
	output("takes you back out to her lab. Then she extends a single finger, and turns your collar off.");
	output("\n\nThough, your pet-like feelings don’t so much as fade this time, quite enjoying the feeling of being Belle’s pet, still smiling at her with your heart fluttering. After a few more moments of silence though, your master speaks up: <i>“Well, I suppose you should be on your way then, my pet.”</i>");
	output("\n\nYeah, that sounds like a good idea right about now.");

	processTime(15);
	pc.shower();
	IncrementFlag("SUBTUNER_EXHIBITIONISM");
	pc.exhibitionism(2);
	
	// [Next] Returns the PC outside Belle’s lab.
	clearMenu();
	addButton(0,"Next",leaveAccuPitchLabs);
}

//Rival
//This can happen for any PC atm.
public function subTunerRivalBullshit():void
{
	clearOutput();
	author("HugsAlright");
	showRival(true);
	
	output("You wander around the great wabeship that is Uveto station for some time, absent-mindedly whining and moaning under the pleasurable weight of the vibrators inside you. Unfortunately, finding someone to pleasure is proving troublesome: the toves you meet are not at all interested in your sexual escapades, and most of the alien strangers that you kneel before simply smile, pat your head and call you a good puppy... <i>and you really wish your master was here</i>.");
	output("\n\nAfter a few more moments of scouting for sex, a rather familiar, if a bit grating, voice fills your ears.");
	output("\n\n<i>“No way,”</i> the voice says, drawing closer to you, <i>“This is </i>too good<i>.”</i>");
	output("\n\nYou turn towards towards the familiar sound only to see your cousin, <i>[rival.name]</i>. <i>Though, where a normal feeling of ");
	if(pc.isNice()) output("displeasure");
	else output("anger or rage");
	output(" would fill your mind, you can only find yourself filled with an overwhelming need to pleasure [rival.himHer], like Belle told you to.</i>");

	//maleRival:
	if(rival.hasCock())
	{
		output("\n\nJack makes his way towards you, his stride filled with confidence as he takes in your clearly distressed and submissive demeanor, <i>“No wonder I haven’t seen you around, too busy being a slut out on this backwater, hmm?”</i>");
		output("\n\nAt this point you notice your cousin has taken out his own Codex and has already begun recording this little interaction.");
		output("\n\n<i>“[pc.name] Steele,”</i> he chides, looking down at you, <i>“Was being a whore on your own ship not good enough? Gotta come out here and bother everyone with your terrible mug?”</i>");
		output("\n\nYou know his words are meant to provoke you, <i>but all you can feel is an overwhelming lust to please him... and to get yourself off in the process.</i> A million thoughts cross your mind, trying to tell you that you’re seriously considering having sex with <i>your own cousin</i>, but you can’t really pay attention to any of them with that bulge in Jack’s pants right in front of you.");
		output("\n\nSo, you do the only thing you can do: you whine audibly and reach a hand out to paw at your cousin’s crotch like a needy puppy, begging to get into those pants.");
		output("\n\nJack’s insults and teasing suddenly stop as his voice catches, your touch bringing a fair bit of blush to his face. <i>“W-what, you want a bone you filthy mutt?”</i> He asks, slapping your hand away.");
		output("\n\nYou look up at him and nod, well beyond the point of stopping yourself and much too turned on by all your buzzing vibrators to reconsider your actions. Jack actually seems pretty aroused by your answer, smirking down at you with a bit more red to his cheeks than before. Without saying another word, he reaches down and undoes his pants, immediately allowing his stiffening cock and plump balls to dangle free of their confines.");
		output("\n\nYour eyes go wide at the foot-long, extra-girthy human cock you’re presented with, your tongue lolling from your mouth while you try to keep yourself from drooling, lost in your fantasies. You’re pulled from your thoughts by Jack’s hand grabbing at your head, causing you to look up at him in response, only to see him looming over you.");
		output("\n\n<i>“Well, come on, slut,”</i> he scolds");
		if(pc.hasHair()) output(", pulling hard on your [pc.hair]");
		output(", <i>“Fetch.”</i>");

		output("\n\nThat was the only command you could ever need, <i>and you’re going to obey it like a good puppy</i>. You let your [pc.tongue] loll from your mouth and lick at your cousin’s cockhead, making its owner shiver before you firmly wrap your lips around it. You lavish Jack’s tip with your tongue, suckling on it like candy until he feels compelled to speak. The feeling of his tool hardening between your lips is enough to ");
		if(pc.race().indexOf("ausar") != -1 && pc.tailCount > 0) output("set your [pc.tail] wagging");
		else output("heart fluttering");
		output(".");

		output("\n\n<i>“Like your cousin’s cock, y-you whore?”</i> he stutters, <i>“C’mon, you wanted a bone, so get on it!”</i>");

		output("\n\nJack accentuates those words with a firm flick of his wrist, pushing you onto his thick cock hard enough to make you gag, and your cousin moan a bit. At that cry of pleasure, you feel the vibrators stuck in your hole");
		if(pc.hasVagina()) output("s");
		output(" and attached to your [pc.nipples] flare up, trembling violently against your sensitive flesh and inner walls. With the realization that Belle’s toys are working exactly as intended, you moan onto Jack’s cock and attempt to pull back off. His hand keeps you well in your place, right on his turgid, musky shaft. <i>It occurs to you that you are indeed sucking your cousin’s dick in public, but again, you can’t seem to care</i>.");
		output("\n\n<i>“Lick it! You mutt!”</i> your cousin commands, running his hand ");
		if(pc.hasHair()) output("through your hair");
		else output("over your head");
		output("... almost passionately.");

		output("\n\n<i>What can you do but follow your orders?</i> So, you put your tongue to work and start to lick along Jack’s length, drawing a few lewd groans from between his lips and sending your vibrators into ");
		if(silly) output("maximum ");
		output("overdrive. Your cousin responds with a single jerky thrust of his hips into your mouth, brushing his cockhead against the back of your throat and putting stars in your vision for a short moment.");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG) && pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(" You do your best to pleasure Jack, using your long licker like a cocksleeve, wrapping your [pc.tongue] around his tool and moving its coils to jerk him off between your lips.");
		else output(" You do your best to pleasure Jack, trailing your [pc.tongue] along Jack’s sensitive undercarriage while you moan around his tool, occasionally licking at his tip and suckling up all the salty pre he’ll give you.");

		output("\n\nYour dildo");
		if(pc.hasVagina()) output("s");
		output(" and bullet vibrators speed up their pleasurable shaking as your tongue-filled blowjob continues, making you whine and whimper with their subtle, steady motions against your more sensitive bits. Each stroke of your [pc.tongue] across his shaft driving Jack, and you, closer to orgasm, all while he films the whole altercation. A small crowd of more-libidinous aliens has even gathered at this point.");

		output("\n\nYou’re so utterly focused on pleasing your own cousin, you hardly notice your combined-climaxes welling until a forceful push of Jack’s wrist and a low grunt signal his peak. You can feel his cock swell in your mouth and the first spurt of hot Terran cum wet your tongue, and at that, you feel anything holding back your own orgasm fade away, a long, relieved moan forcing its way out of your lungs. You shiver and moan as your collar and vibrators finally allow you to cum, ");
		if(pc.hasCock()) 
		{
			output("[pc.cocks] emptying ");
			if(pc.cockTotal() == 1) output("its");
			else output("their");
			output(" load all inside your new suit ");
			if(pc.hasVagina()) output("and ");
		}
		if(pc.hasVagina()) output("[pc.vaginas] spasming alongside your [pc.asshole] around their equally girthy and knotty fake-cocks");
		else output("while your [pc.asshole] spasms around the big, human dildo lodged inside you");
		output(". At the same time, your cousin’s cock convulses between your [pc.lips], shooting his salty load right down your throat, and it’s all enough to swell your tummy with his seed.");

		output("\n\nFinally coming down from your peak, you look up at Jack, who’s only just coming down from his. His chest heaves ");
		if(pc.hasHair()) output("and his fingers run through your [pc.hair] appreciatively ");
		output("for a moment before he smirks and pulls his hand back, and then his hips, and then his prick, the long, softening slab of cockmeat dropping from your mouth and dangling freely as it drips cum and saliva alike onto the floor.");
		

		output("\n\n<i>“Not bad, slut,”</i> he chides, putting away his Codex with quite a bit of blush still on his face, <i>“Now get out of here, you dumb mutt, or I’ll come fuck your face again!”</i>");

		output("\n\nWith that, your cousin zips up his pants, and walks away with the crowd that had gathered, his legs still a bit wobbly from your oral pleasures. You figure you should do the same and get back to Belle, now that your command and loins have been thoroughly fulfilled. <i>Though, you did just fuck your own cousin.</i>");
		processTime(30);
		pc.loadInMouth(rival);
	}
	//Else:
	else
	{
		output("\n\nJill makes her way towards you, her stride filled with confidence as she takes in your clearly distressed and submissive demeanor, <i>“No wonder I haven’t seen you around, too busy being a slut out on this backwater, hmm?”</i>");
		output("\n\nAt this point you notice your cousin has taken out her own Codex and has already begun recording this little interaction.");
		output("\n\n<i>“[pc.name] Steele,”</i> she chides, looking down at you, <i>“Was being a whore on your own ship not good enough? Gotta come out here and bother everyone with your terrible mug?”</i>");
		output("\n\nYou know her words are meant to provoke you, <i>but all you can feel is an overwhelming lust to please her... and to get yourself off in the process.</i> A million thoughts cross your mind, trying to tell you that you’re seriously considering having sex with <i>your own cousin</i>, but you can’t really pay attention to any of them with Jill’s crotch right in front of your face.");
		output("\n\nSo, you do the only thing you can do: you whine audibly and reach a hand out to paw at your cousin’s groin like a needy puppy, begging to get into those pants.");
		output("\n\nJill’s insults and teasing suddenly stop as her voice catches, your touch bringing a fair bit of blush to her face. <i>“W-what, you want a treat you filthy mutt?”</i> she asks, slapping your hand away.");
		output("\n\nYou look up at her and nod, well beyond the point of stopping yourself and much too turned on by all your buzzing vibrators to reconsider your actions. Jill actually seems pretty aroused by your answer, smirking down at you with a bit more red to her cheeks than before. Without saying another word, she reaches down and undoes her pants, pulling them down just enough to expose her glistening pink pussy to you. The sight alone is enough to make your tongue loll with lust, picturing your head between her legs like the <i>incestuous little pet you are</i>. You’re pulled from your thoughts when one of Jill’s hands grabs at your head, causing you to look up at her, only to see your cousin looming over you.");
		output("\n\n<i>“Well, come on, slut,”</i> she scolds, pulling hard on your [pc.hair], <i>“Eat up.”</i>");
		output("\n\nThat was the only command you could ever need, <i>and you’re going to obey it like a good puppy</i>. You bring your lips to meet Jill’s labia, already moist with arousal, and leave her folds with a kiss before moving upward, letting your [pc.tongue] slide from your mouth. You deliver loving little licks to Jill’s hood before wrapping your [pc.lipsChaste] around her pleasure buzzer, gently suckling and kissing at it until your cousin loses a bit of her composure and starts whimpering. The smell of her bitter-sweet juices is enough to ");
		if(pc.race().indexOf("ausar") != -1 && pc.tailCount > 0) output("set your [pc.tail] wagging");
		else output("set your heart fluttering");
		output(".");

		output("\n\n<i>“Like your cousin’s pussy, y-you whore?”</i> she stutters, <i>“C’mon, you wanted a treat, so get to it!”</i>");

		output("\n\nJill accentuates those words with a firm flick of her wrist, pushing you into her wet, wet muff, and causing your cousin to moan a bit as your lips drag across her clit. At that cry of pleasure, you feel the vibrators stuck in your hole");
		if(pc.hasVagina()) output("s");
		output(" and attached to your [pc.nipples] flare up, trembling violently against your sensitive flesh and inner walls. With the realization that Belle’s toys are working exactly as intended, you moan into Jill’s folds and attempt to pull back, but her hand keeps you well in your place, right between her plush, shapely thighs. <i>It occurs to you that you are indeed eating your cousin out in public, but again, you can’t seem to care</i>.");
		output("\n\n<i>“Lick it! You mutt!”</i> your cousin commands, running her hand " + (pc.hasHair() ? "through your hair" : "across your head") + "... almost passionately, gently.");

		output("\n\n<i>What can you do but follow your orders?</i> So, you put your tongue to work and start to lick along the length of Jill’s slit, gathering up her feminine fluids before you delve in, letting your [pc.tongue] spread her velvety nether-lips. Jill whimpers and moans as you work your tongue deep inside her, rubbing against the sensitive flesh of her inner walls while your upper lip rubs against her clit absentmindedly. You eagerly lap up your cousin’s fem-lube as it pours from her cunt like a fountain, dribbling down your chin and onto the floor, mixing with your saliva like an incestuous cocktail.");

		output("\n\nYour dildo");
		if(pc.hasVagina()) output("s");
		output(" and bullet vibrators speed up their pleasurable shaking as your tongue-filled cunnilingus session continues, making you whine and whimper with their subtle, steady motions against your more sensitive bits. Each movement of your [pc.tongue] between her folds drives Jill, and you, closer to orgasm, all while she films the whole altercation. A small crowd of more-libidinous aliens has even gathered at this point.");

		output("\n\nYou’re so utterly focused on pleasing your own cousin that you hardly notice your combined-climaxes welling until a forceful push of Jill’s wrist and a low moan signal her peak. You can feel her lower-lips tighten around your tongue as her legs quiver and hug at your head, and at that, you feel anything holding back your own orgasm fade away, a long, relieved moan forcing its way out of your lungs. You shiver and groan as your collar and vibrators finally allow you to cum, ");
		if(pc.hasCock()) output("[pc.cocks] shooting their load all inside your new suit ");
		if(pc.isHerm()) output(" and ");
		if(pc.hasVagina()) output("[pc.vaginas] spasming alongside your [pc.asshole] around their equally girthy and knotty fake-cocks");
		else output("while your [pc.asshole] spasms around the big, human dildo lodged inside you");
		output(". At the same time, your cousin’s pussy convulses around your tongue, coating your face with her crystal-clear fem-spunk, dribbling down your face and chin until you’re practically drowning.");

		output("\n\nFinally coming down from your peak, you look up at Jill, who’s only just coming down from hers. Her chest heaves ");
		if(pc.hasHair()) output("and her fingers run through your [pc.hair] appreciatively ");
		output("for a moment before she smirks and pulls her hand back, and then her hips, releasing you from the grip of her legs and muff while she’s still leaking girlcum onto the floor.");
		output("\n\n<i>“Not bad, slut,”</i> she chides, putting away her Codex with quite a bit of blush still on her face, <i>“Now get out of here, you dumb mutt, or I’ll come ride your face again!”</i>");

		output("\n\nWith that, your cousin zips up her pants, and walks away with the crowd that had gathered, her legs still a bit wobbly from your oral pleasures. You figure you should do the same and get back to Belle, now that your command and loins have been thoroughly fulfilled. <i>Though, you did just fuck your own cousin.</i>");
		processTime(30);
		pc.girlCumInMouth(rival);
	}
	if(pc.hasCock()) pc.applyCumSoaked();
	else if(pc.hasVagina() && pc.isSquirter()) pc.applyPussyDrenched();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",aftermathOfRivalIncestYaCunts);
}
public function aftermathOfRivalIncestYaCunts():void
{
	clearOutput();
	author("HugsAlright");
	showBelle();
	moveTo("SUBSHIT");
	output("It isn’t too long before you’re back within the confines of Belle’s lab, your master waiting there at the entrance for you with a big smile on her face. You quickly walk your way up to her and she greets you with a hearty <i>“Good [pc.boyGirl]”</i> and a ");
	//pcAusar/Kaithrit/Half:
	if(pc.race().indexOf("ausar") != -1 || pc.race().indexOf("kaithrit") != -1) output("scritch of your ears");
	else output("pat on your head");
	output(".");

	output("\n\n<i>“Good job with those tests,”</i> Belle coos happily with a grin still on her face, <i>“Everything seems to be working perfectly, and without your master there no less! Such a good [pc.boyGirl].”</i> The lady scientist takes a look at your cum-covered face and jump-suit, along with the mess you made inside it, <i>“Maybe we should get you cleaned up first, [pc.boyGirl].”</i>");

	processTime(10);
	clearMenu();
	addButton(0,"Next",cleanupOfRivalSluttery);
}
public function cleanupOfRivalSluttery():void
{
	subTunerExhibEnd();
	IncrementFlag("SUBTUNER_COUSINCESTED");
}

//Anno
//This variant can occur if the Anno is on crew.
public function subTunerAnnoExhib():void
{
	clearOutput();
	author("HugsAlright");
	showAnno(true);
	output("You wander around the great wabeship that is Uveto station for some time, absent-mindedly whining and moaning under the pleasurable weight of the vibrators inside you. Unfortunately, finding someone to pleasure is proving troublesome: the toves you meet are not at all interested in your sexual escapades, and most of the alien strangers that you kneel before simply smile, pat your head and call you a good puppy... <i>and you really wish your master was here</i>.");
	output("\n\nAfter a few more moments of scouting for sex, your ears are greeted by a familiar, playful voice.");
	output("\n\n<i>“Hey boss!”</i> the voice says, prompting you to turn towards it’s source, <i>“Fancy meeting you here like this.”</i>");
	output("\n\nSure enough, your eyes are greeted by your own snowy-haired ausar tech, Anno Dorna, holo-pad in hand. <i>Almost immediately your mind is filled with thoughts of how you could please this possible master</i>, because surely, of all the people on Uveto, Anno would have the least problem with letting you pleasure her.");
	output("\n\nThe ausar finishes her walk up to you and stops to scan your <b>very</b> tight attire, as well as that collar around your neck");
	if(pc.hasCock()) output(", obviously stealing a few glances at that bulge in your pants as well");
	output(".");

	output("\n\n<i>“Heeeeey,”</i> she whines with a little pout on her face, arms hugging at the data-pad she’s holding, <i>“How come you never invite me to do this kind of stuff with you?”</i>");
	output("\n\nYou’re too focused on those gently buzzing toys in and on you to give her an answer to that question. Instead, you get on your knees right in front of her and paw at her crotch with your hand, whining like a puppy, begging to get at the delicious folds of her sex.");
	output("\n\n<i>“W-whoa!”</i> Anno stutters as your digits brush against her still-clothed pussy, <i>“I was hoping I’d be the one in the collar, but I gueeeess I can let you have </i>all<i> the fun for once.”</i> She gives you a smile and a wink with that before continuing, <i>“Just uh, not out here. Think we could find somewhere more... private?”</i>");
	output("\n\n<i>If that’s what it takes for you to get Anno off, of course you can find somewhere more private.</i> You nod eagerly at her proposal, resulting in a smile from the ausar along with a wag of her big, fluffy tail.");
	output("\n\n<i>“Umm,”</i> she ponders for a moment, <i>“I think I know a place we could go. Steele Tech has a little building they use for storage near here. It </i>should<i> be pretty empty, don’t think there’s any shipments due today.”</i>");
	output("\n\n<i>If your new master thinks it’s a good idea, of course it is.</i> You give Anno another nod to tell her you’re ready.");
	output("\n\nThe ausar gives you a grin, <i>“Alright! Let’s get going... uh, [pc.boyGirl].”</i>");
	processTime(20);
	clearMenu();
	addButton(0,"Next",subTunerAnnoExhib2);
}
public function subTunerAnnoExhib2():void
{
	clearOutput();
	author("HugsAlright");
	showAnno(true);
	output("After getting back up on your [pc.feet], Anno leads you around the best she can without a leash to the building she was talking about. Sleek and featureless like most of the places on the station, the Steele Tech storage’s only defining attribute is the control panel next to the door which Anno quickly taps a few keys on. Watching the ausar’s tail wagging like it is makes you think she’s just as excited for this as you are. A moment later and the door swishes open, and Anno walks her way into the storage depot, stopping in the door to look over her shoulder at you.");
	output("\n\n<i>“Coming?”</i>");
	output("\n\n<i>Oh, you most certainly are</i>, or are going to be, at least.");
	output("\n\nYou follow your canine companion for a little while longer until she leads the two of you behind a suitably hidden stack of crates that should keep you lovemaking concealed well enough. When Anno finally comes to a stop, she spins around on a heel to look at you.");
	output("\n\n<i>“Hmmm,”</i> says the snowy ausar, tapping a finger on her chin and scanning your eager, silent frame for a moment, <i>“Uh... sit?”</i>");
	output("\n\n<i>Though she isn’t Belle, you feel compelled to do what she says</i>, so you quickly bring yourself down to your knees and look up at Anno, ready for your next command.");
	output("\n\nYour obedience prompts a coo and a sly smile from your ausar mistress, <i>“Ooooooh, I could get used to that.”</i> With that she reaches for ");
	//annoBlouse:
	if(!(anno.armor is AnnosCatsuit)) output("the hem of her blouse");
	else output("the zipper of her catsuit");
	output(", <i>“Now just... be a good [pc.boyGirl] and I’ll let you watch.”</i>");

	output("\n\n<i>Sounds like a pretty good deal to you.</i>");

	//annoBlouse:
	if(!(anno.armor is AnnosCatsuit))
	{
		output("\n\nAnno smiles as you keep your spot right in front of her, and starts to remove her blouse with tantalizing slowness. The girl’s being a little tease with the speed of her stripping and she knows it, leaving you to squirm with anticipation as inch after inch of pale ausar flesh and smooth tummy is revealed until her undressing reaches the swell of her breasts. With the same sluggishness, Anno raises her top like a stage curtain over her breasts, baring nice, round curves to your eyes all until her shirt pops over her big, pink nipples, already stiff with arousal.");
		output("\n\nThe ausar girl finishes her little show and tosses her shirt away, keeping a cool and confident smile on her face. Soon, though, she’s onto the next act, and quickly undoes the zipper of her jeans, seeming to lose a bit of her previously seductive composure to lust. Her pants come down with little problem, leaving her pussy in the open air, the speedy movements of her tail wafting that heavy, earthy scent of hers to your nose, and it’s enough to make you drool and your tongue loll. Anno sits herself down on a nearby crate and kicks off her boots while she forces her tail through the hole in her jeans. She takes notice of your hungry gaze and smiles. It isn’t much longer before the ausar is stepping out of her lower-garments and tossing them away, swiftly crossing her legs to hide what she knows you’re after.");
	}
	//annoSuit:
	else
	{
		output("\n\nAnno smiles as you keep your spot right in front of her, and starts to undo the single zipper on her suit with tantalizing slowness. The girl’s being a little tease with the speed of her stripping and she knows it, leaving you to squirm with anticipation as miniscule amounts of pale ausar flesh around her breasts are revealed. Once that zipper reaches tummy-level, Anno reaches for the open catsuit ");
		if(silly) output("(dogsuit?) ");
		output("around her chest and pulls it away like curtains from a stage. Her big, soft breasts spill free of their confines with a pleasing jiggle, revealing her pert pink nipples and rivulets of sweat previously contained by a long day in her suit rolling down her curvy form. Keeping a cool, confident grin on her face, she takes a tit in each fuzzy hand and squeezes them together, rubbing them and pinching at her own nipples until you start sweating.");

		output("\n\nOnce the ausar girl is sure she’s got you ready to go with her little show, she moves on to the next act, reaching for her zipper to pull it <i>all</i> the way down this time. Her catsuit comes undone with little effort, exposing her pussy to the open air, the movements of her tail wafting an entire day’s worth of her earthy scent towards you. The smell of her sex hits you like a ton of feathers, that zipsuit having bottled up her arousal, holding it there until Anno uncorked it for you to enjoy, and it’s all enough to make you drool and your tongue loll. She takes notice of your hungry gaze and smiles. It isn’t much longer before the ausar is stepping out of her catsuit and tossing it away, swiftly crossing her legs to hide what she knows you’re after.");
	}
	output("\n\nYou sit there, staring at where Anno’s pussy would be if her legs weren’t crossed, but managing to break your gaze from her crotch for a moment, you look up at for a moment to see her usual, playful grin. Keeping that look on her face, the ausar unravels her legs and spreads them, revealing the drooling pink pussy between, fem-lube already covering her smooth inner-thighs and forming thin, crystal-clear strings of arousal between her legs. You lick your lips in preparation, expecting your next order any moment now as you wait there on your knees. <i>Good pets don’t move unless they’re told to, after all.</i>");
	output("\n\n<i>“Come and geeeet iiiiiit,”</i> Anno coos, curling a fluffy white finger to draw you towards her.");
	output("\n\nYou follow that command like the good little puppy you are, and rush between your mistress’ legs as fast as you can, planting your face against her muff with a content sigh. Taking a deep breath, you drink deep of her musky, earthy odor, letting it dull your senses until lust throws you into overdrive, a pair of fuzzy hands grasping at your head");
	if(pc.hasHair()) output(" and running through your [pc.hair]");
	output(".");

	output("\n\nYou dig in, driving your [pc.tongue] to spread Anno’s sopping nether-lips with a whimper, that same pair of fluffy ausar hands tightening around your head as you kiss her folds. With that little whine of your lover’s voice comes a shock of pleasure to your loins, those special toys of Belle’s picking up on Anno’s pleasure and buzzing a bit faster than before. You moan under the weight of the well-deserved bliss into the ausar’s warm, wet pussy.");
	output("\n\nYou can already taste her bitter-sweet fluids flowing between your lips as you lick along her slit, gathering what fem-lube you can. Moans and gasps fill the quiet air around you as your oral ministrations continue, and soon a fur-covered leg is wrapping itself around your head as its owner clenches down around your [pc.tongue]. All those noises set the dildo");
	if(pc.hasVagina()) output("s");
	output(" inside you and on your nipples vibrating all the harder, your mind fizzling blank with a combination of firing synapses, and a wonderful scent that just makes you melt. It doesn’t seem like Anno’s feeling too different, as she’s falling back onto the crate, moaning loudly as her leg keeps you well secured against her muff.");

	output("\n\n<i>You didn’t put on this collar just to make Anno moan, though. No, you came here to make her </i>cum<i>.</i> ");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG) || pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output("With quite the oral-organ at your disposal, you drive your long, prehensile tongue deep into your ausar mistress’ quim to depths no normal Terran could reach, depths that make her voice reach peak-pitches of pleasure and her leg kick. She quakes in her place, each movement of your far-reaching member keeping Anno in constant bliss as her sweet nectars flow down your throat.");
	else output("You drive your tongue deep into your ausar mistress’ quim, spreading her lower-lips to make her voice peak and her leg kick like a dog’s. She quakes in her place, shivering with bliss as you lap up her delicious nectars like the good pet you are, making sure not to waste a drop.");

	output("\n\nEvery shift of your [pc.tongue] and every convulsing movement of your lover’s pussy makes your vibrators buzz all the more, teasing your [pc.nipples] and ravaging your ");
	if(pc.hasVagina()) output("[pc.vagina] and ");
	output("clenching pucker, driving you closer and closer to your climax. Luckily, it isn’t long before you get to enjoy the ecstasy of release.");

	output("\n\nAnno’s voice breaks into a high moan that sounds more like a canine <i>“yip!”</i> rather than a cry of pleasure, nevertheless you feel her hands clench at your ");
	if(pc.hasHair()) output("[pc.hair]");
	else output("scalp");
	output(" and her legs tense around your head. She quivers with the weight of her orgasm, her already sopping pussy clenches tight around your [pc.tongue], surging ausar girlcum into your mouth and down your gullet as her inner walls spasm. At the same time, it seems your vibrators and collar will finally allow you to cum. You let out a deep groan as your [pc.asshole] clamps down around its dildo, spasming around the false-phallus while relief burns in your loins.");
	if(pc.hasVagina()) output(" Your [pc.vagina] follows suit, and clenches around the canine-toy inside it, soiling your once-clean Accu-Pitch suit with a wealth of [pc.girlcum].");
	if(pc.hasCock()) 
	{
		output(" Spasming and spraying the inside of your catsuit with [pc.cum], your [pc.cocks] empty ");
		if(pc.totalCocks() == 1) output("its");
		else output("their");
	}
	output(" bountiful load, a reward well deserved for pleasuring Anno like you did.");

	output("\n\nFinally coming down from her long, pleasurable peak, Anno manages to speak between heaves of her full chest, her legs now resting at an akimbo position with a single hand still running through your [pc.hair]. <i>“Wow... boss,”</i> she breathes, managing to prop herself up on an elbow, getting a good look at your cum-slick face, <i>“That was amazing... maybe I should get you in a collar more often.”</i>");
	output("\n\nHer words bring a smile to your face");

	if(pc.race().indexOf("ausar") != -1 && pc.tailCount > 0) output(" and set your [pc.tail] wagging");
	output(", <i>because knowing you pleased your mistress is all the reward you could ever need</i>.");

	output("\n\n<i>“Hey... uh,”</i> Anno says between laboured breaths, <i>“Why don’t you head out... and I’ll catch up with you, think I need a breather after that.”</i>");
	output("\n\n<i>If that’s what she thinks is best, of course you’ll head out... Belle’s probably expecting you back by now anyways.</i> You nod at the ausar girl’s suggestion and pick yourself up off your knees, though your legs are still a bit wobbly from orgasm. Anno falls backwards onto the crate again, wiping some sweat from her forehead and releasing a long, happy sigh.");
	output("\n\nYou make your way out of the storage depot with a smile, catching a glimpse of Anno’s lazily swinging, white-furred leg. Pride that only a good pet can feel swells in your chest, leaving the Steele Tech building well fulfilled, and with a <i>very</i> happy mistr- er... employee, but for now, it’s time to get back to Belle.");

	processTime(30);
	pc.orgasm();
	pc.girlCumInMouth(anno);
	clearMenu();
	addButton(0,"Next",subTunerAnnoExhib3);
}
public function subTunerAnnoExhib3():void
{
	clearOutput();
	author("HugsAlright");
	showBelle();
	moveTo("SUBSHIT");
	output("It isn’t too long before you’re back within the confines of Belle’s lab, your master waiting there at the entrance for you with a big smile on her face. You quickly walk your way up to her and she greets you with a hearty <i>“Good [pc.boyGirl]”</i> and a ");
	if(pc.race().indexOf("ausar") != -1 || pc.race().indexOf("kaithrit") != -1) output("scritch of your ears");
	else output("pat on your head");
	output(".");

	output("\n\n<i>“Good job with those tests,”</i> Belle coos happily with a grin still on her face, <i>“Everything seems to be working perfectly, and without your master there no less! Such a good [pc.boyGirl].”</i> The lady scientist takes a look at your cum-covered face and jump-suit, along with the mess you made inside it, <i>“Maybe we should get you cleaned up first, [pc.boyGirl].”</i>");

	processTime(15);
	clearMenu();
	addButton(0,"Next",subTunerAnnoExhib4);
}
public function subTunerAnnoExhib4():void
{
	subTunerExhibEnd();
	IncrementFlag("SUBTUNER_ANNOED");
}

//Syri
//This variant can occur for PC’s with Syri on their crew or when Syri is on Uveto.
public function syriExhibStuff():void
{
	clearOutput();
	author("HugsAlright");
	showSyri();
	output("You wander around the great wabeship that is Uveto station for some time, absent-mindedly whining and moaning under the pleasurable weight of the vibrators inside you. Unfortunately, finding someone to pleasure is proving troublesome: the toves you meet are not at all interested in your sexual escapades, and most of the alien strangers that you kneel before simply smile, pat your head and call you a good puppy... <i>and you really wish your master was here</i>.");

	output("\n\nAfter a few more moments of scouting for sex, your eyes are met with an unmistakable raven mane standing out amongst the rest of the station, currently facing away from you.");
	output("\n\nThinking this could be your ticket to climax, you make your way towards that head of dark hair, and sure enough, it’s attached to your friendly neighborhood ausar-shemale: Syri, who quickly takes notice of your approach.");

	//pcAusar/Half:
	if(pc.race().indexOf("ausar") != -1)
	{
		output("\n\nShe rolls those blue eyes of hers and give you a look that you know is supposed to make you feel shame, <i>but there’s no shame in being a good pet<i>. <i>“");
		if(flags["SUBTUNER_SYRIED"] == undefined) output("Nice getup,");
		else output("C’mon, </i>again<i>?");
		output("”</i> she chides, clearly not pleased with your choice of attire and collars, <i>“Out here giving all the rest of us a bad name, I see, just like my sister.”</i>");
	}
	//Else:
	else
	{
		output("\n\n<i>“Uh, cap?”</i> she says, cocking an eyebrow and taking a few strides closer to you, <i>“You uh, having a good time out here?”</i> She scans your frame for a second, from collar to crotch, her eyes widening and tail wagging at the sight, <i>“That suit seems... a little tight.”</i>");
	}
	output("\n\nYou don’t really know how to respond to her words, <i>but you do know you want to pleasure her</i>. So, you get down on your knees and extend a hand to paw at her warm bulge, whining like a begging puppy.");
	output("\n\nThat manages to draw a grin from Syri, and sets her tail wagging a bit faster, <i>“");
	if(pc.race().indexOf("ausar") != -1) output("Well, I guess everyone has to get their kicks somehow.");
	else output("What, does puppy need a bone?");
	output("”</i>");

	output("\n\nWith those vibrators gently buzzing away inside you, and possible release so close, you lose a bit of your control and wrap your arms around Syri’s flared hip, rubbing your cheek against her crotch and whimpering with need. She jumps in response, but quickly settles down with a chuckle and a grin, <i>“Alright, alright, just give me a little space.”</i>");

	output("\n\nYou do as the ausar says and pull yourself off her with a bit of reluctance.");

	output("\n\nNo stranger to exhibition, and not one to pass up a blowjob, Syri unceremoniously unzips her pants, easily allowing her slowly stiffening doggy-dong and hefty balls flop free in full view of you, and the rest of the station. Your tongue lolls at the sight of all that ausar cock, pulsing with each beat of its owner’s heart, and a heavenly musk already filling your nostrils and clouding your senses. You look up at your new, wolfy mistress for permission, after all, <i>a good pet waits for orders</i>.");

	output("\n\n<i>“Go on,”</i> she says with a smile, placing a fluffy hand ");

	if(pc.race().indexOf("ausar") != -1 || pc.race().indexOf("kaithrit") != -1) output("between your [pc.ears]");
	else output("on your head");
	output(", <i>“Fetch.”</i>");

	output("\n\nFinally receiving that command, you’re on Syri like ");
	if(silly) output("an ausar on a leash");
	else output("a cum-slut on a kui-tan");
	output(", darting forward and taking her tapered tip between your [pc.lipsChaste]. The ausar quivers in her spot for a moment as you lavish her cockhead with your tongue, coating it with your saliva. You can feel Syri tensing when you move your tongue, and with each clench of her muscles the vibrators in and on you pick up in speed, shaking violently against your inner walls. The pleasurable buzzing leaves you to moan gently onto your lover’s warm shaft. You don’t let up and start to slide your way down Syri’s manhood, wet lips sliding along her cock while your tongue caresses her sensitive undercarriage all the way down, making the ausar whimper.");

	output("\n\nOnce you’ve got her deep-red dong well sheathed between your [pc.lips], you let your tongue loll from your mouth and gently lick along the circumference of Syri’s big ol’ knot, wetting the ball of cockflesh and tearing a few moans from its owner’s lips.");

	output("\n\nAt this point, a small crowd seems to have gathered behind you, judging by the sudden shadows being cast around you and all that mumbling gossip. You pay no attention to them, though, <i>because all that matters is making your mistress cum</i>. ");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG) && pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(" To further speed you along your way to that goal, you employ your very special oral organ. You snake your [pc.tongue] around Syri’s turgid tool, wrapping it in hot, wet coils, squeezing it tightly until she groans loudly for you. Her pleasured tones send a surge of bliss to your loins, only serving to increase your efforts and leading you to shift the coils of your tongue around her cock, effectively jerking her off within the embrace of your mouth.");
	else output(" To further speed you along your way to that goal, you start to bob your head up and down Syri’s shaft. You lavish her turgid red rod with your [pc.tongue] all the while. The ausar woman groans loudly as you lovingly polish her cock. Her pleasured tones send a surge of bliss to your loins through your toys, only serving to increase your efforts as a furred hand runs " + (pc.hasHair() ? "through your hair" : "across your head") + ". You take time to pull yourself off Syri’s dick to jerk her off with your hand while you kiss at her tip before spearing yourself on her puppy cock again.");

	output("\n\nAt this point you can feel your orgasm building as Syri’s mounts simultaneously, your vibrators picking up in speed as Syri moans all the louder and bucks her hips into your maw. Unsurprisingly, it’s not long before a feral grunt forces its way past Syri’s lips and she forces her doggy-dick down your throat, the slab of cockmeat already spasming between your lips. The ausar keeps you well and stuck on her tool with a firm grip. Her large balls empty down your gullet, filling you with her molten-hot cum until your stomach gurgles with fullness. At the same time, it seems your vibrators and collar will finally allow you to cum. You let out a deep groan as your [pc.asshole] clamps down around its dildo, spasming around the false-phallus while relief burns in your loins.");
	if(pc.hasVagina()) output(" Your [pc.vagina] follows suit, and clenches around the canine-toy inside it, soiling your once-clean Accu-Pitch suit with a wealth of [pc.girlcum].");
	if(pc.hasCock())
	{
		output(" Spasming and spraying the inside of your catsuit with [pc.cum], your [pc.cocks] empty ");
		if(pc.cockTotal() == 1) output("its");
		else output("their");
		output(" bountiful load, a reward well deserved for pleasuring your mistress like you did.");
	}
	output("\n\nWith a few final jerky thrusts of her hips and her grip on you loosening, Syri seems to be coming down from her climax, looking down at you with a pleased smile. She pulls her hips back, allowing her softening cock to fall free of your mouth’s embrace, dripping cum and saliva alike onto the floor below as the crowd around you disperses. <i>“Well, that was nice,”</i> she coos between heaves of her bosom, ");
	if(pc.race().indexOf("ausar") != -1 || pc.race().indexOf("kaithrit") != -1) output("rubbing a thumb across your [pc.ears] affectionately");
	else output("giving you a pat on the head");
	output(", <i>“Guess I’ll... ");
	if(syriIsCrew()) output("see you back at the ship");
	else output("see you back at the bar");
	output(", can’t exactly cuddle out here, can we?”</i> With that, she’s giving you a smile and pulling up her pants before making her way towards wherever it is she’s going, leaving you alone to make your way back to Belle.");

	output("\n\nYou rise to your [pc.feet], your legs still a bit shaky from the power of your orgasm, and prepare to make your way back to Accu-Pitch.");

	
	processTime(30);
	pc.orgasm();
	pc.loadInMouth(syri);
	clearMenu();
	addButton(0,"Next",syriExhibStuff2);
}
public function syriExhibStuff2():void
{
	clearOutput();
	author("HugsAlright");
	showBelle();
	output("It isn’t too long before you’re back within the confines of Belle’s lab, your master waiting there at the entrance for you with a big smile on her face. You quickly walk your way up to her and she greets you with a hearty <i>“Good [pc.boyGirl]”</i> and a ");
	if(pc.race().indexOf("ausar") != -1 || pc.race().indexOf("kaithrit") != -1) output("scritch of your ears");
	else output("pat on your head");
	output(".");

	output("\n\n<i>“Good job with those tests,”</i> Belle coos happily with a grin still on her face, <i>“Everything seems to be working perfectly, and without your master there no less! Such a good [pc.boyGirl].”</i> The lady scientist takes a look at your cum-covered face and jump-suit, along with the mess you made inside it, <i>“Maybe we should get you cleaned up first, [pc.boyGirl].”</i>");

	processTime(25);
	clearMenu();
	addButton(0,"Next",syriExhibStuff3);
}
public function syriExhibStuff3():void
{
	subTunerExhibEnd();
	IncrementFlag("SUBTUNER_SYRIED");
}


//Kiro
//This variant can occur for PCs that have rescued Kiro.
public function subTunerKiroExhib():void
{
	clearOutput();
	author("HugsAlright");
	showKiro(true);
	output("You wander around the great wabeship that is Uveto station for some time, absent-mindedly whining and moaning under the pleasurable weight of the vibrators inside you. Unfortunately, finding someone to pleasure is proving troublesome: the toves you meet are not at all interested in your sexual escapades, and most of the alien strangers that you kneel before simply smile, pat your head and call you a good puppy... <i>and you really wish your master was here</i>.");
	output("\n\nAfter a few more moments of scouting for sex, you ears are greeted by a familiar voice calling out nearby.");
	output("\n\n<i>“Angel, is that you?”</i> it asks, drawing your attention, sounding like it’s moving closer to you.");
	output("\n\nYou turn towards the source of the voice only to see Kiro, your cock-wielding kui-tan space-pirate friend. That tail of hers is <i>unmistakable</i>.");
	output("\n\nShe stops in front of you to scan your catsuit-covered figure, taking note of that blinking collar around your neck, <i>“Nice outfit... so uh... you with anyone right now or you just here on your own?”</i>");
	output("\n\nYou would answer her question, but you’re too distracted by that massive bulge of hers to do so. Your tongue lolls at the thought of all that cock in her pants, those big, fuzzy balls so pent up and full of cum. <i>Kiro is most definitely a master you’d want to please... just like Belle told you to.</i>");
	output("\n\nThe tanuki pirate takes notice of your gaze on her crotch and grins, <i>“What’s wrong, </i>[pc.boyGirl]<i>, need a snack? Been out here too long without a good cock?”</i>");
	output("\n\nYou nod eagerly, keeping your eyes fixed on her kui-tan package.");
	output("\n\n<i>“Well then,”</i> she breathes, reaching for her dress to lift it, allowing her balls to spill free of their confines, reddish-brown horsecock already appearing from its sheath, <i>“Here you go, puppy, eat up.”</i>");

	output("\n\nKiro’s not quite hard yet, but you intend to make her so. You drop to your knees and dart forward, taking her cockhead into your mouth, lips caressing her flare. The kui-tan shivers with pleasure as your [pc.lips] make contact with her sensitive flesh, translating to a quick buzz of pleasure from the vibrators on and in you. Looks like those things are working.");
	output("\n\nYou can feel all this horsecock stiffening between your lips, growing just a bit bigger with each pulse of Kiro’s heart, but it still has a long way to go. To aid this slab of cockmeat along its way, you grab your new master’s shaft with both hands, getting a firm grasp before you start to stroke. Kiro whimpers quietly under the force of your double-pronged handjob, reaching a paw down to ");
	if(pc.hasHair()) output("run through your [pc.hair]");
	else output("run along your scalp");
	output(".");

	output("\n\nEach one of your lover’s quiet, pleasured noises sets your toys quaking, rubbing against your inner walls in with subtle, blissful friction. Kiro’s ");
	if(silly) output("magnum");
	else output("huge");
	output(" dong hardens between your lips all the while, with its owner trying to force you further down onto her equine tool. You take it <i>like the good puppy you are</i>, letting hot horsecock fill your mouth as you jerk it off, drops of pre already leaking onto your tongue. Before too long, Kiro’s completely erect, and it’s all almost too much for you to handle. She’s just so big! The tanuki herself is absentmindedly thrusting against your whole body, getting her sensitive undercarriage to rub up on your catsuit-covered chest, shoving more and more kui-cock into your mouth at the same time.");

	output("\n\nYou lavish your master’s flared tip with your tongue, licking up all the pre-cum you can, whining and moaning gently as Kiro does the same. With your hands working overtime on all the cock you can take hold of, your mouth all over her tip, and your chest being used as an onahole, your master seems to be in heaven, closing her eyes and biting her lip with each pump of her fuzzy hips. Your vibrators can only buzz more and more under your clothes, sending you closer to your own orgasm the closer Kiro gets to hers.");

	output("\n\nWell, Belle told you to come out here and make someone <i>cum</i>, and that’s what you’re going to do. You redouble your efforts, vigorously stroking Kiro’s horse cock and polishing her flat tip, drool leaking from between your lips and down her shaft, aiding in your double-handjob. Occasionally, you pull yourself off all that tanuki dick to engage in a little cock-worship, kissing at Kiro’s turgid tool, licking it all over, and just rubbing it against your cheek, making its owner coo happily.");
	output("\n\nWith all the wonderful attention her cock is receiving, it isn’t long before your master is on her edge, back arching with a low groan forcing its way past her lips. She thrusts upwards into your mouth as her shaft spasms between your [pc.lips]. All that cum in Kiro’s huge balls empties right down your throat, spurt after spurt of warm kui-spunk flowing down your gullet as she moans and moans. There’s so much cum, and all of it swells your stomach, rounding taut flesh until you’re looking pregnant, or like a cum balloon. What’s unable to make its way into your mouth splatters your face, painting you a vibrant shade of alabaster.");
	output("\n\nAt the same time, it seems your vibrators and collar will finally allow you to cum. You let out a deep groan as your [pc.asshole] clamps down around its dildo, spasming around the false-phallus while relief burns in your loins.");
	if(pc.hasVagina()) output(" Your [pc.vagina] follows suit, and clenches around the canine-toy inside it, soiling your once-clean Accu-Pitch suit with a wealth of [pc.girlcum].");
	if(pc.hasCock()) 
	{
		output(" Spasming and spraying the inside of your catsuit with [pc.cum], your [pc.cocks] empty ");
		if(pc.cockTotal() == 1) output("its");
		else output("their");
		output(" bountiful load, a reward well deserved for pleasing your master like you did.");
	}
	output("\n\nKiro pulls her softening horsecock from your mouth as her orgasm comes to an end, breathing heavily and still leaking jizz all over the floor. Her balls look quite less heavy now, at least.");
	output("\n\n<i>“Thanks, [pc.name],”</i> she sighs, releasing her grip on your head, <i>“We should do this again sometime, but uh, I’ll catch you later, angel.”</i> With that, the kui-tan puts her junk away the best she can, giving you a wink and walking away.");
	output("\n\nYou take a deep breath and smile, feeling a lot better now that you’ve finally came, <i>and that you did such a good job pleasing a new master like that</i>. Your knees still shake when you go to pick yourself up, but you’re on your feet and ready to get back to Belle’s lab soon after Kiro leaves. Shouldn’t be a long walk back to Accu-Pitch.");

	processTime(30);
	pc.orgasm();
	pc.loadInMouth(kiro);
	kiro.orgasm();
	clearMenu();
	addButton(0,"Next",subTunerKiroExhib2);
}
public function subTunerKiroExhib2():void
{
	clearOutput();
	author("HugsAlright");
	showBelle();
	moveTo("SUBSHIT");
	output("It isn’t too long before you’re back within the confines of Belle’s lab, your master waiting there at the entrance for you with a big smile on her face. You quickly walk your way up to her and she greets you with a hearty <i>“Good [pc.boyGirl]”</i> and a ");
	if(pc.race().indexOf("ausar") != -1 || pc.race().indexOf("kaithrit") != -1) output("scritch of your ears");
	else output("pat on your head");
	output(".");
	output("\n\n<i>“Good job with those tests,”</i> Belle coos happily with a grin still on her face, <i>“Everything seems to be working perfectly, and without your master there no less! Such a good [pc.boyGirl].”</i> The lady scientist takes a look at your cum-covered face and jump-suit, along with the mess you made inside it, <i>“Maybe we should get you cleaned up first, [pc.boyGirl].”</i>");

	processTime(10);
	clearMenu();
	addButton(0,"Next",subTunerKiroExhib3);
}
public function subTunerKiroExhib3():void
{
	subTunerExhibEnd();
	IncrementFlag("SUBTUNER_KIROED");
}

//Hypnotism
//[Hypnotism]
public function subTunerHypnoShit():void
{
	clearOutput();
	showBelle();
	author("HugsAlright");
	//firstTime:
	if(flags["SUBTUNER_HYPNOED"] == undefined)
	{
		output("<i>“I think I want to try something a bit different today,”</i> Belle says, walking over to a nearby lab bench and procuring a strange device covered in circuitry. It almost looks like a visor of some sort. <i>“Now, this experiment’s thesis is a </i>bit<i> less founded in scientific fact than I’d like it to be, but nevertheless I’d like to test it out. Any success with this device could prove very fruitful to my research.”</i>");
		output("\n\nYou cock your head at your master.");
		output("\n\n<i>“Well, you see... this device is the result of too much free time and extranet access, and is supposed to induce a more ‘traditional’ hypnotic trance,”</i> the lady scientist explains, bringing the strange object in her hands over to you, <i>“Making the wearer more... susceptible to suggestion while entranced, or that’s what it’s supposed to do. Honestly, I don’t expect much from it.”</i> Belle kneels down in front of you with the device in hand, getting about eye-level with you, <i>“I would like you to help me with these tests, but, I need to know if this is something you’re comfortable with doing... don’t feel obligated to help me if you’re not okay with such a thing.”</i>");
		output("\n\nWith that the lady scientist takes a hand and cups your chin, gently stroking your cheek with her thumb, drawing a happy smile from you. Looks like Belle needs to know if you’re comfortable with this... and not just as her pet. <i>Part of you tells you that you should help your master either way, but then you’re reminded good pets shouldn’t lie.</i>");
	}
	//Else:
	else
	{
		output("<i>“Well...”</i> Belle breathes, walking over to a nearby bench to procure her special <i>“hypnosis”</i>-visor before making her way back to you, <i>“I’ve made a few changes to this, and I think it might actually stand a chance of working now.”</i> The lady scientist kneels down in front of you, getting about eye-level with you, <i>“That is if you’re still comfortable with testing it, [pc.boyGirl].”</i>");
		output("\n\nWith that she reaches out to cup your chin, stroking your cheek with a thumb and putting a smile on your face. Looks like you need to let Belle know if you’re comfortable with testing her machine again.");
	}
	processTime(5);
	//[Yes] Tell Belle you would like to help her test that {firstTime: special device //Else: hypnosis machine}.
	//[No] Tell Belle you’re not comfortable with that type of thing. //Returns the PC back to the Experiments menu.
	clearMenu();
	addButton(0,"Yes",sayYesToHypnoShit,undefined,"Yes","Tell Belle you would like to help her test that " + (flags["SUBTUNER_HYPNOED"] == undefined ? "special device" : "hypnosis machine") + ".");
	addButton(1,"No",rejectTheHypno,undefined,"No","Tell Belle you’re not comfortable with that type of thing.");
}

//Yes
//[Yes]
public function sayYesToHypnoShit():void
{
	clearOutput();
	showBelle();
	author("HugsAlright");
	output("You give your master a nod, informing her that you’re ready to assist her with this special experiment of hers. This draws a wide smile from her, and prompts her to reach up from your chin to ");
	if(ausarKaithrit()) output("scritch at your ears");
	else output("pat you on the head");
	output(".");

	output("\n\n<i>“I knew you’d be up for it, [pc.boyGirl],”</i> Belle coos before standing herself back up, <i>“Now, why don’t you have a seat over there and get yourself comfortable while I get this ready.”</i> The woman points out a nearby chair and holds up the device in her hand as she finishes her sentence.");
	output("\n\nYou heed your command <i>like a good puppy</i> and crawl your way over to the nearby seat then plop your [pc.ass] right down in it. Once you’re nice and settled, you notice Belle tightening a few bolts on that visor, and It’s only a moment before she’s done with her work and making her way back towards you.");
	output("\n\n<i>“Alright,”</i> she begins, lifting the device over your head and slowly lowering it, <i>“Now, once this is on, I’m going to turn it on, and its effects, along with your collar, should induce some sort of mentally vulnerable state. <b>Should</b>.”</i> With that the visor descends over your eyes, blocking your vision with what looks to be a turned-off holo-screen, the sound of velcro straps securing the piece of tech to your head loud in your ears. <i>“Now where did I wire the- ah! There it is,”</i> the lady scientist says, her hand tracing along her invention until she reaches a single small button, <i>“Let’s begin.”</i>");
	output("\n\nWith that, Belle presses the button and closes a circuit, turning on the visor. Almost immediately the screen lights up, pulsing with gentle slowly changing color. They’re... calming, making you sink back into your seat a bit.");
	output("\n\nYour master seems to notice your relaxed posture. She chuckles, <i>“That’s nice, isn’t it? Doesn’t being here with your master just make you feel good... safe?”</i>");
	output("\n\n<i>Yeah, it does. It’s like you can feel her arms around you, one hand tight on your leash, whispering praises in your ears. It’s so nice being a good pet and having a master like Belle to take all your worries away.</i> Just as those thoughts begins to fade the lights seems to change, patterns appearing in the colors, almost clearing your mind until it’s all you can focus on, Belle’s voice seeming to flow into the patterns.");
	output("\n\n<i>“I bet you’d like to reward your master, wouldn’t you? Make her feel nice, loved, happy. Such a good [pc.boyGirl] should want to make their master feel good.”</i>");
	output("\n\n<i>Yes, you do want to make her feel good. Her arms seems to slide across your body, running over your crotch and chest, and though you know she isn’t there, it makes you gasp and moan all the same.</i> All these thoughts begin to feel heavy, weighing down on your eyelids and limbs like a hard day’s work. Belle’s voice and the changing colors before you gently fade until you can’t hear or see them... but you hear something, something saying <i>“Good [pc.boyGirl].”</i>");

	processTime(8);
	clearMenu();
	addButton(0,"Next",sayYesToHypnoShit2);
}

public function sayYesToHypnoShit2():void
{
	clearOutput();
	showBelle();
	author("HugsAlright");
	output("You awaken to the sharp noise of a finger snap, opening your eyes only to see that the holo-screen visor has gone black. Before you can try to recollect what just happened, you feel Belle working the device off your noggin. With a few straps loosened, she pulls her invention from your head to reveal her smiling face.");
	output("\n\n<i>“Well,”</i> the human woman says, looking very giddy as she places the visor aside, <i>“Do you feel any different? Any thoughts out of the ordinary? Anything particular you want to do right now?”</i>");
	output("\n\nSitting yourself up in your seat, you ponder your state for a moment, only to realize that you don’t really feel too different, maybe a bit more well rested, but nothing out of the ordinary.");
	output("\n\nYour master sighs and frowns, <i>“I guess that’s to be expected.”</i>");
	output("\n\nYou look at Belle with a quivering lip, <i>after all, you want her experiments to work, and part of you feels like it’s </i>your<i> fault</i>.");
	output("\n\nA smile quickly reappears on the lady scientist’s face, accompanied by a hand reaching up to ");
	if(ausarKaithrit()) output("scratch your [pc.ears]");
	else output("pat you on the head");
	output(", <i>“Don’t worry, [pc.boyGirl]. It’s not your fault, just some... less-than-reliable pseudoscience.”</i>");

	output("\n\nYou coo as her hand runs ");
	if(ausarKaithrit()) output("over your sensitive aural organs");
	else if(pc.hasHair()) output("through your hair");
	else output("over your scalp");
	output(".");

	output("\n\n<i>“Alright, up, [pc.boyGirl],”</i> Belle commands with her much-sterner tone, <i>“Looks like we’re done experimenting for now.”</i>");
	output("\n\nYou do as your master says and rise to your feet in front of her, and without hesitation, she unhinges her leash from your collar, and flips the single switch on its side, turning it off.");
	output("\n\nThough, your pet-like feelings don’t so much as fade this time, quite enjoying the feeling of being Belle’s pet, still smiling at her with your heart fluttering. After a few more moments of silence though, your master speaks up: <i>“Well, I suppose you should be on your way then, my pet.”</i>");
	output("\n\nYeah, that sounds like a good idea right about now.");

	//[Next] Exits the lab tile and adds a “Belle Hypnosis” flag that can trigger any of the following scenes while the PC still has it.
	processTime(60);
	IncrementFlag("SUBTUNER_HYPNOED");
	if(!pc.hasStatusEffect("Belle Hypno")) pc.createStatusEffect("Belle Hypno");
	pc.setStatusMinutes("Belle Hypno",60*72*2);
	clearMenu();
	addButton(0,"Next",leaveAccuPitchLabs);
	//[Next] //Returns the PC outside Belle’s lab.
}

//Masturbation
//Triggers if the PC has the Belle hypnosis flag and chooses the masturbation option.
public function belleMasturbationProc():void
{
	clearOutput();
	showBelle();
	author("HugsAlright");
	output("As soon as the miniscule possibility of touching yourself crosses your mind, you find your thoughts flooded with thoughts of Belle, her hands all over your body. It’s like you can feel her touching you in the most pleasurable ways while an invisible force tugs on an intangible leash, flushing your body with heat.");
	output("\n\nThere’s no way of stopping yourself at this point ");
	//inCivilization:
	if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC)) output(", even though you’re in public");
	output(". ");
	if(!pc.isCrotchExposed() && !pc.isAssExposed() && !pc.isChestExposed()) 
	{
		output("You frantically tear your clothes off, baring yourself to the open");
		if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC)) output(" and everyone around you");
		output(", ready to pleasure yourself");
		output(". Barely thinking, you lean against the nearest ");
		if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC) || InShipInterior(pc)) output("wall");
		else output("flat surface");
		output(" as your knees start to wobble.");
	}
	else
	{
		output("Already bared to the open");
		if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC)) output(" and everyone around you");
		output(", you lean yourself against the nearest ");
		if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC) || InShipInterior(pc)) output("wall");
		else output("flat surface");
		output(", knees shaking with lust.");
	}
	//hasCock:
	if(pc.hasCock())
	{
		output("\n\nYou reach a hand down to your [pc.cockBiggest] and lick your lips, wrapping your fingers around all the cockmeat you can. Once you’re sure you’ve gotten a good enough grip, you go to town, stroking your manhood as fast as you can, tearing pleasured groans from your own lips.");
		//fuckedSaec:
		if(fuckedSaec()) output(" You think about Saec as you go on, imagining yourself ramming her tight ausar pussy, breeding her until she gets all the pups she could ever want. It’s all so vivid, like you can feel her ass quaking against your thighs with each imaginary thrust.");
		else output(" You think of Belle as you go on, imagining yourself sitting in her lap, speared on her cock while a caressing palm jerks you off. It’s all so vivid, like you can feel her breath on your shoulder, whispering praise in your ears.");

		output("\n\nYou seem to be losing control over your own body at this point, unable to stop the vigorous pumping of your shaft, <i>not like you’d want to</i>. Your thoughts drift between sexual fantasy with your master as your orgasm begins to mount, unable to do anything but moan");
		//inCivilization:
		if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC)) output(", even as a crowd gathers around to watch your exhibitionist excursion");
		output(". Your eyes flutter shut, your once gentle stroking becoming an ever-changing sequence of pleasurable rhythms, your mind trying to wring all the pleasure from a simple handjob that it can.");

		output("\n\nEventually, a burning in your loins signals your need for release, and with nary a partner to please, you let your willpower slip away and your climax to begin. You cum with explosive force, quivering in your spot as you thrust against your own hand. Ecstasy rocks your body as you pant and moan, eyes rolling back with bliss. Your [pc.cocks] spasm");
		if(pc.cockTotal() == 1) output("s");
		output(", emptying the contents of your [pc.balls] all over the ");
		if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC) || InShipInterior(pc)) output("floor");
		else output("ground");
		output(", still dreaming of Belle.");
	}
	//Else:
	else
	{
		output("\n\nYou reach a hand down to your [pc.vagina] and quickly sink a pair of fingers into your honeypot with a pleasured gasp. Spreading your fingers, you allow your feminine fluids to spill onto your palm before you start moving your wrist, sliding your digits in and out of your slick cunt until you groan. You think of Belle as you touch yourself, imagine yourself bent over and speared on her twin cocks. It’s all so vivid, like you can feel your pussy spreading around her shaft and her hips slamming against your own. Your eyes flutter closed as you continue, losing yourself to thoughts of your master and all her wonderful leashes and experiments.");
		output("\n\nYou seem to be losing control over your own body at this point, unable to stop the vigorous mastubation, <i>not like you’d want to</i>. Your thoughts drift between sexual fantasy with your master as your orgasm begins to mount, unable to do anything but moan");
		if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC)) output(", even as a crowd gathers around to watch your exhibitionist excursion");
		output(". A once-gentle fingering turns into a energetic finger-fucking, teasing your slit and [pc.clit] with fast, short movements. Though, sometimes massive shockwaves of pleasure leave you still for a moment to recover from many a near-climax.");

		output("\n\nEventually, a burning in your loins signals your need for release, and with nary a partner to please, you let your willpower slip away and your climax to begin. You cum with explosive force, quivering in your spot as your [pc.vagina] clamps down around your fingers and [pc.girlCum] spills out, splattering your thighs and hand until you’re thoroughly drenched. Ecstasy rocks your body as you pant and moan, eyes rolling back with bliss. Your inner walls spasm against your digits, wringing every last ounce of pleasure from your orgasm as you ride it out with no end to the pleasure in sight.");
	}

	output("\n\nAfter a few last good");
	if(pc.hasCock()) output(" jerky pumps of your [pc.hips]");
	else output(" shifts of your [pc.hips]");
	output(", your peak finally seems to plateau with a contented sigh. You look down at the mess you’ve made of the ");
	if(InShipInterior(pc)) output("floor");
	else output("ground");
	output(" around you, ");
	if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC)) output("and up at the now dispersing crowd that had gathered, ");
	output("reveling in the afterglow of a job well done. Your mind feels a lot more... clear after that, like some sort of lock was taken off and thrown away, letting you navigate your own thoughts a bit easier.");

	output("\n\nWith that all out of the way, you ");
	if(!pc.isCrotchExposed() && !pc.isAssExposed() && !pc.isChestExposed()) output("gather your things and ");
	output(" prepare to continue your journey, a bit less horny than before.");

	processTime(20);
	pc.orgasm();
	if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC)) pc.exhibitionism(2);
	//[Next] //Drains lust and removes the hypnosis flag.
	pc.removeStatusEffect("Belle Hypno");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Lab Walk-In
//Triggers if the PC has the Belle hypnosis flag and enters the Accu-Pitch labs tile and is not nude, Should be added onto the rest of the entering-lab text, Should also remove the PC’s gear and place it in inventory and remove the hypnosis flag.
public function labWalkInHypnoEvent():void
{
	showName("\nWEIRD!");
	author("HugsAlright");
	output("\n\nAfter standing there for a moment, <b>you’re hit by the strangest urge, and then everything just goes blank.</b>");
	output("\n\nYour limbs start to move on their own volitions, working diligently to tear away ");
	if(!(pc.armor is EmptySlot)) 
	{
		output("the layers of your [pc.armor]");
		if(!(pc.lowerUndergarment is EmptySlot)) output(" before carefully removing your [pc.lowerUndergarment]");
	}
	else output("your undergarments");
	output(" to leave you bare in the confines of Belle’s lab.");

	output("\n\nYou snap back to reality, only to feel the air on your skin, realizing that you’ve stripped yourself... or at least you think you stripped yourself. Your master still hasn’t noticed you, and Saec isn’t around, so you’re really the only person that could’ve... but you don’t remember it.");

	output("\n\nWeird.\n\n");

	processTime(5);
	//purge hypno
	pc.removeStatusEffect("Belle Hypno");
	pc.lust(5);
	var loots:Array = [];
	if(!(pc.armor is EmptySlot)) loots.push(pc.armor);
	if(!(pc.lowerUndergarment is EmptySlot)) loots.push(pc.lowerUndergarment);
	if(!(pc.upperUndergarment is EmptySlot)) loots.push(pc.upperUndergarment);
	if(loots.length > 0)
	{
		pc.armor.onRemove(pc);
		pc.lowerUndergarment.onRemove(pc);
		pc.upperUndergarment.onRemove(pc);
		quickLoot(pc.armor,pc.lowerUndergarment,pc.upperUndergarment);
		if(!(pc.armor is EmptySlot)) pc.armor = new EmptySlot();
		if(!(pc.lowerUndergarment is EmptySlot)) pc.lowerUndergarment = new EmptySlot();
		if(!(pc.upperUndergarment is EmptySlot)) pc.upperUndergarment = new EmptySlot();
		eventQueue.push(newApproachBelle);
	}
	else
	{
		clearMenu();
		addButton(0,"Next",newApproachBelle);
	}
}

//Uveto Landing
//Triggers when the PC lands on Uveto and exits their ship with the Belle hypnosis flag.
public function uvetoLandingHypno():void
{
	clearOutput();
	showName("\nOH!");
	output("Stepping out into the wabeship of Uveto station, you’re hit by the urge to visit Belle at her lab, <i>though, you feel that pretty often</i>. <i>You want to help her with experiments... pleasure her... make her happy.</i>");
	output("\n\nYeah, you’re starting to think you should get to Accu-Pitch.");

	output("\n\n<i><b>Fast.</b></i>");

	//[Next] //Should add some lust and remove the hypnosis flag.
	pc.lust(50);
	pc.removeStatusEffect("Belle Hypno");
	clearMenu();
	addButton(0,"Next",move,rooms["SUBSHIT"].northExit);
}

//No
//[No]
public function rejectTheHypno():void
{
	clearOutput();
	showBelle();
	author("HugsAlright");
	output("You shake your head and give your master and apologetic look, informing her you’re not really okay with what she’s proposing.");
	output("\n\nYour response prompts a warm smile from Belle, who pulls her hand back and places it on your head, giving you a good ");
	if(ausarKaithrit()) output("scritch");
	else output("head pat");
	output(". <i>“That’s just fine, [pc.boyGirl], I wouldn’t want you to do anything you’re uncomfortable with.”</i>");

	output("\n\nThe woman picks herself back up, leash still in hand, and places the wire-covered headwear back on the bench she got it from. <i>“I guess we’ll just have to find something else to do today, hmm, [pc.boyGirl],”</i> she says with a grin on her face.");

	//[Next] //Actually I guess all the Experiment menu options should be here.
	processTime(3);
	belleExperimentsMenu();
	addDisabledButton(3,"Hypnotism","Hypnotism","You just shot that down.");
}

//Dates
//[Dates]
public function datingBelle():void
{
	clearOutput();
	showBelle();
	author("HugsAlright");
	output("Rubbing your hands together tentatively, you ask Belle if the two of you could spend some time together, without all the experiments.");
	output("\n\nThe lady scientist give you a big smile in response, taking a few steps closer to you and cupping your cheek with one of her hands. <i>“Aww, isn’t that adorable,”</i> Belle coos, stroking your cheek with a thumb, <i>“You want to spend some time with your master, [pc.boyGirl]?”</i>");
	output("\n\nAll you can do is blush in her grasp and respond to her query with a nod.");
	output("\n\n<i>“Well, I’d love to do something like that,”</i> she says very calmly, her voice sending shivers down your spine, <i>“Just give me a moment to decide what we should do.”</i>");
	//[Saec] Actually... you were hoping to spend some time with your {pregSaec: baby-momma //Else: playmate, Saec}. //Requires PC to have fucked Saec and a cock.

	//[Race] Taur races seem to be a popular thing on Uveto, maybe you could go to one with her? //Requires the PC to have been to the taur racetrack and a cock or vagina.
	
	//[Party] Belle seems like a classy lady, so she probably has a few parties she could take you to. //Requires the PC to have completed multiple experiments, can only be done once a week.
	processTime(4);
	var saecBonusString:String = "playmate, Saec";
	if(saecPreg()) saecBonusString = "baby-momma";

	clearMenu();
	if(pc.hasCock() && pc.cockThatFits(saecVaginaCapacity()) >= 0 && fuckedSaec()) addButton(0,"Saec",saeccyDatey,undefined,"Saec","Actually... you were hoping to spend some time with your " + saecBonusString + ".");
	else if(fuckedSaec()) addDisabledButton(0,"Saec","Saec","You need a penis that will fit inside her for this. Sorry!");
	else addDisabledButton(0,"Saec","Saec","You need to have had sex with Saec before you can date her.");

	if(pc.hasGenitals() && flags["TAUR_STADIUMED"] != undefined) addButton(1,"Race",raceTrackDateEvent,undefined,"Race","Taur races seem to be a popular thing on Uveto, maybe you could go to one with her?");
	else if(!pc.hasGenitals()) addDisabledButton(1,"Race","Race","You need genitals of some sort for this.");
	else addDisabledButton(1,"Race","Race","You need to have been to the racetrack at least once first.");

	if(flags["SUBTUNER_PARTY_TIMER"] == undefined) flags["SUBTUNER_PARTY_TIMER"] = 0;

	var belleExperiments:Number = 0;
	if(flags["SUB_TUNERED"] != undefined) belleExperiments++;
	if(flags["SUBTUNER_TENTACLES"] != undefined) belleExperiments++;
	if(flags["SUBTUNER_EXHIBITIONISM"] != undefined) belleExperiments++;
	if(flags["SUBTUNER_HYPNOED"] != undefined) belleExperiments++;

	if(flags["SUBTUNER_PARTY_TIMER"] + 60*24*7 < GetGameTimestamp()) 
	{
		if(belleExperiments >= 3) addButton(2,"Party",peerReviewParty,undefined,"Party","Belle seems like a classy lady, so she probably has a few parties she could take you to.");
		else addDisabledButton(2,"Party","Party","You might need to get to know her a bit better - maybe do some experiments.");
	}
	else addDisabledButton(2,"Party","Party","It’s too soon to have another party.");

	addButton(14,"Back",newApproachBelle,true);
}

//Saec
//[Saec]
public function saeccyDatey():void
{
	clearOutput();
	showBust("BELLE",saecBustString());
	author("HugsAlright");
	output("<i>“Hmm?”</i> Belle hums, either confused or intrigued by your proposal of a date with Saec, <i>“");
	//firstTime:
	if(flags["SAEC_DATES"] == undefined) output("Actually... that sounds like a fine idea. I’ve been meaning to take her out somewhere nice, but I’ve just been so busy at the lab, though, and such a patient girl like her deserves a nice day out. I’m sure she’d just </i>love<i> to go on a date with you.");
	else output("If you and Saec keep going out with each other like this... I might just get jealous, but I think that’s a wonderful idea, the girl could use some time out of the lab.");
	output("”</i> The lady scientist begins to walk toward a nearby room before turning around to face you, <i>“I’m going to go get Saec ready quick, if you’ll just wait here a moment.”</i>");

	output("\n\nYou do as the woman suggest and just... wait there, rocking back and forth on your [pc.feet] as you think about Saec and what you’ll do on her date. Luckily it doesn’t take to long for Belle to return to the lab’s atrium with Saec in tow.");

	output("\n\nYour heart speeds up at the sight of the girl: she’s dressed - unlike her usual, prefered nakedness - in an orange sundress draping down over her ");
	if(pregSaec()) output("big, pregnant belly");
	else output("body");
	output(" and down to her thighs, leaving quite a fair bit of cleavage visible. The ausar keeps her hands clasped together as her master leads her over to you on a leash, blushing and averting her gaze from you.");

	output("\n\n<i>“She cleans up quite nice, wouldn’t you say?”</i> the woman asks, stopping in front of you to lovingly cup Saec’s chin, <i>“Yes, I think she’s perfectly ready for a day out in the station with you.”</i>");

	output("\n\nYou nod in acknowledgement to that statement, smiling as you look into the puppy’s big blue eyes.");
	output("\n\n<i>“Ah! But you’ll be needing this,”</i> Belle interrupts, reaching out to hand you Saec’s leash.");
	output("\n\nYou shoot the woman a questioning look, but take the leather tether from her, holding it tight in your grip, making the ausar it’s attached to grin wider than she was before.");
	output("\n\n<i>“What’s that look for?”</i> her master asks, <i>“</i>You<i> are going to be Saec’s master for this little date, so you’ll need her leash. Don’t want the puppy to get lost, do you?”</i>");
	output("\n\nGiving the lady scientist a shake of your head, you straighten your posture and step a bit closer to Saec, almost protectively.");
	output("\n\n<i>“Good,”</i> she states, <i>“Now why don’t you two be on your way, lots of work to be done at the lab today.”</i> Belle starts to walk towards the door as she finishes that sentence, and beckons you to follow her. You take her lead and make your way to the entrance with Saec in tow. <i>“I’m sure now how these things go, [pc.name]. Take her someplace nice, bring her home before eight, and don’t be </i>too<i> rough with her... just enough,”</i> she says as you finally reach the door, already open, <i>“Oh, and if you want my advice, there’s a lovely little restaurant where you two could go for a nice lunch a few levels down.”</i> With that, the lady scientist is inviting you both out.");
	output("\n\nYou give Belle another smile and nod, and Saec does the same before looking at you with a still-blushing face, clearly eager for your date. After that little exchange of glances, you’re both making your way out the door, your mutual master waving goodbye and calling out, <i>“Be safe you two!”</i>");

	processTime(30);
	clearMenu();
	addButton(0,"Next",saecDate2);
}

public function saecDate2():void
{
	clearOutput();
	showSaec();
	author("HugsAlright");
	output("Almost as soon as you’re out of the lab and walking away, you can feel warm fur brushing against your hand. You turn to see Saec facing away from you, but quickly realize that her fur-covered digits are wrapping around your own, taking hold of the same hand that’s holding her leash.");
	output("\n\nThe gesture makes you smile, and you return the display of affection by firming up your grip and rubbing a thumb along the back of the ausar’s fluffy hand, making her blush all the more.");
	output("\n\nSo, the two of you walk hand-in-hand through the halls in a blissful silence, making your way to an elevator and dropping a few levels, hoping to find that restaurant Belle told you about. ");
	//firstTime:
	if(flags["SAEC_DATES"] == undefined) output("Luckily, it seems Saec knows the place, or has been there before with her master,");
	else output("Luckily, it seems Saec remembers where it is from when you last went there,");
	output(" because when you meet a quaint, rustic looking building standing out amongst the sleek structures of Uveto station, she taps on your shoulder and points it out.");

	output("\n\nYou turn to look at the building, standing out like a single colored hair among a head of grey strands, complete with a wooden sign labeling it as <i>“Manni’s Too”</i>. Saec smiles wide next to you at the simple fact that she’s ");
	if(flags["SAEC_DATES"] == undefined) output("here with you");
	else output("here with you again");
	output(". Seeing that look on her face makes your heart flutter, and you’re eager to get on with this date, so you quickly lead your pet in through the entrance.");

	output("\n\nWalking in, you spot a podium with who must be the day’s grey-skinned, tauric hostess standing behind. She greets you with a practiced, business-like grin as you approach.");

	output("\n\n<i>“Hello,”</i> the leithan girl says, <i>“Table for two today or picking an order up?”</i>");

	output("\n\nAs you’re telling the girl you’d like a booth for two, she turns towards your date and smile a bit more genuinely, <i>“Oh, hey there Saec! Is Doctor Baslocvicz not with you today?”</i>");

	output("\n\nYour ausar companion shakes her head in response, but still keeps a happy look on her face, from ear to big, fluffy ear.");
	if(flags["SAEC_DATES"] == undefined) output(" So Saec has been here before, which would explain why the hostess isn’t too intrigued by the collar and leash around the canine girl’s neck.");
	output("\n\n<i>“Oh, well, good to see a good customer like you around anyways!”</i> she exclaims, grabbing a couple of menus before extending a hand, <i>“I’ll take you to your seats.”</i>");
	output("\n\nThe leithan hostess maneuvers the comparatively-narrow aisles of the restaurant’s booths with surprising grace, trailing her large, tauric half behind her until she reaches a clear table and place a menu on either side of it, <i>“Here’s your seats, your waitress will be with you shortly!”</i> With that she smiles and makes her way back to her place near the building’s entrance, leaving you and Saec alone again.");
	output("\n\nYou invite your date to take a seat and she does, ");
	if(pregSaec()) output("being careful with her pregnant belly as she sits down ");
	output("with you following her into the booth soon after, quickly picking up your menus. Looking around between glances at your choices, you take in the sight of the eatery around you; it’s quite old fashioned: everything seems to be made of lacquered wood, with nice tinted glass obstructing views between booths and brass lighting fixtures keeping the whole restaurant at quite a cozy level of dimness. Leather-covered cushions squeak beneath your [pc.ass] as you shift in your seat.");

	output("\n\nAfter a little while a tall, thin kaithrit waitress comes to take your order of drinks and food before walking off again.");
	output("\n\nWell, it looks like you and Saec are gonna be waiting her for a bit, so you figure you should break the ice and ask the ausar if she’d like to talk with you until your meals get here.");
	output("\n\n<i>“O-oh, sure!”</i> she says with a tone so soft and warm it could melt an Uveto glacier, ");
	if(flags["SAEC_DATES"] == undefined) output("reminding you that this is the first time you’ve actually heard Saec’s voice outside of it being a moan or pleasured whimper, ");
	output("<i>“I usually don’t talk unless Belle gives me permission, though... so I guess I need yours now, right?”</i>");

	//pcHard:
	if(pc.isAss()) output("\n\nYou give the ausar a nod, and she smiles in return, her posture relaxing a bit at receiving that little gesture.");
	//Else:
	else output("\n\nYou tell the ausar beauty she’s always free to talk with you, and that seems to relax her posture more than it already was.");

	output("\n\n<i>“Yay!”</i> she exclaims before settling down and resting her hand in her lap");
	if(pregSaec()) output(" as best she can with that tummy in the way");
	output(", <i>“So what should we talk about?”</i>");

	//firstTime:
	if(flags["SAEC_DATES"] == undefined)
	{
		output("\n\nThinking about it for a moment, you realize you and Saec don’t know each other that well and tell her she ought to speak about herself for a bit.");
		output("\n\n<i>“Oh, okay, yeah... I guess we should get to know each other,”</i> the blonde pup ponders for a moment, <i>“Alright... so I didn’t grow up here on Uveto, but you probably figured that out when you didn’t see any of that huskar fluff-stuff on my neck!”</i> She pauses and smiles, rubbing her indeed-furless neck before continuing again, <i>“I was born on Ausaril... but I didn’t know my parents, and I was raised in a shelter for most of my life, and I didn’t get out until I was sixteen.”</i>");
		output("\n\nSaec looks a bit down after regaling that part of her tale, and you can understand why, being abandoned by your parents and having to raise yourself like that for years. You ask the ausar if she had any other family that she knew.");
		output("\n\nShe quickly shakes her head, <i>“No, well... there was my brother, we were both put into the shelter together, and he got adopted when we were both still young. He probably wasn’t even a year old then.”</i> Saec smiles warmly and twiddles her thumbs, <i>“I still remember what he looks like, he was so small and cute, even for a pup... blonde fur and blue eyes just like me... I wonder how he’s doing now... or where he is.”</i>");
		//metLiamme:
		if(flags["MET_LIAMME"] != undefined) output("\n\nWait... she couldn’t be talking about Lia- nah, no way. The galaxy’s a big place with a lot of blonde ausar, but then again, there’s always that chance.\n\nShaking that thought from your head, you");
		else output("\n\nYou");
		output(" think on Saec’s words for a moment then ask her what exactly brought her to Uveto after leaving the shelter.");

		output("\n\nShe takes a deep breath, puffing out her chest and releasing, clearing her thoughts before she continues, <i>“After I got out... actually ‘kicked out’ is what I should’ve said, I needed to work, so I worked. I couldn’t really hold anything down for long, so I had a lot of different jobs, and then one day I got an offer from a place on Uveto that I applied to, an actual full-time job.”</i> Saec sighs heavily and looks down at her feet under the table, <i>“That was all a scam. I got there, they got my information, and then they took all the money I had saved up over the past eight years. I didn’t have anything, and I couldn’t even get off this stupid moon.”</i> The ausar turns back towards you, her face quite a bit warmer now that that part of her story is over, <i>“That’s when I met Belle. I was looking for some way to make a little money, at least enough to rent a warm room, and I found an ad for Accu-Pitch saying they were hiring test subjects. I didn’t have anywhere else to go, so I went there. The doctor was just... so nice to me. No one had ever treated me like she did, and I loved it... the whole ‘pet’ thing.”</i> Saec pauses and looks right into your eyes, <i>“And then I met you... and I like you a lot... I don’t think I’ve ever had a ‘playmate’ before, so it’s nice to see someone else happy with Belle, and me.”</i>");
		if(pregSaec()) output(" The ausar girl reaches down to caress her pup-swollen belly, <i>“Then there’s this. I- it’s weird, but I just feel so good about it... especially if it’s with someone like you, someone Doctor Belle trusts. It kind of makes me nervous at the same time, but thinking about having my own kids in a nice home, safe and warm with their mommy... to get what I never had. It makes me happy.”</i>");

		output("\n\nThe girl’s whole story brings a smile to your face, all those hardships persevered then rewarded with a good place at Belle’s side");
		if(pregSaec()) output(" and a tummy full of young");
		output(".");
		if(pc.isNice()) output(" You thank her for telling you all that.");
	}
	//Else:
	else output("\n\nThis time, you decide to take the initiative and tell Saec a bit about your journeys since you’ve last met. She watches and listens with great attention until you finish, and once you’re done the blonde pup takes her turn to tell you her latest stories: some movies she saw, a few nice places she’s been, and some stories from the lab that you don’t think Belle would tell you herself.");
	output("\n\nAs your conversation is coming to a close, that kaithrit waitress returns with your meals and awkwardly positions them in front of the two of you, then giving a cheery <i>“Enjoy your meal!”</i> and leaving again.");
	output("\n\nMuch like your walk to the restaurant, your lunch passes in a blissful silence with you and Saec enjoying your food and each other’s company. It doesn’t take too long before you’ve both had your fill and are ready to go. The waitress is back around soon after you’re finished, and tells you that your check has been put on Belle’s tab, leading you to turn to Saec, who gives you a big, knowing grin in return.");
	output("\n\nYou both get up from your seats, and you’re already thinking of what you can do with Saec next. Turning to look at her gives you a few ideas: she’s got quite a lusty look in her eyes, her face turning red as you take hold of her leash again, and looking at her and all that cleavage on display, you’re feeling quite flushed yourself. For being so bashful about this date, Saec’s still got that ausar libido, and seems more than happy to let things get more intimate with you, if your fun together at Accu-Pitch is any indicator.");
	output("\n\nBiting your lip, you take the ausar’s hands in your own (yes, both of them), lacing your fingers between her own fluffy digits and ask her if she’d like to find somewhere private where you two could play.");
	output("\n\nA smile quickly appears on Saec’s face, eyes fluttering, <i>“I don’t think there’s any other way this date could end.”</i> She ponders for a moment before speaking up again, <i>“I think I know somewhere we could go: my room at the lab. I don’t use it very often, so the bed should be nice and clean for us to make a mess of!”</i> Finishing with a playful grin on her face, she bounces giddily in place as she waits for your response.");

	output("\n\nYou tell her that sounds like a great idea.");
	processTime(70);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",saecDate3);
}

public function saecDate3():void
{
	clearOutput();
	showSaec();
	author("HugsAlright");
	var x:int = pc.cockThatFits(saecVaginaCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	var y:int = pc.cockThatFits2(saecVaginaCapacity());
	output("You and Saec walk hand and hand back to the lab, leash interlaced between your fingers as you make your way through the wide open wabeship that is Uveto station. All the way back, your lover is unable to stop her big, fluffy tail from wagging, batting it against your back or butt uncontrollably, though you can tell the furry appendage’s movements are certainly affectionate.");

	output("\n\nWith lust burning in your loins, the trip back seems almost longer, each step stiffening your [pc.cocks]. Luckily, you both reach the lab without delay. Once you’re at the door Saec’s quick to pull up her dress <i>just enough</i> that she can place her own barcode on the door’s scanner and open it, sticking her tongue out and giving you a mischievous smirk.");

	output("\n\nYou stumble into the lab with your ausar pet in tow, walking right past Belle who tries to start a conversation, barely getting out a <i>“Back already?”</i> before you’re both at Saec’s door. It hisses open as you near it, and at this point your leashed-up ausar is leading you into her room by the end of her leash. The entrance swishes close behind you once you’re both in, but you think you catch a glimpse of your mutual-master winking at you before it shuts.");

	output("\n\nSaec wastes no time in throwing herself down onto the mattress, looking up at you with a hungry gaze and her arms curled up like a puppy’s. No doubt your date is looking for something long and hard between her legs. You lick your lips and ");
	if(!pc.isCrotchExposed() && !pc.isChestExposed()) output("strip yourself of your things before ");
	output("follow");
	if(!pc.isChestExposed() && !pc.isCrotchExposed()) output("ing");
	output(" your lover down onto the bed and straddling her on all fours");
	if(pregSaec()) output(", being extra careful with her belly");
	output(". It only takes a moment of looking deep into her blue, blue eyes before you succumb to your sexual hungers and press your lips to hers. Saec returns the kiss with surprising force for such a subby puppy, letting her flat tongue slide into your mouth to dance with your own [pc.tongue]. You press yourself into Saec, only to feel stiff nipples poking through her sundress and rubbing against your [pc.chest]. If you were to guess, this girl’s chest needs a little attention, and you intend to give it some. With your mouth still being filled with ausar-tongue, you reach a hand up to one of your lover’s breasts and squeeze, drawing a chorus of pleasured mewls from the ausar. She sounds like a needy puppy if you’ve ever heard one.");

	output("\n\nYour kissing and groping continues for quite some time, with you and Saec sliding your oral organs against each other and your hands moving across her still-clothed tits, pinching at nipples and caressing warm boob until you feel a hint of dampness on your lover’s dress. You break your tongue-tying embrace to look down at Saec’s chest, only to realize she’s ");
	if(flags["SAEC_DATES"] == undefined) output("quite the milky bitch");
	else output("leaking sweet ausar milk again");
	output(", wetting her sundress with beads of lactatious nectars. By the time you’re thinking about returning to the kiss, you can feel your pet shifting her hips against yours, trying to line up her pussy with your package.");

	output("\n\nIf Saec’s ready to move onto the next course, so are you. Smirking at the horny puppy, you bring yourself up on your knees, positioning yourself between her akimbo legs. There’s no time to waste stripping the girl, so you just go ahead and hike up her dress while she wiggles in anticipation, and there it is: Saec’s dripping ausar pussy. She’s not even wearing any panties, already leaking fem-lube all over the sheet with a glaze of her feminine liquids all over her inner-thighs. The heavenly musk coming from between the ausar’s legs make your tongue loll and sends a wave of lust-inducing chemicals shooting through your mind, telling you to pick up the pace and fuck her already.");
	output("\n\nNot one to deny your baser instincts, you reach down and grab a handful of plush ausar thigh in each hand, making Saec gasp before you lift and spread her legs wide, lifting her ass off the mattress just a touch. Your pet whines furiously, begging for a good fucking as she rocks her hips, trying to get her pussy closer to your already rock-hard cock");
	if(pc.cockTotal() > 1) output("s");
	output(". You smile and rub a fur-covered thigh affectionately, telling your pet not to worry and that you’ll take good care of her.");

	output("\n\nWith that done, you shift your [pc.hips], lining up your [pc.cock " + x + "] with that pink slit and pressing your tip against her sopping folds just enough to make Saec whimper.");
	if(y >= 0) output(" At the same time, you move your second cock into position, right against the ausar’s tight pucker, ready to give your lover some double-penetration loving, just the way she likes it.");
	output(" Looking in your pet’s needy eyes once more is all the motivation you need to push forward, applying a little pressure and gently spreading her sodden hole");
	if(y >= 0) output("s");
	output(" with a gasp. You don’t let up and continue your slow thrust in, stretching Saec’s tightly squeezing cunt");
	if(y >= 0) output(" and asshole");
	output(" ever wider as moaning and groans fill your ears.");
	pc.cockChange();

	output("\n\nYour lover is left panting by the time you bottom out inside her, pussy ");
	//multiCock:
	if(y >= 0) output(" and pucker");
	output(" spasming around ");
	if(y >= 0) output("both ");
	output("of your [pc.cocks]. You smile down at the puppy as she adjusts to your ");
	if(y >= 0) output("twin ");
	output("girth");
	if(y >= 0) output("s");
	output(", and feeling compelled to, you bend down and kiss her right on the lips. Pulling back again, you can hear Saec’s tail whipping against the sheets.");

	output("\n\nYou decide it best not to keep the girl waiting anymore and start to pull back, dragging your [pc.cocks] against her inner walls and pulling a low groan from her lungs. She whines when you’re almost out of her, with your glans meeting her ");
	if(y >= 0) output("ass and ");
	output("lube-leaking cunt again, begging for more. You give Saec what she (and you) want and start to slide back into her, a bit faster this time, releasing a renewed chorus of moans into the room around you. Then you pull back again, and thrust in again, and again, and again, gradually building up in speed until there’s not a moment of silence between your lover’s pleasured calls. Saec’s braless breasts jiggle and quake with every pump of your [pc.hips], gradually rocking free of her sundress until they’re bare. Each wobble of her massive tits sends flicks of milk dripping all over the bed and running down the ausar’s warm boobflesh. The sight of seeing all that ausar chest fucked free of their confines alone leads you to speed up your love making, and it’s all too much for Saec.");

	output("\n\nA high-pitched cry of pleasure permeates the once-steady moaning of the room, causing you to look down just in time to see your pet’s back arch. You can feel ");
	if(y >= 0) output("both of ");
	output("Saec’s well-satisfied ");
	if(y >= 0) output("holes");
	else output("pussy");
	output(" clamp down around ");
	if(y >= 0) output("both ");
	output("of your turgid cock");
	if(y >= 0) output("s");
	output(", her inner walls spasming around your sensitive flesh as they try to wring out every last ounce of pleasure they can. It feels like your [pc.cocks] are being milked, and pulls you over the edge of your climax.");
	if(pc.hasKnot(x)) output(" With a feral grunt you slam your hips forward, your knot meeting Saec’s spasming slit with a gasp, stretching it around your bitch-breaker until it pops in, almost seeming to send your lover into another orgasmic fit.");
	else output(" With a feral grunt you slam your hips forward, burying it inside Saec’s spasming slit with a gasp.");
	if(y >= 0) 
	{
		output(" At the same time, your lower dong thrusts into her tightly-clenching pucker, pushing hard until ");
		if(pc.hasKnot(y)) output("you knot your bitch’s other hole.");
		else output("you’re hilt deep.");
	}

	if(pc.hasKnot(x))
	{
		output("\n\nWith your pet tied to you at the crotch");
	}
	else if(y < 0) output("\n\nWith your [pc.cock " + x + "] planted deep inside your pet");
	else output("\n\nWith your [pc.cocks] planted deep inside your pet");
	output(", you allow your willpower to slide away and your pleasure to peak. Your sides buck jerkily against Saec’s wide hips, making her breasts bounce and sending more milk all over while your shaft");
	if(y >= 0) output("s");
	output(" start to spasm. Another sharp breath from your ausar companion fills the air as your [pc.balls] begin to empty, the first shot of your warm [pc.cumNoun] splattering her inner walls and painting them [pc.cumColor].");
	//lotsOfCum: 
	if(pc.cumQ() >= 3000)
	{
		if(pregSaec()) output(" You’re almost wishing Saec wasn’t pregnant at this point, so you could watch her belly swell full of your seed.");
		else 
		{
			output(" Saec whimpers as you pump her full of your seed, your tremendous load flooding her womb ");
			if(y >= 0) output("and bowels alike ");
			output("until her belly swells to pregnant proportions.");
		}
	}
	else
	{
		output(" Saec whimpers as you pump her full of your seed, filling her womb ");
		if(y >= 0) output("and bowels alike ");
		output("until she’s good and full.");
	}
	output("\n\nYou finally come down from your peak alongside your lover, both of you panting and still shivering with the bliss of your afterglow. There’s not really much you can do at this point besides fall forward onto Saec and bury your head between her heaving breasts. A moment later the puppy lets out a happy coo and wraps her arms around you, and you groan with fatigue-filled contentment, ready to drift off to sleep with your lover.");

	processTime(35);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",saecDate4);
}

public function saecDate4():void
{
	clearOutput();
	showSaec();
	author("HugsAlright");
	output("You yawn into a pair of warm chest-pillows as you wake. Lifting yourself with a stuttering groan, you pull yourself from Saec’s embrace, looking down only to realize that she’s still asleep. You figure it’s probably best to let the girl continue her post-coital nap, though you’ll have to get going yourself.");
	output("\n\nSo, as carefully as you can, you pick yourself up and get yourself off the mattress, ");
	if(!pc.isChestExposed() && !pc.isCrotchExposed()) output("gathering your [pc.gear] and ");
	output("giving your stiff limbs a good stretch before heading to the door. It hisses open as you near it, not nearly loud enough to wake Saec, thankfully. Heading back out into the lab and still wiping some sleep from your eyes, you see Belle, who’s turning around and giving you a smile.");

	output("\n\n<i>“I guess you two had a nice date, then?”</i> she asks, giving you an I-know-what-you-did type of look and placing a hand on her hip.");
	output("\n\nYou give your master a smile and nod in response, leading her to cup your cheek and pull you in for a quick kiss.");
	output("\n\n<i>“Thank you so much for doing this, [pc.boyGirl],”</i> the lady scientist says as her lips part yours, <i>“Poor girl needs to get out of the lab more often, and spend time with someone other than me.”</i> Belle smiles and lets her hand fall from your face, <i>“Now, why don’t you go get some more rest and come back when you’re good any ready for some more experiments... or another playdate?”</i>");
	output("\n\nYeah, that sounds like a good idea.");
	processTime(45);
	pc.energy(10);
	//[Next] Returns the PC outside of the lab.
	IncrementFlag("SAEC_DATES");
	clearMenu();
	addButton(0,"Next",leaveAccuPitchLabs);
}

//Taur Race
//[Race]
public function raceTrackDateEvent():void
{
	clearOutput();
	showBelle();
	author("HugsAlright");
	output("<i>“The racetrack?”</i> Belle responds, stroking her chin with a finger and thumb, <i>“");
	//firstTime:
	if(flags["BELLE_TAURRACED"] == undefined) output("Now there’s somewhere I haven’t been in awhile.");
	else output("Well, that last time we went there was </i>quite<i> enjoyable.");
	output("”</i> Your master turns to you with a grin and nods her head, <i>“Yes, I think the track sounds like a wonderful idea.”</i> Cupping your cheeks rather suddenly, she pulls you in for a quick kiss on your forehead, <i>“Good thinking, [pc.boyGirl]. Now, if you’ll just wait here a moment I’ll go get myself ready.”</i>");

	output("\n\nWith that, Belle turns on a heel and walks away, entering another room and leaving you alone to wait for you. It’s not a long wait, thankfully, because soon your master is back again, and with a new outfit: in place of her usual lab coat and fatigues is a short, sheer-fitting black dress and modest, well-polished jewelry. It hugs at all her curves nicely, not too tightly, but enough to accentuate her frame and highlight her bulge quite well.");

	output("\n\nYou manage to keep yourself from drooling at the sight of Belle as she walks back towards you, giving you quite the smirk.");

	output("\n\n<i>“How do I look, [pc.boyGirl]?”</i> she asks, giving herself a little spin so you can see <i>everything</i>, <i>“Think I’m ready for our date?”</i>");

	output("\n\nYou nod eagerly; your master’s a beautiful woman if you’ve ever seen one.");

	//wearingSubTuner:
	if(wearingSubTuner()) output("\n\nShe smiles in response, then lifts the leash she’s been holding to your neck and attaches it to your collar, but she doesn’t turn it on, leaving you a little confused.");
	//Else:
	else output("\n\nShe smiles in response, then lifts the leash she’s been holding to your neck, and you quickly realize she’s planning on tethering you, but you don’t have your collar on! So, you reach into your bags as quickly as you can, pulling out the Sub-Tuner, fumbling with it for a moment, then handing it to Belle. She grins and takes it, unlocking the neckwear and bringing it around your neck before snapping the buckle shut. All the lady scientist has to do then is attach her leash, but she doesn’t turn your collar on, leaving you a little confused.");

	output("\n\nGrabbing at your collar, you give the lady scientist a curious look, and she chuckles in response, <i>“We won’t be needing that on today, [pc.boyGirl]. Today... it’s just a master and her pet, having a nice time together, no experiments.”</i>");

	output("\n\n<i>That does sound nice, and it’s not like you need the Sub-Tuner to be Belle’s perfect puppy. No, you’ll have a great time without it.</i>");
	output("\n\n<i>“Now come on, [pc.boyGirl],”</i> she commands, wrapping your leash around her hand and walking towards the door, <i>“Let’s get to the track, hmm?”</i>");
	processTime(10);
	clearMenu();
	//[Next] //Should equip the Sub-Tuner.//
	equipTheSubTuner();
	addButton(0,"Next",raceTrackDateEvent2);
}

public function raceTrackDateEvent2():void
{
	clearOutput();
	showBelle(true);
	author("HugsAlright");
	moveTo("UVI STADINT");
	
	var ppBelle:PregnancyPlaceholder = getBellePregContainer();
	var x:int = -1;
	if(pc.hasVagina())
	{
		x = pc.cuntThatFits(ppBelle.cockVolume(0));
		if(x < 0) x = rand(pc.totalVaginas());
	}
	output("Belle leads you through the wabeship that is Uveto station with a firm grip on your leash, making sure she’s always got an eye on you like the good master she is. With her in command, it’s not long before you’re on the surface and making your way to U7. It’s a brief walk through the cold open air of this frozen moon before you’re through one of the dozen entrances to the racetrack and artificial heating is warming your [pc.skinFurScales].");

	output("\n\nOnce you’re both inside, Belle takes a quick look around through the crowd moving in and out of the stadium before moving towards a nearby cashier’s desk, and taking you with her. As you walk up to the counter, your master catches the attention of a well-dressed leithan man, who brings himself around the desk to greet you.");
	output("\n\n<i>“Ah! Hello, Doctor Baslocvicz,”</i> he calls out before noticing you attached to Belle at the leash, <i>“Are you and your friend here looking for anything today?”</i>");
	output("\n\n<i>“Yes, actually,”</i> the lady scientist says in response, <i>“I think I’d like to use my booth today, but I have some special instruction.”</i> With that she beckons the leithan man closer by waving her hand, and keeping her eyes fixed on you, the human woman whispers something in one of his more elfen ears before pulling back.");
	output("\n\n<i>“Of course!”</i> the man exclaims, turning around to wave a nearby employee of the racetrack over, <i>“Anything for the daughter of one of our valued investors. I’ll have someone on it right away and it should be done before you get to your booth.”</i>");
	output("\n\n<i>“Excellent,”</i> Belle says, turning towards you again, <i>“Come along then, [pc.name], we’re going to have a good time today, you and I.”</i>");
	output("\n\nThe lady scientist begins to walk away, and you follow her closely through the crowds until you reach a pair of sliding doors with a small control panel next to it. After Belle presses a few buttons on the control panel, the entry swishes open to reveal the inside of an elevator, and she quickly leads you inside.");
	output("\n\nIt’s a short ride in the lift until you reach your destination about five levels up, and the doors open again to reveal a rather empty, carpeted, curving hallway, which your master quickly steps out into. You’re lead silently through the corridor until you both come upon a lacquered, wooden door, covered in ornamental carvings.");
	output("\n\n<i>“Here we are,”</i> Belle chimes, reaching for the brass knob of the lumber portal and turning it. The door opens to reveal a nice, spacious balcony overlooking the entire stadium as the woman leads you inside and closes the entrance behind you.");
	output("\n\nYou scan the room around you, noting the rug beneath you, the small table with an ice bucket and bottle of champagne atop it, and the single, leather-bound chair. What really catches your eye, though, is the view; you can see the whole stadium from up here! Walking up to it, you place your hands on the railing and look out over the racetrack.");
	output("\n\n<i>“Quite the view isn’t it?”</i> asks Belle, sitting down in the leather seat behind you.");
	output("\n\nYou turn back around and nod at the woman, smiling as you do so.");
	output("\n\n<i>“Well, [pc.boyGirl],”</i> she coos, reaching for the edge of her dress, <i>“The races are going to be starting soon... why don’t you take a seat?”</i> With a sly smile the lady scientist pulls up on her skirt to reveal her two stiffening, knotted human cock, taking hold of her upper tool and stroking it.");
	output("\n\nWell, now you know why there’s only one chair up here. You lick your lips at the sight of your master’s package, and you definitely wouldn’t mind taking a seat on them.");

	//notNude:
	if(!pc.isCrotchExposed() && !pc.isChestExposed()) 
	{
		output("\n\nStill clothed, you slowly strip yourself of your offending garb before your master, blushing quite a bit");
		if(pc.exhibitionism() >= 66) output(" and enjoying a slight rush at the thought that anyone in the stadium could be watching you right now");
		output(". Your undressing has Belle sighing with bliss, the gentle pumping of her shaft seeming to speed up. Already");
	}
	else output("\n\nOnce you’re");
 	output(" good and bare, you stride your way over to the lady holding your leash, leather tether slacking as you near her, and her grin growing ever more lustful until you’re right in front of her.");
 	output("\n\n<i>“Now turn around, [pc.boyGirl],”</i> she commands, twirling a finger in the air, letting her erect cock fall free of her hand.");
 	output("\n\nYou do as she says and spin on a heel, turning your back, and your [pc.ass], to Belle, right before you feel a hand grope at your ass.");
 	output("\n\n<i>“Mmm,”</i> the human woman coos, spreading your lower cheeks and giving them a firm spank, hard enough to make you gasp, <i>“Now, sit.”</i>");
 	output("\n\nEven without your collar being turned on, you feel compelled to do what your master says and slowly start to lower yourself onto her lap. One of her hands still toys with your ass while another grabs at your hip to steady your descent until you feel ");
 	if(x >= 0) output("her twin cockheads");
 	else output("one of her twin cockheads");
 	output(" press against ");
 	if(x >= 0) output("both of ");
 	output("your eager ");
 	if(x >= 0) output("holes");
 	else output("asshole");
 	output(". You whimper slightly when your master forces you down harder, putting pressure on your [pc.asshole]");
 	if(x >= 0) output(" and pussy alike");
 	else output(", while her upper dong falls perfectly into the crack of your ass");
 	output(".");
 	if(x >= 0) output(" Her glans easily spread your needy nether lips, and with");
 	else output(" With");
 	output(" a little relaxing on your end, your [pc.asshole] is penetrated, leaving you to shiver with pleasure.");

 	//Stretch goez here
 	if(x >= 0) pc.cuntChange(x,ppBelle.cockVolume(0));
 	pc.buttChange(ppBelle.cockVolume(0));

 	output("\n\nBelle doesn’t let up and pulls you down onto her double dongs, and all you can do is moan as hot Terran cock stretches you wide and caresses your inner walls. The stillness you’re left with when the herm woman’s knot" + (x < 0 ? "" : "s") + " meet your sodden entrance" + (x < 0 ? "" : "s") + " is almost unbearable. You want her to fuck you so bad! Instead though, your master tugs your leash, and you fall backwards onto her soft, dress-filling breasts, panting.");
 	output("\n\nYou wiggler and squirm in your place, but Belle keeps you still, leaning forward to whisper in your ear. <i>“Just calm down, [pc.boyGirl],”</i> she breathes, sending a shiver down your spine, <i>“The race is about to start.”</i>");
 	output("\n\nSure enough, after she says that the buzzer sounds and the racers are off, tauric peoples pouring out from their gates and kicking up dirt.");
 	output("\n\n<i>“Look at the jockeys,”</i> Belle whispers again, taking a hand and pointing to the track.");
 	output("\n\nYou do as she says and turn your gaze to the bipedal races riding underneath their racers. They’re all naked, and almost all of them seem to be enjoying themselves, looking rather blissed-out.");

 	output("\n\nAs you’re watching the contestants round the first turn, your master trails a hand up your waist and breathes against your [pc.ear], <i>“I’d like to see you out there like that one of these days... it’s just so enticing to watch.”</i> With that, Belle starts to slowly rock her hips, dragging hard Terran rod against your sensitive flesh and drawing a chorus of lewd groans from your lips. <i>“You know,”</i> she says with another wiggle of her sides, <i>“I bet there’s plenty of people in this stadium doing exactly what we’re doing right now. This sport is just so easy to get off to, isn’t it, [pc.boyGirl]?”</i>");

 	output("\n\nThe doctor accentuates that last word with a quick thrust of her hips, driving her ");
 	if(x >= 0) output("twin");
 	else output("thick");
 	output(" dick");
 	if(x >= 0) output("s");
 	output(" into you and ripping a moan from your lungs. She doesn’t stop there, though, she keeps going, faster and faster, fucking");
 	if(x >= 0) output(" both of your");
 	else output(" your needy");
 	output(" hole");
 	if(x >= 0) output("s");
 	output(" while you cry out with pleasure atop her. You can feel her knot");
 	if(x >= 0) output("s");
 	output(" stretching you wider the closer the racers get to the finish line, driving you to your climax until you can barely keep yourself from cumming.");

 	output("\n\nThen, just as contestants and jockeys cross that checkered line, Belle gives you what you want and thrusts her bitch-breakers into you. ");
 	if(x >= 0) output("They");
 	else output("It");
 	output(" stretch");
 	if(x < 0) output("es");
 	output(" your ");
 	if(x >= 0) output("[pc.vagina " + x + "] and ");
 	output("pucker as wide as ");
 	if(x >= 0) output("they’ll");
 	else output("it will");
 	output(" go until they finally pop in with a moan and a contented sigh from your master, your sensitive inner walls hugging at her knot");
 	if(x >= 0) output("s");
 	output(".");

 	output("\n\nIt was hard to stop your orgasm before, and there’s no way you could now. Your ");
 	if(x >= 0) output("pussy and ");
 	output("ass spasm");
 	if(x < 0) output("s");
 	output(" around your master’s cock");
 	if(x >= 0) output("s");
 	output(" as bliss shoots through your body like electricity, causing you to tense up and quake with orgasmic pleasure.");
 	if(x >= 0 && pc.isSquirter(x)) output(" Your [pc.vagina " + x + "] clamps down around Belle’s lower shaft, squirting [pc.girlcum] all over her lap.");
 	//hasCock:
 	if(pc.hasCock())
 	{
 		output(" Convulsing wildly, your [pc.cocks] empt");
 		if(pc.cockTotal() == 1) output("ies itself");
 		else output("y themselves");
 		output(" onto your thighs, coating them with [pc.cum] while your hips buck into the air.");
 	}

 	output("\n\nJust as your peak seems to be coming down, your master’s begins. She holds you down tightly on her big, girthy member");
 	if(x >= 0) output("s, as they spasm");
 	else output(", as it spasms");
 	output(" inside you.");
 	if(x >= 0) output(" Hot Terran cum floods your womb and bowels alike, filling you with warmth and making you whimper, and it’s all enough to swell your [pc.belly] until you’re round and full of seed.");
 	else output(" Hot Terran cum floods your depths, filling you with warmth and making your [pc.belly] swell while Belle’s upper dong coats your back, and its owner, with delicious alabaster seed.");

 	output("\n\nWhile you’re reeling with the afterglow of your orgasm, Belle barely seems phased by her climax, opting to whisper in your ear again, <i>“I think you better rest up, [pc.boyGirl]. We’re going to watch a lot more races before we’re done here.”</i> You can almost see the Terran smirk over your shoulder.");

 	output("\n\nHer words make you shiver with post-orgasmic bliss, and have you falling back into your master’s arms as they wrap around you, holding you close while you rest. It’s already seeming like the racetrack was a good choice for your date.");

 	processTime(30);

 	if(x >= 0) pc.loadInCunt(ppBelle,x)
 	pc.loadInAss(ppBelle);
 	clearMenu();
 	addButton(0,"Next",postGasmDayAtTheRaces);
}

public function postGasmDayAtTheRaces():void
{
	clearOutput();
	showBelle(true);
	author("HugsAlright");
	output("Throughout the day, Belle fucks you and knots you again and again, keeping you in a constant cycle of pleasure, orgasm, and respite, letting you rest between races before starting the whole rotation again.");
	output("\n\nUnfortunately though, it seems your wonderful date is to come to an end as the last race of the day finishes.");
	output("\n\n<i>“Looks like we have to get going, [pc.boyGirl],”</i> your master breathes, running a hand through your [pc.hair] and waking you from your post-coital nap, <i>“Alright, [pc.name], up-up.”</i>");
	output("\n\nYou barely have time to wipe the sleep from your eyes before you feel hands grabbing at your sides and lifting you up. Doing your best to help Belle, you pull yourself off her softened knot" + (!pc.hasVagina() ? "" : "s") + ", nigh a day’s worth of cum spilling out from your ");
	if(pc.hasVagina()) output("holes");
	else output("[pc.asshole]");
	output(", your pregnant looking tummy still full of the gooey white stuff.");

	output("\n\nOnce you’re free of her breeder’s knob" + (!pc.hasVagina() ? "" : "s") + " and standing again, you give your limbs a good stretch");
	if(!pc.isChestExposed() && !pc.isCrotchExposed()) output(" and gather your stuff");
	output(" before turning to your lovely lady scientist again.");

	output("\n\n<i>“I guess we should be off,”</i> she says, finishing pulling her dress back over her cum-slicked cocks and taking hold of your leash again, <i>“Ready to head back to the lab.”</i>");

	output("\n\nYou really wish you didn’t have to, but you nod in response and get ready to make your way back to Accu-Pitch with Belle.");

	processTime(8*60);
	var ppBelle:PregnancyPlaceholder = getBellePregContainer();
	for(var x:int = 0; x < pc.totalVaginas(); x++)
	{
		pc.loadInCunt(ppBelle,x);
		pc.loadInCunt(ppBelle,x);
	}
	for(x = 0; x < 7; x++)
	{
		pc.orgasm();
		pc.loadInAss(ppBelle);
	}
	//[Next] //Should return the PC outside (inside?) the lab tile.
	clearMenu();
	addButton(0,"Next",move,"SUBSHIT");
}

//Peer Review
//[Party]
public function peerReviewParty():void
{
	clearOutput();
	showBelle();
	flags["SUBTUNER_PARTY_TIMER"] = GetGameTimestamp();
	author("HugsAlright");
	output("Belle paces back and forth for a moment before fixing her attention on you again, <i>“I’m actually glad you’re here, [pc.boyGirl]. I was afraid I was going to have to reach you over the extranet.”</i>");

	//wearingSubTuner:
	if(wearingSubTuner()) output("\n\nThe lady scientist quickly reaches into her pockets to procure a leash before clipping the tether onto your collar, just moments before she flips the Sub-Tuner on.");
	else 
	{
		output("\n\nThe lady scientist quickly reaches into her pockets to procure a leash before asking you <i>“Do you have the collar, [pc.boyGirl]?”</i> leading you to fumble around with things for a moment before pulling the Sub-Tuner from your pack and handing it to your master.");

		output("\n\nBelle smiles and thanks you, taking the ring of ");
		if(subTunerUpgraded()) output("metal");
		else output("leather");
		output(" from you and wrapping it around you neck, buckle snapping shut. Then she reaches for the single switch on the collar, and flips it on.");
	}
	//equip subtunah
	equipTheSubTuner();
	output("\n\nAlmost immediately submissive thoughts begin to fill your head, almost bringing you to your knees. <i>Void, you need orders, to be put in your place!</i>");

	output("\n\nLuckily for you, Belle is an attentive master, and is already giving you what you want. <i>“Down, [pc.boyGirl],”</i> she says, her voice gentle but commanding.");

	output("\n\nYou do as she says and quickly drop to your knees in front of her, prompting a smile from the Terran woman.");

	output("\n\n<i>“You see,”</i> she explains, pacing back and forth again, <i>“After so many success with your experiments involving the Sub-Tuner, I’ve organized a bit of a ‘peer-review’ with some of my colleagues. Well, it’s honestly more of a party than anything, because I’ve invited some friends with... similar interests. I’ve already got all the drinks, hors d’oeuvres, and fittings all set, but needless to say, I need you to be there for it. How does that sound?”</i>");

	output("\n\n<i>A party?! With your master?!</i> You’d never say no to an opportunity like that! All you can do is look up at Belle and nod eagerly.");
	output("\n\n<i>“Good,”</i> she coos happily, returning your nod with a smile, <i>“Now, I have to go get ready for this little get-together. You just wait here, [pc.boyGirl].”</i> Then, like that, the Terran drops your leash and starts to walk towards the other room, leaving you painfully alone to wait for her return.");
	output("\n\nIt’s not a long wait, thankfully, because soon your master is back again, and with a new outfit: in place of her usual lab coat and fatigues is a short, sheer-fitting black dress and modest, well-polished jewelry. It hugs at all her curves nicely, not too tightly, but enough to accentuate her frame and highlight her bulge quite well.");
	output("\n\nYou manage to keep yourself from drooling at the sight of Belle as she walks back towards you, giving you quite the smirk.");

	output("\n\n<i>“Now let’s get you ready, [pc.boyGirl],”</i> she says, walking to a nearby closet before opening it and taking something shiny and black off a holo-hanger, <i>“Here we go.”</i> With some sort of outfit in hand, the lady scientist makes her way back to you, and kneels down in front of you. ");
	if(!pc.isChestExposed() && !pc.isCrotchExposed()) output("Belle scans your still clothed frame for a moment before giving you an order of <i>“Arms up”</i> that you quickly obey. Once you’re in the position she needs you in, the herm woman takes her time stripping you of your [pc.gear] until you’re good and bare, then replaces your nudity with a slick, black, Accu-Pitch logo-bearing catsuit.");
	else output("Already good and bare, Belle scans your frame for a moment before replacing your nudity with a slick, black, Accu-Pitch logo-bearing catsuit.");
	output(" The steel zipper of the tight-fitting jumpsuit slowly travels up your body as your master handles it, gradually covering all your naked flesh. Though, it’s definitely not the most modest attire, serving to highlight all your curves and shapeliness");
	if(pc.hasCock()) output("... and your bulge");
	output(".");

	output("\n\n<i>“There we go,”</i> Belle chimes as she goes to stand up again, taking hold of your leash once more, <i>“Now we just have to wait for the guests to arrive...”</i>");

	processTime(25);
	clearMenu();
	addButton(0,"Next",peerReviewParty2);
}

public function peerReviewParty2():void
{
	clearOutput();
	showBelle();
	author("HugsAlright");
	output("Sure enough, the guests come: a lot of well-dressed scientists and investors, as well as those friends with “similar interests” Belle was speaking of, people with their own pets on leashes moving around the party. There’s not many people, a small get-together if you’ve ever seen one, groups of three or four people talking over glasses of wine that you and your master drift between. Yes, you stay close to the lovely lady holding your leash the whole time as she leads you to different guests. The more scientifically-minded seem to simply inspect your appearance, analyzing the collar around your neck while Belle demonstrates some simple commands for you to follow with her colleagues. The more deviant minded, on the other hand, seem to be more interested in your simple ability to follow your master’s orders... and that tight, tight attire of yours. A few try to get a bit grabby with you, but Belle keeps them at bay.");
	output("\n\nEventually, you come across another fellow scientist who seems to be of <i>both</i> minds. She gives your master a hearty greeting as she walks over to the both of you. <i>“Doctor Baslocvicz!”</i> she calls, out getting close enough that you can get a good look at her, <i>“I’m surprised I haven’t bumped into the heart of the party yet.”</i>");
	output("\n\nThe woman appear to be a rahn, a bright blue one at that. She’s quite a bit shorter than Belle, her gel molded into cyan hair and looking at her with similarly colored eyes.");
	output("\n\n<i>“Doctor Lara, good to see you again,”</i> your master says, extending an arm for Lara to shake at.");
	output("\n\nThe gel-woman takes hold of her hand and shakes it, turning her gaze to look at you, <i>“And this is the ‘Sub-Tuner’ I’m here about?”</i> Before getting an answer, the rahn takes a knee in front of you cocking her head and looking right into your eyes.");
	output("\n\n<i>“It most certainly is,”</i> Belle responds, keeping a close eye on Doctor Lara lest she do anything shifty.");
	output("\n\n<i>“You don’t mind if I examine your pet here quickly, do you?”</i> the bright-blue lady asks, not taking her gaze off you.");
	output("\n\nThe Terran woman holding your leash smirks down at her, <i>“Go ahead.”</i>");

	output("\n\nWith an exclamation of <i>“Great!”</i> Lara’s inspection begins, and her hands are grabbing all over you face, holding your eyelids open so she can examine your eyes, pulling back your lips to look at your gums and teeth, and having you lift your arms and carefully examining how much they move. The whole process is fairly uncomfortable, and you give Belle a slightly worried look. She only gives you a nod in return, <i>but that small movement is enough to put your mind at ease</i>.");

	output("\n\nEventually, the rahn finishes her examination and stands herself up again. <i>“Well, I have to say, I looked over all the schematics for this collar of yours and I’m actually surprised!”</i> she says, placing her hands on her hips, <i>“No pupil dilation, no gum bleeding, no shakes. One-hundred percent reliable, drug-free hypnotic suggestion! Amazing!”</i>");

	output("\n\nHer fellow scientist smiles complacently, <i>“I’m glad you’re impressed, Lara. This project has been a long way coming, and I couldn’t have done it without my wonderful test subject here.”</i>");

	output("\n\nOnce again, the rahn turns her gaze on you, and places a hand on your head. <i>“You wouldn’t mind if I test [pc.himHer] out myself, would you?”</i> she asks playfully.");

	output("\n\nIt doesn’t even take a single second for Belle to formulate her response, <i>“I’m afraid I </i>do<i> mind.”</i>");

	output("\n\n<i>“Aww,”</i> Lara whines, taking her hand off you, <i>“You always were such a grouch when it came to your pets, glad to see that hasn’t changed.”</i> The blue woman gives her colleague a smile, <i>“Well, nice seeing this little project in action, guess I’ll go mingle some more!”</i>");

	output("\n\nWith that, she’s gone, leaving you and Belle relatively alone in the middle of the room. A moment later you feel ");
	if(ausarKaithrit()) output("fingers scritching between your ears");
	else output("a hand patting your head");
	output(" accompanied by Belle’s voice.");

	output("\n\n<i>“Good job with that, [pc.boyGirl],”</i> she coos, giving you one last good ");
	if(ausarKaithrit()) output("pet");
	else output("pat");
	output(" before pulling her arm back, <i>“But this party’s getting a little boring, don’t you think? Why don’t we go have some real fun?”</i>");

	output("\n\n<i>Knowing her, there’s only one thing she could mean, and it’s the only thing you could want.</i> You look up at your master and nod eagerly, already expecting to be happy with whatever it is she wants to do.");

	output("\n\n<i>“Alright then, [pc.boyGirl],”</i> Belle says with a smirk, <i>“Let’s go find somewhere comfortable to sit then, hmm?”</i>");

	processTime(30);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",peerReviewParty3);
}

public function peerReviewParty3():void
{
	clearOutput();
	showBelle(true);
	author("HugsAlright");
	output("It doesn’t take long for Belle to find a nice, comfy looking chair on the opposite end of the room, and she quickly lead you over to it. She gives you a command of, <i>“Stay,”</i> as you reach the seat, and, <i>like the good puppy you are</i>, you wait there on your knees while your master sits down.");

	output("\n\nOnce she’s gotten herself settled, the lady scientist seems to forget you’re at a party and lifts her dress up and spreads her legs, allowing her two stiffening cocks and hefty balls to flop free. Your eyes go wide at the sight of Belle’s package, a wonderful musk already filling your nostrils and clouding your senses. It’s hard to resist throwing yourself onto her dicks right then and there, <i>but you wait for your orders because you’re a good puppy</i>.");

	output("\n\nYour good behavior doesn’t go unnoticed, because your master is giving you a happy smirk and issuing her next command, <i>“Fetch.”</i>");

	output("\n\nIt’s barely a second before you’re on Belle, taking her lower cockhead into your mouth, slathering it with your tongue before you continue your way down her shaft. Your [pc.lips] caress her sensitive flesh all the way down while your tongue does the same to her undercarriage, all until you feel her glans press against the back of your throat. Your master coos and reaches a hand down to your head, her womanly digits running ");
	if(pc.hasHair()) output("through your [pc.hair]");
	else output("along your bare scalp");
	output(". Without any further motivation, you start to bob your head up and down, letting Belle revel in your oral pleasures with your tongue swirling all around her cock.");

	output("\n\nThough, the woman’s other tool seems quite neglected, rubbing against your cheek with its heat pouring off onto your [pc.skinFurScales]. So, you do the only thing a good pet could do and take the poor, needy shaft into the warm embrace of your hand, gently stroking it until its owner is on the verge of moaning.");

	//seraIsCrew:
	var seraJoin:Boolean = (seraIsCrew() && chars["SERA"].hasCock());
	if(seraJoin)
	{
		output("\n\nAs you’re getting into your blowjob, a familiar voice fills your ears, ");
		//firstTime:
		if(flags["SUBTUNER_PARTY_SUBSERAD"] == undefined) output("<i>“Wait, is that you, " + pc.mf("master","mistress") + "?!”</i>");
		else output("<i>“You again? Well isn’t this a treat.”</i>");

		output("\n\nYou do your best to look over your shoulder at the source of that question with a cock in your mouth, only to see Sera, your demon-morph sub, sending a shock of worry through your system.");
		output("\n\n<i>“Oh, hello, Sera,”</i> Belle chimes in, her hips gently rolling, <i>“");
		if(flags["SUBTUNER_PARTY_SUBSERAD"] == undefined) output("You... know my pet here?");
		else output("Nice to see you again.");
		output("”</i>");

		//firstTime:
		if(flags["SUBTUNER_PARTY_SUBSERAD"] == undefined) 
		{
			output("\n\n<i>“Know [pc.himHer]?!”</i> the demoness exclaims, placing her hands on her hips, <i>“I have to live with the runt!”</i>");
			output("\n\nYour master chuckles, <i>“Well I haven’t heard of that!”</i> Then she reaches down and cups your chin, getting your to look up at her, <i>“Is this true, [pc.boyGirl]?”</i>");
			output("\n\nAgain, doing the best you can with a thick, hard shaft in your mouth, you nod.");
			output("\n\n<i>“Well,”</i> Belle says, turning her gaze back to Sera, <i>“Small galaxy, hmm?”</i>");
		}
		output("\n\n<i>“Yeah...”</i> the ");
		if(chars["SERA"].skinTone != "bright pink") output("purple");
		else output("pink");
		output("-skinned woman trails off, her gaze seemingly fixed on your ass, all wrapped in that tight catsuit, <i>“Hey you think I could get a piece of that?”</i>");

		output("\n\nYour master grins almost deviously and looks down at you again, <i>“Seeing as you apparently know [pc.name] so well, I don’t see why not.”</i>");

		output("\n\nSera only licks her lips in response before she kneels down behind you, bending herself over you and reaching for the zipper of your jumpsuit. <i>“Alright, let’s get this shit off you,”</i> she grunts, pulling down until your clothing is completely open. You try to focus on your blowjob again, but find it hard to keep your cock-polishing steady with hands running all over your body. It doesn’t take long before Sera’s peeling away your catsuit, baring your flesh to the open air until she’s finished pulling the suit over your ass and is digging her fingers into your lower cheeks.");

		output("\n\n<i>“Oh yeah,”</i> the demon-morph breathes a moment before spreading your cheeks wide. Then, like you’d expect, something long and hard presses against your pucker. Sera’s nowhere near as gentle as Belle, and doesn’t even give you a moment to relax, thrusting into you, stretching you wide enough to make you whimper. She doesn’t stop there of course, and continues her interminable penetration, driving more and more big, ");
		if(chars["SERA"].skinTone != "bright pink") output("purple");
		else output("pink");
		output(" cock into your ass, rubbing it against your inner walls fast enough to make you moan. It isn’t long before she bottoms out inside you and sets to thrusting, not even giving you a moment to adjust to her length.");
		pc.buttChange(chars["SERA"].cockVolume(0));
	}
	if(seraJoin)
	{
		output("\n\nEven with Sera pounding your ass, you ");
	}
	else output("\n\nYou ");
	output(" quickly redouble your efforts on pleasuring Belle; you vigorously jerk the woman’s upper-cock off while you lovingly lavish her second dong, treating it with love and you lick at it and bob your head up and down. Before too long your master loses a bit of her composure and starts to thrust into your mouth and against your hand. Her wide hips pump wildly against your maw, and all that girth of hers hurts your jaw a little, <i>but you take it all happily, because it feels so good to please your master like this</i>. Eventually, you begin to pull yourself off her shaft to lick and kiss at her knot, catching your breath for a moment before continuing your blowjob.");

	//seraIsCrew:
	if(seraJoin) 
	{
		output("\n\nSera’s still thrusting away at your [pc.asshole], ");
		//hasSubmittedToSera: Fen note9999: Sera's content is fucknormous and I'd rather just not bother:
		//if(hasSubmittedToSera()) output("and something about submitting to her like this again, to have her on top, feels so <i>good</i>");
		//else 
		output("and something about her being on top feels so good");
		output(". Each time her hips connect against yours drives a whimper or a groan from your lungs. All this pressure on your pucker and all that feral grunting coming from the demoness are pulling you closer to climax, and you don’t think Sera’s feeling too different either.");
	}
	output("\n\nIt quickly gets to the point where you can no longer hold back the wave of endorphins battering your mind’s shore, and you do the only thing you can do: <i>cum</i>. You moan onto Belle’s twin dongs");
	if(seraIsCrew()) output(" as your [pc.asshole] spasms around Sera’s shaft");
	output(". Orgasmic bliss makes you quake in your place, ");
	if(pc.hasCock()) output("your [pc.cocks] emptying onto the ground below you, coating the floor with slick [pc.cumNoun]");
	else output("your [pc.vaginas] clamp down around a shaft that isn’t there, spraying the floor down with [pc.girlcum].");
	
	if(seraJoin)
	{
		output("\n\nYou clenching pucker seems to coax the demoness behind you into orgasm, because you feel her hips ram forward, burying her thick cock in your [pc.ass], spasming inside you. Her hips buck jerkily against your own as a sudden gush of hot alabaster seed fills your ass, leaving you to whimper.");

		output("\n\nAlmost in sync with Sera, Belle’s own orgasm begins");
	}
	else output("\n\nWith all the oral attention she’s receiving, it’s no surprise when Belle’s orgasm begins");
	output(". Her twin dicks spasm between your lips, knots inflating to the point where you can feel their heat against your face. Her balls empty down you throat, filling your stomach until your tummy starts to balloon with her seed. At the same time, her upper-cock contents itself with coating your face and [pc.hair] with a nice layer of warm Terran cum.");
	

	//SubSeraCrew:
	if(seraJoin)
	{
		output("\n\nWith everyone coming down from their peaks, moaning and pleasured tones give way to panting and deep breaths. Sera, not seeming to be in the mood for a cuddle, pulls her cock from your ass, leaving you to shudder and your [pc.asshole] with quite the spunk-filled gape. The demon-morph stands straight up after that like nothing even happened.");
		
		output("\n\n<i>“Fucking nice!”</i> she exclaims, still dripping cum onto the floor, <i>“Thanks for the freebie, Belle, guess I’ll catch you later.”</i>");
		output("\n\nWith a wave and a smile, she’s off again, back to mingle with the rest of the guests, leaving you and your master to each other.");
	}
	output("\n\nBelle takes a deep breath as you pull yourself off her softening, spit-slick shaft with a wet pop, licking excess jizz off your lips. The woman smiles down at you, cupping your chin to get a good look at your cum-covered face before she chuckles, <i>“That’s a good look for you, [pc.boyGirl].”</i> Then that same hand moves upward to give you a quick little pet, letting you know you did a good job taking care of your master. The lady scientist pulls her dress back down to cover herself, standing up out of her seat as she does so.");
	output("\n\nLooking around, it seems like almost no one really cared about you and Belle’s spontaneous lovemaking... maybe it’s a normal thing for these parties?");
	output("\n\n<i>“Alright, [pc.boyGirl],”</i> the Terran says, halting your train of thought, <i>“Let’s get back to the party, shall we?”</i>");
	output("\n\n<i>If it sounds like a plan to Belle, it sounds like a plan to you.</i>");

	processTime(30);
	var ppBelle:PregnancyPlaceholder = getBellePregContainer();
	pc.loadInMouth(ppBelle)
	pc.loadInMouth(ppBelle)
	if(seraJoin) pc.loadInAss(chars["SERA"]);
	pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",peerReviewParty4);
}

public function peerReviewParty4():void
{
	clearOutput();
	showBelle();
	author("HugsAlright");
	output("The party passes along like it did before, with you and Belle mingling with scientists and pet-play enthusiasts alike. As things go on, you spot a few other pets pleasuring their masters just like you did. Eventually, though, guests begin to leave, and the already-small gathering begins to die down until it’s just you and Belle alone, a happy pair if there ever was one.");
	output("\n\nOnce the last guest does leave, your master takes a deep breath and turns to you with a smile, <i>“Well, that went rather well, don’t you think?”</i>");
	output("\n\n<i>That was a fun party for sure!</i> So, you look up at the woman with a grin matching hers and nod.");
	output("\n\n<i>“No doubt it went as good as it did thanks to you, [pc.boyGirl],”</i> she coos, kneeling down beside you and unbuckling her leash, <i>“And with any luck, we’ll have made a few friends and secured a few research grants.”</i> Then she reaches for the switch on your collar, and turns it off.");
	output("\n\nYour pet-like feelings don’t so much as fade, though. In fact, you find yourself wishing you were still on your master’s leash, being loved and taken care of. A pang of sadness fills your heart, but luckily you don’t endure that for long, because Belle gingerly cups your cheek, and gives you a kiss, holding her lips to yours for a moment that doesn’t last nearly long enough before she pulls back.");
	output("\n\n<i>“Well, [pc.boyGirl],”</i> she sighs, stroking your [pc.skinFurScales] with a thumb, <i>“I guess it’s about time you ");
	//notNude:
	if(!pc.isChestExposed() && !pc.isCrotchExposed() && !pc.isAssExposed()) output("got dressed and ");
	output("left. I’ve probably kept you here longer than I should have already. Oh, and don’t worry about the party. I think");
	if(flags["MET_SAEC"] == undefined) output(" Saec and I will");
	else output(" I’ll");
	output(" clean up just fine.”</i>");

	output("\n\nAs much as you don’t want to leave... you still have a fortune to chase.");

	processTime(20);
	//[Next] //Should return the PC outside the lab and equip the Sub-Tuner.
	clearMenu();
	addButton(0,"Next",leaveAccuPitchLabs);
}


//Timed Blurbs
//These blurbs can occur once a day (probably less) if the PC is wearing the Sub-Tuner (no particular order).
//Once every five days.

public function processSubTunerShit():void
{
	if(wearingSubTuner())
	{
		if(flags["SUBTUNER_TIMED_PROCS"] == undefined) flags["SUBTUNER_TIMED_PROCS"] = GetGameTimestamp();
		else if(flags["SUBTUNER_TIMED_PROCS"] + 60*24*5 < GetGameTimestamp() && rand(1) == 0) randomSubTunerShit();
	}
}

public function randomSubTunerShit():void
{
	flags["SUBTUNER_TIMED_PROCS"] = GetGameTimestamp();
	var buffer:String = "";
	//1:
	if(rand(4) == 0) 
	{
		buffer += "You’re suddenly stricken by thoughts of Belle as you go about your day, feeling a sudden need to have her hands all over your body, making you hers.\n\nAfter daydreaming for a few more moments, you pull yourself from your dirty thoughts only to be stricken by powerful lust.\n\n... This collar is off, right?";
		pc.lust(10);
	}
	//2:
	else if(rand(3) == 0)
	{

		buffer += "As you’re going about your day, you find yourself tugging at your collar, or wanting it to be tugged on, more precisely. You can’t help but imagine a leash attached to the ring of ";
		//upgradedSubTuner:
		if(subTunerUpgraded()) buffer += "metal";
		else buffer += "leather";
		buffer += " around your neck, being held by a big, strong master to gently guide you.";
		buffer += "\n\n...Maybe you could pay Belle a visit soon.";
	}
	//3:
	else if(rand(2) == 0)
	{
		buffer += "You go rigid for a moment as you’re walking as a shock of need and heat hits your loins before quickly fading, leaving you panting.";
		buffer += "\n\nAfter trying to figure out what happened, you tug at the collar around your neck and remember the special function Belle gave it and wonder if the thing is actually off or not.";
		pc.lust(10);
	}
	//4 (Requires the PC to have fucked Saec):
	else
	{
		buffer += "As you’re walking, you find your thoughts drifting to Saec, that lovely blonde pup of Belle’s, her soft fur, her warm smile, her womanly figure, and her big, squeezable breasts. You smile at the picture of the ausar, and ponder if the big blonde puppy could use a playmate in the near future.";
	}
	if(buffer != "") AddLogEvent(buffer);
}


//Dream
//This dream can proc if the PC goes to sleep wearing the Sub-Tuner & Met Saec
public function subTunahDream():void
{
	clearOutput();
	author("HugsAlright");
	showBelle(true);
	output("You awake to the gentle moaning of pleasure and the sound of skin slapping against skin. Confused you move your tired limbs around, turning your neck until you feel the collar around it... and it’s humming.");
	output("\n\nWait, is your collar on!? You can’t really find yourself caring though, <i>because all you can feel is an overwhelming need for your master</i>, but where is she?");
	output("\n\nYou hastily look around, only to be greeted by the source of that gentle moaning on the other side of the bed: ");
	//annoBedPartner:
	if(flags["CREWMEMBER_SLEEP_WITH"] == "ANNO") output("it’s Anno, with both her pussy and asshole stretching around Belle’s twin cocks, slowly fucking the snowy pup as she lies there in bliss. She’s wearing a collar that looks like yours, red light blinking.");
	else output("it’s Saec, with both her pussy and asshole stretching around Belle’s twin cocks, slowly fucking the ausar as she lies there in bliss. She’s wearing her collar as usual, though it appears to be turned off.");

	output("\n\nYou tongue nearly lolls from your mouth at the sight of your master going at ");
	if(flags["CREWMEMBER_SLEEP_WITH"] == "ANNO") output("your lover");
	else output("the blonde pup");
	output(" like that. <i>Though, you can’t help but feel the need to have her inside you like that.</i>");

	output("\n\nNot too long after you see things getting started, they already seem to be coming to a close. While the speed of her gentle thrusting remains the same, Belle’s voice, along with the voice of the ausar under her reaches a fever pitch of moaning and gasping. Before you know it the lady scientist slams her cocks to the edge of her knots deep inside ");
	if(flags["CREWMEMBER_SLEEP_WITH"] == "ANNO") output("Anno");
	else output("Saec");
	output(". You watch your master’s hips buck jerkily against into her pet, seeing the ausar girl’s belly distend and hearing her cry out as Belle pumps her full of cum.");

	output("\n\nAfter she rides out the bliss of her orgasm, the Terran woman pulls her softening shafts out of ");
	if(flags["CREWMEMBER_SLEEP_WITH"] == "ANNO") output("Anno");
	else output("Saec");
	output(" with little more than a whimper from the canine girl, leaving alabaster seed to dribble out onto the sheets. As the ");
	if(flags["CREWMEMBER_SLEEP_WITH"] == "ANNO") output("snowy");
	else output("blonde");
	output(" pup’s chest heaves, Belle suddenly turns to look at you, sending a little tingle down your spine.");

	output("\n\n<i>“Don’t worry, [pc.boyGirl],”</i> she says, her voice as gentle and poised as ever, music to your ears, <i>“I haven’t forgotten about you.”</i>");

	output("\n\nWith that, she smiles at you and makes her way over to your side of the bed, <i>and all you can feel is the need to spread your [pc.legs] for her as she approaches</i>. You follow your instincts and open your legs wide for Belle, and she quickly kneels down between them.");
	output("\n\n<i>Yes! Yes! Your master’s going to give you the best treat in the world!</i>");
	output("\n\nBelle straddles you on all fours, leaving her jugs jiggling above you and her face inches from yours. The woman quickly darts down and traps you in a kiss, pressing her plump lips to yours for a short moment. <i>It feels like the touch of her lips alone is enough to make you cum!</i> Before you can get too excited, Belle pulls back from the kiss and goes to line her twin cocks up with ");
	if(pc.hasVagina()) output("both of your eager holes");
	else 
	{
		output("your [pc.asshole], with her upper cock left grinding against your ");
		if(pc.hasCock()) output("[pc.cocks]");
		else output("bare crotch");
	}
	output(".");

	output("\n\n<i>She’s already hard again!</i>");
	output("\n\nYou gasp as Belle pushes her hips forward, putting pressure on your supple holes");
	if(pc.hasVagina()) output("s");
	output(" until...");
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",subTunahDream2);
}

public function subTunahDream2():void
{
	clearOutput();
	author("HugsAlright");
	showName("JUST\nA DREAM...");
	output("You wake up with a gasp, only able to feel an aching need in your loins as you realize your lovely bed-time visit from your master was only a dream. A very tangible sense of disappointment floods your body at that realization, ");
	//annoBedPartner:
	if(flags["CREWMEMBER_SLEEP_WITH"] == "ANNO") output(" looking over to see Anno still asleep");
	output(", a need for release burning inside you.");

	output("\n\nYou pick yourself up from bed and go to get ready, hoping to wash away your lust with a shower, or maybe a lover... <i>actually, maybe you could take a trip to Uveto and visit Belle.</i>");

	//[Next] //Should leave the PC at max lust.
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Taur Race Stadium
//This will be a new area on Uveto, pretty close to the town.
//Tile Text
public function taurStadiumInterior():Boolean
{
	author("HugsAlright");
	output("[pc.Moving] inside, you’re greeted by the warmth of artificial heating and the gentle rumbling of crowds moving in and out of the arena. Looking around, you can see stairwells leading to what must be the stands, snack stands, money-changers, floor-men, and cashiers, all ready to take your money. The whole arena is painted a deep-blue with highlights of white and icy mints; holo-signs and brightly-colored advertisements line the walls. It seems a testament to the power of the galaxy’s corporations that a place like this can exist on a small, frozen moon in the middle of nowhere.");
	output("\n\nThere’s a girl with brightly-colored, scaled skin who appears to be a cashier with an empty line in front of her. Seems like she’d be your in if you want to get in on some of the races here.");
	
	removeUvetoCold();
	
	addButton(0, "Cashier", taurStadiumCashier);
	
	if (roxyIsInStadium())
	{
		if (flags["ROXY_MET"] >= 1)
		{
			output("\n\nThe sporty laquine Roxy is relaxing alone on her usual bench. She's watching the crowd lazily, only being snapped out of her rest by the occasional fan.");
			addButton(1, "Roxy", roxyGreet,undefined,"Roxy","Touch base with Roxy.");
		}
		else
		{
			output("\n\nThrough the hustle and bustle of fortunes won and lost, you spot a coffee-colored laquine girl chilling out on one of many benches. From the way her upright ears crane and the way her neck pivots, you'd say she's people-watching. Occasionally someone approaches her holding a pen and a piece of paper. You'd guess from the flair she applies in accepting and signing those slips - and other sporty objects - she must be an athlete. A successful one.");
			addButton(1, "Laquine", roxyGreet,undefined,"Laquine","Approach the spunky rabbit.");
		}
	}
	
	return false;
}

public function showTaurCashier():void
{
	showName("\nCASHIER");
	showBust("STADIUM_CASHIER");
}
//[Cashier]
public function taurStadiumCashier():void
{
	clearOutput();
	author("HugsAlright");
	showTaurCashier();
	//firstTime:
	if(flags["TAUR_STADIUMED"] == undefined)
	{
		output("You [pc.walk] your way up to the bright-green girl, taking note of the feathery appearance of her hair... along with what appears to be plates of bones or chitin on her face, closing around her eyes like a mask, and ending at her upper lip.");
		output("\n\n<i>“Oh, hello! Welcome to U7,”</i> she says with what sounds to be perfectly-practiced corporate jubilance, <i>“I don’t believe I’ve seen you here before, new to the track?”</i>");
		output("\n\nSeeing her talk, you notice some of those bony plates on her face <i>moving</i>, like mandibles, folding outward with each syllable until her mouth closes. You manage to tear yourself from the woman’s alien appearance and tell her that you haven’t been here before.");
		output("\n\n<i>“Well, if you have any questions then, or want to bet on any of our contestants, feel free to talk to me or any of the other cashiers!”</i> the alien girl responds, <i>“of course, we open our races to free viewings certain times of the day.”</i>");
		output("\n\nStill not to sure what U7 is about, you ask the cashier exactly <i>what</i> they race here.");
		output("\n\n<i>“Oh, we race people,”</i> she answers with a smile on her face, or as much of a smile as her species’ faces can make.");
		if(pc.isBimbo()) output("\n\nAfter imagining ausar and humans on all-fours running through a racetrack, you give the cashier a confused look.");
		else output("\n\nYou cock an eyebrow.");
		output("\n\n<i>“Our more... tauric citizens,”</i> the woman explains, mandibles moving in and out as her reptilian eyes stay fixed on you, <i>“With RhenWorld around, leithans have become popular contestants in out races, for instance.”</i>");
		output("\n\nAfter giving her an understanding nod, the cashier offers her services to you again.");
		flags["TAUR_STADIUMED"] = 1;
	}
	//Else:
	else
	{
		output("You [pc.walk] your way up to the familiar, reptilian cashier nearby, her small green scales shimmering in the artificial light of the racetrack.");
		output("\n\n<i>“Ah, welcome back!”</i> the alien woman says with a click of her bony mandibles, <i>“Can I help you with anything today?”</i>");
	}
	//[WatchRace] Spend some time watching a race for free.
	//[BetRace] Bet on and watch a race here at U7.
	//[EnterRace?] Ask her if you can enter the races here. //Only accessible if the PC is a taur.
	processTime(2);
	clearMenu();
	addButton(0,"WatchRace",watchTaurRace,undefined,"WatchRace","Spend some time watching a race for free.");
	addButton(1,"BetRace",betRaceOnUveto,undefined,"BetRace","Bet on and watch a race here at U7.");
	if(pc.isTaur()) addButton(2,"EnterRace?",enterTheRace,undefined,"Enter Race?","Ask her if you can enter the races here.");
	addButton(14,"Leave",mainGameMenu);
}
	
//[WatchRace]
public function watchTaurRace():void
{
	clearOutput();
	author("HugsAlright");
	showTaurCashier();
	showName("RACE\nWATCHIN’");
	output("You tell the woman that you’ve come to spend some time watching some races and ask for directions.");
	output("\n\n<i>“Of course,”</i> she says with some sort of faux-smile, <i>“Just make your way up the stairs to our lower stadium seating.”</i>");
	if(pc.isAss()) output("\n\nWith a nod");
	else output("\n\nThanking the cashier");
	output(", you start to make your way towards the stairs she pointed out, ready to spend some time relaxing and watching a few races.");

	processTime(1);
	clearMenu();
	addButton(0,"Next",actuallyWatchTaurRace);
}

public function actuallyWatchTaurRace():void
{
	clearOutput();
	author("HugsAlright");
	showName("RACE\nWATCHIN’");
	if(flags["TAUR_STADIUM_WATCHED"] == undefined)
	{
		output("Entering the stadium, you come to the realization that this place is <b><i>huge</i></b>; miles of synthetic-earth in a pill-shape beneath you forms the track of the stadium, while the fully-enclosed ceiling stretches high and far above you.");
	}
	//Else:
	else output("Entering the stadium, you find yourself less surprised by the sheer size of the building, but still find it impressive by the standards of a small, frozen moon in terms of infrastructure.");

	output("\n\nYou walk your way through the rows and rows of chairs for quite some time, and after reaching a suitable seat ");
	if(pc.isTaur()) output("for your tauric body ");
	output("to watch the races from, you sit your [pc.ass] down and get yourself comfortable before the next race starts.");

	//firstTime:
	if(flags["TAUR_STADIUM_WATCHED"] == undefined)
	{
		output("\n\nCheering and clapping fills the air when the races begin, and you lean forward in your chair to get a better look at what’s going on. As you expected, a buzzer rings and you can already see tauric people charging out the gates: leithans mainly, with many a other species thrown in, even a few modded humans.");
		output("\n\nWhat you <i>didn’t</i> expect to see though is the racer’s jockeys, all of them are bipedal... and riding <i>under</i> their respective contestant. Even more interesting, though, is the fact that they’re all naked, riders and racers alike... and if you were to wager a guess ");
		if(silly) output("(since you aren’t even betting on this race) ");
		output("there’s definitely something going on between their bodies. Though you can’t really hear or see it, there’s probably a few taurs packing and well-sheathed inside their riders.");

		output("\n\nWhat ");
		if(pc.isBimbo()) output("a great sport!");
		else output("an odd sport.");
	}
	//Else:
	else
	{
		output("\n\nCheering and clapping fills the air when the races begin, and you lean forward in your chair to get a better look at what’s going on. Just like last time, the buzzer sounds and the tauric racers shoot from their gates like bullets, jockeys riding underneath. They maneuver the turns of the track like veterans of the track, and the riders beneath seem to be enjoying being along for the ride.");
	}

	output("\n\nOnce the contestants finish their loop around the track, the ruckus of the stadium quiets down, aside from a few unhappy cusses from those upset with the outcome of their bets.");
	output("\n\nWell, it looks like you could take your leave.");
	//Fen note: cut the "Watch More" option due to total pointlessness.
	//if you feel inclined to do so, or keep your spot and watch some more races to pass the time.");

	processTime(25);
	IncrementFlag("TAUR_STADIUM_WATCHED");
	clearMenu();
	//[WatchMore] //This option passes 3 hours each time it’s chosen.
	//[Finish] //Takes the PC back to the stadium tile.
	addButton(0,"Next",mainGameMenu);
}

/* DIS IS CUT
output("\n\n//Watch More");
output("\n\n[WatchMore]");

output("\n\nYou decide to sit down and enjoy a few more races, relaxing in the artificial warmth of the U7 Racetrack for about three hours.");

output("\n\n[WatchMore] //This option passes 3 hours each time it’s chosen.");
output("\n\n[Finish] //Takes the PC back to the stadium tile.");
output("\n\n//Finish");
output("\n\n[Finish]");

output("\n\nDeciding you’ve had your fill of taur’ racing for one day, you stand up and make your way back to the stadium entrance.");

output("\n\n[Next]");*/

//Bet Race
//[BetRace]
public function betRaceOnUveto():void
{
	clearOutput();
	showTaurCashier();
	author("HugsAlright");
	showName("\nBETTING");
	output("You ask the girl if there’s any races available that you could place a bet on, prompting a warm look from the alien cashier.");

	output("\n\n<i>“We certainly do!”</i> she exclaims, flipping on a holo-pad that’s imbedded into the counter in front of her, <i>“Here’s a list of our upcoming races! Once you feel like you’ve made a choice on your racer, just tell me and we can work out a credit transfer.”</i>");

	//Bimbo takes priority to low/high intelligence.
	//pcBimbo:
	if(pc.isBimbo()) output("\n\nLooking at the list of names on the holographic screen before you, you locate the racer with the cutest, prettiest name and pick them, a good a choice as any.");
	//HighInt:
	else if(pc.IQ() >= 70) output("\n\nYou scan the list of names and statistics before you, balancing out your best shot at winning a bet with some hefty mental-math.");
	//LowInt:
	else output("\n\nAfter the woman finishes speaking, you do your best to pick out a likely winner from the list of names before you.");

	output("\n\nOnce you’ve made your choice, you inform the cashier and take out your Codex, ready to make a transfer.");

	output("\n\n<i>“Perfect!”</i> she says, <i>“Now I should inform you that most bets carried out officially in this establishment are those for high-rollers”</i> She hits a button behind her counter and a list of prices appears on the holo-pad in the counter.");

	output("\n\nYour eyes widen at the buy-in prices; they’re all pretty hefty, and would make a stingier " + pc.mf("man","woman") + " fall over dead, no doubt. At the same time, you stand to make a lot of money if you place your bets right.");

	processTime(4);
	clearMenu();
	//[1,000] Bet 1,000 credits. //Requires 1,000 credits.
	if(pc.credits >= 1000) addButton(0,"1,000",bettingAtTheTaurRaces,1000,"1,000 Credits","Bet 1,000 credits.");
	else addDisabledButton(0,"1,000","1,000","You don’t have the cash to make that bet.");
	//[3,000] Bet 3,000 credits. //Requires 3,000 credits.
	if(pc.credits >= 3000) addButton(1,"3,000",bettingAtTheTaurRaces,3000,"3,000 Credits","Bet 3,000 credits.");
	else addDisabledButton(1,"3,000","3,000","You don’t have the cash to make that bet.");
	//[10,000] Bet 10,000 credits. //Requires 10,000 credits.
	if(pc.credits >= 10000) addButton(2,"10,000",bettingAtTheTaurRaces,10000,"10,000 Credits","Bet 10,000 credits.");
	else addDisabledButton(2,"10,000","10,000","You don’t have the cash to make that bet.");
	//[Nevermind]
	addButton(3,"Never Mind",neverMindTaurStadium);
}

//Choosing any of these will trigger an INT check based on the bet chosen. Lower-priced bets have a higher success rate, while the higher-priced ones have a much lower success rate. These chances are multiplied by the PC’s intelligence. Bimbo PCs automatically have a 50/50 success chance. Winning a bet doubles payment.

//Fen note: Nope! 51/49 is the best possible result. Bimbos/braindead get 11% base chance + 1% per 2 IQ.

public function bettingAtTheTaurRaces(bet:Number):void
{
	clearOutput();
	author("HugsAlright");
	//Win
	if(rand(100)+1 <= 11 + pc.IQ()/2)
	{
		output("You tap your Codex a few times and transfer your chosen amount of credits over to the cashier who nods when she receives your payment.");
		output("\n\n<i>“Alright, " + pc.mf("sir","ma’am") + ",”</i> the alien girl says, flipping the counter-mounted holo-pad off, <i>“You can head to our stadium seating up the stairs here and watch the race. When it’s concluded you can return here.”</i>");
		if(pc.isAss()) output("\n\nYou nod");
		else output("\n\nYou thank the woman");
		output(" and make your way towards the stairs, climbing the steps until your eyes are greeted by the huge, open arena of the U7 racing stadium. It won’t be long before the race starts, so you skip finding a seat and lean yourself against a guardrail to get a closer look at the action.");
		output("\n\nBefore too long cheering and clapping fills the air when as the race begins. The buzzer sounds and the tauric racers shoot from their gates like bullets, jockeys riding underneath. They maneuver the turns of the track like veteran racers, and the riders beneath seem to be enjoying being along for the ride.");
		output("\n\nYou keep your eyes fixed on the mass of contestants as they round corners and reach the finish line. Your grip tightens with anticipation as your number starts to pull ahead of the pack, gaining a lead until you’re practically screaming and cheering loud enough for the whole stadium to hear. Sure enough, they cross the finish line first with a cry of victory from you, and the rest of the crowd that bet on them.");
		output("\n\nWith a smile, you leave the arena and walk your way back to the cashier, who greets you with a wave and a <i>“Welcome back,”</i> appearing to know that you’ve already won. The transaction is carried out quickly, and you’re left a richer " + pc.mf("man","woman") + " for it.");
		pc.credits += bet;
		showName("\nWINNING!");
	}
	//Loss
	else
	{
		output("You tap your Codex a few times and transfer your chosen amount of credits over to the cashier who nods when she receives your payment.");
		output("\n\n<i>“Alright, " + pc.mf("sir","ma’am") + ",”</i> the alien girl says, flipping the counter-mounted holo-pad off, <i>“You can head to our stadium seating up the stairs here and watch the race. When it’s concluded you can return here.”</i>");
		output("\n\nYou ");
		if(pc.isAss()) output("nod");
		else output("thank the woman");
		output(" and make your way towards the stairs, climbing the steps until your eyes are greeted by the huge, open arena of the U7 racing stadium. It won’t be long before the race starts, so you skip finding a seat and lean yourself against a guardrail to get a closer look at the action.");
		output("\n\nBefore too long cheering and clapping fills the air when as the race begins. The buzzer sounds and the tauric racers shoot from their gates like bullets, jockeys riding underneath. They maneuver the turns of the track like veteran racers, and the riders beneath seem to be enjoying being along for the ride.");

		output("\n\nYou keep your eyes fixed on the mass of contestants as they round corners and reach the finish line. Your grip tightens as your number starts to fall behind in the pack, leading you to scream their name at the top of your lungs. Unfortunately, your efforts seem for naught, as someone else crosses the finish line long before them. You ");
		if(pc.isAss()) output("curse");
		else output("slump your shoulders");
		output(" in disappointment as most of the crowd continues to cheer.");
		output("\n\nWith a much-emptier credit-account, you pry yourself from the guardrail and walk your way out of the stadium.");
		output("\n\nBetter luck next time...");
		pc.credits -= bet;
		showName("\nWHELP.");
		//[Next] //Returns the PC to the racetrack’s main menu.
	}
	processTime(28);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Nevermind
public function neverMindTaurStadium():void
{
	clearOutput();
	author("HugsAlright");
	showName("\nNEVER MIND.");
	output("You take a look down at your credit balance and ponder your chances for a moment before telling the cashier that you’ve changed your mind.");
	output("\n\n<i>“Oh, that’s alright,”</i> she says, flipping off the holo-pad as you go to put away your Codex, <i>“If you ever do feel like you’d want to place a bet, U7 is always open!”</i>");

	//[Next] //Returns the PC to the racetrack’s main menu.
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Enter Race?
//[EnterRace?]
public function enterTheRace():void
{
	clearOutput();
	showTaurCashier();
	author("HugsAlright");
	output("Being of the tauric persuasion yourself, you ask the cashier if there’s any way you could participate in the races that take place here.");
	output("\n\nA face that <i>appears</i> to be apologetic appears on the woman’s face. <i>“Unfortunately, no,”</i> she says with a shake of her head, <i>“We can’t take on any new racers or jockeys at the moment, our entire roster is full for the time being, and for quite a while still by my guess.”</i>");
	output("\n\nWell, no one can say you didn’t try.");
	processTime(2);
	addDisabledButton(2,"EnterRace?","EnterRace?","No go on that, good buddy.");
	//[Next]
}