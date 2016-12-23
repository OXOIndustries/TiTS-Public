package classes.GameData.Pregnancy.Handlers 
{
	import classes.Characters.AraKei;
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.Creature;
	import classes.GameData.Pregnancy.Child;
	import classes.PregnancyData;
	import classes.kGAMECLASS;
	import classes.GLOBAL;
	import classes.GameData.StatTracking;
	import classes.Engine.Utility.rand;
	import classes.GameData.ChildManager;
	/**
	 * ...
	 * @author Gedan
	 */
	public class BothriocPregnancyHandler extends BasePregnancyHandler
	{
		
		public function BothriocPregnancyHandler() 
		{
			_handlesType = "BothriocPregnancy";
			_basePregnancyIncubationTime = 6000;
			_basePregnancyChance = 1;
			_alwaysImpregnate = true;
			_ignoreInfertility = true;
			_ignoreMotherInfertility = true;
			_ignoreFatherInfertility = true;
			_canImpregnateButt = true;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 8;
			_pregnancyQuantityMaximum = 14;
			_definedAverageLoadSize = 720;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_EGGS;
			_pregnancyChildRace = GLOBAL.TYPE_BOTHRIOC;
			
			addStageProgression(5400, function(pregSlot:int):void {
				kGAMECLASS.bothriocEggnancyEffects(pregSlot, 5400);
			}, true);
			
			addStageProgression(4800, function(pregSlot:int):void {
				kGAMECLASS.bothriocEggnancyEffects(pregSlot, 4800);
			}, true);
			
			addStageProgression(4200, function(pregSlot:int):void {
				kGAMECLASS.bothriocEggnancyEffects(pregSlot, 4200);
			}, true);
			
			addStageProgression(3600, function(pregSlot:int):void {
				kGAMECLASS.bothriocEggnancyEffects(pregSlot, 3600);
			}, true);
			
			addStageProgression(3000, function(pregSlot:int):void {
				kGAMECLASS.bothriocEggnancyEffects(pregSlot, 3000);
			}, true);
			
			addStageProgression(2400, function(pregSlot:int):void {
				kGAMECLASS.bothriocEggnancyEffects(pregSlot, 2400);
			}, true);
			
			addStageProgression(1800, function(pregSlot:int):void {
				kGAMECLASS.bothriocEggnancyEffects(pregSlot, 1800);
			}, true);
			
			addStageProgression(1200, function(pregSlot:int):void {
				kGAMECLASS.bothriocEggnancyEffects(pregSlot, 1200);
			}, true);
			
			addStageProgression(600, function(pregSlot:int):void {
				kGAMECLASS.bothriocEggnancyEffects(pregSlot, 600);
			}, true);
			
			_onSuccessfulImpregnation = bothriocOnSuccessfulImpregnation;
			_onDurationEnd = bothriocOnDurationEnd;
			
		}
		
		public static function bothriocOnSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			
			// Double quantity for asspreggers from Ara
			if (father is AraKei && pregSlot == 3)
			{
				var pData:PregnancyData = mother.pregnancyData[pregSlot];
				pData.pregnancyQuantity *= 2;
			}
			
			mother.addPregnancyBellyMod(pregSlot, 10, true); 
			
			if (!mother.hasStatusEffect("Bothrioc Eggs"))
			{
				mother.createStatusEffect("Bothrioc Eggs", 0, 0, 0, 0, false, "Charmed", "You have been impregnated by a bothrioc. A warm, dense glow suffuses you that is not at all unpleasant...", false, 0, 0xFFFFFF);
			}
		}
		
		public static function bothriocOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var tEventCall:Function = (function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
			{
				return function():void
				{
					kGAMECLASS.bothriocEggnancyEffects(c_pregSlot, 0);
					BothriocPregnancyHandler.cleanupPregnancy(c_mother, c_pregSlot, c_thisPtr);
				}
			})(mother, pregSlot, thisPtr);
			
			kGAMECLASS.eventQueue.push(tEventCall);
		}
		
		public static function cleanupPregnancy(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			StatTracking.track("pregnancy/infertile bothrioc eggs", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			
			pData.reset();
			
			if (!mother.hasPregnancyOfType(thisPtr.handlesType))
			{
				mother.removeStatusEffect("Bothrioc Eggs");
			}
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBirthTimestamp:uint):Child
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			var numBirthed:int = 0;
			for (var i:int = 0; i < pData.pregnancyQuantity; i++)
			{
				if (rand(100) < 15) numBirthed++;
			}
			
			var c:Child = null;
			if (numBirthed > 0)
			{
				c = Child.NewChildWeights(pregnancyChildRace, childMaturationMultiplier, numBirthed, childGenderWeights);
				c.BornTimestamp = useBirthTimestamp;
				ChildManager.addChild(c);
				
				StatTracking.track("pregnancy/fertile bothrioc eggs", numBirthed);
				StatTracking.track("pregnancy/total day care", numBirthed);
			}
			
			StatTracking.track("pregnancy/infertile bothrioc eggs", pData.pregnancyQuantity - numBirthed);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			
			pData.reset();
			
			if (mother.hasStatusEffect("Bothrioc Eggs") && !mother.hasPregnancyOfType(handlesType))
			{
				mother.removeStatusEffect("Bothrioc Eggs");
			}
			
			return c;
		}
		
		override public function pregBellyFragment(target:Creature, slot:int):String
		{
			return "Your belly is bulging heavily. At first glance, people might be mistaken for thinking you're properly pregnant, but closer inspection reveals your belly to be lumpy and slightly misshapen, bulging with eggs as you are.";
		}
	}

}