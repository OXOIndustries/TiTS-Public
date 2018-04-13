﻿package classes.GameData.Pregnancy.Handlers 
{
	import classes.Creature;
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.PregnancyData;
	import classes.kGAMECLASS;
	import classes.GLOBAL;
	import classes.Engine.Interfaces.ParseText;
	import classes.Engine.Utility.rand;
	import classes.GameData.Pregnancy.PregnancyManager;
	import classes.GameData.ChildManager;
	import classes.GameData.Pregnancy.Child;
	import classes.GameData.StatTracking;
	import classes.Engine.Interfaces.AddLogEvent;
	
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
			_pregnancyChildType = GLOBAL.CHILD_TYPE_SEED;
			_pregnancyChildRace = GLOBAL.TYPE_VENUSPITCHER;
			_childMaturationMultiplier = 1.0;
			_childGenderWeights.Male = 0;
			_childGenderWeights.Female = 1;
			
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
			
			kGAMECLASS.eventQueue.push(VenusPitcherFertilizedSeedCarrierHandler.doEggLay);
		}
		
		public static function doEggLay():void {
			kGAMECLASS.layFertilizedVenusPitcherEgg();
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
			AddLogEvent(ParseText("Your womb rumbles audibly as the plant-matter inside you reacts to something, and your [pc.belly] visibly swells." + (kGAMECLASS.flags["LAID VENUS PITCHER SEEDS"] != undefined ? " Mmmm, another batch of pods are growing inside you, fertilized by your latest tryst." : " The stuff the venus pitcher put inside you... it’s growing! The latest pitcher must have done something to it... fertilized it, perhaps.") + " A few droplets of pale-green slime leak from your lips" + (mother.isCrotchGarbed() ? " into your " + mother.lowerUndergarment.longName + ".": ".")), "passive");
			
			// Change bellyMod
			mother.addPregnancyBellyMod(pregSlot, 4, true);
		}
		
		public static function cleanupPregnancy(target:Creature, pregSlot:int = -1):void
		{
			if(target == null || pregSlot < 0)
			{
				/* Error, no pregnancy! */
				return;
			}
			
			if (target.hasStatusEffect("Venus Pitcher Seed Residue"))
			{
				target.setStatusMinutes("Venus Pitcher Seed Residue", 20160);
			}
			else
			{
				target.createStatusEffect("Venus Pitcher Seed Residue", 0, 0, 0, 0, true, "", "", false, 20160);
			}
			
			var pData:PregnancyData	= target.pregnancyData[pregSlot];
			
			if(pData == null || pData.pregnancyType != "VenusPitcherFertilizedSeedCarrier")
			{
				/* Error, no pregnancy! */
				return;
			}
			
			pData.pregnancyQuantity--;
			pData.pregnancyIncubation = 240 + rand(30);
			target.addPregnancyBellyMod(pregSlot, -14, false);
			
			if (pData.pregnancyQuantity <= 0)
			{
				if (target.hasStatusEffect("Venus Pitcher Egg Incubation Finished")) target.removeStatusEffect("Venus Pitcher Egg Incubation Finished");
				target.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
				pData.reset();
			}
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBornTimestamp:uint):Child
		{
			if (mother.hasStatusEffect("Venus Pitcher Seed Residue")) mother.removeStatusEffect("Venus Pitcher Seed Residue");
			
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			var c:Child = Child.NewChild(GLOBAL.TYPE_VENUSPITCHER, 1.0, pData.pregnancyQuantity, 0, 1, 0, 0);
			c.BornTimestamp = useBornTimestamp;
			ChildManager.addChild(c);
			
			StatTracking.track("pregnancy/venus pitcher seeds", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/fertilized venus pitcher seeds/day care", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			pData.reset();
			
			return c;
		}
		
		override public function getRemainingDuration(target:Creature, slot:int):int
		{
			var pData:PregnancyData = target.pregnancyData[slot];
			var remains:int = pData.pregnancyIncubation / pData.pregnancyIncubationMulti;
			if (pData.pregnancyQuantity > 1) remains += ((240 + rand(30)) * (pData.pregnancyQuantity - 1));
			return remains;
		}
		
		/**
		 * Fertilized seeds will make reference to the squirmly tentacle arm things, and the fact
		 * the size is effectively inverted.
		 * 
		 * Some of this text + logic might be pretty dumb, but I'm ill as fuck and I want to DO something.
		 * @param	target
		 * @param	slot
		 * @return
		 */
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
					retString += "The [pc.skinFurScales] covering your belly occasionally ";
					if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) retString += "writhe";
					else retString += "writhes";
					retString += " under the motions of the seed pod";
					if(pData.pregnancyQuantity > 1) retString += "s";
					retString += " packed into your womb.";
				}
				else if (pData.pregnancyIncubation <= 600)
				{
					retString += "Hints of slime are once again leaking down your [pc.thighs]. Your [pc.vagina " + slot + "] must be preparing itself for the upcoming task the Venus Pitchers have burdened your womb with.";
				}
			}
			else
			{
				// Eggs still incubating
				if (pData.pregnancyIncubation <= 60)
				{
					retString += "You’ll be laying soon, you’re sure of it. Your [pc.vagina " + slot + "] has grown wetter and eager, birth-slime practically dripping out of you.";
				}
				else if (pData.pregnancyIncubation <= 120)
				{
					retString += "The [pc.skinFurScales] covering your belly occasionally ";
					if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) retString += "writhe";
					else retString += "writhes";
					retString += " under the motions of the object";
					if(pData.pregnancyQuantity > 1) retString += "s";
					retString += " packed into your womb.";
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