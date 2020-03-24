//Not sure if I completed this already or not, if not then the fetish I would like to see is a living, full body jumpsuit that penetrates the player while worn while still allowing the player to be fucked by NPCs with the suit on, while changing to match the slutiness of the player. - Crew clothes, possibly?
//SaintStasis, $200

//"A strange metal collar" "S.Collar"
//"An Omnisuit Collar"
//"A slinky black omnisuit"
//Omnisuit - "a metal collar embossed with 
//Collar full of raw material and microsurgeons that spin a latex-like, nerve-interfacing suit out on command. Penetrates six inches into vagina and anus allowing for intercourse but parts as needed for bodily function. Collar attempts to set the suit's design according to the user's desires, resulting in increasingly lewd and revealing look.s
//Sub 50 libido: everything is covered, holes are not obvious, dicks are covered in thick latex that obscures their shape. Nipples generally concealed.
//Sub 75 libido: nipples clearly outline, dick still held sheer to body but thin enough layer to be seen. Camel toe mildly on display
//Nipples and dick CLEAR AS DAY through the suit. Pussies and clits can be seen as well. "Exposed" checks return true.
//Scene where a breeze turns the PC on too much.
//Slight vulnerability to tease.
//Resistant to thermal and electric.
//Mild defense, good sexy.

public function statOutOmniCollar():void
{
	if(pc.armor is Omnisuit)
	{
		pc.armor.hasRandomProperties = true;
		pc.armor.addFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL);
		pc.armor.evasion = 5;
		if(pc.libido() < 33)
		{
			pc.armor.defense = 5;
			pc.armor.evasion = 4;
			pc.armor.sexiness = 3;
			pc.armor.resolve = 2;
		}
		else if(pc.libido() < 66)
		{
			pc.armor.defense = 3;
			pc.armor.evasion = 8;
			pc.armor.sexiness = 4;
			pc.armor.resolve = 1;
		}
		else
		{
			pc.armor.defense = 1;
			pc.armor.evasion = 12;
			pc.armor.sexiness = 5;
			pc.armor.resolve = 0;
		}
	}
}

public function omnisuitMenuBonus(btnSlot:int):String
{
	addButton(btnSlot, "Omnisuit", omnisuitMenu, undefined, "Omnisuit", "Interact with your Omnisuit.");
	
	return "\n\nYour body is wrapped in " + pc.armor.description + ".";
}
public function omnisuitMenu():void
{
	clearOutput();
	output("What would you like to do to your Omnisuit?");
	
	clearMenu();
	addButton(0,"Reset",firstTimeOmniSuitOn,undefined,"Reset Omnisuit","Reset the Omnisuit so that you can enjoy the first-time configuration all over again.");
	addButton(14, "Back", itemInteractMenu);
}

public function omnisuitEquip():void
{
}
public function omnisuitUnequip():void
{
	output("Touching a small stud on the collar, you command the Omnisuit to retract. It does so at once, making you shiver and shudder as it disengages from your [pc.skinFurScales]. The crawling latex tickles at first, but with each blob that flows up into the collar, the sensations deaden. Once you’re completely uncovered, the collar hisses and snaps open, falling into a numbed palm. Your sense of touch is vastly diminished without the suit, leading you to wonder if it wouldn’t be better to just put it back on.");
}
public function omnisuitInventoryBlurb(arg:ItemSlotClass):String
{
	var msg:String = "";
	// Wearing Omnisuit
	if(arg is Omnisuit || arg is OmnisuitCollar || arg is StrangeCollar)
	{
		if(flags["OMNISUITED"] == undefined || arg is StrangeCollar)
		{
			msg += "Putting strange objects around your neck probably isn’t the best idea you’ve had, but then again, neither is running around the most dangerous parts of the galaxy trying to claim a fortune. Pressing a button on the shining band, you pop it open and line it up around your neck. It’s a little tight, but it should fit without crushing your throat. Sucking in a nervous breath, you snap the ends together, feeling a hidden mechanism make a satisfying ‘click’. It warms against your [pc.skinFurScales], pulling tighter and tighter until you fear it might start to choke you. It never does. Just when you’re starting to panic, it stops shrinking.";
			msg += "\n\nProbing around the edge with a fingertip, you realize that it wasn’t just getting tighter - it was changing shape, molding itself to the exact shape of your neck. There isn’t a single gap where your flesh isn’t kissed by the warm, flexible metal. It hugs your [pc.skinFurScales] tightly, firm and constricting and yet forgiving enough not to pinch as you move around.";
			if(pc.isBro()) msg += " You bet you look fuckin’ awesome - butch as hell.";
			else if(pc.isBimbo()) msg += " You bet you look sexy as fuck. You wonder if there’s a ring to attach a leash to. The boys would love it.";
			
			if(eventQueue.indexOf(firstTimeOmniSuitOn) == -1) eventQueue.push(firstTimeOmniSuitOn);
			pc.lockItemSlot(GLOBAL.ARMOR, "You try to replace your new collar but it refuses to unlock. Something is preventing you from removing it...");
		}
		else
		{
			msg += "You close the Omnisuit’s collar around your neck once more, delighted to feel it molding itself to the shape of your body. After properly adjusting its shape, it hisses, and a wave of oily, latex-like material flows down your body, rapidly coating every inch of your form in clingy tightness. It feels wonderful, being wrapped up in ebony perfection once more, feeling it flowing back into position like the hands of a long lost lover.";
			msg += "\n\nBest of all, everywhere it goes, sensation is heightened";
			if(!pc.isNude()) msg += ", so much so that you feel compelled to remove your other garments. They chafe against your sleek new body, not to mention clashing with the flawless visual aesthetic you’ve acquired.";
			else msg += ", so much so that you can’t help but paw at yourself as you take on a sleek new aesthetic.";
			msg += " It’s a shame that the Omnisuit only pleasantly stimulates you as it envelops your body this time. There’s no full-body teasing of every neuron, just the lovely feel of something rubbery and warm cupping and gripping every part of your form.";
			msg += "\n\n<i>“Thank you for using your Omnisuit! Remember, the Omnisuit is the only clothing that can pander to your every desire, on the streets or in the sheets!”</i> a perky female voice chirps from inside your collar as you inspect the finished product.";
			
			if(eventQueue.indexOf(omniSuitRepeatFinisher) == -1) eventQueue.push(omniSuitRepeatFinisher);
			pc.lockItemSlot(GLOBAL.ARMOR, "The Omnisuit collar has just been activated. Perhaps you should let it settle before removing it...");
		}
	}
	// Attempting to replace Omnisuit
	else
	{
		switch(arg.type)
		{
			case GLOBAL.ARMOR:
			case GLOBAL.CLOTHING:
				msg += "Touching a small stud on the collar, you command the Omnisuit to retract. It does so at once, making you shiver and shudder as it disengages from your [pc.skinFurScales]. The crawling latex tickles at first, but with each blob that flows up into the collar, the sensations deaden. Once you’re completely uncovered, the collar hisses and snaps open, falling into a numbed palm. Your sense of touch is vastly diminished without the suit, leading you to wonder if it wouldn’t be better to just put it back on.";
				break;
			default:
				msg += "The moment the " + arg.longName + " comes in contact with your suit-enclosed form, you realize that this will never work. The new garment grates distractingly on your sensitized nerves. It’s like trying to wear sandpaper after a decade of nothing but the finest silk. Shaking your head, you yank it off in a hurry. You’ll have to ditch the Omnisuit if you’re going to wear anything else with it. Strange that your backpack and other miscellaneous gear don’t generate the same reaction.";
				break;
		}
	}
	return msg;
}

public function omniSuitRepeatFinisher():void
{
	clearOutput();
	//ABORT!
	if(!(pc.armor is Omnisuit))
	{
		trace("BULLSHIT HAPPENED");
		//mainGameMenu();
		return;
	}
	//Low lib
	if(pc.libido() < 33)
	{
		output("You’re completely covered from head to toe in shining ebony. It’s thickened up nicely to conceal your crotch and [pc.nipples], but you know from experience how quickly the material can thin out to expose a latex-encased bit of genitalia in the bedroom. It really is the swiss-army knife of outfits!");
	}
	//Medium
	else if(pc.libido() < 66)
	{
		output("You’re completely covered from head to toe in shining ebony. Though it has thickened nicely around your [pc.nipples] and ");
		if(pc.hasGenitals()) output("genitals");
		else output("anus");
		output(", it doesn’t really do much to conceal them. If anything, the gleaming surface makes your body seem that much more lewd. Perfect for distracting your enemies... or enticing a girlfriend.");
	}
	//High!
	else
	{
		output("You’re completely covered from head to toe in shining ebony, though the coverage does absolutely nothing to conceal any part of your form. If anything, it seems to highlight it, thickening nicely around the features of your [pc.nipples] and ");
		if(pc.hasGenitals()) output("genitalia");
		else output("anus");
		output(" to make them somehow look even more prominent and lewd than ever before, even when you aren’t turned on. You look like a walking advertisement for sex, only decent in the barest legal sense. Anyone with a lick of sense would know that with an outfit like that, you just want to fuck or get fucked.");
	}
	output("\n\n");
	pc.unlockItemSlot(GLOBAL.ARMOR);
	statOutOmniCollar();
	pc.armor.onEquip(pc);
	buttonWrapUpForOmnisuit();
}


public function buttonWrapUpForOmnisuit():void
{
	var lootList:Array = new Array();
	if(!(pc.lowerUndergarment is EmptySlot)) 
	{
		pc.lowerUndergarment.onRemove(pc);
		lootList.push(pc.lowerUndergarment);
		pc.lowerUndergarment = new EmptySlot();
	}
	if(!(pc.upperUndergarment is EmptySlot)) 
	{
		pc.upperUndergarment.onRemove(pc);
		lootList.push(pc.upperUndergarment);
		pc.upperUndergarment = new EmptySlot();
	}
	//If item to loot after!
	if(lootList.length > 0) 
	{
		output("\n\n");
		// Renamed from lootList so I can distinguish old vs new uses
		itemCollect(lootList);
	}
	else 
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

public function firstTimeOmniSuitOn():void
{
	if(!(pc.armor is Omnisuit))
	{
		//mainGameMenu();
		return;
	}
	clearOutput();
	output("The binding collar hisses, startling you. You jerk a hand up to it, discovering nothing, but a moment later, you feel the source of the sound - something is sliding down the flesh of your neck, coating your collarbones on its way to your chest and shoulders. Your fingers find the foreign material. It feels slick, almost wet, yet solid and rubbery. Looking down, you can see it now, flowing across your body, shooting out inky streamers ahead of the creeping black edge. You try to block it with your hand to little avail - onyx creeps under your fingers, varnishing your body in sleek perfection. Deciding it’s either harmless or impossible to stop, you ");
	if(!pc.isNude()) output("peel off your gear to ");
	output("watch its progress.");

	output("\n\nSable shine flows down your [pc.chest], pausing briefly at your [pc.nipples] only to encase them a moment later, shrouding them and yet somehow doing absolutely nothing to conceal them. If anything, every detail seems emphasized, brought out in stark relief. The black coating turns your shoulders glossy at the same time, squeezing down on you until it treads on the edge between comfortably snug and claustrophobically taut. It oozes over your biceps, complementing the shape of your body with latex-like shine. You roll your shoulders, finding that it doesn’t restrict your movement in the slightest, not even when it nearly doubles you over with laughter at the tickling prickles of your belly button being enveloped.");
	output("\n\nYou prod at yourself while your forearms gain a millimeter-thin coating of mystery material, your fingers gently poking your [pc.nipples]. You gasp at just how <i>good</i> it feels. Touch seems heightened everywhere that the black covers, but in the best way. It doesn’t help that your [pc.nipples] seem so puffy and engorged, like you’ve been toying with them all day. When it curls around the tips of your fingers, you discover that playing with your nips feels even better, like your digits are being fondled at the same time as your nipples.");
	if(pc.lust() < 70) output(" You flush with sudden arousal, moaning and rubbing faster, watching the latex-like ink curl over your [pc.hips].");
	else output(" You moan in whorish delight. Fuck, maybe you shouldn’t have tried this on while you were so goddamned <i>horny</i>. Watching the latex-like ink curl over your [pc.hips], you rub faster, counting down the seconds until your groin can feel just as <i>tight</i> and sensitive as the rest of you.");

	//Dick
	if(pc.cockTotal() == 1)
	{
		output("\n\nA band of snugness seals around the base of your [pc.cocks], as tight as a cock ring and twice as pleasant. Firmness fills it, pumping you bigger and harder. You ache with the swelling tumescence, so full and yet still bound by mystery latex. Throwing back your head, you stop trying to watch and thrust your hips, desperately humping an invisible partner, getting off on having your [pc.cocks] wrapped up in gleaming sheath. You feel it climbing higher and squeezing, shooting off bubbles of dick-sealing bliss when it wraps around your head. The whole of your manhood flexes as it wraps around the [pc.cockHeads], and you nearly cum on the spot. The searing, white-hot pleasure seems to climb up your urethra, burrowing into your [pc.balls], wracking you with clenching, spasming paroxysms.");
	}
	//Dix
	if(pc.cockTotal() > 1)
	{
		output("\n\nBands of snugness seal around the base of your [pc.cocks], as tight as any cock rings and twice as pleasant. Firmness fills them, pumping you bigger and harder. You ache with the swelling tumescence, so full and yet still bound by mystery latex. Throwing back your head, you stop trying to watch and thrust your hips, desperately humping an invisible partner, getting off on having your [pc.cocks] wrapped up in gleaming sheaths. You feel them climbing higher and squeezing, shooting off bubbles of dick-sealing bliss when they wrap around your heads. The whole of your multitudinous manhood flexes as goo wraps around each [pc.cockHead], and you nearly cum on the spot. The searing, white-hot pleasure seems to climb up your urethras, burrowing into your [pc.balls], wracking you with clenching, spasming paroxysms.");
	}
	if(pc.hasCock())
	{
		output("\n\n[pc.Cum] abruptly fires out of you in one long, ropey spurt, appearing on the outside of your shining encasement as if by magic. Either ");
		if(pc.cockTotal() == 1) output("a tiny hole has");
		else output("tiny holes have");
		output(" opened or the slick black material is more permeable than it would appear. Two more successive, uncontrollable ejaculations fire off, undeniably pleasant but without any accompanying relief, leaving you stiff, aching, and just as horny as you were a moment ago. Only now that you think about it, you realize that your latex bondage no longer feels quite so tight. The rubbery goo might as well be a second skin... or just your regular skin. It’s increasingly hard to tell the difference with your ultra-sensitized organ");
		if(pc.cockTotal() > 1) output("s");
		output(".");
		pc.orgasm();
		output("\n\nWithout much thought, you reach down and stroke, immediately moaning. Your fingers squeak loudly as they slide along the exotic second skin, but it doesn’t diminish the intensity of the answering pleasure. If anything, it heightens it. You pump your sloppy, drooling cock faster and faster, driving yourself to an orgasm that seems a few strokes away. That peak is easier than ever to climb. You’re bucking and spurting in no time, firing [pc.cum] ");
		var cumQ:Number = pc.cumQ();
		if(cumQ < 8) output("out in weak bursts. It would seem this strange suit does nothing for your virility.");
		else if(cumQ < 150) output("out in long lines, painting the ground and your fingers.");
		else if(cumQ < 5000) output("out in thick streams, creating nice big puddles of wasted jism.");
		else output("out in huge, seemingly endless streams, flooding the immediate area in a liquid declaration of bliss.");
		output(" You feel the excess rolling over your knuckles, and even that feels like a lover’s tongue.");
		pc.orgasm();
	}
	//No pussy but dick
	if(!pc.hasVagina() && pc.hasCock())
	{
		output("\n\nSagging to the ground, you’re secretly thankful for the perfect encasement. The strange material might let your [pc.cum] spurt out, but it can’t seem to get back in. It rolls down your knuckles and [pc.legOrLegs] without ever actually getting inside, and as an added bonus, your [pc.cocks] ");
		if(pc.cockTotal() == 1) output("is");
		else output("are");
		output(" still rock-hard, too teased by feeling of sperm oozing down ");
		if(pc.cockTotal() > 1) output("their sides");
		else output("its side");
		output(" to even entertain the idea of going soft.");
		output("\n\nYou tell yourself that you’ve decided to jack off some more, but the simple truth is that your hand was already back around ");
		if(pc.cockTotal() > 1) output("a");
		else output("your");
		output(" dick, deliriously milking more bliss from your sensation-enhanced flesh. You doubt you could stop if you wanted to, and as the [pc.cum] rains down on your [pc.belly], you realize that you really don’t want to.");
	}
	//Cunts!
	if(pc.hasVagina())
	{
		var clits:Number = pc.totalClits();
		if(pc.hasCock()) output("\n\nPanting from exertion");
		else output("\n\nPanting in anticipation");
		output(", you shudder when the tide of sable slides toward your feminine mound");
		if(pc.totalVaginas() > 1) output("s");
		output(". Tendrils of the onyx goo gingerly explore the folds of your [pc.vaginas], sinking into the cracks and crevices before daring to slide across the ");
		if(pc.wettestVaginalWetness() < 4) output("sopping wet");
		else output("openly drooling");
		output(" folds. It’s a bizarre feeling, the latex sliding and binding, creeping and caressing your most private places, transforming the fleshy hole");
		if(pc.totalVaginas() > 1) output("s");
		output(" into gleaming perfection. It pauses for a second at your clitoral hood");
		if(clits > 1) output("s");
		output(" as if considering before diving in, tormenting you with explosive bliss. It’s like a thousand thrashing tongues caressing your every inch while hundreds of different mouths suck away at ");
		if(clits > 1) output("them");
		else output("it");
		output(".");

		output("\n\nYou cum to the sight of your button");
		if(clits > 1) output("s");
		output(" transforming into ");
		if(clits == 1) output("a ");
		output("perfectly smooth, reflective ");
		if(pc.clitLength >= 3) 
		{
			if(clits == 1) output("tower");
			else output("towers");
		}
		else
		{
			output("sex-organ");
			if(clits > 1) output("s");
		}
		output(". Unable to keep your encased fingers away from your shrink-wrapped cunt");
		if(pc.totalVaginas() > 1) output("s");
		output(", you thrust two inside, delighted to discover that your [pc.girlCum] is somehow available to lubricate your digits, letting you freely frig your climaxing quim");
		if(pc.totalVaginas() > 1) output("s");
		output(". Your [pc.legOrLegs] tremble");
		if(pc.legCount == 1) output("s");
		output(" weakly, and you fall too the ground, too pleasure-drunk to care. Your [pc.vaginas] sound");
		if(pc.totalVaginas() == 1) output("s");
		output(" so lewd - all sloppy and squelching and squeaking around your frenzied fingers.");
		output("\n\nYou lay like that for what feels like hours, fucking your [pc.vaginas], lost in ecstatic, sensation-enhancing bliss. Every part of your channel");
		if(pc.totalVaginas() > 1) output("s");
		output(" feels more sensitive than ever before. Every caress is the perfect massage. Your [pc.clits] ");
		if(clits == 1) output("is a lightning rod");
		else output("are lightning rods");
		output(" for orgasm or a firearm’s trigger - one little squeeze makes you go off.");
		pc.orgasm();
		pc.orgasm();
	}
	//No genitals
	if(!pc.hasGenitals())
	{
		output("\n\nPanting in anticipation, you shudder when the tide of sable slides over your [pc.butt] and toward your [pc.asshole]. You feel it pause around your ring as if considering, then, all at once, it slides inward, wrapping your crinkled star in slick, perfect blackness. You reach back to feel it, promising yourself that you just want to see what it’s doing back there, but the reality is that you just want to touch it. It tingles hotly, and you can only imagine how good it’ll feel to slip your equally glossy fingers inside. Your [pc.asshole] pulses, winking open and closed at the idea.");
		output("\n\nIt’s better than you imagined. You ignore the audible squeak of latex-against-latex and thrust in farther, groaning at just how fucking sensitive your ass has become. Paroxiasms of pleasure ripped through you at the intrusion, and you find yourself squeezing down to heighten the bliss even as you press up to the knuckle. The resulting orgasm is almost too much for you, and you drop to the ground, laying out on your back so that you can continue to thrust inside.");
		output("\n\nAdding a third finger, you rapidly climb to the peak of your second orgasm, drooling all over yourself while you treat your anus as a squeaking sex-toy. ");
		if(pc.libido() >= 50) output("You briefly make a second attempt at mentally justifying this newest descent into depravity, but honestly, you just don’t care. You like to fuck. You like to fuck a lot, and if you want to fuck your own ass until you’re a drooling wreck, so be it.");
		else output("You try your damnedest to justify this sudden, pernicious desire for self-pleasure, but nothing comes to mind. The spikes of pleasure aren’t helping. Whenever you get close to lying on your back and stuffing four fingers into your asshole, ecstasy short-circuits your brain. You give up before long. Why try to explain it?");
		output("\n\nYou close your eyes and listen to the squeaking of your asshole, forgetting all about the suit while you cum... and cum... and cum....");
		pc.orgasm();
		pc.orgasm();
	}
	processTime(25);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",putOnDaOmniSuitFirstTime2);
}

public function putOnDaOmniSuitFirstTime2():void
{
	clearOutput();
	output("When you come to, you feel sore in all the right places and utterly satisfied, like you spent the better part of an evening on a drug and hooker-fueled bender. You’re still wearing the suit, of course, ");
	//low libido variant
	if(pc.libido() < 33)
	{
		output("but what you see when you look down shocks you.");
		output("\n\nThe oily suit’s surface has transformed from a second skin into a far more revealing, rubber-like covering. Your [pc.nipples] are completely concealed.");
		if(pc.hasCock()) output(" Instead of seeing your [pc.cocks] in stark relief, jutting out proudly, there’s a relatively chaste bulge, more rubbery material than cock.");
		else if(pc.hasVagina()) output(" Instead of seeing your [pc.vaginas] in stark relief, engorged and fuckable, there’s a featureless, almost chaste mound of rubber.");
		output(" Feeling around your rear, you find your [pc.asshole] has been similarly obscured.");
	}
	//Med libido variant
	else if(pc.libido() < 66)
	{
		output("but what you see when you look down has you flushing hotly.");
		output("\n\nThe latex-like surface of the material has thickened in all the right places, transforming the second skin into a sheer, smooth bodysuit. Your [pc.nipples] are still clearly visible, though more as enticing outlines than perfect, black copies. As you look at them, they seem to thicken somewhat, becoming even more visible, perhaps as a reaction to your own not-so-pure thoughts.");
		//Dick
		if(pc.hasCock())
		{
			output("\n\nYour [pc.cocks] fare");
			if(pc.cockTotal() == 1) output("s");
			output(" little better. The suit’s strange material has wrapped around ");
			if(pc.cockTotal() == 1) output("it");
			else output("them");
			output(" a little more thickly, perhaps to conceal some of ");
			if(pc.cockTotal() == 1) output("its");
			else output("their");
			output(" shape, though more likely just to enhance the appearance of ");
			if(pc.cockTotal() == 1) output("its");
			else output("their");
			output(" size. In addition, the onyx coating seems to have merged into the layers on your abdomen, holding your [pc.cocks] tight to your [pc.belly]");
			if(pc.hasStatusEffect("Genital Slit")) output(" when erect");
			output(".");
			if(pc.balls > 0) output(" Your [pc.balls] are similarly suspended, keeping things nice and tight for convenience - but on display for pleasure.");
		}
		//pussy
		if(pc.hasVagina())
		{
			output("\n\nShining, pussy-shaped ebony is all that hides your womanhood");
			if(pc.totalVaginas() > 1) output("s");
			output(", and it does a poor job at that. Sure, the material has filled in dramatically, but anyone who looks ");
			if(pc.legCount > 1) output("between your [pc.legs]");
			else output("down there");
			output(" is going to see the perfectly smooth line");
			if(pc.totalVaginas() == 1) output(" of a latex-bound box");
			else output("s of latex-bound boxes");
			output(". Worse, you swear the material is getting thinner the longer you look down there, like it secretly wants to advertise to everyone just how absurdly fuckable you are.");
		}
		//Neither
		if(!pc.hasGenitals())
		{
			output("\n\nYou can feel that your [pc.asshole] is no longer so completely exposed, but the perfectly-smoothed surfaces of your cheeks don’t do much to hide it. Whenever you move, you can feel them come apart, exposing the shape of your rectal entrance, if not the details themselves. It’s like the suit is tighter around your sides, trying to tug your cheeks apart, giving you the appearance of a nearly shameless buttslut. You shudder to imagine what sort of show you’ll be giving just by [pc.moving] away.");
		}
		//Merge
		output("\n\nAt least you’re technically decent. Only the most prudish worlds would be able to come up with a crime for [pc.walking] around completely covered.");
	}
	//High libido variant
	else
	{
		output("but what you see when you look down has you flushing with fresh excitement.");
		output("\n\nYour latex-like coating has continued to thicken during your slumber, exchanging perfect detail for a sleeker, mirror shine. Your whole body looks glossy and polished. Why, you can even see your reflection in your [pc.chest]. It stares back up at you with a lusty look in its eyes. Protruding forth massively, your [pc.nipples] do their best to distort the image. They’re too smooth and puffy, too lacquered with latex to appear as anything more than ornaments on a sex-toy. Their very existence is an invitation to touch, begging anyone who looks in their general direction to pinch one and lead you around by the tingling bundle of nerves.");
		//Dick
		if(pc.hasCock())
		{
			output("\n\nBetter still ");
			if(pc.cockTotal() == 1) output("is");
			else output("are");
			output(" your [pc.cocks]. ");
			if(pc.cockTotal() == 1) output("It looks");
			else output("They look");
			output(" better than ever before now that ");
			if(pc.cockTotal() == 1) output("it’s");
			else output("they’ve");
			output(" been suitably adorned in your shining suit, thicker and fatter with each vein and feature highlighted by a glossy surface that just begs to be slathered in spit, pussy-juice, or a mix of both. Even when completely soft, the added artificial sturdiness should keep them jutting forward in a perfect advertisement of your capability as a mate. The strange material is far more capable than any real latex or rubber ever could be. It looks perfect and smooth when you’re small, and when you get hard, like now, it expands right alongside your [pc.cocks], perfectly mated to your mating tool");
			if(pc.cockTotal() > 1) output("s");
			output(".");
		}
		//Vagina
		if(pc.hasVagina())
		{
			output("\n\nGlossy and prominent, your [pc.vaginas] seem");
			if(pc.totalVaginas() == 1) output("s");
			output(" to jut outward, flush as if ");
			if(pc.totalVaginas() == 1) output("it has");
			else output("they’ve");
			output(" spent the last hour being aggressively teased and fondled. [pc.EachClit] appears just as swollen if not more, proudly standing out from ");
			if(pc.totalClits() == 1) output("its hood");
			else output("their hoods");
			output(", able to feel even the most minute breeze blowing by. You shudder at what it would feel like to have someone blow on ");
			if(pc.totalClits() == 1) output("it");
			else output("them");
			output(". Most wonderfully of all, your erotic exterior coating still permits your feminine moisture through - and you expect it will allow cum through just as easily.");
		}
		//Butthole
		output("\n\nThough it remains steadfastly hidden from your view, you can feel the changes in your [pc.asshole] as well. The shiny black goo has very obviously thickened around the edge of your rim, making it feel bloated and swollen - all while transmitting sensation more effectively than your own skin. You touch it once, just to feel and gasp. It’s like a fat little donut with a crinkly hole in the middle, ready to stretch around anything you dare to put inside. What’s more, the way contact is sending lewd little shivers up your spine is decidedly distracting");
		if(pc.hasVagina()) output(", almost vaginal in nature.");
		else output(". You imagine that it isn’t far off from a pussy... only in your butt.");

		//Merge
		output("\n\nThe strangest thing is that you are technically ‘decent’ by the U.G.C.’s vague standards. Clean, sterile black covers every part of your body from the neck down. Of course, coverage doesn’t equal concealment, but here on the frontier, you doubt anyone will care. You can [pc.walk] around showing off your body to the whole universe 100% of the time, even fuck in it, apparently, all without a care in the world.");
		if(pc.exhibitionism() >= 66) output(" Stars, this is truly the perfect piece of clothing.");
		else if(pc.exhibitionism() >= 33) output(" The thought gives you a naughty thrill. Are you really that much of an exhibitionist?");
		else output(" The thought gives you a nervous thrill. Sure, it’s sexy as hell, but doing that would turn you into some kind of exhibitionist.");
	}
	//Merge
	output("\n\nThe collar chimes, and a demure voice purrs, <i>“Initial configuration and neural interface complete. Congratulations on the purchase of your new Omnisuit, the ultimate in wearable technology. To remove, simply press the stud on the control collar. No other manual control is needed - the Omnisuit will shape itself to match your desires, all while ensuring that tactile sensation exceeds that of uncovered skin.”</i> There’s a long pause, followed by a second message, <i>“This prototype is not for resale or display in any fashion. Violation of your NDA may result in significant legal penalties.”</i>");
	output("\n\nGood thing you didn’t sign any NDA. You must admit that it does look pretty good, and with its current design, you won’t have a problem [pc.walking] around the more prudish parts of the galaxy.");
	if(pc.libido() < 33)
	{
		output(" As an experiment, you imagine yourself about to have sex, curious what will happen. Nothing happens at first, but when you truly focus in on the fantasy");

		output(", the suit’s rubbery surface thins, exposing your [pc.nipples]");
		if(pc.hasCock() || pc.balls > 0 || pc.hasVagina()) output(",");
		output(" ");
		if(pc.hasCock()) output("[pc.cocks], ");
		if(pc.balls > 0) output("[pc.balls], ");
		if(pc.hasVagina()) output("[pc.vaginas], ");
		output("and [pc.asshole]. They’re still coated in a thin veneer of inky blackness, but that’s a bonus, right? Every inch of shrink-wrapped flesh is enticingly, distractingly sensitive. If you aren’t careful, you’re going to waste the whole day away masturbating.");
	}
	else if(pc.libido() < 66)
	{
		output(" As an experiment, you imagine yourself about to have sex, curious how the suit will respond to such thoughts. The reaction is almost too fast. Latex flows like water");
		if(pc.hasCock()) output(", releasing your [pc.cocks] to spring out");
		if(pc.hasVagina()) 
		{
			output(", freeing your vaginal lips to part in anticipation, revealing the onyx-sheathed interior");
			if(pc.totalVaginas() > 1) output("s");
			output(" of your cunt");
			if(pc.totalVaginas() > 1) output("s");
		}
		if(!pc.hasGenitals()) output(", properly exposing the opening of your rubber-wrapped asshole.");
		else output(". Your rubber-wrapped asshole clenches the moment you feel it become exposed to the air.");
		output(" In addition, your [pc.nipples] gain in resolution second by second, freed from the thick layers of latex");
		if(pc.hasNormalNipples() || pc.hasInvertedNipples() || pc.hasNippleCocks() || pc.hasTentacleNipples()) output(" to stand proud and hot,");
		else output(" and");
		output(" ready to be fondled. Well, at least you can fuck in this thing. You brush a thigh and shudder at just how pleasant and wonderful it feels. And if your thigh feels like that... No. You stop yourself before you wind up losing the whole day masturbating to a latex-fetishist’s wet dream.");
	}
	else
	{
		output(" You consider desiring the suit to change shape, but shrug after regarding your enhanced attributes. You like to get fucked... a lot, and you can’t imagine a world where a line of potential partners aren’t following you around, waiting their turn for a chance... not while you’re wearing this.");
	}
	statOutOmniCollar();
	output("\n\nOr you could push the button and take it off.");
	IncrementFlag("OMNISUITED");
	pc.armor.onEquip(pc);
	processTime(22);
	pc.orgasm();
	pc.libido(1);
	pc.unlockItemSlot(GLOBAL.ARMOR);
	buttonWrapUpForOmnisuit();
}

public function omnisuitChangeUpdate():void
{
	//Low libido -> med
	if(pc.armor.defense == 3 && pc.libido() >= 33)
	{
		AddLogEvent("Your Omnisuit begins to thin out, showing more of your body with each passing second. You soon realize that it’s changing to put your body on display, brazenly showing your sexual attributes while still keeping you legally clothed. You suppose it could be worse - it does seem to mask some of the finer details. Perhaps the suit is responding to your enhanced libido?", "passive");
		statOutOmniCollar();
	}
	//Medium libido to high
	else if(pc.armor.defense == 2 && pc.libido() >= 66)
	{
		AddLogEvent("You feel the pleasant tingle of your Omnisuit tightening down, tugging more tightly against your [pc.nipples], your hips, and even your butt. The strange, latex-like material shifts on your ", "passive");
		if(pc.hasCock()) ExtendLogEvent(ParseText("[pc.cocks], fattening around the veins, highlighting every feature in stark, black perfection."));
		else if(pc.hasVagina()) ExtendLogEvent(ParseText("[pc.vaginas], fattening around the lips, highlighting your femininity in stark, black perfection."));
		else ExtendLogEvent(ParseText("[pc.asshole], fatting around the ring, thickening your pucker into a shining, fuckable donut."));
		ExtendLogEvent(" And that isn’t the only place that changes. All over, the suit becomes subtly more lewd, shifting to better display your body. You’ve become a walking advertisement for sex, perhaps as a response to your ever-heightening libido.");
		statOutOmniCollar();
	}
}