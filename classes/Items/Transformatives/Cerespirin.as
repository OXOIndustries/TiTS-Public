package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.GLOBAL;
	import classes.StorageClass;
	import classes.kGAMECLASS;
	import classes.ItemSlotClass;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Utility.rand;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	import classes.Engine.Map.InShipInterior;
	
	public class Cerespirin extends ItemSlotClass
	{
		//constructor
		public function Cerespirin()
		{
			_latestVersion = 1;
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			
			shortName = "Cerespirin";
			longName = "Cerespirin syringe";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a syringe labeled “Cerespirin”";
			tooltip = "No frills or fluff couching this “independently” manufactured TF; it’s a plain syringe filled with a green fluid with a printed label baldly stating CERESPIRIN pasted on it. Someone has handwritten “Cures headaches” underneath the typed font. This stuff will induce plant transformations in you, but such a sketchy drug may well have side effects...";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 5000;
			
			targetsSelf = true;
			
			version = _latestVersion;
		}
		
		// Physical Changes
		public static function plantMutations(target:Creature, numProcs:int, deltaT:uint, effect:StorageClass):void
		{
			var msg:String = "";
			var totalTFs:Number = effect.value2;
			if (totalTFs == 0) totalTFs = 1;
			if (numProcs > 0) totalTFs *= numProcs;
			
			//Used to hold the TF we pull out of the array of effects
			var select:int = 0;
			var x:int = 0;
			//Build a list of all potential TFs
			var TFList:Array = new Array();
			
			var plantSkinColor:Array = ["leaf green", "lime green", "turquoise", "hazel", "mahogany", "fir green", "dark green"];
			var plantBarkColor:Array = ["grayish brown", "chestnut", "umber"];
			var plantHairColor:Array = ["green", "green", "verdant", "forest green", "jungle green", "yellow-green", "dark green"];
			var plantEyeColor:Array = ["leaf green", "lime green", "turquoise", "hazel", "mahogany", "fir green"];
			var flowerColors:Array = ["red", "yellow", "blue", "purple", "pink", "white"];
			var hasPlantSkin:Boolean = InCollection(target.skinType, [GLOBAL.SKIN_TYPE_PLANT, GLOBAL.SKIN_TYPE_BARK]);
			var hasPlantHair:Boolean = InCollection(target.hairType, [GLOBAL.HAIR_TYPE_PLANT, GLOBAL.HAIR_TYPE_TENTACLES]);
			var removePants:Boolean = false;
			
			//#1 Plant Skin: Non plant skin.
			if(target.skinType != GLOBAL.SKIN_TYPE_PLANT && target.skinType != GLOBAL.SKIN_TYPE_BARK)
				TFList[TFList.length] = 1;
			//#2 Leaf Hair: Not leaf hair, not tentacle hair.
			//#3 Tentacle Hair: Not leaf hair, not tentacle hair.
			if(!hasPlantHair)
			{
				TFList[TFList.length] = 2;
				TFList[TFList.length] = 3;
			}
			//#4 Moss Beard: Masculine, already has beard.
			if(target.beardType != GLOBAL.HAIR_TYPE_PLANT && target.mfn("m", "f", "n") == "m" && target.hasBeard())
				TFList[TFList.length] = 4;
			//#5 Eye color change: Not any of the following pigments: leaf green, lime green, turquoise, hazel, mahogany, fir green.
			if(InCollection(target.eyeColor, ["citrine", "topaz", "amber", "peridot", "emerald", "jade", "aquamarine"]) && rand(10) != 0)
				{ /* Rare change for special color eyes. */ }
			else if(!InCollection(target.eyeColor, plantEyeColor))
				TFList[TFList.length] = 5;
			//#6 Branch Crown: Plant hair, no hair flowers. 3/4 vs. hair flowers if masculine.
			if((target.hornType != GLOBAL.TYPE_DRYAD || target.hornLength < 36) && hasPlantHair && (!target.hasStatusEffect("Hair Flower") || (target.mfn("m", "f", "n") == "m" && rand(4) != 0)))
				TFList[TFList.length] = 6;
			//#7 Hair Flower: Plant hair, no branch crown. 3/4 vs. branch crown if andro/feminine.
			if(!target.hasStatusEffect("Hair Flower") && hasPlantHair && (target.hornType != GLOBAL.TYPE_DRYAD || (target.mfn("m", "f", "n") != "m" && rand(4) != 0)))
				TFList[TFList.length] = 7;
			//#8 Ivy arms: Plant skin, plant hair.
			if(target.armType != GLOBAL.TYPE_FLOWER && hasPlantSkin && hasPlantHair)
				TFList[TFList.length] = 8;
			//#9 OH GOD I LOVE BEING A PLANT Pt. 1: Plant skin, on a planet.
			if(target.skinType == GLOBAL.SKIN_TYPE_PLANT && !InShipInterior() && kGAMECLASS.rooms[kGAMECLASS.currentLocation].planet.indexOf("PLANET:") != -1)
				TFList[TFList.length] = 9;
			//#10 OH GOD I LOVE BEING A PLANT Pt. 2: Plant skin, plant hair, type of plant cum type.
			if(target.skinType == GLOBAL.SKIN_TYPE_PLANT && hasPlantHair && !InShipInterior() && kGAMECLASS.rooms[kGAMECLASS.currentLocation].planet.indexOf("PLANET:") != -1)
				TFList[TFList.length] = 10;
			//#11 Orchid Pussy: Non-orchid pussy, plant skin.
			if(target.totalVaginas(GLOBAL.TYPE_FLOWER) < target.totalVaginas() && target.hasVagina() && hasPlantSkin)
				TFList[TFList.length] = 11;
			//#12 Tentacle cocks: Plant skin, penis. Could do with being a slightly rarer TF than avg. 3-6 seems about right. Note: If allowed to count as regular penises, maximum allowed should be factored in.
			if(target.wingType != GLOBAL.TYPE_COCKVINE && target.hasCock() && hasPlantSkin && rand(3) == 0)
				TFList[TFList.length] = 12;
			//#13 Fruit cum: Plant skin, plant hair, penis.
			if(target.cumType != GLOBAL.FLUID_TYPE_FRUIT_CUM && target.hasCock() && hasPlantSkin && hasPlantHair)
				TFList[TFList.length] = 13;
			//#14 Fruit femcum: Plant skin, plant hair, vagina.
			if(target.girlCumType != GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM && target.hasVagina() && hasPlantSkin && hasPlantHair)
				TFList[TFList.length] = 14;
			//#15 Bark Skin: Plant skin, masculine, any two of the following three = true: branch crown, moss beard, fruit cum.
			var barkScore:int = 0;
			if(target.hornType == GLOBAL.TYPE_DRYAD) barkScore++;
			if(target.beardType == GLOBAL.HAIR_TYPE_PLANT) barkScore++;
			if(target.cumType == GLOBAL.FLUID_TYPE_FRUIT_CUM) barkScore++;
			if(target.skinType != GLOBAL.SKIN_TYPE_BARK && target.skinType == GLOBAL.SKIN_TYPE_PLANT && target.mfn("m", "f", "n") == "m" && barkScore >= 2)
				TFList[TFList.length] = 15;
			//#16 Perk: Resin. Requires bark skin.
			if(!target.hasPerk("Resin") && target.skinType == GLOBAL.SKIN_TYPE_BARK)
				TFList[TFList.length] = 16;
			//#17 Perk: Flower Power. Requires: Plant skin, plant hair, feminine, at least two of the following three = true: hair orchid, ivy arms, orchid pussy.
			var flowerScore:int = 0;
			if(target.hasStatusEffect("Hair Flower")) flowerScore++;
			if(target.hasStatusEffect("Arm Flower")) flowerScore++;
			if(target.hasVaginaType(GLOBAL.TYPE_FLOWER)) flowerScore++;
			if(target.tailGenitalArg == GLOBAL.TYPE_FLOWER && target.tailType != GLOBAL.TYPE_HUMAN && target.tailCount > 0) flowerScore++;
			if(!target.hasPerk("Flower Power") && target.skinType == GLOBAL.SKIN_TYPE_PLANT && hasPlantHair && target.mfn("m", "f", "n") == "f" && flowerScore >= 2)
				TFList[TFList.length] = 17;
			//#18 Flower tailcunt: Has tail-cunt, overdose.
			if (target.hasTailCunt() && target.tailGenitalArg != GLOBAL.TYPE_FLOWER && effect.value3 >= 1)
				TFList[TFList.length] = 18;
			//#19 Change Regal Mane type, overdose.
			if (target.hasPerk("Regal Mane") && !InCollection(target.perkv1("Regal Mane"), [GLOBAL.FLAG_TENDRIL, GLOBAL.FLAG_FLOWER_SHAPED]) && effect.value3 >= 1)
				TFList[TFList.length] = 19;
			
			//Loop through doing TFs until we run out, pulling out whichever we use.
			while(TFList.length > 0 && totalTFs > 0)
			{	
				msg += "\n\n";
				//Pick a TF	
				x = rand(TFList.length);
				select = TFList[x];
				//Cull 'dat TF from the list.
				TFList.splice(x,1);
				//#0 Catch all
				if(select == 0)
				{
					msg += "\n\nYou feel the transformative drug flow through your system, though nothing noteworthy happens.";
				}
				//#1 Plant Skin: Non plant skin.
				else if(select == 1)
				{
					
					if(target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_PLANT) || effect.value3 >= 3)
					{
						var newSkinTone:String = RandomInCollection(plantSkinColor);
						if(InCollection(target.skinTone, ["green", "verdant", "viridescent", "emerald", "olive"]) && rand(4) != 0) newSkinTone = target.skinTone;
						
						msg += ParseText("\n\nThe cool, tingling sensation on your [pc.skin] has grown as time has gone on, making you feel like your whole body is bathed in toothpaste. It’s difficult to worry about it; the more the sensation ebbs, the more peaceful you feel and the clearer your perception seems. When you look down with a lazy, happy smile, it’s not really a surprise to see [pc.skinFurScalesNounSimple] falling off your arms, replaced by a smooth, hairless " + newSkinTone + " complexion across your entire body. Nor does it bother you, because more than anything it feels like a lot of frustrations and distractions are drifting away from you, replaced by an all-encompassing sensual clarity.");
						
						target.skinType = GLOBAL.SKIN_TYPE_PLANT;
						target.skinTone = newSkinTone;
						target.clearSkinFlags();
						target.addSkinFlag(GLOBAL.FLAG_SMOOTH);
					}
					else
					{
						msg += target.skinTypeLockedMessage();
					}
				}
				//#2 Leaf Hair: Not leaf hair, not tentacle hair.
				else if(select == 2)
				{
					if(target.hairTypeUnlocked(GLOBAL.HAIR_TYPE_PLANT) || effect.value3 >= 3)
					{
						if(target.hasHair()) msg += ParseText("\n\nYour [pc.hair] is falling out. Big, sad clumps of it, tumbling slowly to the ground. You stop and run a hand over your head, look in dozy confusion at the handful of [pc.hair] you painlessly come away with. Oh well.");
						
						target.hairType = GLOBAL.HAIR_TYPE_PLANT;
						if(target.hairLength < 6) target.hairLength = 6 + rand(3);
						//target.hairColor = RandomInCollection(plantHairColor);
						target.hairColor = ((target.hasBeard() && InCollection(target.beardColor, plantHairColor)) ? target.beardColor : RandomInCollection(plantHairColor));
						
						msg += ParseText("\n\nThe cool, tingling sensation intensifies on your bald scalp, a thousand mint pencils scribbling on your head. It’s a relief when dozens of new growths sprout into being, thin stems burgeoning satisfyingly outwards, then unfurling spearhead-shaped pads as they come. The [pc.hairColor] leaves you grow out over the course of the next half hour are thin, healthy, and - ouch. Yes, definitely connected to you. You run your hands through your bonnet of plant growth, sighing at the pleasure of being able to feel each individual leaf.");
					}
					else
					{
						msg += target.hairTypeLockedMessage();
					}
				}
				//#3 Tentacle Hair: Not leaf hair, not tentacle hair.
				else if(select == 3)
				{
					if(target.hairTypeUnlocked(GLOBAL.HAIR_TYPE_TENTACLES) || effect.value3 >= 3)
					{
						if(target.hasHair()) msg += ParseText("\n\nYour [pc.hair] is falling out. Big, sad clumps of it, tumbling slowly to the ground. You stop and run a hand over your head, look in dozy confusion at the handful of [pc.hair] you painlessly come away with. Oh well.\n\n");
						
						target.hairType = GLOBAL.HAIR_TYPE_TENTACLES;
						if(target.hairLength < 6) target.hairLength = 6 + rand(3);
						//target.hairColor = RandomInCollection(plantHairColor);
						target.hairColor = ((target.hasBeard() && InCollection(target.beardColor, plantHairColor)) ? target.beardColor : RandomInCollection(plantHairColor));
						
						msg += ParseText("\n\nThe cool, tingling sensation intensifies on your bald scalp, a thousand mint pencils scribbling on your head. It’s initially a relief when the infuriation is broken by dozens of new growths sprouting into being; that turns to mild alarm when the growths unravel downwards at a furious rate, heavy, vaguely rubbery appendages that dangle loosely downwards from your head. Within half an hour you have a full head of [pc.hairColor] tentacle hair, thick plant vines that bounce and sway as you move.");
						msg += "\n\nYou find, once you work out the scalp-flexing tweaks you use to fire your strange new nerve groups, you can actually move them around a bit, and - ooh. Yes, they are quite sensitive. You return to business, unsure whether to be delighted or askance at this new reality flopping around your ears and neck.";
					}
					else
					{
						msg += target.hairTypeLockedMessage();
					}
				}
				//#4 Moss Beard: Masculine, already has beard.
				else if(select == 4)
				{
					if(target.beardTypeUnlocked(GLOBAL.HAIR_TYPE_PLANT))
					{
						msg += ParseText("\n\nYour [pc.beard] is falling out. First follicles, then whole tufts, until you’re left with a bare chin. The minty, clear sensation thrumming your veins is centering itself around your jaw and mouth. You murmur as new growth sprouts in a dozen places there, melding together to form a rugged whole. It feels a bit like beard hair, but it’s softer, clumpier and... green? The requisite check with the mirror confirms you now own a rugged, slightly alarming hanging beard of moss.");
						
						target.beardType = GLOBAL.HAIR_TYPE_PLANT;
						target.beardColor = (InCollection(target.hairColor, plantHairColor) ? target.hairColor : RandomInCollection(plantHairColor));
						if(target.beardLength < 6) target.beardLength = 6;
						target.beardStyle = 0;
					}
					else
					{
						msg += target.beardTypeLockedMessage();
					}
				}
				//#5 Eye color change: Not any of the following pigments: leaf green, lime green, turquoise, hazel, mahogany, fir green.
				else if(select == 5)
				{
					var newEyeColor:String = RandomInCollection(plantEyeColor);
					if(target.eyeColorUnlocked(newEyeColor))
					{
						msg += "\n\nYou blink slowly. It’s difficult to tell if the feeling of increased clarity you’re experiencing is all in your head, or... you get your codex out and activate its mirror function. The color of your eyes has changed - the irises are now " + newEyeColor + ".";
						msg += "\n\nWell, possibly it is all mental. What’s in a change of color, after all? Aside from how <i>good</i> natural light looks now, making you instinctively want to move towards it. And you always felt that way about sun. Probably.";
						
						target.eyeColor = newEyeColor;
					}
					else
					{
						msg += target.eyeColorLockedMessage();
					}
				}
				//#6 Branch Crown: Plant hair, no hair flowers. 3/4 vs. hair flowers if masculine.
				else if(select == 6)
				{
					if(target.hornType != GLOBAL.TYPE_DRYAD)
					{
						// Grow Crown
						if(target.hornTypeUnlocked(GLOBAL.TYPE_DRYAD))
						{
							if(target.hasHorns())
							{
								msg += ParseText("\n\nYour " + (target.horns == 1 ? "[pc.hornNoun] feels" : "[pc.hornsNoun] feel") + " a bit odd - sick, even. You give " + (target.horns == 1 ? "it" : "them") + " a fondle, and are shocked when " + (target.horns == 1 ? "it comes" : "they come") + " off in your hand, as if " + (target.horns == 1 ? "it was" : "they were") + " made of rotten wood. Out with the old, and...");
								msg += "\n\n";
								target.removeHorns();
							}
							msg += ParseText("\n\nYou grunt as two new something-or-others sprout into existence above your brow; harder and more definitive than your [pc.hair]. Horns? You touch the thin spikes pushing their way out of your [pc.skin] prospectively. It isn’t keratin, exactly... more bark-like.");
							msg += "\n\nThe gray-brown growths stop when they get to about six inches in length, thicker where they emerge from your brow and branching out into several smaller ends. They do that because they are what they are: branches, hardy, austere tree antlers, growing out from your head. You stroke them thoughtfully before continuing with what you were doing.";
							
							target.hornType = GLOBAL.TYPE_DRYAD;
							target.horns = 6 + (rand(7) * 2);
							target.hornLength = 6;
						}
						else
						{
							msg += target.hornTypeLockedMessage();
						}
					}
					else
					{
						if(target.horns < 6) target.horns = 6 + (rand(7) * 2);
						
						// Mo Branch crown
						// Requirements: Small branch crown
						if(target.hornLength < 12)
						{
							msg += "\n\nYou close your eyes and sigh as your branch antlers increase in size, more hard tree crackling out from your brow. Good void, why does that feel so good? Maybe because it LOOKS so good, at least to you, floating in the contentment of Cerespirin. You now have at least a foot or two of branches above your head, splintering out into a fine, wintery crown. You can feel them wave slightly when you turn.";
							
							target.horns += 4 + (rand(5) * 2);
							target.hornLength = 12 + rand(13);
						}
						// MO Branch crown
						// Requirements: Medium branch crown
						else if(target.hornLength < 36)
						{
							msg += ParseText("\n\nYou groan blissfully as yet more hard ash cracks and soughs its way into existence past the [pc.skin] at the top of your brow; wild and decadent growth. Your branch crown is huge now, an imposing and genuine tree all of its own, flourishing out from the top of your head. It’s heavy and makes doorways difficult, but you don’t care; you look like a forest god. You FEEL like a forest god, and if the price of that is birds nesting in you then so be it.");
							
							target.horns += 4 + (rand(5) * 2);
							target.hornLength += 24 + rand(13);
						}
					}
				}
				//#7 Hair Flower: Plant hair, no branch crown. 3/4 vs. branch crown if andro/feminine.
				else if(select == 7)
				{
					// Choose Flower Color
					var flowerColor:String = RandomInCollection(flowerColors);
					
					msg += ParseText("\n\nA spot on the side of your head has been getting steadily sorer. It feels like a big pimple; not exactly the sexiest of developments. You’re beginning to think about finding somewhere quiet to take a look at it when it suddenly and rather shockingly bursts, allowing something hand-sized to bloom out from your [pc.hair]. And, once you’ve cautiously examined it with the help of your codex, “bloom” is exactly the right word to use. A huge orchid is now flourishing its floppy " + flowerColor + " petals and stamen above your head!");
					msg += ParseText("\n\nCertainly it looks better than a pimple; from a distance it will appear as if you’ve stuck a big flower behind your [pc.ear]. However, it... you inhale when your fingers trace its velvety, tube-like innards. It’s definitely connected to you, and slightly sensitive. It firmly reminds you of what a flower <i>is</i> in fact, at least where winged insects are concerned. You bite your lip at the thought.");
						
					target.createStatusEffect("Hair Flower", 1, 0, 0, 0, true, "", flowerColor, false);
				}
				//#8 Ivy arms: Plant skin, plant hair.
				else if(select == 8)
				{
					if(target.armTypeUnlocked(GLOBAL.TYPE_FLOWER))
					{
						msg += ParseText("\n\nSomething new is tickling and crawling its way into being, this time on your shoulders, working its way down your [pc.arms]. It’s easy enough to stop and check what it is; thin, delicate creepers, subtle dark green leaves unfolding from them as they curl snugly around your biceps and deltoids. You smile peacefully at this development, ivy festooning your arms - another layer of wonderful, sensuous life added to your being.");
						
						target.armType = GLOBAL.TYPE_FLOWER;
						target.clearArmFlags();
					}
					else
					{
						msg += target.armTypeLockedMessage();
					}
				}
				//#9 OH GOD I LOVE BEING A PLANT Pt. 1: Plant skin, on a planet.
				else if(select == 9)
				{
					msg += ParseText("\n\nThe peace and clarity thing is really very nice. You doubt it even has anything to do with the mod you took, because it all feels so <i>obvious</i> now, central to your being. Your [pc.skin] drinks in the moisture and light of the world around you and you feel so <i>connected</i> to it, the throb of life in all things, and... why are you traveling so fast? There’s no rush. You sit down and beam happily, sit and simply drink in the feeling of life around you... the energy that radiates from all living creatures and radiates from you, combining and twining together in loving symphony...");
					
					// Time + 1 Hour, Slow Reflexes reduction by 2, Slow Physique gain by 2
					//kGAMECLASS.processTime(55 + rand(11));
					target.reflexes(-1);
					target.slowStatGain("physique", 2);
				}
				//#10 OH GOD I LOVE BEING A PLANT Pt. 2: Plant skin, plant hair, type of plant cum type.
				else if(select == 10)
				{
					msg += ParseText("\n\nLife feels like it’s going slower for you, and that’s fine... perfect even. It gives you more time to wonder at the magic of everything. Even your own breathing. You stand still and luxuriate in just that. In... out. In... out. Your [pc.skin] and [pc.hair] breathe as well of course, the same delicious drawing in of energy, and the exhale of pure air that other beings can absorb. It makes you feel intertwined with all other living creatures, and so open, so willing to share yourself with other beautiful creatures in every way. Green fantasies flare inside your mind");
					if(target.hasGenitals()) msg += ":";
					if(target.hasVagina()) msg += " of busy, lithe insect beings crawling all over you, energetically using every florid, dripping hole you own";
					if(target.isHerm()) msg += ",";
					if(target.hasCock()) msg += " of teasing, gleeful nymphs of rainbow hues that you hold close and sink your oak-hard stamen into again and again in a never-ending orgy";
					msg += "...";
					msg += ParseText("\n\nAll good things come to those who wait, you think to yourself after a long, long period of just meditating and enjoying those sun-bronzed thoughts.");
					
					// Time + 2 Hours, Slow Reflexes reduction by 3, Slow Physique gain by 3, ++Lust
					//kGAMECLASS.processTime(115 + rand(11));
					target.reflexes(-1);
					target.slowStatGain("physique", 2);
					target.lust(15 + rand(6));
				}
				//#11 Orchid Pussy: Non-orchid pussy, plant skin.
				else if(select == 11)
				{
					var cuntList:Array = [];
					var selCunt:int = 0;
					
					for(var v:int = 0; v < target.vaginas.length; v++)
					{
						if(target.vaginas[v].type != GLOBAL.TYPE_FLOWER) cuntList.push(v);
					}
					if(cuntList.length > 0) selCunt = cuntList[rand(cuntList.length)];
					
					if(target.vaginaTypeUnlocked(selCunt, GLOBAL.TYPE_FLOWER))
					{
						msg += ParseText("\n\nYour downstairs is changing. For a while you’ve been telling yourself the feeling of the crisp, calming energy in your veins funneling itself towards your [pc.groin] to be nothing important. However, at the point where the outer lips of your [pc.vagina " + selCunt + "] begin to thin and elongate is the point where that obviously stops being the case.");
						msg += "\n\nYou try and find a quiet spot";
						if(!removePants && !target.isCrotchExposed())
						{
							msg += ParseText(", take off your [pc.lowerGarments],");
							removePants = true;
						}
						
						target.shiftVagina(selCunt, GLOBAL.TYPE_FLOWER);
						// ++ Lust
						target.lust(15 + rand(6));
						
						msg += ParseText(" discretely open your bare [pc.hips] and watch your pussy transform in a way which manages to be both beautiful and deeply alarming. Out stretch the lips of your labia, thinning down, splitting out into half a dozen different fronds and turning into dull points as they grow; bright [pc.vaginaColor " + selCunt + "] spreads downwards from their tips. The inner lips flare slightly, taking on a paler shade of [pc.vaginaColor " + selCunt + "] and leaving the wet hole of your vagina entirely exposed. [pc.EachClit] turn" + (target.vaginas[selCunt].clits == 1 ? "s" : "") + " black, " + (target.vaginas[selCunt].clits == 1 ? "a cute and obvious freckle" : "cute and obvious freckles") + " in the spectacular, gaping orchid that is now your cunt.");
						msg += ParseText("\n\nIn the peaceful, woozy blue sky of Cerespirin it’s difficult to be shocked about such a development, particularly when it’s so pretty, but... it’s not going to be that open at all times, is it? A bit of experimentation reveals that, if you close your thighs and take your mind off it, your flower pussy does close itself up a bit. The moment your fingers return to it, though... or if your mind is allowed to drift towards thoughts of gleaming, thick insect dick, coated in oily pollen... it flourishes itself eagerly, [pc.femcum] dewing its petals.");
					}
					else
					{
						msg += target.vaginaTypeLockedMessage();
					}
				}
				//#12 Tentacle cocks: Plant skin, penis. Could do with being a slightly rarer TF than avg. 3-6 seems about right. Note: If allowed to count as regular penises, maximum allowed should be factored in.
				else if(select == 12)
				{
					if(target.wingTypeUnlocked(GLOBAL.TYPE_COCKVINE))
					{
						var cocks:int = 3 + rand(10);
						if(cocks > 12) cocks = 12;
						
						if(target.wingType != 0) msg += ParseText("\n\nYour [pc.wings] " + (target.wingCount == 1 ? "is" : "are") + " drooping, losing sensation and unable to maintain " + (target.wingCount == 1 ? "its" : "their") + " shape. It’s no surprise when " + (target.wingCount == 1 ? "it sloughs" : "they slough") + " off.");
						msg += ParseText("\n\nPressure is building in multiple spots on your upper back. It’s unlike the cool, calming energy which has informed the transformations Cerespirin has induced so far; it feels more like several over-eager erections trapped in incredibly tight undies. You can’t help but groan with relief when finally the pressure peaks and " + num2Text(cocks) + " thick protrusions burst impatiently out of your [pc.skin]. The hot, thick, vine-like growths thrust their way into being, feet of oily green tentacles, alarmingly energetic and prehensile, thrashing around your [pc.hips].");
						msg += "\n\nYour mind is a mire of pleasure and shock, and it takes you a little while to work out how to flex your nervous system in order to rear one of these growths around into your hand to take a closer look at it. It feels unmistakably dick-like - bulging, tender flesh under the fibrous skin, urging you to plunge it into the nearest wet and willing hole at the earliest opportunity - but it’s much more flexible, able to bend all along its length and dart its wet, distended head in any direction you wish.";
						
						// If can use as cock:
						if(9999 == 0) msg += " With a bit of effort, you find you can thread it through between your thighs, where it could act like any penis if you wished.";
						
						msg += ParseText("\n\nThe thing is... oof. " + StringUtil.capitalize(num2Text(cocks)) + " more cocks, clamoring to be used, each separately nagging at the lustful impulses of your mind. A fantasy spreads itself over your mind’s eye, of surrounding a laughing, squealing forest sprite in your tentacle cocks, plunging them deep into every single one of her wet, supple holes... your new penises thrash about with hot enthusiasm, [pc.cum] leaking from their tips, minds all of their own.");
						msg += "\n\nIt takes a short while to calm down, to summon back the clear peace of Cerespirin, and encourage your new menagerie of tentacles to loll down and retract back into your back. " + StringUtil.capitalize(num2Text(cocks)) + " bulbs underneath your shoulder blades, awaiting their moment.";
						
						target.shiftWings(GLOBAL.TYPE_COCKVINE, cocks);
						// ++Lust, Libido increase of 5
						target.lust(100);
						target.libido(5);
					}
					else
					{
						msg += target.wingTypeLockedMessage();
					}
				}
				//#13 Fruit cum: Plant skin, plant hair, penis.
				else if(select == 13)
				{
					if(target.cumTypeUnlocked(GLOBAL.FLUID_TYPE_FRUIT_CUM))
					{
						msg += ParseText("\n\n[pc.EachCock] feel" + (target.cockTotal() == 1 ? "" : "s") + " increasingly juicy, swollen with over-stuffed arousal. The profound peace of mind you’re currently experiencing makes it difficult to care about this, but still - some slightly more sapient part of you takes precedence and demands you find a quiet spot and find out what Cerespirin is doing to you this time.");
						msg += ParseText("\n\nBy the time you do that, warm fluid is beading freely from [pc.eachCockHead]");
						if(!removePants && !target.isCrotchExposed())
						{
							msg += ParseText(" onto your [pc.lowerGarment]. When you gingerly take that off, you are momentarily blown back by the smell - a sweet, rich funk that makes you think of sticky, brightly-colored juices and overripe fruit.");
							removePants = true;
						}
						else msg += ". When you gingerly dab a finger against " + (target.cockTotal() == 1 ? "it" : "one") + " and bring it to your nose you are made to blink a few times. The smell is a sweet, rich funk that makes you think of sticky, brightly-colored juices and overripe fruit.";
						msg += "\n\nThe consistency of it is slightly thinner than regular semen, and it is a pale, creamy yellow color. Clearly not normal";
						if(removePants)
						{
							msg += " you think to yourself as you put your undergarment back on";
							removePants = false;
						}
						msg += ", however there are things worse in the world than having " + RandomInCollection(["fizzy citrus", "juicy pear", "sweet apple"]) + " flavored cum.";
						
						target.cumType = GLOBAL.FLUID_TYPE_FRUIT_CUM;
						// +Lust
						target.lust(15);
					}
					else
					{
						msg += target.cumTypeLockedMessage();
					}
				}
				//#14 Fruit femcum: Plant skin, plant hair, vagina.
				else if(select == 14)
				{
					if(target.girlCumTypeUnlocked(GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM))
					{
						msg += ParseText("\n\nYou feel flushed and worked up, unusual in your experience of Ceresperin. Despite your best efforts, [pc.eachVagina] won’t let you forget about " + (target.totalVaginas() == 1 ? "its" : "their") + " presence, first beading and then soaking your " + ((!removePants && target.isCrotchExposed()) ? "[pc.thigh]" : "[pc.lowerGarment]") + " in unrequited arousal");
						if(target.hasVaginaType(GLOBAL.TYPE_FLOWER)) msg += ", petals fully opened";
						msg += ". You decide to find a quiet spot to find what is going on.";
						msg += "\n\n";
						if(!removePants && !target.isCrotchExposed()) msg += ParseText("You are slightly blown back when you gingerly pull down your undergarment - the smell! It’s a sweet, rich funk that puts you in mind of sticky juices and overripe fruit. A dab of your fingers against " + (target.totalVaginas() == 1 ? "your" : "a") + " wet pussy brought to your lips confirm what your nose is telling you - your natural lubrication is now a " + RandomInCollection(["fizzy citrus", "juicy pear", "sweet apple"]) + " flavor.");
						else msg += ParseText("You have noticed a slightly sweet, flavorful smell emanating from somewhere and are slightly shocked to discover it’s you - or at least, [pc.eachVagina]. A dab of your fingers against " + (target.totalVaginas() == 1 ? "your" : "a") + " wet pussy brought to your lips confirm what your nose is telling you - your natural lubrication is now a " + RandomInCollection(["fizzy citrus", "juicy pear", "sweet apple"]) + " flavor.");
						
						target.girlCumType = GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM;
						// +Lust
						target.lust(15);
					}
					else
					{
						msg += target.girlCumTypeLockedMessage();
					}
				}
				//#15 Bark Skin: Plant skin, masculine, any two of the following three = true: branch crown, moss beard, fruit cum.
				else if(select == 15)
				{
					if(target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_BARK) || effect.value3 >= 5)
					{
						var newBarkColor:String = RandomInCollection(plantBarkColor);
						
						msg += ParseText("\n\nSomething new is happening to your skin; it’s becoming rougher, number. Odd, hard ridges are raising up on the surface, and you’re starting to make odd, cracking, groaning noises as you move around. Which is slower than you once did. There’s no rush. Your new flesh tells you that. It’s a shame in some ways, losing some of that wonderful sensual clearness the smooth leaf skin gave you, on the other hand... ponderously, you raise an arm and admire the handsome " + newBarkColor + " bark that now covers your arms, your back, and the outside of your [pc.legOrLegs]. You’re beginning to think if you keep taking Cerespirin, you’ll have all the time in the world to properly enjoy the wonders of life.");
						
						target.skinType = GLOBAL.SKIN_TYPE_BARK;
						target.scaleColor = newBarkColor;
						target.clearSkinFlags();
						target.addSkinFlag(GLOBAL.FLAG_THICK);
						// Decrease Reflexes by 5, Increase Physique by 5
						target.reflexes(-5);
						target.physique(5);
					}
					else
					{
						msg += target.skinTypeLockedMessage();
					}
				}
				//#16 Perk: Resin. Requires bark skin.
				else if(select == 16)
				{
					msg += "\n\nYou groan like a rowan in a gale as your bark skin thickens, yet more dense wood layering onto your form. It’s not a troubled groan; it’s one of sensuousness, at how <i>right</i> it feels to have this tough warmth armoring over you. You close your eyes momentarily and let the feeling of how a tree feels flow through you; huge, insurmountable, coursing with light, reaching your bows upwards to gorge in life and in turn let it settle upon you... you open them dreamily, frowning slightly. Has the light shifted? Exactly how much time just passed? Well... it doesn’t matter. There’s time enough for everything. The certainty of that knowledge is at the core of your being now.";
					msg += "\n\nSomething else is different. Your skin is... leaking, for want of a better word. Curiously you run your finger over one of the sticky drops and examine it (this process takes you fifteen seconds, not that you notice or care). Golden, oozing and glutinous, it absolutely reeks of pine, warmth and male sex. You nod happily at this development. Undoubtedly the resin you are now producing will further your goal of attracting the vigorous, pleasure-loving wildlife you now very much want to spread your all-encompassing love into.";
					msg += "\n\n(<b>Perk Gained: Resin</b> - Your heavy bark skin slows you all the way down, but provides plenty of protection. It also produces resin. Some flighty, energetic, needy species might find it difficult to resist wanting to plaster themselves all over you...)";
					
					// + 2 Hours, Adds Resin perk
					//kGAMECLASS.processTime(115 + rand(11));
					
					// Reflexes hard limit set to 40%
					// Add "Resin" combat ability. 40 energy cost. Adds +10% Electric, -10% Burning, +10% Kinetic, +10% Corrosive on PC, 1-3 passive lust gain on enemy for four turns. Effect does not stack.
					
					// Perk: "Resin"
					// v1: Max Reflexes multiplier
					// v2: ???
					// v3: ???
					// v4: ???
					target.createPerk("Resin", 0.40, 0, 0, 0, "Your heavy bark skin slows you all the way down, but provides plenty of protection. It also produces resin. Some flighty, energetic, needy species might find it difficult to resist wanting to plaster themselves all over you...");
					
					// Perk lost if PC loses bark skin, but that should be made fairly difficult once the perk is gotten. Open to suggestions on that.
				}
				//#17 Perk: Flower Power. Requires: Plant skin, plant hair, feminine, at least two of the following three = true: hair orchid, ivy arms, orchid pussy.
				else if(select == 17)
				{
					var pName:String = kGAMECLASS.rooms[kGAMECLASS.currentLocation].planet;
					var numFlowers:int = 0;
					
					if(target.hasStatusEffect("Hair Flower"))
					{
						if(target.statusEffectv1("Hair Flower") > 1) numFlowers += target.statusEffectv1("Hair Flower");
						else numFlowers++;
					}
					if(target.hasStatusEffect("Arm Flower")) numFlowers += 2;
					if(target.hasVaginaType(GLOBAL.TYPE_FLOWER)) numFlowers += target.totalVaginas(GLOBAL.TYPE_FLOWER);
					if(target.tailGenitalArg == GLOBAL.TYPE_FLOWER && target.tailType != GLOBAL.TYPE_HUMAN) numFlowers += target.tailCount;
					
					msg += "\n\nYou sneeze. The air around you is thick, warm and yellow-tinged.";
					// Populated area:
					if(kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.PUBLIC)) msg += " You’ve noticed people who brush by you looking short of breath and flushed.";
					msg += " You’ve been passing this off as poor air quality";
					if(!InShipInterior() && InCollection(pName, ["PLANET: TARKUS", "PLANET: MYRELLION", "PLANET: PHAEDRA"]))
					{
						msg += " - not exactly difficult to blame here on ";
						switch(pName)
						{
							case "PLANET: TARKUS": msg += "Tarkus"; break;
							case "PLANET: MYRELLION": msg += "Myrellion"; break;
							case "PLANET: PHAEDRA": msg += "Phaedra II"; break;
						}
						msg += ParseText(" - but as the hours have drifted by and the phenomenon fails to dissipate, the local conditions having nothing to do with it can no longer be ignored. If you stand still, the cloud intensifies; in the light you can see the thousands of individual yellow grains, peacefully washing past your [pc.eyes]. If you relax, subsume yourself entirely in the green peace pulsing through you, you can <i>feel</i> the pollen radiating off of your [pc.skinFurScales] and particularly your flower" + (numFlowers == 1 ? "" : "s") + ", a sweet, powdery sweat of arousal.");
						msg += ParseText("\n\nYou deliberately breathe in your pollen, and sigh blissfully as it makes your [pc.nipples] [pc.nippleHarden]");
						if(target.hasCock()) msg += ParseText(", [pc.eachCock] to become inexorably erect");
						if(target.hasVagina()) msg += ParseText(", [pc.eachVagina] to slicken and widen eagerly");
					}
					msg += ParseText(". You don’t mind becoming a being of pure, floral lust. With this development, the green, dormant clarity at your core feels like it has bloomed brilliantly outwards. The peacefulness remains, but now it’s of an energetic sort, a wish to share the love and life you feel with everything. How could anyone possibly resist you? It’s not just your thick, seductive pollen. With the clarity and the profound empathy permeating your body and mind you instinctively know how to draw people’s eyes, to call attention to your [pc.chest], your [pc.face] and your [pc.ass] with subtle, seemingly casual movements of your body, the exotic, eerie beauty of your orchids and [pc.hair] framing it all, almost hypnotic.");
					msg += "\n\nYour smile widens. Time to allure. Time to arouse. Time to have endless amounts of sex, spread love and create new life. What a wonderful creature you have evolved into.";
					msg += "\n\n(<b>Perk Gained: Flower Power</b> - Everything about being a pollen-producing flower nymph is deeply arousing. It has its upsides, though: the effect you have on most foes, for instance.)";
					
					// + Lust, add Flower Power perk
					target.lust(15);
					
					// Lust floor increased by 20
					// Libido min. set to 45%
					// PC can use "Pollen Veil" in combat. 40 energy cost. Passive lust gain of 6-8 on enemy for four turns. Effect does not stack.
					
					// Perk: "Flower Power"
					// v1: Number of flowers active
					// v2: Min Lust increase
					// v3: Min Libido increase
					// v4: ???
					target.createPerk("Flower Power", numFlowers, 20, 45, 0, "Everything about being a pollen-producing flower nymph is deeply arousing. It has its upsides, though: the effect you have on most foes, for instance.");
				}
				//#18 Flower tailcunt: Has tail-cunt, overdose.
				else if(select == 18)
				{
					if(target.tailGenitalArgUnlocked(GLOBAL.TYPE_FLOWER))
					{
						var newTailGenitalColor:String = target.tailGenitalColor;
						if(effect.value3 >= 5 || target.tailGenitalColor == "") newTailGenitalColor = RandomInCollection(flowerColors);
						
						msg += ParseText("\n\n[pc.EachTail] twists and flexes widly, reacting to some sort of change. Quickly grabbing [pc.oneTail], you find the [pc.tailVagina] closes up on itself and balloons out until it looks very much like a plant bulb. Curious, you take a finger and gently rub along its lip. Like a reflex reaction, the tip swells and spreads out to reveal its new form. Beautiful " + newTailGenitalColor + " petals open and rearrange to become a lewdly-shaped flower. Finally, a dewy aroma escapes its opening, seemingly inviting a hungry cock to be milked... It seems <b>your cunt tail" + (target.tailCount == 1 ? " is capped with a pretty orchid" : "s are capped with pretty orchids") + " now!</b>");
						
						target.tailGenitalArg = GLOBAL.TYPE_FLOWER;
						target.tailGenitalColor = newTailGenitalColor;
						target.addTailFlag(GLOBAL.FLAG_APHRODISIAC_LACED);
						target.lust(15 * target.tailCount);
					}
					else
					{
						msg += "\n\n" + target.tailGenitalArgLockedMessage();
					}
				}
				//#19 Change mane
				else if(select == 19)
				{
					var newManeType:int = (target.isFeminine() ? GLOBAL.FLAG_FLOWER_SHAPED : GLOBAL.FLAG_TENDRIL);
					
					msg += "\n\nSuddenly, a tingling sensation runs through your mane and you find it drooping and disintegrating off of your shoulders. That is not the end however as";
					if(newManeType == GLOBAL.FLAG_TENDRIL) msg += " plant-like creepers begin sprouting up from below your neck and stretching out to touch the air. <b>You now have a collar of vines around your neck!</b>";
					if(newManeType == GLOBAL.FLAG_FLOWER_SHAPED) msg += " fresh flower petals blossom from your neck, splashing your nostrils with a scent of light morning dew. <b>You now have a collar of flower petals decorating your neck!</b>";
					
					target.setPerkValue("Regal Mane", 1, newManeType);
				}
				totalTFs--;
			}
			
			if(msg.length > 0) 
			{
				AddLogEvent("<u>The Cerespirin drug has an effect....</u>" + msg, "passive", deltaT);
			}
			
			return;
		}
		
		// Potentials for TFs
		public static function itemPlantTF(deltaT:uint, doOut:Boolean, target:Creature, effect:StorageClass):void
		{
			var numProcs:int = 0;
			numProcs = Math.floor((Math.min(deltaT, effect.minutesLeft) + effect.value4) / 40);
			
			effect.value4 = (effect.value4 + deltaT) - (numProcs * 40);
			
			if (effect.minutesLeft <= 0) numProcs++;
			if (numProcs == 0) return;
			
			plantMutations(target, numProcs, deltaT, effect);
			
			if (effect.minutesLeft <= 0)
			{
				AddLogEvent("The Cerespirin drug is out of your system and has finally worn off.", "passive", effect.minutesLeft);
			}
		}
		
		// Bye bye flower (unknown condition but hey it’s here so it ain’t permanent)
		public static function loseHairFlower(target:Creature, numFlowers:Number = 0, effectLength:uint = 1):void
		{
			if(numFlowers > 1) AddLogEvent("Your head orchids droop, lose their petals one by one, and finally wither from your scalp entirely. Slightly annoying they might have been flopping around near your ears, but you can’t help feel rather sad about your blooms’ passing.", "passive", effectLength);
			else AddLogEvent("Your head orchid droops, loses its petals one by one, and then finally withers from your scalp entirely. Slightly annoying it might have been flopping around near your ear, but you can’t help feel rather sad at your bloom’s passing.", "passive", effectLength);
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			author("Nonesuch");
			
			if(target is PlayerCharacter)
			{
				// Use:
				output("Gingerly you extract the Cerespirin syringe from its packaging and stick the needle into a vein on your arm, flushing the cool-feeling serum into your body. Nothing untoward immediately happens - beyond a mild fresh, tingling sensation on your [pc.skin]. And... hmm. You smile as a certain tranquility steals over you, impossible to separate from that minty feeling intimating itself through your form. You feel calm and happy about carrying on and letting the gene mod do its thing.");
				
				// Add "Cerespirin" status for next 4-6 hours.
				var timerStamp:int = (240 + rand(121));
				
				if(target.hasStatusEffect("Cerespirin"))
				{
					// If already under effects, reset timer!
					target.setStatusValue("Cerespirin", 1, timerStamp);
					target.setStatusMinutes("Cerespirin", timerStamp);
					target.addStatusValue("Cerespirin", 3, 1);
				}
				else
				{
					// "Cerespirin"
					// v1: Timestamp!
					// v2: Number of transformations per tick
					// v3: Overdose levels
					target.createStatusEffect("Cerespirin", timerStamp, 1, 0, 0, false, "Icon_DrugVial", "You have injected yourself with an experimental drug...", false, timerStamp, 0xB793C4);
				}
			}
			//Not the player!
			else
			{
				output(target.capitalA + target.short + " uses the Cerespirin but to no effect.");
			}
			return false;
		}
	}
}

