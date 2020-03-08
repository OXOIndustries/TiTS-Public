// SSTD Masterlist
public function sstdList(filter:String = "all"):Array
{
	var nameList:Array = [];
	
	if(filter == "all" || filter == "Furpies")
	{
		nameList.push("Undetected Furpies");
		nameList.push("Furpies Simplex H");
		nameList.push("Furpies Simplex D");
		nameList.push("Furpies Simplex C");
	}
	if(filter == "all" || filter == "Locofever")
	{
		nameList.push("Undetected Locofever");
		nameList.push("Locofever");
	}
	if(filter == "all" || filter == "Sneezing Tits")
	{
		nameList.push("Undetected Sneezing Tits");
		nameList.push("Sneezing Tits");
	}
	if(filter == "Cooties" || filter == "all")
	{
		nameList.push("Undetected Cooties");
		nameList.push("Cooties");
	}	
	return nameList;
};
// Max duration in case they need to be referenced anywhere.
public function sstdMaxTime(sstdName:String):Number
{
	var maxTime:Number = 0;
	
	switch(sstdName)
	{
		case "Undetected Furpies":
		case "Furpies Simplex H":
		case "Furpies Simplex D":
		case "Furpies Simplex C":
		case "Undetected Locofever":
		case "Locofever":
			maxTime = 17280;
			break;
		case "Undetected Sneezing Tits":
		case "Sneezing Tits":
			maxTime = 10080;
		case "Cooties":
			maxTime = 4320;
			break;
	}
	
	return maxTime;
};

public function mhengaSSTDChance(arg:Creature):void
{
	var sstdList:Array = [];
	if(rand(50) == 0) sstdList.push("Undetected Furpies");
	if(rand(30) == 0) sstdList.push("Undetected Sneezing Tits");
	if(rand(20) == 0 && arg.hasVagina() && isAprilFools()) sstdList.push("Undetected Cooties");
	if(sstdList.length > 0) arg.createStatusEffect(sstdList[rand(sstdList.length)]);
}

public function tarkusSSTDChance(arg:Creature):void
{
	var sstdList:Array = [];
	if(rand(40) == 0) sstdList.push("Undetected Furpies");
	if((arg.originalRace == "raskvel" || arg.raceShort() == "raskvel") && rand(30) == 0) sstdList.push("Undetected Locofever");
	if(rand(30) == 0) sstdList.push("Undetected Sneezing Tits");
	if(rand(20) == 0 && arg.hasVagina() && isAprilFools()) sstdList.push("Undetected Cooties");
	if(sstdList.length > 0) arg.createStatusEffect(sstdList[rand(sstdList.length)]);
}

public function uvetoSSTDChance(arg:Creature):void
{
	var sstdList:Array = [];
	if(rand(50) == 0) sstdList.push("Undetected Furpies");
	if(rand(30) == 0) sstdList.push("Undetected Sneezing Tits");
	if(rand(20) == 0 && arg.hasVagina() && isAprilFools()) sstdList.push("Undetected Cooties");
	if(sstdList.length > 0) arg.createStatusEffect(sstdList[rand(sstdList.length)]);
}

public function myrellionSSTDChance(arg:Creature):void
{
	var sstdList:Array = [];
	if(rand(70) == 0) sstdList.push("Undetected Furpies");
	if(rand(30) == 0) sstdList.push("Undetected Sneezing Tits");
	if(rand(20) == 0 && arg.hasVagina() && isAprilFools()) sstdList.push("Undetected Cooties");
	if(sstdList.length > 0) arg.createStatusEffect(sstdList[rand(sstdList.length)]);
}

public function zhengShiSSTDChance(arg:Creature):void
{
	var sstdList:Array = [];
	if(rand(40) == 0) sstdList.push("Undetected Furpies");
	//if((arg.originalRace == "raskvel" || arg.raceShort() == "raskvel") && rand(30) == 0) sstdList.push("Undetected Locofever");
	if(rand(30) == 0) sstdList.push("Undetected Sneezing Tits");
	if(rand(20) == 0 && arg.hasVagina() && isAprilFools()) sstdList.push("Undetected Cooties");
	if(sstdList.length > 0) arg.createStatusEffect(sstdList[rand(sstdList.length)]);
}
/* WIP stub for later use */
public function dhaalSSTDChance(arg:Creature):void
{
	var sstdList:Array = [];
	//if(rand(40) == 0) sstdList.push("Undetected Furpies");
	//if((arg.originalRace == "raskvel" || arg.raceShort() == "raskvel") && rand(30) == 0) sstdList.push("Undetected Locofever");
	//if(rand(30) == 0) sstdList.push("Undetected Sneezing Tits");
	//if(rand(20) == 0 && arg.hasVagina() && isAprilFools()) sstdList.push("Undetected Cooties");
	//if(sstdList.length > 0) arg.createStatusEffect(sstdList[rand(sstdList.length)]);
}

// Test stuff
public function induceSSTD():void
{
	clearOutput();
	
	showBust("");
	showName("CONTRACT\nSSTD");
	
	output("Which SSTD would you like to test?");
	
	var btnSlot:int = 0;
	
	clearMenu();
	addButton(btnSlot++, "Furpies", induceSSTDGo, "Undetected Furpies");
	addButton(btnSlot++, "Locofever", induceSSTDGo, "Undetected Locofever");
	addButton(btnSlot++, "Sneezing Tits", induceSSTDGo, "Undetected Sneezing Tits");
	addButton(btnSlot++, "Cooties", induceSSTDGo, "Undetected Cooties");
	addButton(14, "Back", mainGameMenu);
}
public function induceSSTDGo(arg:String = "none"):void
{
	clearOutput();
	
	showBust("");
	showName("CONTRACT\nSSTD");
	
	if(InCollection(arg, sstdList()))
	{
		output("You have contracted " + arg + "!");
		var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
		if (!pp.hasCock()) pp.createCock();
		if (!pp.hasVagina()) pp.createVagina();
		pp.createStatusEffect(arg);
		pc.loadInMouth(pp);
	}
	else
	{
		output("You did not select a valid SSTD!");
	}
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function lockedSSTDCodices():Array
{
	var codices:Array = [];
	if(!CodexManager.entryUnlocked("Furpies")) codices.push("Furpies");
	if(!CodexManager.entryUnlocked("Locofever") && CodexManager.entryUnlocked("Raskvel")) codices.push("Locofever");
	if(!CodexManager.entryUnlocked("Sneezing Tits")) codices.push("Sneezing Tits");
	return codices;
}

// Codex unlocks!
public function joyCoDonationButton(btnSlot:int = 0, vkoModel:String = "vko"):void
{
	addButton(btnSlot, "Donate", joyCoDonationPrompt, vkoModel, "Donate", "Donate a small amount of credits for a good cause.");
}
public function joyCoDonationPromptVKo():void { joyCoDonationPrompt("vko"); }
public function joyCoDonationPrompt(vkoModel:String = "vko"):void
{
	clearOutput();
	
	switch(vkoModel)
	{
		case "vko": showVKo(); break;
		case "vi": showVi(); break;
	}
	showName("CREDIT\nDONATION");
	
	output("The nursedroid smiles. <i>“Oh, would you like to make a donation?”</i> Taking a brief pause, she then continues, <i>“For just 50 credits, your contribution will go to " + RandomInCollection([
		"St. Scylla’s Sanctuary for the Hungry",
		"Commodore Edryn’s Home for Wayward Youths",
		"St. Jojo’s Homeless Shelter",
		"Mme. Madeleine’s Galactic Food Drive",
		"the Marcus and Lucia’s Charity Center",
		"the Isabella-Whitney Crisis Response Group",
		"the Dominika Health and Wellness Research Fund"
	]) + ". Will you like to donate to this cause?”</i>");
	
	clearMenu();
	if(pc.credits < 50) addDisabledButton(0, "Yes", "Donate", "You cannot afford the 50 credits to donate!");
	else addButton(0, "Yes", joyCoDonationGo, vkoModel, "Donate", "Donate 50 credits to the charity.");
	addButton(1, "No", joyCoDonationNo, vkoModel, "Don’t Donate", "Maybe next time...");
}
public function joyCoDonationNo(vkoModel:String = "vko"):void
{
	clearOutput();
	output("<i>“No donations?”</i> she asks. <i>“Well thank you for your time. Will there be any other services you require?”</i>");
	
	joyCoDonationBack(vkoModel);
}
public function joyCoDonationGo(vkoModel:String = "vko"):void
{
	clearOutput();
	output("<i>“Excellent! At JoyCo, every penny is precious.”</i>");
	output("\n\nWhen the nursedroid produces a credit scanner, you wave your codex over it to transfer the money.");
	output("\n\n<i>“Thank you very much for your charity. Here, take this.”</i> She hands you a small holo-pamphlet.");
	output("\n\nYou quickly look over the information. It has small blurbs on how your contribution will positively help the organization you’ve chosen. " + ((pc.isBimbo() || pc.isBro()) ? "Ack, reading!" : "Interesting..."));
	
	// Take monies
	pc.credits -= 50;
	// Add nice!
	pc.addNice(1);
	
	// Unlock Missing Codex.
	var codices:Array = lockedSSTDCodices();
	
	if(codices.length > 0)
	{
		output(" In the lower corner, there is a small public service ad for an SSTD...");
		var codex:String = codices[rand(codices.length)];
		output("\n\n<b>You have unlocked the codex entry for " + codex + "!</b>");
		CodexManager.unlockEntry(codex);
	}
	
	output("\n\nThe nurse then waves for your attention. <i>“Do you require anything else?”</i>");
	
	processTime(3);
	
	joyCoDonationBack(vkoModel);
}
public function joyCoDonationBack(vkoModel:String = "vko"):void
{
	switch(vkoModel)
	{
		case "vko":
			showVKo();
			vKoMenu();
			break;
		case "vi":
			showVi();
			viMenu();
			break;
	}
}

