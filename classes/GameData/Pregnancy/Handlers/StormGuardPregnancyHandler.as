package classes.GameData.Pregnancy.Handlers 
{
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.Creature;
	import classes.PregnancyData;
	import classes.kGAMECLASS;
	import classes.GameData.StatTracking;
	import classes.GLOBAL;
	import classes.StorageClass;
	import classes.Engine.Utility.rand;
	import classes.Engine.Interfaces.ParseText;
	import classes.GameData.ChildManager;
	import classes.GameData.Pregnancy.Child;
	import classes.GameData.Pregnancy.UniqueChild;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Interfaces.AddLogEvent;
	import classes.Engine.Interfaces.ExtendLogEvent;
	import classes.Util.RandomInCollection;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Map.InRoomWithFlag;
	
	public class StormGuardPregnancyHandler extends BasePregnancyHandler
	{
		public function StormGuardPregnancyHandler() 
		{
			_handlesType = "StormguardPregnancy";
			_basePregnancyIncubationTime = (60 * 24 * 180); // 180 days
			_basePregnancyChance = .1;
			_alwaysImpregnate = false;
			_ignoreInfertility = false;
			_ignoreFatherInfertility = false;
			_ignoreMotherInfertility = false;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = false;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 1;
			_pregnancyQuantityMaximum = 1;
			_definedAverageLoadSize = 1000;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_EGGS;
			_pregnancyChildRace = GLOBAL.TYPE_CUNDARIAN;
			_childMaturationMultiplier = 1.0;
						
			_childGenderWeights.Male = 50;
			_childGenderWeights.Female = 50;
			
			_onSuccessfulImpregnation = stormguardSuccessfulImpregnation;
			_onDurationEnd = stormguardOnDurationEnd;
			
			var titText:String = "";
			var titText2:String = "";
			var titText3:String = "";
			
			for(var i:int = 0; i <= 160; i += 1)
			{
				// Preg Texts
				// Each line activates once during range				
				// 20-30 days
				if(i == 25)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Pain suddenly blooms in your stomach. You double over, nearly vomiting onto the ground below. Ugh. What the hell did you eat? Why didn't your microsurgeons protect you?", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .1, true);
					}, true);
				}
				// 30-50 days
				else if(i == 40)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("You pinch the bridge of your nose. You've felt so bloated lately. Even worse is how you feel. Sometimes you're furious, liable to lash out at anyone nearby, other times content to laze around all day. Worst. Illness. Ever.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .3, true);
					}, true);
				}
				// 50-70 days
				else if(i == 60)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("You just can't stop eating! Food is always on your mind and thick slabs of meat are all you want. You wonder if you should seek professional help. Maybe it's a parasite.\n\nYour codex suddenly chimes. <i>“You’re pregnant with a half-cundarian child!”</i> Well, it <b>is</b> a parasite of sorts.", "passive");
						kGAMECLASS.flags["SG_PREG_PC_KNOWS"] = 1;
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .35, true);
					}, true);
				}
				// 70-90 days
				else if(i == 80)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("The hormones in your body are running wild, and as you caress your bulging belly, your thoughts drift back to the event that led to your current situation. Fuck, the way", "passive");
						if (kGAMECLASS.sgPregByWin()) ExtendLogEvent(" you dominated that hapless warrior was so hot. You bite your lips just thinking about how you took what you wanted, riding his thick hunk of man meat until he passed out.");
						else ExtendLogEvent(" that warrior dominated you was mind-blowing. That virile stud took a hot, needy bitch, bent [pc.himHer] over and bred them. He fucked you with his thick hunk of man meat until his child grew inside your belly.");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .3, true);
					}, true);
				}
				// 90-120 days
				else if(i == 105)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("New life grows inside you and your swollen stomach presses outwards, so much so that you feel like a blimp. Your body is preparing for the birth of your new child. It has left your [pc.nipples] so sensitive and your breasts swollen. A sense of peace permeates your being, as if bringing life into this world has led you to fulfill some primal purpose.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .2, true);
					}, true);
				}
				// 120–150 days
				else if(i == 135)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("It’s getting hard to move and you’ve resorted to waddling in order to get around. Your belly is gigantic and you caress it in satisfaction. People constantly stop you in the streets, asking when you are due and wanting to touch your protruding stomach. You know it will be very soon, and you hope the child you bear will be", "passive");
						if (kGAMECLASS.sgPregByWin()) ExtendLogEvent(" a better warrior and lover than their disappointment of a father.");
						else ExtendLogEvent(" as strong as their father and every bit as dominant.");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .05, true);
					}, true);
				}
				// Progressive changes with no text:
				else if(i > 175)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .05, true);
					}, true);
				}
				else if(i > 145)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .05, true);
					}, true);
				}
				else if(i > 100)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .05, true);
					}, true);
				}
				else if(i > 90)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .2, true);
					}, true);
				}
				else if(i > 60)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .3, true);
					}, true);
				}
				else if(i > 40)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .35, true);
					}, true);
				}
				else if(i > 30)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .3, true);
					}, true);
				}
				else if(i > 14)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .1, true);
					}, true);
				}
				else
				{
					//nothing
				}
			}
		}

		public static function stormguardSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
		}

		public static function stormguardOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot];
			//If this is the first birth, go at it.
			if (!kGAMECLASS.disableExploreEvents())// || InRoomWithFlag(GLOBAL.HAZARD))
			{
				ChildManager.addChild(
					Child.NewChildWeights(
						thisPtr.pregnancyChildRace, 
						thisPtr.childMaturationMultiplier, 
						pData.pregnancyQuantity, 
						thisPtr.childGenderWeights
					)
				);
				kGAMECLASS.eventQueue.push(kGAMECLASS.stormguardBirthing);
				stormguardCleanupData(mother, pregSlot, thisPtr);
			}
			//Delay subsequent births till the first has had time to go off.
			else mother.pregnancyData[pregSlot].pregnancyIncubation += 24;
		}
		public static function stormguardCleanupData(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;

			StatTracking.track("pregnancy/gel zon births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBornTimestamp:uint):Child
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			var c:Child = Child.NewChildWeights(
				pregnancyChildRace,
				childMaturationMultiplier,
				pData.pregnancyQuantity,
				childGenderWeights
			);
			c.BornTimestamp = useBornTimestamp;
			
			ChildManager.addChild(c);
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;			

			StatTracking.track("pregnancy/gel zon births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);					
			
			pData.reset();	
			return c;
		}		
	}
}