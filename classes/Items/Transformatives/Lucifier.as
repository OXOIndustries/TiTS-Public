package classes.Items.Transformatives 
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Utility.rand;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.ItemSlotClass;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	
	public class Lucifier extends ItemSlotClass
	{
		//constructor
		public function Lucifier()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			
			shortName = "Lucifier";
			longName = "Lucifier candy apple";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a candy apple laced with ‘Lucifier’";
			
			tooltip = "An old human favorite, Lucifier’s effects were originally designed to be temporary, perfect for weekend parties and Halloween. It proved to be so popular that it is now usually sold as a permanent transformative. The fact that no biotech company has succeeded in isolating the physical changes from the marked increase in sexual appetite that come with them has only added to Lucifier’s edgy fringe appeal, however it is not particularly popular outside human circles. It appears as a small red toffee apple, the stick of which is a wiggly wooden snake.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 7200;
			
			version = _latestVersion;
		}
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			
			if(target is PlayerCharacter)
			{
				author("Nonesuch");
				
				output("You take off the wrapper and bite into the apple. Mmm! Sure beats needles. You quickly polish it off and discard the stick.");
				
				//Add “Lucifier effect” upon use. Lasts for five hours.
				
				var timerStamp:int = (6 * 60);
				
				if(target.hasStatusEffect("Lucifier Candy"))
				{
					target.addStatusValue("Lucifier Candy", 2, 1);
				}
				else
				{
					// "Lucifier Candy"
					// v1: Timestamp!
					// v2: Dose number
					target.createStatusEffect("Lucifier Candy", timerStamp, 1, 0, 0, true, "Pill", "The the Lucifier’s candy sweetness linger on your tongue....", false, timerStamp,0xB793C4);
				}
				
				itemLucifierTF(kGAMECLASS.chars["PC"]);
			}
			//Not the player!
			else
			{
				output(target.capitalA + target.short + " unwraps and eats the apple to no effect.");
			}
			return false;
		}
		private function itemLucifierTF(target:Creature):void
		{
			var isPresistentTF:Boolean = (target.statusEffectv2("Lucifier Candy") > 1);
			
			// Initialize variables
			var totalTFs:Number = 2;
			if(rand(2) == 0) totalTFs++;
			if(rand(4) == 0) totalTFs++;
			var select:int = 0;
			var x:int = 0;
			var demonSkinColor:Array = ["red", "purple", "indigo", "dark blue"];
			var demonEyeColor:Array = ["crimson", "ruby", "gold", "platinum", "pearl", "glowing amber", "glowing red", "glowing white", "luminous yellow"];
			
			// Standard dose
			var TFList:Array = [];
			// *Remove antenna
			if(target.hasAntennae())
				TFList.push(1);
			// *Remove animal tail
			if(target.tailCount > 0 && target.hasTailFlag(GLOBAL.FLAG_FURRED))
				TFList.push(2);
			// *Remove fur
			if(target.hasFur())
				TFList.push(3);
			// *Grow small horns
			if(!target.hasHorns() && target.horns < 2)
				TFList.push(4);
			// *Grow big horns
			if(target.hasHorns(GLOBAL.TYPE_DEMONIC) && target.horns < 6)
				TFList.push(5);
			// *Change skin color to red/purple/indigo/dark blue
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN && !InCollection(target.skinTone, demonSkinColor))
				TFList.push(6);
			// *Grow demon tail
			if(!target.hasTail(GLOBAL.TYPE_DEMONIC))
				TFList.push(7);
			// *Increase libido towards 100 (+4 below 50 per dose, +2 above)
			if(target.libido() < 100)
				TFList.push(8);
			// *Grow clawed hands
			if(target.armType != GLOBAL.TYPE_DEMONIC)
				TFList.push(9);
			
			// Persistent dose
			if(isPresistentTF)
			{
				// *Change lower body to human legs
				if(!InCollection(target.legType, [GLOBAL.TYPE_HUMAN, GLOBAL.TYPE_DEMONIC, GLOBAL.TYPE_SUCCUBUS]))
					TFList.push(10);
				// *Change face to human face
				if(target.faceType != GLOBAL.TYPE_HUMAN)
					TFList.push(11);
				// *If masculine/andro: grow clawed feet
				// *If feminine: grow demonic high heels
				if(target.legCount > 1 && target.legType == GLOBAL.TYPE_HUMAN)
					TFList.push(12);
				// *Grow additional horns
				if(target.hasHorns(GLOBAL.TYPE_DEMONIC) && target.horns <= 12)
					TFList.push(13);
				// *Change eyes to demonic
				if(target.eyeType != GLOBAL.TYPE_DEMONIC)
					TFList.push(14);
				// *Grow small bat wings
				if(target.wingType == 0)
					TFList.push(15);
				// *If small bat wings, grow big bat wings
				if(target.wingType == GLOBAL.TYPE_SMALLDEMONIC)
					TFList.push(16);
				// *Grow long demon tongue
				if(target.tongueType != GLOBAL.TYPE_DEMONIC)
					TFList.push(17);
				// *Change ears to demonic ears
				if(target.earType != GLOBAL.TYPE_DEMONIC)
					TFList.push(18);
			}
			
			// *Grow longer horns
			if(target.hasHorns(GLOBAL.TYPE_DEMONIC) && target.hornLength < 60)
				TFList.push(19);
			// *If cockvine wings, change to demonic tentacles
			if(target.wingType == GLOBAL.TYPE_COCKVINE)
				TFList.push(20);
			
			// TF texts
			while(totalTFs > 0)
			{
				output("\n\n");
				
				x = rand(TFList.length);
				select = TFList[x];
				TFList.splice(x,1);
				
				if(select == 0)
				{
					output("... Aside from a small rumble in your stomach and a sugary tingle lingering on your [pc.tongue]’s taste buds, nothing about you has changed...");
					if(target.race() == "demon-morph") output(" <i>It seems you may be as demonic-looking as you’re going to get!</i>");
					
					break;
				}
				
				// *Remove antenna
				else if(select == 1)
				{
					if(target.antennaeTypeUnlocked(0))
					{
						output("You feel a sharp pinch at the base of your [pc.antennae].");
						if(target.antennae == 1) output(" It drifts slowly down from your forehead like a discarded husk.");
						else output(" They drift slowly down from your forehead like discarded husks.");
						
						target.removeAntennae();
					}
					else output(target.antennaeTypeLockedMessage());
				}
				// *Remove animal tail
				else if(select == 2)
				{
					if(target.tailTypeUnlocked(0))
					{
						if(target.tailCount == 1) output("You go slightly cross-eyed as your [pc.tail] retracts back into your spine. <b>You have lost your furry tail!</b>");
						else output("You go slightly cross-eyed as your [pc.tails] retract back into your spine. <b>You have lost your furry tails!</b>");
						
						target.removeTails();
					}
					else output(target.tailTypeLockedMessage());
				}
				// *Remove fur
				else if(select == 3)
				{
					if(target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN))
					{
						output("Your [pc.skin] suddenly feels very itchy. As you scratch at your arms and torso, your fur comes out in big clumps. After a few minutes of tickly torture it’s all a sad pile of fluff on the floor surrounding you, <b>leaving you with bare human skin.</b>");
						
						target.skinType = GLOBAL.SKIN_TYPE_SKIN;
						target.clearSkinFlags();
						
						if(target.mfn("m", "f", "n") != "m")
						{
							output("\n\nYou can feel your skin tingling deliciously. Looking down, you see the Lucifier wiping away every last imperfection or mark. By the time it’s done, <b>you’re left with flawlessly smooth skin.</b>");
							
							target.addSkinFlag(GLOBAL.FLAG_SMOOTH);
						}
					}
					else output(target.skinTypeLockedMessage());
				}
				// *Grow small horns
				else if(select == 4)
				{
					if(target.hornTypeUnlocked(GLOBAL.TYPE_DEMONIC))
					{
						output("With an audible crack, spikes of keratin sprout out of your brow");
						if(target.hasHair()) output(", directly above your hairline");
						output(". They stop growing after a couple of inches, leaving you with a dinky pair of demon horns.");
						
						target.removeHorns();
						target.horns = 2;
						target.hornLength = 2;
						target.hornType = GLOBAL.TYPE_DEMONIC;
					}
					else output(target.hornTypeLockedMessage());
				}
				// *Grow big horns
				else if(select == 5)
				{
					if(target.horns < 4 && target.hornsUnlocked(4))
					{
						output("Hard keratin forces its way outward from above your brow, as if the horns you already had there were simply the tip of the iceberg. When they finally stop growing, you find that <b>you now have a set of longer demonic horns.</b>");
						
						target.horns = 4;
						if(target.hornLength < 4) target.hornLength = 4;
					}
					else if(target.horns < 6 && target.hornsUnlocked(6))
					{
						output("More hard keratin forces its way into existence above your brow, extending your demonic horns larger than they were previously and sprouting new ones in the process. When they finally stop growing, you feel mildly unbalanced; <b>you are now sporting a great, curving demon rack, impossible to ignore.</b>");
						
						target.horns = 6;
						if(target.hornLength < 8) target.hornLength = 8;
					}
					else output(target.hornsLockedMessage());
				}
				// *Change skin color to red/purple/indigo/dark blue
				else if(select == 6)
				{
					var newSkinColor:String = RandomInCollection(demonSkinColor);
					
					if(target.skinToneUnlocked(newSkinColor))
					{
						output("You feel uncomfortably hot. Blood rises to your skin and you watch as it changes color to match how you feel. After a couple of minutes the sensation fades; your new pigmentation does not. You are now a sultry " + newSkinColor + " color.");
						
						target.skinTone = newSkinColor;
					}
					else output(target.skinToneLockedMessage());
				}
				// *Grow demon tail
				else if(select == 7)
				{
					// Rare chance for demon cock tail
					if(target.hasTailCock() && target.tailGenitalArg != GLOBAL.TYPE_DEMONIC && rand(5) == 0)
					{
						var newTailColor:String = RandomInCollection(["red", "dark purple"]);
						var isParasite:Boolean = target.hasParasiteTail(true);
						
						output("[pc.EachTail] twists and flexes widly, reacting to some sort of change. Quickly grabbing [pc.oneTail], you find its shape slowly change and warp into a more sinister form.");
						if(!target.hasTailFlag(GLOBAL.FLAG_KNOTTED)) output(" A large knot grows at its base, making sure the phallus stays right where it belongs during mating.");
						output(" Sensitive nodules appear on its surface");
						if(target.hasTailFlag(GLOBAL.FLAG_RIBBED)) output(", replacing the ribs that lined it before");
						if(target.tailGenitalColor != newTailColor) output(" and its coloration changes from [pc.tailGenitalColor] to " + newTailColor);
						output(", giving it a very alien and demonic feel. When the change completes itself, you find that <b>you now have a demon-like cock tail!</b>");
						
						target.tailGenitalArg = GLOBAL.TYPE_DEMONIC;
						target.clearTailFlags();
						target.addTailFlag(GLOBAL.FLAG_PREHENSILE);
						target.addTailFlag(GLOBAL.FLAG_LONG);
						target.addTailFlag(GLOBAL.FLAG_KNOTTED);
						target.addTailFlag(GLOBAL.FLAG_NUBBY);
						if(!isParasite) target.addTailFlag(GLOBAL.FLAG_TAILCOCK);
						target.tailGenitalColor = newTailColor;
					}
					else if(target.tailTypeUnlocked(GLOBAL.TYPE_DEMONIC))
					{
						var isTailCock:Boolean = false;
						var isTailCunt:Boolean = false;
						var tailGenitalFlags:Array = [];
						var i:int = 0;
						if(target.tailCount <= 0)
						{
							output("Pressure builds at the base of your spine, before releasing gratifyingly as a tail bursts into existence behind you. Clenching new muscle groups, you flick it around to examine it; it’s long, thin and smooth, with a fleshy spade tip. Looks fun!");
							// Cock or Cunt Tail: if(target.hasTailCock() || target.hasTailCunt()) output(" When you release it, it unwinds back around and slaps into your [pc.tail] in a way you are certain you didn’t intend. Your other tail immediately responds, tensing up to flail angrily at the appendage now sharing its space. You roll your eyes; you could really do without appendage wars.");
						}
						else
						{
							output("Your [pc.tails]");
							if(target.tailCount == 1) output(" twists and flexes");
							else output(" twist and flex");
							output(" as");
							if(target.tailCount == 1) output(" it");
							else output(" they");
							output(" warp");
							if(target.tailCount == 1) output("s and morphs");
							else output(" and meld");
							output(" into a long, narrow tail tipped in a spade, the rest of the tail a single uniform thickness that you find to be completely prehensile. <b>You have a demon tail!</b>");
							if(target.hasTailCock())
							{
								output(" The tip opens up to reveal that its [pc.cockTail] has been left unchanged.");
								for(i = 0; i < target.tailFlags.length; i++)
								{
									if(InCollection(target.tailFlags[i], GLOBAL.VALID_COCK_FLAGS)) tailGenitalFlags.push(target.tailFlags[i]);
								}
								isTailCock = true;
							}
							if(target.hasTailCunt())
							{
								output(" The tip opens up to reveal that its [pc.cuntTail] has been left unchanged.");
								for(i = 0; i < target.tailFlags.length; i++)
								{
									if(InCollection(target.tailFlags[i], GLOBAL.VALID_VAGINA_FLAGS)) tailGenitalFlags.push(target.tailFlags[i]);
								}
								isTailCunt = true;
							}
						}
						if(!isTailCock && !isTailCunt) target.removeTails();
						target.tailCount = 1;
						target.tailType = GLOBAL.TYPE_DEMONIC;
						target.clearTailFlags();
						target.addTailFlag(GLOBAL.FLAG_LONG);
						target.addTailFlag(GLOBAL.FLAG_PREHENSILE);
						if(isTailCock || isTailCunt)
						{
							for(i = 0; i < tailGenitalFlags.length; i++)
							{
								target.addTailFlag(tailGenitalFlags[i]);
							}
							if(isTailCock) target.addTailFlag(GLOBAL.FLAG_TAILCOCK);
							if(isTailCunt) target.addTailFlag(GLOBAL.FLAG_TAILCUNT);
						}
					}
					else output(target.tailTypeLockedMessage());
				}
				// *Increase libido towards 100 (+4 below 50 per dose, +2 above)
				else if(select == 8)
				{
					if(target.libido() < 100)
					{
						output("As time goes on the sweetness left in your mouth by the gene mod seems to change to an aftertaste of spiciness. A heat thrums through your body with each beat of your heart, seeming to gather with each pass, making you feel frustrated and pent up.");
						if(target.libido() < 50)
						{
							output(" By Christ does this stuff make you feel horny.");
							
							target.slowStatGain("libido", 4);
						}
						else
						{
							output(" It builds to the point where it’s pulsing behind your brow, shadowing your every action, making you wonder why you are bothering with anything that is not directly aimed at satiating your desire. That is all anybody wants, after all; in this state every other aspect of life and culture flitting before your eyes seems silly, inconsequential, a baffling waste of time. You just want to fuck, and fuck, and fuck, and then fuck some more.");
							
							target.slowStatGain("libido", 2);
						}
					}
				}
				// *Grow clawed hands
				else if(select == 9)
				{
					if(target.armTypeUnlocked(GLOBAL.TYPE_DEMONIC))
					{
						output("A hot, prickly sensation picks at the tips of your fingers. You watch your fingernails lengthen, becoming four inch long talons.");
						if(target.mfn("m", "f", "n") == "m") output(" They thicken and curl slightly at the end. You swing your hands thoughtfully when they have finished growing, admiring your savage, thorn-like claws.");
						else output(" They remain straight and thin all the way down. Once they have finished growing you test one against a surface gingerly. Your new slut claws seem much firmer and stronger than fake nails: a sexy but vicious augmentation.");
						
						target.armType = GLOBAL.TYPE_DEMONIC;
						target.clearArmFlags();
						
						// Plated
						if(isPresistentTF && target.skinType != GLOBAL.SKIN_TYPE_CHITIN && rand(2) == 0)
						{
							output("\n\nThat’s not the end of your arms’ transformation, as the [pc.skinFurScalesNoun] on your forearms is covered by new sleek plates of jet-black chitin along the outside of each arm like a natural armguard. A few smaller pentagonal plates trail up your upper arms and over your shoulders. <b>You have armored arms!</b>");
							
							target.addArmFlag(GLOBAL.FLAG_CHITINOUS);
							target.addArmFlag(GLOBAL.FLAG_SMOOTH);
						}
						// Spiked:
						else if(isPresistentTF)
						{
							output("\n\nThat’s not the end for your arms transforming, as the [pc.skinFurScalesNoun] on your forearms parts around a set of short jet-black bone spikes that grow along the outside of each forearm and out of the back of your elbows, the latter fitting flush against your upper arms when your arm is held out straight. The spikes are too short and too awkwardly placed to fight with, but they certainly look imposing. <b>You have spiked arms!</b>");
							
							target.addArmFlag(GLOBAL.FLAG_SPIKED);
						}
					}
					else output(target.armTypeLockedMessage());
				}
				// *Change lower body to human legs
				else if(select == 10)
				{
					if(target.legTypeUnlocked(GLOBAL.TYPE_HUMAN))
					{
						output("A dull ache resonates through your [pc.legs], intensifying with every second; you are eventually forced to stop where you are and wait for whatever is happening to pass. It feels like every muscle and bone below your waist is liquefying. After a deeply unpleasant half hour or so you get up again, <b>twitching and posing the comfortingly familiar pair of human legs</b> which have replaced your former, more exotic mode of locomotion.");
						
						target.legType = GLOBAL.TYPE_HUMAN;
						target.legCount = 2;
						target.clearLegFlags();
						target.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
						target.genitalSpot = 0;
					}
					else output(target.legTypeLockedMessage());
				}
				// *Change face to human face
				else if(select == 11)
				{
					if(target.faceTypeUnlocked(GLOBAL.TYPE_HUMAN))
					{
						output("Heat seizes your [pc.face]; it is intense enough to force you to sit on the ground until it passes. Your sight and face shift uncomfortably as the heat fades. You pull out your codex and look at yourself with the reflector implemented. <b>You now have a mostly human face!</b>");
						
						target.faceType = GLOBAL.TYPE_HUMAN;
						target.clearFaceFlags();
						if(target.mfn("m", "f", "n") != "m") target.addFaceFlag(GLOBAL.FLAG_SMOOTH);
					}
					else output(target.faceTypeLockedMessage());
				}
				// *If masculine/andro: grow clawed feet
				// *If feminine: grow demonic high heels
				else if(select == 12)
				{
					if(target.mfn("m", "f", "n") != "f" && target.legTypeUnlocked(GLOBAL.TYPE_DEMONIC))
					{
						output("There’s a crackling sound as your toenails lengthen and thicken. You examine your [pc.feet] carefully after they’ve stopped. It looks like your toes have lengthened a bit as well, allowing you to get the most out of the excellent if rather alarming set of sharp, black claws you’ve grown down there.");
						
						target.legType = GLOBAL.TYPE_DEMONIC;
						target.clearLegFlags();
						target.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
					}
					else if(target.mfn("m", "f", "n") == "f" && target.legTypeUnlocked(GLOBAL.TYPE_SUCCUBUS))
					{
						output("Something hard presses down out of the base of your heel. It continues growing until you are forced onto the balls of your feet. Lifting your legs up confirms what you can feel: you have grown a sharp vertical horn underneath your heel, in effect giving you permanent stilettos. It takes you a few tentative steps to get used to, but once you’ve grasped that you now have to walk with a perpetual sway of the [pc.hips] it’s easy. Two dozen sharp clacks later and it’s coming entirely natural to you.");
						
						target.legType = GLOBAL.TYPE_SUCCUBUS;
						target.clearLegFlags();
						target.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
						target.addLegFlag(GLOBAL.FLAG_SMOOTH);
						target.addLegFlag(GLOBAL.FLAG_HEELS);
					}
					else output(target.legTypeLockedMessage());
				}
				// *Grow additional horns
				else if(select == 13)
				{
					var numHorns:Number = target.horns + 2;
					
					if(target.hornsUnlocked(numHorns))
					{
						output("More horns sprout their way into the open air behind your already existing ones. <b>You now have " + num2Text(numHorns/2) + " pairs of demon horns on your head</b>, a veritable forest of malevolence.");
						
						target.horns = numHorns;
						if(target.hornLength < 10) target.hornLength = 10;
					}
					else output(target.hornsLockedMessage());
				}
				// *Change eyes to demonic
				else if(select == 14)
				{
					var newEyeColor:String = RandomInCollection(demonEyeColor);
					
					if(target.eyeTypeUnlocked(GLOBAL.TYPE_DEMONIC))
					{
						output("The world wavers in front of you as your eyes seem to quiver, tightening and loosening in strange, intricate ways. You blink a few times once the transformation has finished, getting used to it. Your sight is much the same, except – you frown, turning this way and that, looking at sources of heat and light. You fancy your range of vision has extended slightly, allowing you to make out the ghost of infrared and ultraviolet now. You bet these guys will be great in the dark. You smile, creasing up your eyes with their black sclera, " + newEyeColor + " irises and inhuman, lizard pupils, pleased.");
						
						target.eyeType = GLOBAL.TYPE_DEMONIC;
						target.eyeColor = newEyeColor;
					}
					else output(target.eyeTypeLockedMessage());
				}
				// *Grow small bat wings
				else if(select == 15)
				{
					if(target.wingTypeUnlocked(GLOBAL.TYPE_SMALLDEMONIC))
					{
						output("What feels like two sheets of your skin suddenly slough off your upper back, holding on only at two small joinings near your spine. After a few nervous moments of exploration with your hands you discern that what’s actually happened is you’ve grown two small bat wings. You can move them with twitches of your shoulders, but they aren’t anywhere near strong enough to support you.");
						
						target.shiftWings(GLOBAL.TYPE_SMALLDEMONIC, 2);
					}
					else output(target.wingTypeLockedMessage());
				}
				// *If small bat wings, grow big bat wings
				else if(select == 16)
				{
					if(target.wingTypeUnlocked(GLOBAL.TYPE_DEMONIC))
					{
						output("You groan with satisfaction as wiry strength and bulk surge into your bat wings, expanding them outwards hugely.");
						if(target.isChestCovered()) output(" You are quickly forced to shed your [pc.upperGarment].");
						output(" When the transformation has finally finished the skeletal leather appendages cloak and almost dwarf you. A single twitch of your shoulders confirms what you can sense; you could easily use these babies to fly short distances.");
						
						target.wingType = GLOBAL.TYPE_DEMONIC;
						if(target.wingCount < 2) target.wingCount = 2;
					}
					else output(target.wingTypeLockedMessage());
				}
				// *Grow long demon tongue
				else if(select == 17)
				{
					if(target.tongueTypeUnlocked(GLOBAL.TYPE_DEMONIC))
					{
						output("Your mouth suddenly feels full. Way, way too full. You almost choke before your mouth is forced open, inch after inch of new tongue flesh unraveling out from between your [pc.lips]. You stare down as strong, responsive new nerve groups bloom within it, allowing you to flex and writhe the 12-inch long tapering tongue the mod has given you. Your throat twinges and seems to hollow itself out a bit, enabling you, after a few seconds, to cautiously retract your alarming new appendage back into its usual berth without issue.");
						
						target.tongueType = GLOBAL.TYPE_DEMONIC;
						target.clearTongueFlags();
						target.addTongueFlag(GLOBAL.FLAG_LONG);
						target.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
						target.addTongueFlag(GLOBAL.FLAG_TAPERED);
					}
					else output(target.tongueTypeLockedMessage());
				}
				// *Change ears to demonic ears
				else if(select == 18)
				{
					if(target.earTypeUnlocked(GLOBAL.TYPE_DEMONIC))
					{
						output("There is a burning in your ears as they warp and change, reshaping into a newer shape: distinct, pointed, and very sinister-looking. <b>You now have demonic ears!</b>");
						
						target.earLength = 2 + rand(4);
						target.earType = GLOBAL.TYPE_DEMONIC;
						target.clearEarFlags();
						target.addEarFlag(GLOBAL.FLAG_TAPERED);
					}
					else output(target.earTypeLockedMessage());
				}
				// *Grow longer horns
				else if(select == 19)
				{
					var newHornLength:Number = (target.hornLength + 2);
					if(target.horns <= 2 && newHornLength < 2) newHornLength = 2;
					else if(target.horns <= 4 && newHornLength < 4) newHornLength = 4;
					else if(target.horns <= 6 && newHornLength < 8) newHornLength = 8;
					else if(newHornLength < 12) newHornLength = 12;
					
					var hornChange:int = Math.floor(newHornLength - target.hornLength);
					
					if(target.hornLengthUnlocked(newHornLength))
					{
						output("Hard keratin forces its way outward from above your brow, extending the length of your current horns by " + num2Text(hornChange) + " inches when they finally stop growing. Touching them, you find that <b>your demonic horns are now longer.</b>");
						
						target.hornLength = newHornLength;
					}
					else output(target.hornLengthLockedMessage());
				}
				// *If cockvine wings, change to demonic tentacles
				else if(select == 20)
				{
					if(target.wingTypeUnlocked(GLOBAL.TYPE_TENTACLE))
					{
						output("Thrashing about, your cockvine tentacles along your back wriggle and spasm, reacting to a sudden change! Grabbing one of them and wrestling it in your hand, you notice it warp and shift: Still slick, its coloration transforms with an alien-like murkiness and its phallus produces a thick bulge at the base. From that bulge, nodules appear along the shaft until it reaches the very tip, where an excess of precum ejects and drools to the floor. Finally calmed, your now demonic tentacles retract back into your torso, settling to appear more like sinister spikes than bulging bumps.");
						
						target.wingType = GLOBAL.TYPE_TENTACLE;
						if(target.wingCount < 3) target.wingCount = 3;
					}
					else output(target.wingTypeLockedMessage());
				}
				
				totalTFs--;
			}
		}
	}
}
