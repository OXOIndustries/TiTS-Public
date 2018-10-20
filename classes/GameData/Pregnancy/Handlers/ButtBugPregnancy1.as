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
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Interfaces.AddLogEvent;
	import classes.Engine.Interfaces.ExtendLogEvent;
	import classes.StorageClass;
	
	public class ButtBugPregnancy1 extends BasePregnancyHandler
	{
		public function ButtBugPregnancy1() 
		{
			_handlesType = "ButtBugPregnancy1";
			_basePregnancyIncubationTime = 480; // 8 hours
			_basePregnancyChance = 1;
			_alwaysImpregnate = true;
			_ignoreInfertility = true;
			_ignoreMotherInfertility = true;
			_ignoreFatherInfertility = true;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = true;
			_canImpregnateVagina = false;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 1;
			_pregnancyQuantityMaximum = 1;
			_definedAverageLoadSize = 400;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_EGGS;
			
			// Overproductive female: Continuously implants eggs(keeps you pregnant) until a male fertilizes them, increase anal looseness by 2 after laying. Initial stage preg bloats you by 1 and expands you by 1 every week. Gives a week of rest time before it starts laying eggs again.
			
			_onSuccessfulImpregnation = buttBugOnSuccessfulImpregnation1;
			_onDurationEnd = buttBugOnDurationEnd1;
		}
		
		// Over productive female starting point:
		// Egg laying cycle starts, permanent until unfertilized expulsion or fertilized laying.
		// Egg laying cycle begins after a day of parasitization or laying eggs.
		// Create integer "OPBBE", stands for overproductive butt bug eggs.
		public static function buttBugOnSuccessfulImpregnation1(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			if(!mother.hasPerk("Butt Bug Symbiosis")) pData.pregnancyIncubationMulti = 1;
			var addRating:int = 1;
			pData.pregnancyBellyRatingContribution += addRating;
			mother.bellyRatingMod += addRating;
			
			mother.lust(50);
			
			var txt:String = "";
			txt += "A strange vibratory sensation emanates from your anal cavity as the hilinara parasite inside your ass undulates to some unheard beat. You feel the tips of her four tendrils creeping their way up your rectum for a few inches before returning to the parasite.";
			txt += "\n\nShe expands, her nubby surface scraping at your anal walls and";
			if(mother.isHerm()) txt += " kickstarts a cascade of stimulative need. The parasite’s stimulation spreads from your anus to your labia, and all the way up to the tip of your cockhead" + ((mother.cocks.length == 1 && !mother.cocks[0].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED)) ? "" : "s") + ". Your genitals throb and drip with newfound need while they make a mess of your groin";
			else if(mother.hasCock()) txt += " stimulating your prostate and has your cock" + (mother.cocks.length == 1 ? "" : "s") + " jump to attention. [pc.CumColor] pre leaks from your cock tip" + ((mother.cocks.length == 1 && !mother.cocks[0].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED)) ? "" : "s") + ", dripping down your shaft to really make a mess of your groin";
			else if(mother.hasVagina()) txt += " has you rub your legs together at the sensation of it. [pc.girlCumColor] drips from your womanly folds as your anal tenant makes you crave more stimulation";
			else txt += " tickles you in a delightful way. A giggle escapes your [pc.lips] whenever the sensations get a little too intense";
			txt += ".";
			txt += "\n\nThe female expands more as her widest point shifts further inside you. Her orifice opens up to deposit what feels like a baseball sized rounded object into you. A small ‘ooh’ escapes your throat as a warm liquid is squirted up your gut to fill in the space around what you’ve surmised to be her egg. She uses one of her tentacles to make sure the egg is well situated, unintentionally stimulating you by rubbing your insides. Her tendrils disappear into her once more while she slows down her undulation until her activity grinds to a halt.";
			txt += "\n\nApparently done for now, she leaves you with an egg in your [pc.belly] and your needs unattended. You have a feeling that there will be loads more eggs to come. She must be using her link to you to give some form of hint as to her intentions... this might get messy.";
			
			AddLogEvent(ParseText(txt), "passive");
			
			//Set OPBBE to 1
		}
		
		// Over productive female Progression message:
		// Lays more or less three eggs per day, the limit corresponds with how much the character can carry and once reached will result in medical intervention(scene located right after fertilized laying scene of overproductive female). Not sure how it is calculated though, some insight would be nice. Each egg is about a pound/half kilogram btw.
		// every 8 hours
		public static function buttBugOnDurationEnd1(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			// Ends via time if cycle is not active or eggs have been fertilized
			if(mother.statusEffectv1("Butt Bug Egg Cycle") == 0 || mother.statusEffectv2("Butt Bug (Female)") > 0)
			{
				var tEventCall:Function = (function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
				{
					return function():void
					{
						if(c_mother.statusEffectv2("Butt Bug (Female)") > 0) kGAMECLASS.birthButtBugType1(c_mother.pregnancyData[c_pregSlot].pregnancyQuantity);
						else kGAMECLASS.expelButtBugEgg(c_mother.pregnancyData[c_pregSlot].pregnancyQuantity);
						ButtBugPregnancy1.cleanupPregnancy(c_mother, c_pregSlot, c_thisPtr);
					}
				})(mother, pregSlot, thisPtr);
				
				kGAMECLASS.eventQueue.push(tEventCall);
			}
			// Set OPBBE to [OPBBE + 1]
			else buttBugAddEggs1(mother, pregSlot, 1);
		}
		
		public static function buttBugAddEggs1(mother:Creature, pregSlot:int, eggs:int = 1):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			pData.pregnancyQuantity += eggs;
			var addRating:int = (eggs * 1);
			pData.pregnancyBellyRatingContribution += addRating;
			mother.bellyRatingMod += addRating;
			var eggCycleEffect:StorageClass = mother.getStatusEffect("Butt Bug Egg Cycle");
			
			var txt:String = "";
			txt += "You emit a brief moan as your butt bug squirts another load of her warm slimy liquid into your gut. Her tendrils deploy inside you again as she prepares to lay another egg. This time, instead of simply making space, she pushes the previous egg further along your intestines while the bulge in your [pc.belly] visibly shifts around. She expands like she did the first time to deposit another one of her eggs to join those already in you. Her center of mass moves deeper into your digestive tract and stretches your anal passage in the process.";
			txt += "\n\nJust like the first time, her movements stimulate you in all kinds of interesting ways whenever her nubby surfaces rub along your anal walls. Unable to resist, you drop your [pc.gear].";
			if(mother.exhibitionism() < 66) txt += " You are a bit nervous about someone seeing you but this simply cannot wait";
			else txt += " You don’t even care if someone sees you";
			txt += ". One hand finds its way to your [pc.belly] and sensually rubs its surface while your other hand";
			if(mother.isHerm()) txt += " rubs its palm along the underside of your cock" + (mother.cocks.length == 1 ? "" : "s") + " as your digits dig into your vaginal lips";
			else if(mother.hasCock()) txt += " grips and strokes " + (mother.cocks.length == 1 ? "your cock" : "one of your cocks");
			else if(mother.hasVagina()) txt += " fingers " + (mother.vaginas.length == 1 ? "your cunt" : "one of your cunts");
			else txt += " slips a single digit into the orifice of your anal parasite. Her nerve link provides you all the sensual feedback she feels. If you didn’t know any better you’d think you were fingering a vagina you don’t have yet still feel";
			txt += ".";
			if(eggs > 1) txt += "\n\nWith the time that has passed, she eventually slots in " + (eggs == 2 ? "one more egg" : (num2Text(eggs - 1) + " more eggs")) + " into your behind...";
			txt += "\n\nYour hips buck as her newest egg plops out into you to join the rest. A miniature orgasm rolls through you while your butt bug winds down her activities and your hand";
			if(mother.isHerm()) txt += " gets covered in both [pc.cum] and [pc.girlCum]";
			else if(mother.hasCock()) txt += " is covered in tiny spurts of [pc.cum]";
			else if(mother.hasVagina()) txt += " acquires a thin lamination of [pc.girlCum]";
			else txt += " gets covered in a thin layer of the female’s slime";
			txt += ". Satisfied slightly but not completely, you redress in your [pc.gear] and continue your day with an extra egg bulging out your gut.";
			
			AddLogEvent(ParseText(txt), "passive");
			
			mother.orgasm();
			mother.lust(50);
			
			// reset egg timer
			if(eggCycleEffect != null) eggCycleEffect.value2 = 0;
			
			pData.pregnancyIncubation += 480;
		}
		
		public static function cleanupPregnancy(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			mother.setStatusValue("Butt Bug (Female)", 2, 0);
			
			pData.reset();
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBirthTimestamp:uint):Child
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			var buttBugF:StorageClass = mother.getStatusEffect("Butt Bug (Female)");
			var eggs:int = pData.pregnancyQuantity;
			
			kGAMECLASS.trackButtBugEggs(buttBugF, (buttBugF.value2 == 1 ? "type1" : "infertile"), eggs);
			
			ButtBugPregnancy1.cleanupPregnancy(mother, pregSlot, this);
			return null;
		}
	}
}