package classes.GameData.Pregnancy.Handlers
{
	import classes.Characters.PregnancyPlaceholder;
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.GameData.Pregnancy.Child;
	import classes.GameData.Pregnancy.UniqueChild;
	import classes.GameData.StatTracking;
	import classes.GameData.ChildManager;
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.PregnancyData;
	import classes.StorageClass;
	import classes.kGAMECLASS;
	import classes.GLOBAL;
	import classes.Engine.Interfaces.ParseText;
	import classes.Engine.Utility.indefiniteArticle;
	import classes.Engine.Utility.IncrementFlag;
	import classes.Engine.Interfaces.AddLogEvent;
	
	
	public class FrostwyrmPregnancy extends BasePregnancyHandler
	{
		public function FrostwyrmPregnancy()
		{
			_handlesType = "FrostwyrmPregnancy";
			_basePregnancyIncubationTime = 4 * 4 * 7 * 24 * 60; //4 months
			_basePregnancyChance = 1;
			_alwaysImpregnate = true;
			_ignoreInfertility = true;
			_ignoreMotherInfertility = true;
			_ignoreFatherInfertility = true;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = false;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 1;
			_pregnancyQuantityMaximum = 1;
			_definedAverageLoadSize = 4800;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_EGGS;
			_pregnancyChildRace = GLOBAL.TYPE_FROSTWYRM;
			_childGenderWeights.Male = 0;
			_childGenderWeights.Female = 1;
			_childMaturationMultiplier = 1;
			
			_onSuccessfulImpregnation = FrostwyrmSuccessfulImpregnation;
			_onDurationEnd = FrostwyrmOnDurationEnd;
			
			addStageProgression(_basePregnancyIncubationTime - (5 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent(ParseText("Your movements have slowly begun to feel... sluggish. Like your body weighs a little more than it should. You’ve also been craving foods that are high in protein lately, and you’ve been drinking a lot more water than usual recently. \n\nYou consider the possibility that maybe you’re just craving foods and you’re more dehydrated than you realize, but you know that, so soon from your coupling with [frostwyrm.name], it’s better to assume that you’re good and pregnant. Still, no need to panic yet; just keep doing what you’re doing. You’ll know for sure in a couple days.") , "passive");
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (10 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (15 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (20 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent(ParseText("Your stomach’s a little more bloated than usual these past few days, and your cravings for certain foods and tons of water haven’t stopped. When you press into your belly, the [pc.skinFurScales] feel a lot tougher and firmer than you believe should be right.\n\nNo point in beating around the bush: <b>you’re probably pregnant with the Frostwyrm’s kip.</b> You have no idea what to expect going forward; maybe you should take it a little more cautiously. No doubt a Frostwyrm child is hardier than " + indefiniteArticle(kGAMECLASS.pc.race()) + " baby, but that doesn’t give you an excuse to go wild. You’re eating for two, now."), "passive");
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (25 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (30 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (35 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (40 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (45 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (50 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent(ParseText("Lately you’ve been feeling a little... different. Not in a bad way, exactly, but not always in a good way either. Your mood sometimes swings pretty wildly, from joyful and expressive, to angry and borderline destructive, to horny and lustful, to everything in between. But the words for those emotions don’t really do them justice; what you <i>truly</i> feel is much more... primeval. Raw. Unfocused.\n\nYou knew to expect mood swings with pregnancies, but this is still different. Sometimes, you don’t feel like you’re completely in control of yourself or your feelings. You suppose it must be because of your little passenger; [frostwyrm.name] told you that it already had psionic powers, and that they were growing exponentially every day.\n\nAs if your growing paunch wasn’t bad enough, your kip is commandeering your own emotions, too. Your boobs also aren’t getting any larger, and you don’t feel like you’re about to start lactating, so you don’t even get the fun stuff out of this pregnancy. It’s only been fifty days; you still have seventy more, thereabouts, until this thing is out of you."), "passive");
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
			addStageProgression(_basePregnancyIncubationTime - (75 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (80 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (82 * 24 * 60), function(pregSlot:int):void {
				AddLogEvent("You’ve been hearing sounds in your head these past few days. While the sounds aren’t voices, they sometimes form together to make what sounds like baby-talk. The sounds are constant and melodic, ranging from a number of pitches and rhythm with no pauses in between. Your kip is already trying to communicate, but it’s still too young and simple to make more than just tunes in your head.\n\nUsually, the sounds are calm and soothing, when you’re not being physically exerted, but they nonetheless unnerve you when you expect total silence, and they also keep you up at night. You have no way to shut the sounds out, so you’re just going to have to put up with it for now. Just thirty more days....", "passive");
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (85 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (90 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (95 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (100 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (105 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
			addStageProgression(_basePregnancyIncubationTime - (110 * 24 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
			}, true);
		}
		
		public static function FrostwyrmSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			var quantity:int = thisPtr.pregnancyQuantityMinimum;
			pData.pregnancyQuantity = quantity;
			pData.pregnancyIncubationMulti = 1;
		}
		
		public static function FrostwyrmOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			var numKids:int = pData.pregnancyQuantity;
			
			if(mother.hasStatusEffect("Frostwyrm Pregnancy Ends"))
			{
				mother.pregnancyData[pregSlot].pregnancyIncubation += 24;
				return;
			}
			
			mother.createStatusEffect("Frostwyrm Pregnancy Ends", pregSlot, numKids, 0, 0, true);
			
			var tEventCall:Function = (function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
			{
				return function():void
				{
					kGAMECLASS.frostwyrmPregnancyEnds(c_pregSlot, numKids);
					frostwyrmCleanupPregnancy(c_mother, pregSlot, c_thisPtr);
				}
			})(mother, pregSlot, thisPtr);
			
			kGAMECLASS.eventQueue.push(tEventCall);
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBornTimestamp:uint):Child
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			IncrementFlag("FROSTWYRM_EGGS");
			StatTracking.track("pregnancy/frostwyrm eggs laid", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			
			pData.reset();
			
			return null;
		}
		
		public static function frostwyrmCleanupPregnancy(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			IncrementFlag("FROSTWYRM_EGGS");
			StatTracking.track("pregnancy/frostwyrm eggs laid", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			
			pData.reset();
		}
	}
	
	
}