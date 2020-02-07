import classes.Characters.PlayerCharacter;
import classes.Characters.PregnancyPlaceholder;
import classes.GameData.CodexManager;
import classes.Items.Miscellaneous.VenusPod;
import classes.PregnancyData;
//Venus Pitcher Plants


// Flags:
// TIMES_MET_VENUS_PITCHER               : Total number of times PC has encountered Venus Pitchers
// TIMES_CAUGHT_BY_ELDER_VENUS_PITCHER   : TODO - FIXME
// TIMES_VENUS_PITCHER_ELDER_ENCOUNTERED : TODO - FIXME

//Venus Pitchers Codex

//Meet Regular Venus Pitcher
public function encounterRegularTentaclePitcherYouGay():void {
	if(venusSubmission() >= 100)
	{
		venusBadEnd();
		return;
	}
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	CodexManager.unlockEntry("Venus Pitchers");
	//*First Time
	if(flags["TIMES_MET_VENUS_PITCHER"] == undefined)
	{		
		flags["TIMES_MET_VENUS_PITCHER"] = 1;
		output("\n\nA gentle voice rises in greeting, drawing your attention to one side. A pale-skinned woman turns out to be the source of the fair voice. She’s looking at you with an excited grin on her face while standing in a fairly disarming pose. In the darkness of the jungle, her whole body seems tinted a slightly viridian hue, except where a bra of green foliage conceals her generous breasts. A large, creased leaf is pressed betwixt her thighs to conceal her womanly modesty. Most strikingly of all, her shining, shoulder-length hair reveals itself to be umbrageous fronds that shimmer in the dim light. You find yourself slightly entranced by the way it shimmers and sways with her frequent changes in position.");
		output("\n\nYou suddenly sneeze, which draws a high-pitched giggle from the nymph-like woman, the breathy exclamations of good humor jostling her curvy tits almost mesmerizingly. She beams a friendly smile and says, <i>“These jungles are stuffy, I know. I’ve been stuck here for like a whole day! My foot’s stuck in some sap.”</i> She leans and shudders a bit for emphasis, her breasts swaying beneath her outstretched torso like sexy pendulums. Her plump lower lip is drawn into her mouth, gently gnawed on as she struggles. <i>“A little help?”</i>");
		output("\n\nSneezing a few more times, you’re about to come to a decision when the Codex beeps and chimes, <i>“Venus pitcher detected. Classified as a moderate danger, avoid prolonged contact with their spores if you have any respiratory illnesses. Approaching will result in restraint and the harvesting of sexual fluids.”</i>");
		output("\n\nThe woman’s face goes sour at that, and she yells, <i>“Shut up, whoever you are!”</i> She realizes you’re staring at her a moment later and covers her mouth, meekly blushing. <i>“Sorry. Uhm, that guy was wrong, the venus plant is on the other side of that tree, and I really need help!”</i>");
		var tricked:Boolean = pc.intelligence() / 2 + rand(20) + 1 <= 20;
		if(!tricked) output("\n\nYeah... she’s lying.\n\nDo you ‘help’ her?");
		else output("\n\nDo you help her?");
		//[Help Her][Don't]
		clearMenu();
		addButton(0,"Help Her",firstTimeVenusEntrance,true);
		addButton(1,"Don’t",dontHelpVenusPitcher);
	}
	//*Repeat Venus Pitcher Encounters
	else {
		flags["TIMES_MET_VENUS_PITCHER"]++;
		if(rand(2) == 0) output("\n\nA lovely green woman is here, clad in a simple vine and leaf bikini, her lower half concealed behind a bush. She notices you and calls out to you, begging for you to come to her with exaggerated shakes of her upper body that make her bosom quake in a most delightful manner. You sneeze as you watch the light glitter off her soft, pouty lower lip, nearly stumbling forward of your own volition before you realize that this must be another venus pitcher!");
		else {
			output("\n\nSneezing, you wipe your nose and shake your head, feeling a little dizzy in the moist jungle heat. You stumble a little bit and catch yourself on what you think is a tree. When the “tree’s” breast compresses oh-so-pleasantly under your hand, accompanied by a pleasured moan, you realize that you’ve woefully underestimated your surroundings.");
			output("\n\n<i>“Hey there, good lookin’. You say hi to all the girls that way?”</i> a musically sweet voice playfully teases. The boob you’re currently palming presses harder into your digits, allowing them to sink deeply into the sizeable mammary. <i>“Enjoy it, sugar. Just come around front here so I can properly show my appreciation.”</i>");
			output("\n\nYou recoil with surprising dexterity, gaping almost slack-jawed at the lewd, pale green beauty eyeing you. Her gaze is extraordinarily predatory, though you are unsure if it’s the lewd and salacious kind or something far more dangerous. She’s clearly a venus pitcher. Getting closer to her would undoubtedly be a goo--no... bad idea.");
			output("\n\nYou sneeze again and weigh your options.");
		}
		//Plus lust!
		pc.changeLust(rand(5) + 1);
		clearMenu();
		addButton(0,"Approach",venusRepeatFallIn);
		addButton(1,"Don’t",venusRepeatRefuse);

	}
}

public function venusRepeatRefuse():void {
	clearOutput();
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("You shake your head and say, <i>“Nope.”</i>");
	output("\n\nThe plant, seeing the firmness of your stare, pouts but doesn’t move, immobile as she is. You look around for any other trouble, and when you glance back, she’s gone, vanished into the ground below.");
	clearMenu();
	if(venusFlowerDrops()) addButton(0,"Next",venusPitcherBonusFlower);
	else addButton(0,"Next",mainGameMenu);
}

//*Approach and Fall In
public function venusRepeatFallIn():void {
	clearOutput();
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("You decide that there isn’t too much harm in approaching a venus pitcher again. They are quite effective at satisfying your... baser urges. As you close in, the beauteous nymph encourages, <i>“A little closer... I don’t bite.”</i> You smile perhaps a little too broadly and close the remaining distance, falling right through the carefully concealed hole in front of her and into the dank, musty pit below.");
	output("\n\nYou’re caught mid-fall by an array of tentacles. They softly cushion your landing, snaring and circling around each of your limbs. Spores tickle at your nose as you catch your breath in this underground pit, finding that remaining calm as the light dims and vanishes is easier than you would have expected, either because of your previous experience or the calming effects of the venus pitcher’s drug-like spores. The curvy dryad hangs upside down in front of you, growing more and more illuminated by verdant, bioluminescent illumination that springs forth from the chamber’s emerald walls.");
	output("\n\n<i>“Nice place, don’t ya think?”</i> she quips.");
	output("\n\nDozens more tentacles arise from a floor that’s little more than a mass of the intertwined, moisture-glossed tendrils. Normally such a thing would be alarming, but you sag into the embrace of the ones surrounding your limbs, sneezing as they strip off every scrap of your equipment. You let your head loll back nervelessly, a little lightheaded from her floating particles, slowly dragging yourself back up to look the venus pitcher on her gorgeous, beautiful face. She caresses your ");
	if(!pc.hasHair()) output("head");
	else output("[pc.hair]");
	output(" lovingly and asks, <i>“Why don’t we go ahead and get started?”</i>");
	//Randomly choose repeat stamen fellatio or repeat pistil cunnilingus, or other variant scene as appropriate.
	if(rand(2) == 0) repeatStamenScene();
	else repeatPistilScene();
}

//*Repeat Pistil (Cunt)
public function repeatPistilScene():void {
	clearOutput();
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("Two tentacles rise up in front of her: one with a flat, flaring tip and the other capped with an open, sucking orifice that vaguely reminds you of a woman’s vagina. The pretty plant-woman catches them in her armpits and palms along their slippery length while similar endowments wrap your [pc.belly] and [pc.fullChest] in tight coils. She kisses her held vines and glances back between them with a lewd look on her alluring visage.");
	output("\n\n<i>“Now, which of you two will feel the best rammed down " + pc.mfn("his","her","its") + " throat?”</i> the pale-green nymph asks. <i>“Today... I think that you’ll be my special girl...”</i> She nuzzles against her chosen tentacle affectionately. The other droops disconsolately.");
	output("\n\n<i>“In you go!”</i> the venus pitcher cheers as she thrusts her arm out, allowing the tentacle to slide along her arm like a pet snake. It writhes up slowly, rising in front of your face and leaking clear drool all over your [pc.chest]. Slowly shutting down your higher thought processes, the spores make it easy to enjoy the comforting warmth of your imprisonment. Your mouth drops open as you behold the glittering interior of her pistil, dark green and pulsating needily, capped with a bright green, clit-like bud. You giggle at the lewd appearance of the plant as it nears and rubs across your [pc.face].");
	output("\n\nSlick moisture trickles down your cheeks in longer rivulets, yet you find yourself amused by the situation. This horny little vine is so lusty, and it can’t even find a good place to sate itself! Deciding that you might as well move things along, you wiggle your [pc.tongue] out and deliver a lick of the passing folds, stopping them in their tracks. The taste is rather pleasant, like a mixture of nectar and honey collected together and fermented into a kind of mead. Ramming straight against your maw, the feminine petals fold back and spread to expose the entire eerily-glistening cavern within.");
	output("\n\nYou tentatively lick around the edge of the tentacle, swallowing the flavorful fruits of the venus pitcher’s ardor, being sure to tongue her engorged bud for good measure. Like a good little cunt, the vine starts to leak faster and faster in response to your affections. Your throat bobs and drinks with aplomb, sluicing down more and more of the natural mead. The muscles in your throat and mouth seem to relax the more you drink, and soon, the tentacle is pushing inside your gaping mouth-hole, fucking itself on your flailing tongue. Normally keeping your jaw that open would hurt, but the relaxing drink has numbed the pain to next to nothing.");
	output("\n\nSoon the pollen in the air and the delightful, druggy sap you’re swallowing combine to leave you happy and horny, gleefully tonguing the tentacle cunt while you await further pleasure. You look at the busty plant-woman and all but hump her with your eyes, begging her to fuck you with nothing but the power of your drugged gaze alone.");
	pc.changeLust(33+rand(20));
	//To tentacle jam
	clearMenu();
	addButton(0,"Next",tentacleJamTime,false);
}
	
//*Repeat Stamen (Dick)
public function repeatStamenScene():void {
	clearOutput();
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("Two tentacles rise up in front of her: one with a flat, flaring tip and the other capped with an open, sucking orifice that vaguely reminds you of a woman’s vagina. The pretty plant-woman catches them in her armpits and palms along their slippery length while similar endowments wrap your [pc.belly] and [pc.fullChest] in tight coils. She kisses her held vines and glances back between them with a lewd look on her alluring visage.");
	output("\n\n<i>“Now, which of you two will feel the best rammed down " + pc.mfn("his","her","its") + " throat?”</i> the pale-green nymph asks. <i>“Today... I think that you’ll be my special boy...”</i> She nuzzles against her chosen tentacle affectionately. The other droops disconsolately.");
	
	output("\n\n<i>“In you go!”</i> the venus pitcher cheers as she thrusts her arm out, allowing the tentacle to slide along her arm like a pet snake. It writhes up slowly, rising in front of your face and leaking clear drool all over your [pc.chest]. The wide, blunt plant-phallus smears its juices across your face as it nuzzles up to you, sliding across your cheeks, bumping your nose, and even sliding across your forehead as it nuzzles up to you. You feel a little bad for the pent-up, horny little vine and snag it with your [pc.tongue] the next time it slides by. Its skin is slippery, wet with its own nectar-like lubricants, but it stops and holds still for your oral caresses, gushing a thick dollop of off-white cream onto your busy muscle.");
	output("\n\nSome of the lusty leakings run off the sides of your [pc.tongue] as the puddled secretions pile higher, and with a dull, vacant look on your [pc.face], you swallow them. The taste is surprisingly sweet and tangy, not unpleasant at all. It burns a little as it goes down, but the burning spreads as it travels through your esophagus, inflaming your body with lust even as it dulls your reasoning further. Denied your licks, the tentacle butts itself up against your lips, pushing insistently until your relaxed jaw stretches wide enough for it to pop inside, the edges of the flare catching just inside your mouth to ensure that you won’t be letting it out anytime soon.");
	output("\n\nThat tentacle bulges wider in your mouth and slides deeper, so big that it feels like it’s steamrolling your [pc.tongue] flat against the bottom of your mouth as it goes. Soon, it reaches the entrance of your throat. It pulsates happily from the snug grip that your stretched opening is providing it and gushes thicker, longer flows of its mystery fluid straight into your ready gullet. You gulp it down instinctively, throat working to keep up with the heady flow, and it begins to rock back and forth, grinding its most sensitive places against your tongue to ease the passage of its fluids.");
	output("\n\nYou gurgle happily and keep swallowing. The drink is setting your body aflame with desire while simultaneously denying you the control to do anything about it. Honestly, the forced fellatio is kind of comforting. It’s a simple rhythm - pump, gulp, and swallow - repeated over and over and again while you become more and more aroused.");
	//To tentacle jam
	pc.changeLust(33+rand(20));
	clearMenu();
	addButton(0,"Next",tentacleJamTime,true);
}

//*Don't Help Her
public function dontHelpVenusPitcher():void {
	clearOutput();
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	// Nice
	if(pc.isNice()) 
	{
		output("You apologize and tell her that you simply can’t risk it.");
		output("\n\nShe pouts and says, <i>“Pleeeeeaaase? I promise, I’ll make you feel so good that you won’t want to leave!”</i>");
		output("\n\nWell, that confirms it. You sneeze and wonder if you should take her up on the offer, now that she’s being honest about it.");
	}
	// Mischievous
	else if(pc.isMischievous()) 
	{
		output("You tell her that you’ll be right over, right after you make sure the pitcher plant on the other side isn’t going to be a problem.");
		output("\n\nThe green-hued beauty throws her arms out, causing her leafy top to flop open, and chirps, <i>“Wait, wait! I’m the venus pitcher. I’m sorry for deceiving you, okay?”</i> She pauses as she becomes aware of her uncovered bosom, squishing her boobs together with her forearms and leaning forward to suggest, <i>“I could make you feel really, really good, you know. And I bet that voice would tell you that we aren’t very dangerous...”</i>");
	}
	// Mean
	else
	{
		output("You snort (nearly sneezing again in the process) and tell her that you aren’t nearly dumb enough to fall for her poorly constructed ploy.");
		output("\n\nThe pitcher plant woman bends low to pull a piece of bark off of a moist green opening in the ground. <i>“Well, if you’re so smart, surely you know how good feeding one of us must feel. Surely you’re aware of how tender we are through the whole process. Come on, it’ll only take a few hours.”</i>");
	}
	clearMenu();
	addButton(0,"Approach",firstTimeVenusEntrance,false); //To first time milking!
	addButton(1,"Nope",noVenusPitcherPlz);
}

//[Nope]
public function noVenusPitcherPlz():void {
	clearOutput();
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("You decline again. The venus pitcher woman petulantly blows a frond of her hair up and folds her arms, no longer bothering to attempt to seduce you.\n\nYou regard your other surroundings, and when you look back, she’s gone, almost as if by magic.");
	clearMenu();
	if(venusFlowerDrops()) addButton(0,"Next",venusPitcherBonusFlower);
	else addButton(0,"Next",mainGameMenu);
}

//*First time entering a pitcher plant!
public function firstTimeVenusEntrance(tricked:Boolean = false):void {
	clearOutput();
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	// If tricked
	if(tricked)
	{
		output("You [pc.walk] up to her, intent on helping her. How unlucky she was to be stuck so close to a pitcher plant girl; it’s no wonder she’s been stuck here so long.");
		output("\n\n<i>“Don’t worry, I got this,”</i> you quip reassuringly as you get close enough to admire her flawless skin tone, full lips and flaring hips. You sneeze, startling yourself from your lusty revelry; how long did you stand there staring? Shaking your head to clear it, you stumble up the rest of the way, watching her every motion until you’re just close enough to reach her. Then, the ground falls out from under you, plummeting you into darkness...");
	}
	// If voluntary
	else
	{
		output("You approach a little hesitantly, finding yourself increasingly horny thanks to the way she undulates her nubile form for your enjoyment, even going so far as to pull up her leafy top and release it, setting her swollen breasts to jiggling while her verdant bra tumbles open. Two cherry-sized nipples jut out, hard and purplish in the dim light, just waiting to be tweaked. You find your [pc.legOrLegs] accelerating in your hurry to sample her wares, and before you know it, you’re a step away.");
		output("\n\nStartled, you stop, sneezing sheepishly and wiping your nose. Her breasts are just that step away");
		if(pc.isAss()) output(" but you know the real deal is probably in that hole. Oh well, no time like the present");
		output(". You move up, trying to palm a quick squeeze, but the ground opens up underneath you, dropping you into darkness...");
	}
	// merge
	output("\n\nSoft, spongy flesh hits your back as you come to rest in the bottom of the hole. It’s uneven and bundled together in what feels like huge ropes, dozens of them squirming and sliding along your back following the impact. You roll aside instinctively, trying to escape whatever you landed on, but that just earns you a face full of tentacles, slippery, wiggling tentacles. They flex and arch away from the bottom of this tiny cave, flopping you back onto another bed of moist vines where you can see the light from above slowly dimming, blocked by a busty silhouette that eventually plugs the gap entirely, shrouding you in darkness.");
	output("\n\nThe air is thick with whatever was making you sneeze – the spores, you think – but at this point, they’re just making the tip of your nose itch. That’s a far lesser concern than the fact that you’re in a pitch black hole surrounded by tentacles strong enough to toss you around like a child’s toy. One rubs your cheek, smearing your [pc.skinFurScales] with something warm and wet that’s leaking from a semi-rigid, flared tip. Another ");
	if(!pc.isNude())
	{
		if(pc.hasLowerGarment()) output("slithers up inside your [pc.lowerUndergarment]");
		else if(pc.hasArmor()) output("slithers up inside your [pc.armor]");
		else output("slithers up inside your [pc.upperUndergarments]");
	}
	else output("slithers across your nude body");
	output(", the friction peeling back an outer covering to expose something even softer and wetter, tipped with a sucking, hungry hole that plants dripping-wet kisses all over your abdomen and [pc.fullChest].");
	if(!pc.isNude()) output(" Your gear is soon a soaking hot mess.");
	
	output("\n\nYou try to resist, but your mind is a little more sluggish and relaxed than it was a few moments ago. Vines as thick and strong as small trees gradually encircle each of your limbs, snaring them in slippery tight caresses.");
	if(pc.hasLowerGarment())
	{ 
		output(" Smaller, quicker tentacles see to your ");
		if(pc.hasArmor()) output("[pc.armor] and ");
		output("sticky underwear, removing the obstructing material in a matter of moments.");
	}
	output(" The slithering restraints pull tight, spreading your nude form for what you can only assume is coming violation, languidly dragging their fluid-leaking lengths over your [pc.skinFurScales]. The worst part of it is the omnipresent darkness. The shroud of sable murk makes every touch seem a surprise, and sightlessness enhances the touches’ effects on your vulnerable psyche.");
	
	output("\n\n<i>“Afraid of the dark?”</i> a familiar voice giggles as its owner’s soft hand caresses your cheek. <i>“Let me brighten up your day then, " + pc.mf("handsome","sexy") + ".”</i>");
	
	output("\n\nLight blooms from everywhere at once, not brightly enough to hurt your eyes but just luminescent enough to allow you to make out the details of your situation. Slithering tentacles are all around, some hollow, and some tipped with flaring, flat protrusions that dribble sappy liquids everywhere. They’ve grown out of the walls themselves, which happen to be the source of the pervasive, green illumination. In the center of it all hangs the venus pitcher woman, upside down and with her breasts now uncovered, leaking fine trails of sap.");
	
	// Genderless
	if(!pc.hasCock() && !pc.hasVagina())
	{
		output("\n\n<i>“Wait, you don’t even have a pussy, do you? No dick? No cunt?!”</i> she blurts out now that she’s taken the time to examine you.");
		output("\n\nYou lamely confirm that she is correct - you don’t have a dick or a pussy anywhere on your body!");
		output("\n\nIn a flash of light, the venus pitcher woman is gone. Your world tumbles end over end the next moment, only stopping when you slam face-first into the dirt. You groan and climb onto your [pc.feet], but the pitcher woman is gone, hidden inside her pod, and in this murk, you doubt you could find her again if you wanted to.");
		processTime(5);
		// end genderless shut out!
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	output("\n\nThe sense of alarm you felt at your predicament is dwindling in the face of the rhythmic green pulses and seductive beauty before you. She giggles again and shimmies back and forth slowly, allowing her leaky teats to kiss your lips with their sweet juices for a moment before she buries you in boob. Her hands tenderly stroke ");
	if(!pc.hasHair()) output("the back of your head");
	else output("your [pc.hair]");
	output(" as she coos, <i>“Just relax and let me make you feel so good that you’ll come looking for me whenever you’re horny, okay?”</i>");
	
	output("\n\nYou nod onto her soft breasts, smelling her fruity, aromatic scent; how didn’t you notice it before? It’s a warm, comforting scent that helps your muscles relax, allowing you to sag the rest of the way into her gentle tentacles as they snake further up your limbs, ensconcing them in slick affection. One of the fat-headed tubes circles around your waist and lifts its tip upward along your belly, giving you a good look at the central hole that’s slowly but constantly exuding a trickling of slick lubricant. It’s kind of like... well, a cock - and the hollow ones... they’re like vaginas.");
	
	output("\n\nYou slump back as the revelations sink in. Giggling again, the green girl asks, <i>“Am I your first?”</i>");
	
	// Total virgin!
	if(pc.cockVirgin && pc.vaginalVirgin)
	{
		output("\n\nYou’d be a little nervous about admitting your inexperience, but the words spill out of your mouth one after another without slowing. Before you know it, you’ve told her just how little you’ve done and how excited you are to get started.");
		output("\n\n<i>“Wow!”</i> she blurts, <i>“I just meant your first venus pitcher, but that’s even better.”</i> The viridian beauty traces her finger up from your navel to your chin before tut-tutting, <i>“I’ll make sure you remember me.”</i>");
	}
	// Not a virgin but new to flowers
	else if(flags["TIMES_CAUGHT_BY_ELDER_VENUS_PITCHER"] == undefined)
	{
		output("\n\nYou recount your sexual experience without a hint of hesitation, which seems a little odd in hindsight. While you’re trying to figure out your glibness, the chlorophyll-laden lady laughs, <i>“I didn’t mean a total virgin, who hasn’t fucked before? Maybe zil, when they’re super young or something. I meant, is this the first time you’ve been caught by one of us? Am I going to be the first to milk you?”</i>");
		output("\n\nYou nod, sheepishly.");
		output("\n\n<i>“Awww, that’s kind of sweet. I’ll be sure to make it good enough that you try to find me again!”</i>");
	}
	//Been had be elder ones already
	else {
		output("\n\nYou recount your sexual experience without a hint of hesitation, which seems a little odd in hindsight. While you’re trying to figure out your glibness, the chlorophyll-laden lady laughs, <i>“You fell for one of my older sisters? Well, it is nice to have someone broken in. I bet you’re already craving the pleasure of my embrace, aren’t you?”</i>");
		output("\n\nYou nod, sheepishly.");
		output("\n\n<i>“Awww, that’s almost sweet. I’ll be sure to make it good enough that you try to find me again!”</i>");
	}
	// both
	output("\n\nThe graceful green beauty rises up high enough to put her lips level with yours. Her plump pucker reminds you of a ripe fruit just waiting to be plucked, but you’re unable to do so in your present position. You watch as she sways closer to you, right up until her beryl kiss seals itself perfectly against your mouth. With your head swimming from the passionate press, you feel your genitalia engorging in response, making your lust as visible as a blooming flower while her lip-lock fans the flames of your desire. She’s the one to break the kiss, sliding away with deliberate slowness that lets both your mouths embrace for the tenuous moment before they separate.");
	output("\n\nThe salacious plant-slut wiggles seductively as she stretches her arms high above her head, towards the “floor”. She grabs you by the crotch ");
	if(pc.isTaur()) output("of your hindquarters ");
	output("and gently lets her fingers splay over your inner thighs. She breathily pants in a half whisper, <i>“I’m going to enjoy this, but since this is your first time, would you rather taste one of my stamen or pistil?”</i>");
	if(pc.intelligence()/2 + rand(20) + 1 > 15) output(" Based on what you remember of biology, the stamen probably corresponds to the cock-like ones.");
	//[Stamen] [Pistil]
	clearMenu();
	addButton(0,"Stamen",requestStamenFirstTime);
	addButton(1,"Pistil",requestPistilFirstTime);
}

//[Stamen]
public function requestStamenFirstTime():void {
	clearOutput();
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("You answer, <i>“I wouldn’t mind one of the stamen, I guess.”</i> The situation is too unreal to really add anything else.");
	output("\n\n<i>“Oh, a " + pc.mf("guy","girl") + " after my own heart!”</i>");
	output("\n\nThe wide tentacle that’s been slobbering sweet plant-pre all over your [pc.belly] and [pc.chest] wiggles happily, thrusting upward in a spasm of motion so fast that it turns your cheek when it wetly smacks against it. The prehensile cock redirects itself after the failed penetration and angles back towards your face. You watch its green surface as it closes in, textured with tiny, almost invisible bumps. The tip flexes as it approaches your oral entrance, flaring so wide that you question your ability to let it inside. It pushes on your face, and you have no choice but to open wide.");
	output("\n\nUnsurprisingly, it can’t fit in. It pushes hard against you, smearing you with its clear goo in its efforts to claim your mouth. You strain to open your jaw wider; having it battering fruitlessly on your face is less pleasant than the idea of letting it fuck against your tongue. The tentacle pushes harder, and the outer edge of its spongy yet hard flare begins to bend back, compressing slightly as it moves the barest millimeter past your lips. Behind the tip, the stalk of the thing is waving and contorting to thrust again and again, pushing so hard that your jaw creaks a little as it’s forced yet wider. A wet pop follows, and the thing is inside you, distending your maw with its size and dripping its sweet goo straight into your gullet.");
	output("\n\nWhat little of the juice that you can taste is heavenly, and you soon find your body responding even more strongly than before. Your throat relaxes, dilating open, and your mouth is actually starting to get used to being stretched this wide. The fullness is pleasant in its own way.");
	pc.loadInMouth(chars["VENUSPITCHER"]);
	// merge to start of tentacle jam!
	pc.changeLust(33+rand(20));
	clearMenu();
	addButton(0,"Next",tentacleJamTime,true);
}
//[Pistil]
public function requestPistilFirstTime():void {
	clearOutput();
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("<i>“I guess I’ll try the pistil!”</i> you answer. There’s not much you can do but pick one and deal with it at this point, and with your head muddled as it is, you don’t really see anything wrong with having to choose one.");
	output("\n\n<i>“Really? I’m partial to watching my partners gulp down my stamen’s stuff while I milk them, but a promise is a promise!”</i>");
	output("\n\nSomething wet slithers over your shoulder, pressing against your cheek as it goes. Its slippery wetness drips from your jawline in lewd little ropes while the source moves closer, eventually rounding on you and hovering a few inches from your [pc.face]. The outside of it forms a perfect circle, while the inside is a deep green in coloration, seeming softer and somehow even more wet than the outside. A trickle of clear drool drips from the underside of the cunt-like tentacle continually, and the inner membrane pulsates to some unseen beat, looking every bit the hungry orifice.");
	output("\n\nThe tubular protrusion mashes into your mouth slowly but firmly, and you find your lips opening to allow it inside. It begins to suck as soon as it enters your oral cavity, drawing your tongue inside before you know what’s going on. Its juices pour out much faster now that it’s found something to play with, and you find yourself swallowing down the syrupy sweet stuff while you’re wiggling your tongue against the soft interior nigh continuously. There’s even a sensitive bud near the entrance that makes it gush more liberally whenever you press on it. Of course, you find yourself doing that frequently, so long as you can swallow fast enough.");
	output("\n\nThe heavenly taste soon begins to affect you in strange ways, inflaming your passion to new heights while loosening the muscles in your tongue to allow it to go even deeper. All in all, it’s a remarkably pleasant experience.");
	pc.loadInMouth(chars["VENUSPITCHER"]);
	// merge to start of tentacle jam!
	pc.changeLust(33+rand(20));
	clearMenu();
	addButton(0,"Next",tentacleJamTime,false);
}
	
//*Tentacle Jam
// no new PG
public function tentacleJamTime(stamen:Boolean = true):void {
	clearOutput();
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("The other tentacles are not idle during this time, and they casually caress and explore your body, coating you with their secretions until you shine in the dim, pulsing lights. They nudge your [pc.asshole] and [pc.nipples] carefully, even switching to hollow tendrils on the latter in order to fully test them.");
	// Nippledicks
	if(pc.hasDickNipples()) output("\n\nYour nipples strain as soon as they’re presented with those empty cavities, the pebbly texture of their outer coverings parting to reveal your " + num2Text(pc.totalNippleCocks()) + " concealed dick-nipples, the shiny glands slipping forth in a rush to greet the supple, undulating tentacle interiors with eager tumescence. The sides of the green vines bulge out in dick-deformed outlines. Meanwhile, the entrances seal down around the edges of your areolae with a short slurping sound, causing your nipple-cocks to swell larger inside their vacuum-sealed chambers, just in time to experience the hellishly pleasurable sensation of dozens of folds and hundreds of wriggling cilia playing along your lengths, sucking, sliding, and squeezing hard enough to make you dribble milky pre already.");
	// Nipplecunts
	else if(pc.hasFuckableNipples()) output("\n\nYour nipples drip lubrication sympathetically against the exploratory tentacle-cunts, causing the semi-feminine members to withdraw from your sight and leave you hanging there. A moment later, a pair of flared plant-phalluses appear in their place, leaking sappy pre-cum as they nuzzle against your pliant, barely concealed nipple-holes. Luckily, these are some of the smallest of such tentacles in the chamber, so when they press on your chest-pussies, your pleasantly wet nipple-cunts give easily, swallowing the flared dongs up and into their mammary affections. The chlorophyll-laced cocks quickly reach the bottom of your chest channels and pull back, setting themselves up for a steady rhythm that makes your [pc.fullChest] wobble and shake while you hang suspended and twitching, watching the green lengths undulate in front of your eyes as they work you over.");
	// Regular Nipples
	else if(!pc.hasFlatNipples())
	{
		output("\n\nYour [pc.nipples] are so hard that the feel of moisture running down them is something you’re VERY keenly aware of. The suckling tubes latch onto them at once and start to pulsate, rippling up and down their lengths as they rhythmically tug and pull, trying to milk your poor nips dry.");
		if(!pc.canLactate()) {
			output(" Unfortunately for this plant lady, you aren’t lacta.... Ooohhh, why does that feel so good?! Something is coming out of your breasts in drips and dribbles, sometimes even small bursts. The flow gradually increases whenever you gulp down another throat-full of sticky plant-juice, and your [pc.chest] puffs up slightly, expanding under the weight of your burgeoning milk supply. It feels good enough that you’re thankful for the restraints - without them, you’d be flopping around like a fish out of water.");
		}
		else 
		{
			output(" Fortunately for this plant lady, you’ve got [pc.milk] to give. Your lactic cargo bursts free of your [pc.nipples] almost immediately, running unchecked in drips and dribbles that are quickly devoured, pulled away by the pleasant tentacles pulsating suction. You start moaning from the erotic sensation of being drained, and your nipples puff up, bigger and longer than before, spraying more leaky tit-treasure with every passing moment. The burgeoning mountain of [pc.milk] inside you seem to grow faster than it can be pulled from you. You briefly wonder if the juices are enhancing your ability to produce, but that thought vanishes under the sheer, erotic sensation of having your milk suckled out of you. If it weren’t for the restraining vines, you’d be flopping around like a fish out of water.");
			pc.milked(pc.milkFullness);
		}
	}
	// Flat nipples
	else output("\n\nThe hollow tips pull back after touching your [pc.nipples], arching up and swiveling to face each other in confusion. Your host’s gentle voice ‘hmmm’s in consternation, reaching out to touch them with her own hands. She slowly strokes and circles the sensitive spots before nodding and retreating, directing her hollow tentacles to take over for her nimble fingers. Those hollow tubes latch on with a wet “schluck” and begin to suck, tugging gently on your flesh with gentle pulses, causing your [pc.nipples] to puff up slightly inside them and grow more sensitive. The constant, bewildering levels of sensation are enough to make you squirm and writhe in your restraints while your strange chest is tugged and teased in a fruitless attempt to stimulate, or perhaps milk, you.");
	
	var tempTits:int = 0;
	
	if(pc.canTitFuck()) 
	{
		// Many boobs in one row! TRI BREASTED HOOKERS UNITE
		if(pc.canTriboobTitFuck()) 
		{
			for (var a:int = 0; a < pc.bRows(); a++)
			{
				if(pc.breastRows[a].breastRating() >= 3 && pc.breastRows[a].breasts > 2) tempTits = pc.breastRows[a].breasts;
			}
			output("\n\n" + StringUtil.upperCase(num2Text(tempTits - 1)) + " unseen presences make themselves known, spires of semi-rigid plant flesh that drive themselves through your excesses of cleavages with firm ardor. They cause your multiple breasts to jostle and shake slightly apart, nearly dislodging their busy brethren from your nipples in the process. You whimper as you’re used like some kind of three-breasted whore, sucked and fucked, brought to the heights of pleasure whether you want it or not. The " + num2Text(tempTits - 1) + " tentacle cocks crest the top of your sea of tits and reveal themselves, pulsating hungrily and leaking ever more of their ridiculous juice everywhere. They push up until they kiss your chin with their urethras, then they dive back down into your mammaries, sliding and slipping through them in what can only be described as eager overindulgence.");
		}
		// Multirow titfuck worthy
		else if(pc.canMultiRowTitFuck())
		{
			output("\n\nTwo unseen presences make themselves known by asserting amongst your many breasts, twisted around each other and slowly pushing through your cleavages with gusto. Slippery slime remains in their wake as they plow right on through. This jiggles your [pc.nipples] around with such force that it nearly dislodges the other tendrils, but they manage to hang on through the forceful beginnings of this many-titted breastfuck. The big green flares surface at last, their heads smushed together in such a way that they look more like one giant, double-dribbling dong than two distinct cocks. They vanish a moment later as they begin to plow your chest in earnest, rocking and bouncing your [pc.fullChest] as they use it as a fucktoy.");
		}
		// One row titfuck worthy
		else output("\n\nAn unseen presence makes itself known: a spire of semi-rigid plant-flesh that drives itself through your cleavage without concern for how it jostles its siblings, slicking the valley between your boobs with its own lube, even though you were already soaked with the stuff. It surfaces between your [pc.chest], the big, green flare trembling as it drips everywhere. It pulls back, vanishing into your chesty crevasse with gusto. Your tits are bounced and jiggled by the weighty flora-cock as it uses you for its own pleasure, a fact confirmed by the lusty pants the woman in the center of it all is making while she strokes two similar vines.");
	}
	// Preggo belly bonus
	if ((pc as PlayerCharacter).bellyRating() >= 30 && pc.hasPregnancy()) output("\n\nGrouping together around your [pc.belly], an obscene mass of tentacles begin to slide and rub all over it, gently caressing and massaging your motherly weight, slipping all over your [pc.skinFurScales]. Some of the hollow ones almost seem to kiss at it as they embrace your yet-to-be-born young.\n\n<i>“Mmm, mothers are always so nutritious. I hope you can feed all my mouths,”</i> the upside-down venus pitcher quips as she reaches down to feel your middle amongst her many tentacles. <i>“No harm will come to your young, but I hope you’ll return to bear mine, someday.”</i>");
	
	// Single cock
	if(pc.totalCocks() == 1) {
		output("\n\nYour [pc.cock] has been ignored these few moments, but the presence of something warm hugging your [pc.cockHead] lets you know that your genital loneliness has come to an end. The emerald girl grins lecherously as glossy, silken gates part around your girth, sliding down your length in a sensuous caress that would make a pornstar weep for joy. Cords of muscle move inside the slippery vice, squeezing the parts of you already inside as it slowly devours you. Before long, your [pc.hips] are rocking to and fro as if to hurry along the cunt-tentacle’s affections, desperate to have it snug on your [pc.sheath] and milking you dry.");
		if(pc.balls > 0) output(" Smaller vines encircle your [pc.sack], rubbing your [pc.balls] with their tips while they try to coax a nice, juicy load out of you.");
	}
	// MultiCock
	else if(pc.totalCocks() > 1)
	{
		output("\n\n[pc.EachCock] has been ignored for these few moments, but the presence of more than one warm, wet hole caressing the tips of your malenesses lets you know that your genital loneliness has come to an end. The emerald girl grins lecherously as the glossy, silken gates part around your girths, sliding down your lengths while imparting lascivious caresses capable of causing a pornstar to weep for joy. On someone who has to experience the effect ");
		if(pc.cockTotal() == 2) output("twice");
		else if(pc.cockTotal() == 3) output("thrice");
		else output("many times");
		output(" over, the effect is almost maddening. You piston your [pc.hips] wildly towards the undulating love-snakes, desperate to feed as much of yourself into their embrace as possible. Your frenzied motions have little effect on how your cocks are devoured however, and you’re forced to endure the torturously pleasant slide into slick, wet heaven.");
		if(pc.balls > 0) output(" Smaller vines encircle your [pc.sack], rubbing your [pc.balls] with their tips while they try to coax a nice, juicy load out of you.");
	}
	// Take dickginities!
	if(pc.hasCock()) pc.cockChange();
	
	// Cocktail
	if(pc.hasCockTail()) output("\n\nA similar entrance engages your [pc.cockTail], which has long since grown out of hiding in response to the sensuous beauty’s lust-inducing juices. They’re even now pouring unhindered into your throat. You wiggle your prehensile appendage and slam it forward, powered by ardent need, burying it as deeply into the succulent tentacle-pussy as you can. Closing around you, the clinging inner folds form a perfect, cock-crafted seal around you member. Internal muscles start to slide and contract along every veiny inch of your [pc.tailCock] to some kind of slow, unspoken beat. You respond by pulling your tail back, sliding it perhaps an inch out of the velvet glove, and thrusting it in as hard as you can. This time, the tendril grips you tighter, and rather than allowing you to lamely try to fuck it, it begins to squeeze from the base to the tip of it so fast that you lose all control of the limb.");
	// Vaguyna
	var tempVags:Array = [];
	if(pc.totalVaginas() == 1)
	{
		output("\n\nA sinuous slithering can be felt along your [pc.leg], curling slowly around your limb as it winds its way higher, inexorably closing the distance between itself and your [pc.vagina]. You sigh and slump down, but the tentacles holding your arms and [pc.legOrLegs] don’t let you any closer to the crawling promise of penetration. Thankfully, it continues its dogged ascent up your body, sliding along the exterior of your vulva");
		if(pc.hasClit()) output(" and [pc.clits]");
		output(" a few times as it slowly parts your labia with the curvature of its shaft. It slides back down whilst still pushing against you, angling the cockhead to begin prying you the rest of the way open, pushing insistently as it bathes your lips in lubricants.");
		output("\n\nYour squeal of pleasure and pain at being forced wide is muffled by the tendril in your mouth. The cock-tentacle impales you. It plows you wide open. Your passage is pulled wide by the large, flared cock as it pushes in all the way to your cervix, bubbling its hot fluids against the slight barrier as it adjusts to your tightness. You instinctively try to move your [pc.legOrLegs], though whether to wrap around an imaginary lover or curl up away from the discomfort, you aren’t sure. One thing you are sure of is that you’re full. The tendril starts to move, and you whimper as it scrapes along your walls, firing off every nerve in your cunt as it pulls out, only to thrust back in, just starting to properly fuck you.");
		pc.cuntChange(0,chars["VENUSPITCHER"].cockVolume(0));
		tempVags.push(0);
	}
	// MultiVaguyna
	else if(pc.totalVaginas() > 1) {
		output("\n\nSinuous slithering can be felt all along your [pc.legOrLegs], curling slowly as they wind their way higher, inexorably closing the distance between themselves and your [pc.vaginas]. You sigh and slump down to get them closer, but the tentacles suspending you inside this plant pod don’t give you enough slack to get any closer to the crawling promises of penetration below. Thankfully, they continue their dogged ascent up your body, sliding along the exterior of your multiple vulvae");
		if(pc.hasClit()) output(" and [pc.clits]");
		output(" a few times as they slowly part your labia with the curvature of their shafts. They slide back down whilst pushing against you, angling their cockheads up to start prying you the rest of the way open, stretching all your cunts at once as they shove insistently on your entrances, bathing them in lubricant.");
		output("\n\nYour squeal of pleasure and pain at being forced wide open in more than one place at once is muffled by the tendril in your mouth. The cock-tentacles impale you, plowing you wide open. They stretch your passages wide open around their large, flared cocks, pushing them all the way to your cervixes, bubbling their hot fluids against the slight barrier as they adjust to your tightness. You instinctively try to move your [pc.legOrLegs], though whether to wrap around your imagination partners or curl away in discomfort, you aren’t sure. One thing you’re sure of is that you are incontrovertibly full. The tendrils start to move, and you whimper as they scrape along your walls, firing off every nerve ending in your cunts as they pull out, only to thrust back in, just starting to properly fuck you.");
		//[cunt stretchin' checks]
		for(var b:int = 0; b < pc.totalVaginas(); b++) {
			pc.cuntChange(b,chars["VENUSPITCHER"].cockVolume(0));
			tempVags.push(b);
		}
	}
	// Cunt Tail
	if(pc.hasCuntTail()) output("\n\nAlmost of its own volition, your [pc.tail] whips around in search of a mate, striking out towards the closest phallus while dilating as wide as it can. After a moment of exquisite friction, the swollen dick-tip is pushing through your [pc.tailVagina], the two prehensile mating tubes writhing almost as beautifully as ballet dancers as one slides into the other, married perfectly to your hungry tail twat, filling it with such vigor that the ecstasy threatens to overwhelm you. Once your depths have been fully plumbed, your tail disgorges the bulk of the tentacle, now coated in your soaking wetness, dripping in the pale green light. They close together again, and again, and again....");
	// butthole
	output("\n\nYou are so awash in pleasure by this point that it’s hard to fully comprehend the situation you’ve found yourself in, but you do become aware of another feeling in your hindquarters - pressure on your [pc.asshole]. One of the vine-cocks has taken it upon itself to explore your unmolested behind, rubbing and squishing noisily amongst your cheeks, smearing its hot juices across your [pc.butt] as it tries to pry apart your tender, still-sealed entrance. Your body is being touched and rubbed all over, caressed in every crevice and erogenous zone; you can’t muster the focus to shut it out.");
	output("\n\nThe blunted tip slips one side of itself into your vulnerable behind, starting to stretch you open, dribbling its slippery pre-spooge over your stretching pucker. It pushes more and more of itself forward until the rest of its flare compresses and pops inside, practically slurping deeper into your anus once it gets past the meager barrier that was your sphincter. You whimper as it snakes through your rectum, gushing juices everywhere until it decides to settle in and start rocking back and forth, pumping your [pc.asshole] incessantly.");
	pc.buttChange(chars["VENUSPITCHER"].cockVolume(0));
	
	// Start of cumming! 
	output("\n\nLess than a foot away, the curvy plant-girl is twisting and writhing in excitement, her cheeks flushing purple in excitement while she cries out and tugs on her nipples, every movement accentuated by her busty body. Plump emerald lips part into an excited ‘O’, and her eyes roll back, whimpering as orgasm claims her. Half the tentacles distend with rounded bulges that race towards your body while the other half actually narrow, compressed by the increased suction.");
	// Tentadick - cum in your mouth
	if(stamen) {
		output("\n\nThe tentacle dong stuffed into your throat is the first to receive the heady payload. Pressure mounts against your lips when the sperm-packed bulge impacts your face, too large to fit inside in one huge squirt. Instead, the cock-slime slides through a constant, never-ending rope of jism, pumping straight down the back of your throat with such force that you can barely manage to swallow it, tasting the salty-sweet aftertaste of it on the back of your tongue. Eventually the bulge passes, and you get a chance to breathe. Then, another arrives, and you gulp anew, groaning around your burgeoning");
		if(pc.bellyRating() > 30 && pc.hasPregnancy()) output(", pregnancy enlarged");
		output(" belly.");
	}
	// Tentacunt - cum in mouth
	else output("\n\nThe tentacle quim suckles your [pc.tongue] hard enough to almost be painful, actually sucking the spit and feminine juices it’s dribbled out of your mouth in between squirts of fresh lubricant. It quivers inside you, milking your oral endowment with pulses of vacuum and tender squeezes. The tentacle-girl’s squirting limb floods your cheeks before swallowing it back down in lieu of jism. You get the impression that it would prefer a dick to milk, but you make do, tickling its clit whenever you get the chance and making the feminine vegetation tremble.");
	
	// Bit about reaching orgasm yourself
	output("\n\nYou shudder from the effects of the crotch-heating chaser and the continued stimulation of your body, whimpering into the tentacles slick surface as orgasm begins to work its way through your body.");
	
	// Nippledicks cum
	if(pc.hasDickNipples()) output("\n\nYour [pc.nipples] thicken in their sucking prisons and blast hot [pc.milk] deep into them. Tugging hungrily, the tentacle cunts slurp it down as fast as you can squirt it, squeezing your dick-teats from base to the tip to squeeze out every drop. You didn’t need the help, and arch your back, spewing your hot nipple-load out over and over again. Your breasts soon grow sore, but you keep cumming for her until your [pc.nipples] are over-sensitive and trembling, weakly dribbling [pc.milkColor] for the plants to snack on.");
	// Nipplecunts cum
	else if(pc.hasFuckableNipples()) output("\n\nYour [pc.nipples] are yanked further open than before by the big bulges of cum that slide into them, dilating their tentacular containers with the sheer size of their heady load. Warm plant-goo explodes inside you, frothing around your entrances as the hedonistic dick-tendrils pound you, pumping potent batches of sperm into your [pc.chest] with such insatiable desire that the bulk of it is squeezed back out, running down the bottom of your chest and glazing the tentacles molesting the lower portions of your body. Your [pc.nipples] are spasming throughout this, releasing so much of their own secretions that it actually discolors the venus pitcher’s load as it drips out to be absorbed by the plant.");
	// Tentacles cum on your nipples while {optional: milking}
	else {
		output("\n\nYour [pc.nipples] are suddenly covered with explosions of girl-cum, and a moment later, they’re sucked dry, the tentacle-cunts heaving as they slurp down every drop of moisture.");
		if(pc.isLactating()) output(" Your [pc.milk] pours out in response. The greedy mouths pull all it so deeply inside that you don’t see a single bead leak out. Groaning, you arch your back through your own orgasm, turned into little more than a milky, cumming cow for this creature to milk as long as it wants. The thought seems to spur your [pc.chest] to let your lactic lust flow more freely.");
		else output(" They get little from you but moans and pleasure, but that seems enough for the tentacles, pulling and sucking harder in between explosive bursts of feminine climax. One second you’re arching your back into the aching pull, the next you’re groaning as slippery moisture bathes your sore nipples. All you can do is writhe and cum your brains out, drooling around the fleshy, viridian tube in your mouth while you’re toyed with.");
	}
	// Dicks cum
	if(pc.hasCock()) {
		output("\n\nFluttering wildly, the tubes sucking your [pc.cocks] bathe ");
		if(pc.cockTotal() > 1) output("them");
		else output("it");
		output(" in heavy flows of lubricating cunny juice just before they slurp it all back in, squeezing you to an orgasm.");
		if(pc.balls > 1) output(" The way the smaller tentacles wring and caress your balls throughout, it’s like you’re being milked of cum, forced to give it up to feed this perverse plant woman.");
		else if(pc.balls == 1) output(" The way the smaller tentacles wring and caress your lonely ball throughout, it’s like you’re being milked of cum, forced to give it up to feed this perverse plant woman.");
		else output(" The way the tentacle in your ass is pushing on your prostate, rolling back and forth across the sensitive organ, it’s almost like you’re being milked of cum, forced to give it up in order to feed this perverse plant woman.");
		output(" The thought doesn’t bother you in the slightest, as you’re squirting so hard that it almost hurts. You launch volley after volley as hard as you can into the slippery folds");
		if(pc.cumQ() >= 200 && pc.cumQ() <= 1000) output(", bulging them with your sheer virility.");
		else if(pc.cumQ() > 1000) 
		{
			output(", bulging them with your sheer virility while the excess spatters out around their entrances, dripping down your [pc.legOrLegs]");
			if(pc.cumQ() >= 8000) output(" and filling a good portion of the bulb’s bottom");
		}
		output("."); 
	}
	// Cunt-tail cums
	if(pc.hasCuntTail()) {
		output("\n\nA satisfied sigh slips out around the tentacle plugging your maw as you bask in the sensation of drinking so deeply with your [pc.tailgina]. It is a deep-seated satisfaction of a whole different kind than the explosions of bliss rocking your body. Tingles of that contentment radiate up and out through your spine, making your eyelids heavy and your body very, very happy to have fed the omnipresent seed-hunger from your tail. Some of the cream drips out around the entrance as it’s fucked, but you don’t mind - the pitcher plant has put so much sticky jism inside that you’re sure it’ll be fine.");
	}
	// Cock-tail cums
	else if(pc.hasCockTail()) {
		output("\n\nEruptions of tail-spunk stuff up the hungry tentacle behind you. The entire length of your [pc.tail] dilates with each pulse of cum, depositing it into the slippery maw that’s juicing around it. Your tail pistons and pumps into the greedy receptacle, trying its damnedest to inseminate it, even though the hollow tentacle is simply drinking down the protein as a snack. You spend your cum until your [pc.tailCock] is twitching and bucking but barely leaking the tiniest drops of spooge.");
	}
	// cunts cum
	if(pc.hasVagina())
	{
		output("\n\nFlutters of ecstasy reach through your [pc.vaginas] and squeeze out ");
		if(pc.isSquirter()) output("squirts");
		else output("trails");
		output(" of lady-spunk, just in time for your female orifice");
		if(pc.totalVaginas()) output("s");
		output(" to be stuffed to capacity by thick, sticky, plant cum. It fills every crease and crevice");
		if(!pc.hasPregnancy()) {
			output(", even flooding straight into your empty womb");
			if(pc.vaginaTotal() > 1) output("s");
		}
		else {
			output(", though it cannot reach your closed-off womb");
			if(pc.totalPregnancies() > 1) output("s");
		}
		output(". You whimper as the fat cock");
		if(pc.totalVaginas() > 1) output("s flare");
		else output(" flares");
		output(" wider inside you, sealing the next bursts of spunk into your passage so that the only thing to escape is your own secretions.");
		if(pc.totalVaginas() && !pc.hasPregnancy()) output(" Your [pc.belly] bloats a little under the forceful insemination, rubbed tenderly by other trembling stalks as you’re filled.");
	}
	//0 = not knocked up. 1 = converted to carrier. 2 = fertilized.
	var knockUpPass:int = 0;
	if (pc.hasVagina() && tempVags.length > 0) 
	{
		for(var i:int = 0; i < tempVags.length; i++) {
			//If Knock
			if(pc.loadInCunt(chars["VENUSPITCHER"], tempVags[i]))
			{
				//Seed carrier
				if(pc.hasPregnancyOfType("VenusPitcherSeedCarrier"))
				{
					trace("Venus Pitcher unfertilized pregnancy started.");
					knockUpPass = 1;
				}
				//Convert to fertilized carrier
				else
				{
					trace("Venus Pitcher pregnancy upgraded to fertilized.");
					if(knockUpPass != 1) knockUpPass = 2;
				}
			}
		}
	}
	// Pass out
	output("\n\nAt once, the strength goes out of the restraints holding you up, and you fall into a puddle of mixed sensual fluids, sore from [pc.nipples] to [pc.butt] and covered in ropes of plant cum that still fall on you from time to time. A vague thought that you should be alarmed by the situation surfaces, but it vanishes in a flash, disappearing in a tired sneeze. Your body is pushed, stroked and prodded gently, lifted into a more comfortable position.");
	output("\n\nA female voice coos, <i>“Thanks for the meal. I’ll take care of your...”</i>");
	processTime(40+rand(10));
	pc.orgasm();
	//[Next]
	clearMenu();
	addButton(0,"Next",tentacleJamAftermath,knockUpPass);
}

public function tentacleJamAftermath(knockUpPass:Number = 0):void {
	clearOutput();
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("You waken alone in the jungle with no sign of the venus pitcher that had her way with you.");
	if(!pc.canLactate()) {
		pc.boostLactation(10);
		if(!pc.canLactate()) output(" Your breasts are no longer swollen or lactating at least, thank god.");
		else output(" Your breasts seem to be producing milk on their own now....");
	}
	else 
	{
		if(pc.milkRate < 15) 
		{
			pc.milkRate++;
			output(" Your breasts seem to be churning, making [pc.milk] faster than before.");
		}
	}
	if(knockUpPass == 1)
	{
		output(" More alarmingly, your belly is much larger than before the encounter, rounded as if gravid with young. <b>There’s no doubt in your mind - you’re pregnant with the floral waif’s offspring.</b>");
		//Laid either of them.
		if(StatTracking.getStat("pregnancy/unfertilized venus pitcher seeds") + StatTracking.getStat("pregnancy/venus pitcher seeds") > 0)
		{
			output(" You shiver at the remembered pleasure and rub your [pc.belly] fondly. You’re going to have a wonderful time with these....");
		}
	}
	output("\n\nThe playful plant must be sleeping or hiding underground.");
	output(" A slimy puddle on the ground holds your [pc.gear].");
	pc.orgasm();
	processTime(200+rand(60));
	clearMenu();
	if(venusFlowerDrops()) addButton(0,"Next",venusPitcherBonusFlower);
	else addButton(0,"Next",mainGameMenu);
}
	

//*Elder Pitcher Plant Encounter
public function elderVenusPitcherEncounter():void {
	showBust("VENUS_PITCHER_ELDER");
	showName("VENUS\nPITCHER");
	CodexManager.unlockEntry("Venus Pitchers");
	if(venusSubmission() >= 100)
	{
		venusBadEnd();
		return;
	}
	//*First Time
	if (flags["TIMES_VENUS_PITCHER_ELDER_ENCOUNTERED"] == undefined) {
		flags["TIMES_VENUS_PITCHER_ELDER_ENCOUNTERED"] = 1;
		output("\n\n<i>“Excuse me,”</i> greets a melodious voice, pulling you towards it on invisible, auditory strings. You find the source of the beautifully enunciated words almost immediately - a tall woman with surprisingly pert E-cup breasts hanging bare in the breeze. Her hips flare wide enough for you to unconsciously think of them as “breeding hips.” Sniffling uncomfortably, you realize that you’ve found another venus pitcher!");
		output("\n\nSeeing your adopted stance, she soothingly pleads, <i>“Oh my, you look so tense.”</i> Her hands rise up to cup the bottoms of her perky tits, rubbing her thumbs in slow circles around her nipples. <i>“I can help you relax, you know.”</i>");
		output("\n\nYou sneeze and shake your head, catching yourself before you wind up watching and listening without thinking.");
		output("\n\n<i>“There’s no need to be so reluctant, " + pc.mf("handsome","cutey") + ",”</i> the plant-woman purrs as her hips slide back and forth hypnotically, matching the tempo set by her slowly circling fingertips. <i>“Besides, there’s no harm in watching, right? You know I can’t fuck you senseless unless you come to me, so you’re safe. You have total control here.”</i> Her nipples are a deep, dark green that contrasts wonderfully with the rest of her, easy to focus on and difficult to not have your eyes drawn to whenever you look away. The way her fingers circle the dusky buds doesn’t make it any easier to avoid gazing upon them.");
		output("\n\nOlive green hips wiggle back and forth just fast enough to make the hypnotic beauty’s tits tremble as she gropes them. Her long, leaf-like tresses sometimes sway in front of her nipples, but you know when they’ll peek out the other side. Like clockwork they emerge, glistening as if oiled, just like the rest of her. The venus pitcher’s fingers are still circling her nubs. Her hips are still rolling back and forth, undaunted by a sudden sneeze from you. There really doesn’t seem to be any harm in this at all.");
		output("\n\nViridian lips purse in a friendly smile to say, <i>“See? There’s no danger here. You’re welcome to watch me dance for as long as you want.”</i> The leafy seductress leans low so you can see the engorged profile of her nipples, flicking their tips in the middle of each slow circle that her thumbs make around them. <i>“Stay a while. You can let yourself just fixate on my nipples and enjoy the way I’m making you so hot and horny without any worry at all.”</i>");
		// Will based check with bonus for psionics
		if(pc.willpower() - pc.libido()/3 + rand(20) + 1 > 9) 
		{
			output("\n\nYou COULD sit there and watch her, but you have a feeling that there were other things you came out here to do. Do you look away or continue to watch?");
			//[Watch] [Look Away] - watch as per fail.
			clearMenu();
			addButton(0,"Watch",watchElderVenusPitcher);
			addButton(1,"Look Away",lookAwayFromElderVenusPitcher);
		}
		else {
			clearMenu();
			addButton(0,"Next",watchElderVenusPitcher);
		}
	}
	//*Repeat
	else {
		flags["TIMES_VENUS_PITCHER_ELDER_ENCOUNTERED"]++;
		if(rand(3) == 0) output("\n\nA lilting voice rises up to call, <i>“Hail, traveler! Tell me, could you spare a drink for a thirsty matron? I appear to have misplaced mine.”</i>");
		//(2)
		else if(rand(2) == 0) output("\n\nA gentle drawl hooks your [pc.ears]. <i>“Well hello there, cutey. Wanna come over here and sit for a spell? I’m plum tuckered out!”</i>");
		//(3)
		else output("\n\n<i>“Hello! Are you busy? I could use someone to talk to,”</i> a methodically lilting voice inquires.");
		
		output("\n\nYou turn to regard the source of the noise with an easy, unguarded motion. The mouth-wateringly tempting vision your roving gaze discovers is beyond what you expected: a curvy woman barely covered in a deep green chemise. Her hair is long and lustrous, emerald tresses that shine in the few rays of light to penetrate this area. You lean in for a closer look and realize that her garments and “hair” are actually comprised of leaves and vines, though woven in ways that create quite an alluring look. The stuffy jungle surroundings do little to dim her beauty, though you realize almost immediately that she must be a venus pitcher.");
		
		output("\n\n<i>“Awww, you know what I am, don’t you?”</i> she pouts in a voice quite different from the one she greeted you with.");
		output("\n\nYou smirk a little and answer ");
		if(pc.isNice()) output("that you do.");
		else if(pc.isMischievous()) output("that you might.");
		else output("that you do. What kind of idiot falls for a trap that obvious?");
		output("\n\nThe venus pitcher runs her hands across her big, bouncy breasts - easily the size of F-cups on a human girl - and asks, <i>“Well, I am quite lonely. Perhaps you’d stick around and let me put on a show for you?”</i>");
		
		output("\n\nOh this again. You already ran into a venus pitcher that tried this song and dance on you, and ");
		//[HASNT BEEN HYPNOED EVER]
		if(flags["TIMES_CAUGHT_BY_ELDER_VENUS_PITCHER"] == undefined)
		{
			output("it didn’t work then. The idea does remain rather appealing to you. Do you stay for the show?");
			//[Yes/No]
			clearMenu();
			addButton(0,"Stay",agreeToStayForRepeatVenusLovings);
			addButton(1,"No",noRepeatElderVenusPitcher);
		}
		//[BEEN HYPNOTIZED]
		else {
			output("it worked so very, very well. Every erogenous zone on your body begins to tingle and engorge at the memory of your submission. It was damn hot! ");
			var bonus:Number = Math.round(venusSubmission()/100 * 30);
			if(pc.willpower() - pc.libido()/3 + rand(20) + 1 > 9 + bonus) {
				output("Do you stay and watch the show again, knowing what will happen?");
				//[yes][no]
				clearMenu();
				addButton(0,"Yes",yesRepeatElderVenusPitcher);
				addButton(1,"No",noRepeatElderVenusPitcher);
			}
			else {
				output("You briefly consider leaving, but the pleasant memories keep you firmly rooted in place.");
				clearMenu();
				addButton(0,"Next",agreeToStayForRepeatVenusLovings);
			}
		}
	}
}

//[No]
public function noRepeatElderVenusPitcher():void {
	clearOutput();
	showBust("VENUS_PITCHER_ELDER");
	showName("VENUS\nPITCHER");
	output("You turn away before she snares you with her looks, stepping a few extra feet away for good measure. There’s a muffled thump, and when you glance back, you realize she’s disappeared into the ground, unlikely to be seen again.");
	clearMenu();
	if(venusFlowerDrops()) addButton(0,"Next",venusPitcherBonusFlower);
	else addButton(0,"Next",mainGameMenu);
}
//[Yes]
public function yesRepeatElderVenusPitcher():void {
	clearOutput();
	showBust("VENUS_PITCHER_ELDER");
	showName("VENUS\nPITCHER");
	output("You shrug and decide to let the show play out this time, locking your eyes on her tits as she playfully jiggles and bounces them for you. Her hips sway from side to side, and puffs of particulate briefly cloud the air behind her, drawing your eyes to her flaring waistline. You flick your eyes back up to her tits with her deep, dark nipples.");
	output("\n\n<i>“Ah, see something you like then, traveler? Go on and watch then, I’ve been told that my shape is particularly pleasing to look upon. Genitalia have a way of swelling up in my presence, no?”</i>");
	
	repeatVenusPitcherHypnoGo();
}

// Agree to stay
public function agreeToStayForRepeatVenusLovings():void {
	clearOutput();
	showBust("VENUS_PITCHER_ELDER");
	showName("VENUS\nPITCHER");
	output("You smile at her and eagerly inform her that you’d love another show.");
	output("\n\n<i>“Ahhh, now you’re a person of fine taste, I can tell,”</i> the venus pitcher announces. Her hands begin to playfully jiggle her tits for you, making them bounce and sway in familiar-looking circles. Her hips sway from side to side with the motions, and puffs of particulate briefly erupt from something behind her, barely distracting your eyes from her deep, dark nipples. It’s hard not to look at them, honestly; they’re like magnets for your eyes.");
	output("\n\n<i>“You like them, no? Go ahead and watch then. I can see how you’re getting hornier and hornier just from being around me.”</i>");
	repeatVenusPitcherHypnoGo();
}

//[MERGE]
public function repeatVenusPitcherHypnoGo():void {
	showBust("VENUS_PITCHER_ELDER");
	showName("VENUS\nPITCHER");
	output("\n\nA sneeze erupts from your nose out of nowhere, but by now, you’re used to sneezing in the presence of these beauteous ladies. Something about their spores just tickles your nose, but at the same time, they do make it quite easy to sit there and stare, watching supple, female form twist and writhe for nothing more than your amusement. Arousal builds within you, unchecked by restraint as her words come true, giving you another reason to watch her fingertips mesmerizingly slide across her breasts.");
	output("\n\nSeeing the way you follow her fingers, the pale-skinned dancer begins to use her palm to rotate them at you, even tweaking the hard tips of her nipples as they harden before your very eyes. Tiny puffs erupt from behind her again, and she purrs, <i>“Yes, they are quite entrancing, and they’re getting so hard for you. Surely you can tell, since your eyes have already centered on them. I’m told that after watching for a few moments, they become quite difficult to look away from.”</i>");
	if(flags["TIMES_CAUGHT_BY_ELDER_VENUS_PITCHER"] == undefined) output("\n\nYou smirk and enjoy the show, there’s no way you’ll miss a moment of this.");
	else output("\n\nYou know that all too well, though you have no idea why you’d ever want to stop watching this show. If you did, you wouldn’t get to feel her relax you into a pliant puddle of lust that she can play with.");
	output("\n\nHer fingers tweak the tops of her nipples happily when you fail to avert your eyes, an obvious treat designed to give the viewer pleasure.");
	output("\n\n<i>“Well, you didn’t look away, so that confirms it. My nipples <b>are</b> powerful and hypnotic, and you’re caught in their power, unable to look away, growing more and more aroused. Even now, they’re drawing you deeper into the power, so effectively trapping your eyes that the rest of the world seems to disappear around them; except for my voice, that is. My voice is tied to them, just as importantly as the slowly rotating swells of my tits, fluttering in your ears and relaxing you. Take a deep breath.”</i>");
	
	output("\n\nYou inhale, deeply, and feel more relaxed with every passing second, suddenly aware that her power over you seems to be strengthening. Her nipples... they’re the source of her power! You try to yank your view aside, but all you wind up doing is realizing how wonderfully pebbly her areolae look, how sinfully succulent her breasts are, and how deeply they’ve rooted themselves into your consciousness. Each breath you take reminds you of the time you were in a dusty old attic, only less irritating and more relaxing, compounded by the way your verdant mistress sways her body.");
	
	output("\n\nThe venus pitcher smirks, though her expression remains beyond the parts of your view that you’re aware of. <i>“Don’t try and fight it. When you fight, my nipples get harder, and when they get harder, their power grows more compelling.”</i> She tweaks a nipple and tugs, causing it to stand out a bit more proudly. <i>“Uh oh, there’s no way you’ll escape now. They’re so puffy and potent, and you’ve been watching them soooo long.... You can probably see them on the inside of your eyelids whenever you blink, still moving, still hypnotizing you.”</i>");
	
	output("\n\nYou force a blink to test her theory, and again, the words ring true. Those juicy, bouncy plant-breasts are still there, still bouncing... still compelling you to watch. You whimper at the realization that you can’t break free.");
	
	output("\n\n<i>“I told you, and honestly, you should have known better than to stay around me this long. I’ve been filling the air with my spores, and those same spores are what have been making you feel so blissfully pliant and suggestible, so easily hypnotized. My tits have you trapped in their power, and every breath you breathe is deepening their control over you. Control that is slowly, inexorably doing away with all your worries and resistance,”</i> the pitcher woman proudly declares.");
	
	output("\n\nOh it’s true! You’re finding it harder and harder to wonder why you were even considering resisting. You’re growing quite comfortable and relaxed, just watching and breathing deeply, her nipples keeping you horny, even when you blink.");
	
	output("\n\nThose pendulous, hypnotic jugs slap together as they’re moved more forcefully, more aggressively. Their owner coos, <i>“And as you grow more relaxed and more aroused, it stops being just worries that are vanishing. Your thoughts are being smoothed away by my control, dissipating as you come to the realization that since I control you this effectively, I can tell you what to think. And right now, I’m telling you to empty your mind of everything but my voice and my control.”</i>");
	
	output("\n\nQuiet settles over your mind like a warm, foggy blanket, tucking each and every errant musing into a hidden corner where it cannot trouble your consciousness any longer.");
	
	output("\n\n<i>“It feels so good to sink that deeply into my power, so blissfully and relaxing. Let yourself float further and further into my control. Let your mind drift even as your most erogenous places become tender and achingly sensitive. Let your hands explore those places now as you focus on the wonderful feeling of allowing me to control you, allowing me to fill your mind and body with such pleasure.”</i>");
	
	output("\n\nYour mind drifts across a sea of hypnotic breasts while your hands plunge unhindered onto your most erogenous places, groping and squeezing passionately. You let out a completely unrestrained moan. No sense of propriety or inhibition regulates your vocalizations; they’re loud and almost... proud. The pleasure is welling up warm and hot within you, spurring you to continue your automolestation.");
	
	output("\n\nThe sensuously stacked slut coos, <i>“Come closer.... Come closer so that my breasts and nipples can ensnare you further. There’s nothing to worry about here, nothing except the chance of you missing out on a wonderful time. And as ensorceled as you are, there’s no chance of that. Come here and sink deeper for my breasts, pet. Let them smother your mind in ecstasy.”</i>");
	
	output("\n\nHer breasts get bigger and bigger in your fixated view, bouncing and jiggling in their hypnotizing circles as you breathe in more and more of her relaxing spores. Your mind is empty and relaxed. Your hands are busy groping your body. You are, in a word, helpless, subject to this busty flora’s whims. Her soothing whispers draw you in like a moth to a flame, irresistibly tugging on you with half-thought, unformed need that makes your [pc.legOrLegs] slowly advance. The power she radiates seems more intense the closer you get to her mammoth tits, so strong now that the tiny whispers that lick at the back of your mind are winking out one by one, disappearing into blissful obedience.");
	
	output("\n\nStumbling, you snag on the edge of an unseen, unnoticed hole and begin to fall. Hypnotized as you are, you don’t even windmill your arms. You just watch the juicy, mesmerizing tits get closer, lacking the foresight to realize that your fall could take them out of sight forever....");
	
	output("\n\nSlap! Your face plants into the mind-melting cleavage while arms catch you. The venus pitcher is supporting all of your weight on her lithe frame somehow, and you’re too blissed out to wonder why. You nuzzle her soft teats happily as your groping takes on a new urgency.");
	
	output("\n\n<i>“Oh, you’re lucky you have me here to take care of you, pet. You might have gotten hurt! Just let me take care of you - I’ll even do all the thinking for your poor, sluggish brain. Every word you obey feels like a tongue licking at your genitals. Feel them, pet. Feel the tongues,”</i> the floral woman instructs. Oh wow, you feel them - do you ever! Hot, wet organs slipping and sliding on your skin. <i>“This close, you’re so firmly in my power that my words can slide right into that malleable little organ, teaching you the proper way to think. Nod for me, now.”</i>");
	
	output("\n\nYou nod.");
	
	output("\n\n<i>“Good " + pc.mfn("boy","girl","pet") + ". Now, let’s go deal with that mounting lust, shall we?”</i> You sag into her grip as your ardor becomes more and more potent on command, threatening to overwhelm you. Up becomes down and down becomes up as you’re spun about and placed in a dark cave, your face still smothered in juicy green jugs. This should be alarming you, but it isn’t. All you can think about is how good it feels to give in to her and how powerful her breasts are. You do as you’re told and let her take care of you, her words nestling deep into you.");
	
	output("\n\nSlippery wet flesh coils up from below to encircle each of your limbs in vice-tight grips. As you’re bound and suspended in the air, face still tit deep in boob, you become aware that the things suspending you are tentacles - slippery, squirming tentacles. Their moisture soaks your [pc.skin] so thickly that it drips from your fingertips and runs down your [pc.belly]. Their touch is skillful and erotic, tantalizing your overly aroused mind with the way that they touch and slide like sexual organs, touching every nook and cranny of your form.");
	
	output("\n\n<i>“You’re so ready to be properly touched... to have your lust fed into a bonfire of need and then milked from you with slow, deliberate orgasms. Just lie back and obey my instructions. Obey them so wholly that they stop becoming powerful instructions and turn into compulsive thoughts of your own,”</i> the potent voice purrs as you’re stretched and suspended upside down, completely naked. Your arousal is totally exposed to her, though this is a blessing, since you’re awaiting the pleasure you’ve become conditioned to expect. The tongues you’ve been feeling have brought you to a precipice, and the feeling of pure, distilled excitement threatens to explode out of you already");
	if(flags["TIMES_CAUGHT_BY_ELDER_VENUS_PITCHER"] != undefined) output(", even though you’ve been here before");
	output(".");
	pc.changeLust(55);
	//To Appropriate Venus pitcher milking!
	processTime(5+rand(5));
	elderVenusFuckSelect();
}

//[Look Away]
public function lookAwayFromElderVenusPitcher():void {
	clearOutput();
	showBust("VENUS_PITCHER_ELDER");
	showName("VENUS\nPITCHER");
	output("You turn away, much to the indignity of the leafy succubus behind you. After a few pleading statements fail to entice your attention, she curses loudly then goes silent. There is a rather final sounding “sklultch” from behind you. Perhaps she went back into her pod?");
	//To room desc, no venus proc.
	clearMenu();
	if(venusFlowerDrops()) addButton(0,"Next",venusPitcherBonusFlower);
	else addButton(0,"Next",mainGameMenu);
}

public function watchElderVenusPitcher():void {
	clearOutput();
	showBust("VENUS_PITCHER_ELDER");
	showName("VENUS\nPITCHER");
	output("Of course! This is making you feel pretty hot, and you wouldn’t mind staying to see just what all this fine-ass piece of flora can do with the humanoid portion of her body. Like she said, you’re safe over here, so she’s harmless. You’ll watch her and her nipples more – at least until you get tired of it.");
	output("\n\nBack and forth, her fingers slide across her moist, pebbly protrusions, dulling your wits with mounting lust. You sneeze again, barely noticing aside from when the action causes you to momentarily lose sight of her emerald peaks, but her hips catch your eyes with their slow back and forth waggle, dragging you right back to watching those proud, puckered nipples.");
	output("\n\n<i>“They’re hard to look away from aren’t they?”</i>");
	output("\n\nYou nod, still watching.");
	output("\n\n<i>“That’s understandable. My nipples are quite mesmerizing,”</i> she explains, lifting her chest towards your face for emphasis.");
	
	output("\n\nYeah they - wait, what?");
	
	output("\n\nThe seductive plantress begins to guide her breasts in small circles, clapping the hefty orbs together into a mountain of cleavage at the innermost part of the rotation. She says, <i>“It’s true. The longer you watch my nipples, the harder you </i>");
	if(pc.hasCock()) output("<i>get</i>");
	else output("<i>make them</i>");
	output("<i>, and the harder you </i>");
	if(pc.hasCock()) output("<i>get</i>");
	else output("<i>make them</i>");
	output("<i>, the harder it becomes to look away. And you’ve </i>");
	if(pc.hasCock()) output("<i>gotten</i>");
	else output("<i>made them</i>");
	output("<i> very hard, haven’t you? So achingly, soul-wrenchingly hard that a feather’s touch brings on an avalanche of pleasure.”</i>");
	if(pc.hasCock()) output("\n\nYou’re so damned hard! [pc.EachCock] is throbbing powerfully, unrepentant in its lust, already beginning to bead a drop of lusty pre atop its crown.");
	else output("\n\nThey look so damned hard! The way she shudders as her fingers make the circuit leaves you no doubt that she’s loving it.");
	output(" You feel like you should try to avert your gaze or something, but the thought never really gains any traction in your mind. Her nipples are beautiful, sexy and hard to look away from. There’s no downside to watching them, so why struggle not to? Even blinking is getting kind of hard; they’re THAT hard to look away from.");
	output("\n\nSeeing the water beading at the corners of your eyes, the grinning babe prattles on, <i>“Since you’ve been looking at my nipples for so long and the way my fingers trace around their perimeter is so memorable, you can actually still see them even when you close your eyes or when a leaf obstructs your view. Blinking is easy because in your mind you’re still watching my nipple, still fixated on the way it shines and beckons to you, entrancing you so deeply that looking away seems profoundly and deeply wrong.”</i>");
	
	output("\n\nYou close your eyes and bask in the relief, still watching her digits caressing her areolae in your mind’s eye until you’re gazing upon them in the real world again. The sneeze that rocks your head back doesn’t even phase you - just like when you blinked, you watch her nipples in your mind until you’re able to zero in on them once more. They’re so entrancing that you could just watch them all day. Maybe you will.");
	output("\n\n<i>“Good " + pc.mfn("boy","girl","pet") + ",”</i> the owner of the hypnotic bust moans, <i>“Every circle my thumbs take around these beautiful, suckable nipples is reminding you of why you started watching me in the first place. They’re so alluring and inviting, and the way you’re focusing on them makes it difficult to think of anything beyond the world of these mesmeric knockers. Really, it’s not just the nipples anymore, the boobs have you, too, trapped in their spirals as I gently squeeze and move them, smushing them together for you to ogle until your brain shuts down completely. It feels good to let yourself go, to focus on how hot </i>");
	if(pc.hasCock()) output("<i>and hard</i>");
	else if(pc.hasVagina()) output("<i>and wet</i>");
	else output("<i>and lusty</i>");
	output("<i> I can make you feel.”</i>");
	
	output("\n\nStanding there open-mouthed, you watch, drooling a little and not stifling your sneezes in the slightest. Even without her instructions, you didn’t seem to be at one hundred percent here, but at least now you can let it go and just... stare, letting yourself unashamedly leer at this alien babe’s knockers as she caresses and shakes them for you. It’s euphoric in an arousing way. One of your hands begins to grope your own body. You can’t muster the thoughts to stop it, either.");
	output("\n\nThe verdant maiden purrs, <i>“You don’t need to touch yourself. You know you could walk up to me, and I would make you feel so good.”</i>");
	output("\n\nYou mumble something that sounds like, <i>“Can’t fuck everything I meet.”</i>");
	
	output("\n\nIn a voice so throaty and lustful that it makes your [pc.legOrLegs] shudder, the venus pitcher woman answers, <i>“You can make an exception for me and my sisters. We don’t want to do anything bad to you</i>");
	if(rand(3) == 0) output("<i>; we just want to make you feel good for as long as possible and help you cum out all that pent-up, nasty tension whenever it rises up inside you</i>");
	else output("<i>; we just want to make you feel very good while we milk you and fuck through as many orgasms as possible</i>");
	output("<i>. What’s not to love? Honestly, I’d be surprised if you weren’t already rationalizing a reason to crawl into my arms and let me and my perfect tits take you to a paradise beyond imagining, </i>");
	if(pc.hasCock()) output("<i>one that will make your [pc.cocks] melt</i>");
	else output("<i>one that will make your [pc.vaginas] melt</i>");
	output("<i>.”</i>");
	
	output("\n\nYou shudder and groan with pent up, lusty frustration. She’s right, of course. Her breasts are so wonderfully, kissably soft, and she doesn’t want to hurt you, just make you cum out all the tension you’ve built up from watching her.");
	
	output("\n\n<i>“That’s it. Come closer, my good " + pc.mfn("boy","girl","pet") + ",”</i> the big-breasted plant-woman says encouragingly, <i>“Don’t think, just let my words filter into your empty, breast-locked mind. It feels good to stay empty and obey. It feels good to let my spiraling boobs draw you closer and closer. Letting go and accepting my thoughts as your own feels like tongues on your genitals, licking and lapping and teasing you to a glorious new high.”</i>");
	
	output("\n\nWhimpering slightly, you take one staggering ");
	if(pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE) || pc.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output("step");
	else output("movement");
	output(" forward after another, shedding your gear as you go. She won’t hurt you. Her words are like tongues of honey sliding all over your mind and body, guiding you closer, drawing you nearer with each passing second. It feels so good to let her control your mind, to steer you into erotic indulgence of her every enunciation. Verdant breasts grow larger in your view, and you find their effect on you intensified the closer you get and the more of the stuffy air around her that you breathe in.");
	
	output("\n\nYour [pc.foot] catches on the edge of a hole and you stumble, about to fall head over heels into a pit, but the venus pitcher catches you in her jiggly bosom, holding you aloft with surprising strength while your face presses into her heavenly, mind-softening mammaries.");
	
	output("\n\n<i>“I’d never let you fall in there and get hurt. <b>My sisters and I know what’s best for you.</b> Just relax, and <b>let me think for you</b>,”</i> the floral woman promises. Your body slumps nervelessly in her arms, inundated with lust and hypnotized obedience.");
	
	output("\n\nShifting slowly, gravity seems to spin around you, tugging on your body in different ways while your face remains steadfastly planted in the plant-boobs. The motion ceases once you feel suspended upside down. A tiny, mental voice whispers that you should be alarmed at this, but you know that you’re safe with the venus pitcher and in complete control. You’re simply enjoying the show and how good her words can make you feel, particularly when you obey them without questioning their meaning.");
	
	output("\n\nThe sound of flesh squirming against flesh penetrates your chesty prison a moment before pillars of muscle surround your arms, [pc.belly], and [pc.legOrLegs]. Their skin is smooth, lubricated with some kind of slick moisture that drips in long rivulets along your body, and they clutch you tightly with the kind of intimacy that no human body could hope to match. You feel almost sullied by the way they lewdly slide across your [pc.skinFurScales] until a gentle shushing soothes your nerves, helping you to resume your fully relaxed state while you’re peeled away from the curvy sprout-girl.");
	
	output("\n\n<i>“Now, you just lie back there, and I’m going to make you cum so very, very well,”</i> the beautiful, mesmerizing voice instructs you as you’re stretched out and suspended upside down, naked and exposed, your aroused genitalia fully on display. Blood rings in your ears as your excitement ticks up a pace; obeying her has made you feel a multitude of tongues exploring every sensitive fold of skin and erogenous zone for some time now, and you feel as on-edge as a teenager about to have " + pc.mf("his","her") + " first sexual experience.");
	pc.changeLust(100);
	processTime(5+rand(5));
	//Choose appropriate genitalia to abuse!
	//Next
	elderVenusFuckSelect();
}

public function elderVenusFuckSelect():void {
	var choices:Array = new Array();
	if(pc.hasCock()) choices[choices.length] = elderVenusPitchersDickplay;
	if(pc.hasVagina()) choices[choices.length] = elderVenusPitchersPlayWithCooches;
	if(pc.hasDickNipples()) choices[choices.length] = elderVenusPitcherDickNipplePlay;
	if(pc.isLactating() && !pc.hasDickNipples()) choices[choices.length] = milkyElderPitcherPlantPlay;
	if(pc.hasTailCock()) choices[choices.length] = elderPitcherPlantTailCockPlay;
	if(pc.hasTailCunt()) choices[choices.length] = elderVenusPitcherPlaysWithTailcunts;
	clearMenu();
	addButton(0,"Next",choices[rand(choices.length)]);
}

// Dicks
public function elderVenusPitchersDickplay():void {
	clearOutput();
	showBust("VENUS_PITCHER_ELDER");
	showName("VENUS\nPITCHER");
	output("A tentacle almost as big as your torso appears in front of you, swaying slowly back and forth before you. Its end is an open, sucking hole, adorned with perhaps a dozen purplish bulbs around the entrance that pulse merrily. Inside is a sea of wriggling, writhing flesh: sensuous purple-green folds, wiggling cilia, and tight rings of muscle to squeeze and caress. The juice dripping from it smells sweet, almost honeyed, and it oozes out all over your crotch, soaking your [pc.cocks]");
	if(pc.hasVagina()) output(" and [pc.vaginas]");
	output(" with slippery wetness as it bobs above.");
	
	output("\n\n<i>“This is going to feel so good for us, pet,”</i> the upside down woman’s voice assures you. Her body sways forward, planting her breasts back around your [pc.face], and she begins to run her fingers ");
	if(pc.hasHair()) output("through your [pc.hair]");
	else output("over your head");
	output(" comforting. <i>“Close your eyes and savor the sensations. This is what it feels like to feed a venus pitcher.”</i>");
	
	output("\n\nWithout another word, you’re treated to the feeling of having your [pc.cocks] enveloped in a wave of heated suction, noisily slurped into the grasping, squeezing maw of the gigantic tentacle. The slippery folds slide over you, delivering agonizing waves of pleasure so intense that your eyes roll back - even though you have them closed, as instructed. [pc.EachCock] thickens perceptively under the pleasurable deluge, and you become aware of the tickling of hundreds of cilia on different parts of your maleness");
	if(pc.cockTotal() > 1) output("es");
	output(", each licking like a tiny, miniature tongue, lewdly caressing your [pc.skin] with a hunger that borders on obscene. The end of the tentacle constricts powerfully at your [pc.sheath], matched elsewhere along your length by other rings of muscle. They work back and forth and try to get you off with all due haste.");
	pc.cockChange();
	
	output("\n\nA gentle finger slides along the nape of your neck, and your seductress coos, <i>“Don’t hold back for me, lover. The most pleasurable thing you can give a venus pitcher, like me, is a big, fast, orgasm.”</i> She rubs her palm between your shoulders and coos, <i>“Go ahead and cum.”</i>");

	output("\n\nThe inhuman pleasure forced over your [pc.cocks] would have you cumming in moments anyway, but that whispered, hypnotic command wraps around your mind as tightly as the tube wrapped around your penis");
	if(pc.cockTotal() > 1) output("es");
	output(". You give up a bestial grunt into her bosom, muffled by her heavy breasts, and climax, your hips lunging forward with unrepentant desire, the cum bubbling up out of your [pc.balls] like lava from a volcano. There’s a moment of almost agonizing pressure, and then the tube on your dick");
	if(pc.cockTotal() > 1) output("s");
	output(" suctions, speeding your eruption so that you achieve that moment of bliss immediately, dumping pulse after pulse of gooey goodness deep into her tentacle.");
	
	// Low Cum
	if(pc.cumQ() <= 50) {
		output("\n\nAll too soon, you’re spent, slumping back into the floral harness and the breasts before you with a lewd sigh.");
		output("\n\n<i>“Wait, that’s it?”</i> the busty babe asks incredulously. <i>“That can’t... that won’t do!”</i>");
		output("\n\nA distressed thought surfaces in your addled mind: didn’t you do what she told you? You worriedly try to pull away, but a soothing hand tilts your chin, turning you up and to the side until a nipple is in your lips. <i>“Drink.”</i>");
		output("\n\nYou do, swallowing deep draughts of a largely tasteless fluid. It does seem somewhat savory, but you really can’t place the flavor. As you swallow, you feel the telltale engorgement of lust down below and a pinch");
		if(pc.balls > 0) {
			output(" in your [pc.sack] as your [pc.balls] ");
			if(pc.ballSize() < 5) {
				if(pc.balls == 1) output("plumps slightly");
				else output("plump slightly");
			}
			else {
				if(pc.balls == 1) output("grows denser");
				else output("grow denser");
			}
		}
		output(" in your groin, just behind your [pc.cocks]");
		output(". The heat of your orgasm returns in a vengeance, causing you to sputter off the nipple and cry out. Suction begins again at your groin, drinking of the fresh wave of [pc.cum] that your body produces. Your head is jammed back onto the nipple insistently, and you drink for what feels like minutes, cumming and swallowing for what feels like hours.");
		output("\n\nEventually, you lose consciousness, but the [pc.cumColor] flow keeps going, feeding the plant woman’s insatiable thirst....");
		// Good boost to cum quantity and skip to end
		pc.ballEfficiency += 2;
		pc.cumMultiplierRaw += 2;
		if(pc.ballEfficiency/pc.cumMultiplierRaw < 3) pc.ballEfficiency += 2;
		pc.slowStatGain("libido",2);
	}
	// Medium Cum
	else if(pc.cumQ() <= 1000) {
		output("\n\nWith the unrivaled ecstasy you’re being exposed to, your body never seems to stop cumming. Normally, you fire out a pretty large amount of [pc.cum], but today you’re launching huge ropes with wild abandon, flooding the inside of the venus pitcher’s marvelous tentacle with the stuff. It manages to drink it all somehow, though the large bulges distort its shape as they wind back into the “wall” of this chamber. There’s a pinch on your arm - not enough to really rouse your attention but you are aware of it. A moment later, the heat of your orgasm intensifies, and there’s a sense of ");
		if(pc.balls > 0) output("increased denseness in your [pc.sack]");
		else output("tightness in your body");
		output(". Your eyes roll back in your head as you feed the wonderful woman, pouring an almost unending tide of lust straight into her clutching hole.");
		output("\n\nAfter an indeterminate amount of time, the ecstasy does come to end, leaving you exhausted and panting.");
		output("\n\n<i>“You’re going to remember how good this feels,”</i> the venus pitcher says, <i>“and feel drawn to me whenever you have time to come into the woods...”</i> You nod dreamily and pass out.");
		//Small cum volume boost.
		pc.ballEfficiency += .5;
		pc.cumMultiplierRaw += .5;
		if(pc.ballEfficiency/pc.cumMultiplierRaw < 3) pc.ballEfficiency += 1.5;
		pc.slowStatGain("libido",1);
	}
	// High Cum+
	else {
		output("\n\nThere seems to be no stopping the tide of [pc.cum] spraying from your [pc.cocks]. There’s so much that the pleasure-tube massaging your cock");
		if(pc.cockTotal() > 1) output("s");
		output(" bloats from the amount pouring into it, expanding to almost double its size in places down its length. The tip remains stubbornly sealed around your [pc.sheath]. Here and there, beads of [pc.cumColor] escape around it, but the bulk is pumping straight into the venus pitcher’s ravenous stalk, disappearing into the wall of the bulb in explosive waves of gooey, wondrous pleasure.");
		output("\n\nYou can hear the suspended woman groaning in delight while her body devours nearly every single drop. <i>“Oh... wow, you’re so good at this, pet!”</i> Her hands begin to tug on her nipples, and she whimpers a barely controlled command, <i>“Don’t you ever forget me! This feels so good that you’ll want to come back to me every day!”</i>");
		output("\n\nGrunting your assent, you shudder and spend the rest of your virility, embedding the memory in your psyche, knowing that you do want to return to her whenever you’ve got more to give.</i>");
		if(pc.cumQ() >= 4000) 
		{
			output(" There’s so much [pc.cum] that some rather phallic tentacles begin firing your fluid back into the bottom of the pod, keeping it in a lewd reserve as her own storage capabilities are overwhelmed by your immense virility. The ensuing pool ");
			if(pc.cumQ() <= 8000) output("is little more than a puddle, but it’s one you’re proud to have made.");
			else if(pc.cumQ() <= 12000) output("is about a foot deep. A feeling of pride wells up in your breast.");
			else output("gets deep enough that it’s touching you, a tiny lake of food for the feminine flora.");
		}
		output("\n\nOnly after you’re leaking tiny droplets does the pleasure end, leaving you exhausted and satisfied.");
		output("\n\n<i>“This is what comes of obeying a venus pitcher. You’re surely addicted to this, aren’t you?”</i>");
		output("\n\nYou giggle and nod, a little light-headed as you nod off into her breasts.");
	}
	pc.orgasm();
	pc.orgasm();
	processTime(20+rand(10));
	clearMenu();
	addButton(0,"Next",elderVenusPitcherEpilogue);
}

// Vagina!
public function elderVenusPitchersPlayWithCooches():void {
	clearOutput();
	showBust("VENUS_PITCHER_ELDER");
	showName("VENUS\nPITCHER");
	//define X!
	var x:int = pc.cuntThatFits(chars["ELDERVENUSPITCHER"].cockVolume(0));
	if(x < 0) x = rand(pc.totalVaginas());
	output("A tentacle as big as your torso appears in front of you, waving back and forth and leaking a stream of clear-looking juice from a tiny opening on its flared tip. Its surface is a deep emerald in color, sparkling in the dim, inner luminescence of the pod. It angles down to press upon your juicy mons, the tip sliding back and forth across your swollen sex");
	if(pc.totalVaginas() > 1) output("es");
	output(", slipping ");
	if(pc.totalVaginas() > 1) output("from lip to lip");
	else output("over your lips");
	output(" repeatedly and flaring wider in response. It withdraws and leaves your labia soaked and eager. Unfortunately, its blunted head is so massive that there’s no way it could it actually fit inside you, much as you want it to. You’re left to whine and writhe every time it tries again, caressing your vulvae with lewd but unsatisfied attentions.");
	
	output("\n\n<i>“Don’t worry about its size, pet. I know one size doesn’t fit all, and I’ve got the perfect fit, just for you,”</i> the venus pitcher giggles as she smears her gigantic tool across [pc.eachVagina] again");
	if(pc.hasClit()) output(", catching your [pc.clits] repeatedly");
	output(". Another tentacle slithers up alongside it, rubbing across its bigger brother’s length and eventually supplanting it at the entrance of ");
	if(pc.totalVaginas() > 1) output("a");
	else output("your");
	output(" [pc.vagina " + x + "], already slick with the lewd plant’s secretions.");
	
	output("\n\nThe upside down woman sways forward to place her soft bosom around your head, nestling your [pc.face] firmly between the supple mammaries. She coos, <i>“Close your eyes and enjoy it. Really revel in just how good it feels to obey my voice, and let your sense of propriety just melt away.”</i> Immediately, your eyelids feel heavy, like lead weights hang suspended from them, and they drift down until you can see nothing. Your senses focus instead on nuzzling into her chest and enjoying how deliciously slick your sex");
	if(pc.totalVaginas() > 1) output("es have");
	else output(" has");
	output(" become.");
	
	output("\n\nA rigid, blunt tip slowly spreads your folds, sliding between ");
	if(pc.totalVaginas()) output("your ");
	else output("a set of ");
	output(" labia with deliberate, firm force, dilating your entrance with its swollen head and compressing slightly to fit. This makes the friction inside your channel that much more powerful; every fold, nook, and cranny of your cunt receives its fair share of cock to squeeze against. Gushing as it goes deeper, the tendril worms more deeply inside of you, plundering your [pc.vagina " + x + "] with a greedy lunge. The warm pre that seeps from it tingles nicely as it lubricates the passage of this elephantine-feeling member, so copious that some of it drips from your opened entrance in long strands.");
	
	//Vag change.
	pc.cuntChange(x,chars["ELDERVENUSPITCHER"].cockVolume(0));
	output("\n\nGlorious pleasure explodes from your loins as the tentacle yanks back and thrusts forward, punctuated by moments of emptiness that only serve to enhance your enjoyment. You moan sensuously into the plant matron’s tits, shuddering and shaking so forcefully that you make her boobs bounce around your head. She grunts at one particularly forceful thrust, obviously enjoying herself, even though the verdant phallus doesn’t connect to her “body” anywhere that you can see. Faster and faster, her pistoning plant cock plunges in again and, pistoning with enough force that the violent, liquid sound of its passage fills the chamber.");
	
	output("\n\nA gentle voice explains, <i>“Oh, my deeply hypnotized pet, you’re loving it aren’t you? The feeling of being filled with pitcher plant sperm is assuredly superior to that which any male can offer. Your pretty pussy craves the cum. It yearns for it. Feeling it flooding into your pussy");
	if(!pc.isPregnant(x)) output(" and womb");
	output(" is going to make you cum so hard your brain will dribble out of your twat.”</i> A fingertip subtly traces along the nap of your neck. <i>“I hope you’re ready, because I can feel a giant load of it building up.</i>");
	if (pc.isPregnant(x) && pc.hasPregnancyOfType("VenusPitcherFertilizedSeedCarrier")) 
	{
		output("<i> A shame you’re pregnant already, but you’ll come back for more after your pussy gets hooked on being stuffed by my stamen.</i>");
	}
	else output("<i> The feel of it swelling your belly with my seeds is going to be so addictive, matched only by the motherly bliss of laying my seeds in fertile soil.</i>");
	output("<i>”</i>");
	output("\n\nThe tentacle buried in your [pc.vagina " + x + "] bottoms out while the larger, massive tentacle mashes itself against your pubic mound");
	if(pc.hasClit() && pc.clitLength >= 3) output(", allowing your [pc.clit] to slide up its convulsing urethra");
	output(". Both stalks flex, thickening slightly, and rounded bulges begin to gather at their bases, launching through the tubular plant-cocks one after another. ");
	if(!pc.isPregnant(x)) 
	{
		output("Inside you, the flat, flared tip matches perfectly to your cervix, the urethra just barely pushing past the rest of the tip in order to nestle firmly into it. Cum pours out of it in a wave, and as the warm flora-jizz pumps into you, your [pc.legOrLegs] begin");
		if(pc.legCount == 1) output("s");
		output(" to buck and quake with orgasmic, mind-melting bliss.");
	}
	else 
	{
		output("Inside you, the flat, flared tip butts up against your sealed cervix, the urethra desperately trying to match to a nonexistent opening. Cum pours out of it in a wave, and as the warm flora-jizz backwashes out of you, your [pc.legOrLegs] begin");
		if(pc.legCount == 1) output("s");
		output(" to buck and quake with orgasmic, mind-melting bliss.");
	}
	output(" Your tunnel squeezes down around the shaft, trying to milk it for more with its unashamed, lusty spasms.");
	
	output("\n\nGirl-spunk ");
	if(pc.wetness(x) <= 2) output("trickles");
	else if(!pc.isSquirter(x)) output("leaks");
	else output("gushes");
	output(" out around the tendril as it pumps you full, distorting your entrance with the size of the jizz-bulges traveling into you.");
	if(!pc.isPregnant(x)) output(" Your belly slowly bulges with the spewing seed, rounding out into a slightly-pregnant dome while your mind reels with fantasies about birthing smooth seeds that will someday blossom into equally entrancing creatures.");
	output(" A waterfall of musky jism rolls out of your [pc.vagina " + x + "] seemingly without end.");
	if(pc.isPregnant(x)) output(" You actually find yourself wishing you weren’t pregnant, so that you can feel it filling you, stuffing your womb with new life.");
	output(" The bigger tentacle fires cum out like a cannon, ");
	if(pc.hasClit() && pc.clitLength < 3) output("splattering it directly off your [pc.clit].");
	else
	{
		output("forced off your cum-soaked");
		if(pc.hasClit()) output(" clit");
		else output(" slit");
		output(" as it dumps a deluge of spooge over your most sensitive organ.");
	}
	
	output("\n\nYour eyes roll back as the orgasm drags on and on, [pc.eachVagina] writhing in ecstasy");
	if(pc.vaginaTotal() >= 1) output(", even though some are empty");
	output(". A comforting voice instructs, <i>“Cum and cum and cum and cum for me. Remember this pleasure, because your twat is <b>cumming</b> so hard that you’ll want me to seed it every time your womb is empty. You can’t resist. Every lurch of ecstasy in your cunt is conditioning you into a helpless addict.”</i>");
	pc.loadInCunt(chars["ELDERVENUSPITCHER"], x);
	output("\n\nYour eyes roll back and you black out, still orgasming and being painted by the writhing mass of tentacles. Flashes of repeated fuckings, breast suckling, and hot blasts of seed appear in your memory, though you’re never really anywhere near close enough to consciousness to store a cogent record.");
	pc.orgasm();
	processTime(20+rand(10));
	clearMenu();
	addButton(0,"Next",elderVenusPitcherEpilogue);
}


// Dicknipples
public function elderVenusPitcherDickNipplePlay():void {
	clearOutput();
	showBust("VENUS_PITCHER_ELDER");
	showName("VENUS\nPITCHER");
	output(StringUtil.upperCase(num2Text(pc.totalNipples())) + " iridescent tentacles rise up in front you. They’re each about as thick as your arms. Dripping, circular openings appear on the top of them, slowly dilating as they open. Ropes of lubricant drip from the pulsing, toothless maws and hang down, swaying back and forth under the purple-lined holes. Around the entrances of the tendrils, a number of engorged bulbs are visible, almost clit-like in look and design. They close in on your chest, and their purplish-tinged interiors constrict and relax rhythmically, lined with any number of cilia, folded flesh, and muscular rings.");
	output("\n\nYour [pc.dickNipples] swell, distending the surface of your [pc.nipples] before exposing themselves, their surfaces swelling with fresh tumescence, pulsing visibly as they jut from your chest.");
	
	output("\n\n<i>“Quite an unusual set of pointers you have there. Let’s see whether I get milk or honey for playing with them,”</i> the seductive plant-girl wonders aloud. <i>“You just relax and hang out while I milk these puppies-”</i> she tugs on your [pc.dickNipples] eagerly, <i>“-so well that they pop out whenever you think about me.”</i>");
	
	output("\n\Letting go of your chest phalluses, the verdant seductress rocks back, swaying pendulously for a moment before her momentum carries her forward, smushing her big green jugs to either side of your [pc.face], smothering you in those big, soft boobs. You groan in pleasure at having yourself put so close to the objects of your affection, still watching them bounce and spin in your mind’s eye as you lie there, waiting to experience more of the pleasure she’s promised. Your [pc.nipples] are so hard and now that they’re exposed, the feeling of imaginary tongues sliding over them has grown even more potent.");
	
	output("\n\nThat sensation becomes far more palpable a moment later, only it’s happening on every single surface of your dicknipples, surrounding them in a warm, wet surface that tugs and squeezes them relentlessly. Those warm sheaths engulf the entirety of your pricks, and blinded by breasts as you are, your sense of touch is magnified, making the pleasure so exquisite that you begin to leak pre already. Hundreds of cilia stroke and caress you like a swarm of tiny tongues. The nubs at the ends press against your [pc.chest] and close up, sealing up just in time for them to begin sucking slightly, pulsing slow vacuum-powered tugs on your shafts. Circles of pressure constrict around your lengths at various points and begin to drag inward, new ones forming at the bottom of your [pc.dickNipples] whenever they slide past the tips, milking you unendingly.");
	
	output("\n\n<i>“Oh, those are quite nice,”</i> the seductive plant purrs seductively. <i>“Far more fun than a zil with a single ‘stinger’. They are a bit sweeter, of course.”</i> Her attention focuses back on you, and she trails a finger up the nape of your neck, hypnotically stating, <i>“You’re going to cum for me soon, pet. Nobody can resist my tentacles for long, and you don’t even want to resist. <b>You want to cum for them.</b>”</i>");
	
	output("\n\nYou groan as the pleasure seems to intensify, your [pc.dickNipples] getting so hot from all the squeezing and sucking they’re being exposed to.");
	
	output("\n\nHer comforting voice continues, <i>“I know, it just feels so good that that yummy cum is just backing up in your [pc.chest], isn’t it? You FEEL it, so hot, so warm, and just aching to spray out. Just relax, and it’ll come out on its own in a few seconds.”</i> She strokes at the back of your head. <i>“Getting closer now aren’t you?”</i>");
	
	output("\n\nYou nod into her tits, arching your back as far as the iron-strong restraints of her massive tentacles will allow.");
	
	output("\n\n<i>“So... very... close....”</i> the enchanting floral woman says, <i>“You’re a few seconds away.... Let me count them down for you.”</i>");
	
	output("\n\n<i>“Five...”</i>");
	output("\n\nHer tentacles undulate wildly as they begin to piston up and down your [pc.dickNipples], fucking them with fast, lewd strokes.");
	output("\n\n<i>“Four...”</i>");
	
	output("\n\nThe suction doubles in intensity, making your tools throb and ache with pent-up need, spewing trails of pre-cum deep into their lascivious, sucking prisons.");
	
	output("\n\n<i>“Three...”</i>");
	
	output("\n\nA hand caresses your spine, fingers softly playing along your [pc.skinFurScales].");
	
	output("\n\n<i>“Two...”</i>");
	
	output("\n\nYou feel like your [pc.nipples] are about to explode, twitching wildly and arching inside their velvety soft prisons.");
	
	output("\n\n<i>“One...”</i>");
	
	output("\n\nA tsunami of pressure builds inside your [pc.chest], and your body arches so hard that you feel like you’re going to snap your spine in half. You grunt and pant into the boobs, twitching wildly, and you feel the impending pleasure about to fire out of you with the force of a cannon.”</i>");
	
	output("\n\n<i>“Cum for me,”</i> she exhales.");
	
	output("\n\nOrgasm slides over and out of you like an avalanche. Your [pc.dickNipples] twitch, swelling up inside their sheaths, and they spray your [pc.cum] out with such force that it almost hurts. The relief is pulpable, and you groan languidly as your [pc.chest] sprays more and more sloppy [pc.cumNoun] into the tentacle-cunts. The milking, muscular contractions intensify, and your voluminous output is quickly whisked away, leaving you smiling.");
	
	// Small cum amount
	if(pc.cumQ() <= 100) {
		output("\n\nAll too soon, your ecstasy winds down to nothing.");
		output("\n\n<i>“Spent already? Let’s fix that,”</i> the hypnotic beauty comments, pulling you out of her mountainous cleavage and depositing your lips on a leaky nipple.");
		output("\n\n<i>“Drink.”</i>");
		output("\n\nYou obey, feeling a tingle of erotic thrill from that allow, but when the first taste reaches your belly, your lust awakens anew, building to mind-blanking climax in seconds. Your dicks surge back out of their sheaths and to full hardness. Then, you find yourself cumming from the drink alone, spurting fresh ropes of [pc.cum] for your mistress.");
		
		output("\n\n<i>“Atta " + pc.mfn("boy","girl","pet") + ",”</i> she giggles, <i>“Just drink and cum until you can’t anymore. This is the pleasure of a venus pitcher, and you’re going to embed this bliss in every fiber of your being.”</i>");
		
		output("\n\nYou grunt and moan an affirmation from around her teat, but you’re unable to will yourself to stop.");
		output("\n\nConsciousness slowly ebbs from the assault of ecstasy, your last thoughts centered around how you’ll come back here again and again, feeding your lust to the venus pitchers in exchange for the mind-blanking pleasures. Her whispers chase you all the way into sleep, seeding your mind with obedience.");
		//Big cum boost!
		pc.ballEfficiency += 2;
		pc.cumMultiplierRaw += 2;
		if(pc.ballEfficiency/pc.cumMultiplierRaw < 3) pc.ballEfficiency += 2;
		pc.milkInMouth(chars["ELDERVENUSPITCHER"]);
		pc.slowStatGain("libido",2);
	}
	// Medium Cum Amount
	else if(pc.cumQ() <= 1000) {
		output("\n\nAgain and again, you bloat the organic tubes with [pc.cum], never pausing in your ejaculatory madness. The bliss of submitting to your hypnotic mistress seems to make your climax even more potent than normal, but the tentacles pulling on your prick-teats are happy to consume it all, their length distorted with bulbs of [pc.cumColor] delight.");
		output("\n\n<i>“Mmmm, a productive sample,”</i> the hypnotic beauty comments while trying to stifle her own mounts of pleasure. <i>“Keep cumming for me, pet. You’re doing so good. This feels so good that there’s no way anything else is going to compare. Just coming near a venus pitcher is going to remind you of this, and you’ll do it again and again, whenever you feel like you’ve got cum to feed.”</i>");
		output("\n\nYou nod and whimper, still cumming as you slowly lose consciousness from the prolonged climax, your last thoughts dwelling on just how good it feels and how you can’t wait to do this again. Her whispers chase you all the way into sleep, seeding your mind with obedience.");
	}
	// High Cum Amount
	else {
		output("\n\nSoon, the amount of [pc.cum] you’re producing grows so great that the tentacles begin to puff wide, stretched beyond their natural capacity by the volume of your effluence. They stubbornly stay clamped on your [pc.dickNipples]. The pressure is painfully tight. You whimper, but your [pc.cum] doesn’t slow down. The command to climax is too irresistible to deny, and you squirt so much goo down those straining tendrils that some of the other tentacles in the pod begin to weep your leftover [pc.cum] into a pool in the bottom, rapidly rising.");
		output("\n\nThe busty beauty moans, <i>“Sooo good,”</i> as she shakes through her cock-milk induced climax. <i>“Keep cumming, don’t ever stop! Revel in it, pet, and engrave this memory into your mind! You love it here, and you love me, don’t you?”</i>");
		output("\n\nYou nod, believing her words as soon as she speaks them, though consciousness is beginning to fade under this orgasmic onslaught of hypnotic command. <i>“Just keep cumming and focusing on how badly you want to do this again...”</i>");
		output("\n\nYou moan your assent and close your eyes, drifting off to the sound of her voice rearranging your subconscious.");
	}
	pc.orgasm();
	processTime(20+rand(10));
	clearMenu();
	addButton(0,"Next",elderVenusPitcherEpilogue);
}

// Milky Nipples
public function milkyElderPitcherPlantPlay():void {
	clearOutput();
	showBust("VENUS_PITCHER_ELDER");
	showName("VENUS\nPITCHER");
	output(StringUtil.upperCase(num2Text(pc.totalNipples())) + " tentacles appear before you, waving back and forth hypnotically, matching the tempo of the floral mistress’s hands on her bosom that entrances you even now. Their tips are smooth and featureless at first. Then, the emerald-green skin peels back, exposing the tentacle’s true nature - that of a hollow tube with clear, nearly-transparent walls. The sides of the newly-revealed, organic milker - for that is what it reminds you of - bulge out slightly, perhaps to hold some milk. The way they seem to zero in on your nipples confirms your suspicions.");
	output("\n\nA slow, sultry voice tickles your ears, <i>“I can sense a bounty in your bosom, " + pc.mfn("boy","girl","pet") + ". I do hope it isn’t as sickeningly sweet as the zil’s. For now, relax and focus on producing [pc.milk] for me. Let the pleasure wash over your nipples just as my voice does your mind.”</i>");
	
	output("\n\nThe milkers move forward and push against your chest, their surface tingling soft and warm on the [pc.skin] of your [pc.chest] as they seal in place, tugging slightly from the increasing pressure. You groan in excitement, as you obey, focusing on producing milk for your hypnotic mistress to squeeze.");
	
	output("\n\nPale green skin closes in on you as the eager plant-woman takes you into her arms, wrapping them around the back of your head and pushing your [pc.face] as deeply into her bosom is possible. You sniffle a little, perhaps from her spores, and let yourself enjoy being cradled in her cleavage while her fingers gently stroke the back of your head");
	if(pc.hasHair()) output(", running through your [pc.hair]");
	output(". At the same time, the milkers on your [pc.chest] narrow and begin to suck, their stalks lurching wildly from the vacuum pressure. Your [pc.nipples] puff and engorge rapidly, swelling with blood until they’re nearly half as big again as normal. [pc.Milk] beads at the tips and slowly begins to drip down.");
	
	output("\n\n<i>“Let it out...”</i> your favorite venus pitcher instructs. Her hand reaches around to squeeze the underside of one tit, causing you to express a thin flow. You moan at the erotic release as imaginary tongues wrap around each [pc.nipple] and begin to suck, and ");
	if(pc.totalNipples() > 2) output("the rest of your lactic nozzles release");
	else output("your other lactic nozzle releases");
	output(". Dozens of tiny tendrils emerge from within the larger, hollow tube and reach for your gushing [pc.chest], matching the tongues licking at your mind with the physical caresses of slippery tentacles. More and more [pc.milk] expresses in response. You moan quite loudly into the plant’s soft boobs.");
	
	output("\n\nGiggling in response, the wonderful woman shifts your head to suckle one of her tits, saying, <i>“You can never be milked enough, so why don’t you take a drink and let me help you be a little more productive for your favorite venus pitcher?”</i> She gently pries you from your breasty heaven and shifts you to put your lips on her own nipple, already beading with a thick, white fluid. The taste is vastly different from milk, a little sweeter and with an undercurrent of tang. That isn’t to say that it’s unpleasant - quite another thing entirely. From the moment it hits your tongue, you find yourself suckling like a hungry babe, slurping as hard as you can in order to get more of the delicious treat into your belly.");
	
	output("\n\n<i>“That’s a good pet, drink alllll your medicine.”</i>");
	
	output("\n\nYou wanted to already, so her words dig deep into your subconscious, ensuring that you’ll drink every drop of “medicine” she’s willing to offer. After each successive swallow, burgeoning heat blooms in your [pc.nipples] and [pc.chest], causing both to engorge a little bit more. Your bust swells more and more with each passing moment, and the flow of milk becomes an unstoppable torrent. You whimper around the heavenly bud until it dries up and gentle hands separate it from your mouth, guiding you on to an equally delightful and yet-untapped source of your new favorite drink.");
	output("\n\nThrough the transparency of their walls, the milkers’ reservoirs slowly fill with your [pc.milk]. You also become aware of a slight variation in the suction applied to your [pc.nipples]; it pulsates in a rhythm, diminishing and then increasing in a way that your breasts respond quite strongly to. Blobs of liquid weight slide deeper down the tentacles, accompanied by a satisfied “mmmm” from nearby, and a sense of pride wells up inside in your chest (along with an uptick in the feeling of tongues on your teats");
	if(pc.hasCock() || pc.hasVagina()) output(" and genitalia");
	output(").");
	
	output("\n\n<i>“That’s all the medicine, little cow. I don’t have any more for you.”</i>");
	
	output("\n\nThe voice makes you aware that you’ve spent some time suckling an empty nipple. It’s grown almost purplish from how actively you were attempting to draw from it. Surely it has gotten supremely sensitive. Gentle hands pull you back between the boobs while a voice explains, <i>“That’s all you needed, my little cow pet. Now focus on doing your part and feeding me lots of yummy milk. We both know my medicine has made milking immensely pleasurable for you, so why don’t you just sag into my breasts and cum yourself silly?”</i>");
	
	output("\n\nTrue to her words, you realize you’ve become exceedingly horny, and you find yourself on the edge of orgasm from the act of lactating alone. You know that breast stimulation alone shouldn’t get most races off very easily, but it’s like there’s a switch flipped on inside you. You’re on the cusp of an explosive nipplegasm.");
	
	output("\n\n<i>“Cum.”</i>");
	
	output("\n\nJust like that, you’re cumming, spraying so much milk that the tubes are barely able to keep up with it. It’s vastly different from any other kind of orgasm");
	if(pc.hasCock() || pc.hasVagina()) output(", and your crotch doesn’t even get in on the act. Then again, it doesn’t need to - milking feels so great");
	output(". You babble unintelligibly as you feed the milkers as much [pc.milk] as they can handle, shuddering wildly in your organic, tit-locked cocoon.");
	
	output("\n\nYou aren’t sure how long the titgasm goes on for, but when it ends, you’re panting and as horny as ever - hungry for more. Fortunately you’re still squirting steady flows, and another big, mind-shattering cum isn’t far off. Your eyes roll back as it approaches, and you begin to scream out your bliss into the venus pitcher’s tits while you gush oh so well for her.");
	
	output("\n\nGiggling dopily as you come down, you backslide into oblivion, cooing out soft little “moos” when prompted by your mistress’s commands. Her words continue to shape you as you sleep, conditioning you to obey and feed her whenever possible, like a good little cow.");
	//Boost lactational bits!
	pc.milked(pc.milkFullness+50);
	if(pc.milkRate < 15) pc.milkRate++;
	pc.slowStatGain("libido",2);
	pc.orgasm();
	pc.milkInMouth(chars["ELDERVENUSPITCHER"]);
	processTime(20+rand(10));
	clearMenu();
	addButton(0,"Next",elderVenusPitcherEpilogue);
}

// Tailcock
public function elderPitcherPlantTailCockPlay():void {
	clearOutput();
	showBust("VENUS_PITCHER_ELDER");
	showName("VENUS\nPITCHER");
	output("One big, fat tentacle rises up and front of you, waving back and forth, snake-like. The mottled green-hued surface shines dully in the bioluminescent light the walls of this strange place exude. Blooming like an exotic flower, the tip of the tendril peels back and opens, revealing a moist, purple-hued interior. That same interior exudes a constant flow of slowly-dripping lubricant, viscous and dangling in long ropes that sway back and forth before dropping. Unbidden and unasked for, you become very aware of ");
	if(pc.hasCock()) output("[pc.eachCock] and ");
	output("your [pc.tailCock], fellated by invisible tongues and leaking long strings of pre-cum in anticipation.");
	
	output("\n\nThe hollow vine disappears a moment later, but a second later, your view is replaced by a heaving bosom. The soft, all-encompassing press of the venus pitcher’s breasts around your face is as comforting as it is arousing.");
	
	output("\n\nHer voice ripples across your consciousness, permeating itself into every fold of your malleable mind as she says, <i>“Atta " + pc.mfn("boy","girl","pet") + ". Sink into trance as my hypnotic breasts envelop your poor, defenseless brain.”</i> A hand traces gentle circles on the back of your neck. <i>“The tongues you feel licking you, fellating you for your obedience, they’re getting faster and stronger as you slip deeper and deeper into my mesmerizing embrace. Grow more and more aroused as my tentacle closes in on your unique little tail. Let your lust double, then triple. Each passing second your dick");
	if(pc.hasCock() || pc.tailCount > 1) output("s get");
	else output("gets");
	output(" harder and harder, aching for climax.”</i>");
	
	output("\n\nYou shudder as your [pc.tailCock] trembles in unashamed, unadultered need, drooling pre-cum all over itself in its eagerness. Warm, moist air, like hot breath, washes across the [pc.tailCockHead], making you tremble with delicious, agonizing need, and you groan from the pleasure of lusting so heavily that your whole body feels on edge. Your secretions are soaking the underside of the rest of your [pc.tail], yet you don’t care. It feels good to lie here and get hornier and hornier, all without her even touching your genitals directly, just delightfully submitting to her every whim until you’re so hot and bothered that you explode.");
	
	output("\n\nSuddenly, constrictive heat envelops your entire body. It feels like your entire body, anyway. The tendril must have encircled itself around your [pc.tailCock], then squeezed itself down into a sensuous snare. What few thoughts are still lingering in your sublimated mind are blasted away by the onslaught of pleasure, replaced with the raw, animal instinct of a horny male. Your tail tries to force itself deeper into that warm, wet opening, sliding inches of itself inside. It travels so far into the tentacle-cunt that your whole [pc.tail] starts to get a massage from the pulsations of the smooth muscle surrounding you. You whimper into the venus pitcher’s tits and let your [pc.hips] writhe uncontrollably as you’re milked all the way to orgasm, too happy, horny, and hypnotized to do anything but let your orgasm be forced out of you.");
	
	output("\n\n<i>“You’re going to cum for me soon, right? There’s no point in holding back, because I love it when " + pc.mfn("boys","girls","pets") + " cum inside me more than anything else. So go on, orgasm. Squirt for me. Feel that cum roiling inside of you as it begins to travel towards your cock</i>");
	if(pc.hasCock() || pc.tailCount > 1) output("<i>s</i>");
	output("<i>, spurting on command,”</i> commands a voice so laden with eroticism that it sends splinters of need down your spine.");
	
	output("\n\nOrgasm hits you with the force of a hammer, crossing your eyes a split-second before they roll back. Your tongue lolls out as [pc.cum] starts to slide down your [pc.tail]. You grunt into the heavenly tits that have so snared your mind and pump heavy dollop after heavy dollop of [pc.cumColor] pleasure directly into the hungry tentacle. Your floral lover wraps her hands around her breasts and your head, compressing all three together to more effectively smother you with titflesh. The soft, squishy boobs send fresh pulses of pleasure through your [pc.tailCock], and you squirt faster and harder until you can cum no more.");
	if(pc.hasCock()) output(" The feelings of blissful release are echoed by [pc.eachCock], though the flow of [pc.cum] is noticeably less than that erupting from your tail.");
	
	// small cumq
	if(pc.cumQ() <= 50) {
		output("\n\nYou sigh in satisfaction, but the way the venus pitcher pulls your head back and frowns at you indicates she is far from delighted at the situation. <i>“That’s it? Just a few drops?”</i>");
		output("\n\nYou nod.");
		output("\n\n<i>“Well then, my little hypno-monkey, I’ll have to fix that,”</i> she quips as her frown twists into a wry grin. She hefts a teat towards your lips and commands, <i>“Suckle.”</i>");
		output("\n\nAfter being so thoroughly mesmerized by the tasty teat, she doesn’t have to command you twice. You latch on and suckle down her tangy, delicious milk in big gulps, grinning stupidly around her tit as it stokes a sexual warmth in your core. The sensuous need stiffens your [pc.tailCock] with fresh engorgement in its messy, cum-slimed prison a swallow at a time, but that isn’t it. The pleasure and need keep rising continually, swelling ");
		if(pc.balls == 0) output("something inside you");
		else output("your [pc.sack]");
		output(" with fresh [pc.cum]. Within the span of minute, you’re cumming for her all over again, squirting comparatively huge flows of jism as you drain her tits dry.");
		
		output("\n\nAfter a time, the pleasure grows so great that you begin to lose your grip on awareness. A voice chases after you into the blackness, sliding straight into your brain and layering on blissful obedience.");
		pc.ballEfficiency += 2;
		pc.cumMultiplierRaw += 2;
		if(pc.ballEfficiency/pc.cumMultiplierRaw < 3) pc.ballEfficiency += 2;
		pc.milkInMouth(chars["ELDERVENUSPITCHER"]);
		pc.slowStatGain("libido",2);
	}
	// other
	else {
		output("\n\nThe whole process takes a surprisingly long time. When it’s over, you’re sighing in satisfaction, a sound echoed by your hypnotic mistress. She pets your head and coos, <i>“That’s my good " + pc.mfn("boy","girl","pet") + ". Why don’t you close your eyes and shut off your mind for a while. It’ll feel so good to just sleep. I promise to make you feel this good the entire time.”</i>");
		output("\n\nYou’re helpless to do anything but obey, so you close your eyes and shut down, letting her milk you dry again while she programs new thoughts into your exposed, vulnerable subconscious.");
	}
	pc.orgasm();
	processTime(20+rand(10));
	clearMenu();
	addButton(0,"Next",elderVenusPitcherEpilogue);
}
	
// Tailcunt
public function elderVenusPitcherPlaysWithTailcunts():void {
	clearOutput();
	showBust("VENUS_PITCHER_ELDER");
	showName("VENUS\nPITCHER");
	output("A large, flared phallus appears before you, wiggling from side to side to the same hypnotic tempo the pitcher’s boobs trace through your sluggish mind. It’s greenish in hue and leaking a steady stream of what can only be its alien pre-cum. The tip is a bizarre, iridescent mix of emerald and violet, while the stalk is a lighter viridian. Both are glossy with moisture that shines in the pulsating, organic green light shed by the walls. That flared tip blooms a little wider, and the urethra bulges a bit forward, just enough to be clearly defined.");
	output("\n\nYour tail weeps lubricants hungrily, feeling invisible tongues of suggestion sliding around its interior, gathering up your drippings and smearing them across every fold and alien nerve cluster, weakening your muscles through pleasure. The slit at the end visibly weeps waves of lusty girl lube onto the tentacles all around you, though most of them seem content to wait right now. This venus pitcher is clearly intent on one specific part of your body.");
	output("\n\n<i>“Look at this dick, " + pc.mfn("boy","girl","pet") + ". It’s perfect. See the way it throbs for you, the way it aches for you. Watch the cum just DROOL out the end in anticipation of plundering your exotic little tailpussy. You surely realize that’s a parasite right? A creature that takes from you and gives nothing back. Well, nothing except pleasure. Perhaps that’s enough for you, slut. You just love thinking with your big, cock-hungry pussy. You’re just on the prowl for something to stuff you full of cum. Then, in between slutty little whore-fucks, you can squat and cum your brains out whenever it’s time to lay your eggs. That’s what you really want, isn’t it? You want me to feed your whorish cum-thirst,”</i> she growls with the barest undercurrent of distaste.");
	
	output("\n\nYou shudder and nod, your tail already snaking around your [pc.hips] to try and get at the delicious, cum-spewing morsel in front of you. Its motion is arrested halfway there by a bigger, stronger tentacle. The large vine wraps it up in an imprisoning helix, completely immobilizing your rogue appendage. Whimpering needily, you try your hardest to obey, so that you’ll feel those phantom tongues licking you harder and faster. At the same time, your [pc.tailCunt] appears determined to devour that fat dick, straining against its bonds futilely.");
	
	output("\n\nThe venus pitcher holds her breasts up and towards you, which is a bit odd, upside down as she is, gyrating them in slow, pendulous circles to lure you deeper. Your vocalizations taper off into blissful silence as you watch, momentarily distracted from the molten lust pouring through your veins.");
	
	output("\n\nGlossy jade lips split into a smile, and your mesmerizing mistress purrs, <i>“Good " + pc.mfn("boy","girl","pet") + ". You’ve proven reliable enough to get that fat cock you want so badly, and you do want it badly, don’t you?”</i> The purplish-green shaft wobbles up between the two of you, pressed between the plant woman’s proud knockers where it can slip and slide freely. You swallow nervously, hungrily even, and nod. Your desire for dick eventually draws your eyes to her phallic tentacle, though her tantalizing tits never vacate your mind’s eye, keeping you docile, obedient, and aroused.");
	
	output("\n\n<i>“Bon appetit.”</i>");
	
	output("\n\nUnwinding with lightning-fast speed, the restraining tendril releases your [pc.tailCunt] and vanishes into the slippery mass below. Your snake-like appendage lurches forward dangerously fast, slamming its gushing gash directly into the blunted member in an attempt to take it in all once. The attempt fails, only managing to splatter the combined sex-juices over you and the verdant woman’s forms. Your [pc.tail] lashes out again with a bit more control, and this time it actually manages to part your hungry gash, spreading it over the wide and gently curving tip of your chosen toy.");
	
	output("\n\nPre-cum squirts down your tunnel almost immediately, matched by an outflow of your own copious lubrication. The two heady, sensual discharges mix and mingle where the sexual organs join, a line that blurs more and more with each passing second. Your cunt tail is slowly spreading to encompass the flare; nearly a third of it has slipped inside your moist orifice already. Lurching forward, the turgid tendril thrusts with enough force to instantly stretch your [pc.tailCunt] to capacity, its head bending slightly as it squishes and scrapes through your torrid tunnel, lewdly caressing every fold with wet, hot fuck.");
	
	output("\n\nSuddenly, breasts wrap around your [pc.face], smothering you in mammary molestations, squeezing you tightly into the venus pitcher’s hypnotic cleavage. You sag into her arms, whimpering needily as your pussy plows itself on her tentacle, fucking with wild, insatiable cum-thirst.");
	
	output("\n\nA tittering voice reaches through your prison to caress your ears. <i>“This is what you wanted, and you love it, don’t you? Don’t respond, pet, just hang there and cum yourself silly. You’ve got a special, fun little body. All you have to do is orgasm. Cum on my tentacle. Squirt out all that delicious fluid until you’re dry. I’ll even let you feel me filling you so full that you bloat from all the spunk.”</i> A finger traces circles on the back of your neck as she continues. <i>“And you’ll love every moment of it, so much that your nice, wet tail-pussy is going to drool at the tiniest thought of me. You’ll remember this feeling at night and dream of returning to feed and be seeded.”</i>");
	
	output("\n\nYou shudder as her words seep unfiltered into your mind and cum, writhing in your restraints with spastic tremors of climactic need. Sticky, slippery sperm fires into your tailpussy, making it clench, squeezing down on the plant-cock to milk every drop of seed deep inside itself. At first, the pleasure is immense, and you greedily devour every drop. As time passes, however, you start to become full, your tail bloated and fat with stored cum. The pleasure is no less exquisite, but the coordinated muscles slowly lose cohesion and start to spasm wildly on the spooge-slinging shaft, leaking huge, gushing globules of white everywhere.");
	
	output("\n\nThe ecstasy never seems to dull. Every fiber of your body focuses down on the rhythmic internal deposits filling you, stuffing you with salty pleasure beyond what a mere human cunt is capable of experiencing. Your back arches uncontrollably as you strain against the restraint. Your lips part, and you begin to babble incoherent words of love and affection, slobbering all over mistress’s tits as she plows you past your limit, slamming you past the point of cogent reasoning.");
	
	output("\n\nSeeing this, the venus pitcher begins to whisper suggestions into your ear while you come, conditioning you to equate her and her race with such excitement, and perhaps, programming you to find her again someday.");
	
	// NEXT
	pc.orgasm();
	processTime(20+rand(10));
	clearMenu();
	addButton(0,"Next",elderVenusPitcherEpilogue);
}

// Epilogues
public function elderVenusPitcherEpilogue():void {
	clearOutput();
	showBust("VENUS_PITCHER_ELDER");
	showName("VENUS\nPITCHER");
	//Some energy damage!
	pc.energy(-45);
	output("You wake up more than a little sore, all alone. The venus pitcher is gone as far as you can tell. If she’s hiding in her pod, the entrance is closed and concealed under the jungle brush and detritus with such skill that you doubt you could find it again.");
	//Apply submission
	venusSubmission(10);
	//Keep count for reasons...
	if(flags["TIMES_CAUGHT_BY_ELDER_VENUS_PITCHER"] == undefined) flags["TIMES_CAUGHT_BY_ELDER_VENUS_PITCHER"] = 0;
	flags["TIMES_CAUGHT_BY_ELDER_VENUS_PITCHER"]++;
	// First Time
	if(venusSubmission() <= 10) {
		output("\n\nYou head is swimming with thoughts and memories of the venus pitcher woman, from her enticing mammaries to the way she made you cum your way into unconsciousness. There’s just something unmistakably sexy about a woman who snares your mind so effectively that you’ll willingly let her milk you through orgasm after orgasm. A quiet thrill runs through you when you wonder if all venus pitchers are like this one, and if not, if you can find this one again when she’s ready for another meal....");
	}
	// Second
	else if(venusSubmission() <= 25) {
		output("\n\nWhoah, that sexy, chlorophyl-laden slut did a number on you! You can still make out every detail of her tits in your mind, softly swaying back and forth... their beauty slowly entrancing you.... Shaking out of your stupor, you smile ruefully and rub the sore, sensitive parts of your body, shuddering at the aftershocks that assault you even now. The realization that you fell into a venus pitcher’s trap again has your heart starting to beat faster, and you idly wonder if volunteering to join them would be so bad.");
	}
	// Third
	else if(venusSubmission() <= 40) {
		output("\n\nWow! That felt sooo good. Your whole body is sore and tired, but in a really, REALLY good way. The aches are just like little reminders of how good the venus pitcher made you feel, and how badly your body wants to recover so it can do it again. You know that you really shouldn’t crave them so, but it’s not like they’re hurting you, right?");
	}
	// 4-5
	else if(venusSubmission() <= 60) {
		output("\n\nMmmm, you lie there for a moment, trying to recall every detail of the exquisite pleasure you just endured. She worked you over so good, and her nipples, they must be psionic focuses or something. Whenever you look at them, you just kind of float away and give her whatever she wants, which surely isn’t good, right? Though it does feel good... so good.");
	}
	// 6+
	else {
		output("\n\nAhhh, that scratched the itch. These girls know just how to work all the tension out of you and make you feel so relaxed after. You groan at the memory of being restrained inside her pod, relentlessly milked and instructed, and you shiver in anticipation. You’re pretty sure you’re addicted to being hypnotized and milked by them at this point, not that you mind. They feel too good to bother resisting any longer.");
	}
	processTime(120+rand(20));
	pc.orgasm();
	if(rand(3) == 0) pc.orgasm();
	if(rand(3) == 0) pc.orgasm();
	if(rand(3) == 0) pc.orgasm();
	if(rand(3) == 0) pc.orgasm();
	processTime(20+rand(20));
	clearMenu();
	if(venusFlowerDrops()) addButton(0,"Next",venusPitcherBonusFlower);
	else addButton(0,"Next",mainGameMenu);
}

public function venusSubmission(arg:Number = 0):Number {
	if(flags["PITCHER_HYPO_SCORE"] == undefined) flags["PITCHER_HYPO_SCORE"] = 0;
	if(arg != 0)
	{
		flags["PITCHER_HYPO_SCORE"] += arg;
		if(flags["PITCHER_HYPO_SCORE"] > 100) flags["PITCHER_HYPO_SCORE"] = 100;
		if(flags["PITCHER_HYPO_SCORE"] < 0) flags["PITCHER_HYPO_SCORE"] = 0;
	}
	return flags["PITCHER_HYPO_SCORE"];
}

public function venusPitcherLayUnfertilizedEgg():void {
	clearOutput();
	showBust("");
	showName("VENUS\nPOD!");
	author("Fenoxo");
	
	var pData:PregnancyData = pc.getPregnancyOfType("VenusPitcherSeedCarrier");
	var pSlot:int = pc.findPregnancyOfType("VenusPitcherSeedCarrier");
	
	if (pSlot == -1) pSlot = 0;
	
	output("Your [pc.belly] rumbles ominously a second before you feel a shift in your womb. Shit! Something is coming. Dropping to your [pc.knees], you double over,");
	if (pc.isCrotchGarbed()) output(" your [pc.lowerGarments] suddenly chafing and tight. You uncover your [pc.vaginas] faster than you thought possible, sped on by biological impetuses beyond comprehension.");
	else output(" watching slime drip from [pc.oneVagina].");
	
	if (StatTracking.getStat("pregnancy/venus pitcher seeds") == 0)
	{
		output(" Something is coming out of you, though whether a seed or a venus pitcher baby, you don’t know. All you know is that your body is going to force it out any second now, and you had best brace yourself for the coming birth.");
	}
	else 
	{
		output(" Another seed pod must be itching to come out of you, and there is no delaying it. You brace yourself for the coming pleasure of another laying.");
		
		if (pData && pData.pregnancyQuantity > 1)
		{
			output(" How many more of these things do you have yet to birth?");
		}
		else
		{
			output(" This one feels like it might be the last, thankfully.");
		}
	}
	
	output("\n\nThe slime dripping from your lips thickens into a sticky deluge as muscles inside you relax, opening the way for the pod’s lubricant to escape in a rush. You can feel the bulbous seed start sliding inside you, shifting and stretching, forcing you open in ways that would make even the biggest dicks ache with jealousy. It should hurt, but for some reason, there’s blessedly little pain - just a sense of the slick form gliding down your nerve-laden channel as if it was made to lay these things all along.");
	output("\n\nA rounded, green-hued surface appears between your spread lips, momentarily reminding you of a flower blooming until a muscular contraction hits. Then, they stretch so obscenely that you have a hard time understanding exactly what you’re seeing.");
	if(pc.hasClit()) output(" The pod is so big that you can feel it pressing on the nerves in your [pc.clits] from behind.");
	output(" Sexual pleasure blitzkriegs through your brain to war with wonder at what your body is doing. When the pod finally makes the second half of its journey, the pleasure wins out.");
	output("\n\nYou grunt unthinkingly as the slick, alien seed emerges from your [pc.vagina " + pSlot + "] and wetly plops into the puddled slime. A trickle of the slippery stuff escapes after it, drizzling over the verdant orb like icing in the brief moments before you muscles give out and drop you onto your back");
	if(pc.legCount > 1) output(", [pc.legOrLegs] splayed");
	output(".");
	
	//CuntChange: size 800.
	pc.cuntChange(pSlot, 800, true, true, false);
	
	StatTracking.track("pregnancy/unfertilized venus pitcher seeds");
	StatTracking.track("pregnancy/venus pitcher seeds");
	StatTracking.track("pregnancy/total births");
	
	output("\n\nOnce you catch your breath");
	if (pc.isCrotchGarbed()) output(" and re-dress");
	output(", you’re left with the curious, oblong seed in front you. Using the codex, you determine that it wasn’t fertilized. It also isn’t considered edible by most species, but it’s likely that you could consume it anyway if you didn’t mind a major risk of bodily mutation to accommodate it.");
	pc.orgasm();
	
	if (pData && pData.pregnancyQuantity > 1) output("\n\nThe size of your [pc.belly] indicates that you’re going to be going through this at least once more. You can’t stop your [pc.vaginas] from tingling hotly at the thought.");
	
	//Increase elasticity .1 towards a cap of 1.6
	if (pc.elasticity < (pc.hasPerk("Elasticity") ? 3.2 : 1.6))
	{
		pc.elasticity += (pc.hasPerk("Elasticity") ? 0.2 : 0.1);
		output("\n\nAt least you feel a little stretchier now, like the act has left you better-prepared to both take and pass large insertions without issue.\n\n");
	}
	
	//Gain Venus Pod (TF item go!)
	venusPitcherPodReward(1);
}
public function venusPitcherSeedNurseryEnds(nEggs:int = 0):void
{
	clearOutput();
	showBust("");
	showName("VENUS\nPOD!");
	
	if(nEggs <= 0)
	{
		output("It looks like you didn’t give birth to any venus pitcher seeds!");
	}
	else
	{
		output("You have given birth to " + num2Text(nEggs) + " venus pitcher seed" + (nEggs == 1 ? "" : "s") + "!");
		
		StatTracking.track("pregnancy/unfertilized venus pitcher seeds", nEggs);
		StatTracking.track("pregnancy/venus pitcher seeds", nEggs);
		StatTracking.track("pregnancy/total births", nEggs);
	}
	output("\n\n");
	
	venusPitcherPodReward(nEggs);
}
public function venusPitcherPodReward(nEggs:int = 0):void
{
	var podLoot:Array = [];
	var idx:int = 0;
	
	while(nEggs > 0)
	{
		// Create item
		podLoot.push(new VenusPod());
		// Determine item quantity relative to stack
		var nQuantity:int = Math.min(nEggs, podLoot[idx].stackSize);
		// Change item quantity
		podLoot[idx].quantity = nQuantity;
		// Update counters
		nEggs -= nQuantity;
		idx++;
	}
	
	if(podLoot.length <= 0)
	{	
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	
	itemCollect(podLoot);
}

public function rumblyInYourTummy():void 
{
	// 14 hours after fertilization
	if (pc.hasStatusEffect("Venus Pitcher Egg Incubation Finished")) return;

	AddLogEvent(ParseText("The [pc.skin] across your [pc.belly] stretches as your alien young incubate inside your womb. It’s actually quite a satisfying sensation, though it does leave your face a little flushed. More slime bathes your netherlips as your body gets into its role as a receptacle for venus pitcher seeds. There’s so much of the slick stuff that your crotch appears practically oiled with it."), "passive");

	//Increase bellymod to 14 * amount
	var pregSlot:int = pc.findPregnancyOfType("VenusPitcherFertilizedSeedCarrier");
	pc.addPregnancyBellyMod(pregSlot, 14, true);
}

public function poppingSoonAlert1():void
{
	//20 hours after fertilization
	if (pc.hasStatusEffect("Venus Pitcher Egg Incubation Finished")) return;

	AddLogEvent(ParseText("You stroke your [pc.belly] happily as you feel the seeds taking root inside you, using your body’s nutrients to accelerate their growth. Some of them must have little tendrils; you can see them pressing against the [pc.skin] of your middle from time to time. It won’t be long now. You don’t know how you know that, but it’s true. In a few hours, you’ll be giving birth to the most wonderful young. A compulsion to go somewhere wild and untamed seizes hold of you, propelled on whispery voices and full, velvet lips - a memory of a more pleasant time, perhaps."), "passive");
}

public function poppingSoonAlert2():void
{
	//23 hours after fertilization
	if (pc.hasStatusEffect("Venus Pitcher Egg Incubation Finished")) return;

	AddLogEvent(ParseText("You’ll be laying soon; you’re sure of it. Your [pc.vaginas]"), "passive");
	if (pc.totalVaginas() > 1) ExtendLogEvent(" have");
	else ExtendLogEvent(" has"); 
	ExtendLogEvent(" grown wetter and eager. The birth-slime is practically dripping out of you nonstop at this point. All you need to do is protect the children inside you - the beautiful creatures just waiting to grow up into elegant venus pitchers. You just have to stay somewhere good for them, then spread yourself and allow them to root. It is a simple fact of existence, one that’s making you wetter by the second.");
}

public function layFertilizedVenusPitcherEgg():void
{
	clearOutput();
	showBust("VENUSPITCHER");
	author("Fenoxo");

	var pData:PregnancyData = pc.getPregnancyOfType("VenusPitcherFertilizedSeedCarrier");
	var pSlot:int = pc.findPregnancyOfType("VenusPitcherFertilizedSeedCarrier");
	
	if (pData == null)
	{
		trace("WARNING: Found a potential issue birthing seed pods. Couldn’t find the correct pregnancy data index.");
	}
	
	if (pSlot == -1)
	{
		trace("WARNING: Found a potential issue birthing seed pods. Couldn’t find the correct cunt index.");
		pSlot = 0;
	}

	//24 hours after fertilization and every four hours after the first. (so 24, 28, 32, until the PC's womb empties)
	output("It is time. The way the seedlings are squirming inside you is all the evidence you need. You feel as if you’ve trained for this");
	if (flags["LAID VENUS PITCHER SEEDS"] != undefined) output(", but that’s likely just experience talking. You do so love to let the pitchers use your body as a nesting ground.");
	else output(".");

	if (!pc.isNude()) output(" You remove your [pc.gear] to make yourself ready.");
	else output(" All you have to do is relax. You’re ready.");
	output(" The first contraction is automatic, even easy. You just have to spread");

	if (!pc.isBiped()) output(" yourself out");
	else output(" your [pc.legs]");
	output(" over a flat spot and let instinct guide you.");

	output("\n\nGushing out of you, a wave of viscous birth-slime prepares the way of the seed, lubricating your channel and providing a soft, warm place for it to land. Your [pc.vagina " + pSlot + "] ripples in excitement when your cervix dilates, just enough for flexible tendrils to squeeze through. They flail around the inside of your birth canal before stretching out to your entrance and hooking over your labia");
	if(pc.hasClit()) output(", one even finding purchase on [pc.oneClit]");
	output(". You swoon and gasp, your [pc.hips] gently twisting and thrusting, reacting to an entirely different, more libidinous set of instincts.");

	output("\n\nIt feels good to play mother for the pitchers, and every passing second reinforces that belief a hundred-fold. The pleasant, pliable expansion of your womb’s entrance, the wriggling tentacles slipping and sliding across the surface and interior of your [pc.vagina " + pSlot + "], it’s all too much. Grunting and on the verge of cumming already, you feel the pod slide through your tightly-stretched cervix to stretch your tunnel wide, pulled that far by the verdant, squirming vines reaching for the outside.");
	output("\n\nEach time the egg-like pod moves another inch, you grunt louder than the last time. Sometimes a feverish moan escapes your [pc.lips], but the bulk of your vocalizations carry the force of your body’s birthing effort rather than the pleasure it gives you, not that the pleasure is any less overwhelming. Indeed, your [pc.girlCum] mixes with the copious slime as the egg parts your netherlips. There is a sexual component to your enjoyment, yet it mixes with a certain sublime satisfaction.");
	output("\n\nYour lips are gaped wide by the seed now, enough for you to see where it has sprouted the tendrils, and they push down on your thighs to drag the slimy ovoid mass free. It pops out with a web of green-hued juices behind it, plopping noisily into the puddle below, triggering an immediate, powerful orgasm as your flushed lips snap back closed. The mix of birthing endorphins and climactic stimulation send you reeling, flopping bonelessly on the ground");
	if (pc.isBiped()) output(", your toes curled");
	output(".");

	//Cuntchange 1,100 <-- unfertilized eggs specifed 800, leaving as a note for review
	pc.cuntChange(pSlot, 800, true, true, false);

	output("\n\nWhen you come to a few minutes later, the little pod is still sitting there, its tendrils rooting around on the ground for a place to make its home. Someday, that’s going to grow into a beautiful venus pitcher.");
	
	StatTracking.track("pregnancy/venus pitcher seeds");
	StatTracking.track("pregnancy/total births");

	pc.orgasm();
	
	// Update data here
	VenusPitcherFertilizedSeedCarrierHandler.cleanupPregnancy(pc, pSlot);
	// Check after updates
	pData = pc.getPregnancyOfType("VenusPitcherFertilizedSeedCarrier");
	pSlot = pc.findPregnancyOfType("VenusPitcherFertilizedSeedCarrier");

	// Do the needful with the eggs etc
	if (pData != null && pData.pregnancyQuantity > 1) output("\n\nThe size of your [pc.belly] indicates that you’re going to be going through this at least once more. You can’t stop your " + (pSlot >= 0 ? "[pc.vagina " + pSlot + "]" : "[pc.vaginas]") + " from tingling hotly at the thought.");
	//Count the number of times PC has laid full seed batches. Incremented after laying the last seed.
	else 
	{
		if(flags["LAID VENUS PITCHER SEEDS"] == undefined) flags["LAID VENUS PITCHER SEEDS"] = 0;
		flags["LAID VENUS PITCHER SEEDS"]++;
	}
	//Increase elasticity .1 towards a cap of 2
	if (pc.elasticity < (pc.hasPerk("Elasticity") ? 4.0 : 2.0))
	{
		pc.elasticity += (pc.hasPerk("Elasticity") ? 0.2 : 0.1);
		if (pc.elasticity > (pc.hasPerk("Elasticity") ? 4.0 : 2.0)) pc.elasticity = 4.0;

		output("\n\nAt least you feel a little stretchier now, like the act has left you better-prepared to both take and pass large insertions without issue.");
	}
	
	clearMenu();
	if (InShipInterior())
	{
		output("\n\nSince you’re on your ship, you might as well send it off to your daycare.");
		StatTracking.track("pregnancy/fertilized venus pitcher seeds/day care");
		StatTracking.track("pregnancy/total day care");
		addChildVenusPitcher();
		
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		output("\n\nAre you going to find a good spot for the fledgling pitcher to root or call in a drone to have it delivered to your daycare?");
		addButton(0, "Plant It", function():void {
			clearOutput();
			author("Fenoxo");
			output("Finding a spot where the pitcher can take root, you place the egg down and half bury in the ground, giving it as good a start as possible. Maybe when she grows up she’ll remember you and thank you....");
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			
			StatTracking.track("pregnancy/fertilized venus pitcher seeds/planted");
		});

		addButton(1, "Send It Off", function():void {
			clearOutput();
			author("Fenoxo");
			output("The best place for the pod would be back in the daycare on Tavros Station. You call in a transit pod and place it inside along with as much soil as you can gather in hopes of seeing her bloom into a beautiful pitcher back on the station.");
			
			StatTracking.track("pregnancy/fertilized venus pitcher seeds/day care");
			StatTracking.track("pregnancy/total day care");
			addChildVenusPitcher();
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
		});
	}
}
public function addChildVenusPitcher(numChild:int = 1):void
{
	ChildManager.addChild(
		Child.NewChild(
			GLOBAL.TYPE_VENUSPITCHER,
			1.0,
			numChild,
			0, 1, 0, 0
		)
	);
}

public function venusBadEnd():void
{
	showBust("VENUS_PITCHER_ELDER");
	showName("VENUS\nPITCHER");
	author("Fenoxo Fenbutt");
	output("\n\nA familiar-looking figure peeks from out of the thick vegetation to favor you with a friendly wave. It’s a venus pitcher! She’s smiling at you, beaming even, letting her breasts bounce back and forth hypnotically. The diaphanous leaves that cover them may as well be transparent silk for all that they cover. Your eyes are drawn to the faint purple of her nipples, bulging through their botanical wrappings, arcing through the air, left and right... left and right.");
	output("\n\n<i>“Welcome back,”</i> the verdant vixen all but purrs to you, beckoning you closer with a crooked finger. <i>“The forest sings at your presence... and I... I am ready for your offering.”</i>");
	output("\n\nYou wipe your nose and smile giddily. You’ve barely found this pitcher and you already feel like a fool in love. Your head swims with the sound of her voice. Every inhalation is a sweetened promise. Your heart thrums. Thoughts come slowly, as if they’ve spent an evening at the bar and have to wobble a great distance to come home. That’s okay, there’s tits in front of you, and they’re getting closer, filling your vision just like her pollen is filling your mind, making you content and malleable.");
	output("\n\n<i>Stars, you love this feeling.</i>");
	output("\n\n<i>“Oh, you’re so eager, aren’t you?”</i> The venus pitcher’s voice pours across you like the slowest, warmest wave of amber honey, binding you in comfort and sweet promise. <i>“You off-worlders are truly a gift from the Earthmother. Look how bountiful I’ve become, how lush and </i>ripe<i> your constant visits have made me?”</i>");
	output("\n\nOf course she’s right. That’s why her breasts are so amazing, so <i>luscious</i> and creamy. That’s why you feel like you’re falling into them, her smooth skin soft against your cheeks, her flowery scent filling your head. You kiss at her supple tits more by instinct than choice, your body on autopilot, worshipping the fertile goddess who has chosen to claim you today. She tastes like cherries and cream. It makes your tongue tingle with giddy vibrations, or is that just what you’ve been told to feel? You’re too happy to remember... or care.");
	output("\n\nYou’re so deep inside her cleavage that you can’t see anything else, not even the sky’s faint light. Her floral, earthy scent and cooing, gentle words are everything. Her arms encircle you, soft as satin pillows and strong as steel cables. You couldn’t escape if you tried. And you try, if only to verify how firmly she has you, to ensure that you can’t possibly escape to what you’ve consigned yourself to. It’s what you wanted, after all: to stay on Mhen’ga, roaming the forests, searching for pitchers to obey.");
	output("\n\nBecause they need you. Almost as much as you need them.");
	output("\n\n<i>“Don’t struggle, ");
	if(pc.hasCock()) output("lovely seeder");
	else output("silly breeder");
	output(".”</i>");

	output("\n\nYour muscles go as slack as cut string.");
	output("\n\n<i>“There we go,”</i> the verdant princess strokes your [pc.hair], and sighs pleasantly. <i>“You shouldn’t need to worry. Just relax, and let me take care of you.”</i> She shifts her grip to press your face against a nipple, pushing the leaf aside with your questing lips. <i>“You deserve a reward.”</i>");
	output("\n\nYou certainly do. Your [pc.lipsChaste] seal around the beryl nub, granting your tongue access a split second later. You slather it in spit, sparking hot bursts of its perfect flavor across your palate. There’s no other way to describe it. The actual sensation is buried so deeply under hypnotic suggestions that it’s impossible to tell your body’s reactions from those programmed into your mind. The two are inseparably entwined in a column of oral ecstasy that would curl your toes were they not so delightfully, helplessly immobile.");
	processTime(10);
	pc.changeLust(25);
	clearMenu();
	addButton(0,"Next",venusPitcherBadEnd2);
}

public function venusPitcherBadEnd2():void
{
	clearOutput();
	showBust("VENUS_PITCHER_ELDER");
	showName("VENUS\nPITCHER");
	author("Fenoxo");
	
	pc.removeAll();
	moveTo("GAME OVER");
	
	output("Merely being in contact with a venus pitcher is enough to make the world spin in the background. Wait... No, she’s flipping you upside down, carrying you down into her subterranean bulb. The sensation is familiar enough to you that you can recognize it even when your world is centered wholly on the perfect breasts upon which you now nurse. Even when her pollen comes thicker and muggier than a sauna’s steam, crowding aside more complex thoughts with bubbling passion and waves of flaxen acceptance.");
	output("\n\n<i>“It’s so silly that you ever thought you were meant for something else.”</i> Her words are as sweet as the nectar leaking into your mouth. <i>“You were meant for me... and my sisters. We needed you, and you need us, don’t you.”</i>");
	output("\n\nYou make a gurgling sound around the ambrosial plant-honey pouring down your throat, but she shushes you with a loving gesture.");
	output("\n\n<i>“Don’t try to answer. Just relax and listen,”</i> the vixen tenderly instructs. <i>“You know what drinking this is going to do to you by now. It’s going to arouse you, because you are so easy to arouse.”</i> Whisper-soft touches slip across your [pc.chest] from the dozens of slithering tendrils that emerge from the walls, a few winding ");
	if(pc.legCount > 1) output("down between your [pc.legs]");
	else output("down around your [pc.leg]");
	output(". <i>“You know that you’re going to get horny, and juicy, and give me exactly what I want, because that’s what you and creatures like you are </i>for<i>. And my sisters and I will make you feel so very good in exchange. So good... so wonderful. You would trade your soul for another drop, would you not?”</i> She pulls you off her nipple by the scruff of your neck, clearly expecting a reply.");
	output("\n\nTalking is hard with your lips so sticky and your body so simultaneously relaxed and aroused, but you manage to slur an obedient, <i>“Mmmmhmmm.”</i> Without her breast in your mouth, the universe seems so cold and empty, almost sad and joyless. You writhe slowly, head flopping in an approximation of a nod. You <i>need</i> her to know that she can have your soul if she wants, just so long that you can go back to nursing, can go back to gorging yourself on her fecund fluid, feeling it swirl and bubble in your belly. It’s warm and syrupy, viscous and deliriously erotic. It radiates through your limbs, flushing your [pc.skin] everywhere it goes. More telling, it suffuses your crotch");
	if(pc.hasCock()) 
	{
		output(", oozing into your [pc.cocks] until you feel like your erection");
		if(pc.cockTotal() > 1) output("s are");
		else output(" is");
		output(" more filled with sticky venus-nectar than blood.");
	}
	else if(pc.hasVagina())
	{
		output(", oozing into your [pc.vaginas] until you feel like you’re leaking sticky venus-nectar down your thighs.");
	}
	else output(", oozing down your blank (but nonetheless engorged) pubic mound around to your [pc.asshole], making you feel simultaneously swollen and empty, like your sphincter is somehow twice as big and three times as tight.");

	output("\n\nYou gasp in delight as she presses you back to her left breast, rewarding your obedience with a fresh blast of saccharine.");
	output("\n\n<i>“You have been so good... so good to us.”</i> She sighs, enjoying the feeling of your greedy suckling. <i>“I should do more for you.”</i> Her fingers gently ");
	if(pc.hasHair()) output("through through your [pc.hair], dragging slowly across your scalp.");
	else output("trace over your head, dragging slowly across your scalp.");
	output(" <i>“I should let you taste my other nectar. It is better... stronger. One taste, and you’ll be ruined for everything else. You’ll never want to do anything but drink it... drink it and get milked. Do you want that? Do you want to give yourself to me and my sisters forever?”</i>");
	output("\n\nYou fall away from her nipple, lips smeared in gold, eyes dilated from the dark of her subterranean pod alongside her nectar, nodding like a broken bobblehead. You want that nectar. You want to suck and lick her harder while she uses your body. You want to cum so good for her, give her ");
	if(pc.hasCock()) output("gallons of [pc.cum]");
	else if(pc.hasVagina()) 
	{
		output("all the [pc.girlCum] you can ");
		if(!pc.isSquirter()) output("leak");
		else output("squirt");
	}
	else output("all the [pc.milk] in the universe");
	output(". You want to beg, but on some level you know being her floppy fuckdoll is the most obedient, most desirable thing you can do. The knowledge that you’re submitting to her so totally nearly makes you cum... but not quite, not without her tentacles, fucking and sucking you, wringing you for your nutritious juices.");
	processTime(25);
	pc.changeLust(75);
	clearMenu();
	addButton(0,"Next",venusPitcherBadEnd3);
}

public function venusPitcherBadEnd3():void
{
	clearOutput();
	author("Fenoxo Fenbooty");
	showBust("VENUS_PITCHER_ELDER");
	showName("VENUS\nPITCHER");
	output("Greenish purplish tentacles surround each of your limbs, torturously pulling you away from your mistress. They’re slippery with something that smells like flowers in bloom but grip tight enough that no amount of lubricant will let you escape. You weakly strain forward, trying to recapture the dark green nub of her nipple, but you’re too <i>relaxed</i>. Your body is passively, submissively aroused. It aches to be taken, not to take, and you cannot summon the motivation to do anything but hang there, watching and waiting.");
	output("\n\n<i>“We can only make this nectar in times of plenty,”</i> the venus pitcher explains, wiggling delightedly. Her fingers trace down her drained bests, across a tummy with the slightest hint of pudginess to a skirt made entirely from pinkish-purple blooms. <i>“In a way, this is your doing. Your tireless contributions let me send so many seeds into the world. Consider this as your reward.”</i> She raises the edge of her organic garment with a showwoman’s deliberate slowness. Beneath you see inhumanly smooth thighs joining together around a petite, flowery slit. The petals are somehow a richer purple and pink than her skirt ever could be, and they bloom before your eyes, glistening with the promise of the pleasures contained within.");
	output("\n\nYour mouth salivates.");
	if(pc.canLactate()) output(" Your [pc.nipples] ache, dribbling [pc.milk].");
	if(pc.hasCock())
	{
		output(" Your [pc.cocks] drip");
		if(pc.cockTotal() == 1) output("s");
		output(" pre.");
	}
	if(pc.hasVagina()) output(" A mote of jealousy surfaces, then snuffs out. Of course she has the most gorgeous pussy in the universe. You can’t possibly compare to it, but at least you can give it the worship it deserves.");

	output("\n\n<i>“You animals are all the same: so excited by a little slot between the legs. It makes so much more sense to be on the end of a tentacle, where it can touch and fuck any part of your body, but I suppose it’s okay if you can’t look away.”</i> The green woman pauses, regarding your straining genitalia. <i>“This excites you that much?”</i> She colors purple as you eye-fuck her bared muff. <i>“Th-then I’ll have to keep showing it to you.”</i> The tentacles drag you closer. That cunt smells like peaches and lavender. <i>“Now you’re getting ripe.”</i> A slickened length brushes your [pc.nipple]. You whimper and leak. Her pussy is close enough that it’s all you can smell now.");
	output("\n\nLarge clumps of pollen fall from the ceiling, bathing everything in a pale pink glow. It thrums and pulses like a heartbeat, lulling you into complacency as you’re placed still closer to the plant-girl’s heavenly cunt. All you have to do is stick out your tongue and you can taste it. One muscle movement, and you’ll experience a flavor so incredible that you’ll never want for anything else again. You’ll be permanently addicted to venus pitchers, body, mind, and soul.");
	output("\n\nThe only reason you haven’t yet is because she hasn’t given you permission.");
	processTime(10);
	pc.changeLust(24);
	clearMenu();
	addButton(0,"Next",venusPitcherBadEnd4);
}

public function venusPitcherBadEnd4():void
{
	clearOutput();
	showBust("VENUS_PITCHER_ELDER");
	showName("VENUS\nPITCHER");
	author("Fenoxo Fenfen");
	output("<i>“Go ahead,”</i> the venus pitcher’s melodious voice urges. <i>“Taste it, if you want.”</i> She pets you like you’re little more than a purchased animal. <i>“We both know you want it.”</i>");
	output("\n\nYou do. You want it so bad that the desire forces its way through clouds of lazy lust to prod your body into action. You throw yourself as far forward as your bindings will allow. On contact with your [pc.lipsChaste], you instantly understand why you’d never want to go back. It hasn’t even reached your taste buds, but somehow you still feel subsumed in its rich flavor, like your lips are two extra tongues. It’s a dizzying, heady brew of passion and contentment and all the best-smelling flowers in the universe rolling into one petite little package. You experimentally lick one of her petals and shudder wildly, your body thrashing in its binding as you experience your first ever tongue-gasm.");
	output("\n\n<i>“Mmm, no wonder you animals like to breed so much. Keep licking,”</i> your green mistress instructs, thrusting her hips into your face. Her tentacles coil tight around the rest of you, supporting the rest of your body so that you can focus entirely on moving your tongue in the right ways. ");
	if(pc.cockTotal() == 1) output("One slips around your [pc.cock] as if it was meant to hold it. It probably was, the tight sleeve of rippling flesh is going to make you cum so many times, nectar-goddess permitting.");
	else if(pc.cockTotal() > 1) output(StringUtil.upperCase(num2Text(pc.cockTotal())) + " slip onto your [pc.cocks], sized perfectly to hold each of them. The wriggling, sucking sleeves fit as if they were grown specifically to milk you, and they’re going to be so successful, nectar-goddess permitting.");
	if(pc.totalVaginas() == 1) output(" A turgid tentacle slips off your thigh and buries itself deep into your [pc.vagina] in a single, scintillating thrust, spearing you on your nectar-goddess’s organ. It fills you up so completely, fits your passage so flawlessly, that you can only assume she grew it specifically to tend to your feminine flower.");
	else if(pc.totalVaginas() > 1) output(" Turgid tentacles slip off your [pc.thighs] and bury themselves deep into your [pc.vaginas] in coordinated thrusts, spearing you on your nectar-goddess’s organs. They fill you up so completely, fit your passage so flawlessly, that you can only assume she grew them specifically to tend to your feminine flowers.");
	if(pc.canLactate()) output(" Your [pc.nipples] squirt [pc.milk], but that’s okay. There’s something sucking on them. The venus pitcher’s special nectar is so good that it makes you spray [pc.milkNoun] harder than you ever have before. You could milk yourself dry just from licking her fragrant cunt. You wouldn’t need a single suck on your sloppy teats.");

	output("\n\nStars... oh stars...");
	if(pc.hasCock())
	{
		output(" [pc.Cum] squirts in thick ropes into the tentacle");
		if(pc.cockTotal() > 1) output("s");
		output(".");
	}
	if(pc.hasVagina()) 
	{
		output(" [pc.GirlCum] erupts around the tentacle");
		if(pc.totalVaginas() > 1) output("s");
		output(", wrung from a place deep inside you.");
	}
	output(" You lick, and you cum... or something that feels like cumming anyway. There’s no cooldown, no post-coital satisfaction, just swaying between sublime bliss and aching, incredible need. You stab your tongue deep inside her cunt, your [pc.lips] sealed tight to her petals. Her ambrosia flows down your gulping throat as you try your best not to lose a single droplet of it.");

	output("\n\nYou can’t go back. You don’t want to go back. This moment needs to go on forever. Every lewd-sounding slurp rings in your ears. Motes of indescribable, heavenly ecstasy wrap your tongue up inside their honeyed embrace, somehow more important for your mind to observe than the ");
	if(pc.hasCock()) output("cock");
	else if(pc.hasVagina()) output("pussy");
	else output("boob");
	output("-draining orgasms shuddering through the rest of your body. You could float away on clouds made entirely of the flavor of this venus-pitcher’s cunt, your mind disconnecting from a fleshy husk capable of little more than service to its flowery queen.");

	output("\n\nYou love her, especially her pussy, and her pussy loves you back. That’s why it keeps giving you more to drink, more mind-meltingly good cuntjuice. Any resistance to the idea of serving this venus pitcher... any venus pitcher is gone, liquefied and sucked away by her tentacles, replaced with sublime obedience and the silky warmth that drizzles from her juicy snatch onto your sluttily wiggling tongue.");
	output("\n\nThrust. Slurp. Cum. Obey. Lick. Simple concepts are at the helm, the rest of your brain too drugged up and cummy for anything more complex. You’re just a tongue and an endless series of orgasms, more pet than person.");
	pc.milked();
	pc.milked();
	processTime(65);
	for(var x:int = 0; x < 10; x++)
	{
		pc.orgasm();
	}
	pc.milked();
	clearMenu();
	addButton(0,"Next",venusPitcherBadEnd5);
}

public function venusPitcherBadEnd5():void
{
	clearOutput();
	author("Fenoxo Fenfen");
	showBust("");
	showName("NEED... MORE\nPITCHERS");
	output("When you’re dumped out onto the forest floor, you don’t bother getting up - partly because you’re exhausted, partly because you secretly hope she’ll come back up for another round. It’s an hour before you finally have the energy to rouse yourself, and by then you’re bitterly missing the taste of her ambrosia.");
	output("\n\nDully, you realize that ");
	if(pc.balls > 0)
	{
		output("your [pc.balls] ");
		if(pc.balls <= 1) output("has");
		else output("have");
		output(" already refilled, flush and plumper than you remember. In no time at all, you’ve come down with a case of blue balls so severe that only another pitcher can save you.");
	}
	else if(pc.hasCock())
	{
		output("[pc.eachCock] has swollen with impractical turgidity, hard and leaking. Internally, you can feel the [pc.cumNoun] simmering, aching to get out, like you’ve spent three days straight edging and desperately need another pitcher to pour your lust into.");
	}
	else if(pc.hasVagina()) output("[pc.eachVagina] is already soaked and needy, sending tingles of remembered pleasure to your brain that remind you how good it felt to be stuffed by the pitcher.");
	else output(" [pc.MilkNoun] dribbles from your [pc.nipples], your [pc.chest] producing it so quickly that you doubt you can go more than an hour without making a [pc.milkColor] mess.");

	output("\n\nYou stumble into the woods in search of another venus pitcher, licking your chapped lips and promising that this one will be the last one. After this, you can go back to your usual routine. Just one more pussy-licking, mind-shattering series of orgasms and you can go back to being an heir" + pc.mf("","ess") + " on a mission.");

	processTime(25);
	pc.ballFullness = 100;
	pc.milkFullness = 100;
	pc.changeLust(30);
	
	clearMenu();
	addButton(0,"Next",venusPitcherBadEnd6);
}

public function venusPitcherBadEnd6():void
{
	clearOutput();
	author("Fenoxo Fenfen");
	showBust("VENUS_PITCHER_ELDER");
	showName("VENUS\nPITCHER");
	output("The next venus pitcher you encounter is even more well-developed than the last. Her pendulous tits hang down to her waist when you find her. Inky green nipples sway back and forth with her breath, something she is all too happy to accentuate when she sees your state. Your mind all but shutting down in the face of such erotic mesmerization is no surprise. It’s expected. You sink into her arms, into her pod, into bliss, into <i>your purpose</i>.");
	//Cock
	if(pc.hasCocks())
	{
		output("\n\nYou can’t get your [pc.cocks] into her tentacles fast enough. Their vice-like squeezing is a balm for your hyper-engorged erections. The rapid back-and-forth pumping of your members is better than masturbation - hell, it’s better than sex! When you orgasm, and you do so often, your ejaculations seem endless, voluminous in the extreme. They bloat the tentacles with the immense size of your spurts, sending fat bulges along the hungry floral lengths, yet you never tire. Refractory periods may as well not exist for you at this point, allowing you to suck and fuck for as long as your leafy mistress will allow.");
	}
	else if(pc.hasCock())
	{
		output("\n\nYou can’t get your [pc.cock] into her tentacle fast enough. Its vice-like squeezing is a balm for your hyper-engorged erection. The rapid back-and-forth pumping of your member is better than masturbation - hell, it’s better than sex! When you orgasm, and you do so often, your ejaculations seem endless, voluminous in the extreme. They bloat the tentacle with the immense size of your spurts, sending fat bulges along the hungry floral length, yet you never tire. Refractory periods may as well not exist for you at this point, allowing you to suck and fuck for as long as your leafy mistress will allow.");
	}
	//Cunt
	if(pc.hasVagina())
	{
		output("\n\nTwo tentacles slam into your [pc.vagina] in unison, the narrow lengths curling around one another to give your insatiable box the fucking it oh-so-clearly needs. You can hardly contain the joy they stir up in your loins. Were it not for the nipple in your mouth, you’d be screaming in heedless joy, ripping your voicebox ragged in an attempt to let the universe know just how completely you’re controlled by the pleasure ");
		if(pc.legCount > 1) output("between your [pc.legs]");
		else output("driving deep beneath your [pc.leg]");
		output(".");
	}
	//Milkymilk
	if(pc.biggestTitSize() >= 1)
	{
		output("\n\n[pc.Milk] erupts from your [pc.nipples] the moment the verdant enchantress’s tendrils secure your tits. Your [pc.chest] is heavy and wet, wobbling and spraying. The thin streams fork in dozens of different directions, but the venus pitcher’s straining suckers catch it all. Good thing, too because you’re a milky, milky [pc.girlBoy]. Every ounce you swallow seems to go straight to your [pc.milkNoun]-tanks, only to pour back out into the pitcher in an endless cycle that leaves you hornier and more blissed out with every repetition.");
	}
	//Merge
	output("\n\nEverything is wet and warm and cummy and comforting and just so... so perfect. You must spend hours in the greater pitcher’s embrace, giving her everything you can, listening to her sweet voice tell you how to spend the rest of your life. Her words are so sweet and so firm that they seem to slip right through what few conscious thoughts are left to you, snuggling into every crack and crevice in your brain where they can wait to activate.");
	output("\n\nAccepting her words is almost as hot as having your face pressed between her legs and receiving her blessed nectar. It’s almost as hot as completely submitting your will to her guidance, as giving her complete control over your mind in exchange for another few moments between her legs. Your stomach gurgles, totally overpacked, and still you drink...");
	pc.milked();
	pc.milked();
	processTime(65);
	pc.milkInMouth(chars["VENUSPITCHER"]);
	for(var x:int = 0; x < 10; x++)
	{
		pc.orgasm();
	}
	pc.milked();
	clearMenu();
	addButton(0,"Next",venusPitcherBadEnd7);
}

public function venusPitcherBadEnd7():void
{
	clearOutput();
	author("Fenoxo");
	showBust("VENUS_PITCHER_ELDER","VENUSPITCHER","VENUSPITCHER");
	showName("BAD\nEND");
	output("This time, you don’t waste any time when you wake. The sweet residue on your lips invigorates you. The rapacious hunger between your [pc.thighs] guides you. You stagger off into the woods to search for the next pitcher. There’s still so much pleasure to experience, so many pitchers to serve. You can kneel before each of them and beg them to have you. Nothing else matters.");
	
	processTime(231);
	
	pc.maxOutHP();
	pc.maxOutEnergy();
	pc.maxOutLust();
	
	badEnd();
}

public function venusFlowerDrops():Boolean
{
	var bonus:int = 0;
	
	if(flags["EMMY_QUEST"] == 0) bonus += 100;
	if(flags["ENABLE_LYS_FLOWER"] != undefined) bonus += (flags["GAVE_LYS_FLOWER"] == undefined ? 100 : 30);
	
	// default 20% chance + bonus
	return ((rand(100) + bonus) >= 80);
}

//Venus Pitcher Post Sex or Avoidance
public function venusPitcherBonusFlower():void
{
	clearOutput();
	showName("AN EXOTIC\nFLOWER!");
	showBust("");
	if(flags["EMMY_QUEST"] == 0)
	{
		output("Ever since Emmy asked you for an exotic flower, you’ve kept your eyes open for a good one, and now there’s one laying on the ground right in front of you! The venus pitcher must have shed this one in her hurry to escape underground, leaving a pink and purple bloom that’s sure to dazzle the eye and delight the nostrils. You even sniff it a few times to make sure it doesn’t have any of that sneezy pollen that clouds the air around the plant-women.");
		if(venusSubmission() >= 40) output(" Sadly, it doesn’t.");
	}
	else
	{
		output("Oh hey, there’s a particularly pretty bloom left on the ground, dazzlingly purple and pink. Better yet, it smells delightful.");
		if(flags["ENABLE_LYS_FLOWER"] != undefined && (flags["GAVE_LYS_FLOWER"] == undefined || rand(4) == 0)) output(" Maybe Lys will" + (pc.isBimbo() ? ", like," : "") + " appreciate it.");
		else output(" Should you" + (pc.isBimbo() ? ", like," : "") + " take it with you?");
	}
	//Acquire bloom
	output("\n\n");
	clearMenu();
	addButton(0, "Take It", quickLoot, new VenusBloom());
	addButton(1, "Leave It", mainGameMenu);
}

