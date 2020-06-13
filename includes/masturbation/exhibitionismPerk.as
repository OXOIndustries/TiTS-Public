// Exhibitionism Perk
// By: AHornyPanda

/*

The Idea: 
A perk earned when the PC hits 100 exhibitionism. It locks exhibitionism at 100 and has a few effects on the PC’s lust when in civilization. Additionally in civilization a few blurbs are unlocked as well as a stripping and posing scene.

Unlocking Perk (Order important):
1.	When PC reaches 100 exhibitionism score display usual blurb replacing the final line (Check the Blurbs).
2.	Create a hidden stat “ultraExhib” that tracks exhibitionism the same way it is done at high exhibitionism values but only goes to 10.
3.	Warnings appear at 1 and 7 “ultraExhib” values.
4.	Reset “ultraExhib” to 0 if did not engage in exhibitionist sex in the past 7 days. Wearing exposed clothing should not prevent reset.
5.	Unlock perk at 10.

Mechanics:
•	Exhibitionism locked at 100 and does not fall with time, even if fully clothed.
•	If in civilization:
	o	Increase minimum lust to 33 OR by 10, whichever results in higher minimum lust.
	o	Gain 1 lust/min/exposed body part.
	o	If PC is not fully exposed AND did not engage in any exhibitionist scenes for the past week, a scene where they impulsively strip might play. More likely the more clothed they are.
	o	If a blurb triggers and PC is at 90% lust or more and willpower is less than 50%, trigger a random scene from the masturbate menu.
	o	Strip scene can be voluntarily accessed from masturbate menu.
	o	Blurbs mentioned below can be displayed.

*/

// Unlocking Blurbs
public function extraExhibitionismGain(gain:Boolean = false):String
{
	if(!pc.hasStatusEffect("Exhibitionism Reserve")) pc.createStatusEffect("Exhibitionism Reserve", 0, 0, 0, 0, true, "LustUp", "Tracker for bonus exhibitionism gains.", false, 0);
	
	var ultraExhib:StorageClass = pc.getStatusEffect("Exhibitionism Reserve");
	
	if(gain) ultraExhib.value1 += 1;
	ultraExhib.minutesLeft = (7 * 24 * 60);
	
	var msg:String = "";
	
	switch(ultraExhib.value1)
	{
		case 0:
			// Same scene as currently in-game is displayed, followed by:
			msg += "If you continue to engage in public lewdness, <b>you might end up hooked to the thrills of exhibitionism.</b>";
			break;
		case 1:
			msg += "With your recent venture, you have taken the first step towards becoming an exhibitionist down to your very core. <b>If you continue to consistently expose yourself, your exhibitionist tendencies might eventually become permanent.</b>";
			break;
		case 7:
			msg += "Your most recent public show of perversion was a massive thrill, exposing yourself is just <i>so</i> hot! <b>Unless you want the thrills of exhibitionism to become one with your body, you should probably hold back on publicly indecent activities for a few days.</b>";
			break;
		case 10:
			msg += "With your most recent publicly decadent performance, the desire to expose yourself to everyone becomes one with your body. Just being around people sets you ablaze with desire. Every time someone glances at you, the fire burning within you glows brighter, searing the pleasures of exhibitionism into every inch of you.";
			// Unlock Ultra-exhibitionist perk
			msg += "\n\n(<b>Perk Gained: Ultra-Exhibitionist</b> - You are now a permanent exhibitionist who savors any attention they can get.)";
			// Perk: Ultra-Exhibitionist
			// v1: Public location flag toggle; 0 is not public, 1 is public
			// v2: Days since last exhibitionism event.
			// v3: 
			// v4: 
			pc.createPerk("Ultra-Exhibitionist", 1, 0, 0, 0, "The pleasures of exhibitionism have been seared into your body, locking your exhibitionism at max value. Also boosts minimum lust and lust gain when in civilization.");
			// Clear the tracker
			pc.removeStatusEffect("Exhibitionism Reserve");
			break;
	}
	
	return msg;
}

// Entering/Leaving Public Area
// A 25% chance to trigger the applicable one when the PC enters or leaves a public space
// Trigger this after the “don’t be nude on Tavros” blurb and other similar stuff
public function exhibitionismLocationToggle():void
{
	if(rooms[currentLocation].hasFlag(GLOBAL.NOFAP) || rooms[currentLocation].hasFlag(GLOBAL.FAPPING_ILLEGAL)) return;
	
	var ultraExhib:StorageClass = pc.getPerkEffect("Ultra-Exhibitionist");
	var inPublic:Boolean = (rooms[currentLocation].hasFlag(GLOBAL.PUBLIC));
	var libidoQ:Number = pc.LQ();
	var libidoMult:Number = 2;
	if(libidoQ >= 33) libidoMult = 1.5;
	if(libidoQ >= 66) libidoMult = 1;
	
	if(rand(4 * libidoMult) == 0)
	{
		var pcLocation:String = getPlanetName();
		var msg:String = "";
		
		if(pcLocation == "Unknown") pcLocation = "public space";
		
		switch(ultraExhib.value1)
		{
			// Entering:
			case 0:
				if(inPublic)
				{
					msg += "You set foot into " + pcLocation + ", scanning your surroundings as you move further in. The amount of people around you staggers you with a wave of lust, sending electric tingles down your spine. Just being in the midst of so many people causes you to burn with desire and";
					if(!pc.isNude()) msg += " you begin to wonder just how much better it would feel if you were to reveal more of yourself...";
					else msg += " the eyes that turn around to take in your nude form act like a fuel stream. This feels <i>so</i> right!";
					msg += "\n\nYou snap back to reality and continue on your way, bursting with excitement.";
					if(pcLocation != "Tavros Station") msg += " Maybe you should give the passersby a show?";
					else msg += " Sure you can’t be nude on Tavros, but that doesn’t mean you can’t give its people a fun show. Maybe you should?";
				}
				break;
			// Leaving:
			case 1:
				if(!inPublic)
				{
					msg += "You step";
					if(currentLocation == "SHIP INTERIOR") msg += " into your ship";
					else if(pcLocation == "public space") msg += " away from society";
					else msg += " outside " + pcLocation;
					msg += " and the thrill that had clutched you in its claws throughout your trip fades away. A confusing mixture of relief at your toned down lust and disappointment comes over you instead. You already miss being in the public eye.";
				}
				break;
		}
		
		if(msg != "") AddLogEvent(ParseText(msg));
	}
	
	ultraExhib.value1 = (!inPublic ? 0 : 1);
	
	if(inPublic && rand(10 * libidoMult) == 0 && !pc.hasStatusEffect("Exhibitionist Blurb Cooldown"))
	{
		//if(eventQueue.indexOf(exhibitionismBlurbs) == -1) eventQueue.push(exhibitionismBlurbs);
		exhibitionismBlurbs();
		
		pc.createStatusEffect("Exhibitionist Blurb Cooldown", 0, 0, 0, 0, true, "", "", false, 60);
	}
}

// Blurbs
// Randomly picked from all applicable blurbs, only when in civilization
public function exhibitionismBlurbs():void
{
	var msgList:Array = [];
	var msg:String = "";
	var pcLocation:String = getPlanetName();
	
	// Always Available
	msgList.push("As you go about your day you occasionally grope yourself, but only when you know that someone will catch a look.");
	msgList.push("Sometimes, when you make eye contact with a passerby you give them a come-hither look, a seductive wink, or a sexy lip bite. You never linger before moving on though, wondering what sort of reaction is cooking up in their crotch on your way.");
	msg += "On occasion, you pretend that you dropped something on the floor, followed by an audible gasp. Only when a few heads turn do you enticingly bend over at the waist, promoting your [pc.ass] for a few seconds";
	if(pc.hasTail()) msg += " while hypnotically shaking [pc.eachTail]";
	msg += ", then head on your way smirking at the admiring faces you left behind.";
	msgList.push(msg);
	msg = "";
	//Only if cum soaked/pussy drenched, the ingame blurbs has different names for cum, //use the same method please
	if(pc.hasStatusEffect("Cum Soaked") || pc.hasStatusEffect("Pussy Drenched"))
	{
		msg += "The ";
		if(pc.hasStatusEffect("Cum Soaked")) msg += pc.fluidNoun(GLOBAL.FLUID_TYPE_CUM);
		else if(pc.hasStatusEffect("Pussy Drenched")) msg += pc.fluidNoun(GLOBAL.FLUID_TYPE_GIRLCUM);
		else msg += "fluid";
		msg += " coating you turns you into a painting of sluttery. Anyone who does as little as glance at you will be able to tell what kind of entertainment you enjoy the most. There is no mistaking it, the same way there is no mistaking how horny you currently are.";
		msgList.push(msg);
		msg = "";
	}
	// Fully clothed
	if(!pc.isFullyExposed())
	{
		msgList.push("You " + (pc.isFeminine() ? "swing your [pc.hips] enticingly with every step" : "broaden your shoulders as you walk") + " to make sure as many eyes are drawn to your body as possible.");
		msgList.push("With so many people surrounding you, staying fully covered is becoming more and more unbearable!");
		msgList.push("An urge to strip off and give the citizens of " + pcLocation + " a show grips you... but leaves as suddenly as it came.");
		msgList.push("Just being in public is getting you riled up. Why are you still covered!? Maybe you should expose your body for a bit...");
		msgList.push("The catcalls and lewd remarks you hear aimed at you always send a shiver down your spine, even as infrequent as they are.");
	}
	// Chest Exposed
	if(pc.isChestExposed())
	{
		msgList.push("Eyes can’t help but stare at your exposed [pc.fullChest] and the [pc.nipples] adorning " + (!pc.hasBreasts() ? "it" : "them") + ". And you can’t help but get excited as you feel their gaze linger on your [pc.skinFurScalesNoun].");
		msgList.push("As you move around " + pcLocation + ", passersby ogle your exposed [pc.chest]. You spot the daring few who attempt to sneak pictures of you, and you happily pretend not to notice. The thought of them masturbating to you later only turns you on more.");
		msg += "You notice that people often end up staring at your [pc.fullChest], and you couldn’t be happier";
		if(pc.hasBreasts()) msg += ", you even give them a few shakes";
		msg += "!";
		msgList.push(msg);
		msg = "";
		// Only if lactating, I don’t know what values mark high/low lactation, so it’s up to fenco
		if(pc.isLactating()) msgList.push("The [pc.milk] constantly " + (pc.canMilkSquirt() ? "gushing" : "leaking") + " from your erect [pc.milkyNipples] leaves a " + (pc.canMilkSquirt() ? "stream" : "string") + " of [pc.milkFlavor] perversion behind you. If the faces fixated on you are any indication, the scene looks as obscenely decadent as you imagine it would.");
	}
	// Ass Exposed
	if(pc.isAssExposed())
	{
		msgList.push("Multiple eyes can’t help but stare at your exposed [pc.ass] as you do your best to flaunt it. And you can’t help but get excited as you feel them roam your [pc.skinFurScalesNoun].");
		msgList.push("As you move around " + pcLocation + ", passersby ogle your exposed [pc.ass]. You spot the daring few who attempt to sneak pictures of you, happily pretending you don’t notice. The thought of them masturbating to you later only turns you on more.");
		msgList.push("You notice that people often end up staring at your [pc.ass] and you couldn’t be happier, you even give it a few shakes!");
		msg += "On occasion, you pretend that you dropped something on the floor, followed by an audible gasp. Only when a few heads turn do you enticingly bend over at the waist, exposing your [pc.asshole] for a few seconds";
		if(pc.hasTail()) msg += " while hypnotically shaking [pc.eachTail]";
		msg += ", then head on your way chuckling at the stunned faces you left behind.";
		msgList.push(msg);
		msg = "";
		// Only triggered if anally filled, I don’t know what values mark very/little full. So yeah...
		if(pc.hasStatusEffect("Anally-Filled"))
		{
			var assFull:Boolean = (pc.statusEffectv1("Anally-Filled") >= 1000);
			var assFill:int = pc.statusEffectv3("Anally-Filled");
			msg += "The " + pc.fluidNoun(assFill) + " that";
			if(assFull) msg += " fills your bowels to the brim";
			else msg += " is deep inside your [pc.asshole]";
			msg += " is constantly";
			if(assFull) msg += " pouring out of your [pc.asshole]";
			else msg += " leaking down your [pc.thighs]";
			msg += ", unmistakably advertising your most recent experiences.";
			if(assFull) msg += " The pool of " + pc.fluidNoun(assFill) + " forming around you";
			else msg += " The perfect image of your marked [pc.ass]";
			msg += " drops jaws to the floor wherever you go, which has you descend into further lust.";
			msgList.push(msg);
			msg = "";
		}
	}
	// Crotch Exposed
	if(pc.isCrotchExposed() && (pc.hasGenitals() || pc.balls > 0))
	{
		if(pc.hasGenitals())
		{
			msg += "People can’t help but stare at your exposed";
			if(pc.hasCock()) msg += " hard [pc.cocksLight]";
			if(pc.isHerm()) msg += " and";
			if(pc.hasVagina()) msg += " " + (!pc.isSquirter() ? "damp" : "drooling") + " [pc.pussiesNoun]";
			msg += ". You can’t help but get excited as you feel their eyes on your crotch.";
			msgList.push(msg);
			msg = "";
			msg += "You notice that people often end up staring at your";
			if(pc.hasCock()) msg += " [pc.cocks]";
			if(pc.isHerm()) msg += " or";
			if(pc.hasVagina()) msg += " [pc.vaginas]";
			msg += " and you couldn’t be happier, getting more turned on by the second.";
			msgList.push(msg);
			msg = "";
			msg += "Sometimes when you notice staring eyes, you reach down and give";
			if(pc.hasCock()) msg += " [pc.eachCock] a few strokes";
			if(pc.isHerm()) msg += " and";
			if(pc.hasVagina()) msg += " [pc.eachVagina] a few shlicks";
			msg += ", giggling at the reactions you elicit.";
			msgList.push(msg);
			msg = "";
		}
		msgList.push("As you move around " + pcLocation + ", passersby ogle your exposed crotch. You spot the daring few who attempt to sneak pictures of you, and you happily pretending not to notice. The thought of them masturbating to you later only turns you on more.");
		// Only triggered if vaginally filled, still don’t know what values mark very/little full.
		if(pc.hasStatusEffect("Vaginally-Filled") && pc.hasVagina())
		{
			var vagFull:Boolean = (pc.statusEffectv1("Vaginally-Filled") >= 1000);
			var vagFill:int = pc.statusEffectv3("Vaginally-Filled");
			msg += "The " + pc.fluidNoun(vagFill) + " that";
			if(vagFull) msg += " fills your " + (pc.vaginas.length == 1 ? "womb" : "wombs") + " to the brim";
			else msg += " is deep inside your [pc.vaginas]";
			msg += " is constantly";
			if(vagFull) msg += " pouring out of your [pc.vaginas]";
			else msg += " leaking down your [pc.thighs]";
			msg += ", unmistakably advertising your most recent experiences.";
			if(vagFull) msg += " The pool of " + pc.fluidNoun(vagFill) + " forming around you";
			else msg += " The perfect image of your marked [pc.vaginas]";
			msg += " drops jaws to the floor wherever you go, which has you descend into further lust.";
			msgList.push(msg);
			msg = "";
		}
	}
	// Everything Exposed
	if(pc.isNude())
	{
		msgList.push("There isn’t a single part of you that isn’t currently exposed, and you wouldn’t change that for the world. You are simply in your natural state of being, people are born nude after all. The fact you are so turned on by it is nothing more than a <i>very</i> pleasant side effect.");
		msgList.push("As you move around " + pcLocation + ", passersby eyefuck every square inch of your body without the slightest attempt of hiding their apparent thirst. And why shouldn’t they ogle you? Afterall, you are presenting yourself as a free buffet of eye-candy to any who desire.");
		msgList.push("The tidal wave of catcalls and perverse remarks that follow you wherever you are, hits you with an endless barrage of pleasant shivers throughout your nerves. You can’t help but respond with winks, wanton looks, and giggles every time you can. How could you ever live without this attention? <i>Imagining such a boring life is just impossible!</i>");
	}
	
	pc.lust(5);
	
	msg += ParseText(msgList[rand(msgList.length)]);
	
	var exhibFunc:Function = mainGameMenu;
	
	// Any Blurb Triggered at 90% or more lust
	// add the following after the blurb
	if(pc.lustQ() >= 90)
	{
		msg += "\n\nAll of this is just too hot... <i>way too hot.</i> You feel the lust already burning inside you explode with renewed vigor, being in public is just amazing! The heat spreading all over your [pc.skinFurScales] only increases with every passing moment. You <i>need</i> to do something about this...";
		// Involuntary striptease
		if(pc.perkv2("Ultra-Exhibitionist") >= 7)
		{
			if(eventQueue.indexOf(exhibitionismForceStrip) == -1) eventQueue.push(exhibitionismForceStrip);
		}
		// IF Willpower<50%:
		else if(pc.WQ() < 50)
		{
			//Picks a scene at random from the masturbate menu
			var exhibFaps:Array = [];
			exhibFaps.push(moderateExhibitionOmniFap);
			exhibFaps.push(goddamnitJimTAndYourExhibitionism);
			if(pc.hasItemByClass(GravCuffs) && pcLocation == "New Texas") exhibFaps.push(cuffSelfRouter);
			exhibFaps.push(exhibitionismForceStrip);
			
			exhibFunc = exhibFaps[rand(exhibFaps.length)];
			
			if(eventQueue.indexOf(exhibFunc) == -1) eventQueue.push(exhibFunc);
		}
		// Regular blurb behaviour here
		else
		{
			msg += "\n\n...But you manage to reign in your desires before they take hold of you and continue on your way.";
		}
	}
	
	/*
	clearOutput();
	
	showBust("");
	showName("");
	author("AHornyPanda");
	
	output(msg);
	
	clearMenu();
	addButton(0, "Next", exhibFunc);
	*/
	
	AddLogEvent(ParseText(msg));
}

// Strip
// Two methods to access both in civilization, labelled as follows for variations:
// Involuntary:
//	PC isn’t fully exposed and did not engage in any exhibitionist scenes for a week. 
//	OR a blurb is triggered at 90% lust or more.
// Voluntary:
//	Through masturbate page.
public function processExhibitionismStrip(totalDays:uint):void
{
	var ultraExhib:StorageClass = pc.getPerkEffect("Ultra-Exhibitionist");
	
	ultraExhib.value2 += totalDays;
	
	if(rooms[currentLocation].hasFlag(GLOBAL.NOFAP) || rooms[currentLocation].hasFlag(GLOBAL.FAPPING_ILLEGAL)) return;
	if(rooms[currentLocation].hasFlag(GLOBAL.PRIVATE) || !rooms[currentLocation].hasFlag(GLOBAL.PUBLIC)) return;
	
	if(ultraExhib.value2 >= 7 && !pc.isNude())
	{
		if(eventQueue.indexOf(exhibitionismForceStrip) == -1) eventQueue.push(exhibitionismForceStrip);
	}
}
public function exhibitionismForceStrip():void
{
	exhibitionismStrip(false);
}
public function exhibitionismStrip(voluntary:Boolean = true):void
{
	clearOutput();
	
	showBust("");
	showName("PUBLIC\nSTRIPTEASE!");
	author("AHornyPanda");
	
	var pcLocation:String = getPlanetName();
	
	if(voluntary) output("An urge to strip off and give the good people of " + pcLocation + " a show grips you... and it doesn’t leave. You <i>have</i> to scratch this itch!");
	else output("A thought crosses your mind... maybe you should give the good people of " + pcLocation + " a show? Yes... that would be <i>just</i> right.");
	output("\n\nYou find a spot at the center of a busy place and take a deep breath. Loudly, you announce to the good citizens of " + pcLocation + " to gather around for a free and exciting show. A few heads turn around,");
	if(!pc.isNude()) output(" snickering when they see you, assuming you are the victim of some sort of prank. A few of them are struck by curiosity and hang around to see what you’re up to.");
	else output(" smirking when they behold your exposed figure. People from all over flock around you and soon enough you have a horny audience surrounding you.");
	output("\n\n");
	if(!pc.isNude())
	{
		var bigWings:Boolean = (pc.canCoverSelf(false, "wings"));
		
		output("You begin your show by");
		
		if(pc.hasArmor())
		{
			output(" slowly taking off your [pc.armor], especially taking care to bend at the waist and wiggle your [pc.ass] when you have to. Free of your outer layer of clothes, you move on to");
		}
		if(pc.hasUpperGarment())
		{
			output(" removing your [pc.upperUndergarment]. You slowly drag your fingers across your body, starting at your [pc.hips], then over your [pc.belly], until you reach your undergarment. The eyes of the growing crowd are glued to your digits as they follow their journey to its completion when you release your [pc.upperUndergarment]. Feeling extra teasy,");
			if(bigWings) output(" you swing your [pc.wings] around to cover your [pc.chest], intentionally leaving tantalizing gaps in your cover. Meanwhile you use your hands to");
			else
			{
				output(" you");
				if(pc.biggestTitSize() >= 11) output(" attempt to");
				output(" cover your [pc.chest] with one hand as you");
			}
			output(" throw your underwear to the side");
			if(!bigWings) output(" with the other");
			output(". Finally, you release your " + (bigWings ? "[pc.wings]" : "hand") + " " + (pc.hasBreasts() ? "sending your [pc.breasts] bouncing with an enticing jiggle" : "exposing your [pc.breasts]") + ", mesmerizing the gathering crowd. Finally, you proceed with");
		}
		if(pc.hasLowerGarment())
		{
			output(" displacing your [pc.lowerUndergarment]. " + (pc.hasUpperGarment() ? "Once again, you" : "You") + " guide the amassing audience’s gaze with your digits,");
			if(pc.hasUpperGarment()) output(" this time");
			output(" starting by caressing your [pc.fullChest], then grazing over your [pc.belly] until you reach your crotch. The crowd’s eyes are locked on your");
			if(pc.hasGenitals())
			{
				if(pc.hasCock()) output(" growing erection" + (pc.cocks.length == 1 ? "" : "s"));
				if(pc.isHerm()) output(" and");
				if(pc.hasVagina()) output(" dampening crotch");
			}
			else output(" [pc.butts]");
			output(" with lustful hunger. Happy to feed their gazes you drag your [pc.lowerUndergarment] down your [pc.legOrLegs]. When they reach your [pc.feet], you bend over, hypnotically swaying your [pc.ass] while you get them off and toss them aside. At last, you are fully exposed and ready to begin");
		}
		
		output(" the show you promised a few minutes ago. With");
		if(pc.hasGenitals())
		{
			if(pc.hasCock()) output(" [pc.eachCock] standing at full mast");
			if(pc.isHerm()) output(" and");
			if(pc.hasVagina()) output(" [pc.eachVagina] " + (!pc.isSquirter() ? "dripping" : "gushing") + " [pc.girlCum]");
		}
		else output(" your [pc.asshole] pulsing hungrily,");
		output(" visible to the public, any doubts of the exciting show you mentioned evaporate, replaced instead by cheers from the ever growing sea of people surrounding you.");
	}
	else
	{
		output("Already fully nude, there is nothing more you can reveal to the ever growing crowd. Instead you opt to flaunt your assets. You begin with your [pc.fullChest], caressing " + (!pc.hasBreasts() ? "it" : "them") + " sensually as you tease your [pc.nipples]. Next you drag your fingertips across your [pc.belly], drawing the eyes fixated on your body downwards. Once you reach your crotch, you give your [pc.ass] a light spank with one hand, and have the other travel over your");
		if(pc.hasGenitals())
		{
			if(pc.hasCock()) output(" [pc.cocks]");
			if(pc.isHerm()) output(" and");
			if(pc.hasVagina()) output(" [pc.vaginas]");
		}
		else output("bare pelvis");
		output(". With");
		if(pc.hasGenitals())
		{
			if(pc.hasCock()) output(" [pc.eachCock] standing at full mast");
			if(pc.isHerm()) output(" and");
			if(pc.hasVagina()) output(" [pc.eachVagina] " + (!pc.isSquirter() ? "dripping" : "gushing") + " [pc.girlCum]");
		}
		else output(" your [pc.asshole] pulsing hungrily,");
		output(" visible to the public, you are ready to begin the highly anticipated show.");
	}
	output("\n\nA number of zealous voyeurs shamelessly pull up their devices and prepare to take pictures and video of your impending perversion. " + (!voluntary ? "As if on autopilot, you" : "You") + " grab your [pc.chest] with both hands, kneading with abandon as you savor the feelings that hit you. With one hand you pinch on a [pc.milkyNipple], releasing a moan that earns you a few hoots and whistles from your audience");
	if(pc.isLactating()) output(", as well as some [pc.milk]. You draw your [pc.milkNoun] covered finger up to your [pc.lips] and suckle on it for a bit before returning it back to your [pc.nipple]. You spend a while milking each of your [pc.breasts], drinking whatever doesn’t end up on the floor");
	output(". After enjoying your [pc.fullChest] enough, you give them a final squeeze");
	if(pc.hasBreasts()) output(" which sends them bouncing when you release");
	output(".");
	output("\n\nYou caress every inch of your body as you move your hands down to your crotch.");
	if(pc.hasCock()) output(" With one hand you take hold of your [pc.biggestCock] and give it a few tugs, along with a few pelvic thrusts and grunts that entrance the cock-lovers in your audience.");
	if(pc.hasVagina()) output(" A hand reaches down to your mons and with a single digit you circle [pc.eachClit]. To the tune of a few soft moans, you dig into [pc.oneVagina] and sensually finger fuck yourself, " + (pc.isSquirter() ? "as waves of [pc.girlCum] gush out of you" : "soaking your probing fingers with [pc.girlCum]") + ". Every now and then you bring your finger to your [pc.lips] and taste your [pc.girlCumFlavor] [pc.girlCumNoun].");
	output(" You lose yourself in the hodge podge of feelings that wash over you as you pleasure yourself in front of all the " + pcLocation + " residents you managed to bring here. But alas, you did not start this to bring yourself to orgasm. All you want is to expose as much of yourself to as many people as possible. You can’t be selfish, you <i>have</i> to continue the show...");
	output("\n\nAfter taking a few breaths to recollect your thoughts, you slowly bend at the waist to reveal the last bit of you yet to be fully exposed. With a light slap to your [pc.ass], you hold both buttcheeks and spread them out,");
	if(pc.hasTail() && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output(" [pc.eachTail] writhing wildly in the process,");
	output(" revealing your [pc.asshole] to the entrapped audience. " + (pc.ass.wetness() > 3 ? "You slide a finger inside" : "You force a finger in") + " and begin to slowly fuck your butthole, accompanied by involuntary thrusts from your [pc.hips] and pleasured whimpers. Soon you follow with a second finger and up your rhythm. Once you have spent a few minutes pleasuring your [pc.asshole], you bring yourself back up and prepare to address your audience.");
	output("\n\nYou take a look at the horny faces fixated on your body and can’t help but feel elated. The host of cameras capturing every scene of your slutty show reminds you of how your actions will be shared all over the extranet, and of the number of people who will masturbate watching you debase yourself. That thought alone clouds your mind with lust and pushes your urge to please the gathered strangers further. " + (!voluntary ? "How could you ever bring yourself to avoid all the pleasures of exposing yourself for so long?" : "<i>This</i> is what you live for") + "!");
	output("\n\nIt takes a moment for you to properly focus before you begin to speak. You ask the audience to share their opinions on what they saw, sending them into a frenzy as they shout all sorts of things at you. Cocktease, whore, good [pc.boy] and everything in between, and you don’t disagree with them, you can’t... after all you are here to be everything they want you to be. Once they calm down a little, you tell them just that, and strike up as many sexy poses as you can, letting them sear your image into their memories and devices to their hearts’ content.");
	if(pcLocation != "Tavros Station")
	{
		output("\n\nA few more minutes pass until you are satisfied with how much you put out, still in full display for anyone’s pleasure. You gather your gear and prepare to go on your way hornier than ever, thanking everyone for such a wonderful time.");
	}
	else
	{
		var isMan:Boolean = (rand(2) == 1);
		
		output("\n\nYou see a " + (isMan ? "man" : "woman") + " in Tavros security uniform approach you slowly with a stern expression... uh’oh. " + (isMan ? "He" : "She") + " looks you up and down with scathing eyes and using a gruff voice utters: <i>“You know public nudity is illegal on Tavros, don’t you?”</i>");
		output("\n\nMany of the voyeurs slyly scatter away, as your heart sinks to your feet. What did you get yourself into?");
		output("\n\n<i>“I will let it slide, this time.”</i> " + (isMan ? "He" : "She") + " continues without giving you a chance to respond, handing you a folded piece of paper that " + (isMan ? "he" : "she") + " just scribbled something on. <i>“You will have to take this warning though.”</i>");
		output("\n\nYou take the warning and notice " + (isMan ? "a bulge in his pants" : "her nipples poking through her shirt") + ". Wait a minute... you are pretty sure you saw " + (isMan ? "him" : "her") + " snap a few pictures of you. You unfold the piece of paper to read it, but instead of a warning you find something very different. <i>“Nice assets!”</i> Is written in large handwriting followed by a phone number.");
		if(pc.isNice()) output(" <i>Awww...</i> that is pretty sweet!");
		else if(pc.isMischievous()) output(" Well played... " + (isMan ? "he" : "she") + " seems like a <i>fun</i> fling.");
		else output(" That sleazy " + (isMan ? "asshole" : "bitch") + "!");
		output("\n\nBy now the cop has disappeared, barring you from a chance to respond, so you gather your gear and depart with a satisfied skip in your steps.");
		
		processTime(5);
	}
	
	// Set lust to 50%
	// +20-30 mins
	processTime(20 + rand(11));
	
	pc.changeLust(50);
	pc.exhibitionism(1);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

