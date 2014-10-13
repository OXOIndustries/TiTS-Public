public function gobblesHeader():void
{
	showName("\nGOBBLES");
	showBust("GOBBLES");
	author("Savin");
}

public function gobblesAvailable():Boolean
{
	var currDate:Date = new Date();
	
	if (flags["GOBBLES_EVENT_DATE"] == undefined || flags["GOBBLES_EVENT_DATE"] < currDate.fullYear)
	{
		// Play for future dates, plus room "because nice". Also because fuck doing something to tie it to a single day that moves around every year.
		// 0-indexed month numbers. Woo.
		if (currDate.month == 9 && (currDate.date >= 10 && currDate.date <= 15))
		{
			return true;
		}
	}
	
	if (silly)
	{
		// Once every 7 in game days whilst silly is enabled methinks.
		if (flags["GOBBLES_SILLY_DAYCOUNT"] == undefined || flags["GOBBLES_SILLY_DAYCOUNT"] < days - 7)
		{
			return true;
		}
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
	if (pc.height > 66) output(" up");
	else if (pc.height < 52) output(" down");
	output(" at you. She can’t be much more than five feet tall, and her Treated cup-size is simply ludicrous on her small frame, a pair of GG-cups that strain her faux-moccasin bra and threaten to burst the seams at any moment. Even those gloriously over-sized melons can’t entirely distract you from what’s behind her, though: a great big plumage of feathers is sticking out from under her panties and garter belt.");
	if (CodexManager.entryViewed("The Treatment")) output(" That’s not a normal Treatment effect, is it?");
	else output(" Those can’t be natural, can they?");
	
	output("\n\nThe feathery cow-girl stares at you with pensive blue eyes, her fingers still wrapped around your arms. Nervously, she manages to stammer out. <i>“S-sorry... would you mind helping me with, uh, with...”</i> her gaze shifts abashedly downwards, settling on the massive rack jutting out from her chest. A pair of reddish-brown feathers are pinned to the front of her bra, swishing softly with every breath she takes.");
	
	output("\n\n");
	if (pc.isNice()) output("<i>“Is something wrong?”</i>");
	else if (pc.isMischievous()) output("<i>“Need a little hand?”</i>");
	else output("<i>“What’s wrong?”</i>");
	output(" you ask.");

	// 9999 - add tit milker check
	if (StatTracking.getStat("milkers/prostate milker uses") > 0)
	{
		output("  You’re not used to cows coming right up and asking for help. There’s attendants for that, after all.");
		if (StatTracking.getStat("milkers/prostate milker uses") > 0) output(" Not that you wouldn’t mind a little hands-on time with the cute little redhead.");
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

public function orderUpOneTurkeySlut():void
{
	clearOutput();
	gobblesHeader();

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
	
	output("\n\nIn answer, you reach behind the blushing redhead and give her ass a two-handed smack, digging your fingers into the big bubble butt she’s hiding under those cow-pattern panties. She squeals, her plume of feathers bouncing with her jiggly cheeks. The look in her eyes you she wants more, and you’re more than happy to give it: you slip your hands under her panties and give them a yank down to her thighs, baring her ass and the juicy little box of her pussy, hot against your own [pc.crotch].");
	
	output("\n\n");
	if (pc.isTreated()) output("Your Treated instincts remind you that a girl always gives the sweetest milk - or in this case, syrup - when she’s gone something nice working between her legs");
	else output("You suddenly remember an old urban legend of girls giving the sweetest milk when they’ve got something fun between their legs");
	output(", and you quickly move one of your hands around the cow’s thigh and into the valley of her cunt. She gasps as a finger traces through her wet slit, but her body speaks for her: her hips rock against your hand, drawing several of your digits into her welcoming hole. She starts to move immediately, shifting her hips overtop your spearing fingers, riding them like a cock. You can taste the difference immediately, her syrup coming sweeter and richer between your [pc.lips]. The flow is still slow enough that you can savour every drop, rolling the thick candy-sweet bounty across your [pc.tongue] before swallowing a mouthful every minute or so. It’s a much slower, less frantic milking than most cows ever get, but it still doesn’t take long for her to start huffing and puffing, panting and moaning as she grinds on your fingers and fills your mouth with her lactic bounty. Squeezing her behind and driving your digits deeper, you switch from one tit to the other, coaxing out a new stream of syrup from the thus far unused boob.");
	
	output("\n\nMinutes pass in blissful suckling, and you’re sure you’ve drained gallons of sticky syrup from her over-sized breasts - they even <i>look</i> smaller now! Her movements become more desperate as you continue to drink from her, the cow’s hips grinding faster on your fingers. She draws you deep into her wet, hot channel, bounding on your digits and slathering them with her juices. They’re different than a normal girl’s, you quickly realize: her cunt’s way hotter than normal, and your fingers are actually getting a little sticky from the treatment. You’re starting to smell a little something else, too, a tinge of sweet spice and cinnamon that makes your mouth water even more.");
	
	output("\n\nShe blushes when you ask her and admits <i>“I’ve got a few mods down there, too. I’m really tasty now. Do you want to have a taste, eh?”</i>");

	pc.lust(5);
	processTime(10);

	// [Sweet Pussy Pie] [Nah]
	clearMenu();
	addButton(0, "PussyPie", orderUpOneTurkeyCuntPie);
	addButton(1, "Nah", noThanksGobblesNoPie4Me);
}

public function noThanksGobblesNoPie4Me():void
{
	clearOutput();
	gobblesHeader();

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
	gobblesHeader();

	output("You’ve got to try this.");
	
	output("\n\nYou nod eagerly, and the busty cow quickly scrambles off of you - leaving a noticeably hot, sticky mess on your hand and a trickle of syrup running down your chin. She shimmies out of her panties, tossing them in the same pile as her feathery bra, and bends over for your inspection. You plant your hands on her big, jiggly butt, smacking the cheeks just hard enough to make them bounce for you. You spread her backside open, revealing the base of her plumage of feathers: a big, black buttplug that’s stretching her keister wide. She moans when you run a hand across the base of her feathers, giving the plug a little jiggle inside her. Your eyes are drawn down after that, to the well-stretched slit of her cunt. Her hole is fringed by a mat of carefully trimmed, downy red pubes that form a distinctly leaf-shaped pattern around her pussy.");
	
	output("\n\nYou lean into her crotch, taking a deep whiff of the sexy scent bubbling off her hot box. It takes a moment to fully recognize it, but when you do, your eyes wide. <i>“Pumpkin?”</i>");
	
	output("\n\n<i>“Spiced pumpkin,”</i> the cow grins, and before you can blink, she’s learned her big booty back into your face, mashing her crotch into your face and slathering you with her pussy. <i>“It’s my favorite... tasty, eh?”</i>");
	
	output("\n\nYou have to admit, it is. Your tongue instinctively darts out into the loose, warm channel pressed against your mouth, eagerly exploring it. The cow moans as you slide into her, her bent back arching happily as your [pc.tongue] slithers across her warm walls, teasing the lush confines of her channel and lapping up the delicious pumpkin-juice inside. It’s almost as sweet as her milk was, and a welcome change of pace from what feels like gallons of syrup churning in your belly.");
	
	output("\n\nYou make steady, long circles through the turkey-cow’s passage, drinking deep of her sweet nectar. It’s an order of magnitude tastier than what you can get at Apollo’s Coffee - this girl could make bank bottling from both sides, you think to yourself between languid licks. The longer you eat her out, the more thoroughly you find your face buried in the cow’s behind. Before long, you’re lodged between her big cheeks, completely enveloped in her lush backside and rapidly losing yourself in her wonderfully modded pussy.");
	
	output("\n\nAfter a few minutes of this treatment, you can feel the cow-girl tightening up a little, her body running hotter around you. Her moans deepen, down to a long, bellowing <i>“mooooo”</i> - she’s cumming! You hold the line, keeping up that same rhytmic pace as the cow-girl climaxes, her pussy squeezing hard around your [pc.tongue]. You slap and squeeze her butt, spanking her hard enough to make her clamp hard around your tongue, trapping you in a sea of boiling pumpkin spice until her orgasm passes. It’s as long and messy as a Treated girl’s can get, ending with your face smeared with a delightfully musky mix of spicy juice, dripping down your cheeks to join the veneer of syrup no doubt still clinging to you. You’re going to need a shower after you get through with this girl!");
	
	output("\n\nYou slowly pull yourself out from the cow’s backside, giving her a parting spank and watching appreciatively as her turkey-themed buttplug jiggles a little deeper into her. She coos, cupping one of her now-smaller breasts and wiggling her hips for you. That ass of hers is amazing... you could lose yourself in it if you aren’t careful. You’d like nothing more that to cuddle up with that butt, to say nothing of the huge boobs blatantly visible between the cow’s cum-splattered thighs.");
	
	pc.lust(10);
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
	gobblesHeader();

	output("\n\nYou tell the syrupy cow-gal that you think you’ve had enough of her unique blend for today.");
	
	output("\n\n<i>“Oh,”</i> she says, flushing hotly. Her pussy clenches around your digits like it doesn’t want to let go, but eventually its owner is able to pry herself off of your lap. You watch with keen interest as the cow-girl pulls up her panties. She looks over her shoulder and gives you a bashful smile as she wiggles herself back into her cow-patterned panties. <i>“Thanks for the milking, " + pc.mf("mister", "miss") + ",”</i> she says quietly, stuffing herself back into her feather-adorned bra. <i>“Sorry if I was a bother. You were really gentle and nice.”</i>");
	
	output("\n\nYou smile at the turkey-themed cow and wave as she slips out of the stall, her bust considerably lighter looking.");

	processTime(3);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function orderUpOneCumshakeForTurkeySlut():void
{
	clearOutput();
	gobblesHeader();

	output("You slip off your [pc.gear] and pat your thigh, telling the cow that you’d appreciate a little help with your [pc.cock]. You hadn’t even noticed how horny you were getting, but now that she’s drawn attention to it... hoo boy. She chews her lip, giving you a playful grin as she slips down to her knees between your [pc.legs], her plumage flicking behind her. She wraps a hand around your [pc.cock] and gives it a tentative stroke, breathing deep of your scent. Her eyes flutter, and you soon find yourself with a busty cow-girl nuzzling your member, drawing the pre-slick shaft up her cheek until the crown crests her lips.");
	
	output("\n\nShe gobbles your member down with gusto, taking you to the hilt in one swift motion");
	if (pc.balls > 0) output(" that leaves her chin pressed into the swell of your [pc.balls]");
	output(". Her big blue eyes glance up at you, clouding with pride as you give her an approving smile and moan. Her big, bovine tongue wraps around your shaft and her mouth pulls back to your [pc.cockHead], slathering you with drool. Her mouth works hard to get you ready, pumping up and down your shaft with ready abandon until you’re on the brink of orgasm. If there’s one thing Treated girls know how to do, it’s handle a cock with all the love in the world. She gently sucks and licks, covering your rod in gentle kisses");
	if (pc.balls > 0) output(" and cupping your balls oh so sweetly, rolling the heavy nads in her hand until you can feel the cum churning in them, ready to burst");
	output(".");
	
	output("\n\nJust before it’s too late, though, the cow releases your rod, letting it bob in the warm air. You groan, shifting your [pc.legs] against the hay-covered ground. Instinctively you reach for your rod, trying to bring yourself to orgasm where she would not, but the cow bats your hands away. Instead, after you’ve had a moment to calm down, the cow-girl cups her syrup-laden tits and hefts them up into your lap. <i>“They’re so much softer than any other cow’s,”</i> she boasts, wrapping her tits around your stiff prick with practiced ease. <i>“I’m full of nice, thick syrup instead of watery old milk, you know... can you feel the difference?”</i>");
	
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
	gobblesHeader();

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
	gobblesHeader();

	output("You answer by grabbing her under the arms and hefting the buxom cow up onto your lap, spearing her on your cock. She gives a shrill, startled moo as you [pc.cock] is rammed inside her, spreading that maple lead of pubes wide around your member. <i>“That.. that works too,”</i> she moans, settling onto your lap and locking your member in a silken, spicy vice. That’s all you needed to cum, and you quickly find yourself busting your nut into the cow’s welcoming hole. She gives a little groan as your first shot spills into her womb, but after that she’s all doe eyes and eager shifts of her hips, milking you just as easily with her pussy as with her breasts.");

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