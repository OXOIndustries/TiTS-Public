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
	import classes.Engine.Utility.shortMinutes;
	import classes.Engine.Interfaces.ParseText;
	import classes.GameData.ChildManager;
	import classes.GameData.Pregnancy.Child;
	import classes.Engine.Interfaces.AddLogEvent;
	
	/**
	 * ...
	 * @author originally Gedan but then Fenoxo copy/pasted and pooped everywhere.
	 */
	public class ShekkaPregnancyHandler extends BasePregnancyHandler
	{
		public function ShekkaPregnancyHandler() 
		{
			_debugTrace = false;
			_handlesType = "ShekkaPregnancy";
			_basePregnancyIncubationTime = 14 * 24 * 60; // 14 days~
			_basePregnancyChance = 0.2;
			_alwaysImpregnate = false;
			_ignoreInfertility = false;
			_ignoreFatherInfertility = false;
			_ignoreMotherInfertility = false;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = false;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 3;
			_pregnancyQuantityMaximum = 20;
			_definedAverageLoadSize = 60;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_EGGS;
			_pregnancyChildRace = GLOBAL.TYPE_RASKVEL;
			_childMaturationMultiplier = 1.0;
			
			_onSuccessfulImpregnation = shekkaSuccessfulImpregnation;
			_onDurationEnd = shekkaOnDurationEnd;
			
			addStageProgression(_basePregnancyIncubationTime - (4 * 60), function(pregSlot:int):void {
				AddLogEvent(ParseText("A flash of warmness demands you take the time to fan yourself. It passes soon enough, but not before you have a moment to think back on the feeling of creamy rask-cum between your [pc.thighs]."), "passive");
			}, true);
			
			addStageProgression(_basePregnancyIncubationTime - (10 * 60), function(pregSlot:int):void {
				AddLogEvent("You briefly crave butter. Lots and lots of butter, slathered on some mushrooms or something. Maybe some asparagus too.", "passive");
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (20 * 60), function(pregSlot:int):void {
				AddLogEvent("That warm flush is back, and this time, it brought some arousal with it. You’d think getting stuffed with raskvel cum would be enough for you, but nope. Your body apparently wants more.", "passive");
				kGAMECLASS.pc.lust(20);
				kGAMECLASS.pc.libido(1);
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (30 * 60), function(pregSlot:int):void {
				var nTime:Number = Math.floor(18720/kGAMECLASS.pc.pregnancyData[pregSlot].pregnancyIncubationMulti);
				AddLogEvent("You could wave off the occasional strange craving or erotic thought, but so close after unprotected sex? You whip out your Codex for a quick check, and sure enough, <b>you’re pregnant</b>. Apparently you’re going to be incubating some raskvel, though it’s too early for a complete embryo count. The data indicates you’ll be laying some eggs in <b>about " + shortMinutes(nTime, true, true) + "</b>.", "passive");
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (40 * 60), function(pregSlot:int):void {
				if(kGAMECLASS.pc.vaginas[pregSlot].wetness() < 3)
				{
					AddLogEvent(ParseText("You’re feeling a little more moisture between your [pc.thighs] than normal, not just now but over the past hour or so, like <b>you’re just secreting more lubricant than before.</b> Maybe that’ll come in handy come time to lay those eggs the raskvel seem so excited to have."), "passive");
					kGAMECLASS.pc.vaginas[pregSlot].wetness(1);
				}
				//Alright wetted - 10 lust
				else
				{
					AddLogEvent(ParseText("Your gut twinges out of nowhere, but not with pain - with pleasure. Doubling over, you barely suppress a moan as feminine honey surges into your [pc.multiCunts]. The feeling passes blessedly quickly, leaving you with a decidedly slick feeling in your crotch. Do raskvel get like this? Maybe that’s why they’re always in a hurry to breed."),"passive");
					kGAMECLASS.pc.lust(10);
				}
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (45 * 60), function(pregSlot:int):void {
				AddLogEvent("Whenever you aren’t otherwise occupied, your hands keep migrating back to your Codex to fiddle with the settings, tweaking the appearance and app layout for ever-greater efficiency.", "passive");
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (50 * 60), function(pregSlot:int):void {
				var nTime:Number = Math.floor(2880/kGAMECLASS.pc.pregnancyData[pregSlot].pregnancyIncubationMulti);
				AddLogEvent(ParseText("Your [pc.belly] feels a little " + (kGAMECLASS.pc.bellyRating() > 30 ? "more bloated than normal" : "bloated") + ". That alien seed sure takes fast. It’s only been about " + shortMinutes(nTime, true, true) + ", and you’re already starting to show. You look at the pile of protein wrappers in your pack and shrug. Guess you’re eating for two... or six."), "passive");
				kGAMECLASS.pc.bellyRatingMod += 5;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 5;
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (60 * 60), function(pregSlot:int):void {
				AddLogEvent(ParseText("You " + kGAMECLASS.pc.mf("belch","quietly belch") + " and pat your [pc.belly]. It seems to radiate its own inner heat, lighting up the rest of your [pc.skin] with a slightly flushed glow." + (kGAMECLASS.pc.skinType != GLOBAL.SKIN_TYPE_SKIN ? " Too bad most of it is covered by [pc.skinFurScales]." : "")), "passive");
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (80 * 60), function(pregSlot:int):void {
				AddLogEvent(ParseText("A thought occurs to you in your free time: your Codex is a portable wonder. It’s a step above every other tablet computer on the market, and you let it casually dangle from your hip! Perhaps you should guard your technology more carefully."), "passive");
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (100 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.bellyRatingMod += 10;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 10;

				AddLogEvent(ParseText("Oof! Your [pc.belly] is definitely getting bigger. Maybe the eggs are developed enough for your Codex to give you a count? One quick scan has your answers: it can, and there’s " + pData.pregnancyQuantity + "! So much for terran genetics keeping you to single children."), "passive");
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (120 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.lust(10);

				AddLogEvent(ParseText("Your gut clenches, lighting up with pleasure and forcing you to stop what you’re doing to take a seat. Again and again, you feel your womb fluttering around its alien passengers, somehow ecstatic to cradle them for the foreseeable future. It stops after thirty or forty seconds - long enough for you to gain an appreciation for how all those raskvel mothers must feel... as well as some extra moisture down below."), "passive");
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (140 * 60), function(pregSlot:int):void {
				if(kGAMECLASS.pc.vaginas[pregSlot].bonusCapacity < 80)
				{
					kGAMECLASS.pc.vaginas[pregSlot].bonusCapacity += 10;
					AddLogEvent(ParseText("Little tingles in tweaks in your [pc.vaginas] inform you that something is changing down there, perhaps in preparation for the eventual passage of eggs. Nothing looks different, but looks can be deceiving."), "passive");
				}
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (160 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.bellyRatingMod += 8;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 8;

				AddLogEvent(ParseText("Scans show that your raskvel eggs have grown to the size of a terran fist, and looking at your [pc.belly], you can vouch for the expanding size. Just how big are you going to get before you can lay them?"), "passive");
			}, true);
			
			addStageProgression(_basePregnancyIncubationTime - (180 * 60), function(pregSlot:int):void {
				if(kGAMECLASS.pc.libido() < 100)
				{
					kGAMECLASS.pc.libido(2);
					AddLogEvent(ParseText("You find yourself caressing your [pc.belly] more and more in your idle moments, not out of motherly affection but for how the contact makes you feel. The [pc.skin] is nice and sensitive, and the most minute amounts of pressure result in flickers of erotic delight. You could get used to this. Hell, you <i>are</i> getting used to this."), "passive");
				}
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (200 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.bellyRatingMod += 5;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 5;

				AddLogEvent(ParseText("You rest an arm on your [pc.belly] and sigh. These eggs are starting to get sort of heavy."), "passive");
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (220 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.bellyRatingMod += 5;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 5;

				var bufferString:String = "An abrupt shifting in the weight of your belly causes you to orgasm on the spot!";
				if(kGAMECLASS.pc.hasCock())
				{
					if(kGAMECLASS.pc.isCrotchExposed()) bufferString += " [pc.Cum] sprays everywhere!";
					else bufferString += " [pc.Cum] sprays into your [pc.crotchCovers]!";
				}
				bufferString += " You collapse under the weight of your pregnant pleasure and writhe in the ground until it subsides.";
				AddLogEvent(ParseText(bufferString), "passive");
				kGAMECLASS.pc.orgasm();
				kGAMECLASS.pc.slowStatGain("libido",1);
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (240 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.lust(10);
				kGAMECLASS.pc.slowStatGain("libido",1);
				AddLogEvent(ParseText("You have to admit that you’re really having a good time being pregnant with raskvel. There’s not much in the way of discomfort, just lots of low grade arousal."), "passive");
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (260 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.bellyRatingMod += 10;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 10;

				AddLogEvent(ParseText("The eggs in your womb are getting bigger, so much bigger that you’ve grown quite visibly pregnant. You don’t really mind though. You all but glow with the pleasure of motherhood (and the infusion of carnal delights it has infused you with)."), "passive");
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (280 * 60), function(pregSlot:int):void {
				AddLogEvent(ParseText("You could really go for some fungus - the more pungent, the better. Maybe that’s just the eggs, talking."), "passive");
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (300 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.bellyRatingMod += 10;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 10;

				AddLogEvent(ParseText("The [pc.skin] on your [pc.belly] creaks, taut and still stretching as it grows heavier with eggs. You’re looking more and more like a real raskvel momma everyday. Shekka would be so proud."), "passive");
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (315 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.slowStatGain("libido",10);
				kGAMECLASS.pc.lust(20);
				kGAMECLASS.pc.bellyRatingMod += 10;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 10;
				AddLogEvent(ParseText("Toting around a tummy full of raskvel babies is no easy job. You sit down for a break, finally getting an understanding of why the scaly little brood-mothers prefer to spend the later stages of their pregnancies on the ground with fingers and cocks between their legs. It’s exhausting, being this heavy <i>and</i> this horny all the time. <b>You might wind up like that before too long. Best find a safe place to wait out the rest of this.</b>"), "passive");
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (326 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.bellyRatingMod += 500;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 500;
				AddLogEvent(ParseText("You groan and slide down to the ground, not because you’re too tired but because you’re just <b>too pregnant to stand</b>. " + (kGAMECLASS.pc.buttRating() < 18 ? "Fortunately <b>your [pc.butt] seems a bit bigger</b> as you settle onto it. You’re more suited to sitting prettily on your asscheeks with your [pc.vaginas] on display." : "Fortunately, you’ve got a nice, big ass to lie around on as you display your oh-so-fertile belly.") + " A little while spent lounging around is a small price to pay for giving birth to a litter of lovely little rasks."), "passive");
				if(kGAMECLASS.pc.buttRating() < 18) kGAMECLASS.pc.buttRating(2);
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (328 * 60), function(pregSlot:int):void {
				kGAMECLASS.eventQueue.push(kGAMECLASS.raskPregChainBang);
			}, true);

			addStageProgression(_basePregnancyIncubationTime - (331 * 60), function(pregSlot:int):void {
				kGAMECLASS.pc.lust(5);
				AddLogEvent(ParseText("A flutter between your pussy-soaked thighs reminds you that you’re pregnant. You can feel things shifting inside you, adjusting and preparing. You’ll probably be laying eggs in a few hours, just pumping them out one after another while screaming in heavenly delight."), "passive");
			}, true);
		}
		
		public static function shekkaSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
		}
		
		public static function shekkaOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot];
			
			//If this is the first birth, go at it.
			if (!mother.hasStatusEffect("Shekka Pregnancy Ends") && !kGAMECLASS.disableExploreEvents())
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

				mother.createStatusEffect("Shekka Pregnancy Ends", babies, belly, pregSlot, babyGender, true);
				kGAMECLASS.eventQueue.push(kGAMECLASS.shekkaPregnancyBirth);
				ShekkaPregnancyHandler.shekkaCleanupData(mother, pregSlot, thisPtr);
			}
			//Delay subsequent births till the first has had time to go off.
			else mother.pregnancyData[pregSlot].pregnancyIncubation += 24;
		}
		public static function shekkaCleanupData(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			//StatTracking.track("pregnancy/raskvel births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/shekka kids", pData.pregnancyQuantity);
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
			
			//StatTracking.track("pregnancy/raskvel births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/shekka kids", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
			
			return c;
		}
	}

}