package classes.GameData.Pregnancy.Handlers 
{
	import classes.Creature;
	import classes.GameData.Pregnancy.PregnancyManager;
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class VenusPitcherSeedCarrierPregnancyHandler extends BasePregnancyHandler
	{
		
		public function VenusPitcherSeedCarrierPregnancyHandler() 
		{
			_handlesType = "VenusPitcherSeedCarrier";
			_basePregnancyIncubationTime = 4320;
			_basePregnancyChance = 1;
			_alwaysImpregnate = true;
			_ignoreInfertility = true;
			_ignoreMotherInfertility = true;
			_ignoreFatherInfertility = true;
			_allowMultiplePregnancies = false;
			_canImpregnateButt = false;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 4;
			_pregnancyQuantityMaximum = 9;
			
			onSuccessfulImpregnation = VenusPitcherSeedCarrierPregnancyHandler.seedCarrierOnSuccessfulImpregnation;
			onDurationEnd = VenusPitcherSeedCarrierPregnancyHandler
		}
		
		public static function seedCarrierOnSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):Boolean
		{
			// Use the default to setup all the values and shit for us
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			
			// Bellymod from the eggs
			mother.bellyRatingMod += 10 * mother.pregnancyData[pregSlot].pregnancyQuantity;
			
			// Now check if we need to convert the pregnancy type
			if (mother.hasStatusEffect("Venus Pitcher Seed Residue"))
			{
				VenusPitcherFertilizedSeedCarrierHandler.convertPregnancy(father, mother, pregSlot);
			}
			
			return true;
		}
		
		public static function seedCarrierOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			// Initial incubation
			if (!mother.hasStatusEffect("Venus Pitcher Egg Incubation Finished"))
			{
				mother.createStatusEffect("Venus Pitcher Egg Incubation Finished");
				mother.pregnancyData[pregSlot].pregnancyIncubation = 960 + rand(1200); // 16 - 36 hours
			}
			
			kGAMECLASS.eventQueue.push(kGAMECLASS.venusPitcherLayUnfertilizedEgg());
		}
	}

}