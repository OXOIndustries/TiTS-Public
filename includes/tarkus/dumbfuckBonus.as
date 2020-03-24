//Dumbfuck - A Bimbo TF
//In a nutshell, this stuff boosts minimum lust slightly, minimum libido significantly, and worsens the effects with every orgasm while it remains in your system, eventually granting a few perks.

/*Changes on First Dose:
The following classed under "Dumbfuck" perk.
Minimum Libido raised to 40.
Minimum Lust raised to 10 if it was less than 10.
Future libido gains doubled.
Future intelligence gains halved.
Unlocks Over Time:
(3) Easy: 20% increase in combat lust gains.
(6) Inhuman Desire: Maximum lust increased by 15.
(9) Breed-Hungry: +5 fertility rating and balls fill to halfway much faster than normal.
(12) Inhuman Desire 2: Maximum lust increased by 30.
(15) Bimbo Sense: Use libido instead of intelligence for sense ability.
(20) Weak Will: Will is lost twice as fast.*/

public function goAheadAndDumbfuck():void
{
	clearOutput();
	//Yes:
	if(flags["TIMES_TAKEN_DUMBFUCK"] == undefined)
	{
		flags["TIMES_TAKEN_DUMBFUCK"] = 0;
		output("Down the hatch! You pop it on in and swallow. It actually feels like it fizzes a little in your tummy, but you don’t feel any different, yet anyway. Wiping a bead of nervous sweat from your brow, you wonder how you’ll know when it’s working. ");
		if(pc.hasCock() || pc.hasVagina())
		{
			if(pc.isCrotchGarbed()) output("Maybe checking inside your [pc.lowerGarment] for a look at");
			else output("Maybe keeping an eye on");
			output(" your [pc.crotch]");
			output(" is a good idea - just to make sure you aren’t suddenly super horny.");
		}
		else if(pc.hasCockTail()) output("Maybe you should check your [pc.cockTails] - just to make sure you aren’t suddenly super horny.");
		else if(pc.hasTailCunt()) output("Maybe you should check your [pc.tailCunts] - just to make sure you aren’t suddenly super horny.");
		else output("Maybe you should touch your [pc.asshole] - just to make sure it’s not super-sensitive all of a sudden.");
		output(" Nope, normal. You sigh and have a seat.");
		output("\n\nJust how long does this stuff take to have an effect, really? You took it to supercharge your sex-drive and maybe take a little bit of the edge off, not to sit around wondering. Hopefully the effects will be good, like getting that good, warm feeling that you get when you’re really turned on all the time. It’ll be hard not to masturbate or fuck everyone you meet if that’s the case, and if you wind up doing that, you’ll just wind up fucking yourself into sluthood.");
		output("\n\nA blush warms your cheek at the thought. That wouldn’t be THAT bad, would it? Your heart beats a bit faster as you realize you’re getting aroused. Maybe you could get off quickly before it takes effect, perhaps blow off a little steam before you have to spend a day simmering in lust. That might be nice.");
		output("\n\nYou look down to find your hand busily ");
		if(pc.hasCock()) output("pumping your [pc.cockBiggest]");
		else if(pc.hasVagina()) output("fingering [pc.oneVagina]");
		else if(pc.hasTailCock()) output("stroking your fully-engorged tail-cock");
		else if(pc.hasCuntTail()) output("fingering your slick tail-vagina");
		else output("fingering your [pc.asshole], knuckle-deep and squirming around with purpose");
		output(". You hastily jerk your rogue fingers away");
		if(pc.isCrotchGarbed()) output(" and re-dress");
		output(", panting a little anxiously. This is going to be a little harder than you thought!");
		//Plus 10 lust
		output("\n\n(<b>Perk Gained: Drug Fucked</b> - minimum libido raised to 40, minimum lust rating increased by 10, future libido gains doubled, future intelligence gains halved.)");
		pc.createPerk("Drug Fucked",0,0,0,0,"Grants: +40 to minimum libido, +10 to minimum lust, halved intelligence gains, and doubled libido gains.");
	}
	else
	{
		output("You pop the pill but don’t really feel any different. The initial changes from the first dose were totally permanent, so unless you let yourself climax, it’s no big deal. Your hands slowly stroke your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("inner thighs");
		output(" as you bite your lip and try to stop yourself. It’s going to be a long, long day.");
	}
	//10 lust
	pc.changeLust(10);
	flags["TIMES_TAKEN_DUMBFUCK"]++;
	if(pc.hasStatusEffect("Dumbfuck"))
	{
		pc.setStatusMinutes("Dumbfuck",1440);
	}
	else
	{
		pc.createStatusEffect("Dumbfuck", 0, 0, 0, 0, false, "Pill", "You are currently under the effects of “dumbfuck,” an illegal drug known for making its users more and more sex-crazed with every orgasm over a 24 hour period. Intelligence loss is also common.", false, 1440,0xB793C4);
		pc.intelligence(-1);
	}
	processTime(3);
	clearMenu();
	addButton(0,"Next",useItemFunction);
}

//After Orgasm Procs
//Stored in: "Dumbfuck Orgasm Procced" in v1.
//Probably going to be done via an event queue-like system. Add to Q AFTER time passage.
public function processDumbfuckEvents():void
{
	//Got some cums to pile oN?
	if(pc.hasStatusEffect("Dumbfuck Orgasm Procced"))
	{
		//No sneezes set up yet. Start dis shit.
		pc.createStatusEffect("Dumbfuck Orgasm Queued", 0, 0, 0, 0, true, "", "", false, 0);
		//Already got some. PILE ON!
		pc.addStatusValue("Dumbfuck Orgasm Queued",1,pc.statusEffectv1("Dumbfuck Orgasm Procced"));
		//Clear out the holding status now that we're cued up for sneezin'
		pc.removeStatusEffect("Dumbfuck Orgasm Procced");
	}
	//Add to event queue so long as it isn't on there already
	if(pc.hasStatusEffect("Dumbfuck Orgasm Queued"))
	{
		if(eventQueue.indexOf(procDumbfuckStuff) == -1) eventQueue.push(procDumbfuckStuff);
	}
}
public function procDumbfuckStuff():void
{
	clearOutput();
	
	var dumbfuckOrgasms:StorageClass = pc.getStatusEffect("Dumbfuck Orgasm Queued");
	
	if(dumbfuckOrgasms == null)
	{
		output("Error: “Dumbfuck Orgasm Queued” Status Effect does not exist!");
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	var nMult:Number = 1;
	var taint:Number = pc.taint();
	if(taint <= 50) nMult = 3;
	else if(taint <= 70) nMult = 2.5;
	else if(taint <= 85) nMult = 2;
	else if(taint <= 95) nMult = 1.5;
	
	//Small sneeze - 1 cum
	if(dumbfuckOrgasms.value1 <= 1)
	{
		//Random variant
		if(rand(3) == 0) output("An abrupt sneeze brings you to a standstill.");
		else if(rand(2) == 0) output("Jerking your head back, an abrupt, unexpected, small sneeze hits you. Ugh, gross!");
		else output("A sudden, somewhat quiet sneeze goes off in your nose.");
		pc.intelligence(-1);
		pc.libido(1);
		pc.taint(0.5 * nMult);
	}
	//Medium sneeze - 2-3 cums
	else if(dumbfuckOrgasms.value1 <= 3)
	{
		if(rand(3) == 0) output("A large, messy sneeze doubles you over.");
		else if(rand(2) == 0) output("Nearly knocking you back, the inevitable, dumbfuck-created sneeze stops you in your tracks.");
		else output("A big sneeze slowly builds in your nose. You try to hold it in, but it erupts out all the same.");
		pc.intelligence(-2);
		pc.libido(2);
		pc.taint(1 * nMult);
	}
	//Huge sneeze - 4-6 cums
	else if(dumbfuckOrgasms.value1 <= 6)
	{
		if(rand(3) == 0) output("Oh wow, there’s a huge sneeze coming. You can feel it building up, already making you lightheaded. You get a tissue up just in time to catch some of the mess.");
		else if(rand(2) == 0) output("A sneeze the size of a house rocks you back on your [pc.feet] and nearly topples you to the ground.");
		else output("A chain of three decent-sized sneezes interrupts you.");
		pc.intelligence(-4);
		pc.libido(4);
		pc.taint(2 * nMult);
	}
	//Sneezing fit - 7+
	else
	{
		if(rand(2) == 0) output("There’s nothing you can do but grab hold of your [pc.leg] and try to keep yourself upright as sneeze after sneeze courses through your body. They keep you locked in a fit for what seems like ages, each one making you feel a little warmer and more disoriented than the last.");
		else output("A bunch of sneezes are rising up in the back of your nose, and there’s nothing you can do but hold onto yourself and wait it out. If only you hadn’t cum so-achoo! The first one hits a split second before the second... and the third... and the fourth.... You sneeze for what feels like a minute straight, each one feeling better than the last.");
		pc.intelligence(-5 - rand(3));
		pc.libido(5 + rand(3));
		pc.taint(3 * nMult);
	}
	
	if(flags["DUMBFUCK_SNEEZES"] == undefined) flags["DUMBFUCK_SNEEZES"] = 0;
	flags["DUMBFUCK_SNEEZES"] += dumbfuckOrgasms.value1;
	pc.removeStatusEffect("Dumbfuck Orgasm Queued");
	
	if(flags["DUMBFUCK_SNEEZES"] <= 1)
	{
		
		output("\n\nYou gather your bearings and wipe your nose. That wasn’t so bad, was it? Sure, your crotch feels pleasantly warm, but you can still think fine. Eleven times eleven is still 121 and you don’t NEED to cum again or anything.");
	}
	//The second one.
	else if(flags["DUMBFUCK_SNEEZES"] <= 2) output("\n\nUgh, what a mess. You clean up as best you can, wondering just how many orgasms you’re going to let yourself have. They’re definitely doing something, but you can still think and do math and stuff just fine. You just don’t feel like contemplating physics atm. It’d be more fun to find someone cute to hang around with until this drug wears off and you can fuck again.");
	//Few sneezes (less than 3)
	else if(flags["DUMBFUCK_SNEEZES"] <= 3) output("\n\nYou stand there a moment or two before realizing you should wipe yourself clean. A moment later, you’re all better and wondering just how much of your reasoning ability was turned into pleasure-receptors.");
	//The fourth one
	else if(flags["DUMBFUCK_SNEEZES"] <= 4) 
	{
		output("\n\nA blissful fifteen seconds of warm-feeling emptiness makes it hard to remember to clean up, but you still do. Just because you’ve slipped up enough to have four genital-engorging orgasms and let this stuff rewire a little bit of your brain doesn’t mean you should stop trying to keep in control of yourself. You’re still capable of rational thought. Nine times nine is 81, and you could do more if you wanted to. Now if only you could stop thinking about how ");
		if(pc.hasCock()) output("agonizingly hard you’ve become");
		else if(pc.hasVagina()) output("deliciously wet you are");
		else output("wonderfully sensitive every part of your body is getting");
		output(".");
	}
	//The fifth one
	else if(flags["DUMBFUCK_SNEEZES"] <= 5)
	{
		output("\n\nA pink haze settles down in place of whatever you were thinking. You chase it away with a shake of your head as you clean yourself and wonder just how bad off you are. You’ve let yourself cum five times, and it’s definitely starting to effect you. You feel warm all over, you get horny at the drop of a hat, and focusing on complicated problems is getting increasingly difficult.");
	}
	//Sixth!
	else if(flags["DUMBFUCK_SNEEZES"] <= 6)
	{
		output("\n\nIt takes you a little while for the pleasant buzz of shifting thought-priorities to fade. You wipe up at the hot, flushed feeling that rolls through your body, enjoying the ");
		if(pc.isChestGarbed()) output("feel of your [pc.nipples] against your [pc.upperGarment]");
		else output("look of your engorged [pc.nipples]");
		output(". This stuff is great!");
	}
	//Seventh
	else if(flags["DUMBFUCK_SNEEZES"] <= 7)
	{
		output("\n\nMmmm, you come out of a brief daydream about going down on someone. It fades as you wipe the snot off your nose and try to remember what you were doing. You got off - you remember that, and then... then sneezed! That’s right. This drug does stuff to you when you cum. It makes your head feel all funny and slow, but it makes your [pc.skin] feel so sensitive and warm. You give your [pc.butt] a smack and nearly jump at how damned good it feels.");
		output("\n\nThat’s nice, but... but you’re getting dumber! You’re sure of it now. Eight times eight is sixty-four, not sixty-nine, you think. Sixty-nine is wayyy more fun though. You check the calculator on your codex just to be sure, then type in ‘8008’ to spell boob before putting it away. Boobs are great.");
	}
	//Eight
	else if(flags["DUMBFUCK_SNEEZES"] <= 8)
	{
		output("\n\nWhoah, that one felt kind of... good. You cradle your muzzy head with one hand while trying to clean yourself with the other. At least the cums were great. Orgasms never felt so sexually fulfilling before. You might be losing a little bit of reasoning ability with each one, but you make it all back in pleasure potent-ent... err, ability anyway. You stop one hand from masturbating and move on. You can’t get any dumber and hornier!");
	}
	//9
	else if(flags["DUMBFUCK_SNEEZES"] <= 9) output("\n\nYou stare off into space for nearly a minute before you remember that you’ve got stuff hanging out of your nose still. It feels kinda good actually - not as good as a cum, mind you, but sneezing out all those troublesome thoughts so you can focus on getting laid is kind of liberating.");
	//Ten Sneezes!
	else if(flags["DUMBFUCK_SNEEZES"] <= 10) output("\n\nThe empty headedness that comes with these sneezes feels really good. It’s serene in a way, like you could just let yourself go and do whatever your body wants to. Touch yourself here, stroke yourself there, and maybe even fuck for a few hours. It’s so hard to focus on stuff like math or... uh... problems. The only problem that holds your attention is fucking, and that’s not even a problem, right? Just something you like doing. You were trying not to for some reason.... Oh, right! Dumbfuck! The name makes you " + pc.mf("laugh","giggle") + ". Gotta not fuck so you stay smart. Duh.");
	//Eleven
	else if(flags["DUMBFUCK_SNEEZES"] <= 11) output("\n\nThe vacant smile slowly fades from your face as you come to. Every single time it’s like you come back with a little more cotton in between your ears and a lot more want in your crotch. You shake your head to try and clear the dreamy feeling and try your best to think of something smart. Six times six... sounds like sex. Oh, that’s not good. You pull out your codex, resisting the urgle to search for porn, and type in six times six. Right, thirty-six! Of course. You know that. Thirty six. Don’t have thirty sex! You " + pc.mf("laugh","giggle") + " over your own joke.\n\nIf only you could keep your thoughts straight and stop cumming so much!");
	//Losing it (less than 12)
	else if(flags["DUMBFUCK_SNEEZES"] <= 12) output("\n\nYou come to over a minute later and wipe the drool and snot off your face. Looking at the rag, you realize that every time you do this, it’s like you’re sneezing out a little bit of your smarts and the only thing left to fill in the void is lust. Your [pc.nipples] certainly feel good under your roving fingertips. Maybe you can find someone to tie you down and keep you from cumming, or maybe just tease you until you’re spontaneously cumming again and again....");
	//Thirteen
	else if(flags["DUMBFUCK_SNEEZES"] <= 13) output("\n\nWhoah. You wipe your nose. You should probably be worried right now, but you’re just too happy not to. You’re smiling, you’re horny, and you’ve managed to get off thirteen times in the past... uh, today. This stuff might be making it a bit harder to think, but honestly, you don’t really need to, do you? You give up on answering that thought and decide to go on with your day.");
	//Fourteen
	else if(flags["DUMBFUCK_SNEEZES"] <= 14) 
	{
		output("\n\nYou stand there smiling, one hand idly circling your [pc.nipple] as your brain restarts. It feels so goddamned good, like your nipple is every bit as sensitive as your genitals were before and then some. And everything feels better now, especially your ");
		if(pc.hasCock() && pc.hasVagina()) output("[pc.cocks] and [pc.vaginas]");
		else if(pc.hasCock()) output("[pc.cocks]");
		else if(pc.hasVagina()) output("[pc.vaginas]");
		else output("[pc.asshole]");
		output(". This stuff is doing stuff to your head to make it feel that good. You should go give whatever scientist came up with this stuff the best fuck of " + pc.mf("his","her") + " life!");
	}
	//OhfuckhowIthink? (less than 15)
	else if(flags["DUMBFUCK_SNEEZES"] <= 15) output("\n\nYou shudder and " + pc.mf("laugh","giggle") + " uncontrollably at how " + pc.mf("silly and ","") + "full of fuck your head is getting. You idly stretch, being sure to rub a [pc.nipple] for good luck before wiping away the mucus. Maybe you can have some sex that’s so good you’ll max out the good feelings from Mr. pill in your bloodstr... bloods... body.");
	//Sixteen
	else if(flags["DUMBFUCK_SNEEZES"] <= 16) output("\n\nOhhhh wow. You wipe up the mess and marvel at how good you feel. Too good, in fact. It’s hard to make decisions when you’re floating on a cloud of euphoria, hormones, and need, and you definitely need to fuck soon. If only you could keep your hands out of your loins or away from your nipples. Each time you touch them it’s like a miniature orgasm, and you didn’t want those, right?");
	//Seventeen+
	else {
		output("\n\nYou come to with you a dumb smile on your face and your hand playing with your ");
		if(pc.hasCock()) output("[pc.cocks]");
		else if(pc.hasVagina()) output("[pc.vaginas]");
		else output("[pc.nipples]");
		output(". An orgasmic smile is spread across your face from the intensity of your boosted sensations. You could just masturbate and cum again and again and again. It’d feel soooo goood. You’d never get tired of it!");
	}
	
	//Stuff that's appended on to announce perks
	//GAIN EASY:
	if(flags["DUMBFUCK_SNEEZES"] >= 3 && !pc.hasPerk("Easy"))
	{
		output("\n\nA quick quick touch to your ");
		if(pc.hasCock()) output("[pc.cock]");
		else if(pc.hasVagina()) output("[pc.vagina]");
		else if(pc.hasTailCock()) output("[pc.tailCock]");
		else if(pc.hasTailCunt()) output("[pc.tailVagina]");
		else output("[pc.asshole]");
		output(" confirms your worries. It feels fantastic, almost as good as right before you cum. You hastily pull your hand back and wonder how you’re going to turn down anyone when just thinking about sex is so rewarding!");
		output("\n\n(<b>Perk Gained: Easy</b> - gain 20% more lust from combat sources.)");
		pc.createPerk("Easy",20,0,0,0,"Gain 20% more lust from combat sources.");
	}
	//GAIN INHUMAN LUST:
	if(flags["DUMBFUCK_SNEEZES"] >= 6 && !pc.hasPerk("Inhuman Desire"))
	{
		output("\n\nEverything feels good, and you think you might be able to get even hornier than you could before, like your brain is wired up with extra capacity for fuckin’ or something. Thinking about fucking gives you a pleasant, achy twinge, but you hold it together for now. You did just get off, after all. If you could just focus....");
		output("\n\n(<b>Perk Gained: Inhuman Desire</b> - Your maximum lust is increased by 15.)");
		pc.createPerk("Inhuman Desire",15,0,0,0,"Increases maximum lust by 15.");
	}
	//GAIN BREED HUNGRY:
	if(flags["DUMBFUCK_SNEEZES"] >= 9 && !pc.hasPerk("Breed Hungry"))
	{
		output("\n\nBesides, ");
		//balls and cunt
		if(pc.balls > 0 && pc.hasVagina())
		{
			if(pc.balls > 1) output("your balls are feeling really, really good right now. Maybe all the horniness or hormones or something are doing something to them. You hope it makes them cummier.");
			else output("your ball is feeling really, really good right now. Maybe all the horniness or hormones or something are doing something to it. You hope it makes your nut even cummier.");
			output(" Cumming is awesome! Even [pc.eachVagina] is feeling great! It’s like your ovaries have kicked up into overdrive and your body is just craving a virile little swimmer to get gangbanged by all your needy little eggs. Oooh, maybe you should get involved in a gangbang to even the odds?");
		}
		//just balls
		else if(pc.balls > 0)
		{
			if(pc.balls > 1) output("your balls are feeling really, really good right now. Maybe all the horniness or hormones or something are doing something to them. You hope it makes them cummier.");
			else output("your ball is feeling really, really good right now. Maybe all the horniness or hormones or something are doing something to it. You hope it makes your nut even cummier.");
			output(" Cumming is awesome! Maybe they’ll fill up faster to help keep up with all the jizz you’re shooting?");
		}
		//just cunt
		else if(pc.hasVagina()) output("[pc.eachVagina] is feeling great! It’s like your ovaries have kicked up into overdrive and your body is just craving a virile little swimmer to get gangbanged by all your needy little eggs. Oooh, maybe you should get involved in a gangbang to even the odds?");
		//neither
		else output("something inside of you is changing. You aren’t sure what, but you bet it has something to do with all the horniness or hormones in your system or something. Maybe changing something that would make more sense if you had different sex bits, like a pussy, and big heavy balls! Maybe you could get both, double the fun and all that!");
		output("\n\n(<b>Perk Gained: Breed Hungry</b> - Your balls refill much faster than normal and your pregnancies are more likely and faster.)");
		pc.createPerk("Breed Hungry",15,0,0,0,"Increases speed that semen is created at and the pregnancy speed.");
	}
	//Gain inhuman desire upgrade
	if(flags["DUMBFUCK_SNEEZES"] >= 12 && pc.perkv1("Inhuman Desire") > 0 && pc.perkv1("Inhuman Desire") < 30)
	{
		output("\n\nJudging by how you feel, you’re pretty sure all the room left behind by the smarts you’ve sneezed out has been replaced by a greater capacity for sexual desire. You bet you could get even hornier before you wind up caving to your desires. That’s good right? You can be super horny and not cum, just like you planned. Or maybe you’ll be super horny and then having a fucking awesome cum!");
		output("\n\n(<b>Inhuman Desire Perk Upgraded</b> - Your maximum lust is increased by thirty.)");
		pc.setPerkValue("Inhuman Desire",1,30);
		pc.setPerkTooltip("Inhuman Desire","Increases maximum lust by 30.")
	}
	//Gain Fuck Sense
	if(flags["DUMBFUCK_SNEEZES"] >= 15 && !pc.hasPerk("Fuck Sense"))
	{
		output("\n\nYou bet you could tell exactly what would drive someone wild now. All it would take is a few seconds to look and you’d know how to fuck them. Did that pill do this?");
		output("\n\n(<b>Perk Gained: Fuck Sense</b> - The Sense ability now relies on your libido rather than intelligence.)");
		pc.createPerk("Fuck Sense",15,0,0,0,"Allows your sense ability to base success off your libido instead of intelligence.");
	}
	//Gain weak willed
	if(flags["DUMBFUCK_SNEEZES"] >= 17 && !pc.hasPerk("Weak Mind"))
	{
		output("\n\nBut why stop yourself? You could just let go and do what feels good, and it all feels good. Particularly touching. You love touching, being touched, whatever. You’d let someone do all kinds of stuff to you if they touched you!");
		output("\n\n(<b>Perk Gained: Weak Mind</b> - You lose willpower twice as fast.)");
		//Reduce willpower by 6 immediately. (only need to mod by 3 if perk active)
		pc.willpower(-6);
		pc.createPerk("Weak Mind",0,0,0,0,"Intelligence and willpower losses doubled.");
	}
	if(flags["DUMBFUCK_SNEEZES"] >= 20 && !pc.hasPerk("Ditz Speech") && !pc.hasPerk("Brute Speech"))
	{
		//Gain Ditz Speech
		if(pc.mf("dude","chick") == "chick")
		{
			output("\n\nBest of all, you’re like, sprinkling cool words like ‘like’ and ‘totally’ into your sentences all the time, and you trail off in the cutest way when you try to think hard about something hard, like cocks!");
			output("\n\n(<b>Perk Gained: Ditz Speech</b> - You will now sound like a total bimbo in scenes that support it.)");
			pc.createPerk("Ditz Speech",0,0,0,0,"Alters dialogue in certain scenes.");
		}
		//Gain Brute Speech
		else
		{
			output("\n\nBest of all, you’re getting pretty comfortable communicating with things like grunts or really short sentences. Words suck anyway. Better to put your energies into fucking as well as you can.");
			output("\n\n(<b>Perk Gained: Brute Speech</b> - You will now speak like a fuck-hungry brute in scenes that support it.");
			pc.createPerk("Brute Speech",0,0,0,0,"Alters dialogue in certain scenes.");
		}
	}
	
	// Sneezing Tits synergy
	var sneezeTits:StorageClass = pc.getStatusEffect("Sneezing Tits");
	if(sneezeTits != null) output(sneezingTitsSneeze(pc, sneezeTits, sneezeTits.value4));
	
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}