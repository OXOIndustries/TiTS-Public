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

public function getDryadPregContainer():PregnancyPlaceholder
{
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.shiftCock(0, GLOBAL.TYPE_EQUINE);
	pp.cocks[0].cLengthRaw = 14;
	pp.createPerk("Fixed CumQ",6000,0,0,0);
	
	return pp;
}

public function dryadMeeting():void
{
	dryadHeader();
	
	if (flags["DRYAD_MET"] == undefined)
	{
		flags["DRYAD_MET"] = 1;
		output("\n\nYou can hear a high-pitched, frantic voice coming from up ahead. Sounds like someone is in trouble, and as you approach you see there’s a trail of hooved footprints that look to have trampled out an impromptu clearing. Scooping some foliage out of your face, you can see there’s a creature facing away from you off to the side. It looks to be tauric in nature, with four hooved legs, furred, and a bare humanoid upper half at the front of its body. You look down and are unsurprised to see a large, pink and fully erect horsecock swinging from its undercarriage – seems like everything out here wants to fuck. It turns towards you and you’re taken aback – you’re faced with a beautiful woman with flowing red hair down to her chest. She trots in your direction and you can see her hair was partially masking her breasts, which look to be about a C cup and capped with pink nipples. As she gets closer, you note her face is red and that she’s breathing heavily, her hair strewn wildly and breasts rapidly moving up and down with her inhalations. She greets you first.");
		output("\n\n<i>“Um, hi! Listen, maybe you’ve heard this before but I really, <i>really</i> need to fuck someone before I go mad! These gene mods are great, but the ones I’ve used kinda clashed and now I go into heat multiple times a day and - look, can we just fuck?”</i>");
	}
	else
	{
		output("\n\nYou can hear a high-pitched, frantic voice coming from up ahead. Sounds like someone is in trouble, and as you approach you see there’s a trail of hooved footprints that look to have trampled out an impromptu clearing. Scooping some foliage out of your face, you can see there’s a creature facing away from you off to the side. It looks to be tauric in nature, with four hooved legs, furred, and a bare humanoid upper half at the front of its body. You look down and are unsurprised to see a large, pink and fully erect horsecock swinging from its undercarriage – seems like everything out here wants to fuck. It turns towards you and you’re taken aback – you’re faced with a beautiful woman with flowing red hair down to her chest. She trots in your direction and you can see her hair was partially masking her breasts, which look to be about a C cup and capped with pink nipples. As she gets closer, you note her face is red and that she’s breathing heavily, her hair strewn wildly and breasts rapidly moving up and down with her inhalations. She greets you first.");
		output("\n\n<i>“Oh, it's you! I'm in heat again – wanna fuck?”</i>");
	}
	
	output("\n\nShe makes puppy eyes at you, although the effect is somewhat diminished by the gigantic equine cock pointing in your direction. Still, though, it’s pretty clear she is at least telling the truth about the heat thing. She’s obviously desperate to fuck. Given her state, it looks like whatever sex you have is gonna be rough and animalistic regardless of whether you’re on the receiving end.");
	output("\n\nAre you going to have sex with the taur-girl, and if so what are you going to use?");
	processTime(3);
	pc.lust(5);
	clearMenu();
	if(pc.lust() >= 33)
	{
		addButton(0,"Give BJ", dryadBlowjob,undefined,"Give BJ","Use your mouth to get the girl off.");
		if (pc.hasVagina()) addButton(1, "Get Fucked", dryadPussy, undefined, "Get Fucked", "Let the girl fuck your pussy.");
		else addDisabledButton(1, "Get Fucked", "Get Fucked", "You don't have a pussy for her to fuck.");
		addButton(2, "Get Reamed", dryadAss, undefined, "Get Reamed", "Let the girl fuck your ass.");
		if (pc.hasCock() && pc.biggestCockLength() >= 12) addButton(3, "Fuck Her", dryadDick, undefined, "Fuck Her", "Fuck the girl's pussy to get her off.");
		else if (pc.hasCock()) addDisabledButton(3, "Fuck Her", "Fuck Her", "Your dick needs to be at least a foot long before the femtaur will let you fuck her.");
		else addDisabledButton(3, "Fuck Her", "Fuck Her", "You don't have a foot-long dick to fuck her with.");
	}
	else
	{
		addDisabledButton(0,"Give BJ","Give BJ","You aren't aroused enough for that.");
		if (pc.hasVagina()) addDisabledButton(1, "Get Fucked", "Get Fucked", "You aren't aroused enough for that.");
		else addDisabledButton(1, "Get Fucked", "Get Fucked", "Even if you were aroused enough, you don't have a pussy for her to fuck.");
		addDisabledButton(2,"Get Reamed","Get Reamed","You aren't aroused enough for that.");
		if (pc.hasCock() && pc.biggestCockLength() >= 12) addDisabledButton(3,"Fuck Her","Fuck Her","You aren't aroused enough for that.");
		else if (pc.hasCock()) addDisabledButton(3, "Fuck Her", "Fuck Her", "Even if you were aroused enough, your dick needs to be at least a foot long to fuck her.");
		else addDisabledButton(3, "Fuck Her", "Fuck Her", "Even if you were aroused enough, you need a dick at least a foot long to fuck her.");
	}
	addButton(14, "Leave", dryadNo, undefined, "Leave", "You don't wanna bang right now.");
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
	if(!pc.isBimbo()) output("gag reflex is completely overwhelmed by such a large object passing through where it shouldn’t, which is great because you’d doubt you’d even be able to get her off you in her lustful frenzy.");
	else output("throat is completely stuffed by the enormous object, stretched out nice and thick around the big fat cock. Part of you thrills to know that you're hot enough to warrant a true face-fuck.");
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
	if (!target.isCrotchExposed()) output(" as you remove your [pc.lowerGarments]");
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
	if (!target.isAssExposed()) output(" as you remove your [pc.lowerGarments]");
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
	
	pc.loadInAss(pp);
	pc.lust(30)
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
		output("\n\nYour instincts take over at such willing presentation and you rear up to wrap yourself around her midsection, your [pc.oneCock] springing");
		if (!target.isCrotchExposed()) output(" free of your [pc.lowerGarments]");
		else output(" to full erction");
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
		output("\n\nYour instincts take over at such willing presentation and seize her flank, your [pc.oneCock] springing");
		if (!target.isCrotchExposed()) output(" free of your [pc.lowerGarments]");
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
	processTime(10);
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
