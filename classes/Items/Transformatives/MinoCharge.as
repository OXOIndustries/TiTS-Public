package classes.Items.Transformatives 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.VaginaClass;
	import classes.Engine.Utility.rand;
	import classes.Engine.Interfaces.*;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;
	import classes.Engine.Utility.num2Text;
	
	public class MinoCharge extends ItemSlotClass
	{
		
		public function MinoCharge() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			
			this.shortName = "MinoCharge";
			this.longName = "Mino Charge";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a small bottle of Mino Charge";
			
			this.tooltip = "Originally designed by Xenogen as a performance-enhancing drug, Mino Charge was reworked into a public-use bovine transformative after being banned from most competitive sports. The product labeling makes the dubious claim that it uses “the power of real minotaur blood”, but the much less dubious claim that it causes heavy increases in muscle mass, masculinity, and male potency, even capable of complete gender transitions.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 500;
			
			this.version = this._latestVersion;
		}
		
		// First Transformation: Humanization
		private function t0Changes(target:Creature, tChanges:int):int
		{
			var changes:int = 0;
			
			if (target.faceType == GLOBAL.TYPE_BOVINE) return changes;
			
			//PC becomes fairly humanoid. 100% chance to get human face, skin, if not already possessed, unless PC has fur and bovine face.
			if (target.faceType != GLOBAL.TYPE_HUMAN || target.skinType != GLOBAL.SKIN_TYPE_SKIN)
			{
				output("\n\nThe first thing you feel after ingesting the treat is an odd calmness that falls over you. A passivity and complacency that makes you want to just sit down and... chew greens? You blink, scowling at yourself for thinking that. What the hell?");
				
				//if PC has non-human skin:
				if (target.skinType != GLOBAL.SKIN_TYPE_SKIN && target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN))
				{
					output("\n\nYour [pc.skin] starts to itch powerfully. It starts as an annoyance, making you rub at an errant patch of your inhuman flesh, but the sensations spread and intensify.");
					if (target.skinType == GLOBAL.SKIN_TYPE_FUR) output(" After a few moments, you start to see patches of fur falling off as you itch yourself. More and more of your lush coating drops off with every moment, until you’re left bare naked! <b>Your fur is gone!</b>");
					else if (target.skinType == GLOBAL.SKIN_TYPE_SCALES) output(" After a few moments, you start to see some of your scales flaking off. More and more drop to the ground as you scratch yourself, tearing away in big chunks until <b>you’re left with surprisingly normal human skin.</b>");
					else if (target.skinType == GLOBAL.SKIN_TYPE_GOO)
					{
						output(" Your gooey body starts to feel very... heavy and solid. Much less malleable and soft than before, for sure! You watch with awe as your body starts to reform, solidifying into almost comically mundane skin. <b>You’re not gooey anymore!</b>");
						output("\n\nIt takes a while to get used to no longer having jiggly goo for a body, but before long, you’re walking around with a bit more confidence. This’ll take some getting used to, though.");
					}
					else
					{
						output(" After a while, your [pc.skinFurScales] begins to morph and give way to a burgeoning coating of human flesh. You watch in awe as <b>your body becomes completely covered with simple, common skin.</b>");
					}
					
					target.skinFlags = [];
					target.skinType = GLOBAL.SKIN_TYPE_SKIN;
					changes++;
				}
				else
				{
					output("\n\n" + target.skinTypeLockedMessage());
				}
				
				//if PC has a non-human face:
				if (target.faceType != GLOBAL.TYPE_HUMAN && target.faceTypeUnlocked(GLOBAL.TYPE_HUMAN))
				{
					output("\n\nYou feel your [pc.face] starting to crumple in, rattling your teeth and sending shockwaves of pressure through your head. You feel like you’re in a vice! Slowly but surely, your inhuman face takes on a much more common appearance, leaving you with a cute little nose, lips, human eyes -- the works. <b>You now have a human face!</b>");
					
					target.faceType = GLOBAL.TYPE_HUMAN;
					target.faceFlags = [];
					changes++;
				}
				else
				{
					output("\n\n" + target.faceTypeLockedMessage());
				}
			}
			
			return changes;
		}
		
		// Firstdo: Gendershit
		private function t1Changes(target:Creature, tChanges:int):int
		{
			//PC gets turned into a man!
			var changes:int = 0;
			var i:int = 0;
			var grownInitialTits:Boolean = false
			
			//100% chance to shrink breasts by 1-3 cups
			if (target.breastRows[target.biggestTitRow()].breastRatingRaw > 0)
			{
				var cupSizeLoss:Number = 1 + rand(3);
				changes++;
				
				if (target.breastRows[target.biggestTitRow()].breastRatingRaw > 0) grownInitialTits = true;
				
				// To flat
				for(i = 0; i < target.breastRows.length; i++)
				{
					target.breastRows[i].breastRatingRaw -= cupSizeLoss;
					if (target.breastRows[i].breastRatingRaw < 0) target.breastRows[i].breastRatingRaw = 0;
				}
				
				output("\n\nYour [pc.breasts] briefly feel like they’re burning, shrinking several inches as if your body were ridding itself of the outward sign of femininity. By the time the heat fades, <b>");
				if (target.biggestTitSize() <= 0) output("your chest has become flat and smooth");
				else output("you’ve got " + target.breastCup(target.biggestTitRow()) + " breasts");
				output("!</b>");
			}
			if (!target.hasMilkPerk() && (target.milkMultiplier > 0 || target.canLactate()))
			{
				output("\n\nYou feel the lactation in your [pc.breasts] slow, soon coming to a stop. Well of course, bulls don’t give milk. <b>It looks like you’re no longer lactating now!</b>");
				
				target.milkMultiplier = 0;
				target.milkFullness = 0;
				//target.milkType = GLOBAL.FLUID_TYPE_MILK;
				changes++;
			}
			
			if (target.hasCock())
			{
				//High chance to grow a sheath!
				//Only if no sheath to begin with and has a cock!
				if (target.totalSheaths() != target.cockTotal() && rand(4) > 0)
				{
					output("\n\nYou feel a thickening sensation at the base of [pc.eachCock], looking down to see the skin turning dark and leathery as it starts to bunch up. Your cock");
					if (target.cockTotal() == 1) output(" withdraws");
					else output("s withdraw");
					output(" into the new fleshy container");
					if (target.balls > 0) output(" , with your [pc.balls] hanging beneath");
					output(". <b>[pc.EachCock]");
					if (target.cockTotal() == 1) output(" is");
					else output(" are");
					output(" now covered in a sheath</b>!");
					
					for(i = 0; i < target.cocks.length; i++)
					{
						if (!target.cocks[i].hasFlag(GLOBAL.FLAG_SHEATHED)) target.cocks[i].addFlag(GLOBAL.FLAG_SHEATHED);
					}
					changes++;
				}
				
				//High chance to change cocks to single horse cock!
				//Only if has a sheath, change color to pink, black, or mottled pink and black at random
				else if (target.totalSheaths() == target.cockTotal() && !target.hasCock(GLOBAL.TYPE_EQUINE) && rand(4) > 0)
				{
					if (target.removeCocksUnlocked())
					{
						output("\n\nInside your");
						if (target.hasStatusEffect("Genital Slit")) output(" genital slit");
						else
						{
							output(" sheath");
							if (target.totalSheaths() != 1) output("s");
						}
						output(" you feel a thickening, tugging sensation in [pc.eachCock]. It feels like your dick");
						if (target.cockTotal() == 1) output(" is");
						else output("s are");
						output(" made of clay, the flesh within melding and flattening out into a single massive tube of fat, flared dick.");
						if (target.hasStatusEffect("Genital Slit")) output(" The resulting member bulges out of you as your slit gradually disappears, unable to contain your new phallus’s form.");
						output(" The sensation triggers a surge of arousal, and your new endowment comes sliding out of its sheath. The flare is already stretched wide and ready to plunge into the nearest willing hole, the ring of thicker flesh around the middle throbbing with every beat of your heart. <b>You have a minotaur’s cock</b>!");
						
						// Average the cock sizes
						var avgCockLength:Number = 0;
						for(i = 0; i < target.cocks.length; i++)
						{
							avgCockLength += target.cocks[i].cLengthRaw;
						}
						avgCockLength = Math.round(avgCockLength / target.cocks.length);
						// Minimum of 8"
						if (avgCockLength < 8) avgCockLength = 8;
						
						target.removeStatusEffect("Genital Slit");
						target.removeCocks();
						target.createCock();
						target.shiftCock(0, GLOBAL.TYPE_EQUINE);
						target.cocks[0].cLengthRaw = avgCockLength;
						if (target.hasPerk("Hung")) target.cocks[0].cLengthRaw *= 1.25;
						changes++;
					}
					else output("\n\n" + target.removeCocksLockedMessage());
				}
				
				//High chance to grow balls!
				//Only if has a cock
				if (target.balls <= 0 && rand(4) > 0)
				{
					output("\n\nYou grunt in sudden discomfort as a lump forms below your manhood, followed by another grunt of relief as one, then two golfball-sized spheres drop into a leathery sack that now hangs just below your cock");
					if (target.cockTotal() != 1) output("s");
					output(". <b>You now have a pair of balls!</b>");
					
					target.removeStatusEffect("Uniball");
					target.balls = 2;
					target.ballSizeRaw = (1.68 * 3.14);
					changes++;
				}
			}
			
			if (target.balls >= 0 && target.ballSizeRaw < 20 && rand(4) > 0)
			{
				//Ball size increases
				output("\n\nYou feel a new weight in your [pc.sack] as it brushes against your thighs. A quick check shows that <b>your ball");
				if (target.balls == 1) output(" has");
				else output("s have");
				output(" grown in size</b>!");
				
				target.ballSizeRaw += 1 + rand(2);
				if (target.hasPerk("Bulgy")) target.ballSizeRaw += 1 + rand(2);
				changes++;
			}
			
			//High chance to reduce lip size!
			if (target.lipMod > 0 && rand(4) > 0)
			{
				output("\n\nYou feel your [pc.lips] pucker reflexively, relaxing only to feel thinner and less pouty than before. <b>Your lips are less pronounced.</b>");
				
				target.lipMod--;
				changes++;
			}
			
			if (target.hasVagina())
			{
				//100% chance to shrink vaginas by 1 size
				if (target.biggestVaginalCapacity() > 300)
				{
					output("\n\nYou feel a painful constricting feeling in [pc.eachVagina], your hole");
					if (target.totalVaginas() != 1) output("s");
					output(" tightening up to leave you feeling noticeably smaller down there.");
					
					for(i = 0; i < target.vaginas.length; i++)
					{
						if (target.vaginas[i].bonusCapacity > 0)
						{
							target.vaginas[i].bonusCapacity--;
							if (target.vaginas[i].bonusCapacity < 0) target.vaginas[i].bonusCapacity == 0;
						}
						if (target.vaginas[i].loosenessRaw > 1)
						{
							target.vaginas[i].loosenessRaw--;
							if (target.vaginas[i].loosenessRaw < 1) target.vaginas[i].loosenessRaw == 1;
							target.vaginas[i].minLooseness = 1;
						}
						if (target.vaginas[i].wetness > 0)
						{
							target.vaginas[i].wetness--;
							if (target.vaginas[i].wetness < 0) target.vaginas[i].wetness == 0;
						}
						if (target.elasticity > 1)
						{
							target.elasticity--;
							if (target.elasticity < 1) target.elasticity == 1;
						}
					}
					changes++;
				}
				
				var smallestVagIndex:int = target.smallestVaginaIndex();
				
				//Vaginas vanish completely!
				//Only if as tight as possible, should immediately proc sheath/cock/ball growth if this leaves PC genderless
				if (target.vaginalCapacity(smallestVagIndex) <= 300)
				{
					if (target.removeVaginaUnlocked(smallestVagIndex, 1) && !target.isPregnant())
					{
						output("\n\nYour vagina just keeps getting tighter and tighter, way too much so. Soon relief comes, but it’s in the form of feeling your nether lips seal entirely, the supercharged masculine hormones surging through your blood removing the offending female part. <b>");
						
						target.removeVagina(smallestVagIndex, 1);
						changes++;
						
						if (target.totalVaginas() > 0)
						{
							output("You only have " + num2Text(target.totalVaginas()) + " vagina");
							if (target.totalVaginas() != 1) output("s");
							output(" left");
							if (target.hasLegs() && target.genitalLocation() == 0)output(" between your [pc.legOrLegs]");
						}
						else output("Your vagina is gone");
						output("</b>!");
					}
					else if(target.isPregnant()) output("\n\nYour vaginal lips reflexively tighten and your womb warms, but nothing else happens. It seems your active pregnancy prevented the change.");
					else output("\n\n" + target.removeVaginaLockedMessage());
				}
			}
			
			//Genderless get the full package at once
			//100% chance of triggering, also 100% chance of triggering immediately after losing last vagina from above transformation if this leaves character genderless
			if (!target.hasGenitals() || (!target.hasCock() && rand(4) > 0))
			{
				target.removeStatusEffect("Genital Slit");
				target.removeStatusEffect("Uniball");
				target.createCock();
				target.shiftCock(0, GLOBAL.TYPE_EQUINE);
				target.cocks[0].cLengthRaw = 8;
				if (target.hasPerk("Hung")) target.cocks[0].cLengthRaw *= 1.25;
				target.balls = 2;
				target.ballSizeRaw = (1.68 * 3.14);
				if (target.hasPerk("Bulgy")) target.ballSizeRaw *= 1.25;
				changes++;
				
				output("\n\nThe bare mound between your thighs start to itch, turning dark and leathery as it starts to bunch up in rings. You can feel a hot stirring sensation just below the surface, followed by a pair of hard kicks each accompanied by a thick");
				if (target.hasPerk("Bulgy")) output(" baseball-sized");
				else output(" golf ball-sized");
				output(" testicle dropping into one of the folds of skin, making it hang down as a fat leathery sack. You feel an irresistible impulse to flex pelvic muscles you didn’t know you had, pushing two, then four, then finally");
				if (target.hasPerk("Hung")) output(" " + num2Text(target.cocks[0].cLengthRaw));
				else output(" eight");
				output(" inches of bestial cock out from within your new sheath. When the heat finally fades, you’ve gained the full package of a bull’s endowment. <b>You now have a cock, sheath, and balls!</b>");
			}
			
			//100% chance for Femininity Decrease
			if (target.femininity > target.femininityMin() && target.femininityUnlocked(target.femininity - 5))
			{
				var sPronoun:String = target.mfn("m", "f", "n");
				
				target.femininity -= 5;
				if (target.femininity < target.femininityMin()) target.femininity = target.femininityMin();
				changes++;
				
				output("\n\nYou feel a pleasant heat and an ache in your jaw and cheeks as your face subtly resculpts itself, feeling like some of your femininity is being burned out of you. Your lips and eyelashes become less pronounced, your brow a little harder, your cheeks more angular. When the transformations finish, <b>you feel much more masculine</b>!");
				//if pronoun change:
				if (sPronoun != target.mf("m", "f")) output(" <b>Anyone who looked at you would be sure to think you were a male.</b>");
			}
			
			return changes;
		}
		
		// Secondo: Adding Meat
		private function t2Changes(target:Creature, tChanges:int):int
		{
			//PC’s muscles, height, and cock grow!
			var changes:int = 0;
			var inchGained:Number = 0;
			
			//100% chance for Tone Increase
			if (target.tone < 90 && changes < tChanges)
			{
				output("\n\nYou feel a delicious heat in your muscles, feeling them swelling outward as some of your fat melts away under the heat to highlight their growth even more. Your codex informs you that you’re only increasing the size of your muscles, not their strength, but you certainly don’t look it! <b>You’ve gotten more toned!</b>");
				
				target.tone += 2;
				if (target.tone < 50) target.tone += 2;
				changes++;
			}
			
			//High chance for height increase
			//Maximum 96 inches
			if (target.tallness < 96 && rand(4) > 0 && changes < tChanges)
			{
				inchGained = 2;
				if (target.tallness < 84) inchGained++;
				if (target.tallness < 72) inchGained++;
				if (target.tallness < 60) inchGained++;
				if (target.tallness < 48) inchGained++;
				
				output("\n\nYou feel a sense of compression in your spine followed by relaxing, causing you to reflexively close your eyes and grunt. When you open your eyes again, your viewpoint’s a little higher off the ground than before. <b>You’ve gained " + inchGained + " inches of height!</b>");
				
				target.tallness += inchGained;
				changes++;
			}
			
			//Moderate chance for thickness increase
			//To thickset
			if (target.thickness < 90 && rand(3) == 0 && changes < tChanges)
			{
				target.thickness += 2;
				if (target.thickness < 40) target.thickness += 2;
				changes++;
				
				output("\n\nYou feel compelled to roll your shoulders as they broaden outward. Your body feels wider, heavier. You’re not getting fat, but you’re getting visibly thickset. <b>You");
				if (target.thickness < 40) output(" now look a little thicker");
				else if (target.thickness < 60) output("’re now fairly thick");
				else output(" now look quite thick");
				output("!</b>");
			}
			
			//Moderate chance for butt shrinkage
			//To tight
			if (target.buttRatingRaw > 2 && rand(3) == 0 && changes < tChanges)
			{
				output("\n\nYour ass burns with the sensation of fat melting off, leaving you with a noticeably tighter behind than before.");
				
				target.buttRatingRaw--;
				if (target.buttRatingRaw > 5) target.buttRatingRaw--;
				if (target.buttRatingRaw > 10) target.buttRatingRaw--;
				if (target.buttRatingRaw > 20) target.buttRatingRaw--;
				if (target.buttRatingRaw > 50) target.buttRatingRaw--;
				changes++;
			}
			
			//Moderate chance for hip shrinkage
			//To average
			if (target.hipRatingRaw > 4 && rand(3) == 0 && changes < tChanges)
			{
				output("\n\nYour hips pull inward, bringing your thighs closer together as your stance becomes noticeably less girly.");
				
				target.hipRatingRaw -= 1;
				changes++;
			}
			
			//Moderate chance for hip growth
			//To average
			if (target.hipRatingRaw < 4 && rand(3) == 0 && changes < tChanges)
			{
				output("\n\nYour hips widen just a touch, giving you a stockier, wider stance.");
				
				target.hipRatingRaw += 1;
				changes++;
			}
			
			//High chance for Cock Growth
			//Maximum of 24 inches, requires horsecock and sheath
			if (target.hasCock(GLOBAL.TYPE_EQUINE) && target.totalSheaths() == target.cockTotal() && rand(4) > 0)
			{
				var shortCockIndex:int = target.shortestCockIndex();
				inchGained = 2;
				if (target.cocks[shortCockIndex].cLengthRaw < 6) inchGained++;
				if (target.cocks[shortCockIndex].cLengthRaw < 12) inchGained++;
				if (target.hasPerk("Hung")) inchGained *= 2;
				
				if (target.cocks[shortCockIndex].cLengthRaw < 24)
				{
					output("\n\nYou feel a pleasant swelling sensation inside your sheath, your [pc.cock " + shortCockIndex + "] growing to fill its container more snugly. You’ve gained " + num2Text(inchGained) + " inches when aroused, and you’re thicker to match too!");
					if (target.isBro()) output("\n\nUnf, yeah, getting fucking huge feels awesome! You’re eager to find some slut or lesser male to bend over and really stretch out with your big, fat bull cock. Now if only it was even bigger!");
					
					target.cocks[shortCockIndex].cLengthRaw += inchGained;
					changes++;
				}
			}
			
			// Mino Charge should now increase or decrease hips and butt towards 20 as part of the second-stage changes.
			if (target.hipRatingRaw < 20 && rand(2) == 0 && changes < tChanges)
			{
				output("\n\nYou feel an urge to widen your stance, your hips spreading to give [pc.eachCock] more room to breathe.");
				
				target.hipRatingRaw++;
				//if(target.hipRatingRaw > 20) target.hipRatingRaw = 20;
				changes++;
			}
			if (target.buttRatingRaw < 20 && rand(2) == 0 && changes < tChanges)
			{
				output("\n\nYour ass feels deliciously warm, clenching and unclenching with every breath you take as new thick, heavy muscle piles on.");
				
				target.buttRatingRaw++;
				//if(target.buttRatingRaw > 20) target.buttRatingRaw = 20;
				changes++;
			}
			
			return changes;
		}
		
		// Thirdo: Bovification
		private function t3Changes(target:Creature, tChanges:int):int
		{
			//PC transforms to a ears/horns/tail/legs minotaur, then to a full-on bull-morph if they keep taking it
			var changes:int = 0;
			var inchGained:Number = 0;
			
			//High chance to gain small bovine horns
			//Does not change existing horns.
			if ((target.hasStatusEffect("Horn Bumps") || !target.hasHorns()) && rand(3) == 0 && changes < tChanges)
			{
				if(target.hasStatusEffect("Horn Bumps")) output("\n\nA tingling sensation comes from the bumps on your head. You reach up and rub them, only to find them growing larger... Not too soon after, they become very hard, and covered with a velvety softness. <b>They’ve become a pair of small, cow-like horns!</b>");
				else output("\n\nA tingling sensation comes from your forehead. You reach up and pat at your brow, and find a pair of growing lumps growing from your head. After a few moments, they become very hard, and covered with a velvety softness. <b>They’re a pair of small, cow-like horns!</b>");
				
				target.removeHorns();
				target.hornType = GLOBAL.TYPE_BOVINE;
				target.hornLength = 1;
				target.horns = 2;
				changes++;
			}
			
			//Moderate chance that horns grow
			//Diminishing returns past twelve inches
			else if (target.hasHorns() && target.hornLength < 30 && rand(3) == 0 && changes < tChanges)
			{
				inchGained = 3;
				if(target.hornLength > 6) inchGained = 2;
				if(target.hornLength > 12) inchGained = 1;
				
				if (target.hornLengthUnlocked(target.hornLength + inchGained))
				{
					target.hornLength += inchGained;
					changes++;
					
					//First growth
					if (target.hornType != GLOBAL.TYPE_BOVINE || target.hornLength < 10)
					{
						output("\n\nYou feel a pressure in the base of your [pc.horns], feeling the velvety surface flake off as your [pc.hornsNoun] expand outward " + inchGained + " inch");
						if (inchGained != 1) output("es");
						if (target.hornLength < 5) output(".");
						else output(", curling forward like a bull’s.");
					}
					//Repeat growths
					else
					{
						output("\n\nYou feel a pressure in the base of your [pc.horns], letting out a grunting moo as " + inchGained + " more inch");
						if(inchGained != 1) output("es emerge.");
						else output(" emerges.");
						if (target.horns > 1 && target.hornLength >= 10) output(" They feel huge, heavy, and powerful, like big fat <i>bull</i> horns.");
					}
				}
				else output("\n\n" + target.hornLengthLockedMessage());
			}
			
			//High chance to grow a cow tail (No existing tails)
			if ((target.tailType == 0 || target.tailCount == 0) && rand(3) == 0 && changes < tChanges)
			{
				if (target.tailTypeUnlocked(GLOBAL.TYPE_BOVINE))
				{
					output("\n\nYou feel a shifting of flesh behind you. Something’s growing, sprouting from your backside. You look over your shoulder, watching as a mass of flesh twists and grows from just above your [pc.butt]. After a few moments, the mass of flesh resolves into a distinctly tail-like shape with a tuft of puffy fur at its tip. <b>You now have a bovine tail!</b>");
					
					target.tailCount = 1;
					target.tailType = GLOBAL.TYPE_BOVINE;
					target.tailFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_FLUFFY];
					changes++;
				}
				else output("\n\n" + target.tailTypeLockedMessage());
			}
			
			//High chance to grow a cow tail (PC already has tails)
			if ((target.tailType != GLOBAL.TYPE_BOVINE && target.tailCount > 0) && rand(3) == 0 && changes < tChanges)
			{
				if (target.tailTypeUnlocked(GLOBAL.TYPE_BOVINE))
				{
					if (target.tailCount >= 2)
					{
						output("\n\nYou feel a strange sensation coming from your tails! They’re squirming and shifting, all moving together and seeming... to fuse! You moan, biting your lip as your tails combine into a single, massively thick appendage. After a moment, much of the flesh there starts to recede into your body, leaving a single slender tail in its wake, tipped with a tuft of hair. <b>Your tails have combined into a single cow’s tail!</b>");
					}
					else
					{
						output("\n\nYou feel a strange sensation coming from your tail. Looking over your shoulder, you watch with alarm as the flesh of it sloughs off, receding into your body to reveal a small, slender tendril of skin tipped with a small tuft of fur. <b>Your tail is now like a cow’s!</b>");
					}
					target.tailCount = 1;
					target.tailType = GLOBAL.TYPE_BOVINE;
					target.tailFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_FLUFFY];
					changes++;
				}
				else output("\n\n" + target.tailTypeLockedMessage());
			}
			
			//High chance to gain bovine ears
			if (target.earType != GLOBAL.TYPE_BOVINE && rand(3) == 0 && changes < tChanges)
			{
				output("\n\nYou let out a startled yelp as your ears start to squirm and wiggle, making horrid jelly-like motions as the nanomachines in the Mino Charge rearrange your body shape. Your ears grow out from the side of your head, turning soft and velvety while the outward-facing sides are covered in a thin layer of fur. You pull your Codex out and flip it around, using it like a mirror to examine your newly-molded ears. <b>You now have distinctly bovine ears!</b>");

				target.earType = GLOBAL.TYPE_BOVINE;
				changes++;
			}
			
			//Low chance to lose quad nipples
			if (target.nipplesPerBreast >= 4 && rand(20) == 0 && changes < tChanges)
			{
				output("\n\nYour [pc.nipples] begin to ache and shrink, pressing together until they meld into a single nub on each breast. <b>You no longer have ");
				if (target.nipplesPerBreast == 4) output("quad ");
				else output("multi-");
				output("nipples!</b> Well of course, bulls don’t have udders.");
				
				target.nipplesPerBreast = 1;
				changes++;
			}
			
			//Low chance for nipple shrinkage
			//Down to standard length
			if (target.nippleLengthRatio > 1 && rand(6) == 0)
			{
				target.nippleLengthRatio -= 0.2;
				if (target.nippleLengthRatio < 1) target.nippleLengthRatio = 1;
				changes++;
				
				output("\n\nYour [pc.nipples] feel a little tight, compressing down into smaller " + num2Text(target.nippleLength(target.biggestTitRow())) + "-inch teats.");
			}
			
			//Low chance for cow-leg TF
			//PC leg type becomes bipedal, fur-covered, with hooves for feet. 
			if ((target.legType != GLOBAL.TYPE_BOVINE || target.legCount != 2) && rand(20) == 0 && changes < tChanges)
			{
				//PC was a naga:
				if (target.isNaga())
				{
					output("\n\nA strange sensation runs through your serpentine lower body, followed by a wracking pain. You double over, hugging yourself to your coiling snake-body as the Mino Charge decides to rob you of your serpent-half. The transformation is quick, but thoroughly unpleasant: your [pc.legOrLegs] split apart wholesale, its outer parts flaking off to reveal taut, [pc.skinColor] skin. <b>You now have bipedal legs!</b>");
					output("\n\nThat’s not enough for the drug, though. Not by a long shot! After a few moments, you see <b>thick, curly fur starts to grow on your new-grown legs</b>, covering them up to the upper thighs. At least you’ll be warm in the winter!");
					output("\n\nThe bottoms of your legs take form: <b>rather than feet, they mutate into distinctly animalistic hooves.</b> You spend a good long while standing up and adjusting to your new gait, wobbling around until you get your footing. Or hoofing, as the case may be.");
				}
				//PC was a taur:
				else if (target.isTaur())
				{
					output("\n\nYour bestial lower body is wracked with pain, and the mass of it starts convulsing, breaking apart at the seams. From the waist down, your body changes, becoming more and more humanoid as the minutes pass. When the transition ends, <b>you’re left with bipedal legs,</b> distinctly human in appearance.");
					if (target.legType != GLOBAL.TYPE_BOVINE || !target.hasLegFlag(GLOBAL.FLAG_FURRED)) output("\n\nThat’s not enough for the drug, though. Not by a long shot! After a few moments, you see <b>thick, curly fur starts to grow on your new-grown legs</b>, covering them up to the upper thighs. At least you’ll be warm in the winter!");
					if (!target.hasLegFlag(GLOBAL.FLAG_HOOVES)) output("\n\nThe bottoms of your legs take form: <b>rather than feet, they mutate into distinctly animalistic hooves.</b> You spend a good long while standing up and adjusting to your new gait, wobbling around until you get your footing. Or hoofing, as the case may be.");
				}
				//PC was bipedal already:
				else
				{
					output("\n\nYou feel your [pc.legOrLegs] shifting, the [pc.skinFurScales] on them squirming and moving. After a few tense moments, <b>a thick coating of curly fur sprouts from your [pc.legOrLegs], covering them to the upper thigh</b>.");
					//if not already hooves: 
					if (!target.hasLegFlag(GLOBAL.FLAG_HOOVES)) output(" Your feet curl in, starting to become covered by a thick, black covering. You grunt and moan, rubbing your transforming body as your feet change. When they’re done, <b>you have a pair of cow-like hooves!</b>.");
				}
				
				target.genitalSpot = 0;
				target.legCount = 2;
				target.legType = GLOBAL.TYPE_BOVINE;
				target.legFlags = [];
				target.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
				target.addLegFlag(GLOBAL.FLAG_FURRED);
				target.addLegFlag(GLOBAL.FLAG_HOOVES);
				
				changes++;
			}
			
			//Bull face
			//Requires horns, ears, legs, and tail
			if
			(	target.faceType != GLOBAL.TYPE_BOVINE
			&&	target.hasHorns()
			&&	target.earType == GLOBAL.TYPE_BOVINE
			&&	target.hasLegFlag(GLOBAL.FLAG_HOOVES)
			&&	target.hasTail(GLOBAL.TYPE_BOVINE)
			&&	rand(3) == 0 && changes < tChanges
			)
			{
				output("\n\nYour whole face suddenly aches, and you grab the sides of your head in pain as it begins to distort, pulling out into a bovine muzzle and growing a layer of thin fur over its entire surface. Your ears and horns sit more comfortably on the new arrangement, and as the discomfort finally stops you let out a bellowing moo from <b>your new bovine face!</b>");
				
				target.faceType = GLOBAL.TYPE_BOVINE;
				target.clearFaceFlags();
				target.addFaceFlag(GLOBAL.FLAG_MUZZLED);
				target.addFaceFlag(GLOBAL.FLAG_LONG);
				changes++;
			}
			
			//Fur
			//Requires bull face, horns, ears, legs, and tail, color chosen at random between black and brown
			if
			(	target.skinType != GLOBAL.SKIN_TYPE_FUR
			&&	target.faceType == GLOBAL.TYPE_BOVINE
			&&	target.hasHorns()
			&&	target.earType == GLOBAL.TYPE_BOVINE
			&&	target.hasLegFlag(GLOBAL.FLAG_HOOVES)
			&&	target.hasTail(GLOBAL.TYPE_BOVINE)
			&&	rand(3) == 0 && changes < tChanges
			)
			{
				output("\n\nYour [pc.skinFurScalesNoun] itches");
				
				target.skinType = GLOBAL.SKIN_TYPE_FUR;
				target.skinFlags = [];
				target.addSkinFlag(GLOBAL.FLAG_THICK);
				target.furColor = RandomInCollection("black", "brown", "black", "brown", "black", "brown", "white", "black and white", "brown and white", "black and brown");
				changes++;
				
				output(", starting to grow out a thick layer of [pc.furColor] shaggy fur all over its surface. It matches the fur on your");
				if (target.hasLegFlag(GLOBAL.FLAG_FURRED)) output(" legs and");
				output(" face, which now look thick and monstrous. <b>You’ve got [pc.furColor] fur!</b>");
				if (target.isBro()) output(" Oh yeah, now you’re a real bull!");
			}
			
			return changes;
		}
		
		// Fourthdo: Internal Changes
		private function t4Changes(target:Creature, tChanges:int):int
		{
			//PC gains volume, virility, etc.
			var changes:int = 0;
			
			//High chance for increased cumMultiplier and ballEfficiency
			if (target.hasCock() && (target.cumMultiplierRaw < 50 || target.ballEfficiency < 300) && rand(3) == 0 && changes < tChanges)
			{
				if (target.cumMultiplierRaw < 50) target.cumMultiplierRaw += 2;
				if (target.ballEfficiency < 300) target.ballEfficiency += 3;
				changes++;
				
				output("\n\nYour [pc.balls] feel");
				if (target.balls == 1) output("s");
				output(" like there’s an engine starting up inside, a churning, bubbling feeling as your rate of production increases dramatically. You’re definitely going to have a lot more [pc.cumNoun] to push out the next time you cum, plenty to satisfy any cum-hungry slut.");
			}
			
			//High chance for increased refractoryRate
			if (target.hasCock() && target.refractoryRate < 50 && rand(4) > 0 && changes < tChanges)
			{
				target.refractoryRate += 10;
				changes++;
				
				output("\n\nYou can feel your [pc.balls] revving up, getting faster and faster at producing fresh [pc.cumNoun] to replace your spent loads so that you’re always ready to fuck the next cow-girl in line as soon as you’re done pulling the last one off your dick.");
			}
			
			//High chance for increased cumQuality
			if (target.hasCock() && target.cumQualityRaw < 2 && rand(4) > 0 && changes < tChanges)
			{
				target.cumQualityRaw += 0.25;
				changes++;
				
				output("\n\nThere’s a churning in your [pc.balls], but it feels like a growth in quality, not quantity. You feel loaded and ready to breed, packing new virility in your [pc.cumNoun].");
				if (target.virility() <= 0) output(" Maybe you can make use of it if you weren’t otherwise infertile...");
			}
			
			//Low chance to increase libido
			//Increases by 8-16 points.
			if (rand(20) == 0 && changes < tChanges && target.libidoRaw <= 70)
			{
				target.libidoRaw += 3 + rand(5);
				changes++;
				
				output("\n\nThe heat surging in your veins leaves you feeling fierce and lusty. You can’t help but flex your muscles, picturing a plethora of soft, jiggly cow-girls offering up their milk to you");
				if (target.hasCock())
				{
					output(" and sucking your dick, unable to get enough of your thick");
					if (target.virility() > 0) output(", virile");
					output(" cum");
				}
				output(". Even the other bulls have to submit to you, the biggest, beefiest stud on the ranch with your own personal harem of milk-sluts to suck and fuck any way you please.");
				
				if (target.hasCock()) 
				{
					output("You look down after a few moments, drawn from your thoughts by the");
					// cock 12 inches or more:
					if (target.biggestCockLength() >= 12) output(" massive");
					output(" bulge ");
					if (target.isCrotchGarbed()) output("in your [pc.lowerUnderGarments]");
					else output(" between your [pc.legOrLegs]");
					output(".");
					// 12 inches or more:
					if (target.biggestCockLength() >= 12) output(" Oh yeah, now that’s an alpha bull’s cock.");
				}
			}

			return changes;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var tChanges:int = 2 + rand(2);
			var totalChanges:int = 0;
			var changes:int = 0;
			
			clearOutput();
			author("Couch");
			
			if (!(target is PlayerCharacter))
			{
				output(target.capitalA + target.short + " swollows the pill but to no effect.");
				return false;
			}
			
			output("You take the small bottle labeled “Mino Charge” out and open it up. There’s only one pill inside, a brown gel capsule the size of a small gumball. Really? That’s it? You hold the pill up to the light, seeing that the gel inside looks like it’s frothing around.");
			
			output("\n\nWell, you bought it, might as well use it. You gulp down the pill and wait for it to get to work. When the gelcap finally dissolves it’s like a kick in the gut, followed by a heat that races all throughout your body as if your blood suddenly started boiling.");
			
			changes = t0Changes(target, tChanges);
			if (changes > 0) return false;
			
			changes = t1Changes(target, tChanges);
			if (changes > 0) return false;
			
			changes = t2Changes(target, tChanges);
			totalChanges += changes;
			tChanges -= changes;
			
			if (tChanges > 0)
			{
				changes = t3Changes(target, tChanges);
				totalChanges += changes;
				tChanges -= changes;
			}
			
			if (tChanges > 0)
			{
				changes = t4Changes(target, tChanges);
				totalChanges += changes;
				tChanges -= changes;
			}
			
			return false;
		}
	}
}
