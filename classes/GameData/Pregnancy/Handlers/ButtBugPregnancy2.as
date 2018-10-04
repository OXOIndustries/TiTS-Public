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
	
	public class ButtBugPregnancy2 extends BasePregnancyHandler
	{
		public function ButtBugPregnancy2() 
		{
			_handlesType = "ButtBugPregnancy2";
			_basePregnancyIncubationTime = (3 * 30 * 24 * 60); // 3 months
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
			
			// Large female: lays 1 large egg which stays inside you for 3 months, during this time it absorbs genetic body plan from you which causes the child to be an insectoid humanoid and eventually is laid to produce sand worm hybrids who are interactable in the nursery to some extent (nothing sexy planned yet). Increase anal looseness by 3 after lay.
			// per day
			for (var i:int = 90; i >= 0; i--)
			{
				// Large female Almost done message:
				// replaces the progression message for the week before pregnancy ends.
				if(i == 7)
				{
					this.addStageProgression((i * 24 * 60), function(pregSlot:int):void
					{
						var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
						var addRating:int = (pData.pregnancyQuantity * 0.3);
						pData.pregnancyBellyRatingContribution += addRating;
						kGAMECLASS.pc.bellyRatingMod += addRating;
						
						AddLogEvent(ParseText("With your belly stretched taut over the surface of the egg that gestates within you, you can’t help but wonder when it’ll be ready to be lain. One has to wonder though, how exactly is something this large going to be passed through something as small as your rectum? It can’t be that difficult as it currently sits within your stretched out lower intestine right now. Surely the rest of you will be able to accommodate its width as well. Only time will tell, and your newly acquired motherly instincts tell you the time for laying will soon be upon you."), "passive");
					}, true);
				}
				// Large female Progression message:
				// once every week after pregnancy starts
				else if(i % 7 == 0)
				{
					this.addStageProgression((i * 24 * 60), function(pregSlot:int):void
					{
						var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
						var addRating:int = (pData.pregnancyQuantity * 0.3);
						pData.pregnancyBellyRatingContribution += addRating;
						kGAMECLASS.pc.bellyRatingMod += addRating;
						
						var sTime:String = "day";
						var nTime:Number = (10080/pData.pregnancyIncubationMulti);
						if(nTime < 1440) sTime = "hour";
						if(nTime < 60) sTime = "minute";
						
						AddLogEvent(ParseText("The large parasite egg in your [pc.belly] is growing nicely. Each " + sTime + " it gestates in your body distends your abdomen more and more. It grows slowly enough that most people wouldn’t even give you a second glance. Some individuals have even asked you who the father is or if they can rub your belly. Naturally you can’t really give them a straight answer given the nature of your pregnancy. You do however allow them the occasional rub, and even lead them around bushes with dead end hints about the father. Hopefully people don’t figure out just what you are carrying in your gut. Sometimes you feel the female’s tendrils shift about around the egg as she does whatever she’s doing in your digestive tract. She must be trying to keep it clean, or maybe making sure that your system can still work fine despite the large object in the way."), "passive");
					}, true);
				}
				// Stealth grow
				else
				{
					this.addStageProgression((i * 24 * 60), function(pregSlot:int):void
					{
						var pData:PregnancyData = kGAMECLASS.pc.pregnancyData[pregSlot];
						var addRating:int = (pData.pregnancyQuantity * 0.3);
						pData.pregnancyBellyRatingContribution += addRating;
						kGAMECLASS.pc.bellyRatingMod += addRating;
					}, true);
				}
			}
			
			_onSuccessfulImpregnation = buttBugOnSuccessfulImpregnation2;
			_onDurationEnd = buttBugOnDurationEnd2;
		}
		
		// Large female Fertilized starting point:
		// An hour after being fertilized by butt bug male.
		// Large female laying an egg inside the pc
		public static function buttBugOnSuccessfulImpregnation2(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			if(!mother.hasPerk("Butt Bug Symbiosis")) pData.pregnancyIncubationMulti = 1;
			var addRating:int = (pData.pregnancyQuantity * 2);
			pData.pregnancyBellyRatingContribution += addRating;
			mother.bellyRatingMod += addRating;
			
			mother.lust(50);
			
			var txt:String = "";
			txt += "Given your anal parasite’s size, any sort of movement usually grabs your attention straight away, but this really has you gripping your abdomen. She compacts her front and back so that her sides push further out to stretch your anal walls while you groan at her movements. Some small relief finds you as she extends herself further within you and squirts large volume of her slime into your lower intestine. The main mass of the parasite moves deeper into you while the tips of her tendrils are felt poking out of her. Even though she moves, her ass-like orifice still sticks out of your own asshole. It feels like they’re holding something within their tentacular grasp, but all you know is that the female herself feels lighter as a spherical object moves out of her.";
			txt += "\n\nHer tendrils and their large spheroid cargo plop out of the female while their mass displaces her injected slime further into you. Groans leak from your mouth when the female parasite pushes what you’ve assumed to be her egg further up your rectum. Her efforts at pushing the egg inside you cause it to bulge out your [pc.belly] with its curved surface and the tendrils that surround it. The slime she squirted into you moves around the egg as she does so, not stopping until the semi-fluid completely encapsulates your new rotund passenger.";
			txt += "\n\nAs she deposits her offspring, your hilinara parasite seems to alter your emotions. Regardless of your prior feelings, a sense of swelling pride fills your being and even puts a smile on your face. The female’s tendrils retract from the egg, rubbing your tract’s walls as they disappear into your parasite once more. The way the egg slightly rounds your [pc.belly] reminds you of a human woman in her first month of pregnancy.";
			txt += "\n\nYou catch yourself thinking about how your stomach will grow along with this new passenger within you, and your hand subconsciously rubs at your [pc.belly] surface. Some part of you worries about just how much control your anal parasite has over you, but for now you just bask in this glowing sensation of motherhood. It might not entirely be your child, but you do feel happy for it in some way. With an egg in your gut and a new parasite-influenced look on life, you resume your previous task with no further delay.";
			
			AddLogEvent(ParseText(txt), "passive");
		}
		
		public static function buttBugOnDurationEnd2(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			var tEventCall:Function = (function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
			{
				return function():void
				{
					if(c_mother.statusEffectv2("Butt Bug (Female)") > 0) kGAMECLASS.birthButtBugType2(c_mother.pregnancyData[c_pregSlot].pregnancyQuantity);
					else kGAMECLASS.expelButtBugEgg(c_mother.pregnancyData[c_pregSlot].pregnancyQuantity);
					ButtBugPregnancy2.cleanupPregnancy(c_mother, c_pregSlot, c_thisPtr);
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
			
			kGAMECLASS.trackButtBugEggs(buttBugF, (buttBugF.value2 == 1 ? "type2" : "infertile"), eggs);
			
			ButtBugPregnancy2.cleanupPregnancy(mother, pregSlot, this);
			return null;
		}
	}
}