package classes.GameData.Pregnancy.Handlers 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.PregnancyData;
	import classes.kGAMECLASS;
	import classes.Engine.Interfaces.ParseText;
	import classes.GameData.StatTracking;
	import classes.GLOBAL;
	import classes.GameData.ChildManager;
	import classes.GameData.Pregnancy.Child;
	import classes.Engine.Interfaces.AddLogEvent;
	import classes.Engine.Interfaces.ExtendLogEvent;
	
	/**
	 * ...
	 * @author ...
	 */
	public class CockvinePregnancy extends BasePregnancyHandler
	{
		
		public function CockvinePregnancy() 
		{
			_handlesType = "CockvinePregnancy";
			_basePregnancyIncubationTime = 8640;
			_basePregnancyChance = 0.1;
			_alwaysImpregnate = false;
			_ignoreInfertility = false;
			_ignoreMotherInfertility = false;
			_ignoreFatherInfertility = false;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = false;
			_canImpregnateVagina = true;
			_canFertilizeEggs = true;
			_pregnancyQuantityMinimum = 8;
			_pregnancyQuantityMaximum = 20;
			_definedAverageLoadSize = 300;
			_pregnancyChildRace = GLOBAL.TYPE_COCKVINE;
			_childMaturationMultiplier = 2.5;
			_childGenderWeights.Male = 1;
			_childGenderWeights.Female = 0;
			
			this.addStageProgression(6200, function(pregSlot:int):void {
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 1 * pData.pregnancyQuantity;
				pData.pregnancyBellyRatingContribution += 1 * pData.pregnancyQuantity;
			}, true);
			
			this.addStageProgression(4760, function(pregSlot:int):void {
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 1 * pData.pregnancyQuantity;
				pData.pregnancyBellyRatingContribution += 1 * pData.pregnancyQuantity;
				
				AddLogEvent("The last " + kGAMECLASS.pc.getPregnancyTimeString(pregSlot, true, false) + " you’ve battled with constant pangs of hunger, despite generally feeling strangely full. You notice that your stomach has developed a bit of a curve.", "passive");
			}, true);
			
			this.addStageProgression(3320, function(pregSlot:int):void {
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 1 * pData.pregnancyQuantity;
				pData.pregnancyBellyRatingContribution += 1 * pData.pregnancyQuantity;
				
				AddLogEvent("Your gut has become noticeably distended. There’s no getting around it; you’re pregnant. Unease roils queasily with the deeper tides of warmth and contentment motherhood brings; deep down you feel... green. The budding green of early spring, waiting to burst fully into life.", "passive");
			}, true);
			
			this.addStageProgression(1880, function(pregSlot:int):void {
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 1 * pData.pregnancyQuantity;
				pData.pregnancyBellyRatingContribution += 1 * pData.pregnancyQuantity;
				
				AddLogEvent("Your movement has become rounded", "passive");
				if (kGAMECLASS.pc.isBiped()) ExtendLogEvent(" and splay-footed");
				ExtendLogEvent(ParseText(" to compensate for the big baby bulge you are now sporting, packed with life. What’s inside you squirms all the time, ticklish and intimate, never letting you forget its – or rather their – presence for a moment. Your nipples have spread, your boobs plumping up as they prepare to feed your children. It makes you laugh groaningly. You suspect what you’re bearing has little interest in [pc.milk]."));
			}, true);
			
			this.addStageProgression(440, function(pregSlot:int):void {
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 2 * pData.pregnancyQuantity;
				pData.pregnancyBellyRatingContribution += 2 * pData.pregnancyQuantity;
				
				AddLogEvent(ParseText("You stroke your taut belly, trailing your hand over a full, sensitive breast as you do. Your stuffed womb quivers, dense and heavy with increasingly restless, serpentine life. You suppose you should feel disquieted about all of this but with both your own and the alien flora’s hormones rich in your veins it’s difficult to feel anything but complacent, warm contentment. When your thoughts drift from the task at hand they go to deep, dark, moist places; wild places, where wild things can bury themselves and become even wilder, coiling upwards, irrepressible. Your spreading [pc.vagina " + pregSlot + "] oozes excitement when you go to those places."), "passive");
			}, true);
			
			_onSuccessfulImpregnation = cockvineOnSuccessfulImpregnantion;
			_onDurationEnd = cockvineOnDurationEnd;
		}
		
		public static function cockvineOnSuccessfulImpregnantion(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			pData.pregnancyBellyRatingContribution += 2 * pData.pregnancyQuantity;
			mother.bellyRatingMod += 2 * pData.pregnancyQuantity;
		}
		
		public static function cockvineOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			// Closure ensures that we will call the targetted output function (thus it will have access
			// to various pregnancy data) prior to cleaning up the pregnancy data itself. Magic.
			var tEventCall:Function = (function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
			{
				return function():void
				{
					kGAMECLASS.cockvinePregnancyBirthing(c_pregSlot);
					CockvinePregnancy.cleanupPregnancy(c_mother, c_pregSlot, c_thisPtr);
				}
			})(mother, pregSlot, thisPtr);
			
			kGAMECLASS.eventQueue.push(tEventCall);
		}
		
		public static function cleanupPregnancy(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			// Creating the child during a capture is handled by the actual birthing scene
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/cockvine seedlings birthed", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			
			pData.reset();
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBirthTimestamp:uint):Child
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			var c:Child = Child.NewChildWeights(
					pregnancyChildRace,
					childMaturationMultiplier,
					pData.pregnancyQuantity,
					childGenderWeights
				);
			c.BornTimestamp = useBirthTimestamp;
			ChildManager.addChild(c);
			
			kGAMECLASS.flags["COCKVINE_SEEDLING_CAPTURED"] = 1;
			StatTracking.track("pregnancy/cockvine seedlings captured", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			pData.reset();
			
			return c;
		}
	}

}