package classes.Items.Transformatives
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.GameData.CodexManager;
	import classes.Engine.Map.InShipInterior;
	import classes.Engine.Utility.IncrementFlag;
	
	public class Placeholder extends ItemSlotClass
	{
		//Placeholder
		public function Placeholder()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "Placeholder";
			
			//Regular name
			this.longName = "TamaniCorp Placeholder";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a TamaniCorp Placeholder";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Stuff!";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1;
			
			this.addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);
			
			this.version = _latestVersion;
		}	
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if (target is PlayerCharacter) 
			{
				return PlaceholderInstallation();
			}
			else
			{
				clearOutput();
				output(target.capitalA + target.short + " cannot use the Placeholder.");
			}
			return false;
		}
		
		public function PlaceholderInstallation():Boolean
		{
			clearOutput();

			if (InShipInterior())
			{

				output("Stuff");
				kGAMECLASS.processTime(4);
		
				kGAMECLASS.flags["PLACEHOLDER_INSTALLED"] = 1;
				//Consume the item
				kGAMECLASS.pc.destroyItemByClass(Placeholder);
				//Display egg trainer options here.
				PlaceholderMenu();
		
				return true;
			}
	
			output("You must be onboard your ship in order to install the Placeholder.");
	
			return false;
		}
		
		public function PlaceholderUninstallation():void
		{
			clearOutput();
			kGAMECLASS.showName("\nUNINSTALLING...");
	
			output("You take some time to uninstall the Placeholder");
			output("\n\n<b>You no longer have the TamaniCorp Cunt Constructor installed!</b>");
	
			kGAMECLASS.processTime(8);
			kGAMECLASS.flags["PLACEHOLDER_INSTALLED"] = undefined;
	
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			output("\n\n");
			kGAMECLASS.quickLoot(new Placeholder());
		}
		
		//Use the placeholder
		public function installedPlaceholderBonus(btnSlot:int = 0):void
		{
			output("\n\nNearby, the TamaniCorp Placeholder hums with life.");
	
			addButton(btnSlot,"Placeholdeer", repeatPlaceholderApproach,undefined,"Placeholder","Use the TamaniCorp Placeholder");
		}
		
		public function repeatPlaceholderApproach():void
		{
			clearOutput();

			output("Lookin' good.");
			output("\n\nThe holo-screen on the front of the box presents you with several options....");
			kGAMECLASS.processTime(1);
			PlaceholderMenu();
		}
		
		//Selects vagina
		public function PlaceholderMenu():void
		{
			clearOutput();
			clearMenu();
			var btnSlot:int = 0;
			var pc:PlayerCharacter = kGAMECLASS.pc;
			
			if (!pc.hasVagina()) addDisabledButton(btnSlot, "Vagina", "Vagina", "You need a vagina to use this item");
			
			for (var i:int = 0; i < pc.vaginas.length; i++)
			{
				addButton(btnSlot, "Vagina " + (i + 1), PlaceholderSelectType, i, "Vagina " + (i+1), StringUtil.toDisplayCase(pc.vaginas[i].vaginaColor) + " " + GLOBAL.TYPE_NAMES[pc.vaginas[i].type]);
				btnSlot++;
			}
			addButton(13, "Uninstall", PlaceholderUninstallation);
			addButton(14,"Leave",leavePlaceholder);
		}
			
		//Selects vagina type to change to
		public function PlaceholderSelectType(vagina:int):void
		{
			clearMenu();
			clearOutput();
			var vaginaList:Array;
			var btnSlot:int = 0;			
			
			output("The holographic display renders each pussy in exquisite, loving detail through the power of purpose-built TamaniCorp engineering.");
			
			//For players just looking for a color change
			addButton(btnSlot, "No Change", PlaceholderSelectColor, [vagina, kGAMECLASS.pc.vaginas[vagina].type], "No Change", "Don't change the type of your pussy.");
			btnSlot++;
			
			//Build us our buttons
			for (var i:int = 0; i < GLOBAL.VALID_VAGINA_TYPES.length; i++)
			{
				//Ensures buttons don't overwrite the back button
				if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
				{
					addButton(btnSlot, "Back", PlaceholderMenu, "Back", "Go back to the main menu.");
					btnSlot++;
				}
			
				//Disabled button for PC's current hoo-ha type
				if (kGAMECLASS.pc.vaginas[vagina].type == GLOBAL.VALID_VAGINA_TYPES[i])
				{
					addDisabledButton(btnSlot, GLOBAL.TYPE_NAMES[GLOBAL.VALID_VAGINA_TYPES[i]], GLOBAL.TYPE_NAMES[GLOBAL.VALID_VAGINA_TYPES[i]], "Your vagina is already a " + GLOBAL.TYPE_NAMES[GLOBAL.VALID_VAGINA_TYPES[i]] + " vagina.");
					btnSlot++;
				}
				
				//Add buttons for unlocked cooch types
				else if (kGAMECLASS.pc.hasTypeUnlocked(GLOBAL.VALID_VAGINA_TYPES[i]))
				{
					addButton(btnSlot, GLOBAL.TYPE_NAMES[GLOBAL.VALID_VAGINA_TYPES[i]], PlaceholderSelectColor, [vagina, GLOBAL.VALID_VAGINA_TYPES[i]], "" + GLOBAL.TYPE_NAMES[GLOBAL.VALID_VAGINA_TYPES[i]] + "", "Changes your vagina to a " + GLOBAL.TYPE_NAMES[GLOBAL.VALID_VAGINA_TYPES[i]] + " vagina.");
					btnSlot++;
				}
			}
			
			//Ensures back button on the last page is in the right position
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addButton(btnSlot, "Back", PlaceholderMenu, "Back", "Go back to the main menu.");
		}
	
		//Selects color to change to (arg[0] which vagina, arg[1] which type)
		public function PlaceholderSelectColor(arg:Array):void
		{
			clearMenu();
			clearOutput();
			var btnSlot:int = 0;
			var colorList:Array = new Array;
			//Possible colors
			colorList.push("pink");
			colorList.push("red");
			colorList.push("bright red");
			colorList.push("dark red");
			colorList.push("orange");
			colorList.push("amber");
			colorList.push("green");
			colorList.push("blue");
			colorList.push("purple");
			colorList.push("black");
			colorList.push("gray");
			colorList.push("silver");

			output("The display focuses in on your selected type, and a series of color options appear on the selection interface.");
			
			//For players just looking for a type change
			addButton(btnSlot, "No Change", PlaceholderConfirmSelections, [arg[0], arg[1], kGAMECLASS.pc.vaginas[arg[0]].vaginaColor], "No Change", "Don't change the color of your pussy.");
			btnSlot++;
			
			for (var i:int = 0; i < colorList.length; i++)
			{
				//Ensures buttons don't overwrite the back button
				if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
				{
					addButton(btnSlot, "Back", PlaceholderSelectType, arg[0], "Back", "Go back to the type selection menu.");
					btnSlot++;
				}
			
				//Disabled button for PC's current hoo-ha color
				if (kGAMECLASS.pc.vaginas[arg[0]].vaginaColor == colorList[i])
				{
					addDisabledButton(btnSlot, StringUtil.toDisplayCase(colorList[i]), StringUtil.toDisplayCase(colorList[i]), "Your vagina is already " + colorList[i] + ".");
					btnSlot++;
				}
				
				//Add buttons for colors
				addButton(btnSlot, StringUtil.toDisplayCase(colorList[i]), PlaceholderConfirmSelections, [arg[0], arg[1], colorList[i]], StringUtil.toDisplayCase(colorList[i]), "Changes your vagina to " + colorList[i] + ".");
					btnSlot++;
			}
			
			//Ensures back button on the last page is in the right position
				while((btnSlot + 1) % 15 != 0) { btnSlot++; }
				addButton(btnSlot, "Back", PlaceholderSelectType, arg[0], "Back", "Go back to the type selection menu.");
		}
		
		//Confirms selections (arg[0] which vagina, arg[1] which type, arg[2] which color)
		public function PlaceholderConfirmSelections(arg:Array):void
		{
			clearOutput();
			clearMenu();
			output("Make changes?");
			output("\n\n<b>Vagina " + (arg[0]+1) + ":</b>");
			output("\nCurrent Type: " + GLOBAL.TYPE_NAMES[kGAMECLASS.pc.vaginas[arg[0]].type]);
			output("\nCurrent Color: " + StringUtil.toDisplayCase(kGAMECLASS.pc.vaginas[arg[0]].vaginaColor));
			output("\n\nNew Type: " + GLOBAL.TYPE_NAMES[arg[1]]);
			output("\nNew Color: " + StringUtil.toDisplayCase(arg[2]));
			
			addButton(0, "Confirm", PlaceholderChange, arg, "Confirm", "Make your selected changes.");
			addButton(1, "Back", PlaceholderSelectColor, [arg[0], arg[1]], "Back", "Go back to the color select menu.")
			addButton(2, "Cancel", leavePlaceholder, undefined, "Cancel", "Leave the Womb Forge without making any changes.");
		}
		
		//Changes vagina to selected type (arg[0] which vagina, arg[1] which type, arg[2] which color)
		public function PlaceholderChange(arg:Array):void
		{
			clearOutput();
			clearMenu();
			var pc:PlayerCharacter = kGAMECLASS.pc;
			var numChanges:int = 0;
			
			//Determine how many changes were made
			if (pc.vaginas[arg[0]].type != arg[1]) numChanges++;
			if (pc.vaginas[arg[0]].vaginaColor != arg[2]) numChanges++;

			//No changes selected
			if (numChanges == 0)
			{
				output("Masturbation! Wow!");
			}
			
			//Go go changes!
			else
			{
				output("Changes! Wow!");
			}
			
			//Executes changes
			if (numChanges > 0)
			{
				pc.shiftVagina(arg[0], arg[1]);
				pc.vaginas[arg[0]].vaginaColor = arg[2];
				pc.taint(numChanges);	
			}
			
			IncrementFlag("USED_Placeholder");
			addButton(0, "Next", PlaceholderMenu);
		}
		
		public function leavePlaceholder():void
		{
			clearOutput();
			output("You decide to leave the Placeholder for now.");
			clearMenu();
			if(InShipInterior()) addButton(0,"Next",kGAMECLASS.shipStorageMenuRoot);
			else addButton(0, "Next", mainGameMenu);	
		}
		
	}
}
