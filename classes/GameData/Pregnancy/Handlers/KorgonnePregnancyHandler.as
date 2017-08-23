//korgonne pregnancy (target 1000 wds):
//korg men are more fertile than average (either through virility or volume, you pick) because their female’s breeding window is smaller
//reminder: PC has /much/ lower odds of falling pregnant from vaginal sex if the korg slips out because the chosen pussy is loose
//baseline 7-month or 210-day gestation (longer post-birth development period allows shorter gestation)
	//Written by Zeikfried, coded by Fenoxo

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
	import classes.Engine.Map.InPublicSpace;
	
	/**
	 * ...
	 * @author Fenoxo, based on Gedan's originals.
	 */
	public class KorgonnePregnancyHandler extends BasePregnancyHandler
	{
		public function KorgonnePregnancyHandler() 
		{
			_debugTrace = false;
			_handlesType = "KorgonnePregnancy";
			_basePregnancyIncubationTime = 60 * 24 * 210; // 210 days!
			_basePregnancyChance = 0.1;
			_alwaysImpregnate = false;
			_ignoreInfertility = false;
			_ignoreFatherInfertility = false;
			_ignoreMotherInfertility = false;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = false;
			_canImpregnateVagina = true;
			_canFertilizeEggs = true;
			_pregnancyQuantityMinimum = 1;
			_pregnancyQuantityMaximum = 1;
			_definedAverageLoadSize = 4800;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_LIVE;
			_pregnancyChildRace = GLOBAL.TYPE_KORGONNE;
			_childMaturationMultiplier = 1.0;
			
			_onSuccessfulImpregnation = korgonneSuccessfulImpregnation;
			_onDurationEnd = korgonneOnDurationEnd;
			

			//korgonne gestation stages (with base timing for reference)
			//one - feeling ill - @30 days
			addStageProgression(_basePregnancyIncubationTime - (30 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent(ParseText("Your stomach turns suddenly, sending you into a panic of nausea. You lean over, feeling as if you could vomit, but hold it in. That was abrupt."), "passive");
			}, true);
			//two - suspiciously long stomach flu - @45 days
			addStageProgression(_basePregnancyIncubationTime - (45 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent(ParseText("Your occasional nausea returns, this time stronger. It can’t be something you ate... it’s been too persistent. You check your Codex for a reading and confirm your suspicion: <b>pregnant</b>."), "passive");
				kGAMECLASS.pc.bellyRatingMod += 5;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 5;
			}, true);
			//three - bad sickness, tiny gut - @75 days
			addStageProgression(_basePregnancyIncubationTime - (75 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent(ParseText("The nausea that’s been plaguing you is persistent every morning now, like a background hum. Your [pc.belly] is even more rounded."), "passive");
				kGAMECLASS.pc.bellyRatingMod += 15;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 15;
			}, true);
			//four - start to show - @100 days
			addStageProgression(_basePregnancyIncubationTime - (100 * 24 * 60), function(pregSlot:int):void {
				var textBuff:String = "Your pregnancy has progressed to the point that people who bother to look are starting to notice - your waistband is expanding further every day."
				AddLogEvent(ParseText(textBuff), "passive");
				kGAMECLASS.pc.bellyRatingMod += 10;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 10;
			}, true);
			//five - getting jolly round - lactation begins - @130 days
			addStageProgression(_basePregnancyIncubationTime - (130 * 24 * 60), function(pregSlot:int):void {
				var textBuff:String = "Your [pc.belly] is starting to become cumbersome, pushing the straps of your gear out of place. It’s a bit early for it to be this far progressed... your baby is probably not a human child. You examine your Codex for another scan: it’s a hybrid of human and korgonne, the dog-like natives of Uveto VII.";
				if(!kGAMECLASS.pc.canLactate()) 
				{
					textBuff += " Your [pc.breasts] are also beginning to swell and dribble milk, preparing to nurse the new lives. <b>You are lactating!</b>";
					if(kGAMECLASS.pc.milkMultiplier < 100) kGAMECLASS.pc.milkMultiplier = 100;
					kGAMECLASS.pc.milkFullness += 20;
				}
				AddLogEvent(ParseText(textBuff), "passive");
				kGAMECLASS.pc.bellyRatingMod += 10;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 10;
			}, true);
			//six - really out there - minor rfx penalty? - @160 days
			addStageProgression(_basePregnancyIncubationTime - (130 * 24 * 60), function(pregSlot:int):void {
				var textBuff:String = "It’s hard to move quickly with how swollen you are; your [pc.belly] seems to get in the way of everything. Still, you can get by with a bit of extra effort, and the accelerated pace of this baby suggests that you won’t have to endure much longer.";
				AddLogEvent(ParseText(textBuff), "passive");
				kGAMECLASS.pc.bellyRatingMod += 10;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 10;
			}, true);
			//seven - hard to move - rfx penalty increases? - @180 days
			addStageProgression(_basePregnancyIncubationTime - (180 * 24 * 60), function(pregSlot:int):void {
				var textBuff:String = "The bulge in your belly is a perfect egg-shape, reducing your quickest trots and sexiest sashays to pregnant waddles. Still, your hormones are running high, your skin is glowing";
				if(InPublicSpace()) 
				{
					textBuff += ", and judging by the prurient glances you get when people think you’re not watching, you’re still <i>somebody’s</i> fetish";
					kGAMECLASS.pc.lust(5);
				}
				textBuff += ".";
				AddLogEvent(ParseText(textBuff), "passive");
				kGAMECLASS.pc.bellyRatingMod += 5;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 5;
			}, true);
			//eight - any day now - @200 days
			addStageProgression(_basePregnancyIncubationTime - (180 * 24 * 60), function(pregSlot:int):void {
				var textBuff:String = "Your ";
				if(kGAMECLASS.pc.canLactate()) 
				{
					textBuff += "nipples leak milk ";
					if(!kGAMECLASS.pc.isChestExposed()) textBuff += "into your [pc.chestCover] ";
					textBuff += "constantly and your ";
				}
				textBuff += "[pc.belly] is further stretched than the pregnancy handbooks say possible. If you get any more swollen, you’re not going to be able to move. When will the baby come?";
				AddLogEvent(ParseText(textBuff), "passive");
				kGAMECLASS.pc.bellyRatingMod += 10;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 10;
			}, true);
		}
		
		public static function korgonneSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			// Always start with the minimum amount of children.
			var quantity:int = thisPtr.pregnancyQuantityMinimum;
			
			pData.pregnancyQuantity = quantity;
		}
		
		public static function korgonneOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			// Closures.
			var tEventCall:Function = (function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
			{
				var c:Child = Child.NewChildWeights(thisPtr.pregnancyChildRace, thisPtr.childMaturationMultiplier, pData.pregnancyQuantity, thisPtr.childGenderWeights);
				ChildManager.addChild(c);
				return function():void
				{
					kGAMECLASS.korgonneBabyBirthing(c_pregSlot,c);
					korgonneCleanupData(c_mother, c_pregSlot, c_thisPtr);
				}
			})(mother, pregSlot, thisPtr);
			
			kGAMECLASS.eventQueue.push(tEventCall);
		}
		public static function korgonneCleanupData(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;

			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/korgonne births", pData.pregnancyQuantity);
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
			
			StatTracking.track("pregnancy/korgonne births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
			
			return c;
		}
	}

}