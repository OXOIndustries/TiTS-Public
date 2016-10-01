package classes.GameData.Pregnancy.Handlers 
{
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.Creature;
	import classes.PregnancyData;
	import classes.kGAMECLASS;
	import classes.GameData.StatTracking;
	import classes.Engine.Map.InPublicSpace;
	import classes.GLOBAL;
	import classes.StorageClass;
	import classes.Engine.Utility.rand;
	import classes.GameData.ChildManager;
	import classes.GameData.Pregnancy.Child;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class QueenOfTheDeepPregnancy extends BasePregnancyHandler
	{
		
		public function QueenOfTheDeepPregnancy() 
		{
			_handlesType = "DeepQueenPregnancy";
			_basePregnancyIncubationTime = 6 * 7 * 24 * 60; // 6 weeks
			_basePregnancyChance = 1;
			_alwaysImpregnate = true;
			_ignoreInfertility = true;
			_ignoreMotherInfertility = true;
			_ignoreFatherInfertility = true;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = true;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 3;
			_pregnancyQuantityMaximum = 6;
			_definedAverageLoadSize = 720;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_EGGS;
			_pregnancyChildRace = GLOBAL.TYPE_WATERQUEEN;
			_childMaturationMultiplier = 2.0;
			_childGenderWeights.Male = 0;
			
			this.addStageProgression(_basePregnancyIncubationTime - (7 * 24 * 60), function(pregSlot:int):void {
				var pSE:StorageClass = kGAMECLASS.pc.getStatusEffect("Queen Pregnancy State");
				if (pSE != null)
				{
					pSE.value1 = 1; // enable dreams + bellymovement messages
					pSE.value2 = 1; // enable sickness messages
				}
			}, true);
			
			this.addStageProgression(_basePregnancyIncubationTime - (3 * 7 * 24 * 60), function(pregSlot:int):void {
				var pSE:StorageClass = kGAMECLASS.pc.getStatusEffect("Queen Pregnancy State");
				if (pSE != null)
				{
					pSE.value2 = 0; // disable sickness
					if (pSE.value3 == 0) pSE.value3 = 1; // enable lactation if it's not already proc'd
				}
			}, true);
			
			this.addStageProgression(24 * 60, function(pregSlot:int):void {
				var pSE:StorageClass = kGAMECLASS.pc.getStatusEffect("Queen Pregnancy State");
				if (pSE != null)
				{
					if (pSE.value4 == 0) pSE.value4 = 1; // enable almost time message if not already proc'd
				}
				
				if (pregSlot == 3 && kGAMECLASS.pc.ass.wetnessRaw < 5)
				{
					kGAMECLASS.pc.ass.wetnessRaw += 1;
				}
				else
				{
					if (kGAMECLASS.pc.vaginas.length > pregSlot) // potential error catching.
					{
						if (kGAMECLASS.pc.vaginas[pregSlot].wetnessRaw < 5)
						{
							kGAMECLASS.pc.vaginas[pregSlot].wetnessRaw += 1;
						}
					}
				}
				
				kGAMECLASS.pc.libido(5);
				
			}, true);
			
			_onSuccessfulImpregnation = queenOnSuccessfulImpregnation;
			_onDurationEnd = queenOnDurationEnd;
		}
		
		public static function queenOnSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			var pData:PregnancyData = mother.pregnancyData[pregSlot];
			
			pData.pregnancyBellyRatingContribution = 20 * pData.pregnancyQuantity;
			mother.bellyRatingMod += pData.pregnancyBellyRatingContribution;
			
			if (!mother.hasStatusEffect("Queen Pregnancy State"))
			{
				mother.createStatusEffect("Queen Pregnancy State", 0, 0, 0, 0, true, "", "", false, 0);
			}
		}
		
		public static function queenOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			if (!mother.hasStatusEffect("Queen Pregnancy End"))
			{
				mother.createStatusEffect("Queen Pregnancy End", 0, 0, 0, 0, true, "", "", false, 0);
			}
			
			var pData:PregnancyData = mother.pregnancyData[pregSlot];
			
			mother.addStatusValue("Queen Pregnancy End", 1, pData.pregnancyQuantity);
			mother.addStatusValue("Queen Pregnancy End", 2, pData.pregnancyBellyRatingContribution);
			
			if (pregSlot == 3) mother.addStatusValue("Queen Pregnancy End", 3, 1);
			else mother.addStatusValue("Queen Pregnancy End", 4, 1);
			
			if (kGAMECLASS.eventQueue.indexOf(kGAMECLASS.queenPregnancyEnds) == -1)
			{
				kGAMECLASS.eventQueue.push(kGAMECLASS.queenPregnancyEnds);
			}
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBornTimestamp:uint):void
		{
			var totalChildren:int = 0;
			
			for (var i:int = 0; i < mother.pregnancyData.length; i++)
			{
				var pData:PregnancyData = mother.pregnancyData[i] as PregnancyData;
				if (pData.pregnancyType == "DeepQueenPregnancy")
				{
					StatTracking.track("pregnancy/queen of the deep eggs", pData.pregnancyQuantity);
					StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
					totalChildren += pData.pregnancyQuantity;
					mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
					pData.reset();
				}
			}
			
			var c:Child = Child.NewChild(GLOBAL.TYPE_WATERQUEEN, 2.0, totalChildren, 0, 1, 0, 0);
			c.BornTimestamp = useBornTimestamp;
			ChildManager.addChild(c);
			
			kGAMECLASS.pc.removeStatusEffect("Queen Pregnancy End");
			kGAMECLASS.pc.removeStatusEffect("Queen Pregnancy State");
			kGAMECLASS.flags["Queen Message Supression"] = undefined;
			kGAMECLASS.flags["Queen Message Weight"] = undefined;
		}
		
		public static function queenCleanupData():void
		{
			var totalChildren:int = 0;
			
			for (var i:int = 0; i < kGAMECLASS.pc.pregnancyData.length; i++)
			{
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[i];
				if (pData.pregnancyType == "DeepQueenPregnancy")
				{
					StatTracking.track("pregnancy/queen of the deep eggs", pData.pregnancyQuantity);
					StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
					totalChildren += pData.pregnancyQuantity;
			
					kGAMECLASS.pc.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
					pData.reset();
				}
			}
			
			ChildManager.addChild(
				Child.NewChild(
					GLOBAL.TYPE_WATERQUEEN,
					2.0,
					totalChildren,
					0, 1, 0, 0
				)
			);
			
			kGAMECLASS.pc.removeStatusEffect("Queen Pregnancy End");
			kGAMECLASS.pc.removeStatusEffect("Queen Pregnancy State");
			kGAMECLASS.flags["Queen Message Supression"] = undefined;
			kGAMECLASS.flags["Queen Message Weight"] = undefined;
		}
		
		public static function queenPregnancyMessages(delta:Number):void
		{
			if (kGAMECLASS.flags["Queen Message Supression"] != undefined) return;
			if (!kGAMECLASS.pc.hasStatusEffect("Queen Pregnancy State")) return;
			
			var pSE:StorageClass = kGAMECLASS.pc.getStatusEffect("Queen Pregnancy State");
			
			if (pSE.value3 != 0)
			{
				if (!kGAMECLASS.pc.canLactate())
				{
					if (kGAMECLASS.eventQueue.indexOf(kGAMECLASS.queenLactationEvent) == -1)
					{
						kGAMECLASS.eventQueue.push(kGAMECLASS.queenLactationEvent);
					}
					
					kGAMECLASS.flags["Queen Message Supression"] = 1;
					return;
				}			
			}
			
			if (pSE.value4 == 1)
			{
				if (kGAMECLASS.eventQueue.indexOf(kGAMECLASS.queenAlmostDueMessage) == -1)
				{
					kGAMECLASS.eventQueue.push(kGAMECLASS.queenAlmostDueMessage);
				}
				kGAMECLASS.pc.setStatusValue("Queen Pregnancy State", 4, 0);
				kGAMECLASS.flags["Queen Message Supression"] = 1;
				return;
			}
			
			if (kGAMECLASS.flags["Queen Message Weight"] == undefined) kGAMECLASS.flags["Queen Message Weight"] = 1;
			
			if (rand(1440) <= kGAMECLASS.flags["Queen Message Weight"]) // roughly 50% chance of a message every 12 hours, linearly scaling to 100% chance at 24 hours
			{
				var pMsgFunctors:Array = [];
				
				if (pSE != null)
				{
					if (InPublicSpace(kGAMECLASS.pc))
					{
						pMsgFunctors.push(queenBellyrubMessageHandler);
					}
					
					if (pSE.value1 != 0) 
					{
						pMsgFunctors.push(queenBellymovementMessageHandler);
					}
					
					if (pSE.value2 != 0)
					{
						pMsgFunctors.push(queenSicknessMessageHandler);
					}
					
					if (pSE.value3 != 0 && kGAMECLASS.pc.canLactate() && kGAMECLASS.pc.milkRate < 25)
					{
						pMsgFunctors.push(queenLactIncEvent);
					}
					
				}
				
				if (pMsgFunctors.length > 0)
				{
					pMsgFunctors[rand(pMsgFunctors.length)]();
					kGAMECLASS.flags["Queen Message Supression"] = 1;
					kGAMECLASS.flags["Queen Message Weight"] = 0;
				}
				else
				{
					kGAMECLASS.flags["Queen Message Weight"] += delta;
				}
			}
			else
			{
				kGAMECLASS.flags["Queen Message Weight"] += delta;
			}
		}
		
		public static function queenLactIncEvent():void
		{
			if (kGAMECLASS.eventQueue.indexOf(kGAMECLASS.queenLactationIncreaseEvent) == -1)
			{
				kGAMECLASS.eventQueue.push(kGAMECLASS.queenLactationIncreaseEvent);
			}
		}
		
		public static function queenSicknessMessageHandler():void
		{
			if (kGAMECLASS.eventQueue.indexOf(kGAMECLASS.queenMorningSickness) == -1)
			{
				kGAMECLASS.eventQueue.push(kGAMECLASS.queenMorningSickness);
			}
		}
		
		public static function queenBellyrubMessageHandler():void
		{
			if (kGAMECLASS.eventQueue.indexOf(kGAMECLASS.queenBellyrubEvent) == -1)
			{
				kGAMECLASS.eventQueue.push(kGAMECLASS.queenBellyrubEvent);
			}
		}
		
		public static function queenBellymovementMessageHandler():void
		{
			if (kGAMECLASS.eventQueue.indexOf(kGAMECLASS.queenBellyMovementEvent) == -1)
			{
				kGAMECLASS.eventQueue.push(kGAMECLASS.queenBellyMovementEvent);
			}
		}
		
		override public function pregBellyFragment(target:Creature, slot:int):String
		{
			return "At first glance, people might be mistaken for thinking you're properly pregnant, but closer inspection reveals your belly to be lumpy and slightly misshapen, full of several individual, moving creatures as you are.";
		}
		
	}

}