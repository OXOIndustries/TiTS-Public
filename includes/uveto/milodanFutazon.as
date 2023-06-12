
/**
 * Written by QuestyRobo
 * Coded by gena138. First coding project, let me know if I royally fucked anything
 * */
//When you reach level 8, you will get an email from Joyco when you next land on Uveto
//Encounters with Futazon Milodans won't start until you receive this email
//Bruisers are encountered once the player reaches level 10 and has encountered a Milodan Amazon before.
//Any encounter with a Milodan Amazon has a 1/2 chance to be a Bruiser.
//Normal version has a 22-inch cock. Bruiser has a 40-inch cock

//Combat:
//Base: Very similar to a Milodan male, only always enraged, and with less health.
//Bruiser: Very high strength, very high health.
//Can’t be defeated with lust. When lust reaches max, she will use Release and be stunned and knocked prone.
public function joycoUvetoHazmatAdvisoryEmail():String
{
	// From: JoyCo HR <HumanResources@JoyCo.corp
	// To: PC Steele
	// Subject: Urgent: Hazmat Advisory
	var eText:String = "";
	eText += "<i>As you open the message, an almost annoyingly cheery tune starts playing, and the holographic visage of a wide-smiling droid comes into view.</i>";
	eText += "\n\nGreetings... " + pc.nameDisplay() + " Steele! This is an automated message from Joyco. Our systems have informed us that a recent incident may have released a potentially hazardous material within the proximity of your current location. Don’t worry, our team of safety experts are already on the case, and should have the incident dealt with in a timely manner. In the meantime, please avoid any seemingly deformed or mutated flora or fauna.";
	eText += "\n\nPlease contact our support line with any further questions. Have a nice day!";
	eText += "\n\n<i>Well, that was a whole lot of nothing. Before you can close the message a wall of legal text comes up, ending with </i>“By reading this message you acknowledge that Joyco is not liable for any harm done to you or your property, as you have been properly made aware of the potential dangers present.”";
	eText += "\n\n<i>Typical.</i>";

	return doParse(eText);
}

// This assumes that both base and bruiser variants will have nude variants as well
public function showMilodanFutazon(nude:Boolean = false):void
{
	if (enemy is MilodanFutazon)
	{
		showBust("MILODAN_FUTAZON" + (nude ? "_NUDE" : ""));
		showName("MILODAN\nAMAZON");
	}
	else
	{
		showBust("MILODAN_BRUISER" + (nude ? "_NUDE" : ""));
		showName("MILODAN\nBRUISER");
	}
	author("QuestyRobo");
}
//There's definitely a more elegant way to do this, but it works
public function encounterMilodanFutazon():void
{
	//Can be encountered anywhere where Milodan Priestesses can.
	//First Encounter
	var tEnemy:MilodanFutazon = new MilodanFutazon();
	setEnemy(tEnemy);
	showMilodanFutazon();
	if(flags["MET_MILODAN_FUTAZON"] == undefined)
	{
		output("\n\nYour codex suddenly starts blaring out an alarm. You silence it and take a look.");
		output("\n\n<i>“Warning: Hazardous material present. Proceed with caution.”</i>");
		output("\n\nLooking around, nothing seems out of the ordinary. Maybe it’s under the ice? Oh Void, what if it’s airborne! As you cover your mouth, you hear someone moving in the distance. They come into view out of the blowing snow, and you see a female milodan. She’s hobbling, twitching and stumbling with each step. Her fur is dripping wet, matted down with some unknown substance.");
		output("\n\nYour codex beeps louder and louder as she approaches, still warning you about hazardous material. You pull out your [pc.weapon] and yell at her to stop, but she doesn’t listen. Her eyes are wide, bloodshot, pupils dilated. Whatever’s covering her is obviously bad news.");
		output("\n\n<i>“G-gah! T-the matron never said it would burn this much! It’s seeping into me... I-I can’t breathe!”</i> You reach out and tell her you can get her some help, but before you can say anything more, she freezes up. Her body pulses as the liquid on her seems to disappear before your eyes. Each pulse leaves her larger than before, gradually increasing in intensity as time goes on.");
		output("\n\nYou back up, speechless at what’s happening in front of you. She’s grown at least a foot taller in seconds; muscles all over her body engorge and tighten, to the point where they’d make many males of her species look feeble. Her fangs lengthen while her fur grows thicker and more shaggy, giving her the look of some wild beast. The centerpiece, however, is a large bulge at her crotch. Before your eyes, it blossoms into a fully formed milodan cock and balls. It springs to full tumescence as it grows to nearly two feet, and her balls follow suit, becoming as large as ripe watermelons.");
		output("\n\n<i>“YEEEEEEEEEEES!”</i> she roars. <i>“It’s as amazing as they said it would be! The power... YOU!”</i> She points straight at you. <i>“You’ll do nicely for my first slut. Put that thing down and get on your knees!”</i> You keep your [pc.weapon] steady, ready to fight. <i>“Fine, I need to break <b>all</b> of this in anyway.”</i> The behemoth charges you, more than ready to get down and dirty.");
		output("\n\n<b>It’s a fight!</b>");
	}
	//repeat
	else
	{
		output("\n\nFamiliar growls echos out across the icy tundra. You turn your head and see the hulking figure of a milodan amazon charging at you with her fangs and claws bared, ready to dig into you. Seeing nowhere to escape to, you draw your [pc.weapon] and get ready to engage.");
		output("\n\n<b>It’s a fight!</b>");
	}
	IncrementFlag("MET_MILODAN_FUTAZON");
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(milodanFutazonWin);
	CombatManager.lossScene(milodanFutazonLose);
	CombatManager.displayLocation("MILO AMAZON");
	clearMenu();
	addButton(0, "Next", CombatManager.beginCombat)
}
public function encounterMilodanBruiser():void
{
	//First Bruiser Encounter
	//Bruisers are encountered once the player reaches level 10 and has encountered a Milodan Amazon before. Any encounter with a Milodan Amazon has a 1/2 chance to be a Bruiser.
	//clearOutput();
	var tEnemy:MilodanBruiser = new MilodanBruiser();
	setEnemy(tEnemy);
	showMilodanFutazon();
	if(flags["MET_MILODAN_BRUISER"] == undefined)
	{
		output("\n\nA beast-like howl rings out over the icy tundra. It sounds like a massive wild animal but you soon find out that it’s far worse than that. Emerging out of the dense blizzard is an absolutely mammoth figure. She looks like the amazon milodans you’ve been encountering up until now only far, <i>far</i> larger!");
		output("\n\nWhereas the amazons before could stand shoulder-to-shoulder with the males this one makes them look absolutely puny in every aspect. Her muscles are large and powerful enough that she looks like she could punch straight through a ship hull! Her breasts are massive, easily large enough to smother any smaller person. Between her gigantic, muscled thighs and huge hips lies a truly titanic cock and balls. She’s easily near twice as large as her smaller clanmates with each of her pumpkin-sized nuts in her overstuffed sack.");
		output("\n\nShe looks down at you with an oddly calm look in her eyes. <i>“Another outsider? You really need to learn where you belong, and that’s either back where you came from or, if you’re going to be wandering out here, on my cock!”</i> She takes a few steps closer, letting you smell the overwhelming musk rolling off of her. She grins as her shadow completely covers you. “<i>So, how about you make this easy and bend over for mommy!”</i>");
		output("\n\nThe thought does cross your mind. Whether or not that’s because of her pheromones hammering at your brain or your own deeper desires is something to work out later. Right now you decide to draw your [pc.weapon] and face the giantess head-on.");
		output("\n\n<i>“Spirited. That’ll just make this more enjoyable for me!”</i>");
		output("\n\n<b>It’s a fight!</b>");
	}
	//repeat
	else
	{
		output("\n\nLoud stomps ring out over the Uvetan wastes. Looking behind you, you see the imposing silhouette of an extra-large milodan amazon stomping toward you. She grins down at you and lets out a low snarl as she extends her claws and gets ready to tear you down!");
		output("\n\n<b>It’s a fight!</b>");

	}
	IncrementFlag("MET_MILODAN_BRUISER");
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(milodanFutazonWin);
	CombatManager.lossScene(milodanFutazonLose);
	CombatManager.displayLocation("MILO BRUISER");
	clearMenu();
	addButton(0, "Next", CombatManager.beginCombat);
}
//Victory
public function milodanFutazonWin():void
{
	showMilodanFutazon();
	output("The Milodan stumbles and falls to her knees, succumbing to her wounds. Rather than pain, though, she seems to derive pleasure from being beaten down so thoroughly. Her dick is rock-hard and leaking copious amounts of pre all over the cold ground.");
	output("\n\n<i>“Yeeeeeeeeeeees. The fight, the violence! You are magnificent! This body begs for you. Please appease it!”</i>");
	output("\n\nShe looks like she’s about to burst at any moment. Are you really going to take advantage of this poor, defenseless, eight-foot-tall murder-cat?");

	clearMenu();
	if (pc.hasCock()) 
	{
		if(pc.cockThatFits(enemy.vaginalCapacity(0)) >= 0) addButton(0, "Fuck Her", penisRouter, [winAgainstMilodanFutazonFuckHerChoice, enemy.vaginalCapacity(0), false, 0],"Fuck Her", "Fuck the milodan with your penis.");
		else addDisabledButton(0,"Fuck Her","Fuck Her","You’re too big to fit inside her.");
	}
	else addDisabledButton (0, "Fuck Her", "Fuck Her", "You need a phallus for this!");

	if (pc.cuntThatFits(enemy.biggestCockVolume()/2) < 0 && enemy.biggestCockVolume()/2 > pc.analCapacity()) addDisabledButton(1, "Get Fucked", "Get Fucked", "You’d rather keep your organs right now!");
	else addButton(1, "GetFucked", vaginaRouter, [winAgainstMilodanFutazonGetFucked, enemy.cockVolume(0)/2, 1, -1], "Get Fucked", "Let her take the lead and make her fuck you on your terms.");

	addButton(2, "EatHerOut", winAgainstMilodanFutazonEatHerPussy);
	if (enemy is MilodanFutazon) addButton(3, "SuckHerOff", winAgainstMilodanFutazonSuckHerOff);
	else if (flags["USED_SNAKEBYTE"] != undefined) addButton(3, "HyperSuckHer", winAgainstMilodanFutazonHyperSuckHer, undefined, "Hyper Suck Off", "Use your extra-stretchy mouth to tame her titanic totem.");
	else addDisabledButton (3, "HyperSuckHer", "Hyper Suck Off", "You’d need some heavy-duty jaw mods in order to pull that off.");

	addButton(14, "Leave", leaveMiloFutaAfterWin);
}
public function leaveMiloFutaAfterWin():void
{
	clearOutput();
	showMilodanFutazon();
	output("You leave the Milodan Amazon behind you and continue on your way.\n\n");
	CombatManager.genericVictory();
}
//Fuck Her
//Choice appears if you have multiple dicks.
public function winAgainstMilodanFutazonFuckHerChoice(x:int):void
{
	if(pc.hasCocks())
	{
		clearOutput();
		output("You’ve got some options here. Do you want to double-stuff her?");
		clearMenu();
		addButton(0, "Just One", winAgainstMilodanFutazonFuckHerOneCock,x);
		addButton(1, "Double-Stuff", winAgainstMilodanFutazonFuckHerTwoCocks,x);
	}
	else winAgainstMilodanFutazonFuckHerOneCock(x);
}

//Fuck Her One Cock
public function winAgainstMilodanFutazonFuckHerOneCock(x:int): void
{
	clearOutput();
	showMilodanFutazon(true);
	output("You whip out your [pc.cock " + x + "] and present it to the Amazon. Without any hesitation or resistance, she practically leaps onto your crotch and starts taking it into her mouth. ");
	//Normal sized cock
	if (pc.cocks[x].cLength() <=6)
	{
		output("The cock-hungry kitty devours your member whole, managing to fit the whole thing inside the warm, rough wrapping of her tongue. The sensation makes you want to cum on the spot but you this is just the beginning.");
		output("\n\nShe unwraps your dick from her tongue. <i>“Such delicious tastes you outsiders have. Perfectly fitting for someone as strong as you. I can’t wait to feel it inside me!”</i>");
	}
	//Big dong
	else if (pc.cocks[x].cLength() <=12)
	{
		output("The cock-craving amazon slowly works down your sizable member, devouring inch after inch until she inevitably reaches the base. She sits there for a good minute, slowly wrapping and unwrapping your [pc.cockNounSimple " + x + "] in her rough, cat-like tongue while her muzzle remains almost glued in place.");
		output("\n\nJust when you think she’s going to push you all the way, she stops, pulls off, and stares you right in the eye. <i>“A cock fit for a conqueror! ");
		//Female-Identifying
		if(pc.mf("","f") == "f")
		{
		output("<i>We’ve never inducted an outsider into our clan, but perhaps if you continue to impress we could make you the first!”</i> ");
		if (pc.isAmazon()) output("\n\nConsidering where she is right now you’d dare say that unless her sisters are way more impressive you could do far more than just be inducted into her tribe! Visions of yourself standing triumphantly on top of the former chieftain of these furry sluts as you crown yourself their new leader. Might be a little overconfident on your part, but hey, you’re already on a pretty crazy quest as it is so you might as well.");
		else output("\n\nThe thought of going through whatever “induction” turned her into this makes your stomach sour. It’d be best to keep caution around these girls even when you win. You never know when they’ll try to force the issue.");
		}
		//Male-Identifying
		else output("We don’t take men into our own ranks, but I’m sure you’d be <b>more</b> than capable of matching our males!”</i>");
		output("\n\nYou have to say, dropping civilized life to live on a frozen tundra with a bunch of violent cat men doesn’t sound like the most tempting idea.");
	}
	//Huge dong
	else
	{
		output("The cock-obsessed milodan seems almost in awe of the size of your member. She takes several tentative licks of your [pc.cockHead " + x + "] before she even begins to take it into her mouth. Even as large as she is she still has trouble taming your sheer size. It’s obvious that she’s not the type to be deterred though, and she soon begins hammering her face into your member, forcing down as much of it as possible and then telling possible to go fuck itself and shoving even more down. ");
		if (enemy is MilodanFutazon) output("\n\nImpressively she manages to get just over half of you in, though she does so by pushing to her absolute limit and she’s forced to come up for hair, coughing up as she gets off your dick. <i>“A-a challenge on the battlefield and in bed! Truly you are an impressive specimen for an outsider, but I will not be deterred!”</i>");
		else output("\n\nThe over-sized amazon takes you with enthusiasm, shoving down inch after inch of your plus-sized meat. She gets around the three-fourths mark before she needs to come up for air. <i>“Impressive size for an outsider. Unfortunately for you, I’m used to handling such sizes so you’ll need far more to truly impress me!”</i>");
	}
	//Merge
	output("\n\nThe now-submissive milodan slams back down on your [pc.cock " + x + "], devouring it all in one quick motion. ");
	if (pc.cocks[x].cLength() > 12) output("She looks up at you defiantly, full of pride at being able to take you all the way.");
	output("She hammers up and down for a few seconds, just to make sure you’re lubed up and ready before she turns around presents her hindquarters to you.");
	output("\n\n<i>“Time to prove that thing is for more than just showing off!”</i> She gives her rear a good, hard slap just in case you weren’t sure what she was talking about. Her pussy is absolutely soaked in fragrant juices that seem to have soaked into the surrounding fur far too much for her to have only gotten wet in the past few minutes. Her cock is also rock hard and drooling steaming cum onto the frozen ground. She’s as ready as she’ll ever be, and you can’t say you’re feeling any different! You move up, grab her flanks, and press your [pc.cock " + x + "] against her drenched pussy lips.");
	//Normal or big cock
	if (pc.cocks[x].cLength() <=12)
	{
		output("\n\nShe takes everything you have with ease, groaning shamelessly as you bottom out. <i>“I hope you won’t disappoint me now. Or is your fight in bed not nearly as impressive as your fight in battle?”</i>");
		output("\n\nGracious even in defeat, as you’d expect. Lucky for her you have no intention of letting her go without a healthy fucking!");
	}
	//Huge cock
	else
	{
		if (enemy is MilodanFutazon)
		{
		output("\n\nHer hole struggles to take your sheer girth but you press on anyway. After all, this is what she wanted, isn’t it?");
		output("\n\n<i>“Uggghh, such immense strength! Only our eldest who drank deeply of the sacred waters could match you, outsider. Don’t you dare hold back! I want everything you have so that I may become worthy of them.”</i>");
		output("\n\n The thought of there being milodans even bigger than her sends a shiver up your spine. Whether that shiver is fear or excitement is something you’ll have to figure out later.");
		}
		else
		{
		output("\n\nThe fit is tight but, true to her word, she takes it like a pro. Since she’s so accommodating you decide to step it up a notch and give her all you’ve got!");
		output("\n\n<i>“That’s it, give it all to mommy! From here on we are animals! We do not think we only act in pure passion! Don’t hold back. I will not hesitate to overwhelm you if your strength begins to wane!”</i>");
		}
	}
	pc.cockChange();
	output("\n\nYou hammer away at her with all your might. Wet arcs of girlcum are already jetting out of the seal between your dick and her pussy lips. It’s a testament to her wetness that she hasn’t cum yet and there’s already this much. In no time you feel and hear the copious excess run off of your oversaturated crotch and pool on the ground below you. On the other side, the dick-crazy milodan is moaning and howling out loud in pleasure, screaming for you to fuck her harder and harder. You worry that her yelling might attract some unwanted attention. Then again, you doubt there are too many things out there that would want to mess with a mutant milodan amazon in mid-coitus.");
	output("\n\nYou meet her demands as best as your body is able to. Your movements grow faster and more erratic with each passing thrust. The mutated milodan soon begins throwing her own sizable hips back into yours, taking over the pace of the rut in order to keep you moving faster. You’d try and stop her, after all, you were the one who won so you should set the pace, but right now you don’t really care. The sheer, pelvis-mashing ecstacy overrides any desire to slow down for any reason.");
	output("\n\nSoreness starts to take root in your crotch as you and her pound together with wild abandon. Were you in a better state of mind, you’d be inclined to slow down, but the constant waft of concentrated pheromones has your mind swimming in thoughts of fucking and rutting the muscular sabertooth. She looks back at you and grins, knowing full well that you’re giving her exactly what she wants even though she lost. You feel like you should be mad, but does it really matter who wins when you feel this good? You swear you catch the milodan nodding in agreement, almost as though she knows exactly what you’re thinking.");
	output("\n\nSoon you start having trouble telling where your pelvis ends and hers begins. You spend more time with them mashed together than not, and the amount of sweat and heat being shared from the contact makes it feel like you’re melting into her. Even the lusty pussy is starting to feel the heat. She’s panting and huffing, her groans taking on a huskier, more ragged tone as she struggles to stay afloat mentally.");
	if (pc.cocks[x].cLength() <=12)
	{
		output("\n\nYou feel her pussy convulse and throb harder and harder around your [pc.cock " + x + "]. Her juices flow faster and hotter as she edges closer to orgasm. Her body convulses and heats up as she starts to roar like a wild beast, actually starting to steam in the biting hot wind of the Uvetan wastes. Her insides feel like a smelter cranked up to max, smelting your rigid iron bar of a cock until it reaches its figurative melting point.");
		output("\n\n<i>“Are you close, outsider? Good, you can breed me while I cum!”</i>");
		output("\n\nIf she insists then you’re all for it!");
	}
	else
	{
		output("\n\nWith how utterly your [pc.cocks " + x + "] dominates her pussy it’s hard to really discern anything from the movements of her vaginal muscles but even an idiot could tell that she’s close to cumming her brains out. She’s mewling like a house cat in heat and is barely holding herself up. Her body is so hot that it’s actually steaming, and her insides feel almost like they’re melting around your [pc.cockNounSimple " + x + "].");
		if (enemy is MilodanFutazon)
		{
		output("\n\n<i>“I-I will not break, outsider! N-no matter how amazingly huge it is, no matter how incredible it feels I w-wi... I will... F-fuuuuuuuuuck!”</i> One last thrust seems to send her careening over the edge and you can’t help but dive right over with her!");
		}
		else
		{
		output("\n\n<i>“There, THERE! Yes, outsider! You’re a beast, a monster! Give me all of your wild strength. All of your power!”</i>");
		output("\n\nIf that’s what she wants then that’s exactly what she’s going to get!");
		}
	}
	//Normal cums
	if (pc.cumQ() <= 800)
	{
		output("\n\nYour [pc.cock " + x + "] swells inside the boiling-over milodan’s sweltering pussy and explodes, firing out ropes of [pc.cum] thicker than you thought you were capable of. Unfortunately it’s nothing but a drop in the bucket next to her climax. Girlcum floods out of her pussy in thick geysers, your own orgasm registering as only faint [pc.cumColor] clouds in the otherwise mostly clear puddles on the ground.");
		output("\n\n<i>“A bit disappointing, but the chieftain says the sacred waters have increased our fertility immensely, so I may still bear your child.“</i> She pushes herself off your cock and stands up on shaky legs. Girlcum leaks out of her pussy like a faucet while her cock continues to bounce and jealously fire off its own load. <i>“Continue your conquests, outsider. My sisters and I love strong mates and strong offspring.”</i>");
		output("\n\nWith that, she leaves you alone to celebrate your very confusing victory before you{crotch covered: put your [pc.cock " + x + "] away and} resume your journey.");
	}
	//Big cum cums
	else if (pc.cumQ() <= 3000)
	{
		output("\n\nYour urethra bulges out as your load travels up your shaft and towards its goal. [pc.cum] lances out of you and straight into her womb, setting her off in explosive fashion. Your immense output is a perfect compliment to her own, swelling out her belly until she looks like she’s pregnant already, all the while her waterfalling girl juices are stained [pc.cumColor] for the excess.");
		output("\n\n<i>“Mhmmm, your output is very impressive outsider. I’ll be going back to the village with a nice litter in me!”</i> She pushes off your [pc.cock " + x + "], leaving you to fire off the remainder of your orgasm onto her huge, muscular butt. Her own cock is still hosing down the cold ground in front of her, seemingly trying to compete with your own despite it never being put to use. She rubs your payload in before casually sashaying away, your [pc.cum] still leaking between her legs as she walks.");
		output("\n\nYou’re still not quite sure who won there but looking down at your sated, softening dick tells you that it doesn’t really matter. You get yourself back in order and set out again, wondering what you’ll run into next.");
	}
	//Big huge mega boy cums
	else
	{
		output("\n\nYour urethra swells out ridiculously as your immense orgasm starts rushing toward freedom like a river rushes out a burst dam. You feel huge gouts firing out already, swelling out the unsuspecting milodan’s belly substantially. She coos and cums at the feeling of you filling her so thoroughly. The poor girl doesn’t even realize that what you’re pumping out now is just a prelude, the meager excess forced out ahead of your real load.");
		output("\n\nYou scream out in bliss as the pressure inside your cumvein finally begins to vent. The milodan goes silent as her stomach fills to bursting in a matter of seconds. You fill her womb so much that there’s not a single micrometer left for it to hold your [pc.cum] in, and it all comes rushing out into a pool on the ground.");
		//Mega ultra huge awesome big boy cums
		if (pc.cumQ() >= 8000) output("That pool widens and widens as your god-like virility makes itself known. No living being should be able to cum this much or experience this much pleasure, but thanks to modern science you’ve been able to transform yourself into a one-" + pc.mf("man", "woman") + " biblical flood!");
		output("\n\nHer hands dart down to her own cock, squeezing out her comparatively microscopic orgasm. <i>“O-outsider... you could impregnate our entire village with just this...</i>");
		if (pc.cumQ() >= 8000) output("<i>You may even be more virile than the sacred mistress!</i>");
		output("<i>”</i> The pressure finally becomes enough that you’re forced out of her, letting you absolutely plaster her ");
		if (pc.cumQ() >= 8000) output("and everything within about a dozen meters of her");
		output("in your ultra-sized load.");
		output("\n\nBy the time you’re done, the overloaded amazon lies plastered to the frozen ground, unable to do much more than twitch and moan. You doubt she’s even conscious at this point. Satisfied and with nothing better to do, you wipe off your [pc.cock " + x + "] onto a patch of fur that wasn’t completely coated by your orgasm and get yourself ready to press on once again. As you leave her, the thought of potentially ending the plague of amazon milodans by weighing them down with your sheer virility crosses your mind. An unconventional solution, but one you think your dad would be proud of!");
	}
	output("\n\n");
	processTime(30);
	enemy.loadInCunt(pc,0);
	pc.orgasm();
	CombatManager.genericVictory();
}
//Fuck Her Two Cocks
public function winAgainstMilodanFutazonFuckHerTwoCocks(x:int):void
{
	clearOutput();
	showMilodanFutazon(true);
	var y:int = pc.cockThatFits2(enemy.vaginalCapacity(0));
	//If the PC picked the second-best fit for the pussy, use the first-best fit for the ass.
	if(x == y) 
	{
		y = pc.cockThatFits(enemy.vaginalCapacity(0));
	}
	output("You whip out your multiple members for the amazon, eliciting an intrigued coo from the mutated milodan. <i>“Very interesting, outsider! I’ve only seen one of my sisters grow a second one. Unfortunately, the chieftain took her for herself, but I’m sure you’ll be a good substitute.”</i> She gives you a toothy grin and grabs " + (pc.cockTotal() == 2 ? "both":"two") + " of your [pc.cocks] and begins to stroke them.");
	output("\n\nShe gives each member her best attention, stroking up one while going down the other. The desynchronized sensation is jolting. Even for as long as you’ve had these, it seems like it’s just something your brain wasn’t designed to fully handle. She takes full advantage of your confusion and goes all out. Her pace changes erratically, speeding up and slowing down at random intervals on each of your [pc.cocks].");
	output("\n\n<i>“Are you struggling, outsider? Of course you are. I can only imagine it’s something like my induction. So unnatural, so wrong, and yet it feels so good that it must be right, and afterward you can’t imagine going back.</i>");
	if (enemy is MilodanBruiser) output(" <i>The only difference is that I’ve taken myself even further. Perhaps you will too one day.</i>");
	output("<i>”</i> You don’t answer beyond a pleasured grunt but you can’t deny what she’s saying. There <i>is</i> something so overindulgent about having " + (pc.cockTotal() == 2 ? "two":"so many") + " cocks. You were never meant to experience these levels of pleasure but modern science has allowed you to pin mother nature down and rail her like a cheap slut, and you wouldn’t have it any other way!");
	output("\n\nPre starts ");
	//normal cums
	if (pc.cumQ() <= 800) output("dripping");
	//big cum cums
	else if (pc.cumQ() <= 3000) output("leaking");
	//mega big huge big cums
	else if (pc.cumQ() <= 8000) output("spewing");
	//mega ultra huge big boy cums
	else output("almost geysering");
	//Merge
	output(" from your shafts as the milodan masturbation-aid just smiles up at you. ");
	if (pc.balls > 0) output("While she’s working your cocks she decides to bend down and lick at your [pc.balls]. Her rough, cat-like tongue glides over your sack, sending your testes throbbing and sloshing from the added sensation.");
	else if(pc.hasVagina()) output("While she’s working on your cocks, she takes notice of your other set of sex organs. Testing her flexibility, she leans down and laps at [pc.oneVagina] all the while she continues to stroke you almost perfectly.");
	output(" Your whole crotch feels set ablaze by her expert ministrations. It’s surprising; even with all the monstrous changes she’s undergone, she’s still able to give this sort of treatment.");
	output("\n\nShe lets up and stands after a few minutes, right before you fly over the edge. You moan quietly under your breath as you try to calm down, but that task becomes much harder when the curvy amazoness turns around. She gives her generous rear a two-handed slap and jiggle before she pulls her cheeks apart and reveals her pucker and pussy. Her honeypot is drooling a constant stream of her juices, so hot fresh out of her snatch that they create a cloud of steam all the way down to the ground.");
	output("\n\nShe continues teasing you; jiggling her ass, pushing it out toward you, rubbing her pussy, and overall acting like a wanton slut. <i>“Well, aren’t you going to come at me? You had so much ferocity during our fight. Has that all gone away?”</i> Her taunting snaps you out of the near-trance her teasing show had put you in.");
	output("\n\nYou rush up to the ready milodan and grasp her hard by her wide hips. She coos in delight when she feels you take charge");
	//shorty
	if (pc.tallness <= 5*12) output(", she even bends down so it’s easier for you to line up with her");
	output(". She thrusts back into you, pressing the tips of your [pc.cock " + x + "] and [pc.cock " + y + "] into her tight pucker and sweltering, leaky pussy respectively. ");
	if (pc.cockTotal() > 2) output("Your other rod" + (pc.cockTotal() == 3 ? " is" : "s are" ) + " content to just slap around on the surface of her muscular-yet-soft ass. ");
	output("\n\n<i>“You make the first move, outsider.”</i> Your cock heads are just barely inside her holes, throbbing in a way that makes it feel like they’re begging you to thrust them in. You don’t think you could resist if you wanted to! With a growl and a thrust, you bury yourself as deep inside of her as you possibly can! The cock-craving milodan lets out pleasurable growls when you start thrusting.");
	pc.cockChange();
	output("\n\nThe second you get going you can’t stop! Her pussy feels simultaneously extremely wet and inviting and pleasurably tight. Meanwhile, her ass is almost tortuously tight, making your [pc.cock " + x + "] feel like it’s being dragged through a ringer by its much easier-going brother.");
	output("\n\nThe rough contrast is confusingly pleasurable. The sheer friction is slightly painful but also highly addicting and pleasurable. Still, you make sure to scoop up some excess juice from her pussy and spread it on your member the next time you pull out. It doesn’t make it any easier to thrust back in, but it holds off the soreness.");
	output("\n\nThe muscular milodan matron gets bored with your relatively slow pace and decides to take matters into her own hands. As soon as you pull back again, she thrusts back with you, tightens up and then drags you back forward by force. She bumps you back and growls, feeling she got her point across. You prove that she has when you thrust back in. Your invigorated pace is faster and more beastial, satisfying the horny sabertooth as she starts to sync with your rhythm.");
	output("\n\nShe squeezes down every time you pull out, making you work harder and harder as you go faster. All the while she’s looking back at you with a smug, Chesire grin. She’s mocking you, but that doesn’t deter you. If anything it just drives you to go in harder! You redouble your grip, let out a mighty growl, and throw everything you have at her.");
	if (enemy is MilodanFutazon)
	{
		output("\n\nThe sturdy amazon actually starts to buckle at the sheer ferocity of your thrusting. Whenever she tries to adjust but you keep her reeling with a series of hard slaps. She thought she could set the pace for <i>your</i> prize, huh? Well, now she remembers who’s in charge now! The milodan mewls like a kitten as you utterly overwhelm her.");
		output("\n\nHer composure completely fails her when she cums. Your [pc.cocks] are squeezed down on even harder in a futile attempt to hold you back, but you will not be contained! You push her until she’s barely standing straight. Her cock fires off underneath you, the impressive cargo hitting the ground with an audible splash as it forms into a growing puddle of wasted baby-batter. The beaten-down milodan is inches away from the ground, drooling into her own seed as you dominate her.");
		output("\n\n<i>“Y-y-YEEEES! So powerful! G-give me everything! I... will endure you...”</i> Strength suddenly returns to her body as she lifts up. <i>“I... will not lose here!”</i> She seems to have gained her second wind as she fully regains her original posture. <i>“You may be stronger than me now, but I will temper myself on you so I may further please the elders. And when they grant me the privilege of drinking deeper of the sacred waters, then we shall see who is truly stronger!”</i>");
		output("\n\nYou can’t say you’ve been threatened during sex too many times, but you suppose it’s too be expected with someone like her. Despite her returned strength and defiance, she doesn’t actually resist you. You continue on as you were, almost growling along with her as you both descend into a rut.");
	}
	else
	{
		output("\n\nAs hard as you try, the beastly amazon refuses to give in. If anything your increased pace only gets her more excited. You bring your hand down on her rear, slapping her ass with all your might in an effort to bring her down. Unfortunately, she only responds with a pleasured growl and another thrust back into you.");
		output("\n\nThe only thing your rough treatment manages to accomplish is bringing her to orgasm. Her holes squeeze down like vices with her pussy firing off like a burst spigot. At the same time, her cock pours out a river of cum onto the ground, hosing it out by the gallon as you continue to plow her.");
		output("\n\n<i>“YES! Never stop fighting, outsider! Strength is all that matters now. If you cannot dominate your partner, then you deserve to be dominated! So fight! Fight me while you seed my womb or I’ll overwhelm you and take it all for myself!”</i>");
		output("\n\nA lot more fight than you were expecting from someone you just beat, but you don’t have the option of shying away now unless you want a broken pelvis!");
	}
	output("\n\nAnyone watching you or even just passing by would be very alarmed at the sight of these two rutting bodies entwined in brutal, hip-smashing coitus. The milodan roars out like a wild animal along with every thrust, and at this point, you can’t help but join in with her. Your screams attract the attention of a few passing milodans and even some korgonne, but most have the good sense to leave you well alone. Even when one milodan male does decide to try something he’s quickly scared off by the fierce amazon.");
	output("\n\nYou’re not sure how long it takes, but you eventually find yourself up against your limit. ");
	if (enemy is MilodanFutazon) output("The milodan bronco found her own limits long ago and she’s been riding them ever since.");
	else output("Meanwhile, you’re not even sure the milodan bronco has a limit! She’s been pushing you over and over again and hasn’t slowed down for a second.");
	output(" You haven’t been keeping track of her orgasms, but you’re sure that no matter how many she’s had, there’s not a creature in the known galaxy with enough hands to count them all. Your [pc.balls] tense up and you dive as deep in her pussy pussy as possible before you let it all go.");
	//Normal cums
	if (pc.cumQ() <= 800)
	{
		output("\n\nYou unload in her holes, firing off ropes of [pc.cumColor] straight into her womb and bowels until you’re absolutely drained and then far beyond that. ");
		if (pc.cockTotal() > 2) output("There’s not even much left over for your other member" + (pc.cockTotal() > 3 ? "s":"") + " to do much more than leak all over her ass.");
		output(" While she noticeably sighs at your output, she seems more than sated by your stamina.");
		output("\n\n<i>“Very good, outsider. Your women are either more impressive than they’ve been letting on, or you’re quite a sought after mate, even if your ‘output’ is less than I expected.”</i> She crawls off of your [pc.cocks] and struggles to her feet. <i>“I will have to find you again, especially if your seed doesn’t take root. There are so few places where I can get an experience like that...”</i>");
		output("\n\nShe walks away, disappearing back into the distance and leaving you to gather yourself back together before heading off.");
	}
	//Big cummers
	else if (pc.cumQ() <= 3000)
	{
		output("\n\nYour urethras bulge out as your load rushes to meet the milodan’s warm insides. The force of your seed is immense. Your over productive [pc,balls] outdo" + (pc.balls > 1 ? " themselves":"es itself") + " by producing more cum than you thought you were capable of. Her stomach swells as you fill her up from both ends. The breed-hungry amazon rubs her belly expectantly, knowing that such a bountiful orgasm is sure to get her knocked up.");
		if (pc.cumQuality() <= 0) output(" Little does she know that’s not going to happen no matter how much you put in her.");
		output("\n\n");
		if (pc.cockTotal() > 2) output("Your other dick" + (pc.cockTotal() > 3 ? "s absolutely paint":" absolutely paints") + " her ass [pc.cumColor]. Even though the main brunt of your goods are going directly into her you still have plenty left over for the rest of her. ");
		output("Your orgasm wanes as her belly reaches the size of a beach ball. <i>“A great partner <b>and</b> an impressive breeder! I’ve met few of you outsiders who’ve managed to exceed my expectations as you have.”</i> She struggles to her feet, weighed down by your thick seed. When she gets up, she rubs her belly happily and starts to walk off, giving you a small wave as she leaves.");
	}
	//Super ultra guy cums
	else
	{
		output("\n\nThe pressure inside you reaches a breaking point. Superhuman quantities of [pc.cum] surge through your body as your [pc.balls] struggle" + (pc.balls > 1 ? "":"s") + " with the herculean task of expelling your physics-defying load. The brutal bitch isn’t ready for it, how could she be? You yell out in sublime bliss as your dam bursts and the [pc.cumColor] flood flows out in titanic waves.");
		output("\n\nHer stomach bloats out like a balloon stuck onto a broken fire hydrant. In a matter of seconds, it reaches an absolutely absurd size thanks to the double-stuffing you’re giving her. She freezes up in sheer shock, unable to fully process what’s happening to her. Her ass and pussy don’t seem nearly as confused. They wring your members out for every last drop they can give.");
		output("\n\nAnd give they do! You fill out the breed-crazed milodan until her stomach touches the ground.");
		if (pc.cockTotal() > 2) output("Your other cock" + (pc.cockTotal() > 3 ? "s show":" shows") + " off your virility even better. Even with all you’ve put into her, there’s still plenty left to absolutely plaster her to the point where she’s almost completely [pc.cumColor] long before you’re done.");
		output("You keep going too, proving that even she isn’t up to the task of containing your seed. The pool at your feet reaches up to your ankles ");
		if (pc.cumQ() <= 8000) output("by the time you’re done.");
		//Ultra mega mega ultra cums
		else output("and you just keep going!");
		output("\n\nYou can’t even begin to imagine how your body is able to make all of this cum, let alone pump it all out without your muscles giving out. A veritable river of spunk floods out around you, leaving undeniable proof that you were here. A fantastical vision comes to you of dozens of curvaceous, fertile women swimming in a cum pool of your own making, being knocked up passively by your sheer virility as you continue to pump out [pc.cum] by the gallon.");
		if (pc.cumQuality() <= 0) output("Too bad you can’t go knocking <i>anyone</i> up right now.");
		output("\n\nThe vision fades along with your orgasm as you finally calm down.");
		output("\n\nThe overstuffed pussycat doesn’t make a sound as you finish. She’s so completely in shock that she can’t do much more than shake and pant quietly. You walk over in front of her just to make sure you didn’t break anything, only to be met with a wide-eyed, almost worshipful stare. She tries to say something but only manages to cough up a wad of your spunk. The thoroughly-filled milodan covers her mouth, seemingly embarrassed. She buries her face in her breasts and just lays there, unwilling to move.");
		output("\n\nWith nothing left to get from her, you decide it’s time to get yourself back together and move on out.");
	}
	output("\n\n");
	enemy.loadInCunt(pc,0);
	enemy.loadInAss(pc);
	processTime(30);
	pc.orgasm();
	CombatManager.genericVictory();
}
//Eat Her Out
public function winAgainstMilodanFutazonEatHerPussy():void
{
	clearOutput();
	showMilodanFutazon(true);
	output("After such a long battle, you’re feeling pretty thirsty. While she does have a big, leaky spigot that you could get your drink from, you’re in the mood for something a little more... feminine. You command her to turn around and bend over, which she does with no resistance. Her fat little pussy twitches as it reveals himself from between her hefty ass cheeks, drooling out a hearty helping of steaming hot juice. ");
	if (enemy is MilodanFutazon) output("\n\n<i>“Looking for a post-fight drink, outsider? Lucky for you I’ve got plenty to give!”</i>");
	else output("\n\n<i>“Need to refresh, outsider? Mommy can help with that. Just take as much as you want!”</i>");
	output(" The soaking seductress spreads her lips apart, revealing her warm, drenched inner lips. Your mouth waters as girlcum rushes out of her honeypot and pools on the ground below her. She wiggles her ass back and forth in order to further entice you, as if you needed it. You jump her, running up and trying to shove your face directly into her muff.");
	output("\n\nShe cuts you off at the pass by thrusting back into you, pushing your face away from her pussy and into the thick, soft trap of her ass cheeks. They yield like soft pillows at first, but once you’re in they tighten up like vices, trapping your face in-between. She ");
	if (enemy is MilodanFutazon) output("cackles madly");
	else output("snickers evily");
	output(" at your predicament as she shakes your head around inside her warm, furry cage.");
	output("\n\nInstinctively you slap your hands into her cheeks and attempt to push yourself out but only manage to shake yourself even more. As you struggle you can hear the milodan jilling herself off beneath you, no doubt in order to tease you about what you’re missing. It’s agonizing, and you wonder if she has any intention of letting you go or if this is just a trap to suffocate you so she can have it her own way.");
	output("\n\nAs your head starts to feel light, you give one last push and actually manage to free yourself. You pant and wipe the sweat from your face as you give her an evil glare. The Chesire milodan only grins back. ");
	if (enemy is MilodanFutazon) output("<i>“Don’t lie, I bet you fucking loved that!</i>”");
	else output("<i>“Oh, did something happen? You got stuck in my ass? You must be more careful back there!”</i>");
	output("\n\n You give her ass a big swat and get a teasing moan back.");
	if (enemy is MilodanFutazon) output("<i>“You know that’s just turning me on more right? Come on and get your drink. I promise I promise I’ll let you this time!</i>”");
	else output("<i>“Oh my, you seem quite irritated. Perhaps you’re dehydrated. Maybe you should take a drink?”</i>");
	output("\n\n She shakes her ass again, making sure that her pussy is well presented.");
	output("\n\nYou just shake your head and go in for it. This time you steady her and go in carefully. To her word, she doesn’t resist this time, allowing you to get face-to-fuckhole with her soaking wet kitty pussy. The cloud of pheromones is thick enough that it feels like it’s leaving a layer on your face. You extend your tongue out and can already taste her juices in the air almost as thick as if they were the real thing. It’s a good appetizer for the main course, and you impatiently dive in within seconds.");
	output("\n\nIt’s a salty, incredibly musky taste that almost reminds you of a well-marinated steak. It also feels <i>good</i> on your tongue! You’re not exactly sure how to describe it, but it’s like the nerves on your tongue suddenly became as sensitive as " + (pc.hasCock() ? "your [pc.cocks]":"a cock") + ". Small waves of pleasure surge out from your oral organ, sending shivers down your spine for each lap of juice you take.");
	output("\n\nYou realize that despite the massive amount of juice you’ve been lapping up, you haven’t even fully pierced her outer lips! You dive in, rupturing the veil of her womanhood and fully penetrating her with your [pc.tongue]. The ensuing flood triggered by your true entrance leaves your face splattered with fragrant, translucent juices. Despite the quantity, you press on, your tongue practically swimming up-stream as you continue your journey into the wet pussy’s wet pussy.");
	output("\n\nShe groans out above you as her muscles start working over your tongue even harder. It’s nice to know your efforts are being appreciated, even if your main focus isn’t <i>her</i> pleasure. She rubs back into you, letting your tongue dig in even further. ");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("As if you needed any help delving your tongue into her depths. It coils out of your mouth like rope and explores every last inch of her flooding hole. <i>“What an i-interesting tongue you have, outsider! I do e-enjoy the more... exotic aspects of your people!”</i>");
	else output("Your mouth strains to get out every inch of tongue that you have to give. The horny milodan coos appreciatively, <i>“You’re good at this. Do you give your own women this kind of treatment or do you like me that much? Don’t answer. Just keep going!”</i>");
	output("\n\nThat’s encouraging to hear, though you’re unable to respond thanks to your fixation on her honeypot. The taste has become almost addictive as it saturates your mouth entirely. Meanwhile, her pheromones have grown so thick that you swear your nostrils are coated in them. Even when you stop breathing in, the smell doesn’t get any weaker! You’re filled with a constant stream of lust that travels straight to your crotch.");
	if (pc.isHerm())
	{
		output("\n\nOne of your hands immediately darts down to your [pc.cock] and begins stroking while the other reaches around and sticks a pair of fingers into your [pc.pussy].");
		if (pc.hasCocks()) output(" Unfortunately you are not an octopus and lack the extra arms to tend to all of your members, so your other cock" + (pc.cockTotal() > 2 ? "s are":" is") + " left to flail around by " + (pc.cockTotal() > 2 ? "themselves":" itself") + ".");
	}
	else if (pc.hasCock())
	{
		output("\n\nYour hands dart down to your [pc.cocks], grabbing ");
		if (pc.cockTotal() == 1) output("your member and jerking it off furiously");
		else if (pc.cockTotal() == 2) output("both of your members and jerking them off in unison.");
		else output("two of your members and vigorously jerking them off while your other cock" + (pc.cockTotal() > 3 ? " flops":"s flops") + " around uselessly.");
	}
	else if (pc.hasVagina()) output("\n\nYou reach down and cram as many fingers into your [pc.pussy] as will fit.");
	output(" You moan loudly into her muff as you work yourself over as hard as you’re working her.");
	output("\n\nYour moans reverberate up her body and draw out her own. She bellows like a wild beast as her pussy squeezes harder and harder around your [pc.tongue]. It grows so tight that you almost can’t move your tongue while her juices continue to wash out in consistent streams. It almost feels like you’re drowning at this point. Your mouth is flooded with so much musky pussy juice that you barely have time to breathe, and your whole front is so soaked that you might as well be underwater!");
	output("\n\nDespite all of that, your tongue is still working overtime to lap up as much of her girlcum as possible. Every muscle in your mouth is burning, yet you can’t even bring yourself to slow down! Your body is addicted to her, and you don’t think you’re going to get out of this until... you don’t even know! Will you need to make her cum? If so, how many times? Maybe you’ll just be trapped eating out milodan pussy for the rest of your life! What will it take to break this spell?!");
	if (enemy is MilodanFutazon)
	{
		output("\n\nYou’re not the only one being worn down. The panting milodan seems like she’s breaking down at the seams. She cums her brains out and yet you can barely tell with how wet and tight her cunt was already. Her legs start to shake, and she seems to be struggling to stay up. <i>“I-I admit I have not had service like this in many seasons. B-but I wi-will not br-bre-break!”</i>");
		output("\n\nThat seems to be exactly what she’s doing, considering you’re basically holding her up with your face at this point. It’s actually to the point where if you go down, it’ll take both of you down.");
	}
	else
	{
		output("\n\nOn the complete opposite spectrum is the giantess milodan. She holding rock steady in the face of your oral onslaught, to the point where you can even hear her chuckling whenever you show signs of weakness. The only signal you get that she’s faltering at all is when she moans out and shudders in orgasm, though with how wet and tight she already was you hardly notice.");
		output("\n\n<i>“I must once again admire your mouth skills, outsider. Although, from the sound of it you seem to lack the stamina to match. Am I wrong?”</i> Oh, you’ll show her stamina!");
	}
	output(" With a muffled growl you rise up from her pussy, face absolutely soaked in her juices, With the energy from your second wind, you deliver a series of disabling slaps to her ass, causing her to fall forward and hug the ground while you raise her ass up in the air.");
	if (enemy is MilodanBruiser)output(" You suspect she let herself be put down there, but you really don’t care at this point.");
	output("\n\nYou hold her pussy up to your face and start digging in once again. The small break in your masturbation to hold her up did nothing to quell your lust. As soon as your hands dive back down and continue ");
	if (pc.isHerm()) output("masturbating");
	else if (pc.hasCock()) output("jerking off");
	else if (pc.hasVagina()) output ("jilling off");
	output(" you feel yourself go over the edge.")
	if (pc.isHerm())
	{
		output(" Your [pc.cocks] go" + (pc.hasCocks() ? "":"es") + " off, firing ");
		//Normal cummies
		if (pc.cumQ() <= 500) output("strings");
		//Big cummies
		else if (pc.cumQ() <= 1000) output("gouts");
		//Huge cummies
		else output("blasts");
		output(" of [pc.cum] that nail the prone milodan right in the underside of her tits. Meanwhile your [pc.pussy] fires off sympathetically, " + (pc.hasBalls () ? "soaking the back of your [pc.balls]":"splashing [pc.girlCum] on the ground below you.") + "");
	}
	else if (pc.hasCock())
	{
		output(" Your [pc.cocks] fire" + (pc.hasCocks() ? "":"s") + " off, splattering [pc.cum] into the thick under-cleavage of the busty sabertooth, painting it in ");
		if (pc.cumQ() <= 500) output("streaks");
		//Big cummies
		else if (pc.cumQ() <= 1000) output("blasts");
		//Huge cummies
		else output("puddles")
		output("of [pc.cumColor].");
	}
	else if (pc.hasVagina())
	{
		output(" Shocks fire through your [pc.pussy] as it flies into orgasm. [pc.GirlCum] ");
		if (pc.wettestVaginalWetness() <= 2) output("drools");
		else if (pc.wettestVaginalWetness() <= 3) output("splashes");
		else output("sprays")
		output(" onto the ground below you, as if it were attempting to compete with the milodan’s own output.");
	}

	output("\n\nYou continue eating her out even as your orgasm drags on. The siren call of pussy is just too tempting to resist! The soaking milodan moans like a whore as you relentlessly eat her out. Her honeypot erupts like a volcano, splattering your face, her ass, and making a deep puddle underneath her. When she cums again you find yourself reeling back as arcs of pussy juice start arcing several feet in the air.");
	output("\n\nThe pressure doesn’t stop you though, and you dive back in for another helping, continuing to masturbate mere seconds after your first orgasm ends.");
	output("\n\n");
	pc.applyPussyDrenched();
	pc.girlCumInMouth(enemy);
	processTime(60);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", eatoutMiloFutaAfterMath);
}
public function eatoutMiloFutaAfterMath():void
{
	clearOutput();
	showMilodanFutazon(true);
	output("You’re not sure how much time passed, but eventually, the pussy-juice buffet comes to an end. You, her, and just about everything within several feet of you are covered in mixed fluids. The milodan amazon lies asleep, worn-out and likely pretty dehydrated after your tryst. You’re not doing so much better yourself, but at least you’re conscious.");
	output("\n\nAfter taking a few moments to cool down and get dressed, you struggle to your feet and head off, leaving the satisfied milodan to dream, probably of you.");
	processTime(35);
	output("\n\n");
	CombatManager.genericVictory();
}
//Suck Off
//Normal only
public function winAgainstMilodanFutazonSuckHerOff():void
{
	clearOutput();
	showMilodanFutazon(true);
	output("Despite beating her so thoroughly beaten in your fight, the burly milodan’s over-sized member remains hard and dripping. She sees you stare hungrily at her cock and licks her lips. <i>“Do you like what you see, outsider? The sacred waters have made us far larger than most males. Is that what you wanted? Are you such a cock-slut that they just can’t satisfy your cravings?”</i>");
	if (pc.isBimbo())
	{
		output("\n\nYou nod enthusiastically, making sure your eyes never leave her delicious, huge dick! She just smiles and shrugs. <i>“Well, if you’re that enthusiastic, why didn’t you just bend over and let me have my way with you?”</i>");
		output("\n\n<i>“Because I, like, wanted to have it all to myself!” you scream out as you grab her delicious dick with both hands and start stroking it.</i>");
	}
	else output("\n\nYou don’t bother answering her teases. You know exactly why you’re doing this, and that’s none of her business. Instead, you simply grab her thick dick with both hands and start stroking her off.");
	output("\n\nHer cumvein bulges, sending up a huge wad of pre that splatters about a foot in front of her. As you continue, more and more slick pre-seed fires out, forming into a sizable puddle on the ground. The dick-toting former-priestess starts panting lustily as she watches you work over her girth.");
	output("\n\n<i>“Getting close already?”</i> you chide her.");
	output("\n\n<i>“T-this is just the beginning, outsider! The sacred waters have granted us unmatched output. This is but a small taste!”</i> ");
	if (pc.isBimbo()) output("Your tummy is rumbling already!");
	else output("You’ll just have to see that for yourself, then.");
	output(" You slow your strokes, feeling over every detail of her dog-like cock. The veins practically jump out as you go over them, working overtime to keep her monster cock rigid and upright. The whole thing throbs heavily to the tune of your strokes, swelling about an inch in girth at its thickest. Her knot fattens as you go over it, trying uselessly to trap your hand down to be bred. Even the nubs near the tip grow and shrink considerably as you feel them.");
	output("\n\nThe hyper-hung milodan groans as increasingly thick pre spills out of her cumslit. She thrashes and thrusts through your hands like a wild beast, soaking your hands in the thick, tingling liquid.");
	if (pc.isBimbo()) output("\n\n<i>“Oh my gosh, there’s so much already! Are you gonna cum? It feels like you’re gonna cum a lot!</i>”");
	else output("\n\n<i>“Are you sure you’re not going to cum?”</i>");
	output("\n\n<i>“N-no! I’m... I-I’m not... GuuuuaaaaAAAH!”</i> Her cock erupts, firing thick wads of cum several feet in front of her. You continue stroking her off, upping your pace in order to speed her through her orgasm.");
	if (pc.isBimbo())
	{
		output("\n\nYou squeal in joy and lick your lips as you draw more and more sweet cream out of the hung hottie. It’s so much that you wonder if she’s going to have any left for you. “<i>Are you gonna have any left for me? I’m hungry...”</i>");
		output("\n\n<i>“Uuugh... Of course, I will! I’ve got so much you’ll drown in it!”</i>");
		output("\n\nYay!");
	}
	else
	{
		output("\n\nYou snicker under your breath as you continue jerking her. <i>“I hope you’re good for one more. I’ve still got plans for you!”</i>");
		output("\n\n<i>“O-oh, I’ve g... got more than one for you! I have so many loads you’ll fucking choke!”</i>");
		output("\n\nGood to know, but you have your own ideas for how this is going to go.");
	}
	output("\n\nAfter a good minute, she finishes, leaving a long line of steaming seed on the ground. True to her word, her cock is still rock hard, and even still leaking a hefty amount of cum. The lusty milodan herm pants heavily as she braces herself for what happens next. <i>“T-there, see? I told you I had more in me. Now, do your worst, I can take it!”</i>");
	output("\n\nYou accept her challenge without another word, kneeling down until her imposing member is directly in front of you. The smell of her pheromones immediately gets to work pounding into your brain. Lucky for you, her massive member won’t stay in the open air for long. You wet your [pc.lips] and start taking her tip in.");
	output("\n\nImmediately you get a healthy shot of milodan cream straight into the back of your throat. It’s thick and salty like some kind of musky gravy. The amazonian sabertooth tries to grab your head and push you down. Unfortunately for her, between the fight and her orgasm she doesn’t have nearly enough strength to overpower you, and you bat her away with ease. You expect more resistance, but instead, she just growls lowly in irritation before settling back and enjoying you.");
	output("\n\nYou enjoy her right back, moving down over the ring of nubs just below her tip. The taper makes getting onto it much easier but doesn’t help once you get to the thickner parts of her member. ");
	if (pc.isBimbo()) output("That’s absolutely fine with you! Bigger is always better, especially when it comes to cocks! You gulp down inch after delicious inch of kitty cock, humming happily all the way.");
	else if (pc.canDeepthroat()) output("Thankfully your well-trained throat is ready to take cocks of this caliber, and you start shoving down inch after inch of sabertooth cock.");
	else output("You struggle and choke down as much cock as you’re able to, but each inch is a struggle, and you begin to feel the strain almost immediately.");
	output("\n\nThe horny amazon moans out as you work your way down her pole. Warm pre-seed fills your mouth and throat as she hoses the stuff out liberally, aided heavily by the feeling of having " + (pc.canDeepthroat() ? "part":"most") + " of her cock stuffed inside your throat. You can’t stay down forever though, and you rush up for air, getting a face of off-white pre in the face for your troubles.");
	if (pc.isBimbo() || pc.isCumSlut()) output("\n\nAs much as you love cum, air is more important right now, so you push her yummy, cummy dick down so it drizzles onto your [pc.chest] while you get ready for another round.");
	else output("\n\nYou’d rather not learn to breathe cum, so you decide to push her cock out of the way for now, catching some errant sprays from her unwieldy member.");
	output(" You stroke her while you catch your breath in order to keep the amazon nice and ready.");
	output("\n\nYou take a deep breath and dive back down, pushing yourself to new depths of dick-sucking!");
	if (pc.canDeepthroat()) output("You manage to reach the half-way point and keep going from there. The hung milodan groans as you speed down her length, taking inch after inch of thick, musky girth in a mad dash to reach the bottom before you run out of air. Unfortunately, you’re not able to reach her base this pass, but you have plenty of time to work at it. Each descent gets you just a bit closer, testing the true limits of your oral capacity as you work towards complete penile saturation. Your hard work pays off as you finally feel your [pc.lips] spread over the swell of her knot, finally bottoming out after so much effort!");
	else output("You push yourself as hard as your gag reflex will let you. Every inch is a struggle but you keep going regardless. Miraculously you actually manage to get to around the mid-way point, but the pressure on your throat tells you that this is the furthest you’ll be going. You make do with what you can do, though. You pull back up for air and thrust back down.");
	output("\n\nYou continue stuffing her meat as far as you can take it. Her ever-thickening pre greases up your mouth and throat, spreading all the way down to your stomach. Somehow her cock and cum have gotten even hotter. Her over-sized bitch-breaker feels like a slick, molten, hot-iron rod sliding down your throat. All the while her pheromones still manage to leak through your mouth and hammer at your brain.");
	output("\n\nLust rockets to your crotch, causing ");
	if (pc.isHerm()) output("blood to rocket to your already hard [pc.cocks] and	soaking [pc.pussy], pushing your dual sexes to their absolute, swollen limit.");
	else if (pc.hasCock()) output("blood to rocket to your [pc.cocks], pushing your already rock-hard dick to new heights of erectness.");
	else if (pc.hasVagina()) output("your [pc.pussy] to swell up and moisten even further than it already was in anticipation.");
	output(" Your hands immediately dart down and you start to pleasure yourself to the rhythm of your oral attention.");
	output("\n\nThe sabertooth herm cries out in feral lust as you continue to service her. She puts her huge, clawed hands on your head again. This time she doesn’t even try to push you, settling on simply guiding you while using your head to steady herself. You can tell she’s close just from the tone of her moans and the swelling of her cock in your mouth. You press on, determined to get her, and yourself, off. One of your hands diverts to fondling the milodan’s hefty sack, coaxing her closer to climax.");
	output("\n\nThick pre starts overflowing out of your mouth as your capacity to swallow is over-saturated by her output. Her hips twitch and thrust uncontrollably as she crests the edge. You could try and stop her, but at this point you doubt her movements from her are driven by anything but pure instinct.");
	output("\n\nSteaming hot spunk fires into your maw like water from a fire hydrant. Your throat and gut flood with the stuff, filling you with gallons of dense, sticky seed. She howls out and starts thrusting up as she fires, trying her hardest to impregnate your face! Lucky for you she doesn’t have enough grip to keep you down, so you won’t drown. ");
	if (pc.isBimbo() || pc.isCumSlut())
	{
		output("\n\nOf course, you’d never give up an opportunity to drink cum so you stay stuck tight. You continue sucking it down, even as your [pc.belly] rounds out into a nice, pregnant-looking dome.");
		output("\n\nIt’s hard to watch so much goodness escape your mouth and hit the floor, but all it does is inspire you to do better! You suck and suck, making sure as little escapes as possible. Even her balls aren’t safe from your wrath! You ravage her spunk tanks with reckless abandon, demanding that they give you every last drop of deliciousness. They proceed to do exactly that, pumping out seed until the dick-toting milodan starts panting in exertion.");
	}
	else
	{
		output("\n\nHer seed fires up several feet in the air as you pull off. Your [pc.belly] gurgles with the heft of her immense load while you grab her member with your other hand and start stroking her through her orgasm. She continues firing off huge streams of white into the air, her output aided by your ministrations.");
		output("\n\nThe amazon cum-pump squirts until her balls visibly strain at the effort. It would seem your blowjob had more than the desired effect, sending her into an orgasmic fit that has her emptying her nuts at a record pace. She pants in exertion as her sack visibly strains to pump out everything she has.");
	}
	output("\n\nYou go off yourself, ");
	if (pc.hasCock()) output("[pc.cocks]");
	if (pc.isHerm()) output(" and ");
	if (pc.hasVagina()) output("[pc.pussy]");
	output(" making an absolute mess of yourself while she continues to strain out her orgasm. When it’s all over, you’re both short of breath and very satisfied. The sated amazon settles into her afterglow as her muscles go slack and her dick finally comes down.");
	output("\n\n<i>“I underestimated you, outsider. That mouth of yours puts many of your outsider friend’s holes to shame! Certainly, none of the communal sluts could stand a chance. If you were taken back to the village, you’d most certainly be ‘occupied’ non-stop!”</i>");
	if (pc.isBimbo() || pc.isCumSlut())output("\n\nYou start to drool at the idea of having cocks in your mouth twenty-four-seven, but you shake your head and realize you have a job to do first. You can suck all the dick you want when you’re rich!");
	else output("\n\nYour breath catches as you imagine the idea of being forced to suck cock day in and out. You’d best try and avoid being put into that position.");
	output("\n\nYour mouth and throat feel numb and tingly after being coated in so much tainted seed. ");
	if (pc.taint >= pc.taintMax) output("Good thing you’re already tainted as hell, so you’re not going to get any worse.");
	else output("You should be careful about how often you do this!");
	output("\n\nShe lounges back, practically ignoring you as she doses off. Satisfied and with nothing else to do here, you head out again, ready to suck dick another day!");
	output("\n\n");
	processTime(35);
	pc.loadInMouth(enemy);
	pc.taint(5);
	pc.orgasm();
	CombatManager.genericVictory();
}
//Hyper Suck Off
//Requires Snakebyte mouth
//Bruiser only
public function winAgainstMilodanFutazonHyperSuckHer():void
{
	clearOutput();
	showMilodanFutazon(true);
	output("You stare down at her mountain of massive milodan meat and drool a bit. For most normal people, the prospect of sucking down such a stupendously statuesque cock would be terrifying, but you’re anything but normal! You stride up to the kneeling giantess, keeping your attention on her member the whole time as you lick your lips. Your attention doesn’t escape her, and she smiles at you in equal parts lust and confusion.");
	output("\n\n<i>“Do you intend to use your mouth? Are you that confident or has my presence left you bereft you of your senses?”</i>");
	output("\n\nIn response, you chuckle and open up your mouth, showing off the flexibility of your jaw. The massive milodan’s eyes go wide when she sees what you’re capable of. <i>“My my. You outsiders have plenty of interesting tricks. We’ll see if it’s enough for you to take me, won’t we?”</i>");
	output("\n\nOh, she doesn’t know the half of it!");
	output("\n\nYou grab her monumental totem with both hands and bring it in closer. The flesh is surprisingly soft and yields under your fingers, though you don’t get far without feeling the harder tissue underneath. It throbs as it draws closer to your stretchy maw, aggressively pushing against your hands. The musky pheromones seeping out of her dickskin sting your nostrils as you inhale them. They’re so dense that it almost feels like you’re in a cloud of smog! Even your mouth feels like it’s coated in a thick layer of the stuff.");
	output("\n\nThat won’t stop you though! You decided to suck cock, and you’re going to suck cock! It doesn’t matter how big and thick it is or how the musk makes your head swim; you’re going in one-hundred-and-ten percent! Without another thought, you hook on and start sucking down milodan dick.");
	output("\n\nShe smirks down at you confidently until her cockhead hits your neck. Once she feels your modded, ribbed throat start to suck her down like a vacuum, her eyes go wide and her mouth opens wide. You groan as steaming hot cockflesh rams through your sensitive throat, firing off your nerves at an almost mind-numbingly rapid pace.");
	output("\n\nThe plus-plus-sized sabertooth struggles to keep her composure as she feels your strong, ribbed throat closing in around her member. <i>“T-this is... This is... Outsider, I can’t even d-describe how incredible your mouth is! You’ve been crafted to be a perfect fucktoy and yet you waste your time fighting!”</i>");
	if (pc.isBimbo()) output(" Hey, you do plenty of fucking too! At least, that’s what you try to say without remembering that your mouth is stuffed with yummy cock.");
	else output(" You could say the same about her with a dick like this. Of course you’re not saying much of anything with how clogged with cock your throat is.");
	output("\n\nYou keep going, feeling your throat bulge out from the sheer girth passing through it. You’re equipped to handle it, enjoy it even. Every inch of cock in your throat blasts your mind with pleasure thanks to your almost pussy-like sensitivity. Every rib she crests over feels like a miniature orgasm and it’s making it hard to keep focus.");
	output("\n\nYou run out of breath before getting it even half way in. Coming up for air, you get a heaping blast of pre right in the face and mouth. Looking down while you catch your breath, you see, and feel, just how much she’s been pumping into you while you were shoving her down your maw. She must have put at least ten pounds on you! You look back up and see the beastial milodan panting and gasping, eyes half crossed.");
	output("\n\nShe seems lost in her lust until she looks down and sees you looking back at her. At the realization that you can see her breaking down, the prideful pussy pulls herself back together the best she can and manages to look at least coherent. <i>“Y-you won’t break me!”</i>");
	output("\n\nWe’ll see about that.");
	output("\n\nYou push back down, taking her down even further than the first go in about a second. The composure she managed to claw back completely disintegrates as she yells out in pleasure. What feels like a bucket-sized gout of pre fires down your throat. You can tell you’re getting to her just from the consistency. Previously, it slid down your throat so cleanly that you didn’t even notice it, but now it sticks to the edges and goes down almost like molasses.");
	output("\n\nThe lusty sabertooth grabs you by the back of the head and squeezes down softly, but doesn’t push you. <i>“Fuck yes! This is the best hole I’ve ever fucked, outsider! What gods do you have that would bless you with such a throat? I may have to convert...”</i> She’s given up on seeming in any way rational and starts howling like a wild beast as you plunge more of her member into your exotic throat.");
	output("\n\nDrool runs out the side of her maw while her balls throb so heavily that it’s audible. What feels like gallons of thick, sabercat pre-seed dumps down your gullet, coating the sides so deeply that you wonder if you’ll ever be able to wash it all out. You’re not doing much better yourself. Your throat is so sensitive that it feels just as good as if you ");
	if (pc.hasVagina()) output("were getting fucked in your [pc.pussy]");
	else output("had a pussy in your mouth");
	output(". Your impassioned groin feels so over-stuffed with blood and lust, so much so that you feel like you’re going to pop at any moment!");
	output("\n\nBy the time you pull up for air again you’ve made it about two feet down. You slide it all out with ease, so much ease that you rush it out and over-stimulate yourself and her. You and the lusty, hyper-endowed milodan moan out in unison as her cock pops out of your mouth. It paints you in thick, off-white pre until your face is completely basted in it.");
	output("\n\nShe’s trying her hardest to hold herself back from orgasm, but you can clearly tell it’s not working. Her balls are throbbing and swelling so hard that it almost looks like they’re alive, and her dick is rising up higher and growing larger by the second. You can see the strain on her face as she grits her teeth and struggles not to cum, then the irritation and relief when she fails and the dam bursts.");
	output("\n\nCum flies out in gallon bursts, splattering off you until you both look like a pair of ghosts. Large puddles of seed collect every which way for several feet around you. <i>“T-this won’t stop me! That throat of yours could keep me going all day. I won’t rest until I’ve fucked it raw!”</i>");
	output("\n\nTrue to her word, as her orgasm wanes, her cock remains straining hard and ready. Before you can cool off, though, her grip intensifies and drags you back on her member. As soon as her dickflesh touches your throat, you fly over the edge.");
	if (pc.isHerm())
	{
		output(" Your [pc.cocks] and [pc.pussy] explode at the same time, soaking " + (pc.isCrotchExposed() ? "the ground below you":"your [pc.lowerGarments]") + ". The simultaneous orgasm combined with the sudden throat-stuffing stretches your mind to the limit, but you manage to rebound back and keep yourself together.");
	}
	else if (pc.hasCock())
	{
		output(" Your [pc.cocks] go" + (pc.cockTotal() >= 2 ? "":"es") + " off, firing ");
		if (pc.cumQ() <= 500) output("strands"); else if (pc.cumQ() <= 1000) output("gouts");
		else output("blasts");
		output(" of [pc.cum] " + (pc.isCrotchExposed() ? "onto the ground":"into your [pc.lowerGarments]") + ".");
	}
	else if (pc.hasVagina())
	{
		output(" Your [pc.pussy] juices up and fires off, ");
		if (pc.isCrotchExposed())
		{
			output("making a nice, ");
			if (pc.wettestVaginalWetness() <= 2) output("little");
			else if (pc.wettestVaginalWetness() <= 5) output("big");
			else output("huge");
			output(" puddle right underneath you.");
		}
		else output("making a nice damp spot in your [pc.lowerGarments]" + (pc.wettestVaginalWetness() >= 3 ? " and even soaking through to make a nice puddle underneath you":"") + ".");
	}
	output("\n\nDespite cumming once already, you feel like you want, no, <i>need</i> to cum again! The feeling of sucking on the biggest cocks the galaxy has to offer and being able to cum from that alone is absolutely addictive. Before the lust-drunk milodan can push you down, you push forward on your own, making her intervention pointless. She goes back to relaxing and letting you service her.");
	output("\n\nYour orgasm lit a fire under your ass, and you start fellating her like nobody’s business! Over two feet of cock goes in and out of your ribbed, extra-stretchy throat at a rapid, ever-increasing pace. It’s almost unnervingly easy, yet oh so pleasurable. Your throat feels like it’s getting more sensitive as you go on. Your second orgasm comes within minutes, and the next comes even quicker than that. You blow faster and faster until they start to blend into each-other.");
	output("\n\nThe statuesque milodan groans in sublime pleasure as you work your ass off to blow her. She’s still pumping out pre. In fact, she’s probably making more of the stuff since her orgasm. Speaking of which, even through your own orgasmic haze you can tell that she’s about to blow again. Instead of holding off or being worried after seeing how much she can put out, you barrel forward full steam ahead, determined to get her off as hard as possible!");
	output("\n\nYour pace becomes feverish as you give the lounging milodan the throat-job of a lifetime. She can’t do anything at this point except just sit back and take it. <i>“T-that’s it. Just s-s-suck mommy’s cock with that beautiful fucking throat of yours!”</i> Her balls bloat visibly in anticipation of her imminent orgasm. Your gut already feels bloated with the amount of pre, especially now that she’s driving into pre-orgasmic overdrive.");
	output("\n\nThe only warning you get for her orgasm is her slowly raising her head and purring. Her almost serene reaction is a stark contrast to her actual orgasm. Cum fires into your belly like a water cannon. It’s actually strong enough to push you off a few inches. It doesn’t let up, if anything it actually gets more intense as she goes on. It seems like your oral attention combined with the increased sensitivity from her first orgasm have combined to throw her into a ball-draining frenzy with seemingly no end in sight!");
	output("\n\nYou hold on as best as you can, but the pressure inevitably becomes too much for you to bear. You’re blasted off her fire hydrant of a cock, throwing you onto your back as a biblical flood hoses out of the hyper-sized sabercat’s cumslit. Everything within about twenty feet in front of her becomes absolutely soaked in white, including you. Comforter-thick blankets of cream layer on top of the old in an almost endless pile. It feels like you’re being submerged in a small river of the stuff. You manage to scramble out of the way before you drown, settling off to the side so you can watch her ride out the rest.");
	output("\n\nIt’s a sight to behold. It’s like watching the world’s lewdest fountain overflowing. For her part, the muscular cum-pump is taking it rather well. At least, that’s what you think before you realize that she’s already passed out.");
	output("\n\nYou sit for a while, waiting out her orgasm while you drain out your throat a bit. By the time it’s over, and she’s fallen backwards into the musky pool, it reaches almost up to her ears. The smell is so overwhelming that you’re sure to catch whiffs of it for miles. Spent, filthy, and not wanting to meet whatever’s going to be attracted to this stuff, you decide to get a move on.");
	output("\n\nStars, you need a shower!\n\n");
	processTime(75);
	pc.loadInMouth(enemy);
	pc.applyCumSoaked();
	pc.taint(6);
	for(var y:int = 0; y < 15 ; y++) { pc.orgasm(); }
	CombatManager.genericVictory();
}
//Get Fucked
//Prioritizes vaginas unless one isn’t present it doesn’t have enough capacity or you’re pregnant.
public function winAgainstMilodanFutazonGetFucked(hole:int):void
{
	clearOutput();
	showMilodanFutazon(true);
	var vIdx:int = hole;

	if (enemy is MilodanFutazon)
	{
		output("You strut up to the kneeling sabertooth. She stares up at you confidently until you grab her cock as hard as you can and lean into her. You get face-to-face with her, staring her down as you confidently declare, <i>“Mine!”</i>");
		output("\n\nShe smiles at you and seems to relax. <i>“Sounds good to me. You’d better hope you’re as strong in bed as you are in battle, because we’ll be fighting just as hard!”</i>");
		output("\n\nOh, you’ll be fighting her for this. And if she thinks she’ll be able to do much fighting back she has another thing coming!");
	}
	else
	{
		output("Well, here goes nothing! You strut up to the towering milodan and stare her down. She looms over you and simply smiles down at you. Taking a deep breath and summoning up your confidence, you step up into her lap, grab her immense pole with one hand and thread it between your [pc.butts] while your other hand grabs her by the cheek and pulls her in close. <i>“You, and especially this, are mine now!”</i>");
		output("\n\nShe just grins and purrs at your show of dominance. <i>“You want to be on top of mommy, little one? How brave! I hope you’re ready to fight for it, though, because I won’t let you have it easily.”</i>");
		output("\n\nOh, you’ll fight for it alright!");

	}
	output("\n\nWithout warning you plant your [pc.lipsChaste] on hers and start vigorously stroking off the hung snow-pussy. Her eyes go wide for a second before she settles into it. Her huge, rough tongue darts into your mouth, wrestling yours, trying to vye for dominance even before you’ve started fucking! You push back, dueling with her inside your mouth. It’s almost like fencing: thrust, parry, riposte! ");
	if (pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("She tries her best, but your advantage in reach completely overwhelms her, and you handily win the battle.");
	else output("It’s a hard fought battle, but you persevere and manage to battle her down and secure the victory.");
	output("\n\nYou hammer her down with just your mouth, weakening her for what’s to come. While she might be getting softened, her cock is only getting harder. ");
	if (enemy is MilodanFutazon) output("It feels like an iron bar in your hand, so hard and slick that it’s actually hard to hold on to. It’s also throbbing like crazy and spurting out all over your hand and itself.");
	else output("It feels like a molten iron bar between your ass cheeks. It geysers like a volcano, soaking itself and you in thick layers of pre.");
	output("\n\nYou pull away from her, leaving the huge pussy-cat gasping for air. You turn around" + (!pc.isNude() ? ", strip down,":"") + " and wiggle your [pc.ass] for her, telling her that it’s time to put up!");
	clearMenu();
	if (enemy is MilodanFutazon) addButton(0, "Next", winAndGetFuckedByBaseFutazon, vIdx);
	else addButton(0, "Next", winandGetFuckedByBruiser, vIdx);
}
public function winandGetFuckedByBruiser(vIdx:int):void
{
	clearOutput();
	showMilodanFutazon(true);
	output("The huge hermaphrodite stands up and comes up behind you. She takes you by surprise when she hooks you under your legs and lifts you up against her chest, keeping your legs pinned under her strong arms. <i>“I hope you don’t mind if we do it this way. I found this position in an erotic painting I found on another outsider. I believe it’s called a ‘full nelson’.”</i>");
	output("\n\nYou’re not happy that she took control like that, but the way her totem of a cock sits between your lifted legs and the way her huge breasts act like a pillow is too tempting to resist. You look up and nod, giving her the go-ahead to start. <i>“Gooood. Don’t worry, mommy will fuck you good and make your Lord Nelson proud!”</i>");
	output("\n\nShe plants the tip of her member against your [pc.vagOrAss " + vIdx + "] and lets her productive pre do the work of lubing you up. It does the job and then some, plastering your crotch until it looks like you’ve already been through an hours-long orgy before this. You know you were lubed-up within the first few seconds");
	if (pc.wettestVaginalWetness() >= 3 || pc.hasVaginaFlag(GLOBAL.FLAG_LUBRICATED, vIdx)) output (", hell, you were lubed-up before you even got here");
	output (", yet she continues to sit there and fill you.");
	output("\n\nIt irritates you to the point of action. <i>You</i> won here, and you’re not going to sit around and let <i>her</i> set the pace! You summon up your strength and thrust your [pc.hips] down, taking several inches of thick meat in one stroke. ");
	//First holechange for virginity purposes
	pc.holeChange(vIdx,enemy.cockVolume(0)/8,true,false,true);
	output("Both you and the dick-toting milodan moan out in surprise. <i>“An impatient one, huh? Very well. Let’s get right to it then!”</i>");
	output("\n\nShe bucks up into you, burying another few inches in your [pc.vagOrAss " + vIdx + "] as she digs her feet in and finally starts fucking you in ernest. Her thrusts come quick and hard, making the best use out of your position in order to go in as hard as she wants. You’re momentarily stunned by the initial bout of " + (vIdx >= 0 ? "pussy":"ass") + " hammering but you manage to manage to hold yourself together. You don’t get flexible enough to take cocks like this without knowing <i>how</i> to take them, and you’re going to show her that!");
	output("\n\nYour [pc.belly] swells out with the outline of her member as she buries over a foot of it into you. She batters you like a wild beast, attempting to cram as much of herself into you as possible and break you. Even from your pinned perch, though, you manage to buck back, trying to give back as good as you’re getting. It works, to the effect the brutal amazon spends as much energy keeping you held in check as she does fucking you.");
	output("\n\nEvery muscle in the giantess’s body twitches and struggles and you’re in the perfect position to feel <i>all</i> of it. Her abs contract against your back while her muscular arms squeeze down harder around your [pc.legOrLegs]. The most hard-working muscles, however, are still the ones in her thighs. You can almost hear them strain to lift her cannon of a cock and pair of swinging cum-kegs, especially with how vigorously she’s going at it.");
	output("\n\nIt may not be physically possible for her to fit all of her dick into you, but you wouldn’t think she knew that by the way she’s trying. You struggle not to break as almost two feet of it plows into your [pc.vagOrAss " + vIdx + "], stretching your " + (vIdx >= 0 ? "lower lips":"[pc.anus]") + " wider than you thought was possible. The beastial herm pounds you so hard that her hefty, cum-filled sack flies up into your vision.");
	//Second holechange for stretch.
	pc.holeChange(vIdx,enemy.cockVolume(0));
	output("\n\nHer heavy, pillowy breasts flank either side of you, resting on your shoulders like a pair of dense, furry weights. Each thrust makes you feel like you’re sinking deeper and deeper into her. Her heartbeat hammers into you like tremors from an earthquake, and her heavy breath seeps around you and almost boils you. It’s harsh, but you knew it would be just from the size of the girl and the member you’re taking.");
	output("\n\n<i>“Are you still there, outsider? Good! Strength and durability in battle <b>and</b> during mating. I love that in a mate...”</i> She purrs so hard that it feels like you’re sitting in a massage chair. The vibration steals your focus even more, and you’re sure she knows that. Every part of this is a test by her and you’re going to make sure you pass! Even when your head feels like it’s full of scrambled eggs instead of brains and you’re drooling like a broken faucet " + (vIdx >= 0 ? "from both ends":"") + " you keep fighting. Even with two feet of milodan cock hammering " + (vIdx >= 0 ? "into your womb":"through your rear passage") + ", you will not waver!");
	output("\n\nYour efforts seem to have the desired effect. The milodan giantess, for all her might, is struggling to keep up. Her hips are still moving at full speed but her stance is wobbly and weakening. Meanwhile her pre is flowing like fresh water from a spring. The imprint of her cock in your [pc.belly] becomes less and less distinct as it fills with thick, steadily leaking fluid until it disappears entirely in the deluge of pre-seed. She huffs and moans as all of her strength is put toward impaling you on her member.");
	output("\n\n<i>“Y-you’ve help up remarkably, o-outsider... I... I feel I am at my limit...”</i> Her thrusts become more frantic and unfocused and you can feel her starting to swell up. By this point you’re a sweat-coated ball resting against her huge, furred chest, bloated and moaning like a whore while taking an almost unimaginable amount of cock. You can hear the exertion in her voice as she struggles to hold back, unsuccessfully.");
	output("\n\nHer thrusting stops dead as she buries herself as deep as you’ll take her. The hyper-sized herm yells out in pleasure. Your [pc.belly] explodes outward, filling up the bottom of your vision as gallons of milodan seed fill it all at once. As hard as you’ve been trying to hold back, this finally pushes you over the edge. ");
	if (pc.isHerm()) output("Your twined sexes erupt, pushing out their payload onto you and her in time with her own eruptions.");
	else if (pc.hasCock()) output("Your [pc.cocks] erupt" + (pc.hasCocks() ? "s":"") + ", spraying yourself down with your own [pc.cumColor] payload while the ultra-productive milodan fills you with her own.");
	else if (pc.hasVagina()) output("Your [pc.pussy] clenches down " + (vIdx >= 0 ? "on her member":"in jealousy") + " and squirts out as hard as it can, soaking " + (vIdx >= 0 ? "her rod":"the ground") + " with [pc.girlCum].");
	output("\n\nYour orgasm chains into another as more and more thick, milodan cum flows deep inside you in high pressure streams. You feel like you’d be rocketed off if it weren’t for her tight grip on you. She holds you there while her cum starts to flow out of you into a deep puddle on the ground. Unfortunately for her, and you, her legs have grown so weak that she can’t support your weight, mid-orgasm. You and her go tumbling to the ground, splashing audibly into her own cummy pool.");
	output("\n\nThe milodan amazon’s grip goes slack and her breath grows ragged. <i>“V-very good, outsider. I fear... my strength is too drained to do much more... but I will... I will...”</i> Her eyes flutter shut, and you can feel her heart and breath settle as she drifts off. Her cock continues squirting though. It seems like a good sack never sleeps.");
	output("\n\nYou sit there and take the rest, unable to get off until she softens up. Once she’s all done and starts to shrink inside you, you struggle off and roll over into a pool of cum. ");
	if (pc.isBimbo()) output("You sit and stew in it a bit, taking in the feel, smell, and taste of the yummy, cummy pool before you eagerly hop to your [pc.footOrFeet], still licking cum from your lips.")
	else output("You quickly stand up and brush off as much of it as you can, still covered in a thick sheen of the stuff.");
	output(" With the milodan giantess thoroughly defeated and your desires sated, you get yourself together and head off, ready to face the rest of your journey.");
	output("\n\n")
	processTime(60);
	pc.applyCumSoaked();
	pc.taint(5);
	pc.orgasm();
	pc.orgasm();
	if (vIdx >= 0) pc.loadInCunt(enemy, vIdx);
	else pc.loadInAss(enemy);
	CombatManager.genericVictory();
}
public function winAndGetFuckedByBaseFutazon(vIdx:int):void
{
	clearOutput();
	showMilodanFutazon(true);
	output("The feisty amazon pounces on you, wrestling you to the ground, flipping you over and looking you dead in the eye as she looms over you. You’re about to chew her out when she locks lips with you again and plants her cock against your [pc.vagOrAss " + vIdx + "]. ");
	if (pc.hasCock()) output("She gets close enough that your [pc.cocks] get" + (pc.hasCocks() ? "s":"") + " squished between your two bodies. ");
	output("The suddenly-passionate sabertooth keeps making out with you for a solid minute before pulling off.");
	output("\n\n<i>“Is this a suitable position for you?”</i> She beams down at you with wide eyes and a loud purr. It’s the most passionate and calm you think you’ve ever seen her" + (flags["MET_MILODAN_FUTAZON"] > 1 ? " or any of these amazons":"") + ". With such an ernest presentation it’s hard to say no, especially since she’s already graciously done the work of lubing you up with her copious pre.");
	output("\n\nYou nod in agreement and watch her smile widen into a huge grin. <i>“Excellent! Lean on your strength, outsider, and hope that it’s enough to support both of us.”</i> Without another word, and while maintaining eye contact, she thrusts in wildly, burying about half-a-foot of thick meat in your [pc.vagOrAss " + vIdx + "]. Her feet and hands dig into the ground around you as she gets ready to really rut you.");
	output("\n\nYou stare back up at her defiantly, ready for whatever she’s going to throw at you. The fierce feline simply chuckles and rears up for another thrust. You stop a moan in your throat as her next rutting advance puts another five or six inches in you. It’s obvious from the way she stares at you that she’s looking for weakness in your face, and you’re damned determined not to give her any!");
	output("\n\nThere’s no breaks anymore as she immediately rears back again and starts going at you in earnest. Your [pc.legs] wrap around her back for support, doing nothing to slow her down. It doesn’t take long before she bottoms out, maybe seven or eight thrusts. The furry futa takes no time to savor that victory, though, not when she needs to focus on trying to break you.");
	pc.holeChange(vIdx,enemy.cockVolume(0));
	output("\n\nEven with a good few inches still unable to enter you, her balls are still big and pendulous enough that they slap against your [pc.ass]. Their huge, heated masses feel like two hot paddles on your rear. You show your first sign of weakness when one thrust hits a particularly sensitive spot. Your ");
	if (vIdx >= 0) output("[pc.pussy " + vIdx + "] clenches and squirts a bit of [pc.girlCum] around the invading girth");
	else output("[pc.anus] clenches down, seeping out a bit of its overwhelming pre-cream stuffing.");
	output("\n\nYour eyes roll up a bit and you let out a stifled moan, drawing a light cackle from the looming sabertooth. <i>“Feeling weak, outsider? I had hoped to see more fight from y...”</i> you interrupt her by pulling her in and forcefully locking lips again. It doesn’t stop her pace in the slightest. She leans into your [pc.lips] and attempts to wrestle you down again. Despite her best efforts to keep you down you keep fighting. You push back, both with your lips and with your hips. She won’t win that easy!");
	output("\n\nYour combined pace becomes feverish, furred flesh mashing against [pc.skinFurScales]. ");
	if (pc.hasCock()) output("Your unfortunate [pc.cocks] " + (pc.hasCocks() ? "are":"is") + " trapped in the middle of your two thrusting bodies. It’s equal parts pleasurable and painful, like a rough handjob from an abrasive partner. ");
	output("\n\nYour lips part with hers, and she lets out a few tired gasps, showing her own exhaustion. <i>“Your energy is... impressive, but I-I will still come out on top!”</i>");
	output("\n\nYou’ll see about that.");
	output("\n\nHer copious pre has been leaking out of her at a steady pace up until now, and you’re finally starting to feel the weight of it. Your [pc.belly] is filled with what feels like a few quarts of the stuff, and you can see it starting to swell up a bit. The mounting milodan starts to struggle; the immense confidence she had before has faded almost entirely. Instead there’s a look of exhausted determination as she focuses on you.");
	output("\n\nYou smile and laugh a bit, giving her a taste of her own medicine. She doesn’t like that, but she can’t give you any more than she’s already giving, so all she does is scowl at you and continue thrusting. You can feel her swelling inside your [pc.vagOrAss " + vIdx + "], readying up to unload. You also feel on the verge of orgasm but you hold off as best as you can, not wanting to be the first one to give in. You buck back at her, trying to make the oversized amazon blow her top before you do.");
	output("\n\nHer pace definitely becomes more erratic, even if it doesn’t slow down at all. The need and strain is evident on her face; her eyes are still locked on you, but they’re hazy and unfocused, almost like she’s looking through you. Her tongue lolls out, drooling warm saliva onto your face. You’re probably not doing much better but without a mirror you can’t exactly verify that.");
	output("\n\nJust when the pressure of holding back gets to be too much, you hear the beastial milodan yell out in pleasure. She bottoms out and holds there, letting you feel just how swollen she’s getting. Her face twists and contorts as you feel the first blasts of seed in your [pc.vagOrAss " + vIdx + "]. On that cue, you cum along with her, squeezing down on her throbbing pole while it fills you to the brim. Just as you’re about to yell out, the orgasming milodan locks lips with you again, moaning into your mouth while you return the favor.");
	if (pc.hasCock()) output("\n\nYour [pc.cocks] fire" + (pc.hasCocks() ? "s":"") + " off into the tight valley between you and her, wishing " + (pc.hasCocks() ? "they were":"it was") + " stuffed into such a nice, warm hole. ");
	output("Your [pc.belly] swells out into a nice dome as she continues filling you. Your tongues wrestle passionately as you both cum your brains out, hot bodies throbbing, twitching, and mashing together.");
	output("\n\nWhen you both start winding down, the exhausted milodan pulls away for a second before planting another kiss on your [pc.lipsChaste]. <i>“All this kissing you outsiders do... I like it.”</i> She pulls out of you, letting a river of kitty jizz leak out as she struggles to get back to her feet. You follow soon after, getting yourself put back together while the milodan amazon cools off. <i>“I must find you again, outsider. Your strange ways never cease to intrigue me.”</i> You nod absent-mindedly before setting off again, going your separate ways with the passionate amazon.");
	output("\n\n");
	processTime(60);
	pc.applyCumSoaked();
	pc.taint(5);
	pc.orgasm();
	if (vIdx >= 0) pc.loadInCunt(enemy, vIdx);
	else pc.loadInAss(enemy);
	CombatManager.genericVictory();
}

//Loss
//|		|  |
//| |....| _
public function milodanFutazonLose():void
{
	if (rand(2) == 0) getRuttedRealGoodByAMilodanFutazonCuzYouLost();
	//Normal
	else if (enemy is MilodanFutazon) haveNormalMilodanFutazonBreakYourJaw();
	//Bruiser
	else worshipThatBigMilodanFutazonBruiserCock();
}
public function noHP():void
{
	pc.HP(-100000);
}
//Getting Rutted
//Prioritizes vaginas unless the PC is pregnant.
public function getRuttedRealGoodByAMilodanFutazonCuzYouLost():void
{
	showMilodanFutazon(true);
	var vIdx:int = -1;
	if (pc.hasVagina() && pc.fertility() > 0 && pc.blockedVaginas() == 0){
		vIdx = pc.findEmptyPregnancySlot(1);
	}
	pc.lust(50);
	//HP
	if(pc.HP() <= 1) output("Your ears ring and your vision blurs as the milodan " + (silly ? "fut" : "am") + "azon cackles" + (!pc.isNude() ? ", tears your equipment off," : "") + " and tosses you to the ground.");
	//Lust
	else output("Your heart beats so hard that you can feel it in your ears. A heavy flush falls over your body as your legs give out and you completely submit to the amazoness" + (!pc.isNude() ? ", willingly tossing your [pc.gear] to the ground, leaving yourself bare before her" : "") + ".");
	//Merge
	output("\n\nThe modified milodan is on you immediately, coiling around and constricting your worn-down form like a cobra. She’s so close, holding you so tight that you’d be helpless even at full strength.");
	//Normal
	if (enemy is MilodanFutazon)
	{
		output("\n\n<i>“See how easy this is when you just give in?”</i> Her heavy words vibrate through you, adding to the sensation of being tied so tightly to her. You can feel her bitch breaker rub into your back, swollen and pulsing heavily in anticipation. You can’t help but twitch and writhe under her, trying to hold back the confused moans welling up in the back of your throat.");
		output("\n\n<i>“Don’t try and hide it, meat! I can tell already that you’re nothing but a cockwhore.”</i> She sits up, taking you with her. You find yourself pressed hard against her chest; her cock still firmly beating between your bodies and her heavy, boiling hot breath just inches away from your face. Blood rushes to your [pc.crotch]; it’s impossible <i>not</i> to get horny while she’s doing this. Her smell, her presence, the way she’s making you so thoroughly submit is so overwhelming that you can’t even think straight.");
	}
	//Bruiser
	else
	{
		output("\n\n<i>“Isn’t that better?”</i> Her words seem calm, almost motherly. <i>“It’s so much nicer when you submit, not to say I don’t appreciate the hunt.”</i> Her voice may be silky smooth, but her body is still rock hard and brutal. It’s a strange contrast that helps to shake your already reeling mind. The utterly massive totem of milodan cock rests between you and her like telephone pole. The pheromones leaking off the gargantuan rod reek so strongly that it feels like you’re breathing in more of her virile scent than you are air!");
		output("\n\nShe gets closer and closer until her breath is so hot on your face that the heat almost burns. <i>“You like this. I’m not even going to bother asking <b>if</b> you do because the answer is written all over you. Maybe you even came out here just for one of us to find you? I’ve seen many of you outsiders do such things. Perhaps you will join them?”</i>");
		output("\n\nYou try and stuggle but find that your body refuses to listen.");
		output("\n\n<i>“It’s too bad the chieftain forbids personal harems or I’d take you myself. I’d just be lugging you back just to hand over to that greedy...”</i> Her calm demeanor fades as she gets visibly angry at the thought. <i>“Enough talk! Come here, slut!”</i>");
	}
	if (pc.hasVagina() && vIdx >= 0)
	{
		output("\n\nYou moan out when she suddenly shoves two of her big, meaty fingers in your [pc.vagina " + vIdx + "]. You’re already soaked just from her holding you, so she slides in easily.");
		//Pregnant with Milodan
		if (pc.hasPregnancyOfType("MilodanPregnancy")) output("<i>“Already carrying one of ours? See? You are a slut! Don’t worry, I’ll make sure you never go without a litter of kip in you again!”</i> ");
		//Pregnant with Other
		else if (pc.isPregnant()) output("<i>“A full womb? That’s what I like to see. Though, you’d do much better carrying one of ours. Don’t worry, I’ll make sure you make up for it later.”</i>");
		//Not Preg
		else output("<i>“Running around with an empty womb, slut? It must be so hard for you. Don’t worry, I’ll make sure you leave with a full litter!”</i>");
	}
	else output("\n\nYou shout in pain and pleasure as you feel her big, strong hand slap against your [pc.ass]. <i>“Nothing for me to knock-up? What an inconsiderate little skank you are! I’ll just have to plow this other little hole of yours twice as hard to make up for it!”</i>");
	//Merge

	output("\n\nShe shifts, grabbing her massive bitch boner and threading it right in front of you. Your eyes are utterly transfixed on it, tracing over every bulging vein, marveling whenever it pulses and swells. ");
	if (pc.isBimbo()) output("Your mouth starts to water when you realize just how close she is to shoving it into you.");
	else output("A waft of musk shoots up your nostrils and batters down the last bastions of reason, forcing back the parts of your brain that are screaming at you about how bad this is going to go.");

	if (pc.hasCock())
	{
		output("\n\nHer cock presses into your [pc.cockBiggest],");
		if (pc.biggestCockLength() >= (enemy.biggestCockLength() + 6)) output("jealously thrusting against it, futilely trying to climb its immense size.");
		else if (pc.biggestCockLength() >= (enemy.biggestCockLength() - 6)) output("frotting against it as hard as she can.");
		else output("completely engulfing it with the sheer amount of enhanced meat she has.");
		if (pc.cockTotal() > 1) output("Its brother" + (pc.cockTotal() > 2 ? "s slap":" slaps") + " uselessly against her cock, bouncing back and forth against her immense member.");
	}

	output("\n\n<i>“See that, slut? Beg for it.”</i> ");
	if (pc.isBimbo()) output("You respond immediately, spurred on by your fuck - hungry instincts. She stumbles when you start slamming your [pc.hips] into her, begging to be fucked. She even seems to be surprised for a second, before a huge grin sweeps across her face.");
	else output("You hesitate for a moment, which is just long enough to get her impatient. She thrusts into you, sending you bouncing against her. <i>“BEG, or this is gonna get very unpleasant !”</i> You scream exaltations for her at the top of your lungs, talking from pure instinct and begging to be fucked against any better judgment you’d normally have.");

	output("\n\nYour begging is interrupted when she hoists you into the air and plants your [pc.vagOrAss " + vIdx + "] onto her tip. Before she plunges you straight down, she at least does you the courtesy of taking the copious amount of pre she’s letting out and using it to lube you up. With how close her cumslit is to your hole and how forceful her ejaculations are you’re filled almost to the brim before she’s even stuck her cock in!");
	output("\n\n<i>“Better be ready!”</i> she screams before ramming herself in as far she’ll go. Your mouth gapes open, but your body is too shocked to make any noise. All you can do is just twitch in place while the massive milodan uses you like a living cocksleeve. <i>“Get used to it while you can; I’m going all out in a second, and I don’t want my toy breaking before I get to enjoy it!”</i>");
	pc.holeChange(vIdx,enemy.cockVolume(0))
	//Normal
	if (enemy is MilodanFutazon) output("\n\nYour mind races at that moment, going from fear to pleasure to confusion and then back and forth until you feel like your head is about to split open! That moment is all you get. It only takes her a few seconds before she gets impatient and lifts you back up. She takes you back up to the tip, snarls, and then shoves you back down.");
	//Bruiser
	else output("\n\nThe amount of cock inside of you seemingly defies reality, and it’s not even half her length! Your mind contorts and cracks trying to comprehend it all. <i>“So hard to find outsiders who can take this much! Still disappointing, but I suppose I can’t ask much more of that puny body of yours.”</i> Without another word she lifts you back up and slams you down!");
	output("\n\nAny time she gave you to warm up is long gone, by the time you can even register what’s happening she’s already ramped up to a ludicrous pace. You can see the outline of her awe-inducing rod in your [pc.belly] every time she bottoms out, adding to the feeling of being nothing but an object for her pleasure. The pure overload of sensation makes any pain fade into the mass of feelings.");
	//Normal
	if (enemy is MilodanFutazon) output("\n\nThe way her hips slam into yours over and over leaves you with an intense tenderness through your entire lower body. It actually starts to feel oddly good after a bit, in fact, as it goes on you seem to be taking more and more pleasure out of it. If the way the almost overwhelming musky smell makes you head tingle is any indication, her enhanced pheromones must be strong enough to overwhelm your other senses.");
	//Bruiser
	else output("\n\nHer giant, strong hands grab tightly onto your waist in order to keep you steady. You feel like a ragdoll, flopping around helplessly at the end of an oversized pole. It becomes oddly pleasurable as time goes on. A combination of being so utterly stuffed, her strong, warm grip, and her utterly overwhelming musk makes the whole experience seem greater than the sum of its parts." + (pc.isBimbo() ? "Then again you just like sex no matter what!":"Although that could just be your pheromone-stained brain talking.") + "");
	output("\n\nWhat feels like hours pass by with you in this building sexual stupor. Every thrust feels better than the last, making your whole body shake and convulse as you start to orgasm uncontrollably. Your [pc.vagOrAss " + vIdx + "] squeezes down on her with all your might, but only manages to throw her off for one thrust before she’s back to full swing.");
	if (pc.hasCock()) output("Your [pc.cocks] " + (pc.cockTotal() > 1 ? "fire":"fires") + "off in " + (pc.cockTotal() > 1 ? "a seemingly endless stream":"seemingly endless streams") + ", draining your [pc.balls] like " + (pc.cockTotal() > 1 ? "it’s":"they’re") + " attached to " + (pc.cockTotal() > 1 ? "broken faucets":"a broken faucet") + ".");

	output("\n\nStrands of drool fly out of the corner of your mouth, your brain reduced to fucked-out mush long ago. Her pheromones have overwhelmed all your senses, leaving you feeling like you’re suspended in a warm pool of pure sex. You only snap out of your trance when the milodan amazon stops and snarls in your ear.");
	output("\n\n<i>“If you wanna be dead weight, then fine.”</i> She drops you onto the ground, only bothering to hoist up your [pc.ass]. You scramble around, not knowing what’s going on until you feel her loom just above you, her cock pressing against your already-gaped " + (vIdx >= 0 ? "honeypot":"anus") + ". Her heavy hands wrap back around your head, and you can feel her breath washing over your neck in the split second before she gets back to work.");
	output("\n\nYou scream for the first time in what feels like hours as the milodan ravages you, going even faster thanks to her new position. You cum again, uselessly squeezing down on her blur of a cock");
	if (pc.hasCock()) output(" while your [pc.cocks] uselessly spray" + (pc.cockTotal() > 1 ? "s":"") + " onto the ground under you.");
	else output(".");
	//Normal
	if (enemy is MilodanFutazon)
	{
		output("\n\nShe grunts and groans, her resistance torn down by her own frantic pace. You can feel how heavily her balls have swollen as they slam against your [pc.ass]. The milodan’s lust comes to a head when she thrusts particularly hard, trying to shove as much of her cock into you as possible. Your eyes go wide when you look back and see the sheer size of the knot she’s trying to shove into you!");
		output("\n\n<i>“TAKEITTAKEITTAKEITTAKEIIIIIIIIIIIIIIIIIIIIIIIIIIIT!”</i> Unfortunately, physics don’t bend to screaming, and the knot thankfully stays firmly outside of you. That doesn’t stop her from dumping gallons of virile bitch-jizz into you. If anything the frustration just makes her cum more.");
	}
	//Bruiser
	else
	{
		output("\n\nShe growls in sublime pleasure as she quickly climbs toward her own limit. You can feel her cock swell even larger inside you as her pace becomes beastial. She tries to shove more of her immense cock into you and manages to be surprisingly successful. You feel your body stretch beyond even your unreasonable limits as a few more, veiny inches slip inside you.");
		output("\n\n<i>“Damn it, I never get to use this fucking knot! Should make this smaller... but it feels so fucking good stuffing you like this! F-fucking, you’re taking all of what mommy’s giving you, knot or not!”</i> You’re not sure if the pun was intentional or not but you suppose that doesn’t matter when gallons of sabertooth jizz is flowing into your [pc.vagOrAss " + vIdx + "].");
	}
	//Merge
	output("\n\nYour " + (vIdx >= 0 ? "womb":"[pc.belly]") + " swells with her seed, rounding out to a big, cum-pregnant paunch in seconds and just keeps going. She howls in exertion, and you can feel just how hard her balls and cumvein are working to " + (vIdx >= 0 ? "knock you up":"stuff you full") + ". The overwhelming feeling finishes the job her pheromones started and shatters your mind, sending your body shivering and convulsing as the flowing river of seed inside you shakes you to your very core.");
	output("\n\nEverywhere her sperm touches, you feel something seep into you, like some insidious drug soaking into your muscles, filling them with a sense of perverse and corrupting power. Even in your close-to-broken state, the sound of your codex’s alarm blaring still rings somewhere deep in your mind but there’s nothing coherent left to act on it. All you can do is sit there and let the milodan amazon dump gallons of tainted seed into your " + (vIdx >= 0 ? "womb":"gut") + ".");
	output("\n\nYour senses fail you when she starts thrusting again, working herself to make sure she completely seeds you with just this single orgasm.\n\n");
	processTime(4 * 60);
	pc.taint(7);
	pc.applyCumSoaked();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	if (vIdx >= 0) pc.loadInCunt(enemy, vIdx);
	else pc.loadInAss(enemy);
	clearMenu();
	addButton(0, "Next", lostToMilodanFutazonAndGotFuckedBad);
}
//JawBreaker
public function haveNormalMilodanFutazonBreakYourJaw():void
{
	showMilodanFutazon(true);
	//HP
	if(pc.HP() <= 1) output("Your ears ring and your vision blurs as the milodan" + (silly ? "fut" : "am") + "azon cackles" + (!pc.isNude() ? ", tears your equipment off" : "") + "and tosses you to the ground.");
	//Lust
	else output("Your heart beats so hard that you can feel it in your ears. A heavy flush falls over your body as your legs give out and you completely submit to the amazoness" + (!pc.isNude() ? ", willingly tossing your [pc.gear] to the ground, leaving yourself bare before her" : "") + ".");
	//Merge
	output("\n\nYour eyes close shut in pain when you hit the ground. In that time, the milodan manages to move quick enough that when you open up your eyes, you’re greeted by the sight of her looming over you, gargantuan balls swinging right above your face. <i>“Time to put that mouth of yours to work, space bitch!”</i> She squats down until her sack is barely an inch from your face. <i>“Get me warmed up nice and good here. Defiant ones like you need <b>long, hard</b> lessons in obedience!”</i>");
	if (pc.isBimbo()) output("\n\nThe thick smell of her musky sack travels into your [pc.nose] and beelines straight for your brain. Higher functions shut down immediately as you feel your true calling approaching. Your baser instincts come out in full swing as one, familiar, overriding thought enters your mind: time to suck some cock!");
	else output("\n\nYou try your hardest to keep your composure, but the potent smell of her sack is impossible to ignore. It’s an almost complete assault on your senses, so thick that it saturates your taste buds. The muscles in your mouth start moving on their own, opening up your jaw and starting to extend your [pc.tongue] without you even having a say in the matter. It’s a scary situation, but you realize that the punishment for going against her now is most likely way worse than what she’s already planning, so the best option may still be to go along with it.");
	output("\n\nYou lap at the thick, leathery skin of her testes, " + (pc.isBimbo() ? "savoring":"whinging at") + " the dense, masculine taste. Your tongue feels almost magnetized to the surface of her sack, rolling out of your mouth in order to engulf more and more of her ballskin.");
	if (pc.hasLongTongue()) output(" The sheer amount of tongue that swirls around her balls surprises her. In no time even her substantial size is nearly fully covered by your oral organ. <i>“You offworlders have such interesting traits! I’d keep you as my personal ball polisher if the chief didn’t forbid us from personal harems.”</i>");
	output("\n\nThe taste over-saturates your taste buds, and the intense heat coming off of her sperm factories makes it hard to tell where your tongue ends and her orbs begin. All the while her throbbing bitch breaker obscures the periphery of your vision. It throbs and aches with every slight movement of your tongue on her sack, pouring out thick wads of pre that splatter down audibly so close to your head that errant drops create a coating on your [pc.hair] and forehead.");
	output("\n\n<i>“Mhmmp! You’re a natural at this. Shouldn’t let treatment like this go to waste.”</i> Her strong hands wrap around her member and start to stroke it, drawing out a husky moan from the milodan brute. <i>“I’m going to let you take me all the way with this. Don’t worry, one orgasm is just a warm-up for me! You’re still gonna get the full face-fucking treatment, especially with a tongue like that.”</i>");
	output("\n\nShe squats down even further, draping her huge, throbbing balls over your mouth and nose. ");
	if (pc.isBimbo()) output("You moan out loud at the overwhelming feeling of her dominance. Your face only exists as a series of holes for her to fuck or for you to appreciate just what a fucking stud the furry amazoness is! It doesn’t matter that you can’t breathe. If anything, that just adds to the feeling. The way she indulges herself to your ball-sucking fills you with a sense of pride that drives you to go even further, to lick and suck harder, to show her that no one sucks cocks and balls like you do!");
	else output("You start feeling lightheaded. Your nostrils and mouth are completely covered in her ballsack, making it so that the only thing you can breathe in his her thick musk. It feels like you’re trapped in the world’s smallest, hottest sauna, only instead of hot coals, it’s heated by big, hot futa balls. You couldn’t stop yourself from licking and sucking and kissing her balls if you wanted to. It’s not even just the pheromones battering your brain, it’s also the thought in the back of your mind that the domineering milodan won’t hesitate to suffocate you with her testes!");
	output("\n\nThe priestess-turned-brute continues to work herself over to the beat of your ball worship. The gigantic orbs throb harder and harder against your mouth and tongue as more and more of her thick pre splatters into an increasingly deep puddle around your head. Her groans become more and more frantic as she approaches orgasm.");
	output("\n\n<i>“Fuck yes, spacer bitch, your mouth is so fucking good! I think you deserve a treat.”</i> She lifts off of you for the first time what feels like hours, presenting her bitch-boner to you as it squirts out a thick spray of pre that coats your entire face. <i>“Open wide!”</i> You don’t have any time to react before the mutated milodan leans down into a squatting position and slams her cock into your mouth.");
	output("\n\nImmediately, you feel her thick seed rush down your throat as she growls so loudly that your ears start to ring. <i>“Here’s your fucking appetizer. Make sure you save room for the main course, meat!”</i> What feels like gallons of seed rushes down your gullet, bloating out your [pc.belly] like a balloon while the milodan cackles madly. Just when you feel her orgasm start to wane her muscles start to tense up again and she lifts off of you again.");
	output("\n\nThe beastial amazon rears back until just her tip is left in your mouth, allowing you to breathe for just a scant second. <i>“You’d better hope you’re ready, outsider, ‘cause I’m not going to stop if you pass out!”</i> She thrusts back in, ");
	if (pc.canDeepthroat()) output("taking full advantage of your yielding throat in order to shove down inch after oversized inch of her mammoth member until she’s completely sheathed in your throat-turned-sex-toy.");
	else output("battering your gag reflex into submission as she forces as much of her member down your throat as she can fit.");
	output("The milodan mutant holds for a moment, grinding her crotch into your face just so you can feel how overwhelming her presence is, how much she’s able to fill you, how full her balls still feel on your chin despite already cumming.");
	output("\n\nWhen she feels like you’ve been thoroughly stuffed, the former priestess pulls back with enough force that it feels like she’s trying to rip your head from your shoulders only to force it back in with the subtlety and care of a sledgehammer. You’re never given a chance to adjust to her pace, not like you could ever do much more than endure it. Every time she thinks you might be getting comfortable, she summons up the strength to pummel you even harder.");
	output("\n\nHer balls feel like a warmed-up pair of shot-puts slamming into your chin repeatedly. In the back of your mind, there’s a faint hope that the battering will slow her down, but having fought her already, you realize that, if anything, the pain is probably only egging her on.");
	output("\n\nMoments when you can see something other than the fur of her crotch are limited to brief glimpses of her rearing back to thrust into your mouth again. The scant amount of air you’re able to get between thrusts is barely enough to keep you conscious, which may be a good thing considering how it dulls the pain of having your jaw forcefully stretched to accommodate her mutated milo-cock.");
	output("\n\nThe only thing you can hear between the wet slap of her cock in your throat and her balls into your chin is the wild howling and groaning of the milodan amazon. She sounds like a feral beast, utterly devoid of any higher thought other than seeding your face as hard and vigorously as possible.");
	if (pc.isBimbo()) output("\n\nYou won’t deny that this kind of treatment gets you super fucking horny! Your mouth wasn’t really made for talking and all that dumb stuff. It still does, especially when you’re asking some stud to fuck you, but it just feels so much better put to its natural use of sucking dick! Sure she’s being a little rough on you, but that just means she likes what you’re doing so much that she can’t get enough.");
	else output("\n\nSome part deep inside of you is enjoying this. The feeling of being pinned under a hung, muscular beast as she uses your body for her own pleasure is so satisfyingly primal that it almost makes up for the almost unbelievable strain on your jaw; <i>almost</i>.");
	output("\n\nHer balls feel heavier and hotter against your chin with each impact, signaling her impending climax. Rather than slow down and perhaps hold off her orgasm, she speeds up, putting every last ounce of strength towards battering your face in. Steaming hot fluid fills your mouth and throat by the gallon, spread in dense puddles between your jaw and gut by her constant movement. Gouts of milodan seed burst through the tight seal of your [pc.lips], largely dragged out forcefully by her sawing movements.");
	output("\n\nNo matter how much spills out she has plenty more to replace it. Your belly rounds out rapidly while waterfalls of seed flow into a pool around you. You feel your consciousness starts to fade as the only thing going in or out of your mouth and nostrils is cum. Right when the blackness starts to take you, you hear a howl of irritation and feel the milodan pop out of your mouth.");
	output("\n\n<i>“Fucking wimp can’t even take my whole orgasm! Looks like you’re getting a good paint-job while I wait for you to drain.”</i> You cough up cum by the quart while the milodan amazon sprays you down with the rest of her creamy payload. Now that you have a moment to calm down, you realize something strange. Every part of you that her cum touches (which is all of you at this point) tingles almost as though there was some kind of electric charge to it. The more piles on, the stronger the feeling gets and the more it seems to sap your strength.");
	output("\n\nEven without being choked by her cock, you don’t think you can stay conscious. Between the treatment you’ve endured and whatever her cum is doing to you, you pass out within minutes, the last you see being the blaring corruption alarm on your codex.");
	output("\n\n");
	processTime(85)
	pc.taint(8);
	pc.applyCumSoaked();
	pc.maxOutLust();
	pc.loadInMouth(enemy);
	clearMenu();
	addButton(0, "Next", lostToMilodanFutazonAndGotFuckedBad);
}
//Cock Worship
public function worshipThatBigMilodanFutazonBruiserCock():void
{
	showMilodanFutazon(true);
	//HP
	if(pc.HP() <= 1) output("Your ears ring and your vision blurs as the milodan" + (silly ? "fut" : "am") + "azon cackles" + (!pc.isNude() ? ", tears your equipment off" : "") + "and tosses you to the ground.");
	//Lust
	else output("Your heart beats so hard that you can feel it in your ears. A heavy flush falls over your body as your legs give out and you completely submit to the amazoness" + (!pc.isNude() ? ", willingly tossing your [pc.gear] to the ground, leaving yourself bare before her" : "") + ".");
	//Merge
	output("\n\nYou wince in pain as you impact with the ground. In that brief moment, the lusty sabertooth saunters up to you and smacks her gigantic member down onto your face. <i>“Unimpressive, outsider. Let’s hope, for your sake, that you do far better pleasing me than you do fighting me.”</i> She thrusts in further, filling your vision with her thick cumvein and your nostrils with her dense musk.");
	output("\n\nYou start licking along the length of her underside without even thinking about it. The thick, salty taste stains your taste buds so deeply that you get the full taste even when you pull away from it. Her heavy, throbbing balls rest on your [pc.belly] like a pair of heated boulders. <i>“Obviously I’m going to need more than your tongue for this. Lucky for me I own your whole body now.”</i> The massive milodan takes your arms and wraps them around her girth, turning you into a living onahole!");
	output("\n\n<i>“There, now hold on tight and put that mouth to good use. If you make mommy happy enough she won’t have to fuck your throat!”</i>");
	output("\n\nWith how pheromone-fried your brain is already you’re not sure you could resist if you wanted to. Your mouth hangs open, [pc.tongue] lolling out and brushing along her underside near constantly. Her cumvein throbs, prompting you to instinctively kiss the swelling cum-pipe as it transports a thick wad of dense pre up to her cumslit. She rears back and lets her pre-seed splatter all over your face.");
	output("\n\n<i>“That’s just a taste of what’s to come.”</i> She sits there for a minute, letting you watch as her monolithic member throbs and splatters more and more thick, sticky pre onto you. The smell of her musk penetrates so deep into your brain that your senses start to numb. You jerk off her cock with your arms, drawing out more of her dense cockjuice.");
	output("\n\n<i>“Well, that didn’t take long! Am I that good or are you just that much of a slut for mommy’s cock?”</i>");
	output("\n\nEven if you had an answer your mouth is too filled with thick, white pre to let out anything but a weak gurgle.");
	output("\n\n<i>“I’ll take that as a yes, you little slut!</i>” The hyper-hung milodan thrusts forward, smacking you in the face as she begins to fuck you like a full-body cocksleeve.");
	//Cupsize variants
	//tiny
	if(pc.biggestTitSize() < 4)
	{
		output("\n\nHer dick sails through the unimpressive valley of your [pc.chest] gaining little extra satisfaction from your " + (pc.biggestTitSize() <= 0 ? "flat":"barely-existant") + " chest. <i>“Disappointing, outsider. If you wanted to be a good cocksleeve for mommy I would have expected <b>some</b> cushioning!”</i>");
		output("\n\nYou didn’t <i>want</i> to be her cocksleeve but still, some part of you feels oddly guilty for disappointing her.");
	}
	//normal
	else if (pc.biggestTitSize() < 8)
	{
		output("\n\nHer immense dick flattens your [pc.breasts] like pancakes under its immense girth. <i>“I forget how small you outsiders are. If you intend to be my cocksleeve you should know that I have <b>far</b> higher standards!”</i> Somewhere deep in your gut there’s a strange, welling feeling of both guilt and anger at her words.");
	}
	//big
	else if (pc.biggestTitSize() < 18)
	{
		output("\n\nYour [pc.breasts] wrap around her immense girth but can’t even manage to get up half-way. <i>“Your chest is quite ample, outsider, but it’s still not up to par for me. Perhaps you’d be more fitting for my smaller sisters. The little terrors need their toys or they’ll lose their minds. Would you like that, outsider? We may not have harems but you’d never be lonely as a communal toy!”</i>");
		output("\n\nYou shiver, but you’re not sure if it’s in fear or some strange sense of excitement.");
	}
	//huge
	else if (pc.biggestTitSize() < 32)
	{
		output("\n\nYour [pc.breasts] actually manage to engulf most of her immense girth, drawing out a hearty moan from the ultra-hung milodan. <i>“Theeeeeeeere... That’s a bust fit for a queen! Did you come out here knowing that one of us was going to find you? After all, only a cock of my calibur could truly challenge a bust like this.”</i>");
		output("\n\nThe only response you can give is letting out a weak moan at the feeling of her mammoth cock so perfectly sliding between the valley of your titanic tits.");
	}
	//ultra
	else
	{
		output("\n\nEven with the sheer size of her dick it’s nothing compared to the unreal size of your [pc.breasts]. The hyper-sized milodan looks on in awe as her member completely disappears almost completely between your mountainous tits. <i>“S-such immense breasts! I don’t think I’ve ever seen ones this massive. You truly are a work of dick-pleasing art, outsider! You could fit three of us in between these. Or perhaps... I could earn more sacred water... grow even larger... The chieftain would say no but who cares what she thinks!”</i>");
		output("\n\nYou’ve heard of breast lovers but she seems almost rabid about it!");
	}
	//Merge
	output("\n\nShe continues thrusting across your body, slathering you in thick streaks of pre-cream across your face, [pc.chest], and [pc.belly]. All the while her heavy balls rolls over your legs and crotch. ");
	if (pc.hasCock()) output("Your [pc.cocks] " + (pc.hasCocks() ? "are":"is") + " crushed underneath the weight of her sack. It’s equal parts brutally tight and pleasurable, and you’re not entirely sure what to make of it.");
	if (pc.isHerm()) output("Your [pc.pussy] quivers underneath your " + (pc.hasBalls() ? "[pc.balls]":"[pc.cock]") + ", unable to do much more than stew away in its own heat.");
	else if (pc.hasVagina()) output("Your [pc.pussy] quivers as her heavy balls brush over it. It throbs so hard that you can almost feel her swimmers reaching for your honeypot through the thick skin of her sack.");
	output("\n\nThe smell is almost suffocating, like a thick cloud descending on you, choking out any oxygen. Somehow it feels almost as heavy as the dense layer of cock-slime coating you. Your head starts feeling light as the smell and feel of her ‘essence’ drills deeper and deeper in. All you’re able to do is lay there and watch her use you. Your arms have long since lost their ability to do anything more than hang around her limply.");
	output("\n\nYour vision has melted into a black smear as her cock goes faster and faster. You’re sure that your skin is being rubbed raw, but your brain is too burned out to register anything but pleasure. The lust-wracked milodan continues to scream and howl but you can’t possibly focus enough to make anything out.");
	output("\n\nOne thing you can make out is how close to orgasm she is. The throbbing of her balls is so omnipresent that you can feel it even through your numbed nerves, and it’s getting quicker and harder. A piercing shriek rings through your ears while her cock and balls bloat heavily against you. You look up from the swamp of sex juice that you’ve plastered in for the past stars know how long only to catch a biblical wave of white as she unloads.");
	output("\n\nYour head is knocked right back down by the first blast with the next few plastering you to the ground. It never lets up, not even with her rising up after successfully painting your face and [pc.chest] with a comforter-thick layer of cum. The fecund amazon continues hosing you down, having no shortage of semen thanks to her over-developed cum tanks.");
	output("\n\nYou feel like you’re floating in an ocean, unable to move, barely able to breathe. All you can perceive is the feeling of limp weightlessness. With nothing to hang on to or ground yourself in you find yourself drifting off, falling unconscious as her cum begins to tingle on your skin.");
	processTime(85)
	pc.taint(8);
	pc.applyCumSoaked();
	pc.maxOutLust();
	clearMenu();
	addButton(0, "Next", lostToMilodanFutazonAndGotFuckedBad);
}
//Post-Loss
public function lostToMilodanFutazonAndGotFuckedBad():void
{
	clearOutput();
	//showMilodanFutazon();
	author("QuestyRobo");
	output("You wake up sometime later, beaten, sore, and covered in cum. Your codex is still blaring about elevated levels of Taint coming from the semen. ");
	if (pc.taint >= pc.taintMax) output("Good thing your body can’t possibly absorb more of the stuff.");
	else output("As if that wasn’t the last thing you needed right now.");
	output("\n\nNo way for you to clean it off here. You’re going to need to shower as soon as possible, but that’s something to worry about later.");
	output("\n\nTime to get moving.\n\n");
	processTime(70);
	CombatManager.genericLoss();
}
