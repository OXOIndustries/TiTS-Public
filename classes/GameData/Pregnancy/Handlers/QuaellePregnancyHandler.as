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
	import classes.GameData.Pregnancy.Templates.QuaelleUniqueChild;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Interfaces.AddLogEvent;
	import classes.Util.RandomInCollection;
	
	public class QuaellePregnancyHandler extends BasePregnancyHandler
	{
		public function QuaellePregnancyHandler() 
		{
			_handlesType = "QuaellePregnancy";
			_basePregnancyIncubationTime = (60 * 24 * (30 + rand(5))); // 30-35 days
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
			_pregnancyQuantityMaximum = 1;
			_definedAverageLoadSize = 2400;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_LIVE;
			_pregnancyChildRace = GLOBAL.TYPE_ROEHM;
			_childMaturationMultiplier = 1.0;
			
			_onSuccessfulImpregnation = quaelleSuccessfulImpregnation;
			_onDurationEnd = quaelleOnDurationEnd;
			
			//create possible day offsets of 0 or 1 days
			var offset:int = rand(1);
			var offset2:int = rand(1);
			var offset3:int = rand(1);
			var titText:String = "";
			
			for(var i:int = 0; i <= 30; i += 1)
			{
				// Preg Texts
				// Each line activates once during range
				
				// 4-5 days
				if(i == 4)
				{
					addStageProgression(_basePregnancyIncubationTime - ((i + offset) * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Your guts feel troubled. Bloated, soupy almost. You hope nobody slipped you something in your last meal. ", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.5, true);
					}, true);
				}
				// 7-9 days
				else if(i == 7)
				{
					addStageProgression(_basePregnancyIncubationTime - ((i + offset + offset2) * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Your [pc.belly] has taken on a slight curve, and when you rest you feel a solid, growing warmth in there. <b>You are pregnant.</b> You pass a wondering, soothing hand across your tummy.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.5, true);
					}, true);
				}
				// 13-16 days
				else if(i == 13)
				{
					addStageProgression(_basePregnancyIncubationTime - ((i + offset + offset2 + offset3) * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Whatever’s inside your womb is growing quite rapidly... which is somewhat alarming, because whatever it is also feels big. Already your [pc.belly] is swollen enough for you to stand out as clearly pregnant to others, there’s no way a human baby would have grown to this size in the space of a couple of weeks.\n\nIt doesn’t feel too uncomfortable, though. There’s a strange sort of easy give, a sponginess to your child-to-be. You can push your hand into your baby bulge until it almost disappears without feeling the slightest pain or alarm. It’s a startlingly, thrillingly alien sensation.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 4, true);
					}, true);
				}
				// 18-21 days
				else if(i == 18)
				{
					addStageProgression(_basePregnancyIncubationTime - ((i + offset + offset2 + offset3) * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("You want to <i>eat</i>. And not just anything. Steamed vegetables, fruit bowls, salads, stuffed vine leaves, vegetarian curries, stews, ratatouilles... saliva forms in your mouth whenever you think of something <i>green</i> and <i>starchy</i> and <i>nutrient rich.</i> Just... someone... lay you out in a kitchen garden with everything ripe in easy reach.\n\nYour mind constantly wanders back to the subject, your swollen, burgeoning belly growling. The thoughts get weirder the hungrier you get. You are almost certain you could eat grass and raw wheat, given the chance.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 5, true);
					}, true);
				}
				// 24-25 days
				else if(i == 24)
				{
					if (kGAMECLASS.pc.hasTits()) titText = " Your [pc.boobs] have swollen out too, your body cycling up its milk production in preparation for the big day";
					addStageProgression(_basePregnancyIncubationTime - ((i + offset) * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Your oddly squishy baby bulge just continues to grow, more than watermelon-sized now, forcing your gait to change to a waddle to accommodate it. Although the [pc.skin] stretched over it <i>looks</i> as taut as a drumhead, it’s spongy and pliant when you sink your hand into it. A little shiver runs through you when you do that, as if whatever is inside your womb is reacting to your touches: a slowly awaking softness. Whatever it is, it’s physically very different from the human that sired you." + titText, "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 6, true);
						if(kGAMECLASS.pc.milkMultiplier < 10) kGAMECLASS.pc.milkMultiplier = 10;
						if(kGAMECLASS.pc.milkFullness < 25) kGAMECLASS.pc.milkFullness = 25;
						kGAMECLASS.pc.milkFullness += 15;
						if (kGAMECLASS.pc.milkRate < 10) kGAMECLASS.pc.milkRate = 10;
					}, true);
				}
				// 28-29 days
				else if(i == 28)
				{
					addStageProgression(_basePregnancyIncubationTime - ((i + offset) * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("You have to take frequent rests, huffing and puffing with the squishy, dense weight of your hugely swollen womb. Your [pc.belly] enters rooms far out in front of you now.\n\nIt feels like a washing machine in very slow motion; the new life packing out your womb turning around itself, not moving restlessly exactly, but... feeling around. Preparing itself. It’s a very odd sensation, the actions of something large and soft and completely boneless.\n\nWhen you close your eyes, you find yourself imagining somewhere nice and safe and warm and wet to have your child. Like a sauna, perhaps. With plenty of moss growing on it, that you could eat. You snort slightly at the thought, hand rubbing over your stuffed baby chamber.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 7, true);
						if(kGAMECLASS.pc.milkMultiplier < 25) kGAMECLASS.pc.milkMultiplier = 25;
						if(kGAMECLASS.pc.milkFullness < 50) kGAMECLASS.pc.milkFullness = 50;
						kGAMECLASS.pc.milkFullness += 15;
						if (kGAMECLASS.pc.milkRate < 10) kGAMECLASS.pc.milkRate = 10;
					}, true);
				}				
				// Progressive changes with no text:
				else if(i > 28)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 7, true);
						if(kGAMECLASS.pc.milkMultiplier < 25) kGAMECLASS.pc.milkMultiplier = 25;
						if(kGAMECLASS.pc.milkFullness < 50) kGAMECLASS.pc.milkFullness = 50;
						kGAMECLASS.pc.milkFullness += 15;
						if (kGAMECLASS.pc.milkRate < 10) kGAMECLASS.pc.milkRate = 10;
					}, true);
				}
				else if(i > 24)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 6, true);
						if(kGAMECLASS.pc.milkMultiplier < 10) kGAMECLASS.pc.milkMultiplier = 10;
						if(kGAMECLASS.pc.milkFullness < 25) kGAMECLASS.pc.milkFullness = 25;
						kGAMECLASS.pc.milkFullness += 15;
						if (kGAMECLASS.pc.milkRate < 10) kGAMECLASS.pc.milkRate = 10;
					}, true);
				}
				else if(i > 18)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 5, true);
					}, true);
				}
				else if(i > 10)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 4, true);
					}, true);
				}
				else
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.5, true);
					}, true);
				}
			}
		}
		
		public static function quaelleSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr, undefined);
		}
		
		public static function quaelleOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot];
			
			//If this is the first birth, go at it.
			if (!mother.hasStatusEffect("Quaelle Pregnancy Ends"))
			{
				// Baby count check (just in case)
				var babies:int = mother.pregnancyData[pregSlot].pregnancyQuantity;
				var belly:int = mother.pregnancyData[pregSlot].pregnancyBellyRatingContribution;
				
				// Generate babies
				var babyList:Array = (new QuaellePregnancyHandler()).quaelleChildren(mother, babies);
				var genderList:Array = [];
				var i:int = 0;
				var j:int = 0;
				for(i = 0; i < babyList.length; i++)
				{
					//for(j = 0; j < babyList[i].NumNeuter; j++) { genderList.push(-1); }
					for(j = 0; j < babyList[i].NumFemale; j++) { genderList.push(0); }
					//for(j = 0; j < babyList[i].NumMale; j++) { genderList.push(1); }
					//for(j = 0; j < babyList[i].NumIntersex; j++) { genderList.push(2); }
					ChildManager.addChild(babyList[i]);
				}
				
				var babyGender:int = 1;
				if(genderList.length > 0) babyGender = genderList[rand(genderList.length)];
				
				mother.createStatusEffect("Quaelle Pregnancy Ends", babies, belly, pregSlot, babyGender, true);
				kGAMECLASS.eventQueue.push(kGAMECLASS.quaellePregnancyEnds);
				QuaellePregnancyHandler.quaelleCleanupData(mother, pregSlot, thisPtr);
			}
			//Delay subsequent births till the first has had time to go off.
			else mother.pregnancyData[pregSlot].pregnancyIncubation += 24;
		}
		public static function quaelleCleanupData(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			if (kGAMECLASS.flags["QUAELLE_TOTAL_KIDS"] == undefined) kGAMECLASS.flags["QUAELLE_TOTAL_KIDS"] = 0;
			kGAMECLASS.flags["QUAELLE_TOTAL_KIDS"] += pData.pregnancyQuantity;
			StatTracking.track("pregnancy/quaelle births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/quaelle daughters", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBornTimestamp:uint):Child
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			var babyList:Array = quaelleChildren(mother, pData.pregnancyQuantity);
			var i:int = 0;
			for(i = 0; i < babyList.length; i++)
			{
				babyList[i].BornTimestamp = useBornTimestamp;
				ChildManager.addChild(babyList[i]);
			}
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			if (kGAMECLASS.flags["QUAELLE_TOTAL_KIDS"] == undefined) kGAMECLASS.flags["QUAELLE_TOTAL_KIDS"] = 0;
			kGAMECLASS.flags["QUAELLE_TOTAL_KIDS"] += pData.pregnancyQuantity;
			StatTracking.track("pregnancy/quaelle births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/quaelle daughters", pData.pregnancyQuantity);
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
		
		private function quaelleChildren(mother:Creature, numKids:int = 0):Array
		{
			var babyList:Array = [];
			
			var traitChar:Creature = mother;
			if(mother is PlayerCharacter) traitChar = kGAMECLASS.chars["PC_BABY"];
			
			for(var i:int = 0; i < numKids; i++)
			{
				var c:UniqueChild = new QuaelleUniqueChild();
				
				c.RaceType = GLOBAL.TYPE_ROEHM;
				c.NumFemale = 1;
				
				var kidColor:String = RandomInCollection(["yellow", "cream", "orange", "russet"]);
				c.skinTone = kidColor;
				c.lipColor = kidColor;
				c.nippleColor = kidColor;
				kGAMECLASS.flags["QUAELLE_BIRTHSCENE_COLOR"] = kidColor;
				
				c.MaturationRate = childMaturationMultiplier;
				c.BornTimestamp = kGAMECLASS.GetGameTimestamp();
				
				babyList.push(c);
			}
			
			return babyList;
		}
	}

}

