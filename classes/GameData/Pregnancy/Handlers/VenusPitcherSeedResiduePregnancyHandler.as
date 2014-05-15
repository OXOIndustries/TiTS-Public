package classes.GameData.Pregnancy.Handlers 
{
	import classes.Creature;
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	/**
	 * ...
	 * @author Gedan
	 */
	public class VenusPitcherSeedResiduePregnancyHandler extends BasePregnancyHandler
	{
		
		public function VenusPitcherSeedResiduePregnancyHandler() 
		{
			_handlesType = "VenusPitcherSeedResidue";
			_basePregnancyIncubationTime = 1; // Gone after the initial handling -- relying on status effect for the magic
			_basePregnancyChance = 1;
			_alwaysImpregnate = true;
			_ignoreInfertility = true;
			_ignoreMotherInfertility = true;
			_ignoreFatherInfertility = true;
			_canImpregnateButt = false;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMaximum = 1;
			_pregnancyQuantityMinimum = 1;
			
			onTryImpregnate = VenusPitcherSeedResiduePregnancyHandler.seedResidueOnTryImpregnate;
		}
		
		public static function seedResidueOnTryImpregnate(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):Boolean
		{
			if (mother.hasPregnancyOfType("VenusPitcherSeedCarrier"))
			{
				// Convert pregnancy over to Fertilized
				return true;
			}
			else
			{
				if (!mother.hasStatusEffect("Venus Pitcher Seed Residue"))
				{
					mother.createStatusEffect("Venus Pitcher Seed Residue", 0, 0, 0, 0, true, "", "", false, 20160); // 2 weeks
				}
				else
				{
					mother.setStatusMinutes("Venus Pitcher Seed Residue", 20160); // Reset back to 2 weeks
				}
				return false;
			}
		}
	}

}