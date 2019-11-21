package classes.Items.Accessories 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Creature;
	import classes.VaginaClass;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class LeithaCharm extends ItemSlotClass
	{
		public function LeithaCharm() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "LeithaChrm";
			
			//Regular name
			this.longName = "leitha charm necklace";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a leitha charm necklace";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A cosmetic transformative released by Xenogen, this amulet slowly releases nanomachines and gene splices over several hours that will modify you into one of the huge, tauric reptilians from Alpha Centauri -- and keep you one so long as you wear it.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 25000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
		
		// Using Leitha Charm as the test for this system, so there's going to be some hard-coded checks in various places
		// to ensure this stuff works.
		override public function onEquip(targetCreature:Creature, outputText:Boolean = false):void
		{
			/*
			 * se1 + deltaT
			 * if (se1 > 0) trigger
			 */
			
			targetCreature.createStatusEffect("Leitha Charm", -720 + rand(360), 0, 0, 0, false, "Pill", "Your leitha charm necklace hangs from your neck, infusing your body with targeted transformative nanomachines.", false, 0);
		}
		
		override public function onRemove(targetCreature:Creature, outputText:Boolean = false):void
		{
			targetCreature.removeStatusEffect("Leitha Charm");
		}
		
		public function attemptTF(target:Creature):Boolean
		{
			var availableTFs:Array = [];
			
			// Tail TF
			var wrongTailType:Boolean = target.tailType != GLOBAL.TYPE_LIZAN && target.tailTypeUnlocked(GLOBAL.TYPE_LIZAN);
			if (wrongTailType)
			{
				availableTFs.push(tailTF);
			}
			
			// Skin TF
			var wrongSkinType:Boolean = target.skinType != GLOBAL.SKIN_TYPE_SCALES && target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SCALES);
			if (wrongSkinType)
			{
				availableTFs.push(skinTF);
			}
			
			// Leg TF
			var legTypeUnlocked:Boolean = target.legTypeUnlocked(GLOBAL.TYPE_LIZAN);
			
			var wrongLegType:Boolean = target.legType != GLOBAL.TYPE_LIZAN && legTypeUnlocked;
			var wrongLegFlagDigit:Boolean = !target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE) && legTypeUnlocked;
			var wrongLegFlagScaled:Boolean = !target.hasLegFlag(GLOBAL.FLAG_SCALED) && legTypeUnlocked;
			var wrongLegFlagPaws:Boolean = !target.hasLegFlag(GLOBAL.FLAG_PAWS) && legTypeUnlocked;
			
			var wrongLegFlags:Boolean = wrongLegFlagDigit || wrongLegFlagScaled || wrongLegFlagPaws;
			
			var wrongLegCount:Boolean = target.legCount != 6 && target.legCountUnlocked(6);
			
			var orficeCapInc:Boolean = false;
			if (target.ass.bonusCapacity < 500) orficeCapInc = true;
			for (var i:int = 0; i < target.vaginas.length; i++)
				if (target.vaginas[i].bonusCapacity < 500) orficeCapInc = true;
			
			if (wrongLegType || wrongLegFlags || wrongLegCount || orficeCapInc)
			{
				availableTFs.push(legTF);
			}
			
			// Ear TF
			if (target.earType != GLOBAL.TYPE_LEITHAN && target.earTypeUnlocked(GLOBAL.TYPE_LEITHAN)) availableTFs.push(earTF);
			
			// Face TF
			var wrongFaceType:Boolean = target.faceType != GLOBAL.TYPE_HUMAN && target.faceTypeUnlocked(GLOBAL.TYPE_HUMAN);
			var wrongFaceFlags:Boolean = target.hasFaceFlag(GLOBAL.FLAG_MUZZLED) && target.faceFlagsUnlocked(GLOBAL.FLAG_MUZZLED)
			
			if (wrongFaceType && wrongFaceFlags) availableTFs.push(faceTF);
			
			// Tongue TF
			if (target.tongueType != GLOBAL.TYPE_LEITHAN && target.tongueTypeUnlocked(GLOBAL.TYPE_LEITHAN)) availableTFs.push(tongueTF);
			
			// Arm TF
			if (target.armType != GLOBAL.TYPE_LEITHAN && target.armTypeUnlocked(GLOBAL.TYPE_LEITHAN)) availableTFs.push(armTF);
			
			// Cock changes
			var nonLCock:Boolean = false;
			if (target.hasCock())
			{
				for (i = 0; i < target.cocks.length; i++)
				{
					if (target.cocks[i].cType != GLOBAL.TYPE_NAGA && target.cockTypeUnlocked(i, GLOBAL.TYPE_LEITHAN))
					{
						nonLCock = true;
						break;
					}
					
					if (target.cocks[i].cLengthRaw < 36 && target.cockLengthUnlocked(i, 36))
					{
						nonLCock = true;
						break;
					}
				}
			}
			if (nonLCock) availableTFs.push(cockTF);
			
			// Milk Changes
			if (target.milkType != GLOBAL.FLUID_TYPE_LEITHAN_MILK) availableTFs.push(milkTF);
			
			// Vag changes
			var nonLVag:Boolean = false;
			if (target.hasVagina())
			{
				for (i = 0; i < target.vaginas.length; i++)
				{
					if ((target.vaginas[i] as VaginaClass).type != GLOBAL.TYPE_LEITHAN && target.vaginaTypeUnlocked(i, GLOBAL.TYPE_LEITHAN))
					{
						nonLVag = true;
						break;
					}
					
					if ((target.vaginas[i] as VaginaClass).bonusCapacity < 500)
					{
						nonLVag = true;
						break;
					}
				}
			}
			if (nonLVag) availableTFs.push(vagTF);
			
			if (target.eyeType != GLOBAL.TYPE_LEITHAN && target.eyeTypeUnlocked(GLOBAL.TYPE_LEITHAN)) availableTFs.push(eyeTF);
			
			if (target.tallness < 108 && target.tallnessUnlocked(108)) availableTFs.push(heightTF);
			
			if (availableTFs.length > 0)
			{
				var tfState:Boolean = availableTFs[rand(availableTFs.length)](target);
				
				if (tfState)
				{
					clearMenu();
					addButton(0, "Next", kGAMECLASS.mainGameMenu);
					return true;
				}
			}
			
			return false;
		}
		
		private function earTF(target:Creature):Boolean
		{
			clearOutput();
			
			output("You feel a burning sensation in your [pc.ears], aching and straining and tearing. You clutch at your head, rubbing at your ears. The Leitha Charm hanging around your neck works its scientific wonders, slowly starting to morph the shape of your ears. They become long and tapered, elfin in shape over the course of a few minutes.");

			output("\n\nSuddenly, you feel a pressure building in the center of your forehead. Running your fingers along it, you feel a lump forming dead center of your brow. The lump becomes hard and plated, smooth like chitin rather than the same texture of your [pc.skinFurScales]. After a long moment, the lump splits off, growing two prongs out of the top. While they start off as amorphous, chitinous blobs growing off of your head, the two lumps eventually begin to coalesce and solidify into what seem to be a pair of reversed, plated bunny ears. <b>It looks like you now have the strange, four-part ears of a leithan!</b>");

			target.earType = GLOBAL.TYPE_LEITHAN;
			target.clearEarFlags();
			target.addEarFlag(GLOBAL.FLAG_LONG);
			if (target.earLength < 2) target.earLength = 2 + rand(5);
			if (target.earLength > 6) target.earLength = 6;

			return true;
		}
		
		private function tailTF(target:Creature):Boolean
		{
			clearOutput();
			
			if (target.tailType != 0 && target.tailCount > 0)
			{
				output("You feel a strange pressure building in your [pc.tails], and a distinct itchiness to boot. You grunt and look behind yourself, desperately reaching for [pc.oneTail] -- only to realize that it’s changing. Your tail");
				if (target.tailCount > 1) output("s are");
				else output(" is");
				output(" hardening, gaining chitinous plates and scales");
				if (target.tailCount > 1) output(", the bulk of the appendages merging into a singular form");
				output(", and starting to glow yellow in places. By the time it settles into its new form, you realize that <b>you’ve got yourself a long, thick, reptilian tail -- just like a leithan’s!</b>");
			}
			else
			{
				output("You feel an intense, somewhat pleasurable sensation of pressure building up just above your ass. You reach back, just in time to feel a bulge forming in your skin. Oh, boy. You put a hand on your Leitha Charm to steady yourself and brace for the worst.");

				output("\n\nInstead of hurting, though, the growing tail bursts out in a wave of pleasure. You moan as the lengthy reptilian appendage sprouts out, growing longer and thicker as it does so. Though it starts out as a soft, fleshy mass, the tail quickly begins to harden, gaining chitinous plates and scales, and starting to glow yellow in places. By the time it settles into its new form, you realize that <b>you’ve got yourself a long, thick, reptilian tail -- just like a leithan’s!</b>");
			}

			if (target.tailCount == 0 || (target.tailCount > 1 && target.tailCountUnlocked(1)))
			{
				target.tailCount = 1;
			}
			
			if (target.tailType != GLOBAL.TYPE_LIZAN && target.tailTypeUnlocked(GLOBAL.TYPE_LIZAN))
			{
				target.tailType = GLOBAL.TYPE_LIZAN;
				target.clearTailFlags();
				target.addTailFlag(GLOBAL.FLAG_LONG);
				target.addTailFlag(GLOBAL.FLAG_SCALED);
				target.addTailFlag(GLOBAL.FLAG_PREHENSILE);
			}

			return true;
		}
		
		private function skinTF(target:Creature):Boolean
		{
			clearOutput();
			
			//Change skinColor to gray. Gain scales.
			// NOTE: Leithan at creation get /scales/ not skin.
			output("You feel an itch start to spread across you, starting at your [pc.chest] near where your Leitha Charm is hanging and creeping out across your entire body. You start to scratch yourself... only to see splotches of gray starting to spread across your body.");
			if (target.skinType == GLOBAL.SKIN_TYPE_FUR) output(" Your body’s furry covering starts to fall off, giving way to the growing spread of gray scales underneath.");
			else if (target.skinType == GLOBAL.SKIN_TYPE_GOO) output(" Your gooey body begins to solidify, wracking you with strange sensations. Slowly but surely, your goo is replaced with skin, and your internals solidify into something more normal for the leithan you’re striving to become! Before long, your body is covered with scales!");
			else output(" The patches stretch across your dermis erratically, the flesh left in the wake of the expanding areas visibly hardening.")
			output(" <b>You now have scales with a gray, leithan palette!</b>");

			target.skinType = GLOBAL.SKIN_TYPE_SCALES;
			target.clearSkinFlags();
			target.skinTone = "gray";
			target.scaleColor = "gray";

			return true;
		}
		
		private function legTF(target:Creature):Boolean
		{
			var nl:Boolean = false;
			
			clearOutput();
			
			//Change legtype to Leithan. Gain centaur body. Increase capacity of orifices. Gain six legs. 
			
			var wrongLegType:Boolean = target.legType != GLOBAL.TYPE_LIZAN && target.legTypeUnlocked(GLOBAL.TYPE_LIZAN);
			if(!wrongLegType) wrongLegType = (!target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE) || !target.hasLegFlag(GLOBAL.FLAG_SCALED) || !target.hasLegFlag(GLOBAL.FLAG_PAWS));
			
			// Wrong legs or not biped
			if (wrongLegType || (target.legCount < 2 && target.legCountUnlocked(2)))
			{
				nl = true;
				output("Your [pc.legs] start to tremble, suddenly wracked with an aching agony that quickly has you on your ass, clutching at your mutating lower body. Eventually, your");
				if (target.legCount < 2 && target.legCountUnlocked(2))
				{
					output(" lower body splits, becoming a pair of legs!");
					if (wrongLegType) output(" They quickly start to resemble those of a leithan, complete with luminescent streaks and chitinous plates.");
					
					target.genitalSpot = 0;
					target.legCount = 2;
				}
				else output(" [pc.legs] begin to look like those of a leithan, growing chitinous plates and luminescent streaks.");

				if (wrongLegType)
				{
					target.legType = GLOBAL.TYPE_LIZAN;
					target.clearLegFlags();
					target.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
					target.addLegFlag(GLOBAL.FLAG_SCALED);
					target.addLegFlag(GLOBAL.FLAG_PAWS);
				}
				
				output(" You clamber up onto your");
				if (wrongLegType) output(" clawed toes");
				else output(" [pc.feet]");
				output(" and experimentally stagger around, trying to get used to your new, equine gait. <b>You now have two");
				if (wrongLegType) output(" leithan");
				output(" legs!</b>");
			}
			// Wrong legs and taur
			else if (wrongLegType && target.isTaur())
			{
				nl = true;
				output("Your already equine body starts to itch and ache, starting to mutate at the behest of your Leitha Charm. Slowly, your horse-side’s skin starts to harden, becoming dark and plate-like. Luminescant veins begin to form between the plates, giving you a sensuous glow on top of your newfound armored hide. The transformation is quick, and surprisingly pleasant feeling. <b>Your legs are now that of a leithan!</b>");
				
				target.legType = GLOBAL.TYPE_LIZAN;
				target.clearLegFlags();
				target.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
				target.addLegFlag(GLOBAL.FLAG_SCALED);
				target.addLegFlag(GLOBAL.FLAG_PAWS);
			}
			// Right legs but not taur
			else if (target.legCount < 4 && target.legCountUnlocked(4))
			{
				nl = true;
				output("Suddenly, your whole body is assailed by a sensation of stretching. Your body contorts and strains, growing");
				if (target.legCount < 4) output(" larger");
				else output(" smaller");
				output(" by the second... and more equine in shape. All you can do is endure it, trying to get used to the stretching feeling that’s gripping your entire form. Slowly but surely, your rear end expands into the familiar shape of a leithan’s horse-like backside, bulking up and hardening as plates and glowing veins form on you.");
				if (target.legCount < 4) output(" New legs begin to bud out of your changing body, growing down to support your alien frame. You’ve got four of them now, just enough to be able to carry your massive, heavy equine backside.");
				output(" After a few minutes, you’re able to scrabble up onto your hybrid legs and give your tauric body a bit of a test. You quickly end up cantering about, just like a show pony. <b>You’ve definitely got a leithan’s body now</b>, complete with chitin plates and horsey shape.");
				if (kGAMECLASS.silly) output(" Giddyup!");

				target.legCount = 4;
				target.genitalSpot = 2;
			}
			// Right legs but not 6-legged taur
			else if (target.legCount < 6 && target.legCountUnlocked(6))
			{
				nl = true;
				output("You feel a rush of pressure hammering at the middle of your tauric body, between");
				if (target.legCount < 6) output(" your two sets of");
				else output(" two of your sets of");
				output(" legs. You grunt and stagger around as");
				if (target.legCount < 6) output(" a new pair of legs begins to grow out of the center of your body, twisting muscles beginning to take shape before being covered by scaly skin, and then a coating of chitinous plates. After a few minutes, they solidify into <b>a pair of powerful, long leithan legs. You’ve got six of them in total now!</b>");
				else output(" some of your extra legs begin to diminish, the muscle and scales wasting away as the nanomachines lacing your bloodstream seek to recover the extra appendages. After a few minutes, you find yourself stood simply <b>on a set of six powerful, long leithan legs.</b>");

				target.legCount = 6;
				target.genitalSpot = 2;
			}

			var buttInc:Boolean = false;
			var vagIncs:int = 0;

			if (target.ass.bonusCapacity < 500) buttInc = true;
			if (target.hasVagina())
			{
				for (var i:int = 0; i < target.vaginas.length; i++)
				{
					if (target.vaginas[i].bonusCapacity < 500) vagIncs++;
				}
			}

			if (buttInc || vagIncs > 0)
			{
				if (nl) output("\n\n");
				output("As your body slowly transforms to be more leithan-like, you feel your");
				if (buttInc) output(" [pc.asshole]");
				if (buttInc && vagIncs > 0) output(" and");
				if (vagIncs > 0) output(" [pc.cunts]");
				output(" seem");
				if ((buttInc && vagIncs == 0) || (!buttInc && vagIncs == 1)) output("s");
				output(" to grow deeper, much more cavernous. You feel like you could take much longer, thicker insertions now.");
				if (target.isTaur()) output(" Your tauric body certainly has room for it!");
				if (target.isBimbo()) output(" You can’t wait to find a hung leithan boy to pound his mammoth lizard-dick deep into your deep, hungry hole.");

				if (target.ass.bonusCapacity < 500)
				{
					target.ass.bonusCapacity += 125;
					if (target.ass.bonusCapacity > 500) target.ass.bonusCapacity = 500;
				}

				if (target.hasVagina())
				{
					for (i = 0; i < target.vaginas.length; i++)
					{
						if (target.vaginas[i].bonusCapacity < 500)
						{
							target.vaginas[i].bonusCapacity += 125;
							if (target.vaginas[i].bonusCapacity > 500) target.vaginas[i].bonusCapacity = 500;
						}
					}
				}
			}

			return true;
		}
		
		private function faceTF(target:Creature):Boolean
		{
			clearOutput();
			
			//PC doesn't have a human face. Gain a human face.
			output("You feel your [pc.face] start to strain, becoming");
			if (target.skinType == GLOBAL.SKIN_TYPE_GOO) output(" harder and firmer, taking on a more defined shape");
			else output(" softer and more malleable");
			output(". You run a hand along your mutating features, and find that your face is taking on an altogether more human shape. You’re soon left with a solidifying visage:");
			if (target.isMasculine()) output(" you’ve got a manly jaw and sharp features,");
			else output(" you have a cute little nose and delicate features,");
			output(" <b>an altogether human face</b>.");

			target.faceType = GLOBAL.TYPE_HUMAN;
			target.clearFaceFlags();

			return true;
		}
		
		private function tongueTF(target:Creature):Boolean
		{
			clearOutput();
			
			output("Your mouth is starting to feel a little... strange. Numb perhaps, but that’s not just it. It feels a little more... cramped? It definitely seems more full than usual. Maybe you’ve eaten something recently that hasn’t been all that agreeable? Before you can think much more about what the cause might be a sudden shooting pain along the underside of your jaw strikes, and you open your mouth reflexively -- allowing a long, forked tongue to roll free from your mouth.");

			output("\n\nYou lash it around experimentally as the feeling in your mouth gradually returns to normal. Slurping it back home with a wet pop, you realize <b>you now have a forked leithan tongue!<b>");
			
			target.tongueType = GLOBAL.TYPE_LEITHAN;
			target.clearTongueFlags();
			target.addTongueFlag(GLOBAL.FLAG_LONG);
			target.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
			
			return true;
		}
		
		private function armTF(target:Creature):Boolean
		{
			clearOutput();
			
			output("A strange itch tickles at the tips of your fingers, slowly building in intensity until it feels as though your hands are throbbing in time to the beat of your heart. You flex your digits to the beat, the activity helping to mask the discomfort, and slowly fall into an automatic pattern -- until the throbbing seems to skip a beat.");

			output("\n\nAs the next throb hits the sensation doubles down, far more intense, and you look toward your fingertips -- they seem thicker, and marginally more difficult to articulate. A thick layer of chitinous plates is growing around your fingers, pulsing its way higher and higher up your arms every few seconds! When slight cracks begin to form in the tough surface, luminous streaks breaking apart the large plates, that’s when you realize <b>you now have leithan-like arms!</b>");
			
			target.armType = GLOBAL.TYPE_LEITHAN;
			target.clearArmFlags();
			target.addArmFlag(GLOBAL.FLAG_CHITINOUS);

			return true;
		}
		
		private function cockTF(target:Creature):Boolean
		{
			clearOutput();
			
			//Changes cocktype to lizard. Increases in size, up to 3 ft. long.
			//Massive Lust spike. 
			output("You feel a sudden rush of arousal building up in your prick");
			if (target.cocks.length > 1) output("s");
			output(" -- in the blink of an eye, you’re popping a");
			if (target.cocks.length > 1) output(" gaggle of");
			output(" monumental boner");
			if (target.cocks.length > 1) output("s");
			if (target.isCrotchGarbed()) output(", straining against your [pc.lowerUndergarment]");
			output(". You can’t resist the urge to grab your manhood");
			if (target.cocks.length > 1) output("s");
			output(", stroking the length of your shaft");
			if (target.cocks.length > 1) output("s");
			output(" -- and feel");
			if (target.cocks.length > 1) output(" them");
			else output(" it");
			output(" changing at your touch.");

			var tfType:int = 0;
			var tfSize:int = 0;

			for (var i:int = 0; i < target.cocks.length; i++)
			{
				if ((target.cocks[i].cType != GLOBAL.TYPE_NAGA || target.cocks[i].cType != GLOBAL.TYPE_SNAKE) && target.cockTypeUnlocked(i, GLOBAL.TYPE_NAGA))
				{
					tfType++;
					target.shiftCock(i, GLOBAL.TYPE_NAGA);
				}

				if (target.cocks[i].cLengthRaw < 36 && target.cockLengthUnlocked(i, 36))
				{
					tfSize++;
					target.cocks[i].cLengthRaw += 6;
					if (target.cocks[i].cLengthRaw > 36) target.cocks[i].cLengthRaw = 36;
					if (target.hasPerk("Hung")) target.cocks[i].cLengthRaw += Math.round(target.cocks[i].cLengthRaw / 3);
				}
			}

			if (tfType > 0)
			{
				output("\n\nThe very shape and form of");
				if (tfType == 1) output(" your member mutates");
				else output(" your members mutate");
				output(", spurred on by the leithan charm. Your prick");
				if (tfType == 1) output(" begins");
				else output("s begin");
				output(" to take on a bulbous shape, thick at the base and slowly tapering off towards a slender tip -- perfect for penetrating easily, and ramping up to a bitch-breaking stretch! You vigorously beat your meat as");
				if (tfType == 1) output(" it assumes its");
				else output(" they assume their");
				output(" new shape, slowly but steadily reforming into <b>");
				if (tfType == 1) output("a");
				output(" thick, bulbous reptilian cock");
				if (tfType > 1) output("s")
				output("!</b>");
			}

			if (tfSize > 0)
			{
				output("\n\nYour cock");
				if (tfSize == 1) output(" begins");
				else output("s begin");
				output(" to grow, straining and stretching, gaining in length. Pleasure hammers through you, half-orgasmic as your prick");
				if (tfSize == 1) output(" expands");
				else output("s expand");
				output(". You can’t help but jack yourself off through it, groaning and moaning and finally cumming from your [pc.cocks]. As you sit back and catch your breath, you eye your newly-enlarged member");
				if (tfSize > 1) output("s");
				output(". <b>You must be a couple of inches longer now!</b>");
			}

			return true;
		}
		
		private function milkTF(target:Creature):Boolean
		{
			//Change MilkType to Leithan Milk
			if (target.isFeminine() || target.isLactating())
			{
				clearOutput();
				
				output("Your [pc.chest] aches slightly, though by the time you shuck your [pc.gear] enough to rub at them, the sensation has turned to a heady pleasure.");
				if (target.isLactating()) output(" A gush of milk squirts out of your [pc.boobs], splattering your [pc.gear]. After a moment, your milk changes ever so slightly in color, and becomes thicker and sweeter-smelling. Your Codex beeps, informing you that your milk is now that of a proper leithan, complete with semi-alcoholic properties.");
				else output(" Your Codex beeps, informing you that your genetics have been modified: if you ever start to lactate, your breasts will fill with the semi-alcoholic milk of a leithan.");
				target.milkType = GLOBAL.FLUID_TYPE_LEITHAN_MILK;
				return true;
			}

			// Make the change, but don't output anything if we're a masculine, non-lactating character.
			target.milkType = GLOBAL.FLUID_TYPE_LEITHAN_MILK;
			return false;
		}
		
		private function vagTF(target:Creature):Boolean
		{
			clearOutput();
			
			var tfType:int = 0;
			var tfSize:int = 0;

			for (var i:int = 0; i < target.vaginas.length; i++)
			{
				if (target.vaginas[i].type != GLOBAL.TYPE_LEITHAN && target.vaginaTypeUnlocked(i, GLOBAL.TYPE_LEITHAN))
				{
					target.shiftVagina(i, GLOBAL.TYPE_LEITHAN);
					tfType++;
				}
				if (target.vaginas[i].bonusCapacity < 500)
				{
					target.vaginas[i].bonusCapacity = 500;
					if (target.vaginas[i].bonusCapacity > 500) target.vaginas[i].bonusCapacity = 500;
				}
			}

			//Change vagina type to Leithan/Horse/whatever. Huge capacity increase.
			output("Your");
			if (tfType + tfSize <= 2) output(" cunt clenches");
			else output(" cunts clench")
			output(" hard all of a sudden, squirting an ungodly amount of pussy-juice");
			if (!target.isCrotchGarbed()) output(" onto your thighs");
			else output(" onto the inside of your [pc.lowerUndergarment]");
			output(". You almost double over as waves of pleasure crash into your crotch, sending trembling shockwaves all through your body in reaction.");

			if (tfType > 0)
			{
				output("\n\nYou cum, hard, drenching yourself in girl-cum. Rather than clamping down more, though, your sex seems to stretch out as it orgasms, growing larger, thicker, darker... by the time it’s done, you feel like you’re rocking a marecunt");
				if (!target.hasLegs()) output(" between your [pc.legs]");
				else output(" on the face of your naga body");
				output(". A quick touch and feel tells you that that’s exactly the case: <b>your feminine sex is now just like a horse’s</b>.");
				target.orgasm();
				output("\n\nNow to find a nice, long leithan cock to break your new marecunt in...");
			}

			return true;
		}
		
		private function eyeTF(target:Creature):Boolean
		{
			clearOutput();
			
			//Change PC eye type to Leithan.
			output("You feel an aching burn start to crop up in your eyes, just enough to make your blink rapidly and rub at them. Between groans and gasps, you feel your eyes... changing, shifting under the weight of the Leitha Charm’s nanomachine magic. For an instant, you’re completely blinded, then after a grunt of agony, your vision returns -- though you can see a slightly wider angle than you did before. You pull your Codex out to act as a mirror, looking your reflection in its blue, star-struck eyes. <b>You now have leithan eyes!</b>");

			target.eyeType = GLOBAL.TYPE_LEITHAN;
			target.eyeColor = "blue";
			
			return true;
		}
		
		private function heightTF(target:Creature):Boolean
		{
			clearOutput();
			
			//Growth, up to about 9'
			target.tallness += 6;
			if (target.tallness > 108) target.tallness = 108;

			output("You feel your center of gravity seem to shift, making you stumble around. Your limbs and torso stretch out, swelling in size as the Leitha Charm works its chemical magic. You feel taller, faster, stronger after the drug’s done its work. A quick glance at your Codex’s monitor program tells you that <b>you’re about "+target.displayTallness()+" now!</b>");

			return true;
		}
	}
}
