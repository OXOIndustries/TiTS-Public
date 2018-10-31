// Impregnation - Male Zil
// By HugsAlright

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
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Interfaces.AddLogEvent;
	import classes.Engine.Interfaces.ExtendLogEvent;
	import classes.Engine.Map.InPublicSpace;
	import classes.Engine.Map.InShipInterior;
	
	public class ZilPregnancyHandler extends BasePregnancyHandler
	{
		public function ZilPregnancyHandler() 
		{
			_handlesType = "ZilPregnancy";
			_basePregnancyIncubationTime = (60 * 24 * 240); // 9 Months
			_basePregnancyChance = 0.1;
			_alwaysImpregnate = false;
			_ignoreInfertility = false;
			_ignoreFatherInfertility = false;
			_ignoreMotherInfertility = false;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = false;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 2; // PC should always be impregnated with twins at the least.
			_pregnancyQuantityMaximum = 6;
			_definedAverageLoadSize = 16;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_LIVE;
			_pregnancyChildRace = GLOBAL.TYPE_BEE;
			_childMaturationMultiplier = 1.0;
			
			_onDurationEnd = zilOnDurationEnd;
			
			// Pregnancy Blurbs
			// These blurbs occur once per their period.
			for(var i:int = 30; i <= 240; i += 5)
			{
				// 30-40 Days
				if(i == 35)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("You’ve been feeling a bit bloated lately, not to mention your stomach’s been in knots almost every other hour. A great deal of your time is spent dry-heaving over the nearest toilet, bucket, or pile of rocks.", "passive");
						ExtendLogEvent("\n\nOf course, every time, nothing comes out.");
						ExtendLogEvent("\n\n<i>Bleeeeeegh.</i>");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
					}, true);
				}
				// 40-50 Days (Pheromones)
				else if(i == 45)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Your stomach is still bloated, and people have been acting strange around you recently; they sniff the air around you a few times, then either take a few steps away from you or take a few more <i>very</i> deep whiffs.", "passive");
						if(kGAMECLASS.pc.hasPheromones()) ExtendLogEvent(" You don’t think much of it at first, having your own, potent " + kGAMECLASS.pc.mf("musk", "pheromones") + ", but something seems a bit off about the way people are acting.");
						if(kGAMECLASS.crew(true) > 0 && InShipInterior()) ExtendLogEvent(" Some of your crew members even begin asking if you started wearing perfume.");
						ExtendLogEvent(" You almost feel like lashing out at the prudes sometimes.");
						ExtendLogEvent("\n\nEventually, the change gets to you enough that you take some time away from your busy adventure to inspect yourself.");
						ExtendLogEvent(" After " + ((InShipInterior() || InPublicSpace()) ? "getting some privacy" : "finding a nice, secluded area") + ", you");
						if(!kGAMECLASS.pc.isNude()) ExtendLogEvent(" strip yourself bare then");
						ExtendLogEvent(" lift a wrist to your nose and let your own scent fill your nostrils. Sure enough, there’s a smell; it’s very faint, which is probably why you didn’t notice it before, but there’s something familiar about it... musky and sweet. Your mind jumps to thoughts of zil when it registers that scent, those sex-heavy pheromones of theirs.");
						ExtendLogEvent("\n\nHuh, it must’ve just rubbed off on you the last time you were on Mhen’ga. Maybe it’ll go away if you take a shower.");
						// Should apply some sort of zil preggomone flag/buff that’s mentioned in the notes: decreases chance of encountering hostile zil, increases chance of encountering friendly zil mate.
						// Zil Pheromones - While the PC has zil Pheromones, their chances of running into hostile zil mobs are lessened quite a bit, while their chances of encountering their friendly male zil mate increase.
						kGAMECLASS.pc.createStatusEffect("Zil Pheromones", 0, 0, 0, 0, false, "Icon_Smelly", "Your body is emitting a fertile zil’s scent.", false, 0, 0xB793C4);
						kGAMECLASS.pc.addStatusValue("Zil Pheromones", 1, 1);
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
					}, true);
				}
				// 50-60 Days
				else if(i == 55)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("You’ve been eating like an animal recently, murdering all the junk food you can find in an attempt to quell your seemingly-bottomless and still-bloated tummy. There’s no end to it though, and you’re only craving increasingly sweet foods!", "passive");
						if(kGAMECLASS.yammiIsCrew()) ExtendLogEvent(" Even Yammi has trouble keeping up with your “exotic” tastes.");
						ExtendLogEvent("\n\nNothing says delicious like covering whatever you have around the ship in hot fudge.");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
					}, true);
				}
				// 60-65 Days
				else if(i == 65)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Alright, it’s obvious something is wrong with you, and at this point " + (kGAMECLASS.pc.isBimbo() ? "even you" : "anyone") + " could know what’s up.", "passive");
						ExtendLogEvent("\n\n<i>You’re " + (kGAMECLASS.silly ? "gregnant" : "pregnant") + ".</i> Your “bloated” stomach, your irrational moods, and your odd cravings: all signs of new life beginning within you.");
						ExtendLogEvent("\n\nLooking down at your now-rounded tummy, you feel a mighty need to know who did the deed. So, you take at your codex and give yourself a quick scan with it; sure enough, the device tells you that you are indeed carrying the seed of another, a zil’s seed specifically.");
						ExtendLogEvent("\n\nWell, that explains the strange scent you’ve been giving off lately, at least. The pregnancy must be messing with your hormones like <i>crazy</i> for that to happen.");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
					}, true);
				}
				// 80-100 Days
				else if(i == 90)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						var sTime:String = "days";
						var nTime:Number = ((345600 / kGAMECLASS.pc.pregnancyData[pregSlot].pregnancyIncubationMulti) - kGAMECLASS.pc.getPregnancyTime(pregSlot));
						if(nTime < 2880) sTime = "hours";
						if(nTime < 120) sTime = "minutes";
						AddLogEvent(ParseText("Your pregnancy seems to be progressing normally, with your [pc.stomach] slowly swelling outwards over the " + sTime + ", full of new life. You can’t help but feel a warm bliss as you look down at your gravid tummy, a sense of fulfillment that serves as a reward for taking care of your unborn offspring like this. It’s hard to describe, but you think the word you’d use is “motherly”.\n\nThough, at the same time, your stomach has been hindering your movement and impairing your ability to navigate more difficult terrain.\n\nMaybe you should find somewhere nice to settle down and wait out this pregnancy before you continue your adventures in uncharted space."), "passive");
						// Should apply the reflex reduction modifier.
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
					}, true);
				}
				// 104-120 Days (Lactation/Breast Growth)
				else if(i == 110)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("Your belly is significantly larger at this point, and rather than just impairing your movements, it’s actually making you feel nervous about trying to run or climb.", "passive");
						ExtendLogEvent(ParseText("\n\nWhat’s more, your " + (kGAMECLASS.pc.isLactating() ? "already-leaky breasts are swelling and producing a lot more [pc.milk] than usual" : ((!kGAMECLASS.pc.hasBreasts() ? "[pc.chest] is" : "[pc.breasts] are") + " swelling and leaking [pc.milk]")) + " in preparation for your soon-to-come young. Your bosom seems to trickle its bounty whenever it feels like, and it’s hard to predict, " + (!kGAMECLASS.pc.isChestExposed() ? "wetting and staining your clothes rather annoyingly" : ("dripping down the swell of your tits " + (kGAMECLASS.pc.exhibitionism() >= 66 ? "in a way that gets you a little horny" : "embarrassingly with your chest left bare"))) + "."));
						ExtendLogEvent("\n\nSeems like a good idea to invest in a new bra at this point.");
						// Increases breast rating by 1 and induces/boosts lactation or milk production.
						for(var b:int = 0; b < kGAMECLASS.pc.breastRows.length; b++)
						{
							kGAMECLASS.pc.breastRows[b].breastRatingRaw += 1;
						}
						if(kGAMECLASS.pc.milkMultiplier < 25) kGAMECLASS.pc.milkMultiplier = 25;
						if(kGAMECLASS.pc.milkFullness < 25) kGAMECLASS.pc.milkFullness = 25;
						kGAMECLASS.pc.milkFullness += 15;
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.5, true);
					}, true);
				}
				// 140-160 Days (Honey TFing)
				else if(i == 150)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						var nTime:Number = Math.floor(30240/kGAMECLASS.pc.pregnancyData[pregSlot].pregnancyIncubationMulti);
						AddLogEvent("Well, this is odd.", "passive");
						if(kGAMECLASS.pc.milkType != GLOBAL.FLUID_TYPE_HONEY)
						{
							ExtendLogEvent(ParseText("\n\nOver the past " + shortMinutes(nTime, true, false) + ", you’ve noticed something strange happening to your [pc.milk], along with an increase in the intensity of those pheromones you’ve been giving off. Your lactations have been gaining a golden hue and sweet scent, and you just think it might have something to do with the bee-babies you’re carrying."));
							ExtendLogEvent(ParseText("\n\nOnce you get a moment to rest, you decide to inspect your [pc.breasts], finding a nice private spot to"));
							if(!kGAMECLASS.pc.isChestExposed()) ExtendLogEvent(" peel away your top and");
							ExtendLogEvent(ParseText(" check yourself out. Sure enough, you find that your [pc.nipples] are already leaking their nectar. Your bosom feels heavier now, and it takes a firm squeeze of your chest and rough tug of your nipples draw more of the fluids out."));
							ExtendLogEvent("\n\nYou take a finger and trail it along the underside of one of your breasts, gathering your lactation as you go along. Lifting the milk-covered digit to your face, you see and feel that it’s more viscous than before, and posses a much deeper golden color than the last time you saw. With your curiosity piqued, you put that finger to your mouth, and lick. Almost immediately your taste buds are greeted by a wonderfully sweet taste: honey! You’re producing honey!");
							ExtendLogEvent("\n\nLooks like your body is making a few changes in preparation for your alien offspring.");
							if(kGAMECLASS.pc.girlCumType != GLOBAL.FLUID_TYPE_HONEY)
							{
								ExtendLogEvent("\n\nIt doesn’t end there, though, because after that little discovery, you find out that your more feminine fluid have also change to that of a sweet, golden variety");
								if(kGAMECLASS.pc.hasCock()) ExtendLogEvent(ParseText(", with your [pc.cocks] also leaking a potent, sugary nectar"));
								ExtendLogEvent(".");
							}
						}
						else if(kGAMECLASS.pc.girlCumType != GLOBAL.FLUID_TYPE_HONEY)
						{
							ExtendLogEvent("\n\nOver the past " + shortMinutes(nTime, true, false) + " you’ve discovered something very odd happening to your body: you’re leaking honey, from your genitals in particular, with your more feminine fluids having changed to that of a sweet, golden variety");
							if(kGAMECLASS.pc.hasCock()) ExtendLogEvent(ParseText(", with your [pc.cocks] also leaking a potent, sugary nectar"));
							ExtendLogEvent(". Seems like this alien pregnancy is having some extra effects on your body.");
						}
						else
						{
							ExtendLogEvent("\n\nOver the past " + shortMinutes(nTime, true, false) + " you’ve noticed an uptake in the amount of honey your breasts are producing. You’re guessing it’s your body getting itself read for your alien offspring.");
						}
						kGAMECLASS.pc.milkType = GLOBAL.FLUID_TYPE_HONEY;
						kGAMECLASS.pc.cumType = GLOBAL.FLUID_TYPE_HONEY;
						kGAMECLASS.pc.girlCumType = GLOBAL.FLUID_TYPE_HONEY;
						if(kGAMECLASS.pc.milkMultiplier < 25) kGAMECLASS.pc.milkMultiplier = 25;
						if(kGAMECLASS.pc.milkFullness < 25) kGAMECLASS.pc.milkFullness = 25;
						kGAMECLASS.pc.milkFullness += 15;
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.5, true);
					}, true);
				}
				// 164-180 Days
				else if(i == 175)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						var sTime:String = "week";
						var sTime2:String = "day";
						var nTime:Number = ((345600 / kGAMECLASS.pc.pregnancyData[pregSlot].pregnancyIncubationMulti) - kGAMECLASS.pc.getPregnancyTime(pregSlot));
						if(nTime < 20160) { sTime = "day"; sTime2 = "hour"; }
						if(nTime < 2880) { sTime = "hour"; sTime2 = "minute"; }
						if(nTime < 120) { sTime = "minute"; sTime2 = "second"; }
						AddLogEvent("Your belly grows by the " + sTime + ", and it’s getting to the point where you have to stop and catch your breath very often. Your figure is dominated by your swollen tummy now, blocking your view of the world below you, and slowing you down more and more each " + sTime2 + ". Your alien children seem keen on kicking against the inside of your womb every now and then, a constant reminder of the precious load you’re carrying.", "passive");
						ExtendLogEvent("\n\nNo doubt there are at least two tiny half-zil in there.");
						// Increase reflex multiplier.
						kGAMECLASS.pc.createStatusEffect("Zil Pregnancy Reflex Mod", 0, 0, 0, 0, true, "", "", false, 0);
						kGAMECLASS.pc.addStatusValue("Zil Pregnancy Reflex Mod", 1, 5);
						if(kGAMECLASS.pc.milkMultiplier < 25) kGAMECLASS.pc.milkMultiplier = 25;
						if(kGAMECLASS.pc.milkFullness < 25) kGAMECLASS.pc.milkFullness = 25;
						kGAMECLASS.pc.milkFullness += 15;
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.5, true);
					}, true);
				}
				// 200-220 Days
				else if(i == 210)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						var sTime:String = "day";
						var nTime:Number = ((345600 / kGAMECLASS.pc.pregnancyData[pregSlot].pregnancyIncubationMulti) - kGAMECLASS.pc.getPregnancyTime(pregSlot));
						if(nTime < 2880) sTime = "hour";
						if(nTime < 120) sTime = "minute";
						if(kGAMECLASS.pc.milkFullness < 10) kGAMECLASS.pc.milkFullness += 25;
						if(kGAMECLASS.pc.milkMultiplier < 1.5) kGAMECLASS.pc.milkMultiplier += 0.15;
						if(kGAMECLASS.pc.milkRate < 25) kGAMECLASS.pc.milkRate += 5;
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 2, true);
						AddLogEvent(ParseText("You can’t be more than a month away from giving birth at this point: your [pc.stomach] is distended outward with as much weight and size as you can carry, but still growing by the " + sTime + ". At the same time, your [pc.vagina " + pregSlot + "] is dilated and your young are constantly kicking inside you."), "passive");
						if(!InPublicSpace()) ExtendLogEvent(" Your instincts are telling you to find somewhere safe to have your children, and you think you better trust them.");
					}, true);
				}
				// Progressive changes with no text:
				else if(i > 210)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 2, true);
						if(kGAMECLASS.pc.milkFullness < 10) kGAMECLASS.pc.milkFullness += 25;
						if(kGAMECLASS.pc.milkMultiplier < 1.5) kGAMECLASS.pc.milkMultiplier += 0.15;
						if(kGAMECLASS.pc.milkRate < 25) kGAMECLASS.pc.milkRate += 5;
					}, true);
				}
				else if(i > 110)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1.5, true);
						if(kGAMECLASS.pc.milkFullness < 10) kGAMECLASS.pc.milkFullness += 15;
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
		
		public static function zilOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			// If possible, go to birth.
			if (!kGAMECLASS.disableExploreEvents())
			{
				var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
				
				var tEventCall:Function = (function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
				{
					return function():void
					{
						// 225-243 Days (Bee Baby)
						kGAMECLASS.zilPregnancyBirthing(c_pregSlot, pData.pregnancyQuantity);
						ZilPregnancyHandler.cleanupPregnancy(c_mother, c_pregSlot, c_thisPtr);
					}
				})(mother, pregSlot, thisPtr);
				
				kGAMECLASS.eventQueue.push(tEventCall);
			}
			// Otherwise, delay pregnancy.
			else mother.pregnancyData[pregSlot].pregnancyIncubation += 24;
		}
		
		public static function cleanupPregnancy(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			ChildManager.addChild(
				Child.NewChildWeights(
					thisPtr.pregnancyChildRace,
					thisPtr.childMaturationMultiplier,
					pData.pregnancyQuantity,
					thisPtr.childGenderWeights
				)
			);
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/zil birthed", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/zil day care", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
			
			cleanupPregnancyEffects(mother, pregSlot);
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
			
			StatTracking.track("pregnancy/zil birthed", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/zil day care", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
			
			cleanupPregnancyEffects(mother, pregSlot);
			
			return c;
		}
		
		public static function cleanupPregnancyEffects(mother:Creature, pregSlot:int):void
		{
			mother.addStatusValue("Zil Pheromones", 1, -1);
			if(mother.statusEffectv1("Zil Pheromones") < 1) mother.setStatusValue("Zil Pheromones", 1, 1);
			mother.addStatusValue("Zil Pregnancy Reflex Mod", 1, -5);
			if(mother.statusEffectv1("Zil Pregnancy Reflex Mod") < 5) mother.setStatusValue("Zil Pregnancy Reflex Mod", 1, 5);
		}
	}
}

