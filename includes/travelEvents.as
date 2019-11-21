// Incoming message is a generic placeholder to hide the specific travel event.
// Lets us roll some kinda timer on the background without forcing people to deal with an event as soon as it pops up or risk losing it --
// Don't read the message until you're prepared for the timer to start pretty much.
public function incomingMessage(travelEvent:Function, originalDestination:String):void
{
	clearOutput();
	output("Mid-flight, you see an alert pop up on your main console. The computer reports that you’re picking up a message on open channels.");
	
	clearMenu();
	addButton(0, "Read Message", travelEvent, originalDestination);
	addButton(1, "Ignore", flyToWrapper, originalDestination);
}

// Wrap the normal flyTo function so we can avoid triggering another travel event this time round.
public function flyToWrapper(destination:String = "TAVROS HANGAR"):void
{
	flags["SUPRESS TRAVEL EVENTS"] = 1;
	if (flags["STORED SHIP DESTINATION"] != undefined) flags["STORED SHIP DESTINATION"] = undefined;
	switch(destination)
	{
		// Myrellion destination swaps
		case "600":
		case "2I7":
			if (flags["KQ2_MYRELLION_STATE"] == undefined) destination = "600";
			else if (flags["KQ2_MYRELLION_STATE"] != 1) destination = "2I7";
			else destination = "TAVROS HANGAR";
			break;
	}
	flyTo(destination);
}

// Try and return a travel event function. This should be a normal output function that will generally *disable* the event if turned down.
// Travel events should take the signature of function <name>(destination:String) -- turning down the event can then direct the player to their original destination
public function tryProcTravelEvent(destination:String):Function
{
	var possibleMessages:Array = new Array();
	if (flags["FALL OF THE PHOENIX STATUS"] == undefined && pc.level > 3) possibleMessages.push(fallOfThePhoenixMessage);
	if (flags["RESCUE KIRO FROM BLUEBALLS"] == undefined) possibleMessages.push(rescueKiroMessage);
	if (flags["ICEQUEEN COMPLETE"] == undefined && pc.level > 5) possibleMessages.push(iceQueenMessage);

	// Should only be available a week either side of hallowiener
	if (isHalloweenish() || debug || rand(100) == 0)
	{
		if (!MailManager.isEntryUnlocked("KashimaMail") && pc.level >= 7 && (shipLocation == "600" || shipLocation == "2I7" || destination == "Myrellion" || destination == "MyrellionDeepCaves"))
		{
			possibleMessages.push(sendKashimaMessage);
		}
		
		if (flags["EVENT_WHORIZON_STATE"] == undefined && (pc.hasVagina() || pc.hasCock()) && pc.level >= 7)
		{
			possibleMessages.push(sendEventWhorizonMessage);
		}
	}
	
	// If there's an available message, and the player has unlocked the second planet (ie had the fight with Dane):
	// if debug, proc a random message
	// otherwise 25% of an event
	if (possibleMessages.length > 0 && (debug || (rand(4) == 0) && flags["UNLOCKED_JUNKYARD_PLANET"] != undefined))
	{
		return possibleMessages[rand(possibleMessages.length)];
	}
	
	return null;
}

public function bearMessage(destination:String):void
{
	clearOutput();
	showName("WHAT\nTHE FUCK?");
	author("Wsan");
	//Random event when flying from planet to planet. Silly mode only
	output("An alarm sounds in your ship, alerting you to the presence of what appears to be something hurtling towards you. Closer inspection reveals it to be some kind of quadruped animal, and out of curiosity you halt your craft to check what it is. Employing a small tractor beam as it flies by, you think you get a glimpse of what it might be and decide to take a closer look. There’s no way that’s what you thought it was.");
	output("\n\nTrudging down to the hold, you discover with some trepidation that you were right: it’s a fucking bear. Specifically, an <i>Ursus Arctos Middendorffi</i> or Kodiak bear from Earth.");
	output("\n\n<i>“What the fuck,”</i> you say dully, your voice especially hollow in the hold.");
	output("\n\nAfter a few minutes of consideration, you decide this isn’t worth spending time thinking about. You have literally not even the faintest of clues how or why this bear got into space, and any time spent guessing is likely to drive you insane. You’ll sell it to the next museum you encounter. Stowing it away in a container with some effort, you head back up to the cockpit with a shake of your head. Fucking space bears.");
	flags["SPACE_BEAR"] = 0;

	clearMenu();
	addButton(0, "Next", flyToWrapper, destination);
}

public function bearFlyAway(destination:String):void
{
	clearOutput();
	showName("ROARING\nGOOD SALE");
	author("Wsan");
	//After landing on Tavros, then departing
	output("You get a notification that acknowledges the sale of your Space Bear. According to carbon dating, it was from the distant year of 1984. The vacuum of space evidently perfectly preserved it, and the museum is incredibly grateful to you for fetching them such a relic. They’ve deposited 10,000 credits into your account. Frankly, you’re just happy to be rid of it.");
	pc.credits += 10000;
	flags["SPACE_BEAR"] = 1;
	clearMenu();
	addButton(0, "Next", flyToWrapper, destination);
}


// Leaving these entry functions here a) as documentation of travel events in general 
// - these are the entry points for all travel events
// - this is how the entry and exit functions for travel events should be structured

public function fallOfThePhoenixMessage(destination:String):void
{
	clearOutput();
	output("You hit the display button. A message appears on your ship’s console:");

	output("\n\n<i><b>Distress call detected! Message follows:</b></i>");
	output("\nYou hear a woman’s voice, filled with desperation as something explodes behind her... is that gunfire? <i>“Mayday, mayday, this is the </i>Phoenix<i>! To anyone who can hear me: I’m under attack! They’ve boarded... cut the controls. I’m pinned down, running out of ammo. For gods’ sakes, send help!”</i>");

	output("\n\n<i><b>Message repeats.</b></i>");
	
	output("\n\nPirates, probably. Your computer blips that the ship isn’t too far out of your way; you could be there in a matter of minutes... Do you respond to the distress call?");
	
	//[Yes] [No]
	clearMenu();
	addButton(0, "Yes", startFallOfThePhoenix, destination);
	addButton(1, "No", ignoreFallOfThePhoenix, destination);
}

public function ignoreFallOfThePhoenix(destination:String):void
{
	flags["FALL OF THE PHOENIX STATUS"] = -1;
	
	clearOutput();
	output("You turn the message off. There’s nothing you can do.");
	
	clearMenu();
	addButton(0, "Next", flyToWrapper, destination);
}

public function rescueKiroMessage(destination:String):void
{
	clearOutput();
	
	output("You hit the display button. A message appears on your ship’s console:");

	output("\n\n<i><b>Distress call detected! Message text follows:</b>");
	output("\nIf anyone is receiving this, please help. Onboard systems are failing, and I can no longer reach navigation controls. Emergency power is in the red. Help me, please!");
	
	output("\n\n<b>Message repeats.</b></i>");
	
	output("\n\nAnswering it wouldn’t take you that far out of the way. Do you respond to the distress call?");
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

public function iceQueenMessage(destination:String):void
{
	clearOutput();
	author("Savin");

	output("Unlike most S.O.S. channel broadcasts you’ve seen, this one isn’t on a loop. According to your comms gear, it’s a live broadcast. Must be nearby - and urgent!");
	
	output("\n\nYou accept the incoming distress message, and your forward screen is overwhelmed with a digital image of a smoky ship’s interior, so thick that it’s hard to see anything but vague shapes and dark outlines. A tall, masculine figure is standing over the camera, so shadowed by smoke that it’s impossible to see his race, or any details at all but broad shoulders and disheveled hair falling in disheveled shaggy locks around his shoulders.");
	
	output("\n\n<i>“Ah! About time!”</i> the man says, stifling a cough. <i>“Listen, this is Captain Kandar of the </i>Ice Queen<i>. We’ve got a serious situation aboard. Our LightDrive went critical, and it’s venting smoke and gas into the crew deck. We’re pretty much dead in the water out here. Any assistance would be much appreciated.”</i>");
	
	output("\n\nHeck of a gamble, saying that while you remain unseen. You could just have easily been a pirate, after all. You key the comms and ask what you can do to help.");
	
	output("\n\nThe man on the screen grunts and runs a hand through his hair. <i>“Uh, at this point, we’re probably going to have to bail out. Unless you’ve got an industrial atmo-scrubber in your hold, anyway. You don’t happen to, eh?”</i>");
	
	output("\n\nYou shake your head, though your ship’s got a pretty decent one built in. If you dock with the <i>Ice Queen</i>, you might be able to overclock it and scrub both ships. At least for a little while.");
	
	output("\n\n<i>“Hey, that’d be great. Listen,”</i> he pauses to cough, covering his mouth in his arm. <i>“Shit, this is getting thick. I gotta go. We’ll talk when you get here - I’m sending coordinates now. You’re a life saver, pal.”</i>");
	
	output("\n\nThe video link cuts out, but your comms beep an alert: transmission received. Coordinates for the <i>Ice Queen</i>. She’s barely 10 minutes away at maximum LightDrive speed... if you want to help.");

	//[Help Him] [Ignore]
	clearMenu();
	addButton(0, "Help Him", iceQueenMessageHelp, destination, "Help Him", "Dock with the <i>Ice Queen</i> and see what you can do to help.");
	addButton(1, "Ignore", iceQueenMessageIgnore, destination, "Ignore Him", "No thanks. Kandar will have to make do on his own.");
}

public function iceQueenMessageIgnore(destination:String):void
{
	clearOutput();

	output("You think about it a few moments, then shake your head. Kandar and his crew will have to manage on their own. You’ve got more important fish to fry.");
	flags["ICEQUEEN COMPLETE"] = -1;

	clearMenu();
	addButton(0, "Next", flyToWrapper, destination);
}

public function testKashimaEvent():void
{
	sendKashimaMessage("Tavros");
}