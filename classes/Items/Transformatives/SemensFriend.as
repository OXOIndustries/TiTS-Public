package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class SemensFriend extends ItemSlotClass
	{
		
		//constructor
		public function SemensFriend()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.DRUG;
			shortName = "Semens F.";
			longName = "tin of Semen’s Friend candy";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a silver tin of Semen’s Friend candy";
			tooltip = "Originally created to enhance and prolong the experience of long haul spacers and miners on shore leave, Xenogen pulled Semen’s Friend when users reported it having a number of strange effects on persistent dosage. It eventually found its way back onto the fringes of the mutagen market, sought out by those so desperate to overcome their infertility they didn’t care about the side effects and, naturally, those more interested in the side effects themselves. It appears as a silver tin of innocuous-looking oval candy, with a smiley tadpole embossed on the lid.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 3600;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var changes:int = 0;
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			kGAMECLASS.clearOutput();
			
			if(target is PlayerCharacter)
			{
				author("Nonesuch");
				
				kGAMECLASS.output("You pop one of the sweets into your mouth. The incredibly strong flavor of aniseed and menthol makes your eyes water; when you swallow it the cold burn spreads from your mouth to your gut and then down to your groin.");
				
				//Add “SF effect” upon use. Lasts for five hours.
				
				var timerStamp:int = (5 * 60);
				
				if(target.hasStatusEffect("Semen's Candy"))
				{
					// If another dose taken when “SF effect” is up, run persistent dose effects plus increase libido by 2.
					target.addStatusValue("Semen's Candy", 2, 1);
				}
				else
				{
					// "Semen's Candy"
					// v1: Timestamp!
					// v2: Dose counter
					target.createStatusEffect("Semen's Candy", timerStamp, 1, 0, 0, false, "Pill", "The Semen’s Friend candy is still in your system.", false, timerStamp);
				}
			}
			//Not player!
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " eats the candy to no effect.");
			}
			return false;
		}
		// Libido increase:
		public function itemSemensFriendLibidoIncrease():void
		{
			var target:Creature = kGAMECLASS.chars["PC"];
			
			if(target.libido() >= 100 || target.getStatusMinutes("Semen's Candy") % 60 != 0) return;
			
			var isPresistentTF:Boolean = (target.statusEffectv2("Semen's Candy") > 1);
			var libGain:int = 1;
			if(isPresistentTF) libGain = 2;
			
			// Each hour, 0.4 chance to increase libido by 1.
			if(rand(5) < 2)
			{
				kGAMECLASS.eventBuffer += "\n\n<u>The Semen’s Friend candy has an effect....</u>";
				
				kGAMECLASS.eventBuffer += "\n\nYou exhale, deep and low, as the cold burn in your loins increases, the impatient imperative to get out there and fuck and breed every fertile hole in sight growing stronger.";
				
				target.slowStatGain("libido", libGain);
				
				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0, "Next", kGAMECLASS.mainGameMenu);
			}
		}
		public function itemSemensFriendTFPlus():void
		{
			itemSemensFriendTF(true);
		}
		public function itemSemensFriendTF(isPresistentTF:Boolean = false):void
		{
			var target:Creature = kGAMECLASS.chars["PC"];
			
			var totalTFs:Number = 1;
			if(rand(2) == 0) totalTFs++;
			if(rand(2) == 0) totalTFs++;
			var select:int = 0;
			var x:int = 0;
			var i: int = 0;
			var ballDiameter:Number = target.ballDiameter();
			var removeBottoms:Boolean = false;
			
			//Build a list of all potential TFs
			var TFList:Array = new Array();
			//#1 If no balls grow balls
			if(target.balls <= 0)
				TFList.push(1);
			//#2 If trap pouch replace with standard sack
			if(target.balls > 0 && target.hasStatusEffect("Uniball"))
				TFList.push(2);
			//#3 If balls increase towards 6” by 1”
			if(target.balls > 0 && ((isPresistentTF && ballDiameter < 11) || ballDiameter < 6))
				TFList.push(3);
			//#4 Increase male potency
			if(target.refractoryRate < 80)
				TFList.push(4);
			//#5 Increase male fertility (requires balls)
			if(target.balls > 0 && target.virility() > 0 && target.cumQualityRaw < 1.5)
				TFList.push(5);
			//#6 If balls > 5” grow quad
			if(isPresistentTF && ballDiameter > 5 && target.balls > 0 && target.balls < 4)
				TFList.push(6);
			//#7 Change cum to chocolate colored and flavored (requires cock)
			if(isPresistentTF && target.hasCock() && target.cumType != GLOBAL.FLUID_TYPE_CHOCOLATE_CUM)
				TFList.push(7);
			
			// TF texts
			kGAMECLASS.eventBuffer += "\n\n<u>The Semen’s Friend candy has an effect....</u>";
			
			while(totalTFs > 0)
			{
				kGAMECLASS.eventBuffer += "\n\n";
				//Pick a TF	
				x = rand(TFList.length);
				select = TFList[x];
				//Cull 'dat TF from the list.
				TFList.splice(x,1);
				//#0 Catch all
				if(select == 0)
				{
					kGAMECLASS.eventBuffer += "Your crotch tingles but nothing seems to happen...";
					if(target.cumType != GLOBAL.FLUID_TYPE_CHOCOLATE_CUM && target.balls >= 4 && target.ballDiameter() >= 11 && target.refractoryRate >= 80 && target.cumQualityRaw >= 1.5)
					{
						kGAMECLASS.eventBuffer += " Looks like you already have the all the mutations the Semen’s Friend candy has to offer.";
					}
					else kGAMECLASS.eventBuffer += " Maybe the Semen’s Friend candy you ingested is just a dud.";
					
					break;
				}
				//#1 If no balls grow balls
				else if(select == 1)
				{
					if(target.ballsUnlocked(2))
					{
						kGAMECLASS.eventBuffer += "Heat condenses into two small spheres in your groin, and then slowly shifts outwards. You swing your [pc.hips] slightly to confirm it; <b>you’ve grown a pair of testicles!</b>";
						if(!target.hasCock())
						{
							kGAMECLASS.eventBuffer += " Man";
							if(!removeBottoms && !target.isCrotchExposed()) kGAMECLASS.eventBuffer += " would";
							else kGAMECLASS.eventBuffer += " do";
							kGAMECLASS.eventBuffer += " they look weird without anything between them. You’d better hope you don’t get blue balls in your current state...";
						}
						
						target.balls = 2;
						target.ballSizeRaw = 2;
						if(target.hasPerk("Bulgy")) target.ballSizeRaw *= 2;
						target.ballFullness = 100;
					}
					else
					{
						kGAMECLASS.eventBuffer += target.ballsLockedMessage();
					}
				}
				//#2 If trap pouch replace with standard sack
				else if(select == 2)
				{
					kGAMECLASS.eventBuffer += "You sigh with something akin to relief as your tightly condensed sack pushes outwards and downwards";
					if(target.balls == 1) kGAMECLASS.eventBuffer += ", now hanging freely in the open air compared to";
					else if(target.balls == 2) kGAMECLASS.eventBuffer += ", forming a more readily recognizable pair of bollocks than";
					else kGAMECLASS.eventBuffer += ", forming a more readily recognizable set of bollocks than";
					kGAMECLASS.eventBuffer += " the cutesy boy sphere you had before.";
					target.removeStatusEffect("Uniball");
				}
				//#3 If balls increase towards 6” by 1”
				else if(select == 3)
				{
					var newBallSize:Number = target.ballSizeRaw + 1;
					if(target.hasPerk("Bulgy")) newBallSize++;
					
					if(target.ballSizeUnlocked(newBallSize))
					{
						kGAMECLASS.eventBuffer += "You grunt as pressure in your [pc.balls] expand";
						if(target.balls == 1) kGAMECLASS.eventBuffer += "s, making it";
						else kGAMECLASS.eventBuffer += ", making them";
						kGAMECLASS.eventBuffer += " bigger and more dense-feeling.";
						
						target.ballSizeRaw = newBallSize;
						
						// Increase balls to 11” by 1”
						if(isPresistentTF)
						{
							newBallSize = target.ballSizeRaw + 1;
							if(target.hasPerk("Bulgy")) newBallSize++;
							
							if(target.ballSizeUnlocked(newBallSize))
							{
								if(target.balls == 1) kGAMECLASS.eventBuffer += "You crow as your testicle grows yet bigger, the size of your prestigious sperm-factory matching the density of packed heat you feel within it.";
								else kGAMECLASS.eventBuffer += "You crow as your balls grow yet bigger, the size of your prestigious sperm-factories matching the density of packed heat you feel within them.";
								
								target.ballSizeRaw = newBallSize;
							}
						}
					}
					else
					{
						kGAMECLASS.eventBuffer += target.ballSizeLockedMessage();
					}
				}
				//#4 Increase cum production
				else if(select == 4)
				{
					if(target.hasCock())
					{
						kGAMECLASS.eventBuffer += "[pc.OneCock] hardens";
						if(removeBottoms || target.isCrotchExposed()) kGAMECLASS.eventBuffer += " and darkens slightly";
						kGAMECLASS.eventBuffer += ", a drop of [pc.cum] forming at its tip. ";
					}
					kGAMECLASS.eventBuffer += "You feel... juicier.";
					
					target.refractoryRate++;
				}
				//#5 Increase male fertility
				else if(select == 5)
				{
					kGAMECLASS.eventBuffer += "Your [pc.sack] tightens up, your";
					if(target.balls == 1) kGAMECLASS.eventBuffer += " testicle";
					else kGAMECLASS.eventBuffer += " balls";
					kGAMECLASS.eventBuffer += " throbbing with a dense, heavy pulse. The intensity of it fades but a background throb in your [pc.balls] remains, your body purposefully stepping up its sperm production.";
					
					target.cumQualityRaw += 0.1;
				}
				//#6 If balls > 5” grow quad
				else if(select == 6)
				{
					if(target.ballsUnlocked(4))
					{
						kGAMECLASS.eventBuffer += "You close your eyes as you feel boiling pressure grow in your [pc.balls]. It feels uncontrollable, as if your ball";
						if(target.balls == 1) kGAMECLASS.eventBuffer += " is";
						else kGAMECLASS.eventBuffer += "s are";
						kGAMECLASS.eventBuffer += " going to explode, and when you feel something burst out of your sack you think for one horrible moment that’s exactly what’s happened. You feel no pain though - just a sensation of deep release - and after the pressure fades you feel vaguely yet ineffably stronger, testosterone coursing through your veins. A rummage around downstairs tells you why: <b>you’ve grown";
						if(target.balls == 1) kGAMECLASS.eventBuffer += " three more balls";
						else if(target.balls == 2) kGAMECLASS.eventBuffer += " a second pair of balls";
						else if(target.balls == 3) kGAMECLASS.eventBuffer += " one more testicle";
						else kGAMECLASS.eventBuffer += " new testicles";
						kGAMECLASS.eventBuffer += ", giving you four altogether.</b>";
						
						target.balls = 4;
					}
					else
					{
						kGAMECLASS.eventBuffer += target.ballsLockedMessage();
					}
				}
				//#7 Change cum to chocolate colored and flavored (requires cock)
				else if(select == 7)
				{
					if(target.cumTypeUnlocked(GLOBAL.FLUID_TYPE_CHOCOLATE_CUM))
					{
						kGAMECLASS.eventBuffer += "The heat in your groin coalesces into a deep, leaden need";
						if(target.balls > 0) kGAMECLASS.eventBuffer += ", your [pc.balls] prickling and tightening with lust,";
						kGAMECLASS.eventBuffer += " and suddenly [pc.eachCock] is bulgingly erect.";
						if(!removeBottoms && !target.isCrotchExposed())
						{
							kGAMECLASS.eventBuffer += " In the thrill of the moment, your hands do quick work of your [pc.lowerGarments].";
							removeBottoms = true;
						}
						kGAMECLASS.eventBuffer += " You fight back the urge to masturbate crowding your mind but it doesn’t even seem to matter; hot fluid rises up your shaft and oozes out of your swollen [pc.cockheads] thickly without any stimulation whatsoever. You look down in disbelief. Brown?! Caught somewhere between disgust and awe, you gingerly swab your finger in the rich burnt sienna that is dripping from your prick and press it to your tongue. Sweet and warm flavored; immediately recognizable. Presumably your cum will still act like cum but for all other intents and purposes, <b>you now ejaculate chocolate.</b>";
						if(target.isAss()) kGAMECLASS.eventBuffer += " Now if only you could work out how to piss money too, you’d have bitches all over you.";
						
						target.cumType = GLOBAL.FLUID_TYPE_CHOCOLATE_CUM;
					}
					else
					{
						kGAMECLASS.eventBuffer += target.cumTypeLockedMessage();
					}
				}
				totalTFs--;
			}
			
			// Effect over:
			kGAMECLASS.eventBuffer += "\n\n";
			if(removeBottoms) kGAMECLASS.eventBuffer += "You quickly reclothe as t";
			else kGAMECLASS.eventBuffer += "T";
			kGAMECLASS.eventBuffer += "he sensation in your groin from the candy has finally been lifted.";
			return;
		}
	}
}

