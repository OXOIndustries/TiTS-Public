/*
 * Chief Ushamee Neykkar - The Lusty Bugpony's Canadian Vacation
 *
 * #Flags:
 * USHA_MET3		1 if met Ushamee in Room 3, else undefined
 * USHA_STATE		1 == LoverChief, 2 == ChiefWantsItBad, else undefined
 * USHA_SEXED		0-INFINITY, undefined if never sexed 
 */

public function ushameeMeetInviteText():String
{
	var buff:String = "";
	
	buff += "Captain Steele,";
	buff += "\n\nI hope this finds you in continued good health. The med-techs at your company have just cleared me of any signs of infection. Whatever that thing was on <i>Kashima</i>, ";
	if (flags["KASHIMA_OUTCOME"] == 1) buff += "we definitely killed it. Thank all the stars for that. ";
	else buff += "they say they've fully removed it. Hopefully right into the ship's incinerator! ";
	buff += "\n\nWe have a dish on Leitha called <i>reshinn</i> that looks a lot like those slug... tentacle... things... that were coming out of people aboard the ship. Used to be my favorite snack, but I went to go get a bowl of it as soon as I got out of medical and just about threw up at the sight of them. Damn it all.";
	buff += "\n\nConsidering what happened on the <i>Kashima</i>, Nova Security has decided that me and my patrol need an extended vacation. I can't exactly disagree, though I hope that's not a prelude to getting rolled out of the company. Wouldn't be surprised, though.";
	buff += "\n\nAnyway, I'm going to be visiting my brother on Canadia Station for the next while. Come by if you get a chance... we should talk about what happened.";
	buff += "\n\nSincerely,";
	buff += "\nUsha";
	
	return buff;
}

public function ushameeAtRoom3():Boolean
{
	if (MailManager.isEntryViewed("ushamee_meet") && flags["USHA_MET3"] == undefined) return true;
	return false;
}

public function ushameeCanadiaCorridorBonus(btnSlot:int = 0):void
{
	if (!ushameeAtRoom3()) return;
	
	output("\n\nYou see the familiar, burly figure of an amazonian space-centauress at the end of the corridor, currently locked in an argument with a slender local deer-taur boy. Chief Neykkar is shouting and gesticulating wildly, bellowing into the young man's face. He shrinks back from the towering 'taur, clutching a datapad to his uniform's chest.");
	
	addButton(btnSlot, "Ushamee", approachUshameeCorridor, undefined, "Ushamee", "Go talk to the Chief and see what's going on.");
}

public function ushameeAtBar():Boolean
{
	if (flags["USHA_MET3"] != undefined) return true;
	return false;
}

public function ushameeCanadiaBarBonus(btnSlot:int = 0):Boolean
{
	if (!ushameeAtBar()) return false;
	
	output("\n\nUsha Neykkar is sitting in a taur-accessible booth near the back of the bar, enjoying a drink and watching the latest leithan all-terrain dash competition on a holopad. Even without her armor and machine gun, she's still an imposing figure whose sheer size makes her seem to loom over the entire bar, even the other tauric patrons.");

	addButton(btnSlot, "Ushamee", mainMenuUsha);
	
	return true;
}

public function approachUshameeCorridor():void
{
	clearOutput();
	clearMenu();
	//Defined in kashimaIncident.as
	chiefNeykkarHeader();
	
	output("<i>“Look you little bastard, I said check again!”</i> the leithan amazon growls, grabbing the deer-bodied 'taur by the collar of his uniform. <i>“So check!”</i>");
	output("\n\n<i>“I'm... I'm sorry, miss,”</i> the young buck whimpers, squirming against her grasp. <i>“It's like I said, there's no ship by that name registered at the docks. I'm sorry, but I can check fifty times and it won't just magically appear!”</i>");
	output("\n\nThe chief snarls, but releases her grasp on his shirt and shoves him back. <i>“Idiot. I'll go look my own damn self.”</i>");
	output("\n\nShe scowls and canters around towards the docks, starting to walk your way. It takes her a moment for her haze of rage to clear enough to look up and recognize you standing in her way, watching the whole affair.");
	output("\n\n<i>“Oh, it's you! Steele!”</i>");
	output("\n\nThe scowl on her face disappears in an instant, replaced with a toothy smile. <i>“You actually got my email, huh? Good. Hey, look, did you see a ship -- the </i>Raggedy Mare<i> -- on your way in?”</i>");
	output("\n\nAs if on cue, the deer-morphed guy she was talking to scurries off down the corridor out of sight. You consider for a moment, then shake your head. Not that you pay much attention to the other registries in port, but you sure don't remember a ship by <i>that</i> name.");
	output("\n\n<i>“Dammit. Shit!”</i> she snaps, kicking one of the walls with a middle leg. Her claws dig into the metal of the docking port, and her arms cross under her chest. <i>“Sorry, it's my brother's ship. He's got a wife down on Vesperia, and the lazy ass is <b>supposed</b> to be here yesterday, but...”</i>");
	output("\n\n<i>“Sorry,”</i> you say with a shrug, putting a hand on the chief's flank. She heaves out a long sigh and turns back towards the interior of the station, scaly tail coiling around one of her hexapedal legs. <i>“So, you wanted to talk?”</i>");
	
	addButton(0, "Next", approachUshameeCorridor2);
}

public function approachUshameeCorridor2():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader();
	
	currentLocation = "CANADA5";
	generateMap();
	
	output("The leithan woman guides you over to ");
	if (flags["MET_KALLY"] != undefined) output("the lodge");
	else output("a wood-fronted tavern down the hall, calling itself the Kui Country Bar & Lounge,");
	output(" and takes you to a 'taur-accessible booth near the back. ");
	if (flags["MET_DEL_SHEMALE"] == undefined) output("One of the serving staff ");
	else output("Del ");
	output("quickly comes over and takes a drink order from you both before leaving you in peace with the brawny space-centauress. Once she's settled in one her haunches, the chief reaches up and yanks off the elastic tie holding her ebony locks back in a ponytail. Her luxuriously long hair comes spilling down around her shoulders, drawing your attention to the fact that she's not wearing the armor you remember from your first meeting, but rather a white t-shirt with a picture of a railgun printed atop her ample rack underneath an unbuttoned red flannel shirt, and a blanket made of blue denim wrapped over her bestial lower half.");
	output("<i>“Yeah, I was hoping we could talk. About what happened, and um... what we did.”</i>");
	output("\n\nThe last few words there cause a dark, purplish flush to spread across her cheeks. Your mind immediately flashes back to those last, involuntarily intimate moments aboard the ship, with the parasites wriggling inside of the chief's gravid belly, peeking their tentacle-like appendages back out of her chocolate-hued pussy. The two of you certainly found a rather lewd way of dealing with her overwhelming parasite problem.");
	output("\n\n<i>“Yeah, we sure did,”</i> she chuckles, rubbing at one of her plated ears. <i>“I just... shit, look, I wanted to say thanks, first of all. I don't think me or my guys would have made it out of there without you. I totally had you wrong when we first met, and now you saved my life. And you've seen a lot more of me -- a different side -- than even the people I've fought side by side with for years. I don't know whether to be incredibly embarrassed or seriously aroused by that.”</i>");
	
	//INSERT CHOICES
	addButton(0, "Embarrassed", embarassedUshamee, undefined, "Embarrassed", "A big, strong amazon like her shouldn't be showing that side off to you. What happened on the <i>Kashima</i> should stay there.");
	addButton(1, "Aroused", arousedUshamee, undefined, "Aroused", "That was certainly a side of her you'd like to see more of.");
	addButton(2, "No Idea", noIdeaUshamee, undefined, "No Idea", "You can't exactly speak for how Ushamee should feel.");
}

public function embarassedUshamee():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader();
	
	output("<i>“Embarrassed, probably,”</i> you answer. <i>“What happened back on the ship should probably stay there.”</i>");
	output("\n\nThe leithan woman sighs and bites her lip, averting her gaze. <i>“Ah, right. You're right, of course. Better to stay professional.”</i>");
	output("\n\nShe gives you a slight nod and then rests her hands on the table between you, wubbing her fingers together nervously. <i>“So, um, I'll be here around the station for a while if you want to talk about stuff in general, later. It's not like I have anywhere better to be on 'indefinite psychological leave.' Just don't expect me to be sober.”</i>");

	//Call menu function
	addButton(0, "Next", mainMenuUsha);
}

public function arousedUshamee():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader();
	
	output("Giving her your most charming smile, you tell the chief that you certainly liked seeing that side of her. And you gotta say: you wouldn't mind seeing it again, in less dire circumstances.");
	output("\n\n<i>“O-oh? Is that right?”</i> the chief grins, <i>“Well, I'd be lying if I said I wasn't hoping for that answer.”</i>");
	output("\n\nYou watch as her dusky skin flushes an even darker shade of purple. Usha gives you a surprisingly shy little smile, rubbing at one of her floppy ears and swishing her big reptilian tail against the booth. <i>“So, um, maybe sometime you and I could go somewhere, and see how that pans out.”</i>");
	output("\n\n<i>“You mean like a date?”</i>");
	output("\n\nUsha chuckles, glancing at you with those dark, starry eyes of hers. <i>“I guess so, huh? Could be fun to see how you handle yourself without an army of monsters on your heels.”</i>");
	output("\n\nAnd it might be fun to see how the chief handles you when she doesn't have a fuck-parasite squirming around inside her.");
	output("\n\n<i>“Then it's settled. We can talk about when and where soon -- I need a drink!”</i>");
	
	flags["USHA_STATE"] = 1;

	//insert menu
	addButton(0, "Next", mainMenuUsha);
}

public function noIdeaUshamee():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader();
	
	output("You answer with a shrug, saying that how she feels is up to her.");
	output("\n\n<i>“Well of course it is!”</i> she huffs, crossing her arms in a way that puffs out her already-big tits. <i>“And let me tell you, I'm a girl who knows what she wants! And what I want... is you. That's why I called you out here, and that's what I'm gonna get! So are you in, or am I gonna have to work at it until you give in?”</i>");
	output("\n\nNow that sounds more like the chief you remember. If you're onboard, maybe you out to ask her out. Or let her ask you out, whichever comes first.");
	
	flags["USHA_STATE"] = 2;

	//insert menu
	addButton(0, "Next", mainMenuUsha);
}

public function mainMenuUsha():void
{
	if (flags["USHA_MET3"] != undefined)
	{
		clearOutput();
		clearMenu();
		chiefNeykkarHeader();
		
		output("<i>“Back again?”</i> Usha says with a hungry little smile. <i>“Good to see you again, [pc.name]! Sit down, take a load off. Let me buy you a drink!”</i>");
		output("\n\nShe grabs ");
		if (flags["MET_DEL_SHEMALE"] == undefined) output("a passing waitress by the shoulder");
		else output("Del by the shoulder as [del.heShe] passes by");
		output(" and orders drinks for the both of you, giving you time to settle into the seat across from her. Once the drinks arrive, Usha turns back to you and dunks a straw into the bubbling black liquor she's ordered.");
		output("\n\n<i>“So, what's on your mind, [pc.name]?”</i>");
	}
	else flags["USHA_MET3"] = 1;
	
	addButton(0, "Date", dateUsha, undefined, "Date", "Dating a Bugpony.");
	if (flags["USHA_STATE"] != undefined && pc.lust() > 33) addButton(1, "Sex", sexUsha, undefined, "Sex", "See if the chief's up for a roll in the proverbial hay.");
	else if (pc.lust() <= 33) addDisabledButton(1, "Sex", "Sex", "You aren't turned on enough for this.");
	else addDisabledButton(1, "Sex", "Sex", "You should get to know her a little better.");
	addButton(14, "Leave", leaveUsha, undefined, "Leave", "Take your leave of the chief.");
}

public function dateUsha():void
{
	
}

public function sexUsha():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader();

	if (flags["USHA_SEXED"] == undefined)
	{
		output("<i>“So, do you have a place nearby we could get away to, just the two of us? Or maybe you'd rather come back to my ship?”</i>");
		output("\n\nThe chief grins, setting her drink down and drinking you in with those big, starry eyes of hers. <i>“Thought you'd never ask. Let's go back to your ship... my little room here's barely big enough for " + (pc.isTaur() ? "one 'taur" : "me") + ", let alone the two of us. Lemme just pick up our tab here...”</i>");
	}
	else
	{
		output("<i>“How 'bout we get out of here?”</i> you suggest, giving the chief your sauciest smile.");
		output("\n\n<i>“I was hoping you'd say that,”</i> she answers, her tail thrashing against the booth. <i>“Lemme grab the tab, and then you're all mine!”</i>");
		
	}
	output("\n\nUsha taps her Codex against a little display on the table, gives you a little nod, and stands, rising to her full amazonian height to " + (pc.tallness < 68 ? "tower over you" : "reach even your lofty stature") + ". Grinning, she " + (pc.isTaur() ? "offers you a hand, hooking her arm around yours. " : "pats her flank and kneels her rearmost legs down, making a clear invitation. You saunter over and swing your [pc.leg] over her plated rear, pulling yourself up onto Usha's back and wrapping your arms around her upper half's slender waist. ") + "The two of you trot on back towards the [pc.shipName], punctuating every twist and turn of the docking arms with gropes and teases, planting kisses all along the chief's neck and cheeks as you hold her close.");
	
	
	
	
	
	
	//add buttons here
}

public function leaveUsha():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader();
	
	output("<i>“I'll see you around, Usha,”</i> you say, standing.");
	output("\n\nThe leithan girl sighs and flicks a lock of raven hair behind one of her tapered ears. <i>“Aww, going already? Nice talking to you, [pc.name]. I'll be here if you need me.”</i>");
	output("\n\nShe gives you a nod and raises her glass... before knocking back what's left in one go.");
	
	addButton(0, "Next", mainGameMenu);
}