package classes.GameData.Pregnancy.Handlers 
{
	import classes.Characters.PregnancyPlaceholder;
	import classes.Creature;
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.kGAMECLASS;
	import classes.PregnancyData;
	import classes.GameData.StatTracking;
	
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
			_definedAverageLoadSize = 720;
			
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
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			StatTracking.track("pregnancy/renvra kids", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			
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
		
		override public function pregBellyFragment(target:Creature, slot:int):String
		{
			if (!target.hasStatusEffect("Renvra Full Pregnancy Bellyrubs")) return "";
			else
			{
				var tLevel:int = target.statusEffectv2("Renvra Full Pregnancy Bellyrubs");
				
				switch (tLevel)
				{
					case 1:
						return "Your belly is bulging slightly, the first visible signs of pregnancy. Your halfbreed spawn seem to be behaving... not that differently from human offspring so far. At least you're not getting horribly sick in the mornings anymore!"
						break;
						
					case 2:
						return "You're really starting to show, now. Anybody who looks your way can see you're obviously pregnant, and you've had to adjust your [pc.gear] to make room for your bloated gut. Every so often, you feel a slight movement under your [pc.skinFurScales] as your growing young shift or move. Occasionally, you could swear you feel them kick!\n\nFrom time to time, you find your hands wandering down to your belly, idly caressing your swollen form.";
						break;
						
					case 3:
						return "You find your hands wandering to your belly more and more -- as much to support the growing weight you're bearing as to caress the home of your unborn children.\n\nYou're so heavily showing now that you can't go much of anywhere without people staring. It won't be long now... maybe just a few weeks more!"
						break;
						
					case 4:
						return "You note that your swollen belly is shifting awkwardly, and you're starting to feel very... wet. Your motherly instincts tell you that you'll be giving birth very, very soon.";
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