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
	import classes.Engine.Utility.shortMinutes;
	import classes.GameData.ChildManager;
	import classes.GameData.Pregnancy.Child;
	import classes.Engine.Interfaces.AddLogEvent;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Utility.getPlanetName;
	
	/**
	 * This is effectively very similar to the Renvra pregnancy implementation, so I’m copypasting it over
	 * and making a few tweaks here and there to differentiate it some.
	 * @author Gedan
	 */
	public class LapinaraPregnancyHandler extends BasePregnancyHandler
	{
		public function LapinaraPregnancyHandler() 
		{
			_handlesType = "LapinaraPregnancy";
			_basePregnancyIncubationTime = 48320;
			_basePregnancyChance = 1;
			_alwaysImpregnate = true;
			_ignoreInfertility = true;
			_ignoreMotherInfertility = true;
			_ignoreFatherInfertility = true;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = true;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 2;
			_pregnancyQuantityMaximum = 16;
			_definedAverageLoadSize = 1000;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_EGGS;
			_pregnancyChildRace = GLOBAL.TYPE_LAPINARA;
			
			_childGenderWeights.Male = 33;
			_childGenderWeights.Female = 33;
			_childGenderWeights.Intersex = 34;
			
			/*Example: 
			this.addStageProgression(4760, function(pregSlot:int):void {
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				kGAMECLASS.pc.bellyRatingMod += 1 * pData.pregnancyQuantity;
				pData.pregnancyBellyRatingContribution += 1 * pData.pregnancyQuantity;
				
				AddLogEvent("The last couple of days you’ve battled with constant pangs of hunger, despite generally feeling strangely full. You notice that your stomach has developed a bit of a curve.", "passive");
			}, true);
			*/
			this.addStageProgression(45000,function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				var buffer:String = "";
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 2, true);
				// IF LapiTrain == 0 THEN
				if(kGAMECLASS.lapiTrain() == 0)
				{
					buffer = "Your codex beeps at you, and you take the time to read the medical alert informing you that you are pregnant with ";
					if(pData.pregnancyQuantity == 2) buffer += "twins";
					else if(pData.pregnancyQuantity == 4) buffer += "quadruplets";
					else buffer += "sextuplets";
					buffer += ". It answers your lingering question about whether or not you were compatible with that lapinara from before, but also prompts a new one. Why doesn’t the number of babies growing inside you match up with the number of eggs you remember?";
				}
				else
				{
					buffer += "Your codex beeps at you, and you take the time to read the medical alert flashing on it. The news isn’t surprising, it seems you’re pregnant with " + num2Text(pData.pregnancyQuantity) + " lapinara babies. You rub your ever-so-slightly enlarged belly with contentment as you remember your most recent encounter with a futa lapinara. Snapping out of your reverie, you realize you’ve gotten yourself a little worked up.";
					kGAMECLASS.pc.lust(10);
				}
				AddLogEvent(buffer);
			}, true);

			this.addStageProgression(40320,function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				var buffer:String = "";
				var nTime:Number = Math.floor(2880/kGAMECLASS.pc.pregnancyData[pregSlot].pregnancyIncubationMulti);
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
				// IF LapiTrain == 0 THEN
				if(kGAMECLASS.lapiTrain() == 0)
				{
					buffer = "Looking down at your swelling belly, you realize the lapinara inside you are growing much faster than you expected. It’s only been a short time, but you’ve already grown attached to the babies growing inside you. It must be the hormones or something. You have definitely noticed some changes other than the size of your stomach; you are constantly hungry, almost ravenous. It seems your body is demanding more food to support that rapid growth. On top of the hunger, you’ve also been feeling somewhat lethargic. It seems that carrying a lapinara’s young is taxing on your body, and you wonder what else it might do to you.";
				}
				else if(pData.pregnancyQuantity > 6)
				{
					buffer += "Rubbing your belly, you feel a great sense of contentment when you realize that it has grown a good deal bigger in the last " + shortMinutes(nTime, true, false) + ". Having so many young inside you has caused even the early growth of your stomach to be dramatic. You feel glad that you are able to gestate so many at once. Your appetite is positively ravenous, but it doesn’t bother you in the slightest. You know it’s all for the good of your babies, and the changes they’ll be making to you. Of course, you’ve also been feeling somewhat lethargic. You don’t let it discourage you though, because you know it’s part of the changes that will make you into an even better mommy.";
				}
				else
				{
					buffer += "Rubbing your belly, you feel a great sense of contentment when you realize that it has grown a good deal bigger in the last " + shortMinutes(nTime, true, false) + ". You feel a pleasant happiness knowing that your new children are growing so well. Similarly, your increased appetite doesn’t bother you in the slightest; you get to take care of your babies AND eat as much delicious food as you want. You’re used to the lethargy, and you have to admit that the results have been great so far.";
				}
				AddLogEvent(buffer);
			}, true);
			this.addStageProgression(30240,function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				var buffer:String = "";
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 2, true);
				//start hip, butt, bonus capacity increases here.

				buffer += "Rubbing your belly, which has become something of a habit lately, you realize just how much it has ballooned recently. It seems that your belly isn’t the only thing that’s changed recently though.";
				// IF pc.hipRatingRaw < lapipregHipMax(LapiTrain) THEN pc.hipRatingRaw += 1
				if(kGAMECLASS.pc.hipRatingRaw < lapiPregModMax("hip"))
				{
					buffer += " <b>Your hips have widened</b>, giving them more of a swing when you walk.";
					kGAMECLASS.pc.hipRatingRaw++;
				}
				// IF pc.buttRatingRaw < lapipregButtMax(LapiTrain)
				if(kGAMECLASS.pc.buttRatingRaw < lapiPregModMax("ass"))
				{
					kGAMECLASS.pc.buttRatingRaw += 1;
					buffer += " <b>Your butt has gotten larger</b>, adding a little more jiggle to each step you take.";
				}
				/* IF orifice.bonusCapacity < lapipregBCapMax(LapiTrain) THEN bonusCapacity += 10
				It’s hard to tell for sure, but it seems that your abdomen has shifted somewhat. <b>It feels like you could take bigger insertions.</b>*/
				// IF pc.Thickness > 60 THEN pc.Thickness -= 5
				if(kGAMECLASS.pc.thickness > 60)
				{
					buffer += " Despite all the eating you’ve been doing so far during this pregnancy, it seems your body still <b>lost a little weight</b>. You must not’ve been eating enough to keep up.";
					kGAMECLASS.pc.thickness -= 5;
				}
				// IF pc.Thickness < 20 THEN pc.Thickness += 3
				if(kGAMECLASS.pc.thickness < 20)
				{
					buffer += " It seems that eating as much as you have since this pregnancy started has caused you to <b>gain a little weight</b>.";
					kGAMECLASS.pc.thickness += 3;
				}
				// IF playerGender == "M" THEN pc.femininity += 10
				if(kGAMECLASS.pc.femininity > 30 && kGAMECLASS.pc.hasCock() && !kGAMECLASS.pc.hasVagina())
				{
					buffer += " Despite being male, you find yourself appreciating the way <b>your features have become more feminine</b> lately. You look pretty good, if you do say so yourself.";
					kGAMECLASS.pc.modFem(+10);
				}
				// ELSE pc.femininity += 5 END IF
				else
				{
					kGAMECLASS.pc.modFem(+5);
				}
				buffer += "\n\nIn the past, you might’ve been upset about the changes forced upon your body. In your hormonal state, however, you’re blissfully happy that you’re turning into a better incubator. You wonder how much better you’ll be at it by the time this pregnancy is over, and the thought of tracking down another futa lapinara results in a delightful shiver between your " + ParseText(kGAMECLASS.pc.legCount == 1 ? "[pc.thighs]" : "[pc.legs]") + ". Soon your thoughts have drifted, and you’re imagining one of those thick ovipositors pounding away inside you.... You snap out of it with a start, realizing you where you are. With a promise to consider it in private later, you set off again.";
				kGAMECLASS.pc.lust(25)
				AddLogEvent(buffer);
			}, true);
			this.addStageProgression(25260,function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				var buffer:String = "";
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 2, true);
				//The first breast size increase here, but only for smaller chests.
				buffer += "Looking down at your now-sizable belly, you realize just how normal-looking it has become. At first it seemed a little bulgy and unnatural, but as the baby bunnies inside you have grown, the shape leveled out and now you look like any other expectant mother.";
				//IF playerGender = "M"
				if(kGAMECLASS.pc.mf("m","") == "m" && kGAMECLASS.pc.femininity < kGAMECLASS.pc.femininityMax())
				{
					kGAMECLASS.pc.modFem(15);
					buffer += " Well as much as a male can look like an expectant mother, anyways. You have to admit though, this pregnancy thing isn’t all bad.";
				}
				// IF pregnancyQuantity > 8 THEN
				if(pData.pregnancyQuantity > 8)
				{
					buffer += " Your belly has swollen rather significantly. You know it isn’t time yet, but you look like you’re about to give birth any day now... to triplets.";
				}
				else if(pData.pregnancyQuantity > 4)
				{
					buffer += " Your belly has swollen rather significantly, you’re amazed that you somehow avoided being covered in stretch marks. To a bystander, it’d probably look like you’ll be giving birth shortly, based solely on the size of your tummy.";
				}
				else buffer += " Your tummy is most definitely obvious now, anyone that sees you probably thinks you’re at least six months along.";
				buffer += "\n\nAs usual, your abdominal growth isn’t the only thing changing about you. Your body keeps making steady progress toward the lapinara version of a breeding machine.";
				// IF pc.hipRatingRaw < lapipregHipMax(LapiTrain) THEN pc.hipRatingRaw += 1
				if(kGAMECLASS.pc.hipRatingRaw < lapiPregModMax("hip"))
				{
					buffer += " <b>Your hips have widened</b>, giving them more of a sexy swing when you walk.";
					kGAMECLASS.pc.hipRatingRaw++;
				}
				// IF pc.buttRatingRaw < lapipregButtMax(LapiTrain)
				if(kGAMECLASS.pc.buttRatingRaw < lapiPregModMax("ass"))
				{
					kGAMECLASS.pc.buttRatingRaw += 1;
					buffer += " <b>Your butt has gotten larger</b>, adding a little more jiggle to each step you take.";
				}
				if(kGAMECLASS.pc.thickness > 60)
				{
					buffer += " You’ve kept your ravenous appettite, and if anything you’ve been eating more. Despite all that though, you’ve <b>lost a little weight.</b> You wish you’d spent some of those extra calories on food other than ration bars.";
					kGAMECLASS.pc.thickness -= 5;
				}
				//IF pc.Thickness < 20 THEN pc.Thickness += 3
				if(kGAMECLASS.pc.thickness < 20)
				{
					buffer += " Even though you’ve gotten plenty of exercise, and haven’t gone TOO crazy eating, you’ve still <b>gained a little weight.</b>";
					kGAMECLASS.pc.thickness += 3;
				}
				if(kGAMECLASS.pc.breastRows[0].breastRatingRaw < 1)
				{
					buffer += " The pregnancy even <b>caused you to grow a set of breasts.</b> They aren’t too big, but they’re definitely noticeable... You could fill an A-cup bra, and bet they’re only going to get bigger. Maybe it’s time to start looking into a bra?";
					kGAMECLASS.pc.breastRows[0].breastRatingRaw = 1;
				}
				if(kGAMECLASS.pc.breastRows[0].breastRatingRaw < lapiPregModMax("chest"))
				{
					for(var i:int = 0; i < kGAMECLASS.pc.bRows(); i++)
					{
						kGAMECLASS.pc.breastRows[i].breastRatingRaw++;
					}
					buffer += " <b>Your breasts have grown bigger,</b> likely due to the hormones. Whatever the reason, you’re carrying around " + kGAMECLASS.pc.breastCup(0) + "s now.";
				}
				buffer += "\n\nThat happy feeling the babies have been pumping into your bloodstream hasn’t diminished at all.";
				if(kGAMECLASS.lapiTrain() > 2) buffer += " Frankly, you love it. Everything is so much better, even the scary or unpleasant things are easier for you to handle now. Life seems so much better, you can’t help but love the baby bunnies inside you. It’s enough to make you seriously wonder what the point of galavanting around the galaxy is, when you know how good your life could be staying put on Tarkus.";
				else if(kGAMECLASS.lapiTrain() > 0) buffer += " You’re truly glad that they haven’t, you really like the way it makes you feel. Everything is so much better, even the scary or unpleasant things are easier for you to handle now. Life seems so much better, you can’t help but start loving the baby bunnies inside you.";
				else buffer += " As easy as it is to object to something playing with your brain this way, on an emotional level you can’t help but feel good about it. It might be caused by hormones or whatever else, but the fact is that it has made life so much more enjoyable than it used to be.";
				AddLogEvent(buffer);
			}, true);
			this.addStageProgression(20160,function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				var buffer:String = "";
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 2, true);
				
				//The second breast size increase here, early lactation. (fill, not production)
				if(kGAMECLASS.lapiTrain() == 0) buffer += "For the last couple days, you haven’t thought much about the pregnancy; the whole thing started feeling like it was perfectly natural. You’ve even been happily toting your swollen belly around without complaint. When you caught yourself talking to your belly earlier though, it was strange enough to snap you out of it. Taking a hard look at yourself, you feel pretty happy about the way your body has been changing.";
				else buffer += ParseText("While you were carrying on a one-sided conversation with your tummy-bound babies, you asked how they liked it in mommy’s tummy. That got you thinking, realizing your body should have gotten even nicer lately. Giving yourself a once-over, you scrutinize your [pc.race] body and are happy to see that it had indeed changed for the better.");
				
				// IF pc.hipRatingRaw < lapipregHipMax(LapiTrain) THEN pc.hipRatingRaw += 1
				if(kGAMECLASS.pc.hipRatingRaw < lapiPregModMax("hip"))
				{
					buffer += " <b>Your hips have widened</b>, giving them more of a swing when you walk.";
					kGAMECLASS.pc.hipRatingRaw++;
				}
				//IF pc.buttRatingRaw < lapipregButtMax(LapiTrain)
				if(kGAMECLASS.pc.buttRatingRaw < lapiPregModMax("ass"))
				{
					kGAMECLASS.pc.buttRatingRaw += 1;
					buffer += " <b>Your butt has gotten larger</b>, adding a little more jiggle to each step you take.";
				}
				if(kGAMECLASS.pc.breastRows[0].breastRatingRaw < lapiPregModMax("chest"))
				{
					for(var i:int = 0; i < kGAMECLASS.pc.bRows(); i++)
					{
						kGAMECLASS.pc.breastRows[i].breastRatingRaw++;
					}
					buffer += " <b>Your breasts have grown bigger,</b> likely due to the hormones. Whatever the reason, you’re carrying around " + kGAMECLASS.pc.breastCup(0) + "s now.";
				}
				// IF pc.milkRate == 0 THEN pc.milkFullness = 15
				if(kGAMECLASS.pc.milkMultiplier < 40)
				{
					kGAMECLASS.pc.milkMultiplier = 40;
					buffer += ParseText(" A drip of wetness earlier from your [pc.nipples] made you realize that <b>your [pc.breasts] are gearing up to start producing milk.</b>");
				}
				buffer += "\n\nThings just keep getting better and better. Thinking about your sexy body has gotten you a little worked up, and you start imagining getting knocked up again after these babies are born. You wonder if maybe you shouldn’t hunt down another lapinara... these little guys inside you have been great so far!";
				kGAMECLASS.pc.lust(10);
				AddLogEvent(buffer);
			}, true);
			this.addStageProgression(16000,function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				var buffer:String = "";
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
				
				buffer += "Your belly keeps on growing, swelling more and more each day. The best part is feeling the kicks and bumps from your babies; you’ve even started being able to tell them apart based on how rowdy they are. They’ve started taking on their own personalities in your mind, and you keep thinking about what the right name for each of them is. Of course, your body has been changing as well, and you can’t help to admire the changes.";
				// IF pc.hipRatingRaw < lapipregHipMax(LapiTrain) THEN pc.hipRatingRaw += 1
				if(kGAMECLASS.pc.hipRatingRaw < lapiPregModMax("hip"))
				{
					buffer += " <b>Your hips have kept getting wider</b>, each day your gait becomes more seductive than the last.";
					kGAMECLASS.pc.hipRatingRaw++;
				}
				// IF pc.buttRatingRaw < lapipregButtMax(LapiTrain) THEN pc.buttRatingRaw += 1
				if(kGAMECLASS.pc.buttRatingRaw < lapiPregModMax("ass"))
				{
					kGAMECLASS.pc.buttRatingRaw += 1;
					buffer += ParseText(" <b>Your [pc.butt] has gotten larger again</b>; you’ve noticed tabletops getting a little farther away when you sit down.");
				}
				// IF pc.milkRate == 0 THEN pc.milkFullness = 60
				if(kGAMECLASS.pc.milkMultiplier < 49)
				{
					kGAMECLASS.pc.milkFullness += 10;
					kGAMECLASS.pc.milkMultiplier = 49;
					buffer += ParseText(" The [pc.milk] has started dripping out of your [pc.nipples] more regularly. They definitely feel more full, your [pc.breasts] are going to be so sexy when your milk comes in for real.");
				}
				else if(kGAMECLASS.pc.milkFullness < 60)
				{
					kGAMECLASS.pc.milkFullness = 60;
					buffer += ParseText(" Based on your recent boost in milk fullness in your [pc.breasts], it seems like the pregnancy will start enhancing your lactation soon.");
				}
				kGAMECLASS.pc.lust(3);
				AddLogEvent(buffer);
			}, true);
			this.addStageProgression(12960,function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				var buffer:String = "";
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
				
				//First actual lactation increase
				if(kGAMECLASS.pc.milkMultiplier < 70)
				{
					kGAMECLASS.pc.milkFullness += 10;
					kGAMECLASS.pc.milkMultiplier = 70;
					buffer += ParseText("Your [pc.milkyNipples] have been leaking [pc.milk] regularly, <b>you’ve started lactating.</b> It doesn’t seem like much yet, but based on the soreness in your [pc.breasts], you’ll start producing more soon. ");
				}
				else if(kGAMECLASS.pc.milkRate < 10)
				{
					kGAMECLASS.pc.milkFullness += 10;
					kGAMECLASS.pc.milkRate++;
					buffer += ParseText("You’ve noticed an <b>increase in your milk production,</b> your [pc.breasts] swelling with milk even faster than before. The extra production means that your [pc.milkyNipples] are almost never dry. ");
				}
				buffer += "It’s only been a couple days since you last really looked, but your tummy is definitely bigger. Your bunny babies have been even more active lately; they seem to especially like it when mommy has an orgasm.";

				// IF pc.hipRatingRaw < lapipregHipMax(LapiTrain) THEN pc.hipRatingRaw += 1
				if(kGAMECLASS.pc.hipRatingRaw < lapiPregModMax("hip"))
				{
					buffer += ParseText(" It seems nothing will stop your growth, because <b>your [pc.hips] have managed to get even wider.</b> You’ve noticed that the extra room between your legs makes for easier access, which is certainly nice.");
					kGAMECLASS.pc.hipRatingRaw++;
				}
				// IF pc.buttRatingRaw < lapipregButtMax(LapiTrain) THEN pc.buttRatingRaw += 1
				if(kGAMECLASS.pc.buttRatingRaw < lapiPregModMax("ass"))
				{
					kGAMECLASS.pc.buttRatingRaw += 1;
					buffer += ParseText(" <b>Your butt has even more bounce now,</b> and you’ve noticed plenty of stares at your [pc.butt] when you walk away.");
				}
				kGAMECLASS.pc.lust(3);
				AddLogEvent(buffer);
			}, true);
			this.addStageProgression(10080,function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				var buffer:String = "";
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
				
				//Single elasticity increase, lactation increase 
				buffer += ParseText("Your [pc.belly] just keeps on growing. As happy as you are having this rambunctious bunch of bunnies inside you, you are really starting to wonder just how much longer you’ll have to wait in order to meet them. A quick peek at your codex reveals that you have around " + kGAMECLASS.pc.getPregnancyTimeString(pregSlot, true, true) + " left. Realizing just how soon the babies will be born, you do an emotional 180 and feel a bit sad that the pregnancy will be over so much sooner than you thought. Your sadness doesn’t last long though, because you soon remember that all you have to do is go find another bunny to give you eggs.");
				// IF pc.elasticity < lapipregElasticity(LapiTrain) THEN pc.elasticity += 1
				if(kGAMECLASS.pc.elasticity < kGAMECLASS.lapiTrain())
				{
					buffer += "\n\nThings down below seem to have gotten stretchier lately, <b>your genital elasticity has increased</b> for sure. It’s probably to make birth easier, but you can definitely think of some other fun uses for stretchier genitals. It makes you wonder if other parts of you got stretchier too. If ";
					if(pData.pregnancyQuantity > 1) buffer += num2Text(Math.floor(pData.pregnancyQuantity/2)) + " eggs";
					else buffer += "one egg has";
					buffer += " been this this much fun, how much more fun would it be if you had a few more?";
					kGAMECLASS.pc.elasticity += (kGAMECLASS.pc.hasPerk("Elasticity") ? 1.5 : 1);
				}
				else
				{
					buffer += "\n\nYou’ve checked to see if there were any extra changes down below, but you don’t find any. You were kind of hoping that you’d get a little more stretchy, if only to make certain you could fit more eggs next time. After all, if ";
					if(pData.pregnancyQuantity > 1) buffer += num2Text(Math.floor(pData.pregnancyQuantity/2)) + " eggs";
					else buffer += "one egg has";
					buffer += " been this this much fun, how much more fun would it be if you had a few more?";
				}
				kGAMECLASS.pc.lust(3);
				AddLogEvent(buffer);
			}, true);
			this.addStageProgression(7200,function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				var buffer:String = "";
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);

				buffer += "Your belly growth seems to have slowed down somewhat, though that isn’t really saying much considering just how fast it was growing before. Your breasts have been sore lately though, ";
				// IF pc.largestBreastRow <= lapipregBoobMax THEN pc.allBreastRows += 1
				if(kGAMECLASS.pc.breastRows[0].breastRatingRaw < lapiPregModMax("chest"))
				{
					for(var i:int = 0; i < kGAMECLASS.pc.bRows(); i++)
					{
						kGAMECLASS.pc.breastRows[i].breastRatingRaw++;
					}
					buffer += "<b>they grew a little larger,</b> and ";
				}
				buffer += ParseText("<b>your milk production has increased</b> to its maximum for this pregnancy. You don’t mind a little soreness if it means you can feed your baby bunnies when the time comes. Besides, these [pc.breasts] of yours that are practically bursting with [pc.milk] might make finding a new lapinara easier.");
				if(kGAMECLASS.pc.milkMultiplier < 100) kGAMECLASS.pc.milkMultiplier = 100;
				kGAMECLASS.pc.milkFullness += 20;
				var oIdx:int = (pregSlot != 3 ? pregSlot : -1);
				if((oIdx >= 0 && kGAMECLASS.pc.vaginas[oIdx].wetnessRaw < 5) || (oIdx < 0 && kGAMECLASS.pc.ass.wetnessRaw < 5))
				{
					if(oIdx >= 0) kGAMECLASS.pc.vaginas[oIdx].wetnessRaw++;
					else kGAMECLASS.pc.ass.wetnessRaw++;
					kGAMECLASS.pc.lust(33);
					kGAMECLASS.pc.libido(1);
					buffer += " <b>Your orifice has gotten wetter,</b> and your last thought was enough to start it dripping again... you feel like maybe you should do something about that.";
				}				
				kGAMECLASS.pc.lust(3);
				AddLogEvent(buffer);
			}, true);
			this.addStageProgression(4320,function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				var buffer:String = "";
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
				
				//Final modification for hips, butt,.
				buffer += "You instinctually know there isn’t much time left before you give birth.";
				// IF not on tarkus THEN
				if(getPlanetName().toLowerCase() != "tarkus") buffer += " You feel a strong desire to head back to Tarkus; it seems like the natural place to give birth, but more importantly you’ll be ready to start hunting for your next eggs as soon as the bunnies are weaned.";
				else buffer += " You’re glad that you’re already on Tarkus; it seems like the natural place to give birth, but more importantly you’ll be ready to start hunting for your next eggs as soon as the bunnies are weaned.";
				// IF pc.hipRatingRaw < lapipregHipMax(LapiTrain) THEN pc.hipRatingRaw += 1
				if(kGAMECLASS.pc.hipRatingRaw < lapiPregModMax("hip"))
				{
					buffer += ParseText(" You’re glad that your <b>your [pc.hips] have managed to get even wider,</b> despite being near the end of your pregnancy.");
					kGAMECLASS.pc.hipRatingRaw++;
				}
				// IF pc.buttRatingRaw < lapipregButtMax(LapiTrain) THEN pc.buttRatingRaw += 1
				if(kGAMECLASS.pc.buttRatingRaw < lapiPregModMax("ass"))
				{
					kGAMECLASS.pc.buttRatingRaw += 1;
					buffer += ParseText(" <b>Your butt has even more bounce now,</b> and you’ve noticed plenty of stares at your [pc.butt] when you walk away.");
				}
				kGAMECLASS.pc.lust(3);
				AddLogEvent(buffer);
			}, true);
			this.addStageProgression(600,function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				var buffer:String = "";
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
				
				buffer += ParseText("Your [pc.belly] has been feeling strange; you’ve been getting some cramps, and things seem to be shifting around inside you.");
				if(kGAMECLASS.lapiTrain() > 0) buffer += " You know this means that you’ll be giving birth soon, and that you should probably make sure everything is ready before the big event.";
				else buffer += " You aren’t certain, but you think this means you’ll be giving birth soon. It’s probably a good idea to make sure everything is ready....";
				kGAMECLASS.pc.libido(2+rand(2));
				kGAMECLASS.pc.lust(3);
				AddLogEvent(buffer);
			}, true);
			this.addStageProgression(30,function(pregSlot:int):void
			{
				var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
				var buffer:String = "";
				kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, 1, true);
				
				buffer += ParseText("You feel a sudden rush of liquid down your [pc.legOrLegs].");
				if(pData.pregnancyQuantity > 4) buffer += " It’s joined soon after by more sudden gushes, the other eggs seeming to respond to the first.";
				else buffer += " You don’t consider the mess at all, you’re far too busy riding through your first real contraction. As soon as it’s over though, your mind starts racing to make sure everything is ready.";
				AddLogEvent(buffer);
			}, true);
			_onSuccessfulImpregnation = lapinaraOnSuccessfulImpregnation;
			_onSuccessfulImpregnationOutput = lapinaraOnSuccessfulImpregnationOutput;
			_onDurationEnd = lapinaraOnDurationEnd;
		}
		public function lapiPregModMax(part:String = "hip"):Number 
		{
			var arg:int = kGAMECLASS.lapiTrain();
			var hips:Array = [10, 15, 20, 25, 30];
			var ass:Array = [5, 10, 10, 15, 20]; //maximum butt size for increase
			var capacity:Array = [200, 300, 400, 500, 500]; //maximum bonus capacity for orifice
			var boobers:Array = [5, 10, 15, 20, 25]; //maximum breast size for increase
			if(part == "hip" || part == "hips") return hips[arg];
			else if(part == "ass" || part == "butt") return ass[arg];
			else if(part == "capacity") return capacity[arg];
			else if(part == "boobs" || part == "chest" || part == "breast" || part == "breasts") return boobers[arg];
			else return 0;
		}
		
		public static function lapinaraOnSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr);
			//Ignore normal shit. THIS IS FORCED, YO.
			var pData:PregnancyData = (kGAMECLASS.pc as PlayerCharacter).pregnancyData[pregSlot];
			pData.pregnancyQuantity = 2;
			mother.addPregnancyBellyMod(pregSlot, 5, true);
		}
		
		public static function lapinaraOnSuccessfulImpregnationOutput(father:Creature, mother:Creature, thisPtr:BasePregnancyHandler):void
		{
			AddLogEvent("<b>Your belly is swollen with lapinara eggs, distending your gut as if you were truly pregnant.</b>", "passive");
		}
		public static function lapinaraOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			// Closures.
			var tEventCall:Function = (function(c_mother:Creature, c_pregSlot:int, c_thisPtr:BasePregnancyHandler):Function
			{
				return function():void
				{
					kGAMECLASS.lapinaraBirthinBuhbies(c_pregSlot);
					LapinaraPregnancyHandler.cleanupPregnancy(c_mother, c_pregSlot, c_thisPtr);
				}
			})(mother, pregSlot, thisPtr);
			
			kGAMECLASS.eventQueue.push(tEventCall);
		}
		
		public static function cleanupPregnancy(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			kGAMECLASS.lapinaraTrainingUpdate(pData.pregnancyQuantity);
			ChildManager.addChild(
				Child.NewChildWeights(
					thisPtr.pregnancyChildRace,
					thisPtr.childMaturationMultiplier,
					pData.pregnancyQuantity,
					thisPtr.childGenderWeights
				)
			);
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/lapinara eggs", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
		}
		
		override public function pregBellyFragment(target:Creature, slot:int):String
		{
			var pData:PregnancyData = target.pregnancyData[slot] as PregnancyData;
			if(pData.pregnancyIncubation <= 30) return "Your water has broken! You’re going to give birth any second now!";
			else if(pData.pregnancyIncubation <= 600) return ParseText("With the frequent cramping and discomfort emanating from your [pc.belly], there’s no doubt that you’ll be giving birth very soon.");
			else if(pData.pregnancyIncubation <= 4320) return "There’s not much time left before the lapinara inside you will be birthed. You don’t need a machine to tell you that; you can feel it.";

			else if(pData.pregnancyIncubation <= 10080) return "As you near the end of your lapinara pregnancy, you find yourself getting increasingly emotional. Your Codex estimates one week of gestation remains at average galactic rates. How much of a mess will you be by then?";
			else if(pData.pregnancyIncubation <= 12960) return "You are acutely aware of the lapinara babies inside you, and they seem to be getting more aware as well.";
			else if(pData.pregnancyIncubation <= 16000) return "The lapinara inside you refuse to be ignored, be it because of the changes they’re forcing on your body or the kicks from their little lapine legs.";
			else if(pData.pregnancyIncubation <= 20160) return "Your lapinara babies seem intent on giving you a swollen baby bump, and the alien hormones swimming in your blood are all too happy to adjust the rest of you to match.";
			else if(pData.pregnancyIncubation <= 20160) return "Your lapinara babies seem intent on giving you a swollen baby bump, and the alien hormones swimming in your blood are all too happy to adjust the rest of you to match.";
			else if(pData.pregnancyIncubation <= 20160) return "Your lapinara babies seem intent on giving you a swollen baby bump, and the alien hormones swimming in your blood are all too happy to adjust the rest of you to match.";
			else if(pData.pregnancyIncubation <= 25260) return "Despite the egg-based Lapinara pregnancy you’re toting around, your belly has rounded out enough for it to be indistinguishable from a traditional pregnancy.";
			else if(pData.pregnancyIncubation <= 30240) return "With how fast the lapinara inside you are growing, you find yourself wondering how long it will be until you give birth.";
			else if(pData.pregnancyIncubation <= 40320) return "The lapinara in your belly are growing so fast! You can almost feel your stomach getting bigger by the minute.";
			else if (pData.pregnancyIncubation <= 45000) return "You know from your Codex’s scanners that you are pregnant with the offspring of a parasitic lapinara.";
			else return "You’re definitely pregnant, probably from the lapinara.";
		}		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBirthTimestamp:uint):Child
		{
			kGAMECLASS.lapiPregEndCheck(mother, pregSlot, (useBirthTimestamp - kGAMECLASS.GetGameTimestamp()), true);
			
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			kGAMECLASS.lapinaraTrainingUpdate(pData.pregnancyQuantity);

			var c:Child = Child.NewChildWeights(
				pregnancyChildRace,
				childMaturationMultiplier,
				pData.pregnancyQuantity,
				childGenderWeights
			);
			c.BornTimestamp = useBirthTimestamp;
			
			ChildManager.addChild(c);
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			StatTracking.track("pregnancy/lapinara eggs", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);
			
			pData.reset();
			return c;
		}
	}

}