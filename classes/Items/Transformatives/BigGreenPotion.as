package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.ItemSlotClass;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.indefiniteArticle;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	import classes.CockClass;
	import classes.BreastRowClass;
	import classes.VaginaClass;
	
	public class BigGreenPotion extends ItemSlotClass
	{
		public function BigGreenPotion()
		{
			_latestVersion = 1;
			quantity = 1;
			stackSize = 5;
			type = GLOBAL.PILL;
			
			shortName = "BGreenPot";
			longName = "Big Green potion";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a green potion bottle";
			tooltip = "A glowing green mixture in a pretty crystal bottle that will, most likely, cause you to transform.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 1000;
			
			version = _latestVersion;
		}
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			author("Foxxling");
			var pc:Creature = target;
			
			if (target is PlayerCharacter)
			{
				output("You take the crystal bottle into your [pc.hand] and look it over, observing the roiling liquid within. The fluid glows yellow-green, almost pulsing with life. Whatever this elixir is, you are sure drinking it will probably change you... Well, no sense waiting. You pop the top and down the potion in one smooth motion. Your body begins to tingle almost immediately...");
				
				// Highly reactive substance: 3 random transformations per consumption.
				var changes:int = 0;
				var changeLimit:int = 3;
				var b:int = 0;
				var x:int = 0;
				var groinChanged:Boolean = false;
				var removedTop:Boolean = false;
				
				// Skin
				var hasHradSkinColor:Boolean = InCollection(pc.skinTone, "green", "viridescent", "emerald");
				if (changes < changeLimit && rand(2) == 0)
				{
					if (pc.skinType != GLOBAL.SKIN_TYPE_SKIN)
					{
						if (pc.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN))
						{
							output("\n\n");
							if (pc.skinType == GLOBAL.SKIN_TYPE_FUR) output("Your skin prickles all over as your body hair begins to recede. Slowly, the amount of hair on your body decreases until your [pc.skinColor] skin is revealed.");
							else if (pc.skinType == GLOBAL.SKIN_TYPE_SCALES) output("Your scaly epidermal layer begins to smoothen out as each scale recedes until they are freckled patterns on your [pc.skinColor] skin. Soon the marks fade, leaving your skin free of scales.");
							else if (pc.skinType == GLOBAL.SKIN_TYPE_CHITIN) output("Your chitinous surface begins to crackle and disintegrate as each plate dissolves into freckled patterns on your [pc.skinColor] skin. Soon the marks fade, leaving your skin free of chitin.");
							else if (pc.skinType == GLOBAL.SKIN_TYPE_FEATHERS) output("Your skin prickles all over as your plumage begins to ruffle and molt. Gradually, the feathers on your body drop off until the [pc.skinColor] skin underneath is revealed.");
							else if (pc.skinType == GLOBAL.SKIN_TYPE_BARK) output("Your arboreal surface begins to crack and shift as each bark plate recedes into freckled patterns on your [pc.skinColor] skin. Soon the marks fade, leaving your skin free of bark.");
							else output("A prickling sensation runs across your [pc.skin] and you notice the surface of your body smoothing and shifting into something more normal.");
							output(" <b>Your body is now covered in bare skin.</b>");
							pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
							pc.clearSkinFlags();
							changes++;
						}
						else output("\n\n" + pc.skinTypeLockedMessage());
					}
					if (pc.faceType == GLOBAL.TYPE_HUMAN && !hasHradSkinColor)
					{
						var newSkinTone:String = RandomInCollection("green", "green", "viridescent", "emerald");
						
						if (pc.skinToneUnlocked(newSkinTone))
						{
							pc.skinTone = newSkinTone;
							output("\n\nAll over your body your skin grows warm. Looking at your hands, you watch as your skin becomes a nice shade of green. <b>Your skin is now [pc.skinColor]!</b>");
							changes++;
						}
						else
						{
							output("\n\n" + pc.skinToneLockedMessage());
						}
					}
				}
				// Hair
				if (changes < changeLimit && pc.hairColor != "vibrant purple" && rand(2) == 0)
				{
					if (pc.hairColorUnlocked("vibrant purple"))
					{
						if (pc.hasHair())
						{
							output("\n\nYour scalp begins to tingle as <b>your [pc.hairColor] hair gradually changes to vibrant purple from the roots out");
							if (pc.hairLength < 18) output(", also growing longer until it reaches past your shoulders");
							output(".</b>");
						}
						else
						{
							output("\n\nYour scalp begins to tingle as <b>vibrant purple hair sprouts from its surface, growing longer until it reaches past your shoulders.</b>");
						}
						if (pc.hairLength < 18) pc.hairLength = 18;
						pc.hairColor = "vibrant purple";
						changes++;
					}
					else output("\n\n" + pc.hairColorLockedMessage());
				}
				// Head/Face
				if (changes < changeLimit && pc.faceType != GLOBAL.TYPE_HUMAN && rand(2) == 0)
				{
					if (pc.faceTypeUnlocked(GLOBAL.TYPE_HUMAN))
					{
						output("\n\nYour face begins to tingle and reform--normalizing into a smooth, flat visage. Once the wrestling of your features has ended, <b>your face looks completely human.</b>");
						pc.faceType = GLOBAL.TYPE_HUMAN;
						pc.clearFaceFlags();
						changes++;
					}
					else output("\n\n" + pc.faceTypeLockedMessage());
				}
				// Antennae
				if (changes < changeLimit && (pc.antennae == 0 || pc.antennaeType != GLOBAL.TYPE_HRAD) && rand(2) == 0)
				{
					if (pc.antennae == 0 && pc.antennaeUnlocked(2))
					{
						output("\n\nTwo points on the top of your head begin to feel a little warm. You reach up and find two quickly growing protrusions that, upon reaching full height, bloom into two balls, causing them to hang forward and droop a bit. When you look up, you can see two big, purple spheres - each connected to your head by " + indefiniteArticle(pc.skinTone) + " antenna - <b>you now have hradian antennae!</b>");
						pc.antennae = 2;
						pc.antennaeType = GLOBAL.TYPE_HRAD;
						changes++;
					}
					else if (pc.antennae != 0 && pc.antennaeTypeUnlocked(GLOBAL.TYPE_HRAD))
					{
						output("\n\nYour [pc.antennae] begin to feel a little itchy. You reach up and find them shifting until the stem is smooth and the tips bloom into balls, causing them to hang forward and droop a bit. When you look up, you can see two big, purple spheres - each connected to your head by " + indefiniteArticle(pc.skinTone) + " antenna - <b>you now have hradian antennae!</b>");
						pc.antennae = 2;
						pc.antennaeType = GLOBAL.TYPE_HRAD;
						changes++;
					}
					else if(!pc.antennaeUnlocked(2)) output("\n\n" + pc.antennaeLockedMessage());
					else output("\n\n" + pc.antennaeTypeLockedMessage());
				}
				// Nipples
				var newNipColor:String = RandomInCollection("violet", "violet", "purple", "purple", "bright purple");
				if (changes < changeLimit && hasHradSkinColor && pc.nippleColor.indexOf("pink") == -1 && pc.nippleColor.indexOf("purple") == -1 && pc.nippleColor.indexOf("violet") == -1 && rand(2) == 0)
				{
					if (pc.nippleColorUnlocked(newNipColor))
					{
						output("\n\nYou feel a tingling sensation in your [pc.nipples].");
						if (!removedTop && pc.isChestCovered() && !pc.isChestExposed())
						{
							output(" You quickly remove your top to inspect the change only to discover something quite odd.");
							removedTop = true;
						}
						output(" Looking at them, they begin shifting in hue as the tingling continues. Once it’s over, <b>you find that they’ve become a bright purple color.</b>");
						pc.nippleColor = newNipColor;
						changes++;
					}
					else output("\n\n" + pc.nippleColorLockedMessage());
				}
				// Chest
				var boobSizeLimit:Number = 15;
				var boobSizeIncrease:Number = 1 + rand(3);
				var unfuckableBoobRows:Number = 0;
				var undickedBoobRows:Number = 0;
				var thickNippleRows:Number = 0;
				var longNippleRows:Number = 0;
				var smallestBoobRow:int = 0;
				var nippleChanged:Boolean = false;
				for(b = 0; b < pc.bRows(); b++)
				{
					if (pc.breastRows[smallestBoobRow].breastRating() < pc.breastRows[b].breastRating()) smallestBoobRow = b;
					if (pc.nippleWidth(b) >= 2) thickNippleRows++;
					if (pc.nippleLength(b) >= 4) longNippleRows++;
					if (pc.breastRows[b].nippleType != GLOBAL.NIPPLE_TYPE_FUCKABLE) unfuckableBoobRows++;
					if (pc.breastRows[b].nippleType != GLOBAL.NIPPLE_TYPE_DICK) undickedBoobRows++;
				}
				if (changes < changeLimit && pc.breastRows[smallestBoobRow].breastRating() < boobSizeLimit && rand(2) == 0)
				{
					if (pc.breastRatingUnlocked(smallestBoobRow, pc.breastRows[smallestBoobRow].breastRatingRaw + boobSizeIncrease))
					{
						output("\n\nA pulsing sensation impacts your [pc.fullChest].");
						if (!removedTop && pc.isChestCovered() && !pc.isChestExposed())
						{
							output(" The pressure of your sweater puppies against your [pc.upperGarments] gives you the feeling that they are plumping up.");
						}
						else output(" Looking at your bust, you can see them visibly plump up with each pulse.");
						output(" After the swelling stops, you inspect them only to confirm your suspicions - <b>they’ve grown larger.</b>");
						for(b = 0; b < pc.bRows(); b++)
						{
							if (pc.breastRows[b].breastRating() < boobSizeLimit) pc.breastRows[b].breastRatingRaw += boobSizeIncrease;
						}
						pc.lust(20 + rand(10));
						changes++;
					}
					else output("\n\n" + pc.breastRatingLockedMessage());
				}
				// Lactation
				if (changes < changeLimit && pc.isLactating() && pc.milkType != GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT && rand(2) == 0)
				{
					if (pc.milkTypeUnlocked(GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT))
					{
						output("\n\nYour breasts grow warm. A churning sensation in them makes you feel as if someone is stirring your mammary glands into a frenzy.");
						if (!removedTop && pc.isChestCovered() && !pc.isChestExposed())
						{
							output(" You quickly remove your top to inspect the change only to discover something quite odd.");
							removedTop = true;
						}
						output(" Feeling a wet spot you reach down and rub your [pc.nipples], getting a handful of yogurt in the process. <b>Looks like your tits leak yogurt now!</b>");
						pc.milkType = GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT;
						pc.lust(20 + rand(10));
						changes++;
					}
					else output("\n\n" + pc.milkTypeLockedMessage());
				}
				// Nipple Type - Fuckable
				if (changes < changeLimit && !nippleChanged && thickNippleRows > 0 && unfuckableBoobRows > 0 && ((undickedBoobRows == 0 && rand(10) == 0) || (undickedBoobRows > 0 && rand(4) == 0)))
				{
					for(b = 0; b < pc.bRows(); b++)
					{
						if (pc.nippleTypeUnlocked(b,GLOBAL.NIPPLE_TYPE_FUCKABLE) && pc.breastRows[b].nippleType != GLOBAL.NIPPLE_TYPE_FUCKABLE)
						{
							pc.breastRows[b].nippleType = GLOBAL.NIPPLE_TYPE_FUCKABLE;
							nippleChanged = true;
						}
					}
					if (nippleChanged)
					{
						output("\n\nThere is a flaring sensation in your [pc.nipples] and you can feel them bulge and swell.");
						if (!removedTop && pc.isChestCovered() && !pc.isChestExposed())
						{
							output(" You quickly remove your top to inspect the change only to discover something quite odd.");
							removedTop = true;
						}
						output(" Your nipples profusely leak [pc.milk] and streams are running down each tit. When you try to relax the flow, your [pc.finger] accidentally slips into a wide, puffy nipple. Amazed, you pull the glistening digit out with a wet schlick and a lustful arousal flows through your spine. It seems your fat teats have the ability to work like cunts... <b>You now have fuckable nipples!</b>");
						if (pc.nippleWidthRatio < 3) pc.nippleWidthRatio = 3;
						changes++;
					}
					else output("\n\n" + pc.nippleTypeLockedMessage());
				}
				// Nipple Type - Dick
				if (changes < changeLimit && !nippleChanged && longNippleRows > 0 && undickedBoobRows > 0 && ((unfuckableBoobRows == 0 && rand(10) == 0) || (unfuckableBoobRows > 0 && rand(4) == 0)))
				{
					for(b = 0; b < pc.bRows(); b++)
					{
						if (pc.nippleTypeUnlocked(b,GLOBAL.NIPPLE_TYPE_DICK) && pc.breastRows[b].nippleType != GLOBAL.NIPPLE_TYPE_DICK)
						{
							pc.breastRows[b].nippleType = GLOBAL.NIPPLE_TYPE_DICK;
							nippleChanged = true;
						}
					}
					if (nippleChanged)
					{
						output("\n\nThere is a stretching sensation in your [pc.nipples] and you can feel them extend and lengthen.");
						if (!removedTop && pc.isChestCovered() && !pc.isChestExposed())
						{
							output(" You quickly remove your top to inspect the change only to discover something quite odd.");
							removedTop = true;
						}
						if (pc.dickNippleMultiplier < 5) pc.dickNippleMultiplier = 5;
						if (pc.hasCock() && rand(4) == 0) pc.dickNippleType = pc.cocks[0].cType;
						else pc.dickNippleType = GLOBAL.TYPE_HUMAN;
						output(" Your nipples profusely leak [pc.cum] and streams are running down each tit. When you try to relax the flow, your [pc.hand] accidentally latches onto a hard, erect nipple. Amazed, you pump the phallus-shaped length and a lustful arousal flows through your spine. It seems your long teats have the ability to work like cocks... <b>You now have " + GLOBAL.TYPE_NAMES[pc.dickNippleType].toLowerCase() + "-shaped dick-nipples!</b>");
						changes++;
					}
					else output("\n\n" + pc.nippleTypeLockedMessage());
				}
				// Groin - Cock Size
				if (changes < changeLimit && !groinChanged && pc.hasCock() && rand(2) == 0)
				{
					// primary cock increases in length and girth
					x = 0;
					if (pc.cocks[x].cLength() < 18)
					{
						var newLength:Number = pc.cocks[x].cLengthRaw + 3 + rand(4);
						if (pc.hasPerk("Hung")) newLength += 1 + rand(6);
						
						if (pc.cockLengthUnlocked(x, newLength))
						{
							output("\n\nYour [pc.cock " + x + "] suddenly becomes impossibly erect, which causes you to flinch in surprise. It only lasts for a moment, though, and once it passes you can’t help but notice that <b>your dick feels a bit heavier and more solid.</b>");
							pc.cocks[x].cLengthRaw = newLength;
							if (pc.cocks[x].cThicknessRatioRaw < 1.5) pc.cocks[x].cThicknessRatioRaw = 1.5;
							groinChanged = true;
							changes++;
						}
						else output("\n\n" + pc.cockLengthLockedMessage());
					}
				}
				// Groin - Balls
				if (changes < changeLimit && pc.balls > 0 && rand(2) == 0)
				{
					// balls increase/decrease to 2
					if (pc.ballSizeRaw != 12 && rand(2) == 0)
					{
						var newBallSize:Number = pc.ballSizeRaw;
						var ballShrink:Boolean = false;
						if (newBallSize < 12)
						{
							newBallSize += 2;
							if (pc.hasPerk("Bulgy")) newBallSize += 2;
							if (newBallSize > 12) newBallSize = 12;
						}
						else if (newBallSize > 12)
						{
							newBallSize -= 2;
							if (newBallSize < 12) newBallSize = 12;
							ballShrink = true;
						}
						else
						{
							if (newBallSize > 12) ballShrink = true;
							newBallSize = 12;
						}
						if (pc.ballSizeUnlocked(newBallSize))
						{
							output("\n\nYour [pc.balls] begin" + (pc.balls == 1 ? "s" : "") + " to feel a little warm. Reaching down to give " + (pc.balls == 1 ? "it" : "them") + " a quick rub to comfort the odd sensation you find <b>" + (pc.balls == 1 ? "it has" : "they’ve") + " " + (ballShrink ? "gotten a bit smaller" : "grown a bit larger") + "</b>.");
							pc.ballSizeRaw = newBallSize;
							changes++;
						}
						else output("\n\n" + pc.ballSizeLockedMessage());
					}
				}
				// Groin - Cock Type
				if (changes < changeLimit && !groinChanged && hasHradSkinColor && pc.isBiped() && pc.hasCock() && pc.cockTotal(GLOBAL.TYPE_HRAD) != pc.cockTotal() && rand(2) == 0)
				{
					// Select non-hrad cock
					x = -1;
					var nonHradCocks:Array = [];
					for(b = 0; b < pc.cockTotal(); b++)
					{
						if (pc.cocks[b].cType != GLOBAL.TYPE_HRAD) nonHradCocks.push(b);
					}
					if (nonHradCocks.length > 0) x = nonHradCocks[rand(nonHradCocks.length)];
					// 1 cock becomes hrad cock
					if (x >= 0)
					{
						if (pc.cockTypeUnlocked(x, GLOBAL.TYPE_HRAD))
						{
							output("\n\nYour [pc.cock " + x + "] begins to feel warm and swells to full erection.");
							// if (pc is clothed):
							if (pc.isCrotchGarbed() && !pc.isCrotchExposed())
							{
								output(" Feeling an intense need, you whip [pc.eachCock] out as");
								if (pc.cockTotal() == 1) output(" it is");
								else output(" they are");
								output(" desperate for some attention.");
							}
							// if (pc is nude):
							else
							{
								output(" [pc.EachCock] surge");
								if (pc.cockTotal() == 1) output("s");
								output(" and you almost call out at the intensity of the sensation");
								if (pc.cockTotal() != 1) output("s");
								output(".");
							}
							output(" The [pc.cockNoun " + x + "] is dripping profusely as it transforms. Its [pc.cockHead " + x + "] warps in shape, then swells and becomes an angry purple color as the skin shifts around it until the newly-formed, violet head is half covered in foreskin.");
							pc.shiftCock(x, GLOBAL.TYPE_HRAD);
							output(" You fall to your [pc.knees] and thrust forward as [pc.eachCock] shoots a deluge of [pc.cum]. It isn’t a true orgasm but damn does it feel good. <b>You now have a bullet-shaped cock!</b>");
							pc.lust(50);
							groinChanged = true;
							changes++;
						}
						else output("\n\n" + pc.cockTypeLockedMessage());
					}
				}
				// Cum Type
				if (changes < changeLimit && !groinChanged && pc.hasCock() && pc.cockTotal(GLOBAL.TYPE_HRAD) == pc.cockTotal() && pc.cumType != GLOBAL.FLUID_TYPE_HRAD_CUM && rand(2) == 0)
				{
					if (pc.cumTypeUnlocked(GLOBAL.FLUID_TYPE_HRAD_CUM))
					{
						output("\n\n[pc.EachCock] grow");
						if (pc.cockTotal() != 1) output("s");
						output(" erect.");
						// pc is clothed:
						if (pc.isCrotchGarbed() && !pc.isCrotchExposed())
						{
							output(" You pull at your [pc.lowerGarments] until your dick");
							if (pc.cockTotal() == 1) output(" is");
							else output("s are");
							output(" free of confinement.");
						}
						output(" You look down to find your cock");
						if (pc.cockTotal() != 1) output("s");
						output(" dripping a creamy, clearish liquid. Upon inspection, you find the substance to be syrup. <b>You now cum syrupy hradian cum!</b>");
						pc.cumType = GLOBAL.FLUID_TYPE_HRAD_CUM;
						groinChanged = true;
						changes++;
					}
					else output("\n\n" + pc.cumTypeLockedMessage());
				}
				// Girl Cum Type
				if (changes < changeLimit && pc.girlCumType != GLOBAL.FLUID_TYPE_HRAD_CUM && pc.hasVagina() && rand(2) == 0)
				{
					if (pc.girlCumTypeUnlocked(GLOBAL.FLUID_TYPE_HRAD_CUM))
					{
						output("\n\nYou groan as a sudden warmth blooms within [pc.eachVagina]. The sensation makes you tingle all over with desire.");
						// pc is clothed:
						if (pc.isCrotchGarbed() && !pc.isCrotchExposed())
						{
							output(" You claw at your [pc.lowerGarments] until [pc.eachVagina]");
							if (pc.totalVaginas() == 1) output(" is");
							else output(" are");
							output(" free of confinement");
						}
						output(" You can’t help but rub yourself a bit - but as you do, you find your hands covered in a creamy white substance. <b>You now have syrupy hradian girl cum!</b>");
						pc.girlCumType = GLOBAL.FLUID_TYPE_HRAD_CUM;
						pc.lust(Math.round(pc.lustMax()/2));
						groinChanged = true;
						changes++;
					}
					else output("\n\n" + pc.girlCumTypeLockedMessage());
				}
				// Ass
				var buttSizeIncrease:Number = 1 + rand(2);
				if (changes < changeLimit && pc.legCount == 2 && pc.buttRatingRaw < 10)
				{
					if (pc.buttRatingUnlocked(pc.buttRatingRaw + buttSizeIncrease))
					{
						output("\n\nYou begin to feel a twitching sensation in your [pc.ass]. You look back to see that your butt is practically twerking without you doing anything. Once the odd phenomenon is over, <b>your ass feels a bit heavier.</b>");
						pc.buttRatingRaw += buttSizeIncrease;
						changes++;
					}
					else output("\n\n" + pc.buttRatingLockedMessage());
				}
				// Legs
				if (changes < changeLimit && pc.legCount != 2 && rand(2) == 0)
				{
					if (pc.legCountUnlocked(2) || (pc.legCount > 3 && pc.legCountUnlocked(pc.legCount - 2)))
					{
						if (pc.legCount <= 1)
						{
							// naga:
							if (pc.isNaga()) output("\n\nA prickling sensation starts at the tip of your [pc.legOrLegs].");
							// goo:
							else output("\n\nThe world begins to shake as your [pc.legOrLegs] begin to vibrate.");
							output(" Looking down, you watch as your lower half begins to split down the middle, continuing toward your upper half until it stops at your groin. <b>You now have two [pc.legs].</b>");
							pc.legCount = 2;
						}
						// legs > 2: 
						else if (pc.legCount > 2)
						{
							// legs = 3: (lose extra legs 1 at a time) 
							if (pc.legCount == 3)
							{
								output("\n\nWith an almost sickening lurch you are suddenly off balance as one of your [pc.legs] begin to twitch violently. The feeling, while a little disconcerting, isn’t painful but soon <b>the twitching [pc.leg] disintegrates into nothingness</b>.");
								pc.legCount -= 1;
							}
							// legs > 3: (lose extra legs 2 at a time)
							else
							{
								output("\n\nWith a sickening lurch you are suddenly off balance as two of your [pc.legs] begin to vibrate violently. As you shift your weight to keep your two rear-most [pc.legs] from touching the ground, <b>they begin to disintegrate into nothingness</b>.");
								//if pcHasTail:
								if (pc.tailCount != 0)
								{
									output(" You look back to see if your [pc.tails] ");
									if (pc.tailCount == 1) output("was");
									else output("were");
									output(" altered by the disappearance of your hind [pc.legs], luckily ");
									if (pc.tailCount == 1) output("it is");
									else output("they are");
									output(" still intact and ");
									if (pc.tailCount == 1) output("is");
									else output("are");
									output(" left completely unchanged.");
								}
								pc.legCount -= 2;
							}
						}
						if (pc.legCount <= 3) pc.genitalSpot = 0;
						changes++;
					}
					else output("\n\n" + pc.legCountLockedMessage());
				}
				// Feet
				if (changes < changeLimit && pc.legCount == 2 && pc.legType != GLOBAL.TYPE_HUMAN && rand(2) == 0)
				{
					if (pc.legTypeUnlocked(GLOBAL.TYPE_HUMAN))
					{
						output("\n\nYou feel a gurgling feeling in your [pc.feet] that puts you on your ass. You lift them only to find that the event is over and you now have human feet with five toes on each foot. You can’t help but to wiggle them a bit before getting back up <b>on your now-human legs</b>.");
						pc.legType = GLOBAL.TYPE_HUMAN;
						pc.clearLegFlags();
						pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
						changes++;
					}
					else output("\n\n" + pc.legTypeLockedMessage());
				}
				// Dud notice
				if (changes == 0)
				{
					output("\n\n... And nothing happens. It seems");
					if (pc.race() == "hrad") output(" you are as hradian as you are going to get.");
					else output(" the potion had no effect on your body after all.");
				}
				return false;
			}
			else
			{
				output(target.capitalA + target.short + " drinks the Big Green potion to no effect.");
			}
			return false;
		}
	}
}
