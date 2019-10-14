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
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Interfaces.AddLogEvent;
	import classes.Util.RandomInCollection;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Map.InRoomWithFlag;
	
	public class AusarPregnancyHandler extends BasePregnancyHandler
	{
		public function AusarPregnancyHandler() 
		{
			_handlesType = "AusarPregnancy";
			_basePregnancyIncubationTime = (60 * 24 * 180); // 180 days
			_basePregnancyChance = .1;
			_alwaysImpregnate = false;
			_ignoreInfertility = false;
			_ignoreFatherInfertility = false;
			_ignoreMotherInfertility = false;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = false;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 2;
			_pregnancyQuantityMaximum = 6;
			_definedAverageLoadSize = 100;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_LIVE;
			_pregnancyChildRace = GLOBAL.TYPE_CANINE;
			_childMaturationMultiplier = 1.0;
						
			_childGenderWeights.Male = 50;
			_childGenderWeights.Female = 50;
			
			_onSuccessfulImpregnation = ausarSuccessfulImpregnation;
			_onDurationEnd = ausarOnDurationEnd;
			
			var titText:String = "";
			var titText2:String = "";
			var titText3:String = "";
			
			for(var i:int = 0; i <= 180; i += 1)
			{
				// Preg Texts
				// Each line activates once during range				
				// 14 days
				if(i == 14)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Your stomach heaves all of a sudden, distressing enough to stop you in your tracks and make you double over. Your throat seizes and bile seeps up your esophagus, though it doesn’t quite deign to make it all the way past your teeth. A moment later and the disgusting sensation passes, leaving you flushed and teary-eyed but otherwise unblemished. Gross... hopefully you haven’t caught something.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .1, true);
					}, true);
				}
				// 30 days
				else if(i == 30)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						if (InRoomWithFlag(GLOBAL.HAZARD)) titText = "the ground";
						else titText = "the nearest trash can";
						if (kGAMECLASS.pc.race() == "ausar") titText2 = " that isn’t your own.";
						else titText2 = ".";
						titText3 = "that one ausar";
						AddLogEvent("Your stomach heaves all of a sudden, a powerful-enough sensation to make you go scrambling for " + titText + ", just before your gut decides to empty its contents in a rush of bile and gross. You spend the next couple of minutes heaving up your last meal, an exertion that leaves you teary-eyed and sore in the chest.\n\nUgh! As soon as the last of the bile’s out, you grab your Codex and flip its scanner towards yourself. What the hell’s going on th-\n\nThe Codex beeps barely a moment after you start the scan, promptly alerting you to the problem: you’re pregnant, and it’s detecting ausar DNA" + titText2 + "\n\nOh.\n\nYeah, that makes sense. You can clearly remember a certain tryst a couple weeks ago that might have caused this... It seems you can lay this new development at the feet of " + titText3 + ".", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .3, true);
					}, true);
				}
				// 40 days
				else if(i == 40)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("You’re starting to get hungrier, now that you think about it. You know you’ve been eating more, but even now just walking around, you feel your stomach rumbling. Another reminder that you’re eating for more than just yourself now. Meats, especially raw, leave you salivating any time you catch a whiff.\n\nAnd despite your growing belly, you find that you’ve got a real urge to go for a run every now and then, too. At least you don’t want to play fetch.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .35, true);
					}, true);
				}
				// 60 days
				else if(i == 60)
				{
					if (rand(2) == 0)
					{
						addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
							AddLogEvent("You feel your pups squirming around inside you. Maybe they’re playing! While it’s not quite a kick, their shenanigans are enough to make you gasp and hold your stomach every now and then.", "passive");
							kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .3, true);
						}, true);	
					}
					else
					{
						addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
							AddLogEvent("Your stomach’s growing larger, accommodating the developing life inside you. Your [pc.skin] is taut and stretched, and walking’s becoming a little more awkward. Still, you’re full of energy -- perhaps a little of your pups’ excitement rubbing off on you.\n\nYou’re also undeniably getting hornier. Your [pc.cunt " + pregSlot + "] drools at the slightest provocation, and your [pc.nipples] spend more time stiff and tender than they don’t.\n\nThe changes aren’t significant yet, but you know these little bundles of vigor in your womb have plenty more growing to do.", "passive");
							kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .3, true);
						}, true);
					}
				}
				// 90 days
				else if(i == 90)
				{

					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						if (!kGAMECLASS.pc.hasTits()) titText = " You’re sure your chest has softened and grown, too, swelling to at least an A-cup.";
						else titText = "";
						if (kGAMECLASS.pc.milkFullness > 0) titText2 = " Your [pc.breasts] are also starting to swell with even more [pc.milk] than usual";
						else titText2 = " Your [pc.breasts] are also starting to leak [pc.milk] at the most inopportune of moments";
						AddLogEvent("You now walk with a rounded gait in order to support the soccer ball you’re toting out in front of you, and your chest is so sensitive that it’s torture wearing anything at all." + titText + titText2 + ", your body stepping up its lactation to provide for what’s growing inside you. You start slightly as something boops against the taut skin of your stomach from within.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .2, true);
						if(kGAMECLASS.pc.milkMultiplier < 10) kGAMECLASS.pc.milkMultiplier = 10;
						if(kGAMECLASS.pc.milkFullness < 25) kGAMECLASS.pc.milkFullness = 25;
						kGAMECLASS.pc.milkFullness += 15;
						if (kGAMECLASS.pc.milkRate < 10) kGAMECLASS.pc.milkRate = 10;
					}, true);
				}
				// 100 days
				else if(i == 100)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Your stomach’s growing even larger, accommodating the developing life inside you. Your belly feels so full all the damn time, swollen with your puppies’ sheer size. And yet, you find a smile on your face almost all the time; your pups are frequently at play inside you, tumbling around as best they can. You’d swear you can hear them yipping in your dreams.\n\nYou find your hands on your stomach at all hours, rubbing the stretched skin in idle bliss. It feels... nice, carrying these precious little ausar. You can’t wait to get to meet them in person.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .05, true);
						if(kGAMECLASS.pc.milkMultiplier < 25) kGAMECLASS.pc.milkMultiplier = 25;
						if(kGAMECLASS.pc.milkFullness < 50) kGAMECLASS.pc.milkFullness = 50;
						kGAMECLASS.pc.milkFullness += 15;
						if (kGAMECLASS.pc.milkRate < 10) kGAMECLASS.pc.milkRate = 10;
					}, true);
				}
				// 145 days
				else if(i == 145)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {	
						var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
						titText = num2Text(pData.pregnancyQuantity);
						AddLogEvent("You pause for breath, hand on your heavily swollen tummy. It feels hot in there, more than anything, like a beach ball-shaped foundry. Your pups are wriggling around more than usual, and with more force too: they’re kicking and playing constantly, hitting the inside of your stomach hard enough to bulge your skin at times.\n\nBy now, your Codex is able to tell you that you’re playing home to " + titText + " ausar pups. No wonder you’ve grown so hefty...\n\nThe hormones you’re simmering in rise up into your mind, and in spare moments you find yourself absently dreaming of hearths, rugs, tubs; anything you might curl yourself up on and sleep while you enjoy your full womb.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .05, true);
						if(kGAMECLASS.pc.milkMultiplier < 25) kGAMECLASS.pc.milkMultiplier = 25;
						if(kGAMECLASS.pc.milkFullness < 50) kGAMECLASS.pc.milkFullness = 50;
						kGAMECLASS.pc.milkFullness += 15;
						if (kGAMECLASS.pc.milkRate < 10) kGAMECLASS.pc.milkRate = 10;
					}, true);
				}	
				// 175 days
				else if(i == 175)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						if (InRoomWithFlag(GLOBAL.HAZARD)) titText = " The instinct to find a dark, safe den to have your children in is growing very difficult to ignore.";
						else titText = "";
						AddLogEvent("You really can’t be far off from giving birth now - a week, at most. Your [pc.vagina " + pregSlot + "] is permanently soft and slightly dilated now, and the kicks inside your distended stomach grow more prominent by the day." + titText, "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .05, true);
						if(kGAMECLASS.pc.milkMultiplier < 25) kGAMECLASS.pc.milkMultiplier = 25;
						if(kGAMECLASS.pc.milkFullness < 50) kGAMECLASS.pc.milkFullness = 50;
						kGAMECLASS.pc.milkFullness += 15;
						if (kGAMECLASS.pc.milkRate < 10) kGAMECLASS.pc.milkRate = 10;
					}, true);
				}	
				// Progressive changes with no text:
				else if(i > 175)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .05, true);
						if(kGAMECLASS.pc.milkMultiplier < 25) kGAMECLASS.pc.milkMultiplier = 25;
						if(kGAMECLASS.pc.milkFullness < 50) kGAMECLASS.pc.milkFullness = 50;
						kGAMECLASS.pc.milkFullness += 15;
						if (kGAMECLASS.pc.milkRate < 10) kGAMECLASS.pc.milkRate = 10;
					}, true);
				}
				else if(i > 145)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .05, true);
						if(kGAMECLASS.pc.milkMultiplier < 25) kGAMECLASS.pc.milkMultiplier = 25;
						if(kGAMECLASS.pc.milkFullness < 50) kGAMECLASS.pc.milkFullness = 50;
						kGAMECLASS.pc.milkFullness += 15;
						if (kGAMECLASS.pc.milkRate < 10) kGAMECLASS.pc.milkRate = 10;
					}, true);
				}
				else if(i > 100)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .05, true);
						if(kGAMECLASS.pc.milkMultiplier < 25) kGAMECLASS.pc.milkMultiplier = 25;
						if(kGAMECLASS.pc.milkFullness < 50) kGAMECLASS.pc.milkFullness = 50;
						kGAMECLASS.pc.milkFullness += 15;
						if (kGAMECLASS.pc.milkRate < 10) kGAMECLASS.pc.milkRate = 10;
					}, true);
				}
				else if(i > 90)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .2, true);
						if(kGAMECLASS.pc.milkMultiplier < 25) kGAMECLASS.pc.milkMultiplier = 25;
						if(kGAMECLASS.pc.milkFullness < 50) kGAMECLASS.pc.milkFullness = 50;
						kGAMECLASS.pc.milkFullness += 15;
						if (kGAMECLASS.pc.milkRate < 10) kGAMECLASS.pc.milkRate = 10;
					}, true);
				}
				else if(i > 60)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .3, true);
					}, true);
				}
				else if(i > 40)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .35, true);
					}, true);
				}
				else if(i > 30)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .3, true);
					}, true);
				}
				else if(i > 14)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .1, true);
					}, true);
				}
				else
				{
					//nothing
				}
			}
		}
		
		public static function ausarSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr, undefined);
		}
		
		public static function ausarOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot];
			
			//If this is the first birth, go at it.
			if (!mother.hasStatusEffect("Ausar Pregnancy Ends"))
			{
				// Baby count check (just in case)
				var babies:int = mother.pregnancyData[pregSlot].pregnancyQuantity;
				var belly:int = mother.pregnancyData[pregSlot].pregnancyBellyRatingContribution;
				var babyGender:int = rand(2);
				
				ChildManager.addChild(
				Child.NewChildWeights(
					thisPtr.pregnancyChildRace,
					thisPtr.childMaturationMultiplier,
					pData.pregnancyQuantity,
					thisPtr.childGenderWeights
					)
				);
				
				mother.createStatusEffect("Ausar Pregnancy Ends", babies, belly, pregSlot, babyGender, true);
				kGAMECLASS.eventQueue.push(kGAMECLASS.ausarPregnancyEnds); //see ilaria.as
				AusarPregnancyHandler.ausarCleanupData(mother, pregSlot, thisPtr);
			}
			//Delay subsequent births till the first has had time to go off.
			else mother.pregnancyData[pregSlot].pregnancyIncubation += 24;
		}
		public static function ausarCleanupData(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;

			StatTracking.track("pregnancy/ausar births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBornTimestamp:uint):Child
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			var c:Child = Child.NewChildWeights(
				pregnancyChildRace,
				childMaturationMultiplier,
				pData.pregnancyQuantity,
				childGenderWeights
			);
			c.BornTimestamp = useBornTimestamp;
			
			ChildManager.addChild(c);
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;			

			StatTracking.track("pregnancy/ausar births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);					
			
			pData.reset();	
			return c;
		}		
	}
}

