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
	public class MilodanPregnancyHandler extends BasePregnancyHandler
	{
		public function MilodanPregnancyHandler() 
		{
			_debugTrace = false;
			_handlesType = "MilodanPregnancy";
			_basePregnancyIncubationTime = 60 * 24 * 120; // 4 Months
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
			_pregnancyQuantityMaximum = 5;
			_definedAverageLoadSize = 2400;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_LIVE;
			_pregnancyChildRace = GLOBAL.TYPE_MILODAN;
			_childMaturationMultiplier = 1.0;
			
			_onSuccessfulImpregnation = milodanSuccessfulImpregnation;
			_onDurationEnd = milodanOnDurationEnd;
			
			addStageProgression(_basePregnancyIncubationTime - (14 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent(ParseText("You feel slightly nauseous as you’re walking, light-headedness suddenly washing over you before passing every bit as quickly, leaving you with a slight stirring in your [pc.stomach]. Your codex chirps a notification at you - <b>you’re pregnant!</b>\n\nA rapidly-scrolling text informs you that the pregnancy is Milodan, and you briefly remember the time you spent in the snow under the barbarian. It looks like his effort to breed you did pay off in the end. You wonder, just for a moment, if he had any inkling that his kits would have a better life than he has... if he knows that you’ll care for them, away from the harshness of Uveto’s glacial wastes. They’ll get a fair shot at life in the safety of your nursery on Tavros when the time comes."), "passive");
			}, true);
			
			addStageProgression(_basePregnancyIncubationTime - (35 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent("Walking along, you slowly become aware that your gait is changing. The added weight of your pregnancy, while only detectable by the most perceptive, has altered your body’s centre of gravity. Not to mention that every so often, you feel little movements - maybe tiny hands or feet waving around. Just another reminder that there’s life growing inside you, and rapidly at that. You find yourself wondering how many kits you’ll deliver - it’d be nice if they had playmates their own age in the nursery.", "passive");
				kGAMECLASS.pc.bellyRatingMod += 15;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 15;
			}, true);
			
			addStageProgression(_basePregnancyIncubationTime - (60 * 24 * 60), function(pregSlot:int):void {
				var buffer:String = "";
				var kids:Number = kGAMECLASS.pc.pregnancyData[pregSlot].pregnancyQuantity;;

				if(kids <= 2) buffer = " it feels like at least a couple, or one particularly rambunctious kit.";
				else if(kids <= 3) buffer = " it feels like there’s at least a few in there!";
				else buffer = " it feels like there’s an entire litter in there!";

				AddLogEvent(ParseText("The bump in your tummy is definitely noticeable now, announcing your fertility to everyone. Getting around is a little bit of a hassle, but at the same time you feel a kind of pride in it. Every glance at your baby-bump and smile directed your way is like a reminder you’re full of life. Very <i>active</i> life, if the little punches and kicks are a reliable indicator. You can’t help but wonder how many of the fuzzy little furballs you’ve got inside you;" + buffer),"passive");
				
				kGAMECLASS.pc.bellyRatingMod += 15;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 15;
				
			}, true);
			
			//Fourth notification - 85 days
			addStageProgression(_basePregnancyIncubationTime - (85 * 24 * 60), function(pregSlot:int):void {
				var m:String = "You must be getting close to delivering by now. You’ve swollen to uncomfortably large proportions, your pregnancy readily evident to everyone around you. ";
				if(kGAMECLASS.pc.isTaur()) m += "Your tummy hangs low to the ground";
				else m += "Your tummy protrudes forward";
				m += ", full of Milodan kits waiting to be unleashed on the toys in the nursery. You wind up thinking as you walk, wondering what your children will go on to do. The luxury of having Steele Tech’s backing is that the potential for your offspring is effectively limitless; if nothing else, they can be brought up in comfort.";

				AddLogEvent(m, "passive");
				
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 15;
				pData.pregnancyBellyRatingContribution += 15;
			}, true);
			
			//Fifth notification - 110 days
			addStageProgression(_basePregnancyIncubationTime - (110 * 24 * 60), function(pregSlot:int):void {
				var m:String = "";
				m = "Giving birth must be right around the corner - if you get any bigger, you’re going to pop! Getting around is proving to be somewhat difficult, your mobility hindered by ";
				if(kGAMECLASS.pc.isTaur()) m += "your stomach almost touching the ground";
				else m += "your tummy protruding forward";
				m += ". On the bright side, your babies have been a little less active than usual. No doubt they’re getting ready for their grand debut. You have to wonder if babies of other races are this physical, or if it’s just the Milodan...";
				
				AddLogEvent(m, "passive");
				
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 10;
				pData.pregnancyBellyRatingContribution += 10;
				
			}, true);
		}
		
		public static function milodanSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr, [3.0, 1.5, 0.5]);
		}
		
		public static function milodanOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot];
			
			//If this is the first birth, go at it.
			if (!mother.hasStatusEffect("Milodan Pregnancy Ends") && !kGAMECLASS.disableExploreEvents())
			{
				// Baby count check (just in case)
				var babies:int = mother.pregnancyData[pregSlot].pregnancyQuantity;
				var belly:int = mother.pregnancyData[pregSlot].pregnancyBellyRatingContribution;
				
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

				mother.createStatusEffect("Milodan Pregnancy Ends", babies, belly, pregSlot, babyGender, true);
				kGAMECLASS.eventQueue.push(kGAMECLASS.milodanPregnancyEnds);
				MilodanPregnancyHandler.milodanCleanupData(mother, pregSlot, thisPtr);
			}
			//Delay subsequent births till the first has had time to go off.
			else mother.pregnancyData[pregSlot].pregnancyIncubation += 24;
		}
		public static function milodanCleanupData(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/milodan births", pData.pregnancyQuantity);
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
			
			StatTracking.track("pregnancy/milodan births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
			
			return c;
		}
	}

}