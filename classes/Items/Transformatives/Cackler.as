package classes.Items.Transformatives 
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.formatFloat;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Utility.rand;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	import classes.Util.ShuffleArray;
	import classes.VaginaClass;
	import classes.CockClass;
	
	public class Cackler extends ItemSlotClass
	{
		
		public function Cackler() 
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "Cackler";
			longName = "Cackler";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a simple looking brown wrapper adorned with a picture of an anthropomorphic hyena eating a chocolate bar";
			tooltip = "An old Xenogen transformative under the guise of a chocolate bar filled with crisped rice. It’s a rather simple transformative meant to give the consumer hyena-like features. During Cackler’s development there were several budget cuts related to the lawsuits concerning Canine Poppers. Due to this, Cacklers transformative effects were cut back somewhat, leaving it incapable of removing certain extremities. Thankfully, this only applies to wings and horns.\n\nThe front of the wrapper has the name spelled out in big, blocky letters with a cartoon hyena girl throwing the product into her mouth. On the back, alongside the nutritional facts, there is a small label that reads:\n\n<i>The effects of this transformative are <b>NOT</b> meant to be a 100% accurate representation of Terran Hyenas!</i>";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "nourish";
			
			basePrice = 1250;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("Freed");
			kGAMECLASS.processTime(3);

			if (!(target is PlayerCharacter))
			{
				kGAMECLASS.output(target.capitalA + target.short + " uses it to no effect.");
				return false;
			}

			var availableTFs:Array = new Array();
			var lockedTFs:Array = new Array();

			//Gain Hyena ears
			if (target.earType != GLOBAL.TYPE_HYENA)
			{
				if (target.earTypeUnlocked(GLOBAL.TYPE_HYENA)) availableTFs.push(earMorph);
				else lockedTFs.push("\n\n" + target.earTypeLockedMessage());
			}
			//Gain Black and Brown or Black and Gray striped fur
			if (!target.hasFur() || target.furColor != "black")
			{
				if (!target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FUR)) lockedTFs.push("\n\n" + target.skinTypeLockedMessage());
				else if (!target.furColorUnlocked("black")) lockedTFs.push("\n\n" + target.furColorLockedMessage());
				else availableTFs.push(furMorph);
			}
			//Thickness reduction, maybe 1-3% per a proc:
			if (target.thickness > 30)
			{
				if (target.thicknessUnlocked(target.thickness - 3)) availableTFs.push(hyenaThinness);
				else lockedTFs.push("\n\n" + target.thicknessLockedMessage());
			}
			//Nipples change to black and increase lust slightly when proc'd:
			if (target.nippleColor != "black")
			{
				if (target.nippleColorUnlocked("black")) availableTFs.push(nippleMorph);
				else lockedTFs.push("\n\n" + target.nippleColorLockedMessage());
			}
			//Female or a herm, increase height by 2 or 3 inches, cut off at around 7 feet 4 inches for females, cutoff at 8 feet for herms:
			if (target.hasVagina() && target.tallness < (target.isHerm() ? 96 : 88))
			{
				if (target.tallnessUnlocked(target.tallness + 2) || target.tallnessUnlocked(target.tallness + 3)) availableTFs.push(hyenaGrowth);
				else lockedTFs.push("\n\n" + target.tallnessLockedMessage());
			}
			//Gain Hyena Tail
			if (target.tailType != GLOBAL.TYPE_HYENA)
			{
				if (target.tailCount == 0 && !target.tailCountUnlocked(1)) lockedTFs.push("\n\n" + target.tailCountLockedMessage());
				else if (!target.tailTypeUnlocked(GLOBAL.TYPE_HYENA)) lockedTFs.push("\n\n" + target.tailTypeLockedMessage());
				else availableTFs.push(tailMorph);
			}
			//Gain Digitigrade Furry Hyena Legs
			//If only 1 leg, grow 1 more leg making them bipedal.
			//If legs number in an odd number above 1, remove 1 leg.
			if (target.legType != GLOBAL.TYPE_HYENA)
			{
				if (!target.legTypeUnlocked(GLOBAL.TYPE_HYENA)) lockedTFs.push("\n\n" + target.legTypeLockedMessage());
				else if (!target.legFlagsUnlocked([GLOBAL.FLAG_FURRED, GLOBAL.FLAG_DIGITIGRADE])) lockedTFs.push("\n\n" + target.legFlagsLockedMessage());
				else if (target.legCount%2 != 0 && !target.legCountUnlocked((target.legCount < 2 ? 2 : target.legCount - 1))) lockedTFs.push("\n\n" + target.legCountLockedMessage());
				else availableTFs.push(legMorph);
			}
			//Gain Furred and Pawed Hyena Arms
			if (target.armType != GLOBAL.TYPE_HYENA)
			{
				if (target.armTypeUnlocked(GLOBAL.TYPE_HYENA)) availableTFs.push(armMorph);
				else lockedTFs.push("\n\n" + target.armTypeLockedMessage());
			}
			//Gain a Muzzled Hyena face
			if (target.faceType != GLOBAL.TYPE_HYENA)
			{
				if (target.faceTypeUnlocked(GLOBAL.TYPE_HYENA) && target.faceFlagsUnlocked([GLOBAL.FLAG_FURRED, GLOBAL.FLAG_MUZZLED])) availableTFs.push(faceMorph);
				else lockedTFs.push("\n\n" + target.faceTypeLockedMessage());
			}
			//Change lips to black; if lip mod above 1, lower by 1 point:
			if (target.lipColor != "black") availableTFs.push(lipsMorph);
			else if (target.lipMod > 1)
			{
				if (target.lipModUnlocked(target.lipMod - 1)) availableTFs.push(lipsMorph);
				else lockedTFs.push("\n\n" + target.lipModLockedMessage());
			}
			//If pc tongue is not Canine change tongue to Canine:
			if (target.tongueType != GLOBAL.TYPE_CANINE)
			{
				if (target.tongueTypeUnlocked(GLOBAL.TYPE_CANINE)) availableTFs.push(tongueMorph);
				else lockedTFs.push("\n\n" + target.tongueTypeLockedMessage());
			}
			//if, and only if pc has a dick, and it isn't already a black sheathed, knotted canine dick with a tapered head; Change Cock to a black Knotted, sheathed Canine Dick with a tapered head, with a large lust gain, raise libido by 1 or 2 points. It will fully change your dick if proc'd!
			var cok:int = hyenableCock(target);
			if (cok == -2) lockedTFs.push("\n\n" + target.cockTypeLockedMessage());
			else if (cok != -1) availableTFs.push(cockMorph);
			//increases cock length, with girth scaling along with it, of a single cock by an inch or more cutting off at around 18 inches in length, slight lust increase:
			var shortCok:int = stretchableCock(target);
			if (shortCok == -2) lockedTFs.push("\n\n" + target.cockLengthLockedMessage());
			else if (shortCok != -1) availableTFs.push(cockGrowth);
			// Vagina TF
			var vag:int = hyenableCunt(target);
			if (vag == -2) lockedTFs.push("\n\n" + target.vaginaTypeLockedMessage());
			else if (vag != -1) availableTFs.push(cuntMorph);
			// Increase Clit Size
			if (target.totalClits() > 0 && target.clitLength < 8)
			{
				if (!target.clitLengthUnlocked(8)) lockedTFs.push("\n\n" + target.clitLengthLockedMessage());
				else availableTFs.push(clitGrowth);
			}

			ShuffleArray(availableTFs);
			ShuffleArray(lockedTFs);

			output("You quickly tear off the wrapper and take a bite of the chocolate bar, savoring the flavor for a moment before finishing it off. It’s a tasty treat, but you didn’t buy it for the snack. Now to sit back and see what happens.");

			var changes:int = 0;
			while (availableTFs.length > 0 || lockedTFs.length > 0)
			{
				if (rand(5-changes) == 0) break;
				kGAMECLASS.processTime(1);
				if (availableTFs.length > 0) availableTFs.pop()(target);
				else output(lockedTFs.pop());
				changes++;
			}

			if (changes == 0)
			{
				kGAMECLASS.processTime(2+rand(6));
				output("\n\nYou spend quite some time waiting for, well, anything to happen. Unfortunately, the minutes fly by and nothing changes... Damn, guess that was a waste of time and money.");
				output("\n\nAt least you had a tasty snack!");
				if (kGAMECLASS.silly) output(" <b>(+5 happiness!)</b>");
			}

			return false;
		}

		//Gain Hyena ears
		private function earMorph(target:Creature):void
		{
			output("\n\nSuddenly, your ears begin to itch, and before you know it, you can feel them start to change! You quickly lift up your codex, watching as they");
			if (!target.hasEmoteEars()) output(" move up to the top of your head, then");
			output(" enlarge, eventually coming to pointed tips. As a thin layer of fur begins to settle in, you look into your reflection and realize <b>you’ve grown a pair of furred hyena ears!</b>");
			target.earType = GLOBAL.TYPE_HYENA;
			target.clearEarFlags();
			target.addEarFlag(GLOBAL.FLAG_TAPERED);
			target.addEarFlag(GLOBAL.FLAG_FURRED);
		}

		//Gain Black and Brown or Black and Gray striped fur
		private function furMorph(target:Creature):void
		{
			output("\n\nYour [pc.skinFurScales] " + (InCollection(target.skinType, GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_FEATHERS) ? "start" : "starts") + " to itch as a prickly, burning sensation overcomes your dermis. Almost as if your pores themselves are on fire, you helplessly scratch yourself for relief!");
			if (target.hasFur()) output(" Soon after, your [pc.furColor] coat becomes a layer of pure white");
			else output(" You feel the fur spread over your body, sprouting up over every inch");
			if (target.hasAccentMarkings()) output(", your [pc.accentMarkings] fading away");
			output(".");
			if (InCollection(target.skinType, GLOBAL.SKIN_TYPE_FEATHERS, GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_CHITIN))
			{
				output(" Your");
				switch (target.skinType)
				{
					case GLOBAL.SKIN_TYPE_FEATHERS: output(" feathers"); break;
					case GLOBAL.SKIN_TYPE_SCALES: output(" scales"); break;
					case GLOBAL.SKIN_TYPE_CHITIN: output(" layers of chitin"); break;
				}
				output(" fall from your body and land on the ground around you, only to be swiftly replaced by a layer of fur.");
			}
			target.clearAccentMarkings();
			// 1: brown stripes 2: gray spots
			var accentChoice:int = (1 + rand(2));
			var newAccent:String = (accentChoice == 1 ? "brown" : "gray");
			target.setStatusValue("Hyena Fur", 1, accentChoice);
			target.createStatusEffect("Hyena Fur");
			target.setStatusTooltip("Hyena Fur", newAccent);
			output(" The burning itch subsides and you’re left with <b>black and " + newAccent + " " + (accentChoice == 1 ? "striped" : "spotted") + " fur!</b>");
			target.skinType = GLOBAL.SKIN_TYPE_FUR;
			target.skinAccent = newAccent;
			target.clearSkinFlags();
			target.furColor = "black";
		}

		//Thickness reduction, maybe 1-3% per a proc:
		private function hyenaThinness(target:Creature):void
		{
			output("\n\nYour stomach grumbles for a moment as the microsurgeons begin their work. You look down, watching as your [pc.belly] and other parts of your body begin to shift. Over a few seconds, you witness some of the extra pudginess you’ve built up on your adventures starts to fade away. Soon, you’re left with a slightly more defined form, <b>your " + (kGAMECLASS.silly ? "<I>THICC</i>ness" : "thickness") + " has decreased!</b>");
			target.thickness -= 1 + rand(3);
		}

		//Nipples change to black and increase lust slightly when proc'd:
		private function nippleMorph(target:Creature):void
		{
			output("\n\nYou feel a pleasurable sensation overtaking your [pc.nippleColor] peaks! Instinctively, you bring a hand to your chest, idly playing with one of the sensitive nubs. As you do, you can’t help but let out a quiet, pleasured moan. Sadly, it’s a short-lived experience. When the pleasant feeling in your chest fades, you take a look " + (target.isChestExposed() ? "at your bare [pc.chest]" : "under your [pc.chestCover]") + ", and realize they’ve changed to <b>black [pc.nipples]!</b>");
			target.nippleColor = "black";
		}

		//Female or a herm, increase height by 2 or 3 inches, cut off at around 7 feet 4 inches for females, cutoff at 8 feet for herms:
		private function hyenaGrowth(target:Creature):void
		{
			var growth:int = 2+rand(2);
			if (!target.tallnessUnlocked(target.tallness+growth)) growth = 5-growth;
			output("\n\nYou stumble forward slightly as the ground seems to inch ever further away from you. Once everything settles into place, you notice the world around you seems a tad bit smaller than before, or rather you’ve gotten bigger. Deciding to check your codex to confirm, you soon discover that, sure enough, <b>you’ve grown " + num2Text(growth) + " inches!</b>");
			target.tallness += growth;
		}

		//Gain Hyena Tail
		private function tailMorph(target:Creature):void
		{
			//if PC doesn't have a tail:
			if (target.tailCount == 0 || target.tailType == GLOBAL.TYPE_HUMAN)
			{
				output("\n\nThere’s a strange feeling at the base of your spine, right above your [pc.butt]. You bring a hand to the spot and discover an odd bump. It’s overly sensitive but not painfully so. Rather, it’s an almost pleasurable, tingly feeling. Before you can investigate further, the bump sprouts forth with surprising force, soon forming into a short tail. After a short while, a thick layer of fur begins to cover the length and you slowly let <b>your new short, bushy hyena tail settle in!</b>");
				target.tailCount = 1;
			}
			//if PC does have a tail:
			else
			{
				output("\n\nYour [pc.tails] " + (target.tailCount > 1 ? "feel" : "feels") + " a bit odd, as if a faint pressure is being applied to " + (target.tailCount > 1 ? "them" : "it") + ". You look over your shoulder and realize that " + (target.tailCount > 1 ? "they have" : "it has") + " begun to transform,");
				if (!target.hasTailFlag(GLOBAL.FLAG_SHORT)) output(" becoming much shorter,");
				if (!target.hasPartFur("tail")) output(" gaining a bushy layer of fur,");
				if (target.hasTailFlag(GLOBAL.FLAG_SHORT) && target.hasPartFur("tail")) output(" and");
				output(" rounding out at the tip! When the changes are all said and done, <b>your tail" + (target.tailCount > 1 ? "s are" : " is") + " short and bushy like " + (target.tailCount > 1 ? "those" : "that") + " of a hyena!</b>");
			}
			target.tailType = GLOBAL.TYPE_HYENA;
			target.clearTailFlags();
			target.addTailFlag(GLOBAL.FLAG_SHORT);
			target.addTailFlag(GLOBAL.FLAG_FURRED);
		}

		//Gain Digitigrade Furry Hyena Legs
		//If only 1 leg, grow 1 more leg making them bipedal.
		//If legs number in an odd number above 1, remove 1 leg.
		private function legMorph(target:Creature):void
		{
			output("\n\nA sudden numbing pain crawls through your [pc.legOrLegs], causing you to stumble to the ground as all tactile feeling in " + (target.legCount > 1 ? "them" : "it") + " vanishes. You quickly look down and you see that");
			if (target.isNaga())
			{
				output(" your serpentine lower body is beginning to shrink down considerably. Slowly, the length splits in half as new bones form and set into a digitigrade fashion" + (target.hasPartFur("leg") ? "," : ". Then, a layer of fur grows our over them soon") + " leaving you with");
				target.legCount = 2;
			}
			else if (target.legCount == 1)
			{
				output(" your single [pc.leg] seems to split down the center, leaving you with two copies of the original.");
				if (!target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output(" Each begins to shift as bones manifest with the help of your microsurgeons, rearranging itself into a digitigrade form.");
				if (target.hasPartFur("leg")) output(" You feel a tingle in your legs as your fur begins to change to a more hyena-like pattern, soon leaving you with");
				else output(" Fur begins to sprout all over them in patches, and you’re soon left with");
				target.legCount = 2;
			}
			else if (target.legCount == 2)
			{
				output(" your [pc.legs] begin to change before your eyes.");
				if (target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE))
				{
					if (target.hasPartFur("leg")) output(" Thankfully, your legs mostly remain the same but a layer of fur begins to grow in patches, quickly leaving you with");
					else output(" Bones crack and new ones settle in to give your legs a digitigrade shape. Thankfully you can’t feel a thing. Afterward, patches of fur begin to grow all over, leaving you with what looks like");
				}
				else
				{
					if (target.hasPartFur("leg")) output(" Bones crack and new ones settle in to give your legs a digitigrade shape. Thankfully you can’t feel a thing. Afterward, your existing fur takes on a hyena-like pattern, leaving you resting on");
					else output(" Luckily the only major change is the pattern of your furry legs: the fur of your paws and ankles shifts to a dark black, soon leaving behind");
				}
			}
			else if (target.legCount == 3)
			{
				output(" the odd man out of your unorthodox arrangement of [pc.legs] begins to shrivel into nothingness.");
				if (target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output(" The remaining pair thankfully retain their digitigrade state.");
				else output(" The remaining pair begin to change shape as bones begin to work into a digitigrade form.");
				if (target.hasPartFur("leg")) output(" The existing layer of fur over your legs begins to adapt to a hyena-like pattern, leaving you with");
				else output(" A layer of fur begins to grow over them, leaving you with");
				target.legCount = 2;
			}
			else
			{
				output(" your entire lower body is morphing and changing shape into that of a hyena, hunch and all");
				if (target.legCount%2 == 1)
				{
					output("! Suddenly, your impressive array of [pc.legs] lose one of their number as the limb disappears into your body followed by the remainder changing into");
					target.legCount -= 1;
				}
				else output(". Your legs follow suit, becoming");
				/*{if not digitigrade: Each leg begins to shift as bones manifest with the help of your microsurgeons, soon rearranging themselves and settling into a digitigrade form.}
				{if no furred legs: Fur begins to sprout all over your lower body and legs in patches and you’re soon left with /Else: You feel a tingle in your legs as your fur begins to change to a more hyena-like pattern, soon leaving you with}*/
			}
			output(" <b>furred hyena legs with padded feet!</b>");
			target.legType = GLOBAL.TYPE_HYENA;
			target.clearLegFlags();
			target.addLegFlag(GLOBAL.FLAG_FURRED);
			target.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			if(target.legCount == 2 && target.genitalSpot != 0) target.genitalSpot = 0;
		}

		//Gain Furred and Pawed Hyena Arms
		private function armMorph(target:Creature):void
		{
			output("\n\nYour arms go numb as they begin to change. After a few moments,");
			if (!target.hasPartFur("arm"))
			{
				output(" a layer of fur grows over them");
				if (!target.hasArmFlag(GLOBAL.FLAG_PAWS)) output(" and");
			}
			if (!target.hasArmFlag(GLOBAL.FLAG_PAWS)) output(" your fingers gain sensitive pads on the tips as well as blunt, non-retractable claws");
			output(". Some time passes before full feeling returns to your arms; the transformation felt like it took longer than it did. Taking a moment to look over the changes, you realize that your arms have become <b>furry, clawed, hyena-like arms!</b>");
			target.armType = GLOBAL.TYPE_HYENA;
			target.clearArmFlags();
			target.addArmFlag(GLOBAL.FLAG_PAWS);
			target.addArmFlag(GLOBAL.FLAG_FURRED);
		}

		//Gain a Muzzled Hyena face
		private function faceMorph(target:Creature):void
		{
			output("\n\nYou feel your [pc.face] begin to change as a sharp pain shoots through your skull! " + (target.hasFaceFlag(GLOBAL.FLAG_MUZZLED) ? "T" : "Your mouth starts to extend from your face while your nose reshapes as t") + "eeth reform and rearrange themselves into a more animalistic arrangement.");
			if (!target.hasFaceFlag(GLOBAL.FLAG_MUZZLED)) output(" Your nose twitches for a moment before it begins to shift from [pc.skinColor] to a smooth black shade, its tip ever so rough.");
			output(" When the changes subside, you lift your codex and quickly look over the changes. <b>You now have a muzzled hyena face!</b>");
			target.faceType = GLOBAL.TYPE_HYENA;
			target.clearFaceFlags();
			target.addFaceFlag(GLOBAL.FLAG_FURRED);
			target.addFaceFlag(GLOBAL.FLAG_MUZZLED);
		}

		//Change lips to black; if lip mod above 1, lower by 1 point:
		private function lipsMorph(target:Creature):void
		{
			output("\n\nA strange sensation takes over your [pc.lipsChaste], almost as if they’ve been put under anesthetic... It’s even got that damn funny taste in the back of your mouth! After a moment, the numbness subsides and you raise your codex to see what has transpired, quickly noticing");
			if (target.lipColor != "black") output(" <b>you now have black lips!</b>");
			if (target.lipMod > 1 && target.lipModUnlocked(target.lipMod - 1))
			{
				if (target.lipColor == "black") output(" <b>they");
				else output(" They also");
				output(" seem a tad bit thinner then you remember.");
				if (target.lipColor == "black") output("</b>");
				target.lipMod -= 1;
			}
			target.lipColor = "black";
		}

		//If pc tongue is not Canine change tongue to Canine:
		private function tongueMorph(target:Creature):void
		{
			output("\n\nYour taste buds seem to short out as your tongue goes limp. Before you know what’s happening, it feels like your mouth is filling with a growing mass, making it somewhat harder to breathe. Thankfully, after a few moments the swelling recedes, and you can inhale with ease once more. Feeling and taste returns with somewhat increased sensitivity. You take a look into your codex and stick out your tongue, discovering it has changed to a <b>fairly long canine tongue!</b>");
			target.tongueType = GLOBAL.TYPE_CANINE;
			target.clearTongueFlags();
			target.addTongueFlag(GLOBAL.FLAG_LONG);
			target.addTongueFlag(GLOBAL.FLAG_NUBBY);
		}

		//if, and only if pc has a dick, and it isn't already a black sheathed, knotted canine dick with a tapered head; Change Cock to a black Knotted, sheathed Canine Dick with a tapered head, with a large lust gain, raise libido by 1 or 2 points. It will fully change your dick if proc'd!
		private function hyenableCock(target:Creature):int
		{
			var cocks:Array = new Array();
			var locked:Boolean = false;
			for (var i:int = 0; i < target.cocks.length; ++i)
			{
				if (target.cocks[i].cType == GLOBAL.TYPE_CANINE && target.cocks[i].cockColor == "black" && target.hasCockFlag(GLOBAL.FLAG_KNOTTED, i) && target.hasCockFlag(GLOBAL.FLAG_TAPERED, i) && target.hasCockFlag(GLOBAL.FLAG_SHEATHED, i)) continue;
				if (target.cockTypeUnlocked(i, GLOBAL.TYPE_CANINE)) cocks.push(i);
				else locked = true;
			}
			if (cocks.length > 0) return RandomInCollection(cocks);
			else if (locked) return -2;
			else return -1;
		}
		private function cockMorph(target:Creature):void
		{
			var cockIdx:int = hyenableCock(target);
			output("\n\n" + (target.hasCocks() ? "One of your dicks" : "Your dick") + " begins to morph, becoming a formless mass for a moment.");
			if (!target.hasCockFlag(GLOBAL.FLAG_TAPERED, cockIdx)) output(" Straight away it settles into a new shape, the [pc.cockHead " + cockIdx + "] of your member elongating to a tapered tip.");
			if (!target.hasKnot(cockIdx)) output(" Heat rises at the base of your dong as a sensitive ball of flesh forms there, becoming your new knot.");
			if (!target.hasSheath(cockIdx))
			{
				output(" The skin behind your");
				if (!target.hasKnot(cockIdx)) output(" newly minted");
				output(" knot bunches up, forming a sheath perfect for holding your new animalistic member.");
			}
			if (target.cocks[cockIdx].cockColor != "black") output(" The color darkens from [pc.cockColor " + cockIdx + "] to a dark pitch black color.");
			output(" Once the microsurgeons finish their changes, <b>you’re left with a sheathed and knotted black canine dick with a tapered head!</b>");
			target.shiftCock(cockIdx, GLOBAL.TYPE_CANINE);
			target.cocks[cockIdx].cockColor = "black";
			target.changeLust(20+target.libido()/4);
			target.slowStatGain("libido", 2);
		}

		//increases cock length, with girth scaling along with it, of a single cock by an inch or more cutting off at around 18 inches in length, slight lust increase:
		private function stretchableCock(target:Creature):int
		{
			var cocks:Array = new Array();
			var locked:Boolean = false;
			for (var i:int = 0; i < target.cocks.length; ++i)
			{
				if (target.cLength(i) >= 17.2) continue;
				if (target.cockLengthUnlocked(i, target.cLength(i)+1)) cocks.push(i);
				else locked = true;
			}
			if (cocks.length > 0) return RandomInCollection(cocks);
			else if (locked) return -2;
			else return -1;
		}
		private function cockGrowth(target:Creature):void
		{
			var cockIdx:int = stretchableCock(target);
			output("\n\nYou feel a sudden surge of arousal begin to manifest in your groin as " + (target.hasCocks() ? "one of your cocks" : "your cock") + "leaps to full mast");
			if (!target.isCrotchExposed()) output(", forming a nice tent in your [pc.crotchCovers]");
			output(". You notice it swelling in length and girth " + (target.isCrotchExposed() ? "until it gains approximately an inch of worth of new volume." : "filling out your [pc.crotchCovers] with about an inch of new volume."));
			var growth:Number = (8 + rand(13))/10;
			if (target.cockLengthUnlocked(cockIdx, target.cLength(cockIdx) + growth)) target.cocks[cockIdx].cLength(growth);
			else target.cocks[cockIdx].cLength(1);
			target.changeLust(5+target.libido()/10);
		}

		//if, and only if the pc has a pussy, and pc doesn't already have a black wet canine pussy; Change 1 Pussy to a black wet Canine Pussy, causes orgasm event, raise libido by 1 or 2 points
		private function hyenableCunt(target:Creature):int
		{
			var cunts:Array = new Array();
			var locked:Boolean = false;
			for (var i:int = 0; i < target.vaginas.length; ++i)
			{
				if (target.vaginas[i].type == GLOBAL.TYPE_CANINE && target.vaginas[i].vaginaColor == "black" && target.vaginas[i].wetnessRaw >= 4) continue;
				if (target.vaginaTypeUnlocked(i, GLOBAL.TYPE_CANINE)) cunts.push(i);
				else locked = true;
			}
			if (cunts.length > 0) return RandomInCollection(cunts);
			else if (locked) return -2;
			else return -1;
		}
		private function cuntMorph(target:Creature):void
		{
			var vagIdx:int = hyenableCunt(target);
			output("\n\nA wave of arousal hits [pc.oneVagina " + vagIdx + "], causing it to clench in near-orgasmic release! A sudden gush of [pc.girlCumNoun]");
			if (!target.isCrotchExposed()) output(" into your [pc.crotchCoverUnder].");
			else output(" slicks down your " + (target.isNaga() ? "snake-like underbelly, covering it" : "thighs, covering them") + " in a film of womanly release.");
			output(" After your orgasm, you feel your [pc.vaginaNoun " + vagIdx + "] shift and change.");
			if (target.vaginas.vaginaColor != "black") output(" The color also starts to darken from [pc.cuntColor " + vagIdx + "] to a dark, pitch-black color.");
			output(" Once everything settles down, you use your codex to take a look and discover that <b>you’ve gained a black, dripping-wet, canine pussy!</b>");
			target.shiftVagina(vagIdx, GLOBAL.TYPE_CANINE);
			target.vaginas[vagIdx].vaginaColor = "black";
			target.vaginas[vagIdx].wetnessRaw = 4;
			target.slowStatGain("libido", 2);
			target.orgasm();
		}

		//Clit size increase maxes out at 10 inches, raises lust slightly:
		private function clitGrowth(target:Creature):void
		{
			output("\n\nYou feel a rush of heat coursing through your body and into your [pc.clits]. The sudden burst of arousal doubles you over in shock, stopping you dead in your tracks. While you take a moment to make sure that your lady parts are still intact, you realize that your <b>" + (target.totalClits() > 1 ? "clits have" : "clit has") + " grown almost a half an inch!</b>");
			target.changeLust(5+target.libido()/10);
			target.clitLength += (2+rand(6))/10;
			if (target.clitLength > 8) target.clitLength = 8;
		}
	}
}