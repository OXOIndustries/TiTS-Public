package classes.GameData.Pregnancy.Handlers 
{
	import classes.Characters.PregnancyPlaceholder;
	import classes.Creature;
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.kGAMECLASS;
	import classes.PregnancyData;
	import classes.GameData.StatTracking;
	import classes.GLOBAL;
	import classes.GameData.ChildManager;
	import classes.GameData.Pregnancy.Child;
	import classes.Engine.Utility.shortMinutes;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class RenvraFullPregnancy extends BasePregnancyHandler
	{
		
		public function RenvraFullPregnancy() 
		{
			_handlesType = "RenvraFullPregnancy";
			_basePregnancyIncubationTime = 86400;
			_basePregnancyChance = 0.3;
			_alwaysImpregnate = false;
			_ignoreMotherInfertility = false;
			_ignoreFatherInfertility = false;
			_ignoreInfertility = false;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = true;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 1;
			_pregnancyQuantityMaximum = 4;
			_definedAverageLoadSize = 2400;
			_pregnancyChildRace = GLOBAL.TYPE_NYREA;
			_childMaturationMultiplier = 1.0;
			
			// First stage messages/reminders
			addStageProgression(58 * 24 * 60, function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 5);
				if (!kGAMECLASS.pc.hasStatusEffect("Renvra Full Pregnancy Message 1"))
					kGAMECLASS.pc.createStatusEffect("Renvra Full Pregnancy Message 1", pregSlot, 0, 0, 0, true, "", "", false, 0);
			}, true);
			
			addStageProgression(56 * 24 * 60, function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 5);
				if (!kGAMECLASS.pc.hasStatusEffect("Renvra Full Pregnancy Message 1"))
					kGAMECLASS.pc.createStatusEffect("Renvra Full Pregnancy Message 1", pregSlot, 0, 0, 0, true, "", "", false, 0);
			}, true);
			
			addStageProgression(54 * 24 * 60, function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 5);
				if (!kGAMECLASS.pc.hasStatusEffect("Renvra Full Pregnancy Message 1"))
					kGAMECLASS.pc.createStatusEffect("Renvra Full Pregnancy Message 1", pregSlot, 0, 0, 0, true, "", "", false, 0);
			}, true);
			
			addStageProgression(52 * 24 * 60, function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 5);
				if (!kGAMECLASS.pc.hasStatusEffect("Renvra Full Pregnancy Message 1"))
					kGAMECLASS.pc.createStatusEffect("Renvra Full Pregnancy Message 1", pregSlot, 0, 0, 0, true, "", "", false, 0);
			}, true);
			
			addStageProgression(50 * 24 * 60, function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 8);
				if (kGAMECLASS.pc.hasStatusEffect("Renvra Full Pregnancy Message 1"))
					kGAMECLASS.pc.removeStatusEffect("Renvra Full Pregnancy Message 1");
					
				if (!kGAMECLASS.pc.hasStatusEffect("Renvra Full Pregnancy Message 2"))
					kGAMECLASS.pc.createStatusEffect("Renvra Full Pregnancy Message 2", pregSlot, 0, 0, 0, true, "", "", false, 0);
					
				// v1 = slot
				// v2 = target level
				// v3 = "executed" level
				if (!kGAMECLASS.pc.hasStatusEffect("Renvra Full Pregnancy Bellyrubs"))
					kGAMECLASS.pc.createStatusEffect("Renvra Full Pregnancy Bellyrubs", pregSlot, 1, 0, 0, true, "", "", false, 0);
			}, true);
			
			addStageProgression(45 * 24 * 60, function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 10);
				if (!kGAMECLASS.pc.hasStatusEffect("Renvra Full Pregnancy Message 3"))
					kGAMECLASS.pc.createStatusEffect("Renvra Full Pregnancy Message 3", pregSlot, 0, 0, 0, true, "", "", false, 0);
					
				if (kGAMECLASS.pc.hasStatusEffect("Renvra Full Pregnancy Bellyrubs"))
					kGAMECLASS.pc.addStatusValue("Renvra Full Pregnancy Bellyrubs", 2, 1);
				else
					kGAMECLASS.pc.createStatusEffect("Renvra Full Pregnancy Bellyrubs", pregSlot, 2, 1, 0, true, "", "", false, 0);
			}, true);
			
			addStageProgression(30 * 24 * 60, function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 10);
				if (!kGAMECLASS.pc.hasStatusEffect("Renvra Full Pregnancy Message 4"))
					kGAMECLASS.pc.createStatusEffect("Renvra Full Pregnancy Message 4", pregSlot, 0, 0, 0, true, "", "", false, 0);
					
				if (kGAMECLASS.pc.hasStatusEffect("Renvra Full Pregnancy Bellyrubs"))
					kGAMECLASS.pc.addStatusValue("Renvra Full Pregnancy Bellyrubs", 2, 1);
				else
					kGAMECLASS.pc.createStatusEffect("Renvra Full Pregnancy Bellyrubs", pregSlot, 3, 2, 0, true, "", "", false, 0);
			}, true);
			
			addStageProgression(22 * 24 * 60, function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 10);
				if (!kGAMECLASS.pc.hasStatusEffect("Renvra Milky Titties Go"))
					kGAMECLASS.pc.createStatusEffect("Renvra Milky Titties Go", pregSlot, 0, 0, 0, true, "", "", false, 0);
			}, true);
			
			addStageProgression(14 * 24 * 60, function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 10);
				if (!kGAMECLASS.pc.hasStatusEffect("Renvra Full Pregnancy Message 5"))
					kGAMECLASS.pc.createStatusEffect("Renvra Full Pregnancy Message 5", pregSlot, 0, 0, 0, true, "", "", false, 0);
				
				if (kGAMECLASS.pc.hasStatusEffect("Renvra Full Pregnancy Bellyrubs"))
					kGAMECLASS.pc.addStatusValue("Renvra Full Pregnancy Bellyrubs", 2, 1);
				else
					kGAMECLASS.pc.createStatusEffect("Renvra Full Pregnancy Bellyrubs", pregSlot, 4, 3, 0, true, "", "", false, 0);
			}, true);
			
			addStageProgression(3 * 24 * 60, function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 10);
				if (!kGAMECLASS.pc.hasStatusEffect("Renvra Full Pregnancy Almost Due"))
					kGAMECLASS.pc.createStatusEffect("Renvra Full Pregnancy Almost Due", pregSlot, 0, 0, 0, true, "", "", false, 0);
			}, true);
			
			_onDurationEnd = RenvraFullPregnancy.onDurationEnd;
		}
		
		public static function onDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var tEventCall:Function = (function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
			{
				return function():void
				{
					kGAMECLASS.renvraFullPregnancyEnds(c_pregSlot);
					RenvraFullPregnancy.cleanupPregnancy(c_mother, c_pregSlot, c_thisPtr);
				}
			})(mother, pregSlot, thisPtr);
			
			kGAMECLASS.eventQueue.push(tEventCall);
		}
		
		public static function cleanupPregnancy(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot];
			
			ChildManager.addChild(
				Child.NewChildWeights(
					thisPtr.pregnancyChildRace,
					thisPtr.childMaturationMultiplier,
					pData.pregnancyQuantity,
					thisPtr.childGenderWeights
				)
			);
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			StatTracking.track("pregnancy/renvra kids", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
			
			if (!mother.hasPregnancyOfType(thisPtr.handlesType))
			{
				var effects:Array =
				[
					"Renvra Full Pregnancy Message 1",
					"Renvra Full Pregnancy Message 2",
					"Renvra Full Pregnancy Bellyrubs",
					"Renvra Full Pregnancy Message 3",
					"Renvra Full Pregnancy Message 4",
					"Renvra Milky Titties Go",
					"Renvra Full Pregnancy Message 5",
					"Renvra Full Pregnancy Almost Due"
				];
				
				for (var i:int = 0; i < effects.length; i++)
				{
					if (mother.hasStatusEffect(effects[i]))
					{
						mother.removeStatusEffect(effects[i]);
					}
				}
			}
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBornTimestamp:uint):Child
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot];
			
			var c:Child = Child.NewChildWeights(
				pregnancyChildRace,
				childMaturationMultiplier,
				pData.pregnancyQuantity,
				childGenderWeights
			);
			
			c.BornTimestamp = useBornTimestamp;
			
			ChildManager.addChild(c);
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			StatTracking.track("pregnancy/renvra kids", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
			
			if (!mother.hasPregnancyOfType(handlesType))
			{
				var effects:Array =
				[
					"Renvra Full Pregnancy Message 1",
					"Renvra Full Pregnancy Message 2",
					"Renvra Full Pregnancy Bellyrubs",
					"Renvra Full Pregnancy Message 3",
					"Renvra Full Pregnancy Message 4",
					"Renvra Milky Titties Go",
					"Renvra Full Pregnancy Message 5",
					"Renvra Full Pregnancy Almost Due"
				];
				
				for (var i:int = 0; i < effects.length; i++)
				{
					if (mother.hasStatusEffect(effects[i]))
					{
						mother.removeStatusEffect(effects[i]);
					}
				}
			}
			
			return c;
		}
		
		override public function pregBellyFragment(target:Creature, slot:int):String
		{
			if (!target.hasStatusEffect("Renvra Full Pregnancy Bellyrubs")) return "";
			else
			{
				var tLevel:int = target.statusEffectv2("Renvra Full Pregnancy Bellyrubs");
				
				switch (tLevel)
				{
					case 1:
						return "The first visible signs of pregnancy have pregnancy have appeared. Your halfbreed spawn seem to be behaving... not that differently from human offspring so far. At least you’re not getting horribly sick in the mornings anymore!"
						break;
						
					case 2:
						return "Every so often, you feel a slight movement under your [pc.skinFurScales] as your growing young shift or move. Occasionally, you could swear you feel them kick!\n\nFrom time to time, you find your hands wandering down to your belly, idly caressing your swollen form.";
						break;
						
					case 3:
						var nTime:Number = Math.floor(30240/kGAMECLASS.pc.pregnancyData[slot].pregnancyIncubationMulti);
						return "You find your hands wandering to your belly more and more -- as much to support the growing weight you’re bearing as to caress the home of your unborn children.\n\nYou’re so heavily showing now that you can’t go much of anywhere without people staring. It won’t be long now... maybe just " + shortMinutes(nTime, true, true) + " more!"
						break;
						
					case 4:
						return "You note that your swollen belly is shifting awkwardly, and you’re starting to feel very... wet. Your motherly instincts tell you that you’ll be giving birth very, very soon.";
						break;
						
					default:
						return "";
						break;
				}
			}
			
			return "";
		}
	}
}