//Old Room Desc (Replaced With Below)
//output("At the top of the stairs is a small, cozy room decorated with several hunting trophies, swords, old-earth guns, and a large wooden desk with a subtly built-in holoterminal. Behind is sits an abnormally flat-chest cow-girl, barely sporting D-cups, dressed much more conservatively than the scantily (if at all) clad cows on the ranch proper. <i>“Are you here to see Mr. T.?”</i> she asks, looking up from her work, <i>“He’d be happy to see you. Go on through.”</i>");

// Preg flag doc
/*
"ZEPHYR_KIDS_KNOWN" => State of "knowing" about having Zephs kids
*/

public function zephAtNursery():Boolean
{
	if (flags["ZEPHYR_KIDS_DAYCOUNTER"] == undefined) return false;

	// For the first 2 days out of every 7, starting on the day the PC first gives birth to Zephyrs kids, Zephyr will be at the PCs nursery.
	
	var dayDiff:Number = days - flags["ZEPHYR_KIDS_DAYCOUNTER"];
	dayDiff = dayDiff % 7;
	
	return (dayDiff < 2);
}

public function zephKnowsAboutKids():Boolean
{
	return flags["ZEPHYR_KIDS_KNOWN"] != undefined || ChildManager.numOfUniqueType(ZephyrUniqueChild) > 0;
}

//New Room Desc
public function zephyrRoomBonus():Boolean
{
	output("At the top of the stairs is a cozy room decorated with several hunting trophies, swords, old-earth guns, and a large wooden desk with a subtly built-in holoterminal. A taxidermied bear is tucked into the corner, menacing over everything, its mouth locked in a menacing rictus grin. There’s even a furry rug, made from the hide of some local beast or varmint. The rustic atmosphere is as inescapable as a prison world.");

	if (zephAtNursery())
	{
		output("\n\nThe room is empty, Zephyr’s imposing desk left unmanned owing to maternal leave. You can catch her on Tavros if your timing’s good, but otherwise it’s just you and her empty room unless you want to visit Big T.");
		if (flags["ZEPHYR_PICSWTHEKIDS"] != undefined) output(" With a smile, you can see Zephyr has the pictures you sent her from the Nursery proudly displayed on her desk, turned to face inwards.");
		return false;
	}
	
	//showBust("ZEPHYR");

	//Room Blurb
	//Not introduced
	if (zephKnowsAboutKids())
	{
		output("\n\nZephyr is seated behind the desk until she sees who’s bumbled into her office, immediately rising from her chair and smiling.");
		output("\n\n<i>“[pc.name]! Nice of you to stop by,”</i> she says, walking over and giving you a big hug. She smells delicious. <i>“What’re you here for?”</i>");
		output("\n\nYou chitchat idly while she settles back down behind her desk, gazing at you lovingly and paying rapt attention.");
		if (flags["ZEPHYR_PICSWTHEKIDS"] != undefined) output(" Smiling inwardly, you can see Zephyr has the pictures you sent her from the Nursery proudly displayed on her desk, turned to face the proud bullwoman.");
		addButton(0, "Zephyr", approachZephyr, true);
	}
	else if(flags["MET_ZEPHYR"] == undefined)
	{
		output("\n\nSeated at the imposing desk is an equally imposing woman. Even seated, she fills the room, looming above and beyond the average cow-girl. She looks your way with a firm, unwavering gaze, waiting for you to step forward and explain why you’ve barged into her office.");
		addButton(0,"Secretary",approachZephyr,true);
	}
	//Annoyed
	else if(pc.hasStatusEffect("Zephyr Annoyed"))
	{
		output("\n\nZephyr, the secretary, looks up at you and snorts, waving dismissively at you. If you want anything from it her, it might be best to wait until she cools off.");
		addDisabledButton(0,"Zephyr","Zephyr","Zephyr annoyed. You should probably wait to approach her until she’s in a better mood.");
	}
	//Fuckin’ Mad
	else if(flags["ZEPHYR_PISSED"] != undefined)
	{
		output("\n\nZephyr, the secretary, is seated behind the desk, glaring at you. She doesn’t look pleased to see you in her office. You doubt you’d get anything out of trying to talk to her.");
		addDisabledButton(0,"Zephyr","Zephyr","Zephyr is pissed at you. Any interaction with her would end poorly.");
	}
	//Introduced
	else
	{
		output("\n\nZephyr, the secretary, is seated behind the desk, looking at you expectantly. She doesn’t seem any more pleased to see you than the last time you were here.");
		addButton(0,"Zephyr",approachZephyr,true);
	}
	return false;
}

public function showZephyrDeets(nakkers:Boolean = false):void
{
	if(nakkers) showBust("ZEPHYR_NUDE");
	else showBust("ZEPHYR");
	showName("\nZEPHYR");
	author("Fenoxo");
}
public function getZephyrPregContainer():PregnancyPlaceholder
{
	var ppZephyr:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppZephyr.breastRows[0].breasts = 2;
	ppZephyr.breastRows[0].breastRatingRaw = 35;
	ppZephyr.milkType = GLOBAL.FLUID_TYPE_MILK;
	ppZephyr.milkMultiplier = 100;
	ppZephyr.milkFullness = 100;
	if(!ppZephyr.hasCock()) ppZephyr.createCock();
	ppZephyr.shiftCock(0, GLOBAL.TYPE_CANINE);
	if(flags["ZEPHYR_THROBBED"] == undefined)
	{
		ppZephyr.cocks[0].cLengthRaw = 9;
		ppZephyr.cocks[0].flaccidMultiplier = .6;
	}
	else
	{
		ppZephyr.cocks[0].cLengthRaw = 18;
		ppZephyr.cocks[0].flaccidMultiplier = .75;
	}
	ppZephyr.ballFullness = 75;
	ppZephyr.impregnationType = "ZephyrPregnancy";
	return ppZephyr;
}

//Approach
public function approachZephyr(approached:Boolean = false):void
{
	clearOutput();
	showZephyrDeets();
	//First Time
	if (zephKnowsAboutKids())
	{
		output("Zephyr smiles as you approach. <i>“Business or pleasure? For you, I’ve got time for both.”</i>");
	}
	else if(flags["MET_ZEPHYR"] == undefined)
	{
		flags["MET_ZEPHYR"] = 1;
		output("You step on up to the desk");
		if(pc.isBro()) output(", smiling self-assuredly");
		else if(pc.isNice() || pc.isMischievous()) output(", wearing a friendly smile");
		else output(", nodding slightly in acknowledgement");
		output(". <i>“Heya.”</i>");

		output("\n\nThe buxom redhead behind the desk scowls back at you. <i>“Big T isn’t in right now.”</i>");
		output("\n\nRaucous laughter booms from an adjoining room - the one whose door is marked ‘Benjamin Tiberius Tee’.");
		output("\n\nShe rolls her eyes and explains in a sarcastic, deadpan tone, <i>“He must have snuck back in when I wasn’t looking, but he’s busy now. Besides, he doesn’t want to meet just anyone.”</i>");
		output("\n\nThat forceful, masculine voice bellows out again, this time not in laughter but in friendly-sounding speech. <i>“Zephyr, do we have visitors? I want to meet ‘em!”</i>");
		output("\n\nSnarling under her breath, the cow-girl - Zephyr - pushes back her chair and rises to her full, nine foot height before shouting, <i>“Fine, but they don’t want to see you!”</i> She turns to you as you start to reply. <i>“Shut it. The Governor doesn’t have time to chat with every Tom, Dick, and Harry that manages to stumble through customs. Don’t even get me started on his choice to plant his base of operations at a high-class tourist destination.”</i>");
		output("\n\n<i>“I’m not buying it, Zeph. You send ‘em back if they want to say hi. Don’t be welshing out on our bet now.”</i> There’s a touch of irritation in the Governor’s voice.");
		output("\n\nZephyr grits her teeth, glaring at the door behind her so intently that you fear it might burst into flame. <i>“Fine!”</i> She turns back to you, hands tucked under a bosom as over-sized as the cow-girl it’s attached to. <i>“You wanna meet Big T? Fine.”</i> Exasperation is plain on her face. <i>“Just don’t waste too much of his time. There’s a half-dozen proposals he needs to review before the day is out.”</i> <b>The door to the north clicks. Zephyr has deactivated the lock.</b>");
		output("\n\nWell... that was something. Zephyr seats herself and sighs, no longer paying attention to you. You could probably chat her up if you wanted.");
	}
	//From Another Menu
	else if(!approached)
	{
		output("Zephyr brushes her ruby tresses out of her eyes. <i>“Are you still here? The door is that way.”</i>");
	}
	//Repeat
	else
	{
		//Unfucked
		if(flags["SEXED_ZEPHYR"] == undefined)
		{
			output("The corners of Zephyr’s mouth quirk up in an amused smile at the sight of your approaching form. <i>“Look, it’s super flattering, but I’ve got something like,”</i> she flips through a pile of paperwork, <i>“three dozen forms to fill out.”</i> She looks at you again. <i>“Okay, okay, I can squeeze in a quickie, but only if we hurry.”</i>");
		}
		//Fucked
		else
		{
			output("Zephyr smirks at the sight of you. <i>“Back for more, huh? You insatiable slut.”</i> The buxom cow-girl stretches, her bust straining at her classy suit. <i>“I could squeeze you in if you really need it.”</i>");
		}
	}
	clearMenu();
	addButton(0,"Talk",talkToZephyr,undefined,"Talk","Talk about some stuff, why not?");
	if(pc.lust() >= 33) addButton(1,"Sex",zephyrSexMenu,undefined,"Sex","Why not?");
	else addDisabledButton(1,"Sex","Sex","You aren’t aroused enough for sex.");
	addButton(14,"Back",mainGameMenu);
}

//Sex
public function zephyrSexMenu(display:Boolean = true):void
{
	clearOutput();
	showZephyrDeets();
	//Unfucked and not talked to about her dick
	if(flags["SEXED_ZEPHYR"] == undefined && flags["ZEPHYR_TREATMENT_TALKED"] == undefined)
	{
		output("Grinning now, Zephyr says, <i>“I’m not your average cow-girl, you know.”</i> She stands up, revealing a surprisingly decent skirt and muscular legs that could probably propel her through a set of squats with you on her shoulders. <i>“Sure, I’ve got to hit the milkers every now and again, but I’m no dribbling idiot like most girls ‘round these parts.”</i> She leans over the desk, her tits visible through the v-neck beneath her business-like jacket. <i>“I’m bigger. I’m stronger. I’m smarter. I’m driven. And... I’ve got some gene-work done.”</i>");
		output("\n\nShe catches the hem of her skirt with a finger and gently tugs it upward, revealing a rapidly-fattening length of ruby-red, bulbous dog-cock. <i>“They call me an amazon.”</i> She lets the fabric drop for now, the shape of her growing, animalistic phallus clearly outlined in the garment. <i>“Still think you can handle me?”</i>");
	}
	//Unfucked but talked about her dick
	else if(flags["SEXED_ZEPHYR"] == undefined && flags["ZEPHYR_TREATMENT_TALKED"] != undefined)
	{
		output("Grinning now, Zephyr stands up from behind her desk. She bends low over it, one hand on the finished hardwood to support herself, immense breasts swaying hypnotically even under the layers of her fairly classy suit jacket. <i>“So even knowing I’m packing cock for days, you still want me to bend you over the desk?”</i>");
		if(pc.isTreated()) output(" She shakes her head. <i>“Of course you are, you’re treated.”</i>");
		else output(" She pokes you in the chest. <i>“You’re brave. That’s a quality I can respect.”</i>");
		output("\n\nA slow-growing bulge is spreading down the front of her skirt, promising to lift the hem before long. <i>“Now, how to play with you...”</i>");
	}
	//Fucked
	else
	{
		if (!zephKnowsAboutKids())
		{
			output("Grinning now, Zephyr rises up out of her seat. <i>“I suppose ‘squeeze it into you’ would be more apt.”</i> She leans low over the desk, one hand braced against the polished hardwood for support, her tits threatening to drag piles of notes to the floor. <i>“Since I’m feeling magnanimous today, how would you like me to take you today?”</i>");	
		}
		else
		{
			output("<i>“Thought you’d never ask,”</i> Zephyr says with a grin, rising from her seat. <i>“Honestly, the moment you walked in here I wanted to");
			if(!pc.isNude()) output(" tear off your clothes and");
			output(" fuck you up against the wall. Can’t help the amazon urges, especially not with </i>you<i>.”</i>");
		}
		output("\n\nAn obvious bulge begins threatening the structural stability of her skirt.");
	}
	clearMenu();
	if(pc.hasCock()) addButton(1,"MutualHJs",mutualHandJobsWithZephyr,undefined,"Mutual Handjobs","Jerk each other off why not.");
	else addDisabledButton(1,"MutualHJs","MutualHJs","You need a dick for mutual handjobs.");
	addButton(0,"Get Fucked",overDeskButtCatch,undefined,"Get Fucked","Get bent over her desk and fucked.");
	if(pc.hasTailCunt()) addButton(2,"Use Tailcunt",cuntTailPlusZephyrIntro,undefined,"Use Tailcunt","Let Zephyr use your tailcunt. It could use a snack.");
	else addDisabledButton(2,"Use Tailcunt","Use Tailcunt","You don’t have a tailcunt to play with.");
}

//Mutual HJs
public function mutualHandJobsWithZephyr():void
{
	clearOutput();
	showZephyrDeets(true);
	//Maybe she just laughs at you if you suggest this. Or maybe mutual handjob?
	output("You mention that you wouldn’t mind helping her relieve some of the pressure that she’s undoubtedly built up... if she does the same for you.");
	output("\n\nZephyr sighs and pats the top of her desk. <i>“Handjobs are just masturbation masquerading as something fun, but I guess its better than holding it in all day.”</i> She flicks a catch on the side of her skirt, pulling the offending fabric out of the way. She’s not wearing any panties. Her dog-cock is only partway hard, and it’s already jutting up a good seven inches or so. It’s still growing before your eyes, already leaking a strand of pre-cum down the underside. She must be really pent up!");
	output("\n\nThe amazon glares at you. <i>“You can stare at my dick while you’re jacking me off. Get over here.”</i> She thumps her hand on the table, making a variety of writing implements nearly jump out of their container. <i>“Come on. I don’t wanna spend all day fucking around like the Governor.”</i>");
	output("\n\nYou ");
	if(pc.isCrotchGarbed()) output("wiggle out of your [pc.lowerGarments] and ");
	if(pc.isTaur()) output("canter over, bending so that she can get at your rear-mounted genitalia while you tend to her.");
	else {
		output("hop up on a clear spot on her desk");
		if(pc.legCount > 1) output(", spreading your [pc.legs] to make sure she’ll have plenty of room to access your [pc.cocks].");
		else output("arranging your [pc.leg] to make sure you don’t knock too much of her work off.");
	}
	output(" There’s no concealing your own burgeoning stiffness or the way it makes your [pc.cocks] point toward her.");

	output("\n\nZephyr licks her lips and reaches out, then stops. She checks her movement, instead grabbing you by the wrist and hauling your hand onto her growing prick.");
	output("\n\nYou obligingly curl your fingers about the pulsating, thickening rod, marvelling at just how hot it feels. This girl’s got a furnace in her crotch - one that’s getting bigger and warmer with each dick-swelling heartbeat. The crimson cock quivers, oozing pre-cum across your fingers, and you haven’t even started stroking yet!");
	output("\n\n<i>“Ahhh, there we go,”</i> Zephyr sighs. <i>“Let’s see what we’re dealing with.”</i>");
	output("\n\nThe busty cow-bitch reaches over");
	var x:int = rand(pc.cockTotal());
	if(pc.cockTotal() > 1) output(", selecting [pc.oneCock] seemingly at random");
	else output(", wrapping her hand around your [pc.cock]");
	output(". She squeezes it, rubbing her finger along the underside, feeling it expand beneath her curious fingertips.");
	//horsecock
	if(pc.cocks[x].cType == GLOBAL.TYPE_EQUINE) 
	{
		output("\n\n<i>“Oh, somebody’s a bit of a stud, aren’t they?”</i> She caresses the medial ring");
		if(pc.hasSheath(x)) output(", even dipping down to tug at the sheath");
		output(". <i>“I’ve always had a soft spot for horse-cocks");
		if(!pc.hasKnot(x)) output(", but they’re nothing without a knot.”</i> Her fingers dance in slow circles around the base. <i>“You should grow one, you know - get a nice, fat knot to really make your mares sing.”</i>");
		else output(", especially ones with the good sense to grow a knot.”</i> Her fingers fondly dance in slow circles around the bulbous knot. <i>“Nothing makes a mare’s cunt sing like feeling that flare pressing on her in her deepest recesses while your knot locks every drop of cum inside.”</i> She shivers. <i>“If there’s no knot, why bother?”</i>");
	}
	//Dogcock
	else if(pc.cocks[x].cType == GLOBAL.TYPE_CANINE)
	{
		output("\n\n<i>“Oh, somebody’s got good taste.”</i> She fondly caresses your shaft, particularly the bulb of your knot. <i>“Dog dicks? These work great for both partners. The bitch gets to feel herself absolutely </i>flood<i> with cum, not wasting a drop, and the lucky stud - or studdess - gets absolute, perfect tightness to enjoy for at least fifteen minutes, if not a whole hour.”</i> Zephyr looks a little wistful. <i>“Shame we’re just jacking off.”</i>");
	}
	//Has a knot on some other dick
	else if(pc.hasKnot(x))
	{
		output("\n\n<i>“Oh, what’s this?”</i> She smiles as she fondly works over your shaft, particularly the bulbous curves of the knot at its base. <i>“Not every day I see one of these, particularly with such a delicious addition.”</i> Her thumb caresses the knot while her fingers gently dance up and down the length. <i>“I bet it swells up nice and big when you cum, doesn’t it?”</i> She grins lecherously, her own cock suddenly firmer in your own hand. <i>“Don’t tell me. It’s more fun to find out on my own.”</i>");
	}
	//Catcock
	else if(pc.cocks[x].cType == GLOBAL.TYPE_FELINE)
	{
		output("\n\n<i>“Oh, you’ve got one of these?”</i> She seems a little offput but strokes across the nubby <i>“barbs”</i> all the same. <i>“I never much got the appeal of these. They look kind of silly - like somebody’s twisted idea of a sextoy. I mean honestly, that much stimulation inside you can get a little overwhelming, and there is such a thing as too much.”</i> She plays at pinching one of the nubs, though her pressure never gets high enough to approach pain. <i>“You could do better.</i>");
	}
	//Human
	else if(pc.cocks[x].cType == GLOBAL.TYPE_HUMAN)
	{
		output("\n\n<i>“Oh, still packing some human meat, huh?”</i> She caresses it with the kind of familiarity that only a terran could. <i>“It’s a safe choice I guess, but have you ever thought about... you know, making it something a little better? There’s this stuff out there that’d grow you a nice knot... something to really make a girl squeal while you cum.”</i> She tickles it just around the base where a hypothetical knot could grow in. <i>“Could you imagine how it would feel, feeling her squeeze down on that while you pumped her full of cum.”</i>");
	}
	//Generic alien
	else
	{
		output("\n\n<i>“Oh, something new, huh?”</i> She seems a little unsure of just how to handle it at first, but soon settles into an easy up-and-down motion. <i>“I can’t say I see these often, but...”</i> She pauses, caressing over every inch to get a feel for it. <i>“...how can you truly enjoy having something so exotic without being able to knot your partner? There’s just something so erotic about having a lover helplessly bound to you while you knock her up.”</i>");
	}
	//Merge
	output("\n\nYou return the favor, giving her a few enthusiastic pumps. She leaks pre from her slightly pointed tip immediately, soon coating your palm in a layer of excitement that makes stroking her that much easier. Zephyr slouches lower in her chair, lifting her hips to meet your downward strokes.");
	output("\n\nThe amazon’s own hand accelerates apace with her mounting ardor, revealing a firm grip that could easily harm as it does pleasure. You groan. For all her strength, her hand is smooth and supple, providing a sensuous sleeve for your [pc.cock " + x + "] to subsume itself in. She contours her digits to provide you with the perfect amount of friction; there’s just enough to make your dick surge without rubbing you raw.");
	output("\n\nZephyr’s eyes keep half-rolling back into her head before she catches herself and drags her gaze over to your increasingly rigid erection. <i>“Not bad... uh... mmm...”</i>");
	output("\n\nHer knot twitches against your fingers, and the flow of pre nearly doubles.");
	output("\n\n<i>“Tighter.”</i> Her voice is somewhere between pleading and commanding. The cow-girl looks like she’s having trouble controlling herself. Even her strokes are getting less coordinated, making up for the diminished skillfulness with fast-pumping fervor. She pauses to spit on her palm and goes right back into, mixing her saliva with your own pre-cum into a slickened slurry. Wet splatters accompany every downward stroke.");
	output("\n\nPanting now, Zephyr asks, <i>“Are you close?”</i>");
	output("\n\nYou are; it’s taking all you have not to thrust against her hand and see if you can blow your load onto her suit-covered tits. Instead of admitting as much, you try to buy yourself some time. <i>“Are you?”</i>");
	output("\n\nZephyr’s cheeks color, and not just from arousal. <i>“Yes,”</i> she hisses, suddenly jacking you off twice as fast, milking your dick with her palm.");
	output("\n\nEven if you weren’t on the edge, you’d end up blowing soon with this kind of treatment. Worse yet, Zephyr obviously isn’t wearing a bra, and all the motion has her tits quaking so violently that you can’t help but watch. Her coat sprouts two dark stains where little tents have risen up, the only evidence of her nipples. You gasp, unable to withstand the erotic sight and high-powered handjob.");

	var cumQ:Number = pc.cumQ();
	//No cum
	if(cumQ < 5)
	{
		output("\n\nA few drops rolling onto the amazon’s fingers are all the evidence of your ecstasy that your body provides. Maybe you should give yourself a reset and build up some more.");
	}
	//Normal cum
	else if(cumQ < 20)
	{
		output("\n\nYou squirt [pc.cum] ");
		if(pc.isTaur()) output("all over her knees and the floor. Zephyr moans, tugging faster and harder, tugging you like intends to release every drop from its imprisonment in your [pc.balls].");
		else output("up into the air fat bullets, raining them down across her still-stroking fingers. The [pc.cumColor] release is soon mixed up with frothing spit-and-pre lube. Your [pc.cock " + x + "] shines with the stuff.");
	}
	//Centaur big cum
	else if(cumQ < 400 && pc.isTaur())
	{
		output("\n\nYour [pc.cock " + x + "] gives a mightly lurch, dribbling fat bullets of [pc.cum] before erupting a thick rope of orgasmic relief. Again and again, your tauric shoots the [pc.cumVisc] goo over Zephyr’s knees as well as the floor. A puddle of your evidence collects between her feet, but she doesn’t seem to mind, tugging you until only the barest trickles of [pc.cum] remain.");
	}
	//Human big cum
	else if(cumQ < 400) output("\n\nYour [pc.cock " + x + "] lurches in Zephyr’s grip, launching a rope of [pc.cum] so long that it’s still shooting out when the front spills across her knuckles. You buck against her, repeating the process again, thoroughly sliming her hands with your copious seed. She keeps going, mixing your [pc.cumNoun] in with the spit-and-pre until your [pc.cock " + x + "] shines with it. Neither of you pays much attention to the growing puddle beneath you.");
	//Centaur Huge cum
	else if(pc.isTaur()) output("\n\nZephyr nearly lets go when she feels your urethra bulge between her fingers. To her credit, she holds on, giving herself a front-row seat to an incredibly messy climax. She gasps when the first rope shoots out, long and thick enough to fill a glass in seconds. The amazon recovers while your first lance splatters against the floor, grabbing your [pc.cock " + x + "] in both hands and milking it for all she’s worth, too excited to care that you’re splattering her knees or threatening to overwhelm the drain in the floor.");
	//Human huge cum
	else output("\n\nZephyr nearly lets go when she feels your urethra bulge between her fingers. To her credit, she holds on, staring in awe when you launch a rope of cum thick enough to fill a glass. The amazon recovers just in time for your second eruption, pumping it so fast that the stream breaks apart as it emerges from your [pc.cockHead " + x + "], raining down across her hand, arm, tits, and face. Most gets on the desk and floor, but she keeps jacking all the same, marvelling at the way the drain in the floor struggles to keep up with your virility.");
	
	//Merge
	output("\n\nThe bright red phallus in your hand ");
	if(cumQ < 40) output("easily outshines your meager attempt");
	else output("follows your example");
	output(". Growing larger by the second, the amazon’s knot balloons up to its full size, almost three times as thick as her shaft. She spurts cum as soon as the bulge stops swelling. Her pearly streams emerge with surprisingly little force behind them, pouring over your hand like a waterfall of sexual release.");
	output("\n\nIt’s difficult to maintain the rhythm while your own orgasm is winding down, but you do your best to give her knot affectionate squeezes, ensuring she’s pouring seed until her legs are dripping with it. Even the chair has gained white spots. It’d fit right in with the cow-girls here. And the floor? The drain gurgles noisily under ");
	if(cumQ >= 20) output("your combined liquid loads");
	else output("the liquid load");
	output(".");
	
	output("\n\nSpent, you both sag back, [pc.cumNoun]-soaked palms slipping from wilting genitals.");
	output("\n\nZephyr wipes her hand clean with a rag");
	if(!pc.isTaur() && cumQ >= 20) output(", turning to her carelessly creamed desk");
	output(". She seems a little irritated by the mess, but satisfied all the same.");
	output("\n\n<i>“Not bad. Now get out. Thanks to you I have a bunch of cleaning to do before I can get any real work done.”</i> Zephyr gathers a dab of [pc.cumNoun] from your thigh and sucks it into her mouth, humming. <i>“You’re welcome to come back for more if you like.”</i>");
	output("\n\nYou might have to do that.");

	processTime(22);
	IncrementFlag("SEXED_ZEPHYR");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Overdesk Catch It In Yer VagOrButt [Unfinished]
public function overDeskButtCatch():void
{
	clearOutput();
	showZephyrDeets(true);
	
	var ppZephyr:PregnancyPlaceholder = getZephyrPregContainer();
	var x:int = -1;
	if(pc.hasVagina())
	{
		x = pc.findEmptyPregnancySlot(1);
		if(x < 0) x = rand(pc.totalVaginas());
	}
	var fits:Boolean = false;
	if(x < 0) { if(pc.analCapacity() >= 600) fits = true; }
	else { if(pc.vaginalCapacity(x) >= 600) fits = true; }
	var cow:Boolean = (pc.isTreatedCow() || pc.isCumCow() || pc.isFauxCow() || pc.race().indexOf("cow") != -1);
	var capacity:Number = (x >= 0 ? pc.vaginalCapacity() : pc.analCapacity());

	output("You mention that she could bend you over the desk and take you right here.");
	output("\n\nZephyr strides around the desk with a swiftness and grace belied by her imposing form. <i>“Now you’re speaking my language.”</i> Grabbing you by the neck with one hand, she pushes you down toward the top, her unoccupied fingers releasing the clasp at the side of her skirt. You turn your head to keep the eager amazon from breaking your nose and get a good look at her crotch in the process.");
	output("\n\nOf course, she’s not wearing any panties, not with a fat hound-sausage like that between her legs. It’d destroy panties on contact.");
	if(pc.lowerUndergarment.shortName != "") output(" You suddenly fear for your own.");
	output(" You’d guess it’s");
	if (flags["ZEPHYR_RAWDOGGED_PUSS"] == undefined) output(" seven");
	else output(" eleven");
	output(" inches long right now, but there’s no way its at full size yet - it’s still hanging down, pointed at the floor. Every second or so it twitches, getting thicker, veinier, and redder. It protrudes from her forgotten slit, stretching her clitoral hood into an exotic-looking sheath. Just above its root, a");
	if (flags["ZEPHYR_RAWDOGGED_PUSS"] == undefined) output(" slight");
	else output(" large");
	output(" bulb appears at its base, obviously a canine knot.");
	output("\n\nYou whimper, knowing that tennis ball-sized orb is going to be expanding inside you.");
	output("\n\n<i>“Now, now. Being anxious will only make me have to push that much harder.”</i> The hand holding you to the desk");
	if(pc.isCrotchGarbed()) output(" tightens while she yanks your [pc.lowerGarments] aside, revealing your [pc.butt]");
	else if(pc.hasHair()) output("strokes your [pc.hair]");
	else output("strokes your head");
	output(". <i>“If you relax, we can both enjoy this.”</i>");

	output("\n\nThe bitch-breaking length between her legs is well past a foot long and rising with bobbing, upward jerks, the head oozing a clear droplet of pre-cum already.");
	output("\n\n<i>“Either way, </i>I’m<i> going to enjoy it.”</i>");
	output("\n\nYou nibble at your own lip and nod acceptingly. ");
	if(!fits) output("You’re the one that suggested this; there’s no point in backing out now.");
	else 
	{
		output("As big as she is, you’re pretty sure you can handle it. You whimper again in anticipation. Just the thought of that knot popping inside has you ");
		if(x >= 0) 
		{
			if(pc.wetness(x) >= 4) output("drizzling [pc.girlCumNoun] all over the floor");
			else output("sopping wet");
		}
		else output("clenching in idle anticipation");
		output(".");
	}
	if(pc.legCount > 1) 
	{
		output(" You spread your [pc.legs] a little to give her a clear target");
		if(pc.totalVaginas() > 1) output(", wondering which of your [pc.vaginas] is going to win the cock lottery");
		output(".");
	}
	else 
	{
		output(" You shift and wiggle, making sure you’re lined up just right for her");
		if(pc.totalVaginas() > 1) output(" and wondering just which hole she’ll take");
		output(".");
	}
	output("\n\nThe amazon gives your [pc.butt] a friendly swat, letting her hand rest against your warming cheek. When she squeezes, the grip is firm and confident, kneading you encouragingly. <i>“");
	if(cow) output("Who’s a good cow?");
	else output("Who’s a good little bitch?");
	output("”</i>");
	output("\n\nYou shiver but fail to answer.");
	output("\n\nSmack! Her hand falls across the other side. <i>“I said, who’s a good ");
	if(cow) output("cow");
	else output("bitch");
	output("?!”</i>");

	output("\n\n<i>“I... am?”</i>");
	output("\n\nZephyr squeezes your reddened flesh once more, rubbing the tenderized rump like a favored possession. <i>“Damn right, you are. And do you know what good little ");
	if(cow) output("cows");
	else output("bitches");
	output(" get?”</i>");
	output("\n\nYou shake your head, ");
	if(flags["ZEPHYR_FUCKED_PC"] != undefined) output("playing along once more. You want to hear her say it.");
	else output("unsure but hoping the answer is going to be her cock.");
	output("\n\nBreasts drag across your back as the buxom hermaphrodite leans low. <i>“");
	if(!cow) output("Good little bitches get a bone.");
	else output("Good little cows get treated... to a nice, long fuck.");
	output("”</i>");
	
	//[Next]
	pc.changeLust(10);
	processTime(5);
	clearMenu();
	addButton(0,"Next",getFuckedByZephyrII, [ppZephyr, x, fits, cow, capacity]);
}

public function getFuckedByZephyrII(args:Array):void
{
	clearOutput();
	showZephyrDeets(true);
	var ppZephyr:PregnancyPlaceholder = args[0];
	var x:int = args[1];
	var fits:Boolean = args[2];
	var cow:Boolean = args[3];
	var capacity:Number = args[4];

	output("You shiver at the declaration");
	if(pc.hasVagina())
	{
		output(", juicing a little ");
		if(pc.legCount > 1)
		{
			output("between the ");
			if(pc.hasKnees()) output("knees");
			else output("thighs");
		}
		else output("down below");
	}
	output(". You could go for that. In fact... you wiggle your [pc.butt] back against the authoritative cow’s palm, hoping she’ll give it to you already.");
	output("\n\n<i>“Yeah, you’re a good ");
	if(!cow) output("bitch");
	else output("cow");
	output(" all right.”</i> Zephyr kisses you at the nape of your neck. Her lips are hot against your [pc.skinFurScales]. Pulling away, she traces her fingertips down the back of your spine. <i>“Aren’t you?”</i>");
	output("\n\nYou pop your tailbone up a little higher");
	if(pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output(", making your [pc.tails] sway");
	output(". <i>“Yes!”</i>");
	output("\n\nHot, slick flesh presses up against the entrance to your [pc.vagOrAss]. Zephyr is grinning, both her hands finding their place at the border between your [pc.hips] and [pc.butt]. She thumbs at your cheeks, pulling them apart to give her a better view while her red-hot rod is lining up with your ");
	if(x < 0) output("pucker");
	else output("folds");
	output(". Slick, hot, canine-delivered pre coats your excited entrance, dribbling in thin rivulets to spatter the floor beneath her desk. A panting, primal part of you thrills at the knowledge that you’re responsible for the hard piece of dripping meat.");
	if(x >= 0 && pc.wettestVaginalWetness() > 3) output(" Another part wonders just how deep a puddle your own libidinous lubrication has created");
	output(".");
	output("\n\n<i>“You’re gonna be a good cocksleeve.”</i> Zephyr thrusts in on the heels of that declaration, the firm push pressing your [pc.thighs] painfully against the edge of the desk. You barely register the discomfort; you’re too caught up in the feeling of that pointed tip ");

	var stretched:Boolean = false;
	if(x >= 0) { if(pc.looseness(x) >= 4) stretched = true; }
	else { if(pc.ass.looseness() >= 4) stretched = true; }
	if(stretched) output("slipping into your well-stretched entrance");
	else output("spreading you open");
	output(". Your mouth gapes, too overwhelmed by the sensory cascade to function properly. A throaty moan slips out, unbounded by the likes of reason or good sense. You push back. What point is there in resisting?");
	output("\n\nSlipping deeper and deeper, the amazon’s seemingly endless inches tickle nerves that have no business being so sensitive or eager.");
	if(capacity < 550) output(" Her sheer size has you feeling stretched almost painfully tight, like a rubber band about to snap. Your sex-scattered neurons desperately scrape together a thought: what if she breaks you?");
	else if(capacity < 800) output(" Her sheer size has you feeling stretched delightfully tight, like your body was designed to wrap around this one, perfect dick. Your sex-scattered neurons desperately scrape together a thought. How are you ever going to enjoy fucking anyone smaller than this again?");
	else 
	{
		output(" Her size, as impressive as it is, doesn’t even begin to push you towards your boundaries.");
		if(flags["ZEPHYR_THROBBED"] == undefined)
		{
			output(" Your sex-scattered neurons desperately scrape together a thought:");
			if(flags["PENNY_THROBB_PURCHASE_UNLOCKED"] != undefined || flags["PENNY_THROBB_USES"] != undefined || flags["TIMES_THROBB_USED"] != undefined) output(" what if you got her some throbb?");
			else output(" what if you could get her something to make her bigger?");
		}
	}
	output("\n\nZephyr grunts in raw, animal pleasure and stops in an effort to adjust to the touch of your tunnel, huffing excitedly. <i>“Damn, you got an ass on you. You ready for the rest of it?”</i>");
	output("\n\nBetween reveling in the pulsing of her rod and trying to think, you lose track of her question halfway through. <i>“Huh?”</i>");
	output("\n\nA hand crashes down on your reddened derriere like a meteor, shocking you out of your dick-induced haze. You swallow some escaping drool and grasp for the right answer. <i>“...Yes?”</i>");
	if(zephKnowsAboutKids())
	{
		output("\n\nZephyr shakes her head fondly and resumes plowing your with her rigid dick. <i>“Alright, just focus on the breeding, lover. That’s what you’re good at, after all.”</i>");
	}
	else
	{
		output("\n\nZephyr shakes her head and resumes threading her rigid boner deeper into your [pc.vagOrAss]. <i>“Dunno why I bother even involving you in the conversation.");
		if(pc.isTreatedBull()) output(" How bulls like you wound up running this planet, I’ll never understand.");
		else if(pc.isTreatedCow()) output(" Cows like you really got the short end of the Treatment stick.");
		else if(pc.isFauxCow()) output(" You’re just a faux cow after all. If I had it my way, all the boys would be eager, anal sluts like you.");
		else if(pc.isAmazon(true)) output(" You could’ve made something of yourself. Instead you’re bent over my desk and asking for more.");
		else output(" Tourists like you just aren’t built for a proper Texan breeding.");
		output(" Just take it and moan. No sense straining yourself.”</i>");
	}

	output("\n\nYou briefly consider some kind of retort, but the ");
	if(x < 0) output("butt");
	else output("cunt");
	output("-stretching dog-dick hits a particularly sensitive spot. You moan instead. How can you even think with that big, powerful knot straining at your ");
	if(x < 0) output("backdoor");
	else output("entrance");
	output("? How can you do anything but let your body press itself against the cow-girl’s muscled thighs? You do what comes naturally, relaxing to try and let her enter you in her entirety.");
	//[Next]
	pc.changeLust(15);
	processTime(9);
	clearMenu();
	addButton(0,"Next",getFuckedByZephyrIII, [ppZephyr, x, fits, cow, capacity]);
}

public function getFuckedByZephyrIII(args:Array):void
{
	clearOutput();
	showZephyrDeets(true);
	var ppZephyr:PregnancyPlaceholder = args[0];
	var x:int = args[1];
	var fits:Boolean = args[2];
	var cow:Boolean = args[3];
	var capacity:Number = args[4];

	output("The big-dicked cow, smiling down over you, pulls back, leaving you feeling achingly empty. After having such a large member inside you, being without leaves you longing for its return. The cool air of Zephyr’s office tickles at your stretched opening.");
	output("\n\nYou look up at her, pleading with your eyes. You aren’t sure your mouth could coordinate a request, even one as simple as ‘please’.");
	output("\n\nThe amazon, grabbing you ");
	if(pc.hasHair()) output("by the [pc.hair]");
	else output("by the neck");
	output(", smiles down all-too knowingly. <i>“I’ll never get tired of seeing that look on a ");
	if(cow) output("cow");
	else output("bitch");
	output("’s face.”</i>");
	output("\n\nThat red, canine spear pushes right back into you, gliding along on the curtain of lubricant it left behind, already pumping more hot globules of pre-seed into you. This is no slow, tender penetration. Zephyr is thrusting back into the hole she prepared, claiming and using it as she will. Her knot arrests her progress, but only for a few seconds. Despite her pre-orgasmic state, it’s still too big to ignore.");
	output("\n\nYou squeeze down around the narrowness on the other side and wonder just how big she’s going to get when she finally cums inside. ");
	if(capacity >= 800) output("Maybe she’ll get big enough to really give your [pc.vagOrAss] the filling it deserves.");
	else output("Hopefully you’ll be able to handle it.");
	
	if(x >= 0) pc.cuntChange(x,600);
	else pc.buttChange(600);

	output("\n\nSliding back out once more, the big-dicked hermaphrodite prepares her next thrust. She doesn’t dally long. This time, you’re smashed into the desk with butt-slapping force. The clap of her body against your own resonates through the office like a struck bell, but she doesn’t stop there. No, Zephyr rebounds right into the next stroke, pounding your body with the kind of ease that can only come from long hours of experience.");

	output("\n\nThe way she rides you, she could probably leave you an insensate, quivering puddle on the floor if she wanted to. Not that you would mind, necessarily. You already feel a little like ");
	if(x >= 0) output("your brains are leaking out your [pc.vaginas], melted down in the furnace of your own arousal and cast into a mold of her bloated she-prick.");
	else output("the oft-ignored nerves in your ass have supplanted those in your cranium, making it hard to think about anything but the hard-pounding she-prick plowing your sphincter.");
	output(" Quivers of building ecstasy run through your [pc.thighs]. If you didn’t have the desk or the cow’s strong hands to support you, you’d probably have collapsed onto the floor a few minutes ago.");

	output("\n\nThe last thing you want to do is slide off that wonderful, ");
	if(x < 0) output("butt");
	else output("cunt");
	output("-stuffing cock and return to feeling like an empty, horny husk.");

	//[Next]
	pc.changeLust(10);
	processTime(9);
	clearMenu();
	addButton(0,"Next",getFuckedByZephyrIV, [ppZephyr, x, fits, cow, capacity]);
}

public function getFuckedByZephyrIV(args:Array):void
{
	clearOutput();
	showZephyrDeets(true);
	var ppZephyr:PregnancyPlaceholder = args[0];
	var x:int = args[1];
	var fits:Boolean = args[2];
	var cow:Boolean = args[3];
	var capacity:Number = args[4];

	output("Zephyr is growling in the back of her throat now, each slap of her hips against your abused ass accompanied by a slight grunt. Beads of sweat stream down her face from the effort of giving you the fucking you deserve. You moan once more, encouragingly, squeezing your muscles around her, coaxing her to go ahead and drop a big, wet orgasm into your depths.");
	output("\n\nYou’re dangerously close to cumming as it is. All you’d have to do");
	if(x >= 0 && pc.vaginas[x].clits > 0) output(" is catch [pc.oneClit] on the edge of the desk and you’d go.");
	else output(" arch your back and squeeze along with one of her thrusts and you’d go off.");
	output(" But, you try to avoid the onrushing orgasm tide for now, wanting to cum to the feel of her flooding your ");
	if(x >= 0 && !pc.isPregnant(x)) output("womb");
	else if(x >= 0) output("passage");
	else output("intestines");
	output(" with her virile, bovine cum. Or would be canine? You give up on labelling it and just enjoy the feeling of her pre pooling down your [pc.legOrLegs].");

	output("\n\nMoaning louder with every desk-rattling thrust, you slowly lose control of your body. One arm flails out, knocking paperwork everywhere. ");
	if(pc.legCount == 1) output("Your");
	else output("A");
	output(" [pc.leg] spasms. You feel like a passenger in a runaway train, held captive by your own misfiring neurons.");
	output("\n\nThe wild ride is almost over though. Zephyr’s bitch-breaking rod is thickening inside you, filling with one last surge of blood before it goes off. The cow-girl roars, <i>“Here it comes!”</i> and bottoms out for the final knot, planting her swelling knot so deeply inside you that you climax even before the first ropes of seed erupt from her animalistic tool.");

	output("\n\nScrabbling atop the hung amazon’s desk, you moan and gasp. Her fingers dig deep into your [pc.skinFurScales], almost pinching you, but the added pain is only more fuel for the pyre of lust consuming you. You see white starbursts behind your scrunched closed eyelids, your only thoughts of milking every drop of seed from Zephyr’s swelling cock, desperate to have her flood you with her creamy white cum.");
	if(x >= 0 && pc.isSquirter()) output(" [pc.GirlCum] splatters her legs and the floor, squirting everywhere.");
	if(pc.hasCock()) 
	{
		var cumQ:Number = pc.cumQ();
		output(" [pc.EachCock] jerks and shoots wildly");
		if(cumQ >= 25) output(", painting this side of the desk with long, [pc.cumColor] ropes");
		if(cumQ >= 300) output(". You even manage to make a decent-sized pool on the floor - something a well-placed drain is struggling to handle");
		output(".");
	}
	output("\n\nShe obliges you in spades, but not before her knot swells. It puffs up with astonishing rapidity, stretching your [pc.vagOrAss] until it seems that the whole of your being is pulled taut around it, little more than a cum-hungry condom for the cow-girl.");
	
	if(x >= 0) pc.cuntChange(x,1000);
	else pc.buttChange(1000);
	
	output("\n\nThen, the warm sensation of ejaculation greets your spasming folds. Zephyr’s thick goo washes over you in pulsating arhythmic bursts, splattering against your insides, bathing them in thick layer with the first few shots alone. But she doesn’t stop there. The climaxing cow’s knot may have finished growing, but she’s a long way from being done cumming. She keeps firing long, spermy lances into you well past the end of your own orgasm.");
	output("\n\nYou tremble, overwhelmed by being so filled while still sensitive from the afterglow. Your knot-tied mate collapses on top of you. Her immense breasts cushion and distribute her weight to either side of you, making the position far more bearable than it would otherwise be. She breaths huskily in your ear. Sometimes, she even moans, shooting a slightly bigger, thicker eruption than before.");
	output("\n\nYou cry out every time she does, enjoying the moment too much to care, even when your belly ");
	if(pc.bellyRating() < 45) output("begins to swell");
	else output("swells up even more");
	output(", stuffed full of the cow’s gene-modded jism.");
	
	output("\n\nZephyr holds you there for what feels like hours, pinned beneath her, slowly filling, expanding from the pressure of her endless, liquid load. She whispers perverse promises in your ear once it finally dies down");
	if(!pc.isTreated()) output(", promising that you can have her dick every day if you take the Treatment and immigrate, no matter what kind of " + pc.rawmfn("bull","cow","person") + " you come out as.");
	else output(", promising to knot you until you’re addicted to her cock unable to cum without feeling her signature swelling down below.");
	
	if(x >= 0)
	{
		pc.loadInCunt(ppZephyr, x);
		pc.loadInCunt(ppZephyr, x);
		pc.loadInCunt(ppZephyr, x);
	}
	else
	{
		pc.loadInAss(ppZephyr);
		pc.loadInAss(ppZephyr);
		pc.loadInAss(ppZephyr);
	}
	
	//[Next]
	processTime(8);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",getFuckedByZephyrV, [ppZephyr, x, fits, cow, capacity]);
}

public function getFuckedByZephyrV(args:Array):void
{
	clearOutput();
	showZephyrDeets(true);
	var ppZephyr:PregnancyPlaceholder = args[0];
	var x:int = args[1];
	var fits:Boolean = args[2];
	var cow:Boolean = args[3];
	var capacity:Number = args[4];
	
	output("You’re roused by the feeling of Zephyr’s bloated knot being tugged out of you and further wakened by the cascade of salty seed that chases it out of your [pc.vagOrAsshole]. Grinning, the dick-toting cow-woman slaps your [pc.butt] one last time, remarking, <i>“Not bad.”</i>");
	output("\n\nYou try to stand, but your [pc.legOrLegs] won’t cooperate, dumping you on the floor. Looking up for help, you’re confronted with the sight of a cum-covered dick.");
	//Treated/Bimbo - no new PG
	if(pc.isBimbo()) 
	{
		output("\n\nIt looks fucking delicious. You wrap your [pc.lips] around it and suck it like your life depends on it, shining it until its been spit-polished.");
		output("\n\nZephyr pats you on the head and whispers, <i>“Good [pc.boy], now run along before I decide to keep you under my desk for the rest of the day.”</i> You practically glow from the praise, beaming as you lick the last droplets from your [pc.lips]. This planet rules!");
		processTime(2);
		pc.loadInMouth(ppZephyr);
		pc.loadInMouth(ppZephyr);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//Untreated
	else
	{
		output("\n\n<i>“Clean it up.”</i>");
		//[Clean It - You might as well. After all, she’s at work.] [Don’t - Fuck that. You got yours. She might not be real happy about it, though.]
		clearMenu();
		addButton(0,"Clean It",cleanDatZephyrCawk,[ppZephyr, x, fits, cow, capacity],"Clean It","You might as well. After all, she’s at work.");
		addButton(1,"Don’t",dontEatZephyrCock,undefined,"Don’t","Fuck that. You got yours. She might not be real happy about it, though.");
	}
	IncrementFlag("SEXED_ZEPHYR");
	IncrementFlag("ZEPHYR_FUCKED_PC");
}

//[Clean it]
public function cleanDatZephyrCawk(args:Array):void
{
	clearOutput();
	showZephyrDeets(true);
	var ppZephyr:PregnancyPlaceholder = args[0];
	
	output("You give the tall cow-woman a wink and open wide, letting her push herself into your maw. She tastes salty and a little tangy - a mix of cum");
	if(pc.hasVagina()) output(", sweat, and your own feminine fluids");
	else output(" and sweat");
	output(". You run your tongue over every sensitive vein, keeping her completely hard until you finally pull back, revealing a gleaming red, spit-shined dog-cock.");
	output("\n\nZephyr gives you a pat on the head. <i>“Good [pc.boy].");
	if(zephKnowsAboutKids()) output(" Come see me again when you want some more, [pc.name].");
	else output(" Now get out of my office unless you’re wanting another go.");
	output("”</i>");
	processTime(2);
	pc.loadInMouth(ppZephyr);
	pc.loadInMouth(ppZephyr);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Don’t]
public function dontEatZephyrCock():void
{
	clearOutput();
	showZephyrDeets(true);
	if(zephKnowsAboutKids())
	{
		output("<i>“Sorry, Zeph, not in the mood,”</i> you tell her, shrugging.");
		output("\n\nShe sighs and shrugs. <i>“Fine, then. Not gonna force the issue when you’ve already been so... accommodating.”</i> She flashes you a grin while she towels herself off. <i>“Maybe you’ll be a little more generous the next time you come in here begging for more.”</i>");
	}
	else
	{
		output("<i>“No.”</i>");
		output("\n\nThunderclouds gather around Zephyr’s brows. Grabbing hold of herself just below the base, she swings it broadside into your face, splattering some of the leavings across your nose and cheek. <i>“Get the fuck out of my office, slut.”</i>");
		output("\n\nShe smiles down at your cum-stained visage, still pleased in spite of your rebellion.");
	}
	//[Fight] [Leave]
	clearMenu();
	addButton(0,"Leave",leaveLikeABitchPC);
	addButton(1,"Fight",fightZephyrLikeABitch,undefined,"Fight","It might be a terrible idea, but you’re itching for a fight after that kind of casual dismissal.");
	addButton(2,"Snarky Leave",snarkLeaveLikeABitch,undefined,"Snarky Leave","Leave with a bit of snark. Fuck her for being so stuck up.");
}
//Leave
public function leaveLikeABitchPC():void
{
	clearOutput();
	showZephyrDeets();
	output("You ");
	if(!pc.isNude()) output("pull up your gear and ");
	output("step away from the desk, leaking a trail of bruised pride behind you with every step.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Snarky leave
public function snarkLeaveLikeABitch():void
{
	clearOutput();
	showZephyrDeets(true);
	output("You retort, <i>“Fine, bitch,”</i> and spin");
	if(!pc.isNude()) output(", pulling up your gear as you walk away");
	output(". <i>“The galaxy’s full of dicks. Most of them better than yours.”</i>");
	processTime(1);
	//Permamad
	//flags["ZEPHYR_PISSED"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//Fight
public function fightZephyrLikeABitch():void
{
	clearOutput();
	showZephyrDeets(true);
	output("You ball your hands into fists, regretting your complete and total lack of equipment.");
	output("\n\nZephyr laughs and pulls a gun out of her desk. <i>“Get the fuck out of my office, bitch.”</i>");
	output("\n\nWell... maybe you will leave.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Talk
public function talkToZephyr():void
{
	clearOutput();
	showZephyrDeets();
	output("<i>“I have some questions,”</i> you say.");

	if (zephKnowsAboutKids())
	{
		output("\n\nZephyr shrugs. <i>“Sure, go ahead. I won’t have the most exciting answers, though.”</i>");
	}
	else
	{
		output("\n\nZephyr rolls her eyes. <i>“You have questions because you’re too lazy to do the research yourself, but Big T probably expects me to answer them all the same....”</i> She leans her cheek into a balled fist. <i>“So go ahead and ask your stupid questions.”</i>");
	}
	talkToZephyrMenu();
}

public function talkToZephyrMenu():void
{
	clearMenu();
	addButton(0,"Treatment?",talkToZephyrAbootZeTreatmentEh,undefined,"Treatment?","Ask her about ");
	addButton(1,"Her Job",zephyrsShittasticJobstory,undefined,"Her Job?","Ask Zephyr how she wound up as a secretary, a position she seems... ill-suited for.");

	var hasTalkedBets:Boolean = flags["ZEPHYR_TALKED_BETS"] != undefined;

	if (!pc.hasCock() && !pc.hasHardLightStrapOn())
	{
		if (!hasTalkedBets) addDisabledButton(2, "Bets", "Bets", "You need either a cock or hardlight to hand...");
		else addDisabledButton(2, "ButtBets", "ButtBets", "You need either a cock or hardlight to hand...");
	}
	/*
	if (!pc.hasCock())
	{
		if (!hasTalkedBets) addDisabledButton(2, "Bets", "Bets", "You need a cock to hand...");
		else addDisabledButton(2, "ButtBets", "ButtBets", "You need a cock to hand...");
	}
	*/
	else if (!pc.hasItemByClass(Throbb))
	{
		if (!hasTalkedBets) addDisabledButton(2, "Bets", "Bets", "You need some Throbb to tempt Zephyr...");
		else addDisabledButton(2, "ButtBets", "ButtBets", "You need some Throbb to tempt Zephyr...");
	}
	else
	{
		if (!hasTalkedBets) addButton(2, "Bets", zephyrTalkBets, undefined, "Bets", "Table a little bet with Zephyr...");
		else addButton(2, "ButtBets", zephyrButtBets, undefined, "ButtBets", "Table a little bet with Zephyr...");
	}
	if (zephKnowsAboutKids())
	{
		addButton(3, "Her", talkToZephAboutHerself, undefined, "Her", "Talk about herself.");
	}
	addButton(14,"Back",approachZephyr);
}

//Treatment?
public function talkToZephyrAbootZeTreatmentEh():void
{
	clearOutput();
	showZephyrDeets();
	//What’s she think of it, what’d it do to her, she has a cock, etc
	output("<i>“So what do you think of the Treatment? Did it make you like this?”</i> You gesture at all of her.");
	output("\n\nZephyr rolls her eyes. <i>“I think the Treatment is a crock of shit a bunch of old, bothersome bulls cooked up to get their dicks licked by stupid, brainless bimbos.”</i> She smirks. <i>“I assume by ‘like this’, you’re talking about how stacked I am, and not just in the tit department.”</i>");
	output("\n\nYou nod. <i>“You guessed it.”</i>");
	output("\n\n<i>“It did. I was a little slip of the girl before I had my state-mandated Treatment.”</i> She scowls. <i>“Government shouldn’t be interfering in our lives like that at all if you ask me. Anyway, imagine the surprise when I damn near doubled in height over the next week. I damn near emptied a grain silo by myself, and the family apple tree got picked clean. The muscles and tits grew in a while later, once I stopped burning every calorie growing like a weed.”</i>");
	output("\n\nYou scratch your chin in, imagining it.");
	output("\n\nZephyr chuckles. <i>“Turns out I got a rare side effect of the treatment. You don’t usually get all big, muscular, and confident unless your a guy, or at least packing a dick when you take it. Something went wrong in my dose though, or maybe my hormones were already imbalanced, I don’t know.”</i> She leans in close, wrapping an arm under her enormous bust. Her cleavage threatens to pop out the top of her button-down shirt. <i>“Still got the tits and the milk too, so it wasn’t a total wash.”</i>");
	output("\n\nDid she ever. You don’t think you’ve seen anyone else here with boobs like hers");
	if(flags["BEEN_IN_GIANNA_BODYMOD_MENU"] != undefined && chars["GIANNA"].biggestTitSize() >= 30) output(", except maybe Gianna, and that’s due to your own meddling");
	output(".");

	output("\n\n<i>“I got a knockout body that can actually knock someone out, unlike those milky fluffballs we call women.”</i> She grins fondly. <i>“Only problem was I wanted to be in charge of the sex, and the guys around here... most of ‘em don’t wanna be on the bottom. Besides, the bulls made fucking their cows silly look so fun. How could I not give it a try?”</i>");
	output("\n\nShe leans still closer, reaching down towards her skirt. <i>“So I did the only thing a self-respecting proponent of equality would do. I imported a gene mod that would put me on par with the boys.”</i> She lifts the fabric, revealing six inches of bright red, semi-hard cock. <i>“Got myself a nice dog-cock. The knotted ones always looked like more fun.”</i> It twitches, but she drops the crotch curtain down before it can get any bigger. <i>“Its pretty awesome, but tough to deal with when you’re packing a chemically-altered libido. Fucking Treatment can be a real pain.”</i>");
	output("\n\n<i>“So yeah, I don’t like it on principle, but I’m pretty happy with how I came out, all things considered. Personally, I’d like to see them change up the mix for a few generations.”</i> A dangerous twinkle alights in the corner of her eye. <i>“Imagine this place if all the guys were soft, demure faux cows and the girls were all authoritative bitches like me.”</i> She winks. <i>“Of course they’d still be hung. A girl’s gotta have something decent to ride.”</i>");
	output("\n\nThat");
	if(pc.isBimbo()) output(" sounds pretty fun and stuff! Its hard to wrap your brain around the idea being in charge, but having lots of dick on call sounds great.");
	else output("’s a little extreme.");
	output(" <i>“Really?”</i>");
	output("\n\nZephyr nods. <i>“Oh yeah. Sure, I’d rather not have the government messing with us at all, but everybody else around here is too damned taken with it to put a stop to its use. So I figure, why not try and strike a blow for equality. The world needs more strong women, and I don’t just mean physically.”</i> She pauses, considering. <i>“Of course, a little muscle doesn’t hurt either. Hell, my muscles got me closer to the top than anything else.”</i>");
	output("\n\nCurious now, you ask, <i>“");
	if(pc.isBimbo()) output("Like, w");
	else output("W");
	output("hat’s that mean?”</i>");

	if (zephKnowsAboutKids())
	{
		output("\n\n<i>“Heck, you can probably figure it out with our history,”</i> she says with a grin. <i>“So, anything else?”</i>");
	}
	else
	{
		output("\n\nZephyr leans back and glances at her work. <i>“It’s a story for another time. Why don’t you make yourself scarce so I can get something done.”</i> She mutters, <i>“If I have to work this job, I might as well do it right.”</i>");
		output("\n\nYou nod.");
		output("\n\n<i>“Are you still here? Get out.”</i>");
	}

	processTime(30);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
} 

//Her Job?
public function zephyrsShittasticJobstory():void
{
	clearOutput();
	showZephyrDeets();
	//How’d she wind up as a secretary? Explain Big T’s bet, etc.
	output("<i>“So how’d you get your job? Doesn’t seem like you care for it,”</i> you ask.");
	output("\n\nZephyr slams her fist into the table. <i>“That fucker!”</i>");
	output("\n\n<i>“What?”</i> You step back, confused.");
	output("\n\n<i>“Big T!”</i> Zephyr growls. <i>“That fucker cheated me.”</i> She stands up out of her chair and paces back and forth. <i>“Okay, he didn’t exactly cheat me, but it’s his fault I’m stuck here. I’ve known that big dolt for years. We were actually drinking buddies at the time.”</i>");
	output("\n\nShe was drinking buddies with the governor? <i>“How’d you pull that off?”</i>");

	if (zephKnowsAboutKids())
	{
		output("\n\nZephyr laughs at that, her smile warm and genuine. <i>“Its pretty easy when your families are already close and you’re the only one that can match him drink for drink. Besides, I’m the only girl around that he can carry on a conversation with. The others wind up sucking his dick mid-sentence, and Gianna’s a little naive to discuss politics with.”</i>");
	}
	else
	{
		output("\n\nZephyr laughs at that, her smile warm and genuine for once. <i>“Its pretty easy when your families are already close and you’re the only one that can match him drink for drink. Besides, I’m the only girl around that he can carry on a conversation with. The others wind up sucking his dick mid-sentence, and Gianna’s a little naive to discuss politics with.”</i>");
	}

	
	//Not met Gianna
	if(flags["MET_GIANNA"] == undefined) output("\n\n<i>“Who’s Gianna?”</i> you ask.\n\n<i>“Some sexbot tramp he’s adopted. It doesn’t matter.”</i>");
	//Met her
	else output("\n\n<i>“I guess so,”</i> you agree.\n\n<i>“She doesn’t really matter.”</i>");
	//No new paragraph, space first
	output("\n\n Zephyr’s pacing quickens. <i>“Like I was saying.”</i> She tosses you a glare as if she blamed you for side-tracking her. <i>“So we’re drinking buddies, and I’m trying to explain to the idiot why the Treatment is fucking terrible for us. He’s not having it of course, something about super-varmints or some shit. Moron.”</i> She punches her table again. <i>“Anyway, I tell him I could run this place a thousand times better than him. We were both pretty toasty, and a little competition is healthy, right?”</i>");
	output("\n\nYou give her a little nod, curious how the story will end.");
	output("\n\n<i>“He laughs and tells me I should learn a little respect. Tells me its easy to be high and mighty when you’ve got a big family farm and a body that makes the work easy. Says I’d learn more from sitting behind a desk and working out my brain for a change.”</i> Zephyr throws her hands up. <i>“Can you believe that? I don’t think he’s worked a muscle above his crotch in years.”</i>");
	output("\n\nA booming voice echoes from behind the office doors. <i>“I heard that!”</i> More quietly, it suggests, <i>“Suck a little deeper, honey.”</i>");
	output("\n\n<i>“Buy some fucking insulation then! If I’ve gotta hear one of your hussies screaming while I file paperwork, you can hear this!”</i> Zephyr rounds on you. <i>“So he’s a big dumb idiot, right?”</i>");
	output("\n\n<i>“Uh... right?”</i>");
	output("\n\nZephyr repeats, louder, <i>“Definitely a big idiot.”</i>");
	output("\n\nAn answering groan comes from the other side of the wall. You don’t think the governor is listening any more.");
	output("\n\n<i>“Whatever.”</i> The amazon’s face turns proud. <i>“So if there’s one thing you can count on getting a big idiot to respond to, it’s a physical challenge.”</i> She flexes and impressively corded bicep. <i>“I challenged him to an arm wrestling contest. Told him I was smarter and stronger. Said that if I won, I’d get to be the governor for a week. I figured a week of good governance would have me voted into office the next term.”</i>");
	output("\n\nYou tilt your head. <i>“Did it work?”</i>");
	output("\n\n<i>“Not at first. He tried to laugh it off until I suggested that he was just afraid of losing to a girl.”</i> Zephyr slaps her knee. <i>“I might have said it loud enough for every bull in the place to hear.”</i>");
	output("\n\nYou wince.");
	output("\n\nThe suit-wearing cow just grins all the wider. <i>“Yeah, he couldn’t turn me down then. He accepted of course, but his terms fucked me over.”</i>");
	output("\n\n<i>“What were they?”</i> Just how could the wagers screw her?");
	output("\n\nZephyr sweeps her arm over his desk. <i>“He said that he’d accept if I’d be his secretary for a year. Can you believe it? That’s hardly a fair deal, but I had no bargaining position.”</i> She crosses her arms over her bust once more. <i>“I did make him promise that the job would be a galactic standard secretarial position - no mandatory oral or sexual relief.”</i>");
	output("\n\n<i>“Oh.”</i> There’s nothing else you can really say about that, besides... <i>“That sucks.”</i>");
	output("\n\n<i>“Yeah.”</i> Zephyr flops back down into her chair, defeated. <i>“I almost had him, too, but then he pulled the girl off his dick and focused. I didn’t even know she was there until then!”</i> She pouts, an expression that looks incongruous on her normally self-assured features. <i>“They don’t call him Big T. for nothing. I tried again last year, same terms, and lost again, but next time, I’m gonna get him for sure.”</i> She gestures at a huge pair of weights next to her desk. <i>“I’m practicing.”</i>");

	if (zephKnowsAboutKids())
	{
		output("\n\n<i>“So that’s how you subdued me, huh?”</i> you say with a smile, before looking over at a noise.");
	}

	//Not met Ellie
	if(flags["MET_ELLIE"] == undefined)
	{
		output("\n\nThe door on the north side of the room clicks open, revealing a gray-skinned face attached to giant boobs and three pairs of legs. Zephyr’s are bigger, but the six-legged bimbo leaving Big T’s office is showing more, and besides, hers are shining, wet with something. The newcomer dabs at a white dribble on her cheeks and cheerily waves at the both of you. <i>“Hey Zephie! Hey stranger! See you in a few hours!”</i>");
		output("\n\n<i>“Fuck off, bimbo!”</i>");
		output("\n\nThe scent of sex fills the air as the woman passes by, blowing you and Zephyr a set of matching kisses. <i>“I love you too!”</i>");

		if (zephKnowsAboutKids() == false)
		{
			output("\n\nZephyr sighs, then looks back up at you. <i>“Get out of here before I wind up throwing you over the desk and raping your ass. That bitch’s pheromones always drive me crazy.”</i>");
		}
		else
		{
			output("\n\nZephyr sighs, turning back to you. <i>“You’d better leave before I lose control. That useless bimbo’s pheromones always drive me crazy.”</i>");
		}
	}
	//Met Ellie
	else
	{
		output("\n\nThe door on the north side of the room clicks open, revealing Ellie’s smiling face and gleaming, sperm-slathered boobs. Her bra is wet with more than milk at the moment, and she’s dabbing at a trickle of sperm on the corner of her mouth. She beams at you both. <i>“Ohhh, Zephie’s got a [pc.boy]-friend! How cute!”</i> She points accusingly at Zephyr. <i>“Don’t scare this one off, okay!”</i>");
		output("\n\n<i>“Fuck off, bimbo!”</i>");
		output("\n\nEllie prances by, her tail waving happily, leaving a cloud of sex-scented musk in her wake. <i>“Kay, I love you both! Later!”</i> The door slams closed behind her.");

		if (zephKnowsAboutKids() == false)
		{
			output("\n\nZephyr sighs, then looks back up at you. <i>“Get out of here before I wind up throwing you over the desk and raping your ass. That bitch’s pheromones always drive me crazy.”</i>");
		}
		else
		{
			output("\n\nZephyr sighs, turning back to you. <i>“You’d better leave before I lose control. That useless bimbo’s pheromones always drive me crazy.”</i>");
		}
	}
	//+10 lust
	pc.changeLust(11);
	processTime(9);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Zephyr (New Texas) on Cunt tail
//Zephyr (New Texas) on Cunt tail
//Chicken Out
//Obey
public function cuntTailPlusZephyrIntro():void
{
	clearOutput();
	showZephyrDeets();
	author("Frogapus");
	output("You suggest that she might enjoy fucking your tail.");
	output("\n\n<i>“Your tail?”</i> she asks, incredulously, cocking an eyebrow up. She crosses her arms under her breasts, and folds one leg over the other, obscuring her cock from view. <i>“Are you really not going offer me some tight pussy, or even hot ass?”</i>");
	output("\n\nYou hesitate, ready to retract your offer.");
	output("\n\n<i>“Well shit, I guess I could fuck it, but I’m not getting out of my chair for a ‘tail fuck,’ of all things,”</i> she sighs.");
	output("\n\nBefore you can ask how she’d want to do it, she unfolds her legs, planting her feet on the ground. She’s wearing red heels, but she plants them down on the furry rug like they were working boots. She grips the sides of the desk in front of her, the muscles in her arms and shoulders flexing, and with a grunt, she slides gigantic piece of furniture to the side. The wood groans, but shifts away, clearing a wide spot on the floor in front of her.");
	output("\n\nZephyr doesn’t even seem to have exerted herself much. She dusts her hands and smirks up at you. With her feet still planted wide, you glimpse her cock rising up from her skirt, bouncing slightly with each pat down of her hands.");
	output("\n\n<i>“Just clearing some space for you,”</i> she says simply, tugging her skirt up. Her shiny red cock throbs, just begging to have something hot and wet wrapped tight around it.");
	output("\n\n<i>“Space?”</i> you ask, curious about the cow-girl’s show of strength.");
	output("\n\n<i>“For you to get on your knees,”</i> she says, rolling her eyes. <i>“If you want me to fuck your tail, we’re doing it my way.”</i>");
	output("\n\nYou blink, taking a moment to process that statement. This may not have been what you were expecting. Do you back out, or follow her orders?");
	pc.changeLust(5);
	processTime(2);
	clearMenu();
	addButton(0,"Chicken Out",chickenOutOnZephyrTailfuck);
	addButton(1,"Obey",obeyAndLetZephyrFuckYerTail);
}

//Chicken Out
public function chickenOutOnZephyrTailfuck():void
{
	clearOutput();
	showZephyrDeets();
	author("Frogapus");
	output("This wasn’t what you signed on for!");
	output("\n\nYou tell Zephyr that you have no intention of kneeling in front of her.");
	output("\n\nShe snorts and turns in her chair to grab the sides of her desk. With a grunt, she hefts her desk up and slams in on the floor in front of her. The whole room shakes as the massive oaken edifice crashes into place.");
	output("\n\nBig T’s voice rumbles outward from the closed doors, <i>“Is everything okay out there, Zephyr?”</i>");
	output("\n\n<i>“Just fine, sir!”</i> says Zephyr, locking her eyes on you with a look of absolute disdain. <i>“Just a minor annoyance.”</i>");
	output("\n\nYou feel it might be a good idea to give the cow girl some time to cool off. You politely excuse yourself from the room as Zephyr stares at you in silence.");
	if(!pc.hasStatusEffect("Zephyr Annoyed")) pc.createStatusEffect("Zephyr Annoyed",0,0,0,0,true,"","",false,120);
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Obey
public function obeyAndLetZephyrFuckYerTail():void
{
	clearOutput();
	showZephyrDeets();
	author("Frogapus");
	output("You decide to follow Zephyr’s orders like the obedient [pc.boyGirl] you are.");
	output("\n\n<i>“Kneel on the floor if you want me fucking your tail, tourist,”</i> she rumbles, licking her lips.");
	output("\n\nA shiver runs up your spine and down to the tip of your tail as you process the hungry look in her eyes. Zephyr’s still seated in her chair, arms resting on her knees as you slowly sink down to the plush carpet directly in front of her. You look up at her, feeling a thrill of submission as she grasps her cock, idly toying with it in front of you.");
	output("\n\n<i>“Get on all fours, and face that ass towards me,”</i> she says, looking on with obvious enjoyment at how well you’re taking orders.");
	output("\n\nYou feel a soft fluttering in your stomach at her gaze on your body, and turn, half-crawling, to face your [pc.butt] towards the dominant femme, then lean forward, placing your hands on the carpet, feeling them sink down into the plush fur. Your tail rises up above your posterior, curving up into a perfect question mark.");
	output("\n\n<i>“Good [pc.boyGirl],”</i> hums Zephyr.");
	output("\n\nIn this position, you can’t see what she’s doing, or even guess what’s she’s planning. You feel your excitement growing, wondering what she’ll do with you on your hands and knees like this.");
	output("\n\nHer chair creaks, and you squeak in surprise as you feel a strong grip on your tail. Zephyr’s fingers wrap firmly around it, then, just as your heart stops pounding so hard, she begins to run the tip of her thumb against its underside. You moan softly as the sensations radiate out from your [pc.tailCunt], up your spine, to your quaking arms, and down to your tail cunt’s tip, coaxing a warm wetness from your parasitic folds.");
	output("\n\nYou shudder for a few moments, bathing in the simple sensation of her finger toying with your tail. You’re not entirely sure why it feels so good-it might be the submission, or your inability to see her actions, or some combination of both. Whatever it is, you can feel your pleasure building faster than you expect it.");
	if(pc.hasCock())
	{
		output(" Your [pc.cocks]");
		if(pc.cockTotal() == 1) output(" is");
		else output(" are");
		output(" already fully stiff and at the ready.");
	}
	if(pc.hasVagina()) output(" [pc.EachVagina] throbs softly, wetness already building in your depths.");

	output("\n\nAs you process this, you feel something hot and pointed against your tail cunt. The sensation ripples up through you drawing a breathy moan from your [pc.lips]. You feel it trace, the pointed tip of her canine dick, up and down your ready slit. Your arms are shaking so much that they can barely hold you up. You feel something hot and wet spatter slowly run down your tail, creeping along its length until it pools in the cleft of your ass. You’re so wet that you’re oozing your pussy juices down on yourself.");
	output("\n\n<i>“F-f-fuck me,”</i> you murmur, your eyes fluttering in pleasure. <i>“P-please?”</i>");
	output("\n\n<i>“I think I need to be a bit more comfortable first,”</i> chuckles Zephyr.");
	output("\n\nBefore you can ask what she means, she gives your tail a sharp tug. With a yelp, your ass rises up, and your face slams into the soft carpet. With your ");
	if(pc.hasKnees()) output("knees");
	else output("[pc.legOrLegs]");
	output(" tucked under you and your face against the floor, your ass is raised almost embarassingly high into the air.");
	output("\n\n<i>“There we go,”</i> says Zephyr. <i>“I like having somewhere to put my feet up if I’m gonna to have a nice fap.”</i>");
	output("\n\nYou work that one out just as you feel the cold stiffness of her heels rest atop your ass. She can’t actually be serious! Does she really expect you to sit there, curled up like a-");
	output("\n\nThe tip of her dick pushes against the folds of your tail cunt, and your thoughts dissolve into fireworks.");
	output("\n\nYou can feel her hand-no, her hands-wrapped tight around your tail, slipping it down over her cock, like a fleshtoy. You can feel her thick red cock, canine and throbbing, pushing into your tail. You can feel the exquisite pressure of her girthy cock meeting her tight grip, with you between them.");
	output("\n\nYou try to say something, but you can do little more than drool in pleasure, curled up on the floor as her living footstool as she feeds herself into you.");
	output("\n\nHer chair creaks, and her weight shifts above you, lessening a bit, feeling as it she were leaning back in her chair. She lets out a satisfied sigh as she slips you further and further down, your [pc.tailCunt] squelching as her thick cock fills it further and further. You can feel the curve of her tip, the veined thickness of her shaft, and her girthy base, and you pant, thinking about it swollen into a knot inside you.");
	output("\n\n<i>“Mmmm, that’s nice,”</i> she murmurs. Through the fog of pleasure, your brain registers her approval, your tail trembling");
	if(pc.hasCock()) output(", your [pc.cocks] twitching");
	else if(pc.hasVagina()) output(", your [pc.vaginas] throbbing");
	output(".");

	output("\n\nWhen she begins to slide you up her cock, you reflexively mewl in protest, feeling distantly foolish when she slides you back down.");
	output("\n\n<i>“Someone’s eager,”</i> she says in an amused tone. <i>“But a good fucktoy isn’t concerned with getting off, it’s priority is getting me off. Are you a good fucktoy or not?”</i>");
	output("\n\nYou shudder, curled on the floor, ass raised high for her resting feet as she gives your tailcunt an extra squeeze around her cock.");
	output("\n\n<i>“I’m a g-good fuh-fuck toy,”</i> you babble.");
	output("\n\n<i>“Good [pc.boyGirl],”</i> she coos. You moan in pleasure at her words, just as she begins pumping again, jacking herself slowly, lazily, with your tail. You can feel your tail pushing back against her hands slightly, eager to clamp down and drain her dry, but the bovine amazon’s grip is far too strong for it. Instead, she let out another happy sigh, adjusting her heels on your backside as she uses your body to get herself off.");
	output("\n\nYou tremble beneath her, your brain adrift in the pleasure of her dick plunging in and out of your tail cunt, the serpentine symbiont radiating that pleasure out through the rest of your body. You want her cum with an aching hunger that grows with every stroke of her hands. The thought overwhelms you, and you can feel it echoed in the soft twitches of your asshole");
	if(pc.hasCock()) output(" and the beading pre dripping from your [pc.cocks]");
	else if(pc.hasVagina()) output(" and the desperate throb of your [pc.vaginas], hungry to be filled");
	output(".");

	output("\n\nYou need her buried deep inside you, filling you up with her hot seed, you want it more than anything in the universe. But you’re not in control. Pinned voluntarily to the floor, all you can do is whimper as she jacks off with your body.");
	output("\n\n<i>“Toys don’t get a say in how they’re used,”</i> says Zephyr from above you. It almost as if she can understand your plaintive noises. She slows down her fapping, and you feel a surge of despair tinge the pleasure of her fucking. You almost wail in protest, but choke it off at the last moment, remembering her words.");
	output("\n\nWhen she finally does start to pick up the pace, all you can do is shudder. Yes! This is it! This is what you’ve been wanting for what seems like an eternity. You can feel the heavy throb of her dick in your tail cunt, radiating out through you like a second heartbeat. Her knot is starting to swell, too, growing larger inside you with every stroke of her dick. You lick your lips, drooling at the thought of that soon filling up your cunt, knotting it tight.");
	output("\n\n<i>“Oh fuck, oh yeah, such a good fucktoy!”</i> she pants, digging her heels down against your ass. You squeak, eyes rolling back in your head as the pain of her heels heightens the pleasure crashing through you. Your whole tail is slick with your own juices, and Zephyr’s all but thrashing in her chair, her muscular hips bucking up and down as she pumps your tail like a piston around her dick. Her dick-that’s the only thought filling your mind right now. You need it. You need it exploding cum inside you. You need to satisfy Zephyr.");
	processTime(20);
	pc.changeLust(40);
	clearMenu();
	addButton(0,"Next",getTailFuckedByZephyrSauce);
}

public function getTailFuckedByZephyrSauce():void
{
	clearOutput();
	showZephyrDeets();
	author("Frogapus");
	output("With a howl of pleasure, she jams your tail down against her dick, shoving her massive knot inside it. You answer with a squeal of your own, ignore the pain of her grapefruit-sized knot stretching out your tail cunt, eyes wide in pleasure as she pumps a hot jet of cum deep into your tail. Her grip around your tail doesn’t let go, and she keeps it locked around your base, her hand sliding up and down its length, jacking herself off through your tail cunt. When she shoot another small load of cum inside you, you quiver, seeing fireworks as pleasure erupts throughout your body.");
	pc.changeLust(30);
	output("\n\nShe leans back in her chair, breathing heavily, the thickness of her knot a dull ache at the end of your tail. It takes a few minutes for her breathing to steady, and for you to start registering anything but the pleasure of your tail feeding on her expended cum.");
	output("\n\n<i>“Phew! I needed that,”</i> she says, still somewhat breathlessly.");
	output("\n\n<i>“I... I...</i>“ you breathe, trying to form a sentence. Thoughts slowly surface in your brain, bobbing up out of the depths of bliss. <i>“I wanna...”</i> you say slowly, reaching your hand down your front, towards your thighs.");
	output("\n\n<i>“None of that,”</i> says Zephyr, giving your tail a sharp tug. You squeak in protest as the pain cuts through your dumbfucked thoughts. <i>“You’re not making a mess on the carpet in here, " + pc.mf("mister","miss") + ". You can take that elsewhere.”</i>");
	output("\n\n<i>“But-but-”</i> you stammer, trying to push yourself up from the floor. After being curled up for so long, your arms are shaky and a bit numb. You look over your shoulder at Zephyr. She’s still leaning back in her chair, her cheeks flushed, her breasts spilling out of her top, her legs spread wide, and her dick out, your tail still wrapped around it. One at a time, she lifts her feet from your back, planting her heels on the floor, and gives you a hard look.");
	output("\n\n<i>“You asked for a tail fuck, and you got it. I didn’t agree to having to clean tourist cum out of the fur carpets,”</i> she says. <i>“Stand up and get dressed.”</i>");
	output("\n\nYou look meaningfully at your tail cunt, still anchored tightly to her knot.");
	output("\n\n<i>“Oh, it’ll go down in a few minutes,”</i> she says, rolling her eyes. <i>“It’s not like I’ve got your leg in there. You can still get dressed while you wait for it.”</i>");
	output("\n\n<i>“But how am going to get off?”</i> you ask a little plaintively.");
	output("\n\n<i>“Well, if getting off is what you’re looking for, maybe ask me to fuck you instead of your tail, next time,”</i> she says with a mischievous grin.");
	output("\n\nIt seems incredibly unfair, but you’re a bit at her mercy. Your body is still twitching and aching to cum as you pick up your clothes, slowly dressing with your tail stuffed full of her throbbing cock. Every other motion brings an accidental tug from it, sending a shuddering wave through your body, bringing you that much closer to cumming. Zephyr smiles as she watches you, looking as if she’s enjoying your predicament.");
	output("\n\nBy the time you’re done dressing, her knot has gone down, and with a wet slurp, your tail slides free from it, slapping limply against the floor. You stiffen with a sharp intake of air, your back arching as you stand straight up, feeling yourself at the verge of climaxing.");
	output("\n\nZephyr is on you in a flash, striding forward and clamping her hand down on ");
	if(pc.hasCock()) output("[pc.oneCock], her grip so tight that cumming would be an impossibility.");
	else output("your [pc.tailCunt], clapping her palm soundly against it, sending a sharp sting of impact up your body, interrupting your breathless spasm.");
	output(" <i>“Out!”</i> she orders.");

	//[PC.Willpower X 3 - Libido < 0:
	if(pc.willpower()/2 + rand(20) + 1 >= 15)
	{
		output("\n\nUnfortunately, her harsh ministrations have the opposite effect on your sensitive body. As soon as she lets go to shove you out the door, you fall to your knees, moaning in the throes of a desperate orgasm.");
		var cumQ:Number = (pc.hasCock() ? pc.cumQ() : 0);
		if(pc.hasCock() && !pc.isCrotchExposed())
		{
			output(" [pc.EachCock] ");
			if(cumQ < 10) output("spurts a small load");
			else if(cumQ < 500) output("fires a heavy load");
			else output("unleashes a torrent of cum");
			output(" beneath your garments as you shudder in ashamed delight, it dribbles out of your [pc.lowerGarments] and onto the thick, fur rug.");
		}
		else if(pc.hasCock())
		{
			output(" [pc.EachCock] ");
			if(cumQ < 10) output("spurts a small load");
			else if(cumQ < 500) output("fires a heavy load");
			else output("unleashes a torrent of cum");
			output(" up through the air as you shudder in ashamed delight. It spatters down onto the thick, fur rug.");
		}
		if(pc.hasVagina() && !pc.isCrotchExposed()) 
		{
			output(" As you stumble to the floor, you come to a shuddering climax, your [pc.vaginas] squirting a ");
			if(!pc.isSquirter()) output("dribble of wetness");
			else output("heavy load of [pc.girlCum]");
			output(" into your [pc.underGarment]");
		}
		else if(pc.hasVagina())
		{
			output(" As you stumble to the floor, you come to a shuddering climax, your pussy squirting a ");
			if(!pc.isSquirter()) output("dribble of wetness");
			else output("heavy load of [pc.girlCum]");
			output(" onto the shaggy floor.");
		}
		output("\n\nYou gasp in pleasure, sitting in a puddle of your own cum, feeling more than a little ashamed of yourself, and embarrassed that Zephyr watched you cum so easily.");
		output("\n\nZephyr looks down furiously at the pooling mess beneath you, her lips pressed so tightly against each other that they disappear into a single, straight line. She grabs you by the arm, lifting you as easily as if you were a pillow, and with a mighty heave, flings you out of the room.");
		//[PC takes damage, Lust=0, Triggers the Pissed-off option noted on Zephyr’s wiki page: http://wiki.smutosaur.us/Zephyr
		pc.orgasm();
		//Next 24 hours: Pissed off text: <i>“You approach the amazon cowgirl at her desk, but her death glare warns you to stay away. Fighting off a shiver of barely-missed doom, you decide to go elsewhere.”</i>]
		if(!pc.hasStatusEffect("Zephyr Annoyed")) pc.createStatusEffect("Zephyr Annoyed",0,0,0,0,true,"","",false,1440);
	}
	//PC.Willpower X 3 - Libido > 0 
	else output("\n\nYou gulp and swallow a few breaths until you calm down a little, barely clinging to her command, then shuffle awkwardly out of the room.");
	processTime(7);
	var ppZephyr:PregnancyPlaceholder = getZephyrPregContainer();
	pc.loadInCuntTail(ppZephyr);
	IncrementFlag("SEXED_ZEPHYR");
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].southExit);
}

public function zephyrTalkBets():void
{
	clearOutput();
	showZephyrDeets();
	author("Wsan");

	output("<i>“Hey Zephyr, interested in making a bet?”</i> you ask, approaching the amazonian woman’s desk. <i>“How about an arm wrestle?”</i>");
	
	output("\n\n<i>“Why would I want to arm wrestle you?”</i> she says, looking at you with an expression reminiscent of someone observing roadkill. <i>“Some of us have actual work to do, you know. Unlike others!”</i> she suddenly yells at the office behind her.");
	
	output("\n\n<i>“I haven’t even done anything,”</i> comes the slightly confused reply through the door.");
	
	output("\n\nZephyr sighs angrily, then fixes you with a glare. <i>“Look. Arm wrestling got me </i>into<i> this dumb bullshit. I really don’t want anything to do with more dumb bullshit. Get it?”</i>");
	
	output("\n\n<i>“You haven’t even heard the stakes yet,”</i> you inform her, smiling.");
	
	output("\n\n<i>“Ugh,”</i> she groans in exasperation, slapping a hand to her forehead. <i>“Since it’s clear you’re not going to fuck off until you tell me, just go ahead. What are the stakes?”</i>");
	
	output("\n\n<i>“If I win, I get to fuck your ass,”</i> you start, waiting for her to explosively object.");
	
	output("\n\nShe waves it off instead. <i>“Cool, won’t happen. And if I win?”</i>");
	
	output("\n\n<i>“You get to fuck </i>me<i> in the ass... and a little prize, too,”</i> you say, holding up a syringe of Throbb. <i>“This.”</i>");
	
	output("\n\n<i>“Is that-”</i> Zephyr starts, half-standing from her desk and narrowing her eyes. <i>“Do you have any idea how illegal that is? Fuck, how did you even get it past customs?”</i> She shakes her head immediately. <i>“Never mind. The bimbo out the front probably keeps Ogram perfectly distracted.”</i>");
	
	output("\n\nShe steps out from behind her desk and stalks over to you, all nine feet of her");
	if (pc.tallness <= 74) output(" towering over you and");
	output(" bristling with suspicion.");
	
	output("\n\n<i>“So is it... real?”</i> she asks, eyeing the syringe.");
	
	output("\n\n<i>“Oh, it’s the real deal,”</i> you assure her. <i>“It’ll add inches length- </i>and<i> width-wise. Not to mention your libido shooting through the roof. Ah, not that you really need any help with that.”</i>");
	
	output("\n\n<i>“Hmm,”</i> she mutters, still staring at the medical applicator. <i>“I </i>have<i> been thinking about going bigger... seems like fucking everyone has a three foot horsecock nowadays.”</i>");
	
	output("\n\n<i>“Should be easy then, right?”</i> you say, not even hiding that you’re goading her on. <i>“All you have to do is beat me.”</i>");
	
	output("\n\n<i>“I am going to fucking destroy your asshole when I win,”</i> she says, pointing rudely at your chest. <i>“You won’t even be able to fucking sit down without thinking of my cock. But fine,”</i> she continues, shrugging as she turns away and heads back to her desk. <i>“We can arm wrestle any time. Just let me know when you want me to fuck your ass, I guess.”</i>");

	flags["ZEPHYR_TALKED_BETS"] = 1;

	processTime(3+rand(2));
	talkToZephyrMenu();
}

public const PQR_UNKNOWN:uint = 0;
public const PQR_AUTOLOSS:uint = 1;
public const PQR_AUTOWIN:uint = 1 << 1;
public const PQR_RAND:uint = 1 << 2;
public const PQR_DOUBLELOSS:uint = 1 << 3;

public function getWrassleResult():Array
{
	var targetPQ:Number = 75;

	// Apply a penalty/bonus based on tallness
	if (pc.tallness < 102) targetPQ += 5;
	if (pc.tallness > 108) targetPQ -= 5;

	// Apply stat-based bonuses
	if (pc.WQ() >= 75) targetPQ -= 5;
	if (pc.WQ() <= 25) targetPQ += 5;

	if (pc.RQ() >= 75) targetPQ -= 5;
	if (pc.RQ() <= 25) targetPQ += 5;

	if (pc.tone >= 75) targetPQ -= 5;
	if (pc.tone <= 25) targetPQ += 5;

	// Apply a penalty if the player is milk-full and has low reflexes
	if (pc.milkFullness >= 90 && pc.RQ() <= 50) targetPQ += 5;

	var pqResult:uint = PQR_UNKNOWN;
	var randWin:Number = 0;

	var pqDiff:Number = pc.PQ() - targetPQ;

	// More than a 10% below = autoloss
	if (pqDiff <= -10)
	{
		pqResult = PQR_AUTOLOSS
	}
	// More than 25% above = autowin
	else if (pqDiff >= 25)
	{
		pqResult = PQR_AUTOWIN;
	}
	else
	{
		// 9999 This is garbage but it'll do for now
		randWin = (pc.PQ() + rand(25)) - targetPQ;
		pqResult = PQR_RAND;
	}

	return [pqResult, randWin];
}

public function zephyrButtBets():void
{
	clearOutput();
	showZephyrDeets();
	author("Wsan");

	if (flags["ZEPHYR_TALKED_BETS"] == 1)
	{
		output("<i>“Still up for that bet I told you about?”</i> you ask,");
		if (!pc.isNude()) output(" indicating the silhouette of an applicator in your pocket.");
		else output(" twirling a syringe between your fingers.");
		
		flags["ZEPHYR_TALKED_BETS"] = 2;
	}
	else
	{
		output("<i>“Up for another bet?”</i> you ask, winking at Zephyr.");
	}

	output("\n\n<i>“Sure, let’s get it over with,”</i> Zephyr says, shrugging. <i>“Take a seat.”</i>");
	
	output("\n\nYou pull up a chair and sit at the corner of her desk, Zephyr rolling up her sleeves and shuffling to get closer. She lays her arm out in the traditional position, flexing just to show off, and you can see just why she’s so confident in her strength. Muscle ripples beneath her skin, every bit as taut as a Tavros whore’s latex suit.");

	if (pc.PQ() <= 20)
	{
		output("\n\nBy contrast, you’re not nearly as muscular as the amazonian woman. You look to be the type of person that gets by without the use of overwhelming strength, and Zephyr can tell if her leering grin is any indication. You’re almost certainly going to lose!");
	}
	else if (pc.PQ() <= 50)
	{
		output("\n\nYou’re not quite as muscular as she is, by contrast. The amazonian woman certainly has at least a little bit of a strength advantage, and that could prove to be your downfall. Zephyr herself certainly thinks it’s in the bag, if her confident grin is any indication.");
	}
	else if (pc.PQ() <= 80)
	{
		output("\n\nYou’re about as muscular as she is, if not a little more so. It looks like you’ll be on even ground when the match starts, though who can say what the proud bullwoman will try and pull when it begins.");
	}
	else
	{
		output("\n\nYou know for a fact, though, you’re a lot stronger than she is. Her overconfident manner is just who she is rather than a reflection of her strength and you expect that to bear out in the match itself, though who can say what she’ll try and pull when it begins.");
	}

	var wrassleResult:Array = getWrassleResult();
	var pqResult:uint = wrassleResult[0];
	var pqRand:Number = wrassleResult[1];

	/*
	If your Physique doesn’t at least match Zephyr’s, instant fail.
	Can guarantee victory if you’re good enough, can also [Throw Match] to lose.
	*/

	output("\n\nWhen the match begins, neither of you make a real move, just holding your arms in place as if to test the other.");
	if (pc.isLactating())
	{
		output(" Zephyr seems to be focused on something else entirely - your [pc.breasts].");

		output("\n\n<i>“Oho, are you </i>lactating<i>, [pc.name]?”</i> she says with a smirk,");

		if (pc.RQ() >= 75)
		{
			output("\n\nQuick as a flash, you pull back out of her reach. <i>“That’d be cheating,”</i> you caution her.");

			output("\n\n<i>“Maybe,”</i> she admits, still smiling. <i>“But I can never resist a hot woman with milky tits.”</i>");
		}
		else
		{
			output("\n\nYou don’t pull back in time and Zephyr gets a nice grip on one of your [pc.nipples], rolling it between her fingers and chuckling when you can’t help but spurt a bit of milk and moan.");
			
			output("\n\n<i>“There’s a good cow,”</i> Zephyr tells you, wearing her smugness plainly.");
		}
	}

	output("\n\nWhen she begins to push you,");

	clearMenu();
	processTime(5+rand(5));

	if (pqResult == PQR_AUTOLOSS)
	{
		output(" it’s over in a flash.");

		addButton(0, "Next", zephyrBetLoss, wrassleResult);
	}
	else
	{
		var bWin:Boolean = (pqResult == PQR_AUTOWIN || (pqResult == PQR_RAND && pqRand > 0));
		
		output(" you offer just enough resistance to keep her in place and nothing more");
		if (pqResult == PQR_AUTOWIN) output(", not wanting to tip your hand just yet");
		output(".");

		output("\n\n<i>“Ooh, got a bit of muscle to you, huh?”</i> Zephyr croons, clearly delighting in the competition. <i>“See how long that lasts.”</i>");

		output("\n\nThe two of you begin straining, pushing at each other as you pour incrementally more strength into your efforts until, with a loud grunt, the winner is found.");

		addButton(0, "Next", (bWin ? zephyrBetWin : zephyrBetLoss), wrassleResult);
		addButton(1, "Throw Bet", zephyrBetLoss, wrassleResult);
	}
}

public function zephyrBetLoss(pqResult:Array):void
{
	clearOutput();
	showZephyrDeets();
	author("Wsan");

	var pqType:uint = pqResult[0];
	var pqRand:Number = pqResult[1];
	
	var ppZephyr:PregnancyPlaceholder = getZephyrPregContainer();

	if (flags["ZEPHYR_BETS_LOST"] == undefined)
	{
		zephyrBetLossMainScene(pqType, pqRand);
	}
	else
	{
		if (pqType == PQR_AUTOLOSS && flags["ZEPHYR_FUCKED_PC_PUSSY"] == undefined)
		{
			output("She slams your hand down on the table immediately, having barely exerted any effort at all, and fixes you with a withering stare.");
			
			output("\n\n<i>“If you’d wanted to get fucked in the ass by a horny amazon on Throbb you could have just bent over and asked,”</i> she sighs, seemingly disappointed. <i>“Wasn’t even trying. Whatever, get your ass over here.”</i>");

			output("\n\n");
		}
		else if (pqType == PQR_AUTOLOSS && flags["ZEPHYR_FUCKED_PC_PUSSY"] != undefined)
		{
			output("Hardly even trying, she casually whaps your hand to the table and holds on, grinning.");
			
			output("\n\n<i>“Looks like someone wants to skip the formalities and get right to business, huh?”</i>");

			output("\n\n");
		}
		else if (pqType == PQR_RAND && flags["ZEPHYR_FUCKED_PC_PUSSY"] == undefined)
		{
			output("With a strained grunt, she manages to get your hand onto the table and with a fierce grin, knocks your knuckles against it a few times for emphasis before letting go and hitting a double bicep flex.");
			
			output("\n\n<i>“Fuck yeah! First [pc.name], next Big T! Now bend over, "+ pc.mf("fuckboy", "bitch") +".");
			if (!pc.isNude()) output(" And take off your clothes.");
			output("”</i> Zephyr says, pointing.");

			output("\n\n");
		}
		else if (pqType == PQR_RAND && flags["ZEPHYR_FUCKED_PC_PUSSY"] != undefined)
		{
			output("With a strained grunt, she manages to get your hand onto the table and with a fierce grin, knocks your knuckles against it a few times for emphasis.");

			output("\n\n<i>“God damn, making me work for another round, huh?”</i> Zephyr huffs. <i>“That’s fine, I don’t mind chasing my meat before I skewer it.”</i>");

			output("\n\n");
		}

		if (pc.hasWombPregnancy() && !pc.hasPregnancyOfType("ZephyrPregnancy"))
		{
			output("<i>“Pity you don’t have room in there for another litter,”</i> she muses, idly jamming a finger in your [pc.pussy] from behind. <i>“Was thinking about");
			if (flags["ZEPHYR_FUCKED_PC_PUSSY"] == undefined) output(" starting a family recently");
			else output(" getting more kids out of you");
			output(". Oh well, maybe next time.”</i>");

			output("\n\n");
		}
		else if (pc.hasCock() && !pc.hasVagina())
		{
			output("<i>“Pity you haven’t traded that");
			if (pc.biggestCockLength() <= 3) output(" tiny");
			else if (pc.biggestCockLength() <= 7) output(" undersized");
			else if (pc.biggestCockLength() >= 12) output(" oversized");
			output(" cock of yours for a nice tight little womb for me to put a baby or four in. What good is this when your true place is laying back and getting fucked?”</i> She says, putting a hand on your [pc.cock] and bouncing it up and down. <i>“Oh well, I’m still gonna get off hard.”</i>");

			output("\n\n");
		}
		
		if (!pc.hasVagina() || (pc.hasWombPregnancy() && !pc.hasPregnancyOfType("ZephyrPregnancy")))
		{
			output("She all but");
			if (!pc.isNude()) output(" rips your clothes off and");
			output(" tosses you like a sack of potatoes over her desk, face up. You land with a thud and a clatter, knocking a bunch of her belongings off the side as the wild amazon advances on you, her oversized dogcock already fiercely erect and pointing north of her belly button. You get a good, thorough look at it as she holds your legs up and spread them apart and lays the base of her cock against");
			if (pc.hasVagina())
			{
				output(" your [pc.pussy], smirking");
				if (pc.hasCock()) output(" at your own [pc.cocks].");
				else output(".");
			}
			else if (!pc.hasVagina() && pc.hasCock() && pc.balls > 0)
			{
				output(" your [pc.balls], rubbing herself against them.");
			}
			else
			{
				output(" your [pc.groin] with a dominant smile.");
			}

			output("\n\n<i>“Lookin’ good, Steele,”</i> Zephyr says, eyeing your body. <i>“Like a piece of meat.”</i>");

			output("\n\nReaching over you to grab a bottle she spurts a bit of its contents into her hand and rubs it into her cock, her massive breasts wobbling in time with the motions. She gives you a lewd, knowing grin.");

			output("\n\n<i>“Enjoying the show, I bet. Just a teaser for what’s coming, my little bitch,”</i> she promises. <i>“Hope for your sake your asshole is at least a little loose.”</i>");
			
			output("\n\nPulling you forward a little before pushing your legs back up in the air, she pulls back and aligns yourself with your [pc.asshole], making sure to keep her eyes on your face the whole time.");
			
			output("\n\n<i>“You ready, [pc.name]?”</i> she asks. <i>“One, two-”</i>");
			
			output("\n\nThen she’s thrusting inside you, spearing you on her pointed tip and penetrating several inches inside.");
			if (pc.ass.looseness() < 3)
			{
				output(" You scream a little both in surprise and pain at the suddenness of the act, but it’s not that bad once the initial penetration is over - the lube helps a lot, it’s just that you’re feeling <i>really</i> stretched out right now, like she’s reshaping your insides.");
				pc.buttChange(ppZephyr.biggestCockVolume());
			
				output("\n\n<i>“Aw, looks like someone wasn’t up to date with their anal appointments,”</i> Zephyr huffs. <i>“You’ll have to swing by more often, fuckmeat. I’ll fix that for you overnight.”</i>");
			}
			else
			{
				output(" You groan both in surprise and pleasure as she slips inside you, your ass sucking in what feels like close to a foot of her. It’s enough to stretch you out and make you moan quietly as the shebull grips your legs tight.");
				pc.buttChange(ppZephyr.biggestCockVolume());
			
				output("\n\n<i>“Mmmmn, </i>fuck<i> yeah,”</i> Zephyr groans, smiling wickedly at you. <i>“Savor that feeling, it’s what defeat feels like.");
			}
			
			output("\n\nThen she’s working on getting fully inside you, thrusting into your");
			if (pc.analPuffiness() > 1) output(" donut");
			output(" ring with seemingly less concern for your pleasure than hers. She grunts every time she wins another hard-earned inch from your body, conquering you bit by bit until she lets out a happy sigh with her groin grinding against your own. She’s completely inside you, and from the looks of it she really wants to tell you about it.");
			
			output("\n\n<i>“You’re such a good little slut, [pc.name],”</i> Zephyr murmurs, prodding your [pc.stomach]. There’s a definite bump under your [pc.skinFurScales], and she gives it an intimate stroke. <i>“Look at you, taking my cock in your ass and then giving me the face that says you want more. So needy.”</i>");
			
			output("\n\nThat’s not what you’re doing... is it? She doesn’t give you time to ponder, following up her insults with a thrust that rubs you <i>just</i> right and forces you to let out a loud moan of joy, your");
			if (pc.hasVagina()) output(" pussy tightening in sympathetic reflex");
			else output(" your [pc.cock] hardening momentarily, even with her so deep inside");
			output(". She’s like a force of nature atop you, fucking your ass hard enough to make her desk shift a little with every savage push until, getting fed up with it, she releases her grip on your legs and just lifts you up into her lap.");
			
			output("\n\n<i>“Zephyr!”</i> you gasp, suddenly in a whole new world of sensation. She is <i>balls</i> deep inside you, arms wrapped around your back while she leans back a little and bounces you on her hips. <i>“Oh! Oh! Oh! Oh, god!”</i>");
			
			output("\n\n<i>“Mmmm, I like you like this,”</i> Zephyr growls appreciatively, baring her teeth in a feral grin. <i>“Let loose a little, [pc.name]. I’m the only one watching, and I’m the jealous type anyway.”</i>");
			
			output("\n\nIt’s not like you have a choice in the matter - she’s so <i>strong</i>, so dominant, so good. You’re in heaven, your [pc.chest] pressed against her giant, rounded breasts while she nails your ass with her massive cock, precum dribbling from your hole to run down your underside. You can feel an orgasm approaching already, looking into Zephyr’s face to see she’s not far herself.");
			
			output("\n\n<i>“Cum, inside me,”</i> you urge her in breathless, panting gasps. <i>“Zephyr!”</i>");
			
			output("\n\n<i>“Fuck yeah,”</i> she grunts, slamming you down on top of her swollen cock as you wrap your legs around your back. <i>“Let me feel you cum, bitch! Squeeze down on my cock! Nnngh!”</i>");
			
			output("\n\nYou cum seconds before she does, crying out in a high-pitched, shuddering moan as you’re brutally slid up and down Zephyr’s rock-hard dogcock.");
			if (pc.isHerm())
			{
				output(" [pc.cum] is forced from your [pc.cocks], splattering against the cow-amazon’s abdominal muscles and getting smeared all over as she grinds into you. Your empty pussy squeezes and flexes,");
				if (pc.isSquirter()) output(" coating Zephyr’s groin in femcum when you squirt hard enough/else: drooling femcum down onto Zephyr’s length");
			}
			else if (pc.hasCock() && !pc.hasVagina()) output(" You orgasm hard enough that your [pc.cum] spatters against Zephyr’s abdominal muscles and splashes you with flecks of it, more and more seed being forced from your [pc.cocks] with each rough bounce");
			else if (pc.hasVagina() && !pc.hasCock()) output(" paste from above");
			output(".");
			
			output("\n\nShe joins you moments later, suddenly hugging you against her so tight you can hardly breathe. You feel her cock enter into you deeply once, twice, then she groans blissfully right into your ear and leaves it inside on the third thrust. You can feel warmth blooming deep inside your guts, blossoms of her virile jizz spouting from her tip into you while your asshole squeezes her for everything she’s got. She keeps you there as she begins grinding her knot into you, and you realize with a mixture of dismay and anticipation that she’s going to keep you here for a lot longer than you thought.");
			
			output("\n\nThe thick, inflated knot pops as both of you moan in pleasure, ensuring none of her seed will be dripping down your shaking thighs just yet. She looks down at you, sweaty and redfaced, with a grin on her face.");
			
			output("\n\n<i>“Good little bitch... now I’m gonna fix my desk,”</i> she whispers to you, and suddenly she lets go.");
			
			output("\n\nSupported by only her stiffly erect cock and her massive knot, you flail in the air until you realize she’s got her arm around your swelling stomach. Zephyr chuckles good-naturedly.");
			
			output("\n\n<i>“I’m not just gonna let you fall on the ground, [pc.name]. You’re gonna stay </i>right<i> here and make sure you take every single drop of my cum before I let you go. Now stop waving around and be an obedient little bitch. I’ve got some work to do.”</i>");
			
			output("\n\nYour cheeks flush with embarrassment as you’re borne about the office, Zephyr idly picking things off the floor as she effortlessly supports you with one hand. She’s... she’s <i>wearing</i> you, like you’re nothing more than a warm, body-sized condom for her to dump her cum inside. You can’t help but cum again at the realization.");
			
			output("\n\n<i>“Aww, yeah, I think [pc.heShe] likes it,”</i> Zephyr says, grinning above you. <i>“Look at that. Maybe I oughta keep you around full-time as a cockwarmer. Doubt T would mind, keep me in a good mood too.”</i>");
			
			output("\n\nAbout half an hour later, Zephyr’s knot finally slips free of your tortured, abused asshole, now gaping wide and unable to close. Seed begins to run down your thighs, and she puts you down with a satisfied sigh, ensuring you can still stand on your shaking legs.");
			
			output("\n\n<i>“Now run along, </i>loser<i>,”</i> she says, taunting you with a smile. <i>“Come back soon. I wanna fill that ass up again as soon as possible.”</i>");
			
			output("\n\nYou find yourself outside her office,");
			if (!pc.isNude()) output(" redressed and");
			output(" wondering where the time went.");

			processTime(45+rand(15));
			pc.orgasm();
			pc.loadInAss(ppZephyr);

			clearMenu();
			addButton(0, "Next", mainGameMenu);
		}
		else if (pc.hasWombPregnancy() && pc.hasPregnancyOfType("ZephyrPregnancy"))
		{
			output("<i>“Oh?”</i> Zephyr hums, circling you and touching wherever she pleases. Stomach, lower back, ass, stroking your spine... <i>“Guess we’ll be going a little gentler today.”</i>");

			output("\n\n<i>“Why’s that?”</i> you ask.");
			
			output("\n\n<i>“Hey, don’t get all disappointed,”</i> Zephyr says,");
			if (pc.hasHair()) output(" running a hand through your [pc.hair]");
			else output(" shrugging");
			output(". <i>“We just need to not be so rough since you’re pregnant.”</i>");
			
			output("\n\n<i>“I can handl-”</i> you start to protest, but find your tongue suddenly occupied by Zephyr’s own. <i>“Mmph! Mmmn...”</i>");
			
			output("\n\n<i>“That’s my girl,”</i> she whispers, wrapping her arms around you as she pulls you into a passionate kiss, pressing your breasts against hers. You can feel just how hard her nipples are, rubbing against your own as she steals a kiss from you.");

			output("\n\n<i>“Now, spread your legs,”</i> Zephyr murmurs sultrily in your ear, practically purring while she rubs your stomach. <i>“Good girl, gooood girl...”</i>");

			output("\n\nYou can feel her cock rising and hardening between your [pc.thighs], thick and fat enough to extend all the way out past your [pc.pussy] and drip some tantalizing precum in front of you. It’s an enchanting sight, and the way she slowly starts to grind it against your slit makes you shiver in need. Without even realizing it, you’re moaning and biting your lip every time she slides between your nethers, lubing herself with your arousal until, suddenly, she stops.");

			output("\n\n<i>“Tell me how you want it,”</i> she commands you, nibbling your [pc.ear] from behind while her hands slide up your pregnant tummy to your [pc.breasts].");
			
			output("\n\n<i>“I - mmmn - want it in my ass,”</i> you confess, Zephyr immediately pulling herself out from between your legs and putting her thick, slippery cock between your asscheeks.");
			
			output("\n\n<i>“Oh? How do you want it, then?”</i> she asks, knowing how you’ll answer.");
			
			output("\n\n<i>“As deep as you can get it,”</i> you murmur back, and the next moment your wish comes true. <i>“Ooohhhhh, fuhhhnnnghh!”</i>");
			
			pc.buttChange(ppZephyr.biggestCockVolume());
			
			output("\n\n<i>“Shhh,”</i> Zephyr tells you, her fingers inside your mouth. <i>“Suck my fingers and keep quiet.”</i>");
			
			output("\n\nStanding");
			if (pc.hasFeet()) output(" on your tiptoes");
			else output(" unsteadily");
			output(", you moan into Zephyr’s fingers while her thighs begin to slowly slap against your [pc.ass], her slick canine cock spreading your asshole wide as you slide down the tapered length.");
			
			output("\n\n<i>“Mmmm, that’s good, isn’t it?”</i> she whispers in your ear, gently guiding you backwards until her ass hits the desk and seats herself on the edge. <i>“Why don’t you bounce on my cock a little, [pc.name]? See how nice it feels to have me deep inside you.”</i>");
			
			output("\n\nYou’re only too willing to take her up on that offer. With a lusty groan you sink right into her lap, a little thrill running up your spine at the sensation of fucking yourself on Zephyr’s fat cock. It’s far too big to fully stand up off it, something she no doubt took into account judging by her laid-back and smiling expression, arms spread as she contently watches you bounce up and down on her prick.");
			
			output("\n\n<i>“What a sight,”</i> you hear her murmur from behind you, a moment before you feel her hands on your breasts. <i>“Keep going, you sexy bitch.”</i>");
			
			output("\n\nHer hands massage and squeeze,");
			if (pc.isLactating()) output(" sending dribbles and spurts of milk down your front");
			else output(" forcing groans of pleasure from your lips"); 
			output(" even as you slide up and down her pole, letting gravity do most of the work whenever you reach her tip. Before long, both of you are panting in lust and barely-restrained need.");
			
			output("\n\n<i>“Nnnnn, fuck,”</i> Zephyr groans in satisfaction, her hands sliding down to your waist as she bites your neck. <i>“You’ve done an </i>amazing<i> job of keeping me right on the edge, but I really, really need to blow at least one load inside you. So I’m gonna get juuust a little rough...”</i>");
			
			output("\n\nShe stands up suddenly, rolling her hips upwards to fuck your asshole while the two of you are standing.");
			if (pc.tallness < 90) output(" As short as you are, every single thrust lifts you off the ground and forces air from your lungs in a short gasp");
			else output(" You can just barely withstand her thrusts without being lifted from the ground thanks to your height");
			output(", her hips slamming against your ass with the effort of fucking it.");
			
			output("\n\n<i>“Nnngh- almost there,”</i> Zephyr grunts, fucking you so hard you’d be stumbling forward if not for the tight grip she has on your hips. <i>“Soooo close-!”</i>");
			
			output("\n\nThanks to her pummeling your asshole so hard and the minutes of titillation, you cum moments before she does, ensuring that her big, worship-worthy cock gets the squeezing of a lifetime. Your asshole constricts around it so hard that she has to use her full strength to get it buried inside you, and the intense friction of doing so finally gets her to cum.");
			
			output("\n\n<i>“Ohhh, god, yes,”</i> Zephyr groans, slowing her pace just enough that you don’t have to pant for air like an animal. <i>“Take it aaall in, [pc.name]... That’s it...”</i>");
			
			if (pc.hasCock())
			{
				output("\n\nYour [pc.cocks] squirt");
				if (pc.cocks.length == 1) output("s");
				output(" straight up, fountaining spunk into the air as your [pc.vagOrAss] quivers and clenches, Zephyr’s");
				if (pc.cumQ() <= 10000) output(" far more voluminous");
				output(" jets of cum filling your behind and bloating your stomach even further");
			}
			else
			{
				output("\n\nYour [pc.pussy] clenches and quivers");
				if (pc.isSquirter()) output(" as you squirt all down your thighs, spattering the floor with femcum");
				else output(", femcum dripping down your thighs");
				output(" while Zephyr’s massive jets of cum fill your behind and bloat your stomach even further.");
			}
			
			output("\n\n<i>“Uuugh,”</i> you moan, sagging back into Zephyr’s strong grip, letting her hold you from behind and hump you from below.");
			
			output("\n\n<i>“Thaaat’s right, just relax,”</i> she murmurs in your ear, kissing your neck. <i>“Let me fill you up...”</i>");
			
			output("\n\n<i>“Mmmmn,”</i> you groan, leaning back as she licks your neck, watching your belly swell outwards.");
			
			output("\n\nIn the aftermath of her massive orgasm Zephyr leans you over and with a hand on your lower back, draws herself from your gaped asshole. A deluge of spunk follows, running down your [pc.thighs] and splashing to the ground. You groan as she pops free and stay bent over the table, giving Zephyr a nice look at what she’s done to you.");
			
			output("\n\n<i>“Lookin’ good, Steele,”</i> she says with a grin, patting you on the butt. <i>“Wouldn’t mind seeing you like this more often.”</i>");
			
			output("\n\nAn insensate moan of pleasure is your reply.");
			
			output("\n\nZephyr helps clean you up and stand you back on your feet and gives you a kiss, holding you at the waist.");
			
			output("\n\n<i>“There you go, cutie. Thanks for swinging by,”</i> she says, sweeping you into a hug while being careful to not squeeze you too hard. <i>“Feel free to come back any time you need a refresher before your delivery.”</i>");

			output("\n\nWith a pat on your [pc.butt] and a friendly hand on your head, you find yourself outside Zephyr’s office.");

			processTime(45+rand(15));
			pc.loadInAss(ppZephyr);
			pc.orgasm();

			clearMenu();
			addButton(0, "Next", mainGameMenu);
		}
		// PC has empty primary womb, first time:
		// I'm assuming "First time we've seen the repeat variant..."
		else if (!pc.hasWombPregnancy() && flags["ZEPHYR_RAWDOGGED_PUSS"] == undefined)
		{
			IncrementFlag("ZEPHYR_RAWDOGGED_PUSS");

			output("Midway through, she stops you with a hand around your arm, oddly tight and sweaty.");

			output("\n\n<i>“Actually,”</i> she says, a gleam in her eye. <i>“How about we raise the stakes?”</i>");

			output("\n\nGiven that you’re the one who opened up the idea of betting, you let her go on.");

			output("\n\n<i>“I’ve been thinking about starting a family recently, you know,”</i> Zephyr says,");
			if (pc.hasLowerGarment()) output(" your [pc.underGarments] still hanging around your thighs");
			else output(" checking you out very unsubtly");
			output(". <i>“I don’t fancy any of the dumb bitches around here, but you...”</i> she murmurs, slipping her thick middle finger between your legs and right up your [pc.pussy], <i>“you’re a bit different. I can see a future with you, one that doesn’t constrict my future to the horizon of New Texas.”</i>");

			output("\n\n<i>“Not to mention you’re kind of an insatiable slut, and with the Throbb you gave me I’m really, </i>really<i> gonna need you to employ that to take care of my... urges,”</i> she purrs, drawing close enough that you can feel the bulge of her half-hard cock through her skirt. <i>“So? How about it? If I lose, you can do whatever, I don’t know. Fuck my face. If I win again,”</i> she whispers, sliding a finger along your collarbone while she slowly works your pussy with the other, <i>“I’m going to hold you down and fuck your little cunt until you’re more pregnant than a New Texas breeding slut.”</i> She moves her mouth closer, her breath hot in your ear. <i>“I promise.”</i>");

			if (pc.isBimbo())
			{
				output("\n\nYou don’t even remember what happens next. All you know is that Zephyr, the beautiful, muscular Amazon woman is approaching you with her utterly gigantic cock out, and you find yourself instinctively standing with a wider stance, spreading your legs just in case she wants to cram that in your pussy while you’re standing. You think there was something like wrestling before this, but that doesn’t seem right - you’re going to be doing the wrestling <i>now</i>, aren’t you?");

				processTime(5+rand(5));

				clearMenu();
				addButton(0, "Next", zephyrBetLossDoubleDown);
			}
			else
			{
				processTime(5+rand(5));

				clearMenu();
				addButton(0, "DoubleDown", zephyrBetLossDoubleDown);
				addButton(1, "Don’t", zephyrBetLossDont);
			}
		}
		else
		{
			output("<i>“So you’ve lost, and you remember what happened the first time,”</i> Zephyr murmurs, getting closer and circling you, embracing you from behind. She puts a hand on your lower stomach, fingers edging closer to your [pc.pussy] and sliding across your [pc.clit]. <i>“I know I do.”</i>");

			output("\n\n<i>“Aah,”</i> you moan, reflexively rolling your hips at her touch, to which she responds by holding you in place and slowly rubbing your clit");
			if (pc.vaginas.length > 1) output("s");
			output(".");

			if (zephKnowsAboutKids())
			{
				output("\n\n<i>“So, you want to bet for another addition to our family?”</i> Zephyr whispers in your ear, letting you hover at the edge of orgasmic excitement. <i>“I’ll even let you have the illusion it’s your choice.”</i>");
			}

			processTime(5+rand(5));

			clearMenu();
			addButton(0, "DoubleDown", zephyrBetLossDoubleDown);
			addButton(1, "Don’t", zephyrBetLossDont);
		}
	}

	IncrementFlag("ZEPHYR_BETS_LOST");
}

public function zephyrBetLossMainScene(pqType:uint, pqRand:Number):void
{
	var ppZephyr:PregnancyPlaceholder = getZephyrPregContainer();
	
	if (pqType == PQR_AUTOLOSS)
	{
		output("She slams your hand down on the table, having barely exerted any effort at all, and fixes you with a withering stare.");
		
		output("\n\n<i>“If you’d wanted to get fucked in the ass by a horny amazon on Throbb you could have just given me the medipen,”</i> she sighs, seemingly disappointed. <i>“Wasn’t even trying. Whatever, hand it over.”</i>");

		output("\n\n");
	}
	else if (pqType != PQR_DOUBLELOSS)
	{
		output("With a strained grunt, she manages to get your hand onto the table and with a fierce grin, knocks your knuckles against it a few times for emphasis before letting go and hitting a double bicep flex.");

		output("\n\n<i>“Fuck yeah! First [pc.name], next Big T! Now hand over the medipen, " + pc.mf("fuckboy", "bitch") +".");
		if (!pc.isNude()) output(" And take off your clothes.");
		output("”</i> Zephyr says, holding out her hand.");

		output("\n\n");
	}

	output("Your dominant arm still smarting a bit after your loss, you have to give her the medipen with the other hand. She snatches it away and immediately pulls down her skirt, giving you a nice view of what’s to come.");
	if (!pc.isNude()) output(" Struggling out of your clothes with one arm that’s half-useless, you disrobe");
	else output(" Already as ready as you’ll ever be thanks to being a nudist, you take your Codex off");
	output(" and watch Zephyr apply the Throbb. The results are pretty much immediate.");

	output("\n\n<i>“Oh, fuck,”</i> Zephyr curses, gritting her teeth. <i>“I can feel it...”</i>");
	
	output("\n\nThe medipen falls to the floor as Zephyr groans, gingerly touching her rapidly inflating dogcock as it reaches full erection, the tennis-ball sized knot bulging at her base. Then, as she moans violently, it swells. Once, at first. Her dick widens, adding an inch or so to her diameter, then another few to her length as she doubles over in front of her desk. You rush to support her, suddenly fearful that maybe giving illegal drugs to New Texas’ unofficial secretary of state was a bad idea.");
	
	output("\n\nAll of that fades away when she grips your shoulder like an iron vise, pulling herself up and leering");
	if (pc.tallness < 96) output(" down");
	output(" at you with a ferocious grin. With her other arm she pulls your waist closer, close enough to press her fat cock against your [pc.tummy] and have you <i>feel</i> the changes she’s going through. Triumphantly panting in your ear, she’s growing at a record pace - you can feel her canine prick swelling in all directions, not to mention her knot.");

	output("\n\nIt’s almost doubled in size, a terrifying prospect for any mating partner. And this is meant to go in your ass? You have to admit, the results are making you a little nervous. You’ve never seen such an overwhelming cock combined with a person like Zephyr, who");
	if (flags["ZEPHYR_FUCKED_PC"] != undefined) output(" already had a proclivity for rough, dominant sex");
	else output(" you can only assume has a penchant for rough sex");
	output(". A deep, low groan issues from the back of her throat through her grit teeth, though she keeps her desirous eyes trained on yours. The sheer heat of her gaze is enough to make you");
	if (pc.isHerm()) output(" instantly erect and dripping wet below that,");
	else if (pc.hasCock()) output(" instantly erect,");
	else output(" dripping wet,");
	output(" the thought of what she’s going to do to you occupying your mind.");

	output("\n\n<i>“Having fun out there, Zephyr?”</i> a voice calls from behind the closed door, chuckling indulgently. She ignores it.");

	output("\n\n<i>“Oooooh, </i>fuck<i>,”</i> Zephyr finally breathes, and when she opens her mouth you’d swear steam comes out. Her erect cock reaches from your stomach to the top of your chest, nestled between");
	if (pc.biggestTitSize() < 1) output(" your pecs");
	else output(" your [pc.breasts]");
	output(" and oozing precum. <i>“You’d best turn around before I use your face instead.”</i>");

	output("\n\nWithout waiting for an answer, she spins you to face the other way, then picks you up and pivots, putting you back down so she’s got you standing in front of her desk with her behind you. A strong hand on your back forces you downwards while she pulls your legs apart with her own, ensuring you couldn’t close them if you wanted. Being manhandled so roughly makes you");
	if (pc.isHerm()) output(" wet and erect");
	else if (pc.hasVagina()) output(" wet");
	else if (pc.hasCock()) output(" erect");
	output(" all on your own, strands of arousal");
	if (pc.hasVagina()) output(" hanging between your [pc.thighs]");
	else if (pc.hasCock()) output(" hanging from your [pc.cockHead]");
	output(".");

	output("\n\n<i>“Shoulda guessed you’d get all");
	if (pc.hasVagina()) output(" soaked");
	else output(" hard");
	output(" being treated like this, huh?”</i> Zephyr grumbles, aligning herself with your [pc.asshole]. <i>“Doubt you tried to win at all, you little slut.”</i>");

	if (pc.isBimbo()) output("\n\n<i>“Whaaaat?”</i> you moan shakily, grinding your [pc.ass] into her fat, juicy cock. <i>“Nooo...”</i>");
	else output("\n\n<i>“I wouldn’t do that,”</i> you say, shaking your head. <i>“I keep everything above-board, you know?”</i>");

	output("\n\n<i>“Yeah, whatever. Fucking brace yourself, slut. Nnnnngggh!”</i> she grunts, forcing herself into you. <i>“Come on [pc.name], open wide!”</i>");

	output("\n\nFuck,");
	if(pc.ass.wetness() >= 2) output(" even with your lubed asshole, you feel your are not quite prepared");
	else output(" she didn’t even wait to lube you or anything");
	output("! You bite your bottom lip and try not to scream as the tapered tip of her newly enlarged penis slides into your [pc.asshole], dragging along the sensitive skin.");
	
	pc.buttChange(ppZephyr.biggestCockVolume());
	
	output(" Your body squeezes down on her out of instinct, trying to arrest her progress, and thankfully manages to eke a squirt of precum from her tip for");
	if(pc.ass.wetness() >= 2) output(" extra");
	output(" lube. What you discover a few seconds later, though, when she thrusts into you so hard your [pc.feet] momentarily come off the ground, is that being lubed enough for her to penetrate you isn’t necessarily a good thing.");
	
	output("\n\n<i>“Oh, fffuck!”</i> you cry out, scattering papers off her desk as you scrabble for grip. <i>“Nnnnhhhh!”</i>");
	
	output("\n\n<i>“Fuckin’ knocking my work around and shit, goddamnit!”</i> Zephyr says, giving you a hard spank before pulling you even closer and down onto her angrily swollen cock. <i>“Just fucking take it like the bitch you are!”</i>");
	
	output("\n\nYou have to struggle not to pass out, your eyes threatening to roll back into your head as she inexorably drags you downwards to her impossibly-fat base. Each thick, red inch of her dogcock that slides into your asshole feels like it forces that much more of your brain out of your ears, until she finally gets you to the base and you’re drooling and moaning.");
	
	output("\n\n<i>“Hooo fuck,”</i> Zephyr sighs, blowing out a big puff of air. <i>“That’s so much better. See, it wasn’t that bad. Now you get to bounce on it until I cum.”</i>");
	
	output("\n\n<i>“Guuhhh,”</i> you moan, jiggling around as Zephyr repositions you.");

	output("\n\n<i>“Hmm. Might be better if...”</i> Zephyr trails off, lifting you up and onto her desk so you’re lying across the entire wooden surface. <i>“There.”</i>");
	
	output("\n\nShe climbs up after you and reinserts herself, lying down atop you. You can feel her generous bosom across your back, leaking a little bit of milk in her arousal even as she starts to pump you full all over again.");
	
	output("\n\n<i>“Aaah, fuck,”</i> Zephyr sighs leisurely, fucking your rump at a medium pace. <i>“See how good it is when you just shut up and get fucked? You should swing by a lot more often...”</i> Spreading herself out on top of you and locking your limbs outward so you can’t even move, she starts fucking you harder from above.");
	
	output("\n\nCompletely helpless to resist, you really have no choice than to just do what she says: shut up and get fucked. That doesn’t mean you can’t enjoy it though, and god damn if that massive cock of hers isn’t rubbing you in all the right ways!");
	
	output("\n\n<i>“Gonna, c-cum,”</i> you moan from beneath her, feeling the way your cheeks spread apart every time she fucks you down to her knot.");
	if (pc.hasCock()) output(" Not to mention the way she’s grinding against your prostate, spilling drippy precum all over her work.");

	output("\n\n<i>“So?”</i> Zephyr asks, not stopping for even a second, and you don’t really have an answer to that.");

	output("\n\nShe hammers you into the desk, the slap of muscle on assflesh resounding throughout her office. You utter a low, shaky scream of pleasure as she <i>forces</i> the orgasm out of you,");
	if (pc.isHerm())
	{
		output(" seed spurting all up your [pc.stomach] even as your empty cunt");
		if (pc.vaginas.length > 1) output("s");
		output(" spasm");
		if (pc.vaginas.length == 1) output("s");
		output(" and squeeze");
		if (pc.vaginas.length == 1) output("s");
		output(", leaking femcum all down your [pc.thighs]");
	}
	else if (pc.hasCock()) output(" seed spurting all up your [pc.stomach]");
	else
	{
		output("empty cunt");
		if (pc.vaginas.length > 1) output("s");
		output(" spasming and squeezing");
	}
	output(". Zephyr completely ignores it, briefly lifting one hand from your arm to give you a nice, rough spank just for cumming early.");
	
	output("\n\nYou groan, scream and moan all throughout your orgasm, clawing at the corners of the desk, Zephyr nonstop pumping your ass all the while. Holding you tightly, she grunts in pleasure while you instinctively flex and squeeze around the base of her cock, eking every last bit of");
	if (pc.hasCock()) output(" cum");
	else output(" fluid");
	output(" out of you.");
	if (pc.hasCock())
	{
		if (pc.cumQ() <= 7500) output(" You’ve made a mess of her desk, but it’s still recoverable... if you don’t cum again");
		else output(" Thanks to your massive load, Zephyr’s work is pretty much unrecoverable.");
	}
	output(" You don’t know if she’ll blame you for feeling <i>too</i> good on the end of her cock, but you have to admit the thought of punishment by this fat-cocked dom bitch makes you spine tingle a little more than it already is.");
	
	output("\n\n<i>“Mmmm I’m gonna cum soon, my little buttslut,”</i> she whispers in your ear, straightening you out and beginning to fuck as hard and deep as she can, burying herself deep in your ass. <i>“And you fuckin’ </i>bet<i> you’re taking the knot.”</i>");
	
	output("\n\nIt’s not like you have a choice! Having just cum, all you can do is try to hang on and ignore the telltale signs that you might be cumming again by the time she does knot you. The way she’s just fucking pounding you with no holding back feels so fucking good, Zephyr’s selfishness ironically giving you what feels like the best, roughest assfuck of your life. It’s not long until she suddenly groans, wrapping her arms around your shoulders and begins pushing at your asshole even harder.");
	
	output("\n\nYou can feel yourself widening down there to an insane degree, Zephyr’s knot forcing itself into your asshole with every spirited thrust until, finally, it sinks inward. You groan in equal parts pleasure and relief, but know as you feel yourself closing back up around its base, you’re going to be here for a <i>while</i>.");
	
	output("\n\n<i>“Aww, fuck, cumming,”</i> Zephyr grunts, hugging you tightly from behind. <i>“Nnnnnnggh! Nnnnnhhh!”</i>");
	
	output("\n\nRight as you let out a loud, slutty moan, Big T’s door swings open and you look up in open-mouthed horror. With Zephyr atop you groaning in release, her massive ejaculation pumping upwards right into your stomach, you’re met with the sight of");
	if (flags["MET_ELLIE"] == undefined) output(" a female leithan");
	else output(" who else but Ellie");
	output(", who puts a finger to her pouty lips and smiles at you.");
	
	output("\n\n<i>“Oooh, this looks like fun! Any room for lil’ ol’ me?”</i>");
	if (flags["MET_ELLIE"] == undefined) output(" the leithan");
	else output(" Ellie");
	output(" asks, and you can’t help but groan in reply with the way Zephyr’s filling you.");

	output("\n\n<i>“Little busy, Ellie,”</i> Zephyr grunts, putting a hand on the back of your head and forcing you to look back down. Redfaced and panting in lust, you can only hear and not see Ellie as she prances by with a sing-song <i>“Sorry!”</i> and a giggle.");

	output("\n\n<i>“Ignore her and just focus on this,”</i> Zephyr advises you, and once again you find yourself without a choice. The way she’s filling your asshole up, she’s your entire world right now. It’s impossible to think of anything but just how much hot, sticky seed is <i>pumping</i> out of her cock and into your insides.");
	
	output("\n\n<i>“That Throbb shit really doesn’t fuck around,”</i> Zephyr says, sliding one hand down to possessively rub your still-swelling stomach. <i>“I feel like I could keep you here all day if I really wanted...”</i> she teases you. She is teasing, right..?");
	
	output("\n\n<i>“Kidding,”</i> she murmurs after a second. <i>“You </i>are<i> a lot of fun to fuck, though. Not many can keep up");
	if (pc.isBimbo()) output(", even if you are one of the bimbos");
	output(".”</i>");
	
	output("\n\nAll you can really do by way of reply is moan at length, sounding every bit like an unrepentant whore, just another New Texas slut, but Zephyr doesn’t seem to mind.");
	
	output("\n\n<i>“Nnnn, you sound like you’re having fun,”</i> she mutters, gently biting your [pc.ear]. <i>“Is my cock that good?”</i>");
	
	output("\n\nYou don’t manage a verbal reply, but you’re pretty sure she gets the message. You spend the next hour knotted down, Zephyr whispering cruel promises in your ear about how you can be her bitch if you really want while she");
	if (pc.isHerm()) output(" alternates bringing you to orgasm by jerking you off and fingerfucking you");
	else if (pc.hasCock()) output(" roughly jerking you off");
	else output(" roughly fingerfucking you");
	output(". Her fingers are somehow the perfect size to");
	if (pc.isHerm())
	{
		output(" encapsulate");
		if (pc.biggestCockLength() <= 5) output(" your entire cock");
		else output(" the entire width of your cock");
		output(" and feel like a fat, flexible dick in your cunt");
	}
	else if (pc.hasCock())
	{
		output(" fit");
		if (pc.biggestCockLength() <= 5) output(" your entire cock inside them");
		else output(" the entire width of your cock in her grip");
	}
	output(", bringing you to completion so many times you lose count. By the time her knot is even beginning to show signs of deflating, Zephyr’s desk is covered in your juices.");
	
	output("\n\n<i>“Mmmmmmngh,”</i> Zephyr groans, lifting you off her cock and letting you fall across her desk. <i>“Good job, slut. Now get yourself cleaned up and get out of here.”</i>");
	
	output("\n\nShe gives you a hard spank on your way out of the office, smiling devilishly when you look back at her. Closing the door behind you, you give your tender butt a rub... that smarts.");
	
	IncrementFlag("ZEPHYR_THROBBED");
	
	processTime(45+rand(15));
	pc.loadInAss(ppZephyr);
	for (var i:int = 0; i < 3; i++) pc.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function zephyrBetWin(pqResult:Array):void
{
	clearOutput();
	showZephyrDeets();
	author("Wsan");
	
	var cIdx:int = -1;
	if (pc.hasCock()) cIdx = pc.biggestCockIndex();
	
	output("<i>“Fucking shit,”</i> Zephyr curses, rubbing her right arm’s bicep. <i>“How does a fucking kid like you even get that strong? Damn.”</i> After a few moments of expectant silence, she sighs. <i>“Well, a bet’s a bet.”</i>");
	
	output("\n\nStriding over to you, she");
	if (!pc.isNude()) output(" immediately begins stripping you down, your lower garments fluttering through the air to land on the floor");
	else
	{
		output(" eyes your");
		if (cIdx >= 0) output(" erect cock");
		else output(" hardlight strapon");
		output(" critically");
	}
	output(". Stepping over your legs, her distractingly massive tits are suddenly in your face as she bends her powerful legs.");
	
	output("\n\n<i>“No");
	if (pc.ass.wetness() >= 2) output(" extra");
	output(" lube?”</i> you ask, raising an eyebrow.");
	
	output("\n\n<i>“I’m an Amazon,”</i> she grunts, positioning herself over your");
	if (cIdx >= 0) output(" [pc.cockHead " + cIdx + "]");
	else output(" faux-cockhead");
	output(". <i>“We like it rough.”</i>");
	
	output("\n\nWith grit teeth and set jaw, she drops herself onto your [pc.cockOrStrapon " + cIdx + "] with a groan, sliding halfway down its length. Rolling her hips, she begins to fuck herself deeper inch by inch, biting her lip and making a satisfied growl with every thrust.");

	output("\n\n<i>“This is nice, but I don’t think you should be the one in charge when you just lost,”</i> you grunt, grabbing her arms pushing her upward from below.");
	
	output("\n\n<i>“You-”</i> Zephyr strains through grit teeth, struggling to resist. Slowly, shakily, you manage to stand yourself up while she tries to keep you in your seat with her full strength, then begin to inexorably bend her backward over her own desk. <i>“Hrrrrnnnngggh!”</i>");
	
	output("\n\n<i>“Not so- fucking tough now, huh?”</i> you pant, veins standing out on your arms like cords. Sweat rolls down your [pc.chest] with the effort of restraining her, your muscles bulging as you exert your strength. <i>“Gonna hold you down and fuck you like you’re- just one of the bimbos!”</i>");
	
	output("\n\n<i>“Not... a fucking... bimbo!”</i> she seethes, trying and failing to get you off her.");
	
	output("\n\n<i>“Doesn’t look like your body agrees,”</i> you grunt, flicking your eyes downwards as your strength becomes too much for her to resist. <i>“I’ve never seen someone so obviously turned on and in denial. Here!”</i>");
	
	output("\n\nYou thrust upwards roughly, hard enough to actually lift a wide-eyed Zephyr off her hooves for a scant second. She lands on your [pc.cockOrStrapon " + cIdx + "] and slides down to the hilt moaning all the way, her hole stretching to take you in.");
	
	if(cIdx >= 0) pc.cockChange();
	
	output("\n\n<i>“Feels pretty good, don’t it?”</i> you say,");
	if (pc.isTreatedBull()) output(" your Treatment-induced twang coming to the fore");
	else output(" mimicking the slang of NT bulls");
	output(". <i>“Now why don’tcha just settle down and be a good girl?”</i>");

	output("\n\nFor all her bluster and bravado, Zephyr’s cock is <i>raging</i> hard and her nipples, if it’s possible, look even harder. You bring her arms together over her head and slam her down on her desk, holding her down with one hand and using your free one to get in a nipple squeeze.");
	if (pc.isAmazon(true)) output(" Being familiar with Treated amazon physiology, you’re not surprised at all when she squirts a stream of milk all down your front, dripping");
	else output(" To your surprise, she squirts a stream of milk all down your front, where it drips");
	output(" onto her squirming body and then the wood below her.");
	
	output("\n\n<i>“That looks like an invitation,”</i> you murmur, lowering your head to one of her massive breasts and sucking from her nipple. Zephyr’s milk is <i>delicious</i>, and you find yourself halting your strokes momentarily just to drink a bit more. You can hear her struggling to suppress moans as you suck more and more from her sensitive nipple, switching breasts after you swallow enough. Strangely, you feel like you’re actually getting <i>stronger</i> mid-fuck, <i>less</i> tired instead of more.");
	
	output("\n\n<i>“Damn, Zephyr, is it your milk making me feel this way? I feel - nngh! Like I could move a mountain.”</i>");
	
	output("\n\nShe throws you a glare. <i>“Amazon mi- rrgh! Milk is meant fffffuh! For our partners! So they cannnuhh! Recover after sex with us!”</i>");
	
	output("\n\nAt that, you can’t help but laugh. <i>“Hahaha! How’s that working out for you right now, huh? Making your dominator even stronger?”</i>");
	
	output("\n\n<i>“Ffffuck you!”</i> she moans, trying to resist the sensation of your hips rolling into her own. She’s stopped resisting so much since you drank the milk - or maybe you’re just imbued with enough strength right now to not really notice hers. Either way, she’s a lot easier to move around and fuck than she was at the outset.");
	
	output("\n\nWith a particularly rough thrust now that you see no reason to hold back, you manage to get the first possible <i>positive</i> feedback from the angry amazon on your [pc.cockOrStrapon " + cIdx + "].");
	
	output("\n\n<i>“Guh!”</i> Zephyr winces, precum dripping from her tip. <i>“Fuckinnnngggh-!”</i>");

	output("\n\nLooks like you found her prostate.");
	
	output("\n\n<i>“Oh? It’ll be fun to make you cum from that,”</i> you mutter, angling yourself to rub her with every stroke.");
	
	output("\n\n<i>“Ffffuhh! Fuck off,”</i> she pants, not even really noticing that you’ve long since let her arms go. She spreads them to brace herself against your rough, steady thrusts, ensuring you get as deep as possible with each one. <i>“Like you could m- nnnnghfuck! Make me cum!”</i>");
	
	output("\n\n<i>“Pfft, yeah,”</i> you snort. <i>“If I could make you cum - nnngh - then you might have to admit getting fucked is fun. I’m gonna make your");
	if (flags["ZEPHYR_THROBBED"] == undefined) output(" little cock");
	else output(" oversized cock");
	output(" shoot all over those heavy tits of yours whether you want it or not, bitch.”</i>");

	output("\n\n<i>“Fuh! Fucking try it,”</i> she breathlessly challenges you, squeezing down on your");
	if (cIdx >= 0) output(" cock");
	else output(" dildo");
	output(" as hard as she can. She clearly intends for you to");
	if (cIdx < 0) output(" be overcome by the strapon’s feedback and");
	output(" cum before she does - too bad for her she’s just hastening her own orgasm. With how tight she’s holding you, it’s a cinch to roughly rub her prostate even as you get deeper than you thought possible into her ass.");
	
	output("\n\n<i>“Ohhh!”</i> Zephyr groans");
	if (cIdx < 0 || pc.cLength(cIdx) >= 9) output(", looking down in dismay at her taut stomach as it bulges with the imprint of your cockhead");
	output(". <i>“Fucking hell, Steele!”</i>");
	
	output("\n\n<i>“Oh right, you don’t mess around with the bulls, do you?”</i> you ask");
	if (cIdx < 0 || pc.cLength(cIdx) >= 9) output(", casually angling yourself upwards to distort that pale, milky skin with your dick");
	output(". <i>“Guess this’ll all be new to you, then. If it’s any consolation, you look really good on your back like this.”</i>");

	output("\n\nShe doesn’t respond, her expression somewhere halfway between astonishment at how deep inside her you are and anger that you’re defiling her body. Plus, you think, a little wonder and healthy curiosity. Taking advantage of her momentary fugue state, you start fucking her as hard as you can, [pc.skinFurScales] slapping against Zephyr’s spread thighs with every thrust. It doesn’t take long for her to be unable to resist the treatment, shaking underneath you.");
	
	output("\n\n<i>“Gohhh- goddamnit,”</i> she grunts through grit teeth, fighting against her instincts even as her powerful legs close around your back, keeping you inside her. <i>“Uh! Uuuuhhh! Uuunnnnhhhhhh!”</i>");
	
	output("\n\nWith a helpless cry, she thrusts upwards in time her first spectacular ejaculation, her spunk shooting up her own front and coating her tits. You fuck her all throughout, timing your thrusts with the bucks of her hips so every time she comes down, you’re there to hilt yourself inside her. With your help, she winds up breathlessly panting as she covers her entire front in creamy jizz.");
	
	output("\n\n<i>“Mmmm, you might be an amazon,”</i> you say, squeezing her breasts a little roughly, <i>“but you’re definitely still a cow.”</i>");
	
	output("\n\n<i>“Uh! Uuuhhh!”</i> Zephyr groans, tossing her head from side to side even as she presses her chest into you. She’s practically insensate from pleasure and still trying feebly to resist, but her body is having none of it. You get a nice spurt of milk from her spunk-covered tit and bring your other hand into play as well, groping both of her gigantic, milk-filled breasts hard enough to make her squirt most of their content all over herself.");

	output("\n\n<i>“You’re a lot of fun to play with, you know that?”</i> you grunt, feeling the familiar pleasure of orgasm beginning to surface. Bucking your hips into her so hard her ass and lower back begin to lift off the desk with the strength of your thrusts, you");
	if (cIdx >= 0) output(" cum inside her ass");
	else output(" finally cum while buried inside her ass");
	output(" with enough force to make her arch her back off the desk. You have to grab her around the waist just to be able to move her properly, slamming her up and down on your cock while she moans in joy.");

	output("\n\nYou only realize halfway through that you’re forcing her to have a dry orgasm, and that’s why she’s squeezing down on you so hard while she moans like a whore. Pulling out with a wet slurp, you push her legs together and rub yourself between her thighs");
	if (cIdx >= 0) output(" just to splatter her front with your cum as well as her own");
	else output(" to finish your orgasm off, revelling in her facial expression");
	output(".");

	output("\n\nCovered in her own jizz, milk, and sweat, Zephyr is coated pretty much head to toe in some kind of byproduct of your victory. Job done and superiority proven, you heave a sigh of satisfaction and turn away, making to leave. You could do with a shower. You have your hand on the door when she calls out from behind you, causing you to turn and look.");

	output("\n\n<i>“Just going to leave it at that, Steele?”</i> Zephyr taunts you, lifting a leg and putting it on her desk. <i>“Too tired to go on, ‘champ’?”</i>");
	
	output("\n\n<i>“Alright,”</i> you say, shrugging and turning back to her, walking over until you’re back between her legs. <i>“I half-expected this anyway.”</i>");
	
	output("\n\n<i>“Expected what?”</i> she asks suspiciously, sneaking a look down at your " + (cIdx >= 0 ? "[pc.cock " + cIdx + "]" : "glowing phallus") +".");

	output("\n\n<i>“That you’d lie to get more of");
	if (cIdx >= 0) output(" my cock");
	else output(" this");
	output(",”</i> you say, putting your hands on her wide, womanly hips.");

	output("\n\nBefore she even has time to reply, you’re back in her ass and picking the surprised cow-woman up off the desk to slam her against a wall, fucking her so hard she’s left gasping for air amidst the pleasure. If your previous tryst was rough, this must be bordering on violence - but with the way Zephyr has her legs wrapped around your back while she cries out between grit teeth, you think she’s handling it alright. A cursory glance at her expression reveals her open-mouthed amazement, perhaps at the fact anyone could treat her this way or maybe at the fact she’s enjoying it so much.");

	output("\n\nEither way, by the time you cum again and leave her in a messy pile on the floor of her own office, she’s not going to be getting back up for a while.");
	if (!pc.isNude()) output(" Throwing your clothes back on, y");
	else output(" Y");
	output("ou crack a window - it’s pretty stuffy in here now, after all - and head out the door. Remembering something, you pop your head back inside just to remind her. <i>“Oh, and I’ll be available for more bets if you think you can handle it. Cya!”</i>");

	output("\n\nClosing her office door behind you, you find yourself face to face with");
	if (flags["MET_ELLIE"] == undefined)
	{
		output(" an adorable tauric woman.");

		output("\n\n<i>“Hey there,”</i> you say, scratching your neck. <i>“You here for Zephyr?”</i>");
	}
	else if (flags["ELLIE_OPERATION"] == undefined || flags["ELLIE_OPERATION"] < 3)
	{
		output(" Ellie, the NT’s giftshop beauty.");

		output("\n\n<i>“Hey Ellie,”</i> you say, smiling a little sheepishly. <i>“I just finished up with Zephyr, if you’re here to see her.”</i>");
	}
	else
	{
		output(" Ellie, your ardent lover and NT’s resident giftshop beauty.");

		output("\n\n<i>“Hey lover,”</i> you murmur, leaning in to kiss Ellie on the lips. <i>“I just finished pounding the daylights out of Zephyr, if you’re here to see her.”</i>");
	}

	output("\n\n<i>“Uh, yeah,”</i>");
	if (flags["MET_ELLIE"] == undefined) output(" the leithan");
	else output(" Ellie");
	output(" giggles, glancing at you. <i>“I could hear her from down in the store. So are you done? Does she need help cleaning up?”</i>");

	output("\n\nYou can’t think of anything that would piss Zephyr off more. <i>“Absolutely.”</i>");

	output("\n\n<i>“Great!”</i> she chirps happily,");
	if (flags["MET_ELLIE"] == undefined) output(" skipping past you into the office. <i>“Oh... </i>wow<i>.”</i>");
	else
	{
		output(" reciprocating by giving you a quick, affectionate kiss on the cheek and a wink before skipping past you into the office. <i>“Oh... </i>wow<i>.”</i> She peeks back around the corner. <i>“Got time to do me like you did her?”</i>");

		output("\n\n<i>“Maybe later,”</i> you promise, waving as you descend the stairs. <i>“Seeya Ellie!”</i>");

		output("\n\n<i>“Bye!”</i> she calls, waving you off before turning back to Zephyr. <i>“Jeez! This is gonna take a while...”</i>");
	}

	IncrementFlag("ZEPHYR_BETS")
	IncrementFlag("ZEPHYR_BETS_WON");
	flags["ZEPHYR_LAST_BET_RESULT"] = "WON";

	processTime(30+rand(10));
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function zephyrBetLossDoubleDown():void
{
	clearOutput();
	showZephyrDeets();
	author("Wsan");

	output("Zephyr strips off to be completely naked,");
	if (!pc.isNude()) output(" and for some reason you follow suit. If you’re going to go all-out for this, you might as well both be ready for the consequences.");
	else output(" matching your nudity. Now you’re <i>both</i> ready for the consequences.");

	var wrassleResult:Array = getWrassleResult();
	var pqResult:uint = wrassleResult[0];
	var pqRand:Number = wrassleResult[1];

	/*
	If your Physique doesn’t at least match Zephyr’s, instant fail.
	Can guarantee victory if you’re good enough, can also [Throw Match] to lose.
	*/

	output("\n\nWhen the match begins, neither of you make a real move, just holding your arms in place as if to test the other.");
	if (pc.isLactating())
	{
		output(" Zephyr seems to be focused on something else entirely - your [pc.breasts].”</i>");

		output("\n\n<i>“Oho, are you </i>lactating<i>, [pc.name]?”</i> she says with a smirk,");

		if (pc.RQ() >= 75)
		{
			output("\n\nQuick as a flash, you pull back out of her reach. <i>“That’d be cheating,”</i> you caution her.");

			output("\n\n<i>“Maybe,”</i> she admits, still smiling. <i>“But I can never resist a hot woman with milky tits.”</i>");
		}
		else
		{
			output("\n\nYou don’t pull back in time and Zephyr gets a nice grip on one of your [pc.nipples], rolling it between her fingers and chuckling when you can’t help but spurt a bit of milk and moan.");
			
			output("\n\n<i>“There’s a good cow,”</i> Zephyr tells you, wearing her smugness plainly.");
		}
	}

	output("\n\nWhen she begins to push you,");

	clearMenu();
	processTime(5+rand(5));

	if (pqResult == PQR_AUTOLOSS)
	{
		output(" it’s over in a flash.");

		addButton(0, "Next", zephyrDoubleBetLoss);
	}
	else
	{
		var bWin:Boolean = (pqResult == PQR_AUTOWIN || (pqResult == PQR_RAND && pqRand > 0));
		
		output(" you offer just enough resistance to keep her in place and nothing more");
		if (pqResult == PQR_AUTOWIN) output(", not wanting to tip your hand just yet");
		output(".");

		output("\n\n<i>“Ooh, got a bit of muscle to you, huh?”</i> Zephyr croons, clearly delighting in the competition. <i>“See how long that lasts.”</i>");

		output("\n\nThe two of you begin straining, pushing at each other as you pour incrementally more strength into your efforts until, with a loud grunt, the winner is found.");

		addButton(0, "Next", (bWin ? zephyrDoubleBetWin : zephyrDoubleBetLoss));
		addButton(1, "Throw Bet", zephyrDoubleBetLoss);
	}
}

public function zephyrDoubleBetWin():void
{
	clearOutput();
	showZephyrDeets();
	author("Wsan");
	
	var cIdx:int = (pc.hasCock() ? pc.biggestCockIndex() : -1);
	var cLength:Number = (cIdx >= 0 ? pc.cLength(cIdx) : 8);
	
	output("<i>“Fuck! God damn it,”</i> Zephyr curses, shaking her hand. <i>“There’s no way... were you just baiting me the whole time?”</i> She asks, suddenly suspicious, then shakes her head. <i>“Nah, fuck it. Doesn’t matter.”</i>");
	
	output("\n\n<i>“Not sure you’d want to hear the answer anyway, right?”</i> you say, smirking. Zephyr only grunts in disgust at her loss. <i>“Alright! Lie down on the desk with your head hanging off the edge.”</i>");
	
	output("\n\nShe does so in silence, glaring up at you standing over her.");
	
	output("\n\n<i>“You look good like that,”</i> you tell her, smiling with a hand on your [pc.cockOrStrapon " + cIdx + "].");
	
	output("\n\n<i>“Please,”</i> she mutters, rolling her eyes downward. <i>“Just");
	if ((pc.balls > 0 && pc.ballDiameter() > 4) || cLength > 36) output("- aw fuck,”</i> she groans in despair, looking up wide-eyed at your endowments, <i>“you’re one of those hyper losers");
	else output(" shut up and fuck me, you loser");
	output(".”</i>");
	
	output("\n\n<i>“Pretty sure it’s actually you who’s the loser here, Zephyr,”</i> you point out, <i>“and I’m going to make you gag like the bitch you are just for saying that.”</i>");
	
	output("\n\n<i>“Amazons don’t gag-”</i> she starts, then realizes her mistake.");

	output("\n\n<i>“Ohohohohoooo, reeeaaaaaaaaally?”</i> you gloat, bending your [pc.hips] back and pulling yourself down a bit to align with her closed lips. You rub the head on them and shiver in anticipation. This is going to be <i>fun</i>. No need to go easy on her.");
	
	output("\n\nWith your [pc.cockOrStraponHead " + cIdx + "] lined up, you");
	if (cLength <= 24)
	{
		output(" sink yourself past her pouting lips in one thrust, hollowing out her throat");
		if (pc.balls > 0) output(" and " + (pc.ballDiameter() <= 4 ? "squishing" : "slapping") + " your [pc.balls] against her nose");
		output(".");
	}
	else
	{
		output(" sink the first two feet of your [pc.cockOrStraponNoun " + cIdx + "] right down her throat");
		if(cLength >= 6) {
			output(", watching her neck bulge outwards");
			if(cLength >= 18) output(" ludicrously");
		}
		output(".");
		if (pc.balls > 0) output(" Your [pc.balls] swing pendulously beneath, threatening to slap her in the face.");
	}
	
	output("\n\n<i>“Awww, fuck,”</i> you groan in satisfaction, looking down at Zephyr’s reactions. She has one hand balled up in a fist and another clutching her throat, which you promptly bat away to get a better look at how you’re swelling her outwards. To her credit, though, she really hasn’t gagged. <i>“You take it like a fucking champ, Zephyr,”</i> you tell her, grunting as you draw your hips back. <i>“See if you can keep pace.”</i>");
	
	if (cLength <= 24)
	{
		output("\n\nLeaning over and taking hold of her massive breasts, you begin fucking her throat in earnest,");
		if (pc.balls > 0) output(" balls bouncing off Zephyr’s face and no doubt irritating the fuck out of her");
		else output(" Zephyr’s hands gripping the table in white-knuckled desperation");
		output(". Seeing her forced to put up with your savage treatment is half the pleasure in this, though you have to admit the warm wetness of her throat is pretty amazing on its own. Your cock glides through her slick, constricting passage with just enough friction on all sides to make it feel like you’re in a regular NT girl’s pussy.");
	}
	else if (cLength <= 47)
	{
		output("\n\nYou’re too big to get fully inside most girls, but Zephyr is nine feet tall and built tough. She’ll be fine. You walk yourself forward slowly, pulling her head towards you as she makes increasingly desperate noises from her throat, but all it really accomplishes is a nice vibration against your cumvein. Finally, you get your entire length down her throat, impaling her from the top. Whether by instinct or recognition of your dominance, she’s powerless to resist.");
		if (pc.balls > 0) output(" Your [pc.balls] rest snugly against her face, obscuring her vision and churning with need.");
	}
	else
	{
		output("\n\nToo large to fit entirely into her, you manage what you estimate to be three feet and some change, causing even Zephyr to make desperate noises from the depths of her throat. Having impaled her to the core, she’s powerless to resist when you slowly start moving your hips. Your cock glides through her slick, constricting passage with just enough friction on all sides to make it feel like you’re in a regular NT girl’s pussy.");
	}
	
	output("\n\n<i>“I think I’ll cum down your throat once just to break you in,”</i> you tell her, luxuriating in the sensory overload of having your");
	if (cLength <= 47) output(" entire");
	output(" length stuffed in Zephyr’s face. She doesn’t respond to your provocation other than to gurgle against your");
	if (cLength > 24) output(" monstrous");
	output(" shaft, though her neck bulges and recedes with your passage.");
	
	output("\n\nYou while away the minutes, enjoying the feeling of Zephyr wrapped almost literally around your " + (cIdx >= 0 ? "" : "faux-") + "cock, but something’s missing. This is just a bit too... civilized for a woman like her. With her inability to gag, there’s none of the roughness of the act you were hoping for - she lost, after all. This was a high-stakes game. Pushing her slightly down the desk, you clamber up onto it yourself, on your knees above her face.");
	
	output("\n\n<i>“That’s more like it,”</i> you grunt, getting a nice view of her eyes bulging in alarm as you start to dip your hips downward, fucking her throat. Maybe it’s just your imagination, but she feels even tighter now. It won’t take long at all to cum like this, and the closer you get the faster you fuck her face. Approaching the brink of orgasm, you put your hands on Zephyr’s mammoth breasts and squeeze her nipples to get a reaction, her subdued groan providing a nice backdrop for the first load you spurt right into her stomach.");
	
	output("\n\nThrowing your head back, you groan in pleasure as Zephyr " + (cIdx >= 0 ? "chugs your cum through no will of her own. You can see your own cock flexing in her throat if you sit back and watch it, sliding it as deep as possible to ensure your seed ends up right in her core" : "deep throats your strap-on through no will of her own. You can see the fake organ flex in her throat as if you were filling her up with a decent load of imaginary semen") + ".");
	var cumQ:Number = pc.cumQ();
	if (cIdx < 0)
	{
		output(" She takes it like a champ, swallowing your faux-cock while groaning quietly beneath you.");
	}
	else if (cumQ <= 3000)
	{
		output(" She takes it like a champ, swallowing your jizz while groaning quietly beneath you.");
	}
	else if (cumQ <= 10000)
	{
		output(" Sucking down your voluminous loads silently save for the loud swallows every couple of seconds, Zephyr manages to keep all of it down, albeit with a slight bump in her tummy.");
	}
	else if (cumQ <= 25000)
	{
		output(" Sucking down your voluminous loads silently save for the loud, frantic swallows three times a second, Zephyr manages to keep all of it down. Her tummy suffers for it, her taut abs giving way to a massive, sagging bump of sloshing jizz.");
	}
	else
	{
		output(" Sucking down your voluminous loads silently save for the loud, frantic swallows three times a second, Zephyr eventually can’t keep up and jizz begins to flush from her nose, slowly at first but increasing in force until there’s a river of it leaking out. You pull out to avoid drowning her, but not before filling her stomach to its absolute capacity. She’s positively gravid with your seed, her taut abs long since having given way to a massive, sagging bump of sloshing jizz.");
	}
	output(" When you withdraw, you notice <i>her</i> cock standing at attention and slowly pulsing, precum oozing from the tip. She’s <i>close</i>.");
	
	output("\n\nShe turns her head to the side and moans,");
	if(cIdx >= 0)
	{
		output(" spunk");
		if (cumQ <= 3000) output(" dripping");
		else if (cumQ <= 10000) output(" flowing");
		else output(" gushing");
		output("");
	}
	else output(" saliva drooling");
	output(" from her mouth onto the floor. Making to get up, she finds herself being pushed back down on the desk.");
	
	output("\n\n<i>“Oh, you thought I was done?”</i> you ask, grinning. <i>“I told you that was just to break you in, right?”</i>");
	
	output("\n\nA few minutes later as you’re humping her face, her hips begin to lift off the desk as she desperately fucks the air, her iron-stiff cock throbbing and her knot beginning to swell as, finally, she explosively cums all over herself with gurgling moans. Seeing no better way to finish yourself off, you fuck her throat to completion and sit on her face");
	if(cIdx >= 0) output(", letting the rest of your spunk collect in her tummy");
	output(" until you deem it fit to withdraw.");
	
	output("\n\nZephyr is still lying on her desk breathlessly dripping spunk by the time you’ve cleaned yourself off and bid her goodbye. You’d say these bets are working out pretty well.");

	processTime(45+rand(15));
	for (var i:int = 0; i < 5; i++) pc.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function zephyrDoubleBetLoss():void
{
	clearOutput();
	showZephyrDeets();
	author("Wsan");
	
	var ppZephyr:PregnancyPlaceholder = getZephyrPregContainer();
	var vIdx:int = pc.findEmptyPregnancySlot(1);
	if(vIdx < 0) vIdx = rand(pc.vaginas.length);
	
	output("Zephyr doesn’t even wait.");
	if (flags["ZEPHYR_RAWDOGGED_PUSS"] == undefined) output(" You finally understand");
	else output(" She shows you");
	output(" what a real “bull charge” is as you’re borne to the ground, the tiniest hint of restraint being shown as she catches you before you slam down to the floor, but that’s all it is. Your pussy already exposed and glistening, Zephyr <i>rams</i> her entire cock right between your lips and all the way up to your cervix in one massive thrust, then immediately begins fucking you in a mating press. Your face pressed right into her massive, milky breasts as she rails your spasming cunt, you only find your voice after a few seconds and let loose a shriek of pleasure before one of Zephyr’s hands clamps over your mouth.");
	
	output("\n\n<i>“Aaaaahhhhaannnnn-!!”</i>");
	
	output("\n\n<i>“Shut up,”</i> she hisses, staring red-faced and panting right into your wide-eyed visage. <i>“Nnngh! Spread those fucking thighs and keep that pussy tight!”</i>");
	
	output("\n\nThe way she talks down to you, <i>commands</i> you with her giant cock crammed all the way up your [pc.pussy " + vIdx + "]... you’re intoxicated. Drunk off watching this dominant shemale amazon plow you with the eagerness of an impassioned lover. Some dimly lit corner of your mind informs you that you’re cumming, but you don’t even really care - you just want <i>her</i> to cum, to see <i>her</i> to spread her lips in an ‘O’ of pleasure. That would just be the absolute best. That doesn’t stop you from making the delighted, high-pitched moans of a slutty bitch being bred from behind Zephyr’s fingers, though.");
	
	output("\n\nSlowly, gradually, you come to realize your body has been acting alone while your mind was busy with watching Zephyr’s distractingly beautiful face. Your calves are securely wrapped around her lower back, accomplishing naught but letting her know you’re completely at her whim while she pounds your squirting pussy with reckless abandon. Your arms aren’t doing much what with the way she’s holding you down so she can get the best angle, but at the very least you’re free to marvel at the feel of her muscular forearms.");
	
	if (StatTracking.getStat("pregnancy/zephyr births") > 0) output("\n\n<i>“Ooh yeah,”</i> she whispers harshly, pummeling your cunt as hard as she can, <i>“you want it bad, don’t you? To go through it all over again, from conception to birth? My perfect little breeding bitch.”</i>");
	
	output("\n\nThe way her horns protrude from her forehead, marking her as every bit as much a stud as a bull, makes you think about how suited Zephyr is to be a breeding stud. And you... her little bitch cumdump. Her outlined abs ripple with the motion of her rocking your world, your");
	if (pc.hasToes()) output(" toes curling");
	else output(" [pc.feet] digging into her lower back");
	output(" with every monstrous thrust. It feels every bit like you’re being taken by some raging beast overcome with desire, yet somehow all you can do is love it with every fiber of your being. It feels like you’re being stretched out in preparation to take her cock over and over, taking her loads until she’s had her fill of you.");
	
	output("\n\nThanks to her nonstop rhythm, stretching your snatch out twice a second with her rough, animalistic thrusts, you’re about ready to cum again. Taking notice, Zephyr slides her hand off your lips and, instead, dips her thumb inside your cheek.");
	
	output("\n\n<i>“There,”</i> she murmurs, a sultry grin flashing across her face. <i>“Something for you to suck on while you cum all over my cock.”</i>");
	
	output("\n\nShe can tell you’re seconds away from cumming, her thrusts only getting harder as you rapidly approach the peak. For a brief moment, you wonder if she feels as good as you do when you squeeze down on her cock, and then it happens.");
	
	output("\n\n<i>“Oh! Ooooh! Oooh, Shephyr!”</i> you slur, her thumb in your mouth keeping you from properly forming words.");
	
	output("\n\nShe looks down at you with the triumphant expression of a conqueror, an approving growl rising from deep in her throat as she wraps her arms around you. Completely enveloped in her embrace, you’re helpless to do anything but desperately pant in her arms, feeling yourself clamp down on her cock, your body trying to squeeze the cum out of her. For your efforts, you get a nice, warm spurt of precum right into your waiting womb.");
	
	output("\n\n<i>“Nnnnmmh... not even </i>close<i> to done with you, [pc.name],”</i> Zephyr whispers in your ear, humping you slowly through your orgasm. <i>“We’re going to be here a long time...”</i>");
	
	output("\n\nAfter your [pc.hips] finally stop jerking with the effort of cumming your brains out in her grasp, she gently lays you on the floor of her office and lets you breathe, stroking your stomach. Looking down, you can see the point of her cock bulging beneath the skin of your [pc.tummy], to which she flicks you a grin.");
	
	output("\n\n<i>“You </i>like<i> them this big, don’t you, [pc.name]?”</i>");
	
	output("\n\nWithout waiting for your answer, she begins to fuck you slowly, each thrust sending rivulets of your juices running down her massive length.");
	
	output("\n\n<i>“Yeah, you do,”</i> Zephyr murmurs. <i>“I can feel it. This tight little pussy is amazingly communicative. The way it clamps down on me when I do this-”</i> she demonstrates by rolling her hips just once, sending you sliding down to the very base of her thick, swollen prick moaning all the while, <i>“nnnngh- is just fucking great,”</i> she pants. <i>“I can tell how much you love having me inside you.”</i>");
	
	output("\n\nGasping and panting while Zephyr slowly works your pussy over, you grit your teeth as a weak orgasm rolls through your hips just from the sensation of being stretched open to allow her passage.");
	
	output("\n\n<i>“Aww, you want it harder than that, don’t you, [pc.name]?”</i> Zephyr taunts you good-naturedly, smiling down at you. <i>“Fine. And then at the end you can get a cuntful of my spunk.”</i>");
	
	output("\n\nPlacing her hands on either side of your body, the muscular amazon begins to fuck you harder, quickly working herself up to a speed that has you wide-eyed and gasping for air, pleasure shooting up your spine. With three lightning-fast thrusts your back arches once, twice, then completely off the ground as Zephyr wraps one hand around your waist to hold you, your scream of lust going unanswered except by way of a cock poking your womb.");
	
	output("\n\nIt doesn’t take too long for Zephyr to begin shuddering, her stomach tightening in pleasure as she holds you in her grip, teeth grit and grunting hard. Barely suppressing a primal scream of ecstasy in her throat, she grabs you and pulls down on your [pc.hips] so hard your jaw drops and you let loose a desperate, animalistic scream of pleasure when you realize her knot just popped inside your spasming pussy.");
	
	output("\n\n<i>“Nnnnnnnggggh!”</i> Zephyr groans, letting loose a huge, unending spurt of hot jizz into your womb. <i>“Fuuuck! Nnnnngh! Hhhhhnnnnngh! Uh!”</i>");
	
	output("\n\nEvery single utterance from her trembling lips is punctuated by a massive jet of cum into your pussy, almost instantly swelling you outwards enough to look like you’re in the beginning stages of pregnancy. Zephyr’s next few thrusts are those of an animal, instinctively seeking your deepest parts to offload her churning payload. With deep, satisfied groans she lets you drink in everything she has to give, each ejaculation swelling you further. By the time she’s done, you look like you’re right on the verge of delivering an entire household’s worth of Zephyr’s children.");
	
	if (flags["ZEPHYR_THROBBED"] != undefined)
	{
		output("\n\n<i>“That Throbb... really did something to my libido...”</i>");
	}
	else
	{
		output("\n\n<i>“God, you’re amazing...”</i>");
	}
	output(" Zephyr murmurs, completely unable to take her eyes off your dazed, redfaced expression. You look up at her with a light head and an overpowering sense of affection, half-smiling and half-caught in a moan of pleasure. Whatever she sees in your face, she likes it. Suddenly sweeping you closer with a massive arm wrapped around your back, she pulls you in for a deep, passionate kiss, one that you can easily tell has reignited her lower body’s flame. Even as she tonguefucks your mouth, you can feel her cock atop her massive knot, surging back to full hardness with throbs and flexes that make you shiver from the base of your spine upwards.");
	
	output("\n\nYou gasp into her mouth as you feel her withdraw her massive knot, sending a tidal wave of spunk flowing from your abused and well-used pussy and down your weakly quivering thighs. When she pulls back, she looks down at your form and clicks her tongue.");
	
	output("\n\n<i>“Shiiit... maybe I went a little overboard,”</i> she mutters, checking you from top to bottom. <i>“Are you-?”</i>");
	
	output("\n\nYou’re almost as surprised as she is when you find your finger on her lips, shushing her concerns. You quickly redden with embarrassment and withdraw your finger, but Zephyr only gives you a wide grin.");
	
	output("\n\n<i>“So you </i>are<i> okay, then... good. Why don’t we take a quick break and clean each other up?”</i> she says, placing you on the ground and kneeling above you, angling her feminine hips so that her massive cock is within reach of your tongue. As she does so, you feel her fingers massaging your very wet and admittedly slightly sore pussy.");
	
	output("\n\n<i>“Mmmmnnn,”</i> she moans, feeling you lapping at her dripping dick. <i>“Don’t get </i>too<i> enthusiastic with it or I’m liable to lose myself in your throat...”</i>");
	
	output("\n\nHer cum is utterly heavenly, a divine mix on your tongue that makes you raise your head for a better taste. That’s one of the upsides of the Treatment,");
	if (pc.isTreated()) output(" you know only too well");
	else output(" you guess");
	output(". You could be under this amazing woman all day for all you care right now, and before you know it you have your hands wrapped around her hips and you’re suckling the tip of her cock as enthusiastically as you can.");
	
	output("\n\nZephyr lets loose a moan of confusion before instinctively bucking her hips up and down, and within seconds you’re getting a second helping of cream down your throat to match the one between your legs. You greedily swallow it down, gulping the heady loads down as they arrive in your mouth. Collapsing back on the ground when you’ve spitshined the entire length of her cock to a saliva-slick sheen of cleanliness, you can’t help but notice she’s even harder than she was before she came.");
	
	output("\n\n<i>“Fuuuck,”</i> Zephyr groans, slowly lifting herself up and turning back around to look down at you. <i>“You little succubus... you... you... hmm.”</i> Her voice trails off as she watches you, your [pc.chest] heaving and your body covered in sweat, both yours and her own. Your [pc.legs] are slightly splayed apart, revealing your [pc.pussy " + vIdx + "], still dripping with her cum.");
	
	output("\n\n<i>“I think,”</i> she murmurs, seemingly hypnotized by your eroticism, <i>“we should go again.”</i>");
	
	output("\n\nWith her cock standing upright and reaching almost to her massive tits, you don’t see any reason to disagree.");
	if (pc.hasCock()) output(" Your own is stiffly erect even now, the experience of sucking hers just too titillating to resist.");
	output(" She kneels down atop you again, carefully placing her knees on either side of your thighs and laying her cock between your legs, but doesn’t push inside you just yet.");
	
	if (pc.isLactating())
	{
		output("\n\nWhen she reaches down to caress your breasts, you hear a muttered ‘mmf’ of arousal from Zephyr’s lips. You look down to find your [pc.nipple] dripping with [pc.milk] and Zephyr very much enjoying the show, gently squeezing you just enough to make you squirt down your front.");
	
		output("\n\n<i>“Looks like </i>someone<i> needs a good milking...”</i> Zephyr murmurs, lowering her mouth to your breast, forming a seal around your nipple with her lips. You moan a second later when you feel her suck, gently arching your back and supporting yourself on your elbows to allow her easier access. She responds by wrapping her muscular arm around your back to hold you up, greedily suckling your milk from");
		if (pc.breastRows.length == 1) output(" one breast and then the other");
		else output(" your top row of tits");
		output(" before letting you back to the floor.");
	
		output("\n\n<i>“You taste damn good,”</i> Zephyr says, wiping her lips with the back of her hand.");
		if(StatTracking.getStat("pregnancy/zephyr births") <= 1)
		{
			output(" <i>“Better save some for when you’re popping out my kids, though. Plural, ‘cause with the amount I’ve cum right up in that womb of yours...”</i> she says, grinning. <i>“Well. I’d be surprised if you had less than three your first time.”</i>");
			output("\n\n<i>“In fact,”</i> she growls, settling back into her original position, <i>“maybe we should make that six or seven for good measure.”</i>");
		}
		else
		{
			output(" <i>“Better save some for my kids.”</i> she says, grinning. <i>“Cow like you should be a good source of nutrition.”</i>");
		}
	}
	else
	{
		output("\n\nShe reaches down to caress your [pc.breasts], biting her lip and growling when you wince and groan upon her squeezing your nipples. It looks like she’s enjoying the show, because you can feel her rubbing that infernally large cock of hers between your pussy lips...");
	}
	
	output("\n\nWithout warning, she shoves herself inside you so deeply that you gasp, instinctively raising your legs into the air whereupon Zephyr grabs them and forces them backwards, grinning like a shark as she does.");
	
	pc.cuntChange(vIdx, ppZephyr.biggestCockVolume());
	
	output("\n\n<i>“Oh, that’s a good look for you,”</i> she says, clearly having fun with dominantly displaying her strength. <i>“As tempting as you are lovely.”</i>");
	
	if (flags["ZEPHYR_RAWDOGGED_PUSS"] == undefined)
	{
		output("\n\nShe thinks you’re lovely? You feel a little dizzy just hearing it");
	}
	else
	{
		output("\n\nYou feel a little dizzy just hearing Zephyr’s praises");
	}
	output(", but there’s no time to dwell on her words. Instead you find yourself almost screaming with joy as she hilts herself inside you, clearly intending to go full speed right from the start. It’s only thanks to Zephyr’s steadying arm that you aren’t dragged along the carpet of her office,");
	if (pc.tallness <= 96) output(" her massive size in comparison to your own");
	else output(" her sheer strength");
	output(" enough to send you sprawling if she so wished. Instead, she uses it to hold you in place while she fucks your cunt hard enough to make her previous loads spurt out around her cock, splattering her abs and your thighs.");
	
	output("\n\nYou can’t help but revel in the treatment,");
	if (flags["ZEPHYR_RAWDOGGED_PUSS"] == undefined) output(" some part of you falling in love");
	else output(" a growing part of you totally in love");
	output(" with being treated so roughly and passionately, being completely filled by Zephyr. It doesn’t hurt that the way she does it has you struggling not to scream yourself hoarse with ecstasy, either. She’s unstoppable, like an indefatigable goddess that keeps you right on the edge of orgasm and pushes you over whenever she wants. You cry out in her arms once more as she does so, squeezing down on the base of her cock, but she doesn’t slow down for even a second.");
	
	output("\n\nGrunting and panting, Zephyr is all over you while she desperately slams her hips against your frame, droplets of sweat flying from her taut, amazonian body. You can feel her gradually approaching her own peak, getting ready to bestow her massive load upon you, and shakily reach up to grab onto her horns, stroking her face until, finally, she cums.");
	
	output("\n\n<i>“Fuuuuck,”</i> she groans desperately, still bucking her hips into you while you meet her gaze. <i>“Oh, [pc.name]...”</i>");
	
	output("\n\nHeld down and being pumped full of Zephyr’s warm, sticky spunk, you feel completely at ease. With whispered voice and gentle hand you guide her head downwards, close enough for you to kiss her on the lips. Letting go of your legs, she slides one hand behind your head and another behind your back as you wrap your arms around hers, letting her kiss you deeply even as her hips continue their rolling motion. Being filled from both ends is just too much to take, and you can’t help but cum a final time, milking Zephyr’s massive canine cock just to ensure your complete submissiveness.");
	
	output("\n\nIn the haze of the aftermath, you find yourself being cradled in Zephyr’s lap, sucking at the cowgirl’s milky nipple while she caresses you with the gentleness of someone petting a puppy. It’s nice to know she treasures you so much, and the milk tastes just about as good as swallowing her cum.");
	if (flags["ZEPHYR_RAWDOGGED_PUSS"] == undefined) output(" Not to mention, though you might be imagining it, you think you’re recovering faster by drinking it...");
	else output(" It suffuses your insides, warming you and relieving you of your fatigue.");
	
	output("\n\n<i>“Nnnn... Amazon milk is like that,”</i> Zephyr murmurs, rubbing your still-swollen tummy");
	if (flags["ZEPHYR_RAWDOGGED_PUSS"] == undefined) output(" and apparently reading your mind");
	output(". <i>“Otherwise our partners would never be able to walk.”</i>");
	
	output("\n\nNo kidding, you think. Zephyr’s hypervirility is far too much for any regular person to handle, and her <i>thoroughness</i> on top of that... a winning combination, that’s for sure. You wouldn’t blame her for being more than a little proud of that performance. Once you’ve recovered a little, Zephyr stands and helps you up, holding you close.");
	
	output("\n\n<i>“Sorry about your desk,”</i> you mumble, eyeballing the ruined sheafs of paper.");
	
	output("\n\n<i>“Ah, don’t worry about it,”</i> Zephyr says, shaking her head. <i>“They weren’t particularly important, I just need to rewrite them. I’d say this distraction,”</i> she continues, sliding a hand down your back and spanking your [pc.ass], <i>“was </i>well<i> worth it. You can swing by my office any time you like, [pc.name]. S’long as you’re putting that pussy on the line, anyway. I can always make room for that.”</i>");
	
	output("\n\n<i>“Yeah, you’re pretty good with making room where there shouldn’t be any...”</i> you murmur, earning an affectionate chuckle from behind you.");
	
	output("\n\n<i>“You’re cute. Now get that sexy ass of yours cleaned up and scoot on out so I can get some actual work done,”</i> she says, kissing your cheek before bending over and picking up her skirt. <i>“Unless you want to try again...”</i> she says, hooding her eyes and fixing you with a desirous gaze. Eep!");
	
	output("\n\nOutside her office");
	if (!pc.isNude()) output(" and fully clothed");
	output(", you breathe a little sigh of relief. You’re pretty sure your hips would have disintegrated if you’d immediately gone for another round of being bred, and besides, this has left you pretty gravid already. You can still feel yourself leaking cum, too, though here on New Texas that’s not so far out of the ordinary. Still, a not insignificant part of you wants to immediately walk back in and skip the arm wrestling completely...");

	processTime(45+rand(15));
	pc.loadInCunt(ppZephyr, vIdx);
	for (var i:int = 0; i < 3; i++) pc.orgasm();

	IncrementFlag("ZEPHYR_RAWDOGGED_PUSS");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function zephyrBetLossDont():void
{
	clearOutput();
	showZephyrDeets();
	author("Wsan");

	output("You shake your head; you’re not ready for that kind of commitment. Zephyr only shrugs and roughly turns you around, slamming you down over her desk.");
	
	output("\n\n<i>“Suit yourself. I’m gonna bust a huge nut in you either way, [pc.name],”</i> she says, her tapered tip already pressing at your [pc.asshole].");

	zephyrBetLossMainScene(PQR_DOUBLELOSS, 0);
}

public function zephyrPregnancyEnds():void
{
	clearOutput();
	showZephyrDeets();
	author("Wsan");

	var pData:PregnancyData = pc.getPregnancyOfType("ZephyrPregnancy");
	var pDataSlot:uint = pc.pregnancyData.indexOf(pData);
	var numKids:int = pData.pregnancyQuantity;

	output("Taken in by the staff upon arrival, your delivery is tough owing to the fact you’re giving birth to");
	if (numKids == 1) output(" a kid");
	else output(" " + num2Text(numKids) + " kids");
	output(", but eased somewhat by the fact Zephyr shows up halfway in, all smiles and tears. You deliver while holding her hand, squeezing down on her delicate grip.");

	output("\n\n<i>“Is she- are you done?”</i> Zephyr asks at the end, unsure if the ordeal is over, and smiling when you nod tiredly. <i>“Oh my gosh, look at them,”</i> she whispers, nuzzling up against your face and looking down at your beautiful litter of babies.");
	if (flags["ZEPHYR_KIDS_BIRTHED"] == undefined)
	{
		output(" <i>“I’m a- a, well, I guess a dad, but let’s go with second mommy.”</i>");
		flags["ZEPHYR_KIDS_BIRTHED"] = 0;
	}
	flags["ZEPHYR_KIDS_BIRTHED"] += numKids;

	output("\n\n<i>“Yeah,”</i> you murmur happily, watching your healthy kids being swathed in warm cloth. <i>“I’m glad you’re here, Zephyr.”</i>");

	output("\n\nYou give her hand another warm, comforting squeeze before you fall asleep, tired out by your delivery.");

	output("\n\nIt’s a couple of days before you’re up and walking about again, mostly being tended to by Zephyr (who insists on doing everything for you) with some help from the staff, but eventually you’re out of bed and ready to head back out.");

	var pHandler:ZephyrPregnancyHandler = PregnancyManager.findHandler("ZephyrPregnancy") as ZephyrPregnancyHandler;
	pHandler.nurseryEndPregnancy(pc, pDataSlot, GetGameTimestamp());

	pData = null; // No longer safe/meaningful data

	processTime(60+rand(30));
	currentLocation = "NURSERYG4";
	generateMap();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function playWithZephKids():void
{
	clearOutput();

	if (zephAtNursery()) showZephyrDeets();

	author("Wsan");

	output("Heading into the Nursery proper, you find your and Zephyr’s kids in their cribs. They’re awake for now, bright-eyed and bushy-tailed, and demanding your attention. You poke one’s cheek and he grabs at your finger, delighting in its presence, and giving it a cursory bite for good measure. You wince slightly and begin shaking a baby rattle above his crib instead, your baby clapping in joy.");
	
	if (zephAtNursery())
	{
		output("\n\n<i>“Awww, the two of you’re so cute,”</i> a voice murmurs from behind you, and you turn to see Zephyr, who walks up alongside you to wrap her arm around your [pc.hips] and give you a kiss on the cheek. <i>“Hey there, beautiful.”</i>");
	
		output("\n\n<i>“Hey lover,”</i> you reply, smiling at her as she leans over into the crib, putting out a finger.");
	
		output("\n\n<i>“Hello! Ow,”</i> Zephyr says, wincing as she falls prey to the same gambit you did.");
	
		output("\n\n<i>“He likes to bite,”</i> you helpfully inform her. <i>“I think he gets it from you.”</i>");
	
		output("\n\n<i>“Yeah, thanks,”</i> she says, sighing. <i>“Oh well, at least he’s having a good time.”</i>");
	
		output("\n\nThe two of you pass the time playing with your kids until they start to fall asleep, at which point Zephyr gives you a goodbye kiss and leaves. You stay behind to watch the kids get some rest, then tiptoe out of the room as best you can.");
	}
	else
	{
		output("\n\nYou take some time switching between cribs to pay attention to all of your kids, playing with them in rotation until eventually they start to fall asleep again, worn out by all the hubbub of mom being home. After you’re assured they’re all asleep, you tiptoe out of the room as best you can.");
	}

	processTime(30+rand(15));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function picsWithZephKids():void
{
	clearOutput();
	showZephyrDeets();
	author("Wsan");

	output("Having spied Zephyr asleep in the Nursery with the kids, you quickly duck out to grab a datapad that carries a camera. Making your way back, you grin at the sight. She’s got two kids in her massive arms, both fast asleep, all while she quietly snoozes against a wall. She must have gotten carried away playing with them.");

	var r:int = rand(3);
	if (r == 0)
	{
		output("\n\nYou snap a couple of cute pictures, including a family selfie where you’re leaning over Zephyr and giving the camera a big grin and a peace sign. She’s none the wiser when she wakes up groggily, but you’ll be sure that the photos make their way to her email when she’s totally unsuspecting.");
	}
	else if (r == 1)
	{
		output("\n\nYou snap a comedic picture of Zephyr and your kids with a filter and a caption, quickly hiding it in the history when she snaps awake and sees you holding a camera. You sit down next to her and put your arm around her, taking a nice picture of the four of you, two with giant, heartfelt smiles and two fast asleep.");
	}
	else
	{
		output("\n\nYou’re about to try and very carefully extricate the children from her arms so you can snap some funny pictures, but she awakens the moment you touch them. With a sheepish smile, you confess your idea and she gives you a proud grin.");

		output("\n\n<i>“Ain’t no one putting their hands on the kids without my knowledge, not even you, [pc.name]!”</i> Zephyr declares before realizing she should be more quiet. <i>“Oops.”</i>");

		output("\n\nSince you’re both awake and present anyway, you take some pictures of the happy family.");
	}

	output("\n\nYou help her carefully put the kids back in their cribs so as to not wake them before you leave.");

	processTime(15+rand(5));

	flags["ZEPHYR_PICSWTHEKIDS"] = 1;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function milkedByZeph():void
{
	clearOutput();
	showZephyrDeets();
	author("Wsan");

	output("Dusting yourself off, you head to a private room for some alone time with the milker. While you’re here, you might as well make some milk for the kids; it’s what moms do, after all. You");
	if (!pc.isNude()) output(" undress and");
	output(" set up the milking apparatus, sighing in relaxation as it begins to work. It’s nice to get some time off from your hectic adventures and just unwind. So focused are you on your little distraction that you don’t even notice Zephyr entering the room, and it’s not until she wraps her warm hands around your waist that you’re startled out of your reverie.");

	output("\n\n<i>“Oh, Zephyr!”</i> you gasp, putting a hand under your suction-capped breasts. <i>“You surprised me.”</i>");
	
	output("\n\n<i>“Mmmm, hello [pc.name],”</i> she murmurs, putting her head on your shoulder. <i>“You’re looking extremely alluring right about now...”</i>");
	
	output("\n\n<i>“I just figured I would help out the kids a little,”</i> you confess, feeling slightly vulnerable in her grip. The milker continues its soothing rhythm, your milk gradually being wicked away.");
	
	output("\n\n<i>“That kind of forward thinking is exactly why I bred you,”</i> Zephyr purrs, shifting her hands to your [pc.tummy]. <i>“In fact, I was just thinking what a shame it is you aren’t pregnant right now, [pc.name]. Remember what fun it was last time?”</i>");
	
	output("\n\nYou do.");
	
	output("\n\n<i>“Wouldn’t you like to spread your legs and feel it again?”</i> she whispers in your ear, tempting you with the greatest of rewards.");

	processTime(3+rand(3));

	clearMenu();
	addButton(0, "Yes", milkedByZephYes);
	addButton(1, "No", milkedByZephNo);
}

public function milkedByZephYes():void
{
	clearOutput();
	showZephyrDeets(true);
	author("Wsan");
	
	var ppZephyr:PregnancyPlaceholder = getZephyrPregContainer();
	var vIdx:int = pc.findEmptyPregnancySlot(1);
	if(vIdx < 0) vIdx = rand(pc.vaginas.length);
	
	output("<i>“I- err...”</i> you stumble over your words, thinking about the way she takes you. It’s exhausting, but that’s part of the fun. The way she puts her full body and mind into <i>fucking</i> you, and forces you to reciprocate. <i>“... Yes.”</i>");
	
	output("\n\n<i>“Yeah, I can tell with the look on your face,”</i> she murmurs affectionately.");
	
	output("\n\nLetting Zephyr gently raise you to your feet while being milked, you moan as she dials the intensity slightly higher with a grin. Then, with a powerful hand on your back, gently coaxes you into bending over for her. Her guiding hand feels like a heavy weight, reminding you of who wears the proverbial pants between the two of you.");
	
	output("\n\n<i>“I never get tired of this sight,”</i> she sighs happily, rubbing your back. You can feel her hardness pressing against your [pc.butt], her eagerness getting the best of her.");
	if (!pc.isNude()) output(" She tugs your [pc.lowerGarments] down and bends down, getting a good look at your [pc.pussy " + vIdx + "] even as she casually sinks a finger into your ass.");
	
	output("\n\n<i>“Aw, I love seeing you tighten up like that,”</i> she coos, moving her face closer to your [pc.thighs]. <i>“Just can’t help it, huh?”</i>");
	
	output("\n\nYou let out a surprised moan when you feel her tongue roll from her mouth and lick your pussy, sliding between your thighs and getting a good taste of your juices.");
	if (pc.hasToes()) output(" Standing on your tiptoes, y");
	else output(" Y");
	output("ou bite your bottom lip while Zephyr takes her sweet time sampling your folds, dipping just once or twice deeper inside you. She’s so <i>warm</i>, and you can’t help but fantasize about her leaving some of that warmth inside your [pc.womb " + vIdx + "].");
	
	output("\n\n<i>“Mmmmn,”</i> Zephyr groans from between your legs before standing back up. <i>“Fuck, you taste so good, [pc.name]. Just feeling you out with my tongue makes me fucking raging hard. Look.”</i>");
	
	output("\n\nTurning your head, Zephyr pulls down her skirt to reveal her hard, throbbing cock. As you watch, she flexes it with a stifled grunt and a large bead of precum coalesces, gathering weight and slowly rolling down the veiny, swollen length.");
	
	output("\n\n<i>“That’s all because of eating your fucking pussy,”</i> she says, sliding her finger along the underside of her cock to collect the precum. <i>“I’d be down there all day if I didn’t love the idea of jamming my dick inside it so much. Fuck, I can’t wait to bust a huge nut inside you. Come on girl, spread yourself.”</i>");
	
	output("\n\nReaching back with reddened face and heightened breathing, you feel a little burst of adrenaline as you reveal your wet, glistening interior to the fuck-hungry amazonian breeding stud. Your mind races as she lines herself up, sliding between your slippery lips, the realization coming to the forefront unbidden - you might actually want this even more than she does.");
	
	output("\n\nYou cry out in lusty pleasure when she thrusts roughly inside you, hard enough to make your [pc.feet] momentarily leave the ground. Zephyr drives herself forward, your [pc.hips] in her hands as she sinks inches of fat, cunt-stretching cock into you. By the time she’s hilted herself you’re already cumming, screaming her name");
	if (pc.isSquirter()) output(" and squirting all down your legs");
	output(" in submissive glee. She doesn’t stop or even slow down, encouraging you to keep up with steady rolls of her hips, each one knocking you off your feet and distending your [pc.tummy].");
	
	pc.cuntChange(vIdx, ppZephyr.biggestCockVolume());
	
	output("\n\nGrunting, she spreads her muscular legs and pulls your [pc.hips] in, beginning to rail you with all the vigor you’ve known and come to love from her, tearing cries and screams of pleasure from your throat.");
	
	output("\n\n<i>“Beg for it!”</i> Zephyr commands you, fucking you so hard you can hardly think straight. <i>“Beg me to knock you up!”</i>");
	
	if (pc.isBimbo())
	{
		output("\n\n<i>“Please! I’ll be your hot little bimbo");
		if (pc.isTreatedCow() || pc.race().indexOf("cow") != -1) output(" cow");
		else output(" slut");
		output(" forever and ever, just let me feel you cum inside me!”</i>");
	}
	else
	{
		output("\n\n<i>“Please! Let me feel your cum in my womb again, Zephyr!”</i>");
	}
	output(" You cry out, freely admitting just how much you love what she does to you.");
	
	output("\n\nOf course, she obliges you in spades, whispering to you all the while.");
	
	output("\n\n<i>“Mmmmn,”</i> she growls fiercely in your ear, pressing her cockhead right up against your cervix. <i>“Do you like that, [pc.name]? The hard, sudden throb of my cock and a gush of warmth in your womb? Nnngh!”</i>");
	
	output("\n\nYou’re left without words, your only recourse to groan in lustful satisfaction as Zephyr knocks you up all over again. She thrusts upwards with every cunt-stretching, womb-swelling ejaculation, lifting you up until she has you held against her front like you’re nothing more than a toy.");
	
	output("\n\n<i>“Oh, gooood...”</i> you moan lewdly, looking downwards at your gravid tummy, swelling outwards a bit more with every passing second. Some of her warm cum begins to run, then actively spurt from your exposed, stretched pussy, splashing to the floor. <i>“No knot, Zephyr?”</i>");
	
	output("\n\n<i>“Shhh, cutie,”</i> she hushes you, keeping you held in place while she empties herself fully, making cute little grunts every time she fills you up. <i>“That’s for the second round.”</i>");
	
	output("\n\n<i>“Second... round?”</i> you moan, swinging your head back to bump her chest.");
	
	output("\n\n<i>“You know I can’t resist cumming inside this tight fuckin’ pussy of yours more than once, [pc.name],”</i> Zephyr tells you. <i>“Or did you forget the time I fucked you through the floor? ‘Cuz I remember having to put my hand over your mouth when I got right up inside you.”</i>");
	
	output("\n\n<i>“Hhhunh!”</i> Is your only reply as Zephyr begins slowly fucking you from below again.");
	
	output("\n\n<i>“Relax,”</i> she whispers in your ear, hugging you tightly. <i>“Just a few minutes and you can go back to being the loving mother of my children.”</i>");
	
	output("\n\n<i>“H-hah,”</i> you gasp breathlessly. <i>“Like you’re- unnnh! E-ever only a few minutes!”</i>");
	
	output("\n\nYou can’t see her smile, but you can feel it. <i>“True, I’m going to pound the fuck out of you and knot your tight, sloppy little cunt when I knock you the fuck up, but that doesn’t mean I don’t love you and our family, [pc.name]. Now,”</i> she sighs, standing back up to her full height and adjusting her grip. <i>“Less chatting, more moaning like my little slut.”</i>");
	
	output("\n\nYou hardly have time to appreciate the confession before she’s back inside you, somehow even rougher than before. Some part of you wonders if Zephyr’s just afraid of admitting such intimate things, but it doesn’t take long for you to be wholly focused on and occupied by her massive, immensely pleasurable cock. She bounces you to an explosive, mind-shattering orgasm in mere minutes, plowing you with reckless abandon as she gets closer and closer to cumming.");
	
	output("\n\nWhen she finally does, it’s almost unannounced - she doesn’t cry out or groan, just grunts slightly louder while she pounds you until you notice entirely new, fresh warmth blooming within your fertile, stuffed-full womb. She keeps hammering you, each thrust depositing more and more hot spunk, until you notice her fat, inflated knot beginning to press at your overtaxed entrance.");
	
	output("\n\n<i>“Oh! Oh, </i>Zephyr<i>!”</i> you cry out, throwing your head back in ecstasy when her knot slips inside, stretching your walls and sealing off the only escape route for her jizz. <i>“Oh, </i>god<i>!”</i>");
	
	output("\n\nIt’s a good thing she left it until she was halfway done with her massive orgasm, because now you’re <i>really</i> swelling. Your tummy is taut and bulging, your womb packed too full of sloshing, fertile spunk for you to even think, and Zephyr’s not even done yet. With a satisfied grunt, she abruptly sits on the ground with you in her lap and loops her arms around you.");
	
	output("\n\n<i>“Oooooh, yeah,”</i> she murmurs, all but moaning with orgasmic delight in your ear. <i>“Oh, that’s so good. Mmmm...”</i>");
	
	output("\n\nYou can’t help it - between the incredibly compelling feeling of her fat, bulging knot lodged tightly in your pussy and the sexy talk in your ear, you suffer a massive, body-shaking, cunt-clenching orgasm that serves only to drive Zephyr onwards.");
	
	output("\n\n<i>“Oh! Grrrrnngh!”</i> she groans between grit teeth, panting in between every full body convulsion. <i>“Fuck, [pc.name]! Nnngh!”</i>");
	
	output("\n\nBy the time you’re finished shaking in her lap, you collapse back into the safety of Zephyr’s grip as she rolls the both of you onto your sides, moaning in satisfaction.");
	
	output("\n\n<i>“Huuuuhhh...”</i> she breathes, calming down after having her hypersensitive cock massaged by your insides. <i>“Let’s just... stay here a while.”</i>");
	
	output("\n\nBy the time Zephyr’s knot has deflated enough to be withdrawn from your abused, sopping wet pussy, you’re just barely capable of standing on shaky legs with her help. You wince when she takes it out, a veritable river of spunk slopping to the ground after finally being freed from your insides.");
	
	output("\n\n<i>“Damn,”</i> Zephyr says with a whistle and a grin. <i>“Looking good, lover.”</i>");
	
	output("\n\nYou give her a mildly reproachful look and she responds with a wink. <i>“Lucky you’ve got the adjoined shower there, right?”</i>");
	
	output("\n\n<i>“Right...”</i> you sigh, looking down at how incredibly full of cum you are. You’re going to be ‘showering’ for quite some time.");
	
	output("\n\nZephyr interrupts your musing by");
	if (pc.tallness < 108) output(" bending down and");
	output(" giving you a kiss, closing her eyes and wrapping her arms around you. It’s a little awkward with your stomach creating a space between you and her massive breasts parked on top of that, but she makes it work. The kiss is deep, passionate, and prolonged, Zephyr capturing your tongue with her own and ensuring you get no chance to pull away.");
	
	output("\n\n<i>“You are so beautiful,”</i> Zephyr murmurs unexpectedly, during a brief break in your tongue-twining.");
	
	output("\n\n<i>“Even when I’m all bloated with your cum?”</i> you say wryly, giving her a lopsided smirk.");
	
	output("\n\n<i>“</i>Especially<i> when you’re all bloated with my cum,”</i> Zephyr replies with a ferocious grin before pulling you back in, kissing you even harder.");
	
	output("\n\nWhen she finally lets you go, she slips around to your back and gets a nice, double-handed squeeze of your [pc.butt] before letting go and giving you a spank.");
	
	output("\n\n<i>“Oof! Is that any way to treat the mother of your children?”</i> you jokingly accuse her, rubbing your butt.");
	
	output("\n\n<i>“Treatment like that is </i>why<i> I made you the mother of my children,”</i> she replies with a genuine smile. <i>“See you, lover. I’m going to go wash up, and uh, I don’t think we should take the same shower. We’d never get out.”</i>");
	
	output("\n\nThat is objectively true, you have to admit. Zephyr gives you a quick peck on the cheek and a grin before heading out. You eye the incredible bounty of milk you produced during Zephyr’s rigorous plundering of your pussy. You can’t say definitively, but it might be that you make more milk when you’re being... stimulated. Either way, you’ll have to get Bridget to collect this after your very long and involved shower. You sigh and turn gingerly, Zephyr’s fertile cum sloshing around inside your womb, no doubt already hard at work fertilizing you. You have to say, what she does, she does very well.");

	processTime(180+rand(60));

	// something to track milk produced specifically for the nursery
	// NURSERY_MILK_PRODUCTION
	var milkQ:Number = pc.milkQ();
	StatTracking.track("nursery/milk milked", milkQ);

	for (var i:int = 0; i < 3; i++)
	{
		pc.loadInCunt(ppZephyr, vIdx);
		pc.orgasm();
	}

	pc.milked(pc.milkFullness);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function milkedByZephNo():void
{
	clearOutput();
	showZephyrDeets();
	author("Wsan");

	output("<i>“I can’t right now, Zephyr,”</i> you say, shaking your head. <i>“There’s too much stuff I have to do, and-”</i>");
	
	output("\n\n<i>“Shh, it’s okay,”</i> she hushes you, patting your head. <i>“Don’t worry your little head about it, [pc.name].”</i> Zephyr smooches you on the cheek and rises. <i>“But don’t be surprised when I ask again!”</i> she warns you good-naturedly before leaving.");
	
	output("\n\nShe walks out of the room with a wiggle in her hips, and you can’t help but occupy yourself with thoughts of how she uses them so effectively. The raw, unrestrained power behind each thrust... and their sloppy end results. You’re so caught up in your fantasies that you don’t even realize you’re smiling until the milker’s beep startles it off your face, having finished for now.");
	
	output("\n\nRising to your feet, you gently remove the milker’s suction cups and stow it away, taking the bottles for filtering and storage. You feel nice and fuzzy for having helped out your kids, potential and otherwise. Bridget will be by to collect these, so you’re free to go.");

	processTime(45+rand(15));

	// something to track milk produced specifically for the nursery
	// 9999 NURSERY_MILK_PRODUCTION
	var milkQ:Number = pc.milkQ();
	StatTracking.track("nursery/milk milked", milkQ);

	pc.milked(pc.milkFullness);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function zephTalkAtNursery():void
{
	clearOutput();
	showZephyrDeets();
	author("Wsan");

	output("Since Zephyr’s here, you could spend some time with her. You harbor absolutely no illusions about what that entails, though - you’re going to be having sex, and it’ll probably be long, rough, and hard.");

	output("\n\nSidling up to her, you have a decidedly unsubtle hushed verbal exchange. She has you squirreled away to the guest room with a grin on her face within moments.");

	currentLocation = "NURSERYI6";
	generateMap();

	processTime(5+rand(1));

	clearMenu();
	addButton(0, "Give BJ", zephNurseryBJ, undefined, "Give BJ", "Offer Zephyr some oral relief.");
	addButton(1, "Buttfuck", zephNurseryButtfuck, undefined, "Buttfuck", "Give up that ass so Zephyr can get off.");
	if (pc.hasPregnancyOfType("ZephyrPregnancy")) addButton(2, "Gentle Sex", zephNurseryGentleFuck, undefined, "Gentle Sex", "Right what it says on the tin.");
	else addDisabledButton(2, "Gentle Sex", "Gentle Sex", "You need to be pregnant with Zephyr’s kids for her to be interested in taking it easy on you!");

	addButton(14, "Back", mainGameMenu);
}

public function zephNurseryBJ():void
{
	clearOutput();
	showZephyrDeets(true);
	author("Wsan");
	
	var ppZephyr:PregnancyPlaceholder = getZephyrPregContainer();
	
	if (pc.isBimbo()) output("<i>“Umm,”</i> you start, gazing at Zephyr’s skirt and imagining the delicious contents contained within. <i>“Can I suck your cock?”</i>");
	else output("<i>“Zephyr, would you like some ah...”</i> you start, pointedly staring at the amazon’s skirt, <i>“oral attention?”</i>");

	output("\n\n<i>“Hell yes,”</i> Zephyr replies, looping an arm around your lower back and eagerly escorting you to the bed. She has her skirt off in an instant, her giant, Throbb-enhanced cock surging to full erection within seconds. As if to provoke you into action, a bead of precum forms right at her pointed tip, threatening to drip to the floor.");

	output("\n\nIt never does. You have your lips securely wrapped around her cockhead and your cheeks hollowed before she can even tell you to do so, your favorite amazon running her hands");
	if (pc.hasHair()) output(" through your hair");
	else output(" over your head");
	output(" and moaning encouragingly. The noise gives you motivation, driving you onwards in finding exactly what feels best for <i>her</i>, what makes Zephyr want to grab your face and cum inside it.");

	if (pc.hasHair()) output("\n\nSweeping your hair out of your face, y");
	else output("\n\nY");
	output("ou focus intently on what makes her groan the loudest, pressing at her lightly with your fingers even as you let your tongue loll from your mouth while she’s halfway down your throat, licking the underside of her cock and enjoying the feeling of her cumvein flexing against the contact. It feels almost as good for you as it does for her, just watching her facial expression every time you find a new spot to ply your tongue’s trade, until eventually you bring her to orgasm.");

	output("\n\nWith a hand on her thigh, you can feel first hand how she flexes and makes tiny thrusts upwards as she groans in orgasm, the vast majority of her cum spilling from your lips down your [pc.breasts]. Zephyr’s so <i>erotic</i>, you think, feeling her fat, swollen cock throbbing between your lips even as you look at up her ‘O’ face. Just watching her cum is enough to drive you crazy, your thighs wet with desire without ever being touched. You swallow down some cheek-swelling loads just to get some of her spunk inside you, and by the end of it she’s still standing proudly erect, a testament to her amazing virility.");

	output("\n\n<i>“Mmmm, keep going,”</i> Zephyr sighs, smiling lovingly down at you. <i>“I haven’t had anywhere near enough of that pretty little mouth of yours, [pc.name].”</i>");

	output("\n\nYou don’t need to be told twice. She’s even louder now, unabashedly moaning at the top of her lungs while you service her, and you couldn’t be happier about it. To think you’re able to bring so much pleasure to such a beautiful, dominant amazon has you deepthroating her entire length, sliding down her massive prick all the way to its swollen base in search of making her cum a second time.");

	output("\n\nWith her increased post-orgasm sensitivity, it’s even easier than it was the first time. With a loud, breathless groan of release, she gently - but firmly - keeps you down on her cock, cumming right into your stomach for close to half a minute before she lets you up, panting and moaning all the while.");

	output("\n\n<i>“Hoooo, fuck,”</i> she huffs, looking at you with face flushed red and an expression of admiration. <i>“You’re pretty goddamn good at that, [pc.name]. Round three?”</i>");
	
	output("\n\nWearing a slutty smile covered in Zephyr’s spunk as it drops down your chin even now, you slide your [pc.lips] over the tip of her dick once more. She’s getting more into it now, taking command and guiding your head up and down her massive shaft while her ass begins to lift off the bed. Her incredible size and strength mean that what were meant to be slight guiding motions become strong, forceful violations of your throat, caution thrown to the wind as she pleases herself with your lips.");
	
	output("\n\n<i>“Awwww, yes,”</i> she pants, throwing her head back in exultation. <i>“Good girl! Good girl, good girl- nnnngggggh!”</i>");
	
	output("\n\nAs with all things to do with Zephyr and sex, you’re very quickly on the receiving end, lying under her as she grips the shaking headboard and bucks her hips against your face, crying out in pleasure while she cums directly into your stomach, her giant dick flexing in the depths of your throat.");
	
	output("\n\n<i>“Oooooohhhh, yeah, that’s it,”</i> she groans, slowly relaxing as she fills your tummy up. <i>“Swallow it all down, there’s a good girl. Mmmm.”</i>");
	
	output("\n\nYou do. With your tongue wrapped around her length, you hollow your cheeks and swallow just to weakly constrict your throat, the force hastening Zephyr’s giant, virile loads into your stomach, where they splatter and coat your insides in sticky cum. Lying on your back on a soft bed with your [pc.chest] heaving and your lover’s cock between your lips, you feel like you might really be in heaven.");
	
	output("\n\n<i>“Awww, look at that face,”</i> Zephyr coos, grinning down at you. <i>“You loooove that, don’t you? Being held down and forced to swallow my jizz. Okay, we can do it once more just for you, [pc.name]. I’ll even knot your mouth.”</i>");

	output("\n\nTrue to her word, she hasn’t even completely stopped cumming before she’s rutting your face again, shoving her fat cock down your throat so deeply you sometimes have to skip taking a breath, and all you can think about is how much you love her for it. She constantly pushes at your limits because she knows you can take it, challenging you to see how far you’ll go in pursuit of pleasing her. Right now she’s seemingly checking if she can get her cockhead all the way into your stomach and just use your throat as a masturbation sleeve.");
	
	output("\n\nThe answer is apparently mostly a yes if her ecstatic groans are any indication, humping your face hard enough that your jaw rattles a little with every loud, wet slap against your face, her groin covered in a nice coating of your spit and her cum by now. Her hands are against the wa\ll now, her head raised to the ceiling as she growls in primal satisfaction, fucking your face every bit as thoroughly as she fucks your pussy.");
	
	output("\n\nFinally, you can feel her approaching a grand climax, the end of your oral efforts, and you’re not far yourself. All this work servicing your mistress has made a huge mess between your [pc.thighs], your [pc.pussy] wet enough that your inner thighs practically glide across each other as you rub them together");
	if (pc.hasCock()) output(", not to mention your [pc.cock] dripping precum onto the bed below");
	output(".");
	
	output("\n\nWhen she cums, she does so with a bestial, savage roar of dominance and pleasure that makes you instantly cum");
	if (!pc.isCrotchGarbed())
	{
		output(" in your [pc.underGarments],");
		if (pc.isSquirter()) output(" your pussy squirting desperately through the material");
		else output(" your pussy staining the material");
	}
	else
	{
		if (pc.isSquirter()) output(" all over the bed, femjuice spurting from your pussy so violently some of it shoots onto the floor below");
		else output(" your pussy dripping and spraying all over the sheets");
	}
	if (pc.hasCock()) output(" and your cock spurting up your rapidly swelling stomach");
	output(".");

	output("\n\n<i>“Uhhhhnnnhh! Guh! Hnnnn!”</i> Zephyr cries through grit teeth, straining as hard as she can, her curvaceous butt flexing with every massive release, thick, virile cum jetting into your defenseless stomach like she has a firehose down your throat. <i>“Fuuuuck!”</i>");
	
	pc.loadInMouth(ppZephyr);

	output("\n\nBy the time her enormous ejaculations even <i>begin</i> to slow, you’re blissfully fucked out of your mind with your eyes rolling back in your head in pleasure. The feeling of her gigantic, meaty cock throbbing in your throat as it delivers its payload is just too titillating for you to bear. You can feel each and every bulge of her semen travelling down her gigantic cumvein down your neck, spurting from her tip into its rightful resting place - inside you.");

	output("\n\n<i>“Ohhhhhh, fuuuck...”</i> Zephyr groans at length, stretching out on top of you and drawing her powerful thighs closer inwards. <i>“Oh, I want to stay like this </i>forever<i>...”</i>");
	
	output("\n\nWeakly reaching up to cup her expansive asscheeks, you squeeze and grope them with some measure of satisfaction, feeling them flex intermittently when she cums another gigantic load inside your sloshing stomach.");
	
	output("\n\n<i>“Mmmn, that’s right,”</i> she murmurs encouragingly, wiggling her butt a little. <i>“Massage your master, [pc.name]. You’re doing great.”</i>");
	
	output("\n\nShe gives you a few moments to enjoy the feeling of cupping her beautiful ass before, with a quick, savage thrust that stretches your jaw to its utmost, she knots your mouth just like she said she would.");
	
	output("\n\n<i>“Unh! Mmmmm, fuck, that’s good,”</i> she sighs, sweeping her hair out of her face and grinning down at you. <i>“Now we can lie here for a while until my cock gets hard in your throat again. Do you think you can make me cum while I’m knotted, [pc.name]?”</i>");

	output("\n\nYou can, you know it. You’re not in the position to nod and your tongue is tightly squeezed to the bottom of your mouth by her fantastically large knot, but you can make her cum with your throat. Swallowing repeatedly, the action accomplishes next to nothing in terms of its original effect given that the nozzle of her cock is practically inside your stomach, but it does act as an <i>extremely</i> effective massage as your neck desperately ripples up and down, trying to swallow the massive rod of meat blocking it.");

	output("\n\n<i>“Oh. Oh, god, that’s </i>good<i>,”</i> Zephyr half-grunts, half-laughs in surprise. <i>“Oh- oh, fuck-”</i>");

	output("\n\nYou can see her abs appear on her stomach as she violently strains, overcome with the pleasure of the gentle but extremely persistent ministrations of your throat. A stream of hot, slippery jizz begins to spurt, then flow smoothly from her half-hard cock to join her previous loads in your stomach, drizzling down your insides.");

	output("\n\n<i>“You’re- you’re fucking milking me,”</i> Zephyr pants desperately, her fists balling up and uncurling repeatedly, momentarily on the back foot until slowly, she comes to realize how good it feels. <i>“Ohhh, god,”</i> she moans quietly, watching your face with pure adoration, <i>“I love you so much...”</i>");

	output("\n\nZephyr shifts position slightly so she can gently hold your head in her hands and caress your face, lightly moaning all the while as you keep up the undulating motions of your throat. When she finally deflates enough that she can gingerly remove herself from your lips, the first thing she does is");
	if (pc.hasHair()) output(" run her hands through your [pc.hair] and");
	output(" lean down to kiss you, passionately entwining her tongue with your own. Lying on top of you, she spends upwards of ten minutes just kissing and fondling you, caught up in your romance.");

	output("\n\n<i>“Mmmm. What did I do to deserve a beautiful angel like you?”</i> Zephyr murmurs afterwards, sitting on the bed with her back to the wall and you resting against her between her legs. Her hands settle atop of yours, slowly rubbing your bloated tummy full of her still-hot spunk.");

	output("\n\n<i>“Just being you is good enough for me,”</i> you tell her, leaning back and kissing her cheek with a smile.");

	output("\n\n<i>“Hunh,”</i> she mumbles inaudibly, laying her head on your shoulder. <i>“I don’t get told that too often. It feels kind of nice.”</i>");

	output("\n\n<i>“I’ll tell you I love you regularly enough to keep it fresh in your mind, then,”</i> you say, nodding.");

	output("\n\n<i>“I’d love it if you did,”</i> she says, closing her eyes.");

	output("\n\nYou let a few moments go by. <i>“I love you, Zephyr.”</i>");

	output("\n\nHer eyes still closed, she smiles widely while hugging you close. The two of you end up falling asleep like that, your form wrapped securely in your amazon lover’s embrace. You wake up once during your rest, but elect to snuggle against her and go back to sleep rather than leave her. By the time she wakes from her slumber, you’re fully rested. You do the washing and make the bed together, flirting casually as you enter the shower and panting hard, covered in sweat, when you exit it an hour later.");

	//back to Nursery
	sleepHeal();
	processTime(360 + rand(40));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function zephNurseryButtfuck():void
{
	clearOutput();
	showZephyrDeets(true);
	author("Wsan");
	
	var ppZephyr:PregnancyPlaceholder = getZephyrPregContainer();
	
	output("<i>“Do you like my butt, Zephyr?”</i> you ask, turning and flaunting it a bit. She takes the bait.");

	output("\n\n<i>“Hell yeah, I do,”</i> she replies, reaching down and giving it a squeeze. <i>“You putting it on offer?”</i>");

	output("\n\n<i>“Maaaybe,”</i> you tease her, then giggle as she scoops you off your feet into a princess carry.");
	
	output("\n\n<i>“That’s a yes,”</i> she says primly, depositing you on the bed");
	if (!pc.isNude()) output(" and stripping off your clothes in record time");
	output(". <i>“Ooh, you are gonna </i>get<i> it for being a little tease.”</i>");
	
	output("\n\n<i>“Oh, noooo,”</i> you moan in fake dismay, looking up at her with eyes wide. <i>“Please don’t fuck my little ass with your giant, throbbing dogcock until I’m screaming your name...”</i>");
	
	output("\n\n<i>“Fuck,”</i> she grunts, hastily pulling her skirt off and tossing it to the side to reveal her rapidly swelling dick, more blood being pumped into it by the second. She’s fully erect in mere moments, and you smile as you spread your legs. <i>“I get so fucking horny when you talk like that, [pc.name]. I hope you’re ready for a rough ride.”</i>");
	
	output("\n\n<i>“Always am,”</i> you say, eyeing the precum already beginning to drip from her pointed canine tip. <i>“Why don’t you bring that over here and let me lube it up a little?”</i>");
	
	output("\n\n<i>“Mmm, here,”</i> Zephyr murmurs, sitting on her knees next to you and presenting herself. <i>“Get to work, fast - I want you bouncing up and down on my fucking cock right now, and I dunno how long I can be bothered to resist the urge.”</i>");
	
	output("\n\nYou know she’s telling the truth, too - she’d happily bend you over and listen to your passionate screams of pain and pleasure while she spread your asshole wide completely dry");
	if (pc.ass.wetness() >= 2) output(" - or at least as dry as your lubed ass can get");
	output(". Part of it is the Throbb, but most of it is Zephyr, and you love her for that. She");
	if (pc.hasHair()) output(" runs her hand through your hair");
	else output(" affectionately strokes your head");
	output(" as you quietly get to work, licking the underside of her cock and drooling all over her length, sucking and slurping like a good little bitch. You pass a couple of minutes in silence, expressing your love with your tongue until she pulls you off.");
	
	output("\n\n<i>“Very good work, [pc.name],”</i> Zephyr tells you, lifting your head away with a grin. <i>“I’d almost think you wanted me to fuck your pretty little face instead of that ass of yours.”</i>");
	
	output("\n\n<i>“I wouldn’t mind...”</i> you murmur quietly, unheard by the domineering amazon as she lets her giant, fantastically thick cock rest between your legs");
	if (pc.hasCock()) output(", atop your own");
	output(".");
	
	if (!pc.hasCock())
	{
		output("\n\n<i>“Mmmm, you’re looking forward to this, aren’t you, you little slut?”</i> she says, inspecting your pussy. <i>“Just look at how fucking wet you are. I’m gonna make your little pussy cum all over your thighs with this dick.”</i>");
	}
	else
	{
		if (pc.biggestCockLength() < 15)
		{
			output("\n\n<i>“Your dick is so cute,”</i> she coos, playfully fondling it for a moment. <i>“But let me show you how good having a </i>real<i> one inside you is.”</i>");
		}
		else
		{
			output("\n\n<i>“Such a big cock for such a subby little bitch,”</i> she muses, running a finger down your prominent cumvein. <i>“I can’t wait to see you plaster yourself in cum when I fuck your brains out.”</i>");
		}
	}
	
	output("\n\n<i>“Please do,”</i> you beg her, relaxing into her grip as she places her hands on your legs and pushes them upwards then down, your knees practically next to your head.");
	
	output("\n\n<i>“Fuck, you’re a sexy little bitch,”</i> she mutters as she lines herself up with your asshole, her tip catching in the dimple of skin. <i>“I still can’t believe how lucky I am.”</i>");
	
	output("\n\nEnraptured by her praise, you’re so unprepared for the following penetration that you cum a little, your eyes shooting wide open as your body reflexively tries and fails to clamp down on Zephyr’s intrusion, her big, fat cock sliding into your [pc.asshole] with little to no hitching. She doesn’t stop, either, pushing down on your legs to bring your ass up in the air and using her powerful hips to get her entire dick inside you.");
	
	pc.buttChange(ppZephyr.biggestCockVolume());
	
	output("\n\n<i>“Aw, </i>fuck<i> yeah! You sexy whore, you took it all in one go!”</i> Zephyr pants, grinning like a shark. <i>“Here’s your fucking reward, slut!”</i>");
	
	output("\n\nShe begins roughly hammering you from above, pounding you so hard you sink into the bed with every thrust, the wet slap of her hips against your [pc.ass] resounding in the little room. You can see the pure animal lust in her expression, her pretty lips parted as she pants not inches away from your face. Overcome with passion, you reach up and pull her head closer, kissing her desperately, smooching her all over while her tongue slips into your mouth. Her strokes instinctively slow, becoming long, deep rolls of her hips that make your back irresistibly arch off the bed.");
	
	output("\n\nWith your lover in your mouth and your ass, controlling your every move, you can’t help but submissively cum, desperately moaning into her embrace.");
	if (pc.hasCock())
	{
		output(" Your [pc.cocks] begin");
		if (pc.cocks.length == 1) output("s");
		output(" messily spurting all over yourself, pointed downwards at your tummy and chest, while your needy pussy twitches and winks with instinctive desire, trying to milk a misplaced cock");
	}
	else if (pc.hasVagina())
	{
		output(" Your needy pussy twitches and winks with instinctive desire, trying to milk a misplaced cock even as Zephyr drives it deeply enough into your asshole to make your stomach bulge");
	}
	output(". She pulls back from your kiss and chuckles, looking down at you with smug superiority.");
	
	output("\n\n<i>“Oh, you like that?”</i> she whispers in your ear, hands shifting from your legs to your hips as she halts her motion. <i>“You like it when I slowly slide my big... fat... dogcock all the way inside you? The way it fills you utterly? Tell me.”</i>");
	
	output("\n\n<i>“I like it, I like it! I love your cock in my asshole,”</i> you whimper, curling your legs around her back and desperately imploring her for more. <i>“Please!”</i>");
	
	output("\n\n<i>“I love it when you get all needy for my cock,”</i> she murmurs with a smile, resuming her plundering of your stretched-taut asshole. <i>“Makes me hard as fuck.”</i>");
	
	output("\n\nShe’s right, too. You can <i>feel</i> her iron-hard length plunging into you, gaining speed as her eagerness to cum overcomes her desire to tease you. Grunting, her grip around your [pc.hips] tightens, holding you securely in place while she pounds the fuck out of you so hard your entire body jiggles, your moans growing louder and louder until you’re screaming in pleasure with every thrust, feeling your mistress and lover getting closer to orgasm.");
	
	output("\n\n<i>“Gnnnnnngh! Take it all, my little buttslut,”</i> Zephyr pants, beginning to groan in release as she <i>slams</i> herself to the hilt and leaves herself there, her tip spewing hot, milky cum into your asshole. <i>“Nnnnnf! Ohh, fuck! God, you feel so good...”</i>");
	
	pc.loadInAss(ppZephyr);
	
	output("\n\nOh, god! Having her orgasming inside you feels heavenly, her hips pressed right up against your ass while her cock pulses heavily, feeling every bit like a hose of sticky spunk. You only just came, but you’re right on the edge again! If she could just fuck you a little more, maybe even with that giant fucking knot of hers.");
	
	output("\n\n<i>“You’re so close,”</i> she says, grinning devilishly above you, her cheeks flushed with the heat of orgasm, her cock still pumping you full of cum, some of it spurting out of your tightly-stretched asshole. <i>“I can feel it. Do you want to cum, [pc.name]?”</i>");
	
	output("\n\n<i>“Yes,”</i> you gasp, looking up at her with love in your eyes and need on your lips. <i>“Please make me cum!”</i>");
	
	output("\n\n<i>“Who’s my little bitch?”</i> she asks you, her knot resting against your asshole even as her cock throbs and violently spurts seed up into your innards.");
	
	output("\n\n<i>“I am! I’m your little bitch,”</i> you moan, looking up at her with nothing less than utter submissive desire. <i>“Please knot me, Zephyr! Pleeeaaase slide your big, fat knoooohhh my god! Oh, god yes! Zephyr! Zephyr!”</i>");
	
	output("\n\nWith a savage grin, she follows your instruction to the letter, forcing you down her massive length with enough strength to pull a plow. The moment it slips inside you throw your head back and scream, cumming explosively all over her rigid cock. Zephyr leans down to murmur sexy, slutty promises in your ear, only driving you further onwards while you’re writhing on her pole.");
	
	output("\n\nBy the time you’ve fucked yourself out, you’re a wreck. You collapse back on the bed, your back sore with the effort of being so arched and your tummy swollen and sloshing with Zephyr’s warm cum, her dick still inside you.");
	
	output("\n\n<i>“Oh my god, you’re like a beast,”</i> you moan happily, completely sated. <i>“Nobody fucks like you do.”</i>");
	
	output("\n\n<i>“Damn right,”</i> Zephyr huffs, pleased with your praise. <i>“But I didn’t say we were done.”</i>");
	
	output("\n\nWith a quiet grunt, she effortlessly lifts you up off the bed and into her lap, pressing you right into her with a smile.");
	
	output("\n\n<i>“Oh, I’m gonna pound you so fucking hard,”</i> Zephyr purrs, a predatory gleam in her eyes. <i>“You won’t be able to walk for a week.”</i>");

	clearMenu();
	addButton(0, "Next", zephNurseryButtfuckII);
}

public function zephNurseryButtfuckII():void
{
	clearOutput();
	showZephyrDeets(true);
	author("Wsan");
	
	var ppZephyr:PregnancyPlaceholder = getZephyrPregContainer();
	
	output("Over the next few hours, she proves it true. You don’t even get a break in the shower, your hands against the glass and your butt pointed back at her like she’s frisking you against a wall, but instead she’s fucking you hard enough that your feet keep lifting off the floor of the shower and slamming back down. When you exit, Zephyr has her hands on your hips and her cock so deeply embedded in your ass that she can walk you herself, setting your course straight back to the bed and bending you over the mattress, where she continues plowing your ass so hard you bite the sheets and scream.");

	output("\n\nAfter that, she has your legs up in the air while she cums inside you again, noisily emptying herself into your guts, painting your insides with her seed. Then she takes you doggystyle, your outstretched arms barely able to keep you up on all fours such is the strength of her withering assault. Finally, it’s back to the shower where she holds you under the water in a full nelson and fucks you there for half an hour, pumping her hips so hard you wonder if this impossible woman ever runs out of stamina. When her cock finally deflates and slips out of your sloppy, well-fucked asshole, you’re on the verge of passing out as she gently puts you back on the bed.");

	output("\n\n<i>“Whew! Guess my appetite got the best of me,”</i> she groans, wiping her forehead with the back of her hand. <i>“And you. Sorry about that.”</i>");

	output("\n\n<i>“N-no, it’s, it’s okay,”</i> you pant, face down and ass up, your gaping, reddened fuckhole flowing with her semen. <i>“B-but I think... I’m gonna get some rest...”</i>");

	output("\n\n<i>“Okay, good night cutie,”</i> Zephyr says, leaning in to kiss you on the cheek. <i>“I’ll make myself scarce. I’ll see you next time, okay?”</i>");

	output("\n\nYou get a nice view of her thick, powerful ass swaying from side to side as she sashays into the bathroom without having put her skirt on, flaunting what she’s got. You hate to see her leave, but you love to watch her go. You’re asleep almost instantly, and when you awaken you have a lot of cleaning to do.");

	processTime(180+rand(30));

	for (var i:int = 0; i < 3; i++)
	{
		pc.orgasm();
		pc.loadInAss(ppZephyr);
	}

	//back to Nursery
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function zephNurseryGentleFuck():void
{
	clearOutput();
	showZephyrDeets();
	author("Wsan");
	
	var ppZephyr:PregnancyPlaceholder = getZephyrPregContainer();
	var vIdx:int = pc.findEmptyPregnancySlot(1);
	if(vIdx < 0) vIdx = rand(pc.vaginas.length);
	
	output("<i>“So,”</i> you murmur, reaching up behind you and softly tracing a couple of fingers along Zephyr’s cheek. <i>“Feel like taking your big, studly length and using it on your pregnant mate?”</i>");
	
	output("\n\n<i>“Hmmm,”</i> Zephyr hums, considering at length while her hand snakes downwards to cup a [pc.breast]. <i>“I think you deserve something a little more gentle than that today.”</i>");
	
	output("\n\n<i>“Oh my,”</i> you mutter, moaning slightly when she squeezes your sensitive nipple and gets a spurt of milk for her efforts. <i>“The New Texan secretary, Zephyr, treating someone gently? Well, I never...”</i>");

	output("\n\nShe snickers behind you. <i>“Don’t push your luck, [pc.name].”</i>");
	
	output("\n\nAs if to punctuate the point, her other hand finds your left breast and squeezes that too, getting a mirrored reaction. After that, she gently guides you to the bed and lays you down, looking down at you and your protruding tummy with a mix of pride and adoration.");
	
	output("\n\n<i>“You look beautiful,”</i> Zephyr says, smiling as her skirt begins to tent upwards. <i>“But you’ll look even hotter covered in my cum.”</i>");
	
	output("\n\n<i>“Oh? Prove it,”</i> you reply, stretching out luxuriously on the bed.");
	
	output("\n\nZephyr’s on you immediately, on all fours and carefully avoiding your tummy as she leans in to kiss your [pc.lips], pressing against you insistently while her tongue slips into your mouth.");
	
	output("\n\n<i>“Hmmmn,”</i> she murmurs, deftly wrapping her tongue around your own before letting go. <i>“Enjoying pregnancy, Steele? Any motherly desires rising up in you?”</i> Her fingers find your nipples and rub, massaging your milky teats until they start leaking on their own. <i>“If you ever want to give up travelling and settle down to become a full-time mommy, you know who to call.”</i>");
	
	output("\n\n<i>“Oh, is that a promise?”</i> you purr, half-closing your eyes as you enjoy the feeling of being worked over. <i>“Cooking and cleaning for you like a good housewife, then spreading my legs every night when you get home from work? Sounds dreamy.”</i>");
	
	output("\n\n<i>“Don’t knock it ‘till you try it,”</i> Zephyr says with a grin, then lowers her mouth to your breast.");
	
	output("\n\nYou moan, loudly this time, when she places her pretty lips on your [pc.nipple] and sucks. The flow of [pc.milk] is gradual at first, but soon enough she’s got you worked up to a rhythm that has her swallowing a mouthful of your milk every few seconds.");

	output("\n\n<i>“Oh, Zephyrrrrr,”</i> you groan, your");
	if (pc.hasFeet()) output(" toes curling as your back arches");
	else output(" back arching");
	output(". <i>“Leave some for the babies...”</i>");

	output("\n\nA desirous growl is her only reply before she resumes sucking, and soon you’re grinding right up against the frustrating edge of orgasm but unable to get over it. Until Zephyr deftly slides a finger into your dripping-wet pussy, that is. With a surprised gasp, you buck your hips into her steadying hand and throw your head back, crying out her name as you buffet your pillow.");
	
	output("\n\n<i>“Zephyr,”</i> you cry out in a voice barely louder than a whisper. <i>“Zephyr, Zephyr, Zephyr, Zephyr!”</i>");
	
	output("\n\n<i>“That’s what I like to hear,”</i> your amazonian lover murmurs, eyeing your shaking form with love. <i>“There’s more where that came from.”</i>");
	
	output("\n\nBefore you’ve even finished cumming, she’s switched to your left nipple and started sucking, beginning the process anew. In a few minutes you’ve gone from post-orgasmic pleasure to shaking in her hands, covered in sweat and moaning loudly every time she thrusts her fingers in your squeezing cunt. It’s no less intense when you cum the second time, although this time you’re a good deal louder about crying her praises.");
	
	output("\n\n<i>“Oh, god! Zephyr!”</i> you scream");
	if (pc.hasHair()) output(", your hair bedraggled and sweaty");
	output(" as you look up into her beautiful face. <i>“Oh my god, I’m cuh-cumming so hard..!”</i>");
	
	output("\n\n<i>“Good,”</i> she whispers, and seals your lips with a deep, hard kiss. You cum so hard at the eroticism of the act your eyes roll back and you momentarily lose consciousness, soaking the sheets and Zephyr’s fingers in your juices.");

	output("\n\n<i>“Look at you, making a mess,”</i> Zephyr murmurs, wiping her finger along your shuddering inner thigh and licking it clean. <i>“Good thing I’m here.”</i>");

	output("\n\nLooking down as she sits up on her knees, licking her fingers and eyeing you with restrained desire, you can see her massive cock sitting upright in front of her abs. The pointed canid tip comes up to her giant tits, a truly impressive sight. Zephyr really does have it all.");
	
	output("\n\n<i>“Put the tip in,”</i> you moan, begging her with your eyes. <i>“Please?”</i>");
	
	output("\n\n<i>“I’ll do better than that,”</i> she replies, a thumb on your [pc.clits " + vIdx + "]. You groan in pleasure, momentarily distracted, and then she’s inside you, stretching your pussy walls to their limit. You’re doing this for her as much as you are for yourself, if not more so. You could see how incredibly hard she’d been the whole time she was teasing you, and know how frustrating it is for her when she’s all pent up. Better to take it all now than force her to take care of herself later.");
	
	pc.cuntChange(vIdx, ppZephyr.biggestCockVolume());
	
	output("\n\nAlready sensitive from being taken to orgasm twice by Zephyr’s roving fingers, you find yourself cumming in less than thirty seconds of her penetrating you with her giant prick, unable to resist the inexorable rolling motion of her wide, powerful hips.");
	
	output("\n\n<i>“Ooh, mommy likes that, doesn’t she?”</i> Zephyr teases you with a grin, her face flushed and sweaty. <i>“Pregnant but still loves my big, fat cock stretching her out. You little slut, I love it.”</i>");
	
	output("\n\nYou gasp wordlessly, shaking and bucking on your impalement, squeezing down on Zephyr and bringing her closer to orgasm with every passing second. You can feel her knot swelling outside you, a reliable signal of the impending arrival of her seed if you’ve ever known one.");
	
	output("\n\n<i>“Nnnn- gonna cum pretty soon, princess,”</i> Zephyr grunts, displaying incredible restraint as she keeps her thrusts at a steady pace. <i>“Where do you want it?”</i>");

	output("\n\n<i>“Inside! Inside,”</i> you cry out desperately, wrapping your legs around her hips as best you can. <i>“I want to feel it...”</i>");
	
	output("\n\nPlanting her muscular arms on either side of your body and making a long, loud grunt of effort, you gaze up at her strained o-face as she explosively cums inside you. Hitting your sealed-off cervix, her massive gouts of cum immediately spurt back out of your pussy, splattering Zephyr’s groin and your sheets alike. She leaves the tip inside, shooting rope after rope of thick, warm seed and warming your pussy with another’s heat.");
	
	pc.loadInCunt(ppZephyr, vIdx);
	
	output("\n\n<i>She’s so fucking hot when she’s cumming</i>. You can’t help but submissively cum underneath her once more, smiling as you do, your cute little gasps for air providing a nice contrast to Zephyr’s long, strained breaths through grit teeth. It’s the most wonderful sight you can imagine, and it’s all yours. She opens her eyes at the touch of your dainty hand on her cheek, breathing raggedly, and the tension in her body finally loosens up.");
	
	output("\n\n<i>“Oohhh, fuck,”</i> she mutters, rolling over onto her back besides you. <i>“I really needed that.”</i>");
	
	output("\n\n<i>“Mmhm,”</i> you hum happily, a little pleased with yourself for having seen it. <i>“It was amazing for me, too.”</i>");
	
	output("\n\n<i>“You’re always such a charmer,”</i> Zephyr chuckles, turning to you in bed and giving you a kiss. <i>“Alright. I’m going to dump you in the other bed so I can clean this one and you can get some rest. Okay?”</i>");
	
	output("\n\n<i>“Okaaay,”</i> you mumble, stifling a yawn. You are actually very tired, now that she mentions it. You hold out your arms and Zephyr easily scoops you out of one bed and into the other, dabbing you with the dirtied sheets on the way so you don’t mess up the clean ones. You fall asleep to the sight of your muscular amazonian lover hurriedly performing chores on your behalf, crumpling up bedsheets and taking them away to be washed.");

	processTime(45+rand(15));

	for (var i:int = 0; i < 3; i++)
	{
		pc.orgasm();
	}

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function talkToZephAboutHerself():void
{
	clearOutput();
	showZephyrDeets();
	author("Wsan");

	output("<i>“So, how are you doing, lover?”</i> you ask, sitting down on her desk and smiling at her. <i>“You seem to have calmed down a little these days.”</i>");
	
	output("\n\n<i>“Well, I still get angry at Ellie,”</i> Zephyr admits, sighing a little. <i>“That silly bimbo...”</i> She shakes her head. <i>“I have a bit, though. I guess my priorities have shifted what with the family and all, you know? The little things don’t matter so much now. I don’t know that that’s exactly a great quality for a secretary to have, but fuck it,”</i> she laughs, <i>“I don’t think T really minds. Or notices.”</i>");
	
	output("\n\n<i>“That’s good,”</i> you say, locking eyes with her and nodding. <i>“I just want you to be more happy and less pent-up and angry.”</i>");
	
	output("\n\n<i>“Well, it’s working,”</i> she replies with a grin. <i>“Just having you here is making me feel better already.”</i>");
	
	output("\n\n<i>“That’s good,”</i> you murmur, slipping off the desk and pushing her chair back a little so that you can stand in the gap between her and the desk. You kneel down and smile generously at her. <i>“Let’s take care of that pent-upness, shall we?”</i>");
	
	output("\n\n<i>“Don’t mind if I do...”</i> Zephyr says, spreading her powerful, muscular thighs.");

	pc.changeLust(20+rand(5));
	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", talkToZephAboutHerselfII);
}

public function talkToZephAboutHerselfII():void
{
	clearOutput();
	showZephyrDeets();
	author("Wsan");

	output("You exit Zephyr’s office roughly an hour later, your asshole a little wider and your throat a little slicker. She didn’t get much work done, you recall with a cheeky grin, but you’re pretty sure she won’t mind. You lick your lips and swallow down the last remnants of her giant load, letting it join the rest of the liquid warmth in your slightly swollen tummy. No need to walk around with her cum on your face, not that you’d care on New Texas.");

	processTime(50+rand(20));
	pc.loadInMouth(getZephyrPregContainer());

	currentLocation = "526";
	generateMap();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function trySendZephyrKidsMail():void
{
	if (MailManager.isEntryUnlocked("zephyr_visiting_the_nursery")) return;

	if (zephKnowsAboutKids() && (days - flags["ZEPHYR_KIDS_DAYCOUNTER"] >= 7))
	{
		goMailGet("zephyr_visiting_the_nursery");
	}
}

public function zephyrMailAboutNursery():String
{
	var s:String = "Hey babe,\n\nI marched myself into Big T’s office as soon as I got back from Tavros this morning and told him that I was gonna be away for the weekends from now on. He wasn’t too fond of the idea until I told him I absolutely wasn’t going to let my kids forget who their second mommy was! The big lug tried to bear hug me as congratulations!\n\nI hope I’ll see you around with the kids!\n\nLove\n\nZephyr";
	return ParseText(s);
}