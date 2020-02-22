package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.num2Ordinal;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.RandomInCollection;
	
	public class PleasurePalette extends ItemSlotClass
	{
		//constructor
		public function PleasurePalette()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "P. Pal";
			longName = "Pleasure Palette Permapaint";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a metallic tube with the image of a color wheel adorning its surface";
			tooltip = "A toggleable cream designed to give your funbits a bit more flair. After popular demand and sufficient R&D, the popular permapaint has now been re-released with bioluminescent variants!";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 4800;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			// Location: Uveto, sold by Lessau (Temporarily)
			
			if(target is PlayerCharacter)
			{
				introMenu(target, true);
				return true;
			}
			else
			{
				clearOutput();
				output(target.capitalA + target.short + " uses the permapaint to no effect.");
			}
			return false;
		}
		
		private function lipTypeString(colorType:String = "lip"):String
		{
			if(colorType == "lipple") return "lipples";
			return "lips";
		}
		
		private function introMenu(target:Creature, introText:Boolean = false):void
		{
			clearOutput();
			kGAMECLASS.showName("PLEASURE\nPALETTE");
			author("Lodestar");
			
			// Consumption
			if(introText) output("You retrieve the canister from your inventory and give it a quick once-over, noting the gold dial that comprises the bottom of the chrome tube. You begin to fiddle around with the dial as you ponder which color you’d like to use...");
			else output("You look back at the color wheel...");
			
			rbgMenu(target);
		}
		private function rbgMenu(target:Creature):void
		{
			clearMenu();
			addButton(0, "“Terran”", rbgSelColor, [target, "terran"]);
			addButton(1, "Vibrant", rbgSelColor, [target, "vibrant"]);
			addButton(2, "Metallic", rbgSelColor, [target, "metallic"]);
			addButton(3, "Glowing", rbgSelColor, [target, "glowing"]);
			addButton(14, "Back", rbgCancel, target);
		}
		
		private function rbgCancel(target:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("PLEASURE\nPALETTE");
			author("Lodestar");
			
			output("You put the permapaint back into your inventory.\n\n");
			if (!kGAMECLASS.infiniteItems()) kGAMECLASS.itemCollect([new PleasurePalette()]);
			else
			{
				clearMenu();
				addButton(0,"Next",kGAMECLASS.useItemFunction);
			}
		}
		
		private function rbgSelColor(arg:Array):void
		{
			var target:Creature = arg[0];
			var colorType:String = arg[1];
			var colorList:Array = [];
			var i:int = 0;
			var btnSlot:int = 0;
			
			clearOutput();
			kGAMECLASS.showName(colorType.toUpperCase() + "\nCOLORS");
			author("Lodestar");
			
			output("What color do you choose?\n\n");
			
			switch(colorType)
			{
				case "terran":
					colorList.push(["pale", "Pale"]);
					colorList.push(["fair", "Fair"]);
					colorList.push(["tan", "Tan"]);
					colorList.push(["olive", "Olive"]);
					colorList.push(["dusky", "Dusky"]);
					colorList.push(["dark", "Dark"]);
					colorList.push(["ebony", "Ebony"]);
					break;
				case "vibrant":
					colorList.push(["red", "Red"]);
					colorList.push(["dark red", "Dark Red"]);
					colorList.push(["orange", "Orange"]);
					colorList.push(["pale green", "Pale Green"]);
					colorList.push(["viridescent", "Viridescent"]);
					colorList.push(["aqua", "Aqua"]);
					colorList.push(["sky blue", "Sky Blue"]);
					colorList.push(["blue", "Blue"]);
					colorList.push(["purple", "Purple"]);
					colorList.push(["pink", "Pink"]);
					colorList.push(["black", "Black"]);
					colorList.push(["white", "White"]);
					colorList.push(["black and white", "B & W"]);
					colorList.push(["black and yellow", "B & Y"]);
					break;
				case "metallic":
					colorList.push(["bronze", "Bronze"]);
					colorList.push(["silver", "Silver"]);
					colorList.push(["gold", "Gold"]);
					colorList.push(["platinum", "Platinum"]);
					colorList.push(["onyx", "Onyx"]);
					colorList.push(["brass", "Brass"]);
					colorList.push(["cobalt", "Cobalt"]);
					colorList.push(["candy red", "Candy Red"]);
					colorList.push(["emerald", "Emerald"]);
					break;
				case "glowing":
					colorList.push(["glowing red", "G.Red"]);
					colorList.push(["glowing orange", "G.Orange"]);
					colorList.push(["glowing amber", "G.Amber"]);
					colorList.push(["glowing gold", "G.Gold"]);
					colorList.push(["glowing pink", "G.Pink"]);
					colorList.push(["luminous silver", "L.Silver"]);
					colorList.push(["luminous green", "L.Green"]);
					colorList.push(["luminous cyan", "L.Cyan"]);
					colorList.push(["luminous blue", "L.Blue"]);
					colorList.push(["luminous violet", "L.Violet"]);
					colorList.push(["hot white", "H. White"]);
					if(target.level >= 6 || target.hasItemByClass(Foxfire)) colorList.push(["glowing ember", "Foxfire"]);
					if(target.level >= 6 || target.hasItemByClass(Frostfire)) colorList.push(["fiery blue", "Frostfire"]);
					break;
			}
			
			// All of these just go to the same Second Consumption Text because I made it nondescript.
			kGAMECLASS.clearMenu();
			for(i = 0; i < colorList.length; i++)
			{
				if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
				{
					addButton(btnSlot, "Back", introMenu, target);
					btnSlot++;
				}
				
				addButton(btnSlot, colorList[i][1], partMenu, [target, colorType, colorList[i][0]], StringUtil.toDisplayCase(colorList[i][0]), ("Select " + colorList[i][0] + "."));
				btnSlot++;
				
				if(colorList.length > 14 && (i + 1) == colorList.length)
				{
					while((btnSlot + 1) % 15 != 0) { btnSlot++; }
					addButton(btnSlot, "Back", introMenu, target);
				}
			}
			addButton(14, "Back", introMenu, target);
		}
		
		private function partMenu(arg:Array):void
		{
			var target:Creature = arg[0];
			var colorType:String = arg[1];
			var newColor:String = arg[2];
			
			clearOutput();
			kGAMECLASS.showName("SELECT\nPART");
			author("Lodestar");
			
			output("With your preferred color in mind, <b>" + newColor + "</b>, you now begin to ponder just <i>where</i> you’d like to apply it.");
			
			clearMenu();
			
			if(target.hasNipples())
			{
				if(target.nippleColor == newColor) addDisabledButton(0, "Nipples", "Nipples", ("Your [pc.nipplesNoun] are already " + newColor + "!"));
				else addButton(0, "Nipples", permaPaintNipples, [target, colorType, newColor], "Nipples", ("Change the color of your [pc.nipplesNoun] to " + newColor + "."));
			}
			else addDisabledButton(0, "Nipples", "Nipples", "You need nipples for this.");
			
			if(target.hasCock())
			{
				if(target.cocks.length == 1)
				{
					if(target.cocks[0].cockColor == newColor) addDisabledButton(1, "Penis", "Penis", ("Your [pc.cockNoun 0] is already " + newColor + "!"));
					else addButton(1, "Penis", permaPaintPenis, [target, colorType, newColor, 0], "Penis", ("Change the color of your [pc.cockNoun 0] to " + newColor + "."));
				}
				else addButton(1, "Penis", penisSelect, [target, colorType, newColor], "Penis", "Select which penis to recolor.");
			}
			else addDisabledButton(1, "Penis", "Penis", "You need a penis for this.");
			
			if(target.hasVagina())
			{
				if(target.vaginas.length == 1)
				{
					if(target.vaginas[0].vaginaColor == newColor) addDisabledButton(2, "Vagina", "Vagina", ("Your [pc.vaginaNoun 0] is already " + newColor + "!"));
					else addButton(2, "Vagina", permaPaintVagina, [target, colorType, newColor, 0], "Vagina", ("Change the color of your [pc.vaginaNoun 0] to " + newColor + "."));
				}
				else addButton(2, "Vagina", vaginaSelect, [target, colorType, newColor], "Vagina", "Select which vagina to recolor.");
			}
			else addDisabledButton(2, "Vagina", "Vagina", "You need a vagina for this.");
			
			if(target.hasTailGenital())
			{
				if(target.tailGenitalColor == newColor) addDisabledButton(3, "Tail Genital", "Tail Genital", ("Your tail genital" + (target.tailCount == 1 ? " is" : "ia are") + " already " + newColor + "!"));
				else addButton(3, "Tail Genital", permaPaintTailGenital, [target, colorType, newColor], "Tail Genital", ("Change the color of your tail genital" + (target.tailCount == 1 ? "" : "ia") + " to " + newColor + "."));
			}
			else addDisabledButton(3, "Tail Genital", "Tail Genital", "You need a tail genital for this.");
			
			addButton(14, "Back", rbgSelColor, [target, colorType]);
		}
		
		private function penisSelect(arg:Array):void
		{
			var target:Creature = arg[0];
			var colorType:String = arg[1];
			var newColor:String = arg[2];
			var i:int = 0;
			var x:int = 0;
			var btnSlot:int = 0;
			
			clearOutput();
			kGAMECLASS.showName("SELECT\nPENIS");
			author("Lodestar");
			
			output("Which penis do you choose?\n");
			
			// All of these just go to the same Second Consumption Text because I made it nondescript.
			kGAMECLASS.clearMenu();
			for(i = 0; i < target.cocks.length; i++)
			{
				if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
				{
					addButton(btnSlot, "Back", partMenu, [target, colorType, newColor]);
					btnSlot++;
				}
				
				output("\n<b>" + StringUtil.capitalize(num2Ordinal(i + 1)) + " Cock:</b>");
				if(target.cocks[i].cockFlags.length > 0)
				{
					for(x = 0; x < target.cocks[i].cockFlags.length; x++)
					{
						output(" " + GLOBAL.FLAG_NAMES[target.cocks[i].cockFlags[x]] + ",");
					}
				}
				if(target.cocks[i].cockColor != "") output(" " + StringUtil.toDisplayCase(target.cocks[i].cockColor) + ",");
				output(" " + GLOBAL.TYPE_NAMES[target.cocks[i].cType]);
				
				if(target.cocks[i].cockColor == newColor) addDisabledButton(btnSlot, ("Cock " + (i + 1)), (StringUtil.capitalize(num2Ordinal(i + 1)) + " Cock"), ("Your [pc.cockNoun " + i + "] is already " + newColor + "!"));
				else addButton(btnSlot, ("Cock " + (i + 1)), permaPaintPenis, [target, colorType, newColor, i], (StringUtil.capitalize(num2Ordinal(i + 1)) + " Cock"), ("Change the color of your [pc.cockNoun " + i + "] to " + newColor + "."));
				btnSlot++;
				
				if(target.cocks.length > 14 && (i + 1) == target.cocks.length)
				{
					while((btnSlot + 1) % 15 != 0) { btnSlot++; }
					addButton(btnSlot, "Back", partMenu, [target, colorType, newColor]);
				}
			}
			addButton(14, "Back", partMenu, [target, colorType, newColor]);
		}
		
		private function vaginaSelect(arg:Array):void
		{
			var target:Creature = arg[0];
			var colorType:String = arg[1];
			var newColor:String = arg[2];
			var i:int = 0;
			var x:int = 0;
			var btnSlot:int = 0;
			
			clearOutput();
			kGAMECLASS.showName("SELECT\nVAGINA");
			author("Lodestar");
			
			output("Which vagina do you choose?\n");
			
			// All of these just go to the same Second Consumption Text because I made it nondescript.
			kGAMECLASS.clearMenu();
			for(i = 0; i < target.vaginas.length; i++)
			{
				if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
				{
					addButton(btnSlot, "Back", partMenu, [target, colorType, newColor]);
					btnSlot++;
				}
				
				output("\n<b>" + StringUtil.capitalize(num2Ordinal(i + 1)) + " Vagina:</b>");
				if(target.vaginas[i].vagooFlags.length > 0)
				{
					for(x = 0; x < target.vaginas[i].vagooFlags.length; x++)
					{
						output(" " + GLOBAL.FLAG_NAMES[target.vaginas[i].vagooFlags[x]] + ",");
					}
				}
				if(target.vaginas[i].vaginaColor != "") output(" " + StringUtil.toDisplayCase(target.vaginas[i].vaginaColor) + ",");
				output(" " + GLOBAL.TYPE_NAMES[target.vaginas[i].type]);
				
				if(target.vaginas[i].vaginaColor == newColor) addDisabledButton(btnSlot, ("Vagina " + (i + 1)), (StringUtil.capitalize(num2Ordinal(i + 1)) + " Vagina"), ("Your [pc.vaginaNoun " + i + "] is already " + newColor + "!"));
				else addButton(btnSlot, ("Vagina " + (i + 1)), permaPaintVagina, [target, colorType, newColor, i], (StringUtil.capitalize(num2Ordinal(i + 1)) + " Vagina"), ("Change the color of your [pc.vaginaNoun " + i + "] to " + newColor + "."));
				btnSlot++;
				
				if(target.vaginas.length > 14 && (i + 1) == target.vaginas.length)
				{
					while((btnSlot + 1) % 15 != 0) { btnSlot++; }
					addButton(btnSlot, "Back", partMenu, [target, colorType, newColor]);
				}
			}
			addButton(14, "Back", partMenu, [target, colorType, newColor]);
		}
		
		private function tfDone():void
		{
			clearMenu();
			addButton(0, "Next", kGAMECLASS.useItemFunction);
		}
		
		// Nipple Colorizing
		private function permaPaintNipples(arg:Array):void
		{
			var target:Creature = arg[0];
			var colorType:String = arg[1];
			var newColor:String = arg[2];
			var isLactating:Boolean = (target.isLactating());
			var isFuckable:Boolean = (target.hasCuntNipples(0) || target.hasLipples(0));
			var isStrokeable:Boolean = ((target.hasNormalNipples(0) && target.nippleLength(0) >= 3) || target.hasNippleCocks(0) || target.hasTentacleNipples(0));
			
			clearOutput();
			kGAMECLASS.showName("PERMAPAINT\nNIPPLES");
			author("Lodestar");
			
			output("You give the canister a good shake and pop the cap, exposing the nozzle. Following the instructions printed on the can, you spray the contents of the " + RandomInCollection(["can", "tube", "chrome cylinder"]) + " directly onto your [pc.nippleColor] [pc.nipplesNoun]. To your surprise, rather than coming out as a mist akin to spray paint, the coloring agent instead pours onto your nipples as a " + newColor + " gel.");
			// Multiple breast rows:
			if(target.bRows() > 1) output(" You then proceed to repeat the process for your other row" + (target.bRows() > 2 ? "s" : "") + " of [pc.nipples 1].");
			output(" Once the gel’s been given a few seconds to set, you begin to work it into your [pc.nipplesNoun]. A tingling sensation radiates through your [pc.nipples] as the " + newColor + " colorizer gets to work. You idly play with your nipples, the heat of arousal radiating through your [pc.chest].");
			// Lactating:
			if(isLactating)
			{
				output("\n\nWhile you’re hardly surprised, you can’t help but shake your head as [pc.milkNoun] begins to bead upon your [pc.nipples]. Smirking, you continue to play with your [pc.milkyNipples],");
				if(isFuckable) output(" fingering");
				else if(isStrokeable) output(" stroking");
				else output(" pinching");
				output(" your sensitive teats in an effort to draw out your motherly bounty while your attentions are focused on them. You feel the warmth in your [pc.fullChest] grow ever stronger as your skillful ministrations continue, watching with curiosity as your [pc.nipples] change color from [pc.nippleColor] to " + newColor);
				if(colorType == "glowing") output(", glowing brighter as you feel yourself beginning to approach glorious boobgasm");
				output(". You shudder, sucking air between your teeth as your [pc.fullChest] " + (!target.canMilkSquirt() ? "squirt" : "fountain") + " [pc.milk]. You heave a sigh of relief as some of the fluid weight of your [pc.chest] is relieved, even if only for now.");
				
				// Milk fullness reset
				if(isLactating) target.milked(100);
			}
			// Not Lactating:
			else
			{
				output("\n\nYour ministrations only grow more fierce as the warmth radiating through your [pc.fullChest] grows stronger, matching the pace at which your");
				if(isFuckable || isStrokeable) output(" gradually scintillating");
				output(" [pc.nipplesNoun] are beginning to take on their new color. Low moans escape your [pc.lipsChaste] as you tend to your " + RandomInCollection(["aching", "tender", "sweltering"]) + " nipples, attempting to soothe yourself as you");
				if(isFuckable) output(" finger");
				else if(isStrokeable) output(" stroke");
				else output(" pinch and twist");
				output(" them.");
			}
			// Genitalia:
			if(target.hasGenitals())
			{
				var hasCock:Boolean = (target.hasCock());
				var hasVagina:Boolean = (target.hasVagina());
				var totalGenitals:int = (target.totalGenitals());
				
				output("\n\nAlthough ignored due to your nipple-related attentions, your");
				if(hasVagina) output(" [pc.cunts]");
				if(hasVagina && hasCock) output(" and");
				if(hasCock) output(" [pc.cocks]");
				output(" reach" + (totalGenitals == 1 ? "es its" : " their") + " own peak. Driven to sympathetic orgasm,");
				if(hasCock) output(" [pc.eachCock]");
				if(hasVagina && hasCock) output(" and");
				if(hasVagina) output(" [pc.eachVagina]");
				output(" release" + (totalGenitals == 1 ? "s its" : " their"));
				if(hasCock) output(" [pc.cum]");
				if(hasVagina && hasCock) output(" and");
				if(hasVagina) output(" [pc.girlCum]");
				if(isLactating) output(", adding to the mess you’ve already managed to make with your [pc.milkNoun]");
				output(".");
				// Auto-autofellatio perk
				if(hasCock && target.canAutoFellate(-1) && target.hasPerk("Auto-Autofellatio"))
				{
					// High/Low Reflex:
					if(target.RQ() >= 50)
					{
						output(" Luckily, your knowledge of your body and quick reaction time allows you ample time to direct the flow of your [pc.cum] towards your waiting maw, preventing any further mess from being made while rewarding yourself with a well-earned meal.");
						
						target.loadInMouth(target);
					}
					else
					{
						output(" You’re kicking yourself as your lusty haze begins to clear, realizing that you’ve wasted perfectly good [pc.cumNoun].");
						// Lots of cum:
						if(target.cumQ() >= 10000) output(" You could’ve fed a whole family of Galotians with that [pc.cumNoun]!");
						else output(" There are people in Rush space who might’ve been very grateful for a meal like that!");
					}
				}
			}
			// No Genitals, no lactation:
			else if(!isLactating)
			{
				output("\n\nHowever, much as you try, you’re left frustrated as you realize that your nipples by themselves aren’t enough for you to find release.");
			}
			output("\n\nOnce your [pc.nipples] have finally settled into their new color, you");
			if(isStrokeable) output(" give them a few final strokes");
			else if(isFuckable) output(" run a finger along their plump lips");
			else output(" take the time to admire their new hue");
			output(", excited for the next time you’ll get to properly show them off. <b>Your [pc.nipples] are now " + newColor + "!</b>");
			
			target.nippleColor = newColor;
			
			// Genitalia/Lactation: Lust Reset
			if(target.hasGenitals() || isLactating)
			{
				target.orgasm();
			}
			// 20 Lust Gain
			else
			{
				target.changeLust(20);
			}
			
			tfDone();
		}
		
		// Penis Colorizing
		private function permaPaintPenis(arg:Array):void
		{
			var target:Creature = arg[0];
			var colorType:String = arg[1];
			var newColor:String = arg[2];
			var cIdx:int = arg[3];
			var lottaCum:Boolean = (target.cumQ() >= 1000);
			
			clearOutput();
			kGAMECLASS.showName("PERMAPAINT\nPENIS");
			author("Lodestar");
			
			output("You give the canister a good shake and pop the cap, exposing the nozzle. Following the instructions printed on the can, you spray the contents of the " + RandomInCollection(["can", "tube", "chrome cylinder"]) + " directly onto your [pc.cock " + cIdx + "], shivering as cool, " + newColor + " gel globs onto your shaft.");
			// dumb large cock:
			if(target.cockVolume(cIdx) >= 2000) output(" You try your best to spread as much of the gel as you can along your length, hoping that it’ll be enough to properly cover your full surface area when you work it into a proper lather.");
			output(" Satisfied with the amount of coloring gel, you begin to work it around your shaft by hand, growing harder as heat begins to work its way through your loins. Your lust builds to a fever pitch as your");
			// Metallic color selected:
			if(colorType == "metallic") output(" [pc.cockNoun " + cIdx + "] begins to take on a more reflective shine, gaining a " + newColor + " hue to match");
			// Glowing color selected:
			else if(colorType == "glowing") output(" [pc.cockNoun " + cIdx + "] begins to glow brighter, the light emanating from your shaft growing in intensity until it takes on a " + newColor + " hue");
			// "Terran"/"Vibrant" color selected:
			else output(" [pc.cockNoun " + cIdx + "]’s color begins to shift from [pc.cockColor " + cIdx + "] to " + newColor);
			output(".");
			output("\n\nAll the while, you’ve been furiously jerking yourself off, uncaring if anyone sees or hears you. Your climax and the settling of your cock’s new " + newColor + " finish come simultaneously,");
			// Auto-autofellatio perk:
			if(target.hasCock() && target.canAutoFellate(-1) && target.hasPerk("Auto-Autofellatio"))
			{
				output(" and you angle your [pc.cock " + cIdx + "] towards your [pc.lips], determined not to waste a drop of your precious [pc.cum]. Your [pc.eyes] roll back as " + (!lottaCum ? "spurts" : "a geyser") + " of [pc.cumFlavor] seed paint" + (!lottaCum ? "" : "s") + " the back of your throat, which you suck down enthusiastically.");
				
				// Orally Filled and Cum Splattered
				target.loadInMouth(target);
				//if(lottaCum) target.applyCumSoaked();
			}
			else
			{
				output(" prompting you to let out a sensuous moan as [pc.cum] " + (!lottaCum ? "spurts" : "fountains") + " from your [pc.cock " + cIdx + "], painting the ground in front of you [pc.cumColor].");
			}
			output("\n\nPanting, you wipe the sweat from your brow as you admire your <b>new, " + newColor + " cock!</b>");
			
			target.cocks[cIdx].cockColor = newColor;
			
			// Lust Reset, Empty Balls
			target.orgasm();
			
			tfDone();
		}
		
		// Vagina Colorizing
		private function permaPaintVagina(arg:Array):void
		{
			var target:Creature = arg[0];
			var colorType:String = arg[1];
			var newColor:String = arg[2];
			var vIdx:int = arg[3];
			var canSquirt:Boolean = (target.isSquirter(vIdx));
			
			clearOutput();
			kGAMECLASS.showName("PERMAPAINT\nVAGINA");
			author("Lodestar");
			
			output("You give the canister a good shake and pop the cap, exposing the nozzle. Following the instructions printed on the can, you spray the contents of the " + RandomInCollection(["can", "tube", "chrome cylinder"]) + " directly onto your [pc.vagina " + vIdx + "], jumping a bit as the cold gel touches your [pc.vaginaColor " + vIdx + "] pussylips. You massage the gel into your folds, making sure to coat every nook and cranny as the heat working through your [pc.groin] has begun to work you into a frenzy.");
			output("\n\n[pc.GirlCum] " + (!canSquirt ? "drips" : "gushes") + " from your [pc.vaginaNoun " + vIdx + "] as you vigorously frig yourself under the auspices of making sure you’ve coated yourself as thoroughly as you can. Your climax hits just as your [pc.vagina]");
			// Metallic:
			if(colorType == "metallic") output("’s metallic " + newColor + " settles in, glistening with a coating of femslime");
			// Glowing:
			else if(colorType == "glowing") output(" finally reaches its most effulgent point, its " + newColor + " light burning almost as hot as your lusts");
			// "Terran"/"Vibrant":
			else output(" has fully adopted its new, " + newColor + " finish");
			output(". You let out a thunderous roar of pleasure as your [pc.vaginaNoun " + vIdx + "] clenches around your dexterous fingers");
			// gabilani vagina:
			if(target.vaginas[vIdx].type == GLOBAL.TYPE_GABILANI) output(", threatening to pull your entire hand into its clutching embrace");
			output(". [pc.GirlCum] " + (!canSquirt ? "drips freely" : "gushes powerfully") + " onto the ground below, leaving a");
			if(target.girlCumQ() >= 1000) output(" sizeable");
			output(" puddle between your feet. ");
			output("\n\nBasking in the afterglow of your release, you give your <b>new " + newColor + " pussy</b> a few parting pets, excited for when you’ll get to give it a proper unveiling.");
			
			target.vaginas[vIdx].vaginaColor = newColor;
			
			// Lust Reset
			target.orgasm();
			
			tfDone();
		}
		
		// Tailcock/Tailcunt Colorizing 
		private function permaPaintTailGenital(arg:Array):void
		{
			var target:Creature = arg[0];
			var colorType:String = arg[1];
			var newColor:String = arg[2];
			var tailCock:Boolean = (target.hasTailCock());
			var isParasite:Boolean = (target.hasParasiteTail());
			
			clearOutput();
			kGAMECLASS.showName("PERMAPAINT\nTAIL" + (tailCock ? "COCK" : "CUNT"));
			author("Lodestar");
			
			output("You give the canister a good shake and pop the cap, exposing the nozzle. As you take note of the instructions printed on the chrome tube, you swing your [pc.tails] into view, determined to give your " + (tailCock ? "[pc.tailCocks]" : "[pc.tailCunts]") + " a brand new " + newColor + " paintjob.");
			if(isParasite)
			{
				if(target.tailCount ==1) output("\n\nYou’re flummoxed for a moment by your alien appendage’s refusal to sit still, although it isn’t long before you’ve wrangled the tricky little bugger into a proper position. Satisfied that you will see no more squirming out of your [pc.tail] for now, you promptly apply the gel to the " + (tailCock ? "[pc.tailCock]" : "[pc.tailCunt]") + ". Almost as soon as the " + newColor + " permapaint is applied, your parasitic appendage threatens to break free of the hold you’ve placed on it. You try your best to rub the gel into it before it finally slips from your grasp, " + (tailCock ? "spraying jizz" : "fountaining femcum") + " into the air as it whips about.");
				else output("\n\nYou’re flummoxed for a moment by your alien appendages’ refusal to sit still, although it isn’t long before you’ve wrangled the tricky little buggers into a proper position. Satisfied that you will see no more squirming out of your [pc.tails] for now, you promptly apply the gel to the " + (tailCock ? "[pc.tailCocks]" : "[pc.tailCunts]") + ". Almost as soon as the " + newColor + " permapaint is applied, your parasitic appendages threaten to break free of the hold you’ve placed on them. You try your best to rub the gel into them before they finally slip from your grasp, " + (tailCock ? "spraying jizz" : "fountaining femcum") + " into the air as they whip about.");
			}
			else
			{
				output("\n\nTaking");
				if(target.tailCount > 1) output(" one of");
				output(" your [pc.tails] into your grasp, you coax out your " + (tailCock ? "[pc.tailCock]" : "[pc.tailCunt]") + " in order to apply the permapaint directly. You spray the " + newColor + " gel on with minimal issue, although you do take note of the heat that begins to radiate from the " + (tailCock ? "[pc.tailCock]" : "[pc.tailCunt]") + " all the way through to where it begins to meet your spine.");
				// multiple tails:
				if(target.tailCount > 1)
				{
					output(" You repeat the process for");
					if(target.tailCount > 2) output(" each of");
					output(" your other tail");
					if(target.tailCount > 2) output("s");
					output(", greeted by the same tingling warmth at the small of your back as the first.");
				}
			}
			output("\n\n");
			if(isParasite) output("After witnessing your parasitic tail" + (target.tailCount == 1 ? "’s" : "s’") + " frenzied eruption, y");
			else output("Y");
			output("ou are pleased to see that <b>your " + (tailCock ? "[pc.tailCocks]" : "[pc.tailCunts]") + " " + (target.tailCount == 1 ? "has" : "have") + " taken on a fantastic, new " + newColor + " hue!</b>");
			// non-parasitic:
			if(!isParasite)
			{
				output(" Perhaps you should see about finding someone to try them out on soon.");
				// ifGlowing:
				if(colorType == "glowing") output(" Their bright glow is sure to attract a few curious eyes on your travels...");
			}
			
			target.tailGenitalColor = newColor;
			
			// Non Parasitic Genitail: 20 Lust gain.
			if(!isParasite) target.changeLust(20);
			else target.changeLust(2);
			
			tfDone();
		}
	}
}

