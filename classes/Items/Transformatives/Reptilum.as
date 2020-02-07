package classes.Items.Transformatives
{	
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.StringUtil;
	import classes.ItemSlotClass;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.Engine.Map.InPublicSpace;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.IncrementFlag;
	import classes.Engine.Interfaces.author;
	import classes.Engine.Interfaces.output;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;

	public class Reptilum extends ItemSlotClass
	{
		public function Reptilum()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 20;
			type = GLOBAL.PILL;
			shortName = "Reptilum";
			longName = "Reptilum";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a brightly packaged bottle of murky liquid labeled ‘Reptilum’";
			tooltip = "This package contains a bottle of murky, gray liquid, all but hidden by layers of brightly colored packaging and gaudy decals. Originally created during an early rush for settlers acclimating to a tropical planet, this transformative has undergone many iterations through the generations. Consuming the contents of the bottle should grant a sleek, reptilian form.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "error";
			
			basePrice = 1000;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if (!(target is PlayerCharacter)) { output("ERROR: Reptilum should not be used by NPCs."); return false; }
		
			kGAMECLASS.flags["REPTILUM_MOVED_CLOTHES"] = undefined;
			kGAMECLASS.flags["REPTILUM_CHANGES"] = undefined;
			kGAMECLASS.flags["REPTILUM_DUCKED"] = undefined;
			kGAMECLASS.clearMenu();
			kGAMECLASS.clearOutput();
			author("Zavos");
			
			var i:int;
			
			output("You unscrew the cap on the bottle and begin to drink. The taste is bitter and dry but smooth enough that you don’t immediately retch it back up. Before you know it, the potent beverage is gone, though you are sure you have not drunk more than two or three mouthfuls. You set the bottle down, bracing yourself for whatever transformations might come.");
			
			//Each dose will provide up to three effects, with all valid transformations having a equal chance. The first transformation will have a 90% chance, the second will have a 50% chance and the third will have a 20% chance.
			var tfs:Number = 0;
			if (rand(10) < 9) tfs++;
			if (rand(10) < 5) tfs++;
			if (rand(10) < 2) tfs++;
			var validTFs:Array = new Array();
			var lockedTFs:Array = new Array();
			
			//Skintype not scales:
			//Skintype becomes scales. Scale color becomes skin color.
			if (target.skinType != GLOBAL.SKIN_TYPE_SCALES)
			{
				if (target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SCALES) && target.scaleColorUnlocked(target.skinTone)) validTFs.push(function (target:Creature):void
				{
					output("\n\nYour entire body begins to numb. All sensation of touch is quickly replaced by a queasiness far more violent than the buzz of a usual transformation.");
					if (target.hasFur()) output(" As you try to regain your bearings, your fur begins to fall out in clumps until your skin lies hairless" + (target.hasHair() || target.hasBeard() ? "... mostly." : "."));
					else if (target.hasFeathers()) output(" As you try to regain your bearings, your plumage begins to shudder as your feathers fall out in clumps.");
					else if (target.hasChitin()) output(" As you try to regain your bearings, abrupt cracks slither through your chitin, splitting off bits and chunks until it’s more of a dusty coating than an exoskeleton.");
					output(" You pat down your body as you try to understand the change, knocking away sections of molted skin, revealing an unspoiled hide of [pc.skinColor] scales beneath. <b>Your body is now covered in [pc.skinColor] scales!</b>");
					
					target.scaleColor = target.skinTone;
					target.skinType = GLOBAL.SKIN_TYPE_SCALES;
					target.clearSkinFlags();
				});
				else if (target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SCALES)) lockedTFs.push(target.skinTypeLockedMessage);
				else if (target.hasScales()) lockedTFs.push(target.scaleColorLockedMessage);
			}
			// Face not Lizan:
			// Face becomes Lizan. Face gains muzzled flag. Requires scale skintype.
			else if (target.faceType != GLOBAL.TYPE_LIZAN)
			{
				if (target.faceTypeUnlocked(GLOBAL.TYPE_LIZAN) && target.faceFlagsUnlocked(GLOBAL.FLAG_MUZZLED)) validTFs.push(function (target:Creature):void
				{
					output("\n\nWithout warning, your mind is suddenly assaulted by the violent throbs of a skull-splitting headache. Moaning softly, you bring your hands up to vainly try and ward some portion of the pain. What you find is your skull shifting, popping and cracking as your face reforms under your fingers. Your face writhes");
					if (!target.hasFaceFlag(GLOBAL.FLAG_LONG) || !target.hasFaceFlag(GLOBAL.FLAG_MUZZLED)) output(" and stretches outwards");
					output(" into a new, vaguely triangular shape. For a moment, you’re almost glad for the headache as it distorts the pounding ache of your reshaping skull. As suddenly as it came, the distress fades. Using your Codex’s camera, you inspect <b>your toothy, reptilian visage.</b>");
					
					target.faceType = GLOBAL.TYPE_LIZAN;
					target.clearFaceFlags();
					target.addFaceFlag(GLOBAL.FLAG_MUZZLED);
				});
				else if (!target.faceTypeUnlocked(GLOBAL.TYPE_LIZAN)) lockedTFs.push(target.faceTypeLockedMessage);
				else lockedTFs.push(target.faceFlagsLockedMessage);
			}

			// Eyes not Lizan:
			// Eyes become Lizan.
			if (target.eyeType != GLOBAL.TYPE_LIZAN)
			{
				if (target.eyeTypeUnlocked(GLOBAL.TYPE_LIZAN)) validTFs.push(function (target:Creature):void
				{
					output("\n\nEverything around you distorts into pulses of color and shadow, the entire world seeming to shift around you. You blink a few times, the distortion fading with each heartbeat until your vision is clear. Things look different than they did a minute ago. Everything is slightly clearer than it used to be but subtly tinged with... with... It’s almost like a new color, one you had never noticed until now. You bring out your Codex’s camera, <b>revealing your new reptilian eyes</b>: [pc.eyeColor] spheres with cat-like slits. While examining your newly reptilian gaze, you notice a new set of eyelids: transparent membranes that allow you to blink without closing your eyes. Neat!");
					
					target.eyeType = GLOBAL.TYPE_LIZAN;
				});
				else lockedTFs.push(target.eyeTypeLockedMessage);
			}

			// Hair length not zero:
			// Hair length set to zero (bald). Does not affect goo or slime hair type.
			if (target.hairLength > 0)
			{
				if (target.hairType != GLOBAL.TYPE_GOOEY && target.hairLengthUnlocked(0)) validTFs.push(function (target:Creature):void
				{
					output("\n\nYou notice something [pc.hairColor] drifting down past your eyes. As you reach up to snag it, you recognize it as a bit of your [pc.hairNoun]. Lifting your hands up, you feel your [pc.hairs] coming loose. Before you know it, your entire head is barren. <b>You are now bald.</b>");
					target.hairLength = 0;
				});
				else lockedTFs.push(target.hairLengthLockedMessage);
			}

			// Ears not Frog, Ovir or Lizan :
			// Ears become Lizan.
			if (!InCollection(target.earType, GLOBAL.TYPE_LIZAN, GLOBAL.TYPE_FROG, GLOBAL.TYPE_OVIR))
			{
				if (target.earTypeUnlocked(GLOBAL.TYPE_LIZAN)) validTFs.push(function (target:Creature):void
				{
					output("\n\nYour [pc.ears] begin to itch and burn, and you reach up to rub them. You’re surprised to find, however, that your ears have sunk into the sides of your head, leaving shallow divots for your hearing holes. <b>You now have lizard ears!</b>");
					
					target.earType = GLOBAL.TYPE_LIZAN;
					target.clearEarFlags();
					target.earLength = 0;
				});
				else lockedTFs.push(target.earTypeLockedMessage);
			}

			// Arms not Lizan:
			// Arms become Lizan. Arms gains scaled, paws flag.
			if (target.armType != GLOBAL.TYPE_LIZAN)
			{
				if (target.armTypeUnlocked(GLOBAL.TYPE_LIZAN)) validTFs.push(function (target:Creature):void
				{
					output("\n\nYour arms begin to feel very odd, alternating between irritation and numbness, the sharp contrast causing greater discomfort than either sensation alone.");
					if (!target.hasScales() && !target.hasArmFlag(GLOBAL.FLAG_SCALED)) output(" You idly begin to scratch some particularly itchy spots, only to unwittingly tear away patches of [pc.skinFurScales]. You cautiously remove the bizarre molt, revealing the scales that now cover your arms.");
					output(" Distracted by the itching, you barely notice your hands shift and warp as your palm gains a subtle layer of padding and your fingertips sharpen into claws. <b>Your arms are now");
					if (!target.hasScales() && !target.hasArmFlag(GLOBAL.FLAG_SCALED)) output(" scaley and");
					output(" reptilian.</b>");
					
					target.armType = GLOBAL.TYPE_LIZAN;
					target.clearArmFlags();
					target.addArmFlag(GLOBAL.FLAG_SCALED);
					target.addArmFlag(GLOBAL.FLAG_PAWS);
				});
				else lockedTFs.push(target.armTypeLockedMessage);
			}

			// PC is Tauric:
			// Legs get reduced to 2.
			if (target.isTaur())
			{
				if (target.legCountUnlocked(2) && target.genitalSpotUnlocked(0)) validTFs.push(function (target:Creature):void
				{
					output("\n\nYou feel woozy. The entire room seems to rock around you. You sit (as best you can) and try and wait out the vertigo, only to feel your additional [pc.legsNoun] go numb. As you try to investigate the source of this sensation, your tauric rear suddenly falls clean off,");
					if (kGAMECLASS.silly) output(" before " + (target.legCount <= 4 ? "stumbling" : "galloping") + " off into the sunset.");
					else output(" bloodlessly laying on the floor as it crumbles into a pile of unnecessary, basic elements.");
					output(" It takes a moment to regain your balance as your readjust to your new, bipedal stance.");
					if (!kGAMECLASS.silly && target.hasTail()) output(" As you dispose of your former extraneous body parts, you notice that your " + (target.hasTails() ? "tails are" : "tail is") + " still attached to you rather than your discarded hindquarters.");
					output(" You briefly feel some sense of emptiness from the loss of limbs, but the feeling is muted and passes quickly.");
					
					target.legCount = 2;
					target.genitalSpot = 0;
				});
				else if (!target.legCountUnlocked(2)) lockedTFs.push(target.legCountLockedMessage);
				else lockedTFs.push(target.genitalSpotLockedMessage);
			}

			// Legs not Lizan:
			// Legs become Lizan. Legs gains scaled, paws flags. Legcount must be 2 (does not affect Nagas, Taurs), Plantigrade/Digitigrade tags are retained from previous leg type (if neither exists, digitigrade tag is assigned as default)
			if (target.legCount == 2 && target.legType != GLOBAL.TYPE_LIZAN)
			{
				if (target.legTypeUnlocked(GLOBAL.TYPE_LIZAN) && target.legFlagsUnlocked(GLOBAL.FLAG_PAWS) && target.legFlagsUnlocked(GLOBAL.FLAG_SCALED)) validTFs.push(function (target:Creature):void
				{
					output("\n\nYour [pc.legs] are stricken by stabbing pains as their skeletal arrangement begins to shift and reshuffle. You manage to get off your [pc.feet] before you suffer an unseemly fall, turning your attention to your shifting [pc.legsNoun]. The changes are over almost as quickly as they come, <b>leaving you with distinctly reptilian looking legs.</b> Your new feet have three toes, tipped with sharp looking claws, and a smaller toe-claw in back for better grip.");
					
					target.legType = GLOBAL.TYPE_LIZAN;
					var wasPlanty:Boolean = target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE);
					target.clearLegFlags();
					if (wasPlanty) target.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
					else target.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
					target.addLegFlag(GLOBAL.FLAG_SCALED);
					target.addLegFlag(GLOBAL.FLAG_PAWS);
				});
				else if (!target.legTypeUnlocked(GLOBAL.TYPE_LIZAN)) lockedTFs.push(target.legTypeLockedMessage);
				else lockedTFs.push(target.legFlagsLockedMessage);
			}

			/*
				Fen note: I’m cutting this. Making fully lizard feet a two step transformation wouldnt be so bad if the text wasn’t basically a mirror repeat of the previous stage.

				Instead, we’ll leave this out, and you can get plantigrade feet by taking this with plantigrade legs, and you can get digitigrade lizfeet by getting digitigrade legs, then taking this.

				Problems solved without lame repeat text.
					-Fenoxo is the devil, probably.

			// Legs are Plantigrade:
			// Legs gain digitigrade flag, loose plantigrade flag. Requires Lizan leg type.
			if (target.legType == GLOBAL.TYPE_LIZAN && target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE))
			{
				if (target.legFlagsUnlocked(GLOBAL.FLAG_DIGITIGRADE) && target.legFlagsUnlocked(GLOBAL.FLAG_PLANTIGRADE)) validTFs.push(function (target:Creature):void
				{
					output("\n\nYour [pc.legs] are stricken by stabbing pains as their skeletal arrangement begins to shift and reshuffle. You manage to get off your feet before you suffer an unseemly fall, turning your attention to your shifting legs. The tips of your feet widen, bones growing and shifting until the pads of your feet can bear your full weight. The changes aren’t limited to your feet, the skeletal structure of your legs have now <b>shifted into a digitigrade arrangement</b>.");
					
					target.removeLegFlag(GLOBAL.FLAG_PLANTIGRADE);
					target.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
				});
				else lockedTFs.push(target.legFlagsLockedMessage);
			}*/

			// PC has horns:
			// Horns are removed.
			// PC has antenna:
			// Antenna are removed.
			if (target.hasHorns() || target.hasAntennae())
			{
				if ((target.hornsUnlocked(0) || !target.hasHorns()) && (target.antennaeUnlocked(0) || !target.hasAntennae())) validTFs.push(function (target:Creature):void
				{
					output("\n\nYou briefly feel a flash of numbness at the top of your head. When you reach your hand up, you’re met with a soft cascade of dust. You bring out your Codex’s camera, and are immediately met with a dramatic change to your appearance: Your<b>");
					if (target.hasHorns())
					{
						output((target.horns > 1 ? " horns" : " horn"));
						if (target.hasAntennae()) output(" and");
					}
					if (target.hasAntennae()) output((target.antennae > 1 ? " antennae" : " antenna"));
					output((target.horns + target.antennae > 1 ? " are" : " is"));
					output(" gone!</b>\n\n...Well, that explains the dust.");
					
					target.removeHorns();
					target.removeAntennae();
				});
				else if (target.hasHorns() && !target.hornsUnlocked(0)) lockedTFs.push(target.hornsLockedMessage);
				else lockedTFs.push(target.antennaeLockedMessage);
			}

			// Tongue not Ovir:
			// Tongue becomes Ovir. 
			if (target.tongueType != GLOBAL.TYPE_OVIR)
			{
				if (target.tongueTypeUnlocked(GLOBAL.TYPE_OVIR)) validTFs.push(function (target:Creature):void
				{
					output("\n\nYou keep calm, focusing on breathing deeply, as the insides of your mouth begin to violently itch but quickly realize that the itching comes and goes with every breath. You try and hold your breath, breathing through the nose until the discomfort dissipates. Once it does, you bring up your Codex’s camera to inspect the changes, only to immediately retch the moment you stick out your tongue. <b>Your tongue is thinner and slightly longer than it used to be, and your sense of taste has sharpened to the point where it can taste the air itself.</b> That’ll take some getting used to...");
					
					target.tongueType = GLOBAL.TYPE_OVIR;
					var long:Boolean = target.hasTongueFlag(GLOBAL.FLAG_LONG); var pre:Boolean = target.hasTongueFlag(GLOBAL.FLAG_PREHENSILE);
					target.clearTongueFlags();
					if (long) target.addTongueFlag(GLOBAL.FLAG_LONG);
					if (pre) target.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
				});
				else lockedTFs.push(target.tongueTypeLockedMessage);
			}
			// Tongue is ovir but lacks flags:
			// Tongue gains Long, Prehensile flags. Requires Ovir tongue type.
			else if ((!target.hasTongueFlag(GLOBAL.FLAG_LONG) || !target.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) && target.tongueType == GLOBAL.TYPE_OVIR)
			{
				if ((target.hasTongueFlag(GLOBAL.FLAG_LONG) || target.tongueFlagsUnlocked(GLOBAL.FLAG_LONG)) && (target.hasTongueFlag(GLOBAL.FLAG_PREHENSILE) || target.tongueFlagsUnlocked(GLOBAL.FLAG_PREHENSILE))) validTFs.push(function (target:Creature):void
				{
					output("\n\nA strange savory taste beings to cover your tongue. You absently drool a bit, your tongue lolling out of your mouth. When the strange sensation subsides, you try to retract the errant muscle back into your mouth only to find much, much more ");
					if(target.hasTongueFlag(GLOBAL.FLAG_LONG)) output("muscle");
					else output("tongue");
					output(" than you can remember. <b>");
					if(!target.hasTongueFlag(GLOBAL.FLAG_LONG)) output("It seems your tongue is now around a foot long!");
					if(!target.hasTongueFlag(GLOBAL.FLAG_LONG) && !target.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(" ...And prehensile as well!");
					else if(!target.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output("It seems your tongue is now prehensile!");
					output("</b> Your mind is already filled with ideas of how to use this in the bedroom.");
					
					if(!target.hasTongueFlag(GLOBAL.FLAG_LONG)) target.addTongueFlag(GLOBAL.FLAG_LONG);
					if(!target.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) target.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
				});
				else lockedTFs.push(target.tongueFlagsLockedMessage);
			}

			// Tail not Lizan:
			// Tail becomes Lizan. Tail gains scaled flags. Legcount must be 2 or more.
			//Genitail becomes Lizan type with scaled, prehensile flags, tail genital becomes a naga-cocktail, tail genital color equals scale color.
			if (target.legCount >= 2 && target.tailType != GLOBAL.TYPE_LIZAN)
			{
				if (target.hasParasiteTail() || !target.tailTypeUnlocked(GLOBAL.TYPE_LIZAN)) lockedTFs.push(target.tailTypeLockedMessage);
				else if (target.tailCount == 0 && !target.tailCountUnlocked(1)) lockedTFs.push(target.tailCountLockedMessage); 
				else if (target.hasTailGenital() && (!target.tailFlagsUnlocked(GLOBAL.FLAG_PREHENSILE) || !target.tailGenitalArgUnlocked(GLOBAL.TYPE_LIZAN) || !target.tailGenitalColorUnlocked(target.scaleColor)))
				{
					if (!target.tailFlagsUnlocked(GLOBAL.FLAG_PREHENSILE)) lockedTFs.push(target.tailFlagsLockedMessage);
					if (!target.tailGenitalArgUnlocked(GLOBAL.TYPE_LIZAN)) lockedTFs.push(target.tailGenitalArgLockedMessage);
					if (!target.tailGenitalColorUnlocked(target.scaleColor)) lockedTFs.push(target.tailGenitalColorLockedMessage);
				}
				else if (!target.tailFlagsUnlocked(GLOBAL.FLAG_SCALED)) lockedTFs.push(target.tailFlagsLockedMessage);
				else if (!target.tailTypeUnlocked(GLOBAL.TYPE_LIZAN)) lockedTFs.push(target.tailTypeLockedMessage);
				else validTFs.push(function (target:Creature):void
				{
					if (!target.hasTail())
					{
						output("\n\nA dull throbbing forms above your ass, as if something under the skin is trying to get out");
						if (!target.isAssExposed())
						{
							output(". With a hunch of what’s about to happen, you quickly remove your");
							if (target.hasArmor() && !target.isAssExposedByArmor())
							{
								output(" [pc.armor]");
								if (target.hasLowerGarment() && !target.isAssExposedByLowerUndergarment()) output(" and");
							}
							if (target.hasLowerGarment() && !target.isAssExposedByLowerUndergarment()) output(" [pc.lowerGarment]");
						}
						output(". The throbbing continues as your tailbone grows outward, a new limb bulging around the skeletal extension. A few minutes later, this new tail is several feet long with " + target.scaleColor + " scales quickly growing ");
						if (!target.hasScales()) output(" over the [pc.skinColor] skin");
						output(" as the transformation subsides.");
					}
					else
					{
						output("\n\nYour tail" + (target.tailCount == 1 ? " begins":"s begin") + " to throb, suffused with a dull ache that grows with every heartbeat, before suddenly going numb.");
						if (!target.isAssExposed()) output(" You quickly remove your [pc.assCovers] - just in time, too.");
						if(target.tailCount == 1) output(" Your tail shudders, mutating into a thick limb.");
						else output(" They shudder, twisting together into one thickened mass.");
						output(" Cautiously inspecting the altered appendage, you watch as feeling begins to flow back into it, bearing witness to the spreading " + target.scaleColor + " scales that grow across its surface.");
					}
					output(" <b>You now have a reptilian tail!</b>");
					

					if (target.hasTailGenital())
					{
						output("\n\nThough the transformation has dissipated, you still feel a faint tingling from the tip of your tail. Probing the tip, you find your tail genitalia is still present (albeit more lizard-like than it used to be).");
						if (target.hasTailCock()) output(" The tip of your tail has become a scaley sheath of sorts. It conceals your tail’s true nature from most, but will retract to reveal your reptilian tail-prick when you will it.");
						else output(" It has become every bit as reptilian as the limb it adorns. It remains clenched shut for now, but with a thought or urge, you can make it open it’s lips, revealing the cum-thirsty tail-twat to the world.");
					}
					
					output("\n\n" + (target.isAssExposed() ? "Y" : "After you re-dress, y") + "ou move around a bit, testing your balance. Your center of weight has shifted,");
					if (target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output(" in a way that you are not particularly comfortable with");
					output(" but you find it much easier to keep your balance than before.");
					
					target.tailType = GLOBAL.TYPE_LIZAN;
					if (target.tailCount == 0 || target.tailCount > 1) target.tailCount = 1;
					var tailcock:Boolean = target.hasTailFlag(GLOBAL.FLAG_TAILCOCK);
					var tailcunt:Boolean = target.hasTailFlag(GLOBAL.FLAG_TAILCUNT);
					target.clearTailFlags();
					target.addTailFlag(GLOBAL.FLAG_SCALED);
					if (tailcock || tailcunt)
					{
						target.addTailFlag(GLOBAL.FLAG_PREHENSILE);
						if (tailcunt) target.addTailFlag(GLOBAL.FLAG_TAILCUNT);
						else target.addTailFlag(GLOBAL.FLAG_TAILCOCK);
						target.tailGenitalArg = GLOBAL.TYPE_LIZAN;
						target.tailGenitalColor = target.scaleColor;
					}
				});
			}

			// Tail lacks Long flag:
			// Tail gains Long flag. Requires Lizan tail type.
			if (target.tailType == GLOBAL.TYPE_LIZAN && !target.hasTailFlag(GLOBAL.FLAG_LONG))
			{
				if (target.tailFlagsUnlocked(GLOBAL.FLAG_LONG)) validTFs.push(function (target:Creature):void
				{
					output("\n\nYour tail begins to feel strange, much of it feeling vaguely inflamed. As you turn to inspect your tail, you notice that it appears to be stretching before your eyes. The bizarre swelling and stretching continues until your tail is a proper, majestic length... <b>You have a long tail!</b>");
					
					target.addTailFlag(GLOBAL.FLAG_LONG);
				});
				else lockedTFs.push(target.tailFlagsLockedMessage);
			}

			// PC has wings:
			// Wings are removed. Suppress if wings have scaled flag.
			if (target.hasWings() && target.wingTexture() != GLOBAL.FLAG_SCALED)
			{
				if (target.wingTypeUnlocked(GLOBAL.TYPE_HUMAN)) validTFs.push(function (target:Creature):void
				{
					output("\n\nYour [pc.wings] suddenly go" + (target.wingCount == 1 ? "es":"") + " numb, all sensation fading in the blink of an eye. As you reach behind, trying to discern the fate of your [pc.wings], you notice that " + (target.wingCount == 1 ? "it’s":"they’re") + "... dissolving. Before your eyes, your [pc.wings] turn" + (target.wingCount == 1 ? "s":"") + " to dust, falling away until your back is covered by naught but your unbroken hide of [pc.skinFurScales]. <b>You have lost your wings!</b>");
					
					target.removeWings();
				});
				else lockedTFs.push(target.wingTypeLockedMessage);
			}

			// PC has non-lizan cock:
			// Change random cock to lizan.
			var availableCocks:Array = new Array();
			var lockedCock:Boolean = false;
			for (i = 0; i < target.cocks.length; i++)
			{
				if (target.cocks[i].cType == GLOBAL.TYPE_NAGA) continue;
				if (target.cockTypeUnlocked(i, GLOBAL.TYPE_NAGA)) availableCocks.push(i);
				else lockedCock = true;
			}
			if (availableCocks.length > 0) 
			{
				var cockIdx:int = RandomInCollection(availableCocks);
				validTFs.push(function (target:Creature):void
				{
					output("\n\nYou feel a surge of arousal bloom in your groin before converging on [pc.cock " + cockIdx + "].");
					if (InPublicSpace(target) && kGAMECLASS.flags["REPTILUM_DUCKED"] == undefined) output(" You quickly duck into a secluded spot so you can inspect the changes as they happen.");
					if (!target.isCrotchExposed() && kGAMECLASS.flags["REPTILUM_MOVED_CLOTHES"] == undefined) output(" Removing your [pc.crotchCovers], you focus your attention fully on your throbbing [pc.cockNoun " + cockIdx + "].");
					output(" Your masculine genitalia tapers out, its color shifting and darkening until it settles on a deep purple. Bulbous lumps form along your cock’s length,");
					if (target.hasKnot(cockIdx)) output(" though they are sorry compensation for your deflating knot.");
					else output(" swelling with arousal.");
					output(" [pc.Cum] leaks from the tip like a faucet as waves of arousal slam into you without warning. The touch-free desire only recedes once you’ve leaked out and entire orgasm worth of [pc.cumNoun], leaving your prick throbbing and sensitive. <b>Your dick is now reptilian!</b>");
					output("\n\n");
					if (!target.isCrotchExposed() && kGAMECLASS.flags["REPTILUM_MOVED_CLOTHES"] == undefined) output("After a moment of introspection, you reluctantly replace your coverings" + (target.lustQ() < 50 ? ". " : " "));
					if (target.lustQ() < 50) output("You’re more than a little pent up, already fantasizing on how to put your new tool to use.");
					else output("... and you’re more than a little frustrated. But you’ve got a new and exotic prick, and you’re already thinking on how to put it to use.");
					
					target.shiftCock(cockIdx, GLOBAL.TYPE_NAGA);
					kGAMECLASS.flags["REPTILUM_DUCKED"] = 1;
				});
			}
			else if (lockedCock) lockedTFs.push(target.cockTypeLockedMessage);

			// Balls not small:
			// Decrease ball size by 2”, down to 0.5”. Requires 0.5” diameter balls, suppress if cock has sheathed flag.
			
			if (target.balls > 0 && !target.hasACockFlag(GLOBAL.FLAG_SHEATHED) && target.ballDiameter() > 0.5 && !target.hasStatusEffect("Uniball"))
			{
				if (target.ballSizeUnlocked(target.ballSize()-1) && target.ballDiameter() > 0.5) validTFs.push(function (target:Creature):void
				{
					output("\n\nDiscomfort pulses through your [pc.sack], jerking your hand with a puppeteer's strings of pain. By the time your fingers " + (target.isCrotchExposed() || kGAMECLASS.flags["REPTILUM_MOVED_CLOTHES"] != undefined ? "reach it" : "reach under your [pc.crotchCover]") + ", the discomfort has faded, leaving behind a hollow feeling. Fondling your sack, you find it emptier than it used to be... <b>It seems your testicles have shrunk!</b>");
					if(target.hasPerk("Bulgy")) 
					{
						if(target.ballDiameter() > 10) target.ballSize(-4);
						if(target.ballDiameter() > 5) target.ballSize(-3);
						target.ballSize(-0.5);
					}
					else 
					{
						if(target.ballDiameter() > 10) target.ballSize(-6);
						if(target.ballDiameter() > 5) target.ballSize(-5);
						target.ballSize(-1);
					}
				}); 
				else lockedTFs.push(target.ballSizeLockedMessage);
			}

			// PC has one cock:
			// Grow one naga cock, measurements equals first cock. Cock color becomes purple if skinfurscales is not scales, scale color if skinfurscales is scales. Increase lust to 90%. Requires genital slit, and a single, naga type cock.
			if (target.hasCock(GLOBAL.TYPE_NAGA) && !target.hasCocks() && target.hasStatusEffect("Genital Slit"))
			{
				if (target.createCockUnlocked(2)) validTFs.push(function (target:Creature):void
				{
					output("\n\nA sudden, hot throb in your slit is the only warning you get before you feel the start of " + (kGAMECLASS.flags["REPTILUM_CHANGES"] == undefined ? "a" : "another") + " change. It feels like your [pc.cock] is getting thicker inside you, fattening up so nicely that you wonder just how much dick you can contain, even soft and unaroused.\n\nThat question is answered by the momentary pain of something separating inside you. You can feel your dick being rubbed from above and below at the same time, both places feeling as phallic as the source of your sensation. It’s then that <b>you pull open your slit to reveal a newly grown pair of reptile-dicks where once there was one.</b>");
					
					target.createCock();
					target.cocks[1].cLengthRaw = target.cocks[0].cLengthRaw;
					target.cocks[1].cThicknessRatioRaw = target.cocks[0].cThicknessRatioRaw;
					target.cocks[1].knotMultiplier = target.cocks[0].knotMultiplier;
					target.shiftCock(1,GLOBAL.TYPE_NAGA);
				});
				else lockedTFs.push(target.createCockLockedMessage);
			}

			// No Genital Slit:
			// Gain genital slit, remove balls. Increase lust to 40% Requires 1” or smaller balls, suppress if cock has sheathed flag.
			if (target.hasCock() && (target.balls == 0 || target.ballDiameter() <= 1) && !target.hasACockFlag(GLOBAL.FLAG_SHEATHED) && !target.hasStatusEffect("Genital Slit"))
			{
				if (target.ballsUnlocked(0)) validTFs.push(function (target:Creature):void
				{
					output("\n\nYour crotch is suddenly assailed by discomfort, pulsing waves of queasiness flavored by a hint of arousal.");
					if (InPublicSpace(target) && kGAMECLASS.flags["REPTILUM_DUCKED"] == undefined) output(" You quickly duck into a secluded spot so you can inspect the changes as they happen.");
					if (!target.isCrotchExposed() && kGAMECLASS.flags["REPTILUM_MOVED_CLOTHES"] == undefined)
					{
						output(" You remove your");
						if (target.hasArmor() && !target.isCrotchExposedByArmor())
						{
							output(" [pc.armor]");
							if (target.hasLowerGarment() && !target.isCrotchExposedByLowerUndergarment()) output(" and");
						}
						if (target.hasLowerGarment() && !target.isCrotchExposedByLowerUndergarment()) output(" [pc.lowerGarment]");
						output(", your attention fully focused on your throbbing [pc.cockNounSimple].");
					}
					output(" As your hand touches your [pc.cock], waves of arousal begin to flow through you until you can think of nothing else. You begin to furiously masturbate, only to feel unusual resistance with every rub. Your cock");
					if (target.balls > 0) output(" and balls");
					output(" squirm out of your grasp, sinking into your groin before your eyes.\n\nPanicked, you rub the spot where your cock vanished, finding a new opening");
					if (target.hasFur()) output(" hidden beneath your fur");
					else if (target.hasScales()) output(" concealed by scales");
					else output(" forming where your cock used to be");
					output(". Rubbing the new orifice, your ministrations are soon rewarded when your [pc.cock] peeks out, dripping with [pc.cum]. <b>You have a genital slit!</b>");
					
					target.createStatusEffect("Genital Slit");
					target.makeBallsInternal();
					target.changeLust(Math.min(0, target.lustMax()*4/10-target.lust()));

					kGAMECLASS.flags["REPTILUM_DUCKED"] = 1;
					kGAMECLASS.flags["REPTILUM_MOVED_CLOTHES"] = 1;
				});
				else lockedTFs.push(target.ballsLockedMessage);
			}

			// PC has non-lizan vagina:
			var availableVags:Array = new Array();
			var lockedVag:Boolean = false;
			for (i = 0; i < target.vaginas.length; i++)
			{
				if (target.vaginas[i].type == GLOBAL.TYPE_LIZAN) continue;
				if (target.vaginaTypeUnlocked(i, GLOBAL.TYPE_LIZAN)) availableVags.push(i);
				else lockedVag = true;
			}
			if (availableVags.length > 0)
			{
				var cuntIdx:int = RandomInCollection(availableVags);
				validTFs.push(function (target:Creature):void
				{
					output("\n\nYou feel a surge of arousal bloom in your groin before converging on [pc.vagina " + cuntIdx + "].");
					if (InPublicSpace(target) && kGAMECLASS.flags["REPTILUM_DUCKED"] == undefined) output(" You quickly duck into a secluded spot so you can inspect the changes as they happen.");
					if (!target.isCrotchExposed() && kGAMECLASS.flags["REPTILUM_MOVED_CLOTHES"] == undefined) output(" You shift [pc.crotchCovers] aside.");
					output(" Warmth flows through your love tunnel, raw arousal masking the discomfort of transformation. You see your vulva contract, your lips");
					if (target.hasFur() || target.hasScales()) output(" seeming to vanish before your eyes");
					else
					{
						output(" fading to a subtle cleft");
						if (target.balls > 0) output(" hidden behind your [pc.balls]");
						else if (target.hasCock()) output((target.hasStatusEffect("Genital Slit") ? " under your other slit" : " hidden behind your [pc.cock]"));
						output(".");
					}
					output(" Sticking a finger in, you’re pleased to see that your altered lips are far more elastic than they look... You also find your " + (target.vaginas[cuntIdx].clits > 1 ? "clits" : "clit") + ", hidden just inside your slit. <b>Your vagina is now reptilian!</b>");
					
					var oldClits:int = target.vaginas[cuntIdx].clits;
					target.shiftVagina(cuntIdx, GLOBAL.TYPE_LIZAN);
					target.vaginas[cuntIdx].clits = oldClits;
					if (target.elasticity < 2) target.elasticity = 2;
					
					target.changeLust(Math.max(0, target.lustMax()*9/10-target.lust()));

					kGAMECLASS.flags["REPTILUM_DUCKED"] = 1;
					kGAMECLASS.flags["REPTILUM_MOVED_CLOTHES"] = 1;
				});
			}
			if (lockedVag) lockedTFs.push(target.vaginaTypeLockedMessage);

			//FEN NOTE: Originally written for elasticity but only analspecific. Converted to anal bonusCapacity of 100.
			if (target.ass.bonusCapacity < 100) validTFs.push(function (target:Creature):void
			{
				output("\n\nYour [pc.asshole] feels strange for a second, tingling with the promise of some secret, invisible transformation. Nothing feels different... but you’re strangely confident that <b>your [pc.asshole] could now take larger insertions than it could before</b>. Perhaps you should test this theory out, if for nothing else than to plumb the depths of Reptilum’s effects.");
				//target.elasticity += Math.max(0, Math.min(2-target.elasticity, 0.5));
				target.ass.bonusCapacity += 25;
				target.changeLust(Math.max(0, target.lustMax()*4/10-target.lust()));
			});

			// Breast size above B cup:
			// Reduce breast size by one cup, down to B cup (feminine) or flat (masculine). Suppress if lactating.
			if (target.biggestTitSize() > (target.isMasculine() ? 0 : 2) && !target.isLactating()) 
			{
				if (target.breastRatingUnlocked(target.biggestTitRow(), target.biggestTitSize()-1) || target.breastRows[target.biggestTitRow()].breastRatingRaw == 0) validTFs.push(function (target:Creature):void
				{
					output("\n\nYou feel a vague tingling in your chest, gradually giving way to greater discomfort. It feels as if the insides of your [pc.breasts " + target.biggestTitRow() + "] are itching, each heartbeat bringing a wave of prickling upon your changing mammaries. Your breasts slowly shrink, and the itching dissipates as the changes recede. <b>Your " + (target.biggestTitSize() <= 1 ? "chest is now flat" : "breasts have lost one cup size") + "!</b>");

					target.breastRows[target.biggestTitRow()].breastRating(-1);
				});
				else lockedTFs.push(target.breastRatingLockedMessage);
			}

			// Hip size is below 10:
			// Increase hip size by 2, up to 10. Only if feminine or pregnant.
			var newHips:int = Math.min(10, target.hipRatingRaw + (Math.min(2, (10-target.hipRating()))));
			if (target.hipRating() < 10 && (target.isFeminine() || target.isPregnant()))
			{
				if (target.hipRatingUnlocked(newHips) && target.hipRatingRaw < 10) validTFs.push(function (target:Creature):void
				{
					output("\n\nPain spikes through your waist as your pelvis shifts slightly. You adjust your" + (!target.isNude() ? " clothing":"self") + ", noting that <b>your [pc.hips] are now wider.</b>");
					
					target.hipRating(newHips, true);
				});
				else lockedTFs.push(target.hipRatingLockedMessage);
			}

			// Normal nipples:
			// Nipples change to inverted nipples.
			var validNip:Boolean = false;
			var lockedNip:Boolean = false;
			for (i = 0; i < target.breastRows.length; i++)
			{
				if (target.breastRows[i].nippleType == GLOBAL.NIPPLE_TYPE_INVERTED) continue;
				if (target.nippleTypeUnlocked(i, GLOBAL.NIPPLE_TYPE_INVERTED)) validNip = true;
				else lockedNip = true;
			}
			if (validNip) validTFs.push(function (target:Creature):void
			{
				output("\n\nPain spikes through your [pc.nipples] only to fade a few moments later. " + (target.isChestExposed() ? "You inspect your [pc.breasts]," : "You peek inside your [pc.chestCover],") + " finding that your nipples have become innies! Rubbing the changed area a bit, you find that your nipples pop back out as arousal flows through them. <b>Your nipples are now inverted!</b>");
				
				for (i = 0; i < target.breastRows.length; i++) if (target.nippleTypeUnlocked(i, GLOBAL.NIPPLE_TYPE_INVERTED)) target.breastRows[i].nippleType = GLOBAL.NIPPLE_TYPE_INVERTED;
			});
			if (lockedNip) lockedTFs.push(target.nippleTypeLockedMessage);

			// No perk: “Oviposition”:
			// Gain perk: Oviposition. Requires Lizan score 4+, Ovilium pregnancy. Lizan score might need to be raised (was, to 6) to prevent overlap with races using lizan parts, such as Lethians and Saurmorians.
			//Mostly ripped from AmberSeed
			if (!target.hasPerk("Oviposition") && target.fertility() > 0 && target.hasPregnancyOfType("OviliumEggPregnancy") && target.lizanScore() >= 6) validTFs.push(function (target:Creature):void
			{
				// not exactly fitting - you are already egg-pregnant here and know it
				output("\n\nYour codex beeps for attention, the noise almost distracting you from a shudder of change flowing through your insides. Tapping the screen a few times, your codex informs you that... you are now oviparous? Realization hits you: the Ovilium! <b>It looks like your " + (target.hasVaginas() ? "wombs" : "womb") + " will be producing unfertilized eggs when left unoccupied - all without further chemical assistance.</b>\n\n<b>(Perk Gained: Oviposition)</b>");

				// oviposition perk: v1 - times acted, v4 - last known pregnancy to prevent permapreg
				target.createPerk("Oviposition", 0, 0, 0, kGAMECLASS.GetGameTimestamp(), "Causes you to regularly lay eggs when not otherwise pregnant.");
			});

			
			if (validTFs.length <= 0 || tfs <= 0)
			{
				output("\n\nA brief wave of discomfort flows through you before fading away. You wait patiently, only to realize after a minute that no changes are coming. Seems like that dose was a dud...");
				return false;
			}

			while (validTFs.length > 0 && tfs-->0) {validTFs.splice(rand(validTFs.length), 1)[0](target);IncrementFlag("REPTILUM_CHANGES");}
			while (lockedTFs.length > 0 && tfs-->0) output("\n\n"+lockedTFs.splice(rand(lockedTFs.length), 1)[0]());
			kGAMECLASS.flags["REPTILUM_MOVED_CLOTHES"] = undefined;
			kGAMECLASS.flags["REPTILUM_CHANGES"] = undefined;
			kGAMECLASS.flags["REPTILUM_DUCKED"] = undefined;
			return false;
		}
	}
}