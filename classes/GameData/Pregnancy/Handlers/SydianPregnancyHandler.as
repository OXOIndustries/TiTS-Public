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
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SydianPregnancyHandler extends BasePregnancyHandler
	{
		public function SydianPregnancyHandler() 
		{
			_handlesType = "SydianPregnancy";
			_basePregnancyIncubationTime = 60 * 24 * 270; // 9 Months
			_basePregnancyChance = 0.1;
			_alwaysImpregnate = false;
			_ignoreInfertility = false;
			_ignoreFatherInfertility = false;
			_ignoreMotherInfertility = false;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = false;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 1;
			_pregnancyQuantityMaximum = 3;
			_definedAverageLoadSize = 640;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_LIVE;
			_pregnancyChildRace = GLOBAL.TYPE_HUMAN;
			_childMaturationMultiplier = 1.0;
			
			_onSuccessfulImpregnation = sydianSuccessfulImpregnation;
			_onDurationEnd = sydianOnDurationEnd;
			
			addStageProgression(_basePregnancyIncubationTime - (45 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent("Your stomach lurches, and you stop what you’re doing. It feels like you’re going to puke. Urk... bleah- nope. Just as abruptly, the nausea recedes. What was that about?", "passive");
			}, true);
			
			addStageProgression(_basePregnancyIncubationTime - (55 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent("You bend double with nausea again, your stomach violently uneasy. This is too persistent to be a common bug, and any toxic crap you ate would be vomited out by now. A suspicion begins to develop....", "passive");
			}, true);
			
			//three - bad sickness, tiny growth 
			addStageProgression(_basePregnancyIncubationTime - (90 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent(ParseText("Your queasy stomach has been complaining more and more; you can barely keep meals down." + (kGAMECLASS.pc.bellyRating() < 10 ? " Despite this, your [pc.belly] seems bigger, if anything." : "")), "passive");
				kGAMECLASS.pc.bellyRatingMod += 10;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 10;
				
			}, true);
			
			//four - start to show
			addStageProgression(_basePregnancyIncubationTime - (120 * 24 * 60), function(pregSlot:int):void {
				var m:String = "The cause of the terrible nausea you suffered is visible now - your womb is swollen with new life,";
				if (kGAMECLASS.pc.bellyRating() < 20) m += " turning your belly into a cute bump.";
				else m += " expanding your waistline a bit.";
				m += " A very weak jerk or twitch can be felt from time to time. You’re going to be a mother";
				if (StatTracking.getStat("pregnancy/total births") > 0) m += " again";
				m += "!";
				
				AddLogEvent(m, "passive");
				
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 10;
				pData.pregnancyBellyRatingContribution += 10;
			}, true);
			
			//five - getting jolly round - lactation begins
			addStageProgression(_basePregnancyIncubationTime - (160 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.bellyRatingMod += 10;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 10;
				
				AddLogEvent(ParseText("Your [pc.belly] " + (kGAMECLASS.pc.bellyRating() <= 30 ? ("bulges with your growing fetus" + (pData.pregnancyQuantity == 1 ? "" : "es")) : "is starting to show signs of pregnancy") + ", causing some trouble with your [pc.gear]. " + (kGAMECLASS.pc.isLactating() == false ? "Your nipples have also become tender and sometimes leak... you" : "You") +" feel like a mess, but for some reason you’re happy."), "passive");
				
				kGAMECLASS.pc.milkFullness += 15;
				
			}, true);
			
			//six - really out there - minor rfx penalty? - @200 days
			addStageProgression(_basePregnancyIncubationTime - (200 * 24 * 60), function(pregSlot:int):void {
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 10 + (5 * pData.pregnancyQuantity);
				pData.pregnancyBellyRatingContribution += 10 + (5 * pData.pregnancyQuantity);
				
				AddLogEvent("Carrying your pregnant belly has become like toting a medicine ball, straining your " + (kGAMECLASS.pc.isTaur() ? "legs" : "back") +" and slowing your movements. The little" + (pData.pregnancyQuantity == 1 ? "" : " sparks of") + " life within " + (pData.pregnancyQuantity == 1 ? "is" : "are") + " fairly mauling you with kicks and elbows" + (!kGAMECLASS.pc.isTaur() ? ", but rubbing your belly often seems to calm " + (pData.pregnancyQuantity == 1 ? "it" : "them") + " down" : "") +". You wonder how much longer you’ll have to wait.", "passive");
				
				if (kGAMECLASS.pc.milkFullness < 10) kGAMECLASS.pc.milkFullness += 15;
			}, true);
			
			//seven - hard to move - rfx penalty increases? - @240 days
			addStageProgression(_basePregnancyIncubationTime - (240 * 24 * 60), function(pregSlot:int):void
			{
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += (12 * pData.pregnancyQuantity);
				pData.pregnancyBellyRatingContribution += (12 * pData.pregnancyQuantity);
				
				AddLogEvent("Judging from the size of your swollen belly, you guess that your bab" + (pData.pregnancyQuantity == 1 ? "y" : "ies") + " will arrive within the next month. Or perhaps it would be accurate to say you <i>hope</i>. It’s hard to stay active with the unwieldy weight - you continually fight back urges to lie in bed and do nothing.", "passive");
				
				if (kGAMECLASS.pc.milkFullness < 10) kGAMECLASS.pc.milkFullness += 25;
				if (kGAMECLASS.pc.milkMultiplier < 1.5) kGAMECLASS.pc.milkMultiplier += 0.15;
				if (kGAMECLASS.pc.milkRate < 25) kGAMECLASS.pc.milkRate += 5;
			}, true);
			
			//eight - any day now - @260 days
			addStageProgression(_basePregnancyIncubationTime - (260 * 24 * 60), function(pregSlot:int):void {
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += (12 * pData.pregnancyQuantity);
				pData.pregnancyBellyRatingContribution += (12 * pData.pregnancyQuantity);
				
				var sTime:String = "day";
				var sTime2:String = "week";
				var nTime:Number = Math.floor(10080/pData.pregnancyIncubationMulti);
				if(nTime <= 1440) { sTime = "hour"; sTime2 = "day"; }
				if(nTime <= 60) { sTime = "minute"; sTime2 = "hour"; }
				if(nTime <= 0) { sTime = "second"; sTime2 = "minute"; }
				
				AddLogEvent("The clamor in your distended womb worsens every " + sTime + " as " + (pData.pregnancyQuantity == 1 ? "the" : "a") + " baby exercises its body. You expect the little hellion’s birth within the " + sTime2 + ", and are torn between excitement and dread.", "passive");
				
				if (kGAMECLASS.pc.milkFullness < 20) kGAMECLASS.pc.milkFullness += 25;
				if (kGAMECLASS.pc.milkMultiplier < 1.5) kGAMECLASS.pc.milkMultiplier += 0.15;
				if (kGAMECLASS.pc.milkRate < 25) kGAMECLASS.pc.milkRate += 5;
			}, true);
		}
		
		public static function sydianSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr, [3.0, 1.5, 0.5]);
		}
		
		public static function sydianOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot];
			
			//If this is the first birth, go at it.
			if (!mother.hasStatusEffect("Sydian Pregnancy Ends"))
			{
				// Baby count check (just in case)
				var babies:int = mother.pregnancyData[pregSlot].pregnancyQuantity;
				var belly:int = mother.pregnancyData[pregSlot].pregnancyBellyRatingContribution;
				/*Lets not poop out half-formed sydians
				for (var i:int = 0; i < mother.pregnancyData.length; i++)
				{
					if (mother.pregnancyData[i].pregnancyType == "SydianPregnancy")
					{
						babies += mother.pregnancyData[i].pregnancyQuantity;
						belly += mother.pregnancyData[i].pregnancyBellyRatingContribution;
					}
				}*/
				
				// Generate babies
				var c:Child = Child.NewChildWeights(
					thisPtr.pregnancyChildRace,
					thisPtr.childMaturationMultiplier,
					babies,
					thisPtr.childGenderWeights
				);
				ChildManager.addChild(c);
				
				var genderList:Array = [];
				var i:int = 0;
				//for(i = 0; i < c.NumNeuter; i++) { genderList.push(-1); }
				for(i = 0; i < c.NumFemale; i++) { genderList.push(0); }
				for(i = 0; i < c.NumMale; i++) { genderList.push(1); }
				//for(i = 0; i < c.NumIntersex; i++) { genderList.push(2); }
				var babyGender:int = rand(2);
				if(genderList.length > 0) babyGender = genderList[rand(genderList.length)];

				mother.createStatusEffect("Sydian Pregnancy Ends", babies, belly, pregSlot, babyGender, true);
				kGAMECLASS.eventQueue.push(kGAMECLASS.sydianPregnancyEnds);
				SydianPregnancyHandler.sydianCleanupData(mother, pregSlot, thisPtr);
			}
			//Delay subsequent births till the first has had time to go off.
			else mother.pregnancyData[pregSlot].pregnancyIncubation += 24;
		}
		public static function sydianCleanupData(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/sydian births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBornTimestamp:uint):Child
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			var c:Child = Child.NewChildWeights(pregnancyChildRace, childMaturationMultiplier, pData.pregnancyQuantity, childGenderWeights);
			c.BornTimestamp = useBornTimestamp;
			ChildManager.addChild(c);
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/sydian births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
			
			return c;
		}
	}

}