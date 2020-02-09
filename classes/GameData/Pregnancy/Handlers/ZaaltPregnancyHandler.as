package classes.GameData.Pregnancy.Handlers 
{
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
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
	import classes.GameData.Pregnancy.Templates.ZaaltUniqueChild;
	import classes.Engine.Interfaces.AddLogEvent;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class ZaaltPregnancyHandler extends BasePregnancyHandler
	{
		public function ZaaltPregnancyHandler() 
		{
			_debugTrace = false;
			_handlesType = "ZaaltPregnancy";
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
			
			_onSuccessfulImpregnation = zaaltSuccessfulImpregnation;
			_onDurationEnd = zaaltOnDurationEnd;
			
			addStageProgression(_basePregnancyIncubationTime - (14 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent(ParseText("You feel slightly nauseous as you’re walking, light-headedness suddenly washing over you before passing every bit as quickly, leaving you with a slight stirring in your [pc.stomach]. Your codex chirps a notification at you - <b>you’re pregnant!</b>\n\nA rapidly-scrolling text informs you that the pregnancy is Milodan, and your mind instantly goes to your rape at the hands of the maddened Zaalt. It looks like his effort to breed you did pay off in the end. You shudder involuntarily, wondering just what happened to the milodan man... and what will become of your children. You suppose that they’ll get a fair shot at life in the safety of your nursery on Tavros when the time comes."), "passive");
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
		
		public static function zaaltSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr, [3.0, 1.5, 0.5]);
		}
		
		public static function zaaltOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot];
			
			//If this is the first birth, go at it.
			if (!mother.hasStatusEffect("Zaalt Pregnancy Ends") && !kGAMECLASS.disableExploreEvents())
			{
				// Baby count check (just in case)
				var babies:int = mother.pregnancyData[pregSlot].pregnancyQuantity;
				var belly:int = mother.pregnancyData[pregSlot].pregnancyBellyRatingContribution;
				
				// Generate babies
				var babyList:Array = (new ZaaltPregnancyHandler()).zaaltChildren(mother, babies);
				var genderList:Array = [];
				var i:int = 0;
				var j:int = 0;
				for(i = 0; i < babyList.length; i++)
				{
					//for(j = 0; j < babyList[i].NumNeuter; j++) { genderList.push(-1); }
					for(j = 0; j < babyList[i].NumFemale; j++) { genderList.push(0); }
					for(j = 0; j < babyList[i].NumMale; j++) { genderList.push(1); }
					//for(j = 0; j < babyList[i].NumIntersex; j++) { genderList.push(2); }
					ChildManager.addChild(babyList[i]);
				}
				
				// Random baby's gender ( 1 for male, 0 for female )
				var babyGender:int = rand(2);
				if(genderList.length > 0) babyGender = genderList[rand(genderList.length)];
				
				mother.createStatusEffect("Zaalt Pregnancy Ends", babies, belly, pregSlot, babyGender, true);
				kGAMECLASS.eventQueue.push(kGAMECLASS.zaaltPregnancyEnds);
				ZaaltPregnancyHandler.zaaltCleanupData(mother, pregSlot, thisPtr);
			}
			//Delay subsequent births till the first has had time to go off.
			else mother.pregnancyData[pregSlot].pregnancyIncubation += 24;
		}
		public static function zaaltCleanupData(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/zaalt kids", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBornTimestamp:uint):Child
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			var babyList:Array = zaaltChildren(mother, pData.pregnancyQuantity);
			var i:int = 0;
			for(i = 0; i < babyList.length; i++)
			{
				babyList[i].BornTimestamp = useBornTimestamp;
				ChildManager.addChild(babyList[i]);
			}
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/zaalt kids", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
			
			if(babyList.length > 0)
			{
				var cTemp:Child = new Child();
				cTemp.RaceType = babyList[0].RaceType;
				cTemp.MaturationRate = babyList[0].MaturationRate;
				cTemp.BornTimestamp = babyList[0].BornTimestamp;
				cTemp.NumMale = 0;
				cTemp.NumFemale = 0;
				for(i = 0; i < babyList.length; i++)
				{
					cTemp.NumMale += babyList[i].NumMale;
					cTemp.NumFemale += babyList[i].NumFemale;
				}
				return cTemp;
			}
			return null;
		}
		
		private function zaaltChildren(mother:Creature, numKids:int = 0):Array
		{
			var babyList:Array = [];
			
			var traitChar:Creature = mother;
			if(mother is PlayerCharacter) traitChar = kGAMECLASS.chars["PC_BABY"];
			
			var c:UniqueChild = new ZaaltUniqueChild();
			
			c.RaceType = pregnancyChildRace;
			c.NumMale = 0;
			c.NumFemale = 0;
			c.NumIntersex = 0;
			c.NumNeuter = 0;
			
			// 50% Male or Female
			for(var i:int = 0; i < numKids; i++)
			{
				if(rand(2) == 0) c.NumMale += 1;
				else c.NumFemale += 1;
			}
			
			// Race modifier (if different races)
			c.originalRace = c.hybridizeRace(mother.originalRace, c.originalRace, (mother is PlayerCharacter));
			
			// Adopt mother's colors at random (if applicable):
			if(rand(2) == 0) c.skinTone = traitChar.skinTone;
			//if(rand(2) == 0) c.lipColor = traitChar.lipColor;
			//if(rand(2) == 0) c.nippleColor = traitChar.nippleColor;
			if(rand(2) == 0) c.eyeColor = traitChar.eyeColor;
			if(rand(2) == 0) c.hairColor = traitChar.hairColor;
			//if(rand(2) == 0) c.furColor = traitChar.furColor;
			//if(rand(2) == 0) c.scaleColor = traitChar.scaleColor;
			//if(rand(2) == 0) c.chitinColor = traitChar.scaleColor;
			//if(rand(2) == 0) c.featherColor = traitChar.furColor;
			
			c.MaturationRate = childMaturationMultiplier;
			c.BornTimestamp = kGAMECLASS.GetGameTimestamp();
			
			babyList.push(c);
			
			return babyList;
		}
	}

}