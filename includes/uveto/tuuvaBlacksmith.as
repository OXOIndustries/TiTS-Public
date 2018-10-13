//Tuuva: Korgonne Blacksmith
//By QuestyRobo

/*
//Frostbane Plate
//Short: FrostPlate
//Description: A suit of heavy plate mail, woven from frostwyrm scales and metal plating, and padded with heavy hides and furs.
//Tooltip: A suit of white dragon scales woven with thick, metal plates into heavy, protective plate mail. Several layers of fur and hide line the entire inside, filling in any holes in the joints. It’s not what you’d call maneuverable, and would only be sexy to a medieval cavalry fetishist, but that’s not really the point.
//Defense = 11
//Evasion = -5
//Sexiness = -2
//Fortification = 30
//Resistances:
//Freezing = 50%
//Burning = -20%
//Nullifying

//Frostbane Mail
//Short: FrostMail
//Description: A suit of white scalemail, woven from frostwyrm scales.
//Tooltip: A suit of white scalemail overtop a thick, hide jacket. Lightweight and maneuverable, while also providing a good deal of protection, especially against the cold.
//Defense = 8
//Resistance
//Freezing = 25%

//Frostbane Bikini
//Short: FrostBkini
//Description: A sling bikini made from frostwyrm scales and strips of fur hide.
//Tooltip: It’s hard to believe that you used the scales of a legendary creature to make a sling bikini, but here you are. A split strip of sleek, white dragon scale, held together with fur hide, that has just enough material to cover your [pc.crotch] and [pc.nipples] and barely a few inches more.
//Defense = 3
//Sexiness = 8
//Evasion = 10

*/

//Affection
//Tuuva has a basic affection system that scores from 0-100.
public function tuuvaAffection(change:Number = 0):Number
{
	if(flags["TUUVA_AFFECTION"] == undefined) flags["TUUVA_AFFECTION"] = 0;
	if(change != 0)
	{
		flags["TUUVA_AFFECTION"] += change;
		if(flags["TUUVA_AFFECTION"] < 0) flags["TUUVA_AFFECTION"] = 0;
		// Cooldown to prevent auto events from triggering automatically. (3 hours?)
		pc.createStatusEffect("Tuuva Affection Cooldown", 0, 0, 0, 0, true, "", "", false, 180);
		pc.setStatusMinutes("Tuuva Affection Cooldown", 180);
	}
	var bonus:Number = 0;
	if(flags["TUUVA_SELF_TALK"] != undefined) bonus += 5;
	if(flags["TUUVA_SMITHING_TALK"] != undefined) bonus += 5;
	if(flags["TUUVA_SCAVENGING_TALK"] != undefined) bonus += 5;
	if(flags["TUUVA_DICK_TALK"] != undefined) bonus += 5;
	//75 Affection cap if "just friends".
	if(flags["TUUVA_AFFECTION"] + bonus > 75 && flags["TUUVA_75AFF"] == -1) return 75;
	//100 Affection cap!
	if(flags["TUUVA_AFFECTION"] + bonus > 100) return 100;
	return flags["TUUVA_AFFECTION"] + bonus;
}
public function tuuvaLover():Boolean
{
	return (flags["TUUVA_75AFF"] == 1);
}
public function tuuvaCredits(arg:Number = 0):Number
{
	if(flags["TUUVA_CREDITS"] == undefined) flags["TUUVA_CREDITS"] = 0;
	if(arg != 0)
	{
		flags["TUUVA_CREDITS"] += arg;
		if(flags["TUUVA_CREDITS"] < 0) flags["TUUVA_CREDITS"] = 0;
	}
	return flags["TUUVA_CREDITS"];
}
public function showTuuva(nude:Boolean = false):void
{
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	showName("\nTUUVA");
	var horseS:String = (nude ? (tuuva.hasCock(GLOBAL.TYPE_EQUINE) ? "_HORSE" : "") : "");
	showBust("TUUVA"+horseS+nudeS);
	author("QuestyRobo");
}

public function tuuvaExpeditionRescueChance():Boolean
{
	if(pc.hasKeyItem("Korgonne Medical Kit"))
	{
		//-20% chance to start, increases 1% for every chance. You'll get her eventually!
		var bonus:Number = flags["TUUVA_SAVED"] * -1;
		if(rand(100) <= -30 + bonus) 
		{
			tuuva50AffFindEvent();
			return true;
		}
		else flags["TUUVA_SAVED"] += -1;
	}
	return false;
}

public function tuuvaPooped():Boolean
{
	return pc.hasStatusEffect("Tuuva Pooped");
}


//Earthshapers
public function tuuvaBlacksmithShopBonus():Boolean
{
	output("The inside of the blacksmith’s shop is the definition of rustic. The walls are made of worn, uneven stone, with only small, bone sconces bearing dim torches to break it up. The floors are more polished, but are still notably worn and gritty, with only a few scattered pelts to keep walking on it from being painful. The store is separated into at least two chambers; the one you’re in, which is largely empty, sans a set of training dummies and a few sets of weapons and armor put on display, and what you can only assume is the forge, separated from the front room by a solid wall with a small door and a serving window.");
	//Shop Options
	//Affection Events
	//======================
	//25: First Fuckings
	//Triggers when entering the shop after reaching 25 Affection
	//Replace text after shop description in Earthshapers section
	if(tuuvaAffection() >= 25 && flags["TUUVA_25AFF"] == undefined && !pc.hasStatusEffect("Tuuva Affection Cooldown") && !tuuvaPooped())
	{
		showName("\nEMPTY?");
		output("\n\n<b>Tuuva doesn’t seem to be in at the moment.</b> Strangely, the door into the forge area is slightly open, and you can hear something stirring in the back. Maybe you should go investigate?");
		//[Backroom] Go into the forge area to investigate the strange noises.
		addButton(0,"Backroom",tuuvaBackroomEvent,undefined,"Backroom","Go into the forge area to investigate the strange noises.");
		return false;
	}
	//50: Expedition & Refinding!
	//============================
	//Start expedition!
	if(flags["TUUVA_50AFF"] == undefined && tuuvaAffection() >= 50 && !pc.hasStatusEffect("Tuuva Affection Cooldown") && !tuuvaPooped())
	{
		tuuva50AffectionExpedition();
		return true;
	}
	//Tuuva expedition faaaail notice!
	if(flags["TUUVA_50AFF"] != undefined && flags["TUUVA_50AFF"] + 24*60 < GetGameTimestamp() && flags["TUUVA_SAVED"] == undefined)
	{
		showBust("KORGONNE_MALE");
		showName("OH\nNO!");
		output("\n\nYou enter the shop, expecting to see Tuuva, but instead it’s still cold and empty. You yell out to see if she’s just sleeping, but get no answer. You start to leave, hoping that it’s just a delay, rather than the worst, only to be met by one of the men from the expedition party.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Y-you Tuuva friend, yes?");
		else output("Y-you’re Tuuva’s friend from the other day, right?");
		output("”</i> You nod, a sense of worry bubbling up in your gut, one that’s justified by his next words. <i>“");
		if(!korgiTranslate()) output("S-she gone, big snow slide! Tuuva save me, but she fall in big hole. We make look parties, but none find yet. Please help!");
		else output("W-we lost her. I few of us got caught in an avalanche. Tuuva managed to save me, and the rest got out alright, but she fell down into a hole that was uncovered by the shaking. We’ve sent out search parties, but none of them have found her yet. Please, help find her, you’re her friend after all!");
		output("”</i>");

		output("\n\nWell great, turns out you’re clairvoyant, but only about the worst shit! Looks like you’re going to need to track Tuuva down. You ask for more information about where she could be, but all he tells you that she probably fell into an underground cave system, and that those can span a few miles. He <i>does</i> give you a medical kit for when you do find her, so that’s something at least.");

		//Get Emergency Medical Kit
		//Next part triggers randomly while wandering in the Snowbank, Lakeshore and Ice Ridge.
		pc.createKeyItem("Korgonne Medical Kit");
		output("\n\n(<b>Key Item Gained:</b> Korgonne Medical Kit!)");
		flags["TUUVA_SAVED"] = -1;
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return true;
	}
	//Shop empty during Tuuva expedition:
	if(flags["TUUVA_SAVED"] <= -1 || (flags["TUUVA_50AFF"] != undefined && flags["TUUVA_50AFF"] + 24*60 >= GetGameTimestamp())) 
	{
		output("\n\n<b>Tuuva is still out on her expedition</b>, and nobody has taken her place. You won’t be able to use the shop until she gets back.");
		return false;
	}
	//50 affection complete!
	if(flags["TUUVA_SAVED"] == 1 && !tuuvaPooped())
	{
		clearOutput();
		showTuuva();
		output("You walk into Earthshapers and are happy to see Tuuva back at the forge, working like she usually does. You stroll up to the counter and lean over, greeting the hard-working little pup. She returns your greeting by rushing up and pulling you into a big hug.");
		output("\n\n<i>“Thank you, thank you, thank you, thank you! ");
		if(!korgiTranslate()) output("Tuuva not even know what say");
		else output("I don’t even know what to say");
		output(", just... I-I... Thank you...”</i>");
		
		tuuvaAffection(15);
		
		output("\n\nYou tell her it was no problem, and that she’s very welcome. She still seems a bit uneasy about something, like there’s something she wants to say but can’t. It’s probably best not to push it, especially after everything she’s been through. She’ll say it when she wants to.");
		output("\n\n<i>“Did ");
		if(!korgiTranslate()) output("friend");
		else output("you");
		output(" want something");
		if(korgiTranslate() && tuuvaAffection() >= 25 && tuuvaAffection() < 75) output(", buddy");
		output("?”</i>");
		flags["TUUVA_SAVED"] = 2;
		//shop menu
		tuuvaMenu();
		return true;
	}
	//Normal Tuuva stuff
	//==============================
	//First time meeting :3
	else if(flags["MET_TUUVA"] == undefined) 
	{
		output("\n\nThere doesn’t seem to be anyone here, however there is a small bell hung in the window that you could ring.");
		addButton(0,"Bell",approachTuuva,undefined,"Bell","Ring the bell.");
	}
	else if(tuuvaPooped())
	{
		output("\n\nTuuva is still recovering from your last encounter.");
		addDisabledButton(0,"Tuuva","Tuuva","She’s going to need a little time to rest before talking with you again.");
	}
	else 
	{
		output("\n\nTuuva peers at you over the counter, ");
		if(tuuvaAffection() < 25) output("seeing if you approach or not");
		else if(tuuvaAffection() < 75) output("cracking a smile as she watches you");
		else 
		{
			output("looking at you with wide eyes as you hear her stout tail swinging rapidly");
			if(tuuva.hasCock(GLOBAL.TYPE_EQUINE)) output(", and the telltale thump of her [tuuva.cock] on the bottom of the counter");
		}
		output(".");
		addButton(0,"Tuuva",approachTuuva,undefined,"Tuuva","Approach the counter.");
	}
	return false;
}

//Bell
public function approachTuuva():void
{
	clearOutput();
	showTuuva();
	if(flags["MET_TUUVA"] == undefined)
	{
		output("You walk up to the bell and start to ring it, hoping to summon the shopkeep, only to jump in surprise as you hear a husky, screaming voice.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Tuuva here! You dumb, no ring bell!");
		else output("I’m right here you dope! Stop ringing the bell!");
		output("”</i> You look down and see a <i>very</i> small korgonne woman staring up at you, angrily. It’s no wonder you didn’t see her, she can’t even clear the counter! You open your mouth to say something, but she starts fuming before you can get a word out.");

		output("\n\n<i>“");
		if(!korgiTranslate()) output("S-Stool broken, Tuuva short, no bully!");
		else output("M-my stool is broken, okay? Just because I’m short doesn’t mean you can make fun of me!");
		output("”</i> You weren’t");
		if(pc.tallness < 4*12+4) output(", that’d be really hypocritical coming from you,");
		output(" but okay. You introduce yourself and tell her that you were actually hoping to buy something.");

		output("\n\nShe stands and stares at you for a moment before responding, ");
		//Doesn’t take credits:
		if(!korgiiCredits()) 
		{
			output("<i>“Okay, ");
			if(!korgiTranslate()) output("but Tuuva no take outsider money. Pay green rocks, get things, very happy.");
			else output("but your money isn’t any good around here. Give me Savicite and I’ll trade you for my wares.");
		}
		else
		{
			if(!korgiTranslate()) output("<i>“Chief say we take outsider money now. Still take green rocks, be happy, give monies.");
			else output("<i>“The Chief said we take your money now, I’ll still take any Savicite you give me though.");
		}
		output("”</i>");
		flags["MET_TUUVA"] = 1;
		//show Shop Options
	}
	//Tuuva
	//Affection 0-24:
	else if(tuuvaAffection() < 25)
	{
		output("Her expression stays largely blank as you walk up to the counter, just keeping her eyes locked onto you.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("What want?");
		else output("What do you want?");
		output("”</i>");
	}
	//25-74:
	else if(tuuvaAffection() < 75)
	{
		output("Her smile widens as you come closer, and you can hear the distinct sounds of a wagging tail.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Friend hi! What want?");
		else output("Hey buddy, need something?");
		output("”</i>");
		//Show Shop Options.
	}
	//75 and up:
	else
	{
		output("She almost hops in place as you come up, obviously excited to see you come back. You gasp as she reaches over the counter and gives you a big, meaty hug, and you are quick to return the favor");
		if(tuuva.hasCock(GLOBAL.TYPE_EQUINE)) output(", even as you feel her fully-erect horse meat whack into your [pc.belly]");
		output(". You stay like that for a blissful minute before Tuuva retreats back behind the counter, wordlessly staring into your eyes, waiting for you to say something.");
	}
	tuuvaMenu();
}

public function tuuvaMenu():void
{
	clearMenu();
	addButton(0,"Shop",tuuvaShopMenu,undefined,"Shop","Peruse her wares.");
	addButton(1,"Savicite",giveTuuvaSavicite,undefined,"Savicite","Turn in your collected Savicite");
	addButton(2,"Talk",tuuvaTalk,undefined,"Talk","Get to know the small-statured smith.");
	if(silly) addButton(3,"Appearance",tuuvaAppearance,undefined,"Appearance","Creepily stare at her for an awkward amount of time so you can meticulously list her physical features.");
	else addButton(3,"Appearance",tuuvaAppearance,undefined,"Appearance","Looks over Tuuva’s appearance.");
	if(tuuvaAffection() >= 25 && flags["TUUVA_25AFF"] != undefined)
	{
		if(pc.lust() >= 33) addButton(4,"Sex",tuuvaSexTimes,undefined,"Sex","<i>Peruse</i> her “wares”.");
		else addDisabledButton(4,"Sex","Sex","You aren’t turned on enough for this.")
	}
	else addDisabledButton(4,"Sex","Sex","Doesn’t seem like she’s the kind to bang complete strangers, at least not if they’re an outsider.");

	//Special Talk Options
	//[Scales] You have a pile of frostwyrm scales, and she seems like she’d know what to do with them.
	if(tuuvaAffection() >= 75 && flags["TUUVA_75AFF"] == undefined) addButton(5,"Feelings",tuuva75AffectionProc,undefined,"Feelings","She seems really uneasy about something. You should ask her about it.");
	else if(tuuvaAffection() >= 100 && flags["TUUVA_DATE"] == undefined && tuuvaLover()) addButton(5,"Date",dateTalkOption,undefined,"Date","You’ve gotten pretty close. Maybe it’s time to do something special with her.");
	else if(pc.hasKeyItem("Frostwyrm Scales")) addButton(5,"Scales",giveTuuvaFrostwormScales,undefined,"Scales","You have a pile of frostwyrm scales, and she seems like she’d know what to do with them.");
	else addDisabledButton(5,"Special","Special","There aren’t any special events you can do with her right now.");
	if(flags["SEXED_TUUVA"] != undefined) addButton(6,"PB Cookie",pbcookie4Tuuva,undefined,"PB Cookie","You wonder how much Tuuva would like to have a peanut butter cookie.");
	else addDisabledButton(6,"Locked","Locked","You’ll need to have sex with her before you can do this.");
	addButton(14,"Leave",mainGameMenu);
}

//Shop Options.
//Shop Options
//[Shop] Peruse her wares.
//[Savicite] Turn in your collected Savicite
//[Talk] Get to know the small-statured smith.
//[Appearance] {Silly:Creepily stare at her for an awkward amount of time so you can meticulously list her physical features.}
//[Sex] <i>Peruse</i> her “wares”. //Unlocks after 25 Affection event. {Locked:Doesn’t seem like she’s the kind to bang complete strangers, at least not if they’re an outsider.}
//[Special] //Menu for her Affection events, when they become available, as well as handing in Frostwyrm scales.

//Talk Options
public function tuuvaTalk():void
{
	clearOutput();
	showTuuva();
	output("What would you like to talk to her about?");
	tuuvaTalkMenu();
}
public function tuuvaTalkMenu():void
{
	clearMenu();
	//output("\n\n" + tuuvaAffection());
	//[Herself] Start simple, ask about her. //Required for other talk scenes to become available.
	addButton(0,"Herself",talkToTuuvaAboutHerself,undefined,"Herself","Start simple and ask about her.");
	//[Smithing] Ask about the shop and what she does.
	if(flags["TUUVA_SELF_TALK"] != undefined) addButton(1,"Smithing",tuuvaSmithingTalk,undefined,"Smithing","Ask about the shop and what she does.");
	else addDisabledButton(1,"Smithing","Smithing","You should get to know a little more about her before getting into specifics.");
	//[Scavenging] Ask about her days scavenging.
	if(flags["TUUVA_SELF_TALK"] != undefined) addButton(2,"Scavenging",tuuvaScavenging,undefined,"Scavenging","Ask about her days scavenging.");
	else addDisabledButton(2,"Scavenging","Scavenging","You should get to know a little more about her before getting into specifics.");
	//[Dick] Ask about her extra equipment. //Requires 25 Affection event and Scavenging talk done. Hidden until requirements are met.
	if(flags["TUUVA_SCAVENGING_TALK"] != undefined && flags["TUUVA_25AFF"] != undefined) addButton(3,"Dick",talkToTuuvaAboutDicks,undefined,"Dick","Ask about her extra equipment");
	else addDisabledButton(3,"Locked","Locked","You don’t know her well enough for this.");
	//[Bigger.D] She’s looking for some quick and simple dick growth, ey? You might have the answer for that. //Requires 75 Affection event done and Dick talk done. Hidden until requirements are met. Requires a Synth Sheath.
	var bSynthSheath:Boolean = (CodexManager.entryUnlocked("SynthSheath"));
	if(tuuva.hasCock(GLOBAL.TYPE_EQUINE)) addDisabledButton(4,(!bSynthSheath ? "HorseCock?" : "SynthSheath"),(!bSynthSheath ? "Horse-Cock?" : "SynthSheath"),"She is already as big as she can be!");
	else if(flags["TUUVA_DICK_TALK"] != undefined && tuuvaAffection() >= 75) 
	{
		if(pc.hasItemByClass(HorseCock)) addButton(4,(!bSynthSheath ? "HorseCock?" : "SynthSheath"),biggerDForTuuva,undefined,(!bSynthSheath ? "Horse-Cock?" : "SynthSheath"),"She’s looking for some quick and simple dick growth, ey? You might have the answer for that.");
		else addDisabledButton(4,(!bSynthSheath ? "???" : "SynthSheath"),(!bSynthSheath ? "???" : "SynthSheath"),("You’ll need a " + (!bSynthSheath ? "special dildo" : "SynthSheath") + " in your inventory in order to help Tuuva get the bigger dick of her dreams."));
	}
	else addDisabledButton(4,"Locked","Locked","You need to know Tuuva pretty well and have an affection of 75 or more for this.");
	addButton(14,"Back",approachTuuva);
}

//Shop
public function tuuvaShopMenu(choice:String = ""):void
{
	clearOutput();
	showTuuva();
	if(choice == "" && korgiiCredits())
	{
		output("How do you want to pay?");
		//Line only shows up after credits are accepted.
		clearMenu();
		//[Credits]
		addButton(0,"Credits",tuuvaShopMenu,"credits","Credits","Shop using credits.");
		//[Savicite]
		addButton(1,"Savicite",tuuvaShopMenu,"savicite","Savicite","Shop using the value of any Savicite you’ve given her as a bargaining tool.");
	}
	else if(choice == "credits")
	{
		shopkeep = chars["TUUVA"];
		shopkeep.keeperBuy = "<i>“Come,";
		if(!korgiTranslate()) shopkeep.keeperBuy += " see Tuuva’s things!";
		else shopkeep.keeperBuy += " see what I have to offer.";
		if(silly) shopkeep.keeperBuy += " Masterworks all, you can’t go wrong!";
		shopkeep.keeperBuy += "”</i>\n";
		//Show inventory
		if(flags["GAVE_TUUVA_SCALES"] != undefined && flags["GAVE_TUUVA_SCALES"] + 24*60*7 < GetGameTimestamp())
		{
			if(!shopkeep.hasItemByClass(FrostbanePlate)) shopkeep.inventory.push(new FrostbanePlate());
			if(!shopkeep.hasItemByClass(FrostbaneMail)) shopkeep.inventory.push(new FrostbaneMail());
			if(!shopkeep.hasItemByClass(FrostbaneBikini)) shopkeep.inventory.push(new FrostbaneBikini());
		}
		buyItem();
	}
	else
	{
		output("<i>“Come,");
		if(!korgiTranslate()) output(" see Tuuva’s things!");
		else output(" see what I have to offer.");
		if(silly) output(" Masterworks all, you can’t go wrong!");
		output("”</i>\n\n<b>You have given Tuuva " + tuuvaCredits() + " credits worth of Savicite:</b>");

		clearMenu();
		tuuvaShopOption(0, new SaviciteLightMaul());
		tuuvaShopOption(1, new MasterworkYappiStrap());
		tuuvaShopOption(2, new KorgGreatBow());
		if(tuuvaCredits() < 7000)
		{
			setButtonDisabled(0);
			setButtonDisabled(1);
			setButtonDisabled(2);
		}
		//Frostwyrm shit!
		if(flags["GAVE_TUUVA_SCALES"] != undefined && flags["GAVE_TUUVA_SCALES"] + 24*60*7 < GetGameTimestamp())
		{
			tuuvaShopOption(3, new FrostbanePlate());
			tuuvaShopOption(4, new FrostbaneMail());
			tuuvaShopOption(5, new FrostbaneBikini());
			if(tuuvaCredits() < 42000)
			{
				setButtonDisabled(3);
				setButtonDisabled(4);
				if(tuuvaCredits() < 40000) setButtonDisabled(5);
			}
		}

		//Just disable the bowieeeee
		if(tuuvaCredits() < 8000) setButtonDisabled(2);
		addButton(14,"Back",approachTuuva);
	}
}
private function tuuvaShopOption(btnSlot:int, item:ItemSlotClass):void
{
	output("\n" + StringUtil.upperCase(item.description, false) + " - " + item.basePrice + " credits.");
	addItemButton(btnSlot, item, saviciteBuyFromTuuva, item);
}

public function saviciteBuyFromTuuva(arg:ItemSlotClass):void
{
	clearOutput();
	showTuuva();
	output("Tuuva reaches under the counter and comes up with " + arg.description + ". She hands it to you with a smile.");
	if(tuuvaCredits(arg.basePrice*-1) > 0)
	{
		if(!korgiTranslate()) output(" <i>“Having about " + tuuvaCredits() + " " + (isAprilFools() ? "dogecoins" : "core-credits") + " left for Tuuva-buy!”</i>");
		else output("\n\n<i>“You can still buy about " + tuuvaCredits() + " credits worth of inventory will that savicite you gave me earlier.”</i>");
	}
	output("\n\n");
	eventQueue.push(approachTuuva);
	quickLoot(arg);
}

//Savicite
//Given Savicite adds to a total score that can be used to buy items, and adds Affection at a rate of one point per two given in.
public function giveTuuvaSavicite():void
{
	clearOutput();
	showTuuva();
	output("<i>“");
	if(!korgiTranslate()) output("Got green rock? Give Tuuva!");
	else output("Got some savicite? Hand it over.");
	output("”</i>");
	clearMenu();
	//Options to give savicite here.
	if (pc.hasItemByClass(Savicite)) addButton(0,"Give 1",actuallyGiveSavicite,1,"Give 1","Give Tuuva one piece of Savicite.");
	else addDisabledButton(0,"Give 1","Give 1","You don’t have that much Savicite to give!");
	if (pc.hasItemByClass(Savicite,2)) addButton(1,"Give 2",actuallyGiveSavicite,2,"Give 2","Give Tuuva two pieces of Savicite.");
	else addDisabledButton(1,"Give 2","Give 2","You don’t have that much Savicite to give!");
	if (pc.hasItemByClass(Savicite,3)) addButton(2,"Give 3",actuallyGiveSavicite,3,"Give 3","Give Tuuva three pieces of Savicite.");
	else addDisabledButton(2,"Give 3","Give 3","You don’t have that much Savicite to give!");
	if (pc.hasItemByClass(Savicite,5)) addButton(3,"Give 5",actuallyGiveSavicite,5,"Give 5","Give Tuuva five pieces of Savicite.");
	else addDisabledButton(3,"Give 5","Give 5","You don’t have that much Savicite to give!");

	if (pc.hasItemByClass(Savicite)) addButton(4,"Give All",actuallyGiveSavicite,-1,"Give All","Give Tuuva all your Savicite.");
	else addDisabledButton(4,"Give All","Give All","You need at least some Savicite to do this!");
	addButton(14,"Back",approachTuuva);
}

public function actuallyGiveSavicite(arg:Number = 1):void
{
	if(arg == -1) arg = pc.numberOfItemByClass(Savicite);
	//Savicite valued at 12k. Tuuva gives almost full value for it. SQUANCH!
	tuuvaCredits(10000*arg);
	tuuvaAffection(arg*4);
	clearOutput();
	showTuuva();
	if(arg == 1) output("You hand over " + num2Text(arg) + " piece of Savicite. Tuuva smiles happily.");
	else output("You hand over " + num2Text(arg) + " pieces of Savicite. With each piece, Tuuva’s smile grows wider.");
	if(!korgiTranslate()) output(" <i>“That good stuff. Worth eh... " + arg*10000 + " of " + (isAprilFools() ? "dogecoins" : "core-credits") + " to Tuuva.”</i> She giggles. <i>“Dumb aliens always thinking in credits. Shine-rock better currency. You smart to use.”</i>");
	else output(" <i>“That’s good stuff. Worth about... " + arg*10000 + " of your " + (isAprilFools() ? "dogecoins" : "core-credits") + " to me.”</i> She giggles. <i>“Aliens are so goofy, working with that made-up currency. Dealing directly is such a better way to go about it, and it seems you agree.”</i>");
	
	output("\n\n");
	pc.destroyItemByClass(Savicite,arg);
	
	clearMenu();
	addButton(0,"Next",approachTuuva);
}

//Talk
//Each Talk option gives 5 Affection the first time it’s triggered

//Herself
public function talkToTuuvaAboutHerself():void
{
	clearOutput();
	showTuuva();
	output("<i>“Tell me about yourself.”</i>");
	output("\n\n<i>“...");
	if(!korgiTranslate()) output("Tuuva is Tuuva.");
	else output("I’m Tuuva.");
	output("”</i> Not really the answer you were looking for, obviously. You tell her that you were hoping to more than that.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Why nosey? Tuuva run buy things place, so why outsider no buy things?");
	else output("Why do you want to know? I’m running a store here, so why don’t you just buy something?");
	output("”</i>");

	output("\n\n<i>“");
	if(pc.isBimbo()) output("I just want to know thiiiiings, don’t be a meanie!");
	else output("What’s wrong with just chatting? I’m not trying to interrogate you or anything.");
	output("”</i>");

	output("\n\nShe pauses and glares at you. <i>“Fine, ");
	if(!korgiTranslate()) output("what pushy outsider want know");
	else output("what do you want to know");
	output("?”</i> You didn’t really have any specific questions in mind, kind of hard to when you don’t know anything about her.");

	output("\n\n<i>“Um, just give me the basics.”</i>");
	output("\n\nShe grumbles and sighs at that, but answers anyway. <i>“");
	if(!korgiTranslate()) output("Tuuva born here. Having two sisses and two brobros. Da ran store until give to Tuuva. Ma... not here no more. Gone long time ago.");
	else output("I was born here in the hold, naturally. I’ve got two sisters and two brothers. My dad used to run the store until he passed it down to me. Mom... isn’t with us anymore, she went a long time ago.");
	output("”</i>");

	//Did Buln’s Family talk:
	if(9999 == 0)
	{
		output("\n\n<i>“Wait, are you Buln’s daughter?”</i>");
		output("\n\nShe perks up when she hears her father’s name. <i>“");
		if(!korgiTranslate()) output("Oh, outsider know da? Maybe not so bad.");
		else output("Oh, you know dad? Maybe you’re not so bad.");
		output("”</i>");
	}
	//Else:
	else
	{
		if(pc.isBimbo()) output("\n\n<i>“Aww, that’s super sad!”</i> You reach over and give her a hug. Surprisingly she doesn’t resist, and you can even hear her sniffling before you put her down. Never a bad time for hugs!");
		else output("\n\n<i>“I’m sorry, that must’ve been hard.”</i>");

		output("\n\n<i>“");
		if(!korgiTranslate()) output("Tuuva get through, much time ago... wow...");
		else output("I got through it, it was a long time ago anyway.");
		output("”</i>");
	}
	output("\n\nShe pauses and sighs deeply. <i>“");
	if(!korgiTranslate()) output("No more sads. Before smith, Tuuva on scavenge team; find things, steal things, anything to get things. Da give shop when leave, Tuuva get used to it.");
	else output("Let’s stop talking about sad things. Before I got the shop, I was on a scavenge team. We’d go out and find, or steal whatever we thought would be useful. Dad gave me the shop when he retired. Took a bit, but I got used to it.");
	output("”</i>");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("No more talk, buy thing!");
	else output("That’s enough talking for now, buy something!");
	output("”</i>");
	flags["TUUVA_SELF_TALK"] = 1;
	processTime(15);
	clearMenu();
	addButton(0,"Next",tuuvaTalk);
}

//Smithing
public function tuuvaSmithingTalk():void
{
	clearOutput();
	showTuuva();
	output("You ask to know more about the shop and her profession.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Tuuva get shop from Da many year ago. Ma look so smiles when she see Tuuva work. Part of reason Tuuva agree take over was make her smiley. Now... no here....");
	else output("I got the shop from dad when he retired a long time ago. Mom looked so happy when she saw me working.... You know, part of the reason I agreed to take over was because it made her happy. But now... she’s gone....");
	output("”</i>");
	output("\n\nShe whimpers, but otherwise stays silent as she steadies herself.");

	output("\n\nTime to change the subject a bit. <i>“");
	if(pc.isBimbo()) output("You had, like, brothers and sisters and stuff, right? Why’d you do it?");
	else output("You agreed to be a blacksmith, so your dad picked you out of all your brothers and sisters?");
	output("”</i>");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Brobros and sisses... busy. Had bed buddies and little ones. Tuuva didn’t.");
	else output("My brothers and sisters, well, they were too busy with their families. I don’t have one, so here I am.");
	output("”</i> She doesn’t seem upset when she mentions her lack of family compared to her siblings.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Tuuva not have ma’s nicey nices, but Tuuva still sell lots of smacky-smacks, and blocky-bits. Make da proud, very happy, yay!");
	else output("I might not have mom’s charms, but I still sell a ton of weapons and armor. Dad’s been pretty happy, I’ll tell you that!");
	output("”</i> She strikes a prideful pose, at least, as much of one as you can see with her mostly hidden behind the counter.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Else things, Tuuva use lava forge, make things, many things. Korgo need more just smackies and stoppies; need sit-downs and sleeps, eaty tools, hold-up stuff. Tuuva make most shine when fancy-butts need special thing. Sparkly metal, very much cost.");
	else output("Anyway, I make things here using the lava forge. I make lots of things, after all we need more than just swords and armor. I make furniture and beds, utensils, structure supports. The big stuff comes from when the Elders ask for specialty stuff. They always ask for the real fancy metals, and I don’t trade those cheap.");
	output("”</i>");

	output("\n\nThat sounds like a lot of work. You ask if she does it all by herself.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Of sureness! Da come in and helps sometime, but Tuuva run shop alone... Tuuva... alone... I-is fine, Tuuva fine alone.");
	else output("Of course! Dad comes by to help out, sometimes, but I run this place by myself... a-all by myself... D-doesn’t matter, I’m doing fine by myself.");
	output("”</i>");

	output("\n\n");
	if(!tuuvaLover()) output("She grows very quiet, and you get the impression that she really wants to stop talking about this now.");
	else output("You reach over the counter, grab her face, and give her a big kiss, telling her she doesn’t have to be alone anymore. She starts sobbing and crying as you pull back from your kiss, excusing herself into the back so she can calm down. She comes back, absolutely beaming at you.");

	flags["TUUVA_SMITHING_TALK"] = 1;
	processTime(25);
	clearMenu();
	addButton(0,"Next",tuuvaTalk);
}

//Scavenging
public function tuuvaScavenging():void
{
	clearOutput();
	showTuuva();
	output("<i>“You used to be a ");
	if(pc.isBimbo()) output("sneaky finder person");
	else output("scavenger");
	output("?”</i>");

	output("\n\nShe perks up and smiles at your question. <i>“");
	if(!korgiTranslate()) output("Yeses, Tuuva one of best! Find many thing, scout lots stuff, wow.");
	else output("Yeah, and let me tell you, I was one of the best! I found tons of salvage, even scouted a good few locations.");
	output("”</i>");

	output("\n\n<i>“You were a scout too?”</i>");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Scavenge, scout, what difference? Tuuva go out find stuff, sometimes outsider stuffs, sometimes ores for mine boys.");
	else output("Scavenging, scouting, what’s the difference? When I went out, I looked for outsider tech, </i>and<i> ore veins for the mining teams.");
	output("”</i>");

	output("\n\nSounds dangerous. You ask if she had any close encounters.");

	output("\n\n<i>“Pft, ");
	if(!korgiTranslate()) output("big kitties too dumb to get Tuuva, and outsiders know nothings about hunting in snow place.");
	else output("the milodans weren’t smart enough to get me, and all the outsiders didn’t know anything about hunting in the tundra.");
	output("”</i> She says that, but she doesn’t sound quite convinced.");

	output("\n\n<i>“You sure?”</i>");

	output("\n\nShe looks offended at first, but you can see the confidence fading. <i>“...Okay, ");
	if(!korgiTranslate()) 
	{
		output("Tuuva might be lies, a bits. Tuuva was ore-looking in high-rocks, find big green rock, but big kitties find Tuuva. Run fast, but they catch. Then, big lizard show up, scare kitties, but also Tuuva. Make fun of Tuuva too! Say mean things about Tuuva being tiny, hate lizard!");
		//Given frostwyrm scales:
		if(flags["GAVE_TUUVA_SCALES"] != undefined) output(" But you kill, even give Tuuva lizard skin to make stoppies, so happy now.");
	}
	else 
	{
		output("maaaaybe I’m not telling you everything. One time I was out scouting for ore in the cliffs. I found a huge chunk of savicite up there, but a pack of milodans were guarding it, and they saw me. I tried to run away, but I wasn’t fast enough, and they caught me. I thought I was dead, or worse, but then that stupid frostwyrm showed up. It scared them off, but then it started fucking with me. It mocked me, told me I was too small to even be an appetizer! Then it just flew off, fucker!");
		//Given frostwyrm scales:
		if(flags["GAVE_TUUVA_SCALES"] != undefined) output(" I was so happy when you brought me its scales. Not just because I can make some damn good armor with it, but because I know it’s dead.");
	}
	output("”</i>");
	output("\n\nYou ask if she had more against it than just some insults.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Stupid lizard make it super hard to find stuffs. Always come down and get angry, never let us get good stuffs. Pain in booty!");
	else 
	{
		output("That dumb dragon ");
		if(flags["GAVE_TUUVA_SCALES"] == undefined) output("makes");
		else output("made");
		output(" it almost impossible to get any ore or salvage in its territory. Such a pain in the ass!");
	}
	output("”</i>");

	output("\n\n<i>“Is that it?”</i>");
	output("\n\n<i>“Yes, well");
	//Did Dick talk:
	if(flags["TUUVA_DICK_TALK"] != undefined)
	{
		output(" other than ");
		if(!korgiTranslate()) output("thing");
		else output("what we talked about");
		output(".");
	}
	else
	{
		output(", uh, nevermind, ");
		if(!korgiTranslate()) output("no important");
		else output("it’s not important");
		output(".");
	}
	output(" ");
	if(!korgiTranslate()) output("No more talks");
	else output("Enough talking for now");
	output(".”</i>");

	flags["TUUVA_SCAVENGING_TALK"] = 1;
	processTime(25);
	clearMenu();
	addButton(0,"Next",tuuvaTalk);
}

//Dick
public function talkToTuuvaAboutDicks():void
{
	clearOutput();
	showTuuva();
	output("Korgonne don’t have natural hermaphrodites, so you ask how she got her dick.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Not much say, Tuuva good scavenger, but maybe not much smart. Find outsider camp, no one there. Tuuva look through bags, find blue pointy. Tuuva not know what do with it so... Tuuva poke finger with it, and whoopsy-press button");
	else output("Not much to say, I was a good scavenger, but I’ll admit that I probably wasn’t the smartest one. I found an outsider camp, it looked like it was abandoned. I rooted through their bags, and I found a needle filled with blue stuff. I didn’t know what to do with it so... I poked my finger with it, and accidently pushed the button.");
	output("”</i>");

	output("\n\nOh.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Boy parts grow in quick. Tuuva scared at first. Mostly want snu-snu, but also scared. Tuuva later live with it. Thought other korg not like Tuuva cause of it, but they no mind.");
	else output("The dick and balls grew in really quick. I was scared shitless at first. I mean, I was mostly horny, but still scarred. I learned to live with it, though. I thought it would make me some kind of freak, but the others actually didn’t mind it that much.");
	output("”</i>");

	output("\n\n<i>“So, you’ve been fine with it?”</i>");

	output("\n\n<i>“");
	if(tuuva.hasCock(GLOBAL.TYPE_EQUINE))
	{
		if(!korgiTranslate()) output("Am now, since alien be helping.”</i>");
		else output("I am now, thanks to the help you gave me.”</i>");
		output("\n\nGood to hear.");
	}
	else
	{
		if(!korgiTranslate()) output("Sometimes wish it bigger, but no want more blue outsider juice, hear bad things about it. If Tuuva want bigger, she want quick, and she want simple, no drugs.");
		else output("Sometimes I wish it was a bit bigger, but I don’t want to go looking for anymore of that blue stuff, I hear bad things about it. If I wanted to make it bigger, I’d want it quick and simple, no drugs.");
		output("”</i>");
		output("\n\nQuick and simple, ey?");
	}
	flags["TUUVA_DICK_TALK"] = 1;
	processTime(25);
	clearMenu();
	addButton(0,"Next",tuuvaTalk);
}

//Bigger D
public function biggerDForTuuva():void
{
	clearOutput();
	output("She wants quick and simple dick growth, ey? Well you happen to have something right here that can give that. You take out a synth sheath and plant it on the counter in front of her.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("What this");
	else output("What is it");
	output("?”</i>");

	output("\n\n<i>“You said you wanted your dick to be bigger, right?”</i> She looks at you suspiciously.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("It toy");
	else output("It’s just a toy");
	output(".”</i>");

	output("\n\n<i>“Put it on, trust me.”</i> She rolls her eyes and takes the sheath, hopping down off her stool and coming out the door. She drops her apron, grabs the sheath and puts it over her puppy prick and balls, waving it around at you, mockingly.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Such big dick, Tuuva fuck lots, wow!");
	else output("Wow, I have such a big dick now, can’t wait to get to fucking!");
	output("”</i> She says sarcastically, to which you reply by just smiling. Your smile gets even wider when she tries to take it off.");

	output("\n\n<i>“C-come off, come off! C-com... c-cuuuuuum!”</i> She ends up tugging it so much that she orgasms through her newly minted horse prick. It drags on for about a minute, in which she manages to fill a small pool on the ground. She looks at you in shock, but that quickly fades to pure lust. <i>“Thaaaaank you!”</i> She looks like she’s either about to hug you or fuck your brains out, until she realizes something.");

	output("\n\n<i>“Wait, no knot. ");
	if(!korgiTranslate()) output("Tuuva fix");
	else output("I know how to fix that");
	output("!”</i> She hops back behind her counter and grabs something, something that you recognize as a Knot a Problem pill.");

	output("\n\n<i>“Outsider drugs ");
	if(!korgiTranslate()) output("not");
	else output("aren’t");
	output(" all bad. ");
	if(!korgiTranslate()) output("Come back in bit, Tuuva want alone time with new friend");
	else output("Come back in a while, I want to have some alone time with this new buddy");
	output(".”</i> With that, she pops the pill and rushes back to her room, the sounds of self-pleasure welling up almost immediately.");

	tuuva.cocks[0].cType = GLOBAL.TYPE_EQUINE;
	tuuva.cocks[0].cLengthRaw = 16;
	tuuva.cocks[0].cockColor = "black";
	tuuva.cocks[0].delFlag(GLOBAL.FLAG_TAPERED);
	tuuva.cocks[0].addFlag(GLOBAL.FLAG_BLUNT);
	tuuva.cocks[0].addFlag(GLOBAL.FLAG_FLARED);

	tuuva.ballSizeRaw = 13;
	tuuva.ballEfficiency = 800;
	tuuva.cumMultiplierRaw = 400;

	processTime(25);
	
	if(!CodexManager.entryUnlocked("SynthSheath"))
	{
		output("\n\nYour Codex beeps with a warning about how this device may irreversibly alter ones biology. You grimace ruefully at the device before regarding Tuuva’s enhanced genitalia.");
		CodexManager.unlockEntry("SynthSheath");
	}
	
	showTuuva();
	
	output("\n\n");
	pc.destroyItemByClass(HorseCock);
	
	//[Next] Puts you in the shop.
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Appearance
public function tuuvaAppearance():void
{
	clearOutput();
	showTuuva();
	output("You peak over the counter and get a good look at Tuuva.");
	output("\n\nShe’s wearing nothing but a big smithing apron, a pair of heavy-looking leather boots, and panties that obviously were no match for the size of her furry booty. A pair of long, leather gloves sits in a pocket on the apron, most likely used while she’s working the forge. Her fur coloration is a shade or two darker than you’re used to seeing, but not out of the ordinary. Her blonde hair is cut short in an almost military-like flat top. A big patch of white spreads from her chin down, and seems to wrap its way around her back, splitting the dark, brownish fur on her booty down the middle. Her big eyes are a bright hazel color.");
	output("\n\nShe’s a short, stocky girl, maybe just a tad under four feet tall. Not exceptionally short for a Korgonne, but still very much on the small side. Where her build is exceptional is in her ");
	if(silly) output("thiccness");
	else output("wide frame");
	output(". Her torso is like a curvaceous log, terminating in a substantial, meaty ass, paired with wide hips and ");
	if(silly) output("thicc");
	else output("substantial");
	output(" thighs, and a pair of huge, pillowy breasts. Her arms are appropriately large as well, looking perfect for ");
	if(pc.isBimbo()) output("giving big hugs");
	else output("smithing heavy metals");
	output(". Her tail is surprisingly large and voluminous, putting even a lot of larger korgonne to shame.");

	//No sexes yetses:
	if(flags["SEXED_TUUVA"] == undefined) output("\n\nYou can’t really see what she’s packing down south, but a slight bulge in her apron tells you that she might have a little extra down there.");
	else 
	{
		output("\n\nYou’ve been intimate with her enough to know what she’s packing down there.");

		//No Synth Sheath:
		if(!tuuva.hasCock(GLOBAL.TYPE_EQUINE)) output("\n\nShe’s packing an eight inch, black puppy dong, though it can get much larger over time, with a pair of balls about an inch and a half in diameter.");
		else output("\n\nShe’s packing a sixteen inch, black horse dong, though it can get <i>much</i> larger over time, with a sizeable knot, and a pair of huge horsey balls, about four inches in diameter.");
		output(" Underneath her maleness is a tubby little, chocolate colored pussy.");
	}
	clearMenu();
	addButton(0,"Next",approachTuuva);
}

//Sex
public function tuuvaSexTimes():void
{
	clearOutput();
	showTuuva();
	output("You lean over the counter and ");
	if(flags["SEXED_TUUVA"] == undefined) output("ask if Tuuva wants to get down and dirty again. She responds by leaping off her stool, slamming the door open and dragging you in. You’re feeling each other up before you even make it to her room, Tuuva ditching her apron in the middle of the floor.");
	else output("immediately lock lips with the little lady. She recoils in surprise at first, but quickly gets to returning the gesture, practically hopping into your arms as she gets the hint and starts leading you to her room. Your lips never leave each other’s grip, even as Tuuva discards her apron onto the floor of the forge area.");

	output("\n\nWhen you get to her room, she leaves your side and hops onto the bed, presenting herself for your enjoyment");
	if(!pc.isCrotchExposed() && !pc.isChestExposed()) output(", as you strip bare");
	output(". You watch her egg herself on, her [tuuva.cock] growing hard in seconds as she eagerly awaits what you’re going to do.");

	//Sex menu
	tuuvaSexMenu();
}

public function tuuvaSexMenu():void
{
	clearMenu();
	addButton(1,"Get Fucked",getFuckedByTuuva,undefined,"Get Fucked","Help her bury her bone.");
	if(pc.hasCock() && pc.cockThatFits(tuuva.vaginalCapacity(0)) >= 0) addButton(0,"Fuck Her",penisRouter,[fuckTuuva,tuuva.vaginalCapacity(0),false,0],"Fuck Her","Use your boy bits.");
	else if(pc.hasCock()) addDisabledButton(0,"Fuck Her","Fuck Her","You’re too big to fit inside her.");
	else addDisabledButton(0,"Fuck Her","Fuck Her","This requires a penis.");
	addButton(14,"Back",approachTuuva);
}

//Scales
//Gives 10 Affection
public function giveTuuvaFrostwormScales():void
{
	clearOutput();
	showTuuva();
	output("You take the pile of frostwyrm scales out of your pack and present them to Tuuva, asking if she can do anything with them.");

	output("\n\nShe gasps when she realizes what they are, and practically vaults over the counter to get a better look. <i>“");
	if(!korgiTranslate()) 
	{
		if(!tuuvaLover())
		{
			if(tuuvaAffection() < 25) output("Outsider");
			else if(tuuvaAffection() < 75) output("Friend");
			else output("Very friend");
		}
		else output("Lover");
		output(" kill big lizard?");
	}
	else output("Did you kill that stupid dragon?");
	output("”</i> You confirm with a nod, causing her to squeal and hop in place. <i>“Yesyesyesyesyes! ");
	if(!korgiTranslate()) output("Tuuva make many things, many things for you.");
	else output("I can make </i>lots<i> of things with these, many, many things.");
	output("”</i> She hops back into the forge area and, after a minute, comes back through the door with a small cart and piles the scales in.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Things ready in one seven-days time.");
	else output("I’ll have some pieces ready in about a week.");
	output("”</i> With that, she heads back through the door, and after a few minutes she comes back, ready to do more business.");
	processTime(15);
	tuuvaAffection(10);
	flags["GAVE_TUUVA_SCALES"] = GetGameTimestamp();

	pc.removeKeyItem("Frostwyrm Scales");
	tuuvaMenu();
}

//Backroom
public function tuuvaBackroomEvent():void
{
	clearOutput();
	showTuuva();
	output("You walk up and slowly open the door, peering in to see if any intruders have found their way in. You don’t see any, all you see is the forge, various other smithing equipment, and many tools strewn about in a way that would only make sense to someone who works with them regularly.");
	output("\n\nIt’s fairly dim back here, the only light in the room coming from the forge itself and from a stairway at the other end of the room. That room seems to be where the noises are coming from. You decide to investigate, just to make sure nothing bad is happening. As you get closer you start to recognize the noises for what they are; someone’s having a little <i>“</i>personal time<i>”</i>.");
	output("\n\nBefore you can decide on where to take this, the noises stop, and you hear her yell out.");
	output("\n\n<i>“");
	if(!korgiTranslate())
	{
		if(silly) output("Swipey no swiping! Swipey no swiping!");
		else output("Stealing peoples get out!");
	}
	else output("Get the fuck out of here, you thief!");
	output("”</i> Tuuva comes rushing down the stairs, hammer in hand... and cock and balls waving freely in the air. <i>“O-oh, ");
	if(!korgiTranslate()) output("outsider. How get in?");
	else output("How did you get in here?");
	output("”</i>");

	output("\n\nYou tell her that she left the door open, causing her to drop her hammer and look very embarrassed, and aroused. Her black doggy cock seems to be throbbing harder and harder despite the lack of contact, even growing very slightly. Despite how sex forward the Korgonne usually are, she seems reluctant to do anything, despite her obvious arousal.");
	output("\n\nYou could push this into something, or you could diffuse the situation.");

	processTime(10);
	flags["TUUVA_25AFF"] = 1;
	//[Sex]
	//[Leave]
	clearMenu();
	addButton(0,"Sex",tuuvaSex25Event);
	addButton(1,"Leave",leaveTuuva25Event);
}

//Leave
public function leaveTuuva25Event():void
{
	clearOutput();
	showTuuva();
	output("You apologize for barging in, and explain that you were simply making sure she was safe.");
	output("\n\n<i>“O-oh, um, ");
	if(!korgiTranslate()) output("much thank");
	else output("thank you");
	output("...”</i> You’re about to leave when you hear Tuuva come up behind you. <i>“Hey, ");
	if(!korgiTranslate()) output("Tuuva never snuggy-snuggy with outsider before... If friend want to, then Tuuva try it");
	else output("I’ve never done it with an outsider before... You’re a friend to me, so if you want to, I think I’d like to have my first time");
	output(".”</i>");

	output("\n\nFriend, ey? That’s new. You assure her that you’ll keep what she said in mind, which causes her tail to start fluttering. She rushes back to her room, and you hear the sounds of renewed self-pleasure, bringing a smile to your face as you leave.");

	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Sex
public function tuuvaSex25Event():void
{
	clearOutput();
	showTuuva();
	output("You casually approach the korg, grinning as she gasps and throbs at your approach. The ");
	if(!silly) output("thick");
	else output("THICC");
	output("-set little dog-slut freezes in place, that is, except for her tail, which is thrashing around like a tree in a hurricane. She obviously wants you, but it also looks like you’re going to have to be the one to take charge this time.");

	output("\n\n");
	if(pc.isBimbo()) output("<i>“That’s a niiiiice dick you got there. It looks </i>super<i> hard, and it’s, like, getting bigger! You wanna fuck me? You wanna pin me down and breed me like a cute little bitch in heat?”</i>");
	else if(pc.isBro()) output("You take a big whiff of the air around you, taking in the strong scent of pheromones that the built little bitch is giving off. Her dick might be screaming out for attention, but you can tell that her pussy is just as eager to get fucked! You don’t even have to say anything, you just grab your own [pc.crotch] and shake it at her, giving her a taste of your own musk.");
	else output("<i>“What’s wrong, I thought you guys loved sex? Or have you just never done it with an outsider?”</i> She nods, nervously. <i>“Well, we can fix that right now, can’t we?”</i>");
	output(" Before she even has a chance to respond, you scoop her up and carry her up to her bedroom.");

	output("\n\nHer room is fairly spartan, only a dresser, a small end table, and a large, messy bed. It’s obvious she rarely puts much effort into making it, though, the sheer amount of pillows and furs laid on it would make that complicated. The little korg squirms softly in your arms, trying to get your attention back on track.");

	output("\n\nYou toss her onto the bed, where she lands ass first, her puppy cock sticking straight up like a needy rocket preparing for launch. She whimpers as you ");
	if(!pc.isCrotchExposed() && !pc.isChestExposed()) output("undress");
	else output("show of your bare body");
	output(". You give her a little show, just to rile her up a bit more. Her cock is straining so hard at this point that you swear you can see the black skin reddening from all the blood trapped inside.");

	output("\n\n<i>“P-please...”</i> She whimpers out, and you decide that she’s had enough teasing.");
	output("\n\nHow do you take her?");
	processTime(10);
	pc.lust(10);
	//Show Sex Menu
	tuuvaSexMenu();
}

//Aftermath
public function tuuva25SexAftermath():void
{
	clearOutput();
	showTuuva(true);
	output("You lay on Tuuva’s bed, warm, worn-out bodies intertwined as you bask in the afterglow. She blissfully mumbles into your [pc.chest]. A few minutes pass, and Tuuva finally disengages herself from your ");
	if(pc.biggestTitSize() < 1) output("pecs");
	else output("tits");
	output(".");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Back work, much things, very busy. If friend want more snuggy-snuggy, then Tuuva give");
	else output("Gotta get back to work, lots to do, getting pretty busy. If you want to fuck again, I’m always ready");
	output(".”</i> She tugs her half-hard cock and slaps her fluffy booty for emphasis. Well you’re not going to say no to that! You assure her that you’ll keep her in mind if you’re ever in the mood.");
	output("\n\n");
	if(!pc.isCrotchExposed() && !pc.isChestExposed()) output("You pick up your discarded clothes and take a minute to put them back on, Tuuva watching with a lusty stare. ");
	output("She leads back down to the main shop, throwing her apron back on and getting back behind the counter as you walk back into the customer area.");

	//Puts you in the Earthshapers shop.
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//50: The Expedition
 //Triggers when you walk into Earthshapers after you reach 50 Affection.
//Requires Scavenger talk to be done

//Part 1
public function tuuva50AffectionExpedition():void
{
	showTuuva();
	output("\n\nYou walk in to the shop and see a bit of a comotion. Several other korgs are gathered in the shop, looking geared up for a serious trek, and carrying mugs of some kind of brew. Tuuva is behind the counter handing equipment over to one of the men, but also seems to be kitted out, herself. She waves you over when she spots you, scooting the man getting equipment out of the way after he grabs what he needs.");
	output("\n\nYou walk up and ask exactly what’s going on. <i>“");
	if(!korgiTranslate()) output("Scavenge friends short on people, ask Tuuva to come help find big ores. Very danger though, so much equipment need.");
	else output("My old scavenger friends came over and told me that they were low on people for a big expedition, so they asked me come with to help find some big ore deposits. It’s gonna be a dangerous trip, so I made a ton of equipment for all of us.");
	output("”</i>");

	output("\n\nOne of the men slides a drink across the counter, toward Tuuva. She grabs it and chugs it down, causing the group to let out a collective cheer and drink down their own.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Gone for day, back later with loot, bye bye!");
	else output("We’ll be gone for a day and come back with tons of materials! See ya later!");
	output("”</i> She doesn’t give you a chance to argue before she hops over the counter and leaves with the group.");

	output("\n\nPart of you wonders if it’s a good idea for her to go out, despite being out of it for so long. You suppose that even if she’s a bit rusty, she does have the rest of the team to help her out.");
	output("\n\n...You really hope the fact that you’re thinking this isn’t some kind of foreshadowing.");
	//Shop is empty until event finishes. Next event trigger happens when the PC enters the shop after 24 hours.
	flags["TUUVA_50AFF"] = GetGameTimestamp();
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Part 3
public function tuuva50AffFindEvent():void
{
	showTuuva();
	output("\n\nAs you’re wandering the wastes of Uveto, you pick up on a faint noise amid the whistling of the bitter wind. It’s very quiet, but you can follow along. It gets louder as you approach, and eventually you start to make it out more. It sounds like... crying? Could it be Tuuva?");
	output("\n\nYou call out her name to see if you get a response. The crying sound stops, and you hear a faint call.");
	output("\n\n<i>“H-hello?”</i> It’s definitely Tuuva. You follow her voice, calling out for her to help guide you. Eventually you find a small fissure in the ground, and, looking down, you see Tuuva at the bottom. <i>“H-help, p-please...”</i> You yell down that you’re here and that you’re going to help her. Of course, you don’t really know how you’re going to get down the fissure. It’s not deep enough that you’d die if you fell, but you certainly don’t want to go jumping in any big, deep holes, that aren’t attached to a magnificent ass.");
	output("\n\nYou don’t <i>want</i> to, but nature has different plans. The ledge you’re standing on gives way, and you fall through before you can react. Lucky you manage to grab onto a ledge midway down, allowing you to make the rest of the fall with much less force. It still hurts when you land, but at least you didn’t break anything.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Friend");
	else output("Are you");
	output(" a-alright?”</i> Tuuva asks, her voice very weak. You tell her that you aren’t the one who needs worrying about here. You turn on your Codex light and look over her. She’s beat up pretty bad, even still bleeding in certain spots. You pull out the medical kit that the scavenger gave you and start to work. Lucky her wounds aren’t that complex, and you have your codex to fill in any details you need.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("F-friend save Tuuva, why?");
	else output("W-why did you come save me?");
	output("”</i> You say that she’s your friend, of course you’re not just going to leave her to die, if you can help it. <i>“F-friend... thank you.”</i> You finish tending to her wounds, and bring her to her feet. She still needs to be propped up by you, but the two of you can move.");
	output("\n\nAnd move you have to. You hear a pair of feet walking toward the fissure. What you think might be a search party quickly reveals its true form with the familiar growls of male milodans. <i>“");
	if(!korgiTranslate()) output("D-dumb cats! Quick, go into cave!");
	else output("Milodans! We gotta hide, quick, into the cave!");
	output("”</i> You run deeper into the cave system, out of sight from the opening of the fissure.");

	output("\n\nThere’s a few tense minutes where you can see the two hunter’s shadows in the fissure opening. They probably followed Tuuva’s voice, just like you did. You keep as quiet as possible, barely even wanting to breathe in fear that the pair will come down and attack you and the injured korgonne. You breathe a sigh of relief after they pass, still cautious about making too much sound.");

	output("\n\nTuuva suddenly starts tugging you deeper into the cave. <i>“");
	if(!korgiTranslate()) output("Tuuva been here, know way out. No able to make it without help.");
	else output("I’ve been in these caves before, so I know a way out. I wouldn’t have been able to make it without your help.");
	output("”</i> That sounds like a plan. You walk with her while she leads you.");
	pc.removeKeyItem("Korgonne Medical Kit");
	output("\n\n(<b>Key Item Used:</b> Korgonne Medical Kit.)");
	processTime(15);
	clearMenu();
	addButton(0,"Next",tuuva50AffFindEvent2);
}

public function tuuva50AffFindEvent2():void
{
	clearOutput();
	showTuuva();
	output("You push on for what feels like an hour before it becomes too much for Tuuva and she needs to stop. <i>“S-s-orry, s-so t-tired.”</i> The poor little thing can barely keep her eyes open. You find a nice crevice to settle down in. She passes out almost as soon as she touches the ground, completely spent after this entire experience.");
	output("\n\nAbout half an hour passes before you start thinking about taking a snooze yourself, that’s when you hear something moving in the cave. You make sure Tuuva is as well hidden as she can be and ready your [pc.weapon]. Your mind races with the possibilities; is it those two hunters from earlier, or some kind of beast roaming the caves? Either way, you’re prepared for the worst.");
	output("\n\nSuddenly you hear something rush up behind you, and before you can react, you’re being tackled to the ground. It isn’t by milodans or strange cave beasts, though, your attacker is a korgonne");
	if(flags["MET_BULN"] != undefined) output(", it’s Buln, in fact");
	output(". Several more show up and surround you, aiming their various weapons at you. Thankfully, several of them recognize you and calm the mob down. The commotion was enough to wake Tuuva up, and she weakly steps out of her hiding spot, only to be mobbed with hugs and kisses from the search party.");
	processTime(75);
	clearMenu();
	addButton(0,"Next",tuuva50AffFindEvent3);
}

public function tuuva50AffFindEvent3():void
{
	clearOutput();
	showTuuva();
	output("The party leads you back to the hold, rushing Tuuva to the healer as quickly as they can, leaving you alone.");

	//puts you at the entrance of the Hold.
	//Next part triggers when you enter Earthshapers again.
	currentLocation = "KORGII B14";
	generateMap();
	clearMenu();
	flags["TUUVA_SAVED"] = 1;
	addButton(0,"Next",mainGameMenu);
}

//75: Admitting feelings
//Affection caps at 75 if player does not take the Lover route.
//Adds the Feelings option to the Special Menu at 75 Affection
public function tuuva75AffectionProc():void
{
	clearOutput();
	showTuuva();
	output("<i>“You seem a little tense, is anything wro-”</i>");
	output("\n\n<i>“Wh-w-what do you think of ");
	if(!korgiTranslate()) output("Tuuva");
	else output("me");
	output("?”</i>");
	output("\n\nWhat?");
	output("\n\n<i>“B-be-because ");
	if(!korgiTranslate()) output("Tuuva likes you lots, a-a-and was wonderings what you thinks");
	else output("I like you a lot, a-and I was wondering what you thought of me");
	output("...”</i>");
	output("\n\nOoooh, <i>that’s</i> what this is all about. It’s obvious she has feelings for you, so now it’s up to you how this goes from now on.");
	processTime(5);
	clearMenu();
	//[Love] Tell her that you love her too.
	//[Friends] Tell her that she’s a great friend, even if you don’t <i>quite</i> feel that way about her.”</i>);
	addButton(0,"Love",iLoveTuuva,undefined,"Love","Tell her that you love her too.");
	addButton(1,"Friends",iDontLoveTuuva,undefined,"Friends","Tell her that she’s a great friend, even if you don’t <i>quite</i> feel that way about her.");
}

//Friends
public function iDontLoveTuuva():void
{
	clearOutput();
	showTuuva();
	output("You tell Tuuva that she’s a great friend, and that you like her a lot too.");
	output("\n\n<i>“O-oh, j-just like...”</i> She looks dejected, almost like she’s about to cry. You put a stop to that by pulling her into a big hug and reassuring her.");
	output("\n\n<i>“Come on now, just because it’s not like that doesn’t mean you aren’t important to me. You’re still a great person and a great friend.”</i> She smiles and seems at least happy with that answer.");
	flags["TUUVA_75AFF"] = -1;
	tuuvaLoveChoiceEpilogue(false);
}

//Love
public function iLoveTuuva():void
{
	clearOutput();
	showTuuva();
	output("<i>“Yeah”</i> you move in until you’re face-to-face with the blushing bork, <i>“I like you a lot too.”</i> You punctuate that by pulling her into a deep kiss. She goes wide-eyed in response, not quite knowing how to respond. You decide to help her along, guiding her hands to wrap behind your back, and using your [pc.tongue] to train hers, as you make-out over the counter. Eventually she gets into the groove of it, closing her eyes so she can focus on the sensation. Her tail goes wild, almost looking like some kind of rotor, trying to lift her up and over the counter in order to be even closer to you.");
	output("\n\nAfter a minute, you disengage, leaving Tuuva momentarily speechless at what just happened.");
	output("\n\n<i>“Y-you really love ");
	if(!korgiTranslate()) output("Tuuva");
	else output("me");
	output("?”</i>");
	output("\n\n<i>“Do I need to demonstrate again?”</i>");
	output("\n\n<i>“...Maybe...”</i> Well, if she says so. You lean in for another kiss, this time being met in the middle by the passionate pup. You keep this one up for a bit longer than the last one, eventually breaking it off slowly.");
	flags["TUUVA_75AFF"] = 1;
	tuuvaLoveChoiceEpilogue(true);
}

public function tuuvaLoveChoiceEpilogue(love:Boolean = false):void
{
	output("\n\n<i>“I... thank you. ");
	if(!korgiTranslate())
	{
		output("Tuuva have gift for ");
		if(love) output("lover");
		else output("friend");
	}
	else
	{
		output("I have a gift for you, since you’ve been such a good friend to me");
		if(love) output(", and now that you’re even more than that");
	}
	output(".”</i> She reaches under the counter and pulls up some kind of spear with a tip that looks like it’s made of pure ice. <i>“");
	if(!korgiTranslate()) output("It special. Tuuva only make a few, and want you to have one.");
	else output("It’s special. I only get to make a few of these, and I wanted you to have this one.");
	output("”</i> You pick up the spear and give it a few thrusts, admiring just how light the ice tip makes it. You deeply thank her for the gift, saying you’ll use it very well.");
	output("\n\nShe smiles wide and heads back to work, a new spring in her step after what happened.\n\n");

	//Get The Frozen Spire
	processTime(7);
	quickLoot(new FrozenSpire());
}

//100: Date night
//Activated through the Date talk option which becomes available at 100 Affection.
public function dateTalkOption():void
{
	clearOutput();
	showTuuva();
	output("<i>“You’ve never been off world, have you?”</i>");
	output("\n\nShe shakes her head. <i>“");
	if(!korgiTranslate()) output("Tuuva scavenge lots, but never find space goer");
	else output("I found a lot of things in my scavenging days, but I never found a spaceship");
	output(".”</i>");
	output("\n\nYou ask if she ever even thought about it.");
	output("\n\n<i>“Sometimes, but ");
	if(!korgiTranslate()) output("Tuuva never able to do it");
	else output("I’ll never be able to do it");
	output(".”</i> She says dismissively.");
	output("\n\n<i>“What if I took you?”</i> Her ears perk up and her tail goes crazy.");
	output("\n\n<i>“");
	if(!korgiTranslate() || tuuvaLover()) output("Lover");
	else output("You’d");
	output(" do that?”</i>");
	output("\n\nYou have a ship, and there’s nothing stopping you, you tell her. Of course, you also tell her that she’ll need to be wearing more than an apron. She looks down at her worn, dirty apron and nods softly.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Tuuva forget outsiders so picky. Have fix, go wait at gate and Tuuva meet.");
	else output("I forgot that you outsiders were so dang picky. Don’t worry, I got something; go wait at the front gate and I’ll meet you there.");
	output("”</i> She hops back to her room and you hear a bit of a commotion going on as she does something. You have no idea what she’s doing, but you decide that you’ll see it when you see it and head out to the meeting spot.");

	processTime(10);
	clearMenu();
	addButton(0,"Next",tuuvaDate2);
}

public function tuuvaDate2():void
{
	clearOutput();
	showTuuva();
	currentLocation = "KORGII B14";
	generateMap();
	output("About twenty minutes pass before you see Tuuva again. She bounds up to you with a huge smile on her face, and a much more trim and clean appearance. Her fur is finely combed and washed free of the usual soot. Even her hair is a bit more styled, for what little she could do with such a short cut. She has a few pieces of jewelry too; some earrings, and a few bracelets. Her big, hide coat is still very tribal, but maybe that’s just for the trip to your ship.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Tuuva");
	else output("I");
	output(" feel weird, but pretty. ");
	if(!korgiTranslate()) output("Lover like");
	else output("Do you like it");
	output("?”</i> You give her a quick kiss and tell her that she looks stunning. She squirms happily at that, even more so when she spies the gate guards checking her out too. <i>“U-uh, ");
	if(!korgiTranslate()) output("we go now,");
	else output("can we head out now,");
	output(" please.”</i> You chuckle, put your hand around her shoulder and lead her out, getting an approving gesture from the two guards.");
	output("\n\nThe trip is stressful due to the dangers of the Uvetan tundra, but that doesn’t stop you from taking in some of the sights. The huge mountains, the massive glaciers, the towering spires of polished obsidian, it’s quite the spectacle. Even Tuuva seems to think so.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Tuuva not remember how pretty-pretty here was. Been so long, except for...");
	else output("I can’t believe I forgot how beautiful it was out here. It’s been so long since I’ve gotten out, aside from...");
	output("”</i> She looks over into the distance, and when you look, you see a large hole, partially filled in by a massive pile of snow. That must be where she fell into the caves.");
	output("\n\nYou move past that bad memory and reach Irestead. Tuuva cowers behind you when she sees the guards, but you assure her that they won’t hurt her. Indeed, you’re able to enter town without any trouble. She looks around, curious, but not particularly impressed.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("This outsider city? ... Neat");
	else output("So this is your outsider city? ... Interesting");
	output(".”</i>\n\nYou admit, it’s not the most impressive place, but it’s just an appetizer for what you’re going to show her.\n\nShe smiles as you lead her through the streets and toward the central hub. If there’s one thing she does marvel at, it’s the space elevator. <i>“So big! ");
	if(!korgiTranslate()) output("Tuuva only see it from long away. Now that close... wow!");
	else output("I’ve only seen this thing from far away before now. That I’m right here... just, wow!");
	output("”</i>");
	output("\n\nShe keeps aweing at it until the point where you finally reach it. She’s apprehensive about getting on, but you give her an encouraging tug and she hops on. She yelps as the lift rockets up, but goes almost silent when she sees the view out the window.");
	output("\n\nWatching the only thing she’s ever known shrink rapidly before her eyes must be hard to process. She seems caught between wonder and fear as she gazes out the window, until, almost as soon as it started, the ride ends.");
	output("\n\nShe looks back at you, unsure of what to do now, but you take her hand and encourage her to keep going.");
	processTime(120);
	clearMenu();
	addButton(0,"Next",tuuvaDate3);
}

public function tuuvaDate3():void
{
	clearOutput();
	showTuuva();
	currentLocation = "SHIP INTERIOR";
	generateMap();
	output("You lead the pup-out-of-water through the station, helping keep her from having too much sensory overload from the experience. She even almost scurries away when she sees the gun turrets near the hanger, but you keep her steady.");
	output("\n\n<i>“Why ");
	if(!korgiTranslate()) output("outsiders have so many shooties");
	else output("do you people have so many guns");
	output("?”</i> She whispers in your [pc.ear] For protection, you tell her. <i>“");
	if(!korgiTranslate()) output("Outsiders need learn to be more sneaky, not just shooty everything!");
	else output("You outsiders need to learn how to be more subtle, and not just put guns everywhere and shoot everything!");
	output("”</i> She has a point, but that’s something for another day. For now, you’re at your ship.");

	output("\n\nYou take her in and show her around, introducing her to all the various bits and workings of your spacecraft.");
	if(crew(true) > 0) output(" You also introduce her your crew, mostly letting her hit it off, herself. ");
	output("Finally, you take her to the cockpit, sitting her down while you prepare the launch sequence.");

	output("\n\nShe sits and watches while you finish entering the sequence, an jumps a bit when she feels the ship lift off. She stares out in awe as you leave the planet’s atmosphere. She’s speechless as you completely exit the planet, face almost pressed against the glass of your view-screen.");
	output("\n\nIt’s at this point that you remember that you didn’t actually pick out a destination for this date! You flip through the extranet, looking for nearby events. Tuuva turns to you and notices what you’re doing.");
	output("\n\n<i>“Something wrong?”</i>");
	output("\n\n<i>“Um, no. Just getting the coordinates of where we’re going.”</i>");
	output("\n\n<i>“Ooooh! ");
	if(!korgiTranslate()) output("Where we go");
	else output("Where are we going");
	output("?”</i> She rushes up to you to see what you’re doing, prompting you to tap the first thing that isn’t a strip club. <i>“OOOOH, THAT ");
	if(!korgiTranslate()) output("LOOK SUPER NICE");
	else output("LOOKS SO NICE");
	output("!”</i> You look down and see that you’ve landed on the page for a garden festival on Verifore Two. You’ve heard great things about Verifore, and it seems like the perfect contrast to show her the wonders of alien worlds. It’s a bit exclusive, but lucky for you, your family name gives you enough pull to get a spot immediately. Off to Verifore, you exclamate, causing her to cheer out.");
	processTime(60);
	clearMenu();
	addButton(0,"Next",tuuvaDate4);
}

public function tuuvaDate4():void
{
	clearOutput();
	showTuuva();
	output("The warp trip to Verifore seems to be the most exciting part of the trip for the enraptured doggo; the myriad of colors flying past as you enter warp, all the different kinds of ship she sees, the idea that you’re going faster than should be physically possible. It all sets her off like a little kid on her first plane trip.");
	output("\n\nFinally, you reach Verifore, and both marvel at the lushness on display, even from so far up. To call the planet lush is an understatement; the trees and flowers in some areas must be at least two hundred kilometers tall! It’s fascinating just to look at from up here, you can’t imagine how it is on the ground.");
	output("\n\nActually landing is a thing onto itself. The lines are so long that it takes at least an hour for you to get to the hanger. However, this just gives you time to hang out with your date more. She finally takes off the heavy coat she was wearing, revealing a backless, knee-length, dark blue dress. It’s obviously been modified to fit her diminutive but wide size, but it still looks good on her.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("You like? Tuuva find it long time ago, save for special day");
	else output("Do you like it? I found it a long time ago, in my scavenging days, and I’ve been saving it for a special day.");
	output("”</i> You lean in and give her a big, long kiss, telling her that you love it, when your lips part. She smiles and goes back in for another kiss, and you spend the remainder of your wait time enjoying eachother.");

	output("\n\nWhen you’re finally able to step off, you’re greeted by a pair of plant-like natives who shower you with flower petals. Verifore is just as much of a spectacle as you could have ever imagined. The warm sunlight bathes over miles of rainbow-colored plants, stretching far, wide, and tall. You could sit here and just look out into the horizon all day, but it seems like there’s a tour going on.");
	output("\n\nThe guide comes up to you and gathers you into the group, leading you along the sparkling, silver path through the planet. The dryad-like woman takes you along a path that winds up and down the thick, lush plant-life, even going through several tunnels that, amazingly, are naturally made! Thick, knotted vines swirl around each other, creating a natural canopy that blooms with various, multi-colored flowers.");
	output("\n\nYou get to see some of the planet’s animal life too. Creatures large and small scamper around you, each seeming to have some kind of plant-like attribute in order to blend in with their environment. A large, cat-like creature even comes up to you and Tuuva. The guide tells you it’s harmless, prompting Tuuva to go up and start petting it. It purrs as the rest of the group comes up to it and start mauling it with cuddles.");
	output("\n\nThe last thing she points out is one of the massive trees you saw from orbit. She says their roots spread to the deepest reaches of the planet, sucking nutrients from unknown sources, and that their exact biology has been a subject of scientific study for hundreds of years. Hundreds of species live inside them, and only inside them, supported by environments that are wholly unique to each tree.");
	output("\n\nYou had no idea that this place would be so interesting. Tuuva seems to be having the time of her life too! She’s constantly dragging you around, having you look at everything from wonderful vistas, to something as simple as grass. Everything is magnificent to her, and she seems like she couldn’t be happier.");
	processTime(12*24);
	clearMenu();
	addButton(0,"Next",tuuvaDate5);
}

public function tuuvaDate5():void
{
	clearOutput();
	showTuuva();
	output("The day winds down as the guide leads you to a resort where you’ll be staying for the night. You mingle with the other guests, take a dive in the pool, and eat some of the finest food you’ve ever tasted, but eventually it all comes down to you and Tuuva, cuddling in bed as the last of the sunlight fades.");
	output("\n\nShe absolutely beams at you in happiness. <i>“Thaaaaaaaank you! ");
	if(!korgiTranslate()) output("Tuuva never ever thought she’d do anything like this. Lover make Tuuva soooooooo happy!");
	else output("I absolutely never thought I’d ever get to do anything this amazing. You make me so happy that I-I don’t even know what to say!");
	output("”</i> You tell her that her being happy is all the thanks you need, causing her to burst out in tears of happiness.");
	output("\n\nThe two of you cuddle together for the last few hours before you sleep, just enjoying eachother in this magical moment.");
	processTime(4*60);
	clearMenu();
	addButton(0,"Next",tuuvaDate6);
}
public function tuuvaDate6():void
{
	clearOutput();
	showTuuva();
	output("Your return trip isn’t as exciting as the trip there, but it’s filled with a kind of warmth that makes it just as enjoyable. You reach the hold and give Tuuva one last big hug before she heads back to her shop, getting swarmed by other korg asking all about her trip.");
	processTime(10*24);
	flags["TUUVA_DATE"] = 1;
	clearMenu();
	addButton(0,"Next",move,"KORGII B14");
}

//Sex Options
//Each sex scene adds two Affection
//[Fuck her] Use your boy bits. //requires a dick
//[Get Fucked] Help her bury her bone.

//Fuck her
public function fuckTuuva(x:int = 0):void
{
	clearOutput();
	showTuuva(true);
	//Try and find a dick to fit her butt...
	var y:int = pc.cockThatFits(tuuva.analCapacity());
	//If found a dick, but it's already going in her pussy, try for next best fit:
	if(y == x && pc.cockTotal() > 1) pc.cockThatFits2(tuuva.analCapacity());
	//If somehow shit is still fubar, set as no-go.
	if(y == x) y = -1;
	output("<i>“Roll over and show me that pussy!”</i>");
	output("\n\nShe complies eagerly, flipping herself over, letting her [tuuva.cock] and [tuuva.balls] hang low as her fat little puppy pussy presents itself to you. Fat drops of fragrant cunt juice roll out of her slit, over her swolen, furless snatch, while her tail swings wildly above. Well, it’d be a waste to pass up such a juicy snack wouldn’t it? You grab onto her big, meaty sides and dig in.");
	output("\n\n<i>“Ooooh, ");
	if(!korgiTranslate())
	{
		output("friend like Tuuva’s woman juices? Lucky for ");
		if(tuuvaLover()) output("lover");
		else output("friend");
		output(", Tuuva have much.");
	}
	else output("do you like my pussy juices that much? Lucky for you, I have </i>plenty<i>.");
	output("”</i> She’s not kidding. What started as a series of fat drops is turning into a small stream. If you didn’t know any better, you’d think the Korgonne were not-so distant relatives of the ausar.");

	output("\n\nJuices aren’t the only thing pouring out of her. The heat and pheromones wafting out of her are <i>insane</i>! Her puffy pussy is hot and earthy like her own forge, only with a smell that turns your [pc.cocks] into ");
	if(pc.cockTotal() == 1) output("an iron bar");
	else output("iron bars");
	output(", one");
	if(pc.cockTotal() > 1) output("s");
	output(" just dying to be melted down in the hot fires of her womanhood.");

	output("\n\nThat can wait, though, you haven’t had your fill yet, and neither has she. You both know that the real show starts when you get inside, so you waste no time. She groans as you pierce the soaking veil of her fat outer lips, getting to the sensitive flesh inside.");

	output("\n\nThe sturdy-built blacksmith immediately starts to buckle as you hit her sweet spot. She yips and shudders as you lap her juices up from the source, your [pc.tongue] exploring each of her soaking internal folds as you work it in.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE) && pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" And work it in you do. There’s more than a foot of wiggling tongue buried inside the stubby slut. You snake in and out of her with tentacle-like control, making Tuuva squeal out in bliss.");

	output("\n\n<i>“Ugh, ");
	if(!korgiTranslate()) output("much tongue, so long... c-cuuuuum!");
	else output("your tongue is so big, a-and loooong... f-fuck, I’m cumming!");
	output("”</i>");
	output(" You pound your oral organ into her like a breeding stud pounds into their favorite mare. Girl cum bursts out as you pummel her puss like a prime piece of meat, and she squeals like a whore while she does.");

	output("\n\n<i>“Oooh, ");
	if(!korgiTranslate())
	{
		if(!tuuvaLover()) output("friend");
		else output("lover");
		output(" make lady hole feel good, sooooo good... t-too good, gonna c-cummm!");
	}
	else output("spirits, you know how to make me feel good down there! Sooooo goood. C-can’t t-take... gonna c-cuuummmm!");
	output("”</i> And cum she does. Arcs of musky girl cum spray out of her snatch, drenching your face like you just stuck it into a fountain, while her [tuuva.cock] drenches the bed under her in ");
	if(!tuuva.hasCock(GLOBAL.TYPE_EQUINE)) output("a puddle of puppy seed");
	else output("a tide of musky horse-puppy seed");
	output(". She doesn’t let you miss it either; the second you try and pull away her legs suddenly jump up, wrap around your back and drag you down onto the bed with her, keeping you nice and close to her spasming snatch while it utterly soaks you. This girl should be a wrestler!");

	output("\n\nWell, she’s had hers, now it’s time for you to have yours! You pry her coiled legs from around your back and sit up, presenting your [pc.cocks] for inspection.");
	if(y >= 0) 
	{
		output(" She marvels at your multiple endowments, tongue lolling out as she admires your alien genital arrangement.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Tuuva never see double dongers before... Gimme!");
		else output("I’ve never seen someone with two dicks, other than you... Don’t make me wait!");
		output("”</i>");
	}
	else if(pc.cocks[x].cLength() < 12) 
	{
		output(" She stares hungrily at your dick");
		if(pc.cockTotal() > 1) output("s");
		output(", like a starving puppy at a ");
		if(pc.cockTotal() == 2) output("pair of");
		else if(pc.cockTotal() > 2) output("bunch of");
		output(" juicy sausage");
		if(pc.cockTotal() > 1) output("s");
		output(". <i>“");
		if(!korgiTranslate()) output("Tuuva");
		else output("I’m");
		output(" waaaaaaaaiting.”</i>");
	}
	//12-15:
	else if(pc.cocks[x].cLength() < 15)
	{
		output(" She awes at the sheer size of your meaty meat, shuddering a bit at your tumescence. <i>“Mmmhm, ");
		if(!korgiTranslate()) output("big, very big, Tuuva want!");
		else 
		{
			output("that’s a big ");
			if(pc.cockTotal() > 1) output("bunch of dicks");
			else output("dick");
			output(". I want a piece of ");
			if(pc.cockTotal() == 1) output("that");
			else output("those");
			output("!");
		}
		output("”</i>");
	}
	else
	{
		output(" She almost jumps when she sees the size of your mega meat. Her pussy visibly spasms in anticipation, and her whole body starts shuddering. <i>“Fffff... ");
		if(!korgiTranslate()) output("Tuuva never see super big meats before outsiders come... thank you thank you!");
		else output("I’ve never seen dicks this big before you outsiders came... Spirits thank you!");
		output("”</i>");
		if(tuuva.hasCock(GLOBAL.TYPE_EQUINE)) output(" She rubs her own oversized member to emphasize her love of huge dicks.");
	}
	output("\n\nThe thick fragrance from the layers of cunt juice on your face is giving you an increasing sense of tunnel-vision. Your focus is increasingly focused on the short distance between your [pc.cocks], her throbbing pussy, and how to make it much shorter for a long, <i>loooooooong</i> time! It doesn’t help that every time you try and wipe it off, it just mixes it around and it gets worse. There’s so much of it on you that nothing short of a heavy shower is going to get it off, and it looks like she knows that.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Like Tuuva’s fuck-juice? Make you want to fuck Tuuva long time with much hardnesssSSS!");
	else output("Do you like my pussy juice that much? Does it make you want to fuck me <i>hard</i> like a bitch in heaaaAAT!");
	output("”</i> You don’t even let her completely finish before you ram your dick");
	if(y >= 0) output("s");
	output(" in her up to the hilt");
	if(y >= 0) output("s");
	output(". You let out a feral growl as you forcefully pin her to the bed, one hand pushing her back down while the other man-handles her thick tush.");
	pc.cockChange();
	output("\n\nShe gurgles and yips as you line yourself up in prime position, pull your [pc.cocks] back, and ram ");
	if(y < 0) output("it");
	else output("them");
	output(" into her ");
	if(y < 0) output("pussy");
	else output("holes");
	output(" with as much force as you can, causing the bed to shake under you. You jackhammer in and out of her with no regard for her own pleasure, which, ironically, seems to be turning her on even more. Arcs and splashes of girl-juice fly out of her increasingly upraised booty with each thrust you make, turning the bed into a musky swamp of sexual fluids.");
	output("\n\nAs your wild fuck grows more intense, you start dragging her more upright, plowing her face directly into the sheets soaked by her own juices. You even yank her tail as you drag her up. You’d probably stop if it didn’t make her moan out; seems like she’s a bit of masochist. You decide to take advantage of this, slowing down your feral thrusts just enough that you can get some slaps in on her tawny-furred booty");
	output("\n\nHer ");
	if(y < 0) output("pussy convulses");
	else output("sloppy holes convulse");
	output(" around your tool");
	if(y >= 0) output("s");
	output(" even harder as your treatment grows rougher. Her first mid-coitus orgasm hits her like a truck. Her pussy soaks and convulses so much that you think it might rip your dick right off!");
	if(y >= 0) output(" Her ass is doing its own number on your other member, squeezing down so hard that you find it hard to even move.");
	output(" You try and power through her grip, but come to regret that as you feel your orgasm rushing toward you.");

	//Normal cum output:
	if(pc.cumQ() < 3000) output("\n\nYou fill her with every drop you have to give, emptying your [pc.balls] far more than you thought you were capable of.");
	//High cum output:
	else if(pc.cumQ() < 15000) output("\n\nYou gloriously unload your overfilled [pc.balls] into the puffy puppy. Her belly bloats out from your sheer output, turning the muscular munchkin into a roly-poly little puffer. You even manage to outpace her girl cum, an impressive feat given her biblically wet cunt.");
	//Living fire hydrant:
	else output("\n\nYou fire out [pc.cum] in high-pressure bursts. Her belly bloats out almost immediately as your inhuman output makes itself well known. Her eyes bug out as she watches you utterly fill her up, never seeming to run dry, even as she starts to resemble a korgonne-themed beach ball. She starts to whimper, but stops as your seed overflows so much that it reaches her mouth, and she starts guzzling down your cum as it comes.");
	if(pc.hasKnot(x)) output(" Your knot inflates mid orgasm, trapping the diminutive dogslut on your spasming [pc.cockNounSimple " + x + "]. She takes it <i>very</i> well, the sensation causing her to orgasm yet again, mere seconds after her last one.");

	output("\n\nHer own [tuuva.cock] unloads in time with yours, adding to the heady pool that the two of you have created in her bed.");
	output("\n\nThe two of you eventually run dry and collapse onto the bed with a wet squelch. You lie in your own collective mess, panting and filthy. After a few minutes, the two of you pass out in each other’s arms.");
	processTime(35);
	pc.orgasm();
	IncrementFlag("SEXED_TUUVA");
	tuuvaAffection(2);
	tuuva.loadInCunt(pc,0);
	clearMenu();
	if(flags["SEXED_TUUVA"] == 1) addButton(0,"Next",tuuva25SexAftermath);
	else addButton(0,"Next",tuuvaFuckPoststuff,x);
}

public function tuuvaFuckPoststuff(knot:Boolean = false):void
{
	clearOutput();
	showTuuva(true);
	var knot:Boolean = pc.hasKnot(x);
	output("You wake up a bit later, Tuuva riding your [pc.cock " + x + "], cowgirl style. You feel just as hard and ready to go as when you started! She becomes all too aware of your regained consciousness when you grab onto her hips and yank her down to your base. She yells out in pleasure as you renew your passions.");
	output("\n\nYou go at it for another few minutes before you cum again, giving her another hearty filling as you feel your libido finally settle down.");
	output("\n\nIt seems like she took some time to clean up while you were out. The bed doesn’t feel like a pond anymore, and your face is <i>mostly</i> devoid of her juices. It seems like she left just enough for it to keep you going for at least another round.");
	output("\n\n");
	if(knot) output("After waiting for your knot to deflate, again, s");
	else output("S");
	output("he hops up off the bed and leads you back to the front of the shop");
	if(!pc.isCrotchExposed() && !pc.isChestExposed()) output(",making sure to throw you your gear before you leave");
	output(". She puts her apron back on and fires the forge up while you step back into the customer area.");
	//[Next] //Back to Earthshapers
	if(knot) processTime(90);
	else processTime(30);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Get Fucked
public function getFuckedByTuuva():void
{
	if(!pc.hasVagina()) actuallyGetFuckedByTuuva(-1);
	else
	{
		clearOutput();
		showTuuva(true);
		output("How do you want her to take you?");
		//[Anal]
		//[Vaginal]
		clearMenu();
		addButton(0,"Anal",actuallyGetFuckedByTuuva,-1);
		addButton(1,"Vaginal",actuallyGetFuckedByTuuva,rand(pc.totalVaginas()));
	}
}

public function actuallyGetFuckedByTuuva(x:int):void
{
	clearOutput();
	showTuuva(true);
	var capacity:Number = 0;
	var wetness:Number = 0;

	if(x >= 0)
	{
		capacity = pc.vaginalCapacity(x);
		wetness = pc.vaginas[x].wetness();
	}
	else
	{
		capacity = pc.analCapacity();
		wetness = pc.ass.wetness();
	}
	output("Instead of saying what you want, you just turn around and bend over, spreading your cheeks to expose your [pc.vagOrAss " + x + "] to her. She literally jumps at your invitation, hopping off the bed and grabbing onto your [pc.hips].");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Tuuva in leading now! You listen!");
	else output("I’m in charge now, so you’d better listen!");
	output("”</i> To prove her point, she drags you off your feet and tosses you onto the bed, ass up. She gets up with you, looming overhead, as much as she can given her size. <i>“");
	if(!korgiTranslate()) output("Slippy, need lots of slippy!");
	else output("Gonna need a lot of lube for this!");
	output("”</i> Her confident demeanor seems to vanish in the wake of confusion as she tries to find a source of lube.");
	output("\n\nSuddenly something clicks and she remembers her womanhood. She digs down under her [tuuva.balls] and moans out as she hunts for girl cum. She whimpers as she alternates between working over her soaking cunt, and stroking her juices onto her [tuuva.cock]. She nearly cums on the spot, but thankfully she remembers you.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("T-Tuuva almost forget, sorries.");
	else output("I-I almost forgot about you, sorry.");
	output("”</i> Her way of saying sorry is apparently shoving her hand up your [pc.vagOrAss " + x + "]. You moan out as she dives three fingers, knuckle-deep, shoveling a hearty helping of her juices in ");
	if(wetness > 0) output("to mix with your own");
	else output("to lube up your dry entrance");
	output(". She keeps this up almost as long as she kept up her own foreplay, making sure that you’re just as ready for what’s going to happen as she is.");

	output("\n\nShe stops after a minute, and within seconds she’s mounted you, guiding her [tuuva.cock] to your lubed entrance.");
	//Normal:
	if(!tuuva.hasCock(GLOBAL.TYPE_EQUINE)) 
	{
		output(" Her puppy prick spears into your ");
		if(x >= 0) output("honey pot");
		else output("booty hole");
		output(", easily gliding through you thanks to the massive amount of pheromone-laced girl juice she slathered both of you in");
		if(x >= 0) pc.cuntChange(x,tuuva.cockVolume(0));
		else pc.buttChange(tuuva.cockVolume(0));
		output("\n\n<i>“Mhmm, nice!”</i>.");
	}
	else
	{
		output(" Her massive horse cock rams its way into you, leaving a noticeable bulge in your [pc.belly]. ");
		if(capacity <= tuuva.cockVolume(0) * 1.5) output("She struggles to fit the whole thing in you, even with all the lube, but she’s not giving up! She gives you a series of shallow thrusts, embedding herself in you, a fraction of an inch at a time. After a minute, she finally achieves her goal and bottoms out inside you.");
		else 
		{
			output("She wiggles a little to get the fat, flat head to slip inside. Capacious as you are, a horse-cock is still a horse-cock. She gives a series of shallow thrusts, embedding herself deeper inside you. Now that she’s gotten the tip inside, it’s a simple matter of spreading the depths of your stretchy ");
			if(x >= 0) output("quim");
			else output("sphincter");
			output(" around her bestial dick, marvelling at the ease of the insertion. After a minute, she finally achieves her goal and bottomss out inside you.");
		}
		if(x >= 0) pc.cuntChange(x,tuuva.cockVolume(0));
		else pc.buttChange(tuuva.cockVolume(0));

		if(wetness < 3)
		{
			output("\n\n<i>“Ugh, needed more ");
			if(!korgiTranslate()) output("slippy");
			else output("lube");
			output("...”</i>");
		}
		else
		{
			output("\n\n<i>“Wow! So wet!”</i> Her tongue lolls out. <i>“");
			if(!korgiTranslate()) output("Perfect slippy!");
			else output("It’s perfect.");
			output("”</i>");
		}
	}
	output(" She barely gives you time to adjust before she picks up the pace, pounding your [pc.vagOrAss " + x + "] with dizzying speed. The little girl’s got plenty of muscle on her, so she hits you hard, fast, and can keep it up. You need to try <i>hard</i> to keep yourself from losing balance and being pounded into the sheets. That seems to be exactly what she wants, though, if the voracity of her thrusts is any indication.");
	output("\n\n<i>“");
	if(!korgiTranslate()) 
	{
		output("Tuuva small, but Tuuva strong! Strong enough to make ");
		if(!tuuvaLover()) output("friend");
		else output("lover");
		output(" into bitch!");
	}
	else output("I might be small, but I’m damn strong. Definitely strong enough to turn you into a needy bitch!");
	output("”</i> She punctuates by giving you one huge shove that knocks the last bit of strength out of your [pc.legs] and sends you tumbling forward. Despite that, she doesn’t let go of you, keeping her hands wrapped firmly around your [pc.hips], and her [tuuva.cock] stuck firmly in your [pc.vagOrAss " + x + "].");

	output("\n\nShe does pull out for a second so she can flip you over, but she goes right back to it. Her hands latch right on to your [pc.chest] as she leans more into you. It’s a very different feeling now that you can stare her right in the eyes while she fucks you. They’re wide as can be as she returns your stare, her tongue lolling out and her tail wagging like an excited puppy.");
	if(tuuva.hasCock(GLOBAL.TYPE_EQUINE)) output(" To contrast that cute imagery is seeing just how much her horse meat is bulging your gut out. It’s definitely grown a good bit since you started, and each thrust feels like having your gut railed with a fleshy, piping hot piston. It should be painful, but it’s somehow incredibly pleasurable.");

	output("\n\n");
	if(tuuvaLover()) 
	{
		output("Suddenly she puts one hand around your neck and pulls you in for a deep, passionate kiss. Your [pc.lipsChaste] wrap around her muzzle, locking around her own lips as best as the two of you can. Her pace messes up a bit while she does this, but she quickly rights herself. The passion intensifies as her tongue wraps around yours, pulling you even deeper into her doggy kisses.");
		output("\n\nShe lets go for only brief moments to whisper sweet nothings in your ear, affirming her feelings for you. <i>“");
		if(!korgiTranslate()) output("Love, love, love! Sex good, but you better! So happy, w-want you stay...");
		else output("I love you so much! The sex is amazing, but you’re so much more amazing. You make me so happy... why can’t you stay with me...");
		output("”</i> She slows down and looks at you sadly, genuinely asking. You cup her cheek and tell her that you can’t settle down because of your mission, but you can take her out to the stars, even if only briefly.");

		output("\n\n<i>“");
		if(!korgiTranslate()) 
		{
			output("Lover take Tuuva ");
			//Done 100 affection event:
			if(flags["TUUVA_DATE"] != undefined) output("back ");
			output("to space?");
		}
		else
		{
			output("You’d take me ");
			if(flags["TUUVA_DATE"] != undefined) output("back ");
			output("to outer space?");
		}
		output("”</i> You nod. <i>“...");
		if(!korgiTranslate()) output("Tuuva");
		else output("I’d");
		output(" like that...”</i> She gleefully picks her pace back up, even going a bit faster, spurred on by your promise.");
	}
	else
	{
		output("She moves her face up closer to yours, but seems apprehensive to do anything. She looks like she wants to kiss you, but, for some reason she’s holding back. You give her a little peck on the lips, signaling her that it’s okay to go all in, and that she does.");
		output("\n\nShe dives onto your [pc.lipsChaste], coiling her tongue into your mouth and tying up your own like a predatory snake. She presses her whole body down on you more, making sure you feel her weight on you as she possessively mates with you. As she feels your body submit, she ups her pace, getting ready to finish up.");
	}
	output("\n\nYour lengthy fuck eventually devolves into a sweaty rut. Your bodies are pressed as tightly together as possible, to the point where you find it hard to tell where the heat from your body ends and hers begins. You’ve melted into a singular pile of hot, passionate fuck; sweating, and moaning, and groaning almost senselessly as the little muscle-ball completely overwhelms you, and seemingly herself.");
	output("\n\nYour senses flash back to you for a second as you feel the telltale swelling of her knot inside you. Any protest or even encouragement you could give is drowned out by sheer pleasure.");
	output("\n\nIn the first moment of respite you’ve gotten in stars know how long, Tuuva pulls back and turns around.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Time for maties!");
	else output("Time to finish up!");
	output("”</i>");

	output("\n\nYou see her [tuuva.balls], and in fact her whole body, tense up as her knot seals itself firmly inside your [pc.vagOrAss " + x + "].");

	//normal:
	if(!tuuva.hasCock(GLOBAL.TYPE_EQUINE))
	{
		output("\n\nShe cums inside you, filling your ");
		if(x >= 0)
		{
			if(!pc.isPregnant(x)) output("womb");
			else output("tunnel");
		}
		else output("bowels");
		output(" with warm puppy seed. Her tail wags like crazy, and she looks back at you with her tongue lolling out. She’s obviously enjoying herself greatly as her orgasm drags on. She even still tries to thrust despite her tie to you.");
		output("\n\nShe cums an impressive amount for such a little thing. You even feel your [pc.belly] bulge out a bit from the sheer amount. She seems very proud of that fact, as she lays a hand on your slightly pudged-out belly.");
		output("\n\n<i>“Heh, ");
		if(!korgiTranslate()) output("Tuuva good breeder, yes?");
		else output("I’m a pretty damn good breeder, aren’t I?");
		output("”</i> You nod softly, body still limp as you bask in the lazy afterglow, and her still pulsing prick.");
	}
	//Synth:
	else
	{
		output("\n\nShe unloads gloriously inside you, filling your ");
		if(x >= 0)
		{
			if(!pc.isPregnant(x)) output("womb");
			else output("tunnel");
		}
		else output("bowels");
		output(" with what feels like gallons of seed. You see her big, black horsey balls pulse and throb heavily as the little doggo slut struggles to truly deal with the immense virility you gifted her with. Her face twists and contorts as she’s subjected to pleasures she was never meant to experience so intensely.");
		output("\n\nYour body responds by bloating, your [pc.belly] filling out to pregnant proportions, each passing second seeming to add another month, and after that, a twin, then a triplet to your arbitrary, unborn-child-based measuring standard for cum inflation. It doesn’t stop there, and eventually her seed spills out around the seal her knot has made.");
		output("\n\nYou feel like a [pc.race] cocksleave, reduced to a drooling, fleshy holster by the strong little korg, and her massively oversized cock. She seems just as put out as you are by her dick. Her eyes are crossed and her mouth seems to be mumbling out some kind of blissed out nonsense.");
		output("\n\nAt some point she stops cumming and collapses, leaving the both of you to bask in the afterglow.");
	}

	processTime(30);
	if(x >= 0) pc.loadInCunt(tuuva,x);
	else pc.loadInAss(tuuva);
	pc.orgasm();
	IncrementFlag("SEXED_TUUVA");
	tuuvaAffection(2);
	clearMenu();
	if(flags["SEXED_TUUVA"] == 1) addButton(0,"Next",tuuva25SexAftermath);
	else addButton(0,"Next",tuuvaPostSexDrill,x);
}

public function tuuvaPostSexDrill(x:int):void
{
	clearOutput();
	showTuuva(true);
	output("It takes almost an hour for her knot to deflate. During that time she really doesn’t attempt to do much other than yip, and throb inside you. She crawls away once her knot finally does deflate, pulling her [tuuva.cock] out of your [pc.vagOrAss " + x + "] and letting the ");
	if(!tuuva.hasCock(GLOBAL.TYPE_EQUINE)) output("trickle");
	else output("torrent");
	output(" of seed flow out of your well-used hole.");

	output("\n\n<i>“Mmph, back to work...”</i> She groggily cleans herself up");
	if(!pc.isCrotchExposed()) output(" and tosses you your gear");
	output(". She waits for you to get yourself back together and on your feet, even fetching some water for you to drink. Eventually you get back to the customer area as Tuuva gets back to her counter.");
	processTime(60);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[=PB Cookie=]
// Hide this button until the PC has had sex with Tuuva
// Tooltip: You wonder how much Tuuva would like to have a peanut butter cookie.
public function pbcookie4Tuuva():void
{
	clearOutput();
	showTuuva(true);
	author("B");
	// Continue here if it’s the first cookie
	if(flags["TUUVA_COOKIES"] == undefined)
	{
		output("The silence of Tuuva’s blacksmith shop is interrupted by your rumbling stomach. You glance at your codex for the local time. ");
		//if {time is between 00:00 and 07:59}
		if(hours < 8) output("It’s well past everyone’s bedtime, but maybe Tuuva could go for a light midnight snack with you?");
		//if {time is between 08:00 and 11:59}
		else if(hours < 12) output("It’s around morning in Uveto; maybe Tuuva could go for a light, supplemental breakfast with you? You don’t even know if she’s eaten yet.");
		//if {time is between 12:00 and 05:59}
		else if(hours < 18) output("It’s about the afternoon on Uveto. You don’t know if Tuuva’s eaten her lunch yet; maybe she’d enjoy a light snack with you?");
		else output("It’s starting to get a little late on Uveto; you aren’t sure if Tuuva’s eaten her dinner yet. Maybe she’d like to have a light snack with you to tide her over?");

		output("\n\nYou ask Tuuva if she’s feeling hungry. In response, she looks down and pats at her belly. <i>“");
		if(!korgiTranslate()) output("Working hard lately, putting foodies off for short time. Could eating soon, Tuuva guess");
		else output("I’ve been working pretty hard lately, and I put off eating to focus on my work. I could go for something to eat, I guess");
		output(".”</i>");

		output("\n\nYou reach into your pocket");
		//if {PC is naked}
		if(silly) output("space that’s capable of folding into itself infinitely");
		output(" and begin rummaging around inside it for something to eat. You know that you had left some peanut butter cookies in there somewhere – you had made them a while ago and only remembered that you had them when your belly started rumbling. You withdraw a baggie carrying two of them and ask if she’d like to share one with you.");

		output("\n\nTuuva looks the baggie over, her eyes squinting at the cookies in the bag. <i>“");
		if(!korgiTranslate()) output("What is? Alien food? Is good for Korgonne eating? Any good tasting?");
		else output("What are they? Alien food? Is it safe for Korgonne to eat them? Do they even taste any good?");
		output("”</i> You reply that, where you come from, these are called ‘peanut butter cookies.’ If they weren’t safe for Korgonne to eat, your codex would have warned you by now, and you can guarantee that if there’s a more nostalgic tasting cookie in the universe, you haven’t found it yet.");

		output("\n\nTuuva scrunches her face in thought as she considers your words, and then outstretches her paw, wordlessly asking for one of your cookies. You withdraw one from the bag and give it to her; she turns it over and gives it a few sniffs. Her fingers are gentle, but even still, it begins to flake apart in her grip and crumble onto the top of her counter; without much more thought or forewarning, she opens up and crams the whole thing into her mouth before it can tear apart any more.");

		output("\n\nShe barely has time to register the texture of the flaky cookie in her mouth before her eyes widen and her pupils dilate. Her limbs go stock still, but you can clearly see her onyx nipples underneath and around the edges of her blacksmith’s apron grow hard as diamonds, jutting against the thick fabric of her clothing like concealed headlights. And, further south, you smell the familiar tang of a bitch in heat, accompanied by the unceremonious drip-drip-drip of her suddenly-aroused vagina. To say nothing of ");
		//if {natural}
		if(!tuuva.hasCock(GLOBAL.TYPE_EQUINE)) output("the canine cock sprouting immediately between her legs, pressing insistently forward and tenting her apron, followed by a quick dollop of her Korgonne precum staining it black.");
		else output("the horsecock flopping straight up, going from flaccid to full-throttle in the space of a few seconds; it bashes loudly against the underside of the counter, followed by what sounds like rain against a window – or, more likely, precum against stone.");

		output("\n\nShe looks up at you, tears welling in her eyes and her heart rate increasing rapidly, as she dares to bite into the cookie and experience its explosive flavor at the fullest; as soon as her teeth skewer the pastry, she shucks in a deep breath of air through her nose and, with what strength she has before her functions are diverted elsewhere, she rips off her apron, exposing all of herself to the air of her blacksmith – just as that very air is inundated with the flowing fluids and wafting stench of a herm on the verge of a <i>shattering</i> orgasm.");

		if(!tuuva.hasCock(GLOBAL.TYPE_EQUINE)) output("\n\nYou watch as her dog dick sprouts from herself, her cock being ushered forward and inflating to its full girth in the span of a few heartbeats; in the same amount of time, her knot expands, blasting from its protective sheath in mere seconds. Her fuzzy balls bounce, expand, and retract, in rhythmic beats in time with her canine cock, and it’s rather clear after a few heartbeats that they’re expanding with seed at a steady pace.");
		else output("\n\nWatching her equine cock expand at the speed it does is a spectacle itself: it drools her precum obscenely, even as the muscles inside it tighten and the veins popping out of it throb with power, lifting itself until the flat tip of her cannon sets its trajectory over her counter with no help from Tuuva at all. Her enormous, jet-back balls audibly gurgle as they flounce from side to side underneath the strength of Tuuva’s beating heart, their size and volume increasing as the seconds tick by with urgent jets of viscous cum, ready to fire at a moment’s notice.");

		output("\n\nShe bites into the cookie again, and breath leaves her nose in a needy, visceral groan; her eyes dart around the room, unfocused and almost panicked; the strength leaves her knees as she’s brought crashing down to the floor in her orgasmic bliss, the functions leaving her body in a rush. Cum <i>explodes</i> from her cock, ");
		if(!tuuva.hasCock(GLOBAL.TYPE_EQUINE)) output("slamming into the underside of the table with audible force");
		else output("arcing high and well over the countertop, splashing in a long, white strip across the floor of her shop ahead");
		output(", and before she even had the time to recoil from the first gout, the muscles in her cock ripple with her second load, and then her third, each of them as voluminous and high-pressured as the last.");

		output("\n\nTuuva’s retains the cognizance to use her hands somewhere: her right hand goes to her ");
		if(!tuuva.hasCock(GLOBAL.TYPE_EQUINE)) output("knot, massaging at it frantically, ushering each stream of pearly cum forward");
		else output("right nut, rubbing at it frantically to try and encourage out every drop of cum to paint her store with");
		output(", while her left hand dips lower, between her splayed legs, as she frigs at her clit vigorously; her cunt exudes splash after splash of feminine cum onto the floor beneath her, the puddle’s tides reaching to her split knees and rising against her body as the hurricane that is Tuuva’s cunt rains down more and more liquid beneath her.");

		output("\n\nHer jaw barely has the strength to bite into the cookie one final time, and once she does, her eyes cross and her arms tense against her genitals; a shudder overtakes her, starting from her loins and working its way to her extremities, including the head of her penis and the well of her pussy, blasting forth another wave of both her varieties of cum, adding the her increasing mess. Her dick lurches with every blob of cum that bubbles from inside her and thrusts forth; her hips jerk in time with her alternating orgasms, with her thrusting forward every time she cums from her cock, followed by an elongated, helpless squat as her cunt demands her body’s energy.");
		output("\n\nUnable to take any more, she finally swallows the cookie, and with that, one last impetuous wave of orgasmic bliss rocks her body, from her toes to her scalp. With her mouth no longer full, she’s free to groan to the heavens, her voice rocked and tone-deaf while her tired-but-not-spent loins launch their finals loads across her store. Her last shot of cum reaches the highest, arcing high enough for just a little bit of it to hit the ceiling; her pussy squeezes at nothing as it gushes the last of her feminine load, growing the pool beneath her until it’s large enough to soak her ankles.");
		output("\n\nTuuva twitches helplessly on her knees, her arms exhausted and her hands unmoving. Her tongue has fallen out of her mouth and her eyes focus directly above her, at the spot where her jizz had touched the ceiling of her smithy. Her breath is deep and rushed, but steady.");
		output("\n\nYou ask Tuuva if she’s still hungry. You have plenty more where that came from.");
		output("\n\nTuuva makes no movement, as exhausted as she is, but her eyes eventually fall to yours. She stares at you with a blank, listless expression, as though you hadn’t asked her anything at all, and she makes no effort to answer.");
		output("\n\nYou tell her that if she ever finds herself craving some more of the most delicious treat in the galaxy, you’ll be sure to share.");
	}
	// Continue here if it’s not the first cookie
	else
	{
		output("The silence of Tuuva’s blacksmith shop is interrupted by your rumbling stomach. You reach for your codex to look at the time, but just as you do, Tuuva is bounding on the spot in front of you, her tail wagging excitedly.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Hungry? Treat time? More buttery peanut cookies? Having more buttery peanut cookies, [pc.name]? Share with Tuuva?");
		else output("Are you hungry? Is it time for treat? More of those peanut butter cookies? Do you have any more peanut butter cookies, [pc.name]? Could you share with me?");
		output("”</i> she asks in a flurry. Her mouth begins to slobber, and she wipes at her jowls with the sleeve of her blacksmithing apron. She hasn’t even eaten any cookies yet, and already her nipples have gone from pillow-like pebbles to glass-cutting diamonds.");

		output("\n\nYou smile down at Tuuva impishly as you reach into your pocket");
		if(silly) output("space that’s capable of folding into itself infinitely");
		output(". You tell Tuuva that, if memory serves you correctly, you just happen to have a few cookies–");

		output("\n\nThe moment your hand withdraws the baggie of cookies, Tuuva is buck-naked, having stripped herself of her blacksmithing apron at the very sight of your peanut butter cookie treats. Unable to contain herself, she lunges at you, knocking you both to the floor; in the chaos, Tuuva grabs for the baggie, ripping it from your grip.");

		output("\n\nShe straddles your [pc.chest], her ");
		if(!tuuva.hasCock(GLOBAL.TYPE_EQUINE)) output("sheath bouncing happily against your body as it bloats only slightly with her dong as it anticipates the incoming ‘treat’");
		else output("horsecock flopping about listlessly across your neck, slapping you in the chin as she bounds on top of you in excitement. It’s not quite hard yet, but it’s getting there in a hurry");
		output(". She fumbles with the baggie, unsure of how to open it; frustrated and increasingly horny, she grips onto the clear plastic with the points of her claws and rips the whole thing apart.");

		output("\n\nBefore you have the chance to react to anything, Tuuva grabs onto both peanut butter cookies in the baggie, and shoves them into her maw simultaneously.");

		output("\n\nThe effect is visibly immediate: her pulse quickens, sending small vibrations through the jiggling flesh of her boobs, and the increased blood pressure floods to her ");
		if(!tuuva.hasCock(GLOBAL.TYPE_EQUINE)) output("sheath, causing her doggie dick to jettison from the saggy pocket between her legs. The pointed tip of her cock juts you in the chin, followed by a quick, warm splash of her precum, which is accompanied by a second and a third.");
		else output("horsecock; it was already large and daunting, but the rushing blood causes it to bloat wider and longer within seconds, until it encapsulates your entire vision. You can practically hear the rush of blood into her tool and sound of her elastic skin stretching to accommodate the monstrosity that is her cock. It draws along your face, leaving slimy trails of precum as it goes, until the head of Tuuva’s dick lines up with your scalp, where it deposits more and more premium loads into your [pc.hair].");

		output("\n\nNot to be forgotten, your [pc.chest] is soaked to the bone with the hot juices dripping from Tuuva’s cunt; as soon as she bites into the two cookies at once, she shakes violently on top of you and her thighs clench on your sides, pinching your torso between her thick legs, followed by heady splash along your torso. She squeals through her closed mouth, her eyes shut tightly, her hands on your [pc.chest], as she vigorously starts fucking your body, her cunt dragging line, watery lines as far down as your belly and as far up as your neck.");

		output("\n\nHer cock thrusts impiously with her lower body, ");
		if(!tuuva.hasCock(GLOBAL.TYPE_EQUINE)) output("stabbing you in the chin and marking fat lines of pre across your cheeks");
		else output("the thick of her meat grating against your cheek and nose while her cock head dumps bubbling load after load of pre along your scalp");
		output(". She lifts one arm to tug at her left nipple, pinching it and rolling the onyx nub between the digits of her paw. The other goes to her ");
		if(!tuuva.hasCock(GLOBAL.TYPE_EQUINE)) output("fuzzy nuts, themselves gurgling with suddenly pent-up need; it’s tough to tell between all the rocking motions atop of you, but with every forward lunge, despite the frequency of Tuuva’s leaking pre, you could swear they were getting bigger. With her free hand, she hefts them upward, getting them more comfortable as they grind against your chest, and as soon as they shift, you’re rewarded with another thick shot of precum in the face.");
		else output("leathery balls; they were already obscene against her diminutive frame, but now, they bloat with the sort of musky need that comes after a few weeks without release. Tuuva has to heft them one at a time in order to reposition them into a more comfortable position against your body, and with each heft and movement, you can hear the audible sloshing of her ready cum, despite the constant deposits her cock head is making against your scalp. And with each motion forward, they’re only getting bigger.");

		output("\n\nWith what conscious thought Tuuva still has, she moves her jaw again, chewing into the two cookies once more. The explosion of flavor in her mouth comes with a fresh, rocking wave of ecstasy along her loins: her body shivers and her eyes dilate, followed by ");

		if(!tuuva.hasCock(GLOBAL.TYPE_EQUINE)) output("a blast of hot, fresh, and voluminous Korgonne cum to the face; you lie there, pinned by the horny Korg’ii and helpless as Tuuva gives you a legendary moneyshot that coats you from your chin, to your cheeks, to your forehead, and beyond.");
		else output("waves of hot, fresh, and constant Korgonne cum expands Tuuva’s already intimidating horsecock and unloads wave after wave after wave onto the floor just beyond your head. You breathe a sigh of relief, thinking yourself too beneath her turgid tube to get any of her prodigious load onto your face, when, in her horny excitement,");
		output(" Tuuva rocks her body backward, her feminine half orgasming beyond her control, bathing your torso in her love as her pussy desperately cums and cums, searching for some phantom cock to milk for her needy seed.");
		if(tuuva.hasCock(GLOBAL.TYPE_EQUINE)) output(" Her exaggerated humping draws her back far enough that the bloated tip of her horsecock aligns itself almost perfectly with your face, and before you know it, in a single blast, your features are hidden beneath a veneer of thick, pearly white cum – and, before you have a chance to wipe any of it anyway, Tuuva deposits a second, musky layer.");

		output("\n\nTuuva throws her head back in pleasure as her two sets of genitals experience the absolutely life-changing orgasms, and in her haste, she swallows the remainder of the cookies in her mouth. Her legs clench down on you even harder; her body betrays her as the peanut butter ambrosia coats her throat and settles in her belly, and she bellows out to the air her pleasure as she continues to inundate you with her fluids. Your upper body is soaked in the flooding cascades of her pussy’s ejaculate, reaching as high as just above your [pc.chest] to as low as your groin, and everything in between. And, for your neck and above, everything is completely soaked in her cum");
		if(tuuva.hasCock(GLOBAL.TYPE_EQUINE)) output(", as well as a large portion of the floor beyond you");
		output(".");

		output("\n\nTuuva sits, gasping for breath, on top of your prone and messy body. Various limbs and extremities twitch in pleasure; her cock continues to seep cum, but at a much more reasonable rate, at least compared to just moments before. Her tongue hangs limply from her slack mouth and her eyes are focused on nothing at all.");

		output("\n\nShe remains limp as you finally move to push her off of you. She falls to the floor like a rag doll, her body folding over itself in its exhaustion. You think to ask her something – maybe offer if she’s in the mood for some more cookies. You’re sure you have some more somewhere – but you doubt you’d get an answer if you did.");
		output("\n\nYou pull yourself to your feet and make for the doorway of Tuuva’s smithy. You’re a bit of a mess, but hey, you got a pretty entertaining show out of giving her some peanut butter cookies.");
		
		// apply Cum Soaked and Pussy Drenched; increase Lust by 50
		pc.applyCumSoaked();
		pc.applyPussyDrenched();
	}
	IncrementFlag("TUUVA_COOKIES");
	pc.createStatusEffect("Tuuva Pooped");
	pc.setStatusMinutes("Tuuva Pooped",35);
	pc.lust(50);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}