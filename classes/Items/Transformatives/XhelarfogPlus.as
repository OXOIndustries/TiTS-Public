package classes.Items.Transformatives
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.ItemSlotClass;
	import classes.StringUtil;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.Engine.Interfaces.author;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.weightedRand;
	import classes.Engine.Map.InShipInterior;
	import classes.Engine.Map.InRoomWithFlag;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;

	public class XhelarfogPlus extends ItemSlotClass
	{
		public function XhelarfogPlus()
		{
			_latestVersion = 1;
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			
			shortName = "X.fog+";
			longName = "Xhelarfog Plus Pill";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a Steele Tech branded snack-bar";
			tooltip = "Similar to the more popular Terran Treats, this transformative takes the form of a snack-bar, its wrapper bearing the Steele Tech logo, and the usual amount of technobabble explaining its microsurgeons. Unlike the other item though, this is designed to give the consumer more Xhelarfog-aligned features. It’s even marked with a seal of approval from the government of Anon-Xusya B!\n\n...Wait, is that <i>actual</i> gold leaf?";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 1000;
			
			addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);
			
			version = _latestVersion;
		}

		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			if (!(target is PlayerCharacter))
			{
				output("<b>You’re not supposed to be able to see this. Please report.</b>");
				return false;
			}
			author("GothPastel");

			//9999 screw it, this is all I've got
			var inDanger:Boolean = InRoomWithFlag(GLOBAL.HAZARD) || kGAMECLASS.disableExploreEvents();
			
			//PC has witnessed the skin type change scene before, and is in a hostile area
			if (kGAMECLASS.flags["XHELPLUS_SKIN_CHANGE"] != undefined && inDanger)
			{
				output("You look at the bar in your hand, considering chowing down, but you quickly recall... That previous experience. You don’t want to risk getting carted off by some opportunistic native, and so you pop it back into your pocket. Maybe later.");
				return false;
			}
			else
			{
				output("You unwrap the bar, shrugging as you take a bite, soon finishing the whole thing. It hits your stomach quickly, causing a distinct but not altogether unpleasant tingling that soon spreads, until all of your [pc.skin] prickles.");
				output("\n\nAs the prickling fades, you feel a change coming on.");
				if (!kGAMECLASS.infiniteItems()) kGAMECLASS.pc.destroyItemByClass(XhelarfogPlus);
			}
			

			var effect:Function;
			//list of usable effects
			var effects:Array;
			//list of used effects
			var usedEffects:Array = new Array();
			//ammount of effects to trigger
			var totalEffects:int = weightedRand([{v:1, w:5}, {v:2, w:3}, {v:3, w:2}]);
			var effectCount:int = 0;
			var fails:int = 0;
			while (effectCount < totalEffects && fails < totalEffects)
			{
				effects = new Array();
				
				//Eyes
				if (target.eyeColor.indexOf("gold") < 0 && target.eyeColorUnlocked("gold")) effects.push(eyeColorChange);
				if (target.eyeType != GLOBAL.TYPE_XHELARFOG && target.eyeTypeUnlocked(GLOBAL.TYPE_XHELARFOG)) effects.push(eyeTypeChange);
				//Skin
				if (target.skinTone != "opalescent white" && target.skinToneUnlocked("opalescent white")) effects.push(skinToneChange);
				//Horns
				if (target.hornsUnlocked(2) || target.horns == 2)
				{
					if (target.horns != 0 && target.horns != 2) effects.push(hornsChange);
					else if (target.hornType != GLOBAL.TYPE_XHELARFOG && target.hornTypeUnlocked(GLOBAL.TYPE_XHELARFOG)) effects.push(hornTypeChange);
				}
				//Tittays
				if (target.breastRows.length > 0)
				{
					if (target.breastRows.length > 1 && target.removeBreastRowUnlocked(target.breastRows.length - 1, 1)) effects.push(breastRowsChange);
					if (target.breastRows[0].breastRatingRaw > 0) effects.push(breastSizeChange);
					else if (target.breastRows[0].nippleType != GLOBAL.NIPPLE_TYPE_FLAT && target.nippleTypeUnlocked(0, GLOBAL.NIPPLE_TYPE_FLAT)) effects.push(breastSizeChange);
				}
				//Height
				if (target.tallness < 4*12 || target.tallness > 5*12+5) effects.push(heightChange);
				//Milk
				if (target.isLactating() && target.milkMultiplier > 0) effects.push(stopLactation);
				//Legs
				if (target.legCount != 2 && target.legCountUnlocked(2)) effects.push(legChange);
				else if (target.legCount == 2 && target.legType != GLOBAL.TYPE_XHELARFOG && target.legTypeUnlocked(GLOBAL.TYPE_XHELARFOG)) effects.push(legChange);
				//Tail
				if (target.tailCount > 1 && target.tailCountUnlocked(1)) effects.push(tailCountChange);

				//TFs that require Xhel skin
				if (target.skinType == GLOBAL.SKIN_TYPE_GEL)
				{
					if (target.eyeType == GLOBAL.TYPE_XHELARFOG && target.faceType != GLOBAL.TYPE_XHELARFOG && target.faceTypeUnlocked(GLOBAL.TYPE_XHELARFOG)) effects.push(faceTypeChange);
					//Give tail
					if (target.tailType != GLOBAL.TYPE_XHELARFOG)
					{
						if (target.tailCountUnlocked(1) && target.tailTypeUnlocked(GLOBAL.TYPE_XHELARFOG)) effects.push(tailTypeChange);
					}
					//If already tail, give fancy scales
					else if (target.skinFlagsUnlocked(GLOBAL.FLAG_SCALED_PRETTY) && !target.hasSkinFlag(GLOBAL.FLAG_SCALED_PRETTY)) effects.push(growScales);
				}
				else if (target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_GEL) && !inDanger) effects.push(skinTypeChange);
				
				//TFs that require Xhel tail
				if (target.tailType == GLOBAL.TYPE_XHELARFOG)
				{
					//Scale color
					if ((target.hasScales() || target.hasSkinFlag(GLOBAL.FLAG_SCALED_PRETTY)) && target.scaleColor.indexOf("gold") < 0 && target.scaleColorUnlocked("gold")) effects.push(scaleColorChange);
				}

				//don't let effects repeat
				for each (effect in effects) if (usedEffects.indexOf(effect) > 0) effects.splice(effects.indexOf(effect), 1);

				if (effects.length > 0)
				{
					effect = RandomInCollection(effects);
					//All effects should return true if TF happens, false otherwise
					if (effect(target))
					{
						++effectCount;
						//Let these TFs trigger as many times as they want
						if (!InCollection(effect, heightChange, breastSizeChange)) usedEffects.push(effect);
						if (effect == skinTypeChange) return true;
					}
					//If it fails, don't try again
					else
					{
						usedEffects.push(effect);
						fails++;
					}
				}
				else
				{
					if (effectCount == 0) output("\n\nOr maybe not. You can’t see or feel any changes, no matter how long you wait. Great - a waste of your credits.");
					return false;
				}
			}
			
			return false;
		}
		
		private function eyeColorChange(target:Creature):Boolean
		{
			output("\n\nThere’s a sudden twinge in your eyes that you have to blink several times to clear. Strange.");
			output("\n\nYou bring up your codex, using the camera to look at yourself - ah, of course. <b>You now have metallic, golden irises!</b>");

			target.eyeColor = "gold";
			
			return true;
		}
		
		private function eyeTypeChange(target:Creature):Boolean
		{
			if (target.eyeCount() > 3)
			{
				output("\n\nYour eyes feel uncomfortable all of a sudden, a strange, squeezing feeling, and before long you find yourself forced to close your eyes.");
				output("\n\nBy the time you’ve forced them open again, you realize that you feel distinctly... less than before. In fact, <b>you’ve only got three eyes!</b>");
				output("\n\nThe third is situated right in the center of your forehead, and about the same size as the others, so it’s not <i>quite</i> typical Xhelarfog configuration, but you’re one step closer.");
				output("\n\nThere is now no distinguishable difference between your sclera and iris, both flooded with [pc.eyeColor]. Even your pupils have changed, appearing to be a slightly paler shade of the same color.");
			}
			else if (target.eyeCount() < 3)
			{
				output("\n\nYou’d describe the feeling you suddenly start to experience as a migraine, but it’s far too centralized to be one.");
				output("\n\nYou do have to sit down though, pushing your hands against your head in the hopes th-\n\nOw!");
				output("\n\nYour hands jolt away from your face as your third eye blinks rapidly in distress at the unintentional poke.\n\nWait.\n\nThird eye?");
				output("\n\nYou pull out your codex to check, and lo and behold - a third eye! Its situated right in the center of your forehead, and about the same size as the others, so it’s not <i>quite</i> typical Xhelarfog configuration, but you and your <b>new set of three eyes</b> are one step closer.");
				output("\n\nThere is now no distinguishable difference between your sclera and iris, both flooded with [pc.eyeColor]. Even your pupils have changed, appearing to be a slightly paler shade of the same color.");
			}
			else
			{
				output("There’s a sudden, sharp pain in your eyes, forcing you to double over, pressing your palms against them until the sensation fades.");
				output("\n\nVoid, that had better not have been for nothing!");
				output("\n\nA quick check in the nearest mirror confirms that you have, in fact, undergone a change - there is now no distinguishable difference between your sclera and iris, both flooded with [pc.eyeColor]. Even your pupils have changed, appearing to be a slightly paler shade of the same color.");
			}
			
			output("\n\nIt’s quite fetching actually");
			if (kGAMECLASS.flags["YOMA_MET"] != undefined && target.eyeColor == "lime green") output(" - you even almost match a certain android you know");
			output(".");
			output("\n\n<b>You now have Xhelarfog eyes.</b>");

			target.eyeType = GLOBAL.TYPE_XHELARFOG;
			
			return true;
		}
		
		private function skinToneChange(target:Creature):Boolean
		{
			output("\n\nThe prickling flares up again suddenly, but fades just as fast, and as it does so does the pigmentation of your skin. At first, it seems to settle into a bleak white, but as you shift, color seems to ripple through it. <b>Your skin is now white and opalescent colored.</b>");
			
			if (target.skinTone == target.nippleColor && target.nippleColorUnlocked("white")) target.nippleColor = "white";
			target.skinTone = "opalescent white";
			
			return true;
		}
		
		private function hornTypeChange(target:Creature):Boolean
		{
			if (target.horns == 2) output("\n\nThe base of your horns tingle, and you reach up to pat at them, feeling them shift. It’s not long until they’ve changed their appearance entirely, and looking at them with your codex allows you to admire <b>your new, upward pointing Xhelarfog horns.</b> They’re a few inches tall and appear to be [pc.skinColor] towards their base, before fading into a subtle gold tone.");
			else output("\n\nThere’s a tingling sensation right in the very center of your forehead, then the feeling of something pushing just under your skin. You raise a hand, feeling a small, hard nub of flesh growing out and upwards. As you feel it, it branches into two halves, so you pull your hands away, letting it progress unimpeded.\n\nBy the time they’ve stopped growing, you’ve found a decently reflective surface in which to admire <b>your new, upward pointing Xhelarfog horns.</b> They’re a few inches tall and appear to be [pc.skinColor] towards their base, before fading into a subtle gold tone.");
			
			target.hornType = GLOBAL.TYPE_XHELARFOG;
			target.horns = 2;
			
			return true;
		}

		private function hornsChange(target:Creature):Boolean
		{
			if (target.horns == 1) output("\n\nThere’s a sudden cracking noise emanating from your forehead, but there’s no pain. You take a quick glance at your codex to check it out, and see that <b>your horn has split in two!</b>");
			else output("\n\nYou feel a strange, shifting feeling atop your head, and fish out your codex for a look. You stare at the sight of some of your horns sinking back down into your skull before vanishing, and the others moving, shifting towards your forehead before stopping right next to each other, dead center.\n\n<b>You’ve only got two horns now</b>, and it takes a while to get used to holding your head in a way that stops it being dragged forwards.");
			
			target.horns = 2;
			
			return true;
		}
		
		private function faceTypeChange(target:Creature):Boolean
		{
			output("\n\nYour face goes numb. Even when you bring a hand up to poke around, you get no sensory response from it.");
			output("\n\nGiving up on that route, you fish out your codex and watch in mild horror as your " + (target.hasMuzzle() ? "muzzle" : "nose") + " finishes retreating into your face - you can still smell though, you realize, you must still have some sort of faint slits for nostrils.");
			if (target.earType != GLOBAL.TYPE_SYLVAN && target.earTypeUnlocked(GLOBAL.TYPE_SYLVAN))
			{
				output(" You soon realize that wasn’t the first change - your ears have already reshaped themselves into short yet pointed elvish ones.");
				target.earType = GLOBAL.TYPE_SYLVAN;
				target.clearEarFlags();
				target.addEarFlag(GLOBAL.FLAG_TAPERED);
				target.earLength = 3;
			}
			output("\n\nThe worst is yet to come - you’re suddenly <i>incredibly</i> glad for the loss of feeling, as your eyes start to reshape themselves. The lower pair act first, pulling further apart and a little lower down, before <i>shrinking</i>. The upper, central one seems to bulge outwards for a moment, but soon starts to grow, easily thrice as large of the others by the time it finishes.");
			output("\n\nEven your teeth don’t escape the changes. Your incisors sharpen until they look more like your canines, and although you can’t see your back molars, you know, somehow, that they’ve become powerful crushing tools. Luckily, your codex has done nothing to suggest that your dietary requirements have changed to something more carnivorous, but nobody gave your new dental work the memo.");
			output("\n\nFinally, the changes come to a stop, and the feeling slowly returns. <b>You’ve got a face just like a Xhelarfog’s!</b>");

			target.faceType = GLOBAL.TYPE_XHELARFOG;
			target.clearFaceFlags();
			target.addFaceFlag(GLOBAL.FLAG_SMOOTH);
			
			return true;
		}
		
		private function tailCountChange(target:Creature):Boolean
		{
			output("\n\nYour tails suddenly wrap around each other, completely beyond your control. They flex, pulling tighter and tighter together until suddenly, they stop.");
			output("\n\nYou curl them - no, <i>it</i> around for a look - and have confirmation of your suspicions. <b>You only have one tail now.</b>");

			target.tailCount = 1;
			
			return true;
		}
		
		private function tailTypeChange(target:Creature):Boolean
		{
			if (target.tailCount == 0) output("\n\nThere’s a strange pressure at the base of your spine - or where it would be, at least, if recent transformative use hadn’t dissolved your bones - and you twist, taking a look.\n\nThere’s a small lump forming, and as you watch, it grows, extending out a few feet. More mass pours into it, thickening at the base until <b>you’ve got a cute, stubby Xhelarfog tail.</b>");
			else output("\n\nThere’s a strange feeling as mass pours into your tail, thickening it at the base and changing its length and shape," + (target.hasTailFlag(GLOBAL.FLAG_FURRED) ? " its fur falling out in clumps" : "") + " until <b>you’ve got a cute, stubby Xhelarfog tail.</b>");

			target.tailCount = 1;
			target.tailType = GLOBAL.TYPE_XHELARFOG;
			target.clearTailFlags();
			if (target.hasSkinFlag(GLOBAL.FLAG_SCALED_PRETTY)) target.addTailFlag(GLOBAL.FLAG_SCALED);
			
			return true;
		}
		
		private function breastRowsChange(target:Creature):Boolean
		{
			output("\n\nThere’s a sudden, clenching pain in your lower " + (target.breastRows.lenght > 2 ? "rows" : "row") + " of breasts, and you look down in horror as they start to pull back, retracting until they’re gone altogether. A cursory graze over where they once were confirms that your nipples have vanished too. <b>You’ve only got one row of breasts.</b>");

			target.removeBreastRow(target.breastRows.length - 1, 1);
			
			return true;
		}
		
		private function breastSizeChange(target:Creature):Boolean
		{
			var lockedMessageShown:Boolean = false;

			//Breast size change
			if (target.breastRows[0].breastRatingRaw > 0)
			{
				var newCup:int = Math.max(0, target.breastRows[0].breastRatingRaw - 1 - rand(3));
				if (target.breastRatingUnlocked(0, newCup))
				{
					output("\n\nYour [pc.breasts 0] tremble suddenly, and your hands fly up to them, giving them a cursory squeeze. The trembling continues, however, and you soon realise your hands have a little less to hold.");

					target.breastRows[0].breastRatingRaw = newCup;

					output("\n\n<b>Your breast size has reduced! You’re " + (newCup > 0 ? "a [pc.breastCupSize 0]" : "flat") + " now!</b>");
				}
				else
				{
					output("\n\n" + target.breastRatingLockedMessage());
					lockedMessageShown = true;
				}
			}
			//Nipple change
			if (target.breastRows[0].nippleType != GLOBAL.NIPPLE_TYPE_FLAT)
			{
				if (target.nippleTypeUnlocked(0, GLOBAL.NIPPLE_TYPE_FLAT))
				{
					output("\n\nYour nipples feel strange, and you");
					if (target.isChestCovered()) output(" pull your " + (target.isChestExposedByArmor() ? "[pc.upperGarment]" : "[pc.armor]") + " aside and");
					output(" look down to see what’s going on.");
					output("\n\nStrange - <b>they’ve completely flattened out.</b> A quick tweak confirms they’re as sensitive as ever, though.");

					target.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_FLAT;
					if (target.nippleColorUnlocked(target.skinTone)) target.nippleColor = target.skinTone;
				}
				else
				{
					if (lockedMessageShown) return false;
					else output("\n\n" + target.nippleTypeLockedMessage());
				}
			}
			else if (lockedMessageShown) return false;
			
			return true;
		}
		
		private function stopLactation(target:Creature):Boolean
		{
			output("\n\nYour [pc.breasts] tremble suddenly, and your hands fly up to them, giving them a cursory squeeze.");
			output("\n\n...That’s weird.");
			output("\n\nNormally there’d be");
			if (target.milkQ() < 50) output(" at least a trickle");
			else if (target.milkQ() < 500) output(" a few drops");
			else output(" a flood");
			output(" of milk pouring out of your tits by now, but they seem to have dried up entirely.");
			output("\n\n<b>You’ve stopped lactating!</b>");

			target.milkMultiplier = 0;
			
			return true;
		}
		
		private function heightChange(target:Creature):Boolean
		{
			var tChange:int = 1 + rand(3);
			//Lengthen shortboyo
			if (target.tallness < 4 && target.tallnessUnlocked(target.tallness + tChange))
			{
				output("\n\nYou stumble forward, temporarily unbalanced. It feels like your centre of balance has changed, and you soon realise that it really has - <b>you’re taller!</b> How’s the weather up there?");
				target.tallness += tChange;
			}
			//Smallinize tall d00d
			else if (target.tallness > 5*12 + 5 && target.tallnessUnlocked(target.tallness - tChange))
			{
				output("\n\nYou stumble forward, temporarily unbalanced. It feels like your centre of balance has changed, and you soon realise that it really has - <b>you’ve got smaller!</b>");
				target.tallness -= tChange;
			}
			else
			{
				output("\n\n" + target.tallnessLockedMessage());
				return false;
			}
			
			return true;
		}
		
		private function scaleColorChange(target:Creature):Boolean
		{
			output("\n\nYour skin itches for a moment, and you look down, quickly catching a glance of your scales. A new color is washing over them, and soon you’re left with <b>golden scales!</b>");
			output("\n\nYour codex confirms that unlike true Xhelarfog, your scales aren’t <i>actually</i> made of gold, so you won’t have to worry about people trying to chip them off for easy credits.");
			
			target.scaleColor = "gold";
			
			return true;
		}
		
		private function legChange(target:Creature):Boolean
		{
			if (target.legCount == 1)
			{
				output("\n\nYou feel a strange, splitting feeling in the end of your long, snake-like tail, and it’s not long until its rushed all the way up to the gap at your thighs. You’ve not left long with this strange, two-tailed legged look, as they spasm suddenly. You drop to the floor, panting as you feel further change occuring. Your vision swims for a moment, but your legs soon finish restructuring themselves");
				if (target.skinType == GLOBAL.SKIN_TYPE_GEL) output(" doubtless aided by the lack of bones to rearrange");
				output(", and you pull yourself up to <b>your new, human feet.</b>");
				
				target.legType = GLOBAL.TYPE_HUMAN;
				target.clearLegFlags();
				target.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			}
			else if (target.legCount == 2)
			{
				output("\n\nYour legs tingle strangely, and you sit down, ready to wait out whatever happens without falling over.");
				if (target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output(" They seem to be (somewhat painfully) stretching and straightening themselves into a plantigrade configuration.");
				output(" The tingling soon moves down to your feet, and you watch as three of your toes lengthen out, becoming flexible and nimble as the other two shrink, vanishing back into the main body of your feet. Your heel too, seems to tingle, and before you know it, you’ve grown an additional, back mounted toe. Weird!");
				output("\n\n...You’re going to need new shoes.");
				if (kGAMECLASS.silly) output(" Though now that you think about it, it’s never really been confirmed if any of your outfits include shoes to begin with. You don’t have a slot for them or anything. Void, what is this madness?!");

				target.legType = GLOBAL.TYPE_XHELARFOG;
				target.clearLegFlags();
				target.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
				target.addLegFlag(GLOBAL.FLAG_STICKY);
				if (target.hasSkinFlag(GLOBAL.FLAG_SCALED_PRETTY)) target.addLegFlag(GLOBAL.FLAG_SCALED);
			}
			else
			{
				output("\n\nSuddenly unable to control your legs, you topple over, watching in horror as all but two of them shake dreadfully, pain coursing through you as they seem to <i>shrink</i>.");
				output("\n\nIt doesn’t stop until the legs have vanished entirely, the pain slowly washing out of your system.");
				output("\n\n<b>You’re left with two " + GLOBAL.TYPE_NAMES[target.legType].toLowerCase() + " legs</b>.");
				if (target.isTaur())
				{
					output(" You’ve lost your tauric configuration, too.");
					if (kGAMECLASS.silly) output(" Finally! You can get more content now.");
				}
			}
			
			target.genitalSpot = 0;
			target.legCount = 2;

			return true;
		}
		
		private function skinTypeChange(target:Creature):Boolean
		{
			kGAMECLASS.clearMenu();

			output("\n\nThe prickling sensation returns and seems to sink into your flesh, permeating deep, deep into you, down to your bones themselves. Every bone in your body seems to dissolve.");
			if (kGAMECLASS.silly && target.hasCock(GLOBAL.TYPE_CANINE)) output("\n\nYes, even <i>that</i> one.");
			output("\n\nYou pass out.");
			
			kGAMECLASS.addButton(0, ". . .", skinTypeChangeTwo, target);
			
			return true;
		}
		
		private static function skinTypeChangeTwo(target:Creature):void
		{
			kGAMECLASS.clearOutput();
			kGAMECLASS.processTime(60);
			author("GothPastel");
			
			if (InShipInterior())
			{
				output("Groggy and sore, you come to in the comfort of your " + (kGAMECLASS.crew(true) > 0 ? "bed" : "ship") + ". A check of your codex confirms that you’ve only been out an hour.");
				output("\n\nWait.");
				output("\n\nYour hand looked weird just then.");
				output("\n\nYou look down at yourself and soon realise you didn’t pass out for no reason - it looks like you now have <b>semi-gelatinous skin!</b>");
			}
			else
			{
				kGAMECLASS.showName((kGAMECLASS.flags["MET_XHELPLUS_ELIJAH"] == undefined ? "STEELE TECH\nAGENT?" : "ELIJAH"));
			
				output("<i>“-Eele?!”</i>");
				output("\n\n<i>“[pc.Name] Steele?!”</i>")
				output("\n\nYou open your eyes, groggy. Wait, where are you?");
				output("\n\n" + (kGAMECLASS.flags["MET_XHELPLUS_ELIJAH"] == undefined ? "An androgynous half-ausar in a Steele Tech jumpsuit" : "Elijah") + " is standing over you, looking significantly concerned.");
				output("\n\nYou ask what happened, looking around you and spotting your ship a scant few metres away.");
				output("\n\n<i>“I, ah, I found you passed out. Judging by your, uh... Um... Kinda... Gooey? Yeah, gooey! Uh, your skin - I’m guessing bad reaction to the Xhelarfog drug? We’re working on it, I am so, so sorry!");
				if (kGAMECLASS.flags["MET_XHELPLUS_ELIJAH"] != undefined) output(" ...Again.");
				output("”</i> They chatter away, stumbling over pretty much every other word. It’s");
				if (target.isBimbo()) output(" like, super cute!");
				else if (target.isAss()) output(" really quite annoying.");
				else output(" endearing.");
				output("\n\nEventually, you manage to calm them down, waving them off and they vanish off again");
				if (kGAMECLASS.flags["MET_XHELPLUS_ELIJAH"] == undefined) output(" - though not before introducing themselves as Elijah");
				output(".");
				output("\n\nYour hero.");
				output("\n\nAnyway, it looks like you now have <b>semi-gelatinous skin!</b>");
				
				kGAMECLASS.flags["MET_XHELPLUS_ELIJAH"] = 1;
				kGAMECLASS.moveTo("SHIP INTERIOR");
			}

			output(" It’s not quite as flexible as a Rahn or Galotian’s, but it springs back instantly no matter how far you try to depress it, and a few nicks and cuts you’ve managed to pick up over time seal closed, as if they were never there.");
			if (target.hasFur() || target.hasHair()) output("\n\nLooks like <b>you’ve lost your " + (target.hasHair() ? (target.hasFur() ? "fur and hair" : "hair") : "fur") + "</b> too.");
			
			target.hairLength = 0;
			target.skinType = GLOBAL.SKIN_TYPE_GEL;
			target.clearSkinFlags();
			target.addSkinFlag(GLOBAL.FLAG_STICKY);
			target.addSkinFlag(GLOBAL.FLAG_SMOOTH);
			
			kGAMECLASS.flags["XHELPLUS_SKIN_CHANGE"] = 1;
			
			kGAMECLASS.addButton(0, "Next", kGAMECLASS.useItemFunction);
		}
		
		private function growScales(target:Creature):Boolean
		{
			output("\n\nThere’s a tingling feeling over your abdomen and the upper side of your tail, and you look down to see something pushing up from underneath the surface of your skin. You swear, momentarily pained as it forces its way through, but your gelatinous flesh easily repairs itself beneath <b>your new,");
			if (target.scaleColorUnlocked("gold"))
			{
				output(" golden");
				target.scaleColor = "gold";
			}
			else output(" " + target.scaleColor);
			output(" scales.</b>");
			
			target.addSkinFlag(GLOBAL.FLAG_SCALED_PRETTY);
			if (target.legType == GLOBAL.TYPE_XHELARFOG && target.legFlagsUnlocked(GLOBAL.FLAG_SCALED)) target.addLegFlag(GLOBAL.FLAG_SCALED);
			if (target.tailType == GLOBAL.TYPE_XHELARFOG && target.tailFlagsUnlocked(GLOBAL.FLAG_SCALED)) target.addTailFlag(GLOBAL.FLAG_SCALED);
		
			return true;
		}
	}
}