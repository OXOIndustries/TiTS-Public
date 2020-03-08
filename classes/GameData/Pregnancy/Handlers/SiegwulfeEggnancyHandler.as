package classes.GameData.Pregnancy.Handlers 
{
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.PregnancyData;
	import classes.Engine.Interfaces.author;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Interfaces.addButton;
	import classes.Engine.Interfaces.clearMenu;
	import classes.Engine.Interfaces.clearOutput;
	import classes.Engine.Interfaces.AddLogEvent;
	import classes.Engine.Interfaces.mainGameMenu;
	import classes.GameData.StatTracking;
	import classes.GameData.Pregnancy.Child;
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	
	public class SiegwulfeEggnancyHandler extends BasePregnancyHandler
	{
		public function SiegwulfeEggnancyHandler() 
		{
			_handlesType = "SiegwulfeEggnancy";
			_basePregnancyIncubationTime = 48*60;
			_basePregnancyChance = 1;
			_alwaysImpregnate = true;
			_ignoreInfertility = true;
			_ignoreMotherInfertility = true;
			_ignoreFatherInfertility = true;
			_allowMultiplePregnancies = false;
			_canImpregnateButt = true;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 6;
			_pregnancyQuantityMaximum = 6;
			_definedAverageLoadSize = 2500;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_EGGS;
			
			_onSuccessfulImpregnation = onImpregnation;
			_onDurationEnd = siegwulfeOnDurationEnd;
			
			var fullBellySize:Number = 5;
			
			this.addStageProgression(12*60, function(pregSlot:int):void
			{
				kGAMECLASS.pc.bellyRatingMod += fullBellySize;
				var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
				pData.pregnancyBellyRatingContribution += fullBellySize;
				
				switch (kGAMECLASS.pc.statusEffectv1("Siegwulfe Eggnancy Stage"))
				{
					case 0:
						AddLogEvent("You feel a peculiar sensation somewhere deep inside yourself, like something is growing. " + (kGAMECLASS.hasSiegwulfeOnSelf() ? "You cast a glance at [wulfe.name], who looks back at you blankly before smiling. " : "Perhaps this is a result of your last coupling with [wulfe.name]. ") + (StatTracking.getStat("pregnancy/siegwulfe eggs laid") > 0 ? "Judging from the feeling in your stomach, it won’t be too long until you find out exactly what you’re going through..." : "She’s probably put another clutch of those eggs inside you..."), "passive");
						break;
					case 1:
						AddLogEvent("You suddenly wince and rub your tummy, feeling the now-familiar sensation of [wulfe.name]’s eggs shifting inside you. You’re going to be laying another clutch of them and <i>soon</i> if these movements are any indication - no doubt she’ll be thrilled to see you cumming your brains out while you deliver her little gifts, and you can’t help but admit you’re looking forward to it yourself. It does feel good, but the real reward is seeing that expression of utterly triumphant ownership on [wulfe.name]’s face while she watches you lose it.", "passive");
						break;
					case 2:
						//Rule 5: Overcomplicate things whenever possible
						if (kGAMECLASS.hasSiegwulfeOnSelf()) kGAMECLASS.eventQueue.push(function ():void
						{
							clearMenu();
							clearOutput();
							kGAMECLASS.showSiegwulfe();
							author("Wsan");
							output("Another hatching is in your near future, you realize, feeling the telltale movement of [wulfe.name]’s eggs inside you. You smile at the mechanical centaur and she tilts her head questioningly, smiling back before her eyes widen slightly in realization.");
							output("\n\n<i>“Another one?”</i> she purrs, nuzzling your cheek as you nod by way of reply. <i>“Such a good [pc.boyGirl]! I can hardly wait to see you writhing and moaning again,”</i> she continues, lowering her head to kiss your neck. <i>“You always make it look so beautifully erotic.”</i>");
							output("\n\n<i>“Thank you, mistress,”</i> you murmur, blushing a little.");
							addButton(0, "Next", mainGameMenu);
						});
						else AddLogEvent("Another hatching is in your near future, you realize, feeling the telltale movement of [wulfe.name]’s eggs inside you. Ideally, you’ll be somewhere nice and liquid-resistant when you do give birth.", "passive");
						break;
					case 3:
					default:
						if (kGAMECLASS.hasSiegwulfeOnSelf()) kGAMECLASS.eventQueue.push(function ():void
						{
							clearMenu();
							clearOutput();
							kGAMECLASS.showSiegwulfe();
							author("Wsan");
							output("<i>“Nnnh,”</i> you moan quietly, a hand drifting to your stomach. There’s more of [wulfe.name]’s eggs on the way, you can already tell. Your tauric companion regards you with a proud smile.");
							output("\n\n<i>“More egg-laying in your future, hmm?”</i> she titters, licking her lips. <i>“I hope you’re used to it by now, [wulfe.pcname]. You’re just so fucking sexy when you moan and cum giving birth to my eggs.”</i> She draws closer, pressing her forehead against yours and lowering her voice to a sultry murmur with a predatory grin. <i>“I’m going to be </i>right<i> back inside you the moment you’re empty, filling you up again. Pounding you full of my cock and emptying myself into you. Mark my words.”</i>");
							output("\n\nApparently happy with having delivered her message, she kisses you on the cheek and prances away with a happy smile, keeping a lookout for potential enemies.");
							addButton(0, "Next", mainGameMenu);
						});
						else AddLogEvent("<i>“Nnnh,”</i> you moan quietly, a hand drifting to your stomach. There’s more of [wulfe.name]’s eggs on the way, you can already tell. You can see her smug smirk in your mind; she <i>really</i> must have given it to you for there to be so many of these things. No doubt she’d be delighted, were she here.", "passive");
						break;
				}
			}, true);
		}
		
		public static function onImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			
			if (mother.hasStatusEffect("Siegwulfe Eggnancy Stage")) mother.addStatusValue("Siegwulfe Eggnancy Stage",1,1);
			else
			{
				mother.createStatusEffect("Siegwulfe Eggnancy Stage");
				mother.pregnancyData[pregSlot].pregnancyIncubation -= 24*60;
			}
		}

		public static function siegwulfeOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot];
			
			//If this is the first birth, go at it.
			if (!mother.hasStatusEffect("Siegwulfe Eggnancy Ends") && !kGAMECLASS.disableExploreEvents())
			{
				// No children fuck y'aaaaaall
				var babies:int = mother.pregnancyData[pregSlot].pregnancyQuantity;
				var belly:int = mother.pregnancyData[pregSlot].pregnancyBellyRatingContribution;
				mother.createStatusEffect("Siegwulfe Eggnancy Ends", babies, belly, pregSlot, mother.statusEffectv1("Siegwulfe Eggnancy Stage"));
				kGAMECLASS.eventQueue.push(kGAMECLASS.siegwulfeLaying);
				mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
				StatTracking.track("pregnancy/siegwulfe eggs laid", pData.pregnancyQuantity);
				pData.reset();

				//Now do it again!
				advanceStage(mother, pregSlot);
			}
			//Delay subsequent births till the first has had time to go off.
			else mother.pregnancyData[pregSlot].pregnancyIncubation += 24;
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBornTimestamp:uint):Child
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			var timeLeft:Number = pData.pregnancyIncubation;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/siegwulfe eggs laid", pData.pregnancyQuantity);

			pData.reset();
			
			//Now do it again!
			advanceStage(mother, pregSlot);
			//Add the time that was spent in the nursery to the next pregnancy too
			mother.pregnancyData[pregSlot].pregnancyIncubation += useBornTimestamp - kGAMECLASS.GetGameTimestamp();

			return null;
		}
		
		public static function advanceStage(mother:Creature, pregSlot:int):void
		{
			if (mother.statusEffectv1("Siegwulfe Eggnancy Stage") >= 3) mother.removeStatusEffect("Siegwulfe Eggnancy Stage");
			else mother.tryKnockUp(kGAMECLASS.wulfe, pregSlot);
		}
	}
}