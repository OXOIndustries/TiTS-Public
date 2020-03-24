// Savins Lurelings
// https://docs.google.com/document/d/1tyOj-RbpsF7gNND4h3TAKp_DcAsqj7WcetJUx1RWmK4/edit
// coded by Stygs 03/2019

/*
 * essyra has 4 possible genital settings, allowing for easy checks:
 * pure female
 * dog cock with balls (marion.hasBalls())
 * one tentacle cock with a sheath (marion.hasSheath() - dog cock has sheath too, so check for balls first)
 * multiple tentacles without sheath (marion.hasCocks())


 * MET_LURELING			0/undefined = met the Marion/Essyra first time, 1 = repat, hasnt seen a Lureling, 2 = repeat, has seen a Lureling
 * MARIONS_FUCKED		number of times fucked a marion
 * LURELINGS_FOUGHT		number of times fought a lureling
*/

public function showMarion(nude:Boolean = false):void
{
	showName("\n"+ marionName().toUpperCase());
	if(nude)
	{
		var cockStr:String = "";
		if(!marion.hasCock()) {}
		//else if(marion.hasCock(GLOBAL.TYPE_CANINE)) cockStr = "_DOG";
		//else if(marion.hasCock(GLOBAL.TYPE_TENTACLE)) cockStr = "_TENT";
		else if(marion.hasBalls()) cockStr = "_DOG";
		else if(marion.hasSheath()) cockStr = "_TENT";
		else cockStr = "_TENTS";
		showBust("MARION" + cockStr + "_NUDE");
	}
	else showBust("MARION");
}

public function showLureling(nude:Boolean = false):void
{
	showName("\nLURELING");
	/*if(nude) showBust("LURELING_NUDE");
	else showBust("LURELING");*/
	showBust("LURELING");
}

public function marionName():String
{
	if (flags["MET_LURELING"] == 2) return "marion";
	return "essyra";
}

public function marionSetUp():void
{
	marion.tailCount = 3 + rand(5);
	marion.removeCocks();
	marion.removeBalls();
	// 50% chance of no cock, 1/3 chance for each cocktype afterwards
	// if PC is neuter, give the marion a cock no matter the chances
	if (rand(2) == 0 && pc.hasGenitals()) flags["MARION_SETUP"] = 0;
	else flags["MARION_SETUP"] = rand(3) + 1;
	switch (flags["MARION_SETUP"])
	{
		case 0:
			break;
		case 1:
			marion.createCock(8);
			//marion.cocks[0].cLengthRaw = 8;
			marion.shiftCock(0,GLOBAL.TYPE_CANINE);
			marion.cocks[0].cockColor = "black";
			marion.balls = 2;
			break;
		case 2:
			marion.createCock(12);
			//marion.cocks[0].cLengthRaw = 8;
			marion.shiftCock(0,GLOBAL.TYPE_TENTACLE);
			marion.cocks[0].cockColor = "blue";
			marion.cocks[0].addFlag(GLOBAL.FLAG_SHEATHED);
			break;
		case 3:
			var i:int = 0;
			while (i < marion.tailCount)
			{
				marion.createCock(12);
				marion.shiftCock(i,GLOBAL.TYPE_TENTACLE);
				marion.cocks[i].cockColor = "blue";
				marion.cocks[i].knotMultiplier = 1.1;
				marion.cocks[i].addFlag(GLOBAL.FLAG_KNOTTED);
				i++;
			}
			break;
	}
}

public function marionEncounter():void
{
	clearOutput();
	processTime(5);
	clearMenu();
	author("Savin");
	showMarion();

	marionSetUp();
	
	// Repeat, hasnt meet a Lureling
	if (flags["MET_LURELING"] == 1) {
		output("As you’re meandering through the snow and ice, you see a figure approaching you. She’s a tall and thickly built humanoid, wrapped in heavy furs that almost - but not completely - conceal a head of pink hair and a myriad of fluffy tails swishing in her wake. Another Essyra come to play, perhaps?");

		output("\n\nIt seems like it, going by the little smile she favors you as she gets almost to arm’s reach. She’s got no weapons and makes no hostile gesture, just a playful little smile and a crook of her finger as she turns towards a nearby gash in the snowbanks. It seems she wants you to follow her, no doubt to share some warmth beside the fire...");

		addButton(0, "Follow Her", goToMarionsDen, 0, "Yes", "The strange pink-haired essyra seems intent on taking you somewhere. Let’s see where this goes...");
		addButton(1, "Don’t", definitelyDontGoWithMarion, 1, "Don’t", "No thanks.");
	}
	// Repeat, has meet a Lureling
	else if (flags["MET_LURELING"] == 2) {
		output("As you’re meandering through the snow and ice, you see a figure approaching you. She’s a tall and thickly built humanoid, wrapped in heavy furs that almost - but not completely - conceal a head of pink hair and a myriad of fluffy tails swishing in her wake. Another Essyra... and very likely a lureling’s marion at that.");

		output("\n\nYou find your hand settling on your [pc.weapon] as she draws closer, and indeed, she stops some thirty feet ahead of you and puts her hands up in a gesture of peace. Though as wordless as the last of her kin, she uses her mittened hands to make clear gestures at you: <i>“Don’t hurt me. You can follow me if you like.”</i>");

		output("\n\nSeems like she, too, intends to honeypot you. But if you can stomach knowing what lurks under the ice... would that be so bad?");

		addButton(0, "Follow Her", goToMarionsDen, 0, "Yes", "The strange pink-haired essyra seems intent on taking you somewhere. Let’s see where this goes...");
		addButton(1, "Don’t", definitelyDontGoWithMarion, 2, "Don’t", "No thanks.");
	}
	//	First Time
	else {
		output("You trudge through the perpetual ice and cold of the Uvetan wasteland");
		if (pc.willTakeColdDamage()) output(", holding your arms around yourself and shivering like mad, hoping beyond hope to find shelter before you collapse from the cold");
		else {
			output(", rubbing your hands together and shivering from time to time")
			if (pc.hasHeatBelt()) output(", despite the warm embrace of heat surrounding you, shielding you from the frigid atmosphere");
			else output(" as you try to brave the elements on this inhospitable world");
		}
		output(". The snow-paths around you seem vast and endless, stretching off in featureless expanses of white as far as the eye can see. White, save for a pillar of obsidian darkness moving on the horizon in your direction.");

		output("\n\nYou squint, trying to see a bit clearer through the biting wind. As your path and the figure’s draw ever close together, the dark shape resolves into that of a humanoid, wrapped in heavy furs that billow in the wind. One of the natives, maybe? ");
		if (pc.willTakeColdDamage()) {
			output("Thank God! Maybe they can help you find shelter");
			if(pc.lust() >= 80) output(" ... or some other way to warm up...");
			else output(".");
		}
		else output("Hopefully not hostile, though you have to admit: getting the blood pumping like in a good fight would really help against the pervasive chill. Not to mention what comes after....");

		output("\n\nEither way, the two of you are headed right for each other. You raise a wary hand to the cloaked figure as it draws near and to your relief, you see it wave back. No more than twenty paces away now, it pulls down its fur-lined hood to reveal a head of brilliant bright-pink hair flooding down to its owner’s shoulders in silken curls, framing a pale, feminine face. A pair of perky, fox-like ears - much too small to be those of an ausar, and filled with a lush blue-white fluff - poke out from her scalp, twitching in your direction. The woman’s - and that’s most certainly what she is - lips are full and dark blue, forming an enchanting smile. ");
		if (CodexManager.entryUnlocked("Essyras"))	output("You recognize her for one of the fox-like essyra, a thankfully friendly race!");
		else {
			output("Your Codex chirps, just barely audible over the howl of the wind, that this is an essyra, one of the native species here on Uveto. One that is, generally, friendly to off-worlders like you.");
			CodexManager.unlockEntry("Essyras");
			output("\n\n<b>(New Codex entry unlocked: Essyras.)</b>");
		}

		if (pc.willTakeColdDamage()) {
			output("\n\nYou give a sigh of relief as you see the friendly smile on the girl’s face. She instantly seems to recognize that you’re freezing where you stand, slowly turning into [pc.aRace] icicle. Her smile, the warmest thing out here, wavers with concern, and a cream-pale hand darts out from under her hide cloak to grasp yours, locking her fingers around your hand and giving you an urgent tug towards the south. In your condition, you don’t even think about refusing the silent woman’s saving graces. Any promise of salvation from this lethal cold is good enough, especially when she pulls you in against herself, wrapping part of her heavy cloak around you to share in the warmth of it - and her body.");

			addButton(0, "Next", insideMarionsDen);
		}
		else {
			output("\n\nA moment passes in silence, her warm smile and bright eyes locked on you. You can see the hint of a glistening pink tail swishing eagerly under her coat, and heavily-clad arms moving at her side. The moment goes past, and a hint of the tension of meeting a stranger in the wilds passes: neither of you seem eager to attack the other, yet the girl isn’t speaking. You suppose you need to take the initiative, and so you introduce yourself.");

			output("\n\nThe essyra smiles a little broader when you speak, but she makes no motion that she understood you. You blink in confusion, not really used to that happening, and tap your Codex through your pack. It beeps at you, letting you know it’s still awake and functioning as your personal translator. Huh. Approaching the problem from a different angle, you point your hands at yourself and say, <i>“[pc.name].”</i>");

			output("\n\nThe essyra giggles, tossing her pink hair to one side and regarding you with a blue-lipped smile. You’re not sure if you’re making progress - you get no word of reply - but she does extend her arms to you, grabbing your hands in hers. Her hands are bare, with cream-pale flesh ending in tiny, sharp little claws. They rake gently against your "+ (pc.isNude() ? "[pc.skinFurScales]" : "[pc.clothes]") +", and when you fail to flinch away, the woman gives you a gentle pull towards the south. Does she want you to come with her somewhere?");

			output("\n\nWhen you don’t instantly follow, trying to puzzle out what she’s up to, the woman smiles again and steps closer - right into your personal space, pressing the curvaceous front of her furry outfit against your [pc.chest], gripping your hands firmly. She glances "+ (pc.tallness > 80 ? "up" : "down") +" into your eyes and chews on her lower lip, almost like she’s nervous about something. Another gentle tug cements her desires into your mind, and this time she puts her whole body into it, leaning back with an inviting motion of her head that indicates a half-hidden path through the snow.");

			output("\n\nIt looks like this strange, silent essyra is trying to take you somewhere. Do you let her?");

			addButton(0, "Yes", goToMarionsDen, 0, "Yes", "The strange pink-haired essyra seems intent on taking you somewhere. Let’s see where this goes...");
			addButton(1, "No", dontGoWithMarion, undefined, "No", "You’re not going anywhere with a stranger that won’t even give you her name!");
		}
	}
}

public function dontGoWithMarion():void
{
	clearOutput();
	author("Savin");
	showMarion();

	output("You resist the invitation, tempting though it might be, and gently brush her hands off you. The girl pouts, slowly withdrawing her arms into the front of her coat.");

	output("\n\nSlowly, you start to turn around to depart - only to feel her clawed hands grab at your shoulders. For a second, you panic, thinking you’re under attack. The fear passes a moment later when you feel her fur-clad body press into your back, feeling the perky mounds of a pair of breasts under the coat rubbing against you. She makes a sad, wordless whining sound, clutching desperately at you. You manage to squirm around in her awkward embrace that you face her, getting a good look at her big, puppy-dog eyes in the process. The essyra gives you a gentle, almost pleading tug in the direction of... whatever it is she wants.");

	output("\n\nShe looks pretty desperate for you to come with her now, whining and tugging at you like she is. Maybe you <i>should</i> go with her?");

	processTime(5);

	clearMenu();
	addButton(0, "Yes", goToMarionsDen, 0, "Yes", "The strange pink-haired essyra seems intent on taking you somewhere. Let’s see where this goes...");
	addButton(1, "Definitely Not!", definitelyDontGoWithMarion, 0, "Definitely Not!", "Nope. Not falling for it.");
}

public function definitelyDontGoWithMarion(variant:int = 0):void
{
	clearOutput();
	author("Savin");
	showMarion();

	if (variant == 2) output("You step backwards, away from the marionette. She only sighs and turns away, walking back into the snow. Seems that this one at least knows how to take <i>“No”</i> for an answer...");
	else {
		if (variant == 0) {
			output("You wrest yourself out of the essyra’s grasp and ");
			if (pc.isNice()) output("gently");
			else if (pc.isMischievous()) output("mockingly");
			else output("forcefully");
			output(" tell her that you’re not going with her. Not that she understands you, anyway.");

			output("\n\nBy the time you manage to turn away and put some distance between you, you’re half sure you can see tears welling up in her eyes when you look over your shoulder. What the hell? You sigh and turn away, starting to resume your trudge through the snowy wastes.");
		}
		else output("You shake your head and tell her no, you aren’t going to follow her. You earn a pout and huff from the foxy native, but she doesn’t move to stop you from walking away.");

		output("\n\nAfter about fifty paces, you feel something heavy and cold hit you in the back, exploding in a hail of white dust. You stumble, more from surprise than anything, and watch as a second snowball goes careening over your head! Spinning around, you see the same, persistent essyra standing atop a nearby snowbank with another snowball in her hands, giggling as she hucks it at you.");
	}

	processTime(5);

	clearMenu();
	addButton(0, "Fight Back!", resistMarion, undefined, "Fight Back!", "Well, you can’t let that go unanswered. Hit her back with a snowball!");
	addButton(1, "Go Away!", scareAwayMarion, 0, "Go Away!", "No, seriously, go away!");
}

public function resistMarion():void
{
	clearOutput();
	author("Savin");
	showMarion();

	output("<i>“Hey!”</i> you shout, ducking a third snowball that comes hurling at you. <i>“I said no!”</i>");

	output("\n\nShe giggles and leans over, grabbing more snow. Dammit, that’s it! You do the same, grabbing a fistful of snow and letting fly right at her big, dumb, pink head. The girl squeals when the snowball impacts her, turning into an uproarious laugh as she throws another that hits you right in the [pc.chest]. A running start and a hard overhead throw like a grenade gives her another taste of her own medicine, beaning her in the leg, apparently hard enough to make her tumble over. She yelps, planting her ass in the snow as the bank she’s standing on rumbles behind her, and starts to shift.");

	output("\n\nOh, shit. You have just enough time to turn around and take a desperate step before the essyra’s ass-plant sends the side of the hill tumbling down in a great wave of crashing snow. You scream in surprise as the miniature avalanche slams into your back, barreling you over. Darkness takes hold for a moment, until you manage to flail your limbs enough to fight your way to the surface - and right into another snowball. The essyra, now all of two feet away and sitting dazed beside you, laughs reaches for more snow.");

	output("\n\nYou reach up and grab her arm, pulling her down. She just laughs and rolls with it, happily letting you restrain her as you pull yourself out of the snow. The moment you’re out, though, you feel a pull on you in turn, sending you right back into the ground beside the essyra, who’s got her arms around your waist and her legs straddling yours.");

	output("\n\nShe laughs and smiles, leaning in so close that you can feel her hot, sweet breath on your [pc.face]. Before you can react, she leans down and plants a lightning-fast kiss on your [pc.lips], sending an electric current of surprise and stimulation through your snow-logged body. But she doesn’t press the issue further, at least not now. She gives you a much more sensual, inviting smile, and nods towards the south.");

	output("\n\nSuddenly, you think you realize what she’s wanted all along...");

	processTime(10);

	clearMenu();
	addButton(0, "Go for it!", goToMarionsDen, 1, "Go for it!", "Alright, alright. She’s made her point. Go along with the pretty pink fox-girl.");
	addButton(1, "Seriously, No!", scareAwayMarion, 1, "Seriously, No!", "You don’t want what the pink-haired slut’s offering.");
}

public function scareAwayMarion(variant:int = 0):void
{
	clearOutput();
	author("Savin");
	showMarion();

	if (variant == 0) {
		if (pc.isAss() && pc.hasRangedWeapon()) {
			output("You take out your [pc.rangedWeapon] and pop a shot off at her feet, making the snowbank under her explode in a white flurry of disturbed ice. She yelps and goes sliding down out of sight as the false hill collapses.");

			output("\n\n<i>“Fuck off!”</i> you yell after her, [pc.holstering] your weapon. God damn barbarians.");
		}
		else output("God dammit! You scream some profanities at her before you take off as fast as you can, hoping she’ll take the hint. A few silent minutes later, and you’re fairly convinced she has. Shaking your head, you look to resume your travel.");
	}
	else output("You give her one last, fierce scowl and shake your head. The essyra’s chest gives a sad little heave, and she stands up, releasing her hold on you. She pouts, but this time doesn’t try and stop you from leaving.");

	processTime(5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function goToMarionsDen(variant:int = 0):void
{
	clearOutput();
	author("Savin");
	showMarion();
	
	if (variant == 0) output("Curiosity takes the better of you, and you decide to see what exactly this silent pink vixen wants to show you. You give her a nod and let her take your hand, drawing you southwards into the winding white wasteland of the Uvetan wilderness. You wonder where she’s taking you...");
	else output("<i>“Alright, alright,”</i> you laugh, grabbing the girl’s hips and giving her a wink. Her big, blue smile returns with gusto, followed through by a delighted squeal. She slips down and gives you a big, warm hug, enveloping you in heavy, soft furs. You laugh as the two of you get up, her hand locked firmly around your own, and she pulls you towards the snow-wracked wastes of the south. You wonder where she’s taking you...");
	
	processTime(5)

	clearMenu();
	addButton(0, "Next", insideMarionsDen);
}

public function insideMarionsDen():void
{
	clearOutput();
	author("Savin");
	showMarion();

	output("The essyra leads you by the hand through the whipping winds and vast snowdrifts. She stays close to you, letting you feel the heat and softness of her heavy cloak. Her tail whips against your [pc.leg] with every step, a show of obvious and unabashed excitement as she leads you to ");
	if (flags["MET_LURELING"] == undefined || pc.willTakeColdDamage()) output("your fate");
	else output("her home");
	output(". A few short minutes pass without a word said between you. Your pink-maned companion seems content, as ever, to remain wordless - if she even can speak. Still, with her hand on yours and her warm body pressed constantly against your own there’s little need for words, and you follow her soothing presence through the bleak Uvetan chill.");

	output("\n\nHer meandering path soon leads you to a towering hill of snow and ice, flanked by the pillars of obsidian-like growths that form from the planet’s frigid surface. A dark, slender opening sits at the base of the snow-mound, obviously dug out by living hands - although it’s incredibly smooth, almost a perfect half-circle stretching up from the flat ice below it. Your essyra guide gives you a smile over her shoulder and slinks down onto her hands and knees, crawling through the opening and into the dark, out of sight. You shiver at the sudden return of the ceaseless cold, now deprived of her warm presence, and move quickly to follow her");
	if (pc.isTaur() || pc.tallness >= 96) {
		output("- though your struggle somewhat due to your " );
		if (pc.tallness >= 96) {
			output("size");
			if (pc.isTaur()) output(" and ");
		}
		if (pc.isTaur()) output("shape");
		output(" to fit through the passage")
	}
	output(".");

	output("\n\nWhen you finally emerge from the tunnel’s end, you’re greeted by a welcome sight indeed: a hemispherical chamber has been dug out of the hillside, with smooth packed-in walls and a floor of perfect ice, covered with plush fur rugs that surround a circle of obsidian stones and wood. Apparently the ring is a fire pit - one that your companion is already lighting, allowing much-needed warmth to spread through the chamber. A chill still hangs in the air here, but it’s nothing like the seeping, gut-clenching freeze of the outside world. What’s left inside is a calm, almost relaxing chill - just enough to make you thankful for the heat of the fire"+ (pc.hasHeatBelt() ? " and your heat-belt" : "") +". You approach the fire, extending your hands to warm yourself up. The furry hide of some creature shifts beneath your [pc.feet], drawing your attention to the strangely homey accoutrements around you: pillows, fur blankets, and rugs adorn the cave. This must be the ");
	if (flags["MET_LURELING"] == 2) output("product of the lureling below you’s efforts, meant to give you and its marion a nice and comfortable place to carry out your business. How thoughtful.");
	else output("essyra girl’s home.");

	output("\n\nYour thoughts draw your gaze back to your hostess, standing across the fire with her back to you, staring down into the hazy, dark ice of the cave’s floor. She gives you a glance over her shoulder and a blue-lipped smile, and lets the heavy cloak slip down. The figure that had been hidden beneath it is svelte and athletic, honed to physical perfection after a lifetime of surviving in the harshest wilderness. Her pale skin hints at tense, strong muscles hidden under the colorful woolen garments still clinging to her body. And, you note, several more tails are on display now: "+ marion.tailCount +" pink, fluffy fox-tails wrap around her waist and groin, keeping her nice and warm.");

	output("\n\nThe "+ marionName() +" turns on a heel to face you, taking a long-legged stride closer until your bodies are separated only by the ring of the fire pit. She’s still smiling, her bright eyes gleaming in the firelight, as she slowly walks around. One of her arms reaches out, gently caressing your waist until she’s pressed fully against you, rubbing her body against yours. Mute though she may be her desires are clear and alluring, offering you the warmth of her flesh. ");

	output("\n\n");
	if (flags["MET_LURELING"] == 2) output("You’re not sure how you feel about this, knowing the girl’s only a puppet for another being... a creature lurking below the ice, ready to use her as a conduit for its own pleasure. And yours, too, yes... but still, you’re not far from just fucking a sea monster. Then again, this pink-haired beauty’s got a body bred for pleasure, and is more than eager to put it to full use for you. Can you go through with it?");
	else output("The essyra’s pale hand wanders across your body, drawing inexorably towards your groin. Her long, slender fingers brush across your crotch as she grinds herself further against you, letting you feel her husky, hot breath on your [pc.skinFurScales]. The invitation is obvious: to come share in the heat of her body, and the comfort of her bed. The mute fox-girl’s had this in mind from the start, and her amorous advances are only becoming more overt, ready for you to take her.");

	if (flags["MET_LURELING"] == undefined) flags["MET_LURELING"] = 1;

	processTime(60);

	clearMenu();
	addButton(0, "Nope!", refuseMarionsAdvances, undefined, "Nope!", "This isn’t what you bargained for!");
	if (pc.hasGenitals() || marion.hasCock()) addButton(1, "Fuck Her", marionsDenSexMenu, undefined, "Fuck Her", "Well, the vixen’s made her intention clear. "+ (silly ? "Take her in a manly fashion!" : "Take her up on her wordless offer and enjoy the native pleasures of this otherwise hostile world..."));
	else addDisabledButton(1, "Fuck Her", "Fuck Her", "You will need to be female or have a cock that fits in order to do this!");
}

public function refuseMarionsAdvances():void
{
	clearOutput();
	author("Savin");
	showMarion();

	output("You awkwardly brush the essyra’s hands aside, trying to extricate yourself from the uncomfortable predicament you’ve bungled into. The mute girl must think you’re playing hard to get, and she lunges forward with a hail of awkward kisses and gropes, grabbing at you amid lusty moans and heavy breaths. Her hands grab at your groin and [pc.chest], pulling at your [pc.gear] until you manage to break away again, this time putting a few feet of distance between you before the dazed "+ marionName() +" recovers. She pouts at you, consternated but still wagging her tails - she’s not taking a hint.");

	output("\n\nThe pink-haired vixen starts striding to you, pulling off her colorful shirt and revealing a pair of perky tits with stiff, blue nipples contrasting against her creamy skin. She smiles, advancing with sultry confidence, reaching out to you again with a lusty look in her eyes. What do you do?");

	processTime(5);

	clearMenu();
	addButton(0, "Flee!", fleeMarionsDen, undefined, "Flee!", "Just run for it! Run away... from the unarmed, overly friendly fox-girl.");
	addButton(1, "Smack", smackTheMarion, undefined, "Smack", (silly ? "Smack a bitch up." : "She’s got you cornered and certainly doesn’t seem to care about your protests. Give her a smack to try and make her back off!") + (flags["MET_LURELING"] == 2 ? " Though you’re probably going to have to deal with her lureling master..." : ""));
}

public function fleeMarionsDen():void
{
	clearOutput();
	author("Savin");
	showMarion();

	output("Fuck it, you’re out! You scramble back, making for the opening as fast as you can. The essyra makes a loud, pitiful whine of bewilderment and reaches you, grabbing at your "+ (pc.isNude() ? "pack" : "armor") +", trying to pull you back into her embrace. She lunges, and you dodge, tumbling back onto ice. She recovers on all fours, tails wiggling in the air behind her pert behind as she advances.");

	output("\n\nYou manage to crawl back, squirming into the entrance tunnel and clambering through as quick as you can. Thankfully, the girl doesn’t follow you out, and you’re able to make good your escape. With a sigh of relief, you turn back to continue your journey through the waste - and far away from the incorrigible vixen.");
	if (pc.willTakeColdDamage()) output(" Though now that you’re outside, you realize that you’re right back to freezing yourself to death...");
	
	processTime(5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function smackTheMarion():void
{
	clearOutput();
	author("Savin");
	showMarion();

	output("No way you’re getting raped by some random woman in a snowy backwater. As she lunges in for another round of kisses and gropes, you get a hand free and rear back, delivering a sharp slap across her face. She yelps, more from surprise than pain, and stumbles back cupping her reddened cheek. She looks up at you with big, startled blue eyes. Her lips quiver, and her arms curl defensively around herself. She moves back, and for a moment, you think you’ve made your point.");

	output("\n\nAnd then the ice beneath you starts to quake.");

	output("\n\nYour eyes go wide as you look down between your [pc.feet]. Something big and dark is sloshing around just beneath the ice, which is shaking and cracking and starting to bulge. "+ (flags["MET_LURELING"] != 2 ? "Looks like you’ve lured out the lureling! " : "") +"You leap back, just barely rolling out of the way in time as the ice shatters beneath where you’d stood, throwing shards of jagged ice and geysers of frigid water in every direction, forcing you to shield your eyes.");

	output("\n\nWhen you recover, there’s a tremendous hole in the ice where the firepit had been, sloshing with water and jagged chunks of debris. The essyra has scrambled away to the other side of the cavern, well away from you, and leaving the creature that’s burrowed up from the ocean below to stand between you: ");
	if (flags["MET_LURELING"] == 2) output("another lureling! It’s huge, slavering maw flaps around in a circle of razor-sharp teeth beneath a pair of dark eyes full of hatred and malice. Looks like you’ve pissed daddy off!");
	else {
		output("a huge, pale green creature easily eight feet tall, sitting on tiny webbed legs - it looks like a cross between a frog and some ungodly scion of an angler fish. Where its mouth should be, though, you see a circular, slavering maw filled with ring after ring of spear-like teeth. Mother of god... ");

		output("\n\nYour Codex beeps urgently: <i>“Lureling detected. This native species is a psionically active sapient, known for aggressively attacking colonists that attack their mind-controlled puppets. Extreme caution is advised.”</i> ");

		output("\n\n<i>“Thanks for the early warning,”</i> you growl, drawing your [pc.weapon].");
		output("\n\n<b>(New Codex entry unlocked: Lureling.)</b>");

		flags["MET_LURELING"] = 2;
		CodexManager.unlockEntry("Lurelings");
	}

	output("\n\nThe lureling rears back on its tiny legs, issuing a terrifying banshee’s shriek before it lunges for you!");

	processTime(10);
	IncrementFlag("LURELINGS_FOUGHT");

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new Lureling());
	CombatManager.victoryScene(lurelingFightVictory);
	CombatManager.lossScene(lurelingFightDefeat);
	CombatManager.displayLocation("LURELING");

	clearMenu();
	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function marionsDenSexMenu():void
{
	clearOutput();
	author("Savin");
	showMarion();

	output("The silent "+ marionName() +" gasps happily when your arms wrap around her slender waist, pulling her close and tearing at her parka. Naked, warm flesh presses against your "+ (pc.isNude() ? "own bare [pc.skinFurScales], gently guiding you down onto the rugs and blankets of her makeshift bed" : "your "+ (pc.isChestCovered() ? "[pc.upperGarment]" : "[pc.lowerGarment]") +", her hands wandering across your clothing with gentle, insistent tugs. You allow the eager woman to undress you, pushing you gently down onto the rugs and blankets of her makeshift bed") +". Her long, pale legs come to straddle your [pc.hips] and the last of her clothes fall to the wayside, revealing a pair of perky breasts tipped with ice blue nipples, the same color as her lips, which her hands guide yours to; you squeeze the two soft mounds, circling and flicking her cyan teats with your thumbs.");

	output("\n\nThe last piece of the essyra’s outfit to go are the tight cloth panties hugging her hips, slipped off and tossed aside to ");
	if (marion.hasBalls()) output("reveal a slender black shaft hanging between her legs, knotted at the base and sitting over a pair of fleshy balls and a blue-lipped slit. Freed from its confines, the dark, canid prick bounces on your [pc.belly], stiff and begging for your touch.");
	else if (marion.hasSheath()) output("reveal a wriggling blue tendril with a tapered red crown sitting above a cyan pussy. Freed from its confines, the alien-like prick slithers across your [pc.belly], desperately begging for your touch.");
	else if (marion.hasCocks()) output("reveal several wriggling blue tendrils sitting around a cyan pussy; each tentacle is tipped with a tapered red tip, and several flaccid knots at the base. The colorful tendrils caress your [pc.belly], spreading out to frame the essyra’s sex invitingly.");
	else output("let you see the blue lips of her pussy, glistening in the firelight. She gives you a demure smile, running a finger through her slickened slit and spreading herself invitingly.");

	output("\n\nYour glimpse of the fox-girl’s alien sex lasts only a moment before she grabs one of the heavy blankets from nearby and throws it over her shoulders, lying down atop you to cover both your bodies in the soothing, shared warmth. ");
	if (marion.hasCock()) output("You can feel her [marion.cocksDescriptLight] trapped between your [pc.belly] and hers, throbbing with anticipation. ");
	output("The essyra flashes you a smile, transitioning to trailing kisses along your [pc.chest] and nibbling on a [pc.nipple]. Under the blanket, you find your hands sliding down her supple form, grabbing her ass in hands and squeezing until she moans for you.");

	processTime(10);

	clearMenu();
	// only allow FuckVag for PCs with a) dicks and NO hardlight or b) cunts AND hardlight. Scene doesnt make sense otherwise
	if (pc.hasCock() && pc.cockThatFits(marion.vaginalCapacity()) >= 0) addButton(0, "Fuck Vag", penisRouter,[marionsDenSexFuckMarion,marion.vaginalCapacity(0),false,0], "Fuck Vag", "Stick your cock in the essyra’s pretty blue pussy and let her ride you.");
	else if (pc.hasVagina() && pc.hasHardLightEquipped()) addButton(0, "Fuck Vag", marionsDenSexFuckMarion, -1, "Fuck Vag", "Stick your hardlight strap-on in the essyra’s pretty blue pussy and let her ride you.");
	else addDisabledButton(0, "Fuck Vag", "Fuck Vag", "You need either a penis that fits or a vagina and a hardlight dildo for this.");
	// if PC has either a pussy & no cock or a cock thats to large
	if (pc.isFemale() || (pc.hasCock() && pc.cockThatFits(marion.vaginalCapacity()) == -1)) addButton(1, "Masturbation", marionsDenSexMutualMasturbation, undefined, "Mutual Masturbation", !pc.hasCock() ? "Well, you’re a little bit cockless, but company always makes a good time better." : "There’s no way you’re fitting inside her, but sharing is caring.");
	else addDisabledButton(1, "Masturbation", "Mutual Masturbation", "You need to be a female OR have an overly large dick for this.");
	// if essray has at least 1 cock, else hide the button
	if (marion.hasCock()) addButton(2, "Get Fucked", vaginaRouter, [marionsDenSexGetFucked, marion.cockVolume(0), 1, 0], "Get Fucked", "Let the "+ marionName() +" use her [marion.multiCocks] on your [pc.vagOrAss].");
}

public function marionsDenSexFuckMarion(x:int):void
{
	clearOutput();
	author("Savin");
	showMarion(true);

	if (x >= 0) {
		output("Your "+ pc.cockDescript(x) +" is tucked snugly between the essyra’s thick thighs, engulfed in her warm embrace. Feeling your member harden, the sultry fox-girl shifts her legs back and forth, massaging your shaft between them.");

		output("\n\n<i>“That’s good,”</i> you murmur, tightening your grip on her ass. You’re not sure if she understands what you’re saying, really, but the message gets through all the same: she smiles and starts rocking her whole body under the blankets, jacking you off");
		if (marion.hasCock()) output(" and thrusting her own [marion.cocksNoun] against your [pc.belly]");
		output(".");
	}
	else output("Between gropes and squeezes to the essyra’s plump behind, you manage to sneak a hand away to your panties, pulling them back on and flicking on the hardlight emitter. The alien girl gasps when the luminescent rod springs to life, but she clearly recognizes the shape - and the function. Her hand wraps around your glistening shaft, experimentally stroking it from base to crown. She gives a delighted little squeal when you moan at her touch, proving your artifical member is just as sensitive as a real dick.");

	output("\n\nStill stroking you off, the essyra rises up on her knees, wrapping the blankets around herself and planting her hands firmly on your [pc.chest]. Looking down at you with a lusty lick of her lips, the mute beauty shifts her hips and grasps the crown of your cock with the bright lips of her sex");
	if (marion.hasBalls()) output(". Her own black prick jumps and beads with watery white when your crown parts her pussylips, rubbing gingerly against the back of her balls as you slide in");
	else if (marion.hasSheath()) output(". Her blue tentacle-tool jumps and squirms when your crown parts her pussylips, rubbing uncontrollably against your [pc.belly] as you slide in");
	else if (marion.hasCocks()) output(", using her tentacle-like members to hold your own in place, guiding it into her");
	output(". She lowers herself in one swift stroke, taking you ");
	if (pc.hasKnot(x)) output("to the "+ pc.knotDescript(x));
	else if (x >= 0 && pc.cocks[x].cLength() >= 28) output("so deep that you can see your cockhead straining her belly");
	else {
		output("as deep as you can go");
		if (x >= 0) output(", even if your "+ pc.cockDescript(x) +" could use a little more length");
	}
	output(". Her breath comes in shuddering clouds of mist that form a fog around her head until all you can clearly make out is her azure eyes and the wolfish grin on her slender lips.");

	output("\n\nOnce she’s settled in your lap, the icy vixen contracts her muscles, rhythmically squeezing your "+ pc.cockOrStrapon(x) +" while she gets herself comfortable. It isn’t long, though, before she’s shaking her hips and wiggling her myriad of tails for you, panting with pleasure. It’s an odd sensation to make love with someone who doesn’t speak; sound still comes out of her of course, but still. The deep, shudder-laden moan of pleasure that comes out of her when you roll your hips would usually be accompanied by some visceral declaration of pleasure. Instead you just have to infer it from the way her [marion.eyes] drink you in with open adoration at the way she’s stirred up.");

	output("\n\n");
	if (pc.hasKnot(x)) {
		output("It’s when she tries to rise back up off the turgid girth of your "+ pc.cockDescript(x) +"’s knotted bulb that her adoration melts into momentary confusion. Not to be deterred, you reach out for ");
		if (marion.hasCock()) output((marion.hasCocks() ? "one of her eagerly-waiting cocks" : "her eagerly-waiting cock") +" and wrap your [pc.hand] around it, thumbing the underside");
		else output("the foxy alien’s hardening bitch-button, pressing gently on it before working it with your thumb");
		output(". The essyra only seems to grow desperate, trying to draw her [marion.cuntNoun] from your engorged base. You hurry your ministrations up until the fox is audibly squealing on you until finally your work has her wet enough to slip free, eyes rolling back for a brief moment. Now when she starts to bounce in your lap she’s able to land on your knot without taking it.");
	}
	else {
		output("Although the saucy alien fox is enjoying you with each bounce, you’re sure there’s more that could be done for her. You reach out for ");
		if (marion.hasCock()) output((marion.hasCocks() ? "one of her eagerly-waiting cocks" : "her eagerly-waiting cock") +" and wrap your [pc.hand] around it, thumbing the underside");
		else output("the foxy alien’s hardening bitch-button, pressing gently on it before working it with your thumb");
		output(". The essyra whimpers and squeals in pleasure, bouncing in your lap until she’s almost too wet to cling to your "+ pc.cockOrStrapon(x,0) +".");
	}

	output("\n\nThe vulpine alien speeds up her riding, chewing on her lip and working her hips until you can actually hear the cheeks of her ass clap against your [pc.skinFurScalesColor] crotch. Her ");
	if (marion.hasCock()) output("milky pre floods from her "+ (marion.hasCocks() ? "cockheads" : "cockhead") +" and her ");
	output("twat drenches your [pc.tummy]. Every time your "+ pc.cockOrStrapon(x,0) +" sinks deeper into her welcoming embrace it wrings and squeezes at you. It’s not until her whole body starts spasming with each thrust that you can actually <i>feel</i> the essyra enter into a series of mini-orgasms that desperately milk you.");

	output("\n\nAt first it feels like the horny bubblegum fox is slamming down on you hard enough to rock your entire body, but soon enough you realize it’s the floor itself trembling. If your lover cares about this seismic activity it’s hard to say, if only that her wordless whimpers of delight become cries of orgasmic pleasure. ");
	if (flags["MET_LURELING"] == 2) output("Somewhere through the fugue of your own bacchanal joy (and the redirection of precious fluids to your "+ (x >= 0 ? "[pc.cocks]" : "[pc.multiCunts]") +") you figure out that the trembling ice floor is probably the result of this marion’s master starting to cum as well.");
	else output("There’s a dose of terror flushed in your system at the thought of this buxom beauty’s cave collapsing atop the both of you, but thankfully the ceiling remains entirely where it belongs.");

	output("\n\nYou squirm a little beneath the cumming fox before lifting her cloak and rolling over, putting her between the floor and yourself. There’s no word of complaint from her (rather obviously), and she wiggles her tails beneath you and moans as the sudden shift in position has you ");
	if (x >= 0 && pc.cocks[x].cLength() >= 28) output("working the head of your "+ pc.cockDescript(x) +" within her womb and straining the walls of her cunt to their limits");
	else if (x >= 0 && pc.cocks[x].cLength() >= 6) output("momentarily kissing her depths before grinding against sensitive walls");
	else ("stirring the entrance to her pussy up");
	output(". There’s an open adoration to her soft, wanton expression and you dip down to ");
	if (pc.hasBeak() || pc.hasMuzzle()) output("press the front of your [pc.mouthChaste] against her lips and sink your [pc.tongue] into her her mouth.");
	else output("kiss her, sinking your [pc.tongue] into her mouth.");

	output("\n\nHer moans vibrate into your mouth and once more you set your [pc.hips] to the task of pounding this mute slut to her next orgasm... to be fair, it might be her sixth or so by now judging by the look on her face. When you come away from your kiss she drools openly into her own quaking cleavage, hands stroking her ");
	if (marion.hasCock()) output("cum-coated stomach and [marion.cocksLight]");
	else output("soft stomach, egging you silently on as she drinks in the sensations of your lovemaking");
	output(". "+ (pc.hasKnot(x) ? "You have to be careful not to smash your knot back into her cunt however; no amount of wetness will stop you from getting trapped on her this time. " : "") +"The essyra seems lost for how to act, even as the cave is filled with the sound of its trembling floor, crackling fire, and the two of your bodies thrusting and shifting in unison.");

	output("\n\nSticky fingers rise up to your head, but you’re too far gone to mind the mess when her nails drag gently through your [pc.hair] and over your [pc.ears]"+ (pc.hasHorns() ? ", pausing briefly to tug on one of your [pc.horns]" : "") +". Whether this woman is close or not doesn’t matter; she’s had hers already plenty of times"+ (marion.hasCock() ? "any more and her stomach will be so slick with cum you might slide right off of her" : "") +". At last though the need to cum has already made itself known in your own hind-brain.");

	output("\n\n");
	if (x >= 0 && pc.hasBalls(x)) output("Your balls feel thick and heavy, following the movement of your hips with audible slaps against the fox girl’s bouncing booty. Her tails wiggle beneath you, stroking them with fluffy tenderness entirely at odds with the sweating fuck-hungry body that otherwise bounces against your prick. It’s all the approval you need, and you practically drop your body onto hers, delighting in the "+ (pc.hasBreasts() ? "squish of her [marion.tits] against your own" : "way her soft tits cushion your chest") +". Her mouth opens wide and she makes whimpering barks that you recognize as a request to kiss her. Once more your mouth lays into hers a moment before she wraps her legs around you until her feet cross around your [pc.ass]. Your [pc.balls] slap home one last time, and the floodgates break.");
	else if (x >= 0) output("There’s an almost painful tightening in your backdoor button in time with every thrust, swelling with "+ (silly ? "a need to seed (™)" : "need") +". Her tails wiggle beneath you and stroke the insides of your thighs with a fluffy tenderness entirely at odds with the sweating fuck-hungry body that otherwise bounces against your prick. Her wordless urgings are all you need and you practically drop your body onto hers, delighting in the "+ (pc.hasBreasts() ? "squish of her tits against your own" : "way her soft tits cushion your chest") +". Her mouth opens wide and she makes whimpering barks that you recognize as a request to kiss her. Once more your mouth lays into hers a moment before she wraps her legs around you until her feet cross around your [pc.ass]. There’s one last tightening in time with the peristaltic squeezing of her cunt before the floodgates break.");
	else output("The way your [pc.hardlightCockFull] is squeezed in the grip of the essyra’s perfect twat is enough to have your [pc.chest] heaving, and your legs to shake as your need to orgasm starts to insist itself upon you. It becomes harder to keep up a steady pace, and you come entirely to a halt when you’re pulled down onto her, delighting in the "+ (pc.hasBreasts() ? "squish of her tits against your own" : "way her soft tits cushion your chest") +". Her mouth opens wide and she makes whimpering barks that you recognize as a request to kiss her. Once more your mouth lays into hers a moment before she wraps her legs around you until her feet cross around your [pc.ass]. It’s a tougher position to fuck her from, but you fight your way through the task; failing to cum now would be such "+ (pc.libido() > 50 ? "sweet" : "agonizing") +" torture. The term ‘floodgates’ feels rather literal judging by how juicy your [pc.vaginasLight] "+ (pc.hasVaginas() ? "feel" : "feels") +".");

	output("\n\nHer silent mouth forms the word “Come, please!” before it’s contorted into a silent wave of pleasure, getting off on your own timely completion. You ")
	if (x >= 0) output("blast thick hot ropes of [pc.cumFlavor] [pc.cumType] into her twat.")
	else output("reach a shuddering finish, squirting girlcum from around your now-drenched panties until your [pc.legs] glisten.");

	output("\n\nThe "+ marionName() +" gasps around your lips, spasming loosely as her own orgasm comes to an end"+ (marion.hasCock() ? ", painting her abdomen (and yours) in watery aftershocks of her last load" : "") +". Her [marion.cuntNoun] sprays across the floor and the bases of her fluffy tails, and her toes curl up while she chews on her lip. At the same time the trembling of the cavern seems to come to a close "+ (flags["MET_LURELING"] == 2 ? "; it would seem the Lureling is quite done after your efforts" : "... was <i>she</i> the one causing it to happen? That’s a stunning coincidence otherwise") +".");

	output("\n\n");
	var cumQ:Number = pc.cumQ();
	if (x >= 0 && pc.hasKnot(x)) {
		output("You try to roll off of your lover, but you find yourself stuck fast. Apparently on your last thrust you managed to bury the thick hot mass of your "+ pc.knotDescript(x) +" back in her already-tightening cunt. It looks like you’re going to be stuck here for a little while")
		if (cumQ >= 2000) output(", pressed up against her cum-inflated tummy.");
		else if (cumQ >= 500) output(" atop her squirming cum-stuffed body.");
		else output(" hugged by her yet-unfilled-twat.");
	}
	else if (x >= 0) {
		output("When you roll off of her,");
		if (cumQ >= 2000) output(" the seemingly endless quantities of your cum pool from her well-used snatch.");
		else if (cumQ >= 500) output(" the tightness of her pussy seems to restore itself, trapping at least the majority of your orgasm.");
		output(" Essyra’s tight slit clenches and doesn’t let a single drop of your "+ (cumQ < 500 ? "admittedly limited" : "") +" load out.");
	}
	else output("It’s a titanic effort just to reach down and switch off your hardlight as the two of you try to catch your respective breaths. The floor beneath you both is a sticky-sweet girlcummy mess, and the Essyra shivers a little as she comes down from her nearly mind-breaking series of orgasms.");

	output("\n\nAfter a few moments the two of you manage to crawl closer to the fire before pulling her soft (admittedly slightly-stained now) cloak up closely. The silent girl begins to hum and trill sweetly into one of your [pc.ears], and it combines with your bone-weariness "+ (silly ? "(buh-dum-tish) " : "") +"to draw you into sleep.");

//Next: Pass three hours, heal 10hp

	output("\n\nTime passes in a drowsy blur, with soft hands ");
	if (pc.hasFur()) output("petting your [pc.skinFurScales]");
	else if (pc.hasScales()) output("teasing out the contours of your [pc.skinFurScales]");
	else output("playing gently over the soft skin of your back");
	output(". It’s only a short nap, but when you finally wake up it feels like you’ve managed to indulge in a full night’s sleep. The pink-furred fox is gently petting you on the head and smiling softly.");

	output("\n\nSadly as much as her company was incredible"+ (pc.willTakeColdDamage() ? " (and a literal life-saver)" : "") +", you’ll have to brave the cold once again.");

	marionSexOutro(false);

//	pc.applyPussyDrenched();
	marion.loadInCunt(pc);
}

public function marionsDenSexMutualMasturbation():void
{
	clearOutput();
	author("Savin");
	showMarion(true);

	var cIdx:int = pc.cockThatFits(marion.vaginalCapacity());
	
	if (cIdx >= 0) output("It looks like if you tried to cram your mammoth [pc.cocktype " + cIdx + "] into this bubblegum cutie you’d probably break her.");
	else output("Sadly without a prick to fuck her with you’re a bit out of luck.");
	output(" Still, it wouldn’t do to leave this lady wanting. Considering the heat coursing through your loins a simple “oh well then” isn’t going to cut it. Luckily the "+ marionName() +" seems to have a pretty good idea of what to do next.");

	output("\n\nShe guides you back towards the fire and nudges you towards a comfortable set of furs before the loss of her body-heat can afford time to give you chill, and you settle your "+ (pc.isTaur() ? "tauric body" : "[pc.butt]") +" down before watching eagerly as the foxy minx makes her move. Her tails shift like a dancer’s veil, revealing and obscuring her nude form in equal measure as she settles to her knees. Her ass looks more heart-shaped than ever when she rolls onto all-fours and presents herself... for a moment you’re worried that she expects you to "+ (cIdx >= 0 ? "break her with your ogre-length member" : "fuck her without a cock") +", but she drops down onto her cushiony tits and sinks her face into a fluffy animal rug before sneaking a dainty finger up to her slit. Catching on, you position yourself a little better so that she can see you past her shoulder as you begin to please yourself in tandem.");

	output("\n\nHer moans and coos are sweet little sounds, and she wiggles her bum from side-to-side while questing digits hunt out the cute little nub of her clit. Increasing slickness wets the insides of soft thighs and a gentle aroma wafts in your direction each time her tails swish enticingly. The pounding of your chest heralds a fresh twitch from your "+ (cIdx >= 0 ? pc.cockDescript(cIdx) : "[pc.pussy]") +" until "+ (cIdx >= 0 ? "pre" : "juices") +" drip to the soft fur beneath you. She purrs at the sight and spreads her pussy wide with two fingers while her middle diddles her [marion.clit] teasingly, showing off her cunt’s winking depths like a lurid come-hither kiss straight to the womb.");

	output("\n\nChewing on your lip, your own explorations intensify as her show grows ever more erotic. Your [pc.hands] ");
	if (cIdx >= 0) output("trawl the length of your [pc.cockComplex " + cIdx + "], fingering out every bump and vein it can find"+ (pc.hasSheath() ? " and stretching at its sheath" : ""));
	else output("grind their way down your body and towards your [pc.pussy], allowing you to sink a few questing digits into the warm waiting folds");
	output(". The Essyra purrs in approval as you join in the show, reaching around with her other hand and helping to spread her cute blue pussy wide to add an extra finger to her waiting cunt. The sounds of her self-pleasuring are loud in the cave compared to the sound of the crackling fire pit and your own pounding heartbeat.");

	output("\n\nHer whimpers join into the exhalations of pleasure and she starts to bounce on her knees, adding the subtle quiver of her ass-cheeks to the masturbatory show. Considering she seems a lot further along than you, your own pace picks up until "+ (cIdx >= 0 ? "your [pc.hands] are glazed with [pc.cumFlavor] pre" : "the rug beneath your [pc.pussy] is drenched with [pc.girlCumFlavor] juices") +". It’s a little strange that she remains effectively wordless, but the erotic noises leaking from her with every twitch of the knuckles buried into her cunt is more than enough to keep you going. "+ (flags["MET_LURELING"] == 2 ? "No doubt the beast that lurks below the ice is getting off plenty... an even stranger thought, now that you give it a moment. " : "" ) +"The scent draws you closer, and you find your body shifting towards her with a few errant hip-jerks, until she’s nearly close enough to touch.");

	output("\n\nThere’s something to be said for being at the very limits of contact while the both of you masturbate your way to orgasmic frenzy, especially in a secluded cave with nothing but the sounds of squishy genitalia being dug into. ");
	if (marion.hasCock()) output("The Essyra transitions from simply plumbing her cunt however, taking the fingers previously spreading her [marion.pussy] in order to jerk "+ (marion.hasCocks() ? "a" : "her") +" cock from base-to-tip until "+ (marion.hasCocks() ? "they shine" : "it shines") +". ");
	output("Your own ardor is so utterly stoked that every "+ (cIdx >= 0 ? "squeeze and stroke of your [pc.cockSimple " + cIdx + "]" : "plumbing of your fingers into your [pc.cuntSimple]") +" sends heat rocketing into the very core of your body.");

	output("\n\nAbruptly her erotic display pauses, and she looks over her hips towards you with glistening eyes full of need. It takes a few heartbeats to realize that she’s asking for permission.");

	output("\n\n");
	if (pc.isTaur()) {
		output("It’s a rather awkward effort to heft your entire tauric body towards her, and you have to turn around and watch over your shoulder to catch the rest of the show as you urge her onwards further. The cute squishy bubblegum fox chews on her lip as you "+ (cIdx >= 0 ?"slap your [pc.cock " + cIdx + "] backwards towards her so that rich pre flies towards her and leaves connecting strands of near-orgasmic heat" : "spread your own [pc.pussy] to its limits until she can practically see into your womb") +". Your bodies are so close that just the heat of her flushed sex radiates against your");
		if (pc.hasVagina()) output(" own");
		else if (pc.hasBalls()) output(" [pc.ballsNoun]")
		else output(" taint");
		output(".");
	}
	else {
		output("She tries not to giggle as you scooch your body closer to hers, although neither of you halt in your masturbatory efforts. Her pussy practically sloshes every time she pumps herself to the knuckles in sensitive cuntflesh, and her thumb never stops its efforts in torturously grinding over the rock-hardness of her clit. By the time you’re close enough to nearly be touching, her heart-shaped ass bounces above your crotch precariously, dripping juices onto your");
		if (pc.hasVagina()) output(" [pc.pussies]");
		if (pc.isHerm()) output(" and");
		if (pc.hasCock()) output(" [pc.cocks]");
		output(".");
	}

	output("\n\nYou work the Essyra’s fountainous juices into your tender flesh while your muscles clamp "+ (cIdx >= 0 ? "with tightening intensity onto your prostate" : "around your fingers") +" and drive you to the ragged borders of orgasm. For the first time however she lets out a proper cry of ecstasy. So much so that her voice is like a sweet peal of pleasure that reverberates from every icy wall of the cave. That final ringing peal of finishing is enough to send you over the edge — or it nearly is, at least. You don’t actually reach completion until you can feel the nearly scalding-hot juices of the bubblegum foxgirl’s orgasm splashing onto your [pc.genitals].");

	output("\n\nWhen you finally cum yourself, it’s accompanied by your own "+ (cIdx >= 0 ? "deep guttural groan" : "high-pitched whimper") +". Her sticky-sweet girlcum makes for the perfect lube to "+ (cIdx >= 0 ? "jack" : "jill") +" yourself to completion, and you actually manage to spray those beautiful ass-cheeks with "+ (cIdx >= 0 ? "[pc.cum]" : "[pc.girlcum]") +". Her breath catches in her throat, and her tails fwip around wildly as she soaks in the sensation of you coating her rear. After a few more nerveless twitches she drops onto her side, eyes wide and mouth hanging loosely open. Your own arm is cramping a little at the effort, and you let it drop to your side as you flop over yourself.");

	output("\n\nThe Essyra pushes herself along the floor until her body is pressing up against your own "+ (pc.isTaur() ? "— admittedly broad and tauric — yet " : "") +"warm flesh. While she gulps down breaths, soaking in the scent of your mixed orgasms until sleep tries to claim the both of you.");

	marionSexOutro();
}

public function marionsDenSexGetFucked(x:int):void
{
	clearOutput();
	author("Savin");
	showMarion(true);

	output("Considering this bubblegum-fox beauty is rather avidly waving around her [marion.multiCocks] it would be rude not to "+ (pc.isTaur() ? "cast your tauric mass to the ground" : "drop to your hands and knees") +" and polish "+ (marion.hasCocks() ? "those [marion.cocksNoun]" : "that [marion.cockNoun]") +" before introducing her to your "+ pc.vagOrAss(x) +". She wordlessly tracks the direction your eyes drift towards before bouncing on the spot, setting her quaking tits to jiggling ferociously in time with the bobbing of her [marion.cockColor] "+ (marion.hasCocks() ? "dongs." : "dong."));

	output("\n\nIt would seem she’s down with the prospect too.");

	output("\n\nRunning your [pc.fingers] "+ (pc.isBald() ? "across your bald head" : "through your [pc.hair]") +", you settle yourself down before her, kneeling in the lush carpet while the essyra has herself a luxurious stretch. Her "+ (marion.hasCocks() ? "pricks twitch" : "prick twitches") +" in time with a couple of happy wordless squeaks as she works some unseen tension out of her squishable frame. Apparently that was all the preparation she needs, as she places her hands on your head "+ (pc.hasNonScritchEars() ? "," : "and fondly scratches your [pc.ears] before") +" drawing your [pc.lips] in range of her "+ (marion.hasCocks() ? "members." : "member."));

	output("\n\nYou give "+ (marion.hasCocks() ? "one of her tips" : "her tip") +" a testing lick, sampling the pre that beads from its cumslit. The moment you’re graced with a mixture of sweet and salty it seems to send a sympathetic heat coursing into your loins. The essyra coos, grinding the teased head against your lips in a silent request for entry. You open wide and unfurl your "+ (pc.hasLongTongue() ? "seemingly-endless " : "") +"tongue, providing a landing strip that she takes immediate advantage of. ");
	if (marion.hasBalls()) output(" Her knotty prick all but slams its way into your mouth in two short humps, pressing into your throat while her meaty nuts bounces off of your chin. Smiling against her cock you reach up and give her balls a nice slow rub, feeling them churn in approval.");
	else if (marion.hasSheath()) output("It’s a girthy beast of a tentacle, and as she pushes it past the barrier of your [pc.lips] you realize that exterior is actually a sheathe. You swallow on her loudly and reach up, helping to roll back the flexible, sensitive flesh until the near-foot pointed tenta-prick is fully unveiled.");
	else output("She’s got so many more cocks than you’re prepared to swallow at once, so you quickly spit into your palms to give a few more of those members somewhere to go. She squeals happily at your sexually-inclusive antics and two of them immediately slip into your grasp, even as she devotes the remainder to your gullet.");

	output("\n\nBy the time her ");
	if (marion.hasBalls()) output("knot is");
	else if (marion.hasSheath()) output("knots are");
	else output("crotch is");
	output(" bumping into your nose the pink fox-slut’s practically drooling... and to be fair her "+ (marion.hasCocks() ? "cocks *are*" : "cock *is*") +" drooling. She withdraws her "+ (marion.hasCocks() ? "lengths" : "length") +" with a shudder that tracks from top-to-tails, revealing plenty of spit-slick sex organ ready for action. Honestly it’s rather surprising; she looks like she’s about ready to facefuck you to orgasm, but instead she waits patiently. It takes a couple of heartbeats to realize she’s far more interested in penetrating "+ (marion.hasCocks() ? "different aspects" : "a different aspect") +" of your biology. It’s kind of a shame considering she’s actually delicious and you’ve not gotten a chance to show off your [pc.tongue] to its best.");

	output("\n\nStill, it wouldn’t do to let her down. Just a brief interlude of cock-sucking has you feeling "+ (pc.hasVagina() ? "moist as all fucking hell" : "hellishly hot under the collar") +" at odds with icy cave’s walls. You’re urged on with happy little throat-noises from the essyra when you turn yourself around and "+ (pc.isTaur() ? "sink your upper body in the fur to display the full extent of your [pc.lowerBody]." : "prop yourself up with your [pc.hands] to wiggle your [pc.butt] at her."));

	output("\n\n");
	if (pc.isTaur()) output("When the bubblegum fox leaps onto your flanks and starts trying to line herself up with your "+ (x >= 0 ? pc.vaginaDescript(x) : "[pc.anus]") +" you’re suddenly inclined to think of some kind of animalistic mounting frenzy. She may have to stretch quite hard to reach the rest of your body but she manages to get a decent grip on you, and the heat of her flesh sinks into you even as more heat radiates off of her "+ (marion.hasCocks() ? "many tentacular cocks" : "glans") +" until your "+ (x >= 0 ? "pussy lips are feeling flushed and dewy." : "asshole is winking invitingly."));
	else output("Her weight drops onto you with surprising speed now that she’s properly ready, and her hips keep waving as she attempts to get herself lined up with your "+ (x >= 0 ? pc.vaginaDescript(x) : "[pc.anus]") +". The waving of her tails is almost canid, and the weight of them is throwing her hips a little off target even as they occasionally curl up and tickle your thighs. Heat radiates from her [marion.cocks] in a way that has your "+ (x >= 0 ? "pussy moistening ever-further and parting" : "asshole winking invitingly") +" at "+ (marion.hasCocks() ? "their" : "its") +" closeness.");

	output("\n\nYou grow a little impatient yourself, throwing your hips back towards her while the "+ marionName() +"’s squishy tummy rubs against you. ");
	if (silly) output("For a brief moment you wish you were on your back. That soft body would pool into your "+ (pc.tone >= 75 ? "rock-hard " : "") +"abdomen like pancake batter into a fuckable waffle-iron. ");
	output("Her wordless noises of pleasure turn to a small cry of delight as your "+ (x >= 0 ? "sultry twat" : "pliable asshole") +" envelopes "+ (marion.hasCocks() ? "one of her members" : "her member") +", until you’re able to clench your way around a good five or six inches of delectable fuck-material. ");
	if (marion.hasBalls()) output("Pushing any further onto the luscious fox’s prick would have you knotted though, and it’s far too early to come to a halt now.");
	else if (marion.hasSheath()) output("Of course, when it comes to tentacles, there’s plenty more love for her to give...");
	else output("A tentacle can go plenty deeper than that despite you applying pressure... and considering there’s extra weight pushing to join its sister in your "+ (x >= 0 ? "sopping pussy" : "stretching ring") +".");

	output("\n\nHer voice comes out in a little squeaky gasp as her [marion.hips] rock gently back and you relax your grip. Fingers fondly stroke your back and she coo’s at you disarmingly... right up until she slams her hips home hard enough to fill you to the brim. The sensitive walls of your "+ (x >= 0 ? "womanhood" : "rectum") +" stretch around the ");
	if (marion.hasBalls()) output("girl’s prick, which now threatens to batter down your entrance and lock its knotty mass to your ass");
	else if (marion.hasSheath()) output("questing fuck-tentacle as it folds back on itself and hunts for oft-untouched flesh");
	else output("now-helixed-together tentacles drilling your "+ (x >= 0 ? "box" : "backdoor"));
	output(". Her weight pushes you down until your moans are muffled into the furs beneath, and if you expected the effort to slow her down then you’re delightfully surprised by the sound of her broad hips clapping against your ass in a chorus of flesh-on-[pc.skinFurScalesNounSimple].");

	output("\n\nYour own exultations only encourage her to ravage you further, and her wordless whines turn to gasps into your ear that would put a pornstar to shame. Her nails drag at your underside and spank your flank between endless kisses against "+ (pc.isTaur() ? "whatever flesh she can reach past your tauric body" : "your neck") +". She’s too soft and squishy for her hands to do you any harm, but your "+ (pc.hasScales() ? "scales" : "skin") +" still "+ (pc.hasScales() ? "feel" : "feels") +" tingly and shocked. You can actually feel the waves of her own pleasure washing over your mind every time your muscles hunker down hard enough to slow down her jackhammering pace, and the floor of the cave seems to tremble with the aftershock of it.");

	output("\n\nHer pending orgasm approaches quickly... or you assume she’s about to cum. The bubblegum fox smashes her hips into you and grips the cheeks of your [pc.ass] for dear life");
	if (marion.hasBalls()) output(", smashing her knot home in a single thrust before rapidly humping away at you until it feels like she’s about to break you with its girth");
	else if (marion.hasSheath()) output(", even as her tentacular prick roils around and punches its way into "+ (x >= 0 ? "your [pc.womb]" : "the very limits of your bowels") +" before lashing around in attempt to set you off too.");
	else output("; and then her tentacles uncoil from each other while she’s still hilted, spreading out before flailing wildly enough to be seen through your stomach");
	output(". She pushes you down again, but this time she wraps her entire body around you until her hips can barely hump. Her lips kiss at you while her [marion.tits] mash up against your back, even as her body goes stiff. With one last choked off whimper the sudden hot rush of seed cascades into your depths in thick ropes"+ (x >= 0 ? ", with nowhere to go but your swiftly-filling womb." : "."));

	output("\n\nYour own sounds of ecstasy are nowhere near as quiet as the mute fox, and the icy cavern rings loudly while the floor trembles beneath your lust-hungry bodies. ");
	if (pc.hasGenitals()) output((pc.hasVagina() ? "[pc.GirlCum]" : "[pc.Cum]") +" sprays from your "+ (pc.hasVagina() ? "[pc.vaginas]" : "[pc.cocks] and [pc.balls]") +" while your body spasms and twitches beneath her. ");
	output("Some far-off part of your mind feels bad for ruining the plush furs under you, but it’s hard to concentrate with a stomach swollen with foxy jizz. ");
	if (marion.hasBalls()) output("Apparently she cums like a korgonne, and with her knot locking your body closed there’s nowhere for her spunk to leak to...");
	else if (marion.hasSheath()) output("You can actually feel your body churn and stir with every gentle motion of the tentacle in your "+ (x >= 0 ? "womb" : "guts") +", but for now she seems content to roll you both over onto your sides so that she can snuggle up.");
	else output("Your body feels like it’s been pushed to its limits; multiple small knots ensure not a single drop can escape while your "+ (x >= 0 ? "womb is turned into a temporary home for the many tentacles." : "guts are explored leisurely."))

	output("\n\nFiguring you might as well score a nap while you’re being embraced by a beautiful pink essyra, you’re treated to the sensation of drifting off wrapped in warmth with a deep animal purr in your ears. There are worse fates out there.");
	
	marionSexOutro();

	if (x >= 0) pc.loadInCunt(marion, x);
	else pc.loadInAss(marion);
	//pc.applyCumSoaked(),
}

public function marionSexOutro(full:Boolean = true):void
{
	if (full) output("\n\nYou awaken some time later, covered in a thin layer of loose pink hair from your foxen lover... but that’s the only trace she was ever here. The furs are just as you found them and the entrance stands open, letting in a faint chill that the embers of the fire struggle to fight back. You sigh and stand, gathering your discarded possessions. It seems this wasn’t meant to be more than a one-night rendezvous. A shame.");

	output("\n\nYou sigh and let yourself out, back into the frigid embrace of Uveto’s perpetual chill.");

	IncrementFlag("MARIONS_FUCKED");
	processTime(5*60);
	sleepHeal();
	pc.orgasm();
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function lurelingFightEscape():void
{
	clearOutput();

	output("To hell with this, you’re getting out of here! You fight back just enough to push the snarling beast back, giving yourself the room you need to dive for the narrow entrance to the hidden den. You’ve barely wedged yourself into the snowy tunnel when you hear a horrible, croaking sound from behind you. What sounds at first like a roar or a growl steadily resolves into what can only be a hoarse but rhythmic laugh.");

	output("\n\nThe Lureling is <i>laughing</i> at you!");

	output("\n\nShame and rage burns your cheeks, but still, you know when you’re outmatched. If only you’d know what slapping some random fox-girl would have gotten you into!");

	output("\n\nYou crawl out of the den and into the whirling winds of Uveto as quick as you can, hoping that the howling gale will drown out the psychic fish’s mirth.");

	CombatManager.abortCombat();
}

public function lurelingFightDefeat():void
{
	clearOutput();
	author("Savin");
	showLureling();

	output("You go staggering back against the far wall of the igloo, trying to avoid the gnashing teeth and flailing arms of the lureling. Only when your [pc.weapon] scatters from your hand does the writhing beast calm itself, transfixing you with its fathomless dark eyes. As it maintains your gaze, the pink fox-girl it was guarding slowly creeps forward with fear and desire in her eyes in equal measure. The huge behemoth behind her slowly sinks back towards the shattered floor of the chamber as she slips down beside you and grabs at your gear, pulling it aside.");

	output("\n\nRather than mounting you, though, the frigid vixen grabs one of the "+ (pc.credits < 100 ? "sadly empty " : "") +"credit chits from your kit and stuffs it down her cleavage. Wordlessly, she tuts at you and wags a finger in your face before standing and going over to the sea monster. It murmurs at her and begins to slink back, returning to the depths. When it’s gone, the puppet-like foxen simply waves you off, as if dismissing you.");

	output("\n\nYou can’t help but question why she’d let you go without further molestation after all that time spent trying to seduce you. Has she just lost interest in you, or in her own queer way, does she really insist on consent?");

	output("\n\nEither way, you’ll count your lucky stars and leave while you can.\n\n");

	CombatManager.genericLoss();
}

public function lurelingFightVictory():void
{
	clearOutput();
	author("Savin");
	showLureling();

	output("The Lureling is screeching and thrashing around by now, slapping its whole body weight against the ice. Its flippers bash huge holes in the floor, sending the fire and furs into the deep. Its marion gasps and cries and tries to calm the creature, but to no avail.");

	output("\n\nWhile the getting’s good, you retreat back through the entrance to the igloo and stumble away into the freezing embrace of Uveto’s wilderness. Behind you, the cave rumbles and finally collapses in on itself, sinking into the waters below. Good thing you got out... but it’s a shame about that fox-girl. By the looks of things, she was just being controlled by the beast. Hopefully she manages to survive.\n\n");

	CombatManager.genericVictory();
}