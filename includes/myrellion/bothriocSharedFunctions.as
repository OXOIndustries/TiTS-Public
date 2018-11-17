import classes.GameData.Pregnancy.Handlers.BothriocPregnancyHandler;
// Addiction is entirely related to receiving Bothrioc eggs.
public function bothriocAddiction(val:Number = 0):Number
{
	if (flags["BOTHRIOC_ADDICTION"] == undefined) flags["BOTHRIOC_ADDICTION"] = 0;

	var s:Number = flags["BOTHRIOC_ADDICTION"];

	// Don't bother if we're already at 100
	if (val != 0 && s < 100)
	{
		var n:Number = (s + val);

		// If decreasing and already above 50, clamp to 50
		if (n < s && s >= 50 && n < 50) n = 50;
		// If increasing clamp to 100
		if (n > 100) n = 100;
		// If decreasing clamp to 0
		if (n < 0) n = 0;
		// Otherwise set new value
		flags["BOTHRIOC_ADDICTION"] = n;
	}

	//trace("Bothrioc Addiction: " + flags["BOTHRIOC_ADDICTION"]);
	return flags["BOTHRIOC_ADDICTION"];
}

public function testForceAddiction():void
{
	flags["BOTHRIOC_ADDICTION"] = 100;
}

public function updateBothriocAddiction(totalDays:uint):void
{
	if (pc.hasStatusEffect("Bothrioc Eggs")) return;

	var drop:Number = 0;
	for (var i:int = 0; i < totalDays; i++)
	{
		drop -= (1 + rand(3));
	}
	var s:Number = bothriocAddiction();
	if(drop > s) drop = s;

	bothriocAddiction(drop);

	if (s > 0 && bothriocAddiction() == 0)
	{
		AddLogEvent("The world has taken on harder edges in the last couple of hours, and you feel cooler and somehow taller. There’s a small, aching emptiness inside of you where the soft, profound peace you once knew resided - however, that is easy to shake off with the stronger rationality returning on top of it, and the realization the bothrioc hormones must finally be worked out of your system.", "passive", ((1440 - (GetGameTimestamp() % 1440)) + (i * 1440)));
	}
}

// timepoint > 0 == addlogevent

public function bothriocEggnancyEffects(pregSlot:int, timePoint:uint):void
{
	// diff between pData.incubation and timePoint is deltaT for log insertion
	var pData:PregnancyData = pc.pregnancyData[pregSlot];

	var deltaT:uint = pData.pregnancyIncubation - timePoint;

	// These call down to the lower tiers automatically because of nested formatting
	if (bothriocAddiction() == 100) bothriocEggnancy100Effects(deltaT, rand(2));
	else if (bothriocAddiction() >= 50) bothriocEggnancySub100Effects(deltaT, rand(4), true);
	else bothriocEggnancySub50Effects(deltaT, rand(3), true);

	if (timePoint == 0)
	{
		var tEventCall:Function = (function(c_pregSlot:int, c_deltaT:uint):Function
		{
			return function():void
			{
				bothriocEggnancyEnds(c_pregSlot, c_deltaT);
				BothriocPregnancyHandler.cleanupPregnancy(pc, c_pregSlot, PregnancyManager.findHandler("BothriocPregnancy"));
			}
		})(pregSlot, deltaT);
		eventQueue.push(tEventCall);
	}
}

public function bothriocEggnancySub50Effects(deltaT:uint, opt:int, doOut:Boolean):void
{
	if (opt == 3) return;

	var effect:StorageClass = pc.getStatusEffect("Bothrioc Eggs");

	if (opt == 0)
	{
		// First time with this instance of the effect applied
		if (effect != null && effect.value1 == 0)
		{
			effect.value1 = 1;

			if (doOut) AddLogEvent("As hard as you try to keep your mind focused on what you’re doing, you find your thoughts continuously straying back to the warm glow in your gut... and the creature that put it there. The moment where you were made helpless, when the strange, lithe spider-being penetrated you and made you theirs keeps replaying in your head, and every time it does a thrill shivers through you. It felt so <i>good</i> to be exposed and controlled like that, and every time you allow yourself to admit that, it feels like you yourself have physically gotten a little bit softer, a little bit more sensitive. It’s an eerie sensation. A good sensation." + (bothriocAddiction() <= 49 ? " It’s probably best, you tell yourself uneasily, to tear your mind away from it." : ""), "passive", deltaT);
		}
		else
		{
			if (doOut) AddLogEvent("Again and again your mind returns to your submission to the forceful twilight being that bred you, and increasingly the notion that it was an experience to reject rings hollow. The warm glow just feels so good, and the fact you feel softer, more gentle, more open to letting dominant creatures do as they wish is as one with that.", "passive", deltaT);
		}

		bothriocAddiction(1);
		if (rand(4) <= 2 && pc.libido() < 80) pc.slowStatGain("libido", 2 + rand(2));
		if (rand(4) <= 2 && pc.tone < 20) pc.modTone(3 + rand(3), true);
	}
	else if (opt == 1)
	{
		if (doOut) AddLogEvent(ParseText("The warm glow does not feel like it is consigned entirely to your swollen stomach; as time wears on it seems to radiate outwards, permeating every inch of your body, making your [pc.skinFurScales] feel like it’s swaddled in shifting cotton wool. You are deeply uneasy about this to begin with, but it’s impossible to hold onto that when you are made to feel so warm, sensitive and vague."), "passive", deltaT);

		bothriocAddiction(2);
		if (rand(4) <= 1 && pc.femininity < 75)
		{
			pc.modFem(3 + rand(2));
			ExtendLogEvent(" The fact your face and skin seem softer, more effeminate does not seem so strange in the moment; it simply reflects how you feel inside.");
		}

		if (rand(4) <= 1 && pc.balls > 0)
		{
			if (pc.ballDiameter() > 5)
			{
				ExtendLogEvent(ParseText(" It’s getting easier to move around, and vaguely you realize this is because your [pc.balls] are slowly shrinking. Good. They were grotesque in size and totally unsuited to you, you now realize. They gave you unseemly urges and made you look like a breeder, not the breedee, which is where the true joy lies."));

				pc.ballSizeRaw -= 1;
			}
			else if (pc.ballDiameter() > 1 || !pc.hasStatusEffect("Uniball"))
			{
				ExtendLogEvent(" You shiver as you realize your [pc.balls] are compressing further in on themselves; becoming little more than a tender, needy boy-package, only good for being teased by some dominant as they do as they please with your body. You have to bite your finger at the thought.");

				pc.ballSizeRaw -= 1;
				if (pc.ballSizeRaw < 1) pc.ballSizeRaw = 1;
				if (!pc.hasStatusEffect("Uniball")) pc.createStatusEffect("Uniball", 0, 0, 0, 0, true, "", "", false, 0);
			}
		}
	}
	else if (opt == 2)
	{
		if (effect != null && effect.value2 == 0)
		{
			effect.value2 = 1;

			var filled:String = "";

			if (pc.pregnancyData[3].pregnancyType != "") filled = "guts";

			var numWombsF:int = 0;
			if (pc.pregnancyData[0].pregnancyType != "") numWombsF++;
			if (pc.pregnancyData[1].pregnancyType != "") numWombsF++;
			if (pc.pregnancyData[2].pregnancyType != "") numWombsF++;

			if (numWombsF > 0)
			{
				if (filled.length > 0) filled += " and";
				filled += " womb";
				if (numWombsF > 1) filled += "s";
			}

			if (doOut) AddLogEvent(ParseText("You have to stop for a moment, clutch your egg-swollen gut, take deep breaths. For a while now some unnameable emotion has flared intermittently within you, threatening to overwhelm your senses, making your [pc.skinFurScales] tingle and your [pc.nipples] "+ (!pc.hasFuckableNipples() ? "harden up to tender points" : "moisten tenderly") +", and each time it feels bigger than the last. When it happens next it feels like a giant wave crashing over you; a woozy groan is forced past your lips as you are saturated in pure euphoria, "+ (pc.hasVagina() ? "[pc.eachVagina] widening and moistening readily" : "") + (pc.hasCock() && pc.hasVagina() ? " and " : "") + (pc.hasCock() ? "[pc.eachCock] becoming incredibly erect and tender" : "") +" in response. There’s a wonderful peace to be found in this bodily emotion, a sense that you can be at one with the entire galaxy, and a sadness steals in when it finally recedes back to your egg-packed "+ filled +". You can’t help but wish you could <i>always</i> feel like that. "), "passive", deltaT);
		}
		else
		{
			if (doOut) AddLogEvent("Again the series of pleasurable flares emanating from your egg-swollen belly, increasing inexorably in power until the great wave crashes over you. You stop and close your eyes, lips gently parted, and glory in the brilliant, calm euphoria. Surely nothing that feels as good as that can be a bad thing? A nagging disappointment sets in when it dissipates; a deep-seated wish to feel that way again.", "passive", deltaT);
		}

		bothriocAddiction(3);
		pc.addNice(3 + rand(3));
		if (rand(4) <= 2) pc.slowStatLoss("willpower", 1 + rand(3));
		if (rand(2) == 0 && pc.biggestTitSize(true) >= 2 && pc.biggestTitSize(true) < 15)
		{
			pc.breastRows[0].breastRatingRaw += 1;

			if (pc.breastRows.length > 1)
			{
				var maxSize:Number = pc.breastRows[0].breastRatingRaw - 1;

				for (var i:int = 1; i < pc.breastRows.length; i++)
				{
					if (pc.breastRows[i].breastRatingRaw < maxSize)
					{
						pc.breastRows[i].breastRatingRaw = Math.min(maxSize, pc.breastRows[i].breastRatingRaw + 1);
					}
					maxSize = pc.breastRows[i].breastRatingRaw - 1;
				}
			}

			if (effect && effect.value3 == 0)
			{
				effect.value3 = 1;
				ExtendLogEvent(ParseText(" You notice a few moments after the euphoric rush that the distribution of weight on your frame has shifted a bit - your [pc.boobs] have increased in size. It’s impossible to separate the sensation of euphoria from this change. Being a bit more jiggly and bouncy and pleasing to the eye is intrinsically linked to being happy and soft-centered."));
			}
			else
			{
				ExtendLogEvent(ParseText(" Once again, it seems the sensation has added just a little more heft and plumpness to your [pc.boobs]. You allow yourself a moment to fondle yourself, almost purring at how good your breasts now feel."));
			}
		}
	}
}

public function bothriocEggnancySub100Effects(deltaT:uint, opt:int, doOut:Boolean):void
{
	var effect:StorageClass = pc.getStatusEffect("Bothrioc Eggs");

	if (opt == 0)
	{
		if (doOut) AddLogEvent("You coo as your thoughts are rerouted, forced back to the sights, sounds and ecstatic sensation of being bred by the bothrioc. It’s so difficult to get your mind away from that, because every time you allow yourself the vivid memories a backwash of pure pleasure permeates you, emanating from the clutch of eggs you are now carrying. Your body, you sense, is being slowly but inexorably reshaped into a more supple, sexual creature, better suited to arousing fecund dominants so that they may make forceful use of you - and it is increasingly hard to hold onto reasons why that isn’t a good thing.", "passive", deltaT);

		bothriocAddiction(1);

		if (rand(2) == 0 && pc.hipRatingRaw < 18)
		{
			pc.hipRatingRaw += 1 + rand(2);
			ExtendLogEvent(" Your hips have become noticeably wider, your gait increasingly rounder, all the better for laying your heavy load of eggs.");
		}

		if (rand(2) == 0 && pc.biggestTitSize() >= 3 && (pc.nippleLength(0) < 1 || (pc.hasFuckableNipples() && pc.nippleWidth(0) < 2)))
		{
			if (pc.nippleLength(0) < 1)
			{
				pc.nippleLengthRatio += 0.1;
			}
			if (pc.hasFuckableNipples() && pc.nippleWidth(0) < 2)
			{
				pc.nippleWidthRatio += 0.1;
			}
			ExtendLogEvent(ParseText(" Your [pc.nipples] have become larger, tender " + (!pc.hasFuckableNipples() ? "taps" : "holes") +", perfect for fondling" + (pc.isLactating() ? "and for feeding hungry mouths." : ".")));
		}

		if (rand(4) == 0 && pc.AQ() < 90)
		{
			pc.slowStatGain("aim", 1 + rand(3));
			ExtendLogEvent(ParseText(" You close your eyes to sink blissfully into the peace within you for a long moment; when you open them, you feel like you’re seeing the world more clearly. Isn’t everything beautiful! Is it that your [pc.eyes] have become more sensitive, or is it simply your greater empathy towards everything living? Whatever the case, you think your ability to judge distance and perceive movement has improved."));
		}

		bothriocEggnancySub50Effects(deltaT, opt, false);
	}
	else if (opt == 1 && pc.hasVagina())
	{
		if (doOut) AddLogEvent(ParseText("The warm glow is not consigned entirely to your swollen stomach; as time wears on it seems to radiate outwards, permeating every inch of your body, making your [pc.skinFurScales] feel like it’s swaddled in shifting cotton wool. You are grateful, because once it has spread throughout you it’s as if you’re walking on violet clouds. Why would you reject this sensation? Why would you reject the wonderful changes the dense clutch inside you are causing?"), "passive", deltaT);

		bothriocEggnancySub50Effects(deltaT, opt, false);

		bothriocAddiction(2);

		if (rand(2) == 0 && pc.driestVaginalWetness(true) < 4)
		{
			var didHigh:Boolean = false;

			for (var i:int = 0; i < pc.vaginas.length; i++)
			{
				if (pc.vaginas[i].wetnessRaw < 4)
				{
					pc.vaginas[i].wetnessRaw += 0.5;
					if (pc.vaginas[i].wetnessRaw > 4)
					{
						pc.vaginas[i].wetnessRaw = 4;
						didHigh = true;
					}
				}
			}

			if (!didHigh)
			{
				ExtendLogEvent(ParseText(" Your [pc.vaginas] feel" + (pc.vaginas.length == 1 ? "s" : "") + " very wet, the fuzzy sensation sinking into your crotch seeming to increase the volume of [pc.femcum] that you can produce - and how easy it is to turn you on. You shiver at the implication."));
			}
			else
			{
				ExtendLogEvent(ParseText(" Your [pc.vaginas] " + (pc.vaginas.length == 1 ? "is" : "are") + " utterly soaked with arousal, dripping"+ (pc.hasLowerGarment() ? " out of your [pc.lowerUndergarment]" : (pc.hasLegs() ? " down your inner thigh" : " down your [pc.leg]")) +". " + (pc.vaginas.length == 1 ? "It lubes itself" : "They lube themselves") + " up to the point now where you will never not be ready to take a hard breeding from whichever beautiful night-creature wishes to bend you over, regardless of the size of their bulging egg-cock. You cannot help but dribble [pc.femcum] freely at the thought."));
			}
		}

		if (rand(2) == 0 && pc.fertilityRaw < 2)
		{
			pc.fertilityRaw += 0.1;
			ExtendLogEvent(ParseText(" Quite a lot of the heat seems to center on your"+ (pc.hasWombPregnancy() ? " packed" : "") +" womb, your inner female sex throbbing gently. A pass of your hand over your [pc.belly] reveals you have become more tender around the sides. Your ovaries have increased in size, and innately you know you are ovulating more frequently."))
		}
	}
	else if (opt == 2)
	{
		AddLogEvent(ParseText("An ecstatic tidal wave has been gathering for some time now; the full body pulses emanating from your egg-stuffed bowels"+ (pc.hasWombPregnancy() ? " and womb" : "") +" increasing in potency, tingling on your [pc.skin] and through your [pc.groin]. You stop where you are and wait for it, emptying your mind (an increasingly easy thing for you to do these days) so that you can enjoy it properly. When it comes, your breath leaks out of your [pc.lips] and you find yourself lifting your arms towards something, you don’t know what, blown away by a soft explosion of pleasure, bothrioc hormones swarming through every atom of being. How wonderful it is to be an incubator, and to be changed to better suit your new role in life."), "passive", deltaT);

		bothriocEggnancySub50Effects(deltaT, opt, false);

		bothriocAddiction(3);

		if (rand(2) == 0 && pc.buttRatingRaw < 17)
		{
			pc.buttRatingRaw += 1 + rand(2);
			ExtendLogEvent(ParseText(" You’re definitely walking around with a bit more bounce and jiggle now. You’re sure your [pc.ass] wasn’t quite as big and soft as this an hour ago. Imagine the unseen gazes you draw from anything with a hard cock or oily ovipositor; imagine how pleasurable you are now to lie down upon and pump silly all night long. You blush hard at the thought."));
		}

		if (rand(4) <= 2 && pc.ass.wetnessRaw < 5)
		{
			pc.ass.wetnessRaw += 1;
			if (pc.ass.wetnessRaw > 5) pc.ass.wetnessRaw = 5;

			ExtendLogEvent(ParseText(" The indistinct blaze of arousal from your growing clutch works its way down to your back passage, and "+ (pc.ass.wetnessRaw < 3 ? "your eyes widen as you feel moisture trickle out of your [pc.anus]. A careful dabbing reveals your asshole now beads clear oil when you are aroused, and is slightly more pliant. A further sign of your transformation into a dedicated buttslut." : "you moan as clear lubricant dribbles out of your [pc.anus]"+ (pc.hasLowerGarment() ? " and wettens your [pc.underGarment]" : "") +", a sign of your excitement. Your asshole is every bit as pliant and self-lubricating as a wet pussy - it is, after all, your main sex now.")))
		}

		if (rand(2) == 0 && pc.longestCockLength(true) > 1)
		{
			for (i = 0; i < pc.cocks.length; i++)
			{
				if (pc.cocks[i].cLengthRaw > 12) pc.cocks[i].cLengthRaw -= 1;
				if (pc.cocks[i].cLengthRaw > 6) pc.cocks[i].cLengthRaw -= 1;
				if (pc.cocks[i].cLengthRaw > 1) pc.cocks[i].cLengthRaw -= 1;

				if (pc.cocks[i].cLengthRaw < 1) pc.cocks[i].cLengthRaw = 1;
			}

			ExtendLogEvent(ParseText(" You shiver as [pc.eachCock] shrinks down, seeming to compress in on "+ (pc.cocks.length == 1 ? "itself" : "themselves") +" in response to the euphoric buzz, becoming more sensitive as a result." + (pc.longestCockLength() > 6 ? " It’s impossible to separate the sensation of pleasure from having "+ (pc.cocks.length == 1 ? "a smaller dick" : "smaller dicks") +" - you cannot help but want to seek other ways of making yourself smaller, better suited to being an eager, sensitive sissy." : " You are smaller than most males and herms you will run into now, and that feels so <i>right</i> - your sensitive little sissy "+ (pc.cocks.length == 1 ? "clit" : "clits" ) +" suited not for penetration but for ruthless teasing, just another way for dominants to overwhelm your mind with submissive pleasure. Butterflies flutter in your tummy at the thought.")));
		}
	}
	else
	{
		AddLogEvent(ParseText("You sigh, basking in the feeling of the warm, dense glow of growing life within you. Whatever your original sentiments were concerning being an incubator have long since been eroded away in a tide of profound contentment and arousal. It just feels so <i>right</i>. Didn’t you always think this way? Didn’t you always see the galaxy as a light-strewn sexual carnival, to drift through with fingers trailed and give yourself to whichever vigorous, seductive creature desires you? It seems like if there ever was a time you didn’t think this way - constantly looking for opportunities to make love, knowing exactly how to put others at ease and make them think sexy thoughts - that was a small, cold, sadly misled version of you."), "passive", deltaT);

		if (rand(4) == 0&& !pc.hasPerk("Sexy Thinking"))
		{
			//ExtendLogEvent(" <b>You have gained the Sexy Thinking perk. The lower your will, the better your tease attacks will be.</b>");
			ExtendLogEvent("\n\n(<b>Perk Gained: Sexy Thinking</b> - Increases tease damage inversely to how high willpower and intelligence are.)");
	 		pc.createPerk("Sexy Thinking",0,0,0,0,"Boosts tease damage more the dumber and less willful you are.");
		}

		bothriocAddiction(5);

		pc.addNice(5);
	}
}

public function bothriocEggnancy100Effects(deltaT:uint, opt:int):void
{
	if (!pc.hasPerk("Peace of Mind"))
	{
		var s:String = "You shimmer with submissive bliss, and you stop for a moment, eyes closed, reveling in the ecstasy channeling through you; the sensation of bothrioc hormones completing their total rewiring of your body and brain. The wonderful sensations of being an incubator used to rise up within you, always seeming to reach towards some bright, brilliant horizon before ebbing disappointingly away after you gave birth. Now, you know, you have finally reached that horizon, and there will be no turning away from it now you have fully basked in its glory. You want for nothing but to make others happy. Just that thought now, of making some strong being groan with pleasure, or smirk at some sign of your total subservience, makes you shiver with delight,";
		if (pc.hasCock()) s += " [pc.eachCock] becoming instantly hard";
		if (pc.hasCock() && pc.hasVagina()) s += " and";
		if (pc.hasVagina()) s += " [pc.eachVagina] immediately growing plush and moist";
		s += ".";

		s += "\n\nYou reluctantly tear your mind away from such wonderful thoughts, and have a go at testing the all-encompassing peace you now feel. You were sure, some time ago, you used to get angry about certain things. Like what? That cousin of yours, for instance. You picture "+ rival.mf("his", "her") +" face, jeering at you, cheating you out of your inheritance. Well, that’s bad certainly, but did you really used to get worked up about that, consider doing them evil? You almost clap your hands to your face in dismay at the very notion. It is simply a case of going about your mission calmly and competently, and if you do that to the very best of your abilities what will there be to get angry about, regardless of whether you succeed or fail? Once this is over you need to sit [rival.name] down and see if you can’t smooth all this unpleasantness over with some oral sex. Yes; a nice, long session of "+ rival.mf("sucking cock", "licking pussy") +" is the key here, as ever.";

		s += "\n\nYou smile widely, reflexively rubbing your swollen belly, relieved that no matter how hard you try, it is no longer possible for you to think aggressive thoughts.";
		
		s += ("\n\n(<b>Perk Gained: Peace of Mind</b> - Minimum lust is heightened. Enemies may peacefully surrender to you given their level--however, it may be very hard for you to resist enemies that peacefully demand you submit to them....)");

		AddLogEvent(ParseText(s), "passive", deltaT);
		pc.personality = 0;
		pc.createPerk("Peace of Mind", 0, 0, 0, 0, "You radiate an aura of Zen-like calm. You can offer enemies the chance to peacefully surrender. The lower their level, the better the chance will be. In turn, however, enemies that peacefully demand you submit to them may be very difficult to resist.... Additionally boosts minimum lust to 20.");
	}
	else if (opt == 0)
	{
		var wombF:Boolean = false;
		if (pc.pregnancyData[0].pregnancyType == "BothriocPregnancy") wombF = true;
		if (pc.pregnancyData[1].pregnancyType == "BothriocPregnancy") wombF = true;
		if (pc.pregnancyData[2].pregnancyType == "BothriocPregnancy") wombF = true;

		AddLogEvent("You coo with bliss, wave upon wave of bothrioc love blooming through you from your egg-stuffed bowels"+ (wombF ? " and womb." : "."), "passive", deltaT);

		bothriocEggnancySub100Effects(deltaT, opt, false);

		pc.lust(20);
	}
	else if (opt == 1)
	{
		AddLogEvent("The dense glow growing inside you intensifies the total peace you already feel. Nothing is more gratifying than these hours of pregnancy; nothing feels better than the sensation of the warm oil flowing all the way through you, forever honing you into a creature of pure, submissive sensuality.", "passive", deltaT);

		bothriocEggnancySub100Effects(deltaT, opt, false);

		pc.lust(20);

		if (rand(2) == 0 && pc.lipRating() < 7)
		{
			pc.lipMod += 1;
			ExtendLogEvent(ParseText(" Even your face, now, feels ripe, swollen and sensitive with the incubation. You touch your [pc.lips]; they’ve become slightly puffier and poutier, all the better for pressing into warm flesh and to be parted with hard, oily egg-cock."));
		}

		if (rand(2) == 0 && (pc.milkMultiplier < 120 || pc.milkFullness < 200))
		{
			if (pc.milkMultiplier < 120)
			{
				pc.milkMultiplier += 10;
				if (pc.milkMultiplier > 120) pc.milkMultiplier = 120;
			}

			if (pc.milkFullness < 200)
			{
				pc.milkFullness += 20;
				if (pc.milkFullness > 200) pc.milkFullness = 200;
			}

			ExtendLogEvent(ParseText(" Your [pc.breasts] feel full, taut with the warm [pc.milk] you will need to feed the many, many children you will have during your life as an incubator. You can’t help but "+ (!pc.hasFuckableNipples() ? "tweak" : "finger") +" a [pc.nipple] at the thought, sighing blissfully as it readily drizzles [pc.milkColor] fluid in response."));
		}
	}
}

public function bothriocEggnancyEnds(pregSlot:uint, deltaT:uint):void
{
	// At the end of the pregnancies duration, we have a closure that wraps a call to bothriocEggnancyEffects() AND cleanupPregnancy() back to back
	// The cleanup only handles infertile egg stats/tracking, so we must handle fertile eggs here and reduce the pregnancyQuantity of the pData object to match
	// (thus leaving the infertile eggs to that code, but allowing this code to vary based on fertile #)

	var pData:PregnancyData = pc.pregnancyData[pregSlot];

	var numFertile:int = 0;
	for (var i:int = 0; i < pData.pregnancyQuantity; i++)
	{
		if (rand(100) < 15) numFertile++;
	}

	clearOutput();

	if (numFertile == 0)
	{
		output("Over the last few hours, the sensation of swollen heaviness in your gut has receded");
		if (bothriocAddiction() < 100) output(", and the fuzzy fug of happiness has dissipated somewhat");
		output(". You pass a tentative hand over your flatter stomach. The eggs that were implanted within you must have all broken down and been absorbed into your system.");
		if (bothriocAddiction() >= 50) output(" You feel sad that you weren’t able to carry any cute bothrioc to term. You comfort yourself with the knowledge that their essence is a part of you now - and resolve to get another generous egg stuffing as soon as time permits.");
		else output(" Able to think slightly more clearly now that the bothrioc hormones aren’t messing with you as much, you mostly feel relief that there is no onus on you to think about the future of a bunch of wee six limbed cave brats.");
		
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		var c:Child = null;
		var h:BothriocPregnancyHandler = PregnancyManager.findHandler("BothriocPregnancy") as BothriocPregnancyHandler;

		StatTracking.track("pregnancy/fertile bothrioc eggs", numFertile);

		if (pregSlot == 3)
		{
			output("A feeling of pressure in your bowels has been gathering for some time now, and you gasp as your back passage spasms and a gush of oil warms your");
			if (pc.hasLowerGarment()) output(" [pc.lowerUndergarment].");
			else output(" your inner thighs.");
			if (InPublicSpace() || InShipInterior() || InRoomWithFlag(GLOBAL.PRIVATE))
			{
				output(" You waddle as fast as you possibly can to the nearest restroom. You get a few stares, but this is the frontier");
				// {or close enough dammit");
				output("; people giving birth to alien eggs are not exactly an uncommon sight. You lock the door");
				if (pc.hasLowerGarment()) output(", remove your [pc.lowerGarments]");
				output(" and then squat, bearing down with your [pc.hips].");
			}
			else
			{
				output(" There’s nothing for it. You try and find as quiet a spot as possible and, desperately hoping nothing attacks you whilst you’re in this state,");
				if (pc.hasLowerGarment()) output(" remove your [pc.lowerGarments] and");
				output(" squat.");

			output("\n\nYou tense up as the first egg travels down your colon and stretches your [pc.anus] wide.");
			if (pc.ass.wetness() < 3 && pc.ass.looseness() < 3) output(" Your backside was not designed for this type of task and the sensation is extreme. You bite your lip and can’t help but cry out as the large, violet oval finally comes free in a rush of clear lubricant.");
			else output(" Your backside is better adapted for doing this than you ever originally could have imagined - buttslut that you have become - but the sensation is still deep. You moan with relief when the bulk of it finally gets past your ring, and it comes free in a rush of clear lubricant.");
			if (numFertile == 1) output(" Fortunately, that seems to be the only one. The rest must have absorbed into your body. After a few minute’s rest you clean yourself up and retrieve the big, heavy, oil-coated egg.");
			else output(" You barely have time to draw in a few ragged breaths before the pressure builds again - another hard, smooth oval forcing its way out of your rectum...");
			}
		}
		else
		{
			output("A feeling of something dragging downwards in your womb has been gathering for some time now, and you gasp as your pussy suddenly spasms and a gush of oil warms your");
			if (pc.hasLowerGarment()) output(" [pc.lowerUndergarment].");
			else output(" your inner thighs.");
			if (InPublicSpace() || InShipInterior() || InRoomWithFlag(GLOBAL.PRIVATE))
			{
				output(" You waddle as fast as you possibly can to the nearest restroom. You get a few looks, but this is the frontier;");
				//" sudden bouts of intestinal distress/
				output(" people giving birth to alien eggs are not exactly the exception. You lock the door");
				if (pc.hasLowerGarment()) output(", remove your [pc.lowerGarments]");
				output(" and then squat, instinctively spreading and flexing your [pc.hips].");
			}
			else
			{
				output(" There’s nothing for it. You try and find as quiet a spot as possible and, desperately hoping nothing attacks you whilst you’re in this state,");
				if (pc.hasLowerGarment()) output(" remove your [pc.lowerGarments] and");
				output(" squat.");
			}

			output("\n\nYou tense up as the first egg travels down your vaginal passage and stretches your labia.");
			if (pc.vaginas[pregSlot].wetness() < 3 || pc.vaginas[pregSlot].looseness() < 3)
			{
				output(" This is");
				if (!ChildManager.hasChildren()) output(" presumably");
				output(" a lot easier than giving birth to a human child, but it’s still pretty tough on your neat, tight pussy. You bite your lip and can’t help but cry out as the large, violet oval finally comes free in a rush of clear lubricant.");
			}
			else output(" Your female sex is incredibly well-designed for this, and the feeling you receive when the bulky oval emerges from your pussy is one of intense pleasure. You moan when it comes free in a rush of clear lubricant.");
			if (numFertile == 1) output(" Fortunately, that seems to be the only one - the rest must have absorbed into your body. After a few minute’s rest you clean yourself up and retrieve the big, heavy, oil-coated egg.");
			else output(" You barely have time to draw in a few ragged breaths before the pressure builds again - another hard, smooth oval travelling downwards from your womb...");
		}

		output("\n\nA fairly intense few minutes later, and you are gathering yourself, cheeks flushed, staring at the");
		if (numFertile > 1) output(" " + num2Text(numFertile));
		output(" oil-coated egg");
		if (numFertile > 1) output("s");
		output(" that you have birthed.");
		if (bothriocAddiction() < 50) output(" It’s hard not to feel a glow of achievement.");
		// 50-100:
		else output(" You feel a great glow of achievement and contentment.");

		output("\n\nThe violet shells of the eggs are solid, so it’s hard to tell the state of the infant bothrioc inside. Still - given the time spent incubating away inside of you,");
		if (numFertile == 1) output(" it");
		else output(" they");
		output(" can’t be far away from hatching.");
		if (!InRoomWithFlag(GLOBAL.CAVE))
		{
			output(" There’s only one thing you can do with");
			if (numFertile == 1) output(" it");
			else output(" them");
			output(", really - there’s no question of taking");
			if (numFertile == 1) output(" it");
			else output(" them");
			output(" with you or leaving");
			if (numFertile == 1) output(" it");
			else output(" them");
			output(" here. You use your codex to summon the drone, spending the time it takes to find its way to you by wiping the egg");
			if (numFertile > 1) output("s");
			output(" clean and pressing");
			if (numFertile == 1) output(" it");
			else output(" them");
			output(" against your ear, listening to the two tiny heartbeats inside");
			if (numFertile > 1) output(" each");
			output(". The spawn-drone does eventually put in an appearance, and it hovers, listening patiently, as you give it instructions to put the egg");
			if (numFertile > 1) output("s");
			output(" somewhere warm, dry and dark in your private nursery. You watch it depart laden with your bothrioc spawn with a slight pang and sense of emptiness");
			if (bothriocAddiction() < 50) output(", despite yourself");
			output(".");

			c = Child.NewChildWeights(h.pregnancyChildRace, h.childMaturationMultiplier, numFertile, h.childGenderWeights);
			c.BornTimestamp = GetGameTimestamp() + deltaT;
			ChildManager.addChild(c);

			StatTracking.track("pregnancy/total day care", numFertile);

			clearMenu();
			addButton(0, "Next", mainGameMenu);
		}
		else
		{
			output(". You <i>could</i> leave");
			if (numFertile == 1) output(" it");
			else output(" them");
			output(" here, concealed in the caves that are their natural habitat. ");
			if (numFertile == 1) output("It is");
			else output("They are");
			output(" obviously beyond the stage where");
			if (numFertile == 1) output(" it needs");
			else output(" they need");
			output(" to be looked after, and bothrioc strike you as being reasonably self-sufficient creatures");
			if (flags["ARAKEI_TALKED_BOTHRIOC"] != undefined) output(" - at least before they get deep into egg-sluttery");
			output(". Or you could summon the drone, take");
			if (numFertile > 1) output(" them");
			else output(" the six-limbed kid");
			output(" under your wing.");

			clearMenu();
			addButton(0, "Leave", bothriocEggsLeave, numFertile);
			addButton(1, "GetDrone", bothriocEggsDrone, [numFertile, deltaT]);
		}
	}
}

public function bothriocEggsLeave(numFertile:int):void
{
	clearOutput();

	output("You pick the egg");
	if (numFertile > 1) output("s");
	output(" up and carefully conceal");
	if (numFertile == 1) output(" it");
	else output(" them");
	output(" in a cleft under a boulder. You already did your bit, you tell yourself firmly");
	if (bothriocAddiction() <= 30) output(" - certainly more than you ever signed up for. Pesky rape spiders");
	output(". You spend a little more time gathering yourself and then set off into the gloom again, firmly putting your former progeny out of mind.");

	StatTracking.track("pregnancy/fertile bothrioc eggs left", numFertile);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bothriocEggsDrone(opts:Array):void
{
	var numFertile:int = opts[0];
	var deltaT:uint = opts[1];
	clearOutput();
	
	output("You use your codex to summon the drone, spending the time it takes to find its way to you by wiping the egg");
	if (numFertile > 1) output("s");
	output(" clean and pressing");
	if (numFertile == 1) output(" it");
	else output(" them");
	output(" against your ear, listening to the two tiny heartbeats inside");
	if (numFertile > 1) output(" each");
	output(". The spawn-drone does eventually put in an appearance, and it hovers listening patiently as you give it instructions to put the egg");
	if (numFertile > 1) output("s");
	output(" somewhere warm, dry and dark in your nursery. You watch it depart laden with your bothrioc spawn with a slight pang and sense of emptiness");
	if (bothriocAddiction() < 50) output(", despite yourself");
	output(". But hey, at least you’ll see them again eventually.");

	StatTracking.track("pregnancy/total day care", numFertile);

	var h:BothriocPregnancyHandler = PregnancyManager.findHandler("BothriocPregnancy") as BothriocPregnancyHandler;

	var c:Child = Child.NewChildWeights(h.pregnancyChildRace, h.childMaturationMultiplier, numFertile, h.childGenderWeights);
	c.BornTimestamp = GetGameTimestamp() + deltaT;
	ChildManager.addChild(c);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}