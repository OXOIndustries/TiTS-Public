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
			_pregnancyQuantityMaximum = 7;
			
			onTryImpregnate = VenusPitcherSeedCarrierPregnancyHandler.seedCarrierOnTryImpregnate;
			onSuccessfulImpregnation = VenusPitcherSeedCarrierPregnancyHandler.seedCarrierOnSuccessfulImpregnation;
			onDurationEnd = VenusPitcherSeedCarrierPregnancyHandler.seedCarrierOnDurationEnd;
		}
		
		public static function seedCarrierOnTryImpregnate(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):Boolean
		{
			// Fail if there's already an existing Fertilized pregnancy path ongoing
			if (mother.hasPregnancyOfType("VenusPitcherFertilizedSeedCarrier")) return false;
			
			// If we need to find a slot
			if (pregSlot == -1)
			{
				// Let the later code handle this for us, just true shit up for now
				if (mother.hasPregnancyOfType(thisPtr.handlesType)) return true;
				
				// But if there's no available slot, and no existing pregnancy that can be "upgraded", then fail
				pregSlot = mother.findEmptyPregnancySlot();
				if (pregSlot == -1) return false;
			}
			
			return true;
		}
		
		public static function seedCarrierOnSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			if (thisPtr.debugTrace) trace("VenusPitcherSeedCarrierPregnancyHandler onSuccessfulImpregnation handler called.");
			
			// If a second impregnation attempt happens whilst unfertilized, convert to Fertilized
			if (mother.hasPregnancyOfType(thisPtr.handlesType))
			{
				if (thisPtr.debugTrace) trace("Converting Venus Pitcher Seed Carrier to Fertilized Variant");
				VenusPitcherFertilizedSeedCarrierHandler.convertPregnancy(father, mother, mother.findPregnancyOfType(thisPtr.handlesType));
				return;
			}
			
			if (pregSlot == -1)
			{
				pregSlot = mother.findEmptyPregnancySlot();
				
				if (pregSlot == -1)
				{
					if (thisPtr.debugTrace) trace("No empty pregnancy slots, aborting.");
					return;
				}
			}
			
			// Otherwise, create the base data used for the pregnancy
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			
			// Bellymod from the eggs
			mother.bellyRatingMod += 10 * mother.pregnancyData[pregSlot].pregnancyQuantity;
			(mother.pregnancyData[pregSlot] as PregnancyData).pregnancyBellyRatingContribution = 10 * mother.pregnancyData[pregSlot].pregnancyQuantity;
			
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
			
			kGAMECLASS.eventQueue.push(
				function():Function {
					return function():void {
						if (kGAMECLASS.pc.getPregnancyOfType("VenusPitcherSeedCarrier") != null) 
						{
							kGAMECLASS.venusPitcherLayUnfertilizedEgg();
							VenusPitcherSeedCarrierPregnancyHandler.cleanupPregnancy(kGAMECLASS.pc);
						}
					}
				}()
			);
		}
		
		public static function cleanupPregnancy(target:Creature):void
		{
			var pData:PregnancyData = target.getPregnancyOfType("VenusPitcherSeedCarrier");
			
			pData.pregnancyQuantity--;
			pData.pregnancyIncubation = 240 + rand(30);
			pData.pregnancyBellyRatingContribution -= 10;
			target.bellyRatingMod -= 10;
			
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
		
		override public function pregBellyFragment(target:Creature, slot:int):String
		{
			var pData:PregnancyData = target.pregnancyData[slot];
			var retString:String = "";
			
			// This would have been 9, but it would be impossible to hit it given the cap is 9 eggs, and the first is laid when the ^ status effect is applied
			if (pData.pregnancyQuantity >= 8)
			{
				// Megafull
				retString = "The ovoid objects stuffed into your womb by the venus pitchers form slight bulges in your [pc.skinFurScales]. ";
			}
			else if (pData.pregnancyQuantity >= 7)
			{
				// Full
				retString = "The venus pitcher seed pods stuff your womb to an uncomfortable degree. ";
			}
			else if (pData.pregnancyQuantity >= 4)
			{
				retString = "The venus pitcher seed pods stuff your womb to the brim. ";
			}
			else if (pData.pregnancyQuantity >= 3)
			{
				// First one (minimum) is done, trepidation at the rest
				retString = "The venus pitcher seed pods are still present in your womb. Birthing the pods is an arduous task, but some part of you looks forward to the next time you can experience the process. ";
			}
			else if (pData.pregnancyQuantity > 1)
			{
				// First one (minimum) is done, trepidation at the rest
				retString = "At least two rounded pods are packed into your womb. A pleasant twinge runs through your body at the thought of passing another. ";
			}
			else if (pData.pregnancyQuantity == 1)
			{
				// Had fun, just one left....
				retString = "Your uterine fullness has receded since your initial impregnantion at the tentacle-tips of the venus pitchers, but you can still clearly make out a final pod residing deep within your womb. ";
			}

			if (target.hasStatusEffect("Venus Pitcher Egg Incubation Finished"))
			{
				// Eggs incubated and we're prepping to lay a new one
				if (pData.pregnancyIncubation <= 60)
				{
					retString += "Your [pc.vagina " + slot + "] has grown wetter and eager once more, preparing itself for the coming task of birthing another of the venus pitchers seed pods.";
				}
				else if (pData.pregnancyIncubation <= 120)
				{
					retString += "A veritable waterfall of birthing slime is oozing from your [pc.vagina " + slot + "]. Your body must be preparing itself to birth another of the venus pitchers' gifts.";
				}
				else if (pData.pregnancyIncubation <= 600)
				{
					retString += "Hints of slime are once again leaking down your thighs. Your [pc.vagina " + slot + "] must be preparing itself for the upcoming task the venus pitchers have burdened your womb with.";
				}
			}
			else
			{
				// Eggs still incubating
				if (pData.pregnancyIncubation <= 60)
				{
					retString += "You'll be laying soon, you're sure of it. Your [pc.vagina " + slot + "] has grown wetter and eager, birth-slime practically dripping out of you.";
				}
				else if (pData.pregnancyIncubation <= 120)
				{
					retString += "A veritable waterfall of birthing slime is oozing from your [pc.vagina " + slot + "]. Your body must be preparing itself to birth another of the venus pitchers' gifts.";
				}
				else if (pData.pregnancyIncubation <= 600)
				{
					retString += "Hints of slime leak down your thighs, your [pc.vagina " + slot + "] preparing itself for the upcoming task the venus pitchers have burdened your womb with.";
				}
			}
			
			return retString;
		}
	}

}