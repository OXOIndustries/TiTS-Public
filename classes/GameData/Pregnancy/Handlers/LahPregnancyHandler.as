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
	import classes.Engine.Utility.shortMinutes;
	import classes.Engine.Interfaces.ParseText;
	import classes.GameData.ChildManager;
	import classes.GameData.Pregnancy.Child;
	import classes.GameData.Pregnancy.UniqueChild;
	import classes.GameData.Pregnancy.Templates.LahUniqueChild;
	import classes.Engine.Interfaces.AddLogEvent;
	import classes.Engine.Map.InPublicSpace;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class LahPregnancyHandler extends BasePregnancyHandler
	{
		public function LahPregnancyHandler() 
		{
			_debugTrace = false;
			_handlesType = "LahPregnancy";
			_basePregnancyIncubationTime = 60 * 24 * 180; // Taken codex at its word: 6 month pregnancy w/ outcome twins
			_basePregnancyChance = 0.1;
			_alwaysImpregnate = false;
			_ignoreInfertility = false;
			_ignoreFatherInfertility = false;
			_ignoreMotherInfertility = false;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = false;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 2;
			_pregnancyQuantityMaximum = 2;
			_definedAverageLoadSize = 2400;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_LIVE;
			_pregnancyChildRace = GLOBAL.TYPE_CANINE;
			_childMaturationMultiplier = 1.0;
			
			_onSuccessfulImpregnation = lahSuccessfulImpregnation;
			_onDurationEnd = lahOnDurationEnd;
			
			// Literal Breeding Bitch Texts
			
			addStageProgression(_basePregnancyIncubationTime - (5 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 0.25, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (10 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 0.25, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (15 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 0.25, true);
			}, true);
			// 18-25 days
			addStageProgression(_basePregnancyIncubationTime - (20 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent("You feel slightly queasy and bloated, as if you’ve eaten too much recently. You stop and rest for a little while, waiting for the feeling to pass, which eventually it does.","passive");
				
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 0.25, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (25 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 0.5, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (30 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 0.5, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (35 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (40 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			// 40-50 days
			addStageProgression(_basePregnancyIncubationTime - (45 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent("You feel unaccountably prickly, ready to snap and get angry at the most innocuous of " + (InPublicSpace() ? "comments" : "changes in the environment around you") + ". You blame your gut, which remains unsettled and bloated.","passive");
				
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (50 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (55 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (60 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (65 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (70 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			// 70-80 days
			addStageProgression(_basePregnancyIncubationTime - (75 * 24 * 60), function(pregSlot:int):void {
				var m:String = "";
				m += "You’re pregnant. You’d know it even if your tummy hadn’t been getting progressively rounder, sticking noticeably out now above your waist. There’s just that instinctive knowledge, your body changing its rhythms to support what’s growing within you.";
				if(StatTracking.getStat("pregnancy/lah kids") + StatTracking.getStat("pregnancy/ausar births") <= 0) m += " What might it be? Something faster than a human gestation, it seems, but not by much. Fascinating.";
				else m += " You’ve been through this before, and know by bringing up your codex and checking a few dates what it must be: Another ausar pregnancy. Wonderful. What could be better than bearing a couple more cute puppies? A bright smile spreads across your face at the thought.";
				
				AddLogEvent(m,"passive");
				
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (80 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (85 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (90 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			// 90-100 days
			addStageProgression(_basePregnancyIncubationTime - (95 * 24 * 60), function(pregSlot:int):void {
				var nTime:Number = Math.floor(129600/kGAMECLASS.pc.pregnancyData[pregSlot].pregnancyIncubationMulti);
				AddLogEvent(ParseText("Your stomach continues to swell outwards, damping your body in a swelter of soft warmth and low-level horniness. Sometimes you think you can even see it happening, " + (nTime > 5760 ? "day by day" : "moment by moment") + " - these babies are not messing around. The areola of your [pc.nipples] have also spread a bit, and your [pc.chest] in general feels sensitive and pleasant to touch."), "passive");
				
				kGAMECLASS.pc.lust(5);
				kGAMECLASS.pc.nippleWidthRatio += 1.0;
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.25, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (100 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.25, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (105 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.25, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (110 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.25, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (115 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.25, true);
			}, true);
			// 115-125 days
			addStageProgression(_basePregnancyIncubationTime - (120 * 24 * 60), function(pregSlot:int):void {
				var m:String = "";
				m += "You now walk with a rounded gait in order to support the soccer ball you’re toting out in front of you, and you feel very nervy about attempting to run.";
				if(kGAMECLASS.pc.hasBreasts())
				{
					m += ParseText(" Your [pc.breasts] are also starting to");
					if(!kGAMECLASS.pc.isLactating()) m += ParseText(" leak [pc.milk] at the most inopportune of moments");
					else m += ParseText(" swell with even more [pc.milk] than usual");
					m += ", your body stepping up its lactation to provide for what’s growing inside you.";
					
					if(kGAMECLASS.pc.milkFullness < 100) kGAMECLASS.pc.milkFullness = 100;
					if(kGAMECLASS.pc.milkMultiplier < 50) kGAMECLASS.pc.milkMultiplier += 50;
					else kGAMECLASS.pc.milkMultiplier += 5;
				}
				m += " You start slightly as something boops against the taut skin of your stomach from within.";
				
				AddLogEvent(m, "passive");
				
				// Insert Reflex reduction modifier
				if(kGAMECLASS.pc.hasStatusEffect("Lah Pregnancy Reflex Mod")) kGAMECLASS.pc.addStatusValue("Lah Pregnancy Reflex Mod", 1, 5);
				else kGAMECLASS.pc.createStatusEffect("Lah Pregnancy Reflex Mod", 5, 0, 0, 0, true, "", "", false, 0);
				
				kGAMECLASS.pc.lust(5);
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.25, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (125 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.25, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (130 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.25, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (135 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.25, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (140 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.25, true);
			}, true);
			// 140-150 days
			addStageProgression(_basePregnancyIncubationTime - (145 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent("You pause for breath, hand on your heavily swollen tummy. It feels hot in there, more than anything, a beach ball-shaped foundry, and there isn’t the wriggling around you might expect - just a building energy, a growing anticipation. The hormones you’re simmering in rise up into your mind, and in spare moments you find yourself absently dreaming of hearths, rugs, tubs; anything you might curl yourself up on and sleep, dream of a belly full of life.", "passive");
				
				// Increase Reflex modifier
				if(kGAMECLASS.pc.hasStatusEffect("Lah Pregnancy Reflex Mod")) kGAMECLASS.pc.addStatusValue("Lah Pregnancy Reflex Mod", 1, 5);
				else kGAMECLASS.pc.createStatusEffect("Lah Pregnancy Reflex Mod", 5, 0, 0, 0, true, "", "", false, 0);
				
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.25, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (150 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.5, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (155 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.5, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (160 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.5, true);
			}, true);
			// 160-170 days
			addStageProgression(_basePregnancyIncubationTime - (165 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent("It has to be twins, at least. Nothing else could account for the size of your swollen belly. It’s difficult to stay active, tied to such an unwieldy weight -- you’re made constantly aware of it whenever you pass through a doorway, or have to squeeze by something.", "passive");
				
				kGAMECLASS.pc.lust(5);
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.5, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (170 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.25, true);
			}, true);
			// 174-176 days
			addStageProgression(_basePregnancyIncubationTime - (175 * 24 * 60), function(pregSlot:int):void {
				var nTime:Number = Math.floor(7200/kGAMECLASS.pc.pregnancyData[pregSlot].pregnancyIncubationMulti);
				var m:String = "";
				m += "You really can’t be far off giving birth now - " + shortMinutes(nTime, true, true) + ", at most. Your [pc.vagina " + pregSlot + "] is permanently soft and slightly dilated now, and the kicks inside your distended stomach grow more prominent by the day.";
				if(!InPublicSpace()) m += " The instinct to find a dark, safe den to have your children in is growing very difficult to ignore.";
				
				AddLogEvent(m, "passive");
				
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			// 179-184 days (sprogs = dropped)
		}
		
		public static function lahSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			
			// Always gib twins to reduce arse-ache here
			var pData:PregnancyData = (mother.pregnancyData[pregSlot] as PregnancyData);
			var quantity:int = thisPtr.pregnancyQuantityMinimum;
			pData.pregnancyQuantity = quantity;
		}
		
		public static function lahOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = (mother.pregnancyData[pregSlot] as PregnancyData);
			
			//If this is the first birth, go at it.
			if (!mother.hasStatusEffect("Lah Pregnancy Ends") && !kGAMECLASS.disableExploreEvents())
			{
				// Baby count check (just in case)
				var babies:int = mother.pregnancyData[pregSlot].pregnancyQuantity;
				var belly:int = mother.pregnancyData[pregSlot].pregnancyBellyRatingContribution;
				
				mother.createStatusEffect("Lah Pregnancy Ends", babies, belly, pregSlot, 0, true);
				
				var tEventCall:Function = (function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
				{
					// Generate babies
					var babyList:Array = (new LahPregnancyHandler()).lahChildren(mother, babies);
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
					
					return function():void
					{
						kGAMECLASS.lahPregnancyEnds(babyList);
						lahCleanupData(c_mother, c_pregSlot);
					}
				})(mother, pregSlot, thisPtr);
				
				kGAMECLASS.eventQueue.push(tEventCall);
			}
			//Delay subsequent births till the first has had time to go off.
			else mother.pregnancyData[pregSlot].pregnancyIncubation += 24;
		}
		public static function lahCleanupData(mother:Creature, pregSlot:int):void
		{
			var pData:PregnancyData = (mother.pregnancyData[pregSlot] as PregnancyData);
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			if(kGAMECLASS.flags["LAH_TOTAL_KIDS"] == undefined) kGAMECLASS.flags["LAH_TOTAL_KIDS"] = 0;
			kGAMECLASS.flags["LAH_TOTAL_KIDS"] += pData.pregnancyQuantity;
			
			StatTracking.track("pregnancy/lah kids", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBornTimestamp:uint):Child
		{
			var pData:PregnancyData = (mother.pregnancyData[pregSlot] as PregnancyData);
			
			var babyList:Array = lahChildren(mother, pData.pregnancyQuantity);
			var i:int = 0;
			for(i = 0; i < babyList.length; i++)
			{
				babyList[i].BornTimestamp = useBornTimestamp;
				ChildManager.addChild(babyList[i]);
			}
			
			lahCleanupData(mother, pregSlot);
			
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
		
		private function lahChildren(mother:Creature, numKids:int = 0):Array
		{
			var babyList:Array = [];
			
			var traitChar:Creature = mother;
			if(mother is PlayerCharacter) traitChar = kGAMECLASS.chars["PC_BABY"];
			
			for(var i:int = 0; i < numKids; i++)
			{
				var c:UniqueChild = new LahUniqueChild();
				
				c.RaceType = pregnancyChildRace;
				c.NumMale = 0;
				c.NumFemale = 0;
				c.NumIntersex = 0;
				c.NumNeuter = 0;
				
				// 50% Male or Female
				if(rand(2) == 0) c.NumMale += 1;
				else c.NumFemale += 1;
				
				// Race modifier (if different races)
				c.originalRace = c.hybridizeRace(mother.originalRace, c.originalRace, (mother is PlayerCharacter));
				
				// 75% likelihood Lah’s colouration, 25% random other
				// Adopt mother's colors where possible:
				c.eyeColor = traitChar.eyeColor;
				c.hairColor = traitChar.hairColor;
				//c.lipColor = traitChar.lipColor;
				//c.nippleColor = traitChar.nippleColor;
				if(rand(4) == 0)
				{
					switch(rand(3))
					{
						case 0:
							c.skinTone = "dark";
							c.furColor = "black";
							break;
						case 1:
							c.skinTone = "pale";
							c.furColor = "white";
							break;
						case 2:
							c.skinTone = "peach";
							c.furColor = "piebald";
							break;
					}
				}
				//c.scaleColor = traitChar.scaleColor;
				//c.chitinColor = traitChar.scaleColor;
				//c.featherColor = traitChar.furColor;
				
				c.MaturationRate = childMaturationMultiplier;
				c.BornTimestamp = kGAMECLASS.GetGameTimestamp();
				
				babyList.push(c);
			}
			
			return babyList;
		}
	}

}