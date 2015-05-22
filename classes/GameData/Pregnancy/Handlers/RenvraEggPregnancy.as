package classes.GameData.Pregnancy.Handlers 
{
	import classes.Creature;
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.PregnancyData;
	import classes.kGAMECLASS;
	import classes.GameData.StatTracking;
	import classes.Engine.Map.InPublicSpace;
	import classes.GLOBAL;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class RenvraEggPregnancy extends BasePregnancyHandler
	{
		
		public function RenvraEggPregnancy() 
		{
			_handlesType = "RenvraEggPregnancy";
			_basePregnancyIncubationTime = 10080;
			_basePregnancyChance = 0.1;
			_alwaysImpregnate = false;
			_ignoreInfertility = true;
			_ignoreMotherInfertility = true;
			_ignoreFatherInfertility = true;
			_allowMultiplePregnancies = false;
			_canImpregnateButt = true;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 2;
			_pregnancyQuantityMaximum = 2;
			_definedAverageLoadSize = 720;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_EGGS;
			
			this.addStageProgression(8000, function(pregSlot:int):void {
				kGAMECLASS.pc.bellyRatingMod += 5;
				(kGAMECLASS.pc.pregnancyData[pregSlot] as PregnancyData).pregnancyBellyRatingContribution += 5;
			}, true);
			
			this.addStageProgression(6000, function(pregSlot:int):void {
				kGAMECLASS.pc.bellyRatingMod += 5;
				(kGAMECLASS.pc.pregnancyData[pregSlot] as PregnancyData).pregnancyBellyRatingContribution += 5;
			}, true);
			
			this.addStageProgression(4000, function(pregSlot:int):void {
				kGAMECLASS.pc.bellyRatingMod += 5;
				(kGAMECLASS.pc.pregnancyData[pregSlot] as PregnancyData).pregnancyBellyRatingContribution += 5;
			}, true);
			
			this.addStageProgression(2000, function(pregSlot:int):void {
				kGAMECLASS.pc.bellyRatingMod += 5;
				(kGAMECLASS.pc.pregnancyData[pregSlot] as PregnancyData).pregnancyBellyRatingContribution += 5;
			}, true);
			
			this.addStageProgression(240, function(pregSlot:int):void {
				kGAMECLASS.pc.bellyRatingMod += 10;
				(kGAMECLASS.pc.pregnancyData[pregSlot] as PregnancyData).pregnancyBellyRatingContribution += 10;
				kGAMECLASS.eventBuffer += "\n\nYou note that your swollen belly is shifting awkwardly. The eggs clinging inside you rumble and move, and you feel distinctly... wet. You doubt you'll be carrying these eggs around with you much longer.";
			}, true);
			
			_onSuccessfulImpregnation = renvraOnSuccesfulImpregnation;
			_onSuccessfulImpregnationOutput = renvraOnSuccessfulImpregnationOutput;
			_onFailedImpregnationOutput = renvraOnFailedImpregnationOutput;
			_onDurationEnd = renvraOnDurationEnd;
		}
		
		public static function renvraOnSuccesfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			
			(mother.pregnancyData[pregSlot] as PregnancyData).pregnancyBellyRatingContribution += 20;
			mother.bellyRatingMod += 20;
			mother.createStatusEffect("Renvra Eggs Messages Available");
		}
		
		public static function renvraEggsMessageHandler(inPublicSpace:Boolean = false, minutes:Number = 0):void
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
					var pSlot:int = kGAMECLASS.pc.findPregnancyOfType("RenvraEggPregnancy");
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
				
		public static function renvraOnSuccessfulImpregnationOutput(father:Creature, mother:Creature, thisPtr:BasePregnancyHandler):void
		{
			kGAMECLASS.eventBuffer += "\n\n<b>Your belly is swollen with nyrea eggs, distending your gut as if you were truly pregnant.</b> Hopefully, the eggs will pass quickly. Until then, you spend the next few minutes trying to adjust yourself and your equipment to your new size. Walking just got really awkward....";
		}
		
		public static function renvraOnFailedImpregnationOutput(father:Creature, mother:Creature, thisPtr:BasePregnancyHandler):void
		{
			kGAMECLASS.eventBuffer += "\n\nYou feel a rumbling in your gut, and your belly starts to deflate a bit. Looks like you're absorbing those eggs, slowly but surely...\n\nMaybe you'll stop feeling so full in a while.";
		}
		
		public static function renvraOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			// Closures.
			var tEventCall:Function = (function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
			{
				return function():void
				{
					kGAMECLASS.renvraEggnancyEnds(c_pregSlot);
					RenvraEggPregnancy.cleanupPregnancy(c_mother, c_pregSlot, c_thisPtr);
				}
			})(mother, pregSlot, thisPtr);
			
			kGAMECLASS.eventQueue.push(tEventCall);
		}
		
		public static function cleanupPregnancy(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/renvra eggs", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			
			if (mother.hasStatusEffect("Renvra Eggs Messages Available"))
			{
				mother.removeStatusEffect("Renvra Eggs Messages Available");
			}
			
			pData.reset();
		}
		
		override public function pregBellyFragment(target:Creature, slot:int):String
		{
			return "Your belly is bulging heavily. At first glance, people might be mistaken for thinking you're properly pregnant, but closer inspection reveals your belly to be lumpy and slightly misshapen, bulging with eggs as you are.";
		}
	}

}