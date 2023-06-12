public function showMyssah(nude:Boolean = false):void
{
	showName("\nMYSSAH");
	showBust("MYSSAH" + (nude ? "_NUDE":""));
}
//Landing on Dhaal:
public function flyToDhaalypoo():void
{
	clearOutput();
	showName("\nDHAAL");
	author("Savin");
	//Flying to the planet for the first time
	if(flags["DHAAL_LANDINGS"] == undefined)
	{
		output("Following the archived coordinates you received brings you to a region of backwater space so far from any civilization that at first you’re worried there was some sort of glitch. As you draw closer, your sensors begin spitting out reassurances and your main screen beeps with a magnified visual.");
		output("\n\nThe planet is a strange sight. Half of the world is frozen in a jet black ice, seemingly as lifeless as the void, while the other half bakes in the molten heat of its star. The readout explains that Dhaal is tidally locked: the planet’s rotation matches its orbit in such a way that the far side never sees day and the near side never sees night. The only part of the planet on which life can exist at all is a band running from the north pole to the south and back again, perfectly situated between the unforgiving extremes and bathed in an eternal twilight.");
		output("\n\nAt first, it appears as if the planet has a thin, glittering ring orbiting it. This illusion is dispelled by the chatter of hundreds of signals filling your scanners with buzzing babble. There are so many ships in the planet’s thermosphere that they fill the darkness with a halo of twinkling lights. The easily recognizable logos of various MegaCorps are brightly branded across the hulls; galactic civilization impatiently waits for the go-ahead to descend on Dhaal like vultures.");
		processTime(5);
		clearMenu();
		addButton(0,"Next",dhaalLanding2);
	}
	else
	{
		//repeat landing
		output("The ever-expanding planetary landing site is still growing, plumes of industrial smoke swirling around the vibrant neon of the nearby Gyre. Garish colors punch through the perpetual dusk to advertise a dizzying multitude of commercial ventures. A shuttle zips up to your ship, ready to whisk you into the city proper. Good thing, too. You’re happy to spend as little time as possible in the noxious open ground. The Paragon transport quickly pops the hatch, allowing you to climb in and ride down to the Gyre where it’s... well, a little less polluted anyway.");
		processTime(10);
		//In case already done it :3
		CodexManager.unlockEntry("Zaika");
		IncrementFlag("DHAAL_LANDINGS");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

public function dhaalLanding2():void
{
	clearOutput();
	showName("\nDHAAL");
	author("Savin");
	output("When you clear the outer atmosphere and descend through thick, pollution-blacked clouds toward a city-sized tarmac, the mystery of corporate paralysis becomes clear: Dhaal is already civilized! The twilight-draped skyline is dominated by towering highrises and monolithic structures worthy of any presidential palace. Galactic corporations typically use the Planet Rush to settle primitive worlds, so the prospect of one ripe for immediate commerce must have them falling over one another to gobble it up.");
	output("\n\nWhile the massive city that stretches as far north and south as your equipment can read, you are directed towards an open landing site that appears to be a work in progress. Huge industrial machines toil to bulldoze and pave as much of their world as needed, adding more parking for the off-world visitors. Automated shuttles zip from one craft to the next, their flickering signs inviting you to disembark for transportation to some place called the Gyre.");
	processTime(10);
	IncrementFlag("DHAAL_LANDINGS");
	clearMenu();
	addButton(0,"Next",firstTimeOnDhaal);
}

//Disembarking Ship, First Time
public function firstTimeOnDhaal():void
{
	clearOutput();
	author("Savin");
	output("You cycle through the airlock and are immediately assaulted by the reek of industrial smog. it’s far worse than any of the mining or refinery worlds you’ve visited with your father; Steele Tech at the very least tries to keep the atmosphere from burning eyes and noses just stepping onto the tarmac. Seems there’s been no such consideration here. You hail one of the transport shuttles as quick as you can, hoping to spend as little time here in the open as you can.");
	output("\n\nA mere moment after you start flagging, a gunmetal grey hovercraft zips over to you and pops its hatch, allowing you to climb into a bus-like back crammed with fellow Rushers. The woman in the driver’s seat, though, is of a race you’ve never seen before: she’s humanoid, a bit over five feet tall and slender, with dusk-hued purple skin and almond-shaped blue eyes. A messy mane of silver hair falls around her shoulders, breached on either side by a pair of elfin ears. Indeed, you’d easily mistake her for some kind of fantasy-game elf if it wasn’t for the long, serpentine tail running out of a hole in the back of her cargo shorts and flicking around on the floor. The tip’s covered in some kind of thick sock, shielding it from view, but it seems much more bulbous than the rest of the appendage.");
	output("\n\n<i>“First time, huh?”</i> the woman quips, throwing an arm over the back of her seat. <i>“In that case, welcome to sunny, scenic Dhaal! I’m a zaika, and we’re the dominant species. Nearly as advanced as any of you alien types, don’t doubt it for a second. Be happy that Paragon Inc. has your best interest at heart; a lot of my sisters down at street level aren’t as happy as we are that there’s a whole galaxy coming down on our little slice of Dhaal all of a sudden.”</i>");
	output("\n\nYour Codex quite unhelpfully chirps, <i>“Zaika detected! This friendly species is on track for rapid integration into the United Galactic Confederacy, though 4,388 different travel advisories have been issued advising lactating species to explore elsewhere.”</i>");
	CodexManager.unlockEntry("Zaika");

	output("\n\nThat’s... encouraging. By now the other passengers - a motley mix of rugged Rushers from several species - are grumbling about the delay, so your native driver motions for you to sit and strap it. You barely have the time to comply before the shuttle shudders underfoot and starts careening through the air towards the sprawl of the city. Whatever that “Gyre” place is, it seems you’re enroute now!");
	processTime(5);
	clearMenu();
	addButton(0,"Next",firstTimeOnDhaal2);
}

public function firstTimeOnDhaal2():void
{
	clearOutput();
	author("Savin");
	output("A few minutes later, your shuttle makes an abrupt landing that has you straining against your harness. An ausar man sitting a couple places down from you gets thrown forward in punishment for not wearing one at all, planting his face into a handrail. Ouch. <i>“Welcome to the Gyre, dude,”</i> your zaika driver laughs. The shuttle hatch pops open, and you’re once again battered by a suge of smog and industrial reek - but it’s not nearly as bad as up on the tarmac. It doesn’t hurt to breathe, at least, but there’s a distinct and unmistakable haze as you climb out of the shuttle and onto the street.");
	output("\n\nYou stand in the shadows of stratospheric buildings, lit by flickering neon advertisements and pale glows from the windows. The twilight sky is all but invisible unless you stare straight up in the mist of pollutants bearing down on you, drooling thick drops of rain down onto the narrow road you’ve been deposited on.");
	output("\n\nA pretty large gang of other zaika are heading up the road towards you, maybe a dozen of them in various torn-up leather outfits and black coats. Either they’re an all-female race or the males are vanishingly rare, because this particular gang are all various shades of buxom purple alien babe.");
	output("\n\n<i>“Ah, shit, gangers already?”</i> your driver complains, ratcheting a lever next to her seat. <i>“Better make yourselves scarce, aliens, unless you want trouble!”</i>");
	output("\n\nArmor plates fall down over the viewports as the last of the Rushers disembarks, and your fellow passengers quickly scatter down alleys and back streets before the gang overtakes you. You turn to leave as well, but just in time to hear a loud <b>ka-bang!</b> from the back of the hovercar. Black smoke billows out of the grav-plating under it and from the engines, followed by a string of cursing from the driver as the hatch closes back up.");
	output("\n\nThe sound of the armor and hatch engaging seems to drive the group of zaika thugs into a frenzy, and in the blink of an eye almost every member of the gang has produced a pipe, chain, or club from somewhere on her person. They charge at the shuttle with screams of <i>“Traitor!”</i> <i>“Paragon of shit!”</i> <i>“" + (silly ? "Tunnel Snakes rule!":"Alien tail-sucker!") + "”</i> and worse, and you recoil back as several bludgeons slam into the engine block. Sparks fly while other members of the gang start climbing onto the helpless shuttle, pounding on the door or trying to break in the windows.");
	output("\n\nAlmost as soon as they’ve started, you hear a siren wailing somewhere nearby. A few seconds later and a bulky armored truck colored the same silver-and-blue of the shuttle barrels down the road, skids to a stop a few yards off, and disgorges a group of armored zaika women wielding truncheons and shields. All of them have the word “PARAGON” emblazoned over their backs and shoulders. They form up into a shield wall and advance, as a voice booms from speakers on the carrier: <i>“YOU ARE IN VIOLATION OF ZAIBATSU ACCORDS. CEASE DAMAGING PARAGON PROPERTY. DISPERSE NOW.”</i>");
	output("\n\nIt’s a short, brutal melee as the police-looking aliens wade into the crowd, dragging them off the hover-car and batting them around with their clubs. The Paragon troops have so much armor that it’s no contest between them, shrugging off the worst the mob can throw at them until the last members and being dragged down and cuffed.");
	output("\n\nWhile the rabble is being thrown into the back of the armored truck, you hear a bemused laugh beside you. ");
	//Never met Kattom:
	if(flags["MET_KATTOM"] == undefined) output("You turn to see a heavyset kaithrit man standing an arm’s length away, surrounded by several large cases at his feet. <i>“What a warm welcome!”</i> he chuckles. <i>“Lets you know that even the streets here aren’t safe. Kattom Osgood, by the by. Purveyor of self-defense tools... and clearly, business here is going to be quite good! Care to sample the wares before you set off? You’ll want the best of the best if you’re going to be exploring the mean streets of Dhaal!”</i>");
	else output("You turn and see a familiar heavy-set kaithrit standing beside you, surrounded by cases of weapons. Kattom. <i>“Hello again, again!”</i> he says, watching the last of the zaika being tossed into the paddywagon. <i>“I see we’ve arrived in a moment of civil unrest... or perhaps the natives are simply rambunctious! Either way, I think you’ll want the best means of self-defense money can buy before setting out into the mean streets of Dhaal. Care to take a gander are the wares while we wait?”</i>");
	showKattom();
	processTime(10);
	setKattomHere("DHAAL J21");
	clearMenu();
	//[Shop] [Venture Forth]
	addButton(0,"Shop",approachKattom);
	addButton(1,"Venture Forth",mainGameMenu);
}
public function dhaalSpaceportBonus():void
{
	addButton(0,"Taxi",spaceportTaxiStand,undefined,"Taxi","Summon a taxi for a quick trip into the city.");
}
public function spaceportTaxiStand():void
{
	clearOutput();
	showBust("DHAAL_TAXI");
	showName("\nTAXIS");
	author("Fenoxo");
	output("The automated taxi machine sits here, waiting for you to catch a ride into the city. Apparently transport from the spaceport into the Gyre is free. Sweet!");
	dhaalTaxiMenu();
}
public function L21DhaalTaxiStandBonus():void
{
	addButton(0,"Taxi",spaceportTaxiStand,undefined,"Taxi","Approach the taxi vendor for some fast transport.");
}

public function L21DhaalTaxiStand():void
{
	clearOutput();
	showBust("DHAAL_TAXI");
	showName("\nTAXIS");
	author("Fenoxo");
	clearOutput();
	output("<i>“Finest taxis on Dhaal. 50 credits will take you almost anywhere. Where to?”</i> The zaika running the taxi stand taps a cybernetic antenna on her forehead. <i>“Just say the word.”</i>");
	dhaalTaxiMenu();
}
public function dhaalTaxiMenu():void
{
	
	clearMenu();
	if(currentLocation == "DHAAL J3") addDisabledButton(0,"Spaceport","Spaceport","You’re here already.");
	else 
	{
		if(pc.credits >= 50) addButton(0,"Spaceport",surfaceToShipTransitionForSumRaison,undefined,"Spaceport","Catch a ride to the spaceport.\n\n<b>50 credits</b>");
		else addDisabledButton(0,"Spaceport","Spaceport","You lack the necessary fifty credits.");
	}
	if(currentLocation == "DHAAL L21") addDisabledButton(1,"The Gyre","The Gyre","You’re here already.");
	else 
	{
		if(currentLocation == "DHAAL J3") addButton(1,"The Gyre",spaceportToGyreTransport,true,"The Gyre","Catch a ride to the Gyre - <b>for free!</b>");
		else addButton(1,"The Gyre",spaceportToGyreTransport,undefined,"The Gyre","Catch a ride to the Gyre.\n\n<b>50 credits</b>");
	}
	addButton(14,"Back",mainGameMenu);
}

public function spaceportToGyreTransport(free:Boolean = false):void
{
	clearOutput();
	showName("\nSHUTTLE");
	author("Savin");
	processTime(5);
	if(!free) pc.credits -= 50;
	output("A shuttle zips up to your ship" + (!free ? " after a 50 credit payment":"") + ", ready to whisk you into the city proper. Good thing, too. You’re happy to spend as little time as possible in the noxious open ground. The Paragon transport quickly pops the hatch, allowing you to climb in and ride down to the Gyre where it’s... well, a little less polluted anyway.");
	moveTo("DHAAL L21");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Repeat Surface to Ship Transition
public function surfaceToShipTransitionForSumRaison():void
{
	clearOutput();
	author("Savin");
	showName("\nSHUTTLE");
	output("It just takes a wave of your arm to hail a Paragon Inc. shuttle. You climb in and, after transferring 50 credits, strap up as it takes off, hurtling back to where you parked your ship. You spend as little time as possible outside, quickly jumping from the hatch to your ship.");
	pc.credits -= 50;
	processTime(5);
	moveTo(shipLocation);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//The Capsule Hotel
public function capsuleHotelExteriorBonus():void
{
	//Located at the far end of the first zone within the Gyre, near the transport depot and across the street from the milk bar.
	//Add to Room Descript
	output("A narrow building sits wedged between the ground floor of two massive skyscrapers, lit by a neon blue sign advertising “PARAGON CAPSULE RESORT” in flashing letters. Bulletproof glass covered in metal bars make up the actual storefront, but you can see a well-lit if well-worn lobby inside, and the movement of other people. A pair of automated gun turrets on either corner of the building track your movements as you approach, but don’t fire. Better keep your hands off your weapons just in case.");
	output("\n\n<b>It looks safe inside</b>...");
}

//Internal Room Descript
public function capsuleHotelInteriorBonus():Boolean
{
	output("The inside of the capsule hotel is run down but well lit, inviting if it weren’t for the clear signs of age on the walls and cheap furniture - chunks of wallpaper have come out, revealing solid metal underneath, and posters advertising various Paragon Inc. products have been plastered up to cover the worst of the damage. A handful of other Rushers are sitting around in the lobby, resting up before their next expedition into the Gyre, but the most notable individual here is the zaika standing behind the counter - a tall, willowy example of the native race with flowing silver hair and near-black purple flesh that’s zipped up tight in a Paragon-blue leather corset, shoulder-length gloves, and boots that disappear up under a thigh skirt.");
	//Sav-note: you can’t masturbate or wait here.
	//wait/masturb disable?
	addButton(0,"Concierge",capsuleHotelConcierge,undefined,"Concierge","Go and talk to the lady behind the desk.");
	return false;
}

//Concierge
//Go and talk to the lady behind the desk.
public function capsuleHotelConcierge():void
{
	clearOutput();
	showMyssah();
	author("Savin");
	//First time variant
	if(flags["MET_MYSSAH"] == undefined)
	{
		output("By the roughed-up appearance of all the other rushers sprawled out in the lobby, you’re not the only one thankful for the safe haven this place is providing. Considering the sign outside, you take it this place is some kind of a hotel, though the woman zipped up in blue leather behind the desk is a far cry from your average concierge. She’d look more at home in a high-class bondage dungeon somewhere in the core");
		if(metBeth()) output(", or maybe running the show at one of Beth Carver’s brothels");
		output(".");
		output("\n\nStill and all, as you step up to the desk she greets you with a pretty smile and a wiggle of her elfin ears. <i>“Greetings new customer! Welcome to the Paragon Capsule Resort - the paragon of comfort for any budget!”</i>");
		output("\n\nShe recites the canned line cheerily, tapping a button on her desk so that a menu of available rooms and services appears behind her. <i>“I am Myssah, the manager of this establishment. Whenever you’re ready to rest and relax here at the resort, please don’t hesitate to let me know.”</i>");
		flags["MET_MYSSAH"] = 1;
		processTime(4);
	}
	//Repeat Variant
	else
	{
		output("Myssah gives you that pretty smile of hers as you approach the dest, ears wiggling up and down. <i>“Welcome back, honored guest. Will you be staying with us today?”</i>");
		output("\n\nShe taps a button under her desk, and the resort’s menu appears holographically behind her. <i>“Our capsules are economically priced,”</i> she says, leaning forward over the desk in a way that makes all the leather she’s wearing creak, <i>“but perhaps I could interest you in a full service experience?”</i>");
		processTime(1);		
	}
	output("\n\n<u>Services:</u>");
	output("\n\t100 creds: “capsule - 1 night.”");
	output("\n\t500 creds: “deluxe capsule - 1 night.”");
	output("\n\t5,000 creds: “full service experience”");
	capsuleHotelMenu();
}
public function capsuleHotelMenu():void
{
	clearMenu();
	//[Capsule] [Room Service] [Full Service] [Leave]
	addButton(0,"Capsule",rentACapsule,undefined,"Capsule","You’d like to rent a capsule for the night.\n\nCosts 100 Credits.");
	addButton(1,"Room Service",roomServiceCapsule,undefined,"Room Service","Rent a capsule for the night. This option also includes a hot meal before and after, and access to a private shower.\n\nCosts 500 credits.");
	addButton(2,"Full Service",fullServiceCapsuleHotel,undefined,"Full Service","This option displays a caricature of two zaikas sharing a bath. Vaguely described as a “full service experience” including a night in the hotel’s largest pod, a private jacuzzi bath, and personally catered meals.\n\nCosts 5,000 credits.");
	addButton(14,"Leave",leaveDatCapsuleHotel,undefined,"Leave","You’re not interested in staying at present.");
}

//[Leave]
//You’re not interested in staying at present.
public function leaveDatCapsuleHotel():void
{
	clearOutput();
	showMyssah();
	author("Savin");
	output("You tell Myssah that you aren’t interested in a room at the moment, which earns you an exaggerated sigh. <i>“Very well. Please understand that the lobby is for <b>paying</b> customers only. I’ll have to ask you to leave if you aren’t staying with us tonight.”</i>");
	output("\n\nGreat. Back out into the dangerous streets, then.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].northExit);
}

//[Capsule]
//You’d like to rent a capsule for the night. Costs {X} Credits.
//Player sleeps for 8 hours. Gets a shower, too.
public function rentACapsule():void
{
	clearOutput();
	showMyssah();
	author("Savin");
	pc.credits -= 100;
	output("You point to a slowly-scrolling option on the holo-menu labelled “capsule - 1 night.” That sounds about your speed.");
	output("\n\n<i>“Very well,”</i> Myssah answers, crisp and professional. She turns an old-fashioned touch-screen display around to face you, showing an agreement and cost that you quickly scan over before swiping your Codex over a recently-added scanner bolted onto the side. The transaction completes, and Myssah smiles and hands you a plastic keycard from under the desk.");
	var capsule:Number = rand(200)+1;
	output("\n\n<i>“You’ll be staying in capsule " + num2Text(capsule) + ",”</i> she says, pointing towards a door behind her and to the left. <i>“There’s a cubby for your belongings accessible by your key, as well as a public shower, in the room beyond.”</i>");
	output("\n\nYou head on back, using your keycard to unlock the door and head through into a dark chamber. When your eyes adjust to it, you see a vast, sprawling narrow row of three-foot hatches in the wall stacked twenty feet high. You quickly walk through the stacks towards the clearly-marked shower room. There’s another door inside the showers marked private, but your card only gets you access to the main, open showers - luckily for you it’s empty at the moment, and you’re able to get cleaned up fairly quick before trying to find your sleeping arrangements.");
	output("\n\nYou end up climbing up to one of the hatches, using the handles on other units to heft yourself up to your own. It opens with a swipe of your keycard, and with some effort, you’re able to swing yourself into the hatch and squeeze inside. The capsule is barely big enough for you to fit inside it, with just enough room to lay down and nestle your head into the cheap pillow.");
	output("\n\nIt’s hardly the most comfortable sleep you’ve ever had - there’s no room to stretch out, and barely enough clearance just to roll over, like the hotel picked a capsule the perfect size to sardine-ify you - but you are able to sleep eventually. It’s blessedly quiet and the air is cleaner than outside by far, plus with the cannons outside, you don’t need to worry about the street gangs barging in. It’s a momentary illusion of safety and security, if not necessarily comfort, here on Dhaal, and you’re happy to take what little is offered.");
	processTime(20);
	pc.shower();
	clearMenu();
	addButton(0,"Next",rentACapsule2);
}

public function rentACapsule2():void
{
	clearOutput();
	showMyssah();
	author("Savin");
	output("You wake to faint but insistent beeping coming from inside your capsule. Slowly, you open your eyes, only to find that one of the walls is projecting holographic text over itself: “YOUR ALLOTTED SLEEPING HOURS ARE NOW OVER. PLEASE COLLECT YOUR BELONGINGS.”");
	output("\n\nLame. With a big yawn, you wiggle out of the capsule and slide down to the ground level. Your gear’s locked away right where you left it, and so you kit up, clean up, and get ready to head back out onto the mean streets once more...");
	processTime(8*60);
	sleepHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Room Service]
//Rent a capsule for the night. This option also includes a hot meal before and after, and access to a private shower. Costs {X} credits.
//Sleep, shower, and a meal. Grants slight +thickness and the Well Fed status.
public function roomServiceCapsule():void
{
	clearOutput();
	showMyssah();
	author("Savin");
	pc.credits -= 500;
	var capsule:Number = rand(100)+201;
	output("You point to a slowly-scrolling option on the holo-menu labelled “deluxe capsule - 1 night.” That sounds about your speed.");
	output("\n\n<i>“Very well,”</i> Myssah answers, crisp and professional. She turns an old-fashioned touch-screen display around to face you, showing an agreement and cost that you quickly scan over before swiping your Codex over a recently-added scanner bolted onto the side. The transaction completes, and Myssah smiles and hands you a plastic keycard from under the desk.");
	output("\n\n<i>“You’ll be staying in capsule " + num2Text(capsule) + ",”</i> she says, pointing towards a door behind her and to the left. <i>“There’s a cubby for your belongings accessible by your key, as well as both the public and a private shower, in the room beyond.”</i>");
	output("\n\nYou head on back, using your keycard to unlock the door and head through into a dark chamber. When your eyes adjust to it, you see a vast, sprawling narrow row of three-foot hatches in the wall stacked twenty feet high. You quickly walk through the stacks towards the clearly-marked shower room. There’s another door inside the showers marked private, which you’re able to access with your card. Inside is a row of a dozen individual shower stalls, each with opaque glass walls. You find one sitting open and slip inside.");
	output("\n\nThe water is nice and hot, and just a little bit salty from some kind of purification system. You help yourself to some complimentary cleaning products and enjoy this fleeting bit of luxury on this otherwise hostile, grimy world. You come away feeling surprisingly clean, and when you head back out to the vast rows of capsule “rooms,” you find yours has a small drone hovering next to it with a steaming tray balanced on its head.");
	output("\n\nYou end up climbing up to one of the hatches, using the handles on other units to heft yourself up to your own. It opens with a swipe of your keycard, and with some effort, you’re able to swing yourself into the hatch and squeeze inside. The drone helpfully deposits your meal tray inside and scurries off to the next big-spender on the block.");
	output("\n\nThe capsule is barely big enough for you to fit inside it, with just enough room to sit up and use the pillow as a back rest. You open up the plastic seal over your tray and dig into the... whatever it is: some sort of browned meat-thing and pale white vegetables that are still steaming, and covered in a thick red powder. A native chili maybe? The meal is fairly tasty, if not particularly extravagant, and you quickly finish up and snuffle into the sleeve-like bed for the night.");
	output("\n\nIt’s hardly the most comfortable sleep you’ve ever had - there’s no room to stretch out, and barely enough clearance just to roll over, like the hotel picked a capsule the perfect size to sardine-ify you - but you are able to sleep eventually. It’s blessedly quiet and the air is cleaner than outside by far, plus with the cannons outside, you don’t need to worry about the street gangs barging in. It’s a momentary illusion of safety and security, if not necessarily comfort, here on Dhaal, and you’re happy to take what little is offered.");
	output("\n\nWhen the morning comes, you’re treated to a breakfast just like dinner, though with a tall glass of some smokey-smelling beverage. You pack it all down and slide out of your sleeping sleeve. Your gear’s locked away right where you left it, and so you kit up, clean up, and get ready to head back out onto the mean streets once more...");
	processTime(8*60);
	pc.shower();
	//well fed
	if(pc.hasStatusEffect("Home Cooking"))
	{
		if(pc.statusEffectv1("Home Cooking") < 50) pc.setStatusValue("Home Cooking", 1, 50);
		pc.setStatusMinutes("Home Cooking", 3000);
	}
	else pc.createStatusEffect("Home Cooking", 50, 0, 0, 0, false, "Icon_Cooking", "While you are well fed, you recover more while resting.", false, 3000);
	sleepHeal();
	output(pc.modThickness(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Full Service
//This option displays a caricature of two zaikas sharing a bath. Vaguely described as a “full service experience” including a night in the hotel’s largest pod, a private jacuzzi bath, and personally catered meals.
public function fullServiceCapsuleHotel():void
{
	clearOutput();
	showMyssah();
	author("Savin");
	pc.credits -= 5000;
	//Shower, well-fed, sleep.
	output("<i>“A full service sounds nice,”</i> you tell her. <i>“Book me for that.”</i>");

	output("\n\n<i>“Excellent choice,”</i> Myssah purrs, smiling. Her tail swishes behind her, wrapped up in a leather sleeve the same color as her corset. She turns an old-fashioned touch-screen display around to face you, showing an agreement and cost that you quickly scan over before swiping your Codex over a recently-added scanner bolted onto the side. The transaction completes, and Myssah smiles and hands you a plastic keycard from under the desk.");
	output("\n\n<i>“You’ll be staying in capsule 301,”</i> she says, pointing towards a door behind her and to the right. <i>“Just take the elevator up. I’m sorry the view isn’t particularly romantic, but please enjoy all the other comforts Paragon provides for its favorite customers.”</i>");
	if(flags["CAPSULE_FULLSERVE"] == undefined) output("\n\nThat sounds promising.");
	else output("You tell her you’re looking forward to another night of her intimate service.");
	output(" She gives you a formal bow, still smiling, and you head on towards the elevator to her right. It opens with your keycard, admitting you into a cramped but well-adorned little capsule that shoots upwards the moment its doors close.");
	output("\n\nWhen the doors open next, you’re deposited into a small, sleek loft: a square gunmetal-grey table dominates the center of the room, and against the far wall is a capsule pod that’s had the side cut out of it, turning it into a wall-mounted bed - and a pretty comfy-looking one, too, if on the small side. A door leads out of the central loft and you can hear water running inside. You chuck your gear into the tiny closet and head over to enjoy a much-needed bath.");
	output("\n\nThe door slides open as you approach, revealing a deep square tub already filled with steaming hot, clear water. There’s a faint chemical smell from all the purification the water has no-doubt had to go through, but it’s mostly masked by floral oils floating on the surface. It’s not the most luxurious thing you’ve ever encountered, but compared to the brutal grime and smog of the outside world, it’s a much-needed relief. You strip down, hanging your kit up on the provided pins in the wall and lowering yourself into the comfort of the baths.");
	output("\n\nThe moment you’re in, you feel the tension and start bleeding out of you. Your mouth slips open alongside a soft, satiated moan, and you sink deep into the warm embrace of the bath. Oh, that’s good... worth every credit.");
	output("\n\nJust as you’re starting to close your eyes and lose yourself to the sultry, steamy heat, the doors slide open again.");
	processTime(30);
	pc.shower();
	clearMenu();
	addButton(0,"Next",fullServiceCapsuleHotel2);
}

public function fullServiceCapsuleHotel2():void
{
	clearOutput();
	showMyssah(true);
	author("Savin");
	//First time:
	if(flags["CAPSULE_FULLSERVE"] == undefined)
	{
		output("Your eyes snap open as the concierge, Myssah, slips inside with a coy little smirk. She’s still wearing her blue gloves up nearly to her shoulders and the heeled leather boots that reach to a few inches below her crotch, but her actual corset and skirts have fallen by the wayside on her way up, giving you a prime view of bare purple flesh - including a pair of smooth, teatless D-cup breasts and a puffy black pussy between her legs. Her tail’s wrapped in a satin sock now, but you can see the tip is much larger than before, like it’s stiffening with erection.");
	}
	//Repeat:
	else
	{
		output("Your eyes snap open as Myssah enters with a coy little smirk. Her corset and skirts have fallen by the wayside on her way up, giving you a prime view of all that bare purple flesh, tits and pussy framed by leather gloves and tall boots. Her tail’s wrapped in a satin sock now, but you can see the tip is sporting a rock-hard erection.");
	}
	output("\n\n<i>“I’m here to serve,”</i> she purrs, long legs carrying her to the edge of the bath. She slowly lowers a leather-wrapped foot into the steaming bath; the garment is so tight against her purple skin that it compresses, repelling the water as she sinks in across from you. Her tail, long and serpentine, trails in after her and ends up floating on the top of the water, slowly snaking towards you.");
	output("\n\nIf she wants to serve you, then the first thing she can do is scrub the grit and grime of her polluted world from your body. You turn around and lean against the edge of the tub, presenting your back to the zaika beauty. A container clicks open behind you, and then you feel cool, clean soap spilling over your [pc.skinFurScales]. Myssah’s fingers rub it in, firm but gentle, up and down your back to your shoulders and arms.");
	output("\n\nThe stress and tension of the Planet Rush seems to bleed away, and soon your eyes close and your [pc.knees] side down the edge of the tub. Myssah’s fingers are dexterous and her ministrations are surprisingly tender for a paid service. Like she really cares... or maybe she’s a damn good actress? You try not to dwell on the question; better to enjoy her slowly working over your bare, wet body while you have the chance. Eventually, Myssah makes it to your [pc.hair], then starts rubbing your shoulders, gentle at first, then harder. Her near-naked body draws closer in the water, until you feel the weight of her breasts against your shoulderblades, working in congress with her hands to rid you of your tensions.");
	output("\n\nAn involuntary moan escapes your lips... and an unmistakable heat starts spreading through your nethers. You hear a little laugh from Myssah, and her delicate fingers wrap around your [pc.chest]. She slowly, sensually suds you up and works her hands over you, down your [pc.belly] and onto your legs. Even your [pc.footOrFeet] get" + (pc.legCount == 1 ? "s":"") + " the same massaging treatment from her! She tenderly cares for every inch of your body until you’re sure that you’re as fresh and smooth as the day your mother birthed you. Satisfied with her work, Myssah leans back on her knees and trails her fingers down your back, squeezing your [pc.butt] before separating from you entirely.");
	output("\n\n<i>“Dinner should be arriving now, [pc.master],”</i> she purrs, rising to her feet. Water cascades off of her slender, elfin body, leaving it glistening in the synthetic light. <i>“Shall we?”</i>");
	processTime(30);
	clearMenu();
	addButton(0,"Next",fullServiceCapsuleHotel3);
}

public function fullServiceCapsuleHotel3():void
{
	clearOutput();
	showMyssah(true);
	author("Savin");
	output("A meal for two has been laid out on the table while you and Myssah were bathing, and the lights have been dimmed to emphasize a pair of scented candles towering over your plates and adding to the steam and smoke wafting up from the freshly-cooked food.");
	output("\n\n<i>“Spiced and smoked meat, seven vegetable mix, and rich savory sauce,”</i> she tells you, declining to name the specific items. <i>“Our house specialty.”</i>");
	output("\n\nIt certainly <b>smells</b> delicious, but the proof’s in the pudding. Myssah gracefully assumes her place once she’s seated you, still gloriously nude save for her long gloves and leather stockings. It’s entirely distracting, watching those bare, smooth breasts of hers rise and fall across the table, and you barely register the meal as it passes. It is tasty, though, clearly freshly cooked - a surprising luxury piled on top of luxury here. Worth every credit? Well, you’ll have to wait until you’re done sleeping to decide. But it’s a damn good first impression...");
	output("\n\nAnd it turns out dessert is sitting right in front of you. Just as you’re starting to bask in the fullness settling in your [pc.belly], Myssah rises with a smile and sashays around to wrap her arms around your shoulders, pressed the back of your head into her deep cleavage. <i>“Shall I tuck you in now, [pc.master]?”</i>");

	//First time:
	if(flags["CAPSULE_FULLSERVE"] == undefined)
	{
		output("\n\nWith your head in her breasts and an offer like that on her pouty lips, you wonder how far this will go.");
		output("\n\n<i>“You asked for the full service experience,”</i> Myssah smiles, leading you towards the bed. <i>“It’s my duty to make sure you go to sleep as relaxed and comfortable as you can.”</i>");
		output("\n\nYou’ve got no doubt this is going to be some top-tier service indeed.");
	}
	else
	{
		output("\n\nA chance to spend another night nestled between Myssah’s thick thighs and experiencing the tender ministrations of her tail is exactly what you were hoping for. You take her hand with a smile and let the sexy zaika lead you over to the bed.");
	}
	output("\n\nA moment later and you’re on your back, watching as Myssah climbs into the pod over you, straddling your [pc.hips]. Her long silver hair spills down her shoulders, and those big, barren breasts jiggle as she settles into position. Her plump ass presses into your [pc.thighs], and her delicate leather-clad fingers slide up your [pc.legOrLegs].");
	if(pc.hasCock()) output(" Your [pc.cocks] rise" + (pc.cockTotal() == 1 ? "s":"") + " to attention in the blink of an eye, and sure enough, her smooth leather glove quickly wraps around " + (pc.hasCocks() ? "one":"it") + ", stroking slowly. Oh, that’s nice.");
	else 
	{
		output(" You feel heat bloom in your " + (pc.hasVagina() ? "[pc.vaginas]":"[pc.asshole]") + " when her fingers slip between your thighs. Two of them brush ");
		if(pc.hasVagina()) output((pc.hasVaginas() ? "one set of ":"your ") + "pussylips");
		else output("your anal rim");
		output(", sending shivers of pleasure up through your loins.");
	}
	output(" Her long, thick tail presses down on your chest, keeping you firmly planted on the bed while she works.");
	output("\n\n<i>“Just lay back and relax. I’ll be here all night for you, [pc.master],”</i> she purrs happily.");
	output("\n\nAll night, huh? You can get behind that...");

	processTime(10);
	pc.changeLust(10);
	clearMenu();
	//[Tail Milking] [Tail Fuck]
	if(pc.hasCock()) addButton(0,"Tail Milking",penisRouter,[tailMilkingWithMyssah,500,false,0],"Tail Milking","Myssah’s going to wrap your cock inside her tail-pussy and milk you all night long...");
	else addDisabledButton(0,"Tail Milking","Tail Milking","You need a penis for this.");
	addButton(1,"Tail Fuck",vaginaRouter,[tailFuckWithMyssah,500,1,0,true],"Tail Fuck","Myssah’s going to bury her thick tail-tip inside you all night long...");
}

//Tail Milking
//Myssah’s going to wrap your cock inside her tail-pussy and milk you all night long...
public function tailMilkingWithMyssah(x:int):void
{
	clearOutput();
	showMyssah(true);
	author("Savin");
	output("Or at least, you can get behind the beautiful alien who’s tending to you. She flashes a little smile over a shoulder and shifts herself forward, so that your [pc.cock " + x + "] is nestled between those smooth, dark asscheeks of hers. They clap together around your rock-hard member, and Myssah gives you a chorus of soft little moans as she starts to rock her hips, dragging your [pc.cock " + x + "] against the lips of her quim. Moisture runs down your length, quickening the zaika’s short little bounces.");
	output("\n\nRather than easing herself onto your dick, though, Myssah eventually leans forward and grabs your [pc.knees]. Her tail slowly drags itself down your chest and lifts up, its bulbous head dangling over you before splitting open to reveal a musky pink fuckhole. The four petals of her tail are bridged with feminine slime, peeling apart and flicking it down onto your loins. Then she flicks her tail and your [pc.cock " + x + "] disappears into its feet-deep fuckchannel, swallowed to the hilt. Her juicy petals spread across your belly and thighs, firmly affixing themselves to you while her inner muscles start to ripple and writhe.");
	output("\n\nMyssah moans, arching her back and dragging her nails over your [pc.skinFurScales]. She draws in a long, unsteady breath, biting her lip as she hisses it back out.");
	if(flags["CAPSULE_FULLSERVE"] == undefined) 
	{
		output(" <i>“Alien dick,”</i> she sighs. <i>“It... it’s good. We zaika use our tails, one into another... but this is nice. Strangely intimate.”</i>");
		output("\n\nAre you... are you the first dick-wielding alien to buy her full service? What an honor.");
	}
	else
	{
		output(" <i>“Ahhh, I am happy to serve you again, [pc.master],”</i> Myssah moans. <i>“Alien dick is... very nice.”</i>");
		output("\n\nJust <b>any</b> alien dick?");
		output("\n\nShe smiles over her shoulder and wiggles her hips. <i>“Not <b>every</b> one...”</i>");
		output("\n\nYou grin and lean forward, giving that plump rump an encouraging smack. That’s what you like to hear.");
	}
	output("\n\nMyssah giggles and sways her hips, putting on a show while her tail massages every inch of your dick-meat. She’s taking it nice and slow, though, in no hurry to bring you to climax. She’s got all night, after all. So you lean back in the bed, folding your hands under your head, and relax. Myssah’s muscles work up and down, [pc.knot " + x + "] to [pc.cockHead " + x + "], over and over. It’s almost hypnotic, watching her ass shake and wiggle, and feeling the rhythmic contortions of her tail’s inner channel.");
	output("\n\nYou’ve almost passed out before the first climax finally washes over you. It’s a gentle orgasm, one that leaves you gasping and twitching beneath Myssah’s thigh thighs, arching your back an inch or so off the bottom of the pod before flopping back with a heavy, contented sigh. Myssah giggles as your slimey seed squirts straight into her tail-pussy, painting her inner walls with [pc.cum].");
	output("\n\nNot for the last time tonight.");
	output("\n\nShe just smiles and continues moving, using that wonderful fuckhole to keep you from ever going soft, even as fatigue takes hold, and you slowly drift off into a sleep punctuated by non-stop wet dreams...");

	processTime(30);
	pc.orgasm();
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	pp.createVagina();
	pp.loadInCunt(pc,x);
	clearMenu();
	addButton(0,"Next",tailFuckWithMyssah2);
}

//Tail Fuck
//Myssah’s going to bury her thick tail-tip inside you all night long...
public function tailFuckWithMyssah(x:int):void
{
	clearOutput();
	showMyssah(true);
	author("Savin");
	output("Or at least, you can get behind the beautiful alien who’s tending to you. She flashes a little smile over a shoulder and shifts herself forward so that the bulk of her tail can wriggle and squirm its way down between your " + (pc.legCount > 1 ? "[pc.legs]":"[pc.thighs]") + ". The thick bulb of her tail’s tip stays firmly closed, despite the beading moisture starting to appear from its four slender lips, and it starts to trace its way down your thigh towards your [pc.vagOrAss " + x + "].");
	output("\n\n<i>“Just take a deep breath,”</i> Myssah urges you, as her tail-tip comes flush against your fuckhole. <i>“You’re going to be very full for a very long time.”</i>");
	output("\n\nOh boy. You do as she advises, relaxing your body with long, deep breathes. You settle into the bed, gently raising your ass so that her tail will have a straight shot inside you, and she’s quick to take advantage of what you’re offering. You feel her silky-smooth skin pressing against you, firm and unyielding, slowly but surely stretching you open. All you can do is moan as she penetrates you, wedging that fat crown in inch by inch. Your [pc.vagOrAss " + x + "] buzzes with pleasure while she grinds herself against your inner walls. It’s agonizingly <b>slow</b> going, so much that you end up shaking your hips and thrusting back against the massive intruder, trying desperately to get more of her inside yourself, but Myssah quickly plants her hands on your hips and pushes you down against the bed.");
	if(x < 0) pc.buttChange(500);
	else if(x >= 0) pc.cuntChange(x,500);
	output("\n\n<i>“Relax. Enjoy yourself,”</i> she insists. I’ll take care of you all night, after all. We have to go slow.”</i>");
	output("\n\nYou just whimper and dig your hands into the bedsheets, surrendering to the sensation of overwhelming fullness. Her tail’s so thick, so <b>solid</b> inside you, as good as any dick and twice as flexible. When the mace-like head’s wiggled its way as deep as it can go into your [pc.vagOrAss " + x + "], the long, narrow stem starts to slowly undulate, grinding itself against your " + (x < 0 ? "rim":"lips") + " and inner walls. Her tail’s so big that it can’t help but find all your most sensitive places, and it takes barely any time at all before you feel that intense well of pressure, that tell-tale building orgasm, rising from your loins.");
	output("\n\nHearing your breath quicken, Myssah smiles softly over her shoulder and gently rubs your thighs. <i>“Don’t hold back. You’ll cum many times tonight, after all.”</i>");
	output("\n\nHer soothing voice is all it takes to finish you off. You arch your back and clench your " + (x >= 0 ? "pussy-":"anal ") + "muscles, squirming as she milks the first of many orgasms from you. You flop back a moment later, and it feels like all the stress has drained straight out of you... and a wave of fatigue follows shortly after, leaving your head swimming and eyes lidded.");
	output("\n\nShe just smiles and continues moving, using that wonderful tail to keep exploring your depths even as fatigue takes hold, and you slowly drift off into a sleep punctuated by non-stop wet dreams...");
	
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",tailFuckWithMyssah2);
}
public function tailFuckWithMyssah2():void
{
	clearOutput();
	showMyssah(true);
	author("Savin");
	output("You wake with a smile several hours later. There’s a warm impression in the bed beside you, and several cum-soaked towels are stacked in a bin nearby. You must have just missed -");
	output("\n\nThe bath door slides open, and a very naked Myssah strides out with another towel wrapped around her ashen hair. She gives you a pleasant smile as she adds it to the collection. <i>“Good morning, [pc.master]. I’m afraid our time’s nearly out. Shall I dress you?”</i>");
	output("\n\nYou nod and slowly pull yourself out of bed, helping Myssah collect your discarded equipment. A few minutes, and not-unwelcome groping, later and you’re stepping out of the elevator into the lobby. Myssah sashays over to the counter, disengages a small drone that’s been puttering behind the terminal, and resumes her post with the utmost professionalism.");
	output("\n\nBack to work for both of you.");
	processTime(8*60);
	IncrementFlag("CAPSULE_FULLSERVE");
	sleepHeal();
	pc.changeLust(-10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}