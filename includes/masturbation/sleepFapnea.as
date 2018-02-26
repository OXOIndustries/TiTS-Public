import classes.Items.Miscellaneous.SleepFapnea;

// Sleep Fapnea Device
// By Night Trap

public function sleepFapneaInstallation():void
{
	clearOutput();
	showBust("SLEEP_FAPNEA");
	author("Night Trap");

	if(InShipInterior())
	{
		showName("\nINSTALLING...");
		output("You place your new Sleep Fapnea machine next to your bed before taking a moment to read the digital instruction manual that was included with your purchase. To your delight, you discover that the device is able to sync up with your Codex and personal microbots, meaning you won’t need to wear the electrodes the machine normally requires to broadcast dreams.");
		output("\n\n<b>You’ve installed a Sleep Fapnea device in your ship! You can access it from the storage menu.</b>");
		
		processTime(4);
		flags["SLEEP_FAPNEA_INSTALLED"] = 1;
		
		pc.destroyItemByClass(SleepFapnea);
	}
	else
	{
		showName("SLEEP\nFAPNEA");
		output("You must be onboard your ship in order to install the Sleep Fapnea machine.");
	}
}
public function sleepFapneaUninstall():void
{
	clearOutput();
	showBust("SLEEP_FAPNEA");
	showName("\nUNINSTALLING...");
	
	output("You take some time to uninstall the dedicated dream-inducing device.");
	output("\n\n<b>You no longer have the Sleep Fapnea device installed!</b>");
	
	processTime(8);
	flags["SLEEP_FAPNEA_INSTALLED"] = undefined;
	sleepFapneaReset();
	
	//clearMenu();
	//addButton(0, "Next", mainGameMenu);
	output("\n\n");
	quickLoot(new SleepFapnea());
}

// Resets setting values
public function sleepFapneaReset():void
{
	flags["SLEEP_FAPNEA_ACTIVE"] = undefined;
	pc.removeStatusEffect("Sleep Fapnea Dream");
	flags["SLEEP_FAPNEA_REPEAT"] = undefined;
	flags["SLEEP_FAPNEA_DREAMCATCHER"] = undefined;
}

public function sleepFapneaApproach():void
{
	clearOutput();
	showBust("SLEEP_FAPNEA");
	showName("SLEEP\nFAPNEA");
	author("Night Trap");
	
	output("You direct your attention to the Sleep Fapnea device.");
	output("\n\nWhat do you choose to do?");
	
	sleepFapneaStatus();
	sleepFapneaMenu();
}
	
public function sleepFapneaStatus():void
{
	output("\n\n<b><u>Settings</u></b>");
	output("\n<b>* Status:</b>");
	if(flags["SLEEP_FAPNEA_ACTIVE"] != undefined)
	{
		output(" Active");
		output("\n<b>* Dreams:</b>");
		switch(flags["SLEEP_FAPNEA_ACTIVE"])
		{
			case 0: output(" Chaste Mode"); break;
			case 1: output(" Free Dreaming"); break;
			case 2: output(" Scripted Dreaming"); break;
		}
		if((flags["SLEEP_FAPNEA_ACTIVE"] == 1 && flags["SLEEP_FAPNEA_REPEAT"] != undefined) || flags["SLEEP_FAPNEA_ACTIVE"] == 2) output("\n<b>* Repeat:</b> On");
		if(pc.hasStatusEffect("Sleep Fapnea Dream")) output("\n<b>* Module:</b> “" + sleepFapneaDreamTitle(pc.statusEffectv1("Sleep Fapnea Dream")) + "”");
	}
	else output(" Inactive");
}

public function sleepFapneaMenu():void
{
	clearMenu();
	// [Free Dreaming] [Scripted Dreams] [Chaste Mode] [Off]
	
	if(flags["SLEEP_FAPNEA_ACTIVE"] == 1) addDisabledButton(0, "Free", "Free Dreaming", "Currently free dreaming.");
	else addButton(0, "Free", sleepFapneaSetDream, undefined, "Free Dreaming", "Set the device to induce free dreaming.");
	
	// 9999 addButton(1, "Scripted", sleepFapneaSetScripted, undefined, "Scripted Dreams", (flags["SLEEP_FAPNEA_ACTIVE"] == 2 ? "Change the dream you want to play during scripted dreaming." : "Set the device to induce scripted dreaming."));
	
	if(flags["SLEEP_FAPNEA_ACTIVE"] == 0) addDisabledButton(2, "Chaste", "Chaste Mode", "Currently preventing dreaming.");
	else addButton(2, "Chaste", sleepFapneaSetChaste, undefined, "Chaste Mode", "Set the device to block all dreaming.");
	
	if(flags["SLEEP_FAPNEA_ACTIVE"] == undefined) addDisabledButton(3, "Off", "Off", "Currently turned off.");
	else addButton(3, "Off", sleepFapneaSetOff, undefined, "Off", "Turn the device off to resume normal dreaming patterns.");
	
	if(flags["SLEEP_FAPNEA_ACTIVE"] == 1)
	{
		if(flags["SLEEP_FAPNEA_DREAMCATCHER"] == undefined) addDisabledButton(5, "Repeat:OFF", "Repeat Previous Dream", "The device’s dreamcatcher has not logged your previous dream yet.");
		else addButton(5, ("Repeat:" + (flags["SLEEP_FAPNEA_REPEAT"] != undefined ? "ON" : "OFF")), sleepFapneaSetRepeatToggle, undefined, "Repeat Previous Dream", "Toggle the repeat function to replay your previous dream.");
	}
	else if(flags["SLEEP_FAPNEA_ACTIVE"] == 2) addDisabledButton(5, "Repeat:ON", "Repeat Previous Dream", "Currently repeating the scripted dream.");
	else addDisabledButton(5, "Repeat:OFF", "Repeat Previous Dream", "Free dreaming is not active.");
	if(flags["SLEEP_FAPNEA_DREAMCATCHER"] != undefined) addButton(10, "Delete", sleepFapneaSetRepeatDelete, "intro", "Delete", "Delete the previously saved dream.");
	
	addButton(13, "Uninstall", sleepFapneaUninstall, undefined, "Uninstall Device", "Unplug the machine and put it in your inventory.");
	
	addButton(14, "Leave", sleepFapneaLeave);
}
public function sleepFapneaLeave():void
{
	if(flags["SLEEP_FAPNEA_ACTIVE"] != 2) pc.removeStatusEffect("Sleep Fapnea Dream");
	
	if(InShipInterior()) shipStorageMenuRoot();
	else mainGameMenu();
}

public function sleepFapneaSetDream():void
{
	clearOutput();
	showBust("SLEEP_FAPNEA");
	showName("FREE\nDREAM");
	author("Night Trap");
	
	output("Deciding you’d love to have lewd dreams whenever you sleep on your ship, you open your Codex and set your Sleep Fapnea machine to broadcast.");
	
	processTime(1);
	flags["SLEEP_FAPNEA_ACTIVE"] = 1;
	
	sleepFapneaStatus();
	sleepFapneaMenu();
}
public function sleepFapneaSetRepeatToggle():void
{
	clearOutput();
	showBust("SLEEP_FAPNEA");
	showName("REPEAT\nDREAM");
	author("Jacques00");
	
	if(flags["SLEEP_FAPNEA_REPEAT"] == undefined)
	{
		output("You open your Codex and press the dreamcatcher icon in the control menu to turn on the option of repeating the previous dream you had.");
		output("\n\n<b>The previously captured dream will continue to play as long as the Free Dreaming option is active.</b>");
		
		flags["SLEEP_FAPNEA_REPEAT"] = 1;
	}
	else
	{
		output("You open your Codex and press the dreamcatcher icon in the control menu to turn off the option of repeating the previous dream you had.");
		output("\n\n<b>The previous dream will no longer play, so a newer dream may be saved by the device’s dreamcatcher function.</b>");
		
		flags["SLEEP_FAPNEA_REPEAT"] = undefined;
	}
	
	sleepFapneaStatus();
	sleepFapneaMenu();
}
public function sleepFapneaSetRepeatDelete(response:String = "intro"):void
{
	clearOutput();
	showBust("SLEEP_FAPNEA");
	showName("DELETE\nDREAM");
	author("Jacques00");
	clearMenu();
	
	switch(response)
	{
		case "intro":
			output("Are you sure you want to remove the previously saved dream?");
			addButton(0, "Yes", sleepFapneaSetRepeatDelete, "yes");
			addButton(1, "No", sleepFapneaApproach);
			break;
		case "yes":
			output("You tap the trash can icon next to the dreamcatcher icon and the device beeps, notifying you that it has removed the previous dream from its memeory.");
			
			flags["SLEEP_FAPNEA_DREAMCATCHER"] = undefined;
			
			sleepFapneaStatus();
			sleepFapneaMenu();
			break;
	}
}

public function sleepFapneaSetScripted():void
{
	clearOutput();
	showBust("SLEEP_FAPNEA");
	showName("SCRIPTED\nDREAM");
	author("Night Trap");
	
	output("You decide you’d like to try out one of the dream modules. Opening up your Codex, you scroll through the list of modules, trying to pick which one seems most appealing at the moment.");
	
	// display list of modules here
	output("\n\n<b><u>Dream Modules</u></b>");
	
	clearMenu();
	
	var btnSlot:int = 0;
	if(9999 == 9999) sleepFapneaDreamButton(btnSlot++, 0);
	if(9999 == 9999) sleepFapneaDreamButton(btnSlot++, 1);
	if(9999 == 9999) sleepFapneaDreamButton(btnSlot++, 2);
	if(9999 == 9999) sleepFapneaDreamButton(btnSlot++, 3);
	if(9999 == 9999) sleepFapneaDreamButton(btnSlot++, 4);
	
	output("\n\n");
	
	addButton(14, "Back", sleepFapneaApproach);
}
private function sleepFapneaDreamButton(btnSlot:int = 0, dreamIdx:int = 0):void
{
	output("\n* “" + sleepFapneaDreamList[dreamIdx][2] + "”");
	if(pc.hasStatusEffect("Sleep Fapnea Dream") && pc.statusEffectv1("Sleep Fapnea Dream") == dreamIdx)
	{
		output(" (Selected)");
		addDisabledButton(btnSlot, sleepFapneaDreamList[dreamIdx][1], sleepFapneaDreamList[dreamIdx][2], "Dream currently active.");
	}
	else addButton(btnSlot, sleepFapneaDreamList[dreamIdx][1], sleepFapneaSetScriptedOK, dreamIdx, sleepFapneaDreamList[dreamIdx][2], "Select this dream.");
}
public function sleepFapneaSetScriptedOK(dreamIdx:int = 0):void
{
	clearOutput();
	showBust("SLEEP_FAPNEA");
	showName("SCRIPTED\nDREAM");
	author("Night Trap");
	
	output("Having made your selection, you tuck away your Codex. It might be hard to fall asleep when you’re anticipating a professionally-made wet dream, but you’re sure the wait will be worth it.");
	output("\n\nYou have selected “" + sleepFapneaDreamList[dreamIdx][2] + "” and it will be your next dream!");
	
	processTime(1);
	flags["SLEEP_FAPNEA_ACTIVE"] = 2;
	
	// "Sleep Fapnear Dream"
	// v1: dream list index
	pc.createStatusEffect("Sleep Fapnea Dream", 0, 0, 0, 0, true, "", "", false, 0);
	pc.setStatusValue("Sleep Fapnea Dream", 1, dreamIdx);
	
	sleepFapneaStatus();
	sleepFapneaMenu();
}

public function sleepFapneaSetChaste():void
{
	clearOutput();
	showBust("SLEEP_FAPNEA");
	showName("NO\nDREAMS");
	author("Night Trap");
	
	output("Deciding you’d prefer not to have any lewd dreams for the time being, you open your Codex and set the Sleep Fapnea machine to chaste mode. Hopefully your dreams should be less stimulating from now on.");
	
	processTime(1);
	flags["SLEEP_FAPNEA_ACTIVE"] = 0;
	
	sleepFapneaStatus();
	sleepFapneaMenu();
}

public function sleepFapneaSetOff():void
{
	clearOutput();
	showBust("SLEEP_FAPNEA");
	showName("DEVICE\nOFF");
	author("Night Trap");
	
	output("Deciding you’d prefer not to have a machine heavily influencing your mind as you sleep, you open your Codex and turn off the Sleep Fapnea machine.");
	
	processTime(1);
	flags["SLEEP_FAPNEA_ACTIVE"] = undefined;
	
	sleepFapneaStatus();
	sleepFapneaMenu();
}

// Special Dreams List
private var sleepFapneaDreamList:Array = [
	// functionName, "Button Name", "Dream Title" 
	[ sleepFapneaNoDream, "Dream 0", "No Dream" ], // 0
	[ sleepFapneaNoDream, "Dream 1", "No Dream" ], // 1
	[ sleepFapneaNoDream, "Dream 2", "No Dream" ], // 2
	[ sleepFapneaNoDream, "Dream 3", "No Dream" ], // 3
	[ sleepFapneaNoDream, "Dream 4", "No Dream" ], // 4
];
public function sleepFapneaDreamTitle(dreamIdx:int = 0):String
{
	return sleepFapneaDreamList[dreamIdx][2];
}
public function sleepFapneaDreamGo():void
{
	sleepFapneaDreamList[pc.statusEffectv1("Sleep Fapnea Dream")][0]();
	return;
}

public function sleepFapneaNoDream():void
{
	clearOutput();
	showBust("SLEEP_FAPNEA");
	showName("\nDREAMING...");
	author("Night Trap");
	
	output("The Sleep Fapnea device failed to produce any vibrant dreams that you can recall...");
	
	addButton(0, "Next", mainGameMenu);
}

