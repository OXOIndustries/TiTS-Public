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
	
	public class Pickmentation extends ItemSlotClass
	{
		//constructor
		public function Pickmentation()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "Pickment.";
			longName = "Pickmentation";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a colorful injector labeled “Pickmentation”";
			tooltip = "This is an extremely garish medipen that constantly shifts between colors and patterns, with a selector mechanism at the bottom. Produced by Xenogen Biotech, it is based on the physiology of the Vanae of Mhen’ga, who are able to freely change the color and patterns of their flesh. The packaging claims that this will allow you to change your skin color.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 10000;
			
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
				output(target.capitalA + target.short + " uses the Pickmentation to no effect.");
			}
			return false;
		}
				
		private function introMenu(target:Creature, introText:Boolean = false):void
		{
			clearOutput();
			kGAMECLASS.showName("PICK-\nMENTATION");
			
			// Consumption
			if(introText) output("You retrieve the injector from your inventory and give it a quick once-over, noting a color selection knob. What will you select?");
			else output("You look back at the color wheel...");
			
			rbgMenu(target);
		}
		private function rbgMenu(target:Creature):void
		{
			clearMenu();
			addButton(0, "“Terran”", rbgSelColor, [target, "terran"]);
			addButton(1, "Unusual", rbgSelColor, [target, "unusual"]);
			addButton(2, "Metallic", rbgSelColor, [target, "metallic"]);
			addButton(3, "Glowing", rbgSelColor, [target, "glowing"]);
			addButton(4, "Freckles", getFreckles, target);
			addButton(14, "Back", rbgCancel, target);
		}
		private function getFreckles(target:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("\nFRECKLES!");
			author("Night Trap");
			var pc:Creature = target;
			if(!pc.hasFaceFlag(GLOBAL.FLAG_FRECKLED))
			{
				output("You adjust the selector to freckles and press the medipen to the center of your forehead. There’s a quiet hiss from the device ");
				if(pc.hasFaceFlag(GLOBAL.FLAG_FURRED) || pc.hasFur()) output(", but you don’t feel anything happen. You pull out your codex to check your face but are disappointed to find nothing has changed. It looks like freckles won’t show up on a furred face.");
				else output(" followed by a tingling sensation that spreads from the injection site to the rest of your face. When the tingling finally ends you pull out your codex and use it to check your reflection, finding that <b>you now have freckles!</b>");
				pc.addFaceFlag(GLOBAL.FLAG_FRECKLED);
			}
			else
			{
				output("You adjust the selector to freckles and press the medipen to the center of your forehead. There’s a quiet hiss from the device followed by a tingling sensation that spreads from the injection site to the rest of your face. When the tingling finally ends you pull out your codex and use it to check your reflection, finding ");
				if(pc.hasFaceFlag(GLOBAL.FLAG_FURRED) || pc.hasFur()) output("that you can’t tell the difference through your [pc.skinFurScales], but you’re sure ")
				output("that <b>your freckles are gone!</b>");
				pc.removeFaceFlag(GLOBAL.FLAG_FRECKLED);
			}
			tfDone();
		}
		private function rbgCancel(target:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("PICK-\nMENTATION");
			author("Night Trap");
			
			output("You put the Pickmentation back into your inventory.\n\n");
			if (!kGAMECLASS.infiniteItems()) kGAMECLASS.itemCollect([new Pickmentation()]);
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
			author("Night Trap");
			
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
				case "unusual":
					colorList.push(["red", "Red"]);
					colorList.push(["dark red", "Dark Red"]);
					colorList.push(["orange", "Orange"]);
					colorList.push(["yellow", "Yellow"]);
					colorList.push(["pale yellow", "Pale Yellow"]);
					colorList.push(["pale green", "Pale Green"]);
					colorList.push(["green", "Green"]);
					colorList.push(["dark green", "Dark Green"]);
					colorList.push(["aqua", "Aqua"]);
					colorList.push(["sky blue", "Sky Blue"]);
					colorList.push(["blue", "Blue"]);
					colorList.push(["dark blue", "Dark blue"]);
					colorList.push(["purple", "Purple"]);
					colorList.push(["deep purple", "Deep Purple"]);
					colorList.push(["brown", "Brown"]);
					colorList.push(["black", "Black"]);
					colorList.push(["gray", "Gray"]);
					colorList.push(["white", "White"]);
					colorList.push(["pink", "Pink"]);
					colorList.push(["neon pink", "Neon Pink"]);
					break;
				case "metallic":
					colorList.push(["bronze", "Bronze"]);
					colorList.push(["silver", "Silver"]);
					colorList.push(["gold", "Gold"]);
					colorList.push(["platinum", "Platinum"]);
					colorList.push(["onyx", "Onyx"]);
					colorList.push(["brass", "Brass"]);
					colorList.push(["cobalt", "Cobalt"]);
					colorList.push(["gunmetal", "Gunmetal"]);
					colorList.push(["steel", "Steel"]);
					break;
				case "glowing":
					colorList.push(["glowing red", "G.Red"]);
					colorList.push(["glowing orange", "G.Orange"]);
					colorList.push(["glowing yellow", "G.Yellow"]);
					colorList.push(["glowing green", "G.Green"]);
					colorList.push(["glowing blue", "G.Blue"]);
					colorList.push(["glowing purple", "G.Purple"]);
					colorList.push(["glowing pink", "G.Pink"]);
					colorList.push(["glowing gold", "G.Gold"]);
					colorList.push(["luminous cyan", "L.Cyan"]);
					colorList.push(["luminous violet", "L.Violet"]);
					colorList.push(["luminous silver", "L.Silver"]);
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
				
				addButton(btnSlot, colorList[i][1], partMenu, [target, colorType, colorList[i][0]], StringUtil.toDisplayCase(colorList[i][0]), String("Select " + colorList[i][0] + "."));
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
			author("Night Trap");
			
			target.skinTone = newColor;

			output("You adjust the selector to " + newColor + " and press the injector just below your sternum. There’s a quiet hiss from the device, ");
			if(target.hasFur() || target.hasScales() || target.hasFeathers()) output("but nothing else seems to happen. It seems changing your skin color doesn’t do much when its covered by fur or scales.");
			else output("followed by a tingling sensation that spreads from the injection site over your whole body. " + StringUtil.upperCase(newColor) + " is spreading outwards from your sternum, replacing your previous skin color. <b>You now have [pc.skinTone] [pc.skinNoun].</b>");

			tfDone();
		}
		private function tfDone():void
		{
			clearMenu();
			addButton(0, "Next", kGAMECLASS.useItemFunction);
		}
	}
}

