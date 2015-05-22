package classes.GameData.Pregnancy.Handlers 
{
	import classes.Creature;
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.PregnancyData;
	import classes.kGAMECLASS;
	import classes.GameData.StatTracking;
	import classes.GLOBAL;
	
	/**
	 * This is effectively very similar to the Renvra pregnancy implementation, so I'm copypasting it over
	 * and making a few tweaks here and there to differentiate it some.
	 * @author Gedan
	 */
	public class NyreaHuntressPregnancy extends BasePregnancyHandler
	{
		
		public function NyreaHuntressPregnancy() 
		{
			_handlesType = "NyreaEggPregnancy";
			_basePregnancyIncubationTime = 10080;
			_basePregnancyChance = 1;
			_alwaysImpregnate = true;
			_ignoreInfertility = true;
			_ignoreMotherInfertility = true;
			_ignoreFatherInfertility = true;
			_allowMultiplePregnancies = false;
			_canImpregnateButt = true;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 6;
			_pregnancyQuantityMaximum = 10;
			_definedAverageLoadSize = 720;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_EGGS;
			
			this.addStageProgression(8000, function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 2, true);
			}, true);
			
			this.addStageProgression(6000, function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 2, true);
			}, true);
			
			this.addStageProgression(4000, function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 2, true);
			}, true);
			
			this.addStageProgression(2000, function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 3, true);
			}, true);
			
			this.addStageProgression(240, function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 5, true);
				kGAMECLASS.eventBuffer += "\n\nYou note that your swollen belly is shifting awkwardly. The eggs clinging inside you rumble and move, and you feel distinctly... wet. You doubt you'll be carrying these eggs around with you much longer.";
			}, true);
			
			_onSuccessfulImpregnation = nyreaOnSuccessfulImpregnation;
			_onSuccessfulImpregnationOutput = nyreaOnSuccessfulImpregnationOutput;
			_onDurationEnd = nyreaOnDurationEnd;
		}
		
		public static function nyreaOnSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			
			mother.addPregnancyBellyMod(pregSlot, 10, true);
			
			mother.createStatusEffect("Nyrea Eggs Messages Available");
		}
		
		public static function nyreaEggsMessageHandler(inPublicSpace:Boolean = false, minutes:Number = 0):void
		{
			if (kGAMECLASS.flags["RENVRA_EGGS_MESSAGE_WEIGHT"] == undefined) kGAMECLASS.flags["RENVRA_EGGS_MESSAGE_WEIGHT"] = 0;
			kGAMECLASS.flags["RENVRA_EGGS_MESSAGE_WEIGHT"] += minutes;
			
			var kRoll:Number = kGAMECLASS.rand(360);
			var kChance:Number = kGAMECLASS.flags["RENVRA_EGGS_MESSAGE_WEIGHT"];
			
			if (kRoll < kChance)
			{
				kGAMECLASS.flags["RENVRA_EGGS_MESSAGE_WEIGHT"] = 0;
				if (!inPublicSpace || (kGAMECLASS.hours <= 4 && kGAMECLASS.hours >= 22))
				{
					kGAMECLASS.eventBuffer += "\n\nYou stop yourself, seemingly at random, and plant a hand soothingly over your [pc.belly]. The eggs inside you shift slightly, making your";
					var pSlot:int = kGAMECLASS.pc.findPregnancyOfType("NyreaEggPregnancy");
					if (pSlot == 4) kGAMECLASS.eventBuffer += " stomach rumble";
					else kGAMECLASS.eventBuffer += " belly tremble";
					kGAMECLASS.eventBuffer += ". It's surprisingly nice to just rub your belly, enjoying the fullness of it.";
				}
				else
				{
					kGAMECLASS.eventBuffer += "\n\nAs you walk through town, people occasionally walk up to you, asking to feel your belly or how far along you are. You don't have the heart to tell them you're full of alien eggs.";
					if (kGAMECLASS.pc.isBimbo() || kGAMECLASS.pc.isTreated() || kGAMECLASS.pc.race().indexOf("ausar") != -1 || kGAMECLASS.pc.race().indexOf("") != -1 ) kGAMECLASS.eventBuffer += " Besides, people rubbing all over you feels super good!";
				}
			}
		}
				
		public static function nyreaOnSuccessfulImpregnationOutput(father:Creature, mother:Creature, thisPtr:BasePregnancyHandler):void
		{
			kGAMECLASS.eventBuffer += "\n\n<b>Your belly is swollen with nyrea eggs, distending your gut as if you were truly pregnant.</b> Hopefully, the eggs will pass quickly. Until then, you spend the next few minutes trying to adjust yourself and your equipment to your new size. Walking just got really awkward....";
		}
		
		public static function nyreaOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			// Closures.
			var tEventCall:Function = (function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
			{
				return function():void
				{
					kGAMECLASS.renvraEggnancyEnds(c_pregSlot);
					NyreaHuntressPregnancy.cleanupPregnancy(c_mother, c_pregSlot, c_thisPtr);
				}
			})(mother, pregSlot, thisPtr);
			
			kGAMECLASS.eventQueue.push(tEventCall);
		}
		
		public static function cleanupPregnancy(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/nyrea eggs", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			
			pData.reset();
			
			if (mother.hasStatusEffect("Nyrea Eggs Messages Available") && !mother.hasPregnancyOfType(thisPtr.handlesType))
			{
				mother.removeStatusEffect("Nyrea Eggs Messages Available");
			}
		}
		
		override public function pregBellyFragment(target:Creature, slot:int):String
		{
			return "Your belly is bulging heavily. At first glance, people might be mistaken for thinking you're properly pregnant, but closer inspection reveals your belly to be lumpy and slightly misshapen, bulging with eggs as you are.";
		}
	}

}