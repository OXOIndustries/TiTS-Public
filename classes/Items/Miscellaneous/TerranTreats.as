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
						pc.faceType = GLOBAL.TYPE_HUMAN;
						pc.clearFaceFlags();
					}
					else kGAMECLASS.output("\n\n" + target.faceTypeLockedMessage());
				}
				//The important stuff
				// Remove Wooly perk
				if(target.hasFur() && target.perkv1("Wooly") >= 1 && !target.hasStatusEffect("Wool Removal") && rand(3) == 0)
				{
					kGAMECLASS.output("\n\nThe [pc.skinNoun] under your wool itches briefly and then quickly dissipates. Did... did something just happen?");
					target.createStatusEffect("Wool Removal");
					changes++;
				}
				// Skin type change
				if(pc.skinType != GLOBAL.SKIN_TYPE_SKIN && rand(3) == 0 && changes < changeLimit)
				{
					if(target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN))
					{
						// Remove latex skin (if not locked by perk):
						if(pc.skinType == GLOBAL.SKIN_TYPE_LATEX && pc.hasStatusEffect("Latex Skin"))
						{
							kGAMECLASS.output("\n\nYour skin heats up and then tingles as you feel goosebumps run across it.");
							pc.addStatusValue("Latex Skin", 1, -1);
							if(pc.statusEffectv1("Latex Skin") > 0) kGAMECLASS.output(" Strange... It looks a little less shiny now.");
							else
							{
								kGAMECLASS.output(".. and just like that, the remaining shininess evaporates off its surface, making your skin appear very much normal. <b>Your skin is no longer made of latex!</b>");
								pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
								pc.clearSkinFlags();
								pc.addSkinFlag(GLOBAL.FLAG_SMOOTH);
								pc.removeStatusEffect("Latex Skin");
							}
						}
						// Remove fur/scales:
						else if(pc.skinType == GLOBAL.SKIN_TYPE_FUR || pc.skinType == GLOBAL.SKIN_TYPE_SCALES)
						{
							kGAMECLASS.output("\n\nYou feel itchy, and begin to scratch at your [pc.skinFurScales] only to feel ");
							if(pc.skinType == GLOBAL.SKIN_TYPE_FUR) kGAMECLASS.output("it");
							else kGAMECLASS.output("them");
							kGAMECLASS.output(" come away under your fingers, ");
							if(pc.skinType == GLOBAL.SKIN_TYPE_FUR) kGAMECLASS.output("fur");
							else kGAMECLASS.output("scales");
							kGAMECLASS.output(" falling in clumps until the new, smooth [pc.skinTone] skin underneath is exposed.");
							pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
							pc.clearSkinFlags();
						}
						// Generic
						else
						{
							kGAMECLASS.output("\n\nYou feel itchy, and begin to scratch at your [pc.skinFurScales] only to feel the [pc.skinNoun] come away under your fingers, falling in clumps until the new, smooth [pc.skinTone] skin underneath is exposed. <b>You now have normal skin!</b>");
							pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
							pc.clearSkinFlags();
						}
						changes++;
					}
					else kGAMECLASS.output("\n\n" + target.skinTypeLockedMessage());
				}
				//Skin color:
				if(pc.skinType == GLOBAL.SKIN_TYPE_SKIN && (pc.skinTone != "tan" && pc.skinTone != "fair" && pc.skinTone != "pale" && pc.skinTone != "olive" && pc.skinTone != "dark" && pc.skinTone != "ebony") && changes < changeLimit && rand(3) == 0)
				{
					var newSkin:String = "tan";
					if(rand(6) == 0) newSkin = "fair";
					else if(rand(5) == 0) newSkin = "pale";
					else if(rand(4) == 0) newSkin = "olive";
					else if(rand(3) == 0) newSkin = "dark";
					else if(rand(2) == 0) newSkin = "ebony";
					kGAMECLASS.output("\n\nThe tingling of the microsurgeons spreads all throughout your skin, and you watch as the [pc.skinColor] begins to be gain " + newSkin + " patches, spreading across your flesh until the last of your old coloration vanishes. <b>You’ve got " + newSkin + " skin now!</b>");
					pc.skinTone = newSkin;
					changes++;
				}
				//Masculine TFs
				//Get a human dick
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
						pc.changeLust(5+rand(3));
						pc.libido(1);
						changes++;
						pc.shiftCock(x,GLOBAL.TYPE_HUMAN);
					}
					else
					{
						kGAMECLASS.output("\n\n" + target.cockTypeLockedMessage());
					}
				}
				if(changes < changeLimit && rand(3) == 0 && target.cumType != GLOBAL.FLUID_TYPE_CUM && target.hasCock())
				{
					if(target.cumTypeUnlocked(GLOBAL.FLUID_TYPE_CUM))
					{
						kGAMECLASS.output("\n\nYou feel a sudden clenching in your gut and a dampness down south. Investigating, you find your [pc.cocks] dribbling your [pc.cum], though the odd ejaculation is looking more and more like normal terran spunk by the second. After what feels like a minute of bizarre, pleasureless ejaculation, the flow stops. <b>It looks like you’ve got normal, terran cum now.</b>");
						pc.cumType = GLOBAL.FLUID_TYPE_CUM;
						changes++;
					}
					else kGAMECLASS.output("\n\n" + target.cumTypeLockedMessage());
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
					changes++;
				}
				
				// Remove Markings
				if (pc.hasAccentMarkings() && changes < changeLimit && rand(6) == 0)
				{
					kGAMECLASS.output("\n\nYou feel your [pc.skinNoun] tingle and notice the " + pc.skinAccent);
					if (pc.hasStatusEffect("Vanae Markings")) kGAMECLASS.output(" swirls");
					else if (pc.statusEffectv1("Shark Markings") == 1) kGAMECLASS.output(" stripes");
					else if (pc.statusEffectv1("Shark Markings") == 2) kGAMECLASS.output(" spots");
					else if (pc.statusEffectv1("Shark Markings") == 3) kGAMECLASS.output(" blotch");
					else kGAMECLASS.output(" marks");
					kGAMECLASS.output(" decorating your form starting to dissolve and fade. It doesn’t take long until your");
					
					var ss:String = pc.skinFurScales();
					
					if (ss.charAt(ss.length - 1) == "s") kGAMECLASS.output(" " + ss + " are");
					else kGAMECLASS.output(" " + ss + " is");
					
					kGAMECLASS.output(" bare of the intricate designs. <b>You have lost your body markings!</b>");
					pc.clearAccentMarkings();
					changes++;
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
						pc.changeLust(5+rand(3));
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
				//Non nips!
				if(changes < changeLimit && (pc.hasLipples() || pc.hasFuckableNipples() || pc.hasDickNipples()) && rand(3) == 0)
				{
					if(pc.nippleTypeUnlocked(0, GLOBAL.NIPPLE_TYPE_NORMAL))
					{
						kGAMECLASS.output("\n\nA sharp shock of sensation stabs through your chest and into your [pc.nipples], fading almost as soon as it arrives. By the time you sneak a peek, you discover that <b>your nipples have become much more mundane.</b>");
						for(x = 0; x < pc.bRows(); x++)
						{
							//Lipples become inverted nips
							if(pc.breastRows[x].nippleType == GLOBAL.NIPPLE_TYPE_LIPPLES) pc.breastRows[x].nippleType = GLOBAL.NIPPLE_TYPE_INVERTED;
							//Fucknipples become inverted
							else if(pc.breastRows[x].nippleType == GLOBAL.NIPPLE_TYPE_FUCKABLE) pc.breastRows[x].nippleType = GLOBAL.NIPPLE_TYPE_INVERTED;
							//Dicknips become normal
							else if(pc.breastRows[x].nippleType == GLOBAL.NIPPLE_TYPE_DICK) pc.breastRows[x].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
							//Non normal, non inverted become normal (catch all)
							else if(pc.breastRows[x].nippleType != GLOBAL.NIPPLE_TYPE_INVERTED && pc.breastRows[x].nippleType != GLOBAL.NIPPLE_TYPE_NORMAL) pc.breastRows[x].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
						}
						changes++;
					}
					else kGAMECLASS.output("\n\n" + pc.nippleTypeLockedMessage());
				}
				//Girlygoo
				if(changes < changeLimit && rand(3) == 0 && target.girlCumType != GLOBAL.FLUID_TYPE_GIRLCUM && target.hasVagina())
				{
					if(target.girlCumTypeUnlocked(GLOBAL.FLUID_TYPE_GIRLCUM))
					{
						kGAMECLASS.output("\n\nA twinge of discomfort in your [pc.vaginas] passes in a heartbeat, causing you to reach down in a panic. Fortunately, nothing feels that different down there, though when you bring your fingers back up, you realize that <b>your [pc.girlCum] has been replaced with clear, terran lubricant.</b>");
						target.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
						changes++;
					}
					else kGAMECLASS.output("\n\n" + target.girlCumTypeLockedMessage());
				}
				//Milk!
				if(changes < changeLimit && rand(3) == 0 && target.milkType != GLOBAL.FLUID_TYPE_MILK && target.canLactate())
				{
					if(target.milkTypeUnlocked(GLOBAL.FLUID_TYPE_MILK))
					{
						kGAMECLASS.output("\n\nYour feel an unusual tightness in your [pc.chest], and then, without warning, you let down, dribbling [pc.milk] all over yourself. You dab at it in a panic, noticing that the longer it goes on, the more you appear to be lactating traditional terran milk. You sigh with relief when your [pc.nipples] finally stop leaking. <b>You now have normal, terran breast-milk.</b>");
						target.milkType = GLOBAL.FLUID_TYPE_MILK;
						changes++;
					}
					else kGAMECLASS.output("\n\n" + target.girlCumTypeLockedMessage());
				}
				//Change arm type to human
				if(pc.armType != GLOBAL.TYPE_HUMAN && changes < changeLimit && rand(3) == 0)
				{
					if (target.armTypeUnlocked(GLOBAL.TYPE_HUMAN))
					{
						kGAMECLASS.output("\n\nYour arms begin to itch, your fingers twitching erratically as their shape stretches and tightens, forming a short nail at the tip of each finger. By the time you regain control of your hands, <b>you’ve got human-like arms</b>.");
						pc.armType = GLOBAL.TYPE_HUMAN;
						pc.clearArmFlags();
						changes++;
					}
					else kGAMECLASS.output("\n\n" + target.armTypeLockedMessage());
				}
				//Change leg-type to bipedal human
				if((pc.legType != GLOBAL.TYPE_HUMAN || pc.legCount != 2) && changes < changeLimit && rand(3) == 0 /*&& pc.armType == GLOBAL.TYPE_HUMAN*/)
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
					else kGAMECLASS.output("\n\n" + target.legTypeLockedMessage());
				}
				//Lose tails. 
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

						pc.removeTails();
						changes++;
					}
					else kGAMECLASS.output("\n\n" + target.tailTypeLockedMessage());
				}
				//Ears:
				if(pc.earType != GLOBAL.TYPE_HUMAN && changes < changeLimit && rand(4) == 0)
				{
					if (target.earTypeUnlocked(GLOBAL.TYPE_HUMAN))
					{
						kGAMECLASS.output("\n\nYou hear a ringing in your [pc.ears], drowning out all other sounds as your ears adjust their size and position. By the time the ringing stops, <b>you’ve got human-like ears on the sides of your head</b>.");
						pc.earType = GLOBAL.TYPE_HUMAN;
						target.clearEarFlags();
						pc.earLength = 0;
						changes++;
					}
					else kGAMECLASS.output("\n\n" + target.earTypeLockedMessage());
				}
				//Tongue:
				if(pc.tongueType != GLOBAL.TYPE_HUMAN && changes < changeLimit && rand(4) == 0)
				{
					if(pc.tongueTypeUnlocked(0))
					{
						kGAMECLASS.output("\n\nYour tongue feels thick in your mouth, morphing into a rounded, slightly tapered shape. <b>You have a human tongue</b>.");
						changes++;
						pc.tongueType = GLOBAL.TYPE_HUMAN;
						pc.clearTongueFlags();
					}
					else kGAMECLASS.output("\n\n" + pc.tongueTypeLockedMessage());
				}
				//Horns/antennae:
				if((pc.hasHorns() || pc.hasAntennae()) && rand(4) == 0 && changes < changeLimit)
				{
					if((pc.hasHorns() && pc.hornsUnlocked(0)) || (pc.hasAntennae() && pc.antennaeUnlocked(0)))
					{
						kGAMECLASS.output("\n\nThere’s a sucking feeling on the top of your head, as it draws its extra appendages inward. By the time it’s done, <b>your ");
						if(pc.hasHorns()) 
						{
							kGAMECLASS.output("[pc.horns]");
							if(pc.horns == 1) kGAMECLASS.output(" is");
							else kGAMECLASS.output(" are");
							pc.removeHorns();
						}
						else
						{
							kGAMECLASS.output("[pc.antennae]");
							if(pc.antennae == 1) kGAMECLASS.output(" is");
							else kGAMECLASS.output(" are");
							pc.removeAntennae();
						}
						kGAMECLASS.output(" gone</b>.");
						changes++;
					}
					else if(pc.hasAntennae() && pc.antennaeUnlocked(0))
					{
						kGAMECLASS.output("\n\n" + pc.hornsLockedMessage());
					}
					else
					{
						kGAMECLASS.output("\n\n" + pc.antennaeLockedMessage());
					}
				}
				//Wings:
				if(pc.wingType != 0 && rand(4) == 0 && changes < changeLimit)
				{
					if(pc.wingTypeUnlocked(0))
					{
						if(pc.wingType == GLOBAL.TYPE_SHARK) kGAMECLASS.output("\n\nYour back feels uncomfortable, like something is stabbing you between your shoulder blades. You look behind you to see your [pc.wing] is being drawn into your back, soon vanishing entirely. <b>You no longer have a [pc.wing]</b>!");
						else kGAMECLASS.output("\n\nYour back feels uncomfortable, like you’re molting. You look behind you to see your [pc.wings] being drawn into your back, soon vanishing entirely. <b>You no longer have wings</b>!");
						changes++;
						pc.removeWings();
					}
					else kGAMECLASS.output("\n\n" + pc.wingTypeLockedMessage());
				}
				
				// Clean up possible left over wing counts
				if (pc.wingType == 0 && pc.wingCount != 0)
				{
					pc.wingCount = 0;
				}
				
				//Eyes:
				if(pc.eyeType != GLOBAL.TYPE_HUMAN && changes < changeLimit && rand(4) == 0)
				{
					if(pc.eyeTypeUnlocked(GLOBAL.TYPE_HUMAN))
					{
						kGAMECLASS.output("\n\nYour vision flickers like a camera hit with a burst of static, staggering you as you grab your forehead in pain. After a few seconds the feeling subsides, but it takes a good while longer for you to adjust to the change in vision from <b>your new human-like eyes</b>.");
						changes++;
						pc.eyeType = GLOBAL.TYPE_HUMAN;
					}
					else kGAMECLASS.output("\n\n" + pc.eyeTypeLockedMessage());
				}
				
				//Hair
				if(pc.hasHair() && pc.hairType != GLOBAL.HAIR_TYPE_REGULAR && changes < changeLimit && rand(4) == 0)
				{
					if(pc.hairTypeUnlocked(GLOBAL.HAIR_TYPE_REGULAR))
					{
						kGAMECLASS.output("\n\nYour scalp itches, the [pc.hair] covering it falling away as a mass of new filaments sprouts in their place. <b>You have hair!</b>");
						changes++;
						pc.hairType = GLOBAL.HAIR_TYPE_REGULAR;
					}
					else kGAMECLASS.output("\n\n" + pc.hairTypeLockedMessage());
				}
				
				//Beard
				if(pc.hasBeard() && pc.beardType != GLOBAL.HAIR_TYPE_REGULAR && changes < changeLimit && rand(4) == 0)
				{
					if(pc.beardTypeUnlocked(GLOBAL.HAIR_TYPE_REGULAR))
					{
						kGAMECLASS.output("\n\nYour face itches and you go to scratch your [pc.beard]. In its place, however, you find that it is instead covered in course, yet normal-feeling, hair. <b>You now have regular facial hair!</b>");
						changes++;
						pc.beardType = GLOBAL.HAIR_TYPE_REGULAR;
					}
					else kGAMECLASS.output("\n\n" + pc.beardTypeLockedMessage());
				}
				
				//Lose "Mane" Perk:
				if(pc.hasHair() && pc.hasPerk("Mane") && changes < changeLimit && rand(3) == 0)
				{
					kGAMECLASS.output("\n\nYou feel the hairline on the back of your neck receding to something more in line with the back of your head. <b>You no longer have a mane.</b>");
					kGAMECLASS.output("\n\n(<b>Perk Lost: Mane</b>)");
					changes++;
					pc.removePerk("Mane");
				}
				
				//Lose "Latex Hair" Effect:
				if(pc.hasHair() && pc.hasStatusEffect("Latex Hair") && changes < changeLimit && rand(3) == 0)
				{
					kGAMECLASS.output("\n\nYour head tingles and you run your fingers through your hair. Quickly, the squeaky surface begins to soften and change, turning into something a little more natural. <b>Your hair has lost its latex properties!</b>");
					changes++;
					pc.removeStatusEffect("Latex Hair");
				}
				
				//Lose Fluff
				if (pc.hasSkinFlag(GLOBAL.FLAG_FLUFFY) && changes < changeLimit && rand(3) == 0)
				{
					kGAMECLASS.output("\n\nThe fluff of fur " + (pc.biggestTitSize() > 2 ? "nestled between your breasts" : "poofing out your chest") + " loses its warmth and volume as it shrivels up and sheds off you, leaving behind bare [pc.skinFurScalesNoun]. <b>You have lost your fuzzy fur ball.</b>");
					
					pc.removeSkinFlag(GLOBAL.FLAG_FLUFFY);
					changes++;
				}
				
				//Lose "Regal Mane" Perk:
				if(pc.hasPerk("Regal Mane") && changes < changeLimit && rand(3) == 0)
				{
					kGAMECLASS.output("\n\nA tingling sensation suddenly rushes through the base of your mane. Like a pile of dying weeds, it quickly droops down and falls off your shoulders. When the feeling subsides, your shoulders seem a bit lighter around the collar. <b>You no longer have a royal-looking mane around your neck.</b>");
					kGAMECLASS.output("\n\n(<b>Perk Lost: Regal Mane</b>)");
					changes++;
					pc.removePerk("Regal Mane");
				}
				
				if (pc.hasPerk("Hollow Bones") && changes < changeLimit && rand(3) == 0)
				{ // racialPerkUpdateCheck: removal of Icy Veins perk with the loss of fluffy fur (fork on still having fur but not fluffy flag?).
					kGAMECLASS.output("\n\nYou feel somewhat heavy and clumsy as your bones turn solid again, losing their hollow avian structure.");
					kGAMECLASS.output("\n\n(<b>Perk Lost: Hollow Bones</b>)");
					changes++;
					pc.removePerk("Hollow Bones");
				}
				
				if (pc.hasPerk("Nyrea Eggs") && changes < changeLimit && rand(3) == 0)
				{
					kGAMECLASS.output("\n\nYou are interrupted by a shifting in your insides as a bubbling sensation fills your loins, and then... nothing. Strangely, you feel as if something has changed. Double-checking your codex, you find that your [pc.cumNoun] is no longer capable of producing eggs");
					if(pc.fertility() > 0) kGAMECLASS.output(" as it once had");
					if(pc.hasStatusEffect("Nyrea Eggs"))
					{
						kGAMECLASS.output("... at least not permanently so");
						pc.setStatusValue("Nyrea Eggs", 4, 0);
					}
					kGAMECLASS.output(".");
					kGAMECLASS.output("\n\n(<b>Perk Lost: Nyrea Eggs</b>)");
					pc.removePerk("Nyrea Eggs");
					changes++;
				}
				
				//Lose "Special Scrotum" Effect:
				if(pc.balls > 0 && pc.hasStatusEffect("Special Scrotum") && changes < changeLimit && rand(3) == 0)
				{
					if(pc.statusEffectv1("Special Scrotum") != 0)
					{
						kGAMECLASS.output("\n\nYour [pc.ballsack] tingles as you feel it... changing? Taking a peek, you find that <b>it is no longer " + (GLOBAL.FLAG_NAMES[pc.statusEffectv1("Special Scrotum")]).toLowerCase() + " but now bald, its surface replaced with smooth skin!</b> Well, that was to be expected... but you wonder if this look is permanent or if you’ve gotten rid of the splice entirely....");
						changes++;
						pc.setStatusValue("Special Scrotum", 1, 0);
						pc.setStatusTooltip("Special Scrotum", "");
					}
					else
					{
						kGAMECLASS.output("\n\nYour [pc.ballsack] vibrates between your [pc.thighs], signaling a major change... It " + ((pc.getStatusTooltip("Special Scrotum") != "" && pc.getStatusTooltip("Special Scrotum") != pc.skinTone) ? "looks like the colors have changed and your nutsack appears to be" : "seems like not much has changed, but your nutsack does appear") + " a bit more... normal? You check your codex and it confirms: <b>you have lost the unique properties of your special scrotum!</b>");
						changes++;
						pc.removeStatusEffect("Special Scrotum");
					}
				}
				
				//Lose Gills
				if (pc.gills && changes < changeLimit && rand(2) == 0)
				{
					kGAMECLASS.output("\n\nYou feel a tingle above your [pc.chest]. The [pc.gills] below your neck begin to close and shrink until they completly fade away. You rub the area to make certain you weren’t just imagining things and sure enough, <b>you have lost your gills.</b>");
					
					pc.gills = false;
					changes++;
				}
				
				if(changes == 0)
				{
					kGAMECLASS.output("\n\nNothing changed. What a rip-off.");
				}

			}
			//Not player!
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " eats the treats to no effect.");
			}
			return false;
		}
	}
}

