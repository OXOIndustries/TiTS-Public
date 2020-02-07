// (scene: SSBW)
public function studyHerPaigeByPaige():void
{
	clearMenu();
	clearOutput();
	showPaige(true);

	output("You bring your hands up to Paige’s arms, drawing your fingers along her fine, soft fur, and feeling the toned, sturdy muscles underneath them. You bite into your lower lip as your hands trail upward, toward her strong shoulders, made tough yet limber after a lifetime of twisting, turning, and supporting her body weight with yoga practices and positions. Her upper back isn’t worse off, either: you can feel the ridge of her every muscle underneath her fur, taut and flexed, as she keeps to her position on top of you.");
	output("\n\nShe hums in pleasure and shakes her shoulders, worming your fingers across her upper back, getting you to touch her more. Her breasts sway just inches from your face: they’re firm, like the rest of her, but just enough that they give you somewhere snug to bury your face into, rather than actively fighting against you when you try to motorboat her.");
	output("\n\n<i>“In a bit of a touchy mood, are we?”</i> she snickers. She arcs her back, giving you more of her chest for you to disappear into, until your [pc.lips] meet her ribs. Once you’re good and comfy in her cleavage, she rolls her arms inward, deepening their cavern and giving you more area to submerse yourself in. <i>“Go ahead and keep touching, sweet thing. Mmm....”</i> ");
	output("\n\nYour hands are busy on her back the whole time, scratching beneath her fur to find the skin beneath and giving it an appreciative rub. Paige isn’t musclebound");
	if (pc.physique() >= 40) output(" – you could probably bench more than her");
	output(", but all those years holding those difficult positions, with all her muscles fighting against each other, have given her some incredible definition. They may not be big, but you can feel every single one against you.");
	output("\n\n<i>“It’s nice to have someone appreciate all the hard work I put into myself,”</i> she says wistfully as she drags her body against yours, rubbing your face into her cleavage some more. <i>“If I weren’t trying to be professional in my classes, I’d be offering my ass out for gropes left and right. Sometimes, you just want to be objectified a little, you know?”</i>");
	output("\n\nShe wants to be ‘appreciated’ like an ‘object,’ does she? It’d be wrong to call her a piece of art – she’s more like a museum, with an entire gallery on display for you to appreciate, and you’ve only just started the tour.");
	output("\n\nWhat do you want to appreciate next?");

	// end scene (scene: SSBW); increase Lust by 2; advance the clock by 1 minute
	pc.changeLust(2);
	processTime(1);
	var values:Array = ["SSBW", 0];

	addButton(0, "Chest", paigesChestHasTwoGreatTreasures, values);
	addButton(1, "Shoulders", paigeHasAHornyHeadWorshippingHerShoulders, values);
}

// (scene: SSBWC)
public function paigesChestHasTwoGreatTreasures(values:Array):void
{
	clearMenu();
	clearOutput();
	showPaige(true);

	// Continue here if coming from SSBW
	if (values[0] == "SSBW") output("You decide that where you are is perfect for you both: your face, buried deep into Paige’s cleavage, so close that you can feel her heartbeat through the meat of her tits. You start peppering her deep cleavage with kisses, tracing them up her right boob, until you grace her nipple with your [pc.lips]. At that, well, it would be weird if you <i>didn’t</i> start sucking.");
	// Continue here if coming from Stomach
	else if (values[0] == "SSBWSt")
	{
		output("Of the three directions you could go from here, one of them is more correct than the others. When making love to your woman, you mustn’t ever forget to give the breasts the attention they rightfully deserve.");
		output("\n\nYou slither your body up Paige’s, tracing your [pc.tongue] along the crease of her abs as you go, until you feel the underside of her boobs against your forehead. From there, you tilt your head back, and you eagerly kiss into her underboob, feeling the firm tit against your [pc.lips]: soft and welcoming, but firm enough to give you some resistance when you push. The perfect bodybuilder’s rack. You let your lips find their own way, and they find their way straight onto Paige’s right nipple.");
	}
	// Continue here if coming from Shoulders or Arms
	else
	{
		output("Your left hand travels from her upper arm, to the underside of her ribs. You aren’t subtle about it: you want to grab a handful of titty. Paige abides with a giggle and hefts herself from the bed, pushing her back against your [pc.chest], and giving your hand some room to slide in.");
		output("\n\nBut that’s not enough, not for you. When she pushes herself back against you, you slide off her and take the opportunity to worm the rest of your arm beneath her, propping her up against you. Without a word, she gets the idea that you want to be beneath her; it takes a bit of awkward shuffling at first, but you two get into position, with her back on top of you, straddling you, and with her boobs in your face. You don’t hesitate to suck her right titty into your mouth.");
	}

	// Merge
	output("\n\nYou play with her other boob all the while: palming it; squeezing it; pinching its nipple, just slightly; and rolling it against her other, moving it closer so you can transition from her right boob to her left. Paige coos and shifts against you all the while, giving you some motion to play with: when she grinds forward against you, you have to crane your neck a bit to follow her motion, and when she leans back and pulls away, you, like a drunk-on-titty-sucking rube, follow her, not wanting to let her go.");
	output("\n\n<i>“Fuck yeah, [pc.name], give the girls some lovin’,”</i> Paige whispers, her hand stroking " + (pc.hasHair() ? "through your [pc.hair]" : "across your bald ahead") + ". You cross your arms behind the small of her back, keeping her from retreating too far from you, but, aside from the teasing and the games, she doesn’t have any intention of going too far.");
	output("\n\nYou open your mouth wide and loll your [pc.tongue] out, worming it into the depths of her cleavage and giving her a long, thick lick up the inside of her boob; you swing the tip of your tongue across her nipple before you return to her cleavage and do the same to the other one, getting it just as moist with your spit. It’s going to leave her fur on your tongue, but you don’t care – it’s making Paige shiver with pleasure, and that’s all you’re after.");

	// end scene (scene: SSBWC); increase Lust by 2; advance the clock by 1 minute
	pc.changeLust(2);
	processTime(1);
	values[0] = "SSBWC";
	values[1] += 1;

	addButton(0, "Stomach", paigesBellyIsEvenTastierThanTheFoodInIt, values);
	addButton(1, "Arms", paigeIsAtLargeArmedAndDelicious, values);
	addButton(2, "Shoulders", paigeHasAHornyHeadWorshippingHerShoulders, values);
}

// (scene: SSBWSt)
public function paigesBellyIsEvenTastierThanTheFoodInIt(values:Array):void
{
	clearMenu();
	clearOutput();
	showPaige(true);

	// Continue here if coming from Groin
	if (values[0] == "SSBWG")
	{
		output("You give her thigh one last kiss before you extend your [pc.tongue], laying it flat against the inside of her leg. She’s shaking in pleasure from the attention, and despite the stability of her strong body, she can’t help but shiver under your every lick as you travel northward, bumping your nose against her pelvis.");
		output("\n\nYou can feel the heat of her ignored pearl against your neck, cruelly ignored in favor of her tight abs. Her body’s crunched in pleasure beneath you, accentuating every single abdominal beneath her fur for you to count. You can’t see her abs very well in this light, but, with your nose pressed deeply into her fine fur, you can map out every individual one, and soon, she’ll be feeling your [pc.lips] against them.");
	}
	// Continue here if coming from Chest or Arms
	else
	{
		output("Your hands glide down her body, over the swell of her ass, and hook underneath them, giving her firm cheeks a heft. She groans in delight at the feel, but you pull upward a little harsher than a simple grope would imply – you want her to scooch herself up a bit, and she complies.");
		output("\n\nYour cozy little cavern inside her cleavage slips away from you as she slides upward. You grind your nose against her taut front, going from between her breasts, to her solar plexus, and eventually settling on her stomach. Pressed right up against your face is her rock-hard six-pack – it’s difficult to see them in this light, but you can feel every single abdominal through her fine fur, and soon, she’ll be feeling your [pc.lips] against each one.");
	}

	// Merge
	output("\n\nPaige’s arms stretch over her head, giving you unimpeded access to her whole belly, and she leans onto the bed’s headboard for stability, giving your own hands some room to do what they want. You help yourself: they tickle at her ribs and her lower back while you better acquaint yourself with abs so well-defined they could be used to file your nails.");
	output("\n\nYou lick circles around every one of them, going from her topmost set to her lowest set. When you get to the bottom, you make a single, long pass right up the center, before starting again from the top.");
	output("\n\n<i>“Gods,”</i> she breathlessly whispers. Her back sways from side to side against you, ensuring that you don’t miss a single spot on her front, not that you intended to do a half-assed job. You pepper her stomach with kisses, giving your tongue a break, and you pay special attention to her navel: she flinches the most when you dig your against her belly-button, and her breath comes out as sharp gasps through her nose, so she must like it the most.");
	output("\n\nShe, perhaps unconsciously, humps her stomach against your face, as if she were trying to imprint the sensation of her muscled stomach against you. Of course, you don’t stop here – that’s what you’re here for: to give her body the attention she wants. You can feel every bump of her rock-hard abdominals press into your features; it’s like she’s hiding a set of smooth rocks underneath her fur. You get started on another wet pass, from top to bottom – you might habe miscounted how many she has, and you’ll need to quadruple check.");
 
	// end scene (scene: SSBWSt); increase Lust by 2; advance the clock by 1 minute
	pc.changeLust(2);
	processTime(1);
	values[0] = "SSBWSt";
	values[1] += 1;

	addButton(0, "Groin", theLamenessOfTheseFunctionPunsMakesPaigeGroin, values);
	addButton(1, "Chest", paigesChestHasTwoGreatTreasures, values);
	addButton(2, "Arms", paigeIsAtLargeArmedAndDelicious, values);
}

// (scene: SSBWG)
public function theLamenessOfTheseFunctionPunsMakesPaigeGroin(values:Array):void
{
	clearMenu();
	clearOutput();
	showPaige(true);
 
	// Continue here if coming from Stomach
	if (values[0] == "SSBWSt")
	{
		output("Still, with all the attention you’ve been giving Paige and her washboard abs, there’s one part of her that you can’t ignore for much longer. With how her body is pressed against you, her pussy is right against your neck and upper chest: you can feel its heat and its moisture against your [pc.skinFurScales], and you’ll need to make the rounds towards it eventually.");
		output("\n\nWith some reluctance, you disengage from her stomach and start kissing your way down while also shifting her to your side, guiding her onto her back, with you on top. Her abdominals end, and connect into the soft V of her crotch – not quite her stomach, but not quite her wet pearl. You spend some time there, drawing fat licks against her body, circling yourself southward, before diverting suddenly and making for the inside of her left thigh.");
	}
	// Continue here if coming from Legs
	else
	{
		output("As taut as her legs are, and as much as you could see yourself spending the next few hours between her shapely calves and giving the hard work she’s put into them the appreciation they deserve, there’s something that you, as her lover, can’t ignore, and it’s resting just a scant handful of inches away.");
		output("\n\nStill, this is as much foreplay for you both as it is a show for Paige. You can’t just dive right in – there’s nuance and subtlety that goes into going down on your partner. You <i>could</i> skip the games and jump tongue-first into her box, but now’s not the time to act like a thirsty slut. Paige wants some <i>attention.</i>");
		output("\n\nStarting at her left calf, still stretched out over your shoulder, you kiss and lick your way up. She giggles and flinches when you lick at the back of her knee – apparently a sensitive spot for her. You can already feel from here just how ready she is for you to dive right in and give her the relief she’s after, but you maintain your course and slowly make your way up, until your cheek is pressed against the thick of her inner thigh.");
	}

	// Merge
	output("\n\n<i>“Oh, you little tease,”</i> Paige says breathlessly. Her body reflexively tries to roll her hips against you, to crush your face in between her thighs and smother you against her pussy so it can get the relief she needs, but she resists, with an awful lot of shaking and effort. Your left hand is hooked around her leg, to keep them spread apart, while your right is resting on her stomach, idly coursing over her abs.");
	output("\n\nThe heat of her pussy practically burns against your cheek, and your every breath is tainted with the smell of a musky Ausar in some desperate need of a mouth to taste her, but, with some effort, you resist, for now. In fact, you dare to disengage from her thigh and switch to the other – your [pc.lips] draw so close to her pussy that you bump up against her vulva, and you collect a bit of her condensation onto them. You use that to moisten your lips and start again.");
	output("\n\nPaige’s hand runs " + (pc.hasHair() ? "through your [pc.hair]" : "over your head") + ", and she keeps her legs spread wide open for you, giving you access to everything. It’s a vulnerable position for her: when your [pc.tongue] washes against her thick, hard, muscled thigh, she shivers and recoils against you, hoping to guide you towards her juicy center, but you don’t. Instead, you just pucker your lips and give her thick yoga thighs another wet kiss.");
 
	// end scene (scene: SSBWG); increase Lust by 2; advance the clock by 1 minute
	pc.changeLust(2);
	processTime(1);
	values[0] = "SSBWG";
	values[1] += 1;

	addButton(0, "Legs", paigesLovelyLongLegsLickedLasciviously, values);
	addButton(1, "Stomach", paigesBellyIsEvenTastierThanTheFoodInIt, values);
	addButton(2, "Pussy", paigesPussyPacifiesPuppyPamperingPCs, values, "Pussy", "Odds are pretty safe that, if you decide to worship this, it’d be the end of the road.");
}

// (scene: SSBWL)
public function paigesLovelyLongLegsLickedLasciviously(values:Array):void
{
	clearMenu();
	clearOutput();
	showPaige(true);
 
	// Continue here if coming from Groin
	if (values[0] == "SSBWG")
	{
		output("Going straight for her pussy would be the easy option. Paige wanted you to ‘appreciate’ her body, and you’ll be damned if you’re going to leave a job half finished.");
		output("\n\nYou start to trail your kisses down the inside of her thigh, and you scooch yourself backward, giving yourself more room to kiss down her legs. <i>“Noooo,”</i> she whines, knowing that you’re not going to go straight into eating her out this time. She curls her leg over your shoulder, trying to keep you against her, but it’s a half-hearted attempt, more playful and serious, and you just take the chance to grope and massage at her exposed thigh while you kiss at her knee.");
	}
	// Continue here if coming from Butt
	else
	{
		output("As delectable as Paige’s butt is, and despite how positive you’re sure she’d love nothing more than for you to spend the next few hours kissing those cheeks of hers, there is still more to do on this tour of yours!");
		output("\n\nYou start kissing your way down the backside of her right thigh, towards her knee. She ‘humphs’ in disappointment, confirming your suspicions, but she doesn’t try to coerce you to stop. In fact, once you reach her knee, she rolls onto her side and lifts her leg straight up, giving you full access to everything you could ask for. Your hands massage at the hickeys you’re sure you’d be leaving behind if she didn’t have the fur to hide them; Paige relaxes and rolls onto her back, letting you see all of her.");
	}

	// Merge
	output("\n\nHer hand slides down her front, inching its way towards her dripping cunt. She knows you’re watching. <i>“Don’t mind me,”</i> she whispers, just loud enough to be heard over your kisses, as she spreads herself open with her index and ring finger, showing you what it is you <i>could</i> be worshipping instead.");
	output("\n\nFor now, you take it as a challenge: you think you’d both be okay with going straight from kissing her legs to kissing something much tastier, but you’ve only just started on her legs.");
	output("\n\nShe, of course, doesn’t hesitate: she lays her middle finger flat against her clit, frigging against it, and teasing herself with penetration. You wonder who between you two will break first – will she start fucking her hand right here, in front of you, or will you make your way back down and slap her hand away, to give her pussy the lip-service she wants?");
	output("\n\nYou distract yourself by reaching for her left leg and hefting it up over your shoulder, kissing at her knee before leaning back for her calf. Her muscles are firm even at rest: all that contorting and flexing has given her legs all the definition she could ask for, and your kisses and licks don’t cause them to yield at all.");
	output("\n\nThat said, every time your [pc.tongue] reaches an apparently sensitive spot on the underside of her knee, her body flinches in delight, and her hand fidgets, with her middle finger crooking inwards. Deciding that she can’t win, she withdraws her hand before she gets greedy, opting to forfeit rather than to lose.");
	output("\n\nThat’s okay, though. You’re pretty sure you’re both going to win before the end of this.");

	// end scene (scene: SSBWL); increase Lust by 2; advance the clock by 1 minute
	pc.changeLust(2);
	processTime(1);
	values[0] = "SSBWL";
	values[1] += 1;
 
	addButton(0, "Butt", paigeUsesItForSittingButtYouUseItForFun, values);
	addButton(1, "Groin", theLamenessOfTheseFunctionPunsMakesPaigeGroin, values);
	addButton(2, "Pussy", paigesPussyPacifiesPuppyPamperingPCs, values, "Pussy", "Odds are pretty safe that, if you decide to worship this, it’d be the end of the road.");
}

// (scene: SSBWBu)
public function paigeUsesItForSittingButtYouUseItForFun(values:Array):void
{
	clearMenu();
	clearOutput();
	showPaige(true);

	// Continue here if coming from Legs
	if (values[0] == "SSBWL")
	{
		output("There are two three directions you could have taken this little party of yours. One of them would have been the end of the road, no question about it, and one of them would have brought you dangerously close. There’s still some more of her that needs some of your kisses, and it’s easily one of her best assets.");
		output("\n\nYou heft Paige’s left leg up and push it over, folding it over her other leg. She gets the picture and flips onto her stomach, her arms folded under the pillow, her tail swishing lightly in front of you, drawing your eye to her toned ass. As tempting as it is to dive right in and shower those cheeks in your affection, you need to work your way there.");
		output("\n\nThat’s what you do: starting at her calves, you kiss your way up her legs, nibbling into the fur and grazing your teeth against her powerful muscles. Not enough to hurt – hell, barely enough to tickle – but enough to get a feel for how strong they are. You drag your [pc.tongue] along the back of her knee before continuing up her thigh, opening your jaw wide and giving her a bite before kissing the spots your teeth pinched – and then you close the gap, placing the first of many kisses onto the broadside of her left asscheek.");
	}
	// Continue here if coming from Back
	else
	{
		output("Paige’s face is buried into her pillow, totally relaxed underneath your busy hands and mouth, like you’re a masseuse and she’s about to get a happy ending. You suppose that’s not too far from the truth: your gentle fondling and attentions of her powerful, rippling back muscles aren’t unlike a massage. Every time you find a new ridge and a new muscle for you to fawn over, you can’t help but spend a few minutes with it and wonder how she managed to get <i>that</i> one in particular so defined.");
		output("\n\nStill, there’s more to her body than just a sexy back. You drag your nose down her spine, breathing in the scent of her well-groomed fur and tickling its tip with her bristles. Your hands find her hips when you reach the small of her back, just a bit north from where her tail meets her body, and you rest there for a moment, laying your cheek against the warm curvature of her back. Paige sighs and bends her knees a bit, and you can feel her ass press into your [pc.chest].");
		output("\n\nIt’s important not to get distracted when you’re so close to your destination. Her swishing tail is a bit of a distraction – a welcome one, that you don’t hesitate to spend a bit of time with, stroking and grooming with kisses, just like the rest of her – but you know exactly what part of her you’d rather be kissing instead. Your [pc.lips] find the way on their own, and before you know it, you’re planting a full, open-mouthed, wet kiss on the broadside of her left asscheek.");
	}

	// Merge
	output("\n\n<i>“Finally,”</i> Paige sighs, nuzzling her face into the pillow and pushing her butt out, giving you more surface area to cover. <i>“If there’s any one part of me I want you to spend the next few hours kissing, [pc.name], it’d be that.”</i>");
	output("\n\nThat could be construed as a mean thing to say, but... " + (silly ? "you don’t mind being bulli’d, if it’s her" : "that can be still be kind of hot") + ". Besides, she’s right: her diet and her workout routines have given her a structurally perfect ass, and you’re all too eager to kiss her cheek from where it meets her leg, all the way up to where it meets her back, and all the way around to where it meets her hip. You let your [pc.tongue] fall out and lick a big, fat lick across the globe of her cheek, trying to push her glute with just your mouth, but, even though it isn’t flexed, it doesn’t budge an inch.");
	output("\n\nWhen it’s time to get her right cheek the same attention, you’re reluctant to cross the gap, for no other reason than because it means you’re leaving her left one unattended, and no matter how much love and attention you give it, you can’t help but feel like it’s not enough.");
	output("\n\nStill, you arduously make your way up, towards her tail. You know that she has a particularly erogenous spot on its underside, near the base, so you make sure to give it a long nibble before you journey over. It has the effect that you want: when your [pc.lipsChaste] find that spot, she flinches, moans, and dissolves into a furry puddle into the bed. The musk of her cunt, just a scant few inches away, gets all the headier, too.");
	output("\n\nThat’s enough distractions: you have an asscheek to kiss. You perform all the same tricks and map all the same routes as before, but in reverse: from top, to bottom, to top, to the side, and then back down. Your left hand finds her other cheek, still moist, and kneads into her flesh, your fingers attempting to sink into her glute, but everything is still just as solid as before.");
	output("\n\nPaige is limp on the bed, and every reactionary twitch and flinch is purely instinctual at this point. You really could spend the next few hours just kissing her butt, going from one cheek to the other and back again, with the occasional stop at her tail, but it’s almost a shame to admit that there’s still more of her to worship.");
	output("\n\nThen again, you doubt she’d mind all that much if you went in for the kill....");

	// end scene (scene: SSBWBu); increase Lust by 2; advance the clock by 1 minute
	pc.changeLust(2);
	processTime(1);
	values[0] = "SSBWBu";
	values[1] += 1;

	addButton(0, "Back", paigeWouldNormallyMindYouGoingBehindHerBack, values);
	addButton(1, "Legs", paigesLovelyLongLegsLickedLasciviously, values);
	addButton(2, "Pussy", paigesPussyPacifiesPuppyPamperingPCs, values, "Pussy", "Odds are pretty safe that, if you decide to worship this, it’d be the end of the road.");
}

// (scene: SSBWB)
public function paigeWouldNormallyMindYouGoingBehindHerBack(values:Array):void
{
	clearMenu();
	clearOutput();
	showPaige(true);

	// Continue here if coming from Butt
	if (values[0] == "SSBWBu")
	{
		output("It came as a shock to you when you first realized it, but there’s more to Paige than just a nice ass. It’s time you paid some attention to the rest of her.");
		output("\n\nYou head up, trailing more loving pecks as you go. You plant one at the height of the curve of her right butt cheek, then detour to her tail to give her sweetspot one last tease, before heading up to the small of her back. It’s one of the more sensual parts of the woman: not too ‘boring,’ if such a word can exist when it comes to making love, but not <i>too</i> erotic. The perfect spot to give your lover a tease before getting on to something more exotic. From there, you make your way up, along her spine.");
	}
	// Continue here if coming from Shoulders
	else if (values[0] == "SSBWS")
	{
		output("Your hands get the idea to start heading south before your head does. You’ve been so lost in kissing her strong shoulders and leaving little hickeys on her neck through her fur that you’ve nearly forgotten that there’s more of her to explore, if it weren’t for your fingers tickling at her thick laterals, where her breasts meet her ribs. This will require further research!");
		output("\n\nYour [pc.lipsChaste] trail down to her shoulder-blades, hidden beneath a tough layer of muscles, having been built strong and sturdy after years and years of regular routines. They aren’t very large");
		if (pc.physique() < 20) output(" – you wouldn’t be surprised if yours were bigger");
		output(", but even through the layer of fur covering them, you can make out just how they flex and relax against each other with how defined they are. From there, you make your way down, along her spine.");
	 }
	// Continue here if coming from Arms
	else
	{
		output("Gingerly – not because she’s frail or dainty, far from it, but because you’re trying to be sensual – you lift her right arm above yours by the wrist. You put your [pc.lipsChaste] into the palm of her hand and give it a kiss, then trail your way around to the back of her hand and start down her arm. With one hand, you keep it steady, while with the other, you map out the route your face is going to take – and you shamelessly get in a few gropes and feels along her powerful forearms and biceps along the way.");
		output("\n\nAs your fingers slither their way down her arm and to her shoulder, she rolls onto her side, reaching her arm higher and hurrying you down its length. You’ll all too eager to oblige, kissing your way down to her elbow, and then slowing your descent to give her bicep some special attention. It’s not especially huge – she isn’t about to win any strongwoman competitions or anything – but there’s next to no fat on it, and you can’t help but marvel at how statuesque it feels against you, even when it’s totally at rest.");
		output("\n\nYour kissing leads you to the backside of her shoulder, just a few inches up from her pit. Not wanting to get in your way, she rolls onto her front, letting her arm come to a rest beside her while you kiss your way down her back, tracing the lines where her muscles meet with your lips. When you find her spine, you make your way downward.");
	}

	// Merge
	output("\n\nOne hand travels to her hip, your thumb creasing along the swell of her ass and your fingers wrapping around to her lower stomach, while your other pets a long, gentle line from her other hip to her ribs, your fingers traveling through the fine fur of her body. Paige’s body is a finely-tuned instrument that you can’t help but want to play with every part of your own: your thumbs and fingers dig against the grain of her fur to find the warm skin and taut muscles underneath, while your every kiss down her back causes her to exhale lightly, and when you trace her spine with your [pc.tongue] all the way back up, she can’t help but inhale with you.");
	output("\n\nPaige’s tail lazily swishes between your bodies while you work");
	if (pc.biggestTitSize() > 2) output(", before getting caught in your cleavage. It thrashes a bit between your boobs, and neither of you are in any rush to dislodge it");
	output(". There’s a lot of area to cover, but your limits are as well-defined as her body: to far up, and you’ll probably get lost kissing her neck and at her collarbone, and too far down... well, too far down, and it’d be a different sort of foreplay altogether.");
	output("\n\nStill, even as your tongue lashes in small circles at different parts of her muscled back, as far down as the curve of her waist and as high up as between her shoulder-blades, you have to admit to yourself, neither of those options are unappealing, exactly. There’s always going to be more of her to spend time with, and if you really wanted to start kissing her back at any point, it wouldn’t be too long or too boring a detour. If you wanted to kiss that sensitive neck, or those pert-and-firm cheeks, now would be a good time to segue into them. Or, you could even choose a third option, if you wanted.");
 
	// end scene (scene: SSBWB); increase Lust by 2; advance the clock by 1 minute
	pc.changeLust(2);
	processTime(1);
	values[0] = "SSBWB";
	values[1] += 1;

	addButton(0, "Shoulders", paigeHasAHornyHeadWorshippingHerShoulders, values);
	addButton(1, "Butt", paigeUsesItForSittingButtYouUseItForFun, values);
	addButton(2, "Arms", paigeIsAtLargeArmedAndDelicious, values);
}

// (scene: SSBWS)
public function paigeHasAHornyHeadWorshippingHerShoulders(values:Array):void
{
	clearMenu();
	clearOutput();
	showPaige(true);

	// Continue here if coming from SSBW
	if (values[0] == "SSBW")
	{
		output("You could be crass and dive straight into her cleavage. They’re right there, after all. But, to you, there’s more to a woman’s body than just her boobs, especially if that body is as sculpted and well-cared-for as Paige’s.");
		output("\n\nYou hook your arms around her back, locking her to you, so you can kiss at her collarbone, your [pc.lips] searching northward for the crook of her neck. When you find it, she moans and leans away from you, exposing more neck for you to kiss.");
		output("\n\n<i>“A lady all but shoves her tits in your face, [pc.name], and your first instinct is to kiss her neck?”</i> Paige playfully chides while her hands find your head, keeping it to her.");
		output("\n\nBetween kisses, you tell her that you intend to save the best for last. She doesn’t immediately respond to the statement, her breath taken from her between the kisses. <i>“We both know that this is ending with your face between my legs,”</i> she laughs, <i>“but I like the way you think.”</i>");
		output("\n\nYour face travels along her collarbone, across the front of her shoulder, and then around to its rear. The air of the bedroom is cool compared to being pressed into the bed by your horny Ausar girlfriend, but it’s nothing you can’t deal with if it means you get started on treating Paige the way she deserves to be treated. Before long, your positions have switched, with her face-down into the bed, and you on top of her, kissing everywhere from her neck to her shoulder-blades.");
	}
	// Continue here if coming from Chest
	else if (values[0] == "SSBWC")
	{
		output("Your kisses lead you upward, towards Paige’s neck – you’re in the moment and you aren’t putting much thought into what you’re doing or where you’re going, and you’re focused almost exclusively on making love to your fit Ausar woman by showering her body in affection.");
		output("\n\nYour fingers crisscross into her fur on her back, digging down to their roots and tickling at the muscles hidden beneath the layer of fur. She arches her back and moans your name, pressing her firm C-cup breasts against you, but you’re more interested in giving her a hickey or two: your [pc.lips] find her neck, and you give it a kiss that lasted a bit longer and had a bit more enthusiasm behind it than you meant. Still, she’s strong, and if she finds up getting any hickeys, the fur will hide them just as well.");
		output("\n\nYour hands travel up, hooking underneath her armpits and gripping onto her shoulders from behind, while you kiss down her collarbone and kiss their front. Your adventures lead you to her upper arm, and you have to worm yourself out from underneath her to give them the attention you want to give them. Your hands have gotten busy, but you maintain the course, right up until she’s face-down underneath you, with you kissing at the back of her neck.");
	}
	// Continue here if coming from Back or Arms
	else
	{
		output("From here, there’s only one place that you can keep the journey moving, and that’s up to her strong, sturdy shoulders. In fairness, they aren’t the sexiest part of the body, but you are on tour around Paige’s form, and her shoulders are just as chiselled as the rest of her. You wouldn’t want to leave the job half-finished.");
		output("\n\nYour hands find their way to her shoulders first, giving them a squeeze to test their rigidity. Paige moans your name and relaxes them in your grip; given how limber her whole body is from all the yoga, it isn’t too surprising to find that they’re totally without any knots or tension, but you’re sure she’d appreciate a massage all the same later. Definitely something to keep on the to-do list with her later.");
	}

	// Merge
	output("\n\nPaige is totally relaxed, her head on the pillow while you busy yourself with worshipping the body she’s crafted for herself over the years. You kiss and nibble at her upper back, drawing your [pc.tongue] into the little divot of her collarbone and a little ways up her neck, before kissing your way back down to her starting point. You wouldn’t think that her yoga would involve a lot of shoulder exercises, but you’re evidently wrong: all that time holding her body in position has given even her shoulders the same definition as the rest of her.");
	output("\n\nShe shifts a bit, and from the general silence, you’d think she was about to fall asleep. Kissing her shoulders isn’t very sexually exciting, you’ll admit, but whenever you lean in and give her a long, lingering kiss on her neck, she takes a deep, audible sigh through her nose and leans her head away from you, exposing more neck for you to kiss.");
	output("\n\nAs much as you could spend the next hour finding and committing to memory every little ridge and contour in her shoulders, she’s still got a body for you to better acquaint yourself with. You can go in a handful of directions from here, each of them with their own merits; you just need to make up your mind.");

	// end scene (scene: SSBWS); increase Lust by 2; advance the clock by 1 minute
	pc.changeLust(2);
	processTime(1);
	values[0] = "SSBWS";
	values[1] += 1;

	addButton(0, "Arms", paigeIsAtLargeArmedAndDelicious, values);
	addButton(1, "Back", paigeWouldNormallyMindYouGoingBehindHerBack, values);
	addButton(2, "Chest", paigesChestHasTwoGreatTreasures, values);
}

// (scene: SSBWA)
public function paigeIsAtLargeArmedAndDelicious(values:Array):void
{
	clearMenu();
	clearOutput();
	showPaige(true);
 
	// Continue here if from Chest or Stomach
	if (values[0] == "SSBWC" || values[0] == "SSBWS")
	{
		output("The obvious choice from here would be to kiss your way down, towards something tastier and juicier, but that’s also the easy, uninitiated, and un-committed thing to do. You set out to worship Paige’s entire body, and that means taking the long way around to the real prize.");
		output("\n\nYou reach for Paige’s hand and interlock your fingers with hers. At first, it’s just a loving gesture, but soon, your [pc.lipsChaste] find their way to her wrist, then travel up her forearm, leaving a trail of pocked kisses every inch upward. Her muscles aren’t particularly large, but they poke through her fur with definition to spare; even in the dim light, you can make out just how they bulge against her fur.");
		output("\n\nYou shift yourself underneath Paige, trying to slip your [pc.legOrLegs] out from underneath her. She lifts herself up to let you out, and once you do, you swap places with her, putting her underneath you and against the bed. From here, you have unimpeded access to kiss her arm from wrist to shoulder: access you intend to take full advantage of.");
	}
	// Continue here if coming from Shoulders or Back
	else
	{
		output("The tempting choice is to go down, towards her lower back, and further, to something a little more erotic and sensual. She has an amazing ass, and she knows it, and she loves it every time you give it any attention – but there’s still more to her that you need to pay attention to first. All in good time, of course.");
		output("\n\nInstead, you divert your attention to her left shoulder, and then further down, along her bicep. Your hand travels along her forearm, your fingers sketching out every little contour hidden beneath the thin veneer of Ausar fur, until they find her own fingers. Yours interlock with hers, and you gingerly lift her arm into the air, giving you better access to the whole thing.");
	}

	// Merge
	output("\n\nBeing a yoga instructor, Paige’s arms are just as impressive as the rest of her body: firm, defined, <i>delicious,</i> but not intimidating. You glide your [pc.lipsChaste] down her arm, starting at her shoulder, and you can tell exactly where the thick of her bicep begins based on just how sturdy it is, even when she’s totally at rest like she is now. Feeling a bit daring and explorative, you nibble at her arm a little bit, testing just how taut she is. Your teeth barely make her flinch at all.");
	output("\n\nTaking it another step, you ask Paige to flex a bit for you. As languid as she is, you know she’s listening. And she complies: her fingers tighten in yours, and her arm flexes, thickening each one of her muscles, from shoulder to wrist. You can feel her arm harden against your lips, and, you can’t lie, it’s thrilling to feel that kind of power pushed against you.");
	output("\n\nYour journey to her other arm is slow and sensual, and you take the time to kiss at the back of her neck on the way. Once you get there, it’s more of the same: you start at her shoulder, down to her wrist, then back, and on the way back up, Paige, without any instruction, flexes again, giving you the same thrill as before.");
	output("\n\nStill, as strong as her arms are and as much as you could spend hours just fawning over them, there’s still much more of her body for you to visit. You could spend some more time at her back, kissing at her spine... or maybe at her shoulders and neck... or you could get back underneath her and start kissing down her chest, or at her chiselled six-pack abs. You have possibilities, and you’re just as excited to pick an option as she is.");

	// end scene (scene: SSBWA); increase Lust by 2; advance the clock by 1 minute
	pc.changeLust(2);
	processTime(1);
	values[0] = "SSBWA";
	values[1] += 1;

	addButton(0, "Chest", paigesChestHasTwoGreatTreasures, values);
	addButton(1, "Shoulders", paigeHasAHornyHeadWorshippingHerShoulders, values);
	addButton(2, "Stomach", paigesBellyIsEvenTastierThanTheFoodInIt, values);
	addButton(3, "Back", paigeWouldNormallyMindYouGoingBehindHerBack, values);
}

// (scene: SSBWP)
public function paigesPussyPacifiesPuppyPamperingPCs(values:Array):void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	processTime(15);

	// Continue here if coming from Groin
	if (values[0] == "SSBWG")
	{
		output("The heat and the smell of her pussy radiating against your cheeks is too enticing for you to ignore for much longer. You put in a token resistance, keeping up your charade and kissing at her pelvis and her thighs, but your thirst won’t be denied, and you’re sure that she’d enjoy the feel of you on her cunt as much as you’d enjoy the feel of her on your tongue.");
		output("\n\nYou keep up appearances for just another few kisses, starting on her right thigh, then deeper in, and then angling upward, making like you’re going to tease her with another pass over her clit – and then you lower and lunge, shoving your [pc.lips] against her pussy and spearing your [pc.tongue] into her honeypot.");
	}
	// Continue here if coming from Legs
	else if (values[0] == "SSBWL")
	{
		output("From your vantage point, you have a clear view of Paige and her entire body: from her shapely legs, including her thick thighs; to her tight stomach, crunched in pleasure; to her heaving breasts, her perky nipples poking clear through her fur; to her flushed, excited face, her eyes " + (paigeBlind() ? "focused in your general direction and her teeth nibbling into her lower lip in anticipation." : "on your curiously, wondering what your next action is going to be."));
		output("\n\nBut, more obvious than any of that, is her beet-red pussy, puffed and dripping, inviting anything from an explorative set of fingers, to a bold tongue, to a just-as-eager dick, or even a fellow pussy to share an intimate moment with. You can smell her musky, horny scent from here. You could resist it, if you really wanted to, but... you decide that you don’t want to.");
		output("\n\nYou kiss down her leg, as you had before, from her ankle to her knee, and then from her knee to her inner thigh. She clenches in excitement, and she sighs in delight and spreads her legs, like she knew the decision you had made, and that she wants to make things easier for you. Taking it as an invitation, and with one final lunge to close the distance, your tour of the museum that is Paige’s body formally ends, with your [pc.tongue] inside her cunt.");
	}
	// Continue here if coming from Butt
	else
	{
		output("It’s difficult to see Paige’s pussy from this angle – with her face-down in the bed, and with your face preoccupied with her ass – but you can <i>smell</i> it, plain as day. Hell, if she were any muskier, you could probably start tasting her already. That’s all the incentive you need.");
		output("\n\nYou wrap your hands around Paige’s thighs, already spread apart to give you room to kiss her ass, and you claw your fingers against her pelvis, gently scratching your fingers against her crotch fur. She winces in pleasure and bends her knees, lifting her rump into the air – she probably has an idea of what you’ve decided to want, and she’s all for giving it to you.");
		output("\n\nWith her legs spread and her knees bent, you have a perfect view of her dripping wet sex, even in the dim light of the bedroom. You don’t often eat her out from behind, but that’s about to change: you nestle your nose into the cleavage of her tight, yoga-tempered asscheeks, and you plant your [pc.lips] wetly against her cunt. At first, she only shivers, but that changes into a throaty, impassioned moan when you thrust your [pc.tongue] easily into her.");
	}

	// Merge
	if (values[1] < 6) output("\n\n<i>“Just couldn’t help yourself, could you?”</i> Paige laughs. Her hand finds your head and pushes you deeper into her cooch, thrusting your tongue as deep as it can into her. <i>“I guess I don’t blame you. Sometimes, I just want to suck a dick or eat a pussy, too.”</i> Her hips grind against your face, making sure that you’re good and nestled against her. <i>“Don’t even think about getting up until you’re finished.”</i>");
	else if (values[1] < 12) output("\n\n<i>“Mmm, that’s a good [pc.boyGirl], [pc.name],”</i> Paige sighs. She wiggles her hips against you, getting you nice and nestled in between her thighs, so that you can reach as deep inside her as you can. <i>“I’ve never had anyone show me that kind of attention before. I know that I’m sexy, but it’s nice to really</i> feel <i>it now and again.”</i> Her hand comes to rest on your head, and you’re suddenly pushed harsher against her. <i>“Now, let’s cap it all off with a real bang, what do you say?”</i>");
	else if (values[1] < 18) output("\n\n<i>“Ooof, I was wondering when you’d cut the shit and eat me, [pc.name],”</i> Paige says gleefully, now that you’re finally doing what she had been hoping you’d do from the start. Her thighs clench around your face, and her hand pushes you deeper into her, making sure that you’re as good and deep as you can be. Her fingers dig into your scalp possessively. <i>“Now that you’ve started, don’t even</i> think <i>about stopping until I let you. You’ve spent all this time to get me horny, and now I’m going to</i> fuck your face.<i>”</i>");
	else output("\n\n<i>“Finally!”</i> Paige exclaims, before clenching her thighs around your head tightly. You’re locked into place, your cheeks trapped between her muscular thighs. Her hand comes down onto your scalp, and her fingers possessively – even a little manically – dig into your head. <i>“Gods, it’s about time you put that tongue to some real use! Take a deep breath, because I am going to</i> fuck your face, <i>[pc.name]!”</i>");
	if (values[1] < 12) output("\n\nYou lavish her pussy with as much attention and adoration as you’ve given the rest of her body up until this point, focused onto a single point on her body. Your [pc.tongue] spears into her, tasting her and collecting her dew on your buds, while your [pc.lips] flex and kiss at her cunt, massaging the puff of her vulva with your mouth. You do everything you can do pleasure her with only your mouth: using anything more would be an admission of defeat, that you’re too spent to continue worshipping her.");
	else output("\n\nTrue to her word, you don’t really have a say in how you pleasure her: with her hand on your head and your cheeks squeezed by her thighs, you’re little more than a toy with a warm, wet, thrashing tongue for her to fuck herself with. She’s so wet that if she were to fuck your face a little too hard, her juices might come out of your nose. Still, you find some kind of tranquility with where you are – this is how Paige wants you to pleasure her, and after you’ve spent the last eternity worshipping her body, who are you to disagree?");
	output("\n\n<i>“Mmm, fuck,”</i> she moans, her hips rocking in shallow circles in time with your tongue in her box. <i>“" + (values[1] < 12 ? "I wonder how long you’d keep going before I went nuts and shoved your face between my legs. Just how much work can that tongue of yours do, [pc.name]?" : "You’re going to be tasting me on your tongue for</i> hours, <i>[pc.name]. All that kissing, all that licking... and not to mention the fucking</i> hurricane <i>I’m about to cum in that mouth of yours.") + "”</i> Her legs shiver at the thought of it, and she clenches on your tongue – she’s already quite close. Not too surprising, given what you’ve been doing for the past little while.");
	if (values[1] < 12) output("\n\nDespite you being locked to her, the rest of your time with her is on the smooth, sensual side. Her fingers play with your scalp, and her body flinches in pleasure whenever you thrust your tongue into her pot, but she’s on the passive side of your lovemaking and lets you go at your own pace. So, you worship her pussy like you had the rest of her: with kisses, licks, and gentle grazes of your lips against hers, all for the sake of bringing her off.");
	else output("\n\nThe rest of your time with her is rough. Her strong grip on your scalp has your nose pressed against her " + (values[0] == "SSBWBu" ? "asshole" : "clit") + " while she vigorously humps your face, getting as much pleasure from your thrashing tongue as she can. You feel like a passenger in your own body, and your body is just a tool to get Paige off. And that’s just how you want it: if this is how she wants her body worshipped, then this is how to want to worship her. She deserves nothing less.");
	output("\n\nLike you had guessed, it doesn’t take much more for Paige to reach her climax: all that time spent paying some very special attentions to her body had gotten her");
	if (values[1] >= 12) output(" extremely");
	output(" randy and ready, and she was ready to blow. Your [pc.tongue] in her pussy was the lit match to her fuse, and as soon as they met, it was only a matter of time.");
	output("\n\nHer fingers clench " + (pc.hasHair() ? "somewhat painfully in your [pc.hair], getting it tangled between her digits" : "on your head, scratching her nails across your [pc.skinFurScales], which is a little painful") + ", but what really has your attention is her body and its reaction to her orgasm. Her thighs flex and harden around your head, sealing you in a cocoon of fur and feminine muscle;");
	if (values[0] == "SSBWBu") output(" her ass flexes and lifts up against her tail, trapping your nose into their crease and pinching it as tightly as her thighs against your cheeks; her back tenses and every muscle on it pops out, turning her smooth fur into a rigid, mountainous region full of thick, powerful bumps and crevasses; and her shoulders flex, trying to keep the hand on your head steady and pressed firmly into her ass. It’s a lot more effort than it looks.");
	else output(" her abs clench and pop, rolling from her stomach to her ribs; and her chest heaves in effort, her nipples popping out and pointing to the ceiling.");
	output("\n\nNo movie is complete without a dinner, though: the show is accompanied by her cunt clenching on your invading [pc.tongue], keeping it from pulling away and squashing it with her vaginal muscles, coating it from tip to root in her taste. All that pussy juice has nowhere to go but straight into your mouth and down your chin. And it’s your job, as her willing devotee, to ensure that you don’t leave a drop behind.");

	// increase Lust by 50
	pc.changeLust(35+pc.libido()/3);

	addButton(0, "Next", paigeSuccessfullyWorshipped, values);
}

public function paigeSuccessfullyWorshipped(values:Array):void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	processTime(10 + values[1]/2);

	output("Her orgasm lasts " + (values[1] < 12 ? "some time" : "for longer than you had expected") + ", and by the time she’s done, your head aches and your tongue is crushed and exhausted. When her body finally relaxes, the comparatively cool air of the room caresses your hot cheeks, and when she finally pulls away, you take your first deep breath of air that doesn’t immediately taste or smell like Paige");
	if (values[1] < 12) output("... it almost makes you want to jump right back in and start again");
	output(".\n\nPaige");
	if (values[0] == "SSBWBu") output(" flips herself over, one leg above your head, then");
	output(" leans forward to grab you by the armpits. With the strength you can come to expect from a body as toned as hers, and as energized as she is after such a good fucking, she easily pulls you up and across her body to meet you face-to-face.");
	output("\n\nWithout a word, she kisses you deeply, twisting her head and sliding her long, fat Ausar tongue into your mouth. You know for a fact that she can taste every little bit of herself on your tongue and across your teeth, but, from the approving moan coming from her throat, she might just like it more than you expected. The kiss lasts for such a long time that, when she finally pulls away, you both need to take a deep breath again.");
	output("\n\n<i>“Fuck me, but that was incredible, [pc.name],”</i> she congratulates, her nose against yours. <i>“You have no idea how often I just want somebody to give me a good, fat grope or something, but you went the extra mile.”</i> She quivers underneath you and laughs. <i>“It’s nice finally getting some damn recognition for all my effort, you know? Mmm, by Gods, I wouldn’t mind coming home to</i> that <i>every night.”</i>");
	output("\n\nShe shifts her legs underneath you, her knees bumping into your groin, and for the first time, you’re made aware of how");
	if (pc.hasGenitals()) output(pc.cockAndVagina(" ragingly erect you are, your pre-cum dripping from your [pc.cockHead]", " dripping, <i>soaking</i> wet you are; your [pc.femCum] drips from your [pc.vagina] in little rivulets down your [pc.thigh]", ". Not only that, but you’re also") + ", soaking into the bedsheets.");
	else output(" aroused you are.");
	output("\n\n<i>“I do believe I owe you a favor,”</i> Paige says, brushing her legs against your crotch. <i>“You know I won’t say no if you want some action for yourself. It’d only be fair.”</i>");
	output("\n\nYou tell her that you know, and that you may take her up on her offer sooner rather than later – but you’ve spent a lot of time worshipping her. As deific as her body is, you have other responsibilities to tend to–");
	output("\n\n<i>“And what if I, your hot yoga girlfriend with a deity’s body, told you that you didn’t?”</i> she says, her hot breath washing down your neck. Her hands grip you on either side of your face, where her thighs just were, and you think that she might just force you back down onto her and start your duties from the beginning.");
	output("\n\nJust as you start fantasizing (and maybe even hoping that she would), she laughs and lets you go. <i>“Get on out of here before I let my imagination get the better of us,”</i> she laughs, pushing you towards the edge of the bed. <i>“When you decide you need to blow a load or two</i> right this second, <i>you come find me. I don’t like owing favors. I’ll have you cumming buckets, mark my words!”</i>");
	output("\n\nKnowing her, you’d believe her.");
 
	IncrementFlag("SEXED_PAIGE");

	// end scene (scene: SSBWP); either return to the Ship menu or place the PC one square outside of Paige’s unit
	addButton(0, "Next", mainGameMenu);
}