package classes.GameData.Pregnancy.Handlers 
{
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.GameData.StatTracking;
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.PregnancyData;
	import classes.kGAMECLASS;
	import classes.GLOBAL;
	import classes.Engine.Interfaces.ParseText;
	import classes.Engine.Utility.rand;
	
	public class EggTrainerCarryTraining extends BasePregnancyHandler
	{
		public function EggTrainerCarryTraining() 
		{
			_handlesType = "EggTrainerCarryTraining";
			_basePregnancyIncubationTime = (160 + rand(8)) * 60; //Approx 7 days, aka 168 hours
			_basePregnancyChance = 1;
			_alwaysImpregnate = true;
			_ignoreInfertility = true;
			_ignoreMotherInfertility = true;
			_ignoreFatherInfertility = true;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = true;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 6;
			_pregnancyQuantityMaximum = 9002;
			_definedAverageLoadSize = 240;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_EGGS;
			
			var msg:String = "";		
			
			_onSuccessfulImpregnation = eggTrainerCarryTrainingSuccessfulImpregnation;
			_onDurationEnd = eggTrainerCarryTrainingEnd;
		}
		
		public static function eggTrainerCarryTrainingSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			pData.pregnancyQuantity = kGAMECLASS.eggTrainingEggCount();
			var pEggs:int = pData.pregnancyQuantity;

			pData.pregnancyBellyRatingContribution += (1 * pEggs);
			mother.bellyRatingMod += pData.pregnancyBellyRatingContribution;
			if(!kGAMECLASS.pc.hasStatusEffect("Eggy Belly")) kGAMECLASS.pc.createStatusEffect("Eggy Belly", 0, 0, pEggs, 0, false, "Icon_DrugPill", "You've got a nice belly full of eggs to enjoy, courtesy of the bright pink Egg Trainer back on your ship.", false, 0);
		}
		
		public static function eggTrainerCarryTrainingEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			var tEventCall:Function = (function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
			{
				return function():void
				{
					kGAMECLASS.eggTrainerCarryTrainingEnds(c_pregSlot, pData.pregnancyQuantity);
					EggTrainerCarryTraining.cleanupPregnancy(c_mother, c_pregSlot, c_thisPtr);
				}
			})(mother, pregSlot, thisPtr);
			
			kGAMECLASS.eventQueue.push(tEventCall);
		}
		
		public static function cleanupPregnancy(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/egg trainer eggs laid", pData.pregnancyQuantity);
			// doesn't count as offspring!
			
			pData.reset();
		}
		
		override public function pregBellyFragment(target:Creature, slot:int):String
		{
			var pData:PregnancyData = target.pregnancyData[slot];
			var retString:String = "";
			
			// This would have been 9, but it would be impossible to hit it given the cap is 9 eggs, and the first is laid when the ^ status effect is applied
			if (pData.pregnancyQuantity <= 25) return "The eggs inside you are noticeable through your baby bump. Though not distinguishable from a distance, close inspection reveals your slightly strained flesh to be somewhat lumpy and uneven, thanks to the many small eggs clumped inside you.";
			else if (pData.pregnancyQuantity <= 75) return "Your skin is unevenly bulging and shifts constantly as the many, many eggs inside you. Every step makes your full gut jiggle, sending little shockwaves of pleasure through you.";
			else return "Your belly is hugely swollen, full of what must be near to a hundred plastic eggs that rustle, shift, and jostle inside you with even the slightest motion. You’re in a constantly state of near-orgasmic high from the unending sensation, shivering every time you take a step or rub a hand against your belly.";
		}
		
	}

}