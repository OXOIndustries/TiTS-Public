package classes.GameData.Pregnancy.Handlers 
{
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.GameData.Pregnancy.Child;
	import classes.GameData.StatTracking;
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.PregnancyData;
	import classes.kGAMECLASS;
	import classes.GLOBAL;
	import classes.Engine.Interfaces.ParseText;
	import classes.Engine.Utility.rand;
	import classes.Engine.Interfaces.AddLogEvent;
	import classes.StorageClass;
	
	public class OvalastingEggPregnancy extends BasePregnancyHandler
	{
		public function OvalastingEggPregnancy() 
		{
			_handlesType = "OvalastingEggPregnancy";
			_basePregnancyIncubationTime = (7 * 24 * 60); // 7 days
			_basePregnancyChance = 1;
			_alwaysImpregnate = true;
			_ignoreInfertility = true;
			_ignoreMotherInfertility = true;
			_ignoreFatherInfertility = true;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = true;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 4;
			_pregnancyQuantityMaximum = 9002;
			_definedAverageLoadSize = 400;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_EGGS;
			
			this.addStageProgression(10080 - (168 * 60), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 1;
				pData.pregnancyBellyRatingContribution += 1;
				if(kGAMECLASS.pc.hasStatusEffect("Ovalasting Big Egg " + pregSlot))
				{
					kGAMECLASS.pc.bellyRatingMod += 1;
					pData.pregnancyBellyRatingContribution += 1;
				}
			}, true);
			this.addStageProgression(10080 - (160 * 60), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 1;
				pData.pregnancyBellyRatingContribution += 1;
				if(kGAMECLASS.pc.hasStatusEffect("Ovalasting Big Egg " + pregSlot))
				{
					kGAMECLASS.pc.bellyRatingMod += 1;
					pData.pregnancyBellyRatingContribution += 1;
				}
			}, true);
			this.addStageProgression(10080 - (152 * 60), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 1;
				pData.pregnancyBellyRatingContribution += 1;
				if(kGAMECLASS.pc.hasStatusEffect("Ovalasting Big Egg " + pregSlot))
				{
					kGAMECLASS.pc.bellyRatingMod += 1;
					pData.pregnancyBellyRatingContribution += 1;
				}
			}, true);
			this.addStageProgression(10080 - (144 * 60), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 1;
				pData.pregnancyBellyRatingContribution += 1;
				if(kGAMECLASS.pc.hasStatusEffect("Ovalasting Big Egg " + pregSlot))
				{
					kGAMECLASS.pc.bellyRatingMod += 1;
					pData.pregnancyBellyRatingContribution += 1;
				}
			}, true);
			// 135 hours
			this.addStageProgression(10080 - (136 * 60), function(pregSlot:int):void
			{
				// 12 months preg appearance if small eggs (60), inhumanly gone if large (80)
				var bigEgg:Boolean = (kGAMECLASS.pc.hasStatusEffect("Ovalasting Big Egg " + pregSlot));
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 2;
				pData.pregnancyBellyRatingContribution += 2;
				if(bigEgg)
				{
					kGAMECLASS.pc.bellyRatingMod += 2;
					pData.pregnancyBellyRatingContribution += 2;
				}
				var msg:String = "The Ovalasting eggs can’t be dividing anymore. Surely. Every inch of your " + (pregSlot == 3 ? "[pc.asshole]" : "[pc.vagina " + pregSlot + "]") + " is taken up by round, smooth weight; for all outward appearances, it looks like some megalithic alien queen has stuffed you utterly full with her brood, engorging you with inexorably developing love.";
				if(bigEgg) msg += " In some ways you’re glad that you got your [pc.ass] bent over and ‘fertilized’ them a second time; the deep urge to do so has faded, leaving you to simply simmer in the plush, overripe sensation of being an expectant mom to so many big, beautiful eggs.";
				else msg += " The desire to find some virile, big-dicked someone to soak your cum-hungry clutch hasn’t faded, and heat shimmers down the length of your " + (pregSlot == 3 ? "[pc.asshole]" : "[pc.vagina " + pregSlot + "]") + (kGAMECLASS.pc.hasVagina() ? ", making you drip [pc.femcum]" : "") + ", impelling you to find a good, strong breeder. But the sane, dry part of you tells you that probably isn’t a good idea.";
				msg += "\n\nSome feat of technological magic is keeping them firmly in place. Whenever the thought of forcing them out occurs, your big, heavy clutch seems to shrink inwards, refusing to countenance it. But they can’t stay up you forever, surely?";
				
				AddLogEvent(ParseText(msg), "passive");
			}, true);
			this.addStageProgression(10080 - (128 * 60), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 2;
				pData.pregnancyBellyRatingContribution += 2;
				if(kGAMECLASS.pc.hasStatusEffect("Ovalasting Big Egg " + pregSlot))
				{
					kGAMECLASS.pc.bellyRatingMod += 2;
					pData.pregnancyBellyRatingContribution += 2;
				}
			}, true);
			this.addStageProgression(10080 - (120 * 60), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 2;
				pData.pregnancyBellyRatingContribution += 2;
				if(kGAMECLASS.pc.hasStatusEffect("Ovalasting Big Egg " + pregSlot))
				{
					kGAMECLASS.pc.bellyRatingMod += 2;
					pData.pregnancyBellyRatingContribution += 2;
				}
			}, true);
			this.addStageProgression(10080 - (112 * 60), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 2;
				pData.pregnancyBellyRatingContribution += 2;
				if(kGAMECLASS.pc.hasStatusEffect("Ovalasting Big Egg " + pregSlot))
				{
					kGAMECLASS.pc.bellyRatingMod += 2;
					pData.pregnancyBellyRatingContribution += 2;
				}
			}, true);
			this.addStageProgression(10080 - (104 * 60), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 2;
				pData.pregnancyBellyRatingContribution += 2;
				if(kGAMECLASS.pc.hasStatusEffect("Ovalasting Big Egg " + pregSlot))
				{
					kGAMECLASS.pc.bellyRatingMod += 2;
					pData.pregnancyBellyRatingContribution += 2;
				}
			}, true);
			// 4 days
			this.addStageProgression(10080 - (96 * 60), function(pregSlot:int):void
			{
				// 10 months preg appearance (50)
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 5;
				pData.pregnancyBellyRatingContribution += 5;
				var msg:String = "You are forced to " + (kGAMECLASS.pc.isBiped() ? "sit" : "lay") + " yourself down, a burping moan forced out of your lips. For how much longer are the Ovalasting eggs going to continue multiplying?! The walls of your " + (pregSlot == 3 ? "bowels are" : "womb is") + " stretched thin with the dense weight inside of " + (pregSlot == 3 ? "them" : "it") + ", yet every few hours pleasure quakes through you as another forms, pushing against all the rest. Your belly is now bulging well out in front of you, your gait turned to a";
				if(kGAMECLASS.pc.hasLegs()) msg += " splay-footed";
				msg += " waddle in order to bear it. You spend a couple of minutes just taking long, deep breaths, letting your body settle and get used to being a loving, overstuffed incubator, before carefully picking yourself up and carrying on.";
				
				AddLogEvent(msg, "passive");
			}, true);
			this.addStageProgression(10080 - (88 * 60), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 5;
				pData.pregnancyBellyRatingContribution += 5;
			}, true);
			this.addStageProgression(10080 - (80 * 60), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 5;
				pData.pregnancyBellyRatingContribution += 5;
			}, true);
			this.addStageProgression(10080 - (72 * 60), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 5;
				pData.pregnancyBellyRatingContribution += 5;
			}, true);
			// 65 hours
			this.addStageProgression(10080 - (64 * 60), function(pregSlot:int):void
			{
				// 4 months preg appearance (30)
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 5;
				pData.pregnancyBellyRatingContribution += 5;
				var msg:String = "Your gut is obviously swollen, protruding out in front of you, the ever-multiplying eggs pressing against the sensitive linings of your body.";
				if(kGAMECLASS.pc.totalPregnancies() != 1) msg += " The different loads you’re carrying shift against each other, both uncomfortable and intensely pleasurable, little quakes and shifting pressures intermittently assailing your senses.";
				msg += " It’s difficult to concentrate on anything but the sensual reality of your body constantly enlarging, eggs seeming to fill every inch of your insides...";
				
				AddLogEvent(msg, "passive");
			}, true);
			this.addStageProgression(10080 - (56 * 60), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 5;
				pData.pregnancyBellyRatingContribution += 5;
			}, true);
			// 48 hours
			this.addStageProgression(10080 - (48 * 60), function(pregSlot:int):void
			{
				// 3 months preg appearance (20)
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 4;
				pData.pregnancyBellyRatingContribution += 4;
				var msg:String = "You huff slightly as the [pc.skin] of your belly stretches outwards a little more, another egg swelling into existence within your " + (pregSlot == 3 ? "intestines" : "womb") + ". There’s a warm, fizzing sensation in there, a fertile business that you suspect is only just getting started. You bite your lip at the thought.";
				
				AddLogEvent(ParseText(msg), "passive");
			}, true);
			this.addStageProgression(10080 - (40 * 60), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 2;
				pData.pregnancyBellyRatingContribution += 2;
			}, true);
			this.addStageProgression(10080 - (32 * 60), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 2;
				pData.pregnancyBellyRatingContribution += 2;
			}, true);
			// 18 hours
			this.addStageProgression(10080 - (24 * 60), function(pregSlot:int):void
			{
				// 2 months pregnant appearance (12)
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 2;
				pData.pregnancyBellyRatingContribution += 2;
				var msg:String = (kGAMECLASS.pc.totalPregnancies() == 1 ? "Your belly has taken on a slight bulge" : "Your belly has become even more swollen") + ", your " + (pregSlot == 3 ? "guts" : "womb") + " heavy with a warm glow. There can’t be any doubt; <b>the Ovalasting egg is beginning the process of multiplying within you!</b>";
				
				AddLogEvent(msg, "passive");
			}, true);
			this.addStageProgression(10080 - (16 * 60), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 2;
				pData.pregnancyBellyRatingContribution += 2;
			}, true);
			this.addStageProgression(10080 - (8 * 60), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 2;
				pData.pregnancyBellyRatingContribution += 2;
			}, true);
			this.addStageProgression(10080 - (4 * 60), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 2;
				pData.pregnancyBellyRatingContribution += 2;
			}, true);
			this.addStageProgression(10080 - (2 * 60), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 2;
				pData.pregnancyBellyRatingContribution += 2;
			}, true);
			this.addStageProgression(10080 - 60, function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 2;
				pData.pregnancyBellyRatingContribution += 2;
			}, true);
			// 10 mins afterwards
			this.addStageProgression(10080 - 10, function(pregSlot:int):void
			{
				var msg:String = "Despite the hefty, gloopy load that just got packed into your " + (pregSlot == 3 ? "[pc.asshole]" : "[pc.vagina " + pregSlot + "]") + ", you aren’t experiencing as much leakage as you’d expect";
				if(!kGAMECLASS.pc.isCrotchExposed()) msg += ", your [pc.lowerGarment] remaining in a surprisingly saintly state";
				msg += ". There’s a vague, warm glow in your " + (pregSlot == 3 ? "bowels" : "womb") + ", as if something were busily absorbing the sexual fluids. Your [pc.belly] emits a low gurgle; you pass a soothing hand over it.";
				
				AddLogEvent(ParseText(msg), "passive");
				
				// Load in hole status removed
				if(pregSlot == 3) kGAMECLASS.pc.removeStatusEffect("Anally-Filled");
				else kGAMECLASS.pc.removeStatusEffect("Vaginally-Filled");
			}, true);
			
			_onSuccessfulImpregnation = ovalastingOnSuccessfulImpregnation;
			_onDurationEnd = ovalastingOnDurationEnd;
		}
		
		public static function ovalastingOnSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			pData.pregnancyQuantity = kGAMECLASS.ovalastingEggCount(mother, pregSlot);
			var pEggs:int = pData.pregnancyQuantity;
		}
		
		public static function ovalastingOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			if(mother.hasStatusEffect("Ovalasting Big Egg " + pregSlot)) mother.setStatusValue(("Ovalasting Big Egg " + pregSlot), 1, 1);
			
			var tEventCall:Function = (function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
			{
				return function():void
				{
					kGAMECLASS.ovalastingPregnancyEnds(c_pregSlot, pData.pregnancyQuantity, StatTracking.getStat("pregnancy/ovalasting eggs laid"));
					OvalastingEggPregnancy.cleanupPregnancy(c_mother, c_pregSlot, c_thisPtr);
				}
			})(mother, pregSlot, thisPtr);
			
			kGAMECLASS.eventQueue.push(tEventCall);
		}
		
		public static function cleanupPregnancy(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			mother.removeStatusEffect("Ovalasting Early Clutch");
			
			StatTracking.track("pregnancy/ovalasting eggs laid", pData.pregnancyQuantity);
			
			pData.reset();
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBirthTimestamp:uint):Child
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			if(mother.hasStatusEffect("Ovalasting Big Egg " + pregSlot)) mother.setStatusValue(("Ovalasting Big Egg " + pregSlot), 1, 1);
			mother.createStatusEffect(("Ovalasting Eggs " + pregSlot), pData.pregnancyQuantity, 0, 0, 0, true, "", "", false);
			
			// Loot egg!
			kGAMECLASS.eventQueue.push(kGAMECLASS.ovalastingNurseryEnds);
			
			OvalastingEggPregnancy.cleanupPregnancy(mother, pregSlot, this);
			return null;
		}
		
		/*
		override public function pregBellyFragment(target:Creature, slot:int):String
		{
			return "";
		}
		*/
	}

}