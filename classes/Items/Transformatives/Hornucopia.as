// Hornucopia
// A horn color/material TF
// by Gothpastel
// Pretty much just Pickmentation but for horns
// I blame Mirrin for this
// Introduces a new flag - {pc.hornColor} - it’s purely for aesthetic and will appear mostly in the PCs description
// Location: Sold anywhere that sells other ‘color picker’ TFs

package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.indefiniteArticle;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.StorageClass;
	
	public class Hornucopia extends ItemSlotClass
	{
		public function Hornucopia()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "H.copia";
			longName = "Hornucopia";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a color-changing bottle labeled “Hornucopia”";
			tooltip = "A varnish created by Xenogen Biotech after the success of their Pickmentation product, this time designed to change the color and material of the user’s horns - its particular focus being on metallic or gem-like properties. There’s a brush included with a color picker on it, allowing for easy application.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 2000;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			author("Gothpastel");
			
			if(target is PlayerCharacter)
			{
				if(target.horns <= 0)
				{
					output("You pull the bottle out but remember that you need to have horns in order use it!\n\n");
					clearMenu();
					addButton(0,"Next", rbgCancel, target);
				}
				else
				{
					output("You pull the bottle out and turn it over in your hands, trying to decide what color you’d like.\n\n");
					rbgMenu(target);
				}
				return true;
			}
			else
			{
				output(target.capitalA + target.short + " uses the Hornucopia but to no effect.");
			}
			return false;
		}
		
		private function rbgMenu(target:Creature):void
		{
			kGAMECLASS.showName("\nHORNUCOPIA");
			
			var horns:Number = target.horns;
			var hornsNoun:String = target.hornsNoun();
			var hornStyle:int = -1;
			var hornMaterial:int = -1;
			var hornColor:String = "";
			
			if(target.hasStatusEffect("Horn Style"))
			{
				hornStyle = target.statusEffectv1("Horn Style");
				hornMaterial = target.statusEffectv2("Horn Style");
				hornColor = target.getStatusTooltip("Horn Style");
			}
			
			clearMenu();
			addButton(0, "Regular", rbgSelColor, [target, "regular"], "Regular", "Just change the color of your " + hornsNoun + ".");
			addButton(1, "Metal", rbgSelColor, [target, "metal"], "Metal", "Change your " + hornsNoun + " to look like ornamental metal.");
			addButton(2, "Gem", rbgSelColor, [target, "gem"], "Gem", "Change your " + hornsNoun + " to look like" + (horns == 1 ? " an" : "") + " ornamental gemstone" + (horns == 1 ? "" : "s") + ".");
			if(hornStyle <= 0 && hornColor == "") addDisabledButton(3, "Natural", "Natural", "Your " + hornsNoun + " " + (horns == 1 ? "is" : "are") + " already in " + (horns == 1 ? "its" : "their") + " natural appearance.");
			else addButton(3, "Natural", rbgSelColor, [target, "natural"], "Natural", "Restore your " + hornsNoun + " to " + (horns == 1 ? "its" : "their") + " natural appearance.");
			addButton(14, "Back", rbgCancel, target);
		}
		
		private function rbgSelColor(arg:Array):void
		{
			var target:Creature = arg[0];
			var colorType:String = arg[1];
			var colorList:Array = [];
			var currentColor:String = (target.hasStatusEffect("Horn Style") ? target.getStatusTooltip("Horn Style") : "");
			var newMaterial:int = 0;
			var i:int = 0;
			var btnSlot:int = 0;
			
			switch(colorType)
			{
				case "regular":
					colorList.push(["light red", "Lt.Red"]);
					colorList.push(["red", "Red"]);
					colorList.push(["dark red", "Dk.Red"]);
					colorList.push(["red-orange", "R.Orange"]);
					colorList.push(["light orange", "Lt.Orange"]);
					colorList.push(["orange", "Orange"]);
					colorList.push(["dark orange", "Dk.Orange"]);
					colorList.push(["yellow-orange", "Y.Orange"]);
					colorList.push(["light yellow", "Lt.Yellow"]);
					colorList.push(["yellow", "Yellow"]);
					colorList.push(["dark yellow", "Dk.Yellow"]);
					colorList.push(["yellow-green", "Y.Green"]);
					colorList.push(["light green", "Lt.Green"]);
					colorList.push(["green", "Green"]);
					colorList.push(["dark green", "Dk.Green"]);
					colorList.push(["aquamarine", "Aquamarine"]);
					colorList.push(["teal", "Teal"]);
					colorList.push(["cerulean", "Cerulean"]);
					colorList.push(["aqua", "Aqua"]);
					colorList.push(["light blue", "Lt.Blue"]);
					colorList.push(["blue", "Blue"]);
					colorList.push(["dark blue", "Dk.Blue"]);
					colorList.push(["ultramarine", "Ultramarine"]);
					colorList.push(["indigo", "Indigo"]);
					colorList.push(["light purple", "Lt.Purple"]);
					colorList.push(["purple", "Purple"]);
					colorList.push(["dark purple", "Dk.Purple"]);
					colorList.push(["lavender", "Lavender"]);
					colorList.push(["pink", "Pink"]);
					colorList.push(["rose", "Rose"]);
					colorList.push(["peach", "Peach"]);
					colorList.push(["tan", "Tan"]);
					colorList.push(["light brown", "Lt.Brown"]);
					colorList.push(["brown", "Brown"]);
					colorList.push(["dark brown", "Dk.Brown"]);
					colorList.push(["white", "White"]);
					colorList.push(["gray", "Gray"]);
					colorList.push(["black", "Black"]);
					
					newMaterial = 1;
					break;
				case "metal":
					colorList.push(["copper", "Copper"]);
					colorList.push(["bronze", "Bronze"]);
					colorList.push(["silver", "Silver"]);
					colorList.push(["gold", "Gold"]);
					colorList.push(["platinum", "Platinum"]);
					colorList.push(["steel", "Steel"]);
					colorList.push(["gunmetal", "Gunmetal"]);
					colorList.push(["sable", "Sable"]);
					colorList.push(["iridescent", "Iridescent"]);
					
					newMaterial = 2;
					break;
				case "gem":
					colorList.push(["crimson", "Crimson"]);
					colorList.push(["garnet", "Garnet"]);
					colorList.push(["ruby", "Ruby"]);
					colorList.push(["citrine", "Citrine"]);
					colorList.push(["topaz", "Topaz"]);
					colorList.push(["amber", "Amber"]);
					colorList.push(["peridot", "Peridot"]);
					colorList.push(["emerald", "Emerald"]);
					colorList.push(["jade", "Jade"]);
					colorList.push(["malachite", "Malachite"]);
					colorList.push(["turquoise", "Turquoise"]);
					colorList.push(["aquamarine", "Aquamarine"]);
					colorList.push(["lapis", "Lapis"]);
					colorList.push(["sapphire", "Sapphire"]);
					colorList.push(["violet", "Violet"]);
					colorList.push(["amethyst", "Amethyst"]);
					colorList.push(["opal", "Opal"]);
					colorList.push(["pearl", "Pearl"]);
					colorList.push(["diamond", "Diamond"]);
					colorList.push(["jet", "Jet"]);
					colorList.push(["onyx", "Onyx"]);
					
					newMaterial = 3;
					break;
			}
			
			if(newMaterial == 0)
			{
				rbgUse([target, "", newMaterial]);
				return;
			}
			
			kGAMECLASS.showName(colorType.toUpperCase() + "\nCOLORS");
			
			clearMenu();
			for(i = 0; i < colorList.length; i++)
			{
				if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
				{
					addButton(btnSlot, "Back", rbgMenu, target);
					btnSlot++;
				}
				
				if(currentColor != colorList[i][0]) addButton(btnSlot, colorList[i][1], rbgUse, [target, colorList[i][0], newMaterial], StringUtil.toDisplayCase(colorList[i][0]), ("Change the color of your " + target.hornsNoun() + " to " + colorList[i][0] + "."));
				else addDisabledButton(btnSlot, colorList[i][1], StringUtil.toDisplayCase(colorList[i][0]), ("Your " + target.hornsNoun() + " " + (target.horns == 1 ? "is" : "are") + " already " + colorList[i][0] + "."));
				btnSlot++;
				
				if(colorList.length > 14 && (i + 1) == colorList.length)
				{
					while((btnSlot + 1) % 15 != 0) { btnSlot++; }
					addButton(btnSlot, "Back", rbgMenu, target);
				}
			}
			addButton(14, "Back", rbgMenu, target);
		}
		
		private function rbgCancel(target:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("\nHORNUCOPIA");
			author("Gothpastel");
			
			output("You put the bottle back into your inventory.\n\n");
			if (!kGAMECLASS.infiniteItems()) kGAMECLASS.itemCollect([new Hornucopia()]);
			else
			{
				clearMenu();
				addButton(0,"Next",kGAMECLASS.useItemFunction);
			}
		}
		
		private function rbgUse(arg:Array):void
		{
			var target:Creature = arg[0];
			var newColor:String = arg[1];
			var newMaterial:int = arg[2];
			var horns:Number = target.horns;
			var hornsNoun:String = target.hornsNoun();
			
			clearOutput();
			kGAMECLASS.showName("\nHORNUCOPIA");
			author("Gothpastel");
			
			if(newMaterial == 0) output("You flick the color picker to the ‘natural’ option, swirling the brush around in the bottle of varnish. It starts to take on a thinner consistency, the color leaving it.");
			else output("You flick the color picker to your chosen color, swirling the brush around in the bottle of varnish until the color takes.");
			output("\n\nYou take out your codex, turning on the camera application and making sure to angle it so you can see your " + hornsNoun + " properly - you don’t want to miss a spot!");
			output("\n\nPainting the varnish on takes quite a while with how small the brush is, but you’re eventually done. You sit back, letting it do it’s work.");
			switch(newMaterial)
			{
				case 1:
					output("\n\nAs you watch, the " + newColor + " toned varnish you applied seems to be soaking into your " + hornsNoun + ", the color no longer just surface deep. Once you’re sure that you’re not going to rub anything off, you reach your hand up to touch your " + hornsNoun + ".");
					output("\n\n" + (horns == 1 ? "It feels" : "They feel") + " the same as ever - no feeling of sticky or set varnish left on " + (horns == 1 ? "it" : "them") + ", and you’re satisfied that <b>you now have " + (horns == 1 ? indefiniteArticle(newColor) : newColor) + " " + GLOBAL.TYPE_NAMES[target.hornType].toLowerCase() + " " + hornsNoun + "!</b>");
					break;
				case 2:
					output("\n\nAs you watch, your " + hornsNoun + " seem" + (horns == 1 ? "s" : "") + " to visibly harden, becoming slightly more angular in appearance. The " + newColor + " toned varnish you applied seems to be soaking into your " + hornsNoun + " too, the color no longer just surface deep. Once you’re sure that you’re not going to rub anything off, you reach your hand up to touch your " + hornsNoun + ".");
					output("\n\nOh! " + (horns == 1 ? "It’s" : "They’re") + " cold!");
					output("\n\nYou were expecting a simple color change, but feeling this, it’s almost like your " + hornsNoun + " have been coated, or maybe even replaced, with an actual metal! Looking at your codex, " + (horns == 1 ? "it’s" : "they’re") + " even subtly reflective.");
					output("\n\n<b>You now have " + (horns == 1 ? indefiniteArticle(newColor) : newColor) + " " + GLOBAL.TYPE_NAMES[target.hornType].toLowerCase() + " " + hornsNoun + "!<b>");
					output("\n\nA check of your codex confirms that it’s not <i>quite</i> the same as real metal, though, so you won’t have to worry about getting electrocuted any more than usual.");
					break;
				case 3:
					output("\n\nAs you watch, your " + hornsNoun + " seem" + (horns == 1 ? "s" : "") + " to visibly harden, becoming slightly more smooth in appearance. The " + newColor + " toned varnish you applied seems to be soaking into your " + hornsNoun + " too, the color no longer just surface deep. The change is more pronounced than just the color though, your " + hornsNoun + " seem" + (horns == 1 ? "s" : "") + " to be changing in density, even becoming slightly translucent. You were expecting just a color change, but once the transformation stops, a quick touch of your " + hornsNoun + " confirms that it really is like your " + hornsNoun + " " + (horns == 1 ? "has" : "have") + " been turned completely into gemstone!");
					output("\n\n<b>You now have " + (horns == 1 ? indefiniteArticle(newColor) : newColor) + " " + GLOBAL.TYPE_NAMES[target.hornType].toLowerCase() + " " + hornsNoun + "!</b>");
					output("\n\nA check of your codex confirms that it’s not <i>quite</i> the same as real gemstone, though, so you won’t have to worry about someone trying to saw " + (horns == 1 ? "it" : "them") + " off for profit.");
					break;
				default:
					output("\n\nAs you watch, the unnatural coloration of your " + hornsNoun + " begins to fade, leaving behind traditional " + GLOBAL.TYPE_NAMES[target.hornType].toLowerCase() + " " + hornsNoun + ". After a while, the varnish has completely wicked away, and <b>your " + hornsNoun + " " + (horns == 1 ? "is" : "are") + " now " + (horns == 1 ? "its" : "their") + " natural color and appearance!</b>");
					break;
			}
			
			// "Horn Style"
			// v1: shape style
			// v2: material type
			// tooltip: custom color
			target.createStatusEffect("Horn Style", 0, 0, 0, 0, true, "", "", false, 0);
			//target.setStatusValue("Horn Style", 1, 0);
			target.setStatusValue("Horn Style", 2, newMaterial);
			//target.setStatusValue("Horn Style", 3, 0);
			//target.setStatusValue("Horn Style", 4, 0);
			target.setStatusTooltip("Horn Style", newColor);
			
			// Status check for removal.
			var effect:StorageClass = target.getStatusEffect("Horn Style");
			if(effect.value1 == 0 && (effect.value2 == 0 || effect.value2 == 1) && effect.value3 == 0 && effect.value4 == 0 && effect.tooltip == "")
			{
				// Remove if status is all default values.
				target.removeStatusEffect("Horn Style");
				//output("\n\n<b>Horn Style Removed!</b>");
			}
			
			clearMenu();
			addButton(0, "Next", kGAMECLASS.useItemFunction);
		}
	}
}

