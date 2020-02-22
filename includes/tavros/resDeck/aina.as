
//Available Flags

//HELPED_AINA:					If the PC helped Aina during their first encounter
//AINA_WAND_FIXED:				If the PC helped her by fixing her sex toy (true, false or undefined)
//AINA_SEXED:					If the PC helped her by sexing her up, but also keeps counting further encounters (int, 0+)
//AINA_DAY_MET:					The day Aina was first met, used to calculate her heat status (int, 1+)
//AINA_LAST_DAY_MET:			The last day Aina was met, needed for some responses in conjunction with heat (int, 1+)
//AINA_LAST_DAY_RELIEVED:		The exact day Aina was last sexed (also counts the time her toy was fixed)
//AINA_LAST_HOUR_RELIEVED:		The exact hour Aina was last sexed (also counts the time her toy was fixed)
//AINA_TALKED_ABOUT_HERSELF:	If the player asked Aina about herself in the past (true or undefined)
//AINA_TALKED_ABOUT_TOYS:		If the player asked Aina about her sextoys (true or undefined)
//AINA_SEXED_WITH_TOY:			If the player did her Anal&Wand scene in the past (int, 0+ or undefined)
//AINA_SHOWER_USED:				If the player used the shower in Aina's apartment (true or undefined)


//Heat mechanics: 

//Aina is in heat for 7 days, followed by 14 days she is not in heat. Starting from the day the player talks to her.
//To calculate if she is in heat the flag AINA_DAY_MET is used in conjunction with the current day.
//Rather simple implementation, ignoring minutes, but since she is a minor NPC,
//hooking into the time system itself seems unneeded as there are no plans to immediately act on a status change.

public function showAina(nude:Boolean = false):void
{
	//added logic to show preg bust in old scenes
	if (flags["AINA_PREG_EMAIL1"] == 1) showPregAina(nude,true);
	else
	{
		if(!flags["MET_AINA"]) showName("CENTAUR\nGIRL");
		else showName("\nAINA");
		if(!nude) showBust("AINA");
		else showBust("AINA_NUDE");	
	}
	author("JimThermic");
}

//check if Aina is outside her apartment in the West Walkway of the residental deck (room #15)
//render button only if Aina wasn't met before
public function checkIfAinaIsAround():Boolean 
{
	if(flags["HELPED_AINA"] == undefined) 
	{
		approachAinaOnTheWalkway();
		return true;
	}
	return false;
}

//this function displays AinasRoom on the map
public function unlockAinasRoom(genMap:Boolean = false):void {
	//define Room
	rooms["RESIDENTIAL DECK 18"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK 18"].roomName = "AINA’S\nAPARTMENT";
	rooms["RESIDENTIAL DECK 18"].description = "Aina’s apartment is incredibly spacious with large open spaces and doorways. What does fill it is tastefully chosen, from the expressive pot-plants and paintings to the cushy centaur-friendly couches that lie about. There’s also seating for visitors of the two-legged variety, particularly around a friendly looking coffee table.";
	rooms["RESIDENTIAL DECK 18"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK 18"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK 18"].northExit = "RESIDENTIAL DECK 15";
	rooms["RESIDENTIAL DECK 18"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK 18"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK 18"].addFlag(GLOBAL.PRIVATE);
	//if aina is in the nursery dont add npc flag
	if (!ainaAtNursery()) rooms["RESIDENTIAL DECK 18"].addFlag(GLOBAL.NPC);
	rooms["RESIDENTIAL DECK 18"].runOnEnter = ainaApartmentMeet
		
	//add door towards Aina's apartment
	rooms["RESIDENTIAL DECK 15"].southExit = "RESIDENTIAL DECK 18";
	
	//refresh map bit to actually show new room
	if(genMap) generateMapForLocation(currentLocation);
}

//this function hides her room on the map
public function lockAinasRoom(genMap:Boolean = false):void {
	//remove door towards Aina's apartment
	rooms["RESIDENTIAL DECK 15"].southExit = null;
	
	//unset room - not the prettiest way to do it, but there is no function to remove rooms (?)
	rooms["RESIDENTIAL DECK 18"] = new RoomClass(this);
	
	if(genMap) generateMapForLocation(currentLocation);
}

//approach Aina in the West Walkway of the residental deck(#15)
public function approachAinaOnTheWalkway():void
{
	showAina();
	
	//set basic flags
	flags["AINA_DAY_MET"] = days;
	flags["AINA_LAST_DAY_MET"] = days;
	flags["AINA_SEXED"] = 0;
	flags["AINA_WAND_FIXED"] = false;
	
	//begin text output
	output("\n\nStanding in the hall is a chestnut-colored centauress, wearing a worried look on her face. As soon as she spots you, her tawny eyes light up and she canters over, her hooves clip-clopping against the hard thoroughfare surface.");
	output("\n\n<i>“H-hi! Sorry, I’m kind of approaching you out of nowhere, even though you’re a stranger... but, uh, I’ve got a problem only a stranger can fix. Can you help me out?”</i> she asks, clasping her pale hands against her chest.");
	output("\n\nShe’s definitely not a Leithan; modded, perhaps? Her human half is covered in a champagne-colored sweater and a cream linen skirt, the hem falling down to her horse-like knees. It utterly fails to cover up her tauric body, though, or her bristly horse tail. Her honey-blonde hair is tied back in a far less literal ponytail, secured with a lace ribbon.");

	if(pc.isBimbo()) output("\n\n<i>“Oh, sure! What’s the favor?”</i> you ask, eyes glimmering. Will it involve sex, you wonder? You really hope it involves sex! All your favorite things do.");
	else if(pc.isBro()) output("\n\n<i>“Eh, sure. I’ll hear you out babe,”</i> you huff, crossing your arms. She looks like a fine ride, and you’re always keen to listen to a fair piece of filly.");
	else {
		output("\n\n<i>“...What’s the favor?”</i> you");
		
		if(pc.isNice()) output(" warmly ask.");
		else if(pc.isMischievous()) output(" ask, quirking a brow.");
		else output(" you bluntly ask.");
	}
	
	output("\n\n<i>“Uumm, it’s kind of hard to explain,”</i> the ponytailed centauress replies. She quickly looks around. <i>“Particularly here in the open where my neighbours are listening. Can we go inside?”</i>");
	
	output("\n\nNow that you’re standing close to her, you swear you can smell a potent, feminine musk. With each flick of her tail, it becomes that much more intense. It hotly surges through your veins and down into your loins, making your");

	if(!pc.hasCock() && !pc.hasVagina()) output(" hips shiver.");
	else if(pc.hasCock() && !pc.hasVagina()) output(" [pc.cocks] pointedly stiffen.");
	else if(!pc.hasCock() && pc.hasVagina()) output(" [pc.pussies] ache.");
	else output(" [pc.cocks] pointedly stiffen and your [pc.pussies] ache.");
	
	output("\n\nWhat do you do?");
	
	processTime(2);
	pc.changeLust(10);
	
	clearMenu();
	addButton(0, "Help Her", helpAina);
	addButton(1, "Don’tHelp",dontHelpAina);
}

//PC decided to not help Aina. Her room is not unlocked and PC never sees her again.
public function dontHelpAina():void
{
	clearOutput();
	showAina();
	
	flags["HELPED_AINA"] = false;
	rooms["RESIDENTIAL DECK 15"].removeFlag(GLOBAL.NPC);
	
	output("The chestnut-colored centauress squirms on the spot. <i>“O-oh-okay. Thank you anyway!”</i>");
	output("\n\nShe gallops off, probably to look for someone else to help her with her plight.");
	
	processTime(1);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//PC decides to help Aina
public function helpAina():void
{
	//remove Aina's icon from walkway, unlock her room and port player there
	rooms["RESIDENTIAL DECK 15"].removeFlag(GLOBAL.NPC);
	currentLocation = "RESIDENTIAL DECK 18";
	unlockAinasRoom(true);
	
	clearOutput();
	flags["MET_AINA"] = true;
	showAina();
	
	output("The chestnut-covered centauress claps her hands together. There’s a bright, relieved smile on her face, and her equine ears flicker. <i>“Thank you! I’m sorry to just ask you out of nowhere, but I’m really in a bind here,”</i> she answers.");
	output("\n\n<i>“Oh - I’m Aina, by the way! Sorry, I forgot to introduce myself.”</i>");
	output("\n\n<i>“[pc.name],”</i> you");
	
	if(pc.isBimbo()) output(" giggle");
	else if(pc.isTreated()) output(" grunt");
	else output(" reply");
	
	output(" following her inside her apartment. Once inside the two big barn-like doors, you’re surprised at how classy and spacious it is. It’s full of tastefully selected pot plants and paintings, not to mention centaur-friendly couches.");
	
	if(pc.isTaur()) output(" As a taur yourself, you always appreciate tailored furniture.");
	
	output(" She gallops over to a coffee table and gestures to it. Her cheeks are visibly flushed.");
	output("\n\n<i>“...Um, I dropped something under here. Well, more to the point, it fell and rolled under. I can’t reach it, it’s too low...”</i> Aina explains, squirming on the spot. Whatever it is, it seems important.");
	
	if(pc.isTaur())
	{
		output("\n\n<i>“");
		if(pc.isBimbo()) output("Oh wow, sounds like quite a pickle!");
		else if(pc.isTreated()) output("Humph! So you ask the big, tough " + pc.mf("guy", "girl") + " to handle it?");
		else if(pc.isNice()) output("I’m sorry, I don’t think I can either.");
		else if(pc.isMischievous()) output("We’re two peas in a pod, hon.");
		else output("So you ask another taur? Smart.");
		
		output(" I’m kind of in the same predicament you are...”</i> You look around and spot a broom cupboard. <i>“...Got any long objects in there? We might be able to use one to fish it out.”</i>");
		output("\n\n<i>“Oh, of course!”</i> Aina facepalms, looking genuinely embarrassed. <i>“...Why didn’t I think of that?”</i>");
		output("\n\nYou go and get a broom from the cupboard, particularly long and taur-friendly. Hooking it under the table, you fish out the object. As it rolls into view, you pointedly blink. From its dome-like head and the words ‘Levi-wand’ on the side, it’s safe to assume it’s a sex toy.");
		output("\n\nThe blonde-haired centauress leans over and picks it up, her face turning several shades redder than before. ");
	}
	//not a taur
	else 
	{
		output("\n\nSince the task is incredibly easy for you, you bend down and fish around for whatever this object is. You feel your fingers make contact. Pulling it out, you blink at the large mechanical object in your hands. From its dome-like head and the words ‘Levi-wand’ on the side, it’s safe to assume it’s a sex toy.");
		output("\n\nYou offer it up, and the blonde-haired centauress takes it off your hands. Her face is several shades redder than it was before.");
	}
	
	output(" <i>“S-sorry, it’s that time of the month; I’m in estrus, so I REALLY need this. That’s why I wanted to ask a stranger, not someone I knew...”</i> She flicks the ‘On’ switch a few times, but nothing happens. <i>“Oooohh no... don’t tell me this is happening. Come ooonnn!”</i>");
	output("\n\n<i>“What’s the matter?”</i>");
	output("\n\n<i>“I KNEW I should have gone down to the merchant deck, but I was too embarrassed; I bought this on the extranet, and it’s a dud!”</i> Aina whimpers, clutching the defective toy to her cardigan-clad chest. <i>“...It only ran for five minutes, then cut out!”</i>");
	output("\n\nThe centauress looks like she’s about to cry. Her equine tail flicks and once more you’re hit with a whumping wave of her musky mare-scent. As you breathe deeply, your mind is subsumed with arousal, drawing you into a scent-induced haze. Suddenly her equine rump is looking <i>really</i> attractive");
	
	if(pc.isTaur()) output(" and thoroughly mountable...");
	else output(", even though you’re not a taur!");
	
	processTime(10+rand(5));
	pc.changeLust(25);
	
	clearMenu();
	if(pc.lust() >= 33) addButton(0, "Offer Sex", helpAinaWithSex);
	else addDisabledButton(0,"Offer Sex","Offer Sex","You aren’t aroused enough for this.");
	if(pc.IQ() >= 40 || pc.characterClass == GLOBAL.CLASS_ENGINEER) addButton(1, "Fix Toy", helpAinaByFixingHerToy);
	else addDisabledButton(1,"Fix Toy","Fix Toy","You have no idea how to fix it.");
	addButton(14,"Leave", leaveAinaAlone);
}

//PC fixes Alina's 
public function helpAinaByFixingHerToy():void 
{
	clearOutput();
	showAina();
	
	output("You keenly inspect the sex toy. Flipping open part of the casing, you fiddle around with the internal wiring. It’s actually a pretty simple fix. After clicking it closed, you toss it to Aina, who catches it in both hands.");
	
	if(pc.isBimbo()) output("\n\n<i>“It was a simple fix! I just attached the blue thingy to the green thingy, and now it should be all good for sexy fun times!”</i>");
	else if(pc.isBro()) output("\n\n<i>“Fix’d it. Ain’t no big thing for [pc.name] Steele.”</i>");
	else if(pc.isNice()) output("\n\n<i>“There you go, ma’am. Your problems are solved.”</i>");
	else if(pc.isMischievous()) output("\n\n<i>“All done. [pc.name] Steele: galactic adventurer and sex-toy repair.”</i>");
	else output("\n\n<i>“There. Good as new. Try not to break it next time.”</i>");
	
	output("\n\nThe honey-blonde centauress clicks the wand on, and it whirrs in her grasp. With blushing cheeks, she bows to you. <i>“Th-thank you so much. Honestly, this solves all my problems. I’m meant to be studying for an exam, and I just can’t concentrate. You’ve really saved my hide!”</i>");
	output("\n\n<i>“Anytime you want to stop around, feel free to do so. I brew a mean cup of tea. Um... but if you don’t mind, could you excuse me? Got to, you know, do some stuff....”</i>");
	output("\n\nYou grin and head off, leaving the centauress to have her alone time, your good deed done.");
	
	flags["HELPED_AINA"] = true;
	flags["AINA_WAND_FIXED"] = true;
	
	//Not by PC, but it allows the PC to talk to her at the first meeting
	flags["AINA_LAST_DAY_RELIEVED"] = days;
	flags["AINA_LAST_HOUR_RELIEVED"] = hours;
	
	processTime(15+rand(10));
	
	clearMenu();
	addButton(0,"Next", move, "RESIDENTIAL DECK 15");
}

public function helpAinaWithSex():void
{
	clearOutput();
	showAina();
	
	//since there is no leave button anyway, set Aina helped to true
	flags["HELPED_AINA"] = true;
	
	output("What do you suggest?");
	
	ainaSexMenu(false);
}

//PC leaves Aina's apartment without helping her. 
//Her room is not unlocked and PC never sees her again.
public function leaveAinaAlone():void
{
	currentLocation = "RESIDENTIAL DECK 15";
	lockAinasRoom(true);
	clearOutput();
	
	flags["HELPED_AINA"] = false;
	
	output("With incredible difficulty, you shake your head of the musk-induced lust threatening to take control of you, and hastily bid her adieu. The whimpering centauress still thanks you for your help, waving as you make a quick dash for the door. As soon as you’re out, you take in a deep breath of fresh, pheromone-free air. Whew!");
	output("\n\nIt takes a few minutes to get back to normal, though you still feel a palpable tingling in your loins.");
	
	processTime(2);
	pc.changeLust(5);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//returns true/false depending if Aina is currently in heat
public function ainaIsInHeat():Boolean {
	var day_met:int = flags["AINA_DAY_MET"];
	
	//Aina is in heat for 7 days, followed by 14 days she is not in heat, her full circle 21 days.
	//Subtracting the day she was met from the current day gives the time the player knew her in days.
	//A modulo operation with 21 gives the days of her new cycle -1 as a remainder. 
	//Examples: 
	//Meeting her on day 5: 5(days) - 5(day_meet) = 0 % 21 = 0			(#1 day of cyclce [5])
	//Meeting her again on day 8: 8(days) - 5(day_meet) = 3 % 21 = 3	(#4 day of cycle [5, 6, 7, 8])
	//Meeting her again on day 21: 26(days) - 5(day_meet) = 21 % 21 = 0 (#1 day of cyclce again)
	var days_in_new_cycle:int = Math.round((days - day_met) % 21);
	
	if(days_in_new_cycle >= 0 && days_in_new_cycle <= 6) return true;
	else return false;
}

//returns true/false depending if Aina was met in this cycle
public function ainaMetThisCycle():Boolean {
	var day_met:int = flags["AINA_DAY_MET"];
	var day_last_met:int = flags["AINA_LAST_DAY_MET"];
	
	var last_cycle:int = Math.floor((day_last_met - day_met ) / 21);
	var current_cycle:int = Math.floor((days - day_met ) / 21);
	
	if(last_cycle == current_cycle) return true;
	else return false;
}

//returns true/false depending if Aina was last seen when in heat
public function ainaLastMetInHeat():Boolean {
	var day_met:int = flags["AINA_DAY_MET"];
	var day_last_met:int = flags["AINA_LAST_DAY_MET"];
	
	var days_in_old_cycle:int = Math.round((day_last_met - day_met) % 21);
	
	if(days_in_old_cycle >= 0 && days_in_old_cycle <= 6) return true;
	else return false;
}

//returns true/false depending if Aina was sexed in the last two hours
public function ainaRecentlyRelieved():Boolean {
	//Aina never relieved before, return false
	if (flags["AINA_LAST_DAY_RELIEVED"] == undefined) return false;
	
	var day_relieved:int = flags["AINA_LAST_DAY_RELIEVED"];
	var hour_relieved:int = flags["AINA_LAST_HOUR_RELIEVED"];
	
	//convert to days to hours, sum up corresponding hours
	//then check difference against two hour treshold
	if((days*24 + hours) - (day_relieved*24 + hour_relieved) <= 2) return true;
	else return false;
}

//returns true/false depending if Aina is a virgin or not
public function ainaIsVirgin():Boolean {
	if(flags["AINA_SEXED"] > 0) {
		return false;
	} else {
		return true;
	}
}

//increase the amount aina was sexed by x
public function ainaSexed(times:int):void {
	if(flags["AINA_SEXED"] == undefined) flags["AINA_SEXED"] = 0;
	flags["AINA_SEXED"] += times;
	
	//currently applies to all sex scenes, but since this may not be the case in the future,
	//the effect is kept as a seperate function
	applyAinaMareMuskEffect();
	ainaMakeDirty();
}

//render Button for meeting Aina in her apartment on the residential deck(#18)
public function ainaApartmentMeet():void 
{
	if (ainaPregMeetUpCheck()) addButton(0, "Aina", ainaPregMeetUp);
	else if (ainaBirthScene() && ainaKids() > 1) addButton(0, "Aina", ainaRepeatBirth);
	else if (ainaAtNursery()) addDisabledButton(0, "Aina", "Aina", "Aina is not here. She is at the nursery.");
	else if (ainaIsInHeat() && ainaKids() >= 1 && flags["AINA_PREG_TIMER"] != undefined && rand(4) == 0) addButton(0, "Aina", ainaPregHeatSex);
	else addButton(0,"Aina",ainaMenu);
	if(!pc.hasKeyItem("Panties - Aina's - Extra-large, striped green centaur panties.")) addButton(1,"HerDresser",ainasDresser,undefined,"Dresser","Check out her dresser.");
}

//approaching Aina in her apartment
public function ainaMenu():void
{
	clearOutput();
	showAina();	
	
	if (flags["AINA_COMFORT"] >= 2 && hours >= 21)
	{		
		output("You don’t see Aina around, but soon enough you hear a noise from her bedroom.");
		
		clearMenu();
		addButton(0, "Bedroom", ainaPregComfort3, undefined,"Bedroom","Head over to investigate.");
	}
	else
	{
		if(ainaIsInHeat())
		{
			if (!ainaRecentlyRelieved()) {
				output("Aina waves and clops over to you. She looks visibly flushed as she brushes back a honey-gold bang. <i>“Hi there, [pc.short]. Sorry if I’m a little scatterbrained right now. I’m, um,");
		
				if(ainaMetThisCycle()) output(" still in heat.");
				else output(" in heat again.");
				output("”</i>");
			
				output("\n\nYou can definitely smell it! Every time her equine tail flicks, you’re hit with a fresh wave of her musky mare-scent. The moment you get a whiff of her juicy cunt, you feel the instinct to <i>breed</i> her like crazy.");
			
				pc.changeLust(5);
			} 
			else 
			{
				output("Aina clops over to you, her skin covered in a sweaty sheen. Her honey-blonde hair is thoroughly tousled. <i>“Whew. What a relief! I can think straight for a bit. Thanks for that.”</i>");
				output("\n\n<i>“Did you want a cup of tea or something? I can brew something up to replenish your energy.”</i>");
			}
		}
		else
		{
			output("Aina warmly waves and clops over to you, brushing back a honey-gold bang. <i>“Hey there!");
			if(ainaMetThisCycle() && ainaLastMetInHeat()) output(" Finally out of heat, thank goodness.");
			else output(" Always good to see your face around here.");
			output("”</i>");
		
			output("\n\n<i>“I just finished brewing up a pot of tea - did you want some?”</i>");
		}
	
		//Upate the last time Aina was met
		flags["AINA_LAST_DAY_MET"] = days;
	
		processTime(2);
	
		clearMenu();
		addButton(0, "Appearance", ainaAppearance);
		if(!ainaIsInHeat() || ainaRecentlyRelieved()) addButton(1, "Talk", ainaTalk);
		else addDisabledButton(1, "Talk", "Talk", "Aina is in no state for talking.");
		addButton(2, "Tea", ainaSharesSomeTea, undefined, "Tea", "Take Aina up on her Tea offer.");
		if(pc.lust() >= 33) addButton(3, "Offer Sex", ainaSexMenu);
		else addDisabledButton(3,"Offer Sex","Offer Sex","You aren’t aroused enough for this.");
		if (ainaIsDirty()) addButton(4, "Shower with", ainaDirtyShowerIntro, undefined,"Shower with horsie","Ask Aina to take a shower with you");
		else addButton(4, "Shower", ainaShower);
		if (flags["AINA_COMFORT"] >= 2 && (hours >= 5 && hours <= 8)) addButton(5, "Comfort", ainaPregComfort2, undefined,"Have breakfast","Eat breakfast with Aina");
		else if (flags["AINA_COMFORT"] >= 1) addButton(5, "Comfort", ainaPregComfort1, undefined,"Watch a movie","Ask Aina to watch a movie with you");
	
	}
	addButton(14,"Leave",mainGameMenu);
}

public function ainaAppearance():void
{
	clearOutput();
	showAina();
	
	output("Aina is what you’d call the girl next door, if the girl next door was a chestnut-colored centaur. From her champagne-colored sweater to her long cream-linen skirt, she hardly flashes her assets. That said, they’re definitely there; it’s hard to miss the curvaceous swell of her breasts.");
	if (flags["AINA_LACTATING"] == 1) output(" Her breasts are larger than normal since she is currently lactating.");
	output("\n\nHer honey-blonde hair is tied back with a lace ribbon, hanging down her back in a ponytail. Her tawny eyes are soft edged, matching the warm smile usually lighting up her lips. Her fair skin is soft and youthful.");
	output("\n\nHer rump, like that of any centauress, is sizably huge. Even though her hem is long, it does nothing to cover it up, leaving her puffy-lipped equine pussy openly exposed. She doesn’t seem self-conscious about it, holding her human and tauric halves to different standards.");
	if (ainaBellyShowing()) output(" Her belly is noticeably swollen due to her pregnancy.");
	else if (flags["AINA_PREG_TIMER"] != undefined && flags["AINA_PREG_TIMER"] >= 15) output(" If you look closely you can see a slight curve to her stomach due to her pregnancy.");
	
	addDisabledButton(0, "Appearance");
}

public function ainaSharesSomeTea():void
{
	clearOutput();
	showAina();
	
	//generate random number between 0-4
	var random:int = rand(5);
	
	switch(random) {
		case 0 :
			output("Aina pours out some tea in little porcelain cups patterned with cherry-blossoms. You both sit down and blow on the steaming cups. There’s something relaxing about the radiant warmth in your hand and the refreshing floral smell of the tea. You haven’t even tasted it and you feel reinvigorated.");
			output("\n\n<i>“What kind of tea is this?”</i> you ask, a little curious. It’s hard to pick the type of tea just by looking at it, the water being a transparent greeny yellow.");
			output("\n\n<i>“It’s ‘Dragon’s Well’, a type of Green Tea. I got it from a cutting at market, and I’ve been growing some in my nursery,”</i> Aina happily explains, opening the teapot to show you its contents. Inside are flat, sword-like green leaves bobbing about. <i>“See that? You’ve got to pan fire them so they curl, that’s how you get that shape.”</i>");
			output("\n\nSounds like a lot of work! You take a sip. The green tea has a mild grassy taste, no doubt why the centauress loves it. Since it’s not too overpowering, it’s the sort of tea one could sit around and drink all day.");
			output("\n\nAfter you’ve finished a cup, you thank her for the green tea. Aina puts away the teapot and cleans up, looking a little chuffed with herself.");
			output("\n\n<i>“I’m glad you liked it! I’ve been wanting to try out this strain of leaf. It’s always better to have someone to share it with, you know?”</i> The centauress blushes, wiping off the table where you sat.");
			break;
		case 1 : 
			output("You take Aina up on her offer for tea and sit down. The honey-blonde centauress busies herself brewing you up a cup, then places it down in front of you. Through the steam, you can see the contents are a semi-transparent caramel.");
			output("\n\n<i>“It’s Darjeeling Tea from the Amira sector. A lot of people call it the ‘champagne of teas’. It’s got a nice, floral scent.”</i>");
			output("\n\nYou inhale the steam coming off the teacup, appreciating the tickling odor. When you taste it, though, it’s got a musky spiciness that almost contradicts its scent. You say as much, and Aina nods, sipping her own tea.");
			output("\n\n<i>“Yeah, it can be slightly mouth-drying too. I’m only sometimes in the mood for Darjeeling; today’s one of those days.”</i>");
			output("\n\nTo almost counter the taste, Aina serves up some tiny tea-cakes for you to eat. She seems to have baked them herself. Picking some out, they’re pretty tasty, and just the thing to balance out the tea.");
			output("\n\nOnce you’re done, you thank her for the tea and cakes. You’re feeling quite refreshed!");
			break;
		case 2 : 
			output("You nod and sit down, taking Aina up on her offer for tea. She places out a cup in front of you and leans over to pour a creamy stream from her teapot. Her well-rounded breasts are stretching against her sweater as she does, and you get a glimpse of her bra strap. For some reason, the brief flicker of her underwear is somewhat arousing, and you feel a");
			if(pc.hasCock()) output(" stirring");
			else output(" tingling");
			output(" sensation in your loins.");
			output("\n\n<i>“This is some milk tea for a change. It’s nice to give the palette a rest and get back to the basics every so often, don’t you think?”</i>");
			output("\n\nYou nod and sip the creamy tea. Even though she says that, the tea has a slight fresh and mellow, sweet taste. It’s very refreshing to drink. Afterwards, you feel fully invigorated, and say as much.");
			output("\n\n<i>“That’d be my wonderful company, of course! I’m sure the tea helps a little bit too,”</i> Aina admits with a wink, cleaning up the tea cups.");
			break;
		case 3 : 
			output("Taking the honey-blonde centauress up on the offer, you sit down while she serves up some tea. She puts down a porcelain cup in front of you and fills it up. The contents are black as night. It has a brisk, strong scent. She serves up some sweet baked goods to go with it.");
			output("\n\n<i>“Here, this will take the edge off. It’s always good to have black tea this strong with something sweet,”</i> Aina offers.");
			output("\n\nYou pick up one of the colorfully topped cupcakes and savor it along with the tea. She’s right; both of them together work to take the rough edges off, making something truly delicious. Almost as interesting are all the different toppings on the cakes. It’s a feast for your eyes <i>and</i> your stomach.");
			output("\n\n<i>“Have as many as you want. I always make them in big batches,”</i> Aina informs you.");
			if(!pc.isTaur() && !pc.isGoo() && !pc.isDrider()) output(" There’s no way you can eat as many as she put out. As a centaur, she has quite the appetite!");
			output("\n\nOnce you’re done, you feel well and truly stuffed on tea and sweets. Your blood is practically singing with all the sugar and caffeine the centauress gave you!");
			break;
		case 4 :
			output("You sit down while Aina brews up some tea. She takes a lot of care preparing it, from the water she uses to the time she steeps it. When she brings it over on a tray, it smells absolutely delicious, serving it up in patterned porcelain cups.");
			output("\n\n<i>“I hope you like it. It’s a herbal tea I made called ‘Lovers Blossom’.”</i>");
			output("\n\nThe floral and herbal scent tickles your nose; there’s even a hint of cinnamon. You blow the cup and then take a sip. It’s just as flavorful as it is fragrant. You savor the exotic taste of her home-made tea, each sip thoroughly enjoyable. Aina refills your cup until you’ve had enough, keeping the contents of the teapot hot for you.");
			output("\n\nOnce you’re done, you thank Aina for the tea, and she beams and takes the teacups away. You’re feeling incredibly refreshed, both from taking a break from your travels, and from the tea.");
			break;
	}

	applyAinaHearTeaEffect();
	
	addDisabledButton(2, "Tea", "Tea", "You just had tea with her.");
}

public function ainaTalk():void
{
	clearOutput();
	showAina();
	
	output("What would you like to talk about with Aina?");
	
	ainaTalkNavigation();
}

public function ainaTalkNavigation(activeTopic:Function = undefined):void {
	clearMenu();
	if(activeTopic == ainaTalksAboutHerself) addDisabledButton(0, "Her", "Herself", "You just spoke about that.");
	else addButton(0, "Her", ainaTalksAboutHerself, undefined, "Herself", "Ask Aina about herself.");
	if(activeTopic == ainaTalksAboutBotany) addDisabledButton(1, "Botany", "Botany", "You just spoke about that.");
	else if(flags["AINA_TALKED_ABOUT_HERSELF"] == true) addButton(1, "Botany", ainaTalksAboutBotany, undefined, "Botany", "Ask Aina about her interest in botany."); 
	else addDisabledButton(1, "Botany", "Botany", "You don’t know her well enough to talk about that.");
	if(activeTopic == ainaTalksAboutCentaurs) addDisabledButton(2, "Centaurs", "Centaurs", "You just spoke about that.");
	else addButton(2, "Centaurs", ainaTalksAboutCentaurs, undefined, "Centaurs", "Ask Aina about her species.");
	if(activeTopic == ainaTalksAboutMating) addDisabledButton(3, "Mating", "Mating", "You just spoke about that.");
	else addButton(3, "Mating", ainaTalksAboutMating, undefined, "Mating", "Ask Aina about her frequent bouts of estrus.");
	if(activeTopic == ainaTalksAboutACashing) addDisabledButton(4, "A.Caching", "Astrocaching", "You just spoke about that.");
	else addButton(4, "A.Caching", ainaTalksAboutACashing, undefined, "Astrocaching", "Ask Aina about the random objects decorating her apartment.");
	if(activeTopic == ainaTalksAboutSexToys) addDisabledButton(5, "SexToys", "Sex Toys", "You just spoke about that.");
	else addButton(5, "SexToys", ainaTalksAboutSexToys, undefined, "Sex Toys", "Ask Aina about her sex toys.");
	addButton(14, "Back", ainaMenu);
}

public function ainaTalksAboutHerself():void
{
	clearOutput();
	showAina();
	
	output("You ask Aina a little bit about herself. You’re a little curious to know more about the youthful-looking centauress.");
	output("\n\n<i>“About me? Geez. I never know how to answer that question well,”</i> Aina replies, rubbing the back of her neck. <i>“When they asked me for my college entry, I froze on the spot.”</i>");
	output("\n\n<i>“You’re a college student?”</i>");
	output("\n\n<i>“Yeah. I’m studying interstellar botany, though I’m only a sophomore. And before you ask, no, I’m not studying botany because I want to eat plants. Not that I don’t eat plants. I mean, I do, but that’s not why I want to be a botanist,”</i> she pouts.");
	output("\n\n<i>“Why study all the way out here? Is there a college here on the station?”</i>");
	output("\n\n<i>“Yes, but I’m not a student of it. I’m actually doing my botany certificate by holo-edu at Arda University on Ekurana. There’s an applied research course, though, and it operates out of Tavros. We get to examine all the exotic flowers and plants that rushers bring back. It’s pretty exciting!”</i>");
	output("\n\n<i>“That said, it can be rough sometimes. I took out a massive student loan to help me rent this apartment. I’ve also got a part time job selling flowers, herbs, and tea over the extranet. Growing my own food really helps me get by, too. Advantages of being a centaur; no need for meat in my diet!”</i>");

	flags["AINA_TALKED_ABOUT_HERSELF"] = true;
	
	processTime(5);
	ainaTalkNavigation(ainaTalksAboutHerself);
}

public function ainaTalksAboutBotany():void
{
	clearOutput();
	showAina();
	
	output("You ask Aina about her interest in botany. She grins and trots over to a sealed off room, pressing her pale hand against a palm-pad. With a whoosh, the door opens, revealing a separate indoor greenhouse. Rows and rows of vibrant plant life line the shelves. As you approach, a symphony of floral scents hit your senses. You reel in olfactory bliss!");
	output("\n\n<i>“This is my growing area. Half are my class projects, while the rest are for pleasure, selling, or food. I’ve got cuttings from all sorts of planets, even Earth! I’ve got some lovely lavender and coriander, not to mention quite a few teas.”</i>");
	output("\n\nShe picks some herbal leaves and hands them to you. Crisp, strong, and nostalgic; it reminds you of your home on Terra. <i>“...It smells so fresh. Nothing like the replicated stuff.”</i>");
	output("\n\nAina screws up her nose. <i>“Oh, eugh, no! Replicator food is the </i>worst<i>. I mean, if I had to live on it, I would, but nothing beats authentic, grown food. Even synthetic soil alters the taste. I try to source real soil for growing and use water with natural bacteria from the plant’s home planet. Every little thing makes a difference, you know?”</i>");
	output("\n\n<i>“Sounds intricate,”</i> you admit, looking at the aromatic herbs. Such a small thing takes so much work to replicate in space. Food with these must taste amazing. <i>“So, is the smell and taste why you love botany?”</i>");
	output("\n\n<i>“That’s part of it. I grew up on Vaernes. It’s a core world, deep in the Rosette Nebula,”</i> Aina stroked a leafy plant, <i>“Most of the planet is covered in continental cities. Half the food supply is imported from a sister planet. We went on a class trip when I was in primary school. I’d never seen so much open space; so far and so wide, just filled with beautiful, growing plants! They were just Ma’ora beans, but it moved me.”</i>");
	output("\n\n<i>“One of the farmers gave me a taste. They were so fresh and </i>crisp<i>. It felt like magic. From then, I knew I wanted to be a botanist; to fill worlds with flowers and edible foods. The universe has so much to offer, you know? Stuff we’re still finding every day. Combinations and spices, from the sun and the rain, things that we’d never think to add. That’s why I love botany.”</i>");
	
	processTime(5);
	ainaTalkNavigation(ainaTalksAboutBotany);
}

public function ainaTalksAboutCentaurs():void
{
	clearOutput();
	showAina();
	
	output("You ask Aina what her birth-species is, and if she was born a centaur.");
	output("\n\n<i>“Nope! I was born a human. This was very costly. My parents threw a fit when I told them I wanted to get gene-modded,”</i> Aina winces, brushing back a blonde bang. <i>“I think they wanted to make sure I wasn’t just going through a phase.”</i>");
	output("\n\nA phase? You ask why they’d think that. Aina smiles and gives a shrug.");
	output("\n\n<i>“I went to a fairly well-off school on Vaernes. Every so often, some kid would come to school with a gene-mod that their parents had forked out for, just so they could be a special snowflake. Of course, then all their friends want to follow suit. My parents wanted to make sure it wasn’t just some fad.”</i>");
	output("\n\n<i>“I understand it, though. Being a taur’s not an easy lifestyle.");
	
	if(pc.isTaur()) output(" I mean, you know, right?");
	
	output(" Most stuff is built for bipeds, with a little bit of afterthought given for everyone else. I mean, just sitting down in a shuttle is a hassle. There’s like, usually two taur seats and a ton for everyone else. You’ve pretty much got to get used to standing until your hooves sting.”</i>");
	output("\n\nSo why bother becoming a taur, you ask?");
	output("\n\n<i>“It might sound a little silly, but I like to think I’ve always been a centaur, deep down. I’ve always loved natural things; plants, running, open spaces. A real problem when you live on a planet covered in giga-cities.”</i>");
	output("\n\n<i>“I first found out about centaurs when I was playing a fantasy game a friend leant me in high school. It had this beautiful centaur mare in it, and even though she was a bit character, I just found myself identifying so much with her and her species. I read up on the myths and fiction... I ended up visiting centaur extranet sites a lot.”</i>");
	output("\n\n<i>“It got so bad that my parents caught me, um, masturbating to stallion porn...”</i> Aina blushes, squirming on the spot. <i>“...I-I was mortified. There I was, legs spread and fingers deep, touching myself to a life-size horseman holo. I was </i>so<i> grounded it wasn’t funny. It didn’t stop me. I ended up on virtual boards, talking to others who’d gone centaur and never looked back. They gave me the confidence to make the change.”</i>");
	output("\n\n<i>“I walked in, told my parents it was happening one way or another, and that was that. There was shouting, but I stood my ground. They said they weren’t paying for it, so I got a part-time job at McChow Hut. It took me three years to save up the money. Sometimes I thought about just taking out a loan, but I was too scared of defaulting.”</i>");
	output("\n\n<i>“Anyway, that’s how I became a centaur - selling fast terrible cheeseburgers and watered down soft drinks. It gave me a new appreciation for home grown food, at least.”</i>");
	
	processTime(5);
	ainaTalkNavigation(ainaTalksAboutCentaurs);
}

public function ainaTalksAboutMating():void
{
	clearOutput();
	showAina();
	
	output("You ask Aina about her frequent bouts of estrus. It seems pretty problematic, by the looks of things.");
	output("\n\nThe honey-blonde student shakes her head. <i>“O-oh no, not really! I mean, it’s just a part of nature, right? The urge to mate exists in humans, too, and especially species like ausar and leithans. It’s just nature’s way of saying ‘Mate already, girl!’ I-I mean, it’s pretty manageable, especially since you");
	
	if(flags["AINA_WAND_FIXED"] != true) output(" came and helped me out.");
	else output(" fixed my toy.");
	output("”</i>");
	
	output("\n\n<i>“If anything, when I’m in heat and my needs are, you know, met, I feel this dopey, absolutely happy feeling... it’s a bit hard to describe? Like what I’m doing is </i>so<i> right. So long as I’m able to get off, I’m good to still do most things... though I find myself grinding against things a </i>lot<i> more often,”</i> Aina blushes.");

	if(!ainaIsVirgin()) output(" <i>“Though, you know, I’d prefer to be grinding up against, you know, you.”</i>");
	
	processTime(5);
	ainaTalkNavigation(ainaTalksAboutMating);
}

public function ainaTalksAboutACashing():void
{
	clearOutput();
	showAina();
	
	output("You spot a shelf in Aina’s apartment cluttered with strangely random nick-knacks. There’s a little toy ausar soldier, an ancient-looking flint and steel lighter, a blue bandanna... it all seems completely out of place in her otherwise neat, stylish apartment.");
	
	if(pc.isBimbo()) output("\n\n<i>“Oh hey, what’s with those thingy-things over there?”</i>");
	else if(pc.isBro()) output("\n\n<i>“Yo, babe. What’s with the crap on the shelf?”</i>");
	else output("\n\n<i>“That’s a strange bunch of stuff on that shelf. What’s with it?”</i>");
	
	output(" you ask, gesturing for emphasis.");
	output("\n\nThe centauress looks over at the shelf, then turns back, golden eyes glinting excitedly. <i>“Oh, you’re asking about my swag? I’ve collected it from all over the galaxy!”</i>");
	output("\n\n<i>“Your... swag?”</i>");
	output("\n\n<i>“Yeah, my swag! It’s from Astrocaching. It’s a hobby of mine. Do you know it?”</i>");
	output("\n\nYou shake your head. Aina pulls a small palm-size device and shows it to you. With a click, a three-dimensional representation of the station floats above the screen, with a green dot showing her position. There’s also a few smaller dots in blue. It’s a CPS - a cosmos positioning system.");
	output("\n\n<i>“Astrocaching is a real-world, galactic treasure hunting game using CPS devices, dating back to Terra. It’s loads of fun. Basically, people leave astrocaches around the galaxy, then drop some coordinates on the extranet. People navigate there and attempt to find the cache nearby. It’s just like being a real treasure hunter!”</i>");
	output("\n\n<i>“When you get there, there’s always a digital logbook inside, where you sign down your name. There’s also swag; things people have left behind in the cache. You can take anything you want, but you’ve got to leave something in its place of equal value. See, I found that stuff in the caches I opened and took them, but I left something small in trade for the next person to take.”</i>");
	output("\n\nYou ask her if the blue dots on Tavros are astrocache coordinates. The centauress nods and touches one. Suddenly a small screen pops up, with not only the general area the cache is hidden, but its type, size, and difficulty. This one appears to be three stars.");
	output("\n\n<i>“Some are harder than others. I’ve only got as high as two stars. I hear you can find some neat swag in the bigger ones. There’s ones as small as a bottle, others large as a shipping container. You don’t really do it for the swag, though, but more for the adventure, you know? Sometimes it takes hours to find a cache, and you find someone’s hidden it as a fake log. Other times, there’s riddles to find caches, or ones that lead to </i>other<i> caches.”</i>");
	output("\n\n<i>“Have you ever been on a treasure hunt like that?”</i>");
	output("\n\n<i>“Well, yeah, you could sort of say that,”</i> you cough.");
	
	processTime(5);
	ainaTalkNavigation(ainaTalksAboutACashing);
}

public function ainaTalksAboutSexToys():void
{
	clearOutput();
	showAina();
	
	output("You notice Aina’s collection of sex toys in an open drawer. Most of them are clitoral wands, though there’s a few anal toys as well. Aina notices where your gaze has gone and her cheeks flush.");
	output("\n\n<i>“That’s... that’s not supposed to be open,”</i> she stammers out, trotting quickly over to the drawer. Before she can shut it, you ask her about all her toys. The centauress pauses and pulls out one of the butt-plugs, nervously playing with it in her hands. Why has she got so many of them?");
	output("\n\n<i>“Well, it’s been really tough to find a good one. I’m too nervous to try the centaur-specific ones... you know, the ones that float with a mind of their own? That’s way too scary, like, what if it goes out of control? It’s kind of like having a </i>ghost<i> floating around.”</i>");
	output("\n\n<i>“I’d rather do it myself or have someone else involved, you know?”</i>");
	output("\n\nYou ask her about the butt-plugs, anal dildoes and beads she owns. Some of the butt-plugs are the size of footballs! Does she enjoy that sort of thing?");
	output("\n\nAina squirms and gives a nervous nod. <i>“Yeah, I mean, I didn’t want to give up my virginity to a toy, so I started experimenting in... you know, other areas. I really like the sensation of being filled.”</i>");
	output("\n\n<i>“Problem is, ever since I became a centaur, I can take in a lot back there. It used to be a lot easier - a few fingers would be plenty.”</i>");
	output("\n\n<i>“Now, I need really big stuff like this. It’s not all bad though. Some of them vibrate, which actually helps with my studying.”</i>");
	output("\n\n<i>“Which one’s your favorite?”</i> you ask. Aina brushes back one of her bangs and then shyly picks up a translucent toy with both hands. The eighteen inch see-through horse cock takes both hands to hold, and even then it’s spilling out of her grasp. Even though it’s transparent, every vein and groove of the animalistic shaft is realistic, with the exception of the flared and round suction cup at its base.");
	output("\n\n<i>“This one, definitely. It’s hands free, though I’ve only used it, well, in my rump. Once I put it between my breasts, which was kind of nice. After cleaning it, of course,”</i> Aina quickly adds. <i>“The saleswoman said it can be slipped into a strap-on belt, which came with it. I prefer to just slap it against the shower wall and use it. It’s easy to clean up after I get all messy.”</i> She blushes. <i>“Good thing it’s waterproof.”</i>");
	
	processTime(5);
	
	flags["AINA_TALKED_ABOUT_TOYS"] = true;
	
	ainaTalkNavigation(ainaTalksAboutSexToys);
}

public function ainaShower():void
{
	clearOutput();

	if (flags["AINA_SHOWER_USED"] == undefined)
	{
		output("You ask Aina if you can use her shower, and she nods enthusiastically.\n\n<i>“Sure! Just on the right.”</i>\n\n");
		flags["AINA_SHOWER_USED"] = true;
	}
	output("You hop into the centauress’ impressively large shower to clean yourself off. Rivulets of water run down your [pc.skinFurScales]. You rub soap all over your body and then clean it off, leaving you perfectly spotless.");
	output("\n\nHopping out, you let out a happy sigh, rubbing a towel over your [pc.hair]. You’re feeling refreshed in so many ways!");
	output("\n\n<b>You are now clean!</b>");
	
	processTime(10 + rand(5));
	
	pc.shower();
	
	clearMenu();
	addButton(14, "Back", ainaMenu);
}

public function applyAinaMareMuskEffect():void 
{
	if(!pc.hasStatusEffect("Mare Musk")) pc.createStatusEffect("Mare Musk",0,0,0,0,false,"Icon_Smelly","You smell like a horny mare! The potent female scent is sure to drive others wild - though it gets you a little worked up as well.",false,0);
}

public function applyAinaHearTeaEffect():void 
{
	if(!pc.hasStatusEffect("Heart Tea")) pc.createStatusEffect("Heart Tea",0,0,0,0,false,"Pill","Aina’s special blend, brewed with care, makes you feel healthier than ever!",false,1440);
	else pc.setStatusMinutes("Heart Tea",1440);
	pc.maxOutHP();
	pc.maxOutEnergy();
}

public function ainaSexMenu(text:Boolean = true):void
{
	if(text)
	{
		clearOutput();
		showAina();
		
		output("... What do you suggest?");
	}
	
	clearMenu();
	if(pc.hasCock())
	{
		if(!pc.isTaur())
		{
			if(pc.cockThatFits(2000) >= 0)
			{
				//Dick too small?
				if(pc.cLength(pc.cockThatFits(2000)) < 4.5)
				{
					if(pc.cockTotal() == 1) addDisabledButton(0,"Fuck Her","Fuck Her","You’re too small for her to notice, really.");
					else addDisabledButton(0,"Fuck Her","Fuck Her","You’re too small to fuck her, and if you have a bigger cock, it’s probably too big.");
				}
				else addButton(0, "Fuck Her", ainaSexedFromBehind,undefined,"Fuck Her","Put your Tab A into her Slot B.");
			}
			else addDisabledButton(0,"Fuck Her","Fuck Her","<b>You’re too big</b> - even for a centaur!");
		}
		else
		{
			if(pc.cockThatFits(2000) >= 0)
			{
				//Dick too small?
				if(pc.cLength(pc.cockThatFits(2000)) < 4.5)
				{
					if(pc.cockTotal() == 1) addDisabledButton(0,"Breed Her","Breed Her","You’re too small for her to notice, really.");
					else addDisabledButton(0,"Breed Her","Breed Her","You’re too small to fuck her, and if you have a bigger cock, it’s probably too big.");
				}
				else addButton(0,"Breed Her",breedAinaAsATaur,undefined,"Breed Her","Show her what real sex with a real ‘taur is like!");
			}
			else addDisabledButton(0,"Breed Her","Breed Her","You need a penis that will actually fit inside her for this. You’re too big, even for her capacious cunt.");
		}
	}
	else addDisabledButton(0,"Fuck Her","Fuck Her","You need a penis in order to do this.");
	addButton(1, "Fisting", ainaSexedFisting, undefined, "Fisting", "Give her mare cunt a healthy fisting.");
	if(flags["AINA_TALKED_ABOUT_TOYS"]) addButton(2, "Wand&Anal", ainaSexedWithAnalWand, undefined, "Wand and Anal", "Put a spell on her anus using her magical toy wands.");
	else addDisabledButton(2,"Locked","Locked","You have to talk to her about something to unlock this option.");
	
	if(text) addButton(14, "Back", ainaMenu);
}

public function ainaSexedFromBehind():void
{
	clearOutput();
	showAina(true);
	
	if(ainaIsInHeat()) 
	{
		output("You offer your services at relieving her ‘tensions’. She definitely seems like she needs it. Plus, just being this close to her has gotten you all worked up as well.");
		
		if(ainaIsVirgin()) 
		{
			output("\n\n<i>“Ruh-really? But I’ve never been with anyone but a toy!”</i> Aina exclaims. As much as she’s blushing, she’s also squirming on the spot. Eventually, she can’t handle it anymore, giving into her lust, <i>“...Okay, you can mount me, but be gentle, okay?”</i>");
		
			if(pc.isNude()) output("\n\nWith you already naked and ready, ");
			else output("\n\nAs you strip off,");
			
			output(" the pretty centaur turns her big backside towards you and lifts her tail. Her huge horse-like sex is extremely puffy and wet, flaring invitingly at you. As you’re hit with a fresh wave of her potent musky scent, you reel with delight, your [pc.cocksLight] immediately stiffening with primitive desire!");
		}
		//not a virgin
		else
		{
			output("\n\n<i>“I suppose we’ve done");
			
			if(flags["AINA_SEXED"] >= 5) output(" it so many times, you’re practically my mate now...");
			else output(" it before, another time wouldn’t hurt...");
			output("”</i> ");
			
			if(pc.isCrotchGarbed()) output("You strip off as she");
			else output("She");
			
			output(" turns her big backside towards you, pointedly lifting her tail. Her huge horse-like sex is extremely puffy and wet, flaring invitingly at you. As you’re hit with a fresh wave of her potent musky scent, you reel with delight and your loins stiffen with primitive desire.");
		}
	}
	//not in heat
	else 
	{
		output("You move over and stroke Aina’s shapely backside, suggesting that maybe the two of you could mate again? The honey-blonde centauress blushes, not rejecting your advances. If anything, her equine tail is swishing a little excitedly, and you can smell the slightest stirring of her feminine scent in the air; is she getting wet from just you touching her?");
		output("\n\n<i>“U-um, I suppose we’ve done");
		
		if(flags["AINA_SEXED"] >= 5) output(" it so many times, you’re practically my mate...");
		else output(" it before, another time wouldn’t hurt...");
		output("”</i> ");
		
		output(" Aina breathily exclaims, clasping her hands to her chest. Timidly, she turns her big backside towards you, and slowly lifts her tail. You grin as you see her huge horse-like sex, already looking a little puffy and wet. Her mare sex flares, whumphing you with a wave of her potent pheromones. Your [pc.cocksLight] immediately stiffen");
		if(pc.cocks.length == 1) output("s");
		if(!pc.isCrotchExposed()) output(" beneath your [pc.lowerGarment]. You strip off, eager to breed.");
		else output(" in response, eager to breed.");
	}
	
	output("\n\nHungry for her taste, you lean forward and bury your face between her sloppy folds, lapping at her wetness with your tongue. As she shivers and whinnies, you feel her exquisitely sweet, tangy taste roll across your tastebuds - she’s so intoxicating! You bury your nose further, deeper, hungry for her centaur juice. Even as it gushes out and excitedly floods all over your cheeks and chin, you can’t get enough!");
	
	if(ainaIsVirgin()) output("\n\n<i>“I’ve never had someone’s face down there!”</i> the inexperienced centauress gasps, her equine tail swishing wildly about.");
	else output("\n\n<i>“Th-that feels so good!”</i> the deflowered centauress gasps, her mare tail swishing wildly about.");
	
	output(" Not only is her potent pussy juice streaming down your chin and");
	
	if(!pc.hasBreasts()) output(" chest");
	else output(" between your breasts");
	
	output(", it’s loudly splattering on the floor between her animal flanks. So wet! As you’re hit with another wave of her musky mare snatch, your");
	
	if(pc.cocks.length > 1) output(" cocks achingly slap");
	else output(" cock achingly slaps");
	
	output(" against your lower belly; all you can think about is mating and filling her belly with your [pc.cumVisc] [pc.cumNoun]!");
	
	output("\n\nGrabbing your [pc.biggestCock], you line it up with her silky black cunt lips, then give a forceful thrust.");
	
	if(ainaIsVirgin()) output(" There’s a slight resistance, then a sudden give, and the virgin centauress gives a tiny squeal. As you slide into her unsullied depths, she gives a shivering moan, taking her very first cock!");
	else output(" Aina’s cunt is so wet, warm, and welcoming!");
	
	output(" You’re completely engulfed inside of her in no time at all. Her body-temperature is much higher than a human’s; it feels like you’re going to melt just being sheathed inside her flaring mare snatch.");
	pc.cockChange();
	
	if(ainaIsVirgin()) output("\n\n<i>“S-so this is what a " + pc.mf("man", "dick") + " feels like?”</i>");
	else output("\n\n<i>“I-I can’t believe I used to use a toy!”</i>");
	
	var x:int = pc.cockThatFits(2000);
	if(x < 0) x = pc.smallestCockIndex();
	output(" Aina breathily gasps. She presses herself back against you, needily and insistently, her sizable rump rubbing against your lower half. Linked by your [pc.cock " + x + "], streams of her pussy-juice run out of her honeypot. With each slapping thrust of your hips, there’s a lewd squelching noise, and even more of her musky wetness dribbles down between her quaking thighs. You grab onto her swishing horse-tail, using it to hold on against her bucking thrusts. This lusty centauress is quite the ride!");
	output("\n\nAs you slap against her equine ass, you look up to see Aina breathily stripping off her modest sweater and bra and tossing them aside. With obvious inexperience, she fondles her now-naked breasts, pinching at her pointed peaks. You grin and slap your hips against her lower half - pressing your cockhead deeper inside her sloppy quim - and she lets out a sweet-lipped cry. Her fondling becomes rougher and needier, giving you a delightful show as you thoroughly fuck her, twitching tail in hand!");
	output("\n\nWhen she cums, she lets out a loud whinny and her slippery cunt clamps down HARD on your cock, a series of muscular rings squeezing your length from your [pc.knot " + x + "] to your crown. As she whimpers and trembles, hot girl-juice sprays your pulsing head from inside her sloppy honeypot. The pleasurable pressure bastes and batters your twitching tip, setting you off in turn. With a final primal thrust, you shoot your [pc.cumVisc] sperm into her equine womb,");
	
	if(pc.cumQ() < 100) output(" lightly bathing her eggs in your spurting seed.");
	else if(pc.cumQ() < 6000) output(" filling it to the brim with your [pc.cumColor] seed.");
	else output(" overfilling it with your [pc.cumColor] seed until the centauress’s belly looks expectant with foals!");
	
	if(!pc.hasKnot(x)) 
	{
		output("\n\nAs you shoot your [pc.cumNoun] inside of her, some of it mixes with her sloppy mare juices drooling down from her flanks. You both make an utter mess of the floor beneath you, the results of mating with the cute centauress. When you finally pull out, there’s a loud ‘plop’, and an even larger stream of sexual fluids leaks out from her dusky mare snatch. Aina lets out a dreamy sigh and turns around, hand stroking through her hair, another clasped modestly in front of her sweat-soaked breasts.");
	}
	else 
	{
		output("\n\nThe longer you cum, the more your knot swells inside her copious cunt, until your delving dick is locked in place. The swelling pins in both her cum and yours, pooling inside of her");
		if(pc.cumQ() >= 6000) output(", increasing the size of her already obscenely bloated belly!");
		else if(pc.cumQ() >= 3000) output(" until her belly is so swollen it looks like she’s expecting foals!");
		else output(".");
		
		output("\n\n<i>“Y-you’re so big, and all swollen!”</i> Aina whimpers, her hoofs stomping at the ground. As you continuously cum inside her, trembling against her massive rump, the pressure causes her to climax, which in turn causes even more pressing inside her animal pussy! By the time your knot begins to deflate, she’s a drooling, gibbering mess of pleasure. When you pull out, there’s a loud ‘plop’, and a gushing stream of [pc.cumNoun] and girl-spunk floods out from between her flaring black pussylips, splashing wetly all over you and the floor!");
		output("\n\nAfter such intense mating with the honey-haired mare, she collapses to the carpet, still moaning and twitching in the aftermath of delight.");
		
		if(pc.isNice()) output(" You help get her at least to the couch, then throw a blanket on her.");
		else if(pc.isMischievous()) output(" You wince and grab a blanket, throwing it over her to at least keep her warm.");
		else output(" Talk about a well-mated bitch...");
	}
	
	if(ainaIsVirgin()) 
	{
		output("\n\n<i>“M-my first time... I never knew proper mating could be so amazing,”</i> Aina blushes, absentmindedly tucking a messed-up lock behind her ear. <i>“I, um, I’m still feeling kind of lightheaded. Kind of floaty, even. I think maybe I should sit down? Oh, the mess! Did I really leak out that much?!”</i>");
		output("\n\nLooking thoroughly embarrassed, the centauress grabs a vacuu-mop. <i>“Um, thank you so much. I really needed that. I-If you’re ever in the Res Deck again, maybe look me up? I’d be more than willing to fit you in... um, I mean have you over!”</i>");
		output("\n\nYou grin and grab your things, leaving Aina to clean up. Given how wet she was, you imagine it’s going to take quite a while.");
	} 
	else
	{
		output("\n\n<i>“That was amazing... just like last time...”</i> Aina blushes, absentmindedly tucking a messed-up lock behind her ear. <i>“Um, you know, if you’re ever in Res Deck again, feel free to call around. I always love having you over... whether we’re talking or, you know, doing other things....”</i>");
		output("\n\nYou nod and grab your things. Your whole body reeks of mare musk! You’re pretty sure anyone within a mile could smell it.");
	}
	
	ainaSexed(1);
	
	flags["AINA_LAST_DAY_RELIEVED"] = days;
	flags["AINA_LAST_HOUR_RELIEVED"] = hours;
	
	processTime(20 + rand(15));
	aina.loadInCunt(pc, 0); //overridden function in Aina.as
	pc.orgasm();
	
	clearMenu();
	addButton(0, "Next", ainaMenu);
}

public function ainaSexedFisting():void
{
	clearOutput();
	showAina();
	
	if(ainaIsInHeat()) output("You suggest a ‘hands-on’ approach to relieving her tensions,");
	else output("You tell her that you’re actually in the mood for something <i>else</i>,");
	
	if(pc.isChestGarbed()) output(" stripping off your [pc.upperGarments] and");
	
	output(" striding up behind her lovely, large rump. Reaching out, you hold your hand in front of her dusky equine slit. Her radiant warmth warms your palm, particularly with each whumphing flare of her");

	if(ainaIsInHeat()) output(" moist");
	else output(" velvety");
	
	output(" hind-lips.");
	output("\n\n<i>“O-oh, what um, </i>exactly<i> did you have in mind?”</i> the honey-blonde centauress asks. She blushingly glances over her shoulder, straining to see what you’re going to do with her rump.");
	output("\n\nYou grin and slide your hand down and out of her sight. Slowly and sensually, you trail your fingertips up her lush lower lips. Aina trembles against your tracing hand, her horse-tail excitedly swishing about. Reaching down, you pointedly rub her thumb-sized clit. As soon as you do, her front knees buckle, and she presses her human-half against the couch, her gigantic equine butt in the air. Her flanks are trembling, and she’s whinnying in delight.");
	output("\n\n<i>“So, you like that?”</i> you ask, rubbing her womanly bud. It’s a rhetorical question; streams of slippery mare juice are drooling out of her swollen black-lipped sex, wetting the ground beneath her quaking thighs.");
	output("\n\n<i>“Y-yes!”</i> Aina whimpers, needily pressing her pussy back against your caressing fingers. You up the ante, sliding your fingers into her sloppy slit. There’s so little resistance that your whole <i>hand</i> is quickly swallowed up inside of her. God, she’s so fiercely hot and wet inside! Not only that, her walls are velvety soft and welcoming. They tease your trapped digits with their slippery soft feel, squeezing them with relish.");
	output("\n\nIf she thinks that feels good, the centauress has seen nothing yet. Making a fist, you thrust your whole arm inside of her");
	
	if(ainaIsVirgin()) output(". There’s a slight resistance, then a sudden give, and the virgin centauress gives a tiny squeal. As you slide into her unsullied depths right up to the elbow she gives a shivering moan, her cherry now taken!");
	else output(" right up to the elbow.");
	
	output(" She whinnies with delight as you rigorously piston her with it like a stallion’s cock. Sloppy wetness streams out from her pummeled pussy, providing more than enough lubricant for her fisting, and allowing you to get all the way inside her up to your shoulder. Stretching out your fingers, you tentatively caress her cervix, and she quakes and quivers in delight.");
	output("\n\n<i>“Whuh-what is that?! I-I feel!”</i> She doesn’t finish her sentence, instead abruptly cumming all over you! Streams of sloppy girl-spunk spray out all over your [pc.chest] and [pc.face]. Your arm is clenched and trapped as you’re utterly showered in her transparent lady juice. When she finally lets go, you’re soaked from head to toe, utterly reeking like a musky mare!");

	if(ainaIsVirgin())
	{
		output("\n\n<i>“M-my first time... I never knew proper mating could be so amazing,”</i> Aina blushes, absentmindedly tucking a messed-up lock behind her ear. <i>“I, um, I’m still feeling kind of lightheaded. Kind of floaty, even. Oh, the mess! Did I really leak out that much?!”</i>");
		output("\n\nLooking thoroughly embarrassed, the centauress grabs a vacuu-mop. <i>“Um, thank you so much. I really needed that. I-If you’re ever in the Res Deck again, maybe look me up? I’d be more than willing to fit you in... um, I mean have you over!”</i>");
		output("\n\nYou grin and grab your things, leaving Aina to clean up. Given how wet she was, you imagine it’s going to take quite a while.");
	}
	else
	{
		output("\n\n<i>“That was amazing... just like last time...”</i> Aina blushes, absentmindedly tucking a messed-up lock behind her ear. <i>“Um, you know, if you’re ever in Res Deck again, feel free to call around. I always love having you over... whether we’re talking or, you know, doing other things...”</i>");
	}
	
	ainaSexed(1);
	processTime(20 + rand(15));
	pc.changeLust(35);
	
	flags["AINA_LAST_DAY_RELIEVED"] = days;
	flags["AINA_LAST_HOUR_RELIEVED"] = hours;
	
	clearMenu();
	addButton(0, "Next", ainaMenu);
}

public function ainaSexedWithAnalWand():void
{
	clearOutput();
	showAina(true);
	
	output("Knowing that Aina likes sex toys, you offer to use them on her since she has trouble using them on herself. The blonde centauress blushes and squirms at your suggestion, but she doesn’t look unhappy.");

	output("\n\n<i>“");
	if(flags["AINA_SEXED_WITH_TOY"] == undefined) output("Really, you’d do that for me? I’d love that");
	else output("I’d love to fool around again. You’re way better with my toys than I am");
	output(",”</i> Aina exclaims, a little breathy with excitement.");
	
	output("\n\nYou both head to the bedroom, where she slips off her champagne-colored sweater. Her creamy breasts spring out and bounce a little; seems she’s not wearing a bra today! Her nipples are already stiff and puckered with excitement and her cute pink areolae are lightly crinkled. She clasps her hands down at her horse half. She inadvertently presses her slender arms against the sides of her breasts, pressing her well-rounded swells up and together in the process. You could throw a " + (isAprilFools() ? "dogecoin" : "credit") + " down that cleavage!");
	output("\n\nYou don’t get to enjoy the sight for nearly long enough, as Aina trots over to her special drawer and pulls out a number of toys. She places them one by one on the bed, then steps back, tucking back a blonde bang with a shy look.");
	output("\n\n<i>“So these are the toys you want to use?”</i> You ask, picking up the biggest object there; a translucent, eighteen inch horse-cock. It jiggles in your hand, but squeezing it you realize it’s actually got a lot of girth. Aina blushes and nods, squirming visibly on the spot.");
	output("\n\n<i>“Yes. Those are the ones I really want.”</i> She’s breathing a little heavily and her back-hoofs are trying not to stomp. You gesture for her to turn around and she obediently does so, backing back her chestnut colored rump. Her black-lipped horse sex is already dripping wet and gushing down her thighs. With her slick sex so close, you’re hit with a fresh wave of her musky scent. It’s a dizzying scent, one that you’re quickly intoxicated by!");

	if(pc.hasCock())
	{
		output(" Your [pc.cocks] immediately stiffen");
		if (pc.cocks.length == 1) output("s");
		output(" as you go into instant rut");
		
		if (pc.isTaur()) output(" as your equine instincts are stirred by the unmistakable scent of a needy mare");
		else output(", even though you’re not a centaur!");
	}
	else if(pc.hasVagina())
	{
		output(" Stimulated by her musk, your own [pc.pussies] quickly slicken");
		if(pc.vaginas.length == 1) output("s");
		output(" to match her own. As you wriggle your hips with delight, there’s a palpable squelching noise down below; she’s got you this wet this quickly?!");
	}
	
	output("\n\nShaking your head in an effort to think straight, you grab the synthetic stallion prick and begin coating it in slick, sticky lube. With burning cheeks, you press the tip of the flat-headed horse-cock against her donut-like anus, which pokes out from between her buttocks in a thick ring. It takes some effort to press it into her muscular sphincter, but once the saucer-like crown makes it in, it suddenly slides inside with no give! You almost stumble forward but manage to keep standing as she takes several inches all at once. The blonde centauress lets out a whinnying gasp and her front legs buckle, her massive equine rump still raised and half-filled with transparent horse-cock! You can see every detail of her rippled rectum wrapping around the thick yet transparent phallus, showing off the insides of her pink butthole in all its lewd glory. It’s surprisingly clean inside her ass! Her flaring pussy gets even wetter, spilling streams of musky girl-juice between her hind legs and splattering all over the floor.");
	output("\n\n<i>“Is it all in yet?”</i> She breathily asks, golden-hair loosened and pressed down towards the ground. Her swishing mare-tail is still lifted up with her rump, seductively impaled with the phallic protrusion. You shake your head and push in a few more inches, delighting in the very visible sight of the flat horse-head sinking further and further into the depths of her twitching rectum. The more you push, the sloppier and wetter her equine pussy gets, spilling everywhere as you finally bottom the eighteen-inch toy inside of her with a loud <i>plop</i>. Impossibly full with such a long, thick length of stallion cock, the honey-haired mare whinnies and wrings the toy’s entire length, her donut-like sphincter squeezing and stretching its base. She’s going at it so hard that you’re sure any man would have blown in her ass by now; as it is, the flexing toy is barely holding out!");
	output("\n\nYou pick up one of her magic wands and click it on, feeling it whir and buzz in your hand. You press the toy’s vibrating apple-sized head against her musky mare-sex and stroke it back and forth. Aina moans lewdly and rubs her juicy horse-snatch against the whirring tool in your hands. She’s melting and bucking back with animalistic need, the air almost steamy with her pussy warmth. You grab her horse-tail and lustily rub the quaking wand against her bulbous black clit and the chestnut centauress lets out a pleasured squeal. You can see the clenching of her inner ass through the translucent toy packing her mare pucker, lewdly milking the stallion length as if it were a real cock stuffed in her hindquarters!");
	output("\n\n<i>“Naughty girl, wringing that cock so well in your ass,”</i> you tease her, all the while stroking her dripping and flaring gash back and forth, and pressing against her clit. Aina’s whinnying with delight, front legs completely buckled, hind quarters raised, and her anus erotically squeezing the stallion-length toy. Drops of her hot mare juice splatter down the wand and down your arm. You’re lust-drunk on both her mare musk and you begin aggressively whizzing the toy along her slit like you’re fucking her with it, your other fist full of twitching tail. The centauress whines and bucks back against you, fucking you right back!");
	output("\n\n<i>“I’m, I’m going to cum!”</i> Aina squeals a few seconds before it happens. With quaking hind-legs, her sloppy slit flares and you’re utterly basted in thick gushes of her potent pussy juice, soaking you in her fragrant scent. As she splatters you in her girl-spunk, her donut-like anus clenches her butt-toy so hard it distorts in her rectum, warping in shape! Meanwhile your [pc.hips] shake uncontrollably as her intoxicating musk seizes your senses and sets off a full-body orgasm in");
	
	if(!(pc.lowerUndergarment is EmptySlot)) output(" your [pc.lowerUndergarment]");
	else output(" your nethers");
	
	output(", making you");
	
	if(pc.hasGenitals())
	{
		if(pc.hasCock()) output(" shoot your spunk");
		if(pc.isHerm()) output(" and");
		if(pc.hasVagina()) output(" splatter your nether lips with girl juice");
	}
	else output(" quake with delight");
	
	output(". Your equine lover twitches and then collapses in a sweaty mess. Thankfully she falls forward, so she doesn’t land on you!");
	
	output("\n\n<i>“That was amazing.");
	if(flags["AINA_SEXED_WITH_TOY"] == undefined) output(" You’re so much better with my toys than I am");
	else output(" You’re amazing");
	
	output(",”</i> Aina blushes, tucking back her thoroughly messed up locks. It takes you both some time before you’re able to stand. Sniffing yourself, you realize your whole body reeks of mare musk! You’re pretty sure anyone within a mile could smell it.");
	
	//Commented out since you do her in the butt and it shouldnt affect her vaginal virgnity.
	//ainaSexed(1);
	IncrementFlag("AINA_SEXED_WITH_TOY");
	applyAinaMareMuskEffect();
	
	flags["AINA_LAST_DAY_RELIEVED"] = days;
	flags["AINA_LAST_HOUR_RELIEVED"] = hours;
	
	processTime(20 + rand(15));
	pc.orgasm();
	
	clearMenu();
	addButton(0, "Next", ainaMenu);
}

//BreedHer
// PC must have cock.
// Must Be Taur
// Cock must be 5 inches or longer.
public function breedAinaAsATaur():void
{
	clearOutput();
	showAina(true);

	var x:int = pc.cockThatFits(2000);
	if(x < 0) x = pc.smallestCockIndex();

	//Aina'sNotInHeat:
	if(!ainaIsInHeat())
	{
		output("You lock eyes with the blonde centauress and begin to trot towards her. Her pale cheeks flush and she begins to clomp self-consciously on the spot. She seems to be getting worked up by your proximity. You’re hit out of nowhere with the scent of her musky mare-snatch, but she’s not in heat! Noticing your look of surprise, she fidgets awkwardly on the spot.");
		output("\n\n<i>“I-I can smell you. You know, as " + pc.mf("a stallion","another centaur") + ". It’s getting me a little worked up,”</i> Aina confesses. Her equine tail is unconciously flicking and sweeping her fragrant pussy-scent all about, making things even worse! Suddenly her equine rump is looking <i>really</i> attractive and thoroughly mountable...\n\n");
	}
	output("You can’t stand it any longer. With a loud primal whinny of your own, you rear up and raise your forelegs, staggering forward and dropping your upper body on the pretty mare’s lower back.");
	output("\n\n<i>“Wha-what are you doing?!”</i> Aina breathily exclaims. You don’t even hear her; your mind is too consumed with");
	if(pc.isCentaur() || pc.cocks[x].cType == GLOBAL.TYPE_EQUINE) output(" equine");
	else output(" carnal");
	output(" instinct to mount and mate with the ");
	if(ainaIsVirgin()) output("virgin");
	else output("slutty");
	output(" mare. A single forceful thrust later, and you’re plunging yourself between her silky black cunt-lips, relishing in the silky feel of her sloppy sex swallowing your [pc.cockHead " + x + "]. ");
	if(ainaIsVirgin()) output("There’s a slight resistance, then a sudden give, and the virgin centauress gives a tiny squeal. As you slide into her unsullied depths, she gives a shivering moan, mounted by a stallion for the very first time!");
	else 
	{
		output("Aina’s cunt is so wet, warm, and welcoming! You’re pressed ");
		if(pc.balls > 0) output("[pc.balls]-deep");
		else output("base-deep");
		output(" inside of her in no time at all. Her body-temperature is much higher than a human’s; it feels like you’re going to melt just being sheathed inside her exquisite equine snatch.");
	}
	pc.cockChange();

	output("\n\nIntoxicated with pleasure and the scent of her musk, you buck and slap your lower body against her madly wiggling backside. With each squelching thrust, your [pc.cockNoun " + x + "] sends streams of her pussy-juice flowing out of her flaring honeypot, splattering the ground between her trembling taur-thighs. You can feel her swishing horse-tail brushing your animal belly with each carnal thrust.");

	output("\n\nSoon that massive rump of hers is bucking back needily against you as she meets your mighty thrusts. Both of your bodies are covered in a fine sheen of sweat from your mating rhythm. Flushing with delight, the centauress hastily strips off her sweater and presses her smooth back against your chest, rubbing almost insistently against you. Satisfying her human half, you fiercely seize her breasts in your hands, and she lets out a whinnying gasp of delight. Every time you pinch and roll her pert pink nipples, her sloppy quim hotly gushes and squeezes your stirring rod, coaxing hot pre into her juicy tunnel. Neither of you could stop even if you wanted to, your animal halves grinding and slapping against each other with carnal need.");

	output("\n\n<i>“Breed me!”</i> Aina sweetly cries, creaming herself once more around your [pc.cock " + x + "]. She’s shaking and stomping her hooves against the ground, thermal girl-juice basting and bathing your loins as she excitedly cums. Her slippery cunt is clamping down and wringing your whole twitching length, her muscular rings working you over from tip to base. With a final thrust, you bury your [pc.cockHead " + x + "] deep inside of her sloppy quim, your eyes rolling back as you unload your [pc.cum] inside her musky tunnel. Your seed spills upwards and into her equine womb, ");
	//SmallCum::
	if(pc.cumQ() < 400) output("lightly bathing her eggs");
	//Mid:
	else if(pc.cumQ() < 6000) output("filling it to the brim");
	//Large: 
	else output("swelling both it and her belly");
	output(" with your tauric seed.");
	if(pc.hasKnot(x)) output(" Your knot swells inside of her copious cunt and keeps you locked in place until you’ve unloaded every last drop, trapping it inside for maximum mating success!");
	
	output("\n\nWhen you dismount and ");
	if(pc.hasKnot(x)) output("<i>finally</i> ");
	output("pull out, there’s a loud ‘plop’, and the mixture of your spunk and her fragrant fem-cum leaks out from her dusky mare snatch. The centauress lets out a dreamy sigh and turns around, hand stroking through her hair, another clasped modestly in front of her creamy, youthful breasts.");

	//First Time:
	if(ainaIsVirgin())
	{
		output("\n\n<i>“M-my first time... I never knew proper mating could be so amazing,”</i> Aina blushes, absentmindedly tucking a messed-up lock behind her ear. <i>“I, um, I’m still feeling kind of lightheaded. Kind of floaty, even. I think maybe I should sit down? Oh, the mess! Did I really leak out that much?!”</i>");
		output("\n\nLooking thoroughly embarrassed, the centauress grabs a vacuu-mop. <i>“Um, thank you so much. I really needed that. I-If you’re ever in the Res Deck again, maybe look me up? I’d be more than willing to fit you in... um, I mean have you over!”</i>");
		output("\n\nYou grin and grab your things, leaving Aina to clean up. Given how wet she was, you imagine it’s going to take quite a while.");
	}
	//Repeat:
	else
	{
		output("\n\n<i>“I-I can’t believe you just mated me out of the blue like that,”</i> Aina blushes, absentmindedly tucking a messed-up lock behind her ear. <i>“Um, you know, if you’re ever in Res Deck again, feel free to call around. I always love having you over... whether we’re talking or, you know, doing other things...”</i>");
		output("\n\nYou nod and grab your things. Your whole body reeks of mare musk! You’re pretty sure anyone within a mile could smell it.");
	}

	// Apply 'Mare Musk' effect to player.
	// Count Aina as now deflowered, if not already.
	// Scene end. Exit her menu. Still in apartment.
	ainaSexed(1);
	
	flags["AINA_LAST_DAY_RELIEVED"] = days;
	flags["AINA_LAST_HOUR_RELIEVED"] = hours;

	processTime(17);
	aina.loadInCunt(pc, 0); //overridden function in Aina.as
	pc.orgasm();

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Aina
// Add Dresser option to her house menu once you've got access to it. Disappears once you obtain her panties.
//[Dresser]
//tooltip.Dresser: Check out her dresser.

//Dresser
public function ainasDresser():void
{
	clearOutput();
	showName("AINA’S\nDRESSER");
	author("ASpoopyGhost");
	output("You make up an excuse to look in Aina’s dresser, saying that you want to check how her toy’s doing. The blonde centauress blushes and nods, busying herself in the kitchen, while you check through her drawers.");
	if(silly) output(" It’s an adventurer’s privilege to rummage through civilian’s belongings!");
	output("\n\nYou’re a little surprised to find out she has an underwear drawer with not just bras but panties in them, and they’re huuuge! You pull out a pair of striped green and white bikini briefs, though they’re wider than most people’s shoulders to fit over her massive equine rump. Not only does she have centaur underwear, the cotton crotch fabric is a bit damp. It’s heavy with her dizzying mare musk, making you horny just <i>holding</i> them...");
	output("\n\n...What do you do?");
	pc.changeLust(10);
	processTime(2);
	//[AskToKeep] [Steal] [PutBack]
	clearMenu();
	addButton(0,"AskToKeep",askToKeepAinaPanties,undefined,"AskToKeep","Well, you can at least be polite about being pervert.");
	addButton(1,"Steal",stealAinasPanties,undefined,"Steal","It’s not like she bothers to wear them. What a <b>mischievous</b> thing to do!");
	addButton(2,"Put Back",putThePantiesBack,undefined,"Put Back","This was probably a bad idea.");
}

//AskToKeep
public function askToKeepAinaPanties():void
{
	clearOutput();
	showAina();
	author("ASpoopyGhost");
	output("You walk back into the living area and boldly ask the blonde student centauress if you can keep her unmentionables for yourself. Aina gapes at you for a moment, before her brain catches up and her cheeks flush.");
	output("\n\n<i>“Um, well, there’s no reason you can’t? I mean... you’ve really helped me out, so... I don’t wear them often anyway. I tried wearing them before, but I got too wet ");
	if(ainaIsInHeat()) output("from heat");
	else output("thinking about... stuff");
	output(".”</i>");
	output("\n\nYou take that as a ‘yes’ and pocket her extra-large centaur panties. Now you can enjoy her musky pussy wherever you go!");
	output("\n\n<b>You have acquired Aina’s panties!</b>");
	pc.createKeyItem("Panties - Aina's - Extra-large, striped green centaur panties.");
	// Return to room desc.
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Steal
public function stealAinasPanties():void
{
	clearOutput();
	showName("AINA’S\nPANTIES");
	author("ASpoopyGhost");
	output("You discreetly pocket Aina’s musky panties for your own use. It takes you a moment to sneak her extra-large unmentionables away. When you walk out, she seems none the wiser. You notice that even though you can smell her mare pussy scent from a mile off, she seems to be unable to smell her own scent.");
	output("\n\n<b>You have acquired Aina’s panties!</b>");
	pc.createKeyItem("Panties - Aina's - Extra-large, striped green centaur panties.");
	pc.addMischievous(5);
	// Return to room desc.
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//PutBack
public function putThePantiesBack():void
{
	clearOutput();
	showName("AINA’S\nDRESSER");
	author("ASpoopyGhost");
	output("You decide to put her panties back and leave the room.");
	// Return to room desc.
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}