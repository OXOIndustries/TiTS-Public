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
	import classes.GameData.Pregnancy.Templates.SeraUniqueChild;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Interfaces.AddLogEvent;
	
	public class SeraSpawnPregnancyHandler extends BasePregnancyHandler
	{
		public function SeraSpawnPregnancyHandler() 
		{
			_handlesType = "SeraSpawnPregnancy";
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
			_definedAverageLoadSize = 2400;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_LIVE;
			_pregnancyChildRace = GLOBAL.TYPE_HUMAN;
			_childMaturationMultiplier = 1.0;
			
			_onSuccessfulImpregnation = seraSpawnSuccessfulImpregnation;
			_onDurationEnd = seraSpawnOnDurationEnd;
			
			for(var i:int = 40; i <= 270; i += 5)
			{
				// Preg Texts
				// Some lines cribbed from Z’s sydian pregnancy
				// Each line activates once during range
				
				// 40-50 days
				if(i == 45)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Your stomach lurches, and you stop what you’re doing. It feels like you’re going to puke. Urk... bleah - nope. You take long breaths, waiting for the nausea to recede, before carrying on.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
					}, true);
				}
				// 50-60 days
				else if(i == 55)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("You feel unaccountably prickly, ready to snap and get angry at the most innocuous of" + (kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.PUBLIC) ? " comments" : " changes in the environment around you") + ". You blame your gut, which remains unsettled and bloated.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
					}, true);
				}
				// 80-90 days
				else if(i == 85)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("You could absolutely murder some junk food. Forget what you’re doing, just take off and find the nearest grease pit, garnish yourself with some serious deep-fried calories. Despite your hunger, your belly is beginning to look quite round.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
					}, true);
				}
				// 115-125 days
				else if(i == 120)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Well, there’s no more rationalizing away your current state. Your tummy is now noticeably rotund, your womb swollen and snug with new life. Given the length of time it’s taken to get to this stage, it is surely a human pregnancy. Which mostly-human might you have been knocking unprotected boots with, three or so months ago? You grin, stroking the curve of your stomach.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
					}, true);
				}
				// 140-150 days
				else if(i == 145)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Your stomach continues to swell inexorably outwards, damping your body in a swelter of soft warmth and low-level horniness. The areola of your [pc.nipples] have spread a bit, and your [pc.chest] in general feels sensitive and pleasant to touch. More difficult to quantify is a certain self-satisfied rightness; a deep, ancient knowledge of contentment. You certainly feel a lot more sold on this interminable pregnancy than you did a couple of months ago.", "passive");
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
						AddLogEvent("You now walk with a rounded gait in order to support the soccer ball you’re toting out in front of you, and you feel very nervy about attempting to run." + (kGAMECLASS.pc.biggestTitSize() > 1 ? " " + (!kGAMECLASS.pc.isLactating() ? "Your [pc.breasts] are also starting to leak [pc.milk] at the most inopportune of moments" : "Your [pc.breasts] are also starting to swell with even more [pc.milk] than usual") : "") + ", your body stepping up its anticipation of providing for your growing child. You start slightly as something boops against the taut skin of your stomach from within.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.5, true);
						if(kGAMECLASS.pc.milkMultiplier < 50) kGAMECLASS.pc.milkMultiplier = 50;
						if(kGAMECLASS.pc.milkFullness < 50) kGAMECLASS.pc.milkFullness = 50;
						kGAMECLASS.pc.milkFullness += 15;
						// Insert Reflex reduction modifier
						if(kGAMECLASS.pc.hasStatusEffect("Sera Spawn Reflex Mod")) kGAMECLASS.pc.addStatusValue("Sera Spawn Reflex Mod", 1, 5);
						else kGAMECLASS.pc.createStatusEffect("Sera Spawn Reflex Mod", 5, 0, 0, 0, true, "", "", false, 0);
					}, true);
				}
				// 200-210 days
				else if(i == 205)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Oof. You have to stop for a moment to catch your breath and give your back a break. Your belly is now medicine ball shaped, dominating your shape and your movements" + (kGAMECLASS.pc.biggestTitSize() > 1 && kGAMECLASS.pc.isLactating() ? ", your milk-swollen breasts rested on top of it" : "") + ". Your offspring is obviously intent on being a drummer, or possibly a tennis player, going off how much they’re enjoying thumping against the inside of your womb.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.5, true);
						if (kGAMECLASS.pc.milkFullness < 10) kGAMECLASS.pc.milkFullness += 15;
						// Increase Reflex modifier
						if(kGAMECLASS.pc.hasStatusEffect("Sera Spawn Reflex Mod")) kGAMECLASS.pc.addStatusValue("Sera Spawn Reflex Mod", 1, 5);
						else kGAMECLASS.pc.createStatusEffect("Sera Spawn Reflex Mod", 5, 0, 0, 0, true, "", "", false, 0);
					}, true);
				}
				// 240-250 days
				else if(i == 245)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Judging from the size of your swollen belly, you guess that your baby will arrive within the next month. Or perhaps it would be accurate to say you <i>hope</i>. It’s hard to stay active with the unwieldy weight -- you continually fight back urges to lie in bed and do nothing.", "passive");
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
						var sTime:String = "a week";
						var sTime2:String = "day";
						var nTime:Number = Math.floor(10080/kGAMECLASS.pc.pregnancyData[pregSlot].pregnancyIncubationMulti);
						if(nTime <= 1440) { sTime = "a day"; sTime2 = "hour"; }
						if(nTime <= 60) { sTime = "an hour"; sTime2 = "minute"; }
						if(nTime <= 0) { sTime = "a minute"; sTime2 = "second"; }
						AddLogEvent("You really can’t be far off giving birth now - " + sTime + ", at most. Your [pc.vagina " + pregSlot + "] is permanently soft and slightly dilated now, and the kicks inside your distended stomach grow more prominent by the " + sTime2 + "." + (!kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.PUBLIC) ? " The instinct to find somewhere safe to have your child is growing very difficult to ignore." : ""), "passive");
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
		
		public static function seraSpawnSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr, [3.0, 2.0, 1.0]);
		}
		
		public static function seraSpawnOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot];
			
			//If this is the first birth, go at it.
			if (!mother.hasStatusEffect("Sera Spawn Pregnancy Ends"))
			{
				// Baby count check (just in case)
				var babies:int = mother.pregnancyData[pregSlot].pregnancyQuantity;
				var belly:int = mother.pregnancyData[pregSlot].pregnancyBellyRatingContribution;
				
				// Generate babies
				var babyList:Array = (new SeraSpawnPregnancyHandler()).seraSpawnChildren(mother, babies);
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
				
				mother.createStatusEffect("Sera Spawn Pregnancy Ends", babies, belly, pregSlot, babyGender, true);
				kGAMECLASS.eventQueue.push(kGAMECLASS.seraSpawnPregnancyEnds);
				SeraSpawnPregnancyHandler.seraSpawnCleanupData(mother, pregSlot, thisPtr);
			}
			//Delay subsequent births till the first has had time to go off.
			else mother.pregnancyData[pregSlot].pregnancyIncubation += 24;
		}
		public static function seraSpawnCleanupData(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/sera kids", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBornTimestamp:uint):Child
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			var babyList:Array = seraSpawnChildren(mother, pData.pregnancyQuantity);
			var i:int = 0;
			for(i = 0; i < babyList.length; i++)
			{
				babyList[i].BornTimestamp = useBornTimestamp;
				ChildManager.addChild(babyList[i]);
			}
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/sera kids", pData.pregnancyQuantity);
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
		
		private function seraSpawnChildren(mother:Creature, numKids:int = 0):Array
		{
			var babyList:Array = [];
			
			var traitChar:Creature = mother;
			if(mother is PlayerCharacter) traitChar = kGAMECLASS.chars["PC_BABY"];
			
			for(var i:int = 0; i < numKids; i++)
			{
				var c:UniqueChild = new SeraUniqueChild();
				
				c.RaceType = pregnancyChildRace;
				// 50% Male or Female
				if(rand(2) == 0) { c.NumMale = 1; c.NumFemale = 0; c.NumIntersex = 0; c.NumNeuter = 0; }
				else { c.NumMale = 0; c.NumFemale = 1; c.NumIntersex = 0; c.NumNeuter = 0; }
				
				// Race modifier (if different races)
				c.originalRace = c.hybridizeRace(mother.originalRace, c.originalRace, (mother is PlayerCharacter));
				
				// Adopt mother's colors at random (if applicable):
				if(rand(2) == 0) c.skinTone = traitChar.skinTone;
				if(rand(2) == 0) c.lipColor = traitChar.lipColor;
				if(rand(2) == 0) c.nippleColor = traitChar.nippleColor;
				if(rand(2) == 0) c.eyeColor = traitChar.eyeColor;
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

