//Dr. Lash
//Believes sexuality and reproduction are a distraction from intelligent pursuits and the development of all sapient beings.

/*Runs a clinic on Tarkus. Hates Doctor Badger and the Raskvel.
Appearance
Gray skin, flat nose. Basically Voldemort.
Red, vision-augmenting goggles. Solid black eyes underneath.
Six arms.
Will attempt to kill you if you seduce him.
No junk of any kind, or even nipples.*/

public function showDrLash():void
{
	showName("DOCTOR\nLASH");
	showBust("DR_LASH");
}

//Room Desc & Outside Flash:
public function outsideDrLashBonusBonus():void
{
	output("\n\nA small, prefab structure nestles in amongst the raskvel’s rickety shanties, so stark and clean that seems to exist in sheer willful defiance of the disarray surrounding it. The door is marked with a glowing, “<b>No Entry</b>” sign.");
}

//Actual Desc
public function drLashOfficeBonus():Boolean
{
	output("The automatic door retracts and closes with the telltale, snake-like hiss of reliably constructed hydraulic propulsion. Inside, bright lights that would be more at home in a hospital than a backwater colony illuminate dozens of terminals, microsurgeon synthesizers, and nutrient baths holding organs from extraterrestrial races you’d be hard-pressed to identify. A glass-enclosed operating table is propped up in the back with its robotic, surgery-assisting arms cradled around it like the legs of a long-dead spider.");
	if(flags["MET_DR_LASH"] == undefined) {
		meetDrLashYaCunt();
		return true;
	}
	//Dr. Butt Appearance Blurb (Repeats Only)
	else
	{
		output("\n\nDoctor Lash ");
		if(rand(5) == 0) output("is fiddling with his terminal, doubtless attempting to find a solution to the natives’ troublesome breeding urges.");
		else if(rand(4) == 0) output("jumps up at the sound of his door closing, adjusting his red-glowing goggles so that they no longer sit so askew on his bald head.");
		else if(rand(3) == 0) output("glances your way, his goggles whirring. <i>“Ah, just you.”</i> Whatever he’s doing is clearly more important to him than someone barging into his lab.");
		else if(rand(2) == 0) output("nearly drops a half-filled beaker full of green liquid. He catches it at the last moment. Barely.");
		else output("looks up at the lights and scowls. <i>“I should buy some Tesla coils...”</i>");
		addButton(0,"Dr.Lash",walkUpToDocLashAgain,false);
	}
	return false;
}

//First Time Meeting Funtimes!
public function meetDrLashYaCunt():void
{
	showDrLash();
	output("\n\nA bald creature half-hidden behind a blinking cabinet whips around at the sound of your arrival, barking, <i>“Who’s there? Get out!”</i>");
	output("\n\nAs you consider your reply, you make a quick appraisal of the figure. It’s clearly a scientist, judging by the lab coat, but also inhuman - a dead giveaway thanks to the six sets of sleeves that dangle from the eggshell garment. Even without them, it couldn’t pass for a human. Pale gray skin and a flat, almost nonexistent nose make sure of that. Glowing goggles protrude from above its narrow nostrils, hiding the shape of the creature’s eyes behind a veil of shining crimson.");
	output("\n\nYou fumble for a response. <i>“");
	if(pc.isNice()) output("Sorry! I was just looking around the town. No harm intended.");
	else if(pc.isMischievous()) output("I was just takin’ a look around. No need to get your half-dozen hackles up.");
	else output("Ease off the trigger a bit. I can see myself out.");
	output("”</i>");

	output("\n\nThe labcoat-sporting alien waves his arms apologetically and drawls in a curiously neutral voice. <i>“Nevermind. In my haste, I believed you to be one of the pint-sized troublemakers that so infest this vessel - raskvel, I believe they call themselves. Do stay if you wish... so long as you do not plan to fornicate in my lab. Sexual effluvia is such a bother to clean, and the raskvel get it </i>everywhere<i>.”</i>");
	output("\n\nFlickering in what can only be described as an electronic blink, the scientist’s goggles regard you intently. <i>“You aren’t going to make a mess of my lab, are you?”</i>");
	output("\n\nAre you?");
	processTime(2);
	//[Yes] [No]
	clearMenu();
	addButton(0,"Yes",tellDrLashYoullFuckHisLabUp);
	addButton(1,"No",dontBeADumbshitLashGreeting,false);
}

//Yes
//Be dumb
public function tellDrLashYoullFuckHisLabUp():void
{
	clearOutput();
	showDrLash();
	output("<i>“Loosen up. Sometimes it’s fun to get messy!”</i>");
	output("\n\nThe six-armed alien scowls and withdraws a half-dozen glowing plasma weapons from his sleeves. <i>“As the neural impulses from the brain cease, the muscle tissue can become quite ‘loose’ before rigor mortis sets in. I suppose you’ll manage to make a mess of my lab once, should you persist down this route, but it will be a mistake you’ll be comically incapable of duplicating.”</i> Sickly green light lends the room’s ambiance a disturbing tint. <i>“Now, are you going to make a mess of my lab?”</i>");
	processTime(1);
	clearMenu();
	//[Fuck Yes][No]
	addButton(0,"Fuck Yes",beSuperDumbAndGetLashFight);
	addButton(1,"No",dontBeADumbshitLashGreeting,true);
}

//Fuck Yes
//Start the fight
public function beSuperDumbAndGetLashFight():void
{
	clearOutput();
	showDrLash();
	output("<i>“Fuck yes I am!”</i>");
	output("\n\nThe scientist sighs heavily. <i>“Very well. Should you encounter an afterlife, do try and put in a good word for Doctor Lash.”</i>");
	clearMenu();
	addButton(0,"Next",startCombat,"Dr. Lash");
}

//No
public function dontBeADumbshitLashGreeting(pulledGuns:Boolean = false):void
{
	clearOutput();
	showDrLash();
	//dont be a dumbshit.
	output("<i>“No.”</i>");
	output("\n\nThe scientist cocks his head");
	if(pulledGuns) output(", and distributes his weapons amongst his dozens of pockets");
	output(". <i>“Well well, at least one individual on this rustball of a planet is capable of using [pc.hisHer] brain to overcome [pc.hisHer] hormone soup.”</i> Standing seemingly at ease, he reminds you of a sleeping viper - at once restful and yet incredibly dangerous. There is a mildly unwell look to the way the corners of his mouth crinkle upward in a smile. <i>“You may address me as Doctor Lash. You studiously avoided disclosing your name previously. What shall I call you?”</i>");
	//Bimbo
	if(pc.isBimbo()) output("\n\n<i>“Like, [pc.name] is fine.”</i>");
	//Nice
	else if(pc.isNice()) output("\n\n<i>“[pc.name]. Sorry about that.”</i>");
	//Mischievous
	else if(pc.isMischievous()) output("\n\n<i>“[pc.name] suits me just fine.”</i>");
	//Hard
	else output("\n\n<i>“[pc.name].”</i>");
	processTime(1);
	//[Next]
	clearMenu();
	addButton(0,"Next",dontBeADumbShitAtGreetingPartDues);
}

public function dontBeADumbShitAtGreetingPartDues():void
{
	clearOutput();
	showDrLash();
	flags["MET_DR_LASH"] = 1;
	output("<i>“[pc.name]. That is... acceptable. Could be better, of course. Nongendered names are superior to their gendered counterparts, just as with the individuals that bear them. So free of those distracting urges for reproduction.”</i> He adjusts his goggles’ fit against his shining head. They flicker violet, shifting to some different wavelength. <i>“");
	if((pc.hasGenitals() && (pc.hasTailCock() || pc.hasTailCunt())) || (pc.hasCock() && pc.hasVagina())) output("A shame you’ve been burdened with such an overwhelming sexual palette. I imagine it must be quite difficult for you converse with all those... feelings coursing through you.");
	else if(pc.hasCock())
	{
		output("A shame you’ve been burdened with such ");
		if(pc.cockTotal() == 1) output("a troublesome phallus");
		else output("troublesome phalli");
		output(". I understand the breeding instincts of the male sex can be quite overpowering.");
	}
	else if(pc.hasVagina()) 
	{
		output("A shame you’ve been burdened with such ");
		if(pc.totalVaginas() == 1) output("an arrogant vagina");
		else output("arrogant vaginas");
		output(". I understand impregnation can be quite inconvenient.");
	}
	else output("Ah, a fellow follower of the superior sex - none. Always good to see someone with his - or her - head on straight. Conventional labels hardly matter for scions of reason like ourselves.");
	output("”</i>");

	output("\n\nYou nod");
	if(!pc.isNude()) output(", feeling a little naked. Do those goggles let him see through your equipment?");
	else output(", somehow feeling even more exposed in spite of your apparent nudity. You have a hunch those goggles would see right through any clothes you bothered to put on.");
	output(" Time for a change of topic. <i>“So ");
	if(pc.isBimbo()) output("like, ");
	output("what do you do here, Doctor Lash?");
	if(pc.isMischievous()) output(" This doesn’t exactly look like the kind of place you’d go for a broken limb or a cavity.");
	output("”</i>");
	output("\n\nStretching his top two arms wide to show off his lab, the good doctor replies, <i>“Research, of course! The greatest calling an individual could ever pursue! The kind of calling that mating and breeding always seem to get in the way of. Could you imagine where we’d be, technologically, if we didn’t have our most brilliant technicians constantly throwing away their careers to look after pint-sized, imperfect clones of themselves? Or worse, simply letting their lusts overwhelm their scientific pursuits like that cock-craving ausar down the hall.”</i>");
	output("\n\nAn almost serpentine grin spreads across his fingers while his lower two arms steeple their fingers together. <i>“We could be kings of solar systems, galaxy-hopping starlords whose creations could reshape the very fabrics of reality. And we’d be so much closer, if it wasn’t for the UGC’s constant meddling.”</i>");
	output("\n\nHe shakes his head, seemingly calming himself. <i>“That’s neither here nor there. What is important is that ");
	if(pc.hasGenitals())
	{
		output("I can free  you from your meddlesome genitalia ");
		if(pc.biggestTitSize() >= 1) output("and distracting breasts ");
		output("for a price.");
		if((pc.hasCock() && pc.hasVagina()) || pc.totalCocks() > 1 || pc.totalVaginas() > 1) output(" If you’ll consent to a total removal, I’ll wave many of my standard fees.");
	}
	else output("I can free you from any meddlesome genitalia you manage to acquire in your travels.");
	output(" What do you say?”</i>");

	processTime(3);
	clearMenu();
	addButton(0,"Sure",genitalRemovalShit,undefined,"Sure","Look into his genital removal services.");
	addButton(1,"Nah",walkUpToDocLashAgain);
}

//Repeat Approach
public function walkUpToDocLashAgain(back:Boolean = true):void
{
	clearOutput();
	showDrLash();
	//Back Out of Deeper Menu
	if(back)
	{
		output("<i>“Uh, I think I changed my mind.”</i>");
		output("\n\nDoctor Lash sighs heavily, his goggles clicking as he blinks. <i>“Very well. Unless you have other business for me, please be on your way.”</i>");
	}
	else
	{
		output("You clear your throat to get the strange creature’s attention.");
		output("\n\n<i>“Ahh, yes?”</i> Doctor Lash answers, turning to face you. <i>“Have you need of my services? I assure you, the lab is quite sterile, should you desire a treatment.”</i>");
	}
	//Main lash menu
	clearMenu();
	//9999
	addButton(0,"Services",genitalRemovalShit,undefined,"Services","Access Dr. Lash's services.");
	addButton(1,"Talk",talkToDocLash);
	addButton(14,"Back",mainGameMenu);
}

//Genital Removal Menu
public function genitalRemovalShit():void
{
	clearOutput();
	showDrLash();
	output("<i>“I think I have need of your services.”</i>");
	output("\n\nDoctor Lash smiles toothily at you, revealing rows of tiny daggers packed close enough to reveal a predatory biology. <i>“Excellent. I cannot work for free, of course. These raskvel are so brazen in their demands for credits, and one must ensure that the power stays on, yes?”</i>");
	output("\n\nYou nod.");
	output("\n\n<i>“Good. You may view my rates on the terminal to your left. Inform me when you are ready for your treatment, I’ll guide you on your path to enlightenment.”</i> Doctor Lash’s crisp labcoat ruffles as he gestures toward a nearby hologram.");

	//Bimbos refuse to remove cunt and bros refuse to remove dicks!
	output("\n\nPure Purge - 1,000 credits. Removes all evidence of troublesome mating organs.");
	output("\nPriaprism Purge - 5,000 credits. Removes all masculinity endowments, big and small.");
	output("\nPhallus Pruning - 10,000 credits. Removes a single phallus of the doctor's choice.");
	output("\nNeutering - 4,000 credits. Removes external gonads and testicular tissue.");
	output("\nBirth-Proofing - 5,000 credits. Converts all vaginas and associated wombs to less libidinous tissues.");
	output("\nVagina Replacement - 10,000 credits. Replaces a single vagina with safe, non-sexualized tissue.");
	output("\n“Rack” Removal - 7,500 credits. Reduces mammary tissue to acceptable biological minimums.");
	processTime(2);

	clearMenu();
	if(pc.hasGenitals())
	{
		if(pc.isBimbo() && pc.hasVagina()) addDisabledButton(0,"Pure Purge","Pure Purge","Ew! You don't want to get rid of your pussy!");
		else if(pc.isBro() && pc.hasCock()) addDisabledButton(0,"Pure Purge","Pure Purge","No way! You're not losing your junk.");
		else if(pc.isPregnant()) addDisabledButton(0,"Pure Purge","Pure Purge","Dr. Lash has no interest in ending your unborn offspring.");
		else if(!pc.hasGenitals()) addDisabledButton(0,"Pure Purge","Pure Purge","You don't have any genitals!");
		else addButton(0,"Pure Purge",lashTreatment,"pure purge","Pure Purge","1,000 credits. Removes all evidence of troublesome mating organs.");
	}
	else addDisabledButton(0,"Pure Purge","Pure Purge","You don't have genitals to remove.");
	if(pc.hasCock() && pc.isBro()) addDisabledButton(1,"Priaprism P.","Priaprism Purge","No way! You're not losing your junk.");
	else if(!pc.hasCock()) addDisabledButton(1,"Priaprism P.","Priaprism Purge","You don't have a phallus to remove.");
	else addButton(1,"Priaprism P.",lashTreatment,"priaprism purge","Priaprism Purge","5,000 credits. Removes all masculinity endowments, big and small.");

	if(pc.hasCock() && pc.isBro()) addDisabledButton(2,"Phallus P.","Phallus Purge","No way! You're not losing your junk.");
	else if(!pc.hasCock()) addDisabledButton(2,"Phallus P.","Phallus Purge","You don't have a penis to lose.");
	else addButton(2,"Phallus P.",lashTreatment,"phallus pruning","Phallus Pruning","10,000 credits. Removes a single phallus of the doctor’s choice.");

	if(pc.balls > 0 && pc.isBro()) addDisabledButton(3,"Neutering","Neutering","No way! You're not getting rid of your junk!");
	else if(pc.balls == 0) addDisabledButton(3,"Neutering","Neutering","You don't have any balls to lose.");
	else addButton(3,"Neutering",lashTreatment,"neutering","Neutering","4,000 credits. Removes external gonads and testicular tissue.");

	if(pc.hasVagina() && pc.isBimbo())
	{
		addDisabledButton(4,"Birth-P.","Birth-Proofing","Noooo! You don't wanna lose your lady parts!");
		addDisabledButton(5,"Vagina R.","Vagina Removal","Noooo! You don't wanna lose your lady parts!");
	}
	else if(pc.hasVagina() && pc.isPregnant())
	{
		addDisabledButton(4,"Birth-P.","Birth-Proofing","Dr. Lash won't perform this treatment until you're no longer pregnant.");
		addDisabledButton(5,"Vagina R.","Vagina Removal","Dr. Lash won't perform this treatment until you're no longer pregnant.");
	}
	else if(!pc.hasVagina())
	{
		addDisabledButton(4,"Birth-P.","Birth-Proofing","You don't have a vagina to lose!");
		addDisabledButton(5,"Vagina R.","Vagina Removal","You don't have a vagina to lose!");
	}
	else
	{
		addButton(4,"Birth-P.",lashTreatment,"birth-proofing","Birth-Proofing","5,000 credits. Converts all vaginas and associated wombs to less libidinous tissues.");
		addButton(5,"Vagina R.",lashTreatment,"vagina replacement","Vaginal Replacement","10,000 credits. Replaces a single vagina with safe, non-sexualized tissue.");
	}
	if(pc.biggestTitSize() >= 1 || pc.bRows()) addButton(6,"'Rack' R.",lashTreatment,"rack removal","Rack Removal","7,500 credits. Reduces mammary tissue to acceptable biological minimums.");
	else addDisabledButton(6,"'Rack' R.","'Rack' Removal","You need a rack to remove in order to get this operation.");
	addButton(14,"Back",walkUpToDocLashAgain);
}

//Treatment Selection
public function lashTreatment(treatment:String):void
{
	clearOutput();
	showDrLash();
	output("You make your choice and punch in the commands to send Doctor Lash the correct amount of credits.");
	output("\n\nAs soon as the confirmation chime goes off, you feel a pinprick at your neck. Six arms are grabbing hold of you, supporting you as your body sags, suddenly warm and limp. Your vision hazes, briefly showing you a glimpse of the too-clean ceiling before your eyelids drift closed and release you into unthinking infinity.");
	if(treatment == "rack removal")
	{
		pc.credits -= 7500;
	}
	else if(treatment == "vagina replacement")
	{
		pc.credits -= 10000;
	}
	else if(treatment == "birth-proofing")
	{
		pc.credits -= 5000;
	}	
	else if(treatment == "neutering")
	{
		pc.credits -= 4000;
	}
	else if(treatment == "phallus pruning")
	{
		pc.credits -= 10000;
	}
	else if(treatment == "priaprism purge")
	{
		pc.credits -= 5000;
	}
	else if(treatment == "pure purge")
	{
		pc.credits -= 1000;
	}
	processTime(3);
	//[Next]
	clearMenu();
	addButton(0,"Next",lashTreatment2,treatment);
}

public function lashTreatment2(treatment:String):void
{
	clearOutput();
	showDrLash();
	output("You come to feeling groggy and sore, like you ran a short footrace after taking a tumble down two flights of stairs. White laboratory walls gradually resolve into focus while you acquaint yourself with your surroundings and allow your mind to to slog its way out of the drug-induced stupor.");
	output("\n\nYou’re naked on a bench in the center of the lab, completely uncovered and unprotected. Anyone could’ve walked in and seen you while you were unconscious!");
	output(" Part of you thrills at the realization, but your body doesn’t react quite as you’d expect.");
	output(" Gasping, you take in your changed form. <b>");
	if(treatment == "rack removal")
	{
		//Trim down to 1 row.
		while(pc.bRows() > 1)
		{
			pc.removeBreastRow((pc.bRows()-1),1);
		}
		//Flat chestiness.
		pc.breastRows[0].breastRatingRaw = 0;
		pc.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
		pc.nippleLengthRatio = 1;
		pc.nippleWidthRatio = 1;
		output("Your breasts are gone. All that remains are two plain-looking nipples.");
	}
	else if(treatment == "vagina replacement")
	{
		if(pc.totalVaginas() == 1) output("Your vagina is gone!");
		else output("A vagina is gone!");
		pc.removeVagina(rand(pc.totalVaginas()),1);
	}
	else if(treatment == "birth-proofing")
	{
		output("Your vagina");
		if(pc.totalVaginas() > 1) output("s are");
		else output(" is");
		output(" gone!");
		pc.removeVaginas();
	}	
	else if(treatment == "neutering")
	{
		pc.balls = 0;
	}
	else if(treatment == "phallus pruning")
	{
		output("A penis ");
		if(pc.totalCocks() == 1 && pc.balls > 0)
		{
			output("and your [pc.balls] are");
			pc.balls = 0;
		}
		else output("is");
		output(" gone!");
		pc.removeCock(rand(pc.totalCocks()),1);
	}
	else if(treatment == "priaprism purge")
	{
		output("[pc.EachCock] has vanished");
		if(pc.balls > 0) 
		{
			output(" along with your sack");
			pc.balls = 0;
		}
		output("!");
		pc.removeCocks();
	}
	else if(treatment == "pure purge")
	{
		pc.removeCocks();
		pc.removeVaginas();
		pc.balls = 0;
		//Trim down to 1 row.
		while(pc.bRows() > 1)
		{
			pc.removeBreastRow((pc.bRows()-1),1);
		}
		//Flat chestiness.
		pc.breastRows[0].breastRatingRaw = 0;
		pc.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
		pc.nippleLengthRatio = 1;
		pc.nippleWidthRatio = 1;
		output("Your genitals");
		if(pc.biggestTitSize() >= 1) output(" and breasts");
		output(" are totally gone!");
	}
	output("</b>");

	var parasites:Boolean = false;

	if(pc.hasCuntTail() || pc.hasCockTail() || attachedMimbranes() > 0)
	{
		parasites = true;
		// Do the removal shit
		if (pc.hasCuntTail() || pc.hasCockTail())
		{
			pc.tailType = GLOBAL.TYPE_HUMAN;
			pc.tailCount = 0;
			pc.tailFlags = [];
			pc.tailGenital = 0;
			pc.tailGenitalArg = 0;
			pc.tailGenitalColor = "";
			
			flags["CUNT_TAIL_PREGNANT_TIMER"] = undefined;
			flags["DAYS_SINCE_FED_CUNT_TAIL"] = undefined;
		}
		else if (attachedMimbranes() > 0)
		{
			removeMimbranes();
		}
	}
	output("\n\n<i>“Oh, you’re awake.”</i> Doctor Lash tosses your equipment none-too-gently onto your [pc.belly]. <i>“");
	if(!parasites) output("Get dressed and be on your way, unless you’d like another treatment.");
	else output("I took the liberty of removing some filthy parasites while you were under. You can thank me by restoring my privacy post-haste.");
	output("”</i>");
	output("\n\nHis bedside manner could use some work, but at least he treated you as advertised.");
	if(pc.libido() > 50)
	{
		output(" Your libido even seems more manageable.");
		//15% libido reduction
		pc.libido(pc.libido() * -0.15);
	}
	//Menu display
	processTime(98+rand(30));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Talk
public function talkToDocLash():void
{
	clearOutput();
	showDrLash();
	output("<i>“I’d like to talk to you, actually.”</i>");
	output("\n\nDoctor Lash lets out a long-suffering sigh. <i>“Very well, so long as you do not impinge too greatly upon my time.”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"The UGC",askDocLashAboutTheUGC,undefined,"The UGC","Ask him about the UGC. Surely he's got some thoughts about them.");
	addButton(1,"Why?",whyDrLashDoesShit,undefined,"Why?","Why is he out here doing this weird stuff?");
	addButton(2,"Flirt",flirtWithDrLash,undefined,"Flirt","Maybe he's cooled off a bit. He's gotta have a butthole he can still have fun with, right?");
	addButton(14,"Back",walkUpToDocLashAgain);
}

//UGC
public function askDocLashAboutTheUGC():void
{
	clearOutput();
	showDrLash();
	output("<i>“So you don’t like the UGC?”</i>");
	output("\n\n<i>“Of course I don’t like it!”</i> the doctor snaps, nearly losing his technical, reserved manner. <i>“Those pencil-pushing bureaucrats are always getting in the way of progress. If we do not take risks, we are doomed to wallow in a nightmarish, evolutionary quagmire for all time. I merely sought to speed our passage into a more enlightened state.”</i>");
	output("\n\nYou quirk an eyebrow at him.");
	output("\n\nDoctor Lash waves dismissively. <i>“You release one genitalia-eradicating virus into a planet’s stratosphere, and somehow you become a wanted criminal. It’s not my fault they didn’t have microsurgeon-boosted immune systems, or that they weren’t up to date enough handle my specially-engineered bypasses. Honestly, I merely provided them with the motivation to pursue a more erudite method of procreation. How was I to know that the cessation of sex tourism would put their economy into the tank?”</i>");
	output("\n\n<i>“You...”</i> You gulp audibly. <i>“...sterilized an entire planet?”</i>");
	output("\n\n<i>“Don’t be silly, [pc.name]. That would terribly evil. I only sterilized the planet’s dominant sapient life form. Everything else could be handled after their culture caught up to their bodies, assuming the UGC hadn’t sent their peacekeeper dogs after me.”</i> Doctor Lash’s body quivers like a guitar string pulled too tight. <i>“The ausar bitches couldn’t see the beauty in what I was doing, so I had to run here, away from galactic law enforcement. It’ll take me the better part of a terran century to replicate the research I lost, but it’ll be worth it. You’ll see. You’ll all see!”</i>");
	output("\n\nIf he has eyes under those goggles, they must be shining with a fanatical gleam. Maybe it’d be better to talk about something else.");
	processTime(6);
	clearMenu();
	addButton(0,"Next",talkToDocLash);
}

//Why?
public function whyDrLashDoesShit():void
{
	clearOutput();
	showDrLash();
	output("<i>“Why do this? Why focus on the removal of sexual urges, desires, and organs?”</i>");
	output("\n\nDoctor Lash rubs his chin thoughtfully. <i>“That... is a surprisingly astute question, [pc.name]. ‘Why’ is the great question, after all. It is perhaps the root question, the one that fascinates even the youngest of the younglings. Why indeed.”</i> He leans against the cold metal of a table and thinks. <i>“The answer may be more simple than you think. Often the most complicated issues spring forth from the most simple of drives.”</i>");
	output("\n\nYou look at him, still awaiting an answer.");
	output("\n\nHe meets your gaze with his mechanical, crimson eyes and smiles in a way that sends shivers down your spine. <i>“Simple experimentation. I worked for a company that delighted in all things sexual. You might have heard of them - Tamani Corp. They make a significant profit with the volume of business they’re dealing, all based on the back of reproduction-driven perversions. I decided the best way to deepen my understanding of the relevant tissues was to experiment on my own, starting with a thorough, microsurgeon-assisted deconstruction.”</i>");
	output("\n\nLooking intently at your reaction, Doctor Lash asks, <i>“Do you know what I found?”</i>");
	output("\n\nYou answer with a brief, negative shake of your head.");
	output("\n\n<i>“I found clarity. I found peace.”</i> He straightens the folds of his labcoat and straightens his posture. <i>“I found solace from the pernicious, throbbing desires of my loins. I could focus on my work without my body’s base needs constantly threatening derail my train of thought. I knew immediately that I could never go back to the way I was. There was no point in it. If anything, others had to join me. As you can imagine, I self-terminated my employment not long after.”</i>");
	output("\n\nDo you want to ask him something else?");
	clearMenu();
	addButton(0,"Yes",talkToDocLash);
	addButton(1,"No",walkUpToDocLashAgain);
}

//Flirt
public function flirtWithDrLash():void
{
	clearOutput();
	showDrLash();
	output("<i>“So,");
	if(pc.isBimbo()) output(" like,");
	output(" you know you can still do sex stuff with your butthole, right? There’s a whole world of delights you can still experience!”</i>");
	output("\n\nThe six-armed alien scowls and withdraws a half-dozen glowing plasma weapons from his sleeves. <i>“I had hoped you would rise against such impulses. Desist, or I will ensure that you are incapable of ever distracting me again.”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"Keep Flirtin'",keepFlirtingWithLash);
	addButton(1,"Nevermind",walkUpToDocLashAgain);
}

//Keep Flirting
public function keepFlirtingWithLash():void
{
	clearOutput();
	showDrLash();
	output("<i>“Pshh, just let me help  you have some fun.”</i>");
	output("\n\nThe scientist sighs heavily. <i>“Should you encounter an afterlife, do try and put in a good word for Doctor Lash. Or don’t. It matters little.”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"Next",startCombat,"Dr. Lash");
}

//Combat Stuff
//output("\n\n");

public function docLashAI():void
{
	output("<i>“Goodbye,”</i> the doctor bids.\n");
	//6 shots
	rangedAttack(foes[0],pc);
}

//Bad end
//Lust somehow
public function loseToDoctorLash():void
{
	showDrLash();
	showName("GAME\nOVER");
	if(pc.lust() >= pc.lustMax()) output("You collapse, brazenly displaying your body in an attempt to sway the doctor to your way of thinking, but all it does is give him time to line up six simultaneous headshots. Your last sensations are of a half-dozen intense flashes, too bright to be believed.");
	else output("You collapse, too wounded to fight. The doctor takes his time lining up six simultaneous headshots, and there’s nothing you can do to stop him. Your last sensations are of a half-dozen intense flashes, too bright to be believed.");
	badEnd();
}

public function winVsDoctorLash():void
{
	showDrLash();
	showName("\nVICTORY!");
	output("Somehow, you defeated Doctor Lash. That's not something that's supposed to be able to be done yet, but you did it anyway. Good on you.\n\nSeeing as how the game isn't set up to handle this contingency, Dr. Lash will act like he's never met you.\n\n");
	genericVictory();
}

