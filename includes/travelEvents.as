// Incoming message is a generic placeholder to hide the specific travel event.
// Lets us roll some kinda timer on the background without forcing people to deal with an event as soon as it pops up or risk losing it --
// Don't read the message until you're prepared for the timer to start pretty much.
public function incomingMessage(travelEvent:Function, originalDestination:String):void
{
	clearOutput();
	output("Mid-flight, you see an alert pop up on your main console. The computer reports that you're picking up a message on open channels.");
	
	clearMenu();
	addButton(0, "Read Message", travelEvent, originalDestination);
	addButton(1, "Ignore", flyToWrapper, originalDestination);
}

// Wrap the normal flyTo function so we can avoid triggering another travel event this time round.
public function flyToWrapper(destination:String):void
{
	flags["SUPRESS TRAVEL EVENTS"] = 1;
	if (flags["STORED SHIP DESTINATION"] != undefined) flags["STORED SHIP DESTINATION"] = undefined;
	flyTo(destination);
}

// Try and return a travel event function. This should be a normal output function that will generally *disable* the event if turned down.
// Travel events should take the signature of function <name>(destination:String) -- turning down the event can then direct the player to their original destination
public function tryProcTravelEvent():Function
{
	var possibleMessages:Array = new Array();
	if (flags["FALL OF THE PHOENIX STATUS"] == undefined && pc.level > 3) possibleMessages.push(fallOfThePhoenixMessage);
	if (flags["RESCUE KIRO FROM BLUEBALLS"] == undefined) possibleMessages.push(rescueKiroMessage);
	
	// If there's an available message, and the player has unlocked the second planet (ie had the fight with Dane):
	// if debug, proc a random message
	// otherwise 25% of an event
	if (possibleMessages.length > 0 && (debug || (rand(4) == 0) && flags["UNLOCKED_JUNKYARD_PLANET"] != undefined))
	{
		return possibleMessages[rand(possibleMessages.length)];
	}
	
	return null;
}

// Leaving these entry functions here a) as documentation of travel events in general 
// - these are the entry points for all travel events
// - this is how the entry and exit functions for travel events should be structured

public function fallOfThePhoenixMessage(destination:String):void
{
	clearOutput();
	output("You hit the display button. A message appears on your ship's console:");

	output("\n\n<i><b>Distress call detected! Message follows:</b>");
	output("\nYou hear a woman’s voice, filled with desperation as something explodes behind her... is that gunfire? “<i>Mayday, mayday, this is the </i>Phoenix<i>! To anyone who can hear me: I’m under attack! They've boarded... cut the controls. I’m pinned down, running out of ammo. For gods’ sakes, send help!</i>”");

	output("\n\n<b>Message repeats.</b></i>");
	
	output("\n\nPirates, probably. Your computer blips that the ship isn't too far out of your way; you could be there in a matter of minutes... Do you respond to the distress call?");
	
	//[Yes] [No]
	clearMenu();
	addButton(0, "Yes", startFallOfThePhoenix, destination);
	addButton(1, "No", ignoreFallOfThePhoenix, destination);
}

public function ignoreFallOfThePhoenix(destination:String):void
{
	flags["FALL OF THE PHOENIX STATUS"] = -1;
	
	clearOutput();
	output("You turn the message off. There's nothing you can do.");
	
	clearMenu();
	addButton(0, "Next", flyToWrapper, destination);
}

public function rescueKiroMessage(destination:String):void
{
	clearOutput();
	
	output("You hit the display button. A message appears on your ship's console:");

	output("\n\n<i><b>Distress call detected! Message text follows:</b>");
	output("\nIf anyone is receiving this, please help. Onboard systems are failing, and I can no longer reach navigation controls. Emergency power is in the red. Help me, please!");
	
	output("\n\n<b>Message repeats.</b></i>");
	
	output("\n\nAnswering it wouldn't take you that far out of the way. Do you respond to the distress call?");
	//[Yes] [No]
	clearMenu();
	addButton(0, "Yes", answerKiroDistressCall, destination);
	addButton(1, "No", ignoreKiroRescue, destination);
}

public function ignoreKiroRescue(destination:String):void
{
	clearOutput();
	output("Are you sure you want to ignore the message?");
	
	clearMenu();
	addButton(0, "Confirm", confirmIgnoreKiroRescue, destination);
	addButton(1, "Back", rescueKiroMessage, destination);
}

public function confirmIgnoreKiroRescue(destination:String):void
{
	clearOutput();
	output("You resume your previous course. Somebody else can deal with it.");

	flags["RESCUE KIRO FROM BLUEBALLS"] = -1;
	
	clearMenu();
	addButton(0, "Next", flyToWrapper, destination);
}