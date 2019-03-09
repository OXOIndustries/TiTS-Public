// Savins Lurelings
// https://docs.google.com/document/d/1tyOj-RbpsF7gNND4h3TAKp_DcAsqj7WcetJUx1RWmK4/edit
// coded by Stygs 03/2019


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// CHANGE THE CODEX REFERENCE FROM KORGONNES TO MILODAN - KORGONNES ARNT PSYCHIC ANYMORE



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*	MET_LURELING		0/undefined = met the Marion/Essyra first time, 1 = repat, hasnt seen a Lureling, 2 = repeat, has seen a Lureling
 * 
 * 
*/

public function showMarion(nude:Boolean = false):void
{
	showName("\nESSYRA");
	if(nude) showBust("MILO_TEMPTRESS_NUDE");
	else showBust("MILO_TEMPTRESS");
}

public function showLureling(nude:Boolean = false):void
{
	showName("FEMALE\nKORGONNE");
	if(nude) showBust("KORGONNE_FEMALE_NUDE");
	else showBust("KORGONNE_FEMALE");
}

public function marionEncounter():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	showMarion();

	// Repeat, hasnt meet a Lureling
	if (flags["MET_LURELING"] == 1) {
		output("As you're meandering through the snow and ice, you see a figure approaching you. She's a tall and thickly built humanoid, wrapped in heavy furs that almost -- but not completely -- conceal a head of pink hair and a myriad of fluffy tails swishing in her wake. Another Essyra come to play, perhaps?");
		output("\n\nIt seems like it, going by the little smile she favors you as she gets almost to arm's reach. She's got no weapons and makes no hostile gesture, just a playful little smile and a crook of her finger as she turns towards a nearby gash in the snowbanks. It seems she wants you to follow her, no doubt to share some warmth beside the fire...");

		addButton(0, "Follow Her", goToMarionsDen, 0, "Yes", "The strange pink-haired essyra seems intent on taking you somewhere. Let's see where this goes...");
		addButton(1, "Don't", definitelyDontGoWithMarion, 1, "Don't", "No thanks.");
	}
	// Repeat, has meet a Lureling
	else if (flags["MET_LURELING"] == 2) {
		output("As you're meandering through the snow and ice, you see a figure approaching you. She's a tall and thickly built humanoid, wrapped in heavy furs that almost -- but not completely -- conceal a head of pink hair and a myriad of fluffy tails swishing in her wake. Another Essyra... and very likely a lureling's marion at that.");
		output("\n\nYou find your hand settling on your [pc.weapon] as she draws closer, and indeed, she stops some thirty feet ahead of you and puts her hands up in a gesture of peace. Though as wordless as the last of her kin, she uses her mittened hands to make clear gestures at you: <i>“don't hurt me. You can follow me if you like.”</i>");
		output("\n\nSeems like she, too, intends to honeypot you. But if you can stomach knowing what lurks under the ice... would that be so bad?");

		addButton(0, "Follow Her", goToMarionsDen, 0, "Yes", "The strange pink-haired essyra seems intent on taking you somewhere. Let's see where this goes...");
		addButton(1, "Don't", definitelyDontGoWithMarion, 2, "Don't", "No thanks.");
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
		output("\n\nYou squint, trying to see a bit clearer through the biting wind. As your path and the figure's draw ever close together, the dark shape resolves into that of a humanoid, wrapped in heavy furs that billow in the wind. One of the natives, maybe? ");
		if (pc.willTakeColdDamage()) {
			output("Thank God! Maybe they can help you find shelter");
			if(pc.lust() >= 80) output(" ... or some other way to warm up...");
			else output(".");
		}
		else output("Hopefully not hostile, though you have to admit: getting the blood pumping like in a good fight would really help against the pervasive chill. Not to mention what comes after....");
		output("\n\nEither way, the two of you are headed right for each other. You raise a wary hand to the cloaked figure as it draws near and to your relief, you see it wave back. No more than twenty paces away now, it pulls down its fur - lined hood to reveal a head of brilliant bright - pink hair flooding down to its owner's shoulders in silken curls, framing a pale, feminine face. A pair of perky, fox-like ears -- much too small to be those of an ausar, and filled with a lush blue-white fluff -- poke out from her scalp, twitching in your direction. The woman's -- and that's most certainly what she is -- lips are full and dark blue, forming an enchanting smile. ");
		if (CodexManager.entryUnlocked("Essyras"))	output("You recognize her for one of the fox-like essyra, a thankfully friendly race!");
		else {
			output("Your Codex chirps, just barely audible over the howl of the wind, that this is an essyra, one of the native species here on Uveto. One that is, generally, friendly to off-worlders like you.");
			CodexManager.unlockEntry("Essyras");
		}
		if (pc.willTakeColdDamage()) {
			output("\n\nYou give a sigh of relief as you see the friendly smile on the girl's face. She instantly seems to recognize that you're freezing where you stand, slowly turning into [pc.aRace] icicle. Her smile, the warmest thing out here, wavers with concern, and a cream-pale hand darts out from under her hide cloak to grasp yours, locking her fingers around your hand and giving you an urgent tug towards the south. In your condition, you don't even think about refusing the silent woman's saving graces. Any promise of salvation from this lethal cold is good enough, especially when she pulls you in against herself, wrapping part of her heavy cloak around you to share in the warmth of it -- and her body.");

			addButton(0, "Next", marionsDen);
		}
		else {
			output("\n\nA moment passes in silence, her warm smile and bright eyes locked on you. You can see the hint of a glistening pink tail swishing eagerly under her coat, and heavily-clad arms moving at her side. The moment goes past, and a hint of the tension of meeting a stranger in the wilds passes: neither of you seem eager to attack the other, yet the girl isn't speaking. You suppose you need to take the initiative, and so you introduce yourself.");
			output("\n\nThe essyra smiles a little broader when you speak, but she makes no motion that she understood you. You blink in confusion, not really used to that happening, and tap your Codex through your pack. It beeps at you, letting you know it's still awake and functioning as your personal translator. Huh. Approaching the problem from a different angle, you point your hands at yourself and say, <i>“[pc.name].”</i>");
			output("\n\nThe essyra giggles, tossing her pink hair to one side and regarding you with a blue-lipped smile. You're not sure if you're making progress -- you get no word of reply -- but she does extend her arms to you, grabbing your hands in hers. Her hands are bare, with cream-pale flesh ending in tiny, sharp little claws. They rake gently against your " + (pc.isNude() ? "[pc.skinFurScales]" : "[pc.clothes]") + ", and when you fail to flinch away, the woman gives you a gentle pull towards the south. Does she want you to come with her somewhere?");
			output("\n\nWhen you don't instantly follow, trying to puzzle out what she's up to, the woman smiles again and steps closer -- right into your personal space, pressing the curvaceous front of her furry outfit against your [pc.chest], gripping your hands firmly. She glances " + (pc.tallness > 80 ? "up" : "down") + " into your eyes and chews on her lower lip, almost like she's nervous about something. Another gentle tug cements her desires you your mind, and this time she puts her whole body into it, leaning back with an inviting motion of her head that indicates a half-hidden path through the snow.");
			output("\n\nIt looks like this strange, silent essyra is trying to take you somewhere. Do you let her?");

			addButton(0, "Yes", goToMarionsDen, 0, "Yes", "The strange pink-haired essyra seems intent on taking you somewhere. Let's see where this goes...");
			addButton(1, "No", dontGoWithMarion, undefined, "No", "You're not going anywhere with a stranger that won't even give you her name!");
		}
		IncrementFlag("MET_LURELING");
	}
}

public function dontGoWithMarion():void
{
	clearOutput();
	author("Savin");
	showMarion();

	output("You resist the invitation, tempting though it might be, and gently brush her hands off you. The girl pouts, slowly withdrawing her arms into the front of her coat.");
	output("\n\nSlowly, you start to turn around to depart -- only to feel her clawed hands grab at your shoulders. For a second, you panic, thinking you're under attack. The fear passes a moment later when you feel her fur-clad body press into your back, feeling the perky mounds of a pair of breasts under the coat rubbing against you. She makes a sad, wordless whining sound, clutching desperately at you. You manage to squirm around in her awkward embrace that you face her, getting a good look at her big, puppy-dog eyes in the process. The essyra gives you a gentle, almost pleading tug in the direction of... whatever it is she wants.");
	output("\n\nShe looks pretty desperate for you to come with her now, whining and tugging at you like she is. Maybe you <i>should</i> go with her?");

	clearMenu();
	addButton(0, "Yes", goToMarionsDen, 0, "Yes", "The strange pink-haired essyra seems intent on taking you somewhere. Let's see where this goes...");
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
			output("You wrest yourself out of the essyra's grasp and ");
			if (pc.isNice()) output("gently");
			else if (pc.isMischievous()) output("mockingly");
			else output("forcefully");
			output(" tell her that you're not going with her. Not that she understands you, anyway.");
			output("\n\nBy the time you manage to turn away and put some distance between you, you're half sure you can see tears welling up in her eyes when you look over your shoulder. What the hell? You sigh and turn away, starting to resume your trudge through the snowy wastes.");
		}
		else {
			output("You shake your head and tell her no, you aren't going to follow her. You earn a pout and huff from the foxy native, but she doesn't move to stop you from walking away.");
		}
		output("\n\nAfter about fifty paces, you feel something heavy and cold hit you in the back, exploding in a hail of white dust. You stumble, more from surprise than anything, and watch as a second snowball goes careening over your head! Spinning around, you see the same, persistent essyra standing atop a nearby snowbank with another snowball in her hands, giggling as she hucks it at you.");
	}

	clearMenu();
	addButton(0, "Fight Back!", resistMarion, undefined, "Fight Back!", "Well, you can't let that go unanswered. Hit her back with a snowball!");
	addButton(1, "Go Away!", scareAwayMarion, 0, "Go Away!", "No, seriously, go away!");
}

public function resistMarion():void
{
	clearOutput();
	author("Savin");
	showMarion();

	output("<i>“Hey!”</i> you shout, ducking a third snowball that comes hurling at you. <i>“I said no!”</i>");
	output("\n\nShe giggles and leans over, grabbing more snow. Dammit, that's it! You do the same, grabbing a fistful of snow and letting fly right at her big, dumb, pink head. The girl squeals when the snowball impacts her, turning into an uproarious laugh as she throws another that hits you right in the [pc.chest]. A running start and a hard overhead throw like a grenade gives her another taste of her own medicine, beaning her in the leg, apparently hard enough to make her tumble over. She yelps, planting her ass in the snow as the bank she's standing on rumbles behind her, and starts to shift.");
	output("\n\nOh, shit. You have just enough time to turn around and take a desperate step before the essyra's ass-plant sends the side of the hill tumbling down in a great wave of crashing snow. You scream in surprise as the miniature avalanche slams into your back, barreling you over. Darkness takes hold for a moment, until you manage to flail your limbs enough to fight your way to the surface -- and right into another snowball. The essyra, now all of two feet away and sitting dazed beside you, laughs reaches for more snow.");
	output("\n\nYou reach up and grab her arm, pulling her down. She just laughs and rolls with it, happily letting you restrain her as you pull yourself out of the snow. The moment you're out, though, you feel a pull on you in turn, sending you right back into the ground beside the essyra, who's got her arms around your waist and her legs straddling yours.");
	output("\n\nShe laughs and smiles, leaning in so close that you can feel her hot, sweet breath on your [pc.face]. Before you can react, she leans down and plants a lightning-fast kiss on your [pc.lips], sending an electric current of surprise and stimulation through your snow-logged body. But she doesn't press the issue further, at least not now. She gives you a much more sensual, inviting smile, and nods towards the south.");
	output("\n\nSuddenly, you think you realize what she's wanted all along...");

	clearMenu();
	addButton(0, "Go for it!", goToMarionsDen, 1, "Go for it!", "Alright, alright. She's made her point. Go along with the pretty pink fox-girl.");
	addButton(1, "Seriously, No!", scareAwayMarion, 1, "Seriously, No!", "You don't want what the pink-haired slut's offering.");
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
		else output("God dammit! You scream some profanities at her before you take off as fast as you can, hoping she'll take the hint. A few silent minutes later, and you're fairly convinced she has. Shaking your head, you look to resume your travel.");
	}
	else output("You give her one last, fierce scowl and shake your head. The essyra's chest gives a sad little heave, and she stands up, releasing her hold on you. She pouts, but this time doesn't try and stop you from leaving.");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function goToMarionsDen(variant:int = 0):void
{
	clearOutput();
	author("Savin");
	showMarion();
	
	if (variant == 0) output("Curiosity takes the better of you, and you decide to see what exactly this silent pink vixen wants to show you. You give her a nod and let her take your hand, drawing you southwards into the winding white wasteland of the Uvetan wilderness. You wonder where she's taking you...");
	else output("<i>“Alright, alright,”</i> you laugh, grabbing the girl's hips and giving her a wink. Her big, blue smile returns with gusto, followed through by a delighted squeal. She slips down and gives you a big, warm hug, enveloping you in heavy, soft furs. You laugh as the two of you get up, her hand locked firmly around your own, and she pulls you towards the snow-wracked wastes of the south. You wonder where she's taking you...");
	
	clearMenu();
	addButton(0, "Next", marionsDen);
}

public function marionsDen():void
{
	clearOutput();
	author("Savin");
	showMarion();

}
