package classes.GameData.Pregnancy.Handlers 
{
	import classes.Creature;
	import classes.GameData.Pregnancy.PregnancyManager;
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.kGAMECLASS;
	import classes.PregnancyData;
	import classes.rand;
	
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
			_allowMultiplePregnancies = true;
			_canImpregnateButt = false;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 4;
			_pregnancyQuantityMaximum = 9;
			
			onSuccessfulImpregnation = VenusPitcherSeedCarrierPregnancyHandler.seedCarrierOnSuccessfulImpregnation;
			onDurationEnd = VenusPitcherSeedCarrierPregnancyHandler.seedCarrierOnDurationEnd;
		}
		
		public static function seedCarrierOnSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			// If the mother already has a Fertilized seed pregnancy ongoing
			if (mother.hasPregnancyOfType("VenusPitcherFertilizedSeedCarrier"))
			{
				return;
			}
			
			// If a second impregnation attempt happens whilst unfertilized, convert to Fertilized
			if (mother.hasPregnancyOfType("VenusPitcherSeedCarrier"))
			{
				if (thisPtr.debugTrace) trace("Converting Venus Pitcher Seed Carrier to Fertilized Variant");
				VenusPitcherFertilizedSeedCarrierHandler.convertPregnancy(father, mother, pregSlot);
				return;
			}
			
			// Otherwise, create the base data used for the pregnancy
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			
			// Bellymod from the eggs
			mother.bellyRatingMod += 10 * mother.pregnancyData[pregSlot].pregnancyQuantity;
			
			// If the mother still has the seed residue from a previous seeding, convert to fertilized
			if (mother.hasStatusEffect("Venus Pitcher Seed Residue"))
			{
				VenusPitcherFertilizedSeedCarrierHandler.convertPregnancy(father, mother, pregSlot);
			}
		}
		
		public static function seedCarrierOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			// Initial incubation
			if (!mother.hasStatusEffect("Venus Pitcher Egg Incubation Finished"))
			{
				mother.createStatusEffect("Venus Pitcher Egg Incubation Finished");
				mother.pregnancyData[pregSlot].pregnancyIncubation = 960 + rand(1200); // 16 - 36 hours
			}
			
			kGAMECLASS.eventQueue.push(function():void {
					kGAMECLASS.venusPitcherLayUnfertilizedEgg();
					VenusPitcherSeedCarrierPregnancyHandler.cleanupPregnancy(kGAMECLASS.pc);
				});
		}
		
		public static function cleanupPregnancy(target:Creature):void
		{
			var pData:PregnancyData = target.getPregnancyOfType("VenusPitcherSeedCarrier");
			
			pData.pregnancyQuantity--;
			target.bellyRatingRaw -= 10;
			
			if (pData.pregnancyQuantity == 0)
			{
				pData.reset();
				
				if (target.hasStatusEffect("Venus Pitcher Egg Incubation Finished")) target.removeStatusEffect("Venus Pitcher Egg Incubation Finished");
				
				if (!target.hasStatusEffect("Venus Pitcher Seed Residue"))
				{
					target.createStatusEffect("Venus Pitcher Seed Residue", 0, 0, 0, 0, true, "", "", false, 20160); // 2 weeks
				}
				else
				{
					target.setStatusMinutes("Venus Pitcher Seed Residue", 20160); // Reset back to 2 weeks
				}
			}
		}
	}

}