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
	import classes.Engine.Interfaces.AddLogEvent;
	import classes.GameData.Pregnancy.Templates.ZephyrUniqueChild;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class ZephyrPregnancyHandler extends BasePregnancyHandler
	{
		public function ZephyrPregnancyHandler() 
		{
			_debugTrace = false;
			_handlesType = "ZephyrPregnancy";
			_basePregnancyIncubationTime = 60 * 24 * 120; // 4 Months
			_basePregnancyChance = 0.25;
			_alwaysImpregnate = false;
			_ignoreInfertility = false;
			_ignoreFatherInfertility = true;
			_ignoreMotherInfertility = false;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = false;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 2;
			_pregnancyQuantityMaximum = 5;
			_definedAverageLoadSize = 2400;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_LIVE;
			_pregnancyChildRace = GLOBAL.TYPE_HUMAN;
			_childMaturationMultiplier = 1.1;
			_childGenderWeights.Male = 50;
			_childGenderWeights.Female = 50;
			
			_onSuccessfulImpregnation = zephyrSuccessfulImpreg;
			_onDurationEnd = zephyrOnDurationEnd;
			
			addStageProgression(_basePregnancyIncubationTime - (14 * 24 * 60), function(pregSlot:int):void {
				var s:String = "Your codex beeps, notifying you that you’re pregnant. Based on the readouts, you’re almost assuredly carrying Zephyr’s child. You give a little sigh of happiness, thinking about how thrilled your lover will be to have an addition to your";
				
				var numKids:Number = StatTracking.getStat("pregnancy/zephyr births");

				if (numKids > 0 && numKids <= 25) s += " little";
				s += " family";
				if (numKids >= 50) s += " - she sure seems to love putting them inside you, after all..";
				s += ".";

				if (kGAMECLASS.flags["ZEPHYR_KIDS_KNOWN"] == undefined)
				{
					s += " You can barely wait to tell her the news in person, quickly pulling out your codex and hammering out a little message to her."
					kGAMECLASS.flags["ZEPHYR_KIDS_KNOWN"] = 1;
				}

				AddLogEvent(ParseText(s), "passive");
			}, true);
			
			addStageProgression(_basePregnancyIncubationTime - (35 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent(ParseText("Your codex beeps, notifying you of progress in your pregnancy. It looks like you’re carrying at least twins and maybe more! Thinking back to exactly how ‘thorough’ Zephyr was and is, you’re not exactly surprised. You pet your swelling tummy and think about the future."), "passive");

				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += (15 * pData.pregnancyQuantity);
				pData.pregnancyBellyRatingContribution += (15 * pData.pregnancyQuantity);
			}, true);
			
			addStageProgression(_basePregnancyIncubationTime - (60 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent(ParseText("Your tummy has grown quite a lot since your last codex notification, and by now you’re pretty certain that if it <i>is</i> only twins, they’re very large. You’ll have to wait and see, but you have an inkling of what’s to come."),"passive");
				
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += (15 * pData.pregnancyQuantity);
				pData.pregnancyBellyRatingContribution += (15 * pData.pregnancyQuantity);
				
			}, true);
			
			//Fourth notification - 85 days
			addStageProgression(_basePregnancyIncubationTime - (85 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent(ParseText("You wince a little as you feel a kick from your very pregnant belly, idly putting a hand on it and stroking. It’s been a bit more difficult to get around as large as you are, but you’ve been managing. You take a moment to think fondly about Zephyr and how much she’ll love having"+ (kGAMECLASS.flags["ZEPHYR_KIDS"] != undefined ? " more" : "") + " kids while you rub your tummy."), "passive");
				
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += (15 * pData.pregnancyQuantity);
				pData.pregnancyBellyRatingContribution += (15 * pData.pregnancyQuantity);
			}, true);
			
			//Fifth notification - 110 days
			addStageProgression(_basePregnancyIncubationTime - (110 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent(ParseText("Your codex beeps, notifying you of progress in your pregnancy. You should make it to the Nursery as soon as you can!"), "passive");
				
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += (10 * pData.pregnancyQuantity);
				pData.pregnancyBellyRatingContribution += (10 * pData.pregnancyQuantity);

				kGAMECLASS.pc.createStatusEffect("Pregnancy Pending", 0, 0, 0, 0, false, "Icon_Belly_Pregnant", "Your pregnancy is ready to deliver! Head to the nursery as soon as you can!", false, 0, 0xFFFFFF);
				
			}, true);
		}
		
		public static function zephyrSuccessfulImpreg(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			// Can only support one of this type at a time!
			// Return if mother already has pregnancy of this type.
			if(mother.hasPregnancyOfType(thisPtr.handlesType)) return;
			
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr, [1.0, 1.5, 0.5]);
		}
		
		public static function zephyrOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			// We're not actually doing anything on the end of the timer here, we're just
			// going to ask the player to go to the nursery. This should alert them once an hour, every hour, until they go
			if (!mother.hasStatusEffect("Zephyr Preg Alert"))
			{
				AddLogEvent(ParseText("Your codex beeps, notifying you of progress in your pregnancy. You should make it to the Nursery as soon as you can!"), "passive");
				mother.createStatusEffect("Zephyr Preg Alert", 0, 0, 0, 0, true, "Icon_Belly_Pregnant", "", false, 60, 0xFFFFFF);
			}
		}

		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBornTimestamp:uint):Child
		{
			mother.removeStatusEffect("Zephyr Preg Alert");
			mother.removeStatusEffect("Pregnancy Pending");

			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			var c:Child = new ZephyrUniqueChild();
			c.RaceType = pregnancyChildRace;
			c.MaturationRate = childMaturationMultiplier;
			c.BornTimestamp = useBornTimestamp;

			for (var i:int = 0; i < pData.pregnancyQuantity; i++)
			{
				if (rand(2) == 0)
				{
					c.NumMale++;
				}
				else
				{
					c.NumFemale++;
				}
			}

			ChildManager.addChild(c);
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/zephyr births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			if (kGAMECLASS.flags["ZEPHYR_KIDS_DAYCOUNTER"] == undefined) kGAMECLASS.flags["ZEPHYR_KIDS_DAYCOUNTER"] = kGAMECLASS.days;
			
			if (kGAMECLASS.flags["ZEPHYR_KIDS_KNOWN"] == undefined)
			{
				kGAMECLASS.flags["ZEPHYR_KIDS_KNOWN"] = 1;
			}
			
			pData.reset();
			
			return c;
		}
	}

}