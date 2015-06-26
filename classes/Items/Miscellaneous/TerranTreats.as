package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class TerranTreats extends ItemSlotClass
	{
		
		//constructor
		public function TerranTreats()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "Human T.";
			//Regular name
			this.longName = "terran treat";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a wrapped terran treat";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This is a snack bar-like transformative technically called Humana+, but everyone calls them terran treats since they came out not long after the ausar equivalent. The packaging bears the Steele Tech logo and the advertisement that each bar is filled with microsurgeons that will cause the imbiber to gain human features. They’re popular with human travelers expecting to encounter mutations, as well as members of many species who desire to be more like humans. You’re also pretty sure you saw your dad scarfing them down a few years before they were actually on sale.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 500;
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
		
		protected function rand(max: Number): Number {
 			return int(Math.random() * max);
 		}
		
		//METHOD ACTING!
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
				kGAMECLASS.output("You unwrap the bar and dig in, leaving a taste like hummus in your mouth. As the snack dissolves in your stomach, you feel the microsurgeons get to work.");
				//Face: 
				if(pc.faceType != GLOBAL.TYPE_HUMAN && changes < changeLimit && rand(3) == 0)
				{
					if(target.faceTypeUnlocked(GLOBAL.TYPE_HUMAN))
					{
						kGAMECLASS.output("\n\nYour face contorts, feeling slack like you’ve lost all control of your facial muscles. Thankfully this also seems to protect you from the pain of your skull reshaping, and doesn’t stop <b>until you’ve got a human-like face</b>.");
						changes++;
						pc.faceType = GLOBAL.TYPE_HUMAN
						pc.clearFaceFlags();

					}
					else target.faceTypeLockedMessage();
				}
				//The important stuff
				//Remove fur/scales:
				if((pc.skinType == GLOBAL.SKIN_TYPE_FUR || pc.skinType == GLOBAL.SKIN_TYPE_SCALES) && rand(3) == 0 && changes < changeLimit)
				{
					kGAMECLASS.output("\n\nYou feel itchy, and begin to scratch at your [pc.skinFurScales] only to feel ");
					if(pc.skinType == GLOBAL.SKIN_TYPE_FUR) kGAMECLASS.output("it");
					else kGAMECLASS.output("them");
					kGAMECLASS.output(" come away under your fingers, ");
					if(pc.skinType == GLOBAL.SKIN_TYPE_FUR) kGAMECLASS.output("fur");
					else kGAMECLASS.output("scales");
					kGAMECLASS.output(" falling in clumps until the new, smooth [pc.skinTone] skin underneath is exposed.");
					pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
					changes++;
				}
				//Skin color:
				if(pc.skinType == GLOBAL.SKIN_TYPE_SKIN && (pc.skinTone != "tan" && pc.skinTone != "fair" && pc.skinTone != "pale" && pc.skinTone != "olive" && pc.skinTone != "dark" && pc.skinTone != "ebony") && changes < changeLimit && rand(3) == 0)
				{
					var newSkin:String = "tan";
					if(rand(6) == 0) newSkin = "fair";
					else if(rand(5) == 0) newSkin = "pale";
					else if(rand(4) == 0) newSkin = "olive";
					else if(rand(3) == 0) newSkin = "dark";
					else if(rand(2) == 0) newSkin = "ebony"
					kGAMECLASS.output("\n\nThe tingling of the microsurgeons spreads all throughout your skin, and you watch as the [pc.skinColor] begins to be gain " + newSkin + " patches, spreading across your flesh until the last of your old coloration vanishes. <b>You’ve got " + newSkin + " skin now!</b>");
					pc.skinTone = newSkin;
					changes++;
				}
				//Masculine TFs
				//Get a doggy dick
				//First find an unTF'ed prick
				choices = new Array();
				for(x = 0; x < pc.cockTotal(); x++)
				{
					if(pc.cocks[x].cType != GLOBAL.TYPE_HUMAN) choices[choices.length] = x;
				}
				//Set x to a random dick from choices
				if(choices.length > 0) x = choices[rand(choices.length)];
				//Else set to -1, code for NODONG NOGO
				else x = -1;
				if(changes < changeLimit && x >= 0 && rand(3) == 0)
				{
					if(target.cockTypeUnlocked(x,GLOBAL.TYPE_HUMAN))
					{
						kGAMECLASS.output("\n\nThe tingling of the microsurgeons homes in on [pc.oneCock], and you watch as the flesh contorts, settling on a roughly cylindrical shape with a mushroom-like head, the new member covered ruddy pink skin. <b>You’ve got a human dick</b>!");
						pc.lust(5+rand(3));
						pc.libido(1);
						changes++;
						pc.shiftCock(x,GLOBAL.TYPE_HUMAN);
					}
					else
					{
						kGAMECLASS.output(target.cockTypeLockedMessage());
					}
				}
				
				if(pc.hasCock() && pc.hasStatusEffect("Genital Slit") && changes < changeLimit && rand(3) == 0)
				{
					kGAMECLASS.output("\n\nYou feel [pc.eachCock] come spilling out of ");
					if(pc.cockTotal() == 1) kGAMECLASS.output("its");
					else kGAMECLASS.output("their");
					kGAMECLASS.output(" container as the container itself begins to feel tight. Soon it vanishes entirely, leaving your ");
					if(pc.cockTotal() == 1) kGAMECLASS.output("dick");
					else kGAMECLASS.output("dicks");
					kGAMECLASS.output(" hanging free like a human’s. <b>You have lost your genital slit!</b>");
					pc.removeStatusEffect("Genital Slit");
				}
				
				if (pc.hasStatusEffect("Vanae Markings") && changes < changeLimit && rand(6) == 0)
				{
					kGAMECLASS.output("\n\nYou feel your [pc.skinNoun] tingle and notice the " + pc.skinAccent + " swirls decorating your form starting to dissolve and fade. It doesn't take long until your");
					
					var ss:String = pc.skinFurScales();
					
					if (ss.charAt(ss.length - 1) == "s") kGAMECLASS.output(" " + ss + " are");
					else kGAMECLASS.output(" " + ss + " is");
					
					kGAMECLASS.output(" bare of the intricate designs. <b>You have lost your body markings!</b>");
					pc.removeStatusEffect("Vanae Markings");
				}

				//Feminine TFs
				choices = new Array();
				for(x = 0; x < pc.totalVaginas(); x++)
				{
					if(pc.vaginas[x].type != GLOBAL.TYPE_HUMAN) choices[choices.length] = x;
				}
				//Set x to a random cunt from choices
				if(choices.length > 0) x = choices[rand(choices.length)];
				//Else set to -1, code for NOCUNT NOGO
				else x = -1;
				if(changes < changeLimit && x >= 0 && rand(3) == 0)
				{
					if(target.vaginaTypeUnlocked(x,GLOBAL.TYPE_HUMAN))
					{
						kGAMECLASS.output("\n\nYour [pc.vagina " + x + "] feels strange, like its entire length is squirming. The flesh of your folds and outer lips reshapes, becoming a simple slit with a pink interior and a single clit nestled within. <b>[pc.OneVagina] is now human-like</b>.");
						pc.lust(5+rand(3));
						pc.libido(1);
						changes++;
						pc.shiftVagina(x,GLOBAL.TYPE_HUMAN);
					}
					else
					{
						kGAMECLASS.output("\n\n" + target.vaginaTypeLockedMessage());
					}
				}
				//Breasts down to F-cup
				//**Same as Zil TF, I guess?
				if(changes < changeLimit && pc.breastRows[0].breastRating() >= 12 && rand(2) == 0)
				{
					var tittyDrop:int = 0;
					if(pc.breastRows[0].breastRatingRaw >= 24) tittyDrop += pc.breastRows[0].breastRatingRaw * .25;
					else if(pc.breastRows[0].breastRatingRaw >= 16) tittyDrop += rand(3);
					tittyDrop += 1;
					if (pc.breastRatingUnlocked(0, pc.breastRows[0].breastRatingRaw - tittyDrop))
					{
						pc.breastRows[0].breastRatingRaw -= tittyDrop;
						//**Same as Zil TF, I guess?
						kGAMECLASS.output("\n\nTipping backwards, you flail your arms frantically to keep your balance. Once you right, you realize what happened; your [pc.chest] have lost a bit of weight, dropping you down to a " + pc.breastCup(0) + ".");
						changes++;
						//Other rows, go!
						var bonusRowsTFed:int = 0;
						for(x = 1; x < pc.bRows(); x++)
						{
							if(pc.breastRows[x].breastRatingRaw >= 12)
							{
								//Figure out how much dat row will change!
								if(pc.breastRows[x].breastRatingRaw >= 24) tittyDrop += pc.breastRows[x].breastRatingRaw * .25;
								else if(pc.breastRows[x].breastRatingRaw >= 16) tittyDrop += rand(3);
								tittyDrop += 1;
								//If that row is unlocked!
								if (pc.breastRatingUnlocked(0, pc.breastRows[x].breastRatingRaw - tittyDrop))
								{
									bonusRowsTFed++;
									pc.breastRows[x].breastRatingRaw -= tittyDrop;
								}
							}
						}
						if(bonusRowsTFed == 1) kGAMECLASS.output(" Your second row of breasts shrink a bit as well.");
						else if(bonusRowsTFed > 1) kGAMECLASS.output(" Your other breasts shrink a bit as well.");
					}
				}
				//Change arm type to furred
				if(pc.armType != GLOBAL.TYPE_HUMAN && changes < changeLimit && rand(3) == 0)
				{
					if (target.armTypeUnlocked(GLOBAL.TYPE_HUMAN))
					{
						kGAMECLASS.output("\n\nYour arms begin to itch, your fingers twitching erratically as their shape stretches and tightens, forming a short nail at the tip of each finger. By the time you regain control of your hands, <b>you’ve got human-like arms</b>.");
						pc.armType = GLOBAL.TYPE_HUMAN;
						changes++;
					}
					else kGAMECLASS.output(target.armTypeLockedMessage());
				}
				//Change leg-type to furred (Needs Bipedal legs)
				if((pc.legType != GLOBAL.TYPE_HUMAN || pc.legCount != 2) && changes < changeLimit &&  rand(3) == 0 && pc.armType == GLOBAL.TYPE_HUMAN)
				{
					if (target.legTypeUnlocked(GLOBAL.TYPE_HUMAN))
					{
						kGAMECLASS.output("\n\nYour whole lower body suddenly feels weak, and you collapse. You can’t move, not until your body has finished reshaping itself, your old legs changing <b>into a pair of human legs</b>. You stand up, finding your balance after a few seconds as your reworked nervous system reasserts itself.");
						pc.legType = GLOBAL.TYPE_HUMAN;
						pc.clearLegFlags();
						pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
						pc.legCount = 2;
						pc.genitalSpot = 0;
						changes++;
					}
					else kGAMECLASS.output(target.legTypeLockedMessage());
				}
				//Grow doggy tail -- you know what, fuck you, use the CoC Dogtail growth texts. 
				if(pc.tailCount > 0 && changes < changeLimit && rand(4) == 0)
				{
					if (target.tailTypeUnlocked(GLOBAL.TYPE_HUMAN))
					{
						kGAMECLASS.output("\n\nYou feel a pinching in your [pc.tails], which start");
						if(pc.tailCount == 1) kGAMECLASS.output("s");
						kGAMECLASS.output(" to gradually shorten. Soon ");
						if(pc.tailCount == 1) kGAMECLASS.output("it vanishes");
						else kGAMECLASS.output("they vanish");
						kGAMECLASS.output(" entirely, allowing you to straighten up a bit. <b>You no longer have a tail</b>.");

						pc.tailCount = 0;
						pc.tailType = GLOBAL.TYPE_HUMAN;
						pc.clearTailFlags();
						changes++;
					}
					else kGAMECLASS.output(target.tailTypeLockedMessage());
				}
				//Grow wolf ears
				if(pc.earType != GLOBAL.TYPE_HUMAN && changes < changeLimit && rand(4) == 0)
				{
					if (target.earTypeUnlocked(GLOBAL.TYPE_HUMAN))
					{
						kGAMECLASS.output("\n\nYou hear a ringing in your [pc.ears], drowning out all other sounds as your ears adjust their size and position. By the time the ringing stops, <b>you’ve got human-like ears on the sides of your head</b>.");
						pc.earType = GLOBAL.TYPE_HUMAN;
						changes++;
					}
					else kGAMECLASS.output(target.earTypeLockedMessage());
				}
				//Tongue:
				if(pc.tongueType != GLOBAL.TYPE_HUMAN && changes < changeLimit && rand(4) == 0)
				{
					kGAMECLASS.output("\n\nYour tongue feels thick in your mouth, morphing into a rounded, slightly tapered shape. <b>You have a human tongue</b>.");
					changes++;
					pc.clearTongueFlags();
					pc.tongueType = GLOBAL.TYPE_HUMAN;
				}
				//Horns/antennae:
				if((pc.horns > 0 || pc.antennae > 0) && rand(4) == 0 && changes < changeLimit)
				{
					kGAMECLASS.output("\n\nThere’s a sucking feeling on the top of your head, as it draws its extra appendages inward. By the time it’s done, <b>your ");
					if(pc.horns > 0) 
					{
						kGAMECLASS.output("horns");
						pc.horns = 0;
					}
					else 
					{
						kGAMECLASS.output("antennae");
						pc.antennae = 0;
					}
					kGAMECLASS.output(" are gone</b>.");
					changes++;
				}
				//Wings:
				if(pc.wingType != 0 && rand(4) == 0 && changes < changeLimit)
				{
					kGAMECLASS.output("\n\nYour back feels uncomfortable, like you’re molting. You look behind you to see your [pc.wings] being drawn into your back, soon vanishing entirely. <b>You no longer have wings</b>!");
					changes++;
					pc.wingType = 0;
				}
				//Eyes:
				if(pc.eyeType != GLOBAL.TYPE_HUMAN && changes < changeLimit && rand(4) == 0)
				{
					kGAMECLASS.output("\n\nYour vision flickers like a camera hit with a burst of static, staggering you as you grab your forehead in pain. After a few seconds the feeling subsides, but it takes a good while longer for you to adjust to the change in vision from <b>your new human-like eyes</b>.");
					changes++;
					pc.eyeType = GLOBAL.TYPE_HUMAN;
				}
				
				//Hair
				if(pc.hasHair() && pc.hairType != GLOBAL.TYPE_HUMAN && changes < changeLimit && rand(4) == 0)
				{
					kGAMECLASS.output("\n\n");
					if(pc.hairTypeUnlocked(GLOBAL.TYPE_HUMAN))
					{
						kGAMECLASS.output("Your scalp itches, the [pc.hair] covering it falling away as a mass of new filaments sprouts in their place. <b>You have hair!</b>");
						changes++;
						pc.hairType = GLOBAL.TYPE_HUMAN;
					}
					else kGAMECLASS.output(pc.hairTypeLockedMessage());
				}
				
				//Lose "Mane" Perk:
				if(pc.hasHair() && pc.hasPerk("Mane") && changes < changeLimit && rand(3) == 0)
				{
					kGAMECLASS.output("\n\nYou feel the hairline on the back of your neck receding to something more in line with the back of your head. <b>You no longer have a mane.</b>");
					changes++;
					pc.removePerk("Mane");
				}
				
				if(changes == 0)
				{
					kGAMECLASS.output("\n\nNothing changed. What a rip-off.");
				}

			}
			//Not player!
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " eats the rations to no effect.");
			}
			return false;
		}
	}
}

