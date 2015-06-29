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
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	import classes.CockClass;
	import classes.BreastRowClass;
	import classes.VaginaClass;

	public class OvirAce extends ItemSlotClass
	{
		public function OvirAce()
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 10;
			this.type = GLOBAL.PILL;

			shortName = "OvirAce";
			longName = "Ovir Ace";

			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));

			description = "a gel-filled capsule stamped with the name 'Ovir Ace'";

			tooltip = "This gel-filled capsule is solid purple and has the words ‘Ovir Ace’ stamped onto it. Originally commissioned by the ovir government from Xenogen Biotech, this pill was meant for ovir who had undergone too many ‘non-native’ transformations and wished to turn back. Now the pill is freely available on the market for all those who wish to take on features of the reptilian ovir. Xenogen Biotech guarantees its effectiveness in 98% of all subjects, and assures there's a minimal amount of horrible side-effects."

			TooltipManager.addTooltip(shortName, tooltip);

			basePrice = 540;

			this.version = _latestVersion;
		}

		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();

			if (!(target is PlayerCharacter))
			{
				output(target.capitalA + target.short + " uses it to no effect.");
				return false;
			}

			//Taking pill
			output("You pop the little gel-filled capsule in your mouth and swallow. Easy and painless.");

			ApplyTFs(target, false);

			return false;
		}

		public static function ApplyTFs(target:Creature, forceChanges:Boolean):Number
		{
			var changes:int = 0;
			var changeLimit:int = 1;

			for (var ri:int = 0; ri < 4; ri++)
			{
				if (rand(ri + 2) == 0) changeLimit++;
			}

			// Male-centric TFs
			// Requires a wangdoodle
			if (target.hasCock())
			{
				//Reduce masculinity, increase femininity. (High chance when masculine, lower when androgynous/feminine)
				if (target.femininity < 90 && target.femininityUnlocked(90) && (forceChanges || (rand(100) >= target.femininity && changes < changeLimit)))
				{
					//If masculine face
					if (target.hasFaceFlag(GLOBAL.FLAG_ANGULAR) || target.hasBeard() || target.femininity <= 40)
					{
						output("\n\nA brief flutter of pain arcs through your face. You bring a hand up to it, feeling it reshape slightly under your fingertips. After a moment of shifting you're certain you look a little less masculine.");

						if (target.hasFaceFlag(GLOBAL.FLAG_ANGULAR))
						{
							output(" You can feel the perfectly sculpted angle of your jaw round off, loosing it's definitively masculine definition!");
							target.removeFaceFlag(GLOBAL.FLAG_ANGULAR);
						}
						else if (target.hasBeard())
						{
							// 9999 - prob vary more based on beardlength but whatevs
							output(" You take stock of your visage with delicate touches, noticing a lack of the bristly, abrasive facial hair that used to adorn your face.");
							target.beardLength = 0;
						}
					}
					//If androgynous/feminine face
					else
					{
						output("\n\nYour face feels momentarily numb. As you bring a hand up to it, you feel the flesh reshaping, smoothing out and taking on an even more feminine shape.");
					}

					target.femininity += 5;
					if (target.femininity > 90) target.femininity = 90;
					changes++;
				}

				//Increase bust size, up to DD-EE cup. Only affects upper row. If the PC is at DD-cup, the chances of this are lowered
				if (target.breastRows[0].breastRatingRaw < 9 && target.breastRatingUnlocked(0, 9) && (forceChanges || (rand(10) >= target.breastRows[0].breastRatingRaw && changes < changeLimit)))
				{
					//Gain A-cups first!
					if (target.breastRows[0].breastRatingRaw < 1)
					{
						output("\n\nYou feel a sudden warmth in your chest. Before your eyes your bosom blossoms, taking on feminine curves. You'd estimate you're probably an A-cup now.");
						target.breastRows[0].breastRatingRaw = 1;
					}
					//Growing up past A
					else if (target.breastRows[0].breastRatingRaw < 8)
					{
						var bInc:int = 1;
						if (target.breastRows[0].breastRatingRaw < 5 && rand(2) == 0) bInc += 1;
						target.breastRows[0].breastRatingRaw += bInc;

						output("\n\nYour breasts tingle lightly as warmth spreads through you. You cup your breasts and marvel at the pulsing sensation. Your burgeoning tits don't stop until they reach a " + target.breastCup(0) + ".");
					}
					//Reaching EE-cup
					else
					{
						target.breastRows[0].breastRatingRaw = 9;

						output("\n\nYou can't help but bite your lip as a familiar warmth spreads throughout your chest. Your large breasts heave as you breath raggedly. Bringing a hand to them, you can feel the pulse of growth, and can even see as they swell up, becoming a plump, perky "+ target.breastCup(0) +". You cup your new breasts for a moment, marvelling at their new weight and sensitivity.");
					}

					changes++;
				}
	
				//Increase hip size, up to childbearing.
				if (target.hipRatingRaw < 15 && target.hipRatingUnlocked(15) && (forceChanges || (changes < changeLimit && rand(3) == 0)))
				{
					output("\n\nYou change your stance,");
					if (target.hasFeet()) output(" shuffling from [pc.foot] to [pc.foot]");
					else output(" shifting back and forth on your lower body");
					output(", unable to get comfortable for one reason or another. You look down, and are amazed to see your hips widening slightly, developing a more feminine curve to them.");

					var incHip:int = 1;
					if (target.hipRatingRaw <= 0) incHip++;
					if (target.hipRatingRaw <= 5) incHip++;
					if (target.hipRatingRaw <= 10) incHip++;
					target.hipRatingRaw += incHip;

					if (target.hipRatingRaw > 15) target.hipRatingRaw = 15;

					changes++;
				}

				//Increase butt size, up to plump.
				if (target.buttRatingRaw < 10 && target.buttRatingUnlocked(10) && (forceChanges || (changes < changeLimit && rand(3) == 0)))
				{
					output("\n\nAn odd thrill runs up your back, and you're surprised to find your butt is numb, as though you'd been sitting on it for too long. You grope at your derriere, and realize that it's actually growing, helping to fill out your new curves.");

					var incButt:int = 1;
					if (target.buttRatingRaw <= 0) incButt++;
					if (target.buttRatingRaw <= 4) incButt++;
					target.buttRatingRaw += incButt;

					if (target.buttRatingRaw > 10) target.buttRatingRaw = 10;

					changes++;
				}

				//Give reptilian skin (green, purple, red, yellow).
				var tfScales:Boolean = (target.skinType != GLOBAL.SKIN_TYPE_SCALES) && target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SCALES);

				var scaleColors:Array = ["green", "purple", "red", "yellow"];
				var tarColor:String = RandomInCollection(scaleColors);
				var scaletfColor:Boolean = !InCollection(target.scaleColor, scaleColors) && target.scaleColorUnlocked(tarColor);

				if ((tfScales || scaletfColor) && (forceChanges || (changes < changeLimit && rand(5) == 0)))
				{
					var skinDesc:String = target.skinFurScales();
					output("\n\nYour entire body tightens for a moment before your ");
					if (skinDesc.charAt(skinDesc.length - 1) == "s") output(skinDesc + " go");
					else output(skinDesc + " goes")
					output(" cold. Quirking an eyebrow, you give it a few pokes and worriedly note that it's completely numb. After a moment you notice your dermis growing pale and... looser? You experimentally pull at your [pc.skinFurScales], and to your surprise it tears away easily, revealing shiny new " + tarColor + " reptilian-like skin beneath. It takes you a minute or two to fully peel away the layer of shed "+ target.skinNoun() +", but once your new epidermis is fully revealed you feel energized and ready to take on the world.");

					target.skinType = GLOBAL.SKIN_TYPE_SCALES;
					target.scaleColor = tarColor;

					var remColors:Array = scaleColors.splice(scaleColors.splice(scaleColors.indexOf(tarColor), 1));
					target.skinTone = RandomInCollection(remColors);
					
					target.armType = GLOBAL.TYPE_OVIR;

					changes++;
				}

				//Give ovir cock (normalize size towards 8-11").
				var hasNoneOvirCock:Boolean = false;
				var hasChangedCock:Boolean = false;

				for (var ci:int = 0; ci < target.cocks.length; ci++)
				{
					if (target.cocks[ci].cType != GLOBAL.TYPE_EQUINE && target.cockTypeUnlocked(ci, GLOBAL.TYPE_EQUINE))
					{
						hasNoneOvirCock = true;
						break;
					}
					var overDickSkinColor:String = "dark " + target.skinTone;
					if(target.skinTone == "dark") overDickSkinColor = "black";
					else if (target.cocks[ci].cockColor != overDickSkinColor && InCollection(target.skinTone, scaleColors))
					{
						hasNoneOvirCock = true;
						break;
					}
				}

				if (hasNoneOvirCock && (forceChanges || (changes < changeLimit && rand(5) == 0)))
				{
					// Find the longest cock that isn't an Ovir cock, and shift that - we already know at least ONE will be valid.
					var targetCock:int = -1;
					var tCockLen:int = -1;

					// Try and prefer a none-horsedick
					for (ci = 0; ci < target.cocks.length; ci++)
					{
						if (target.cocks[ci].cType != GLOBAL.TYPE_EQUINE && target.cockTypeUnlocked(ci, GLOBAL.TYPE_EQUINE))
						{
							if (target.cocks[ci].cLength() > tCockLen)
							{
								tCockLen = target.cocks[ci].cLength();
								targetCock = ci;
							}
						}
					}
					overDickSkinColor = "dark " + target.skinTone;
					if(target.skinTone == "dark") overDickSkinColor = "black";
					// Failing that, find a cock that is the wrong color wrt Ovir-colouring.
					if (targetCock == -1)
					{
						for (ci = 0; ci < target.cocks.length; ci++)
						{
							if (target.cocks[ci].cockColor != overDickSkinColor)
							{
								if (target.cocks[ci].cLength() > tCockLen)
								{
									tCockLen = target.cocks[ci].cLength();
									targetCock = ci;
								}
							}
						}
					}

					output("\n\nYour [pc.cock " + targetCock + "] feels odd for a moment. Heat spreads throughout its length, and blood pulses through it, quickly causing it to engorge. A tingling pain passes over your manhood briefly, and before your eyes you see it change.");
					if (target.cocks[targetCock].cType == GLOBAL.TYPE_EQUINE)
					{
						output(" It barely transforms, really, just smoothing out in overall shape, taking on a " + overDickSkinColor + " hue.");
						target.cocks[targetCock].cockColor = overDickSkinColor;
						output(" You give your cock a few experimental strokes and let out a light moan. Mmm, yeah that will do.");
					}
					else
					{
						output(" The first thing you notice is the color change. Your dick seems to deepen in color, taking on a " + overDickSkinColor + " hue. The whole thing seems to elongate, smoothing out in shape, leaving you with a semi-flat head, a flare-like crown and a long, smooth shaft.");
						
						var tCock:CockClass = target.cocks[targetCock];
						tCock.cockColor = overDickSkinColor;
						tCock.cType = GLOBAL.TYPE_EQUINE;
						tCock.clearFlags();
						tCock.addFlag(GLOBAL.FLAG_BLUNT);
						tCock.addFlag(GLOBAL.FLAG_FLARED);
						tCock.addFlag(GLOBAL.FLAG_SHEATHED); // 9999

						output(" You give your new cock a few experimental strokes and let out a light moan. Mmm, yeah that will do.");
					}
					changes++;
					hasChangedCock = true;
				}

				var hasLongCock:Boolean = false;
				targetCock = -1;
				tCockLen = 11;

				for (ci = 0; ci < target.cocks.length; ci++)
				{
					if (target.cocks[ci].cLengthRaw > tCockLen)
					{
						hasLongCock = true;
						targetCock = ci;
						tCockLen = target.cocks[ci].cLengthRaw;
					}
				}

				//(Shrink cock if over 11")
				if (hasLongCock && (forceChanges || (changes < changeLimit && rand(3) == 0)) && !hasChangedCock)
				{
					output("\n\nYour hefty [pc.cock " + targetCock + "] suddenly feels very... tight. You frown and grip you dick carefully. Pain shoots through you and you can <i>feel</i> your dick shrinking. <b>Thankfully the discomfort eases after a moment, and you're left with a dick about two inches shorter!</b>");

					target.cocks[targetCock].cLengthRaw -= 2;

					if (target.cocks[targetCock].cLengthRaw < 8) target.cocks[targetCock].cLengthRaw = 8;

					changes++;
					hasChangedCock = true;
				}

				var hasShortCock:Boolean = false;
				targetCock = -1;
				tCockLen = 8;

				for (ci = 0; ci < target.cocks.length; ci++)
				{
					if (target.cocks[ci].cLengthRaw < tCockLen)
					{
						hasShortCock = true;
						targetCock = ci;
						tCockLen = target.cocks[ci].cLengthRaw;
					}
				}

				// (Enlarge cock if under 8")
				if (hasShortCock && (forceChanges || (changes < changeLimit && rand(3) == 0)) && !hasChangedCock)
				{
					output("\n\nYour tiny [pc.cock " + targetCock + "] aches for a moment. Blood rushes to it, and before long it is positively throbbing, almost painfully. You clench your teeth and wince. Your hands dart to your cock, and realize your manhood is <i>growing</i>. You watch in rapt fascination as your cock pulses, growing larger and larger. <b>By the time it stops, you're left with a penis about two inches longer!</b>");

					target.cocks[targetCock].cLengthRaw += 2;
					if (target.cocks[targetCock].cLengthRaw > 11) target.cocks[targetCock].cLengthRaw = 11;

					changes++;
					hasChangedCock = true;
				}

				////Chance to remove balls/increase cum production.
				var changedBalls:Boolean = false;

				if ((target.ballSizeRaw <= 2 && target.balls > 0 && target.ballsUnlocked(0)) || (target.ballSizeRaw > 2 && target.ballSizeUnlocked(target.ballSizeRaw - 2)) && (forceChanges || (changes < changeLimit && rand(5) == 0)))
				{
					output("\n\nA flash of pain ripples through your body for a moment, centering on your groin. You wince, your hands darting between your legs. It's not your [pc.cock] that's to blame though.... Your");
					if (target.hasStatusEffect("Uniball")) output(" trappy ball pouch"); // 9999
					else output(" scrotum");
					output(" aches, and you can feel the skin pulling upward");
					if (target.ballSizeRaw <= 2) output(" more than usual");
					output(". The discomfort rises as you close your eyes and realize with some trepidation that your testicle");
					if (target.balls > 1) output("s are");
					else output(" is");
					output(" retreating upward, pulling into your body.");

					if (target.ballSizeRaw <= 2)
					{
						output(" They shift around, your internal anatomy rearranging to fit your new... configuration. Your testicle");
						if (target.balls > 1) output("s settle");
						else output(" settles");
						output(" in somewhere just above your dick, and all that's left beneath is a smooth patch of skin. No one would ever know you had balls.");

						target.balls = 0;
					}
					else
					{
						target.ballSizeRaw -= 2;
						output(" <b>Your balls have shrunk!</b>");
					}

					changes++;
					changedBalls = true;
				}

				if (target.balls == 0 && (target.refractoryRate < 2.5 || target.cumMultiplierRaw < 2.5) && changedBalls == false && (forceChanges || (changes < changeLimit && rand(3) == 0)))
				{
					//(If balls already removed, increase cum production!)
					output("\n\nThere's a heat rising in your gut, something warm and not altogether unpleasant. You press a hand to your stomach and feel your insides churning. After a moment the heat passes and you feel... more productive, somehow.");

					if (target.refractoryRate < 2.5) target.refractoryRate += 0.25;
					if (target.cumMultiplierRaw < 2.5) target.cumMultiplierRaw += 0.25;
					changes++;
				}

				//Give genital slit. (must not have balls)
				if (target.balls == 0 && (forceChanges || (changes < changeLimit && rand(3) == 0)) && !target.hasStatusEffect("Genital Slit"))
				{
					output("\n\nAn odd sensation overtakes you. Your entire body shivers as a warmth rises in your groin... but it's not centered on your [pc.cock]. Feeling between your legs, you notice new flesh burgeoning, and a new... slit?");
					if (target.hasVagina()) output(" You poke around inside for a moment, and are relieved to find your [pc.vagina] within the new crevasse.");
					output(" The odd warmth spreads further, now overtaking your cock. Before your eyes, your dick pulls inwards, enveloped completely within the slit. Pressing a hand against your stomach, you realize your cock isn't gone, merely sheathed inside your new addition. <b>You now have a cloaca.</b>");

					target.createStatusEffect("Genital Slit");
					changes++;
				}
			}
			//Female TFs (PC cannot have a cock)
			else
			{
				//Reduce masculinity and femininity, tend towards 60 on the masculine/feminine scale.
				var changeFem:Boolean = (target.femininity <= 59 || target.femininity >= 61) && target.femininityUnlocked(60);

				if (changeFem && (forceChanges || (changes < changeLimit && rand(2) == 0)))
				{
					//Moving towards feminine.
					if (target.femininity <= 59)
					{
						output("\n\nA twinge of pain crosses your face. You blink, practically feel your face changing, shifting in very subtle ways. After a moment the pain ends and you're sure your face is more masculine.");

						if (target.femininity < 55) target.femininity += 5;
						else if (target.femininity < 57) target.femininity += 2;
						else if (target.femininity <= 59) target.femininity = 60;
					}
					//Moving away from feminine.
					else
					{
						output("\n\nYour face suddenly pulses with discomfort, as though it were being pinched by dozens of hands. You wince, bringing a hand up to it, just in time to feel your face reshaping itself. After a moment the pain fades and you're sure your face is now less feminine.");

						if (target.femininity > 65) target.femininity -= 5;
						else if (target.femininity > 63) target.femininity -= 2;
						else if (target.femininity >= 61) target.femininity = 60;
					}

					changes++;
				}

				//Shrink bust size if over B cup.
				var bigTitties:Boolean = false;
				var sizeWeighting:int = 2;

				for (var bi:int = 0; bi < target.breastRows.length; bi++)
				{
					if (target.breastRows[bi].breastRatingRaw > sizeWeighting)
					{
						bigTitties = true;
						sizeWeighting = target.breastRows[bi].breastRatingRaw;
					}
				}

				if (bigTitties && (forceChanges || (rand(3 * sizeWeighting) >= 2 && changes < changeLimit)))
				{
					var affectedRows:int = 0;
					var biggestLoss:int = 0;

					for (bi = 0; bi < target.breastRows.length; bi++)
					{
						if (target.breastRows[bi].breastRatingRaw > 2)
						{
							affectedRows++;
							var loss:int = Math.min(Math.abs(target.breastRows[bi].breastRatingRaw - 2), 2);
							target.breastRows[bi].breastRatingRaw -= loss;
							if (loss > biggestLoss) biggestLoss = loss;
						}
					}

					// 9999 -- might be better tweaked for multirows
					output("\n\nYou feel off balance for a moment as you realize you're losing weight in your chest. Your boobs are shrinking! Right before your eyes you see your breasts lose");
					if (biggestLoss == 2) output(" two cup sizes.");
					else output(" a cup size.");
					output(" You experimentally cup you new, smaller boobs and find them to be quite perky at least.");

					changes++;
				}

				//Shrink hip size if over childbearing.
				if (target.hipRatingRaw > 15 && target.hipRatingUnlocked(15) && (forceChanges || (changes < changeLimit && rand(3) == 0)))
				{
					if (target.hipRatingRaw > 18) target.hipRatingRaw--;
					target.hipRatingRaw--;

					if (target.hipRatingRaw < 15) target.hipRatingRaw = 15;

					output("\n\nA sudden tightness overtakes midsection. A searing pain flashes through you, as though your bones themselves were changing. Your hips reshape themselves, becoming more slender, leaving you a little less curvy.");
					changes++;
				}

				//Shrink butt size if over plump.
				if (target.buttRatingRaw > 10 && target.buttRatingUnlocked(10) && (forceChanges || (changes < changeLimit && rand(3) == 0)))
				{
					if (target.buttRatingRaw > 15) target.buttRatingRaw--;
					target.buttRatingRaw--;

					if (target.buttRatingRaw < 10) target.buttRatingRaw = 10;

					output("\n\nYour butt all of a sudden feels tight, as though you were wearing a pair of pants two sizes too small. You wince and grip your buttocks, and feel it losing mass under your hand. After a moment you're left with a much smaller, less curvy butt.");

					changes++;
				}

				//Give reptilian skin (brown, tan, olive green).
				tfScales = (target.skinType != GLOBAL.SKIN_TYPE_SCALES) && target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SCALES);

				scaleColors = ["brown", "tan", "olive green"];
				tarColor = RandomInCollection(scaleColors);
				scaletfColor = !InCollection(target.scaleColor, scaleColors) && target.scaleColorUnlocked(tarColor);

				if ((tfScales || scaletfColor) && (forceChanges || (changes < changeLimit && rand(5) == 0)))
				{
					skinDesc = target.skinFurScales();
					output("\n\nYour entire body tightens for a moment before your ");
					if (skinDesc.charAt(skinDesc.length - 1) == "s") output(skinDesc + " go");
					else output(skinDesc + " goes")
					output(" cold. Quirking an eyebrow, you give it a few pokes and worriedly note that it's completely numb. After a moment you notice your dermis growing pale and... looser? You experimentally pull at your [pc.skinFurScales], and to your surprise it tears away easily, revealing shiny new " + tarColor + " reptilian-like skin beneath. It takes you a minute or two to fully peel away the layer of shed "+ target.skinNoun() +", but once your new epidermis is fully revealed you feel energized and ready to take on the world.");

					target.skinType = GLOBAL.SKIN_TYPE_SCALES;
					target.scaleColor = tarColor;

					remColors = scaleColors.splice(scaleColors.splice(scaleColors.indexOf(tarColor), 1));
					target.skinTone = RandomInCollection(remColors);

					target.armType = GLOBAL.TYPE_OVIR;
					
					changes++;
				}
	
				//Increase wetness.
				var hasDryVag:Boolean = false;

				for (var vi:int = 0; vi < target.vaginas.length; vi++)
				{
					if (target.vaginas[vi].wetnessRaw < 4) hasDryVag = true;
				}

				if (hasDryVag && (forceChanges || (changes < changeLimit && rand(3) == 0)))
				{
					for (vi = 0; vi < target.vaginas.length; vi++)
					{
						if (target.vaginas[vi].wetnessRaw < 4) target.vaginas[vi].wetnessRaw += 1;
					}

					output("\n\nYour knees suddenly go weak as a flood of near-orgasmic bliss spreads throughout your [pc.vagina]. The tingling continues and you realize that you're not only wet, but you're practically <i>dripping</i>. Femjuice runs down your legs in tiny rivers, pooling around your feet in little puddles. Whatever just happened, you're most certainly able to get wetter than normal.");

					changes++;
				}
			}

			//Universal changes

			//Make face human-like if otherwise.
			var notHFace:Boolean = (target.faceType != GLOBAL.TYPE_HUMAN && target.faceTypeUnlocked(GLOBAL.TYPE_HUMAN));
			var hasMuzzle:Boolean = (target.hasFaceFlag(GLOBAL.FLAG_MUZZLED) && target.faceFlagsUnlocked(GLOBAL.FLAG_MUZZLED));
			if ((notHFace || hasMuzzle) && (forceChanges || (changes < changeLimit && rand(3) == 0)))
			{
				output("\n\nYour face explodes in needling pain, like a leg that has fallen asleep. You wince and clutch your hands to your face. The flesh beneath shifts oddly, transforming, flattening out in some places while filling out in others.");

				if (hasMuzzle && !notHFace)
				{
					output(" <b>As the tingling faces, you realize the muzzle-like extrusion of your face has receeded, leaving you with a much more human visage!</b>");
				}
				else
				{
					output(" <b>As the tingling fades, you realize your face now looks much like a human's!</b>");
				}

				target.faceType = GLOBAL.TYPE_HUMAN;
				target.removeFaceFlag(GLOBAL.FLAG_MUZZLED);

				changes++;
			}

			//Change eye color (green, blue, yellow, red, grey), and make reptilian.
			var eyeColors:Array = ["green", "blue", "yellow", "red", "grey"];
			var tEyeColor:String = RandomInCollection(eyeColors);
			var tfEyeColor:Boolean = (!InCollection(target.eyeColor, eyeColors) && target.eyeColorUnlocked(tEyeColor));
			var tfEyeType:Boolean = (target.eyeType != GLOBAL.TYPE_SNAKE && target.eyeTypeUnlocked(GLOBAL.TYPE_SNAKE));

			if ((tfEyeColor || tfEyeType) && (forceChanges || (changes < changeLimit && rand(3) == 0)))
			{
				if (tfEyeColor)
				{
					target.eyeColor = tEyeColor;
				}
				if (tfEyeType)
				{
					target.eyeType = GLOBAL.TYPE_SNAKE;
				}

				output("\n\nYour vision suddenly goes blurry, making you blink. You blink again, and find you can't see at all! Panic overtakes you briefly, until your vision starts to return. Though still somewhat blurry, you pull out your codex and use its screen as a mirror to figure out what happened. You blink once or twice, looking into eyes that are not your own. Bright "+ target.eyeColor +" orbs stare back at you");
				if (tfEyeType || target.eyeType == GLOBAL.TYPE_SNAKE)
				{
					output(" with reptilian pupils. The "+ target.eyeColor +" dominates the eye, with no sclera to be seen");
				}
				output(".");

				changes++;
			}

			//Give ovir tongue, then lengthen.
			var tfTongue:Boolean = target.tongueType != GLOBAL.TYPE_OVIR && target.tongueTypeUnlocked(GLOBAL.TYPE_OVIR);
			var lTongue:Boolean = target.tongueType == GLOBAL.TYPE_OVIR && !target.hasTongueFlag(GLOBAL.FLAG_LONG) && target.tongueFlagsUnlocked(GLOBAL.FLAG_LONG);

			//Gain tongue
			if (tfTongue && (forceChanges || (changes < changeLimit && rand(2) == 0)))
			{
				
				output("\n\nAn immediate swelling overtakes your tongue. It quickly fills your mouth, making it hard to speak. You stick it out and feel as it smoothes out, becoming smoother and somewhat longer. It tapers down to a point on the end while the swelling subsides, bringing it back down to its normal size. With some trepidation you realize you can <i>smell</i> with it now. That will take some getting used to.");

				target.tongueFlags = [];
				target.tongueType = GLOBAL.TYPE_OVIR;

				changes++;
			}

			//Lengthen!
			if (!tfTongue && lTongue && (forceChanges || (changes < changeLimit && rand(2) == 0)))
			{
				output("\n\nYour tongue swells once more, filling your mouth to the brim. You stick out your tongue, and are surprised to see it within your sight range. Even more surprising, it seems to be growing! The long, lizard-like tongue whips back and forth as it grows, stopping at what you'd estimate is between eight or nine inches long. As the swelling subsides you retract your tongue, finding it still fits within your mouth as normal.");

				target.addTongueFlag(GLOBAL.FLAG_LONG);
				changes++;
			}

			//Give Ovir tail. (requires reptilian skin)
			var tfTail:Boolean = target.skinType == GLOBAL.SKIN_TYPE_SCALES && target.tailType != GLOBAL.TYPE_OVIR && target.tailTypeUnlocked(GLOBAL.TYPE_OVIR);
			if (tfTail && (forceChanges || (changes < changeLimit && rand(3) == 0)))
			{
				//If no tail
				if (target.tailType == 0 || target.tailCount == 0)
				{
					output("\n\nA piercing pain suddenly strikes your back, as if your spine were being stretched. You double over, clutching your stomach until the pain subsides. When you stand back up, you nearly topple over backwards as you notice a new weight on your body… a large, thick reptilian tail extends from your tailbone. You swish it back and forth, getting used to its bulk.");
				}
				//If PC has a tail
				else
				{
					output("\n\nAn odd sensation tickles your butt, and looking back you notice your tail morphing oddly. It pulls back slowly, as if shrinking, condensing into a single spot at the base of your spine. You feel a tightness there, and then sudden release as the spot pops soundlessly, a long reptilian tail growing in its place. It quickly balloons outward, becoming several feet long and quite thick around the base in a matter of seconds.");
				}

				target.tailCount = 1;
				target.tailType = GLOBAL.TYPE_OVIR;
				target.tailFlags = [GLOBAL.FLAG_SCALED];

				changes++;
			}

			//Make lower body bipedal if it wasn't already.
			var tfLowerBody:Boolean = (target.legCount != 2 && target.legCountUnlocked(2)) || (target.legType != GLOBAL.TYPE_OVIR && target.legTypeUnlocked(GLOBAL.TYPE_OVIR));
			if (tfLowerBody && (forceChanges || (changes < changeLimit && rand(2) == 0)))
			{
				output("\n\nA small twinge of pain hits you, then another one, and another. Suddenly your entire body is on fire. You double over and collapse. Your vision slowly slips away, and you black out. When you come to again, you stand up on shaky feet");
				if (target.legCount != 2) output("... two shaky feet");
				output(". You look down, perplexed. It seems that when you were unconscious, your lower body has reshaped,");
				if (target.legCount != 2 || target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE) || target.hasLegFlag(GLOBAL.FLAG_HOOVES)) output(" taking on a bipedal, humanoid appearance!");
				else output(" gaining a lusiously scaled covering!");

				target.genitalSpot = 0;
				target.legCount = 2;
				target.legFlags = [GLOBAL.FLAG_PLANTIGRADE, GLOBAL.FLAG_SCALED];
				target.legType = GLOBAL.TYPE_OVIR;

				changes++;
			}

			//Remove extra breasts and/or rows
			var remRow:Boolean = target.breastRows.length > 1 && target.removeBreastRowUnlocked(target.breastRows.length - 1, 1);
			var boobCount:Boolean = target.breastRows[0].breasts != 2 && target.breastsUnlocked(0, 2);
			if ((remRow || boobCount) && (forceChanges || (changes < changeLimit && rand(3) == 0)))
			{
				//Remove lowest breast row
				if (remRow)
				{
					output("\n\nYou feel a sudden lightness on your chest. Looking down, you search around on your upper body for just what happened. To your surprise, you're missing an entire row of breasts!");

					target.breastRows.pop();
				}
				//Remove extra breasts in top row
				else if (boobCount)
				{
					// if one
					if (target.breastRows[0].breasts == 1)
					{
						output("\n\nYou glance down at your chest, and notice a lump rapidly swelling lump on your chest. You raise a hand and cup the growth, somewhat shocked by your ability to actually <i>feel</i> it growing larger with every passing second. Within moments it has grown to match the size of your singular breast, your chestflesh rearranging itself to better support the pair of tits you now sport.");

						target.breastRows[0].breasts = 2;
					}
					//if Three
					else if (target.breastRows[0].breasts == 3)
					{
						output("\n\nYou glance down at your chest, and notice one of your breasts seems to be smaller than the rest. You raise a hand and cup the breast, surprised to find it shrinking beneath your fingers. Within seconds it's gone, and your other two breasts seem to shift over, taking its spot.");

						target.breastRows[0].breasts = 2;
					}
					//More than three
					else if (target.breastRows[0].breasts > 3)
					{
						output("\n\nYou feel an odd sensation on your chest, as though you were rapidly losing weight. You look down at your numerous breasts, and find the shrinking one. Within seconds it's gone, and the rest of your breasts seem to shift around, taking its spot.");

						target.breastRows[0].breasts -= 1;
					}
				}

				changes++;
			}

			//Increase anal wetness.
			if (target.ass.wetnessRaw < 4 && target.analWetnessUnlocked(4) && (forceChanges || (changes < changeLimit && rand(3) == 0)))
			{
				target.ass.wetnessRaw += 1;
				if (target.ass.wetnessRaw > 4) target.ass.wetnessRaw = 4;
				output("\n\nA warm, tingling feeling rushes through your body, starting in your stomach and flowing downward. It feels concentrated in your ass. Puzzled, you slip a hand over your butt and probe at your asshole. A shiver runs up your spine, and you can't help but let a little moan out. Your [pc.asshole] feels much more sensitive and a little wetter than usual!");

				changes++;
			}

			if (changes == 0)
			{
				output("\n\nDespite your patient waiting, nothing happens. Maybe the pill was a dud?");
			}

			return changes;
		}
	}
}