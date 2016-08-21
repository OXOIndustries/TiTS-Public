// Because fuck you that's why

public var lightsOutVictoryFunction:Function;
public var lightsOutFailureFunction:Function;
public var lightsArray:Array;
public var maxLightsOutMoves:int;
public var currentLightsOutMoves:int;

public function configureLightsOut(victory:Function, failure:Function, initialLights:Array, maxMoves:int = 0):void
{
	clearOutput();
	showName("MANUAL\nOVERRIDE");
	output("Circuits illustrated in purple are currently powered on. Blue circuits are presently disabled.");
	output("\n\nDisable all circuits to disable the device as a whole. Enable all circuits to force activation.");
	
	lightsOutVictoryFunction = victory;
	lightsOutFailureFunction = failure;
	
	clearMenu();
	lightsArray = [];
	
	for (var i:int = 0; i < 15; i++)
	{
		lightsArray[i] = false;
		userInterface.setButtonBlue(i);
		addButton(i, "Off", toggleLight, i);
	}
	
	for (i = 0; i < initialLights.length; i++)
	{
		lightsArray[initialLights[i]] = true;
		userInterface.setButtonPurple(initialLights[i]);
		addButton(initialLights[i], "On", toggleLight, initialLights[i]);
	}
	
	currentLightsOutMoves = 0;
	maxLightsOutMoves = maxMoves;
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
	currentLightsOutMoves++;
	
	toggleSlot(slot);
	toggleNearby(slot);
	
	var allOff:Boolean = true;
	var allOn:Boolean = true;
	
	for (var i:int = 0; i < 15; i++)
	{
		if (lightsArray[i] == 1) allOff = false;
		if (lightsArray[i] == 0) allOn = false;
	}
	
	// Check for victory before failure, in case the player "wins" on the turn that would have maxed out and failed
	if (allOff)
	{
		lightsOutVictoryFunction();
		return;
	}
	
	if (allOn || (maxLightsOutMoves != 0 && currentLightsOutMoves >= maxLightsOutMoves))
	{
		lightsOutFailureFunction();
		return;
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