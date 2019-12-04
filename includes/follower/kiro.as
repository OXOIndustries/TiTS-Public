public function kiroRecruited():Boolean
{
	return (flags["KIRO_RECRUITED"] == 1);
}
public function kiroIsCrew():Boolean
{
	return (flags["KIRO_ONBOARD"] == 1);
}
public function crewKiroBusy():Boolean
{
	return (flags["KIRO_DISABLED_MINUTES"] != undefined);
}
//Mitzi crew bonus and approach screen is clothing dependent:
public function kiroCrewBonus(btnSlot:int = 0, showBlurb:Boolean = true):String
{
	var buff:String = "";
	if(crewKiroBusy())
	{
		buff += "\n\nWhile Kiro is counted amongst your crew, she's too busy to be visited right now.";
		addDisabledButton(btnSlot,"Kiro","Kiro","Kiro's in no state to be interacted with right now. Check back later.");
		return (showBlurb ? buff : "");
	}
	var texts:Array = [];
	//<= 7 - smolballs. BehavedKiro.
	if(kiro.ballDiameter() <= 7)
	{
		texts = ["Kiro prowls around your ship for security flaws to tackle, keeping busy.","Kiro just finished eating a traditional kui-tan dish in the kitchen. The whole ship reeks of it.","Kiro's reading up on some of the latest Rush discoveries.","Kiro strolls back in with an armload of supplies. Most of the supplies are sexual in nature. Never change, Kiro.","Kiro passes by with an armload of soiled sheets for the wash. Messy girl!"];
		//GF only
		if(flags["KIRO_GF"] != undefined)
		{
			texts.push("Kiro squeezes your butt whenever she passes by you in the hallway, winking mischievously.");
			texts.push("Kiro sneaks up on you and plants a kiss on your cheek before vanishing down a corridor with a giggle.");
			texts.push("Kiro keeps herself busy helping out with the ship's maintenance, unwilling to risk her [pc.boyGirl]friend's safety for a moment.");
		}
	}
	//<= 14 - Big balls. Horny :3
	else if(kiro.ballDiameter() <= 14)
	{
		texts = ["You notice Kiro fidgeting more than normal - the cause is obvious when you see the bulge forming between her legs. The poor girl is starting to get pent up.","Kiro tries to help out around the ship, but she keeps popping open her codex's comms to answer messages from horny singles in her area.","Kiro keeps herself busy helping out, but any time you're in the area, she drops whatever she's doing to check you out. Somebody's horny!","Kiro lounges around, lazily paging through breedit's /r/RusherSluts board."];
		//GF
		if(flags["KIRO_GF"] != undefined)
		{
			texts.push("Kiro keeps 'accidentally' having wardrobe malfunctions that result in her flashing you her swelling nuts.");
			texts.push("Kiro likes to sneak up behind you and give you big hugs, her heavy, swelling balls pressing into you from behind.");
			texts.push("You catch Kiro in the middle of taking a 'nut-pic' to send your way. Instead of being ashamed, smiles and pulls down her top to flash the top deck too. Naughty girl.");
			texts.push("Kiro is actually cleaning up her room. It seems like having you as a [pc.boyGirl]friend is good motivation to start cleaning up after herself.");
			texts.push("Kiro admires a pair of your undies she put on her trophy wall. Yours are the only pair surrounded by heart stickers. When and where did she even get those?");
		}
	}
	//> 14: turbohorndog.
	else
	{
		texts = ["Kiro's not much good for anything with her balls as swollen as they are. She can't even sit down without spreading her legs so wide that the whole ship can see her package, not that her slinky dress ever did much to hide it.","Kiro lounges in her quarters, rubbing her nuts when she thinks nobody's looking - and sometimes when she thinks they are.","Kiro pops a boner the instant she sees you, or just about anyone else. The backed-up 'nuki really needs to let off some steam...","Kiro eats one-handed while browsing extreme extranet porn with the other, her cock more or less a permanent tent in her dress."];
		//GF
		if(flags["KIRO_GF"] != undefined)
		{
			texts.push("When Kiro's balls are this big, she's no good for anything except sending you love-dovey messages and the occassional unsolicited dick pic.");
			texts.push("Kiro's lips shine, and her lashes look longer than normal. The fact that she's wearing a bit of makeup shouldn't come as a surprise, given that her balls are swollen to an obscene level. Much bigger and she'll struggle to move...");
			texts.push("Kiro's balls are exceptionally swollen, a fact your girlfriend flaunts around you at every opportunity. Tease.");
		}
	}
	if(texts.length == 0) texts = ["AN ERROR IN KIROS CREW BLURB HAPPENED. NO TEXTS LOADED!"];
	buff = texts[rand(texts.length)];

	addButton(btnSlot,"Kiro",approachCrewKiro);
	
	return (showBlurb ? ("\n\n"+buff): "");
}

public function approachCrewKiro(back:Boolean = false):void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	//No special procs on "Back".
	if(back)
	{
		output("Kiro’s eyes twinkle. <i>“What now?”</i>");
		kiroCrewMenu();
		return;
	}
	//Full balls? Kiro'll drain 'em
	if(pc.hasStatusEffect("Blue Balls") && pc.hasCock())
	{
		fluffilyWhorishPawjobs();
		return;
	}
	//Orgy prompt!
	if((MailManager.isEntryUnlocked("kirofucknet") && flags["KIRO_ORGY_DATE"] == undefined) && pc.hasCock() && rand(4) == 0)
	{
		galLinkFuckMeetInvite();
		return;
	}

	if(kiro.ballDiameter() <= 7)
	{
		//BF approach
		if(flags["KIRO_GF"] != undefined)
		{
			output("Kiro’s face lights up at your approach. <i>“There you are, [pc.boyGirl]friend. Where have you been? Not lost in some ");
			if(rand(5) == 0) output("galotian’s cunt");
			else if(rand(4) == 0) output("myr’s plus-sized pussy");
			else if(rand(3) == 0) output("daynar’s eyes");
			else if(rand(2) == 0) output("leithan’s legs");
			else output("mad scientist's lair");
			output(" I hope!”</i> Pulling you into a hug, she gives you a peck on the cheek. <i>“What can I do for you, Captain?”</i> Her grin is as contagious as it is mischievous. <i>“Or to you?”</i>");
		}
		else
		{
			output("<i>“Hey there, Angel,”</i> Kiro says, smiling warmly as you approach. <i>“Back again already? Everybody needs a break now and again. Grab a drink out of the fridge, unless you’re planning to stay busy some other way...”</i>");
		}

	}
	else if(kiro.ballDiameter() <= 14)
	{
		output("<i>“Hello, Angel,”</i> Kiro throatily purrs as you approach. She shifts and twists, barely containing the poorly-smuggled cantaloupes below. <i>“Something you needed my help with?”</i>");
	}
	else
	{
		output("<i>“Welcome back,”</i> Kiro slowly drawls, obviously undressing you with her eyes as she does. One of her padded palms comes to rest on the small of your back, rubbing in slow circles as she admits, <i>“I’ve been saving up hoping that you’d want to help 'save' me again. I hope you’re ready for some fun....”</i>");
		output("\n\nThere’s no hiding the greatly swollen orbs dangling between her legs. Their fuzzy undersides are actually visible beneath the hem of her too-short dress.");
	}
	kiroCrewMenu();
}


public function kiroCrewMenu():void
{
	clearMenu();
	if(pc.lust() >= 33) addButton(2,"Sex",kiroCrewSexApproach,undefined,"Sex","Kiro has always been a creature of obscene sexual appetite. Just ask, and she'll be down for almost anything.");
	else addDisabledButton(2,"Sex","Sex","Kiro might be, but you aren't aroused enough for sex right now.");

	addButton(14,"Back",crew);
}
public function kiroCrewSexMenu():void
{
	//Pussfuckin funs~
	if(pc.hasCock())
	{
		if(pc.cockThatFits(kiro.vaginalCapacity(0) + 200) >= 0)
		{
			if(kiro.vaginas[0].hymen) addButton(0,"Fuck Vag.",takeKirosVirginity,undefined,"Fuck Her Vagina","Kiro seems excessively focused on her dick. Why not share the loving with her vagina?");
			else addButton(0,"Fuck Vag.",repeatVagFuckKiro,undefined,"Fuck her Vagina","You took her virginity; might as well see if she’s still just as tight.");
		}
		else addDisabledButton(0,"Fuck Vag","Fuck Her Vagina","You don’t have an appropriately-sized member for such an action. You’d split her in half!");
	}
	else addDisabledButton(0,"Fuck Vag.","Fuck Her Vagina","You need a penis to do this.");

	//Riding her dick
	if(pc.hasVagina()) addButton(1,"Get Fucked",vaginaRouter,[catchVaginalFromKiro,kiro.cockVolume(0),0,0,true],"Get Fucked","Let her bend you over her bunk and slam that thick dick home.");
	else addDisabledButton(1,"Get Fucked","Get Fucked","You need a vagina to access this scene.");

	if(kiroRoughButtfucks() > 0) addButton(5,"GetButtfuck",roughButtfuckFromKiroGo,false,"Get Buttfucked","Ask Kiro for another rough, buttfuck with plenty of spanking.");
	else addDisabledButton(5,"GetButtfuck","Get Buttfucked","You haven’t unlocked this scene yet. You’ll probably have to get her kinda irritated at you for this...");

	//Milking Stuff
	if(pc.hasCock()) addButton(2,"2xMilker",kiroMilkerDoubleTimeBySavin,undefined,"Milker Doubletime","Strap into Kiro’s milker with her for a fun, cock-draining evening.");
	else addDisabledButton(2,"2xMilker","2xMilker","You need a penis to participate in this scene.");
	addButton(3,"Hand Milk",manualMilkingFromSavin,undefined,"Hand Milk","Hand milk Kiro, and " + (kiro.canLactate() ? "you don't mean the lactic kind!":"she doesn’t lactate..."));

	//PUSSY PUMPIN~
	if(pc.hasItemByClass(SukMastr))
	{
		if(kiroTrust() >= 66)
		{
			if(pc.hasCock() && !pc.hasVagina() && (pc.cockThatFits(kiro.vaginalCapacity(0) + 200) < 0 && pc.biggestCockLength() < 20)) addDisabledButton(4,"PussyPump","PussyPump","You need a penis of a specific size or a vagina (in the usual location) to deal with the consequences of pumping up Kiro’s pussy.");
			else if(pc.hasCock() && !pc.hasVagina() && (pc.cockThatFits(kiro.vaginalCapacity(0) + 200) >= 0 && pc.biggestCockLength() < 20) && kiroTrust() < 75) addDisabledButton(4,"PussyPump","PussyPump","Kiro doesn’t trust you enough for this yet.");
			else if(pc.hasGenitals()) addButton(4,"PussyPump",treatedPussPumps,undefined,"PussyPump","Give Kiro’s pussy a thorough pumping up with the SukMastr 2000 you bought. She could spare to give her feminine side a little extra attention.");
			else addDisabledButton(4,"PussyPump","PussyPump","You need a penis or vagina (in the usual location) to deal with the consequences of pumping up Kiro’s pussy.");
		}
		else addDisabledButton(4,"PussyPump","PussyPump","Kiro doesn’t trust you nearly enough for that.");
	}
	else addDisabledButton(4,"PussyPump","PussyPump","You need a valid device for pumping up Kiro’s pussy.");

	if(kiro.ballDiameter() > 7) addButton(4,"Relief BJ",giveKiroSomeRelief,undefined,"Relief BJ","Slink under the concealing surface above and give Kiro’s poor balls the release they so desperately need. Besides, you were a little hungry, weren’t you?");
	else addDisabledButton(4,"Relief BJ","Relief BJ","Kiro’s balls don’t look swollen enough to need the relief right now, though they are quite large.");
	if(flags["KIRO_ORGY_DATE"] != undefined && flags["KIRO_ORGY_DATE"] + 2 < days && pc.hasCock()) addButton(13,"Fuckmeet",galLinkFuckMeetInvite,true,"GalLink Fuckmeet","Go to a GalLink Fuckmeet with Kiro - it'll be an orgy full of herms.")
	addButton(14,"Back",leaveCrewKiroSexMenu);
	/* OG VERSION REF:
	// Her balls are too damn big!
	if(kiro.ballDiameter() > 14) return kiroBallsSexMenu();
	
	clearMenu();
	
	//[Done] Catch Vaginal - 4000 words!
	//Kiro bends you over your bunk and slams that nukicock home.
	
	if(pc.hasCock()) addButton(2,"2xMilker",kiroMilkerDoubleTimeBySavin,undefined,"Milker Doubletime","Strap into Kiro’s milker with her for a fun, cock-draining evening.");
	else addDisabledButton(2,"2xMilker","2xMilker","You need a penis to participate in this scene.");
	addButton(3,"Hand Milk",manualMilkingFromSavin,undefined,"Hand Milk","Hand milk Kiro, and she doesn’t lactate...");
	//PUSSY PUMPIN~
	if(pc.hasItemByClass(SukMastr))
	{
		if(kiroTrust() >= 66)
		{
			if(pc.hasCock() && !pc.hasVagina() && (pc.cockThatFits(kiro.vaginalCapacity(0) + 200) < 0 && pc.biggestCockLength() < 20)) addDisabledButton(4,"PussyPump","PussyPump","You need a penis of a specific size or a vagina (in the usual location) to deal with the consequences of pumping up Kiro’s pussy.");
			else if(pc.hasCock() && !pc.hasVagina() && (pc.cockThatFits(kiro.vaginalCapacity(0) + 200) >= 0 && pc.biggestCockLength() < 20) && kiroTrust() < 75) addDisabledButton(4,"PussyPump","PussyPump","Kiro doesn’t trust you enough for this yet.");
			else if(pc.hasGenitals()) addButton(4,"PussyPump",treatedPussPumps,undefined,"PussyPump","Give Kiro’s pussy a thorough pumping up with the SukMastr 2000 you bought. She could spare to give her feminine side a little extra attention.");
			else addDisabledButton(4,"PussyPump","PussyPump","You need a penis or vagina (in the usual location) to deal with the consequences of pumping up Kiro’s pussy.");
		}
		else addDisabledButton(4,"PussyPump","PussyPump","Kiro doesn’t trust you nearly enough for that.");
	}
	else addDisabledButton(4,"PussyPump","PussyPump","You need a valid device for pumping up Kiro’s pussy.");
	if(kiroRoughButtfucks() > 0) addButton(5,"GetButtfuck",roughButtfuckFromKiroGo,false,"Get Buttfucked","Ask Kiro for another rough, buttfuck with plenty of spanking.");
	else addDisabledButton(5,"GetButtfuck","Get Buttfucked","You haven’t unlocked this scene yet. You’ll probably have to get her kinda irritated at you for this...");
	//THREESOMES~
	addButton(6,"Invite",inviteAFriendForKiroPlays,undefined,"Invite","Invite a friend to play with you and Kiro...");
	addButton(14,"Back",kiroMenu);
	*/
}

public function leaveCrewKiroSexMenu():void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("<i>“Actually... I changed my mind,”</i> you say, heading for the door.");
	output("\n\nKiro cocks her head. <i>“Really? Fucking </i>REALLY<i>?”</i> She snorts. <i>“Real cunty move, Angel. Fine.”</i> She heaves on her clothes angrily.");
	kiroTrust(-10);
	clearMenu();
	addButton(0,"Next",approachCrewKiro,true);
}

public function kiroCrewSexApproach():void
{
	// Pending panty event
	if(!pc.hasKeyItem("Panties - Kiro's - Lacy, black, and crotchless."))
	{
		if(pc.hasStatusEffect("Kiro Panties Event Queue") || (kiroTrust() >= 75 && !kiro.vaginas[0].hymen))
		{
			kiroginityEpilogue(true);
			return;
		}
	}
	clearOutput();
	showKiro();
	author("Fenoxo");
	
	output("As soon as you make the suggestion, Kiro leads you by the hand back to her quarters. At the door, she pulls you close, holding you so close that her [kiro.chest] press hard against your " + (pc.biggestTitSize() >= 1 ? "own":"your chest") + ", the growing bulge beneath her dress grinding itself against you. <i>“I thought you’d never ask, Angel,”</i> she says with a wink. <i>“C’mon in!”</i>");
	output("\n\nThe tanuki is naked by the time she’s three steps past the threshhold.");
	if(!pc.isCrotchExposed() && !pc.isChestExposed() && !pc.isAssExposed()) output(" You shed your garments in similar fashion, excitement mounting by the second.");
	else output(" You smirk knowingly at your own, pre-naked state. Today, it saves you time and affords you the chance to watch Kiro stripping down.");
	output("\n\n");
	showImage("SukebeKiroPoV");
	output("She winks back at you, mantling up onto a large, miraculously unstained cushion. Her horse-cock hangs out, proudly erect and well past the point of beginning to leak. <i>“Let’s have some fun,”</i> Kiro moans, giving herself a small stroke.");

	//[OPTIONS BITCH]
	kiroCrewSexMenu();
}
