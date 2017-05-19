public function mhengaSSTDChance(arg:Creature):void
{
	var sstdList:Array = [];
	if(rand(50) == 0) sstdList.push("Undetected Furpies");
	if(sstdList.length > 0) arg.createStatusEffect(sstdList[rand(sstdList.length)]);
}

public function tarkusSSTDChance(arg:Creature):void
{
	var sstdList:Array = [];
	if(rand(40) == 0) sstdList.push("Undetected Furpies");
	if((arg.originalRace == "raskvel" || arg.raceShort() == "raskvel") && rand(30) == 0) sstdList.push("Undetected Locofever");
	if(sstdList.length > 0) arg.createStatusEffect(sstdList[rand(sstdList.length)]);
}

public function uvetoSSTDChance(arg:Creature):void
{
	var sstdList:Array = [];
	if(rand(50) == 0) sstdList.push("Undetected Furpies");
	if(sstdList.length > 0) arg.createStatusEffect(sstdList[rand(sstdList.length)]);
}

public function myrellionSSTDChance(arg:Creature):void
{
	var sstdList:Array = [];
	if(rand(70) == 0) sstdList.push("Undetected Furpies");
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
	addButton(14, "Back", mainGameMenu);
}
public function induceSSTDGo(arg:String = "none"):void
{
	clearOutput();
	
	showBust("");
	showName("CONTRACT\nSSTD");
	
	if(InCollection(arg, pc.sstdList))
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