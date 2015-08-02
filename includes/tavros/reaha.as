public function reahaBonusFunction():void
{
	if(flags["REAHA_IS_CREW"] == undefined) {
		author("Savin")
		if(flags["TALK_TO_LADY_1ST"] == undefined) addButton(0,"Woman",talkToBrothelLady);
		else if (flags["REAHA_BOUGHT"] == undefined && flags["TALK_TO_LADY_1ST"] == 1) addButton(0, "Woman", talkToBrothelLadyRepeat);
		else addButton(0,"Woman",talkToBrothelLadyRepeatAgain);
	}
	else addButton(0, "Woman", talkToBrothelLadyRepeatAgain);
	if (reahaAtBeths())
	{
		author("Savin");

		output("\n\nReaha is sitting quietly near the dance stage, watching with wide eyes as a ");
		output(RandomInCollection("ausar", "kaithrit", "human", "leithan", "rahn"));
		output(" girl shakes her stuff for the crowd. The little cow perks up when she sees you, flashing you a hopeful smile.");

		addButton(1, "Reaha", reahaBackAtBeths);
	}
}

public function reahaRecruited():Boolean
{
	return (flags["REAHA_IS_CREW"] != undefined);
}

//Is she onboard the ship?
public function reahaIsCrew():Boolean
{
	if(flags["REAHA_IS_CREW"] == 1) return true;
	return false;
}

public function reahaAtBeths():Boolean
{
	if (flags["REAHA_IS_CREW"] == 2) return true;
	return false;
}

public function reahaAtNewTexas():Boolean
{
	if (flags["REAHA_IS_CREW"] == 3) return true;
	return false;
}

public function reahaFree():Boolean
{
	if (flags["REAHA_FREE"] == 1) return true;
	return false;
}

//1. FOLLOWER STUFF
//Reaha (Approach Shipboard)
public function approachShipBoardReahaWhyDidntSavinCodeThisHeWasntExhaustedYesterday(doOutput:Boolean = true):void {
	if (doOutput)
	{
		clearOutput();
		author("Savin");
		userInterface.showName("\nREAHA");
		userInterface.showBust("REAHA");

		output("You make your way down to Reaha's quarters, and find her door open. Standing shirtless, the huge-breasted cow-girl looks up from the bucket of milk she's busily filling up, her tail swishing faster as you approach.");

		if(flags["REAHA_FREE"] == 1) output("\n\n<i>\"Hey, [pc.name]. What's up?\"</i>  Reaha says, flashing you a bright smile.");
		else output("\n\n<i>\"" + pc.mf("Master","Mistress") + "?\"</i>  she says, looking at you expectantly.");
	}
	/*[Talk]
	[Get Milk]
	[Give Item]
	[Sex]
	If Cock:
		{Bind & Fuck}
		{Titfuck}
	Vagoo:
		{Ride Strapon}
	[Appearance]*/
	clearMenu();
	addButton(0,"Get Milk",getAGlassOfMilkFromReapersCowsona);
	if(pc.lust() >= 33) addButton(2,"Sex",sexWithFollowerReaha);
	else addDisabledButton(2,"Sex");
	if (flags["REAHA_DONE_NEWTEXAS_SPIEL"] != undefined)
	{
		if (flags["REAHA_DONE_NEWTEXAS_FOLLOWUP"] == undefined) addButton(1, "Talk", talkWithFollowerReaha, undefined, "Talk", "Ask Reaha about her reaction to New Texas. You're probably in for a pretty long talk from the otherwise closed-mouth cow.");
		else addButton(1, "Talk", talkWithFollowerReaha);
	}
	else addDisabledButton(1, "Talk");
	if (!reahaAddictionTherapyAvailable()) addDisabledButton(3, "Addiction");
	else
	{
		addButton(3, "Addiction", reahaAddictionTherapy, undefined, "Addiction Therapy", "Help wean Reaha off of her pleasure patches. Fucking her brains out will help lessen her withdrawal.");
	}
	if (shipLocation != "500" || flags["MET_YAMMI"] == undefined) addDisabledButton(5, "Ice Cream", "Ice Cream", "If only you knew of a local ice cream parlor....")
	else if (pc.credits < 20) addDisabledButton(5, "Ice Cream", "Ice Cream", "If only you could afford a trip to the local ice cream parlor...."); 
	else if (!InCollection(reaha.milkType, GLOBAL.FLUID_TYPE_MILK, GLOBAL.FLUID_TYPE_CHOCOLATE_MILK, GLOBAL.FLUID_TYPE_STRAWBERRY_MILK)) addDisabledButton(5, "Ice Cream", "Ice Cream", "If only your resident " + reaha.fluidNoun(reaha.milkType) + "-dispenser could produce something more amenable to creating icy, creamy treats....");
	else addButton(5, "Ice Cream", reahaBreastMilkIceCream, undefined);

	if (shipLocation == "500") addButton(6, "Boot Reaha", reahaBootOffShip, undefined, "Boot Reaha", "Kick Reaha off the ship. Dropping her off on the homeworld might not be in her best interest, but hey. She's your property, anyway.");
	else addButton(6, "Boot Reaha", reahaBootOffShip, undefined, "Boot Reaha", "Kick Reaha off the ship. You can send her to hang out on Tavros Station");

	addButton(10,"Appearance",reahaFollowerAppearance);
	addButton(14,"Back",crew);
}

//Get Milk
public function getAGlassOfMilkFromReapersCowsona():void {
	clearOutput();
	author("Savin");
	userInterface.showName("\nREAHA");
	userInterface.showBust("REAHA");
	output("Cupping one of the cow's hefty tits, you ask if she's ready for a good milking. ");
	if(flags["REAHA_FREE"] == 1) output("<i>\"From you? Always, [pc.name],\"</i>");
	else output("<i>\"If that's what </i>you<i> want,\"</i>");
	output("  she says, a thin smile pursing her lips. Reaha slips in your arms, breasts pressing against you as she reaches toward her bed, grabbing a handful of fresh aphrodisiac patches. You take them from her, spinning her around until her big butt is grinding against your [pc.crotch], shoulders bared to you; one by one you rip the patches out of their packets, pasting them onto the cow-girl's back like stickers. With each one, her skin flushes a dark, hot red, radiating out around the drugged patches until you can feel Reaha's breath catching, her whole body trembling with shameless lust. Her cunt is drooling on just the second patch, and you can see her perky nipples stiffening, beading the first tiny drops of milk from her sheer arousal.");
	output("\n\nYou apply the last patch with a rough slap on her ass, leaving her tattooed flesh red and jiggling as the lusty venom seeps into her behind. She whines a pathetic little whimper, hips pushing back against your ");
	if(pc.hasCock() && pc.isCrotchGarbed()) output("growing bulge");
	else output("groin");
	output(" as your hands play up across her soft skin, caressing the curves of her wide hips and ample waist, hugging the buxom cow tight to yourself. She shivers at your every touch, squeaking out a cry of unabashed pleasure when your hands cup her bust, giving her teats just the lightest squeeze; your [pc.chest] press into her back, gently angling her toward one of the wide-brimmed buckets that litter her quarters. Her voice breaks into a soft \"Moooooo,\" as your fingers lock around her puffy teats, rolling her stiff, slick nipple between your thumb and forefinger, coaxing out the first few drops.");
	//If normal milk:
	if(chars["REAHA"].milkType == GLOBAL.FLUID_TYPE_MILK) output("\n\n<i>\"Ah, God, yeeesss,\"</i>  Reaha moans as a flood of pure white milk pours from her puffy teat, as thick and creamy as a real cow's. Pearly drops roll down your fingers as your work her nipples, pulling and squeezing her big areola. She moans and shudders, bracing herself against the bulkhead as you roughly massage her breasts, barely able to stifle another bovine moo as her cream pours and pours like water.");
	//Else if Chocolate Milk:
	else if(chars["REAHA"].milkType == GLOBAL.FLUID_TYPE_CHOCOLATE_MILK) output("\n\n<i>\"It's so dark!\"</i>  Reaha half-laughs as the dark stream of rich, chocolatey milk begins to pour from her breasts. She cups a hand under the cascading milk, letting it fill to overflowing before bringing her own motherly fluids to her lips. <i>\"And sweet, too!\"</i>");
	//Else if Honey:
	else if(chars["REAHA"].milkType == GLOBAL.FLUID_TYPE_HONEY) output("\n\n<i>\"O-oh God, it's so thick!\"</i>  Reaha groans as the viscous amber tricks in thick globs from her perky nipples, plopping in sinewy lines into the bucket. <i>\"So much thicker than milk... it almost hurts, but -- don't stop!\"</i>  she cries, grabbing your hands and squeezing them even harder to her teats, desperate to lessen her heavy load of sweet honey.");

	output("\n\n<i>\"This... this is what I paid sooooo much for,\"</i>  she sighs, legs quivering with pleasure. Her breathing becomes faster and faster, chest practically heaving as you milk her. Reaha bites her lip, choking back another moan as you squeeze harder and harder. With her quivering breath, her big, bovine hips push back against you, rubbing rhythmically against your [pc.crotch]. You grunt as her bare flesh presses hotly against you, slick with her own drug-addled lust, smearing feminine slime across your ");
	if(!pc.isCrotchGarbed())
	{
		if(pc.hasCock()) output("bare [pc.cockNounSimple]");
		else output("bare crotch");
	}
	else output("[pc.armor]");
	output(". You grab a handfull of her big ass and give her a slap, which only seems to make her gush harder -- from her cunt and her tits! Reaha lets loose a horny moo, tail wagging under your chin as she cries and moans at your rough touch, coming closer to boobgasm with every second.");
	output("\n\n<i>\"Harder,\"</i>  she whines, panting and moaning as the stream of [reaha.milk] surges like a firehose from her breasts, <i>\"God, God, let me cum! Please!\"</i>");
	if(pc.hasCock()) output("  she cries, practically humping herself up and down your hardening [pc.cockNounSimple].");

	processTime(5+rand(5));
	pc.lust(10+rand(10));
	//[Rough Milking] [Suckle] [Fuck Her]
	clearMenu();
	addButton(0,"Rough Milking",roughMilkingFollowerReaha);
	addButton(1,"Suckle",suckleFollowerReahasTits);
	addButton(2,"Fuck Her",sexWithFollowerReaha);
}

//Rough Milking
public function roughMilkingFollowerReaha():void {
	clearOutput();
	author("Savin");
	userInterface.showName("\nREAHA");
	userInterface.showBust("REAHA");
	output("You tighten your grip on the poor cow-slut's teats, fingers sinking into her soft, squishy boobflesh. They're practically deflating under your grip as more and more of her sweet [reaha.milk] floods out into the bucket, sloshing ever closer toward the brim as you continue to coax out her heavy load. Reaha groans as you squeeze her tighter, trying and failing to keep her voice from breaking into an ecstatic \"Moooooo!\" as she cums. Her [reaha.milk] flow practically explodes as her whole body quivers and quakes, from her big tits to her thighs as she creams herself, fem-spunk drooling lewdly from her sodden snatch as the boobgasm rocks her sultry form.");
	output("\n\n<i>\"Gaaaah!\"</i>  she cries, her mooing finally resuming a human tone as the steady flow of [reaha.milkColor] dies down to nothing but a trickle, smearing across your fingers. <i>\"O-oh fuck me, that... that feeling makes it all worthwhile,\"</i> she breathes, head resting");

	//if NotFree:
	if(flags["REAHA_SLAVE"] == 1) output(" heavily against the wall as she pants and heaves.");
	else output(" back against your shoulder, nuzzling against your [pc.chest] as she recovers from the boobgasm.");

	output("\n\nYou pat the cow-girl on one of her much-reduced breasts, leaving her soft flesh jiggling as you step back, looking for a towel to dry your hands off with.");

	pc.lust(10+rand(10));
	processTime(10+rand(5));
	
	//If Free:
	if(flags["REAHA_FREE"] == 1) 
	{
		output("\n\n<i>\"Hey, hold on there, cow " + pc.mf("boy","girl") + ",\"</i>  Reaha says giddily, taking your shoulder before you can wipe her [reaha.milk] off. <i>\"If I make a mess, I should clean it up, right?\"</i>");
		output("\n\nYou nod questioningly as Reaha takes your hand in hers, slowly slipping down to her knees, drawing your fingers to her flush lips. Her big, rounded tongue slips out, caressing your [reaha.milk]-smeared digits, drawing one into her mouth as she sucks her own cream from you. You suppress a sharp shudder as her inhuman muscles circles around your finger, wrapping it in warm, wet cow-tongue as she cleans you off, one finger at a time. You reach down and stroke the cow's bright red hair, giving one of her nubby horns a gentle rub as you urge her on, even after your hands are spotless. The cow-girl nuzzles against your hand, letting you cup her cheek as she nibbles on the tip of one of your fingers, biting it playfully as she traces her own hand up your thigh, ");
		if(!pc.hasCock()) output("caressing your cum-slick groin");
		else output("cupping the bulge of your half-hard erection");
		output(".");
		//stop, titfuck, or ride strapon
		clearMenu();
		addButton(0,"Stop",stopRoughMilkingReaha);
		if(pc.hasCock()) addButton(1,"Titfuck",titjobFromSlaveCow);
		else addDisabledButton(1,"Titfuck");
		addButton(2,"Ride Strapon",rideFollowerReahasStrapon);
	}
	//{If NotFree: Scene ends}
	else
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Stop
public function stopRoughMilkingReaha():void {
	clearOutput();
	author("Savin");
	userInterface.showName("\nREAHA");
	userInterface.showBust("REAHA");
	output("You gently brush Reaha's hand off your crotch, and she takes the hint in stride, merely holding your hand for a moment longer before letting go with a ginger kiss to your knuckles. <i>\"Thanks, [pc.name]. Wanna give me a few minutes to clean up?\"</i>");
	output("\n\nYou give her a nod -- and an affectionate pat on the ass -- as you collect your gear and head back to your cabin.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Suckle
public function suckleFollowerReahasTits():void {
	clearOutput();
	author("Savin");
	userInterface.showName("\nREAHA");
	userInterface.showBust("REAHA");
	output("Suddenly, you let go of the cow's big, full udders, hands moving down to her huge hips as she lets out a startled, forlorn cry. With a grunt, you flip Reaha around and push her up against the bulkhead, legs spread lewdly and tits bouncing, still pouring her [reaha.milk] down her chest. She whines, fingers diving into her slick slit as you move in close, cupping one of her huge breasts to your lips. <i>\"Be gentle,\"</i>  she breathes, but you know full well she wants anything but that.");
	output("\n\nWith a grin, you push Reaha's hands away from her sodden box, leaving her breathing hard with her pent up lust and gasping at your slightest touch as her body begs for release. You flick your [pc.tongue] out at her big teat, lapping at the stream of [reaha.milk] flowing from her bosom, tasting of the sweet");
	if(chars["REAHA"].milkType == GLOBAL.FLUID_TYPE_MILK) output(", rich milk, just like a real cows, but as thick as cream");
	else if(chars["REAHA"].milkType == GLOBAL.FLUID_TYPE_CHOCOLATE_MILK) output(", chocolate milk, dark and with just a hint of bitterness that stings your throat as you drink from her chocolatey bounty");
	else if(chars["REAHA"].milkType == GLOBAL.FLUID_TYPE_HONEY) output(" honey, letting the viscous amber roll across your [pc.tongue] is listless globs, rolling the over-sweet stuff around in your mouth between each swallow");
	output(". The cow-slut whines, chest heaving as you suckle from her, squeezing her huge teat between your teeth to coax more of her motherly bounty onto your lapping [pc.tongue].");

	output("\n\nDespite your whole vision being taken up by the great swells of Reaha's boobflesh, you can practically feel the heat welling up from her aching womanhood. Her arms flinch down toward her quaking thighs more than once, but you catch them every time: no fapping for her! Reaha cries out with insatiable lust, just a hair's breadth from her boobgasm; but it might as well be an eternity for the lusty cow as she tries to grind her soaking cunt against you, arching her back to push a little more of her tit into your eager mouth. You oblige her roiling lactic lust, cupping her breasts and digging in as hard as you can, sucking powerfully on her teat until your cheeks are bulging with [reaha.milk], ");
	if(chars["REAHA"].milkType == GLOBAL.FLUID_TYPE_MILK || chars["REAHA"].milkType == GLOBAL.FLUID_TYPE_CHOCOLATE_MILK) output("sweet cream");
	else output("viscous honey");
	output(" spurting out around her big areola to drool down your chin and smear across her hot flesh.");

	output("\n\nTrembling fingers hook through your [pc.hair], pulling you tight into Reaha's massive bust, trying to push every last inch of teat into your gaping maw. You gag down the  flowing bounty as best as you can, but the pressure is only getting more and more powerful as the cow-girl soars toward her orgasm. The cute little whines and cries she's making, just shy of mooing her mounting need, finally convince you to help the poor slut over the edge. Your fingers trail down her soaked body, sweetly caressing her thick thighs and big, motherly hips before slipping easily into the boiling wetness of her sex. Reaha cries out, back arching as your hand enters her, four fingers spreading her loose muff wide as your thumb tenderly rubs her lower lips, circling around the throbbing red button of her clit. It doesn't take much of that before you can see her skin redden, breath quickening as you start to thrust your hand into her, practically fisting the cow's puffy puss; she humps back, trying to draw more of you into her, riding your hand as hard as she can as her pitiful cries mount toward orgasmic shrieks.");
	output("\n\nYou smile as you feel the cowgirl cumming around your hand, vaginal muscles squeezing and spasming wildly around the thick fist pounding her pussy. [reaha.Milk] spurts into your mouth like a firehose, nearly pushing you off her teat. Your fist hammers back into her with renewed vigor until ");
	if(pc.isAss()) output("your unrelenting blows practically lift her off the ground");
	else output("your hand delves well past the wrist into her cavernous cunt");
	output(", and soon your fist is coated in thick, slick fem-cum as Reaha's orgasm gushes around you, staining her thighs and smearing lewdly across your arm.");

	output("\n\nHer orgasm draws on for the better part of a minute, dragged out by your relentless fucking. When the cow-girl comes down from her orgasmic high, she collapses, ");
	if(flags["REAHA_FREE"] == 1) output("slumping against you, breathing heavily as you catch the exhausted cowgirl in your arms");
	else output("slumping to the floor");
	output(". <i>\"O-oh god... so much,\"</i>  she groans, wiping the [reaha.milk] from her much-reduced bosom, <i>\"Fuck, I needed that...\"</i>");
	output("\n\nYou pat the cow on the head and head out, looking for a towel to dry all this [reaha.milk] off.");

	pc.lust(15+rand(15));
	processTime(25+rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Sex
public function sexWithFollowerReaha(doOutput:Boolean = true):void {
	if (doOutput)
	{
		clearOutput();
		author("Savin");
		userInterface.showName("\nREAHA");
		userInterface.showBust("REAHA");
		output("You give the cow-slut a little push up against the nearest wall, watching as her teats harden to pinpoint peaks as you lean in close; cupping one of her huge orbs, your other hand caressing her flared hip.");
		//If Free:
		if(flags["REAHA_FREE"] == 1) 
		{
			output("\n\nReaha giggles, back arching at your welcome advances. <i>\"Well, you know how to tell a girl you're ready, don't you? Come on, ");
			if(pc.tallness <= 68) output(pc.mf("handsome","cutie"));
			else output(pc.mf("big boy","big girl"));
			output(", I'm all yours!\"</i>");
		}
		// else if NotFree:
		else
		{
			output("\n\nReaha's cheek turns sharply aside as you grope her over-sexed body, your slightest touches making her wet enough that you can see her cunt glistening in the dim cabin lights. <i>\"J-just fuck me already,\"</i>  she groans, drawing a sharp breath as your fingers play across her prominent clit.");
		}
	}
	clearMenu();
	if(pc.hasCock()) addButton(0,"Titjob",titjobFromSlaveCow);
	addButton(1,"Ride Strapon",rideFollowerReahasStrapon);
	if(pc.hasCock() && pc.cockThatFits(chars["REAHA"].analCapacity()) >= 0) addButton(2,"Buttfuck",tieUpReahaAndFuckHerButt);
	else addDisabledButton(2,"Buttfuck");
	addButton(14,"Back",approachShipBoardReahaWhyDidntSavinCodeThisHeWasntExhaustedYesterday);
}

//Titjob
public function titjobFromSlaveCow():void {
	clearOutput();
	author("Savin");
	userInterface.showName("\nREAHA");
	userInterface.showBust("REAHA");
	var x:int = pc.cockThatFits(400);
	if(x < 0) x = pc.smallestCockIndex();
	output("Your wandering hand snakes up Reaha's supple skin, caressing the side of one of her big, leaky breasts, stopping just long enough to pinch the prominent teat, drawing forth a clear bead of [reaha.milk] and a hiss of pleasure from the cow-slut. <i>\"What do you say we put these to work?\"</i>  you grin, teasing her huge nipples as the ");
	if(chars["REAHA"].milkType != GLOBAL.FLUID_TYPE_HONEY) output("creamy");
	else output("sticky");
	output(" fluid trickles out and onto your deft digits. You give the cow a gentle push, pressing her back against the wall to keep her steady as you start to milk her harder, wrapping your fingers around her prominent teats to coax out her lactic bounty. It isn't long before [reaha.milk] is flowing down Reaha's huge bust, clear streams rolling across her smooth skin before waterfalling down, pooling between her feet. The cow visibly shudders with pleasure as you work her tits, biting her lip and moaning cutely, trying and failing to keep her sensual cries from spurring you on.");

	output("\n\nAs you milk your lusty cow-slut, you make sure to spread her [reaha.milk] around, cupping up handfuls of her sweet cream and smearing it back up into the sides of her full breasts, pressing the twin peaks together to form a pool and filling it to the brim with [reaha.milk]. With a little urging from you, Reaha presses her shoulders together, keeping her breasts nice and tight as you go back to milking, pinching one of her teats just hard enough to send a shiver through her that has waves wracking the shores of her titty-pool. Now that looks inviting... but you have other designs for the cow's buxom bust; you reach up and guide Reaha's head down, bending her neck until her little nose is almost cresting the surface of her [reaha.milk]. <i>\"Time for a drink,\"</i>  you command, probing a finger into the lake of her lactation and presenting the wetted finger to Reaha. She gives you a questioning look, but meekly obeys, her large cow-tongue lolling out to lap up the few drops on your long digit, practically wrapping your finger up as she suckles on it, cleaning off every last trace of her [reaha.milk] from you.");

	output("\n\nWithdrawing your finger, you push her tits up, inviting her to finish off what you've started. Reaha's tongue laps it up, drinking deep of her own [reaha.milk] even as you drain more and more from her teats, letting the warm, sweet lactation pour down her breasts and belly, long streams snaking down to her cunt and shivering legs. You let a hand follow the running rivulets of [reaha.milk] to her sodden box, a pair of fingers easily slipping in with the extra lubrication. Over-sensitive as ever, Reaha gives a loud cry of pleasure, forgetting her fluid-drenched tits as her back arches sharply, [reaha.milk] flooding from the pool down her belly and over your own head, soaking your [pc.hair].");

	output("\n\n<i>\"Bad cow!\"</i>  you laugh, pushing your hand deeper into the cow's cavernous cunt. She shrieks with ecstasy, tits bouncing as you fingers her quivering quim. Reaha babbles an apology as your finger-fucking intensifies, deft digits delving deeper into her darkest depths, slipping your whole hand in past her well-stretched lips. A few good punishing thrusts has the submissive little cow screaming in pleasure, head thrown back as she bounces on your fist, working with you to ram it deeper and deeper into her spasming cunt. The slick walls of Reaha's pussy squeeze and ripple along your pounding hand, muscles contracting wildly in a vain attempt to delay the massive penetration from ramming home into her again and again; her pleasured cries, though, let you know she's enjoying every second of fist-fucking goodness she can get as her screams reach their crescendo.");

	output("\n\nReaha's orgasm comes crashing down like a wave. Her cunt contracts and spasms, lips quaking around your wrist. Her pussy squirts, joining her leaking tits in a hurricane of fluids that spatters across your body as she cums, soaking your arms and [pc.chest] in girl-spunk and [reaha.milk]. You chuckle as the cow's chest heaves, still drooling [reaha.milk] at a steady rate as her orgasm passes; breathing hard, she slumps back against the bulkhead, with nothing but your fist buried deep up her cunt to prop her up. When you finally pull your hand free, the exhausted slut slumps to her knees, tits bouncing enticingly as her big booty plops onto the wet floor. You lick your lips at the sight of her jiggly flesh warbling, still coated with a nice, moist sheen, already nice and lubricated by her own lactation. Finally, time for the main course.");

	output("\n\nYou grab your [pc.cock " + x + "], presenting it to the collapsed cow-slut, and her whorish instincts have her sucking it in a heartbeat. She swallows it up, wide-set tongue caressing your sensitive underside as your hips push inch after inch past her spit-slick lips");
	//if small cock:
	if(pc.cocks[x].cLength() < 10) output(" until the lusty bovine's swallowed up every inch of cockmeat you're packing, her nose poking into your groin expectantly");
	else if(pc.cocks[x].cLength() >= 15) output(" until her throat's bulging with cockmeat, cheeks puffing out as she tries desperately to breath around your inhuman package");
	output(". You let your cow-slut suckle from your [pc.cock " + x + "] for a few good moments, reveling in the feeling of her huge tongue wrapping and caressing your prick. Exhausted as she is from her cunt-pounding orgasm, the taste of cock seems to revive her, and soon Reaha's sucking like a champ, head bobbing up and down your shaft with rhythmic motion");
	if(pc.cocks[x].cLength() >= 10) output(", throat bulging and deflating as your massive dick rams down her throat time after time");
	output(". In fact, she might be getting a bit <i>too</i> enthusiastic, deep-throating you with such skill and speed that you don't know if you'll hold out long enough to get what you were after -- but would that be so bad? You sigh, cock throbbing with unanswered need as you push Reaha back, the head of your prick breaching out from between her lips with a wet pop, bridges of spittle still connecting you and your slutty little slave.");

	output("\n\nReaha looks up at you expectantly, wiping her mouth off with the back of her hand. You point a single commanding finger to the slick surface of her [reaha.milk]-stuffed tits. Realization dawns on the dim cow, and she quickly cups her hands under her hefty tits and, rising onto her knees, presents the two creamy orbs to you. You nod approvingly as the Reaha slips your cock between the soft, warm, oh-so-wet mounds of her overflowing mammaries; your [pc.cock " + x + "] slides right into her cleavage, sliding across her smooth skin on a sheen of [reaha.milk]. You let loose a full-body shudder as your prick is enveloped in a tight squeeze of Reaha's wet, hot boobflesh, loving every second of feeling gliding across her pearly flesh. Judging by the way Reaha's breath quickens after a few thrusts, you aren't the only one: her cheeks redden with lust as your [pc.cock " + x + "] humps into the tight-pressed vice of her cleavage, tits jiggling obscenely with your every thrusting motion.");

	output("\n\nYou grasp Reaha's shoulders and start hammering, thrusting your [pc.hips] hard into her eager tits until the sound of [pc.skin] smacking sodden skin echoes throughout the room, mixing with her moans and yours as you vigorously titfuck the busty cow-girl. Her fingers dig into her squishy flesh, practically disappearing into her tits and urging out an all-new stream of [reaha.milk] that squirts onto your thighs and crotch, giving you just that little bit more lube to start ramping up the speed. Reaha gives a muffled cry as you push her head down on your [pc.cockHead " + x + "], pistoning through her tits and into her welcoming mouth, through a valley of wet warmth into a steamy, tongue-filled sheathe. She moans and groans around a mouthful of [pc.cock " + x + "], squeezing her tits as tightly together as she can to milk <i>you</i> right back. You grit your teeth, trying to hold yourself back as the lusty cow starts to shake her shoulders, making her tits jiggle obscenely around your turgid shaft as she sucks up every spare in of cockflesh she can get her lips around.");

	output("\n\nMouth, tits, and tongue together are just too much for you. Roaring with ecstatic pleasure, you slam your hips forward, pumping as hard and as fast as you possibly can into the tight embrace of Reaha's titties, reaching down to pinch and squeeze her gushing teats until she's joining you full on with screams of pleasure, shooting arcs of [reaha.milk] high into the air. Her boobgasm neatly presages your own orgasm, the cow's body quaking to its core as she cums, girl-spunk gushing out of her spasming, fist-gaped vag as your [pc.cock " + x + "] erupts into her mouth, shooting a thick stream of [pc.cum] to splatter on that big, wide tongue of hers. She gasps, choking of throbbing cock and steaming-hot spooge until she coughs it up down her chin, spunk drooling out her mouth and onto the shiny-wet tops of her breasts.");

	output("\n\nWith a heavy, contented sigh, you let your head rest against the bulkhead, panting hard after the sexual exertion. Below you, your dutiful cow-slut swallows a mouthful of your seed before letting your spent [pc.cock " + x + "] flop out of her mouth, still drooling a trickle of cum out onto her tits. You reach down to caress one of the heavy orbs, running your fingers through the heady mixture of [reaha.milk], [pc.cum], and girly-cum. Reaha smiles up at you, ");
	if(flags["REAHA_FREE"] == 1) output("<i>\"You really know how to show a girl a good time, don'tcha? Glad we can get my money's worth out of these,\"</i>  she laughs, shaking her huge tits happily.");
	else output("<i>\"I hope you got your money's worth, " + pc.mf("master","mistress") + ". I know I did.\"</i>");

	processTime(20+rand(5));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Ride Strapon
public function rideFollowerReahasStrapon():void {
	clearOutput();
	author("Savin");
	userInterface.showName("\nREAHA");
	userInterface.showBust("REAHA");
	output("You let a hand slip around Reaha's wide hips, squeezing one of her big, soft ass cheeks and whispering into one of her floppy cow-ears, <i>\"Why don't you find us something to play with?\"</i>");

	output("\n\nReaha ");
	//if free:
	if(flags["REAHA_FREE"] == 1) output("grins");
	else output("nods obediently");
	output(", slipping out of your arms to pull out a footlocker from under her bed, bending over as she does so and giving you a long look at her big, luscious ass; seeing that heart-shaped slab of cow-meat waving so invitingly in front of you is just too much to resist. You step up behind the bovine beauty, giving her a playful swat on the rear, leaving a hand-shaped red patch over her sailor's tattoo. Reaha gives a little yelp of surprise, but with the patches she wears, just about any touch is pleasurable: she wiggles her ass for you, grinding it back against your crotch and teasing your nose with the fluffy poof at the end of her slender tail. Grinning, you give the lusty cow another spank, sending her flesh jiggling");
	if(pc.hasCock()) 
	{
		output(" around [pc.oneCock], teasing the flaccid length until your rising lust has it bulging");
	 	if(pc.armor.shortName != "") output(" against the seams of your [pc.armor]");
	 	output(", desperate to plunge into the wet, inviting warmth of Reaha's pussy, so close to your [pc.skin] that you can feel the heat billowing off her slick lower lips");
	}
	output(". She gives you a teasing look over her shoulder, moving her hips rhythmically as you slap her tattooed ass again, grinding her slick slit against your [pc.leg] until she's trembling with pleasure.");

	output("\n\nWith shaking hands, Reaha finally manages to find what she was looking for: a black leather set of crotchless underwear, with a harness holding a two-foot long double-ended dildo in place. <i>\"H-how about this?\"</i>  she asks, never missing a beat with those inhuman hips of hers, pressing even harder against your ");
	if(pc.hasCock()) output("[pc.cockBiggest]");
	else output("[pc.leg]");
	output(", leaving trails of fem-slime on your ");
	if(!pc.isNude()) {
		if(pc.armor.shortName == "") output("[pc.gear]");
		else output("[pc.armor]");
	}
	else output("[pc.skin]");
	output(".");

	//If Nice:
	if(pc.isNice()) output("<i>\"Perfect!\"</i>");
	else if(pc.isMischievous()) output("<i>\"That'll do,\"</i>");
	else output("<i>\"I guess,\"</i>");
	output("  you say. Now, what to do with it...");

	processTime(2);
	//[Be Submissive] [Be Dominant]
	clearMenu();
	addButton(0,"Be Submissive",beSubmissiveToReaha);
	addButton(1,"Be Dominant",dominantReahaAss);
}

//Submissive
public function beSubmissiveToReaha():void {
	clearOutput();
	author("Savin");
	userInterface.showName("\nREAHA");
	userInterface.showBust("REAHA");
	output("The thought of that big, hard rod of latex thrusting deep into your bowels is enough to get your ");
	if(pc.hasVagina()) output("[pc.vaginas] drooling with excitement");
	if(pc.hasVagina() && pc.hasCock()) output(" and your ");
	if(pc.hasCock()) output("[pc.cocks] rock-hard");
	if(!pc.hasCock() && !pc.hasVagina()) output("mind racing with lewd thoughts");
	output(". You ask Reaha to put it on and give you the rough fucking you deserve. She hesitates for a moment at your request: <i>\"A-are you sure?\"</i>");

	output("\n\n<i>\"Definitely,\"</i>  you answer, crawling onto the bed and presenting your [pc.butt] to the cow's startled face. Clearly, she's not used to being given control anymore. Time to see if you can bring out Reaha's dominant side....");

	output("\n\nYou shake your booty at her, beckoning her on");
	if(pc.tailCount > 0) output(" with a flick of your [pc.tails]");
	output(". Reaha stands up straight behind you, pulling the strapon on. Behind you, you can hear the cow's breath hiss as the long rod sinks into her, pushing deep into her animalistic hole until she's finally able to tighten the straps, purple latex bobbing around her crotch just like a real, and painfully erect, cock. <i>\"Let's... uh, I guess I should lube you up, now?\"</i>  You nod. <i>\"Um, alright... let's try this...\"</i>  she mumbles, reaching up to her udders and grabbing one of her over-sized teats in either hand. She bends down, dragging her big, soft tits across your back; you shudder as her hot flesh grazes yours, tempered by beads of cool [reaha.milk] trickling from her swollen nipples as the cowgirl lines her boobs up with your behind");
	if(pc.isCrotchGarbed()) output(", pulling off the last of your [pc.lowerGarments] to reveal your [pc.asshole]");
	output(". Your breath catches as a sudden squirt of [reaha.milk] splatters across your [pc.butt], wetness rolling down your round cheeks in creamy rivulets as the cow-slut aims her tit's stream right for your [pc.asshole]. The dark star clenches reflexively as her [reaha.milk]-lube smears across it; you grit your teeth and try to relax, letting a tiny trickle of the rich fluid right into your hungry behind. With a delightful shiver, you get used to the feeling of Reaha's personal lube flowing into your [pc.asshole], and she really opens the floodgates, practically pushing her teat into your butt and squirting, showering your backside in [reaha.milk].");

	output("\n\nSatisfied with her wetwork, Reaha gives you an appreciative slap on the [pc.butt], digging her fingers into your taut [pc.skin]. That's more like it! You wiggle your ass happily as the cow's hands wrap around your [pc.hips], her own bovine hips pushing in towards you, the head of the massive strapon teasing the clenched ring of your ass. She keeps it pushing forward, relentlessly advancing the latex cock's crown until you can feel its tiny tip pressing into your [reaha.milk]-coated butthole. You bite your lip, fingers digging into the sheets, doing everything you can to relax your [pc.asshole], taking your mind off the impending penetration. The first inch is exquisite agony: your voice breaks into a high cry as the thick rod punches mercilessly through your sphincter's defenses, spreading your poor ass apart. Your muscles go wild around the intruding plastic member, trying desperately to repel the cock ramming through them, but utterly unable to best the thick glaze of lube Reaha's crammed up inside you.");

	output("\n\nReaha's strong hands gripping your hips are the only things that anchor you to the moment, the only things you can think about beyond the enormity of the fuckstick pushing into you. Her fingers dig hard into you, pulling you back against her even as she fucks the strapon deeper in. Your back arches as the pain finally turns to a hint of pleasure, a wet warmth radiating up from the rim of your ass as it finally learns to accept the dildo buried a finger's length up your bowels.");
	pc.buttChange(200,true,true,false);

	//If PC has a cock:
	if(pc.hasCock())
	{
		output("\n\n[pc.EachCock] throbs as Reaha's toy glides across your prostate, egging on your hardening [pc.cocks]. Seeing your growing excitement, Reaha gives you a classic reach-around, letting your hip go to grab your [pc.cockBiggest], stroking it hard and fast as she pushes her hips further in, shoving inch after inch of dildo across the sensitive bulb of your masculine gland. You give a pitiful whine as the cow-girl buttfucks you, relentlessly jacking you off until you can feel cum surging up the length of your [pc.cockBiggest]. Her hips start to piston, slapping into your [pc.butt] as she begins to pound your [pc.asshole], faster and faster until you're being hammered almost as fast as she can stroke your [pc.cockBiggest]. Her other hand gives your [pc.butt] a rough slap, nearly barreling you over if it weren't for the dildo rammed up your ass. You cry out, and once the floodgate's open, there's no stopping it. To the beat of Reaha's vicious buttfucking, you scream and moan, thrusting your hips back against the leather-clad cow to get every inch of thick cock you can as your own pulsing prick comes ever closer to eruption.");

		output("\n\nWith a final, desperate cry of pleasure, you arch your back and scream. Your [pc.cockBiggest] gives one final pitiful throb of resistance in Reaha's hand before blowing its load, a thick wad of [pc.cumColor] spunk shooting onto the cow's sheets just as she rams her dildo up to the hilt into your [pc.asshole], making your stomach bulge obscenely. She moves her wrist to the beat of her buttfucking for once as she milks your behind, forcing another shot of cum right out of your prick, smearing across your shaking arms with its prostate-pounded pressure. Your body convulses, muscles writhing wildly around the latex fuckstick spreading you apart, tormenting your poor gland as it swells with spunk time and again, blowing a lake of spunk onto Reaha's sheets.");
	}
	//Else if PC has a Vagina:
	else if(pc.hasVagina())
	{
		output("\n\nBegging for attention, [pc.eachVagina] is drooling needless lubricant onto the cow's sheets, muscles spasming in desperate need for a cock to milk. You reach back to finger yourself, to gain even a tiny sliver of vaginal release as Reaha starts to thrust into you, but the cow catches your wrist, pulling your arm behind your back. <i>\"I don't think so!\"</i>  she giggles, pushing you down onto your belly, putting your cunt utterly out of reach. You give a whine of sexual need, but the cow takes your mind off it with a harsh slap to the ass, digging her fingers in as she pulls her legs up onto the bed with you, angling down for a proper fucking. Your free hand wraps itself in the sheets, trying to get a firm hold on something as Reaha's powerful hips hammering into you.");
		output("\n\nHer thrusts are relentless, each pounding inch after inch of [reaha.milk]-soaked latex deep into your defenseless bowels, bulging your stomach obscenely as she finally works the greater part of the shaft into you. Your [pc.vagina] cries out for a touch, any measure of pleasure to ease the snaking, aching ecstasy radiating from your butt as she fucks you harder and harder, but any attempt to touch it is met with stern refusal by your cow-slut; she's getting into the domme role, at least! And maybe too much, you almost think: god DAMN you want to jill off, but you're stuck thrusting back against Reaha's hips, taking even more of her huge dildo-cock until with a scream of glee you feel the leather straps pressing into your [pc.butt]. 18 inches of cock is buried inside you, stretching your spasming anal muscles to the very limit, pushing against the walls of your gut until you can feel it pounding into the bed right through you! Anal orgasm, the elusive holy grail of buttfucking, seems imminent: [pc.eachVagina] spasms, even untouched, in a pool of its own excitement and need; your butt muscles squeeze and wring the dildo, going wild around the fake cock Reaha's pushed so deep into you. You arch your back and cry your pleasure, squeezing down as hard as you can around Reaha's relentlessly ramming rod, daring her to ream your clenched ass as hard as she can as you finally peak. Your cunt gushes, squirting femspunk into Reaha's sheets as she buttfucks you into a body-rocking orgasm.");
	}
	//If PC has sex organs, combine:
	if(pc.hasCock() || pc.hasVagina())
	{
		output("\n\nPanting hard after your butt-pounding-induced orgasm, you give a hapless cry as Reaha straddles your [pc.hips], pushing the latex cock as deep into you as it can possibly go. <i>\"You made a mess in my bed! Bad slut!\"</i>  she says, trying to keep a straight face as she points to your cum staining her sheets. <i>\"You better be ready to clean that up, or my cock's gonna just grow roots in your ass, maggot. Uh, slut.\"</i>  Now she's getting the hand of being on top again!");
		output("\n\n<i>\"Yes ma'am,\"</i>  you mewl as Reaha shifts your prone body, planting your nose right in the center of the biggest cumstain, practically smearing your face in it. Your [pc.tongue] snakes out at her command, slurping up the still-wet lake of girl-spunk staining her sheets. Your nose turns up at the taste of your own cum, but one look to the suddenly dominant cow-slut tells you you're stuck here: the old marine in her's finally come back out! She gives you a hard slap on the ass, demanding, <i>\"Hurry up!\"</i>  as you pause to think: you get to it, sucking up your cum as best you can from the sheets, licking the stains and lakes as dry as you can, getting every drop, if only because every missed drop earns you a spank or a hard tip-to-stem thrust from the cock still spearing you wide.");

		output("\n\n<i>\"There you go,\"</i>  Reaha coos as you lap up a particularly big puddle of spunk, finally clearing everything you can get your tongue on, though her bed's no less wet for your efforts. <i>\"I think that deserves a little break, don't you?\"</i>");

		output("\n\nYou nod, groaning as Reaha finally pulls the massive cock from your ass, letting the floppy latex schlong plop onto your belly. ");
		if(flags["REAHA_FREE"] == 1) output("<i>\"Hope I didn't go toooo hard on you, Captain!\"</i>");
		else output("<i>\"Was that too much, Captain?\"</i>");
		output(" Reaha giggles, patting your hip. Half-aware of what she's saying, and feeling utterly empty and wet after that oversized insertion, your head lolls back on your shoulders as you pass out on Reaha's bed.");
	}
	//if PC has no sex organs: fuck you, slut.
	if(!pc.hasCock() && !pc.hasVagina())
	{
		output("\n\nYou give a whine of sexual need, but the cow takes your mind off it with a harsh slap to the ass, digging her fingers in as she pulls her legs up onto the bed with you, angling down for a proper fucking. Your free hand wraps itself in the sheets, trying to get a firm hold on something as Reaha's powerful hips hammering into you. Her thrusts are relentless, each pounding inch after inch of [reaha.milk]-soaked latex deep into your defenseless bowels, bulging your stomach obscenely as she finally works the greater part of the shaft into you. Your mind races, wishing beyond hope ofr some sexual organ to gratify amid the buttfucking, but your decisions have rendered you sexless, totally reliant on Reaha's tender mercies to bring your pleasure. You're stuck thrusting back against Reaha's hips, taking even more of her huge dildo-cock until with a scream of glee you feel the leather straps pressing into your [pc.butt]. 18 inches of cock is buried inside you, stretching your spasming anal muscles to the very limit, pushing against the walls of your gut until you can feel it pounding into the bed right through you! Anal orgasm, the elusive holy grail of buttfucking, seems imminent. your butt muscles squeeze and wring the dildo, going wild around the fake cock Reaha's pushed so deep into you. You arch your back and cry your pleasure, squeezing down as hard as you can around Reaha's relentlessly ramming rod, daring her to ream your clenched ass as hard as she can as you finally peak as she buttfucks you into a body-rocking orgasm. Exhausted, you collapse utterly into Reaha's bed, panting hard as you recover from the reaming.");
		//{Genderless scene end. Fuckers.}
	}
	processTime(20+rand(10));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Dominant
public function dominantReahaAss():void {
	clearOutput();
	author("Savin");
	userInterface.showName("\nREAHA");
	userInterface.showBust("REAHA");
	output("You push Reaha onto the bed, looming over the horny cow as she rolls onto her back, grabbing her milky tits protectively. You slip down to your [pc.knees], taking one of her feet in your hands, gently massaging the ball as you work one of the leather straps around her ankle. She blushes hard as you take her big toe into you mouth, licking the ticklish underside until she's biting her lip, fingers snaking down to her quivering slit. Her other leg is like putty in your hands, easily slipped through the other strap; you pull the leather undergarment up her thick thighs, brushing her seeking hand aside as you caress the inner shaft of the double-dildo, angling it up toward the cow's cavernous cunt. Her legs wrap around your shoulders as you slip closer to her, watching her chest rise and fall, tits wobbling with every panting, expectant breath.");
	output("\n\nYou pause just before the moment of penetration, the crown of the latex cock just spreading the lips of Reaha's pussy. Your fingers take point, tips teasing across the over-sensitive flesh of the cow's inner thighs, brushing the rose-tinted flesh near her lust-patches before letting your middle digits caress the very lip of her quivering quim, sending a shock of pleasure up the cow's body that manifests as a convulsive shudder, cunt drooling obscenely at the lightest touch. Your finger slips in easily, the lubricated passage practically sucking you into its hot embrace. Reaha gives a pitiful little gasp as you enter her, rolling your finger around in the plentiful juices flowing from her gaping pussy. Every touch to her tender walls sends a shiver of ecstasy up her spine, coating your finger in a thick deluge of feminine slime. You let another finger slide into her, and another, pushing the better part of your fist into the cow-slut's expansive slit, which stretches as easily to accommodate your grip as it would a bull-stud's massive cock.");
	output("\n\nReaha cries out, back arching off the bed as you fist her, slathering your hand in her free-flowing juices. You pull out, just enough to grasp the shaft of your strapon cock and stroke it vigorously, pumping the rod and coating it with Reaha's lube, making sure both ends are nice and soaked before sidling the straps up to Reaha's hips, sliding the rigid rod of the latex cock into the fist-shaped hole of the cow-slut's sex. With the strapon snugly in place, you step back to admire your work: over a pool of fem-cum towers a monolith of latex cock, bobbing unsteadily as Reaha's shaky breath rocks through her lust-addled body. You give the cow a reassuring pat on the tit as you climb into bed, straddling her wide hips and angling your [pc.butt] over the tower of dildo rising from her crotch, taking the time to rock your own [pc.hips] back against it, reveling in the warm wetness of the lubed-up shaft pressing through the crack of you ass, smearing her cunny's juice across your winking hole.");
	output("\n\nYour [pc.asshole] clenches rhythmically as the strapon's rod passes across it, smearing its lube across the mouth of your tender hole. Biting your lip and digging your fingers into Reaha's big, soft tits, you rise to your full height, ass quivering over the trembling pole of latex cockmeat beneath you, lining up your decent. Slowly, ever so slowly, you kneel down onto the strapon, reclining back until the crown kisses the ring of your [pc.asshole], spearing you with a shock of cold hardness that sends lightning bolts of pleasure throughout your lusty body. The first inch is exquisite agony: your voice breaks into a high cry as the thick rod punches mercilessly through your sphincter's defenses, spreading your poor ass apart. Your muscles go wild around the intruding plastic member, trying desperately to repel the cock ramming through them, but utterly unable to best the thick glaze of lube spread across the tip.");
	output("\n\nThe dildo slides into you excruciatingly slowly, making you moan louder with every inch that pushes past your faltering sphincter. ");
	if(pc.hasCock()) {
		output("[pc.EachCock] bounces to alert as the toy grinds across the knot of your prostate, pushing hard against your masculine gland until you can feel cum bubbling through your vein");
		if(pc.cockTotal() > 1) output("s");
		output(", surging toward your tip");
		if(pc.cockTotal() > 1) output("s");
		output(".");
	}
	output(" Gritting your teeth, you slide down the pole of latex, forcing yourself to take inch after inch of oversized toy until your [pc.butt] is finally nestled in Reaha's lap, grinding against her leather-clad crotch.");
	pc.buttChange(300,true,true,false);

	output("\n\n<i>\"You okay, Captain?\"</i>  Reaha asks, hands caressing your [pc.hips] as you settle into her lap. You give her a quieting look, squeezing her tits by way of answer. A clear bead of [reaha.milk] forms at the tips of her nipples which you lean down to lick off, groaning as the strapon bends inside you to accommodate the motion, dragging a fist's length out of you. Reaha moans as you give her tit a little suckle, drawing out a thin stream of her sweet cream to fill your mouth. Drinking from the cow, you start up a rhythm: suck and thrust, rising off Reaha's lap as you fill your cheeks with [reaha.milk], swallowing as you descend. Your stomach bulges with the great girth of the cock reaming your ass, joined in flooding your gut with a steady stream of Reaha's lactic lust: before long the two of you are both moaning and gasping with every motion as the dildo passes between you, pushing into your ass before falling back into Reaha's slit.");

	output("\n\n<i>\"There's a good cow,\"</i>  you purr as Reaha's fingers lock around your hips, holding on for dear life as you start to really move. Faster and faster, riding that cock like a champ; you take hold of Reaha's shoulders, lifting her up to a sitting position so you can drink and ride more easily, bouncing in her lap as your face is buried in her bounteous bust. She holds you tight, pressing your face into the yielding mound of her tit, forcing as much of her long teat down your throat as she can, thrusting it against your writhing [pc.tongue]. You suckle from it, drinking deep from the cow-slut's endless reserves.");

	output("\n\nYou utterly lose track of time, moments blending together as you suckle and bounce, in and out, up and down until you can feel a tell-tale pressure mounting behind the gaping wall of your sphincter. ");
	if(pc.hasCock()) output("[pc.EachCock] drools threateningly, dripping slimey wads of [pc.cum] onto Reaha's belly with every movement. ");
	output("You move faster, pounding down on the rigid rod until your ass is practically livid with pleasure, overwhelming every other sense but the need for release: back arched and voice crying, you cum. Your ass squeezes wildly on the dildo, wringing every second of agonizing ecstasy from it your can");
	if(pc.hasCock())
	{
		output(" as your [pc.cocks] erupt");
		if(pc.cockTotal() == 1) output("s");
		output(" onto Reaha's belly, blasting her with a wave of sticky [pc.cum] that smears between her tight-pressed breasts");
	}
	output(". Reaha, too, screams a cry of pleasure, milk and fem-cum spurting as you pile-drive the dildo down into her sodden box, ramming all eighteen inches of latex into her cunt. Holding your cow tight, the two of you hump and thrust through the orgasm, drenching each other in your sexual juices as the dildo hammers from one hole to the other.");

	output("\n\nThe orgasm leaves you both panting heavily, rolled in each other's arms in a tangle of cum-stained sheets. You barely feel the dildo slip from your guts, only feeling the intense emptiness it leaves behind as Reaha wriggles out of the strapon; when the toy pulls out of her, a floodgate of fem-slime opens, drenching her thighs in musky slime. She gives a heavy sigh, rubbing her sore teats as you let your face fall back into the valley of her cleavage, using her heavy tits as pillows as you recover from your sexual marathon.");
	pc.orgasm();
	processTime(20+rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Tie Her Up & Fuck Her Butt
public function tieUpReahaAndFuckHerButt():void {
	clearOutput();
	author("Savin");
	userInterface.showName("\nREAHA");
	userInterface.showBust("REAHA");
	var x:int = pc.cockThatFits(chars["REAHA"].analCapacity());
	x = pc.smallestCockIndex();
	output("You can't help but lick your lips as you take in the gratuitous curves of Reaha's body: the huge, unbound breasts practically sloshing with cream; her overly wide, child-bearing hips; and the jiggling expanse of her bubble butt. Following your eyes, the cow-slut grins, hands on her big hips. <i>\"See something you like, </i>" + pc.mf("master","mistress") + "<i>?\"</i>  she says with marked cock-sureness, thrusting her prodigious chest out just enough to make the two full mounds bounce lewdly for you. You cup one of Reaha's massive tits, giving it a rough squeeze as you push her back, forcing her up against the cabin walls. She gives a sharp gasp, twisting to look away as your hand savagely kneads the thick, soft breast, causing the puffy teat at its tip to bead with [reaha.milk]. Her breath catches as she starts to lactate, [reaha.milkColor] rivulets running between your fingers. You press in closer, giving her defenseless neck a hard kiss that ends in a gentle little bite, just enough to leave her pale flesh reddened.");
	output("\n\nAlready moaning thanks to the stim-patches all along her back, Reaha lets herself be utterly molested by your hands and fingers, offering no opposition as you kiss and bite along her neck and shoulders, your free hands slipping down to caress her thick thigh, momentarily grabbing the big, soft curve of her ass. With a pathetic little moan, she hooks that leg around your [pc.hip], pulling you in against her, your own [pc.chest] mashing into hers, smearing you with her [reaha.milk]. Naughty slut. For that, you slip your fingers in, pushing three at once into the slick folds of her sex. With a moaning cry, Reaha's back arches, tits bouncing in your grasp as she nearly climaxes on the spot, her lube flowing freely down her thighs, mixing with the rivers of [reaha.milk] pouring down her body.");
	output("\n\n<i>\"Aaahhhh, yeessss, harder!\"</i>  she moans, hips bucking against your probing fingers, working to take your hand deeper and deeper. You're all too happy to grant that wish, pushing back against her and moving your fingers to tease and caress her spasming walls, thumb running in circles around her engorged clit. With every thrust you make, her efforts to breathe become harder, chest heaving as you assault her every weak point. You can feel her orgasm coming a mile away.");
	output("\n\nYou manage to shift aside at just the right moment, getting clear as Reaha screams, throwing her head back as her tits bounce and spurt, spraying her liquid load across the deck as her cunt clenches powerfully around your fingers, trying to milk them like a big, fat cock. You answer in kind, pushing yourself deeper until you're practically fisting the horny slut, pushing in as far as you can through her quivering quim's cum-slick channel. <i>\"Yeah, yeah! Just like that! Just... like... oh, god!\"</i>  she cries, and suddenly her body seems to convulse against itself, another, more potent orgasm overtaking the first. Her teats rocket to a steady stream, arcing her [reaha.milk] across the cabin to smear wetly on the bulkhead opposite her.");

	output("\n\n<i>\"You know you're gonna have to clean that up,\"</i>  you tease, still wrist-deep in Reaha's cunt as she slumps back against the wall, breathing hard. She makes a weak moan in answer, knees buckling under the strain of her massive orgasm. You catch her, letting the [reaha.milk]-laden slut lean against you for a moment, her whole body twitching in the aftershock. But you only hold her for a minute -- just enough to stroke her long strawberry hair with a gently soothing word -- before you reach up to the over head and yank out some spare wiring. She looks up at you with eyes blanked with lust, utterly limp in your grasp as you turn her around, planting her face a bare inch from the stained wall she's left slick with her breasts' bounty, and pull her arms behind her back. Realizing what's about to happen, she weakly struggles, trying to pull her hands free -- but her knees just buckle, leaving her defenseless as you tie your milk whore's hands, throwing the spare length up over an uncovered duct to hold her steady, with just the barest bit of give.");

	output("\n\nYou take a step back, admiring your handiwork. Reaha slumps over, ass pointedly in the air as she sways on her bindings, cheek almost dragging through the [reaha.milk]-stained wall. <i>\"Now, let's see that big cow tongue of yours at work,\"</i>  you say, running an appreciative hand across the great big curves of her tremendous rump, patting the tattooed flanks -- and giving your milky servant just enough push toward the wall to put her nose in it. Reaha groans, looking over her shoulder to stare at you with her big blue eyes, her tiny little cow horns just catching the light. You sigh, <i>\"Alright. Clean it up, and I'll fuck you again.\"</i>");

	output("\n\nWell that's all the encouragement she needs. Reaha's long, wide tongue slips from between her lips, dragging across the nearest [reaha.milk]-smeared bulkhead, licking up her own orgasm. As a reward, you gently dig your fingers into her big, soft ass, kneading her supple flesh until you can hear her moaning, wiggling her hips as best she can in her bonds. Such a wanton whore... you give Reaha a quick, affectionate spank, sending her swaying as you toss your kit aside, pulling your [pc.cock " + x + "] out and letting it flop into the tight little crevice between her full cheeks. She gives a cute little gasp, her well-stretched cunt visibly clenching as you run your length through her crack, already starting to bead with lube all anew. Silly bitch, you won't be using that hole...");
	output("\n\nYou slip your hand down into the sodden snatch between your cow's shaking legs, taking advantage of the feminine slime starting to trickle down her thighs. You finger it out, making sure to reach in deep for the purest, freshest lube, making Reaha shudder and sigh as you enter her again. Her hips push back against your hand, cheeks squeezing on your [pc.cock] lodged in her backside; with a chuckle, you push her back against the bulkhead, smearing her cheek into her orgasmic leavings with a sharp command to remember her duty. She whines meekly, licking up the closest sploch of [reaha.milk] with her over-sized tongue. Good enough. You pull your fingers out of one hole, shifting your prick so they can get at the other.");
	pc.cockChange();
	output("\n\nThe yelp Reaha gives is perfect, back arching and tits swinging hard enough to slap herself when she feels your fingertips pressing in against her ass, so slick with her fem slime that they practically glide in no matter how hard she clenches. <i>\"A-aaahhhhh, nooooo,\"</i>  she whines, choking off a moo-like moan as you push in to the second knuckle, smearing her rectal walls with a nice, slippery application of her own making. <i>\"N-not there,\"</i>  Reaha groans, but the way her ass's muscles are squeezing and wringing your fingers, you'd think she was practically screaming for a rough buttfucking.");
	output("\n\nYou make sure to give her a liberal coating of lube, smearing it evenly across every angle of her spasming passage before you pull your fingers out, giving her another sharp spank as your prick drags back through her crack, humping her soft cheeks a few times to rub in the excess lube before pulling back and lining up with the winking, black hole of her bum. She gives another grunt of protest, but the cow-slut subtly wiggles her big hips, even pushing against your [pc.cockHead " + x + "] ever so slightly. Oh, she wants it bad. You dig your fingers in, holding her swaying ass steady for the final push.");
	output("\n\nYou grit your teeth and push in, fighting against the tightness of the cow's squeezing ass; she lets out a bellowing moo, back arching as your crown pierces her behind. <i>\"Aaaaahhhhh. S-slow down! Lemme get used to iiitttt,\"</i>  she cries, but you keep a steady pace as your [pc.cock " + x + "] slides into her rump, fingers kneading her fleshy cheeks, keeping her spread wide to ease your entrance. You spend nearly a minute sliding into your cow's hole, pushing into her clenching, spasming anus until ");
	if(pc.balls > 0) {
		if(pc.balls > 1) output("your balls slap wetly into her soaked cunt");
		else output("your sack slaps wetly against her soaked cunt");
	}
	else output("your hips press into her jiggling bum, cock fully buried");
	output(". Reaha groans lewdly, chest heaving as she weakly laps at the [reaha.milk] smeared against the wall, your rectal ravaging already making her tits go back into production, dibbling their sweet cargo onto the deck to mix with the feminine slime pooling between her feet.");

	output("\n\nWith your cock sheathed, you give the cow a rough spank, making her clench oh so tightly as your hands shift up across her curvy body, reaching around to grasp her hefty teats. Reaha's sexy groans turn into deep moos as your fingers pinch and squeeze her puffy nipples, urging the trickle into a tiny stream of [reaha.milk] around your fingers. Urged on by her lusty vocalizations, you start to move your [pc.hips], slapping them into hers as you start to pound her ass. She cries out, back arching and tits bouncing as she buries her face against the wall, biting her lip hard as she tries not to cum too quickly. Well, if she didn't want that, she wouldn't be wearing those bright pink aphrodisiac patches, would she? You reach up to prod one of them, rubbing the bright red skin around the chemical patches -- just hard enough to get them working a tiny bit harder. Reaha's moans immediately increase in pitch, rising to shrill cries as your hips move faster, cock spearing her black hole again and again until her voice is a cracking cacophony of screams and moans of pleasure.");

	output("\n\nYou give her another swat on the ass, sending her big cheeks jiggling -- and that's enough to send her over. Reaha's voice breaks into an unintelligible moo as she cums again, cunt spasming around the emptiness your fist left there, ass squeezing so tight you're afraid your cock'll burst. Her tits stream out even more than before, visibly diminishing as she orgasms hard enough to nearly drain herself, coating your hands and the floor beneath you with what seems like gallons of [reaha.milk]. Her anal squeezing nearly pushes you over the edge, her muscles writhing and spasming wildly as the cow-slut cums and cums; you grit your teeth, trying to hold back, but to no avail. With a primal roar you join her in orgasm, [pc.cock " + x + "] unleashing a torrent of seed deep into Reaha's bowels");
	if(pc.cumQ() >= 4000) output(", making her belly bulge with each spurt until she looks massively pregnant");
	output(".");
	output("\n\nWith a sated sigh, you withdraw from the slutty, cum-drooling cow, leaving her with a nice trickle of seed pouring from her behind as she sways listlessly in her bonds, chest heaving as the last spurts dribble from her teats, staining the floor beneath the nearly-clean wall. <i>\"Aww,\"</i>  you laugh, letting her down to flop into the sea of her own [reaha.milk]. She groans weakly as you remind her to clean up after herself, leaving her with a nice pat on her well-abused rump, letting her tattoo jiggle obscenely as you grab your kit and leave.");
	pc.orgasm();
	chars["REAHA"].loadInAss(pc);
	processTime(20+rand(10));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Appearance
public function reahaFollowerAppearance():void {
	clearOutput();
	author("Savin");
	userInterface.showName("\nREAHA");
	userInterface.showBust("REAHA");
	output("Reaha Hayes was certainly born a human, though she's put more than a few gene-mods in her system over the years that have given her a distinctly bovine appearance. She's not much over five foot, with tremendously wide hips, and an ass you could lose yourself in, thick enough to sink a hand into. On the right cheek of her butt, she's got a large tattoo of the Coalition Expeditionary Force's logo: the only remaining hint on her fleshy, cow-like body that she was once a warrior. Sprouting from her backside, just above her butt, is a slender tail  that swishes absently as you look at her: nearly a yard from tip to base, with a plume of red fur at the end. Her face is still fully human, save for a pair of cute little bovine horns poking out from her flowing ass-length strawberry hair. She's standing stark naked, if only because her massive and often variable bust-size denies all attempts to constrain it: her tits, swollen with [reaha.milk], are truly massive when she doesn't get them milked, though happily she's able to tend to that herself now. With her hands free, she's able to keep them small enough to let her walk around her cabin, though she's often resting them on a tabletop or folding her arms under them for support.");
	output("\n\nReaha has a pair of huge FF-cup breasts, each with a big inch-long nipple at its tip.");
	output("\n\nShe has a loose, wet pussy tucked between her legs, and a snug little asshole between her expansive ass cheeks, right where it belongs.");

	clearMenu();
	addButton(0,"Next",approachShipBoardReahaWhyDidntSavinCodeThisHeWasntExhaustedYesterday);
}

//2. PRE-FOLLOWER STUFF


public function talkToBrothelLady():void
{
	clearOutput();
	author("Savin");
	userInterface.showName("BROTHEL\nMISTRESS");
	userInterface.showBust("BORING_MISTRESS");
	output("You approach the mistress, clearing your throat to get her attention. With marked boredom, she intones, \"<i>Welcome to Beth's Busty Broads. If you're here for our going out of business sale, you're out of luck. The selection's... pretty limited. And by that I mean we've got one slut left, and she's a handful.</i>\"");
	output("\n\n\"<i>What happened to all the others?</i>\"");
	output("\n\nShe cocks an eyebrow at you, finally bothering to look up from her slate. \"<i>Boss was using indentured labor, but she had some kinda crisis, whatever. Had to sell most of the contracts out. A lot of the regulars bought up their favorite sluts to keep 'em forever. Or close enough to forever as money can buy.</i>\"");
	if (pc.isNice())
	{
		output("\n\n\"<i>Indentured labor... you mean slaves?</i>\"");
		output("\n\nShe shrugs. \"<i>People go into debt they can't work off, so they sell themselves. They volunteer, and we've got contracts of debt for it. Half of these dumb bimbos bought ultra-grade mods to please their beaus, but what do you know, nobody put a ring on them. Saddest story in the galaxy.</i>\"");
	}
	if (pc.isMischievous())
	{
		output("\n\n\"<i>Indentured labor... you mean slaves?</i>\"");
		output("\n\nShe shrugs. \"<i>People go into debt they can't work off, so they sell themselves. They volunteer, and we've got contracts of debt for it. Half of these dumb bimbos bought ultra-grade mods to please their beaus, but what do you know, nobody put a ring on them. Saddest story in the galaxy.</i>\"");
	}
	output("\n\nShe sets her slate down, steepling her fingers. \"<i>We've got one girl left for sale right now. She's an ornery slut, made herself up to be some kinda cow. Have to keep her patched up on aphrodisiacs or she gets wonky. If that's your thing, it's 100 credits a fling. Unless you're generous or horny enough to want some dumb cow's contract, anyway. I wouldn't if I were you, though; had to drag her off more than one burly sailor she didn't take to.</i>\"");

	if (pc.physique() <= 20)
	{
		output("  Looking you up and down, she adds, \"<i>Hate to see what she'd do to you, given half the chance.</i>\"")
	}
	processTime(3);
	flags["TALK_TO_LADY_1ST"] = 1;
	brothelMainMenu();
}

public function brothelMainMenu():void {
	clearMenu();
	addButton(0,"Cow-slut Sex",ReahaBrothelSexMenu);
	addButton(1,"Contract",buyYourselfACowslut);
	if(flags["HOWS_BUSINESS_BITCH"] == undefined) addButton(2, "How's Business", askAboutBusinessLikeASir);
	addButton(14,"Leave",mainGameMenu);
}

public function talkToBrothelLadyRepeat():void
{
	clearOutput();
	author("Savin");
	userInterface.showName("BROTHEL\nMISTRESS");
	userInterface.showBust("BORING_MISTRESS");
	output("You approach the mistress, clearing your throat to get her attention. With marked boredom, she intones, \"<i>Welcome to Beth's Busty Broads. If you're here for our going out of business sale, you're out of luck. The selection's... pretty limited. And by that I mean we've still got just the one cow-slut left, and she's a handful.</i>\"");

	brothelMainMenu();
}

public function ReahaBrothelSexMenu():void
{
	clearOutput();
	author("Savin");
	userInterface.showName("MISTRESS AND\nREAHA");
	userInterface.showBust("BORING_MISTRESS","REAHA");
	output("You tell the mistress that you'd like to spend some time with this cow of hers. She shrugs and tucks her data slate under her arm, leading you past a drawn velvet curtain into a long, dark hall. You follow her down a winding stair to a dimly-lit hall flanked by perhaps a dozen sealed doors, each with a small slit in the center, revealing the sparse accommodations: most have been emptied out, left as nothing but bare steel chambers. The last door, though, still has a light on inside.");
	output("\n\nThe mistress stops at the last door on the right, indicating the view slit beneath the nameplate \"Reaha.\" Looking through, you see an overly-busty woman, clearly human once, with her wrists chained to a steel bar, several tubes poking into her back from a vent in the ceiling, pumping her full of some misty pink liquid. Aphrodisiacs, you'd guess. From your vantage point, you can see her over-sized ass pointed toward the door, giving you a perfect view of her sodden cunt and a long, swishing tail tipped with a cute tuft of fur. Her tiny microskirt does nothing to hide her sundered modesty. With a pair of tiny ivory horns growing from her head, a pair of floppy bovine ears, and a pair of absolutely massive tits, it isn't hard to see why the brothel mistress calls her a cow.");
	output("\n\nAs if reading your mind, the mistress says, \"<i>Gene mods. Crazy, right? Why someone'd want to turn herself into a stupid cow, I'll never guess. Anyway, you want a go at her, there's the credit scan,</i>\"  she nods to a box on the wall. \"<i>I'll leave you to it.</i>\"");
	output("\n\nWith that, you're left alone in the long hall.");
	processTime(1);
	clearMenu();
	pc.lust(33);
	if(pc.credits >= 100)
	{
		if(pc.hasCock()) addButton(0,"Vaginal",fuckReahasPussyintheBrothel);
		else addDisabledButton(0,"Vaginal");
		addButton(1,"Ride Strapon",RideReahasStraponAtTheBrothel);
		addButton(14,"Leave",mainGameMenu);
	}
	else
	{
		addDisabledButton(0,"Vaginal");
		addDisabledButton(1, "Ride Strapon");
		addButton(14,"Leave",mainGameMenu);
	}
}



public function askAboutBusinessLikeASir():void
{
	clearOutput();
	author("Savin");
	userInterface.showName("BROTHEL\nMISTRESS");
	userInterface.showBust("BORING_MISTRESS");
	output("You ask the mistress how business is doing, exactly. There's enough people sitting around enjoying the girls on the floor alone to suggest Beth's is doing well.");
	output("\n\nShe shrugs. \"<i>New madame's whipped up a lot of new customers. Old one didn't do much, let the place fall to shit. I was about to put in my two-weeks' when she up and left. Dunno why. But things are picking up again. New girls coming in, old ones going out. Even fixed the surround sound.</i>\"")
	//GET RID OF ZIS BUTTON U CUNT
	flags["HOWS_BUSINESS_BITCH"] = 1;
	removeButton(2);
}


//EXPANSION TIME BITCHES.
//Gettin' you a find slab of MARBLED BEEF
//*sunglasses* YEEEEEEEEEAHHHHHHHHH
public function buyYourselfACowslut():void
{
	author("Savin");
	clearOutput();
	userInterface.showName("BROTHEL\nMISTRESS");
	userInterface.showBust("BORING_MISTRESS");
	output("Curious, you ask what the price on the cow-girl's contract is.");
	output("\n\nThe mistress cocks an eyebrow at you, but dutifully flips through a few screens on her slate before making a tsking sound, nibbling on one of her big crimson lips. \"<i>Poor little Reaha here was in pretty deep, but she's been working here for a while, so she's cleared a good chunk of her debt. Let's see... hmm, the boss's got a note here, looks like she'll take five grand for the cow. Pretty good deal for what we paid for her. So what do you say, hun? She in your price range?</i>\"");
	//output("\n\n<b>Buying the contract is currently disabled due to unfinished content.</b>");
	
	clearMenu();
	addButton(1,"Nope",noCowslutsForYou);
	if (pc.credits >= 5000) addButton(0,"Sure",buyCowslutsForYou);
	else addDisabledButton(0,"Sure");
}


public function noCowslutsForYou():void
{
	author("Savin");
	clearOutput();
	userInterface.showName("BROTHEL\nMISTRESS");
	userInterface.showBust("BORING_MISTRESS");
	clearMenu();
	output("You shake your head, saying that you can't make that deal just now. The mistress shrugs and flicks her datapad idly. \"So, what'll it be, then? Just a go at her, or can I show you the door?\"");

	brothelMainMenu();
}


public function buyCowslutsForYou():void
{
	author("Savin");
	clearOutput();
	userInterface.showName("\nREAHA");
	userInterface.showBust("BORING_MISTRESS","REAHA");
	flags["REAHA_BOUGHT"] = 1;
	flags["REAHA_IS_CREW"] = 1;

	output("Five thousand is... actually ridiculously cheap for a servant, especially one with a lot of gene mods. Reaha must have been working awfully hard to work her debt down that low. You pull out your codex and tap open your banking application. \"<i>Done deal,</i>\" you say, wiring over the five grand. The mistress gives you a look of surprise, eyes wide for a moment before she composes herself.")
	output("\n\n\"<i>Well, that's... great,</i>\" she mumbles, looking down at her slate. \"<i>Huh, what do you know, it actually went through. Well, I guess I'll go get Reaha for you. Here, just sign this, and initial here,</i>\" she says, handing you her data slate and a stylus before trudging off into the lower levels. You shrug and start reading over the debt contract. Standard stuff, mostly: you agree to feed and water your indentured servant, set reasonable means of her earning her keep and paying off her debt, and not expose her to unreasonable harm. In a footnote you see that Reaha herself has agreed to be used sexually, which probably is what landed her here in a brothel to begin with. As you scan through the document, you find a picture attached: the slut herself, massively endowed with breasts that seem to pin her to the floor under their sheer weight, hooked up to milkers as she's being pumped from behind with some kind of pink aphrodisiac. They certainly got their money's worth out of her: the milk those udders must make alone would probably be worth the cost of her contract.");
	output("\n\nYou finish signing the contract just as the mistress returns, guiding the exceptionally busty \"servant\" in front of her. Bare-naked, Reaha's human at first glance, save for the pair of cute little cow-horns just poking through her long, strawberry hair. Her curves, though, are certainly the product of gene-mods: an ass and hips to die for, butt jiggling lewdly with every step, hips sashaying seductively as she approaches. Her breasts, though, were clearly her goal in modification: her arms are hooked under the obscenely large, perfectly shaped orbs for support, though nothing can stop them from bouncing with even the slightest motion. They're not nearly as big as your first look suggested, though; perhaps they change size if she's milked or not? Interesting.");
	output("\n\nReaha stops about a foot in front of you, looking sharply away from you as the mistress takes back her data slate and reviews the signed contract. \"<i>Hmm, alright. Everything looks good, " + pc.mf("Mister","Miss") + " Steele. Alright, then, she's yours. And now I can finally start moving the new girls in downstairs,</i>\" she adds with a note of satisfaction, starting to gather up her belongings from the desk.");
	output("\n\nAs the mistress works, you turn your attention to your new servant, looking her over. She continues to meekly avoid meeting your gaze, though the bare slit of her womanhood is clearly dripping with excitement. Finally, after a long moment passes, you introduce yourself. \"<i>I'm [pc.name],\"</i>  you say, \"<i>You're with me now. Understood?</i>\"");
	output("\n\n\"<i>Yes, " + pc.mf("master","mistress") +",</i>\"  Reaha says, staring pointedly at her feet. She takes a long breath, barely holding back a shudder as the mistress accidentally brushes her bare skin.");
	output("\n\nTurning back to you, the mistress takes out a long metal box and hands it to you. On the top is a cartoonish label of a massively endowed brevan male surrounded by fawning women of a variety of races. \"<i>Aphrodisiac patches. Less invasive, though perhaps less effective, than the direct injections we've been using to keep her quiet. Make sure to keep up with changing them or she'll likely become... agitated. The same goes for milking her, unless you like your cow-sluts nice and immobilized by their giant tits. The patches help with that, too. She gives her best milk when orgasming, we've found. Isn't that right, cow?</i>\" she asks, pinching one of Reaha's big nipples hard enough to make her whimper and wince -- and draw forth a big drop of milk, which the mistress wipes off on her tit.");
	output("\n\nSuddenly, Reaha looks up from the floor, finally meeting your gaze. \"<i>" + pc.mf("Master","Mistress") +", may I speak freely?</i>\"");
	output("\n\nWith the fiery look in this cow-girl's eyes, you reckon she's about to explode. You could tell her to get it off her chest this once, and then it's back to being a meek little milk-whore for you; or, you could give her blanket permission to speak her mind from now on. No sense in her keeping thoughts to herself while she plays the slave, right? Right?");

	pc.credits -= 5000;

	clearMenu();
	addButton(0, "This Once", oneTimeReahaBlammy);
	addButton(1, "Always", reahaISFREEEEEEE);
	addButton(2, "No", shutUpYouBovineSlutIDidntJustPayFiveGrandForABacktalkingBitch);
}


public function shutUpYouBovineSlutIDidntJustPayFiveGrandForABacktalkingBitch():void
{
	author("Savin");
	clearOutput();
	userInterface.showName("\nREAHA");
	userInterface.showBust("REAHA");

	output("\"<i>No,</i>\" you answer, \"<i>Now come on, let's get you to the ship.</i>\"");
	output("\n\n\"<i>I... yes, "+ pc.mf("master","mistress") +",</i>\" she sighs, looking back down again  as you lead the way to the door.");
	output("\n\n\"<i>Good riddance,</i>\" you hear the mistress mutter behind you as you make your way out, and back toward the [pc.ship].");
	clearMenu();
	addButton(0, "Next", reahaWantsToKnowWhatsUp)
}



public function oneTimeReahaBlammy():void
{
	author("Savin");
	clearOutput();
	userInterface.showName("\nREAHA");
	userInterface.showBust("REAHA");

	output("Seeing Reaha clearly has something to say to the brothel mistress, you give her a nod, \"<i>Fine. This once. But don't think you're gonna mouth off on me.</i>\"");
	output("\n\n\"<i>You got it,\"</i> the cow-girl says, just a moment before practically hoisting her erstwhile mistress over the desk by the collar of her blouse. \"<i>Listen up you bimbo piece of shit, I am sick and </i>fucking<i> tired of being called a dumb cow or a big-titted whore. I did NOT sign up for this to be hooked up to a bunch of machines and pumped full of drugs until I could barely think, and then left to rot for days between some horny john coming in and using me. My contract said I was down to fuck, not to be whored out. And I am </i>really<i> sick of your shit-eating superior attitude, slut. You are NOT fucking better than me, and no amount of latex fetish-wear is ever gonna change that. Oh, no... you are the lowest form of life in this fucking universe; and even with all these gene mods, you're a hell of a lot less human than I am. You had better thank your dear and fluffy lord I am getting the fuck OUT of here, because the next time I got my hands free, I was coming for your smug little bitch ass. And if you call me a cow again, so help me I will come down on you like the hand of God. Do. You. Get. Me?\"</i>");
	output("\n\nWith a face etched with clear and present terror, the mistress slowly nods. Scowling with contempt, Reaha lets the woman go, and she flops to the ground as the naked cow-girl turns to you and says, \"<i>Sorry about that. Can we go?</i>\"");
	clearMenu();
	addButton(0, "Next", reahaWantsToKnowWhatsUp)
}


public function reahaISFREEEEEEE():void
{
	//BRINGS YOU BACK TO THE SHIP. TAKE NOTE, FUCKNOXO
	author("Savin");
	clearOutput();
	userInterface.showName("\nREAHA");
	userInterface.showBust("REAHA");
	clearMenu();
	currentLocation = "SHIP INTERIOR";
	var map:* = mapper.generateMap(currentLocation);
	userInterface.setMapData(map);
	flags["REAHA_FREE"] = 1;
	pc.personality = pc.personality - 5;
	if (pc.personality <= 0) pc.personality = 0;

	output("\"<i>Sure,</i>\"  you say, \"<i>I'd rather you speak your mind from now on.</i>\"");
	output("\n\n\"<i>You're going to regret that,</i>\"  the mistress snickers.");
	output("\n\n\"<i>You got it,\"</i>  the cow-girl says, just a moment before practically hoisting her erstwhile mistress over the desk by the collar of her blouse. \"<i>Listen up you bimbo piece of shit, I am sick and </i>fucking<i> tired of being called a dumb cow or a big-titted whore. I did NOT sign up for this to be hooked up to a bunch of machines and pumped full of drugs until I could barely think, and then left to rot for days between some horny john coming in and using me. My contract said I was down to fuck, not to be whored out. And I am </i>really<i> sick of your shit-eating superior attitude, slut. You are NOT fucking better than me, and no amount of latex fetish-wear is ever gonna change that. Oh, no... you are the lowest form of life in this fucking universe; and even with all these gene mods, you're a hell of a lot less human than I am. You had better thank your dear and fluffy lord I am getting the fuck OUT of here, because the next time I got my hands free, I was coming for your smug little bitch ass. And if you call me a cow again, so help me I will come down on you like the hand of God. Do. You. Get. Me?\"</i>");
	output("\n\nWith a face etched with clear and present terror, the mistress slowly nods. Scowling with contempt, Reaha lets the woman go, and she flops to the ground as the naked cow-girl turns to you and says, \"<i>Sorry about that. Can we go?</i>\"");
	output("\n\nWith her clearly heart-felt farewells out of the way, you take your busty cow-girl out of the brothel and back to the ship. It's a long walk, and she gets no shortage of looks and cat-calls as she walks naked down the corridors, but she refuses the offer of a jacket or robe even from passing strangers, and after a while you can clearly see the excitement dribbling down her thighs. Looks like she gets off on it. Kinky.");
	output("\n\nAs you get back to the docks, Reaha finally breathes a short sigh and says, \"<i>So... sorry about the outburst. When I went into debt, I didn't think the 'yes, I'm okay with sex' check box meant 'please whore me out and pump me full of sex drugs till I'm a mindless fuck toy begging for the D from strangers.' Fuckin' assholes. I'm probably going to be addicted to that shit forever, now. That's great,</i>\"  she grumbles, tearing open one of the aphrodisiac pads and slapping it on her shoulder. She shudders and sighs as she walks, clearly becoming more aroused and relaxed by the second, breath ragged by the time you get to the dock.");
	output("\n\nYou're near the airlock now, and you punch in your access code as Reaha sighs, planting her hands on her hips. \"<i>Aaaaanyway, you seem like an alright "+ pc.mf("guy","girl") +". Thanks for letting me at least speak my mind. Playing the horny slut for a couple years was pretty brutal. I guess some guys are into it, though. So yeah, umm... thanks for that,</i>\"  she says, awkwardly offering you a hand. You shake it as the airlock finishes cycling, and guide your new crew member aboard. You find an empty cabin and guide her in. Sparsely furnished as it is, the smile on Reaha's lips tells you it's a big improvement over being shackled up in a dungeon.");
	output("\n\n\"<i>Nice. So, uh, you're not gonna tie me up or anything, right? Not that I mind a little rope play, I mean, but... let's not do the whole handcuff me to the wall for hours at a time, okay? With all these fucking patches, I gotta wank it like, all the time or I'll go crazy.</i>\"  You nod your agreement, and Reaha positively beams, \"<i>Oh man, I can FINALLY fap and milk myself! Thank god!</i>\"  she cries, practically jumping with joy.");
	output("\n\n\"<i>Oh, speaking of milk,</i>\"  she says, cupping her big, squishy breasts, \"<i>Just shout if you want a little cream in your morning joe, or even by the glass. It tastes like normal cow milk, I promise; the human stuff's icky. Although... I spent like, a bajillion creds on these things, but... if you happen to run into something that, say, changes what milk I'd make, I'm </i>totally<i> into that. You want me squirting honey or chocolate milk or whatever, just gimme the mod. Otherwise... I'm all yours... "+ pc.mf("Master","Mistress") +",\"</i> she says playfully as she stretches out on the bed.");
	output("\n\nYou nod, and tell her to get settled in.");

	processTime(60+rand(4));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


public function reahaWantsToKnowWhatsUp():void
{
	currentLocation = "SHIP INTERIOR";
	var map:* = mapper.generateMap(currentLocation);
	userInterface.setMapData(map);
	author("Savin");
	clearOutput();
	clearMenu();
	userInterface.showName("\nREAHA");
	userInterface.showBust("REAHA");

	flags["REAHA_SLAVE"] = 1;

	output("You step out of the brothel and into the crowded streets of the station, leading your nude cowgirl back toward the docks. It's a long walk, and she gets no shortage of looks and cat-calls as she walks naked down the corridors, but she refuses the offer of a jacket or robe even from passing strangers, and after a while you can clearly see the excitement dribbling down her thighs. Looks like she gets off on it. Kinky.");
	output("\n\nAs you get back to the docks, Reaha finally breathes a short sigh and, looking over your shoulder, you can see her tearing off a swatch of pink patches from her back, scratching at the reddened skin where the aphrodisiacs were pumping into her. \"<i>Hey, toss a couple more of those my way, would ya? I'm getting antsy, here... fucking whores probably got me hooked on that shit for life, at this rate.</i>\" You hesitate a moment, eyeing your newly purchased sexual servant, and that's all the time she needs for that rage you saw in her eyes to fizzle right back up.");
	output("\n\n\"<i>What!?</i>\" she huffs, arms crossing under her massive bust, \"<i>Look, I've been playing the lust-addled cow-girl for fucking years now, and I'm goddamned sick of it, okay? Look, I'll keep my smart-ass-ness to myself, but don't look at me like I'm some dumb bimbo slut, alright? Now gimme those stupid patches before I start hearing colors or something, and we can all go back to me pretending I'm a good little sex slave while you fuck me six ways to sunday.</i>\"");
	output("\n\nYou shrug and toss the patch box to her, and Reaha quickly covers herself in bright pink drug-stickers. A moment later, her face flushes and she gets a big, dopey smile as her cunt starts to drool obscenely. She shivers when you touch her shoulder, guiding her into the airlock to your ship. \"<i>Sorry, "+ pc.mf("master","mistress") +". I get angry without enough of, uh, this,</i>\" she mumbles, itching her shoulders. You ruffle her strawberry hair, leading her down toward an empty cabin. She flops down on the bed, tits jiggling obscenely, the flesh bouncing so rhythmically that you can't help but stare. With a lazy yawn, Reaha says, \"<i>Oh, by the way... I paid, like, a bajillion credits for this sexy body -- which you should totally come over here and use, cuz I need a good fucking -- but if you want me to lactate something other than delicious cow milk, just toss me the gene mods and I'll use 'em. I did chocolate milk for about a year, and that was pretty hot. Kinda sticky, though... anyway, just thought you should know.</i>\"");
	output("\n\n\"<i>Riiight,</i>\" you say as the cow-girl closes her eyes, drifting off. You figure you ought to let her get adjusted to her new arrangement.");	

	processTime(60+rand(4));
	clearMenu();
	addButton(0,"Next",mainGameMenu);

}
	
public function fuckReahasPussyintheBrothel():void
//Fuck Reaha's Pussy in the Brothel
{
	clearOutput();
	author("Savin");
	userInterface.showName("\nREAHA");
	userInterface.showBust("REAHA");
	output("You drop a hundred-cred chit into the little slot on the wall, and with a pneumatic hiss, the door  deepest inside Beth's Big-Breasted Brothel slides open. A tiny timer starts ticking down from 10 minutes, and with a nod from the guard in the hall, you step into the room. The door slides closed behind you, and the lights of the room flicker brightly, letting you get a good look at your companion. Suspended a few feet away, with wrists bound to a wrought-iron bar and back stuck with dozens of pink needles, all connected to tanks on the ceiling, is a woman. A small screen above her displays the name Reaha just above your timer.");
	output("\n\nReaha is just a touch over five feet tall, with exceptional curves in all the right places... mostly her tits. Looking at your sultry companion, your eyes are instantly drawn to the massive, milky melons on her chest, each so heavy that she's permanently affixed to the ground, held immobile by the sheer weight of her tremendous titflesh. She smiles faintly over her shoulder as you approach, hips swaying seductively as she asks, \"<i>Oh </i>finally<i> someone's here! Please tell me you want some of my milk... I've got soooo much saved up for you!</i>\"");
	output("\n\nYou slip behind the girl, lowering yourself down onto your [pc.knees] to get on her level. She shivers with excitement, grinding her plump derriere against your crotch as you pull off the tiny micro-skirt she's got on, revealing the military tattoos stenciled on her big butt cheeks, marking the ex-army bitch for the indebted slave slut that she is. Seeing her cunt already drooling on your britches, you toss your [pc.lowerGarments] aside, revealing your [pc.cock].");
	output("\n\nLetting it flop in between her big ass cheeks, you thrust into her crack, making the milky slut moo in pleasure, her cheeks tightly squeezing your prick. Hot-dogging away, you reach around her busty frame to grab her over-sized teats, fingers locking around the puffy nipples atop each. With the slightest squeeze, a flow of the purest white gushes out around your grasp, wetting the floor with her lactic lust. Reaha moans huskily, hips humping back with abandon as you start to milk her, slathering your hands with creamy streams. And it's only going to get messier...");
	output("\n\nDelivering an encouraging slap to the slave slut's jiggly ass, you rear back and line your [pc.cock] up with her sodden box, pressing your head in so close that you can feel her slick need on your shaft, so eager and needy, her sex demanding your cock. After all, how can a whorish cow give her milk without a big, fat cock buried inside her?");
	output("\n\nYou push in gently at first, letting the wanton wench moan lustily as your cock slides home, spreading the cum-soaked walls of her quivering quim wide around your thrusting manhood. She whimpers with ecstasy, biting her lip as your hips push in against her. With every inch, the unstoppable flood of milk pouring from Reaha's tits increases, more like a pair of hoses in your hands than a woman's tits. These gene mods are insane... but you're not complaining! You ram home inside her, feeling the lips of her womb kiss the tip of your [pc.cock] as your hips settle against her tattooed ass cheeks.");
	output("\n\nYour fingers sink into her soft, pliant kiester, squeezing Raeha's bubble butt as her tits go onto auto-pilot, squirting away without need of your hands. Like a burst dam, once this slut gets going, there's no stopping it! But hey, that leaves you free to get your pleasure from the slave girl. You didn't pay a hundred creds just to milk a cow, after all!");
	output("\n\n<i>\"Mmm, milk me harder!\"</i>  the cow-slut moans, clutching futilely at the bars shackling her hands, trying to hold herself steady as you start to pound her whorish cunt, your [pc.cock] thrusting harder and faster until you can feel her lubricant pouring out around your pounding prick, urged on by the sweet release of her cream and the constant stream of aphrodisiacs pumping into her veins from the tubes on the walls. You've barely gone for a minute by the time she cums for the first time, screaming -- or rather, bellowing -- a loud moo as her pussy clamps around your dick, trying to milk you as much as you're milking her.");
	output("\n\n<i>\"You like that, milk-slut?\"</i>  you jeer, spanking her again. She moos and groans in response, thrusting her hips back against you, trying to get at even more of your shaft. Well, she clearly wants it. You fuck her harder, grabbing her hips to hold her fast and hammering in, humping that milky slave-girl like you've never done before. She cries and bellows, milk spurting from her tits in greater gouts, so powerful they seem to be lifting her up; you could swear you can SEE them deflating, milked for everything they've got.");
	output("\n\nThe cow-slut practically collapses when she cums again, cunt spasming as you sink yourself in deep. Left hanging limply from her bar, she can only moo pitifully as you continue to fuck her. You're damn well getting your money's worth, and you've still got several minutes left before your time's up. Reaha's tits continue to unleash their milky load, pouring so much that the little drains on the floor can't even begin to keep up. They clearly weren't expecting YOU when they built this place!");
	output("\n\nReaha's chest heaves as she cums again, body too exhausted to even react more than a shudder and a squirt of fem-cum that plasters your groin. Her tits are almost emptied by now, and your time is starting to run out. The arc of white delight pouring from her massive teats is winding down, now more a trickle than a flood, but as you sink yourself ");
	if (pc.cockVolume(0) > 180)
	{
		output("as deep as you can ");
	}
	else if(pc.balls == 0)
	{
		output("all the way ");
	}
	else
	{
		output("balls deep ");
	}
	output("into her, she finally arches her back again and, casting a gaze over her shoulder, groans, <i>\"M-make me cum again. Pleeeeeaaasseee,\"</i>  she says, wiggling her ass about as seductively as she can while she's dripping white with milk, her cum and your pre leaking liberally from her well-abused twat.");
	output("\n\nWell, that's a request you're happy to grant. Giving her delectable rump another rough squeeze, you give yourself over to your most primal instincts, kicking it into overdrive as you pound her pussy with wild abandon. Reaha cries and groans, milky teats exploding with one last mighty gush as you hammer in, cockhead kissing the suckling maw of her womb before with a mighty roar you bust your nut, screaming your pleasure as you cum, and cum, and cum, painting the cow-slut's walls [pc.cumColor] with your pent-up seed.");
	output("\n\nReaha squeals and cries, eyes practically crossing as you thrust your seed deep into her dripping cunt, splatting her with your cum. With a grunt of effort, you pull out after what you think is the last burst, only to shudder and groan as another hot spurt of [pc.cumColor] blows from your slit, smearing onto Reaha's big booty, practically marking her as your slut in the most feral way possible, leaving her well and truly fucked, dripping your seed onto the milk-spattered floor.");
	output("\n\nNearly collapsing from sexual exhaustion, you stumble back from the panting cow-slut, watching with pride as her body convulses, cunt drooling a thick web of feminine slime as you try and get to your [pc.feet]. With a final sigh, you give the milky whore a decisive swat on the bum, leaving that tattooed ass bouncing as you leave. Behind you, Reaha moans, <i>\"T-thank you... maybe I'll see you again? I mean, come back soon...\"</i>");
	pc.credits -= 100;
	processTime(10+rand(4));
	pc.orgasm();
	chars["REAHA"].loadInCunt(pc);
	//Clears menu data
	clearMenu();
	//Set up a button: first argument is the button index 0 to 14 for the first page.
	//Second is button name
	//Third is destination function - don't include ()'s
	//addButton(0,"Repeat",exampleGrinding);
	addButton(0,"Next",mainGameMenu);
}


public function RideReahasStraponAtTheBrothel():void
//Ride Reaha's strapon at the brothel!
{
	clearOutput();
	author("Savin");
	userInterface.showName("\nREAHA");
	userInterface.showBust("REAHA");
	output("You drop a hundred-cred chit into the little slot on the wall, and with a pneumatic hiss, the door  deepest inside Beth's Big-Breasted Brothel slides open. A tiny timer starts ticking down from 10 minutes, and with a nod from the guard in the hall, you step into the room. The door slides closed behind you, and the lights of the room flicker brightly, letting you get a good look at your companion. Suspended a few feet away, with wrists bound to a wrought-iron bar and back stuck with dozens of pink needles, all connected to tanks on the ceiling, is a woman. A small screen above her displays the name Reaha just above your timer.");
	output("\n\nThe slut looks over her shoulder at you, barely able to see over her own huge ass and flowing strawberry hair. She's utterly immobile, unable to do much more than stare as you approach: her wrists are chained to an iron bar, and her tits... they're huge: big enough to pin her to the floor, a pair of perfectly rounded orbs straining under their milky weight. Reaha smiles faintly over her shoulder as you approach, hips swaying seductively as she asks, <i>\"Oh </i>finally<i> someone's here! Please tell me you want some of my milk... I've got soooo much saved up for you!\"</i> Well, with tits like that, she's probably got enough saved up for half the station. You approach her, sliding a hand appreciatively across her expansive backside, thumb brushing across a big marine tattoo chiseled into her right cheek, hinting at the whore's former occupation. ");
	output("\n\nYou dig your fingers into her rump, rolling the cow-girl over onto her back. She gives a startled yelp, groaning as her arms twist around in their restraints; the misty-pink-filled tubes flop around her as Reaha comes to rest with her back as much against the wall as it can be. She looks up at you with hazy blue eyes, thrusting her chest out, making her huge tits jiggle obscenely in her lap. You straddle the cow-girl and grab one of her massive orbs, pinching the wide areola just enough to make her leak a thin trail of milk which arcs");
	if(pc.legCount > 1) output(" between");
	else output(" past");
	output(" your [pc.legOrLegs], spattering onto the floor. Reaha gives a soft moan, back arching as you keep the pressure up, slowly lowering yourself down to her level and taking the gushing teat into your mouth. The flow of her milk is ceaseless, making your cheeks bulge before you can swallow her sweet cream: it tastes just like a cow's, too!");
	output("\n\n\"<i>You went all out on these mods, didn't you?</i>\"  you tease, pulling your lips off her nipple just long enough for the stream of cream to utterly soak your [pc.chest]. You give a mock <i>tsk</i> as she soaks your gear with her breastmilk, giving Reaha a playful slap on the thigh before standing again, divesting yourself of your [pc.gear]. She stares up at you, tits still dribbling milk as you shed your gear and, with a seductive smile, step over to a table nearby, covered with sex toys just for someone like yourself. You run your fingers slowly over the collection of dildos on display, imagining each of them crammed into the bustyslut's every hole -- and yours. Casting a look Reaha's way, you see her visibly gulp as your fingers brush across one particularly large specimen, a double-sider about as thick as your arm, with a thick leather strap to hold it in place like a big, floppy plastic cock. Perfect.");
	output("\n\nGrabbing the over-sized toy, you step over to the bound cow-slut, looming over her. Reaha lets out a quiet little whimper as you turn the big ol' dildo over in your hands appreciatively. When you lean down, she tries to inch away, but her bindings stop her... and the spreading pool of moisture on the floor, seeping from her sodden box tells you she's practically dying to feel this bad boy's girth inside her. You slip into Reaha's lap, moving her oversized tits out of the way to expose the soaked slit of her snatch. Her entire body quakes as you brush your fingers along her slit, and she practically cums on the spot when your thumb touches her prominent bud: her whole cunt clenches down, smearing your hand with fem-slime. Good god, what are they pumping her with?");
	if (pc.libido() > 40)
	{
		output(" And where can you get some?");
	}
	output("\n\nNow that she's... suitably aroused, Reaha only pants and moans as your fingers slip into her slick slit, gently probing her, stretching her ever so slightly as you bring the crown of the plastic toy to her milky breast, giving it a nice white coating to ease the insertion. She still tries to back away from the big, purple cock when you bring it down towards her sex, but her hips inch forward, humping against your fingers, desperate for release. Well, you're sure this'll give it to her.");
	output("\n\nYou line the milk-soaked crown up with Reaha's soaked box and ram it in. She throws her head back and screams, tits bouncing and spurting as she cums, fem-spunk gushing out around the massive dildo as you push it deep into her, stretching her out wide. Her breasts jiggle and bounce, pouring their liquid load all over you as you push the dildo deeper and deeper into the screaming slut until she can't physically take any more. You're pretty sure she cums a second time, still on the heels of the first, as you get the plastic cock settled in her well-stretched vag. Finally, her screams die down, leaving her hanging heavily from her chains, breathing hard. You pat her soft teat, shifting between her splayed legs as you tie the leather belt around her hips, tying the cock into her, leaving it pointed up like a flagpole, just ripe for you. Rubbing a bit of milk between your fingers, you slip them down to your own [pc.asshole], smearing your puckered hole with Reaha's natural lube. You shudder as a finger pushes it into you, gently glazing your inner hole with a thin creamy layer before you grab Reaha's shiny new cock and lining it up with yourself. ");
	output("\n\nThe cow-slut whimpers with anticipation as your [pc.hips] slide down toward the shimmering crown of her plastic cock. You give her a reassuring pat on the head, wrapping your fingers around one of her tiny bovine horns as you feel the first hint of pressure on your [pc.asshole].");
	if (pc.ass.looseness() <= 2)
	{
		output(" No matter how much you relax, though, you know taking this massive ogre cock isn't going to be easy, no matter how much milk you smear on it. You grit your teeth and do what you can, pushing down on the gigantic rod until you can feel the very tip of it pushing up into you.");
	}
	else
	{
		output(" You groan as the tip of the tremendous tool pushes against your clenched behind, slowly forcing your well-stretched anus to open wide and accept its gigantic girth.")
	}
	output("\n\nReaha cries out as your downward thrust pushes the dildo deeper into her, hammering its other head into her cervix. Your grip tightens on her horns, pulling her down into your [pc.chest] as you start to slide down the girthy dildo rammed up your [pc.asshole].");
	output("\n\nIt's a long, slow ride down the strapon's length. You groan and sigh, back arching as you take inch after inch, anal muscles spasming and clenching wildly, trying oh so desperately to push the invading shaft back out: which just makes it feel so much better.");
	if (pc.hasCock() == true)
	{
		output(" Your [pc.cock] jumps to half-erection as the tower of plastic rolls past your prostate, milking you with every inch until until the first dribbles of [pc.cumColor] seed bubble up from your [pc.cockHead], smearing across Reaha's milk-slick skin to mix with her pearlescent cream.")
	}
	pc.buttChange(50,true,true,false);
	output("\n\nIt feels like minutes pass before your [pc.butt] comes to rest in Reaha's lap, her strapon cock firmly embedded all the way up your ass, just huge enough that you can feel your stomach bulging as the crown stretches your [pc.skin] taut. You let out a low, feral growel as you come to rest, finally letting go of the poor cow's horns to stroke the great swells of her milk-full breasts, bringing one of them to your lips. She gives a soft little moan as you lock your lips around her wet teat, suckling just hard enough to get her going -- and it doesn't take much until the sheer pressure in her tits keeps her flowing and flowing, bulging your cheeks faster than you can swallow.");
	output("\n\n\"<i>So full,</i>\" she groans, arching her back as you drink of her. \"<i>Never... never milk me enough. Ahhhh, so good....</i>\"");
	output("\n\nIs she going to...? You wince as the strapon moves inside you, spurred on by Reaha's convulsing cow-cunt. You grin and suckle harder, gently biting her big teat as your hand moves to molest her other breast, squeezing it until the white cream flows over your fingers. Reaha cries out, her voice breaking into an animalistic scream of unchecked pleasure as she cums, her boobgasm spreading visibly from her massive tits down to her wide-spread pussy; you can see her muscles squeeze and grind on the plastic shaft, desperately wringing it as the cow convulses in orgasmic ecstasy. Her cries die down into a long, throaty \"<i>Mooooooooo</i>\" as she comes down from her second climax, head rolling back against the wall as she desperately pants, chest heaving in your grasp.");
	output("\n\nYou take that as a sign to get moving yourself. You wrap your arms around the exhausted cow, bracing yourself against her massive bust as you slowly lift yourself a few inches off her lap, your breath catching as your stomach seems to deflate, left with a hollow emptiness as the ogre cock slides out of your gloriously stretched asshole, all the way to the flared head, leaving you feeling so... so hungry for it. It's almost an unconscious decision when you ram yourself back down on the cow's plastic prick. Reaha groans as the toy shifts inside her, her voice building to an echoing cry as you grab her great big nipples, squeezing them hard as you bounce on that huge, gut-stretching rod, humping against Reaha harder and harder as her strapon pounds your ass.");
	output("\n\nYour breath comes ragged as you ride the massive plastic cock, bouncing until even Reaha's whining with lust, desperately straining against her manacles as the aphrodisiacs flood her veins and the cock inside her shifts and slides against her slick channel. \"<i>G-gaaahhh, no mooooooooo</i>\" she groans, moaning oh so sweetly as you drive her dildo into her with every thrust, \"<i>D-don't make me cum agaaaain!</i>\"");
	output("\n\nOh, you wouldn't miss that for the world. You twist her teats hard, making her yelp in pleasure and pain as you pick up the pace, fucking yourself on that glorious plastic shaft as hard as you can. Reaha's powerless to do anything but buck her wide hips back against you, suddenly thrusting her strapon right up your ass. You scream as your stomach visibly bulges, distorted by the sheer size and depth of the false cock pounding your [pc.asshole]. You try to push her down before she can jackhammer you over the edge, but her great big milky tits get in the way; you just end up with two handfuls of breast squeezed between your fingers, spraying your [pc.chest] with milk as the moaning cow slams her hips as far into you as she can.");
	output("\n\nYou cum hard. Screaming at the top of your lungs, you feel the dildo slam into you, finally driving you over the edge, taking Reaha with you as you savage her teats. Both your backs arch as your [pc.chest] mashes into hers, slathering you with breastmilk as your [pc.asshole] squeezes the strapon with all its might, pleasure shooting through you like an electric current");
	if (pc.hasCock() == true)
	{
		output(" straight to your [pc.cock], as the limp member suddenly flushes with cum, exploding a hot load of [pc.cumColor] all across the cow's milky chest");
	}
	output(". The cowgirl gasps and cries as your [pc.hips] slam down on her plastic cock, slapping her back down to the floor and shoving her end right back up her soaked slit until she's positively crying, stomach distending as she takes the whole of her half in one stroke.");
	output("\n\nYou hump furiously, desperately wringing every last ounce of pleasure you can from your anal orgasm, pounding Reaha's squirting cunt with every thrust until with a shrill cry she cums <i>again</i>, spurting fem-spunk in thick webs around the massive dildo cramming in her. Nearly collapsing from sexual exhaustion, you pull yourself off the milk-slick dildo, stumbling away from the panting cow-slut and watching with pride as her body convulses, cunt drooling a thick lake of feminine slime as you try and get to your [pc.feet]. With a final sigh, you give the milky whore a decisive swat on the hip, leaving her with a nice, thick cock buried up her twat: she seems almost picturesque with the big floppy purple prick wagging in her crotch, like it was meant to be there.");
	output("\n\nBehind you, Reaha moans, \"<i>T-thank you... maybe I'll see you again? I mean, come back soon...</i>\"");
	output("\n\nYou knew she'd enjoy that. Dirty girl.");

	pc.credits -= 100;

	processTime(20+rand(4));
	pc.orgasm();
	//Clears menu data
	clearMenu();
	//Set up a button: first argument is the button index 0 to 14 for the first page.
	//Second is button name
	//Third is destination function - don't include ()'s
	//addButton(0,"Repeat",exampleGrinding);
	addButton(0,"Next",mainGameMenu);

}

public function talkToBrothelLadyRepeatAgain():void
{
    clearOutput();
    showName("BROTHEL\nMISTRESS");
    showBust("BORING_MISTRESS");
	author("JJ-Cup");
    output("You decide to approach the mistress again. Your entrance diverts her attention as she sets her tablet down and turns to greet you. With unremarkable boredom, she drones, \"<i>Welcome to Beth's Busty Broads. If you're here for our");
    if(silly) output(" big ass, blow-out sale-a-thon");
    else output(" going out of business sale");
    output(", you're out of luck. The selection of available sluts have dried up.</i>\"");
    output("\n\nHm... Maybe better luck next time?");
    
    clearMenu();
    addButton(14,"Leave",mainGameMenu);
}