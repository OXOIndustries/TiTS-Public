import classes.Characters.Varmint;
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

//flags["PLACEHOLDER_INSTALLED"] == 2 means delivery waiting
//flags["PLACEHOLDER_INSTALLED"] == 1 means installed on ship
public var placeholderPrice:int = 100000;
private var placeholderCodexUpgradePrice:int = 25000;
private var placeholderDuplicatorPrice:int = 75000;
private var placeholderDeluxePrice:int = 100000;
private var tailginaFlags:Array = [GLOBAL.FLAG_OVIPOSITOR, GLOBAL.FLAG_FLARED, GLOBAL.FLAG_SHEATHED, GLOBAL.FLAG_KNOTTED, GLOBAL.FLAG_RIBBED, GLOBAL.FLAG_NUBBY, GLOBAL.FLAG_APHRODISIAC_LACED, GLOBAL.FLAG_TENDRIL]
private var defaultPussyTypes:Array = [GLOBAL.TYPE_HUMAN, GLOBAL.TYPE_KUITAN, GLOBAL.TYPE_LEITHAN, GLOBAL.TYPE_GRYVAIN, GLOBAL.TYPE_SIREN, GLOBAL.TYPE_EQUINE, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_FELINE, GLOBAL.TYPE_VULPINE, GLOBAL.TYPE_SHARK, GLOBAL.TYPE_SWINE, GLOBAL.TYPE_AVIAN];
private var defaultTailginaTypes:Array = [GLOBAL.TYPE_HUMAN, GLOBAL.TYPE_GRYVAIN, GLOBAL.TYPE_EQUINE, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_FELINE, GLOBAL.TYPE_VULPINE];

public function canBuyPlaceholder():Boolean
{
	if (pc.hasItemInStorageByClass(Placeholder) || pc.hasItemByClass(Placeholder) || flags["PLACEHOLDER_INSTALLED"] == 1 || flags["PLACEHOLDER_INSTALLED"] == 2) return false;
	else return true;
}

public function placeholderDeliveryInstallation():void
{
	clearOutput();
	clearMenu();
	author("Thebiologist");
	showName("PLACEHOLDER\nDELIVERY");
	
	output("As you enter your trusty [pc.ship], you're met with an interesting scene. Your delivery is here, and so is the drone - hovering right above. The damn thing is blasting the corny fanfare from the commercial at full volume while displaying the TamaniCorp logo. You sigh. So much for subtlety.");
	
	output("\n\nThe drone chirps as soon as it notices you and then scans you. <i>“Client: [pc.name] Steele. Identity confirmed. Package delivery confirmed. Enjoy your: Placeholder Home Edition, version 7. TamaniCorp thanks you for your purchase. Have a nice day.”</i> Before you can even reply or react, the drone zooms out of your ship, leaving you completely stunned by the whole situation.");
	
	if (crew(true) > 0) output("\n\n You notice someone snickering at the end of the corridor. Great, so your crew knows as well.");
	
	output("\n\nNow, what the hell are you supposed to do with this damn thing?! There's a massive, wooden crate in the middle of the room! Well, first things first. You go fetch a crowbar and unpack the whole thing. Your brand new Placeholder is just what you were expecting. After a quick inspection to check if there are any factory imperfections and if every piece is there, you go to the cargo bay and bring back a grav-lifter to transport the machine to a more appropriate room.");
	
	output("\n\nOnce there, all that's left is installing the machine. Everything comes pre-assembled, so it should be as simple as plugging it to an electric outlet. One cable there... the other one... here, and this one over there. Now, this one should fit in this socket... damnit! Why so many cables? Alright, everything's now plugged, now all that's left is to turn it on.");
	
	output("\n\nBig red button - just the way you like it. You press it and wait for it to boot up. The machine lights up slowly and plays a simple tune. <i>“Welcome to TamaniCorp's Placeholder user interface. Connecting to local ExtraNet.”</i> Alright, it's done, now you can fiddle with- <i>“Receiving update 1/138.”</i> Of fucking course...");
	
	output("\n\nAfter waiting for several, endless minutes, the machine chirps again. <i>“Rebooting and installing upgrades.”</i> You sigh and plant the palm of your hand over your face. A few more minus later and the device is finally ready.");
	
	output("\n\n<i>“Welcome to TamaniCorp's Placeholder user interface. You may use the virtual screen to navigate or state your inquiry. Loading tutorial.”</i> No, damn thing, you don't need a tutorial!");
	
	output("\n\n<i>“To operate the Placeholder, all you need to do is select 'pussy modification' in the main menu. Once selected, specify your body type and the adaptable seating will adjust to your needs. Insert an omniversal bio-cartridge in the cartridge slot and sit down. Once ready to begin, select the desired vagina type. Alternatively, if you possess personal microsurgeons, you may link automatically without our system and the Placeholder will adapt to your body type on its own. This option also removes the need for bio-cartridges. If you possess microsurgeons, you may link with the Placeholder now or afterwards.”</i>");
	
	output("\n\nMight as well do it now. You swipe your hand over the machine, hoping it reacts or something. True to your wishes, the machine beeps. <i>“Microsurgeons recognized. Updating firmware. 1/47.”</i> No! Damnit! After several agonizing minutes, the device beeps again.");
	
	output("\n\n<i>“Microsurgeons successfully linked. The seating and profile will adapt and update automatically to suit your needs. Continuing tutorial.”</i> Wait! You don't- <i>“Once the vagina type is selected, you may begin the procedure. Stand as still as possible. Straps will secure you for your safety. You may experience slight discomfort or intense pleasure. This is normal operating procedure. Remain calm and don't struggle. Once the procedure is over, please take a few minutes to recuperate, then vacate the device. The Placeholder has a self-cleaning, automatic mode.”</i>");
	
	output("\n\nFinally, it's over now you- <i>“The Placeholder also possesses an in-app store that would allow you to purchase additional modifications present or future. Disclaimer: Tampering with the Placeholder or its trademarked software may result in ExtraNet privileges being revoked, as well as civilian liability charges. Thank you for your purchase and enjoy.”</i>");
	
	output("\n\nFinally... Now, what will you do?");
	
	flags["PLACEHOLDER_INSTALLED"] = 1;
	
	addButton(0, "Next", placeholderMainMenu, undefined, "Next", "Check out your new placeholder");
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
	showName("\nPLACEHOLDER");
	output("\n\nYour brand-new Placeholder is powered up but idling and ready to be used at a moment's notice.");
	
	addButton(btnSlot, "Placeholder", placeholderMainMenu, undefined, "placeholder", "Make use of your Placeholder.");
}

//Selects vagina
public function placeholderMainMenu():void
{
	clearMenu();
	clearOutput();
	showName("\nPLACEHOLDER");
	showBust("");
	author("Thebiologist");
	var btnSlot:int = 0;
	
	output("You get closer to your Placeholder and start the machine. It chirps and speaks up.");
	
	output("\n\n<i>“Welcome to Placeholder's user interface. I'm your personal V.I. assistant. You may browse my catalog and select an option or you may state your desires.”</i>");
	
	output("\n\nWell, time to decide. ");
	if (!pc.hasVagina() && !pc.hasTailCunt())
	{
		output("Or it would be if you had a vagina...");
		addDisabledButton(btnSlot, "Pussy", "Pussy", "You should get a pussy or tailcunt before attempting to modify it.");
	}
	
	for (var i:int = 0; i < pc.vaginas.length; i++)
	{
		addButton(btnSlot, "Pussy " + (i + 1), placeholderCustomizeMenu, i, "Modify", "Take your junk for a spin. Time to mod your snatch.");
		btnSlot++;
	}
	
	//Tailgina button
	if (pc.hasTailCunt()) addButton(btnSlot, "Tailcunt" + (pc.hasTails() ? "s" : ""), placeholderCustomizeMenu, -1, "Tailcunt" + (pc.hasTails() ? "s" : ""), (pc.hasTails() ? "Modify your tailginas.":"Modify your tailgina."));
	
	addButton(12, "Store", placeholderBuyMenu, undefined, "Store", "Browse the add-on store and purchase new modifications.");
	addButton(13, "Uninstall", placeholderUninstallation);
	addButton(14, "Back off", leaveplaceholder, undefined, "Back off", "Leave the machine alone.");
}

//Shows customization options for selected vagina
public function placeholderCustomizeMenu(vagina:int):void
{
	clearMenu();
	clearOutput();
	showName("\nPLACEHOLDER");
	showBust("");
	author("Thebiologist");
	output("Please select the desired modification from the menu.\n");
	var i:int = 0;
	var tailginaFlagString:String = "";
	
	//Vagina Description
	if (vagina != -1)
	{
		output("\n<b><u>Vagina</u></b>");
		output("\n<b>* Type:</b>");
		output(" " + GLOBAL.TYPE_NAMES[pc.vaginas[vagina].type]);
		output("\n<b>* Color:</b>");
		output(" " + StringUtil.toDisplayCase(pc.vaginas[vagina].vaginaColor));
		if (pc.vaginas[vagina].vagooFlags.length > 0)
		{
			output("\n<b>* Flags:</b>");
			for (i; i < pc.vaginas[vagina].vagooFlags.length; )
			{
				output(" " + GLOBAL.FLAG_NAMES[pc.vaginas[vagina].vagooFlags[i]]);
				i++;
				if (i < pc.vaginas[vagina].vagooFlags.length) output(",");
			}
		}
		output("\n<b>* Girlcum, Type:</b> " + GLOBAL.FLUID_TYPE_NAMES[pc.girlCumType]);
		output("\n<b>* Hymen:</b>");
		if (pc.vaginas[vagina].hymen) output(" Virgin");
		else output(" Taken");
		output("\n<b>* Wetness Level:</b> " + formatFloat(pc.vaginas[vagina].wetness(), 3));
		if (pc.vaginas[vagina].wetness() >= 4) output(", Squirter");
		if (pc.vaginas[vagina].clits > 0)
		{
			output("\n<b>* Clitoris:</b> " + pc.vaginas[vagina].clits);
			output("\n<b>* Clitoris, Length:</b> " + prettifyLength(pc.clitLength));
		}
		if (pc.vaginas[vagina].bonusCapacity == 0) output("\n<b>* Capacity:</b> " + prettifyVolume(pc.vaginalCapacity(vagina)));
		else
		{
			output("\n<b>* Capacity, Bonus:</b> " + prettifyVolume(pc.vaginas[vagina].bonusCapacity));
		}
		output("\n<b>* Looseness Level, Current:</b> " + formatFloat(pc.vaginas[vagina].looseness(), 3));
		output("\n<b>* Looseness Level, Minimum:</b> " + formatFloat(pc.vaginas[vagina].minLooseness, 3));
	}
	
	//Tailgina Description
	else
	{
		output("\n<b><u>" + (pc.hasTails() ? "Tailginas" : "Tailgina") + "</u></b>");
		output("\n<b>* Type:</b>");
		output(" " + GLOBAL.TYPE_NAMES[pc.tailGenitalArg]);
		output("\n<b>* Color:</b>");
		output(" " + StringUtil.toDisplayCase(pc.tailGenitalColor));
		if (pc.tailFlags.length > 0)
		{
			output("\n<b>* Flags:</b>");
			for (i; i < tailginaFlags.length; )
			{
				if (pc.hasTailFlag(tailginaFlags[i]))
				{
					if (tailginaFlagString != "") tailginaFlagString += ",";
					tailginaFlagString += (" " + GLOBAL.FLAG_NAMES[tailginaFlags[i]]);
				}
				i++;
			}
			output(tailginaFlagString);
		}
	}
	
	//Vagina buttons
	if (vagina != -1)
	{
		output("\n\nHow are you going to customize your vagina?");
		
		addButton(0, "Type", placeholderSelectType, vagina, "Type", "Change the type of your " + GLOBAL.TYPE_NAMES[pc.vaginas[vagina].type]);
		if (flags["PLACEHOLDER_DELUXE_EDITION"])
		{
			addButton(1, "Color", placeholderSelectColorMenu, vagina, "Color", "Change the color of your " + GLOBAL.TYPE_NAMES[pc.vaginas[vagina].type] + " pussy.");
			addButton(2, "Add Flag", placeholderSelectFlag, [vagina, true], "Add Flag", "Choose a flag to add to your vagina.");
			
			if (pc.vaginas[vagina].vagooFlags.length > 0) addButton(3, "Remove Flag", placeholderSelectFlag, [vagina, false], "Remove Flag", "Choose a flag to remove from your vagina.");
			else addDisabledButton(3, "Remove Flag", "Remove Flag", "You don't have any flags to remove.");
			
			addButton(4, "Girl Cum", placeholderSelectGirlCumType, vagina, "Change Girl Cum Type", "Change the type of your girl cum.");
			
			if (pc.vaginas[vagina].hymen) addDisabledButton(5, "Regen Hymen", "Regen Hymen", "Your vagina's hymen is intact.");
			else addButton(5, "Regen Hymen", placeholderChangeHymen, vagina, "Regen Hymen", "Regenerate your vagina's hymen.");
			
			if (pc.vaginas[vagina].wetnessRaw >= 8) addDisabledButton(6, "Increase Wetness", "Increase Wetness", "Your vagina is already as wet as this machine can make it.");
			else addButton(6, "Increase Wetness", placeholderChangeWetness, [vagina, true], "Increase Wetness", "Increase the wetness of your vagina.");
			
			if (pc.vaginas[vagina].wetnessRaw <= 0) addDisabledButton(7, "Decrease Wetness", "Decrease Wetness", "Your vagina is already as dry as this machine can make it.");
			else addButton(7, "Decrease Wetness", placeholderChangeWetness, [vagina, false], "Decrease Wetness", "Decrease the wetness of your vagina.");
			
			addButton(8, "Add Clit", placeholderChangeClitNumber, [vagina, true], "Add Clit", "Add a clitoris to your vagina.");
			
			if (pc.vaginas[vagina].clits <= 1) addDisabledButton(9, "Remove Clit", "Remove Clit", "Your vagina already has the smallest number of clits possible.");
			else addButton(9, "Remove Clit", placeholderChangeClitNumber, [vagina, false], "Remove Clit", "Remove one of your clits.");
			
			if (pc.clitLength >= 12) addDisabledButton(10, "Lengthen Clits", "Lengthen Clits", "Your clits are already as long as this machine can make them.");
			else addButton(10, "Lengthen Clits", placeholderChangeClitLength, [vagina, true], "Lengthen Clits", "Lengthen your clits.");
			
			if (pc.clitLength <= 0.1) addDisabledButton(11, "Shrink Clits", "Shrink Clits", "Your clits are already as small as this machine can make them.");
			else addButton(11, "Shrink Clits", placeholderChangeClitLength, [vagina, false], "Shrink Clits", "Shrink your clits.");
			
			if (pc.vaginas[vagina].bonusCapacity >= 800) addDisabledButton(12, "Increase Cap.", "Increase Capacity", "Your vagina is already as capacious as this machine can make it.");
			else addButton(12, "Increase Cap.", placeholderChangeBonusCapacity, [vagina, true], "Increase Capacity", "Increase your vagina's bonus capacity.");
			
			if (pc.vaginas[vagina].bonusCapacity <= 0) addDisabledButton(13, "Decrease Cap.", "Decrease Capacity", "Your vagina is already as tight as this machine can make it.");
			else addButton(13, "Decrease Cap.", placeholderChangeBonusCapacity, [vagina, false], "Decrease Capacity", "Decrease the bonus capacity of your vagina.");
		}
	}
	
	//Tailgina buttons
	else
	{
		output("\n\nHow are you going to customize your tailgina?");
		
		addButton(0, "Type", placeholderSelectType, vagina, "Type", "Change the type of your " + GLOBAL.TYPE_NAMES[pc.tailGenitalArg]);
		if (flags["PLACEHOLDER_DELUXE_EDITION"])
		{
			addButton(1, "Color", placeholderSelectColorMenu, vagina, "Color", "Change the color of your " + GLOBAL.TYPE_NAMES[pc.tailGenitalArg] + " pussy.");
			addButton(2, "Add Flag", placeholderSelectFlag, [vagina, true], "Add Flag", (pc.hasTails() ? "Add a flag to your tailginas.":"Add a flag to your tailgina."));
			if (tailginaFlagString == "") addDisabledButton(3, "Remove Flag", "Remove Flag", (pc.hasTails() ? "Your tailginas have no flags.":"Your tailgina has no flags."));
			else addButton(3, "Remove Flag", placeholderSelectFlag, [vagina, false], "Remove Flag", (pc.hasTails() ? "Remove a flag from your tailginas.":"Remove a flag from your tailgina."));
		}
	}
	
	addButton(14, "Back", placeholderMainMenu, undefined, "Back", "Go back to the main menu.");
}

//MENU SELECTIONS
//Selects vagina type to change to
public function placeholderSelectType(vagina:int):void
{
	clearMenu();
	clearOutput();
	showName("\nPLACEHOLDER");
	showBust("");
	author("Thebiologist");
	var vaginaList:Array;
	var btnSlot:int = 0;
	var btnName:String;
	var i:int = 0;
	
	output("Select a type:");
	
	//Vagina buttons
	if (vagina != -1)
	{
		//Build us our buttons
		for (i; i < GLOBAL.VALID_VAGINA_TYPES.length; i++)
		{
			//Ensures buttons don't overwrite the back button
			if (btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
			{
				addButton(btnSlot, "Back", placeholderCustomizeMenu, vagina, "Back", "Go back to the customize menu.");
				btnSlot++;
			}
			
			btnName = GLOBAL.TYPE_NAMES[GLOBAL.VALID_VAGINA_TYPES[i]];
			//Disabled button for PC's current hoo-ha type
			if (pc.vaginas[vagina].type == GLOBAL.VALID_VAGINA_TYPES[i])
			{
				addDisabledButton(btnSlot, btnName, btnName, "Your vagina is already a " + btnName + " vagina.");
				btnSlot++;
			}
			
			//Add buttons for unlocked cooch types
			else if (pc.hasTypeUnlocked(GLOBAL.VALID_VAGINA_TYPES[i]))
			{
				addButton(btnSlot, btnName, placeholderChangeType, [vagina, GLOBAL.VALID_VAGINA_TYPES[i]], btnName, "Changes your vagina to a " + btnName + " vagina.");
				btnSlot++;
			}
			
		}
	}
	
	//Tailgina buttons
	else
	{
		//Build us our buttons
		for (i; i < GLOBAL.VALID_TAIL_GENITAL_ARGS.length; i++)
		{
			//Ensures buttons don't overwrite the back button
			if (btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
			{
				addButton(btnSlot, "Back", placeholderCustomizeMenu, vagina, "Back", "Go back to the customize menu.");
				btnSlot++;
			}
			
			btnName = GLOBAL.TYPE_NAMES[GLOBAL.VALID_TAIL_GENITAL_ARGS[i]];
			
			//Disabled button for PC's current tailgina type
			if (pc.tailGenitalArg == GLOBAL.VALID_TAIL_GENITAL_ARGS[i])
			{
				addDisabledButton(btnSlot, btnName, btnName, "Your " + (pc.hasTails() ? "tailginas are" : "tailgina is") + "  already " + btnName);
				btnSlot++;
			}
			
			//Add buttons for unlocked cooch types
			else if (pc.hasTypeUnlocked(GLOBAL.VALID_TAIL_GENITAL_ARGS[i]))
			{
				addButton(btnSlot, btnName, placeholderChangeType, [vagina, GLOBAL.VALID_TAIL_GENITAL_ARGS[i]], btnName, "Changes your " + (pc.hasTails() ? "tailginas to " + btnName + " tailginas." : "tailgina to a " + btnName + " tailgina."));
				btnSlot++;
			}
			
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
	showName("\nPLACEHOLDER");
	showBust("");
	author("Thebiologist");
	
	output("Pick a color list:");
	
	addButton(0, "Terran", placeholderSelectColor, [vagina, "terran"], "Terran", "Choose a Terran color for your " + (vagina != -1 ? "vagina" : "tailgina" + (pc.hasTails() ? "s" : "")) + ".");
	addButton(1, "Vibrant", placeholderSelectColor, [vagina, "vibrant"], "Vibrant", "Choose a vibrant color for your " + (vagina != -1 ? "vagina" : "tailgina" + (pc.hasTails() ? "s" : "")) + ".");
	addButton(2, "Metallic", placeholderSelectColor, [vagina, "metallic"], "Metallic", "Choose a metallic color for your " + (vagina != -1 ? "vagina" : "tailgina" + (pc.hasTails() ? "s" : "")) + ".");
	addButton(3, "Glowing", placeholderSelectColor, [vagina, "glowing"], "Glowing", "Choose a glowing color for your " + (vagina != -1 ? "vagina" : "tailgina" + (pc.hasTails() ? "s" : "")) + ".");
	
	addButton(14, "Back", placeholderCustomizeMenu, vagina, "Back", "Go back to the customization menu.");
}

//Selects color to change to (arg[0] which vagina, arg[1] which color list)
public function placeholderSelectColor(arg:Array):void
{
	clearMenu();
	clearOutput();
	showName("\nPLACEHOLDER");
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
	
	output("Select a color:");
	
	for (var i:int = 0; i < colorList.length; i++)
	{
		//Ensures buttons don't overwrite the back button
		if (btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", placeholderSelectColorMenu, arg[0], "Back", "Go back to the color list selection menu.");
			btnSlot++;
		}
		
		//Tail genital buttons
		if (arg[0] == -1)
		{
			//Disabled button for PC's current tail genital color
			if (pc.tailGenitalColor == colorList[i])
			{
				addDisabledButton(btnSlot, StringUtil.toDisplayCase(colorList[i]), StringUtil.toDisplayCase(colorList[i]), "Your " + (pc.hasTails() ? "tailginas are " : "tailgina is ") + "already " + colorList[i] + ".");
				btnSlot++;
			}
			
			//Add buttons for colors
			else
			{
				addButton(btnSlot, StringUtil.toDisplayCase(colorList[i]), placeholderChangeColor, [arg[0], colorList[i]], StringUtil.toDisplayCase(colorList[i]), "Changes your " + (pc.hasTails() ? "tailginas" : "tailgina") + " to " + colorList[i] + ".");
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

//Choose flag to add or remove (arg[0] which vagina, arg[1] add or remove (true == add)
public function placeholderSelectFlag(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nPLACEHOLDER");
	showBust("");
	author("Thebiologist");
	
	var i:int = 0;
	var flagName:String;
	var btnSlot:int = 0;
	var tailginaFlagString:String = "";
	
	output("Select flag:");
	
	//Add a flag
	if (arg[1])
	{
		//Vagina buttons
		if (arg[0] != -1)
		{
			//Build our buttons
			for (i; i < GLOBAL.VALID_VAGINA_FLAGS.length; i++)
			{
				//Ensures buttons don't overwrite the back button
				if (btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
				{
					addButton(btnSlot, "Back", placeholderCustomizeMenu, arg[0], "Back", "Go back to the customization menu.");
					btnSlot++;
				}
				
				flagName = GLOBAL.FLAG_NAMES[GLOBAL.VALID_VAGINA_FLAGS[i]];
				//Disabled button for the currently possessed flags
				if (pc.vaginas[arg[0]].hasFlag(GLOBAL.VALID_VAGINA_FLAGS[i])) addDisabledButton(btnSlot, flagName, flagName, "Your vagina already has that flag.");
				
				//Disable buttons for pumped flags if the PC has any of them
				else if (pc.vaginalPuffiness(arg[0], true) != 0 && (GLOBAL.VALID_VAGINA_FLAGS[i] == (GLOBAL.FLAG_SLIGHTLY_PUMPED || GLOBAL.FLAG_PUMPED || GLOBAL.FLAG_HYPER_PUMPED))) addDisabledButton(btnSlot, flagName, flagName, "Your vagina can only have one pumped flag.");
				
				else addButton(btnSlot, flagName, placeholderChangeFlag, [arg[0], arg[1], GLOBAL.VALID_VAGINA_FLAGS[i]], flagName, "Add the " + flagName + " flag to your vagina.");
				btnSlot++;
			}
		}
		
		//Tailgina buttons
		else
		{
			//Build our buttons
			for (i; i < tailginaFlags.length; i++)
			{
				//Ensures buttons don't overwrite the back button
				if (btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
				{
					addButton(btnSlot, "Back", placeholderCustomizeMenu, arg[0], "Back", "Go back to the customization menu.");
					btnSlot++;
				}
				
				flagName = GLOBAL.FLAG_NAMES[tailginaFlags[i]];
				//Disabled button for the currently possessed flags
				if (pc.hasTailFlag(tailginaFlags[i])) addDisabledButton(btnSlot, flagName, flagName, (pc.hasTails() ? "Your tailginas already have that flag." : "Your tailgina already has that flag."));
				
				else addButton(btnSlot, flagName, placeholderChangeFlag, [arg[0], arg[1], tailginaFlags[i]], flagName, (pc.hasTails() ? "Add the " + flagName + " flag to your tailginas." : "Add the " + flagName + " flag to your tailgina."));
				btnSlot++;
			}
		}
	}
	
	//Flag removal
	else
	{
		//Vagina buttons
		if (arg[0] != -1)
		{
			//Displays flags the pc has
			output("\n<b>* Flags:</b>");
			for (i; i < pc.vaginas[arg[0]].vagooFlags.length; )
			{
				output(" " + GLOBAL.FLAG_NAMES[pc.vaginas[arg[0]].vagooFlags[i]]);
				i++;
				if (i < pc.vaginas[arg[0]].vagooFlags.length) output(",");
			}
			
			//Build our buttons
			for (i = 0; i < pc.vaginas[arg[0]].vagooFlags.length; i++)
			{
				//Ensures buttons don't overwrite the back button
				if (btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
				{
					addButton(btnSlot, "Back", placeholderCustomizeMenu, arg[0], "Back", "Go back to the customization menu.");
					btnSlot++;
				}
				
				flagName = GLOBAL.FLAG_NAMES[pc.vaginas[arg[0]].vagooFlags[i]];
				addButton(btnSlot, flagName, placeholderChangeFlag, [arg[0], arg[1], pc.vaginas[arg[0]].vagooFlags[i]], flagName, "Remove the " + flagName + " flag from your vagina.");
				btnSlot++;
			}
		}
		
		//Tailgina buttons
		else
		{
			//Displays flags the pc has
			output("\n<b>* Flags:</b>");
			for (i; i < tailginaFlags.length; )
			{
				if (pc.hasTailFlag(tailginaFlags[i]))
				{
					if (tailginaFlagString != "") tailginaFlagString += ",";
					tailginaFlagString += (" " + GLOBAL.FLAG_NAMES[tailginaFlags[i]]);
				}
				i++;
			}
			output(tailginaFlagString);
			
			//Build our buttons
			for (i = 0; i < tailginaFlags.length; i++)
			{
				//Ensures buttons don't overwrite the back button
				if (btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
				{
					addButton(btnSlot, "Back", placeholderCustomizeMenu, arg[0], "Back", "Go back to the customization menu.");
					btnSlot++;
				}
				
				flagName = GLOBAL.FLAG_NAMES[tailginaFlags[i]];
				
				if (pc.hasTailFlag(tailginaFlags[i]))
				{
					addButton(btnSlot, flagName, placeholderChangeFlag, [arg[0], arg[1], tailginaFlags[i]], flagName, (pc.hasTails() ? "Remove the " + flagName + " flag from your tailginas.":"Remove the "+ flagName + " flag from your tailgina."));
					btnSlot++;
				}
			}
		}
	}
	
	//Ensures back button on the last page is in the right position
	while ((btnSlot + 1) % 15 != 0)
	{
		btnSlot++;
	}
	addButton(btnSlot, "Back", placeholderCustomizeMenu, arg[0], "Back", "Go back to the customization menu.");
}

public function placeholderSelectGirlCumType(vagina:int):void
{
	clearOutput();
	clearMenu();
	showName("\nPLACEHOLDER");
	showBust("");
	author("Thebiologist");
	
	var btnSlot:int = 0;
	var typeName:String;
	
	for (var i:int = 0; i < GLOBAL.VALID_GIRLCUM_TYPES.length; i++)
	{
		//Ensures buttons don't overwrite the back button
		if (btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", placeholderCustomizeMenu, vagina, "Back", "Go back to the customization menu.");
			btnSlot++;
		}
		
		typeName = GLOBAL.FLUID_TYPE_NAMES[GLOBAL.VALID_GIRLCUM_TYPES[i]];
		//Disabled button for pc's current girl cum type
		if (pc.girlCumType == GLOBAL.VALID_GIRLCUM_TYPES[i]) addDisabledButton(btnSlot, typeName, typeName, "Your girl cum is already " + typeName + ".");
		
		//Goo is a no
		else if (GLOBAL.VALID_GIRLCUM_TYPES[i] == GLOBAL.FLUID_TYPE_SPECIAL_GOO) btnSlot *= 1;
		
		else addButton(btnSlot, typeName, placeholderChangeGirlCumType, GLOBAL.VALID_GIRLCUM_TYPES[i], typeName, "Change your girl cum to " + typeName + ".");
		btnSlot++;
	}
	
	//Ensures back button on the last page is in the right position
	while ((btnSlot + 1) % 15 != 0)
	{
		btnSlot++;
	}
	addButton(btnSlot, "Back", placeholderCustomizeMenu, vagina, "Back", "Go back to the customization menu.");
}

//Change Functions
public function placeholderChangeText(vagina:int, flags:Array):void
{
	var i:int;
	
	//Vagina scene
	if (vagina != -1)
	{
		output("After selecting the desired modification, you confirm your choose and get the machine ready. The Placeholder beeps a couple of times and a femenine, synthetic voice speaks up. <i>“Adapting seat to your specifications. Synchronizing. " + (pc.legCount != 2 ? "Non-bipedal structure detected. Reconfiguring.": "Reconfiguring seat. Please wait.") + "”</i> Right before your eyes, the seat of the machine changes shape to match you - It's quite convenient. " + (pc.isTaur() ? " <i>“Please turn around.”</i> Oh yeah, even if it's adapted, you still can't sit down with this body. Well, you'll have to stand, but at least you can fit your backside there.":""));

		output("\n\nThe voice chirps again. <i>“Take a seat at your convenience. The procedure is ready to continue.”</i> Alright then." + (pc.isTaur() ? " You turn around as instructed, then carefully align your backside with the machine, cross one leg over it and lower your hindlegs, allowing your hindquarters to rest on the seating.":" You take a seat and lay down over the machine, then grab the handlebars. This is quite nice. It feels almost like an adaptable bed. You can feel the cushiony material on top of the machine molding and reshaping to match your body and give you maximum comfort. You could fall asleep here!"));

		output("\n\n<i>“Preparing selection and securing customer. Stand by.”</i> A few restrains pop from the machine and strap you down. Hey! <i>“Commending modifications.”</i> Oh boy, here it comes. The device emits a faint, powering-up sound and starts buzzing a bit. <i>“Please remain calm and stand still. Do not struggle.”</i> Your [pc.pussyNoun] is pressed against a pair of pink, squishy, silicone semi-circles that remind you of a pussy themselves. So, this is gonna be pussy-on-pussy action? Quite fitting you guess.");

		output("\n\nYou feel the seating" + (pc.isTaur() ? "":", the cushiony rest,") + " and the silicone heating up until they acquire a nice, body-warm temperature. So far this is quite soothing and relaxing. Then, they start vibrating, giving you a low intensity massage. Ah! Not bad at all - pussy modification and massage parlor all-in-one combo."); 

		output("\n\n<i>“Phase 1. Commencing.”</i> Well, here we go at last. You feel something poking out in between the silicone lips. It's hard and it's pushing against your own labia! You hear a mechanical clicking and the mysterious tool starts vibrating with moderate intensity, pleasuring your outer labia with its delightful rumble. Stars! This isn't bad at all. This dildo-like apparatus certainly knows what it's doing, because is pressing all the right spots.");

		output("\n\nA strange sensation assails you. You can feel your muff tingling and flustering, as if all the blood from your body is rushing in, besieging your snatch. You feel increasingly hot and bothered, yet extremely excitable and sensitive down your loins. Suddenly, the vibrator cranks up its power and starts moving up and down, slowly teasing your opening and pushing, perhaps and inch and a half in.");

		output("\n\nThis precision fucking continues perhaps for a couple of minutes while the machine beeps and buzzes cheerfully. Meanwhile, you try your best to keep it together, but the continuous vibrations and the strange and ever growing joyous feeling inside you aren't making things easier. The vibe is almost sentient. Somehow, it knows all your weak spots and it seems to purposefully target your most erogenous areas. Is this a modding machine or a fucking machine?! This is insane.");

		output("\n\nAt this point, thinking is not an easy task. You feel weakened and unbelievably horny. You're flustered all over, and your hips are already taking matters into their own hands and began humping the machine. There's not much room to wiggle, so all you manage to achieve a few, meek thrusts. Fuck! This freaking machine is not slowing down in the slightest! How much can you even take?");

		output("\n\nDamn! The pressure is too intense, and the heat is driving you crazy. If this keeps going for much longer, you're gonna cum. Please, let it end. Your body is taking the toll of the unexpected and powerful stimulation. You're shaking, yet extremely tense, bracing yourself against the inevitable.");

		output("\n\nThe machine beeps again and pauses. Thank the stars! It's over... but you don't feel any different. <i>“Microsurgeons successfully recruited. Commencing phase 2.”</i> No way! You're not gonna- AAAAH! FUCK! Without any warning, the vibe decided to make an advance and plunged itself deeper. You can feel it rocking your body to its core.");

		output("\n\nThe heat and the sensitivity continue increasing over time, to the point that you feel at the very brink of the precipice time and again, yet every single time, the device changes pace, almost denying you on purpose. You're frustrated and eager, desperately yearning for release, yet it never comes.");

		output("\n\nMoans and whines flood the room, each and everyone escaping from your [pc.lipsChaste]. At this point, you're unsure how much time you've spent strapped to this machine, but it feels like an eternity. This is almost like torture! You want to cum! Why won't it let you reach your peak?! You need an orgasm like you need water."); 

		output("\n\nThe pressure down your loins raises sharply, and finally, you notice the first changes taking shape. It's a slow process, but you can definitely feel the difference. You don't care anymore! All you want now is an orgasm. Stupid machine! It owes you a big climax. In desperation, you struggle and fight, rubbing as hard as you can in an attempt to pleasure yourself, but that only causes the adaptive straps to tighten their hold on you. You're helpless, at the mercy of an unthinking, unfeeling machine hell bet on denying you of your well deserved finale.");

		output("\n\nA new sound tickles your ear. It's almost like the machine is spooling up. The sound increases in intensity, and suddenly, the dildo-like transformation tool forces its way inside your snatch with a single powerful thrust, resulting in a delightful splortching sound, soon drowned by a throaty cry of pleasure coming from yours truly.");

		output("\n\nFinally, that was the last straw. This time, you achieve what you've yearned for so much. You're cumming! Almost on cue, the vibe goes wild and changes pace and strategy, constantly reaming your poor abused hole. It twists and turns and circles around, almost out of control, pleasuring every crevice of your insides and bothering your G-Spot with mechanical precision. Gosh! This machine knows what you want almost like it can read your mind!");

		output("\n\nYour climax reaches its mighty peak, and you surrender to the depths of ecstasy. At this point, your body is going crazy, almost convulsing from the sheer intensity of your orgasm. Every nerve of your system flares up in response to the torrent of endorphins and feel-good chemicals flooding your brain. Your only conscious response is an obscene cacophony of howls and wails to signal your grand finale. You tremble in excitement as pure distilled joy seeps in and pierces your very soul. For a moment, you think you're about to lose consciousness, only for a second orgasm to kick you back into action.");

		output("\n\nSoon, the sensation is overwhelming, and your overstimulated body sets of a cascade effect, triggering one orgasm after another until you can't take it anymore and collapse from the sensory overload.");

		output("\n\nYou wake up a few minutes later. The machine has already finished its work and unstrapped you. You can see the holo-screen flashing before you, urging you to remove yourself from the device so it can finalize and clean up.");
		
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
		processTime(10);
	}	

	//Tailgina scene
	else
	{
		output("It's nice to see you also have to option to modify your genitail. You take a quick glance at your [pc.tailcunt] and grin. Yeah, it could use a new appearance. You punch the new changes into the holoscreen and confirm your selection.");

		output("\n\nA synthetic, feminine voice responds to your input. <i>“Genitail modifications selected. Synchronizing. Adapting seating. Please, press your genitail against the modification docket.”</i> A pair of pink, silicone semi-circles illuminate, indicating what you should do next. You take a seat and relax, then  move your [pc.tailcunt] and press it against the cunt-shaped slot.");

		output("\n\n<i>“Securing genitail. Stand by.”</i> A pair of adaptable straps make their appearance and loop around your [pc.tail]'s tip, firmly securing your tailborne snatch. Well, now you just have to wait and let the machine work its magic. You relax and lie down on top of the padding that protects the device. This material is otherworldly. It adapts perfectly to your body's contour and feels almost like your lying on a cloud.");

		output("\n\nA few seconds pass, and you can feel the cushion, seat and docket warm up until they reach a nice and relaxing body temperature. You take it easy and grab the handlebars. Mmmm... if this doesn't begin soon, you could totally fall asleep here.");

		output("\n\n<i>“Phase one.”</i> True to your desires, something pokes in between the silicone lips. You can feel it's shaped like a simple dildo, and it presses against your labia just slightly. <i>“Commencing modifications. Please remain calm and control your genitail.”</i> Here we go! The device starts rumbling at low intensity, vibrating smoothly and teasing your [pc.tailcunt] with a delightful back-and-forth. The sensation is quite stimulating, and your tail slit reacts and squirms a bit. Soon, your tail pussy readies itself to welcome its new friend, opening wide and rewarding the unthinking tool with a few dollops of its natural lube.");

		output("\n\nAh! This is truly captivating. The vibe has cranked up the power and it's now moving up and down, slowly caressing your labia. You're unsure how, but this machine seems to know you inside and out, because it hits all the right spots with millimeter precision. You can already feel the pressure rising. Your orgasm is slowly building up inside you. For a machine, this thing is quite the gentle lover.");

		output("\n\nThe vibe pushes a couple of inches inside, and it switches to a different massage mode, delivering smooth, circular motions while increasing its intensity. Fuck! Now this is too much. Your [pc.tailcunt] is taking the toll. It struggles and trembles from the intensity of the situation, trying to push harder and pleasure itself, but it's firmly secured.");

		output("\n\nYou feel an intense heat and a powerful tingling sensation coming from your tailborne breeder and climbing all the way up your [pc.tail] and spine. This is so odd, but it feels unnaturally pleasurable at the same time. You won't be able to stand this anymore. Your mind is clouded, overwhelmed by lust and delight. You can feel your climax peeking around the corner, yet you're denied time and again, almost like on purpose. Is this damn thing teasing you?! It can't be.");

		output("\n\nDamnit! You need to cum. You won't be able to hold this level of denial for much longer with your mind intact. Youc rave for an orgasm, and you try your best to stimulate yourself, but it's of no use. Somehow, this device knows when you're about to cum and pauses just in the nick of time. This is torture! Stupid machine! Why won't it let you cum?!");

		output("\n\nThe Placeholder beeps and pauses. <i>“Microsurgeons successfully recruited. Commencing phase two.”</i> Gosh! That was only half of it?! You're gonna lose your mind.");

		output("\n\nThe dildo-like tool penetrates further in without a warning, and you feel your entire [pc.tail] rumbling and rocking from the intense vibrations. You're desperately trying to climax at this point, moaning and whining like a whore. You meekly beg the unthinking, uncaring machine for a sliver of pleasure, but the device doesn't waiver and carries on with its duty.");

		output("\n\nThe pressure and the heat constantly increase, and you can finally notice the first changes taking place. You can definitely feel them at long last. Then, you hear something new. The Placeholder is emitting a faint spool-up sound that grows louder by the moment, and suddenly, the transformation tool plunges itself as deep as you can actually offer, taking you completely by surprise and finally giving you all you've been yearning for and much more.");
	
		output("\n\nYour climax hits you hard, and almost on cue, the vibrator goes into overdrive, hammering the insides of your tailgina on a frenzy. It feels out of control! It twists, and turns and brushes against every fold of your inner walls, paying special tribute to your [pc.tail]'s G-Spot.");

		output("\n\nAt this point, you're a quivering mess. Your constant and thundering howls of bliss only serve to announce the entire ship of your debauchery. Your perverse symphony reaches every corner of the room and resonate deep within its walls, signaling your fierce peak.");

		output("\n\nPure, unadulterated pleasure floods your system, pouring all over the place like a deluge and hitting every pleasure center of your body with pinpoint precision. Your brain is almost melting from the hyperstimulation, and all it can do in response is release all those delightful endorphins. Joy and ecstasy sink deep inside your soul, and send you into a lustful high. You can barely think anymore. Your orgasm is rocking your entire body to its core and all you can do is brace for impact and take it.");

		output("\n\nOrgasm after orgasm hits your very being, threatening to take away your consciousness. You barely manage to hold, only to fail as the most intense climax yet hits your brain like a sledgehammer, knocking you off.");

		output("\n\nYou snap out of your stupor a few minutes later. You're completely limp and drooling all over the machine. You've been out for a while, and you can barely react. The holoscreen informs you that the procedure is over, and urges you to remove yourself from the machine. With some difficulty, you stand up and check your brand new [pc.tailcunt].");

		processTime(10);
		if (pc.hasTails())
		{
			output("\n\nOh boy... you still have to modify your other tailginas to mach. This is gonna be intense to say the least...");

			output("\n\n<b>One hour later.</b>");

			output("\n\nYou're down on the floor, barely able to move and completely unresponsive. That was too much for anyone to bear, but you're finally done. You're just... gonna lay down a few more minutes... Ugh! Your entire body is sore. You're not supposed to have that many orgasm without rest.");
			
			processTime(50);
		}
		
		for (i = 0; i < pc.tailCount * 5; i++)
		{
			pc.orgasm();
		}
	}

	output("\n\nThat was definitely intense. Shit! You can barely think straight. Still half-orgasming, you manage to compose yourself and move away from the machine to give your brand new [pc.pussy] a complete checkup.");
	
	//Flag Descriptions
	for (i = 0; i < flags.length; i++)
	{
		switch (flags[i])
		{	
		case GLOBAL.FLAG_LUBRICATED:
			output("\n\nAt first glance, your [pc.pussyNoun] glistens with renewed moisture. You probe it tentatively, only to discover you're secreting a sleek and slippery substance. Your [pc.pussyNoun] is now naturally creating its own lubrication. That should make insertions much easier.");
			break;

		case GLOBAL.FLAG_TENDRIL: 
			output("\n\nWell, this is interesting. From time to time you can catch a glance of thin, yet noticeably long tendrils poking out of your [pc.pussy]. The darn things have a mind of their own, but if you concentrate hard enough you can at the very least give them a target. You can feel them constantly squirming inside your snatch. This is surely going to raise a few eyebrows during sex, only to drop a few jaws later on once they realize how nice can a hundred of helping hands feel.");
			break;

		case GLOBAL.FLAG_APHRODISIAC_LACED: 
			output("\n\nYou catch a whiff of something peculiar. It's musky and fragrant, with a faint, sweet scent. Apparently, it's coming from your pussy. You spot a viscous, light purple liquid mixed together with your natural femenine juices. You take a sample and immediately feel something off. The finger you've used to scoop a bit is tingling and feels awfully sensitive. You're almost certain this is some kind of aphrodisiac. From now on, people are gonna have a hard time resisting your pussy's charms.");
			break;

		case GLOBAL.FLAG_GOOEY: 
			output("\n\nNow, this is curious. Your [pc.pussyNoun] feels unnaturally elastic and softer. True to your desires, it's now gooey in nature, like a Galotian's. Large insertions should pose no problem now, and you've gotta admit, it's fun to the touch, almost like playing with consistent jelly. You could spend hours toying with this! It's so relaxing.");
			break;

		case GLOBAL.FLAG_OVIPOSITOR: 
			output("\n\nYou can feel the muscles of your [pc.pussy] relaxing and contracting almost as if they were trying to push something out. There's no doubt about it now, you have the equipment to lay eggs. ");
			break;

		case GLOBAL.FLAG_RIBBED:
			output("\n\nTesting your new equipment, you run your fingers all the way inside your [pc.pussy] only to notice it's walls are ribbed. This ought to pleasure your partner during insertions.");
			break; 

		case GLOBAL.FLAG_SLIGHTLY_PUMPED: 
			output("\n\nYour labia are quite sensitive and swollen. Your [pc.pussyNoun] is slightly pumped and engorged. You feel slightly more sensitive and excitable. Besides, this should give you a sexy camel toe.");
			break;

		case GLOBAL.FLAG_PUMPED: 
			output("\n\nDamn. Your [pc.pussyNoun] is fully pumped and noticeably swollen right now. Every slight brush sends shivers up your spine. You feel extremely sensitive down there, and your snatch looks enormously puffy and delightful. This should give you a noticeable bulge in your pants.");
			break;

		case GLOBAL.FLAG_HYPER_PUMPED: 
			output("\n\nThis is too much. You [pc.pussyNoun] is ludicrously swollen and pumped beyond reason. Your labia are enormously engorged and puffy. You feel ludicrously excitable and sensitive, to the point every brush takes you to the brink of orgasm. This should create such a massive bulge in your pants people are gonna think the wrong way.");
			break;

		case GLOBAL.FLAG_NUBBY: 
			output("\n\nProbing your depths with your fingers, you've caught a series of sensitive, fleshy nubs inside your vaginal canal. They should make insertions more pleasurable for both partners. It's a nice perk to have, for sure.");
			break;

		case GLOBAL.FLAG_TONGUE:
			output("\n\nSomething startled you while you were checking the inside of your [pc.pussyNoun] There is in fact a thick, fleshy tongue inside and it's quite friendly. This should give sex an interesting twist, specially tribbadism.");
			break; 

		case GLOBAL.FLAG_CORKSCREWED:
			output("\n\nYou notice a peculiar pattern inside your [pc.pussyNoun] It's not as straight as it used to be and instead, it spirals all the way up your womb. Penetrations might be a bit more complicated but definitely fun.");
			break;
		}
	}
	
	output("\n\nAll set now. You smile, satisfied with the results. You've got exactly what you've wanted. Perhaps you should give your brand new endowments a trial run.");
	
	IncrementFlag("USED_PLACEHOLDER");
}

//Changes vagina to selected type (arg[0] which vagina, arg[1] which type)
public function placeholderChangeType(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nPLACEHOLDER");
	showBust("");
	author("Thebiologist");
	
	//Regular vaginas
	if (arg[0] != -1)
	{

		pc.shiftVagina(arg[0], arg[1]);
	}
	
	//Tailgina
	else
	{
		pc.shiftTailgina(arg[1]);
	}
	
	placeholderChangeText(arg[0], pc.vaginas[0].vagooFlags);
	
	addButton(0, "Next", placeholderMainMenu);
}

//Changes vagina to selected color (arg[0] which vagina, arg[1] which color)
public function placeholderChangeColor(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nPLACEHOLDER");
	showBust("");
	author("Thebiologist");
	
	placeholderChangeText(arg[0], []);
	
	if (arg[0] != -1)
	{
		pc.vaginas[arg[0]].vaginaColor = arg[1];
	}
	
	else
	{
		pc.tailGenitalColor = arg[1];
	}
	
	placeholderChangeText(arg[0], []);
	
	addButton(0, "Next", placeholderMainMenu);
}

//Change a flag. arg[0] which vagina, arg[1] add or remove (true == add), arg[2] which flag
public function placeholderChangeFlag(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nPLACEHOLDER");
	showBust("");
	author("Thebiologist");
	
	//Vagina flag change
	if (arg[0] != -1)
	{
		placeholderChangeText(arg[0], arg[2]);
		
		if (arg[1])
		{
			pc.vaginas[0].addFlag(arg[2]);
		}
		else
		{
			pc.vaginas[0].delFlag(arg[2]);
		}
	}
	
	//Tailgina flag change
	else
	{
		placeholderChangeText(arg[0], []);
		
		if (arg[1])
		{
			pc.addTailFlag(arg[2]);
		}
		else
		{
			pc.removeTailFlag(arg[2]);
		}
	}
	
	addButton(0, "Next", placeholderMainMenu);
}

//Changes girl cum type
public function placeholderChangeGirlCumType(newType:Number):void
{
	clearOutput();
	clearMenu();
	showName("\nPLACEHOLDER");
	showBust("");
	author("Thebiologist");
	
	placeholderChangeText(1, []);
	pc.girlCumType = newType;
	addButton(0, "Next", placeholderMainMenu);
}

//Changes vagina wetness. arg[0] which vagina, arg[1] increase or decrease (true == increase)
public function placeholderChangeWetness(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nPLACEHOLDER");
	showBust("");
	author("Thebiologist");
	
	placeholderChangeText(arg[0], []);
		
	if (arg[1])
	{
		pc.vaginas[arg[0]].wetnessRaw++;
		if (pc.vaginas[arg[0]].wetnessRaw > 5) pc.vaginas[arg[0]].wetnessRaw = 5;
	}
	else
	{
		pc.vaginas[arg[0]].wetnessRaw--;
		if (pc.vaginas[arg[0]].wetnessRaw < 0) pc.vaginas[arg[0]].wetnessRaw = 0;
	}
	addButton(0, "Next", placeholderMainMenu);
}

//Regenerates hymen
public function placeholderChangeHymen(vagina:int):void
{
	clearOutput();
	clearMenu();
	showName("\nPLACEHOLDER");
	showBust("");
	author("Thebiologist");
	
	placeholderChangeText(1, []);
		
	pc.vaginas[vagina].hymen = true;
	addButton(0, "Next", placeholderMainMenu);
}

//Changes clit numbers. arg[0] which vagina, arg[1] increase or decrease number (true == increase)
public function placeholderChangeClitNumber(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nPLACEHOLDER");
	showBust("");
	author("Thebiologist");
	
	placeholderChangeText(arg[0], []);
		
	if (arg[1]) pc.vaginas[arg[0]].clits++;
	else pc.vaginas[arg[0]].clits--;
	addButton(0, "Next", placeholderMainMenu);
}

//Changes clit size. arg[0] which vagina, arg[1] increase or decrease (true == increase)
public function placeholderChangeClitLength(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nPLACEHOLDER");
	showBust("");
	author("Thebiologist");
	
	placeholderChangeText(arg[0], []);
		
	if (arg[1])
	{
		if (pc.clitLength < 1) pc.clitLength += 0.2;
		else if (pc.clitLength < 3) pc.clitLength += 0.5;
		else pc.clitLength += 1;
		
		if (pc.clitLength > 12) pc.clitLength = 12;
	}
	else
	{
		if (pc.clitLength < 1) pc.clitLength -= 0.2;
		else if (pc.clitLength < 3) pc.clitLength -= 0.5;
		else pc.clitLength -= 1;
		
		if (pc.clitLength < 0.1) pc.clitLength = 0.1;
	}
	addButton(0, "Next", placeholderMainMenu);
}

//Changes Bonus Capacity. arg[0] which vagina, arg[1] increase or decrease (true == increase)
public function placeholderChangeBonusCapacity(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nPLACEHOLDER");
	showBust("");
	author("Thebiologist");
	
	placeholderChangeText(arg[0], []);
		
	if (arg[1])
	{
		pc.vaginas[arg[0]].bonusCapacity += 100;
		if (pc.vaginas[arg[0]].bonusCapacity > 800) pc.vaginas[arg[0]].bonusCapacity = 800;
	}
	else
	{
		pc.vaginas[arg[0]].bonusCapacity -= 100;
		if (pc.vaginas[arg[0]].bonusCapacity < 0) pc.vaginas[arg[0]].bonusCapacity = 0;
	}
	addButton(0, "Next", placeholderMainMenu);
}

//Changes minimum looseness. arg[0] which vagina, arg[1] increase or decrease (true == increase)
public function placeholderChangeMinimumLooseness(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nPLACEHOLDER");
	showBust("");
	author("Thebiologist");
	
	placeholderChangeText(arg[0], []);
		
	if (arg[1])
	{
		pc.vaginas[arg[0]].minLooseness += 1;
		if (pc.vaginas[arg[0]].minLooseness > 5) pc.vaginas[arg[0]].minLooseness = 5;
	}
	
	else
	{
		pc.vaginas[arg[0]].minLooseness -= 1;
		if (pc.vaginas[arg[0]].minLooseness < 0.5) pc.vaginas[arg[0]].minLooseness = 0.5;
	}
	
	addButton(0, "Next", placeholderMainMenu);
}

//BUY MENU FUNCTIONS
//Menu of available upgrades.
public function placeholderBuyMenu():void
{
	showName("\nPLACEHOLDER");
	showBust("");
	author("Thebiologist");
	clearMenu();
	clearOutput();
	
	var seasonPassPrice:int = 0;
	var purchasableUpgrades:int = 0;
	switch (undefined)
	{
	case flags["PLACEHOLDER_CODEX_UPGRADE"]: 
		seasonPassPrice += placeholderCodexUpgradePrice;
		purchasableUpgrades++;
	case flags["PLACEHOLDER_DUPLICATOR_UPGRADE"]: 
		seasonPassPrice += placeholderDuplicatorPrice;
		purchasableUpgrades++;
	case flags["PLACEHOLDER_DELUXE_EDITION"]: 
		seasonPassPrice += placeholderDeluxePrice;
		purchasableUpgrades++;
		break;
	}
	seasonPassPrice *= 0.85;
	
	output("You select the store.");
	
	output("\n\n<i>“Welcome to TamaniCorp's online catalog. New and exciting pussy options await you.”</i>");
	
	output("\n\n<b>Codex Upgrade:</b> An expansion pack containing a  wide selection of unusual pussies.");
	output("\n" + (flags["PLACEHOLDER_CODEX_UPGRADE"] == undefined ? +placeholderCodexUpgradePrice + " credits" : "You already own this upgrade."));
	
	output("\n<b>Duplicator Upgrade:</b> A firmware update that should deal with multiple vaginas, including copying, removal, and duplication");
	output("\n" + (flags["PLACEHOLDER_DUPLICATOR_UPGRADE"] == undefined ? +placeholderDuplicatorPrice + " credits" : "You already own this upgrade."));
	
	output("\n<b>Deluxe Edition:</b> Upgrade to the deluxe edition, which allows for targeted modifications.");
	output("\n" + (flags["PLACEHOLDER_DELUXE_EDITION"] == undefined ? +placeholderDeluxePrice + " credits" : "You already own this upgrade."));
	
	output("\n<b>Season Pass:</b> All-in-one pack containing all current content.");
	output("\n" + (purchasableUpgrades > 1 ? + seasonPassPrice + " credits" : "This option is no longer available."));
	
	
	//Buttons
	if (flags["PLACEHOLDER_CODEX_UPGRADE"] != undefined) addDisabledButton(0, "Codex Upgrade", "Codex Upgrade", "You already own this upgrade!");
	else if (pc.credits < placeholderCodexUpgradePrice) addDisabledButton(0, "Codex Upgrade", "Codex Upgrade", "You can't afford this upgrade!");
	else addButton(0, "Codex Upgrade", placeholderConfirmBuy, [kGAMECLASS.gameOptions.vendorToggle, 0], "Codex Upgrade", "Buy the codex upgrade.");
	
	if (flags["PLACEHOLDER_DUPLICATOR_UPGRADE"] != undefined) addDisabledButton(1, "Duplicator", "Duplicator", "You already own this upgrade!");
	else if (pc.credits < placeholderDuplicatorPrice) addDisabledButton(1, "Duplicator", "Duplicator", "You can't afford this upgrade!");
	else addButton(1, "Duplicator", placeholderConfirmBuy, [kGAMECLASS.gameOptions.vendorToggle, 1], "Duplicator", "Buy the duplicator upgrade.");
	
	if (flags["PLACEHOLDER_DELUXE_EDITION"] != undefined) addDisabledButton(2, "Deluxe Edition", "Deluxe Edition", "You already own this upgrade!");
	else if (pc.credits < placeholderDeluxePrice) addDisabledButton(3, "Deluxe Edition", "Deluxe Edition", "You can't afford this upgrade!");
	else addButton(2, "Deluxe Edition", placeholderConfirmBuy, [kGAMECLASS.gameOptions.vendorToggle, 2], "Deluxe Edition", "Buy the deluxe edition upgrade.");
	
	if (purchasableUpgrades == 1) addDisabledButton(3, "Season Pass", "Season Pass", "You no longer need a bundled offer!");
	else if (purchasableUpgrades == 0) addDisabledButton(3, "Season Pass", "Season Pass", "You already own all the upgrades!");
	else if (pc.credits < seasonPassPrice) addDisabledButton(3, "Season Pass", "Season Pass", "You can't afford this option!");
	else addButton(3, "Season Pass", placeholderConfirmBuy, [kGAMECLASS.gameOptions.vendorToggle, 3], "Season Pass", "Buy the season pass upgrade.");
	
	addButton(14, "Back", placeholderMainMenu, undefined, "Back", "Go back to the main menu.");
}

//Arg[0]: Show confirmation screen, arg[1] option
public function placeholderConfirmBuy(arg:Array):void
{
	showName("\nPLACEHOLDER");
	showBust("");
	author("Thebiologist");
	clearMenu();
	clearOutput();
	
	var seasonPassPrice:int = 0;
	switch (undefined)
	{
	case flags["PLACEHOLDER_CODEX_UPGRADE"]: 
		seasonPassPrice += placeholderCodexUpgradePrice;
	case flags["PLACEHOLDER_DUPLICATOR_UPGRADE"]: 
		seasonPassPrice += placeholderDuplicatorPrice;
	case flags["PLACEHOLDER_DELUXE_EDITION"]: 
		seasonPassPrice += placeholderDeluxePrice;
		break;
	}
	seasonPassPrice *= 0.85;
	
	//Confirmation screen
	if (arg[0])
	{
		output("Are you sure you want to buy the ");
		switch (arg[1])
		{
		case 0: 
			output("codex upgrade for " + placeholderCodexUpgradePrice + " credits?");
			break;
		case 1: 
			output("duplicator for " + placeholderDuplicatorPrice + " credits?");
			break;
		case 2: 
			output("deluxe edition for " + placeholderDeluxePrice + " credits?");
			break;
		case 3: 
			output("season pass for " + seasonPassPrice + " credits?");
			break;
		}
		
		addButton(0, "Confirm", placeholderConfirmBuy, [false, arg[1]]);
		addButton(1, "Cancel", placeholderBuyMenu);
	}
	
	//Set flags and subtract credits
	else
	{
		switch (arg[1])
		{
		case 0: 
			output("You bought the codex upgrade!");
			flags["PLACEHOLDER_CODEX_UPGRADE"] = true;
			pc.credits -= placeholderCodexUpgradePrice;
			break;
		case 1: 
			output("You bought the duplicator!");
			flags["PLACEHOLDER_DUPLICATOR_UPGRADE"] = true;
			pc.credits -= placeholderDuplicatorPrice;
			break;
		case 2: 
			output("You bought the deluxe edition!");
			flags["PLACEHOLDER_DELUXE_EDITION"] = true;
			pc.credits -= placeholderDeluxePrice;
			break;
		case 3: 
			output("You bought the season pass!");
			flags["PLACEHOLDER_CODEX_UPGRADE"] = true;
			flags["PLACEHOLDER_DUPLICATOR_UPGRADE"] = true;
			flags["PLACEHOLDER_DELUXE_EDITION"] = true;
			pc.credits -= seasonPassPrice;
			break;
		}
		
		addButton(0, "Next", placeholderMainMenu);
	}
}

//Leave the placeholder menu
public function leaveplaceholder():void
{
	showName("\nPLACEHOLDER");
	showBust("");
	author("Thebiologist");
	
	clearOutput();
	output("You decide to leave the placeholder for now.");
	clearMenu();
	if (InShipInterior()) addButton(0, "Next", kGAMECLASS.shipStorageMenuRoot);
	else addButton(0, "Next", mainGameMenu);
}