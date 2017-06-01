package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Utility.rand;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	
	public class RedPandaneen extends ItemSlotClass
	{
		public function RedPandaneen()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			
			shortName = "R.Panda+";
			longName = "Red Pandaneen Plus";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a pill labeled ‘Red Pandaneen Plus’";
			tooltip = "A sister brand to the transformative, ‘Pandaneen’, this gel capsule is half red, half black and stamped with flashier logos than its older counterpart. Marketed as a cheaper alternative to higher grade splices by Xenogen Biotech, Red Pandaneen Plus is designed to slowly give the imbiber red panda-like features using a variety of microsurgeons and genetic codes. A small sticker on the side of the packaging displays a claim that the product has gone through rigorous testing so that it no longer affects a user’s body shape, extremities, or reflexes. Neat!";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 1200;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			RedPandaTFs(target, false);
			return false;
		}
		
		// A Red Panda TF
		// Location: Sold by Jade on Tavros
		public static function RedPandaTFs(target:Creature, pro:Boolean = false):void
		{
			kGAMECLASS.clearOutput();
			author("Lkynmbr24");
			if(target is PlayerCharacter)
			{
				if(!pro) output("You deftly peel open the wrapper, removing the red and black pill. After a brief examination of the seemingly innocuous pill, you pop it into your mouth and swallow it without any trouble. A cherry and licorice aftertaste fills your mouth before you feel a dull burning sensation coming from your stomach, where the pill must have reached.");
				else output("You unwrap the safety cover on the prick of the red and black medipen. After giving yourself a few moments to prepare, you inject yourself with little trouble.");
				
				var changes:int = 0;
				var changeLimit:int = 3;
				
				// Ear Transformations
				if((pro || (changes < changeLimit && rand(3) == 0)) && target.earType != GLOBAL.TYPE_REDPANDA)
				{
					if(target.earTypeUnlocked(GLOBAL.TYPE_REDPANDA))
					{
						output("\n\nYou start to feel light headed and dizzy as a tingling sensation flows through your ears. You go deaf momentarily after feeling them smooth away. Before you have the chance to react, new ones bulge out of your [pc.hair]. <b>You’ve grown triangular red panda ears on top of your head.</b>");
						
						target.earType = GLOBAL.TYPE_REDPANDA;
						changes++;
					}
					else output("\n\n" + target.earTypeLockedMessage());
				}
				// Face Transformations
				if((pro || (changes < changeLimit && rand(3) == 0)) && target.faceType != GLOBAL.TYPE_REDPANDA)
				{
					if(target.faceTypeUnlocked(GLOBAL.TYPE_REDPANDA))
					{
						output("\n\nYou feel a strange sensation on your face as your cheekbones and jaw start to deform. The muscles of your face strain forward, their very sinews stretching. Your facial bones start to rearrange themselves, making it hard to breathe as your sinuses reroute. After a few moments of enduring your facial reconstruction, the transformation completes. You check your appearance with your codex’s mirror. <b>You’ve got a short-muzzled, red panda-like visage.</b>");
						
						target.faceType = GLOBAL.TYPE_REDPANDA;
						target.clearFaceFlags();
						target.addFaceFlag(GLOBAL.FLAG_MUZZLED);
						target.addFaceFlag(GLOBAL.FLAG_FURRED);
						changes++;
					}
					else output("\n\n" + target.faceTypeLockedMessage());
				}
				// Hair Transformations
				var randaHairColors:Array = ["red", "auburn", "brown", "black"];
				if((pro || (changes < changeLimit && rand(3) == 0)) && target.hasHair() && !InCollection(target.hairColor, randaHairColors))
				{
					var newHairColor:String = RandomInCollection(randaHairColors);
					if(target.hairColorUnlocked(newHairColor))
					{
						output("\n\nYou feel a tingling sensation in your scalp that feels somewhat pleasant. You take out your codex to flip the mirror function on and angle it so you can see the transformation take place. Sure enough, from the root, you can see a wave of a new color cascade down the length of your [pc.hair]. <b>Your hair color has changed to " + newHairColor + ".</b>");
						
						target.hairColor = newHairColor;
						changes++;
					}
					else output("\n\n" + target.hairColorLockedMessage());
				}
				// Eye Transformations
				if((pro || (changes < changeLimit && rand(3) == 0)) && InCollection(target.eyeType, [GLOBAL.TYPE_ARACHNID]))
				{
					if(target.eyeTypeUnlocked(GLOBAL.TYPE_HUMAN))
					{
						// PC loses eyes until PC has two eyes: 
						if(target.eyeType == GLOBAL.TYPE_ARACHNID) output("\n\nYou can feel your [pc.eyes] start to water, and your vision blur. This continues until you can see nothing but black. You feel around for the nearest thing you can hold on to until you have a vague sense of what is going on. After a few moments, your sight starts to brighten and become clear. Your visual periphery is notably different however, as you aren’t able to look around as freely as you did before. Lifting your hands to your face, you confirm that you have fewer eyes than you did before.");
						// PC gain eyes until PC has two eyes:
						else output("\n\nYou can feel your [pc.eye] start to water, and your vision blur. This continues until you can see nothing but black. You feel around for the nearest thing you can hold on to until you have a vague sense of what is going on. After a few moments, your sight starts to brighten and become clear. Your visual periphery is notably different however, as you have gained more of a three-dimensional periphery to your sight. Lifting your hands to your face, you confirm that you have more eyes than you did before.");
						
						target.eyeType = GLOBAL.TYPE_HUMAN;
						changes++;
					}
					else output("\n\n" + target.eyeTypeLockedMessage());
				}
				// Skin/Fur Transformations
				if((pro || (changes < changeLimit && rand(3) == 0)) && target.skinType != GLOBAL.SKIN_TYPE_FUR)
				{
					if(target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FUR))
					{
						if(InCollection(target.skinType, [GLOBAL.SKIN_TYPE_SKIN, GLOBAL.SKIN_TYPE_LATEX, GLOBAL.SKIN_TYPE_PLANT])) output("\n\nA feeling akin to pins and needles suddenly floods across the entirety of your body. You frantically scratch at whatever you can, only to find that your body hair is growing alarmingly longer everywhere, even in places that didn’t previously have hair. Finally the sensation stops, and you are fully covered in a nice layer of [pc.furColor] fur.");
						else output("\n\nA feeling akin to pins and needles suddenly floods across the entirety of your body. You frantically scratch at whatever you can, only to find that your [pc.skinFurScales] flaking off your body with disturbing ease. Fur is growing alarmingly fast where [pc.skinFurScalesNounSimple] used to be, and quite long on top of that. Finally the sensation stops, and you are fully covered in a nice layer of [pc.furColor] fur.");
						
						target.skinType = GLOBAL.SKIN_TYPE_FUR;
						target.clearSkinFlags();
						changes++;
					}
					else output("\n\n" + target.skinTypeLockedMessage());
				}
				// PC’s fur color changes
				var randaFurColors:Array = ["red and black", "auburn and black", "brown and black"];
				if((pro || (changes < changeLimit && rand(3) == 0)) && target.hasFur() && !InCollection(target.furColor, randaFurColors))
				{
					var newFurColor:String = RandomInCollection(randaFurColors);
					if(target.furColorUnlocked(newFurColor))
					{
						output("\n\nA soft, soothing feeling rushes through your entire body. In wonder, you look down at an exposed part of your fur and see that it is gradually changing color. When the transformation finishes, <b>you find that your fur is now " + newFurColor + " in color!</b>");
						
						target.furColor = newFurColor;
						changes++;
					}
					else output("\n\n" + target.furColorLockedMessage());
				}
				// PC gains “fluffy” fur:
				if((pro || (changes < changeLimit && rand(3) == 0)) && target.hasFur() && !target.hasSkinFlag(GLOBAL.FLAG_FLUFFY))
				{
					output("\n\nA familiar pins-and-needles feeling washes over your body. Looking down at an exposed part of your body, you can see that your coarse fur starts to lengthen. When the growth stops, you reach over to touch your lengthened fur. You find that it is quite warm, thick, and very soft to the touch. <b>You now have fluffy fur!</b>");
					
					target.addSkinFlag(GLOBAL.FLAG_SMOOTH);
					target.addSkinFlag(GLOBAL.FLAG_FLUFFY);
					changes++;
				}
				// Arms Transformations
				if((pro || (changes < changeLimit && rand(3) == 0)) && target.armType != GLOBAL.TYPE_REDPANDA)
				{
					if(target.armTypeUnlocked(GLOBAL.TYPE_REDPANDA))
					{
						output("\n\nYou feel your arms go limp at your sides. In curiosity, you attempt to move them, but to no avail. The muscles in your fingers seize up suddenly, curling and spasming uncontrollably. Looking down at them, you see them changing shape into slightly-shortened, thicker digits. At last, they relax, allowing you to open your hands, and just in time too! <b>Wide soft paw prints decorate your hands, completing your new, fuzzy panda arms.</b> There’s even a layer of solid [pc.furColor] fur all over your arms!");
						
						target.armType = GLOBAL.TYPE_REDPANDA;
						target.clearArmFlags();
						target.addArmFlag(GLOBAL.FLAG_FURRED);
						target.addArmFlag(GLOBAL.FLAG_PAWS);
						changes++;
					}
					else output("\n\n" + target.armTypeLockedMessage());
				}
				// PC gains “fluffy” & “furred” tags for arms:
				if((pro || (changes < changeLimit && rand(3) == 0)) && target.armType == GLOBAL.TYPE_REDPANDA && !target.hasArmFlag(GLOBAL.FLAG_FLUFFY))
				{
					output("\n\nA warm feeling courses through your [pc.arms]. You can feel the follicles on them go to work as the fur visibly expands outwards. By the time they stop growing, you have a fluffy layer of fur covering your arms.");
					
					target.addArmFlag(GLOBAL.FLAG_SMOOTH);
					target.addArmFlag(GLOBAL.FLAG_FLUFFY);
					changes++;
				}
				// Legs Transformations
				if((pro || (changes < changeLimit && rand(3) == 0)) && target.legCount >= 2 && target.legType != GLOBAL.TYPE_REDPANDA)
				{
					if(target.legTypeUnlocked(GLOBAL.TYPE_REDPANDA))
					{
						if(target.isTaur()) output("\n\nYou suddenly drop to your haunches as your legs go numb beneath of you. Wincing in pain from the impact, you try to move your [pc.legs], but they just won’t listen to any signals your brain sends to them. In the next moment, you cringe as an unsettling feeling below you tells you that the entire area below your torso is reshaping itself. <b>You look down to find that your lower body has reformed into fluffy red panda legs tipped by soft wide paws.</b> It’ll take a little bit of practice to get used to walking with these.");
						else output("\n\nYou suddenly drop to the ground as your feet go numb beneath of you. Wincing in pain from the impact, you try to move your [pc.legs], but they just won’t listen to any signals your brain sends to them. In the next moment, you cringe as an unsettling feeling below you tells you that your feet are reshaping themselves. <b>You look down to find that your feet have reformed into fluffy panda-paws tipped by sharp-looking claws.</b> There’s even a layer of solid [pc.furColor] fur all over your legs!");
						
						target.legType = GLOBAL.TYPE_REDPANDA;
						target.clearLegFlags();
						target.addLegFlag(GLOBAL.FLAG_FURRED);
						target.addLegFlag(GLOBAL.FLAG_PAWS);
						changes++;
					}
					else output("\n\n" + target.legTypeLockedMessage());
				}
				// PC gains “fluffy” & “furred” tags for legs:
				if((pro || (changes < changeLimit && rand(3) == 0)) && target.legCount >= 2 && target.legType == GLOBAL.TYPE_REDPANDA && !target.hasLegFlag(GLOBAL.FLAG_FLUFFY))
				{
					output("\n\nA warm feeling courses through your [pc.legs]. You can feel the follicles on them go to work as the fur visibly expands outwards. By the time they stop growing, you have a fluffy layer of fur covering your legs.");
					
					target.addLegFlag(GLOBAL.FLAG_SMOOTH);
					target.addLegFlag(GLOBAL.FLAG_FLUFFY);
					changes++;
				}
				// Tail Transformations
				if((pro || (changes < changeLimit && rand(3) == 0)) && target.tailType != GLOBAL.TYPE_REDPANDA)
				{
					if(target.tailTypeUnlocked(GLOBAL.TYPE_REDPANDA))
					{
						if(target.tailCount > 1) output("\n\nYour [pc.tails] convulse uncontrollably, twisting together into one tangled knot. Then, lava-hot heat envelops the whole mass, dropping you to your knees in agony. Underneath the pain, you can feel them fusing together into a single tail. A growl escapes your lips you as you recover. You begin to wonder why you decided to take this stuff.");
						else if(target.tailCount <= 0) output("\n\nA burning sensation creeps up your spine, shaking you to your core. You inadvertently reach behind you and feel a small stub of something soft sprouting from your bottom. The puffball rapidly expands outward, intensifying the burning feeling in your back. By the time it’s over, with a thought, you command your appendage to curl around you. <b>You find that you’ve grown a bushy, [pc.furColor] ringed tail.</b>");
						else output("\n\nA burning sensation creeps up your spine, shaking you to your core. You inadvertently reach behind you and feel that your [pc.tail] has shrunk down to a small ball of fur. The puffball rapidly expands outward, intensifying the burning feeling in your back. By the time it’s over, with a thought, you command your appendage to curl around you. <b>You find that you’ve grown a bushy, [pc.furColor] ringed tail.</b>");
						
						target.removeTails();
						target.tailCount = 1;
						target.tailType = GLOBAL.TYPE_REDPANDA;
						target.clearTailFlags();
						target.addTailFlag(GLOBAL.FLAG_FURRED);
						target.addTailFlag(GLOBAL.FLAG_LONG);
						changes++;
					}
					else output("\n\n" + target.tailTypeLockedMessage());
				}
				// PC gains “fluffy” & “furred” tags for tail(s):
				if((pro || (changes < changeLimit && rand(3) == 0)) && target.hasTail(GLOBAL.TYPE_REDPANDA) && !target.hasTailFlag(GLOBAL.FLAG_FLUFFY))
				{
					output("\n\nA warm feeling courses through your [pc.tails]. You can feel the follicles on " + (target.tailCount == 1 ? "it" : "them") + " go to work as the fur visibly expands outwards. By the time they stop growing, you have a fluffy layer of fur covering your tail" + (target.tailCount == 1 ? "" : "s") + ".");
					
					target.addTailFlag(GLOBAL.FLAG_SMOOTH);
					target.addTailFlag(GLOBAL.FLAG_FLUFFY);
					changes++;
				}
				
				// Dud Effect
				if(changes <= 0)
				{
					output("\n\n");
					if(!pro) output("No matter how long you wait, nothing seems to happen. It looks like either the pill was a dud, or you are already as red panda-like as you can get. Your mind dwells on the thought of asking for a refund for all of those credits you spent on the wasted pill.");
					else output("No matter how long you wait, nothing seems to happen. It looks like you are already as red panda-like as you can get. Your mind dwells on the thought of asking for a refund for all of those credits you spent on the wasted medipen.");
				}
			}
			else
			{
				if(!pro) output(target.capitalA + target.short + " swollows the pill to no effect.");
				else output(target.capitalA + target.short + " uses the medipen to no effect.");
			}
		}
	}
}

