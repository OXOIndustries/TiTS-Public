package classes.Items.Miscellaneous
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class HorsePill extends ItemSlotClass
	{
		//constructor
		public function HorsePill()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			
			//Used on inventory buttons
			this.shortName = "HorsePill";
			
			//Regular name
			this.longName = "literal horse pill";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a literal horse pill";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "True to its name, this pill is large enough you have to question how anything short of a terran work-horse would manage it. It's more of a gel-capsule than a proper pill, you suppose. The mixture of hormones, microscopic robots, and chemicals is a dull brown, utterly plain except for an embossed manufacturer label on the side. It reads, <i>\"Equinum.\"</i> What a stupid name for a transformation drug. A little research turns up that it's a slow-acting but potent transformative. <b>The effects take up to twelve hours to fully manifest.</b>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 1500;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var changes:int = 0;
			var changeLimit:int = 1;
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			if(rand(3) == 0) changeLimit++;
			if(rand(3) == 0) changeLimit++;
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				//Consume:
				kGAMECLASS.output("With more than a little bit of discomfort, you knock back the pill. It weighs heavy in your belly, but nothing changes just yet. The effects are supposed to take some time to manifest.");
				if(target.hasTail()) kGAMECLASS.output(" You flick your " + target.tailsDescript() + " in irritation, waiting.");
				//Already under the effects? Strengthen and reset cooldown
				if(target.hasStatusEffect("Horse Pill"))
				{
					//If already under effects, refill timer to shortly before next change
					target.setStatusMinutes("Horse Pill",680+rand(10));
					//Increment odds of bigass changes!
					if(target.statusEffectv2("Horse Pill") < 4) target.addStatusValue("Horse Pill",2,1);
				}
				//Initial horsepill setup.
				else
				{
					target.createStatusEffect("Horse Pill",720,1,0,0, false,"Pill", "You are under the effects of at least one horse pill. Flashes of heat and tingly sensations randomly run across your body as you're slowly transformed into a more equine shape.",false,720);
				}
				
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " swallows the pill to no effect.");
			}
			return false;
		}
		public function pillTF(done:Boolean = false):void
		{
			kGAMECLASS.eventBuffer += "\n\n<u>The horse pills have an effect....</u>";
			var oddsOfBigTF:int = kGAMECLASS.chars["PC"].statusEffectv2("Horse Pill") * 20;
			if(oddsOfBigTF >= rand(100) + 1)
			{
				bigHorsePillMutations(kGAMECLASS.chars["PC"]);
			}
			else smallHorsePillMutations(kGAMECLASS.chars["PC"]);
			if(done) kGAMECLASS.eventBuffer += "\n\n<b>Your body calms down. The pills must have worn off.</b>";
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.mainGameMenu);
		}
		public function lastPillTF():void {
			pillTF(true);
			kGAMECLASS.mainGameMenu();
		}
		private function smallHorsePillMutations(target:Creature):void
		{
			var msg:String = "";
			var totalTFs:Number = target.statusEffectv2("Horse Pill");
			if(totalTFs == 0) totalTFs = 1;
			//Used to hold the TF we pull out of the array of effects
			var select:int = 0;
			var x:int = 0;
			//Build a list of all potential TFs
			var TFList:Array = new Array();
			//#1 Make dick a quarter inch longer.
			if(target.hasCock() && (target.shortestCockLength() < 12 || (target.shortestCockLength() < 19 && target.hasPerk("Hung"))))
			{
				TFList[TFList.length] = 1;
				TFList[TFList.length] = 1;
				TFList[TFList.length] = 1;
			}
			//#2 Make balls one to two tenths of an inch bigger.
			if(target.hasCock() && target.balls > 0 && target.ballSizeRaw < 4)
				TFList[TFList.length] = 2;
			//#3 Shrink enormous balls
			if(target.balls > 0 && target.ballSizeRaw >= 6)
				TFList[TFList.length] = 3;
			//#4 Increase wetness by a very small amount.
			if(target.hasVagina() && target.lowestWetness() <= 2.5)
				TFList[TFList.length] = 4;
			//#5 Increase clit size towards .75 by .1
			if(target.hasVagina() && target.totalClits() > 0 && target.clitLength < 0.75)
				TFList[TFList.length] = 5;
			//#6 Decrease hueg boobs.
			if(target.biggestTitSize() >= 7)
				TFList[TFList.length] = 6;
			//#7 Make a skoch dumber to a minimum of 25% of max
			if(target.intelligence() / target.intelligenceMax() > 0.25)
				TFList[TFList.length] = 7;
			//#8 Increase physique by .25 to max
			if(target.physique() < target.physiqueMax())
				TFList[TFList.length] = 8;
			//#9 Reduce willpower to 33% of max.
			if(target.willpower() / target.willpowerMax() > 0.33)
				TFList[TFList.length] = 9;
			//#10 Remove horns
			if(target.hasHorns())
				TFList[TFList.length] = 10;
			//#11 Remove antennae
			if(target.hasAntennae())
				TFList[TFList.length] = 11;
			//#12 Grow hair length to 6"
			if(target.hairType == GLOBAL.HAIR_TYPE_REGULAR && target.hairLength < 6)
				TFList[TFList.length] = 12;
			//#13 Mane? YES LETS FUCKING CALL IT A MANE!
			if(!target.hasPerk("Mane"))
				TFList[TFList.length] = 13;
			//#14 Vag capacity! Req's horsecunt
			if(hasAHorseCuntNeedingRoom(target))
				TFList[TFList.length] = 14;
			//#15 +1-4" height to a max of 6'11" for dicked and 6' for undicked.
			if((target.hasCock() && target.tallness < 83) || target.tallness < 72)
				TFList[TFList.length] = 15;
			//#0 DEFAULT CATCH ALL!
			if(TFList.length == 0) TFList[TFList.length] = 0;

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
					msg += "You find yourself fantasizing about frolicking through an open field, munching on grass, and fucking. The imagery is base and simple, befitting of someone who is a few doses from becoming an animal themselves.";

				}
				//#1 Make dick a quarter inch longer.
				else if(select == 1) 
				{
					if (target.cockLengthUnlocked(target.shortestCockIndex(), target.shortestCockLength() + 0.25))
					{
						x = target.shortestCockIndex();
						if(rand(3) == 0)
						{
							msg += ParseText("You adjust your package and find [pc.oneCock] a little more ");
							if(target.cocks[x].cLength() <= 8) msg += "hand-filling";
							else if(target.cocks[x].cLength() <= 15) msg += "overwhelming";
							else msg += "tremendously large";
							msg += " than before. The change is minute enough that you'd have to measure to ascertain the difference, but bigger is bigger.";
						}
						//Alternate
						else if(rand(2) == 0 && !target.isNude())
						{
							msg += ParseText("Aware of a certain tightness in your [pc.underGarments], you shift your junk. It's ever so slightly larger.");
							if(target.cocks[x].cLength() <= 10) msg += " You'll be hung like a horse in no time.";
							else if(target.cocks[x].cLength() <= 15) msg += " You'll be a stallion in no time.";
							else msg += " You'll be the biggest stud in the galactic pasture in no time.";
						}
						//Alternate 2
						else
						{
							msg += ParseText("You idly ponder the physics of four-legged sex, getting a little excited by the thought until your [pc.cocks] ");
							if(target.cockTotal() == 1) msg += "is";
							else msg += "are";
							msg += " fully erect. It's only then that you discover a quarter inch of additional length";
							if(target.cockTotal() > 1) msg += " on one of them";
							msg += ".";
						}
						target.cocks[x].cLength(0.25);
					}
					else
					{
						kGAMECLASS.output(target.cockLengthLockedMessage());
					}
				}
				//#2 Make balls one to two tenths of an inch bigger.
				else if(select == 2)
				{
					var ballGrowth:Number = 0.1 + rand(2) / 10;
					if(target.hasPerk("Bulgy")) ballGrowth *= 2;
					var newBallSize:Number = target.ballSizeRaw + ballGrowth;
					if (target.ballSizeUnlocked(newBallSize))
					{
						//1
						if(rand(3) == 0)
						{
							msg += ParseText("A muted warmth in your [pc.sack] grabs your attention, and the sensation of a small amount of additional weight keeps it. Your [pc.balls] ");
							if(target.balls == 1) msg += "is";
							else msg += "are";
							msg += " are little bigger!";
						}
						//2
						else if(rand(2) == 0)
						{
							msg += ParseText("You stop when your [pc.sack] brushes against a [pc.leg] in the most delightful way. It's been getting progressively more and more in the way over the past hour. You're pretty sure you've gotten a little bigger in the nut department - maybe one or two tenths of an inch of extra diameter. That pill was the real deal.");
						}
						//3
						else
						{
							msg += ParseText("You don't notice it immediately, but at the end of the hour, you do realize that your [pc.sack] is a little larger than before - the better to carry its weightier contents. You wonder how much bigger it's going to make ");
							if(target.cockTotal() == 1) msg += "it";
							else msg += "them";
							msg += ".";
						}
						target.ballSizeRaw = newBallSize;

						// 10% Super secret nutsplosion!
						if(rand(10) == 0 && target.ballSizeRaw < 8 && target.hasPerk("Bulgy"))
						{
							msg += ParseText("\n\nWith a slight tingling sensation building in your [pc.sack], you let out a shudder. Curious, you try to look and before you realize it, you are suddenly taken aback. The tingling increases tenfold as your [pc.balls] enlarge");
							if(target.balls == 1) msg += "s";
							msg += ", bloating up to twice the size";
							if(target.balls == 1) msg += " it was";
							else msg += " they were";
							msg += " before! <b>Your natural bulginess has rewarded you with";
							if(target.balls == 1) msg += " a larger testicle";
							else msg += " larger testicles";
							msg += "!</b>";
							newBallSize *= 2;
						}
					}
					else
					{
						msg += target.ballSizeLockedMessage();
					}
				}
				//#3 Shrink enormous balls
				else if(select == 3)
				{
					var ballMod:Number = 1.0;
					if (target.ballSizeRaw * 0.25 > 1.0) ballMod = 1.0;
					
					if (target.ballSizeUnlocked(target.ballSizeRaw - ballMod))
					{
						msg += ParseText("Walking is getting a little easier with the passage of time. In fact, you're pretty sure it's because your [pc.balls] ");
						if(target.balls == 1) msg += "is";
						else msg += "are";
						msg += " shrinking. You aren't sure how you didn't notice earlier, but ";
						if(target.balls == 1) msg += "it has";
						else msg += "they've";
						msg += " lost quite a bit of mass already. You suppress a whinny of disappointment at the realization that horses aren't supposed to have such ";
						if(target.balls == 1) msg += "a ";
						msg += "huge gonad";
						if(target.balls > 1) msg += "s";
						msg += ".";
						
						target.ballSizeRaw -= ballMod;
						
						if (target.ballSizeRaw < 6) target.ballSizeRaw = 6;
					}
					else
					{
						msg += target.ballSizeLockedMessage();
					}
				}
				//#4 Increase wetness by a very small amount.
				else if(select == 4)
				{
					if (target.wetnessUnlocked(target.lowestWetnessIndex(), target.vaginas[target.lowestWetnessIndex].wetness + 0.5))
					{
						//Multicunt
						if(target.vaginaTotal() > 1)
						{
							msg += ParseText("With the assortment of cunt you've managed to accumulate in your crotch, you find yourself wondering how any one of them is supposed to take a suitable member... something big, hard, and... bestial. Glorious, [pc.leg]-dampening moisture is your body's answer. Are you getting wetter? You slide your palm across your slick deltas. Yes, you definitely are. How wonderful!");
						}
						//Single cunt
						else
						{
							msg += "Unbidden, you find yourself wondering about how you'd take a truly horse-sized member. Would it hurt? Would you be wet enough? The ";
							if(target.isCrotchGarbed()) msg += ParseText("dampness in your [pc.lowerGarment]");
							else msg += "slight shine of moisture on your lower lips";
							msg += " seems to hint that you're getting closer. You can't resist testing your slickness with a finger. It's definitely getting wetter faster than normal.";
						}
						//Both
						msg += " It takes some effort not to masturbate on the spot.";
						x = target.lowestWetnessIndex();
						target.vaginas[x].wetness += 0.5;
						target.lust(10);
					}
					else
					{
						msg += target.wetnessLockedMessage();
					}
				}
				//#5 Increase clit size towards .75 by .1
				else if(select == 5)
				{
					if (target.clitLengthUnlocked(target.clitLength + 0.1))
					{
						target.clitLength += 0.1;
						if(target.clitLength < 0.5) target.clitLength = 0.5;
						//Single clits!
						if(target.totalClits() == 1)
						{
							msg += ParseText("Something is rubbing down... down in your crotch - in just the right way, too. You suppress a pant of delight as you wiggle your [pc.hips], squeezing your lower lips down around a noticeably engorged buzzer. Is it... is it bigger?");
							if(target.isCrotchGarbed()) msg += ParseText(" You pull open your [pc.lowerGarments] to check.");
							msg += " It definitely is; ";
							
							if(target.clitLength < 0.6) msg += "it's getting so big that it would never escape notice.";
							else msg += "it's gotten so big that it's always poking out between your lips, a little knot of nerves just waiting to be touched.";
							msg += " You're going to have to be careful how you walk if you don't want to stimulate yourself further.";
						}
						//Multiclits
						else
						{
							msg += ParseText("Something... no, multiple somethings are rubbing down below - in your crotch. It feels good too. You have to suppress a pant of delight at the sensations, but your [pc.hips] wiggle anyway, squeezing down around the sources of pleasure. Your [pc.clits] are totally erect and definitely bigger. ");
							if(target.clitLength < 0.6) msg += "Why, you're pretty sure they're so large that they'd be impossible to miss, like little pleasure-packed gumballs.";
							else msg += "There's no way they'll ever be hidden by your netherlips now - they stick out just far enough to make touching and stroking them as easy as breathing.";
							msg += " You'll have to be careful walking if you don't want to wind up jilling off on the street.";
						}
						target.lust(10);
					}
					else
					{
						msg += target.clitLengthLockedMessage();
					}
				}
				//#6 Decrease hueg boobs.
				else if(select == 6)
				{
					if (target.breastRatingUnlocked(target.biggestTitRow(), 6))
					{
						if(target.bRows() == 1) msg += ParseText("Your [pc.chest]");
						else msg += ParseText("Your [pc.fullChest]");
						msg += " feel lighter. In fact, you're pretty sure you've lost a ";
						if(target.biggestTitSize() > 10) msg += "few cup sizes";
						else msg += "cup size";
						msg += " from the change. You whicker without meaning to. Mares aren't really supposed to be that stacked anyway.";
						for(x = 0; x < target.bRows(); x++)
						{
							if(target.breastRows[x].breastRatingRaw > 10) target.breastRows[x].breastRatingRaw -= (4 + rand(3));
							else target.breastRows[x].breastRatingRaw -= 1;
						}
					}
					else
					{
						msg += target.breastRatingLockedMessage();
					}
				}
				//#7 Make a skoch dumber to a minimum of 25% of max
				else if(select == 7)
				{
					//Above 75%
					if(target.intelligence()/target.intelligenceMax() >= 0.75)
					{
						msg += "Your normally acute reason feels a little cloudy today. Concepts and abstract principles just don't want to come together into complete thoughts.";
					}
					//Above 50%
					else if(target.intelligence()/target.intelligenceMax() >= 0.5)
					{
						msg += "Ugh, you keep tripping over your thoughts. Just when one is about finished, you wind up distracting yourself with something else, like a pang of hunger from your gut or fantasies of hot, feral sex. How are you supposed to focus when.... You shake your head, uttering a quiet neigh. Where did that come from?";
					}
					//Above 25%
					else 
					{
						msg += "Your mind feels... flat... placid. Like an empty field of blowing grasses. You smile and gaze into the distance for a minute, reveling in the simple pleasure of operating mostly on instinct.";
					}
					target.intelligence(-1);
				}
				//#8 Increase physique by .25 to max
				else if(select == 8)
				{
					//Low physique! - big gains!
					if(target.physique()/target.physiqueMax() <= .33)
					{
						msg += "You feel a little sore all over, like you just competed in a triathlon, but on the other hand, you feel stronger. You flex, feeling the untapped strength in your limbs. While you're far from strong, you're definitely feeling as hale as a horse.";
						target.slowStatGain("physique",3);
					}
					//Medium physique! - small gain
					else if(target.physique()/target.physiqueMax() <= 66)
					{
						msg += "A wonderful, accomplished soreness makes itself known to you. It's the kind of feeling you get after a solid work out, the kind that lets you know you're getting fitter and stronger.";
						target.slowStatGain("physique",1.5);	
					}
					//High physique! - tiny gain
					else
					{
						msg += "Energy flows through your limbs, and you find yourself wishing you had something heavy - maybe a cart or some other primitive load-bearing device - just so that you could drag it around to test yourself. You feel like you could till an entire field by yourself, no problem. Maybe you haven't gotten that much stronger; you were already pretty built, but you'll be damned if you don't want to test yourself and find out. Maybe you could find a gym to work out at.";
						target.slowStatGain("physique",1);
					}
				}
				//#9 Reduce willpower to 33% of max.
				else if(select == 9)
				{
					//Highish
					if(target.willpower()/target.willpowerMax() >= .75)
					{
						msg += "You briefly entertain the idea of giving up on this mad quest to settle down on a fertile planet";
						if(target.hasCock()) msg += " with a fertile wife or two and plant some seeds";
						else msg += " with virile husband or two to keep your fields well-plowed";
						msg += ". Tempting as it is, you abandon the fantasy for now. You're just not sure you'll be able to turn it down if you're ever presented with it.";
					}
					//Lowish
					else
					{
						msg += "You pull out a bit of food and grab a snack. You barely even hungry, but saying no to your body wasn't something you were up to at the moment. Your self control is really slipping.";
					}
					target.willpower(-1);
				}
				//Increase reflexes to 75% of max.
				else if(select == 10)
				{
					//Sub 25%
					if(target.reflexes()/target.reflexesMax() <= 0.25)
					{
						msg += "For once, you deftly avoid a hole in the ground. Your normally sluggish reflexes appear to be improving for some reason or another, perhaps the horse pill.";
					}
					//Sub 50%
					else if(target.reflexes()/target.reflexesMax() <= 0.5)
					{
						msg += "You catch yourself midway through a stumble and maintain your position without much effort. Coordination is coming more easily to you now.";
					}
					//Sub 75%
					else
					{
						msg += ParseText("A noise behind you startles you, and you have to stop yourself from lashing out with a [pc.foot]. Damn, that was close. At least you're packing tightly-honed reflexes.");
					}
					target.slowStatGain("reflexes",1);
				}
				//#10 Remove horns
				else if(select == 10)
				{
					if (target.hornsUnlocked(0))
					{
						msg += ParseText("Your [pc.hornsNoun] audibly crack");
						if(target.horns == 1) msg += "s";
						msg += ", falling to the ground a second later. Picking ";
						if(target.horns == 1) msg += "it";
						else msg += "them";
						msg += " up, you feel ";
						if(target.horns == 1) msg += "it";
						else msg += "them";
						msg += ParseText(" crumble away in your hands like loose chalk. You touch the stumps on your head only to have them come away in the same fashion. <b>Unbroken [pc.skinFurScales] ");
						if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) msg += "are";
						else msg += "is";
						msg += ParseText(" all that remains in place of your [pc.horns].</b>");
						target.removeHorns();
					}
					else
					{
						msg += target.hornsLockedMessage();
					}
				}
				//#11 Remove antennae
				else if(select == 11)
				{
					if (target.antennaeUnlocked(0))
					{
						if(target.antennae == 1) msg += ParseText("Your [pc.antenna] drops to the ground. Where it once sat, there's only the curious numbness of a missing body part. You feel almost naked without it, but at the same time, it seems... right.");
						else msg += ParseText("Your [pc.antennae] drop to the ground. Where they once sat, there's only the curious numbness of a missing body part. You feel almost naked without them, but at the same time, it seems... right.");
						target.removeAntennae();
					}
					else
					{
						msg += target.antennaeLockedMessage();
					}
				}
				//#12 Grow hair length to 6"
				else if(select == 12)
				{
					if (target.hairLengthUnlocked(6))
					{
						//No hair -> same result as short hair TF
						if(!target.hasHair()) {
							msg += ParseText("Idly running a hand over your head, you discover that [pc.hair] has grown to cover your once bald pate. It's about two inches of thick hair.");
							target.hairLength = 2;
						}
						//Short hair
						else if(target.hairLength < 2)
						{
							msg += ParseText("Idly running a hand over your head, you discover that your [pc.hair] has lengthened noticeably. It's about two inches long.");
							target.hairLength = 2;
						}
						//Halfway there!
						else if(target.hairLength < 4)
						{
							msg += "You wind blow an unruly lock of your hair off your forehead before realizing that it has grown. There's at least four inches of unkempt length there.";
							target.hairLength = 4;
						}
						//Stage three!
						else 
						{
							msg += "Shaking your head, you're made aware of your growing hair by the feeling of it brushing across your forehead. There's definitely more of it than you recall, and a quick check with your codex's recording program reveals that you've got six inches of hair to manage now.";
							if(!target.hasPerk("Mane")) msg += " You suppose that's as close to a mane as you're getting.";
							target.hairLength = 6;
						}
					}
					else
					{
						msg += target.hairLengthLockedMessage();
					}
				}
				//#13 Mane? YES LETS FUCKING CALL IT A MANE!
				else if(select == 13) 
				{
					msg += "When you idly run your fingers through your hair, you're surprised to feel more of it than you recall. As a matter of fact, it trails all the way down to the nape of your neck in mane-like fashion. Why, <b>you've grown a rather equine-looking mane!</b>";
					target.createPerk("Mane", 0,0,0,0,"Your hair grows out much like an equine's mane.");
				}
				//#14 Vag capacity! Req's horsecunt
				else if(select == 14)
				{
					var chosenVagoo:int = -1;
					for (x = 0; x < target.vaginaTotal(); x++)
					{
						if(target.vaginas[x].type == GLOBAL.TYPE_EQUINE && target.vaginas[x].bonusCapacity < 15 && chosenVagoo == -1)
							chosenVagoo = x;
					}
					
					msg += ParseText("You are suddenly aware of how totally, completely empty your [pc.vagina " + chosenVagoo + "] is. You can't help but wonder how much more you could fit inside, or how much bigger of a mate you could cram into the hungry void that is your box. Maybe you could find a suitably virile stud to mount you out in a field with nothing but the wind and the sky between you.");
					target.vaginas[chosenVagoo].bonusCapacity += 5;
					if(target.vaginas[chosenVagoo].bonusCapacity > 15) target.vaginas[chosenVagoo].bonusCapacity = 15;
				}
				//#15 +1-4" height to a max of 6'11" for dicked and 6' for undicked.
				else if(select == 15)
				{
					var heightChange:Number = 1 + rand(4);
					var newHeight:Number = target.tallness + heightChange;
					
					if (target.tallnessUnlocked(newHeight))
					{
						msg += "You forget to duck and whack your head into something. Frowning in irritation, you have to wonder if you've gotten taller. Now that you think about it, you're pretty sure you have. It's a small but significant step up.";
						target.tallness += heightChange;
					}
					else
					{
						msg += target.tallnessLockedMessage();
					}
				}
				//New lines!
				if(msg.length > 0) kGAMECLASS.eventBuffer += msg;
				totalTFs--;
			}
		}
		
		private function bigHorsePillMutations(target:Creature):void
		{
			var msg:String = "";
			//How many TFs? Max of 2.
			var totalTFs:Number = Math.floor(target.statusEffectv2("Horse Pill")/2);
			if(totalTFs < 1) totalTFs = 1;
			//Used for holding temporary garbage
			var x:int = 0;
			//Used to hold the TF we pull out of the array of effects
			var select:int = 0;

			//Build a list of all potential TFs
			var TFList:Array = new Array();
			//#1 On multirow tits, shrink down to nothing but nips!
			if(hasLowerTitties(target))
				TFList[TFList.length] = 1;
			//#2 Combine more than two balls into regular balls
			if(target.balls > 2)
				TFList[TFList.length] = 2;	
			//#3 Grow a sheath if none.
			if(!target.hasFullSheaths())
				TFList[TFList.length] = 3;
			//#4 Horsecock - req's sheathed cawk
			if(hasSheathedNonHorsecocks(target))
				TFList[TFList.length] = 4;
			//#5 GROW SOME BALLS
			if(target.hasCock() && target.balls == 0 && target.ballsUnlocked(2))
				TFList[TFList.length] = 5;
			//#6 GROW A SECOND BALL IF ONLY ONE
			if(target.hasCock() && target.balls == 1 && target.ballsUnlocked(2))
				TFList[TFList.length] = 6;
			//#7 Horsecunt.
			if(target.vaginaTotal(GLOBAL.TYPE_EQUINE) < target.vaginaTotal())
				TFList[TFList.length] = 7;
			//#8 Change hair color to black, brown, chestnut, or white (rare)
			if(target.hairColor != "black" && target.hairColor != "brown" && target.hairColor != "chestnut" && target.hairColor != "white")
				TFList[TFList.length] = 8;
			//#9 Change fur color to chocolate, ivory, brown-dappled, or sable.
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR && target.furColor != "chocolate" && target.furColor != "ivory" && target.furColor != "brown-dappled" && target.furColor != "sable")
				TFList[TFList.length] = 9;
			//#10 Grow hoarse ears - need tail first.
			if(target.earType != GLOBAL.TYPE_EQUINE && target.tailType == GLOBAL.TYPE_EQUINE)
				TFList[TFList.length] = 10;
			//#11 Grow horse tail - no prereq
			if(target.tailType != GLOBAL.TYPE_EQUINE)
				TFList[TFList.length] = 11;
			//#12 Gain black hoof-nails on fingertips.
			if(target.armType != GLOBAL.TYPE_EQUINE)
				TFList[TFList.length] = 12;
			//#13 Get propah hooves. - Req's ears
			if(target.legType != GLOBAL.TYPE_EQUINE && target.earType == GLOBAL.TYPE_EQUINE)
				TFList[TFList.length] = 13;
			//#14 Grow Fur - Req's hooves
			if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.legType == GLOBAL.TYPE_EQUINE)
				TFList[TFList.length] = 14;
			//#15 SNOUTS! THE SAVIN SPECIAL! - req's fur
			if(target.faceType != GLOBAL.TYPE_EQUINE && target.skinType == GLOBAL.SKIN_TYPE_FUR && target.faceTypeUnlocked(GLOBAL.TYPE_EQUINE))
				TFList[TFList.length] = 15;
			if(target.hasStatusEffect("Genital Slit"))
				TFList[TFList.length] = 16;
			//#0 DEFAULT CATCH ALL!
			if(TFList.length == 0) TFList[TFList.length] = 0;

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
					msg += "You find yourself fantasizing about frolicking through an open field, munching on grass, and fucking. The imagery is base and simple, befitting of someone who is a few doses from becoming an animal themselves.";
				}
				//#1 On multirow tits, shrink down to nothing but nips!
				else if(select == 1)
				{
					var bRatingChange:Boolean = false;
					for(x = 1; x < target.bRows(); x++)
					{
						if (target.breastRatingUnlocked(x, 0))
						{
							target.breastRows[x].breastRatingRaw -= (-3-rand(3));
							bRatingChange = true;
						}
						
						if (target.breastRows[x].breastRating() < 0) target.breastRows[x].breastRating(0, true);
					}
					if (bRatingChange)
					{					
						msg += "Every breast beneath your top row has apparently been shrinking, judging by the diminished size of your secondary bust";
						if(target.bRows() > 2) msg += "s";
						msg += ". ";
						if(target.breastRows[0].breastRating() >= 1) msg += "The " + target.breastDescript(0) + " above are as nice as they've ever been,";
						else msg += "The chest above remains unchanged,";
						msg += " but down south, you're ";
						
						var biggestLowTits:int = 0;
						//Find biggest secondary row
						for(x = 1; x < target.bRows(); x++)
						{
							if(target.breastRows[x].breastRating() > biggestLowTits) biggestLowTits = target.breastRows[x].breastRating();
						}
						if(biggestLowTits < 1) msg += "practically flat aside from the slight bumps of your " + target.nippleDescript(1) + ".";
						else if(target.breastRows[0].breastRating < 1) msg += "getting closer to your top side's flatness.";
						else msg += "getting increasingly closer to flatness. If this happens much more you're not going to have much more than a few extra nipples to show your multibreastedness.";
					}
					else
					{
						msg += target.breastRatingLockedMessage();
					}
				}
				//#2 Combine more than two balls into regular balls
				else if(select == 2)
				{
					if (target.ballsUnlocked(2))
					{
						msg += ParseText("Your [pc.sack] feels feverishly warm. There's no other way to describe the pulsating warmth currently coursing through it. ");
						if(target.isCrotchGarbed()) msg += ParseText("You shuck your [pc.lowerGarments] to check it out. ");
						else msg += "You look down to check it out. ";
						msg += ParseText("Strangely, your [pc.balls] are hanging oddly. It seems like they're stuck together. A gentle squeeze confirms your suspicion. Then, before your eyes, they slowly grow together, merging into a pair of much larger nuts. They feel heavy and strange but also undeniably right. <b>You've only got two balls, but they're much bigger.</b>");
						//Ballsize grow based on how many were merged in!
						target.ballSizeRaw = target.balls/2 * target.ballSizeRaw;
						target.balls = 2;
					}
					else
					{
						msg += target.ballsLockedMessage();
					}
				}
				//#3 Grow a sheath if none.
				else if(select == 3)
				{
					var chosenDong:int = -1;
					//Find an unsheathed wangus!
					for(x = 0; x < target.cockTotal(); x++)
					{
						if(!target.hasSheath(x) && chosenDong == -1) chosenDong = x;
					}
					msg += "Your " + target.cockDescript(chosenDong) + " feels a little off, and when you check on it, you discover that a soft, folded sheath has sprung up around its base, like an animal's.";
					if(target.cockTotal() == 2) msg += " Your other penis hasn't changed at all.";
					else if(target.cockTotal() > 2) msg += " Your other penises haven't changed at all.";
					msg += " Interestingly, your " + target.cockDescript(chosenDong) + " will withdraw inside the new growth when flaccid, only to emerge when hard. ";
					if(target.hasASheath()) msg += "<b>You suppose <i>one more</i> sheath is just another step towards a more equine you.</b>";
					else msg += "<b>You suppose your sheath is just one step towards a more equine you.</b>";
					target.cocks[chosenDong].addFlag(GLOBAL.FLAG_SHEATHED);
				}
				//#4 Horsecock - req's sheathed cawk
				else if(select == 4)
				{
					var cockToBe:int = -1;
					//Find a sheathed non-horsewang
					for(x = 0; x < target.cockTotal(); x++)
					{
						if(target.hasSheath(x) && target.cocks[x].cType != GLOBAL.TYPE_EQUINE && cockToBe == -1) cockToBe = x;
					}
					
					if (target.cockTypeUnlocked(cockToBe, GLOBAL.TYPE_EQUINE))
					{
						msg += ParseText("A pinch of slight discomfort garners your attention, and the immediate blossoming of unnatural warmth within holds it. Building slowly, the strange yet pleasant sensation spreads through your length to your abdominal core. Then, like a butterfly emerging from its cocoon, your [pc.cock " + cockToBe + "] reveals itself, changed ");
						//Ovir or other horsecockalikes
						if(target.hasCockFlag(GLOBAL.FLAG_BLUNT)) msg += "subtly. The head is still blunt, but its slightly more flared, and the shaft looks so meaty and full of veins that it would only look at home on a beast of burden, note a sapient creature.";
						else msg += "obviously. The head is flat, blunted, and just slightly wider than the rest of the shaft. Behind it, the shaft is smooth except for veins and a bulgy medial ring about halfway down its length. A cock like this would look more at home on a beast of burden than a sapient being.";
						msg += " More and more of it slides out of your sheath until it's well beyond your previous length. It pulses hotly, drizzling pre-cum from the pleasure of the change, and you struggle not to masturbate on the spot.";
						target.shiftCock(cockToBe,GLOBAL.TYPE_EQUINE);
						target.cocks[cockToBe].cLength(3+rand(4));
						//Re-add the sheath if shiftCock clears it
						if(!target.cocks[cockToBe].hasFlag(GLOBAL.FLAG_SHEATHED)) target.cocks[cockToBe].addFlag(GLOBAL.FLAG_SHEATHED);
						target.lust(50 + rand(10));
					}
					else
					{
						msg += target.cockTypeLockedMessage();
					}
				}
				//#5 GROW SOME BALLS
				else if(select == 5)
				{
					msg += "Your gut churns and heaves similarly to when you've gotten sick in the past. This time, rather than resulting in a need to go to the bathroom, the discomfort merely migrates south, growing in intensity as it does. When you can take it no more, you groan as something slips within you, bringing with it immeasurable relief. The pain is reduced by perhaps half. The odd slipping sensation repeats. This time, you're left sighing in contentment. Whatever just happened, it's over now.";
					msg += "\n\nYou check up on your groin once you've caught your breath, and to your shock, you discover a pair of nicely-rounded balls contained in a leathery sack. <b>You grew balls!</b>";
					target.balls = 2;
					target.ballSizeRaw = 3;
					if (target.hasPerk("Bulgy")) target.ballSizeRaw = 5;
				}
				//#6 GROW A SECOND BALL IF ONLY ONE
				else if(select == 6)
				{
					msg += ParseText("You suddenly grunt and clench as something deep in your abdomen spasms. A moment later, you feel something slipping out of your body and next to your [pc.ball]. You've grown a second one, identical to the first, and released it into your [pc.sack] to start creating even more [pc.cum].");
					target.balls = 2;
				}
				//#7 Horsecunt.
				else if(select == 7)
				{
					var cuntToBe:int = -1;
					for(x = 0; x < target.vaginaTotal(); x++)
					{
						if(target.vaginas[x].type != GLOBAL.TYPE_EQUINE && cuntToBe == -1) cuntToBe = x;
					}
					
					if (target.vaginaTypeUnlocked(cuntToBe, GLOBAL.TYPE_EQUINE))
					{
						msg += "You stagger as your " + target.vaginaDescript(cuntToBe) + " abruptly engorges, feeling utterly and completely swollen with blood. It feels even fuller and more plush than when you're turned on, most noticeably around the outer lips. It looks just like... well, a horse-cunt. <b>You've got a big, puffy horse-cunt</b>, perfectly sized to take a big, blunted member.";
						target.shiftVagina(cuntToBe,GLOBAL.TYPE_EQUINE);
						target.lust(10);
					}
					else
					{
						msg += target.vaginaTypeLockedMessage();
					}
				}
				//#8 Change hair color to black, brown, chestnut, or white (rare)
				else if(select == 8)
				{
					var newHairColour:String = "";
					if(rand(10) == 0) newHairColour = "white";
					else if(rand(3) == 0) newHairColour = "chestnut";
					else if(rand(2) == 0) newHairColour = "brown";
					else newHairColour = "black";
					
					if (target.hairColorUnlocked(newHairColour))
					{
						target.hairColor = newHairColour;
						
						//Bald
						if(!target.hasHair()) msg += "Your scalp tingles, but without any hair there, you aren't aware of what changed. Perhaps it changed your hair color, but you can't be sure until you grow some!";
						//Short
						else msg += "Your scalp tingles meaningfully, and after scratching at it, it doesn't subside. You check yourself with your codex to make sure you aren't coming down with an aggressive new strain of lice and find <b>your hair has turned " + target.hairColor + ".</b>";
					}
					else
					{
						msg += target.hairColorLockedMessage();
					}
				}
				//#9 Change fur color to chocolate, ivory, brown-dappled, or sable.
				else if(select == 9)
				{
					var newFurColour:String = "";
					if(rand(4) == 0) newFurColour = "chocolate";
					else if(rand(3) == 0) newFurColour = "ivory";
					else if(rand(2) == 0) newFurColour = "brown-dappled";
					else newFurColour = "sable";
					
					if (target.furColorUnlocked(newFurColour))
					{
						target.furColor = newFurColour;
						
						msg += "Your fur has changed color! One minute, you're minding your own business, the next, you're noticing that most of your fur has turned " + target.furColor + ". As a matter of fact, you can see it spreading to the last few hold-outs on your forearms and nose. <b>You've got " + target.skinFurScales(true) + " now.</b>";
					}
					else
					{
						msg += target.furColorLockedMessage();
					}
				}
				//#10 Grow hoarse ears
				//Ears - requires tail
				else if(select == 10)
				{
					if (target.earTypeUnlocked(GLOBAL.TYPE_EQUINE))
					{
						if (target.earType == GLOBAL.TYPE_HUMAN) msg += "Your ears tug painfully on your face as they begin shifting, moving upwards to the top of your head and transforming into a upright animalistic ears.";
						else if (target.earType == GLOBAL.TYPE_CANINE) msg += "Your ears change shape, morphing into from their doglike shape into equine-like ears!";
						else msg += "Your ears change shape, morphing into teardrop-shaped horse ears!";
						msg += "<b> You now have horse ears.</b>";
						target.earType = GLOBAL.TYPE_EQUINE;
					}
					else
					{
						msg += target.earTypeLockedMessage();
					}
				}
				//#11 Grow horse tail
				else if(select == 11)
				{
					if (target.tailTypeUnlocked(GLOBAL.TYPE_EQUINE) && target.tailCountUnlocked(1))
					{
						if(target.tailType == 0) msg += "There is a sudden tickling on your ass, and you notice you have sprouted a long, shiny horsetail of the same " + target.hairColor + " color as your hair.";
						//if bee/spider-butt.
						else if (target.tailType == GLOBAL.TYPE_ARACHNID || target.tailType == GLOBAL.TYPE_BEE)
						{
							msg += "Your " + target.tailsDescript() + " bunch";
							if(target.tailCount == 1) msg += "es";
							msg += " up as ";
							if(target.tailCount == 1) msg += "it begins";
							else msg += "they begin";
							msg += " shrinking, exoskeleton flaking off like a snake sheds its skin. ";
							if(target.tailCount == 1) msg += "It bunches";
							else msg += "They bunch";
							msg += " up until ";
							if(target.tailCount == 1) msg += "it is";
							else msg += "they are";
							msg += " as small as a tennis ball, then explode";
							if(target.tailCount == 1) msg += "s";
							msg += " outwards, growing into an animalistic, vaguely-tail shaped appendage. Moments later, it explodes into filaments of pain, dividing into hundreds of strands and turning into a shiny horsetail.";
						}
						//if other animal tail
						else {
							msg += "Pain lances up your " + target.assholeDescript() + " as your " + target.tailsDescript() + " shift";
							if(target.tailCount == 1) msg += "s";
							msg += " and morph";
							msg += "s";
							msg += " disgustingly. With one last wave of pain, ";
							if(target.tailCount == 1) msg += "it splits";
							else msg += "they split";
							msg += " into hundreds of tiny filaments, transforming into a horsetail.";
						}
						msg += " <b>You now have a horse-tail.</b>", false;
						target.clearTailFlags();
						target.addTailFlag(GLOBAL.FLAG_LONG);
						target.tailCount = 1;
						target.tailType = GLOBAL.TYPE_EQUINE;
					}
					else if (!target.tailTypeUnlocked(GLOBAL.TYPE_EQUINE))
					{
						msg += target.tailTypeLockedMessage();
					}
					else if (!target.tailCountUnlocked(1))
					{
						msg += target.tailCountLockedMessage();
					}
				}
				//#12 Gain black hoof-nails on fingertips.
				else if(select == 12)
				{
					if (target.armTypeUnlocked(GLOBAL.TYPE_EQUINE))
					{
						msg += "Your fingers abruptly clench, driving your fingertips into your palm. The feel firmer than normal, and when you open your hands, you discover that from the last joint of your finger on your fingers have hardened into black, almost hoof-like material. You can still feel through them. <b>You've grown hoof-nails!</b>";
						target.armType = GLOBAL.TYPE_EQUINE;
						target.clearArmFlags();
					}
					else
					{
						msg += target.armTypeLockedMessage();
					}
				}
				//#13 Get propah hooves.
				else if(select == 13)
				{
					if (target.legTypeUnlocked(GLOBAL.TYPE_EQUINE) && (target.legCountUnlocked(2) || target.legCountUnlocked(4)))
					{
						//Single legs
						if(target.legCount == 1 && target.legCountUnlocked(2))
						{
							msg += ParseText("Your [pc.leg] goes weak and wobbly. You manage to drop to the ground with less grace than you meant before your strength gives completely. Starting at the tip of your [pc.foot], your [pc.leg] creases before starting to separate in two! The split supports slowly change shape to take on knees and high, digitigrade ankles. At the bottoms of your new legs, hooves form.");
							target.legCount = 2;
							target.genitalSpot = 0;
						}
						//Quad+ legs
						else if (target.legCount >= 3 && target.legCountUnlocked(4)) 
						{
							msg += ParseText("Twitching wildly, your [pc.legs] give out, dumping you to the floor in a heap of uncoordinated, splayed limbs. They twitch wildly as they reform, starting at your waist and spreading down. Their bones melt like butter as they flow into newer, more equine shapes, and your [pc.feet] change with them, growing hard and cloven.");
							if(target.legCount > 4) 
							{
								msg += " The front four do anyway. Your body shortens up behind them, becoming more traditionally tauric in shape and size.";
								target.legCount = 4;
							}
							if(target.genitalSpot != 2) 
							{
								if(target.hasGenitals()) msg += " Your crotch has even moved back to the rear of your frame, just like an equine's.";
								target.genitalSpot = 2;
							}
							msg += " For better or worse, you've got horse-legs now.";
						}
						//Double legs - DA CATCH ALLZ
						else
						{
							msg += "Your legs wobble warningly a moment before dumping you to the ground as they nervelessly twitch. Their shape gets less and less distinct as their structure morphs and shifts, ";
							if(!target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) msg += "becoming distinctly digitigrade in nature";
							else msg += "remaining digitigrade but in slightly different proportion";
							msg += ParseText(". Your [pc.feet] curl up into compact, hard keratin, shiny black and cloven. <b>You have hooved feet!</b>");
						}
						target.clearLegFlags();
						target.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
						target.addLegFlag(GLOBAL.FLAG_HOOVES);
						target.legType = GLOBAL.TYPE_EQUINE;
					}
					else if (!target.legCountUnlocked(2) || !target.legCountUnlocked(4))
					{
						msg += target.legCountLockedMessage();
					}
					else if (!target.legTypeUnlocked(GLOBAL.TYPE_EQUINE))
					{
						msg += target.legTypeLockedMessage();
					}
				}
				//#14 Grow Fur
				else if(select == 14)
				{
					if (target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FUR))
					{
						target.skinType = GLOBAL.SKIN_TYPE_FUR;
						if(rand(4) == 0) target.furColor = "chocolate";
						else if(rand(3) == 0) target.furColor = "ivory";
						else if(rand(2) == 0) target.furColor = "brown-dappled";
						else target.furColor = "sable";
						
						//Scales
						if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) msg += ParseText("Your scales are flaking off! One after another, the shiny " + target.scaleColor + " little plates are falling to the ground. In their place, [pc.skinFurScales] is springing up, thick and glossy. You brush the last of your scales away as your full-body fur finishes growing in. An odd desire to be brushed nags at your mind.");
						//Chitin
						else if(target.skinType == GLOBAL.SKIN_TYPE_CHITIN) msg += ParseText("Your chitinous armor cracks loudly. Thankfully, it doesn't hurt even though the fractures are spreading across your body like breaking glass. You peel away a piece and discover [pc.skinFurScales] growing up out of the gap, and as you marvel at it, the rest of your chitin slowly sloughs off. <b>Your whole body is covered in fur, like a horse!</b> An odd desire to be brushed rises up within you.");
						//Skin or whatever!
						else msg += ParseText("Tiny hairs break through the surface of your [pc.skin], making you itch like crazy. It's enough to distract you for sure, and it only gets worse as more and more hair emerges. The ones that came out first are getting longer and thicker, with the newer additions following close behind. Before you know it, your [pc.skin] vanishes under your new coat of [pc.skinFurScales]. <b>You struggle with a strange desire to be brushed as you admire your new horse hair coat.</b>");
					}
					else
					{
						msg += target.skinTypeLockedMessage();
					}
				}
				//SNOUTS! THE SAVIN SPECIAL!
				else if(select == 15)
				{
					//Already snouted
					if(target.hasFaceFlag(GLOBAL.FLAG_MUZZLED)) msg += "Your muzzle stretches outward and squares off at the end as it takes on more horse-like proportions. It doesn't even hurt, though when the transformation finishes, you're left with a blend of equine and humanoid features. <b>You have an anthropomorphic horse face.</b>";
					//Nonsnouted
					else msg += "Your eyes water like crazy as the bones in your face abruptly... flex. Blinking like mad, you try to watch your expanding, lengthening nose and jaw, but your eyes just aren't working right. You're left nearly blind while <b>your face is rearranged into a elongated horse face!</b>";
					target.faceType = GLOBAL.TYPE_EQUINE;
					target.clearFaceFlags();
					target.addFaceFlag(GLOBAL.FLAG_LONG);
					target.addFaceFlag(GLOBAL.FLAG_MUZZLED);
				}
				else if(select == 16)
				{
					msg += "Your genital slit abruptly bulges, feeling way too tight all of a sudden. You wince as your [pc.cocks] ";
					if(target.cockTotal() == 1) msg += "is rudely thrust out of its warm, snuggly home.";
					else msg += "are rudely thrust out of their warm, snuggly homes.";
					msg += ParseText(" Now exposed to the air, you're left to gasp as you feel the opening underneath diminishing until there's only a slight crease in your [pc.skin]. Even that fades over the course of a minute or so. <b>Your genital slit is gone.</b>");
					target.removeStatusEffect("Genital Slit");
				}
				
				if(msg.length > 0) kGAMECLASS.eventBuffer += msg;
				totalTFs--;
			}
		}
		protected function rand(max:Number):Number
		{
			return int(Math.random()*max);
		}
		private function hasLowerTitties(target:Creature):Boolean
		{
			if(target.bRows() <= 1) return false;
			for(var x:int = 1; x < target.bRows(); x++)
			{
				if(target.breastRows[x].breastRating >= 1) return true;
			}
			return false;
		}
		private function hasSheathedNonHorsecocks(target:Creature):Boolean
		{
			if(target.cockTotal() == 0) return false;
			for (var x:int = 0; x < target.cockTotal(); x++)
			{
				if(target.hasSheath(x) && target.cocks[x].cType != GLOBAL.TYPE_EQUINE) return true;
			}
			return false;
		}
		private function hasAHorseCuntNeedingRoom(target:Creature):Boolean
		{
			if(target.vaginaTotal() == 0) return false;
			for (var x:int = 0; x < target.vaginaTotal(); x++)
			{
				if(target.vaginas[x].type == GLOBAL.TYPE_EQUINE && target.vaginas[x].bonusCapacity < 15) return true;
			}
			return false;
		}
	}
}
