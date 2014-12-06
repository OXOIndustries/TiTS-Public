//Landing on Myrellion, First Time
function myrellionHangarBonus():Boolean
{
	return false;
}

function flyToMyrellion():void
{
	if(flags["VISITED_MYRELLION"] == undefined)
	{
		clearOutput();
		author("Savin");
		output("You guide your vessel into the space around Myrellion, the only inhabited planet in the system. While most planets in the Rush are magnets for explorers and pioneers, this is the first world where you've seen warships in orbit: your sensors pick up a small battle group of Ausar Federation and Terran-Space Coalition ships holding in high orbit: a cursory glance says that their shields are up and their weapons are locked on the planet below.");
		output("\n\nYour shipboard computer automatically syncs with the U.G.C. Scout Authority beacon hanging in the atmosphere as you glide down towards the surface. A warning appears on screen:\n\n<i>Notice: the Myrellion System has been flagged as Extremely Dangerous to civilians. There is a high risk of bodily harm or death while exploring this world, especially beyond the U.G.C. embassy on the surface. Your safety cannot be guaranteed beyond the planet's atmosphere.</i>");
		output("\n\nWhat's going on here? You let the autopilot guide you down towards the surface, homing in on the embassy you've been told to go to. As you start to near it, your sensors bleep an urgent warning: <i>several unidentified aircraft incoming!</i> You glance at your display, watching a half-dozen bogies zip towards you from behind. You're about to power up weapons when your emergency radio beeps.");
		output("\n\nMost pilots go their whole careers without ever actually getting an old-fashioned radio transmission. Nobody even uses these things anymore... so what the hell? You pick up.");
		output("\n\n“<i>Unidentified offworld aircraft,</i>” a female voice says over the radio, difficult to hear over an incredible amount of background noise. “<i>This is Cadence Squadron. We’ll be guiding you into the embassy airfield. Please follow us.</i>”");
		output("\n\nAs she’s speaking, the aircraft finally come into view around your ship: they’re... they’re old prop-rotor airplanes, not even starfighters. Hell, they’re not much more than biplanes with machine guns strapped to the open cockpits. The planes fall in around you, forcing you to slow to a veritable crawl to keep from crashing into them; one of the planes comes almost level with your cockpit, and the pilot gives you a friendly wave from one of her four arms. You blink as you see a pair of large, insectile antenna whipping in the wind over her head, poking out from an old-school aviator’s cap.");
		output("\n\nYou take manual control of your ship for the last few minutes, following the biplane squadron down and across the heat-blasted red rock of the planet, and towards what looks like an airfield in the distance. That turns out to be exactly what it is, you see as you near it: an exceptionally large airport whose planes have mostly been pushed aside or hangared, giving way to a handful of pioneer-looking starships, freighters, and military transports from the battle group in orbit.");
		output("\n\nYou’re allowed to break off from the planes once you reach the airfield, guiding your ship in a simple vertical landing as the biplanes make use of the one clear runway left. You park your ship, collect your gear, and punch the boarding ramp down. You’re quickly greeted by a group of armed women, all four-armed, antenna-bearing, and abnormally busty beauties clad in military uniforms. ");
		output("\n\nYour codex beeps: <i>Myrmedions sighted. This ant-like species comes in two varieties, both highly civilized if not technologically advanced. Currently considered ‘tentatively peaceful’ by the Scout Authority.</i>");
		CodexManager.unlockEntry("Myrmedion");

		output("\n\nYou stow the device when a few of the women nervously point their weapons - old fashioned lever-actions - at you. A few tense moments later, though, the pilot that waved at you saunters up with a slight grin, nodding for the guards to lower their weapons.");

		output("\n\n“<i>Welcome to Myrellion, offworlder,</i>” she says, giving you a slight nod. Two of her arms point toward the largest of the hangers as she says, “<i>Please check in with your government’s embassy there. They’ll brief you and get you cleared to go through to the cities.</i>”");

		output("\n\n“<i>Cities?</i>” you ask. “<i>I didn’t see any on the way in.</i>”");

		output("\n\nShe chuckles. “<i>Myr build underground. You’re standing on top of the Gold Myr capital, Gildenmere. The elevator access is just through the embassy - we’ll see you down below.</i>”");

		output("\n\nWith that, she gives a signal to the guards, who follow her away towards another hangar building.");

		output("\n\nWell, this is certainly different.");
		//clearMenu();
		//addButton(0,"Next",mainGameMenu);
		flags["VISITED_MYRELLION"] = 1;
	}
	else
	{
		output("Flying to Myrellion is no quick jaunt down the road, but before you know it, you're guiding your ship back through the atmosphere for a flawless landing on the tarmac.");
	}
}