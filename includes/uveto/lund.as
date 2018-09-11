//Name: Lund
//Personality: Fluffy with a Napoleon complex. Wants to dominantly dick down bigger aliens
//Physical: 5’4”</i>, muscled, ottermode. 10”</i> doggy cock with a fat knot. Fluffy tail. Pale blue fur like the Shoubust. Penis colour like the Shoubust too because it looks like a tasty lolly. Facial expression probably not like the Shoubust; he’s not very friendly to outsiders.

//Sex scenes
//Get doggied
//Dick him
//Ride him
//Bimbo sex (you get forced into this if you’re a bimbo)

public function showLund(nude:Boolean = false):void
{
	showBust("LUND" + (nude ? "_NUDE" : ""));
	showName("\nLUND");
	author("Wsan");
}

public function moveToLundsHouse():void
{
	currentLocation = "KORGII L10";
	if(flags["LUNDS_HOUSE"] == undefined) flags["LUNDS_HOUSE"] = 1;
	generateMap();
}

public function leaveLundsHouse(noMainMenu:Boolean = false):void
{
	currentLocation = "KORGII J10";
	if(!noMainMenu) mainGameMenu();
}

public function lundCumPlaceholder():PregnancyPlaceholder
{
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.shiftCock(0, GLOBAL.TYPE_CANINE);
	pp.cocks[0].cLengthRaw = 10;
	pp.createPerk("Fixed CumQ",250,0,0,0);
	
	return pp;
}

public function lundDommingPC():Boolean
{
	return (flags["LUND_PIERCED"] != undefined);
}
public function lundBroken():Boolean
{
	return (flags["LUND_BROKEN"] == 3);
}

public function lundsRoomBonus():Boolean
{
	if(flags["MET_LUND"] != undefined) output("Lund’s room would best be described as basic, though perhaps bare would be a better way to put it. Inside is a neatly-made bed and a chest of drawers and... nothing else. It’s not the biggest place either, but you suppose he doesn’t really need much room. It doesn’t look like he spends much time inside it, leading you to wonder why you’re here instead of elsewhere.");
	else output("This dwelling would best be described as basic, though perhaps bare would be a better way to put it. Inside is a neatly-made bed and a chest of drawers and... nothing else. It’s not the biggest place either, but you suppose the owner doesn’t really need much room. It doesn’t look like he spends much time here, leading you to wonder why you’re bothering to look it over so thoroughly.");
	return false;
}

public function lundHangoutBonus():Boolean
{
	if(flags["MET_LUND"] == undefined)
	{
		meetLund();
		return true;
	}

	//GOODBYE, LUND!
	else if(flags["LUND_FUCKED_OFF"] == 1) {}
	else
	{
		//"Missing
		if(lundBroken() || (lundDommingPC() && pc.hasGenitals())) 
		{
			//Already missing, don't reset timer ever.
			if(flags["LUND_MISSING"] != undefined && flags["LUND_MISSING"] + 45 >= GetGameTimestamp()) { }
			//Not yet missing, set timer
			else if(rand(15) == 0 && !pc.hasStatusEffect("Look_For_Lund_Cooldown"))
			{
				flags["LUND_MISSING"] = GetGameTimestamp();
			}
			//Now if missing, do some shit
			if(flags["LUND_MISSING"] != undefined && flags["LUND_MISSING"] + 45 >= GetGameTimestamp())
			{
				output("\n\nLund isn’t in his usual spot. Perhaps you could go looking for him.");
				addButton(0,"Look4Lund",look4Lund,undefined,"Look For Lund","Lund isn’t in his usual spot. Perhaps you could go looking for him.");
				return false;
			}
		}
		output("\n\nYou see the fluffy male korgonne, Lund, leaning against a wall and observing the hustle and bustle with a watchful eye. His eyes narrow when he sees you looking at him.");
		//Doggied: 
		if(flags["LUND_LAST_SEX"] == "Doggystyle") output(" You give him a friendly smile and he smirks, looking from side to side before crooking a finger to beckon you over.");
		else if(flags["LUND_LAST_SEX"] == "Dicked") output(" You give him a friendly wave and he looks away, turning his gaze to the side. He seems embarrassed about your last meeting.");
		else if(flags["LUND_LAST_SEX"] == "Rode") output(" You give him a casual smile and he looks around warily before settling his gaze back on you. He looks like he wants to talk.");
		addButton(0, "Lund", approachLund, undefined, "Lund", "Lund, a korgonne male, is here if you want to talk to him.");
		if(flags["LUND_PIERCED"] != undefined)
		{
			if(pc.hasGenitals()) 
			{
				if(pc.breastRows[0].piercing is LundsRings) addButton(1,"Submit2Lund",lundSubmissionThing,undefined, "Submit to Lund", "Lund already owns you. You may as well enjoy it.");
				else addDisabledButton(1,"Submit2Lund","Submit2Lund","How can you properly submit without your rings?");
			}
			else addDisabledButton(1,"Submit2Lund","Submit2Lund","Lund has no use for a slave with no genitals.");
		}
		if (flags["LUND_MADE_U_SUBMIT"] == undefined && flags["LUND_DICKED_DOWN"] != undefined)
		{
			if (flags["LUND_BROKEN"] == undefined)
			{
				if (!pc.hasCock()) addDisabledButton(2, "Break Him", "Break Him", "You need a dick to start breaking Lund in.");
				else if (!pc.hasItemByClass(Thong)) addDisabledButton(2, "Break Him", "Break Him", "You need a Thong to start breaking Lund in. You can purhcase a Thong on Tavros.");
				else addButton(2, "Break Him", lundBreakHim, undefined, "Break Him", "Start breaking your puppyboy in.");
			}
			else if (flags["LUND_BROKEN"] == 1)
			{
				if (!pc.hasCock()) addDisabledButton(2, "Break Him", "Break Him", "You need a dick to continue breaking Lund in.");
				else addButton(2, "Break Him", lundBreakHim, undefined, "Break Him", "Continue breaking your puppyboy in.");
			}
			else if (flags["LUND_BROKEN"] == 2)
			{
				if (!pc.hasCock()) addDisabledButton(2, "Break Him", "Break Him", "You need a dick to continue breaking Lund in.");
				else if (!pc.hasItemByClass(Anusoft)) addDisabledButton(2, "Break Him", "Break Him", "You need some Anusoft to continue breaking Lund in. You can purchase Anusoft Cream on Tavros.");
				else addButton(2, "Break Him", lundBreakHim, undefined, "Break Him", "Continue breaking your slutty puppyboy in.");
			}
			else if (flags["LUND_BROKEN"] == 3)
			{
				if (!pc.hasCock()) addDisabledButton(2, "Break Him", "Break Him", "You need a dick to continue breaking Lund in.");
				else addButton(2, "Break Him", lundBreakHim, undefined, "Break Him", "Go check up on your pet dogboy.");
			}
		}
	}
	return false;
}

//Mechanic: Store the last sex scene done with him so it can be referenced in the hallway blurb. Maybe elsewhere too.
//Meeting Lund
public function meetLund():void
{
	showLund();
	flags["MET_LUND"] = 1;
	output("\n\nWalking through the busy hallway of the Hold, you suddenly hear a voice ");
	if(pc.tallness > 6 * 12) output("from somewhere below you and look down, puzzled");
	else output("from behind you and look around, puzzled");
	output(".");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Hey you. Alien. This way, idiot.");
	else output("Hey, you. Alien. Come this way, idiot.");
	output("”</i>");

	output("\n\nTurning around to look at the source of the annoyed voice, you see a male Korgii leaned against the wall glaring at you. Pushing himself off with a quick movement, he walks over and ");
	if(pc.tallness > 5*12+4) output("looks up at you angrily.");
	else output("looks down his snout at you.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("You’re not a big deal");
	else output("You not big deal");
	output(",”</i> he says, poking you rudely in the chest. <i>“");
	if(!korgiTranslate()) 
	{
		output("Think you bigshot? No. Prouncing around on your stupid ");
		if(pc.hasHooves()) output("hoof-foots");
		else if (pc.hasLegFlag(GLOBAL.FLAG_PAWS)) output("paws");
		else if(pc.hasToeClaws()) output("clawfoots");
		else if(pc.hasLegFlag(GLOBAL.FLAG_HEELS)) output("heelfoots");
		else output("foots");
		output(". You might be invited, but not think you welcome.");
	}
	else
	{
		output("You think you’re a big shot? No. Prancing around on your stupid [pc.feetOrFoot]... you may think you were invited, but you aren’t welcome.");
	}
	output("”</i>");

	//[Fuck off] [Go away] [Leave]
	processTime(3);
	clearMenu();
	addButton(1,"Fuck Off",tellLundFuckOff);
	addButton(0,"Go Away",goAwayLund);
	addButton(14,"Leave",leaveAwayFromLundo);
}

//[Fuck off]
//only available to hard or mercenary. Locks you out from future interactions.
public function tellLundFuckOff():void
{
	clearOutput();
	showLund();
	output("<i>“Fuck off,");
	if(pc.tallness > 6*12) output(" runt,");
	output("”</i> you grunt roughly, pushing the annoying korgonne back against the ice wall hard enough to make him sharply exhale and slump downwards momentarily. <i>“I don’t have time for this bullshit.”</i>");

	output("\n\n<i>“You");
	if(korgiTranslate()) output("’ll");
	output(" regret that, alien,”</i> the korgonne coughs, looking up at you with hatred in his eyes as he gets up from the ground. <i>“");
	if(!korgiTranslate()) output("Mark words. Lund find you.");
	else output("Mark my words. I’ll find you.");
	output("”</i>");

	output("\n\nWith nothing more to be said, he stalks away without looking back. Well, one less asshole to deal with, at least.");
	//Probably want to set a flag for this in the event of a future combat scenario.
	flags["LUND_FUCKED_OFF"] = 1;
	variableRoomUpdateCheck();
	processTime(2);
	pc.addHard(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Go away]
public function goAwayLund():void
{
	clearOutput();
	showLund();
	output("You take his hand and remove it, letting go when he tries to snatch it back and glaring at him.");
	output("\n\n<i>“Don’t touch me unless I tell you to, ");
	if(pc.tallness > 6*12) output("runt");
	else output("creep");
	output(",”</i> you snarl, brushing your chest off for emphasis. <i>“I might be new here but that doesn’t mean you can just walk all over me.”</i>");
	output("\n\n<i>“Hm,”</i> the korgonne grunts, considering you. <i>“");
	if(!korgiTranslate()) output("You not like other alien. Just don’t bother Lund and we get along.");
	else output("You’re not like other aliens. Just don’t bother Lund, and we’ll get along.");
	output("”</i>");
	output("\n\n<i>“Who’s Lund?”</i> you ask, curiosity getting the better of you.");
	output("\n\n<i>“Me,”</i> he says, jabbing his thumb at his chest. You’re starting to get the feeling he just likes to point at things a lot. <i>“");
	if(!korgiTranslate()) output("Am");
	else output("I’m");
	output(" Lund.”</i>");
	output("\n\n<i>“I see... well, I won’t bother Lund, then.”</i>");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Is");
	else output("That’s");
	output(" good,”</i> he nods, and waves you along.");
	//set a flag for this
	processTime(4);
	flags["LUND_GO_AWAY"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Leave]
public function leaveAwayFromLundo():void
{
	clearOutput();
	showLund();
	output("You don’t really want to anger the korgonne when you’ve just gotten here. You turn to walk away and find he’s holding onto your arm, and you look back at him inquisitively.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Hey! You mute? Not talk");
	else output("Hey! Are you a mute? Can you talk");
	output("?”</i> he gestures at his mouth, watching you with a puzzled expression.");
	output("\n\n<i>“I just don’t want to bother you when you’re clearly already, ah, sensitive,”</i> you reply, looking ");
	if(pc.tallness > 12*5+4) output(" down");
	output(" at the furry creature.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Oh. Now Lund look like dumb asshole,");
	else output("Oh, so now Lund looks like a dumb asshole,");
	output("”</i> he says, taking his hand away. <i>“");
	if(!korgiTranslate()) output("You not like other alien, maybe. </i>Maybe.<i> Most real idiot.");
	else output("You’re not like other aliens, maybe. </i>Maybe.<i> Most are real idiots.");
	output("”</i>");
	output("\n\n<i>“So... you’re Lund?”</i> you ask.");
	output("\n\n<i>“Am Lund,”</i> he nods, jabbing a thumb at his own chest. You’re starting to get the feeling he likes to point at things a lot. <i>“");
	if(!korgiTranslate()) output("Biggest and bestest in hold.");
	else output("The biggest and best in the hold.");
	output("”</i>");
	output("\n\nLooking around, you’ve already seen evidence he’s clearly not the biggest, but now’s probably not the best time to bring that up. Instead, you nod and point down the hallway.");
	output("\n\n<i>“I’m going to go now,”</i> you say.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Okay, is good. Smart alien,");
	else output("Okay, that’s good. Smart, for an alien,");
	output("”</i> he says, and waves you along.");
	//set a flag for this too
	flags["LUND_LEFT_FOOLISH"] = 1;
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function approachLund(back:Boolean = false):void
{
	clearOutput();
	showLund();
	output("You approach Lund, already wondering what the fluffy dog-man will have to say to you.");
	if(back)
	{
		author("Fenoxo");
		output("Is there something else you’d like from Lund?");
		lundMenu();
	}
	//These 2 intro blurbs take priority over the below ones
	//First time you submit:
	if(flags["LUND_MADE_U_SUBMIT"] == 1)
	{
		output("\n\nYour heart is racing, your step light and quick, and your cheeks slightly flushed. It’s not enough to tip a regular person off, but the korgonne are a keenly perceptive folk. By the time you reach him, it feels like half the people you’ve passed have cast you a curious, knowing eye and a smile. That really only makes it worse, and by the time you actually reach Lund you’re breathing harder than you should be. You feel a little like a nervous virgin walking out to meet [pc.hisHer] boyfriend for an illicit rendezvous.");
		output("\n\n<i>“Hey, Lund,”</i> you say, smiling wide. <i>“How are you?”</i>");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Oh, alien friend now?");
		else output("Oh, are we friends now?");
		output("”</i> Lund replies, arching a fluffy brow. <i>“");
		if(!korgiTranslate()) output("The way you scream Lund name make it closer to pet, Lund think.");
		else output("The way you scream my name makes you closer to a pet, I think.");
		output("”</i>");
		output("\n\n<i>“I- well,”</i> you say, unsure of how to reply, <i>“I just thought-”</i>");
		output("\n\n<i>“Say it,”</i> Lund says, meeting your gaze. <i>“");
		if(!korgiTranslate()) output("Say alien Lund’s pet.");
		else output("Say you’re my pet.");
		output("”</i>");
		output("\n\n<i>“What?”</i> you bristle, somewhat angered by his arrogance. <i>“You listen to me, I’m n-”</i>");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Say pet or Lund not fuck alien");
		else output("Say you’re my pet, or I won’t fuck you");
		output(",”</i> he replies breezily, not breaking eye contact. You gape open-mouthed, not having expected the ultimatum. Given the situation, though, you really only have the one option.");
		output("\n\n<i>“I’m Lund’s pet,”</i> you mutter bitterly, hanging your head. It’s the truth, but you were hoping for something a little more amicable.");
		output("\n\n<i>“Louder,”</i> he commands you, waving his hand. <i>“");
		if(!korgiTranslate()) output("Whole crowd should know");
		else output("The whole crowd should know");
		output(".”</i>");
		output("\n\nYou turn around and, indeed, there’s at least ten korgonnes with their eyes on the curious alien. Some of them are grinning, others wary, some meek, but all of them are waiting to see how you’ll react. You hesitate for a moment, but the way forward is clear. An idea pops into your head then; maybe if you go above and beyond, you’ll be rewarded?");
		output("\n\nI-I’m,”</i> you begin, the audacity of what you’re doing swimming in your mind. You take a deep breath. <i>“I’m [pc.name], Lund’s little bitch pet.”</i>");
		output("\n\nAt first, nothing. Then you hear a snort, and by the time you locate which one of the young women made the sound, she’s doubled over in laughter and the others are breaking into fits of giggles. Soon enough the entire gaggle of girls are surrounding Lund, poking the <i>“alien tamer”</i> and hitting him on the arm for good measure. A couple of them give you some endearing pats before they leave, waving at you as they go.");
		output("\n\nYou feel slightly dumber for having done that. Lund just shrugs.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("It not like korgonne horrible people. So? Alien here to get fucked?");
		else output("It’s not like korgonne treat their pets badly. So, are you here to get fucked?");
		output("”</i>");
		processTime(5);
		flags["LUND_MADE_U_SUBMIT"] = 2;
	}
	//First time you dick him
	else if(flags["LUND_DICKED_REACTION"] == undefined && flags["LUND_COVERED_4"] != undefined)
	{
		flags["LUND_DICKED_REACTION"] = 1;
		output("\n\n<i>“Hiya cutie,”</i> you say, smiling wide. <i>“How’re you feeling?”</i>");
		//Bragged:
		if(flags["LUND_COVERED_4"] == -1)
		{
			output("\n\nLund bristles at your greeting, throwing you a baleful glare. <i>“");
			if(!korgiTranslate()) output("You make fun of Lund to girls.");
			else output("You made fun of me to the girls.");
			output("”</i>");
			output("\n\n<i>“Aww, it was just jokes!”</i> you insist, spreading your arms. <i>“I didn’t mean anything by it. You’re not any less of a man for liking my cock up your ass.”</i>");
			output("\n\n<i>“");
			if(!korgiTranslate()) output("Lund </i>not<i> like it,");
			else output("I </i>didn’t<i> like it,");
			output("”</i> he says pointedly, shaking his head. <i>“");
			if(!korgiTranslate()) output("Not do that again. Ever.");
			else output("Not doing that again. Ever.");
			output("”</i>");
			output("\n\nOh, well.");
		}
		//Covered for him:
		else
		{
			output("\n\nLund eyes you hesitantly, then nods. <i>“");
			if(!korgiTranslate()) output("Lund good. Alien maybe good person.");
			else output("I’m good. You might be a good person after all.");
			output("”</i>");
			output("\n\n<i>“Are you talking about how I stuck my neck out for you with those girls?”</i> you snicker, giving him a wink. <i>“So?”</i>");
			output("\n\n<i>“So... thanks,”</i> Lund says, averting his eyes, then looking back at you. <i>“");
			if(!korgiTranslate()) output("But we not do that again... Lund sore.");
			else output("But we can’t do that again... I’m sore.");
			output("”</i>");
			output("\n\nOh... maybe you should wait a little while before asking him for another ride.");
		}
	}
	else if (flags["LUND_BROKEN"] != undefined)
	{
		output("\n\n<i>“Hey there, cutey,”</i> you say, smiling at him. <i>“You sure look hot in all those clothes you’ve got on.”</i>");
		
		output("\n\n<i>“M-[pc.master],”</i> he pants, putting his hands out to touch you before realizing you’re the one who decides that. <i>“Welcome back!”</i>");
		
		output("\n\n<i>“Aww, thanks,”</i> you murmur, stepping closer and letting your hands run free through his thick fur as you pull him into a hug against your body. <i>“Always nice to see my favorite pet.”</i>");
		
		output("\n\nYou can hear his tail thumping against the wall behind him.");

	}
	//Defaults
	else
	{
		if(flags["LUND_LAST_SEX"] == "Doggystyle") 
		{
			output("\n\n<i>“");
			if(!korgiTranslate()) output("Oh? Alien back for more?");
			else output("Oh? You’re back for more?");
			output("”</i> Lund asks, watching you with interest. <i>“");
			if(!korgiTranslate()) output("Not surprised, seem like your thing. Happy to teach alien place.");
			else output("Not surprised. It seemed like your thing. I’m happy to teach you your place.");
			output("”</i>");
		}
		else if(flags["LUND_LAST_SEX"] == "Dicked") 
		{
			if(!korgiTranslate()) output("\n\n<i>“You,”</i> Lund scowls, looking from side to side. <i>“What you want? Here to rub in Lund’s face?”</i>");
			else output("\n\n<i>“You,”</i> Lund scowls, looking from side to side. <i>“What do you want? Here to rub it in my face?”</i>");
		}
		else if(flags["LUND_LAST_SEX"] == "Rode") 
		{
			if(!korgiTranslate()) output("\n\n<i>“You,”</i> Lund moans, looking from side to side. <i>“What you want? Lund’s hips still sore from last time.”</i>");
			else output("\n\n<i>“You,”</i> Lund moans, looking from side to side. <i>“What do you want? My hips are still sore from last time.”</i>");
		}
		else 
		{
			if(!korgiTranslate()) output("\n\n<i>“What alien want?”</i> Lund asks, neutral at least for the time being. <i>“Lund can talk. Not too much though, alien not </i>that<i> important.”</i>");
			else output("\n\n<i>“What do you want?”</i> Lund asks, neutral at least for the time being. <i>“I can talk. Not too much though, you’re not </i>that<i> important.”</i>");
		}
	}
	//[Appearance] [Lund] [Outside] [Sex]
	processTime(1);
	lundMenu();
}

public function lundMenu():void
{
	clearMenu();
	addButton(0,"Appearance",lundAppearance);
	addButton(1,"Lund",talkToLundAboutLund);
	if(flags["LUND_LUND_TALK"] == 1) addButton(2,"Outside",askLundAboutOutside);
	else addDisabledButton(2,"Outside","Outside","Maybe talk to him a bit about himself first.");
	if(flags["LUND_OUTSIDE_TALK"] == undefined) addDisabledButton(3,"Sex","Sex","Maybe talk to him a bit more before jumping his bone.");
	else if(pc.lust() >= 33) addButton(3,"Sex",lundSexStarter);
	else addDisabledButton(3,"Sex","Sex","You aren’t quite in the mood right now.");
	if(flags["LUND_PB"] == undefined) addButton(4,"PB Cookie",pbcookieForLund,undefined,"Peanut Butter Cookie","You wonder if Lund might enjoy having a peanut butter cookie.");
	else if(flags["LUND_MADE_U_SUBMIT"] != undefined || pc.isBimbo()) addButton(4,"PB Cookie",pbcookieForLund,undefined,"Peanut Butter Cookie","You wonder if you could get Lund somewhere private so you can give him another cookie...");
	else if(flags["LUND_PB_DISABLED"] == undefined) addButton(4,"PB Cookie",pbcookieForLund,undefined,"Peanut Butter Cookie","You snicker as you wonder to yourself if Lund is in the mood for another cookie. He certainly seemed to enjoy the last one!");
	else addDisabledButton(4,"PB Cookie","Peanut Butter Cookie","Lund has made it clear he won’t be going near those again!");
	addButton(14,"Leave",mainGameMenu);
}

//Appearance and Lund available first, then Outside after Lund, then Sex after Outside.
public function lundAppearance():void
{
	clearOutput();
	showLund();
	if (flags["LUND_BROKEN"] == undefined || flags["LUND_BROKEN"] == 1)
	{
		output("Lund stands at a very proud 5\' 4\", covered in pale blue fur. Though his coat is quite shaggy and thick, you can still see the musculature underneath. He’s not particularly big, but he is a very well-built biped in a compact package. Wearing nothing across his torso, you can see his well-defined pectoral muscles and multiple rows of abdominals. He has a brown cloth belt around his waist with two short hunting swords sheathed there, lustrous and clearly created with some care.");
		output("\n\nAround his wrists, he has some furry armlets that you suppose he wears to stay warm. You wonder how much good it’s doing him what with the bare chest and exposed skin, but he’s evidently managing. He at least has a sort of short, fluffy kilt covering his thighs, and furry anklets to match the ones around his wrists.");
		output("\n\n<i>“Don’t you get cold?”</i> you ask him. He only shrugs.");
		if(flags["SEXED_LUND"] != undefined) output("\n\nYou know from prior experience that though it’s hidden by his clothing and a sheath right now, Lund has a huge 10\" cock totally at odds with his relatively tiny frame. No wonder he’s so proud of himself. When he cums, a fat knot forms at the base of it, bulging with virility and ensuring his partner is going to be taking in - or swallowing - every shot of jizz he has to give.");
		//Dicked him:
		if(flags["LUND_DICKED_DOWN"] != undefined) output(" You also know, through intimate discovery, that he has a tight, sensitive asshole between his taut, firm buttcheeks that feels amazing to be inside.");
	}
	else
	{
		output("\n\nLund stands at a very proud 5\' 4\", covered in pale blue fur. Though his coat is quite shaggy and thick, you can still see the musculature underneath. He’s not particularly big, but he is a very well-built biped in a compact package. Wearing nothing across his torso, you can see his well-defined pectoral muscles and multiple rows of abdominals. He has a brown cloth belt around his waist with two short hunting swords sheathed there, lustrous and clearly created with some care.");
		output("\n\nAround his wrists, he has some furry armlets that you suppose he wears to combat the cold. You wonder how much good it’s doing him what with the bare chest and exposed skin, but he’s evidently managing. He’s got a cute little thong on below the belt, the only garment you’ve allowed him to wear. It does almost nothing to conceal what it’s meant to, but it looks sexy as hell on him.");
		output("\n\n<i>“Looking good, Lund,”</i> you murmur to him, putting your hand on his stomach and stroking him. He looks");
		if (pc.tallness >= 64) output(" up");
		output(" at you with a shy smile, lust in his eyes.");
		output("\n\nYou know from prior experience that though it’s just barely hidden by his thong and a sheath right now, Lund has a huge 10\" cock totally at odds with his relatively tiny frame. It’s amusing and more than a little hot to see just how much he cums from it when you fuck him in the ass, which has proven to be extremely sensitive.");
		if (flags["LUND_ANUSOFT"] == undefined) {}
		else if (flags["LUND_ANUSOFT"] == 1) output(" And that was <i>before</i> you used the Anusoft on him.");
		else output(" Now he has a lewd fuckhole back there totally unhidden by the line of the thong, just begging for you to slam your cock in and fuck it.");
	}
	clearMenu();
	addButton(0,"Next",approachLund,true);
}

//[Lund]
public function talkToLundAboutLund():void
{
	clearOutput();
	showLund();
	output("<i>“So what’s your story?”</i> you ask, nodding at the korgonne. <i>“Are you a guard?”</i>");
	output("\n\n<i>“Hunter,”</i> Lund corrects you, a hand slipping down to one of his sheathed blades. <i>“");
	if(!korgiTranslate()) output("Hunt for food.");
	else output("I hunt for food.");
	output("”</i> Unsheathing the sword and expertly flipping it around his wrist to hold it backwards, he inspects blade’s edge. <i>“Sometimes not for food. You?”</i>");
	flags["LUND_LUND_TALK"] = 1;
	if(!pc.isBimbo()) 
	{
		output("\n\n<i>“I guess I’m a hunter too,”</i> you say, shrugging. <i>“Hunting for probes my dad left behind.”</i>");
		output("\n\n<i>“Treasure?”</i> Lund asks, glancing at you curiously.");
		output("\n\n<i>“Something like that,”</i> you reply. <i>“At the very least, they’re worth a lot to me personally.”</i>");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Probe... here?");
		else output("The probe... it’s here?");
		output("”</i> he questions, pointing down. <i>“On planet?”</i>");
		output("\n\n<i>“I don’t think so,”</i> you say, shaking your head. <i>“I’m here for different reasons.”</i>");
		output("\n\n<i>“Hmm,”</i> he says, considering this. <i>“");
		if(!korgiTranslate()) output("Alien not so different. Sometimes hunt. Sometimes not hunt. Is life.");
		else output("You’re not so different. Sometimes we hunt. Sometimes we don’t hunt. It’s life.");
		output("”</i>");
		output("\n\nAbout as profound as a ");
		if(!korgiTranslate()) output("brokenly-translated ");
		output("hunter on a ball of ice is going to get, you suspect.");
		clearMenu();
		addButton(0,"Next",approachLund,true);
	}
	else
	{
		output("\n\n<i>“Um, kinda the same thing?”</i> you say, putting your finger on your lip. <i>“I gotta look for space probes ‘cuz my dad said so.”</i>");
		output("\n\n<i>“Treasure hunting?”</i> Lund asks, eyeing you up and down. <i>“");
		if(!korgiTranslate()) output("Lund not think alien suited to job.");
		else output("I don’t think you’re suited to the job.");
		output("”</i>");
		output("\n\n<i>“Aw, don’t be mean,”</i> you pout. <i>“They’re worth a lot to me, so I gotta find ‘em anyway.”</i>");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Probe... here?");
		else output("The probe... it’s here?");
		output("”</i> he questions, pointing down. <i>“On planet?”</i>");
		output("\n\n<i>“Nuh uh,”</i> you say, shaking your head. <i>“I’m here for fun, I just wish it was a little warmer on this planet!”</i>");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Lund think he know what you mean,");
		else output("I think I know what you mean,");
		output("”</i> he says, looking at your [pc.lipsChaste] intently. <i>“");
		if(!korgiTranslate()) output("Maybe can help warm alien.");
		else output("Maybe I could help you warm up.");
		output("”</i>");
		output("\n\n<i>“Oh, you’re so nice! You do look like you’d be warm if I hugged you...”</i> you say, looking at his coat of fur. <i>“Maybe we could get a little closer later...”</i>");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Lund cock get a little closer to your lips,");
		else output("My cock could get a little closer to your lips right now,");
		output("”</i> Lund says bluntly, looking you in the eye. <i>“");
		if(!korgiTranslate()) output("Recognize needy alien when see one.");
		else output("I recognize a needy alien when I see one.");
		output("”</i>");
		output("\n\n<i>“Oh gosh, I can’t say no to that,”</i> you giggle, looking from side to side. <i>“Is there somewhere we can..?”</i>");
		output("\n\nLund takes your hand and tugs you down the hallway, leading you through a network of confusing twists and turns until you have no idea where you are. That doesn’t really matter though because you can see a very promising bulge underneath the korgonne’s kilt, the indistinct shape occupying your mind’s limited real estate.");
		output("\n\n<i>“Here,”</i> Lund says abruptly, tearing off his kilt and throwing it at your feet. <i>“For ");
		if(korgiTranslate()) output("your ");
		output("knees.”</i>");
		output("\n\nYou automatically obey, wordlessly opening your mouth and finding it immediately occupied by ten inches of delicious canine cock. What follows is close to thirty minutes of Lund fucking your face however he wants, your head obediently bobbing up and down on his doggy dick as he explores your throat’s limits. When he fiercely thrusts himself to the base it’s completely without warning, leaving your lips planted on his sheath while he holds you there and groans in release.");
		output("\n\n<i>“Good,”</i> Lund grunts with some effort, holding you tightly against his groin. <i>“Tight.”</i>");
		output("\n\nIt <i>is</i> tight, you dimly realize, feeling his cock somehow shift around in your mouth. Oh, he has a knot! It’s waaaay too late to do anything about that, though... especially what with the hypnotizing way his warm seed keeps streaming down your throat. Soon enough your cheeks are hopelessly puffed outwards, his knot pressing your tongue downwards and keeping it immobile while he paints your insides.");
		output("\n\nYou may have just met, but you are <i>really</i> impressed with this studly little korgonne. Lifting a hand and dreamily running it over his flexed abs, you stroke and rub the defined musculature while Lund pumps you full of spunk. You hadn’t expected such a dominant male from such a species, but you were clearly wrong to think so. Feeling him strain against your hand as he cums, you gurgle around his knot while you follow suit.");
		output("\n\nIt’s just too hard to resist. The thought of a dominant man feeling good enough with your body to cum inside it is <i>such</i> a turn-on, and you secretly find yourself hoping this becomes a regular thing. Looking up at him to watch his expression of release, the manly way he grunts in exertion and grits his teeth, you think the Hold is going to be very fun after all.");
		output("\n\nWhen he’s finally finished, he wastes no time popping free of your throat, leaving you coughing momentarily while you become reacquainted with the idea of breathing without a cock in your mouth.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Alien good fuck,");
		else output("You’re a good fuck,");
		output("”</i> Lund sighs in satisfaction, picking up his kilt. <i>“");
		if(!korgiTranslate()) output("Even swallow. Good for something. Lund see you again.");
		else output("You even swallowed. Looks like you’re good for something. I’ll see you again.");
		output("”</i>");
		output("\n\nAnd just like that, he’s gone. From introduction to being used like a fuckdoll in under thirty minutes, then left panting like a whore with still-warm cum and spit dribbling all down your chin and onto your [pc.chest]. For just a moment, you wonder if this is what love feels like.");
		output("\n\nYou clean yourself off and make yourself as presentable as possible before meandering back into the tunnels. Miraculously, you find your way back to the hold without a hitch. Part of you wants to run straight back to Lund. Maybe he’ll fuck your slutty face again.");
		//Dump player somewhere in the hold. Maybe even a random location?
		pc.loadInMouth(lundCumPlaceholder());
		processTime(30);
		pc.orgasm();
		clearMenu();
		//maybe move somewhere
		currentLocation = "KORGII J10";
		generateMap();
		addButton(0,"Next",mainGameMenu);
	}
}

//[Outside]
public function askLundAboutOutside():void
{
	clearOutput();
	showLund();
	output("<i>“So how do you hunt in such a hostile environment?”</i> you ask, thinking about what lies outside the hold.");
	output("\n\n<i>“Purposeful");
	if(korgiTranslate()) output("ly");
	output(",”</i> Lund replies, serious. <i>“");
	if(!korgiTranslate()) output("Know exact where, how long, and safe caves. Need prepare too. Outside no joke. Not place for dumb alien.");
	else output("We know exactly where to go and for how long. We know which caves are safe. You need to prepare too. The outside is no joke - not a place for a dumb alien.");
	output("”</i>");
	output("\n\n<i>“I can handle myself,”</i> you tell him. <i>“I even rescued your princess from outside.”</i>");
	output("\n\n<i>“That </i>you?!<i>”</i> Lund exclaims, eyes widening. <i>“");
	if(!korgiTranslate()) output("Wait, maybe alien smart? Hmm.");
	else output("Wait, maybe you are smart? Hmm.");
	output("”</i>");
	output("\n\nYou roll your eyes, a gesture Lund likely doesn’t understand. <i>“Yeah, thanks for noticing.”</i>");
	flags["LUND_OUTSIDE_TALK"] = 1;
	if(pc.isBimbo() && pc.hasGenitals()) 
	{
		output("\n\n<i>“Whatever,”</i> Lund shrugs, blatantly checking your [pc.tits] out. <i>“");
		if(!korgiTranslate()) output("You dumbest smart alien Lund met.");
		else output("You’re the dumbest smart alien I’ve met.");
		output("”</i>");
		output("\n\n<i>“I’m not dumb!”</i> you protest, hands on [pc.hips]. <i>“I went to a good Terran acad-”</i>");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Lund let you suck cock if shut up,");
		else output("I’ll let you suck my cock if you shut up,");
		output("”</i> he says neutrally, watching your expression.");
		output("\n\nYou freeze with your mouth open mid-sentence and, decidedly unsubtly, look down the hallway to see if anyone’s watching before fixing your gaze on his kilt. <i>“Oh... well...”</i> you trail off.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Maybe smartest dumb alien, then?");
		else output("Maybe you are the smartest dumb alien, then?");
		output("”</i> Lund considers this, and shrugs before taking your hand. <i>“Come.”</i>");
		output("\n\nIn a private room, Lund has you on your knees and in front of his fat, juicy cock in moments. You’re about to start licking it when he flicks your forehead, and you recoil in confusion, looking up at him.");
		moveToLundsHouse();
		output("\n\n<i>“Beg,”</i> he tells you, pointing at his dick. <i>“Ask to suck.”</i>");
		output("\n\nYou’re way past resistance at this point. Nothing can come between you and your determination to wrap your [pc.lips] around the entirety of his hot, throbbing dog-cock until it spews seed into your throat. And besides - it comes naturally.");
		output("\n\n<i>“Pleeeeaaase let me suck your fat cock,”</i> you moan, wiggling your hips a little. <i>“I need to feel your warm, sticky seed in mmmmfffgbrl-”</i>");
		output("\n\nYour eyes widen then flutter in pleasure as Lund viciously thrusts his entire length into your mouth, pointed tip penetrating straight past your tonsils and into your bulging throat. You can’t help yourself, immediately wetting your ");
		if(!pc.isCrotchExposedByLowerUndergarment()) output("[pc.lowerUndergarment]");
		else if(!pc.isCrotchExposedByArmor()) output("[pc.armor]");
		else output("[pc.thighs]");
		output(" with ");
		if(pc.hasCock()) output("[pc.cum]");
		else output("[pc.girlCum]");
		output(". Your eyes roll back in your head with the thrill while your hips instinctively jerk up and down, not that Lund seems to notice or care.");
		output("\n\n<i>“Nnnngh,”</i> Lund grunts, running his hands through your [pc.hair] before");
		if(pc.horns > 0 && pc.hornLength >= 3) 
		{
			output(" wrapping them around your [pc.horns], smirking. <i>“");
			if(!korgiTranslate()) output("Lund can guess why alien have these.");
			else output("I can guess why you have these.");
			output("”</i>");
			output("\n\nWhether or not that’s their primary use, Lund’s definitely figured your body out quick. Using your horns to pull you up and down, he savagely bucks his hips against your face until spit is flying from your lips while you make wet gagging noises around the base of his cock.");
		}
		else if(pc.earType == GLOBAL.TYPE_LEITHAN || pc.earType == GLOBAL.TYPE_LAPINE || (pc.earType == GLOBAL.TYPE_SYLVAN && pc.earLength >= 3) || (pc.earType == GLOBAL.TYPE_DARK_SYLVAN && pc.earLength >= 3))
		{
			output(" wrapping them around your [pc.ears] with a snicker. <i>“Good for ");
			if(korgiTranslate()) output("a ");
			output("handhold.”</i>");
			output("\n\nWhether or not that’s their primary use, Lund’s definitely figured your body out quick. Using your long, sensitive ears to pull you up and down, he savagely bucks his hips against your face until spit is flying from your lips while you make wet gagging noises around the base of his cock. It hurts, but fuck if it isn’t so worth it...");
		}
		else
		{
			output(" planting his hands on the back of your head with a grin. <i>“Hold tight.”</i>");
			output("\n\nPressing your face into his abs repeatedly, he savagely bucks his hips against your face until spit is flying from your lips while you make wet gagging noises around the base of his cock.");
		}
		output("\n\n<i>“Glrk-! Gllllrrg,”</i> you gurgle when he holds you flush against the soft fur of his crotch, cock buried in your throat. You find yourself running your hands from his muscular thighs to his firm butt, lightly squeezing his cheeks in admiration while he holds you still.");
		output("\n\n<i>“Good noises,”</i> Lund pants, imbuing you with a sense of pride. <i>“");
		if(!korgiTranslate()) output("Alien sound best with lips around cock.");
		else output("You sound best with your lips around a cock.");
		output("”</i>");
		output("\n\nWell, duh! Is what you’d say if you could, but you settle for just sucking on his cock particularly hard. The way he shivers in response is just <i>so</i> fucking hot, and you hope he cums soon so you can listen to him groan in ecstasy while he drains his balls down your throat.");
		output("\n\nYou get your wish just a few minutes of facefucking later, obediently holding your throat open with your tongue at his balls as he cums forcefully into your mouth. He’s chosen not to tie you down this time, which makes you a little happy your neck won’t hurt but mostly sad you won’t get to sit there and suck on his fat knot. When he’s done, he pulls free and brusquely drags his cock from your forehead to your chin, wiping it off.");
		output("\n\n<i>“Thank ");
		if(!korgiTranslate()) output("Lund,");
		else output("me,");
		output("”</i> he tells you.");
		output("\n\n<i>“Thank y- glk,”</i> you choke, swallowing down some more of his semen while you pat your chest. <i>“Thank you Lund.”</i>");
		output("\n\n<i>“Good,”</i> he nods, scratching you behind the ear. <i>“See again soon.”</i>");
		output("\n\nHe leaves you to your own devices, sitting on your knees with your hands in your lap and swishing your tongue around your mouth just to make you swallowed <i>all</i> of his cum");
		//pc has waggable tail:
		if(pc.hasTail() && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output(", [pc.tails] wagging excitedly");
		output(". In a sort of cum-drunk reverie for a few minutes, you realize with a start that you should clean yourself up. It might actually be really fun to walk around with a shiny streak of Lund’s cum across your face - like being branded, almost - but you don’t think the other korgonnes would approve.");
		output("\n\nYou get yourself done up and head back to the main rooms of the Hold.");
		//Make a flag for this just in case so it can be referred to later.
		flags["LUND_OUTSIDE_BIMBO_BJED"] = 1;
		processTime(30);
		pc.loadInMouth(lundCumPlaceholder());
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",leaveLundsHouse);
	}
	else
	{
		processTime(3);
		clearMenu();
		addButton(0,"Next",approachLund,true);
	}
}

//[Sex]
public function lundSexStarter():void
{
	clearOutput();
	showLund();
	if(flags["LUND_BROKEN"] != undefined)
	{
		output("What do you want to do with your subby puppy?");
	}
	//First time
	else if(flags["SEXED_LUND"] == undefined) 
	{
		output("<i>“So what do you do for fun when you’re not people-watching in a hallway, Lund?”</i> you ask, poking fun.");
		if(pc.isBimbo()) 
		{
			output("\n\n<i>“");
			if(!korgiTranslate()) output("Fuck dumb alien,");
			else output("Fuck dumb aliens,");
			output("”</i> he says, the corners of his mouth turning upwards.");
			output("\n\n<i>“But there are no aliens around,”</i> you say, confused.");
			output("\n\nHe stares at you for a moment until it sinks in, and your face brightens. <i>“Ooohhh! You mean me,”</i> you giggle, smiling at him affectionately. <i>“You like me that much, huh? Don’t go falling in love!”</i>");
			output("\n\nHe takes a look at your beaming expression and sighs morosely, shaking his head before raising it to look at you. <i>“");
			if(!korgiTranslate()) output("Lund wonder how alien make it this far.");
			else output("I wonder how you made it this far.");
			output("”</i>");
		}
		else
		{
			output("\n\n<i>“Fuck,”</i> he replies matter-of-factly.");
			output("\n\n<i>“Fuck?”</i> you echo, somewhat torn between amusement and disbelief. <i>“So whenever you’re not here... you’re just fucking all the time?”</i>");
			output("\n\nHe shrugs, then nods. <i>“");
			if(!korgiTranslate()) output("Almost. Good for warm, good for fun, good for tribe. What not to love? Tribe female can’t get enough.");
			else output("Almost. It’s good for warmth, good for fun, and good for the tribe. What’s not to love? The tribe females can’t get enough.");
			output("”</i>");
			output("\n\n<i>“Sounds like you have your hands full then,”</i> you say, looking around at the fluffy korgonnes walking by. You have to admit you’re just a little envious of his extremely simple lifestyle.");
			output("\n\n<i>“");
			if(!korgiTranslate()) output("Could make room for alien too,");
			else output("I could make room for an alien too,");
			output("”</i> Lund says, his eyes narrowing. <i>“");
			if(!korgiTranslate()) output("You on bottom. Where alien belong.");
			else output("You’d be on the bottom, where you belong.");
			output("”</i>");
			output("\n\n<i>“Is that so?”</i> you ask, looking ");
			if(pc.tallness > 5*12+4) output("down");
			else output("up");
			output(" at the korgonne.");
		}
		
		processTime(5);
	}
	//Repeat:
	else if(pc.isBimbo()) 
	{
		output("<i>“Hey babe, you interested in some fun?”</i> you say, smiling deeply at Lund. <i>“I’ve got a present between my legs I think you’d enjoy...”</i>");
		output("\n\nHe sighs and shakes his head. <i>“");
		if(!korgiTranslate()) output("Alien not good for tease. Alien good for hard, wet fuck.");
		else output("You’re not good at teasing. You’re good at hard, wet fucks.");
		output("”</i>");
		output("\n\nHe leans off the wall, looking at your [pc.lips] with a measured expression. <i>“");
		if(!korgiTranslate()) output("Lund wonder if some way to keep pretty mouth without talk.");
		else output("I wonder if there’s some way to keep your pretty mouth without all the talk.");
		output("”</i>");
		output("\n\n<i>“Rude,”</i> you say, pouting. <i>“I could refuse you, you know!”</i>");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Lund not think so,");
		else output("I don’t think so,");
		output("”</i> he says, a knowing smile on his face. <i>“");
		if(!korgiTranslate()) output("Lund think you need his cock more than other way round.");
		else output("I think you need my cock more than the other way around.");
		output("”</i>");
		output("\n\nNeed his cock? The nerve! You don’t <i>need</i> anyone’s cock, especially not Lund’s fat, juicy dogdick. That overly large knot of his is only good for shoving in warm assholes and tight, wet cunts to make them juice themselves, anyway. Being bounced up and down on it while you scream in pleasure is definitely at the absolute bottom of your list, yes sir.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("You want hard fuck");
		else output("You want a hard fuck");
		output("?”</i> Lund says, waking you from your daydream.");
		output("\n\n<i>“Huh?”</i> you say, startled. <i>“Oh, yeah, thanks!”</i>");
		output("\n\nHow did he know?");
		
		processTime(5);
	}
	else
	{
		output("<i>“Interested in having some fun, Lund? Good for warmth, I think you mentioned?”</i> you ask, looking ");
		if(pc.tallness > 5*12+4) output("down");
		else output("up");
		output(" at the korgonne intently.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Always interest in fun,");
		else output("I’m always interested in fun,");
		output("”</i> he replies, leaning off the wall. <i>“");
		if(!korgiTranslate()) output("More interest in fucking alien through floor.");
		else output("But more interested in fucking you through the floor.");
		output("”</i>");
		
		processTime(5);
	}
	pc.lust(4);
	lundSexMenu();
}

public function lundSexMenu():void
{
	clearMenu();
	//[Doggystyle] [DickHimDown] [Ride him] [Leave]
	addButton(0,"Doggystyle",lundDoggyStyle,undefined,"Doggystyle","Get railed by the korgonne the way he knows best.");
	if(flags["LUND_BROKEN"] != undefined) addDisabledButton(1,"DickHimDown","Dick Him Down","There is no point in turning the tables on him if he is already your bitch!");
	else if(pc.hasCock() && pc.cockThatFits(500) >= 0 && !pc.isBimbo() && flags["LUND_MADE_U_SUBMIT"] == undefined && !pc.hasStatusEffect("LUND_DICKED_CD") && flags["LUND_COVERED_4"] != -1) addButton(1,"DickHimDown",penisRouter,[dickLundDown,500,false],"Dick Him Down","Teach the arrogant korgonne a thing or two about where he belongs.");
	else if(pc.isBimbo()) addDisabledButton(1,"DickHimDown","Dick Him Down","He’s wayyy too much of a stud for you to even think about dicking down a notch!");
	else if(flags["LUND_MADE_U_SUBMIT"] != undefined) addDisabledButton(1,"DickHimDown","Dick Him Down","After how he fucked you, you can’t even begin to imagine turning the tables on him!");
	else if(flags["LUND_COVERED_4"] == -1) addDisabledButton(1,"DickHimDown","Dick Him Down","After your bragging, you don’t think he’ll ever agree to this again.");
	else if(!pc.hasCock()) addDisabledButton(1,"DickHimDown","Dick Him Down","You sort of need a penis to dick him with...");
	else if(pc.hasCock() && pc.cockThatFits(500) < 0) addDisabledButton(1,"DickHimDown","Dick Him Down","His fuzzy little frame would rip in half. You’re wayyy too big.");
	else addDisabledButton(1,"DickHimDown","Dick Him Down","The buff little dog-dude is still kind of sore from the last time.");
	addButton(2,"Ride Him",vaginaRouter,[rideLundWheeee,lundCumPlaceholder().cockVolume(0),1,0],"Ride Him","Take your pleasure from him yourself.");
	addButton(14,"Leave",leaveLundsSexMenu,undefined,"Leave","You’re not in the mood right now.");
}

//[Doggystyle]
public function lundDoggyStyle():void
{
	clearOutput();
	showLund(true);
	flags["LUND_LAST_SEX"] = "Doggystyle";
	IncrementFlag("SEXED_LUND");
	var x:int = -1;
	var lundipoo:PregnancyPlaceholder = lundCumPlaceholder();
	
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	if(pc.isBimbo() && flags["LUND_BROKEN"] == undefined) 
	{
		output("<i>“So like, how do you wanna fuck?”</i> you say, tilting your head and putting some serious thought into it. <i>“I wanna-”</i>");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("You not get choice,");
		else output("You don’t get a choice,");
		output("”</i> he tells you, shaking his finger. <i>“");
		if(!korgiTranslate()) output("You not in charge. Lund know you prefer it. A man tell you where to go, what to do. How wide to spread legs. When to swallow.");
		else output("You’re not in charge. I know you prefer it this way. A man tells you where to go, what to do, how wide to spread your [pc.thighs], and when to swallow.");
		output("”</i>");
		output("\n\n<i>“I- Uuuhh,”</i> you mutter, losing yourself in his words. Gosh, he always knows just what to say to you...");
		//Next button -> goes to Bimbo Sex.
		clearMenu();
		addButton(0,"Next",bimboLundSex,x);
		return;
	}
	//If you’ve selected [Submit], you get a different scene the next time you pick Doggystyle:
	else if(flags["LUND_MADE_U_SUBMIT"] != undefined && flags["LUND_BROKEN"] == undefined)
	{
		//Just use a generic room with no exits :3
		currentLocation = "MYRNAS CAVE";
		generateMap();
		showName("\nLUND");

		output("<i>“So, uh,”</i> you say, eyeballing Lund’s loincloth. <i>“Any chance you wa-”</i>");
		output("\n\n<i>“Wanna fuck?”</i> Lund says, guessing correctly. <i>“");
		if(!korgiTranslate()) output("Sure. But we not go to room today. Okay?");
		else output("Sure, but we’re not going to the room today. Okay?");
		output("”</i>");
		output("\n\n<i>“Sure,”</i> you shrug, just grateful you’ll be getting that fat cock. <i>“Where are we going?”</i>");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Lund show you,");
		else output("I’ll show you,");
		output("”</i> he says, producing something from behind his back. <i>“");
		if(!korgiTranslate()) 
		{
			output("But first alien ");
			if(!pc.isCrotchExposed() && !pc.isAssExposed()) output("take off clothes and ");
		}
		else
		{
			output("But first you need to ");
			if(!pc.isCrotchExposed() && !pc.isAssExposed()) output("take off your clothes and ");
		}
		output("put this on.”</i>");
		output("\n\nIt’s... a leash. Lund has brought you a leash to wear, attached to a collar. You look at his face then back at the leash, about to say something when you notice the collar has some wording inscribed on it.");
		output("\n\n<i>“What does this say?”</i> you ask, already knowing the answer.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Not think alien have word for it. But close to ‘breeding bitch’");
		else output("I don’t think you have a word for it. But it’s close to ‘breeding bitch’");
		output(",”</i> Lund says, a hint of a grin showing. <i>“");
		if(!korgiTranslate()) output("Think alien suited to it.");
		else output("I think you’re suited to it.")
		output("”</i>");
		output("\n\nYou know you don’t have a choice. It’s wear this or don’t get your holes filled by Lund’s prick, and, well... that’s not really a decision, is it? You ");
		if(!pc.isExposed()) output("strip down, leaving your clothes in a nearby compartment, and ");
		output("take the leash from his hands, fastening the collar around your neck yourself. You guess you are now, more or less, officially Lund’s Bitch.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Have other gifts for alien too");
		else output("I have other gifts for you too");
		output(",”</i> Lund says cheerfully, his grin readily apparent now. <i>“But wait until later. Earn them. Now come.”</i>");
		output("\n\nHe tugs the leash just hard enough to make your head bow to him, stumbling along the floor behind him as he merrily walks down a corridor.");
		if(pc.isTaur()) 
		{
			output("\n\nSuddenly he stops and turns back to you, eyeing your tauric form with a new appreciation.");
			output("\n\n<i>“Actually,”</i> he declares proudly, <i>“");
			if(!korgiTranslate()) output("Lund have new idea.");
			else output("I have a new idea.");
			output("”</i>");
			output("\n\nYou very soon find yourself slowly walking through the Hold, completely naked and bereft of dignity, wearing a collar that calls you little more than a breeding bitch, and with a very proud korgonne on your back. Helpless to resist his advances, you’re forced to put up with it when he reaches forward to roughly grope your [pc.breasts] and pinch your [pc.nipples], trying to at least keep your slutty moans low enough not to be heard.");
			output("\n\nIt doesn’t help that passerbys are already gawking at your nakedness - your nipples as hard as diamonds - but when they pass by your back half you can hear giggles. Your face flushes red as you realize ");
			if(pc.isHerm()) output("your [pc.cock] is fully erect under your tummy, and your [pc.pussy] is slick, wetness dribbling down your hindlegs");
			else if(pc.hasCock()) output("your " + (pc.cockTotal() == 1 ? "[pc.cock] is" : "[pc.cocks] are") + " fully erect under your tummy, dripping pre-cum onto the ground beneath you");
			else if(pc.hasVagina()) output("your " + (pc.totalVaginas() == 2 ? "[pc.pussy] is" : "[pc.vaginas] are") + " slick and winking, [pc.clits] exposed to the world as wetness dribbles down your hindlegs");

			output(". Your only saving grace is that Lund himself can’t see how turned on you are from where he’s sitting.");
		}
		else
		{
			output("\n\nThe journey is embarrassing, to say the least. Walking ahead of him like you’re his fucking trophy wearing his name is enough, but the gawking passerbys really ratchet up the humiliation level until you’re walking with your head down to avoid the gazes. You jerk it back up with a yelp when you feel Lund’s fingers between your legs, fondling your ");
			if(pc.balls > 1) output("[pc.balls]");
			else if(pc.hasCock()) output("[pc.cocks]");
			else if(pc.hasVagina()) output("[pc.pussy]");
			output(" before sticking a finger right in your unprepared [pc.asshole]. You stiffen immediately, stretching your legs upwards before Lund tugs your leash again.");

			output("\n\nYou understand. He’s in charge, and he wants you to play the part. The rest of the walk is more like a guided tour, with Lund pointing out various parts of the Hold as he ‘steers’ you with two fingers up your asshole, holding you at both ends. Completely in his control, you’re helpless to do anything but follow his lead. To make matters worse, your ");
			if(pc.isHerm())
			{
				output("[pc.cocks] ");
				if(pc.cockTotal() == 1) output("is");
				else output("are");
				output(" standing at full attention while your [pc.pussies] ");
				if(pc.totalVaginas() == 1) output("is");
				else output("are");
				output(" dripping wet");
			}
			else if(pc.hasCock())
			{
				output("[pc.cocks] ");
				if(pc.cockTotal() == 1) output("is");
				else output("are");
				output(" standing at full attention and dribbling pre-cum");
			}
			else if(pc.hasVagina())
			{
				output("[pc.pussies] ");
				if(pc.totalVaginas() == 1) output("is");
				else output("are");
				output(" dripping wet, wetness slickening your [pc.thighs]");
				output(". Thankfully, Lund either doesn’t notice or chooses not to mention it.");
			}
		}
		output("\n\nWhen you finally arrive at your destination, the first thing you notice is the balmy sudden, blessed heat. Whether it’s just this room or it was gradual and you only just noticed it, the end result is that you’re so warm enough that being totally exposed is your only option. Clothes would be a hindrance. The next thing you notice is the... cavorting. Every single being in the room is engaged in a sexual act. Right in front of you, a naked korgonne woman looks you right in the eye and moans in orgasm, her considerable chest heaving as the man whose face her ass is occupying sucks her clit. Everywhere you look, korgonne women are being railed doggystyle, or riding someone’s face, or bouncing atop a man’s lap.");

		output("\n\n<i>“What is this place?”</i> you ask, curiousity overcoming you.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Breeding room");
		else output("The breeding room");
		output(",”</i> Lund informs you, spreading an arm. <i>“");
		if(!korgiTranslate()) output("Like Lund say. For fun, but... also for tribe. More warriors, more hunters, more workers.");
		else output("Like I said. It’s fun, but... also for the tribe. More warriors, more hunters, and more workers.");
		output("”</i>");
		output("\n\nThere’s a few gazes on you, but most of the room’s inhabitants are wholly focused on their own business. It’s actually somewhat refreshing to not be a walking curiosity in here for once. Your watching is interrupted by Lund’s decidedly unsubtle advances, bringing you back to the reality of why you were brought here.");
		if(pc.isTaur()) 
		{
			output("\n\nLund tugs your leash, shuffling backwards, and you slowly crane back until your humanoid half is resting on your tauric half’s back, lying right in front of Lund’s rapidly growing member.");
			output("\n\n<i>“Uh... are we going t-”</i> you start.");
			output("\n\nLund’s interruption comes in the form of a sharp exhale from his mouth as he jumps up, shuffling forwards with his hands on your shoulders and landing his ass squarely on your face");
		}
		else 
		{
			output("Spinning you around, Lund gently shoves you backwards against a pillar so you’re facing him and a little dazed. He has you sitting down in front of him before you know what’s happened, his hands lifting your arms above your shoulders and pressing them against the wall.");
			output("\n\n<i>“Ooh, I can see where t-”</i> you start");
		}
		output(". Leaning forward, he immediately shoves his cock right between your [pc.lipsChaste] and sinks himself to the hilt, leaving your eyes and throat bulging.");

		if(pc.isTaur()) output("\n\nWhat the fuck! This might be the most undignified thing a taur could ever do, having a hot, salty shaft sliding across your tongue where everything is out in plain view. He’s lucky you don’t buck him off right now! Reaching up with your arms, you get a good grip on his strong, defined waist and... fuck, this feels amazing. You can feel every little muscular shift, the sexy way his hips move as he needily pushes his big, swollen cock deeper into your throat, his furry balls nestled tightly against your nose... fuck it. His knot not coming into play yet, you have just enough room to squeeze your tongue out as he’s fucking your face and roughly lick his sack.");
		else output("\n\nGod! The way he immediately starts plunging into your throat makes your eyes water and your body shake, and you have nothing to brace yourself with while your arms are being held above your head. You look up at him helplessly and... honestly, the view from down here might be one of the sexiest things you’ve ever seen. Beneath his fur you can see his muscles working, getting a nice closeup of his washboard abs tensing with pleasure every time he thrusts himself to the hilt with your nose shoved into his groin. Even just the way his hips work, watching the motion is hypnotizing. It’s like he’s making passionate love to your face, and as far as you’re concerned you should be meeting him halfway - starting by squeezing your tongue out beneath his cock to roughly lick his prominent sack.");
		if(pc.isTaur()) output("\n\nAffectionately holding him in place");
		else output("\n\nHeld in place");
		output(" while he fucks your gullet, you open your eyes randomly in between tonguing his cum-filled balls and see the two of you have gathered quite a crowd. You can see a row of curious korgonnes encircling you, all watching Lund victoriously subjugate a big, tough alien by fucking [pc.hisHer] throat hard enough to make your eyes water a little. No doubt your ");
		if(pc.isTaur()) output("tauric");
		else output("alien");
		output(" form is a novelty to most, if not all, of them. Your lips curl into as best a devious smile as you can muster with your face being ridden by a korgonne stud, and you stretch your [pc.tongue] as far as it’ll go around Lund’s balls.");

		output("\n\nSome of the korgonne are already back to fucking even as they watch you, women gazing intently at the way your throat shifts and moves with Lund inside it while their men take them from behind. It doesn’t take long for him to start groaning in pre-orgasm pleasure, shuddering ");
		if(pc.isTaur()) output("atop");
		else output("against");
		output(" you, and you do all you can to encourage him to blow his load deep in your stomach. ");
		if(pc.isTaur()) output("Holding his butt while it tenses to perfect firmness");
		else output("Sucking him off as best you can with control out of your hands");
		output(", your eyes roll back in your head as you feel him bust a nut down your throat.");

		output("\n\nThough you can’t see it, you can hear it when he lifts his head and howls loudly in the room, his voice bouncing off the walls as he declares his dominance over you for all to witness. What with the way your throat is rapidly bobbing just to chug down his warm cum, you’re pretty sure it was already obvious, but this is probably more of a primal thing for him and the tribe. For your part, you’re content to ");
		if(pc.isTaur()) output("squeeze those muscular asscheeks");
		else output("just sit there like a good [pc.girlBoy]");
		output(" and let him finish himself off in your stomach.");

		output("\n\nHe graciously withdraws from your well-used mouth before his knot becomes unmanageable, and for his troubles you make sure to give his cock a nice, hard suck to clean it off on its way out, almost like you’re giving it a kiss goodbye. Given the way he shivers all the way down his spine, you think you earned his approval on that one. Shuffling off your face, he looks down at you with an expression approaching awe.");

		output("\n\n<i>“So,”</i> you say, making a show of licking all around your mouth and swallowing down his seed, <i>“do you want to get to the ‘breeding’ bit now?”</i>");
		output("\n\n<i>“Yeah,”</i> Lund breathes, nodding slowly. <i>“Yeah, breeding now.”</i>");

		output("\n\nYour sex is violent, erotic, and so good it makes your fucking eyes cross. There’s just something about having his giant knot plunging in and out of your [pc.vagOrAss " + x + "] that brings you to an explosive orgasm every single time, and that’s not even taking into account his insane stamina. He has you up against a wall grunting, ");
		if(pc.isTaur()) output("pawing at the ground");
		else output("thrusting back against him");
		output(", and screaming his name for everyone to hear. The other couples in the room can only watch in awe at the once-in-a-lifetime sight, an alien ");
		if(pc.isTaur()) output("with " + num2Text(pc.legCount) + " legs");
		output("being forcibly submitted by a ");
		if(pc.tallness >= 6*12) output("much smaller ");
		output("korgonne.");
		if(x >= 0) pc.cuntChange(x,lundipoo.cockVolume(0));
		else pc.buttChange(lundipoo.cockVolume(0));

		output("\n\nBy the time he’s finished with you, you’re practically wilting. Your entire body is covered in sweat and your ");
		//taur: 
		if(pc.isTaur()) output("hind half is");
		else output("ass and lower back are");
		output(" literally coated with warm cum both dry and still dripping, your chest heaves with every breath you take, ");
		if(pc.biggestTitSize() >= 3) output("your [pc.breasts] are swaying as you rest against the wall and pant");
		else output("your " + (pc.legCount > 1 ? "[pc.legs] are" : "[pc.leg] is") + " shaking with the effort of staying standing");
		output(". Lund has you dominated in both mind and body, and everyone in the room knows it, especially you. You can’t help but moan when he spanks you across your [pc.ass] and steps away, looking back at him with unsuppressed lust.");

		output("\n\nYou can’t help but laugh breathlessly when he raises his arm and receives a cheer from the other korgonnes in the room. The foreign alien, conquered! Fuck it, you’ll be his sexy trophy if he wants. He’s more than earned it with his stellar sexual performance and besides, you like him. You realize he’s turned back to face you, and you flash him a beautiful smile before sinking to your knees in front of him and dedicatedly sucking his bulging dick.");
		
		clearMenu();
		addButton(0,"Next",lundDoggyStyleSubmitEnd);
	}
	//Not bimbo:
	else
	{
		x = -1;
		if(pc.hasVagina())
		{
			x = pc.findEmptyPregnancySlot(1);
			if(x <= 0) x = rand(pc.totalVaginas());
		}
		moveToLundsHouse();

		if (flags["LUND_BROKEN"] == undefined)
		{
			output("<i>“So you wanna take me doggy, then?”</i> you say, smirking ");
			if(pc.tallness > 5*12+4) output("down ");
			output("at Lund. <i>“Try and take this");
			if(pc.tallness > 5*12*4) output("big, ");
			output(" dumb alien down a notch?”</i>");

			output("\n\n<i>“");
			if(!korgiTranslate()) output("You asking for it,");
			else output("You’re asking for it,");
			output("”</i> Lund warns you. <i>“");
			if(!korgiTranslate()) output("Lund going to fuck alien so hard you forget name.");
			else output("I’m going to fuck you so hard you’ll forget your name.");
			output("”</i>");

			if(pc.tallness >= 12*6) output("\n\n<i>“Wouldn’t expect anything less from my little man,”</i> you say, bending at the knees to look him in the eyes demeaningly.");
			else output("\n\n<i>“I don’t know if you’ve got the size for that, champ,”</i> you say, smirking at him. <i>“You might be a big boy here, but out among the aliens you come up a little... short.”</i>");

			output("\n\nHis eyes flash with a fiery anger, and you can hardly stifle your laughter. You’ve <i>really</i> riled Lund up now. This is looking like it’ll be one of the hardest fucks you’ve ever had, and you can scarcely bear the waiting. You let him walk you to his room, a playful smile lingering unseen on your face.");
		}
		else
		{
			output("<i>“Do you think you can handle fucking me, Lund?”</i> you ask him, fluttering your eyelashes at him. <i>“A nice reward for my little doggy pet, don’t you think?”</i>");
			
			output("\n\n<i>“F-fuck "+ (!korgiTranslate() ? "[pc.master]" : "you") +"?”</i> he says, gulping. <i>“"+ (!korgiTranslate() ? "Lund not know if... if okay" : "I don’t know if... is that okay") +"?”</i>");
			
			output("\n\n<i>“Of course it’s okay, silly pup,”</i> you reprimand him, flicking his snout lightly. <i>“I’m the one telling you to do it.”</i>");
			
			output("\n\n<i>“Oh, well,”</i> Lund says, nodding and rubbing his nose. <i>“Okay, [pc.master].”</i>");
			
			output("\n\nYou let him walk you to his room, a playful smile on your face. It should be fun to see how he handles getting unrestricted access to his master.");
		}

		if(!pc.isExposed()) output("\n\nThe way he strips you off is forceful, lusty, and one of the most erotic things you’ve ever had the pleasure of experiencing. His sheer desire, his raw lust for your body is palpable. " + pc.mf("You grunt in pleasure and slide your hands down his muscular back to his ass while he rubs your nipples with his thumbs, biting your neck and grinding against you","You cry out and wrap your arms around his muscular back when he bites a [pc.nipple] just hard enough to hurt") + ".");
		output("\n\nYou respond in kind, sliding your hands up and down his lower back, fingers creating furrows in his thick fur, roughly pulling the ");
		if(pc.tallness > 5*12+4) output("shorter ");
		else output("canine ");
		output("man");
		output(" against you. He pushes you down on the bed, sealing your lips with a fierce kiss, your [pc.tongue] enveloped by his own");
		if(!pc.isExposed()) output(" while he strips you down");
		output(".");

		output("\n\nYou stay like that on the bed for a moment, clasping his cheeks between your hands and pressing yourself into him until he pulls back, a fire in his eyes. ");
		if(pc.isTaur()) output("He doesn’t hesitate at all, moving to your [pc.ass] and pushing your [pc.tail] out of the way to get his eye on the goods.");
		else output("You don’t hesitate at all to turn around and thrust your [pc.ass] out at him, presenting yourself to your lover.");

		output("\n\nLund takes a fraction of a second to soak the sight of your ");
		if(pc.hasVagina()) output("[pc.pussies]");
		else output("[pc.asshole]");
		output(" in before ");
		if(pc.totalVaginas() > 1) output("picking one and ");
		output("shoving two fingers knuckle deep, then another. He’s measuring you up, you realize with a lusty moan. Testing whether you can take it. Apparently satisfied with the answer, he withdraws his digits from your ");
		if(pc.hasVagina()) output("dripping folds");
		else 
		{
			if(pc.ass.looseness() <= 2) output("tight");
			else output("stretchy");
			output(" hole");
		}
		output(" and immediately has his cock at ");
		if(pc.hasVagina()) output("the glistening entrance");
		else output("your ring");
		output(".");

		output("\n\nYou both cry out when he penetrates you, singing a lewd duet while he spreads your asscheeks and buries himself to the hilt. He doesn’t waste your time by spanking, squeezing or teasing you; all he wants to do is fuck you raw until you scream. Clamping his hands ");
		if(pc.isTaur()) output("around your relaxed hindlegs");
		else output("down around your [pc.hips]");
		output(", he begins to fuck you with heavy, pounding slaps of flesh, the noise resounding in his room.");

		output("\n\nYou grit your teeth and grunt in pleasure, aggressively pushing back into him on every instroke with your hands digging into his sheets, giving and taking in equal measure. You can feel his already expansive base thickening, beginning to stretch your hole to its limits, and bounce on his thighs even harder. There’s no way you’re letting him keep his big, fat knot on the outside. If you’re going to take him, you’re going to take <i>all</i> of him.");

		output("\n\nYour nonverbal message apparently getting through to the panting korgonne loud and clear, Lund responds to your desires the only way he can. ");
		if(pc.hasHorns() && pc.hornLength >= 3 && !pc.isTaur()) 
		{
			output("Grabbing your [pc.horns] from behind, he uses them as handholds to slam your ");
			if(pc.hasVagina()) output("sopping cunt");
			else output("overfull asshole");
			output(" with the force of a man twice his size.");
		}
		else if(pc.hasHair() && pc.hairLength >= 3 && (!pc.isTaur() || pc.hairLength >= 40)) 
		{
			output("Grabbing your hair from behind, he uses it to pull you back while he slams your ");
			if(pc.hasVagina()) output("sopping cunt");
			else output("overfull asshole");
			output(" with the force of a man twice his size.");
		}
		else 
		{
			output("His grip on you tightens threefold, grunting in exertion while he slams your ");
			if(pc.hasVagina()) output("sopping cunt");
			else output("overfull asshole");
			output(" with the force of a man twice his size.");
		}
		if(x >= 0) pc.cuntChange(x,lundipoo.cockVolume(0));
		else pc.buttChange(lundipoo.cockVolume(0));

		output("\n\nYou rut like mindless beasts, minutes passing by while your sweaty forms bounce and grab at each other, wordlessly fighting as the two of you seek to establish dominance over the other. Finally, though, you can feel Lund’s knot getting even bigger as he prepares to cum, his movements getting more frenetic and desperate. Though you’d never admit it out loud, you’re intensely grateful that you’ll be able to cum at the same time he will; in the lust for dominance, you’ve been fighting against the sensation of orgasm almost since he started railing you.");

		output("\n\nHe cums with a mighty roar, pushing down on your back hard enough to put your face in the sheets while he thrusts once, twice, then rams himself to the hilt, knot and all. ");
		if(x >= 0) output("Pussy juices squirt from around his knot again and again, your face scrunched up and teeth grit against the pleasure while you grunt and groan like an animal");
		else output("As taut as your asshole is, you can feel yourself flexing and tightening around him anyway, the intensity of your orgasm inciting your body to react instinctively, your face scrunched up and teeth grit against the pleasure while you grunt and groan like an animal");
		output(". Picturesque you aren’t, but right now you couldn’t possibly care less. The way you’re fucking rippling around his knot feels <i>so</i> goddamn good, and if his loud groans are any indication, he’s feeling it too");
		output("\n\nWhen he finally finishes, he leaves his knot inside you and plops down on your back with a grunt. You both take a deep inhale and groan, the exertion of the past half an hour washing over you in spades. Lund stretches atop you, limbs splaying to either side.");
		output("\n\n<i>“Guess they weren’t kidding it being about the size of fight in the dog,”</i> you mumble, reaching back to rub his neck scruff. <i>“That was... satisfying.”</i>");

		if (flags["LUND_BROKEN"] == undefined)
		{
			output("\n\n<i>“Satisfying? That it?”</i> he says abruptly, sitting back up and putting his hands on your back. <i>“");
			if(!korgiTranslate()) output("Lund go again.");
			else output("I’m going again.");
			output("”</i>");
		}
		else
		{
			output("\n\n<i>“"+ (!korgiTranslate() ? "Lund not stop there" : "I don’t want to stop there") +",”</i> he pants, sliding his hands back into place. <i>“[pc.Master]! [pc.Master]!”</i>");
		}

		output("\n\n<i>“Huh- Oh!”</i> you begin, before Lund cuts you off with a well-placed thrust. <i>“I- nngh! Hhhn!”</i>");
		output("\n\n<i>Fuck it,</i> you think, tongue lolling from your mouth. If he wants to show off his endurance and give you multiple orgasms during the act, he’s welcome to. Besides, the way he’s using that <i>goddamn</i> knot of his to fuck you now, you don’t really want him to stop anyway. Post-orgasm sensitivity betraying you in the worst way in your war for dominance, you’re forcefully brought to a groaning orgasm while Lund fucks your ");
		if(x >= 0) output("[pc.pussy]");
		else output("[pc.asshole]");
		output(" with abandon. ");
		if(pc.hasCock() && x < 0) output("[pc.Cum] spurts from your [pc.cocks], soaking the bedsheets beneath you and leaving a mark of your loss.");
		else if(pc.hasCock()) output("[pc.Cum] spurts from your [pc.cocks] onto the bedsheets even as your [pc.pussy " + x + "] grips and massages Lund’s cock, trying to entice him into cumming inside you to no avail.");
		else if(pc.hasVagina()) output("[pc.GirlCum] drips from your stretched-out entrance even as your [pc.pussy " + x + "] grips and massages Lund’s cock, trying to entice him into cumming inside you to no avail.");
		//Fen added for analbuttbois
		else output("Muscular ass-twitches massage Lund’s cock, trying to entice him into cumming inside you to no avail.");

		output("\n\nBy the time he <i>does</i> cum again, it’s on the heels of your third shuddering, moaning orgasm. The squeezing is just too much for him to hold out against, and he groans loudly as he paints your insides with creamy spunk all over again, adding to the jizz he’s already offloaded in you. Finally, his knot slips free and he sits back on his haunches, panting hard.");
		output("\n\nYou’re left huffing and covered in a sheen of shimmering sweat, heat rising from your bodies with visible steam, and you’ve probably gotten some bruises across your ass. But <i>fuck</i> if that wasn’t one of the most satisfying fucks you’ve ever gotten. The way your [pc.vagOrAss " + x + "] aches is incredibly satisfying, matched only by the warm, slow drool of Lund’s cum running down your backside.");

		if (flags["LUND_BROKEN"] == undefined)
		{
			output("\n\n<i>“Alright, we can call this a draw,”</i> you moan, pushing yourself up with shaky arms. <i>“I think you’ve proven you fuck as well as you talk shit.”</i>");
			output("\n\n<i>“");
			if(!korgiTranslate()) output("Some respect for alien,");
			else output("I have some respect for you,");
			output("”</i> Lund admits, leaning backwards and stretching. <i>“Could go again, though.”</i>");
			output("\n\nYou turn and eye him. Really, after that, he can keep going? Part of you wants to make him prove it, ");
			if(pc.isAmazon(false) || pc.isTreatedBull() || pc.PQ() >= 70) output("knowing that due to your exceptional strength you should be able to keep up.");
			else output("but you’re really not sure if you can keep up with him and you know for sure that if you show him weakness, he’ll take full advantage of it - and you.");
		}
		else
		{
			output("\n\n<i>“Good boy, Lund,”</i> you pant, rolling over onto your front and beckoning him towards you. He flops on top of you, and you scratch his head while his cum pools beneath you. <i>“Good boy. See, you can do it if you try.”</i>");
			
			output("\n\n<i>“"+ (!korgiTranslate() ? "Lund thank [pc.master]" : "Thank you, [pc.master]") +"”</i>, he moans, hugging you and relaxing against your body. <i>“So nice...”</i>");
			
			output("\n\n<i>“Mmm,”</i> you agree, thinking back on your little journey with Lund. You have to admit, it’s a nice perk to have his big, fat cock all to yourself. Not to mention he’s only too eager to fuck you any time you want it. Really, you have to congratulate yourself for your ingenuity.");
			
			output("\n\nYou give Lund a kiss on the snout before you leave, setting his tail wagging as he sits on the bed and watches you go.");
		}
		pc.orgasm();
		pc.orgasm();
		if(x >= 0)
		{
			pc.loadInCunt(lundipoo,x);
			pc.loadInCunt(lundipoo,x);
		}
		else
		{
			pc.loadInAss(lundipoo);
			pc.loadInAss(lundipoo);
		}
		//[Leave] [Again]
		clearMenu();
		addButton(0,"Leave",leaveLundSex);
		addButton(1,"Again",moreLundSex,x);
	}
	processTime(40);
}

public function lundDoggyStyleSubmitEnd():void
{
	clearOutput();
	showLund(true);
	output("Hours pass in the breeding room, most of which you spend being ridden");
	if(pc.isTaur()) output(", in both the metaphorical and literal sense,");
	output(" by Lund. You’ve noticed the korgonnes switching partners - well, most of them - but the same doesn’t seem to apply to you. You’re just for Lund, apparently. Maybe it’s the collar... ");
	//Already pierced!
	if(flags["LUND_PIERCED"] == undefined) 
	{
		output("and the shiny new nipple piercings. Hanging from each [pc.nipple] is a small golden ring, not unlike the type you might go see through the ear of a cowgirl. Lund said he liked them and, well, you weren’t going to say no to that. Besides... looking down at them now, hanging from your [pc.breasts]");
		pc.breastRows[0].piercing = new LundsRings();
		pc.breastRows[0].piercing.onEquip(pc);
		flags["LUND_PIERCED"] = 1;
	}
	else output("Besides, looking down at yourself right now");
	output(", you personally think it’s really hot to be marked so visibly.");
	output("\n\nBy the time the two of you leave, you’re fucked out for the day. Well, you might have one or two sessions with Lund left in you, but you’re okay for now. You give both him and his balls a warm kiss before you leave, heading back to the Hold proper. You’ll have to do this again sometime soon!");
	processTime(128);
	//add description for piercings:
	//Your nipples are each pierced with a small golden ring, courtesy of Lund. If you lift them to check, you can see inscriptions along the inside written in korgonne script. Lund only smiled when you asked him what they said, but you’re pretty sure you have a good idea. At least no-one else will know unless you tell them.
	clearMenu();
	addButton(0,"Next",move,"KORGII R43");
}

//[Leave]
public function leaveLundSex():void
{
	clearOutput();
	showLund();
	output("<i>“I’m sure you can, Lund,”</i> you tell him, smiling. <i>“But I have things to do.”</i>");
	output("\n\n<i>“Hmm,”</i> Lund says, measuring you up before nodding. <i>“");
	if(!korgiTranslate()) output("Lund think you telling truth. We continue some other time maybe.");
	else output("I think you’re telling the truth. We’ll continue some other time, maybe.");
	output("”</i>");
	output("\n\n<i>“Oh, you’d like that, wouldn’t you?”</i> you say, your smile turning into a grin. Well, truth be told, so would you. No reason he needs to know that right now though. You gather your things and leave Lund in his room.");
	processTime(3);
	//main menu, dump in Hold somewhere
	clearMenu();
	addButton(0,"Next",leaveLundsHouse);
}

//[Again]
public function moreLundSex(x:int):void
{
	clearOutput();
	showLund(true);
	output("<i>“Prove it then, big boy,”</i> you challenge him, ");
	if(pc.isTaur()) output("reclining your front half");
	else output("reaching back to spread your asscheeks for him");
	output(". You roll your eyes half in pleasure and half in disbelief when you feel his cock at your [pc.vagOrAss " + x + "] - you don’t think you’ve ever done so little work for such a big payoff.");
	output("\n\nAs it turns out, he was telling the truth. Very much so. He has you cumming hard within minutes, one orgasm rolling through your body after another. You can feel your tenuous grasp on this battle slipping, while Lund only seems more and more determined to prove his place in the two-person food chain. It’s becoming less of a fight for dominance and more of a competition of how many times Lund can make you double over in pleasure, groaning as your grip tightens on him.");
	output("\n\nWhen he finally cums for the third time, you’ve lost count of how many times you came all over his cock.");
	if(x >= 0) 
	{
		output(" You don’t even really question it when he shuffles to your front and presents it to you, sucking it clean and licking it all over just because you think he deserves it after such masterful work.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Alien tongue as good as fuck,");
		else output("Your tongue is almost as good as a fuck,");
		output("”</i> he sighs, looking down at you with a pleased expression. <i>“");
		if(!korgiTranslate()) output("Still seem eager... go again?");
		else output("Still, you seem eager... Want to go again?");
		output("”</i>");
	}
	else output(" He takes it from your abused asshole with a wet slurp and lays it between the cheeks of your [pc.ass], squeezing your butt to create some cleavage.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Alien has nice body,");
	else output("You have a nice body,");
	output("”</i> he admits, rubbing himself up and down. <i>“Go again?”</i>");

	processTime(20);
	for(var y:int = 0; y < 5; y++) { pc.orgasm(); }
	if(x >= 0) pc.loadInCunt(lundCumPlaceholder(),x);
	else pc.loadInAss(lundCumPlaceholder());

	//[Leave] [Again]
	clearMenu();
	addButton(0,"Leave",leaveMoreLundSex);
	addButton(1,"Again",evenMoreLundSex,x);
}

public function leaveMoreLundSex():void
{
	clearOutput();
	showLund(true);
	output("<i>“No,”</i> you pant, taking a deep breath and trying to hide how out of breath you are. <i>“No, I’m done for now. I have other things to do.”</i>");
	output("\n\n<i>“Sure,”</i> Lund shrugs disinterestedly. <i>“");
	if(!korgiTranslate()) output("Lund give you more when you come back.");
	else output("I can give you more when you come back.");
	output("”</i>");
	output("\n\nThat’s an arrogant assumption on his part, but... whatever. Thinking better of a repartee, you gather your things and leave Lund in his room.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",leaveLundsHouse);
}

public function evenMoreLundSex(x:int):void
{
	clearOutput();
	showLund(true);
	output("You can see now Lund wasn’t lying at all about how much time he spends fucking. He’s like a well-oiled machine, built to break and breed you. You can only imagine how voracious the korgonne women of this tribe must be to create such a product, but you have firsthand evidence of how they must fuck");
	if(pc.isTaur()) output(": incredibly hard.");
	else output(". Lund has his hands firmly on your upper back, holding you down while he brings you to yet another orgasm.");

	output("\n\nYou scream into his pillow, your muffled outburst only further spurring the hyperdominant korgonne into fucking you into the bed. You’ve never experienced this kind of challenge before, your body overwhelming your mind with sensations brought on by Lund’s sexual appetite. Even after he cums again, you don’t truly believe he’s done. And sure enough...");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Alien want more?");
	else output("You want more?");
	output("”</i> he asks, eyeing you.");
	output("\n\n<i>“You’re fucking unbelievable,”</i> you pant, still lying on your stomach clutching his pillow.");
	processTime(20);
	for(var y:int = 0; y < 5; y++) { pc.orgasm(); }
	if(x >= 0) pc.loadInCunt(lundCumPlaceholder(),x);
	else pc.loadInAss(lundCumPlaceholder());

	clearMenu();
	addButton(0,"Leave",leaveEvenMoreLundSex);
	addButton(1,"Again",evenEvenMoreLundSex,x);
}

//[Leave]
public function leaveEvenMoreLundSex():void
{
	clearOutput();
	showLund(true);
	output("Still, mustering the last bits of resistance you have towards just letting this stud bang your brains out, you have things to do. Or should be doing, anyway.");
	output("\n\n<i>“I have to leave,”</i> you groan, getting up from the bed.");
	output("\n\n<i>“Running away?”</i> Lund asks, moving aside to let you get up. <i>“");
	if(!korgiTranslate()) output("Lund think he see alien again real soon.");
	else output("I think I’ll see you again real soon.");
	output("”</i>");
	output("\n\n<i>“Yeah, well... maybe,”</i> you admit, gathering your stuff. You leave Lund in his room.");

	processTime(4);
	clearMenu();
	addButton(0,"Next",leaveLundsHouse);
}

public function evenEvenMoreLundSex(x:int):void
{
	clearOutput();
	showLund(true);
	output("<i>“Ffffuh-uuuuuck!”</i> you cry out, almost as much frustration as pleasure in your voice. Why can’t you fight this?! Have you just been deluding yourself the whole time, thinking you had a chance?");
	output("\n\nMid-thought, you feel Lund suddenly grab you from behind and, ");
	if(pc.isTaur()) output("exhibiting incredible strength, flip your entire tauric body over so you’re lying helpless and exposed, legs splayed to the side.");
	else output("showing off that he still has untold amounts of strength and endurance in reserve, flips you over onto your back.");

	output("\n\nLying there, eyes wide in half-shock and half-admiration, you realize the truth of the situation: he was never fighting you for dominance. He’s been breaking you in the entire time, easing you into being an unresisting fuck for him to enjoy. And as your fatigued hips begin to wildly buck once more, you realize you don’t care.");

	if(pc.isTaur()) output("\n\nYour legs thrash about so wildly Lund seizes your rearmost two, holding them wide open so he can plow your [pc.vagOrAss " + x + "] all throughout your orgasm");
	else output("\n\nLund leans forward and lifts your legs, holding your thighs and pressing down until your knees are besides your head, pounding the fuck out of your [pc.vagOrAss " + x + "] all the while");
	output(". Your voice comes out in a shaky, lilting scream of lust as ");
	if(pc.hasVagina()) output("juices spray from your squelching cunt");
	else output("your asshole squeezes down on Lund so tightly that for a moment he can’t move");
	output(", the overwhelming ecstasy just too much to resist.");

	output("\n\nYou look up at him, at your masculine stud, and see that despite his harsh breathing, sweat dripping from his body, and what must no doubt be aching muscles... he’s wearing a smile. He knows, you realize. He knows what you’re feeling, what you’re thinking. And as he forcefully ");
	if(pc.isTaur()) output("slams your [pc.vagOrAss " + x + "]");
	else output("contorts your legs to put them behind your head");
	output(", you can’t help but bite your lower lip and hope he fucks you even harder.");

	output("\n\nYou get your wish. In the small room, the noise of you being pounded out echoes off the walls and leaks under the door, the situation blatantly obvious for anyone walking by. You can’t stop your moans either, your voice climbing an octave with every thrust until it breaks and you’re left wordlessly gasping for air. When he cums, all you can muster is a breathless whine.");

	output("\n\n<i>“Hnnnnh,”</i> Lund yawns, stretching his arms out while still inside you, as if this is nothing more to him than a game. <i>");
	if(!korgiTranslate()) output("“Alien decent fuck. Go last round?");
	else output("You’re a decent fuck. Want to go one last round?");
	output("”</i>");

	output("\n\nYou could still leave with your dignity intact...");
	processTime(30);
	for(var y:int = 0; y < 3; y++) { pc.orgasm(); }
	if(x >= 0) pc.loadInCunt(lundCumPlaceholder(),x);
	else pc.loadInAss(lundCumPlaceholder());

	//[Leave] [Submit] [AmazonFuck]
	clearMenu();
	addButton(0,"Leave",leaveEvenEvenMoreLundSex);
	addButton(1,"Submit",evenEvenEvenMoreLundSex,x);
	if(pc.isAmazon(false)) addButton(2,"AmazonFuck",amazonFuckLundsShitUp,x,"Amazon Fuck","Show him how amazons do it.");
	else addDisabledButton(2,"AmazonFuck","Amazon Fuck","You’d need to be some kind of amazon for this.");
}
//[Leave]
public function leaveEvenEvenMoreLundSex():void
{
	clearOutput();
	showLund(true);
	output("You may have lost the battle, but you won’t let yourself lose the war. Slowly relaxing your limbs and groaning as you lift yourself off Lund’s bulging cock, you turn away and gather your things to leave. Lund reclines on his bed and waves you off, smirking all the while.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Lund probably see you again real soon, huh?");
	else output("I’ll probably see you again real soon, huh?");
	output("”</i>");
	output("\n\nYou think better of trying to reply, and instead slowly make your way back through the hold. Maybe next time you’ll take him down a notch or two... yeah, next time.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",leaveLundsHouse);
}

//[Submit]
public function evenEvenEvenMoreLundSex(x:int):void
{
	clearOutput();
	showLund(true);
	output("Finally, you just give up. After what feels like hours of being fucked you’re on your back, having willingly subjected yourself to ");
	if(!pc.isTaur()) 
	{
		output("tying your [pc.legs] behind your head with a waistcloth so Lund has easier access to your ");
		if(x >= 0) output("pussy");
		else output("asshole");
	}
	else output("having Lund coat your entire body in his jizz, marking you body and mind");
	output(". He beat you soundly hours ago, but you’ve been pretending otherwise until now. Now, as his hot, sticky spunk drips between your legs and he pulls himself free from your gaping ");
	if(x >= 0) output("pussy");
	else output("asshole");
	output(", you acknowledge he’s gotten the best of you. The evidence is all over your aching body.");

	output("\n\n<i>“More,”</i> you gasp, lying on your back while cum spurts from your ");
	if(x >= 0) output("spasming pussy");
	else output("puckering asshole");
	output(". <i>“Just keep fucking me!”</i>");
	output("\n\nNo response. You look up from the bed desperately and find Lund dispassionately inspecting his fingernails. After a few seconds of listening to your fevered panting, he looks at you with something approaching boredom and says a single word.");
	output("\n\n<i>“Beg.”</i>");
	output("\n\nYou’re incredulous. <i>Beg?</i> This arrogant little... little... your eyes fall from his face to his cock, still standing proud. It’s utterly soaked in his and your juices alike, practically shining with a thin sheen of lubricant. His knot is swollen, inflated to its maximum size, and you’d swear it’s fucking throbbing in time with the desirous ache in your ");
	if(x >= 0) output("pussy");
	else output("ass");
	output(". God fucking damnit, you need that back inside you.");
	output("\n\n<i>“Please?”</i> you try, pleading with him. <i>“Fuck me some more, Lund. I need it.”</i>");
	output("\n\n<i>“Not inspiring,”</i> Lund complains, looking at his other hand.");

	if(!pc.isTaur()) 
	{
		output("\n\n<i>“Fine!”</i> you cry, raising your [pc.hips] and reaching down. You pull ");
		if(pc.hasVagina()) output("the lips of your [pc.pussy] apart, exposing your glistening wet and still-dripping sex");
		else output("your asscheeks apart, exposing your still-flexing and dripping wet pucker");
		output(" and submissively present yourself to him. <i>“Put your god damn cock back in my slutty ");
		if(x >= 0) output("cunt");
		else output("asshole");
		output(" and give me more,”</i> you moan needily, shaking your hips at him. <i>“Fuck my stupid alien brains out!”</i>");
	}
	else 
	{
		output("\n\n<i>“Nnnnrgh,”</i> you pant angrily, your ");
		if(x >= 0) output("[pc.pussy]");
		else output("[pc.asshole]");
		output(" winking at Lund every second, glistening and still fucked full of spunk. <i>“Do you know what your cock is doing to me?! The fucking animal instincts- the breeding instincts that come with being a ‘taur? All I can think about, all I want right now is for you to shove that fat fucking cock of yours as deep as you can get-”</i>");
	}
	output("\n\nYou scream out in sudden ecstasy when Lund rams himself back home, falling back on the sheets as he holds one of your legs in place while he begins slamming you out all over again. You can scarcely believe the luck you’ve had finding such a virile stud, and protectively curl ");
	if(pc.isTaur()) output("one of ");
	output("your ");
	if(pc.legCount > 1) output("other ");
	if(pc.legCount <= 2) output("[pc.leg]");
	if(pc.legCount > 2) output("[pc.legs]");
	output(" around his back, bringing him closer and keeping him from getting away.");

	output("\n\n<i>“Lund,”</i> you whisper, grabbing the sheets as your back slowly begins to arch higher upwards in awkward, jerking motions with each thrust. <i>“Ohhh, Lund! Yes!”</i>");

	output("\n\nBy the time he cums inside you, you look like you’re in love with him. ");
	if(!pc.isTaur() && pc.hasToes()) output(" Toes curling, [pc.thighs] wrapped around his lower back and arms around his muscular shoulders, you gaze deeply into his eyes while you cum explosively, whimpering his name in desire.");
	else output("\n\n[pc.LegOrLegs] bucking while you try to keep them wrapped around his back, you look into his eyes and, shaking, cum explosively while whimpering his name in desire.");

	output("\n\nTo finish himself off, he breaks free of your grip and pulls himself out, jacking himself off all over your [pc.chest] and your face. Cum lands in your mouth, all over your chest and some of it gets in your eye, prompting you to wince in pain and keep it closed even as you gasp in pleasure. Fuck it, you can’t lie: it feels incredibly empowering to have a strong, studly man groaning while he blows his load all over your body.");

	output("\n\nHnnnnn-nngh,”</i> Lund grunts at length, stretching out and looking down at you after he’s finished. <i>“");
	if(!korgiTranslate()) output("Alien fuck not bad. Got to go, though.");
	else output("You don’t fuck too bad. Got to go, though.");
	output("”</i>");

	output("\n\n<i>“Oh... oh!”</i> you exclaim, suddenly realizing how long you’ve been in his room. Shit, you’ve spent half the day with your brains leaking out your ears in here! <i>“I’ll see you later, okay?”</i>");
	output("\n\n<i>“Nngh,”</i> Lund grumbles, scratching his ear.");
	output("\n\nYou gather up your things after wiping yourself down and head out. Though, honestly, now that you’re out here you have half a mind to march right back in and bend over in the doorway.");
	processTime(30);
	pc.libido(1);
	processTime(30);
	for(var y:int = 0; y < 3; y++) { pc.orgasm(); }
	if(x >= 0) pc.loadInCunt(lundCumPlaceholder(),x);
	else pc.loadInAss(lundCumPlaceholder());
	pc.applyCumSoaked();

	//set flag for having submitted
	flags["LUND_MADE_U_SUBMIT"] = 1;
	clearMenu();
	addButton(0,"Next",leaveLundsHouse);
}

//[AmazonFuck]
public function amazonFuckLundsShitUp(x:int):void
{
	clearOutput();
	showLund(true);
	output("<i>“Fuuuck,”</i> you groan, letting your limbs return to a relaxed, splayed position. You really got carried away there... hard not to when the fucking’s so good, though. You have to give him that, he’s more than earned your respect. It’d be really fun to just let him keep going, hammering your cunt until you’re passing out deliriously, but it might be even more fun if you got to bounce on that giant cock yourself.");
	output("\n\n<i>“If it’s the last round, let’s try something different, then,”</i> you say, idly getting up from the bed, careful to keep your dripping cunt in contact with his throbbing cock. It just feels so nice to have it rubbing against your lips. In a single swift movement, you have his fingers entwined in yours and use that to push the surprised korgonne down onto his back.");
	output("\n\n<i>“Wh-”</i> Lund starts before grunting in confusion, suddenly buried underneath a couple hundred pounds or more of amazon muscle. <i>“Ungh!”</i>");
	output("\n\n<i>“Like I said, something different,”</i> you say, smiling down at him. <i>“Just lie back and enjoy, okay? Think of it as repayment for being such a great fuck.”</i>");
	output("\n\nLifting your [pc.hips], you don’t hesitate to get right into the full swing of things. You both groan loudly when you slam them down onto his groin, your [pc.ass] resting comfortably atop his muscular thighs. Repeating the motion so emphatically it sounds like you’re being spanked, you can’t help but grin enthusiastically.");
	output("\n\n<i>“Pretty good, right?”</i> you pant loudly, watching Lund twist and grunt under you. <i>“C’mon, gimme that last load of yours.”</i>");
	output("\n\nAs durable as the korgonne is, you have to <i>work</i> for it. By the time he does cum, swearing loudly and bucking, both of you are dripping sweat and exhaling steam while gripping each other tightly enough to bruise. Shuddering and biting your lip as he blows his load inside you, you finally achieve release on top of him as you feel his knot stretching your walls wide. Tensing your thighs is all you need to keep him inside you and cumming, leaving you free to recline and enjoy the sensation.");
	output("\n\n<i>“Oh, fuck, that was </i>good<i>,”</i> you moan, head tilted back to look at the ceiling. <i>“Thanks, Lund.”</i>");
	output("\n\n<i>“Right,”</i> he mutters. <i>“");
	if(!korgiTranslate()) output("Alien getting off?");
	else output("You getting off?");
	output("”</i>");
	output("\n\n<i>“Fuck yea- oh, right,”</i> you realize, lifting yourself off his squeezed-dry cock. It comes free with a wet slurp, both of you wincing in pleasure at the stimulation. <i>“Okay, I’m gonna get outta here. See you soon, maybe!”</i>");
	output("\n\nGathering your things, you bend down to give the tired korgonne a quick kiss on his snout before leaving. He’s still lying there panting by the time you close the door. Poor guy, maybe you should have gone a little easier... but where’s the fun in that?");

	processTime(30);
	for(var y:int = 0; y < 3; y++) { pc.orgasm(); }
	if(x >= 0) pc.loadInCunt(lundCumPlaceholder(),x);
	else pc.loadInAss(lundCumPlaceholder());
	clearMenu();
	addButton(0,"Next",leaveLundsHouse);
}

//[DickHimDown]
//Need dick, can’t be bimbo. Can’t have submitted. When you dick him for the first time, apply a one-time 72 hour timer to taking the scene again to simulate him sulking. If you brag after doing it the first time, just lock it permanently.
//Fen note: pass through cock selection scene :3
public function dickLundDown(x:int):void
{
	clearOutput();
	showLund(true);
	output("<i>“I’ve got a problem I think you can... help me out with, Lund,”</i> you whisper, sliding your hand down your stomach to rest atop your groin.");
	if(pc.cocks[x].cLength() > 10) output(" <i>“It’s a big problem, but I think you can handle it");
	else output(" <i>“You should be able to handle it, big guy like you");
	output(".”</i>");

	if(flags["LUND_DICKED_DOWN"] == undefined && flags["LUND_BROKEN"] == undefined) 
	{
		output("\n\n<i>“");
		if(!korgiTranslate()) output("You want Lund to-");
		else output("You want me to-");
		output("”</i> he starts, looking at you incredulously then shaking his head. <i>“");
		if(!korgiTranslate()) output("Not think alien understand. Lund not do that.");
		else output("I don’t think you understand. I won’t do that.");
		output("”</i>");
		output("\n\n<i>“Aw, c’mon,”</i> you cajole him, rubbing his chest fluff. <i>“Big guy like you, I bet you’ve never even thought about how good it can feel. I bet I can make you cum like a frostwyrm.”</i>");
		output("\n\nLund fights an internal battle for a little while, but eventually loses to his curiosity.");
		output("\n\n<i>“Fine,”</i> he mutters, turning away. <i>“");
		if(!korgiTranslate()) output("But if Lund not like, punishment for alien.");
		else output("But if I don’t like it, I’m going to punish you for it.");
		output("”</i>");
		output("\n\n<i>“No need to worry about that,”</i> you tell him, smirking as you watch him start towards his room. You can hardly wait.");
		output("\n\nOnce you’re in Lund’s room, he’s refreshingly straightforward about it. Unclothed and on all fours upon his bed within a few seconds, he looks back at you with apprehension writ large on his face.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Well? Alien start?");
		else output("Well? Are you going to start?");
		output("”</i>");
		moveToLundsHouse();
		output("\n\n<i>“What?”</i> you say, confused. <i>“No, no - you need to be lubed up, first. Here, relax.”</i>");
		output("\n\nPlanting a hand on his right buttock, you take a second to admire Lund’s ass. He has the build of an athlete, and the muscle back here has just enough heft to support the tight, bubble-butt shape. It’s enough to make your mouth water.");
		output("\n\n<i>“Did you think I was just going to go in raw?”</i> you ask, shaking your head as you drool on your fingers. <i>“That’s real brave of you, but jeez. You’re not enough of an asshole for that.”</i>");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Not know alien rit- yawp!");
		else output("I don’t know alien rit- yawp!");
		output("”</i> Lund squeaks when you slip a lubed-up finger into his butt, immediately squeezing down on you so hard you can’t move it.");
		output("\n\n<i>“Relaaax,”</i> you reassure him, rubbing his ass with your free hand. <i>“Just getting you warmed up.”</i>");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Not f-feel nice,");
		else output("It doesn’t f-feel nice,");
		output("”</i> Lund moans from up front.");
		output("\n\n<i>“Just wait,”</i> you tell him, snaking an arm around his hips to rub his balls slowly.");
		output("\n\nHe responds to <i>that</i> pretty well, at least. You make comforting noises while you slip another finger inside the moaning korgonne, surprised at how well his tight little butt is taking this. He’s still working past the constant flexing, but once he manages to relax you think he’ll be in for a really, really good time. Angling your fingers downward, you start to gently rub along his walls until you locate what you’re looking for - the slight, sensitive protrusion of his prostate gland.");
		output("\n\n<i>“Nnn-?!”</i> he groans, his erect cock suddenly flagging. <i>“");
		if(!korgiTranslate()) output("What alien doing?");
		else output("What are you doing?");
		output("”</i>");
		output("\n\n<i>“Just a little massage,”</i> you murmur sensually, gliding your fingers over the spot again and again. <i>“Don’t worry about it too much, big boy.”</i>");
		output("\n\nIf his moans are anything to judge by, he won’t. Gradually, he relaxes his arms more and more, until finally he crosses them on the bed and lays his head atop them, keeping his ass high in the air for you to slowly fingerfuck. You can feel his cock drooling messily all over the hand you’re still rubbing his balls with, making a mess between his matted fur and ");
		if(pc.hasFur()) output("yours.");
		else output("your [pc.skinFurScales].");

		output("\n\nFor an anal ");
		if(flags["LUND_DICKED_DOWN"] == undefined) output("virgin");
		else output("amateur");
		output(", Lund is extremely sensitive. Every single touch of his prostate sets him shuddering, and it doesn’t take long for you to have him on the very precipice of orgasm, despite him getting in his own way.");
		output("\n\n<i>“Fuck!”</i> he gasps, trying to thrust himself back at you. <i>“So close!”</i>");
		output("\n\n<i>“No!”</i> you command him, spanking the korgonne lightly across his curvy asscheek. <i>“Be patient and let it come to you.”</i>");
		output("\n\nSurprisingly, or perhaps not given he must want to cum so badly after having your fingers pushing him ever-closer for several minutes, he acquiesces almost immediately with a forlorn moan. Wanting to reward his incredible obedience, you gently massage the spot you just spanked and murmur encouraging words to him.");
		output("\n\n<i>“What a good boy you are, Lund,”</i> you tell him seductively, a wide smile on your face. <i>“</i>Such<i> a good boy.”</i>");

		output("\n\nWhether by your praise or your unrelenting motions in his tight little asshole, Lund suddenly cries out in a high-pitched voice, shooting up back onto all fours in a flash and squeezing down on your fingers so hard you can only just barely move the tips. With a devilish grin, you do exactly that, rubbing his prostate as fast as you can between them as he moans his heart out.");

		output("\n\n<i>“Oh! Ohhh!”</i> Lund pants, tongue lolling from his mouth as he flexes his asshole around you multiple times a second. <i>“Gods!”</i>");

		output("\n\n<i>“Ooooh, yeah,”</i> you murmur, enjoying it almost as much as he is. Your hand cupping his warm, furry balls is suddenly soaked with slippery cum, an ever-increasing amount spurting from his limp, pulsating cock. <i>“You are just a sexy little bitch, aren’t you?”</i>");

		output("\n\nIf Lund hears you, he doesn’t give any sign of it. His back arches again and again as a truly impressive amount of hot cum splashes across your hand, his heaving balls summoning impossibly immense amounts of seed from such a small frame. He must be <i>really</i> turned on, you guess. The novelty of taking his <i>“first time”</i> has you pretty fucking hot yourself, you have to admit. Your [pc.cocks] ");
		if(pc.cockTotal() == 1) output("is");
		else output("are");
		output(" raging hard at the sight and feel of such a willing, virile stud subjecting himself to this treatment. Painfully hard, even. The easiest way to assuage that would be...");
		output("\n\n<i>“Hey cutie,”</i> you murmur in the gasping korgonne’s ear, <i>“time for the main event.”</i>");
		output("\n\nWithout even waiting for him to finish cumming, you withdraw your fingers, align your [pc.cock " + x + "], and slide yourself in to a cacophony of moans and garbled, unintelligible cries of confusion and lust from Lund.");
		output("\n\n<i>“Oh, fuck!”</i> you exclaim, getting a good grip on his asscheeks. <i>“Your asshole feels fucking </i>amazing!<i>”</i>");
		pc.cockChange();
		output("\n\nIt’s true, too - maybe it’s because he’s a strong, athletic male with a penchant for fucking and hunting, but this is somehow both the tightest and the most pliable ass you’ve ever fucked. Every thrust is like he’s gripping you tightly with his hands, enclosed in his fingers and being stroked up and down from head to base. Panting in fevered excitement, you push down on his upper back and get him in the position.");
		output("\n\nThe moment he’s down, keeping his perfect ass up in the air either by instinct or coincidence, you grip his jelly-like asscheeks hard enough to make him groan and begin fucking him as hard as you can. Any semblance of trying to gently guide him through the experience goes out the fucking window - even if you only get one shot to cum inside his ass, it’ll be worth it.");
		output("\n\n<i>“Oohhhh, god,”</i> you groan in ecstasy, eyes squeezed shut so tightly you can see stars bursting in your vision. <i>“Lund! Oh fuck, Luuund!”</i>");
		output("\n\nYou hammer his asshole with frenzied desperation, the slap of flesh on flesh resounding in Lund’s cramped room multiple times a second. Your voices reach a fever-pitch of lust when, after what can’t be any more than a couple of minutes of hard, sweaty fucking, you cum explosively deep inside Lund’s asshole.");
		output("\n\n<i>“Ho fuck,”</i> you gasp, pleasure radiating from your groin as you pour jizz into Lund’s guts. <i>“Nnnnnngggghh...”</i>");
		output("\n\nAfter taking a second to enjoy the sensation, you harden your resolve and start fucking him again - he’s so close to cumming on his own, you can feel it. Sure enough, he begins to tighten around you even as you orgasm, all but squeezing your spurting cock to ensure your jizz marks him as deep as possible.");
		output("\n\n<i>“Hhh- hnnnggggrrrr-! Hhhh</i>awooooo<i>!”</i> he suddenly cries, howling his lungs out. <i>“Nnnngh! Huhhnnn!”</i>");
		output("\n\n<i>“Awwww, theeeere you go!”</i> you exclaim, grabbing his chest fluff and rubbing it from above even as he grabs a pillow and stuffs it in his jaw to bite down on. <i>“What a good boy!”</i>");
		output("\n\n<i>“Ooooo,”</i> he whines through the pillow while you cum deep in his ass, <i>“Ooo... hhhhh...”</i>");
		output("\n\nTired and weak, he lets the pillow drop from his mouth, drooling onto his chest even as you pull him gently backwards into a hug. You ruffle the smooth fluff under his neck as he moans and slowly pull out from his asshole, letting your thick jizz slowly leak from his ass. Deciding to spend the next few minutes until Lund regains his senses taking care of him, you deign to lick and kiss the back of his neck, rubbing him all over.");
		output("\n\nSure enough, when he finally recovers from the intensity of your fucking, he flops forward onto the bed with a tired grunt and waves you away. Not wanting to impose, you quickly plant a kiss and a rub between his shoulder blades and quietly gather your things, leaving the probably-sulky korgonne to himself.");
		output("\n\nOut in the hallway, you pass by a little gaggle of fluffy korgonne girls milling about and give them a friendly wave. They reciprocate the gesture and, perhaps out of curiosity, eye you closer.");
		output("\n\n<i>“Lund howl");
		if(korgiTranslate()) output("ed");
		output("?”</i> one of the korgonne women asks, peering at you. <i>“");
		if(!korgiTranslate()) output("What alien do?");
		else output("What did you do?");
		output("”</i>");
		processTime(20);
		pc.orgasm();
		clearMenu();
		//[CoverForHim] [Brag]
		addButton(0,"CoverForHim",coverForHim);
		addButton(1,"Brag",dontCoverForLund);
	}
	else
	{
		if (flags["LUND_BROKEN"] != undefined)
		{
			output("\n\n<i>“Not that you’ll need much convincing </i>now<i>, but I’d like to fuck that tight little ass of yours, Lund,”</i> you tell him, rubbing under his snout. <i>“Would you like that?”</i>");
			
			output("\n\nHe looks starstruck. <i>“Uh huh.”</i>");
			
			output("\n\nYou chuckle. <i>“Thought so.”</i>");
			
			output("\n\nYou follow behind him with a smile, watching the way his ass moves in that thong you got him. It’s hypnotizing, swaying from side to side while the back rides up between his cheeks");
			if (flags["LUND_ANUSOFT"] != undefined) output(", doing nothing to cover the donut ring he has going on in the back");
			output(". Really, it might have been your best use of credits ever.");
			
			output("\n\nWhen you get to his room, you shut the door behind you and wait. As broken in as he is, Lund is quick to acquiesce and kneel before you. He’s all too eager and ready to prep you to assfuck him, and by now he has it down to an art.");
		}
		else
		{
			output("\n\n<i>“Fine, but only this once. No more,”</i> he warns, looking from side to side.");
			output("\n\n<i>“Awww, don’t worry,”</i> you murmur, getting closer to the bashful korgonne and running a hand through his hair. <i>“No-one will ever know how much you enjoy being my little </i>bitch<i>. Or what you sound like when my cock slides between your legs,”</i> you continue, moving your hand lower to rub his chest. <i>“That’s just for me and you, cutie.”</i>");
			output("\n\n<i>“Alright, alright,”</i> he mumbles, defeated and with a growing bulge beneath his loincloth. <i>“Come to ");
			if(korgiTranslate()) output("my ");
			output("room.”</i>");
			output("\n\nYou stride behind him with a smile across your face, feeling like a trillion bucks. Being guided to his own room by the adorable Korgii male you’ve bent to your will, so that you can get him on his back and make him cum all over himself while he moans your name? Yeah. You could <i>definitely</i> get used to this.");
			output("\n\nWhen you get to his room, you shut the door behind you and wait, standing there with a smirk. Lund turns to face you, confused.");
			output("\n\n<i>“");
			if(!korgiTranslate()) output("What alien doing?");
			else output("What are you doing?");
			output("”</i> he asks, already somewhat uncertain.");
			output("\n\n<i>“I’d just like you to get me ready to fuck you,”</i> you say innocently, gesturing at your crotch. He takes a step towards you and you stop him, pointing at his snout. <i>“With your mouth.”</i>");
			output("\n\nFor a moment, you can see him fighting this. His pride and dignity against your overbearing will and the fact he really, really wants to feel your [pc.cock " + x + "] inside him again. It doesn’t take long for the battle to be decided, and he drops to his knees in front of your grinning visage. He’s really yours now, and he knows it.");
		}
		output("\n\n<i>“Good boy,”</i> you tell him, ruffling his hair. <i>“Just do what comes natural, okay?”</i>");
		if(!pc.isCrotchExposedByArmor() && !pc.isCrotchExposedByLowerUndergarment()) 
		{
			output("\n\nSlowly stripping you out of your [pc.crotchCovers], Lund’s movements get faster and more desperate until finally, you sigh in satisfaction as your ");
			if(!pc.isErect()) output("half-erect ");
			output("cock is freed from its constraints. He’s hypnotized by it, staring and leaning into it without even realizing until his nose lightly taps the base.");
		}
		else if(!pc.isCrotchExposed()) 
		{
			output("\n\nLund slowly strips you out of your [pc.lowerGarments], taking his time and clearly savoring his prize. When your ");
			if(!pc.isErect()) output("half-");
			output("erect cock is finally revealed to him, he blushes slightly and leans forward into it.");
		}
		else
		{
			output("\n\nTreated to the sight of your cock ");
			if(pc.isErect()) output("bobbing excitedly");
			else output("slowly growing erect");
			output(" at eye-level, Lund can hardly resist blushing and leaning into it, clearly intent on helping it get as big as possible.");
		}
		output(" He takes your [pc.cock " + x + "] in hand and just holds it, steeling his resolve. You’re perfectly content to smile down at him and let the boy take his time - he’ll learn eventually.");

		if(pc.cocks[x].cLength() < 12) output("\n\nHe doesn’t bother to start slow, eliciting an automatic grunt of pleasure from your lips when he takes your entire length into his warm, wet mouth and curls his tongue around it. Gripping your [pc.thighs] tightly, he ");
		else if(pc.cocks[x].cLength() < 23) output("\n\nHe tries to suck your entire length into his throat, curling his tongue around you and eliciting an automatic grunt of pleasure from your lips, but gags halfway down your dick and has to back off. You ruffle his hair comfortingly and murmur soothing things, encouraging him to keep going and telling him he’s doing great. Suitably motivated, he grips your [pc.thighs] tightly and ");
		else output("\n\nHe doesn’t even bother trying to suck down your massive length, choosing instead to wrap his lips around the first six or so inches and curl his tongue around them. The way he works it makes you automatically grunt in pleasure, and soon he has both hands wrapped around your cock squeezing you lightly. Gripping you for support, he ");
		output("begins to bob on your [pc.cockHead " + x + "], ");
		if(!pc.isErect()) output("bringing you to a full, throbbing erection ");
		else output("making you shiver with pleasure ");
		output("within a few seconds. You let him go on servicing you just to get him into it, stopping him short and gently dragging his head back. Gracing him with a beatific smile, you motion for him to get up on the bed.");
		output("\n\nWith silent understanding, he mounts his bed on all fours, shaking his hips to one side to get the loincloth out of the way. The lines of his boyish bubble-butt create a perfect route for your eyes to follow right down to his tight little asshole, and you relish the sight for just a moment with your cock in hand.");
		output("\n\n<i>“Good boy,”</i> you whisper, gently stroking his lower back before running your hand down to his cheeks and getting a nice handful of athletic ass. <i>“Just relax now, Lund.”</i>");
		output("\n\nYou gently let the tip of your cock prod Lund’s asshole and to his credit, he doesn’t recoil or stiffen. He’s ready to be fucked, waiting for it even. His asshole would give way with ease if you pushed, accepting your entire length, but you hold off for now and let your pre-cum wet his ring. You want him to have the best time he can so he comes back next time wanting more. Feeling him getting antsy beneath you, you give him a light spank just to let him know who’s in charge. You can see his cock erect between his legs and steadily drooling pre-cum and finally, you can’t resist it any longer.");
		output("\n\nTaking his ass in both hands you gently lean into him, inexorably teasing him apart until finally, the head pops inside and he groans and bows his head. He’s so tight that you can barely make headway, having to pull the korgonne towards you as he moans in pleasure. After a few seconds of trying to trying to keep it slow,");
		if (flags["LUND_BROKEN"] == undefined) output(" you give up; he’s going to respond best to getting it hard, and besides... you get the feeling that’s what he’s waiting for.");
		else output(" you’re satisfied you’ve eased the well-practiced boy into it: it’s time for what both of you are really waiting for.");
		output(" Pulling his cheeks apart roughly, you begin to buck your hips enough to get an inch or two deeper with every movement, all while Lund’s moans get higher in pitch until it sounds like you’re doggying a girl for her first time.");
		
		if(pc.cocks[x].cLength() < 12) 
		{
			output("\n\nIt doesn’t take too long for you to get yourself ");
			if(pc.balls > 1) output("balls-deep");
			else if(pc.balls == 1) output("ball-deep");
			else output("hilted");
			output(" in him, and you can tell by the way he’s squeezing down on you he’s already close to cumming. He <i>is</i> sensitive, and you can’t help but grin as you think of how many times he’s going to get off before you do. This is going to be fun.");
		}
		else if(pc.cocks[x].cLength() < 23)
		{
			output("\n\nIt takes some time before you can get yourself ");
			if(pc.balls > 1) output("balls-deep");
			else if(pc.balls == 1) output("ball-deep");
			else output("hilted");
			output(", but you do manage it, much to your satisfaction. You can tell Lund is already close to cumming and with the bump of your [pc.cockHead " + x + "] showing through his tummy, it’s definitely not going to be long until he does, and that’ll just be the first. You grin as you think of how many times you’re going to make this sensitive korgii cum all over himself before you blow a load deep inside.");
		}
		else
		{
			output("\n\nThere’s no way you’re going to get your entire length inside him, but fuck if you’re not going to give it a shot. It seems like he’s appreciating your efforts if the way he’s squirming and crying out on the end of your prick are any indication, and with the way he’s squeezing down on you, he must be right on the edge of cumming. You’ve got close to two feet of fat cock inside him, and there’s a definite imprint of your [pc.cockHead " + x + "] on his tummy giving it some downward sag. You can’t help but grin when you think of how he’ll look when you’re done, having cum all over himself and full of yours.");
		}
		pc.cockChange();
		output("\n\n<i>“Alright cutie,”</i> you murmur, leaning over and draping yourself across his back. <i>“How are you feeling?”</i>");
		output("\n\n<i>“So close,”</i> he pants, squeezing down on you desperately. <i>“Sooo... nnngh!”</i>");
		output("\n\n<i>“Let’s get you there,”</i> you whisper, reaching down to entwine your fingers with his from above.");
		output("\n\nUsing your hips, you pull back and drive yourself back in as deep as possible. Lund cries out immediately, sounding every bit like a whore with her legs wrapped around a client’s back, and on the next thrust his mouth just gapes openly while he shakes.");
		output("\n\n<i>“Come on, babe,”</i> you whisper in the ");
		if(pc.tallness > 6*12+5) output("much smaller man’s");
		else output("korgii’s");
		output(" ear. <i>“I want to feel you when you cum. Cum all over my cock.”</i>");

		output("\n\nWith a shuddering groan, Lund’s back arches and a droplet of spunk hits the bed. Then another, and the next moment you’re tightening your grip on his hands and fucking the rest out of him with hard grunts of effort. He breaks into a howl instinctively but keeps it quiet, the stimulation of his asshole and prostate driving his orgasm onwards even as ropes of seed spurt from the end of his half-erect cock. You don’t stop pounding him throughout the entire process, and by the end of it he’s slumped beneath you with his snout in the sheets just moaning like a bitch.");
		output("\n\n<i>“Good boy,”</i> you pant, halting for just a moment. <i>“Do you wanna cum again, Lund? Say you want me to make you cum again.”</i>");

		if (flags["LUND_BROKEN"] == undefined)
		{
			output("\n\n<i>“Please,”</i> Lund moans, trying to thrust back into you. <i>“");
			if(!korgiTranslate()) output("Alien make Lund cum!");
			else output("Alien, make me cum!");
			output("”</i>");
			output("\n\n<i>“It’s not </i>alien<i>,”</i> you say, punctuating the word with a particularly rough thrust. <i>“It’s [pc.name]. Say it!”</i>");
			output("\n\n<i>“[pc.name]! [pc.name] make ");
			if(!korgiTranslate()) output("Lund");
			else output("me");
			output(" cum!”</i> he cries, fingers digging into his sheets.");
		}
		else
		{
			output("\n\n<i>“Please,”</i> Lund moans, trying to thrust back into you while his fingers dig into the sheets. <i>“Please, [pc.master]!”</i>");
		}
		output("\n\n<i>“Good boy,”</i> you tell him, and resume slamming your cock into his tight little asshole.");
		output("\n\nThe way he moves and cries out underneath you, you’re pretty sure you’ve got him cumming almost nonstop. By the time you’re ready to bust a nut inside him, he’s only too ready to receive it, moaning in ecstasy while his fingers rake the mattress with every thrust. You don’t bother to warn him, just pumping him harder until finally, the tingling sensation at the base of your cock coalesces into pure pleasure and you let out a loud groan of release.");

		var cumQ:Number = pc.cumQ();
		if(cumQ < 500) output("\n\nYou drive yourself to the hilt and let it go, splattering Lund’s insides with [pc.cumColor] jizz with every jerky thrust of your [pc.hips]. Lund can hardly help but blow his own load all over the sheets at the sensation, a reward for being such a good boy and taking it all. You squeeze and stroke his tight ass while you finish draining yourself inside him, letting the seconds go by in decadent pleasure.");
		else if(cumQ < 5000) output("\n\nYou drive yourself to the hilt and let it go, splattering Lund’s insides with massive ropes of [pc.cumColor] jizz with every jerky thrust of your [pc.hips]. Lund can hardly help but blow his own load all over the sheets at the sensation, a reward for being such a good boy and taking it all. You squeeze and stroke his tight ass while you slowly finish draining yourself inside him, letting the seconds go by in decadent pleasure.");
		else if(cumQ < 10000) output("\n\nYou drive yourself to the hilt and let it go, repeatedly splattering Lund’s insides with massive ropes of [pc.cumColor] jizz with every jerky thrust of your [pc.hips]. Lund can hardly help but blow his own much smaller load all over the sheets at the sensation, a reward for being such a good boy and taking all of the massive load you have to give. You squeeze and stroke his tight ass while you slowly finish draining yourself inside him, letting the minutes go by in decadent pleasure.");
		else if(cumQ < 25000) output("\n\nYou drive yourself to the hilt and let it go, repeatedly splattering Lund’s insides with massive ropes of [pc.cumColor] jizz with every jerky thrust of your [pc.hips]. Lund can hardly help but blow his own much smaller load all over the sheets at the sensation, a reward for being such a good boy and taking all of the massive load you have to give. You squeeze and stroke his tight ass while you slowly finish draining yourself inside him, letting the minutes go by in decadent pleasure.");
		else output("\n\nYou jump forward and send Lund toppling underneath you, trapping him there and wrapping your arms tightly around him so he can’t even move. With fierce, desperate motions of your hips you forcefully fuck your cum deep inside him, giving yourself a full second at the apex of each thrust to jet a huge, sticky load of [pc.cumColor] cum into Lund’s ass. Unable to even vocalize his pleasure, you can feel him squeeze down on you as he cums as hard as he can while getting filled to the brim with spunk. You can feel his tummy beginning to balloon and grin as you keep him down there, getting fucked to completion and then some. When you’ve really, truly finished with him, he’s bloated and desperately swallowing back down the hot cum that’s overflowing from his mouth. The mark of a bitch, for sure.");
		if(pc.hasKnot(x)) output("\n\nAfter that, you give him a taste of his own medicine. [pc.knot " + x + "] fully inflated inside his ass, you let him figure out on his own he’s going to be spending some more time underneath you. He doesn’t seem unhappy with the prospect, and you grin fiercely as you begin all over again.");

		output("\n\nBy the time you’re finished, Lund is destroyed. Ass up in the air like a good bitch and covered in sweat, his asshole ");
		if(pc.cocks[x].cLength() >= 12) output("gapes obscenely");
		else output("flexes and tightens repeatedly");
		output(", fresh spunk rolling down his thighs. Cleaning yourself up, you lean in to whisper that you’ll rut him even harder next time and collect your things, leaving him there on his dirtied bed with a huge smile on your face. That was nice. You’ll have to do it again soon.");
		processTime(30);
		pc.orgasm();
		if(pc.hasKnot(x)) pc.orgasm();
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	IncrementFlag("LUND_DICKED_DOWN");
	pc.createStatusEffect("LUND_DICKED_CD");
	//3 day CD.
	pc.setStatusMinutes("LUND_DICKED_CD",60*24*3);
	flags["LUND_LAST_SEX"] = "Dicked";
}

//[CoverForHim]
public function coverForHim():void
{
	clearOutput();
	leaveLundsHouse(true);
	generateMap();
	showName("\nCOVERING!");
	output("<i>“Oh, uh... he was just surprised my throat is ribbed,”</i> you say, making something up on the spot. <i>“You know how primal it can be when a guy cums really hard.”</i>");
	output("\n\n<i>“Oh, uh huh, uh huh,”</i> the women nod, looking knowingly at each other. Based on what your codex says about korgonne mating habits, you’re not surprised. They probably make their men howl on a regular basis. Curiosity assuaged, they bid you goodbye and disappear around the corner.");
	output("\n\nThe korgonnes might think you’re slightly more peculiar now, but at least Lund’s dignity is mostly intact. Hopefully that’ll make him more receptive to doing this again in the future!");
	//flag this
	flags["LUND_COVERED_4"] = 1;
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Brag]
public function dontCoverForLund():void
{
	clearOutput();
	leaveLundsHouse(true);
	generateMap();
	showName("\nBRAGGING!");
	output("<i>“He </i>really<i> likes a fat cock up his ass,”</i> you tell them, making a lewd sign with two of your fingers and a tight hole formed with your other hand. <i>“I made him cum his brains out with a reacharound, it was super hot.”</i>");
	output("\n\n<i>“Wow!”</i> exclaims the one who asked you, turning to her friends. <i>“");
	if(!korgiTranslate()) output("Maybe next fuck I sneak finger in to make howl. Bye alien!");
	else output("Maybe next time we fuck, I’ll sneak a finger in to make him howl. Bye, alien!");
	output("”</i>");
	output("\n\nHmm. Not exactly the reception you were hoping for, but it could get interesting later when word gets around.");
	processTime(4);
	//flag this
	flags["LUND_COVERED_4"] = -1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Ride him]
//Fen - do female hole select?
public function rideLundWheeee(x:int):void
{
	clearOutput();
	showLund(true);
	if (flags["LUND_BROKEN"] != undefined)
	{
		output("<i>“Lund, do you remember back before I took you as my pet?”</i> you ask him, curling your hand around his head. <i>“Well, you’re nothing like that now, but I’d like you to play the part. Can you do that for me?”</i>");
		
		output("\n\nHe hesitates. <i>“"+ (!korgiTranslate() ? "Lund" : "I’ll") +" try, but...”</i>");
		
		output("\n\n<i>“It’s okay,”</i> you say, smiling. <i>“Just do your best.”</i>");
	}
	else if(pc.isBimbo()) 
	{
		output("<i>“So like, how do you wanna fuck?”</i> you say, tilting your head and putting some serious thought into it. <i>“I wanna-”</i>");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("You not get choice,");
		else output("You don’t get a choice,");
		output("”</i> he tells you, shaking his finger. <i>“");
		if(!korgiTranslate()) output("You not in charge. Lund know you prefer it. A man tell you where to go, what to do. How wide to spread legs. When to swallow.");
		else output("You’re not in charge. I know how you prefer it. Let the man tell you where to go, what to do, and how wide to spread your [pc.thighs].");
		output("”</i>");
		output("\n\n<i>“I- Uuuhh,”</i> you mutter, losing yourself in his words. Gosh, he always knows just what to say to you...");
		//Added here since OTHER bimbo scene increments this before the bimbo check.
		IncrementFlag("SEXED_LUND");
		//Next button -> goes to Bimbo Sex.
		clearMenu();
		addButton(0,"Next",bimboLundSex,x);
		return;
	}
	//Not bimbo, first time
	else if(flags["LUND_RIDE_HIMMED"] == undefined)
	{
		output("<i>“How about I take you for the ride of your life, and we can figure out afterwards if I belong ‘on the bottom’, hm?”</i> You murmur in his ear. <i>“Just one try.”</i>");
		output("\n\n<i>“Ha,”</i> Lund snorts, then shrugs. <i>“");
		if(!korgiTranslate()) output("Okay, one shot. Don’t blame Lund when alien get fucked through floor.");
		else output("Okay, you get one shot. Don’t blame me when you get fucked through the floor.");
		output("”</i>");
	}
	//Not bimbo, repeat
	else
	{
		output("<i>“So?”</i> you ask, leaning in to murmur in his ear. <i>“Have I earned another chance to argue for my position?”</i>");
		output("\n\n<i>“Pretty convincing,”</i> Lund grunts, acknowledging your prowess. <i>“");
		if(!korgiTranslate()) output("Alien can try again. See if good.");
		else output("You can try again. We’ll see if it’s good.");
		output("”</i>");
	}
	output("\n\nIn Lund’s room, you have ");
	if(!pc.isCrotchExposed()) output("yourself and ");
	output("the korgonne undressed and ready in moments, pressing against his fur and reaching down between his legs to coax his oversized length from its sheath. Kissing Lund as you bear him to the bed, you lay him down and straddle him with a wide smile.");
	output("\n\n<i>“Hope you’re ready for this, Lund,”</i> you tell him, feeling his cock swell and harden against your [pc.ass]. <i>“I dunno if you’re man enough to take it.”</i>");
	output("\n\n<i>“Hmph,”</i> Lund grunts, reaching up to spread his hands across your [pc.chest].");

	if (flags["LUND_BROKEN"] == undefined)
	{
		output(" <i>“");
		if(!korgiTranslate()) output("You not bait Lund to do all work.");
		else output("You won’t bait me into doing all the work.");
		output("”</i>");
		output("\n\nSatisfied you’ve convinced him to let you take the lead, you settle back and let the thought of teasing him fade from your mind. You really just want for the both of you to have a good time, and assuaging Lund’s machismo tendencies is probably the easiest way.");
	}
	else
	{
		output(" <i>“Fine.”</i>");
		output("\n\nSatisfied he’s settling into his role, you lean back and let the thought of teasing him fade from your mind. You really just want for the both of you to have a good time.");
	}

	output(" Reaching back, you lightly take ahold of his canine prick and align it with your [pc.vagOrAss " + x + "]. You groan in pleasure as you slowly slide backwards onto it, using your hips to take it inside. Lund grunts, chewing his lip while the crown of his dick spreads you apart.");
	
	var lundipoo:PregnancyPlaceholder = lundCumPlaceholder();
	
	if(x >= 0) pc.cuntChange(x,lundipoo.cockVolume(0));
	else pc.buttChange(lundipoo.cockVolume(0));

	output("\n\n<i>“Awww fuck, that’s good,”</i> you moan, rocking back and forth in Lund’s lap just to feel him rub along your insides. Taking it deep is great, but there’s something to be said for quick, light movements that just tease the tip...");

	output("\n\nIf Lund’s reaction is any indication, he’s in full agreement. A low rumble escapes his mouth in a growl of approval, and the smile reappears on your face. When you’re in control, there’s just so much room to do whatever you want... like suddenly slam yourself knot-deep on his cock.");

	output("\n\n<i>“Fuuuck!”</i> you groan loudly, shuddering atop Lund for a second. You came pretty close to cumming right there, but if Lund doesn’t know that already he doesn’t need to be told. After taking a moment to readjust, you begin rocking atop him again, this time sliding half of his bloated length in and out of your ");
	if(x >= 0) output("lubed-up pussy");
	else output("pre-cum-slick asshole");
	output(", enjoying the sensation of being filled up.");

	if(x >= 0 && pc.totalVaginas() > 1)
	{
		output("\n\nAn idea comes to you then, and you slide off Lund’s cock to a groan of disappointment only to elicit a gasp of surprise when you slide him right back into another tight, wet cunt. You look down at Lund’s expression and can’t resist a sultry laugh at his shock, gyrating your [pc.hips] atop his lap just to remind him who’s in charge. Bouncing up and down on his groin, you alternate between two of your slickened pussies while Lund grunts in helpless pleasure.");
		
		var unusedVags:Array = [];
		for(var v:int = 0; v < pc.totalVaginas(); v++)
		{
			if(v != x) unusedVags.push(v);
		}
		if(unusedVags.length > 0) x = unusedVags[rand(unusedVags.length)];
		
		pc.cuntChange(x,lundipoo.cockVolume(0));
	}

	output("\n\nShaking your hips in preparation, you place your hands on Lund’s chest and begin slamming down on him, taking as much pleasure as you want from the powerless korgonne. You can feel his knot beginning to swell at the base of his cock but don’t slow your pace at all, groaning deeply every time you take him to the hilt. You can tell he’s fighting it, trying his hardest not to cum with the rough stimulation, his entire body tensed with the effort. You can’t help but rub his nipples just to tease him, but you never stop fucking as hard as you can.");

	output("\n\nSoon enough, you force an orgasm out of him. Grunting, he instinctively bucks his hips upwards to meet your bouncing ass with a loud slap of flesh, grabbing your forearms tightly. You croon in satisfaction as warmth blossoms in your [pc.vagOrAss " + x + "], spurting from his tip and repainting your insides even as you meet his thrusts in midair at full force.");
	output("\n\n<i>“Ugh!”</i> Lund grunts, the stimulation clearly getting to him. <i>“Ag-again!”</i>");
	output("\n\n<i>“Come on baby, give it all to me,”</i> you pant, face flushed and sweaty even as you smile the way only a person in charge can. <i>“Are you gonna cum twice? Gonna cum? Go on. I give you permission.”</i>");
	output("\n\nBefore the flow of his cum has even subsided, it’s renewed; he curses and bucks even harder under you to the point you don’t even need to move yourself, his thrusts coming so hard and fast you’re practically floating. Your smile only widens, your [pc.lips] parting as you pant in both glee and pleasure. He’s so enthralled with the sensation of cumming inside you, he doesn’t even care you have him doing all the work from below.");
	output("\n\n<i>“What a good boy,”</i> you moan, seductively lidding your eyes at him. <i>“Keep that up for me, Lund, I’m about to cum.”</i>");
	output("\n\nIf he’s aware of how demeaning that might be, it doesn’t register on his face. It’s twisted in a permanent snarl of aggressive pleasure, his teeth grit even as he fucks your ");
	if(x >= 0) output("sopping cunt");
	else output("sodden asshole");
	output(" balls-deep. Much like his, your orgasm isn’t slow or gradual at all; you feel it coming and then it’s upon you, drawing your voice out in a loud, halting groan of satisfaction while you tighten around Lund’s knot.");

	if(pc.hasCock()) 
	{
		output("\n\nYour [pc.cocks] strain");
		if(pc.cockTotal() == 1) output("s, flexes, and spurts");
		else output(", flex, and spurt");
		output(" wildly, spraying [pc.cum] all over Lund’s chest and face even as your ");
		if(x >= 0) output("pussy");
		else output("asshole");
		output(" tightens around him so much his next thrust is almost halted in midair. Every loud, slapping thrust from below just spurs you further onward, groaning and grunting while you blow your load into Lund’s luxurious fur. He doesn’t seem to mind at all, focused entirely on his own orgasm.");
	}
	else if(pc.hasVagina()) output("\n\nYour [pc.pussy] flexes, tightens and spurts all over Lund’s throbbing canid cock, almost trapping his fat knot inside you before he overpowers your instinctive squeezing. The sensation of him forcing himself in and out as you cum explosively only spurs you further onwards, driving you higher until you’re crying out in ecstasy with your head back.");
	else output("\n\nYour [pc.asshole] flexes and tightens over Lund’s throbbing canid cock, almost trapping his fat knot inside you before he overpowers your instinctive squeezing. The sensation of him forcing himself in and out as you cum explosively only spurs you further onwards, driving you higher until you’re crying out in ecstasy with your head back.")

	output("\n\n<i>“Oh, fuck!”</i> you scream in pleasure, watching Lund nail you as hard as he can from underneath you all throughout your orgasm. <i>“Keep going, keep going!”</i>");

	output("\n\nFilled with a renewed determination, you can see him employ his shaking muscles to keep you going, fucking you hard enough that the impacts on your thighs begin to hurt. You don’t care at all about the pain, though - if anything, it’s just icing. Eyes squeezed shut tightly, you can feel yourself forcefully mounting the threshold of pleasure, climbing back to the peak before you’ve even properly come down.");

	output("\n\nSure enough, you come to another massive orgasm atop Lund, this one even harder than the last. You tense so hard you can scarcely inhale, forgoing air in favor of the breathless ecstasy of cumming your brains out. Your eyelids flutter several times a second as you shake and shudder, Lund finally grabbing your hips and pulling you down on top of his huge knot to let his third and final orgasm explode inside you.");

	output("\n\nBiting your lip hard enough that it bleeds, you watch him grunt and flex in pleasure as a sideshow to your main event. Watching him writhe underneath you, his knot spreading you apart as he cums inside, your own orgasm leaving you content...");
	if (flags["LUND_BROKEN"] == undefined)
	{
		output(" yes, you could <i>definitely</i> get used to this.");

		output("\n\nAfter you’re both finished, you lie on top of him with a hand scratching his chest fluff for a job well done. Extricating yourself from the tangle, you clean yourself off and get your things.");
		output("\n\n<i>“Wow, you are </i>quite<i> the catch,”</i> you sigh at length, wiping off your forehead. <i>“Good work, cutie. I’ll be expecting the same performance next time.”</i>");
		output("\n\nHis ears perk up slightly at the words ‘next time’, but he doesn’t say anything, just pants. You bend down to kiss him on the snout and take your leave with a predatory grin.");
	}
	else
	{
		output(" yeah, sometimes this is nice too.");
		
		output("\n\nAfter you’re both finished, you lie on top of him with a hand scratching his chest fluff for a job well done. Extricating yourself from the tangle, you clean yourself off and get your things.");
		
		output("\n\n<i>“Good work, cutie,”</i> you tell him, giving him a kiss on the snout. <i>“See, you can do it if you try.”</i>");
		
		output("\n\nYou can hear the muffled sound of his tail trying to wag underneath him as you leave.");

	}

	processTime(30);
	if(x >= 0) pc.loadInCunt(lundipoo,x);
	else pc.loadInAss(lundipoo);
	pc.orgasm();
	IncrementFlag("SEXED_LUND");
	IncrementFlag("LUND_RIDE_HIMMED");
	flags["LUND_LAST_SEX"] = "Rode";
	clearMenu();
	addButton(0,"Next",leaveLundsHouse);
}

//[Bimbo Sex]
//This is not a selectable scene, it’s just what bimbos get sent off to do after picking their sex scene of choice.
public function bimboLundSex(x:int = -2):void
{
	clearOutput();
	showLund(true);
	output("<i>“It okay,”</i> Lund nods, spreading his arms. <i>“");
	if(!korgiTranslate()) output("Lund can give alien what want. Alien just need shut up and sit down.");
	else output("I can give you what you want. You just need to shut up and sit down.");
	output("”</i>");
	output("\n\n<i>“Not here!”</i> he hisses immediately, looking around and pulling his groin back from your outstretched hand.");
	output("\n\n<i>“Oh, sorry,”</i> you say confusedly, standing back up. Following orders is hard sometimes.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("No, it Lund fault,");
	else output("No, it’s my fault,");
	output("”</i> he sighs. <i>“");
	if(!korgiTranslate()) output("Need remember alien follow simple instructions. Come.");
	else output("I need to remember aliens can’t follow simple instructions. Come.");
	output("”</i>");
	output("\n\n<i>“All over your cock!”</i> you happily agree, attracting a couple of grins from passing korgonne. Lund doesn’t even say anything, just tugging you along.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",bimboLundSexNext,x);
}
public function bimboLundSexNext(x:int):void
{
	clearOutput();
	moveToLundsHouse();
	showLund(true);
	output("<i>“Ooh, your room! Oh my gosh, I feel so special,”</i> you titter, looking around at the mostly-bare living space while he shuts the door. <i>“I actually don’t get to do this often! Usually it’s just wherever th-”</i>");
	output("\n\n<i>“Hold this in ");
	if(korgiTranslate()) output("your ");
	output("mouth a second,”</i> Lund says, handing you his waistcloth. Obliging the furry man, you put it in your mouth and chomp down on it.");
	output("\n\n<i>“Rlike dish?”</i> you slur through the cloth.");
	output("\n\n<i>“Hmm,”</i> Lund hums, considering. <i>“This and this too.”</i>");
	output("\n\nNow you have three waistcloths in your mouth. You ask Lund what they’re for and he listens to your question intently, the words coming out mostly as muffled, indistinct mumblings.");
	output("\n\n<i>“Perfect,”</i> he sighs, looking relieved. You’re not sure why, but you have a few seconds to mull it over before the telltale rustling of cloth draws your attention. Presented with the sight of Lund’s magnificent canine cock, you almost drop the waistcloths before remembering he told you to hold them. Instead you make a quiet whine of need that makes one of his ears twitch.");
	output("\n\n<i>“On ");
	if(korgiTranslate()) output("the ");
	output("bed,”</i> he points, motioning that you should turn around. <i>“Get on ");
	if(korgiTranslate()) output("your ");
	output("hands and knees.”</i>");
	output("\n\nYou guess an alien that looks like a doggy probably wants to bone like one too, and for a moment you giggle at your own clever pun. Getting on the bed and wiggling your butt, you arch your back sensually and turn back to look at him with a smug face. Forgetting your speech is all but unintelligible right now, you start to say something only to be shocked into silence when Lund slides his entire fucking cock into your ");
	
	if(x < -1)
	{
		x = -1;
		if(pc.hasVagina()) x = rand(pc.totalVaginas());
	}
	if(x >= 0) output("[pc.pussy " + x + "]");
	else output("[pc.asshole]");
	output(".");

	output("\n\nThe waistcloths hang from your open mouth, drool soaking them thoroughly while your mind catches up with your body and you begin to buck in Lund’s grip. A dull, muted groan of ecstasy escapes your mouth while your ");
	if(x >= 0) output("pussy");
	else output("asshole");
	output(" desperately clamps down on the fat dick inside it, guaranteeing the pleasure of the one inside you.");

	output("\n\n<i>“Fuuuck,”</i> Lund moans, jerking his hips. <i>“");
	if(!korgiTranslate()) output("Alien worth it.");
	else output("This was worth it.");
	output("”</i>");
	output("\n\nA mindless, breathless giggle of joy escapes your mouth unbidden, your eyes rolling upwards as pleasure bubbles to the forefront of your mind, obscuring everything but the most important sensation: the need to please. Being a fun, slutty bimbo for the boys to enjoy... it’s nice to be so <i>solidly</i> reminded of your place every so often. Forcefully, even.");

	output("\n\nArching your back like the good playtoy you are, you moan like a bitch as Lund begins to fuck you in earnest, spreading your legs with his hands dominantly wrapped around your [pc.hips] to keep you in place. ");
	if(pc.hasCock())
	{
		output("Your [pc.cocks] dribble");
		if(pc.cockTotal() == 1) output("s and spurts");
		else output(" and spurt");
		output(" with each penetration, pooling below you. ");
	}
	output("He starts off slowly, experimentally, but it only takes him a few strokes to figure out you’re good for getting it hard.");

	output("\n\nThen you’re having ");
	if(pc.hasHair() && pc.hairLength >= 2) output("your [pc.hairNoun] pulled");
	else output("a [pc.breast] groped");
	output(" while he slams your tight, warm ");
	if(x >= 0) output("cunt");
	else output("asshole");
	output(" with all the force he can muster. Holding yourself up on two shaky arms, you ");
	if(pc.bovineScore() >= 3) output("can’t help but moo");
	else output("scream in pleasure");
	output(" as loud and long as you can, earning yourself two swift swats across your bouncing asscheeks that leave a nice warm stinging sensation courtesy of your master. It’s so nice to have someone pay your <i>whole</i> sexy body attention!");

	output("\n\nEventually your arms give out under the relentless pounding of your [pc.vagOrAss " + x + "], the combination of physical pleasure and mental fulfillment just too much to bear. Your face lolls against the mattress, mouth wide open and loudly, repeatedly expressing just how much you love to have Lund’s cock buried deep in your ");
	if(x >= 0) output("cunt");
	else output("asshole");
	output(".");

	output("\n\nWith a fierce movement, Lund grabs the sheet and rips it in two. You hardly even notice, so lost in pleasure are you, until he whips it around your face and catches it back in his hand, effectively gagging you once more. Like you’re no more than an animal, he yanks back on it cruelly to lift your head from the bed and keep you suspended while he works your ");
	if(x >= 0) output("sopping cunt");
	else output("flexible asshole");
	output(" over with the force of a ");
	if(flags["LANDED_ON_TEXAS"] != undefined) output("New Texan ");
	output("bull.");

	output("\n\nAny other person less-suited to the task of being pounded through the bed would be embarrassed to be treated in such a fashion, but not you. Your eyes roll back in your head while you drool through your gag, a guttural groan escaping your throat as you cum explosively around Lund’s dick. He hisses in satisfaction when he feels your walls rippling, all but massaging his cock in the hope of earning his cum, but it’s not to be. He’s still going at you hard enough to shake the bed against the wall by the time you finish cumming, his overwhelming studliness enough to drive you to another submissive orgasm. He <i>really</i> deserves this!");

	output("\n\nThough the process is gradual, you don’t even realize you’ve slowly been losing your position on the bed until you’re pushed right up against the headboard, [pc.breasts] squished against the pillows as the sound of furred thighs clapping against the [pc.skinFurScales] of your ass resounds through the tiny room. Pressed against the wall with no room for movement at all, Lund holds you there while he aggressively fucks your ");
	if(x >= 0) output("spasming pussy, droplets of femcum running down his thickening shaft.");
	else output("tightening asshole, his own pre-cum running back out and down his thickening shaft.");

	output("\n\nWithdrawing his knotted cock from your well-used cunt, he moves aside and tosses you back down on the bed, immediately straddling your [pc.chest] and tugging the gag from your mouth. You get one deep breath before his fat, sex-slick prick is shoved in your throat, driving your hips so far off off the ground in submissive pleasure he has to put his hands down above your head just to keep from falling off.");

	output("\n\nHe doesn’t wait for you to finish cumming or moaning around his cock to start fucking your face with abandon, knot slapping wetly against your [pc.lips] while he savagely bucks his sexy hips above you. God, this is amazing! You have a front row seat to Lund’s washboard abs, getting a nice, hot closeup every time he gets his full ten inches deep in your throat, the knot getting tantalizingly close. If you could just get your jaw a liiiittle wider...");

	output("\n\nLund’s gasp is masked by a wet, lurid pop, and he looks down to find your eyes rolling back while you gurgle happily around his knot. Shrugging his shoulders, he gets back to the task at hand: breaking you in properly. You’re so proud you managed to get all of it in, and now your master is rewarding you by getting even deeper inside! Your nose is all squished up against his furry groin, and his fantastic male scent permeates your very mind, driving you wild with need. You haven’t even done anything yet, but you find yourself cumming anyway. Lund doesn’t even notice, too busy fucking your face with frenetic vigor to feel your shaking hips.");

	output("\n\nYou reach up to embrace his lower half and just touch him, stroking his muscular back and feeling his taut buttcheeks whenever he thrusts into your throat, running a hand up and down his spine and occasionally holding his sexy hips while he bucks against your mouth. God, this is almost as good as the sex itself... you could spend all day under him like this just feeling his tight body. The only way the touching could be better is if he was touching your insides with his cock, and, well, he is! Life is grand.");

	output("\n\nYour day reaches a new peak when you realize, instinctively, he’s going to cum. You can <i>feel</i> it, in the way he’s moving his hips and the way those abs of his are tensing up, and the best place for him to blow a huge load is right down your throat. Putting both your hands on his ass and pulling him towards you while you snake your tongue along his knot as best you can, it only takes a few scant seconds with your expert technique for him to groan in pleasure.");

	output("\n\nOh god, you weren’t expecting there to be so <i>much</i>. Rather than swallowing you have to just open your throat and let him have full control otherwise you’d gag, his knot throbbing against your cheeks while he dumps what feels like his bodyweight in hot jizz into your stomach. What with the way he’s moaning, you think you’ve done a very good job!");

	output("\n\nWhen he finishes he just sits there on all fours groaning while his breath comes back, looking down at your fucked-silly face. You’d be smiling if you were capable of it. Placing his hands around your face, he gingerly pulls his knot free of your lips with another wet pop and a groan, leaving you feeling a bit like your throat has been hollowed out. You spend a few seconds swallowing before you can even take a breath, and the first thing out of your mouth is a light giggle.");

	output("\n\n<i>“Did you like it?”</i> you ask, fluttering your eyelashes.");

	output("\n\n<i>“Could get used to it,”</i> Lund says, looking down at you from atop your chest. <i>“");
	if(!korgiTranslate()) output("Maybe try that out again.");
	else output("Maybe we’ll try that out again.");
	output("”</i>");

	output("\n\nYou smile before opening your mouth wide, exposing your pearly-white teeth and throat. Lund doesn’t bother resisting the sight.");

	processTime(65);
	var lundipoo:PregnancyPlaceholder = lundCumPlaceholder();
	pc.buttChange(lundipoo.cockVolume(0));
	pc.loadInMouth(lundipoo);
	pc.loadInMouth(lundipoo);
	pc.loadInAss(lundipoo);
	pc.loadInAss(lundipoo);
	//Two loads in EVERY hole.
	for(var y:int = 0; y < pc.totalVaginas(); y++)
	{
		pc.loadInCunt(lundipoo,y);
		pc.loadInCunt(lundipoo,y);
	}
	//Cunt tails are weird, but not too weird to fuck
	if(pc.hasCuntTail()) pc.loadInCuntTail(lundipoo);

	for(y = 0; y < 10; y++) { pc.orgasm(); }
	flags["LUND_LAST_SEX"] = "Doggystyle";
	clearMenu();
	addButton(0,"Next",bimboLundSexEnd,x);
}
public function bimboLundSexEnd(x:int):void
{
	clearOutput();
	showLund(true);
	output("By the time you stagger out of Lund’s bedroom, your mind and body in complete disarray, you have spunk leaking from every orifice and a healthy amount splashed across your tits, face, and back. Luckily, he directed you to a spring bath you intend to make full use of, but that doesn’t stop the curious stares from passerbys in the halls to get there. Let them look, you think with a dopey smile. The more people see how proud you are of getting fucked like a whore, the better! Maybe they’ll even take you for themselves. Once you wash up, you head back to the Hold proper.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",leaveLundsHouse);
}

//[Leave]
public function leaveLundsSexMenu():void
{
	clearOutput();
	showLund();
	output("You shake your head after a second of consideration. <i>“Nah.”</i>");
	if(pc.isBimbo()) 
	{
		output("\n\nLund shrugs. <i>“");
		if(!korgiTranslate()) output("Lund not fuck you this time. You come running soon enough.");
		else output("I won’t fuck you this time. You’ll come running soon enough.");
		output("”</i>");
		output("\n\nAs if! Well... maybe. You cast a longing look down at his kilt before stepping away.");
	}
	else output("\n\n<i>“What, ");
	if(!korgiTranslate()) output("alien scare");
	else output("you scared");
	output("?”</i> Lund jeers, smiling smugly. <i>“");
	if(!korgiTranslate()) output("Scare to lose to Lund. It okay, Lund understand. Come back when alien feel brave. Ha!");
	else output("Scared to lose to me. It’s okay. I understand. Come back when you feel brave. Ha!");
	output("”</i>");
	lundMenu();
}

//[=PB Cookie=]
// Display this button in Lund’s main menu
// Tooltip (first cookie): You wonder if Lund might enjoy having a peanut butter cookie.
// Tooltip (after first cookie and PC has not submitted to Lund): You snicker as you wonder to yourself if Lund is in the mood for another cookie. He certainly seemed to enjoy the last one!
// Tooltip (after first cookie and PC has submitted to Lund): You wonder if you could get Lund somewhere private so you can give him another cookie....
// Continue from here the first time the PC gives Lund a cookie
public function pbcookieForLund():void
{
	if(flags["LUND_PB"] != undefined)
	{
		repeatLundCookies();
		return;
	}
	
	clearOutput();
	showLund(true);
	author("B");
	
	output("You ignore Lund’s question at first and instead check your codex for the time. ");
	if(hours < 8) output("It’s pretty late at night; you wonder if Lund is in the mood for a quick bite to eat.");
	else if(hours < 12) output("It’s about morning. You idly wonder if Lund’s had anything to eat, and if he wouldn’t mind having a quick, early snack with you.");
	else if(hours < 18) output("It’s about afternoon. Given that Lund is a hunter by trade, and he’s here and not out hunting, today must be a slow day for him. You wonder if he’s willing to pass the time with a snack.");
	else output("It’s starting to get a little dark out. Lund must be done hunting for the day; maybe he’s in the mood to share a snack to wind down from a hard day’s work.");

	output("\n\nYou ask Lund if he’s feeling hungry at all. His eyebrow raises suspiciously at the question, and he only grunts, avoiding the question the same way you avoided his.");

	output("\n\nYou pull out some peanut butter cookies and you offer one to him. There’s plenty to split between you two, and you were hoping that you two could find some amicable, common ground in sharing some pastries. You assure him that there’s nothing more to it than that.");
	output("\n\nHis eyes go from yours to the cookies in your hand, and his eyebrow raises again. <i>“");
	if(!korgiTranslate()) output("What is?");
	else output("What’s a ‘pastry?’");
	output("”</i> he asks, and you answer that, where you come from, it’s just a snack that’s easy to prepare, move, and store. It has a nostalgic flavor to it and it’ll tide over any hunger pangs for a little bit.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Safe for Lund to eat? Not sure about dumb alien food. Maybe make Lund dumb like alien.");
	else output("Are you sure it’s safe for me to eat? I’m not so sure about eating some dumb alien food. I wouldn’t want to be dumb like an alien.");
	output("”</i> You promise that, if it were unsafe for a Korgonne to eat, you would have heard about it by now from your codex. If it’ll help assuage whatever paranoia he has over a cookie, you tell him that you’ll eat one with him.");

	output("\n\nLund looks the cookies over, then holds out his paw, expecting you to give him one. You do so; he holds it up to his eyes and sniffs at it, and he frowns when the fragile cookie flakes apart whenever he moves it a bit too quickly. <i>“");
	if(!korgiTranslate()) output("Not big. Unsatisfying; not filling. What point?");
	else output("It’s not very big, and it doesn’t look like it’ll be very filling. What’s even the point?");
	output("”</i>");

	output("\n\nThe point is that it’s just a treat; something you eat in between meals to keep you from getting too hungry. And besides, you promise, it’ll taste amazing.");

	output("\n\nLund’s eyes are on you as he lifts the cookie to his mouth, but he waits for you to eat yours first, just as you promised. You do so, taking a quick bite out of your cookie and chewing it before swallowing. When you place the other half of the cookie in your mouth, Lund is satisfied that you aren’t trying to poison him or anything, and he puts the whole thing into his mouth, all at once.");

	output("\n\nAll of a sudden, his back straightens; his muscles tense; and his pupils dilate. As soon as the peanut butter pastry hits his tongue, he loses all control of his own body, and the sensory response is automatic. The thick muscles of his chest, stomach, shoulders, and limbs, all bulge under some imaginary strain; the six-pack of his abdominals pop out from underneath his fur and his pecs flex. His fur stands on end all throughout his body, from the bushy top of his head down to the thinner, finer fur at his ankles.");

	output("\n\nAnother thing that’s ‘standing on end’ is hard to ignore: through the simple cloth belt, Lund’s ten-inch penis balloons in a hurry, going from a somewhat minor bulge as it sat flaccid in his sheath, to a blossoming, soaking pillar in the space of a few, adrenaline-fueled heartbeats. His hands are at his sides, doing nothing to stimulate himself further, and yet, when he chews into his cookie again – and his eyes widen at what he’s just done to himself – his erection sprouts to full mast, and he’s helpless to stem what happens next.");

	output("\n\nHis erection is so strong and pronounced that his dick doesn’t point out: it points up, and it lifts the cloth with it, revealing the white fluff of his testicles to the hold. His knot grows thicker, bulging and throbbing larger than any knot you’ve seen on a similarly-sized person, until it’s borderline obscene, reminding you of two fists interlocked together. And what comes after <i>that</i> is equally perverse.");

	output("\n\nLund chews again, and even swallows, less because he wanted to and less because it was an unconscious reflex, but because his overstimulated mouth had begun to salivate. With the crunch of his teeth against the flaky peanut-butter pastry comes another wave of spontaneous, hormonal-driven changes: namely, an eruptive, almost inspiring orgasm, immediately soaking his cloth belt through.");
	output("\n\nLund’s jizz sprays through the fabric of his belt covering like it wasn’t even there; it arcs lazily through the air before splattering to the floor, nearly making it to the wall on the other side of the hall. What little bit of cum the rag <i>does</i> manage to catch sprays back against him, onto his jostling, squeezing, excited balls and backwashing down the inside of his thighs. He’s lost all control of his own body and is helpless to watch, with crossed eyes, as his cum sprays from his tumescent shaft, and judging from the look in his eyes, he’s not done, and he probably won’t be done for a while.");
	output("\n\nInevitably, his explosive, spontaneous, and uncontrollable orgasm brings in something of a crowd among the busy, populated corridors of the hold. A number of Korgonne, most of them female, stand in a semicircle around him to witness the display. Some of them are amused; some of them are bewildered; and some of them are aroused. Yet others can’t help but grin and laugh, mostly to themselves, at Lund’s poor display of self-control, and with each blast of jizz spraying through the air, their grins and stifled chuckles only grow louder.");
	output("\n\nLong, wet streaks of white continuing to spray from him and paint the floor in front of him as his hips thrust automatically into the air. Lund’s loincloth has soaked through and will likely have to be discarded; and the cum pooling around his balls and streaking down his legs will take hours to wash out. For his part, Lund is aware of the crowd he’s drawn in, and he meets each gaze, whether they’re surprised or congratulatory or lustful or mocking, with a meek frown.");
	output("\n\nFinally, Lund recaptures enough of his own motor functions to tilt his head down, purse his lips, and spit out the remainder of his peanut-butter cookie. There was hardly enough left in his mouth to justify the panicked action, and although shockwaves of pleasure continue to ripple throughout his body, he starts to calm down a little bit: his impious thrusting slows a bit and the thick, unceasing flow of cum erupting from his crotch slows itself down to thick, bubbly spurts rather than damn-near continuous, unending stream.");
	output("\n\nLund wipes at his mouth with his forearm and uses his other hand to press down on his dick, pointing it at the floor as the last of his cookie-enabled orgasm winds through him. Dribbles of his pearly cum pulse through him until they’re little more than thin streaks; his hands audibly squish into his loincloth as he grips his shaft to try and keep it under control. Throughout it all, his eyes try not to focus on anyone; he’s too embarrassed to try and look anyone in the eye.");
	output("\n\nWhen it’s obvious that the show is over, the crowd around Lund disperses, one Korgonne after another, until you’re the last one remaining. You ask him if he enjoyed the cookie.");
	output("\n\nHis eyes are on yours in a flash, and his mouth curls into a hateful sneer, but his words fail him. <i>“");
	if(!korgiTranslate()) output("Dumb alien embarrass Lund!");
	else output("You embarrassed me, you dumb alien!");
	output("”</i> he hisses at you angrily.");

	output("\n\nCrumbs of the cookie are still lodged in his teeth, and despite his vitriol, his tongue keeps licking and poking at the crumbs, eking out their taste for as long as he can. You respond that, while he might have been embarrassed, it looked like he had a whole lot of fun.");

	output("\n\nLund doesn’t combat that; every time he gets a faint reminder of what the cookie tasted like, his hands shake as he visibly tries to refrain from masturbating in the hall.");
	output("\n\nYou doubt you’ll be able to convince him to eat a second one right now. But, you’re sure, he’ll come around eventually.");
	
	IncrementFlag("LUND_PB");
	
	processTime(20);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function repeatLundCookies():void
{
	clearOutput();
	showLund();
	author("B");
	
	// continue here if the PC has given Lund a cookie but has not submitted to him
	if(flags["LUND_MADE_U_SUBMIT"] == undefined && !pc.isBimbo())
	{
		output("You glance at your codex for the time. Remembering the last time you were in this position, your [pc.belly] grumbles a bit, hungry for something to tide it over until you can get something a bit more substantial to eat.");
		output("\n\nThen, of course, you remember that you’re carrying some peanut butter cookies with you right now, and you remember what happened when you gave one to Lund.");
		output("\n\nConcealing your expression as best you can, you lean towards Lund and ask him if he’s hungry.");
		output("\n\n<i>“Fuck off,”</i> he answers immediately. Despite his words and his tone, he can’t look you in the eye and his face pouts determinedly. You can tell that he wouldn’t <i>mind</i> another cookie, but he’s not going to take one from you right now.");
		output("\n\nOh well. It was worth a try.");
		
		flags["LUND_PB_DISABLED"] = 1;
		
		// grey out the [=PB Cookie=] button
		processTime(3);
		clearMenu();
		addButton(0,"Next",approachLund,true);
	}
	// continue here if the PC has given Lund a cookie and has submitted to him
	else
	{
		moveToLundsHouse();
		showLund(true);
		author("B!");
		if(!pc.isBimbo())
		{
			output("You’re reminded of the time that you had given Lund a peanut-butter cookie and the aftermath that had ensued. Now that your relationship with Lund has been cemented, with you as his pet, you wonder if he’d... do you the pleasure of having another one. It seems weird – the pet wanting to give the master a treat, not the other way around – but with any luck, he’ll play along.");
			output("\n\nLund eyes you expectantly as you approach him; knowing him, he’s probably waiting for you to say the word before he whisks you away to his room in the hold so he can fuck your brains out again. And, by Gods, you’d let him in an instant. But that’s <i>why</i> you want to ask what you’re about to ask: this time, when he tastes that cookie, you want to be underneath him, to get a more up-close view of the whole spectacle.");
			output("\n\nYou <i>just happen</i> to have a fresh batch of peanut-butter cookies on you. You approach Lund and ask him if he’s hungry; you pull out two of the cookies and offer to share one with him if he’s feeling a mite peckish.");
		}
		else
		{
			output("Your [pc.belly] growls in hunger. You rub at it soothingly as you think about what it is you could tide yourself over with – there is no shortage of yummy Korgonne around you to eat out, male or female, you impishly think to yourself, but, as tasty as cum is (and in so many varieties!), it’s not very filling.");

			output("\n\nUnless, of course, it’s Lund. That stud could put you on your knees and fuck your face for hours on end, and he’d give you a three-course meal by the time he’s done.");

			output("\n\nYou have a couple peanut-butter cookies in your pack. Maybe, if you share some with Lund, he’ll reward your generosity with a fun romp in the sheets to wash it down. You withdraw two cookies and ask him if he wants one.");
		}
		output("\n\nLund’s eyes narrow on the cookies in your hand, and his expression hardens somewhat. ");
		if(!pc.isBimbo()) output("You briefly wonder if you’ve overstepped some boundary, when he suddenly grabs you by the wrist");
		else output("You aren’t sure what that look is for – had you offered him some before, and you just forgot or something? That sounds like something you’d do");
		output(". <i>“With me,”</i> he demands, pulling you by the hand through the winding twists and turns of the Korg’ii hold. Your own heart leaps into your chest, and your loins stir at the prospect of getting what you want.");
		output("\n\nLund pulls you with an excited strength that you weren’t expecting, even after being personally acquainted with the strength and eagerness he’s capable of. You’re back in the familiar surroundings of his room after just a few moments, and, with a rough yank, you’re on his bed, resting on your back, while he straddles you.");
		output("\n\nHis claws snap at the band of his loincloth, and it falls away; you’re eye-to-eye with his flaccid sheath and fluffy, bunched balls, inches from your face. With one hand, he grabs you by the back of your head and forces your face into his crotch, particularly with your [pc.lips] against his sheath; with the other, his hand grabs at the cookies, still in your hand.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Horny alien want Lund to cum? Horny alien get all the cum alien wants.");
		else output("You want me to cum that badly, do you, you dumb, horny alien? Fine. I’ll give you all the cum you could want.");
		output("”</i> The hand on your head presses you tightly against his pelvis, your nose crunched against his pubic bone and your vision swimming with nothing but the fur of his tense, powerful, rippling abdominals. His sheath is flaccid in your mouth, but bloated – he’s not horny yet, but the thought of getting more cookies in his mouth has put him in the mood.");
		output("\n\nYou wait eagerly for Lund to get on with it and eat a cookie, to experience for yourself firsthand what it’d be like to have a man as studly as Lund cum as explosively as he did last time, straight into your mouth. You entertain yourself by pursing your [pc.lips] and running your [pc.tongue] over the broad, pinched opening of his sheath, in preparation for what’s to come next.");
		output("\n\nLund grunts, then slips both cookies into his mouth, biting into the pastry without any hesitation.");

		output("\n\nHis bodily reaction is sudden: your pursed lips pry apart with his inflating Korgonne cock, and your tongue, which was lavishly bathing the end of his sheath, is bumped out of the way by his eager, immediate erection. Your taste buds are caked first with his runny pre, then with a thick mouthful of his delicious, virile cum; you’re pushed away to make room for his inflating cock, but his hand keeps you in place, and suddenly, your mouth, from your [pc.lips] to your throat, is swamped with everything Lund: his expanding dick; his pumping jizz; and his inflating knot, tying your jaw to him.");
		output("\n\nHis hand rubs at your scalp roughly as he chomps through his flaky treat; every time his teeth chew down, you’re given a fresh batch of Lund for you to swallow. You and Lund are in perfect sync: a single bite into the cookies in his mouth causes his balls to bounce and his dick to pulse, and your cheeks balloon twice over with his cum, and you struggle to maintain pace with him.");
		output("\n\nLund hums in delight at the taste of the cookies, and at you, his willing, receptive pet, chugging at his spasming cock like the willing cocksock you both know you are for him. He swallows a chunk, and his dick lurches upward, scraping its tip along your palette; his knot is so huge inside your mouth that it’s difficult to not pinch him with your teeth, and your [pc.lips] mesh wonderfully against his taut sheath. His balls flex against your chin with every potent blast of his jizz into your throat, and you swallow every drop.");
		output("\n\nYou don’t dare reach for your own ");
		if(pc.hasCock()) output("[pc.multiCocks]");
		if(pc.isHerm()) output(" or your ");
		if(pc.hasVagina()) output("[pc.vaginas]");
		output(", with your body too focused on taking all of Lund into your mouth; despite how ragingly horny you are, Lund’s sheer output requires all your focus to keep from drowning in his peanut-butter cookie-enhanced libido. You gulp and you gulp, your [pc.tongue] swishing back and forth underneath the fat of his dick to massage out everything he has, and he has a lot.");

		output("\n\nFinally, Lund swallows the remainder of the cookie in his mouth, and he sighs in elation as the effects of the final bit of cookie have their way with his biology. You’re treated to another two or three warm blasts of thick jizz for you to savor and swallow – hell, in all honesty, it might have all just been one massive orgasm, nonstop. Either way, your innards are doused, from throat to belly, with his seed.");
		output("\n\nLund licks at his chops and he thrusts against your face, which he’s forcefully pressing into his groin (not that it’s necessary, with you being orally-knotted and all), as he comes down from the cookie-induced sexual spontaneity. And yet, he’s still just as hard as when he started. Anyone else would have started to flag and recede by now, but not Lund. It’s what made you fall so hard for him, and to be honest, you’d be disappointed if it were any other way.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Both Lund and alien get tasty treat");
		else output("Looks like we both got a tasty treat this time");
		output(",”</i> Lund snickers. He rocks his hips in a circle, enjoying how you’re tugged and pushed along with him. You look up at his washboard abs and give his cock a thick, thorough suck; you enjoy watching his body tense as he uses you to pleasure him, and the way his six pack bulges when you suck his cock gives you such an adrenaline rush.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Still hungry? Lund could go for more. Give more cookies, and Lund give cum-thirsty alien what [pc.heShe] wants.");
		else output("Still got room after all that? I could go for some more. If you have any more of those cookies, I’ll give you what you want, you cum-thirsty slut of an alien.");
		output("”</i>");
		output("\n\nAfter all that, not only is Lund not out of energy; not only is he not exhausted; not only is he not oversensitive; but he wants you to give him another cookie.");
		output("\n\nYou <i>do</i> happen to have more....");

		processTime(20);
		pc.lust(10);
		pc.loadInMouth(lundCumPlaceholder());
		//[=Again=][=Enough=]
		// give the PC the Orally-Filled status
		
		IncrementFlag("LUND_PB");
		
		clearMenu();
		addButton(0,"Again",moreCookiesPleaseLund1);
		addButton(1,"Enough",enoughCookiesLund1);
	}
}

//[=Enough=]
public function enoughCookiesLund1():void
{
	clearOutput();
	showLund(true);
	author("B!");
	output("It takes some effort, particularly with your jaw as stretched as it is, but you manage to pull away from Lund. You cough, his cum washing back onto your [pc.tongue] from your throat. You wave him off and say that you think you’ve gotten more than enough ‘treats’ to last you for some time.");
	output("\n\nLund chuckles as he grips his doggie dick by its still-bloated knot. He drags its tip across your face and along your nose, wiping some excess cum across your features, to remind you who is the pet between you two. You breathe deeply and resist the urge to change your mind.");
	output("\n\n<i>“Suit yourself. ");
	if(!korgiTranslate()) output("You finding Lund if you ever feeling a bit needy.");
	else output("Come find me if you’re ever feeling a bit peckish.");
	output("”</i>");

	output("\n\nLund leaves the room before you, allowing you some time alone to recuperate from all of that.");

	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[=Again=]
public function moreCookiesPleaseLund1():void
{
	clearOutput();
	showLund(true);
	author("B!");
	output("As it just so happens, you have a few more cookies for Lund’s perusal. You produce one from your effects and hand it up to him on the flat of your palm, as an offering.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Wondering who between us is getting the tastier treat?");
	else output("I wonder which treat is tastier?");
	output("”</i> he asks as he takes your offering. He wastes no time, as before, and takes the whole thing into his mouth, biting through it quickly.");

	output("\n\nYour ride starts all over again: Lund’s cock bloats angrily as another wave of his salty cum bursts from him like a geyser, your cheeks rounding out with his viscous load. You swallow, as you did before, but this time, perhaps because the taste of the cookie is fresh on his tongue, his incredible output overtakes your throat, and your cheeks fill again before they can fully hollow out.");

	output("\n\nYour jaw hurts, but in all the right ways. Your cheeks and your jaw and your lips are all so strained to contain Lund’s masculinity, and you love it: you love the way that, no matter how much you push him, Lund will rise to any sexual challenge. You just can’t seem to tire the studly Korgonne out, and you enjoy finding every new way to prove that you can’t do it. You think to yourself that, in the end, you’re going to run out of cookies before he runs out of cum, and your [pc.thighs] clench uncontrollably at the fantasy of sitting underneath him as you find out which resource will dry up first.");
	output("\n\nLund pulls backward suddenly, and you strain to widen your mouth further so that you don’t hurt him when he withdraws from your oral knot. You wistfully wonder why he’d pull back, when the answer stares you right in the face: with another chew, Lund withdraws completely, his pointed dog cock pointed right between your eyes, and your vision is clouded pearly white.");
	output("\n\nYou swallow what’s still in your mouth, then leave it hanging open, tongue lolling from you to give him something to shoot at. He, of course, does not aim for your open, waiting mouth: Lund furiously masturbates in front of you, pointing his rod at your forehead, your cheeks, your neck, and your [pc.chest] before pointing it back up to resume your formal baptism.");
	output("\n\nBoth you and Lund groan incoherently as you take your respective positions: with every shot of your master’s cum on your [pc.skinFurScales], an electric, pleasurable sensation drives straight down your spine and to your [pc.crotch], making you all the hornier for some release of your own. Lund’s cum gets everywhere, going as high as your [pc.hair] and dripping down as low as your [pc.belly]; you’re decorated like a cake, and his cookie-fuelled overdrive doesn’t allow him to stop.");
	output("\n\nHe swallows the remainder of the cookie, and you’re given one final, elongated stream of his cum on your features. Satisfied that he’s covered your face as well as he’s going to get it, he adjusts his aim, pointing his quaking cock at your shoulders and down your arms. You don’t move: your mouth is still open and willing as he absolutely covers your entire upper body with his seed, but, to reward you, his pet, for being so patient and willing, he grants you the pleasure of tasting the last of his cum burst on your outstretched [pc.tongue].");
	output("\n\nLund pants in exertion as he gently palms at his throbbing dick, his fingers toying at his stretched sheath and tense balls. You blink away the cum on your eyelids, and you’re treated to the sight of his heaving, sculpted stomach once again, underlined by his still-extremely-erect cock.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Good look for you. Let whole universe know what you truly are. And where for other dumb aliens to find some for themselves,");
	else output("That’s a good look for you. Wear it like that; let the whole universe know what you truly are. And where other dumb, slutty aliens can find some for themselves,");
	output("”</i> Lund snickers as he draws his cock’s head against your open [pc.lips].");

	output("\n\nHis cum audibly drips from you and splats onto either the floor, or onto other body parts. You lift a hand to your cheek and rub at the warm, wet semen there, rubbing it into your [pc.skinFurScales]. Your eyes never leave his cock: it’s so entrancing, and you’re so gobsmacked by how it <i>still isn’t soft.</i>");

	output("\n\n<i>“Got any more?”</i> he asks, his hand already out for another cookie.");

	processTime(10);
	pc.applyCumSoaked();
	//[=Again=][=Enough=]
	// give the PC the Cum Covered status
	addButton(0,"Again",moreCookiesPleaseLund2);
	addButton(1,"Enough",enoughCookiesLund2);
}

//[=Enough=]
public function enoughCookiesLund2():void
{
	clearOutput();
	showLund(true);
	author("B!");
	output("As much as you enjoy being beneath your master and giving him as many opportunities as he wants to relieve himself on you and in you, wherever and however he wants, you think, with some apprehension, that you’ve had enough for now. You’re absolutely covered, from your [pc.hair] to your [pc.chest], in his dripping cum – if you stayed here and allowed him to cover you again and again (as much fun as that sounds), how are you supposed to tell the universe what a slut you are for Lund?");
	output("\n\nHe laughs derisively at the thought. <i>“");
	if(!korgiTranslate()) output("Lund was not serious, but will not stop dumb, horny alien. Tell whole universe who owns you, pet. Come to Lund when you need reminding.");
	else output("I wasn’t serious, but I’m not going to stop you, you dumb, horny alien. Go ahead and tell the whole universe who owns you, then, pet. Come back to me when you need another reminder.");
	output("”</i>");

	output("\n\nLund leaves the room before you, allowing you some time alone to recuperate from all of that. His cum still drips from your face; you resist the reflex to wipe it away. You prepare yourself to re-enter the hold, absolutely dripping with Lund’s cum.");

	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[=Again=]
public function moreCookiesPleaseLund2():void
{
	clearOutput();
	showLund(true);
	author("B!");
	output("You sigh wistfully as you stare at that beautiful, huge, delicious, overpowering cock. It could go for days, you bet. You could sit there on your knees and take load after load after precious load of your master’s cum, either onto your face or into your mouth, or anywhere else he wants. He’s proven himself to be such an alpha male that you can’t help but submit to anything he wants.");
	output("\n\nYou withdraw another cookie and hold it up to him. He, once again, wastes no time in taking it from you – but this time, rather than eating it and starting the process of bathing you in his cum again, he grabs you by your arm and flips you onto your front. It’s a position you remember assuming several times in front of Lund, and you bend at the [pc.knees], lifting your [pc.ass] up for him and giving him an easy, willing target.");
	output("\n\nAs soon as your ass rises into the air, he plunges his cock in between your cheeks, spearing himself into your [pc.asshole]. Not all the way – just the tip and some change. But, then, he eats the cookie.");
	output("\n\nHis cum gushes into you first, followed by a powerful thrust of his hips, driving his dick into you, down to his knot. You lower your head into the pillow of his bed submissively, groaning senselessly as his cum pumps into you; it blooms from inside your ass to your [pc.belly], and with each press forward, it drives deeper into you.");
	pc.buttChange(lundCumPlaceholder().cockVolume(0));

	output("\n\nLund pants like a mutt as he bends over you, draping his body over yours. His hands clasp onto your [pc.chest], the flat of his rough ‘palms’ on your [pc.nipples] while he ruts and pounds into you. He’s breathing hot and heavy against your ear through his nose; you can hear his throat work as he swallows down another chunk of cookie, and the whole process doubles over in intensity: your body slowly but surely begins to inflate with his seed, and he’s not going to stop for some time yet.");

	output("\n\nYou buck back against him, eager to take the entirety of himself into your [pc.ass], including his knot. And he’s just as excited to be inside you: his overworked-yet-still-full balls slap against you with his every buck forward, and his knot pounds into your backdoor seemingly with the force of a battering ram.");

	output("\n\nYour [pc.eyes] roll into your head as you drown in Lund’s display as your alpha and master. His every thrust is punctuated with another warm, wet splash of his cum spraying into you; he growls through his clenched mouth as he ruts you and claims you, inside and out. The jizz on your face, still fresh and dripping, flings to and fro with Lund’s fierce rocking into you. The only thing left to prove to you both that you’re well and truly his, is to take that knot into you.");

	output("\n\nYou beg him like you did when you first submitted to him. You cry to him to tie you; to give you his Korgonne cock and to fill you. You’re nothing but a dumb, slutty alien for him, and you want to walk around the hold with his jizz leaking from your asshole. You want to be here, on his bed, every day, for another full stomach of his amazing cock.");
	output("\n\nAppreciating your sentiment, and submission, Lund swallows the remainder of the cookie in his mouth, and he grants your request: with another three or four cookie-driven thrusts, his knot batters into your until it gives, and he ties himself to you. The action is met with a few more thick bursts of his cum into your ass, rounding out your [pc.belly] with his enormous load.");
	output("\n\nYou can’t help but orgasm yourself beneath him: you join him in sexual ecstasy and clench your [pc.ass] on his cock as your ");
	if(pc.hasCock()) output("[pc.cock] sprays its load beneath you, soaking into his bed");
	if(pc.isHerm()) output(", while your ");
	if(pc.hasVagina()) output("[pc.vagina] clenches at nothing and sprays back onto Lund’s legs, marking him with your own scent");
	output(". You two fuck each other, bucking out your orgasms as much as you can – although, while your eyes are crossed and your [pc.tongue] flaps from your mouth, you somewhat doubt Lund is losing control of himself as much as you are.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Good pet. Know just what owner Lund likes.");
	else output("You’re a good pet. You know just what your master likes.");
	output("”</i> He strokes at your [pc.chest], his hands never having left your body, as he tugs his cock backward, just a little bit. He’s apparently getting impatient and wants out. <i>“");
	if(!korgiTranslate()) output("Had enough? Can go again if not. Just give Lund more treat, and Lund treat you back.");
	else output("Have you had enough yet? I can keep going. Just give me another one of those treats, and I’ll give you a treat of your own.");
	output("”</i>");

	output("\n\nYour brains are still leaking out of your ears, but... well, you <i>do</i> have a few more cookies on hand....");

	processTime(10);
	pc.loadInAss(lundCumPlaceholder());
	pc.orgasm();
	clearMenu();
	//[=Again=][=Enough=]
	// Give the PC the Anally-Filled status
	addButton(0,"Again",moreCookiesPleaseLund3);
	addButton(1,"Enough",enoughCookiesLund3);
}

//[=Enough=]
//[=Enough=]
public function enoughCookiesLund3():void
{
	clearOutput();
	showLund(true);
	author("B!");
	output("You’re satiated. You rest your head into your pillow and, while you’re sure Lund could most certainly keep going, and you most certainly wouldn’t mind him proving it to you over and over and over, you’re simply too fucked out to take any more of his superior sexual stamina. You say nothing in response to his questions.");
	output("\n\nLund grunts in understanding, then pulls himself from your abused asshole with a loud, wet pop. He didn’t wait until he shrunk: with how full of his spunk you are, your asshole was as lubed as could be, and if he slid into you with ‘relative’ ease, he could slide back out just as easily.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Keep your word. Walk around hold with cum leaking out your ass. Then Lund give you more later.");
	else output("I want you to keep your word. I want you to walk around the hold with my cum leaking out of your ass. If you do, I’ll give you some more later.");
	output("”</i>");

	output("\n\nHe grips your [pc.ass] to create cleavage, and he rubs himself between your cheeks to clean himself off. When he leaves the room, you can see, he’s still as erect as could be – and you just let that walk away.");
	output("\n\nIt takes you the better part of an hour to collect yourself before you leave his room.");
	processTime(20);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[=Again=]
public function moreCookiesPleaseLund3():void
{
	clearOutput();
	showLund(true);
	author("B!");
	output("Weakly, you reach to the side of the bed for your effects, where you keep the rest of your cookies. It takes some blind rummaging through your things to find them, but when you do, you reach back behind you, your face still buried into his pillow, and you offer it up to Lund.");
	output("\n\nHe leans in and chomps his mouth around the whole thing, his teeth expertly avoiding your fingers as he does so. In a flash, his earlier stamina returns to him, and he’s ready to go once more.");
	output("\n\n");
	if(pc.hasVagina()) 
	{
		output("However, he evidentially decides that he’s either unsatisfied with ploughing your [pc.asshole], or that his job there is done – he yanks himself back, and your asshole relents with about as much resistance as it did when he pushed in. Thankfully, all the cum he had unloaded into you made for a decent lubricant for him to pull on, and with how short-lived his anal-knotting was, it doesn’t hurt nearly as much as you had braced yourself for.");
		output("\n\nWhen he’s free, a deluge of cum spills from your now-gaping [pc.asshole]; it spills from you in gouts, backwashing down your [pc.thighs] and onto his bed. But he pays it no mind, particularly since his head is addled with cookie-boosted pheromones: he realigns himself and he plunges straight into your [pc.vagina], giving it as thorough a fucking as your ass did.");
		pc.cuntChange(0,lundCumPlaceholder().cockVolume(0));
	}
	output("\n\nLund’s thrusting resumes as his teeth loudly chew into the cookie; with each bite comes a new spasm inside you as his dick shoots another few loads into your [pc.vagOrAss]. You buck up against him, his balls resting against your thighs, and you can feel his big, fuzzy nuts pull and contract against himself with every heavy load. You sigh in delight and curve your body as best as you can, to let gravity assist in pulling his juices deeper into you.");
	output("\n\nYou’ve never felt so full before: with just a handful of cookies, your body is completely inundated, from every angle and from every one of your orifices, with just a single Korgonne’s cum. Lund is some kind of freak: nothing and nobody should be able to cum this much, and yet, Lund is proving to you right now that such a person exists. You’ve chosen the right Korgonne to submit yourself to.");

	output("\n\nYou moan his name, your voice hiccupping and raising an octave with every spurt of his jizz into you. <i>“Lund,”</i> you whisper when his cock lurches, his knot swells, and his cum sprays deeper into you, ");
	if(!pc.hasVagina()) output("backing up into your body so far that it reaches into your stomach");
	else output("spraying and dousing your womb, drowning it with his fertile seed");
	output(". <i>“Lund,”</i> you say again when his knot pushes and pulls on you, stimulating your [pc.vagOrAss] further");
	if(pc.hasVagina()) output(", until, with another audible chew and a heavy thrust, it pops into you, spreading your [pc.vagina] to its limits to accommodate him");
	output(". <i>“Lund! Yes!”</i> you yell, your voice bouncing off the walls, as your body is brought to another, overwhelming orgasm.");

	output("\n\nHe grunts his approval as he swallows the last bit of cookie. He takes a huge sigh as his body reacts to the peanut butter ambrosia, and another few jets of his cum displaces all the other loads inside you. With him locked as tightly as he is into you, there’s nowhere for his voluminous cum to go; your [pc.belly] bloats with his output, and you feel twice as heavy and twice as big. And he’s <i>still going.</i>");

	output("\n\nLund relaxes himself as he lowers his body, his bushy fur against your back, while he grinds everything he has against you. You can feel his strong heart beating through his chest, and his dick lurches inside you in sync with it; he must have cum two dozen times, all of it fuelled by his Korgonne biology reacting to simple peanut butter cookies.");

	output("\n\nAnd, despite <i>all that</i> – despite your body being so full that you’re [pc.belly] touches down onto Lund’s sheets; despite Lund having cum more times in the space of an hour than any normal man would in two weeks; despite Lund’s heavy breathing and apparent exhaustion; despite the absolute fucking mess you are, with his cum leaking from the seams of your [pc.vagOrAss] against his knot and his cum dripping in thick drops down your face – you hope he wants another one. You <i>want</i> him to want another one. You want more of him. You aren’t sure if you’ll ever have enough of him. He’s such a stud, such an alpha male, that anyone, man or woman, gay or straight, should be privileged to wear his load like a badge.");
	output("\n\nLund grunts in satisfaction as he pulls himself away. You feel his right hand slap down on your [pc.ass] appreciatively, and he bucks against you a bit more, testing the tightness of your hole around his knot.");
	output("\n\n<i>“Could go one last time,”</i> he says nonchalantly, as if he hadn’t already cum enough to impregnate a small town. <i>“Got any more?”</i>");
	output("\n\nYou could back out. You’re thick enough with his load to last you weeks.");
	output("\n\nOr you could give him another. You’ve both come this far....");

	processTime(10);
	if(pc.hasVagina()) pc.loadInCunt(lundCumPlaceholder(),0);
	else pc.loadInAss(lundCumPlaceholder()); 
	pc.orgasm();
	//[=Again=][=Enough=]
	// give the PC the Vaginally-Filled and Bulky Belly statuses
	clearMenu();
	addButton(0,"Again",moreCookiesPleaseLund4);
	addButton(1,"Enough",enoughCookiesLund4);
}

//[=Enough=]
public function enoughCookiesLund4():void
{
	clearOutput();
	showLund(true);
	author("B!");
	output("There’s just so much cum everywhere already. It’s in your mouth; across your face; in your [pc.ass]");
	if(pc.hasVagina()) output("; and in your [pc.vagina]");
	output("... at this point, someone could tell you that Lund’s cum accounted for fifteen-percent of your body weight, and you’d believe them. And the idea of getting even more....");
	output("\n\nOn the one hand, that’s a huge turn-on, to know that Lund is capable of such an incredible feat. But on the other, your [pc.belly] is so bloated with his loads that the idea of taking even more of it into yourself sort of makes your stomach turn. You ultimately decide that, as much fun as it’d be, you’d rather put off the encore for another time.");
	output("\n\n<i>“If you say so,”</i> Lund relents. With a couple of hearty tugs, he pulls free from you");
	if(pc.hasVagina()) output(", like he did before");
	output(", and your [pc.vagOrAss] is left gaping while his cum drips from you in large, steady rivers. You’re a fucking mess of dripping white pearls, and you sink exhaustedly into his bed, soaking yourself in it.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Alien belly as full as Lund’s after treats of many?");
	else output("Is your alien stomach as full as mine after so many treats?");
	output(" he laughs, giving your upturned [pc.ass] another hearty smack. <i>“");
	if(!korgiTranslate()) output("Treats taste pretty good. Come find Lund when having some more. Can start all over again from beginning.");
	else output("The treats taste pretty good. Come find me if you ever have any more on you. Then we can start all over again, from the very beginning.");
	output("”</i>");
	output("\n\nIt takes you the better part of an hour to register what he said. And when you do... you think you might take him up on that.");

	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[=Again=]
public function moreCookiesPleaseLund4():void
{
	clearOutput();
	showLund(true);
	author("B!");
	output("Your hands are shaking; your breath is shallow; your eyes are half-lidded and crossed");
	if(silly) output("; your arms are heavy; your [pc.legs] are weak; you have a hankering for pasta");
	output("... you couldn’t keep up with Lund. You tried, and you gave yourself a huge advantage by giving him cookies that make him orgasm as soon as he tastes it, but you couldn’t do it.");
	output("\n\nAnd you love it.");
	output("\n\nOne final time, your hands search blindly for your effects, until you find where you stash your cookies. Your fingers wrap around one of the remaining, flaky pastries, and, with unsteady hands, you lift it up and behind your head, presenting it to Lund.");
	output("\n\nHe hums in thought as he regards the cookie. <i>“");
	if(!korgiTranslate()) output("Maybe wanting you to beg... but, maybe alien begging, just not words-with. Why would alien give Lund more treats?");
	else output("I could have made you beg... but, maybe, you <i>are</i> begging, just not with words. Why else would you give me more of these treats?");
	output("”</i>");

	output("\n\nLike before, he eats it straight from your hand, his teeth nipping at your fingertips. And, like before, you feel his dick bloat inside your [pc.vagOrAss] with his incoming orgasm: his cum bursts forth from him as soon as his tongue hits the flaky dessert, and the sloshing loads already inside you are added to by Lund’s impeccable, undefeatable cock.");

	output("\n\nHe takes a deep breath through his nose and leans back. His hips pump against yours several times, testing how tightly your body clamps to his around his knot; then, unexpectedly, he begins to pull back, mid-orgasm. You’re surprised, figuring that he’d rather stay inside you for as long as he could while he cums, but apparently, he has other ideas in mind.");

	output("\n\nThe cum inside you makes for a descent lube, and since he hasn’t been knotted to you for very long, your body is still yielding enough to allow him to extricate himself. When he does, he lets one final spurt go inside your body, letting his juices sink deeper into you, before pulling out all the way, his pointed tip drawing a wet ring around your gaping ");
	if(!pc.hasVagina()) output("anus");
	else output("cunt");
	output(".");

	output("\n\nHe chews, and the ordeal restarts; now that he’s withdrawn, he grabs himself by the base and points himself higher as he masturbates excitedly. His shaking hips shoot his load through the air, and you feel it mark long, wet lines down your back; his cum reaches as far up as your shoulders and then drips down towards your waist with each shot.");

	output("\n\nYou lay there, sexually blitzed out of your mind, as Lund marks your entire back, neck to [pc.ass], with his cum. He grunts roughly through his mouthful of cookie; each time he bites and swallows a bit more, another two or three thick lines of his jizz arc across your back. It soaks into your [pc.skinFurScales], and you’re sure it’s going to take one vigorous scrub to get the smell off of you, if it even takes just one... and if you even want it gone.");

	output("\n\nThis is your life now. You’re lying face-down in a Korgonne’s bed as he cums over and over again, marking your body with his seed. It still swishes around in your mouth and it still cakes and drips from your face. He’s fucked your ass until your body has gotten fat off his cum");
	if(pc.hasVagina()) output(" and he’s fucked your [pc.vagina] so thoroughly that there would be no question it would take if you wanted it to");
	output(". Having accepted your position as Lund’s pet has led you to this point in your life – it’s funny how a single decision can make so much happen in such a comparatively short amount of time.");

	output("\n\nYou hear Lund swallow, and you embrace the remainder of his load as it paints you. Your body is soaked, absolutely <i>drenched,</i> in his jizz, and you’re sure, if you could see yourself, you wouldn’t be able to accurately guess the color of your [pc.skinFurScales]. The weight of his cum presses into your back and pools to your sides, submerging you in a puddle of his output.");

	output("\n\nWith one, final, satisfied sigh, Lund comes down from his cookie-blazed romp. His weighty cock slips in between the cheeks of your [pc.ass], and he frots himself against you, wiping off his dick with your body. His knot baps against you when he thrusts forward, and your dim, sleepy mind realizes with a start that... he’s still hard.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Could keep going,");
	else output("I wouldn’t mind another,");
	output("”</i> Lund says casually, even as he yawns in exhaustion.");

	output("\n\nYour hand flinches, inching its way towards your effects. You have more.");

	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(1,"Again",againLundAgainForeverAndEver,undefined,"Again","Why kid yourself? This is where you belong. Just let Lund take control, and you’ll never have to make another decision again.");
	addButton(0,"Enough",enoughBeforeLundBadEnds);
}

//[=...Again=]
// Be sure to flip the position of the buttons so that players don’t just click their way through to the Bad End accidentally
// Tooltip: Why kid yourself? This is where you belong. Just let Lund take control, and you’ll never have to make another decision again.
public function againLundAgainForeverAndEver():void
{
	clearOutput();
	showLund(true);
	author("B!");
	output("In some part of your mind, you’re curious to know if there truly is a limit to Lund’s strength and stamina; he’s cum in you and on you so often in such a short amount of time that you just <i>have</i> to know. Lund is stronger than an ox and more virile than an elephant, and he’s only five feet tall. He’s some kind of biological marvel, and... and you have to know.");
	output("\n\nIn some other part of your mind, you don’t actually care, and you’re simply a slave to your body’s wants. You’re fucked so thoroughly that your whole body feels oversensitive and on a hair trigger; all it would take for you to cum again is for Lund to thrust forward with his still-hard, still-leaking dog dick, and wrap your body around his for the umpteenth time in the space of an hour or two.");
	output("\n\nYour hand meekly searches for your effects, and you blindly rummage through them once more for your cookies.");
	output("\n\nLund hums in thought as he watches your hand rustle through your things, then, without provocation, you feel his strong, powerful hands on your waist, and he realigns himself, his pointed tip against your [pc.vagOrAss], and he starts thrusting back into you. Your hole is battered, stretched, and so full that Lund’s jizz is squirting out from you with each push in – and you cum again, your breath heaving from your lungs in surprise, as Lund’s tireless testicles bap against your upturned ass.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("No treats. Not now,");
	else output("No more treats for now,");
	output("”</i> he says, his tone mildly stern, as though he were disciplining a pet that begged once too often for a cookie of its own. <i>“");
	if(!korgiTranslate()) output("Games no more, too. No leaving hold. Hardly leaving room of Lund. Alien too starved for Lund dick to let leave. Irresponsible of Lund.");
	else output("No more games, either. You’re not leaving the hold. You’ll hardly ever leave my room. If you’re going to be this hungry for my cock, it’d be irresponsible of me to let you go.");
	output("”</i>");
	output("\n\nHis inflating knot batters against your [pc.vagOrAss], and your body doesn’t resist for long until it slides into you, tying you to him in more ways than one. The bed and your body both slosh with Lund’s cum as he vigorously pounds into you; your lower body collapses beneath the strain, and Lund repositions himself, his body laying flatly onto yours, and he resumes his ferocious fucking.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Will more treat making for Lund?");
	else output("Will you make me more treats?");
	output("”</i> he asks, his powerful heart beating against your back and his relaxed breath hot against your ears.");
	output("\n\n<i>“Yes,”</i> you say dreamily, entranced by Lund and his abilities. It’ll take some doing – if you’re not allowed to leave the hold, you’ll have a hard time getting the ingredients. Maybe Lund will allow you to make the occasional expedition to Irestead or something.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Will stay and be good pet for Lund?");
	else output("Will you be a good pet for me and stay here?");
	output("”</i> he asks, his heavy, furry balls clapping and bouncing off the cheeks of your [pc.ass] in between his words.");

	output("\n\n<i>“Yes,”</i> you say through clenched teeth, your next orgasm on its way. You wonder what exactly that will entail: will you sleep in a doghouse or something? Wear a collar? Answer to a new name? Eat particular food? Whatever, you’ll do what it takes, as long as Lund keeps fucking you.");

	if(pc.hasVagina())
	{
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Will alien bear pups of Lund? Raise as strong Korgonne hunters?");
		else output("Will you have my puppies? And will you raise them to be proud Korgonne warriors?");
		output("”</i> he asks, his dick lurching inside of you at the thought of you swelling with his litter. His hips move frenetically against you, and his body gets hot and tense.");
		output("\n\nYou groan in approval. The idea of bearing the offspring of someone as exemplary and superior as Lund – that you’d find yourself across the universe, in some tribal community, your [pc.vagina] getting seeded by the galaxy’s most unmatchable stud – you can’t help but cum yourself, your gash tightening on him and squeezing. The cum already inside you churns and bubbles at the tightness of your body.");
	}
	else
	{
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Was alien born for this? To take Lund’s cock in their ass and mouth? Will do forever?");
		else output("Were you born for this? Do you exist and travel across the stars just to have me fuck you? And will you have me fuck you forever?");
		output("”</i> he asks, his dick lurching inside you at the thought of you being his personal fuck toy for the rest of your life. His hips move frenetically against you, and his body gets hot and tense.");
		output("\n\nYou groan in approval. The idea of being Lund’s property forever – that you’d find yourself across the universe, in some tribal community, your [pc.ass] getting seeded by the galaxy’s most unmatchable stud – you can’t help but cum yourself, your hole tightening on him and squeezing. The cum already inside you churns and bubbles at the tightness of your body.");
	}
	output("\n\nLund hisses through clenched teeth as you feel your already bloated ");
	if(pc.hasVagina() && !pc.isPregnant()) output("womb");
	else output("stomach");
	output(" fill with yet more of his cum. He huffs through his nostrils and his body jerks spastically in short bursts while his balls clench one final time against you. You can feel your body expand with his load in an effort to contain it all – locked as you are by his knot, you have little other choice than to accept every fresh drop. That you do it willingly and graciously was up to you.");
	output("\n\nYou’re too dazed and fucked to recite any of your promises or commit them to memory. Your eyes drift closed, to the sound of Lund’s beating heart against your back....");
	processTime(25);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",lundBadEndFinale);
}

public function lundBadEndFinale():void
{
	days += 365*10;
	hours + rand(23)+1;
	clearOutput();
	showLund(true);
	author("B!");

	output("A decade later, and not much has changed.");
	output("\n\nOf course, after you had made that fateful promise to Lund, a whole lot had changed. You had given up your pursuit of your father’s legacy so that you could stay with Lund and be his personal cocksock. You had sold your ship");
	if(crew(true) > 0) output(" and dismissed your crew");
	output(" so that you could afford nice, exotic things for Lund to admire while you sucked his cock. You gave Lund your adventuring gear so that he’d have an easier time hunting for the hold, and so when you bent over and presented yourself to him, you’d feel, in some way, like you had earned the privilege to get fucked.");
	output("\n\nYou know, <i>aside</i> from all that, not much has changed.");
	output("\n\nYou had the hold establish a regular caravan going to the nearby station of Irestead and back for the ingredients to the peanut butter cookies. It also wasn’t too difficult to rig up a makeshift oven in the hold’s lower areas for you to cook them in. One of your primary promises to Lund was easily fulfilled, and with every batch of fresh cookies came a dozen-or-more rounds of ‘reward’ for you, his devoted pet.");
	output("\n\nWith you being Lund’s live-in plaything and cum-dumpster, it was inevitable that you would develop something of a reputation. It’s less that you would live in the hold and then disappear into Lund’s room from time to time – it was more that you would <i>reappear</i> from his room, and you would otherwise spends days at a time in there. You’d stink like sweat and sex, and all you’d do when you come out is go to the lower levels and bake some cookies. Naturally, it got the other Korgonne talking.");
	output("\n\nInitially, when the news inevitably leaked about what your cookies did to Korgonne biology, you were inundated with requests for personal batches. They had offered to pay you with other food, or jewellery, or services, or, the one commodity you had more than enough of, sex. It was easier to just teach a few Korgonne how to bake, and in the space of a month, the hold was a damp sex pit of orgasming Korgonne that would reward every completed task with a cookie or two.");
	output("\n\nThat was all years ago. What’s important is right now. And right now isn’t much different than what’s been happening for years, now.");
	output("\n\nLund’s reclined onto a makeshift armchair, relaxing after a day’s hard work of good hunting, with a plate of fresh peanut butter cookies at his hand. He hasn’t even taken off his loincloth, and you’re already upon him: you crawl on your hands and knees, your Savicite collar hanging loosely around your neck, and you wordlessly, obediently slide your head between his legs and underneath his leather cloth belt to suckle gently on his sheath, your [pc.tongue] slipping out to wetly cradle his balls.");
	output("\n\nIt’s a routine that you two have established: he gets home; you blow him at <i>least</i> twice; you both get some actual food; and then you cap the day off with Lund on top of you, his mouth full of cookies and his legendary cock pumping into your [pc.vagOrAss] again and again, until you collapse in exhaustion. You’re usually the first of you two to wake up, so you wake him up with a calm, patient blowjob, and then he usually snacks on another cookie before he fucks you another three or four times before he heads off to hunt.");
	if(pc.hasVagina()) output("\n\nWith all that fucking, of course it was going to take eventually. Since your rebirth as Lund’s slut, you’ve given birth to damn near thirty Korgonne pups: Lund is so virile and the cookies make him so potent that it’s rare for you to give birth to fewer than triplets at a time. And you’re expecting again right now – judging from the weight in your stomach, you’re guessing between three and five pups this time.");
	output("\n\nIt’s something of a relief when your suckling on Lund’s flaccid cock gets him aroused – even after all this time, and even though the cookies have become a staple of the Korgonne’s diet, you still arouse him, and he still has the patience and the strength to fuck you just like he had the day you first submitted to him.");
	output("\n\nYour [pc.lips] pinch softly at Lund’s sheath, and your tongue lathers are its opening, playing with the beady red tip that’s poked from there. Lund shuffles and sighs – you can’t see him very well because your vision is blocked from his loincloth still draped over your face. But you can tell that his hand is moving towards the plate of cookies you had set out for him.");
	output("\n\nSuddenly, Lund’s cock <i>explodes</i> into your mouth: every corner of your maw is filled with his cock, and his beet-red tip prods at your palette, scraping a thick line of his precum along the roof of your mouth. His sheath bloats with his knot, and soon you’re kissing at his thick, pressing, bulbous shaft as it lurches and throbs against you.");
	output("\n\nYour rub your hand gently over his balls as they clench and lurch, followed by several thick, juicy gouts of his cum flooding into you. You swallow his every load eagerly, your mind wandering to the more nostalgic times you had taken him into your mouth like this. You hear the telltale sound of teeth against crumbly flour again, and his body reacts once more.");
	output("\n\nIn the ten years it’s been since you gave yourself to your master; you never did find the limit to his stamina.");
	pc.libido(200);
	pc.lust(200);
	pc.willpower(-100);
	pc.intelligence(-20);
	//output("\n\n<b>GAME OVER</b>");
	badEnd();
}

public function enoughBeforeLundBadEnds():void
{
	clearOutput();
	showLund(true);
	author("B!");
	output("<i>“But,”</i> he continues, one hand on his stomach and the other on your ass, rubbing at the meat sensually, <i>“");
	if(!korgiTranslate()) output("it been a while... and Lund getting full. Treats taste pretty good, but having good thing too much can be bad.");
	else output("we’ve been at it for a while... and I’m starting to get a little full. The treats taste pretty good, but having too much of a good thing can come back to bite you.");
	output("”</i>");

	output("\n\nYou groan lazily, your [pc.ass] rubbing back against him, wordlessly begging for just another round or two before he pulls away. Your conscious mind is completely exhausted and out of it, but your subconscious mind knows that your body was made to be used by Lund, and it needs to be fulfilled.");

	output("\n\n<i>“Good [pc.boyGirl],”</i> Lund says as he pats you on the head. <i>“");
	if(!korgiTranslate()) output("Come finding Lund later, if in the mood for more treat giving. Lund can reward pet as many times as pet likes. Lund always ready.");
	else output("Come find me later if you’re ever in the mood to give me some more treats. I treat my pets right: I’ll reward you for it as many times as you like. I’ll always be ready.");
	output("”</i>");

	output("\n\nYou watch out of the corner of your eye as Lund ties his waistcloth back around himself, tented obscenely by his still-ready dick, as he leaves the room. You’re left to stew in his copious ejaculate as it pools against you and floods off the sides of his bed.");

	output("\n\nIt takes you several hours before you have the strength to get up and collect your things. When you get to your effects, and you remember that you still have cookies to spare, your [pc.crotch] lurches at the idea of handing Lund some more, even when your body begs in exhaustion to just go find a place to sleep.");

	output("\n\nYou’ll make up your mind when you leave....");

	processTime(10);
	pc.lust(50);
	pc.energy(-100);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Submission]
//New option that shows up after you’ve done the breeding room scene.
//Has gender and is wearing his nip piercings
public function lundSubmissionThing():void
{
	clearOutput();
	showLund(true);
	author("Wsan");
	//First time.
	if(flags["LUND_ADVANCED_SUBMISSION"] == undefined)
	{
		output("<i>“Hi, Lund!”</i> you say cheerfully, smiling at the dominant korgonne. In truth, only half the reason you’re smiling is because you’re happy to see him, despite suspecting you might be falling for him hard. The other half is that you have an inkling that when he sees you happy, smiling, and generally acting like a person with agency... his first instinct is to roughly put you in your well-deserved place.");
		output("\n\n<i>“Hnh,”</i> Lund grunts noncommittally, eyeing you up. ");
		if(!korgiTranslate()) output("<i>“Come with. Have present.”</i>");
		else output("<i>“Follow me. Got something you’ll like.”</i>");

		output("\n\nA present? Your [pc.ears] perk up, and you dutifully follow behind him to his destination. It’s fun being led around by him, not to mention you get to spend the time ogling his muscular back, calves, and his butt through his loincloth. You know only too well what physical feats he can accomplish with those, shuddering almost imperceptibly when you think of the last time you had those cheeks in your hands - when he had his fat, throbbing doggycock spurting hot spunk down your throat.");
		output("\n\nA faint giggle escapes your lips, a scarlet flush rising to your cheeks, but Lund ignores it. By the time you reach the room he was taking you to, you’re turned on enough that anyone could guess it just by looking. Your face is red, you’re breathing just a little too hard and deeply for anyone taking a leisurely walk behind the hold, and the way your [pc.thighs] are not-so-subtly rubbing together; more than a couple of korgonne passed you by with a knowing look. You can’t help it - your imagination is just so fertile and vivid, inspired by the wonderful man in front of you. Oh, he’s saying something!");
		output("\n\n<i>“Sorry?”</i> you say, leaning closer. <i>“I was, um, distracted for a moment.”</i>");
		output("\n\nLund sighs. <i>“");
		if(!korgiTranslate()) output("Alien dumb");
		else output("Silly [pc.girlBoy]");
		output(". Here, look.”</i>");

		output("\n\nHe’s pointing at some kind of coiled heap of a material that resembles leather, accompanied by some light chains. Your heart leaps into your mouth at the sight of it, the idea of being chained <i>at all</i> when around Lund an intensely attractive prospect. You have to shake your head just to focus yourself on the present rather than your fantasies, drawing closer to the outfit to lay a hand on it. Picking it up, you can see it’s a fairly loose apparatus with straps and slots to tighten the leather until it’s wrapped around you.");
		output("\n\nIt’s clear that Lund wants you to put it on, and also that doing so is going to require a second person. Luckily, you have the perfect man on hand to help you.");
		if(!pc.isCrotchExposed() && !pc.isAssExposed() && !pc.isChestExposed()) output(" Stripping down, you leave your garments on the floor - you’re starting to wonder why you even <i>wear</i> clothes at all when you’re in the Hold, it would be so much easier to get fucked by Lund without them. Now");
		else output(" Already");
		output(" naked, your pierced nipples stand stiffly at attention while you delicately handle the clothing Lund has picked out for you. Upon closer inspection, you think this is <i>new</i> - the material is nice and smooth to the touch, and has an almost glossy sheen to it.");
		output("\n\n<i>“One of a kind,”</i> Lund informs you, watching your actions with a smug interest. <i>“");
		if(!korgiTranslate()) output("Just for dumb alien");
		else output("Specifically for you");
		output(".”</i>");

		output("\n\nWordlessly, you resolve to carry this thing out to the fullest. Lund went to all this trouble just for you, and you’ll be damned if you don’t live up to his expectations. Turning back to the outfit, you start by putting your [pc.legOrLegs] through the holes and back up into Lund, asking for help with the back. Feeling his firm, confident hands doing up the straps from behind you is a great comfort, his presence as reassuring as anything. With his help, you manage to put the strapped outfit on flawlessly, exhaling a little as he tightens it up to fit your form.");
		output("\n\nLastly, he turns you around and gently takes hold of the rings he pierced your [pc.nipples] with, fastening clasps to them to connect them to the rest of the outfit and putting a little weight on your [pc.chest]. You hadn’t noticed this while you were inspecting it, but there’s a small golden inscription in the center of the strap that goes across your lower tummy. You can’t help but smile at it; it says the same thing your nipple piercings do. The last thing you notice about the outfit is that it’s accommodated the leash and collar he used to bring you to the breeding room last time, and he gives it an experimental tug to make you stumble closer.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Now alien look like proper slave");
		else output("Now you really look like my slave");
		output(",”</i> Lund growls approvingly, looking you up and down.");
		output("\n\n<i>“It’s perfect,”</i> you breathe, eyes twinkling with amazement as you look down at yourself. Unable to resist, you throw your arms around Lund and hug him tightly, burying yourself in his bushy fur. <i>“Thank you... master.”</i>");
		output("\n\n<i>“Heh,”</i> Lund says with a grin, pushing you downwards. <i>“");
		if(!korgiTranslate()) output("Better way for slave to thank me");
		else output("There’s a better way for a slave to thank their master");
		output(". Make sure to remember it.”</i>");

		output("\n\nAs horny and willing as you are, the opportunity to suck Lund is a blessing. You don’t think you’ve ever been so");
		if(pc.hasVagina() && !pc.hasCock()) output(" wet");
		else if(pc.isHerm()) output(" wet and hard");
		else output(" hard");
		output(" in your entire <i>life</i>, and you’re only too eager to repay the favor. You don’t even bother to taste his delicious precum, passing up the opportunity to please your master by taking him right into your throat. Looking up at him with hooded eyes and the faint impression of a smile on your [pc.lips] wrapped around his engorged cock, you’re treated to the sight of him grunting in approval at your decision and the feeling of your master’s hand on the back of your head.");

		output("\n\nNot even needing to be urged, you suck him deeper, feeling his swollen dick sink into your body inches at a time, your desperation to please him on your knees almost palpable. You’re <i>begging</i> him with your eyes, bobbing up and down on his massive cock with wet, lurid noises in the hopes of him putting that heavenly load of his right in your stomach. Your");
		if(pc.hasVagina() && !pc.hasCock()) 
		{
			if(pc.totalVaginas() == 1) output(" [pc.pussy] is dripping with anticipation");
			else output(" [pc.vaginas] are dripping with anticipation");
			output(", clenching between your thighs every time you suck down to his base as");
		}
		else if(pc.isHerm()) 
		{
			output(" [pc.pussy] drip");
			if(pc.totalVaginas() == 1) output("s");
			output(" in anticipation even as your [pc.cocks], painfully hard, ");
			if(pc.cockTotal() == 1) output("flexes and throbs");
			else output("flex and throb");
			output(", precum beading at ");
			if(pc.cockTotal() == 1) output("its tip");
			else output("their tips");
			output(" as");
		}
		else
		{
			output(" [pc.cocks] ");
			if(pc.cockTotal() == 1) output("flexes and throbs");
			else output("flex and throb");
			output(" with anticipation, dripping readily with precum as");
		}
		output(" you suck down to his base");
		if(pc.hasVagina()) output(" as if he were inside you");
		output(".");

		output("\n\nWhether you’re just that good or he was as turned on as you are, you successfully bring him to orgasm in only a few minutes. Taking hold of your head and beginning to violently fuck your face, Lund’s dominance makes you eagerly cede control, giving up your throat to his use as he begins to fill it with hot, creamy cum.");
		output("\n\n<i>“Nnnngh, good [pc.girlBoy],”</i> he grunts, keeping your face firmly planted right in his groin as his balls pump against your chin. At his declaration, you can’t help it. Trying to keep your hips from jerking too violently, you gurgle into his massive, swelling knot while your");
		if(pc.hasVagina() && !pc.isHerm())
		{
			output("puss");
			if(pc.totalVaginas() == 1) output("y spasms");
			else output("ies spasm");
			output(",");
			if(pc.isSquirter()) output(" squirting all over");
			else output(" [pc.girlCumNoun] dripping to");
			output(" the ground");
		}
		else if(pc.isHerm())
		{
			output("puss");
			if(pc.totalVaginas() == 1)
			{
				output("y");
				if(pc.isSquirter()) output(" squirts all over the ground");
				else output(" slowly drips [pc.girlCumNoun");
			}
			else 
			{
				output("ies");
				if(pc.isSquirter()) output(" squirt all over the ground");
				else output(" slowly drip [pc.girlCumNoun");
			}
			output(" as your cock");
			if(pc.cockTotal() > 1) output("s stiffen and flex");
			output(" stiffens and flexes");
			output(", spraying seed between Lund’s legs");
		}
		else
		{
			output("cock");
			if(pc.cockTotal() > 1) output("s stiffen");
			else output(" stiffens");
			output(", bouncing and flexing while you spray seed between Lund’s legs");
		}
		output(". Groaning in orgasmic release, Lund doesn’t seem to take any notice of your eyes rolling back with debased pleasure - perhaps it’s beneath him.");

		output("\n\nWhen he finally pulls out, you’ve obediently swallowed down every last bit of spunk he’s bestowed upon you. He doesn’t praise you for this, nor do you expect it; you’ve done exactly as you should as a competent slave. Besides, having what feels like half a gallon of his thick, sticky spunk warming your tummy from the inside is a reward in itself. You find yourself idly rubbing your slightly bloated stomach with one hand, thinking about all that cum inside you.");

		output("\n\n<i>“");
		if(!korgiTranslate()) output("Slave cum harder than master");
		else output("Funny that a slave could cum harder than [pc.hisHer] master");
		output(",”</i> Lund notes, looking down at you with an amused expression. <i>“");
		if(!korgiTranslate()) output("Alien fun pet");
		else output("Fun quality in a pet");
		output(".”</i>");

		output("\n\nSo he <i>did</i> notice - but he’s apparently pleased about it. Not that you have any say in the matter, but you’re secretly thrilled: if only you could cum even harder when you submitted to him, so that... no, no. You shake your head. Your old way of thinking no longer applies here. <i>His</i> pleasure is what matters, and yours will follow. It’s the natural way of things now, as you’ve experienced already. Selfishness will only get in the way of elevating Lund to his rightful position as your master.");

		output("\n\n<i>“");
		if(!korgiTranslate()) output("Alien");
		else output("You");
		output(" did make a mess, though,”</i> he continues, giving you a predatory grin, <i>“so ");
		if(!korgiTranslate()) output("need punish");
		else output("you’re gonna need some punishment");
		output(".”</i>");

		output("\n\n<i>“Sorry,”</i> you blurt out automatically, unable to stop yourself. Your cheeks burn a little with the realization of what you’re doing. The " + pc.mf("heir","heiress") + " of a trillionaire on [pc.hisHer] knees before an alien");
		if(pc.tallness >= 12*10) output(" half their size");
		else if(pc.tallness >= 12*8) output(" almost half their size");
		else if(pc.tallness >= 6*12) output(" smaller than they are");
		else output(" on an unfamiliar planet");
		output(", begging their forgiveness for cumming while sucking cock. You have to admit, it’s a little dizzying... but even so, you lower your head. <i>“Sorry, </i>master<i>.”</i>");
		output("\n\n<i>“Good start,”</i> Lund notes, clearly pleased with your chosen course of action. <i>“But ");
		if(!korgiTranslate()) output("Lund know better");
		else output("I know a better");
		output(" way.”</i>");
		processTime(30);
		pc.orgasm();
		pc.loadInMouth(lundCumPlaceholder());
	}
	else
	{
		//Second time.
		output("<i>“Hello, master,”</i> you say, meeting Lund’s gaze and smiling at him. <i>“Would you like me to serve you today?”</i>");
		output("\n\n<i>“");
		if(korgiTranslate()) output("I want you to serve me");
		else output("Lund want slave to serve");
		output(" </i>every<i> day, pet,”</i> Lund says, looking you up and down and leaning off the wall. <i>“Come. ");
		if(!korgiTranslate()) output("Need outfit");
		else output("You need proper attire");
		output(".”</i>");

		output("\n\n<i>“Yes, master,”</i> you reply automatically, falling in line behind him and eagerly following. Your heart beating a little harder as your cheeks gain a tinge of red, you find yourself looking forward to putting your slave outfit on again. There’s just something intoxicating about wearing it, the duality of both lowering yourself to the level of a slave, a piece of Lund’s property, and holding Lund as your master. The outfit belongs to you, marking you as what you are, and you belong to Lund. Everything is as it should be.");
		output("\n\nSome of the korgonne you pass in the halls of the hold seem familiar with you, though you have to admit you can’t say the same for them just yet. But to be fair, you’re a one-of-a-kind item, a prized novelty. The first alien to ever come to the hold, immediately broken in and claimed by Lund, one of their own. You can’t imagine what they think of you and aliens in general, but your reception has been nothing but warm here. You suppose you’re a pretty non-threatening presence, what with your proclivity to be led around the hold in a tight, constraining outfit that leaves you at the mercy of your better.");
		output("\n\nLund leads you silently to his room, showing you inside. Not even waiting for his command, you");
		if(!pc.isExposed()) output(" begin to strip off immediately as he looks on in approval");
		else output(" cross to his bed immediately, where your outfit lies. He looks in approval as you begin to put it on");
		output(", a smile playing across his lips. Once you have your ‘real’ clothes on, he looks you up and down and nods.");

		output("\n\n<i>“Good,”</i> he says, circling you once and tugging at the fastenings across your");
		if(pc.mf("m","f") == "m") output("[pc.butt]");
		else output("[pc.breasts], tummy, and [pc.butt]");
		output(". He pointedly ignores");
		if(pc.isHerm()) output(" your erect [pc.cocks] and the wetness between your [pc.thighs]");
		else if(pc.hasCock()) output(" your erect [pc.cocks], completely stiff in the excitement of being clad in bondage");
		else output(" the wetness between your [pc.thighs], dripping freely in the excitement of being clad in bondage");
		output(". <i>“Hmmm,”</i> he muses, thinking to himself. <i>“");
		if(!korgiTranslate()) output("Maybe adjust");
		else output("Might have to adjust these");
		output(" soon...”</i>");
		output("\n\n<i>“Why?”</i> you ask in confusion, before realizing you shouldn’t have said that and immediately hanging your head. <i>“I’m sorry, master. I spoke out of turn.”</i>");
		output("\n\n<i>“Silly [pc.girlBoy],”</i> he says, shaking his head good-naturedly as he puts a comforting hand on your lower back. <i>“");
		if(!korgiTranslate()) output("Lund tell you later");
		else output("All in good time");
		output(".”</i>");

		output("\n\nYou nod, content with his answer even as you inwardly remind yourself to be better. Being the " + pc.mf("heir","heiress") + " to a trillionaire corporation is proving to be a barrier here; you’re too used to being on equal footing with everyone around you, and that’s no longer the case. Lund is, in your mind and in the flesh, firmly above you in the hierarchy. You can’t imagine your past self thinking such a thing is even possible, but you’ve changed. No - <i>he</i> changed you, pushed it upon you with irresistible force, and now you want nothing more than to repay him for the favor.");
		output("\n\nYou know from experience it’s hard to master anything in a day, especially when it flies in the face of years of training. But deep down you know it’s right, you <i>know</i> that he deserves you being the best slave you can be. Recently you’ve had to admit that the rest of your journey is losing a little bit of meaning in the face of serving Lund, that your efforts could be better focused on your master. Still, though, you have to know.");
		output("\n\n<i>“Am I... a good slave, master?”</i> you ask him uncertainly, not even really sure what kind of answer Lund could give you. Maybe it’s not even your place to ask. You’re so awkwardly unsure that it must show on your face, as he only steps behind you and softly");
		if(!pc.isTaur())
		{
			output(" licks your");
			if(pc.tallness >= 8*12) output(" back");
			else output(" neck");
		}
		else
		{
			output(" pets your flank");
		}
		output(", an oddly reassuring gesture, right before you feel his erect cock between your");
		if(!pc.isTaur()) output("[pc.thighs]");
		else output("thick hindlegs");
		output(" and then sliding into your [pc.vagOrAss].");

		if(pc.hasVagina()) pc.cuntChange(0,lundCumPlaceholder().cockVolume(0));
		else pc.buttChange(lundCumPlaceholder().cockVolume(0));

		output("\n\n<i>“Oh,”</i> you gasp, feeling his canine dick spread you apart. <i>“Oh, master, thank you...”</i>");

		if(pc.isHerm())
		{
			output("\n\nYour pussy completely submissive to Lund’s thick, swollen dick as he fucks it deeper inside, your [pc.cocks] follow");
			if(pc.cockTotal() == 1) output("s");
			output(" suit by beginning to droop, limply flopping back and forth and drooling cum as if in submission to ");
			if(pc.cockTotal() == 1) output("its better");
			else output("their betters");
			output(", following your cue.");
		}
		else if(pc.hasCock()) 
		{
			output("\n\nAs Lund fucks himself deeper into your asshole, your own stiffly-erect cock");
			if(pc.cockTotal() > 1) output("s begin");
			else output(" begins");
			output(" to droop, limply flopping back and forth and drooling cum as if in submission to ");
			if(pc.cockTotal() == 1) output("its better");
			else output("their betters");
			output(", following your cue. For your part all you can do is groan in ecstasy as Lund’s thick, swollen prick rubs against your sensitive prostate, keeping you in a half-hard state of limbo while he takes you upright.");
		}
		else
		{
			output("\n\nYour pussy completely submissive to Lund’s thick, swollen dick as he fucks it deeper inside, you can’t help but instinctively clench around him, tightening yourself for your master and ensuring he feels the utmost pleasure. It’s not hard to do, either, given his incredible girth and size stretching you out. Each time he enters you, he leaves you just that little more suited to his cock, and you love it.");
		}
		output("\n\nSo enthralled are you by having sex with Lund, you don’t even notice you’re being pushed forwards until you’ve taken a few steps towards the exit of the room. Eyes and mouth open wide in surprise and pleasure, you realize he’s forcing you to walk, and you’re about to be in the hold proper. You almost - <i>almost</i> - instinctively push back, slightly afraid, before you conquer the impulse. No. If your master wants you to do this, you will.");

		output("\n\nWhen you emerge from the room with a tight, strained moan as he finally gets himself balls-deep in your ");
		if(pc.hasVagina()) output("cunt");
		else output("ass");
		output(", you find yourself right in front of a couple of young, wide-eyed korgonne women holding hands. You can’t help it. Wearing your slave outfit and having your master publicly fuck you from behind like you’re nothing more than a piece of meat, you cum right there on the spot with a loud, deep groan of utter bliss.");
		if(pc.isHerm())
		{
			output(" Hanging straight down");
			if(pc.legCount > 1) output(" between your [pc.legs]");
			output(", your ");
			if(pc.cockTotal() == 1) output("cocks spurt");
			else output("cocks spurt");
			output(" long, dangling ropes of [pc.cum] onto the ground beneath you even as your pussy clamps down impossibly hard on Lund, making him grunt in effort and pleasure.");
		}
		else if(pc.hasCock())
		{
			output(" Hanging straight down");
			if(pc.legCount > 1) output(" between your [pc.legs]");
			output(", your ");
			if(pc.cockTotal() == 1) output("cocks spurt");
			else output("cocks spurt");
			output(" long, dangling ropes of [pc.cum] onto the ground beneath you, ");
			if(pc.balls > 0) 
			{
				output("your [pc.balls] drawing tightly upwards as ");
				if(pc.balls > 1) output("they pulse");
				else output("it pulses");
				output(" again and again");
			}
			else output("your abdominal muscles constricting tightly as you messily ejaculate all over the ground");
			output(", Lund grunting in effort and pleasure from behind you as you unconsciously tighten up on him.");
		}
		else
		{
			output(" Your pussy clamps down impossibly hard on Lund, his grunt of effort and pleasure like music to your ears, your orgasm increasing your sensitivity tenfold as your walls constrict him, wrapping around his cock in a lover’s embrace. You can <i>feel</i> him resisting the urge to cum even as he fucks you harder, somehow completely in control even as you lose your mind.");
		}

		output("\n\nWatching your complete and utter submission intently, one of the women turns to the smaller one and takes her by surprise, pushing her up against the wall and kissing her roughly, shoving her hand between the legs of her partner. By the time Lund has fuck-walked you past them, they’re both on the ground wrapped in a rough, desperate embrace of need. Guiding you with tugs on your leash and hard, strong fucks that make you just want to stop against the wall and bend over, Lund keeps you stepping forward inch by inch.");
		output("\n\nYou don’t go far, keeping your face downturned and your eyes on the ground below you, moaning and grunting like an animal in heat, until you hear the faint din of a communal gathering. Glancing upwards, you stop dead when you realize you’re in a hallway leading to a massive room filled with korgonne, eating and drinking. Already, you’re the subject of a few curious stares from within.");
		output("\n\n<i>“Master,”</i> you moan, turning your head to look at him desperately.");
		output("\n\n<i>“Go on,”</i> he grunts, lifting one hand to spank you softly, the impact making you tighten up and instinctively take a step forward. Lund uses the momentum to keep you walking, until finally, you emerge into the room proper, head spinning and cheeks burning.");
		output("\n\nNot all of them see you immediately, but more and more of the crowd begins to turn and watch the once-proud, accomplished alien get fucked like the bitch [pc.heShe] is. Your vision is impossibly clear and stark, enabling you to see even the crumbs in one man’s fur as his mouth hangs open, halfway to taking a bite of something. You can see a couple of korgonne against the opposite wall, a man and a woman, clearly into each other but maintaining a slight, awkward distance until her eyes widen and she points directly at you, the male following her gaze.");
		output("\n\nLund doesn’t give you any time to dwell on the situation. You’re shy at first, trying to stifle your grunts and moans as he penetrates you so deeply you can feel the tip of his fat doggycock");
		if(!pc.hasVagina()) output(" creating an outline on your stomach");
		else output(" reaching your cervix, lightly brushing it and leaving precum behind as a marker");
		output(". But in the seconds that pass, you find reassurance in your master’s presence, growing more and more horny and willing as roughly takes you, his thighs slapping against your ass. More importantly, you think <i>he</i> wants you to let go, to show everyone you’re well and truly his little bitch, and nothing could make you happier than to do so.");
		output("\n\n<i>“Oooohhhhh, god, Lund,”</i> you moan in pleasure, lifting your head to look directly at the crowd with your mouth hanging open, panting in need. <i>“Oh god, I’m cumming, I’m cumming, I’m nnnnnngh-!”</i>");
		output("\n\nIn front of what must be close to a hundred korgonne, you cum your brains out, utterly debasing yourself while the pleasure washes throughout your body, scrubbing clean any thoughts of holding back or your own ego and pride. You wonder why you were ever nervous. It feels fucking <i>amazing</i> to be taken by your master in your slave outfit, more rewarding than constricting now, emphasizing all of your attributes as Lund fucks you silly in front of a crowd.");
		output("\n\nThe reactions of the crowd are plain to see. Inspired, more and more korgonne turn to those next to them, indulging their own voracious sexual appetites while others cheer them on, still eating and drinking. The atmosphere is like that of a primal, sexual carnival, and glancing upwards you can see the couple from before against the wall. The girl is standing on one leg with the man supporting her, the other lifted high into the air so he can freely plunge his cock into her sopping wet pussy. Ecstasy is written all over her face as he grinds against her, and you find yourself wondering if that’s what you look like to others.");
		output("\n\nYou don’t have any time to think about them, though, because you can feel your master pumping you harder from behind, ");
		if(!pc.isTaur()) output("pulling your arms back and holding them behind your back");
		else output("firmly spreading your hindlegs and holding them in place");
		output(" as he prepares to cum, and faithfully encourage him.");

		output("\n\n<i>“Oh, god, yes, please cum in me,”</i> you pant, looking back desperately, twisting yourself in his grip to watch him cum. <i>“Yes, yes, oh, masterrrr!”</i>");

		output("\n\nWith a loud, strained grunt, Lund snarls fiercely as he rams himself into your ");
		if(pc.hasVagina()) output("spasming pussy");
		else output("tightening asshole");
		output(", knot and all, more beast than man in the moment, and you love him for it. Bending at the waist to allow him more control, you find yourself borne to the ground,");
		if(!pc.isTaur()) output(" collapsing onto all fours and being taken doggystyle.");
		else output(" your limbs collapsing from underneath you.");

		output("\n\n<i>“Nnnnnnnnnngh, fuck- nnnnnggggrrrrh,”</i> Lund strains through grit teeth, holding you so tightly it hurts, but you don’t even care. You’re too busy gasping in amazement at his strength, his virility, his utter command of you as his cum bathes your insides. You cum again before he even finishes, too excited by your master’s orgasm, his canid dick throbbing inside you.");
		if(pc.isHerm()) output(" Your pussy milks him hard, squeezing him from tip to base, even as [pc.eachCock] empties itself on the ground, imitating your superior.");
		else if(pc.hasCock()) output(" Your cock spurts its seed on the ground, imitating its superior even as your asshole milks him by squeezing down on his dick from tip to base.");
		else output(" Your pussy milks him hard, squeezing him from tip to base while he empties himself inside you.");

		output("\n\nHe pulls out of you before even deflating, leaving you moaning and with a");
		if(!pc.hasVagina()) output("n asshole");
		else output(" cunt");
		output(" so massively distended in the wake of his gigantic knot he could probably fit his fist inside. You can’t help but wink at him, your body instinctively trying to clench your orifice closed to no avail. You’ll tighten back up with a little time, but for now you look every bit like Lund’s whore. Employing a surprising amount of strength, he");
		if(!pc.isTaur()) output(" flips you onto your back, mounting your body and shuffling up to sit on your [pc.chest]");
		else output(" rolls you onto your side and kneels next to your face");
		output(", his knot and still-erect, dripping cock in full view.");

		output("\n\nOf course you can’t resist that. Leaning forward, you immediately take it into your mouth, sucking the tip as hard as you can, hollowing your cheeks to get every last, tantalizing spurt of thick, sticky cum from your master. By the time you’re done cleaning him and eagerly swallowing down his warm seed, though, he hasn’t given any indication that he wants you to stop. Sitting astride you as you suckle his cock, he lets you take him deeper, beginning to suck him off in earnest.");

		output("\n\n<i>“Good slave,”</i> Lund says with a toothy grin as his hand firmly pushes you deeper, and you know it to be true when he grunts in release as you reach the base, his thick cum splattering against the back of your throat and sliding downwards. Your [pc.lips] securely wrapped around his cock and arms hugged around his waist lightly squeezing his butt, you look up at him with nothing but love in your eyes as his cum begins to fill your tummy. You don’t even need to be told to swallow it all, nor to dutifully suck him completely clean when he’s done with your throat. Those just come naturally, an extension of the blissfully unequal relationship between the two of you.");
		output("\n\nAfterwards, when the rush of sexual activity in the hold’s room has subsided a little and Lund has taken a break from fucking you through the floor, you hug him and look up, eyes half-closed with adoration.");
		output("\n\n<i>“Master, you’re absolutely amazing,”</i> you moan, on your knees and wrapped around his leg, nuzzling against his bushy fur.");
		output("\n\n<i>“Shhh,”</i> he says, smiling. <i>“");
		if(!korgiTranslate()) output("Not need slave to tell Lund how good he is. Mouth more useful otherwise");
		else output("I don’t need you to tell me. Besides, your mouth can be put to better use if you want to worship me");
		output(".”</i>");
		output("\n\nHe’s right, of course - he always is. You begin gently kissing his muscular thigh, marvelling at his body, slowly shuffling yourself to kneel in front of him, your proper position. He allows you time to kiss his legs, groin and stomach before gently redirecting you back downwards, whereupon you gladly follow his lead and take his cock back into your mouth, gazing up at him and seeing approval in his eyes. With a firm hand");
		if(pc.hasHair()) output(" gripping your hair");
		else output(" on your head");
		output(" and his cock in your throat, you don’t think you’ve ever been happier or more confident with your direction in life.");

		processTime(30);
		pc.orgasm();
		pc.orgasm();
		if(pc.hasVagina()) pc.loadInCunt(lundCumPlaceholder(),0);
		else pc.loadInAss(lundCumPlaceholder());
	}
	clearMenu();
	addButton(0,"Next",lundSpecialSubmission2);
}

public function lundSpecialSubmission2():void
{
	clearOutput();
	showLund(true);
	author("Wsan");
	//first time?
	if(flags["LUND_ADVANCED_SUBMISSION"] == undefined)
	{
		output("You can hardly believe any of this. That Lund would take you out of the room while you’re fully clad in your slave outfit, that he would flaunt you and parade you around with your leash and collar, and most of all that you would, underneath your scarlet cheeks and wide-eyed expression, be enjoying it. Your head spins at all the stimulation, your master tugging you along like you’re little more than");
		if(pc.isTaur() || pc.bovineScore() >= 3) output(" a prize bull");
		else output(" chattel");
		output(", all while korgonnes passing you in the hallways are pointing and giggling, a few of the more daring women going so far as to touch you as you walk by.");
		output("\n\n<i>“Why is it- ah!”</i> you start, jumping as a particularly well-endowed korgonne girl slaps your butt and snickers. Lund only laughs. <i>“Why is it only the women?!”</i>");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Alien not know culture. Males not mess with my things");
		else output("The males know not to mess with my property,");
		output("”</i> he says. <i>“You just don’t.”</i>");
		output("\n\nPulling on your leash, he jerks you closer until you’re standing next to him, a slave accompanying their master. The hierarchy is immediately obvious to anyone who looks, and in a way, that makes you feel good about yourself. It’s Lund’s decision if he wants to show you off, and having your place known by everyone removes the need for pretenses. You’re free to be yourself, and you choose to place that sense of self in Lund’s firm, dominant hands. You can feel them on your");
		if(pc.isTaur()) output("[pc.breasts]");
		else output("[pc.butt]");
		output(" right now, unable to stop yourself from moaning quietly as he roughly cops a feel of you in plain view.");
		output("\n\n<i>“Mm,”</i> he grunts approvingly. <i>“");
		if(!korgiTranslate()) output("Alien");
		else output("You");
		output(" make nice noises.”</i>");
		output("\n\n<i>“Thuh-thank you, master,”</i> you stutter before realizing");
		if(!pc.isTaur()) output(" where his fingers are going");
		else output(" he’s walking behind you, his fingers sliding along your [pc.butt]");
		output(". <i>“Oh! Oh, Lund!”</i>");

		output("\n\n<i>“Master,”</i> he reminds you, curling his fingers slightly in your [pc.vagOrAss]. <i>“Now come with ");
		if(!korgiTranslate()) output("Lund");
		else output("me");
		output(".”</i>");

		output("\n\nWith a couple of fingers up your ");
		if(pc.hasVagina()) output("pussy");
		else output("asshole");
		output(", Lund escorts you onwards while you pant and moan, trying and failing to ignore his grip on you. Walking haltingly, you only get all the more desperate as his digits slowly sink deeper inside you as your [pc.legOrLegs] move, growing more and more anxious for him to just fuck you but not daring to ask. Luckily for you, Lund knows exactly what you’re thinking.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("How does slave ask master for favor");
		else output("How does a slave ask their master for a favor");
		output("?”</i>");
		output("\n\n<i>“They beg,”</i> you whisper to him, and he nods, rubbing your");
		if(!pc.isTaur()) output(" shoulder");
		else output(" flank");
		output(" comfortingly.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("That right. They beg. So what you want");
		else output("That’s right, they beg. So what do you want");
		output("?”</i>");
		output("\n\n-");
		output("\n\nLund has you up against a wall,");
		if(pc.hasToes()) output(" standing on your tiptoes and");
		output(" crying out in desperate relief as his cock plunges into your asshole, his hands on your hips pulling you down onto his fat, knotty dick while he grunts in effort and pleasure. You cum <i>hard</i> on a particularly deep thrust reaching all the way inside you, your slickened fuckhole tightening up around Lund’s big doggydick as your");
		if(pc.hasCock())
		{
			output(" own half-limp cock");
			if(pc.cockTotal() > 1) output("s spurt and trickle");
			else output(" spurts and trickles");
			output(" ropes of semen");
			if(pc.legCount > 1) output(" between your legs");
			else output(" on the ground");
		}
		else if(pc.hasVagina()) 
		{
			output(" empty, dripping cunt");
			if(pc.totalVaginas() == 1) output(" squeezes");
			else output("s squeeze");
			output(" down on nothing, juices spattering to the ground");
		}
		output(".");
		pc.buttChange(lundCumPlaceholder().cockVolume(0));

		output("\n\nWith a guttural groan, he sinks himself to the hilt in your ass and squeezes your waist, his cum jetting into you in hot, sticky spurts. Humping your butt from below, he grunts and grinds while you moan in sympathetic relief, ecstatic to feel your master’s warm spunk spouting up into your insides. You let yourself relax back into him, accepting his desires as well as you can, completely ignoring those passing you by in the hold. Lund is all you care about, and you need to see to it that he’s catered to.");

		output("\n\n<i>“Thank you, master,”</i> you whisper breathily, closing your eyes and enjoying the sensation of Lund inside you. <i>“I hope it felt as good for you as it did for me.”</i>");

		output("\n\n<i>“Mmmmn,”</i> Lund grunts in satisfaction, licking his lips. <i>“");
		if(!korgiTranslate()) output("Good slave. Clean Lund now");
		else output("Good [pc.girlBoy]. Now clean me up");
		output(".”</i>");

		output("\n\nTurning around and sinking to your knees seems perfectly natural to you now, starting at the bottom by licking Lund’s balls even as his sticky cum runs down your thighs, dripping to the ground. You don’t hesitate at all to delicately take his sack into your mouth, gently sucking and licking at his testes until they’re completely clean of his sweat and any trace of fluids.");
		output("\n\nFrom there, you trace upwards with your tongue, following his girthy cumvein and encircling his entire cock with your tongue. By the time you reach the top, you have a throatful of your master’s warm semen and a beautifully clean, spit-shined cock in front of you. Looking up, you give Lund a proud smile befitting a satisfied slave.");
		output("\n\n<i>“Good work,”</i> he tells you, and your brain turns all pink and fuzzy. You don’t even remember being walked back to the room to take the slave suit off, but you do remember reverently kissing his balls before you leave, and that makes you giddy.");
		moveToLundsHouse();
		processTime(30);
		pc.orgasm();
		pc.loadInAss(lundCumPlaceholder());
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	else
	{
		output("By the time Lund’s finished with you, several hours have passed. He lets you");
		if(!pc.isExposed()) output(" put your clothes back on, as increasingly fake and unnecessary as they’re starting to feel,");
		else output(" take off the outfit");
		output(" before he decides to take you once more. Legs spread and with your master’s cock in your ass, he deigns to cum once more deep inside your guts before you leave. You finally exit his room panting and sweaty with shaky limbs, his cum both warming your insides and dripping down your [pc.thighs] from your incredibly well-fucked holes.");
		processTime(20);
		moveToLundsHouse();
		pc.orgasm();
		pc.loadInAss(lundCumPlaceholder());
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	IncrementFlag("LUND_ADVANCED_SUBMISSION");
}

public function lundBreakHim():void
{
	if (flags["LUND_BROKEN"] == undefined) lundBreakHimA();
	else if (flags["LUND_BROKEN"] == 1) lundBreakHimB();
	else if (flags["LUND_BROKEN"] == 2) lundBreakHimC();
	else lundBreakHimD();
}

public function lundBreakHimA():void
{
	clearOutput();
	showLund();

	output("<i>“Hey boy,”</i> you call out, walking over to Lund with a smile. He looks somewhat uncomfortable with how you’re addressing him out in public, but doesn’t protest. You put an elbow against the wall behind his head and lean easily, grinning at Lund while you scratch him under the chin with your other hand. <i>“Been missing me, pup?”</i>");
	
	output("\n\n<i>“" + (!korgiTranslate() ? "Not miss alien" : "I didn’t miss you") +",”</i> Lund whines, sulking and averting his gaze before you use your hand to direct his eyes back to your own.");
	
	output("\n\n<i>“Don’t lie to your [pc.master], pup,”</i> you murmur to him, your hand slipping down his chest and below his loincloth, where you find his cock already protruding. You can’t help but grin. He’s just so predictable. <i>“It sure </i>feels<i> like you missed me.”</i>");
	
	output("\n\n<i>“No no," + (!korgiTranslate() ? " Lund not" : " I swear") +"- nnnnm,”</i> he starts, breaking into an incredibly girly, slutty moan as you run your fingers along his shaft. <i>“Nooo...”</i>");
	
	output("\n\nYou smile at him victoriously. He can bluster in your face all he likes. But when it comes down to it, he can’t betray the instinct to submit to you, to be - <i>“My little bitch,”</i> you murmur, rubbing his hot, rising cock. <i>“Come on. Let’s go to your room, Lund. I think it’s time for the next step in your </i>education<i>.”</i>");
	
	output("\n\nYou let him reposition his loincloth so he doesn’t have to walk around with his dick tenting it, a smile on your face the whole time. The public embrace of his newly-found submissive tendencies can come later, when he’s good and ready. For now... you’ll just ease him into it. With your present for him balled up and hidden in your hands, you follow the horny korgonne to his room humming happily the whole way.");

	processTime(8+rand(3));

	clearMenu();
	addButton(0, "Next", lundBreakHimA2);
}

public function lundBreakHimA2():void
{
	clearOutput();
	showLund(true);

	currentLocation = "KORGII L10";
	generateMap();

	output("<i>“Okay,”</i> Lund says as he turns to you, eyes rife with suspicion. <i>“What" + (!korgiTranslate() ? " [pc.master] wan" : "’re you pla") +"-”</i>");
	
	output("\n\nYou cut him off by roughly kissing him, pressing yourself into him and feeling his body quiver as he opens up and accepts you. Grinding your thigh into his plump balls you can feel him acquiescing to your actions, gradually shrinking until you’ve got him wrapped around your finger. By the time you pull back, you could probably ask him to fan you with a feather for an hour and he’d do it without question.");
	
	output("\n\n<i>“There you go,”</i> you say lightly, sashaying past him and alighting upon his bed. <i>“Don’t think so hard, cutie. Just do what comes naturally. Oh, and I have a present for you! Take your clothes off.”</i>");
	
	output("\n\nStanding before you, Lund slowly undoes his loincloth and lets it fall to the floor a soft flutter, leaving him to shift uncomfortably under your admiring gaze, your eyes raking his body from top to bottom. His thick, fuzzy fur obscures some of the details of his physique, but he really is such a nicely-built boy. He could");
	if (pc.tallness < 72) output(" bench press you until he was bored and not even break a sweat");
	else if (pc.tallness < 96) output(" probably bench press you upwards of thirty times without stopping for a break");
	else output(" easily bench press you for a few sets");
	output(", but here he is in front of you, his toes turned slightly inwards and shifting his weight from one leg to the other like an awkward teenager.");
	
	output("\n\n<i>“You are so </i>cute<i>,”</i> you tell him, enjoying the faint red hue of his cheeks and the way his cock flexes at your words. <i>“But you’ll be even cuter in this. Here, catch.”</i>");
	
	output("\n\nYou toss him what you’ve been hiding in your hand and he snatches it out of the air lighting fast, his hunting reflexes coming to the fore. Leaning back on the bed and relaxing, you watch his reaction as he unfurls it.");
	
	output("\n\n<i>“What...”</i> Lund begins, before realization lights up his face and dismay follows. His tail droops behind him. <i>“" + (!korgiTranslate() ? "[pc.Master] want Lund to wear" : "You want me to wear") +" </i>this<i>?”</i>");

	pc.destroyItemByClass(Thong);
	
	output("\n\nHolding out the thong and looking at it, he turns it back and forth, inspecting the thin line of fabric that’ll be running up his ass and the minimal amount of coverage in the front. You get up from the bed and approach him, stepping around to his back and wrapping your arms around his waist.");
	
	output("\n\n<i>“They’ll look so sexy on you, Lund,”</i> you murmur in his ear, grinding into him from behind. He can feel your cock against his ass and back, a soft moan escaping his lips. He still looks torn, but you know he’d do anything for you even if he wouldn’t admit it. <i>“Here,”</i> you whisper, taking them from his nervous hands. <i>“I’ll help. Lift your leg, cutie.”</i>");
	
	output("\n\nYou help him into it, sliding the smooth cloth up his furry legs and fitting it snugly into his groin. For a finishing touch, you pull the back of it and let it slap against his hips, grinning deviously as you take a step backwards. <i>“Turn around and lemme see.”</i>");
	
	output("\n\nHe does so, his gaze directed at the floor and his cheeks burning red. You pay no heed to his obvious shame and embarrassment, instead running your hands through his chest fur. You can feel his heart hammering in his chest. The poor boy is a bundle of nerves, but you’ll help him get over it.");
	
	output("\n\n<i>“Oh yeah,”</i> you nod approvingly, putting one finger on the underside of his protruding cock, <i>“that’s fucking hot.”</i>");
	
	output("\n\n<i>“It" + (!korgiTranslate() ? " not" : " doesn’t") +" fit,”</i> he whines quietly, turning his head away.");
	
	output("\n\nYou break out in laughter at his dissatisfaction. <i>“Hahaha! Just don’t get hard, silly boy. It’ll fit fine over your sheath and it looks </i>great<i> on a little bitch like you. Oh, and if I catch you </i>not<i> wearing it...”</i> you add, winking at the korgonne, <i>“I’ll punish you. Here, turn around.”</i>");
	
	output("\n\nDisgruntled, he turns around, following your orders even in the midst of his disapproval. You have to admit - his athletic, muscular build has given him a fucking amazing ass. The way the back of the thong disappears between his bubbly asscheeks is mesmerizing. The longer you look the harder you get until you see Lund himself is looking back at you, transfixed by the sight of your [pc.cockBiggest] hardening, surging with blood until you reach full erection.");
	
	output("\n\n<i>“Alright,”</i> you say, taking a step forward with a smile. <i>“I guess I should reward you for being such a good puppy and wearing the right clothes.”</i>");
	
	output("\n\n<i>“Ah ah,”</i> you say, stopping him from pulling his newly acquired underwear down. <i>“Don’t take it off. Just pull it to the side like my good little slut.”</i>");
	
	output("\n\nWith some difficulty owing to its tight fit over his cock and balls, he reaches back and pulls the thong’s string to the side, allowing you access to his warm, inviting asshole.");
	
	output("\n\n<i>“Good boy,”</i> you purr, standing behind him with your cock in hand. <i>“Gooood boy... now spread your legs a little and bend over at the waist, pup. Keep your back straight.”</i>");
	
	output("\n\nFollowing your instructions to a T, he spreads his legs for you and bends over, putting his arms out on the dresser next to his bed. You don’t bother with foreplay - he’s too eager, and truth be told so are you. Seeing your furry fucktoy lewdly debasing himself in a tight little thong has you rock hard, precum already running from your tip. Aligning yourself with the smooth, soft skin of his asshole, you push your [pc.cockHeadBiggest] inside, forcing a needy whine from Lund’s mouth.");
	
	pc.cockChange();
	
	output("\n\n<i>“Aaah, fuck...”</i> you sigh happily, luxuriating in the way his asshole eagerly grips and squeezes you, practically begging for you to go deeper. <i>“Good boy, Lund...”</i>");
	
	output("\n\nHis needy whine very quickly morphs into a long, whorish moan of utter ecstasy as you sink yourself deeper with a confident grin, one hand on Lund’s waist and another on his lower back, keeping him nice and straight.");

	if (pc.biggestCockLength() < 25)
	{
		output(" You get yourself sheathed entirely within his tailhole with a grunt of pleasure,");
		if (pc.biggestCockLength() >= 14) output(" though not easily. Sliding your hand from his waist to his stomach, you can easily feel your own massive dick’s bulge protruding from his tummy");
		else output(" your dick getting a full-body massage from Lund’s sensitive walls");
	}
	else output(" You can’t get yourself sheathed entirely, but the first two feet of your behemoth cock fit inside his tight little ass, swelling his tummy. Shifting your hand from his waist to his belly, you grin when you feel a gigantic bulge protruding from it.");
	
	output("\n\n<i>“Oh, you </i>like<i>");
	if (pc.biggestCockLength() < 25) output(" taking all of");
	output(" that, don’t you doggy?”</i> you murmur, patting him on the back as you very slowly withdraw yourself from his extremely fuckable hole. He’s having too much of a good time to even answer you, and you don’t begrudge him for it. After all, a pet slut should love their "+ (pc.mf("master’s", "mistress’")) + " hard cock in their asshole too much to speak. That’s not going to stop you from teasing him, though. <i>“What’s the matter, pup? Is my big, hard cock in your tight little hole too good for you to speak?”</i>");
	
	output("\n\nThat gets him to open his mouth, but the only thing that comes out is a loud, deep groan of contentment, an admittal of assent. His cock is half-limp now, flopping every time you push inside him and drooling a never ending stream of clear, slick precum. You smile - he’s going to be <i>perfect</i> when you’re done with him. Leaning over to lie on his back, you overlay your hands with his, intertwining your fingers and using only the motion of your hips to deeply fuck the moaning korgonne boy while you whisper slutty promises in his ear.");
	
	output("\n\nHe cums first. If it wasn’t for the sudden, intense squeezing, you’d hardly even notice. His half-hard dogdick just keeps leaking but you notice that every time you thrust yourself");
	if (pc.biggestCockLength() < 25)
	{
		if (pc.balls > 0) output(" balls-deep");
		else output(" to the hilt");
	}
	else output(" as deep as you can");
	output(" he grunts gruffly, almost a bark, and his next spurt of cum is a thick, creamy white. He’s obviously getting off from having you as deep as possible inside him,");
	if (pc.biggestCockLength() < 14) output(" your cumvein rubbing across his prostate inducing a strong shiver with every thrust.");
	else output(" your giant length displacing his insides and practically making him into your fucktoy.");
	
	output("\n\n<i>“Too good to resist, huh?”</i> you pant, grinning fiercely. <i>“Knew you had it in you, Lund. Now brace yourself on that dresser, boy.”</i>");
	
	output("\n\nPressing yourself right up against Lund’s ass you begin to fuck him so roughly he cries out every time you");
	if (pc.biggestCockLength() < 25) output(" hilt yourself");
	else output(" bottom out");
	output(", his cock now completely limp and flopping so hard it slaps into his stomach with every savage thrust. After a minute of having his hot, slick asshole abused, he suddenly raises himself onto his tiptoes and lets out a long high-pitched whine, transparent cum spurting everywhere. His prostate tenses up so hard you can actually feel it against your [pc.cockBiggest], and he cums all over his flexed");
	if (pc.biggestCockLength() > 13) output(", distended");
	output(" stomach and shaking legs, a small pool of his drippy jizz pooling between his feet.");
	
	output("\n\n<i>“Good - boy,”</i> you grunt, praising him for his submissive sluttiness, not letting up at all. You rail him as hard as you fucking can through his entire prostate orgasm, forcing the pleasure of submitting upon him. He loves having your dick inside him, you can feel it. The way he keeps squeezing down on you while he’s cumming all over himself is irresistible. You push forward so hard Lund loses his balance atop braced feet and the next moment you have him bent over the dresser, cumming in his incredibly tight asshole as deep as you possibly can.");
	
	output("\n\n<i>“Unnnh, fuck,”</i> you groan, timing your persistent thrusts with every eruption of seed from the tip of your dick to ensure he feels your warmth right in his core. <i>“Take it all, my little whore!”</i>");
	
	output("\n\nPressed up against the wall and whining in pleasure not only does he follow your instructions admirably but he cums again while doing so, this time even harder. Ropes of his seed splatter across his belongings even as your own spouts into his asshole, your sticky jizz warming his insides sure to be of great comfort when you’ve left. When you’ve thoroughly drained yourself of everything you have to give, you pull out of his hot, grippy hole with a comfortable sigh.");
	
	output("\n\nLund stays laid out on the dresser, still moaning in pleasure and giving you a fantastic view of his fucked-hard and stretched out asshole. Your [pc.cum]");
	if (pc.cumQ() < 10000) output(" slowly drips");
	else if (pc.cumQ() < 20000) output(" steadily flows");
	else output(" noisily fountains");
	output(" out of it, running down his underside and splattering on the floor.");
	
	output("\n\n<i>“That’s a good look on you,”</i> you tell him, rearing back and giving his butt a nice smack. He yips, then goes back to moaning when you seize a handful of it and squeeze. <i>“Good boy.”</i>");
	
	output("\n\n<i>“Yikes. You’re gonna need to wash this,”</i> you murmur, looking down at Lund’s thoroughly cum-soaked thong. You suppose that was a foregone conclusion when you chose to fuck his ass while he was wearing it.");
	
	output("\n\nWhen he rouses himself from his slutfucked stupor, you sit him down on the bed and explain to him he’ll be the one taking the next step in your relationship. You can keep dicking him down, but he’ll never be anything more than a casual fuckbuddy if he doesn’t take action himself.");
	
	output("\n\n<i>“So you want" + (!korgiTranslate() ? " Lund to wear new thing" : " me to wear something else") +"?”</i> he asks, looking unsure. <i>“" + (!korgiTranslate() ? "Ali- [pc.name] make" : "Are you the one making") +" it?”</i>");
	
	output("\n\n<i>“Nope,”</i> you say, leaning in and grinning. <i>“You’re going to make it yourself.”</i>");
	
	output("\n\nYou know the korgonne are an industrious people, taking pride in their craftsmanship. Lund is guaranteed to know at least one person who can handle the request and help him out, and if he really, <i>really</i> wants to keep this going... he’ll find them. He whines and complains, but in the end, you cajole him into it by convincing him it’ll feel so much better to get fucked when he feels well and truly owned. You give him a reassuring kiss on his snout to make him feel better, then make to leave so he can clean himself up.");
	
	output("\n\nYou grin as you walk out, already completely sure of how this will play out.");

	pc.orgasm();

	processTime(60+rand(30));
	currentLocation = "KORGII J10";

	flags["LUND_BROKEN"] = 1;
	IncrementFlag("SEXED_LUND");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function lundBreakHimB():void
{
	clearOutput();
	showLund();

	output("He’s not wearing the thong. You knew he wouldn’t wear it on his own. He no doubt took it off to wash and then, being too embarrassed to do it alone without your urging, never put it back on. That’s okay, and it’s exactly why you told him you’d punish him when it happened. You grin.");
	
	output("\n\n<i>“Heya, boy! Were you good while I was away?”</i> you call out, crossing over to him with a wide smile. <i>“No run-ins with other domineering aliens who wanna fuck your ass and call you a little slut, I hope. C’mon,”</i> you continue, pressing yourself up against his athletic body and taking two handfuls of his fit asscheeks. <i>“Straight to your room, pup. I’m gonna pound you until you howl.”</i>");
	
	output("\n\nYou walk alongside him all the way there with your right hand firmly planted on Lund’s butt just below his tail and a grin on your face. A few korgonne give you and he curious glances, but most just smile and wave at the familiar hunter and his alien friend, especially the women.");
	
	output("\n\n<i>“I wonder how many of these hot, fertile women you bedded before deciding you preferred xeno-cock up your tight little asshole, Lund,”</i> you murmur to him, giving him a fierce squeeze for emphasis. <i>“Do you think they’ll mind their favorite stud being otherwise occupied?”</i>");
	
	output("\n\n<i>“" + (!korgiTranslate() ? "No... Lund think" : "I don’t think so") +",”</i> he says, his uncertainty palpable. His ears flick this way and that, tempting you to scratch his head. <i>“" + (!korgiTranslate() ? "Korgonne not care about partners" : "We don’t care much about whether other partners are in the picture") +".”</i>");
	
	output("\n\n<i>“Oh, good,”</i> you reply, nodding. <i>“That’ll make this less harsh.”</i>");
	
	output("\n\nHe looks");
	if (pc.tallness >= 78) output(" up");
	output(" at you questioningly, but you say nothing more.");

	currentLocation = "KORGII L10"

	processTime(8+rand(2));

	clearMenu();
	addButton(0, "Next", lundBreakHimB2);
}

public function lundBreakHimB2():void
{
	clearOutput();
	showLund();

	output("When you get to his room, the first thing you do is inquire about your demand from last time. As expected, even though he couldn’t wear the thong around, he still managed to muster up the courage to get his suit made. You can’t resist asking.");
	
	output("\n\n<i>“Did you tell him it was for you?”</i> you ask, a curious smile on your lips. <i>“I bet you didn’t, did you?”</i>");
	
	output("\n\n<i>“" + (!korgiTranslate() ? "Lund" : "I") +" didn’t,”</i> he mumbles, turning red and looking downwards.");
	
	output("\n\n<i>“Awww,”</i> you moan in mock disappointment, leaning closer. <i>“Is the little doggy afraid of having his secret found out? That he likes the alien’s");
	if (pc.biggestCockLength() > 12) output(" big");
	else output(" nice");
	output(", fat cock?”</i> You scoot closer still. He’s sweating and eyeing you nervously. <i>“That you just </i>love<i> to get on all fours, like you’re a bitch, and then get your asshole fucking slammed until you can’t help but cum all over yourself?”</i>");
	
	output("\n\n<i>“Well,”</i> you continue after a moment’s pause, leaning back. Lund is left panting, clutching at his bedsheets and wearing an expression of conflicted desire. <i>“I guess I can see why you’d be reluctant. But too bad,”</i> you say, turning to smile at him, <i>“‘cause today we’re doing something special.”</i>");
	
	output("\n\n<i>“" + (!korgiTranslate() ? "[pc.Master]... punish Lund" : "Are you punishing me, [pc.master]") +"?”</i> he asks, looking crestfallen.");
	
	output("\n\nNo need to beat around the bush. <i>“Yes, I am.”</i>");
	
	output("\n\n<i>“" + (!korgiTranslate() ? "Lund... Lund will wear it" : "I-I’ll wear the thong") +", so...”</i> he trails off, looking at you hopefully. <i>“" + (!korgiTranslate() ? "No punish" : "[pc.Master] won’t need to punish me") +"?”</i>");
	
	output("\n\n<i>“Awww, you’re fucking adorable, Lund,”</i> you say, standing and looking down at him with a grin. His doggycock is stiffly erect, and has been since the moment he started thinking about punishment. You wonder if he even notices it himself. <i>“But that’s not good enough. You’re not doing me a </i>favor<i>, I </i>expect<i> you to wear the thong. Always. That’s why I have to punish you.”</i>");
	
	output("\n\nYou pick up the clothing he had made, inspecting it thoroughly. Whoever he went to for this, you really have to commend them for their work. Not only is it extremely well-made, but it fits the specifications perfectly. Now all that’s left is to dress your subservient, already-erect dogboy up in it and fuck him sideways.");
	
	output("\n\n<i>“Alright Lund,”</i> you say, motioning for him to get up. <i>“Let’s get you all dressed up.”</i>");
	
	output("\n\nAccepting his fate, he acquiesces to your request and gets up, letting you help him out of his by-now-redundant loincloth and freeing his dick from underneath it. You give it a cursory stroke, running your fingers from base to tapered tip. He trembles under your touch, precum bubbling over and running down his shaft. With a grin, you collect all of it with a finger and at last, bring it up to his lips.");

	output("\n\nHe opens his mouth and slowly, gently licks it clean, careful to avoid your finger with his teeth. You withdraw it from his muzzle and scratch him under his furry chin.");
	
	output("\n\n<i>“Very good,”</i> you murmur approvingly.");
	
	output("\n\nAfter that, Lund turns around and you stand behind him, once again helping him put his thong on. When he’s done, you hug him tight around his trim waist and grind yourself against his ass, whispering into his ear.");
	
	output("\n\n<i>“Nnngh, I can’t </i>wait<i> to sink my cock");
	if (pc.balls > 0) output(" balls-deep");
	output(" inside your asshole, Lund,”</i> you groan, overflowing with need. <i>“All you have to do is put on that little outfit of yours and we can start.”</i>");
	
	output("\n\nIf he wasn’t certain before, he is now. Breaking free of your embrace, he practically throws the outfit on, straps and belts and all, and resolutely holds his arms behind his back so you can bind them. You watch the entire process with a grin, pleased with his progress. There’s nothing holding him back now.");
	
	output("\n\nYou do up his bindings one by one taking care that they don’t pinch or catch on his fluffy fur, noting with amusement that his overactive tail is wagging the whole time.");
	
	output("\n\n<i>“You just can’t wait, can you boy?”</i> you ask, stroking his tummy fur. <i>“For me to be all up in that tight little ass of yours.”</i>");
	
	output("\n\n<i>“[pc.Master]...”</i> Lund whines, restrained by his outfit and unable to do much but roll his hips up and down, rubbing against your [pc.biggestCock]");
	if (pc.isCrotchGarbed()) output(", your [pc.lowerGarments] somehow having gone missing during the fun");
	output(".");
	
	output("\n\n<i>“Ooh, you’re all ready to cum, aren’t you?”</i> you whisper, lovingly caressing his front. <i>“But what a waste that would be, to just cum all on your own. Don’t you want to feel me inside you before you pop?”</i>");
	
	output("\n\n<i>“Yes! [pc.Master], please!”</i> Lund whines, desperately straining in his bindings. <i>“" + (!korgiTranslate() ? "Lund": "I’ll") +" do anything! Just fuck" + (korgiTranslate() ? " me" : "") +"!”</i>");
	
	output("\n\n<i>“Anything at all?”</i> you say, grinning.");
	
	output("\n\n<i>“Yes! Yes!”</i> Lund insists.");

	output("\n\n<i>“Here,”</i> you murmur, pulling his thong to the side and sliding yourself");
	if (pc.balls > 0) output(" balls-deep");
	else output(" to the hilt");
	output(" in one swift, smooth motion. Lund’s movement ceases immediately and he moans as you draw your hips back, pulling your [pc.cockHeadBiggest] back to his entrance and spreading him wide once more.");
	
	pc.cockChange();
	
	output("\n\nHe cums immediately, a low groan escaping his lips that gradually grows in volume with every thrust until, finally, he gives in and howls. He was so worked up that his cum comes out in an almost never ending flow, spurting and spraying from the tip of his jerking cock while you fuck his ass. His doggy dick is like a plentiful fountain, one that lets loose a massive rope of jizz every time you bottom out inside him.");
	
	output("\n\n<i>“Oooohhhh! Oooooohhh! [pc.Master]! [pc.Master]!”</i> Lund cries, looking down at himself cumming in amazement. <i>“Ca-can’t stop!”</i>");
	
	output("\n\n<i>“Good boy,”</i> you whisper to him, and that just sets him off even more. He squeezes down on your dick so hard you’re forced to stop for a second before you roughly grind your hips into him, penetrating his body’s token resistance.");
	
	output("\n\nTaking a firm hold of his bindings and bending him over, you begin to fuck him harder, so hard he’s forced to take a step just to keep himself steady and cumming. Then another. Kept off-kilter by your rhythm, you have no problem herding him towards the door. He doesn’t even notice what you’re doing until he’s in the hallway outside bent over in front of a trio of women, cumming his brains out as the leader of the group regards him curiously.");
	
	output("\n\n<i>“" + (!korgiTranslate() ? "Lund, that you" : "Lund, is that you") +"?”</i> the girl asks, leaning forward to look him in the eye. She gives his shaking snout an appraising lick. <i>“" + (!korgiTranslate() ? "Is Lund" : "That’s Lund, alright") +".”</i>");
	
	output("\n\nLund opens his mouth to say something, but all he manages is a grunt of release followed by a long, pleasured moan.");
	
	output("\n\n<i>“Don’t mind him too much,”</i> you say. <i>“He’s a little occupied.”</i>");
	
	output("\n\n<i>“" + (!korgiTranslate() ? "Lund happy boy" : "Well, he looks happy to me") +",”</i> she says, shrugging indifferently. <i>“" + (!korgiTranslate() ? "Alien keep Lund happy" : "Planning to keep him happy") +"?”</i>");
	
	output("\n\n<i>“Oh, he’s gonna be happy as long as he’s with me,”</i> you promise with a smile, right as Lund groans and shakes, cumming so hard his spunk shoots up his front. <i>“Got my - </i>nnngh<i> - word on that one.”</i>");
	
	output("\n\nThe girls leave you and Lund without saying much more, though one keeps glancing back at Lund with interest before being pulled along by the leader.");
	
	output("\n\n<i>“See? No need to be ashamed,”</i> you murmur to him, pulling him back up into earshot. <i>“Let’s make the rounds, okay pup?”</i>");
	
	output("\n\nOf course, not everyone is so generous. A few tease him. One girl tugs on his ear while she gives him a few whispered sentences as he whines, but nobody is overtly mean. The males don’t seem to care at all, save for a few. One in particular can’t keep his eyes off you, and he quickly looks away with the most intense blush you’ve ever seen through fur when you give him a knowing grin.");
	
	output("\n\nWhat really catches your attention, though, is what happens when a group of women Lund clearly knows show up. They ask him, not impolitely, who you are to him, clearly curious about the manner of your relationship. This is a test for him. If he doesn’t say ‘[pc.master]’...");
	
	output("\n\nBut what he groans isn’t <i>“[pc.Master]”</i>. That’s what the translator tells you he says, but it’s not - you know it. You’ve seen him say it enough to know. The way the korgonnes react, with wide eyes and gasps, tells you as much regardless. Then they’re huddling around him and scratching behind his ears giggling even as you fuck him over a table, his head laid out on the wood for them to pet. It’s a curious sight, and the girls disperse almost as quickly as they showed up, leaving the two of you alone.");
	
	output("\n\nPressing him roughly up against a wall, you give it to him so hard his breaths come out in loud, shuddering gasps, his muzzle hanging open while drool flies from his lips. Hammering your hips into his behind, you grunt in pleasure when you cum standing, your spunk dripping and spraying back from his overfilled hole.");
	
	output("\n\n<i>“Take it all, pet,”</i> you grunt, hilting yourself in Lund’s hindquarters as he loses his breath and cums again, his overtaxed dick spurting all over the wall. <i>“Good boy.”</i>");

	processTime(30+rand(15));

	clearMenu();
	addButton(0, "Next", lundBreakHimB3);
}

public function lundBreakHimB3():void
{
	clearOutput();
	showLund(true);

	output("Overall, you’re surprised and pleased. Given how reluctant Lund had been about this you weren’t sure how the reception of his new status would be but there was nothing to worry about after all. He’ll no doubt be a lot more open to public displays of his utter submission in the future. You have him back in his room paying you your dues, on his knees between your legs after you fucked him so well.");
	
	output("\n\n<i>“So?”</i> you ask, gazing down at the dog boy slowly lapping at your [pc.biggestCock], cleaning every inch of it to a spitshine. <i>“What did you say to those girls, Lund? I’m curious.”</i>");
	
	output("\n\n<i>“It-”</i> he begins, then hesitates. <i>“"+ (!korgiTranslate() ? "No proper word in [pc.master] language, Lund think. To do with sex role and partnership" : "I don’t think there’s an equivalent word in your language, [pc.master]. It’s to do with our roles in sex and partnership") +".”</i>");
	
	output("\n\n<i>“Hmm,”</i> you say, considering his words. Maybe just a fancy word for owner, then, but that doesn’t seem to make sense given their reactions.");
	
	output("\n\n<i>“" + (korgiTranslate() ? "There’s m" : "M") +"ore than one meaning" + (korgiTranslate() ? ", too" : "") +",”</i> Lund adds after a few seconds.");
	
	output("\n\n<i>“Oh? What’s the second meaning?”</i>");
	
	output("\n\n<i>“‘One who makes me happy’,”</i> Lund mumbles, his cheeks turning a slight pink. He busies himself in the task of sucking your dick rather than face having to talk about this more. You break into a grin.");
	
	output("\n\n<i>“Awww, that’s so sweet!”</i> you exclaim, looking down at the boy hard at work wrapping his tongue around your dick. <i>“I would have been extremely displeased if you’d lied to them, but it seems like you went above and beyond, huh? What a good pet.”</i> You stand up from his bed, placing your hands on the back of his head. <i>“Let me show you how much I approve, Lund.”</i>");
	
	output("\n\nHard to believe there’s a language more nuanced than Terran when it comes to sex, you muse while you steadily fuck his face. Every race has their own words for it, sure, but you don’t think you’ve ever run into a completely unfamiliar term before. You sigh in satisfaction, feeling your orgasm approaching as you begin to facefuck Lund at full strength, your hips bucking against his snout. You’ll have to ask him to write it down later for reference.");
	
	output("\n\nHis ears laid back against his head and his tail wagging furiously, Lund half-closes his eyes as you explode right down his throat, swallowing your seed in eager servitude. You run your hands through his hair with shuddering breath, feeling the way his tongue curls around you. <i>Fuck</i>, Lund is getting good at doing that... he’s almost jerking you off with it while you cum down his throat. Seems he has a real aptitude for this, maybe born out of necessity - he just really, really wants to make you feel good.");
	
	output("\n\nYou gently withdraw yourself from his mouth when you’re done, setting yourself back down on the bed and leaving Lund with");
	if (pc.cumQ() >= 5000 && pc.cumQ() < 15000) output(" a swollen tummy,");
	else if (pc.cumQ() >= 15000) output(" a tummy so swollen with jizz he looks like he’s pregnant,");
	output(" sticky cheeks and seed dripping from his muzzle. You give him a nice, thorough scratch behind the ears as he immediately begins to clean you off again, starting from the base.");
	
	output("\n\nFunnily enough, you actually don’t want to leave just yet. Maybe you’re just particularly horny, maybe Lund’s just really good with his mouth or maybe it’s the fact he more or less told you he loved you in his native tongue, but you still want to fuck him regardless. You stand up once more when he’s done cleaning.");
	
	output("\n\n<i>“" + (!korgiTranslate() ? "[pc.Master]" : "Are you") +" leaving?”</i> Lund asks, curious. <i>“Or...”</i>");
	
	output("\n\nYou smirk. <i>“Or. Now get your fuzzy butt on the bed, pet. On all fours.”</i>");
	
	output("\n\n<i>“Yes, [pc.master],”</i> Lund says, eagerly clambering up onto the bed and positioning himself. He has his soft, fuckable ass in the air, his back arched and his tail pointing straight up before you can even start to correct his posture with your hands.");
	
	output("\n\n<i>“Very good,”</i> you murmur, joining him and placing your hand on his lower back. <i>“Now breathe deep, bitch.”</i>");
	
	output("\n\nBy the time you leave him, it feels like his entire room is covered in spunk, both his and yours. You kiss Lund on the snout and whisper a warm goodbye to the still-cumming dogboy, leaving him to cleaning and skipping out with");
	if (pc.balls > 0) output(" your balls drained");
	else output(" your urges somewhat sated");
	output(" and your mind clear. You’ll have to come back and visit Lund again soon, that’s for sure. He’s just too much fun to fuck.");

	processTime(30+rand(15));
	pc.orgasm();

	flags["LUND_BROKEN"] = 2;
	IncrementFlag("SEXED_LUND");
	currentLocation = "KORGII J10";

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function lundBreakHimC():void
{
	clearOutput();
	showLund(true);

	output("You approach Lund with a grin. He looks like a shy teenage girl waiting for his date, hands behind his back and casting nervous glances from side to side. He looks so <i>pretty</i> in his cute little thong, your furry athletic boytoy. The sight of him so uncertain yet so bold, so nervous and yet confident, arouses you to the point of erection before you’ve even reached him.");
	
	output("\n\nWhen he finally sees you his lips have barely begun to curl into a smile before you roughly push him back against the wall, his eyes going wide as you passionately kiss him and suck his tongue. After a couple of blissful seconds they flutter closed and you take the opportunity to press forward, grabbing a handful of his ass and lifting one of his legs to let it rest around your [pc.hips].");
	if (pc.isCrotchExposed())
	{
		output(" Your [pc.biggestCock] resting against his sheath");
		if (!pc.isNude()) output(" through your [pc.lowerGarments]");
		output(", y");
	}
	else output(" Y");
	output("ou give him a gaze so lustful you can feel him shiver in your embrace.");
	
	output("\n\n<i>“Your room, Lund. Now,”</i> you growl.");
	
	output("\n\nBy the time you reach it neither of you are in the mood for waiting. Already panting with desire, Lund pulls his thong to the side before you even reach the bed and you sink yourself");
	if (pc.biggestCockLength() <= 6) output(" to the hilt/");
	else output(" six inches deep");
	output(" with a groan of pleasure, feeling the way Lund’s tight asshole eagerly grips and sucks at your [pc.cockHeadBiggest]. Both of you standing in the middle of the room, you rut your slutty pup with a commanding hand at his neck and another on his washboard stomach.");
	
	output("\n\n<i>“[pc.Master], [pc.master],”</i> Lund whines, losing himself in your motions. With your head over his");
	if (pc.tallness >= 60 && pc.tallness <= 68) output(" shoulder");
	else output(" you can see his dick is already drooling while you roughly pump upwards into him, right on the edge of a submissive orgasm. He has his hands over your own, caressing your fingers with love as you");
	if (pc.biggestCockLength() >= 12) output("r cock ruts deep enough inside his asshole to make a bulge under your fingertips");
	else
	{
		output(" thrust,");
		if (pc.balls > 0) output(" your [pc.balls] slapping against his furred taint");
		else output(" moaning all the while");
	}
	output(". <i>“Gonna cum! I’m gonna cum, [pc.master]!”</i>");

	output("\n\n<i>“Good,”</i> you grunt, tightening your grip on the korgonne boy as you push him over the edge.");
	
	output("\n\n<i>“Ohhhh, yeeesss,”</i> Lund moans, his hands gently squeezing your own with each contraction of his asshole and following ejaculation. <i>“Oh, " + pc.mf("masterrrr", "mistresssss") +"...”</i>");
	
	output("\n\nYou can see how much he was looking forward to this. He cums all over his room, seed spurting from the end of his oversized cock in long, thick ropes that splatter all over the floor. By the time he’s done cumming and sags back against you, gasping, there’s a creamy puddle of doggy jizz pooled in front of him.");
	
	output("\n\n<i>“You’re lucky I don’t make you clean that up with your tongue, Lund,”</i> you tease, pushing him forward. <i>“Now get on the bed so I can fuck you properly.”</i>");
	
	output("\n\n<i>“Yes,”</i> he whines, still needy even in the afterglow of his orgasm. His sexual appetite is almost insatiable, making him the perfect fucktoy. He’s on the bed in a flash, but not so fast that he breaks free of your grip. He’s incapable of doing so, even if he has the strength. By now, the shackles of your dominion are coiled around his mind rather than his body. He’s addicted to you.");

	output("\n\nThe sex is quick, messy, and animalistic. You pound Lund’s asshole hard enough to make his bed creak and slam against the wall, his hands splayed against it to brace himself against your pushing. The sound of your");
	if (pc.balls > 0) output(" [pc.balls]");
	else output(" [pc.hips]");
	output(" slapping against his curvy butt resounds through the room, the impacts getting wetter and wetter as both of you cum hard. Groaning in pleasure, you let your hands snake upwards from his hips to caress his chest, gently squeezing his nipples and lifting him upwards as you come down from the high of orgasm.");
	
	output("\n\n<i>“Ohhhh, ohh, [pc.master]...”</i> Lund moans, relaxing in your hands as he wraps his own around your forearms. <i>“" + (!korgiTranslate() ? "Lund good pet" : "Was I a good boy") +"?”</i>");
	
	output("\n\n<i>“Hmmm,”</i> you murmur, feeling up his physique from behind. <i>“I know what would make you a really good boy, Lund. I’ve got something that’ll make getting you ass plowed feel even better.”</i>");
	
	output("\n\nPulling out and pushing him down on the bed, you rifle through your belongings until you find it. A tube of Anusoft cream you bought specifically for this purpose. You turn back around to find Lund still lying on his stomach, legs spread slightly and his head turned to see what you’re doing.");
	
	output("\n\n<i>“" + (!korgiTranslate() ? "What that, [pc.master]? Toy" : "What’s that, [pc.master]? A toy") +"?”</i> he says, tilting his head curiously.");
	
	output("\n\n<i>“Uh uh,”</i> you say, shaking your head. <i>“It’s a transformative. It’s gonna make your tight little butt even nicer for me to fuck. Any objections?”</i>");
	
	output("\n\nHe shakes his head. Nope, none. You hadn’t expected any in the first place. By now, Lund trusts you with his body and mind enough you could probably get him to take anything you wanted. The thought of doing so briefly crosses your mind before you shake your head. One thing at a time.");
	
	output("\n\n<i>“Okay, spread those legs Lund,”</i> you murmur to him, patting his butt. <i>“Good boy...”</i>");
	
	output("\n\nHis asshole is still");
	if (pc.biggestCockLength() > 12) output(" gaping open and dripping with your cum, but that only makes your job all the easier");
	else output(" dribbling your cum, but you’re sure a little of it mixing in with the Anusoft won’t hurt anything");
	output(". You push his legs outward until you realize after some seconds you’ve got him sitting in a split position.");
	
	output("\n\n<i>“Jeez, Lund,”</i> you say, shaking your head in admiration. Your [pc.cockBiggest] stirs yet again, the sight of Lund’s buttcheeks all bunched up and his legs stretched out truly a sight to behold. <i>“You shoulda shown me this earlier. Well, anyway, hold still.”</i>");
	
	output("\n\nUncapping the tube, you carefully place some of the cream on your hand and use your other to hold his asscheeks apart. He yips in surprise when it touches his asshole.");
	
	output("\n\n<i>“Cold!”</i> he gasps.");

	output("\n\n<i>“Shhh,”</i> you comfort him, petting his butt. <i>“It’ll be fine.”</i>");
	
	output("\n\nYou apply the cream in a ring around the hole you just fucked, rubbing it in until it begins to disappear into his soft, supple skin. You know it’s working when he starts to whine again.");
	
	output("\n\n<i>“Hot,”</i> Lund moans, shaking his ass a little. It’s a little enchanting to watch, then the magic starts to happen. Lund begins to moan and thrust against the bed as a soft, ridged surface begins to appear around his asshole, the skin rising to form a small ring around his hole. You pull his thong back into place and let it slide between his cheeks, watching its descent until it’s tightly secured over his newly pumped asshole. It just <i>barely</i> covers the plumped up skin, some of it visible from the sides.");
	
	output("\n\n<i>“Looking good, Lund,”</i> you say, a grin on your face. <i>“You look more and more like my anal slut every day.”</i>");
	
	output("\n\nHe’s still whining a little. <i>“[pc.Master], please...”</i>");
	
	output("\n\nWell, it’s not uncommon for transformatives to have a ‘breaking in’ phase. He’s evidently feeling pretty needy right now owing to the cream, and the way he’s raising his butt off the bed not only gives you a nice look at his newly upholstered asshole but puts a few lusty thoughts in your head. You firmly push it back down.");
	
	output("\n\n<i>“Okay, relax, I’ll give you what you need,”</i> you tell him, getting back into position. <i>“You’re such a little slut, Lund.”</i>");
	
	output("\n\nWith your [pc.cockHeadBiggest] at his entrance, you can already feel the difference. It’s like you’re being sucked inside, a welcoming mat at your favorite hole to fuck, like his ass is trying to suck your cock, and you’re more than willing to let him try it. You slide in <i>slowly</i>, letting him savor the feel of his [pc.master] indulging his need and enjoying his loud, pleasured moans. He shivers underneath you in joy and you can’t help but smile. You’ve still got more than half the cream left in the tube.");
	
	pc.cockChange();
	
	output("\n\nYou take Lund at a nice and gentle pace, rocking back and forth on top of him and keeping him in the splits. It’s a cute look, but more importantly you’ve got a nice view of the way his asshole’s ridged donut sucks at you, gripping you on your outstroke as if he’s begging you not to leave. His tail lolls from side to side whenever you enter him, his mind too involved in the process of enjoying the sex to properly wag it.");
	
	output("\n\n<i>“Fuck, you feel great,”</i> you sigh, pulling his ass back on top of your cock and holding it there for a second. <i>“You’re a hell of a good fuck, Lund.”</i>");
	
	output("\n\n<i>“Uh!" + (!korgiTranslate() ? " T-thanks [pc.master]" : " Thank you, [pc.master]") +"!”</i> Lund moans, twitching as he feels you");
	if (pc.balls > 0) output(" balls-deep inside");
	else output("r dick hilted in");
	output(" his lewd asshole. <i>“" + (!korgiTranslate() ? "Want to be best fuck for [pc.master]" : "I want to be your best fuck, [pc.master]") +"!”</i>");
	
	output("\n\n<i>“Got a little way to go for that, but I think I know what might help,”</i> you say, eyeing the mostly-full tube. <i>“But for now, I’m gonna fuck you full of spunk again.”</i>");
	
	output("\n\n<i>“Yes, yes!”</i> he whines, pushing his ass back into you.");

	output("\n\nHolding him down against the bed, you start fucking him a little harder, experimenting with different angles and speeds before finally giving up and just pounding him like the panting little slut he is. That’s always been how he’s loved it best and all your experimentation amounted to finding out it feels great to fuck him, something that was true even before the cream. Still, though, you have to admit he <i>does</i> suck and grip at you in a way he didn’t before... you can only imagine what he’ll be like with the full dose.");
	
	output("\n\nPumping him faster and faster, you suddenly pull him upwards into your lap and loop your arms around his shoulders from behind, trapping him there while you cum. You groan into his ear with the pleasure of it, enjoying his sultry, panting moans while his fat cock begins to spurt upwards into the air. So tightly pressed against each other, you can feel his strong, lively heartbeat with your chest pressed against his back. It’s a nice reminder that Lund is a hunter-gatherer, a warrior, and that beyond that he’s all yours. Your obedient little bitch.");
	
	output("\n\nYou leave your dick inside him after cumming, lightly kissing his neck in the afterglow of your shared orgasm.");
	if (pc.canineScore() >= 4) output(" Letting your instincts run a little wild, you even give him some light bites that he seems to love");
	output(". His furry tail can hardly move in the space between the two of you, but you can feel it wagging all the same.");
	
	output("\n\n<i>“Alright, get on all fours for a second, Lund,”</i> you tell him, his ears cocking towards you. <i>“I wanna see your butt.”</i>");
	
	output("\n\nPulling out with a grunt - his ring <i>really</i> doesn’t want to let go of your [pc.cockHeadBiggest] - you sigh and settle back as Lund gets up on all fours and looks back at you, a little embarrassed.");
	
	output("\n\n<i>“Is this good?”</i> he asks, sweaty and still panting after the exertion.");

	output("\n\nYou’re not really paying attention to his breathing, though. You’re more intently focused on the curvature of his ass and his cheeks leading inwards to a tight, winking asshole. You’re momentarily entranced by the way your [pc.cum] is dripping from it to run down his freshly-emptied balls. Your eyes flick back up to his butt. Okay, the Anusoft was definitely a good idea. You can actually see your cum pooling slightly on the edge of the ring before it runs down his skin in a rivulet.");
	
	output("\n\n<i>“[pc.Master]?”</i> Lund asks, not quite getting it.");
	
	output("\n\n<i>“Never mind,”</i> you say, shaking your head. <i>“Good boy, you can go wash up. Actually,”</i> you say, suddenly realizing something. <i>“Where do you wash up, Lund?”</i>");
	
	output("\n\n<i>“Where?”</i> he says, confusedly tilting his head sideways. <i>“At "+ (korgiTranslate() ? "the" : "") +" pool, [pc.master].”</i>");
	
	output("\n\n<i>“The pool...”</i> you echo, looking at him and beginning to smile. <i>“So you just walk over there in your thong, my cum dripping down your legs all the way? That’s hot. So everyone knows when I’ve come visiting you, huh?”</i>");
	
	output("\n\nHe turns red, looking down at his hands as he talks. <i>“"+ (!korgiTranslate() ? "Lund usually go right after" : "I usually go right after we’re done") +", so...”</i>");
	
	output("\n\n<i>“So?”</i> you prod him.");
	
	output("\n\n<i>“So "+ (!korgiTranslate() ? "Lund doesn’t" : "I don’t" ) +" get hard at the feeling of it,”</i> he confesses.");
	
	output("\n\n<i>“Ohooo,”</i> you say, grinning. <i>“So the reason you go wash up immediately is because otherwise the thought of it would make you too turned on to hide, huh? Well,”</i> you continue, drawing closer to him on the bed. <i>“Let’s settle in until you do get hard, lover boy.”</i>");

	processTime(30+rand(15));
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", lundBreakHimC2);
}

public function lundBreakHimC2():void
{
	clearOutput();
	showLund(true);

	output("A few minutes later, you send him out with an affectionate pat on the butt and a loving caress of his cock. He whines about it, but obeys. The sight of him walking out of his room with a giant erection and wearing his thong is really something, and you have to admire the way his new ridged asshole dimples under the back of it. No doubt he’ll get a couple of stares from passersby.");
	
	output("\n\n<i>“See you soon, Lund!”</i> you call after him, " + pc.mf("trying not to chuckle", "stifling a giggle") +".");
	
	output("\n\nYou leave the tube of Anusoft on his bed, along with application instructions. You depart his room in high spirits, humming a tune and already looking forward to your next meeting with your depraved doggyboy slut.");

	processTime(3+rand(2));

	flags["LUND_BROKEN"] = 3;
	flags["LUND_ANUSOFT"] = 1;
	IncrementFlag("SEXED_LUND");

	pc.destroyItemByClass(Anusoft);
	currentLocation = "KORGII J10";

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function lundBreakHimD():void
{
	clearOutput();
	showLund(true);

	output("The closer you get to Lund, the more curious you get. What <i>is</i> that thing he’s holding? There’s a line running from it to his... ooh. Aww! He put his leash on waiting for his [pc.master] and now he’s looking for you to play with him. That’s just adorable. Walking up to him, you give him a wave and a smile.");
	
	output("\n\n<i>“Hey there, boy. Miss me?”</i>");
	
	output("\n\nHe practically jumps for joy when you approach, a happy smile lighting up his face. <i>“Hi [pc.master]! "+ (!korgiTranslate() ? "Lund" : "I") +" always miss you.”</i>");
	
	output("\n\nWell, that tugs at the heartstrings a little. What does he do when you’re not around, lie about and look forlorn? You’re almost afraid to ask.");
	
	output("\n\n<i>“Did you use the rest of it?”</i> you say instead, pressing yourself against him and grabbing a handful of his butt. You could swear this is bigger than when you first met. <i>“Have you... been working out?”</i>");

	output("\n\n<i>“Work out?”</i> Lund says, tilting his head and flopping one of his ears.");
	
	output("\n\nYou shake your head. <i>“No, don’t worry about it.”</i> Of course, the tribal hunter society probably doesn’t have much in the way of gym knowledge - their physiques are obtained through hard work, not running on a treadmill and lifting barbells. Well, except for this bit...");
	
	output("\n\n<i>“Oho. So you </i>did<i> use the rest of it,”</i> you murmur, grinning. Unabashedly feeling him up, Lund moans a little as you run your fingers down the line of his thong. You can feel the line of his ridged asshole, protruding significantly when you sink your fingers between his buttcheeks. <i>“Good </i>boy<i>, Lund,”</i> you whisper to him, spanking his ass softly. It jiggles slightly at the impact, though his muscle holds it firm. <i>“You look like a gigantic anal slut.”</i>");
	
	output("\n\n<i>“Just doing what [pc.master] said...”</i> he whines quietly, leaning against you as his tail slowly wags. <i>“"+ (!korgiTranslate() ? "Lund" : "I") +" always do what [pc.master] says.”</i>");
	
	output("\n\n<i>“And that’s why you’re the perfect fucktoy, you little boywhore,”</i> you say, drawing back a little to look him right in the eye as you sink two fingers into his asshole without any warning. <i>“I bet you’ve been getting yourself off with this slutty, sensitive </i>fuckhole<i> of yours since you used the cream.”</i>");
	
	output("\n\n<i>“Ah... aaah!”</i> Lund moans in a high-pitched voice, eyes going wide. <i>“M-[pc.master]!”</i>");
	
	output("\n\n<i>“So?”</i> you challenge him, grinning cockily while you fingerfuck him. You can feel his large dogdick hardening against your [pc.stomach] as you press him against the wall, starting to stand up straight in response to your sexual ministrations. <i>“How many times did you get yourself off?”</i>");

	output("\n\n<i>“"+ (!korgiTranslate() ? "L-Lund" : "I-I") +" didn’t!”</i> he gasps, panting and flexing his calves while you fingerfuck his tight, slick asshole.");
	
	output("\n\n<i>“You didn’t cum even once?”</i> you say, bemused. <i>“You wouldn’t lie to your master, would you, Lund?”</i>");
	
	output("\n\n<i>“No!”</i> Lund insists, looking at you desperately as precum begins to leak from his pointed tip. <i>“"+ (!korgiTranslate() ? "N-not cum be-because! It not [pc.master]" : "I d-didn’t cum beca-uh! Because it wasn’t you") +"!”</i>");
	
	output("\n\n<i>“Because it’s... not me?”</i> you say, comprehension dawning on you slowly. <i>“You can’t cum unless I’m doing it to you?”</i>");
	
	output("\n\n<i>“Yes! Yes! Yes!”</i> Lund moans, bucking his hips into you. His ass is so sensitive now that just having you fingerfuck him and talk is enough to bring him to orgasm. You’re too surprised to even react to the warmth blossoming between the two of you, his cock spurting jizz up both of your torsos and all over your stomachs. He looks you in the eye submissively while he cums, daring to lean forward and sneak a kiss on your [pc.lipsChaste].");
	
	output("\n\n<i>“Sorry, [pc.master]...”</i> Lund whines quietly, putting an affectionate hand on your [pc.chest].");
	
	output("\n\n<i>“No, it’s okay,”</i> you say, scratching his ear idly. Getting cum all over your midriff is a small price to pay to find <i>that</i> information out. How adorably needy of him. <i>“Do you have baths inside? Somewhere to wash up?”</i>");
	
	output("\n\nThere’s a lot you don’t know about Kor’gii Hold, really. You wonder for a moment how many rooms you don’t know about exist; there’s surely plenty of space, after all.");
	
	output("\n\n<i>“"+ (!korgiTranslate() ? "Lund will" : "I’ll") +" take you to"+ (korgiTranslate() ? " the " : " ") +"baths,”</i> he says, nodding and turning away before he remembers something. Turning back, he hands you his leash wordlessly.");

	output("\n\n<i>“Oh, good boy,”</i> you murmur approvingly, taking it from him and following him along with it in hand. You straighten the line once or twice just to tug him around a bit for fun, reminding him who’s in charge. It’s a winding path to the baths, descending deeper into the hold, whereupon you discover to your surprise and delight that the baths are really more like volcanic hot springs.");
	
	output("\n\nDug out of the rock and carefully shaped, there are a bunch of sauna and spa-like pools occupied by korgonne and empty alike. Naturally, you choose one of the most out of the way pools and sink into it");
	if (!pc.isNude()) output(", leaving your stained equipment with an attendant");
	output(". Lund joins you in the heated water, leaving his thong poolside. You beckon him over and soon have the warm, furry boy seated in your lap.");
	
	output("\n\n<i>“Should do this more often,”</i> you sigh, leaning back and relaxing as you run a hand through Lund’s thick stomach fur. <i>“Eh, pet?”</i>");
	
	output("\n\n<i>“Mmmn,”</i> he sighs, leaning into the contact as he works his way further into your lap. <i>“Feels nice, [pc.master].”</i>");
	
	output("\n\n<i>“I know what would feel nicer,”</i> you groan quietly, letting him feel your [pc.biggestCock] rising. <i>“Having this inside that tight fucking ass of yours.”</i>");
	
	output("\n\nThough he doesn’t say anything, you can see - and feel - the redirection of his interest from snuggling to fucking. Not that Lund is very hard for you to manipulate these days, but it’s always nice to see how ready he is to jump on your cock. He shifts in your lap, looking back at you.");

	output("\n\n<i>“"+ (!korgiTranslate() ? "Does [pc.master] want Lund to take it" : "Do you want me to take it, [pc.master]") +"?”</i> Lund whispers.");
	
	output("\n\n<i>“Of course,”</i> you reply, nodding easily. <i>“It’s what you’re best at, after all.”</i>");
	
	output("\n\nHe shivers at that, and you grin. He’s grown to love being belittled, almost bullied, about how much of a fucking slut he is for you to the exclusion of everything else. It’s true, too, that he might be better at getting fucked in the ass than he is at hunting. The actuality doesn’t matter - only that he believes it.");
	
	output("\n\nHe stands up for a moment, letting the steamy water cascade down his lithe body while your cock slowly springs upwards under the clear surface of the water. Then, without even checking to see if anyone is around, he sinks down on your [pc.cockHeadBiggest] with a quiet moan.");
	
	output("\n\n<i>“Good boy,”</i> you murmur to him, reaching up to scratch his chest fur as he struggles to sit back down in your lap. <i>“Keep going and I’ll give you a treat.”</i>");
	
	output("\n\nOrdinarily having him sit down on your erect cock without lube would be a trial but the Anusoft has long since seen to that. Lund’s asshole is a sexual toy without peer, effortlessly swallowing your tip and sucking down more of you with its grippy walls. He’s so tight and and warm inside that it’s almost like he’s giving you a blowjob, taking you deeper by the second.");
	
	output("\n\nWhen his ass touches your [pc.thighs] once more, he gives a loud, deep groan of satisfaction. You’re tempted to join him; the way he’s squeezing on you is insanely erotic, not to mention pleasurable. He’s <i>well</i> practiced by now, clearly having paid attention to what makes you feel good during all your hot, sweaty sex sessions. You can feel him trying to milk you now, squeezing his tailhole to massage you from base to tip, and fuck if that doesn’t feel great.");
	
	pc.cockChange();
	
	output("\n\n<i>“Here, Lund, see if you can keep that up while I fuck you,”</i> you mutter, holding him firmly around the waist.");
	
	output("\n\nYou start rolling your hips inside him, sending gentle waves across the surface of the water. He does his best to keep the titillating squeezing up, his soft, drawn-out sighs slowly morphing into long, hard pants as he feels both of you getting closer and starts to ride a little harder.");

	output("\n\n<i>“[pc.Master], [pc.master], "+ (!korgiTranslate() ? "Lund" : "I’m") +" gonna cum,”</i> Lund moans, biting his lip. You can feel him tightening up around you. <i>“[pc.Master]-!”</i>");
	
	output("\n\nThere’s a couple of urgent splashes and then nothing but labored silence as the two of you shake, teeth grit as you cum together in the pool. Lund’s throbbing cock creates tiny currents in the water as it twitches up and down, spurting creamy seed that dissolves in the hot water immediately. All of your own spunk ends up inside Lund, your warmth tightly sealed in his depths.");
	if (pc.cumQ() >= 3000) output(" He ends up with a fair bulge to his tummy by the time you’re done.");
	
	output("\n\nSlowly, gripping Lund’s hips and letting out a long sigh, you release the tension in your body and lean back against the side of the pool. Lund’s done a fantastic job of milking you and keeping it all inside, and you idly scratch him between the ears for doing so.");
	
	output("\n\n<i>“Good work, pup,”</i> you sigh, spreading your arms along the edge as he relaxes in your lap. Damn, you really <i>should</i> do this more often - having him just sit on your cock and work you with his ass is a different experience altogether, and you don’t even have to do anything except recline. Making him work for your orgasm is nice, too, especially when you know how badly he wants it to happen.");
	
	output("\n\nYou let Lund get out first, his fur dripping wet. He takes a moment to roughly shake himself off, showering you with droplets and reminding you he’s a korgonne after all. At least he makes for a cute pup, you reflect, and mentally congratulate yourself for not getting out yet. Now you only have to dry yourself off once.");
	
	output("\n\nGetting out of the pool");
	if (!pc.isNude()) output(" and getting your things back from the attendant");
	output(", you towel off and make to leave. Lund dutifully waits for you, already wearing his thong again. Looking at him standing there with his hands clasped behind his back gives you an idea.");
	
	output("\n\n<i>“Hey Lund, let’s go back to your room and hang out for a bit,”</i> you tell him.");
	
	output("\n\n<i>“Okay!”</i> he replies cheerfully, just happy to be around his [pc.master].");
	
	output("\n\nYou have him noisily");
	if (pc.balls > 0) output(" licking your [pc.balls] and");
	output(" sucking your [pc.biggestCock] a few minutes later, lying on his bed with your arms behind your head. You were right; this <i>is</i> a good idea. You should be getting him to come out of his shell a little, take matters into his own hands. Now that you’ve broken him down, you can build him back up if you so desire.");
	
	output("\n\nThe possibilities whirl around your head, but you take a moment to quash them as you grunt and cum hard into his throat. Sighing in satisfaction, you let him lick and suckle your cock as he greedily swallows down every drop you have to give him.");
	if (pc.cumQ() >= 3000) output(" Well, nearly every drop - some of it spurts from his snout as he struggles to cope with your voluminous flow, but he gets most of it.");
	
	output("\n\nYou wave him goodbye and set out before he’s even finished cleaning himself off, his lips still dribbling seed. He gives you a little wave, but chokes on your jizz before he can get his words out. You close the door on him taking a few deep, hard swallows.");

	processTime(30+rand(15));
	pc.orgasm();
	
	IncrementFlag("SEXED_LUND");
	currentLocation = "KORGII J10";

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//Random event upon entering Lund’s square. Only available if you’ve broken in Lund or he’s broken in the PC.
//Lund isn’t in his usual spot. Perhaps you could go looking for him.

//[Look4Lund]
//tooltip: Locate the missing korgonne if you can.
//Requires genitals if PC is broken or nothing for brokeback lund
public function look4Lund():void
{
	//Clear this once it happens:
	flags["LUND_MISSING"] = undefined;
	if(!pc.hasStatusEffect("Look_For_Lund_Cooldown")) pc.createStatusEffect("Look_For_Lund_Cooldown");
	pc.setStatusMinutes("Look_For_Lund_Cooldown",24*60);
	clearOutput();
	showLund(true);
	author("Wsan");
	//Just use a generic room with no exits :3
	currentLocation = "MYRNAS CAVE";
	generateMap();
	showName("\nLUND");

	var lundipoo:PregnancyPlaceholder = lundCumPlaceholder();
	output("You’ll check his room first; the hold is a big place and you might as well start with the most likely location.");

	//PC broken:
	if(lundDommingPC()) output("Heading down the winding hallway a tad apprehensively, you begin to wonder if you should really be doing this. He’s <i>your</i> master, the one in charge, your owner. Even so, the curiosity burning within you overpowers the desire to not pry into your master’s life. You have to know what he does in his spare time, though now that you’re thinking about it properly he’s probably out hunting. That is what he does for the tribe, after all.");
	//Lund broken
	else output("Strolling down one of the hold’s many hallways, you retrace the route to Lund’s room. You’ve been in here often enough, after all; bouncing your dog-eared friend up and down on your lap while he whines and cums all over himself. You half expect that he’ll be out hunting, which is ostensibly what he does for the tribe when he’s not furthering alien-korgonne relations by way of intimate diplomacy. Namely, bending over and getting his tight, muscular ass plowed.");

	output("\n\nSo you’re at least a little surprised when you get nearer to his room and see the door ajar. Not only that, but you can hear muffled sounds - a woman and a man.");
	//PC broken: 
	if(lundDommingPC()) output(" Your breath catching in your throat, you gently push the door open to see what lies before your eyes. Is your master having sex with someone? You’re a little jealous already!");
	else output(" A smile playing across your face, you nudge the door open so you can get a better view of the action. Your cute little pet, getting some action? You weren’t sure if he had it left in him.");

	output("\n\nPeeking into the bare, unfurnished room, you");
	//PC broken: 
	if(lundDommingPC()) 
	{
		output(" clap your hand over your mouth and gasp into it when you see what’s happening. Before you on the bed - facing away, luckily - is Lund plowing the fuck out of a female korgonne’s pussy doggystyle. If the loud, orgasmic moans are any indication, she’s having a great time getting pounded out by his canine cock. He has his hands dominantly wrapped around her hips, thrusting into her with a dominance that reminds you of... of, well, when he does this to <i>you</i>.");
		output("\n\nSo that’s what it looks like to other people. Your cheeks flush red, burning hot while you watch the muscles on his back tighten with every push forward. The way he uses his hips to fuck her is masterful, his ass flexing as he grunts in pleasure. You can see his balls, hangin heavy with seed between his legs, slapping against her fat, jiggling ass with a sound like a whipcrack in the tiny room. Void... you were jealous at first, but now you’re just horny.");
	}
	else
	{
		output(" can barely suppress a snicker when you see what’s going on. There’s a pretty korgonne woman bent over Lund, slamming her considerable hips into his groin with several satisfyingly loud, wet slaps. Her hands on his chest, she holds him against the bed while she goes to town on his fat canine cock, plunging it into her needy cunt again and again.");
		output("\n\nFunnily enough, even though you can hear him moaning, Lund doesn’t seem to be having the greatest time. The way this woman is fucking him, too, is suggestive of some kind of frustration. You don’t think even the korgonne women would fuck like this on a regular basis - as far as you know, they prefer doggystyle over cowgirl. This looks more like she’s making a point. Actually, it reminds you a little bit of yourself.");
	}
	output("\n\nThe sex ends abruptly, at");
	//PC broken: 
	if(lundDommingPC()) 
	{
		output(" Lund’s choosing. The woman squeals in delight as he shoves his knot inside her and cums, and you can empathize. ");
		if(!pc.isCrotchExposed()) output("Your wetness is already slicking the inside of your [pc.crotchCoverUnder], and y");
		else output("Y");
		output("ou know only too well the feeling of having that big, fat knot pulsing inside your [pc.vagOrAss]. She must be in heaven right now, moaning and panting like this is the first time she’s ever cum so hard. For all you know, it is - you wouldn’t be surprised.");
		output("\n\nSpanking her butt, you can hear Lund talk to her quietly. Nodding in a daze, she gathers her clothes and leaves, still dripping spunk between her legs. Yeah... that one’s a familiar feeling too. Repositioning yourself at the door, you peer inside to see your master stretching out and flopping back onto the bed. He looks bored.");
		output("\n\nYou timidly tap at the door and watch him raise his head, ears perking up in excitement when he sees who it is. He sits back up immediately and beckons you inside, a smile alighting upon your face as you close the door behind you.");
		output("\n\n<i>“I’m sorry, master. I went looking for you and... and I couldn’t take my eyes off you,”</i> you apologize, bowing your head.");
		if(korgiTranslate()) output("\n\n<i>“Don’t worry about it,”</i>");
		else output("\n\n<i>“Not worry,”</i>");
		output(" Lund says, dismissing your concerns with a wave of his hand. " + (korgiTranslate() ? "<i>“Just finish me off.”</i>":"<i>“Just finish job.”</i>"));
		output("\n\nAs intimately bound to Lund as you are, you know that when he says that he doesn’t just mean getting him off once. He means <i>satisfying</i> him, bending to his will until your mind and body threaten to give out. You kneel before him, positioning yourself in front of his juice-covered cock.");
		output("\n\nHe wants you to clean him off, and when he spreads his legs you’re happy to help. He leans back and relaxes while you quietly work on sucking his cock, licking up the mixture of your master’s spunk and his previous partner’s arousal. You lose yourself in your task, closing your eyes and just letting your tongue guide you where it may up and down his thick, hard doggy dick.");
		output("\n\nMinutes pass before you feel his hand on your head and open your eyes, looking up at him dreamily while he beckons you up. Shifting backwards on the bed, he makes room for you to sit in his lap and pulls you towards him the moment you turn around. His strong hands wrapped around your [pc.hips], he guides you down onto the pointed tip of his fat cock and slides it inside your [pc.asshole] while you moan.");
		pc.buttChange(lundipoo.cockVolume(0));
		output("\n\nLund gives you a few seconds to enjoy the penetration as he sits you down in his warm lap, your [pc.thighs] brushing against his own, before he starts fucking you in earnest. He’s using you in a manner not dissimilar to the way he was fucking the girl you saw earlier, bouncing you up and down on his canine cock while you" + (pc.hasCock() ? "r [pc.cockBiggest] swings wildly, half-hard and leaking precum in response to the anal stimulation.":" tighten up on him."));
		output("\n\nIt doesn’t take too long for you to cum mindlessly, all of the work taken out of the endeavor between gravity and your master pounding you from below. His balls loudly slap against your [pc.ass] until, with a deep grunt, he slams himself balls-deep into your asshole and roughly pulls you against him. You let out a high-pitched moan as his thick canid cum spurts into your insides over and over, the same fate befalling you as the korgonne who came before.");
		output("\n\nUnlike her, though, Lund doesn’t tell you to leave. Instead he lifts you up and tosses you off the bed, cum spurting from your asshole down your shaking [pc.legOrLegs] as he plants a firm hand on your upper back and mounts you from above.");
		output("\n\n<i>“Good timing,”</i> he growls." + (korgiTranslate() ? " <i>“I wanted someone to fuck for a few hours, but she was too inexperienced to handle it.”</i>":" <i>“Lund wanted to fuck for few hours, but korgonne girl not experienced.”</i>"));
		output("\n\nYou let out a quiet cry of pleasure as he dips himself back into you, your arms wrapping around his pillow and your legs raising to touch his calves with your heels. Oh, you’re going to be here for a <i>long</i> time...");
		output("\n\n-");
		output("\n\nBy the time you’re allowed to leave, it’s been more than the few hours promised. Cum drips from your [pc.lips], your asshole, and ");
		if(pc.isHerm())
		{
			output("both your well-used puss" + (pc.totalVaginas() > 1 ? "ies":"y") + " and limp cock" + (pc.cockTotal() > 1 ? "s":""));
		}
		else if(pc.hasVagina()) output("your well-used puss" + (pc.totalVaginas() > 1 ? "ies":"y"));
		else output("your limp cock" + (pc.cockTotal() > 1 ? "s":""));
		output(". You feel like you’ve been wrung dry despite being covered in your master’s warm seed. Exiting his room with shaking legs, you decide looking for him was a good idea after all.");
		//backToHold
		processTime(70);
		pc.loadInMouth(lundipoo);
		pc.applyCumSoaked();
		pc.loadInAss(lundipoo);
		if(pc.hasVagina())
		{
			var cuntStretchDisplayed:Boolean = false;
			for(var x:int = 0; x < pc.totalVaginas(); x++)
			{
				pc.loadInCunt(lundipoo,x);
				//Only display one stretch/devirgin
				if(!cuntStretchDisplayed)
				{
					if(pc.cuntChange(x,lundipoo.cockVolume(0))) cuntStretchDisplayed = true;
				}
				else pc.cuntChange(x,lundipoo.cockVolume(0),false,false,false);
			}			
		}
		pc.orgasm();
	}
	else
	{
		output(" the woman’s choosing. Sinking Lund’s cock to the hilt, she shudders atop him and lets out a satisfied groan from deep in her throat. She stays there, shivering and moaning, for some time before lifting herself off him with a satisfied sigh. You quickly make yourself scarce, closing the door enough so that only the barest sliver of your eyes are visible.");
		output("\n\nThe korgonne woman doesn’t appear to pay any attention to Lund at all, strolling from the room without even saying goodbye with a prance in her step. You think about stopping her for a moment when she steps out - she’s bullying <i>your</i> pet, after all, but what you hear from inside the room stops you. Lund lays spreadeagled on the bed, his cock still completely erect and throbbing painfully.");
		output("\n\n<i>“Master...”</i> he moans quietly.");
		output("\n\nWell, <i>that’s</i> too good to pass up. You slip inside and silently close the door behind you, locking it and approaching the bed. Despite his hunter instincts Lund’s too distracted to even notice your presence until you’ve climbed up on the bed, his eyes springing open to see you grinning down at him. You plant a hand on his athletic chest, spreading your fingers through his fur.");
		output("\n\n<i>“You called?”</i> you " + pc.mf("growl","murmur") + ".");
		output("\n\n<i>“M-master!”</i> Lund stammers, unsure of what to do or say. <i>“Master saw...”</i>");
		output("\n\n<i>“I saw you being used like a toy, yes,”</i> you say, smirking. <i>“I notice you didn’t cum. Was she not as good as I am? Or... can you only cum if I’m the one fucking you?”</i>");
		output("\n\nHis response is to turn a deep shade of red and turn his head to the side, not meeting your eyes while you laugh.");
		output("\n\n<i>“Relax, I’m just teasing you. You can think of this as a little visit to make sure my little pet gets what he needs...”</i> you murmur, your hands finding their way to his hips. <i>“Get up on your knees.”</i>");
		output("\n\nWith Lund facing away from you and his hands against the wall, you sit behind him and reach around to stroke his pre-leaking canine cock while you slip two fingers into his mouth. He obediently runs his tongue over them before you withdraw, sliding them up his ass without ceremony and earning a gasp of pleasure.");
		output("\n\n<i>“Strap in, Lund,”</i> you whisper in his ear from behind, resting against his back. <i>“It’s going to be a long ride.”</i>");
		output("\n\nBetween all of the physical stimulation beforehand and the verbal teasing, it doesn’t take long for Lund to cum the first time. He lets out a weak moan, bucking his hips while his asshole tightens up on your softly caressing fingers. He has to flex three times before he actually manages to shoot cum from his cock, his breath coming out in deep, grateful pants as he empties his balls all over his pillow.");
		output("\n\nThen you start again. Once he’s started, it’s easy to keep him going, after all. You make him cum again, and again, and again, until with each rope of seed that spurts from his overtaxed and throbbing cock he calls for you. Of course, you repay his loyalty by forcing him to keep orgasming.");
		output("\n\nBy the time you finish making him cum with his asshole and your rough, loving handjob, Lund is a sweaty, gasping wreck, his fur matted with the efforts of cumming so hard. The upper half of his bed is coated in thick seed, not to mention all of the ropes stuck to the wall. You give him a nice rub between the ears before you leave him to the cleanup, departing with a smile.");
		processTime(40);
		pc.lust(10);
		pc.orgasm();
	}
	clearMenu();
	addButton(0,"Next",leaveLundsHouse);
}