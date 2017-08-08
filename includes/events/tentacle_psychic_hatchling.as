//[DUN] 3 Surprise female non-con, whilst on her ship, by tentacle beast, Always results in pregnancy
//Yggur
//Have an egg on you? AWWW YISS. It hatches if in your inventory OR storage during spess travel.
//Tooltip
//This egg is larger than most you’ve heard about and warm to the touch. Whatever is inside there, it’s still alive and moving. Your Codex identifies it as species UHS-1045. There’s no real data aside from a warning of danger and a high value for living eggs on less reputable markets.
	
//Psionic! Keeps putting thought and feelings in your head to make you docile and compliant. Jams a bunch of eggs inside, then fertilizes them
//Requires open vagina if PC hasvagina!


public function findStrangeEgg():void 
{
	showBust("");
	
	output("\n\nOh hey, there’s a strange looking egg on the ground! Do you take it?");
	output("\n\n");
	clearMenu();
	addButton(0, "Take It", quickLoot, new StrangeEgg());
	addButton(1, "Don’t", mainGameMenu);
}

public function fuckingEggHatchOhFuck(destination:String):void 
{
	clearOutput();
	showBust("TENTACLE_EGG");
	showName("\nTENTACLES!");
	
	var x:int = pc.findEmptyPregnancySlot(0);
	if(x == 3) x = -1;
	output("Midway through your a mid-journey nap, you wake, feeling very, very wrong. Something wet and sinuous has pressed itself to the top of your head");
	if(!pc.isBald()) output(", squirming slowly through your [pc.hair]");
	output(", leaving a trail of viscous slime in its wake. You jerk away, rolling out of your chair, and come up on your [pc.footOrFeet], ready for a fight.");
	output("\n\nDirectly opposite of you is the creature - a mass of tentacles as thick as steel cables surrounded a squishy-looking central bulb roughly the size of a coconut. You recoil in horror <i>and arousal</i>. Every single one of the tendrils is tipped with something different. Most have phallic-looking protrusions, but some are hollow cups. Still more bear a shapely split that looks eerily reminiscent of a vagina. And every single one of them is closing in you. <i>It’ll feel so good.</i>");
	output("\n\nShaking the errant <i>but sexy</i> thoughts away, you reach for a weapon and come up empty. Your [pc.rangedWeapon] and [pc.meleeWeapon] are gone! Even more shockingly, you’re completely naked. <i>God, that’s so much more convenient!</i> Trails of slime wind their way across much of your torso. Just how long did this thing spend violating you before you woke up? <i>Its tentacles could have even been inside you, stroking and squeezing and turning you into the perfect mother for its young.</i> Where do these thoughts keep coming from?");
	output("\n\nThere’s nowhere to run, <i>not that you want to</i>. You can’t defend yourself either. <i>You’re so vulnerable.</i> Wildly searching for a solution, you try to pull free of the tentacles wrapping around your [pc.feet] and <i>submit</i>. No, that wasn’t it. You were going to break free <i>and get on all fours</i>. Definitely the first part.");
	output("\n\nYour eyes alight not on a solution, but on evidence of just how royally fucked you are. The large green egg you brought with you is sitting not far from the creature, split in half and trailing green ichor. You brought this <i><b>sexy</b></i> thing onboard yourself! There’s no one else to blame. <i>You might as well enjoy it.</i> You moan");
	if(pc.hasVagina()) output(" and <i>rub your hungry pussy</i>. When did you get so wet?");
	else if(pc.hasCock()) output(" and stroke your rigid cock. How did it get so hard?");
	else output(" and wonder <i>which tentacle it will put in your ass</i>.");

	output("\n\nTerrible, agonizing cramps run through your [pc.legOrLegs], dropping you to the floor. They vanish the moment you hit you the deck, but the damage is done. <i>This is so exciting!</i> ");
	if(pc.hasNippleCunts()) output("Your nipples engorge, lubricating and ready to be fucked by this monster.");
	else if(pc.hasInvertedNipples()) output("Your nipples pop right out, eager to be molested by the creature.");
	else if(pc.hasLipples()) output("Your lipples purse, ready to be violated by the creature.");
	else output("Your [pc.nipples] perk up, eager for sensation, even if it does come from this creature.");
	output(" It shambles closer, surrounding everything below your [pc.thighs] in verdant, slick embrace. <i>Every touch feels like a tongue on your ");
	if(pc.hasVagina()) output("slit");
	else if(pc.hasCock()) output("cock");
	else output("asshole");
	output(".</i> <i>“Ah-amazing!”</i> you scream, letting it wrap around you up to the waist. <i>More!</i> You definitely do!");

	//pussy first
	if(pc.hasVagina())
	{
		output("\n\nSlick flat organs rub your vulva");
		if(pc.totalVaginas() > 1) output("e");
		output(" on ");
		if(pc.totalVaginas() == 1) output("either");
		else output("all");
		output(" sides, making you drip. <i>These tentacles are the perfect lovers!</i> Then, " + num2Text(pc.totalVaginas()) + " protrusion");
		if(pc.totalVaginas() > 1) output("s");
		output(", rounded and fatter than the rest, rub");
		if(pc.totalVaginas() == 1) output("s");
		output(" directly on your slit");
		if(pc.totalVaginas() > 1) output("s");
		output(", teasing your [pc.clits] until you’re bucking back against them, forcing the alien phall");
		if(pc.totalVaginas() > 1) output("i");
		else output("us");
		output(" deep inside. <i>It’s everything you wanted and more.</i> ");
		if(pc.totalVaginas() == 1) output("It rubs");
		else output("They rub");
		output(" you just right, pumping in and out of your [pc.vaginas], making you moan. You could get addicted to sex like this. Hell, <i>you’d love to do this every day!</i> If you could go back in time, you’d tell your past self to <i>get a whole bunch of these eggs and fall asleep in the middle of them.</i>");
		//Cuntchanges!
		for(var y:int = 0; y < pc.totalVaginas(); y++)
		{
			//cuntChange(arg:int, volume:Number, display:Boolean = true, spacingsF:Boolean = true, spacingsB:Boolean = false)
			pc.cuntChange(y,150,true,true,false);
		}
	}
	//Dix
	if(pc.hasCock())
	{
		output("\n\nOne coil, thicker than the rest, slithers up around your [pc.biggestCock] and begins to coil around it, sheathing you from base to [pc.cockHeadBiggest] in its oily grip.");
		if(pc.cockTotal() > 1)
		{
			output(" Others join in, surrounded your other prick");
			if(pc.cockTotal() > 2) output("s");
			output(" in ");
			if(pc.cockTotal() == 2) output("a ");
			output("similar enclosure.");
		}
		output(" It’s better than any hand you’ve ever felt - perfectly lubricated and just firm enough without gripping too hard. If this thing is going to make you feel this good, <i>maybe you should let it do whatever it wants to your ass</i>. Then it starts to twist, surrounding you in a vortex of dick-squeezing pleasure, and <i>you wonder how anything else will ever satisfy you again.</i>");
		//Cockchanges!
		pc.cockChange();
	}
	//Nodix/puss
	if(!pc.hasVagina()) 
	{
		output("\n\nA fat bulb threads its way between your cheeks, stopping just outside your [pc.asshole]. There, it stops, gently circling around, sliming you in more of that <i>delightfully lubricating</i> goo. It feels so strange <i>and so right</i>, making you relax, <i>your pucker prepared to be taken.</i> That sounds right. You push back and nearly cum from it sliding inside. ");
		if(pc.hasCock()) output("In fact, it feels like [pc.eachCock] is already starting to squirt. ");
		output("There’s no pain at all. <i>Your ass may as well be a sex-bot’s elastic anus for how wonderfully welcoming it feels</i>. Groaning wantonly, you press your face to the floor and wish for more to come inside you with pleased-sounding gibberings.");
		pc.buttChange(100);
	}
	//Merge
	output("\n\nIt doesn’t have to drag itself any farther forward. You crawl backwards into the mass of tentacles, submerging yourself up to the neck in their unsubtle attentions, offering up your body for whatever depraved ideas it has - so long as it keeps feeding you this pleasure. <i>It can crawl inside you and use you as an incubator if it wants</i>. That’s fine. You would even <i>make sure to eat well while it was inside you so that it could mature properly.</i> Your thoughts come so easily, so effortless, like they’re gliding along on trails of slime, just like your body.");
	//Penetratable nipples
	if(pc.hasFuckableNipples()) output("\n\nVines thrust into your [pc.nipples], and stars burst inside you, carrying a climax through every single misfiring nerve ending.");
	//Milky nips
	else if(pc.canLactate()) output("\n\nHollow vines fasten onto your [pc.nipples] and begin to pump, stroking your beleagured tits with hundreds of tiny cilia as they compel your udders to let down, and you cum. White-hot bliss courses through every nerve ending in your entire body.");
	//Regular nips
	else output("\n\nHollow vines fasten onto your [pc.nipples], stroking them with hundreds of tiny feelers while simultaneously sucking your lewd titty-tips until they’re puffy and engorged. White-hot bliss courses through them, radiating out through every nerve ending in your entire body.");
	//Mergy - new PG
	if(pc.hasCock()) output(" One of the cups hovers beneath your spasming [pc.cocks], catching as much of your nutritious [pc.cumNoun] as it can.");
	if(pc.hasVagina()) 
	{
		output(" Better still is the decadent, juicy feeling of your ");
		if(pc.isSquirter()) output("gushing");
		else output("oozing");
		output(" [pc.vaginas]. ");
		if(pc.totalVaginas() > 1) output("They clamp");
		else output("It clamps");
		output(" down around ");
		if(pc.totalVaginas() == 1) output("its");
		else output("their");
		output(" prehensile mate");
		if(pc.totalVaginas() > 1) output("s");
		output(".");
	}
	else output(" Best of all is the wickedly sensuous experience of having an anal orgasm. Your whole body shakes with the force of it, spellbound by the pulsing length inside it.");
	output(" <i>It feels so good to cum for the tentacles,</i> so powerful and liberating.");
	output("\n\nYou relax more and more each time your body is brought to the precipice, allowing ever greater numbers of the beast’s tentacles to plunge inside your eager form. They stretch you, but it doesn’t hurt. They squirt on you, but you aren’t disgusted. After all, <i>your body was made for this.</i> Every orgasm is an affirmation of your role, and every new tentacle you can take is a pat on the head for a job well done. The deck below is sloppy with cum and slime, <i>just the way you like it.</i>");
	processTime(35);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	//GET RID OF EGGS
	if(pc.hasItemByClass(StrangeEgg)) pc.destroyItemByClass(StrangeEgg);
	else pc.destroyItemInStorageByClass(StrangeEgg);
	clearMenu();
	addButton(0,"Next",postPychicTentacleImpreg,[destination,x]);
}

public function postPychicTentacleImpreg(args:Array):void
{
	clearOutput();
	var destination:String = args[0];
	var x:int = args[1];
	
	showBust("TENTACLE_EGG");
	showName("\nTENTACLES!");
	output("The creature fucks you for hours, but you never seem to tire. Your body never grows sore, just looser, more willing to accept the gift of additional tentacles than ever before. At first, you’re shocked by it pulling the main bulb of its body up against your gaping [pc.vagOrAss " + x + "], but then <i>you remember your duty</i> and grab the edges, holding yourself wide-open.");
	output("\n\nCompressing its body, the strange little alien somehow slides right inside your body, gliding across raw nerves, then stroking them again when it pulls in the dozens of tentacles hanging out of you. Your [pc.belly] bulges rounder by the second, heavy with it’s alien cargo.");
	if(pc.hasCock()) output(" [pc.EachCock] jerks wildly in the air as you cum again, dribbling your last dregs of seed.");
	if(pc.hasVagina())
	{
		output(" Hundreds of other tendrils shift inside of you when the beast adjusts its position, and you cum");
		if(!pc.isSquirter()) output(", dribbling [pc.girlCum]");
		else output(", gushing a fresh torrent of [pc.girlCum] into the puddle below");
		output(".");
	}
	output(" <i>You feel content</i>, riding high on a wave of accomplishment that seems too intense to be entirely real.");
	output("\n\nThen you pass out, slapping down in the muck like a light was switched off.");
	processTime(360+rand(40));
	
	var ppTentacles:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppTentacles.createPerk("Fixed CumQ", 2000, 0, 0, 0);
	if(pc.hasVagina())
	{
		for(var y:int = 0; y < pc.totalVaginas(); y++)
		{
			pc.loadInCunt(ppTentacles, y);
		}
	}
	else
	{
		pc.loadInAss(ppTentacles);
	}
	
	clearMenu();
	addButton(0,"Next",postPsychicTentacleImpreg2,args);
}

public function postPsychicTentacleImpreg2(args:Array):void
{
	var destination:String = args[0];
	var x:int = args[1];
	clearOutput();
	showBust("");
	showLocationName();
	output("When you wake, the creature is still lodged inside you, <i>but that’s fine</i>. You’ll <i>birth it out somewhere nice later.</i> Until then, you should <i>have plenty of sex, and eat lots of food.</i> Now, where ");
	if(!celiseIsCrew()) output("did you put that mop?");
	else output("is Celise when you have a mess that needs cleaning up?");

	var ppTentacles:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppTentacles.impregnationType = "PsychicTentacles";
	ppTentacles.createPerk("Fixed CumQ", 1000, 0, 0, 0);
	
	//Actually put the impregnationshit in.
	if(x >= 0) pc.loadInCunt(ppTentacles, x);
	else pc.loadInAss(ppTentacles);

	processTime(1);
	clearMenu();
	addButton(0,"Next",flyToWrapper, destination);
}

public function PsychicTentacleBirthing(pregSlot:int):void
{
	clearOutput();
	showBust("");
	showName("TENTACLE\nBIRTH!");
	var pData:PregnancyData = pc.pregnancyData[pregSlot] as PregnancyData;
	var x:int = pregSlot;
	if(pregSlot == 3) x = -1;
	output("You hear the rumble in your [pc.belly] at the same time you feel the tentacles whirl around inside. They’ve grown thick and fat while you’ve carried them, <i>every bit the perfect, attentive mother</i>, but now it is time to <i>set them loose on the galaxy.</i>");
	output("\n\nGiggiling dreamily, you flop down on the floor");
	if(pc.legCount > 1) output(" and spread your [pc.legOrLegs]");
	output(", gushing the alien creature’s bizarre birthing fluids");
	if(pc.hasVagina()) output(" and [pc.girlCum]");
	output(" everywhere. It’s pulling you open from inside, and it feels amazing. <i>You’re basically just a bundle of nerves and flesh for your master to grow inside.</i> Just like the rest of the galaxy.");
	output("\n\nYou moan, feeling every bit like a puppet dancing on strings. Strings of pleasure and ecstasy. Strings that tug you open, letting a foot of burly tentacle splash out into the puddle. Arching your back, you shake your hips lewdly, encouraging the <i>superior being</i> to extend a second tendril from your body. You pet it, then throw back your head and pant, shuddering in inexplicable bliss.");
	output("\n\nYou never want this to end. You want the tentacles to continue to slide from your body forever. It’s better than any orgasm ever could be, one unending wave of clenching, tremendous pleasure, washing away your concerns and filling you with placid contentment. You’re so awash in the sensory tsunami that you barely feel the main bulb of its body popping out of you. <i>Master</i> grew so large inside you, and so many of his tentacles are still inside you - the biggest, fattest, most fuckable ones.");
	if(x == -1) pc.buttChange(2000);
	else pc.cuntChange(x,2000);
	output("\n\nIsn’t giving birth supposed to hurt?");
	output("\n\nWhatever. Squealing and drooling, you collapse, bonelessly jerking your [pc.hips] back and forth to enhance the physical orgasm your body is having. It’s nothing next to the full-on braingasm your inhuman master provides. Your eyes roll back, and a strangled whine worms its way out of your throat, jumping in pitch with every squirming, slickened movement through your gaping");
	if(x == -1) output(" asshole");
	else output(" [pc.vaginaNoun " + x + "]");
	output(".");
	if(x == -1) pc.buttChange(2000);
	else pc.cuntChange(x,2000);
	output("\n\nNo matter how disquieting the sloppy sounds of your birthing may be, <i>they’re music to your ears.</i> You wouldn’t mind having a recording to listen to later. Maybe you could listen when you next masturbate... and pull yourself wide open once more. Or you could keep lying here, semi-conscious and exhausted, releasing your <i>beautiful master</i> on the universe.");
	if(x == -1) pc.buttChange(2000);
	else pc.cuntChange(x,2000);
	output("\n\nAt last, there is only one tendril left inside you, and when it pulls out, a torrent of slippery, lubricating slime pours out after to coat your master. He looks so perfect now, so much larger and more powerful, glistening with potential. His mother’s body seems so empty and worthless without him.... <i>You need to find another egg to incubate.</i>");
	if(x == -1) pc.buttChange(2000);
	else pc.cuntChange(x,2000);
	output("\n\nFor now, you can doze on the floor and recover. <i>Your master fades from your awareness. Now that you’ve served your function, you don’t need to be aware of him anymore. Surely he’s close by, but when you open your eyes, he’s gone. He didn’t even make a sound. Maybe he’ll leave you an egg somewhere.</i>");
	if(pc.elasticity < (pc.hasPerk("Elasticity") ? 7 : 5))
	{
		pc.elasticity += (pc.hasPerk("Elasticity") ? 1.5 : 1);
		output(" <b>You’re pretty sure the master’s slime changed your body, making it far stretchier than ever before.</b>");
	}
	pc.orgasm();
	
	if(rooms[currentLocation].planet == "TAVROS STATION" || InPublicSpace())
	{
		output("\n\nAfter your head clears, you check the time on your Codex. It gives you a beep and informs you that your lovely tentacle beast was encountered in the public and has been swiftly caught by one of your droids and sent to your nursery.");
		
		pc.createStatusEffect("Psychic Tentacles Birth To Nursery");
	}
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
