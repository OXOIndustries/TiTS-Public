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
			type = GLOBAL.POTION;
			//Used on inventory buttons
			shortName = "RainbowG.";
			//Regular name
			longName = "Rainbow Gaze";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "an eyedropper labeled “Rainbow Gaze”";
			tooltip = "This is an eyedropper featuring an array of small dials at its base and branded with the Steele Tech logo along its side. The packaging says that the special microsurgeon-laced fluid can produce dozens of different eye colors when used.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 1800;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("Couch");
			
			if(target is PlayerCharacter)
			{
				kGAMECLASS.output("You pull the eyedropper out of its packaging and turn it over in your hands, trying to decide what color you’d like.\n\n");
				rbgMenu(target);
				return true;
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " uses the Rainbow Gaze to no effect.");
			}
			return false;
		}
		
		public function rbgMenu(target:Creature):void
		{
			kGAMECLASS.showName("RAINBOW\nGAZE");
			
			kGAMECLASS.clearMenu();
			addButton(0, "Standard", rbgSelColor, [target, "standard"]);
			addButton(1, "Metallic", rbgSelColor, [target, "metallic"]);
			addButton(2, "Glowing", rbgSelColor, [target, "glowing"]);
			addButton(14, "Back", rbgCancel, target);
		}
		
		public function rbgSelColor(arg:Array):void
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
					colorList = [
						["red", "red-orange", "orange", "yellow-orange", "yellow", "yellow-green", "green", "teal", "cerulean", "blue", "indigo", "purple", "lavender", "pink", "rose", "peach", "brown", "hazel", "white", "black",
						 "crimson", "garnet", "ruby", "citrine", "topaz", "amber", "peridot", "emerald", "jade", "turquoise", "aquamarine", "lapis", "sapphire", "violet", "amethyst", "opal", "pearl"],
						["Red", "R.Orange", "Orange", "Y.Orange", "Yellow", "Y.Green", "Green", "Teal", "Cerulean", "Blue", "Indigo", "Purple", "Lavender", "Pink", "Rose", "Peach", "Brown", "Hazel", "White", "Black",
						 "Crimson", "Garnet", "Ruby", "Citrine", "Topaz", "Amber", "Peridot", "Emerald", "Jade", "Turquoise", "Aquamarine", "Lapis", "Sapphire", "Violet", "Amethyst", "Opal", "Pearl"]
					];
					break;
				case "metallic":
					colorList = [
						["copper", "silver", "gold", "platinum", "sable"],
						["Copper", "Silver", "Gold", "Platinum", "Sable"]
					];
					break;
				case "glowing":
					colorList = [
						["glowing red", "glowing orange", "glowing amber", "glowing yellow", "glowing green", "glowing cyan", "glowing blue", "glowing purple", "glowing pink", "glowing white"],
						["G.Red", "G.Orange", "G.Amber", "G.Yellow", "G.Green", "G.Cyan", "G.Blue", "G.Purple", "G.Pink", "G.White"]
					];
					break;
			}
			
			kGAMECLASS.clearMenu();
			for(i = 0; i < colorList[0].length; i++)
			{
				if(btnSlot > 14 && (btnSlot + 1) % 15 == 0)
				{
					addButton(btnSlot, "Back", rbgMenu, target);
					btnSlot++;
				}
				
				if(target.eyeColor != colorList[0][i]) addButton(btnSlot, colorList[1][i], rbgUse, [target,colorList[0][i]], StringUtil.toDisplayCase(colorList[0][i]), String("Change the color of your eyes to " + colorList[0][i] + "."));
				else addDisabledButton(btnSlot, colorList[1][i], StringUtil.toDisplayCase(colorList[0][i]), String("Your eyes are already " + colorList[0][i] + "."));
				btnSlot++;
				
				if(colorList[0].length > 15 && (i + 1) == colorList[0].length)
				{
					while((btnSlot + 1) % 15 != 0) { btnSlot++; }
					addButton(btnSlot, "Back", rbgMenu, target);
				}
			}
			addButton(14, "Back", rbgMenu, target);
		}
		
		public function rbgCancel(target:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("RAINBOW\nGAZE");
			author("Couch");
			
			kGAMECLASS.output("You put the eyedropper back into your inventory.\n\n");
			kGAMECLASS.quickLoot(new RainbowGaze());
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0, "Next", kGAMECLASS.useItemFunction);
		}
		
		public function rbgUse(arg:Array):void
		{
			var target:Creature = arg[0];
			var newColor:String = arg[1];
			
			clearOutput();
			kGAMECLASS.showName("RAINBOW\nGAZE");
			author("Couch");
			
			output("You set the dials until the fluid in the dropper is " + newColor + " and lift it to your eyes, carefully dripping it into each. As you blink you feel a fuzzy sensation that leaves you briefly disoriented. By the time it fades, your eyes have finished settling into their new shade. <b>Your eyes are now " + newColor + "!</b>");
			
			target.eyeColor = newColor;
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0, "Next", kGAMECLASS.useItemFunction);
		}
	}
}
