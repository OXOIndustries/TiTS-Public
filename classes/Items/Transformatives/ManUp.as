package classes.Items.Transformatives
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Utility.num2Text;
	import classes.Util.InCollection;
	import classes.Engine.Interfaces.author;
	
	public class ManUp extends ItemSlotClass
	{
		
		//constructor
		public function ManUp()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			
			//Used on inventory buttons
			this.shortName = "ManUp";
			
			//Regular name
			this.longName = "injector labeled ‘ManUp’";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an injector labeled ‘ManUp’";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "ManUp is a cocktail of chemicals, hormones and nanomachines engineered by JoyCo guaranteed to “make a man out of you”. This product, like the feminizing transformatives, is banned in some planets for the same reasons. JoyCo has managed to circumvent these bans with clever lobbying and a patched variant that doesn’t transform feminine genders.\n\nThe injector is filled with a transparent blue fluid. The box guarantees its user <b>facial masculinization with every use</b>, among other side effects such as: reduction in hip, lip, breast and butt size, increases in muscle tone, and growth of facial hair. In some cases, consumers who do not possess male anatomy may grow a penis or a pair of balls.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 1000;
			
			this.version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var x:int = 0;
			var y:Number = 0;
			var choices:Array = new Array();
			
			kGAMECLASS.clearOutput();
			author("Lashcharge");
			kGAMECLASS.showName("\nMANUP");
			
			if(target is PlayerCharacter) {
				// Consume:
				kGAMECLASS.output("Following the instructions on the box, you align the needle to your neck and click the button. A slight pinch and a sudden rush of energy is all you feel as the nanomachines flow into your body. Impatiently, you pull the needle out and discard it, just as the transformation begins.");
				
				// Masculinity Change
				y = target.femininity;
				// Masculinity at max:
				if(target.femininity <= target.femininityMin())
				{
					kGAMECLASS.output("\n\nThe telltale warmth of ManUp surges through your [pc.face] before disappearing just as quickly. Disappointingly, it seems like you can’t get any more manly.");
					if(!target.hasCock()) kGAMECLASS.output(" You’d have to get a cock, if you want to get even more manly.");
					else if(target.hasVagina()) kGAMECLASS.output(" You’d have to get rid of your [pc.vaginas], if you want to get even more manly.");
					else kGAMECLASS.output(" Not like you need to anyway. You’re as perfect as you can be!");
				}
				// Fem mod -17/-20 points:
				else if(rand(3) == 0)
				{
					kGAMECLASS.output("\n\nYour whole [pc.face] suddenly whirs into motion as the nanomachines begin their work. It even glows as bones are tweaked, flesh shifts and nerves are remapped into a new form. Everything about you is more rugged and angular. Out of nowhere, you burp loudly and an adam’s apple quickly forms on your neck.");
					x -= (17+rand(4));
					target.modFem(x);
				}
				// Fem mod -13/-16 points:
				else if(rand(3) == 0)
				{
					kGAMECLASS.output("\n\nSuddenly, your [pc.face] warms up as ManUp does its job. Bringing your fingers to your cheeks, you can actually feel the bones reshaping just below your fingertips. You explore the rest of your transforming face, passing your fingers across your longer forehead, squarer jaw and stronger nose. You’re pretty sure you are more handsome than before.");
					x -= (13+rand(4));
					target.modFem(x);
				}
				// Fem mod -9/-12 points:
				else if(rand(3) == 0)
				{
					kGAMECLASS.output("\n\nThe tingle starts right at the tip of your nose and quickly spreads outwards, warming your [pc.face] as it flows along. You’re sure this strange, yet warm feeling is ManUp masculinizing your [pc.lips], cheeks and jaw. You can’t help but feel a little bit hardened by the experience.");
					x -= (9+rand(4));
					target.modFem(x);
				}
				// Fem mod -5/-8 points:
				else if(rand(2) == 0)
				{
					kGAMECLASS.output("\n\nYour jaw begins to ache as you feel the nanomachines reworking your bones into a squarer form. Slowly, this feeling climbs upwards to work some changes on your nose, brows and cheeks, undeniably turning you more manly.");
					x -= (5+rand(4));
					target.modFem(x);
				}
				// Fem mod -1/-4 points:
				else
				{
					kGAMECLASS.output("\n\nThe nanomachines kick into action and start warming up your forehead, working some changes here and there. They quickly finish their job of making your masculine features just slightly more prominent.");
					x -= (1+rand(4));
					target.modFem(x);
				}
				// Announce when passing a threshold:
				if(y > 10 && target.femininity <= 10)
				{
					kGAMECLASS.output(" <b>As you stare into your holocam, you see your reflection and can’t help but smile. With its chiseled features, your [pc.face] is a paragon of masculinity. Even your neck has an eye-catching adam’s apple. ");
					if(kGAMECLASS.silly) kGAMECLASS.output("Total sploosh!");
					else kGAMECLASS.output("You’re so hot you make all the panties wet.");
					kGAMECLASS.output("</b>");
				}
				else if(y > 20 && target.femininity <= 20) kGAMECLASS.output(" <b>Checking yourself with your codex, you can’t help but admire your masculine features. Your chiseled visage is ruggedly handsome!</b>");
				else if(y > 28 && target.femininity <= 28) kGAMECLASS.output(" <b>If there were any doubts before, there aren’t any now. Your chiseled jaw and defined cheekbones show you’re definitely getting manlier.</b>");
				// 35
				else if(y > 35 && target.femininity <= 35) kGAMECLASS.output(" <b>Your forehead is broader and both your chin and your brow are a lot more prominent than before. Not only do you look more masculine, you also look significantly tougher than before.</b>");
				// 45
				else if(y > 45 && target.femininity <= 45) kGAMECLASS.output(" <b>You can barely notice just a few hints of masculinity in your ambiguously androgynous face.</b>");
				// 55
				else if(y >= 55 && target.femininity < 55) kGAMECLASS.output(" <b>No matter how hard you look there isn’t a single hint of femininity left on your face and you’re pretty sure nobody could figure out your gender from it alone.</b>");
				// 65
				else if(y >= 65 && target.femininity < 65) kGAMECLASS.output(" <b>At this point you can still see some traces of femininity left in your thin eyebrows and high cheekbones.</b>");
				// 72
				else if(y >= 72 && target.femininity < 72) kGAMECLASS.output(" <b>While examining your face through your codex’s holocam, you realize that you’re definitely getting less feminine. Your face is longer and your nose is bigger, but there’s still a long way to go for you to be considered manly in any way.</b>");
				// 80
				else if(y >= 80 && target.femininity < 80) kGAMECLASS.output(" <b>After checking yourself out in your codex’s holocam, you confirm that both your chin and your brow are more prominent and your forehead is slightly broader.</b>");
				// 90
				else if(y >= 90 && target.femininity < 90) kGAMECLASS.output(" <b>Your [pc.face] is still jaw-droppingly gorgeous but you can also see that it’s less feminine than before.</b>");
				
				// First Cock
				// Effect: Lack cock - Increases cock by 1, 4 inch long, 1 inch thick cock. Penis type decided by race.
				if(!target.hasCock() && target.createCockUnlocked())
				{
					choices[choices.length] = 1;
				}
				// First Pair of Balls
				// Effect: Less than 2 balls - Increases testicle count until 2
				if(target.balls < 2 && target.ballsUnlocked(2))
				{
					choices[choices.length] = 2;
				}
				// Lip
				// Effect: Lipmod more than 1 - Decrease by 1
				if(target.lipMod > 1 && target.lipModUnlocked(target.lipMod - 1))
				{
					choices[choices.length] = 3;
					choices[choices.length] = 3;
				}
				// Hip
				// Effect: If hips more than 1 point - Decrease by 1
				if(target.hipRatingRaw > 1 && target.hipRatingUnlocked(target.hipRatingRaw - 1))
				{
					choices[choices.length] = 4;
					choices[choices.length] = 4;
					choices[choices.length] = 4;
					choices[choices.length] = 4;
					choices[choices.length] = 4;
				}
				// Butt
				// Effect: If butt not 1 point - Decrease by 1
				if(target.buttRatingRaw > 1 && target.buttRatingUnlocked(target.buttRatingRaw - 1))
				{
					choices[choices.length] = 5;
					choices[choices.length] = 5;
					choices[choices.length] = 5;
					choices[choices.length] = 5;
					choices[choices.length] = 5;
				}
				// Muscle
				// Effect: If tone less than 60 points - Increase by 3 to 5
				if(target.tone < 60 && target.toneUnlocked(target.tone + 3))
				{
					choices[choices.length] = 6;
					choices[choices.length] = 6;
					choices[choices.length] = 6;
					choices[choices.length] = 6;
					choices[choices.length] = 6;
				}
				// Beard
				// Effect: If beard not chest-length - Increase by 1" to 2"
				if(target.femininity < 20 && target.beardLength <= 12 && target.beardLengthUnlocked(target.beardLength + 1))
				{
					choices[choices.length] = 7;
					choices[choices.length] = 7;
					choices[choices.length] = 7;
					choices[choices.length] = 7;
					choices[choices.length] = 7;
				}
				// Breasts
				// Effect: If breast pair not flat - Decrease by 1
				if(target.hasBreasts() && target.breastRatingUnlocked(target.biggestTitRow(), target.biggestTitSize() - 1))
				{
					choices[choices.length] = 8;
					choices[choices.length] = 8;
					choices[choices.length] = 8;
					choices[choices.length] = 8;
					choices[choices.length] = 8;
				}

				//Default to no changes, then roll on the array for a change if some are available.
				var select:int = 9;
				if(choices.length > 0) select = choices[rand(choices.length)];

				// Effect: Lack cock - Increases cock by 1, 4 inch long, 1 inch thick cock. Penis type decided by race.
				if(select == 1)
				{
					kGAMECLASS.output("\n\nIt starts with a subtle warmth, sparking off in");
					if(!target.hasVagina() && !target.hasCock()) kGAMECLASS.output(" the middle of");
					kGAMECLASS.output(" your crotch");
					if(target.hasVagina()) kGAMECLASS.output(", right above your vagina");
					if(target.hasVagina())
					{
						kGAMECLASS.output(". Soon it becomes hotter, the heat centered above [pc.oneClit], bulging uncomfortably");
						if(target.isCrotchGarbed()) kGAMECLASS.output(", rubbing against your [pc.lowerGarments]");
					}
					else
					{
						kGAMECLASS.output(". Soon it becomes hotter, the heat centered on a tiny lump that is beginning to form on your [pc.crotch]");
						if(target.isCrotchGarbed()) kGAMECLASS.output(", rubbing against your [pc.lowerGarments]");
					}
					kGAMECLASS.output(".\n\nThe");
					kGAMECLASS.output(" bump");
					
					// Grow 4" long, 1" thick wiener.
					target.createCock(4, 1);
					// Length modifications
					if(target.hasPerk("Mini")) target.cocks[0].cLengthRaw -= 1;
					if(target.hasPerk("Hung")) target.cocks[0].cLengthRaw += 3+rand(4);
					
					kGAMECLASS.output(" bulges with flesh, stretching the skin around it to uncomfortable limits. Once it’s " + num2Text(target.cocks[0].cLengthRaw) + " inches long it stops growing. Instead, the tip of the limp tube of flesh suddenly twists into a new form, shaping itself into a cockhead. You can’t stop yourself from");
					if(target.isCrotchGarbed()) kGAMECLASS.output(" pulling down your [pc.lowerUndergarment] and admire");
					else kGAMECLASS.output(" admiring");
					kGAMECLASS.output(" your new phallus.");
					if(target.cocks[0].cLengthRaw <= 4) kGAMECLASS.output("\n\nIt’s tiny and flaccid, hardly worth any admiration, but y");
					else kGAMECLASS.output("\n\nY");
					kGAMECLASS.output("ou can’t resist grabbing it in your hands. It feels amazing. The transformative heat passes through it as you begin to stroke your new fuckstick. Slowly but steadily, it gradually fills with blood, growing engorged and erect. You release a small gasp of surprise at your new cock’s first boner, increasing the pace of your stroking.");
					kGAMECLASS.output("\n\nAfter a while you begin to grow frustrated. No matter how much you keep beating you just can’t seem to orgasm. As you tease its head with your finger, trying desperately to trigger your release to ecstasy, you find out that not only is the cockhole missing, there isn’t a urethra either. You don’t feel any different inside, so you’re probably missing a prostate too.");
					kGAMECLASS.output("\n\nJust as you finish that thought, the heat moves deeper into your body, right next to your rectum. You can feel it bloating, transforming the area of flesh into a productive spunk-factory. You can feel a pending orgasm as a cum-vein forms along your");
					if(target.cocks[0].cLengthRaw <= 4) kGAMECLASS.output(" tiny");
					else kGAMECLASS.output(" turgid");
					kGAMECLASS.output(" shaft. The transformation itself accelerates by the onset of rushing cum through the newly-formed conduit. It climbs through the bottom of your shaft until it reaches the tip. One, two, three shots of cum burst forth from your newly formed cumslit onto the floor below. Your codex confirms that it has sperm.");
					if(kGAMECLASS.silly && target.balls == 0) kGAMECLASS.output(" How does that even work?");
					
					// Morph the wieners to proper type based on race
					var pcRace:String = target.race();
					var prevLength:Number = target.cocks[0].cLengthRaw;
					var prevThickness:Number = target.cocks[0].cThicknessRatioRaw;
					target.setNewCockValues(0);
					kGAMECLASS.output(" <b>");
					switch(target.cocks[0].cType)
					{
						case GLOBAL.TYPE_EQUINE:
							kGAMECLASS.output("Your [pc.cockColor] cock has a medial ring and flares like a horse’s");
							break;
						case GLOBAL.TYPE_CANINE:
							kGAMECLASS.output("Your [pc.cockColor], veiny cock has a tapered head and a knot");
							if(pcRace.indexOf("ausar") != -1) kGAMECLASS.output(" like an ausar’s");
							else if (InCollection(pcRace, "vulpine-morph", "vulpine-taur", "kitsune", "kitsune-morph", "kitsune-taur")) kGAMECLASS.output(" a fox’s");
							else kGAMECLASS.output(" like a canine’s");
							break;
						case GLOBAL.TYPE_FELINE:
							kGAMECLASS.output("Your [pc.cockColor] cock is very much like a spike and is covered in soft barbs");
							break;
						case GLOBAL.TYPE_AVIAN:
							kGAMECLASS.output("Your [pc.cockColor] cock is slightly wavy shaped and tapered at the tip");
							break;
						case GLOBAL.TYPE_NAGA:
							kGAMECLASS.output("Your [pc.cockColor] cock is glossy smooth and tapers towards the tip");
							break;
						case GLOBAL.TYPE_BEE:
							kGAMECLASS.output("Your glossy [pc.cockColor] dick is much like the one of a human, but with a longer, stretchier foreskin");
							break;
						case GLOBAL.TYPE_KUITAN:
							kGAMECLASS.output("Your [pc.cockColor] dick has one large knot at the base followed by two smaller ones");
							break;
						case GLOBAL.TYPE_GRYVAIN:
							kGAMECLASS.output("Your dick is knoted at the base, ribbed along the shaft, and covered in [pc.cockColor] scales");
							break;
						case GLOBAL.TYPE_VULPINE:
							kGAMECLASS.output("Your [pc.cockColor], veiny cock has a tapered head and a knot like a fox");
							break;
						case GLOBAL.TYPE_RASKVEL:
							kGAMECLASS.output("Your [pc.cockColor] cock is pointed and hides inside a sheath most of the time");
							break;
						case GLOBAL.TYPE_DRACONIC:
							kGAMECLASS.output("Your [pc.cockColor] dick is tapered with a knot like bulb at its base");
							break;
						case GLOBAL.TYPE_DEMONIC:
							kGAMECLASS.output("Your [pc.cockColor] cock is shiny, covered in sensitive nodules and the head has rubbery protrusions, like the one of a demon");
							break;
						case GLOBAL.TYPE_KANGAROO:
							kGAMECLASS.output("Your [pc.cockColor] dick is much like a taproot that undulates gently and tapers to a point when erect");
							break;
						case GLOBAL.TYPE_SIMII:
							kGAMECLASS.output("Your dick has a [pc.cockColor] mushroom-like head and the shaft is covered in [pc.skinColor] [pc.skinNoun]");
							break;
						case GLOBAL.TYPE_SAURIAN:
							if(prevLength < 20 || prevThickness < 3) kGAMECLASS.output("The throbbing sensation hits you again and your new phallus continues to grow bigger... ");
							kGAMECLASS.output("Your [pc.cockColor]-colored dick is gigantic and massively thick, like that of a prehistoric thunder lizard");
							break;
						case GLOBAL.TYPE_VENUSPITCHER:
							kGAMECLASS.output("Your [pc.cockColor] cock appears very vine-like, moving to and fro like some kind of sentient plant");
							break;
						case GLOBAL.TYPE_SYDIAN:
							kGAMECLASS.output("Your [pc.cockColor] cock is covered in tiny brushes");
							break;
						case GLOBAL.TYPE_DAYNAR:
							kGAMECLASS.output("Your [pc.cockColor] cock has thick enough skin to obscure the veins and a tapered tip");
							break;
						case GLOBAL.TYPE_GABILANI:
							kGAMECLASS.output("Your [pc.cockColor] cock is much like a human with the exception of having an extra cockhead adjacent to the other");
							break;
						case GLOBAL.TYPE_TENTACLE:
							kGAMECLASS.output("Your [pc.cockColor] cock is constantly moist and moving with a slightly oversized mushroom-like head");
							break;
						case GLOBAL.TYPE_ANEMONE:
						case GLOBAL.TYPE_SIREN:
							kGAMECLASS.output("Your [pc.cockColor]-colored cock is covered in tentacles riddled with poisonous aphrodisiac");
							break;
						case GLOBAL.TYPE_SYNTHETIC:
							kGAMECLASS.output("Your new appendage changes into a more [pc.cockColor] color at its tip, making it appear very synthetic");
							break;
						case GLOBAL.TYPE_INHUMAN:
							if(pcRace.indexOf("sionach") != -1) kGAMECLASS.output("Your [pc.cockColor] cock has a pyramid-shaped head and the curved shaft is covered in reptilian bulbs");
							if(pcRace.indexOf("siel") != -1) kGAMECLASS.output("Your cock looks like a lumpy caterpillar with a small [pc.cockColor] tip");
							else kGAMECLASS.output("Your [pc.cockColor] cock appears very inhuman in shape");
							break;
						default:
							kGAMECLASS.output("Your dick has a [pc.cockColor] mushroom-like head and the shaft is covered in [pc.skinColor] [pc.skinNoun]");
							break;
					}
					kGAMECLASS.output("!</b>");
					
					//Cum thrice!
					target.orgasm();
					target.orgasm();
					target.orgasm();
				}
				// Effect: Less than 2 balls - Increases testicle count until 2
				else if(select == 2)
				{
					kGAMECLASS.output("\n\nYou");
					if(target.isCrotchGarbed()) kGAMECLASS.output(" take a peek inside your [pc.lowerUndergarment]");
					else kGAMECLASS.output(" look down at your groin");
					kGAMECLASS.output(" as a fervent heat appears ");
					if(target.hasCock() && target.hasVagina()) kGAMECLASS.output(" between your [pc.cock] and [pc.vagina].");
					else if(target.hasCock()) kGAMECLASS.output(" right below your [pc.cock].");
					else if(target.hasVagina()) kGAMECLASS.output(" right above your [pc.vagina].");
					else kGAMECLASS.output(" right in the middle of your crotch.");
					if(target.balls <= 0) kGAMECLASS.output(" The skin of that area bulges out and proceeds to loosen, thicken, and loosen again. It continues this sluggish process for several minutes, until the empty skin is large enough, upon which it finally scrunches up into an empty scrotum. <b>Seems like you have grown a [pc.skinFurScales] ballsack.</b>");
					else kGAMECLASS.output(" The transformation begins in your ballsack. Slowly it scrunches inward, the skin aggregating and holding your balls painfully tight against your body. Then, all at once, it loosens quickly. Your ball breathes in relief; now hanging much lower due to your looser sack.");
					kGAMECLASS.output("\n\nNow that your sack is ready, the feverish sensation builds again and concentrates on the flesh behind it. You bring your fingers toward it and feel a tiny lump forming inside. Slowly the lump turns into a small oval, sensitive to your touch. A");
					if(target.balls <= 0) kGAMECLASS.output("nother");
					kGAMECLASS.output(" testicle, no doubt. The new testicle");
					if(target.balls <= 0)
					{
						if(target.hasStatusEffect("Uniball")) kGAMECLASS.output(" grows comfortably");
						else kGAMECLASS.output(" falls");
						kGAMECLASS.output(" into the empty sack below. Another one quickly grows");
						if(target.hasStatusEffect("Uniball")) kGAMECLASS.output(", tightening the sack and snuggling against");
						else kGAMECLASS.output(" and falls, landing comfortably right next to");
						kGAMECLASS.output(" its brother.");
					}
					else
					{
						if(target.hasStatusEffect("Uniball")) kGAMECLASS.output(" swells quickly and rubs against");
						else kGAMECLASS.output(" drops down, budding against");
						kGAMECLASS.output(" your other ball. You enthusiastically await for another to join the twins, but as the heat subsides, you realize that it ain’t happening.");
					}
					
					// DragonballZ!
					if(target.balls <= 0)
					{
						target.ballSizeRaw = 2;
						if(target.hasPerk("Bulgy")) target.ballSizeRaw *= 2;
					}
					target.balls = 2;
					
					kGAMECLASS.output(" <b>You now have [pc.balls]");
					if(target.hasStatusEffect("Uniball")) kGAMECLASS.output(" housed tightly in your sack");
					kGAMECLASS.output(".</b>");
				}
				// Effect: Lipmod more than 1 - Decrease by 1
				else if(select == 3)
				{
					kGAMECLASS.output("\n\nThe heat begins to concentrate on your [pc.lips], telling you that the nanomachines are starting to do something else there. Slowly but surely, the warmth begins to weaken. You press your finger against them and feel them contract, losing a bit of their plushness. As the transformation grows cold, you slide your [pc.tongue] through them, confirming that is not only the size that changed, but also their sensitivity. Looking at yourself through your codex’s holocam you can see that they are thinner and, some could even say, tougher. You are definitely manlier than you were before. <b>Your lips have gotten a little smaller.</b>");
					
					// Change the stuff, but I dunno about the sensitivity though...
					target.lipMod--;
				}
				// Effect: If hips more than 1 point - Decrease by 1
				else if(select == 4)
				{
					// If garbed:
					if(target.isCrotchGarbed()) kGAMECLASS.output("\n\nSuddenly your [pc.lowerGarments] slips a bit from your waist. As you adjust your clothing back, <b>you find that your [pc.hips] have straightened out slightly.</b>");
					// If nude:
					else kGAMECLASS.output("\n\nYour stance feels slightly uncomfortable and, after adjusting it several times, <b>you realize that your [pc.hips] are straighter than before.</b>");
					target.hipRatingRaw--;
				}
				// If butt not 1 point - Decrease by 1
				else if(select == 5)
				{
					kGAMECLASS.output("\n\nFor a few seconds your bum feels numb and you almost lose your balance. You try to walk it off, with every step feeling slightly easier than before, like your center of gravity has changed. You bring your hands to your [pc.butt] and instead find it firmer and tighter than before. <b>Looks like it has lost some of its former bubbliness!</b>");
					target.buttRatingRaw--;
				}
				// If tone less than 60 points - Increase by 3 to 5
				else if(select == 6)
				{
					target.modTone(3 + rand(3));
				}
				// Effect: If beard not chest-length - Increase by 1" to 2"
				else if(select == 7)
				{
					// No beard: Grow one--length is thickness of a dime, I guess.
					if(!target.hasBeard())
					{
						target.beardLength = 0.05;
						kGAMECLASS.output("\n\nYour jaw tingles for a bit before turning into a maddening itch. You bring your fingers to scratch it only to find your chin covered in a thin mat of hair. <b>Seems like you’ve the beginnings of a beard!</b>");
					}
					// For the stubble.
					else if(target.beardLength < 0.125)
					{
						kGAMECLASS.output("\n\nYour [pc.beard] tickles your jaw for a little bit, bringing yourself to scratch it. As soon as it begins, the sensation abruptly stops. You experimentally run your fingers along it, feeling its very rugged surface. <b>Your beard has now grown into a fine five o’clock shadow.</b>");
						target.beardLength = 0.125;
					}
					// For just half-inch.
					else if(target.beardLength < 0.5)
					{
						kGAMECLASS.output("\n\nWithout touching it, you can feel your [pc.beard] physically grow on your face. Reflexively, you brush your hand across it and can confirm that <b>it’s now a half-inch long beard.</b>");
						target.beardLength = 0.5;
					}
					// For whole numbers.
					else if(target.beardLength < 1)
					{
						kGAMECLASS.output("\n\nYour [pc.beard] suddenly feels itchy and you quickly give it a scratch. The sensation passes and you can feel that it is definitely longer than it was previously. <b>Your beard is now 1-inch long.</b>");
						target.beardLength = 1;
					}
					// Has beard: Grow 1" to 2"
					else
					{
						x = 1 + rand(2);
						kGAMECLASS.output("\n\nYour [pc.beard] tickles your jaw for a little bit, bringing yourself to scratch it. After a while, the sensation stops and you pass your fingers through it. <b>You can confirm that it’s slightly longer than it was before, gaining about " + num2Text(x) + " inches of beard.</b>");
						target.beardLength += x;
					}
					if (target.beardStyle != 0 && target.beardStyleUnlocked(0))
					{
						if(target.beardLength >= 1)
						{
							kGAMECLASS.output(" It seems the growth was not as neat as it should be... You’ll have to get it ");
							if (target.beardStyle != 0) kGAMECLASS.output("re-");
							kGAMECLASS.output("styled somewhere if you want it to look a certain way...");
						}
						target.beardStyle = 0;
					}
				}
				// Effect: If breast pair not flat - Decrease by 1
				else if(select == 8)
				{
					x = target.biggestTitRow();
					
					kGAMECLASS.output("\n\nYour [pc.breasts] suddenly grow warmer and your [pc.nipples] feel more sensitive. You grab");
					if(target.totalBreasts() == 1) kGAMECLASS.output(" it");
					else kGAMECLASS.output(" one of them");
					kGAMECLASS.output(" and examine it, carefully avoiding your [pc.nipples]. No need to get");
					if(target.lust() < 10) kGAMECLASS.output(" horny.");
					else kGAMECLASS.output(" hornier.");
					kGAMECLASS.output(" It dawns on you what’s happening when you feel its mass slowly receding into your body");
					if(target.totalBreasts() > 1)
					{
						kGAMECLASS.output(" and you can see its sister");
						if(target.totalBreasts() > 2) kGAMECLASS.output("s");
						kGAMECLASS.output(" following suit");
					}
					
					// Shrink all the boobies...  :C
					for (x = 0; x < target.breastRows.length; x++)
					{
						if(target.breastRows[x].breastRatingRaw >= 1) target.breastRows[x].breastRatingRaw--;
						if(target.breastRows[x].breastRatingRaw < 0) target.breastRows[x].breastRatingRaw = 0;
					}
					
					kGAMECLASS.output(". When it’s over you realize that <b>");
					if(target.biggestTitSize() < 1)
					{
						if(target.tone < 50)
						{
							kGAMECLASS.output("you’re now flat");
							if(kGAMECLASS.silly) kGAMECLASS.output(" as a pancake");
						}
						else
						{
							kGAMECLASS.output("you have an impressive");
							if(target.totalBreasts() == 2) kGAMECLASS.output(" pair of");
							else if(target.totalBreasts() > 2) kGAMECLASS.output(" set of");
							kGAMECLASS.output(" pec");
							if(target.totalBreasts() > 1) kGAMECLASS.output("s");
						}
					}
					else
					{
						kGAMECLASS.output("you’ve lost one cup size");
						if(target.breastRows.length > 1) kGAMECLASS.output(" in each row");
					}
					kGAMECLASS.output("!</b>");
				}
				else if(select == 9)
				{
					kGAMECLASS.output("\n\nAfter a while you realize that you aren’t get anything more out of this dose. ManUp must be running out of ways to make you manlier.");
				}
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " injects the drug to no effect.");
			}
			return false;
		}
		protected function rand(max:Number):Number
		{
			return int(Math.random()*max);
		}
	}
}
