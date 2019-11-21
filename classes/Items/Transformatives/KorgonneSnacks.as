package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	
	public class KorgonneSnacks extends ItemSlotClass
	{
		
		//constructor
		public function KorgonneSnacks()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "K.Snax";
			//Regular name
			this.longName = "korgonne snacks"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "some korgonne snacks";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This packet of dried Uvetan foods is a favorite of the korgonne. Inside are two kinds of fish, a brittle wafer of indeterminate origin, and grainy mix of mineral seasonings. Your nose wrinkles in confusion at the alien aromas present, and your Codex informs you that these items are not fit for typical human consumption. It’s a safe bet your prototype immune system will kick in should you try to eat this, likely inducing korgonne-like mutations.\n\n<b>Known to cause moderate amounts of taint. Check your Codex for details.</b>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 25;
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
			kGAMECLASS.clearOutput();
			author("Lash Charge");
			if(target is PlayerCharacter) {
				var pc:Creature = target;
				var changes:int = 0;
				var changeLimit:int = 1;
				var temp:String = "";
				var choices:Array = new Array();
				var x:int = -1;
				if(rand(2) == 0) changeLimit++;
				if(rand(3) == 0) changeLimit++;
				if(changes < 3 && rand(2) == 0) changeLimit++;

				//Consume
				output("You unwrap the foreign treats. Placing the fish on the wafer, you sprinkle them with the included seasonings in hopes that it will improve the flavor. Sure enough, you find the result to be perfectly edible - if worryingly tingly on your tongue. A few bites later, and the evidence is safely stored in your belly. All you can do now is wait and hope the results are pleasant...");
				pc.taint(3);
				//Top chances:
				//Height reduction to 5'3"
				//Thickness increase to 67 - lower chance
				
				//Thicc hips for laydeez
				//Bigass butt for laydeez
				//Big ol butt for DA BOIS

				//Cock TF to canine w/sheath. Set color to blueeeeee
				//Cunt to Korgonne type! - need to do Creature.as/appearance updates
				
				//Change nips to blue
				//Change lips to blue
				//Change butthole to blue :3

				//Ears to Korgonne type - triangular and rounded - need appearance update/Creature.as
				//Korgonne tail TF - need Creatures.as/appearance updates
				//Furry canine arms

				//Legs to canine type - EZ copy/paste
				//Face TF (REQ EARS) - korgonne face type - need Creature.as/appearance
				//Full bodyfur! (REQ FACE) - ez copy/paste


				//Height reduction to 5'3"
				if(pc.tallness > (5*12+3) && changes < changeLimit && rand(3) == 0)
				{
					//POACHED FROM RUSKVEL
					//Above 7 feet:
					if(pc.tallness >= 6*12) {
						kGAMECLASS.output("\n\nYou rub your back - which feels prickly - and frown suspiciously at the world around you. Everything seems slightly bigger than you remember it being. Are you getting shorter? No – it’s everything else getting too damn big. Definitely.");
						pc.tallness -= (2 + rand(2) + Math.round(pc.tallness/6 - 8));
					}
					//7 feet and below:
					else
					{
						kGAMECLASS.output("\n\nYou sigh as your body condenses and the floor gets a little closer. The way most people look at you now you can only be described as patronizing, but you don’t mind – the sense of balance that comes with such a low centre of gravity makes you feel right, more connected with the world that your senses tell you is the most important. Anyway, when a tall person’s hands are level with your throat it means your teeth are level with their groin.");
						pc.tallness -= 1 + rand(2);
					}
					changes++;
				}
				//Thickness increase to 67 - lower chance
				if(changes < changeLimit && pc.thickness < 67 && rand(3) == 0)
				{
					var thiccMod:Number = 5+rand(3);
					//Poached from DracoGuard
					if(pc.thickness < 30) thiccMod += 4;
					if(pc.thickness < 15) thiccMod += 4;
								
					if(pc.thicknessUnlocked(pc.thickness + thiccMod))
					{
						output("\n\nYou feel a rumble in your tummy, just enough to make you sigh and put a hand to it, enjoying the faintly full sensation. Your skin feels a little looser now that you think about it, like your weight’s shifting around a little. You glance down and pat your belly and thighs, pretty sure that you’re a little thicker now.");
						
						pc.thickness += thiccMod;
						changes++;
					}
					else output("\n\n" + pc.thicknessLockedMessage());
				}
				//Thicc hips for laydeez
				if(rand(2) == 0 && pc.hipRatingRaw < 14 && (pc.mf("","f") == "f" || pc.hasVagina()) && changes < changeLimit)
				{
					if(pc.hipRatingUnlocked(pc.hipRating()+1))
					{
						output("\n\nYour gait shifts to accommodate a waist that suddenly seems a little wider.");
						if(pc.hipRatingRaw+1 >= 4 && pc.hipRatingRaw < 4) output(" <b>You’ve got well-formed hips!</b>");
						else if(pc.hipRatingRaw+1 >= 6 && pc.hipRatingRaw < 6) output(" <b>You’ve got noticeable hips!</b>");
						else if(pc.hipRatingRaw+1 >= 10 && pc.hipRatingRaw < 10) output(" <b>You’ve got curvy hips!</b>");
						else if(pc.hipRatingRaw+1 >= 14 && pc.hipRatingRaw < 14) output(" <b>You’ve got thick hips, just like a korgonne!</b>");
						pc.hipRatingRaw++;
					}
					else output("\n\n" + pc.hipRatingLockedMessage());
					changes++;
				}
				//Bigass butt for laydeez
				if(rand(2) == 0 && pc.buttRatingRaw < 15 && (pc.mf("","f") == "f" || pc.hasVagina()) && changes < changeLimit)
				{
					if(pc.buttRatingUnlocked(pc.buttRating()+1))
					{
						if(pc.buttRatingRaw < 8) output("\n\nYou teeter for a second, seemingly unbalanced. In hindsight, you’re pretty sure your butt just got bigger.");
						else if(pc.buttRatingRaw < 13) output("\n\nYou nearly tip over backward as some extra weight packs onto your derriere. Your butt is definitely growing as a result of the rich Uvetan food.");
						else output("\n\nA stray muscle twitch makes your butt wobble... for a little longer than it otherwise would. It’s getting bigger!");

						if(pc.buttRatingRaw+1 >= 6 && pc.buttRatingRaw < 6) output(" <b>You’ve got hand-filling ass-cheeks!</b>");
						else if(pc.buttRatingRaw+1 >= 8 && pc.buttRatingRaw < 8) output(" <b>You’ve got a squeezable booty!</b>");
						else if(pc.buttRatingRaw+1 >= 10 && pc.buttRatingRaw < 10) output(" <b>You’ve got a spacious ass!</b>");
						else if(pc.buttRatingRaw+1 >= 13 && pc.buttRatingRaw < 13) output(" <b>You’ve got an expansive ass!</b>");
						else if(pc.buttRatingRaw+1 >= 15 && pc.buttRatingRaw < 15) 
						{
							output(" <b> You’ve got big, wide korgonne-style ass now!</b>");
							//SUPER BONUS TAIL-GROW!
							if(pc.tailCountUnlocked(1) && pc.tailCount == 0 && pc.tailTypeUnlocked(GLOBAL.TYPE_KORGONNE))
							{
								output(" A second later, a tightly-curled, bushy tail pops out of your spine to wiggle above the glorious globes below. <b>You have a korgonne tail!</b>");
								pc.tailCount = 1;
								pc.clearTailFlags();
								pc.addTailFlag(GLOBAL.FLAG_FURRED);
								pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
								pc.tailType = GLOBAL.TYPE_KORGONNE;
							}
						}
						pc.buttRatingRaw++;
					}
					else output("\n\n" + pc.buttRatingLockedMessage());
					changes++;
				}
				//Big ol butt for DA BOIS
				else if(rand(2) == 0 && pc.buttRatingRaw < 8 && (pc.mf("","f") != "f" || pc.hasCock()) && changes < changeLimit)
				{
					if(pc.buttRatingUnlocked(pc.buttRating()+1))
					{
						output("\n\nYou teeter for a second, seemingly unbalanced. In hindsight, you’re pretty sure your butt just got bigger.");
						if(pc.buttRatingRaw+1 >= 6 && pc.buttRatingRaw < 6) output(" <b>You’ve got hand-filling ass-cheeks!</b>");
						else if(pc.buttRatingRaw+1 >= 8 && pc.buttRatingRaw < 8) output(" <b>You’ve got a squeezable booty!</b>");
						pc.buttRatingRaw++;
					}
					else output("\n\n" + pc.buttRatingLockedMessage());
					changes++;
				}

				//Cock TF to canine w/sheath. Set color to blueeeeee
				//POACHED FROM AUSARTREATS
				choices = new Array();
				for(x = 0; x < pc.cockTotal(); x++)
				{
					if(pc.cocks[x].cType != GLOBAL.TYPE_CANINE) choices[choices.length] = x;
				}
				//Set x to a random dick from choices
				if(choices.length > 0) x = choices[rand(choices.length)];
				//Else set to -1, code for NODONG NOGO
				else x = -1;
				//Actually check if have cockchangability
				if(changes < changeLimit && x >= 0 && rand(3) == 0)
				{
					if(target.cockTypeUnlocked(x,GLOBAL.TYPE_CANINE))
					{
						kGAMECLASS.output("\n\nYour [pc.cock " + x + "] throbs suddenly ");
						if(pc.isCrotchGarbed()) kGAMECLASS.output("beneath your [pc.lowerGarments]");
						else if(pc.legCount == 1) kGAMECLASS.output("on your [pc.leg]");
						else kGAMECLASS.output("between your [pc.legs]");
						kGAMECLASS.output(", swelling to its full size as a strange heat radiates through your body. You grab your simmering penis as the alien concoction takes effect, rewriting your most sensitive places. You double over in a sick twist of pain and pleasure");
						if(pc.cocks[x].cockColor != "pale blue")
						{
							kGAMECLASS.output(" as the flesh of your cock shifts color to pale blue");
						}
						if(!pc.hasCockFlag(GLOBAL.FLAG_TAPERED)) kGAMECLASS.output(", skin melding strangely into a long, pointed shape");
						kGAMECLASS.output(".");
						//if cock was less than 6 inches: 
						if(pc.cocks[x].cLength() < 6) {
							kGAMECLASS.output(" Your prick grows, too, expanding several inches from your groin.");
							pc.cocks[x].cLength(2+rand(3));
						}
						if(!pc.hasCockFlag(GLOBAL.FLAG_TAPERED)) kGAMECLASS.output(" The [pc.cockHead " + x + "] of your dick twists into a pointed tip");
						else kGAMECLASS.output(" The [pc.cockHead " + x + "] jumps");
						kGAMECLASS.output(", drooling a sticky [pc.cumColor] river from its engorged slit.");
						if(pc.balls > 0) kGAMECLASS.output(" Just over your [pc.balls]");
						else kGAMECLASS.output(" Just ahead of the base");
						kGAMECLASS.output(", your member’s flesh engorges exponentially, swelling into a thick, cum-engorged knot. With a cry, you fall to the ground as the new doggy-cock discharges its heady load, shooting a thick rope of [pc.cum] through the swollen knot and onto the ground.");
						kGAMECLASS.output("\n\nYou spend a few moments collecting yourself, cleaning the spunk off your new puppy pecker and adjusting to the heft and weight of the knot.");
						pc.lust(20+rand(20));
						pc.libido(2);
						changes++;
						pc.shiftCock(x, GLOBAL.TYPE_KORGONNE);
					}
					else
					{
						kGAMECLASS.output("\n\n" + target.cockTypeLockedMessage());
					}
				}
				//Cunt to Korgonne type! - need to do Creature.as/appearance updates
				choices = new Array();
				for(x = 0; x < pc.vaginaTotal(); x++)
				{
					if(pc.vaginas[x].type != GLOBAL.TYPE_KORGONNE) choices[choices.length] = x;
				}
				//Set x to a random cooch from choices
				if(choices.length > 0) x = choices[rand(choices.length)];
				//Else set to -1, code for NOGO
				else x = -1;
				if(changes < changeLimit && x >= 0 && rand(3) == 0)
				{
					if(target.vaginaTypeUnlocked(x,GLOBAL.TYPE_CANINE))
					{
						output("\n\nAn inexplicable fire lights ");
						if(pc.legCount > 1) output("between your [pc.legs]");
						else output("between your thighs");
						output(", burning like a furnace. You whimper and double over as the flesh there clenches down, your [pc.vagina " + x + "] going wild. You grow acutely aware of the emptiness inside you as the inferno dies down to a pleasant, lusty heat. Mutagenic quivers ripple through your feminine slit, rapid-fire. Each on changes it a little more.");
						if(!pc.hasPlumpPussy(x)) output(" Your mound quivers and plumps.");
						if(pc.vaginas[x].vaginaColor != "pale blue") output(" Starting at the slit, creamy blue stains your skin, spreading until you have a cerulean cunt.");
						if(pc.vaginas[x].clits > 2) output(" Clits vanish until you’re left with just the one at the top.");
						if(pc.vaginas[x].clits > 1) output(" The extra clit vanishes to leave you with just the one in the usual place.");
						output(" A few inches inside, bundles of nerve cluster together in anticipation of being stretched out by a knot.");
						output("\n\nYou pant like a horny bitch as the changes finish, <b>leaving you with a korgonne pussy.</b>");
						pc.libido(2);
						//You thought I was dog, but it was me, KORGONNE THE WHOLE TIME!
						pc.shiftVagina(x, GLOBAL.TYPE_KORGONNE);
					}
					else
					{
						kGAMECLASS.output("\n\n" + target.vaginaTypeLockedMessage());
					}
					changes++;
				}				
				//Vaginal wetness+ - STOLEN FROM AUSAR TREATS
				choices = new Array();
				for(x = 0; x < pc.vaginaTotal(); x++)
				{
					if(pc.wetness(x) < 3) choices[choices.length] = x;
				}
				//Set x to a random cooch from choices
				if(choices.length > 0) x = choices[rand(choices.length)];
				//Else set to -1, code for NOGO
				else x = -1;
				if(changes < changeLimit && x >= 0 && rand(5) == 0)
				{
					kGAMECLASS.output("\n\nYou shudder violently as waves of pleasure suddenly shoot up through your loins. A flush of wetness pours down your [pc.legOrLegs] as your cunt contracts rhythmically, drooling a steady river of [pc.girlCum] - more than you’re used to producing. You shudder and sigh as your cunny nearly orgasms, just cresting the peaks of pleasure before the excess lube finally dissipates. Still, you feel a whole lot wetter than usual. You could definitely handle bigger cocks and toys now.");
					pc.libido(1);
					pc.lust(20+rand(20));
					pc.vaginas[x].wetness(1);
					changes++;
				}
				//Change nips to blue
				if(pc.nippleColor != "blue" && changes < changeLimit && rand(3) == 0 && pc.korgonneScore() >= 3)
				{
					if(pc.nippleColorUnlocked("blue"))
					{
						output("\n\nYour [pc.nipples] perk up all on their own. In a flash, you’re grabbing at your chest and watching for signs of change. Then it hits: blossoms of blue coloration congealing in the centers. They pulsate with your heartbeat, spreading out until <b>your chest is capped with blue peaks!</b>");
						pc.nippleColor = "blue";
					}
					else output("\n\n" + pc.nippleColorLockedMessage());
					changes++;
				}
				//Change lips to blue
				if(pc.lipColor != "blue" && changes < changeLimit && rand(6) == 0)
				{
					output("\n\nYour [pc.lipsChaste] go momentarily numb. At first you assume it’s an effect of the korgonne spices, but after a bit, you take a glance in your Codex’s camera and discover <b>your blue-colored lips!</b> Exotic.");
					pc.lipColor = "blue";
					changes++;
				}
				//Change tongue to blue
				if(pc.tongueType != GLOBAL.TYPE_KORGONNE && changes < changeLimit && rand(3) == 0)
				{
					if(pc.tongueTypeUnlocked(GLOBAL.TYPE_KORGONNE))
					{
						if(!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("\n\nRippling, uncomfortable swelling of your tongue forces you to open your mouth. Just in time too, as inch after inch of newly-grown muscle slithers out of your lips to dangle freely. It’s shockingly blue. You nearly it in your surprise. After a second, a twinge in your neck reels it most of the way back in, but it seems more comfortable to let the tip flop out over your lower lip. <b>That’s definitely a korgonne tongue!</b>");
						else
						{
							output("\n\nA twist of your oral muscles violently expels your tongue from your mouth, just in time for you to see blue splotches spreading over it like wildfire. As you start to panic, it sheds inches. It looks like you’re slurping up your tongue, but in reality, it’s simply getting shorter. You wiggle it experimentally as the blue consumes the last holdouts of your oral muscle. Your tongue has stopped shrinking with much of its length intact, <b>leaving you with a korgonne tongue.</b> Weirdly, you have trouble holding it entirely in your mouth. Resting the tip on your lower lip is easier.");
						}
						pc.tongueType = GLOBAL.TYPE_KORGONNE;
						pc.clearTongueFlags();
						pc.addTongueFlag(GLOBAL.FLAG_LONG);
					}
					else output("\n\n" + pc.tongueTypeLockedMessage());
					changes++;
				}
				//Ears to Korgonne type - triangular and rounded - need appearance update/Creature.as
				if(pc.earType != GLOBAL.TYPE_KORGONNE && changes < changeLimit && rand(4) == 0)
				{
					//RIPPED & EDITED FROM AUSARTREATS
					if (target.earTypeUnlocked(GLOBAL.TYPE_KORGONNE))
					{
						kGAMECLASS.output("\n\nYour ears begin to itch uncontrollably. You desperately try to scratch at them, but the itch spreads and grows... as do your ears! Your ears twist and morph, growing a thin layer of " + pc.furColor + " fur as they reshape into a pair of triangular, canine ears with rounded points. You experimentally move them, feeling them perk and flop at your command. And you can hear so much better than before, every slight creak and rustle around you is so clear now! <b>You now have a korgonne’s fuzzy ears!</b>");
						pc.earType = GLOBAL.TYPE_KORGONNE;
						target.clearEarFlags();
						target.addEarFlag(GLOBAL.FLAG_TAPERED);
						target.addEarFlag(GLOBAL.FLAG_FURRED);
						changes++;
					}
					else kGAMECLASS.output("\n\n" + target.earTypeLockedMessage());
				}
				//Korgonne tail TF - need Creatures.as/appearance updates
				if(pc.tailType != GLOBAL.TYPE_KORGONNE && changes < changeLimit && rand(4) == 0)
				{
					//Again ripped from Ausar Treats
					if (target.tailTypeUnlocked(GLOBAL.TYPE_KORGONNE))
					{
						// If PC had a tail before:
						if(pc.tailCount == 1) kGAMECLASS.output("\n\nYou feel something itching on your [pc.tail]. Twisting around, you watch in a mix of horror and excitement as " + pc.furColor + " bristles, the beginnings of a thick coat of fur, sprout up across the length of your reforming posterior appendage. It starts wagging as the change completes, curling upward and <b>leaving you with an korgonne’s dog-like tail.</b>");
						//Multitails
						else if(pc.tailCount == 2) kGAMECLASS.output("\n\nYour [pc.tails] knot together, torturing you with brief convulsions. A kind of numb heat spreads through them, forcing you to twist about for a visual inspection. They’re merging together into a single, narrow entity. The flesh crawls eerily as it assume its new shape, curling upward. Hairs sprout out of it while you watch, thickening into a coat of fur. <b>Your [pc.tails] have combined into a single korgonne tail.</b>");
						// If PC is tailless peasant:
						else
						{
							kGAMECLASS.output("\n\nOuch! A knot of discomfort forms just above your [pc.butt] as if it had suffered a nasty sting or bite, but no such injury occured. You twist for a look at it");
							if(pc.isCrotchGarbed()) kGAMECLASS.output(", peeling back your [pc.underGarments]");
							kGAMECLASS.output(". There’s a raised, irritated lump there, and it’s getting bigger. Wiggling slightly, it extends as new bones form within it, gently wagging as it lengthens. You’re growing a tail! Fine hairs sprout on its [pc.skin], giving it a distinctly canine cast. When it finishes growing, it’s not very long and curls upward, the better to flap back and forth when you’re pleased; <b>you’ve obviously gained a korgonne’s tail.</b>");
						}
						pc.tailCount = 1;
						pc.tailType = GLOBAL.TYPE_KORGONNE;
						pc.clearTailFlags();
						pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
						pc.addTailFlag(GLOBAL.FLAG_FURRED);
						changes++;
					}
					else kGAMECLASS.output("\n\n" + target.tailTypeLockedMessage());
				}
				//Furry canine arms
				//Change arm type to furred - POACHED FROM AUSAR TREATOS
				if(pc.armType != GLOBAL.TYPE_KORGONNE && changes < changeLimit && rand(3) == 0)
				{
					if (target.armTypeUnlocked(GLOBAL.TYPE_KORGONNE))
					{
						kGAMECLASS.output("\n\nYou feel a powerful itch spread across your arms. You clutch at them, scratching violently as your hair grows and thickens, spreading out into a dark mat across your [pc.skin]. Within a few minutes, <b>your arms are utterly covered in thick " + pc.furColor + " fur</b>! At least you’ll keep a little warmer, now.... Meanwhile, your fingers have shortened slightly, nails replaced by blunted claws. <b>Soft pads line your fingers and palms</b> to help you maintain grip in spite of your new fur coat.");
						pc.armType = GLOBAL.TYPE_KORGONNE;
						pc.clearArmFlags();
						pc.addArmFlag(GLOBAL.FLAG_FURRED);
						pc.addArmFlag(GLOBAL.FLAG_PAWS);
						changes++;
					}
					else kGAMECLASS.output("\n\n" + target.armTypeLockedMessage());
				}
				//Legs to canine type - EZ copy/paste - Stolen from Ausar Treats AGAIN
				//Change leg-type to furred (Needs Bipedal legs)
				if(pc.legType != GLOBAL.TYPE_KORGONNE && changes < changeLimit && pc.legCount >= 2 && rand(3) == 0)
				{
					if (target.legTypeUnlocked(GLOBAL.TYPE_KORGONNE))
					{
						kGAMECLASS.output("\n\nYou feel a powerful itch spread across your [pc.legs]. You clutch at them, scratching violently as your hair grows and thickens, spreading out into a dark mat across your [pc.skin]. Within a few minutes, your legs are utterly covered in a thick, silky-smooth " + pc.furColor + " fur!");
						if(!pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output(" More pressing is how the itching distracted you from the real changes going on beneath. The joints are all different, bending at odd angles, much like a dog’s leg.");
						if(!pc.hasLegFlag(GLOBAL.FLAG_PAWS)) output(" And your feet have changed as well, reshaping into a clawed, canine shape with short toes and lots of padding. You barely resist the urge to squeeze them.");
						output(" <b>These are definitely korgonne legs!</b>");
						if(pc.isTaur())
						{
							output(" The change extends beyonds just your [pc.legs]. It reaches all the way up your lower body. <b>From the waist down, you’re built like a huge dog!</b>");
						}
						pc.legType = GLOBAL.TYPE_KORGONNE;
						pc.clearLegFlags();
						pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
						pc.addLegFlag(GLOBAL.FLAG_FURRED);
						pc.addLegFlag(GLOBAL.FLAG_PAWS);
						changes++;
					}
					else kGAMECLASS.output("\n\n" + target.legTypeLockedMessage());
				}
				//Change leg type to bipedal?
				if(pc.legType != GLOBAL.TYPE_KORGONNE && changes < changeLimit && pc.legCount != 2 && rand(3) == 0)
				{
					if (target.legTypeUnlocked(GLOBAL.TYPE_KORGONNE))
					{
						if(pc.legCount < 2)
						{
							kGAMECLASS.output("\n\nYour [pc.leg] wobbles then folds, dropping you onto your [pc.butt]. It thrashes wildly around, uncontrolled and spasmatic. Something inside is changing, and you’re helpless to do anything but clench your fists and hold on for the ride. A seam appears in your [pc.leg] a moment before it divides into two leg-like shapes. Fur springs up all over them, and after a few seconds, you’re left with two fur-covered legs. <b>You have two korgonne legs!</b>");
						}
						//More than biped
						else
						{
							kGAMECLASS.output("\n\nYour [pc.legs] wobble and then fold, dropping you flat on your [pc.butt]. They thrash wildly, so fast you can barely track them, then collide. This time, they stick together, reshaping into two distinct, bipedal legs. Fur springs up all over the new limbs, and by the time it finishes, <b>you’ve grown korgonne-like legs.</b>");
						}
						pc.legCount = 2;
						pc.genitalSpot = 0;
						pc.legType = GLOBAL.TYPE_KORGONNE;
						pc.clearLegFlags();
						pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
						pc.addLegFlag(GLOBAL.FLAG_FURRED);
						pc.addLegFlag(GLOBAL.FLAG_PAWS);
						changes++;
					}
					else kGAMECLASS.output("\n\n" + target.legTypeLockedMessage());
				}
				//Face TF (REQ EARS) - korgonne face type - need Creature.as/appearance
				//Copied from CaninePoppahs
				if(pc.faceType != GLOBAL.TYPE_KORGONNE && pc.earType == GLOBAL.TYPE_KORGONNE && pc.hasFur() && rand(4) == 0 && changes < changeLimit)
				{
					if(pc.faceTypeUnlocked(GLOBAL.TYPE_KORGONNE))
					{
						output("\n\nA sudden burst of pain lights up your cheeks as you feel the bones underneath creaking. The sensation spreads across your [pc.face], the feeling intensifying in your teeth as they grow into a much sharper, carnivorous set. Your bones continue reform while your nose and jaw shift into position, ");
						if(pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED)) output("the pain slowly subsiding now that your muzzle has reshaped into a short canine one");
						else output("painfully elongating and stretching farther from your face. The agony begins to subside when your face settles into a short, canine muzzle");
						output(". For a short moment, you find your breathing closed off as your nose turns black and moist. A few last cracks announce your bones falling into place, then silence. You check your appearance in the Codex and notice that <b>you now have a korgonne’s muzzle.</b>");
						pc.faceType = GLOBAL.TYPE_KORGONNE;
						pc.clearFaceFlags();
						pc.addFaceFlag(GLOBAL.FLAG_MUZZLED);
						pc.addFaceFlag(GLOBAL.FLAG_FURRED);
						pc.addFaceFlag(GLOBAL.FLAG_FLUFFY);
					}
					else output("\n\n" + pc.faceTypeLockedMessage());
					changes++;
				}
				if(pc.hasArmFlag(GLOBAL.FLAG_FURRED) && pc.hasLegFlag(GLOBAL.FLAG_FURRED) && changes < changeLimit && rand(2) == 0 && pc.furColor != "white" && pc.furColor != "tawny")
				{
					var newColor:String = "white";
					if(rand(2) == 0) newColor = "tawny";
					if(pc.furColorUnlocked(newColor))
					{
						output("The fur on your limbs shimmers brightly. You do a double-take, but by the time you look back, it has already changed color. <b>You have " + newColor + " fur now!");
						pc.furColor = newColor;
					}
					else output("\n\n" + pc.furColorLockedMessage());
					changes++;
				}
				//Full bodyfur! (REQ ARMS/LEGS) - ez copy/paste
				//Poached from Canine Poppah
				if(!pc.hasFur() && changes < changeLimit && pc.armType == GLOBAL.TYPE_KORGONNE && pc.legType == GLOBAL.TYPE_KORGONNE)
				{
					if(pc.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FUR))
					{
						if(pc.skinType == GLOBAL.SKIN_TYPE_GOO) output("\n\nThe surface of your goo body feels strange and tingly. Looking at it, you see that it’s slowly shifting into skin, losing its translucence and becoming much more solid. The transformation continues until you are left with only [pc.skinColor] skin. The tingling sensation turns into an itch as new hair sprouts all over your body, completely covering it. <b>You’ve grown [pc.furColor] fur!</b>");
						//Scales/Feathers skin:
						else if(InCollection(pc.skinType, [GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_FEATHERS])) 
						{
							output("\n\nA sudden itch spreads throughout your body. A powerful urge to scratch yourself wells up within you. Doing anything other than caving into it never crosses your mind. You scratch and scratch all over until you spot a single [pc.furColor] ");
							if(pc.hasScales()) output("scale");
							else output("feather");
							output(" on the ground. More ");
							if(pc.hasScales()) output("scales");
							else output("feathers");
							output(" gather at your [pc.feet], prompting you to stop scratching for a moment out of worry. Your concerns are soon drowned out by the overwhelming itchiness, though, leading you to scratch yourself like you’ve never scratched before. From beneath every ");
							if(pc.hasScales()) output("scale that flakes");
							else output("feather that falls");
							output(" off, a patch of thin hair grows. Only when the thin hairs grow thicker, completely covering your entire body in a beautiful coat of fur, does the itching stop. <b>You have [pc.furColor] fur!</b>");
						}
						else if(pc.skinType == GLOBAL.SKIN_TYPE_CHITIN)
						{
							output("\n\nA loud crack splits the air as a piece of chitin falls off of you. Twisting in alarm, you discover fur sprouted from the bare skin underneath. Meanwhile, spiderwebs of fractures work their way through the rest of your armored body, painlessly breaking apart the hard shell that once protected you to make room for softer, warmer fur. As the last piece of hardened chitin hits the ground, <b>your fur coat finishes growing in.</b>");		
						}
						//Bare Skin:
						else output("\n\nYou feel an itch starting on your back, and you reach to scratch it. Unfortunately, you can’t quite get at it, but the itch continues to grow stronger, forcing you to strain still harder in an attempt to reach the elusive spot. You do manage to get a few good scratches in before you realize that particular spot is now covered in a patch of fur. Similar itches begin all over your body, followed by more patches of fur. When the itching stops, you find that <b>your body is completely covered in [pc.furColor] fur!</b>");
						pc.clearSkinFlags();
						pc.skinType = GLOBAL.SKIN_TYPE_FUR;
						pc.addSkinFlag(GLOBAL.FLAG_FURRED);
					}
					else output("\n\n" + pc.skinTypeLockedMessage());
					changes++;
				}
				//Dud
				if(changes == 0) output("\n\nAfter waiting a long while, you realize that this one is a dud. That or you’re as dog-like as you’re going to get. One of the two.");
				return false;
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " happily snacks on the korgonne treats.");
			}
			return false;
		}
	}
}