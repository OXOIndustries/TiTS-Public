package classes.GameData.Pregnancy.Handlers 
{
	import classes.Creature;
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.PregnancyData;
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class VenusPitcherFertilizedSeedCarrierHandler extends BasePregnancyHandler
	{
		
		public function VenusPitcherFertilizedSeedCarrierHandler() 
		{
			_handlesType = "VenusPitcherFertilizedSeedCarrier";
			_basePregnancyIncubationTime = 1440;
			_basePregnancyChance = 1;
			_alwaysImpregnate = true;
			_ignoreMotherInfertility = true;
			_ignoreInfertility = true;
			_ignoreFatherInfertility = true;
			_allowMultiplePregnancies = false;
			_canImpregnateButt = false;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 4;
			_pregnancyQuantityMaximum = 9;
			
			this.addStageProgression(600, kGAMECLASS.rumblyInYourTummy);
			this.addStageProgression(240, kGAMECLASS.poppingSoonAlert1);
			this.addStageProgression(60, kGAMECLASS.poppingSoonAlert2);
			
			onDurationEnd = VenusPitcherFertilizedSeedCarrierHandler.FertilizedVenusPitcherOnDurationEnd;
		}

		public static function FertilizedVenusPitcherOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			if (!mother.hasStatusEffect("Venus Pitcher Egg Incubation Finished"))
			{
				mother.createStatusEffect("Venus Pitcher Egg Incubation Finished");
			}
			
			kGAMECLASS.eventQueue.push(function():void {
					kGAMECLASS.layFertilizedVenusPitcherEgg();
					VenusPitcherFertilizedSeedCarrierHandler.cleanupPregnancy(kGAMECLASS.pc);
				});
		}
	
		public static function convertPregnancy(father:Creature, mother:Creature, pregSlot:int):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot];
			pData.pregnancyType = "VenusPitcherFertilizedSeedCarrier";
			pData.pregnancyIncubation = 1440;
			
			// Remove the seed residue effect as part of the fertilization process.
			if (mother.hasStatusEffect("Venus Pitcher Seed Residue"))
			{
				mother.removeStatusEffect("Venus Pitcher Seed Residue");
			}
			
			// Remove the existing initial incubation time marker
			if (mother.hasStatusEffect("Venus Pitcher Egg Incubation Finished"))
			{
				mother.removeStatusEffect("Venus Pitcher Egg Incubation Finished");
			}
			
			// Do some outpootis.
			kGAMECLASS.eventBuffer += "Your womb rumbles audibly as the plant-matter inside you reacts to something, and your [pc.belly] visibly swells.";
			
			if (kGAMECLASS.flags["LAID VENUS PITCHER SEEDS"] != undefined) kGAMECLASS.eventBuffer += " Mmmm, another batch of pods are growing inside you.";
			else kGAMECLASS.eventBuffer += " The stuff the venus pitcher put inside you... it's growing!";
			
			kGAMECLASS.eventBuffer += " A few droplets of pale-green slime leak from your lips";
			
			if (mother.isCrotchGarbed()) kGAMECLASS.eventBuffer += " into your " + mother.lowerUndergarment.longName;
			
			kGAMECLASS.eventBuffer += ".";

			// Change bellyMod
			mother.bellyRatingMod += 2 * pData.pregnancyQuantity;
		}
		
		public static function cleanupPregnancy(target:Creature):void
		{
			if (target.hasStatusEffect("Venus Pitcher Seed Residue"))
			{
				target.setStatusMinutes("Venus Pitcher Seed Residue", 20160);
			}
			else
			{
				target.createStatusEffect("Venus Pitcher Seed Residue", 0, 0, 0, 0, true, "", "", false, 20160);
			}
			
			var pData:PregnancyData	= target.getPregnancyOfType("VenusPitcherFertilizedSeedCarrier");
			pData.pregnancyQuantity--;
			target.bellyRatingRaw -= 14;
			
			if (pData.pregnancyQuantity == 0)
			{
				if (target.hasStatusEffect("Venus Pitcher Egg Incubation Finished")) target.removeStatusEffect("Venus Pitcher Egg Incubation Finished");
				pData.reset();
			}
		}
	}
}