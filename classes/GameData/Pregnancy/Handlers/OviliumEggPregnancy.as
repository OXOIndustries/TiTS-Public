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
	import classes.Engine.Interfaces.ExtendLogEvent;
	
	public class OviliumEggPregnancy extends BasePregnancyHandler
	{
		public function OviliumEggPregnancy() 
		{
			_handlesType = "OviliumEggPregnancy";
			_basePregnancyIncubationTime = ((12 + rand(7)) * 60); // 12 to 18 hours
			_basePregnancyChance = 1;
			_alwaysImpregnate = true;
			_ignoreInfertility = true;
			_ignoreMotherInfertility = true;
			_ignoreFatherInfertility = true;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = false;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 12;
			_pregnancyQuantityMaximum = 48;
			_definedAverageLoadSize = 2400;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_EGGS;
			
			var x:int = 0;
			var eggSizeRating:Number = 0.125; // just in case this value needs tweaking
			
			// Grow belly every hour, withc special events at a certain hour.
			for (x = 11; x >= 1; x--)
			{
				// (8 hours left)
				if (x == 8)
				{
					this.addStageProgression((x * 60), function(pregSlot:int):void
					{
						var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
						kGAMECLASS.pc.bellyRatingMod += eggSizeRating * pData.pregnancyQuantity;
						pData.pregnancyBellyRatingContribution += eggSizeRating * pData.pregnancyQuantity;
						var msg:String = "A ticklish throbbing ignites in your loins, signaling the start of the birthing process. It’s only a matter of time now before the eggs push their way out of you";
						if (StatTracking.getStat("pregnancy/ovilium eggs laid") > 0) msg += ", leaving you empty once more";
						msg += ". Some part of you yearns for that release, while another is content with rubbing your pregnant-looking stomach.";
						
						AddLogEvent(msg, "passive");
						kGAMECLASS.pc.energy(-5);
						kGAMECLASS.pc.lust(10);
					}, true);
				}
				// (with 4 hours left)
				else if (x == 4)
				{
					this.addStageProgression((x * 60), function(pregSlot:int):void
					{
						var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
						kGAMECLASS.pc.bellyRatingMod += eggSizeRating * pData.pregnancyQuantity;
						pData.pregnancyBellyRatingContribution += eggSizeRating * pData.pregnancyQuantity;
						
						AddLogEvent("Your stomach lets out a contraction that nearly causes you to lose your balance. The eggs inside you must be nearly ready to lay. You’d say you still have some time to get things done.", "passive");
						
						kGAMECLASS.pc.energy(-10);
					}, true);
				}
				// (2 hour warning)
				else if (x == 2)
				{
					this.addStageProgression((x * 60), function(pregSlot:int):void
					{
						var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
						kGAMECLASS.pc.bellyRatingMod += eggSizeRating * pData.pregnancyQuantity;
						pData.pregnancyBellyRatingContribution += eggSizeRating * pData.pregnancyQuantity;
						
						var msg:String = "You";
						if (kGAMECLASS.pc.hasKnees()) msg += "r knees buckle";
						else msg += " almost trip over yourself";
						msg += " as a contraction hits you. These eggs are coming soon, so unless you’re planning on showing everyone around, you had better get to somewhere personal. The eggs won’t wait once it’s time.";
						
						AddLogEvent(msg, "passive");
						kGAMECLASS.pc.energy(-20);
					}, true);
				}
				// Every hour, grow eggs/belly.
				else
				{
					this.addStageProgression((x * 60), function(pregSlot:int):void
					{
						var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
						kGAMECLASS.pc.bellyRatingMod += eggSizeRating * pData.pregnancyQuantity;
						pData.pregnancyBellyRatingContribution += eggSizeRating * pData.pregnancyQuantity;
					}, true);
				}
			}
			// (random before laying, +lust if repeat)
			this.addStageProgression(((2.5 * 60) + (rand(_basePregnancyIncubationTime - (3 * 60)))), function(pregSlot:int):void
			{
				var msg:String = ParseText("You find yourself idly tapping your belly, running a hand over the smooth [pc.skinFurScalesNoun].");
				msg += " The relatively quick pregnancy induced by " + (kGAMECLASS.pc.statusEffectv4("Ovilium") == 0 ? "the Ovilium" : "your egg-generating body") + " means you’ll be laying within the day.";
				if (StatTracking.getStat("pregnancy/ovilium eggs laid") > 0)
				{
					msg += " You can’t wait.";
					kGAMECLASS.pc.lust(10);
				}
				AddLogEvent(msg, "passive");
			}, true);
			
			_onSuccessfulImpregnation = oviliumOnSuccessfulImpregnation;
			_onDurationEnd = oviliumOnDurationEnd;
		}
		
		public static function oviliumOnSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			var pEggs:int = pData.pregnancyQuantity;
			pData.pregnancyBellyRatingContribution += (1 * pEggs);
			mother.bellyRatingMod += pData.pregnancyBellyRatingContribution;
			
			if (!mother.hasStatusEffect("Ovilium"))
			{
				// v1 = number of successive doses (in case needed)
				// v2 = cream pie counts (fertilized for big egg)
				// v3 = Temporary egg count (in case needed)
				// v4 = source: 0 from drug, 1 from perk
				mother.createStatusEffect("Ovilium", 1, 0, pEggs, 0, true, "Icon_DrugPill", "Currently under the effects of Ovilium.", false, 0);
			}
			else
			{
				mother.addStatusValue("Ovilium", 1, 1);
				mother.addStatusValue("Ovilium", 3, pEggs);
				mother.setStatusValue("Ovilium", 4, 0);
			}
		}
		
		public static function oviliumOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			var tEventCall:Function = (function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
			{
				return function():void
				{
					kGAMECLASS.oviliumPregnancyEnds(c_pregSlot, pData.pregnancyQuantity, StatTracking.getStat("pregnancy/ovilium eggs laid"));
					OviliumEggPregnancy.cleanupPregnancy(c_mother, c_pregSlot, c_thisPtr);
				}
			})(mother, pregSlot, thisPtr);
			
			kGAMECLASS.eventQueue.push(tEventCall);
		}
		
		public static function cleanupPregnancy(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			if(mother.hasStatusEffect("Ovilium")) mother.addStatusValue("Ovilium", 3, (-1 * pData.pregnancyQuantity));
			
			StatTracking.track("pregnancy/ovilium eggs laid", pData.pregnancyQuantity);
			// doesn't count as offspring!
			//StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			
			pData.reset();
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBirthTimestamp:uint):Child
		{
			// Loot egg!
			kGAMECLASS.eventQueue.push(kGAMECLASS.oviliumNurseryEnds);
			
			OviliumEggPregnancy.cleanupPregnancy(mother, pregSlot, this);
			return null;
		}
		
		/*
		override public function pregBellyFragment(target:Creature, slot:int):String
		{
			return "The Ovilium is definitely doing its job seeing as your belly is quite bloated. You could actually pass for being pregnant, though running your hands over your belly’s soft yet lumpy surface reveals what your womb really has in stock.";
		}
		*/
	}

}