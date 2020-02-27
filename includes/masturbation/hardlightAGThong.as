/*

Mechanics
Overview: 
The PC can access the HL Panty through a button in the interact menu. 
There they can toggle whether to have their vagina(s)/ass/both/neither filled with dildos. A flag to track the number of dildos active might be useful.
By default everything is off. Taking the thong off resets to the default settings.
Filled holes will not tighten.
Lust gain over time is increased for each dildo.
Additionally, the dildos can be set to vibrate.
If vibrating, doubles the per dildo lust gain and increases exhibitionism over time.
Turning off the last dildo automatically turns off vibration, scene doesn’t trigger though.

Lust gain over time: I am not sure how much is reasonable but I’d say 1/min/dildo, doubled with vibration.
Exhibitionism gain over time: No clue what is reasonable, but its gains should cap when at 80 exhibitionism and should only apply if in civilization.

*/

public function isWearingHardlightAGThong():Boolean
{
	return (pc.lowerUndergarment is HardlightAGThong && pc.hasStatusEffect("HL Thong"));
}
// Interact Menu
// Below the “What do you wish to interact with?” line. Only appears if worn.
public function hardlightAGThongBonus(btnSlot:int):String
{
	var bonusText:String = "\n\nYou are reminded of your snugly fitting hardlight anti-grav thong";
	// if any dildo on:
	if(hardlightAGThongDildo()) bonusText += " that currently fills your insides";
	bonusText += ". Maybe you can play around with its settings?";
	
	addButton(btnSlot, (pc.lowerUndergarment.shortName), hardlightAGThongMenu, undefined, StringUtil.toDisplayCase(pc.lowerUndergarment.longName), "Interact with your hardlight anti-grav thong.");
	
	return bonusText;
}
// HL Panty
// Displays current status and the toggle buttons
public function hardlightAGThongDildoVag():Boolean
{
	return (pc.hasVagina() && pc.statusEffectv1("HL Thong") != 0);
}
public function hardlightAGThongDildoAss():Boolean
{
	return (pc.statusEffectv2("HL Thong") != 0);
}
public function hardlightAGThongDildo():Boolean
{
	return (hardlightAGThongDildoAss() || hardlightAGThongDildoVag());
}
public function hardlightAGThongDildoVibe():Boolean
{
	return (hardlightAGThongDildo() && pc.statusEffectv3("HL Thong") != 0);
}
public function hardlightAGThongMenu():void
{
	clearOutput();
	author("AHornyPanda");
	showBust("");
	showName("HARDLIGHT\nTHONG");
	
	var vagDildo:Boolean = hardlightAGThongDildoVag();
	var assDildo:Boolean = hardlightAGThongDildoAss();
	var vibrator:Boolean = hardlightAGThongDildoVibe();
	
	output("<b><u>Current Status</u></b>");
	output("\n<b>* Vagina Dildo:</b> " + (vagDildo ? "ON" : "OFF"));
	output("\n<b>* Ass Dildo:</b> " + (assDildo ? "ON" : "OFF"));
	output("\n<b>* Vibration:</b> " + (vibrator ? "ON" : "OFF"));
	
	clearMenu();
	if(!pc.hasVagina()) addDisabledButton(0, "Vag: OFF", "Vagina Dildo", "You need a vagina to try this!");
	else addButton(0, ("Vag: " + (vagDildo ? "ON" : "OFF")), hardlightAGThongToggle, "cunt", "Vagina Dildo", ("Turn " + (!vagDildo ? "on" : "off") + " the vagina dildo."));
	addButton(1, ("Ass: " + (assDildo ? "ON" : "OFF")), hardlightAGThongToggle, "butt", "Ass Dildo", ("Turn " + (!assDildo ? "on" : "off") + " the ass dildo."));
	if(!vagDildo && !assDildo) addDisabledButton(2, "Vibr: OFF", "Vibration", "You need a dildo to be active to try this!");
	else addButton(2, ("Vibr: " + (vibrator ? "ON" : "OFF")), hardlightAGThongToggle, "vibe", "Vibration", ("Turn " + (!vibrator ? "on" : "off") + " dildo vibration."));
	addButton(14, "Back", itemInteractMenu);
}
public function hardlightAGThongToggle(option:String = "none"):void
{
	clearOutput();
	author("AHornyPanda");
	showBust("");
	showName("HARDLIGHT\nTHONG");
	
	var thongEffect:StorageClass = pc.getStatusEffect("HL Thong");
	
	switch(option)
	{
		case "cunt":
			if(thongEffect.value1 == 0)
			{
				output("You find yourself a seat and click the button labeled “vagina,” instantly feeling something poke at [pc.oneVagina]. Soon enough the hardlight nub grows");
				if(pc.vaginas.length != 1) output(" and you feel more poke at your other vagina" + (pc.vaginas.length == 2 ? "" : "s") + ",");
				output(" tantalizingly teasing [pc.eachVagina] into a sopping mess in preparation for the impending penetration. Over the course of a few seconds the thin dildo");
				if(pc.vaginas.length != 1) output("s");
				output(", rapidly growing, pierce");
				if(pc.vaginas.length == 1) output("s");
				output(" your cunt");
				if(pc.vaginas.length != 1) output("s");
				output(" until " + (pc.vaginas.length == 1 ? "it reaches your cervix, poking your womb" : "they reache your cervices, poking your wombs") + ". Before you can manage to get accustomed to the feeling though, the hardlight shaft" + (pc.vaginas.length == 1 ? " begins" : "s begin") + " to expand, pushing into [pc.eachVagina]’s walls until " + (pc.vaginas.length == 1 ? "it reaches" : "they reach") + " a girth that makes sure you are filled to the brim with hardlight dick, though without the danger of becoming too loose.");
				output("\n\nOnce you are certain that " + (pc.vaginas.length == 1 ? "it is" : "they are") + " done growing, you bring yourself to your [pc.feet] and experimentally move around, savoring the feeling of the dildo" + (pc.vaginas.length == 1 ? "" : "s") + " rubbing your insides. <i>This will be fun</i>.");
				// +10 lust/vagina
				// +2 mins
				processTime(2);
				pc.changeLust(10 * pc.vaginas.length);
			}
			else
			{
				output("That was fun, but it is time to relieve your vagina");
				if(pc.vaginas.length != 1) output("s");
				output(" from the constant teasing. You reach for the “vagina” button and click it. The dildo");
				if(pc.vaginas.length != 1) output("s");
				output(" lodged within you recede");
				if(pc.vaginas.length == 1) output("s");
				output(" leaving behind a feeling of disappointing hollowness. Once your thong is done shutting down the projection, you continue on your way.");
			}
			thongEffect.value1 = (thongEffect.value1 != 0 ? 0 : 1);
			break;
		case "butt":
			if(thongEffect.value2 == 0)
			{
				output("You find yourself a seat and click the button labeled “ass”, instantly feeling something poke at your [pc.asshole]. The nub grows slowly into a thin 10 inch hardlight dildo, piercing your asshole in the process. Before you can manage to get accustomed to the feeling though, the dildo begins to expand, pushing into your anal walls. It doesn’t stop until it reaches a girth that makes sure your bowels are filled to the brim with hardlight dick, though without the danger of becoming too loose.");
				output("\n\nOnce you are certain that it is done growing, you bring yourself to your [pc.feet] and experimentally move around, savoring the feeling of the dildo shuffling inside you. <i>This will be fun</i>.");
				// +10 lust
				// +2 mins
				processTime(2);
				pc.changeLust(10);
			}
			else
			{
				output("That was fun, but it is time to relieve your [pc.asshole] from the constant teasing. You reach for the “ass” button and click it. The dildo lodged within you recedes leaving behind a feeling of disappointing hollowness. Once your thong is done shuffling you continue on your way.");
			}
			thongEffect.value2 = (thongEffect.value2 != 0 ? 0 : 1);
			break;
		case "vibe":
			var vagDildo:Boolean = hardlightAGThongDildoVag();
			var assDildo:Boolean = hardlightAGThongDildoAss();
			var numDildos:int = 0;
			if(vagDildo) numDildos += pc.vaginas.length;
			if(assDildo) numDildos += 1;
			
			if(thongEffect.value3 == 0)
			{
				// If selected while at 100% lust go to vibration orgasm scene
				if(pc.lustQ() >= 100)
				{
					thongEffect.value3 = 1;
					hardlightAGThongOrgasm();
					return;
				}
				
				output("You find yourself a seat in a secluded area, mentally preparing yourself for what comes next, then click the button labeled “vibration.” Slowly, you feel a slight vibration build up in " + (numDildos == 1 ? "the dildo" : "each of the dildos") + " stuffing you, sensually massaging you from the inside out. The vibrations reach a soft, steady rhythm that deeply relaxes you over the next few minutes, but although you find the <i>deep</i> massage pleasant, it begins to leave you a little disappointed.");
				if(flags["HARDLIGHT_AG_THONG_VIBE"] == undefined) output(" You kind of expected more when you switched it on.");
				output("\n\nYou don’t get to ponder that thought long though...");
				output("\n\nWithout any sort of warning the intensity of the vibrations leaps forward several magnitudes, creating quakes of pleasure that shake your very being and probably would have brought you to your knees if you weren’t already seated. The burst of pleasure you are still experiencing has almost instantly turned your");
				if(pc.hasGenitals())
				{
					if(pc.hasCock()) output(" [pc.cocks] rock-solid");
					if(pc.isHerm()) output(" and your");
					if(pc.hasVagina()) output(" [pc.cunts] into a " + (!pc.isSquirter() ? "drooling" : "gushing") + " mess");
				}
				else output(" [pc.asshole] into a spasming mess");
				output(". You find your hands caressing your entire body as if they had minds of their own, savoring the sensations rippling through it.");
				output("\n\n");
				if(vagDildo && assDildo) output("As the dildos stuffing your every hole continue their merciless assault on your insides, the pleasure already quaking your entire body only intensifies. Your vision blurs as your eyes roll into your head, while your mouth hangs wide open, leaving you drooling and moaning without a care in the galaxy. You are essentially the splitting image of pure bliss. At this rate you fear normal sex may not satisfy you anymore.");
				else if(vagDildo) output("The blissful stimulation by the dildo" + (pc.vaginas.length == 1 ? "" : "s") + " lodged in [pc.eachVagina] has created " + (!pc.isSquirter() ? "an endless waterfall of [pc.girlCum] down your [pc.thighs]" : "an ever-growing pool of [pc.girlCum] beneath you") + ".");
				else if(assDildo) output("Meanwhile, your [pc.asshole] has been twitching around the dildo thoroughly plugging it, lewdly attempting to milk it.");
				output("\n\nFeeling an orgasm draw near");
				if(vagDildo && assDildo) output(", and a powerful one at that");
				output(", you brace yourself for impact... but nothing comes; the vibrations simply die down as suddenly as they showed up. You desperately clasp your hand onto the thong seeking");
				if(vagDildo && assDildo) output(", no, <b>begging</b> it for any sort of");
				output(" release... but nothing. Ugh, what kind of perverted genius would create something like this?!");
				output("\n\nYou wait for your lust to calm down a little");
				if(vagDildo && assDildo) output(", and wipe the drool of your face,");
				output(" then head on your way. Soon, a very soft vibration brings your hardlight thong back to life. Every step you take is followed by a pleasurable wobble, every motion you make elicits a soft whimper from you. You start to get the feeling that the vibration’s intensity will randomly cycle, forcing you to react in all sorts of ways.");
				if(InPublicSpace(pc))
				{
					output(" There is no doubt that people around you will eventually notice your perversion. The mere thought of the public show you will perform grips your mind with a sense of");
					if(pc.exhibitionism() >= 66) output(" wanton lust");
					else if(pc.exhibitionism() >= 33) output(" excitement");
					else output(" dread");
					output(".");
				}
				output(" <i>This will be one hell of a wild ride</i>.");
				// +20 lust, if both dildoed, +30 instead
				// If both dildoed, -30 energy
				// +15 mins, if both dildoed, +7 instead
				if(vagDildo && assDildo)
				{
					processTime(15);
					pc.changeLust(30);
					pc.energy(-30);
				}
				else
				{
					processTime(7);
					pc.changeLust(20);
				}
			}
			else
			{
				output("That was a lot of fun but it is time you turned off the thong, and let yourself rest. You reach for the “vibration” button and click it. The vibrations die down and your insides breathe a sigh of relief. Well, as much as they can really, you are still stuffed with " + (numDildos == 1 ? "a hardlight cock" : "hardlight cocks") + " after all.");
			}
			thongEffect.value3 = (thongEffect.value3 != 0 ? 0 : 1);
			break;
	}
	
	// Turn off vibration if no dildos present.
	if(thongEffect.value1 == 0 && thongEffect.value2 == 0 && thongEffect.value3 != 0) thongEffect.value3 = 0;
	
	clearMenu();
	addButton(0, "Next", hardlightAGThongMenu);
}

// Blurbs
// pick at random the applicable ones
public function processHardlightAGThongBlurbs(deltaT:uint, doOut:Boolean):void
{
	// Not wearing thong? Abort!
	if(!isWearingHardlightAGThong()) return;
	
	var vagDildo:Boolean = hardlightAGThongDildoVag();
	var assDildo:Boolean = hardlightAGThongDildoAss();
	var vibrator:Boolean = hardlightAGThongDildoVibe();
	var numDildos:int = 0;
	if(vagDildo) numDildos += pc.vaginas.length;
	if(assDildo) numDildos += 1;
	
	// No dildos? Nothing happens.
	if(numDildos <= 0) return;
	
	// Lust gain
	var minPass:int = deltaT;
	var lustGain:int = numDildos;
	if(vibrator) lustGain *= 2;
	if(minPass < 1) minPass = 1;
	pc.lust(lustGain * minPass);
	
	// Blurbs
	if(rand(25) == 0 && !pc.hasStatusEffect("HL Thong Message Delay"))
	{
		var inPublic:Boolean = InPublicSpace(pc);
		var exhibitionism:Number = pc.exhibitionism();
		
		var msg:String = "";
		var msgList:Array = [];
		
		if(!vibrator)
		{
			// Any dildos on, no vibrations
			if(pc.lustQ() < 50)
			{
				msgList.push("As you move around, the dildo" + (numDildos == 1 ? "" : "s") + " plugging you up shuffle around, reminding you of " + (numDildos == 1 ? "its" : "their") + " existence and arouse you a little everytime " + (numDildos == 1 ? "it" : "they") + " stimulate your sweet spots.");
			}
			else if(pc.lustQ() < 100)
			{
				msgList.push("The fullness you feel, the continuous fucking with every movement, the slowness of it all... Void you are starting to get <i>so</i> turned on.");
				msgList.push("The hardlight cock" + (numDildos == 1 ? "" : "s") + " lodged into your depths " + (numDildos == 1 ? "is" : "are") + " starting to drive you mad with lust.");
			}
			
			// Vagina dildo on, no vibrations
			// can be triggered even if ass dildo is also on
			if(vagDildo)
			{
				if(pc.lustQ() < 50)
				{
					msgList.push("As you attempt to go about your day normally, the dildo" + (pc.vaginas.length == 1 ? "" : "s") + " poking at your cervi" + (pc.vaginas.length == 1 ? "x" : "ces") + " continue" + (pc.vaginas.length == 1 ? "s" : "") + " to tease you.");
					msgList.push("Your arousal keeps rising as the hardlight dildo" + (pc.vaginas.length == 1 ? "" : "s") + " in your [pc.vaginas] slowly fuck" + (pc.vaginas.length == 1 ? "s" : "") + " you with every movement you make.");
					msgList.push("The constant feeling of having [pc.eachVagina] completely stuffed only serves to turn you on even more with time.");
				}
				else if(pc.lustQ() < 100)
				{
					msgList.push("The sensual fuck [pc.eachVagina] is experiencing " + (!pc.isSquirter() ? "dampens your crotch with [pc.girlCum]" : "turns your crotch into a drenched mess of [pc.girlCum]") + ".");
					msgList.push("Your [pc.cunts] " + (pc.vaginas.length == 1 ? "is" : "are") + " convulsing lewdly around your thong’s hardlight cock" + (pc.vaginas.length == 1 ? "" : "s") + ", trying to milk out seed " + (pc.vaginas.length == 1 ? "it" : "they") + " will never produce.");
				}
				else
				{
					msgList.push("The hardlight dick" + (pc.vaginas.length == 1 ? "" : "s") + " have slowly but surely fucked your [pc.pussies] into maximum arousal... but that’s not enough to give you the release you now crave.\n\nMaybe that button marked “vibration” will help?");
					msgList.push("Your face is flush with arousal and [pc.eachVagina] is " + (!pc.isSquirter() ? "a deluge of [pc.girlCum]" : "drooling a river of [pc.girlCum]") + ".\n\nYour thong has successfully turned you into a horny mess, now you have to find a way to sate your lust.");
				}
			}
			// Ass dildo on, no vibrations
			// can be triggered even if vagina dildo is also on
			if(assDildo)
			{
				if(pc.lustQ() < 50)
				{
					msgList.push("As you attempt to go about your day normally, the dildo spearing your [pc.asshole] continues to tease you.");
					msgList.push("Your arousal keeps rising as the hardlight dildo in your [pc.asshole] slowly fucks you with every movement you make.");
					msgList.push("The constant feeling of having your bowels completely stuffed only serves to turn you on even more with time.");
				}
				else if(pc.lustQ() < 100)
				{
					msgList.push("The sensual fuck your [pc.asshole] is experiencing" + (pc.ass.wetness() <= 3 ? "" : " dampens your ass and") + " pushes your excitement further with time.");
					msgList.push("Your [pc.asshole] is softly spasming around the hardlight dick plugging it, turning you on even further.");
				}
				else
				{
					msgList.push("The hardlight dick has slowly but surely fucked your [pc.asshole] into maximum arousal... but that’s not enough to give you the release you now crave.\n\nMaybe that button marked “vibration” will help?");
					msgList.push("Your face is flush with arousal and your" + (pc.ass.wetness() <= 3 ? "" : " drenched") + " asshole is now violently convulsing around the hardlight dildo.\n\nYour thong has successfully turned you into a horny mess, now you have to find a way to sate your lust.");
				}
			}
			// Both dildos on, no vibrations
			if(vagDildo && assDildo)
			{
				if(pc.lustQ() < 50)
				{
					msgList.push("With every motion you make, the dildos within you take turns gently " + (numDildos == 2 ? "double" : "multi") + " penetrating you, turning you on with time.");
					msgList.push("The dildos stuffing you rub against each other inside you with every movement you make, endlessly teasing you.");
				}
				else if(pc.lustQ() < 100)
				{
					msgList.push("Every time the hardlight dicks lodged in your [pc.cunts] and [pc.asshole] rub against each other, you get more and more riled up.");
					msgList.push("Your stuffed holes grip tightly against the hardlight dildos within them, trying to tighten but to no avail. Your body just keep getting hotter.");
					msgList.push("The sensual fuck your [pc.asshole] and [pc.eachVagina] are experiencing " + (!pc.isSquirter() ? "dampen your crotch with [pc.girlCum]" : "turn your crotch into a drenched mess of [pc.girlCum]") + ".");
				}
				else
				{
					msgList.push("The hardlight dicks have rhythmically fucked your [pc.pussies] and [pc.asshole] into maximum arousal... but that’s not enough to give you the release you now crave.\n\nMaybe that button marked “vibration” will help?");
					msgList.push("Your face is flush with arousal, [pc.eachVagina] is " + (!pc.isSquirter() ? "a deluge of [pc.girlCum]" : "drooling a river of [pc.girlCum]") + " and your" + (pc.ass.wetness() <= 3 ? "" : " drenched") + " asshole is now violently convulsing around its hardlight dildo.\n\nYour thong has successfully turned you into a horny mess, now you have to find a way to sate your lust.");
				}
			}
		}
		else
		{
			// Any dildos on, with vibrations
			if(pc.lustQ() < 50)
			{
				msgList.push("As you move around, the dildo" + (numDildos == 1 ? "" : "s") + " plugging you up shuffle around, " + (numDildos == 1 ? "its" : "their") + " random vibrations making you unstable, arousing you every time " + (numDildos == 1 ? "it" : "they") + " stimulate your sweet spots.");
				msg += "A sudden burst in the intensity of the vibrations in your dildo" + (numDildos == 1 ? "" : "s") + " causes you to let out a yelp, while at the same time turning your [pc.legs] to jelly, almost bringing you to your knees.";
				if(inPublic)
				{
					msg += " A few passersby notice that something might be wrong and approach with concern, but a look at your flushed face puts them at ease, even drawing smirks from a few of them.";
					if(exhibitionism >= 66) msg += " You revel in the attention, rubbing your [pc.chest] to return the favor, granting you a few cheers from the audience you have drawn.";
					else if(exhibitionism >= 33) msg += " You blush deeply at the attention, stalling a bit before moving on.";
					else msg += " Your face turns beet red with embarrassment and you rush away from them, looking down at your feet.";
				}
				msgList.push(msg);
				msg = "";
				msgList.push("A soft vibration from the hardlight dildo" + (numDildos == 1 ? "" : "s") + " stuffing you is currently massaging your insides, sending soft moans" + (exhibitionism < 33 ? ", that you meekly try to hold back" : "") + " through your [pc.lips]." + (inPublic ? " You notice a mix of stares, smirks, winks, and giggles from a few people surrounding you every time you moan." : ""));
			}
			else if(pc.lustQ() < 100)
			{
				msgList.push("The fullness you feel, the continuous fucking with every movement, the eyes turning towards you, the intensity of it all... Void you are starting to get <i>so</i> turned on.");
				msg += "The vibrating hardlight cock" + (numDildos == 1 ? "" : "s") + " lodged into your depths " + (numDildos == 1 ? "is" : "are") + " starting to drive you mad with lust. Soft moans occasionally escape your [pc.lips]";
				if(inPublic)
				{
					msg += ", turning the heads of passersby towards you";
					if(exhibitionism >= 66) msg += ", sending waves of delight through you as you try your hardest to make eye contact with them";
					else if(exhibitionism >= 33) msg += " and turning you further on";
					else msg += ", no matter how hard you try to hold them back";
				}
				msgList.push(msg);
				msg = "";
				if(inPublic) msgList.push("lust");
				else msgList.push("A sudden burst in the intensity of the vibrations in your dildo" + (numDildos == 1 ? "" : "s") + " causes you to let out a loud yelp, while turning your [pc.legOrLegs] to jelly, bringing you to your knees in a daze of pleasure.");
				msgList.push("A soft vibration from the hardlight dildo" + (numDildos == 1 ? "" : "s") + " stuffing you is currently massaging your insides, sending constant moans" + (exhibitionism < 33 ? ", that you gave up on trying to hold back" : "") + " through your [pc.lips]." + (inPublic ? " You notice a mix of stares, smirks, winks, and giggles from the people surrounding you every time you moan." : ""));
			}
			else
			{
				msgList.push("orgasm");
			}
			
			// Vagina dildo on, with vibrations
			// can be triggered even if ass dildo is also on
			if(vagDildo)
			{
				if(pc.lustQ() < 50)
				{
					msgList.push("Soft vibrations massage [pc.eachVagina] insideout. Combined with the dildo" + (pc.vaginas.length == 1 ? "’s" : "s’") + " constant shuffling, soft moans" + (exhibitionism < 33 ? " you shyly try to hold back" : "") + " escape you.");
					msgList.push("Your stuffed [pc.cunts] " + (pc.vaginas.length == 1 ? "is" : "are") + " being kept on edge as the vibrations alternate in intensity. Your movements vary in shakiness and so does your voice under the consistent teasing.");
					msg += "The hardlight cock" + (pc.vaginas.length == 1 ? "" : "s") + " filling [pc.eachVagina] suddenly vibrate" + (pc.vaginas.length == 1 ? "s" : "") + " with vigor. You moan loudly and your movements become even shakier.";
					if(inPublic)
					{
						msg += " Heads turn towards you, sending shivers of";
						if(exhibitionism >= 66) msg += " pure lust";
						else if(exhibitionism >= 33) msg += " excitement";
						else msg += " embarrassment";
						msg += " down your spine.";
					}
					msgList.push(msg);
					msg = "";
				}
				else if(pc.lustQ() < 100)
				{
					msgList.push("Soft vibrations massage [pc.eachVagina] insideout. Combined with the dildo" + (pc.vaginas.length == 1 ? "’s" : "s’") + " constant shuffling, soft moans" + (exhibitionism < 33 ? " you gave up on holding back" : "") + " escape you. You are starting to get <i>really</i> riled up.");
					msgList.push("Your stuffed [pc.cunts] " + (pc.vaginas.length == 1 ? "is" : "are") + " " + (!pc.isSquirter() ? "damp" : "drooling") + " with excitement as the vibrations alternate in intensity. Your movements are all over the place and so is your voice under the merciless teasing.");
					msg += "The hardlight cock" + (pc.vaginas.length == 1 ? "" : "s") + " filling [pc.eachVagina] suddenly vibrate" + (pc.vaginas.length == 1 ? "s" : "") + " with vigor. You moan " + (exhibitionism >= 66 ? "whorishly" : "loudly") + " and stumble about as you try to move.";
					if(inPublic)
					{
						msg += " Heads turn towards you, sending you into a";
						if(exhibitionism >= 66) msg += " frenzy of pure lust";
						else if(exhibitionism >= 33) msg += " state of elevated excitement";
						else msg += " desperate attempt of hiding your excitement";
						msg += " as intense pleasure pulses through you.";
					}
					msgList.push(msg);
					msg = "";
				}
			}
			// Ass dildo on, with vibrations
			// can be triggered even if vagina dildo is also on
			if(assDildo)
			{
				if(pc.lustQ() < 50)
				{
					msgList.push("Soft vibrations massage your bowels. Combined with the dildo’s constant shuffling in your [pc.asshole], soft moans" + (exhibitionism < 33 ? " you shyly try to hold back" : "") + " escape you.");
					msgList.push("Your stuffed [pc.asshole] is being kept on edge as the vibrations alternate in intensity. Your movements vary in shakiness and so does your voice under the consistent teasing.");
					msg += "The hardlight cock filling your [pc.asshole] suddenly vibrates with vigor. You moan loudly and your movements become even shakier.";
					if(inPublic)
					{
						msg += " Heads turn towards you, sending shivers of";
						if(exhibitionism >= 66) msg += " pure lust";
						else if(exhibitionism >= 33) msg += " excitement";
						else msg += " embarrassment";
						msg += " down your spine.";
					}
					msgList.push(msg);
					msg = "";
				}
				else if(pc.lustQ() < 100)
				{
					msgList.push("Soft vibrations massage your bowels. Combined with the dildo’s constant shuffling, soft moans" + (exhibitionism < 33 ? " you gave up on holding back" : "") + " escape you. You are starting to get <i>really</i> riled up.");
					msgList.push("Your stuffed [pc.asshole] is " + (pc.ass.wetness() <= 3 ? "twitching" : "drooling") + " with excitement as the vibrations alternate in intensity. Your movements are all over the place and so is your voice under the merciless teasing.");
					msg += "The hardlight cock filling your [pc.asshole] suddenly vibrates with vigor. You moan " + (exhibitionism >= 66 ? "whorishly" : "loudly") + " and stumble about as you try to move.";
					if(inPublic)
					{
						msg += " Heads turn towards you, sending you into a";
						if(exhibitionism >= 66) msg += " frenzy of pure lust";
						else if(exhibitionism >= 33) msg += " state of heightened excitement";
						else msg += " desperate attempt of hiding your excitement";
						msg += " as intense pleasure pulses through you.";
					}
					msgList.push(msg);
					msg = "";
				}
			}
			// Both dildos on, with vibrations
			if(vagDildo && assDildo)
			{
				if(pc.lustQ() < 50)
				{
					msgList.push("With every motion you make, the vibrating dildos stuffing your every hole take turns mercilessly " + (numDildos == 2 ? "double" : "multi") + " penetrating you, driving you crazy with desire.");
					msg += "Marked by a yelp and a wobble, your hardlight dildos vibrate with vigor, putting you in a state of endless excitement.";
					if(inPublic)
					{
						msg += " You feel the eyes of passersby enjoy your ordeal, sending shivers of";
						if(exhibitionism >= 66) msg += " pure lust";
						else if(exhibitionism >= 33) msg += " excitement";
						else msg += " embarrassment";
						msg += " down your spine.";
					}
					msgList.push(msg);
					msg = "";
					msgList.push("Soft vibrations massage your [pc.pussies] and [pc.asshole] from the inside out. You moan softly, savouring the heavenly sensation" + (inPublic ? " and giving passersby a free show" : "") + ".");
				}
				else if(pc.lustQ() < 100)
				{
					msgList.push("Every time the vibrating hardlight dicks lodged in your [pc.cunts] and [pc.asshole] rub against each other, you are thrown into an even higher level of bliss.");
					msg += "Your stuffed holes grip tightly against the hardlight dildos within them, trying to tighten, only to be met by more intense vibrations. Meanwhile, all you can do is moan with pleasure every time that happens";
					if(inPublic)
					{
						msg += ", bringing some of the attention";
						if(exhibitionism >= 66) msg += " you crave";
						else if(exhibitionism >= 33) msg += " you enjoy";
						else msg += " you shy from";
						msg += " towards you";
					}
					msg += ".";
					msgList.push(msg);
					msg = "";
					msg += "The merciless fucking your [pc.asshole] and [pc.eachVagina] are experiencing " + (!pc.isSquirter() ? "dampen your crotch with [pc.girlCum]" : "turn your crotch into a drenched mess of [pc.girlCum]") + ". You have a hard time focusing on anything other than the pleasure you are experiencing, drawing an easy to recognize expression on your face.";
					if(inPublic)
					{
						if(exhibitionism >= 66) msg += " You make sure that everyone passing by you enjoys the show of your perversion.";
						else if(exhibitionism >= 33) msg += " Everytime someone takes a look at you, a shiver of excitement grips you and you get hornier.";
						else msg += " Your face blushes with a mix of excitement and embarrassment as you try, and fail, to hold back your perversion from reaching the public eye.";
					}
					msgList.push(msg);
					msg = "";
				}
			}
		}
		
		if(msgList.length > 0)
		{
			var msgIdx:int = rand(msgList.length);
			
			if(msgList[msgIdx] == "orgasm") { if(eventQueue.indexOf(hardlightAGThongOrgasm) == -1) eventQueue.push(hardlightAGThongOrgasm); }
			else if(msgList[msgIdx] == "lust") { if(eventQueue.indexOf(hardlightAGThongLust) == -1) eventQueue.push(hardlightAGThongLust); }
			else if(msgList[msgIdx] != "") AddLogEvent(msgList[msgIdx], "passive", deltaT);
			
			// Maybe an hour delay between reports.
			if(msgList[msgIdx] != "") pc.createStatusEffect("HL Thong Message Delay", 0, 0, 0, 0, true, "", "", false, (1 * 60));
		}
	}
	
	return;
}
public function hardlightAGThongLust():void
{
	clearOutput();
	author("AHornyPanda");
	showBust("");
	showName("HARDLIGHT\nTHONG");
	
	var vagDildo:Boolean = hardlightAGThongDildoVag();
	var assDildo:Boolean = hardlightAGThongDildoAss();
	var vibrator:Boolean = hardlightAGThongDildoVibe();
	var numDildos:int = 0;
	if(vagDildo) numDildos += pc.vaginas.length;
	if(assDildo) numDildos += 1;
	
	var inPublic:Boolean = InPublicSpace(pc);
	var exhibitionism:Number = pc.exhibitionism();
	
	output("A sudden burst in the intensity of the vibrations in your dildo" + (numDildos == 1 ? "" : "s") + " causes you to let out a loud yelp, while turning your [pc.legOrLegs] to jelly, bringing you to your knees in a daze of pleasure.");
	if(inPublic)
	{
		output("Many passersby notice your fall and rush towards you with concern, but a look at your stunned face explains everything. You appear as nothing more than a slut having an adventure in pleasure-land. Some scoff at your debauchery and leave, but your exasperated moans draw more people into the now sizeable audience. You hear jeers and cheers shouted on top of each other and see many of the voyeurs try to snap pictures of your quivering form.");
		output("\n\n");
		if(exhibitionism >= 66) output("All that attention is clouding your mind with excitement. Without a second thought you decide to give your beloved audience a show to remember. You start to grind your [pc.hips] against your hardlight thong, releasing whorish moans of pleasure for the ever-growing crowd until the vibrations die down. You make sure to give your audience a slutty wink as you catch your breath, giving them the chance to snap a few more pictures of you.");
		else if(exhibitionism >= 33) output("You regain some control of your faculties but there is no denying it, the cheers and the eyes fixated on you only serve to turn you on more. You continue to moan as you savour the intense pleasure coursing through you, until the vibrations die down, leaving you hornier than before.");
		else output("Your mind snaps back to reality, making you realize that you are still in public. Embarrassment grips you, followed by thoughts of having to get out of there, moaning as you do. You pick yourself up and try to move, but there is no helping it, the vibrations are just too intense. You drop down once again still quivering, this time to a background of laughter from the audience who just witnessed your doomed attempt to escape. Moaning and writhing in shameful pleasure on the floor, you have no choice but to wait for the vibrations to die down.");
	}
	
	// +15 lust
	// +2 - 5 minutes
	processTime(2 + rand(4));
	pc.changeLust(15);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Vibration orgasm
// Always triggered if PC reaches 100% lust with vibrations on
public function hardlightAGThongOrgasm():void
{
	clearOutput();
	author("AHornyPanda");
	showBust("");
	showName("ORGASMIC\nVIBRATIONS!");
	
	var vagDildo:Boolean = hardlightAGThongDildoVag();
	var assDildo:Boolean = hardlightAGThongDildoAss();
	var numDildos:int = 0;
	if(vagDildo) numDildos += pc.vaginas.length;
	if(assDildo) numDildos += 1;
	
	var inPublic:Boolean = InPublicSpace(pc);
	var exhibitionism:Number = pc.exhibitionism();
	
	output("The random vibrations that have been wracking your body with pleasure for a while now are starting to push you to the point of no return.");
	if(pc.isHerm()) output(" [pc.EachCock] " + (pc.cocks.length == 1 ? "is" : "are") + " rock hard and [pc.eachVagina] " + (pc.vaginas.length == 1 ? "is" : "are") + " sopping wet");
	else if(pc.hasCock()) output(" [pc.EachCock] " + (pc.cocks.length == 1 ? "is" : "are") + " rock hard");
	else if(pc.hasVagina()) output(" [pc.EachVagina] " + (pc.vaginas.length == 1 ? "is" : "are") + " sopping wet");
	else output(" Your [pc.asshole] is pulsing with need");
	output(" as your body braces for a strong orgasm.");
	if(inPublic)
	{
		output(" You are well aware of the eyes that have been fixated on the show you’ve been making out of yourself");
		if(exhibitionism >= 66) output(" and you are about to give them a reward they deserve for sticking around with you.");
		else if(exhibitionism >= 33) output(", the prospect of having them watch you orgasm only heightens your excitement.");
		else output(", so you desperately search for a place to have your release in private before it’s too late.");
	}
	output("\n\n");
	if(inPublic && exhibitionism < 33) output("But it <i>is</i> too late, a");
	else output("A");
	output(" strong vibration pulses through the hardlight dildo");
	if(numDildos != 1) output("s");
	output(" buried deep inside you for a few seconds, bringing you instantly to your knees in a daze of bliss. Your moans, already loud, now sound even more desperate as you gyrate your hips");
	if(inPublic) output(", attracting the attention of everyone surrounding you");
	output(". You reach down with one hand, rubbing");
	if(pc.isSexless()) output(" your crotch");
	else
	{
		if(pc.hasCock()) output(" your [pc.biggestCock]");
		if(pc.isHerm()) output(" and");
		if(pc.hasVagina()) output(" your [pc.vagina]");
	}
	output(" over the hardlight restraining " + (pc.totalGenitals() <= 1 ? "it" : "them") + ". Your other hand roams your body, taking special care to caress your [pc.fullChest] in the process.");
	if(inPublic)
	{
		output(" Along with your pleasure, the eyes beholding your perversion multiply with every passing second. You see many onlookers hold up their devices, taking pictures and filming your apparent sluttiness");
		if(exhibitionism >= 66) output(" and you couldn’t be happier. You spread your [pc.legs] wider, giving your precious audience a better view of where the action is, making sure your gyrations and moans are even sluttier");
		else if(exhibitionism >= 33) output(", filling you with excitement");
		else output(", turning your face even redder with embarrassment. You have to get out of here, you shouldn’t climax in front of a crowd! Taking advantage of the dildo" + (numDildos == 1 ? "’s" : "s’") + " slowed stimulations you scramble up and attempt to move away");
		output(". Jeers and cheers shoot out of the audience growing around you, and you are pretty sure you saw a few of them touch themselves.");
	}
	output("\n\nAnother strong vibration bursts through the hardlight cock");
	if(numDildos != 1) output("s");
	output(" stuffing you, this time persisting. The intense stimulation takes away any control you might have had over your body, forcing your [pc.eyes] into your head, and causing your mouth to gape open. Drool leaks from the corners of your mouth and you let your [pc.tongue] hang outside. Your body is now quivering to the tune of the vibrations pulsating from your crotch, like a hand puppet, except you are being controlled by hardlight cock");
	if(numDildos != 1) output("s");
	output(".");
	if(inPublic)
	{
	output("\n\n");
		if(exhibitionism >= 66) output("Your gyrations are now wild and erratic. Your arms flail around, desperately trying to clasp onto something, anything. Whorish moans escape you unchecked. Your drooling face appears as nothing more than an expression of pure, blissful debauchery. Yet you muster every bit of energy you still have in you and beg your precious audience through your moans. You beg them to savour every inch of your body, every movement and twist you make. You beg them to film, to take pictures, and to share in every moment of your perversion. You beg them to call you a slut, a whore, and anything else they desire. You <i>are</i> here to entertain them after all. Although shocked by your announcement, it only takes a few moments for the crowd to turn rowdy and oblige every single one of your wishes, bringing you within a hair’s breadth of the orgasm you crave.");
		else if(exhibitionism >= 33) output("The eyes and cameras fixated on your writhing form push you into a sort of exhibitionistic frenzy. With your mind drowning in an ocean of pleasure, the dazed expression drawn on your face somehow manages to become even sluttier, because you hear the cheers around you grow louder as you sink deeper into bliss. Your gyrations and moans grow erratic to a background of jeers and cheers with every passing moment. Your much desired orgasm is almost here.");
		else output("Naturally, your attempt to escape failed miserably against the merciless pleasure your hardlight thong is imposing on you. Much to your dismay though, your failed escape only brought you more attention, make your audience larger and rowdier. A look at the dazed expression drawn on your face has the crowd surrounding you shouting “slut”, “whore”, “perv” and more at your quivering form, still filming you throughout. Embarrassed and ashamed, you try to retort but all that escapes you are endless moans of pleasure, as you get ever closer to a powerful orgasm.");
	}
	output("\n\n");
	if(inPublic && exhibitionism < 33) output("You don’t care about the crowd surrounding you anymore, you <i>need</i> this orgasm. ");
	else if(inPublic && exhibitionism >= 66) output("The show you are making out of yourself for the crowd surrounding you pushes you beyond the edge, and you feel it coming. ");
	output("In an instant you feel every nerve in your body fire up simultaneously, you are about to have your long awaited release. Wave upon wave of intense pleasure crash into your already convulsing body, forcing it to arch upwards. The moans you’ve been constantly releasing are drowned out as you try to gasp for air when it hits you. You fall back to the ground exhausted");
	if(pc.hasGenitals())
	{
		output(" as");
		if(pc.hasCock()) output(" [pc.eachCock] twitch" + (pc.cocks.length == 1 ? "es" : "") + ", spurting out [pc.cum]");
		if(pc.isHerm()) output(" and");
		if(pc.hasVagina()) output(" [pc.eachVagina] convulse" + (pc.vaginas.length == 1 ? "s" : "") + " intensely, splashing [pc.girlCum] everywhere");
	}
	output(".");
	if(inPublic) output(" A loud cheer and applause break from your audience, celebrating your finish. You spot many of them make sure to take pictures of your satisfied form before leaving.");
	output("\n\nSatisfied and drained, you lay on the ground for a moment to catch your breath, meanwhile the vibrations inside you die down.");
	if(inPublic)
	{
		if(exhibitionism >= 66) output(" You turn your face, now with a slutty expression of a satisfaction, towards your precious audience and thank them profusely for helping you with your orgasm. With a wink, a lip bite, and a soft moan, you make sure that you are still being teased, although not as intensely anymore.");
		else if(exhibitionism >= 33) output(" You bask in the afterglow of your orgasm, as the crowd begins to thin out, enjoying all the eyes still trying to memorise your satisfied figure.");
		else output(" Satisfied at last, you find your desire to run away or hide yourself weaker, as the crowd thins out. Embarrassed at how you managed to get yourself off in public and how little you regret it, you blush deeply.");
	}
	output("\n\nYou bring yourself back up and get on your way. The soft vibration emanating from your thong, reminds you that it is still there and still active. This is not over yet and you are not sure if you want it to be.");
	
	// Reset lust
	// +2 exhibitionism
	// +2 libido
	// +10-15 mins
	processTime(10 + rand(6));
	pc.slowStatGain("libido", 2);
	if(inPublic) pc.exhibitionism(2);
	for(var i:int = 0; i < numDildos; i++) { pc.orgasm(); }
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

