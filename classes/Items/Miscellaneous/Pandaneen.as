package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Utility.possessive;
	
	public class Pandaneen extends ItemSlotClass
	{
		
		//constructor
		public function Pandaneen()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "Pandaneen";
			//Regular name
			this.longName = "Pandaneen pill";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a black and white pill labeled as ‘Pandaneen’";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This gel capsule is half white, half black and stamped with the word ‘Pandaneen’. Marketed as a cheaper alternative to higher grade splices by Xenogen Biotech, Pandaneen is designed to slowly give the imbiber panda-like features using a variety of microsurgeons and genetic codes. It is guaranteed effective on over 95% of carbon-based life forms with a mortality rate well below one percent.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 1000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = this._latestVersion;
		}
		
		protected function rand(max: Number): Number {
 			return int(Math.random() * max);
 		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var changes:int = 0;
			var changeLimit:int = 1;
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			if(rand(2) == 0) changeLimit++;
			if(rand(3) == 0) changeLimit++;
			if(rand(4) == 0) changeLimit++;
			if(rand(5) == 0) changeLimit++;
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				//Usage text:
				kGAMECLASS.output("You open your mouth and pop the gel capsule inside, swallowing it without much issue.");

				//Stat mods:
				//Decrease reflexes to half of current maximum
				if(target.reflexes() > target.reflexesMax()/2 && rand(3) == 0 && changes < changeLimit)
				{
					//Random!
					if(rand(3) == 0) kGAMECLASS.output("\n\nA slow yawn works its way through your system as you await some changes. Slowly, you raise your hand up to cover your mouth. Have your reflexes slowed?");
					else if(rand(2) == 0) kGAMECLASS.output("\n\nYou steady your posture some, bracing your [pc.legOrLegs] into a comfortable position that you don’t really feel like moving from. You’re pretty sure your reflexes are slowing as a result.");
					else kGAMECLASS.output("\n\nA speck of dust lands in your eye. You didn’t manage to blink until after it touched down. Shit! You spend the next two minutes blinking wildly and trying to remove it. Maybe your reflexes aren’t as good as they used to be.");
					changes++;
					target.reflexes(-1);
				}
				//Increase physique towards 80% of maximum.
				if(target.physique() < target.physiqueMax() * .8 && rand(3) == 0 && changes < changeLimit)
				{
					//Random!
					if(rand(3) == 0) kGAMECLASS.output("\n\nA wave of tightness rolls out from your shoulders and down through every muscle group in your body. In its wake, it leaves behind a physical confidence that can only mean an increase in strength and toughness.");
					else if(rand(2) == 0) kGAMECLASS.output("\n\nYou roll your shoulders as they start to tingle, but it doesn’t make the odd sensation stop. In fact, it spreads down your body like wildfire. Only after your whole body is alight with misfiring nerves does the feeling abate. You seem a bit more solid after, and a little stronger too.");
					else kGAMECLASS.output("\n\nSlight tremors run through the arms and chest, then down your legs. Everywhere they go, you feel a little bit more physically imposing - stronger, tougher, you name it.");
					target.slowStatGain("physique",.5);
					if(rand(2) == 0) target.slowStatGain("physique",.5);
					if(rand(3) == 0) target.slowStatGain("physique",1);
					changes++;
				}
				//Minor mods - 2/3 of the time.
				if(rand(3) <= 1)
				{
					//Increase thickness to 75
					if(target.thickness < 75 && target.thicknessUnlocked(75) && rand(3) == 0 && changes < changeLimit)
					{
						//(Low thickness)
						if(target.thickness <= 30) kGAMECLASS.output("\n\nThe sound of creaking sinews accompanies a slight, stretching pain in the rest of your body. It vanishes as quickly as came on, but you quickly discover that your narrow body has broadened.");
						//(Medium thickness)
						else if(target.thickness <= 65) kGAMECLASS.output("\n\nYou stretch to rid yourself of a knot between your shoulders. It doesn’t really help, but after the sensation passes, your body seems a touch wider.");
						//(High thickness)
						else kGAMECLASS.output("\n\nYour body, already fairly wide, suddenly feels painfully constrained. A second later, your very bones creak as your form broadens again.");
						changes++;
						target.thickness += 5+rand(6);
					}
					else if (!target.thicknessUnlocked(75))
					{
						kGAMECLASS.output(target.thicknessLockedMessage());
					}
					
					//Decrease tone to 30
					if(target.tone >= 30 && target.toneUnlocked(30) && rand(3) == 0 && changes < changeLimit)
					{
						//High tone
						if(target.tone >= 70) kGAMECLASS.output("\n\nStarting on your [pc.belly], your body suddenly produces a fresh layer of fat. It spreads across the toned expanses of your muscles, rendering them less distinct.");
						//Medium Tone
						else if(target.tone >= 40) kGAMECLASS.output("\n\nWith each passing second, you lose a little bit more definition. The change stops soon enough, but not without making you visibly less fit.");
						//Small Tone
						else kGAMECLASS.output("\n\nYour body gets softer and softer as it transforms to become more panda-like. There isn’t really a part of you that isn’t squishy and cuddly at this point.");
						changes++;
						target.tone -= 5 + rand(6);
					}
					else if (!target.toneUnlocked(30))
					{
						kGAMECLASS.output(target.toneLockedMessage());
					}
					
					//Butt increases a little bit to a baseline (higher for cuntwielders)
					//7 for dudes, 9 for gals
					if(((target.buttRatingRaw < 7 && target.buttRatingUnlocked(7)) || (target.buttRatingRaw < 9 && target.hasVagina() && target.buttRatingUnlocked(9))) && rand(3) == 0 && changes < changeLimit)
					{
						if(rand(2) == 0) kGAMECLASS.output("\n\nA slight change in your balance triggers a quick inspection of your body. It looks like your [pc.butt] got bigger.");
						else kGAMECLASS.output("\n\nYou bump your [pc.butt] into something behind you. It didn’t used to be that big.");
						target.buttRatingRaw++;
						changes++;
					}
					
					//Hips increase to a reasonable baseline (higher for cuntwielders)
					if(target.hipRatingRaw < 5 && target.hipRatingUnlocked(5) && rand(3) == 0 && changes < changeLimit)
					{
						if(rand(2) == 0) kGAMECLASS.output("\n\nOne [pc.hip] swells out under your idle fingers while you wait. The other side got bigger as well.");
						else kGAMECLASS.output("\n\nYour [pc.hips] feel a little odd. You immediately check them, and a rough guestimate confirms that they’ve broadened.");
						changes++;
						target.hipRatingRaw++;
					}
					else if (!target.hipRatingUnlocked(5))
					{
						kGAMECLASS.output(target.hipRatingLockedMessage());
					}

					//Minor Sex stuff:
					//Penis-dependent
					if(target.hasCock())
					{
						//Find smallest dick for expansion
						x = target.shortestCockIndex();
						//Dick grows  a quarter inch to a cap of your height in feet * 1.5 (6' tall = 9" dick)
						if(((target.cocks[x].cLengthRaw < target.tallness/12 * 1.5 && target.cockLengthUnlocked(x, target.tallness / 12 * 1.5) && !target.hasPerk("Hung")) || (target.cocks[x].cLengthRaw < target.tallness/12 * 3 && target.cockLengthUnlocked(x, target.tallness / 12 * 3) && target.hasPerk("Hung"))) && rand(3) == 0 && changes < changeLimit)

						{
							//(Alt2 - req's armor or undies)
							if(target.isCrotchGarbed() && rand(2) == 0)
							{
								kGAMECLASS.output("\n\nYour [pc.lowerGarments] abruptly tighten to contain some additional flesh as your [pc.cock " + x + "] erects. It definitely feels bigger than it was before, and a quick measure confirms it. You’re a quarter inch longer!");
							}
							else if(rand(2) == 0) 
							{
								kGAMECLASS.output("\n\nYou feel your [pc.cock " + x + "] abruptly harden. It’s... warm and more than a little wonderful feeling.");
								if(target.isCrotchGarbed()) kGAMECLASS.output(" You peel away your [pc.lowerGarments] to examine it, and i");
								else kGAMECLASS.output(" I");
								kGAMECLASS.output("t’s getting longer! Not by very much, maybe a quarter inch at the most, but it’s definitely bigger.");
							}
							//(Alt)
							else
							{
								kGAMECLASS.output("\n\nPleasant pressure appears ");
								if(!target.hasSheath(x)) kGAMECLASS.output("at the base of your [pc.cock " + x + "]");
								else kGAMECLASS.output("inside your " + possessive(target.cockDescript(x)) + " sheath");
								kGAMECLASS.output(". It’s just enough warning for you to ");
								if(!target.isCrotchGarbed()) kGAMECLASS.output("look down");
								else kGAMECLASS.output("pull open your [pc.lowerGarments]");
								kGAMECLASS.output(" and watch an extra quarter inch of length slide out of your body. You might even be a little thicker to match. It’s tough to tell with such a small change.");
							}
							target.cocks[x].cLengthRaw += .25;
							changes++;
							target.changeLust(4+rand(4));
						}
						else if ((!target.cockLengthUnlocked(x, target.tallness / 12 * 1.5) && !target.hasPerk("Hung")) || (!target.cockLengthUnlocked(x, target.tallness / 12 * 3) && target.hasPerk("Hung")))
						{
							kGAMECLASS.output(target.cockLengthLockedMessage());
						}
						//Find thinnest cock
						x = target.thinnestCockRatioIndex();
						//Dick gets slightly closer to very thick
						if(target.cocks[x].cThicknessRatioRaw < 1.7 && target.cockThicknessUnlocked(x, target.cocks[x].cThicknessRatioRaw + 0.1) && rand(3) == 0 && changes < changeLimit)
						{
							//version 1
							if(rand(2) == 0) kGAMECLASS.output("\n\nSomething tickles at your crotch. You glance around and idly scratch, but it doesn’t go away. A quick check reveals that you’re getting a little bit thicker, that much closer to having a big, fat cock.");
							//version 2
							else kGAMECLASS.output("\n\nStarting slowly, your [pc.cock " + x + "] warms, slowly getting hotter and hotter. You grab hold of it, hefting its warm weight and feeling it thicken in your grip. You get a little girthier over a few moments, then it stops.");
							changes++;
							target.cocks[x].cThicknessRatioRaw += 0.1;
							target.changeLust(5+rand(4));
						}
						
						//Balls swell up to apple sized (rating == 3) (rarely)
						if
						(	target.balls > 0
						&&	((target.ballSizeRaw < 3 && target.ballSizeUnlocked(3) && !target.hasPerk("Bulgy")) || (target.ballSizeRaw < 6 && target.ballSizeUnlocked(6) && target.hasPerk("Bulgy")))
						&&	rand(4) == 0 && changes < changeLimit)
						{
							//Ballsize <= 1
							if(target.ballSizeRaw < 1)
							{
								kGAMECLASS.output("\n\nA groan slips free of your [pc.lips] as something changes down below you. Whatever it is, it feels good. [pc.EachCock] is hard from the sensation alone. You squirm in place as <b>you feel your [pc.sack] stretching with new weight, swelling up to contain your new, ");
								if(target.hasPerk("Bulgy")) 
								{
									kGAMECLASS.output("baseball-sized ball");
									target.ballSizeRaw = 7.85;
								}
								else 
								{
									kGAMECLASS.output("large ball");
									target.ballSizeRaw = 6;
								}
								if(target.balls > 1) kGAMECLASS.output("s");
								kGAMECLASS.output(".</b>");
							}
							//Ballsize == 2
							else
							{
								kGAMECLASS.output("\n\nYou gasp in delight in surprise when you feel the familiar weight of your [pc.balls] surge. Reaching down");
								if(target.isCrotchGarbed()) kGAMECLASS.output(" into your [pc.lowerGarment]");
								kGAMECLASS.output(", you gently rub your swelling sack, enjoying the sheer fullness of it. <b>Your new, ");
								if(target.hasPerk("Bulgy")) 
								{
									kGAMECLASS.output("apple-sized endowment");
									target.ballSizeRaw = 9.5;
								}
								else 
								{
									kGAMECLASS.output("baseball-sized endowment");
									target.ballSizeRaw = 7.85;
								}
								if(target.balls > 1) kGAMECLASS.output("s");
								kGAMECLASS.output(" will be sure to make your orgasms a little more productive.</b>");
							}
							changes++;
							target.changeLust(7+rand(3));
						}
						else if (target.balls > 0 && ((!target.ballSizeUnlocked(3) && !target.hasPerk("Bulgy")) || (!target.ballSizeUnlocked(6) && target.hasPerk("Bulgy"))))
						{
							kGAMECLASS.output(target.ballSizeLockedMessage());
						}
					}
					//Minor Vagina-dependent
					if(target.hasVagina())
					{
						//Breasts grow proportionally to thickness, eventually capping at JJ cup for full-figured gals
						//30 == JJ
						//1 == A
						if(target.thickness * .25 > target.breastRows[0].breastRatingRaw - 1 && target.breastRatingUnlocked(0, target.breastRows[0].breastRatingRaw + 1) && rand(3) == 0 && changes < changeLimit)
						{
							//Get A-cups to start
							if(target.breastRows[0].breastRating() < 1)
							{
								kGAMECLASS.output("\n\nStarting at your [pc.nipples], an irritating sensitivity radiates out across your chest. It gets worse and worse ");
								if(target.isChestGarbed()) kGAMECLASS.output("until you can barely stand the feeling of your [pc.upperGarment] against them");
								else kGAMECLASS.output("until even a slight breeze of air feels like stroking fingers");
								kGAMECLASS.output(". Then, the worrying sensation fades, replaced by a sense of unfamiliar weight. While you watch, <b>your chest swells into a set of A-cup breasts!</b>");
								target.breastRows[0].breastRatingRaw += 1;
							}
							//Jump a cup size 1
							else if(rand(2) == 0)
							{
								kGAMECLASS.output("\n\nYou shift position only to be startled by a heavy jiggle from your chest. Glancing down, you realize that your [pc.chest] have noticeably swollen. They fit your full figure a bit better now.");
								target.breastRows[0].breastRatingRaw++;
							}
							//Jump a cup size 2
							else 
							{
								kGAMECLASS.output("\n\nPleasant warmth rolls over your [pc.chest] like waves massage oil, tingling in all the right ways. You can’t help but heft one and smile at how great they feel. Surprisingly, there’s more weight in your hand than you remember. Your breasts have grown.");
								target.changeLust(3+rand(2));
								target.breastRows[0].breastRatingRaw++;
							}
							changes++;
						}
						else if (!target.breastRatingUnlocked(0, target.breastRows[0].breastRatingRaw + 1))
						{
							kGAMECLASS.output(target.breastRatingLockedMessage());
						}
						
						if(target.hipRatingRaw < 9 && target.hipRatingUnlocked(target.hipRatingRaw + 1) && rand(3) == 0 && changes < changeLimit)
						{
							//Hips grow a fair amount - not to obscene sizes, however
							//1 (no pants only!)
							if(!target.isCrotchGarbed() && rand(2) == 0) kGAMECLASS.output("\n\nThere’s a change so subtle you barely miss it. Your [pc.hips]. They widen ever so slightly, quietly and with so little sensation you almost miss it. You suppose that wearing something down there might have made the difference more apparent.");
							//2 (pants only)
							else if(target.isCrotchGarbed() && rand(2) == 0) kGAMECLASS.output("\n\nYour [pc.lowerGarment] starts to dig into your [pc.hips] as they begin widening. Luckily, the change is slow and subtle enough that you can make adjustments for comfort.");
							//3 (whatevahs)
							else kGAMECLASS.output("\n\nYour idle movements seem a little more awkward and ungaily than you are used to. Slowing down to inspect the way you stand, you realize that your [pc.hips] have widened and compensate accordingly.");
							changes++;
							target.hipRatingRaw++;
						}
						else if (!target.hipRatingUnlocked(target.hipRatingRaw + 1))
						{
							kGAMECLASS.output(target.hipRatingLockedMessage());
						}
					}
				}
				//Major Sex Stuff:
				else
				{
					//Cockstuff:
					if(target.hasCock())
					{
						//Dick grows one to three inches towards previously established pandacap
						//Find smallest dick for expansion
						x = target.shortestCockIndex();
						if(((target.cocks[x].cLengthRaw < target.tallness/12 * 1.5 && target.cockLengthUnlocked(x, target.tallness / 12 * 1.5) && !target.hasPerk("Hung")) || (target.cocks[x].cLengthRaw < target.tallness/12 * 3 && target.cockLengthUnlocked(x, target.tallness / 12 * 3) && target.hasPerk("Hung"))) && rand(2) == 0 && changes < changeLimit)
						{
							y = 1 + rand(3);
							//1
							if(rand(2) == 0)
							{
								kGAMECLASS.output("\n\nSurging out");
								if(target.cockTotal() > 1) kGAMECLASS.output(" of your [pc.cocks]");
								kGAMECLASS.output(", your [pc.cock " + x + "] becomes fully, totally erect... and then some.");
								if(target.isCrotchGarbed()) kGAMECLASS.output(" After pulling open your [pc.lowerGarments], y");
								else kGAMECLASS.output(" Y");
								kGAMECLASS.output("ou look down in awe as the lengthening shaft stretches out a whole inch longer");
								if(y == 2) kGAMECLASS.output(" and then another");
								else if(y > 2) kGAMECLASS.output(" and keeps going");
								kGAMECLASS.output(". It finally stops, softening slightly as its newfound bulk drags it down towards the ground.");
							}
							//2
							else
							{
								kGAMECLASS.output("\n\nA throaty moan of pleasure wells up and out of you as something wonderful starts in between your [pc.thighs].");
								if(target.isCrotchGarbed()) kGAMECLASS.output(" You can’t help but yank open your [pc.lowerGarment] for a peek.");
								else kGAMECLASS.output(" You can’t help but lean down for a good view.");
								kGAMECLASS.output(" [pc.EachCock] has gotten totally erect");
								if(target.cockTotal() > 1) kGAMECLASS.output(", but it’s your [pc.cock " + x + "] specifically that really catches your eye");
								kGAMECLASS.output(". It’s getting longer. You watch in fascination as you gain a full inch of length");
								if(y > 1) kGAMECLASS.output(", and it keeps going");
								kGAMECLASS.output(", not stopping until you’re " + num2Text(Math.round((target.cocks[x].cLength() + y)*10)/10) + " inches long. A pearl of pre-cum slips out of the tip once the change completes, leaving you nicely hung.");
							}
							target.changeLust(5+rand(10));
							target.cocks[x].cLengthRaw += y;
							changes++;
						}
						else if ((!target.cockLengthUnlocked(x, target.tallness / 12 * 1.5) && !target.hasPerk("Hung")) || (!target.cockLengthUnlocked(x, target.tallness / 12 * 3) && target.hasPerk("Hung")))
						{
							kGAMECLASS.output(target.cockLengthLockedMessage());
						}
						
						//Dick instantly hits panda thickness cap
						//Find thinnest cock
						x = target.thinnestCockRatioIndex();
						if(target.cocks[x].cThicknessRatioRaw < 1.7 && target.cockThicknessUnlocked(x, 1.7) && rand(3) == 0 && changes < changeLimit)
						{
							kGAMECLASS.output("\n\nYour groin is starting to feel remarkably... bloated. You check almost immediately, figuring it to be another change from the panda transformative. You’re right. There’s way more girthiness in your [pc.cocks] than you remember. In fact, you can see ");
							if(target.cockTotal() == 1) kGAMECLASS.output("it");
							else kGAMECLASS.output("them");
							kGAMECLASS.output(" swelling even now, filling to a thick, juicy broadness that would look perfectly at home on a bear.");
							for(x = 0; x < target.cockTotal(); x++)
							{
								target.cocks[x].cThicknessRatioRaw = 1.7;
							}
							changes++;
							target.changeLust(3+rand(3));
						}
						else if (!target.cockThicknessUnlocked(x, 1.7))
						{
							kGAMECLASS.output(target.cockThicknessLockedMessage());
						}
						
						//Undoes trap pouch (req's fur coat)
						if(target.skinType == GLOBAL.SKIN_TYPE_FUR && target.hasStatusEffect("Uniball") && target.balls > 0)
						{
							kGAMECLASS.output("\n\nA tightness that you were barely aware of suddenly relaxes, centered low in your loins. You idly reach down to see what’s going on, discovering that your [pc.balls] are dangling a little lower. The tight, trappy ballsack you once had as relaxed into a looser, more manly sperm satchel.");
							target.removeStatusEffect("Uniball");
							changes++;
						}
						//Breasts lose 3 cupsizes or half their rating - whichever is higher if no vagina is present.
						if(!target.hasVagina() && target.biggestTitSize() >= 1 && target.breastRatingUnlocked(0, 1) && rand(2) == 0 && changes < changeLimit)
						{
							x = target.biggestTitSize();
							y = 3;
							if(x/2 > 3) y = Math.round(x/2);
							//Boobs totally vanish
							if(x - y < 1)
							{
								kGAMECLASS.output("\n\nYou nearly tip over backwards as the weight of your chest diminishes. Your [pc.chest] are rapidly shrinking down, disappearing with such suddenness that you wonder how you ever got them in the first place. They’re completely gone by the time you finish that errant thought.");
								for(x = 0; x < target.bRows(); x++)
								{
									target.breastRows[x].breastRatingRaw -= y;
									//Keep the negative tits away.
									if(target.breastRows[x].breastRatingRaw <= 0)
									{
										target.breastRows[x].breastRatingRaw = 0;
										//target.breastRows[x].breastRatingMod = 0;
									}
								}
							}
							//Big Reduction
							else
							{
								kGAMECLASS.output("\n\nYour [pc.chest] wobble alarmingly, as if reacting to unseen motion. You cradle them in your hands, wondering what’s going wrong, when you feel them receding towards your chest. Warmth, undoubtedly a result of the metabolic processes required to reduce your bust, fills your hands as at least half of your previous bosom vanishes. One upside is that you’re a little lighter as a result");
								if(target.tone <= 40 && target.thickness >= 65) kGAMECLASS.output(", not that it matters with how soft your frame has gotten");
								kGAMECLASS.output(".");
								//Knock a buncha size off your knockers!
								for(x = 0; x < target.bRows(); x++)
								{
									target.breastRows[x].breastRatingRaw -= y;
									//Keep the negative tits away.
									if(target.breastRows[x].breastRatingRaw <= 0)
									{
										target.breastRows[x].breastRatingRaw = 0;
										//target.breastRows[x].breastRatingMod = 0;
									}
								}
							}
							changes++;
						}
					}
					//Cuntwielders Big TFs
					if(target.hasVagina())
					{
						//Large breast size gain to aforementioned cap
						//Breasts grow proportionally to thickness, eventually capping at JJ cup for full-figured gals
						//30 == JJ
						//1 == A
						if(target.thickness * .25 > target.breastRows[0].breastRatingRaw - 1 && target.breastRatingUnlocked(0, (target.thickness * 0.25) + 1) && rand(3) == 0 && changes < changeLimit)
						{
							//1
							if(target.biggestTitSize() >= 1) 
							{
								kGAMECLASS.output("\n\nA ecstatic energy gathers in your chest as you await the effects of your panda splicing.");
								if(target.isChestGarbed()) kGAMECLASS.output(" You push down your [pc.upperGarments] for a better view.");
								if(target.bRows() > 1) kGAMECLASS.output(" Your uppermost ");
								else kGAMECLASS.output(" Your ");
								kGAMECLASS.output("[pc.chest] look a little larger. In fact, you can actually see them swelling! They grow rounder with each passing moment, more alluring than ever before. You can’t help but touch them while they change, marvelling at their supple weight. Once finished, they look like the kind of tits that have plenty of cleavage even when topless - the kind of tits that are perfect for teasing");
								if(target.libido() >= 75 || target.lust() >= 75) kGAMECLASS.output("... or fucking");
								kGAMECLASS.output(".");
							}
							//2
							else
							{
								kGAMECLASS.output("\n\nYou shudder with your whole body when the splice kicks in. There’s a euphoric rush that drives straight towards your chest and nearly doubles you over on the spot. Your [pc.nipples] push out, obscuring some of your [pc.belly] as they rise on a tide of quivering chest-flesh. <b>You’re growing boobs - real, soft, breasts!</b> Gingerly, you give one a poke. It jiggles, swelling further. Encouraged by this, you grab hold with both hands and feverishly grope yourself, enjoying the feel of your cushy chest as it assumes its full size. <b>You’ve grown " + target.breastCup(0) + " melons!</b>");
							}
							target.breastRows[0].breastRatingRaw = Math.round(target.thickness * .25)+1;
							changes++;
						}
						else if (!target.breastRatingUnlocked(0, (target.thickness * 0.25) + 1))
						{
							kGAMECLASS.output(target.breastRatingLockedMessage());
						}
						
						//Extra clits are removed
						if(target.totalClits() > target.totalVaginas() && rand(2) == 0 && changes < changeLimit)
						{
							//Multi-cooch!
							if(target.totalVaginas() > 1)
							{
								var clitChange:Boolean = false;
								for(x = 0; x < target.totalVaginas(); x++)
								{
									if (target.vaginas[x].clits > 1 && target.clitsUnlocked(x, 1))
									{
										target.vaginas[x].clits = 1;
										clitChange == true;
									}
								}
								
								if (clitChange)
								{
									kGAMECLASS.output("\n\nDown in your [pc.vaginas], you can feel your folds shifting and rearranging. Whatever happened, it was over quick, because it finished before you could get a good look. A few furtive probes with your fingers later, you discover that you’ve only got one [pc.clit] in each of your vaginas.");
									changes++;
								}
								else
								{
									kGAMECLASS.output(target.clitsLockedMessage());
								}
							}
							//Single Cooch!
							else 
							{
								if (target.clitsUnlocked(0, 1))
								{
									kGAMECLASS.output("\n\nThere’s an unsubtle pinch down in your nether lips that vanishes almost as soon as you feel it. Shocked, you wonder what the hell could have happened to your vagina and reach down to check it out. Your wandering fingers discover the presence of only a single [pc.clit]. Well, that explains it.");
									target.vaginas[0].clits = 1;
									changes++;
								}
								else
								{
									kGAMECLASS.output(target.clitsLockedMessage());
								}
							}
						}
						//Superlong clits are shrunk by half their length or 1" to a minimum of .5" - req single clit
						if(target.totalClits() > 0 && target.clitLength > 1 && target.clitLengthUnlocked(0.5) && rand(2) == 0 && changes < changeLimit)
						{
							y = Math.round(target.clitLength/2);
							if(y < 0) y = .5;
							//Big shrinkage!
							if(target.clitLength - y > .5)
							{
								kGAMECLASS.output("\n\nYou gasp in sudden pleasure! It feels like something is sliding up and down the length of your [pc.clits]. Up and down... up and down... but each time, the strokes get shorter. You check your [pc.vaginas] to find that your [pc.clits] ");
								if(target.totalClits() == 1) kGAMECLASS.output("is");
								else kGAMECLASS.output("are");
								kGAMECLASS.output(" shrinking down, rapidly receding down towards normalcy. You’re still packing a good bit more girlmeat than the average woman, but if you keep taking this stuff, you might end up with ");
								if(target.totalClits() == 1) kGAMECLASS.output("a ");
								kGAMECLASS.output("normal-sized buzzer");
								if(target.totalClits() > 1) kGAMECLASS.output("s");
								kGAMECLASS.output(".");
							}
							//Hit rock bottom
							else
							{
								kGAMECLASS.output("\n\nOhh, there’s a wonderful, slippery feeling coursing up and down your [pc.clits]. It increases in speed and intensity with each passing second. Simultaneously, the length of the strokes diminishes to almost nothing. It feels like having a high-powered buzzer held against you. You immediately jam a finger downstairs to see just what’s going on and discover less down there than you’re used to. [pc.EachClit] is only about a half-inch long, though nice and fat, almost like a pink gumball of pleasure.");
							}
							target.clitLength -= y;
							if(target.clitLength < .5) target.clitLength = .5;
							changes++;
							target.changeLust(10+rand(5));
						}
						else if (!target.clitLengthUnlocked(0.5))
						{
							kGAMECLASS.output(target.clitLengthLockedMessage());
						}
					}
					//All genders:
					//Nipple length some if purty fukkin' big.
					if(target.nippleLengthRatio > 1 && target.nippleLengthRatioUnlocked(1) && rand(3) == 0 && changes < changeLimit)
					{
						//Stonkin' huge
						if(target.nippleLengthRatio > 3)
						{
							kGAMECLASS.output("\n\nYour [pc.nipples] tighten up, getting a little less lengthy over the course of a few seconds, though they are still much longer than most people would have.");
						}
						//Medium!
						else kGAMECLASS.output("\n\nA buzz of sensation thrums through your [pc.nipples] just long enough to draw your eye. They’ve shrunk to a far more reasonable length.");
						target.nippleLengthRatio -= (2 + rand(5))/10;
						changes++;
					}
					else if (!target.nippleLengthRatioUnlocked(1))
					{
						kGAMECLASS.output(target.nippleLengthRatioLockedMessage());
					}
					
					//Appearance changes (listed in probable required order)
					//Ears become panda ears.
					if(target.earType != GLOBAL.TYPE_PANDA && target.earTypeUnlocked(GLOBAL.TYPE_PANDA) && changes < changeLimit)
					{
						//TF
						kGAMECLASS.output("\n\nBetween the dull ache in your head and the tickling in your scalp, you’re pretty sure something is changing up top. You go deaf in an instant, feeling your ears smooth away, and before you have the chance to react, new ones bulge out of your [pc.hair]. <b>You’ve grown round panda ears on top of your head.</b>");
						target.earType = GLOBAL.TYPE_PANDA;
						target.clearEarFlags();
						target.addEarFlag(GLOBAL.FLAG_FURRED);
						changes++;
					}
					//Tails merge into single tail
					else if(target.tailCount > 1 && target.tailCountUnlocked(1) && changes < changeLimit)
					{
						//TF
						kGAMECLASS.output("\n\nYour [pc.tails] convulse uncontrollably, twisting together into one tangled knot. Then, lava-hot heat envelops the whole mass, dropping you to your [pc.knees] in agony. Underneath the pain, you can feel them fusing together into a single [pc.tail]. A growl slips escapes you as you recover, wondering why you decided to take this stuff.");
						target.tailCount = 1;
						changes++;
						target.changeLust(-3);
					}
					//Single tail becomes small panda tail
					else if((target.tailCount == 0 || (target.tailCount == 1 && target.tailType != GLOBAL.TYPE_PANDA)) && target.tailTypeUnlocked(GLOBAL.TYPE_PANDA) && changes < changeLimit)
					{
						//TF - No Tail
						if(target.tailCount == 0)
						{
							kGAMECLASS.output("\n\nA red, irritated lump forms at the base of your spine. It must be a tail coming in! You twist around to watch the change, smiling when you see a stubby little thing growing out of you, just above your [pc.butt]. It doesn’t get very long, but it does start growing " + target.furColor + " fur like wildfire. Before long, <b>you’ve got a poofy little panda-tail</b>.");
						}
						//TF - Haz Tail
						else if(target.tailCount == 1)
						{
							kGAMECLASS.output("\n\nYour [pc.tail] twitches, growing warmer even as its sensation deadens. You twist backwards in time to see it changing shape, morphing into stubby little thing covered in " + target.furColor + " fur. <b>There’s a poofy little panda-tail just above your [pc.butt]!</b>");
						}
						target.tailType = GLOBAL.TYPE_PANDA;
						target.tailCount = 1;
						target.clearTailFlags();
						target.addTailFlag(GLOBAL.FLAG_FLUFFY);
						target.addTailFlag(GLOBAL.FLAG_FURRED);
						changes++;
					}
					//Get fluffy pandafeet.
					else if(target.legType != GLOBAL.TYPE_PANDA && target.legTypeUnlocked(GLOBAL.TYPE_PANDA) && changes < changeLimit && target.tailType == GLOBAL.TYPE_PANDA)
					{
						//Omnileg/Naga/Goochassis -> Pandafeetz
						if(target.legCount == 1)
						{
							kGAMECLASS.output("\n\nYour [pc.leg] wobbles uncertainly for a moment before losing all its strength. The fall to the ground doesn’t hurt nearly as much as your bruised pride, but you’re too focused on the changes happening below your waist to mind much at the moment. Your [pc.leg] is splitting lengthwise, dividing into two vaguely plantigrade shapes. They slowly resolve into a pair of normal-looking legs shod with fluffy, padded footpaws. Little claws stick out of your toes in place of toenails. <b>You have panda feet!</b>");
						}
						//Manyleg -> Pandafeetz
						else if(target.legCount > 2)
						{
							kGAMECLASS.output("\n\nA tremor of warning weakness hits your [pc.legOrLegs], but you don’t react fast enough for your suddenly quivering lower body. It dumps you on the ground hard enough to hurt, though it doesn’t do any actual damage. Your [pc.legOrLegs] are slowly combining together, flowing into one another, your bones like butter. Eventually, two distinct shapes resolve in the mass of shifting flesh, dividing into two plantigrade legs. Fur sprouts out of the paw-like feet at the bottom. <b>You’ve got panda feet with little claws on the toes instead of nails!</b>");
						}
						//Generic -> Pandafeetz
						else
						{
							kGAMECLASS.output("\n\nYou drop to the ground as your [pc.legs] go boneless. The jarring impact is enough to make you wince, but of far more concern is what’s happening below your bruised bottom. Your [pc.legs] are changing! <b>Your [pc.feet] reform into fluffy panda-paws tipped by sharp-looking claws.</b> It’ll take a little bit of practice to get used to walking with these.");
						}
						target.legCount = 2;
						target.genitalSpot = 0;
						target.legType = GLOBAL.TYPE_PANDA;
						target.clearLegFlags();
						target.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
						target.addLegFlag(GLOBAL.FLAG_FURRED);
						target.addLegFlag(GLOBAL.FLAG_PAWS);
						changes++;
					}
					//Get fluffy panda paws
					else if(target.armType != GLOBAL.TYPE_PANDA && target.armTypeUnlocked(GLOBAL.TYPE_PANDA) && changes < changeLimit && target.legType == GLOBAL.TYPE_PANDA)
					{
						kGAMECLASS.output("\n\nYour hands clench into curled-up claws all on their own. Fascinated, you try to open them, but your mind’s commands to your body go unheeded. The muscles in your fingers are twitching wildly, and slowly, you see them changing them shape into slightly-shortened, thick fingers. They relax, allowing you to open your hands, and just in time too! Sharp claws snick out of the tips of your fingers, completing <b>your new, fuzzy panda hands.</b> There’s even " + target.furColor + " fur all over your arms!");
						target.armType = GLOBAL.TYPE_PANDA;
						target.clearArmFlags();
						target.addArmFlag(GLOBAL.FLAG_FURRED);
						target.addArmFlag(GLOBAL.FLAG_PAWS);
						changes++;
					}
					//Fur is grown
					else if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FUR) && changes < changeLimit && target.armType == GLOBAL.TYPE_PANDA)
					{
						//TF - Goo!
						if(target.skinType == GLOBAL.SKIN_TYPE_GOO) kGAMECLASS.output("\n\nYour semi-solid surface feels unusually stiff, and after a moment, you can see it becoming more and more opaque! You’re losing your gooeyness! In moments, you’re back to having normal-looking skin, but all that changes when black and white fur erupts all over your body, growing into a short but dense coat. <b>You’ve got fur!</b>");
						//TF - Scales!
						else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) kGAMECLASS.output("\n\nPlink. You look for the source of the sound. It happens again a moment later. You hear it a third time on the heels of the second. The next time, you manage to see what’s making the noise. Your scales are flaking off, one by one, and falling to the ground, and the pace seems to be accelerating. Soon, you’re shedding scales like a rain and scratching yourself all over through the itchy transformation. In place of your lost armor, white and black fur is emerging everywhere. You sigh heavily and regard yourself. <b>You’ve got panda fur.</b>");
						//TF - Generic
						else kGAMECLASS.output("\n\nStarting in the center of your chest, your [pc.skin] starts itching. It spreads outward like vibrations from a fault line, and the harder you scratch at it, the faster it seems to go. When you give up pull your hand away, you spot fur growing, and it’s not just on your chest. Fur is growing everywhere on your body. It isn’t just one color, either. Some places are white and some are black. The only constant is that it’s everywhere. <b>You have black and white panda fur!</b>");
						target.skinType = GLOBAL.SKIN_TYPE_FUR;
						target.furColor = "white and black";
						target.clearSkinFlags();
						target.addSkinFlag(GLOBAL.FLAG_FLUFFY);
						changes++;
					}
					//Face, if already has spots or inhuman, goes full panda
					//PANDAFAAAAAACE
					else if(target.faceType != GLOBAL.TYPE_PANDA && target.faceTypeUnlocked(GLOBAL.TYPE_PANDA) && changes < changeLimit && target.skinType == GLOBAL.SKIN_TYPE_FUR && target.armType == GLOBAL.TYPE_PANDA)
					{
						kGAMECLASS.output("\n\nYour cheekbones pull back into a snarl against your will, and as you struggle to maintain your expression, you feel your jawbone creak. The muscles of your face feel strained, the very sinews stretching. Your bones are deforming, making it hard to breath as your sinuses reroute, but soon enough the transformation completes. You check your appearance with your codex’s holocorder. <b>You’ve got a short-muzzled, panda-like visage.</b>");
						changes++;
						target.faceType = GLOBAL.TYPE_PANDA;
						target.clearFaceFlags();
						target.addFaceFlag(GLOBAL.FLAG_MUZZLED);
					}
				}
				if(changes == 0)
				{
					kGAMECLASS.output("\n\nNothing changed. What a rip-off.");
				}
			}
			//Not player!
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " eats the rations to no effect.");
			}
			return false;
		}
	}
}

