
public function showSydianCboy(nude:Boolean = false):void
{
	if (enemy.hasCock()) showName("SYDIAN\nHERM");
	else showName("SYDIAN\nCBOY");
	var bustS:String = "SYDIAN";
	if (enemy.hasCock()) bustS += "_HERM";
	showBust(bustS + (nude ? "_NUDE":""));

	author("GothPastel");
}
public function sydianCboyAvailable():Boolean
{
	if (pc.level < 6) return false;
	if (flags["MET SYDIAN FEMALE"] == undefined) return false;
	if (flags["MET_SYDIAN_MALE"] == undefined) return false;
	if (pc.hasStatusEffect("Syd Cboy Cooldown")) return false;
	return true;
}
public function encounterSydianCboy():void
{
	var tEnemy:SydianCboy = new SydianCboy();
	setEnemy(tEnemy);
	
	if (flags["SYD_CBOY_GREW_COCK"] == 1)
	{
		enemy.createCock();
		enemy.cocks[0].cLengthRaw = 8;
		enemy.cocks[0].cThicknessRatioRaw = 1.5;
	}

	showSydianCboy();

	if (!enemy.hasCock()) output("\n\nYou whip around just in time to see what appears to be a male sydian barreling towards you. Far more aggressive than the others you’ve seen, his intention remains the same: subduing you by force. You’ll have to fight!");
	else output("\n\nYou whip around just in time to see a familiar male sydian barreling towards you. Despite what you’ve done for him, his intention remains the same: subduing you by force. You’ll have to fight!");
	IncrementFlag("MET_SYDIAN_CBOY");

	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(defeatSydianCboy);
	CombatManager.lossScene(sydianCboyLossRouter);
	if (enemy.hasCock()) CombatManager.displayLocation("SYDIAN\nHERM");
	else CombatManager.displayLocation("SYDIAN\nCBOY");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}
//Sex Scenes
//PC WIN
public function defeatSydianCboy():void
{
	showSydianCboy();
	//HP Win Text
	if (enemy.HP() <= 0)
	{
		output("The fury in the Sydian " + (!enemy.hasCock() ? "cuntboy’s":"maleherm’s") + " eyes seems to fade as he collapses to his knees.");
		output("\n\n<i>“You win, offworlder, do what you wish.”</i>");
		output("\n\nLooks like he’s too exhausted to fight back... Do you take advantage?");
	}
	//Lust Win Text
	else
	{
		output("The Sydian " + (!enemy.hasCock() ? "cuntboy’s":"maleherm’s") + " expression gives up on containing anything but lust as he falls to his knees - leant back and legs spread.");
		output("\n\n<i>“You win, offworlder. Please, take me as you wish.”</i>");
		output("\n\nLooks like he’s too turned on to think about anything but getting fucked... Do you take advantage?");
	}
	output("\n\n");
	clearMenu();
	if (enemy.hasCock()) addButton(0,"Take Cock",takeSydianHermCock,[takeSydianHermCock, enemy.cockVolume(0),1,0],"Take Cock","You gave him a dick, may as well use it.");
	else
	{
		if (pc.hasItemByClass(Throbb) || pc.hasItemByClass(Virection)) addButton(0,"Give Mods",giveCboyADickHeWantsOne,undefined,"Give Mods","He seems pretty upset... Maybe about not having a dick? You could do something about that.");
		else addDisabledButton(0,"Give Mods","Give Mods","He seems pretty upset... Maybe about not having a dick? Nothing you can do though.")
	}
	if (pc.hasCock()) addButton(1,"Fuck Puss",penisRouter,[fuckSydCboyPussy,enemy.vaginalCapacity(0),false,0],"Fuck His Puss","Your dick, his pussy.");
	else addDisabledButton(1,"Fuck Puss","Fuck His Puss","You’re gonna need a penis of your own.");
	if (pc.isNice()) addDisabledButton(2,"Spank","Spank","He seems upset, and you’re not really the type to make things worse.");
	else if (pc.isTaur()) addDisabledButton(2,"Spank","Spank","This wasn’t written for taurs.");
	else addButton(2,"Spank",spankSydCboyCuzYouAnAsshole,undefined,"Spank","Show the big bad rust monster how offworlders deal with naughty boys.");
	if (flags["TALKED_TO_SYDIAN_CBOY"] == undefined) addButton(3,"Talk",talkToSydCboyAboutFeewings,undefined,"Talk","Find out what happened.");
	else addDisabledButton(3,"Talk","Talk","There’s nothing more to say.");
	addButton(14,"Leave",leaveSydCboyBehind);
}
//Take Cock
public function takeSydianHermCock(x:int):void
{
	clearOutput();
	showSydianCboy(true);
	output("You really were nice, giving him mods before... Time to use what you’ve given him.");

	var looseness:Number = pc.ass.looseness();
	if (x >= 0) looseness = pc.looseness(x);

	//{Choose the modified throbb or virection scene at random}
	//Throbb
	if (rand(2) == 0)
	{	
		output("\n\nYou");
		if (!pc.isNude()) output(" strip and");
		output(" crouch next to the sydian, rocking back on your heels as you wrap a hand around his cock. Even this slight teasing has it hard, hot and pulsing in your grasp as you run your fingers over the head. Your pinkie traces over his cumslit, drawing a single bead of quicksilver and you grin, scooping it up and licking it up. <i>Delicious.</i> He squirms under you, an almost embarrassed sounding insectile chitter erupting from him as he takes in your");
		if (pc.isNice()) output(" almost");
		output(" predatory gaze.");
		output("\n\nThe sydian has other ideas though. You know well that he is not one to tolerate easy submission. You’re just about to settle over him, lining his cock up against your [pc.vagOrAss " + x + "] when he strikes. There’s a blur of motion, and you soon find yourself winded, on your back, with over seven feet of lusty alien pinning you down. Maybe it’d bother you under normal circumstances, but you knew what you were getting into - right now, the rust monster is nothing but a rutting beast whose brain is fuelled and driven only by his cock. The thrust into your [pc.vagOrAssNoun " + x + "] is savage, animalistic, and it takes you a moment even after the pain-pleasure fades to notice that ohh, good, perfect - the sydian’s signature cilia have started to massage and stroke your sensitive inner walls and smearing them with aphrodisiacs.");
		output("\n\nOn sheer instinct, your");
		//goo:
		if (pc.isGoo()) output(" [pc.leg] splits into two masses, reforming around his hips");
		//naga:
		if (pc.isNaga()) output(" tail wraps around his hips and abdomen");
		//{non-goo, non-naga:
		else output(" [pc.legs] wrap around his hips");
		output(", holding him tight against you");
		if (pc.hasCocks()) output(", your [pc.cocks] trapped, frotting against your needy forms");
		output(". There’s nothing for it but to cling tight to him as he begins thrusting into you,");
		if (looseness > 3) output(" even your ");
		if (x >= 0) output("pussy");
		else output("asshole");
		output(" managing to clamp down tight, spasming as the aphrodisiac leaking tendrils lining his cock stroke and stimulate your insides.");
		output("\n\nYou’re treated as little more than a sex toy for him, a simple object made for the sole purpose of taking his cock - and you fucking <i>love</i> it. Large, plated hands clasp your shoulders, ensuring you can’t make the slightest move against his wishes - despite the exhausted, submissive gestures from before. He’s had quite the second wind. You knew this would happen, you must have, not that you’re complaining! It’s not long before nothing matters to you other than the feeling of his cock pounding into you, cilia exploring every inch of you.");
		if (x >= 0) pc.cuntChange(x, enemy.cockVolume(0));
		else pc.buttChange(enemy.cockVolume(0));
		output("\n\nOf course, you don’t neglect his pussy - you won, after all, it’s your right - plunging two [pc.fingers] into his wet, dripping snatch. You easily find his g-spot, engorged now as it takes the role of his cock’s base, pounding it rhythmically in time with his frantic thrusts");
		//{pussy:
		if (x >= 0) output(" against your own");
		//ass, has cock:
		else if (pc.hasCock()) output(" against your prostate");
		//else:
		else output(" into your ass");
		output(". The sydian seems equal parts eager to thrust into your [pc.vagOrAss " + x + "] and to press against your digits, creating a ceaseless rhythm of desperate, powerful thrusts. He won’t last long, you realize. He’s fallen out of practice, still not used to the cock you gifted him with... No matter. You soon chase him to a shared orgasm,");
		//{pussy:
		if (x >= 0) output(" working [pc.oneClit]");
		//ass, has cock:
		else if (pc.hasCock()) output(" stroking [pc.oneCock]");
		//neuter:
		else output(" pinching and pulling at your [pc.nipples]");
		output(" with your free hand.");
		output("\n\nHe howls, a bestial cry of pleasure, pouring what feels like weeks worth of backed up cum into your spasming hole, treating you as nothing but an object for him to vent his frustrations and lusts into. That won’t stand, of course. The moment he’s done and his grip slackens, you roll the both of you over. He isn’t allowed any time to go soft as chemical lust fills your brain once more, riding him as hard as your");
		if (!pc.hasPerk("Amazonian Endurance")) output(" shaky, post-orgasm");
		output(" [pc.legOrLegs] will allow for.");
		output("\n\nFor a moment it looks like he might try and fight you, but now that his initial climax is fading, he respects your right to do as you will with him.");
		output("\n\nYou grin. Much better.");
		output("\n\nPulling your fingers from his spasming cunt - and laughing breathily when his tail flies up instead to stuff him full not even a moment later - you turn your attention to his antennae, teasing at their feathery tips and coating your palms in slick aphrodisiac. Your hands roam over your body");
		if (pc.hasBreasts())
		{
			output(", cupping");
			if (pc.totalBreasts() > 2) output(" two of");
			output(" your [pc.breasts]");
			if (pc.isLactating()) output(" and squeezing, coaxing out beads, then streams of [pc.milk] as you lather");
			else output(" and lathering");
			output(" them up. V");
		}
		else output(", v");
		output("enturing lower and lower... You skip past your crotch for now. Inner thighs, ass, lower stomach - you soak them all in chemical bliss, tugging at your ‘victim’s’ feelers whenever you need a fresh coating.");
		output("\n\nYou wait for the perfect moment. The Sydian’s breaths come shorter, he spurts pre into you with each downward motion, your moans grow louder, your ");
		if (x >= 0) output("pussy");
		else output("asshole");
		output("\ spasms on his shaft. Then, finally, finally, you");
		//{PC has cock(s):
		if (pc.hasCock()) output(" wrap your hand around " + (pc.hasCocks() ? "one of your cocks":"your cock") + ", coating it in aphrodisiac and jerking it firmly");
		//vag(s) only:
		else if (pc.hasVagina()) output(" move to " + (pc.totalClits() > 1 ? "one of your clits":"your clit") + ", pinching and pulling at it as you coat it in aphrodisiac");
		//else:
		else output(" flatten your palm against your bare groin, coating it in aphrodisiac");
		output(" and <i>cum</i>. You both do.");
		output("\n\nSeemingly thankful, the sydian holds you for a few moments as you catch your breath before withdrawing. He watches you as you gather your things, seeming clearer now he’s climaxed twice, and nods at you before scarpering back into the wastes.");
	}
	//Virection
	else
	{
		output("\n\nYou crouch next to the defeated sydian, casting a long look over his heaving chest and down to his cock, wrapping a hand around it.");
		output("\n\n<i>“Nice dick.”</i> You murmur. <i>“I think I’ll take it for a ride.”</i>");
		output("\n\n<i>“Y-yesss,”</i> he hisses, thrusting into your hand, clearly desperate to feel ");
		if (x >= 0) output("[pc.oneVagina]");
		else output("your [pc.ass]");
		output(" squeezing around it. And you don’t make him wait much longer. There’s no need to lube yourself up, he’s already producing thick streams of liquid aphrodisiac");
		if (pc.wetness(x) >= 3) output(" and you’re already plenty wet yourself");
		output(", so you give him one final pump of your hand before straddling him, lining his tip up to the entrance of your" + (pc.wetness(x) >= 3 ? " wettened":"") + " [pc.vagOrAss " + x + "].");
		output("\n\nHe doesn’t hold back, thrusting up into you the moment you’re in position with a drawn out gasp. You can’t help a breathy laugh, watching his expression contort in pleasure. He must not have readjusted to the feeling of sinking himself deep into a tight");
		if (looseness > 3) output("...ish");
		output(" hole. Neither of you see any point in hesitating, and you start up a fast pace, bouncing to the rhythm that your hammering heart sets. He grabs your hips, but you refuse to let him lead - you’ve earned your right to control - and so all he can do is cling on for dear life. Perhaps you’ll have bruises later from where he’s clutching at you. Perhaps later you’ll care. Right here, right now, all you care about is the feeling of cilia stroking your sensitive insides, the thick rod stuffing your needy [pc.vagOrAss " + x + "] full. You’re both panting, gasping for breath, but it only encourages you to work harder, move faster.");
		if (x >= 0) pc.cuntChange(x, enemy.cockVolume(0));
		else pc.buttChange(enemy.cockVolume(0));
		output("\n\n<i>“Good boy,”</i> you pant, ruffling a hand through his crimson hair and laughing when one of his antennae bats at your hand. He huffs at you, perhaps feeling belittled. He stops when you clench your first and yank his head back. A thin whimper slips from his lips, but no protest joins it.");
		output("\n\nSatisfied, you use your hold to make sure he can’t break eye contact as you grind his pelvis into dust beneath you, grinning as you see his eyes cloud with lust. All the while, his cock leaks his lust, releasing fluid into you, convincing you to ride him harder, harder, still harder. It’s a relentless, merciless cycle: the faster you move your [pc.hips], the more desperate you become, but you can’t stop. You won’t stop. In fact, it doesn’t take long until your head tilts back with a scream, your [pc.vagOrAss " + x + "] clenching and spasming around the sydian’s cock.");
		if (pc.hasCock()) output(" Your own sprays [pc.cumGem] fluid across his chest");
		output("\n\n...You’re not satisfied. He still hasn’t cum inside you! You’re still not <i>full</i> like you wanted to be! There’s nothing for it but to ignore your suddenly discovered exhaustion and the tremble in your legs and just keep going, and keep going you do. Well, that is until the man beneath you seems to sense your tiredness and" + (pc.PQ() >= 66 ? ", after a brief fight,":"") + " flips the two of you over, pinning you beneath him. There’s no use struggling - he even presses his lips harshly against yours to muffle any sounds of complaint as he ruts into you, seeking his own orgasm with an almost barbaric selfishness that leaves you reeling.");
		output("\n\nYou don’t care. Fuck, you can’t <i>think</i> straight let alone care. You cling to him on reflex, legs wrapping around his waist to pull him in closer as he fucks your [pc.vagOrAss " + x + "] with every bit of strength he has until finally his head tips back with a roar of animalistic pleasure, unloading plenty of hot, thick cum into your waiting passage. It’s enough to set you off again, trembling and moaning as you orgasm alongside him.");
		output("\n\nSeemingly thankful, the sydian holds you for a few moments as you catch your breath before withdrawing. He watches you as you gather your things, seeming clearer now he’s climaxed, and nods at you before scarpering back into the wastes.");
	}
	output("\n\n");
	processTime(35);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	if (x >= 0) pc.loadInCunt(enemy,x);
	else pc.loadInAss(enemy);
	CombatManager.genericVictory();
}

//Give Mods
public function giveCboyADickHeWantsOne():void
{
	clearOutput();
	showSydianCboy();
	output("Well, maybe taking advantage isn’t the right term to use. Really, you’re just going to give him what he wants. You dig through your pack, finding just what you were after...");
	processTime(1);
	clearMenu();
	//{has both Throbb and Virection:
	if (pc.hasItemByClass(Throbb) && pc.hasItemByClass(Virection))
	{
		output("\n\nNow, do you use Virection, or take your chances with something more illegal?");
		addButton(0,"Throbb",giveSydCboyThrobb);
		addButton(1,"Virection",giveSydCboyVirection);
	}
	else if (pc.hasItemByClass(Throbb)) addButton(0,"Next",giveSydCboyThrobb);
	else addButton(0,"Next",giveSydCboyVirection);
}
//Throbb
public function giveSydCboyThrobb():void
{
	clearOutput();
	showSydianCboy(true);
	var x:int = -1;
	if (pc.hasVagina() && pc.blockedVaginas() == 0)
	{
		x = pc.findEmptyPregnancySlot(1);
		if (x < 0) x = pc.smallestVaginaIndex();
	}
	pc.destroyItemByClass(Throbb);
	output("Throbb it is. You pull the cyan-filled injector from your pack, flicking it to make sure there aren’t any air bubbles before crouching to his level and presenting it to him.");
	//{kind or misch: 
	if (!pc.isAss())
	{
		output("\n\n<i>“Do you know what Throbb is?”</i> It’s a simple question, and you’re honestly not too surprised when his eyes widen in something akin to delight and he nods. It’s probably what he was looking for, you’d guess. There’s nothing like a frontier world for the spread of illegal drugs, even amongst the natives. ");
		if (pc.isNice())
		{
			output("<i>“Sure you want this? It can be a bit rough, I’ve heard.”</i>");
			output("\n\nHe nods again, more urgently this time. ");
		}
	}
	else output("\n\n");
	output("You don’t waste time, jabbing the needle into him and depressing the plunger before he can even gasp, rocking back on your heels to watch the drug take.");
	output("\n\nHard as Throbb is on the system, it’s completely unsurprising that it acts fast. One moment you’re stroking just over the sydian’s bare mons, the next you’ve got a handful of barely formed cockflesh pushing and straining against your firm grip. It’s nothing more than a meaty, heavy pole in your hand, but he’s soon moaning and thrusting into your hand, groaning as the nerves grow in, flooding his system with pleasure.");
	output("\n\nYou know, deep down, that your guiding strokes and squeezes aren’t actually influencing the shape of his new cock, but still you pull it and shape it: long, thick, throbbing. It’s human in shape at first, hot and pulsing in your grasp as you run your fingers over the head. Your pinkie traces over his cumslit, drawing a single bead of quicksilver and you grin, scooping it up and licking it up. <i>Delicious.</i> He squirms under you, an almost embarrassed sounding insectile chitter erupting from him as he takes in your" + (pc.isNice() ? " almost":"") + " predatory gaze.");
	output("\n\nBut Throbb is not a drug that tolerates submission from its users. You’re just about to settle over him, lining his new cock up against your [pc.vagOrAss " + x + "] when he strikes. There’s a blur of motion, and you soon find yourself winded, on your back, with over seven feet of lusty alien pinning you down. Maybe it’d bother you under normal circumstances, but you knew what you were getting into the moment you picked that Throbb up for use on someone else - creating a rutting beast whose brain is fuelled and driven only by his cock. The thrust into your [pc.vagOrAssNoun " + x + "] is savage, animalistic, and it takes you a moment even after the pain-pleasure fades to notice that ohh, good, perfect - the sydian’s signature cilia have started to grow in like the rest of his cock, massaging and stroking your sensitive inner walls and smearing them with aphrodisiacs.");
	output("\n\nOn sheer instinct, your");
	if (pc.isNaga()) output(" tail wraps around his hips and abdomen");
	else if (pc.isGoo()) output(" [pc.leg] splits into two masses, reforming around his hips");
	else output("[pc.legs] wrap around his hips");
	output(", holding him tight against you");
	if (pc.hasCock()) output(", your [pc.cocks] trapped, frotting against your needy forms");
	output(". There’s nothing for it but to cling tight to the sydian as he begins thrusting into you,");
	var looseness:Number = pc.ass.looseness();
	if (x >= 0) looseness = pc.looseness(x);
	if (looseness > 3) output(" even your");
	output(" " + (x >= 0 ? "pussy":"asshole") + " managing to clamp down tight, spasming as the tendrils lining his cock stroke and stimulate your insides.");
	output("\n\nYou’re treated as little more than a sex toy for him, a simple object made for the sole purpose of taking his cock - and you fucking <i>love</i> it. Large, plated hands clasp your shoulders, ensuring you can’t make the slightest move against his wishes - despite the exhausted, submissive gestures from before. Throbb has given him quite the second wind. You knew this would happen, you must have, not that you’re complaining! It’s not long before nothing matters to you other than the feeling of his cock pounding into you, cilia exploring every inch of you.");
	if (x >= 0) pc.cuntChange(x, enemy.cockVolume(0));
	else pc.buttChange(enemy.cockVolume(0));
	output("\n\nOf course, you don’t neglect his pussy - you won, after all, it’s your right - plunging two [pc.fingers] into his wet, dripping snatch. You easily find his g-spot, engorged now as it takes the role of his cock’s base, pounding it rhythmically in time with his frantic thrusts");
	if (x >= 0) output(" against your own");
	else if (pc.hasCock()) output(" against your prostate");
	else output(" into your ass");
	output(". The sydian seems equal parts eager to thrust into your [pc.vagOrAss " + x + "] and to press his orange vagina against your digits, creating a ceaseless rhythm of desperate, powerful thrusts. He won’t last long, you realize. He’s fallen out of practice... No matter. You chase him to a shared orgasm,");
	if (x >= 0) output(" working [pc.oneClit]");
	else if (pc.hasCock()) output(" stroking [pc.oneCock]");
	else output(" pinching and pulling at your [pc.nipples]");
	output(" with your free hand.");
	output("\n\nHe howls, a bestial cry of pleasure, pouring what feels like weeks worth of backed up cum into your spasming hole, treating you as nothing but an object for him to vent his frustrations and lusts into. That won’t stand, of course. The moment he’s done and his grip slackens, you roll the both of you over. He isn’t allowed any time to go soft as chemical lust fills your brain once more, prompting you to ride him as hard as your");
	if (!pc.hasPerk("Amazonian Endurance")) output(" shaky, post-orgasm");
	output(" [pc.legOrLegs] will allow for.");
	output("\n\nFor a moment it looks like he might try and fight you, but now that the Throbb-fuelled frenzy is fading in the wake of his climax, he respects your right to do as you will with him.");
	output("\n\nYou grin. Much better.");
	output("\n\nPulling your fingers from his spasming cunt - and laughing breathily when his tail flies up instead to stuff him full not even a moment later - you turn your attention to his antennae, teasing at their feathery tips and coating your palms in slick aphrodisiac. Your hands roam over your body,");
	if (pc.hasBreasts())
	{
		output(" cupping " + (pc.totalBreasts() > 2 ? "two of ":"") + "your [pc.breasts]");
		if (pc.isLactating()) output(" and squeezing, coaxing out beads, then streams of [pc.milk] as you lather");
		else output(" and lathering");
		output(" them up. V");
	}
	else output(" v");
	output("enturing lower and lower... You skip past your crotch for now. Inner thighs, ass, lower stomach - you soak them all in chemical bliss, tugging at your ‘victim’s’ feelers whenever you need a fresh coating.");
	output("\n\nYou wait for the perfect moment as you continue your rough ride. The Sydian’s breaths come shorter, he spurts more pre into you with each downward motion, your moans grow louder, your [pc.vagOrAss " + x + "] spasms on his shaft. Then, finally, finally, you");
	if (pc.hasCock()) output(" wrap a hand around [pc.oneCock], coating it in aphrodisiac and jerking it firmly");
	else if (pc.hasVagina()) output(" move to [pc.oneClit], pinching and pulling at it as you coat it in aphrodisiac");
	else output(" flatten your palm against your bare groin, coating it in aphrodisiac");
	output(" and <i>cum</i>. You both do.");
	output("\n\nEventually, both of you begin to recover from your climaxes. Seemingly thankful, the sydian holds you for a few moments as you catch your breath before withdrawing. He watches you as you gather your things, seeming clearer now that he’s climaxed twice, and nods at you before scarpering back into the wastes.");
	output("\n\n");
	flags["SYD_CBOY_GREW_COCK"] = 1;
	processTime(35);
	pc.orgasm();
	if (x >= 0) pc.loadInCunt(enemy,x);
	else pc.loadInAss(enemy);
	CombatManager.genericVictory();
}
//Virection
public function giveSydCboyVirection():void
{
	clearOutput();
	showSydianCboy(true);
	var x:int = -1;
	if (pc.hasVagina() && pc.blockedVaginas() == 0)
	{
		x = pc.findEmptyPregnancySlot(1);
		if (x < 0) x = pc.smallestVaginaIndex();
	}
	pc.destroyItemByClass(Virection);
	output("Virection it is. You pull the pill out from your pack, unwrapping the packaging with practiced ease before crouching down to his level.");
	if (pc.isNice())
	{
		output("\n\n<i>“See this?”</i> It’s a simple question, and he nods, curious. <i>“It’ll give you a dick. Can’t promise it’ll be like your old one, and it won’t get rid of your pussy.");
		if (enemy.lust() >= enemy.lustMax()) output("”</i> You punctuate that with a gentle slide of your spare hand’s thumb over his swollen clit. <i>“");
		output("But it’ll give you one. Want it?”</i>");
		output("\n\nYou can’t tell whether he takes it because he believes you, or because he thinks you’ll just force it on him, but he takes it nonetheless.");
	}
	else if (pc.isMisch())
	{
		output("\n\n<i>“Magic offworlder dick growth pill. Want it?”</i>");
		output("\n\nHe gives you a long, searching look, as if trying to figure out whether you’re being genuine or not. You don’t have to wait too much longer, grin plastered across your face, until he gives in and stretches out a hand for the pill.");
	}
	else
	{
		output("\n\nThere’s no use in trying to reason with him, you wager. So you wait until his mouth opens to ask just what the hell (or the Tarkus equivalent) you’re doing before you pop it in and hold your hand clamped over his maw and nostrils until he’s forced to swallow.");
	}
	output("\n\nWhilst not instant, the changes don’t take long to manifest. Your hand is already resting right over where the bulge of new cockflesh starts to grow, and you see the sydian’s eyes roll and chest heave as it begins. His hips are soon bucking into your hands as inch by inch of sensitive flesh unfurls itself into your waiting palm and clever fingers. It’s featureless at first, a pillar of sturdy, throbbing meat, but as you stroke it up and down and back up again, it begins to form slight nodules. Beaming, you tease along each one in turn, coaxing them up into the sydian’s signature cilia until you have a properly thick orange toy to play with.");
	output("\n\nHe just stares for a moment as you pull your hand back; in complete awe of how quickly, how easily he is returned to at least a fraction of his former self. Your grin widens and you return your hand.");
	if (pc.isNice()) output(" <i>“That feel better for you?”</i> You ask, beginning an almost teasingly light handjob.");
	else if (pc.isMisch()) output(" <i>“See? Dick growth pill.”</i> You quip, teasing him with a light handjob.");
	else output(" <i>“You ought to thank me.”</i> You grumble. <i>“Attacking me, but still getting what you want? Such a bad boy.”</i> You ghost your hand over his cock.");
	output(" <i>“I think I’ll take it for a ride.”</i>");
	output("\n\n<i>“Y-yesss,”</i> he hisses, thrusting into your hand, clearly desperate to feel");
	if (x >= 0) output(" [pc.oneVagina]");
	else output(" your [pc.ass]");
	output(" squeezing around it. And you don’t make him wait much longer. There’s no need to lube yourself up, he’s already producing thick streams of liquid aphrodisiac");
	if (pc.wetness(x) >= 3) output(" and you’re already plenty wet yourself");
	output(", so you give him one final pump of your hand before straddling him, lining his tip up to the entrance of your" + (pc.wetness(x) >= 3 ? " wettened":"") + " [pc.vagOrAss " + x + "].");
	output("\n\nHe doesn’t hold back, thrusting up into you the moment you’re in position with a drawn-out gasp. You can’t help a breathy laugh, watching his expression contort in pleasure. It must feel like an eternity since he last got to sink himself deep into a tight");
	var looseness:Number = pc.ass.looseness();
	if (x >= 0) looseness = pc.looseness(x);
	if (looseness > 3) output("...ish");
	output(" hole. Neither of you see any point in hesitating, and you start up a fast pace, bouncing to the rhythm that your hammering heart sets. He grabs your hips, but you refuse to let him lead - you’ve earned your right to control - and so all he can do is cling on for dear life. Perhaps you’ll have bruises later from where he’s clutching at you. Perhaps later you’ll care. Right here, right now, all you care about is the feeling of cilia stroking your sensitive insides, the thick rod stuffing your needy [pc.vagOrAss " + x + "] full. You’re both panting, gasping for breath, but it only encourages you to work harder, move faster.");
	if (x >= 0) pc.cuntChange(x, enemy.cockVolume(0));
	else pc.buttChange(enemy.cockVolume(0));
	output("\n\n<i>“Good boy,”</i> you pant, ruffling a hand through his crimson hair and laughing when one of his antennae bats at your hand. He huffs at you, perhaps feeling belittled. He stops when you clench your first and yank his head back. A thin whimper slips from his lips, but no protest joins it.");
	output("\n\nSatisfied, you use your hold to make sure he can’t break eye contact while you grind his pelvis into dust beneath you, grinning as you see his eyes cloud with lust. All the while, his cock leaks his lust, releasing fluid into you, convincing you to ride him harder, harder, still harder. It’s a relentless, merciless cycle: the faster you move your [pc.hips], the more desperate you become, but you can’t stop. You won’t stop. In fact, it doesn’t take long until your head tilts back with a scream, your [pc.vagOrAss " + x + "] clenching and spasming around the sydian’s cock.");
	if (pc.hasCock()) output(" Your own sprays [pc.cumGem] fluid across his chest.");
	output("\n\n...You’re not satisfied. He still hasn’t cum inside you! You’re still not <i>full</i> like you wanted to be! There’s nothing for it but to ignore your suddenly discovered exhaustion and the tremble in your legs and just keep going, and keep going you do. Well, that is until the man beneath you seems to sense your tiredness and" + (pc.PQ() >= 66 ? ", after a brief fight,":"") + " flips the two of you over, pinning you beneath him. There’s no use struggling - he even presses his lips harshly against yours to muffle any sounds of complaint as he ruts into you, seeking his own orgasm with an almost barbaric selfishness that leaves you reeling.");
	output("\n\nYou don’t care. Fuck, you can’t <i>think</i> straight let alone care. You cling to him on reflex, [pc.legs] wrapping around his waist to pull him in closer as he fucks your [pc.vagOrAss " + x + "] with every bit of strength he has until finally his head tips back with a roar of animalistic pleasure, unloading plenty of hot, thick cum into your waiting passage. It’s enough to set you off again, trembling and moaning as you orgasm alongside him.");
	output("\n\nSeemingly thankful, the sydian holds you for a few moments as you catch your breath before withdrawing. He watches you as you gather your things, seeming clearer now that he’s climaxed, and nods at you before scarpering back into the wastes.");
	output("\n\n");
	flags["SYD_CBOY_GREW_COCK"] = 1;
	processTime(35);
	pc.orgasm();
	if (x >= 0) pc.loadInCunt(enemy,x);
	else pc.loadInAss(enemy);
	CombatManager.genericVictory();
}
//Fuck His Puss
public function fuckSydCboyPussy(x:int):void
{
	clearOutput();
	showSydianCboy(true);
	output("<i>“On your back.”</i> You order, not wanting to waste any time. He’s certainly wet enough to go at it without much foreplay and you’re getting pretty damn hard yourself.");
	output("\n\nHe obeys,");
	if (flags["FUCKED_SYDIAN_CBOY_PUSSY"] == undefined) output(" clearly aware that your victory gives you the right to do as you please with him");
	else output(" knowing already what you intend to do, and no longer really minding");
	output(". Satisfied with his obedience, you carefully");
	if (!pc.isNude()) output(" strip out of your own gear and");
	output(" drop your [pc.weapon], moving to kneel between his spread thighs, hands holding tight around their insides to keep them apart.");
	if (pc.hasCockFlag(GLOBAL.FLAG_PREHENSILE, x)) output(" Your [pc.cock " + x + "] easily seeks out his entrance");
	else output(" You spend a moment lining your [pc.cock " + x + "] up against his entrance");
	output(" before you push in with a slight moan of pleasure. He’s soaked" + (flags["FUCKED_SYDIAN_CBOY_PUSSY"] != undefined ? " as usual":"") + ", already drooling from both ends at the feeling of penetration, and so you don’t bother waiting for any adjustment.");
	pc.cockChange();
	if (flags["FUCKED_SYDIAN_CBOY_PUSSY"] != undefined) output("\n\nAlmost as soon as you start thrusting, his legs shift to wrap around your waist, following the training from before.");
	else output("\n\nYou shift your hands further down his legs as you start thrusting, using a grip on his calves to force him to wrap his legs around your waist. <i>“Keep those there,”</i> you order. <i>“Behave for me.”</i>");
	output("\n\nYour pace doesn’t leave room for " + (flags["FUCKED_SYDIAN_CBOY_PUSSY"] == undefined ? "much more":"") + " conversation, hard enough that any pauses are used to gasp for breath or for your partner to cry out - he’s so sensitive that he’s cumming already");
	if (enemy.hasCock()) output(", painting his chest in cum");
	output(". Still though, you think you could probably tease him" + (flags["FUCKED_SYDIAN_CBOY_PUSSY"] != undefined ? " again":"") + "... Leaning in close, you speak as directly into his ear as you can manage. <i>“I could leave you full of offworlder offspring.”</i>");
	if (pc.fertility() <= 0) output(" It’s an empty threat of course, but you don’t intend to pull out: he won’t know.");
	else output(" You don’t have any intentions of pulling out so it’s a very real threat.");
	output(" <i>“I know your ‘brothers’ out here have likely been knocking up rushers left, right and centre");
	//{pc is/has had sydian preg:
	if (pc.hasPregnancyOfType("SydianPregnancy") || StatTracking.getStat("pregnancy/sydian births") > 0) output(", myself included");
	output(".");
	//{done [Talk]:
	if (flags["SYDIAN_CBOY_TALK"] != undefined) output(" If you attacking me is in revenge for losing your dick...");
	output("”</i> You pause a moment, adjusting your angle to something that makes him moan a little louder, pussy squirt a little more femcum. <i>“");
	//{done [Talk]:
	if (flags["SYDIAN_CBOY_TALK"] != undefined) output("Then this is mine");
	else output("This is my revenge for that");
	output(".”</i>");
	output("\n\nHis expression is as hard to read" + (flags["FUCKED_SYDIAN_CBOY_PUSSY"] != undefined ? " as always":"") + ", but he doesn’t do anything to stop you from doing as you like - legs even locking around you a little tighter. You respond in turn, increasing both the speed of your thrusts and the intensity of your remarks. Perhaps he’d enjoy being filled with your spawn? Isn’t it something he’d want? You beat him, after all, perhaps any offspring the two of you would produce would be the kind of strong ones you’ve known females of his race to beg to be seeded with.");
	//1st time
	if (flags["FUCKED_SYDIAN_CBOY_PUSSY"] == undefined)
	{
		output("\n\nWhilst he’s surely unused to this style of domination, the sydian soon buckles under the force of your will.");
		output("\n\n<i>“Y-yes, please, fill me, seed me, I-I should be treated as I would treat those weaker than me, b-before-!”</i>");
	}
	//Repeat
	else
	{
		output("\n\nWell used to this style of domination, the sydian’s willpower quickly fades beneath your efforts. Soon enough, he’s responding in kind to your teasing, offering up his own pleas with no thought given to the fact that any number of the other locals could come across the two of you and hear the wanton moans of the claimed warrior.");
		output("\n\n<i>“Please! Please, use me as your own, take me, fill me full of your young-!”</i>");
	}
	output(" He’s cut off only by the less coherent noises he makes. His moans and ramblings only grow louder, more desperate, especially when you shift one of your hands away from his thigh to");
	if (!enemy.hasCock())
	{
		output(" pinch and tug at his swollen, enlarged clit. He’s earned it, after all. You treat it almost like you would a small cock,");
		if (!pc.isNice())
		{
			output(" occasional");
			if (pc.isMisch()) output(" half-");
			output("insults at the size included,");
		}
		output(" taking it between thumb and forefinger and jerking it in short, firm strokes. Your partner seems to appreciate the effort, twitching his hips both into your hand and onto your cock, crying out louder whenever you give him that little extra bit of pressure.");
	}
	else output("stroke and tug at his throbbing cock, jerking it in short, firm strokes. Your partner seems to appreciate the effort, twitching his hips both into your hand and onto your own dick, crying out louder whenever you give him that little extra bit of pressure.");
	output("\n\nHmm. His submission is good but... Not quite enough. You pull back, then out - slapping his ass when he whimpers in disappointment");
	if (pc.physique() <= 20) output(" (and promptly trying to muffle a whimper of your own, smacking something that’s essentially armor-plated wasn’t your best idea to date)");
	output(".");
	output("\n\n<i>“Hands and knees. If you want to be bred, take it like a proper breeding bitch.”</i> Your order is firm, and he doesn’t argue," + (flags["FUCKED_SYDIAN_CBOY_PUSSY"] != undefined ? " eagerly":"") + " following it. <i>“Good.”</i>");
	output("\n\nTaking hold of his tail, you");
	if (pc.isAss()) output(" yank");
	else if (pc.isMisch()) output(" pull");
	else output(" lightly tug");
	output(" at it until he gets the hint to raise his hips higher, pressing his chest into the ground beneath you. His pussy winks, soaked and inviting, and you don’t waste a moment longer, slamming your [pc.cock " + x + "] back into him. He howls in pure, animalistic pleasure, pushing back onto your thrust as best as he’s able.");
	output("\n\nYou give him what you both want: an almost brutally hard pounding that’s going to leave both of you with bruising hips - not that you care right now, your mind is blank of anything but white-hot pleasure. It doesn’t take long for your partner to cum, screaming and thrashing beneath you");
	if (enemy.hasCock()) output(" as he sprays another load onto the ground")
	output(", his cunt clenching and relaxing spastically around your [pc.cockNoun " + x + "], trying to milk it for every drop of [pc.cum] you can give.");
	output("\n\nEvery muscle in your body strains as you try to continue, to hold back your orgasm, to spend just one single moment more with this pleasure coursing through you, but all good things must end. You cry out, pushing yourself in up to the hilt");
	if (pc.hasKnot(x)) output(", knot and all");
	output(", and cum, unloading so hard that you feel like you could be dry for days.");
	output("\n\nAfter");
	if (pc.hasKnot(x)) output(" more than a");
	output(" little while, you finally pull out, gathering your belongings and patting the insensate sydian on the head as you leave him, getting back to your journey.");
	output("\n\n");
	IncrementFlag("FUCKED_SYDIAN_CBOY_PUSSY");
	processTime(30);
	pc.orgasm();
	enemy.loadInCunt(pc,0);	
	CombatManager.genericVictory();
}
//Spank
public function spankSydCboyCuzYouAnAsshole():void
{
	clearOutput();
	showSydianCboy(true);
	output("You’re not satisfied with just beating him into submission. He needs to learn a valuable lesson in exactly why he shouldn’t just attack people out of the blue.");
	output("\n\nYou sit beside him and grab him" + (pc.isAss() ? " roughly":"") + " by the scruff of the armor-plated neck, dragging him over your lap and humming as you consider his form. A run of your hand over his firm ass confirms that it’s as armored as the rest of him, but his tail twitching to try and knock away your offending appendage confirms that he very much can feel what you’re doing. Of course, you can’t have his tail getting in the way, so you grab it with the other hand before spanking him <i>hard</i> with the first.");
	output("\n\nHe screams, far more high pitched and feminine than what you were expecting, and you can’t help but laugh. The reaction doesn’t garner him any sympathy though. You just wait for the noise to peter out before delivering another harsh blow.");
	output("\n\nIt’s even better the second time. You make sure to strike the same spot, savouring the shriek and squirm, and end up laughing harder as you see him squirt just a little ‘fem’cum, pussy twitching" + (enemy.hasCock() ? " and cock leaking pre":"") + ". Perfect. There’s no recovery time allowed after that, you rain down smack after smack, regretting only the fact that you can’t see the bruises that you’re doubtless leaving on him.");
	output("\n\nWithin a few minutes, he’s cumming hard, shaking and screaming under your touch. You grin, stroking over his ass once more before standing carelessly, letting him clatter to the ground unceremoniously before walking off. Hopefully, he’ll think twice about attacking you again - even if it’s just until his ass stops aching.");
	output("\n\n");
	processTime(10);
	pc.addHard(3);
 	pc.createStatusEffect("Syd Cboy Cooldown", 0, 0, 0, 0, true, "", "", false, 24*60);
	CombatManager.genericVictory();
	//[Next]{return to map}{add a few points toward Hard}{Add 24hr cooldown before he can be encountered again}
}
//Talk
public function talkToSydCboyAboutFeewings():void
{
	clearOutput();
	showSydianCboy();
	output("Now that you’ve beaten the fight out of your attacker one way or another, you let your weapons fall to your sides, half-kneeling before him.");
	output("\n\nHe tilts his head to the side, insectile face contorting in an expression that you just about parse as the equivalent of a curious lift of the eyebrow. Evidently, the alien isn’t used to such inaction.");
	if (pc.isSexless()) output(" You can’t help laughing a little - you don’t even have anything to fuck him with - before sighing");
	else output(" Any lusts you’ve picked up recently can wait");
	output(". <i>“Can’t help but notice that someone’s gone and done a little part swapping on you there.”</i>  It’s not really a question, and he doesn’t really give you an answer past an irritated swish of his tail and a noncommittal shrug.");
	output("\n\nStill, you persist. <i>“Oi, Terra to... Hmm, no, Tarkus to");
	if (pc.isNice()) output(" Sydian");
	else output(" rust monster");
	output(".”</i>");
	var lustWin:Boolean = enemy.lust() >= enemy.lustMax();
	output("\n\n<i>“Do you have nothing better to do?”</i> He grumbles, voice slow like he’s struggling to remember his words. <i>“Or do you just enjoy");
	if (lustWin) output(" teasing people into submission");
	else output(" beating people into submission");
	output(" so that you can have a captive audience?”</i>");
	if (pc.isMisch() && lustWin) output("\n\nOh, come on! It’s like pillow talk! Just... Without the sex.");
	else output("\n\nYou just shrug: you’ve seen stranger.");
	output("\n\n<i>“You offworlders always amaze, always something strange after another.”</i>");
	output("\n\nEven holding a conversation this long seems to be an effort for him, you realize, his phrasing seeming off, longer pauses between words. Clearly, the mods he’s had pushed on him affected more than just his body. You urge him to talk, offering up");
	if (pc.isNice()) output(" genuine");
	else if (pc.isMisch()) output(" half-true");
	else if (pc.isAss()) output(" nothing");
	output("platitudes of helping, if you can.");
	output("\n\nFinally, he grunts, probably too tired to listen to you continually yammering on. <i>“One of your terran ‘months’ ago, my harem was approached by a group of offworlders - both ausar and kaithrit.”</i> He butchers the pronunciation, and you can’t help a quiet laugh. <i>“...They said a lot of things I didn’t understand, but I got the gist, I thought easier then. They said... Things that made me think that they meant well, they promised that they needed my help finding a way to... Integrate? Yes, integrate us Sydians.”</i>");
	output("\n\nIt sounds like he’s talking about an uplift. You certainly don’t recall even hearing the slightest murmurings about one happening");
	if (flags["SHEKKA_ISSUES"] >= 7) output(", void, it was taxing enough getting the resources together for the Raskvel");
	output(", so you can only imagine he was lied to.");
	output("\n\nHe shrugs. <i>“Of course. They took me onto their starship to... ‘Run some tests’... And then I woke up days later with this.”</i> A gesture to his still leaking cunt distracts you momentarily.");
	output("\n\nClassic alien abduction. How did he get out?");
	output("\n\n<i>“She - maybe he, I couldn’t tell - freaked out. I wasn’t supposed to wake up.”</i> An almost amused tone creeps into his voice. <i>“Well, I got out of my restraints... Grabbed some needle from one of the other worktables... And found out what it was for, because the cat-boy became a cat-girl in a real hurry when I pricked him with it. After that...? I got lucky. We were still on Tarkus, and I could take the guards that tried to stop me.”</i>");
	output("\n\nHe makes a strange, chittering noise, a hand ghosting over some scorch marks and dents in his plating. You can’t help but wonder what happened after that.");
	output("\n\n<i>“There’s no point returning to my harem.”</i> He sighs, solid black eyes somehow appearing distant. <i>“Not like this. I’ve been jumping offworlders for something to... Put me back to normal.”</i>");
	output("\n\nAnd that’s where you come in, right?");
	output("\n\nHe nods. Right.");
	output("\n\nThere’s nothing more for the two of you to discuss, in which case. You make sure your equipment is in order before taking your leave of him.");
	output("\n\n");
	flags["TALKED_TO_SYDIAN_CBOY"] = 1;
	processTime(15);
	CombatManager.genericVictory();
}
//Leave
public function leaveSydCboyBehind():void
{
	clearOutput();
	showSydianCboy();
	output("You shake your head, clearing it of any carnal thoughts");
	if (pc.isTreated() || pc.taint() >= 66 || pc.libido() >= 66) output(" - or at least those in excess to your usual");
	output(". One way or another, you’re just not in the mood to take advantage.");
	output("\n\nIt’s not long before you’ve taken your leave of the unfortunate sydian altogether, returning to... Whatever it was you were doing.");
	output("\n\n");
	processTime(1);
	CombatManager.genericVictory();
}
//PC LOSS
public function sydianCboyLossRouter():void
{
	if (!enemy.hasCock()) sydianCboyLoss();
	else sydianMhermLoss();
}
public function sydianCboyLoss():void
{
	showSydianCboy();
	//HP Loss Text
	if (pc.HP() <= 0) output("Your [pc.weapons] clatter to the ground as you sink to your knees, unable to keep fighting.");
	//Lust Loss Text
	else output("You fall to your knees, hands grabbing at and discarding your equipment. Why keep fighting? You want everything the Sydian cuntboy has to offer.");
	//Merge
	output("\n\nHe steps right over your" + (pc.HP() <= 0 ? " battered":" blushing") + " form rather than diving into the sexual acts you’re expecting. The crouch he drops into very much angles his tight, soaked pussy into delightfully close range as he rifles through your equipment, clearly looking for something.");
	output("\n\nYou don’t have time to ask what he’s doing though, as he soon");
	//If PC has both Throbb and Virection, default to Throbb
	if (pc.hasItemByClass(Throbb))
	{
		output(" comes up with a medipen of something cyan and... Oh no.");
		output("\n\n<i>“Offworlder text is hard, but this is Throbb, yes? I heard about this one, I think. This’ll... Fix me,”</i> comes a gravelly, almost thoughtful tone that doesn’t last long before he jabs himself purposefully. Barely a moment passes before his plush mons seems to swell even larger and brand new cockflesh springs forth.");
		output("\n\nHe’s on you before his new dick even finishes forming...");
	}
	else if (pc.hasItemByClass(Virection))
	{
		output(" emerges with a small blue pill that looks an awful lot like-");
		output("\n\n<i>“Veerection. Vyrection? Virection.”</i>");
		output("\n\nYou nod weakly at the gravelly voice’s third attempt to sound out the unfamiliar text of the brand name, confirming that yes, it’ll give him a dick but-");
		output("\n\nOh.");
		output("\n\nWell, you were going to finish that with an <i>“it’s mine and it was expensive”</i>, but he’s already downed it. He’s on you in an instant, before the new dick starting to swell out from above his swollen puss even finishes forming...");
	}
	else
	{
		output(" lets out a frustrated scream, standing up again to kick at your equipment before he rounds on you, glowering.");
		output("\n\n<i>“Ffffuck it. Fucking offworlders, think you’re soooo great because you’re oh so ‘developed’ and thinking you can just barge in and alter people how you see fit! Ohhh if I had the chance I’d... Ugh. Fuck it. You’ll do to service me, you’re clearly not interested in my life story.”</i>");
		output("\n\nThick fingers");
		if (pc.hasLongEars()) output(" tug on your ears");
		else if (pc.hasHair()) output(" wrap through your hair");
		else output(" grip the back of your head");
		output(", tugging you into his sweltering cunt...");
	}
	processTime(3);
	pc.changeLust(25);
	//[Next]
	clearMenu();
	if (pc.hasItemByClass(Throbb)) addButton(0,"Next",loseToSydCboyThrobb,true);
	else if (pc.hasItemByClass(Virection)) addButton(0,"Next",loseToSydCboyVirection,true);
	else addButton(0,"Next",loseToSydCboyNoMods);
}
public function sydianMhermLoss():void
{
	showSydianCboy(true);
	//HP Loss Text
	if (pc.HP() <= 0) output("Your [pc.weapons] clatter to the ground as you sink to your knees, unable to keep fighting.");
	//Lust Loss Text
	else output("You fall to your knees, hands grabbing at and discarding your equipment. Why keep fighting? You want everything the Sydian maleherm has to offer.");
	//Merge
	output("\n\nHe grins, patting your head lightly before pushing you onto your back. Your legs spread on instinct as you look up at the hardness between his thighs, then are pushed wider as he gets in position.");
	output("\n\n<i>“I’m not done with you, offworlder.”</i>\n\n");
	//{play throbb or virection scene at random}
	if (rand(2) == 0) loseToSydCboyThrobb();
	else loseToSydCboyVirection();
}
//Throbb Scene
public function loseToSydCboyThrobb(noCock:Boolean = false):void
{
	//noCock var for if this scene is playing where he's still growing his cock
	if (noCock)
	{
		clearOutput();
		pc.destroyItemByClass(Throbb);
	}
	showSydianCboy(true);
	var x:int = -1;
	if (pc.hasVagina() && pc.blockedVaginas() == 0)
	{
		x = pc.findEmptyPregnancySlot(1);
		if (x < 0) x = pc.smallestVaginaIndex();
	}
	output("He doesn’t spend any time waiting, pressing " + (noCock ? "the newly forming":"his") + " cockhead against the entrance to your [pc.vagOrAss " + x + "] and thrusting in with little warning. You cry out, pained at first by its suddenness, but " + (noCock ? "growing":"his") + " cilia press into your walls, massaging them and painting them in more and more of that lust-bringing fluid he produces.");
	output("\n\nHe ruts into you, each thrust deeper than the last as his cock just keeps growing. Eventually, it settles at around eight inches.");
	//Since cock isn't actually grown yet, temporary cock volume
	if (noCock)
	{
		if (x >= 0) pc.cuntChange(x, 25);
		else pc.buttChange(25);
	}
	else
	{
		if (x >= 0) pc.cuntChange(x, enemy.cockVolume(0));
		else pc.buttChange(enemy.cockVolume(0));
	}
	output("\n\nThere’s very little focus on anything but the Sydian’s own pleasure,");
	if (noCock) output(" yours less than secondary to everything that’s going on as the Throbb’s payload of taint doubtlessly sinks its hooks into his brain, encouraging it towards the pursuit of nothing but thicker, headier cumshots and <i>oh</i>-");
	else output(" yourself secondary to everything that’s going on and <i>oh</i>-");
	output("\n\nThick fingers");
	if (pc.hasCock()) output(" wrap around [pc.oneCock], stroking it");
	else if (pc.hasVagina()) output(" play over [pc.oneClit], circling and pinching it lightly");
	else output(" splay across your featureless groin");
	output(". It looks like it was nothing but instinct though, his eyes glazed and hazy with concentrated lust.");
	output("\n\nThere’s something incredibly arousing about it, aside from the aphrodisiac leaking into your wanton hole, being used like this. You’re a <i>toy</i> to him. Your purpose is fucking - no - being fucked, and taking it like a good [pc.boyGirl].");
	output("\n\n<i>Void</i> does the realisation make you cum, and cum hard. You’d be embarrassed about how");
	
	//both:
	if (pc.isHerm())
	{
		output(" your [pc.cocks] throb" + (pc.hasCocks() ? "":"s") + " and ");
		if (pc.cumQ() < 50) output("fleck");
		else if (pc.cumQ() < 500) output("splatter");
		else output("paint");
		if (!pc.hasCocks()) output("s");
		output(" you both with your [pc.cum] as your [pc.vaginas]");
		if (pc.hasVaginas()) output(" tremble and twitch, clenching down in unison, even if only one of them is");
		else output(" trembles and twitches, clenching");
		output(" around his his cock, " + (pc.isSquirter() ? "spraying":"leaking") + " [pc.girlCum] everywhere.");
	}

	//{cock(s) only:
	else if (pc.hasCock())
	{
		output(" your [pc.cocks] throb" + (pc.hasCocks() ? "":"s") + " and ");
		if (pc.cumQ() < 50) output("fleck");
		else if (pc.cumQ() < 500) output("splatter");
		else output("paint");
		if (!pc.hasCocks()) output("s");
		output(" you both with your [pc.cum]");
	}
	//vag{s} only:
	else if (pc.hasVagina())
	{
		if (pc.hasVaginas()) output(" tremble and twitch, clenching down in unison, even if only one of them is");
		else output(" trembles and twitches, clenching");
		output(" around his his cock, " + (pc.isSquirter() ? "spraying":"leaking") + " [pc.girlCum] everywhere.");	
	}
	//neither:
	else output(" your legs thrash as sparks of orgasmic bliss center around your featureless mound");
	output(" if you weren’t too drugged up from the thick rod spearing into your [pc.vagOrAss " + x + "].");
	output("\n\nHe doesn’t seem to care about your orgasm, and neither does he seem close to his own. <i>“Sensitive,”</i> he murmurs, pressing closer into you,");
	if (!pc.hasBreasts()) output(" muscular, flat chest firm against your own");
	else output(" the muscles of his otherwise flat chest pushing firm against your [pc.breasts]");
	output(". He seems to struggle with the word - speech in general - far more than he did before, taint coursing through his skull and replacing everything it finds with the desire to fuck.");
	output("\n\nIn fact, you wonder if he’s noticed...");
	output("\n\nThrowing caution to the wind, you reach back one-handed, stroking down his narrow hips and tight asscheeks until you find the spot between his legs, stroking over the still extant, soaked pussy you find. He nearly yelps in surprise, thick tail flicking to upright in a matter of moments, before his focus settles again and he looks down at you with a dark look in his eyes.");
	output("\n\n<i>“Don’t remember,”</i> he starts, huffing with effort as he picks up the pace to something even your wildest attempts to push back can’t match. <i>“Don’t remember telling you to touch.”</i>");
	output("\n\nYou whimper and relent, pulling your hand back only for him to wrap his tail around your wrist. When you manage to make a confused sound through your desperate pants and moans, he shrugs. <i>“Don’t remember telling you to stop either.”</i>");
	output("\n\nMaybe he’ll be pissed off about still having the pussy later, but right now he’s hot and wet and dripping, and it feels <i>good</i> to roughly finger fuck him at the same pace that’s he’s going to town on your [pc.vagOrAss " + x + "] at. He subconsciously rewards you with a particularly hard thrust against your");
	if (x >= 0) output(" g-spot");
	else if (pc.hasCock()) output(" prostate");
	else output(" inner walls");
	output(" whenever you flick your thumb over his clit.");
	output("\n\nYou cum again when he does, thrusting deep inside you with a low groan, brush-like cilia working on absolute overdrive to push the all-too-copious amounts of thick, doubtlessly virile spunk deeper and deeper still into you in an attempt to flood you");
	if (x >= 0) output("r" + (pc.isPregnant(x) ? " already pregnant":"") + " womb");
	else output(" full");
	if ((x < 0) || pc.isPregnant(x) || pc.fertility() <= 0) output(" With no minds of their own, of course, they can’t know the effort is a wasted one.");
	output("\n\nHe doesn’t stop after pulling out though, tail releasing your hand as he rearranges you - face down, ass upraised. Fingers play over your [pc.vagOrAss " + x + "] for a scant few moments before pushing in, fingering you roughly. The Sydian chuckles when you squeal, waves of unnatural pleasure rolling over you once again, withdrawing his thick digits and replacing them with his feathered tail - swiping it and its heady aphrodisiac payload over your entrance.");
	output("\n\nYou don’t even have time to react past a submissive mewl before he’s inside you again, using the position to pound deeper into you than he ever did before.");
	output("\n\nThere’s nothing for it but to scream and plead and moan as he loses himself in you. The tip of his tail continues to run all over your body, painting everything from digits and collarbones to inner thighs and");
	if (pc.hasCock()) output(" the head of your cock");
	else if (pc..hasVagina()) output(" your [pc.clits]");
	else output(" bare groin");
	output(" with fluid.");
	output("\n\nThinking is impossible. Sure, it was hard before, but now that you’re still riding the coattails of your second orgasm, slathered in ever increasing amounts of lust inducing secretions... Void, it feels like you could cum your own brains out.");
	output("\n\nPerhaps you will, given enough of this. Firm hands on your hips, muscled and plated chest against your back. The only thing missing from this is a heavy set of nuts to slap against you on the inwards thrusts... Or at least, you think that at first. Over time, it starts to feel more like a feature than an unfortunate oversight in the drug. No balls getting in the way allows you to take that tiny yet oh so important extra fraction of an inch more cock, lets his own pussy juices flow freely down his length");
	if (pc.hasVagina())
	{
		output(", creating a sinful mix of ");
		if (pc.isManHerm() || pc.isCuntboy()) output(" ‘feminine’");
		else output(" feminine");
		output(" fluid that mixes");
	}
	else output(", mixing");
	output(" with his pre as he finally draws close to his second peak.");
	output("\n\nYou cum together, him letting out an almost monstrous roar as he explodes inside you, your own orgasm seeming almost weak and submissive in comparison, exhausted as you are from your previous ones.");
	output("\n\nYour eyes roll back in your head all the same, passing out from exhaustion.");
	output("\n\nBy the time you’ve recovered and come to your senses, the Sydian is long gone. Seems he’s at least");
	if (!pc.isNude()) output(" folded your clothes and");
	output(" left your equipment where you can reach it easily.");
	output("\n\n");
	flags["SYD_CBOY_GREW_COCK"] = 1;
	processTime(45);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	//[Next] {Load in vagina or ass as applicable}{chance for generic sydian preg if vag}
	if (x >= 0) pc.loadInCunt(enemy,x);
	else pc.loadInAss(enemy);
	CombatManager.genericLoss();
}
//Virection Scene
public function loseToSydCboyVirection(noCock:Boolean = false):void
{
	//noCock var for if this scene is playing where he's still growing his cock
	if (noCock)
	{
		clearOutput();
		pc.destroyItemByClass(Virection);
	}
	showSydianCboy(true);
	var x:int = -1;
	if (pc.hasVagina() && pc.blockedVaginas() == 0)
	{
		x = pc.findEmptyPregnancySlot(1);
		if (x < 0) x = pc.smallestVaginaIndex();
	}
	output("Rather than press " + (noCock ? "the newly forming":"his") + " cock right into you, he pulls you into a reverse cowgirl position with your wrists clamped firmly in one of his large hands.");
	if (noCock) output("\n\n<i>“I should thank you, really.”</i> He grumbles, as his other arm wraps around your waist, adjusting your position so that the entrance to your [pc.vagOrAss " + x + "] slicks against his cock’s head. <i>“But I had to beat it out of you, and it hasn’t done everything I wanted. So I won’t.”</i>");
	else output("\n\n<i>“I should thank you, really, for getting me back to myself”</i> He grumbles, as his other arm wraps around your waist, adjusting your position so that the entrance to your [pc.vagOrAss " + x + "] slicks against his cock’s head. <i>“But it hasn’t done everything I wanted. So I won’t.”</i>");
	output("\n\nWith that, he sits you down, sinking himself up to the hilt. Not quite ready, you cry out, but any pain that you felt soon melts into pleasure, the Sydian’s trademark cilia");
	if (noCock) output("forming as he begins thrusting up into you, smearing your inner walls with natural aphrodisiac.");
	else output("smearing your inner walls with natural aphrodisiac as he begins thrusting up into you.");
	//Since cock isn't actually grown yet, temporary cock volume
	if (noCock)
	{
		if (x >= 0) pc.cuntChange(x, 25);
		else pc.buttChange(25);
	}
	else
	{
		if (x >= 0) pc.cuntChange(x, enemy.cockVolume(0));
		else pc.buttChange(enemy.cockVolume(0));
	}
	output("\n\nIt’s more than enough to spur you on, bracing your [pc.legOrLegs] under you better so that you can move, riding him. You’re slow at first, but the amount of liquid lust being pushed into your needy hole demands you use its slickness to bounce on his still growing cock harder, faster.");
	output("\n\nHe grunts, releasing your wrists once he’s content in the fact that you’ll do your job without protesting, both of his hands falling to your [pc.hips] to steady you a little but mostly being used as leverage for his own upwards thrusts.");
	output("\n\nOne of your own hands falls to the ground in front of you as you lean forwards, gasping as the position presses his tip against your");
	//vag:
	if (x >= 0) output(" g-spot");
	//{ass & cock:
	else if (pc.hasCock()) output(" prostate");
	//ass & no cock:
	else output(" sensitive depths");
	output(", the other finding");
	//{pc has cock{s}:
	if (pc.hasCock()) output(" [pc.oneCock] and stroking it firmly in time with your desperate pace");
	//vagina{s} only:
	else if (pc.hasVagina()) output(" [pc.oneClit], rubbing and pinching at it lightly in time with your desperate pace");
	//else:
	else output(" your bare groin, running your hand over it for a moment before reaching up to tug at a [pc.nipple] in time with your desperate pace}.");
	output("\n\nIt’s not even a question of want. You <i>need</i> to keep going, you <i>need</i> to keep bouncing on this thick cock. Perhaps it’s a side effect of the drugs he’s been pumped full of, perhaps he already <i>was</i> so much stronger than the other sydians you’ve come across, but there’s no hiding it - void, you could probably class the fluid he leaks as a neurotoxin. It clouds your senses, floods your vision with sunset tinged lust.");
	output("\n\nYou think of nothing but your shared pleasure.");
	output("\n\nDragging yourself back up and off his length is near torturous, knowing that you’re (temporarily though it may be) being deprived of your <i>reward</i>. Wait, what?");
	output("\n\nThe errant thought slips away as soon as it came when you reach his tip once more, pressing back down again with a movement of your hips so fast, so energetically needy that it’d probably hurt if not for another spurt of pre into your [pc.vagOrAss " + x + "] and another motion of deft cilia against your");
	//{vag:
	if (x >= 0) output(" clit");
	//ass, PC has cock:
	else if (pc.hasCock()) output(" prostate");
	//else:
	else output(" insides");
	output(".");

	output("\n\nYou cum.");
	output("\n\n");
	//{Neuter: 
	if (pc.isSexless()) output("It’s not a messy affair, of course. Your anal passage twitches, spasms, contracts, heat rushing across your bare crotch as you experience the orgasm of a true buttslut.");
	//Both:
	if (pc.isHerm())
	{
		if (pc.cumQ() + pc.girlCumQ() < 250) output("Trickles");
		else if (pc.cumQ() + pc.girlCumQ() < 2000) output("Floods");
		else output("Explosions");
		output(" of mixed fluids paint your chest and the ground beneath you," + (pc.hasVaginas() ? " each of your vaginas":" your vagina") + " spasming as your" + (pc.hasCocks() ? " dicks twitch":" dick twitches") + " in time with the thrusts into your [pc.vagOrAss " + x + "].");	
	}
	//Vags only: 
	else if (pc.hasVagina())
	{
		output("A");
		if (pc.girlCumQ() < 250) output(" trickle");
		else if (pc.girlCumQ() < 2000) output(" flood");
		else output("n explosion");
		output(" of [pc.girlCumType] pours from between your [pc.legs] as " + (pc.hasVaginas() ? "each":"your") + " vagina spasms" + (pc.hasVaginas() ? " in turn":"") + " for your conqueror.");
	}
	//Dicks only: 
	else if (pc.hasCock())
	{
		output("A");
		if (pc.cumQ() < 250) output(" trickle");
		else if (pc.cumQ() < 2000) output(" flood");
		else output("n explosion");
		output(" of [pc.cumType] paints your chest" (pc.cumQ() >= 250 ? " and the ground in front of you":"") + ", your dick" + (pc.hasCocks() ? "s":"") + " twitching in time with the thrusts into your [pc.vagOrAss " + x + "].");
	}
	output("\n\n<i>“Done already?”</i> The sydian snorts derisively as your pace falters before pushing you forward onto your hands and knees.");
	output("\n\nWhining, you look back over your shoulder to see him lining his new cock back up to your [pc.vagOrAssNoun " + x + "], thrusting back into your still convulsing passage with a low groan. His hands come to rest firmly on your [pc.hips], holding you steady as he begins thrusting into you once more.");
	output("\n\n");
	if (pc.hasPerk("Amazonian Endurance")) output("A lesser [pc.manWoman] might be left shaking from that orgasm, and you assume that the sydian hasn’t quite noticed that you’re not as his");
	else output("Shaky as you still are from that orgasm, you whine in relief as the sydian’s");
	output(" thick tail wraps around your chest to support you. The feathered tip slides over your bared flesh, smearing more fluid into your skin, making your breath come faster, harder.");
	if (pc.biggestTitSize() >= 3) output(" It doesn’t stay still, of course, threading its way between your [pc.breasts], fucking your ample cleavage roughly");
	else output(" He doesn’t bother holding it still, and instead you’re treated to the way it roams over your [pc.nipples]");
	output(", all the while driving you further and further out of your mind.");
	output("\n\nYou’d thought that maybe, just maybe, the combination of taint running through the ex-cuntboy’s blood and the addition - readdition? - of a cock to get used to would make the brute a quick shot, but he barely seems affected, his stamina" + (pc.hasPerk("Amazonian Endurance") ? " somehow":"") + " much greater than yours. Any thoughts past those revelling in your treatment ultimately wander back to your captor. He’s so much stronger than the other males of his species that you’ve faced. Does he have a harem? Will he add you to it? Will you spend the rest of your days worshipping the new cock you’ve bestowed upon him with your [pc.vagOrAss " + x + "]?");
	output("\n\nA hard slap to your [pc.ass] shakes you from your reverie, drawing you back to the present.");
	output("\n\nHe’s right, that doesn’t matter right now. What matters is bringing him pleasure right now, in this moment. You clench your muscles as best as you can,");
	if (pc.isTreated() || pc.hasVaginaType(GLOBAL.TYPE_GABILANI)) output(" not that it’s difficult for someone like you,");
	output(" squeezing at him tightly.");
	output("\n\nHe laughs, spanking your ass again and groaning as you clench. It’s an easy rhythm to fall into, you tightening back around his rod whenever the hand falls back across your rapidly bruising rear end, him letting out a pleasured noise whenever you do. You’re taught your place beneath him with ease, the pain of discipline blending with the pleasure of cilia stroking the inner depths of your [pc.vagOrAss " + x + "].");
	output("\n\nAll good things must come to an end though, as your captor’s pace eventually becomes erratic, the harsh smacks to your ass fading in intensity until he gives in, clinging to your hips as his head tips back. You both cum together, him letting out a roar as he explodes inside you, your own orgasm" + (pc.isTreated() ? " barely":"") + " quieter, but no less intense.");
	output("\n\nOverwhelmed, you barely notice him pulling out of you as your eyes roll back and you collapse, unconscious.");
	output("\n\nBy the time you’ve recovered and come to your senses, the Sydian is long gone. Seems he’s at least");
	if (!pc.isNude()) output(" folded your clothes and");
	output(" left your equipment where you can reach it easily.");
	output("\n\n");
	flags["SYD_CBOY_GREW_COCK"] = 1;
	processTime(30);
	pc.orgasm();
	pc.orgasm();
	//[Next] {Load in vagina or ass as applicable}{chance for generic sydian preg if vag}
	if (x >= 0) pc.loadInCunt(enemy,x);
	else pc.loadInAss(enemy);
	CombatManager.genericLoss();
}
//No Mods! Scene
public function loseToSydCboyNoMods():void
{
	clearOutput();
	showSydianCboy(true);
	output("You don’t get a chance to protest, " + (pc.hasMuzzle() ? "muzzle":"face") + " pressed firmly into his cleft. Any sense you might have had of the juxtaposition between built, powerful masculinity and soft, feminine cunt vanishes as you’re held fast and hard against him, every breath in dragging in a lungful of thick, aphrodisiac-laced <i>musk</i>.");
	output("\n\nYou don’t need to be told what to do. It’s only natural to extend your [pc.tongue], dragging the tip in between thick, slick labia, spreading them wide and revealing more and more of that bright orange you saw flashes of earlier. Every lick brings a flood of fluid that sends jolts of hot pleasure through your brain and directly down to your [pc.groin], and so you probe in deeper, seeking out the spots that reward you with more and more of his juices.");
	output("\n\nThe Sydian doesn’t <i>need</i> to put any effort into this with how eagerly you go about your business, and yet he does, pressing in impossibly close and grinding against your face. Your muscles strain with effort at the way he braces himself against you, but you don’t care. Every fraction of an inch closer is an increase in your heavenly reward.");
	output("\n\n");
	//both:
	if (pc.isHerm())
	{
		output("Your [pc.cocks] and [pc.vaginas] throb and you cum, releasing a ");
		if (pc.cumQ() + pc.girlCumQ() < 250) output("trickle");
		else if (pc.cumQ() + pc.girlCumQ() < 2000) output("flow");
		else output("deluge");
		output(" of your mixed fluids to paint the ground beneath you");
	}
	//{vags only: 
	else if (pc.hasVagina())
	{
		output("Your [pc.vaginas] twitch" + (pc.hasVaginas() ? " and pulse":"es and pulses") + ", and you cum, " + (pc.isSquirter() ? "spraying":"leaking") + " [pc.girlCum] across the ground below in ");
		if (pc.girlCumQ() < 250) output("trickles");
		else if (pc.girlCumQ() < 2000) output("pools");
		else output("floods");
	} 
	//cocks only:
	else if (pc.hasCock())
	{
		output("Your [pc.cocks] throb" + (pc.hasCocks() ? "":"s") + "}, and you cum, painting the ground beneath you with a ");
		if (pc.cumQ() < 250) output("trickle");
		else if (pc.cumQ() < 2000) output("pool");
		else output("flood");
		output(" of [pc.cum]");
	}
	//neither:
	else output("Your featureless groin manages to experience an orgasmic thrill");
	//Merge
	output(", but your attacker shows no signs of stopping. Much as you’re sure he’s affected by his own supply of aphrodisiacs, his stamina is" + (pc.hasPerk("Amazonian Endurance") ? " somehow":"") + " far better than your own, and if anything, he’s only picking up the pace.");
	output("\n\n");
	//{long/prehensile tongue:
	if (pc.hasLongTongue()) output("Inhumanly long t");
	//squishy tongue:
	else if (pc.hasTongueFlag(GLOBAL.FLAG_SQUISHY)) output("Broad t");
	else output("T");
	output("ongue probing deep into him and sliding in and out to mimic the motion of a cock, you bring your hands up to his slim hips, pulling him in even closer. He groans in approval, a deep rumble of pleasure, and you know you’re doing well.");
	output("\n\nWhenever you need to pull back for breath, you make sure not to move too far away, desperate for more and more of that delightful, lust fuelling natural scent and receiving it in dizzying helpings. You lash over his inner folds time and time again, watching in delight as, over time, his cunt stays opened and bare when you pull back for air, able to see right into his channel.");
	output("\n\nHis clit isn’t ignored either. It’s swollen and throbbing, and whilst you certainly start by teasing around it, a firm tug on ");
	if (pc.hasLongEars()) output("your ears");
	else if (pc.hasHair()) output("your hair");
	else output("the back of your head");
	output(" reminds you that you are very much the one submitting here, and it wouldn’t do to disappoint. You take the protruding object of desire into your mouth, [pc.lips] wrapping around it and giving it a firm suck. Somehow, you know to treat it more like a miniature cock than you would normally, and the Sydian seems to approve, hips twitching and thrusting against your face. You shudder at the thought of him doing this back when he had a cock, but shove the thought down. It doesn’t matter. You just want to service his puss.");
	output("\n\nWhen you next try to pull away, you’re grabbed roughly and forced back in - the brute clearly growing desperate. You oblige, naturally. Already feeling the effects of the aphrodisiac bringing you closer and closer to a second, you can think of nothing better than the two of you cumming in unison, you buried into his cleft and cumming untouched, a perfect submissive.");
	output("\n\nThe pace builds up to a frenzy, wet lower lips smashing roughly against your own swollen [pc.lips]. You do your best to pick up every droplet of his natural lubricant, but there’s far, far too much to be natural. It’s running down your chin");
	if (pc.hasHair()) output(", soaking into your [pc.hair],");
	output(" and generally covering you in a thin, messy layer of not-so-female bliss.");
	output("\n\nIt doesn’t take much longer after that, and you practically scream as you cum a second time, the Sydian not far behind you, coating you head to foot in yet more transparent fluid, not that you notice as your eyes roll back, passing out from sheer exhaustion.");
	output("\n\nBy the time you’ve recovered and come to your senses, the Sydian is long gone. Seems he’s at least{ folded your clothes and} left your equipment where you can reach it easily.");
	output("\n\n...You need a shower.");
	output("\n\n");

	//[Next]{back to map}{give PC femcum covered status effect}
	processTime(30);
	pc.orgasm();
	pc.orgasm();
	pc.applyPussyDrenched();
	pc.girlCumInMouth(enemy);
	CombatManager.genericLoss();
}