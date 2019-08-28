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
	import classes.GameData.Pregnancy.Templates.MirrinUniqueChild;
	import classes.Engine.Interfaces.AddLogEvent;
	import classes.Engine.Map.InRoomWithFlag;

	public class MirrinPregnancyHandler extends BasePregnancyHandler
	{
		public function MirrinPregnancyHandler() 
		{
			_debugTrace = false;
			_handlesType = "MirrinPregnancy";
			_basePregnancyIncubationTime = 23 * 7 * 24 * 60; // 23 weeks
			_basePregnancyChance = 0.1;
			_alwaysImpregnate = true;
			_ignoreInfertility = false;
			_ignoreFatherInfertility = false;
			_ignoreMotherInfertility = false;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = false;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 1;
			_pregnancyQuantityMaximum = 1;
			_definedAverageLoadSize = 1000;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_LIVE;
			_pregnancyChildRace = GLOBAL.TYPE_GRYVAIN;
			_childMaturationMultiplier = 1.0;
			
			_onSuccessfulImpregnation = mirrinSuccessfulImpregnation;
			_onDurationEnd = mirrinOnDurationEnd;
			
			addStageProgression(_basePregnancyIncubationTime - (20 * 24 * 60), function():void {
				var logText:String = "Your moods and emotions have grown irregular, things feel a little bit floatier than normal. Sometimes you’ll be going about your business and feel unusually angry, aroused or even distressed from a thought or incident. Hormones, right...?";
				if (StatTracking.getStat("pregnancy/total births") > 0) logText += " Doesn’t feel quite as normal as you’ve experienced with pregnancy before... things seem ‘hotter’ on the inside. Nothing you can’t handle though.";
				logText += "\n\nThere’s a nagging need that plays with your thoughts intermittently: " + (kGAMECLASS.silly ? "<i>where does the poop go...</i>" : "<i>ice cream...</i>");

				AddLogEvent(ParseText(logText), "passive");
			});
			
			addStageProgression(_basePregnancyIncubationTime - (40 * 24 * 60), function():void {
				AddLogEvent(ParseText("You find yourself smiling at odd things at odd times, usually to the bemusement of those around you. Often it comes with a very nice change in mood, another reason to pat and caress your [pc.belly]. There’s no sign of a bump yet but you definitely feel a little bit sluggish when getting yourself up from something.\n\nPlus, you’re feeling just a tad more sensitive than usual, a little more susceptible to feeling naturally horny..."), "passive");
				kGAMECLASS.pc.createStatusEffect("MirrinPregStage",1);
			});
			
			addStageProgression(_basePregnancyIncubationTime - (60 * 24 * 60), function(pregSlot:int):void {
				var logText:String = "Your midriff is now bulging about three inches";
				if (kGAMECLASS.pc.bellyRating() >= 10) logText += " further";
				logText += " forward, the vaguely ovoid shape now making a visible impact to your [pc.belly].";
				if (kGAMECLASS.pc.tone >= 75) logText += " Your abs have even gained a bit of softness, looking less solid.";
				logText += " Touching your belly feels rewarding, and you’ve half the mind to sing to your little passenger. You think they’d like that, appreciating singing. He or she? Oh who cares right now, you’d love either!"

				AddLogEvent(ParseText(logText), "passive");
				kGAMECLASS.pc.bellyRatingMod += 5;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 5;
			}, true);
			
			addStageProgression(_basePregnancyIncubationTime - (80 * 24 * 60), function(pregSlot:int):void {
				var logText:String = "That baby bulge has become more of a natural baby bump, the egg-shape of your abdomen protruding a little tiny bit every week. You can’t quite get over the effect it has on the rest of you though: restless nights, difficulty getting comfy, the urge to vomit in the morning...";
				if (kGAMECLASS.pc.willpower() >= 35) logText += " luckily, you’ve enough nerves of " + (kGAMECLASS.silly ? "Steele, LOL" : "steel") + " to prevent the worst of it through sheer mental power.";
				logText += "\n\nStill, you can’t help but feel happy during the interim periods. You’ve certainly gained more of an appetite, the feel and taste of food having never felt more real. Almost arousingly so...";

				kGAMECLASS.pc.addStatusValue("MirrinPregStage",1,1);
				AddLogEvent(ParseText(logText), "passive");
				kGAMECLASS.pc.bellyRatingMod += 10;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 10;
			}, true);
			
			addStageProgression(_basePregnancyIncubationTime - (100 * 24 * 60), function(pregSlot:int):void {
				var logText:String = "Mmm, you can’t help but stop and just rub. Rub, rub, rub. Your [pc.belly] feels eternally warm, eternally comforted and drenched in a haze of hormones. It now juts about 6 inches forward, the [pc.skinFurScales] of your [pc.belly] adapting " + (kGAMECLASS.pc.tone >= 75 ? "with a little resistance" : "well") + " to the new life within you. The healthy ‘glow’ you’ve been developing makes your [pc.skinFurScales] mildly flushed and tender, sometimes making you lost in curiosity when you stroke your neck or rub your [pc.chest]. Oo, that feels nice...";
				logText += "\n\nOo, a little too nice...?";
				if (kGAMECLASS.pc.isLactating()) logText += "\n\nYour [pc.breasts] feel fuller than usual, [pc.milk] now pooling in ever greater amounts. Your milky chest is already prepared for babies!";
				else if (kGAMECLASS.pc.hasBreasts()) logText += "\n\nYour [pc.breasts] feel heavy and pliant, brimming with [pc.milk]. You squeeze a [pc.nipple] to test and a small spurt of [pc.milkColor] dribbles out. <b>You’re now lactating!</b>";
				else logText += "\n\nYour [pc.chest] feels kinda tender, almost sensitive. You’re pretty sure that if you had proper breasts, you’d be lactating.";
				logText += "\n\nOn top of that, your [pc.nipples] are now irritatingly sensitive. Anything other than a pair of deft hands now making you lust for a loving dragon’s touch...";

				kGAMECLASS.pc.energy(-kGAMECLASS.pc.energyMax());
				AddLogEvent(ParseText(logText), "passive");
				kGAMECLASS.pc.bellyRatingMod += 15;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 15;
			}, true);
			
			addStageProgression(_basePregnancyIncubationTime - (120 * 24 * 60), function(pregSlot:int):void {
				var logText:String = "That bump of yours is getting pretty big! You’d give an estimate at 8 inches and you’re pretty certain that you’ve felt something moving around inside. Not much but enough to make your inner mother jump around like a rabbit on a caffeine drip.";
				logText += "\n\nYou still feel the same as you have done since this whole pregnancy began but a little more spontaneous, hungry... and maybe just a bit more horny.";

				kGAMECLASS.pc.lust(30);
				AddLogEvent(ParseText(logText), "passive");
				kGAMECLASS.pc.bellyRatingMod += 10;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 10;
			}, true);
			
			addStageProgression(_basePregnancyIncubationTime - (140 * 24 * 60), function(pregSlot:int):void {
				var logText:String = "Your belly has grown pretty exponential in size over the last few weeks, now gravid and bulbous. Moving around is a bit of a challenge and you find yourself gaining extra mass and tissue as your body prepares. Damn hunger pains...! You’ve definitely felt the urge to gorge on five course meal on more than several occasions; the only thing stopping you is the voice of reason.";
				logText += "\n\nHowever, you can’t help but still feel happy about the situation: just look at it! So full of life. Little Torri...";
				if (kGAMECLASS.flags["MIRRIN_PREGSTAGE"] != 10) logText += " or is it Einar? What if it’s another girl...? It all seems up in the air.";
				logText += "\n\nThat being said, you could really murder a primitive furry lifeform for its edible biomass right about now...";

				kGAMECLASS.pc.energy(-kGAMECLASS.pc.energyMax());
				AddLogEvent(ParseText(logText), "passive");
				kGAMECLASS.pc.bellyRatingMod += 10;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 10;
			}, true);
		}
		
		public static function mirrinSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
		}
		
		public static function mirrinOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			//If this is the first birth, go at it.
			if (!kGAMECLASS.disableExploreEvents())// || InRoomWithFlag(GLOBAL.HAZARD))
			{
				ChildManager.addChild((thisPtr as MirrinPregnancyHandler).mirrinChild(mother));
				kGAMECLASS.eventQueue.push(kGAMECLASS.mirrinPregnancyEnds);
				mirrinCleanupData(mother, pregSlot, thisPtr);
			}
			//Delay subsequent births till the first has had time to go off.
			else mother.pregnancyData[pregSlot].pregnancyIncubation += 24;
		}
		public static function mirrinCleanupData(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/mirrin kids", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBornTimestamp:uint):Child
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			var baby:MirrinUniqueChild = mirrinChild(mother);
			baby.BornTimestamp = useBornTimestamp;
			ChildManager.addChild(baby);
			
			mirrinCleanupData(mother, pregSlot, this);

			var cTemp:Child = new Child();
			cTemp.RaceType = baby.RaceType;
			cTemp.MaturationRate = baby.MaturationRate;
			cTemp.BornTimestamp = baby.BornTimestamp;
			cTemp.NumMale = baby.NumMale;
			cTemp.NumFemale = baby.NumFemale;
			cTemp.NumIntersex = baby.NumIntersex;
			cTemp.NumNeuter = baby.NumNeuter;
			return cTemp;
		}

		// Make a Torri
		private function mirrinChild(mother:Creature):MirrinUniqueChild
		{			
			var traitChar:Creature = mother;
			if(mother is PlayerCharacter) traitChar = kGAMECLASS.chars["PC_BABY"];
			
			var c:MirrinUniqueChild = new MirrinUniqueChild();
			
			c.RaceType = pregnancyChildRace;
			c.MaturationRate = childMaturationMultiplier;
			c.BornTimestamp = kGAMECLASS.GetGameTimestamp();
			c.NumMale = 0;
			c.NumFemale = 1;
			c.NumIntersex = 0;
			c.NumNeuter = 0;
			
			/*
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
			*/
			
			c.Name = "Torri";
			c.skinTone = traitChar.skinTone;
			c.lipColor = "tan";
			c.nippleColor = "tan";
			c.eyeColor = "silver";
			c.hairColor = "onyx";
			c.scaleColor = "onyx";

			return c;
		}
	}

}