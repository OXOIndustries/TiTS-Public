// Capraphorm
// An alien goat TF item, some surprises
// By SoAndSo
// Capraphorm is bought solely at The Entite in Gildenmere/Myrellion.

/*

Summary

Capraphorm is a TF mod made by Envyoidics LTD. It focuses on turning the user into a goat morph with a small chance for a unique variant of morphs called an adremmalex.
Single variant.
Available at The Entite in Gildenmere/Myrellion.
Introduces usual morphs such as fur, eyes, horns, colors and other things.

*/

package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.ItemSlotClass;
	import classes.StorageClass;
	import classes.GameData.CodexManager;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.num2Text;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	
	public class Capraphorm extends ItemSlotClass
	{
		public function Capraphorm()
		{
			_latestVersion = 1;
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			
			shortName = "CapraP.";
			longName = "Capraphorm inhaler";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a Capraphorm inhaler";
			tooltip = "A small, disposable inhaler full of something called “Capraphorm.” It is blank white in appearance with a black silhouette of what appears to be a Terran goat above the mouthpiece. There’s little indication of what it does, but logic says that it seems to be a goat mod.\n\nThe flavor blurb says: <i>“A cool combo of fresh mint, lemon, orange and strawberry!”</i>";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 6660;
			
			version = _latestVersion;
		}
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			author("SoAndSo");
			
			if (target is PlayerCharacter)
			{
				kGAMECLASS.showName("\nCAPRAPHORM");
				// Consumption
				output("You remove the white cap from the end of the inhaler. Seems like an odd method of delivery but hey, the wonders of technology these days!");
				output("\n\nPutting the red mouthpiece to your [pc.lipsChaste], you clamp them down to make sure it’s an airtight seal. Then you realize it has no button to press. How does it...? Your reasoning is interrupted by an automatic fresh blast of chilled gas filling your cheeks.");
				output("\n\nMmm, fruity!");
				output("\n\nIt leaves a fine residue of sweet moisture inside your cheeks and on your tongue. You can feel the rush of air filling up your lungs, a sharpness then a numbness perturbing your nerves.");
				output("\n\nThe gas release only lasts a few seconds, enough for the inhaler to empty itself entirely. Feeling that the inhaler is lighter, you toss the useless thing aside. Not like anyone else can use it now anyhow!");
				output("\n\nApart from the sensation of having breathed the air from a meadow of fruits and flowers, there doesn’t seem to be have been any immediate change.");
				output("\n\nGuess you’ll have to wait for it to kick in!");
				output("\n\n");
				
				// PC gains that status effect that means you’re under a TF or whatever it’s called, adjjjisjjrhiwig. Effect lasts 3 hours with up to 6 mutations occurring, 1 for every 30 minutes.
				var duration:int = 360;
				
				// "adjjjisjjrhiwig"
				// v1: Timestamp!
				// v2: Number of consecutive doses
				target.createStatusEffect("adjjjisjjrhiwig", duration, 0, 0, 0, false, "Icon_Poison", "Under the effects of the Capraphorm inhaler.", false, 0,0xB793C4);
				target.setStatusValue("adjjjisjjrhiwig", 1, duration);
				target.addStatusValue("adjjjisjjrhiwig", 2, 1);
				target.setStatusMinutes("adjjjisjjrhiwig", duration);
				
				//CodexManager.unlockEntry("Capraphorm");
			}
			else
			{
				output(target.capitalA + target.short + " drinks the Capraphorm inhaler to no effect.");
			}
			return false;
		}
		
		public static function OnHourTF(deltaT:uint, maxEffectLength:uint, doOut:Boolean, target:Creature, effect:StorageClass):void
		{
			AddLogEvent("<u>The Capraphorm inhaler has an effect....</u>", "passive");
			
			var totalHours:int = ((kGAMECLASS.minutes + Math.min(deltaT, maxEffectLength)) / 60);
			if (effect.minutesLeft <= 0) totalHours++;
			
			var p:Number = effect.value2 * 20;
			for (var i:int = 0; i < totalHours; i++)
			{
				procTF(target, effect);
			}
			
			if (effect.minutesLeft <= 0)
			{
				ExtendLogEvent("\n\nYou notice that senses feel a little more normal now. <b>The effects of the Capraphorm mod has passed.</b>");
			}
		}
		
		// Transformations
		private static function procTF(target:Creature, effect:StorageClass):void
		{
			var msg:String = "";
			var doses:Number = effect.value2;
			var select:int = 0;
			var idx:int = 0;
			var TFList:Array = new Array();
			
			// Effects/Guaranteed
			// All of these effects have a 100% chance of occurring per use.
			
			// Raise height randomly to a maximum of 78.
			if(target.tallness < 78)
				TFList.push(1);
			// Increase tone, between 3-8 per use, to a max of 70.
			if(target.tone < 70)
				TFList.push(2);
			// Increase thickness, between 2-4 per use, to a max of 45.
			if(target.thickness < 45)
				TFList.push(3);
			
			// Effects/Random
			// Any of these effects have a 50% chance of occurring per use.
			
			// Change legs to goat legs. Descriptors: sinewy, digitigrade, hairy, shaggy. Change feet to goats hooves. Descriptors: cloven, two-toed, pointed, caprine. Change hoof color to bone.
			// Reduce/Increase leg count to two.
			if(target.legType != GLOBAL.TYPE_GOAT && rand(2) == 0)
				TFList.push(4);
			// Change skintype to goat fur. Descriptors: short, coarse, thick. Randomly change fur color to mottled brown, cream, white, chocolate, or black.
			var goatFurColors:Array = ["mottled brown", "cream", "white", "chocolate", "black"];
			if((target.skinType != GLOBAL.SKIN_TYPE_FUR || !target.hasSkinFlag(GLOBAL.FLAG_THICK)) && rand(2) == 0)
				TFList.push(5);
			// Change eyes to goat eyes. Descriptors: alien, goat-like, intimidating, caprine. Eyes change color to amber, hazel, blue, or white.
			var goatEyeType:int = (rand(2) == 0 ? GLOBAL.TYPE_GOAT : -1);
			var goatEyeColors:Array = ["amber", "hazel", "blue", "white"];
			if(doses >= 5 || rand(5) == 0)
			{
				goatEyeType = GLOBAL.TYPE_ADREMMALEX;
				goatEyeColors = ["amber", "crimson", "red"];
			}
			if(!InCollection(target.eyeType, [GLOBAL.TYPE_GOAT, GLOBAL.TYPE_ADREMMALEX]) && goatEyeType != -1)
				TFList.push(6);
			// Change face to goat muzzle. Descriptors: goat-like, elongated, angular, caprine.
			if(target.faceType != GLOBAL.TYPE_GOAT && rand(2) == 0)
				TFList.push(7);
			// Add/change horns to goat horns up to a max of six/three sets of 2. Horns come in 2 varieties: curled goat horns, bow-curve goat horns. Descriptors: ridged, bony, ornate. Change horn color to ‘bone’. Horns grow from 4" on one use, 9" on two uses and to a maximum of 12" on three.
			var rareHorns:Boolean = false;
			if(doses >= 5 || rand(5) == 0) rareHorns = true;
			if((!target.hasHorns() || target.hornType != GLOBAL.TYPE_GOAT || target.hornLength < 12) && (rareHorns || rand(2) == 0))
				TFList.push(8);
			// If PC has breasts, randomly increase breast size up to a max of 5 per use, capping at GG-cup. No change occurs if femininity = 25. ((is that correct scale? I know there’s two...))
			if(target.femininity >= 50 && target.breastRows[target.smallestTitRow()].breastRatingRaw < 18 && rand(2) == 0)
				TFList.push(9);
			// If PC has balls, randomly increase size up to a max of 3 (with +2 if Bulgy) per use. Maxes out at 12.
			if(target.balls > 0 && target.ballSizeRaw < 12 && rand(2) == 0)
				TFList.push(10);
			// Cocks
			var cIdx:int = 0;
			var shortCocks:Array = [];
			var nonGoatCocks:Array = [];
			if(target.hasCock())
			{
				for(cIdx == 0; cIdx < target.cocks.length; cIdx++)
				{
					if(target.cocks[cIdx].cLengthRaw < 17) shortCocks.push(cIdx);
					if(target.cocks[cIdx].cType != GLOBAL.TYPE_GOAT) nonGoatCocks.push(cIdx);
				}
				
				// If PC has penis, randomly increase size up to a max 3 long. Maxes at 17" long.
				if(shortCocks.length > 0 && rand(2) == 0)
					TFList.push(11);
				// If PC has penis, change penis type to goat penis. Descriptors: slender, thin, caprine. Randomly change penis color to red, pink or cherry red. PC gains a sheath, sheath becomes furred.
				if(nonGoatCocks.length > 0 && rand(2) == 0)
					TFList.push(12);
			}
			// Change ears to 4" goat ears. Descriptors: furred, flickering, narrow.
			if(target.earType != GLOBAL.TYPE_GOAT && rand(2) == 0)
				TFList.push(13);
			
			// Effects/Low Chance Random
			// Any of these effects have a 15% chance of occurring per use.
			
			// If PC has goat fur, change fur color to jade green. Also changes arm, leg and hair color to match as well.
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR && target.hasSkinFlag(GLOBAL.FLAG_THICK) && target.furColor != "jade green" && (doses >= 5 || rand(5) == 0))
				TFList.push(14);
			// Change eyes to four-pointed goat eyes. Descriptors: alien, goat-like, cross-laden, caprine. Eyes change color to amber, crimson or red.
				// Moved - Note: See above.
			// Add/change horns to goat horns up to a max of six/three sets of two. Horns come in 3 potential, additional varieties along with the other 2 from normal mutations: oryx horns, markhor horns and ibex horns.
			// Descriptors for oryx: ridged, slender, curved. Descriptors for markhor: twisting, regal, boney. Descriptors for ibex: thick, back-curved, imperious, ridged. Regardless of horn type, horn color turns to black. Horns grow from 4" on one use, 9" on two uses and to a maximum of 12" on three.
				// Cut - Note: No need for new horn types! However goat horn style will be handled as a hidden status effect.
			// If PC has goat hooves, change hoof color to black.
				// Cut - Note: No need to change hoof color!
			// PC skin changes to tattooed fur. Fur turns jade green with crimson and gold markings.((like the venae TFs/sylvanol)). PC gains perk Primorditatts.
			if(!target.hasPerk("Primorditatts") && !target.hasStatusEffect("Primorditatts Queued") && (doses >= 5 || rand(5) == 0))
				TFList.push(15);
			
			// If PC has goat legs/hooves, eyes and ears, player is a faun.
			// If PC has legs/hooves, eyes, ears, fur and horns, player is a goat-morph.
			// If PC has black hooves, Primorditatts, black horns and cross-laden eyes, player is an adremmalex.
			
			if(TFList.length <= 0) TFList.push(0);
			
			// Loop through doing TFs until we run out, pulling out whichever we use.
			if(TFList.length > 0)
			{
				msg += "\n\n";
				
				// Pick a TF	
				idx = rand(TFList.length);
				select = TFList[idx];
				TFList.splice(idx, 1);
				
				// Catch all
				if(select == 0)
				{
					msg += "And nothing happens. It seems the inhaler had no effect on your body after all.";
				}
				// Height
				else if(select == 1)
				{
					var newTallness:Number = target.tallness + (1 + rand(6));
					if(newTallness > 78) newTallness = 78;
					if(target.tallnessUnlocked(newTallness))
					{
						msg += "There’s a bit of a sinking feeling that fills the back of your mind. You quickly look around your body to see what’s changing, but nothing seems to be happening on the surface! There’s a dull ache for every joint in your limbs and a few ephemeral jolts of pains in your bones.";
						msg += "\n\nIt feels uncomfortable, enough to make you wince at each pang. Feeling your";
						if(target.isGoo()) msg += " goo body";
						else if(target.hasKnees()) msg += " knees";
						else msg += ParseText(" [pc.legOrLegs]");
						msg += " on the edge of buckling over, you sit down on the nearby ground without a concern for positioning or safety.";
						msg += ParseText("\n\nHowever, as soon as your [pc.butt] reaches the surface, the pains stop entirely.");
						msg += "\n\nStanding up again, you’re not sure exactly what you just felt or what’s changed about you. Straightening up to full height, your eye level is a little higher than before.";
						msg += "\n\n<b>Oh! You’re a bit taller now!</b>";
						
						target.tallness = newTallness;
					}
					else
					{
						msg += target.tallnessLockedMessage();
					}
				}
				// Tone
				else if(select == 2)
				{
					var newTone:Number = target.tone + (3 + rand(6));
					if(newTone > 70) newTone = 70;
					if(target.toneUnlocked(newTone))
					{
						msg += ParseText("A mild warmth floods your flesh and muscle, making your [pc.gear] feel a little grating to wear. Then, you feel your arms reflexively fold and your");
						if(target.isGoo()) msg += " goo parts";
						else if(target.hasKnees()) msg += " knees and ankles";
						else msg += ParseText(" [pc.legOrLegs]");
						msg += ParseText(" lock in place as the heat gets stronger. It’s so unusual that you want to shout out in pain but it doesn’t actually <i>hurt</i>. The sensation lasts only a couple of minutes, but the subjugation of your nerves seems to make it feel like an hour! When it fades, you find yourself breathing heavily and your [pc.legOrLegs] and arms difficult to hold up. You could’ve just done a marathon! <b>You’ve become more toned!</b>");
						
						target.tone = newTone;
					}
					else
					{
						msg += target.toneLockedMessage();
					}
				}
				// Thickness
				else if(select == 3)
				{
					var newThicc:Number = target.thickness + (3 + rand(6));
					if(newThicc > 45) newThicc = 45;
					if(target.thicknessUnlocked(newThicc))
					{
						msg += ParseText("There’s a tingle just under your [pc.skinFurScales]. It’s warm and comforting, like sitting in freshly baked cake. You can feel that sensation shift to different areas of your body, some parts like your hips and belly feeling it more than others. It’s a pleasant warmth, one that tickles your nerves. However, moving your limbs makes you realize that they feel a little heavier than before. The sensation lasts only a minute and by the end of it, you feel compelled to see what’s changed. <b>You’re a bit thicker!</b>");
						
						target.thickness = newThicc;
					}
					else
					{
						msg += target.thicknessLockedMessage();
					}
				}
				// Legs/feet
				else if(select == 4)
				{
					if(target.legTypeUnlocked(GLOBAL.TYPE_GOAT) && target.legCountUnlocked(2))
					{
						msg += ParseText("Bones burn and muscles contract, your lower body inexplicably taken over by pain. Your [pc.legs] can’t withstand the internal onslaught of your molecular structure being rearranged and you slip down the floor with gritted teeth. By the One, it <i>hurts</i>! You can’t help but close your [pc.eyes], unwilling to see what’s going to appear below your waist. Several cracks and pangs of pain conjoin, but they’re thankfully brief. After several minutes of aches and muscle tension, you open your eyes to see your <b>furred, digitigrade goat legs and goat hooves!</b> They’re a little sore at first but you adjust to them fairly smoothly, balancing with ease on narrow hooves.");
						
						target.legCount = 2;
						target.genitalSpot = 0;
						target.legType = GLOBAL.TYPE_GOAT;
						target.clearLegFlags();
						target.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
						target.addLegFlag(GLOBAL.FLAG_FURRED);
						target.addLegFlag(GLOBAL.FLAG_HOOVES);
					}
					else if(target.legCountUnlocked(2))
					{
						msg += target.legTypeLockedMessage();
					}
					else
					{
						msg += target.legCountLockedMessage();
					}
				}
				// Fur
				else if(select == 5)
				{
					var newFurColor:String = RandomInCollection(goatFurColors);
					if(target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FUR))
					{
						if(target.hasFur() || target.hasFeathers()) msg += ParseText("You feel the hairs of your [pc.skinFurScales] straighten and twinge, as if a chill had set in the room.");
						else if(target.hasScales() || target.hasChitin()) msg += ParseText("You feel the hardness of your [pc.skinFurScales] soften and bend to the touch.");
						else msg += ParseText("You feel the nerves in your [pc.skinFurScales] tingle and pores open themselves.");
						msg += ParseText(" Across your body, short, coarse hair extends out from every pore. It doesn’t hurt until you rub one surface against another. Your sensitive nerves are reacting to the new strength of your <b>" + newFurColor + " goat fur!</b> After a minute or so, your dermis settles and you have a good rub on your [pc.arms] and [pc.legs] to judge how it all feels. Warm and thick, like a goat!");
						
						target.skinType = GLOBAL.SKIN_TYPE_FUR;
						target.clearSkinFlags();
						target.addSkinFlag(GLOBAL.FLAG_FURRED);
						target.addSkinFlag(GLOBAL.FLAG_THICK);
						target.furColor = newFurColor;
					}
					else
					{
						msg += target.skinTypeLockedMessage();
					}
				}
				// Eyes
				else if(select == 6)
				{
					var newEyeColor:String = RandomInCollection(goatEyeColors);
					if(target.eyeTypeUnlocked(goatEyeType) && target.eyeColorUnlocked(newEyeColor))
					{
						msg += ParseText("You feel a strong, uncomfortable heat seep through your [pc.eyes] and your vision starts to blur immediately. They close of their own accord, the surrounding light overwhelming their");
						if(goatEyeType != GLOBAL.TYPE_ADREMMALEX) msg += " ductile state";
						else msg += " their fragile state of being";
						msg += ". The heat soon cools then dissipates just as quickly as it came on. After a few minutes of keeping them closed just to be sure, you look at your surroundings. Your field of view is wider, things have more visible depth and detail! It must be due to your <b>new set of " + newEyeColor + "";
						if(goatEyeType == GLOBAL.TYPE_ADREMMALEX) msg += ", cross-shaped";
						msg += " goat eyes!</b>";
						
						target.eyeType = goatEyeType;
						target.eyeColor = newEyeColor;
					}
					else if(target.eyeColorUnlocked(newEyeColor))
					{
						msg += target.eyeTypeLockedMessage();
					}
					else
					{
						msg += target.eyeColorLockedMessage();
					}
				}
				// Face
				else if(select == 7)
				{
					if(target.faceTypeUnlocked(GLOBAL.TYPE_GOAT))
					{
						msg += ParseText("There’s a throbbing in your nose, then your cheeks, chin and jaw! A wave of discomfort hits your face yet you lack the power to word your pain. Added mass pushes your [pc.face] in different directions but mostly forward. You hold on tight while the effect continues for a good few minutes, a dull ache the only thing left when it ends. You pat the side of your cheeks to test for what happened. After a few pats, you feel that you now have a long <b>goat muzzle!</b>");
						
						target.faceType = GLOBAL.TYPE_GOAT;
						target.clearFaceFlags();
						target.addFaceFlag(GLOBAL.FLAG_LONG);
						target.addFaceFlag(GLOBAL.FLAG_MUZZLED);
					}
					else
					{
						msg += target.faceTypeLockedMessage();
					}
				}
				// Horns
				else if(select == 8)
				{
					if(!target.hasHorns() || target.hornType != GLOBAL.TYPE_GOAT)
					{
						var newHornCount:Number = (1 + rand(3)) * 2;
						// color: black, 1: ibex, 2: oryx, 3: markhor
						var newHornShape:int = (1 + rand(5));
						var newHornColor:String = (!rareHorns ? "bone" : "black");
						if(target.hornTypeUnlocked(GLOBAL.TYPE_GOAT))
						{
							if(!target.hasHorns())
							{
								msg += ParseText("The upper half of your forehead feels weightier than usual all of a sudden, with a heavy ache appearing behind your temples. Then you feel your skin stretch and slough away as bone from your skull rises and creaks upwards! The bone forms and bends, ridges appearing along its surfaces. The whole process is strangely painless. After a few minutes of growth, you feel the ache stop and you take stock of your <b>" + num2Text(newHornCount) + " new");
								if(rareHorns)
								{
									msg += " " + newHornColor;
									if(newHornShape == 3) msg += " ibex";
									else if(newHornShape == 4) msg += " oryx";
									else if(newHornShape == 5) msg += " markhor";
									else msg += " goat";
								}
								else msg += " goat";
								msg += " horns!</b>";
							}
							else
							{
								msg += ParseText("You feel a resonant heat in your [pc.horns], signifying a change! Without much sensation to go by, you can tell by the weight that’s being shifted that " + (target.horns == 1 ? "it" : "they") + "’ll be quite different. After a few minutes of growth and mass-modulation, you have a feel for your <b>" + num2Text(newHornCount));
								if(rareHorns)
								{
									msg += " " + newHornColor;
									if(newHornShape == 3) msg += " ibex";
									else if(newHornShape == 4) msg += " oryx";
									else if(newHornShape == 5) msg += " markhor";
									else msg += " goat";
								}
								else msg += " new goat";
								msg += " horns!</b>";
							}
							
							target.removeHorns();
							target.hornType = GLOBAL.TYPE_GOAT;
							target.horns = newHornCount;
							target.hornLength = 4;
							
							if(newHornShape != 0)
							{
								// "Horn Style"
								// v1: shape style
								// v2: material type
								// tooltip: custom color
								target.createStatusEffect("Horn Style", 0, 0, 0, 0, true, "", "", false, 0);
								target.setStatusValue("Horn Style", 1, newHornShape);
								target.setStatusValue("Horn Style", 2, 0);
								target.setStatusValue("Horn Style", 3, 0);
								target.setStatusValue("Horn Style", 4, 0);
								target.setStatusTooltip("Horn Style", newHornColor);
							}
						}
						else
						{
							msg += target.hornTypeLockedMessage();
						}
					}
					// Repeat horn growth/PC already has goat horns
					else
					{
						var newHornLength:Number = 4;
						if(target.hornLength >= 4 && target.hornLength < 8) newHornLength = 8;
						else if(target.hornLength < 12) newHornLength = 12;
						if(target.hornLengthUnlocked(newHornLength))
						{
							msg += ParseText("Your goat horns tingle in a familiar way, the sensation of more mass being added throwing you off balance somewhat. After a few minutes, you can tell by tilting your head <b>your horns have definitely grown longer!</b>");
							
							target.hornLength = newHornLength;
						}
						else
						{
							msg += target.hornLengthLockedMessage();
						}
					}
				}
				// Breast growth
				else if(select == 9)
				{
					var addBreastGrowth:Number = 1 + rand(5);
					if(target.breastRatingUnlocked(target.smallestTitRow(), (target.breastRows[target.smallestTitRow()].breastRatingRaw + addBreastGrowth)))
					{
						msg += ParseText("There’s a soothing tingling in your [pc.chest], one akin to a hot drink fueling your system. Your posture leans a little involuntarily, implying that there’s added mass. With a quick fondle, you can tell that your <b>[pc.chestNoun] " + (!target.hasBreasts() ? "has" : "have") + " grown in size!</b>");
						for(var bRow:int = 0; bRow < target.breastRows.length; bRow++)
						{
							if(target.breastRows[bRow].breastRatingRaw < 18)
							{
								target.breastRows[bRow].breastRatingRaw += addBreastGrowth;
								//if(target.breastRows[bRow].breastRatingRaw > 18) target.breastRows[bRow].breastRatingRaw = 18;
							}
						}
					}
					else
					{
						msg += target.breastRatingLockedMessage();
					}
				}
				// Testicle growth
				else if(select == 10)
				{
					var addBallGrowth:Number = 1 + rand(3);
					if(target.ballSizeUnlocked(target.ballSizeRaw + addBallGrowth))
					{
						msg += ParseText("Inside your [pc.balls], a hot swelling of pure mass seems to fill out your [pc.sack]. It soothes your sensitive [pc.balls] as " + (target.balls == 1 ? "it expands" : "they expand") + ", the added weight making itself comfortable with your physiology. Your <b>[pc.balls] " + (target.balls == 1 ? "has" : "have") + " grown!</b> Time to put " + (target.balls == 1 ? "it" : "them") + " to use...");
						
						target.ballSizeRaw += addBallGrowth;
						if(target.hasPerk("Bulgy")) target.ballSizeRaw += 2;
					}
					else
					{
						msg += target.ballSizeLockedMessage();
					}
				}
				// Penis growth
				else if(select == 11)
				{
					cIdx = shortCocks[rand(shortCocks.length)];
					var addCockLength:Number = 1 + rand(3);
					if(target.cockLengthUnlocked(cIdx, (target.cocks[cIdx].cLengthRaw + addCockLength)))
					{
						msg += ParseText("Your [pc.cock " + cIdx + "] gains that familiar hardness, instantly erect. You do your best to make sure it hangs free as it gains hair-trigger sensitivity! A warm, throbbing heat pleasurably shifts from your [pc.base " + cIdx + "] to your [pc.cockHead " + cIdx + "]. It’s a quick movement, by the end of which you can tell that your <b>[pc.cockNoun " + cIdx + "] has grown longer!</b>");
						
						target.cocks[cIdx].cLengthRaw += addCockLength;
						if(target.hasPerk("Hung")) target.cocks[cIdx].cLengthRaw += 2;
					}
					else
					{
						msg += target.cockLengthLockedMessage();
					}
				}
				// Penis change
				else if(select == 12)
				{
					cIdx = nonGoatCocks[rand(nonGoatCocks.length)];
					if(target.cockTypeUnlocked(cIdx, GLOBAL.TYPE_GOAT))
					{
						msg += ParseText("Your [pc.cock " + cIdx + "] itches and twitches all of a sudden, its physical shape undergoing a change! You clutch at your pelvis in response, the irritation becoming difficult to bear.");
						if(target.isCrotchExposed()) msg += ParseText(" You have a glance down at the morphing appendage, seeing that it’s settled on the shape of a <b>sheathed, slender goat penis!</b>");
						else msg += ParseText(" You undo your [pc.gear] to see what the effect is, spying your morphing appendage turn into a <b>sheathed, slender goat penis!</b>");
						
						target.shiftCock(cIdx, GLOBAL.TYPE_GOAT);
					}
					else
					{
						msg += target.cockTypeLockedMessage();
					}
				}
				// Ears
				else if(select == 13)
				{
					if(target.earTypeUnlocked(GLOBAL.TYPE_GOAT))
					{
						msg += ParseText("You can feel your [pc.ears] twitch and flick about on their own accord. A numbness takes them over, followed by that distinctly uncomfortable sensation of pins and needles. As they keep flicking about, you can feel their weight changing ever so slightly. When the feeling subsides, you cup your new set of <b>goat ears!</b>");
						
						target.earType = GLOBAL.TYPE_GOAT;
						target.clearEarFlags();
						target.addEarFlag(GLOBAL.FLAG_FURRED);
						target.earLength = 4;
					}
					else
					{
						msg += target.earTypeLockedMessage();
					}
				}
				// Fur Color
				else if(select == 14)
				{
					if(target.furColorUnlocked("jade green"))
					{
						msg += ParseText("Your [pc.skinFurScales] extends out from your body as the pigment across each strand begin to shift and change. After your fur settles, you have a good look and feel, finding that you now have <b>jade green goat fur!</b> Warm and thick, just like a goat but the unusual shade is <i>un</i>like anything you could’ve guessed...");
						
						target.furColor = "jade green";
					}
					else
					{
						msg += target.furColorLockedMessage();
					}
				}
				// Primorditatts
				else if(select == 15)
				{
					msg += ParseText("Your [pc.skinNoun] feels a little itchy, but it quickly passes. You yawn and have sudden thoughts about taking a nap and drifting to <b>sleep</b>... <b>Hm, what was that all about?</b>");
					
					target.createStatusEffect("Primorditatts Queued", 0, 0, 0, 0, true, "", "", false, 0);
				}
			}
			if (msg.length > 0) ExtendLogEvent(msg);
			return;
		}
	}
}
