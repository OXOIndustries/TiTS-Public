package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Utility.num2Ordinal;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class NyreanCandy extends ItemSlotClass
	{
		public function NyreanCandy()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.FOOD;
			shortName = "N.Candy";
			longName = "nyrean rock candy";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a piece of nyrean rock candy";
			tooltip = "This is a small piece of what appears to be rock candy. This candy supposedly has some trace amounts of nyrean spunk in it, used to temporarily increase lust upon consumption. You have a feeling that if you eat this, you’ll start turning into a nyrea...\n\n<b>Known to cause moderate amounts of taint. Check your Codex for details.</b>";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 600;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("JohanLitvisk");
			
			if(target is PlayerCharacter)
			{
				output("You pop the candy into your mouth and start chewing. It’s surprisingly sweet for a simple rock candy. Your cheeks flush as your feel the aphrodisiac get to work. Let’s see what happens... ");
				var changes:int = 0;
				var changeLimit:int = 2;
				if(rand(2) == 0) changeLimit++;
				if(rand(2) == 0) changeLimit++;
				if(rand(2) == 0) changeLimit++;
				target.taint(3);
				// Human Face
				if(changes < changeLimit && target.faceType != GLOBAL.TYPE_HUMAN && rand(2) == 0)
				{
					if(target.faceTypeUnlocked(GLOBAL.TYPE_HUMAN))
					{
						output("\n\nYour [pc.face] starts itching painfully. You try and scratch at it, but as soon as you lay a finger on it, your face contracts in pain. You let out a yell as your face reshapes into a more humanoid form. Thankfully, it ends rather quickly and you find that <b>you have a human face now!</b>");
						
						target.faceType = GLOBAL.TYPE_HUMAN;
						target.clearFaceFlags();
						changes++;
					}
					else output("\n\n" + target.faceTypeLockedMessage());
				}
				// Legs
				if(changes < changeLimit && (target.legCount != 2 || (target.legType != GLOBAL.TYPE_NYREA && target.legType != GLOBAL.TYPE_HUMAN)) && rand(2) == 0)
				{
					if(target.legTypeUnlocked(GLOBAL.TYPE_HUMAN))
					{
						// Humanoid Lower Body
						if(target.legCount != 2)
						{
							output("\n\nYour lower body goes completely numb before you’re hit with an agonizing pain. Letting out a shrill yell, you feel your lower body contract and contort");
							if(target.isTaur() || target.legCount > 3) output(" as your hind legs disappear into your shrinking lower body");
							else if(target.isNaga()) output(" as your tail shrinks and begins splitting into two");
							output(". As the agony subsides, feeling returns to your now <b>new human legs!</b>");
						}
						// Human Legs
						//If pc has non-human legs
						else
						{
							output("\n\nYou hear the sounds of bones popping, cracking and breaking as you [pc.legs] lose feeling. You grunt and hiss as your [pc.legs] reshape into a more human format. <b>You have a pair of human legs now.</b>");
						}
						target.legType = GLOBAL.TYPE_HUMAN;
						target.clearLegFlags();
						target.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
						target.legCount = 2;
						target.genitalSpot = 0;
						changes++;
					}
					else output("\n\n" + target.legTypeLockedMessage());
				}
				// Wing & Tail Removal
				if(changes < changeLimit && (target.hasTail() || target.hasWings()) && rand(2) == 0)
				{
					// If pc has tail:
					if(target.hasTail())
					{
						if(target.tailTypeUnlocked(0))
						{
							output("\n\nYou feel [pc.eachTail] tighten for a brief of moment before crumbling away into dust. <b>Your rear end is now tailless.</b>");
							
							target.removeTails();
							changes++;
						}
						else output("\n\n" + target.tailTypeLockedMessage());
					}
					// If pc has wings:
					else if(target.hasWings())
					{
						if(target.wingTypeUnlocked(0))
						{
							output("\n\nYour [pc.wings] tingle before falling apart and crumbling into dust. <b>You are back to being wingless.</b>");
							
							target.removeWings();
							changes++;
						}
						else output("\n\n" + target.wingTypeLockedMessage());
					}
				}
				// Femininity Increase
				if(changes < changeLimit && rand(3) == 0)
				{
					var newFem:Number = (target.femininity + 1);
					
					if(target.femininity < 100 && target.femininityUnlocked(newFem))
					{
						//If Femininity < 0:
						output("\n\nYou feel a strange tingle on your face. You’re not sure what is going on, but if feels like your face is slowly becoming softer and more rounded. A little once over confirms your suspicions: <b>Your face is more feminine now.</b>");
						//Small chance of lip size increase if femininity 0=< but >100:
						if(target.lipMod < 3 && rand(4) == 0)
						{
							output(" As an added bonus, your lips feel plumper and more kissable after the change. This could be fun.");
							target.lipMod++;
						}
						
						target.femininity = newFem;
						changes++;
					}
					//If Femininity = 100:
					else if(target.femininity >= 100) output("\n\nA tingle comes to your face, but it disappears as quickly as it came. You guess you can’t get any more feminine than you already are.");
					else output("\n\n" + target.femininityLockedMessage());
				}
				// Steele gets Nyrea eyes
				if(changes < changeLimit && target.eyeType != GLOBAL.TYPE_NYREA && rand(4) == 0)
				{
					if(target.eyeTypeUnlocked(GLOBAL.TYPE_NYREA))
					{
						output("\n\nEverything goes blurry for a few minutes. You try and blink, but your vision doesn’t really clear up. You start to panic but your vision comes back to your all of sudden. Checking your face with the Codex, <b>you discover that you have black, featureless eyes just like a nyrea!</b>");
						
						target.eyeType = GLOBAL.TYPE_NYREA;
						target.eyeColor = "black";
						changes++;
					}
					else output("\n\n" + target.eyeTypeLockedMessage());
				}
				//Elfin Ears
				if(changes < changeLimit && target.earType != GLOBAL.TYPE_SYLVAN && rand(2) == 0)
				{
					//Ears will be eight inches long
					if(target.earTypeUnlocked(GLOBAL.TYPE_SYLVAN))
					{
						output("\n\nAn odd tingle graces the tip of your [pc.ears]. As you reach up to feel them, you’re shocked to find that your ears are ");
						if(target.earLength < 8) output("grow");
						else output("chang");
						output("ing! They don’t stop until they become <b>eight-inch long elven ears!</b>");
						if(kGAMECLASS.silly)
						{
							output(" Looks like you are a prissy knife-ears now. Well at least you’re not an asshole.");
							if(target.isAss()) output(" Oh wait...");
						}
						
						target.earType = GLOBAL.TYPE_SYLVAN;
						target.clearEarFlags();
						target.addEarFlag(GLOBAL.FLAG_TAPERED);
						target.earLength = 8;
						changes++;
					}
					else output("\n\n" + target.earTypeLockedMessage());
				}
				// Black Hair
				if(changes < changeLimit && target.hairColor != "black" && rand(2) == 0)
				{
					// Only happens if Steele's hair isn't black
					if(target.hairColorUnlocked("black"))
					{
						if(target.hasHair())
						{
							output("\n\nYour scalp tingles for a brief second. You give an annoyed scoff and start picking at it. You find a random strand of black hair stuck to your fingers. Wait, your hair isn’t black! You stare at the Codex and appraise your <b>new head of black hair!</b> You note that your hair feels pretty spiny. Must be the biology of nyrean hair...");
						}
						else
						{
							output("\n\nYour");
							if(kGAMECLASS.silly) output(" chrome dome}");
							else output(" bald scalp");
							output(" feels really weird right now. You try and pat the source of the itch, only to be meet with the feeling of hair! In amazement, you watch as your new black hair grows until it reaches slightly past your shoulder blades. <b>You now have a head of black hair.</b> You note that your hair feels pretty spiny. Must be the biology of nyrean hair...");
							
							target.hairLength = 6 + rand(4);
						}
						
						target.hairColor = "black";
						target.hairType = GLOBAL.HAIR_TYPE_QUILLS;
						
						if(target.hairStyle != "null")
						{
							output(" It seems the hair transformation has also ruined your hairdo. Maybe it’s something you might want to fix later.");
							target.hairStyle = "null";
						}
						changes++;
					}
					else output("\n\n" + target.hairColorLockedMessage());
				}
				// Pale white Skin
				if(changes < changeLimit && rand(2) == 0)
				{
					//If Steele has scales or fur
					if(target.hasFur() || target.hasScales())
					{
						if(target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN))
						{
							output("\n\nYour feel your [pc.skinFurScales] tingle for some odd reason. Attempting to relieve the itch, you scratch it but somehow pull a");
							if(target.hasFur()) output(" clump of fur");
							else output(" patch of scales");
							output(" off! You watch in amazement as your");
							if(target.hasFur()) output(" fur falls in clumps, dropping in tufts onto");
							else output(" scales peel off, one-after another, falling towards");
							output(" the ground below you.");
							if(target.skinTone != "pale white")
							{
								output(" Underneath, you find that your skin is now pale white.");
								target.skinTone = "pale white";
							}
							target.skinType = GLOBAL.SKIN_TYPE_SKIN;
							target.clearSkinFlags();
							changes++;
						}
						else output("\n\n" + target.skinTypeLockedMessage());
					}
					//If [pc.skin] isn't pale
					else if(target.skinTone != "pale white")
					{
						if(target.skinToneUnlocked("pale white"))
						{
							output("\n\nYou get goosebumps all over your suddenly cold skin. Shivering, you rub your arms in order to warm them up, but you notice something odd. Doing a double take, you realize that <b>your skin is now pale white in color.</b>");
							target.skinTone = "pale white";
							changes++;
						}
						else output("\n\n" + target.skinToneLockedMessage());
					}
				}
				// Chitin Growth
				if(changes < changeLimit && target.skinType == GLOBAL.SKIN_TYPE_SKIN && rand(3) == 0)
				{
					var changeArms:Boolean = (target.armType != GLOBAL.TYPE_NYREA && target.armTypeUnlocked(GLOBAL.TYPE_NYREA));
					var changeLegs:Boolean = (target.legCount == 2 && target.legType != GLOBAL.TYPE_NYREA && target.legTypeUnlocked(GLOBAL.TYPE_NYREA));
					
					if(target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_CHITIN))
					{
						output("\n\nYour back goes numb for a minute. Curious, you");
						if(target.isChestCovered()) output(" remove your [pc.upperGarments] and");
						else output(" look back to");
						output(" try to see what’s happening. You watch as a hard, black chitin exoskeleton grows onto your back. But it doesn’t stop there. Your");
						if(changeArms)
						{
							output(" arms");
							if(changeLegs) output(",");
						}
						if(changeLegs) output(" [pc.legOrLegs]");
						if(changeArms || changeLegs) output(" and");
						output(" stomach also go");
						if(!changeArms && !changeLegs) output("es");
						output(" numb as chitin grows on");
						if(changeArms || changeLegs) output(" them");
						else output("it");
						output(".");
						
						//Possible small increased resistance to Kinetic damage?
						
						target.skinType = GLOBAL.SKIN_TYPE_CHITIN;
						target.clearSkinFlags();
						target.scaleColor = "black";
						if(changeArms)
						{
							target.armType = GLOBAL.TYPE_NYREA;
							target.clearArmFlags();
							target.addArmFlag(GLOBAL.FLAG_CHITINOUS);
						}
						if(changeLegs)
						{
							target.legType = GLOBAL.TYPE_NYREA;
							target.clearLegFlags();
							target.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
							target.addLegFlag(GLOBAL.FLAG_CHITINOUS);
						}
						changes++;
						
						output(" From a distance, <b>you look like you’re wearing a black corset");
						if(target.armType == GLOBAL.TYPE_NYREA || target.legType == GLOBAL.TYPE_NYREA) output(" with long");
						if(target.armType == GLOBAL.TYPE_NYREA)
						{
							output(" gloves");
							if(target.legType == GLOBAL.TYPE_NYREA) output(" and");
						}
						if(target.legType == GLOBAL.TYPE_NYREA) output(" boots");
						output(" now.</b>");
					}
					else output("\n\n" + target.skinTypeLockedMessage());
				}
				
				// Gentitals
				var selCock:int = 0;
				var selCunt:int = 0;
				
				if(changes < changeLimit && rand(3) == 0)
				{
					// Penis
					//Nyrea Penis parameters: Flared crown like a horse with an x-shaped slit. Will grow a thick knot I’d give it about 2.5 to 3 inches in diameter. Cum will change to Nyrea Cum, which is more a oily lube then cum, but it should function the same way, but send virility down to 0%. Will make penis grow/shrink to 14 inches.
					// Vagina
					//A slick, slightly puffy vagina. Will increase vaginal wetness to 2. Replaces penis if Steele is male/trans.
					
					// IF PC IS HERM
					if(target.isHerm() && !target.hasCock(GLOBAL.TYPE_NYREA) && !target.hasVaginaType(GLOBAL.TYPE_NYREA))
					{
						if(target.removeCocksUnlocked() && target.removeVaginasUnlocked())
						{
							output("\n\nYour [pc.vaginas]");
							if(target.vaginas.length == 1) output(" feels like it is");
							else output(" feel like they are");
							output(" on fire! You double over and let out a loud moan. Unable to resist,");
							if(!target.isCrotchExposed()) output(" you rip the clothes from your body for better access to your genitals. Y");
							else output(" y");
							output("ou try to relieve your arousal, but it feels like your [pc.vaginas]");
							if(target.vaginas.length == 1) output(" is collapsing in on itself");
							else output(" are collapsing in on themselves");
							output("! At the same time, [pc.eachCock] suddenly tightens. Holy fuck that hurts, but it feels so good as well! You start beating off in order to get release, but your [pc.cocks]");
							if(target.cocks.length == 1) output(" disappears into your pelvis before you can get it");
							else output(" disappear into your pelvis before you can get them");
							output(" going. Your crotch goes featureless for a brief moment, until a new penis and vagina rapidly sprout in their place! You have to admire <b>your new nyrean cock and pussy!</b> You immediately get to work, masturbating both your new parts until you cum and spray all over the floor.");
							
							target.removeCocks();
							target.removeVaginas();
							target.createCock();
							target.createVagina();
							target.shiftCock(0, GLOBAL.TYPE_NYREA);
							target.cocks[0].cLengthRaw = 14;
							target.shiftVagina(0, GLOBAL.TYPE_NYREA);
							target.girlCumType = GLOBAL.FLUID_TYPE_NYREA_GIRLCUM;
							if(target.ballsUnlocked(0)) target.makeBallsInternal();
							target.orgasm();
							target.orgasm();
							changes++;
						}
						else if(!target.removeCocksUnlocked()) output("\n\n" + target.removeCocksLockedMessage());
						else output("\n\n" + target.removeVaginasLockedMessage());
					}
					// IF PC IS NEUTER
					else if(!target.hasGenitals())
					{
						if(target.createCockUnlocked() && target.createVaginaUnlocked())
						{
							//There is a 50/50 chance of Steele growing a Nyrea Cock or Nyrea Pussy
							output("\n\nYour featureless crotch lights up with the fury of a thousand suns! Moaning in ecstasy");
							if(kGAMECLASS.silly) output(" even though you’re a fucking neuter");
							output(", it feels like you’re about to cum.");
							if(target.ballsUnlocked(0)) target.makeBallsInternal();
							if(rand(2) == 0)
							{
								output(" A mighty cock similar to that of nyrea bursts forth! <b>You now have a 14-inch nyrean cock!</b>");
								target.createCock();
								target.shiftCock(0, GLOBAL.TYPE_NYREA);
								target.cocks[0].cLengthRaw = 14;
								changes++;
							}
							else
							{
								output(" A dripping slit forms own your featureless crotch, spraying girl cum everywhere. <b>You now have a virgin nyrean pussy!</b>");
								target.createVagina();
								target.shiftVagina(0, GLOBAL.TYPE_NYREA);
								target.girlCumType = GLOBAL.FLUID_TYPE_NYREA_GIRLCUM;
								target.orgasm();
								changes++;
							}
						}
						else if(!target.createCockUnlocked()) output("\n\n" + target.createCockLockedMessage());
						else output("\n\n" + target.createVaginaLockedMessage());
					}
					//pc is female:
					else if(target.hasVagina() && !target.hasVaginaType(GLOBAL.TYPE_NYREA) && !target.hasCock())
					{
						selCunt = rand(target.vaginas.length);
						
						if(target.removeVaginaUnlocked(selCunt) && target.createCockUnlocked())
						{
							output("\n\nYour [pc.vagina " + selCunt + "] feels like it is on fire! You double over and let out a loud moan. Unable to resist, you");
							if(!target.isCrotchExposed()) output(" reach into your [pc.lowerGarment], touch");
							else output(" place your hands on");
							output(" your [pc.vagina " + selCunt + "] and try to relieve your arousal, only to find a lump forming over your cooch! In fact, it feels like your [pc.vaginaNoun " + selCunt + "] is collapsing in on itself as the lump grows larger. Before you know it, your [pc.vagina " + selCunt + "] is gone and in its place is what looks like a cock! Your new penis takes on the flared shape of horse, or better yet, a nyrea. It even has a x-shaped slit, too. Overcome come by lust, you rapidly jack off your new penis. With all the sensitivity, it doesn’t take long until you bust a nut all over the ground. <b>You now have a 14-inch nyrean cock!</b>");
							
							target.removeVagina(selCunt, 1);
							target.createCock();
							target.shiftCock((target.cocks.length - 1), GLOBAL.TYPE_NYREA);
							target.cocks[target.cocks.length - 1].cLengthRaw = 14;
							if(target.ballsUnlocked(0)) target.makeBallsInternal();
							target.orgasm();
							changes++;
						}
						else if(!target.createCockUnlocked()) output("\n\n" + target.createCockLockedMessage());
						else output("\n\n" + target.removeVaginaLockedMessage());
					}
					//if Steele is male/trans:
					else if(!target.hasCock(GLOBAL.TYPE_NYREA) && !target.hasVagina())
					{
						selCock = rand(target.cocks.length);
						
						if(target.removeCockUnlocked(selCock) && target.createVaginaUnlocked())
						{
							output("\n\nYour [pc.cock " + selCock + "] tightens all of sudden. Holy fuck that hurts, but it feels so good! You");
							if(!target.isCrotchExposed()) output(" reach into your [pc.lowerGarment],");
							output(" grab your [pc.cock " + selCock + "] and start beating off in order to get release, but your cock disappears into your pelvis before you can get it going. Your crotch doesn’t stay featureless for long, as a wet, puffy slit takes the place of you vanished cock. Confused but too aroused to care, you jill your <b>new nyrean pussy</b> until you spray girl cum all over the floor. Damn...");
							
							target.removeCock(selCock, 1);
							target.createVagina();
							target.shiftVagina((target.vaginas.length - 1), GLOBAL.TYPE_NYREA);
							target.girlCumType = GLOBAL.FLUID_TYPE_NYREA_GIRLCUM;
							if(target.ballsUnlocked(0)) target.makeBallsInternal();
							target.orgasm();
							changes++;
						}
						else if(!target.createCockUnlocked()) output("\n\n" + target.createVaginaLockedMessage());
						else output("\n\n" + target.removeCockLockedMessage());
					}
				}
				
				var dicks:Array = [];
				var x:int = 0;
				for(x = 0; x < target.cocks.length; x++)
				{
					if(target.cocks[x].cLengthRaw != 14) dicks.push(x);
				}
				
				// Penis length adjustments
				if(changes < changeLimit && dicks.length > 0 && rand(3) == 0)
				{
					selCock = dicks[rand(dicks.length)];
					
					if(target.cockLengthUnlocked(selCock, 14))
					{
						var lengthGain:Number = 0;
						
						//If [pc.cock is less than 14 inches]:
						if(target.cocks[selCock].cLengthRaw < 14)
						{
							lengthGain = 3;
							if(target.cocks[selCock].cLengthRaw + lengthGain > 14) lengthGain = 14 - target.cocks[selCock].cLengthRaw;
							
							output("\n\nA pleasant feeling comes to your [pc.cock " + selCock + "]. You look down to discover it has grown " + num2Text(lengthGain) + " inches!");
							
							target.cocks[selCock].cLengthRaw += lengthGain;
							changes++;
						}
						//If [pc.cock is greater than 14 inches]:
						if(target.cocks[selCock].cLengthRaw > 14)
						{
							lengthGain = 3;
							if(target.cocks[selCock].cLengthRaw - lengthGain < 14) lengthGain = 14 - (target.cocks[selCock].cLengthRaw - lengthGain);
							
							output("\n\nA pleasant feeling comes to your [pc.cock " + selCock + "]. You look down to discover it has shrunk " + num2Text(lengthGain) + " inches!");
							
							target.cocks[selCock].cLengthRaw -= lengthGain;
							changes++;
						}
					}
					else output("\n\n" + target.cockLengthLockedMessage());
				}
				
				// Cum becomes aphrodisiac :
				if(changes < changeLimit && target.hasCock(GLOBAL.TYPE_NYREA) && target.cumType != GLOBAL.FLUID_TYPE_NYREA_CUM && rand(3) == 0)
				{
					if(target.cumTypeUnlocked(GLOBAL.FLUID_TYPE_NYREA_CUM))
					{
						output("\n\nAs you calm down from your pleasure high, you notice that your cum has an odd lavender color to it. You flick a stray strand of cum off your nyrean cock and take an experimental taste. You get a sexual tingle similar to the tingle of the rock candy you consumed not too long ago. <b>Your cum has changed into the aphrodisiac lube of the nyrea!</b>");
						
						for(x = 0; x < target.cocks.length; x++)
						{
							if(target.cocks[x].cType == GLOBAL.TYPE_NYREA && !target.hasCockFlag(GLOBAL.FLAG_APHRODISIAC_LACED, x)) target.cocks[x].addFlag(GLOBAL.FLAG_APHRODISIAC_LACED);
						}
						target.cumType = GLOBAL.FLUID_TYPE_NYREA_CUM;
						changes++;
					}
					else output("\n\n" + target.cumTypeLockedMessage());
				}
				// Nyrea Cum
				//Notes: In order to sort of simulate the eggs that nyrea produce, I have created a new kind of cum type. This cum type is kinda of filled with eggs, but are infertile. This cum is has a bubbly consistency, sort of like this, but with eggs instead of... Tapioca: http://i00.i.aliimg.com/img/pb/346/113/529/529113346_633.jpg
				if(changes < changeLimit && target.fertility() > 0 && target.hasStatusEffect("Nyrea Eggs") && (target.statusEffectv2("Nyrea Eggs") < 10 || !target.hasPerk("Nyrea Eggs")) && rand(3) == 0)
				{
					var nyreaEggs:Number = 0;
					
					output("\n\nA pressure hits your");
					if(target.balls > 0) output(" [pc.balls]");
					else output(" gut");
					output(" as " + (target.balls <= 1 ? "it fills" : "they fill") + " with more and more nyrea eggs...");
					
					// Increase multiplier
					if(target.statusEffectv2("Nyrea Eggs") < 10 && (target.hasPerk("Nyrea Eggs") || rand(5) != 0))
					{
						output(" Odd. You pat yourself, feeling a little bloated and much more productive. <b>Your nyrean egg production has increased.</b>");
						
						nyreaEggs = (80 + rand(21));
						target.addStatusValue("Nyrea Eggs", 2, 0.2);
					}
					// Get perk
					else if(!target.hasPerk("Nyrea Eggs") && rand(5) == 0)
					{
						output(" way much more than normal. Your egg factories are working in overtime until you are incredibly bloated with eggs! While you don’t feel more active than previous, something tells you that this sudden boost was a sign that your body has accepted the fate of being a nyrean egg factory...");
						
						nyreaEggs = (10 * (80 + rand(21)));
						target.setStatusValue("Nyrea Eggs", 4, 1);
						
						output("\n\n(<b>Perk Gained: Nyrea Eggs</b> - Your body permanently produces nyrea eggs regardless of your genes.)");
						target.createPerk("Nyrea Eggs", 0, 0, 0, 0, "Your body naturally produces nyrea eggs.");
					}
					else
					{
						nyreaEggs = (10 + rand(11));
					}
					
					target.addStatusValue("Nyrea Eggs", 1, nyreaEggs);
					changes++;
				}
				if(changes < changeLimit && target.fertility() > 0 && target.hasACockFlag(GLOBAL.FLAG_OVIPOSITOR) && target.cumType == GLOBAL.FLUID_TYPE_NYREA_CUM && !target.hasStatusEffect("Nyrea Eggs") && rand(4) == 0)
				{
					//Actual Transformation:
					output("\n\nYou feel a deep rumbling in your");
					if(target.balls > 0) output(" [pc.balls]");
					else output(" gut");
					output(". You");
					if(!target.isCrotchExposed()) output(" reach into your [pc.clothes]");
					else output(" look down");
					output(" to find [pc.eachCock] stiffening up as a strange, bubbly pre starts to exit your cumslit");
					if(target.cocks.length > 1) output("s");
					output(". It feels awfully weird and a little more difficult to push out. You flick a drop of it off [pc.oneCockHead] and feel something strange rolling around in your [pc.cum]. Somehow, you realize that your <b>cum is laced with nyrea eggs!</b> Your codex beeps in confirmation. <b>As long as you remain fertile and keep your nyrean gene count high, you’ll be producing nyrean eggs on a daily basis.</b>");
					
					// "Nyrea Eggs" (Like the NPC's variant)
					// v1: For amount of eggs? Recharge over time?
					// v2: Multiplier?
					// v3: ???
					// v4: Permanent (ignores racial score)
					target.createStatusEffect("Nyrea Eggs", 80 + rand(21), 1, 0, 0, true, "", "", false, 0);
					changes++;
				}
				
				// Libido Increase
				if(changes < changeLimit && target.libido() < 100 && rand(2) == 0)
				{
					//Increase Libido by 5:
					output("\n\nSomething feels a bit odd, as you feel more sexually hungry than normal. You think it is just the aphrodisiac doing its thing, but this feels more permanent for some reason. <b>Looks like your libido is increased!</b>");
					if(kGAMECLASS.silly) output(" Oh well, your quest is like a porn game anyway. All the better for more sex scenes, right?");
					
					target.slowStatGain("libido", 2);
				}
				if(changes == 0)
				{
					output("\n\nThe slightly arousing effects dissipate quickly. You certainly don’t feel any different. Looks like the candy was a dud. What a shame...");
				}
				// Lust Increase
				else
				{
					//Increase Lust by 3:
					target.changeLust(3);
					
					output("\n\nAs the effects of the rock candy wear off, you feel");
					if(target.lust() < 33) output(" a bit randier than usual");
					else if(target.lust() < 66) output(" rather hot and bothered");
					else if(target.lust() < 100) output(" very aroused after your little treat");
					else output(" positively fuck-hungry. <b>You should relieve this tension quickly</b>");
					output(".");
				}
				
				return false;
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " eats a nyrean rock candy but to no effect.");
			}
			return false;
		}
	}
}


/*
New Cum type & Sterility Perk


Perk: Sterility
{pc is male = Your [pc.cock]}{pc is herm = and}{pc is female = your [pc.vagina]} feel like they’re empty and desolate. Your codex beeps loudly, as an alert pops up on the screen: <i>"Warning: {Virility} {and} {Fertility} levels have dropped to nonexist levels. You now have a 0% chance of siring children."</i>. Okay...

<b>You’ve gained the Sterility Perk!</b>

//Loss: Your Codex beeps as it informs you that your {virility}{and}{fertility} levels are returning to normal. <b>You are no longer sterile.</b>
*/
