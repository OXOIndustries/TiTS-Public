// Because fuck you that's why

public var lightsOutVictoryFunction:Function;
public var lightsOutFailureFunction:Function;

public var lightsArray:Array;

function startLightsOut(victoryFunction:Function = null, failureFunction:Function = null):void
{
	clearOutput();
	output("Lights out. Because fuck you that's why.");
	output("\n\nA gif of winning you say? Nobody said I couldn't cheat.");
	
	if (victoryFunction == null) victoryFunction = mainGameMenu;
	lightsOutVictoryFunction = victoryFunction;
	if (failureFunction == null) failureFunction = mainGameMenu;
	lightsOutFailureFunction = failureFunction;
	
	clearMenu();
	lightsArray = new Array();
	
	for (var i:int = 0; i < 15; i++)
	{
		lightsArray[i] = false;
		userInterface.setButtonBlue(i);
		
		addButton(i, " ", toggleLight, i);
	}
	
	lightsArray[0] = true;
	lightsArray[1] = true;
	lightsArray[5] = true;
	
	userInterface.setButtonPurple(0);
	userInterface.setButtonPurple(1);
	userInterface.setButtonPurple(5);
	
	
	
	//for (var i:int = 0; i < 15; i++)
	//{
		//if (rand(3) == 0)
		//{
			//lightsArray[i] = true;
			//userInterface.setButtonPurple(i);
		//}
		//else
		//{
			//lightsArray[i] = false;
			//userInterface.setButtonBlue(i);
		//}
		//addButton(i, " ", toggleLight, i);
	//}
}

public function testVictoryFunc():void
{
	clearOutput();
	output("A winner is you! A horsecock for your butt as tribute!");
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function toggleSlot(slot:int):void
{
	lightsArray[slot] = !lightsArray[slot]
	
	if (lightsArray[slot]) userInterface.setButtonPurple(slot);
	else userInterface.setButtonBlue(slot);
}

public function toggleLight(slot:int):void
{
	toggleSlot(slot);
	toggleNearby(slot);
	
	var allOff:Boolean = true;
	var allOn:Boolean = true;
	
	for (var i:int = 0; i < 15; i++)
	{
		if (lightsArray[i] == 1) allOff = false;
		if (lightsArray[i] == 0) allOn = false;

	}
	if (allOn)
	{
		lightsOutFailureFunction();
	}
	if (allOff)
	{
		lightsOutVictoryFunction();
	}
}

public function toggleNearby(slot:int):void
{
	var pX:int = slot % 5;
	var pY:int = slot / 5;
	
	if (pX > 0) toggleSlot(slot - 1);
	if (pX < 4) toggleSlot(slot + 1);
	if (pY > 0) toggleSlot(slot - 5);
	if (pY < 2) toggleSlot(slot + 5);
}