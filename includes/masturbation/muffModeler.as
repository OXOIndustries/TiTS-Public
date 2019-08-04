import classes.Characters.PlayerCharacter;

//flags["MUFF_MODELER_INSTALLED"] == 2 means delivery waiting
//flags["MUFF_MODELER_INSTALLED"] == 1 means installed on ship
public var muffModelerPrice:int = 100000;
private var muffModelerGalotianPrice:int = 10000;
private var muffModelerCodexUpgradePrice:int = 20000;
private var muffModelerDuplicatorPrice:int = 70000;
private var muffModelerDeluxePrice:int = 200000;
private var muffModelerRandomName:Boolean = true;
private var muffModelerSillyModeNames:Array = ["Box Beautificator", "Box Box", "Clam Changer", "Clam Customizer", "CENSORED", "Cervix Servicer", "Cooch Customizer", "Cooch Constructor", "Cunt Crafter", "Cunt Changer", "Cunt Constructor", "Cuntstomizer", "Cuntstructor", "Fanny Finagler", "Hoo-ha Hootenanier", ,"Muff Modifier", "Muff Master", "Muff Mistress", "Passage Painter", "Pussy Perfector", "PLACEHOLDER", "Pussy Picker", "Pussy Planner", "Slit Sculptor", "Slit Shifter", "Snatch Shaper", "Twat Tweaker", "Vagoo Vandalizer", "Vaggy McVagFace"];

private var tailginaFlags:Array = [GLOBAL.FLAG_OVIPOSITOR, GLOBAL.FLAG_RIBBED, GLOBAL.FLAG_NUBBY, GLOBAL.FLAG_APHRODISIAC_LACED, GLOBAL.FLAG_TENDRIL]
private var defaultPussyTypes:Array = [[GLOBAL.TYPE_HUMAN, "Human"], [GLOBAL.TYPE_KUITAN, "Kui-tan"], [GLOBAL.TYPE_LEITHAN, "Leithan"], [GLOBAL.TYPE_GRYVAIN, "Gryvain"], [GLOBAL.TYPE_SIREN, "Suula"], [GLOBAL.TYPE_EQUINE, "Equine"], [GLOBAL.TYPE_CANINE, "Canine"], [GLOBAL.TYPE_FELINE, "Feline"], [GLOBAL.TYPE_VULPINE, "Vulpine"], [GLOBAL.TYPE_SHARK, "Shark"], [GLOBAL.TYPE_DEER, "Deer"], [GLOBAL.TYPE_SWINE, "Swine"], [GLOBAL.TYPE_AVIAN, "Avian"]];
private var defaultTailginaTypes:Array = [GLOBAL.TYPE_HUMAN, GLOBAL.TYPE_GRYVAIN, GLOBAL.TYPE_EQUINE, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_FELINE, GLOBAL.TYPE_VULPINE];

public function muffModelerName():String
{
	var muffModelerName:String = "";
	if (!silly || muffModelerRandomName == false) muffModelerName = "Muff Modeler";
	else muffModelerName = "{" + muffModelerSillyModeNames[rand(muffModelerSillyModeNames.length)] + "}";
	
	return muffModelerName;
}

public function canBuyMuffModeler():Boolean
{
	if (flags["MUFF_MODELER_INSTALLED"] == 1 || flags["MUFF_MODELER_INSTALLED"] == 2) return false;
	else return true;
}

public function muffModelerDeliveryInstallation():void
{
	clearOutput();
	clearMenu();
	author("Thebiologist");
	showName("MUFF MODELER\nDELIVERY");
	
	output("As you enter your trusty [pc.ship], you're met with an interesting scene. Your delivery is here, and so is the drone - hovering right above. The damn thing is blasting the corny fanfare from the commercial at full volume while displaying the TamaniCorp logo. You sigh. So much for subtlety.");
	
	output("\n\nThe drone chirps as soon as it notices you and then scans you. <i>“Client: [pc.name] Steele. Identity confirmed. Package delivery confirmed. Enjoy your: " + muffModelerName() + " Home Edition, version 7. TamaniCorp thanks you for your purchase. Have a nice day.”</i> Before you can even reply or react, the drone zooms out of your ship, leaving you completely stunned by the whole situation.");
	
	if (crew(true) > 0) output("\n\n You notice someone snickering at the end of the corridor. Great, so your crew knows as well.");
	
	output("\n\nNow, what the hell are you supposed to do with this damn thing?! There's a massive, wooden crate in the middle of the room! Well, first things first. You go fetch a crowbar and unpack the whole thing. Your brand new " + muffModelerName() + " is just what you were expecting. After a quick inspection to check if there are any factory imperfections and if every piece is there, you go to the cargo bay and bring back a grav-lifter to transport the machine to a more appropriate room.");
	
	output("\n\nOnce there, all that's left is installing the machine. Everything comes pre-assembled, so it should be as simple as plugging it to an electric outlet. One cable there... the other one... here, and this one over there. Now, this one should fit in this socket... damnit! Why so many cables? Alright, everything's now plugged, now all that's left is to turn it on.");
	
	output("\n\nBig red button - just the way you like it. You press it and wait for it to boot up. The machine lights up slowly and plays a simple tune. <i>“Welcome to TamaniCorp's " + muffModelerName() + " user interface. Connecting to local ExtraNet.”</i> Alright, it's done, now you can fiddle with- <i>“Receiving update 1/138.”</i> Of fucking course...");
	
	output("\n\nAfter waiting for several, endless minutes, the machine chirps again. <i>“Rebooting and installing upgrades.”</i> You sigh and plant the palm of your hand over your face. A few more minus later and the device is finally ready.");
	
	output("\n\n<i>“Welcome to TamaniCorp's " + muffModelerName() + " user interface. You may use the virtual screen to navigate or state your inquiry. Loading tutorial.”</i> No, damn thing, you don't need a tutorial!");
	
	output("\n\n<i>“To operate the " + muffModelerName() + ", all you need to do is select 'pussy modification' in the main menu. Once selected, specify your body type and the adaptable seating will adjust to your needs. Insert an omniversal bio-cartridge in the cartridge slot and sit down. Once ready to begin, select the desired vagina type. Alternatively, if you possess personal microsurgeons, you may link automatically without our system and the " + muffModelerName() + " will adapt to your body type on its own. This option also removes the need for bio-cartridges. If you possess microsurgeons, you may link with the " + muffModelerName() + " now or afterwards.”</i>");
	
	output("\n\nMight as well do it now. You swipe your hand over the machine, hoping it reacts or something. True to your wishes, the machine beeps. <i>“Microsurgeons recognized. Updating firmware. 1/47.”</i> No! Damnit! After several agonizing minutes, the device beeps again.");
	
	output("\n\n<i>“Microsurgeons successfully linked. The seating and profile will adapt and update automatically to suit your needs. Continuing tutorial.”</i> Wait! You don't- <i>“Once the vagina type is selected, you may begin the procedure. Stand as still as possible. Straps will secure you for your safety. You may experience slight discomfort or intense pleasure. This is normal operating procedure. Remain calm and don't struggle. Once the procedure is over, please take a few minutes to recuperate, then vacate the device. The " + muffModelerName() + " has a self-cleaning, automatic mode.”</i>");
	
	output("\n\nFinally, it's over now you- <i>“The " + muffModelerName() + " also possesses an in-app store that would allow you to purchase additional modifications present or future. Disclaimer: Tampering with the " + muffModelerName() + " or its trademarked software may result in ExtraNet privileges being revoked, as well as civilian liability charges. Thank you for your purchase and enjoy.”</i>");
	
	output("\n\nFinally... Now, what will you do?");
	
	flags["MUFF_MODELER_INSTALLED"] = 1;
	
	addButton(0, "Next", muffModelerMainMenu, undefined, "Next", "Check out your new muffModeler");
}

//Uninstall
public function muffModelerUninstallation():void
{
	clearOutput();
	showName("\nUNINSTALLING...");
	showBust("");
	author("Thebiologist");
	
	output("You take some time to uninstall the " + muffModelerName() + ".");
	output("\n\n<b>You no longer have the TamaniCorp " + muffModelerName() + " installed!</b>");
	
	processTime(8);
	flags["MUFF_MODELER_INSTALLED"] = undefined;
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//Use the muffModeler from the storage menu
public function installedMuffModelerBonus(btnSlot:int = 0):void
{
	output("\n\nYour brand-new " + muffModelerName() + " is powered up but idling and ready to be used at a moment's notice.");
	if (silly) output(" It appears they still haven't settled on a name...");
	
	addButton(btnSlot, "Muff Modeler", muffModelerMainMenu, undefined, muffModelerName(), "Make use of your " + muffModelerName() + ".");
}

//Selects vagina
public function muffModelerMainMenu():void
{
	clearMenu();
	clearOutput();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	var btnSlot:int = 0;
	
	output("You get closer to your " + muffModelerName() + " and start the machine. It chirps and speaks up.");
	
	output("\n\n<i>“Welcome to " + muffModelerName() + "'s user interface. I'm your personal V.I. assistant. You may browse my catalog and select an option or you may state your desires.”</i>");
	
	output("\n\nWell, time to decide. ");
	if (!pc.hasVagina() && !pc.hasTailCunt())
	{
		output("Or it would be if you had a vagina...");
		addDisabledButton(btnSlot, "Pussy", "Pussy", "You should get a pussy or tailcunt before attempting to modify it.");
	}
	
	//No goos without an upgrade, since that would normally lock vagina type
	if (pc.hasStatusEffect("Goo Crotch") && flags["MUFF_MODELER_GALOTIAN_UPGRADE"] == undefined && pc.hasVagina())
	{
		addDisabledButton(btnSlot, "Pussy", "Pussy", "Your mutable physiology prevents the " + muffModelerName() + " from working on your crotch without an upgrade.");
		btnSlot++;
	}
	
	else
	{
		//Add a button for each vagina
		for (var i:int = 0; i < pc.vaginas.length; i++)
		{
			//Muff Modeler doesn't work on roboginas 
			if (pc.vaginas[i].type == GLOBAL.TYPE_SYNTHETIC) addDisabledButton(btnSlot, "Pussy " + (i + 1), "Pussy " + (i + 1), "The " + muffModelerName() + " can't modify robotic vaginas.");
			
			else addButton(btnSlot, "Pussy " + (i + 1), muffModelerCustomizeMenu, i, "Modify", "Take your junk for a spin. Time to mod your snatch.");
			btnSlot++;
		}
	}
	
	//Tailgina button
	if (pc.hasTailCunt())
	{
		//Muff Modeler doesn't work on robotailginas
		if (pc.tailGenitalArg == GLOBAL.TYPE_SYNTHETIC) addDisabledButton(btnSlot, (pc.hasTails() ? "Tailcunts":"Tailcunt"), (pc.hasTails() ? "Tailcunts":"Tailcunt"), "The " + muffModelerName() + " can't modify robotic body parts.");
		//Need an upgrade for fully gooified pcs
		else if (flags["GALOMAX_DOSES"] == 5 && flags["MUFF_MODELER_GALOTIAN_UPGRADE"] == undefined) addDisabledButton(btnSlot, (pc.hasTails() ? "Tailcunts":"Tailcunt"), (pc.hasTails() ? "Tailcunts":"Tailcunt"), "Your mutable physiology prevents the " + muffModelerName() + " from working on you without an upgrade.");
		else addButton(btnSlot, "Tailcunt" + (pc.hasTails() ? "s" : ""), muffModelerCustomizeMenu, -1, "Tailcunt" + (pc.hasTails() ? "s" : ""), (pc.hasTails() ? "Modify your tailginas.":"Modify your tailgina."));
	}
	
	
	//addButton(11, "Uninstall", muffModelerUninstallation);
	if (silly)
	{
		if (muffModelerRandomName) addButton(12, "Disable Random Names", muffModelerRandomNameToggle, undefined, "Disable Random Names", "Disable random names for your Muff Modeler.");
		else addButton(12, "Enable Random Names", muffModelerRandomNameToggle, undefined, "Enable Random Names", "Enable random names for your Muff Modeler.");
	}
	addButton(13, "Store", muffModelerBuyMenu, undefined, "Store", "Browse the add-on store and purchase new modifications.");
	addButton(14, "Back off", leavemuffModeler, undefined, "Back off", "Leave the machine alone.");
}

public function muffModelerRandomNameToggle():void
{
	clearMenu();
	clearOutput();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	if (muffModelerRandomName) 
	{
		output("This is getting ridiculous. You open up a menu and set the name to “Muff Modeler.”");
		muffModelerRandomName = false;
	}
	else
	{
		output("You kind of miss the random names. You open up a menu and remove your default setting.");
		muffModelerRandomName = true;
	}
	addButton(0, "Next", muffModelerMainMenu);
}

//Shows customization options for selected vagina
public function muffModelerCustomizeMenu(vagina:int):void
{
	clearMenu();
	clearOutput();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	output("Please select the desired modification from the menu.\n");
	var i:int = 0;
	var tailginaFlagString:String = "";
	var btnSlot:int = 0;
	
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
		output("\n<b>* Capacity, Bonus:</b> " + prettifyVolume(pc.vaginas[vagina].bonusCapacity));
		output("\n<b>* Looseness Level, Minimum:</b> " + formatFloat(pc.vaginas[vagina].minLooseness, 3));
		output("\n<b>* Girlcum, Quantity Modifier:</b> " + Math.round(pc.girlCumMultiplier() * 1000) / 10 + " %");
		if (pc.fertility() <= 0) output("\n<b>* Fertility:</b> Infertile");
		else
		{
			output("\n<b>* Fertility:</b> " + Math.round(pc.fertility()*1000)/10 + " %");
			output("\n<b>* Pregnancy Speed Modifier:</b> " + Math.round(pc.pregnancyIncubationBonusMother()*1000)/10 + " %");
			output("\n<b>* Pregnancy Quantity Modifier:</b> " + Math.round(pc.pregnancyMultiplier() * 1000) / 10 + " %");
		}
	}
	
	//Tailgina Description
	else
	{
		output("\n<b><u>" + (pc.hasTails() ? "Tailginas" : "Tailgina") + "</u></b>");
		output("\n<b>* Type:</b>");
		output(" " + GLOBAL.TYPE_NAMES[pc.tailGenitalArg]);
		output("\n<b>* Color:</b>");
		output(" " + StringUtil.toDisplayCase(pc.tailGenitalColor));
		for (i; i < tailginaFlags.length; )
		{
			if (pc.hasTailFlag(tailginaFlags[i]))
			{
				if (tailginaFlagString != "") tailginaFlagString += ",";
				tailginaFlagString += (" " + GLOBAL.FLAG_NAMES[tailginaFlags[i]]);
			}
			i++;
		}
		if (tailginaFlagString != "") output("\n<b>* Flags:</b> " + tailginaFlagString);
	}
	
	//Vagina buttons
	if (vagina != -1)
	{	
		addButton(btnSlot, "Type", muffModelerSelectType, vagina, "Type", "Change the type of your " + GLOBAL.TYPE_NAMES[pc.vaginas[vagina].type] + " pussy.");
		btnSlot++;
		
		//Deluxe Edition Buttons. So many buttons...
		if (flags["MUFF_MODELER_DELUXE_EDITION"])
		{
			addButton(btnSlot, "Color", muffModelerSelectColorMenu, vagina, "Color", "Change the color of your " + GLOBAL.TYPE_NAMES[pc.vaginas[vagina].type] + " pussy.");
			btnSlot++;
			
			addButton(btnSlot, "Add Feature", muffModelerSelectFlag, [vagina, true], "Add Feature", "Choose a feature to add to your vagina.");
			btnSlot++;
			
			if (pc.vaginas[vagina].vagooFlags.length > 0) addButton(btnSlot, "Remove Feature", muffModelerSelectFlag, [vagina, false], "Remove Feature", "Choose a flag to remove from your vagina.");
			else addDisabledButton(btnSlot, "Remove Flag", "Remove Flag", "You don't have any features to remove.");
			btnSlot++
			
			addButton(btnSlot, "Girl Cum", muffModelerSelectGirlCumType, vagina, "Change Girl Cum Type", "Change the type of your girl cum.");
			btnSlot++;
	
			addButton(btnSlot, "Characteristics", muffModelerSelectCharacteristics, vagina, "Characteristics", "Customize the characteristics of your vagina.");
			btnSlot++;
			
			if (pc.fertility() <= 0) addDisabledButton(btnSlot, "Pregnancy", "Pregnancy", "You're infertile.");
			else addButton(btnSlot, "Pregnancy", muffModelerSelectPregnancyOptions, vagina, "Pregnancy", "Customize pregnancy related options of your vaginas.");
			btnSlot++;
		}
		
		//Duplicator upgrade buttons
		if (flags["MUFF_MODELER_DUPLICATOR_UPGRADE"])
		{
			if (pc.vaginas.length >= 3) addDisabledButton(btnSlot, "Copy Pussy", "Copy Pussy", "You already have as many vaginas as your body can hold.");
			else addButton(btnSlot, "Copy Pussy", muffModelerDuplicateVagina, vagina, "Copy Pussy", "Duplicate this vagina.");
			btnSlot++;
			
			if (pc.vaginas.length <= 1) addDisabledButton(btnSlot, "Remove Pussy", "Remove Pussy", "You can't remove this vagina.");
			else addButton(btnSlot, "Remove Pussy", muffModelerRemoveVagina, vagina, "Remove Pussy", "Remove this vagina.");
			btnSlot++;
		}
	}
	
	//Tailgina buttons
	else
	{
		output("\n\nHow are you going to customize your tailgina?");
		
		addButton(btnSlot, "Type", muffModelerSelectType, vagina, "Type", "Change the type of your " + GLOBAL.TYPE_NAMES[pc.tailGenitalArg]);
		btnSlot++;
		if (flags["MUFF_MODELER_DELUXE_EDITION"])
		{
			addButton(btnSlot, "Color", muffModelerSelectColorMenu, vagina, "Color", "Change the color of your " + GLOBAL.TYPE_NAMES[pc.tailGenitalArg] + " pussy.");
			btnSlot++;
			
			addButton(btnSlot, "Add Feature", muffModelerSelectFlag, [vagina, true], "Add Flag", (pc.hasTails() ? "Add a feature to your tailginas.":"Add a feature to your tailgina."));
			btnSlot++;
			
			if (tailginaFlagString == "") addDisabledButton(btnSlot, "Remove Feature", "Remove Feature", (pc.hasTails() ? "Your tailginas have no special features.":"Your tailgina has no special features."));
			else addButton(btnSlot, "Remove Flag", muffModelerSelectFlag, [vagina, false], "Remove Features", (pc.hasTails() ? "Remove a feature from your tailginas.":"Remove a feature from your tailgina."));
			btnSlot++;
		}
	}
	
	addButton(14, "Back", muffModelerMainMenu, undefined, "Back", "Go back to the main menu.");
}

//MENU SELECTIONS
//Selects vagina type to change to
public function muffModelerSelectType(vagina:int):void
{
	clearMenu();
	clearOutput();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	var vaginaList:Array;
	var btnSlot:int = 0;
	var btnName:String;
	var btnDescription:String;
	var i:int = 0;
	var multipageMenu:Boolean = false;
	
	output("Select a type:");
	
	if (vagina != -1)
	{
		if (flags["MUFF_MODELER_CODEX_UPGRADE"]) vaginaList = pc.getValidShiftTypes("vagina");
		else vaginaList = defaultPussyTypes;
	}

	//Vagina buttons
	if (vagina != -1)
	{
		//Build us our buttons
		for (i; i < vaginaList.length; i++)
		{
			//Ensures buttons don't overwrite the back button
			if (btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
			{
				addButton(btnSlot, "Back", muffModelerCustomizeMenu, vagina, "Back", "Go back to the customize menu.");
				btnSlot++;
				//Alerts the player if multiple pages are available.
				if (!multipageMenu)
				{
					output("\n(This is a multipage menu - the buttons in the lower right can be used to page through it.)");
					multipageMenu = true;
				}
			}
			
			btnName = vaginaList[i][1]
			//Disabled button for PC's current hoo-ha type
			if (pc.vaginas[vagina].type == vaginaList[i][0])
			{
				addDisabledButton(btnSlot, btnName, btnName, "Your vagina is already a " + btnName + " vagina.");
				btnSlot++;
			}
			
			//Add buttons for unlocked cooch types
			else
			{
				btnDescription = muffModelerTypeButtonDescription(vaginaList[i][0]);
				addButton(btnSlot, btnName, muffModelerChangeType, [vagina, vaginaList[i][0]], btnName, btnDescription);
				btnSlot++;
			}
			
		}
	}
	
	//Tailgina buttons
	else
	{
		//Build us our buttons
		for (i; i < (flags["MUFF_MODELER_CODEX_UPGRADE"] ? GLOBAL.VALID_TAIL_GENITAL_ARGS.length:defaultTailginaTypes.length); i++)
		{
			//Ensures buttons don't overwrite the back button
			if (btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
			{
				addButton(btnSlot, "Back", muffModelerCustomizeMenu, vagina, "Back", "Go back to the customize menu.");
				btnSlot++;
				//Alerts the player if multiple pages are available.
				if (!multipageMenu)
				{
					output("\n(This is a multipage menu - the buttons in the lower right can be used to page through it.)");
					multipageMenu = true;
				}
			}
			
			if (flags["MUFF_MODELER_CODEX_UPGRADE"]) btnName = GLOBAL.TYPE_NAMES[GLOBAL.VALID_TAIL_GENITAL_ARGS[i]];
			else btnName = GLOBAL.TYPE_NAMES[defaultTailginaTypes[i]];
			
			btnDescription = muffModelerTypeButtonDescription((flags["MUFF_MODELER_CODEX_UPGRADE"] ? GLOBAL.VALID_TAIL_GENITAL_ARGS[i]:defaultTailginaTypes[i]));
			
			//Disabled button for PC's current tailgina type
			if (pc.tailGenitalArg == (flags["MUFF_MODELER_CODEX_UPGRADE"] ? GLOBAL.VALID_TAIL_GENITAL_ARGS[i]:defaultTailginaTypes[i]))
			{
				addDisabledButton(btnSlot, btnName, btnName, "Your " + (pc.hasTails() ? "tailginas are" : "tailgina is") + "  already " + btnName);
				btnSlot++;
			}
			
			//Add buttons for unlocked cooch types
			else if (flags["MUFF_MODELER_CODEX_UPGRADE"])
			{
				if (pc.hasTypeUnlocked(GLOBAL.VALID_TAIL_GENITAL_ARGS[i]))
				{
					addButton(btnSlot, btnName, muffModelerChangeType, [vagina, GLOBAL.VALID_TAIL_GENITAL_ARGS[i]], btnName, btnDescription);
					btnSlot++;
				}
			}
			else
			{
				addButton(btnSlot, btnName, muffModelerChangeType, [vagina, defaultTailginaTypes[i]], btnName, btnDescription);
				btnSlot++
			}	
		}
	}
	
	//Ensures back button on the last page is in the right position
	while ((btnSlot + 1) % 15 != 0)
	{
		btnSlot++;
	}
	addButton(btnSlot, "Back", muffModelerCustomizeMenu, vagina, "Back", "Go back to the customization menu.");
}

public function muffModelerTypeButtonDescription(type:int):String
{
	switch (type)
	{
		case GLOBAL.TYPE_HUMAN:
			return "The classic Terran pussy. It's simple, sleek and utilitarian.";
		case GLOBAL.TYPE_KUITAN:
			return "The usual Tanuki cunt. It's cute and ready for action.";
		case GLOBAL.TYPE_LEITHAN:
			return "A roomy leithan snatch. It's big, broad and puffy when excited, yet compact and discreet when not in use.";
		case GLOBAL.TYPE_GRYVAIN:
			return "A typical Gryvain pussy. It's full of internal clits for maximum pleasure. ";
		case GLOBAL.TYPE_SIREN:
			return "An aphrodisiac Suula cunt. It's armed to the brim with powerful venomous tendrils ready to inject its mate with a potent aphrodisiac.";
		case GLOBAL.TYPE_EQUINE:
			return "A mare's muff. It's puffy, juicy and swollen, ready to take even the largest insertions.";
		case GLOBAL.TYPE_CANINE:
			return "A bitch's cunt. Its shape is a bit different than usual, like a streamlined triangle. It's puffy and built for taking large knots.";
		case GLOBAL.TYPE_FELINE:
			return "The typical feline pussy. It's simple, tight and very discreet.";
		case GLOBAL.TYPE_VULPINE:
			return "A foxy snatch. Similar to canine pussies, but more discreet.";
		case GLOBAL.TYPE_SHARK:
			return "An aquatic pussy. It's large and features big, smooth lips.";
		case GLOBAL.TYPE_DEER:
			return "A cute cervine pussy. It's largely unremarkable and discreet.";
		case GLOBAL.TYPE_SWINE:
			return "A sow's pussy. It's tight but deep.";
		case GLOBAL.TYPE_AVIAN:
			return "A simple avian cunt. It's very basic and resembles a cloaca.";
		case GLOBAL.TYPE_ARACHNID:
			return "The pussy of an arachnid creature. It's exotic to say the least.";
		case GLOBAL.TYPE_SAURMORIAN:
			return "The mighty, reptilian pussy of an armored Saurmorian. It's powerful and muscular, just like the species.";
		case GLOBAL.TYPE_GOOEY:
			return "A Galotian faux-pussy. It's completely stretchy and adaptable.";
		case GLOBAL.TYPE_BEE:
			return "A Zil's pussy. It's not very different from a human's.";
		case GLOBAL.TYPE_LAPINARA:
			return "The pussy of a lapinaran. It's sleek and smooth.";
		case GLOBAL.TYPE_VANAE:
			return "An unusual Vanae snatch.";
		case GLOBAL.TYPE_KORGONNE:
			return "A compact Korgonne cunt. It's tight but can take large knots.";
		case GLOBAL.TYPE_BOTHRIOC:
			return "A modified Bothrioc genitalia. It protrudes slightly, forming four bulbs decreasing in size until it ends in a curious-looking opening.\n\nIn accordance to the law, TamaniCorp has removed addictive properties, yet its aphrodisiac effect still remains.";
		case GLOBAL.TYPE_FROSTWYRM:
			return "The pussy of the legendary Frostwyrm. Recreated by TamaniCorp from ancient imagery. The pussy of this extinct species is as impressive as the dragons they resemble.";
		case GLOBAL.TYPE_NAGA:
			return "The snatch of a serpentine lady. It's hidden behind a genital slit and it's large and accommodating.";
		case GLOBAL.TYPE_FLOWER:
			return "A beautiful flower. An exotic form of genital flora. It's vibrant, velvety and fragrant.";
		case GLOBAL.TYPE_MOUTHGINA:
			return "A curious blend of mouth and vagina. It's bizarre, but the universe is full of different tastes.";
		case GLOBAL.TYPE_ANEMONE:
			return "An exotic looking muff. It resembles a balanced blend of anemone and pussy when it comes to external appearance. It's armed with a myriad of aphrodisiac-laced tendrils ready to entice its mate.";
		case GLOBAL.TYPE_DEMONIC:
			return "An intimidating, demonic pussy. It's similar to a human's, but it's folds are different and it's noticeably larger."
		case GLOBAL.TYPE_TENTACLE:
			return "This pussy is mounted on a wild tentacle. Quite unusual."
		case GLOBAL.TYPE_GABILANI:
			return "Cute and small, yet its natural lubrication and powerful, stretchable muscles allows something so petite to take unusually large insertions far exceeding what seems reasonable."
		case GLOBAL.TYPE_NYREA:
			return "The sexual genitalia of Nyrea males. It looks rather simple but features thick internal walls. While not a real pussy in its original species, TamaniCorp has modified it to function as a real reproductive female organ while keeping the external appearance."
		default:
			return "A " + GLOBAL.TYPE_NAMES[type] + " vagina.";
	}
}

//Selects which list of colors to use.
public function muffModelerSelectColorMenu(vagina:int):void
{
	clearMenu();
	clearOutput();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	
	output("Pick a color list:");
	
	addButton(0, "Terran", muffModelerSelectColor, [vagina, "terran"], "Terran", "Choose a Terran color for your " + (vagina != -1 ? "vagina" : "tailgina" + (pc.hasTails() ? "s" : "")) + ".");
	addButton(1, "Vibrant", muffModelerSelectColor, [vagina, "vibrant"], "Vibrant", "Choose a vibrant color for your " + (vagina != -1 ? "vagina" : "tailgina" + (pc.hasTails() ? "s" : "")) + ".");
	addButton(2, "Metallic", muffModelerSelectColor, [vagina, "metallic"], "Metallic", "Choose a metallic color for your " + (vagina != -1 ? "vagina" : "tailgina" + (pc.hasTails() ? "s" : "")) + ".");
	addButton(3, "Glowing", muffModelerSelectColor, [vagina, "glowing"], "Glowing", "Choose a glowing color for your " + (vagina != -1 ? "vagina" : "tailgina" + (pc.hasTails() ? "s" : "")) + ".");
	
	addButton(14, "Back", muffModelerCustomizeMenu, vagina, "Back", "Go back to the customization menu.");
}

//Selects color to change to (arg[0] which vagina, arg[1] which color list)
public function muffModelerSelectColor(arg:Array):void
{
	clearMenu();
	clearOutput();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	var btnSlot:int = 0;
	var colorList:Array = new Array;
	var multipageMenu:Boolean = false;
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
			addButton(btnSlot, "Back", muffModelerSelectColorMenu, arg[0], "Back", "Go back to the color list selection menu.");
			btnSlot++;
				//Alerts the player if multiple pages are available.
				if (!multipageMenu)
				{
					output("\n(This is a multipage menu - the buttons in the lower right can be used to page through it.)");
					multipageMenu = true;
				}
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
				addButton(btnSlot, StringUtil.toDisplayCase(colorList[i]), muffModelerChangeColor, [arg[0], colorList[i]], StringUtil.toDisplayCase(colorList[i]), "Changes your " + (pc.hasTails() ? "tailginas" : "tailgina") + " to " + colorList[i] + ".");
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
				addButton(btnSlot, StringUtil.toDisplayCase(colorList[i]), muffModelerChangeColor, [arg[0], colorList[i]], StringUtil.toDisplayCase(colorList[i]), "Changes your vagina to " + colorList[i] + ".");
				btnSlot++;
			}
		}
	}
	
	//Ensures back button on the last page is in the right position
	while ((btnSlot + 1) % 15 != 0)
	{
		btnSlot++;
	}
	addButton(btnSlot, "Back", muffModelerSelectColorMenu, arg[0], "Back", "Go back to the color list selection menu.");
}

//Choose flag to add or remove (arg[0] which vagina, arg[1] add or remove (true == add)
public function muffModelerSelectFlag(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	
	var i:int = 0;
	var flagName:String;
	var btnSlot:int = 0;
	var tailginaFlagString:String = "";
	var multipageMenu:Boolean = false;
	
	output("Select feature:");
	
	//Add a flag
	if (arg[1])
	{
		//Vagina buttons
		if (arg[0] != -1)
		{
			//Build our buttons
			for (i; i < GLOBAL.VALID_VAGINA_FLAGS.length; i++)
			{
				//Plugged flag is more of a scene specific thing
				if (GLOBAL.VALID_VAGINA_FLAGS[i] == GLOBAL.FLAG_PLUGGED) continue;
				//Ensures buttons don't overwrite the back button
				if (btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
				{
					addButton(btnSlot, "Back", muffModelerCustomizeMenu, arg[0], "Back", "Go back to the customization menu.");
					btnSlot++;
					//Alerts the player if multiple pages are available.
					if (!multipageMenu)
					{
						output("\n(This is a multipage menu - the buttons in the lower right can be used to page through it.)");
						multipageMenu = true;
					}
				}
				
				flagName = GLOBAL.FLAG_NAMES[GLOBAL.VALID_VAGINA_FLAGS[i]];
				
				//Disabled button for the currently possessed flags
				if (pc.vaginas[arg[0]].hasFlag(GLOBAL.VALID_VAGINA_FLAGS[i])) addDisabledButton(btnSlot, flagName, flagName, "Your vagina already has that feature.");
				
				else addButton(btnSlot, flagName, muffModelerChangeFlag, [arg[0], arg[1], GLOBAL.VALID_VAGINA_FLAGS[i]], flagName, "Add the " + flagName + " feature to your vagina.");
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
					addButton(btnSlot, "Back", muffModelerCustomizeMenu, arg[0], "Back", "Go back to the customization menu.");
					btnSlot++;
					//Alerts the player if multiple pages are available.
					if (!multipageMenu)
					{
						output("\n(This is a multipage menu - the buttons in the lower right can be used to page through it.)");
						multipageMenu = true;
					}
				}
				
				flagName = GLOBAL.FLAG_NAMES[tailginaFlags[i]];
				//Disabled button for the currently possessed flags
				if (pc.hasTailFlag(tailginaFlags[i])) addDisabledButton(btnSlot, flagName, flagName, (pc.hasTails() ? "Your tailginas already have that feature." : "Your tailgina already has that feature."));
				
				else addButton(btnSlot, flagName, muffModelerChangeFlag, [arg[0], arg[1], tailginaFlags[i]], flagName, (pc.hasTails() ? "Add the " + flagName + " feature to your tailginas." : "Add the " + flagName + " feature to your tailgina."));
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
					addButton(btnSlot, "Back", muffModelerCustomizeMenu, arg[0], "Back", "Go back to the customization menu.");
					btnSlot++;
					//Alerts the player if multiple pages are available.
					if (!multipageMenu)
					{
						output("\n(This is a multipage menu - the buttons in the lower right can be used to page through it.)");
						multipageMenu = true;
					}
				}
				
				flagName = GLOBAL.FLAG_NAMES[pc.vaginas[arg[0]].vagooFlags[i]];
				addButton(btnSlot, flagName, muffModelerChangeFlag, [arg[0], arg[1], pc.vaginas[arg[0]].vagooFlags[i]], flagName, "Remove the " + flagName + " feature from your vagina.");
				btnSlot++;
			}
		}
		
		//Tailgina buttons
		else
		{
			//Displays flags the pc has
			for (i; i < tailginaFlags.length; )
			{
				if (pc.hasTailFlag(tailginaFlags[i]))
				{
					if (tailginaFlagString != "") tailginaFlagString += ",";
					tailginaFlagString += (" " + GLOBAL.FLAG_NAMES[tailginaFlags[i]]);
				}
				i++;
			}
			if (tailginaFlagString != "") output("\n<b>* Flags:</b> " + tailginaFlagString);
			
			//Build our buttons
			for (i = 0; i < tailginaFlags.length; i++)
			{
				//Ensures buttons don't overwrite the back button
				if (btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
				{
					addButton(btnSlot, "Back", muffModelerCustomizeMenu, arg[0], "Back", "Go back to the customization menu.");
					btnSlot++;
					//Alerts the player if multiple pages are available.
					if (!multipageMenu)
					{
						output("\n(This is a multipage menu - the buttons in the lower right can be used to page through it.)");
						multipageMenu = true;
					}
				}
				
				flagName = GLOBAL.FLAG_NAMES[tailginaFlags[i]];
				
				if (pc.hasTailFlag(tailginaFlags[i]))
				{
					addButton(btnSlot, flagName, muffModelerChangeFlag, [arg[0], arg[1], tailginaFlags[i]], flagName, (pc.hasTails() ? "Remove the " + flagName + " feature from your tailginas.":"Remove the "+ flagName + " feature from your tailgina."));
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
	addButton(btnSlot, "Back", muffModelerCustomizeMenu, arg[0], "Back", "Go back to the customization menu.");
}

public function muffModelerSelectGirlCumType(vagina:int):void
{
	clearOutput();
	clearMenu();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	
	var btnSlot:int = 0;
	var typeName:String;
	var multipageMenu:Boolean = false;
	
	output("Select a female ejaculate type:");
	
	for (var i:int = 0; i < GLOBAL.VALID_GIRLCUM_TYPES.length; i++)
	{
		if (GLOBAL.VALID_GIRLCUM_TYPES[i] == GLOBAL.FLUID_TYPE_SPECIAL_GOO) continue;
		//Ensures buttons don't overwrite the back button
		if (btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", muffModelerCustomizeMenu, vagina, "Back", "Go back to the customization menu.");
			btnSlot++;
			//Alerts the player if multiple pages are available.
			if (!multipageMenu)
			{
				output("\n(This is a multipage menu - the buttons in the lower right can be used to page through it.)");
				multipageMenu = true;
			}
		}
		
		typeName = GLOBAL.FLUID_TYPE_NAMES[GLOBAL.VALID_GIRLCUM_TYPES[i]];
		//Disabled button for pc's current girl cum type
		if (pc.girlCumType == GLOBAL.VALID_GIRLCUM_TYPES[i]) addDisabledButton(btnSlot, typeName, typeName, "Your female ejaculate is already " + typeName + ".");
		
		else addButton(btnSlot, typeName, muffModelerChangeGirlCumType, [vagina, GLOBAL.VALID_GIRLCUM_TYPES[i]], typeName, "Change your female ejaculate to " + typeName + ".");
		btnSlot++;
	}
	
	//Ensures back button on the last page is in the right position
	while ((btnSlot + 1) % 15 != 0)
	{
		btnSlot++;
	}
	addButton(btnSlot, "Back", muffModelerCustomizeMenu, vagina, "Back", "Go back to the customization menu.");
}

public function muffModelerSelectCharacteristics(vagina:int):void
{
	clearMenu();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	var btnSlot:int = 0;
	
	if (pc.vaginas[vagina].hymen) addDisabledButton(btnSlot, "Regen Hymen", "Regen Hymen", "Your vagina's hymen is intact.");
	else addButton(btnSlot, "Regen Hymen", muffModelerChangeHymen, vagina, "Regen Hymen", "Regenerate your vagina's hymen.");
	btnSlot++;
			
	if (pc.vaginas[vagina].wetnessRaw >= 8) addDisabledButton(btnSlot, "Inc. Wetness", "Increase Wetness", "Your vagina is already as wet as this machine can make it.");
	else addButton(btnSlot, "Inc. Wetness", muffModelerChangeWetness, [vagina, true], "Increase Wetness", "Increase the wetness of your vagina.");
	btnSlot++;
			
	if (pc.vaginas[vagina].wetnessRaw <= 0) addDisabledButton(btnSlot, "Dec. Wetness", "Decrease Wetness", "Your vagina is already as dry as this machine can make it.");
	else addButton(btnSlot, "Dec. Wetness", muffModelerChangeWetness, [vagina, false], "Decrease Wetness", "Decrease the wetness of your vagina.");
	btnSlot++;
			
	addButton(btnSlot, "Add Clit", muffModelerChangeClitNumber, [vagina, true], "Add Clit", "Add a clitoris to your vagina.");
			
	if (pc.vaginas[vagina].clits <= 1) addDisabledButton(btnSlot, "Remove Clit", "Remove Clit", "Your vagina already has the smallest number of clits possible.");
	else addButton(btnSlot, "Remove Clit", muffModelerChangeClitNumber, [vagina, false], "Remove Clit", "Remove one of your clits.");
	btnSlot++;
			
	//Ternary operators deal with pluralizing
	if (pc.clitLength >= 12) (pc.totalClits() > 1 ? addDisabledButton(btnSlot, "Lengthen Clits", "Lengthen Clits", "Your clits are already as long as this machine can make them."):addDisabledButton(btnSlot, "Lengthen Clit", "Lengthen Clit", "Your clit is already as long as this machine can make it"));
	else (pc.totalClits() > 1 ? addButton(btnSlot, "Lengthen Clits", muffModelerChangeClitLength, [vagina, true], "Lengthen Clits", "Lengthen your clits."):addButton(btnSlot, "Lengthen Clit", muffModelerChangeClitLength, [vagina, true], "Lengthen Clit", "Lengthen your clit."));
	btnSlot++;
			
	//Ternary operators deal with pluralizing
	if (pc.clitLength <= 0.1) (pc.totalClits() > 1 ? addDisabledButton(btnSlot, "Shrink Clits", "Shrink Clits", "Your clits are already as small as this machine can make them."):addDisabledButton(btnSlot, "Shrink Clit", "Shrink Clit", "Your clit is already as small as this machine can make it."));
	else (pc.totalClits() > 1 ? addButton(btnSlot, "Shrink Clits", muffModelerChangeClitLength, [vagina, false], "Shrink Clits", "Shrink your clits."):addButton(btnSlot, "Shrink Clit", muffModelerChangeClitLength, [vagina, false], "Shrink Clit", "Shrink your clit."));
	btnSlot++;
			
	if (pc.vaginas[vagina].bonusCapacity >= 800) addDisabledButton(btnSlot, "Increase Cap.", "Increase Capacity", "Your vagina is already as capacious as this machine can make it.");
	else addButton(btnSlot, "Increase Cap.", muffModelerChangeBonusCapacity, [vagina, true], "Increase Capacity", "Increase your vagina's bonus capacity.");
	btnSlot++;
			
	if (pc.vaginas[vagina].bonusCapacity <= 0) addDisabledButton(btnSlot, "Decrease Cap.", "Decrease Capacity", "Your vagina is already as tight as this machine can make it.");
	else addButton(btnSlot, "Decrease Cap.", muffModelerChangeBonusCapacity, [vagina, false], "Decrease Capacity", "Decrease the bonus capacity of your vagina.");
	btnSlot++;
			
	if (pc.vaginas[vagina].minLooseness >= 5) addDisabledButton(btnSlot, "Inc. Min. Looseness", "Increase Minimum Looseness", "Your vagina is as loose as this machine can make it.");
	else addButton(btnSlot, "Inc. Min. Looseness", muffModelerChangeMinimumLooseness, [vagina, true], "Increase Minimum Looseness", "Increase the minimum looseness of your vagina.");
	btnSlot++;
			
	if (pc.vaginas[vagina].minLooseness <= 1) addDisabledButton(btnSlot, "Dec. Min. Looseness", "Decrease Minimum Looseness", "Your vagina is as tight as this machine can make it.");
	else addButton(btnSlot, "Dec. Min. Looseness", muffModelerChangeMinimumLooseness, [vagina, false], "Decrease Minimum Looseness", "Decrease the minimum looseness of your vagina.");
	btnSlot++;
			
	if (pc.girlCumMultiplierRaw >= 10) addDisabledButton(btnSlot, "Inc. Girl Cum", "Increase Girl Cum", "You cum as much as this machine can make you.");
	else addButton(btnSlot, "Inc. Girl Cum", muffModelerChangeGirlCumMultiplier, [vagina, true], "Increase Girl Cum", "Increase how much you cum.");
	btnSlot++;
			
	if (pc.girlCumMultiplierRaw <= 1) addDisabledButton(btnSlot, "Dec. Girl Cum", "Decrease Girl Cum", "You cum as little as this machine can make you.");
	else addButton(btnSlot, "Dec. Girl Cum", muffModelerChangeGirlCumMultiplier, [vagina, false], "Decrease Girl Cum", "Decrease how much you cum.");
	btnSlot++;
		
			
	addButton(14, "Back", muffModelerCustomizeMenu, vagina, "Back", "Go back to the customization menu.");
}

public function muffModelerSelectPregnancyOptions(vagina:int):void
{
	clearMenu();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	
	var btnSlot:int = 0;
	
	if (pc.fertilityRaw >= 10) addDisabledButton(btnSlot, "Inc. Fertility", "Increase Fertility", "You're as fertile as this machine can make you.");
	else addButton(btnSlot, "Inc. Fertility", muffModelerChangeFertility, [vagina, true], "Increase Fertility", "Increase your fertility.");
	btnSlot++;
		
	if (pc.fertilityRaw <= 1) addDisabledButton(btnSlot, "Dec. Fertility", "Decrease Fertility", "Your fertility is as low as this machine can make it.");
	else addButton(btnSlot, "Dec. Fertility", muffModelerChangeFertility, [vagina, false], "Decrease Fertility", "Decrease your fertility.");
	btnSlot++;
	
	if (pc.pregnancyIncubationBonusMotherRaw >= 10) addDisabledButton(btnSlot, "Inc. Preg Speed", "Increase Incubation Speed", "Your pregnancies are as fast as this machine can make them.");
	else addButton(btnSlot, "Inc. Preg Speed", muffModelerChangeIncubationSpeed, [vagina, true], "Increase Incubation Speed", "Increase your incubation speed modifier.");
	btnSlot++;
	
	if (pc.pregnancyIncubationBonusMotherRaw <= 1) addDisabledButton(btnSlot, "Dec. Preg Speed", "Decrease Incubation Speed", "Your pregnancies are as slow as this machine can make them.");
	else addButton(btnSlot, "Decrease Inc. Speed", muffModelerChangeIncubationSpeed, [vagina, false], "Decrease Inc. Speed", "Decrease your incubation speed modifier.");
	btnSlot++;
	
	if (pc.pregnancyMultiplierRaw >= 5) addDisabledButton(btnSlot, "Inc. Preg #", "Increase Incubation Quantity", "Your broods are as large as this machine can make them.");
	else addButton(btnSlot, "Inc. Preg #", muffModelerChangeIncubationQuantity, [vagina, true], "Increase Incubation Quantity", "Increase your incubation quantity modifier.");
	btnSlot++;
			
	if (pc.pregnancyMultiplierRaw <= 1) addDisabledButton(btnSlot, "Dec. Preg #", "Decrease Incubation Quantity", "Your broods are as small as this machine can make them.");
	else addButton(btnSlot, "Dec. Preg #", muffModelerChangeIncubationQuantity, [vagina, false], "Decrease Incubation Quantity", "Decrease your incubation quantity modifier.");
	btnSlot++;

	addButton(14, "Back", muffModelerCustomizeMenu, vagina, "Back", "Go back to the customization menu.");
}

//Change Functions
//Text for the machine working
public function muffModelerChangeText(vagina:int):void
{
	var i:int;
	
	//Vagina scene
	if (vagina != -1)
	{
		output("After selecting the desired modification, you confirm your choose and get the machine ready. The " + muffModelerName() + " beeps a couple of times and a femenine, synthetic voice speaks up. <i>“Adapting seat to your specifications. Synchronizing. " + (pc.legCount != 2 ? "Non-bipedal structure detected. Reconfiguring.": "Reconfiguring seat. Please wait.") + "”</i> Right before your eyes, the seat of the machine changes shape to match you - It's quite convenient. " + (pc.isTaur() ? " <i>“Please turn around.”</i> Oh yeah, even if it's adapted, you still can't sit down with this body. Well, you'll have to stand, but at least you can fit your backside there.":""));

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
		output("It's nice to see you also have to option to modify your genitail. You take a quick glance at your [pc.tailCunt] and grin. Yeah, it could use a new appearance. You punch the new changes into the holoscreen and confirm your selection.");

		output("\n\nA synthetic, feminine voice responds to your input. <i>“Genitail modifications selected. Synchronizing. Adapting seating. Please, press your genitail against the modification docket.”</i> A pair of pink, silicone semi-circles illuminate, indicating what you should do next. You take a seat and relax, then  move your [pc.tailCunt] and press it against the cunt-shaped slot.");

		output("\n\n<i>“Securing genitail. Stand by.”</i> A pair of adaptable straps make their appearance and loop around your [pc.tail]'s tip, firmly securing your tailborne snatch. Well, now you just have to wait and let the machine work its magic. You relax and lie down on top of the padding that protects the device. This material is otherworldly. It adapts perfectly to your body's contour and feels almost like your lying on a cloud.");

		output("\n\nA few seconds pass, and you can feel the cushion, seat and docket warm up until they reach a nice and relaxing body temperature. You take it easy and grab the handlebars. Mmmm... if this doesn't begin soon, you could totally fall asleep here.");

		output("\n\n<i>“Phase one.”</i> True to your desires, something pokes in between the silicone lips. You can feel it's shaped like a simple dildo, and it presses against your labia just slightly. <i>“Commencing modifications. Please remain calm and control your genitail.”</i> Here we go! The device starts rumbling at low intensity, vibrating smoothly and teasing your [pc.tailCunt] with a delightful back-and-forth. The sensation is quite stimulating, and your tail slit reacts and squirms a bit. Soon, your tail pussy readies itself to welcome its new friend, opening wide and rewarding the unthinking tool with a few dollops of its natural lube.");

		output("\n\nAh! This is truly captivating. The vibe has cranked up the power and it's now moving up and down, slowly caressing your labia. You're unsure how, but this machine seems to know you inside and out, because it hits all the right spots with millimeter precision. You can already feel the pressure rising. Your orgasm is slowly building up inside you. For a machine, this thing is quite the gentle lover.");

		output("\n\nThe vibe pushes a couple of inches inside, and it switches to a different massage mode, delivering smooth, circular motions while increasing its intensity. Fuck! Now this is too much. Your [pc.tailCunt] is taking the toll. It struggles and trembles from the intensity of the situation, trying to push harder and pleasure itself, but it's firmly secured.");

		output("\n\nYou feel an intense heat and a powerful tingling sensation coming from your tailborne breeder and climbing all the way up your [pc.tail] and spine. This is so odd, but it feels unnaturally pleasurable at the same time. You won't be able to stand this anymore. Your mind is clouded, overwhelmed by lust and delight. You can feel your climax peeking around the corner, yet you're denied time and again, almost like on purpose. Is this damn thing teasing you?! It can't be.");

		output("\n\nDamnit! You need to cum. You won't be able to hold this level of denial for much longer with your mind intact. Youc rave for an orgasm, and you try your best to stimulate yourself, but it's of no use. Somehow, this device knows when you're about to cum and pauses just in the nick of time. This is torture! Stupid machine! Why won't it let you cum?!");

		output("\n\nThe " + muffModelerName() + " beeps and pauses. <i>“Microsurgeons successfully recruited. Commencing phase two.”</i> Gosh! That was only half of it?! You're gonna lose your mind.");

		output("\n\nThe dildo-like tool penetrates further in without a warning, and you feel your entire [pc.tail] rumbling and rocking from the intense vibrations. You're desperately trying to climax at this point, moaning and whining like a whore. You meekly beg the unthinking, uncaring machine for a sliver of pleasure, but the device doesn't waiver and carries on with its duty.");

		output("\n\nThe pressure and the heat constantly increase, and you can finally notice the first changes taking place. You can definitely feel them at long last. Then, you hear something new. The " + muffModelerName() + " is emitting a faint spool-up sound that grows louder by the moment, and suddenly, the transformation tool plunges itself as deep as you can actually offer, taking you completely by surprise and finally giving you all you've been yearning for and much more.");
	
		output("\n\nYour climax hits you hard, and almost on cue, the vibrator goes into overdrive, hammering the insides of your tailgina on a frenzy. It feels out of control! It twists, and turns and brushes against every fold of your inner walls, paying special tribute to your [pc.tail]'s G-Spot.");

		output("\n\nAt this point, you're a quivering mess. Your constant and thundering howls of bliss only serve to announce the entire ship of your debauchery. Your perverse symphony reaches every corner of the room and resonate deep within its walls, signaling your fierce peak.");

		output("\n\nPure, unadulterated pleasure floods your system, pouring all over the place like a deluge and hitting every pleasure center of your body with pinpoint precision. Your brain is almost melting from the hyperstimulation, and all it can do in response is release all those delightful endorphins. Joy and ecstasy sink deep inside your soul, and send you into a lustful high. You can barely think anymore. Your orgasm is rocking your entire body to its core and all you can do is brace for impact and take it.");

		output("\n\nOrgasm after orgasm hits your very being, threatening to take away your consciousness. You barely manage to hold, only to fail as the most intense climax yet hits your brain like a sledgehammer, knocking you off.");

		output("\n\nYou snap out of your stupor a few minutes later. You're completely limp and drooling all over the machine. You've been out for a while, and you can barely react. The holoscreen informs you that the procedure is over, and urges you to remove yourself from the machine. With some difficulty, you stand up and check your brand new [pc.tailCunt ].");

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
	IncrementFlag("USED_MUFF_MODELER");
}

//Text for specific changes
public function muffModelerChangeDescriptionText(vagina:int, flags:Array, addFlag:Boolean, describeFlags:Boolean = true, descriptiveString:String = ""):void
{
	output("\n\nThat was definitely intense. Shit! You can barely think straight. Still half-orgasming, you manage to compose yourself and move away from the machine to give your brand new [pc.pussy " + vagina + "] a complete checkup.");
	
	if (describeFlags)
	{
		//Flag Descriptions
		for (var i:int = 0; i < flags.length; i++)
		{
			switch (flags[i])
			{	
			case GLOBAL.FLAG_LUBRICATED:
				if (addFlag) output("\n\nAt first glance, your [pc.pussyNoun " + vagina + "] glistens with renewed moisture. You probe it tentatively, only to discover you're secreting a sleek and slippery substance. Your [pc.pussyNoun " + vagina + "] is now naturally creating its own lubrication. That should make insertions much easier.");
				else output("\n\nAfter probing and testing for a couple of minutes, you're able to confirm your extra lubrication is gone, just as requested. Perhaps you should buy some real lube now.");
				break;

			case GLOBAL.FLAG_TENDRIL: 
				if (addFlag) output("\n\nWell, this is interesting. From time to time you can catch a glance of thin, yet noticeably long tendrils poking out of your [pc.pussy " + vagina + "]. The darn things have a mind of their own, but if you concentrate hard enough you can at the very least give them a target. You can feel them constantly squirming inside your snatch. This is surely going to raise a few eyebrows during sex, only to drop a few jaws later on once they realize how nice can a hundred of helping hands feel.");
				else output("\n\nIt doesn't take much to notice the myriad tendrils you used to have inside your pussy are gone for good. To be fair, sometimes they can be a bother.");
				break;

			case GLOBAL.FLAG_APHRODISIAC_LACED: 
				if (addFlag) output("\n\nYou catch a whiff of something peculiar. It's musky and fragrant, with a faint, sweet scent. Apparently, it's coming from your pussy. You spot a viscous, light purple liquid mixed together with your natural femenine juices. You take a sample and immediately feel something off. The finger you've used to scoop a bit is tingling and feels awfully sensitive. You're almost certain this is some kind of aphrodisiac. From now on, people are gonna have a hard time resisting your pussy's charms.");
				else output("\n\nAfter toying with your cunt for a bit, you manage to get it wet enough to confirm your femenine juices are no longer mixed with that aphrodisiac fluid anymore. It was fun, but being over-reliant of chemical stimulants can dull your skills.");
				break;

			case GLOBAL.FLAG_GOOEY: 
				if (addFlag) output("\n\nNow, this is curious. Your [pc.pussyNoun " + vagina + "] feels unnaturally elastic and softer. True to your desires, it's now gooey in nature, like a Galotian's. Large insertions should pose no problem now, and you've gotta admit, it's fun to the touch, almost like playing with consistent jelly. You could spend hours toying with this! It's so relaxing.");
				else output("\n\nWell, this one is easy to spot. It's fairly obvious your snatch is no longer gooey in nature, but flesh and blood.");
				break;

			case GLOBAL.FLAG_OVIPOSITOR: 
				if (addFlag) output("\n\nYou can feel the muscles of your [pc.pussy " + vagina + "] relaxing and contracting almost as if they were trying to push something out. There's no doubt about it now, you have the equipment to lay eggs. ");
				else output("\n\nYour internal muscles feel softer than they used to, and you've lost the fine control over them. You guess that must mean you can no longer lay eggs the way you used to.");
				break;

			case GLOBAL.FLAG_RIBBED:
				if (addFlag) output("\n\nTesting your new equipment, you run your fingers all the way inside your [pc.pussy " + vagina + "] only to notice it's walls are ribbed. This ought to pleasure your partner during insertions.");
				else output("\n\nProbing your depths with your finger, you realize the ridged nature of your [pc.pussyNoun " + vagina + "] is no more. It's now a smooth ride inside.");
				break; 

			case GLOBAL.FLAG_SLIGHTLY_PUMPED: 
				if (addFlag) output("\n\nYour labia are quite sensitive and swollen. Your [pc.pussyNoun " + vagina + "] is slightly pumped and engorged. You feel slightly more sensitive and excitable. Besides, this should give you a sexy camel toe.");
				else output("\n\nYour [pc.pussyNoun " + vagina + "] is back to its usual self. It's no longer as engorged and swollen like it used to be. The added sensitivity was a nice bonus, but the plus-sized labia can be a bother sometimes.");
				break;

			case GLOBAL.FLAG_PUMPED: 
				if (addFlag) output("\n\nDamn. Your [pc.pussyNoun " + vagina + "] is fully pumped and noticeably swollen right now. Every slight brush sends shivers up your spine. You feel extremely sensitive down there, and your snatch looks enormously puffy and delightful. This should give you a noticeable bulge in your pants.");
				else output("\n\nYour [pc.pussyNoun " + vagina + "] is back to its usual self. It's no longer as engorged and swollen like it used to be. The added sensitivity was a nice bonus, but the plus-sized labia can be a bother sometimes.");
				break;

			case GLOBAL.FLAG_HYPER_PUMPED: 
				if (addFlag) output("\n\nThis is too much. You [pc.pussyNoun " + vagina + "] is ludicrously swollen and pumped beyond reason. Your labia are enormously engorged and puffy. You feel ludicrously excitable and sensitive, to the point every brush takes you to the brink of orgasm. This should create such a massive bulge in your pants people are gonna think the wrong way.");
				else output("\n\nYour [pc.pussyNoun " + vagina + "] is back to its usual self. It's no longer as engorged and swollen like it used to be. The added sensitivity was a nice bonus, but the plus-sized labia can be a bother sometimes.");
				break;

			case GLOBAL.FLAG_NUBBY: 
				if (addFlag) output("\n\nProbing your depths with your fingers, you've caught a series of sensitive, fleshy nubs inside your vaginal canal. They should make insertions more pleasurable for both partners. It's a nice perk to have, for sure.");
				else output("\n\nYour [pc.pussyNoun " + vagina + "] is now devoid of any nub it might have had in the past. It's noticeably smoother, but the extra pleasure is gone as well. Too bad you can't keep both.");
				break;

			case GLOBAL.FLAG_TONGUE:
				if (addFlag) output("\n\nSomething startled you while you were checking the inside of your [pc.pussyNoun " + vagina + "]. There is in fact a thick, fleshy tongue inside and it's quite friendly. This should give sex an interesting twist, specially tribbadism.");
				else output("\n\nThere aren't any tongues to be find inside your [pc.pussyNoun " + vagina + "]. Now that you said that out loud you realize how crazy it sounds. Anyway, your pussy-borne appendage is gone for good.");
				break; 

			case GLOBAL.FLAG_CORKSCREWED:
				if (addFlag) output("\n\nYou notice a peculiar pattern inside your [pc.pussyNoun " + vagina + "]. It's not as straight as it used to be and instead, it spirals all the way up your womb. Penetrations might be a bit more complicated but definitely fun.");
				else output("\n\nThe spiralling shape that used to adorn the insides of your [pc.pussyNoun " + vagina + "] is nowhere to be found. Just as requested, it's gone..");
				break;
			}
		}
	}
	
	else if (descriptiveString != "") output("\n\n" + descriptiveString);
	
	output("\n\nAll set now. You smile, satisfied with the results. You've got exactly what you've wanted. Perhaps you should give your brand new endowments a trial run.");
}

//Changes vagina to selected type (arg[0] which vagina, arg[1] which type)
public function muffModelerChangeType(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	
	muffModelerChangeText(arg[0]);
	
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
	
	muffModelerChangeDescriptionText(arg[0], (arg[0] != -1 ? pc.vaginas[arg[0]].vagooFlags:pc.tailFlags), true);
	
	addButton(0, "Next", muffModelerMainMenu);
}

//Changes vagina to selected color (arg[0] which vagina, arg[1] which color)
public function muffModelerChangeColor(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	
	muffModelerChangeText(arg[0]);
	
	if (arg[0] != -1)
	{
		pc.vaginas[arg[0]].vaginaColor = arg[1];
	}
	
	else
	{
		pc.tailGenitalColor = arg[1];
	}
	
	muffModelerChangeDescriptionText(arg[0], [], false, false, "Nice, just as requested, your [pc.pussyNoun " + arg[0] + "] is now [pc.pussyColor " + arg[0] + "] colored. It looks good on you. You smile satisfied and try inspecting it in different angles and under different lighting. Yeah, this will do just nice.");
	addButton(0, "Next", muffModelerMainMenu);
}

//Change a flag. arg[0] which vagina, arg[1] add or remove (true == add), arg[2] which flag
public function muffModelerChangeFlag(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	
	muffModelerChangeText(arg[0]);
	
	//Vagina flag change
	if (arg[0] != -1)
	{
		//Adding a Flag
		if (arg[1])
		{
			//If adding a pumped flag, first remove all pumped flag. There can only be one
			if (arg[2] == GLOBAL.FLAG_SLIGHTLY_PUMPED || arg[2] == GLOBAL.FLAG_PUMPED || arg[2] == GLOBAL.FLAG_HYPER_PUMPED)
			{
				if (pc.vaginas[arg[0]].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) pc.vaginas[arg[0]].delFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
				if (pc.vaginas[arg[0]].hasFlag(GLOBAL.FLAG_PUMPED)) pc.vaginas[arg[0]].delFlag(GLOBAL.FLAG_PUMPED);
				if (pc.vaginas[arg[0]].hasFlag(GLOBAL.FLAG_HYPER_PUMPED)) pc.vaginas[arg[0]].delFlag(GLOBAL.FLAG_HYPER_PUMPED);
			}
			
			pc.vaginas[arg[0]].addFlag(arg[2]);
		}
		//Removing a flag
		else
		{
			pc.vaginas[arg[0]].delFlag(arg[2]);
		}
	}
	
	//Tailgina flag change
	else
	{
		//Adding a flag
		if (arg[1])
		{
			pc.addTailFlag(arg[2]);
		}
		//Removing a flag
		else
		{
			pc.removeTailFlag(arg[2]);
		}
	}
	
	muffModelerChangeDescriptionText(arg[0], [], arg[1]);
	addButton(0, "Next", muffModelerMainMenu);
}

//Changes girl cum type arg[0] which vagina (for parser purposes), arg[1] increase or decrease (true == increase)
public function muffModelerChangeGirlCumType(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	
	muffModelerChangeText(arg[0]);
	pc.girlCumType = arg[1];
	muffModelerChangeDescriptionText(arg[0], [], false, false, "Time to check if the changes set in. After toying with your labia and clitty for a bit, you're finally wet enough to confirm your expectations. Your femienine juices has changed, just as expected. They are now [pc.girlcum]. This should be interesting.");
	
	addButton(0, "Next", muffModelerMainMenu);
}

//Changes vagina wetness. arg[0] which vagina, arg[1] increase or decrease (true == increase)
public function muffModelerChangeWetness(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	
	muffModelerChangeText(arg[0]);
		
	if (arg[1])
	{
		pc.vaginas[arg[0]].wetnessRaw++;
		if (pc.vaginas[arg[0]].wetnessRaw > 8) pc.vaginas[arg[0]].wetnessRaw = 8;
		muffModelerChangeDescriptionText(arg[0], [], false, false, "You catch a few straight dolops of [pc.girlcum] dripping from your [pc.pussyNoun " + arg[0] + "]. You're definitely wetter down there than you used to be. This machine can work wonders!");
	}
	else
	{
		pc.vaginas[arg[0]].wetnessRaw--;
		if (pc.vaginas[arg[0]].wetnessRaw < 0) pc.vaginas[arg[0]].wetnessRaw = 0;
		
		muffModelerChangeDescriptionText(arg[0], [], false, false, "At first glance, your [pc.girlcum] production has decreased noticeably. You feel a bit dry than you used to down your loins. Like anything it has its pros and cons, but this is exactly what you wanted.");
	}
	
	
	addButton(0, "Next", muffModelerMainMenu);
}

//Regenerates hymen
public function muffModelerChangeHymen(vagina:int):void
{
	clearOutput();
	clearMenu();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	
	muffModelerChangeText(vagina);
		
	pc.vaginas[vagina].hymen = true;
	
	muffModelerChangeDescriptionText(vagina, [], false, false, "Let's see if this thing worked. You poke and probe deep inside your [pc.pussyNoun " + vagina + "] only to find an early roadblock - a flexible membrane. Perfect, your brand new hymen is in place just as requested. Could this be considered cheating? Well, no one will know.");
	addButton(0, "Next", muffModelerMainMenu);
}

//Changes clit numbers. arg[0] which vagina, arg[1] increase or decrease number (true == increase)
public function muffModelerChangeClitNumber(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	
	muffModelerChangeText(arg[0]);
		
	if (arg[1])
	{
		pc.vaginas[arg[0]].clits++;
		muffModelerChangeDescriptionText(arg[0], [], false, false, "You admire your brand new [pc.clit]. Well, the saying goes two are better than one. Who are you to question popular wisdom? Besides, and extra clitty only means extra pleasure. You smile satisfied, thinking about what you should do with your newly-minted love button. For starters, you give it a few squeezes and rub it a bit just to confirm everything is wired properly. Alright, this machine works perfectly.");
	}
	else
	{
		pc.vaginas[arg[0]].clits--;
		muffModelerChangeDescriptionText(arg[0], [], false, false, "After giving your [pc.pussyNoun] a thorough inspection, you can confirm that in fact, you have one less clit than you used to. It's best to have the right amount than too many, you think to yourself, justifying your decision. Anyway, it worked just as requested.");
	}
	
	addButton(0, "Next", muffModelerMainMenu);
}

//Changes clit size. arg[0] which vagina, arg[1] increase or decrease (true == increase). Changes clits for every vagina, because making clit length an attribute of each vagina rather than a general one would require a massive rewrite of existing code.
public function muffModelerChangeClitLength(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	
	muffModelerChangeText(arg[0]);
		
	if (arg[1])
	{
		if (pc.clitLength < 1) pc.clitLength += 0.2;
		else if (pc.clitLength < 3) pc.clitLength += 0.5;
		else pc.clitLength += 1;
		
		if (pc.clitLength > 12) pc.clitLength = 12;
		muffModelerChangeDescriptionText(arg[0], [], false, false, (pc.totalClits() > 1 ? "Just as promised, your [pc.clits] have grown in length and overall size. They look perfect like this. After all, you can never go wrong with an extra oomph. Bigger clits only mean more contact surface, which should enhance the overall experience.":"Just as promised, your [pc.clits] has grown in length and overall size. It looks perfect like this. After all, you can never go wrong with an extra oomph. A bigger clit only means more contact surface, which should enhance the overall experience."));
	}
	else
	{
		if (pc.clitLength < 1) pc.clitLength -= 0.2;
		else if (pc.clitLength < 3) pc.clitLength -= 0.5;
		else pc.clitLength -= 1;
		
		if (pc.clitLength < 0.1) pc.clitLength = 0.1;
		muffModelerChangeDescriptionText(arg[0], [], false, false, (pc.totalClits() > 1 ? "As requested, your [pc.clits] are noticeably shorter. It's best to get it right than to overdo it, you think to yourself. In any case, you've got what you wanted.":"As requested, your [pc.clits] is noticeably shorter. It's best to get it right than to overdo it, you think to yourself. In any case, you've got what you wanted."));
	}
	
	addButton(0, "Next", muffModelerMainMenu);
}

//Changes Bonus Capacity. arg[0] which vagina, arg[1] increase or decrease (true == increase)
public function muffModelerChangeBonusCapacity(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	
	muffModelerChangeText(arg[0]);
		
	if (arg[1])
	{
		pc.vaginas[arg[0]].bonusCapacity += 100;
		if (pc.vaginas[arg[0]].bonusCapacity > 800) pc.vaginas[arg[0]].bonusCapacity = 800;
		muffModelerChangeDescriptionText(arg[0], [], false, false, "After a thorough insertion test, you're fairly confident that your overall capacity has increased quite sharply. You're definitely roomier down there. This should make large penetrations easier.");
	}
	else
	{
		pc.vaginas[arg[0]].bonusCapacity -= 100;
		if (pc.vaginas[arg[0]].bonusCapacity < 0) pc.vaginas[arg[0]].bonusCapacity = 0;
		muffModelerChangeDescriptionText(arg[0], [], false, false, "After a few tests, you're able to confirm you're less roomy than before. Your [pc.pussiesNoun " + arg[0] + "] should struggle with some large insertions than they were used too.");
	}
	
	addButton(0, "Next", muffModelerMainMenu);
}

//Changes minimum looseness. arg[0] which vagina, arg[1] increase or decrease (true == increase)
public function muffModelerChangeMinimumLooseness(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	
	muffModelerChangeText(arg[0]);
		
	if (arg[1])
	{
		pc.vaginas[arg[0]].minLooseness += 1;
		if (pc.vaginas[arg[0]].minLooseness > 5) pc.vaginas[arg[0]].minLooseness = 5;
		muffModelerChangeDescriptionText(arg[0], [], false, false, "Your vaginal muscles feel less powerful than before. You're noticeably looser down there. It should give you an edge when it comes to taking in big fat cocks.");
	}
	
	else
	{
		pc.vaginas[arg[0]].minLooseness -= 1;
		if (pc.vaginas[arg[0]].minLooseness < 0.5) pc.vaginas[arg[0]].minLooseness = 0.5;
		muffModelerChangeDescriptionText(arg[0], [], false, false, "Damn, you're noticeably tighter than before. Your vaginal muscles have gained in tone overall and are more powerful than before. Penetrations can be harder than they used to, but a tight hole has its perks.");
	}
	
	addButton(0, "Next", muffModelerMainMenu);
}

//Changes girl cum multiplier. arg[0] which vagina (for parsers), arg[1] increase or decrease (true == increase)
public function muffModelerChangeGirlCumMultiplier(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	
	muffModelerChangeText(arg[0]);
		
	if (arg[1])
	{
		pc.girlCumMultiplierRaw += 1;
		if (pc.girlCumMultiplierRaw > 10) pc.girlCumMultiplierRaw = 10;
		muffModelerChangeDescriptionText(arg[0], [], false, false, "It's hard to tell without a proper trial run, but you can feel something's changed inside you. Somehow you feel like you could squirt harder and much more abundantly than before.");
		
	}
	
	else
	{
		pc.girlCumMultiplierRaw -= 1;
		if (pc.girlCumMultiplierRaw < 1) pc.girlCumMultiplierRaw = 1;
		muffModelerChangeDescriptionText(arg[0], [], false, false, "Well, it's not like the requested modification can be tested immediately without a proper climax, but somehow you feel less productive than before. Your orgasm should be less messy than before.");
	}
	
	addButton(0, "Next", muffModelerMainMenu);
}

//Changes fertility. arg[0] which vagina (for parser purposes), arg[1] increase or decrease (true == increase)
public function muffModelerChangeFertility(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	
	muffModelerChangeText(arg[0]);
		
	if (arg[1])
	{
		pc.fertilityRaw += 1;
		if (pc.fertilityRaw > 10) pc.fertilityRaw = 10;
		muffModelerChangeDescriptionText(arg[0], [], false, false, "After a complete scan, your codex beeps to inform you of your increased fertility levels. Hormones levels, egg frequency, and quality, as well as the quality of your endometrium, have risen considerably.");
	}
	
	else
	{
		pc.fertilityRaw -= 1;
		if (pc.fertilityRaw < 1) pc.fertilityRaw = 1;
		muffModelerChangeDescriptionText(arg[0], [], false, false, "Using your codex's scanning function, you're able to confirm you're less fertile than you've used to. The overall quality and frequency of your ovulation have decreased, and your hormone levels have changed as well to make pregnancy less likely.");
	}
	
	addButton(0, "Next", muffModelerMainMenu);
}

//Changes incubation speed. arg[0] which vagina (for parser purposes), arg[1] increase or decrease (true == increase)
public function muffModelerChangeIncubationSpeed(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	
	muffModelerChangeText(arg[0]);
		
	if (arg[1])
	{
		pc.pregnancyIncubationBonusMotherRaw += 1;
		if (pc.pregnancyIncubationBonusMotherRaw > 10) pc.pregnancyIncubationBonusMotherRaw = 10;
		muffModelerChangeDescriptionText(arg[0], [], false, false, "A deep tissue scan confirms the sharp increase in the metabolic function of your uterus as well as your eggs. Your womb is now highly vascularized to compensate. Pregnancies should come to term slightly faster than before.");
	}
	
	else
	{
		pc.pregnancyIncubationBonusMotherRaw -= 1;
		if (pc.pregnancyIncubationBonusMotherRaw < 1) pc.pregnancyIncubationBonusMotherRaw = 1;
		muffModelerChangeDescriptionText(arg[0], [], false, false, "It takes a deep scan to notice the changes to your uterus' metabolic rate. Much like your eggs, it's now less active and less vascularized than before. Pregnancies should take a bit more time to come to term.");
	}
	
	addButton(0, "Next", muffModelerMainMenu);
}

//Changes incubation quantity. arg[0] which vagina (for parsers) arg[1] increase or decrease (true == increase)
public function muffModelerChangeIncubationQuantity(arg:Array):void
{
	clearOutput();
	clearMenu();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	
	muffModelerChangeText(arg[0]);
		
	if (arg[1])
	{
		pc.pregnancyMultiplierRaw += 1;
		if (pc.pregnancyMultiplierRaw > 5) pc.pregnancyMultiplierRaw = 5;
		muffModelerChangeDescriptionText(arg[0], [], false, false, "Your codex beeps informing you of the latest changes to your ovulation. Your eggs are now released in larger quantities, which should make multiple pregnancies much more common than before.");
	}
	
	else
	{
		pc.pregnancyMultiplierRaw -= 1;
		if (pc.pregnancyMultiplierRaw < 1) pc.pregnancyMultiplierRaw = 1;
		muffModelerChangeDescriptionText(arg[0], [], false, false, "After checking your codex, you're able to confirm your egg count has decreased. Ovulations should release fewer eggs at once, making multiple pregnancies less likely.");
	}
	
	addButton(0, "Next", muffModelerMainMenu);
}

//Duplicates vagina
public function muffModelerDuplicateVagina(vagina:int):void
{
	clearOutput();
	clearMenu();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	var targetVagina:int = pc.vaginas.length;
	
	muffModelerChangeText(vagina);

	pc.createVagina();
	pc.copyVagina(targetVagina, vagina);
	
	output("\n\nThat was a wild experience to say the least. Fuck! You're barely conscious at this point. Still weakened and a bit sore, you manage to somehow remove yourself from the device and get some solid footing. Now it's time to check the new changes. After all you requested a new pussy.");

	output("\n\nThe extra piece of anatomy is impossible to miss. You have indeed a brand new [pc.pussy "+ vagina +"] standing right beside the original. Time to check if everything right where it should be.");
	addButton(0, "Next", muffModelerMainMenu);
}

public function muffModelerRemoveVagina(vagina:int):void
{
	clearOutput();
	clearMenu();
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	
	muffModelerChangeText(vagina);
	pc.removeVagina(vagina);
	
	output("\n\nOh my! You've been out for quite a while, and the whole experience is something to remember... well, right now you can barely remember anything, but you're sure it'll come back eventually.");
	
	output("\n\nYou've requested a pussy removal, but first things first. With some difficulty, you manage to stand up and check your crotch. It worked! You can see your [pc.pussiesNoun] and there's in fact one less than before.");
	
	addButton(0, "Next", muffModelerMainMenu);
}

//BUY MENU FUNCTIONS
//Menu of available upgrades.
public function muffModelerBuyMenu():void
{
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	clearMenu();
	clearOutput();
	
	var seasonPassPrice:int = 0;
	var purchasableUpgrades:int = 0;
	switch (undefined)
	{
	case flags["MUFF_MODELER_GALOTIAN_UPGRADE"]: 
		seasonPassPrice += muffModelerGalotianPrice;
		purchasableUpgrades++;
	case flags["MUFF_MODELER_CODEX_UPGRADE"]: 
		seasonPassPrice += muffModelerCodexUpgradePrice;
		purchasableUpgrades++;
	case flags["MUFF_MODELER_DUPLICATOR_UPGRADE"]: 
		seasonPassPrice += muffModelerDuplicatorPrice;
		purchasableUpgrades++;
	case flags["MUFF_MODELER_DELUXE_EDITION"]: 
		seasonPassPrice += muffModelerDeluxePrice;
		purchasableUpgrades++;
		break;
	}
	seasonPassPrice *= 0.85;
	
	output("You select the store.");
	
	output("\n\n<i>“Welcome to TamaniCorp's online catalog. New and exciting pussy options await you.”</i>");
	
	output("\n\n<b>Galotian Upgrade:</b> An upgrade that allows the " + muffModelerName() + " to work on galotians.");
	output("\n" + (flags["MUFF_MODELER_GALOTIAN_UPGRADE"] == undefined ? +muffModelerGalotianPrice + " credits" : "<i>You already own this upgrade.</i>"));
	
	output("\n<b>Codex Upgrade:</b> An expansion that allows the " + muffModelerName() + " to interface with your codex, unlocking new types of pussies as you discover them.");
	output("\n" + (flags["MUFF_MODELER_CODEX_UPGRADE"] == undefined ? +muffModelerCodexUpgradePrice + " credits" : "<i>You already own this upgrade.</i>"));
	
	output("\n<b>Duplicator Upgrade:</b> A firmware update that should deal with multiple vaginas, including removal and duplication");
	output("\n" + (flags["MUFF_MODELER_DUPLICATOR_UPGRADE"] == undefined ? +muffModelerDuplicatorPrice + " credits" : "<i>You already own this upgrade.</i>"));
	
	output("\n<b>Deluxe Edition:</b> Upgrade to the deluxe edition, which allows for targeted modifications.");
	output("\n" + (flags["MUFF_MODELER_DELUXE_EDITION"] == undefined ? +muffModelerDeluxePrice + " credits" : "<i>You already own this upgrade.</i>"));
	
	output("\n<b>Season Pass:</b> All-in-one pack containing all current content.");
	output("\n" + (purchasableUpgrades > 1 ? + seasonPassPrice + " credits" : "<i>This option is no longer available.</i>"));
	
	//Buttons
	if (flags["MUFF_MODELER_GALOTIAN_UPGRADE"] != undefined) addDisabledButton(0, "Galotian Upgrade", "Galotian Upgrade", "You already own this upgrade!");
	else if (pc.credits < muffModelerGalotianPrice) addDisabledButton(0, "Galotian Upgrade", "Galotian Upgrade", "You can't afford this upgrade!");
	else addButton(0, "Galotian Upgrade", muffModelerConfirmBuy, [kGAMECLASS.gameOptions.vendorToggle, 0], "Galotian Upgrade", "Buy the galotian upgrade.");
	
	if (flags["MUFF_MODELER_CODEX_UPGRADE"] != undefined) addDisabledButton(1, "Codex Upgrade", "Codex Upgrade", "You already own this upgrade!");
	else if (pc.credits < muffModelerCodexUpgradePrice) addDisabledButton(1, "Codex Upgrade", "Codex Upgrade", "You can't afford this upgrade!");
	else addButton(1, "Codex Upgrade", muffModelerConfirmBuy, [kGAMECLASS.gameOptions.vendorToggle, 1], "Codex Upgrade", "Buy the codex upgrade.");
	
	if (flags["MUFF_MODELER_DUPLICATOR_UPGRADE"] != undefined) addDisabledButton(2, "Duplicator", "Duplicator", "You already own this upgrade!");
	else if (pc.credits < muffModelerDuplicatorPrice) addDisabledButton(2, "Duplicator", "Duplicator", "You can't afford this upgrade!");
	else addButton(2, "Duplicator", muffModelerConfirmBuy, [kGAMECLASS.gameOptions.vendorToggle, 2], "Duplicator", "Buy the duplicator upgrade.");
	
	if (flags["MUFF_MODELER_DELUXE_EDITION"] != undefined) addDisabledButton(3, "Deluxe Edition", "Deluxe Edition", "You already own this upgrade!");
	else if (pc.credits < muffModelerDeluxePrice) addDisabledButton(3, "Deluxe Edition", "Deluxe Edition", "You can't afford this upgrade!");
	else addButton(3, "Deluxe Edition", muffModelerConfirmBuy, [kGAMECLASS.gameOptions.vendorToggle, 3], "Deluxe Edition", "Buy the deluxe edition upgrade.");
	
	if (purchasableUpgrades == 1) addDisabledButton(4, "Season Pass", "Season Pass", "You no longer need a bundled offer!");
	else if (purchasableUpgrades == 0) addDisabledButton(4, "Season Pass", "Season Pass", "You already own all the upgrades!");
	else if (pc.credits < seasonPassPrice) addDisabledButton(4, "Season Pass", "Season Pass", "You can't afford this option!");
	else addButton(4, "Season Pass", muffModelerConfirmBuy, [kGAMECLASS.gameOptions.vendorToggle, 4], "Season Pass", "Buy the season pass upgrade.");
	
	addButton(14, "Back", muffModelerMainMenu, undefined, "Back", "Go back to the main menu.");
}

//Arg[0]: Show confirmation screen, arg[1] option
public function muffModelerConfirmBuy(arg:Array):void
{
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	clearMenu();
	clearOutput();
	
	var seasonPassPrice:int = 0;
	switch (undefined)
	{
	case flags["MUFF_MODELER_GALOTIAN_UPGRADE"]: 
		seasonPassPrice += muffModelerGalotianPrice;
	case flags["MUFF_MODELER_CODEX_UPGRADE"]: 
		seasonPassPrice += muffModelerCodexUpgradePrice;
	case flags["MUFF_MODELER_DUPLICATOR_UPGRADE"]: 
		seasonPassPrice += muffModelerDuplicatorPrice;
	case flags["MUFF_MODELER_DELUXE_EDITION"]: 
		seasonPassPrice += muffModelerDeluxePrice;
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
			output("galotian upgrade for " + muffModelerGalotianPrice + " credits?");
			break;
		case 1: 
			output("codex upgrade for " + muffModelerCodexUpgradePrice + " credits?");
			break;
		case 2: 
			output("duplicator for " + muffModelerDuplicatorPrice + " credits?");
			break;
		case 3: 
			output("deluxe edition for " + muffModelerDeluxePrice + " credits?");
			break;
		case 4: 
			output("season pass for " + seasonPassPrice + " credits?");
			break;
		}
		
		addButton(0, "Confirm", muffModelerConfirmBuy, [false, arg[1]]);
		addButton(1, "Cancel", muffModelerBuyMenu);
	}
	
	//Set flags and subtract credits
	else
	{
		switch (arg[1])
		{
		case 0:
			output("You bought the galotian upgrade!");
			flags["MUFF_MODELER_GALOTIAN_UPGRADE"] = true;
			pc.credits -= muffModelerGalotianPrice;
			break;
		case 1: 
			output("You bought the codex upgrade!");
			flags["MUFF_MODELER_CODEX_UPGRADE"] = true;
			pc.credits -= muffModelerCodexUpgradePrice;
			break;
		case 2: 
			output("You bought the duplicator!");
			flags["MUFF_MODELER_DUPLICATOR_UPGRADE"] = true;
			pc.credits -= muffModelerDuplicatorPrice;
			break;
		case 3: 
			output("You bought the deluxe edition!");
			flags["MUFF_MODELER_DELUXE_EDITION"] = true;
			pc.credits -= muffModelerDeluxePrice;
			break;
		case 4: 
			output("You bought the season pass!");
			flags["MUFF_MODELER_CODEX_UPGRADE"] = true;
			flags["MUFF_MODELER_DUPLICATOR_UPGRADE"] = true;
			flags["MUFF_MODELER_DELUXE_EDITION"] = true;
			flags["MUFF_MODELER_GALOTIAN_UPGRADE"] = true;
			pc.credits -= seasonPassPrice;
			break;
		}
		
		addButton(0, "Next", muffModelerMainMenu);
	}
}

//Leave the muffModeler menu
public function leavemuffModeler():void
{
	showName("\nMUFF MODELER");
	showBust("");
	author("Thebiologist");
	
	clearOutput();
	output("You decide to leave the Muff Modeler for now.");
	clearMenu();
	if (InShipInterior()) addButton(0, "Next", kGAMECLASS.shipStorageMenuRoot);
	else addButton(0, "Next", mainGameMenu);
}