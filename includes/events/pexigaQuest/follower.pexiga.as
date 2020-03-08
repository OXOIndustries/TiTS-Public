public function pexigaIsCrew():Boolean
{
	if (pexiga.hasPerk("Ditz Speech") && yammiIsCrew()) return true;
	return false;
}
public function pexigaRecruited():Boolean
{
	if (pexiga.hasPerk("Ditz Speech")) return true;
	return false;
}

public function showYammiAndPexiga(nude:Boolean = false):void
{
	showName("YAMMI &\n" + pexigaName().toUpperCase());
	showBust(yammiBustDisplay(nude), pexigaBustDisplay(nude));
}
public function pexigaBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "PEXIGA";
	if(pexiga.hasPerk("Ditz Speech")) sBust += "_BIMBO";
	
	return sBust;
}

public function pexigaShipBonusText(btnSlot:int = 0, showBlurb:Boolean = true):String
{
	var msg:String = "";
	
	msg += "\n\nThe bimbo pexiga girl seems perfectly content in her admittedly small quarters. Either from habit or her awkwardly over-endowed body, [pexiga.name] seems to prefer staying on all fours. When not tasting everything around her, she tends to " + (yammiIsCrew() ? "follow Yammi around like a little lost puppy, helping out any way she can" : "scurry around like a little lost puppy") + ". Despite her innocent demeanor, you catch her giving you an occasional glance full of a hunger " + (yammiIsCrew() ? "Yammi" : "-- the type that food") + " can’t satisfy.";
	
	addButton(btnSlot, pexigaName(), approachPexigaCrew);
	
	return (showBlurb ? msg : "");
}

//[Pexiga]
//Once she’s been fixed, the bimbo pexiga is added to your crew menu. Her scenes are disabled on Yammi’s menu and the player gains a seperate follower option, used to talk, fuck, milk, and pet her. Yammi can join in on some three-ways

// First Visit
public function approachPexigaCrewFirstTime():void
{
	clearOutput();
	showYammiAndPexiga();
	author("Adjatha");
	flags["PEX&YAM_MEETING"] = 1;
	output("As you head back to check in on how your pexiga is getting along, you make out the sounds of a commotion going on from Yammi’s quarters. Poking your head in, you see that [pexiga.name] has got Yammi pinned on the ground and is busy licking her face vigorously. The orange-skinned cook sputters and tries to push her assistant off, but seems pretty well overmatched.");
	output("\n\n<i>“Ack! Stop it, girl! Down girl! Blek arg pleh,”</i> she can’t seem to keep the pexiga’s long, searching tongue from finding its way to her mouth, even with both hands. Taking pity on the tall sparadat, you move in to pull the girls apart. Yammi gives you a look of relief as she tries to wipe thick webs of dripping drool from her face. <i>“Thank goodness you showed up, [pc.name]. Any longer and I’d have been fully basted. Just what did you do to my pexiga?”</i>");
	if(pc.isBimbo()) output("\n\n<i>“Onna adventure!”</i> you explain excitedly. <i>“We went to Badger’s an there was, like, this nurse bot an she kept tryin’ to spray me with stuff but she was really pretty so I forgive her. But I had to keep goin’ so then there was a bunch of arms with toys and stuff on ‘em. That was weird! But maybe we should get one of those. And then there was all this science. Like SO MUCH science. You don’t even know! And there was this piercing and then she turned white, which is, like, pretty weird. Even for so much science, you know? And now we’re here again, just like normal! Except she’s smart, kinda. And like, a different color.”</i> You pause for breath, as Yammi stares at you in confused disbelief. Your pexiga stops her licking to nod energetically, confirming everything you’ve just said, even the stuff that happened before she got smart.");
	//non-bimbo:
	else output("\n\nAs you’re debating how to summarize your journey into Badger’s lair, [pexiga.name] answers for you in the soft, artificial voice of her translator piercing. <i>“We went deep down and now I’mma smart!”</i>");
	output("\n\nYammi draws back, glancing at you with a raised eyebrow. <i>“Geez, the things you get up to...”</i> she replies slowly. <i>“Well, if she’s thinking for herself, I guess I can’t just use her for ingredients anymore,”</i> the cook pouts, her ear fans trilling.");
	output("\n\n<i>“Aw, no more milkings?”</i> the pexiga whines. <i>“But I like Yammi’s taste!”</i> She turns to you with wide, hopeful eyes. <i>“Please? More milkings?”</i>");
	output("\n\nWith a shrug, you rest your hands hand on both girl’s shoulders. ");
	if(pc.isBimbo()) output(" <i>“Gosh! You two have always been such good friends, it’d be, like, a bummer if things changed now. She’s the same as always, but like, way smarter. Totes the same, though!”</i> you promise, nodding your head.");
	else if(pc.isNice()) output(" <i>“There you have it. You want to keep milking her and she wants to keep being milked. Nothing has to change,”</i> you assure them.");
	else if(pc.isMischievous()) output(" <i>“If you’d prefer, I can make [pexiga.name] the cook, and she can milk you instead? Gotta maintain the status quo!”</i> you insist with a grin.");
	else output(" <i>“Don’t think you’re getting out of being the cook that easily. The job’s the same as it’s ever been,”</i> you insist.");
	output(" <i>“Other than maybe a little extra friskiness,”</i> you add, noticing the thick, glistening nectar leaking down [pexiga.name]’s inner thigh. <i>“Speaking of which, you might want to take care of that.”</i>");
	output("\n\nYammi follows your pointing finger to the nectar-dripping gap between the silver girl’s legs and gulps. <i>“Don’t suppose you want to lend a hand?”</i>");

	processTime(4);
	clearMenu();
	//[Sure] [Nah]
	if(pc.hasCock() && pc.cockThatFits(yammiPlaceholderCapacity()) >= 0) addButton(0,"Sure (Male)",sureHelpPlugTheLeakingPexigaWithYammiFirstTime);
	else if(pc.hasCock()) addDisabledButton(0,"Sure (Male)","Sure (Male)","You need to be able to fit inside Yammi to do this scene. You’re too well... endowed.");
	else addDisabledButton(0,"Sure (Male)","Sure (Male)","You need a penis for this.");

	if(pc.hasVagina()) addButton(1,"Sure (Female)",firstTimePexibuttMilkingForLadyTypes);
	else addDisabledButton(1,"Sure (Female)","Sure (Female)","You need a vagina for this.");

	addButton(2,"Nah",declineFirstTimeMilkThreesome);
}

//[Sure] (dick version)
public function sureHelpPlugTheLeakingPexigaWithYammiFirstTime():void
{
	clearOutput();
	showYammiAndPexiga();
	author("Adjatha");
	output("<i>“Well, if we’re gonna milk her, we’re going to need her bowl. Guess I’ll go get that,”</i> Yammi mutters. <i>“This is just so weird. I don’t think I’m ever going to get used to it.”</i>");
	output("\n\nWhile the orange skinned cook retrieves [pexiga.name]’s drool bowl, you use the opportunity to ");
	if(!pc.isCrotchExposed()) output("strip out of your [pc.lowerGarments] and ");
	output("clear one of the tables off. Your pexiga watches you with great interest, her tongue wagging back and forth in time with her tail. As space clears up, you move to the silver girl herself, hoisting her up onto the countertop like she were the main course.");
	output("\n\nWhen Yammi returns, she braces her fists on her hips. <i>“Aw come on. That can’t be sanitary.”</i> Rather than argue, you nab the sparadat’s waist and lift her onto the tabletop, right next to her assistant. Reaching a hand under her crimson skirt, you sweep your fingers across her firm clit just long enough to still her protests. Raising your other hand to [pexiga.name]’s cleft, you trace your fingertips on a tickling dance across her soft mound.");
	output("\n\nYammi whines, biting her lip, but [pexiga.name] simply shudders in delight, her big blue eyes locked onto yours. Her tail sweeps across the table to her former owner’s rigid form, curling around Yammi’s thighs before working its way up and under her low-cut shirt. Breathless, the cook raises a hand to shoo away the invading tendril, but it presses forward all the same, flickering across her breasts like a serpent hunting for prey. Yammi squirms between the two of you, holding the plastic bowl in front of her face to hide the intense flush spreading across her cheeks. <i>“Quit ganging up on me, you two,”</i> she whines.");
	output("\n\nIt’s true, you probably should give your white-scaled pet a bit more. You draw your fingers from both girls’ moist holes and roll the pexiga over, onto the sparadat. Breast to breast, the two girls pant, clutching at each other while you take a good look at their plump hindquarters. Yammi’s certainly no slouch in the ass department, but Badger’s cure has left [pexiga.name] with a rump that defies logic. Hefty globes of melon-sized flesh dwarf the cook’s booty, her posterior positively eclipsed by [pexiga.name]’s full moon.");
	output("\n\nWith both girls simmering, it’s about time you took their temperature. Pressing your crotch against the girls’ asses, you swing your hips side to side, letting them feel the weight of [pc.eachCock] on their jiggling rumps. As your meat stiffens, you slide your hands between the girls’ legs, and pull them apart to expose their dripping pussies. A step forward presses your shaft");
	if(pc.cockTotal() > 1) output("s");
	output(" against their warm, exhilarated bodies, flushed cheeks parting eagerly. The girls’ lower lips are puffy, glistening with anticipation as the cook and her assistant rub against one another.");

	output("\n\n[pexiga.name]’s tail continues its sinuous invasion of Yammi’s heavy breasts while the orange girl puts her hands to the task of milking the pexiga. With a well practiced grip, she seizes the dangling tongue and squeezes in long, tight strokes. Starting all the way up at the ring gag and slowly making her way down to the tender tip, she pumps [pexiga.name]’s hanging organ like she were applying frosting onto a cake.");
	output("\n\nThe silver bimbo, perhaps misconstruing Yammi’s intent, wiggles the tip of her tongue into the sparadat’s mouth, feeding the sugary saliva to the cook rather than to the collection bowl. Yammi sputters and splashes the warm, gooey fluid all over her face as she tries to extract the pexiga’s slimy length from between her lips.\n\n<i>“Very naughty,”</i> you scold [pexiga.name] with a slap across the ass. <i>“Don’t try to tongue-fuck Yammi’s face while she’s milking you.”</i> The pale girl giggles at the impact, wiggling her booty as if to invite another. Instead, however, you apply the next slap to Yammi’s rump, drawing an outraged cry from the cook. <i>“And that’s for wasting so much saliva,”</i> you explain coyly. <i>“If you can’t get it into the bowl, you should at least swallow it. Waste not, want not.”</i> She shoots you a miffed glance from the bottom of the girl sandwich, but redoubles her efforts in milking the pexiga’s tongue.");
	processTime(10);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",sureHelpPlugTheLeakingPexigaWithYammiFirstTime2);
}

public function sureHelpPlugTheLeakingPexigaWithYammiFirstTime2():void
{
	clearOutput();
	showYammiAndPexiga();
	author("Adjatha");
	output("Satisfied that they understand the rules, you trace your thumbs across the girls’ thighs, up to their mounds. The stiffness in your groin throbs against their legs and, frankly, there’s no reason to hold back any further. ");
	if(pc.isTaur()) output("Careful not to step on the girls, you lift your forelegs to the table and step forward enough to bring the undercarriage of your lower body level with their frames. ");
	output("With a ");
	if(pc.isTaur()) output("few stray, thrusting attempts");
	else output("guiding hand");
	output(", you slip the full length of your [pc.cockBiggest] between the two girls");
	if(pc.cockTotal() > 1) 
	{
		output(" while you allow your other shaft");
		if(pc.cockTotal() > 1) output("s");
		output(" to press teasingly against their wobbling asses");
	}
	output(". The faint heat of the squirming girls seems to multiply once you’re squeezed between their bodies. The swell of their vulvas kiss the meat of your [pc.cockBiggest] like suckling lips. Their hips twist and grind, urgently stroking their stiff little clits against your hardness.");

	output("\n\nA pair of stiff slaps on each girls’ buns is enough to bring Yammi back to the task at hand, but only eggs on [pexiga.name] to misbehave more. She leans in and jams inch after inch of her hefty tongue into Yammi’s mouth, until the dutiful cook has more of the wet organ in her mouth than in her hands. Even the overly large gold piercing is forced into her cheeks, and if you didn’t know better, you’d swear she were trying to suck off a huge pair of nuts.");

	output("\n\nYammi grinds against your cock as her mouth fills, having difficulty focusing on both tasks at once. Eventually, she gives up trying to keep the pexiga out and proceeds to milk the bimbo assistant with her throat instead. As her cheeks fill up, she tilts slightly to let the excess saliva dribble out of the corner of her mouth, into the bowl. She seems to be swallowing as much as she gets into the bowl, however, and her body trembles as much from the sugar high as from the throbbing shaft on top of her.");

	output("\n\n[pexiga.name] manages to feed the last of her tongue into Yammi’s gob, pressing her ring-gag against the orange girl’s overfilled mouth in a tight kiss. The cook’s cheeks quickly fill with saliva and, with no outlet available, she reluctantly starts to take shallow gulps. The sweetness hits her like a drug, her whole body flooding with heat. You take this to mean that you’ve teased these two enough. Drawing back, you brace at the sopping wetness of their cunts with swollen anticipation before thrusting forward.");

	var args:Array = [0,-1];
	args[0] = pc.cockThatFits(yammiPlaceholderCapacity());
	if(args[0] < 0) args[0] = pc.smallestCockIndex();
	args[1] = pc.cockThatFits2(yammiPlaceholderCapacity());

	output("\n\nYour [pc.cock " + args[0] + "] slides into Yammi with avid delight, parting her moist folds in your unrelenting advance. She gurgles and trembles, her overwrought body hitting its climax from the mere act of penetration. She swallows a heavy load of sugary drool, but the tightening shudders of ecstasy rob her body of coordination. The burden in her mouth is too much and too thick; gooey blobs spurt from the sides of her lips soaking both girls in the pexiga’s saliva.");
	pc.cockChange();
	output("\n\n[pexiga.name] tries to say something, her tail whipping out in agitation, but her words are muffled by Yammi’s ballooned cheeks. ");
	if(args[1] >= 0) output("You assume the pexiga’s comment had something to do with disappointment at being left out. Eager to fix this, you brace a second member against her alien slit and thrust into her as well. This time it’s your turn to shudder, however. She’s tight. Like, REALLY tight! Hadn’t she already given birth when Yammi picked her up? It seems unfair for a mother to have a pussy like this. She’s sopping wet, but you have to hammer, inch by inch to make any progress into the silver girl. She pounds back against you with happy delight, instinct keeping her balanced between tongue-fucking the chef and pussy-milking the captain. ");
	output("You reach down and give her a scratch behind her trilled ears, coaxing a fierce purr from her so loud that at first you think one of the appliances had been turned on by accident.");

	output("\n\nYou lose track of time as your [pc.hips] slam against the girls’ rumps, fucking deeper and deeper until the allure of release grows heavy in your gut. The alien sluts writhe atop each other as you go, gasps and moans smothered by their wet, slippery kiss. Soft, pliant heat suckles at your loins while you rock against them with quick, shallow smacks. Yammi’s tummy has swollen a bit from all the saccharine fluid filling her, and after a moment, you notice that her fingers are powerlessly grabbing at the pexiga on top. The weak, blissed-out shudders trembling along your [pc.cock " + args[0] + "] tells you she’s had enough.");
	processTime(20);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",sureHelpPlugTheLeakingPexigaWithYammiFirstTime3,args);
}

public function sureHelpPlugTheLeakingPexigaWithYammiFirstTime3(args:Array):void
{
	clearOutput();
	showYammiAndPexiga();
	author("Adjatha");
	output("Before you can move to help her, your orgasm breaks past your drained restraint. Globs of spunk spurt into the orange girl, her depths squeezing each drop fiercely. She quakes at tightening pleasure within, her ankles locking around your [pc.ass], despite her oral distress. ");
	if(args[1] >= 0) output("[pexiga.name]’s cunt, meanwhile, suddenly relaxes its limiting pressure for a split second to snatch up as much of your shaft as possible, before contracting once more in rippling waves. Her pussy wrings your orgasm for all it’s worth, [pc.cumVisc] cream gushing into her as if she were vacuuming the spunk out of you. ");
	//normal cum volume:
	if(pc.cumQ() < 600) output("Before long, you’re completely drained, fattening seed deep inside your kitchen staff. The wet grip of Yammi’s cunny still sending tender shivers from your [pc.cockHead " + args[0] + "] up to your spine.");
	else 
	{
		output("The early trickles become ample gouts of hot seed, flooding into your kitchen staff. The bloating swell is too much, however, and each subsequent twitch from your groin sends sticky ropes of [pc.cumColor] spurting from ");
		if(args[1] < 0) output("her");
		else output("their");
		output(" puffy lower lips. Jizz splatters around the kitchen in wild spree, leaving the orderly stainless steel chamber an utter, dripping mess.");
	}
	output("\n\nYou slam extra hard into the girls one last time and reach down, pulling [pexiga.name] up by the jaw, lifting her torso off of the sparadat. The full length of the pale beast’s tongue unspools from the cook’s mouth until, finally, the piercing pops out with a tiny geyser of saliva. The pexiga cranes her head to meet your gaze with a proud expression, pleased to be able to help. <i>“Yay for milkings,”</i> she giggles. <i>“Again?”</i>");
	output("\n\nYou survey the state of your cook. Yammi’s body seems to be slightly vibrating and her expression is nearly as vacant as the pexiga’s used to be. Her tummy is swollen from the sugary alien’s deep-throating kiss while cum drools out between her legs");
	if(pc.cumQ() >= 600) output(" from the spunk-stuffed gut you’ve left her with");
	output(". You withdraw, ");
	if(pc.isTaur()) output("lowering your upper half from the table, ");
	output("and shake off the residual tremors of tender passion with a heavy sigh of contentment before turning back to your smiling, panting bimbo.");

	if(pc.isBimbo()) output("\n\n<i>“I think that went from milking to mating,”</i> you correct [pexiga.name]. <i>“But either way, you did a great job!”</i> You tussle the silver girl’s mane of soft spines, earing delighted face licks in return. <i>“You and Yammi are gonna have, like, SO much fun!”</i>");
	else if(pc.isNice()) output("\n\n<i>“You really need to be more gentle with Yammi,”</i> you scold the white-scaled girl. You boop her on the snout by way of scolding her, but she licks the underside of your hand rather than taking the discipline to heart.");
	else if(pc.isMischievous()) output("\n\n<i>“I don’t think your boss is going to be up for another round just yet. Maybe give her a couple of minutes,”</i> you reply, patting her head encouragingly.");
	else output("\n\n<i>“Heh. And Yammi said you were perfectly harmless. Guess she’ll be a bit more careful in the future.”</i> You turn to the pexiga with a severe look. <i>“You need to learn how to take orders better, [pexiga.name]. A little training might be in YOUR future.”</i> She seems oblivious as to what that might mean, so no sense in spoiling the surprise for her.");

	output("\n\n[pexiga.name] wanders back to the sparadat and plops herself between the girl’s legs, her long tongue lapping your cum out of the girl’s tender puss with hungry glee. You dress and head out. On your way, you glance back to lake a look at the plastic bowl meant to hold [pexiga.name]’s saliva. Barely two inches of the sweet stuff has made it inside. The rest sloshes warmly inside the cook herself. If she keeps eating like this, she’ll have a butt to rival [pexiga.name]’s in no time!");

	processTime(15);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Sure] (vagina version)
public function firstTimePexibuttMilkingForLadyTypes():void
{
	clearOutput();
	showYammiAndPexiga();
	author("Adjatha");
	if(pc.isBimbo()) output("<i>“Oooh, a three-way? I’m, like, totally in!”</i>");
	else if(pc.isNice()) output("<i>“We’ve got to show [pexiga.name] that she’s welcome on the ship. I think this calls for a little bonding moment.”</i> You wrap an arm around Yammi’s shoulder and give her a squeeze of encouragement.");
	else if(pc.isMischievous()) output("<i>“We should probably make sure the change hasn’t affected her taste first, don’t you think,”</i> you ask Yammi, suggestively raising an eyebrow.");
	else output("<i>“I mean to get some use out of the girl, one way or the other,”</i> you explain to Yammi with a slowly curling grin.");

	output("\n\nThe sparadat’s ear frills trill a bit, but she swallows a gulp and shrugs. <i>“Yeah, I guess. You’re the boss.”</i>");
	output("\n\n[pexiga.name] claps happily and jumps up toward you. With a bit of a grunt, you manage to catch her and deposit the silver beast girl onto the heavy, stainless steel table in the middle of the kitchen. <i>“Ohhh, is [pexiga.name] food?”</i> she asks, her tongue and tail wagging with anticipation.");
	output("\n\n<i>“Food doesn’t normally talk,”</i> Yammi mutters, self-consciously running a hand through her shock of bright green hair.");
	output("\n\n<i>“Well, it will never do to have the chef and her assistant all awkward with one another,”</i> you chide, moving to Yammi’s side and sliding your hands up her hips and along the smooth, orange skin of her back. You slowly lift the apron from her neck and dig a digit under the side strap of her bikini bottom.");
	output("\n\n<i>“It’s lucky you’re so pretty,”</i> Yammi grumbles without very much rancor. She wiggles her sizable booty as you slide her tight-fitting bottom off and returns the favor by pulling your [pc.gear] off, piece by piece. [pexiga.name] watches with some interest, carefully noting how the cook uses her fingertips to tease your sensitive spots, lingering just long enough to bring a shiver to your spine before moving on.");
	output("\n\nWhen the three of you are completely bare, you turn on the reclining pexiga. <i>“Heads or tails?”</i> you ask Yammi. She shrugs, walking around the girl slowly, taking in the bimbo’s freshly Badger-boosted proportions. Well, you figure, if she doesn’t have an opinion, you may as well take full stock of that huge, thick, muscular tongue. You guide [pexiga.name] to lay down on her back along the short side of the table, letting her head and legs dangle off of either side. Standing inches from her face, you reach down to stroke her soft, hair-like spines and scratch behind her frilly ears.");
	processTime(10);
	pc.changeLust(20);
	clearMenu();
	addButton(0,"Next",firstTimePexibuttMilkingForLadyTypes2);
}

public function firstTimePexibuttMilkingForLadyTypes2():void
{
	clearOutput();
	showYammiAndPexiga();
	author("Adjatha");
	output("Yammi takes her spot between the silver girl’s legs, running both palms up and down the thick inner thighs, dragging her nails across soft, finely scaled skin. [pexiga.name] purrs with delight, arching her back slightly, putting her overfilled F-cups on wobbling display. <i>“Geez,”</i> the orange girl remarks, lightly slapping her assistant’s melons. <i>“I don’t know what you two got up to, but these things are massive!”</i> Sinking her fingers into the yielding expanse of the giggling pexiga’s chest, Yammi squeezes and pinches, caressing and massaging the cyan-tipped orbs with a firmness so intense you’d swear she was tenderizing meat.");
	output("\n\n[pexiga.name] hardly seems to mind the too-rough titplay, however, and keeps her eyes on you throughout. <i>“Fun fun!”</i> she chirps, her tongue tracing a sinuous path through the air, like a charmed serpent. Beads of drool dribble down her tongue and you’re about to reach for her bowl to start milking when a thought strikes you. It’d be such a shame to let that massive organ go to waste in your hands...");
	if(pc.isTaur()) output("\n\nYou turn around, presenting your hindquarters and [pc.vaginas] to the excited pexiga, hoping you’re not making a big mistake.");
	else output("\n\nReaching down to stroke your palm across her cheek, you step forward, bringing your [pc.vaginas] level with the girl’s wandering tongue.");
	output(" [pexiga.name] doesn’t disappoint, immediately setting to the task of exploring your slit with all the single-minded delight you’d expect of the animalistic nympho. As thick as a hand, her tongue slides along your cunny with slow satisfaction, like she were tasting a savory meal. Her textured surface rubs warm gel-thick saliva over your [pc.skinFurScales], while the warm gold piercing at her tip provides a smooth firmness that parts your lower lips just a little bit more with each pass.");
	output("\n\nYou breathe a sigh of enjoyment and glance up to see that Yammi has set about a taste test of her own. Dropping to her knees and hoisting the pexiga’s toe-less feet up over her shoulders, she’s buried her head between the girl’s thighs. With small, nibbling bites, she teases the fine scales of [pexiga.name]’s puffy vulva until the tender flesh is swollen with anticipation. Using both thumbs, she pulls the meaty lips apart to expose the glistening, cobalt clitoris within. The tiny blue pearl stands no chance against the former ice cream saleswoman’s licking onslaught, [pexiga.name] letting out an unprepared yipe, squeezing the orange girl’s head between her thighs.");
	output("\n\nThe moist tongue currently bathing your loins grows more frantic and less controlled as its owner gets eaten out on the other side of the table. Her tip flickers at the entrance to your [pc.vagina], before darting in without further warning. You roll your hips, biting at your lower lip as the powerful muscle slides inside, lubricated as much by her own drool as by your [pc.girlCum]. She zips about your entrance, lapping up your liquid lust, but when she tries to push deeper, the hefty tongue piercing makes its presence known by thwacking up against your softness.");
	output("\n\nThe massive barbell, with its huge, golden orbs, slams against your quivering slit, but is far too large to just slide in. The metal rubs against your [pc.clits] as the pexiga whines with the desire to drink from your innermost depths. She draws back and tries again and again, buffeting your joybuzzer with the piercing’s mouth-watering hardness. <i>“It won’t go in,”</i> [pexiga.name] whimpers and as the artificial voice floats out of the golden orbs, an almost electric tingle runs through your pussy that very nearly knocks your ass to the ground.");
	output("\n\n<i>“Do... do that again,”</i> you gasp, your hands reaching up to clutch at your [pc.chest] with trembling fingers.");
	processTime(15);
	pc.changeLust(80);
	clearMenu();
	addButton(0,"Next",firstTimePexibuttMilkingForLadyTypes3);
}

public function firstTimePexibuttMilkingForLadyTypes3():void
{
	clearOutput();
	showYammiAndPexiga();
	author("Adjatha");
	output("<i>“Do what?”</i> the girl asks, sending another thrill of prickling bliss right into your clenching cunt.");
	output("\n\n<i>“K-keep talking,”</i> you pant");
	if(pc.tailCount > 1 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output(", your [pc.tails] curling");
	output(".");

	output("\n\n<i>“Oh! [pexiga.name] can do that! It’s super easy. Miss Badger’s tongue thingy does most of it,”</i> she admits, so absorbed in the sparadat between her legs that she fails to notice the effect her piercing is having on you.");
	output("\n\nLike a live wire on an exposed nerve, the buzzing translator starts overloading your system. Your teeth bite hard enough on your lower lip to leave an imprint and you ");
	if(pc.isTaur()) output("back up");
	else output("reach down to grab the back of her head");
	output(", jamming your clit as hard as you can against the oral jewelry. She says something else, but it doesn’t matter. Her voice is muffled by your muff and you can barely translate words into meaning with the voltaic ecstasy running through you in a shuddering, wordless orgasm.");

	output("\n\nWhile you sway and cream your [pc.girlCum] into [pexiga.name]’s open mouth, Yammi hoists your pet’s legs up to get a better grip. She stretches her arms out and subjects the silver beasty’s breasts to further groping while the pexiga weakly kicks her heels against the sparadat’s back. Mouth buried in [pexiga.name]’s slit, her tongue flicking back and forth between clit and lips, the cook seems intent on finding her assistant’s most sensitive spot. Perhaps to avenge her captain’s incapacitation or maybe just out of professional pride, she digs her pinkies into the pexiga’s inverted nipple-holes while clamping her teeth down on the sapphire bead.");
	output("\n\nA shiver starts in the silver girl’s tail, working its way up to her plump booty and across her full, creamy hips. Her legs lift off of Yammi’s shoulders and tense, the toeless tips of her feet curling tightly. Her hips vibrate and her back arches, forcing another inch of the orange girl’s fingers deeper into her full melons. A vulnerable moan filters up from the girl’s throat, like the cry of an animal in heat. Tail lashing wildly back and forth, she vibrates on the table for several seconds, enraptured by the cook’s raw treatment.");
	output("\n\n<i>“O- oh!”</i> the pexiga cries out, her translator sending its blissful impulses through your spine and into your brain. <i>“Lick [pexiga.name]! Milk [pexiga.name]! Mount [pexiga.name]! Breed [pexiga.name]! Please please please please please....”</i> Her shameless, lustful supplications are too much for your electrified body. You drop, managing to barely slow your descent enough that you don’t bang your head on anything on the way down.");
	output("\n\nBody still tensing and shuddering from the rich climax harvest of the pexiga’s piercing, you struggle to stay aware of the world beyond your clenching, pleasure-drunk body. Flickers of darkness and light turn the next hour into a confusing sequence of snapshots. Yammi climbing up on the table to suck on [pexiga.name]’s tongue. The two girls’ legs intertwined as they rub their clits against one another. The pexiga’s head held over her bowl, drooling freely as Yammi’s pumps a hand in and out of the silver girl’s pussy. And finally, a tender cuddle between the two.");
	output("\n\nBy the time you regain your motor control and your brain manages to stop randomly shutting off, you find that the mess of the kitchen has already been cleaned up. Someone even dressed you. Your cook and her new assistant are going over recipes in a corner, the pexiga’s tail curled around Yammi’s leg affectionately. You’re going to watch how much you expose yourself to Badger technology, but at least your crewmates are getting along now!");
	processTime(45);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//[Nah]
public function declineFirstTimeMilkThreesome():void
{
	clearOutput();
	showYammiAndPexiga();
	author("Adjatha");
	output("With an irreverent wave, you shoo the two of them back into the kitchen. <i>“No no, it’s up to the head chef to look after her staff and all their needs. I’ll check in on you girls later. Have fun now!”</i> Yammi stammers an argument but is swiftly drawn into the room by [pexiga.name]’s predatory strength. You can hear muffled orders quickly being overwhelmed by gasping cries and soft moans.");
	output("\n\nThey’ll be fine.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

// Repeat Visits"
public function approachPexigaCrew():void
{
	pexigaMainScreen();
}

public function pexigaMainScreen():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("[pexiga.name] looks up at your approach, excitement glittering in her eyes.");
	processTime(1);
	pexigaMenu();
}

public function pexigaMenu():void
{
	//[Appearance] [Talk] [Milk] [Pet] [Fuck]
	clearMenu();
	addButton(0,"Appearance",pexigaBimboAppearance);
	addButton(1,"Talk",talkToBimboPexiga);
	addButton(2,"Milk",milkZePexigoo);
	addButton(3,"Pet",petDatPexiga);
	addButton(4,"Fuck",fuckThePexiga);
	addButton(14,"Back",crew);

}

public function pexigaBimboAppearance():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("Like all pexiga, [pexiga.name] is roughly humanoid, with two arms and two legs. Each hand only has two fingers and no thumb. Normally, her fingers would be topped by massive, rending claws, but hers have been filed down to mere nubs. She has no toes on her feet, just a soft, skin covering presumably used for swimming. Her chest bears a series of stripe-like bands made of a tough chitin that seems less like protection and more like decorative, exotic markings. She has a small, cute face with long, soft spines draped down her shoulders like hair.");
	output("\n\nAfter her exposure to Doctor Badger’s machines, however, [pexiga.name] has a few features quite different from others of her kind. Her blue scales have been bleached into a silver so bright that they appear white. Her once vestigial breasts have been inflated to massive, F-cup monsters. Plump, breeder’s curves give the alien girl a seductive allure that she hardly seems aware of.");
	output("\n\nA long tail with a spaded tip swings idly in the air, providing her both with a counterbalance and a flexible, arm-like appendage. Her wide, blue eyes flutter as she regards the world with enthusiastic curiosity and barely restrained hunger. Despite no longer needing it, she continues to wear the ring-gag Yammi originally fitted her with. A more recent acquisition, her excessively long, drooling tongue has been outfitted with a sizable, golden barbell piercing that serves as both translator and voice box for the otherwise mute girl.");
	pexigaMenu();
	addDisabledButton(0,"Appearance","Appearance","You’re looking at her appearance right now.");
}

//[Talk]
public function talkToBimboPexiga():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("Moving to her side, you draw the wandering gaze of your pet girl with a tender scratch under her chin. [pexiga.name] rises to a sitting position, her hands resting on her knees as she squats on her haunches, leaning into the caress. After a moment or two, you pull your hand away and ask her if she wouldn’t mind talking about herself a bit. <i>“Me?”</i> she asks in her saccharine, artificial voice, tilting her head to one side. She seems delighted to be addressed.");
	processTime(1);
	pexigaTalkMenu(talkToBimboPexiga);
	
}

//[Pexiga] [Yammi] [Gag] [Drool] [Chat]
public function pexigaTalkMenu(source:Function):void
{
	clearMenu();
	if(source == pexigaTalkAboutPexiga) addDisabledButton(0,"Pexiga","Pexiga","You just talked about that.");
	else if(source == pexigaYammiTalkGooo) addDisabledButton(1,"Yammi","Yammi","You just talked about that.");
	else if(source == pexigaGagTalk) addDisabledButton(2,"Gag","Gag","You just talked about that.");
	else if(source == pexigaDroolTalk) addDisabledButton(3,"Drool","Drool","You just talked about that.");
	else if(source == chatUpDatPexigaYooooo) addDisabledButton(4,"Chat","Chat","You just did that.");

	if(source != pexigaTalkAboutPexiga) addButton(0,"Pexiga",pexigaTalkAboutPexiga,undefined,"Pexiga","Talk to [pexiga.name] about her race.");
	if(source != pexigaYammiTalkGooo) addButton(1,"Yammi",pexigaYammiTalkGooo,undefined,"Yammi","Talk to [pexiga.name] about Yammi.");
	if(source != pexigaGagTalk) addButton(2,"Gag",pexigaGagTalk,undefined,"Gag","Talk to [pexiga.name] about her gag.");
	if(source != pexigaDroolTalk) addButton(3,"Drool",pexigaDroolTalk,undefined,"Drool","Talk to [pexiga.name] about her saliva.");
	if(source != chatUpDatPexigaYooooo) addButton(4,"Chat",chatUpDatPexigaYooooo,undefined,"Chat","Chat with [pexiga.name] about a variety of topics. Maybe you can help acclimate her to living as a sapient being.");
	addButton(14,"Back",pexigaMainScreen)
}

//[Pexiga]
public function pexigaTalkAboutPexiga():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("You figure it wouldn’t be a bad idea to find out a bit more about the pexiga race, especially from the only intelligent one in the galaxy. <i>“Do you remember much about your kind?”</i>");
	output("\n\nThe silver girl places one finger against her nose and nods enthusiastically. <i>“Oh yeah! We smell good, even in water. Um. And they’ve got sharps,”</i> she wiggles her fingers as if to brandish her phantom claws. <i>“Oh, and strong! Jump and pounce and swim good.”</i>");
	output("\n\nYou suppose it’s not that surprising that her memories of the bestial pexiga would be mostly sensory information. You push for a bit more: ");
	if(pc.isBimbo()) output("are the males hung? How long do they climax for? How does the cum taste? What about three ways?");
	else output("what about their civilization? Were they in packs? Do they mate in pairs or harems? Is there much difference between males and females?");
	output("\n\n[pexiga.name] blinks. <i>“Um... I dunno?”</i> She scrunches up her nose in thought. ");
	if(pc.isBimbo()) output("<i>“Some are pretty big, like... arm-sized? Most are smaller. Breeding is fun! Goes till everybody’s big and full of cummies and eggs. Mostly jus’ one big male with lotta mates, though smaller males sometimes sneak in for secret mating too. Cummies are so good! So sweet and warm and... thick... and...”</i>");
	else output("<i>“Not big groups. They were kinda mean. Lotta biting and clawing. Always hungry, too. Group mating for the strongest. That was fun. But afterwards, I got really sleepy for a really long time.”</i>");
	output(" Her gaze turns distant as she tries to pierce the mindless breadth of her time before the trip to Badger’s lab.");
	output("\n\nShe shrugs, her bare breasts bouncing from the motion. <i>“I dunno!”</i> she repeats with a giggle.");
	processTime(5);
	pexigaTalkMenu(pexigaTalkAboutPexiga);
}

//[Yammi]
public function pexigaYammiTalkGooo():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("You ask your pexiga what she thinks of Yammi, her former master and current employer. <i>“Miss Yammi’s real nice!”</i> [pexiga.name] lifts her head and sniffs the air, her tail thwapping against the ground. <i>“An she smells nice too. An tastes nice,”</i> the pexiga sighs, drops of saliva dribbling down her long, dangling tongue.");
	output("\n\nDidn’t Yammi say her kind were poisonous to most species? Curiously, you ask [pexiga.name] to elaborate. <i>“What does Yammi taste like?”</i>");
	output("\n\n<i>“Yammi is a swim person,”</i> she adds, unhelpfully. Noticing that you are still confused, she taps the ring gag in her mouth. <i>“Swim people are tasty,”</i> she clarifies with a blush at the confession.");
	output("\n\nAh, she’s got an affinity for seafood, it seems. No wonder she likes the sparadat’s taste: Yammi must be like a walking four-course dinner. Boy, that relationship just got a bit weirder.");
	output("\n\nTaking a different direction, you ask if she’s happy working in the kitchen. [pexiga.name] lowers herself to the ground, her tail slapping the ground back and forth playfully. <i>“Maybe,”</i> she teases, rolling onto her side and pawing ineffectually at her tendril-like tongue. Her tail, meanwhile, slides across her legs and gently strokes at the very fine slit of her groin. <i>“Wanna see how [pexiga.name] helps?”</i>");
	output("\n\nAs she plays with herself, you notice that the gap between her thighs seems to be widening as she shifts her long, curvaceous legs. Thick, clear fluid leaks from her mouth and trickles along her upper body, down to her hips. The flat, spaded tip of her tail gathers up the sugary drool and massages it into her silver scales, leaving her looking wet all over. Her broad fingers flick at her inverted nipples while she retrieves a bowl with her toeless feet.");
	output("\n\nPulling the burgundy plastic between her thighs, she leans forward, allowing the steady flow of saliva to rain into the container as she jills herself into a slavering mess. Blobs of fat, crystalline lubrication bubble from between her lower lips, and these too are transported into the bowl with the aid of her dexterous tail. In practically no time at all, the small basin has been filled to the brim with the pexiga’s fluids.");
	output("\n\nShe pauses, panting and all smiles while a small, steamy cloud rises from her supple body. <i>“Tasty,”</i> she insists, drawing her soaked tail across her tongue. You dip a finger in the bowl and give the warm fluid a lick, confirming to the sugary girl that it is indeed quite flavorful.");
	output("\n\n<i>“Tastes better with help,”</i> she teases, her big blue eyes full of a mischievous appetite.");
	//Player gains +5 lust
	processTime(10);
	pc.changeLust(5);
	pexigaTalkMenu(pexigaYammiTalkGooo);
}

//[Gag]
public function pexigaGagTalk():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("You have to admit, you’re a little curious why [pexiga.name] is still wearing that ring gag. She seems incapable of harming somebody else, beyond drenching their clothing in a thick layer of her endlessly dripping fluids. [pexiga.name] stares blankly at you for a minute before you take her hand and press it against the metal in her maw. <i>“Oh! Chewie,”</i> she coos, playfully gnawing at the gag a bit.");
	output("\n\n<i>“So, it’s not uncomfortable or awkward?”</i> you ask.");
	output("\n\n<i>“Nuh uh,”</i> she replies, shaking her head vigorously. <i>“It’s a gift from Miss Yammi! [pexiga.name] likes Miss Yammi. Also, before chewie I sometimes bit my tongue,”</i> she pouts, holding her hefty organ tenderly in both hands.");
	if(pc.isBimbo()) output("\n\n<i>“Oh, okay! Like, some people aren’t fans of bein’ sex objects or whatever. They’re like ‘blah blah don’t fuck everything that moves.’ It’s like they don’t even like sex or something!”</i>");
	else output("\n\n<i>“It’s just, for most people, wearing a sex toy all the time seems a bit weird or makes them feel self-conscious. Like, all they’re good for is sex. Mating,”</i> you clarify.");
	output("\n\n<i>“How come? Mating feels gooooood,”</i> she sighs. A thought strikes her. <i>“Oh! Did you want to mate my mouth?”</i> she asks hopefully. Her tail curls upward, stiffening at the prospect of a savage face fucking.");
	if(pc.lust() < 30) output(" Now’s not really the time for that, though.");
	else if(pc.lust() < 60) output(" Actually, it’s quite a tempting offer.");
	else output(" Your chest tightens and you’re tempted to jump her right now, but a long, hot sigh puts you back in control. Soon.");
	output(" Still, you kind of wonder how many of your crewmates would take up [pexiga.name] on a similar offer. Or already have, for that matter. You really ought to put cameras up in here.");
	processTime(13);
	pc.changeLust(2);
	pexigaTalkMenu(pexigaGagTalk);
}

//[Drool]
public function pexigaDroolTalk():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	//bimbo
	if(pc.isBimbo())
	{
		output("One thing that you always wondered: do pexiga like the taste of their own drool? It’s so sweet and yummy! If you had sugar drool, you’d be licking your own tongue all the time. Actually, if you were trying to taste your own tongue, would you taste the part being tasted or the part doing the tasting? How confusing! To avoid further headaches, you pose the question to [pexiga.name] instead.");
	}
	//non-bimbo
	else output("You ask [pexiga.name] about her strangely sugary saliva. For one thing, why is it so sweet? And, for that matter, does she mind being milked?");
	output("\n\n<i>“My tongue?”</i> she wiggles the drooping, tendril-like appendage. <i>“Yeah! Feels really nice when stroked. Or licked. Or sucked. Or-”</i> she goes on, shamelessly listing off all manner of creative ways to excite her fat organ, tail wagging vigorously.");
	output("\n\nYou notice something almost aggressive in her stance, like she’s getting ready to pounce. Suddenly it occurs to you that the sweet drool might be more than just a digestive aid. <i>“How do you use your tongue while hunting?”</i> you press.");
	output("\n\nShe swings her moist organ back and forth slowly, blobs of candy-scented saliva dripping onto the deck of your ship. <i>“I dunno,”</i> she responds with an amused demeanor.");
	output("\n\n<i>“Do you use it like a lure, attracting animals with the scent,”</i> you propose.");
	output("\n\n<i>“Maybe.”</i> She wiggles her bottom playfully.");
	output("\n\n<i>“Do you use it to hide your own smell as a kind of odor camouflage?”</i>");
	output("\n\n<i>“Maaaaaybe.”</i> She narrows her eyes and flexes the trills of her ears.");
	//merge
	output("\n\n<i>“Do you use it to-”</i> You’re cut off as [pexiga.name] pounces on you with startling speed. She tackles you and bears you to the ground in a breathless instant, her clawless fingers perched on your shoulders while her drool-dripping tongue slathers your face in a sugary slime.");
	output("\n\n<i>“If you wanna taste, just ask,”</i> she remarks as she tongue-bathes your face. The gooey fluid splatters and soaks your [pc.skinFurScales], coating you in her warmth. Every time you try to speak, she worms the tip of her member past your lips to flood your taste buds with fresh, sweet kisses. Your attempts to push her off only seem to excite the girl further, so you just let her saturate you in her semi-gelled saliva.");
	output("\n\nBy the time she’s done, you look like you’ve been drenched in glistening oil. The rich scent of sugary slime clings to your nostrils as you pull yourself up. You can’t help but lick your lips as you give the overeager girl a pat on the head.");
	//player gains +10 lust
	processTime(20);
	pc.changeLust(10);
	pc.energy(40);
	pexigaTalkMenu(pexigaDroolTalk);
}


//[Chat]
public function chatUpDatPexigaYooooo():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	var bimbo:Boolean = pc.isBimbo();
	if(bimbo) output("It’s important that [pexiga.name] learn some stuff so everybody knows how smart she is now. Who better to learn from than you?");
	else output("You take a few minutes to chat with your pexiga pet, walking her through some of the more complicated aspects of civilization as best you can. Her understanding is limited, but she’s at least attentive.");

	//Select a random chat each time
	var chats:Array = [1,2,8];
	if(annoIsCrew()) chats.push(3);
	if(bessIsCrew()) chats.push(4);
	if(celiseIsCrew()) chats.push(5);
	if(gooArmorIsCrew() || hasGooArmorOnSelf()) chats.push(6);
	if(reahaIsCrew()) chats.push(7);
	
	var selectedNumber:Number = chats[rand(chats.length)];
	
	//Chat 1
	if(selectedNumber == 1)
	{
		output("\n\nOn the off chance you’d like to take [pexiga.name] for walkies one of these days, it’s important she realize that she can’t just jump onto whoever she likes to taste or mate with them. The concept of personal space is utterly alien to her.");
		output("\n\n<i>“But, if I wanna mate, how come I can’t?”</i>");
		if(bimbo) output("\n\nWell, you can, but other people might try to stop you. Or, like, complain about how you’re getting cum all over their store.");
		else output("\n\nThere’s probably no point in trying to explain things like monogamy to this girl, so you try something else. <i>“In public, other people are watching, you see? They might be uncomfortable or jealous.”</i>");
		output("\n\n<i>“Why don’t they join in?”</i>");
		if(bimbo) output("\n\n<i>“Um. That’s a good question. Why don’t they join in?”</i> You rack your brain for an answer. <i>“Maybe they, like, are tired from just having sex?");
		else output("\n\n<i>“Well, they might not feel like mating.”</i>");
		output("\n\n<i>“How come?”</i>");
		if(bimbo) output("\n\n<i>“Oh, well, if you have a lotta sex, you can totally get tired. I practically pass out all the time!");
		else output("\n\n<i>“Well, they might not be aroused.”</i>");
		output("\n\n<i>“How come?”</i>");
		if(bimbo) output("\n\n<i>“Well, if at least one of you hasn’t passed out into a sex coma, you’re not doing it right.”</i>");
		else output("\n\n<i>“They might have different tastes or be in to other kinds of people.”</i>");
		output("\n\n[pexiga.name] mulls this over for a minute, her tail frozen in mid-swing. Her face lights up with realization. ");
		if(bimbo) output("\n\n<i>“So, if [pexiga.name] wants to jump everybody, I gotta practice mating till somebody turns off?”</i>");
		else output("<i>“Oh! That’s ‘cause I gotta wrestle ‘em down, right? Show ‘em how strong I am?”</i>");
		output("\n\n<i>“That’s... not exactly what I meant.”</i> With a sigh, you start over from the beginning.");
		processTime(5);
	}
	//Chat 2
	else if(selectedNumber == 2)
	{
		output("\n\n[pexiga.name] asks you about her vocal piercing. <i>“How come other people don’t have onna these?”</i>");
		output("\n\nYou explain that the golden barbell was built by Doctor Badger, and ");
		if(bimbo) output("she’s super busy thinking up new fun things for everybody.");
		else output("she doesn’t normally make helpful things for people.");
		output("\n\n<i>“But Miss Badger made this for me,”</i> she reasons. <i>“An she made the color ball that made me smart, right?");
		if(bimbo) output(" Did she originally make the color ball for somebody else?”</i>");
		else output(" Was that not a nice thing of her to do?”</i>");
		output("\n\nYou explain that the color ball was made to make people dumber; it just made [pexiga.name] smarter because she was already... well...");
		output("\n\n<i>“I was super dumb?”</i> she asks, wide eyes trained on you.");
		if(bimbo) output("\n\n<i>“Yup! Couldn’t even enjoy gettin’ groped by Yammi! It really sucked,”</i> you admit, sympathetically.");
		else output("\n\n<i>“It’s not exactly like that,”</i> you try to reason.");
		output(" <i>“Something in your ");
		if(bimbo) output("brain-meats");
		else output("biology");
		output(" just made you turn off. The ball turned you back on, is all.”</i>");
		output("\n\n<i>“What if I turn off again,”</i> she points out. <i>“Will I have to go back to the ball?”</i>");
		output("\n\nYou’re about to reassure her when you stop yourself. Actually, you’re not sure if that can happen or not. Can she go back to impassive and mindless? Did Badger’s tech rewrite her through and through?");
		output("\n\nNoticing your uncertainty and concern, [pexiga.name] scoots closer to you and rubs the soft spines of her hair against your [pc.skinFurScales]. <i>“Don’t worry, [pexiga.name] just won’t turn off,”</i> she reassures you.");
		processTime(6);
	}
	//Chat 3 (if player has Anno)
	else if(selectedNumber == 3)
	{
		output("\n\n[pexiga.name] falls quiet and fiddles with her tail’s broad tip a bit dejectedly. <i>“Something on your mind?”</i> you ask ");
		if(pc.isNice()) output("gently");
		else if(pc.isMischievous()) output("curiously");
		else output("absently");
		output(".");
		output("\n\nShe squeezes the finely scaled skin between her fingers and pouts. <i>“I wish I had a floofer like Miss Anno. So warm and fluffy!”</i> She raises her head and offers her tail to you. <i>“Can we trade?”</i>");
		output("\n\n<i>“I don’t think Anno would be okay with that,”</i> you respond with a small shrug. ");
		if(bimbo) output("<i>“If you wanted, though, I bet we could get a buttplug with a big ole ausaur tail attached to it.");
		else output("<i>“I mean, I don’t know if ausar gene mods would even work on you, but if you wanted a fluffy tail, we could-”</i>");
		output("\n\nShe vigorously shakes her head in rejection. <i>“No no! Not just any floofer! Miss Anno’s! It’s the best an’ softest.”</i>");
		output("\n\n<i>“Well, tails aren’t really the kind of thing you can just plug and play,”</i> you explain. <i>“I mean, you can’t pull off your tail, can you?”</i>");
		output("\n\n[pexiga.name] immediately tries tugging at her own tail, but her thumbless hands can’t get much in the way of a grip. After going at it for a minute, it begins to look as if she’s trying to stroke the thing to climax. Eventually she gives up. <i>“Nope,”</i> she reports back, <i>“can’t.”</i>");
		output("\n\n<i>“Well, there you go, then. She can’t take her tail off either. But if you ask nicely, she might let you play with it a bit.”</i>");
		output("\n\nYour pexiga nods enthusiastically and you can’t help but wonder if Anno’s gonna have the girl pulling at her tail for days.");
		processTime(5);
	}
	//Chat 4 (if player has bess.name)
	else if(selectedNumber == 4)
	{
		output("\n\nWhile talking to the silver girl, a thought strikes you. [bess.name] complained recently that [pexiga.name] had taken to licking [bess.himHer] when she thinks the bot’s asleep. It might be time to talk to your little beastie about personal space. <i>“Say, [pexiga.name], you haven’t been playing with [bess.himHer] recently, have you?”</i>");
		output("\n\nShe looks at you with wide eyes, trying to affect an innocent air. <i>“Who?”</i>");
		output("\n\n<i>“You know, the robotic " + bess.mf("boy","girl") + " with the silver skin? Glowing eyes? Has a name stamped on the backside?”</i>");
		output("\n\nShe glances down. <i>“Um.”</i>");
		output("\n\n<i>“It’s just that [bess.name] has been getting a lot of sugary drool on [bess.hisHer] butt at nights. Does anybody else on the ship have sugary drool?”</i>");
		output("\n\nThe pexiga blinks, gnawing on her ring-gag nervously. <i>“I dunno,”</i> she answers, noncommittally.");
		output("\n\nThis is getting you nowhere. Better to go with a more direct approach. <i>“[pexiga.name], why are you licking [bess.name]?”</i>");
		output("\n\nThe scaled girl plops down on her big booty and leans against one arm. <i>“[bess.HeShe] looks cold,”</i> she confesses. <i>“I was tryin’ to warm [bess.himHer] up.”</i>");
		output("\n\n<i>“That’s very considerate of you, but [bess.name] is a robot. [bess.HeShe] doesn’t get cold. Also, you should really ask people before licking them. Also, why only lick [bess.hisHer] ass?”</i>");
		output("\n\n[pexiga.name] glances away from you, her tail thumping the ground. <i>“I dunno.”</i>");
		output("\n\nHopeless. <i>“Just... just ask beforehand next time, okay? If you keep polishing [bess.hisHer] posterior at night, you’ll end up blinding us all with the mirror sheen.”</i>");
		output("\n\nTongue hanging out, she shrugs, but fresh globs of syrupy-drool start rolling down her mouth. She’s probably thinking of the synthetic " + bess.mf("boy","girl") + "’s rump right now.");
		processTime(6);
	}
	//Chat 5 (if player has Celise)
	else if(selectedNumber == 5)
	{
		output("\n\nThinking on how little she gets outside of the ship, you ask [pexiga.name] if she’s been having an okay time adjusting to things.");
		output("\n\n<i>“Uh huh!”</i> she agrees with a huge nod that sends her limp tongue slapping against the ship’s floor. <i>“Me and Missy go on missions!”</i>");
		output("\n\nMissy? Did you pick up a new crewmember somewhere along the line? <i>“Who?”</i> you ask the girl.");
		output("\n\n<i>“Miss Cee! She’s real nice.”</i>");
		output("\n\n<i>“Miss Cee? You mean Celise?”</i>");
		output("\n\n<i>“Yep yep yep! We explore an’ find fun stuff all over the place.”</i>");
		output("\n\nThis smells like trouble brewing. The last thing you need is two bimbos poking around your ship. In the best case, they’d just send goofy pictures of themselves to all your contacts. More likely, they’d get some fluids in the console and end up breaking something. <i>“That’s fine, but just stay away from the electronics, okay? We wouldn’t want your saliva getting anywhere delicate, would we?”</i>");
		output("\n\n[pexiga.name] seems a little confused. <i>“But Missy says she loves when I get my tongue in her delicates. She’s yummy, too. All salty.”</i>");
		output("\n\nThat little green galotian is such a bad influence. Still, better them playing with each other than playing with the ship’s controls.");
		processTime(4);
	}
	//chat 6 (if player has Nova)
	else if(selectedNumber == 6)
	{
		output("\n\n[pexiga.name] rolls onto her back and plays with her big, bouncy tits while the two of you are talking. <i>“Do you mate with Miss [goo.name]?”</i> she asks out of nowhere.");
		if(bimbo) output("\n\n<i>“Yup!”</i> you reply happily. <i>“Whenever I have a chance and when I’m not wearing her, ya know. Why do you ask?”</i>");
		else output("\n\nThat’s more probing than you’re used to from the carefree pexiga. A bit taken aback, you ask her what she means.");
		output("\n\n<i>“She’s so shiny all the time. I get shiny after mating, so Miss [goo.name] must mate a lot.”</i>");
		if(bimbo) output("\n\nGeez, that’s a good point. <i>“Maybe, um, maybe [goo.name]’s nano-ma-sheens fuck each other?”</i> To be honest, you’re not real sure how she works at all.");
		else output(" You explain that the nanomachine girl is made of metal, so she’s shiny all the time. It doesn’t have anything to do with sex.");
		output("\n\n<i>“What’s a nana sheen?”</i> the silver girl asks, eyes wide with wonder.");
		output("\n\n<i>“It’s like one robot made up of lots of tiny robots.”</i> Seeing that she doesn’t understand, you consider elaborating before just giving her a pat on the head. <i>“She’s like a liquid robot.”</i>");
		output("\n\n<i>“Oooooooooh.”</i> [pexiga.name] nods, sagely. <i>“She tastes funny, tho. Like tiny sparks.”</i>");
		output("\n\n<i>“Uh, maybe you shouldn’t give her too many kisses,”</i> you advise. With [pexiga.name]’s proclivity for licking harder than most people fuck, she might end up with more of [goo.name] in her belly than left on the ship.");
	}
	//chat 7 (if player has Reaha)
	else if(selectedNumber == 7)
	{
		output("\n\n[pexiga.name] squeezes her breasts studiously, examining her inverted, cyan nipples. First she tries one, then the other, to no effect. Huffing, she plops down in front of you and tugs your hand urgently.");
		output("\n\n<i>“How come I’m not leaking?”</i> she asks in a worried tone. As she asks, the steady pitter patter of drool rains down from her swinging tongue, providing evidence to the contrary.");
		output("\n\nYou assume she means leaking from her breasts, obviously. <i>“Well, you just aren’t producing any milk. I don’t actually know if pexigas lactate at all.”</i>");
		output("\n\n<i>“Aw,”</i> she whines. <i>“But Miss Rea leaks all the time! If I leaked from my boobies, I’d get twice the milkings!”</i> She gently pushes you, with petulant insistence. <i>“Make me leak?”</i>");
		output("\n\nLowering yourself to her level, you examine the silver girl’s breasts. Her teats have retained their dark blue coloration, but she seems to be lacking any actual nipple at their peaks. At first glance, they seem to be inverted, but when you poke at the slight indentation where they ought to be, you find tight holes instead of traditional nips.");
		output("\n\nSquirming under your examination, [pexiga.name] can’t help but lick her teased bosom, the tip of her tongue sliding inside of her dimpled nipple protectively. A thought strikes you and you reach the tip of your little finger toward a breast. With a little pressure, you push the digit inward and find the hole is quite deep. Moaning and whining, she gnaws at the gag in her mouth as you push deeper and deeper.");
		output("\n\nEventually, you feel moisture on your finger, so you pull back and find your pinkie covered in a thick, cream-colored substance. It smells faintly of vanilla and when you lick it, it tastes almost like pastry frosting. Baby pexiga must use their long tongues to get at their mother’s bounty, like hummingbirds licking up nectar from flowers.");
		output("\n\n<i>“Sorry, kiddo. I don’t think you’ll be leaking from there any time soon.”</i> You pat her on the head to comfort her, but apparently the nipple penetration made her forget all about her jealousy for Reaha’s bovine attributes. A blissed-out look of intoxicated delight is fixed on [pexiga.name]’s face and she hardly registers the world around her.");
		output("\n\nPerhaps you set off some memories of her pregnancy? You gently shake her back into awareness, just to be sure she’s not totally gone again. Blinking, she meets your gaze and licks your face. <i>“Hai hai,”</i> she chirps happily, apparently forgetting the entire conversation.");
		processTime(7);
		pc.changeLust(4);
	}
	//chat 8
	else
	{
		output("\n\nYou figure it wouldn’t hurt to spend a little time with [pexiga.name] and look at what she does all day. Leaning against one of the kitchen tables, you quietly just watch her patrolling Yammi’s kitchen. In the cook’s absence, the white-scaled girl seems lost in some imaginary hunt. She stalks slowly around on all fours, sniffing the air while her tongue experimentally tastes various objects.");
		output("\n\nYou’re tempted to break the silence, but she does first. <i>“Gotta protect territory,”</i> her piercing translates, the quiet, electronic voice seemingly startling the pexiga herself. <i>“Stupid tongue. Stop talking!”</i> She grabs for her moist organ with both hands, but reflexively yanks it away at the same time.");
		output("\n\nStartled, she narrows her eyes and raises her tail. Slowly she reaches out to bat at the gold piercing, but before she reaches it, her tail zips around and grabs her wrist. <i>“Attack!”</i> she cries out, descending into a flurry of limbs as she attempts to seize both her tongue and her tail at the same time. A silver ball of activity, she flops and leaps about, banging into cupboards, knocking over pots and pans, and spilling bowls filled with cooking ingredients.");
		output("\n\nStepping in before she wrecks Yammi’s kitchen entirely, you grab her tail in one hand and tongue in the other, hoisting them upwards and out of her reach. <i>“Woah, girl. That’s enough,”</i> you stress with a firm tone.");
		output("\n\n[pexiga.name] flips over onto her back and looks up at you with big, blue eyes full of innocence. Her tongue starts to wag back and forth while her tail curls around your arm affectionately. <i>“Hai hai,”</i> she giggles.");
		output("\n\nYou raise an eyebrow at the girl. Is she just trying to act like she didn’t do anything wrong, or did she actually forget that she nearly tore the room apart trying to chase her tongue and tail at the same time? Honestly, it’s as likely to be the one as the other.");
		output("\n\nYou plop her down and shake a finger at her by way of scolding the bimbo. Then you get out of there before Yammi comes back and discovers the mess!");
		processTime(5);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	pexigaTalkMenu(chatUpDatPexigaYooooo);
}

//[Milk]
public function milkZePexigoo():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("Patting [pexiga.name]’s head, you kneel down to eye level with the sitting girl. <i>“What do ya say to a little milking?”</i>");
	output("\n\nHer eyes light up, and her smile is obvious, even with the ring gag in place. <i>“Uh huh! Yay!”</i> Wagging her tail back and forth eagerly, she paws at your arm, eager to get started. Were you going to call for Yammi, or just take care of her yourself?");
	processTime(1);
	clearMenu();
	//[Yammi] [Solo]
	addButton(0,"Yammi",getYammiHelpMilkingPexiga,undefined,"Yammi","Milking someone like the Pexiga is definitely a two-man job.");
	addButton(1,"Solo",milkPexigaHandSolo,undefined,"Solo","Milk her by yourself.");
}

//[Yammi]
public function getYammiHelpMilkingPexiga():void
{
	clearOutput();
	showYammiAndPexiga();
	author("Adjatha");
	IncrementFlag("YAMMI_PEX_MILK");
	//first three times"
	if(flags["YAMMI_PEX_MILK"] <= 3)
	{
		output("With a call to your tangerine-skinned cook, you help [pexiga.name] onto one of the tables. A bit disoriented by the height, the silver girl peers over each edge in turn, looking back up at you a bit uncertainly. When you retrieve her bowl, however, she calms down and settles in the middle of the stainless steel. Yammi enters, dutifully snapping a pair of gloves in place and tying an apron around her waist to go with the bikini bottom she habitually wears.");
		output("\n\n<i>“No rest for the wicked, eh boss? And speaking of, how’s our girl doing today?”</i> She strokes her hands across the pexiga’s spine-hair and scratches under her trilled ears. The silver girl responds to the affection with happy squeals, leaning in to press against Yammi, pawing at the thick apron. You shoot the chef a curious look, but she sheepishly avoids your glance. <i>“That’s a good girl. Alright, get your bowl.”</i>");
		output("\n\n[pexiga.name] happily lifts her bowl up with both hands, perching it right below her breasts and cranes her head forward so that her tongue rests lightly across the full valley of her cleavage. Yammi produces a food pellet for the girl while you take hold of her hot, wet tongue. With slow, massaging strokes from the tip to the stem, you knead and caress the silky-smooth organ. Just as you reach the very top, Yammi plops a tablet into the O-ring around her mouth. With a gurgling gulp, the nutritional supplement disappears down [pexiga.name]’s gullet. <i>“Yum!”</i> the former predator coos, perfectly content to be hand-fed.");
		output("\n\nBlobs of clear gel ooze up from her maw, slowly dripping down her tongue even as you move your hands back down to start the process again. You can hear a distinctive pitter patter of liquid dripping down as her bowl starts to fill up with the sweet saliva. The more you stroke it, the more swollen her tongue seems to get, the infrequent droplets quickly multiplying into a steady stream of saccharine drool. Yammi continues to reward her each time with a pellet, but you notice that the pexiga’s tail has found its way under the sparadat’s apron. Yammi’s doing her best not to draw attention to it, but a blush finds its way to her cheeks all the same.");
		output("\n\n");
		if(flags["YAMMI_PEX_MILK"] == 1) output("When Yammi notices you looking at her, she slaps away [pexiga.name]’s tail. <i>“Hey now, let’s keep everything above board, huh?”</i> The pexiga looks disappointed but not discouraged. The chef takes the saliva-filled bowl away as her assistant showers your face with slurping licks. You can’t help but note that Yammi’s gait is wobbly as she’s stepping away, her thighs squeezing together more than normal. You even catch her dipping a finger into the bowl to sneak a taste. Always good to enjoy what you do for a living!");
		else if(flags["YAMMI_PEX_MILK"] == 2) output("By the time the bowl is full, your chef is panting harder than the pexiga. <i>“Um, good... good job everybody. I’ll uh... I’ll take that. Thank you, [pexiga.name]. Good girl.”</i> She retreives the bowl and turns aside to empty it into containers for future use. When her back is turned, you get full view of the orange girl’s posterior and can’t help but notice a thin trail of clear nectar leaking down her inner thighs. Her bikini bottom is absolutely soaked.");
		else output("Despite her best efforts, Yammi can’t help herself. <i>“Ooh yeah. Right there,”</i> she moans, wobbling in place. Her hands start shaking and the food canister in her hand slips from her grasp, spilling tablets everywhere. <i>“Y- yeah...”</i> she gurgles, oblivious to the mess. You’ve already stopped stroking the pexiga’s tongue, but she continues to drool all the same, quickly overfilling it. Sweet-scented saliva begins oozing over the sides, so you take the bowl from [pexiga.name]’s hands and set it somewhere a little safer. When you turn back to the table, you find your chef getting her neck polished by her assistant. The long, tentacle-like tongue traces gooey laps across the orange-girl’s collar in a decidedly hungry manner. Eyes closed, body trembling, Yammi’s hands find their way under her apron as well. They seem busy, so you head out after getting a good, long eyeful of the two.");
		processTime(20);
		pc.changeLust(5);
	}
	//4th time and on"
	else
	{
		output("It wouldn’t hurt to bring Yammi in for this again. After all, it IS her job. A call for the cook brings her into the kitchen almost immediately. Was she waiting just outside the door or something? <i>“Hey boss. Always happy to lend a helping hand,”</i> she announces briskly, stretching out her arms over her head. Before you can reply, you’re suddenly struck by the realization that she’s not wearing her normal apron. Or a top. In fact, if it weren’t for her bikini bottom and gloves, she’d be totally naked.");
		output("\n\n<i>“Yammi...”</i>");
		output("\n\nShe stops you before you can start. <i>“Oh! Right. Yeah, sorry about this. My apron’s being cleaned and, well, you know how messy this girl can get,”</i> she reaches down and helps [pexiga.name] up onto the steel table. <i>“No sense in ruining a shirt, huh?”</i> You turn to the silver girl, but she’s the picture of innocence, patiently waiting for someone to lay hold of her massive tongue.");
		output("\n\nThe sparadat’s pert breasts are pretty cute, so you suppose there’s no reason to push any further. Whatever’s going on between these two might seem a bit odd, but it’s good that they’ve got a working relationship, you suppose. You hand [pexiga.name] her bowl and begin milking her tongue as normal, coaxing fat dollops of sweet saliva from her with slow, smooth motions.");
		output("\n\nYammi provides the food pellets with each cycle, but rather than merely plopping them past the O-ring gag, she takes her time, reaching past the girl’s vaguely serpentine maw and pressing them against her tongue with the tenderness of a kiss. [pexiga.name] gulps down the tablets as eagerly as ever, but her hefty chest bobs up and down with panting breaths. Shamelessly, she coils her long, spaded tail around Yammi’s inner thigh, the tip of her appendage teasingly flicking across the puffy contents of the orange girl’s bikini bottom.");
		output("\n\nYou’re just about to stop, the bowl full nearly to the brim, when Yammi steps in, taking the fluid-filled container from the pexiga’s hands. Dipping a finger in and bringing it to her mouth, she sucks the gel-like slime, savoring the taste by twisting her digit between her pursed lips. <i>“Mmmm, not bad, but the second batch is always sweeter.”</i> She grabs [pexiga.name]’s tongue and dips it into the bowl, gathering up a load of goo. Leaning in, she uses the silver girl’s organ like a brush, slathering the clear, glistening fluid across her exposed tits.");
		output("\n\n[pexiga.name] makes a loud yummy noise, her tail uncurling just enough to let her tip reach up and under the bikini to the sparadat’s warm sex. Yammi takes a few more passes at using the other girl’s tongue to polish her exposed body, before [pexiga.name] giggles and takes her bowl back, upending the whole thing over Yammi’s head, coating her in crystaline drool.");
		output("\n\nThe chef gasps in mock outrage, knocking the bowl to the ground and climbing up onto the table herself. <i>“You little brat,”</i> she murmurs leaning in and grabbing her assistant’s head with one hand and over-filled bosom with the other. The two press tightly, kissing and caressing, sucking and licking, their trilled ears tucked down so they can only hear the soft sounds of their entwined bodies.");
		output("\n\nYou, it seems, have been completely forgotten. Rude.");
		processTime(20);
		pc.changeLust(10);
	}
	
	milkedPexigaCollect(true);
}

//[Solo]
public function milkPexigaHandSolo():void
{
	clearOutput();
	showPexiga();
	IncrementFlag("PEX_SOLOMILK");
	output("While it’s technically Yammi’s job, you really don’t mind lending a hand in the kitchen now and again. The beast-girl tries to climb up onto the stainless steel table, but as she lacks thumbs and claws, she scrambles helplessly against the smooth metal until you give her a helping hand. You fetch her maroon bowl while she sprawls out, giggling and kicking her feet over the edge playfully. When you return, her dexterous tail lifts the bowl out of your hands while wiggling her long, thick tongue eagerly.");
	if(flags["PEX_SOLOMILK"] == 1) output("\n\nIt occurs to you that she might not need the false pretense of feeding anymore. She’s plenty smart enough to feed herself now. And, after all, you can see the moisture glistening all along the girl’s hefty organ already. When you mention it to her, however, she makes a pouty face and flashes her big, blue eyes at you. <i>“Yummies? For [pexiga.name]? Pleeeeeeease?”</i> The girl just wants the added attention, you suppose.");
	output("\n\nYou run a hand down her soft hair-like spines and scratch under her chin before grabbing a sleeve of her food pellets and setting them down close at hand. She scampers up on all fours, positioning her head right above the bowl. Tail wagging in long, pendulous arcs, she squirms just enough to give her huge, wobbling breasts a little extra jiggle. With her tail raised, her booty thrust out, and her head low, she actually looks more like she’s presenting herself for mating, rather than milking.");
	output("\n\nWith a teasingly slow motion, you reach out to take her warm, wet tongue in one hand, while the other holds a food pellet between forefinger and thumb. Her huge, moist eyes focus on the treat, going cross-eyed when you place it gingerly on the bridge of her nose. The tip of her tongue curls, trying to get the snack, but your grip on the slippery organ is too firm to let it get away. In short order, however, the girl’s sticky-sweet saliva begins oozing out from her gag-gaped maw, a small rumble in her tummy telling you that the bait is working.");
	output("\n\nScrunching her nose, the cross-eyed girl loops her tail around, the spaded tip flicking the treat onto the flat of her tongue. A muscular motion sends the food tumbling into her mouth, provoking a satisfied <i>“Yummy!”</i> from the pexiga’s electronic translator. You boop her snoot, scolding her for taking the food before you gave her permission, but her tongue is still dripping like a leaky faucet, so you suppose there’s no harm done.");
	output("\n\nUsing both hands to wring out the fluid-heavy organ is a simple task. The bowl fills with her sugary drool as you pump her with long, slow strokes. The saturated muscle in your hands twitches and coils around your fingers, savoring your taste as her thick, gel-like slobber flows freely. Every so often, her piercing will attempt to translate her cooing purrs, but no language barrier can disguise the sound of a favored pet being doted on.");
	output("\n\nA steady dripping on the stainless steel distracts your attention from the task at hand. You check her tongue, but everything seems to be lined up with the bowl correctly. If it’s not the front, then it’s not hard to guess where the dripping must be coming from. Craning your head, you can see that her inner thighs are completely soaked with femme cum while yet more trickles from her puffy pussy in fat, blobby droplets. Even her normally too-active tail seems limp, feebly twitching at the paralyzing pleasure of your milking.");
	output("\n\nWhen the bowl is finally full, you release your grip on her tongue and [pexiga.name] slumps down at once, as if her spine had been turned to jelly. With shallow, panting gasps, she lazily licks at the stainless steel, trying to taste the flavor of your hands just a little bit more. You plop a couple more treats into her mouth for being so well behaved and give her a scratch right between the shoulderblades.");
	output("\n\nAnother job well done. Though, if [pexiga.name] likes your taste so much, you’ll have to be sure to keep away from feral pexigas.");
	processTime(22);
	pc.changeLust(5);
	
	milkedPexigaCollect(false);
}

public function milkedPexigaCollect(withYammi:Boolean = false):void
{
	if(pc.hasItemByClass(PexigaSaliva) || pc.hasItemInStorageByClass(PexigaSaliva))
	{
		pexigaMenu();
	}
	else if(!withYammi)
	{
		output("\n\nNot letting the sweets go to waste, you bottle up some of the excess saliva and stick it in your pack.\n\n");
		quickLoot(new PexigaSaliva());
		if(!withYammi) eventQueue.push(pexigaMenu);
	}
	else
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//[Pet]
public function petDatPexiga():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("What a difference from the poor thing she used to be. The bubbly girl’s full attention is on you, her huge blue eyes wide with love and happiness, even to just see you for a while. The least you could do is spend a few minutes giving her some scritches.");
	output("\n\nYou draw close and run your fingers through her spiny hair. [pexiga.name] gurgles through her ring-gag, swishing her tail across the deck as you massage her scaly scalp. <i>“Ooooh,”</i> she coos, leaning into your hand. The big piercing on her tongue swishes ever so slightly, and her doting expression shifts to something more flirtatious, her half-lidded eyes following you like a predator tracking prey.");
	output("\n\nYou smile and pat her head, telling her that she’s a very good");
	if(pc.isMischievous()) output("... milk-lizard-girl");
	else output(" girl");
	output(". She enthusiastically agrees by vigorously nodding her head. <i>“More,”</i> she encourages, pawing at you for additional attention, her thick tail absently caressing your [pc.thigh]. Helplessly, you go back to petting her, enjoying the trilling, alien purrs she produces with every touch.");
	output("\n\nBy the time your hands start getting tired, she’s finally ready to let you go. With a silken touch, she licks the side of your face, tail high and swinging. <i>“You’re my fave’rit,”</i> she confides, her booty wiggling. With a parting scratch behind a frilled ear, you slip out of the pantry and back to your business.");
	processTime(15);
	clearMenu();
	addButton(0,"Next",pexigaMainScreen);
}

//[Fuck]
public function fuckThePexiga():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("[pexiga.name] seems to be watching you with almost predatory eyes. Her normal ditzy demeanor has given way to a lean, hungry tension that has you firmly in her focus. The sweet scent of her body is heavy in the kitchen, heat rising from her haunches. She looks just about ready to jump you if you don’t make the first move.");
	output("\n\nWhat will you do?");

	pexigaSexMenu();
}

//[Facefuck] mouseover: Feed your pexiga a little extra protein.
//[Sandwich] mouseover: Get Yammi and [pexiga.name] to make a girl sandwich of your cock or strapon.
//[Eat Out] mouseover: Taste test [pexiga.name] with Yammi.
//[Bubble] mouseover: Use your Bubble Buddy to make [pexiga.name] a ball to play with.
public function pexigaSexMenu():void
{
	clearMenu();
	if(pc.hasCock() && !pc.isTaur()) addButton(0,"Facefuck",pexigaFacefuckRouter,undefined,"Facefuck","Feed your pexiga a little extra protein.");
	else if(pc.isTaur()) addDisabledButton(0,"Facefuck","Facefuck","There’s not an easy way to do this and keep control of the situation with your body type.");
	else addDisabledButton(0,"Facefuck","Facefuck","You need a penis for this.");
	if(pc.cockThatFits(yammiPlaceholderCapacity()) >= 0 || pc.hasHardLightStrapOn()) addButton(1,"Sandwich",sandwichSceneGogogogogogogogogogog,undefined,"Sandwich","Get Yammi and [pexiga.name] to make a girl sandwich of your cock or strapon.");
	else addDisabledButton(1,"Sandwich","Sandwich","You need a dick that will fit inside Yammi and/or the Pexiga OR a hardlight strapon for this.");

	//Eat Out
	addButton(2,"Eat Out",eatOutPexigoo,undefined,"Eat Out","Taste test [pexiga.name] with Yammi.");
	//Bubble
	if(pc.hasCock() && pc.hasItemByClass(BubbleBuddy)) addButton(3,"Bubble",blowBubblesWithpexiga,undefined,"Bubble","Use your Bubble Buddy to make [pexiga.name] a ball to play with.");
	else addDisabledButton(3,"Bubble","Bubble","You need a penis and a “Bubble Buddy” sex-toy in order to do this. Such toys are available from the TamaniCorp Vendor on Tavros Station.");

	addButton(14,"Back",pexigaMainScreen);
}

//[Facefuck]
//has dick, non-taur
public function faceFuckDatPexigaFaceRingGagThingMaybe(x:int):void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	if(pc.isBimbo()) output("Adorable! She thinks she’s hunting. But, like, there’s a very important difference between hunting and fucking. A teacher’s job is never done!");
	else if(pc.isNice()) output("It’s good to see her eager and raring to go, but you should probably take responsibility for her heat, rather than leave her to jump an unsuspecting Yammi.");
	else if(pc.isMischievous()) output("You know, it seems a waste to let that perfectly good ring-gag go unused. Surely you can think of some use for it...");
	else output("Best show this predator who’s the alpha around here.");
	if(!pc.isCrotchExposed()) output(" Without breaking eye contact, you strip out of your [pc.gear] in silence.");
	else output(" Without breaking eye contact, you swivel your hips to face her.");
	output(" [pexiga.name] watches, panting, while her tail waves back and forth in excitement. She scoots closer, sitting up and bracing her back against the solid, stainless steel table in the center of the kitchen. She sniffs the air to better get your scent and a low, rumbling purr vibrates through her silver scaled body.");
	output("\n\nBare and looming over the recumbant pexiga, you move forward until her face is level with your groin. The pexiga’s full, blue eyes don’t stray from yours, but her O-ringed head tilts back just slightly all the same. Huge tongue hanging limply from her maw, the beast girl’s hot, wet breath mists across your [pc.skinFurScales]. With both hands pressed flat against floor and her swollen F-cup breasts rising and falling with every quickening breath, [pexiga.name]’s translator chirps a single, teasing question: <i>“Snacks?”</i>");
	if(pc.isBimbo()) output("\n\n<i>“You bet! And it’s my favorite kind too,”</i>");
	else if(pc.isNice()) output("\n\n<i>“No, this is for a different kind of hunger,”</i>");
	else if(pc.isMischievous()) output("\n\n<i>“Nah, this time it’s a full meal,”</i>");
	else output("\n\n<i>“Only if you do a good job and suck like you mean it,”</i>");
	output(" you respond, lifting your slowly stiffening [pc.cock " + x+ "] to her gaping mouth and thrusting the semi-flaccid meat across her saliva-soaked tongue. Eagerly, she drives her head forward, swallowing your inches greedily. Her ring-gag makes the penetration all too easy, the beast girl’s soft cheeks");
	var length:Number = pc.cocks[x].cLength();
	if(length >= 6) output(" and pliant throat");
	output(" filling with your cockmeat until her nose is pressed firmly against your abdomen. The wet tightness of [pexiga.name]’s hungry mouth is made even more incredible by the huge, muscled tongue curling around the underside of your shaft. You buck in and out a few times, but she doesn’t so much as flinch, gulping down your length happily.");

	output("\n\nStiffening inside her softness, you pull back to rest your [pc.cockHead " + x+ "] against the curve of her salivating gob, almost completely stiff from a few thrusts into her ever-open fuckhole. ");
	if(pc.cockTotal() > 1) output("You give each shaft a turn, giving her more than a few pumps, letting her taste the fruit of your turgid loins, one by one. ");
	output("She leaves her hands pressed against the floor and relies on her tendril-like tongue, tilting her head back and forth to lap at your hardness as her sugary drool polishes your meat and drips across her heavy chest. Resting a hand atop the soft spines of her shoulder-length “hair,” you lightly guide her motions as she zealously services you.");
	output("\n\nThe over-developed taste buds on [pexiga.name]’s tongue are bumpy and slightly rough, even with a thick coating of oozing slaver. The muscled organ curls and whorls around your [pc.cock " + x+ "], spiralling and squeezing with each contraction.");
	if(length < 12) output(" Fully engulfed");
	else output(" With much of your cock engulfed");
	output(" in the pexiga’s coiled tongue, you bring your other hand around to hold her head firmly behind her ear-trills. ");
	if(pc.isBimbo()) output("Giggling");
	else output("Grunting");
	output(", you thrust forward, jamming your tongue-wrapped rod past the nearly too-tight ring and into her gurgling ");
	if(length < 6) output("mouth.");
	else output("throat.");

	output("\n\nThe added thickness is almost too much for her, the silver girl’s throat visibly distending as you pull her head down every inch of your straining shaft. Wincing at the suckling pressure, you put your [pc.hips] into it, thrusting into [pexiga.name]’s mouth harder and more aggressively. Her shoulders bang against the table, her tail twitches and curls in the air, but her palms stay firmly planted, without so much as a hint of discomfort. The pexiga’s pierced tongue tip waggles outside of the girl’s maw, stroking the base of your shaft");
	if(pc.balls > 0) output(" and the swell of your [pc.balls]");
	output(" with a metal solidity that sends goading prickles tingling through your fingertips.");

	output("\n\nClenching your teeth, you shift one trembling hand to grab the underside of the girl’s jaw and use the extra leverage to completely cut loose. Fucking her face with a bestial vigor, you slam into her with all the strength you can muster. The table she’s braced against sways and creaks with the intensity of your effort, while thick webs of gooey drool creep down her gag and splatter across her lower body like a translucent glaze. A knot of burning tension builds inside your chest as your muscles tighten with the raw physicality of your oral assault. ");
	if(pc.totalCocks() > 1) 
	{
		output("[pc.CumVisc] pre-cum leaks freely from your unengaged shaft");
		if(pc.cockTotal() > 1) output("s");
		output(", but ");
	}
	output("[pexiga.name]’s tongue acts like a cockring around your [pc.cock " + x+ "] -- the warm, suffocating pressure denying even the slightest release.");
	output(" And yet, she still maintains her blue-eyed gaze, looking up at you with a mixture of delight and adoration.");

	output("\n\nBetween the muscled coils of her massive tongue and the gulping contractions of her narrow throat, your throbbing girth is brought as close to its peak as you can bear. You manage to pull out, fighting against the ravenous grip of her maw with each reluctant inch and slowly uncoiling her saliva-soak organ from your swollen member. Confused and disappointed, the white girl nuzzles your straining length with the sides of her face, soaking herself with her own frothy drool in the process. ");
	if(pc.balls > 0 && length <= 12) output("With a few playful bats of your [pc.cockHead " + x+ "] against her cheeks, you press your [pc.balls] against the base of her tongue until she gets the hint and puts her sticky organ to work polishing your [pc.ballSack].");

	output("\n\nCock twitching and [pc.cumColor] pre-cum bubbling at your tip, you figure it’s about time to see how much this girl can take. You push her shoulders down until she’s got to tilt her head nearly all the way up to keep you in her sight. Placing your hands across her ear frills, you seize the sides of her head and lower your swollen shaft once more into her well-lubricated mouth. Holding her still, you pump in and out easily, manhood breaching her ring-gag all the way until your ");
	if(pc.balls > 1) output("tongue-bathed balls");
	else if(pc.cockTotal() > 1)
	{
		output("dangling shaft");
		if(pc.cockTotal() > 2) output("s");
	}
	else output("[pc.thighs]");
	output(" slap her chin. Slowly at first, your pace builds and builds until the moist slurp and meaty thwack of your rapid face fuck fills the kitchen.");

	output("\n\nHead bobbing between your hands, your pexiga smears her sloppy tongue across your ");
	if(pc.balls > 0) output("[pc.balls]");
	else output("inner thighs");
	output(" before circling around like a serpent hunting for a burrow.");
	if(pc.hasVagina()) output(" Lapping and licking, with a blind eagerness, she finds your [pc.vaginas].");
	else output(" Lapping and licking with a blind eagerness, she finds your [pc.asshole].");
	output(" The drool-greased organ slips in just as you hit your stride, a tremor of cold bliss radiating out from the back of your spine. You jam your [pc.cock " + x+ "] as deep as you can into the girl’s face, her throat bulging and spasming as it tries to swallow you in one gulp.");

	output("\n\nYour orgasm starts with a tight, clenching chill in your loins before the rest of your body catches up. Muscles pulled taut, [pexiga.name]’s head held tightly between your hands, you descend into a rapid series of extremely shallow thrusts that leaves her tail flicking wildly about. The silver-scaled girl draws her knees tightly together, toeless feet curled in tense focus. Even her hands give up their planted station, wrapping around your [pc.legs] to brace herself. Her eyes, however, never lose their laser-focus, watching every second of your climax with fawning gratification.");
	output("\n\nYou pull her head against your groin, burying every last inch in your pexiga’s salivating maw. You grip her so tightly, it feels like she’ll be leaving an imprint of her face against your abdomen. When, at last, the climax hits, you empty the liquid heat of your gushing bliss directly down her cock-stuffed esophagus. Gasping and panting with the trembling pleasure of your orgasm, ");
	if(pc.cumQ() < 200) output("you tweak her ears at every [pc.cumVisc] hot jet spurting down her throat. Just like when you milk her, the steady pulses activate her drool reflex and in no time both of your lower bodies are utterly soaked with saccharine saliva.");
	//large cum volume:
	else if(pc.cumQ() < 4000) output("you keep her head perfectly stationary as load after load geysers from your [pc.cock " + x+ "] directly into her belly. [pexiga.name]’s body shudders at the heavy heat filling her. She reaches up an unsteady hand to stroke her distended neck, marvelling at the girth inside her.");
	else output("you simply lean forward with relieved exhaustion as the endless reservoir of sticky seed flows in a torrential river past her gag, down her throat, and into her fattening gut. Her lean, curvy form swells as her stomach reaches capacity, the excess spunk flowing right back upwards to spill out of her O-ring and nostrils, utterly soaking the squirming girl in your [pc.cumNoun].");
	output("\n\nYou give her one last deep thrust, just to be sure she’s milked every drop, before finally pulling out. She lets out a satisfied <i>“muah!”</i> as your [pc.cock " + x+ "] comes free. [pexiga.name] lets out a long, deep gasp, like a whale breaching the surface, before tilting her head. <i>“Yummy! Can we do all snacks like that?”</i>");
	output("\n\nSomehow, you doubt Yammi would appreciate you turning the kitchen into [pexiga.name]’s personal fuck flat, but it’s a thought. Gathering up your [pc.gear] and giving the silver girl one more head pat, you elect to take your leave before somebody notices the dripping, sticky mess you’ve made of the place. <i>“Bai bai! More snacks soon please,”</i> she coos, swirling her tongue across bimbo-bloated tits, gathering the sugary slaver to better rub it all over her body.");
	if(silly) output(" It’s a good thing your ship can’t get ants, because this is how you get ants.");
	processTime(35);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Sandwich]
//has cock or strapon
public function sandwichSceneGogogogogogogogogogog():void
{
	clearOutput();
	showYammiAndPexiga(true);
	author("Adjatha");
	output("You fetch the sparadat cook for a little hanky panky. It doesn’t take much convincing, but she still protests playfully. <i>“I’ll have you know, I’m still not used to this,”</i> Yammi insists, with a slight grin.");
	output("\n\nYou don’t even bother retrieving [pexiga.name]’s drool bowl, ");
	if(!pc.isCrotchExposed()) output("stripping out of your [pc.gear] while ");
	else output("waiting patiently while ");
	output("your kitchen staff clears off one of the tables. ");

	var x:int = pc.cockThatFits(yammiPlaceholderCapacity());
	//Failsafe
	if(x < 0 && !pc.hasHardLightStrapOn()) x = pc.smallestCockIndex();
	var y:int = -2;
	if(x >= 0 && pc.cockTotal() > 1) y = pc.cockThatFits2(yammiPlaceholderCapacity());
	if(y <= -1 && x != -1 && pc.hasHardLightStrapOn()) y = -1;
	else if(y == -1) y = -2;

	//no dick, strap-on: 
	if(x < 0) output("While the other girls are busy, you wiggle into your strapon. Flicking on the power produces a flicker and hum as your hardlight phallus winks into place at the base of your abdomen. ");
	output("Your pexiga watches you approach her, lifting her arms so you can help her up. You can’t help but give her a little tickle, sending her tongue wagging wildly as she giggles and snorts in delight before scampering onto the stainless steel table.");

	output("\n\nYammi kicks off of her minimal clothing and jumps up next to her assistant easily enough, kicking her feet over the edge as her emerald lips purse with impatient sass. She grabs one of your hands and pulls it down between her thighs, running your fingertips across her firm clit and puffy vulva. [pexiga.name] notices and copies the motion, seizing your other hand and stuffing it down her soft mound.");
	output("\n\nPutting your fingers to work, caressing and tweaking sensitive and supple nethers, the girls start squirming in your grip. Yammi sighs warmly, biting her lower lip, while [pexiga.name] shudders in delight, her big blue eyes locked onto yours. Her tail sweeps across the table to her counterpart, curling around Yammi’s thighs before working its way up to the slight swell of her belly. Breathless, the cook raises a hand to stroke invading tendril, drawing it further up to her buxom breasts. The white-scaled spade at the tip of [pexiga.name]’s tail flicks and rubs Yammi’s stiff peaks, lightly and repeatedly slapping her full tits to make them jiggle continuously. The pexiga giggles at the simple amusement while Yammi rolls her eyes at the bimbo-brained beastie.");
	output("\n\nRather than subject your cook to further boob bouncing buffets, you grab hold of [pexiga.name]’s fat rump and roll her over, onto the sparadat. Breast to breast, the two girls pant, clutching at each other while you take a moment to enjoy their plump hindquarters. Yammi’s certainly no slouch in the ass department, but Badger’s cure has left [pexiga.name] with a rump that defies logic. Hefty globes of melon-sized flesh dwarf the cook’s booty, her posterior positively eclipsed by [pexiga.name]’s full moon.");
	output("\n\nWith both girls simmering, it’s about time you took their temperature. Pressing your [pc.cockOrStrapon " + x + "] against your crewmates’ asses, you swing your hips side to side, giving their jiggling rumps a good series of thwacks. ");
	if(x >= 0) output("As your meat stiffens,");
	else output("As your sextoy buzzes,");
	output(" you slide your hands between the girls’ legs, and pull them apart to expose their dripping pussies. A step forward presses your shaft");
	if(x >= 0 && pc.cockTotal() > 1) output("s");
	output(" against their warm, exhilarated bodies, flushed cheeks parting eagerly. The girls’ lower lips are puffy, glistening with anticipation as the cook and her assistant rub against one another.");
	output("\n\nWhile [pexiga.name]’s tail continues its sinuous exploration of the plentiful cleavage between the two, Yammi puts her hands to the task of guiding her stiff nipples against the inverted peaks of the girl on top of her. Rubbing vigorously, she grinds her chest into the bulging areolae of her assistant’s alien teats. Grinning, she teases the sensitive dimples topping the pexiga’s breasts. <i>“A critter without actual nipples to milk? Those New Texas jerks wouldn’t know what to make of you, would they?”</i> Yammi wonders aloud. [pexiga.name]’s reply is an indistinct and untranslatable gurgle as she wiggles like jelly at the relentless teasing of her most sensitive hollows.");
	output("\n\nThe silver bimbo, unable to take much more of Yammi’s docked nips, wiggles the tip of her tongue into the sparadat’s mouth, feeding her sugary saliva to the cook like a mother trying to feed her young. Apparently used to the taste, Yammi takes the thick organ easily enough, sucking at it as the slimy length glistens with moisture. The cook slurps up the sweet drool, letting it pool in her cheeks for a moment before taking a large gulp, her pupils dilating from the sugar high.");
	processTime(8);
	clearMenu();
	var args:Array = [x,y];
	addButton(0,"Next",sammitchYamiPexigaPart2,args);
}

public function sammitchYamiPexigaPart2(args:Array):void
{
	clearOutput();
	showYammiAndPexiga(true);
	author("Adjatha");
	var x:int = args[0];
	var y:int = args[1];
	output("While they play with their upper bodies, you satisfy yourself with their lower halves, tracing your thumbs across the girls’ thighs all the way up to their mounds. The stiffness of your [pc.cockOrStrapon " + x + "] throbs against their legs and, frankly, there’s no reason to hold back any further. ");
	if(pc.isTaur()) output("Careful not to step on the girls, you lift your forelegs to the table and step forward enough to bring the undercarriage of your lower body level with their frames. ");
	output(" With a ");
	if(pc.isTaur()) output("few stray, thrusting attempts");
	else output("guiding hand");
	output(", you slip the full length of your [pc.cockOrStrapon " + x + "] between the two girls");
	if(pc.cockTotal() > 1) 
	{
		output(" while you allow your other member");
		if(pc.cockTotal() > 2) output("s");
		output(" to press teasingly against their wobbling asses");
	}
	output(". The faint heat of the squirming girls seems to multiply once you’re squeezed between their bodies. The swell of their vulvas kiss the girth of your shaft like suckling lips. Their hips twist and grind, urgently stroking their stiff little clits against your hardness.");

	output("\n\nWhile they initially rub against you at different paces, a pair of stiff slaps on each girls’ buns is enough to bring them into unison. Yammi helps guide the pexiga’s hips as they rock against your loins squeezing and kissing your length eagerly. [pexiga.name] seems to be losing herself to pleasure as she leans in and jams inch after inch of her hefty tongue into Yammi’s mouth. Before long, the dutiful cook has more of the wet organ in her mouth than she can easily handle. Even the overly large gold piercing is forced into her cheeks, and if you didn’t know better, you’d swear she were trying to suck off a huge pair of nuts.");

	output("\n\nYammi grinds against both your ");
	if(x < 0) output("hardlight ");
	output("cock and [pexiga.name]’s breasts as her mouth fills, having difficulty focusing on both tasks at once. Eventually, she gives up trying to keep up both paces and grabs her teats between her forefingers and thumbs. While she squeezes and pinches herself, the sparadat presses her pinkie fingers into the pexiga’s narrow nipple-holes. The silver-scaled girl yipes at the penetration. Reacting as a bimbo would, she reaches a two-fingered hand down between the sandwich of the girls’ abdomens to stroke needfully at your crest. She whines as she fingers the crest of your [pc.cockOrStrapon " + x + "], so close to her hot pussy and yet so far away.");

	output("\n\nYammi manages to swallow the rest of her assistant’s absurdly long tongue, raising her head and locking her jade lips against the silver girl’s ring-gag in a sloppy kiss. The cook’s cheeks quickly fill with saliva and, unable to swallow quickly enough, thick beads of the saccharine goo flow down her chin and across her bobbing throat. With Yammi drinking her fill and [pexiga.name] whining like a bitch in heat, you figure these two have earned a their dessert.");

	output("\n\nDrawing back, you brace at the sopping wetness of their cunts with swollen anticipation before thrusting forward. Your [pc.cockOrStrapon " + x + "] slides into [pexiga.name], parting her moist folds with avid delight. She gurgles and trembles, her overwrought body hitting its climax from the mere act of penetration. Her body clenches down, but not so tightly you can’t make steady progress with each shallow thrust deeper into her taut womanhood. The shudders of ecstasy rob her body of the ability to do much but hug Yammi tightly, cumming her bimbo brains out all over the sugar-swollen cook.");
	if(x >= 0) pc.cockChange();

	if(y < -1) output("\n\nYammi tries to say something, but her words are muffled by nearly a foot and a half of pexiga tongue filling her ballooned cheeks. You assume the sparadat’s comment had something to do with disappointment at being left out. Only one fix for that, you figure, pulling out of the silver girl and jamming your length into the orange one in a single stroke. The sparadat is sopping wet, so between her natural lubrication and the fluids borrowed from her assistant, your [pc.cockOrStrapon " + x + "] slides past her folds easily enough. After a few pumps, you trade places, back into the pexiga. Back and forth, you rock between the girls, a sticky web of their shared femme cum splattering across the table and floor with every thrust of your unyielding member. You reach down and give both girls a scratch behind their trilled ears. It’s good to see your crewmates working together so well!");
	else output("\n\nYammi tries to say something, but her words are muffled by nearly a foot and a half of pexiga tongue filling her ballooned cheeks. You assume the sparadat’s comment had something to do with disappointment at being left out. Eager to fix this, you brace a second member against her eager orange slit and thrust into her as well. Yammi’s sopping wet as you hammer into her, the force of your insertion catching her by surprise. She hacks and twin streams of the pexiga saliva in her mouth spurt up and out of her nostrils instead. Blinking rapidly and wiping the sticky goo from her face, she shoots you a glance before pounding back against you with equal vigor. She’s probably gonna make you pay for that one later, but for the time being she seems content to just ride your shaft for all she’s worth. You reach down and give both girls a scratch behind their trilled ears. It’s good to see your crewmates working together so well!");

	//1+cocks:"
	if(x >= 0) 
	{
		output("\n\nYou lose track of time as your [pc.hips] slam against the girls’ rumps, fucking deeper and deeper until the allure of release grows heavy in your gut. The alien sluts writhe atop each other as you go, gasps and moans smothered by their wet, slippery kiss. Soft, pliant heat suckles at your loins while you buck into them with quick, shallow smacks. Yammi’s tummy has swollen a bit from all the saccharine fluid filling her while [pexiga.name] vacantly stares off into space. The weak, blissed-out shudders trembling along your [pc.cockOrStrapon " + x + "] tells you that they’re ready for their cream filling.");
		output("\n\nWith swift, savage thrusts that leave the table creaking and swaying, your orgasm breaks past your abandoned restraint. Globs of spunk spurt into the girls, ");
		//1 dick:
		if(x >= 0 && y < 0) output("first your cook, then her assistant as you share the load between them, ");
		output(" their suckling depths squeezing each load from you hungrily. They quake at their shared, tightening pleasure, both pairs of ankles locking around your [pc.ass]. Rippling waves of contracting pussy muscles wring your orgasm for all it’s worth, [pc.cumVisc] cream gushing into both girls.");
		if(pc.cumQ() < 500) output(" Before long, you’re completely drained, fattening seed deep inside your kitchen staff. The wet grip of [pexiga.name]’s cunny still sending tender shivers from your clenching loins up to your spine.");
		//very high cum volume: 
		else output(" The early trickles become ample gouts of hot seed, flooding into your kitchen staff. The bloating swell is too much, however, and each subsequent twitch from your groin sends sticky ropes of [pc.cumColor] spurting from their puffy lower lips. Jizz splatters around the kitchen in wild spree, leaving the orderly stainless steel chamber an utter, dripping mess.");
	}
	//Strapon"
	else
	{
		output("\n\nYou lose track of time as your [pc.hips] slam against the girls’ rumps, fucking deeper and deeper. The alien sluts writhe atop each other as you go, gasps and moans smothered by their wet, slippery kiss. Soft, pliant heat suckles at your hardlight phallus while you buck into them with quick, shallow smacks. Yammi’s tummy has swollen a bit from all the saccharine fluid filling her while [pexiga.name] vacantly stares off into space. The weak, blissed-out shudders trembling all the way up to your clenching loins tells you that they’re ready for one last push.");
		output("\n\nWith swift, savage thrusts that leave the table creaking and swaying, you abandon all restraint. Hot beads of sweat drip across your brow and down your [pc.chest] while warm excitement trickles across your [pc.thighs]. The girls spurt their helpless femme cum onto your artificial cock, suckling depths squeezing the hardlight so fiercely you’re afraid they’ll break the toy! They quake at their shared, tightening pleasure, both pairs of ankles locking around your [pc.ass]. Rippling waves of contracting pussy muscles stroke your [pc.cockOrStrapon " + x + "] for all it’s worth, honeyed bliss creaming from both girls.");
	}
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",sammyYammiEpilogue,args);
}

public function sammyYammiEpilogue(args:Array):void
{
	clearOutput();
	showYammiAndPexiga(true);
	author("Adjatha");

	output("You slam extra hard into the girls one last time and survey the state of your crewmates. [pexiga.name] seems to finally have been worn out, her tail limply hanging over the edge of the table as she lays on top of the sparadat. Yammi’s body seems to be slightly vibrating and her expression is nearly as vacant as the pexiga’s. Her tummy is swollen from the sugary alien’s deep-throating kiss");
	if(args[0] >= 0) output(" while cum drools out between her legs");
	output(". You withdraw, ");
	if(pc.isTaur()) output("lowering your upper half from the table, ");
	output("and shake off the residual tremors of tender passion with a heavy sigh of contentment before turning back to your smiling, panting bimbo.");

	output("\n\nYou take a step aside and nearly drop. It seems the two took nearly as much out of you as you did from them! Sliding to the floor, you take a moment to let your heart rate settle down and let your head stop spinning. Eventually, you rise again");
	if(!pc.isCrotchExposed()) output(" and locate your [pc.gear]");
	output(". Both girls seem to have fallen asleep, still locked in their hugging embrace and content to lay in the sticky warmth of their afterglow.");

	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Eat Out]
//all PCs"
public function eatOutPexigoo():void
{
	clearOutput();
	showYammiAndPexiga(true);
	author("Adjatha");
	output("You eye the booty-wiggling beastie as she sizes you up, blunted claws clacking on the kitchen floor like the tick of a time bomb. Although you doubt she’d do much more than tackle you, some remnant of her savage instincts seems to still lurk under her fawning demeanour. Best not to turn your back to her when she gets like this. Besides, big girls like [pexiga.name] need regular exercise.");
	output("\n\nWithout breaking eye contact with your pexiga, you call out for Yammi. <i>“What’s up, boss?”</i> the orange-skinned cook asks, poking her head into the kitchen. Noticing the silver-scaled bimbo’s hungry posture, Yammi leans against you with her elbow on your ");
	if(!pc.isTaur()) output("shoulder");
	else output("flank");
	output(". <i>“I guess a little more team-building couldn’t hurt,”</i> she murmurs.");

	output("\n\nThe pexiga’s ear frills trill as she paces up to the two of you, planting herself at your feet and sitting upright, expectantly waiting. You take one arm while Yammi takes the other, hoisting the beast girl up and onto the large, stainless steel table. Her tail slides up, along her pale legs and belly while her tongue writhes across bimbo-sized breasts. [pexiga.name] tilts her head to one side and glances back and forth between the two of you. <i>“Head or tail?”</i> she offers, the electric voice of her translator even managing to put a frisky tone to the question.");
	output("\n\n<i>“Got a preference?”</i> Yammi asks as you move behind her, sliding your hands up her hips and along the smooth, orange skin of her waist. Rather than reply, you slowly trace your fingertips along her spine, one going up to lift the apron from her neck while the other travels south, tugging softly at her bikini bottom. She shivers at your explorations, pushing her curvaceous booty up against your [pc.groin].");
	output("\n\nCrossing her arms under her breasts, the sparadat looks back at you over her shoulder. <i>“Why " + pc.mf("Mister","Miss") + " Steele, can’t you see I’m preparing dinner? If you keep those hands going, I’ll never finish my pexiga cookbook.”</i> She wiggles her sizable rump as you slide her tight-fitting bottom off");
	if(!pc.isCrotchExposed()) output(" and returns the favor by pulling your [pc.gear] off, piece by piece");
	output(". <i>“Or maybe you’re just fishing for a co-author credit,”</i> she teases.");

	output("\n\nWhen the three of you are completely bare, you turn on the reclining pexiga. You’re about to ask Yammi which end she prefers, but you can tell at a glance she’s entirely preoccupied by her assistant’s huge, thick, muscular tongue. Shrugging, you guide [pexiga.name] to lay down on her back along the short side of the table, letting her head and legs dangle off of either side. Yammi moves inches from the white girl’s face, reaching down to stroke her soft, hair-like spines and scratch behind her frilly ears.");

	processTime(15);
	clearMenu();
	addButton(0,"Next",eatOutPexigoo2);
}

public function eatOutPexigoo2():void
{
	clearOutput();
	showYammiAndPexiga(true);
	author("Adjatha");
	output("Taking your spot between the silver girl’s legs, you run both palms up and down the thick inner thighs, dragging your nails across soft, finely scaled skin. [pexiga.name] purrs with delight, arching her back slightly, putting her overfilled F-cups on wobbling display. <i>“He heh that tickles!”</i> the gold piercing giggles, her tail curling around one of your arms and pulling it further up her torso. <i>“These are more fun,”</i> she insists, guiding your hands to her massive breasts and cupping her own fingers down atop yours. Sinking your fingers into the yielding expanse of the giggling pexiga’s chest, you squeezes each in turn. Pinching the puffy areola between your thumbs and forefingers, you caress and massaging the cyan-tipped orbs as she sighs and strokes your [pc.skinFurScales] with the warm flatness of her spaded tail.");
	output("\n\n<i>“How ya doing there, girl?”</i> Yammi asks, fingering the circumference of the pexiga’s ring-gag. <i>“Getting nice and worked up?”</i> she remarks, eyeing the sinuous path of [pexiga.name]’s tongue as it weaves and curles through the air, like a charmed serpent. Beads of drool dribble down and for a moment, the cook seems to debate grabbing the bowl for a quick and easy milking session. <i>“Though,”</i> she whispers, biting down on her lower lip, <i>“be such a shame to let this girl off without a few chores...”</i>");
	output("\n\nReaching down to stroke her palm across her cheek, Yammi steps forward, bringing her excitement-slick pussy level with the girl’s wandering tongue. [pexiga.name] doesn’t disappoint, immediately setting to the task of exploring the sparadat’s slit with all the single-minded delight you’d expect of the animalistic nympho. As thick as a hand, her tongue slides along the cook’s cunny with slow satisfaction, as if tasting a savory meal. The textured surface rubs warm gel-thick saliva across tangerine curves, letting her hefty barbell piercing part her boss’s lower lips with each pass.");
	output("\n\nAs Yammi breathes a sigh of enjoyment, you turn your attention to the alien close at hand. ");
	if(!pc.hasKnees()) output("Lowering yourself");
	else output("Dropping to your knees");
	output(", you hoist the pexiga’s toe-less feet up over your shoulders. She hooks her heels around your back and you’re obliged to hold her toned thighs apart with both hands as she tenses up. Leaning forward, you bury your head in her pleasantly plump loins, licking the sweet girl’s tension away in moments. With small, nibbling bites, you tease the fine scales of [pexiga.name]’s puffy vulva until the tender flesh is swollen with anticipation. Using both thumbs, you pull the meaty lips apart to expose the glistening, cobalt clitoris within. The tiny blue pearl stands no chance against your [pc.tongue]’s onslaught, [pexiga.name] letting out a vulnerable whine. Her knees go wide as her heels press the back of your head tightly against her bliss button, hips rocking in time to your pace.");
	output("\n\n<i>“Woah!”</i> Yammi gasps, bending over to grab onto [pexiga.name]’s shoulders. She wobbles, finding it difficult to stand as her assistant’s tongue is driven to ever deeper explorations by your cunny-hungry kisses. The massive piercing, with its huge, golden orbs, slams against the sparadat’s quivering slit, but is far too large to just slide in. <i>“T-take it easy,”</i> the cook weakly demands as the metal rubs against her sensitive clit, her assistant whimpering with overflowing, carnal lusts. <i>“S-stop trying to s-shove that thing in me,”</i> Yammi insists, without the faintest trace of sincerity.");
	output("\n\nTrying her best to drink from the coral girl’s innermost depths, [pexiga.name] draws back and tries again and again, buffeting her handler’s joybuzzer relentlessly. <i>“It won’t go in,”</i> Yammi mumbles a second before her eyes go wide. A shudder ripples through her and across the pexiga’s body all the way to your tongue. Your intuition tells you that despite the cook’s commentary, [pexiga.name] made it fit.");
	output("\n\nYammi collapses atop [pexiga.name]’s upper body, burying her face between the silver bimbo’s breasts and tightly wrapping her arms around the other girl’s waist. She tries to speak, but the trembling just keeps getting stronger, a bit of drool leaking out of her mouth and onto [pexiga.name] for a change.");
	processTime(15);
	pc.changeLust(5);
	clearMenu();
	addButton(0,"Next",eatOutPexigoo3);
}

public function eatOutPexigoo3():void
{
	clearOutput();
	showYammiAndPexiga(true);
	author("Adjatha");
	output("You can only chuckle as your cook climaxes uncontrollably into her assistant’s buzzing translator. While nibbling, licking, and sucking on [pexiga.name]’s sapphire pearl, you slide a pair of fingers into her trembling depths. Parting the slick folds with a few slow strokes, you slip in a third, then a fourth. Her inner passage seems just like the rest of her body: well toned muscles under copious layers of slutty bimbo padding. She squeezes your fingers, sucking at them with flexing rings of taut pussy flesh that leaves your knuckles aching.");
	output("\n\nRaising your lube-slick fingers to your lips, you lick the pexiga’s liquid lust from your fingers, one by one. There’s something exhilarating in the silver girl’s flavor, a taste that leaves a tingling numbness on your lips and a surging warmth that accelerates your breathing. It might be a mild narcotic, for all you know, but you’re sure of one thing: you want more. Moving both thumbs to worry [pexiga.name]’s swollen clit, you press a deep kiss right on her puffy pussy lips, breathing in her wild scent.");
	output("\n\nThe silver girl clenches her thighs around your head, her heels battering your back as she kicks and squirms in moaning delight. The pressure on your temples is incredible and, in reflex, you bite down on her fat, white vulva, your teeth clenching hard enough to leave an imprint. She responds immediately, easing up on her tension and sliding forward, pressing her loins against your nose as if in apology. She tries to say something, but her gold voice spheres are presently inside Yammi’s creaming cunt and whatever [pexiga.name] had to say is drowned out by the cook’s peaking wail of climactic ecstasy.");
	output("\n\nWhile Yammi fiercely hugs herself against the pexiga’s invasive tongue, you hoist your pet’s legs up to get a better angle at her vulnerable depths. Mouth buried in [pexiga.name]’s slit, your [pc.tongue] flicks up and down the petals of her inner labia, lapping up the girl’s glistening excitement. Deeper and deeper, you plunge into her vagina, tickling her womanhood with rapid strokes. As her inner muscles begin clenching, you slow your pace, pressing the tip of your moist organ against her folds before dragging back toward her torrid entrance.");
	output("\n\nA shiver starts in the silver girl’s tail, working its way up to her plump booty and across her full, creamy hips. Her legs lift off of your shoulders and tense, the toeless tips of her feet curling tightly. Her hips vibrate and her back arches, forcing another inch of your [pc.tongue] deeper into her gushing cavity. A needful moan filters up from the girl’s throat, like the cry of an animal in heat. Tail lashing wildly back and forth, she practically vibrates against your face for several seconds, enraptured by your lust-drunk thirst.");
	output("\n\nThe pexiga cries out, her translator sending its voltaic impulses right into Yammi’s stuffed cleft, up her spine, and into her head. The sparadat’s body tenses, every muscle clenching in unison as the cascade of orgasms reaches it crest. You spare an upwards glance and notice her pupils contracting to pinpoints. She remains frozen in place before slowly sliding off of the silver girl, sinking to the ground and dragging [pexiga.name]’s tongue with her.");
	processTime(15);
	pc.energy(50);
	pc.changeLust(5);
	clearMenu();
	addButton(0,"Next",eatOutPexigoo4);
}

public function eatOutPexigoo4():void
{
	clearOutput();
	showYammiAndPexiga(true);
	author("Adjatha");
	output("Pulling back from the pexiga’s pussy, you move to Yammi’s side to make sure she’s alright. Her breathing is shallow but steady and while her scarlet eyes don’t seem to respond to light, a faint mumble of wordless bliss gurgles up from her emerald lips. Still on the table, [pexiga.name] looks at you with a glance of panting helplessness. She tries to tug her tongue free, but the hefty piercing inside the orange cook is far too large for the clenching girl’s overwrought pussy to release. In all likelihood, she’ll be stuck there until Yammi comes to.");
	output("\n\nSeems a shame to leave them like this, but there’s nothing you can do for your crewmates right now. Maybe they’ll learn a lesson on limits, you muse, licking the pexiga’s heady flavor from your lips.");
	processTime(3);
	pc.energy(33);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Bubbles]
//requires Bubble Buddy and a dick"
public function blowBubblesWithpexiga():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("As your heart rate climbs in the face of the pexiga’s predatory arousal, a thought strikes you. ");
	IncrementFlag("PEXIGA_BUBBLE");
	if(flags["PEXIGA_BUBBLE"] == 1) output("<i>“[pexiga.name], where do you sleep?”</i>");
	else output(" <i>“[pexiga.name], do you still have that bubble I left you?”</i>");

	//first time
	if(flags["PEXIGA_BUBBLE"] == 1) output("\n\nThe silver girl pauses mid-pounce and blinks in confusion. She slinks to the blue lit backroom where you first found her and pulls open the door with her tail. The room is small and slightly chilly. Yammi seems to be storing various ingredients on high shelves while the floor has been set aside for the pale-scaled bimbo. A collection of scavenged blankets forms a crude though fluffy bed, but otherwise her lodgings are bare.");
	//repeat:
	else output("\n\nThe silver girl pauses mid-pounce and dips her tail in embarrassment. You open the door to her makeshift kennel and aren’t terribly surprised to see the tattered remnants of a Bubble Buddy sheath pushed to one corner. You’d think between declawing her and putting a ring gag in her mouth, she’d have a lot harder time popping those things.");
	//merge"
	output("\n\nClosing the door, you turn back to [pexiga.name] who has risen to a sitting position. <i>“Not sleepy,”</i> she insists, tail flopping back and forth on the ground.");
	output("\n\n<i>“Maybe not, but ");
	if(pc.isNice()) output("I like to make sure all my crew are well cared for.");
	else if(pc.isMischievous()) output("I think your room could use a more personal touch.");
	else output("you might need a rest after we’re done here.");
	output(" How about we make a pillow for you?”</i>");

	output("\n\nProducing your Bubble Buddy provokes an immediate reaction. Her face curls in a goofy grin and she claps her hands, bouncing up and down on her bubble butt. <i>“Yay! Toys!”</i> She lunges forward to grab it out of your hand, forgetting that she’s got a gag on and headbutting your hand instead.");
	output("\n\n<i>“Woah, girl. Have a little bit of patience,”</i> you scold. [pexiga.name] is having none of it, however");
	if(!pc.isCrotchExposed()) output(", and has already begun working off your [pc.gear]. Though clumsy, she uses her tongue, tail, and all four fingers in concert to eventually strip you bare");
	output(". Wrapping her palms across your [pc.hips], she pushes herself up, under you, using the top of her head as a pedestal for your [pc.groin].");

	output("\n\nRolling your eyes at the bimbo’s antics, you back up slightly, letting your [pc.cocks] drape in front of her. Your body stiffens slightly at the feel of her hot breath on [pc.oneCock]. Needing no further guidance, the beast girl puts her tongue to the task of polishing your pole");
	if(pc.cockTotal() > 1) output("s");
	output(" with single-minded enthusiasm. Slurping and smacking, the drool-dripping organ slides along your thickness with hungry strokes, her head bobbing back and forth to tease your [pc.cockHeadBiggest] with the heat of her ever-gaping mouth.");

	output("\n\nGrowing harder with each passing moment, you’re tempted to just let her keep up her cock-thirsty adoration, but the squishy toy in your hand reminds you to stay focused. Reaching down to push [pexiga.name]’s mouth away for a moment, you slide the Bubble Buddy onto your [pc.cockBiggest]. The bleached pexiga watches the pliant, purple sheath stretch over your shaft and snakes her tongue out to curl around its base.");
	output("\n\nYou shiver at the tight grip of her oral organ and roll your shoulders with a shuddering sigh. Well, at least it won’t fall off mid-pump! [pexiga.name] rises to a kneeling position, tracing her thick, clawless fingers over the plump pocket pussy on your member, tilting her head left and right as she plays with the ");
	if(flags["PEXIGA_BUBBLE"] == 1) output("unfamiliar ");
	output("toy.");

	//Taur body"
	if(pc.isTaur()) output("\n\nThe bimbo’s huge, wobbling chest presses up against your crotch as she absently sways, mesmerized by the Bubble Buddy. Careful to avoid her tail, you trot forward, pushing your tongue-wrapped cock between her heavy, silver breasts. Biting your lower lip, you flex the muscles of your hind legs, squeezing her tits between them as you do so. The two of you gasp in unison as her jiggling orbs form a supple seal around the throbbing organ within them.");
	//Non-taur body"
	else output("\n\nThe bimbo’s huge, wobbling chest presses up against your crotch as she absently sways, mesmerized by the Bubble Buddy. Tracing your fingertips down her jaw, you push your hips forward, guiding your tongue-wrapped cock between her heavy, silver breasts. Biting your lower lip, you lean forward and press your hands on either side of her pale melons, squeezing her tits tightly between your palms. The two of you gasp in unison as her jiggling orbs form a supple seal around the throbbing organ within them.");
	//merge"
	processTime(15);
	clearMenu();
	addButton(0,"Next",bubbleBuddyPexiga2);
}
public function bubbleBuddyPexiga2():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("Holding tight, you move slowly at first, sliding up and down her cleavage. <i>“Mai tong fels funni,”</i> she mumbles, her piercing muffled by the girl’s own thick titflesh. She pants, her thighs squeezing against one another as she adjusts to the stimulation. The pexiga’s tongue seems nearly as affected by the pressure of her breasts as your [pc.cockBiggest], swelling with each slow motion. Her body trembles as the thick glaze of her drool slides down the coiled appendage, lubricating her compressed valley so quickly that the warm saliva begins pooling at her collarbone and dripping down her body like syrupy oil.");
	output("\n\nThe straining squeeze of her bloated breasts is too much for you to take things slowly. Globs of pre-cum already begin bubbling up into the resevoir tip of the rubbery toy. You could hardly ask for a better lubricant, so you steady your breathing and begin pumping in earnest. The sensation is a strange one: your cock trapped in three layers of softness that somehow squeeze tighter than just about any hole you’ve ever used. The floppy tension of the latex sheath suckles at your length even as the tightening coils of [pexiga.name]’s tongue squeeze in rippling pulses that transmit her rapid heartbeat right into your groin. Her bolstered breasts bob with every flesh-jiggling thrust, sopping wet cleavage sloshing and slapping loudly as you titfuck the moisture-slick slut for all she’s worth.");
	output("\n\nWhining with well-used delight, [pexiga.name] balls her hands into tiny fists and tucks her arms up next to her breasts. She gurgles, tiny cries of <i>“Ah! Ah! Ah!”</i> buzzing from her gold piercing as she loses herself in the moment. Her body rocks up and down in time with your thrusts and you even catch her tail slipping around to stuff its whole spaded tip into her honey-dripping pussy. The muscles in her bestial body seem utterly clenched with passion, quivering in the sweet fever of ecstasy. Despite her bliss, she doesn’t slow down even a bit as cascades of femme cum leak down her inner thighs, polishing Yammi’s kitchen floor with liquid lust.\n\n");
	if(pc.isBimbo()) output("You absently remind yourself to thank Badger for [pexiga.name]’s mouth-wateringly delicious body. The Doc does fine work! ");
	output("You’ve held back as long as you possibly can, the suffocating pleasure of your aching need like a heat sink in your chest. ");
	if(pc.balls > 1) output("Your [pc.balls] slap against the underside of her tits with heavy promise. They tighten even as the stoppered deluge of your bestial frenzy makes them feels as if they’ve swollen to twice their normal size. ");
	output("With quick, shallow gasps, you slam into her breasts with enough force to lift the startled bimbo up off her knees. Hard and heavy, you pound into the moaning girl’s chest until your lungs burn and your chest pounds.");
	output("\n\nYou clench, holding her cock-stuffed melons tight as your climax hits. Every ounce of torrid frenzy built up inside you becomes a white-hot flash of bliss as your seed pours forth. Even with her tongue like a curling cockring and the two of you squeezing her over-inflated F-cups like a quivering vice, your orgasm will not be denied. Hot spunk shoots up through your [pc.cockBiggest] and into the Bubble Buddy’s tip with one glorious spurt after another. The peculiar latex stretches and sucks at your cum-slit, drawing everything you have into its swelling bubble.");
	//Display each of the following additional scenes for players with sequentially higher cum volumes"
	//301 - 4,000 mL cum volume"
	if(pc.cumQ() >= 300) 
	{
		output("\n\nGout after gout sprays into the violet orb, your eager release slowed to practically a drizzle by the tension on your throbbing member. You loosen your grip on [pexiga.name]’s flushed breasts, allowing your climax to pick up speed. The small ball swells before your pexiga’s eyes, growing to the size of an apple in one, thick spurt. Cooing with delight, she strokes her tits up and down, milking more and more from you. Gradually, the apple has become a grapefruit, nestled warmly at the peak of her drool-slick peaks.");
		output("\n\n<i>“Ooo, a warm ball to play with,”</i> the silver girl coos.");
	}
	//4,001 - 10,000 mL cum volume"
	if(pc.cumQ() >= 4000)
	{
		output("\n\nYou’re not done, however. Not by a long shot. You pick up the pace of your thrusting tit-fucking, catching the pexiga by surprise. She gasps, her tongue losing its clenching hold and releasing the full weight of your accumulated lust. Torrents of [pc.cumVisc] seed geyser into the TamaniCorp toy, distorting the sphere into a wobbling globule. It grows larger and larger; so big, in fact, that she’s forced to tilt her head to one side as the inflating ball squishes up against her cheek.");
		output("\n\n<i>“Oh? A squishy pillow?”</i> [pexiga.name] giggles with delight.");
	}
	//10,001 - 70,000 mL cum volume"
	if(pc.cumQ() >= 10000)
	{
		output("\n\nYou clench your teeth and wipe the sweat from your brow. Now that you’ve gotten into a proper pace, you can really give her all you’ve got. The heavy, liquid orb bulging atop [pexiga.name]’s breasts positively dwarfs the F-cups, weighing her down to a sitting position. The latex membrane grows paler and paler as it stretches to hold the tremendous volume of your seemingly endless orgasm. The pliant rubber contorts across her supple form, until your pexiga’s upper body is lost under the vaguely [pc.cumColor] hued beach ball of your thick cum.");
		output("\n\n<i>“Wha? A whole bed?”</i> the bimbo gasps, arms unable to encircle the overburdened bulb.");
	}
	//70,001+ mL cum volume"
	if(pc.cumQ() >= 70000)
	{
		output("\n\nYou’re so lost in the rapture of your preposterously productive climax that you completely forget the upper limit on the Bubble Buddy’s containment. The latex stretches, bloats, and throbs with the uncounted gallons you’re pouring into it. Ominous creaking and the whine of tension come too late for you to do anything but brace yourself as the overfilled condom bursts like a popped balloon. [pexiga.name] is blasted backwards, sliding on her thick booty across the nectar-soaked floor. Her back smacks against a wall, her loose tongue flying up to slap her across the face as well.");
		output("\n\nThe ring-gag in her mouth always gave her a slightly surprised look, but now she’s genuinely stunned. Just as Dr. Badger’s device bleached [pexiga.name]’s scales white before, your explosive release has given her a fresh coat of [pc.cumColor]. Every inch of her body seems to be dripping, as well as a good portion of the kitchen itself. Oops!");
		output("\n\nBlinking the [pc.cumVisc] curtains from her big, blue eyes, your pexiga claps excitedly. <i>“Again! Again!”</i> The second time takes quite a bit longer, and leaves the two of you utterly drained, but at least you remember to stop yourself before the bubble pops this time!");
		pc.orgasm();
	}
	//merge"
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",bubbleBuddyPexiga3);
}

public function bubbleBuddyPexiga3():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("Sighing with satisfaction, you twist the orb until it seals itself off and present the gift to your favorite ‘man-eating’ bimbo. Thanking you by licking your face with her massive tongue, the pexiga slowly rolls the cum-bloated ball into her room and curls up around it, savoring the gift by stroking it affectionately with her tail. By the time you’re dressed, she’s already fallen asleep, napping in the warmth of your lingering body heat.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function pexigaFacefuckRouter():void
{
	if(pc.cockTotal() == 1) 
	{
		if(pc.cocks[0].thickness() <= 4) faceFuckDatPexigaFaceRingGagThingMaybe(0);
		else tooBigPexigaFacefuck(0);
	}
	else if(pc.cockTotal() == 0)
	{
		clearOutput();
		showName("\nERROR");
		output("ERROR: NO DIX");
	}
	else
	{
		clearOutput();
		showName("WHICH\nCOCK?");
		output("Which cock would you like to offer her?\n\n");
		//Build dis menu
		for(var y:int = 0; y < pc.totalCocks(); y++)
		{
			output("<b>#" + (y+1) + ":</b> " + formatFloat(pc.cLength(y),3) + " inch" + (pc.cLength(y) == 1 ? "" : "es") + " long, " + pc.cocks[y].cockColor + " [pc.accurateCockName " + y + "]\n");
			if(pc.cocks[y].thickness() <= 4) addButton(y,"#" + (y+1),faceFuckDatPexigaFaceRingGagThingMaybe,y,"#"+(y+1),"Get [pexiga.name] to blow [pc.cockNoun " + y + "].");
			else addButton(y,"#" + (y+1),tooBigPexigaFacefuck,y,"#"+(y+1),"Get [pexiga.name] to blow [pc.cockNoun " + y + "].");
		}
		addButton(14,"Back",fuckThePexiga);
	}
}

//Too Large To Face Fuck
//bimbo Pexiga repeatable sex scene variation for players with smallest dick over 4" diameter
//[Facefuck]
//has dick, non-taur
public function tooBigPexigaFacefuck(x:int):void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	if(pc.isBimbo()) output("Adorable! She thinks she’s hunting. But, like, there’s a very important difference between hunting and fucking. A teacher’s job is never done!");
	else if(pc.isNice()) output("It’s good to see her eager and raring to go, but you should probably take responsibility for her heat, rather than leave her to jump an unsuspecting Yammi.");
	else if(pc.isMischievous()) output("You know, it seems a waste to let that perfectly good ring-gag go unused. Surely you can think of some use for it...");
	else output("Best show this predator who’s the alpha around here.");
	output(" Without breaking eye contact, you ");
	if(!pc.isCrotchExposed()) output("strip out of your [pc.lowerGarments] in silence.");
	else output("run your hand down your [pc.cocks].");
	output(" [pexiga.name] watches, panting, while her tail waves back and forth in excitement. She scoots closer, sitting up and bracing her back against the solid, stainless steel table in the center of the kitchen. She sniffs the air to better get your scent and a low, rumbling purr vibrates through her silver scaled body.");
	output("\n\nBare and looming over the recumbent pexiga, you move forward until her face is level with your bulging loins. The pexiga’s full, blue eyes don’t stray from yours, but her O-ringed head tilts back just slightly all the same. Huge tongue hanging limply from her maw, the beast girl’s hot, wet breath mists across your [pc.skinFurScales]. With both hands pressed flat against floor and her swollen F-cup breasts rising and falling with every quickening breath, [pexiga.name]’s translator chirps a single, teasing question: <i>“Snacks?”</i>");
	if(pc.isBimbo()) output("\n\n<i>“You bet! And it’s my favorite kind too,”</i>");
	else if(pc.isNice()) output("\n\n<i>“No, this is for a different kind of hunger,”</i>");
	else if(pc.isMischievous()) output("\n\n<i>“Nah, this time it’s a full meal,”</i>");
	else output("\n\n<i>“Only if you do a good job and suck like you mean it,”</i>");
	output(" you respond, lifting your slowly stiffening [pc.cockNoun " + x + "] to her gaping mouth and slapping the semi-flaccid meat across her saliva-soaked tongue. The pale scaled girl presses her gag-widened mouth against your [pc.cockHead " + x + "], but try as she might, your thick inches are just too big for the beast girl to take.");
	output("\n\nWhining with disappointment, she sets her tongue to the task of lubricating your swelling shaft with impatient whorls of her long oral organ. The huge, moist muscle curls eagerly around the [pc.sheath " + x + "] of your shaft, hauling her forward until her slight snout is smooshed against your bulging cum-vein. From there, the two-foot drool-tool winds sinuously up your [pc.cock " + x + "] like a python circling its prey. A thick curtain of translucent saliva oozes down your meat, washing you with the heat of her frustrated hunger. You reach down and give her a sympathetic scratch behind one of her ear fins as she snakes her tongue along your bobbing girth, dragging her head along for the ride.");
	output("\n\nThe wet coils bring you to full hardness in moments, her grip tightening and loosening in milking waves of pressure. Left like this, she could surely squeeze out her creamy prize with time, but you’ve got another idea. Reaching down, you grab her under her arms and hoist the girl to her knees. Leaning forward, you push the tongue-bound mass of your [pc.cock " + x + "] against the bimbo’s overheated body. <i>“You can’t count on your mouth for everything,”</i> you explain, bracing your hands on your hips.");

	processTime(10);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",tooBigPexigaFacefuck2,x);
}

public function tooBigPexigaFacefuck2(x:int):void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	//cock is under 3’ long
	if(pc.cocks[x].cLength() < 36)
	{
		if(flags["PEX_2BIG_BJ"] == undefined) output("Your pale bimbo pet practically gurgles with pleasure at the rough handling, but manages to pull her gaze back from your [pc.cock " + x + "] long enough to look over the fullness of the task before her. <i>“Woah,”</i> her piercing sighs. <i>“Big cock. But... small mouth?”</i> She touches her gag-outfitted lips gingerly. <i>“But... big titties?”</i> She moves her hands down the wobbling bulk of her F-cups. You can practically see the gear turning as she puts one and two together.\n\n");
		output("<i>“Titties!”</i> she announces with a sparkle in her eyes as she bounces up and down on her knees. She leans into you, hands on the sides of her inflated chest and enwraps your drool-slick length in her pillowy embrace. The jiggling weight of her bimbo-bloated bust sucks in your hard inches while her tongue migrates up to the very top of your [pc.cockHead " + x + "]. Strands of gossamer pre-cum have begun bubbling out of your mast and [pexiga.name] seems all too happy to claim her appetizers with a big, messy, slobbering kiss right on your cum-slit.");
		output("\n\nHer heaving tits squished around your manhood, you rest a hand on her shoulder and begin rocking into the girl’s wobbling mammaries. The soft, pliant expanse of her ivory udders jiggles with the ripple-like waves of your impact at every thrust. Her seemingly endless saliva pours down your crest and into her cleavage like a slimy, glistening lacquer, leaving both your throbbing pole and her wobbling breasts glinting with a fresh coat of lusty polish.");
		output("\n\n<i>“So hungry,”</i> she whines with a playful smile. Clenching her breasts tightly, she begins rocking up and down on her knees, feeding your cockflesh up and down her greedy cleavage. The wet, slurping, slapping of her overfilled orbs is nothing next to the whimpering moans that bubble up in her chest.");
		if(flags["PEX_2BIG_BJ"] == undefined) output("\n\n<i>“New breasts still tender from the operation? Let me help,”</i> you offer, smoothing the stray locks of her soft-spined hair.");
		else output("\n\n<i>“Just addicted to the attention, aren’t ya?”</i> you tease.");
		output(" Resting your palms lightly on her alabaster peaks, you sink your fingers into the girl’s mammoth F-cups. The excess of her yielding bosom spills between your fingers, sending a tremble through her body. She drops down to your [pc.sheath " + x + "] and begins rolling her endowments in massaging circles, slapping them against your sopping meat.");
		output("\n\nHer tongue, meanwhile, has had enough of teasing your cockhead and moves to claim the prize her tits are working to harvest. The very tip of her tongue traces impatient circles around your tip before wiggling against your yawning urethra. Lubricated from her drool and your steady stream of pre, she parts the thin lips of your shaft and feeds a wiggling inch of her thirsty organ into you.");
		if(flags["PEX_2BIG_BJ"] == undefined) output("\n\nHips shuddering from the push, you raise a hand to pull her tongue away, but stop mid-reach. Though you anticipated pain or discomfort, her tongue just leaves an exhilarating tension that feels like somebody left a vibrator going deep in your abdomen. She pushes more in and you can feel your body swaying.");
		else output("\n\nThe warm, buzzing bliss of her tongue-fucking surges up in you once more. Slightly numbing, nearly-vibrating euphoria threatens to overtake you like a shot of ten-year-old, triple-distilled Gargle Banger’s Finest.");
		output(" You head rolls back, your fingers lose their strength, and ragged, panting gasps tear their way past clenched teeth.");
		output("\n\nSensing your weakened state, the impish pexiga presses her breasts in a velvet vice around your shaft and pumps with every pound of force her ballooned tits can muster. The tit-fucking pace is frantic, her fervid mounds squeezing hard enough to stroke every bulging vein in your overwrought phallus. You can feel a cascading, predatory roar echoing in her chest as she chases after the long-sought prey, but by the time it hits her lips, the electronic voice translates it as a string of lusty gibberish. <i>“Yes! Yes! Oh fuck fuck fuck oh ah ah hrrrrrnng f-f-fuuuuck!”</i>");
		output("\n\nThough you don’t articulate it, the feeling is mutual. With a wince, you let your endurance drop and your orgasm gushes upward. As the climactic heat rushes through your [pc.cock " + x + "], it finds the passage blocked by the voracious girl’s tongue.");
		if(pc.cockTotal() > 1) output(" Your unplugged meat, meanwhile, lets the [pc.cumVisc] shower geyser forth, spilling [pc.cumColor]-colored arcs across your pexiga’s white canvas.");
		output(" With a delighted chirp, she pulls her tongue away just as her ring-bound mouth slaps down onto your [pc.cockHead " + x + "]. He throat ripples in spunk-bloated mouthfuls as she swallows every ounce of seed you have to give.");
		if(pc.cumQ() >= 3000) 
		{
			output("\n\nOnce you really get going, however, [pexiga.name] finds her cock-sucking talents put to the test. Your body-shaking bliss pours out in loads too large for her puffed cheeks to contain and stray strands of bubbling jizz begin leaking past her lips and down your shaft. With a look of the utmost concentration, she keeps up her gurgling, gulping consumption while her tongue coils at the vale of her cleavage and lifts upward, rescuing the wayward blobs. Just as it seems she’ll make a flawless go of it, however, she hiccups, sending a mouth-filling load up and out of her nostrils instead of down her throat. The sticky spoo splatters over her face and against your chest.");
			output("\n\nWhen the final, quivering pump spurts into her mouth, the pexiga pulls back and lets it ooze out of her ever-open lips and down her dripping tongue. She looks up at you with big, azure eyes and slurps the cum-and-drool melange across your body in an affectionate - though messy - gesture of devotion. You give her snoot a little boop and roll her floppy fin-ears between your hands as she purrs with the intensity of a chainsaw. <i>“Such a messy eater,”</i> you chide while she beams happily.");
			output("\n\nYou can’t help but notice that the taut embrace of her oiled breasts hasn’t let up on your tender member, despite the recent feeding. Well, what’s the harm in another go? Nobody ever claimed you didn’t spoil your pets rotten.");
		}
	}
	//cock is over 3’ long
	else
	{
		if(flags["PEX_2BIG_BJ"] == undefined) output("[pexiga.name] looks up from her tongue-milking and, tilting her head to one side, gazes into your eyes. <i>“No mouth?”</i> her piercing inquires. As if to check, she tries to press her O-ring gag against the girth of your [pc.cockHead " + x + "] again. When that fails, she furrows her brow and puts her brand new bimbo-brain to work. You can practically see the gears turning as she wiggles and squirms, doing her best to solve the riddle.");
		else output("Your pexiga stares blankly at you, before remembering last time. Giggling and clapping her hands together, she sits attentively while her tail wags back and forth, gleefully awaits your next move.");
		if(flags["PEX_2BIG_BJ"] == undefined)
		{
			if(pc.isBimbo()) output("\n\nThis girl must really need more training, if she doesn’t know what to do when a big ole cock is just waiting for her! Maybe you’ll help her, like, just this once. ");
			else output("\n\nWith a shrug, you decide to give the beast-girl a helping hand. ");
		}
		else output("\n\n");
		output("Using both hands, you apply just enough pressure to the top of your [pc.cock " + x + "], pressing the fleshy length against your pale, silver pet. She leans against the turgid mast but is gradually pushed to her back as the weight of your monstrous dick squishes against her cheek and between her thick breasts. You slowly lower yourself atop her until the pillar of your masculinity has [pexiga.name] pinned to the ground.\n\n");
		if(flags["PEX_2BIG_BJ"] == undefined) output("Peeking around one side, her eyes light up as she finally gets it.");
		output(" The prone pexiga hoists her knees up, squeezing her muscled thighs around your throbbing phallus while her toeless feet slide their soft soles along your [pc.knot " + x + "]. Thin, lean arms make a circuit further along while her tail winds its way up latch on too, leaving her tongue nowhere left to grab but the bulging bulk of your cockhead. With every available appendage clinging to your mammoth member like it’s a life raft, the uplifted girl nuzzles her head up against your fat cumvein with a contented sigh.");
		output("\n\nYou don’t doubt she’d love nothing more than cuddling your cock all day long, but you do have places to be and things to do. Plus, the wiggling, tightening pressure of her body around your cyclopean organ isn’t exactly something you can just ignore. Your swollen veins thrill with the growing pace of your heartbeat as her body heat flows into your ");
		if(pc.balls > 0) output("[pc.balls] like she’s fattening you up for a feast.");
		else output("body like it’s a helium tank hooked directly to your libido.");
		output(" Blobs of pre-cum trickle up, only to be greedily scooped up by the pexiga’s agile tongue. With every little taste of your [pc.cumFlavor] discharge, she hugs a little tighter and fidgets a little more impatiently.");
		output("\n\nYou take a moment to steady your breathing and focus on the sensation of having the ivory girl wrapped around you. The softness of [pexiga.name]’s voluptous curves is only complemented by the firmness of the bestial muscles beneath. Like a living cock sleeve, she strokes her limbs along your over-sized organ and grinds her moist pussy along the swell of your spongy cumvein. Even the lightly cool firmness of the chitinous bands across her torso just serves to add texture to her lively grip.");
		output("\n\nWith a groan, you brace yourself and begin rocking back and forth, sliding thick feet of spunk-shaft across the pexiga’s purring body. She loosens her hold just enough to let you slide more easily, while setting all 24 inches of her tongue to the task of lubing you up. Between her sticky sweet saliva and the thin polish of her drooling pussy, your member is glistening in no time. Your strokes grow more aggressive, running nearly the full length of the alabaster girl as you buck your hips in an aerobic full-body fucking workout.");
		output("\n\nTen, twenty, thirty minutes go by as you grind against the clenching softness of [pexiga.name]’s body. Beads of perspiration drip from your forehead and run in rivulets down your [pc.chest], but the sheer organ pleasure of your pistoning phallus numbs any muscle aches. A steady stream of [pc.cumVisc] dribbles from your tip, drenching the alien girl with enough pre to put a galotian to shame. Her eyes are unfocused and her tongue flops lazily against your thrusting meat, but her instincts keep her limbs as tight as ever. She looks so out of it, that for a moment you’re afraid she’s relapsed.");
		output("\n\nThe fear vanishes when her tail circles around your waist and, with a jerk, yanks you onto your back, pulling her on top. The beast girl crosses her legs around your [pc.sheath " + x + "] and, with a whimpering sigh, pulls your cock straight up into a throbbing totempole. She rises and falls in desperate, eager bounces, using your her taut embrace as much to jill herself off as to worship the meat miracle she’s wrapped around. The pexiga’s ample booty bumps against your ");
		if(pc.balls > 0) output("[pc.balls] with coaxing, passionate wiggles");
		else output("[pc.thighs] with rich, weighty slaps");
		output(", leaving you groaning with ");
		if(pc.hasToes()) output("toe-curling");
		else output("teeth-clenching");
		output(" heat.");
		output("\n\nDespite her half-lidded eyes and limp, drooling tongue, [pexiga.name] moves with the speed and force one would expect of an apex predator. She rides the swollen mast of your manhood with purpose and zeal, her breasts squeezing your tender underside while her toeless feet massage the swell of your [pc.knot " + x + "]. Astride your [pc.cockNounComplex " + x + "] like a love-drunk junkie, [pexiga.name]’s glossy silver scales scintillate in the glow of the kitchen lights with a lustrous, lusty beauty.");
		output("\n\nUnable to hold back any longer, your climax rises with all the ceremony of an erupting volcano. The tightness in your gut clenches to almost painful levels as a rush of warmth spreads through your body. Your [pc.cock " + x + "] throbs and trembles before bloating in the pexiga’s grasp as your climax fills your veins with overflowing fervor. The liquid cascade reaches your urethra like a geyser and thick streams of [pc.cumNoun] spray into the open air. The wild, unguided release splatters down across the kitchen with heavy splashes before your woozy pet regains her sense of self and slams her O-ringed mouth down onto your frothing spout.");
		if(pc.cumQ() >= 3000) 
		{
			output("\n\nCurling her tongue in loose loops around the ");
			if(pc.cocks[x].cType == GLOBAL.TYPE_EQUINE) output("thickening flare");
			else output("tender peak");
			output(" of your cockhead, your pexiga closes her eyes in ecstatic bliss. The albino cumsucker fills her cheeks with the [pc.cumVisc] spunk flowing out of you in slow spurts while her drool-slick organ tightens and pulls its ring upward in a milking motion. With deliberate languor, she swallows the contents of one cheek, pausing for a long beat before swallowing the other. Her throat ripples as the [pc.cumFlavor] seed trickles down into the predator’s stomach, giving her the hot protein she so avidly thirsts for.");
		}
		else
		{
			output("\n\nThe pexiga’s eyes go wide as the sheer volume of your discharge blasts its way right past her cheeks and directly into her throat. She tries to slow down the surging jets by tightening her tongue around your crest, but it’s not even close to enough. The next blast sends as much spunk back out through her lips as past her uvula while the third ends up spraying seed out of her nostrils in twin, bubbling streams. Giving her a hand, you grab onto her ear frills and mush her face against the pliant surface of your [pc.cockHead " + x + "], holding her tightly so your sloppy loads won’t knock her head back. With wet, gurgling gulps, she noisily swallows as much as she can, while the excess flows in slimy waves down, across her body and pools in the hot hollow of her quivering quim. The stomach-bloating [pc.CumNoun] rushes into and across her until the shiny-scaled bimbo is practically lost under the [pc.cumVisc], [pc.cumColor] curtain of your copious bounty.");
		}
	}
	//merge
	//[Next]
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",tooBigPexigaFacefuck3,x);
}
public function tooBigPexigaFacefuck3(x:int):void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("You give her one last pump, just to be sure she’s milked every drop, before finally relenting. Your pet lets out a satisfied <i>“muah!”</i> as your [pc.cock " + x + "] comes free. [pexiga.name] gasps with a long, deep sigh, like a whale breaching the surface, before tilting her head. <i>“Yummy! Can we do all snacks like this?”</i>");
	output("\n\nSomehow, you doubt Yammi would appreciate you turning the kitchen into [pexiga.name]’s personal fuck flat, but it’s a thought. Gathering up your stuff and giving the silver girl one more head pat, you elect to take your leave before somebody notices the dripping, sticky mess you’ve made of the place. <i>“Bai bai! More snacks soon please,”</i> she coos, swirling her tongue across bimbo-bloated tits, gathering the sugary slaver to better rub it all over her body.");
	if(silly) output(" It’s a good thing your ship can’t get ants, because this is how you get ants.");
	//[End]
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu)
}
