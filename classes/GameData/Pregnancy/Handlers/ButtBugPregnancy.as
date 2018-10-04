package classes.GameData.Pregnancy.Handlers 
{
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.GameData.Pregnancy.Child;
	import classes.GameData.StatTracking;
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.PregnancyData;
	import classes.kGAMECLASS;
	import classes.GLOBAL;
	import classes.Engine.Interfaces.ParseText;
	import classes.Engine.Utility.rand;
	import classes.Engine.Interfaces.AddLogEvent;
	import classes.Engine.Interfaces.ExtendLogEvent;
	import classes.StorageClass;
	
	public class ButtBugPregnancy extends BasePregnancyHandler
	{
		public function ButtBugPregnancy() 
		{
			_handlesType = "ButtBugPregnancy";
			_basePregnancyIncubationTime = 60; // 1 hour
			_basePregnancyChance = 1;
			_alwaysImpregnate = true;
			_ignoreInfertility = true;
			_ignoreMotherInfertility = true;
			_ignoreFatherInfertility = true;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = true;
			_canImpregnateVagina = false;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 0;
			_pregnancyQuantityMaximum = 0;
			_definedAverageLoadSize = 400;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_EGGS;
			
			// per minute
			for (var i:int = 60; i > 0; i--)
			{
				if(i % 2 == 0)
				{
					this.addStageProgression((i * 60), function(pregSlot:int):void
					{
						var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
						var buttBugF:StorageClass = kGAMECLASS.pc.getStatusEffect("Butt Bug (Female)");
						var addRating:int = 0;
						if(buttBugF != null)
						{
							switch(buttBugF.value1)
							{
								case 0:
									addRating = (pData.pregnancyQuantity * 0.02);
									break;
								case 1:
									addRating = (pData.pregnancyQuantity * 0.02);
									break;
								case 2:
									addRating = 0.2;
									break;
							}
						}
						pData.pregnancyBellyRatingContribution += addRating;
						kGAMECLASS.pc.bellyRatingMod += addRating;
					}, true);
				}
			}
			
			_onSuccessfulImpregnation = buttBugOnSuccessfulImpregnation;
			_onDurationEnd = buttBugOnDurationEnd;
		}
		
		public static function buttBugOnSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			var buttBugF:StorageClass = mother.getStatusEffect("Butt Bug (Female)");
			if(!mother.hasPerk("Butt Bug Symbiosis")) pData.pregnancyIncubationMulti = 1;
			var addRating:int = 0;
			if(buttBugF != null)
			{
				switch(buttBugF.value1)
				{
					case 0:
						pData.pregnancyQuantity = 10;
						addRating = (pData.pregnancyQuantity * 0.2);
						break;
					case 1:
						pData.pregnancyQuantity = 30;
						addRating = (pData.pregnancyQuantity * 0.2);
						break;
					case 2:
						pData.pregnancyQuantity = 1;
						addRating = (pData.pregnancyQuantity * 0.2);
						break;
				}
			}
			pData.pregnancyBellyRatingContribution += addRating;
			mother.bellyRatingMod += addRating;
			
			mother.lust(50);
		}
		
		public static function buttBugOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			var tEventCall:Function = (function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
			{
				return function():void
				{
					kGAMECLASS.expelButtBugEgg(c_mother.pregnancyData[c_pregSlot].pregnancyQuantity);
					ButtBugPregnancy.cleanupPregnancy(c_mother, c_pregSlot, c_thisPtr);
				}
			})(mother, pregSlot, thisPtr);
			
			kGAMECLASS.eventQueue.push(tEventCall);
		}
		
		public static function cleanupPregnancy(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			mother.setStatusValue("Butt Bug (Female)", 2, 0);
			
			pData.reset();
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBirthTimestamp:uint):Child
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			var buttBugF:StorageClass = mother.getStatusEffect("Butt Bug (Female)");
			var eggs:int = pData.pregnancyQuantity;
			
			kGAMECLASS.trackButtBugEggs(buttBugF, "infertile", eggs);
			
			ButtBugPregnancy.cleanupPregnancy(mother, pregSlot, this);
			return null;
		}
	}
}