﻿package classes.Items.Transformatives
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
	
	public class LipTease extends ItemSlotClass
	{
		//constructor
		public function LipTease()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "LipTease";
			longName = "Lip Tease lip balm";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a doubled-ended lip balm labeled “Lip Tease”";
			tooltip = "This small plastic cylinder has the words “Lip Tease” printed on its surface alongside a small print of the JoyCo logo. It’s a single-use applicator that allows the user to shrink or enlarge their lips based on which end is applied, as well as change their lips’ natural color.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 400;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			// Manufacturer: I dunno. I'd like it to be JoyCo, though, because I love JoyCo. :D
			// Vendor: Aislinn
			// This is a mod that will allow PC's to increase or decrease their lip size, specifically their lipMod stat. It also allows PC's to customize the color of their lips. That's it. :P
			
			if(target is PlayerCharacter)
			{
				lipMenu(target);
				return true;
			}
			else
			{
				clearOutput();
				output(target.capitalA + target.short + " uses the Lip Tease to no effect.");
			}
			return false;
		}
		
		private function lipTypeString(colorType:String = "lip"):String
		{
			if(colorType == "lipple") return "lipples";
			if(colorType == "mouthgina") return "mouthgina lips";
			return "lips";
		}
		
		private function lipMenu(target:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("LIP\nTEASE");
			author("MistyBirb");
			
			// First Consumption Text:
			output("You hold the applicator in your palm. ");
			
			var btnSlot:int = 0;
			var lipList:Array = [];
			if(target.hasLipples()) lipList.push("lipple");
			if(target.hasVaginaType(GLOBAL.TYPE_MOUTHGINA)) lipList.push("mouthgina");
			
			if(lipList.length > 0)
			{
				output("Before using it, what lips do you want to use it on?\n\n");
				
				clearMenu();
				addButton(btnSlot++, "Lips", rbgMenu, [target, "lip", true]);
				if(lipList.indexOf("lipple") != -1) addButton(btnSlot++, "Lipples", rbgMenu, [target, "lipple", true]);
				if(lipList.indexOf("mouthgina") != -1) addButton(btnSlot++, "Mouthgina", vagMenu, [target, "mouthgina"]);
				addButton(14, "Back", rbgCancel, target);
			}
			else
			{
				rbgMenu([target, "lip"]);
			}
		}
		private function rbgMenu(arg:Array):void
		{
			var target:Creature = arg[0];
			var colorType:String = arg[1];
			var idx:int = (arg.length >= 5 ? arg[4] : -1);
			
			if(arg.length > 2 && arg[2] == true) clearOutput();
			output("The directions say you have to pick a color before shaking it. Do you want to change the color of your " + lipTypeString(colorType) + "?\n\n");
			
			// Based on PC's choice of setting. Note that colors also apply to lip nipples exactly like facial lips.
			clearMenu();
			addButton(0, "Yes", rbgSelColor, [target, colorType, false, "", idx], "Choose Color", ("Choose a color for your " + lipTypeString(colorType) + "."));
			addButton(1, "No", sizeMenu, [target, colorType, "null", "", idx], "No Color", ("Don’t change the color of your " + lipTypeString(colorType) + "."));
			if(target.isBimbo()) addButton(5, "Like, Ya!", rbgSelColor, [target, colorType, true, "", idx], "*Choose Glitter*", ("Like, totally choose a better color for your " + lipTypeString(colorType) + "."));
			
			if(colorType != "lip") addButton(14, "Back", lipMenu, target);
			else addButton(14, "Back", rbgCancel, target);
		}
		private function vagMenu(arg:Array):void
		{
			var target:Creature = arg[0];
			var colorType:String = arg[1];
			var i:int = 0;
			var x:int = 0;
			
			// If vaginacount=1: Proceed to transformation text
			if(target.vaginas.length == 1)
			{
				rbgMenu([target, colorType, true, "", 0]);
				return;
			}
			
			// If vaginacount>1: Proceed to third consumption text
			clearOutput();
			kGAMECLASS.showName("CHOOSE\nVAGINA");
			author("MistyBirb");
			clearMenu();
			
			output("You have more than one vagina. Which one will you apply the Lip Tease to?\n");
			
			for(i = 0; i < target.vaginas.length; i++)
			{
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
				
				if(target.vaginas[i].type == GLOBAL.TYPE_MOUTHGINA) addButton(i, ("Vagina " + (i + 1)), rbgMenu, [target, colorType, true, "", i], (StringUtil.capitalize(num2Ordinal(i + 1)) + " Vagina"), ("Use this on your [pc.vagina " + i + "]."));
				else addDisabledButton(i, ("Vagina " + (i + 1)), (StringUtil.capitalize(num2Ordinal(i + 1)) + " Vagina"), ("This vagina is not a valid type for this item!"));
			}
			addButton(14, "Back", rbgCancel, target);
		}
		
		private function rbgCancel(target:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("LIP\nTEASE");
			author("MistyBirb");
			
			output("You put the lip balm back into your inventory.\n\n");
			if (!kGAMECLASS.infiniteItems()) kGAMECLASS.itemCollect([new LipTease()]);
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
			var idx:int = (arg.length >= 5 ? arg[4] : -1);
			var colorList:Array = [];
			var i:int = 0;
			var btnSlot:int = 0;
			
			clearOutput();
			kGAMECLASS.showName(colorType.toUpperCase() + "\nCOLORS");
			author("MistyBirb");
			
			output("What color do you choose?\n\n");
			
			// Standard
			colorList.push(["red", "Red"]);
			colorList.push(["red-orange", "R.Orange"]);
			colorList.push(["orange", "Orange"]);
			colorList.push(["yellow-orange", "Y.Orange"]);
			colorList.push(["yellow", "Yellow"]);
			colorList.push(["yellow-green", "Y.Green"]);
			colorList.push(["green", "Green"]);
			colorList.push(["teal", "Teal"]);
			colorList.push(["cerulean", "Cerulean"]);
			colorList.push(["blue", "Blue"]);
			colorList.push(["indigo", "Indigo"]);
			colorList.push(["purple", "Purple"]);
			colorList.push(["lavender", "Lavender"]);
			colorList.push(["pink", "Pink"]);
			colorList.push(["rose", "Rose"]);
			colorList.push(["peach", "Peach"]);
			colorList.push(["brown", "Brown"]);
			colorList.push(["hazel", "Hazel"]);
			colorList.push(["white", "White"]);
			colorList.push(["black", "Black"]);
			
			// Gemstone
			colorList.push(["crimson", "Crimson"]);
			colorList.push(["garnet", "Garnet"]);
			colorList.push(["ruby", "Ruby"]);
			colorList.push(["citrine", "Citrine"]);
			colorList.push(["topaz", "Topaz"]);
			colorList.push(["amber", "Amber"]);
			colorList.push(["peridot", "Peridot"]);
			colorList.push(["emerald", "Emerald"]);
			colorList.push(["jade", "Jade"]);
			colorList.push(["turquoise", "Turquoise"]);
			colorList.push(["aquamarine", "Aquamarine"]);
			colorList.push(["lapis", "Lapis"]);
			colorList.push(["sapphire", "Sapphire"]);
			colorList.push(["violet", "Violet"]);
			colorList.push(["amethyst", "Amethyst"]);
			colorList.push(["opal", "Opal"]);
			colorList.push(["pearl", "Pearl"]);
			
			// Metallic
			colorList.push(["copper", "Copper"]);
			colorList.push(["silver", "Silver"]);
			colorList.push(["gold", "Gold"]);
			colorList.push(["platinum", "Platinum"]);
			colorList.push(["sable", "Sable"]);
			
			// Bimbo variants
			if(arg.length > 2 && arg[2] == true)
			{
				var bimboColors:Array = [];
				for(i = 0; i < colorList.length; i++)
				{
					bimboColors.push([("glittering " + colorList[i][0]), ("*" + colorList[i][1] + "*")]);
				}
				colorList = bimboColors;
			}
			
			// All of these just go to the same Second Consumption Text because I made it nondescript.
			kGAMECLASS.clearMenu();
			for(i = 0; i < colorList.length; i++)
			{
				if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
				{
					addButton(btnSlot, "Back", rbgMenu, [target, colorType, true, "", idx]);
					btnSlot++;
				}
				
				if(colorType == "lip" && target.lipColor != colorList[i][0]) addButton(btnSlot, colorList[i][1], sizeMenu, [target, colorType, colorList[i][0]], StringUtil.toDisplayCase(colorList[i][0]), ("Change the color of your lips to " + colorList[i][0] + "."));
				else if(colorType == "lipple" && target.nippleColor != colorList[i][0]) addButton(btnSlot, colorList[i][1], sizeMenu, [target, colorType, colorList[i][0]], StringUtil.toDisplayCase(colorList[i][0]), ("Change the color of your lipples to " + colorList[i][0] + "."));
				else if(colorType == "mouthgina" && target.vaginas[idx].vaginaColor != colorList[i][0]) addButton(btnSlot, colorList[i][1], sizeMenu, [target, colorType, colorList[i][0], "", idx], StringUtil.toDisplayCase(colorList[i][0]), ("Change the color of your [pc.vaginaNoun " + idx + "] to " + colorList[i][0] + "."));
				else addDisabledButton(btnSlot, colorList[i][1], StringUtil.toDisplayCase(colorList[i][0]), ("Your " + lipTypeString(colorType) + " are already " + colorList[i][0] + "."));
				btnSlot++;
				
				if(colorList.length > 14 && (i + 1) == colorList.length)
				{
					while((btnSlot + 1) % 15 != 0) { btnSlot++; }
					addButton(btnSlot, "Back", rbgMenu, [target, colorType, true, "", idx]);
				}
			}
			addButton(14, "Back", rbgMenu, [target, colorType, true, "", idx]);
		}
		
		private function sizeMenu(arg:Array):void
		{
			var target:Creature = arg[0];
			var colorType:String = arg[1];
			var newColor:String = arg[2];
			var idx:int = (arg.length >= 5 ? arg[4] : -1);
			
			clearOutput();
			kGAMECLASS.showName(colorType.toUpperCase() + "\nSIZE");
			author("MistyBirb");
			
			output("You make your selection and give the cylinder a good shake, hearing a bit of liquid slosh around inside. Now, which end are you going to use? The “+” side will enlarge your " + lipTypeString(colorType) + ", while the “-” side will shrink them.");
			
			clearMenu();
			addButton(0, "Increase", rbgUse, [target, colorType, newColor, "increase", idx]);
			addButton(1, "Decrease", rbgUse, [target, colorType, newColor, "decrease", idx]);
		}
		
		private function rbgUse(arg:Array):void
		{
			var target:Creature = arg[0];
			var colorType:String = arg[1];
			var newColor:String = arg[2];
			var sizeType:String = arg[3];
			var idx:int = (arg.length >= 5 ? arg[4] : -1);
			
			var lipType:String = "[pc.lips]";
			var oldColor:String = target.lipColor;
			var bRow:int = 0;
			if(colorType == "lipple")
			{
				for(var i:int = 0; i < target.breastRows.length; i++)
				{
					if(target.breastRows[i].nippleType == GLOBAL.NIPPLE_TYPE_LIPPLES && target.breastRows[i].breastRating() >= target.breastRows[bRow].breastRating()) bRow = i;
				}
				lipType = ("[pc.nipples " + bRow + "]");
			}
			if(colorType == "mouthgina")
			{
				lipType = ("[pc.vagina " + idx + "] lips");
			}
			
			clearOutput();
			kGAMECLASS.showName("LIP\nTEASE");
			author("MistyBirb");
			
			output("You pull off the cap and pucker your " + lipType + ", liberally applying the balm. There’s not much in there, and it only takes a few passes over each lip to exhaust the applicator.");
			
			// Enlarge: Increase the PC's lipMod stat by 1 (50% chance), 2 (35% chance), or 3 (15% chance), up to whatever the maximum is.
			// Shrink: Decrease the PC's lipMod stat by 1 (50% chance), 2 (35% chance), or 3 (15% chance), down to whatever the minimum is.
			var sizeDiff:Number = 1;
			if(rand(2) == 0) sizeDiff += 1;
			if(rand(3) == 0) sizeDiff += 1;
			
			var sizeChanged:Boolean = false;
			switch(colorType)
			{
				default:
					sizeDiff = Math.max(1, Math.round(sizeDiff / 2));
					if(sizeType == "decrease") sizeDiff *= -1;
					if(target.lipMod + sizeDiff < -10) sizeDiff = 0;
					else if(target.lipModUnlocked(target.lipMod + sizeDiff)) sizeChanged = true;
					break;
				case "lipple":
					oldColor = target.nippleColor;
					sizeDiff = Math.round(sizeDiff / 5);
					if(sizeType == "decrease") sizeDiff *= -1;
					if(target.nippleWidthRatio + sizeDiff < 0.1) sizeDiff = 0;
					else if(target.nippleWidthRatioUnlocked(target.nippleWidthRatio + sizeDiff)) sizeChanged = true;
					break;
				case "mouthgina":
					oldColor = target.vaginas[idx].vaginaColor;
					sizeDiff = 0;
					if(sizeType == "decrease" && (target.vaginas[idx].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) || target.vaginas[idx].hasFlag(GLOBAL.FLAG_PUMPED)))
					{
						sizeDiff = -1;
						sizeChanged = true;
					}
					if(sizeType == "increase" && !target.vaginas[idx].hasFlag(GLOBAL.FLAG_PUMPED))
					{
						sizeDiff = 1;
						sizeChanged = true;
					}
					break;
			}
			
			// Lip Enlarge Text: 
			if(sizeType == "increase" && sizeChanged)
			{
				output("\n\nAt first, there’s no sensation beyond a nondescript warmth, until your " + lipTypeString(colorType) + " purse and tighten involuntarily. You feel them begin to stretch and grow larger, and you pull out your Codex to get a better look at what’s happening.");
				output("\n\nThe process is over fairly quickly, but there’s no denying that your " + (colorType == "lip" ? "lips are fuller and more shapely" : (lipType + " are larger")) + " than they were before");
				if(newColor != "null" && oldColor != newColor) output(", not to mention the fact that they’ve become a stunning new shade of " + newColor);
				output(". You");
				if(colorType == "lipple") output(" stroke them a few times with your fingers");
				else if(colorType == "mouthgina") output(" finger yourself for a moment");
				else output(" smack them a few times and go through various expressions");
				output(", pleased at how sexy and enticing they look. <b>Your " + lipTypeString(colorType) + " are now larger!</b>");
			}
			// Lip Shrink Text:
			else if(sizeType == "decrease" && sizeChanged)
			{
				output("\n\nAt first, there’s no sensation beyond a cool dampness, until your " + lipTypeString(colorType) + " suddenly go numb. An uncomfortable tingling passes over");
				if(colorType == "lipple") output(" your chest");
				else if(colorType == "mouthgina") output(" your crotch");
				else output(" the entire lower half of your face");
				output(", and then your feeling returns. You pull out your Codex and take a look at your reflection, nodding in approval as you see that your " + (colorType == "lip" ? "lips have shrunk and thinned out" : (lipType + " have gotten smaller in size")) + ".");
				if(newColor != "null" && oldColor != newColor) output(" They’ve also changed color, becoming a smooth and even shade of " + newColor + ".");
				output(" <b>Your " + lipTypeString(colorType) + " are now smaller!</b>");
			}
			// Max/Min lipMod Text:
			else
			{
				output("\n\nYou wait a few moments, but nothing happens. You pull out your Codex and take a look at your reflection. Your " + lipTypeString(colorType) + " seem to be the same size");
				if(newColor != "null" && oldColor != newColor) output(". They have changed color, though, and are now a lightly glistening " + newColor);
				else output(" and color");
				output(".");
				
				sizeDiff = 0;
			}
			
			switch(colorType)
			{
				default:
					if(sizeDiff != 0) target.lipMod += sizeDiff;
					if(newColor != "null") target.lipColor = newColor;
					break;
				case "lipple":
					if(sizeDiff != 0) target.nippleWidthRatio += sizeDiff;
					if(newColor != "null") target.nippleColor = newColor;
					break;
				case "mouthgina":
					if(sizeDiff < 0) target.deflateVagina(idx);
					if(sizeDiff > 0) target.inflateVagina(idx);
					if(newColor != "null") target.vaginas[idx].vaginaColor = newColor;
					break;
			}
			
			clearMenu();
			addButton(0, "Next", kGAMECLASS.useItemFunction);
		}
	}
}
