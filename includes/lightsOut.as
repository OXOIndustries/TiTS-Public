// Because fuck you that's why

public var lightsOutVictoryFunction:Function;
public var lightsOutFailureFunction:Function;

public var lightsArray:Array;

public function startLightsOut(victoryFunction:Function = null, failureFunction:Function = null):void
{
	clearOutput();
	showName("MANUAL\nOVERRIDE");
	output("Circuits illustrated in purple are currently powered on. Blue circuits are presently disabled.");
	output("\n\nDisable all circuits to disable the device as a whole. Enable all circuits to force activation.");
	
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
		
		addButton(i, "Off", toggleLight, i);
	}
	
	var onBts:Array = [1, 5, 6, 9, 10, 11, 12, 13];
	
	for (i = 0; i < onBts.length; i++)
	{
		lightsArray[onBts[i]] = true;
		userInterface.setButtonPurple(onBts[i]);
		
		addButton(onBts[i], "On", toggleLight, onBts[i]);
	}
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
	
	if (lightsArray[slot]) 
	{
		userInterface.setButtonPurple(slot);
		userInterface.setButtonText(slot, "On");
	}
	else
	{
		userInterface.setButtonBlue(slot);
		userInterface.setButtonText(slot, "Off");
	}
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