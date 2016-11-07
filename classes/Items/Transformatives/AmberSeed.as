package classes.Items.Transformatives
{
	import classes.BreastRowClass;
	import classes.Characters.PregnancyPlaceholder;
	import classes.CockClass;
	import classes.GameData.Pregnancy.PregnancyManager;
	import classes.ItemSlotClass;
	import classes.Creature;
	import classes.Items.Miscellaneous.Lactaid;
	import classes.Items.Miscellaneous.Ovilium;
	import classes.StorageClass;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GLOBAL;
	import classes.Util.*;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.*;

	/**
	 * Avian transformative.
	 * 
	 * @author Etis @ Deus Ex Machina
	 * 
	 * Some other people from the forum have also participated, but not much left after edits.
	 * 
	 * ES is not based on any particular species, rather being loosely bird-themed designer transformative.
	 */
	public class AmberSeed extends ItemSlotClass
	{
		public static var FLAG_USED:uint = 1 << 0;
		public static var FLAG_GOO_COCK:uint = 1 << 1; // Unlocks repective goo TF.
		public static var FLAG_GOO_CUNT:uint = 1 << 2; // Unlocks repective goo TF.
		public static var FLAG_GOO_LEGS:uint = 1 << 3; // Not actually used.
		public static var FLAG_GOO_ARMS:uint = 1 << 4; // Not actually used.
		public static var FLAG_GOO_TONE:uint = 1 << 5; // Unlocks 70 tone with goo skin.
		public static var FLAG_COCK_GRIFFIN:uint = 1 << 6; // Unlocks repective goo TF.
		
		public function AmberSeed(dataObject:Object=null)
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "AmberSeed";
			//Regular name
			this.longName = "Amber Seed";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a blister pack of “Amber Seed”";
			//Displayed on tooltips during mouseovers
			// Note: it not "may" cause, it "will". It contained some ramblings about how nut could be nanomachine doped, but it was droped.
			this.tooltip = "Conventional transformative in the form of a large... nut? You can only guess at whatever it was grown naturally, or through synthetic process. A big, flashy label says “Brand new FluidShift technology! Quick and painless!” You spot a line of fine print at the back stating: “May cancel lactation in mammalian species.”";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 700;
			
			this.combatUsable = false;
			this.targetsSelf = true;
			
			this.version = this._latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			if (target is PlayerCharacter)
			{
				if (kGAMECLASS.flags["AMBER_SEED_USED"] == undefined) kGAMECLASS.flags["AMBER_SEED_USED"] = 0;
				kGAMECLASS.flags["AMBER_SEED_USED"] |= FLAG_USED;
				
				output("It is not difficult to figure out what to do with it. Strangely enough, it dissolves inside your mouth almost immediately. Is it a pill after all?");
				
				var changes:int = 0;
				var changeLimit:int = 1;
				if (rand(2) == 0) changeLimit++;
				if (rand(3) == 0) changeLimit++;
				if (rand(4) == 0) changeLimit++;
				
				while (changeLimit-- > 0 && tf(target as PlayerCharacter)) changes++;
				
				if(changes == 0)
				{
					output("\n\nNothing happens to you. It seems ");
					if (target.avianScore() >= 4) output("you are as avian as you are going to get.");
					else output(" the pill had no effect on your body after all.");
				}
			}
			//Not player!
			else
			{
				output(target.capitalA + target.short + " doesn’t seem interested in using this item...");
			}
			return false;
		}
		
		public function tf(target:PlayerCharacter):Boolean
		{
			//build possible TFs list
			var options:/*Function*/Array = [];
			
			// Skin is only able to change if body is not goo
			var avianFeatherTones:Array = ["white", "gray", "brown", "tawny", "black", "light brown", "brown and white", "black and white", "straw"];
			var avianSkinTones:Array = ["yellow", "gray", "black"];
			if (!target.hasStatusEffect("Gel Body") && target.skinType != GLOBAL.SKIN_TYPE_FEATHERS && (target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FEATHERS) 
					|| target.skinType != GLOBAL.SKIN_TYPE_SKIN 
					&& target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN) 
					&& (InCollection(target.skinTone, avianFeatherTones) || target.skinToneUnlocked("tawny"))
					&& (target.hasSkinFlag(GLOBAL.FLAG_SMOOTH) || target.skinFlagsUnlocked(GLOBAL.FLAG_SMOOTH))
					)
				)
			{
				options.push(function():*{
					var wasFluffy:Boolean = target.hasSkinFlag(GLOBAL.FLAG_FLUFFY);
					output("\n\nA sudden shiver overtake you as you feel a strange sensation throughout your [pc.skinFurScales]. In a matter of seconds, you are covered in an odd goo-like substance.");
					var newTone:String = RandomInCollection(avianFeatherTones);
					if (target.skinToneUnlocked(newTone)) target.skinTone = newTone;
					output(" You briefly panic and quickly brush it off, revealing smooth, [pc.skinTone] skin. Strange...");
					if (target.skinType == GLOBAL.SKIN_TYPE_SKIN) output(" It does not appear like your skin’s composition has changed.");
					else output(" Huh. You kinda expected to obtain feathers, not plain human-like skin.");
					
					// I have no idea why I've decided to do all this intermediate junk which is unlikely to ever be triggered
					target.skinType = GLOBAL.SKIN_TYPE_SKIN;
					target.skinFlags = [GLOBAL.FLAG_SMOOTH];
					if (!target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FEATHERS)) {
						output(" <b>You have " + target.skinFurScales(true, true) + ".</b>");
						return;
					}
					
					target.skinType = GLOBAL.SKIN_TYPE_FEATHERS;
					target.skinFlags = wasFluffy ? [GLOBAL.FLAG_FLUFFY] : [];
					if (!target.hasStatusEffect("Foxfire") || !InCollection(target.furColor, Foxfire.fireColorNormal, Foxfire.fireColorArctic))
						target.furColor = target.skinTone;
					target.skinTone = RandomInCollection(avianSkinTones);
					output("\n\nWhen you think it is all over, a second wave of changes washes over your newly-regrown skin. Its texture change to become thick, almost scale-like, [pc.skinTone] avian hide. Soon after a soft layer of feathers begins to sprout, covering your body in a coat of [pc.furColor] feathers! You pause for a moment to admire your new plumage. <b>You have " + target.skinFurScales(true, true) + " and " + target.skinFurScales(true, true, true) + ".</b>");
				});
			}
			
			// temporarily remove goo body effects, since this TF has some goo basis lore-wise
			var GooCrotch:StorageClass = target.getStatusEffect("Goo Crotch");
			var GelBody:StorageClass = target.getStatusEffect("Gel Body");
			if (GooCrotch != null) target.statusEffects.splice(target.statusEffects.indexOf(GooCrotch), 1);
			if (GelBody != null) target.statusEffects.splice(target.statusEffects.indexOf(GelBody), 1);
			
			// If tail not avian and not griffin/hippigriff legType with appropriate tailType, remove tail.
			if (target.hasTail() && !target.hasTail(GLOBAL.TYPE_AVIAN) && !(target.legType == GLOBAL.TYPE_FELINE && target.hasTail(GLOBAL.TYPE_FELINE) || target.legType == GLOBAL.TYPE_EQUINE && target.hasTail(GLOBAL.TYPE_EQUINE)))
			{
				options.push(function():*{
					if (!target.tailTypeUnlocked(0)) {
						output("\n\n" + target.tailTypeLockedMessage());
						return;
					}
					
					output("\n\nYour [pc.tails] " + (target.tailCount == 1 ? "goes" : "go") + " limp" + (target.hasTailFlag(GLOBAL.FLAG_GOOEY) ? "" : ", turning into shapeless goo") + " before being pulled inside and reabsorbed into your body, leaving no trace to show you ever had " + (target.tailCount == 1 ? "one" : "any") + ". <b>You have lost your [pc.tails]!</b>");
					target.removeTails();
				});
			}
			
			// No tail, not naga lower body - grow avian tail.
			if (!target.hasTail() && !target.isNaga())
			{
				options.push(function():*{
					if (!target.tailTypeUnlocked(GLOBAL.TYPE_AVIAN)) {
						output("\n\n" + target.tailTypeLockedMessage());
						return;
					}
					
					output("\n\nYou feel a peculiar pressure growing from your tailbone. Before are able to check it out, it becomes all too evident: you are growing a brand new tail! It comes out quite short, but a foldable ");
					if (GelBody != null) output("gooey");
					else output("feathery");
					output(" fan quickly grows out to compensate for the lack of length.");
					if (target.canFly()) output(" You feel like flying would be much easier with such convenient empennage!");
					output(" <b>You now have avian tail!</b>");
					target.tailType = GLOBAL.TYPE_AVIAN;
					target.tailCount = 1;
					target.tailFlags = GelBody != null ? [GLOBAL.FLAG_FEATHERED, GLOBAL.FLAG_GOOEY] : [GLOBAL.FLAG_FEATHERED];
				});
			}
			
			// Wings. Staged, 'cause I was too lazy to make something universal. Remove non-avian wings first.
			if (target.wingType != 0 && target.wingCount != 0 && !target.hasWings(GLOBAL.TYPE_AVIAN) && !target.hasWings(GLOBAL.TYPE_DOVE))
			{
				options.push(function():*{
					if (!target.wingTypeUnlocked(0)) {
						output("\n\n" + target.wingTypeLockedMessage());
						return;
					}
					
					if (target.wingType == GLOBAL.TYPE_SHARK) output("\n\nYour [pc.wing] twitches strangely, losing all resemblance of structure before quickly receding into your body, leaving only smooth [pc.skinFurScalesNoun] behind.");
					else output("\n\nYour [pc.wings] suddenly go limp, as if stripped of any inner structure. A few seconds later they begin melting, turning into goo before being reabsorbed into your body.");
					output(" <b>Your [pc.wings] " + (target.wingCount == 1 ? "is":"are") + " gone!</b>");
					target.removeWings();
				});
			}
			
			if (target.wingType == 0 && target.wingCount == 0)
			{
				options.push(function():*{
					if (!target.wingTypeUnlocked(GLOBAL.TYPE_AVIAN)) {
						output("\n\n" + target.wingTypeLockedMessage());
						return;
					}
					
					output("\n\nYou suddenly feel an unbearable itch on your back, but before you can reach to scratch at it, two semi-solid nubs of goo burst out from behind your shoulders and reach out, expanding rapidly. After reaching a few feet in length they begin to solidify, and within moments hundreds of tiny feather-needles form and push out from underneath the skin. Your wings are quickly coated with a thick layer of small, downy feathers, and much larger and stronger ones begin pushing out to form the bulk of your new avian limbs. As the growth ceases, you give your new wings an experimental flex, and you can easily feel the force they create when pushing against the wind. <b>You now have large avian wings!</b>");
					target.wingCount = 2;
					target.wingType = GLOBAL.TYPE_AVIAN;
				});
			}
			
			// Non avian legs, not naga, not matching griffin/hippogriff requirements:
			if (!target.isNaga() && !InCollection(target.legType, GLOBAL.TYPE_AVIAN, GLOBAL.TYPE_FELINE, GLOBAL.TYPE_EQUINE))
			{
				options.push(function():*{
					if (!target.legTypeUnlocked(GLOBAL.TYPE_AVIAN)) {
						output("\n\n" + target.legTypeLockedMessage());
						return;
					}
					if (target.legCount == 1 && !target.legCountUnlocked(2)) {
						output("\n\n" + target.legCountLockedMessage());
						return;
					}
					
					if (target.isGoo()) output("\n\nRipples forms along the surface of your amorphous “goo-legs” as it starts to shift and wobble strangely, before suddenly melting into a lifeless pool beneath you.");
					else if (target.legCount == 1) output("\n\nRipples form along the surface of your [pc.leg] as it starts to shift and wobble strangely, before suddenly melting into a lifeless pool beneath you.");
					else output("\n\nYour [pc.legs] feel wobbly as they suddenly soften into a noodle-like consistency.");
					
					output(" Thankfully it is not permanent, and in a few moments " + (target.legCount == 1?"it reforms":"they reform") + " into thin, bird-like legs");
					if (target.skinType == GLOBAL.SKIN_TYPE_SKIN || target.hasFeathers()) output(" complete with rough, almost scale-like skin");
					output(" — long, prehensile padded toes and short, but rather sharp avian claws.");
					if (GelBody != null) output(" Feather-shaped shingles of goo");
					else output(" A feathery fringe");
					output(" covers them down to your");
					if (target.hasSkinFlag(GLOBAL.FLAG_FLUFFY)) output("ankles");
					else output("knees");
					output(", leaving your clawed feet bare. <b>You now have bird-like legs!</b>");
					
					if (target.legCount == 1) target.legCount = 2;
					target.legType = GLOBAL.TYPE_AVIAN;
					target.legFlags = [GLOBAL.FLAG_DIGITIGRADE, GLOBAL.FLAG_PREHENSILE, GLOBAL.FLAG_PAWS, GLOBAL.FLAG_FEATHERED];
					if (target.hasSkinFlag(GLOBAL.FLAG_FLUFFY)) target.addLegFlag(GLOBAL.FLAG_FLUFFY);
					if (GelBody != null) target.addLegFlag(GLOBAL.FLAG_GOOEY);
					
					if ((kGAMECLASS.flags["AMBER_SEED_USED"] & FLAG_GOO_LEGS) != FLAG_GOO_LEGS && GelBody != null) kGAMECLASS.flags["AMBER_SEED_USED"] |= FLAG_GOO_LEGS;
				});
			}
			
			// Non-avian hands:
			if (target.armType != GLOBAL.TYPE_AVIAN)
			{
				options.push(function():*{
					if (!target.armTypeUnlocked(GLOBAL.TYPE_AVIAN)) {
						output("\n\n" + target.armTypeLockedMessage());
						return;
					}
					
					output("\n\nA strange sensation of shifting mass in your arms draws your attention. After a few seconds of what feels like snakes slithering under your skin, you’re left with thin, but surprisingly strong arms with");
					if (target.skinType == GLOBAL.SKIN_TYPE_SKIN || target.hasFeathers()) output(" rough, almost scale-like skin,");
					output(" short palms and long, clawed and padded fingers. ");
					if (GelBody != null) output(" Feather-shaped shingles of goo");
					else output(" A feathery fringe");
					output(" covers them down to your ");
					if (target.hasSkinFlag(GLOBAL.FLAG_FLUFFY)) output("wrists");
					else output("elbows");
					output(", leaving your hands bare. <b>You now have bird-like arms!</b>");
					
					target.armType = GLOBAL.TYPE_AVIAN;
					target.armFlags = [GLOBAL.FLAG_PAWS, GLOBAL.FLAG_FEATHERED];
					if (target.hasSkinFlag(GLOBAL.FLAG_FLUFFY)) target.addArmFlag(GLOBAL.FLAG_FLUFFY);
					if (GelBody != null) target.addArmFlag(GLOBAL.FLAG_GOOEY);
					
					if ((kGAMECLASS.flags["AMBER_SEED_USED"] & FLAG_GOO_ARMS) != FLAG_GOO_ARMS && GelBody != null) kGAMECLASS.flags["AMBER_SEED_USED"] |= FLAG_GOO_ARMS;
				});
			}
			
			// not bald, not feathers:
			if (target.hairType != GLOBAL.HAIR_TYPE_FEATHERS)
			{
				options.push(function():*{
					if (!target.hairTypeUnlocked(GLOBAL.HAIR_TYPE_FEATHERS)) {
						output("\n\n" + target.hairTypeLockedMessage());
						return;
					}
					
					if (target.hasHair()) output("\n\nYou are distracted by a strange sensation on top of your head. A quick check-up reveals that your [pc.hairNoun] has changed. <b>You now have a feathery plume on your head!</b>");
					else output("\n\nYour scalp briefly tingles, but your [pc.hair] remains unchanged.");
					
					target.hairType = GLOBAL.HAIR_TYPE_FEATHERS;
					target.hairStyle = "null";
				});
			}
			
			// Non avian ears (griffin/hippogriff with avian ears would retain avian ears, but would grow corresponding if other type):
			if (target.earType != GLOBAL.TYPE_AVIAN && !(target.legType == GLOBAL.TYPE_FELINE && target.earType == GLOBAL.TYPE_FELINE) && !(target.legType == GLOBAL.TYPE_EQUINE && target.earType == GLOBAL.TYPE_EQUINE))
			{
				options.push(function():*{
					if (target.legType == GLOBAL.TYPE_FELINE || target.legType == GLOBAL.TYPE_EQUINE) {
						if (!target.earTypeUnlocked(target.legType)) {
							output("\n\n" + target.earTypeLockedMessage());
							return;
						}
						
						output("\n\nYour ears start to tingle, making you want to reach up and scratch them - but as you do, they begin to twist and morph beneath your touch, reshaping into a pair of pointy tips, towering over your head. You experimentally try wiggling them, feeling them swivel about at your command.");
						if (target.legType == GLOBAL.TYPE_FELINE) output(" <b>You now have feline ears!</b>");
						if (target.legType == GLOBAL.TYPE_EQUINE) output(" <b>You now have equine ears!</b>");
						target.earType = target.legType;
					} else {
						if (!target.earTypeUnlocked(GLOBAL.TYPE_AVIAN)) {
							output("\n\n" + target.earTypeLockedMessage());
							return;
						}
						
						output("\n\nYou feel a nagging itch at your ears. Eventually you reach up to scratch it, only to discover that your ears have been replaced by a pair of small holes, complete with");
						if (GelBody != null) output(" fin-like protrusions");
						else output(" tufts of feathers");
						output(" that act as auricles. <b>You now have avian-looking ears!</b>");
						target.earType = GLOBAL.TYPE_AVIAN;
					}
				});
			}
			
			// Non-avian face:
			if (target.faceType != GLOBAL.TYPE_AVIAN)
			{
				options.push(function():*{
					if (!target.faceTypeUnlocked(GLOBAL.TYPE_AVIAN)) {
						output("\n\n" + target.faceTypeLockedMessage());
						return;
					}
					
					output("\n\nA strange sensation overtakes you as something pulls at your [pc.face].");
					if (target.hasFaceFlag(GLOBAL.FLAG_MUZZLED)) output(" It feels like the outer parts of your muzzle are being polished smooth.");
					else output(" Your whole face flows forward like molten wax, forming a single, smooth structure from your nose and mouth.");
					output(" After all has settled down, you’re left with a... beak? Except it doesn’t feel like one at all. Checking it out, you discover that what at first glance appears to be sharp, menacing edges, are in fact thin, yet soft lips and you still have teeth, even if they are hidden from view. Convenient - while looking like a proper beak, it won’t impede your ability to do things with your mouth! <b>You now have beak-like muzzle!</b>");
					target.faceType = GLOBAL.TYPE_AVIAN;
					target.faceFlags = [GLOBAL.FLAG_MUZZLED, GLOBAL.FLAG_BEAK];
					if (!Foxfire.colorsMatching(target)) target.lipColor = "ivory";
					target.lipMod = -10;
				});
			}
			
			// Non-avian eyes (griffin can retain feline eyes):
			if (target.eyeType != GLOBAL.TYPE_AVIAN && !(target.legType == GLOBAL.TYPE_FELINE && target.eyeType == GLOBAL.TYPE_FELINE))
			{
				options.push(function():*{
					if (!target.eyeTypeUnlocked(GLOBAL.TYPE_AVIAN)) {
						output("\n\n" + target.eyeTypeLockedMessage());
						return;
					}
					
					output("\n\nYour vision grows dark for a moment, but before you can reach up to rub your eyes sight returns to normal. After some closer inspection you discover that your eyes have changed!");
					target.eyeType = GLOBAL.TYPE_AVIAN;
					if (!(InCollection(target.furColor, Foxfire.fireColorNormal, Foxfire.fireColorArctic) && InCollection(target.eyeColor, "blue", "luminous cerulean", "luminous azure", "luminous celeste")))
						target.eyeColor = RandomInCollection("yellow", "yellow", "yellow", "yellow", "hazel", "hazel", "brown", "brown", "brown", "dark yellow", "pale yellow", "amber", "red", "black");
					output(" <b>You now have [pc.eyeColor] avian eyes, complete with fully functional nictitating membranes, acting like a set of secondary eyelids!</b>");
				});
			}
			
			// If tongue not avian (requires avian face):
			if (target.tongueType != GLOBAL.TYPE_AVIAN)
			{
				options.push(function():*{
					if (!target.tongueTypeUnlocked(GLOBAL.TYPE_AVIAN)) {
						output("\n\n" + target.tongueTypeLockedMessage());
						return;
					}
					output("\n\nYou almost choke on a ball of goo as it suddenly fills your");
					if (target.hasFaceFlag(GLOBAL.FLAG_BEAK)) output(" beak");
					else output(" mouth");
					output(". You gag and try to spit it out, but to no avail. After few seconds it re-solidifies into a new long and prehensile tongue. Creepy. <b>You now have an avian tongue!</b>");
					
					target.tongueType = GLOBAL.TYPE_AVIAN;
					target.tongueFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_PREHENSILE];
				});
			}
			
			// If has cocks and no genital slit, lower body is not matching griffin/hippogriff requirements:
			if (target.hasCock() && !target.hasStatusEffect("Genital Slit") && !InCollection(target.legType, GLOBAL.TYPE_FELINE, GLOBAL.TYPE_EQUINE))
			{
				options.push(function():*{
					if (target.hasFullSheaths()) output("\n\nIn a single sucking movement, your sheath" + (target.cockTotal() == 1?" is":"s are") + " retracted fully into your body, taking your dick" + (target.cockTotal() == 1?" with it":"s with them") + "!");
					else output("\n\nIn a single sucking movement, your cock" + (target.cockTotal() == 1?" is":"s are") + " pulled into your body!");
					output(" Upon closer inspection and a bit of poking around, you discover that your dick" + (target.cockTotal() == 1?"":"s") + " now reside" + (target.cockTotal() == 1?"s":"") + " inside a shallow slit, only poking " + (target.cockTotal() == 1?"itself":"themselves") + " out when you are aroused. Neat. <b>You now have genital slit!</b>");
					target.createStatusEffect("Genital Slit");
				});
			}
			
			// If has balls:
			if (target.balls > 0 && target.hasStatusEffect("Genital Slit"))
			{
				options.push(function():*{
					if (!target.ballsUnlocked(0)) {
						output("\n\n" + target.ballsLockedMessage());
						return;
					}
					
					output("\n\nYour [pc.balls] " + (target.balls == 1?"is":"are") + " suddenly pulled up, just like before the peak of an orgasm, but instead of dropping back down, " + (target.balls == 1?"it":"they") + " continue " + (target.balls == 1?"its":"their") + " journey up, before being fully absorbed into your body. <b>You now have internal testicles!</b>");
					target.makeBallsInternal();
				});
			}
			
			if (target.balls > 0 && !target.hasStatusEffect("Genital Slit") && InCollection(target.legType, GLOBAL.TYPE_FELINE, GLOBAL.TYPE_EQUINE) && target.ballSizeRaw > target.tallness * Math.PI / 24)
			{
				options.push(function():*{
					output("\n\nA sudden inward pressure erupts inside your [pc.sack], drawing a gasp from you. It is painless, but certainly discomforting. <b>Your [pc.balls] " + (target.balls == 1 ? "has" : "have") + " shrunk!</b>");
					target.ballSizeRaw = target.tallness * Math.PI / 24;
				});
			}
			
			// Wrong cock type (changes all at once, no length change?). Should be some wrapper function to cut same code, but copy-paste is easier.
			var newCockColor:String = Foxfire.colorsMatching(target) ? target.lipColor : null;
			var slot:int;
			var toChange:int;
			// If normal avian body (requires genital slit):
			if (target.hasCock() && target.cockTotal() > target.cockTotal(GLOBAL.TYPE_AVIAN) && target.hasStatusEffect("Genital Slit") && !InCollection(target.legType, GLOBAL.TYPE_FELINE, GLOBAL.TYPE_EQUINE, GLOBAL.TYPE_NAGA))
			{
				options.push(function():*{
					toChange = 0;
					for (slot = 0; slot < target.cockTotal(); slot++)
						if (target.cocks[slot].cType != GLOBAL.TYPE_AVIAN && target.cockTypeUnlocked(slot, GLOBAL.TYPE_AVIAN)) toChange++;
					if (toChange == 0)
					{
						output("\n\n" + target.cockTypeLockedMessage());
						return;
					}
					output("\n\nYour [pc.cocks] throb" + (toChange == 1?"s":"") + ", streams of pre-cum erupt in waves from your cock-slit" + (toChange == 1?"":"s") + " as your " + (toChange == 1?"malehood":"dicks") + " begin to twist and morph in front of your eyes! The sensation nearly makes you explode in a gush of jizz as your ");
					output("cock" + (toChange == 1?"":"s") + " shift" + (toChange == 1?"s":"") + ", becoming long and thin, ending in a smooth tapered tip" + (toChange == 1?"":"s") + ", much like that of an avian. Able to slip into, and reach even the depths of the tightest of holes. <b>You now have" + (toChange == 1?" an":"") + " avian cock" + (toChange == 1?"":"s") + "!</b>");
					for (slot = 0; slot < target.cockTotal(); slot++)
						if (target.cocks[slot].cType != GLOBAL.TYPE_AVIAN && target.cockTypeUnlocked(slot, GLOBAL.TYPE_AVIAN)) {
							target.shiftCock(slot, GLOBAL.TYPE_AVIAN);
							if (newCockColor != null) target.cocks[slot].cockColor = newCockColor;
							
							if (GooCrotch != null && (kGAMECLASS.flags["AMBER_SEED_USED"] & FLAG_GOO_COCK) != FLAG_GOO_COCK) kGAMECLASS.flags["AMBER_SEED_USED"] |= FLAG_GOO_COCK;
						}
					target.orgasm();
				});
			}
			
			// If griffin:
			if (target.hasCock() && (target.cockTotal() > target.cockTotal(GLOBAL.TYPE_AVIAN) || target.totalKnots() < target.cockTotal()) && target.legType == GLOBAL.TYPE_FELINE)
			{
				options.push(function():*{
					toChange = 0;
					for (slot = 0; slot < target.cockTotal(); slot++)
						if (target.cocks[slot].cType != GLOBAL.TYPE_AVIAN && target.cockTypeUnlocked(slot, GLOBAL.TYPE_AVIAN) || !target.hasKnot(slot) && target.cockFlagsUnlocked(slot, GLOBAL.FLAG_KNOTTED) || target.cocks[slot].knotMultiplier <= 1 && target.knotMultiplierUnlocked(slot, 1.5)) toChange++;
					if (toChange == 0)
					{
						output("\n\n" + target.cockTypeLockedMessage());
						return;
					}
					output("\n\nYour [pc.cocks] throb" + (toChange == 1?"s":"") + ", streams of pre-cum erupt in waves from your cock-slit" + (toChange == 1?"":"s") + " as your " + (toChange == 1?"malehood":"dicks") + " begin to twist and morph in front of your eyes! The sensation nearly makes you explode in a gush of jizz as your ");
					output("dick" + (toChange == 1?"":"s") + " shift" + (toChange == 1?"s":"") + " to become slightly undulating with a tapered tip" + (toChange == 1?"":"s") + ", soft feline barbs forming to cover " + (toChange == 1?"its":"their") + " length" + (toChange == 1?"":"s") + ". Finally a thick canine-like knot" + (toChange == 1?"":"s") + " balloon" + (toChange == 1?"s":"") + " out at the base" + (toChange == 1?"":"s") + " of your " + (toChange == 1?"shaft":"multiple shafts") + ", completing the look. <b>You now have " + (toChange == 1?"a":"") + " chimerical griffin cock" + (toChange == 1?"":"s") + "!</b>");
					for (slot = 0; slot < target.cockTotal(); slot++)
						if (target.cocks[slot].cType != GLOBAL.TYPE_AVIAN && target.cockTypeUnlocked(slot, GLOBAL.TYPE_AVIAN) || !target.hasKnot(slot) && target.cockFlagsUnlocked(slot, GLOBAL.FLAG_KNOTTED) || target.cocks[slot].knotMultiplier <= 1 && target.knotMultiplierUnlocked(slot, 1.5)) {
							target.shiftCock(slot, GLOBAL.TYPE_AVIAN); // not actually sure... maybe canine would be better for griffin
							target.cocks[slot].cThicknessRatioRaw = 1.3;
							target.cocks[slot].knotMultiplier = 1.5;
							target.cocks[slot].addFlag(GLOBAL.FLAG_KNOTTED);
							target.cocks[slot].addFlag(GLOBAL.FLAG_NUBBY);
							target.cocks[slot].addFlag(GLOBAL.FLAG_SHEATHED);
							if (newCockColor != null) target.cocks[slot].cockColor = newCockColor;
							else target.cocks[slot].cockColor = "black";
							
							if (GooCrotch != null && (kGAMECLASS.flags["AMBER_SEED_USED"] & FLAG_GOO_COCK) != FLAG_GOO_COCK) kGAMECLASS.flags["AMBER_SEED_USED"] |= FLAG_GOO_COCK;
							if (GooCrotch != null && (kGAMECLASS.flags["AMBER_SEED_USED"] & FLAG_COCK_GRIFFIN) != FLAG_COCK_GRIFFIN) kGAMECLASS.flags["AMBER_SEED_USED"] |= FLAG_COCK_GRIFFIN;
						}
					target.orgasm();
				});
			}
			
			//If hippogriff:
			if (target.hasCock() && target.cockTotal() > target.cockTotal(GLOBAL.TYPE_EQUINE) && target.legType == GLOBAL.TYPE_EQUINE)
			{
				options.push(function():*{
					toChange = 0;
					for (slot = 0; slot < target.cockTotal(); slot++)
						if (target.cocks[slot].cType != GLOBAL.TYPE_EQUINE && target.cockTypeUnlocked(slot, GLOBAL.TYPE_EQUINE)) toChange++;
					if (toChange == 0)
					{
						output("\n\n" + target.cockTypeLockedMessage());
						return;
					}
					output("\n\nYour [pc.cocks] throb" + (toChange == 1?"s":"") + ", streams of pre-cum erupt in waves from your cock-slit" + (toChange == 1?"":"s") + " as your " + (toChange == 1?"malehood":"dicks") + " begin to twist and morph in front of your eyes! The sensation nearly makes you explode in a gush of jizz as your ");
					output("dick" + (toChange == 1?"":"s") + " grow" + (toChange == 1?"s":"") + " and swell" + (toChange == 1?"s":"") + " obscenely, becoming thick and veiny with" + (toChange == 1?" a":"") + " large flared head" + (toChange == 1?"":"s") + " that would look just at home on your standard issue stallion. <b>You now have " + (toChange == 1?"an":"") + " equine cock" + (toChange == 1?"":"s") + "!</b>");
					for (slot = 0; slot < target.cockTotal(); slot++)
						if (target.cocks[slot].cType != GLOBAL.TYPE_EQUINE && target.cockTypeUnlocked(slot, GLOBAL.TYPE_EQUINE)) {
							target.shiftCock(slot, GLOBAL.TYPE_EQUINE);
							if (newCockColor != null) target.cocks[slot].cockColor = newCockColor;
							else target.cocks[slot].cockColor = "black";
						}
					target.orgasm();
				});
			}
			
			//If quetzalcoatl (requires genital slit):
			if (target.hasCock() && target.hasStatusEffect("Genital Slit") && target.cockTotal() > target.cockTotal(GLOBAL.TYPE_SNAKE) && target.isNaga())
			{
				options.push(function():*{
					toChange = 0;
					for (slot = 0; slot < target.cockTotal(); slot++)
						if (target.cocks[slot].cType != GLOBAL.TYPE_SNAKE && target.cockTypeUnlocked(slot, GLOBAL.TYPE_SNAKE)) toChange++;
					if (toChange == 0)
					{
						output("\n\n" + target.cockTypeLockedMessage());
						return;
					}
					output("\n\nYour [pc.cocks] throb" + (toChange == 1?"s":"") + ", streams of pre-cum erupt in waves from your cock-slit" + (toChange == 1?"":"s") + " as your " + (toChange == 1?"malehood":"dicks") + " begin to twist and morph in front of your eyes! The sensation nearly makes you explode in a gush of jizz as your ");
					output("dick" + (toChange == 1?"":"s") + " shift" + (toChange == 1?"s":""));
					if (newCockColor == null) output(" into a purple tone,");
					output(" becoming" + (toChange == 1?" a":"") + " bulbous reptilian shaft" + (toChange == 1?"":"s") + " complete with" + (toChange == 1?" a":"") + " smooth tapered tip" + (toChange == 1?"":"s") + ". <b>You now have " + (toChange == 1?"a":"") + " naga cock" + (toChange == 1?"":"s") + "!</b>");
					for (slot = 0; slot < target.cockTotal(); slot++)
						if (target.cocks[slot].cType != GLOBAL.TYPE_SNAKE && target.cockTypeUnlocked(slot, GLOBAL.TYPE_SNAKE)) {
							target.shiftCock(slot, GLOBAL.TYPE_SNAKE);
							if (newCockColor != null) target.cocks[slot].cockColor = newCockColor;
						}
					target.orgasm();
				});
			}
			
			// Vags. Shameless copy-paste all way through.
			var newVagColor:String = Foxfire.colorsMatching(target) ? target.lipColor : null;
			// If normal avian body:
			if (target.hasVagina() && target.vaginaTotal() > target.vaginaTotal(GLOBAL.TYPE_AVIAN) && !InCollection(target.legType, GLOBAL.TYPE_FELINE, GLOBAL.TYPE_EQUINE, GLOBAL.TYPE_NAGA))
			{
				options.push(function():*{
					toChange = 0;
					for (slot = 0; slot < target.vaginaTotal(); slot++)
						if (target.vaginas[slot].type != GLOBAL.TYPE_AVIAN && target.vaginaTypeUnlocked(slot, GLOBAL.TYPE_AVIAN)) toChange++;
					if (toChange == 0)
					{
						output("\n\n" + target.vaginaTypeLockedMessage());
						return;
					}
					output("\n\nYou feel a hot sensation washing over your nether region, causing you to clench your thighs tightly together and moan out in pleasure, as your [pc.vaginas] erupt" + (toChange == 1?"s":"") + " in a sudden gush of [pc.girlCumNoun]! … Wait. Did you just have a orgasm? You reach down to cup [pc.oneVagina] with a hand, only to realize it has changed! Upon closer inspection you discover ");
					output("that your vagina" + (toChange == 1?"":"s") + " now resemble" + (toChange == 1?"s":"") + " a bird’s cloaca, with thin exterior lips around a mostly featureless opening");
					if (target.hasFur() || target.hasFeathers()) {
						if (target.hasFeathers() && target.hasPartFur("leg")) output(", that is barely visible under your fur"); // for chimerical birds
						else output(", that is barely visible under your " + target.skinFurScales(false,false,false,true));
					}
					output(". <b>You now have " + (toChange == 1?"an":"") + " avian vagina" + (toChange == 1?"":"s") + "!</b>");
					for (slot = 0; slot < target.vaginaTotal(); slot++)
						if (target.vaginas[slot].type != GLOBAL.TYPE_AVIAN && target.vaginaTypeUnlocked(slot, GLOBAL.TYPE_AVIAN)) {
							target.shiftVagina(slot, GLOBAL.TYPE_AVIAN);
							if (newVagColor != null) target.vaginas[slot].vaginaColor = newVagColor;
							
							if (GooCrotch != null && (kGAMECLASS.flags["AMBER_SEED_USED"] & FLAG_GOO_CUNT) != FLAG_GOO_CUNT) kGAMECLASS.flags["AMBER_SEED_USED"] |= FLAG_GOO_CUNT;
						}
					if (target.elasticity < (target.hasPerk("Elasticity") ? 3 : 2)) {
						target.elasticity = (target.hasPerk("Elasticity") ? 3 : 2);
						output("\n\nYour new vagina" + (toChange == 1?"":"s") + " seem" + (toChange == 1?"s":"") + " to be specially designed for oviposition, being both tight and stretchy at the same time. <b>Your elasticity has considerably increased!</b>");
					}
					target.orgasm();
				});
			}
			
			//If griffin:
			if (target.hasVagina() && target.vaginaTotal() > target.vaginaTotal(GLOBAL.TYPE_FELINE) && target.legType == GLOBAL.TYPE_FELINE)
			{
				options.push(function():*{
					toChange = 0;
					for (slot = 0; slot < target.vaginaTotal(); slot++)
						if (target.vaginas[slot].type != GLOBAL.TYPE_FELINE && target.vaginaTypeUnlocked(slot, GLOBAL.TYPE_FELINE)) toChange++;
					if (toChange == 0)
					{
						output("\n\n" + target.vaginaTypeLockedMessage());
						return;
					}
					output("\n\nYou feel a hot sensation washing over your nether region, causing you to clench your thighs tightly together and moan out in pleasure, as your [pc.vaginas] erupt" + (toChange == 1?"s":"") + " in a sudden gush of [pc.girlCumNoun]! … Wait. Did you just have a orgasm? You reach down to cup [pc.oneVagina] with a hand, only to realize it has changed! Upon closer inspection you discover ");
					output("that you now have " + (toChange == 1?"an":num2Text(toChange)) + " almost featureless hole" + (toChange == 1?"":"s") + " with a vestigial labia");
					if (target.hasFur() || target.hasFeathers()) {
						if (target.hasFeathers() && target.hasPartFur("leg")) output(" that can be easily hidden under your fur");
						else output(" that can be easily hidden under your " + target.skinFurScales(false,false,false,true));
					}
					output(". <b>You now have " + (toChange == 1?"a":"") + " feline vagina" + (toChange == 1?"":"s") + "!</b>");
					for (slot = 0; slot < target.vaginaTotal(); slot++)
						if (target.vaginas[slot].type != GLOBAL.TYPE_FELINE && target.vaginaTypeUnlocked(slot, GLOBAL.TYPE_FELINE)) {
							target.shiftVagina(slot, GLOBAL.TYPE_FELINE);
							if (newVagColor != null) target.vaginas[slot].vaginaColor = newVagColor;
						}
					if (target.elasticity < (target.hasPerk("Elasticity") ? 3 : 2)) {
						target.elasticity = (target.hasPerk("Elasticity") ? 3 : 2);
						output("\n\nYour new vagina" + (toChange == 1?"":"s") + " seem" + (toChange == 1?"s":"") + " to be specially designed for oviposition, being both tight and stretchy at the same time. <b>Your elasticity has considerably increased!</b>");
					}
					target.orgasm();
				});
			}
			
			//If hippogriff:
			if (target.hasVagina() && target.vaginaTotal() > target.vaginaTotal(GLOBAL.TYPE_EQUINE) && target.legType == GLOBAL.TYPE_EQUINE)
			{
				options.push(function():*{
					toChange = 0;
					for (slot = 0; slot < target.vaginaTotal(); slot++)
						if (target.vaginas[slot].type != GLOBAL.TYPE_EQUINE && target.vaginaTypeUnlocked(slot, GLOBAL.TYPE_EQUINE)) toChange++;
					if (toChange == 0)
					{
						output("\n\n" + target.vaginaTypeLockedMessage());
						return;
					}
					if (newVagColor == null) newVagColor = "black";
					output("\n\nYou feel a hot sensation washing over your nether region, causing you to clench your thighs tightly together and moan out in pleasure, as your [pc.vaginas] erupt" + (toChange == 1?"s":"") + " in a sudden gush of [pc.girlCumNoun]! … Wait. Did you just have a orgasm? You reach down to cup [pc.oneVagina] with a hand, only to realize it has changed! Upon closer inspection you discover ");
					output("that your puss" + (toChange == 1?"y is":"ies are") + " now fat and swollen, with thick, " + newVagColor + " rubbery lips that feel leathery to the touch and a triangular clit. Giving a distinct equine bent to it. <b>You now have " + (toChange == 1?"an":"") + " equine vagina" + (toChange == 1?"":"s") + "!</b>");
					for (slot = 0; slot < target.vaginaTotal(); slot++)
						if (target.vaginas[slot].type != GLOBAL.TYPE_EQUINE && target.vaginaTypeUnlocked(slot, GLOBAL.TYPE_EQUINE)) {
							target.shiftVagina(slot, GLOBAL.TYPE_EQUINE);
							target.vaginas[slot].vaginaColor = newVagColor;
						}
					if (target.elasticity < (target.hasPerk("Elasticity") ? 3 : 2)) {
						target.elasticity = (target.hasPerk("Elasticity") ? 3 : 2);
						output("\n\nYour new vagina" + (toChange == 1?"":"s") + " seem" + (toChange == 1?"s":"") + " to be specially designed for oviposition, being both tight and stretchy at the same time. <b>Your elasticity has considerably increased!</b>");
					}
					target.orgasm();
				});
			}
			
			//If quetzalcoatl:
			if (target.hasVagina() && target.vaginaTotal() > target.vaginaTotal(GLOBAL.TYPE_SNAKE) && target.isNaga())
			{
				options.push(function():*{
					toChange = 0;
					for (slot = 0; slot < target.vaginaTotal(); slot++)
						if (target.vaginas[slot].type != GLOBAL.TYPE_SNAKE && target.vaginaTypeUnlocked(slot, GLOBAL.TYPE_SNAKE)) toChange++;
					if (toChange == 0)
					{
						output("\n\n" + target.vaginaTypeLockedMessage());
						return;
					}
					output("\n\nYou feel a hot sensation washing over your nether region, causing you to clench your thighs tightly together and moan out in pleasure, as your [pc.vaginas] erupt" + (toChange == 1?"s":"") + " in a sudden gush of [pc.girlCumNoun]! … Wait. Did you just have a orgasm? You reach down to cup [pc.oneVagina] with a hand, only to realize it has changed! Upon closer inspection you discover ");
					output("that you now possess " + (toChange == 1?"a":num2Text(toChange)) + " modest reptilian slit" + (toChange == 1?"s":"") + ", with narrow lips around a mostly featureless opening");
					if (target.hasLegFlag(GLOBAL.FLAG_SCALED)) output(", surrounded by soft scales");
					output(". <b>You now have " + (toChange == 1?"a":"") + " reptilian vagina" + (toChange == 1?"":"s") + "!</b>");
					for (slot = 0; slot < target.vaginaTotal(); slot++)
						if (target.vaginas[slot].type != GLOBAL.TYPE_SNAKE && target.vaginaTypeUnlocked(slot, GLOBAL.TYPE_SNAKE)) {
							target.shiftVagina(slot, GLOBAL.TYPE_SNAKE);
							if (newVagColor != null) target.vaginas[slot].vaginaColor = newVagColor;
						}
					if (target.elasticity < (target.hasPerk("Elasticity") ? 3 : 2)) {
						target.elasticity = (target.hasPerk("Elasticity") ? 3 : 2);
						output("\n\nYour new vagina" + (toChange == 1?"":"s") + " seem" + (toChange == 1?"s":"") + " to be specially designed for oviposition, being both tight and stretchy at the same time. <b>Your elasticity has considerably increased!</b>");
					}
					target.orgasm();
				});
			}
			
			// Has non-flat breasts, no lactation:
			if (target.hasBreasts() && !target.canLactate() && (target.hasFeathers() || target.hasScales()))
			{
				options.push(function():*{
					if (!target.breastRatingUnlocked(0, 0)) {
						output("\n\n" + target.breastRatingLockedMessage());
						return;
					}
					var newColor:String = Foxfire.colorsMatching(target) ? target.lipColor : target.skinTone;
					var prevSize:Number = target.biggestTitSize();
					
					if (target.nippleColorUnlocked(target.skinTone)) target.nippleColor = target.skinTone;
					if (target.nippleLengthRatioUnlocked(1) && target.nippleLengthRatio > 1) target.nippleLengthRatio = 1;
					if (target.nipplesPerBreastUnlocked(1) && target.nipplesPerBreast > 1) target.nipplesPerBreast = 1;
					target.breastRows = [new BreastRowClass()];
					if (target.bRows() == 1 && target.nippleTypeUnlocked(0, GLOBAL.NIPPLE_TYPE_FLAT)) target.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_FLAT;
					
					output("\n\nYou feel a sudden sloshing sensation inside of your [pc.fullChest], that is quickly replaced with a mild feeling of nausea, as your mass is being redistributed around your body. In a matter of seconds, only a set of ");
					kGAMECLASS.clearList();
					if (target.hasFlatNipples()) kGAMECLASS.addToList("flat");
					if (target.nippleColor == target.skinTone) kGAMECLASS.addToList("flesh-toned");
					kGAMECLASS.addToList("yet still sensitive");
					output(kGAMECLASS.formatList() + " nipples reminds you of your mammalian origin.");
					
					if (prevSize >= 8) output(" You wonder if this is like how Atlas felt when the weight of the sky was lifted from his back...");
					else if (prevSize >= 4) output(" Oh... You feel much lighter now with your center of mass is in the right place.");
					output(" <b>Your chest is now completely flat!</b>");
					// well, you actually should have keel bone now... but it would be overcomplication
				});
			}
			
			// Lactation removal. Can even remove permanent lactation as rare effect.
			if (target.canLactate() && (rand(5) == 0 || !target.hasMilkPerk()))
			{
				options.push(function():*{
					if (target.hasPerk("Mega Milk") || target.hasPerk("Milk Fountain") || target.hasPerk("Honeypot") || target.hasPerk("Milky") && target.hasPerk("Treated Milk")) {
						output("\n\nYou’d thought that nothing could stop your lactation, but you were wrong! It seems you’ve finally dried up. Part of you feel relieved.");
						target.removePerk("Mega Milk");
						target.removePerk("Milk Fountain");
						target.removePerk("Honeypot");
						if (target.hasPerk("Milky")) target.removePerk("Treated Milk");
					} else output("\n\nYou give your [pc.nipples] an experimental squeeze, only to discover that your mammaries has dried up! You guess that birds do not really lactate, anyway. Oh well...");
					
					target.milkMultiplier = 0;
					target.milkFullness = 0;
				});
			}
			
			var thickness:Number = 10;
			var tone:Number = 70;
			var both:Boolean = false;
			
			var thicknessChange:Function = function():*{
					if (!target.thicknessUnlocked(thickness)) {
						output("\n\n" + target.thicknessLockedMessage());
						both = false;
						return;
					}
					
					if (target.thickness - thickness >= 20)
					{
						output("\n\nYou feel like your ");
						if (target.tone <= 40) output("fat deposits");
						else output("muscles");
						output(" has all of sudden been turned into snakes, or something of that nature. Your flesh begins to flow awkwardly under your [pc.skinNoun]. The sensation fades almost as soon as it begins, leaving you somehow with an extremely light body, much better suited for flight. You can only begin to wonder where all your mass has gone.");
					} else output("\n\nAfter some brief shifting underneath your [pc.skinNoun], you are left with a considerably more lithe build.");
					target.thickness = thickness;
				};
			
			var toneChange:Function = function():*{
					// Squishy skin blocks it, not gel body.
					//if (!target.toneUnlocked(tone)) {
						//output("\n\n" + target.toneLockedMessage());
						//return;
					//}
					
					if (both) output("\n\nAfter feeling up your changed body for a moment, you discover that it is now tightly bound in sleek yet strong muscles.");
					else if (target.tone - tone >= 20) output("\n\nYou feel strange sensation of something shifting beneath your [pc.skinNoun], flowing through your body. When it finally settles down, you end up finding yourself covered in powerful muscles that are sleek yet taut.");
					else output("\n\nYour muscles are like taut strings; you can almost hear them vibrating. Feeling yourself up, you discover that they are now notably more defined.");
					target.tone = tone;
					
					if ((kGAMECLASS.flags["AMBER_SEED_USED"] & FLAG_GOO_TONE) != FLAG_GOO_TONE && GelBody != null) kGAMECLASS.flags["AMBER_SEED_USED"] |= FLAG_GOO_TONE;
				};
			
			
			if (target.thickness > thickness && target.tone < tone)
			{
				options.push(function():*{
					both = true;
					thicknessChange();
					toneChange();
				});
			}
			else if (target.thickness > thickness) options.push(thicknessChange);
			else if (target.tone < tone) options.push(toneChange);
			
			// buttRating > threshold, low thickness, high tone:
			var maxButt:Number = 0;
			if (target.legType == GLOBAL.TYPE_FELINE || target.isNaga()) maxButt = 3;
			if (target.legType == GLOBAL.TYPE_EQUINE) maxButt = 7;
			if (target.thickness <= thickness && target.tone >= tone && target.buttRatingRaw > maxButt)
			{
				options.push(function():*{
					if (!target.buttRatingUnlocked(maxButt)) {
						output("\n\n" + target.buttRatingLockedMessage());
						return;
					}
					
					output("\n\nYou feel your [pc.ass] sagging down");
					if (target.buttRating() > 10) output(" even more than usual");
					output(" before being absorbed into your body. In a matter of seconds, you are left");
					if (maxButt == 0) output(" without nearly any bottom padding at all! It certainly does well for your aerodynamics, but you will definitely have to invest in a softer seat.");
					else if (maxButt < 7) output(" with a firm, tight butt, perfectly matching your lean body.");
					else output(" with a shapely, yet firm ass.");
					target.buttRating(maxButt, true);
				});
			}
			
			// hipRating < threshold, tight butt, low thickness, high tone:
			var minHips:Number = 15;
			if (target.legType == GLOBAL.TYPE_FELINE || target.isNaga() || target.legType == GLOBAL.TYPE_EQUINE) minHips = 10;
			if (target.hipRatingRaw < minHips)
			{
				options.push(function():*{
					if (!target.hipRatingUnlocked(minHips)) {
						output("\n\n" + target.hipRatingLockedMessage());
						return;
					}
					
					output("\n\nYou do not feel the change, but you can definitely hear it. With a sickening crackling your [pc.hips] bloom wider until they have a distinct broodmother shape, obviously preparing you to push out something big.");
					if (target.hasVagina()) output(" You shudder in a strange mixture of anticipation and doubtful anxiety.");
					else if (target.hasCock() && target.isMasculine()) output(" You are not sure how it applies to males, though.");
					else output(" You vaguely ponder if to get a change in the lower department to make proper use of this addition...");
					target.hipRating(minHips, true);
				});
			}
			
			// no "Hollow Bones" perk, low thickness, high tone, avian limbs, wings, not goo body:
			if (!target.hasPerk("Hollow Bones") && target.thickness <= 20 && target.tone >= 60 && GelBody == null && (target.hasWings(GLOBAL.TYPE_AVIAN) || target.hasWings(GLOBAL.TYPE_DOVE)) && InCollection(target.legType, GLOBAL.TYPE_AVIAN, GLOBAL.TYPE_FELINE, GLOBAL.TYPE_EQUINE) && target.armType == GLOBAL.TYPE_AVIAN && target.avianScore() >= 4)
			{
				options.push(function():*{
					output("\n\nYou feel somehow... Weightless. You were already very light, but this is something on a whole different level. After scanning yourself with your codex, you discover that your bones are now almost hollow, with a honeycomb structure keeping them strong yet light. Flying will be much easier with a body like this!");
					output("\n\n(<b>Perk Gained: Hollow Bones</b> - Your body weighs less than it should.)");
					// oviposition perk: v1 - value to substract from nBMI, which is 20-30 normally.
					target.createPerk("Hollow Bones", 10, 0, 0, 0, "Your body weighs less than it should.");
				});
			}
			
			// No "Oviposition" perk, not sterile, has OviliumEggPregnancy, high avian score
			if (!target.hasPerk("Oviposition") && target.fertility() > 0 && target.hasPregnancyOfType("OviliumEggPregnancy") && target.avianScore() >= 4)
			{
				options.push(function():*{
					// not exactly fitting - you are already egg-pregnant here and know it
					output("\n\nYour Codex beeps, notifying you about some hidden changes to your womb");
					if(target.vaginas.length > 1) output("s");
					output(". According to it, you are now... oviparous. Better get the hen house ready -- It seems your body is so used to being pregnant with bird-like eggs that you’ve become an egg-laying mother yourself!");
					output("\n\n(<b>Perk Gained: Oviposition</b> - Causes you to regularly lay eggs when not otherwise pregnant.)");
					// oviposition perk: v1 - times acted, v4 - last known pregnancy to prevent permapreg
					target.createPerk("Oviposition", 0, 0, 0, kGAMECLASS.GetGameTimestamp(), "Causes you to regularly lay eggs when not otherwise pregnant.");
				});
			}
			
			// execute one possible TF
			if (options.length > 0) RandomInCollection(options)();
			
			// set back goo body status if present
			if (GooCrotch != null) target.statusEffects.push(GooCrotch);
			if (GelBody != null) target.statusEffects.push(GelBody);
			
			return options.length > 0;
		}
		
		public static function ovipositionUpdate(target:Creature, tMinutes:int):void
		{
			if (target.hasPerk("Oviposition") && target.hasVagina())
			{
				var time:Number = kGAMECLASS.GetGameTimestamp() + tMinutes; // actually, this should be done in iterations to be smooth, but it would be overcomplication
				if (target.hasWombPregnancy())
				{
					target.setPerkValue("Oviposition", 4, time); // remember last preg time here to not knock up immediately after birth
				}
				else if (target.fertility() > 0 && time > (target.perkv4("Oviposition") + ((30 * 24 * 60) / Math.max(target.fertility(), 0.5))))
				{
					// mostly Ovilium copy-paste
					var selWomb:Array = [];
					var x:int = 0;
					
					for(x = 0; x < target.vaginas.length; x++)
					{
						if (!target.isPregnant(x)) selWomb.push(x);
					}
					
					if(selWomb.length <= 0) return;
					
					var ppOvilium:PregnancyPlaceholder = new PregnancyPlaceholder();
					ppOvilium.impregnationType = "OviliumEggPregnancy";
					ppOvilium.createStatusEffect("Ovilium Effect");
					target.loadInCunt(ppOvilium, selWomb[rand(selWomb.length)]);
					
					//output("\n\nDebug2: " + target.perkv4("Oviposition") + " / " + kGAMECLASS.GetGameTimestamp() + " / " + (30 * 24 * 60 / target.fertility()));
					if (target.hasPregnancyOfType("OviliumEggPregnancy") && target == kGAMECLASS.pc) {
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive", tMinutes) + " <b>You get the feeling that eggs have begun to form inside you. You wonder how long it will be before they start to show?</b>";
						target.addPerkValue("Oviposition", 1, 1); //Count times eggpregged this way in perk.
						target.setPerkValue("Oviposition", 4, time); // remember last preg time here
					}
					//output("\n\nDebug2: " + target.perkv4("Oviposition") + " / " + kGAMECLASS.GetGameTimestamp() + " / " + (30 * 24 * 60 / target.fertility()));
				}
			}
		}
	}
}
