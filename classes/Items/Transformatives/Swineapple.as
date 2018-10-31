package classes.Items.Transformatives
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Utility.rand;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;;
	
	public class Swineapple extends ItemSlotClass
	{
		
		//constructor
		public function Swineapple()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "Swineapple";
			//Regular name
			this.longName = "Swineapple";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a swineapple fruit";
			
			this.tooltip = "A transformative in the form of an artificial fruit. The so-called swineapple is meant to give the user pig-like features, but also has the potential to make the user larger and softer. It looks similar to a terran apple, but the skin is pink and fuzzy.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 750;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = this._latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var changes:int = 0;
			var changeLimit:int = 1;
			var pc:Creature = target;
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			if(rand(2) == 0) changeLimit++;
			if(rand(3) == 0) changeLimit++;
			if(rand(4) == 0) changeLimit++;
			if(rand(5) == 0) changeLimit++;
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				//Usage text:
				kGAMECLASS.output("You take a big bite out of the swineapple. It mostly tastes and feels like a terran apple, but the flavor has earthy undertones. Somehow you end up feeling hungrier.");
				
				// Make face human if it's not human or swine
				if (changes < changeLimit && !InCollection(pc.faceType, GLOBAL.TYPE_HUMAN, GLOBAL.TYPE_SWINE) && rand(4) == 0)
				{
					if (pc.faceTypeUnlocked(GLOBAL.TYPE_HUMAN))
					{
						kGAMECLASS.output("\n\nYou feel your face beginning to itch and crawl. You throw your hands up to your face and can feel that it’s changing shape. You scramble for a reflective surface just in time to find an <b>utterly human face staring back at you.</b>");
						
						pc.clearFaceFlags();
						pc.faceType = GLOBAL.TYPE_HUMAN;
						changes++;
					}
					else kGAMECLASS.output("\n\n" + pc.faceTypeLockedMessage());
				}
				
				// Make face swine if it's human
				if (changes < changeLimit && pc.faceType == GLOBAL.TYPE_HUMAN && rand(4) == 0)
				{
					if (pc.faceTypeUnlocked(GLOBAL.TYPE_SWINE))
					{
						kGAMECLASS.output("\n\nYou feel your face beginning to itch and crawl. You throw your hands to your face and notice your nose feels...flat? You scramble for a reflective surface just in time to see a <b>flat, pig-like nose on your otherwise human face.</b>");
						
						pc.faceType = GLOBAL.TYPE_SWINE;
						changes++;
					}
					else kGAMECLASS.output("\n\n" + pc.faceTypeLockedMessage());
				}
				
				// Sheath random cock
				
				//First find an unTF'ed prick
				choices = new Array();
				for(x = 0; x < pc.cockTotal(); x++)
				{
					if(!pc.cocks[x].hasFlag(GLOBAL.FLAG_SHEATHED)) choices[choices.length] = x;
				}
				//Set x to a random dick from choices
				if(choices.length > 0) x = choices[rand(choices.length)];
				//Else set to -1, code for no penis
				else x = -1;
				
				if(changes < changeLimit && x >= 0 && rand(3) == 0)
				{
					if (pc.cockFlagsUnlocked(x, [GLOBAL.FLAG_SHEATHED]))
					{
						kGAMECLASS.output("\n\nYour [pc.cock " + x + "] feels as if it’s shrinking and tearing apart at its base, but you realize that it’s simply becoming <b>sheathed.</b>");
						
						pc.cocks[x].addFlag(GLOBAL.FLAG_SHEATHED);
						
						changes++;
					}
					else
					{
						kGAMECLASS.output("\n\n" + pc.cockFlagsLockedMessage());
					}
				}
				// endregion
				
				// Turn random sheathed cock into swine cock
				//First find an unTF'ed prick
				choices = new Array();
				for(x = 0; x < pc.cockTotal(); x++)
				{
					if(pc.cocks[x].cType != GLOBAL.TYPE_SWINE && pc.cocks[x].hasFlag(GLOBAL.FLAG_SHEATHED)) choices[choices.length] = x;
				}
				//Set x to a random dick from choices
				if(choices.length > 0) x = choices[rand(choices.length)];
				//Else set to -1, code for no penis
				else x = -1;
				if(changes < changeLimit && x >= 0 && rand(3) == 0)
				{
					if(pc.cockTypeUnlocked(x, GLOBAL.TYPE_SWINE))
					{
						kGAMECLASS.output("\n\nYour [pc.cock " + x + "] throbs suddenly ");
						if(pc.isCrotchGarbed()) kGAMECLASS.output("beneath your [pc.lowerGarments]");
						else if(pc.legCount == 1) kGAMECLASS.output("on your [pc.leg]");
						else kGAMECLASS.output("between your [pc.legs]");
						kGAMECLASS.output(", swelling to its full size as a strange heat radiates through your body. You grab your simmering penis as the artificial fruit takes effect, rewriting your most sensitive places. You double over in a sick twist of pain and pleasure as your shaft twists into a corkscrew shape");
						
						var cockGrew:Boolean = false;
						
						if (pc.cocks[x].cLength() < 24)
						{
							kGAMECLASS.output(" and lengthens");
							pc.cocks[x].cLength(3 + rand(4));
							cockGrew = true;
						}
						if (pc.cocks[x].cThicknessRatio() > 0.3)
						{
							if (cockGrew)
							{
								kGAMECLASS.output(", but grows proportionally thinner");
							}
							else
							{
								kGAMECLASS.output(" and grows thinner");
							}
							
							pc.cocks[x].cThicknessRatio(-0.1);
						}
						
						kGAMECLASS.output(". <b>You have a pig penis!</b>");
						
						pc.lust(20 + rand(20));
						
						changes++;
						pc.shiftCock(x, GLOBAL.TYPE_SWINE);
					}
					else
					{
						kGAMECLASS.output("\n\n" + target.cockTypeLockedMessage());
					}
				}
				
				// Grow cock length (if pig penis)
				
				//Dick size+ (Max: 24 inches)
				choices = new Array();
				var dickMax:Number = 20;
				if(pc.hasPerk("Hung")) dickMax += 8;
				if(pc.hasPerk("Mini")) dickMax -= 8;
				for(x = 0; x < pc.cockTotal(); x++)
				{
					if(pc.cocks[x].cLength() < dickMax && pc.cocks[x].cType == GLOBAL.TYPE_SWINE) choices[choices.length] = x;
				}
				//Set x to a random dick from choices
				if(choices.length > 0) x = choices[rand(choices.length)];
				//Else set to -1, code for NODONG NOGO
				else x = -1;
				if(changes < changeLimit && x >= 0 && target.cockLengthUnlocked(x, pc.cocks[x].cLength() + 1.5) && rand(2) == 0)
				{
					kGAMECLASS.output("\n\nYou shudder as your [pc.cock " + x + "] throbs, swelling powerfully. You look down just in time to see your cockflesh expanding, sending waves of pleasure through your body. Your dick spurts a thin trickle of [pc.cum] as it grows out to its new size of ");
					pc.cocks[x].cLength(Math.round(5 + rand(10))/10);
					if(pc.hasPerk("Hung")) pc.cocks[x].cLength(Math.round(5 + rand(10))/10);
					kGAMECLASS.output(Math.round(pc.cocks[x].cLength()*10)/10 + " inches. You take a moment to marvel at your new, larger member, ready for action.");
					changes++;
					pc.lust(10+rand(5));
				}
				
				// Cock shrink thickness ratio (if pig penis)
				choices = new Array();
				for(x = 0; x < pc.cockTotal(); x++)
				{
					if(pc.cocks[x].cThicknessRatio() > 0.6 && pc.cocks[x].cType == GLOBAL.TYPE_SWINE) choices[choices.length] = x;
				}
				//Set x to a random dick from choices
				if(choices.length > 0) x = choices[rand(choices.length)];
				//Else set to -1, code for NODONG NOGO
				else x = -1;
				if(changes < changeLimit && x >= 0 && x >= 0 && rand(3) == 0)
				{
					if (pc.cockThicknessUnlocked(x, pc.cocks[x].cThicknessRatio() - 0.1))
					{
						kGAMECLASS.output("\n\nYou feel your [pc.cock " + x + "] tightening. Alarmed, you ");
						if(!pc.isCrotchGarbed()) kGAMECLASS.output("strip");
						else kGAMECLASS.output("spread your [pc.legOrLegs]");
						kGAMECLASS.output(" and grab your cock. It shrinks away from your grasp, thinner than before!");
						changes++;
						
						pc.cocks[x].cThicknessRatio(-0.1);
					}
					else kGAMECLASS.output("\n\n" + pc.cockThicknessLockedMessage());
				}
				
				// Turn random vagina into swine vagina
				choices = new Array();
				for(x = 0; x < pc.vaginaTotal(); x++)
				{
					if(pc.vaginas[x].type != GLOBAL.TYPE_SWINE) choices[choices.length] = x;
				}
				//Set x to a random cooch from choices
				if(choices.length > 0) x = choices[rand(choices.length)];
				//Else set to -1, code for NOGO
				else x = -1;
				if(changes < changeLimit && x >= 0 && rand(3) == 0)
				{
					if (pc.vaginaTypeUnlocked(x, GLOBAL.TYPE_SWINE))
					{
						kGAMECLASS.output("\n\nYou feel your pussy getting tight and wet. The outer lips swell out dramatically with your rising lust. You stick a finger inside and feel corkscrew-patterned ridges forming along your vaginal walls. <b>Looks like you’ve got a pig pussy!</b>");
						
						pc.lust(20 + rand(20));
						
						changes++;
						pc.shiftVagina(x, GLOBAL.TYPE_SWINE);
					}
					else
					{
						kGAMECLASS.output("\n\n" + target.vaginaTypeLockedMessage());
					}
				}
				
				// Change leg-type to pig legs (skin, digitigrade, hoofed)
				if(pc.legType != GLOBAL.TYPE_SWINE && changes < changeLimit && pc.legCount == 2 && rand(3) == 0)
				{
					if (target.legTypeUnlocked(GLOBAL.TYPE_SWINE))
					{
						kGAMECLASS.output("\n\nYour legs feel hot and begin to change before your eyes. ");
						
						if (pc.hasLegFlag(GLOBAL.FLAG_FURRED)) kGAMECLASS.output("Your [pc.skinFurScales] falls out in large tufts, leaving you with smooth skin. ");
						else if (pc.hasLegFlag(GLOBAL.FLAG_SCALED)) kGAMECLASS.output("Your [pc.skinFurScales] fall off, sprinkling to the floor, leaving you with smooth skin. ");
						
						if (!pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) kGAMECLASS.output("Their form shifts until you’re left standing on digitigrade legs. ");
						
						if (!pc.hasLegFlag(GLOBAL.FLAG_HOOVES)) kGAMECLASS.output("Your feet and toes are swallowed up by newly formed cloven hooves. ");
						
						kGAMECLASS.output("<b>You’ve got pig legs!</b>");
						
						pc.legType = GLOBAL.TYPE_SWINE;
						pc.clearLegFlags();
						pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
						pc.addLegFlag(GLOBAL.FLAG_HOOVES);
						changes++;
					}
					else kGAMECLASS.output("\n\n" + target.legTypeLockedMessage());
				}
				
				// Change leg type to bipedal pig legs
				if(pc.legCount != 2 && changes < changeLimit && rand(3) == 0)
				{
					if (target.legTypeUnlocked(GLOBAL.TYPE_SWINE))
					{
						if(pc.legCount < 2)
						{
							kGAMECLASS.output("\n\nYour [pc.leg] wobbles then folds, dropping you onto your [pc.butt]. It thrashes wildly around, uncontrolled and spasmatic. Something inside is changing, and you’re helpless to do anything but clench your fists and hold on for the ride. A seam appears in your [pc.leg] a moment before it divides into two leg-like shapes. The digitigrade legs are covered only in skin, and capped with cloven hooves. <b>You’ve got pig legs!</b>");
						}
						//More than biped
						else
						{
							kGAMECLASS.output("\n\nYour [pc.legs] wobble and then fold, dropping you flat on your [pc.butt]. They thrash wildly, so fast you can barely track them, then collide. This time, they stick together, reshaping into two distinct, bipedal legs. The digitigrade legs are covered only in skin, and capped with cloven hooves. <b>You’ve got pig legs!</b>");
						}
						pc.legCount = 2;
						pc.genitalSpot = 0;
						pc.legType = GLOBAL.TYPE_SWINE;
						pc.clearLegFlags();
						pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
						pc.addLegFlag(GLOBAL.FLAG_HOOVES);
						changes++;
					}
					else kGAMECLASS.output("\n\n" + target.legTypeLockedMessage());
				}
				
				// Grow pig tail
				if(pc.tailType != GLOBAL.TYPE_SWINE && changes < changeLimit && rand(4) == 0)
				{
					if (target.tailTypeUnlocked(GLOBAL.TYPE_SWINE))
					{
						//If PC had a tail before:
						if(pc.tailCount == 1) kGAMECLASS.output("\n\nYou feel something itching on your [pc.tail]. Twisting around, you watch in a mix of horror and excitement as it twists into a short, curly shape. It starts twirling as the change completes, <b>leaving you with pig-like tail.</b>");
						//Multitails
						else if(pc.tailCount == 2) kGAMECLASS.output("\n\nYour [pc.tails] knot together, torturing you with brief convulsions. A kind of numb heat spreads through them, forcing you to twist about for a visual inspection. They’re merging together into a single, narrow entity. The flesh crawls eerily as it assume its new shape. The result is a <b>short, curly pig tail..</b>");
						//no tail
						else
						{
							kGAMECLASS.output("\n\nOuch! A knot of discomfort forms just above your [pc.butt] as if it had suffered a nasty sting or bite, but no such injury occured. You twist for a look at it");
							if(pc.isCrotchGarbed()) kGAMECLASS.output(", peeling back your [pc.underGarments]");
							kGAMECLASS.output(". There’s a raised, irritated lump there, and it’s getting bigger. Wiggling slightly, it extends as new bones form within it, gently twirling as it lengthens. You’re growing a tail! It grows out in a corkscrew pattern, stopping at a fairly short length; <b>you’ve obviously gained a pig’s tail.</b>");
						}
						pc.tailCount = 1;
						pc.tailType = GLOBAL.TYPE_SWINE;
						pc.clearTailFlags();
						pc.addTailFlag(GLOBAL.FLAG_CORKSCREWED);
						changes++;
					}
					else kGAMECLASS.output("\n\n" + target.tailTypeLockedMessage());
				}
				
				// Grow pig ears
				if(pc.earType != GLOBAL.TYPE_SWINE && changes < changeLimit && rand(4) == 0)
				{
					if (pc.earTypeUnlocked(GLOBAL.TYPE_SWINE))
					{
						kGAMECLASS.output("\n\nYour ears begin to itch uncontrollably. You desperately try to scratch at them, but the itch spreads and grows... as do your ears! Your ears twist and morph as they reshape into a pair of lazy points, flopping down over your head. <b>You now have a pig’s ears!</b>");
						pc.earType = GLOBAL.TYPE_SWINE;
						changes++;
					}
					else kGAMECLASS.output("\n\n" + pc.earTypeLockedMessage());
				}
				
				// Increase thickness
				if (pc.thickness < pc.thicknessMax() && changes < changeLimit && rand(2) == 0)
				{
					var thicknessIncrease:int = 2 + rand(2);
					
					if (target.thicknessUnlocked(pc.thickness + thicknessIncrease))
					{
						kGAMECLASS.output(pc.modThickness(thicknessIncrease));
						changes++;
					}
					else kGAMECLASS.output("\n\n" + pc.thicknessLockedMessage());
				}
				
				// Increase belly size
				if (pc.bellyRatingRaw < 17 && changes < changeLimit && rand(2) == 0)
				{
					pc.bellyRatingRaw += 2 + rand(2);
					
					kGAMECLASS.output("\n\nYou feel your stomach rumbling and begin to feel queasy. Did you just eat a spoiled swineapple? The rumbling dies and as quickly as it came on, the sickness is replaced with a feeling of growth. You’re left with a larger stomach.");
					changes++;
				}
				
				// Give normal skin
				if (pc.skinType != GLOBAL.SKIN_TYPE_SKIN && changes < changeLimit && rand(4) == 0)
				{
					if (pc.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN))
					{
						kGAMECLASS.output("\n\nYou feel an intense itch all over your skin");
						
						if (!pc.isNude()) kGAMECLASS.output(" and tear away all of your clothing and gear");
						
						kGAMECLASS.output(". The itch falls away along with everything except for the skin itself, <b>leaving you with plain, normal skin.<b>");
						
						pc.clearSkinFlags();
						pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
						changes++;
					}
					else kGAMECLASS.output("\n\n" + pc.skinTypeLockedMessage());
				}
				
				// Change skin tone if normal skin (and maybe change nipples to match)
				if (!InCollection(pc.skinTone, "pink", "light pink", "brown-pink", "red-pink", "white", "black", "gray", "brown") && pc.skinType == GLOBAL.SKIN_TYPE_SKIN && changes < changeLimit && rand(2) == 0)
				{
					var newSkinTone:String = RandomInCollection("pink", "brown-pink", "red-pink", "white", "black", "gray", "brown");
					
					if (pc.skinToneUnlocked(newSkinTone))
					{
						kGAMECLASS.output("\n\nYour skin seems to shimmer briefly and changes colors. You now have " + newSkinTone + " colored skin.");
						
						pc.skinTone = newSkinTone;
						changes++;
						
						if (!InCollection(pc.nippleColor, "brown-pink", "pink", "light pink", "dark gray"))
						{
							var newNippleColor:String = "";
							
							// Some random nipple chances
							if (InCollection(newSkinTone, "pink", "light pink", "red-pink", "black", "gray", "brown") && rand(2) == 0) newNippleColor = "brown-pink";
							else if (InCollection(newSkinTone, "light pink", "brown-pink", "red-pink", "white", "black", "gray", "brown") && rand(2) == 0) newNippleColor = "pink";
							else if (InCollection(newSkinTone, "pink", "brown-pink", "red-pink", "white", "gray", "brown") && rand(2) == 0) newNippleColor = "light pink";
							else if (InCollection(newSkinTone, "black", "gray", "white") && rand(2) == 0) newNippleColor = "dark gray";
							else if (InCollection(newSkinTone, "pink", "brown-pink", "red-pink") && rand(2) == 0) newNippleColor = "brown";
							// Fall back onto default nipple colors if all the random is passed up
							else if (InCollection(newSkinTone, "pink", "red-pink", "brown")) newNippleColor = "brown-pink";
							else if (InCollection(newSkinTone, "light pink", "brown-pink")) newNippleColor = "pink";
							else if (newSkinTone == "white") newNippleColor = "light pink";
							else if (InCollection(newSkinTone, "black", "gray")) newNippleColor = "dark gray";
							
							if (pc.nippleColorUnlocked(newNippleColor))
							{
								kGAMECLASS.output(" Your nipples change to a matching " + newNippleColor + " color.");
								
								pc.nippleColor = newNippleColor;
							}
							else kGAMECLASS.output(" " + pc.nippleColorLockedMessage());
						}
					}
					else kGAMECLASS.output("\n\n" + pc.skinToneLockedMessage());
				}
				
				if(changes == 0)
				{
					kGAMECLASS.output("\n\nNothing changed. What a rip-off.");
				}
			}
			//Not player!
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " eats the swineapple to no effect.");
			}
			return false;
		}
	}
}

