public function gobblesHeader(nude:Boolean = false):void
{
	if(flags["CANADA_EXPLAINED"] == undefined) showName("TURKEY\nGIRL");
	else showName("\nCANADA");
	if(nude) showBust("CANADA_NUDE");
	else showBust("CANADA");
	author("Savin");
}

public function gobblesAvailable():Boolean
{
	var currDate:Date = new Date();
	
	//Cut the old if-check now that its no longer once and done.
	//if (flags["GOBBLES_EVENT_DATE"] == undefined || flags["GOBBLES_EVENT_DATE"] < currDate.fullYear)
	
	// Play for future dates, plus room "because nice". Also because fuck doing something to tie it to a single day that moves around every year.
	/*
	// 0-indexed month numbers. Woo.
	if (currDate.month == 9 && (currDate.date >= 10 && currDate.date <= 15))
	{
		return true;
	}
	// 0-indexed american holiday times! Woo.
	if (currDate.month == 10 && (currDate.date >= 20 && currDate.date <= 31))
	{
		return true;
	}
	*/
	
	if (isThanksgiving() || silly)
	{
		/* Once every 7 in game days whilst silly is enabled methinks.
		if (flags["GOBBLES_SILLY_DAYCOUNT"] == undefined || flags["GOBBLES_SILLY_DAYCOUNT"] < days - 7)
		{
			return true;
		}*/

		//Cut the above now that she has a more appropriate repeatable.
		return true;
	}
	
	return false;
}

public function supGobbles2014CanadaEdition():void
{
	//Add when PC enters or leaves the Milk Barn
	clearOutput();
	gobblesHeader();

	flags["GOBBLES_EVENT_DATE"] = new Date().fullYear;
	flags["GOBBLES_SILLY_DAYCOUNT"] = days;
	flags["GOBBLES_2014_EDITION"] = 1; // Futureproofing.

	output("As you approach the milk barn’s door, you feel a slight tug on your");
	if (pc.isChestCovered()) output(" [pc.armor]");
	else output(" arm");
	output(". You look behind you, and find a rather slight cow-girl standing behind you with big eyes staring");
	if (pc.tallness > 66) output(" up");
	else if (pc.tallness < 52) output(" down");
	output(" at you. She can’t be much more than five feet tall, and her Treated cup-size is simply ludicrous on her small frame, a pair of GG-cups that strain her faux-moccasin bra and threaten to burst the seams at any moment. Even those gloriously over-sized melons can’t entirely distract you from what’s behind her, though: a great big plumage of feathers is sticking out from under her panties and garter belt.");
	if (CodexManager.entryViewed("The Treatment")) output(" That’s not a normal Treatment effect, is it?");
	else output(" Those can’t be natural, can they?");
	
	output("\n\nThe feathery cow-girl stares at you with pensive blue eyes, her fingers still wrapped around your arms. Nervously, she manages to stammer out. <i>“S-sorry... would you mind helping me with, uh, with...”</i> her gaze shifts abashedly downwards, settling on the massive rack jutting out from her chest. A pair of reddish-brown feathers are pinned to the front of her bra, swishing softly with every breath she takes.");
	
	output("\n\n");
	if (pc.isNice()) output("<i>“Is something wrong?”</i>");
	else if (pc.isMischievous()) output("<i>“Need a little hand?”</i>");
	else output("<i>“What’s wrong?”</i>");
	output(" you ask.");

	// add tit milker check
	if (StatTracking.getStat("milkers/breast milker uses") > 0)
	{
		output(" You’re not used to cows coming right up and asking for help. There’s attendants for that, after all.");
		if (StatTracking.getStat("milkers/breast milker uses") > 0) output(" Not that you wouldn’t mind a little hands-on time with the cute little redhead.");
	}
	
	output("\n\n<i>“The milkers,”</i> she starts, almost choking on her words. She chews on her lip and her nose twitches cutely, making a ruby-red ring it in jiggle. <i>“They, um, they can’t help me. I jam them up. I’m really sorry, but you seem nice. Could you maybe... maybe milk me, eh?”</i>");

	clearMenu();
	addButton(0, "Yes", orderUpOneTurkeySlut);
	addButton(1, "No", noThanksGobbles);
}

public function noThanksGobbles():void
{
	clearOutput();
	gobblesHeader();

	output("You brush the little cow-bird-girl-thing off of you and tell her that she’s on her own.");
	
	output("\n\nShe wilts away, blubbering a string of apologies.");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function getCanadaPregContainer():PregnancyPlaceholder
{
	var ppCanada:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppCanada.breastRows[0].breasts = 2;
	ppCanada.breastRows[0].breastRatingRaw = 30;
	ppCanada.milkType = GLOBAL.FLUID_TYPE_MILKSAP;
	ppCanada.milkMultiplier = 100;
	ppCanada.milkFullness = 100;
	if(!ppCanada.hasVagina()) ppCanada.createVagina();
	ppCanada.girlCumType = GLOBAL.FLUID_TYPE_HONEY;
	return ppCanada;
}

public function orderUpOneTurkeySlut():void
{
	clearOutput();
	gobblesHeader(true);

	output("You nod and tell the cow-bird-girl that you’ll give her a hand. Her breath catches, a huge smile spreading out on her lips. <i>“Really? Oh, thank you so much! It’s so hard to find somebody to help me.”</i>");
	
	output("\n\nYou cock an eyebrow at that. Considering where you are, you’d think there’d be no shortage of bulls willing to get their hands on a big pair of tits like hers. She blushes, and the big plume behind her wiggles. <i>“I, uh, I got some modifications a couple years ago. I got a little drunk and my friends convinced me to get a maple syrup gene mod. They always make fun of me for being Canadian, not New Texan.”</i>");
	
	output("\n\n<i>“Maple syrup, huh?”</i> you ask, guiding the little cow towards one of the stalls.");
	
	output("\n\nShe happily falls in step with you, smiling eagerly. <i>“It’s delicious! And I make so much of it, too...”</i>");
	
	output("\n\nGiven the way her bosom bounces and jiggles with every step, threatening to burst out of her bra, you don’t doubt her. You close the stall door and instantly the cow-girl has her torturously small top off, letting the magnificent pair of mammaries pop free for your inspection. She shuffles her feet on the floor, training her big eyes on you as your own drink in the shapely curves of her bovine bosom.");
	
	output("\n\n<i>“I don’t mean to be a bother, but could you... use your mouth?”</i> she asks, taking a step towards you. <i>“It comes out easier that way.”</i>");
	
	output("\n\nYou nod and");
	if (pc.isBiped()) output(" pull up a chair");
	else output(" seat yourself on your animalistic lower body");
	output(", patting your thigh for the cow to sit on your lap. She crawls on happily, blushing furiously as you play a hand across one of her heavy-laden breasts. You cup the huge teat, watching your fingers sink into her soft flesh, utterly disappearing into a sea of welcoming boobflesh. The tiniest little squeeze causes a bead of moisture to form on the tip of her nipple, a dark splotch of viscous amber. The smell hits you instantly, the sweet scent of sugar-saturated maple that floods your mind with memories of childhood, pancakes, and the rich taste of syrup. If you hadn’t been sure about suckling from the cow before, you are now - you couldn’t help yourself if you tried.");
	if (pc.isTreatedMale()) output(" Not that you would. A pair of tits like that is too good to pass up.");
	
	output("\n\nYou heft her tit up to your mouth and latch on, using your [pc.tongue] to lap up the dollop of syrup cresting her stiff point. The sheer sweetness almost makes you wince, and you suck in a sharp breath as the sugary droplet bursts over the tip of your tongue. So sugary that it’s sweet as candy, and hotter than you would have expected - perfect to be spread over a plate of pancakes. If only... Still, you lean back");
	if (pc.isBiped()) output(" in your chair");
	output(" and draw the overburdened cow with you, letting her shift a great deal of her rack’s weight onto you while you lick and tease her saucer-sized nipple. She gives you a shy little smile over her bust and wiggles her hips, clearly appreciative of the thought. A moment later that smile twists into a silent <i>“O”</i> of pleasure on her lips as you start to actually suckle, drawing a slow trickle of syrup from her. Not the rush of milk another cow might give, but more like sucking molasses through a straw. It’s hard going getting even a few drops at first, and the girl gasps and cries as you get her started, chewing hard on a finger as you suck and squeeze her breast.");
	
	output("\n\n<i>“You... you’re good at this...”</i> she mewls, <i>“You must be popular with all the cows.”</i>");
	
	output("\n\nIn answer, you reach behind the blushing redhead and give her ass a two-handed smack, digging your fingers into the big bubble butt she’s hiding under those cow-pattern panties. She squeals, her plume of feathers bouncing with her jiggly cheeks. The look in her eyes tells you she wants more, and you’re more than happy to give it: you slip your hands under her panties and give them a yank down to her thighs, baring her ass and the juicy little box of her pussy, hot against your own [pc.crotch].");
	
	output("\n\n");
	if (pc.isTreated()) output("Your Treated instincts remind you that a girl always gives the sweetest milk - or in this case, syrup - when she’s got something nice working between her legs");
	else output("You suddenly remember an old urban legend of girls giving the sweetest milk when they’ve got something fun between their legs");
	output(", and you quickly move one of your hands around the cow’s thigh and into the valley of her cunt. She gasps as a finger traces through her wet slit, but her body speaks for her: her hips rock against your hand, drawing several of your digits into her welcoming hole. She starts to move immediately, shifting her hips overtop your spearing fingers, riding them like a cock. You can taste the difference immediately, her syrup coming sweeter and richer between your [pc.lips]. The flow is still slow enough that you can savor every drop, rolling the thick candy-sweet bounty across your [pc.tongue] before swallowing a mouthful every minute or so. It’s a much slower, less frantic milking than most cows ever get, but it still doesn’t take long for her to start huffing and puffing, panting and moaning as she grinds on your fingers and fills your mouth with her lactic bounty. Squeezing her behind and driving your digits deeper, you switch from one tit to the other, coaxing out a new stream of syrup from the thus far unused boob.");
	
	output("\n\nMinutes pass in blissful suckling, and you’re sure you’ve drained gallons of sticky syrup from her over-sized breasts - they even <i>look</i> smaller now! Her movements become more desperate as you continue to drink from her, the cow’s hips grinding faster on your fingers. She draws you deep into her wet, hot channel, bounding on your digits and slathering them with her juices. They’re different than a normal girl’s, you quickly realize: her cunt’s way hotter than normal, and your fingers are actually getting a little sticky from the treatment. You’re starting to smell a little something else, too, a tinge of sweet spice and cinnamon that makes your mouth water even more.");
	
	output("\n\nShe blushes when you ask her and admits <i>“I’ve got a few mods down there, too. I’m really tasty now. Do you want to have a taste, eh?”</i>");
	flags["GOBBLES_SEXYTIMES_STARTED"] = 1;
	pc.lust(5);
	pc.milkInMouth(getCanadaPregContainer());
	processTime(10);

	// [Sweet Pussy Pie] [Nah]
	clearMenu();
	addButton(0, "PussyPie", orderUpOneTurkeyCuntPie);
	addButton(1, "Nah", noThanksGobblesNoPie4Me);
}

public function noThanksGobblesNoPie4Me():void
{
	clearOutput();
	gobblesHeader(true);

	output("You tell the syrupy cow-gal that you think you’ve had enough of her unique blend for today.");
	
	output("\n\n<i>“Oh,”</i> she says, flushing hotly. Her pussy clenches around your digits like it doesn’t want to let go, but eventually its owner is able to pry herself off of your lap. You watch with keen interest as the cow-girl wobbles off of your lap, turns around, and bends over to pull up her panties. You get a delightful look at her femspunk-slathered thighs, her nicely stretched wet pussy, and the turkey-tail buttplug crammed in her other hole.");
	
	output("\n\nShe looks over her shoulder and gives you a bashful smile as she wiggles herself back into her cow-patterned panties. <i>“Thanks for the milking, " + pc.mf("mister", "miss") + ",”</i> she says quietly, stuffing herself back into her feather-adorned bra. <i>“Sorry if I was a bother. You were really gentle and nice.”</i>");
	
	output("\n\nYou smile at the turkey-themed cow and wave as she slips out of the stall, her bust considerably lighter looking.");

	pc.lust(5);
	processTime(5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function orderUpOneTurkeyCuntPie():void
{
	clearOutput();
	gobblesHeader(true);

	output("You’ve got to try this.");
	
	output("\n\nYou nod eagerly, and the busty cow quickly scrambles off of you - leaving a noticeably hot, sticky mess on your hand and a trickle of syrup running down your chin. She shimmies out of her panties, tossing them in the same pile as her feathery bra, and bends over for your inspection. You plant your hands on her big, jiggly butt, smacking the cheeks just hard enough to make them bounce for you. You spread her backside open, revealing the base of her plumage of feathers: a big, black buttplug that’s stretching her keister wide. She moans when you run a hand across the base of her feathers, giving the plug a little jiggle inside her. Your eyes are drawn down after that, to the well-stretched slit of her cunt. Her hole is fringed by a mat of carefully trimmed, downy red pubes that form a distinctly leaf-shaped pattern around her pussy.");
	
	output("\n\nYou lean into her crotch, taking a deep whiff of the sexy scent bubbling off her hot box. It takes a moment to fully recognize it, but when you do, your eyes wide. <i>“Pumpkin?”</i>");
	
	output("\n\n<i>“Spiced pumpkin,”</i> the cow grins, and before you can blink, she’s leaned her big booty back into your face, mashing her crotch into your face and slathering you with her pussy. <i>“It’s my favorite... tasty, eh?”</i>");
	
	output("\n\nYou have to admit, it is. Your tongue instinctively darts out into the loose, warm channel pressed against your mouth, eagerly exploring it. The cow moans as you slide into her, her bent back arching happily as your [pc.tongue] slithers across her warm walls, teasing the lush confines of her channel and lapping up the delicious pumpkin-juice inside. It’s almost as sweet as her milk was, and a welcome change of pace from what feels like gallons of syrup churning in your belly.");
	
	output("\n\nYou make steady, long circles through the turkey-cow’s passage, drinking deep of her sweet nectar. It’s an order of magnitude tastier than what you can get at Apollo’s Coffee - this girl could make bank bottling from both sides, you think to yourself between languid licks. The longer you eat her out, the more thoroughly you find your face buried in the cow’s behind. Before long, you’re lodged between her big cheeks, completely enveloped in her lush backside and rapidly losing yourself in her wonderfully modded pussy.");
	
	output("\n\nAfter a few minutes of this treatment, you can feel the cow-girl tightening up a little, her body running hotter around you. Her moans deepen, down to a long, bellowing <i>“mooooo”</i> - she’s cumming! You hold the line, keeping up that same rhythmic pace as the cow-girl climaxes, her pussy squeezing hard around your [pc.tongue]. You slap and squeeze her butt, spanking her hard enough to make her clamp hard around your tongue, trapping you in a sea of boiling pumpkin spice until her orgasm passes. It’s as long and messy as a Treated girl’s can get, ending with your face smeared with a delightfully musky mix of spicy juice, dripping down your cheeks to join the veneer of syrup no doubt still clinging to you. You’re going to need a shower after you get through with this girl!");
	
	output("\n\nYou slowly pull yourself out from the cow’s backside, giving her a parting spank and watching appreciatively as her turkey-themed buttplug jiggles a little deeper into her. She coos, cupping one of her now-smaller breasts and wiggling her hips for you. That ass of hers is amazing... you could lose yourself in it if you aren’t careful. You’d like nothing more than to cuddle up with that butt, to say nothing of the huge boobs blatantly visible between the cow’s cum-splattered thighs.");
	
	pc.lust(10);
	pc.girlCumInMouth(getCanadaPregContainer());
	processTime(10);

	if (pc.hasCock())
	{
		output("\n\nAfter a moment, the turkey-cow straightens up and turns back to face you, clearly a little wobbly on her legs. <i>“You’ve been really nice to me... so gentle, too. I’d feel bad if I didn’t return the favor, so how " + ((silly) ? "aboot" : "about") + " you let me gobble up that [pc.cock] of yours, eh?”</i> she asks, pointing to your");
		if (pc.isCrotchGarbed()) output(" blatant bulge");
		else output(" painfully hard cock");
		output(". Shit, you hadn’t even noticed that.");

		clearMenu();
		addButton(0, "Milkshake", orderUpOneCumshakeForTurkeySlut);
		addButton(1, "Nah", nahYouAintSuckinMuhDickGobbles);
	}
	else
	{
		output("\n\nAfter a long moment of recovery, the turkey-cow straightens up and flashes you a big grin. <i>“Thanks so much, " + pc.mf("mister", "miss") + ". Sorry if I was a bother, but I really appreciate the help, and you were so gentle with me too. Not many bulls go easy on a poor cow like that.”</i>");
	
		output("\n\nYou watch lustily as the cow stuffs herself back into her feathery bra and cow-themed panties before slipping out of the stall. She was pretty sweet!");

		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

public function nahYouAintSuckinMuhDickGobbles():void
{
	clearOutput();
	gobblesHeader(true);

	output("\n\nYou tell the syrupy cow-gal that you think you’ve had enough of her unique blend for today.");
	
	output("\n\n<i>“Oh,”</i> she says, flushing hotly. Her pussy clenches around your digits like it doesn’t want to let go, but eventually its owner is able to pry herself off of your lap. You watch with keen interest as the cow-girl pulls up her panties. She looks over her shoulder and gives you a bashful smile as she wiggles herself back into her cow-patterned clothes. <i>“Thanks for the milking, " + pc.mf("mister", "miss") + ",”</i> she says quietly, stuffing herself back into her feather-adorned bra. <i>“Sorry if I was a bother. You were really gentle and nice.”</i>");
	
	output("\n\nYou smile at the turkey-themed cow and wave as she slips out of the stall, her bust considerably lighter looking.");

	processTime(3);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function orderUpOneCumshakeForTurkeySlut():void
{
	clearOutput();
	gobblesHeader(true);

	output("You slip off your [pc.gear] and pat your thigh, telling the cow that you’d appreciate a little help with your [pc.cock]. You hadn’t even noticed how horny you were getting, but now that she’s drawn attention to it... hoo boy. She chews her lip, giving you a playful grin as she slips down to her knees");
	if(pc.legCount > 1) output(" between");
	else output(" towards");
	output(" your [pc.legOrLegs], her plumage flicking behind her. She wraps a hand around your [pc.cock] and gives it a tentative stroke, breathing deep of your scent. Her eyes flutter, and you soon find yourself with a busty cow-girl nuzzling your member, drawing the pre-slick shaft up her cheek until the crown crests her lips.");
	
	output("\n\nShe gobbles your member down with gusto, taking you to the hilt in one swift motion");
	if (pc.balls > 0) output(" that leaves her chin pressed into the swell of your [pc.balls]");
	output(". Her big blue eyes glance up at you, clouding with pride as you give her an approving smile and moan. Her big, bovine tongue wraps around your shaft and her mouth pulls back to your [pc.cockHead], slathering you with drool. Her mouth works hard to get you ready, pumping up and down your shaft with ready abandon until you’re on the brink of orgasm. If there’s one thing Treated girls know how to do, it’s handle a cock with all the love in the world. She gently sucks and licks, covering your rod in gentle kisses");
	if (pc.balls > 0) output(" and cupping your balls oh so sweetly, rolling the heavy nads in her hand until you can feel the cum churning in them, ready to burst");
	output(".");
	
	output("\n\nJust before it’s too late, though, the cow releases your rod, letting it bob in the warm air. You groan, shifting your [pc.legOrLegs] against the hay-covered ground. Instinctively you reach for your rod, trying to bring yourself to orgasm where she would not, but the cow bats your hands away. Instead, after you’ve had a moment to calm down, the cow-girl cups her syrup-laden tits and hefts them up into your lap. <i>“They’re so much softer than any other cow’s,”</i> she boasts, wrapping her tits around your stiff prick with practiced ease. <i>“I’m full of nice, thick syrup instead of watery old milk, you know... can you feel the difference?”</i>");
	
	output("\n\n<i>“God yes,”</i> you groan in immediate response, digging your fingers into");
	if (pc.isBiped()) output(" the sides of the chair");
	else output(" the cow’s shoulders");
	output(", trying to steady yourself as she envelops your manhood in the most wonderfully soft, warm grip you could have imagined. Being between her tits is like sheathing your dick in hot bread, so warm and feathery-soft against your tender flesh. You both let out a long, sexual sigh as your [pc.cock] settles between the ample mounds of the cow’s boobs, locked between them by her arms.");
	
	output("\n\nShe shifts her whole body after a moment, using her torso to pull her tits up and down your rod. One long, slow stroke from crown to base, going deep enough that your [pc.cockHead] pokes out between her teats, just in time to sheathe in her waiting mouth. She lets out a cute little moo as you enter her, quickly silenced by your cock lodged flush with her lips. She gives you a loving little lick, lapping the pre from your slit before moving her body again, taking you out of her mouth and back into the heavenly grasp of her cleavage. Again and again she repeats that motion, burying you in boob and then lovingly tending to your cockhead. You rest a hand atop her head, gently controlling the steadily-increasing tempo of her titfucking, guiding her towards the perfect pace of pleasure for you.");
	
	output("\n\nShe starts to wiggle her shoulders as she bounces and in turn, her tits quake like water, jiggling obscenely in your lap. You nearly cum on the spot, having to fight with every ounce of willpower to keep yourself at bay. <i>“Not yet,”</i> you grunt, gritting your teeth against the influx of quivering boobflesh.");
	
	output("\n\n<i>“Eh?”</i> the cow giggles, moving faster. <i>“You don’t want to cover my tits in cum?”</i>");

	processTime(10);

	clearMenu();
	addButton(0, "On Tits", cumOnTurkeyslutsTitties);
	addButton(1, "Inside", cumInTurkeyslutsCunt);
}

public function cumOnTurkeyslutsTitties():void
{
	clearOutput();
	gobblesHeader(true);

	output("Your body inevitably answers for you. Your whole frame jerks forward as your cock unleashes its pent up load across the cow’s waiting chest. The first shot takes her across the chin, splattering into a pretty pearl necklace around her neck. The rest of your orgasm is lost in her cleavage, trapped between two monumental jugs of titflesh. She lets out another moo as you bust your nut all over her rack, smiling up at you with sated, heavy lids over her blue eyes.");
	
	output("\n\n<i>“You’re really nice,”</i> she purrs, licking a little spooge from her chin. <i>“I’m always so thankful for offworlders like you. You’re always so gentle and kind to me. I hope you liked my milking!”</i>");
	
	output("\n\nYou nod enthusiastically, patting the little turkey-cow’s head. She nuzzles against your hand, even as she quickly finds her scant clothing and dresses back up, not bothering to clean up the load of cum between her tits. On New Texas, it’s practically a badge of honor!");
	
	output("\n\nShe plants one last kiss on your cockhead before slipping out of the stall. <i>“See you around!”</i>");

	pc.orgasm();

	processTime(5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function cumInTurkeyslutsCunt():void
{
	clearOutput();
	gobblesHeader(true);

	output("You answer by grabbing her under the arms and hefting the buxom cow up onto your lap, spearing her on your cock. She gives a shrill, startled moo as your [pc.cock] is rammed inside her, spreading that maple leaf of pubes wide around your member. <i>“That.. that works too,”</i> she moans, settling onto your lap and locking your member in a silken, spicy vice. That’s all you needed to cum, and you quickly find yourself busting your nut into the cow’s welcoming hole. She gives a little groan as your first shot spills into her womb, but after that she’s all doe eyes and eager shifts of her hips, milking you just as easily with her pussy as with her breasts.");

	pc.orgasm();
	
	output("\n\n<i>“That feels better,”</i> she coos as you empty your [pc.balls] inside her. Her eyes get a little brighter as you plant your hands on her hips, squeezing her around your cock. <i>“Oooh, it really does... like a veil’s been lifted. Bulls ignore me so much, I forget what it’s like to have a big, thick load inside me. Ah, I feel alive again.”</i>");
	
	output("\n\nYou cock an eyebrow as the festive little cow reaches back and pulls her buttplug out, letting the turkey-tail clatter to the ground. <i>“Sorry, "+ pc.mf("mister", "miss") +". I get really silly when I don’t get a regular load of cum. I don’t even remember who put that there. Probably Ellie! Thanks for being so nice to me, by the way. Feels like years since I could think clearly.”</i>");
	
	output("\n\nYou nod, still a little confused");
	if (pc.isNice()) output(", but more than happy to help");
	output(". The cow leans in and plants a kiss on your lips, giving you a bit of a squeeze with her well-trained pussy before hopping off and stuffing herself back into her clothes. <i>“You’re really cute, you know? Maybe I’ll see you around sometime soon?”</i>");
	
	output("\n\nShe slips out of the stall, blowing you another kiss and leaving you to bask in the afterglow, still tasting pumpkin spice and syrup on your lips.");

	processTime(5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}


//TiTSgiving, Year 1 (Part 2)

//If the PC hasn't done TiTSgiving 1 (Canadian Thanksgiving) already, play that first. Then let the PC encounter this event after ~a day if they at least milked her. The event is repeatable, and lasts after the holidays. Randomly procs in the squares around the entrance to the Milkbarn, same as last time. (ie, PC has to unlock Canada during the holidays, but after that, she'll show up whenever.)
public function canadaTheTurkeyRepeats():void
{
	clearOutput();
	gobblesHeader();
	output("As you’re making your way through the milk barn’s door, you feel a gentle tug on your arm from amid the herd of cowgirls streaming past you. You turn around, ");
	if(pc.tallness < 60) output("almost planting your face into a pair of ludicrously big breasts attached to an all-around voluptuous cow");
	else if(pc.tallness < 72) output("coming eye to eye with a familiar cow");
	else output("and find yourself looking around over the herd heads until another tug brings your attention down to a small but very, very buxom cow");
	output(". Well, maybe <i>cow</i> isn’t entirely right: rather than a tail, she’s got a great big plumage of reddish-brown feathers jutting up behind her from her lacy white panties, nearly as tall as she is. You grin as you recognize the canadian turkey-cow-girl clutching your arm");
	//if first time: 
	if(flags["REPEAT_GOBBLES_MILKED"] == undefined)
	{
		output(", though she certainly looks a bit different from the last time you saw her");
	}
	output(". Her big, blue eyes are outlined with glittering navy eyeliner, and she’s wearing a dark brown maternity-style bra, so sheer it’s practically transparent, covered with long leather tassels that hang down almost to her waist. Together, her little red nose ring, big tail-feathers, and huge breasts give her a playfully festive, suggestive look.");
	output("\n\n<i>“Hi,”</i> she says simply, pressing herself up against you, letting you feel those big, full breasts hot against your [pc.skinFurScales]. Her blue eyes flutter ");
	if(pc.tallness >= 72) output("up ");
	else output("down ");
	output("at you, a hopeful smile playing across her rosy lips.");
	//Canada introduceeeeed!
	if(flags["CANADA_EXPLAINED"] == undefined)
	{
		output("\n\n<i>“Hey, it’s you again,”</i> you grin, planting an affectionate hand on one of her syrup-stuffed tits. <i>“Long time no see.”</i>");
		output("\n\nShe blushes and chews a lip as your fingers sink into the pillowy flesh of her bosom. You try to think of something to say, but suddenly realize, <i>“You know, I didn’t get your name last time.”</i>");
		output("\n\n<i>“Oh!”</i> the turkey-cow gasps, flushing a darker red than when you were squeezing her boob. <i>“I’m so sorry! I didn’t mean to be so rude.... Everyone here calls me Canada. Because, um, I’m Canadian I guess? Well, my <i>parents</i> were, but I’ve still got the accent. They call me Canny sometimes, too. Or just Cans. Though I think they might be talking about my cans when they say that,”</i> she babbles, hefting her over-stuffed boobs.");
		output("\n\nShe chuckles to herself and locks her arms under her bosom, still staring ");
		if(pc.tallness > 72) output("up ");
		else if(pc.tallness < 60) output("down ");
		output("intently at you.");

		output("\n\nFor what it’s worth, you give her your name in turn, and ask <i>“Doesn’t that bother you? The name calling, I mean.”</i>");
		output("\n\n<i>“Nah,”</i> she shrugs, <i>“I’m used to it. I get... really silly when nobody will have sex with me. Part of the Treatment, I guess. If I get too silly, the other girls will dress me up in kooky outfits and stuff me full of weird toys. Like this!”</i> she adds, wiggling her hips which, in turn, sends her plumage of turkey feathers shivering. <i>“Last year I ended up walking around in a Canada goose outfit for almost a week with six bullet vibes in me, all on full power, until Amma and Ogram finally found me and, uh, helped me. Unless they were the ones who did it in the first place... I can’t remember. Anyway, uh, the name kind of stuck after that. Better than Goose, eh?”</i>");
		output("\n\nYou suppose. After a moment of silence, you realize your hand’s still firmly planted on Canada’s boob, and ask, <i>“So, you looking for a milking again?”</i>");
		output("\n\n<i>“I wouldn’t say no,”</i> she says, her cheeks flushing a nice, rosy red to match her lips. <i>“Or just spending some time together... i-if that’s alright, eh?”</i>");
		flags["CANADA_EXPLAINED"] = 1;
	}
	//Repeat;
	else
	{
		output("\n\nYou grin at her and plant an affectionate hand on one of her syrup-stuffed tits. Canada blushes and chews on her lip while your fingers sink into her pillowy flesh. <i>“Hey again. You looking for a milking?”</i>");
		output("\n\n<i>“I wouldn’t say no,”</i> she says, her cheeks flushing a nice, rosy red to match her lips. <i>“");
		if(flags["REPEAT_GOBBLES_MILKED"] == undefined) output("Or just spending some time together... i-if that’s alright, eh?");
		else output("I enjoyed last time a lot. If it’s not a bother, I’d wouldn’t mind just... spending some time together. I-if you want, that is, eh?");
		output("”</i>");
	}
	//[Milk Her] [Not Now]
	clearMenu();
	addButton(0,"Milk Her",milkGobblesRepeat);
	addButton(1,"Not Now",notNowGobblesIDontWantToGoForRound2);
}

//[Not Now]
public function notNowGobblesIDontWantToGoForRound2():void
{
	clearOutput();
	gobblesHeader();
	//You don’t have time right now. You’ll probably be able to hang out with Canada later, if you want.
	output("You apologetically brush Canada off, saying that you don’t really have time for her right now. She wilts back, blubbering a string of apologies for bothering you.");
	clearMenu();
	gobblesRepeatSexEndCleanup();
	addButton(0,"Next",mainGameMenu);
}

//[Milk Her]
public function milkGobblesRepeat():void
{
	clearOutput();
	gobblesHeader(true);
	//Spend some quality time with Canada... and those big, succulent breasts of hers.
	output("You give Canada’s boob a playful squeeze and tell her that, before the two of you do anything, those big jugs of hers need to be milked. They look about ready to burst!");
	output("\n\nShe giggles and presses herself a little tighter to you. <i>“Thanks. I hate asking strangers to help me... they’re not normally as nice or gentle as you.”</i>");
	output("\n\nYou slip an arm around the turkey-cow’s waist and let her lead you to somewhere more private. Rather than to one of the milking stalls, she leads you past the back of the barn");
	if(flags["BRYNN_INTRODUCED"] != undefined) output(" and the unmistakable sounds of Brynn trying to get his over-sized rocks off");
	output(", and up a small flight of stairs all but hidden behind some stacked-up bales of hay. On the way up to the loft, she mumbles something about new milker attendants and never having any privacy. <i>“They just yell at me whenever I try and get milked. I always just jam up the milker machines, because the syrup’s so thick. I don’t mean to, but it’s so hard to find somebody nice to help me. Gianna helps sometimes, when nobody else will, but even she’s not around all the time...”</i>");

	output("\n\n");
	if(pc.isNice()) output("You can’t help but feel sorry for the syrupy cow.");
	else if(pc.isMischievous()) output("You’ve gotta wonder why she keeps those syrup mods, if they’re that annoying.");
	else output("You can’t help but think that might be her own fault for filling her tits up with maple syrup instead of milk like a normal cow.");

	output("\n\nUpstairs, you find a small, cozy wood-floored loft overlooking the rest of the barn. A nice coating of loose hay covers the planks under your [pc.feet], leftovers from the spare hay bales that dominate most of the space. Still, you can see plenty of evidence of Canada’s passing here: a big, sturdy bucket and a couple of stools are waiting for you.");

	output("\n\n<i>“Is this alright?”</i> she asks, motioning towards the little setup she’s prepared. You nod, and tell her to slip out of ");
	//Not 1st
	if(flags["REPEAT_GOBBLES_MILKED"] == undefined) output("her bra.");
	//First
	else output("that new bra of hers.");

	output("\n\n<i>“Like it?”</i> she asks, bouncing in place a bit, just enough to make her boobs sway under their sheer restraints, straining against the transparent material. A little dollop of dark cream beads from her nipples, staining the front of her bra with sticky sweetness. <i>“Ellie just sold it to me today. Well, made it for me, really. For some syrup. She’s got a real sweet tooth, I guess.”</i>");

	output("\n\nGiving you an apologetic smile over her shoulder, Canada faces away from you and asks <i>“Could you... um, the straps...”</i> ");

	output("\n\n<i>“Sure,”</i> you answer, squeezing her shoulders before working your way to the clasp of her bra and freeing it. The moment all that extra support is gone, the turkey-cow’s breasts shift down, and she lets out a relieved little sigh as she pulls her top off and hangs it up on a nail jutting from the doorframe. She slowly turns back your way, letting you see those two big, soft, succulent orbs on her chest in all their bare beauty. Canada can’t be much more than five foot, but she’s packing a rack that ");
	if(flags["MET_ELLIE"] != undefined) output("could even give Ellie’s a run for her money");
	else if(flags["REAHA_BOUGHT"] == 1) output("would definitely make Reaha jealous");
	else output("would make even a towering amazon-cow jealous");
	output(", and look positively mammoth on her small, voluptuous frame. It’s all you can do not to surrender to your basest instincts and bury your face between her ample, inviting cleavage - not that you think she’d mind. Instead, you pull Canada up into your arms and give her tits a good squeeze, stopping just shy of eliciting her trickle of syrupy bounty. Your hands play across her bosom, squeezing and caressing until the poor turkey-cow’s blushing furiously, and the front of her white panties are completely soaked through.");
	output("\n\nSlowly, you guide the avian-adorned cow-girl over to the stools and ease her down onto her knees, resting her belly on a stool-top with her tits propped up on the edge of the bucket. With her settled in, you ");
	if(pc.isTaur() && pc.isNaga()) output("push the other stool out of the way and seat yourself on your animalistic hind-quarters");
	else output("pull the other stool up and take a seat behind her. Excitedly, Canada wiggles her backside at you, making a little dance of waving feathers tickling your nose until you give her a firm spank to calm her down. She makes a startled little squeal and stretches out to move the feathered tail out of your way.");
	output("\n\nOnce she’s done, you reach around Canada’s small body and run your hands down the soft mounds of her breasts, from under her arms down to the big, puffy pink nipples at their tips. She shivers as your fingers tease her, uttering a soft <i>“moo,”</i> when you wrap them around her teats and give them a gentle tug. It takes a little work to get her started, more than the average cow, but with a few caresses and squeezes you’re soon rewarded by a quivering turkey-cow and a trickle of thick, viscous syrup. The amber liquid drools in tiny beads around your fingers, dripping languidly into the bucket.");
	output("\n\nAll the tension fades out of Canada’s body after the first few spoonfuls of syrup leave her. She sighs and relaxes, like putty in your hands, utterly surrendering to your massaging hands. You can feel her body shiver and quake as you touch her most sensitive spots or elicit a particularly thick trickle of syrup from her, and you’re quickly aware of radiant wet heat against your [pc.leg] where her crotch is pushing up against you, desperately soaked with her growing excitement.");
	output("\n\nYou shift slightly ");
	if(!pc.isTaur() && !pc.isNaga()) output("in your seat");
	else output("on your haunches");
	output(", and the cow-girl shudders in response as your [pc.leg] grinds against her sex. She only barely suppresses a moan, turning it into a cute little whimper as she pushes back ever so slightly against you. Her pussy rubs wetly over your [pc.leg], and you can feel her tits tremble and squirt in turn, pumping out a thicker and faster trail of syrup that plops onto the surface of the bucket. Another desperate moan escapes Canada’s lips as her movements become more and more erratic, more desperate");
	//elseif PC has a dick OR hardlight strapon: 
	if(pc.hasCock() || pc.hasHardLightEquipped()) output(" until she finally looks over her shoulder at you and murmurs: <i>“I-if you want to fuck me, you can.... Treated girls give the best milk - or, um, syrup I guess - when we’re happy. That’s what they say, anyway.”</i>");
	else output(".");

	pc.lust(20);
	processTime(10);
	//if PC has a dick/strapon, option to [Fuck Her] or [No]. Else, continue with <i>“no”</i> for non-cockbags
	if(pc.hasCock() || pc.hasHardLightEquipped()) addButton(0,"Fuck Her",fuckAmeriturkeyGobbleButt,undefined,"Fuck Her","I think we all know where this is going....");
	else addDisabledButton(0,"Fuck Her","Fuck Her","This scene requires a penis or hardlight strap-on.");
	addButton(1,"Cuddle",noCockTurkeyBastingRoundIIYEehawAMURRICA,undefined,"Cuddle","Cuddle up with the turkey - no sex needed.");
}

//Fuck Her
public function fuckAmeriturkeyGobbleButt():void
{
	clearOutput();
	gobblesHeader(true);
	output("You give your answer by slipping one of your hands from Canada’s teats to the hem of her lacy white panties, or what’s left of them after she’s soaked them completely through, and tug them down. She gives a little gasp as the elastic band brushes the <i>“base”</i> of her tail, firmly planted in the nicely stretched hole of her ass, but coos happily as you pull her panties and garter off, leaving her with a bare pussy fringed with a dainty tuft of red hair, and a pair of tall white stockings that nicely frame the full moons of her rump. You lick your fingers clean before sliding them into her - her lips part easily around you, though her whole body eases forward under the gentle pressure, culminating in a mooing moan and a huge spurt of amber syrup from her teats as the shock of pleasure spreads through her.");
	output("\n\nCanada wiggles her hips for you and leans back into your hand, taking your digits as deep as they’ll go. <i>“That’s nice,”</i> she purrs, slowly humping back against you. <i>“Get me nice and stretchy, okay?”</i>");
	output("\n\n<i>That</i> you can do. You slip another finger in, and another, and spread ‘em wide. The cow-girl cries out as you stretch her pink hole to its limit, spreading her lips out until you can see trickles of moisture drool past your digits and onto the hay-coated floor. The turkey-cow moans and moos, squeezing her tits and thrusting back against your hand as hard as she can, desperate for more pleasure.");
	output("\n\nEnough of that. You pull off your [pc.gear] as quick as you can, ");
	if(pc.hasCock()) 
	{
		if(pc.isCrotchGarbed()) output("freeing your [pc.cock] from its constraints");
		else output("grabbing your stiff prick and stroking it to full hardness");
	}
	else output("stopping just short of pulling your hardlight-equipped panties. You flip the switch and shiver with sudden sensation as your glowing hardlight prick springs to life in your hand");
	output(". You run a hand along your shaft, thumbing your crown and slit, angling yourself towards the gaping pink slit of Canada’s pussy.");
	output("\n\nYou ease into her, nestling the ");
	if(!pc.hasCock()) output("crown of your hardlight cock");
	else output("your [pc.cockHead]");
	output(" into her warm, wet, welcoming hole. Canada looks over her shoulder and gives you a little smile, wiggling her rump down your length, taking you to the hilt in one stroke. Your hands return to her tits, squeezing the big mounds of her teats until the syrup starts flowing again, now to the beat of your [pc.hips] moving, thrusting into Canada’s pussy. No need to be gentle with that side of your bovine friend: you start pounding away at her, leaning in and putting your weight on her back, awkwardly hugging her from behind as you milk and fuck at the same time. She takes it like a champ, mooing and squealing excitedly. The flood of dark amber from her deep reserves quickens, spurred on by your thrusting ");
	if(!pc.hasCock()) output("hardlight ");
	output("cock. Thicker, stickier, and when you bring your hand back to taste it, sweeter.");
	pc.cockChange();

	output("\n\n<i>“Tastes great,”</i> you tell her, grunting the words out between ass-quaking thrusts into the turkey-cow’s eager rump.");

	output("\n\nShe responds with a wiggle and a pleased moo, resting her hands on yours and lacing fingers with you. The bucket’s getting full now, filling with waves of sweet-smelling maple, enough to make your eyes water when you breathe in deep. Canada’s getting close to drained, and you wouldn’t mind letting her sweet little pussy ");
	if(pc.hasCock()) output("milk a nice wad of [pc.cum] out of you");
	else output("squeeze your hardlight shaft until the sensation feedback overwhelms you, driving you to orgasm");
	output(". Satisfied with your work on the birdy bimbo’s breasts, you take your hands off them and grab Canada’s hips, holding her steady as you shift all of your focus to fucking her. She takes it in stride, rubbing out the last trickles of syrup herself and wiggling her legs wider apart, urging you deeper into her slavering hole.");

	output("\n\nWith your concentration wholly occupied with Canada’s twat, it doesn’t take long to build up that wonderful, orgasmic pressure in your loins, the tell-tale warning of impending climax. You grip your lover’s ass, squeezing her until the turkey-tail plug threatens to pop out, and juices pour out around your thrusting prick. With an exultant cry, you let yourself go inside her, giving way to the sweltering grip of her pussy. ");
	if(pc.hasCock()) output("Canada squeals as she feels the first spurt of [pc.cumNoun] inside her, a sticky trail of spooge flooding her sex with cum");
	else output("Your hardlight cock reverberates with sensory feedback, sending shocks of pleasure through you just like a real orgasm");
	output(". You can feel every twitch and squeeze of the cow-girl’s cunt around your shaft, working you through it until you’re left gasping and panting with the aftershocks, gripping Canada’s waist tight and holding her close.");

	output("\n\n<i>“I think that’ll be a very, very good load of syrup,”</i> the turkey-cow murmurs, pulling herself out from the bucket and gently pushing it aside. You grin and rub her big, soft behind affectionately.");

	output("\n\nAfter a moment, Canada adds, <i>“I could go give this to Ellie... unless you’d like to spend some more time together?");
	if(flags["REPEAT_GOBBLES_MILKED"] == undefined) 
	{
		output(" We never got much chance to really enjoy each other last time. O-or does that sound silly? It does, doesn’t it....");
	}
	else 
	{
		output(" If you have time, that is....");
	}
	output("”</i>");

	processTime(25);
	pc.orgasm();
	clearMenu();
	//[Cuddle] [Finish]
	addButton(1,"Finish",goTradeYerBucketOSyrupFuckYallImOut,undefined,"Finish","That’s enough for now. Tell Canada to go trade in that bucket of syrup. You’ll see her later.");
	addButton(0,"Cuddle",cuddleWithCanadaWenchesWooWooWooWooWoo,undefined,"Cuddle","Stay with Canada for a little while longer. There’s nothing like spending the afterglow wrapped in your lover’s arms, is there?");
}

//No // No Cock Version
public function noCockTurkeyBastingRoundIIYEehawAMURRICA():void
{
	clearOutput();
	gobblesHeader(true);
	output("You let the buxom cow-turkey have her fun, holding your lower body steady so she has something to rub back against. She gives you a grateful little smile over her shoulder, which quickly turns into an O-shaped ring of ecstasy as you squeeze her nipples harder to the rhythm her hips are setting.");
	output("\n\nHer movements become faster and more frantic over time. The bucket fills quickly, however, spurred on by the waves of pleasure crashing through Canada’s overstimulated body. She takes her milking like a champ, mooing and squealing excitedly as your fingers move faster, tugging and squeezing harder to get every drop of dark amber from her deep reserves. The more she grinds against you, and the more urgent your own motions become, the thicker and stickier her syrupy offering becomes. You can’t help but bring a few sticky fingers to your lips to taste it; it’s every bit as sweet as you imagined, liquid candy on your [pc.tongue].");
	output("\n\n<i>“Tastes great,”</i> you tell her, digging your licked-clean hand into her big, soft ass for a playful squeeze.");
	output("\n\nShe responds with a wiggle and a pleased moo, resting her hands on yours and lacing fingers with you. The bucket’s getting full now, filling with waves of sweet-smelling maple, enough to make your eyes water when you breathe in deep. Canada’s getting close to drained, her tits visibly shrinking since you started, letting your hands cup more and more of her expansive rack. Even empty, though, you can’t imagine the cow’d have anything less than a mammoth bust, big enough to make a normal girl topple over with its sheer weight.");
	if(pc.isMischievous()) output(" You can’t even guess how she stands up when she’s full of thick syrup!");

	output("\n\nBefore she’s totally empty, though, Canada seems intent on rubbing out a climax through her soaked-through white panties. With an exasperated sigh, you reach around and give the poor turkey a hand, yanking down her garter and underpants and leaving her with a bare pussy fringed with a dainty tuft of red hair, and a pair of tall white stockings that nicely frame the full moons of her rump. You lick your fingers clean before sliding them into her - her lips part easily around you, though her whole body eases forward under the gentle pressure, culminating in a mooing moan and a huge spurt of amber syrup from her teats as the shock of pleasure spreads through her.");

	output("\n\nCanada wiggles her hips for you and leans back into your hand, taking your digits as deep as they’ll go. <i>“That’s nice,”</i> she purrs, slowly humping back against you. You chuckle and slide yourself in to the last knuckle, giving the panting cow-girl something nice and thick to fuck herself on. It isn’t long before your digits are awash in warm, thick juices, squirting out of Canada’s gaping hole as she cums. A final, triumphant spurt of syrup geysers out of her nipples, splattering on the rim of the totally-full bucket - just as her fem-cum drools onto the hay-covered floor around your fingers.");

	output("\n\nCanada gasps and moans, groping her still-huge rack and squeezing out the last drops, still shivering with the aftershocks of her orgasm. <i>“I think that’ll be a very, very good load of syrup,”</i> the turkey-cow murmurs, pulling herself out from the bucket and gently pushing it aside. You grin and rub her big, soft behind affectionately - and smearing a bit of her pussy-juices across the smooth curve.");

	output("\n\nAfter a moment, Canada adds, <i>“I could go give this to Ellie... unless you’d like to spend some more time together? ");
	//if 1st:
	if(flags["REPEAT_GOBBLES_MILKED"] == undefined) output("We never got much chance to really enjoy each other last time. O-or does that sound silly? It does, doesn’t it....");
	else output("If you have time, that is....");
	output("”</i>");

	pc.lust(25);
	processTime(5);
	clearMenu();
	//[Cuddle] [Finish]
	addButton(1,"Finish",goTradeYerBucketOSyrupFuckYallImOut,undefined,"Finish","That’s enough for now. Tell Canada to go trade in that bucket of syrup. You’ll see her later.");
	addButton(0,"Cuddle",cuddleWithCanadaWenchesWooWooWooWooWoo,undefined,"Cuddle","Stay with Canada for a little while longer. There’s nothing like spending the afterglow wrapped in your lover’s arms, is there?");
}

//[Finish]
//That’s enough for now. Tell Canada to go trade in that bucket of syrup. You’ll see her later.
public function goTradeYerBucketOSyrupFuckYallImOut():void
{
	clearOutput();
	gobblesHeader(true);
	output("<i>“I’m sure Ellie will be happy to have it,”</i> you say, standing up with a languid stretch. Your bovine companion nods her understanding and gathers up her scant clothing. With her cup size drastically reduced by the milking, she’s at least able to get her bra on without trouble. Her panties and syrup-stained top make her look like she’s just taken a dunk in the pool, but Canada shamelessly hefts up the bucket and scampers back down to the barn floor - though not without giving you an affectionate kiss on the cheek first.");
	output("\n\n<i>“Thanks for the milking, [pc.name],”</i> she adds. <i>“I’m glad I have you to help me...”</i>");
	output("\n\nYou answer with a playful swat on her big, bouncy butt, sending her giggling down the stairs. You follow after a few moments, to the amused looks of several cows lounging around.");
	gobblesRepeatSexEndCleanup();
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Cuddle]
//Stay with Canada for a little while longer. There’s nothing like spending the afterglow wrapped in your lover’s arms, is there? 
public function cuddleWithCanadaWenchesWooWooWooWooWoo():void
{
	clearOutput();
	gobblesHeader(true);
	output("<i>“I’d like that,”</i> you say simply, tossing some fresh hay over the mess the two of you made before reclining on the loft’s floor. Your turkey-cow friend makes an excited mooing noise and sets her bucket aside. She eagerly hops into your waiting arms, giving you a face-full of feathers as she grinds her still-wet behind into your ");
	if(pc.hasCock() && pc.isCrotchGarbed()) output("bulging crotch");
	else if(pc.hasCock()) output("stiff, as-yet-unused cock");
	else output("crotch");
	output(". You chuckle as the feathers tickle your nose, leaving your vision a sea of reds and browns. A quick swat on her ass communicates your displeasure, and Canada rolls up onto her knees with an apologetic look.");

	output("\n\n<i>“S-sorry. I’ve been wearing the tail so long now, I forget it’s there sometimes,”</i> she giggles.");

	output("\n\nCanada slowly reaches behind herself and, with a little gasp, pops her tail-backed buttplug out and lets it clatter to the floor. She blushes a bit as your eyes play across her bouncy backside, cheeks slightly parted where her tail used to be, and still deliciously damp after her panty-soaking orgasm. She wiggles herself for your enjoyment, making her lush curves jiggle and bounce until she bursts out laughing and rolls back into your embrace, giggling to herself as your arms wrap around her waist.");
	output("\n\n<i>“Mmm. This is nice,”</i> she murmurs, nuzzling into your arms.");
	if(pc.hasCock()) 
	{
		output(" After a long, peaceful moment, she adds, <i>“I love feeling your [pc.cockNoun] pressing up against me. So warm and hard and nice...”</i>");
		output("\n\nAs if to emphasize her point, Canada wiggles her wide hips, grinding herself against your [pc.crotch]. ");

		//if PC didn’t fuck her earlier: 
		if(!pc.hasStatusEffect("CreamedGobbleCunt")) output("You don’t complain when one of her hands slips down and starts playing with your [pc.gear], getting it out of the way of her and your cock. ");
		output("With a little work, she manages to pop your prick in between her big, soft butt cheeks, trapping you in a valley of soothing warmth. Her cheeks come together just tight enough to urge you to full hardness, her every breath and motion teasing your length until you can feel a little trickle of pre beading at your tip, drooling into her crack. She giggles when your [pc.cumNoun] drools onto her skin. That movement of hers, though, brings you tantalizingly close to the still-open rim of Canada’s back door. The dark hole threatens to suck you in, its gaping ring kissing and teasing your [pc.cockHead] until it’s a force of effort not to just sheathe yourself inside her.");

		output("\n\nAs if reading your thoughts, your bovine lover hooks one of her legs around ");
		if(!pc.isNaga()) output("yours");
		else output("your serpentine hind end");
		output(" and offers, <i>“You can... you can put it in me if you want. I feel all loose and weird without something in my butt anyway.”</i>");
	}
	//PC has no cock (append to prev. para.):
	else 
	{
		output("After a moment, Canada blushes and adds, <i>“You’re nice. So much nicer than anyone else here...”</i>");
		output("\n\nYou smile at the poor cow and squeeze her tight. ");
		if(pc.libido() >= 75) output("Your body flushes hotly at the thought of Canada showing her gratitude in all the right ways ");
		else output("Your bovie friend murmurs something under her breath about showing her gratitude, lazily looking back at you and planting an affectionate kiss on your cheek");
		output(".");
	}
	pc.lust(5);
	processTime(10);
	//[Butt Baste] [Pussy Gobble] // [Just Snuggle]

	clearMenu();
	//Butt Baste
	//Slide your cock into the warm, welcoming embrace of her plug-stretched ass. 
	if(pc.hasCock()) addButton(0,"Butt Baste",buttBasteDatTurkey,undefined,"Butt Baste","Slide your cock into the warm, welcoming embrace of her plug-stretched ass.");
	else addDisabledButton(0,"Butt Baste","Butt Baste","You need a penis for this scene.");
	//Pussy Gobble
	if(pc.hasVagina()) addButton(1,"Pussy Gobble",pussyGobble,undefined,"Pussy Gobble","Ask Canada to show her gratitude by taking you on a pussy-eating ride.");
	else addDisabledButton(1,"Pussy Gobble","Pussy Gobble","You need a vagina for this scene.");

	//Just Snuggle
	//No sex this time. 
	addButton(3,"Just Snuggle",justSnuggleWithGobblesUSloot,undefined,"Just Snuggle","No sex this time.");
}

//Just Snuggle
//No sex this time. 
public function justSnuggleWithGobblesUSloot():void
{
	clearOutput();
	gobblesHeader();
	output("You rub Canada’s flank, but make no move beyond that affectionate gesture. She understands, and seems more than content to just recline in your arms, snuggling up against you as the time passes you by. After a long while, you realize that your companion isn’t just relaxing anymore, but has actually fallen asleep, snoring ever so softly.");
	output("\n\nYou tisk your tongue and pile a little extra hay under her head as a makeshift pillow before you stand up, content to leave her snoozing for now. You gather your gear and head back downstairs.");
	processTime(6);
	clearMenu();
	gobblesRepeatSexEndCleanup();
	addButton(0,"Next",mainGameMenu);
}

//Butt Baste
//Slide your cock into the warm, welcoming embrace of her plug-stretched ass. 
public function buttBasteDatTurkey():void
{
	clearOutput();
	gobblesHeader(true);

	output("Your bovine lover is adept at offers you can’t refuse, isn’t she? The feeling of her open, inviting asshole kissing your crown is just too much to resist. You shift your hips slightly, angling your pecker with the cow-girl’s eager hole, and give her the filling she wanted. Canada squeals as you slide into her, a high-pitched cry of pleasure that lasts until your hips are flush with her full cheeks, your cock completely sheathed in the broiling vice of her ass. You could swear her buttplug must have been a carbon copy of your dick, the way she feels around you.");
	output("\n\nShe squeezes you tight, a vice-like grip that threatens to milk you to orgasm");
	if (pc.hasStatusEffect("CreamedGobbleCunt")) output(" again");
	output(" in record speed. You grunt, grabbing one of her buttcheeks and trying to pry her loose, but the amorous cow holds you firmly. Her only answer is to playfully moo and wiggle back against you, making the muscles of her ass wring you until you can barely hold back. Well, if she wants to play it that way....");
	output("\n\nYou reach around her broad thighs and delve in between her spread legs, finding her red-maned cunt and slipping a few fingers in easily. Her still-warm fem-cum is the perfect lube to slip your digits in, duck-billing them through her slit and them making a nice, thick fist inside her. Canada gasps, planting her hands on her belly as you ball up inside her and thrust in. If you thought her ass was tight before, god <i>damn</i> is it now! Your lover cries out and clenches hard enough to shatter your remaining willpower, and you feel yourself cumming");
	if (pc.hasStatusEffect("CreamedGobbleCunt")) output(" again");
	output(". Canada’s groans turn into a sudden, happy gasp as she feels the first shot of your seed baste her bowels, shooting deep into her vice-like hole.");
	output("\n\n<i>“Like that?”</i> she giggles. You answer by drilling your fist deeper into her cunt, pushing in until you can feel the her wide channel bottom out against your knuckles. <i>“I guess so...”</i>");
	output("\n\nYou let her over-eager ass milk out the cum from you, draining you dry in the span of moments. You shiver at the sensation of being trapped between her hot walls and the cooling, sticky mess of your own cum... but your spunk also serves as a perfect lube to let you finally move, pulling yourself half-way from Canada’s backside. She moos loudly when you slam yourself back in again, finally rolling the cow onto her face and mounting her properly. She squeals and wiggles, clearly enjoying the pounding - and with your fist out of her cunt, you can see her excitement clear as day, squirting over your thighs and the hay-coated floor. Your hands grip her big old hips and bare down on her, turning the cuddling she’d been asking for into a rough buttfucking that has the whole loft rocking.");
	output("\n\nYou could have sworn that her tits were as empty as they could be, but somehow Canada manages to squirt and drool from her puffy nipples again. She grabs them and squeezes, eliciting a little extra pleasure while you hold the rest of her body hostage. You speed up, hammering her wonderful ass until she’s screaming for more, joining the cacophonous voices from the milking barn below. Her spewing juices quickly turn into a tide of fem-cum, presaging an anal orgasm that has her milking you even harder than before. You race to join her in orgasm, filling her welcoming bum with another wave of [pc.cumNoun].");
	output("\n\n<i>“I feel better already,”</i> Canada coos, rocking her hips back, drawing your cock in to the hilt before you can pull out of her, giving her one last full draw of pleasure.");
	output("\n\n<i>“So, what now, [pc.name]?”</i> she adds, rolling onto her back and smiling up at you, spunk drooling from");
	if(pc.hasStatusEffect("CreamedGobbleCunt")) output(" both holes");
	else output(" her ass");
	output(". <i>“Do you... want to stay a while longer, eh?");
	if(!pc.hasStatusEffect("CreamedGobbleCunt") && pc.hasVagina()) output(" I’d feel bad if I didn’t at least play with your pussy a little, too, after what you did to me.");
	output("”</i>");
	processTime(16);
	pc.orgasm();
	//[Finish] [Pussy Gobble]
	clearMenu();
	addButton(0,"Finish",abandonGobblesIMeanFinishGobbles,undefined,"Finish","Wrap this turkey up to go.");
	if(pc.hasVagina()) addButton(1,"Pussy Gobble",pussyGobble,undefined,"Ask Canada to show her gratitude by taking you on a pussy-eating ride.");
	else addDisabledButton(1,"Pussy Gobble","Pussy Gobble","You need a vagina for this scene.");
}


//Pussy Gobble
//Ask Canada to show her gratitude by taking you on a pussy-eating ride. 
public function pussyGobble():void
{
	clearOutput();
	gobblesHeader(true);
	output("Well, you won’t say no to that....");
	output("\n\nYou push Canada down and shift to straddle her shoulders, planting your " + possessive(pc.vaginaDescript()) + " lips on the bridge of her nose. Your bovine lover reaches up and gives you an experimental lick, then giggles. <i>“You taste good,”</i> she laughs, blushing a bit as she realizes what she’s saying. Her eyes dart away from yours as she adds, <i>“I never thought girl-parts would taste good before the Treatment... now they’re like candy.”</i>");
	output("\n\nYou chuckle and ruffle her hair");
	if(pc.isMischievous()) output(", telling her she’s <i>sweet</i> for saying so");
	output(". Her tongue darts back out, slithering between your lips, and her hands reach up to caress your thighs and hips, holding you steady. A few more licks like that, with her wide bovine tongue dragging through the cleft of your cunt, and you feel like a pussy buffet for the amorous cow: she’s positively eating you up, digging in with ardor. She’s got a talented tongue that easily finds its way deep in you, caressing every hidden sensitive spot and slathering your hole with warm, slick spittle to mix with your steadily flowing juices. Canada’s cheeks are flush with red, shimmering with your fem-spunk before long - her tongue’s like a scooper, digging in deep before drawing all your [pc.girlCumNoun] out.");
	output("\n\nHer tongue is so big and thick, in fact, that you’re able to play with it like a wriggling cock. Despite her hold on you, you start to move your [pc.hips] over Canada’s face, bucking overtop her. She moos in surprise, but gathers herself quickly, just using her hands to guide your motions now. You take it slow for her sake, undulating atop her in languid waves, letting her bury herself to the hilt in your box at the climax before coming down to rest on her face just as she’s drawn out to the tip. You never let her leave you, always having some small part of her wide tongue inside your needy twat, teasing those sensitive spots she’s so adept at finding.");
	output("\n\n<i>“Fashtah,”</i> she murmurs after a while, barely comprehensible with her tongue halfway in your twat. <i>“Go fashtah.”</i>");
	output("\n\nThat’s an idea you can get behind - especially when the cow takes an uncharacteristically assertive action and gives your [pc.butt] a little smack. Your breath catches, and your [pc.vagina] tightens enough around her probing muscle to make her squeal, but you accede to her request and pick up the pace. Before long she’s got you bucking like an old-world cow" + pc.mf("boy","girl") + ", thrusting your hips onto the pillar of her bovine tongue and screaming your pleasure as she works to drive you to orgasm.");

	output("\n\nIf she’s so eager, you’re more than happy to give in to her. You grind and ride her face until you can’t help but scream, arching your back as the cow-turkey drives her probing tongue so deep into you you’d swear she’s touching your womb. Once there, she refuses to withdraw, instead busying herself with wriggling, tentacle-like motions that drive you wild inside. Under an assault like that, you couldn’t stop yourself from cumming even if you wanted to - and you <i>desperately</i> want to.");
	output("\n\nShudders and shocks of pleasure burst through you, echoing up your spine in crashing waves - and out of your cunt in wet squirts, bathing Canada’s cheeks in [pc.girlCumNoun]. She squeals excitedly, eagerly lapping up every drop you can give her like a starving woman. Even when, panting and gasping, you roll off of her, she just eagerly licks her cheeks until they’re spotless, then slips down and buries her face between your [pc.legs], silently confident you can go again. You whine and dig your fingers into the hay as your lover’s tongue probes back into you, happy to clean you inside and out.");
	output("\n\nBy the time she’s done, you can barely feel your [pc.legOrLegs].");
	output("\n\n<i>“So sweet!”</i> she declares, rising to her knees and wiping her chin on the back of her hand. <i>“Milking");
	if(pc.hasStatusEffect("CreamedGobbleCunt")) output(", a rough fuck,");
	output(" and a snack! You’re too good to me, [pc.name]!”</i>");

	output("\n\n<i>“Anytime,”</i> you groan weakly, still trying to catch your breath.\n\n");
	pc.createStatusEffect("CreamedOnGobbleFace");
	processTime(15);
	finishGobblesStuff();
}

public function abandonGobblesIMeanFinishGobbles():void
{
	clearOutput();
	finishGobblesStuff();
}

//Finish connects here]
public function finishGobblesStuff():void
{
	output("You struggle to your [pc.feet] and gather up your gear, stopping just long enough to ruffle Canada’s hair and give her a long, wet kiss on the lips");
	if(pc.hasStatusEffect("CreamedOnGobbleFace")) output(", tasting yourself still hot on her pillowy angel bows");
	output(". You help your friend into her bra and panties, still soaked though they are, and send her back downstairs with a playful swat on the rear. She giggles and gets going, calling over her shoulder, <i>“Thanks so much, [pc.name]! I’m so glad ");
	if(flags["REPEAT_GOBBLES_MILKED"] == undefined) output("I met you!");
	else output("we could spend some time together!");
	output("”</i>");
	output("\n\nYou get dressed and follow her down, grabbing a towel from one of the stalls to clean yourself up as you go. ");
	gobblesRepeatSexEndCleanup();
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function gobblesRepeatSexEndCleanup():void
{
	//Track if sexed with newGobbles
	if(flags["REPEAT_GOBBLES_MILKED"] == undefined) flags["REPEAT_GOBBLES_MILKED"] = 1;
	else flags["REPEAT_GOBBLES_MILKED"]++;
	//Strip her statuseffects from the PC
	pc.removeStatusEffect("CreamedGobbleCunt");
	pc.removeStatusEffect("CreamedOnGobbleFace");
	//flags["GOBBLES_SEXYTIMES_STARTED"] = 0;
	flags["GOBBLES_COOLDOWN"] = 0;
}
