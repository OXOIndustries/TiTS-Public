package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class RainbowGaze extends ItemSlotClass
	{
		
		//constructor
		public function RainbowGaze()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "RainbowG.";
			longName = "Rainbow Gaze";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "an eyedropper labeled “Rainbow Gaze”";
			tooltip = "This is an eyedropper featuring an array of small dials at its base and branded with the Steele Tech logo along its side. The packaging says that the special microsurgeon-laced fluid can produce dozens of different eye colors when used.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 900;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			author("Couch");
			
			if(target is PlayerCharacter)
			{
				output("You pull the eyedropper out of its packaging and turn it over in your hands, trying to decide what color you’d like.\n\n");
				rbgMenu(target);
				return true;
			}
			else
			{
				output(target.capitalA + target.short + " uses the Rainbow Gaze to no effect.");
			}
			return false;
		}
		
		private function rbgMenu(target:Creature):void
		{
			kGAMECLASS.showName("RAINBOW\nGAZE");
			
			clearMenu();
			addButton(0, "Standard", rbgSelColor, [target, "standard"]);
			addButton(1, "Metallic", rbgSelColor, [target, "metallic"]);
			addButton(2, "Glowing", rbgSelColor, [target, "glowing"]);
			addButton(14, "Back", rbgCancel, target);
		}
		
		private function rbgSelColor(arg:Array):void
		{
			var target:Creature = arg[0];
			var colorType:String = arg[1];
			var colorList:Array = [];
			var i:int = 0;
			var btnSlot:int = 0;
			
			kGAMECLASS.showName(colorType.toUpperCase() + "\nCOLORS");
			
			switch(colorType)
			{
				case "standard":
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
					break;
				case "metallic":
					colorList.push(["copper", "Copper"]);
					colorList.push(["silver", "Silver"]);
					colorList.push(["gold", "Gold"]);
					colorList.push(["platinum", "Platinum"]);
					colorList.push(["sable", "Sable"]);
					break;
				case "glowing":
					colorList.push(["glowing red", "G.Red"]);
					colorList.push(["glowing orange", "G.Orange"]);
					colorList.push(["glowing amber", "G.Amber"]);
					colorList.push(["glowing yellow", "G.Yellow"]);
					colorList.push(["glowing green", "G.Green"]);
					colorList.push(["glowing cyan", "G.Cyan"]);
					colorList.push(["glowing blue", "G.Blue"]);
					colorList.push(["glowing purple", "G.Purple"]);
					colorList.push(["glowing pink", "G.Pink"]);
					colorList.push(["glowing white", "G.White"]);
					colorList.push(["glowing silver", "G.Silver"]);
					colorList.push(["glowing gold", "G.Gold"]);
					if(target.level >= 6 || target.hasItemByType(Foxfire)) colorList.push(["glowing ember", "Foxfire"]);
					if(target.level >= 6 || target.hasItemByType(Frostfire)) colorList.push(["fiery blue", "Frostfire"]);
					break;
			}
			
			clearMenu();
			for(i = 0; i < colorList.length; i++)
			{
				if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
				{
					addButton(btnSlot, "Back", rbgMenu, target);
					btnSlot++;
				}
				
				if(target.eyeColor != colorList[i][0]) addButton(btnSlot, colorList[i][1], rbgUse, [target,colorList[i][0]], StringUtil.toDisplayCase(colorList[i][0]), String("Change the color of your eyes to " + colorList[i][0] + "."));
				else addDisabledButton(btnSlot, colorList[i][1], StringUtil.toDisplayCase(colorList[i][0]), String("Your eyes are already " + colorList[i][0] + "."));
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
			kGAMECLASS.showName("RAINBOW\nGAZE");
			author("Couch");
			
			output("You put the eyedropper back into your inventory.\n\n");
			if (!kGAMECLASS.infiniteItems()) kGAMECLASS.itemCollect([new RainbowGaze()]);
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
			
			clearOutput();
			kGAMECLASS.showName("RAINBOW\nGAZE");
			author("Couch");
			
			output("You set the dials until the fluid in the dropper is " + newColor + " and lift it to your eyes, carefully dripping it into each. As you blink you feel a fuzzy sensation that leaves you briefly disoriented. By the time it fades, your eyes have finished settling into their new shade. <b>Your eyes are now " + newColor + "!</b>");
			
			target.eyeColor = newColor;
			
			clearMenu();
			addButton(0, "Next", kGAMECLASS.useItemFunction);
		}
	}
}
