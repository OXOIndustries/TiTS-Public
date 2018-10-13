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
	import classes.Engine.Interfaces.AddLogEvent;
	import classes.Engine.Interfaces.ExtendLogEvent;
	import classes.StorageClass;
	
	public class ButtBugPregnancy0 extends BasePregnancyHandler
	{
		public function ButtBugPregnancy0() 
		{
			_handlesType = "ButtBugPregnancy0";
			_basePregnancyIncubationTime = (7 * 24 * 60); // 1 week
			_basePregnancyChance = 1;
			_alwaysImpregnate = true;
			_ignoreInfertility = true;
			_ignoreMotherInfertility = true;
			_ignoreFatherInfertility = true;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = true;
			_canImpregnateVagina = false;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 15;
			_pregnancyQuantityMaximum = 15;
			_definedAverageLoadSize = 400;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_EGGS;
			
			// Normal female: lmplants eggs, gestate for a week and increase anal looseness by 2 after laying. Initial stage preg bloats you by 1 and expands you by 2 each pregnancy stage.
			// per hour
			for (var i:int = 168; i > 0; i--)
			{
				// Normal female Almost done message:
				// replaces the progression message of the sixth day after initial starting point.
				if(i == 24)
				{
					this.addStageProgression((i * 60), function(pregSlot:int):void
					{
						var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
						var addRating:int = (pData.pregnancyQuantity * 0.06);
						pData.pregnancyBellyRatingContribution += addRating;
						kGAMECLASS.pc.bellyRatingMod += addRating;
						
						AddLogEvent(ParseText("Due to the eggs’ fast growth, you often catch yourself worrying about stretch marks. Then you you remember that your microsurgeons will keep you safe from the majority of such damages. [pc.Belly] stretched tight around the eggs, definite rounded bumps are visible through your [pc.skinFurScales]. The eggs might be approaching their time to be laid, judging by the amount of activity in them. Occasionally you find yourself thinking about Tarkus and its sandy regions as you massage your belly, though you usually stop yourself before you daydream too much. Sand isn’t something you usually devote much thought to, so you figure that the parasite must be influencing your thoughts in order to ensure that you lay the eggs near soft ground."), "passive");
					}, true);
				}
				// Normal female Progression message:
				// every 24 hours
				else if(i % 24 == 0)
				{
					this.addStageProgression((i * 60), function(pregSlot:int):void
					{
						var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
						var addRating:int = (pData.pregnancyQuantity * 0.06);
						pData.pregnancyBellyRatingContribution += addRating;
						kGAMECLASS.pc.bellyRatingMod += addRating;
						
						var sTime:String = "day";
						var nTime:Number = (1440/pData.pregnancyIncubationMulti);
						if(nTime < 1440) sTime = "hour";
						if(nTime < 60) sTime = "minute";
						
						AddLogEvent(ParseText("The eggs inside you have noticeably grown, stretching your belly more and more taut. They distort your belly to look like a slightly bumpy dome, which makes their egg-like nature more noticeable with each passing " + sTime + ". Each egg grows and bulges out your abdomen just a bit more" + (nTime >= 1440 ? " than yesterday" : "") + " and adds to the weight of your [pc.belly]. The fluid that was laid with the eggs helps round things out a bit, but you can’t help but wonder if people are gossiping about your slightly bumpy pregnant belly."), "passive");
					}, true);
				}
				// Stealth grow
				else if(i % 6 == 0)
				{
					this.addStageProgression((i * 60), function(pregSlot:int):void
					{
						var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
						var addRating:int = (pData.pregnancyQuantity * 0.06);
						pData.pregnancyBellyRatingContribution += addRating;
						kGAMECLASS.pc.bellyRatingMod += addRating;
					}, true);
				}
			}
			
			_onSuccessfulImpregnation = buttBugOnSuccessfulImpregnation0;
			_onDurationEnd = buttBugOnDurationEnd0;
		}
		
		// Normal female Fertilized starting point:
		// Normal female laying of eggs inside the pc
		public static function buttBugOnSuccessfulImpregnation0(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			if(!mother.hasPerk("Butt Bug Symbiosis")) pData.pregnancyIncubationMulti = 1;
			var addRating:int = (pData.pregnancyQuantity * 0.06);
			pData.pregnancyBellyRatingContribution += addRating;
			mother.bellyRatingMod += addRating;
			
			mother.lust(50);
			
			var txt:String = "";
			txt += "A gurgling sound can be heard from your butt as the hilinara parasite inside your ass squirts some kind of warm liquid into your intestines. It gives you a warm fuzzy sensation as it spreads further up your digestive system. You feel the parasite’s tendrils deploy, tickling you while they travel along the fluid’s path. Their presence in your gut becomes painfully obvious as their form bulges out your abdomen wherever they go. They fill every corner of your tract, not stopping until they reach your stomach. The path they carve leaves more space for the ever-present flow of liquid from the female that now fills your digestive system.";
			txt += "\n\nThe influence from the female’s nerve link on your mind has made you unable to find this situation revolting for the time being. The parasite has even given";
			if(mother.isHerm()) txt += " your cock" + (mother.cocks.length == 1 ? "" : "s") + " a hard on while swelling your vaginal lips with excitement";
			else if(mother.hasCock()) txt += " you quite the hard on";
			else if(mother.hasVagina()) txt += " you a leaky mess between your legs";
			else txt += " you a weird happy high from the stimulation in your gut";
			txt += ".";
			txt += "\n\nYour face contorts a bit as the tentacles slip back into the female from whence they came. Now that space has been made, your anal parasite pumps herself like the bellows of a forge as a small, round object makes it’s way into your warm passage. As she does this a small distortion reminiscent of a pulse can be seen in your lower abdomen. The muscles of your [pc.ass] contract with her rhythm and your hips buck forward along with it. Even her sphincter poking from your own [pc.asshole] spasms with every pump of the bug’s form.";
			txt += "\n\nIt seems the spherical invader was simply the first of many; it gets pushed up your intestines by the presence of several more being pumped out the female. She must be laying her eggs into you. There’s no other explanation for this. Each egg traveling up your gut distends your [pc.belly] ever so slightly as more follow the path of the first, made easy by the earlier efforts of her tendrils.";
			txt += "\n\nFinally the laying slows down when what feels like 15 of her golf ball sized eggs have found their way into your digestive tract. The sensations of the warm fluids and the eggs settling in makes you feel so full, like you just came from an all you can eat buffet. You cradle your slightly distended [pc.belly] not because of discomfort but from contentment. Instinctual feelings of motherhood flow through you while your need for release finally catches up with your mind. She’s made this so enjoyable, yet doesn’t allow you to get off from it. These creatures really need to think more of the needs of their host. Then again, they are parasites, so maybe it can’t be helped.";
			
			AddLogEvent(ParseText(txt), "passive");
		}
		
		public static function buttBugOnDurationEnd0(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			var tEventCall:Function = (function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
			{
				return function():void
				{
					if(c_mother.statusEffectv2("Butt Bug (Female)") > 0) kGAMECLASS.birthButtBugType0(c_mother.pregnancyData[c_pregSlot].pregnancyQuantity);
					else kGAMECLASS.expelButtBugEgg(c_mother.pregnancyData[c_pregSlot].pregnancyQuantity);
					ButtBugPregnancy0.cleanupPregnancy(c_mother, c_pregSlot, c_thisPtr);
				}
			})(mother, pregSlot, thisPtr);
			
			kGAMECLASS.eventQueue.push(tEventCall);
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
			
			kGAMECLASS.trackButtBugEggs(buttBugF, (buttBugF.value2 == 1 ? "type0" : "infertile"), eggs);
			
			ButtBugPregnancy0.cleanupPregnancy(mother, pregSlot, this);
			return null;
		}
	}
}