package classes.Items.Transformatives
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Ruskvel extends ItemSlotClass
	{
		
		//constructor
		public function Ruskvel()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "Ruskvel";
			//Regular name
			this.longName = "greasy treat commonly called 'ruskvel'";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a greasy treat commonly called 'ruskvel'";
			//Displayed on tooltips during mouseovers
			this.tooltip = "The staple of the raskvel’s diet takes the form of a round, doughy, oatmeal-coloured dumpling the size of a cauliflower, wrapped in tinfoil, dense and greasy to touch. Aerodynamic it is not but everything about it has speed in mind: How fast it takes to bake, how quickly it can be eaten, and the number of calories it contains to keep a short-legged, high-libido’d rabbit-reptile running around from dawn until dusk. Your codex warns you that eating it may well cause your microbots to physically alter you.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 30;
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
				var pc:PlayerCharacter = target as PlayerCharacter;
				//Usage text:
				//Nonrask
				if(pc.race() != "raskvel" && pc.race() != "rask-morph" && pc.race() != "raskvel-morph")
				{
					kGAMECLASS.output("You take a cautious bite out of the dumpling and make a face. How can something so rich be so bland at the same time? And what will finishing it do to your waistline? You suppose it gives you a reason to keep moving, at any rate. You can practically feel your heart beating faster as you polish off the rest of the pale, greasy stodge.");
					kGAMECLASS.author("Nonesuch");
					//HP GAINZ
					//40% chance of 10% HP gain, 80% chance of 10 energy gain if not raskvel morph
					//No, that's dumb. We do it Fen's way. Out of combat healing item, soz always helps.
					pc.HP(Math.round(pc.HPMax() * .4));
					pc.energy(25);
				}
				//Rask-morphed
				else
				{
					kGAMECLASS.output("You eagerly tear the dumpling out of its tin foil and rip off a big, chewy hunk of it with your teeth enthusiastically. The fact that you started off not liking this stuff seems bizarre to you now. It’s exactly what your body craves, and a glow of intense satisfaction sinks into you as you gobble the rich starch up. You sigh and allow yourself a fruity belch once you’re done, revelling in the feeling of energy coursing through your hot, dense form, feeling ready to do anything – or anyone.");
					//70% chance of 10% HP gain, 100% chance of 20 energy gain if raskvel morph
					//HP GAINS
					//No, that's dumb. We do it Fen's way. Out of combat healing item, soz always helps.
					pc.HP(Math.round(pc.HPMax() * .8));
					pc.energy(50);
				}
				//Stats
				//Increase intelligence if below 30%
				//NOPE! 60%!
				if(pc.IQ() < 60 && rand(3) == 0 && changes < changeLimit)
				{
					kGAMECLASS.output("\n\nYour mind wanders back to your [pc.ship], considering all its small, annoying, mechanical problems; ways you could fix them, parts you could reuse in so doing, systems you could make more efficient by taking apart and reworking them... oh, if only you had the time! But the moment you’ve redesigned something in your head you’ve moved on and forgotten it, another manual problem occurring to you and occupying your busy, impatient mind.");
					pc.slowStatGain("intelligence",2);
					changes++;
				}
				//Decrease intelligence if above 80%
				if(pc.IQ() > 80 && rand(4) == 0 && changes < changeLimit)
				{
					kGAMECLASS.output("\n\nYou shake your head in annoyance. Lately you’ve been finding the way your mind works frustrating – particularly when it tries to clamber to worldlier considerations, when it attempts to link what you’re experiencing to a bigger picture. It just makes you feel hot, confused, a migraine waiting to happen. Things are so much easier when you’re concentrating on what’s immediately in front of you – a problem to be fixed, a task to be overcome, someone to bend over and fuck - or bend over for. You nod in satisfaction as you put your finger on it, your higher cognition fading as you do.");
					pc.intelligence(-1);
					changes++;
				}
				//Decrease willpower if above 35%
				if(pc.WQ() > 35 && rand(4) == 0 && changes < changeLimit)
				{
					kGAMECLASS.output("\n\nHeat sweeps through your body in waves, leaving you feeling eager and giddy. ");
					if(kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.PUBLIC)) kGAMECLASS.output("What did that person say? Yes, you agree entirely!");
					else 
					{
						kGAMECLASS.output("You stifle a desire ");
						if(!pc.isNude()) kGAMECLASS.output("to strip off your clothes and run around wildly");
						else kGAMECLASS.output("to exult in your nudity and run around wildly");
						kGAMECLASS.output(" with some difficulty.");
					}
					pc.willpower(-1);
					changes++;
				}
				//Increase reflexes if below 70%
				//Reflexes increase
				if(pc.RQ() < 70 && rand(3) == 0 && changes < changeLimit)
				{
					kGAMECLASS.output("\n\nSomething moves slightly to one side of you and your head snaps around to take it in, sizing it up and evaluating it as not a threat in a tenth of a second.");
					if(pc.RQ() < 40) kGAMECLASS.output(" You feel faster in both mind and body, more engaged with your immediate surroundings.");
					else kGAMECLASS.output(" You feel on the very edge of the moment now, reacting immediately to everything that happens around you and able to be where you want to be the moment the desire to do so forms.");
					pc.slowStatGain("reflexes",2);
					changes++;
				}
				//Increase libido
				//Increase virility/fertility
				if(changes < changeLimit && rand(3) == 0 && (pc.libido() < pc.libidoMax() || (pc.hasVagina() && pc.fertilityRaw < 1.5) || (pc.hasCock() && pc.cumQualityRaw < 1.5)))
				{
					kGAMECLASS.output("\n\nDense puissance sinks down to your groin, settling there as a deep, persistent throb.");
					//Fertility/Virility increase: 
					if((pc.hasVagina() && pc.fertilityRaw < 1.5) || (pc.hasCock() && pc.cumQualityRaw < 1.5))
					{
						kGAMECLASS.output(" Instinctively you know you’ve become more ");
						if(pc.hasVagina() && pc.fertilityRaw < 1.5) 
						{
							kGAMECLASS.output("fertile");
							pc.fertilityRaw += 0.05;
							if(pc.hasCock() && pc.cumQualityRaw < 1.5) kGAMECLASS.output(" and ");
						}
						if(pc.hasCock() && pc.cumQualityRaw < 1.5) 
						{
							kGAMECLASS.output("virile");
							pc.cumQualityRaw += 0.05;
						}
						kGAMECLASS.output(", your body riper and singing with a need to breed.");
					}
					//Low/Mid: 
					if(pc.libido() <= pc.libidoMax() * 2/3)
					{
						kGAMECLASS.output(" You find yourself avoiding making thrusting movements with your [pc.hips], because when you do the desire to throw everything aside and find someone or thing to fuck becomes too much, forcing you to stop and take deep breaths, getting a handle back on your lust.");
						pc.lust(33);
					}
					//High:
					else
					{
						kGAMECLASS.output(" You groan lowly and rub your face as the pulsing rhythm in your loins overtakes you, demanding you dance along to its tune. You’re heavily rooted in what it means to be a raskvel now – everything underwritten and superseded by a need to fuck and multiply.");
						if(pc.hasVagina()) kGAMECLASS.output(" You find yourself dreaming of spreading your hips for the next male you see, forcing them to give you many strong children to bear after repeated bouts of lush rutting");
						else if(pc.hasCock()) kGAMECLASS.output(" You find yourself dreaming of forcing yourself on the next female you see, making them bear your many strong children after repeated bouts of lush rutting");
						if(pc.hasVagina() || pc.hasCock()) kGAMECLASS.output(", and as shameful as these thoughts are, there is no denying their strong, base appeal.");
						pc.lust(40);
					}
					changes++;
					pc.slowStatGain("libido",2);
				}
				//Physical Changes
				//Decrease height towards 3’9”
				//Height decrease
				if(pc.tallness > 45 && changes < changeLimit && rand(4) == 0)
				{
					//Above 4’3” feet:
					if(pc.tallness >= 51) {
						kGAMECLASS.output("\n\nYou rub your back - which feels prickly - and frown suspiciously at the world around you. Everything seems slightly bigger than you remember it being. Are you getting shorter? No – it’s everything else getting too damn big. Definitely.");
						pc.tallness -= 2 + rand(2) + Math.round(pc.tallness/6 - 8);
					}
					//4’3” feet and below:
					else
					{
						kGAMECLASS.output("\n\nYou sigh as, once again, your body condenses and the floor gets a little closer. The way most people look at you now you can only be described as patronizing, but you don’t mind – the sense of balance that comes with such a low centre of gravity makes you feel right, more connected with the world that your senses tell you is the most important. Anyway, when a person’s hands are level with your throat it means your teeth are level with their groin.");
						pc.tallness -= 1 + rand(2);
					}
					changes++;
				}
				//Increase hips towards 7
				if(pc.hipRating() < 9 && rand(5) == 0 && changes < changeLimit)
				{
					if(pc.hipRating() < 7 && !pc.hasVagina())
					{
						kGAMECLASS.output("\n\nYou find yourself walking with an increasingly swaying gait as weight piles onto your hips, your femurs widening and the flesh around them plumping up.");
						//Bring butt up 2 match
						if(pc.buttRating + 2 < pc.hipRating())
						{
							kGAMECLASS.output(" You pat your rump with satisfaction as it pads out to accommodate your new, heftier thighs.");
							pc.buttRatingRaw = pc.hipRating() - 2;
						}
						pc.hipRatingRaw++;
						changes++;
					}
					//Female increase to 9:
					else if(pc.hasVagina())
					{
						kGAMECLASS.output("\n\nYou sigh and run your hands over the great curving swathes of meat that constitute your upper legs now, an action that requires you to straighten your arms right out. You move with a kind of rounded swing now, and whilst you can work up remarkable power and speed in them it’s obvious what these wonderful hips of yours are primarily designed for – carrying and bearing many, many children.");
						pc.hipRatingRaw++;
						changes++;
					}
				}
				//Lose extra boob rows, decrease boobs to B cups
				//Boobs decrease/lose rows
				if((pc.bRows() > 1 || pc.biggestTitSize() >= 3) && rand(4) == 0 && changes < changeLimit)
				{
					kGAMECLASS.output("\n\nThe flesh on your chest ripples, your boobs condensing as your body readjusts its mass downwards.");
					if(pc.bRows() > 1)
					{
						kGAMECLASS.output(" A few minutes later you realise you are walking with a new lightness of step; a pat around your ribcage reveals the ruskvel has completely removed ");
						if(pc.bRows() > 2) kGAMECLASS.output("the lowest of your sets");
						else if(pc.bRows() == 2) kGAMECLASS.output("your secondary set");
						kGAMECLASS.output(" of breasts, nipples and all.");
						pc.removeBreastRow(pc.bRows()-1, 1);
					}
					else
					{
						for(x = 0; x < pc.bRows(); x++)
						{
							if(pc.breastRows[x].breastRatingRaw >= 90) pc.breastRows[x].breastRatingRaw-=15;
							if(pc.breastRows[x].breastRatingRaw >= 70) pc.breastRows[x].breastRatingRaw-=10;
							if(pc.breastRows[x].breastRatingRaw >= 50) pc.breastRows[x].breastRatingRaw-=6;
							if(pc.breastRows[x].breastRatingRaw >= 30) pc.breastRows[x].breastRatingRaw-=4;
							if(pc.breastRows[x].breastRatingRaw >= 20) pc.breastRows[x].breastRatingRaw-=2;
							if(pc.breastRows[x].breastRatingRaw >= 15) pc.breastRows[x].breastRatingRaw-=2;
							if(pc.breastRows[x].breastRatingRaw >= 10) pc.breastRows[x].breastRatingRaw-=2;
							if(pc.breastRows[x].breastRatingRaw >= 7) pc.breastRows[x].breastRatingRaw--;
							if(pc.breastRows[x].breastRatingRaw >= 3) pc.breastRows[x].breastRatingRaw--;
						}
						kGAMECLASS.output(" By your estimate, you're [pc.breastCupSize] now.");
					}
					changes++;
				}
				//Grow human face
				//Grow human face
				if((pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED) || pc.hasFaceFlag(GLOBAL.FLAG_ANGULAR)) && rand(4) == 0 && pc.tallness < 60 && changes < changeLimit)
				{
					kGAMECLASS.output("\n\nLiquid heat sinks into your bestial features, making you feel weirdly melted around the facial area. It recedes in time, but you are given a shock when you happen to glance into the reflective glass of your codex a moment later. You now have recognizably homo sapien features, as human-looking as your father once was.");
					pc.faceType = 0;
					pc.clearFaceFlags();
					changes++;
				}
				//Lose fur
				if(pc.hasFur() && rand(5) == 0 && changes < changeLimit)
				{
					kGAMECLASS.output("\n\nThe heat and lumpen energy the dumpling has pushed into your system reacts poorly with your heavy fur, making you feel uncomfortably hot; you find yourself scratching and rubbing at your sweat-soaked pelt reactively. When it starts coming out in clumps, it’s honestly a huge relief. <b>Within the hour you are bare-skinned</b>, a considerable trail of discarded [pc.skinFurScales] behind you.");
					pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
					pc.clearSkinFlags();
					changes++;
				}
				//Grow raskvel ears - req no fur and nonmuzzle!
				if(!pc.hasFur() && !(pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED) || pc.hasFaceFlag(GLOBAL.FLAG_ANGULAR)) && pc.earType != GLOBAL.TYPE_RASKVEL && rand(4) == 0 && changes < changeLimit)
				{
					kGAMECLASS.output("\n\nWhat is happening to your ears? They’re getting bigger, you can feel that, but should they really feel this loose? It’s as if they’ve gone well past their sell-by date, hanging limply off the side of your head. That’s when the real growth begins. You can practically hear your flesh crackle and sprout as your pinna blossom outwards and downwards at a remarkable rate, flattening into long, plump sheets that finally reach well below your waist.\n\nYou run slightly stunned fingers over them once the transformation seems to be over, shivering as you feel how sensitive their undersides are. You can hear more or less the same, but... you coo as you flex muscles that formerly would have made your ears crane slightly, and instead cause your massive new flaps to curl up dexterously. You find, with a few experimental twitches, you are able to move them almost as surely as if they were a new set of limbs. Which is just as well, because when you set off again you realise, with a jerk of the neck, you’re carrying a hell of a lot of weight off the back of your head now.\n\nBetter work on your posture - <b>your new raskvel-like ears will need you to!</b>");
					pc.earType = GLOBAL.TYPE_RASKVEL;
					changes++;
				}
				//Grow scales
				if(!pc.hasScales() && !pc.hasFur() && rand(5) == 0 && changes < changeLimit)
				{
					kGAMECLASS.output("\n\nSomething odd is happening to your skin. First it feels like you’re getting pins and needles all over; when you look at your arm closely, you discover this is being caused by every single follicle of your body hair falling out, your pores closing up. This is followed by intense irritation, your skin seeming to crack and scab in multiple places. You’re beginning to worriedly wonder where the nearest V-KO unit is when you notice the “scabs” aren’t falling out; they are instead forming neatly around each other, a soft leather mosaic slowly cobbling into existence on your epidermis. After about an hour, it’s spread to cover every inch of your hairless body. <b>You are now scaled.</b>");
					pc.skinType = GLOBAL.SKIN_TYPE_SCALES;
					pc.scaleColor = pc.skinTone;
					pc.clearSkinFlags();
					changes++;
				}
				//Grow tail
				if(pc.tailType != GLOBAL.TYPE_RASKVEL && rand(7) == 0 && changes < changeLimit)
				{
					if(target.tailTypeUnlocked(GLOBAL.TYPE_RASKVEL))
					{
						//Already have tail:
						if(pc.tailCount > 0)
						{
							kGAMECLASS.output("\n\nHeat pulses up [pc.oneTail], the ropey muscles there reconfiguring. It doesn’t feel like it’s melting away, rather shifting into something different. After a while the sensation dissipates and you’re left to clumsily swing around <b>your new raskvel tail</b> and admire it in all its long, blunt, scaly glory. When you let it go and put your mind elsewhere it flops into the dirt. You suppose you’ll get used to the constant shifting sound that follows your every step now.");
						}
						//Do not have tail:
						else
						{
							kGAMECLASS.output("\n\nAn uncomfortable sensation builds at the base of your spine, as if your back is trying to grow but has nowhere to go. Finally and with a sensation of blessed relief something bursts into existence above your [pc.butt], shooting outwards and quickly forming into a new appendage. When the sensation dissipates you’re left to clumsily swing around <b>your new raskvel tail</b> and admire it in all its long, blunt, scaly glory. When you let it go and put your mind elsewhere it flops into the dirt. You suppose you’ll get used to the constant shifting sound that follows your every step now.");
						}
						pc.tailCount = 1;
						pc.clearTailFlags();
						pc.tailType = GLOBAL.TYPE_RASKVEL;
						pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
						pc.addTailFlag(GLOBAL.FLAG_LONG);
						pc.addTailFlag(GLOBAL.FLAG_SCALED);
						changes++;
					}
					else kGAMECLASS.output(target.tailTypeLockedMessage());
				}
				//Grow long tongue
				if(pc.tongueType != GLOBAL.TYPE_RASKVEL && rand(6) == 0 && changes < changeLimit)
				{
					kGAMECLASS.output("\n\nYour tongue feels tickly and slack as it changes; its color shifting, becoming far longer. It’s rather annoying to cope with at first, what with your wet, purple muscle continuously hanging out of your mouth as more and more inches are added to it. Fortunately it seems your throat has become more voluble to compensate, and after you’ve spent a couple of minutes getting used to it you find you are able to house the remarkably long, wide, flexible tongue you’ve grown without even thinking about it.");
					pc.clearTongueFlags();
					pc.tongueType = GLOBAL.TYPE_RASKVEL;
					pc.addTongueFlag(GLOBAL.FLAG_LONG);
					pc.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
					pc.addTongueFlag(GLOBAL.FLAG_LUBRICATED);
					pc.addTongueFlag(GLOBAL.FLAG_SQUISHY);
					changes++;
				}
				//Lose hair, grow feathers
				if(pc.hairType != GLOBAL.HAIR_TYPE_FEATHERS && rand(6) == 0 && pc.hasScales() && changes < changeLimit)
				{
					if(pc.hasHair())
					{
						kGAMECLASS.output("\n\nHairs keep irritating your eyes and nose as they drift down in front of your face. Eventually it starts coming out in tufts, then handfuls, until finally you’re left as bald as you were the day you were born. ");
					}
					else kGAMECLASS.output("\n\n");
					kGAMECLASS.output("Something tickles its way into existence just above your brow. A cautious check with the codex’s mirror app informs you that it is a single [pc.hairColor] feather, about six inches in length, a delicate flute stem segmenting a vane of incredibly fine keratin, fluffier near your scalp. It also informs you that it is growing, and is being swiftly followed by many more. Soon you have what can only be described as a plume of the things, rearing up proudly from the front of your head and bending over to touch the nape of your neck.\n\n<b>You now have feathers for hair!</b>");
					pc.hairType = GLOBAL.HAIR_TYPE_FEATHERS;
					changes++;
				}
				//Grow raskvel feet
				if(pc.legType != GLOBAL.TYPE_RASKVEL && rand(4) == 0 && changes < changeLimit)
				{
					kGAMECLASS.output("\n\nA feeling of liquidity and profound weakness in your [pc.legs] inform you that something significant is happening in your lower half, and you’d better settle yourself down until it has finished. After a fairly unpleasant half an hour it’s done – <b>you ");
					if(pc.legCount == 2) kGAMECLASS.output("now have");
					else kGAMECLASS.output("are now a plantigrade biped with");
					kGAMECLASS.output(" four sharp claws for toes, strong and well-balanced</b>. After a few uncertain steps, pit-patting away on your reptilian feet is coming quite naturally.");
					changes++;
					pc.legType = GLOBAL.TYPE_RASKVEL;
					pc.genitalSpot = 0;
					pc.legCount = 2;
					pc.clearLegFlags();
					pc.addLegFlag(GLOBAL.FLAG_SCALED);
					pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
				}
				//SEXYTIME CHANGES!
				//Masculine Changes
				//Grow three balls + pouch
				//Grow three balls
				if(pc.balls < 3 && pc.hasCock() && changes < changeLimit && rand(4) == 0)
				{
					kGAMECLASS.output("\n\nHeat coalesces in your groin, pulsing there with increasing force until it feels like it must take physical form – which, slightly startlingly, it does. You grunt with pleasure as ");
					if(pc.balls == 2) kGAMECLASS.output("a new testicle swells");
					else if(pc.balls == 1) kGAMECLASS.output("not one but two new testicles swell");
					if(pc.balls > 0) kGAMECLASS.output(" into existence in your scrotum, the same size as the other");
					if(pc.balls == 2) kGAMECLASS.output("s");
					if(pc.balls == 0) kGAMECLASS.output("a trio of new testicles swell into existance, forcing your skin to stretch into a <b>brand new ball-sack</b>");
					kGAMECLASS.output(". You give your hips an experimental swing and find you rather enjoy the packed, dense feeling of bollocks in triplicate; overstuffed masculine urge.");
					if(pc.balls == 0) pc.ballSizeRaw = 3;
					pc.balls = 3;
					pc.libido(2);
					changes++;
				}
				//Grow pouch
				//Also shrink if above idk 5 inches?
				if(!pc.hasStatusEffect("Uniball") && pc.balls == 3 && rand(6) == 0 && changes < changeLimit)
				{
					kGAMECLASS.output("\n\nYou gasp and bunch your fists as what feels like a soft vice clamps down on your balls, pushing them upwards and inwards. It’s not painful exactly but whatever is happening to them is intense enough for sweat to stand out on your brow. When the sensation dissipates somewhat you slide a hand downstairs uncertainly. <b>You’ve grown a tight-fitting pouch</b> which holds your three nuts up to the back of your thighs.");
					if(pc.ballSizeRaw >= 7)
					{
						kGAMECLASS.output(" Your testicles have also shrunken to compensate. ");
						pc.ballSizeRaw -= 2;
					}
					kGAMECLASS.output(" It’s...uncomfortable, to be honest. The sensation of dense urge that three testicles gave you before is tripled now they are packed together in such a small space; a hot, needy sphere that is forever goading you to find release, whatever the cost.");
					pc.lust(10);
					pc.libido(1);
					target.createStatusEffect("Uniball",0,0,0,0,true,"","",false,0);
					changes++;
				}
				//Cocks to TF?
				if(pc.cockTotal(GLOBAL.TYPE_RASKVEL) < pc.cockTotal() && rand(3) == 0 && changes < changeLimit)
				{
					//Morph retractable purple dick
					var cockToBe:int = -1;
					for(x = 0; x < target.cockTotal(); x++)
					{
						if(target.cocks[x].cType != GLOBAL.TYPE_RASKVEL && cockToBe == -1) cockToBe = x;
					}
					if(cockToBe >= 0)
					{
						//No genital sheath:
						if(!pc.hasStatusEffect("Genital Slit"))
						{
							kGAMECLASS.output("\n\nYour eyes cross as [pc.eachCock] suddenly shoots backwards into your body with a distinctly wet sound. A panicked fumble around downstairs reveals that it’s left a vertical slit behind - but it doesn’t feel much like a vagina, and when you carefully slide a finger inside it encounters your [pc.cocks], still fully accounted for.\n\nYou flex your hips slightly and sigh as ");
							if(pc.cockTotal() == 1) kGAMECLASS.output("it slides out of its");
							else kGAMECLASS.output("one slides out of its");
							kGAMECLASS.output(" new hollow housing. <b>It is now a brilliant purple color, thick and fairly human-shaped but much smoother</b>, and – you close your eyes when you wrap your hand around it – slightly more sensitive for spending most of its time safely ensconced inside your <b>new, warm genital sheath</b>.");
							if(pc.cockTotal() == 2) kGAMECLASS.output(" The other is unchanged.");
							if(pc.cockTotal() > 2) kGAMECLASS.output(" The others are unchanged.");
							target.createStatusEffect("Genital Slit",0,0,0,0);
						}
						//Genital sheath:
						else
						{
							kGAMECLASS.output("\n\nSomething warm and slightly ticklish is happening to [pc.oneCock], tucked away inside your genital slit. Once the fuzzy sensation has passed you flex your hips slightly and admire the <b>smooth, strikingly purple reptilian cock your penis has morphed into</b>. It’s fairly human-shaped and slightly sensitive for spending most of its time safely ensconced inside your genital sheath - but then you’re already fully used to that. You slide it back into its box with a pleased huff.");
						}
						pc.cocks[cockToBe].clearFlags();
						pc.cocks[cockToBe].cType = GLOBAL.TYPE_RASKVEL;
						pc.cocks[cockToBe].cockColor = "purple";
						pc.cocks[cockToBe].addFlag(GLOBAL.FLAG_SMOOTH);
						pc.lust(15);
						changes++;
					}
				}
				//Feminine Changes
				var cuntToBe:int = -1;
				//Grow second clit
				if(pc.hasVagina() && changes < changeLimit && rand(4) == 0)
				{
					//Morph retractable purple dick
					cuntToBe = -1;
					for(x = 0; x < target.totalVaginas(); x++)
					{
						if(target.vaginas[x].clits == 1 && cuntToBe == -1) cuntToBe = x;
					}
					if(cuntToBe >= 0)
					{
						kGAMECLASS.output("\n\nYour eyes widen as something suddenly pimples into existence at the back end of [pc.oneVagina]. You go carefully with your rummaging fingers but even so you cannot prevent a gasp leaving your lips when you discover what it is: <b>a second clit located at the bottom of your vaginal opening</b>, bulging and eager to your touch. This is certainly going to make sex... interesting.");
						pc.vaginas[cuntToBe].clits = 2;
						changes++;
						pc.lust(15);
						pc.libido(2);
					}
				}
				//Grow purple pussy
				//Gain oviposition maybe?
				if(pc.hasVagina() && changes < changeLimit && rand(4) == 0)
				{
					cuntToBe = -1;
					for(x = 0; x < target.totalVaginas(); x++)
					{
						if(target.vaginas[x].vaginaColor != "purple" && cuntToBe == -1) cuntToBe = x;
					}
					//If you've got a cunt needing palette swapped
					if(cuntToBe >= 0)
					{
						kGAMECLASS.output("\n\nWetness escapes your pussy as it seems to shimmer with heat, your lips and clit");
						if(pc.vaginas[cuntToBe].clits > 1) kGAMECLASS.output("s");
						kGAMECLASS.output(" puffing up to the energy cycling through them. It eventually dissipates, but when you check downstairs you find that whilst your mons retained its pigmentation your vagina proper has shifted to a brilliant purple color, shining in its own excitement.");
						pc.vaginas[cuntToBe].vaginaColor = "purple";
						pc.lust(10);
						pc.libido(1);
						changes++;
					}
				}
				//Increase elasticity/depth
				if(pc.elasticity < 2 && pc.hasVagina() && rand(3) == 0 && changes < changeLimit)
				{
					kGAMECLASS.output("\n\nWarmth pushes into the sensitive inner parts of your [pc.vaginas], massaging your tunnel");
					if(pc.totalVaginas() > 1) kGAMECLASS.output("s and wombs");
					else kGAMECLASS.output(" and womb");
					kGAMECLASS.output(", stretching and sculpting ");
					if(pc.totalVaginas() == 1) kGAMECLASS.output("it");
					else kGAMECLASS.output("them");
					kGAMECLASS.output(" upwards. The sensation fades over time but you are left with the instinctive knowledge that you are more able to take larger insertions there now.");
					pc.elasticity += 0.25;
					changes++;
				}
				if(changes == 0)
				{
					kGAMECLASS.output("\n\nNothing changed, but at least your belly is full of food and energy!");
				}
			}
			//Not player!
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " uses it to no effect.");
			}
			return false;
		}
	}
}

