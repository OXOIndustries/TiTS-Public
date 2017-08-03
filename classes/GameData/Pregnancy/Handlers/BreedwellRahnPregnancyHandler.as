package classes.GameData.Pregnancy.Handlers 
{
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.PregnancyData;
	import classes.kGAMECLASS;
	import classes.GameData.StatTracking;
	import classes.GLOBAL;
	import classes.Engine.Interfaces.ParseText;
	import classes.Engine.Utility.rand;
	import classes.GameData.ChildManager;
	import classes.GameData.Pregnancy.Child;
	import classes.Engine.Interfaces.AddLogEvent;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Utility.getPlanetName;
	
	public class BreedwellRahnPregnancyHandler extends BasePregnancyHandler
	{
		public function BreedwellRahnPregnancyHandler() 
		{
			_handlesType = "RahnPregnancyBreedwell";
			_basePregnancyIncubationTime = 20160; // 14 days
			_basePregnancyChance = 1;
			_alwaysImpregnate = true;
			_ignoreInfertility = true;
			_ignoreMotherInfertility = true;
			_ignoreFatherInfertility = true;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = false;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 2;
			_pregnancyQuantityMaximum = 10;
			_definedAverageLoadSize = 7200;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_EGGS;
			_pregnancyChildRace = GLOBAL.TYPE_RAHN;
			
			_childMaturationMultiplier = 1.0;
			_childGenderWeights.Male = 0;
			_childGenderWeights.Female = 0;
			_childGenderWeights.Intersex = 100;
			_childGenderWeights.Neuter = 0;
			
			// Rahn Pregnancy Texts
			/*
				Notes
				•	Most of this stuff could be repurposed as a generic rahn pregnancy. Flahne XPac yes pls
				•	Two week incubation period
				•	PC birth no. of eggs. 600 credits for each birthed.
			*/
			
			for(var i:int = 20160; i >= 0; i -= 120)
			{
				// 20 hours
				if(i == 18960)
				{
					addStageProgression(i, function(pregSlot:int):void
					{
						var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
						var msg:String = "";
						
						// 2-10 eggs
						if(pData.pregnancyQuantity <= 10)
						{
							msg += "Being swollen with eggs has taken a little getting used to, but the novelty has worn off now and you’ve acclimatized to how it has changed your gait and center of gravity. It helps that rahn ova are soft-shelled; dense, squishy entities that don’t seem to mind sudden changes of movement or you squeezing past stuff. You rub your belly, feeling fuzzy and content.";
						}
						// 12-20 eggs
						else
						{
							msg += "The breeding session has left you utterly stuffed with rahn eggs, forcing you to adopt a waddling gait in order to compensate for the huge bulge you’re sporting. The fact that this is just the beginning of the gestation period sends a shiver through you, and the shiver worms its way right through the many, many rahn young packed densely in your womb, making you moan slightly. It’s like having a stomach full of jelly that refuses to digest. At least you’ve adapted to the weight and bulk you’ve taken on... for now.";
						}
						
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 0.5, true);
						
						AddLogEvent(ParseText(msg));
					}, true);
				}
				// 75 hours
				else if(i == 15360)
				{
					addStageProgression(i, function(pregSlot:int):void
					{
						var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
						var msg:String = "";
						
						msg += "You’ve put on a little weight on your [pc.chest] and the areola of your nipples have spread slightly. Regardless of the alienness of the young in your womb, your body is busily gearing itself up to feed them as if they were your own. It makes your mind wander, pondering exactly what relation these rahn are to you. Technically you’re neither father nor mother, the eggs inseminated before they were implanted so zealously up you. The process certainly doesn’t leave you feeling like some anonymous third party, though.";
						
						kGAMECLASS.pc.milkFullness += 15;
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 0.5, true);
						
						AddLogEvent(ParseText(msg));
					}, true);
				}
				// 5 days
				else if(i == 12960)
				{
					addStageProgression(i, function(pregSlot:int):void
					{
						var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
						var msg:String = "";
						
						msg += "The dense weight in your womb feels more settled now, less like you’re attached to a washing machine full of jelly and more... implanted. A peaceful warmth throbbing through you has replaced the panic that edged you earlier, and you go about your business with a complacent smile on your [pc.lips].";
						
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 0.5, true);
						
						AddLogEvent(ParseText(msg));
					}, true);
				}
				// 7 days
				else if(i == 10080)
				{
					addStageProgression(i, function(pregSlot:int):void
					{
						var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
						var msg:String = "";
						
						msg += "You gasp slightly as a small shiver trembles through your [pc.belly], a finger flick against the inside of your womb, followed by an odd melting, dragging feeling. It’s followed a few seconds later by another";
						if(pData.pregnancyQuantity > 2) msg += ", and another, and another";
						if(pData.pregnancyQuantity <= 10) msg += ".";
						else msg += ", and another, and another... Void, it feels like somebody’s playing a xylophone in there!";
						msg += "\n\nAre you giving birth...? No - there’s no pressure, no deep urge to bear down. Just a certain intimation that things have changed inside you. Very odd.";
						
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 0.5, true);
						
						AddLogEvent(ParseText(msg));
					}, true);
				}
				// 7 days + 1-3 hours
				else if(i == 9960)
				{
					addStageProgression(i, function(pregSlot:int):void
					{
						var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
						var msg:String = "";
						
						msg += "A multi-colored slop is";
						if(kGAMECLASS.pc.isCrotchGarbed()) msg += " staining your [pc.lowerUndergarments]";
						else msg += " running down your [pc.thigh]";
						msg += ", issuing in a steady drool from your [pc.vagina " + pregSlot + "]. So you can make a decent guess what all the fuss was about a few hours earlier - the eggs inside of you have hatched, rahn ova now rahn young. And you’re oozing the rainbow remains of their shells and albumen. Great.";
						
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 0.5, true);
						// Soaked in female juices status
						kGAMECLASS.applyPussyDrenched(kGAMECLASS.pc);
						
						AddLogEvent(ParseText(msg));
					}, true);
				}
				// 7 days + 20-24 hours
				else if(i == 8760)
				{
					addStageProgression(i, function(pregSlot:int):void
					{
						var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
						var msg:String = "";
						
						// >10 eggs only
						if(pData.pregnancyQuantity > 10)
						{
							msg += "When is your [pc.vagina " + pregSlot + "] going to stop making like a candy faucet?! The sweet-smelling goo that keeps trickling past your pussy lips slows every so often, and you think maybe that’s it - and then another brightly-colored gush warms your [pc.thighs]. It’s not as if it’s making your midriff feel any less stuffed, either. The jelly babies packed tightly in there seem perfectly content where they are right now. You’re just going to have to live with the feeling of being a soft, leaking blancmange generator.";
							// Soaked in female juices status
							kGAMECLASS.applyPussyDrenched(kGAMECLASS.pc);
						
							AddLogEvent(ParseText(msg));
						}
						
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 0.5, true);
					}, true);
				}
				// 9 days
				else if(i == 7200)
				{
					addStageProgression(i, function(pregSlot:int):void
					{
						var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
						var msg:String = "";
						
						msg += "Things seem to have settled down again inside your packed, rounded belly - you aren’t leaking multi-colored juices anymore, anyway. You simmer in soft, self-possessed relaxation, perfectly content with being a rahn breeder. It’s strange to think of the number of them that are tucked away within you - if they were human babies this would surely be " + (pData.pregnancyQuantity <= 10 ? "much more exhausting" :  "intolerable") + ". Even in utero the rahn are an incredibly pliant and adaptable race";
						if(pData.pregnancyQuantity > 10) msg += ", able to make full use of your well-trained womb";
						msg += ". You rub your midriff with long, circular sweeps of your hands, sighing happily.";
						
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 0.5, true);
						
						AddLogEvent(ParseText(msg));
					}, true);
				}
				// 12 days
				else if(i == 2880)
				{
					addStageProgression(i, function(pregSlot:int):void
					{
						var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
						var msg:String = "";
						
						msg += "The [pc.skin] of your stomach is stretching, fast enough for you to notice the change with each passing hour. The eggs inside of you seem to be growing, bulging your body with increasing amounts of life.";
						if(pData.pregnancyQuantity > 10) msg += " It’s just as well they are so soft and pliant. They’re squeezing against each other in your well-trained but increasingly cramped womb, taking up what seems like every square inch of room in your body. Although it’s slightly difficult to feel panic in the swamp of hormones you’re currently sweltering in, your throat tightens a bit when you swell outwards another inch. Presumably your rahn babies won’t just burst out of you... right?";
						
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 0.5, true);
						
						AddLogEvent(ParseText(msg));
					}, true);
				}
				// 14 days - birth!
				
				// Every 2 hours
				else if(i < 10080)
				{
					addStageProgression(i, function(pregSlot:int):void
					{
						kGAMECLASS.pc.milkFullness += 5;
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 0.5, true);
					}, true);
				}
				else
				{
					addStageProgression(i, function(pregSlot:int):void
					{
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 0.5, true);
					}, true);
				}
			}
			
			_onSuccessfulImpregnation = rahnBreedwellOnSuccessfulImpregnation;
			_onSuccessfulImpregnationOutput = rahnBreedwellOnSuccessfulImpregnationOutput;
			_onDurationEnd = rahnBreedwellOnDurationEnd;
		}
		
		public static function rahnBreedwellOnSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
			pData.pregnancyQuantity = 2;
			mother.addPregnancyBellyMod(pregSlot, 5, true);
		}
		
		public static function rahnBreedwellOnSuccessfulImpregnationOutput(father:Creature, mother:Creature, thisPtr:BasePregnancyHandler):void
		{
			AddLogEvent("<b>Your belly is swollen with rahn eggs, distending your gut and giving you a pregnant glow.</b>", "passive");
		}
		public static function rahnBreedwellOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			var tEventCall:Function = (function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
			{
				return function():void
				{
					kGAMECLASS.rahnBreedwellBirthing(c_pregSlot, pData.pregnancyQuantity);
					BreedwellRahnPregnancyHandler.cleanupPregnancy(c_mother, c_pregSlot, c_thisPtr);
				}
			})(mother, pregSlot, thisPtr);
			
			kGAMECLASS.eventQueue.push(tEventCall);
		}
		
		public static function cleanupPregnancy(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			/*
			ChildManager.addChild(
				Child.NewChildWeights(
					thisPtr.pregnancyChildRace,
					thisPtr.childMaturationMultiplier,
					pData.pregnancyQuantity,
					thisPtr.childGenderWeights
				)
			);
			*/
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			/*
			StatTracking.track("pregnancy/rahn eggs/birthed", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/rahn eggs/day care", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			*/
			
			pData.reset();
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBirthTimestamp:uint):Child
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			var c:Child = Child.NewChildWeights(
				pregnancyChildRace,
				childMaturationMultiplier,
				pData.pregnancyQuantity,
				childGenderWeights
			);
			c.BornTimestamp = useBirthTimestamp;
			
			ChildManager.addChild(c);
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/rahn eggs/birthed", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/rahn eggs/day care", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
			return c;
		}
	}

}