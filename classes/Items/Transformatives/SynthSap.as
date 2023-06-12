package classes.Items.Transformatives
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.author;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	
	public class SynthSap extends ItemSlotClass
	{
		private var buff:String = "";
		
		public function SynthSap()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.POTION;
			
			shortName = "SynthSap";
			longName = "silvery container of synthetic sap";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a silvery container of synthetic sap";
			
			tooltip = "[altTooltip SynthSap]";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 700;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var changes:int = 0;
			var changeLimit:int = 1;
			var pc:Creature = target;
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			if(rand(3) == 0) changeLimit++;
			if(rand(3) == 0) changeLimit++;
			if(rand(3) == 0) changeLimit++;
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter)
			{
				buff = "";
				author("JimThermic");
				
				kGAMECLASS.output("You take a deep breath and bring the silvery container to your lips. The synthetic sap spills onto your tongue, and you’re surprised how thick and rich it is. For a while you roll it around on your tongue, savouring the taste, before you finally swallow it.");
				
				kGAMECLASS.processTime(2);
				
				//Skin Change
				// Prerequsites: Non human skin, or human skin w'o a Vanae skin color.
				// Gives human skin with vanae skin color (See Color Notes section)
				// Medium chance of occurring.
				// Apply Vanae set color
				if(!hasVanaeSkinColor(pc) && changes < changeLimit && changes < changeLimit && rand(3) == 0)
				{
					outputB("\n\nAll across your body, you begin to shed your " + pc.skinNoun(false) + ". You watch on in amazement as clumps of " + pc.skinNoun(false) + " fall from your body. It doesn’t feel uncomfortable in the least - rather, it tickles! Replacing it is ");
					setSkinColorVanae(pc);
					outputB(pc.skinTone + " flesh, soft and supple like a newborn child.");
					outputB("\n\nYou run your hand along your freshly formed skin and shiver a little with delight. <b>You now have " + pc.skinTone + " skin!</b>");
					pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
					pc.clearSkinFlags();
					
					changes++;
				}
				
				//Change Markings
				// Prerequisites: Has vanae skin color, has existing markings
				// Apply set color (Marking color)
				if(!hasMatchingVanaeSkinAccentColor(pc) && pc.hasStatusEffect("Vanae Markings") && changes < changeLimit && rand(8) == 0)
				{
					outputB("\n\nThere is a tingling under your " + pc.skin() + ". Your " + pc.skinAccent + " markings glow and pulse, catching your attention.");
					pc.skinAccent = getVanaeAccentColor(pc);
					outputB(" Suddenly, they cloud and fade, becoming " + pc.skinAccent + " in color. You take a quick moment to look over yourself using your Codex. <b>You now have " + pc.skinAccent + " body markings!</b>");
					
					changes++;
				}

				//Add Markings
				// Prerequisites: No existing markings
				// If no markings, give markings.
				// Medium chance of occurring.
				// Apply set color (Marking color)
				if(!pc.hasAccentMarkings() && changes < changeLimit && rand(4) == 0)
				{
					pc.skinAccent = getVanaeAccentColor(pc);
					outputB("\n\nAcross your " + pc.skin() + ", " + pc.skinAccent + " markings suddenly begin blossom and bloom. You watch in wonderment as the swiftly growing tattoo tree spreads across every inch of your body. It’s like dozens of fingers are tracing across your form and using your body as a living canvas.");
					outputB("\n\nWhen the sensations subside, you shiver a little and look at your reflection in your codex. Luminous lines now break up your " + pc.skin() + ". <b>You now have " + pc.skinAccent + " body markings!</b>");
					pc.createStatusEffect("Vanae Markings");
					
					changes++;
				}
				//Reflex Increase / Strength Decrease
				// Must not already have 50+ reflex and strength 0.
				// Reflex only increases to max 50.
				// Strength decreases to min 0.
				// Medium chance of occurring.
				//NOPE! FENCHANGE!
				//Reflex raised toward cap slowly. No higher than 50.
				if((pc.PQ() > 40 || pc.RQ() < 100) && changes < changeLimit && rand(3) == 0)
				{
					outputB("\n\nEvery single one of your muscles begin to throb and pulse. You gasp out loud as the strange sensation wracks your entire body. What is going on--?");
					outputB("\n\nWhen it finally subsides, you look down at your lower body. You’ve shed some muscle and every inch of you has become more lean and taut. <b>Your ");
					if(pc.PQ() > 40)
					{
						pc.physique(-1);
						outputB("physique has decreased");
						if(pc.RQ() < 100) outputB(", and your ");
					}
					if(pc.RQ() < 100)
					{
						outputB("reflexes have increased");
						pc.slowStatGain("reflexes",2);
					}
					outputB("!</b>");
					changes++;
				}
				//Vanae Tail 
				// Prerequisites: Must not have a tail. 
				// Medium chance of occurring.
				// Apply set color, if any
				// Gain Tail Trip attack
				if((pc.tailCount == 0 || pc.tailType != GLOBAL.TYPE_VANAE) && changes < changeLimit && rand(4) == 0)
				{
					if(target.tailTypeUnlocked(GLOBAL.TYPE_VANAE))
					{
						if(pc.tailCount == 1) outputB("\n\nYou hear a ‘whumph’ behind you, and realize that your " + pc.tailsDescript() + " has fallen off!");
						else if(pc.tailCount > 1) outputB("\n\nYou hear a ‘whumph’ behind you, and realize that your " + pc.tailsDescript() + " have fallen off!");
						outputB(" From just above your [pc.butt], a protrusion forms and snakes outwards. After growing a few metres out, it falls to the ground from its own weight.");
						outputB("\n\nWhen it finally stops growing, you tentatively wiggle it about. It seems to be a prehensile tail with octopus-like suckers on the bottom. It feels quite powerful, too, like you could knock someone over with a single sweep. <b>You now have a Vanae tail!</b>");
						pc.tailCount = 1;
						pc.tailType = GLOBAL.TYPE_VANAE;
						pc.clearTailFlags();
						pc.addTailFlag(GLOBAL.FLAG_LONG);
						pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
						changes++;
					}
					else kGAMECLASS.output(target.tailTypeLockedMessage());
				}
				//Tentacle Hair
				// Prerequisites: Don't have tentacle hair. Can be bald.
				// If bald, gives hair of short length
				// Medium chance of occurring.
				// Apply set color, if any
				if((!pc.hasHair() || pc.hairType != GLOBAL.HAIR_TYPE_TENTACLES || (pc.hairType == GLOBAL.HAIR_TYPE_GOO && pc.hairStyle != "tentacle")) && changes < changeLimit && hasVanaeSkinColor(pc) && rand(4) == 0)
				{
					outputB("\n\nThere’s a tingling on your scalp and you reach up to touch it. ");
					if(pc.hasHair()) outputB("Suddenly, your " + pc.hairDescript() + " begins to fall out and fall to the ground around you! ");
					outputB("Something slides out of your scalp ");
					if(pc.hasHair()) outputB("in its place");
					outputB(", growing out at an incredible rate. Whatever it is, it feels kind of slippery.");

					// Transform hair here.
					if(pc.hairType == GLOBAL.HAIR_TYPE_GOO) pc.hairStyle = "tentacle";
					else
					{
						pc.hairType = GLOBAL.HAIR_TYPE_TENTACLES;
						pc.hairStyle = "null";
					}
					pc.hairColor = getVanaeAccentColor(pc);
					if(!pc.hasHair()) pc.hairLength = 2;

					outputB("\n\nRealization hits you as your new locks fall in front of your eyes - you’ve sprouted [pc.hairColor] tentacle hair! What’s even stranger is you can lift and move around each length as easily as your arms; they’re prehensile! Twisting them about, you realize they have little octopus-like suckers facing inward. <b>You now have [pc.hairColor] tentacle hair!</b>");
					changes++;
				}
				//Finned Ears 
				// Prerequisites: Don't have finned ears.
				// Medium chance of occurring .
				if(pc.earType != GLOBAL.TYPE_VANAE && rand(4) == 0 && changes < changeLimit)
				{
					outputB("\n\nA sharp sensation strikes the sides of your head and you instinctively clutch your ears. Beneath your palms you can feel them wriggling and shifting. What’s going on? When it stops, you run your fingers along them. There are strange new contours -- are your ears <i>finned</i> now?\n\nSomething else is different. The sound of your brushing fingers, while small, is very detailed and distinct. In fact, every noise around you is more audible; you’re being bombarded by a sea of sonorous sensations. This is going to take some getting used to. <b>You now have a pair of finned Vanae ears!</b>");
					pc.earType = GLOBAL.TYPE_VANAE;
					target.clearEarFlags();
					changes++;
				}
				//Lip Color change
				// Prerequisites: Have a vanae set color
				// Medium chance of occurring 
				if(hasVanaeSkinColor(pc) && pc.lipColor != getVanaeAccentColor(pc) && changes < changeLimit && rand(4) == 0)
				{
					outputB("\n\nIt feels as if someone is running a finger along your lips. After you stop shivering, you check them out. <b>Your lips are now [pc.lipColor]!</b>");
					pc.lipColor = getVanaeAccentColor(pc);
					changes++;
				}
				//Nipple color change
				// PC's nipples are not already a vanae color
				if(pc.nippleColor != getVanaeAccentColor(pc) && hasVanaeSkinColor(pc) && changes < changeLimit && rand(4) == 0)
				{
					outputB("\n\nYour nipples begin to stiffen and ache. You look down at them, just in time to see them shift to an entirely different hue. <b>Your nipples are now [pc.nippleColor]!</b>");
					changes++;
					pc.nippleColor = getVanaeAccentColor(pc);
				}
				//Eye Color Change
				// Eye color is not vanae type.
				if(pc.eyeColor != getVanaeAccentColor(pc) && changes < changeLimit && rand(4) == 0 && hasVanaeSkinColor(pc))
				{
					pc.eyeColor = getVanaeAccentColor(pc);
					outputB("\n\nYour vision goes a little fuzzy. A few seconds later, you regain your eyesight. When you check to see if there’s anything in them, you realize your eyes have changed color. <b>Your eyes are now [pc.eyeColor]!</b>");
				}
				// Cock Type Change
				// Must not be a vanae cock type already
				x = 0;
				y = 0;
				choices = new Array();
				for(x = 0; x < target.cockTotal(); x++) {
					if(target.cocks[x].cType != GLOBAL.TYPE_VANAE && target.cockTypeUnlocked(x, GLOBAL.TYPE_VANAE)) choices[choices.length] = x;
				}
				if(choices.length == 0) x = -1;
				else x = choices[rand(choices.length)];
				// Medium chance of occurring
				if(x >= 0 && changes < changeLimit && rand(3) == 0 && hasVanaeSkinColor(pc))
				{
					outputB("\n\nInside and along your [pc.cock " + x + "], you feel a delicious ache growing and spreading from tip to base. You rub your [pc.sheath " + x + "], moaning as it steadily intensifies. Soon you’re on the ground and feverishly jerking yourself off, unable to help yourself. Inside your fingery grip, you feel as if things are moving about and rearranging. Instead of being unpleasant, it feels as if your dick is being milked by some almighty force reaching down from on high. I-I-It feels so damn good!");
					outputB("\n\nWith a shrill cry, your [pc.hips] madly buck the air and you squirt a stream of [pc.cum] up into the air, violently climaxing all over the place. Unlike a normal orgasm, you feel as if you’re cumming out of every pore in your cock! You’re not half wrong - something <i>is</i> coming out of every inch of your dick, though you’re not sure <i>what</i>! After you’re finally finished, a thin sheen of sweat coats [pc.skinFurScales]. That - that was something else! When you look down, you notice your dick has been transformed!");
					outputB("\n\nYou gaze upon the shape of your new staff, literally sizing it up. It’s completely smooth from tip to base, though it certainly doesn’t lack girth, sharing the same thickness of a human cock. Unlike a terran cock, though, it seems to be coated in some kind of natural lube that is emanating from your very pores, keeping it perpetually prepared for action. The most distinctive feature, however, is the cephalopod-like suckler that now crowns your tip, replete with a circular cock-hole in the middle. You press your hand against it and flex, feeling it tug and suckle upon it, and let out a low moan. When you rock your hips back and forth, it pulls deliciously at your palm, and you figure it out - the suckler is designed to latch and tug on the female cervix, shooting your semen into her womb <i>directly</i>! You wonder if it could latch on to the g-spot or prostate as well, tugging at and then buffering them with your point-blank cum blasts?");
					outputB("\n\n<b>You now have a vanae cock!</b>");
					// Changes PC cock type to Vanae
					// Revirginates
					// Apply set color, if any.
					pc.cocks[x].cType = GLOBAL.TYPE_VANAE;
					pc.cocks[x].addFlag(GLOBAL.FLAG_SMOOTH);
					pc.cocks[x].addFlag(GLOBAL.FLAG_LUBRICATED);
					pc.cocks[x].cThicknessRatioRaw = 1;
					pc.cocks[x].cockColor = getVanaeAccentColor(pc);
					pc.orgasm();
					pc.orgasm();
					changes++;
				}
				// Cock Color Change
				// PC has cock
				// Cock is not vanae color type
				x = 0;
				y = 0;
				choices = new Array();
				for(x = 0; x < target.cockTotal(); x++)
				{
					if(target.cocks[x].cType == GLOBAL.TYPE_VANAE && target.cocks[x].cockColor != getVanaeAccentColor(pc)) choices[choices.length] = x;
				}
				if(choices.length == 0) x = -1;
				else x = choices[rand(choices.length)];
				if(x >= 0 && changes < changeLimit && rand(4) == 0 && hasVanaeSkinColor(pc))
				{
					outputB("\n\nBetween the juxt of your [pc.thighs], you feel as if someone is slowly running their fingers up your [pc.cocks]. Shivering with delight, you relax and enjoy the slow stroking sensation");
					if(pc.cockTotal() != 1) outputB("s");
					outputB(". When it dies away, you’re left a little bit frustrated, and you let out a disappointed groan.");
					outputB("Looking down at your dick");
					if(pc.cockTotal() != 1) outputB("s");
					outputB(", you realize");
					if(pc.cockTotal() == 1) outputB(" it looks");
					else outputB(" they look");
					outputB(" different from before. Your [pc.cockHeads]");
					if(pc.cockTotal() == 1) outputB(" is");
					else outputB(" are");
					outputB(" a [pc.cockColor]");
					if(pc.hasKnot()) outputB(", as well as your [pc.knot]");
					outputB(". Brilliant, tattoo-like lines now adorn your shaft");
					if(pc.cockTotal() != 1) outputB("s");
					outputB(", making");
					if(pc.cockTotal() == 1) outputB(" it");
					else outputB(" them");
					outputB(" look like a work of art.");
					
					// Change all cock colors at once.
					for(x = 0; x < target.cockTotal(); x++)
					{
						pc.cocks[x].cockColor = getVanaeAccentColor(pc);
					}
					
					outputB(" <b>Your [pc.cocksNoun]");
					if(pc.cockTotal() == 1) outputB(" is");
					else outputB(" are");
					outputB(" now [pc.cockColor]!</b>");
				}
				// Ball Color Change
				// PC has balls
				// Balls are is not vanae color type
				if(pc.balls > 0 && pc.hasStatusEffect("Vanae Markings") && pc.statusEffectv4("Vanae Markings") <= 0 && rand(4) == 0)
				{
					outputB("\n\nYour [pc.sack] begins to feel tantalizingly ticklish and sensitive. It feels as if someone is holding it in their hands. The invisible hand caresses and toys with your [pc.balls] and you groan in delight.");
					outputB("\n\nAfter a while it stops and you look down to examine your [pc.sack]. Intricate, " + pc.skinAccent + " lines are now drawn all over it, breaking up your [pc.skinFurScales]. <b>Your [pc.sack] is now " + pc.skinAccent + "!");
					
					// "Vanae Markings" v4 for balls.
					pc.setStatusValue("Vanae Markings", 4, 1);
				}
				// Cum Color Change
				if(pc.hasCock() && pc.hasStatusEffect("Vanae Markings") && pc.cumType != GLOBAL.FLUID_TYPE_VANAE_CUM && rand(4) == 0)
				{
					outputB("\n\nYou grab your [pc.balls] and feel a churning, filling sensation inside of");
					if(pc.balls <= 1) outputB(" it");
					else outputB(" them");
					outputB(". Without warning, [pc.eachCock] sticks up and begins to wildly spurt [pc.cum] all over the place. You groan and vigorously milk your spurting staff");
					if(pc.cockTotal() != 1) outputB("s");
					outputB(", shooting your hot load all over your [pc.skin].");
					
					// Cum color change here.
					pc.cumType = GLOBAL.FLUID_TYPE_VANAE_CUM;
					pc.orgasm();
					pc.orgasm();
					pc.orgasm();
					
					outputB("\n\nDrowning in pleasure, you utterly cum out the contents of your [pc.balls] until");
					if(pc.balls <= 1) outputB(" it’s");
					else outputB(" they’re");
					outputB(" emptied, and something new fills it instead. In its place, [pc.cumColor] [pc.cumNoun] flows out from your [pc.cockHead]. <b>You now have [pc.cumColor] [pc.cumNoun]!</b>");
				}
				// Virility Increase
				if(pc.virility() > 0 && pc.cumQualityRaw < 1.25 && rand(3) == 0)
				{
					outputB("\n\nYou cry out in surprise as your");
					if(pc.balls > 0) outputB(" [pc.sack]");
					else outputB(" crotch");
					outputB(" is filled with a writhing sensation. It feels like your sperm are doing high speed laps around your");
					if(pc.balls > 0) outputB(" [pc.balls]");
					else outputB(" insides");
					outputB(". What the hell--?!");
					outputB("\n\nWhen it settles down, you rub your");
					if(pc.balls > 1) outputB(" nuts");
					else outputB(" loins");
					outputB(", still wondering that was. <b>Your virility has increased!</b>");
					
					pc.cumQualityRaw += 0.1;
				}
				// Potency Increase
				if(pc.hasCock() && pc.ballEfficiency + pc.cumMultiplierRaw < 25 && rand(3) == 0)
				{
					outputB("\n\nYour [pc.groin]");
					if(pc.isHerm() || pc.cockTotal() != 1) outputB(" tingle and throb");
					else outputB(" tingles and throbs");
					outputB(". Soon you feel an incredible pooling pressure in your loins becoming heavier and heavier and just aching to come out. You");
					if(pc.balls > 1) outputB("r [pc.balls] swell with incredible weight as you");
					outputB(" let out a deep guttural groan.");
					outputB("\n\nWhen you can’t hold it any longer, you cry out as");
					if(pc.cockTotal() == 1) outputB(" a small fountain of [pc.cumColor], [pc.cumVisc] [pc.cumNoun] spurts");
					else outputB(" small fountains of [pc.cumColor], [pc.cumVisc] [pc.cumNoun] spurt");
					outputB(" uncontrollably from your [pc.cockHeads]. <b>Your cum production has increased!</b>");
					
					// Increase PC's ballEfficiency and cumMultiplier
					pc.ballEfficiency += 10;
					pc.cumMultiplierRaw += 0.1;
					pc.orgasm();
				}
				
				// One or more TF occurs
				if(changes > 0)
				{
					kGAMECLASS.output("\n\nIt doesn’t take long at all for your unique biology to respond. A swift tingling sensation spreads out across your [pc.skinFurScales]. You feel light headed, and your heart madly races within your chest. A hot flush runs through your body, and you strip off your [pc.gear].");
					kGAMECLASS.output(buff);
				}
				// else No TFs
				else kGAMECLASS.output("\n\nYou finish off the contents. Other than lighting up your tastebuds, nothing happens to you from consuming the synthetic sap.");
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " drinks the container to no effect.");
			}
			
			return false;
		}
		protected function rand(max:Number):Number
		{
			return int(Math.random()*max);
		}
		protected function hasVanaeSkinColor(pc:Creature):Boolean
		{
			if(InCollection(pc.skinTone, "pale violet", "pale purple", "pale blue", "pale pink", "pale orange", "pale green", "pale", "pale gold")) return true;
			return false;
		}
		protected function outputB(arg:String):void
		{
			buff += arg;
		}
		protected function setSkinColorVanae(pc:Creature):void
		{
			var colors:Array = ["pale violet","pale purple","pale blue","pale pink","pale orange","pale green","pale","pale gold"];
			pc.skinTone = RandomInCollection(colors);
		}
		protected function getVanaeAccentColor(pc:Creature):String
		{
			switch(pc.skinTone)
			{
				case "pale violet":
					return "luminous violet";
					break;
				case "pale purple":
					return "luminous purple";
					break;
				case "pale blue":
					return "luminous blue";
					break;
				case "pale pink":
					return "luminous pink";
					break;
				case "pale orange":
					return "luminous orange";
					break;
				case "pale green":
					return "luminous green";
					break;
				case "pale":
					return "luminous silver";
					break;
				case "pale gold":
					return "glowing gold";
					break;
				default:
					return "luminous violet";
			}
			return "ERROR.";
		}
		
		protected function hasMatchingVanaeSkinAccentColor(pc:Creature):Boolean
		{
			if (pc.skinAccent == getVanaeAccentColor(pc)) return true;
			return false;
		}
	}
}
