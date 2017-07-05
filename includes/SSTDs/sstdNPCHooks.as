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
			break;
	}
	
	return maxTime;
};

public function mhengaSSTDChance(arg:Creature):void
{
	var sstdList:Array = [];
	if(rand(50) == 0) sstdList.push("Undetected Furpies");
	if(rand(30) == 0) sstdList.push("Undetected Sneezing Tits");
	if(sstdList.length > 0) arg.createStatusEffect(sstdList[rand(sstdList.length)]);
}

public function tarkusSSTDChance(arg:Creature):void
{
	var sstdList:Array = [];
	if(rand(40) == 0) sstdList.push("Undetected Furpies");
	if((arg.originalRace == "raskvel" || arg.raceShort() == "raskvel") && rand(30) == 0) sstdList.push("Undetected Locofever");
	if(rand(30) == 0) sstdList.push("Undetected Sneezing Tits");
	if(sstdList.length > 0) arg.createStatusEffect(sstdList[rand(sstdList.length)]);
}

public function uvetoSSTDChance(arg:Creature):void
{
	var sstdList:Array = [];
	if(rand(50) == 0) sstdList.push("Undetected Furpies");
	if(rand(30) == 0) sstdList.push("Undetected Sneezing Tits");
	if(sstdList.length > 0) arg.createStatusEffect(sstdList[rand(sstdList.length)]);
}

public function myrellionSSTDChance(arg:Creature):void
{
	var sstdList:Array = [];
	if(rand(70) == 0) sstdList.push("Undetected Furpies");
	if(rand(30) == 0) sstdList.push("Undetected Sneezing Tits");
	if(sstdList.length > 0) arg.createStatusEffect(sstdList[rand(sstdList.length)]);
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

public function unlockSSTDCodex():void
{
	CodexManager.unlockEntry("Furpies");
	CodexManager.unlockEntry("Locofever");
	CodexManager.unlockEntry("Sneezing Tits");
}

