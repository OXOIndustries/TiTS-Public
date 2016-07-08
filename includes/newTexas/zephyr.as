//Old Room Desc (Replaced With Below)
//output("<i>“At the top of the stairs is a small, cozy room decorated with several hunting trophies, swords, old-earth guns, and a large wooden desk with a subtly built-in holoterminal. Behind is sits an abnormally flat-chest cow-girl, barely sporting D-cups, dressed much more conservatively than the scantily (if at all) clad cows on the ranch proper. <i>\"Are you here to see Mr. T.?”</i></i> she asks, looking up from her work, <i>\"He’d be happy to see you. Go on through.”</i>;");

//New Room Desc
public function zephyrRoomBonus():Boolean
{
	//showBust("ZEPHYR");
	output("At the top of the stairs is a cozy room decorated with several hunting trophies, swords, old-earth guns, and a large wooden desk with a subtly built-in holoterminal. A taxidermied bear is tucked into the corner, menacing over everything, its mouth locked in a menacing rictus grin. There’s even a furry rug, made from the hide of some local beast or varmint. The rustic atmosphere is as inescapable as a prison world.");

	//Room Blurb
	//Not introduced
	if(flags["MET_ZEPHYR"] == undefined)
	{
		output("\n\nSeated at the imposing desk is an equally imposing woman. Even seated, she fills the room, looming above and beyond the average cow-girl. She looks your way with a firm, unwavering gaze, waiting for you to step forward and explain why you’ve barged into her office.");
		addButton(0,"Secretary",approachZephyr,true);
	}
	//Annoyed
	else if(pc.hasStatusEffect("Zephyr Annoyed"))
	{
		output("\n\nZephyr, the secretary, looks up at you and snorts, waving dismissively at you. If you want anything from it her, it might be best to wait till she cools off.");
		addDisabledButton(0,"Zephyr","Zephyr","Zephyr annoyed. You should probably wait to approach her until she's in a better mood.");	
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
	ppZephyr.cocks[0].cLengthRaw = 9;
	ppZephyr.cocks[0].flaccidMultiplier = .6;
	return ppZephyr;
}

//Approach
public function approachZephyr(approached:Boolean = false):void
{
	clearOutput();
	showZephyrDeets();
	//First Time
	if(flags["MET_ZEPHYR"] == undefined)
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
	else addDisabledButton(1,"Sex","Sex","You aren't aroused enough for sex.");
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
	else if(flags["ZEPHYR_TREATMENT_TALKED"] != undefined)
	{
		output("Grinning now, Zephyr stands up from behind her desk. She bends low over it, one hand on the finished hardwood to support herself, immense breasts swaying hypnotically even under the layers of her fairly classy suit jacket. <i>“So even knowing I’m packing cock for days, you still want me to bend you over the desk?”</i>");
		if(pc.isTreated()) output(" She shakes her head. <i>“Of course you are, you’re treated.”</i>");
		else output(" She pokes you in the chest. <i>“You’re brave. That’s a quality I can respect.”</i>");
		output("\n\nA slow-growing bulge is spreading down the front of her skirt, promising to lift the hem before long. <i>“Now, how to play with you...”</i>");
	}
	//Fucked
	else
	{
		output("Grinning now, Zephyr rises up out of her seat. <i>“I suppose ‘squeeze it into you’ would be more apt.”</i> She leans low over the desk, one hand braced against the polished hardwood for support, her tits threatening to drag piles of notes to the floor. <i>“Since I’m feeling magnanimous today, how would you like me to take you today?”</i>");
		output("\n\nAn obvious bulge begins threatening the structural stability of her skirt.");
	}
	clearMenu();
	if(pc.hasCock()) addButton(1,"MutualHJs",mutualHandJobsWithZephyr,undefined,"Mutual Handjobs","Jerk each other off why not.");
	else addDisabledButton(1,"MutualHJs","MutualHJs","You need a dick for mutual handjobs.");
	addButton(0,"Get Fucked",overDeskButtCatch,undefined,"Get Fucked","Get bent over her desk and fucked.");
	if(pc.hasTailCunt()) addButton(2,"Use Tailcunt",cuntTailPlusZephyrIntro,undefined,"Use Tailcunt","Let Zephyr use your tailcunt. It could use a snack.");
	else addDisabledButton(2,"Use Tailcunt","Use Tailcunt","You don't have a tailcunt to play with.");
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

	//No cum
	if(pc.cumQ() < 5)
	{
		output("\n\nA few drops rolling onto the amazon’s fingers are all the evidence of your ecstasy that your body provides. Maybe you should give yourself a reset and build up some more.");
	}
	//Normal cum
	else if(pc.cumQ() < 20)
	{
		output("\n\nYou squirt [pc.cum] ");
		if(pc.isTaur()) output("all over her knees and the floor. Zephyr moans, tugging faster and harder, tugging you like intends to release every drop from its imprisonment in your [pc.balls].");
		else output("up into the air fat bullets, raining them down across her still-stroking fingers. The [pc.cumColor] release is soon mixed up with frothing spit-and-pre lube. Your [pc.cock " + x + "] shines with the stuff.");
	}
	//Centaur big cum
	else if(pc.cumQ() < 400 && pc.isTaur())
	{
		output("\n\nYour [pc.cock " + x + "] gives a mightly lurch, dribbling fat bullets of [pc.cum] before erupting a thick rope of orgasmic relief. Again and again, your tauric shoots the [pc.cumVisc] goo over Zephyr’s knees as well as the floor. A puddle of your evidence collects between her feet, but she doesn’t seem to mind, tugging you until only the barest trickles of [pc.cum] remain.");
	}
	//Human big cum
	else if(pc.cumQ() < 400) output("\n\nYour [pc.cock " + x + "] lurches in Zephyr’s grip, launching a rope of [pc.cum] so long that it’s still shooting out when the front spills across her knuckles. You buck against her, repeating the process again, thoroughly sliming her hands with your copious seed. She keeps going, mixing your [pc.cumNoun] in with the spit-and-pre until your [pc.cock " + x + "] shines with it. Neither of you pays much attention to the growing puddle beneath you.");
	//Centaur Huge cum
	else if(pc.isTaur()) output("\n\nZephyr nearly lets go when she feels your urethra bulge between her fingers. To her credit, she holds on, giving herself a front-row seat to an incredibly messy climax. She gasps when the first rope shoots out, long and thick enough to fill a glass in seconds. The amazon recovers while your first lance splatters against the floor, grabbing your [pc.cock " + x + "] in both hands and milking it for all she’s worth, too excited to care that you’re splattering her knees or threatening to overwhelm the drain in the floor.");
	//Human huge cum
	else output("\n\nZephyr nearly lets go when she feels your urethra bulge between her fingers. To her credit, she holds on, staring in awe when you launch a rope of cum thick enough to fill a glass. The amazon recovers just in time for your second eruption, pumping it so fast that the stream breaks apart as it emerges from your [pc.cockHead " + x + "], raining down across her hand, arm, tits, and face. Most gets on the desk and floor, but she keeps jacking all the same, marvelling at the way the drain in the floor struggles to keep up with your virility.");
	
	//Merge
	output("\n\nThe bright red phallus in your hand ");
	if(pc.cumQ() < 40) output("easily outshines your meager attempt");
	else output("follows your example");
	output(". Growing larger by the second, the amazon’s knot balloons up to its full size, almost three times as thick as her shaft. She spurts cum as soon as the bulge stops swelling. Her pearly streams emerge with surprisingly little force behind them, pouring over your hand like a waterfall of sexual release.");
	output("\n\nIt’s difficult to maintain the rhythm while your own orgasm is winding down, but you do your best to give her knot affectionate squeezes, ensuring she’s pouring seed until her legs are dripping with it. Even the chair has gained white spots. It’d fit right in with the cow-girls here. And the floor? The drain gurgles noisily under ");
	if(pc.cumQ() >= 20) output("your combined liquid loads");
	else output("the liquid load");
	output(".");
	
	output("\n\nSpent, you both sag back, [pc.cumNoun]-soaked palms slipping from wilting genitals.");
	output("\n\nZephyr wipes her hand clean with a rag");
	if(!pc.isTaur() && pc.cumQ() >= 20) output(", turning to her carelessly creamed desk");
	output(". She seems a little irritated by the mess, but satisfied all the same.");
	output("\n\n<i>“Not bad. Now get out. Thanks to you I have a bunch of cleaning to do before I can get any real work done.”</i> Zephyr gathers a dab of [pc.cumNoun] from your thigh and sucks it into her mouth, humming. <i>“You’re welcome to come back for more if you like.”</i>");
	output("\n\nYou might have to do that.");

	processTime(22);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	flags["SEXED_ZEPHYR"] = 1;

}

//Overdesk Catch It In Yer VagOrButt [Unfinished]
public function overDeskButtCatch():void
{
	clearOutput();
	showZephyrDeets(true);
	output("You mention that she could bend you over the desk and take you right here.");
	output("\n\nZephyr strides around the desk with a swiftness and grace belied by her imposing form. <i>“Now you’re speaking my language.”</i> Grabbing you by the neck with one hand, she pushes you down toward the top, her unoccupied fingers releasing the clasp at the side of her skirt. You turn your head to keep the eager amazon from breaking your nose and get a good look at her crotch in the process.");
	output("\n\nOf course, she’s not wearing any panties, not with a fat hound-sausage like that between her legs. It’d destroy panties on contact.");
	if(pc.lowerUndergarment.shortName != "") output(" You suddenly fear for your own.");
	output(" You’d guess it’s seven inches long right now, but there’s no way its at full size yet - it’s still hanging down, pointed at the floor. Every second or so it twitches, getting thicker, veinier, and redder. It protrudes from her forgotten slit, stretching her clitoral hood into an exotic-looking sheath. Just above its root, a slight bulb appears at its base, obviously a canine knot.");
	output("\n\nYou whimper, knowing that tennis ball-sized orb is going to be expanding inside you.");
	output("\n\n<i>“Now, now. Being anxious will only make me have to push that much harder.”</i> The hand holding you to the desk");
	if(pc.isCrotchGarbed()) output(" tightens while she yanks your [pc.lowerGarments] aside, revealing your [pc.butt]");
	else if(pc.hasHair()) output("strokes your [pc.hair]");
	else output("strokes your head");
	output(". <i>“If you relax, we can both enjoy this.”</i>");

	output("\n\nThe bitch-breaking length between her legs is well past a foot long and rising with bobbing, upward jerks, the head oozing a clear droplet of pre-cum already.");
	output("\n\n<i>“Either way, </i>I’m<i> going to enjoy it.”</i>");
	output("\n\nYou nibble at your own lip and nod acceptingly. ");
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	var fits:Boolean = false;
	if(x < 0) if(pc.analCapacity() >= 600) fits = true;
	else if(pc.vaginalCapacity(x) >= 600) fits = true;
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
	var cow:Boolean = (pc.isTreated() && pc.isBimbo());
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
	pc.lust(10);
	processTime(5);
	clearMenu();
	addButton(0,"Next",getFuckedByZephyrII);
}

public function getFuckedByZephyrII():void
{
	clearOutput();
	showZephyrDeets(true);
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	var fits:Boolean = false;
	if(x < 0) if(pc.analCapacity() >= 600) fits = true;
	else if(pc.vaginalCapacity(x) >= 600) fits = true;
	var cow:Boolean = (pc.isTreated() && pc.isBimbo());

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
	if(x >= 0 && pc.looseness(x) >= 4) stretched = true;
	else if(pc.ass.looseness() >= 4) stretched = true;
	if(stretched) output("slipping into your well-stretched entrance");
	else output("spreading you open");
	output(". Your mouth gapes, too overwhelmed by the sensory cascade to function properly. A throaty moan slips out, unbounded by the likes of reason or good sense. You push back. What point is there in resisting?");
	output("\n\nSlipping deeper and deeper, the amazon’s seemingly endless inches tickle nerves that have no business being so sensitive or eager.");
	var capacity:Number = 0;
	if(x >= 0) capacity = pc.vaginalCapacity();
	else capacity = pc.analCapacity();
	if(capacity < 550) output(" Her sheer size has you feeling stretched almost painfully tight, like a rubber band about to snap. Your sex-scattered neurons desperately scrape together a thought: what if she breaks you?");
	else if(capacity < 800) output(" Her sheer size has you feeling stretched delightfully tight, like your body was designed to wrap around this one, perfect dick. Your sex-scattered neurons desperately scrape together a thought. How are you ever going to enjoy fucking anyone smaller than this again?");
	else 
	{
		output(" Her size, as impressive as it is, doesn’t even begin to push you towards your boundaries. Your sex-scattered neurons desperately scrape together a thought: ");
		if(flags["PENNY_THROBB_PURCHASE_UNLOCKED"] != undefined || flags["PENNY_THROBB_USES"] != undefined || flags["TIMES_THROBB_USED"] != undefined) output("what if you got her some throbb?");
		else output("what if you could get her something to make her bigger?");
	}
	output("\n\nZephyr grunts in raw, animal pleasure and stops in an effort to adjust to the touch of your tunnel, huffing excitedly. <i>“Damn, you got an ass on you. You ready for the rest of it?”</i>");
	output("\n\nBetween revelling in the pulsing of her rod and trying to think, you lose track of her question halfway through. <i>“Huh?”</i>");
	output("\n\nA hand crashes down on your reddened derriere like a meteor, shocking you out of your dick-induced haze. You swallow some escaping drool and grasp for the right answer. <i>“...Yes?”</i>");
	output("\n\nZephyr shakes her head and resumes threading her rigid boner deeper into your [pc.vagOrAss]. <i>“Dunno why I bother even involving you in the conversation. ");
	if(pc.isTreated() && pc.isBro()) output("How bulls like you wound up running this planet, I’ll never understand.");
	else if(cow) output("Cows like you really got the short end of the Treatment stick.");
	else if(pc.isTreated() && pc.hasCock() && pc.femininity > 50 && !pc.isBro()) output("You’re just a faux cow after all. If I had it my way, all the boys would be eager, anal sluts like you.");
	else if(pc.isTreated() && pc.femininity > 50 && !pc.isBimbo()) output("You could’ve made something of yourself. Instead you’re bent over my desk and asking for more.");
	else output("Tourists like you just aren’t built for a proper Texan breeding.");
	output(" Just take it and moan. No sense straining yourself.”</i>");

	output("\n\nYou briefly consider some kind of retort, but the ");
	if(x < 0) output("butt");
	else output("cunt");
	output("-stretching dog-dick hits a particularly sensitive spot. You moan instead. How can you even think with that big, powerful knot straining at your ");
	if(x < 0) output("backdoor");
	else output("entrance");
	output("? How can you do anything but let your body press itself against the cow-girl’s muscled thighs? You do what comes naturally, relaxing to try and let her enter you in her entirety.");
	//[Next]
	pc.lust(15);
	processTime(9);
	clearMenu();
	addButton(0,"Next",getFuckedByZephyrIII);
}

public function getFuckedByZephyrIII():void
{
	clearOutput();
	showZephyrDeets(true);
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	var fits:Boolean = false;
	if(x < 0) if(pc.analCapacity() >= 600) fits = true;
	else if(pc.vaginalCapacity(x) >= 600) fits = true;
	var cow:Boolean = (pc.isTreated() && pc.isBimbo());

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
	var capacity:Number = 0;
	if(x >= 0) capacity = pc.vaginalCapacity();
	else capacity = pc.analCapacity();
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
	pc.lust(10);
	processTime(9);
	clearMenu();
	addButton(0,"Next",getFuckedByZephyrIV);
}

public function getFuckedByZephyrIV():void
{
	clearOutput();
	showZephyrDeets(true);
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	var capacity:Number = 0;
	if(x >= 0) capacity = pc.vaginalCapacity();
	else capacity = pc.analCapacity();
	var fits:Boolean = (capacity >= 600)
	var cow:Boolean = (pc.isTreated() && pc.isBimbo());

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
		output(" [pc.EachCock] jerks and shoots wildly");
		if(pc.cumQ() >= 25) output(", painting this side of the desk with long, [pc.cumColor] ropes");
		if(pc.cumQ() >= 300) output(". You even manage to make a decent-sized pool on the floor - something a well-placed drain is struggling to handle");
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
	
	var ppZephyr:PregnancyPlaceholder = getZephyrPregContainer();
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
	addButton(0,"Next",getFuckedByZephyrV);
}

public function getFuckedByZephyrV():void
{
	clearOutput();
	showZephyrDeets(true);
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	var capacity:Number = 0;
	if(x >= 0) capacity = pc.vaginalCapacity();
	else capacity = pc.analCapacity();
	var fits:Boolean = (capacity >= 600)
	var cow:Boolean = (pc.isTreated() && pc.isBimbo());
	output("You’re roused by the feeling of Zephyr’s bloated knot being tugged out of you and further wakened by the cascade of salty seed that chases it out of your [pc.vagOrAsshole]. Grinning, the dick-toting cow-woman slaps your [pc.butt] one last time, remarking, <i>“Not bad.”</i>");
	output("\n\nYou try to stand, but your [pc.legOrLegs] won’t cooperate, dumping you on the floor. Looking up for help, you’re confronted with the sight of a cum-covered dick.");
	//Treated/Bimbo - no new PG
	if(pc.isBimbo()) 
	{
		output("\n\nIt looks fucking delicious. You wrap your [pc.lips] around it and suck it like your life depends on it, shining it until its been spit-polished.");
		output("\n\nZephyr pats you on the head and whispers, <i>“Good [pc.boy], now run along before I decide to keep you under my desk for the rest of the day.”</i> You practically glow from the praise, beaming as you lick the last droplets from your [pc.lips]. This planet rules!");
		processTime(2);
		var ppZephyr:PregnancyPlaceholder = getZephyrPregContainer();
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
		addButton(0,"Clean It",cleanDatZephyrCawk,undefined,"Clean It","You might as well. After all, she’s at work.");
		addButton(1,"Don't",dontEatZephyrCock,undefined,"Don't","Fuck that. You got yours. She might not be real happy about it, though.");
	}
	flags["SEXED_ZEPHYR"] = 1;
}
//[Clean it]
public function cleanDatZephyrCawk():void
{
	clearOutput();
	showZephyrDeets(true);
	output("You give the tall cow-woman a wink and open wide, letting her push herself into your maw. She tastes salty and a little tangy - a mix of cum");
	if(pc.hasVagina()) output(", sweat, and your own feminine fluids");
	else output(" and sweat");
	output(". You run your tongue over every sensitive vein, keeping her completely hard until you finally pull back, revealing a gleaming red, spit-shined dog-cock.");
	output("\n\nZephyr gives you a pat on the head. <i>“Good [pc.boy]. Now get out of my office unless you’re wanting another go.”</i>");
	processTime(2);
	var ppZephyr:PregnancyPlaceholder = getZephyrPregContainer();
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
	output("<i>“No.”</i>");
	output("\n\nThunderclouds gather around Zephyr’s brows. Grabbing hold of herself just below the base, she swings it broadside into your face, splattering some of the leavings across your nose and cheek. <i>“Get the fuck out of my office, slut.”</i>");
	output("\n\nShe smiles down at your cum-stained visage, still pleased in spite of your rebellion.");
	//[Fight] [Leave]
	clearMenu();
	addButton(0,"Leave",leaveLikeABitchPC);
	addButton(1,"Fight",fightZephyrLikeABitch,undefined,"Fight","It might be a terrible idea, but you're itching for a fight after that kind of casual dismissal.");
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
	output("\n\nZephyr rolls her eyes. <i>“You have questions because you’re too lazy to do the research yourself, but Big T probably expects me to answer them all the same....”</i> She leans her cheek into a balled fist. <i>“So go ahead and ask your stupid questions.”</i>");
	clearMenu();
	addButton(1,"Her Job",zephyrsShittasticJobstory,undefined,"Her Job?","Ask Zephyr how she wound up as a secretary, a position she seems... ill-suited for.");
	addButton(0,"Treatment?",talkToZephyrAbootZeTreatmentEh,undefined,"Treatment?","Ask her about ")
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
	output("\n\nZephyr leans back and glances at her work. <i>“It’s a story for another time. Why don’t you make yourself scarce so I can get something done.”</i> She mutters, <i>“If I have to work this job, I might as well do it right.”</i>");
	output("\n\nYou nod.");
	output("\n\n<i>“Are you still here? Get out.”</i>");
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
	output("\n\nZephyr laughs at that, her smile warm and genuine for once. <i>“Its pretty easy when your families are already close and you’re the only one that can match him drink for drink. Besides, I’m the only girl around that he can carry on a conversation with. The others wind up sucking his dick mid-sentence, and Gianna’s a little naive to discuss politics with.”</i>");
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
	output("\n\n<i>“Not at first. He tried to laugh it off until I suggested that he was just afraid of losing to a girl.”</i> Zephyr slaps her knee. <i>“I might of said it loud enough for every bull in the place to hear.”</i>");
	output("\n\nYou wince.");
	output("\n\nThe suit-wearing cow just grins all the wider. <i>“Yeah, he couldn’t turn me down then. He accepted of course, but his terms fucked me over.”</i>");
	output("\n\n<i>“What were they?”</i> Just how could the wagers screw her?");
	output("\n\nZephyr sweeps her arm over his desk. <i>“He said that he’d accept if I’d be his secretary for a year. Can you believe it? That’s hardly a fair deal, but I had no bargaining position.”</i> She crosses her arms over her bust once more. <i>“I did make him promise that the job would be a galactic standard secretarial position - no mandatory oral or sexual relief.”</i>");
	output("\n\n<i>“Oh.”</i> There’s nothing else you can really say about that, besides... <i>“That sucks.”</i>");
	output("\n\n<i>“Yeah.”</i> Zephyr flops back down into her chair, defeated. <i>“I almost had him, too, but then he pulled the girl off his dick and focused. I didn’t even know she was there until then!”</i> She pouts, an expression that looks incongruous on her normally self-assured features. <i>“They don’t call him Big T. for nothing. I tried again last year, same terms, and lost again, but next time, I’m gonna get him for sure.”</i> She gestures at a huge pair of weights next to her desk. <i>“I’m practicing.”</i>");
	//Not met Ellie
	if(flags["MET_ELLIE"] == undefined)
	{
		output("\n\nThe door on the north side of the room clicks open, revealing a gray-skinned face attached to giant boobs and three pairs of legs. Zephyr’s are bigger, but the six-legged bimbo leaving Big T’s office is showing more, and besides, hers are shining, wet with something. The newcomer dabs at a white dribble on her cheeks and cheerly waves at the both of you. <i>“Hey Zephie! Hey stranger! See you in a few hours!”</i>");
		output("\n\n<i>“Fuck off, bimbo!”</i>");
		output("\n\nThe scent of sex fills the air as the woman passes by, blowing you and Zephyr a set of matching kisses. <i>“I love you too!”</i>");
		output("\n\nZephyr sighs, then looks back up at you. <i>“Get out of here before I wind up throwing you over the desk and raping your ass. That bitch’s pheromones always drive me crazy.”</i>");
	}
	//Met Ellie
	else
	{
		output("\n\nThe door on the north side of the room clicks open, revealing Ellie’s smiling face and gleaming, sperm-slathered boobs. Her bra is wet with more than milk at the moment, and she’s dabbing at a trickle of sperm on the corner of her mouth. She beams at you both. <i>“Ohhh, Zephie’s got a [pc.boy]-friend! How cute!”</i> She points accusingly at Zephyr. <i>“Don’t scare this one off, okay!”</i>");
		output("\n\n<i>“Fuck off, bimbo!”</i>");
		output("\n\nEllie prances by, her tail waving happily, leaving a cloud of sex-scented musk in her wake. <i>“Kay, I love you both! Later!”</i> The door slams closed behind her.");
		output("\n\nZephyr sighs, then looks back up at you. <i>“Get out of here before I wind up throwing you over the desk and raping your ass. That bitch’s pheromones always drive me crazy, and I do </i>not<i> want to make her right.”</i>");
	}
	//+10 lust
	pc.lust(11);
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
	pc.lust(5);
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
	output("\n\nYou work that one out just as you feel the cold stiffness of her heels rest atop your ass.  She can’t actually be serious! Does she really expect you to sit there, curled up like a-");
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
	pc.lust(40);
	clearMenu();
	addButton(0,"Next",getTailFuckedByZephyrSauce);
}
public function getTailFuckedByZephyrSauce():void
{
	clearOutput();
	showZephyrDeets();
	author("Frogapus");
	output("With a howl of pleasure, she jams your tail down against her dick, shoving her massive knot inside it. You answer with a squeal of your own, ignore the pain of her grapefruit-sized knot stretching out your tail cunt, eyes wide in pleasure as she pumps a hot jet of cum deep into your tail. Her grip around your tail doesn’t let go, and she keeps it locked around your base, her hand sliding up and down its length, jacking herself off through your tail cunt. When she shoot another small load of cum inside you, you quiver, seeing fireworks as pleasure erupts throughout your body.");
	pc.lust(30);
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
	output("\n\nBy the time you’re done dressing , her knot has gone down, and with a wet slurp, your tail slides free from it, slapping limply against the floor. You stiffen with a sharp intake of air, your back arching as you stand straight up, feeling yourself at the verge of climaxing.");
	output("\n\nZephyr is on you in a flash, striding forward and clamping her hand down on ");
	if(pc.hasCock()) output("[pc.oneCock] , her grip so tight that cumming would be an impossibility.");
	else output("your [pc.tailCunt], clapping her palm soundly against it, sending a sharp sting of impact up your body, interrupting your breathless spasm.");
	output(" <i>“Out!”</i> she orders.");

	//[PC.Willpower X 3 - Libido < 0:
	if(pc.willpower()/2 + rand(20) + 1 >= 15)
	{
		output("\n\nUnfortunately, her harsh ministrations have the opposite effect on your sensitive body. As soon as she lets go to shove you out the door, you fall to your knees, moaning in the throes of a desperate orgasm.");
		if(pc.hasCock() && !pc.isCrotchExposed())
		{
			output(" [pc.EachCock] ");
			if(pc.cumQ() < 10) output("spurts a small load");
			else if(pc.cumQ() < 500) output("fires a heavy load");
			else output("unleashes a torrent of cum");
			output(" beneath your garments as you shudder in ashamed delight, it dribbles out of your [pc.lowerGarments] and onto the thick, fur rug.");
		}
		else if(pc.hasCock())
		{
			output(" [pc.EachCock] ");
			if(pc.cumQ() < 10) output("spurts a small load");
			else if(pc.cumQ() < 500) output("fires a heavy load");
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
		output("\n\nZephyr looks down furiously  at the pooling mess beneath you, her lips pressed so tightly against each other that they disappear into a single, straight line. She grabs you by the arm, lifting you as easily as if you were a pillow, and with a mighty heave, flings you out of the room.");
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
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].southExit);
}