package classes.Items.Transformatives
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	
	public class HuskarTreats extends ItemSlotClass
	{
		
		//constructor
		public function HuskarTreats()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "HuskrTreat";
			//Regular name
			this.longName = "huskar treat";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a bone-shaped huskar treat";
			//Displayed on tooltips during mouseovers
			this.tooltip = "A derivative of the common Ausar Treats found in the galactic core, Huskar Treats grant the same effects as their normal kin, but adapted to the extreme cold of the Uvetan moon. In addition to normal effects, Huskar Treats cause members of both sexes to gain significant weight and thicker fur, and often grow in size. Females become <i>much</i> more curvaceous, while males gain muscle.";
			
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
		
		private function ausarStageTFs(target:Creature, changeLimit:int):int
		{
			var changes:int = 0;
			var x:int = 0;
			var y:int = 0;
			var pc:Creature = target;
			var choices:Array;
			
			//Masculine TFs
			//Get a doggy dick
			//First find an unTF'ed prick
			choices = new Array();
			for(x = 0; x < pc.cockTotal(); x++)
			{
				if(pc.cocks[x].cType != GLOBAL.TYPE_CANINE) choices[choices.length] = x;
			}
			
			//Set x to a random dick from choices
			if (choices.length > 0) x = choices[rand(choices.length)];
			
			//Else set to -1, code for NODONG NOGO
			else x = -1;
			if(changes < changeLimit && x >= 0 && rand(3) == 0)
			{
				if(target.cockTypeUnlocked(x,GLOBAL.TYPE_CANINE))
				{
					kGAMECLASS.output("\n\nYour [pc.cock " + x + "] throbs suddenly ");
					if(!pc.isCrotchExposed()) kGAMECLASS.output("beneath your [pc.lowerGarments]");
					else if(pc.legCount == 1) kGAMECLASS.output("on your [pc.leg]");
					else kGAMECLASS.output("between your [pc.legs]");
					kGAMECLASS.output(", swelling to its full size as a strange heat radiates through your body. You grab your simmering penis as the alien concoction takes effect, rewriting your most sensitive places. You double over in a sick twist of pain and pleasure");
					if(pc.cocks[x].cockColor != "bright red")
					{
						kGAMECLASS.output("as the flesh of your cock shifts color to a bright red");
					}
					if(!pc.hasCockFlag(GLOBAL.FLAG_TAPERED)) kGAMECLASS.output(", skin melding strangely into a long, pointed shape");
					kGAMECLASS.output(".");
					//if cock was less than 6 inches: 
					if(pc.cocks[x].cLength() < 6) {
						kGAMECLASS.output(" Your prick grows, too, expanding several inches from your groin.");
						pc.cocks[x].cLength(2+rand(3));
					}
					if(!pc.hasCockFlag(GLOBAL.FLAG_TAPERED)) kGAMECLASS.output(" The [pc.cockHead " + x + "] of your dick twists into a pointed tip");
					else kGAMECLASS.output(" The [pc.cockHead " + x + "] jumps");
					kGAMECLASS.output(", drooling a sticky [pc.cumColor] river from its engorged slit.");
					if(pc.balls > 0) kGAMECLASS.output(" Just over your [pc.balls]");
					else kGAMECLASS.output(" Just ahead of the base");
					kGAMECLASS.output(", your member’s flesh engorges exponentially, swelling into a thick, cum-engorged knot. With a cry, you fall to the ground as the new doggy-cock discharges its heady load, shooting a thick rope of [pc.cum] through the swollen knot and onto the ground.");
					kGAMECLASS.output("\n\nYou spend a few moments collecting yourself, cleaning the spunk off your new puppy pecker and adjusting to the heft and weight of the knot.");
					pc.changeLust(20+rand(20));
					pc.libido(2);
					changes++;
					pc.shiftCock(x,GLOBAL.TYPE_CANINE);
					//Cause ausar are too cool for sheaths.
					pc.cocks[x].delFlag(GLOBAL.FLAG_SHEATHED);
				}
				else
				{
					kGAMECLASS.output("\n\n" + target.cockTypeLockedMessage());
				}
			}
			//Dick size+ (Max: 12 inches?)
			choices = new Array();
			for(x = 0; x < pc.cockTotal(); x++)
			{
				if(pc.cocks[x].cLength() < 12) choices[choices.length] = x;
			}
			//Set x to a random dick from choices
			if(choices.length > 0) x = choices[rand(choices.length)];
			//Else set to -1, code for NODONG NOGO
			else x = -1;
			if(changes < changeLimit && x >= 0 && target.cockLengthUnlocked(x,pc.cocks[x].cLength() + 1.5) && rand(2) == 0)
			{
				kGAMECLASS.output("\n\nYou shudder as your [pc.cock " + x + "] throbs, swelling powerfully. You look down just in time to see your cockflesh expanding, sending waves of pleasure through your body. Your dick spurts a thin trickle of [pc.cum] as it grows out to its new size of ");
				pc.cocks[x].cLength(Math.round(5 + rand(10))/10);
				if(pc.hasPerk("Hung")) pc.cocks[x].cLength(Math.round(5 + rand(10))/10);
				kGAMECLASS.output(Math.round(pc.cocks[x].cLength()*10)/10 + " inches. You take a moment to marvel at your new, larger member, ready for action.");
				changes++;
				pc.changeLust(10+rand(5));
			}
			//Knot size+
			choices = new Array();
			for(x = 0; x < pc.cockTotal(); x++)
			{
				if(pc.hasKnot(x) && pc.cocks[x].knotMultiplier < 2) choices[choices.length] = x;
			}
			//Set x to a random dick from choices
			if(choices.length > 0) x = choices[rand(choices.length)];
			//Else set to -1, code for NODONG NOGO
			else x = -1;
			if(changes < changeLimit && x >= 0 && rand(3) == 0)
			{
				kGAMECLASS.output("\n\nYou feel something swelling on your [pc.cock " + x + "]’s base, straining against your sensitive flesh. Alarmed, you ");
				if(!pc.isCrotchExposed()) kGAMECLASS.output("strip");
				else kGAMECLASS.output("spread your [pc.legOrLegs]");
				kGAMECLASS.output(" and grab your knotty cock. Your bitch-breaking knot is swelling even larger, engorging with cum and blood as your own arousal peaks. You feverishly grab your wang, stroking it as quick as you can as your knot grows larger than it ever has before!");
				changes++;
				pc.changeLust(20+rand(20));
				pc.libido(.5);
				pc.cocks[x].knotMultiplier += 0.1;
			}
			//Facial Hair starts growing (Note: Minimum masculinity: 50%. No trap/shemale beards!)
			//You scratch at your chin as a sudden itch spreads across your smooth cheeks. To your surprise, your fingers brush across a downy-smooth stubble! You quickly grab your codex, looking in its reflective screen to watch as a thin layer of full beard creeps up off of your cheeks. You have a beard now!

			//Grow facial hair
			//You scratch at your chin as a sudden itch spreads across your bearded face. Your beard feels an awful lot thicker all of a sudden! 

			//Feminine TFs
			//Vaginal wetness+
			choices = new Array();
			for(x = 0; x < pc.vaginaTotal(); x++)
			{
				if(pc.wetness(x) < 3) choices[choices.length] = x;
			}
			//Set x to a random cooch from choices
			if(choices.length > 0) x = choices[rand(choices.length)];
			//Else set to -1, code for NOGO
			else x = -1;
			if(changes < changeLimit && x >= 0 && rand(3) == 0)
			{
				kGAMECLASS.output("\n\nYou shudder violently as waves of pleasure suddenly shoot up through your loins. A flush of wetness pours down your [pc.legOrLegs] as your cunt contracts rhythmically, drooling a steady river of [pc.girlCum] - more than you’re used to producing. You shudder and sigh as your cunny nearly orgasms, just cresting the peaks of pleasure before the excess lube finally dissipates. Still, you feel a whole lot wetter than usual. You could definitely handle bigger cocks and toys now.");
				pc.changeLust(20+rand(20));
				pc.vaginas[x].wetness(1);
				changes++;
			}
			/*
			//Vaginal looseness+
			choices = new Array();
			for(x = 0; x < pc.vaginaTotal(); x++)
			{
				if(pc.looseness(x) < 3) choices[choices.length] = x;
			}
			//Set x to a random cooch from choices
			if(choices.length > 0) x = choices[rand(choices.length)];
			//Else set to -1, code for NOGO
			else x = -1;
			if(changes < changeLimit && x >= 0 && rand(3) == 0)
			{
				kGAMECLASS.output("\n\nYou feel a rumbling in your gut and a strange half-pleasure sensation spreading up from your cunt. Giving your muff an experimental poke, your fingers practically fall into the chasm of your femininity. It’s way looser than it was before!");
				pc.vaginas[x].minLooseness++;
				if(pc.looseness(x) < pc.vaginas[x].minLooseness) pc.vaginas[x].looseness(pc.vaginas[x].minLooseness,true);
				pc.lust(10+rand(4));
				changes++;
			}
			*/
			//Breasts up to DD-cup
			//**Same as Zil TF, I guess?
			if(pc.hasVagina() && changes < changeLimit && pc.biggestTitSize() < 4 && rand(3) == 0)
			{
				if (target.breastRatingUnlocked(0, pc.breastRows[0].breastRatingRaw+1))
				{
					pc.breastRows[0].breastRatingRaw++;
					changes++;
					//Breasts up to DD-cup
					//No titties yet
					if(pc.breastRows[0].breastRatingRaw < 1)
					{
						//Covered
						if(!pc.isChestExposed()) kGAMECLASS.output("\n\nOut of nowhere, you can feel your [pc.nipples] pressing against your [pc.upperGarment]. You squirm uncomfortably in a self-imposed prison as your chest expands, swelling new, soft flesh into a pair of budding breasts where once you had nothing but pectorals. <b>You have A-cup breasts.</b>");
						//Unclothed
						else kGAMECLASS.output("\n\nYou involuntarily gasp when your chest warms out of nowhere. One second, you’re normal. The next, it’s like you’ve been sunbathing with only your pecs exposed for a few hours. Your [pc.skin] tingles as its pulled tight by something expanding underneath it, and you’re treated to the sight of <b>your new A-cup breasts.</b>");
					}
					//->B/C/D
					else if(pc.breastRows[0].breastRatingRaw < 5)
					{
						kGAMECLASS.output("\n\nPinpricks of sensation on your [pc.chest] draws your attention, and the way your chest is bubbling up with new flesh keeps it. Grabbing hold of your swelling bustline, you heft the brazenly expanding globes as they finish their transformation. <b>You estimate you’ve grown up to " + pc.breastCup(0) + ".</b>");
						if(pc.bRows() > 1)
						{
							kGAMECLASS.output(" Your other breast row");
							if(pc.bRows() == 2) kGAMECLASS.output(" doesn’t");
							else kGAMECLASS.output("s didn’t");
							kGAMECLASS.output(" change.");
						}
					}
					//->DD
					else
					{
						kGAMECLASS.output("\n\nYou feel electric shocks of pleasure spread out from your core and into your [pc.chest], gathering into hot, powerful pulses on your [pc.nipples]. Taking hold of yourself, you feel your flesh pulsing to an unknown rhythm, swelling out and then shrinking in a little, each time getting a little bigger - a little jigglier and more expansive. <b>You have big, DD-cup breasts now; that’s about as big as an ausar would get.");
					}
				}
				else kGAMECLASS.output("\n\n" + pc.breastRatingLockedMessage());
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
			if((pc.armType != GLOBAL.TYPE_CANINE || !target.hasArmFlag(GLOBAL.FLAG_FURRED)) && changes < changeLimit && rand(3) == 0)
			{
				if (target.armTypeUnlocked(GLOBAL.TYPE_CANINE))
				{
					kGAMECLASS.output("\n\nYou feel a powerful itch spread across your arms. You clutch at them, scratching violently as your hair grows and thickens, spreading out into a dark mat across your [pc.skin]. Within a few minutes, your arms are utterly covered in a thick, silky-smooth " + pc.furColor + " fur! At least you’ll keep a little warmer, now....");
					pc.armType = GLOBAL.TYPE_CANINE;
					pc.clearArmFlags();
					pc.addArmFlag(GLOBAL.FLAG_FURRED);
					changes++;
				}
				else kGAMECLASS.output("\n\n" + target.armTypeLockedMessage());
			}
			//Change leg-type to furred (Needs Bipedal legs)
			if((pc.legType != GLOBAL.TYPE_CANINE || !target.hasLegFlag(GLOBAL.FLAG_FURRED)) && changes < changeLimit && pc.legCount >= 2 && rand(3) == 0 && pc.armType == GLOBAL.TYPE_CANINE)
			{
				if (target.legTypeUnlocked(GLOBAL.TYPE_CANINE))
				{
					kGAMECLASS.output("\n\nYou feel a powerful itch spread across your [pc.legs]. You clutch at them, scratching violently as your hair grows and thickens, spreading out into a dark mat across your [pc.skin]. Within a few minutes, your legs are utterly covered in a thick, silky-smooth " + pc.furColor + " fur! At least you’ll keep a little warmer <b>with your ausar legs.</b>");
					pc.legType = GLOBAL.TYPE_CANINE;
					pc.clearLegFlags();
					pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
					pc.addLegFlag(GLOBAL.FLAG_FURRED);
					pc.addLegFlag(GLOBAL.FLAG_PAWS);
					changes++;
				}
				else kGAMECLASS.output("\n\n" + target.legTypeLockedMessage());
			}
			//Change leg type to bipedal?
			if(pc.legCount != 2 && changes < changeLimit && rand(3) == 0 && pc.armType == GLOBAL.TYPE_CANINE)
			{
				if (target.legTypeUnlocked(GLOBAL.TYPE_CANINE))
				{
					if(pc.legCount < 2)
					{
						kGAMECLASS.output("\n\nYour [pc.leg] wobbles then folds, dropping you onto your [pc.butt]. It thrashes wildly around, uncontrolled and spasmatic. Something inside is changing, and you’re helpless to do anything but clench your fists and hold on for the ride. A seam appears in your [pc.leg] a moment before it divides into two leg-like shapes. Fur springs up all over them, and after a few seconds, you’re left with two fur-covered thighs, knees, and feet. <b>You have two ausar legs!</b>");
					}
					//More than biped
					else
					{
						kGAMECLASS.output("\n\nYour [pc.legs] wobble and then fold, dropping you flat on your [pc.butt]. They thrash wildly, so fast you can barely track them, then collide. This time, they stick together, reshaping into two distinct, bipedal legs. Fur springs up over the new limbs, and by the time it finishes, <b>you’ve grown ausar-like legs.</b>");
					}
					pc.legCount = 2;
					pc.genitalSpot = 0;
					pc.legType = GLOBAL.TYPE_CANINE;
					pc.clearLegFlags();
					pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
					pc.addLegFlag(GLOBAL.FLAG_FURRED);
					pc.addLegFlag(GLOBAL.FLAG_PAWS);
					changes++;
				}
				else kGAMECLASS.output("\n\n" + target.legTypeLockedMessage());
			}
			//Grow doggy tail -- you know what, fuck you, use the CoC Dogtail growth texts. 
			if(pc.tailType != GLOBAL.TYPE_CANINE && changes < changeLimit && rand(4) == 0)
			{
				if (target.tailTypeUnlocked(GLOBAL.TYPE_CANINE))
				{
					// If PC had a tail before:
					if(pc.tailCount == 1) kGAMECLASS.output("\n\nYou feel something itching on your [pc.tail]. Twisting around, you watch in a mix of horror and excitement as " + pc.furColor + " bristles, the beginnings of a thick coat of fur, sprout up across the length of your reforming posterior appendage. It starts wagging as the change completes, <b>leaving you with an ausar’s dog-like tail.</b>");
					//Multitails
					else if(pc.tailCount == 2) kGAMECLASS.output("\n\nYour [pc.tails] knot together, torturing you with brief convulsions. A kind of numb heat spreads through them, forcing you to twist about for a visual inspection. They’re merging together into a single, narrow entity. The flesh crawls eerily as it assume its new shape. Hairs sprout out of it while you watch, thickening into a coat of fur. <b>Your [pc.tails] have combined into a single ausar tail.</b>");
					// If PC is tailless peasant:
					else
					{
						kGAMECLASS.output("\n\nOuch! A knot of discomfort forms just above your [pc.butt] as if it had suffered a nasty sting or bite, but no such injury occured. You twist for a look at it");
						if(!pc.isCrotchExposed()) kGAMECLASS.output(", peeling back your [pc.underGarments]");
						kGAMECLASS.output(". There’s a raised, irritated lump there, and it’s getting bigger. Wiggling slightly, it extends as new bones form within it, gently wagging as it lengthens. You’re growing a tail! Fine hairs sprout on its [pc.skin], giving it a distinctly canine cast. When it finishes growing, it’s long enough to lazily swish back and forth; <b>you’ve obviously gained an ausar’s tail.</b>");
					}
					pc.tailCount = 1;
					pc.tailType = GLOBAL.TYPE_CANINE;
					pc.clearTailFlags();
					pc.addTailFlag(GLOBAL.FLAG_LONG);
					pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
					pc.addTailFlag(GLOBAL.FLAG_FURRED);
					changes++;
				}
				else kGAMECLASS.output("\n\n" + target.tailTypeLockedMessage());
			}
			//Grow wolf ears
			if(pc.earType != GLOBAL.TYPE_CANINE && changes < changeLimit && rand(4) == 0)
			{
				if (target.earTypeUnlocked(GLOBAL.TYPE_CANINE))
				{
					kGAMECLASS.output("\n\nYour ears begin to itch uncontrollably. You desperately try to scratch at them, but the itch spreads and grows... as do your ears! Your ears twist and morph, growing a thin layer of " + pc.furColor + " fur as they reshape into a pair of perky points, towering over your head. You experimentally move them, feeling them perk and flop at your command. And you can hear so much better than before, every slight creak and rustle around you is so clear now! <b>You now have an ausar’s wolf-ears!</b>");
					pc.earType = GLOBAL.TYPE_CANINE;
					target.clearEarFlags();
					target.addEarFlag(GLOBAL.FLAG_TAPERED);
					target.addEarFlag(GLOBAL.FLAG_FURRED);
					changes++;
				}
				else kGAMECLASS.output("\n\n" + target.earTypeLockedMessage());
			}
			
			return changes;
		}
		
		public function huskarStageTFs(target:Creature, changeLimit:int):int
		{
			var changes:int = 0;
			
			// Get floppy doggie ears
			if (target.earType == GLOBAL.TYPE_CANINE && rand(4) == 0)
			{
				if (target.earTypeUnlocked(GLOBAL.TYPE_DOGGIE))
				{
					output("\n\nYour canine-shaped ears each develop an itch, spreading from base to tip. You feel them")
					if(target.earLength <= 4) output(" elongate a bit and")
					else if(target.earLength > 12) output(" shorten some and")
					output(" gradually loosen. With a few twitches of your ear muscles, you find that your ears are capable of a lot more expression than before. You can make them perk up when alert, fold back when cautious, or droop down when at rest, and with much less effort now. Their shape rounds out slightly, losing the anubis-like triangle for a look that is less intimidating to strangers. <b>Your canine ears are now floppy dog ears!</b>");
					
					target.earType = GLOBAL.TYPE_DOGGIE;
					target.clearEarFlags();
					target.addEarFlag(GLOBAL.FLAG_FURRED);
					target.addEarFlag(GLOBAL.FLAG_FLOPPY);
					if(target.earLength <= 4) target.earLength = 3 + rand(2);
					if(target.earLength > 12) target.earLength = 12;
					changes++;
				}
				else output("\n\n" + target.earTypeLockedMessage());
			}
			
			if (target.hasArmFlag(GLOBAL.FLAG_FURRED) && !target.hasArmFlag(GLOBAL.FLAG_FLUFFY) && changes < changeLimit && rand(2) == 0)
			{
				output("\n\nYou feel a powerful itch spread across your arms. You clutch at them, scratching violently as the fur covering your arms lengthens dramatically. Within a few minutes, your arms are utterly covered in a thick, fluffy layer of " + target.furColor + " fur! At least you’ll keep even warmer, now....");
				
				target.addArmFlag(GLOBAL.FLAG_FLUFFY);
				changes++;
			}
			
			if (target.hasLegFlag(GLOBAL.FLAG_FURRED) && !target.hasLegFlag(GLOBAL.FLAG_FLUFFY) && changes < changeLimit && rand(2) == 0)
			{
				output("\n\nYour [pc.legs] throb something fierce, an annoying wave of pressure underneath your skin just pushing and pushing. You rub them firmly, trying to push the feeling away - it works too; a firm hand down the front of your [pc.leg] seems to pull a thicker, fluffier coat of fur along with it!");
				
				target.addLegFlag(GLOBAL.FLAG_FLUFFY);
				changes++;
			}
			
			if (!target.hasSkinFlag(GLOBAL.FLAG_FLUFFY) && changes < changeLimit && rand(2) == 0)
			{
				output("\n\nThe [pc.skinFurScales] of your chest feels flush, warmth radiating out from the center to slowly encompass");
				if (target.biggestTitSize() <= 0) output(" most of your upper body");
				else output(" your [pc.chest]");
				output(".");
				if (!target.isChestExposed()) output(" You quickly peel your [pc.upperGarment] open, fresh air soothing your inflamed flesh momentarily");
				else output(" You rub at your inflamed flesh trying in vain to push the dull throb out of your chest");
				if (target.skinType == GLOBAL.SKIN_TYPE_FUR)
				{
					output(". The dull ache makes way to a tickle of rapidly growing fur, your [pc.chest]’s fuzzy covering quickly poofing out into a fluffy ball of fur");
					if (target.biggestTitSize() > 2) output(" nestled between your [pc.breasts]!");
					else output(" poofing out your chest!");
				}
				else
				{
					output(", before the tickle of fluffy fur budding across your chest takes over from the dull aching. The sprouting fur grows and grows, building into an impressively fluffy ball of fur");
					if (target.biggestTitSize() > 2) output(" nestled between your [pc.breasts]!");
					else output(" poofing out your chest!");
				}
				
				target.addSkinFlag(GLOBAL.FLAG_FLUFFY);
				changes++;
			}
			
			if (target.thickness < 75 && target.thicknessUnlocked(target.thickness + 5) && changes < changeLimit && rand(2) == 0)
			{
				output("\n\nA certain heaviness sets into your limbs, a growing sense of sluggishness slowing your movements. Your [pc.gear] suddenly feels a little tighter too, you realize. You give yourself a proper once-over and realize you’re a little... thicker all around!");
				
				target.thickness += 5;
				if (target.thickness > 75) target.thickness = 75;
				
				var bButt:Boolean = false;
				var bHips:Boolean = false;
				
				if (target.buttRatingRaw < 10)
				{
					target.buttRatingRaw += 1;
					bButt = true;
				}
				if (target.hipRatingRaw < 10)
				{
					target.hipRatingRaw += 1;
					bHips = true;
				}
				
				if (bButt)
				{
					output(" Even your ass feels a little more plump!");
				}
				else
				{
					output(" Even your hips feel a little wider!");
				}
				
				changes++;
			}
			
			if (
			(	(target.hasSkinFlag(GLOBAL.FLAG_FLUFFY) && !target.hasPerk("Regal Mane"))
			||	(target.hasPerk("Regal Mane") && target.perkv1("Regal Mane") != GLOBAL.FLAG_FURRED)
			) && changes < changeLimit && rand(3) == 0)
			{
				if(!target.hasPerk("Regal Mane"))
				{
					output("\n\nA tingling sensation spreads from just below your nape, atop your shoulders and across your collar bone. The fluffy ball of fur on your chest vibrates as if it knows what is going on... Suddenly, a wave of [pc.furColor] fur poofs around your neck like a royal mane, the exciting feeling now replaced by something snuggly and warm. <b>You have grown a fluffy collar of fur to accompany the ball on your chest!</b>");
					
					// Cosmetic Perk: "Regal Mane"
					// v1: Mane appearance type (set by global type flag)
					target.createPerk("Regal Mane", GLOBAL.FLAG_FURRED, 0, 0, 0, "You have an impressive mane bordering your neck.");
				}
				else
				{
					output("\n\nA tingling sensation suddenly rushes through the base of your mane. Like a pile of dying weeds, it quickly droops down and falls off your shoulders... rapidly being replaced by a newer, furrier and fluffier, [pc.furColor] mane. <b>You now have a fluffy collar of fur around your neck!</b>");
					
					target.setPerkValue("Regal Mane", 1, GLOBAL.FLAG_FURRED);
				}
				changes++;
			}
			
			return changes;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var changes:int = 0;
			var changeLimit:int = 1;
			
			kGAMECLASS.clearOutput();
			
			if(target is PlayerCharacter) {
				//Usage text:
				kGAMECLASS.output("You pop the bone-shaped cookie into your mouth. It’s pleasantly chewy and chocolatey, though as you swallow it, you find yourself panting and scratching at your ears. Weird.");
				
				if (((target.race() == "half-ausar" && !target.hasLegFlag(GLOBAL.FLAG_FURRED) && !target.hasArmFlag(GLOBAL.FLAG_FURRED)) || target.race().indexOf("ausar") == -1) && target.race().indexOf("huskar") == -1)
				{
					if(rand(2) == 0) changeLimit++;
					if(rand(3) == 0) changeLimit++;
					if(rand(4) == 0) changeLimit++;
					if(rand(5) == 0) changeLimit++;
			
					changes = ausarStageTFs(target, changeLimit);
				}
				else if (target.race().indexOf("ausar") != -1 || target.race().indexOf("huskar") != -1)
				{
					if(rand(3) == 0) changeLimit++;
					if(rand(4) == 0) changeLimit++;
					
					changes = huskarStageTFs(target, changeLimit);
				}
				
				if (changes == 0)
				{
					output("\n\nNothing changed. What a rip-off.");
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

