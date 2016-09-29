package classes.GameData.Pregnancy.Handlers 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.PregnancyData;
	import classes.kGAMECLASS;
	import classes.GLOBAL;
	import classes.Engine.Interfaces.ParseText;
	import classes.GameData.StatTracking;
	import classes.GameData.ChildManager;
	import classes.GameData.Pregnancy.Child;
	
	/**
	 * ...
	 * @author ...
	 */
	public class PsychicTentacles extends BasePregnancyHandler
	{
		
		public function PsychicTentacles() 
		{
			_handlesType = "PsychicTentacles";
			_basePregnancyIncubationTime = 26260;
			_basePregnancyChance = 1;
			_alwaysImpregnate = true;
			_ignoreInfertility = true;
			_ignoreMotherInfertility = true;
			_ignoreFatherInfertility = true;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = true;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 1;
			_pregnancyQuantityMaximum = 1;
			_definedAverageLoadSize = 100;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_LIVE;
			_pregnancyChildRace = GLOBAL.TYPE_TENTACLE;
			_childGenderWeights.Male = 0;
			_childGenderWeights.Female = 0;
			_childGenderWeights.Neuter = 1;
			_childMaturationMultiplier = 2.5;
			
			this.addStageProgression(25260, function(pregSlot:int):void {
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 10;
				pData.pregnancyBellyRatingContribution += 10;
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp() + " The creature inside of you keeps squirming around in the most <i>erotic</i> way. You find yourself rubbing your belly, and feeling like you <i>should masturbate as soon as possible.</i>";
				kGAMECLASS.pc.lust(100);
			}, true);
			
			this.addStageProgression(18000, function(pregSlot:int):void {
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 10;
				pData.pregnancyBellyRatingContribution += 10;
				
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp() + " The exotic alien in your belly is definitely getting bigger, growing day by day. When a tentacle pushes, you can clear see its size, visible in your distended flesh.<i> You are such a good mommy.</i>";
			}, true);

			this.addStageProgression(16000, function(pregSlot:int):void {
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 5;
				pData.pregnancyBellyRatingContribution += 5;
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp() + " You realize that you've been rubbing your belly whenever you nervous, or excited... or bored. Anytime, really. It's a very soothing feeling, nurturing a creature within yourself, <i>letting it hijack your body for its own ends.</i> Fuck, now you're getting turned on again. Maybe this thing feeds off of sexual pleasure?";
				kGAMECLASS.pc.lust(25);
			}, true);

			this.addStageProgression(14000, function(pregSlot:int):void {
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 5;
				pData.pregnancyBellyRatingContribution += 5;
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp() + ParseText(" You rub your [pc.belly] and wonder - is it weird for that to send erotic tingles through your whole body?");
				kGAMECLASS.pc.lust(25);
			}, true);

			this.addStageProgression(11000, function(pregSlot:int):void {
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 10;
				pData.pregnancyBellyRatingContribution += 10;
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp() + " Sometimes, you wonder if you'll be pregnant with this creature forever. Then, <i>you realize how great that would be.</i> You rub your belly and smile.";
				kGAMECLASS.pc.lust(25);
			}, true);
			
			this.addStageProgression(9000, function(pregSlot:int):void {
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 10;
				pData.pregnancyBellyRatingContribution += 10;
				
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp() + " You're so swollen, so big... so perfectly gravid. <i>It's perfectly normal to be so incredibly distended.</i> Sometimes, other people will look like they're about to comment on your pregnant belly, but then they'll shake their head and smile at you.";
			}, true);
			
			this.addStageProgression(5000, function(pregSlot:int):void {
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 5;
				pData.pregnancyBellyRatingContribution += 5;
				
				var msg:String = "\n\n" + kGAMECLASS.logTimeStamp() + ParseText(" A tentacle slips out of you and wiggles, making you gasp and pant as it slimes your [pc.legOrLegs]. It withdraws, then slips out, stroking your most sensitive places, driving you to distraction. By the time it stops, you're nearly inensate with lust.");
				kGAMECLASS.pc.lust(3000);
			}, true);
			
			this.addStageProgression(440, function(pregSlot:int):void {
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 10;
				pData.pregnancyBellyRatingContribution += 10;
				
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp() + ParseText(" Walking around is hard with such a huge middle, but you manage. <i>You don't mind.</i> Really.");
			}, true);
			
			_onSuccessfulImpregnation = psychicTentacleSuccessfulImpregnantion;
			_onDurationEnd = PsychicTentacleOnDurationEnd;
		}
		
		public static function psychicTentacleSuccessfulImpregnantion(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			pData.pregnancyBellyRatingContribution += 45;
			mother.bellyRatingMod += 45;
		}
		
		public static function PsychicTentacleOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			// Closure ensures that we will call the targetted output function (thus it will have access
			// to various pregnancy data) prior to cleaning up the pregnancy data itself. Magic.
			var tEventCall:Function = (function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
			{
				return function():void
				{
					kGAMECLASS.PsychicTentacleBirthing(c_pregSlot);
					PsychicTentacles.cleanupPregnancy(c_mother, c_pregSlot, c_thisPtr);
				}
			})(mother, pregSlot, thisPtr);
			
			kGAMECLASS.eventQueue.push(tEventCall);
		}
		
		public static function cleanupPregnancy(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			ChildManager.addChild(
				Child.NewChildWeights(
					thisPtr.pregnancyChildRace,
					thisPtr.childMaturationMultiplier,
					pData.pregnancyQuantity,
					thisPtr.childGenderWeights
				)
			);
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/psychic tentacle beast birthed", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			
			pData.reset();
		}
	}

}