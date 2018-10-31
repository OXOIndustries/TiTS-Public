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
	import classes.GameData.Pregnancy.Templates.RiyaUniqueChild;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Interfaces.AddLogEvent;
	
	public class RiyaPregnancyHandler extends BasePregnancyHandler
	{
		public function RiyaPregnancyHandler() 
		{
			_handlesType = "RiyaPregnancy";
			_basePregnancyIncubationTime = (60 * 24 * 272); // 9 Months
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
			_definedAverageLoadSize = 800;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_LIVE;
			_pregnancyChildRace = GLOBAL.TYPE_HUMAN;
			_childMaturationMultiplier = 1.0;
			
			_onSuccessfulImpregnation = riyaSpawnSuccessfulImpregnation;
			_onDurationEnd = riyaSpawnOnDurationEnd;
			
			for(var i:int = 40; i <= 270; i += 5)
			{
				// Preg Texts
				// Some lines cribbed from Z’s sydian pregnancy
				// Each line activates once during range
				
				// 40-50 days
				if(i == 45)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Doubling over suddenly, you barely stop yourself from making a modern art masterpiece with the contents of your stomach, looking around for " + (kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.PUBLIC) ? "a trash bin" : "somewhere out of the way") + " to toss your lunch. Did you catch something, or just eat something rotten?", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
					}, true);
				}
				// 50-60 days
				else if(i == 55)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Mood swings. Mood swings. One moment perfectly calm and reasonable, the next ready to dismember anyone and everyone at the slightest provocation. You blame your stomach, which remains bloated and upset.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
					}, true);
				}
				// 80-90 days
				else if(i == 85)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Why are you so fucking <b>hungry</b> all the time? Furthermore, why are you craving such strange foods at such strange times? Like the other night, when you woke up at two in the morning with a hankering for lightly fried fish fillets. What was <b>that</b> about?\n\nYour codex chimes suddenly, cheerily confirming the suspicion growing in the back of your mind - you’re pregnant. By a human, no less. Well then.\n\nEven more precisely than that, your codex goes silent for a moment, humming as it’s systems work, before chiming proudly with the news that it was able to inform you of your child’s parentage!\n\nRiya. Riya Batra.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
					}, true);
				}
				// 115-125 days
				else if(i == 120)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						var sTime:String = "weeks";
						var nTime:Number = (20160/kGAMECLASS.pc.pregnancyData[pregSlot].pregnancyIncubationMulti);
						if(nTime < 20160) sTime = "days";
						if(nTime < 2880) sTime = "hours";
						if(nTime < 120) sTime = "minutes";
						AddLogEvent("Even if you didn’t already know the truth, at this point there’d be no other explanation for your current state besides pregnancy. Your tummy has swollen out noticeably, harder and harder to conceal as the " + sTime + " go on.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
					}, true);
				}
				// 140-150 days
				else if(i == 145)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Your fat belly continues to expand ever outwards, dousing your body in hormones and low-levels of lust. Your [pc.nipples] have expanded slightly, and your [pc.chest] and belly feel sensitive and warm in general. It’s more than that, though; you feel... <b>right</b>. Content. It’s almost as if your body has a mind of it’s own, one that approves very much of you bringing new life into the galaxy.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
						if(kGAMECLASS.pc.milkMultiplier < 25) kGAMECLASS.pc.milkMultiplier = 25;
						if(kGAMECLASS.pc.milkFullness < 25) kGAMECLASS.pc.milkFullness = 25;
						kGAMECLASS.pc.milkFullness += 15;
					}, true);
				}
				// 170-180 days
				else if(i == 175)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("You find yourself waddling more than walking, lately; no doubt thanks to the basketball you’re hauling around in your stomach. People occasionally come up to you in public now and either ask to touch your belly or do so without permission. As intrusive and obnoxious as that is, you can’t deny the simple pleasure the attention gives you." + (kGAMECLASS.pc.biggestTitSize() > 1 ? " " + (!kGAMECLASS.pc.isLactating() ? "Your [pc.breasts] are starting to leak milk at the worst possible times, too." : "Your [pc.breasts] are also starting to swell with even more [pc.milk] than usual as your body gets ready to feed your baby.") : "") + " You jump a bit as something bumps into your stomach - from the inside.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.5, true);
						if(kGAMECLASS.pc.milkMultiplier < 50) kGAMECLASS.pc.milkMultiplier = 50;
						if(kGAMECLASS.pc.milkFullness < 50) kGAMECLASS.pc.milkFullness = 50;
						kGAMECLASS.pc.milkFullness += 15;
						// Insert Reflex reduction modifier
						if(kGAMECLASS.pc.hasStatusEffect("Riya Spawn Reflex Mod")) kGAMECLASS.pc.addStatusValue("Riya Spawn Reflex Mod", 1, 5);
						else kGAMECLASS.pc.createStatusEffect("Riya Spawn Reflex Mod", 5, 0, 0, 0, true, "", "", false, 0);
					}, true);
				}
				// 200-210 days
				else if(i == 205)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Finding yourself short of breath suddenly, you take a few moments to recover and to take some weight off your back. Your tummy is taut and gravid, forcing you to take care with each movement you make. Your growing child is beating the inside of your womb like it owes them money - as excited and happy you are that they’re healthy and strong, you’re not sure how much more of the kicking you can take.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.5, true);
						if (kGAMECLASS.pc.milkFullness < 10) kGAMECLASS.pc.milkFullness += 15;
						// Increase Reflex modifier
						if(kGAMECLASS.pc.hasStatusEffect("Riya Spawn Reflex Mod")) kGAMECLASS.pc.addStatusValue("Riya Spawn Reflex Mod", 1, 5);
						else kGAMECLASS.pc.createStatusEffect("Riya Spawn Reflex Mod", 5, 0, 0, 0, true, "", "", false, 0);
					}, true);
				}
				// 240-250 days
				else if(i == 245)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("It can’t be long now. It feels like you’re carrying a watermelon in your stomach, but you know that can’t be right - surely you’re exaggerating. You hope. Your organs have rearranged themselves around the new life in your swollen belly, and according to your codex your baby should arrive within the next month or so. It’s hard to stay active, but you know you have to - for your health and the baby’s.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.5, true);
						if (kGAMECLASS.pc.milkFullness < 10) kGAMECLASS.pc.milkFullness += 25;
						if (kGAMECLASS.pc.milkMultiplier < 1.5) kGAMECLASS.pc.milkMultiplier += 0.15;
						if (kGAMECLASS.pc.milkRate < 25) kGAMECLASS.pc.milkRate += 5;
					}, true);
				}
				// 258-262 days
				else if(i == 260)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Your due date is fast approaching - you can sense that even without medical predictions. Your cervix is permanently soft and slightly dilated now, and the kicking in your stomach feels almost constant." + (!kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.PUBLIC) ? " You should really probably find somewhere safe to give birth." : ""), "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 2, true);
						if (kGAMECLASS.pc.milkFullness < 20) kGAMECLASS.pc.milkFullness += 25;
						if (kGAMECLASS.pc.milkMultiplier < 1.5) kGAMECLASS.pc.milkMultiplier += 0.15;
						if (kGAMECLASS.pc.milkRate < 25) kGAMECLASS.pc.milkRate += 5;
					}, true);
				}
				// 268-272 days (sprog = dropped)
				
				// Progressive changes with no text:
				else if(i > 245)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 2, true);
						if (kGAMECLASS.pc.milkFullness < 10) kGAMECLASS.pc.milkFullness += 25;
						if (kGAMECLASS.pc.milkMultiplier < 1.5) kGAMECLASS.pc.milkMultiplier += 0.15;
						if (kGAMECLASS.pc.milkRate < 25) kGAMECLASS.pc.milkRate += 5;
					}, true);
				}
				else if(i > 145)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.5, true);
						if (kGAMECLASS.pc.milkFullness < 10) kGAMECLASS.pc.milkFullness += 15;
					}, true);
				}
				else
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
					}, true);
				}
			}
		}
		
		public static function riyaSpawnSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr, [3.0, 2.0, 1.0]);
		}
		
		public static function riyaSpawnOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot];
			
			//If this is the first birth, go at it.
			if (!mother.hasStatusEffect("Riya Spawn Pregnancy Ends"))
			{
				// Baby count check (just in case)
				var babies:int = mother.pregnancyData[pregSlot].pregnancyQuantity;
				var belly:int = mother.pregnancyData[pregSlot].pregnancyBellyRatingContribution;
				
				// Generate babies
				var babyList:Array = (new RiyaPregnancyHandler()).riyaSpawnChildren(mother, babies);
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
				
				// Random baby’s gender ( 1 for male, 0 for female )
				var babyGender:int = rand(2);
				if(genderList.length > 0) babyGender = genderList[rand(genderList.length)];
				
				mother.createStatusEffect("Riya Spawn Pregnancy Ends", babies, belly, pregSlot, babyGender, true);
				kGAMECLASS.eventQueue.push(kGAMECLASS.riyaSpawnPregnancyEnds);
				RiyaPregnancyHandler.riyaSpawnCleanupData(mother, pregSlot, thisPtr);
			}
			//Delay subsequent births till the first has had time to go off.
			else mother.pregnancyData[pregSlot].pregnancyIncubation += 24;
		}
		public static function riyaSpawnCleanupData(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/riya kids", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBornTimestamp:uint):Child
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			var babyList:Array = riyaSpawnChildren(mother, pData.pregnancyQuantity);
			var i:int = 0;
			for(i = 0; i < babyList.length; i++)
			{
				babyList[i].BornTimestamp = useBornTimestamp;
				ChildManager.addChild(babyList[i]);
			}
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/riya kids", pData.pregnancyQuantity);
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
		
		private function riyaSpawnChildren(mother:Creature, numKids:int = 0):Array
		{
			var babyList:Array = [];
			
			var traitChar:Creature = mother;
			if(mother is PlayerCharacter) traitChar = kGAMECLASS.chars["PC_BABY"];
			
			for(var i:int = 0; i < numKids; i++)
			{
				var c:UniqueChild = new RiyaUniqueChild();
				
				c.RaceType = pregnancyChildRace;
				// 50% Male or Female
				if(rand(2) == 0) { c.NumMale = 1; c.NumFemale = 0; c.NumIntersex = 0; c.NumNeuter = 0; }
				else { c.NumMale = 0; c.NumFemale = 1; c.NumIntersex = 0; c.NumNeuter = 0; }
				
				// Race modifier (if different races)
				c.originalRace = c.hybridizeRace(mother.originalRace, c.originalRace, (mother is PlayerCharacter));
				
				// Adopt mother’s colors at random (if applicable):
				//if(rand(2) == 0) c.skinTone = traitChar.skinTone;
				//if(rand(2) == 0) c.lipColor = traitChar.lipColor;
				//if(rand(2) == 0) c.nippleColor = traitChar.nippleColor;
				//if(rand(2) == 0) c.eyeColor = traitChar.eyeColor;
				//if(rand(2) == 0) c.hairColor = traitChar.hairColor;
				//if(rand(2) == 0) c.furColor = traitChar.furColor;
				//if(rand(2) == 0) c.scaleColor = traitChar.scaleColor;
				//if(rand(2) == 0) c.chitinColor = traitChar.scaleColor;
				//if(rand(2) == 0) c.featherColor = traitChar.furColor;
				
				c.MaturationRate = childMaturationMultiplier;
				c.BornTimestamp = kGAMECLASS.GetGameTimestamp();
				
				babyList.push(c);
			}
			
			return babyList;
		}
	}

}

