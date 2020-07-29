package classes.GameData.Pregnancy.Handlers
{
	import classes.Characters.PlayerCharacter;
	import classes.Characters.PregnancyPlaceholder;
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.GameData.Pregnancy.Child;
	import classes.GameData.Pregnancy.Templates.MakiusUniqueChild;
	import classes.GameData.Pregnancy.UniqueChild;
	import classes.GameData.StatTracking;
	import classes.GameData.ChildManager;
	import classes.GameData.MailManager;
	import classes.Creature;
	import classes.PregnancyData;
	import classes.StorageClass;
	import classes.kGAMECLASS;
	import classes.GLOBAL;
	import classes.Engine.Interfaces.ParseText;
	import classes.Engine.Utility.indefiniteArticle;
	import classes.Engine.Utility.IncrementFlag;
	import classes.Engine.Interfaces.AddLogEvent;
	
	public class MakiusPregnancyHandler extends BasePregnancyHandler
	{
		public function MakiusPregnancyHandler()
		{
			_handlesType = "MakiusPregnancy";
			_basePregnancyIncubationTime = (60 * 24 * 365); //one year
			_basePregnancyChance = 0.2;
			_canImpregnateButt = true;
			_pregnancyQuantityMaximum = 2;
			_definedAverageLoadSize = 400;
			
			_onTryImpregnate = makiusTryImpregnate;
			_onSuccessfulImpregnation = makiusSuccessfulImpregnation;
			_onDurationEnd = makiusDurationEnd;
			
			for(var i:int = 0; i <= 360; i++){
				if (i == 25){
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						if (pregSlot == 3){
							if (kGAMECLASS.makius.hasStatusEffect("makiusPregnancyReveal")) AddLogEvent(ParseText("Your codex beeps, notifiying you of a new message: <b>Maki wants to tell you something important in person.</b>") , "passive");
							else AddLogEvent(ParseText("You find yourself fantasizing about Maki, picturing how big his belly will get from his pregnancy.") , "passive");
						}
						else AddLogEvent(ParseText("A scent that, normally, wouldn't bother you is suddenly unbearably rank. Lately your sense of smell has been getting stronger and you often wake up nauseous.") , "passive");
					}, true);
				}else if (i == 50){
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						if(pregSlot != 3) AddLogEvent(ParseText("You have a sudden craving for some ice cream. A whole tub of chocolate ice cream, mixed with chili peppers and pickles. Despite your better judgement you are utterly convinced that this would be a delicious meal.") , "passive");
					}, true);
				}else if (i == 100){
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						if (pregSlot != 3) {
							AddLogEvent(ParseText("Lately you've been having sudden cravings for strange foods that you wouldn't normally eat, plus you're getting a little more bloated than you're accustomed to. Your [pc.belly] has been feeling harder than it should be and your feet are definitely swollen. You check your codex and confirm what you've suspected: <b>you're pregnant with " + ((kGAMECLASS.pc.pregnancyData[pregSlot] as PregnancyData).pregnancyQuantity > 1?"venarian pups":"a venarian pup") + "</b>. Makius, the doctor you recruited for your " + (kGAMECLASS.flags["MAKI_OFFERED_JOB_AT_NURSERY"] && !kGAMECLASS.flags["MAKI_IN_CREW"]?"nursery":"crew") + ", is most likely the father and you start to mull how exactly you are going to break the news to him.") , "passive");
							kGAMECLASS.makius.createStatusEffect("makiusPregnancyReaction" + pregSlot);
						}
					}, true);
				}else if (i == 200){
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						if(pregSlot != 3) AddLogEvent(ParseText("You begin to daydream about the lithe body of your dork of a baby's father, focusing on his crotch. You can't help but release a lustful groan as your body heats up. In your imagination he tries to cover his face with his arms, for even in your fantasies he is ever-so slightly embarrassed. It doesn't take long until you are fondly, and lecherously, remembering the conception of your child.") , "passive");
					}, true);
				}else if (i == 300){
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						if(pregSlot != 3) AddLogEvent(ParseText("You absentmindedly caress your pregnant tummy, enjoying how nice and sensitive it is. The bump looks bigger every day, though you know it's still a long while before you deliver the baby.") , "passive");
					}, true);				
				}else if (i == 350){
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						if(pregSlot != 3) AddLogEvent(ParseText("You suddenly feel a kick to your stomach. After the surprise wears off, you realize it was your baby. As you caress your [pc.belly] you feel another kick, and you can't help but smile as you are brimming with joy and motherly affection. It's getting really close to the due date.") , "passive");
					}, true);		
				}else if (i == 362){
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						if (pregSlot == 3) AddLogEvent(ParseText("Your codex beeps notifiying you that Maki's pregnancy is almost due. <b>You should " + (kGAMECLASS.flags["MAKI_IN_CREW"]?"Check up on him whenever possible":"be there for him at Tavros station when it happends") + ".</b>") , "passive");
						else AddLogEvent(ParseText("Every day it's getting harder and harder to carry the baby in your womb. Your legs hurt, you are nauseous all the time and your baby bump is getting larger every week. You should rejoice that the struggle is almost over, but you know that you'll miss the feeling of the growing infant inside your womb. Then again, once it's done you can just ride another dick, let them go deep in you, so they can fill you with their baby batter to get you pregnant again! Either way, you should be going into labor any day now.") , "passive");
					}, true);
				}
				// Progressive changes with no text:
				else if(i > 300)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						if (pregSlot != 3) {
							kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 2, true);
							if(kGAMECLASS.pc.milkFullness < 10) kGAMECLASS.pc.milkFullness += 2;
							if(kGAMECLASS.pc.milkMultiplier < 1.5) kGAMECLASS.pc.milkMultiplier += 0.02;
							if (kGAMECLASS.pc.milkRate < 25) kGAMECLASS.pc.milkRate += 0.1;
						}
					}, true);
				}
				else if(i > 200)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						if (pregSlot != 3) {
							kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
							if (kGAMECLASS.pc.milkFullness < 10) kGAMECLASS.pc.milkFullness += 2;
						}
					}, true);
				}
				else
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						if (pregSlot != 3) {
							kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 0.5, true);
						}
					}, true);
				}
				
			}
		}
		
		public static function makiusTryImpregnate(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):Boolean
		{
			if (mother.originalRace == "venarian"){
				if (kGAMECLASS.flags["MAKI_STATE"] != 1 || kGAMECLASS.flags["MAKI_TAKING_FEMALE_CONTRACEPTIVES"]) return false;
			}else if (pregSlot == 3) return false;
			return BasePregnancyHandler.defaultOnTryImpregnate(father, mother, pregSlot, thisPtr);
		}
		
		public static function makiusSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			if (pregSlot == 3){
				//this preg can only have one child on slot 3
				(mother.pregnancyData[pregSlot] as PregnancyData).pregnancyQuantity = 1;
				//Maki knows about the pregnancy immedietly because he's a doctor (and because there aren't any scenes for when he finds out while evicted)
				kGAMECLASS.flags["MAKI_STATE"] = 2;
				kGAMECLASS.makius.createStatusEffect("makiusPregnancyReveal");
			}
		}
		
		public static function makiusDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			if (pregSlot == 3){
				if (kGAMECLASS.flags["MAKI_IN_CREW"]){
					kGAMECLASS.flags["MAKI_STATE"] = 1;
					kGAMECLASS.makiusSubbed(6);
				}else kGAMECLASS.flags["MAKI_STATE"] = 0;
				
				if (kGAMECLASS.flags["MAKI_IN_CREW"]){
					kGAMECLASS.makius.createStatusEffect("makiusWaitForBirth");
				}else{
					kGAMECLASS.eventQueue.push(kGAMECLASS.makiusGivesBirth);
				}
			}else{
				kGAMECLASS.eventQueue.push((function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
				{
					return function():void
					{
						kGAMECLASS.makiusPcGivesBirth((mother.pregnancyData[pregSlot] as PregnancyData).pregnancyQuantity, c_thisPtr as MakiusPregnancyHandler);
						MakiusPregnancyHandler.cleanupPregnancy(c_mother, c_pregSlot, c_thisPtr);
					}
				})(mother, pregSlot, thisPtr));
			}
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBornTimestamp:uint):Child
		{	
			kGAMECLASS.makiusPcGivesBirth((mother.pregnancyData[pregSlot] as PregnancyData).pregnancyQuantity, this, true);
			cleanupPregnancy(mother, pregSlot, this);
			return null;
		}
		
		//Returns true if first is female
		public function generatemakiusChildren(makiusFather:Boolean, amount:int = 1):Boolean{
			var c:MakiusUniqueChild = new MakiusUniqueChild();
			var traitChar:Creature = kGAMECLASS.chars["PC_BABY"];
			c.BornTimestamp = kGAMECLASS.GetGameTimestamp();
			
			var firstBorn:Boolean = Math.random() > 0.5;
			if (firstBorn) c.NumFemale = 1;
			else c.NumMale = 1;
			var females:int = Math.random() * (amount - 1);
			
			c.NumFemale = c.NumFemale + females;
			c.NumMale = c.NumMale + ((amount - 1) - females);
			
			// Adopt pc's colors:
			c.skinTone = traitChar.skinTone;
			c.lipColor = traitChar.lipColor;
			c.nippleColor = traitChar.nippleColor;
			c.eyeColor = traitChar.eyeColor;
			c.hairColor = traitChar.hairColor;
			c.furColor = traitChar.skinFurScalesColor();
			ChildManager.addChild(c);
			
			if (makiusFather) kGAMECLASS.flags["MAKI_SIRED_CHILDREN"] = kGAMECLASS.flags["MAKI_SIRED_CHILDREN"] + amount;
			else kGAMECLASS.flags["MAKI_BIRTHED_CHILDREN"] = kGAMECLASS.flags["MAKI_BIRTHED_CHILDREN"] + amount;
			
			return firstBorn;
		}
		
		public static function cleanupPregnancy(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot];
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			pData.reset();
			
			if (pregSlot == 3){
				kGAMECLASS.makius.removeStatusEffect("makiusPregnancyReveal");
				kGAMECLASS.makius.removeStatusEffect("makiusWaitForBirth");
			}else{
				kGAMECLASS.makius.removeStatusEffect("makiusPregnancyReaction" + pregSlot);
			}
		}
	}
}