/*
Dryad on Mhen'ga, written/coded by Wsan.

To do :
Maybe more action in repeat encounters. Can't get carried away though...
*/

public function dryadHeader():void
{
	showName("\nDRYAD");
	showBust("DRYAD");
	author("Wsan");
}

public function dryadIsActive():Boolean
{
	if (amberRecruited()) return false;
	if(pc.hasStatusEffect("Dryad Cooldown")) return false;
	if(pc.lust() < 33 && rand(3) == 0) return false;
	if(pc.statusEffectv1("Dryad Encounters") < 8)
	{
		if(pc.statusEffectv1("Dryad Encounters") > 2 && rand(pc.statusEffectv1("Dryad Encounters")) != 0) return false;
		return true;
	}
	return false;
}

public function dryadCanSmellPC():Boolean
{
	return (pc.hasStatusEffect("Mare Musk") || (pc.hasVagina() && pc.wettestVaginalWetness() >= 4) || pc.hasStatusEffect("Cum Soaked"))
}

public function getDryadPregContainer():PregnancyPlaceholder
{
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.shiftCock(0, GLOBAL.TYPE_EQUINE);
	pp.cocks[0].cLengthRaw = 14;
	if (flags["AMBER_EQUILICUM"] != undefined) pp.createPerk("Fixed CumQ",18000,0,0,0);
	else pp.createPerk("Fixed CumQ", 6000, 0, 0, 0);
	if (flags["AMBER_DUMBFUCK"] >= 3 ) pp.createPerk("Fixed GirlCumQ", 3000, 0, 0, 0);
	else if (flags["AMBER_DUMBFUCK"] >= 1 ) pp.createPerk("Fixed GirlCumQ", 2000, 0, 0, 0);
	else pp.createPerk("Fixed GirlCumQ", 1000, 0, 0, 0);
	
	return pp;
}

public function dryadMeeting():void
{
	dryadHeader();
	
	if (flags["DRYAD_MET"] == undefined)
	{
		flags["DRYAD_MET"] = 1;
		output("\n\nYou can hear a high-pitched, frantic voice coming from up ahead. Sounds like someone is in trouble, and as you approach you see there’s a trail of hooved footprints that look to have trampled out an impromptu clearing. Scooping some foliage out of your face, you can see there’s a creature facing away from you off to the side. It looks to be tauric in nature, with four hooved legs, furred, and a bare humanoid upper half at the front of its body. You look down and are unsurprised to see a large, pink and fully erect horsecock swinging from its undercarriage – seems like everything out here wants to fuck. It turns towards you and you’re taken aback – you’re faced with a beautiful woman with flowing red hair down to her chest. She trots in your direction and you can see her hair was partially masking her breasts, which look to be about a C-cup and capped with pink nipples. As she gets closer, you note her face is red and that she’s breathing heavily, her hair strewn wildly and breasts rapidly moving up and down with her inhalations. She greets you first.");
		output("\n\n<i>“Um, hi! Listen, maybe you’ve heard this before but I really, <i>really</i> need to fuck someone before I go mad! These gene mods are great, but the ones I’ve used kinda clashed and now I go into heat multiple times a day and - look, can we just fuck?”</i>");
	}
	else if (flags["DRYAD_DRAINED"] != undefined)
	{	
 		output("\n\nYou can hear a high-pitched, frantic voice coming from up ahead. Sounds like someone is in trouble, and as you approach you see there’s a trail of hooved footprints that look to have trampled out an impromptu clearing. Scooping some foliage out of your face, you can see there’s a creature facing away from you off to the side. It looks to be tauric in nature, with four hooved legs, furred, and a bare humanoid upper half at the front of its body. You look down and are unsurprised to see a large, pink and fully erect horsecock swinging from its undercarriage – seems like everything out here wants to fuck. It turns towards you and you’re taken aback – you’re faced with a beautiful woman with flowing red hair down to her chest. She trots in your direction and you can see her hair was partially masking her breasts, which look to be about a C-cup and capped with pink nipples. As she gets closer, you note her face is red and that she’s breathing heavily, her hair strewn wildly and breasts rapidly moving up and down with her inhalations. She greets you first.");
		output("\n\n<i>“Oh hey, lover! Can we fuck some more? Please!”</i>");
 	}
	else
	{
		output("\n\nYou can hear a high-pitched, frantic voice coming from up ahead. Sounds like someone is in trouble, and as you approach you see there’s a trail of hooved footprints that look to have trampled out an impromptu clearing. Scooping some foliage out of your face, you can see there’s a creature facing away from you off to the side. It looks to be tauric in nature, with four hooved legs, furred, and a bare humanoid upper half at the front of its body. You look down and are unsurprised to see a large, pink and fully erect horsecock swinging from its undercarriage – seems like everything out here wants to fuck. It turns towards you and you’re taken aback – you’re faced with a beautiful woman with flowing red hair down to her chest. She trots in your direction and you can see her hair was partially masking her breasts, which look to be about a C-cup and capped with pink nipples. As she gets closer, you note her face is red and that she’s breathing heavily, her hair strewn wildly and breasts rapidly moving up and down with her inhalations. She greets you first.");
		output("\n\n<i>“Oh, it’s you! I’m in heat again – wanna fuck?”</i>");
	}
	
	output("\n\nShe makes puppy eyes at you, although the effect is somewhat diminished by the gigantic equine cock pointing in your direction. Still, though, it’s pretty clear she is at least telling the truth about the heat thing. She’s obviously desperate to fuck. Given her state, it looks like whatever sex you have is gonna be rough and animalistic regardless of whether you’re on the receiving end.");
	output("\n\nAre you going to have sex with the taur-girl, and if so what are you going to use?");
	
	//add text about getting taur equipment for ship to be able to recruit her
	amberEncounterAppend();
	
	processTime(3);
	pc.lust(5);
	
	if(!pc.hasStatusEffect("Dryad Encounters")) pc.createStatusEffect("Dryad Encounters", 0, 0, 0, 0, true, "", "", false, 1400);
	pc.addStatusValue("Dryad Encounters", 1, 1);
	
	var pp:PregnancyPlaceholder = getDryadPregContainer();

	clearMenu();
	addButton(0,"Give BJ", dryadBlowjob,undefined,"Give BJ","Use your mouth to get the girl off.");
	if(pc.lust() >= 33)
	{
		//addButton(0,"Give BJ", dryadBlowjob,undefined,"Give BJ","Use your mouth to get the girl off.");
		if (pc.hasVagina()) addButton(1, "Get Fucked", dryadPussy, undefined, "Get Fucked", "Let the girl fuck your pussy.");
		else addDisabledButton(1, "Get Fucked", "Get Fucked", "You don’t have a pussy for her to fuck.");
		addButton(2, "Get Reamed", dryadAss, undefined, "Get Reamed", "Let the girl fuck your ass.");
		if (pc.hasCock() && pc.biggestCockLength() >= 12) addButton(3, "Fuck Her", dryadDick, undefined, "Fuck Her", "Fuck the girl’s pussy to get her off.");
		else if (pc.hasCock()) addDisabledButton(3, "Fuck Her", "Fuck Her", "Your dick needs to be at least a foot long before the femtaur will let you fuck her.");
		else addDisabledButton(3, "Fuck Her", "Fuck Her", "You don’t have a foot-long dick to fuck her with.");
		if(pc.hasCuntTail() && pc.tailCuntCapacity() >= pp.cockVolume(0)) addButton(4,"Tail Milk",tailCuntDryadFun,undefined,"Tail Milk","Use your tail to milk her needy member.");
		else if(pc.hasCuntTail()) addDisabledButton(4,"Tail Milk","Tail Milk","You can’t fit her inside your cunt tail.");
		else addDisabledButton(4,"Tail Milk","Tail Milk","You need a tail-mounted vagina to do this.");
		//Dryad Commission – Facefuck/Deepthroat
		//[SuckMe]
		if(pc.hasCock()) addButton(5,"Suck Me",dryadFaceFuckSpecial,undefined,"Suck Me", "Make her suck you off. She’s sexed up enough she might just cum from it.");
		else addDisabledButton(5,"Suck Me","Suck Me","You need a dick for her to suck for this.");
		//Dryad Anal
		//Anal (Requires >= 10" length)
		if(pc.hasCock())
		{
			if(pc.longestCockLength() < 10) addDisabledButton(6,"FuckHerAss","Fuck Her Ass","You aren’t long enough for her to be interested.");
			else addButton(6,"FuckHerAss",dryadAnalFunsies,undefined,"Fuck Her Ass","Put it in her butt and go to town.");
		}
		else addDisabledButton(6,"FuckHerAss","Fuck Her Ass","You need a penis in order to fuck her ass.");
		//Drain the Dryad
		if (flags["DRYAD_BANGED_PC"] != undefined) 
		{
			if(pc.hasVagina() || !pc.isTaur()) addButton(7, "Drain Her", dryadDrain, undefined, "Drain Her", "Let the dryad pump you full.");
			else addDisabledButton(7,"Drain Her","Drain Her","You need to be bipedal (or at least non-tauric) in order to do this... or have a pussy for her to mount.");
		}
		else addDisabledButton(7,"Drain Her","Drain Her","You have to let her fuck you before you can do this.");
	}
	else
	{
		//addDisabledButton(0,"Give BJ","Give BJ","You aren’t aroused enough for that.");
		if (pc.hasVagina()) addDisabledButton(1, "Get Fucked", "Get Fucked", "You aren’t aroused enough for that.");
		else addDisabledButton(1, "Get Fucked", "Get Fucked", "Even if you were aroused enough, you don’t have a pussy for her to fuck.");
		addDisabledButton(2,"Get Reamed","Get Reamed","You aren’t aroused enough for that.");
		if (pc.hasCock() && pc.biggestCockLength() >= 12) addDisabledButton(3,"Fuck Her","Fuck Her","You aren’t aroused enough for that.");
		else if (pc.hasCock()) addDisabledButton(3, "Fuck Her", "Fuck Her", "Even if you were aroused enough, your dick needs to be at least a foot long to fuck her.");
		else addDisabledButton(3, "Fuck Her", "Fuck Her", "Even if you were aroused enough, you need a dick at least a foot long to fuck her.");
		if(pc.hasCuntTail()) addDisabledButton(4,"Tail Milk","Tail Milk","You aren’t aroused enough for this.");
		else addDisabledButton(4,"Tail Milk","Tail Milk","You need a tail-mounted vagina to do this.");
		addDisabledButton(5,"Suck Me","Suck Me","You aren’t aroused enough for this.");
		addDisabledButton(6,"FuckHerAss","Fuck Her Ass","You aren’t aroused enough for this.");
		addDisabledButton(7,"Drain Her","Drain Her","You have to let her fuck you at least once to do this.");
	}
	if (pc.hasKeyItem("Taur-centric Ship Equipment") && flags["DRYAD_FUCKED"] != undefined && flags["DRYAD_FUCKED"] >= 5) addButton(8, "Come With", amberComeWith, undefined, "Come With", "Ask the dryad to come with you aboard your ship.");
	addButton(14, "Leave", dryadNo, undefined, "Leave", "You don’t wanna bang right now.");
}

public function dryadBlowjob():void
{
	clearOutput();
	dryadHeader();
	var pp:PregnancyPlaceholder = getDryadPregContainer();

	output("You tell her you’ll suck her dick to get her off, and a smile crosses her lust-reddened face.");
	output("\n\n<i>“Oh, thank you! Thankyouthankyouthankyou!”</i>");
	output("\n\nYou seat yourself");
	if (pc.isTaur()) output(" on your haunches");
	output(", the furred underside of her belly gently brushing your head as she hurriedly steps above you to get into position. You scarcely have time to look at her cock, eyes widening slightly at the size of it before you’re overcome by the sensation of her flared head splitting your [pc.lips] into a slutty ‘O’ as she slowly thrusts herself into your depths, groaning all the while.");
	output("\n\n<i>“Oooohhh fuck, your throat is soooo gooood...”</i>");
	output("\n\n");
	if (pc.hasCock()) output("[pc.EachCock] involuntarily stiffens at her praise, shamefully acknowledging your pleasure in having your face fucked. ");
	output("She pants and shoves her thickening length further into the warmth and wetness of your unprepared throat, her hind legs quivering as your lips and tongue roll across her sensitive surface while she roughly plunges in and out of you. Your saving grace is that she’s so horny that her precum is flowing like a river down your gullet, easing her passage into your esophagus. Your ");
	if(pc.canDeepthroat()) 
	{
		if(pc.isBimbo()) output("throat is completely stuffed by the enormous object, stretched out nice and thick around the big fat cock. Part of you thrills to know that you’re hot enough to warrant a true face-fuck.");
		else output("throat is completely stuffed by the enormous object, stretched out nice and thick around the big fat cock. Part of you thrills to know that you’ve turned your throat into such a capable fuck-machine.");
	}
	else output("gag reflex is completely overwhelmed by such a large object passing through where it shouldn’t, which is great because you’d doubt you’d even be able to get her off you in her lustful frenzy.");
	
	output("\n\n<i>“Fuuuck, your throat is better than pussy! Hang on babe, I’m gonna cum real soon.”</i>");
	output("\n\nShe moans desperately and fucks your face with renewed vigor, your loud swallows accentuated by the slap of her heavy, churning balls against your chin as she repeatedly hilts herself in the cocksheath of your mouth, precum drizzling down your throat and leaking from between your [pc.lips].");
	if(pc.hasCock()) 
	{
		output(" Your own [pc.cocks] ");
		if(pc.cockTotal() > 1) output("jerk");
		else output("jerks");
		output(" every time she slides down your throat, the constant ooze of your precum spraying onto the forest floor beneath you.");
	}
	output(" Her hind legs lower to the ground as she fucks you with fierce thrusts of her hips, the warmth in your stomach growing by the second as the drooling from her cock starts to become more like a jet. She screams her pleasure to the skies while your eyes begin to roll upwards from the combination of lack of air and submissive pleasure.");
	output("\n\n<i>“Oh! <i>Oh, fuck!</i>”</i>");
	output("\n\nHer orgasm arrives on the heels of her wild screams, the first real stream of seemingly never-ending spunk swelling your belly directly when she hilts herself balls-deep in your throat. The moment the stream begins to slow she pulls back out, only to ram it back home with a low, wordless groan of pleasure as she drains her plump balls into you, each thrust bringing with it a renewed spray of jism straight down your willing throat, your neck bulging while you submissively suck load after hot load down its length. By the time she’s done you’re a mess, although to your credit the vast majority of her cum is settling safely in your stomach instead of splattered across your visage. She slowly withdraws her length from your well-used fuckhole with a light moan, her flare pulling past your [pc.lips] with a wet pop as she sighs in satisfaction.");
	IncrementFlag("DRYAD_BANGED_PC");
	IncrementFlag("DRYAD_BLEWHER");	
	pc.loadInMouth(pp);
	pc.lust(30);
	processTime(10);
	clearMenu();
	addButton(0, "Next", dryadAfterscene);
}

public function dryadPussy():void
{
	clearOutput();
	dryadHeader();

	var pp:PregnancyPlaceholder = getDryadPregContainer();
	var x:int = pc.findEmptyPregnancySlot(1);
	if(x < 0) x = rand(pc.totalVaginas());

	output("You tell her she can use [pc.oneVagina]");
	if (!pc.isCrotchExposed()) output(" as you remove your [pc.lowerGarments]");
	output(" to get off and a smile crosses her lust-reddened face.");
	output("\n\n<i>“Oh, thank you! Thankyouthankyouthankyou!”</i>");
	output("\n\nYou brace yourself against a nearby tree");
	if (pc.isTaur()) output(" as she hurriedly mounts you, scrabbling across your rear in her urgency to sink her cock between your lips.");
	else output(" as she slams her front hooves into the trunk above your head, the midsection of her cock slapping your [pc.pussy " + x + "] as she eagerly maneuvers into a position to mount you.");
	output("\n\nYou warily glance backwards to check up on her only to feel her flared head immediately split your [pc.pussy " + x + "] apart with no preparation.");
	if (pc.vaginas[x].looseness() < 3) output ("You scream a little in pain but");
	else output ("She easily slides into your willing cunt and");
	output(" at the rate she’s spraying pre into your fuckhole it’s not long before your teeth are gritted in pleasure, your heated moans matching her lusty and drawn-out groans in their intensity.");
	pc.cuntChange(x,pp.cockVolume(0));
	output("\n\n<i>“Ohhh fuck, you’re so good. The zil girls all want to do weird shit to me! It’s sooo nice to finally fuck someone normal!”</i>");
	output("\n\nYour canal lovingly swallows her length deeper, her flared cockhead almost immediately brushing up against your cervix as she pushes her urethra right up against your womb’s entrance. The jet of hot pre straight into your deepest crevices makes you gasp in surprise, delight and arousal as she warms you from the inside out. Your juices spray down your ");
	if(pc.isTaur()) output("hind ");
	output("[pc.legOrLegs], nowhere else to go given how full her cock has you. You find yourself pushing back against her, eliciting happy moans from above you as her balls start to slap against your [pc.butt], her rhythm speeding up in her desperate need to fill you with jizz.");
	output("\n\n<i>“I’m, gonna, cum soon,”</i> she pants out in between frenzied thrusts, <i>“I hope you’re ready to take it all!”</i>");
	output("\n\nAt this point you couldn’t be any more ready, screaming in pleasure every time she roughly slams her hefty, swollen balls against your ass and her cockhead against your womb, every thrust accentuated by a fresh spray of precum that pools inside you. It’s not long before she tightens her grip around you, her thrusts shortening in length as she rocks her hips back and forth and screams in ecstasy, joining you in a lusty cacophony.");
	output("\n\n<i>“Oh god! I-I’m gonna cum!”</i>");
	output("\n\nEven without the warning you can tell she’s finally cumming in you, each push up against your cervix accompanied by a loud groan as she flexes her cock inside you,");
	//Check how to check this.
	if (pc.isPregnant()) output (" venting her balls into the crevices of your [pc.pussy " + x + "]. She pulls back and rams herself back home, her next shot spraying explosively back out of you when it has nowhere to go, covering her hind legs in your and her juices.");
	else output (" draining her balls into your rapidly-filling womb. She pulls back and rams herself back home, her next shot immediately drowning your fallopian tubes in hot spunk as she fills you to capacity and then some, giving you a paunch to your belly as you swell.");
	output("You moan in both pleasure and exertion as her pulsating cock fills you to the brim, her flared head slipping loose when you can finally take no more, spilling her warm jizz down your ");
	if (pc.isTaur()) output ("hind ");
	output("legs and onto the ground beneath you.");
	IncrementFlag("DRYAD_BANGED_PC");
	IncrementFlag("DRYAD_YOURCUNT");
	pc.loadInCunt(pp,x);
	processTime(10);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", dryadAfterscene);
}

public function dryadAss():void
{
	clearOutput();
	dryadHeader();
	var pp:PregnancyPlaceholder = getDryadPregContainer();

	output("You tell her she can use your ass to get off");
	if (!pc.isAssExposed()) output(" as you remove your [pc.lowerGarments]");
	output(", and a smile crosses her lust-reddened face.");
	output("\n\n<i>“Oh, thank you! Thankyouthankyouthankyou!”</i>");
	output("\n\nYou brace yourself against a nearby tree");
	if (pc.isTaur()) output (" as she hurriedly mounts you, scrabbling across your rear in her urgency to sink her cock into your asshole.")
	else output(" as she slams her front hooves into the trunk above your head, her cock slapping your [pc.butt] as she eagerly maneuvers into a position to mount you.");
	output("Your grip on the tree tightens as you feel her flared tip at the entrance to your [pc.asshole], groaning at the feeling of your ring slowly swallowing her head, aided by the drool of pre into your ass. She croons comfortingly to you, but keeps pushing forward in one continuous motion anyway.");
	output("\n\n<i>“Relax, babe. It’ll be better for both of us if you just take it easy.”</i>");
	output("\n\nIt’s hard to follow her advice, but you do your best, gritting your teeth as she moans and conquers more of your colon. At least it’s only going to take one pass to lube you up what with how much pre she’s spraying into your butt. When she finally bottoms out in you, the feeling of her balls pressed against your [pc.butt] is a small comfort given the knowledge there’s no more to take. You’re shuddering and moaning in exertion and pleasure. She gives a long sigh of satisfaction and just leaves her cock fully in you for a moment, savoring the feeling of winning over your asshole.");
	
	pc.buttChange(pp.cockVolume(0));
	
	if(pc.ass.looseness() < 3) output ("\n\n<i>“God, you’re tight. The natives out here don’t even let me fuck their asses because of my size! I don’t think I’ve ever met anyone who can take it all until you!”</i>");
	else output("\n\n<i>“Wow, you’re loose back here! Good news for me! The natives out here won’t even let me fuck their asses, they’re all too small!”</i>");
	output("\n\nYou groan by way of reply, the heat and fullness of her throbbing length embedded deep in your body making it impossible to deliver any real semblance of speech. She giggles and slowly draws back, your juices and her precum making her exit a lot easier than her entrance, until her tip is almost out of you, contained only by your asshole still gripping her flare.");
	output("\n\n<i>“Don’t want me to pull out, huh? Don’t worry, I don’t intend to.”</i>");
	output("\n\nShe fiercely rams back in, instantly filling you up and making you scream in delight as her cock rubs over every sensitive bit of your insides, her rhythm unrelenting as");
	if (pc.isTaur()) output(" your front legs buckle, leaving her tightly grasping your hindquarters and slamming your still-raised rump, your limp upper half on the ground as she roughly fucks you with her hips, your brutal treatment only exciting you all the more.");
	else output (" she fucks you into the ground until she’s standing over your upraised rump, your face on the ground as her hips roughly rock you back and forth, your brutal treatment only exciting you all the more.");
	output("\n\nHer balls loudly slap off your raised ass every time she thrusts, and a mix of your wetness and her precum drizzles down your [pc.legOrLegs] every time she pulls outwards.");
	output("\n\n<i>“Gonna cum,”</i> she lewdly moans from above you, <i>“Fuck! Fuckfuckf-”</i>");
	output("\n\nHer speech trails into a loud intake of breath followed by an extremely satisfied and drawn-out groan as her cock throbs and explodes in your depths, flooding your intestines with her payload of warm equine jizz. Her frantic thrusting comes to a halt, only withdrawing when the bountiful stream of spunk recedes so she can lazily thrust back in with a moan, your ass being filled more every time she bottoms out. Lying there passively you can actually <i>feel</i> her balls twitching and jerking while they pump cum directly into your innards. When she’s finally done you feel bloated, but at least you’re warm. She pulls herself free from your distended asshole with a wet pop, sending a cascade of excess jism down your ");
	if (pc.isTaur()) output ("back ");
	output("legs and onto the ground beneath you.");
	IncrementFlag("DRYAD_BANGED_PC");
	IncrementFlag("DRYAD_ANALEDYOU");
	pc.loadInAss(pp);
	pc.lust(30);
	if(pc.lustQ() >= 100)
	{
		output("\n\nThe sensation of fullness added with the spike in lust sends you over the edge and you let out a complimentary orgasm. That was quite the experience!");
		pc.orgasm();
	}
	processTime(10);
	clearMenu();
	addButton(0, "Next", dryadAfterscene);
}

public function dryadDick():void
{
	clearOutput();
	dryadHeader();
	var pp:PregnancyPlaceholder = getDryadPregContainer();
	var x:int = pc.cockThatFits(1400);
	if(x < 0) x = pc.smallestCockIndex();
	if(pc.cocks[x].cLength() < 12) x = pc.biggestCockIndex();

	output("You tell her you’ll have sex with her, but she’s going to be on the receiving end. She looks surprised, suspicious and resigned all within a second before giving in.");
	output("\n\n<i>“Okay, okay! I’ll take anything as long as you can get me off. Not like it’ll be hard.”</i>");
	output("\n\nThat was fast. She hurriedly trots to a tree and braces herself against it, invitingly spreading her back legs wide to reveal her dripping cunt. She turns her humanoid half to look back at you and gives you a scorching glare.");
	output("\n\n<i>“<i>Please</i> don’t keep me waiting.”</i>");
	if (pc.isTaur())
	{
		output("\n\nYour instincts take over at such willing presentation and you rear up to wrap yourself around her midsection, [pc.oneCock] springing");
		if (!pc.isCrotchExposed()) output(" free of your [pc.lowerGarments]");
		else output(" to full erection");
		output(" while you seek to align it with her wet and ready hole. The tip of your dick slips in and you immediately ram your full length into her with a grunt, making her scream lustily as her cock sprays the ground with seed. Her pussy is wrapped tightly around your dick, overwhelmingly warm and rapidly contracting as she shakes in your grip.");
		pc.cockChange();
		output("\n\n<i>“Did you just cum the moment I put it in?”</i> You ask, knowing the answer but wanting to hear it anyway.");
		output("\n\n<i>“YES! Don’t stop fucking meee!”</i>");
		output("\n\nYou oblige her by pulling back until you’re on the verge of slipping out of her, drawing a complaining whine from the girl until you startle her into ecstatic silence by ramming fully into her again. Some of her juices spray out of her, covering your hind legs in her warmth, but you don’t let up. You settle into a rhythm of drawing back and slamming back in with powerful movements of your hips, each time you bottom out eliciting a scream of pure pleasure from the mouth of the femtaur.");
		output("\n\n<i>“Don’t – stop!”</i> She pants out in between your thrusts, <i>“So, fucking, good!”</i>");
		output("\n\nShe must have been ridiculously pent up to be reacting like this, so you decide to take it up a notch. Grabbing hold of her midsection, you ram your throbbing length right up to the opening to her womb and let her get used to it for a second, momentarily placating her needy lust by dripping precum into her. She moans in satisfaction as you slowly draw back then gasps as you drive forward with your powerful hips, sending the head of your cock right up against her cervix and filling her utterly. Her back instantly arches and her human half leans backward, squeezing her own nipples tightly as she screams to the heavens.");
		output("\n\n<i>“I-I’m, cu-uhh! Cumming!”</i>");
		output("\n\nHer warm canal grips your [pc.cock " + x + "] like a vise, her front legs losing their grip in the mud under her and sending her front half tumbling as she shudders around you. She moans into the brush and dirt as her cock paints her furred underside pearl with sticky equine jizz, her ejaculations spurred on every time you");
		if(pc.balls > 0) output("r [pc.balls]");
		output(" slap against her rounded buttcheeks. You’re still not done, so you fuck her as hard as you can, sending her sprawling in the mud until she’s lying against the trunk of the tree and hugging it with both arms desperate to not slip out of your grasp. She’s still cumming underneath you, her cunt contracting almost painfully at this point, the added stimulation driving you to the point of no return.");
		output("\n\nYou grunt through gritted teeth as you bury your dick deep in her, pushing right up against her cervix to make sure your jizz sprays right into her womb. She moans in delight underneath you, pressing her butt against you as though she wants to give you all of her. You lean back to slap her flank and hear a gasp followed by a seductive moan, and she stays quiet while you pump her full of cum. You think she likes that.");
	}
	else
	{
		output("\n\nYour instincts take over at such willing presentation and seize her flank, [pc.oneCock] springing");
		if (!pc.isCrotchExposed()) output(" free of your [pc.lowerGarments]");
		else output(" to full erction");
		output(" while you seek to align it with her wet and ready hole. The tip of your dick slips in and you immediately ram your full length into her with a grunt, making her scream lustily as her cock sprays the ground with seed. Her pussy is wrapped tightly around your dick, overwhelmingly warm and rapidly contracting as she shakes in your grip.");
		pc.cockChange();
		output("\n\n<i>“Did you just cum the moment I put it in?”</i> You ask, knowing the answer but wanting to hear it anyway.");
		output("\n\n<i>“YES! Don’t stop fucking meee!”</i>");
		output("\n\nYou oblige her by pulling back until you’re on the verge of slipping out of her, drawing a complaining whine from the girl until you startle her into ecstatic silence by ramming fully into her again. Some of her juices spray out of her, covering your legs in her warmth, but you don’t let up. You settle into a rhythm of drawing back and slamming back in with powerful movements of your hips, each time you bottom out eliciting a scream of pure pleasure from the mouth of the femtaur.");
		output("\n\n<i>“Don’t – stop!”</i> She pants out in between your thrusts, <i>“So, fucking, good!”</i>");
		output("\n\nShe must have been ridiculously pent up to be reacting like this, so you decide to take it up a notch. Grabbing hold of her rear thighs, you ram your throbbing length right up to the opening to her womb and let her get used to it for a second, momentarily placating her needy lust by dripping precum into her. She moans in satisfaction as you slowly draw back then gasps as you drive forward with your powerful hips, sending the head of your cock right up against her cervix and filling her utterly. Her back instantly arches and her human half leans backward, squeezing her own nipples tightly as she screams to the heavens.");
		output("\n\n<i>“I-I’m, cu-uhh! Cumming!”</i>");
		output("\n\nHer warm canal grips your [pc.cock " + x + "] like a vise, her front legs losing their grip in the mud under her and sending her front half tumbling as she shudders around you. She moans into the brush and dirt as her cock paints her furred underside pearl with sticky equine jizz, her ejaculations spurred on every time you");
		if(pc.balls > 0) output("r [pc.balls]");
		output(" slap against her rounded buttcheeks. You’re still not done, so you fuck her as hard as you can, sending her sprawling in the mud until she’s lying against the trunk of the tree and hugging it with both arms desperate to not slip out of your grasp. She’s still cumming underneath you, her cunt contracting almost painfully at this point, the added stimulation driving you to the point of no return.");
		output("\n\nYou grunt through gritted teeth as you bury your dick deep in her, pushing right up against her cervix to make sure your jizz sprays right into her womb. She moans in delight underneath you, pressing her butt against you as though she wants to give you all of her. You slap her flank and hear a gasp followed by a seductive moan, and she stays quiet while you pump her full of cum. You think she likes that.");
	}
	if (flags["DRYAD_FUCKED"] == undefined)
	{
		output("\n\nWhen you pull your cock from her still-quivering pussy, she moans but doesn’t move, allowing your [pc.cum] to spill out from her and down her stomach, staining what little of her underside wasn’t already painted by her own cock. You’re cleaned up and about ready to leave, but you pause to consider whether you should check on her given she hasn’t moved from where you fucked her. Right as you approach her, she springs back to her feet, seemingly recovered.");
		output("\n\n<i>“Thanks so much! You honestly have no idea how much I needed that. Come back any time! It’s always rough when I’m in heat, I can really use the help.”</i>");
		output("\n\nShe");
		if (pc.tallness < 70) output (" bends down and");
		output(" gives you a gentle kiss before gracefully loping away, her tail flitting hypnotically from side to side as she disappears into the foliage. You shrug. Weird as ever, but you’re not complaining.");
	}
	else
	{
		output("\n\nWhen you pull your cock from her still-quivering pussy, she moans but doesn’t move, allowing your spunk to spill out from her and down her stomach, staining what little of her underside wasn’t already painted by her own cock. You’re cleaned up and about ready to leave, but wait to see if she gets up this time. Sure enough, she springs back to her feet, seemingly recovered.");
		output("\n\n<i>“Thanks so much! You help me out a lot with my heat. Come back any time! It’s rough wanting to fuck so often, I can always use your help.”</i>");
		output("\n\nShe");
		if (pc.tallness < 70) output (" bends down and");
		output(" gives you a gentle kiss before gracefully loping away, her tail flitting hypnotically from side to side as she disappears into the foliage. You shrug. Weird as ever, but you’re not complaining.");
	}
	IncrementFlag("DRYAD_FUCKED");
	IncrementFlag("DRYAD_HERCUNT");
	processTime(10);
	pp.loadInCunt(pc, 0);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function dryadAfterscene():void
{
	clearOutput();
	dryadHeader();
	if (flags["DRYAD_FUCKED"] == undefined)
	{
		output("The dryad sighs deeply in satisfaction and looks at you.");
		output("\n\n<i>“You have no idea how much I needed that. Thanks, babe. Come back any time! It’s always rough when I’m in heat, I can really use the help.”</i>");
		output("\n\nShe");
		if (pc.tallness < 70) output (" bends down and");
		output(" gives you a gentle kiss before gracefully loping away, her tail flitting hypnotically from side to side as she disappears into the foliage. You heft yourself to your feet, the sensation of warmth filling your swollen belly making you feel a bit lethargic and docile as you prepare to leave.");
	}
	else
	{
		output("The dryad sighs deeply in satisfaction and looks at you.");
		output("\n\n<i>“Thanks again for getting me off! You’re really good at that. I really hope I run into you again babe, being in heat so often is rough and I can always use your help.”</i>");
		output("\n\nShe");
		if (pc.tallness < 70) output (" bends down and");
		output(" gives you a gentle kiss before gracefully loping away, her tail flitting hypnotically from side to side as she disappears into the foliage. You heft yourself to your feet, the sensation of warmth filling your swollen belly making you feel a bit lethargic and docile as you prepare to leave.");
	}
	if (silly) output("\n\nYou hear a faint “Sproink!” in the distance, then silence.");
	
	pc.createStatusEffect("Dryad Cooldown", 0, 0, 0, 0, true, "", "", false, (60 + rand(61)));
	IncrementFlag("DRYAD_FUCKED");
	processTime(3);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function dryadNo():void
{
	clearOutput();
	dryadHeader();
	output("You tell her you don’t have the time to help her out");
	if(pc.lust() < 33) output (", and you’re not in the mood right now, anyway");
	output(". Her ears droop and her face sinks.");
	output("\n\n<i>“O-okay...”</i>");
	output("\n\nShe shuffles from side to side and fidgets, shooting you furtive glances as you turn to leave. You half-wonder if she’s going to jump you in her need, but she stands her ground as you wander away through the brush.");
	processTime(2);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//Tail cunt vs. Dryad
public function tailCuntDryadFun():void
{
	clearOutput();
	dryadHeader();
	author("Frogapus");
	output("You grin at the fem’s offer and decide that this would be the perfect time to sate your symbiotic appendage.");
	output("\n\n<i>“How about a tail job?”</i> you ask her. You raise your tail up over your shoulder, running your fingers along its underside, thrilling at the shiver of pleasure that runs down its length and up your spine. At your touch, it trembles open, displaying its inviting, [pc.tailCuntColor] folds to the frantic taur.");
	output("\n\nShe pauses hesitantly at first, but a visible twitch from her bright, pink cock shakes her into action. <i>“Oh... okay, sure! I mean... as long as you’re sure it can handle me.”</i>");
	output("\n\nYou assure her it can and she claps her hands with glee, her rump shaking from side to side. Her massive dick swings with it, trailing pre across the forest floor. <i>“Oh goody! Thank you so much! You wouldn’t believe how hard it’s been!”</i>");
	output("\n\nYou smirk at the statement and ");
	if(pc.isTaur()) output("sidle up against her, your warm flank pressed to hers, as she turns to face you.");
	else if(pc.tallness > 72) output("approach her front, looking into her eyes.");
	else output("approach her from the front, looking up at her. She kneels down curiously, bringing her head level to yours.");

	if(pc.isTaur()) 
	{
		output("\n\nYour tail slides beneath your legs, ");
		if(pc.balls > 0) output("brushing sinuously against your [pc.balls], ");
		output("curling under her belly, and running up the length of her cock, smearing your tail cunt’s lubrication along it.");
	}
	else
	{
		output("\n\nYou curl your tail around your [pc.hips], slipping it between the taur’s legs.");
	}
	output(" Its slippery slit brushes up against her erect horsecock. You feel the flared front of it pressing against your prehensile tail, and she bucks against you impatiently.");
	output("\n\nYou slide your [pc.arms] up to her breasts, fingers splaying over their soft curves. You lift her nubile breasts to your mouth, running your [pc.tongue] around her pink areolas, tracing the smoothness and subtle bumps. She gasps in pleasure, arching her neck, her red hair cascading down her back. <i>“Oh fuck yesssss!”</i> she hisses through clenched teeth.");
	output("\n\nYour tail cunt surges forward, driven by a warm splash of the ");
	if(pc.isTaur()) output("other ");
	output("taur’s pre against it. With a wet squelch, it engulfs the taur’s massive cock. Through shared senses, you feel the wide rim of her equine dick fill your tail, stretching tight around its hot, wet walls. You moan through a mouthful of the dryad’s breast, her own squeal of pleasure answering you. Your fingers sink deep into her pillowy mounds as your tail pushes further and further down her shaft. The head of her cock sinks further and further into you, feeling impossibly wide, driving deep into your symbiont.");
	output("\n\nShe wraps her arms around your back, her fingers digging deep into your [pc.skinFurScales] and raking lines down your back. She pants in pleasure, her full lips against your [pc.ear], breathing hot, and heavy against you. <i>“Oh yes... Oh fuck... oh, it’s so tight...”</i>");
	output("\n\nYou bury your face into her breasts, moving your mouth from one to the other. Your teeth graze over her nipples as your tongue teases and flicks each one in turn. ");
	if(pc.hasCock())
	{
		output("Your own cock");
		if(pc.cockTotal() == 1) output(" is");
		else output("s are");
		output(" rigid, twitching in the sensory feedback from your cunt tail, pre already starting to bead at your tip");
		if(pc.cockTotal() > 1) output("s");
		output(". ");
	}
	if(pc.hasVagina())
	{
		output("Your ");
		if(pc.totalVaginas() == 1) output("pussy throbs");
		else output("pussies throb");
		output(", aching to be filled, already sympathetically wet with the pumping one at the end of your tail. ");
	}
	output("You can feel the taur inside your tail, already twitching, despite not even being halfway engulfed.");

	output("\n\nOut of pride or lust you spur your tail forward, and it slowly courses down the dryad’s length, rippling, sending wave after wave of pleasure up your spine, flooding your nervous system with bliss. You open your mouth, releasing the dryad’s breast, to tilt back your head and let out a mindless moan of pleasure. Your eyes flutter as you feel something warm against your lips. You struggle to focus, finding the dryad’s lips locked against yours. Her own expression-what you can see of it at any rate-seems similarly lost in a haze of joy.");
	output("\n\nYou and the dryad share a carnal kiss, her tongue wrestling with yours as your tail pushes further and further down her dick. She pushes back, too, anxious to fill the depths of your tail. You can feel your cunt tail convulse as she oozes out a trickle of pre inside it, and it begins contracting in waves, swallowing the trickle of fluid. With every inch you take, she squeaks softly into your mouth, and your whole body trembles.");
	output("\n\nFinally, your slavering cunt brushes against the curve of her heavy balls. She groans, and your tail cunt slides back, oozing wetness across her shaft, exposing it to the air, before undulating back down, hot and wet around the dryad’s dick. She groans, breaking the kiss, to arch her back as your tail begins pumping slowly up and down her length.");
	output("\n\nYou slide up and down her length, tight around her massive dick, almost as if your tail were an onahole for the dryad’s pleasure. As you build speed, she wraps her arms tight around you and pulls you against her chest.");
	if(pc.isTaur()) output(" She pulls you against her, right, her face buried against your neck. He sucks and bites against your shoulder and neck as she gasps hungrily.");
	else output(" She pulls your face into her chest, her breasts pressing against your cheeks as she gasps in pleasure. You can do little more than pant against her cleavage, drawing further squeals from the frantic taur.");
	output("\n\n<i>“More! More!”</i> she pleads, her hips bucking against your tail cunt. <i>“I need to... to...”</i>");
	output("\n\nYou redouble your efforts, your tail cunt pumping like a piston around her cock, pussy juice splattering against the forest floor. She squeals in overwhelming bliss as her cock twitches sharply in your tail cunt.");
	output("\n\n<i>“CUM!”</i> she shrieks.");
	output("\n\nWith a primal scream of joy she shoves HARD against your tail cunt, and lets loose a flood of cum into it. Instinctively, your tail shoves down against her cock, wrapping tight around her base, its walls rippling as it milks her.");
	output("\n\nYou actually feel your tail bulge outwards, ballooning out around her tip as she fires out an initial bucket’s-worth of cum into your tail cunt. Your breath catches in your throat, as her arms wrap tight around you, pulling you sharply against her. She howls again, firing another massive load of cum inside you, just as your tail tries to process the first gout of thick, hot seed.");
	output("\n\nThe sensations begin to overwhelm you, and you feel your body respond in kind.");
	if(pc.hasCock()) 
	{
		output(" Your [pc.cocks] spurt");
		if(pc.cockTotal() == 1) output("s");
		output(" in a hands-free orgasm, ");
		if(pc.isTaur()) output("dumping your load onto the forest floor.");
		else output("spurting your load against the dryad’s smooth belly.");
	}
	if(pc.hasVagina())
	{
		output(" Your [pc.vaginas] tremble");
		if(pc.totalVaginas() == 1) output("s");
		output(", ");
		if(!pc.isSquirter()) output("trickling");
		else if(pc.girlCumQ() < 1000) output("spurting");
		else output("gushing");
		output(" your juices down your thighs.");
	}
	if(!pc.hasGenitals()) output(" You groan in frustration, pinned to the dryad, unable to find release.");

	output("\n\nYou tremble against her, your body feeling weak. The cum keeps coming, filling your tail cunt until it stretches out along its whole length. To your symbiont’s credit, it stays mostly sealed around her shaft, save for a small spurt of white, milky cum running down her equine balls.");
	output("\n\nYou’re not sure how much more of this your tail-or you-can take. When she finally finishes, she lets out a satisfied sigh, her hips giving a final buck. You pull back away from her chest with a gasp, definitely feeling worse for the wear. Your tail aches, stuffed to the brim, barely able to wriggle weakly against her shaft, looking like an overfilled condom, full to sloshing with the dryad’s near-endless load.");
	output("\n\nThe dryad sighs deeply in satisfaction and looks down at you.");
	output("\n\n<i>“You have no idea how much I needed that. Thanks, babe, And come back any time! It’s always rough when I’m in heat, I can really use the help.”</i>");
	output("\n\nBefore you can burble a response, she lets go of you and you stumble back, your tail cunt coming loose from her dick, and falling limply to the forest floor. Full and heavy, it sloshes with impact, a spatter of dryad cum spurting out from it.");
	output("\n\nShe bends down and gives you a gentle kiss before gracefully loping away, her tail flitting hypnotically from side to side as she disappears into the foliage.");
	output("\n\nYou take a single, dizzy step forward, your swollen tail dragging on the ground behind you, then decide that you need to rest a bit before continuing. You rest on a fallen trunk, gathering your thoughts as the world spins around you. You feel bloated, stuffed, and sleepy, and think that a nap might not be so bad.");
	processTime(25);
	IncrementFlag("DRYAD_BANGED_PC");
	IncrementFlag("DRYAD_YOURCUNT");
	pc.orgasm();
	//Use a suitably voluminous stand-in :D
	var pp:PregnancyPlaceholder = getDryadPregContainer();
	pc.loadInCuntTail(pp);
	clearMenu();
	addButton(0,"Next",postCuntTailDryad);
}

public function postCuntTailDryad():void
{
	clearOutput();
	dryadHeader();
	author("Frogapus");
	output("You wake up with a start, glancing around at the clearing. You must have drifted off. You reach behind you, feeling for your tail, and encounter only a mild soreness. It looks like your cunt tail forced you to sleep so that it could digest such a huge meal. It’s slimmed back down, and gives a happy tremor as you inspect it.");
	output("\n\nYou’re not really sure how comfortable you are with your tail hijacking your body like that, but you admit that you feel a lot better. Energized, in fact");
	if(pc.hasCock() || pc.hasVagina()) output(" and extremely sated");
	output(".");
	//[PC gains benefit of rest, orgasm if not genderless, and +10 energy].
	processTime(120+rand(60));
	restHeal();
	IncrementFlag("DRYAD_FUCKED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Dryad Commission – Facefuck/Deepthroat
//[SuckMe]
public function dryadFaceFuckSpecial():void
{
	clearOutput();
	dryadHeader();
	author("Wsan");

	if(flags["DRYAD_FACEFUCKED"] == undefined)
	{
		output("You");
		if(!pc.isCrotchExposed()) output(" pull down your [pc.lowerGarments] and");
		output(" tell her to see if she can get off by sucking your dick. She looks surprised for a moment, but shrugs and sinks to her knees.");
		output("\n\n<i>“I think pretty much anything will get me off like this,”</i> she murmurs, wrapping a hand around your [pc.cock], <i>“especially something that looks this good!”</i>");
	}
	else
	{
		output("\n\nYou");
		if(!pc.isCrotchExposed()) output(" pull down your [pc.lowerGarments] and");
		output(" tell her to suck your dick. She’s all too eager to repeat the experience, immediately sinking to her knees and reaching out a hand for your [pc.cock].");
		output("\n\n<i>“I hope you’re gonna give me as much as last time!”</i>");
	}
	output("\n\nShe gives a lusty moan as she stretches her lips around your [pc.cockHead], dragging herself forward in the mud to slurp at your slit. A bead of precum lands on her tongue and she immediately begins sucking harder, bobbing her head until you decide to take control yourself.");
	if(!pc.isTaur()) output("\n\nYou hold her head in place by her lightly-furred ears, and she quickly finds all she can do is play with the tip of your dick. She looks up at you while she runs her tongue over your slit again and again, pleasure radiating down your cock every time she does.");
	else
	{
		output("\n\n<i>“Uh uh. You only get to play with the tip for now, girl. I’ll tell you when you can take the rest.”</i>");
		output("\n\nShe’s receptive to the dominant assertion, and you tilt your head back while she labors away under your bulk, pleasure radiating from your cock while she runs her tongue over your slit again and again.");
	}
	output("\n\nBetween her gentle sucking and maddening coaxing by way of tonguing your urethra, it’s not long before you’re grunting and struggling not to just claim her throat. You groan out loud.");
	output("\n\n<i>“Nnnfuck gonna cum, don’t stop licking!”</i>");
	
	var cumQ:Number = pc.cumQ();
	if(cumQ < 5000) 
	{
		output("\n\nHer eyes go wide when she feels you orgasm, [pc.cumFlavor] warmth landing on her tongue. She quickly recovers, lashing her tongue across your cockslit ");

		if(cumQ >= 40) output("while she struggles to swallow down your loads before they spill from her lips. She springs a few leaks at the edges of her cheeks, the cum trailing down her face to drip onto her tits, but she does manage to swallow most of it.");
		else 
		{
			output("to gather every single droplet of flavorful [pc.cumNoun].");
			if(cumQ < 10) output(" There’s not much there, but she clearly makes the most of it, noisily gulping around your cock in order to capture every single sperm.");
			else output(" She playfully lets a rivulet escape the corner of her mouth to drip down to her tits, rubbing it into her nipple one-handed.");
		}
	}
	else if(cumQ < 15000) output("\n\nHer eyes go wide when she feels you orgasm, [pc.cumFlavor] warmth landing on her tongue. She quickly recovers, lashing her tongue across your cockslit while she struggles to swallow down your loads before they spill from her lips. She springs a few leaks at the edges of her cheeks, and shortly after can’t keep up with your virile flow. Your jizz spurts out of her mouth, running down her chest and leaving it painted [pc.cumColor].");
	else output("\n\nHer eyes go wide when she feels you orgasm, [pc.cumFlavor] warmth landing on her tongue. She tries to recover and swallow it all down, but she only manages a few cheek-straining gulps before your virile flow sends your jizz cascading down her tits and splattering to the ground, leaving her painted [pc.cumColor].");
	output("\n\nShe’s panting through her nose, her cheeks flushed red with lust as she gulps down the last few spurts of seed. Time to take this up a notch.");

	processTime(5);
	pc.orgasm();

	if(!pc.isTaur()) 
	{
		output("\n\nYou take her head in your grip, running a hand through her hair as you begin to thrust. She willingly lets you slide your cock into her throat, eagerly running her tongue along your dick and looking up at you with her big blue eyes. You grin down at the girl as you pull her down your length,");
	}
	else output("\n\nYou push forwards with your powerful tauric hips, your cock sliding into her throat as she eagerly runs her tongue along it. You sigh with satisfaction as her mouth travels down your length,");
	//Dicksize <= 12:
	if(pc.cocks[0].cLength() <= 12) output(" groaning when her lips kiss the base of your groin.");
	else if(pc.cocks[0].cLength() <= 24) output(" groaning while she struggles to get your full length inside her throat.");
	else output(" groaning while she struggles to get the first two feet of cock inside her throat.");
	if(!pc.isTaur()) output(" You pull her back up and hilt yourself again, ");
	else output(" You slide back slowly and then hilt yourself again, ");
	output("slippery strands of spittle flying from her mouth every time you drag her down your length.");
	output("\n\nHer back half begins to lift itself off the ground, her legs flexing and shaking every time your dick bulges her throat out. She’s definitely getting off to this, and hard. Her sloppy gurgles become wet moans around your cock, your thrusting intensifying until you’re basically just using her mouth as a warm fucktoy.");

	output("\n\nOn a particularly deep thrust,");
	if(!pc.isTaur()) output(" you watch her eyes roll back slightly ");
	else output(" she cries out around your cock ");
	output("as her back half seizes up. She groans, her cock vigorously painting the brush under her a pearlescent white while she vainly thrusts into the air. She continues to shudder while you fuck her gullet, her passage becoming increasingly easier to slide into as she acclimates to having you in her throat. By the time she’s stopped cumming, you’re almost ready to fill her with your spunk.");

	output("\n\n<i>“Get ready to swallow!”</i>");

	output("\n\nShe responds only by");
	if(!pc.isTaur()) output(" looking up at you with half-lidded eyes, ");
	else output(" moaning enthusiastically around your length, ");
	output("waiting patiently until you bless her pliant mouth with a gift of hot jizz.");
	if(!pc.isTaur()) output(" Seeing such a willing expression ");
	else output(" Hearing such a willing expression of desire ");
	output("you can’t help but oblige her,");
	if(!pc.isTaur()) output(" grabbing her flowing red locks and pulling her roughly towards you. ");
	else output(" thrusting as deep as you can before you cum. ");
	output("\n\nYou grunt as the first spurt of spunk");
	if(pc.cocks[0].cLength() <= 12) output(" splatters against the back of her throat, sliding into her stomach as she desperately swallows.");
	else if(pc.cocks[0].cLength() <= 24) output(" sprays down her throat, rapidly jetting into her stomach.");
	else output(" splashes straight into her stomach, ensuring she gets her fill.");
	output(" Your length throbs between her lips, each load you give her accompanied by a lusty moan as it travels down to her stomach.");
	if(!pc.isTaur()) output(" She struggles to keep looking up at you ");
	else output(" She struggles to keep herself in place under you ");
	output("as she cums her brains out, her back half spasmodically twitching as both her male and female organs shiver and pulse in sympathetic orgasm.");

	processTime(5);
	pc.orgasm();

	output("\n\nJust watching her gets you riled up all over again, and by the time she’s stopped cumming you’re hard in her mouth. She gently bobs her head down your length, and you get the message. The slutty taurgirl might be getting off to this more than you are! The gene mods keep her almost perpetually frustrated, and fuck if she isn’t insatiable. You thrust back into the recesses of her pliable throat, jolting her head until she willingly holds it still for you.");
	if(!pc.isTaur()) output(" She looks pretty dazed and her eyes are somewhat unfocused, ");
	else output(" She seems pretty dazed under you after cumming so hard, ");
	output("but given the twitching of her hindquarters she’s <i>more</i> than happy to have her face used like a cocksleeve.");

	output("\n\nYou do so almost casually, raising your head in exultation while the dryad is sloppily dragged up and down your length. It’s not long before you feel another orgasm building up,");
	if(!pc.isTaur()) output(" letting go of her hair ");
	else output(" stopping your hip movements ");
	output("to let her fuck her own face to get your cum. She does so with reckless abandon, sliding up and down your pole until she feels it start to thrum. She positions herself right at your tip so the first cheek-swelling load lands right on her tongue, swallowing greedily before she closes her eyes and smoothly buries your cock back in her throat, her tightness coaxing the rest of your spunk into her stomach. She cums the whole while, each load that bloats her throat matched by a splatter of jizz spewing from her cock hands-free.");

	output("\n\nWhen she’s completely sure you’ve finished, she slides back up and begins licking the head of your cock again. Holy shit, you could be here all day if you let her have her way. Do you force her off or let her take control? If you let her take the lead, you’re pretty sure she’s not going to stop until you’re completely empty...");

	processTime(10);
	pc.orgasm();
	IncrementFlag("DRYAD_FACEFUCKED");
	IncrementFlag("DRYAD_FUCKED");
	//[Force] [Let her]
	clearMenu();
	addButton(0,"Force Off",forceDryadOff);
	addButton(1,"Let Her",letZeSuckingsCommence);
}

//[Force]
public function forceDryadOff():void
{
	clearOutput();
	dryadHeader();
	author("Wsan");
	output("You pop yourself out of her lips before she can get you back to full hardness");
	if(!pc.isCrotchExposed()) output(" and shove your dick back in your [pc.lowerGarment]");
	output(", wagging your finger.");

	output("\n\n<i>“Bad dryad. I have things to do too, you know. I can’t just stand here all day pumping cum into you,”</i> you chide her, <i>“as attractive as that prospect might be.”</i>");
	output("\n\n<i>“Awww,”</i> Her ears droop as she hangs her head, but then she brightens up and smiles. <i>“Thanks anyway! You taste so good, and I’m feeling so much better.”</i>");

	output("\n\nDamnit. You need to get out of here before you get hard again. Her brilliant smile and eager demeanor are making it difficult, but you sigh and turn away, giving her a wave as you depart.");
	output("\n\n<i>“Come back any time, babe!”</i> she calls after you. You have a feeling you’ll see her again out in the jungle.");
	processTime(1);
	pc.lust(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Let her]
public function letZeSuckingsCommence():void
{
	clearOutput();
	dryadHeader();
	author("Wsan");
	output("You shrug. What’s the worst that could happen, she swallows too much of your cum? You look down just in time to see her idly rubbing the blunt head of her own cock, collecting some of her own fresh cum and slathering it on your dick. She takes an experimental lick, then sucks you hard before pulling back.");
	output("\n\n<i>“Oh god,”</i> she pants, grasping your ");
	if(!pc.isTaur()) output("[pc.hips]");
	else output("[pc.legs]");
	output(", <i>“I can’t get enough of this! I’m cumming so fucking hard just from the feeling of it!”</i>");

	output("\n\nShe immediately dives back onto your dick, messily slurping as hard as she can to get more cum out of you. The force is so great you find yourself taking footsteps backwards until you’re backed against a tree,");
	if(!pc.isTaur()) 
	{
		output(" the dryad");
		if(pc.cocks[0].cLength() <= 24) 
		{
			output("’s forehead butting into your [pc.stomach] with every deep suck.");
			if(pc.balls > 1) output(" You feel her tongue slip out and massage the underside of your balls, impressive given how much of you is in her already. She <i>really</i> wants more.");
		}
		else
		{
			output("’s mouth sliding down your length. She can’t reach your base, but what she lacks in capacity she makes up for with enthusiasm, sucking and licking every little vein and bump down your massive cock.");
		}
	}
	else
	{
		output(" your [pc.butt] being pressed into its bark as the dryad sucks you. You feel her hair brush along your underside with every motion,");
		if(pc.cocks[0].cLength() <= 24) output(" her throat handling your full length almost effortlessly, her tongue snaking out to lick at your underside teasingly.");
		else output(" her mouth sliding down your length. She can’t reach your base, but what she lacks in capacity she makes up for with enthusiasm, sucking and licking every little vein and bump down your massive cock.");
	}

	output("\n\nHer warm tongue and wet mouth rove all over your prick, slurping and sucking with all the subtlety of a wanton slut, a mixture of saliva and cum dripping down her chin onto her perky tits. She ceaselessly takes your throbbing dick into her throat, moaning frenziedly all the while. Under such rough treatment it’s not long before you find yourself moaning in orgasm, the swollen head of your cock throbbing in her mouth once more. She greedily hilts herself on your dick and drinks your cum down, swallowing loudly as her arms hold you around the ");
	if(!pc.isTaur()) output("waist");
	else output("belly");
	output(". Her cock erupts under her stomach, hosing down the grass under your feet as she takes her fill of you.");

	processTime(10);
	pc.orgasm();

	output("\n\nShe’s not nearly done with you yet though,");
	if(!pc.isTaur()) output(" and you’re incredulous to find her lifting you, almost pushing you up the tree so that your legs are dangling in the air.");
	else output(" her grip tightening around your midriff to stop you from moving at all.");
	output(" You’re powerless to stop her either, as the sensations of her ravenous mouth wash over your cock trapped in her throat, all but incapacitating you with the pleasure. You can’t help but cry out the next time you cum, her sloppy facefucking earning her another batch of [pc.cumFlavor] jizz right into her stomach. She joins you in blissful, needy moans, the two of you vocalizing a cacophony of noise in the forest matched only by the wet sounds of the dryad hilting you in her over and over.");

	output("\n\nConscious thought is wiped from your minds, two beasts in heat rutting in the wild, one dominantly taken by the other as a personal cum-pump. You buck and writhe in her grip, panting while an almost continuous stream of spunk is sucked straight from your [pc.balls]. Helpless to resist, you cum into her hungry mouth one orgasm after another. You have no idea how much time passes, unthinkingly ejaculating until, finally, you can give her no more. Your [pc.cock] flexes one last time in her throat as her eyes roll back, her giant underslung cock erupting once more, painting what little undrenched brush there was a pearly white. You sigh and go limp, body battered and mind tired by the fuck-frenzy ordeal the horny taur’s put you through.");
	
	processTime(10);
	var cumQ:Number = pc.cumQ();
	pc.orgasm();

	if(!pc.isTaur()) output("\n\nThe dryad slowly lowers you, your legs collapsing out from under you the moment you’re on the ground.");
	else output("\n\nThe dryad slowly slides off your cock, your legs collapsing the moment she’s not under you holding you up.");
	output(" You’re a fucking mess, your eyes half-closed on the verge of unconsciousness and your mouth hanging open, drool running down your face. The dryad is in a similar condition, panting hard and dripping cum from both her cock and her mouth.");
	if(cumQ < 30000) {}
	else if(cumQ < 75000) output(" Her equine half’s belly is sagging slightly, full of the virile spunk you’ve pumped into her.");
	else output(" Her equine half’s belly is sagging halfway to the ground, absolutely full of the virile spunk you’ve pumped into her.");
	output(" She looks down at you and giggles.");

	output("\n\n<i>“Sorry babe. I guess I got just a little bit carried away, but you just tasted sooo good,”</i> She smiles, rubbing her");
	if(cumQ < 15000) output(" still-flat");
	else if(cumQ < 30000) output(" slightly swollen");
	else if(cumQ < 75000) output(" cum-stuffed");
	else output(" prodigiously cum-stuffed");
	output(" tummy. <i>“Thanks so much! If you’re always this delicious, you can spray your spunk into my mouth any time you want. If I’d cum any harder, I’d probably have blacked out!”</i>");

	output("\n\nShe bends down and kisses you on the cheek before prancing off with a new spring in her step, her cute little tail flitting from side to side.");
	if(cumQ >= 75000) output(" She has a little bit of trouble maneuvering when she’s so full of your spunk, though, and almost stumbles into a bush before recovering.");
	output(" Your eyes slide shut, the roughness of her taking its toll on you. You lapse almost immediately into a dream of the dryad, cheerfully giggling as she does whatever she wants with your body.");

	//30 minutes pass
	processTime(5);
	clearMenu();
	addButton(0,"Next",dryadSuperCumSuckEpilogue);
}

public function dryadSuperCumSuckEpilogue():void
{
	clearOutput();
	dryadHeader();
	author("Wsan");
	output("You’re roused from your stupor by the call of a wild animal somewhere in the jungle. Probably best to get a move on, even if you’re still slightly sore from the horny taur’s treatment.");
	if(!pc.isCrotchExposed()) output(" You gingerly place your dick back in your [pc.lowerGarment] and get up to continue your journey.");
	else output(" You gingerly get up to continue your journey.");
	processTime(25);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Dryad Anal
//Anal (Requires >= 10" length)
public function dryadAnalFunsies():void
{
	clearOutput();
	dryadHeader();
	author("Wsan");
	var pp:PregnancyPlaceholder = getDryadPregContainer();
	var x:int = pc.cockThatFits(1400);
	if(x < 0) x = pc.smallestCockIndex();
	if(pc.cocks[x].cLength() < 12) x = pc.biggestCockIndex();

	//First time
	if(flags["DRYAD_ANALED"] == undefined)
	{
		output("You tell her you can get her off for sure, but she’s going to have to offer up her ass. She looks surprised at first, then somewhat nervous.");
		output("\n\n<i>“Um, okay. I’ve never really done butt stuff before though... not with my own ass, anyway. As long as you can get me off! Shouldn’t be hard");
		if(pc.cocks[x].cLength() >= 16) output(", especially with a cock that size!”</i>");
		else output(".”</i>");
		output("\n\nShe trots over to a tree and places her hands against it, bracing herself while she looks back at you, biting her lip.");
		output("\n\n<i>“I know I said I haven’t really done much with my butt,”</i> she says as you ");
		if(pc.isTaur()) output("trot");
		else output("walk");
		output(" up to her, <i>“but that doesn’t mean I want you to be gentle, okay?”</i>");
		output("\n\nYou nod idly, inspecting her impressive haunches.");
	}
	//Repeat
	else
	{
		output("You tell her you can get her off for sure, but she’s going to have to offer up her ass. She looks surprised at first, then nods eagerly, smiling.");
		output("\n\n<i>“As long as you promise to fuck me as hard as you did last time, cutie.”</i>");
		output("\n\nShe trots over to a tree and places her hands against it, bracing herself while she looks back at you, biting her lip.");
		output("\n\n<i>“Is this gonna be a regular thing,”</i> she inquires as you ");
		if(pc.isTaur()) output("trot");
		else output("walk");
		output(" up to her, <i>“are you gonna try and turn me into an anal slut?”</i>");
		output("\n\n<i>“Maybe,”</i> you grin, looking down at her fluffy doe-tail and ass.");
	}
	output("\n\nShe’s got a hell of a butt on her, that’s for sure. You palm her jiggly buttcheeks and spread them, enticing her puffy donut ring to wink at you. Her tail flits from side to side, its owner clearly antsy for you to start fucking her. Well, too bad for her.");
	if(flags["DRYAD_ANALED"] == undefined) output(" You at least need to make sure she’ll be able to take you, given her apparent inexperience.");
	else output(" You feel like teasing her a bit before you get to the main event.");

	output("\n\nYou slip one finger into her asshole, encountering no resistance whatsoever. She <i>is</i> tight, though - her walls are gripping your finger intensely, arresting your progress. She gasps a little at the intrusion, trying to relax herself so that you can push further in. She groans when you slide it all the way in, probing the first few inches of her ass. Wiggling your digit around, it seems like that while she’s tight she’s also very stretchy. You experimentally slip a second finger in, then a third. The taurslut moans in response, and you pull your fingers free, her puffy hole winking at you.");

	output("\n\n<i>“Are you gonna stop teasing me now?”</i>");

	output("\n\nThe dryad looks back at you, clearly a little annoyed you haven’t started fucking. You wave her off and step forward, preparing to assuage the needy dryad’s lust. Needing no further encouragement, you ");
	if(pc.isTaur()) output("mount");
	else output("grab");
	output(" the horny taur and align your [pc.cock] with her asshole. You delicately slide your [pc.cockHead] across her protruding ring and let it settle for a moment before slowly pushing in.");
	if(pc.cocks[x].cLength() >= 19) output(" There’s some resistance from her hole owing to your size, but as you incessantly push forward it eventually gives up, caving inwards and swallowing the first few inches of your cock.");
	output(" Her hole eagerly swallows the first few inches of your cock, caving inwards.");

	output("\n\n<i>“Fffuuuck,”</i> she groans, her erect cock dripping seed below her, <i>“I feel so full...”</i>");

	output("\n\n<i>“That’s the idea,”</i> you quip from above her, slowly rocking your [pc.hips] to get your cock further into the warmth of her guts while she moans and shivers underneath you.");
	
	var cumQ:Number = pc.cumQ();
	
	if(pc.cocks[x].cLength() < 40) 
	{
		output("\n\nBy the time you’re halfway in, she’s panting hard against the tree, her fingers tightly gripping its bark. She whines quietly when it gets to three quarters, laying her forehead against the tree and taking deep breaths. You give her a second to acclimatize, but she <i>did</i> say not to take it easy, so you’re perhaps a little less merciful than you could be.");
		output("\n\nYou slowly push forward, your passage being eased by the precum ");
		if(cumQ >= 15000) output("spraying");
		else output("dribbling");
		output(" from your cock into her. When you finally hilt yourself, you sigh with satisfaction and look down. She gives a shuddering sigh and her upper half slackens, finally bringing her head back up and unclenching her hands.");
	}
	else 
	{
		output("\n\nThere’s no way you can fit your entire length in, but you slowly inch as much of it as you can into her. She stretches and stretches, her asshole slowly but surely swallowing your massive dick. She whines, groans, and clutches desperately at the tree in front of her as you slide further into her deepest recesses, your cock rearranging her insides to make room.");
		output("\n\nYou give her a second to get used to your massive size, but she <i>did</i> say not to take it easy on her, so you’re perhaps a little less merciful than you could be. You slowly push forward, eliciting mindless grunts and groans of lust from the dryad’s lips. When your progress is finally arrested by the limits of her body, you give a sigh of satisfaction and look down at how much of yourself you’ve hilted in her. She gives a shuddering sigh and her upper half slackens, bringing her head back up and unclenching her hands.");
	}
	pc.cockChange();

	output("\n\n<i>“Oh, god... it won’t stop dripping,”</i> she pants, staying still on the end of your cock.");
	output("\n\nYou realize she’s talking about her own dick. You must be rubbing across her prostate something fierce like this, and grin eagerly at the realization. She cries out when you pull back slowly, shaking and gasping as your cock rubs her in just the right way. The moment you thrust back in she gives a strangled gasp, hugging the tree while her cock splatters its leavings across her white-furred underside.");
	output("\n\n<i>“Gah! Ah, f-fuck,”</i> she pants, unconsciously thrusting in response to her cock cumming, only driving herself further into the throes of anal orgasm.");
	output("\n\nYou’re content to let her push back, her asshole stretching itself back and forth over your length while she shivers helplessly, constricting your cock with every shake. You can’t help but smile watching the dryad lustfully lose herself, shamelessly fucking her own ass on the end of your dick to eke out every little bit of moaning orgasm she can.");
	output("\n\nWhen she finally slows, her back legs shaking too much to keep going, you take back over and keep riding her through her ejaculations. Each thrust inward is a lewd moan and a spray of jizz from her pent-up cock, each pull outward is a sigh of emptiness until you cave her ring back in. You continue fucking her somewhat slowly for a few minutes, by which point her voice has become more sweetly layered with pleasure instead of effort.");
	output("\n\nTaking that as a sign to finally give her what she asked for, you pull back and begin fucking her in earnest, your cock rapidly plunging in and out of her asshole. Her warm walls grip and stroke you all throughout her insides, the intense warmth of her body heat driving you to sweat with the effort of pinning her to the tree.");
	output("\n\nShe suffers countless more panting orgasms being roughly shoved up against the tree with a fat cock wedged in her asshole, her ass tightening up and spasming around your [pc.cock] each time. Spurred on by her slutty reactions, you slowly build and build to your own peak of pleasure until holding yourself back is too much.");
	output("\n\nYou push forward,");
	if(pc.cocks[x].cLength() < 40) output(" hilting yourself against the dryad’s plump butt");
	else output(" filling the dryad’s plump butt with as much of your cock as you can");
	output(" as you pour all of your spunk into her guts with an animalistic grunt. She screams half in lust and half in utter satisfaction, shaking like a leaf as she noisily cums from both her cock and cunt, tightly gripping the tree so as to not fall over.");
	output("\n\nYou give her a few last pumps, making sure you’ve truly filled her ass well and good. You pull out slowly, and the moment your [pc.cockHead] slips past her abused ring she collapses to the ground, moaning and drooling jizz from her asshole.");
	if(cumQ >= 50000) output(" Her tauric stomach is swollen with your seed, her body branded by your hyper-virility.");
	output("\n\n<i>“Hey,”</i> you shrug, <i>“you did say not to be gentle.”</i>");
	output("\n\nA semi-conscious moan is her only reply as she flops onto her side, breathing deeply. In a few moments her breathing slows, and then she’s asleep. You shake your head in amusement and prepare to move on. You’d wake her up to avoid her being taken advantage of by the natives, but you’re pretty confident she can handle herself, and frankly she’d probably be grateful to get off again.");
	IncrementFlag("DRYAD_FUCKED");
	IncrementFlag("DRYAD_ANALED");
	processTime(16);
	pp.loadInAss(pc);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function dryadDrain():void
{
	clearOutput();
	dryadHeader();
	author("Wsan");

	var pp:PregnancyPlaceholder = getDryadPregContainer();
	
	output("<i>“I think you’ve proven you need some help to </i>really<i> drain those fat balls of yours, don’t you?”</i> you ask the excited dryad, ");
	if(!pc.isCrotchExposed()) output(" stripping off your [pc.clothes] and ");
	output("kneeling before her. <i>“How about you empty them inside me a few times?”</i>");
	output("\n\n<i>“Oh fuck, now I </i>really<i> need to cum!”</i> she cries, her need evident in the way the head of her cock is flaring widely. Clearly intent on taking you up on your offer, she pushes her cockhead against your lips so fiercely it pushes you back, before you part your lips slightly to take her in. She instantly takes advantage, deftly thrusting her hips to get her pre-drooling cock into your cheek, bulging it out with her flare.");
	output("\n\n<i>“Oh, yessss,”</i> she groans, relishing the difference between the temperature in Mhen’ga’s outdoors and your mouth. <i>“Gonna - nng - cum! Take it deeper!”</i>");
	output("\n\nPawing insistently at the ground, she presses forward until your neck is craned upwards beneath her, and she’s free to fuck downwards. You can feel the urgency in her movements, her first desperate thrust good enough to get it halfway down your overtaxed throat, pinning you beneath her. Her second and third stretch your lips wide around the thick, bestial base of her cock, and then she grunts in blessed release.");
	output("\n\nFeeling a little like a sex toy stretched around its owner, you can’t help but notice the tantalizingly huge, pulsing balls hanging behind her throbbing cock. If you just shakily reach out a bit while she’s fucking your throat...");
	output("\n\n<i>“Oh!”</i> she cries out at your touch, half in surprise and half in lust. <i>“Oh, god! Mmmmn! Nnnnn!”</i>");
	output("\n\nWith one hand on either giant ball - each one is easily as big as your head - you softly massage them, slowly rubbing them in a circular motion, gently coaxing her as best you can into cumming her fucking brains out right into your stomach. It works. You can feel her entire body shaking like a leaf in a storm, and the flow of heavy, warm liquid splattering into your tummy redoubles. Her voice comes out only in low, bestial grunts and groans of animal lust, representative of the euphoria of blissful release.");
	output("\n\nYour throat is wrapped so tightly around her swollen cock that you can actually feel the rapid, almost desperate pumping of her cum flow down her shaft, each enormous load punctuated by her cockhead flaring wide. By some miracle, she manages to summon enough willpower to pull herself from your face before you drown or pass out. A veritable torrent of seed follows her sloppy exit, packed too tightly with nowhere else to go.");
	output("\n\n<i>“Oohhh, wow,”</i> she giggles nervously, pawing at the ground and eyeing your fucked-full stomach needily while her sperm splatters down your [pc.chest]. <i>“It looks like I made you pregnant! You, um, you can go again right? Please, I don’t think I can hold myself back!”</i>");
	output("\n\nWhere should you tell her to drain herself?");
	
	IncrementFlag("DRYAD_FUCKED");
	IncrementFlag("DRYAD_BLEWHER");
	processTime(10);
	pc.loadInMouth(pp);
	pc.lust(100);
	clearMenu();
	
	//disable for taurs
	if(!pc.isTaur()) addButton(0,"Throat",dryadDrainThroat);
	else addDisabledButton(0,"Throat","Throat","Taurs can’t do this yet!");
	if(!pc.isTaur()) addButton(1,"Ass",dryadDrainAss);
	else addDisabledButton(1,"Ass","Ass","Taurs can’t do this yet!");
	if(pc.hasVagina()) addButton(2,"Pussy",dryadDrainPussy);
	else addDisabledButton(2,"Pussy","Pussy","You need a vagina for this.");
}

public function dryadDrainThroat():void
{
	clearOutput();
	dryadHeader();
	author("Wsan");

	var pp:PregnancyPlaceholder = getDryadPregContainer();
	
	output("With the dryad’s jizz still dripping from between your [pc.lips], it’s all you can do to just point at your mouth. She looks truly ecstatic with your choice.");
	output("\n\n<i>“Okay! It might be a little hard to get in when I’m already flared, but I’m sure you can do it! I </i>really<i> need this...”</i>");
	output("\n\nShe’s barely gotten the words out before she’s up in your face, pushing insistently into your lips and forcing them into a pursed shape with the fat head of her cock. She’s right - this <i>is</i> a lot harder. It takes a few seconds of strained, desperate grunting and pushing on her part before she finally makes it into your mouth with a gasp of relief, then unceremoniously fucks it down your gullet.");
	output("\n\nWithin seconds, she’s pumping your throat like you’re a two-chit whore. The cum from her earlier effort lubricates her passage, enabling her to glide in with such ease that her fat, hanging balls are soon loudly slapping against your chin. Sweat droplets fly from her furred underside as her moans increase in volume, her desperate need inspiring such eagerness in her that you soon find yourself getting pushed back from the strength of her thrusting. It’s easy to forget how forceful such a pretty girl can be when she has her cock almost in your stomach and needs to cum <i>right now</i>.");
	output("\n\nSensing your inability to keep yourself steady, the dryad grunts in frustration and angles herself deeper, beginning to fuck you downwards into the ground, slowly bringing her hips down on top of you. Before you know it, you’re pinned on the forest floor of Mhen’ga, the dryad using the power of her hindlegs and hips to repeatedly cosy the base of her shaft right up against your pretty, cum-stained lips.");
	output("\n\n<i>“Oohhh, fuck, yes,”</i> she pants furiously, though you can hardly hear her from beneath her shaking flank. <i>“Yes. Yes. Yes. Yes! Yes! Ffffffuck! YES! YES! YESSS!”</i>");
	output("\n\nWith a triumphant, primal scream she <i>slams</i> her swollen cock to the hilt and cums so fucking hard you can actually hear the gout of jizz splatter into the pooling seed she left in your stomach not even a few minutes ago. Helpless to do anything about the deertaur’s shaking body lying atop you and with the pleasure of her own orgasm immobilizing her, you’re forced to take every last drop of equine semen she has to give you.");
	output("\n\nYou can make out animal noises of pleasure issuing from the dryad’s lips with every thick, forceful ejaculation into your overtaxed stomach, but soon you’re noticing something else: her smell. How did you never notice this before? The musk down here, buried under her groin, is so intense it’s making your head spin. It’s somehow the most attractive thing to ever grace your nostrils, and you find yourself bringing your hands up to press down on her flank, pushing her against your own face in pursuit of getting closer to the source.");
	output("\n\n<i>“Oh, good [pc.boyGirl],”</i> the dryad croons, wetly humping your face just once more and letting some seed coat your throat. <i>“If you stay riiight there I think I can give you another one!”</i>");
	output("\n\nYou’re not even really paying attention to the words she’s saying, but you hear the object of your desire talking and obediently nod as best you can with her cock buried in your throat. Pupils dilated, all you can think of is this delightful scent. You lightly run your hands through the plush fur of her flanks, stroking and rubbing her haunches with adoration.");
	output("\n\n<i>“Oh my gosh, that actually feels really nice,”</i> the dryad says, looking back at you. <i>“You can keep doing that!”</i>");
	output("\n\nYou’re only too happy to lose yourself in her soft, brushy fur while she hums in contentment, regaining her erection’s stiffness all the while. It probably hasn’t even been a minute by the time she’s ready and raring to go all over again, but she lets you continue scratching a particularly sweet spot until she sighs in satisfaction and draws her hips upwards.");
	output("\n\n<i>“Mmmh okay babe, I love the stroking but I just can’t get enough of this throat,”</i> she purrs, slowly sinking back into your depths. <i>“Oooohhh... going slower every once in a while might not be too bad...”</i>");
	output("\n\nHer most immediate needs already addressed, she’s clearly content to draw this one out. That’s fine by you, perfectly willing to lie there and let her softly plant her bulging balls on your chin while you rub her legs up and down. Something about her smell just makes you want to rub and cuddle this delightful creature all day, and you pay no heed to her merciless abuse of your throat. She slides in as deep as she can, luxuriating in facefucking you with the final few inches of her incredibly fat base. With arms crossed and eyes closed, she sighs with pleasure every time she humps your face into the ground with a fierce buck of her hips.");
	output("\n\nYou can feel her flare deep inside you, stretching the recesses of your throat and drizzling droplets of seed into the veritable pool of spunk that’s accumulated in your swollen tummy.");
	if (pc.biggestTitSize() > 3) output(" It protrudes so far that your [pc.breasts] splay to the side, pushed apart by your massively cum-filled stomach.");
	output(" Your body jiggles every time she presses inside you, hooves spread on either side of your torso and angling herself deeply downwards.");
	output("\n\n<i>“This is... heaven...”</i> she sighs dreamily, and you feel yet another rope of heavy seed join her deposit inside you. <i>“Maybe just one more after this...”</i>");
	output("\n\nShe continues her slow, rhythmic pace of fucking your throat, leaking and drooling into every bit of your recesses until you feel her begin to pick up the pace again. You desperately hang onto her sweaty fur as she begins pounding your face and grunting, and she blessedly slows down when she begins to cum. She’s a lot quieter about it now, moaning and sighing in bliss instead of screaming in needy release. You’re ecstatic that she’s really, truly getting her rocks off, something she probably rarely - if ever - gets to do in the wilderness.");
	output("\n\n<i>“Oh, I can’t stoooop,”</i> she groans, and once more you find her nuts slapping against your chin...");
	output("\n\n<b>Two hours later</b>");
	output("\n\nYou’re a mess. After continually promising it would just be <i>“one more time”</i>, the dryad ended up busting something like nine or ten nuts right into your stomach. At some point you got so overfull that your tortured tummy couldn’t take it any more, and the rest of her jizz either spurted from around her cock and all over her pulsing balls, or sprayed from your nose down your face. You’re not even particularly sure which - maybe both.");
	output("\n\nEither way, you’re a fucking mess. Your top half is absolutely coated in her seed and your stomach bulges outward to the point it looks like you were on the receiving end of a hyperpornstar which, you suppose, isn’t that far from the truth. You’re not really in the mind to think about it right now. The dryad, on the other hand, looks beautifully refreshed and sprightly. She stretches her hindlegs and smiles down at your insensate self.");
	output("\n\n<i>“My gosh, my hips are a little sore!”</i> she says with a slightly embarrassed giggle, sweat-covered cheeks reddening a little. <i>“I might have gotten a little carried away there. But you’re so nice! Thank you!”</i>");
	output("\n\nShe leans all the way down with her front half once more just to give you a gentle kiss on your cum-smeared cheek, then stands.");
	output("\n\n<i>“Oh, this is the best I’ve ever felt!”</i> she thrills, arms outstretched to the forest before her. <i>“Wow! This is great! I’ll come see you again soon, okay babe? Stay safe!”</i>");
	output("\n\nShe prances off into the overgrowth, humming happily all the while. Well, at least she’s happy. You guess anyone who got to cum what feels like a barrelful right into your stomach probably would be. You gingerly raise a hand from the ground and place it on your growling tummy, inspecting the evidence. Maybe you’ll take a little time to rest this off before you move on.");

	processTime(125);
	if (pc.isTreated() && pc.hasVagina() && pc.isBimbo()) pc.orgasm();
	else pc.lust(200);
	pc.loadInMouth(pp);
	pc.loadInMouth(pp);
	pc.loadInMouth(pp);
	pc.loadInMouth(pp);
	IncrementFlag("DRYAD_DRAINED");
	IncrementFlag("DRYAD_BLEWHER");
	IncrementFlag("DRYAD_BLEWHER");
	IncrementFlag("DRYAD_BLEWHER");
	IncrementFlag("DRYAD_BLEWHER");
	clearMenu();
	addButton(0,"Next",dryadDrainThroatEpilogue);
}

public function dryadDrainThroatEpilogue():void
{
	clearOutput();
	dryadHeader();
	author("Wsan");
	
	output("You stand and dust yourself off. You can still <i>feel</i> her inside you, marked inside and outside by her touch and her scent, but at least you can walk. Turning away from the site of your tryst, you set back on the path.");
	if (pc.isTreated() && pc.hasVagina() && pc.isBimbo()) output("\n\nThanks to the Treatment increasing oral sensitivity, you came your fucking brains out with the way she used her big, fat, veiny, <i>throbbing</i>... you shake your head a little bit, trying not to grin. At least you’ve got a pretty clear head for now!");
	else output("\n\nYou try to ignore the fact you are now <i>extremely</i> pent up. Well, there’s no-one around...");
	
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
	
public function dryadDrainAss():void
{
	clearOutput();
	dryadHeader();
	author("Wsan");

	var pp:PregnancyPlaceholder = getDryadPregContainer();
	
	output("Through somewhat watering eyes, you can see she really can’t. If anything, her fully erect cock is even bigger than it was before she gave you the facefuck of your life, throbbing angrily and spurting seed over your [pc.chest] and the ground alike. You give her a nod and gingerly lie back, raising your hips off the ground. It’s not very subtle, but neither is the dryad.");
	output("\n\nShe instantly repositions herself, her fat unwieldy cock slapping your");
	if (pc.hasCock() && pc.hasVagina()) output(" own and sliding down your lubricated lips to find its real target");
	if (pc.hasCock() && (!pc.hasVagina())) output(" own and sliding down your half-hard shaft to find its real target");
	if ((!pc.hasCock()) && pc.hasVagina()) output(" lubricated pussylips and sliding down to find its real target");
	output(". Your [pc.asshole] is ");
	if (pc.analCapacity() < 300) output("suddenly assaulted by overwhelming pressure, and with a groan of effort the dryad forces it to cave inwards, gaining access to your innards with a fierce buck of her hips");
	else output("ready and accepting, the practiced hole latching on to the dryad’s cock and drawing her inside as she bucks her hips.");
	
	pc.buttChange(pp.cockVolume(0));
	
	output("\n\n<i>“Uhh, god,”</i> she grunts forcefully, looking down at you lying between her legs. <i>“Oh, that feels so good...”</i>");
	output("\n\nYou reply by way of a breathless moan of pleasure. <i>Fuck</i>, she’s a big girl. It feels like her swollen horsecock is stretching you apart. Your asshole just wasn’t built to take this kind of punishment, and that only makes it all the sweeter to indulge in. You moan like a whore as she fucks herself deeper with cute little grunts of effort, the imprint of her flare eventually appearing against your [pc.stomach].");
	output("\n\n<i>“Ooooh, yes,”</i> she pants, taking a moment to close her eyes and just enjoy being fully sheathed inside you. You can see her shuddering in pleasure above you, her cock flexing inside your insides. <i>“Oh, I’m going to fill you up until you pop...”</i>");
	output("\n\nYou can believe it. ");
	if(pc.balls > 0) output("With your [pc.balls] resting atop the massive surface of her shaft, they get a nice rubbing from below as she slowly withdraws before pushing back in.");
	output("Void, it’s like having an iron rod in your spine straightening you out. If she took off running right now, you’d probably be carried along underneath her like nothing more than a portable fuckhole. The thought makes you grasp at her sweaty fur and push yourself into the ground, giving you some meagre ability to resist her ever-increasing pace of thrusting.");
	output("\n\nIt’s hard to ignore how she’s making you feel as you cry out beneath her in time to the bucks of her hips, and you realize you’re going to cum before she does. ");
	if (pc.hasCock() && pc.hasVagina()) 
	{
		output(" Your [pc.pussy] contracts <i>hard</i>, squeezing at nothing, wetness running down your [pc.thighs]. Your [pc.cocks], though, flex");
		if(pc.cockTotal() == 1) output("es"); 
		output(" and strain");
		if(pc.cockTotal() == 1) output("s");
		output(" only to go through all the motions without actual ejaculation. With her fat cock so deep inside you and pressing down on parts it shouldn’t, no cum actually escapes you");
	}
	if (pc.hasCock() && (!pc.hasVagina())) 
	{
		output("Your [pc.cocks], though, flex");
		if(pc.cockTotal() == 1) output("es"); 
		output(" and strain");
		if(pc.cockTotal() == 1) output("s");
		output(" only to go through all the motions without actual ejaculation. With her fat cock so deep inside you and pressing down on parts it shouldn’t, no cum actually escapes you");
	}
	if ((!pc.hasCock()) && pc.hasVagina()) output(" Your [pc.pussy] contracts <i>hard</i>, squeezing at nothing, wetness running down your [pc.thighs]");
	output(". You pant, gasp, and moan as your hips lift off the ground in an attempt to find more leverage, but the dryad’s cock brings you back down to earth on her next thrust.");
	output("\n\n<i>“Did you cum?”</i> she squeals cheerfully, fucking you downwards without a care in the world. <i>“You tightened up so much around me! That makes me so happy!”</i>");
	output("\n\nShe’s not far from following suit, you think. It doesn’t take much of a detective to intuit that the way she’s fucking slamming her balls off your ass with increasingly loud moans of horniness means she’s on the edge of release. Right when she seems to be about to let go, her legs buckle in a moment of laxity. She catches herself before colliding with you and manages to slow her descent, but the end result is the same: you now have a dryad lying atop you, pinning you down while she cums inside your asshole.");
	output("\n\n<i>“I’m cumming,”</i> she announces, dazed. <i>“So fucking haaaahhhnnnnn-uhhh!”</i>");
	output("\n\nYou buck once underneath her, a massive load of spunk jetting right into your innermost recesses. With her on top of you, it’s all you can do to not get a mouthful of the sweaty, shaking fur of her underside while she empties her balls inside you with gusto.");
	output("\n\n<i>“Nnnnngh!”</i> she groans, hips jerking wildly. You can feel her fat testes slapping against your butt while she works her hind muscles, instinctively getting as deep as she possibly can inside her immobile cumdump.");
	output("\n\n<i>“Fuh-huuuck,”</i> she groans, falling forward onto her hands to support herself. <i>“Ugh! Unnh! Grrh!”</i>");
	output("\n\nWith each exclamation you can feel her entire body tightening as she releases her pent-up pressure, wet splurts of jizz filling your guts. You can hear a dull ripping sound, and realize she’s pulling grass out by its roots with clenched fists, driven on by the sensation of release. When her outgoing flow eventually begins to taper off, you find yourself affectionately running your hands through the brushy fur of her body, stroking and rubbing her in acknowledgement of her performance.");
	output("\n\n<i>“Ohhh, jeez...”</i> she finally sighs at length. <i>“That was intense... mmn. Sorry about lying on you, babe, but you just felt so good.”</i>");
	output("\n\nShe makes no move to get off you, though, and after a few seconds you realize you can feel her getting hard inside you all over again, still balls-deep in your asshole.");
	output("\n\n<i>“I promise I’ll go slower this time,”</i> she says sweetly, beginning to rock backwards.");
	output("\n\nShe doesn’t.");
	output("\n\n<b>2 hours later</b>");
	output("\n\nYour numbed legs fall to the ground as the dryad finally lifts herself off your prone body, sighing in satisfaction. Her cock messily slips from your plundered asshole, jizz splurging onto the ground upon no longer being trapped inside by her flare. Her hanging prick twitches once or twice and spurts sticky cum all over your stomach and chest while she stretches, kicking her hindlegs once or twice.");
	output("\n\n<i>“Mmm, thanks babe,”</i> she says with a smile, leaning down to give you a warm kiss on the cheek. <i>“You helped me out a lot today. I wish I could start every day like that! Come see me again really soon, okay? Bye!”</i>");
	output("\n\nShe prances off into the overgrowth, humming happily all the while. Well, at least she’s happy. The moment you open your mouth to take a deep breath, a gout of creamy spunk spouts forth from your lips onto the ground. You spend a couple of seconds with mouth wide, emptying yourself of jizz fucked just a bit too far into you, before lying back down on your side with a moan. You gingerly raise a hand from the ground and place it on your growling tummy. Maybe you’ll take a little time to rest this off before you move on.");

	processTime(130);
	pc.orgasm();
	pc.loadInAss(pp);
	pc.loadInAss(pp);
	pc.loadInAss(pp);
	pc.loadInAss(pp);
	pc.loadInMouth(pp);
	IncrementFlag("DRYAD_DRAINED");
	IncrementFlag("DRYAD_ANALEDYOU");
	IncrementFlag("DRYAD_ANALEDYOU");
	IncrementFlag("DRYAD_ANALEDYOU");
	IncrementFlag("DRYAD_ANALEDYOU");
	IncrementFlag("DRYAD_BLEWHER");
	clearMenu();
	addButton(0,"Next",dryadDrainAssEpilogue);
}

public function dryadDrainAssEpilogue():void
{
	clearOutput();
	dryadHeader();
	author("Wsan");
	
	output("You stand and dust yourself off. You can still <i>feel</i> her inside you, marked inside and outside by her touch and her scent, but at least you can walk. Turning away from the site of your tryst, you set back on the path.");
	
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function dryadDrainPussy():void
{
	clearOutput();
	dryadHeader();
	author("Wsan");

	var pp:PregnancyPlaceholder = getDryadPregContainer();
	var x:int = pc.findEmptyPregnancySlot(1);
	if(x < 0) x = rand(pc.totalVaginas());
	
	if(!pc.isTaur())
	{
		output("Your suspicions are confirmed when not even a moment later her massive flare is pushing at your entrance, ");
		if (pc.smallestVaginalCapacity() < 300) output("your lips being pulled inwards by the sheer force as she forces herself balls-deep with a pleasured grunt");
		else("your wetness allowing her to comfortably sheathe her giant cock balls-deep in the warmth of your stretchy cunt.");
		
		pc.cuntChange(x, pp.cockVolume(0));
		
		output("\n\n<i>“Oh fuck, your pussy is sooo good,”</i> she moans, beginning to roll her hips into you. <i>“Hnnnh, fuck...”</i>");
		output("\n\nShe pulls back and rams back into you, the thickness of her rock-hard shaft clearly visible between your hips as she thrusts. Your back instinctively arches when you feel the flesh of her cockhead pressing up against your womb, only to disappear then reappear again to reacquaint itself not even a second later. You can feel her cock flaring inside you, spreading your walls wide as she teeters on the edge of a massive orgasm.");
		output("\n\n<i>“Hhhh-nnngh! Hnnh!”</i> she haltingly groans, her thrusts becoming slower and deeper until you feel a massive spurt of dryad spunk right into your womb. <i>“Ooohhhh, </i>fuck<i>. Fuuuck...”</i>");
		output("\n\nShe barely moves at all during her huge, body-shaking orgasm, just using little bucks of her hips every time a new rope of seed spews between your stretched pussy walls. Finally, the sensation of release gets to be too much for the centaur girl, and she falls to her knees on top of you. From there, she slowly sits down, forcing you to lie face-down on the ground while she pumps you full of warm cum.");
		output("\n\n<i>“Ohh, yes,”</i> the dryad moans, eyes closed in bliss. <i>“Oh, you’re so good...”</i>");
		output("\n\nYou lie on the soft grass and take it, load after load of jizz filling you to capacity and more. The excess begins to spurt from your tightly-wrapped pussy around the dryad’s cock, staining your legs and the earth under you. You can’t help but suffer a quiet, muffled orgasm underneath her while she fills you up, moaning in satisfaction all the while. Your [pc.legs] would be shaking if you could move them.");
		output("\n\nWhen she finally finishes her long, drawn-out orgasm inside the depths of your cunt, she moans at length but makes no sign of moving. She repositions herself slightly atop you, and you can feel her thick flare smooching your cervix.");
		output("\n\n<i>“Oh, that was amaaazing,”</i> she sighs, evidently pleased with your efforts of being an immobile spunk receptacle. <i>“I bet it feels even better the next time around!”</i>");
		output("\n\nYou realize with muted surprise that you can feel her twitching and hardening while stuffed deep in your pussy, and soon she withdraws herself from your gaped cunt. Her seed surges from your abused fuckhole, pouring outwards onto the fertile ground below.");
		output("\n\n<i>“Awww, I’m gonna fill that tight little pussy </i>right<i> back up,”</i> the dryad declares smugly, holding her hips above you, poised to fuck you full. <i>“Don’t you worry!”</i>");
		output("\n\nTrue to her word, she displays remarkable restraint in waiting for the flow of her expended spunk to roll from your cunt before slowly negotiating her entrance back in. The two of you moan in a sweet, lurid duet as her flare gradually stretches your walls apart again, sliding all the way up to your womb to nuzzle it.");
		output("\n\n<i>“I think your pussy and my cock make a great match,”</i> the dryad pants, losing more of her composure by the second. <i>“Gh- gonna fuck it ‘til you c-cum your brains out! Nnnn!”</i>");
		output("\n\nYou can feel the precum leaking from the tip of her swollen shaft as her balls slap off your [pc.ass], and quickly discover she’s right. It feels like her fat, veiny cock is about to pop out of your mouth at any second, your teeth grit and eyes rolling back in pleasure while she bucks her hips like a wild animal. She forcefully brings you to a rough, shuddering full-body orgasm that has you panting loudly beneath her, ");
		if (pc.hasCock()) output("[pc.cock] spurting up your stomach and ");
		output("pussy desperately clenching down down on the dryad’s pistoning member to no avail.");
		output("\n\nYour body’s instinctive attempt to keep her inside you while you cum only results in increasing the sensitivity for both of you, your contracting walls wrapping the pulsating shaft as tightly as they can. With all the ridges, veins and bumps along her cock it’s all you can do to put up a token resistance against her words coming true, but it’s no use. The dryad effortlessly brings you from orgasmic peak to peak, pleasure radiating outwards from your pussy until your entire body is tensing and relaxing with every thrust.");
		output("\n\nYou don’t even hear the dryad announcing her impending orgasm, but you feel it when it hits. With the way your pussy is lovingly gripping and squeezing at her gigantic cock, you can tell her cumvein is swelling over and over, loads of equine seed travelling down her shaft to be deposited in your womb. You can feel yourself finally relax when it happens, letting her warmth buoy you away into a calming pink haze of release, your orgasm only ending when hers does.");
		output("\n\n<i>“Ohhh, shit,”</i> the dryad pants, falling forward onto her palms. <i>“That was the best sex I’ve ever had in my life!”</i>");
		output("\n\nA dopey smile on your face in the wake of your extremely lengthy and fulfilling orgasm, you’re inclined to agree. She gently extricates her mammoth length from your overfilled pussy, standing and bending down to give you a kiss before putting her hands on your sweaty shoulders.");
		output("\n\n<i>“Now turn over! I wanna go again but with you on your back this time.”</i>");
		output("\n\n<b>2 hours later</b>");
		output("\n\nYour numbed legs fall to the ground as the dryad finally lifts herself off your prone body, sighing in satisfaction. Her cock messily slips from your stretched-out pussy, jizz splurging onto the ground upon no longer being trapped inside by her flare. Her hanging prick twitches once or twice and spurts sticky cum all over your stomach and chest while she stretches, kicking her hindlegs once or twice.");
		output("\n\n<i>“Mmm, thanks babe,”</i> she says with a smile. <i>“You helped me out a lot today. We should spend more time together! Come see me again really soon, okay? Bye!”</i>");
		output("\n\nShe prances off into the overgrowth, humming happily all the while. Well, at least she’s happy. You lie still for a while, feeling a little dirty as the dryad’s cunt-stuffing slowly drools from between your thighs. She was right, though, that was some of the best sex of your life. Maybe you’ll take a little time to rest before you move on.");
	}
	else
	{
		output("<i>“I think we both know where you really wanna put that big, fat horsecock of yours,”</i> you say, smiling as you get to your feet and turn away from her. <i>“Why don’t you just ram it- oh! Ooh!”</i>");
		output("\n\nYour sensual recommendation is interrupted by a bolt of pleasure emanating outwards from your pussy, and you twist yourself back to see the dryad down on her forelegs, licking you between your legs.");
		
		pc.cuntChange(x, pp.cockVolume(0));
		
		output("\n\n<i>“Oh, fuck, you taste like sex feels,”</i> she mutters, lifting your tail before diving back into your hindquarters, pressing her face into your pussy and sucking hard on your [pc.clit]. You squeal in bliss as her tongue rolls across your clit and travels deeper to get a taste at your sweet juices before returning to massage your plump button. Helpless to resist her advances, you find your own front legs collapsing as you cum your brains out with a scream of lust, your hindlegs held stiff both by the muscular contractions of your orgasm and the arms of the dryad.");
		output("\n\nShe receives a spurt of femcum across her face and a noseful of sex pheromones for her efforts, rising from your juicy, dripping cunt with a wordless groan of arousal. She rears up and mounts your hindquarters as you deftly scramble back to your feet, and you hear her grunt as the flare of her incredibly stiff cock catches between your lips. Between the two of you, there’s no need to go slow and she knows it. She unceremoniously <i>rams</i> herself into your [pc.pussy] balls-deep, her heavy balls slapping off your underside before she pulls back and drives back in.");
		output("\n\nShe doesn’t hold back in the slightest, subjecting you to her full bestial urges, and it’s all you can do to stay standing as her iron-hard rod plunges wetly into your pussy, your juices spraying down your shaking hindlegs while she pummels you into submission. You can hardly help but marvel at how stiff and swollen her cock is; she must have gotten more than she bargained for when she was lapping at your pussy. She fucks you with an animal desperation, panting hard as she focuses singlemindedly on cumming inside you.");
		output("\n\nYou can feel her approaching orgasm in the way her fat head begins to flare and stretch you taut, in the way the bucking of her hips only gets ever faster, and in the way she desperately wraps her arms around your humanoid midriff. With her chin planted on your shoulder and her face in your [pc.hair], you have a front row seat to the dryad’s erotic moaning as she begins to find her peak, your own orgasm right on her heels.");
		output("\n\nA shuddering moan in your ear is all the warning you get before a veritable river of warm spunk begins to pump into you, bathing your womb in equine seed. You bite your lower lip as you try to retain control of your limbs, but it’s no use. Your sopping wet cunt spasms and spurts all over the dryad’s monstrous cock, and your legs buckle once more. This time, she follows you down, lying on top of you like so much insensate deadweight while her balls work overtime to glaze your insides.");
		output("\n\n<i>“Oohhh, you’re fucking amazing,”</i> the dryad pants when she finally gets her words back, hindlegs still squeezing your flanks while she works every heavy rope of jizz out of her cock. <i>“You’re such a sexy bitch I’m still hard - feel it?”</i>");
		output("\n\nShe wiggles her hips, and you do. She must be <i>really</i> turned on to cum once and still be rock hard - you wonder if you’re really draining her at all, but that thought flies away when the dryad presses her dick against your womb and licks your ear. Distracting you with little kisses and nibbles down your neck, she slowly begins fucking your pussy all over again.");
		output("\n\n<i>“Nnnh, ohhh fuck,”</i> she breathes in your ear, hindlegs scrabbling to squeeze your flanks and keep you sat in place. <i>“Your pheromones are- nngh - it’s like you have </i>these<i>,”</i> she says, sliding a sweaty finger across your [pc.lips], <i>“wrapped around my balls, enticing me to keep going!”</i>");
		output("\n\nYou purse your lips and gently suckle her finger, eliciting a moan from your lover. It tastes of salt, but more importantly it tastes of her. Like passion and need. Reaching back, you caress her soft, flushed cheek even as she caves your pussy inwards with long, deep strokes. Pushed over the edge, she responds by shifting her grip upwards and turning you towards her, kissing you with the savage desire you’ve come to know from her.");
		output("\n\nShe cums like that, moaning into your mouth even as her tongue desperately entwines with your own, eyes squeezed tightly shut while her hot spunk surges into you load by load. She grabs at your [pc.breasts], squeezing your [pc.nipples] as if she just can’t get enough of your body. When she finally finishes emptying herself into you what feels like a century later, she parts her lips from yours with a gasp and a thread of drool, chest heaving hard.");
		output("\n\nShe stares into your eyes until her breathing is under control, then slowly, haltingly brings her hands up to your face. Eyeing your lips, she brings herself closer and seals them with a soft, deep kiss, the kind you think would leave her freckled face blushing were her cock not buried a foot deep inside your pussy.");
		output("\n\n<i>“You’re amazing,”</i> she whispers, breath hot on your neck. <i>“I just want to watch you cum over, and over.”</i>");
		output("\n\n<i>“Well, we can go as many times as you like,”</i> you murmur back, running a hand through her pretty red hair.");
		output("\n\nShe responds only by beginning to rut you once more, and you can tell right away she wasn’t kidding about wanting to watch you cum. Her strokes are slow and methodical, by far the most restrained she’s ever been, while her hands idly play with your nipples and stroke you all over. Barely even a few minutes have passed before you feel your hindquarters tensing up, a low groan escaping your lips as your pussy begins clamping down on her veiny cock.");
		output("\n\n<i>“Cum for me,”</i> she whispers, squeezing your diamond-stiff nipples. You do as you’re told, your entire body shaking while pure pleasure radiates through your entire body, tightening up your muscles before leaving you a shuddering, breathless wreck. Then she does it again.");
		output("\n\nAnd again.");
		output("\n\nAnd again.");
		output("\n\n<b>4 hours later</b>");
		output("\n\nThe two of you both groan as the dryad slowly withdraws her sodden, mercifully limp cock from your abused snatch, a river of packed-tight spunk following its exit. Shakily dismounting, she helps you to your feet then catches you in a sweet embrace, pushing her full, perky breasts into ");
		if (pc.biggestTitSize() > 1) output ("yours, your nipples pressing against hers");
		else output("your chest, her nipples pressing against you.");
		output("\n\n<i>“Mmmm, thank you so much,”</i> she murmurs, right before planting a wet kiss on your lips, clasping your face and snaking her tongue inside. This one is shorter than the others, but no less heartfelt. She pulls away with a smile and red cheeks.");
		output("\n\n<i>“I’m gonna leave before I fall in love. Come back real soon, okay cutie? Stay safe! Byeeee!”</i> she calls, prancing away into the overgrowth, fluffy tail flitting from side to side.");
		output("\n\n<i>“Bye!”</i> you call, waving after her as she departs. She’s very nice, you think. Also she fucks like a champion. Speaking of which... you wince as you stretch a hindleg. Maybe you’ll just lie down a bit before you move on. Not <i>right</i> here, though - you and the dryad have created a little impromptu clearing by fucking like wild beasts, then filled it with your juices. Mostly hers, but you were gushing like a waterfall too by the end of it. The way she can use that fat cock of hers... you shake your head in an attempt to clear it. The lingering sex pheromones are another reason to go elsewhere.");
	
		processTime(100);
	}
	
	processTime(140);
	pc.orgasm();
	pc.loadInCunt(pp,x);
	pc.loadInCunt(pp,x);
	pc.loadInCunt(pp,x);
	pc.loadInCunt(pp,x);
	pc.loadInCunt(pp,x);
	pc.loadInCunt(pp,x);
	pc.loadInCunt(pp,x);
	pc.loadInCunt(pp,x);
	IncrementFlag("DRYAD_DRAINED");
	IncrementFlag("DRYAD_YOURCUNT");
	IncrementFlag("DRYAD_YOURCUNT");
	IncrementFlag("DRYAD_YOURCUNT");
	IncrementFlag("DRYAD_YOURCUNT");
	IncrementFlag("DRYAD_YOURCUNT");
	IncrementFlag("DRYAD_YOURCUNT");
	IncrementFlag("DRYAD_YOURCUNT");
	IncrementFlag("DRYAD_YOURCUNT");
	clearMenu();
	addButton(0,"Next",dryadDrainPussyEpilogue);
}

public function dryadDrainPussyEpilogue():void
{
	clearOutput();
	dryadHeader();
	author("Wsan");
	
	if(!pc.isTaur()) output("You stand and dust yourself off. You can still <i>feel</i> her inside you, marked inside and outside by her touch and her scent, but at least you can walk. Turning away from the site of your tryst, you set back on the path.");
	else output("You stand and dust yourself off. You can still <i>feel</i> her inside you, marked inside and outside by her touch and her scent, but at least you can walk without soreness or dripping. Better get back to it!");
	
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}