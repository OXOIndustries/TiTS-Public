package classes.GameData.Pregnancy.Handlers 
{
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.GameData.Pregnancy.Child;
	import classes.GameData.StatTracking;
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.PregnancyData;
	import classes.kGAMECLASS;
	import classes.GLOBAL;
	import classes.Engine.Interfaces.ParseText;
	import classes.Engine.Utility.rand;
	
	public class EggTrainerFauxPreg extends BasePregnancyHandler
	{
		public function EggTrainerFauxPreg() 
		{
			_handlesType = "EggTrainerFauxPreg";
			_basePregnancyIncubationTime = 172800000;
			_basePregnancyChance = 1;
			_alwaysImpregnate = true;
			_ignoreInfertility = true;
			_ignoreMotherInfertility = true;
			_ignoreFatherInfertility = true;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = true;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 1;
			_pregnancyQuantityMaximum = 1;
			_definedAverageLoadSize = 240;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_EGGS;
			
			var msg:String = "";		
			// One day in.
			this.addStageProgression((172800000 - (60*24)), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 2;
				kGAMECLASS.pc.bellyRatingMod += 2;
			}, true);
			// One month in
			this.addStageProgression((172800000 - (60*24*30)), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 3;
				kGAMECLASS.pc.bellyRatingMod += 3;
			}, true);
			// Two months in
			this.addStageProgression((172800000 - (60*24*60)), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 5;
				kGAMECLASS.pc.bellyRatingMod += 5;
			}, true);
			// Three months in
			this.addStageProgression((172800000 - (60*24*90)), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 5;
				kGAMECLASS.pc.bellyRatingMod += 5;
			}, true);
			// Four months in
			this.addStageProgression((172800000 - (60*24*120)), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 5;
				kGAMECLASS.pc.bellyRatingMod += 5;
				
				//Slight passive lust gain
				msg += "\n\n" + kGAMECLASS.logTimeStamp() + " The faux egg inside of you is getting fairly large now, thanks to the ever-growing TamaniCorp egg inside you. It moves ever so slightly with every step, making you shiver with pleasure almost constantly. <b>Mundane tasks, and even the passage of time, are arousing you.</b>";
				kGAMECLASS.eventBuffer += msg;
				kGAMECLASS.pc.createStatusEffect("Egg Addled 1",0,0,0,0,false,"Icon_DrugPill","Your lust increases slightly faster over time as a result of the shifting egg inside you.",false,0);
			}, true);
			// Five months in
			this.addStageProgression((172800000 - (60*24*150)), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 5;
				kGAMECLASS.pc.bellyRatingMod += 5;
			}, true);
			// Six months in
			this.addStageProgression((172800000 - (60*24*180)), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 5;
				kGAMECLASS.pc.bellyRatingMod += 5;
			}, true);
			// Seven months in
			this.addStageProgression((172800000 - (60*24*210)), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 5;
				kGAMECLASS.pc.bellyRatingMod += 5;
			}, true);
			// Eight months in
			this.addStageProgression((172800000 - (60*24*240)), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 5;
				kGAMECLASS.pc.bellyRatingMod += 5;
			}, true);
			// Nine months in
			this.addStageProgression((172800000 - (60*24*270)), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 5;
				kGAMECLASS.pc.bellyRatingMod += 5;
				
				msg = "\n\n" + kGAMECLASS.logTimeStamp() + " The egg inside you has swollen to massive proportions, stretching your body out as if you're carrying a pair of twins inside you. Every slight motion you make causes the tremendous weight inside you to shift and churn, sending shockwaves of ecstatic pleasure through you. <b>It's more arousing than ever, and if you aren't careful, you'll become dangerously distracted.</b>";
				
				kGAMECLASS.eventBuffer += msg;
				//Modest lust gain
				kGAMECLASS.pc.createStatusEffect("Egg Addled 2",0,0,0,0,false,"Icon_DrugPill","Your lust will increase over time to the maximum - leading to instant combat loss, should you blunder into a fight while distracted by your egg.",false,0);
			}, true);
			// Nine months in
			this.addStageProgression((172800000 - (60*24*400)), function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += 15;
				kGAMECLASS.pc.bellyRatingMod += 15;
				
				msg = "\n\n" + kGAMECLASS.logTimeStamp() + ParseText(" Your egg has grown truly, unnaturally, enormously massive inside you. Your belly is swollen beyond anything you'd have thought possible, stretching out ahead of you in swollen majesty. Every step, every slight motion you make, is nearly orgasmic now. You can't help but play with yourself constantly: not sexually, but simply rubbing your hands on your [pc.belly]. Sometimes, you find yourself spending minutes just enjoying the feeling of fullness, of your fingers brushing across your taut flesh.");
				//MASSIVE LUST GAIN
				kGAMECLASS.eventBuffer += msg;
				kGAMECLASS.pc.createStatusEffect("Egg Addled 3",0,0,0,0,false,"Icon_DrugPill","The endless stimulation of your internal faux egg is driving you mad with lust. Even the simple act of walking has become hellishly distracting.",false,0);
			}, true);

			_onSuccessfulImpregnation = EggTrainerFauxPregSuccessfulImpregnation;
			_onDurationEnd = EggTrainerFauxPregEnd;
		}
		
		public static function EggTrainerFauxPregSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			pData.pregnancyQuantity = 1;

			pData.pregnancyBellyRatingContribution += 5;
			mother.bellyRatingMod += pData.pregnancyBellyRatingContribution;
		}
		
		public static function EggTrainerFauxPregEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			var tEventCall:Function = (function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
			{
				return function():void
				{
					//kGAMECLASS.EggTrainerFauxPregEnds(c_pregSlot, pData.pregnancyQuantity);
					EggTrainerFauxPreg.cleanupPregnancy(c_mother, c_pregSlot, c_thisPtr);
				}
			})(mother, pregSlot, thisPtr);
			
			kGAMECLASS.eventQueue.push(tEventCall);
		}
		
		public static function cleanupPregnancy(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			//StatTracking.track("pregnancy/egg trainer eggs laid", pData.pregnancyQuantity);
			// doesn't count as offspring!
			
			pData.reset();
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBirthTimestamp:uint):Child
		{
			EggTrainerFauxPreg.cleanupPregnancy(mother, pregSlot, this);
			return null;
		}
		
		override public function pregBellyFragment(target:Creature, slot:int):String
		{
			var pData:PregnancyData = target.pregnancyData[slot];
			var retString:String = "";
			var msg:String = "";
			//Very Small Egg (Unnoticable Belly)
			if(pData.pregnancyBellyRatingContribution < 6) return "Though it’s not quite noticable yet, you’re well aware that there’s a slowly growing egg inside you.";
			//Small Egg (Slight Belly)
			else if(pData.pregnancyBellyRatingContribution < 10) return "The faux preg egg inside you has grown somewhat, causing your belly to expand. You’ve got a slight, barely noticeable but false baby bump now.";
			//Medium Egg (Moderate Belly, ~3-4 months preggers looking)
			//Slight passive lust gain
			else if(pData.pregnancyBellyRatingContribution < 22) return "The ever-growing TamaniCorp egg inside you moves ever so slightly with every step, making you shiver with pleasure almost constantly.";
			//Big Egg (5-8 months preggers)
			else if(pData.pregnancyBellyRatingContribution < 35) 
			{
				msg += "Your egg has grown bigger and bigger, now stretching your ";
				if(slot != 3) msg += "womb";
				else msg += "bowels";
				msg += " so thoroughly that you look positively <i>gravid</i>. It feels wonderful, when you’re not complaining about your back or struggling through doors - the feeling of your belly stretched out around the sheer size of the egg, the way it moves around inside you - it’s constantly bathing you in pleasurable sensations.";
				return msg;
			}
			//Very Big Egg (9 Months +)
			//Modest passive Lust gain.
			else if(pData.pregnancyBellyRatingContribution < 55) return "Your belly has grown to the size of a woman about to give birth - and maybe a little more at that! The egg inside you has swollen to massive proportions, stretching your body out as if you’re carrying a pair of twins inside you. Every slight motion you make causes the tremendous weight inside you to shift and churn, sending shockwaves of ecstatic pleasure through you.";
			//Giga Hyper Eggo (Jacques Tier But With Belly)
			//Major passive Lust gain
			else return "Your egg has grown truly, unnaturally, enormously massive inside you. Your belly is swollen beyond anything you’d have thought possible, stretching out ahead of you in swollen majesty. Every step, every slight motion you make, is nearly orgasmic now. You can’t help but play with yourself constantly: not sexually, but simply rubbing your hands on your [pc.belly]. Sometimes, you find yourself spending minutes just enjoying the feeling of fullness, of your fingers brushing across your taut flesh. You can’t wait to see how big it can get...";
		}
	}
}