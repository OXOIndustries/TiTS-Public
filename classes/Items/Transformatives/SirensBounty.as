// Siren’s Bounty: Suula TF
// Written by JohanLitvisk

/*
Summary
The Space Sirens are finally in the game with the addition of Azra, so why not make a TF that allows Steele to transform into one without having to fiddle with Dove Balm and Shark Bite save scumming? Siren’s Bounty is a liquid TF in a mini water bottle that will allow Steele to become an alluring Suula and have a stingy tentacle dick and/or stingy pussy.
*/

package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	import classes.Engine.Utility.indefiniteArticle;
	import classes.Engine.Utility.rand;
	
	public class SirensBounty extends ItemSlotClass
	{
		public function SirensBounty()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			
			shortName = "S.Bounty";
			longName = "Siren’s Bounty";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a steel flask of Siren’s Bounty";
			tooltip = "[altTooltip SirensBounty]";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 7200;
			
			version = _latestVersion;
		}
		
 		public function hasSharkScales():Boolean
 		{
 			return (kGAMECLASS.pc.skinType == GLOBAL.SKIN_TYPE_SCALES && kGAMECLASS.pc.hasSkinFlag(GLOBAL.FLAG_LUBRICATED));
 		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("JohanLitvisk");
			
			// Vendor: Nevrie
			
			if(target is PlayerCharacter)
			{
				var pc:Creature = target;
				var changes:int = 0;
				var changeLimit:int = 3;
				if(rand(2) == 0) changeLimit++;
				if(rand(2) == 0) changeLimit++;
				
				// Consumption Text
				output("You twist the cap of the flask and take a cursory sniff of the liquid inside. It smells pleasantly sweet, reminding you of those ocean scented candles you’ve occasionally seen. Certainly something that smells good must taste good, right? You raise the flask to your lips and swallow all the contents in one go. You hum in approval; the microsurgeon infused liquid tastes pretty damn good! A soothing heat fills your stomach as your whole body relaxes, most likely in preparation for the bodily changes you’re about to receive.");
				
				// Skin changes to Scales
				// [pc.skinType] not scales: Skin type changes to scales
				if(changes < changeLimit && pc.skinType != GLOBAL.SKIN_TYPE_SCALES && rand(3) == 0)
				{
					if(pc.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SCALES))
					{
						
						output("\n\nYou feel your skin tighten all of a sudden before a rippling pulse travels over your body.");
						if(pc.hasFur()) output(" You feel your furry coat recede in your skin, making you feel awfully naked.");
						else if(pc.hasChitin()) output(" Your chitin flattens across your skin and subdivides into smaller fingernail-like plates.");
						else if(pc.hasGooSkin()) output(" Your jello-like skin loses much of its bounce as it regains a definite shape.");
						else if(pc.hasFeathers()) output(" Your feathers flatten on your skin, hardening and shrinking onto your skin.");
						else output(" The structure of your [pc.skinFurScalesNoun] changes, giving off a different physical texture.");
						output(" Confused, you rub your hands against your body, noticing that your <b>skin is now covered in smooth, hydrodynamic scales</b>.");
						
						pc.skinType = GLOBAL.SKIN_TYPE_SCALES;
						pc.clearSkinFlags();
						pc.addSkinFlag(GLOBAL.FLAG_SMOOTH);
						pc.addSkinFlag(GLOBAL.FLAG_LUBRICATED);
					}
					else output("\n\n" + pc.skinTypeLockedMessage());
					changes++;
				}
				// Gain Suula Face
				// [pc.faceType] not shark: Change Face type to shark.
				if(changes < changeLimit && !InCollection(pc.faceType, [GLOBAL.TYPE_SIREN, GLOBAL.TYPE_SHARK]) && rand(4) == 0)
				{
					if(pc.faceTypeUnlocked(GLOBAL.TYPE_SIREN))
					{
						output("\n\nYou immediately notice that your face seems to be losing feeling by the minute. It’s almost like the muscles have fallen asleep on you. Concerned by this turn of events, you rub and pinch your face only for it to tighten. You flinch as your the bones in your face suddenly begin cracking and shifting, becoming increasingly angular. You clamp your eyes shut as the pain reaches a crescendo before finally dissipating into nothing. Unsure of what just happened, you pull up the reflective screen of your Codex to discover that <b>your face has changed to match the muzzled, shark-like appearance of a suula!</b>");
						
						pc.faceType = GLOBAL.TYPE_SIREN;
						pc.clearFaceFlags();
						pc.addFaceFlag(GLOBAL.FLAG_MUZZLED);
						//pc.addFaceFlag(GLOBAL.FLAG_LONG);
					}
					else output("\n\n" + pc.faceTypeLockedMessage());
					changes++;
				}
				else if(changes < changeLimit && pc.faceType == GLOBAL.TYPE_SIREN && !pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED) && rand(4) == 0)
				{
					if(pc.faceFlagsUnlocked(GLOBAL.FLAG_MUZZLED))
					{
						output("\n\nA sharp sensation spears through your skull as the bones in your half-suula face suddenly begin cracking and shifting, becoming increasingly angular. You clamp your eyes shut as the pain reaches a crescendo before finally dissipating into nothing. You quickly flip out your Codex to see that <b>you now have a muzzled, shark-like suula face!</b>");
						
						pc.addFaceFlag(GLOBAL.FLAG_MUZZLED);
					}
					else output("\n\n" + pc.faceFlagsLockedMessage());
					changes++;
				}
				// Extend tongue
				if(changes < changeLimit && InCollection(pc.faceType, [GLOBAL.TYPE_SIREN, GLOBAL.TYPE_SHARK]) && !pc.hasTongueFlag(GLOBAL.FLAG_LONG) && rand(4) == 0)
				{
					if(pc.tongueFlagsUnlocked(GLOBAL.FLAG_LONG))
					{
						output("\n\nYou feel your tongue push against your teeth on its own. Surprised, you open your mouth and and find your [pc.tongue] dangling out, much longer than usual. <b>Your tongue has extended in length!</b>");
						
						pc.addTongueFlag(GLOBAL.FLAG_LONG);
					}
					else output("\n\n" + pc.tongueFlagsLockedMessage());
					changes++;
				}
				// Grow Gills
				// PC has no gills: Grow Gills
				if(changes < changeLimit && !pc.gills && InCollection(pc.faceType, [GLOBAL.TYPE_SIREN, GLOBAL.TYPE_SHARK]) && pc.skinType == GLOBAL.SKIN_TYPE_SCALES && rand(5) == 0)
				{
					if(pc.gillsUnlocked(true))
					{
						output("\n\nYour throat feels irritated as you notice some strange markings on your lower neck. Are those gills? You take a look at yourself and confirm that these slits are indeed gills, covered in a mucosal layer of protection.");
						pc.gills = true;
					}
					else output("\n\n" + pc.gillsLockedMessage());
					changes++;
				}
				// Change Eyes to Suula
				// [pc.eyeType] not suula: Change Eye type to suula
				if(changes < changeLimit && pc.eyeType != GLOBAL.TYPE_SIREN && rand(4) == 0)
				{
					if(pc.eyeTypeUnlocked(GLOBAL.TYPE_SIREN))
					{
						var newEyeColor:String = RandomInCollection(["green", "gold", "blue", "red"]);
						
						output("\n\nA blurry flash fills your vision before disappearing just as quickly as it came. Outside of things being a bit sharper than you remember them, nothing seems to out the ordinary.  You pull up your Codex to assess your eyes. Your sclera are pitch black now, while your pupils have changed into reptilian-esque slits, each surrounded by " + indefiniteArticle(newEyeColor) + " iris. <b>Your eyes are just like a suula now!</b>");
						
						pc.eyeType = GLOBAL.TYPE_SIREN;
						pc.eyeColor = newEyeColor;
					}
					else output("\n\n" + pc.eyeTypeLockedMessage());
					changes++;
				}
				// Gain Suula Ears
				// [pc.earType] not suula: Change Ear type to suula
				if(changes < changeLimit && pc.earType != GLOBAL.TYPE_SIREN && rand(4) == 0)
				{
					if(pc.earTypeUnlocked(GLOBAL.TYPE_SIREN))
					{
						output("\n\nYou feel the tips of your ears tingle with sensitivity before they begin to pull into some kind of point. Your face wrinkles as they seem to grow longer and longer before subsiding. You pull out your codex and take note of your <b>sail-like suula ears</b>!");
						
						pc.earType = GLOBAL.TYPE_SIREN;
						pc.clearEarFlags();
						pc.addEarFlag(GLOBAL.FLAG_LONG);
						pc.earLength = 4;
					}
					else output("\n\n" + pc.earTypeLockedMessage());
					changes++;
				}
				// Lose Horns
				// PC has horns: Lose all horns
				if(changes < changeLimit && pc.hasHorns() && rand(5) == 0)
				{
					if(pc.hornsUnlocked(0)) {
						output("\n\nYour [pc.hornsNoun] feel" + (pc.horns == 1 ? "s" : "") + " awfully stiff for whatever reason. As soon as you try to give " + (pc.horns == 1 ? "it" : "‘em") + " a good ol’ rub, " + (pc.horns == 1 ? "it crumbles" : "they crumble") + " into dust, leaving you hornless.");
						
						pc.removeHorns();
					}
					else output("\n\n" + pc.hornsLockedMessage());
					changes++;
				}
				// Lose Antenne
				// PC has antenna: Lose all antenna
				if(changes < changeLimit && pc.hasAntennae() && rand(5) == 0)
				{
					if(pc.antennaeUnlocked(0))
					{
						output("\n\nThe little feelers on the top of your head vibrate before shrinking back into your forehead. You idly rub your head where they used to be, contemplating the loss of your [pc.antennae]... oh well!");
						
						pc.removeAntennae();
					}
					else output("\n\n" + pc.antennaeLockedMessage());
					changes++;
				}
				// Gain Feather Hair
				// [pc.hairType] not feathers: Change Hair type to feathers
				if(changes < changeLimit && pc.hairType != GLOBAL.HAIR_TYPE_FEATHERS && rand(4) == 0)
				{
					if(pc.hairTypeUnlocked(GLOBAL.HAIR_TYPE_FEATHERS))
					{
						if(!pc.hasHair())
						{
							output("\n\nYou wrinkle your nose as an annoying itch spreads all over your scalp. You try to rub at it on to feel something downy against your nails. That feeling spreads over your head as your scalp is covered with a new set of hair! Then again, hair doesn’t really feel that downy. You hold one lock in front of your eye and a upon closer examination, you realize that <b>you have downy feathers for hair!</b>");
							// Note: Hair will be 15 inches long after growing from a bald head
							pc.hairLength = 15;
						}
						else
						{
							output("\n\nYou feel a warm heat arise from your scalp. It flows in every strand of your [pc.hairNoun], growing softer and floatier. You grab a strand and take a look at your <b>downy feather-hair</b>! It feels wonderfully soft and plush to the touch, perfect for someone to take hold of and - wait. Let’s not do that.");
							if(pc.hairLength < 3)
							{
								pc.hairLength = 3;
								if(pc.hasPerk("Mane")) pc.hairLength += 3;
							}
						}
						pc.hairType = GLOBAL.HAIR_TYPE_FEATHERS;
						// +5 lust
						pc.changeLust(5);
					}
					else output("\n\n" + pc.hairTypeLockedMessage());
					changes++;
				}
				// Change skin color
				// [pc.skinFurScalesColor] not blue-and-striped, red-and-striped, green-and-striped, purple-and-striped, gold-and-striped or silver-and-striped: Change skin color to one of colors
				var suulaScaleColors:Array = ["blue", "red", "green", "purple", "gold", "silver"];
				// Options: blue-and-striped, red-and-striped, green-and-striped, purple-and-striped, gold-and-striped or silver-and-striped
				if(changes < changeLimit && pc.skinType == GLOBAL.SKIN_TYPE_SCALES && (!InCollection(pc.scaleColor, suulaScaleColors) || !pc.hasAccentMarkings()) && rand(5) == 0)
				{
					var newScaleColor:String = RandomInCollection(suulaScaleColors);
					var design:int = (rand(2) == 0 ? 1 : 3); // stripes or blotch
					var accentColors:Array = [];
					
					accentColors.push("white");
					if(design != 1) accentColors.push("gray");
					if(design != 3) accentColors.push("black");
					if(!InCollection(newScaleColor, ["gold", "silver"]))
					{
						accentColors.push("light " + newScaleColor);
						if(design != 3) accentColors.push("dark " + newScaleColor);
					}
					var accentColor:String = RandomInCollection(accentColors);;
					
					output("\n\nYou notice a strange, off color-blotch on the back of your hand. You begin to scratch at it, only for several new spots to pop up all over your hand. They quickly grow in size, fusing together and traveling up your arm, <b>changing your skin color to " + newScaleColor + " skin with " + indefiniteArticle(accentColor));
					if(design == 1) output(" stripe pattern along your body");
					else if(design == 3) output(" blotch pattern across your belly and chest");
					output("!</b> You’re definitely getting closer to become an alluring, sharky suula.");
					
					// Note: change is applied[pc.skinFurScalesColor]
					pc.skinTone = newScaleColor;
					pc.scaleColor = newScaleColor;
					pc.createStatusEffect("Body Markings", design, 0, 0, 0);
					pc.skinAccent = accentColor;
					
					changes++;
				}
				// Grow Avian Wings/Change wings
				// pc wing type not Avian: Change wing type to Avian
				if(changes < changeLimit && pc.wingType != GLOBAL.TYPE_AVIAN && rand(3) == 0)
				{
					if(pc.wingTypeUnlocked(GLOBAL.TYPE_AVIAN))
					{
						// Note: Wing Count stays the same
						var numWings:int = 2;
						
						if(!pc.hasWings())
						{
							output("\n\nYou feel a tightness pinch around your shoulder blades before a heavy pulse surges forth!");
							if(pc.hasArmor()) output(" You hastily pull off your [pc.armor] to expose your back just as the pulse bursts out of your back");
							else output(" The pulse grows and grows before bursting out your back");
							output("! With a few crunches, pops and wayward feathers, <b>a new pair of bird-like suula wings rest on your back</b>!");
						}
						else
						{
							output("\n\nYour [pc.wingsNoun] spasm as a warm feeling surges into them. You try to force them to calm down but they’re having none of that. Immediately a few wayward feathers sprout from your wings as the change takes on a more Avian persuasion. After the transformation is complete, your [pc.wingsNoun] settle down and you finally inspect your <b>suula wings</b>.");
							numWings = pc.wingCount;
						}
						pc.shiftWings(GLOBAL.TYPE_AVIAN, numWings);
					}
					else output("\n\n" + pc.wingTypeLockedMessage());
					changes++;
				}
				// Grow Shark Tail/Change tail to Shark Tail
				// PC has no tail: Grow Tail type shark
				if(changes < changeLimit && pc.tailCount <= 0 && rand(3) == 0)
				{
					if(pc.tailCountUnlocked(1))
					{
						output("\n\nYou feel a lump forming at the base of your spine. Before you can even feel it out, the lump surges");
						if(pc.isAssExposed()) output("!");
						else if(!pc.isAssExposedByArmor()) output(", threatening to tear through your [pc.armor]! You pull your gear out the way as fast as you can!");
						else output(", threatening to tear through your [pc.lowerUndergarment]! You pull the underwear out of the way as fast as you can!");
						output(" You grunt as new vertebrae fill what is obviously a tail, growing into a thick appendage. The tail grows just as long as you are tall, the end splitting into a big fin, just like a suula. A second, smaller dorsal fin pops up around the halfway point of your tail. <b>Seems you have a Suula tail now!</b>");
						pc.tailCount = 1;
						pc.tailType = GLOBAL.TYPE_SIREN;
						pc.clearTailFlags();
						pc.addTailFlag(GLOBAL.FLAG_LONG);
						pc.addTailFlag(GLOBAL.FLAG_SCALED);
					}
					else output("\n\n" + pc.tailCountLockedMessage());
					changes++;
				}
				// [pc.tailType] not shark: Change Tail type shark
				if(changes < changeLimit && pc.tailCount > 0 && pc.tailType != GLOBAL.TYPE_SIREN && rand(4) == 0)
				{
					if(pc.tailTypeUnlocked(GLOBAL.TYPE_SIREN))
					{
						output("\n\nYour tail");
						if(pc.tailCount > 1) output("s recede");
						else output(" recedes");
						output(" back into your body before another, larger tail bursts forth! It grows as long as you are tall before shaping itself into a predatory-looking tailfin. The end splits into a big, dual-pronged fin, while a smaller one pops up at the halfway point of your tail. <b>Seems like you have a suula tail now!</b>");
						pc.tailCount = 1;
						pc.tailType = GLOBAL.TYPE_SIREN;
						pc.clearTailFlags();
						pc.addTailFlag(GLOBAL.FLAG_LONG);
						pc.addTailFlag(GLOBAL.FLAG_SCALED);
					}
					else output("\n\n" + pc.tailTypeLockedMessage());
					changes++;
				}
				// Change Arms to Suula
				// [pc.armType] not suula: Arm type changes to suula
				if(changes < changeLimit && pc.armType != GLOBAL.TYPE_SIREN && rand(3) == 0)
				{
					if(pc.armTypeUnlocked(GLOBAL.TYPE_SIREN))
					{
						output("\n\nYou feel an odd prickling on your arms from the elbow down. It feels like something is " + (!kGAMECLASS.silly ? "pushing" : "crawling") + " its way out from just under your skin. You hold your arm out in front of you, watching in curiosity as feathers begin covering every inch of your arm from wrist to elbow. <b>Seems your arms are just like a suula’s now!</b>");
						pc.armType = GLOBAL.TYPE_SIREN;
						pc.clearArmFlags();
						pc.addArmFlag(GLOBAL.FLAG_FEATHERED);
					}
					else output("\n\n" + pc.armTypeLockedMessage());
					changes++;
				}
				// Lower Body Change
				// Lower Body either tauric or naga: Change to biped configuration 
				// Leg count greater than two: Decrease leg count to 2
				if(changes < changeLimit && pc.legType != GLOBAL.TYPE_SIREN && (pc.isNaga() || pc.isTaur() || pc.legCount > 2) && rand(2) == 0)
				{
					if(pc.legCountUnlocked(2))
					{
						if(pc.isNaga() || pc.isTaur())
						{
							output("\n\nYou begin to sway back and forth, feeling a bit woozy as your lower body starts tingling. Before you fall flat on your face, you catch yourself on the nearest available object. Your eyes widen in horror as you notice that your [pc.lowerbody] has turned into a blank, oval shaped blob. Almost immediately, you hear creaking and snapping, as if the bones in your body are reforming themselves. A gap opens in the blob as it begins to shape into human legs, your genitals settling between them. Before long, you have <b>a normal pair of human legs.</b>");
							pc.legType = GLOBAL.TYPE_HUMAN;
							pc.clearLegFlags();
							pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
							//pc.addLegFlag(GLOBAL.FLAG_SCALED);
							pc.genitalSpot = 0;
							pc.legCount = 2;
						}
						else
						{
							output("\n\nYour whole body tenses up as you lose feeling in one of your several [pc.legsNoun]. The offending limb loses form before retreating back into your body. <b>Seems you’re down one [pc.legNoun] now!</b>");
							pc.legCount -= 1;
							if(pc.legCount <= 2)
							{
								output(" At least walking is a little easier now...");
								pc.genitalSpot = 0;
								pc.legCount = 2;
							}
						}
					}
					else output("\n\n" + pc.legCountLockedMessage());
					changes++;
				}
				// Change Legs to Suula
				// [pc.legType] not suula: Leg type changes to suula
				if(changes < changeLimit && pc.legType != GLOBAL.TYPE_SIREN && pc.legCount == 2 && rand(3) == 0)
				{
					if(pc.legTypeUnlocked(GLOBAL.TYPE_SIREN))
					{
						output("\n\nYour legs go numb as they slowly morph, becoming more toned and powerful.This goes on for a few more seconds before it finally ends. As you regain feeling in your legs, you notice they’re smooth and hydrodynamic while your toenails have turned into sharp talons. <b>You have legs like a suula now</b>!");
						
						pc.legType = GLOBAL.TYPE_SIREN;
						pc.clearLegFlags();
						pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
						pc.addLegFlag(GLOBAL.FLAG_SCALED);
					}
					else output("\n\n" + pc.legTypeLockedMessage());
					changes++;
				}
				
				var newTallness:Number = -1;
				var newHipsSize:Number = -1;
				var newButtSize:Number = -1;
				var newBoobSize:Number = -1;
				var newCockSize:Number = -1;
				var newBallSize:Number = -1;
				
				var bGrow:Boolean = false;
				
				var bIdx:Number = 0;
				var bChange:Boolean = false;
				var cIdx:int = -1;
				var cChange:Boolean = false;
				var vIdx:int = -1;
				
				// Male Effects (Requires Penis and no vagina)
				if(pc.isMale())
				{
					// [pc.cockLength] not 14 inches: Increase/decrease penis length to 14
					newCockSize = (!pc.hasPerk("Hung") ? 14 : 28);
					for(cIdx = 0; cIdx < pc.totalCocks(); cIdx++) { if(pc.cockLengthUnlocked(cIdx, newCockSize)) cChange = true; }
					// PC has no balls: Grow grapefruit sized balls
					if(pc.balls <= 0) newBallSize = (!pc.hasPerk("Bulgy") ? 4 : 8);
					// [pc.ballSize] not 8: increase ball size to 8
					else newBallSize = (!pc.hasPerk("Bulgy") ? 8 : 16);
					// [pc.breastSize] not 0: Decrease breast size to 0 by 1 cup size
					if(pc.hasBreasts())
					{
						newBoobSize = 0;
						for(bIdx = 0; bIdx < pc.bRows(); bIdx++) { if(pc.breastRatingUnlocked(bIdx, newBoobSize)) bChange = true; }
					}
					// [pc.height] not 72: Increase/decrease height to 72
					if(pc.tallness != 72) newTallness = 72;
					// [pc.hipRating] not 6: Increase hip rating to 6
					if(pc.hipRatingRaw != 6) newHipsSize = 6;
					// [pc.buttRating] not 6: Increase butt rating to 6
					if(pc.buttRatingRaw != 6) newButtSize = 6;
				}
				// Female Effects (Requires Vagina and no penis)
				if(pc.isFemale())
				{
					// [pc.breastSize] less than 12: Increase breast size to 12 by 1 cup size
					if(pc.breastRows[pc.biggestTitRow()].breastRatingRaw < 12)
					{
						newBoobSize = 12;
						for(bIdx = 0; bIdx < pc.bRows(); bIdx++) { if(pc.breastRatingUnlocked(bIdx, newBoobSize)) bChange = true; }
					}
					// [pc.height] not 96: Increase/decrease height to 96
					if(pc.tallness != 96) newTallness = 96;
					// [pc.hipRating] less than 15: Increase hip rating to 15 
					if(pc.hipRatingRaw < 15) newHipsSize = 15;
					// [pc.buttRating] less than 10: Increase butt rating to 10
					if(pc.buttRatingRaw < 10) newButtSize = 10;
				}
				// Herm Effects (Require both Penis and Vagina)
				if(pc.isHerm())
				{
					// [pc.breastSize] not 5: Increase/decrease breast size to 5 by 1 cup size
					newBoobSize = 5;
					for(bIdx = 0; bIdx < pc.bRows(); bIdx++) { if(pc.breastRatingUnlocked(bIdx, newBoobSize)) bChange = true; }
					// [pc.cockLength] not 7: Increase/decrease cock length to 7
					newCockSize = (!pc.hasPerk("Hung") ? 7 : 14);
					for(cIdx = 0; cIdx < pc.totalCocks(); cIdx++) { if(pc.cockLengthUnlocked(cIdx, newCockSize)) cChange = true; }
					// [pc.height] not 84: Increase/decrease height to 84
					if(pc.tallness != 84) newTallness = 84;
					// [pc.hipRating] less than 10: Increase hip rating to 10
					if(pc.hipRatingRaw < 10) newHipsSize = 10;
					// [pc.buttRating] less than 8: Increase butt rating to 8
					if(pc.buttRatingRaw < 8) newButtSize = 8;
				}
				
				// Breast Size Increase/Decrease
				if(changes < changeLimit && newBoobSize >= 0 && bChange && rand(4) == 0)
				{
					bIdx = pc.biggestTitRow();
					bGrow = (pc.breastRows[bIdx].breastRatingRaw < newBoobSize);
					
					output("\n\nA pleasant heat fills your [pc.breast " + bIdx + "], spreading across every bit of flesh and upping the sensitivity of your [pc.nipples]. You immediately start gently fondling them, cooing as " + (bGrow ? "new breast meat begins to fill your palms" : "your breasts slowly recede into your chest") + ". By the time the feeling fades, <b>your breasts are at least one cup size " + (bGrow ? "bigger" : "smaller") + " than they were before!</b>");
					
					for(bIdx = 0; bIdx < pc.bRows(); bIdx++)
					{
						pc.breastRatingUnlocked(bIdx, newBoobSize)
						{
							pc.breastRows[bIdx].breastRatingRaw = Math.round(pc.breastRows[bIdx].breastRatingRaw);
							if(pc.breastRows[bIdx].breastRatingRaw < newBoobSize) pc.breastRows[bIdx].breastRatingRaw += 1;
							if(pc.breastRows[bIdx].breastRatingRaw > newBoobSize) pc.breastRows[bIdx].breastRatingRaw -= 1;
						}
					}
					changes++;
				}
				// Hip Size Increase/Decrease
				if(changes < changeLimit && newHipsSize >= 0 && rand(4) == 0)
				{
					bGrow = (pc.hipRatingRaw < newHipsSize);
					if(bGrow) newHipsSize = Math.min(pc.hipRatingRaw + 5, newHipsSize);
					else newHipsSize = Math.max(pc.hipRatingRaw - 5, newHipsSize);
					if(pc.hipRatingUnlocked(newHipsSize))
					{
						output("\n\nYou feel your center of gravity shift as your hips " + (bGrow ? "expand" : "shrink") + ".");
						
						pc.hipRatingRaw = newHipsSize;
					}
					else output("\n\n" + pc.hipRatingLockedMessage());
					changes++;
				}
				// Butt Size Increase/Decrease
				if(changes < changeLimit && newButtSize >= 0 && rand(4) == 0)
				{
					bGrow = (pc.buttRatingRaw < newButtSize);
					if(bGrow) newButtSize = Math.min(pc.buttRatingRaw + 5, newButtSize);
					else newButtSize = Math.max(pc.buttRatingRaw - 5, newButtSize);
					if(pc.buttRatingUnlocked(newButtSize))
					{
						output("\n\nYour cheeks tighten up before " + (bGrow ? "expanding, giving a fuller butt to enjoy" : "shrinking, giving you a tighter booty") + "!");
						
						pc.buttRatingRaw = newButtSize;
					}
					else output("\n\n" + pc.buttRatingLockedMessage());
					changes++;
				}
				// Height Increase/Decrease
				if(changes < changeLimit && newTallness >= 0 && rand(4) == 0)
				{
					bGrow = (pc.tallness < newTallness);
					if(bGrow) newTallness = Math.min(pc.tallness + 6, newTallness);
					else newTallness = Math.max(pc.tallness - 6, newTallness);
					if(pc.tallnessUnlocked(newTallness))
					{
						output("\n\nYou feel a shift in your posture for the briefest moment before the feeling subsides. Nothing seems that off initially, but once you look down you notice the ground is " + (bGrow ? "a bit farther away than usual" : "a bit closer than usual") + ". Seems you’ve gotten <b>" + (bGrow ? "taller" : "shorter") + "</b>.");
						
						pc.tallness = newTallness;
					}
					else output("\n\n" + pc.tallnessLockedMessage());
					changes++;
				}
				// Femininity Increase
				// Femininity not equal to 90: Increase femininity to 90
				if(changes < changeLimit && pc.femininity < 90 && rand(2) == 0)
				{
					if(pc.femininityUnlocked(pc.femininity + 10))
					{
						output("\n\nYou feel a strange tingle on your face. You’re not sure what is going on, but if feels like your face is slowly becoming softer and more rounded. A little once over confirms your suspicions: <b>Your face is more feminine now.</b>");
						
						pc.femininity += 10;
						
						if(pc.femininity >= pc.femininityMax())
						{
							output("\n\nA tingle comes to your face, but it disappears as quickly as it came. You guess you can’t get any more feminine than you already are.");
							pc.femininity = pc.femininityMax();
						}
					}
					else output("\n\n" + pc.femininityLockedMessage());
					changes++;
				}
				// Increase/Decrease Penis length
				if(changes < changeLimit && newCockSize >= 0 && cChange && rand(4) == 0)
				{
					cIdx = pc.biggestCockIndex();
					bGrow = (pc.cocks[cIdx].cLengthRaw < newCockSize);
					
					output("\n\nA wonderfully pleasant feeling seeps into your [pc.cockNounSimple " + cIdx + "]. You " + (!pc.isCrotchExposedByArmor() ? "look down" : "pull the lower part of your [pc.armor] down") + ", watching as your tool gets <b>slightly " + (bGrow ? "bigger" : "smaller") + "</b>!");
					
					for(cIdx = 0; cIdx < pc.totalCocks(); cIdx++)
					{
						pc.cockLengthUnlocked(cIdx, newCockSize)
						{
							pc.cocks[cIdx].cLengthRaw = Math.round(pc.cocks[cIdx].cLengthRaw);
							if(pc.cocks[cIdx].cLengthRaw < newCockSize) pc.cocks[cIdx].cLengthRaw += 1;
							if(pc.cocks[cIdx].cLengthRaw > newCockSize) pc.cocks[cIdx].cLengthRaw -= 1;
						}
					}
					changes++;
				}
				// Change Penis to Suula Cock
				// [pc.cockType] not suula: Change Cock type to suula
				if(changes < changeLimit && pc.totalCocks(GLOBAL.TYPE_SIREN) < pc.totalCocks() && rand(3) == 0)
				{
					var nonSuulaCocks:Array = new Array();
					for(cIdx = 0; cIdx < pc.totalCocks(); cIdx++)
					{
						if(pc.cocks[cIdx].cType != GLOBAL.TYPE_SIREN) nonSuulaCocks.push(cIdx);
					}
					cIdx = RandomInCollection(nonSuulaCocks);
					
					if(pc.cockTypeUnlocked(cIdx, GLOBAL.TYPE_SIREN))
					{
						output("\n\nYour [pc.cockBiggest] grows painfully hard before a pleasant warmth flows through it, base to tip. That feels awfully good... You");
						if(!pc.isCrotchExposedByArmor()) output(" pull the lower part of your [pc.armor] forward and");
						output(" look down");
						if(!pc.isCrotchExposedByLowerUndergarment()) output(" into your [pc.lowerUndergarment]");
						output(" to find that your [pc.cockNoun " + cIdx + "] has sprouted a collection of tentacles up and down its shaft, with the largest groupings around your base and crown. <b>You have a suula cock now!</b>");
						
						pc.shiftCock(cIdx, GLOBAL.TYPE_SIREN);
						pc.changeLust(5);
					}
					else output("\n\n" + pc.cockTypeLockedMessage());
					changes++;
				}
				// PC has no balls: Grow grapefruit sized balls
				// [pc.ballSize] not 8: increase ball size to 8
				if(changes < changeLimit && ((pc.balls <= 0 && newBallSize > 0) || pc.ballSizeRaw < newBallSize) && rand(4) == 0)
				{
					if(pc.balls <= 0)
					{
						if(pc.ballsUnlocked(2))
						{
							output("\n\nYour gut churns and heaves similarly to when you’ve gotten sick in the past. This time, rather than resulting in a need to go to the bathroom, the discomfort merely migrates south, growing in intensity as it does. When you can take it no more, you groan as something slips within you, bringing with it immeasurable relief. The pain is reduced by perhaps half. The odd slipping sensation repeats. This time, you’re left sighing in contentment. Whatever just happened, it’s over now.");
							output("\n\nYou check up on your groin once you’ve caught your breath, and to your shock, you discover a pair of nicely-rounded testicles contained in a ballsack. <b>You grew balls!</b>");
							
							pc.balls = 2;
							pc.ballSizeRaw = newBallSize;
						}
						else output("\n\n" + pc.ballsLockedMessage());
						changes++;
					}
					else
					{
						if(pc.ballSizeUnlocked(newBallSize))
						{
							output("\n\nYour [pc.balls] begin" + (pc.balls == 1 ? "s" : "") + " to feel a little warm. Reaching down to give " + (pc.balls == 1 ? "it" : "them") + " a quick rub to comfort the odd sensation you find <b>" + (pc.balls == 1 ? "it has" : "they’ve") + " grown a bit larger</b>.");
							pc.ballSizeRaw = newBallSize;
						}
						else output("\n\n" + pc.ballSizeLockedMessage());
						changes++;
					}
				}
				// Change Vagina to Suula
				// [pc.vaginaType] not suula: Change Vagina type to suula
				if(changes < changeLimit && pc.totalVaginas(GLOBAL.TYPE_SIREN) < pc.totalVaginas() && rand(3) == 0)
				{
					var nonSuulaCunts:Array = new Array();
					for(vIdx = 0; vIdx < pc.totalVaginas(); vIdx++)
					{
						if(pc.vaginas[vIdx].type != GLOBAL.TYPE_SIREN) nonSuulaCunts.push(vIdx);
					}
					vIdx = RandomInCollection(nonSuulaCunts);
					
					if(pc.vaginaTypeUnlocked(vIdx, GLOBAL.TYPE_SIREN))
					{
						var puffFlag:int = 0;
						output("\n\nYour [pc.vagina " + vIdx + "] tingles as it begins to ripple on the inside. Curious, you run your hands over your");
						if(pc.vaginalPuffiness(vIdx) > 0)
						{
							output(" puffy");
							if(pc.vaginas[vIdx].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) puffFlag = 1;
							if(pc.vaginas[vIdx].hasFlag(GLOBAL.FLAG_PUMPED)) puffFlag = 2;
							if(pc.vaginas[vIdx].hasFlag(GLOBAL.FLAG_HYPER_PUMPED)) puffFlag = 3;
						}
						output(" lips and notice some tendrils rubbing and grasping your fingers, trying to pull them deeper into your pussy. You blush a little as you have to resist the urge to start fingering yourself right there and reluctantly pull your fingers away, much to the disappointment of your new pussy tendrils. <b>You now have a suula vagina!</b>");
						
						pc.shiftVagina(vIdx, GLOBAL.TYPE_SIREN);
						if(puffFlag == 1) pc.vaginas[vIdx].addFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
						if(puffFlag == 2) pc.vaginas[vIdx].addFlag(GLOBAL.FLAG_PUMPED);
						if(puffFlag == 3) pc.vaginas[vIdx].addFlag(GLOBAL.FLAG_HYPER_PUMPED);
						pc.changeLust(5);
					}
					else output("\n\n" + pc.vaginaTypeLockedMessage());
					changes++;
				}
				// Change Tail Genitals to Suula
				// PC has parasitic tail:
				// Tail Cock: Change Tail genital race to suula
				// Cunt Tail: Change Tail genital race to suula
				if(changes < changeLimit && pc.hasParasiteTail() && pc.tailGenitalArg != GLOBAL.TYPE_SIREN && rand(5) == 0)
				{
					var newTailColor:String = RandomInCollection(["blue", "aquamarine"]);
					
					if(pc.hasTailCock())
					{
						output("\n\nYour slippery freeloader works itself into a frenzy as it curls around your body and tries to thrust into your face. Luckily you’re able to stop it from forcing its way down your throat, but you quickly notice that the penis at the end has changed. It’s sprouted a collection of tentacles up and down its shaft, with the largest groupings around the base and crown. <b>Seems its tip has changed to mimic a suula now.</b>");
						
						pc.clearTailFlags();
						pc.addTailFlag(GLOBAL.FLAG_LONG);
						pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
						pc.addTailFlag(GLOBAL.FLAG_APHRODISIAC_LACED);
						pc.addTailFlag(GLOBAL.FLAG_STINGER_BASED);
					}
					else if(pc.hasTailCunt())
					{
						output("\n\nYour freeloading partner ungulates rapidly before curling around your body, showing off its slit to you. You blink, noticing little tentacles trying to reach out and grab an invisible invader. <b>Your tail pussy is mimicking a suula vagina now!</b>");
						
						pc.clearTailFlags();
						pc.addTailFlag(GLOBAL.FLAG_LONG);
						pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
						if(pc.tailType == GLOBAL.TYPE_CUNTSNAKE) pc.addTailFlag(GLOBAL.FLAG_THICK);
						pc.addTailFlag(GLOBAL.FLAG_APHRODISIAC_LACED);
						pc.addTailFlag(GLOBAL.FLAG_NUBBY);
						pc.addTailFlag(GLOBAL.FLAG_TENDRIL);
					}
					
					pc.tailGenitalArg = GLOBAL.TYPE_SIREN;
					pc.tailGenitalColor = newTailColor;
					
					changes++;
				}
				// Increase Libido
				// Libido: Increase to 35
				if(changes < changeLimit &&  pc.libido() < 35 && rand(4) == 0)
				{
					output("\n\nYou let out a musical hum, feeling randier than you’d usually be. There’s certainly nothing wrong with having your sexual appetite heightened. Perhaps you’ll find");
					if(pc.hasVagina()) output(" a nice stud to ride to submission");
					if(pc.hasCock())
					{
						if(pc.hasVagina()) output(",");
						output(" a nice womb to fill with your progeny");
					}
					if(pc.isHerm()) output("... or perhaps a bit of both");
					output("?");
					output("\n\nYou shake the thoughts from your head. You guess you’re even thinking like a suula now, eh?");
					
					pc.libido(3);
					
					changes++;
				}
				
				// Dud Result
				if(changes == 0)
				{
					output("\n\nOutside of making you a bit warmer, the transformative seems to have done absolutely nothing. What a waste.");
					if(pc.suulaScore() >= 6) output(" Maybe you’re as suula-like as you’re going to get?");
				}
				return false;
			}
			else
			{
				output(target.capitalA + target.short + " downs the flask but to no effect.");
			}
			return false;
		}
	}
}

