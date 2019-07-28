import classes.Items.Transformatives.Placeholder;
import classes.Characters.PlayerCharacter;

/*To do: Add in lock checks, tail vagina change type, actually get a name I guess, all the text 

Revamp getValidShiftTypes
-Pass name and type
-Check for invalid PC types

Check for invalid PC genital types
-Check for vagina flags that aren't universal
 
Upgrade buy menu
Duplicate vagina
Customzie vagina
 */
public var placeholderPrice:int = 100000;
public var placeholderAnimalUpgradePrice:int = 1;
public var placeholderUpgradePrice:int = 1;
public var placeholderDuplicatorPrice:int = 1;
public var placeholderDeluxePrice:int = 1;

public function canBuyPlaceholder():Boolean
{
	if (pc.hasItemInStorageByClass(Placeholder) || pc.hasItemByClass(Placeholder) || flags["PLACEHOLDER_INSTALLED"] == 1 || flags["PLACEHOLDER_DELIVERY_WAITING"] == true) return false;
	else return true;
}

public function placeholderDeliveryInstallation():void
{
	clearOutput();
	clearMenu();
	author("Thebiologist");
	
	output("Delivery for Ino Weiner? Oh great \n\n")
	flags["PLACEHOLDER_INSTALLED"] = 1;
	flags["PLACEHOLDER_DELIVERY_WAITING"] = false;
	
	addButton(0, "Next", placeholderMainMenu, undefined, "Next", "Check out your new placeholder");
}

public function placeholderInstallation():Boolean
{
	clearOutput();
	showName("\nINSTALLING...");
	showBust("");
	author("Thebiologist");
	
	if (InShipInterior())
	{
		output("Stuff");
		kGAMECLASS.processTime(4);
		kGAMECLASS.flags["PLACEHOLDER_INSTALLED"] = 1;
		//Consume the item
		kGAMECLASS.pc.destroyItemByClass(Placeholder);
		
		placeholderMainMenu();
		
		return true;
	}
	
	output("You must be onboard your ship in order to install the placeholder.");
	
	return false;
}

//Uninstall
public function placeholderUninstallation():void
{
	clearOutput();
	showName("\nUNINSTALLING...");
	showBust("");
	author("Thebiologist");
	
	output("You take some time to uninstall the placeholder");
	output("\n\n<b>You no longer have the TamaniCorp placeholder installed!</b>");
	
	kGAMECLASS.processTime(8);
	kGAMECLASS.flags["PLACEHOLDER_INSTALLED"] = undefined;
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	output("\n\n");
	kGAMECLASS.quickLoot(new Placeholder());
}

//Use the placeholder from the storage menu
public function installedPlaceholderBonus(btnSlot:int = 0):void
{
	showName("Placeholder");
	output("\n\nNearby, the TamaniCorp placeholder hums with life.");
	
	addButton(btnSlot, "Placeholdeer", placeholderMainMenu, undefined, "placeholder", "Use the TamaniCorp placeholder");
}

//Selects vagina
public function placeholderMainMenu():void
{
	clearMenu();
	clearOutput();
	showName("Placeholder");
	showBust("");
	author("Thebiologist");
	var btnSlot:int = 0;
	var pc:PlayerCharacter = kGAMECLASS.pc;
	
	if (!pc.hasVagina()) addDisabledButton(btnSlot, "Vagina", "Vagina", "You need a vagina to use this item");
	else output("Pick a vagina:");
	
	for (var i:int = 0; i < pc.vaginas.length; i++)
	{
		addButton(btnSlot, "Vagina " + (i + 1), placeholderCustomizeMenu, i, "Vagina " + (i + 1), StringUtil.toDisplayCase(pc.vaginas[i].vaginaColor) + " " + GLOBAL.TYPE_NAMES[pc.vaginas[i].type]);
		btnSlot++;
	}
	
	//Tailgina button
	if (pc.hasTailCunt()) addButton(btnSlot, "Tailgina" + (pc.hasTails() ? "s" : ""), placeholderCustomizeMenu, -1, "Tailgina" + (pc.hasTails() ? "s" : ""), "Description");
	
	addButton(12, "Store", placeholderBuyMenu);
	addButton(13, "Uninstall", placeholderUninstallation);
	addButton(14, "Leave", leaveplaceholder);
}

//Shows customization options for selected vagina
public function placeholderCustomizeMenu(vagina:int):void
{
	clearMenu();
	clearOutput();
	showName("Placeholder");
	showBust("");
	author("Thebiologist");
	output("Fancy! Spectacle!");
	
	//Vagina buttons
	if (vagina != -1)
	{
		output("How are you going to customize your vagina?");
	
		addButton(0, "Type", placeholderSelectType, vagina, "Type", "Change the type of your " + GLOBAL.TYPE_NAMES[pc.vaginas[vagina].type]);
		addButton(1, "Color", placeholderSelectColorMenu, vagina, "Color", "Change the color of your " + GLOBAL.TYPE_NAMES[pc.vaginas[vagina].type] + " pussy.");
		if (!pc.vaginas[vagina].hasFlag(GLOBAL.FLAG_HYPER_PUMPED)) addButton(2, "Inflate", placeholderChangePuffiness, [vagina, true], "Inflate", "Puff up your vagina.");
		else addDisabledButton(2, "Inflate", "Inflate", "Your vagina is already as puffy as it can get!");
	
		if (pc.vaginalPuffiness(vagina, true) != 0) addButton(3, "Deflate", placeholderChangePuffiness, [vagina, false], "Deflate", "Deflate your vagina.");
		else addDisabledButton(3, "Deflate", "Deflate", "Your vagina is already as small as it can be!");
	}
	
	//Tailgina buttons
	else
	{
		output("How are you going to customize your tailgina?");
	
		addButton(0, "Type", placeholderSelectType, vagina, "Type", "Change the type of your " + GLOBAL.TYPE_NAMES[pc.vaginas[vagina].type]);
		addButton(1, "Color", placeholderSelectColorMenu, vagina, "Color", "Change the color of your " + GLOBAL.TYPE_NAMES[pc.vaginas[vagina].type] + " pussy.");
	}
	
	addButton(14, "Back", placeholderMainMenu, undefined, "Back", "Go back to the main menu.");
}

//Selects vagina type to change to
public function placeholderSelectType(vagina:int):void
{
	clearMenu();
	clearOutput();
	showName("Placeholder");
	showBust("");
	author("Thebiologist");
	var vaginaList:Array;
	var btnSlot:int = 0;
	
	output("The holographic display renders each pussy in exquisite, loving detail through the power of purpose-built TamaniCorp engineering.");
	
	//Build us our buttons
	for (var i:int = 0; i < GLOBAL.VALID_VAGINA_TYPES.length; i++)
	{
		//Ensures buttons don't overwrite the back button
		if (btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", placeholderCustomizeMenu, vagina, "Back", "Go back to the customize menu.");
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
			addButton(btnSlot, GLOBAL.TYPE_NAMES[GLOBAL.VALID_VAGINA_TYPES[i]], placeholderChangeType, [vagina, GLOBAL.VALID_VAGINA_TYPES[i]], "" + GLOBAL.TYPE_NAMES[GLOBAL.VALID_VAGINA_TYPES[i]] + "", "Changes your vagina to a " + GLOBAL.TYPE_NAMES[GLOBAL.VALID_VAGINA_TYPES[i]] + " vagina.");
			btnSlot++;
		}
	}
	
	//Ensures back button on the last page is in the right position
	while ((btnSlot + 1) % 15 != 0)
	{
		btnSlot++;
	}
	addButton(btnSlot, "Back", placeholderCustomizeMenu, vagina, "Back", "Go back to the customization menu.");
}

//Selects which list of colors to use.
public function placeholderSelectColorMenu(vagina:int):void
{
	clearMenu();
	clearOutput();
	showName("Placeholder");
	showBust("");
	author("Thebiologist");
	
	output("Pick a color list:");
	
	addButton(0, "Terran", placeholderSelectColor, [vagina, "terran"], "Terran", "Choose a Terran color for your " + (vagina != -1 ? "vagina":"tailgina" + (pc.hasTails() ? "s":"")) + ".");
	addButton(1, "Vibrant", placeholderSelectColor, [vagina, "vibrant"], "Vibrant", "Choose a vibrant color for your " + (vagina != -1 ? "vagina":"tailgina" + (pc.hasTails() ? "s":"")) + ".");
	addButton(2, "Metallic", placeholderSelectColor, [vagina, "metallic"], "Metallic", "Choose a metallic color for your " + (vagina != -1 ? "vagina":"tailgina" + (pc.hasTails() ? "s":"")) + ".");
	addButton(3, "Glowing", placeholderSelectColor, [vagina, "glowing"], "Glowing", "Choose a glowing color for your " + (vagina != -1 ? "vagina":"tailgina" + (pc.hasTails() ? "s":"")) + ".");
	
	addButton(14, "Back", placeholderCustomizeMenu, vagina, "Back", "Go back to the customization menu.");
}

//Selects color to change to (arg[0] which vagina, arg[1] which color list)
public function placeholderSelectColor(arg:Array):void
{
	clearMenu();
	clearOutput();
	showName("Placeholder");
	showBust("");
	author("Thebiologist");
	var btnSlot:int = 0;
	var colorList:Array = new Array;
	//Possible colors
	switch (arg[1])
	{
	case "terran": 
		colorList.push("pale");
		colorList.push("fair");
		colorList.push("tan");
		colorList.push("olive");
		colorList.push("dusky");
		colorList.push("dark");
		colorList.push("ebony");
		break;
	case "vibrant": 
		colorList.push("red");
		colorList.push("dark red");
		colorList.push("orange");
		colorList.push("pale green");
		colorList.push("viridescent");
		colorList.push("aqua");
		colorList.push("sky blue");
		colorList.push("blue");
		colorList.push("purple");
		colorList.push("pink");
		colorList.push("black");
		colorList.push("white");
		colorList.push("black and white");
		colorList.push("black and yellow");
		break;
	case "metallic": 
		colorList.push("bronze");
		colorList.push("silver");
		colorList.push("gold");
		colorList.push("platinum");
		colorList.push("onyx");
		colorList.push("brass");
		colorList.push("cobalt");
		colorList.push("candy red");
		colorList.push("emerald");
		break;
	case "glowing": 
		colorList.push("glowing red");
		colorList.push("glowing orange");
		colorList.push("glowing amber");
		colorList.push("glowing gold");
		colorList.push("glowing pink");
		colorList.push("luminous silver");
		colorList.push("luminous green");
		colorList.push("luminous cyan");
		colorList.push("luminous blue");
		colorList.push("luminous violet");
		colorList.push("hot white");
		if (pc.level >= 6) colorList.push("glowing ember");
		if (pc.level >= 6) colorList.push("fiery blue");
		break;
	}
	
	output("Change color?");
	
	for (var i:int = 0; i < colorList.length; i++)
	{
		//Ensures buttons don't overwrite the back button
		if (btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", placeholderCustomizeMenu, arg[0], "Back", "Go back to the type selection menu.");
			btnSlot++;
		}
		
		//Tail genital buttons
		if (arg[0] == -1)
		{
			//Disabled button for PC's current tail genital color
			if (pc.tailGenitalColor == colorList[i])
			{
				addDisabledButton(btnSlot, StringUtil.toDisplayCase(colorList[i]), StringUtil.toDisplayCase(colorList[i]), "Your " + (pc.hasTails() ? "tailginas are ":"tailgina is ") + "already " + colorList[i] + ".");
				btnSlot++;
			}

			//Add buttons for colors
			else
			{
				addButton(btnSlot, StringUtil.toDisplayCase(colorList[i]), placeholderChangeColor, [arg[0], colorList[i]], StringUtil.toDisplayCase(colorList[i]), "Changes your " + (pc.hasTails() ? "tailginas":"tailgina") + " to " + colorList[i] + ".");
				btnSlot++;
			}
		}
		
		//Vagina buttons
		else 
		{
			//Disabled button for PC's current hoo-ha color
			if (pc.vaginas[arg[0]].vaginaColor == colorList[i])
			{
				addDisabledButton(btnSlot, StringUtil.toDisplayCase(colorList[i]), StringUtil.toDisplayCase(colorList[i]), "Your vagina is already " + colorList[i] + ".");
				btnSlot++;
			}

			//Add buttons for colors
			else
			{
				addButton(btnSlot, StringUtil.toDisplayCase(colorList[i]), placeholderChangeColor, [arg[0], colorList[i]], StringUtil.toDisplayCase(colorList[i]), "Changes your vagina to " + colorList[i] + ".");
				btnSlot++;
			}
		}
	}
	
	//Ensures back button on the last page is in the right position
	while ((btnSlot + 1) % 15 != 0)
	{
		btnSlot++;
	}
	addButton(btnSlot, "Back", placeholderSelectColorMenu, arg[0], "Back", "Go back to the color list selection menu.");
}

//Changes vagina to selected type (arg[0] which vagina, arg[1] which type)
public function placeholderChangeType(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("Placeholder");
	showBust("");
	author("Thebiologist");
	
	//Regular vaginas
	if (arg[0] != -1)
	{
		output("Change type! Wow!");
		pc.shiftVagina(arg[0], arg[1]);
	}
	
	//Tailgina
	else
	{
		output("Change tailgina type! Wow!");
	}
	
	IncrementFlag("USED_placeholder");
	addButton(0, "Next", placeholderMainMenu);
}

//Changes vagina to selected color (arg[0] which vagina, arg[1] which color)
public function placeholderChangeColor(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("Placeholder");
	showBust("");
	author("Thebiologist");
	
	if (arg[0] != -1)
	{
		output("Change color! Wow!");
		pc.vaginas[arg[0]].vaginaColor = arg[1];
	}
	
	else
	{
		output("Change tailgina color!");
		pc.tailGenitalColor = arg[1];
	}
	
	IncrementFlag("USED_placeholder");
	addButton(0, "Next", placeholderMainMenu);
}

//arg[0] which vagina, arg[1] inflate or deflate (true == inflate)
public function placeholderChangePuffiness(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("Placeholder");
	showBust("");
	author("Thebiologist");
	
	if (arg[1]) output("Inflate! Wow!");
	else output("Deflate! Wow!");
	
	if (arg[1]) pc.inflateVagina(arg[0]);
	else pc.deflateVagina(arg[0]);
	IncrementFlag("USED_PLACEHOLDER");
	addButton(0, "Next", placeholderMainMenu);
}

//Menu of available upgrades.
public function placeholderBuyMenu():void
{
	showName("Placeholder");
	showBust("");
	author("Thebiologist");
	clearMenu();
	clearOutput();
	
	output("Stuff!");
	
	addButton(0, "Animal Upgrade", placeholderConfirmBuy, [kGAMECLASS.vendorToggle, 0], "Animal Upgrade", "Buy the animal upgrade.");
	
	addButton(14, "Back", placeholderMainMenu, undefined, "Back", "Go back to the main menu.");
}

public function placeholderConfirmBuy(showConfirmation:Boolean, option:int):void
{
	if (showConfirmation)
	{
		
	}
	else
	{
		
	}
}

//Leave the placeholder menu
public function leaveplaceholder():void
{
	showName("Placeholder");
	showBust("");
	author("Thebiologist");
	
	clearOutput();
	output("You decide to leave the placeholder for now.");
	clearMenu();
	if (InShipInterior()) addButton(0, "Next", kGAMECLASS.shipStorageMenuRoot);
	else addButton(0, "Next", mainGameMenu);
}