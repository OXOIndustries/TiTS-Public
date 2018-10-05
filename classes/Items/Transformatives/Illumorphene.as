// Illumorpheme
// A full bodied moth TF item
// By SoAndSo

/*

Summary

Illumorpheme is an alienized moth-morph (‘mothrine’) item made by Envyoidics LTD.
Single variant, only needs one use, comes with choices.
Available at The Entite in Gildenmere/Myrellion.

*/

// Illumorpheme can only be bought from The Entite on Gildenmere/Myrellion.

package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.ItemSlotClass;
	import classes.StorageClass;
	import classes.GameData.CodexManager;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.num2Text;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	import classes.Engine.Map.InShipInterior;
	import classes.Engine.Utility.indefiniteArticle;
	import classes.Engine.Utility.IncrementFlag;
	
	public class Illumorphene extends ItemSlotClass
	{
		public function Illumorphene()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			
			shortName = "IllumorP.";
			longName = "Illumorpheme case";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "an Illumorpheme case";
			tooltip = "A pitch black, ergonomic, high quality box with an artistic moth-shape on the front. Opening it reveals five items held in cream colored padding: An injector of clear liquid and four vials of colored liquid. The vials are labeled ‘Venal’, ‘Verdant’, ‘Voltaic’, and ‘Vatic’.\n\nThere’s a small bit of whimsical instruction inside the lid: <i>“Pick a shade, plug it in, peer into your potential.”</i>\n\n<b>A warning label that comes with the box implies that this would only be safe to use when you’re on the ship.</b>";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 12000;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			author("SoAndSo");
			
			if(target is PlayerCharacter)
			{
				kGAMECLASS.showName("\nILLUMORPHEME");
				CodexManager.unlockEntry("Mothrine");
				
				// Consumption
				// Illumorpheme requires you to be on the ship to take as it is, for lore reasons, a slow-acting whole body transformative. 
				if(!InShipInterior())
				{
					output("You distinctly remember that the items warning label implied that it would be unsafe to do here. The full transformation takes a long time: <b>Best to do it on the ship!</b>");
					output("\n\n");
					
					if (!kGAMECLASS.infiniteItems()) kGAMECLASS.itemCollect([new Illumorphene()]);
					
					return true;
				}
				else
				{
					IncrementFlag("USED_ILLUMORPHENE");
					output("You open the anodyne black box of Illumorpheme. Bearing the warning label in mind, you go to the captain’s cabin so this can be done safely.");
					output("\n\nAlong the way, you look over the contents inside. Ooh, choices!");
					output("\n\nSetting yourself down on your bed, you give it all a thorough inspection. There’s a singular slot for a vial, so It seems you’re limited to only one selection. Which do you go for?");
					output("\n\n");
					
					output("<b><u>Options</u></b>");
					output("\n* <b>Venal</b>: A pink and black color scheme!");
					output("\n* <b>Verdant</b>: A greenish blue color scheme!");
					output("\n* <b>Voltaic</b>: A red and orange color scheme!");
					output("\n* <b>Vatic</b>: A white and gold color scheme!");
					
					clearMenu();
					
					addButton(0, "Venal", illumorpheneUse, [target, "venal"], "Venal", "A pink and black color scheme!");
					addButton(1, "Verdant", illumorpheneUse, [target, "verdant"], "Verdant", "A greenish blue color scheme!");
					addButton(2, "Voltaic", illumorpheneUse, [target, "voltaic"], "Voltaic", "A red and orange color scheme!");
					addButton(3, "Vatic", illumorpheneUse, [target, "vatic"], "Vatic", "A white and gold color scheme!");
					
					addButton(14, "Actually...", illumorpheneCancel, target, "Nevermind", "Not quite ready to do this yet.");
					
					return true;
				}
			}
			else
			{
				output(target.capitalA + target.short + " cannot use the case of Illumorpheme.");
			}
			return false;
		}
		
		// Effects
		// All effects under this section are guaranteed as this is a full bodied TF like Foxfire etc. However, it’s not permanent so other mods will override anything here.
		public function illumorpheneUse(arg:Array):void
		{
			var target:Creature = arg[0];
			var option:String = arg[1];
			
			clearOutput();
			kGAMECLASS.showName("\n" + option.toUpperCase());
			author("SoAndSo");
			
			output("With caution, you remove the injector and the ");
			switch(option)
			{
				case "venal": output("pink"); break;
				case "verdant": output("garden green"); break;
				case "voltaic": output("amber red"); break;
				case "vatic": output("swirling silver"); break;
			}
			output(" vial at its side. The vial feels surprisingly delicate in your palm: a little too much pressure from your thumb would certainly break it!");
			output("\n\nUpon considering that the other vials are now useless to you, you discard the rest and the box itself.");
			output("\n\nWith the apparatus lined up, and after delicately dabbling with putting the vial and injector together, you align the base of the injector to the side of your neck. The small, circular surface that hovers over your [pc.skinFurScales] has no obvious transfer method. Must be one of those high-tech, fancy nanoneedles. How in the hell did the Seer get her hands on this stuff...?");
			output("\n\nWithout an extra thought, you press the injector to your neck. Immediately, your nerves tense and tingle in response as a several hundred infinitesimal pinpricks fill your blood vessels with the combined serum. It’s not painful but you involuntarily wince all the same.");
			output("\n\nA few seconds of holding it is interrupted by a <i>bee-buh beep</i> from the injector. Looks like it’s finished!");
			output("\n\nAnd not a second too soon as your limbs become stiff, thoughts become sluggish, and that bed you’re on has gotten... mighty... comfy right now... <i>zzz...</i>");
			output("\n\n");
			
			clearMenu();
			addButton(0, "Next", illumorpheneNext, arg);
		}
		public function illumorpheneNext(arg:Array):void
		{
			var target:Creature = arg[0];
			var option:String = arg[1];
			
			clearOutput();
			kGAMECLASS.showName("\n" + option.toUpperCase());
			author("SoAndSo");
			
			output("But you’re not quite asleep, just barely hanging on to consciousness. It’s enough to feel what’s undoubtedly going to change you, at least.");
			
			// Reduce/Increase height to a random point between 6' and 6' 7" for mostly male PC’s, 5' 10" and 6' 5" for mostly female PC’s.
			var setHeight:Number = (target.isMale() ? (72 + rand(8)) : (70 + rand(8)));
			// Reduce/increase tone to a random point between 20 and 40.
			var setTone:Number = (20 + rand(21));
			// Reduce/increase thickness to a random point between 10 and 25.
			var setThicc:Number = (10 + rand(16));
			
			// Face turns into ‘bug-mug’. Descriptors: angular, alien, insectoid.
			// Gains/changes antennae to mothrine antennae. Descriptors: feather-like, frilly, expressive.
			// Reduce/Increase total leg count to two.
			// Remove all tails.
			// Change legs to mothrine legs. Descriptors: slender, svelte, graceful, carapaced. Matches resultant skin/fur colour.
			// Change arms/hands to mothrine arms/hands. Descriptors: slender, svelte, thin, carapaced. Matches resultant skin/fur colour.
			// Change ears to membraned ears. Descriptors: round, unassuming, mothrine.
			
			// If PC has breasts, reduce/increase size to a point between B-cup and CC-cup.
			var setCups:Number = (2 + rand(3));
			
			// If PC has penis, change to mothipositor. Descriptors: smooth, flexible, solid, bow-curved. Matches resultant skin/fur colour.
			
			// Reduce/increase hip size to a random between 4 and 6.
			var setHips:Number = (4 + rand(3));
			// Reduce/increase butt size to a random point between 5 and 7.
			var setButt:Number = (5 + rand(3));
			
			// Regardless of choices, PC race becomes mothrine.
			
			var newWingStyle:int = 0;
			var newWingColor:String = "black";
			var newFurColor:String = "black";
			var newChitinColor:String = "black";
			var newNippleColor:String = "black";
			var newEyeColor:String = "black";
			var newHairColor:String = "black";
			var newManeColor:String = "black";
			
			output("\n\nThe [pc.skinFurScales] covering your body is the first thing to experience change. It all crinkles and dries out, forming visible cracks! It doesn’t hurt in the slightest. Rather, you feel a sense of weight being lifted as it degrades. Some time passes and your old dermis has completely dissolved, revealing the new <b>");
			
			target.skinType = GLOBAL.SKIN_TYPE_CHITIN;
			target.clearSkinFlags();
			
			switch(option)
			{
				// Venal
				// Grow/change wings. Wings become black and pink mothrine wings. Descriptors: folding, fragile, patterned, graceful.
				// Skin becomes onyx carapace. Descriptors: smooth, shiny, segmented.
				// Change nipples to onyx mothrine nipples. Descriptors: smooth, soft, seeping, mothrine.
				// Eyes turn into black moth-eyes. Descriptors: spheroid, black, abyssal, bulgy.
				// Change hair to pink mothrine down. Hair becomes straight.
				// (I’m not sure if this is doable): PC neck grows a boa-shaped growth of pink mothrine down.
				case "venal":
					output("black carapace");
					target.addSkinFlag(GLOBAL.FLAG_SMOOTH);
					newWingStyle = 0;
					newWingColor = "black and pink";
					newFurColor = "pink";
					newChitinColor = "onyx";
					newNippleColor = "onyx";
					newEyeColor = "black";
					newHairColor = "pink";
					newManeColor = "pink";
					break;
				
				// Verdant
				// Grow/change wings. Wings become emerald, furred mothrine wings. Descriptors: folding, fuzzy, patterned, graceful.
				// Skin becomes jade carapace. Descriptors: smooth, shiny, segmented.
				// Change nipples to emerald mothrine nipples. Descriptors: smooth, soft, seeping, mothrine.
				// Eyes turn into cyan mothrine eyes. Descriptors: spheroid, refractive, enchanting, bulgy.
				// Change hair to cyan mothrine down. Hair becomes straight.
				// (I’m not sure if this is doable): PC neck grows a boa-shaped growth of turquoise mothrine down.
				case "verdant":
					output("jade green carapace");
					target.addSkinFlag(GLOBAL.FLAG_SMOOTH);
					newWingStyle = GLOBAL.FLAG_FURRED;
					newWingColor = "emerald";
					newFurColor = "turquoise";
					newChitinColor = "jade";
					newNippleColor = "emerald";
					newEyeColor = "cyan";
					newHairColor = "cyan";
					newManeColor = "turquoise";
					break;
				
				// Voltaic
				// Grow/change wings. Wings become orange mothrine wings. Descriptors: folding, fragile, patterned, graceful.
				// Skin becomes crimson mothrine down. Descriptors: soft, gossamer, light.
				// Change nipples to orange mothrine nipples. Descriptors: smooth, soft, seeping, mothrine.
				// Eyes turn into white mothrine eyes. Descriptors: spheroid, reflective, opaline, bulgy.
				// Change hair to crimson mothrine down. Hair becomes straight.
				// (I’m not sure if this is doable): PC neck grows a boa-shaped growth of orange mothrine down.
				case "voltaic":
					output("downy crimson moth fur");
					target.addSkinFlag(GLOBAL.FLAG_FURRED);
					newWingStyle = 0;
					newWingColor = "orange";
					newFurColor = "crimson";
					newChitinColor = "crimson";
					newNippleColor = "orange";
					newEyeColor = "white";
					newHairColor = "crimson";
					newManeColor = "orange";
					break;
				
				// Vatic
				// Grow/change wings. Wings become white, furred mothrine wings. Descriptors: folding, fuzzy, patterned, graceful.
				// Skin becomes white mothrine down. Descriptors: soft, gossamer, light.
				// Change nipples to gray mothrine nipples. Descriptors: smooth, soft, seeping, mothrine.
				// Eyes turn into gold mothrine eyes. Descriptors: spheroid, reflective, radiant, bulgy.
				// Change hair to silver mothrine down. Hair becomes straight.
				// (I’m not sure if this is doable): PC neck grows a boa-shaped growth of white mothrine down.
				case "vatic":
					output("downy white moth fur");
					target.addSkinFlag(GLOBAL.FLAG_FURRED);
					newWingStyle = GLOBAL.FLAG_FURRED;
					newWingColor = "white";
					newFurColor = "white";
					newChitinColor = "white";
					newNippleColor = "gray";
					newEyeColor = "gold";
					newHairColor = "silver";
					newManeColor = "white";
					break;
			}
			output("!</b>");
			
			target.scaleColor = newChitinColor;
			target.furColor = newFurColor;
			
			output("\n\nYour limbs and bones feel something similar: a loss of mass coinciding with the sensation of lightness. Your limbs, body and [pc.face] pulse and twitch as they’re all morphed at the base level into something new and unfamiliar. You close your eyes as the changes overtake you, realizing that they also ache with the promise of change! Even your nose feels odd to breathe through but it’s something you can adjust to quickly. After a few minutes, the intense palsy in your body subsides, so you take a glance to inspect your skinny, lithe <b>moth-like legs and arms!</b> Placing a freshly remodeled hand where you think your nose is, you feel for your <b>mothrine face!</b> On top of that, <b>you’re also " + (target.tallness < setHeight ? "taller" : "shorter") + "!</b>");
			if(target.legCount > 2) output(" However, It appears the rest of your legs have dissolved away, much like your old skin...");
			
			target.faceType = GLOBAL.TYPE_MOTHRINE;
			target.clearFaceFlags();
			target.addFaceFlag(GLOBAL.FLAG_ANGULAR);
			
			target.earLength = 0;
			target.earType = GLOBAL.TYPE_MOTHRINE;
			
			target.tongueType = GLOBAL.TYPE_MOTHRINE;
			target.clearTongueFlags();
			target.addTongueFlag(GLOBAL.FLAG_LONG);
			target.addTongueFlag(GLOBAL.FLAG_HOLLOW);
			
			target.hairType = GLOBAL.HAIR_TYPE_REGULAR;
			target.hairColor = newHairColor;
			if(target.hairLength > 0) target.hairStyle = "straight";
			else target.hairStyle = "null";
			
			target.armType = GLOBAL.TYPE_MOTHRINE;
			target.clearArmFlags();
			target.addArmFlag(GLOBAL.FLAG_CHITINOUS);
			//target.addArmFlag(GLOBAL.FLAG_FURRED);
			
			target.legType = GLOBAL.TYPE_MOTHRINE;
			target.clearLegFlags();
			target.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			target.addLegFlag(GLOBAL.FLAG_SMOOTH);
			target.addLegFlag(GLOBAL.FLAG_CHITINOUS);
			//target.addLegFlag(GLOBAL.FLAG_FURRED);
			target.legCount = 2;
			target.genitalSpot = 0;
			
			target.hipRatingRaw = setHips;
			target.buttRatingRaw = setButt;
			
			target.tone = setTone;
			target.thickness = setThicc;
			target.tallness = setHeight;
			
			output("\n\nThere’s an altogether weirder feeling in your " + (!target.hasDickNipples() ? "[pc.nipples]" : "[pc.dickNipples]") + ". Before your eyes, they appear to meld into the surface of your [pc.chest], becoming a color-blended patch of sensitive flesh. Your areola appear to have essentially vanished, leaving a discolored, protudent patch where your nipples should be. You now have <b>membranous " + newNippleColor + " nipples!</b>");
			
			var bIdx:int = 0;
			target.nipplesPerBreast = 1;
			target.nippleLengthRatio = 1;
			for(bIdx = 0; bIdx < target.breastRows.length; bIdx++)
			{
				target.breastRows[bIdx].nippleType = GLOBAL.NIPPLE_TYPE_FLAT;
			}
			target.nippleColor = newNippleColor;
			
			if(target.hasBreasts())
			{
				output("\n\nYour [pc.breasts] aren’t left out of this, a soothing flush in your milkers tells you they’ve certainly changed. <b>They’ve " + (target.breastRows[target.biggestTitRow()].breastRatingRaw > setCups ? "shrunk" : "grown") + " to");
				
				for(bIdx = 0; bIdx < target.breastRows.length; bIdx++)
				{
					target.breastRows[bIdx].breastRatingRaw = setCups;
				}
				
				output(" " + target.breastCup(target.biggestTitRow()) + "s!</b>");
			}
			
			if(target.hasCock())
			{
				output("\n\nYour [pc.cock] twitches and tenses on its own accord, the surface and inner muscle tissue hardening, but not with arousal! The consistent sense of mass-loss is present but thankfully, you can tell that it’s not in length and width. Instead, <b>you’ve now got a semi-hollow, solid and flexible mothipositor!</b> It softens and retracts, returning to a shrunken state.");
				if(target.cocks.length == 2) output(" Not only that, but your other cock follows suit and transforms into a similar shape!");
				else if(target.cocks.length > 1) output(" Not only that, but the rest of your cocks follow suit, each one transforming similarly!");
				
				for(var cIdx:int = 0; cIdx < target.cocks.length; cIdx++)
				{
					target.shiftCock(cIdx, GLOBAL.TYPE_MOTHRINE);
					target.cocks[cIdx].cockColor = newNippleColor;
				}
			}
			if(target.balls > 0)
			{
				if(target.ballsUnlocked(0))
				{
					output("\n\nYou feel a slight bloating sensation in your mid section and a tightening tension in your [pc.sack]. Looking at your groin, you discover your [pc.balls] shrinking smaller and smaller until there is nothing left besides flat skin... It looks like <b>your testicles have now become internal!</b>");
					
					target.makeBallsInternal();
				}
				else output("\n\n" + target.ballsLockedMessage());
			}
			
			if(target.hasTail())
			{
				if(target.tailCountUnlocked(0))
				{
					output("\n\nThere’s a strange numbness at the lowest point of your back, right on your coccyx. Uh oh, your [pc.tails]! There’s so little physical feedback remaining that you can only assume that " + (target.tailCount == 1 ? "it has" : "they have") + " been removed entirely!");
					
					target.removeTails();
				}
				else output("\n\n" + target.tailCountLockedMessage());
			}
			
			if(target.hasWings()) output("\n\nOdd and uncomfortable sensations flow through the [pc.wings] on your back. As you’re on said back, it’s hard to tell exactly what’s happening to them but they feel... softer? In an effort to stop the discomfort");
			else output("\n\nThe spaces between your spine and shoulders tingle and burn with the feeling of new matter sprouting forth. In an effort to stop the discomfort");
			output(", you push your upper body forward just enough to make room for your new <b>" + newWingColor + " moth wings!</b>");
			
			target.removeWings();
			target.shiftWings(GLOBAL.TYPE_MOTHRINE, 4);
			
			// "Wing Style"
			// v1: shape style
			// tooltip: custom color
			target.createStatusEffect("Wing Style", 0, 0, 0, 0, true, "", "", false, 0);
			target.setStatusValue("Wing Style", 1, newWingStyle);
			target.setStatusValue("Wing Style", 2, 0);
			target.setStatusValue("Wing Style", 3, 0);
			target.setStatusValue("Wing Style", 4, 0);
			target.setStatusTooltip("Wing Style", newWingColor);
			
			output("\n\nAn ache in your [pc.eyes] grows all of a sudden. You can feel them pressing against your eyelids as they close involuntarily. In just as sudden a motion, the ache fades and you reactively open your eyelids. Does everything seem a little bit brighter or... richer in color? It seems that you now have <b>bulgy " + newEyeColor + " moth eyes!</b>");
			
			target.eyeType = GLOBAL.TYPE_MOTHRINE;
			target.eyeColor = newEyeColor;
			
			output("\n\nAround your neck, new follicles and feelings clamber through your [pc.skinFurScales]. A few moments of flesh irritation give way to soft, unbelievably light strands of fuzzy down. <b>It’s formed " + indefiniteArticle(newFurColor) + " feather boa around your neck!</b>");
			// Cosmetic Perk: "Regal Mane"
			// v1: Mane appearance type (set by global type flag)
			target.createPerk("Regal Mane", 0, 0, 0, 0, "You have an impressive mane bordering your neck.");
			target.setPerkValue("Regal Mane", 1, GLOBAL.FLAG_FEATHERED);
			
			output("\n\nThe swirling chemicals, biomass and biological feedback within you seems to be subsiding. There’s one more focal point of pain left, however.");
			
			if(target.hasAntennae()) output("\n\nA sharp spike of discomfort zips through your [pc.antennae] and they start to feel heavier! You can feel your head lurch slightly forward as their new mass comes into existence. Looking up, you can see that you have a beautiful <b>set of moth antennae!</b>");
			else output("\n\nRight on top of your " + (kGAMECLASS.silly ? "4-head" : "forehead") + ", the pain seems to bloom outwards into material weight! The new mass makes your head bend forward and you’re inclined to eyeball what has changed: You’ve grown a beautiful <b>set of moth antennae!</b>");
			
			target.removeAntennae();
			target.antennaeType = GLOBAL.TYPE_MOTHRINE;
			target.antennae = 2;
			
			output("\n\nAfter the changes, you give yourself a final once-over before continuing your day.");
			output("\n\n");
			
			// 6 hours of in game time passes.
			kGAMECLASS.processTime(6 * 58);
			//kGAMECLASS.genericSleep(360);
			
			clearMenu();
			addButton(0, "Next", kGAMECLASS.useItemFunction);
		}
		
		public function illumorpheneCancel(target:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("\nILLUMORPHEME");
			author("SoAndSo");
			
			output("On second thought, you’re not quite prepared to do this thing now. You stow away the box with your other belongings and move on.");
			output("\n\n");
			
			if (!kGAMECLASS.infiniteItems()) kGAMECLASS.itemCollect([new Illumorphene()]);
			else
			{
				clearMenu();
				addButton(0,"Next",kGAMECLASS.useItemFunction);
			}
		}
	}
}

