package classes.Items.Transformatives
{
	import classes.BreastRowClass;
	import classes.Items.Miscellaneous.ImmunoBooster;
	import classes.ItemSlotClass;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GLOBAL;
	import classes.Util.*;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.*;

	/**
	 * Vulpine transformative.
	 * 
	 * @author Etis & Deus Ex Machina
	 * 
	 * Sal Valia and Ura also participated.
	 */
	public class Foxfire extends ItemSlotClass
	{
		public function Foxfire(dataObject:Object=null)
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.POTION;
			//Used on inventory buttons
			this.shortName = "Foxfire";
			//Regular name
			this.longName = "a vial labeled Foxfire";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a vial of Foxfire";
			//Displayed on tooltips during mouseovers
			this.tooltip = "After the questionable success of Catnip, Stellar Furnace worked hard on developing an affordable alternative in their line of transformation solutions. This vial of hair dye is actually a rather unique genetic modification, created with ancient technology of symbiotic fungi rather than modern microsurgeons. After application it takes root, slowly but reliably transforming its host towards an animalistic vulpine form resembling that of an iconic red fox.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 6000; // LeithaCharm effectively have 8750 credits cost and is reusable...
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.combatUsable = false;
			this.targetsSelf = true;
			
			this.addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);
			
			this.version = this._latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			if (target is PlayerCharacter)
			{
				return useMenu(target, Foxfire);
			}
			//Not player!
			else
			{
				output(target.capitalA + target.short + " doesn't seem interested in using this item...");
			}
			return false;
		}
		
		public static function useMenu(target:Creature, type:Class):Boolean
		{
			//author("Etis & DEM & Val");
			
			output("You grab the vial of Foxfire and read the instructions.");
			
			output("\n<i>");
			output("\n<b>*</b> For use on head only. No hair required!");
			output("\n<b>*</b> Works with most naturally occurring skin types. Warning: effect on metamorphic species is highly unpredictable. Warranty void if used on rahn, galotians, or if skin is heavily altered by another transformative.");
			output("\n<b>*</b> Applying another dose while already under this product's effect will produce no additional results.");
			output("\n<b>*</b> This product's effects are permanent, but can be easily canceled out with the use of our esteemed bio-cleansing product, Immuno-Booster! You will find one dose enclosed in the product package; alternatively, they are available for purchase at most pharmacies.");
			output("\n<b>* Warning:</b> while safe for the host, it will likely conflict with any other symbiotic or parasitic lifeforms currently attached to you. If you have any important symbiotes, please refrain from using this product.");
			output("\n<b>*</b> Documented side effect: Bioluminescence (Disappears after use of Immuno-Booster. If signs of luminescence remains, contact our customer support for assistance.)");
			output("</i>");
			
			if (target.hasStatusEffect("Foxfire"))
			{
				var frost:Boolean = target.statusEffectv1("Foxfire") == 1;
				output("\n\n<b>You are already under effect of " + (frost ? "Frostfire" : "Foxfire") + ", so using another would be a waste.</b>");
				return false;
			}
			
			clearMenu();
			addButton(0, "Use", onHead, [target, type], "Use", "Use it according to the instructions.");
			if (target.hasTail()) addButton(1, "On Tail", onTail, [target, type], "Use On Tail", "Use it on your [pc.tails].");
			else addButton(1, "On Tail", onTail, [target, type], "Use On Tail", "Use it on a place where a tail would normally grow. What could go wrong? You want that glorious fluffy tail ASAP!");
			// maybe on crotch to grow tentacle cluster?
			addButton(4, "Don't Use", kGAMECLASS.generalInventoryMenu, undefined, "Don't Use", "You decide to put the vial back into your inventory.");
			return true;
		}
		
		/**
		 * Initial application, head route.
		 */
		public static function onHead(args:Array):void
		{
			var target:Creature = args[0];
			var type:Class = args[1];
			var frost:Boolean = type == Frostfire;
			if(!kGAMECLASS.infiniteItems()) target.destroyItemByType(type);
			clearOutput();
			
			if (!target.hasHair())
			{
				if (target.skinType == GLOBAL.SKIN_TYPE_GOO)
				{
					output("You apply the solution onto your gooey head according to instructions. Its compatibility with galotean biology is questionable, but you are still eager to try it.");
				}
				else if (target.skinType == GLOBAL.SKIN_TYPE_LATEX)
				{
					output("You apply the solution onto your shiny, latex-like scalp according to instructions. The results will be questionable at best, but what's the worst that could happen?");
				}
				else if (target.hasFur() || target.hasScales() || target.hasFeathers())
				{
					output("You massage the solution into the " + target.skinNoun(false, true) + " on your head according to instructions. Now all you have to do is wait.");
				}
				else
				{
					output("You apply the solution onto your bald scalp according to instructions. Now all you have to do is wait.");
				}
			}
			else if (target.hasStatusEffect("Latex Hair"))
			{
				output("You apply the solution onto your latex " + target.hairNoun() + " according to instructions. The results will be questionable at best, but what's the worst that could happen?");
			}
			else if (target.hairType == GLOBAL.HAIR_TYPE_REGULAR || target.hairType == GLOBAL.HAIR_TYPE_TRANSPARENT)
			{
				output("You massage the solution into your " + target.hairNoun() + " according to instructions. Now all you have to do is wait.");
			}
			else if (target.hairType == GLOBAL.HAIR_TYPE_FEATHERS)
			{
				output("You massage the solution into your plumage according to instructions. Now all you have to do is wait.");
			}
			else if (target.hairType == GLOBAL.HAIR_TYPE_QUILLS)
			{
				output("You massage the solution into your quills according to instructions. Now all you have to do is wait.");
			}
			else if (target.hairType == GLOBAL.HAIR_TYPE_TENTACLES)
			{
				output("You massage the solution into your head-tentacles according to instructions. You have no idea if it will work.");
			}
			else if (target.hairType == GLOBAL.HAIR_TYPE_GOO)
			{
				output("You massage the solution into your gooey pseudo-hair according to instructions. Its compatibility with galotian biology is questionable, but you are still eager to try it.");
			}
			else
			{
				output("You massage the solution into your " + target.hairNoun() + " according to instructions. Now all you have to do is wait.");
			}
			
			target.createStatusEffect("Foxfire", frost ? 1 : 0, 0);
			
			output("\n\n");
			kGAMECLASS.itemScreen = kGAMECLASS.generalInventoryMenu;
			kGAMECLASS.lootScreen = kGAMECLASS.generalInventoryMenu;
			kGAMECLASS.useItemFunction = kGAMECLASS.generalInventoryMenu;
			kGAMECLASS.itemCollect([new ImmunoBooster()]);
		}
		
		/**
		 * Initial application, head route.
		 */
		public static function onTail(args:Array):void
		{
			var target:Creature = args[0];
			var type:Class = args[1];
			var frost:Boolean = type == Frostfire;
			if(!kGAMECLASS.infiniteItems()) target.destroyItemByType(type);
			clearOutput();
			
			if (target.hasTail())
			{
				output("You apply the solution onto your " + target.tailsDescript() + ". The instructions mentioned nothing about tail application, but what's the worst that could happen?");
			}
			else
			{
				output("You apply the solution onto your " + target.buttDescript() + ", focusing on the area around your tailbone. You have no idea if this is going to work.");
			}
			
			target.createStatusEffect("Foxfire", frost ? 1 : 0, 1);
			
			output("\n\n");
			kGAMECLASS.itemScreen = kGAMECLASS.generalInventoryMenu;
			kGAMECLASS.lootScreen = kGAMECLASS.generalInventoryMenu;
			kGAMECLASS.useItemFunction = kGAMECLASS.generalInventoryMenu;
			kGAMECLASS.itemCollect([new ImmunoBooster()]);
		}
		
		
		/**
		 * Evoke periodic effect task. This function is used for both foxfire and frostfire.
		 * 
		 * Effect params:
		 * 1: type, 0 = foxfire, 1 = frostfire
		 * 2: place, 0 = head, 1 = tail
		 * 3: unused
		 * 4: timer
		 */
		public static function attemptTF(target:Creature):void
		{
			if (!target.hasStatusEffect("Foxfire")) return;
			
			var frost:Boolean = target.statusEffectv1("Foxfire") == 1;
			var place:int = target.statusEffectv2("Foxfire");
			
			if (tfGenitals(target)) return; // genitals are unstaged and are not actually gating other TFs, since their Tfs only procs with 50% chance even there are something possible.
			
			if (tfStage1(target)) // basic kemonomimi stage - ears and tail
			{
				if (place == 0 || place == 1 && tfStage2(target)) // optional kitsune kemonomimi stage - continue growing tails
					tfStage3(target); // fox-morph stage
			}
		}
		
		/**
		 * genitals are unstaged
		 * 
		 * return true if something changed
		 */
		private static function tfGenitals(target:Creature):Boolean
		{
			var options:/*Function*/Array = [];
			
			if (target.cockTotal() > target.cockTotal(GLOBAL.TYPE_VULPINE))
			{
				for (var i:int = 0; i < target.cockTotal(); i++) 
				{
					if (target.cocks[i].cType == GLOBAL.TYPE_CANINE)
					{ // since canine ones are basically the same vulpine, just silently change type
						target.cocks[i].cType = GLOBAL.TYPE_VULPINE;
					}
					
					if (target.cocks[i].cType == GLOBAL.TYPE_VULPINE && 
						(!target.hasCockFlag(GLOBAL.FLAG_KNOTTED, i) && target.cockFlagsUnlocked(i, GLOBAL.FLAG_KNOTTED)
						|| !target.hasCockFlag(GLOBAL.FLAG_TAPERED, i) && target.cockFlagsUnlocked(i, GLOBAL.FLAG_TAPERED)
						|| !target.hasCockFlag(GLOBAL.FLAG_SHEATHED, i) && target.cockFlagsUnlocked(i, GLOBAL.FLAG_SHEATHED)
						|| target.cocks[i].knotMultiplier <= 1 && target.knotMultiplierUnlocked(i, 1.25)))
					{
						options.push(function():*{
							// Here are fixing of somehow missing flags on already doggie one. Like ones on that ausars.
							if (!target.cocks[i].hasFlag(GLOBAL.FLAG_SHEATHED) && target.cockFlagsUnlocked(i, GLOBAL.FLAG_SHEATHED))
							{
								kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " You feel a light tug at the base of your " + target.cockDescript(i) + ", followed by something sliding up and over your shaft. A quick look tells you that an animalistic sheath has formed, bringing your cock to a standard canine form. <b>Your cock now has a canine-sheath!</b>";
								target.cocks[i].addFlag(GLOBAL.FLAG_SHEATHED);
							}
							else if (!target.cocks[i].hasFlag(GLOBAL.FLAG_KNOTTED) && target.cockFlagsUnlocked(i, GLOBAL.FLAG_KNOTTED) || target.cocks[i].knotMultiplier <= 1 && target.knotMultiplierUnlocked(i, 1.25))
							{
								kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " You feel a bulging pressure near the base of your " + target.cockDescript(i) + ", as a vulpine knot begins to form. <b>Your cock is now knotted!</b>";
								target.cocks[i].addFlag(GLOBAL.FLAG_KNOTTED);
								target.cocks[i].knotMultiplier = 1.25;
							}
							else if (target.cocks[i].knotMultiplier < 1.25 && target.knotMultiplierUnlocked(i, 1.25))
							{
								kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Another feeling of pressure at the base of your " + target.cockDescript(i) + " tells you that the bulk of your knot is growing to a respectible bulge. <b>Your cock-knot has grown!</b>";
								target.cocks[i].knotMultiplier = 1.25;
							}
							else if (!target.cocks[i].hasFlag(GLOBAL.FLAG_TAPERED) && target.cockFlagsUnlocked(i, GLOBAL.FLAG_TAPERED))
							{
								kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your " + target.cockDescript(i) + " grows sensitive all of a sudden. As you look down to determine the cause, you catch sight of your cock thinning slightly near the tip, and quickly begins tapering towards the end, like that of a typical fox's member. <b>Your cock is now tapered!</b>";
								target.cocks[i].delFlag(GLOBAL.FLAG_FLARED);
								target.cocks[i].delFlag(GLOBAL.FLAG_BLUNT);
								target.cocks[i].delFlag(GLOBAL.FLAG_DOUBLE_HEADED);
								target.cocks[i].addFlag(GLOBAL.FLAG_TAPERED);
							}
						});
						break;
					}
					else if (target.cocks[i].cType != GLOBAL.TYPE_VULPINE && target.cockTypeUnlocked(i, GLOBAL.TYPE_VULPINE))
					{
						options.push(function():*{
							var newColor:String = colorsMatching(target) ? target.lipColor : "red";
							
							kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your " + target.cockDescript(i) + " throbs suddenly ";
							
							if (target.hasCockFlag(GLOBAL.FLAG_SHEATHED, i)) kGAMECLASS.eventBuffer += "in it's sheath";
							else if (target.hasStatusEffect("Genital Slit")) kGAMECLASS.eventBuffer += "in it's slit";
							else if (!target.isCrotchExposed()) kGAMECLASS.eventBuffer += "beneath your " + target.lowerGarmentDescript();
							else if(target.legCount == 1) kGAMECLASS.eventBuffer += "on your " + target.legs();
							else kGAMECLASS.eventBuffer += "between your " + target.legs();
							
							kGAMECLASS.eventBuffer += " and begins to transform, drooling a river of pre from its engorged slit. You double over in a sick twist of pain and pleasure";
							
							if(target.cocks[i].cockColor.indexOf(newColor) == -1)
								kGAMECLASS.eventBuffer += " as the flesh of your cock shifts color to become " + newColor;
							if(!target.hasCockFlag(GLOBAL.FLAG_TAPERED, i))
								kGAMECLASS.eventBuffer += ". The skin melding strangely into a long, pointed shape";
							if(!target.hasCockFlag(GLOBAL.FLAG_KNOTTED, i))
								kGAMECLASS.eventBuffer += ". You feel a bulging pressure near the base of your cock as a vulpine knot begins to form";
							if (!target.hasCockFlag(GLOBAL.FLAG_SHEATHED, i) && !target.hasStatusEffect("Genital Slit"))
								kGAMECLASS.eventBuffer += ". Finally, an animalistic sheath begins forming around the base of you member, tightening and pulling your cock inside its depths";
							
							kGAMECLASS.eventBuffer += ". You spend a few moments collecting yourself, cleaning the spunk off <b>your new fox pecker!</b>";
							
							target.shiftCock(i, GLOBAL.TYPE_VULPINE);
							target.cocks[i].cockColor = newColor;
						});
						break;
					}
				}
			}
			
			var maxSizeBalls:Number = target.tallness * Math.PI / (6 * target.balls);
			if (target.isTaur()) maxSizeBalls *= 2;
			var newSizeBalls:Number = Math.max(target.ballSizeRaw / 2, maxSizeBalls)
			if (target.balls > 0 && target.ballSizeRaw > maxSizeBalls && target.ballSizeUnlocked(newSizeBalls))
			{ // Ballz down, this is not a tanuki morphs! Though not too radically - just prevent them from dragging the floor.
				options.push(function():*{
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " A sudden inward pressure erupts inside your " + target.sackDescript() + ", drawing a gasp from you. It is painless, but certainly discomforting. A quick check reveals that <b>your " + target.ballsDescript(false, true, false, false) + " " + (target.balls == 1 ? "has" : "have") + " shrunk!</b>";
					target.ballSizeRaw = newSizeBalls;
				});
			}
			
			if (target.vaginaTotal() > target.vaginaTotal(GLOBAL.TYPE_VULPINE))
			{ // Female slots - only can happen after fur (I think it would look a bit awkward without it).
				for (var v:int = 0; v < target.vaginaTotal(); v++) 
				{
					if (target.vaginas[v].type == GLOBAL.TYPE_CANINE)
					{ // since canine one is basically the same, just silently change type
						target.vaginas[v].type = GLOBAL.TYPE_VULPINE;
					}
					
					if (target.vaginas[v].type != GLOBAL.TYPE_VULPINE && target.hasFur() && target.vaginaTypeUnlocked(v, GLOBAL.TYPE_VULPINE))
					{
						options.push(function():*{
							kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " You start panting as an intense sensation of warmth washes over your crotch. Your " + target.vaginaDescript(v) + " begins to swell and puff up rapidly, leaving you little time to ponder the situation as your cunt morphs to take on a spade-like shape, much like a vixen's. <b>You now have a fox-cunt!</b>";
							target.shiftVagina(v, GLOBAL.TYPE_VULPINE);
							target.vaginas[v].vaginaColor = !colorsMatching(target) ? "black" : target.lipColor;
						});
						break;
					}
				}
			}
			
			var maxSizeBreasts:Number = 7; // C-cups are more than enough
			var minSizeBreasts:Number = (target.canLactate() && target.biggestTitSize(true) >= 1 ? 1 : 0); // to avoid parser weirdshit breasts would be at least A-cups if lactating
			if (target.biggestTitSize(true) > maxSizeBreasts) // breasts down to C-cups, if multirow other rows to b/a/flat
			{
				for (var b:int = 0; b < target.breastRows.length; b++)
				{
					if (target.breastRows[b].breastRatingRaw > maxSizeBreasts && target.breastRatingUnlocked(b, maxSizeBreasts))
					{
						options.push(function():*{
							kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " You feel as if like a weight has been lifted off your chest. Literally! You discover that <b>your " + target.allBreastsDescript() + " have shrunk";
							target.breastRows[b].breastRatingRaw = Math.max(int(target.breastRows[b].breastRatingRaw / 2), maxSizeBreasts);
							kGAMECLASS.eventBuffer += ", dropping you down to " + target.breastCup(target.biggestTitRow()) + "</b>.";
							
							for (var j:int = b + 1; j < target.breastRows.length; j++) // go through other rows and align in stairs pattern
							{
								if (target.breastRows[j].breastRatingRaw >= target.breastRows[j - 1].breastRatingRaw)
								{
									target.breastRows[j].breastRatingRaw = target.breastRows[j - 1].breastRatingRaw - 1;
									if (target.breastRows[j].breastRatingRaw < minSizeBreasts) target.breastRows[j].breastRatingRaw = minSizeBreasts;
								}
							}
						});
						break;
					}
				}
			}
			
			if (target.bRows() < 4 && target.hasFur() && (target.biggestTitSize(true) > 0 || target.hasVagina()) && target.createBreastRowUnlocked(1))
			{ // if female or shemale, grow another row of nipples up to 4 total
				options.push(function():*{
					if (minSizeBreasts == 0)
					{ // normal case - flats
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " A sudden sensation erupts on your chest, as if your nipples had just been flicked during an intense bout of lovemaking. As you reflexively raise your hands to them, you notice that the feeling in fact came from below your nipples. Taking a quick peek";
						if (target.hasArmor() && !(target.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || target.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST))) kGAMECLASS.eventBuffer += " under your clothes";
						kGAMECLASS.eventBuffer += " to assess the situation, you discover a new " + (target.breastRows[target.breastRows.length - 1].breasts == 2 ? "pair" : "set") + " of nipples standing beneath the ones you previously had!";
					}
					else
					{ // lactating - A-cups to avoid parser weirdshit
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Suddenly, you feel as if the area on your " + (target.bRows() < 2 ? "chest" : "belly") + " below your breasts is growing softer and more sensitive, which is followed by a feeling of being filled with something. As you suspected, " + num2Text(target.breastRows[target.breastRows.length - 1].breasts) + " soft orbs of flesh soon begin pushing their way out from your " + (target.bRows() < 2 ? "chest" : "belly") + ", forming a new " + (target.breastRows[target.breastRows.length - 1].breasts == 2 ? "pair" : "set") + " of A-cup breasts below the original ones!";
					}
					
					if (target.bRows() == 1) kGAMECLASS.eventBuffer += " With a second row of breasts, you now sport a more animalistic look.";
					else if (target.bRows() == 2) kGAMECLASS.eventBuffer += " With a third row of breasts, your front is now starting to feel somewhat tightly-packed.";
					else kGAMECLASS.eventBuffer += " With a forth row of breasts you are now able to feed a whole litter of kits! You're not quite sure if this is strange, or just plain hot.";
					
					if (minSizeBreasts == 0)
					kGAMECLASS.eventBuffer += " <b>You now have extra set of nipples!</b>";
					else
					kGAMECLASS.eventBuffer += " <b>You now have extra set of breasts!</b>";
					
					var newBreastRow:BreastRowClass = new BreastRowClass();
					newBreastRow.nippleType = target.breastRows[target.breastRows.length - 1].nippleType; // same type as previous row
					newBreastRow.breasts = target.breastRows[target.breastRows.length - 1].breasts; // same amount of breasts as previous row
					newBreastRow.breastRatingRaw = minSizeBreasts;
					target.breastRows.push(newBreastRow);
				});
			}
			
			if (!InCollection(target.nippleColor, "onyx", "black") && target.nippleColorUnlocked("black") && !colorsMatching(target))
			{
				options.push(function():*{
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " You feel a strange tingling around your chest area. After some examination you notice the color of your " + target.nipplesDescript() + " has changed. <b>You now have black nipples!</b>";
					target.nippleColor = "black";
				});
			}
			
			if (options.length > 0 && rand(2) == 0)
			{
				RandomInCollection(options)();
				return true;
			}
			
			return false;
		}
		
		/**
		 * basic kemonomimi stage - ears and tail
		 * 
		 * return true if all possible TFs obtained (blocked are considered obtained)
		 */
		private static function tfStage1(target:Creature):Boolean
		{
			var frost:Boolean = target.statusEffectv1("Foxfire") == 1;
			var place:int = target.statusEffectv2("Foxfire");
			
			if (target.hasTail(GLOBAL.TYPE_VULPINE) && !target.hasTailFlag(GLOBAL.FLAG_FURRED) && target.tailFlagsUnlocked(GLOBAL.FLAG_FURRED))
			{ // Fixing tail furry flag, if it somehow missing.
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " The fur on your foxtail" + (target.tailCount > 1 ? "s" : "") + " has regrown!";
				target.addTailFlag(GLOBAL.FLAG_FURRED);
				
				return false;
			}
			
			if (target.hasTail(GLOBAL.TYPE_VULPINE) && !target.hasTailFlag(GLOBAL.FLAG_LONG) && target.tailFlagsUnlocked(GLOBAL.FLAG_LONG))
			{ // Fixing tail long flag, if it somehow missing.
				if (target.tailCount == 1)
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your stubby fox tail suddenly pulls at the base of your spine, growing longer until it reaches the length of a regular fox's tail.";
				else
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your stubby fox tails suddenly pull at the base of your spine, growing longer until they all reach the length of a regular fox's tail.";
				target.addTailFlag(GLOBAL.FLAG_LONG);
				
				return false;
			}
			
			if (target.hasTail(GLOBAL.TYPE_VULPINE) && target.hasTailFlag(GLOBAL.FLAG_FURRED) && !target.hasTailFlag(GLOBAL.FLAG_FLUFFY) && target.tailFlagsUnlocked(GLOBAL.FLAG_FLUFFY)) // Checking tail fluffy flag.
			{
				if (target.tailCount == 1)
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your " + target.tailsDescript() + " quivers briefly as a strange pressure builds within; a moment later, a new batch of fur pushes its way outwards, doubling the thickness of the fur already there, and keeps growing longer and longer. Within seconds, the fur on your tail has grown out to nearly two feet from the center on all sides. <b>The fur on your foxtail has grown extra fluffy!</b>";
				else
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your " + target.tailsDescript() + " quiver briefly as a strange pressure builds within; a moment later, a new batch of fur pushes its way outwards, doubling the thickness of the fur already there, and keeps growing longer and longer. Within seconds, the fur on your tails has grown out to nearly two feet from the center on all sides. <b>The fur on your foxtails has grown extra fluffy!</b>";
				target.addTailFlag(GLOBAL.FLAG_FLUFFY);
				
				return false;
			}
			
			if ((target.earType == GLOBAL.TYPE_VULPINE || place == 1) && !target.hasTail(GLOBAL.TYPE_VULPINE))
			{
				if (target.tailTypeUnlocked(GLOBAL.TYPE_VULPINE) || target.hasParasiteTail())
				{
					var hasTailCock:Boolean = target.hasTailCock();
					var hasTailCunt:Boolean = target.hasTailCunt();
					
					if (target.hasTail()) 
					{
						target.tailCount = Math.min(Math.max(1, target.tailCount), 9); // check bounds to be between 1 and 9 tails
						
						if (target.tailCount == 1)
							kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your " + target.tailsDescript() + " feels strange somehow. Before you can figure out exactly why, it suddenly twitches and begins to morph in front of your eyes, puffing up into a fluffy vulpine tail. <b>You are now the proud owner of a fox tail!</b>";
						else
							kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your " + target.tailsDescript() + " feels strange somehow. Before you can figure out exactly why, your multiple tails suddenly start to twitch and morph in front of your eyes, puffing up into fluffy vulpine tails. <b>Your now have " + num2Text(target.tailCount) + " vulpine tails!</b>";
					}
					else
					{
						target.tailCount = 1; // grow one tail
						
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " A feeling of pressure builds at the end of your tailbone beneath the skin, followed by a tugging sensation. It continues, as your tailbone elongates and thickens on its journey outwards, and then begins to sprout a coat of poofy " + target.furColor + " fur, with a pointy tip. Within moments, the nerves and muscles within activate, and you can suddenly feel your new appendage as it reflexively sways behind you. <b>You are the proud owner of a healthy new foxtail!</b>";
					}
					
					target.clearTailFlags();
					if (hasTailCock) // In Soviet TiTS fluffy tails touch YOU!
					{
						if (InCollection(target.tailGenitalArg, GLOBAL.TYPE_VULPINE, GLOBAL.TYPE_CANINE)) // already canine
							kGAMECLASS.eventBuffer += " Concerned with the fate of your tail genitalia, you reach into your tail fur, groping around blindly to figure out what's going on underneath. As you feel the tip of your tail, you discover that your canine tail-cock is still there, now hidden behind a tuft of fur. <b>Your tail-cock is now vulpine in nature!</b>";
						else // other than canine
							kGAMECLASS.eventBuffer += " Concerned with the fate of your tail genitalia, you reach into your tail fur, groping around blindly to figure out what's going on underneath. As you feel the tip of your tail, you discover that your tail-cock is still there, but having taken on the shape of a canine member, complete with a knot! <b>Your tail-cock is now vulpine in nature!</b>";
						
						target.tailGenitalColor = !colorsMatching(target) ? "red" : target.lipColor;
						target.tailGenitalArg = GLOBAL.TYPE_VULPINE;
						target.tailGenital = GLOBAL.TAIL_GENITAL_COCK;
						target.addTailFlag(GLOBAL.FLAG_TAILCOCK);
						if (hasTailCunt) target.addTailFlag(GLOBAL.FLAG_TAILCUNT); // Since I have no real idea how combo version should work, I also don't know how to fork it properly, so let's silently apply flag
						target.addTailFlag(GLOBAL.FLAG_PREHENSILE);
						target.addTailFlag(GLOBAL.FLAG_KNOTTED);
						target.addTailFlag(GLOBAL.FLAG_TAPERED);
						target.addTailFlag(GLOBAL.FLAG_SHEATHED);
					}
					else if (hasTailCunt)
					{
						if (InCollection(target.tailGenitalArg, GLOBAL.TYPE_VULPINE, GLOBAL.TYPE_CANINE)) // already canine
							kGAMECLASS.eventBuffer += " Concerned with the fate of your tail genitalia, you reach into your tail fur, groping around blindly to figure out what's going on underneath. As you feel the tip of your tail, you discover that your tail-pussy is still there, hidden behind a tuft of fur and virtually unaffected by the changes wrought upon rest your tail. <b>Your tail-cunt is now vulpine in nature!</b>";
						else // other than canine
							kGAMECLASS.eventBuffer += " Concerned with the fate of your tail genitalia, you reach into your tail fur, groping around blindly to figure out what's going on underneath. As you feel the tip of your tail, you discover that your tail-pussy is still there – but now having taken on a canine-shape, much like that of a bitch’s! <b>Your tail-cunt is now vulpine in nature!</b>";
						
						target.tailGenitalColor = !colorsMatching(target) ? "black" : target.lipColor;
						target.tailGenitalArg = GLOBAL.TYPE_VULPINE;
						target.tailGenital = GLOBAL.TAIL_GENITAL_VAGINA;
						target.addTailFlag(GLOBAL.FLAG_TAILCUNT);
						target.addTailFlag(GLOBAL.FLAG_PREHENSILE);
						target.addTailFlag(GLOBAL.FLAG_SHEATHED);
					}
					
					kGAMECLASS.flags["CUNT_TAIL_PREGNANT_TIMER"] = undefined;
					kGAMECLASS.flags["DAYS_SINCE_FED_CUNT_TAIL"] = undefined;
					
					// count is set above
					target.tailType = GLOBAL.TYPE_VULPINE;
					target.addTailFlag(GLOBAL.FLAG_LONG);
					target.addTailFlag(GLOBAL.FLAG_FURRED);
					target.addTailFlag(GLOBAL.FLAG_FLUFFY);
					
					return false;
				}
			}
			
			if (kGAMECLASS.attachedMimbranes() > 0) // get rid of all non-tail parasites, since foxfire is technically a parasite itself and won't get along with contenders!
			{
				if (kGAMECLASS.attachedMimbranes() == 1)
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your mimbrane parasite turns a sickly pale as it suddenly releases your " + target.skin() + ", slumping to the ground lifelessly. You almost feel sorry for the poor creature as it shrivels up and crumbles to dust before your eyes. <b>Your mimbrane is gone!</b>";
				else
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your mimbrane parasites turn a sickly pale as they suddenly let go of your " + target.skin() + ", slumping to the ground lifelessly. You almost feel sorry for the poor creatures as they shrivel up and crumble to dust before your eyes. <b>Your mimbranes are gone!</b>";
				kGAMECLASS.removeMimbranes();
				
				return false;
			}
			
			if (target.skinType != GLOBAL.SKIN_TYPE_SKIN && target.skinType != GLOBAL.SKIN_TYPE_FUR && target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN)) // normalizing skin if not skin and not fur
			{
				if (target.skinType == GLOBAL.SKIN_TYPE_SCALES)
				{
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " A light prickling sensation erupts under your scales, followed by an odd sort of numbness. A light sheen spreads across the scales on your body, resembling a snake about to shed a layer of skin. As you try picking at a tear in the pattern, your entire layer of scales lifts up painlessly, and you feel the breeze caress the soft, human skin underneath. A few minutes of de-scaling yourself, and <b>you sport a healthy set of human-like skin!</b>";
				}
				else if (target.skinType == GLOBAL.SKIN_TYPE_GOO)
				{
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " As you move about, you notice your exterior layer of goo seems to be hardening somewhat, and you're certain that you were more transparent before. This is confirmed as your exterior layer continues growing taut and opaque, like mammalian skin. Within seconds, <b>you find yourself bearing a healthy new layer of human-like skin!</b>";
				}
				else if (target.skinType == GLOBAL.SKIN_TYPE_CHITIN)
				{
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " As you move, your chitin plates become stiff and numb. You feel as if you're \"wearing\" them, rather than that they're a part of you. The cause immediately becomes clear as several small sections of your chitin plates fall to the ground, revealing a soft patch of mammalian skin. You realize what is happening, and begin plucking the rest of your plates off yourself, soon finding yourself covered in a <b>healthy layer of human-like skin!</b>";
				}
				else if (target.skinType == GLOBAL.SKIN_TYPE_FEATHERS)
				{
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " A sudden itchiness spurts out from the bast of your feather quills. As you brush the area, most of your feathers fall away, as though you are entering a severe molting cycle. Rather than new feathers growing in their place, the skin underneath softens, and the holes that your feathers grew from shrink out of sight. Soon, your coat of feathers falls away, leaving <b>you with a set of healthy human-like skin!</b>.";
				}
				else if (target.skinType == GLOBAL.SKIN_TYPE_LATEX)
				{
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " You suddenly notice that though you've been in movement for a few minutes, you haven't heard any of the light tensing and squeaking sounds from your latex skin. You pull experimentally at a section of your skin, and rather than a thick, stretchy tug, it feels softer than before, and seems determined to stay in place. The shine on your outer layer dulls as the process continues, and soon <b>you are sporting a set of healthy, human-like skin!</b>";
				}
				else
				{
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your " + target.skin() + " starts to itch intensely, as a feeling of warmth quickly spreads across your inhuman skin. You barely have time to realize what is happening as <b>your " + target.skinFurScales() + " morphs to be replaced by regular human-like skin</b>.";
				}
				target.skinType = GLOBAL.SKIN_TYPE_SKIN;
				
				return false;
			}
			
			if (target.hairType != GLOBAL.HAIR_TYPE_REGULAR && target.hairTypeUnlocked(GLOBAL.HAIR_TYPE_REGULAR)) // normalizing hair
			{
				if (target.hairType == GLOBAL.HAIR_TYPE_FEATHERS)
				{
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " A feather falls down in front of you, followed by several more as you feel something pushing underneath your scalp. Your head-feathers cascade down you as they leave their resting places, and are quickly replaced with tufts of normal hair. <b>You now have normal hair!</b>";
					target.hairLength = 1;
					target.hairStyle = "null";
				}
				else if (target.hairType == GLOBAL.HAIR_TYPE_TRANSPARENT)
				{
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " A few stray strands of hair become visible before your eyes, followed by a few more, and a few more. Within moments, <b>your hair loses its transparency</b> and settling into a normal opaque state. <b>You now have normal hair!</b>";
					// keep both length and style here
				}
				else if (target.hairType == GLOBAL.HAIR_TYPE_GOO)
				{
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " You notice that you haven't seen any drips falling from your head-goo for a few minutes. Running a hair over your head, you feel distinct strands of something stringy, rather than the gelatinous mass you're used to feeling. The strands thicken and take form as tufts of normal hair, replacing your goo-hair. The new hair stays in place nicely instead of poofing everywhere, as your natural goo seems to be acting as a sort of hair styling gel. <b>You now have normal hair!</b>";
					target.hairLength = 1;
					target.hairStyle = "null";
				}
				else if (target.hairType == GLOBAL.HAIR_TYPE_TENTACLES)
				{
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " An alien, sucking sensation erupts at the top of your head, and you feel your head-tentacles pulling down into your scalp. The patches between the tentacles begin sprouting bristles of hair, and soon enough, <b>your head-tentacles are fully replaced by normal hair!</b>";
					target.hairLength = 1;
					target.hairStyle = "null";
				}
				else if (target.hairType == GLOBAL.HAIR_TYPE_QUILLS)
				{
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " You feel a strange tingling on your scalp as the skin around your quills loosen and grow slack. Within moments, the your head-quills begin falling down your back and shoulders, and soft tufts of normal hair grow to take their place. <b>You now have normal hair!</b>";
					target.hairLength = 1;
					target.hairStyle = "null";
				}
				else
				{
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your " + target.hairNoun() + " melts into a gooey-mass on top of your head. You wipe it off only to discover regular human-like hair beneath. <b>You now have normal hair!</b>";
					target.hairLength = 1;
					target.hairStyle = "null";
				}
				target.hairType = GLOBAL.HAIR_TYPE_REGULAR;
				
				return false;
			}
			
			var fireColor:String = frost ? "fiery blue" : "glowing ember";
			if (InCollection(target.hairType, GLOBAL.HAIR_TYPE_REGULAR, GLOBAL.HAIR_TYPE_TRANSPARENT) && target.hairColor != fireColor && target.hairColorUnlocked(fireColor))
			{  // setting hair ablaze!
				target.hairColor = fireColor;
				if (!target.hasFur()) target.furColor = fireColor;
				if (target.hasHair()) // suppress output if bald
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Wait, is it merely your imagination or is your hair on fire?! You reach up to feel it, but find it to be cool to the touch. Strange... <b>You now have " + fireColor + " hair!</b>";
				return false;
			}
			
			if (InCollection(target.hairType, GLOBAL.HAIR_TYPE_REGULAR, GLOBAL.HAIR_TYPE_TRANSPARENT) && target.hairLength < 12 && target.hairLengthUnlocked(12))
			{  // hair growth - a bit off for animalistic TF, but since it is a hair dye...
				if (!target.hasHair())
				{
					if (target.hasFur())
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your head-fur begins to itch, and before long it starts to grow out wildly at a rapid pace, blossoming into long hair which reaches all the way down your neck. <b>You now have long hair!</b> You are going to need a brush...";
					else
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your " + target.hairDescript() + " starts to tingle, and you feel an sudden urge to scratch it. Just as you reach for it your " + target.fingers() + " are met with a large burst of wild growth, not stopping until it reaches down all the way to your neck. <b>You now have long hair!</b> You're going to need a brush...";
				}
				else kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " You brush away a few strands of hair from your vision, and feel something brush against your neck. It seems <b>your " + target.hairNoun() + " has grown longer!</b>";
				target.hairLength = 12;
				if (!InCollection(target.hairStyle, "null", "curls", "pigtails", "ponytail", "straight")) // complex styles are messed up with growth
				{
					kGAMECLASS.eventBuffer += " It is a bit wild and messy at the moment, though.";
					target.hairStyle = "null";
				}
				return false;
			}
			
			var accentColor:String = frost ? "flickering silver" : "blazing red";
			if (target.skinAccent != accentColor && target.hasStatusEffect("Vanae Markings"))
			{ // setting vanae markings ablaze!
				target.skinAccent = accentColor;
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " You experience a burning sensation around your skin-markings, as they change tone to match your new form, becoming fiery like that of living-embers. Your markings are now " + accentColor + "!";
				
				return false;
			}
			
			if (target.earType != GLOBAL.TYPE_VULPINE && target.earTypeUnlocked(GLOBAL.TYPE_VULPINE)) // ears!
			{
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your " + target.earsDescript() + " shift to become large and pointy like that of a fox’s, allowing you to pick up even the faintest of sound as they twitch atop your head. <b>You now have pointy fox ears!</b>";
				
				target.earType = GLOBAL.TYPE_VULPINE;
				
				return false;
			}
			
			if (target.eyeType != GLOBAL.TYPE_VULPINE && target.eyeTypeUnlocked(GLOBAL.TYPE_VULPINE)) // fox eyes are more like feline than dog-like, but usually yellowish toned and rarely blue
			{
				var colors:Array = frost ? ["yellow", "amber", "blue"] : ["yellow", "yellow", "amber", "amber", "hazel", "hazel", "brown", "gold", "blue"];
				
				if (target.hasPerk("Enlightened Nine-tails") || target.hasPerk("Nine-tails"))
				{ // true kitsune colors, mostly for LD mod compatibility
					colors = ["luminous cerulean", "luminous azure", "luminous celeste"]; // unfathomable and serene, like a clear summer sky
				}
				else if (target.hasPerk("Corrupted Nine-tails"))
				{
					colors = ["sable"]; // cold and dull, like a cloudy winter sky
				}
				
				var chosenColor:String = RandomInCollection(colors);
				
				if (!InCollection(target.eyeColor, colors) && target.eyeColorUnlocked(chosenColor))
				{
					target.eyeColor = chosenColor;
				}
				
				target.eyeType = GLOBAL.TYPE_VULPINE;
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your eyes water and strain for a moment. As you blink, you notice a greater depth of contrast in the nearby lights and shadows. <b>You have slitted, " + target.eyeColor + " fox-like eyes now!</b>";
				return false;
			}
			
			return true;
		}
		
		/**
		 * optional kitsune kemonomimi stage - continue growing tails
		 * 
		 * return true if all possible TFs obtained (blocked are considered obtained)
		 */
		private static function tfStage2(target:Creature):Boolean
		{
			var frost:Boolean = target.statusEffectv1("Foxfire") == 1;
			if (kGAMECLASS.flags["FOXFIRE_MAX_TAILS"] == undefined) kGAMECLASS.flags["FOXFIRE_MAX_TAILS"] = target.hasTail(GLOBAL.TYPE_VULPINE) ? target.tailCount : 0;
			
			if (target.hasTail(GLOBAL.TYPE_VULPINE) && target.hasTailFlag(GLOBAL.FLAG_LONG) && !target.hasTailFlag(GLOBAL.FLAG_PREHENSILE) && target.tailFlagsUnlocked(GLOBAL.FLAG_PREHENSILE)) // checking tail prehensile flag
			{
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your foxtail" + (target.tailCount > 1 ? "s" : "") + " has now grown especially long, and appear" + (target.tailCount > 1 ? "" : "s") + " to be... prehensile as well? What the hell.";
				target.addTailFlag(GLOBAL.FLAG_PREHENSILE);
				
				return false;
			}
			
			if (target.hasTail(GLOBAL.TYPE_VULPINE) && target.tailCount < 9 && target.tailCountUnlocked(target.tailCount + 1)) // kitsunezations
			{
				target.tailCount++;
				switch (target.tailCount)
				{
					case 2:
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " <b>You sprout a second foxtail!</b>";
						if (kGAMECLASS.flags["FOXFIRE_MAX_TAILS"] < target.tailCount) kGAMECLASS.eventBuffer += " This wasn't mentioned in the instructions...";
						break;
					case 3:
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " <b>A third foxtail pushes its way out.</b>";
						if (kGAMECLASS.flags["FOXFIRE_MAX_TAILS"] < target.tailCount) kGAMECLASS.eventBuffer += " Something has clearly gone awry.";
						break
					case 4:
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " <b>A fourth foxtail makes its appearance behind you!</b>";
						if (kGAMECLASS.flags["FOXFIRE_MAX_TAILS"] < target.tailCount) kGAMECLASS.eventBuffer += " You may have a problem.";
						break;
					case 5:
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " <b>A fifth foxtail now joins the others on your backside!</b>";
						if (kGAMECLASS.flags["FOXFIRE_MAX_TAILS"] < target.tailCount) kGAMECLASS.eventBuffer += " Looks like it was bad idea to disobey the instructions; who knows what else might result?";
						break;
					case 6:
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Here we go, <b>a sixth foxtail now joins the rest.</b>";
						break;
					case 7:
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " <b>A seventh foxtail pops out behind you.</b>";
						if (kGAMECLASS.flags["FOXFIRE_MAX_TAILS"] < target.tailCount) kGAMECLASS.eventBuffer += " Not even surprising, at this point.";
						break;
					case 8:
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " <b>An eighth foxtail joins the party.</b>";
						if (kGAMECLASS.flags["FOXFIRE_MAX_TAILS"] < target.tailCount) kGAMECLASS.eventBuffer += " Will this ever stop?";
						break;
					case 9:
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " <b>A ninth foxtail sprouts next to the rest.</b>";
						if (kGAMECLASS.flags["FOXFIRE_MAX_TAILS"] < target.tailCount)
						{
							kGAMECLASS.eventBuffer += " You feel somehow... enlightened. In this moment of enlightenment, a great, universal truth becomes clear to you: product instructions are written for a reason.";
							if (target.hasTailCock()) kGAMECLASS.eventBuffer += " Screw it, you just want to find someone for tentacle monster roleplay - you definitely have enough appendages for it!";
						}
						
						target.addStatusValue("Foxfire", 4, -12 * 60); // extra 12 hours delay after it
						break;
					default:
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " +1 foxtail!, NOW something gone really wrong!"; // failsafe here, not supposed to actually happen
				}
				
				kGAMECLASS.flags["FOXFIRE_MAX_TAILS"] = Math.max(kGAMECLASS.flags["FOXFIRE_MAX_TAILS"], target.tailCount);
				return false;
			}
			
			return true;
		}
		
		/**
		 * fox-morph stage
		 * 
		 * return true if all possible TFs obtained (blocked are considered obtained)
		 */
		private static function tfStage3(target:Creature):Boolean
		{
			var frost:Boolean = target.statusEffectv1("Foxfire") == 1;
			
			var fireColor:String = frost ? "fiery blue" : "glowing ember";
			if (target.skinType == GLOBAL.SKIN_TYPE_SKIN && target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FUR)) // growing fur
			{
				if (frost)
				{
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " A light tingling flows over you from top to bottom, followed by a strange prickly sensation. You instinctively scratch yourself, and your hand is unexpectedly met with thick tufts of fur springing wildly from your " + target.skin() + ". The " + fireColor + " fur quickly sprouts and fills every un-furred area on your body, leaving you with a long, thick coat of insulating fur. <b>Your body is now covered in thick fur!</b>";
					target.skinFlags = [GLOBAL.FLAG_FLUFFY];
				}
				else
				{
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " A light tingling flows over you from top to bottom, followed by a strange prickly sensation. You instinctively scratch yourself, and find that a thin layer of soft fur has begun growing over your " + target.skin() + ". The " + fireColor + " fur quickly sprouts and fills every un-furred area on your body, leaving you with a soft, healthy coat of fur. <b>Your body is now covered in fur!</b>";
					target.skinFlags = [];
				}
				
				target.skinType = GLOBAL.SKIN_TYPE_FUR;
				target.furColor = fireColor;
				
				return false;
			}
			
			if (target.furColor != fireColor && target.furColorUnlocked(fireColor)) // checking fur color
			{
				target.furColor = fireColor;
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your fur begins to glow in an eerie-green - before it slowly shifts and settles into a " + fireColor + " tone, retaining its luminosity. <b>You now have " + fireColor + " fur!</b>";
				
				return false;
			}
			
			if (frost && target.hasFur() && !target.hasSkinFlag(GLOBAL.FLAG_FLUFFY) && target.skinFlagsUnlocked(GLOBAL.FLAG_FLUFFY)) // Checking skin fluff for Frostfire.
			{
				target.addSkinFlag(GLOBAL.FLAG_FLUFFY);
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " You feel a sudden tingling at the base of your coat of fur, and you begin to feel slightly warmer. The reason quickly becomes obvious: your fur is growing slightly longer, and more strands are pushing their way out in between the existing ones, growing thicker and denser with each passing second. Your fur is now thick!";
				
				return false;
			}
			
			if (target.legType != GLOBAL.TYPE_VULPINE && target.legTypeUnlocked(GLOBAL.TYPE_VULPINE)) // wrong legs type - changing
			{
				if (target.legCount != 2 && target.legCount != 4 && target.legCountUnlocked(target.isTaur() ? 4 : 2)) // naga / leithan, changing to biped / taur
				{
					if (target.isNaga())
					{
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your serpentine lower half shivers for a moment, growing tense and less flexible. Your lower length shortens, and painlessly splits at the tail, then runs the length of your mass until it reaches your hips. The two short tails quickly become rigid and firm, and can now only bend one way at the middle section. Within moments, <b>you have knees again, as well as feet and legs resembling that of a fox's</b>.";
						target.legCount = 2;
						target.genitalSpot = 0;
					}
					else if (target.isGoo())
					{
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Suddenly, the lower part of your gooey mass presses inwards and becomes much more solid. You feel bones and muscles reforming underneath you, and im a moment the mass of goo you were previously using to move yourself about is now a <b>pair of sturdy fox-like legs</b>.";
						target.legCount = 2;
						target.genitalSpot = 0;
					}
					else if (target.isTaur() || target.isDrider())
					{
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your " + target.legs() + " quiver in a moment of sudden weakness; the muscles within quickly press inwards and tighten, growing taut and high-strung. Your legs' overall thickness follows, becoming slightly leaner within a few seconds, now resembling that of a wild fox. <b>You now have fox-legs!</b>";
						if (target.legCount > 4)
						{
							if (target.legCount == 6)
								kGAMECLASS.eventBuffer += " A sudden inward pressure erupts near the shoulders of your central pair of legs on your lower half. The weight on your front and back taur legs increases as your central pair begins to lift off the ground, and immediately begin disappearing into you. You stumble forward as you have less points of balance holding you up, but you find yourself adjusting almost immediately. Before you can fully process what's happeneing, <b>you now find yourself standing atop a set of four legs!</b>";
							else
								kGAMECLASS.eventBuffer += " A sudden inward pressure erupts throughout your lower half. The weight on your front and back taur legs increases as some of your other legs begin to lift off the ground, and immediately begin disappearing into you. You stumble forward as you have less points of balance holding you up, but you find yourself adjusting almost immediately. Before you can fully process what's happening, <b>you now find yourself standing atop a set of four legs</b>.";
						}
						target.legCount = 4;
						target.genitalSpot = 2;
					}
					else
					{
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " You watch helplessly as your " + target.lowerBody() + " suddenly dissolves underneath you into a pile of goo! Thankfully your worries are short-lived as the goo begin to morph and take shape, reforming into a <b>pair of fully functional fox-legs!</b>";
						target.legCount = 2;
						target.genitalSpot = 0;
					}
					
					target.legType = GLOBAL.TYPE_VULPINE;
					target.legFlags = [GLOBAL.FLAG_DIGITIGRADE, GLOBAL.FLAG_PAWS, GLOBAL.FLAG_FURRED];
					if (frost) target.addLegFlag(GLOBAL.FLAG_FLUFFY);
					
					return false;
				}
				else if (target.legCount == 2 || target.legCount == 4) // already fitting biped / quadripedal taur, just changing type
				{
					var wasFurryLegs:Boolean = target.hasLegFlag(GLOBAL.FLAG_FURRED) || target.hasFur();
					var wasDigitigradeLegs:Boolean = target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE);
					var wasPaddedLegs:Boolean = target.hasPaddedLegs();
					var wasFluffyLegs:Boolean = target.hasLegFlag(GLOBAL.FLAG_FLUFFY) && (target.hasLegFlag(GLOBAL.FLAG_FURRED) || target.hasFur());
					
					if (!wasFurryLegs)
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " A tiny, painless pinprick of a sensation sparks on your upper legs as a single strand of fur pushes itself out from your skin. It is quickly followed by a wave of the same, flowing from your hips down to your feet in a cascade of sudden fur growth. When it finishes, you find <b>your legs fully enclosed by a sheen of healthy fur</b>.";
					
					if (!wasDigitigradeLegs)
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " You suddenly tip forward, your center of balance unexpectedly moving underneath you. A quick look downwards tells you why: your heels have begun pulling themselves up your leg, forcing you to balance yourself on the front half of your feet. As it does, the length between your toes and heels pulls apart and lengthens, while your shins shorten and thicken. Within moments, the tips of your feet flatten and widen, making it far easier to balance atop them. Shortly after, your heels settle into place halfway between your toes and knees, becoming closer to a second knee than a place to set your weight upon. <b>Your legs have become fully digitigrade</b>.";
					
					if (!wasPaddedLegs)
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " As you walk, you begin to feel a few soft bumps across the bottom of your feet, which push outwards from the rest, and quickly grow in mass. They feel sensitive, like the tips of your fingers, rather than the relative nervelessness of the bottom of your feet, despite their growing toughness. They continue to form at the base of your feet, and on the bottom points of your toes. It is obvious what they are: pawpads. As the change finishes, <b>you now stand atop sturdy canine-like pads</b>, which help you grip the ground better.";
					
					if (frost && !wasFluffyLegs)
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Another wave of prickling sensations crawl across your legs. Your fur pushes itself outwards by a few inches, flowing this way and that as you move your legs; the fur itself seems to be growing in much thicker as well. By the time the sensation stops, <b>your legs are thickly-furred</b>, like that of an arctic-dwelling creature.";
					
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your legs quiver in a moment of sudden weakness; the muscles within quickly press inwards and tighten, growing taut and high-strung. Your legs' overall thickness follows, becoming slightly leaner within a few seconds. <b>You now have fox-legs!</b>";
					
					target.legType = GLOBAL.TYPE_VULPINE;
					target.genitalSpot = target.legCount == 2 ? 0 : 2;
					target.legFlags = [GLOBAL.FLAG_DIGITIGRADE, GLOBAL.FLAG_PAWS, GLOBAL.FLAG_FURRED];
					if (frost) target.addLegFlag(GLOBAL.FLAG_FLUFFY);
					
					return false;
				}
			}
			else if (target.legType == GLOBAL.TYPE_VULPINE) // proper legs type - checking flags
			{
				if (!target.hasLegFlag(GLOBAL.FLAG_FURRED) && target.legFlagsUnlocked(GLOBAL.FLAG_FURRED)) // Checking fur on legs. No pre-requisites.
				{
					target.addLegFlag(GLOBAL.FLAG_FURRED);
					
					if (!target.hasFur()) // Only show output if have no skin type fur - it would just force keeping fur on legs should you change skin type.
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " A tiny, painless pinprick of a sensation sparks on your upper legs as a single strand of fur pushes itself out from your skin. It is quickly followed by a wave of the same, flowing from your hips down to your feet in a cascade of sudden fur growth. When it finishes, you find <b>your legs fully enclosed by a sheen of healthy fur</b>.";
					
					return false;
				}
				
				if (!target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE) && target.legFlagsUnlocked(GLOBAL.FLAG_DIGITIGRADE)) // Checking digitigrade legs. Not sure how output for this should actually work, since it would certainly provide weirdshit on some circumstances.
				{
					target.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
					
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " You suddenly tip forward, your center of balance unexpectedly moving underneath you. A quick look downwards tells you why: your heels have begun pulling themselves up your leg, forcing you to balance yourself on the front half of your feet. As it does, the length between your toes and heels pulls apart and lengthens, while your shins shorten and thicken. Within moments, the tips of your feet flatten and widen, making it far easier to balance atop them. Shortly after, your heels settle into place halfway between your toes and knees, becoming closer to a second knee than a place to set your weight upon. <b>Your legs have become fully digitigrade</b>.";
					
					return false;
				}
				
				if (!target.hasLegFlag(GLOBAL.FLAG_PAWS) && target.legFlagsUnlocked(GLOBAL.FLAG_PAWS)) // Checking paws on legs. Generally means that legs are padded and clawed.
				{
					target.addLegFlag(GLOBAL.FLAG_PAWS);
					
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " As you walk, you begin to feel a few soft bumps across the bottom of your feet, which push outwards from the rest, and quickly grow in mass. They feel sensitive, like the tips of your fingers, rather than the relative nervelessness of the bottom of your feet, despite their growing toughness. They continue to form at the base of your feet, and on the bottom points of your toes. It is obvious what they are: pawpads. As the change finishes, <b>you now stand atop sturdy canine-like pads</b>, which help you grip the ground better.";
					
					return false;
				}
				
				if (frost && target.hasLegFlag(GLOBAL.FLAG_FURRED) && !target.hasLegFlag(GLOBAL.FLAG_FLUFFY) && target.legFlagsUnlocked(GLOBAL.FLAG_FLUFFY)) // Arctic special - extra fluffy fur on legs. Requires fur.
				{
					target.addLegFlag(GLOBAL.FLAG_FLUFFY);
					
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Another wave of prickling sensations crawls across your legs. Your fur pushes itself outwards by a few inches, flowing this way and that as you move your legs; the fur itself seems to be growing in much thicker as well. By the time the sensation stops, <b>your legs are thickly-furred</b>, like that of an arctic-dwelling creature.";
					
					return false;
				}
			}
			
			if (target.armType != GLOBAL.TYPE_VULPINE && target.armTypeUnlocked(GLOBAL.TYPE_VULPINE)) // wrong arms type - changing
			{
				var wasFurryArms:Boolean = target.hasArmFlag(GLOBAL.FLAG_FURRED) || target.hasFur();
				var wasPaddedArms:Boolean = target.hasPaddedHands();
				var wasFluffyArms:Boolean = target.hasArmFlag(GLOBAL.FLAG_FLUFFY) && (target.hasArmFlag(GLOBAL.FLAG_FURRED) || target.hasFur());
				
				target.armType = GLOBAL.TYPE_VULPINE;
				target.clearArmFlags();
				target.addArmFlag(GLOBAL.FLAG_FURRED);
				target.addArmFlag(GLOBAL.FLAG_PAWS);
				if (frost) target.addArmFlag(GLOBAL.FLAG_FLUFFY);
				
				if (!wasFurryArms) // Only show output if have no skin type fur - it would just force keeping fur on hands should you change skin type.
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " A slight tickle crawls across your arms as thin, short strands of fur begin poking out from your skin. Within seconds, a full <b>coat of vulpine fur covers the entirety of the skin on your arms</b> down from the shoulders.";
				
				if (!wasPaddedArms)
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " A feeling of sudden pressure begins to build on the upper inner span of your hands, and on the bottom of your fingertips. Tough, yet sensitive <b>pads like that of a canine push their way out from your hands</b>, designed to allow grip and traction despite a coat of fur.";
				
				if (frost && !wasFluffyArms)
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Another wave of pinpricks crawl across your arms, and the cause is immediately obvious. The <b>fur on your arms begins growing longer and thicker</b>, and within moments is flowing in the wind slightly as you move your arms, as opposed to the thin layer that until recently clung to your skin like a tight jacket.";
				
				kGAMECLASS.eventBuffer += "\n\nA feeling of numbness creeps from your shoulders, down your arms and to your fingertips. As you watch, the muscles underneath seem to flex and grow tighter, leaner, and vulpine. <b>You now have fox-like arms!</b>";
				
				return false;
			}
			else if (target.armType == GLOBAL.TYPE_VULPINE) // proper arms type - checking flags
			{
				if (!target.hasArmFlag(GLOBAL.FLAG_FURRED)) // Checking fur on arms. No pre-requisites.
				{
					target.addArmFlag(GLOBAL.FLAG_FURRED);
					
					if (!target.hasFur()) // Only show output if have no skin type fur - it would just force keeping fur on hands should you change skin type.
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " A slight tickle crawls across your arms as short, thin strands of fur begin poking out from your skin. Within seconds, a <b>full coat of vulpine fur covers the entirety of the skin on your arms</b> down from the shoulders.";
					
					return false;
				}
				
				if (!target.hasArmFlag(GLOBAL.FLAG_PAWS)) // Checking paws on hands. Generally means that hands are padded and clawed.
				{
					target.addArmFlag(GLOBAL.FLAG_PAWS);
					
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " A feeling of sudden pressure begins to build on the upper inner span of your hands, and on the bottom of your fingertips. Tough, yet sensitive <b>pads like that of a canine push their way out from your hands</b>, designed to allow grip and traction despite a coat of fur.";
					
					return false;
				}
				
				if (frost && target.hasArmFlag(GLOBAL.FLAG_FURRED) && !target.hasArmFlag(GLOBAL.FLAG_FLUFFY)) // Arctic special - extra fluffy fur on arms. Requires fur.
				{
					target.addArmFlag(GLOBAL.FLAG_FLUFFY);
					
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Another wave of pinpricks crawl across your arms, and the cause is immediately obvious. The <b>fur on your arms begins growing longer and thicker</b>, and within moments is flowing in the wind slightly as you move your arms, as opposed to the thin layer that until recently clung to your skin like a tight jacket.";
					
					return false;
				}
			}
			
			if (frost && target.hasFur() && target.hasSkinFlag(GLOBAL.FLAG_FLUFFY) && !target.hasPerk("Icy Veins")) // Environmental cold immunity perk for arctic fox. Comfortably sleeping naked on ice while exposed to Uvetan blizzard? No problem!
			{
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " You've become thickly-furred and fluffy everywhere! You'd have no problem surviving the arctic cold now, with such a thick layer of protective insulation.";
				kGAMECLASS.eventBuffer += "\n\n(<b>Perk Gained: Icy Veins</b> - Your body has adapted to the extreme winter cold.)";
				target.createPerk("Icy Veins", 1, 0, 0, 0, "Your body has adapted to the extreme winter cold.");
				
				return false;
			}
			
			if (target.faceType != GLOBAL.TYPE_VULPINE && target.faceTypeUnlocked(GLOBAL.TYPE_VULPINE)) // wrong face type - changing
			{
				while (target.lipRating() > 0 && target.lipModUnlocked(target.lipMod - 1))
				{ // say no to cartoonish lips on muzzle!
					target.lipMod--;
				}
				
				if (!target.hasFaceFlag(GLOBAL.FLAG_MUZZLED)) // no muzzle before
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your vision blurs as a sudden pulling sensation erupts between your eyes. Your nose pushes outwards into your view, and widens to accommodate the building mass within, pushing your eyes slightly out to the sides, rather than the traditional forward-facing human design. As your nose forms into a vulpine muzzle, the end of your nose visibly softens and darkens, growing slightly wet and filling your sinuses with a cornucopia of new scents. Finally, a set of sensitive whiskers spread out on either side of the end of your snout, letting you feel slight shifts in the wind in front of you. When the changes finish, a fully-formed <b>fox's muzzle sits in front of your face</b>.";
				else
				{
					if (target.faceType == GLOBAL.TYPE_CANINE)
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your canine muzzle becomes leaner and more tapered, much like that of a fox's. <b>Your muzzle is now vulpine!</b>";
					else
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your facebones shifts as your muzzle take on an lean vulpine shape with a wet nose, much like that of a fox's. <b>Your muzzle is now vulpine!</b>";
				}
				
				target.faceType = GLOBAL.TYPE_VULPINE;
				target.faceFlags = [GLOBAL.FLAG_MUZZLED];
				
				if (!InCollection(target.lipColor, "onyx", "black") && !colorsMatching(target))
				{
					kGAMECLASS.eventBuffer += "You catch the sight of <b>your lips darkening, as they fade to a shiny black</b>, completing the appearance of a typical fox's snout.";
					target.lipColor = "black";
				}
				
				if (!target.hasPerk("Androgyny"))
				{
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your fox's muzzle has grown so distinctly vulpine that few, if any human features remain on your face. The slender vulpine muzzle gives you a rather androgynous appearance.";
					kGAMECLASS.eventBuffer += "\n\n(<b>Perk Gained: Androgyny</b> - Your animalistic visage maintain an androgynous appearance that would befit either gender.)";
					target.createPerk("Androgyny", 1, 0, 0, 0, "Your animalistic visage maintain an androgynous appearance that would befit either gender.");
				}
				
				return false;
			}
			else if (target.faceType == GLOBAL.TYPE_VULPINE) // proper face type - checking flags
			{
				if (!target.hasFaceFlag(GLOBAL.FLAG_MUZZLED))
				{
					target.addFaceFlag(GLOBAL.FLAG_MUZZLED);
					
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your face begins to tingle, and is followed by a tugging sensation between your eyes. Your nose pushes outwards, widening slightly as it grows, until it rests upon your face as the signature thin <b>muzzle of a fox</b>.";
					
					return false;
				}
			}
			
			if (target.beardLength > 0 && target.faceType == GLOBAL.TYPE_VULPINE && target.hasFaceFlag(GLOBAL.FLAG_MUZZLED) && target.hasFur()) // No beards for foxes!
			{
				// short facial hair blends into fur
				if (target.beardLength < 1 && target.beardLengthUnlocked(0))
				{
					kGAMECLASS.output("\n\n" + kGAMECLASS.logTimeStamp("passive") + " You scratch at your " + target.beard() + ", only to discover it has merged into your fur... Your beard is gone!");
					target.removeBeard();
				}
				// or, if you have enough beard, something more original?
				else if (target.beardLength >= 1 && target.beardStyleUnlocked(11))
				{
					kGAMECLASS.output("\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your " + target.beard() + " starts to suddenly grow out wildly as it merges with your fur, only to pull up to the sides of your " + target.face() + " in thick tufts, which flare back and outwards at the back of your jaw. You now have animalistic side-burns!");
					target.beardStyle = 11;
					if (target.beardLength < 2) target.beardLength = 2;
					if (target.beardLength > target.tallness / 12) target.beardLength = target.tallness / 12;
				}
			}
			
			if (!InCollection(target.lipColor, "onyx", "black") && !colorsMatching(target))
			{
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " You catch the sight of your lips darkening, as they fade to a shiny black";
				if (target.faceType == GLOBAL.TYPE_VULPINE && target.hasFaceFlag(GLOBAL.FLAG_MUZZLED)) kGAMECLASS.eventBuffer += ", completing the appearance of a typical fox's snout"
				kGAMECLASS.eventBuffer += ". <b>You now have black lips!</b>";
				target.lipColor = "black";
				
				return false;
			}
			
			if (!InCollection(target.tongueType, GLOBAL.TYPE_VULPINE, GLOBAL.TYPE_DRACONIC) && target.hasFaceFlag(GLOBAL.FLAG_MUZZLED) && target.tongueTypeUnlocked(GLOBAL.TYPE_VULPINE))
			{
				if (target.tongueType != GLOBAL.TYPE_CANINE)
				{
					if (target.hasTongueFlag(GLOBAL.FLAG_LONG))
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your mouth waters suddenly, and you feel a gentle tug on your tongue as it sits within your mouth. It shrinks shorter than it was before and flattens slightly, growing much more suited to running the length of a long fox's snout, resting lazily within your mouth. <b>You now have a lolling vulpine tongue!</b>";
					else
						kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive") + " Your mouth waters suddenly, and you feel a gentle tug on your tongue as it sits within your mouth. It grows a tiny bit longer than it was before and flattens slightly, growing much more suited to running the length of a long fox's snout, resting lazily within your mouth. <b>You now have a lolling vulpine tongue!</b>";
					target.tongueFlags = [];
				}
				
				target.tongueType = GLOBAL.TYPE_VULPINE;
				
				return false;
			}
			
			return true;
		}
		
		private static function colorsMatching(target:Creature):Boolean
		{
			if (target.lipColor != target.nippleColor) return false;
			
			for (var i:int = 0; i < target.vaginas.length; i++)
				if (target.vaginas[i].vaginaColor != target.lipColor) return false;
			
			for (var j:int = 0; j < target.cocks.length; j++)
				if (target.cocks[j].cockColor != target.lipColor) return false;
			
			return true;
		}
		
		/**
		 * It is "a bit" more complex than using dove wings - tails are nor a seamless veil, and being snugly wrapped would look suspicious. So you'll likely need a lot of them.
		 */
		public static function canUseTailsOrFurAsClothes(target:Creature):Boolean
		{
			var bitsNeedCover:int = 0;
			var hasFluffyFur:Boolean = target.hasFur() && target.hasSkinFlag(GLOBAL.FLAG_FLUFFY);
			
			if (target.isChestExposed())
				for (var i:int = 0; i < target.breastRows.length; i++) 
				{
					if (target.breastRows[i].breastRating() > (hasFluffyFur ? (i < 2 ? 2 : 1) : 0) // fluffy fur can disguise B-cups on chest (due to that fluffy fur ball in description) and A-cups on belly
						//|| target.breastRows[i].nippleType == GLOBAL.NIPPLE_TYPE_LIPPLES // lipples? they should look quite obscene, but this is not checked in main function
						//|| InCollection(target.breastRows[i].nippleType, GLOBAL.NIPPLE_TYPE_NORMAL, GLOBAL.NIPPLE_TYPE_FUCKABLE) && target.nippleLength(target.biggestTitRow()) >= 1 // even with flats, too long nipples are quite obscene, but this is not checked in main function
						) bitsNeedCover++;
				}
			
			if (bitsNeedCover > 0 && target.isTaur()) return false; // you can't cover your breasts with your tails if you are taur, but you can go for the classic tauric scheme with wearing clothes only on humanoid part
			// actually, should also check if you are taur with genitals on humanoid location, but I doubt that this arrangement is actually supported or will be ever
			
			if (target.isCrotchExposed() && !target.hasStatusEffect("Genital Slit") && target.hasCock()) // consider genital slit effectively covering your male bits
			{
				var hasSheathed:Boolean = false;
				var currLength:int = 0;
				var totalLength:int = 0;
				for (var j:int = 0; j < target.cocks.length; j++) 
				{
					currLength = target.cLength(j, true);
					if (target.hasSheath(j) && target.lust() / target.lustMax() <= 0.75) hasSheathed = true; // consider sheath working if you are not desperately aroused
					else
					{
						if (currLength > 24) return false; // you can't hide leithan-grade boner!
						totalLength += currLength;
					}
				}
				
				bitsNeedCover += Math.ceil(totalLength / 18); // consider that you'll need one tail for every 18 inches of cock
				if (hasSheathed && !hasFluffyFur) bitsNeedCover++; // Sheathes are modest enough to be covered with one tail all, or even just be covered by a long fur
			}
			
			if (target.isCrotchExposed() && target.balls > 0) // Genital Slit effect on balls is ambigous, so I'm not counting it
			{
				if (target.hasFur() && target.ballSize() <= (target.hasStatusEffect("Uniball") ? 1 : 0.75)) { }
				else if (hasFluffyFur && target.ballSize() <= (target.hasStatusEffect("Uniball") ? 1.5 : 1)) { }
				else bitsNeedCover += Math.ceil(target.ballDiameter() * (target.hasStatusEffect("Uniball") ? 0.75 : 1) * Math.sqrt(target.balls) / 6);
			}
			
			if (target.isCrotchExposed() && target.hasVagina()
				&& !(target.vaginasMatch() && target.hasVaginaType(GLOBAL.TYPE_FELINE) && target.hasFur()) // Feline ones are modest enough to be hidden just by fur from casual glance
				) bitsNeedCover++; // I guess 1 tail would be enough for all of them, unless we have something really freaky
			
			if (target.isAssExposed() && !hasFluffyFur) bitsNeedCover++; // you always need at least 1 tail to cover your ass, unless you have flufy fur
			else if (target.hasTail()) bitsNeedCover++; // you still need free tail to use it in scenes anyways, but you can manage to use the same tail you are using to cover your ass
			
			if (bitsNeedCover == 0) return true;
			
			if (!(target.hasTail() && target.hasTailFlag(GLOBAL.FLAG_LONG) && target.hasTailFlag(GLOBAL.FLAG_FURRED))) return false; // you need long, furred tails to do this
			
			return bitsNeedCover <= target.tailCount; // actually, could also use most another types of wings as well...
		}
	}
}
