import classes.Items.Piercings.*;
import classes.Items.Armor.JeweledOutfit;
import classes.Items.Toys.DildoSavicite;
import classes.StringUtil;
/* Kiona by Lkynmbr24*/

/**
	 * ...
	 * @author DrunkZombie
	 */
/*

Flags:

KIONA_MET // 1 = has met
KIONA_MET_WARGII // 1 = has met since wargii fight
KIONA_APPEARANCE // has looked
KIONA_TALK // 1 = has talked
KIONA_TALK_KIONA // 1 = has talked about kiona
KIONA_TALK_YOU // 1 = has talked about you
KIONA_TALK_HUNTING // 1 = has talked about hunting
KIONA_TALK_SHOP // 1 = has talked about shop
KIONA_ACCEPT_CREDITS // 1 = accepts Credits
KIONA_CREDIT_AMOUNT // how much credit she owes steele
KIONA_CREDIT_ONHAND // how much credit she actually has to give steele
KIONA_SEX // number of times sexed
KIONA_SAVICITE// number of savicite donated
KIONA_LUCINITE// number of Lucinite donated
KIONA_PICARDINE// number of picardine donated
KIONA_KIRKITE// number of kirkite donated
KIONA_SATYRITE// number of satyrite donated
KIONA_LUCINITE_QUEST// undef/0 = not accepted, 1 = accepted, 2 = complete, 3 = autocompleted
KIONA_CLOSED_DAY// closed this day and she becomes unavailable until the next day 
KIONA_JEWELED_OUTFIT // pc is owed a discounted outfit 0 -100 is percent of full price
//add sex flags here dz
*/
//show nude or preg bust
public function showKiona(nude:Boolean = false,preg:Boolean = false):void
{
	var tits:Boolean = false;
	//passed in preg parameter is just to toggle the check to display or not
	if (preg)
	{
		//set false if not actually preg and showing
		preg = false;
	}
	
	if (flags["KIONA_MET"] == 1) showName("\nKIONA");
	else showName("KORGONNE\nPROPRIETOR");
	showBust("KIONA" + (preg ? "_PREG" : "") + (nude ? "_NUDE" : ""));
	author("Lkynmbr24");
}
//check if her shop is currently open
public function kionaKioskIsOpen():Boolean
{
	//close shop the day steele gives her 5th savicite or the lucinite to complete the quest
	if (flags["KIONA_CLOSED_DAY"] != undefined && flags["KIONA_CLOSED_DAY"] == days) return false;
	
	if (hours >= 12 && hours < 22) return true;
	
	return false
}
//the current stage of the lucinite fetch quest
public function kionaLuciniteQuestStage():int
{
	var questStage:int = 0;
	if (flags["WARGII_PROGRESS"] == 3 && (flags["KIONA_LUCINITE_QUEST"] < 2 || flags["KIONA_LUCINITE_QUEST"] == undefined )) flags["KIONA_LUCINITE_QUEST"] = 3;
	if (flags["KIONA_LUCINITE_QUEST"] != undefined) questStage = flags["KIONA_LUCINITE_QUEST"];
	
	return questStage;
}
//shop desc
public function kionaKioskBonus():Boolean
{	
	clearOutput();
	showName("KIONA’S\nKIOSK");
	showBust("");
	author("Lkynmbr24");
	var firstMeet:Boolean = true;
	if (flags["KIONA_MET"] == 1) firstMeet = false;
	
	output("A simple display of glimmering, enrapturing jeweled accessories line the counter where");
	if (firstMeet) output(" the korgonne proprietor of this shop");
	else output(" Kiona");
	output(" works. A small forge at the back of the storefront glows brightly, complementing the light coming from the nearby torch sconces.");

	if (kionaKioskIsOpen())
	{
		if (firstMeet) output("\n\nThe shopkeeper");
		else output("\n\nKiona");
		output(" is near the forge, sitting at a portable polishing wheel. She’s hard at work smoothing a piece of savicite for one of her projects. You can try to catch her attention if you want to buy something from her.");
		
		if (firstMeet) addButton(0, "Shopkeeper", kionaKioskApproach, false);	
		else addButton(0, "Kiona", kionaKioskApproach, false);	
	}
	else
	{
		output("\n\nIt doesn’t look like");
		if (firstMeet) output(" the shopkeeper");
		else output(" Kiona");
		output(" is here right now, if the bright red X sign on the front shelf isn’t enough of a clue. You’ll have to come back at a later time if you want to buy anything.");		
	}	
	
	return false;
}
//kiona main menu
public function kionaKioskApproach(skipIntro:Boolean=false):Boolean
{	
	clearOutput();
	showKiona(false, true);
	var firstMeet:Boolean = true;
	if (flags["KIONA_MET"] == 1) firstMeet = false;	
	var firstMeetWargii:Boolean = true;
	if (flags["KIONA_MET_WARGII"] == 1) firstMeetWargii = false;
	var postWargii:Boolean = false;
	if (flags["WARGII_PROGRESS"] == 3) postWargii = true;
	var translateKorgi:Boolean = korgiTranslate();
	var piercingsUnlocked:Boolean = kionaPiercingsUnlocked();
	var questStage:int = kionaLuciniteQuestStage();
	var luciniteFetch:Boolean = false;
	if (questStage == 2) luciniteFetch = true;
	
	if (postWargii && firstMeetWargii)
	{		
		flags["KIONA_MET_WARGII"] = 1;
		
			if (firstMeet)
			{
				flags["KIONA_MET"] = 1;
				output("You approach the counter, surveying the korgonne-crafted jewelry and accessories on display along the way. Several pieces glow a bright green, despite the somewhat dim lighting of this shop. There aren’t any sign signs left of the milodan incursion from what you can tell; this shop seems to have made quite the recovery!");
				output("\n\nThe familiar-looking korgonne working on the polishing wheel in the back of the shop doesn’t immediately turn her attention to you, even after you clear your throat a few times. It takes a sharp <i>“Hello!”</i> from you to finally cause a reaction; with a slight jump, the busy shopkeeper straightens up, nearly dropping the hunk of savicite she was working on. She quickly stumbles over to the counter, nearly tripping over herself along the way.");
				if (translateKorgi) output("\n\n<i>“Ah! Welcome to Kiona’s Kiosk! How may I help-”</i>");
				else output("\n\n<i>“Ah! Welcomes to Kiona’s Kiosk! How can help-”</i>");
				output(" The jewel-clad korgonne’s eyes light up in recognition.");
				if (translateKorgi) output(" <i>“Oh! It’s the off-worlder!”</i>");
				else output(" <i>“Oh! It alien!”</i>");
				output(" She nearly jumps the counter trying to get to you. Once she reaches you, she grips your hand with both of hers and hugs your arm.");				
			}
			else
			{
				output("You approach the counter to Kiona’s Kiosk, greeted by the warm, glowing gems and jewels on display. Kiona herself has her back turned to you, her long ponytail blocking most of her backside from view. With a shrill whistle, you snag her attention. The busy korg nearly jumps out of her fur, yipping loudly in surprise, and drops the jewel she had in her hands with a soft clatter against the stone floor.");
				if (translateKorgi) output("\n\n<i>“Ack! Fuck, okay! I’m coming! Hold your nog’wich...”</i>");
				else output("\n\n<i>“Ack! Frick, okay! Kiona coming! Hold nog’wich...”</i>");
				output(" Kiona huffs, picking the gem up from the ground before rushing over to you. When she reaches the counter, her eyes light up in recognition.");
				if (translateKorgi) output(" <i>“Oh! It’s the off-worlder from before!”</i>");
				else output(" <i>“Oh! It alien from before!”</i>");
				output(" She nearly jumps the counter trying to get to you. Once she reaches you, she grips your hand with both of hers and hugs your arm.");
			}
			
			if (translateKorgi)
			{
				output("\n\n<i>“I heard about what you did when the milodan attacked. Thank you <b>SO</b> much for helping us out! Usually off-worlders never have our best interests in mind, but you’ve proved differently");
				if (luciniteFetch) output("  time and time again");
				output("”</i>. Kiona laughs heartily, while her tail wags a mile a minute behind her. <i>“Couldn’t be happier about it! We can still live our lives the way we want, thanks to you!”</i>");
			}
			else
			{
				output("\n\n<i>“Kiona hearing what alien did when big fang-cats attack. Thankings SO much for helping korgonne! Usually aliens not having korgonne best interest in mind, but this alien prove different");
				if (luciniteFetch) output(" as usual");
				output("”</i>. Kiona laughs heartily, while her tail wags a mile a minute behind her. <i>“Can’t be happier! Can still live lives way korgonne want, thankings to alien!”</i>");
			}
			output("\n\nYou brush the praise aside, downplaying your contribution to the korgonnes’ victory over the milodan.");
			if (flags["WARGII_KIONA_SAVED"] == 1)
			{
				output(" Changing the subject, you ask Kiona about her injuries.");
				
				if (translateKorgi) output("\n\n<i>“I feel pretty great honestly. All better in fact! I only wish I could have contributed more to the cause, but...”</i> Kiona frowns, idly rubbing at the spot on her head that was hit. <i>“I’ll be keeping at it with training so <b>that</b> never has to happen again. Next time, it’ll be <b>my</b> turn to rescue someone in need.”</i>");
				else output("\n\n<i>“Feelings great honest. All betters! Only wishings Kiona helpings more to cause, but...”</i> Kiona frowns, idly rubbing at the spot on her head that was hit. <i>“Kiona keep at training so <b>that</b> won’t happen again. Next times, it Kiona turn to rescue needings one.”</i>");
				output(" the korgonne looks down and away, her tail wagging much slower than before.");
			}
			
			if (luciniteFetch)
			{
				if (translateKorgi) output("\n\n<i>“I made a little something for you in my appreciation while repairing the shop. I hope you like it.”</i> ");
				else output("\n\n<i>“Kiona make something for alien in thanks while fixings shop. Hopings alien like.”</i> ");
			}
			else if (!firstMeet)
			{
				if (translateKorgi) output("\n\n<i>“Also, I’ve been meaning to say that I’m really sorry for the way I acted towards you before... I made a complete ass of myself over something trivial and took it out on you.”</i> She blushes, constantly stuttering over her words. <i>“I, um... I made you something for you in the event that you dropped by. Hopefully this can help make up for things.”</i> ");
				else output("\n\n<i>“Also, meanings to say am sorry for way of actings to alien... Kiona make butt of self over small thing and take out on alien.”</i> She blushes, constantly stuttering over her words. <i>“Uh, uhm... Kiona makings thing for alien in happening that alien drop by. Hopings it help make up for things.”</i> ");
			}
			else output("\n\n");
			output("Kiona lets go of your arm and rushes past the backroom curtains. After a few moments of waiting, she reemerges with a decent sized bundle in her arms.");
			
			if (translateKorgi) output("\n\n<i>“Go on, open it! It’s for you!”</i>");
			else output("\n\n<i>“Go go, open! It for alien!”</i>");
			output(" the korgonne thrusts the package into your arms. At her insistence, you carefully peel off the wrapping, revealing an arranged assortment of jewels and cloth. From the top, you unfurl the garb and spread it out over the counter; it’s an outfit made entirely of transparent fabric and gems! Kiona grins from ear to ear while you admire the handiwork.");
			
			if (translateKorgi) output("\n\n<i>“Probably one of my most inspired pieces yet!”</i> Kiona waves a paw towards her packed shelves. <i>“The whole milodan war wasn’t all bad... certainly not the spoils that came from it anyways. Thanks to that ordeal, I have more stock than I know what to do with. If you’re interested in piercings or anything, I have them in abundance! I just hope that my jewelry and my gift will prove useful for you. We korgonne still owe you so much...”</i>");
			else output("\n\n<i>“Maybe one of most complicated work yet!”</i> Kiona waves a paw towards her packed shelves. <i>“The fighting not all bad... for sure not loot that come with anyway. Thankings to that mess, Kiona havings more stuff than know what doing with. If interest in body sparkles or anything, Kiona have in lots! Just hopings sparkles and gift provings useful to alien. Still feel korgonne owe much more...”</i>");
			
			output("\n\nYou reach over and give Kiona a light hug in appreciation, causing her tail to wag so fast that it almost whirrs. When the two of you finally separate, she retreats behind the counter and readjusts her jewelry so that she looks presentable.");
			if (translateKorgi) output("\n\n<i>“With that in mind, is there anything else I can do for you, Kerborus?”</i>");
			else output("\n\n<i>“That in mind, anything Kiona can do, Kerborus?”</i>");
			
			if (pc.inventory.length < pc.inventorySlots())
			{
				output("\n\n");
				itemScreen = kionaKioskApproach;
				lootScreen = kionaKioskApproach;
				itemCollect([new JeweledOutfit()]);
			}
			else
			{
				output("\n\nThere is no room in your inventory for the Jeweled Outfit.  Come back later when you have room.");
				flags["KIONA_JEWELED_OUTFIT"] = 0;
			}

		processTime(5);
	}
	else if (firstMeet)
	{
		output("You approach the counter, surveying the korgonne-crafted jewelry and accessories on display along the way. Several pieces glow a bright green, despite the somewhat dim lighting of this shop. There’s a very scarce selection from what you can see; only a few scattered necklaces, bracelets, and chains are visible.");
		output("\n\nThe korgonne working on the polishing wheel in the back of the shop doesn’t immediately turn her attention to you, even after you clear your throat a few times. It takes a sharp <i>“Hello!”</i> from you to finally cause a reaction; with a slight jump, the busy shopkeeper straightens up, nearly dropping the hunk of savicite she was working on. She quickly stumbles over to the counter, nearly tripping over herself along the way.");
		if (translateKorgi) output("\n\n<i>“Ah! Welcome to Kiona’s Kiosk! I’m out of piercings at the moment, but how may I help-”</i>");
		else output("\n\n<i>“Ah! Welcomes to Kiona’s Kiosk! Out of piercings at moment, but how can help-”</i>");
		output(" The jewel-clad korgonne cocks her head backwards in surprise, eyes widening in realization at first, then narrowing in suspicion.");
		if (pc.race() == "korgonne")
		{
			if (translateKorgi) output(" <i>“You don’t smell like you’re from around here... Are you from another hold?”</i>");
			else output(" <i>“You not smell like from here... From other hold?”</i>");
			output(" She keeps her distance, taking multiple short whiffs of the air around you. When finished, the corners of her lips stretch wide into a scowl.");
			if (translateKorgi) output(" <i>“No... the off-worlder scent is too strong for that. ");
			else output(" <i>“No... alien smell too strong for that. ");
		}
		else output(" <i>“");
		
		if (translateKorgi) output("Urgh, you must be the one Ula let in here. She’s too trusting of outsiders...”</i>");
		else output("Urgh... Must be alien Ula let in. Too trustings in outsiders...”</i>");
		
		output("\n\nThe furry doggirl sighs out of impatience, sharply rapping her clawed fingers against the stone display table.");
		if (translateKorgi) output(" <i>“Well, what do you want? You want to buy something, or are you just looking to pillage the rest? I bet it’ll come down to that sooner or later.”</i>");
		else output(" <i>“Well? What want? Wanting to buy, or lookings to take rest of gemstock? Will come to that soon, Kiona bet.”</i>");
		output(" Someone’s clearly not happy to see you...");			
		processTime(3);
	}
	else if (!skipIntro)
	{
		output("You approach the counter to Kiona’s Kiosk, greeted by the warm, glowing gems and jewels on display. Kiona herself has her back turned to you, her long ponytail blocking most of her backside from view. With a shrill whistle, you snag her attention. The busy korg nearly jumps out of her fur, yipping loudly in surprise, and drops the jewel she had in her hands with a soft clatter against the stone floor.");
		if (translateKorgi) output("\n\n<i>“Ack! Fuck, okay! I’m coming! Hold your nog’wich...”</i>");
		else output("\n\n<i>“Ack! Frick, okay! Kiona coming! Hold nog’wich...”</i>");
		output(" Kiona huffs, picking the gem up from the ground before rushing over to you.");
		if (postWargii) output(" When she reaches the counter, she lets out a gasp before bowing her head, barely missing the counter with it.");
		else if (questStage >= 2) output(" When she reaches the counter, she gives you a nonchalant wave.");
		else if (questStage == 1) output(" When she reaches the counter, her expression softens slightly, regarding you with tired but expectant eyes.");
		else if (piercingsUnlocked) output(" She nearly stumbles over her feet before she reaches the counter. Small specks of savicite flake off her with a dog-like shake of her body.");
		else output(" When she reaches the counter, her expression darkens. Her eyes narrow, regarding you with scorn rather than annoyance.");
		
		if (postWargii)
		{
			if (translateKorgi) output("\n\n<i>“Ah! Welcome back, Kerborus! Hopefully there’s something here to your liking!”</i>");
			else output("\n\n<i>“Ah, welcomings Kerborus! Hopings there’s something to Kerborus’ likings!”</i>");
		}
		else if (questStage == 1)
		{
			if (translateKorgi) output("\n\n<i>“Oh... it’s you again. Did you manage to get that blue ore yet?”</i>");
			else output("\n\n<i>“Oh... alien again. Manage to get blue rock?”</i>");
		}
		else if (questStage >= 2)
		{
			if (translateKorgi) output("\n\n<i>“Ah, it’s you. Do you need anything? I actually have some time to talk, now that a lot of my orders are done. Many thanks to you.”</i>");
			else output("\n\n<i>“Ah, alien. Needings something? Finally havings time for talk since lots of orders done now. Many thankings.”</i>");
		}
		else if (piercingsUnlocked)
		{
			if (translateKorgi) output("\n\n<i>“Oh, you again. What do you want this time?”</i>");
			else output("\n\n<i>“Oh, alien again. What wantings this time?”</i>");
		}
		else
		{
			if (translateKorgi) output("\n\n<i>“Oh... you again. It’s the same as before; buy something or go on your way. I’m too busy to deal with window-shoppers.”</i>");
			else output("\n\n<i>“Alien again... Same before; buy or leave. Kiona too busy for look-shoppers.”</i>");
			output(" There’s a subtle undertone to her words that suggests a deeper meaning to them.");
		}
		processTime(3);
	}
	else
	{
		if (translateKorgi) output("<i>“That’s it? Alright. What else do you want?”</i>");
		else output("<i>“That it? Alright. What else alien want?”</i>");
	}
	
	flags["KIONA_MET"] = 1;
	
	clearMenu();
	if (questStage >= 2) addButton(0, "Appearance", kionaAppearance, true, "Appearance", "Take a gander at the cute doggy!");
	else if (flags["KIONA_APPEARANCE"] == undefined) addButton(0, "Appearance", kionaAppearance, false, "Appearance", "Take a gander at the cute doggy!");
	else addDisabledButton(0, "Appearance", "Appearance", "You don’t think it would be a good idea to try sneaking a thorough look again....while she’s in a bad mood.");
	if (questStage >= 2) addButton(1, "Talk", kionaTalkMenu, undefined);
	else if (questStage == 1) addDisabledButton(1, "Talk?", "Talk?","If might be best to talk to her when she’s less busy...");
	else if (piercingsUnlocked) addButton(1, "Talk?", kionaFetchLuciniteTalk, undefined, "Talk?", "Maybe she might be more in a mood for talking, now that you’ve helped her expand her inventory a bit more?");
	else addDisabledButton(1, "Talk?", "Talk?","It might be best to talk with her when she’s less angry...");
	addButton(2, "Shop", kionaShop, undefined);
	if (flags["KIONA_TALK_SHOP"] == 1) addButton(3, "Donate", kionaDonate,undefined,"Donate","Give the pup a jewel. It may lighten her mood more!");
	if (kionaSexOK()) addButton(4, "Sex", kionaSex);
	if (questStage == 1)
	{
		//if (questStage > 1) addDisabledButton(5, "Give Lucinite", "Give Lucinite","You have already given her a piece of lucinite and completed the quest.  Use the Donate menu if you want to give her more.");
		if (pc.hasItemByClass(Lucinite, 1)) addButton(5, "Give Lucinite", kionaGiveLucinite);
		else addDisabledButton(5, "Give Lucinite", "Give Lucinite","You don’t have a pieve to give!");
	}
	
	if (flags["KIONA_JEWELED_OUTFIT"] != undefined) addButton(7, "Jeweled Outfit", kionaPickupJeweledOutfit, flags["KIONA_JEWELED_OUTFIT"], "Jeweled Outfit", "Pick up the Jeweled Outfit Kiona made.");
	addButton(14, "Leave", mainGameMenu);	
	
	return true;
}
//appearance
public function kionaAppearance(friendly:Boolean=false):void
{	
	clearOutput();
	showKiona(false, true);
	var translateKorgi:Boolean = korgiTranslate();
	var sexed:Boolean = false;
	if (flags["KIONA_SEX"] >= 1) sexed = true;
	var postWargii:Boolean = false;
	if (flags["WARGII_PROGRESS"] == 3) postWargii = true;
	
	flags["KIONA_APPEARANCE"] = 1;
	
	if (friendly)
	{
		if (sexed)
		{
			if (translateKorgi) output("<i>“Hmph. I suppose you can have another good look at me. You’ve seen everything already.”</i>");
			else output("<i>“Hmph. Kiona suppose you have lookings. See much already.”</i>");
			output(" Kiona smirks, letting you soak in her form.");
		}
		else
		{
			if (translateKorgi) output("<i>“What do you want now, I’m telling you, I’m not for sale.”</i>");
			else output("<i>“What want now. Telling alien Kiona not for sale.”</i>");
			output(" Kiona mumbles, shifting in place uncomfortably, though she doesn’t seem to be opposing your gaze this time around.");
		}
			
		output("\n\nKiona is an expectedly diminutive 4\' 10\" korgonne. While the majority of korgs you’ve seen are stocky when it comes to their builds, this one is a fair bit thinner in comparison. Despite her initially rough personality, she’s gorgeous, for korgonne standards. With all of the jewelry adorning her figure, she could rival Ula’s beauty. A tight red handkerchief wraps around her right biceps, and another on the opposite thigh. In concert with those accessories, she wears an alluring ensemble of lucinite bracelets, anklets, and even several tail rings that sparkle in the dim lighting of the cave. Most notably, several intricately-carved savicite accessories dangle freely around her ears, belly, and tongue. It definitely shows that she a master of her craft.");
		output("\n\nKiona has oddly-shaped, bright hazel eyes that wander towards you on occasion, sneaking peeks to take in your otherworldly appearance. Thin pink lips glisten against the forge fire. Most of her white lower-back-length hair is done up in a ponytail, which cascades behind her elegantly. A fluffy coat of pale brown covers most of her form, broken only by the white of her front side. Her accessory-clad tail wags slowly behind her, tipped with the same shade of white as her hair.");
		output("\n\nKiona’s body is more slender than most of the other korgonne you’ve seen, though she does still have fairly wide hips, bigger-than-average breasts, and a sizable derriere. Tight bandages wrap around her " + (sexed ? "pierced DD-cup " : "") + "breasts, held up by an impressive looking neck brooch made of the same teal material. Kiona doesn’t appear to have nearly the same amount of fat that most lady korgonne have, likely from years of hard work and labor. She is still respectably thick at the thighs despite this, however.");
		output("\n\nA modest light-blue loincloth covers her most private of parts.");
		if (sexed) output(" From your previous trysts with her, you know she has a moist snatch that emits the most wonderful pheromonal aroma of mint. Her tight pucker rests behind and just above it where it belongs.");
		else
		{
			output(" It’s kind of difficult to tell what she’s packing underneath, but there isn’t a visible bulge, and a faint scent of mint wafts from her. She closes her legs suddenly when she notices you staring,");
			if (postWargii && translateKorgi) output(" blushing while murmuring, <i>“H-hey... No staring.”</i>");
			else if (postWargii && !translateKorgi) output(" blushing while murmuring, <i>“H-hey... No stare.”</i>");
			else output(" growling and muttering various obscenities under her breath.");
		}
		processTime(3);	
	}
	else
	{
		output("You attempt to take a good look at the short corgi-girl working the store, only to have her rap loudly against the counter, causing you to flinch in surprise.");
		if (translateKorgi) output(" <i>“Hey! There’s no eye-candy here! And no, I’m not for sale.”</i>");
		else output(" <i>“Hey! No eye-sweets! No, Kiona not for sellings.”</i>");
		output(" She huffs, clearly growing more impatient with you with each passing moment. Looks like you’ll need to get her on friendlier grounds in order to have her not be so antsy around you.");
		processTime(1);		
	}
	
	addDisabledButton(0, "Appearance", "Appearance", "You’re already doing this!");
}
//special convo for first talk
public function kionaFetchLuciniteTalk():void
{	
	clearOutput();
	showKiona(false, true);
	var translateKorgi:Boolean = korgiTranslate();
	
	if (flags["KIONA_TALK"] == 1)
	{
		output("Before you can ask Kiona if there was anything she wants to talk to you about, she quickly holds a paw to your face and shakes her head.");
		
		if (translateKorgi) output("\n\n<i>“No. You’re a selfish outsider like the rest. You said no to helping me, and yet you still insist on talking? Well, sorry, I’m behind on orders, so I’m still too busy for you. That is... unless you changed your mind? My request is still open, if you’re still considering... Forge knows I could use the help.”</i>");
		else output("\n\n<i>“No. Selfish alien like rest. Alien say no to helpings, and still want talkings? Sorry. Still behind. Still busy for alien. Unless change mind? Still can gettings blue sparkle rock if wants... Forge know Kiona need helpings.”</i>");
		output("\n\nThe korgonne sighs, wiping a brow in exasperation. From the sullen bags under eyes, she seems like she’s had a rough time, and could use a break from her stresses. You could lend a helping hand for the woebegone korgi-girl if you wanted. She would likely appreciate the help.");
	
		processTime(2);	
	}
	else
	{
		flags["KIONA_TALK"] = 1;
		output("You ask the korgonne shopkeeper if there was anything that she could tell you about herself, though all this earns is an eye-roll and a frown.");
		if (translateKorgi) output("\n\n<i>“Look... I’m a busy korgonne. I’m still backed up on orders as it is. I just don’t have any time for idle conversation. If that’s all you needed, then I need to go back to work.”</i>");
		else output("\n\n<i>“Look... This busy korgonne. Am still backed up in orders. No time for no-meanings chit-chats. If that all, need to work again.”</i>");
		output(" Kiona sighs and turns towards the forge, walking sluggishly towards it.");
		
		output("\n\nYou stare at her incredulously,");
		if (pc.isNice()) output(" speechless from the rude gesture. You were just trying to strike up a conversation.");
		else if (pc.isMischievous()) output(" unable to come up with any witty remark to say to her in retaliation. Well, if she’s going to turn her back on you... you’ll just help yourself to an eyeful of ass.");
		else output(" your mind racing with the hundreds of ways you want to tell her off with how rude she is being to someone who just helped her.");
		output(" Feeling the heat of your gaze, she eventually pauses mid-stride and stands there for a few seconds before turning to you again. Her expression is still deadly serious, though you can see the telltale signs of fatigue. After a brief stare-down, she finally resigns, dropping her usual cold demeanor with a tired sigh and trudges over to you again.");

		if (translateKorgi) output("\n\n<i>“L-listen. I don’t exactly trust you off-worlders at all, but... at the moment, I’m getting desperate. If you’re this persistent in getting to know me, then... can you help me out once more?”</i>");
		else output("\n\n<i>“L-listen. No trusting aliens, but... am growings desperate. If alien persistent in knowing korgonne, then... help once more?”</i>");
		output(" Kiona’s downcast eyes sneak a glance at you, which quickly look away again once she makes eye contact.");
		if (translateKorgi) output(" <i>“You don’t seem like one of the bad ones, and I’m also kinda curious about you. I want to find out if you’re as strong as you seem to be kind. I hate asking for help, but I really need it.”</i>");
		else output(" <i>“Alien not seem bad like others, but Kiona also curious about this alien. Wantings to see if strong as alien seems kind. Hate askings, but really need it.”</i>");
		output(" The korgonne pleads. You can’t help but melt when she looks at you again with those exhausted eyes of her’s.");
		
		if (pc.isNice()) output("\n\n<i>“Okay, I’ll listen at least, if it means l can get you to ease up a little.”</i>");
		else output("\n\n<i>“Alright. I’ll listen, for now.”</i>");	
		output(" You lean over the counter attentively, waiting for her request. The vendor shifts in place for a short while before continuing.");

		if (translateKorgi) output("\n\n<i>“I need one of those blue shiny rocks, kinda like the one on my necklace. They’re mainly found near the frostwyrm territory to the far east. I tried asking others to help me look, but the other korgonne hunters are too scared of getting eaten. I’m not stupid enough to go by myself either. I’m not strong enough,”</i>");
		else output("\n\n<i>“Needings blue rock sparkle like on necklace. Only find near white-wyrm land far east. Ask others before alien, but other korgonne scared to be eaten. Not stupid to go by self too. Not strong enough.”</i>");
		output(" Kiona growls out the last words. Her hands curl into fists, and a grimace forms on her muzzle.");
		
		if (translateKorgi) output(" <i>“You... might be strong enough. Maybe you might have better luck than me?”</i>");
		else output(" <i>“You... maybe strong. Maybe better luck?”</i>");
		output(" The korgonne asks, fully avoiding eye-contact with you as if expecting you to reject the offer.");
		
		if (flags["MET_FROSTWYRM"] == undefined) output("\n\nThe prospect of potentially facing down a real motherfucking dragon seems downright suicidal. On the plus side, you won’t necessarily <i>have</i> to fight it off; just hopefully not encounter it in its territory."); //never met
		else if (flags["FROSTWYRM_NOT_HOSTILE"] > 0) output("\n\nFortunately for you, you managed to mate with her, so getting her jewel shouldn’t be much of an issue for you, barring the occasional hostile encounter along the way and inclement weather. Telling Kiona about your pairing would likely lead to confusion, so withholding that information from her would be best for now. Still, it should be an easy enough task."); //mates
		else if (flags["FROSTWYRMSLAIN"] == 1) output("\n\nFrom your last encounter with the frostwyrm, you won and took it out for good. Venturing deep into the deep parts of the glacial rift will be easier with that beast out of the picture, making this a menial task... supposing there isn’t more of its kind out there."); //slain
		else if (flags["FROSTWYRM_DISABLED"] == 1) output("\n\nAfter your last encounter with the frostwyrm, it is gone for good. Venturing deep into the deep parts of the glacial rift will be easier with that beast out of the picture, making this a menial task... supposing there isn’t more of its kind out there."); //refuse
		else if ((flags["FROSTWYRM_VICTORY_COUNT"] == undefined || flags["FROSTWYRM_VICTORY_COUNT"] < 1) && flags["FROSTWYRMWARNING"] == undefined) output("\n\nIt didn’t seem interested in chasing after you during your last run-in. Just a simple find and grab errand. It should be easy enough... right?"); //always ran
		else if (flags["FROSTWYRMWARNING"] == 1) output("\n\nYour last encounter with the frostwyrm didn’t go very well, and you’re thankful that you were still able to make it out in one piece. Another fight with it could very well spell the end for you, but maybe you’ll luck out and not run into it this time."); //has lost to it
		else output("\n\nStrong enough indeed. You were able to fend the frostwyrm the last time you encountered it. With proper preparation, you could likely beat it off again should you run into it... that is if you want to go through the trouble for Kiona."); //fought but never lost to it
		
		processTime(5);
	}
		
	clearMenu();	
	addButton(0, "Yes", kionaFetchLuciniteTalkYes, undefined, "Yes", "Sure, why not?");	
	addButton(1, "No", kionaFetchLuciniteTalkNo,undefined,"No","Heeeell naw.");
}
//accept lucinite fetch quest
public function kionaFetchLuciniteTalkYes():void
{	
	clearOutput();
	showKiona(false, true);
	var translateKorgi:Boolean = korgiTranslate();
	
	flags["KIONA_LUCINITE_QUEST"] = 1;
	
	output("You agree to help, though you emphasize that you won’t make any promises, and might have to renege should things get too dangerous.");
	if (translateKorgi) output("\n\n<i>“That’s fair. If you do this for me though, I’d be extremely thankful. I’ll have the last of my backed-up orders done, and maybe more time to myself since I’ll have more supplies! Until then, I just don’t have time to talk. Gotta keep working.”</i>");
	else output("\n\n<i>“Is fair. If alien does it, Kiona will be many thanks. Will have last back-orders done, more time for talkings with more supply! Until then, can’t talk. Must work.”</i>");
	output(" The shopkeeper sweeps a few errant strands of hair from her face with a paw before regaining her normal composure.");
	if (translateKorgi) output(" <i>“Now, are you going to buy something, or was that all?”</i>");
	else output(" <i>“Now, alien buy, or is it all?”</i>");
	
	processTime(3);
	clearMenu();
	addButton(0, "Next", kionaKioskApproach, true);
}
//reject lucinite fetch quest
public function kionaFetchLuciniteTalkNo():void
{	
	clearOutput();
	showKiona(false, true);
	var translateKorgi:Boolean = korgiTranslate();
	
	output("You shake your head, not wanting to go through with her difficult request. Kiona grunts in frustration, her mouth widening into a scowl as she crosses her arms across her bosom.");
	if (translateKorgi) output(" <i>“Figures. I would have thought you’d love the challenge, but all you off-worlders are good for are picking on things weaker than yourselves. If you’re not wanting to help me, then you’re wasting my time.”</i>");
	else output(" <i>“Figures. Thinkings love challenge, but all aliens good for only pick on things weaker than them. If no wantings to help, then wastings time.”</i>");
	output(" With a huff, Kiona shuffles back over to the forge and continues where she left off with her work.");
	
	processTime(3);
	clearMenu();
	addButton(0, "Next", move,"KORGII V24");
}
//main talk menu
public function kionaTalkMenu():void
{	
	clearOutput();
	showKiona(false, true);
	var postWargii:Boolean = false;
	if (flags["WARGII_PROGRESS"] == 3) postWargii = true;
	var translateKorgi:Boolean = korgiTranslate();
	var moreTalk:Boolean = false;
	if (flags["KIONA_TALK_KIONA"] == 1 && flags["KIONA_TALK_YOU"] == 1) moreTalk = true;
	
	if (translateKorgi) output("<i>“Oh? Yeah, sure! What did you want to talk about?”</i>");
	else output("<i>“Oh? Sure! What alien want talkings about?”</i>");

	clearMenu();
	addButton(0, "Kiona", kionaTalkKiona, undefined);	
	addButton(1, "You", kionaTalkYou, undefined);
	if (moreTalk)
	{
		addButton(2, "Aliens", kionaTalkAliens, undefined);	
		addButton(3, "Jewelcraft", kionaTalkJewelcraft, undefined);	
		addButton(4, "Hunting", kionaTalkHunting, undefined);	
		if (flags["KIONA_TALK_HUNTING"] == 1) addButton(5, "Rescuer", kionaTalkRescuer, undefined);
	}	

	addButton(14, "Back", kionaKioskApproach, true);	
}
//talk about her
public function kionaTalkKiona():void
{	
	clearOutput();
	showKiona(false, true);
	var postWargii:Boolean = false;
	if (flags["WARGII_PROGRESS"] == 3) postWargii = true;
	var translateKorgi:Boolean = korgiTranslate();	
	var moreTalk:Boolean = false;
	if (flags["KIONA_TALK_KIONA"] == 1 && flags["KIONA_TALK_YOU"] == 1) moreTalk = true;
	
	if (!moreTalk) flags["KIONA_TALK_KIONA"] = 1;
	
	if (postWargii)
	{		
		if (translateKorgi)
		{
			output("<i>“O-oh, me? The Kerborus want to know about...”</i> Kiona trails off, visibly caught off guard. <i>“Eh... to tell the truth, I’m not sure what I can tell you about me that might be interesting compared to what you do.”</i>");
			output("\n\nAfter a bit of persuasion on your part, Kiona finally manages to start. <i>“Well... there’s not much to say about me really. I am a jewelcrafter here, which pretty much means I shape rocks and gems into wearable accessories and stuff... simple work really for us korgonne.”</i> Kiona pauses, shuffling her feet during the awkward silence before clearing her throat and continuing. <i>“I like to say I’m good enough at it that even the elders often look to me for some of my works.”</i> She smiles slightly. Judging from what is on display on the counter and comparing the jewelry to what you’ve seen on Ula, you don’t think she’s exactly fibbing.");
			output("\n\nRelieved that she’s opening up more, you ask if there’s anything more she can tell you outside of her jewelcrafting. Kiona shakes her head slightly. <i>“Not really... I don’t get to go out much, so my life is fairly simple. Pretty much exercise at dawn, work on jewels the rest of the day, then sleep. Occasionally I help the hunters of the hold with their trinkets, but that’s about it.”</i> She shrugs nonchalantly.");
			output("\n\n<i>“But uh... that’s enough about boring ol’ me... I’d much rather hear about our resident star-flier here!”</i> Kiona leans in slightly in expectancy.");
		}
		else
		{
			output("<i>“O-oh... Kerborus wantings know about...”</i> Kiona trails off, visibly caught off guard. <i>“Eh... tellings truth, Kiona not sure what can tell that interestings compare to Kerborus.”</i>");
			output("\n\nAfter a bit of persuasion on your part, Kiona finally manages to start. <i>“Well... not much sayings about Kiona really. Am a sparklecrafter, which mean shape rocks and sparkle rocks into body sparkles and stuff... easy workings for korgonne.”</i>");
			output(" Kiona pauses, shuffling her feet during the awkward silence before clearing her throat and continuing. <i>“Liking to say Kiona good enough that elders look to Kiona for works.”</i> She smiles slightly. Judging from what is on display on the counter and comparing the jewelry to what you’ve seen on Ula, you don’t think she’s exactly fibbing.");
			output("\n\nRelieved that she’s opening up more, you ask if there’s anything more she can tell you outside of her jewelcrafting. Kiona shakes her head slightly. <i>“Not really... No gettings out much, so life simple. Just work out in day startings, work on sparkles rest of day, then sleep. Kiona sometimes help hunters of hold with trinkets, but that it.”</i> She shrugs nonchalantly.");
			output("\n\n<i>“Uh... that enough about boring Kiona... Would rather hear about alien star travelings!”</i> Kiona leans in slightly in expectancy.");
		}
	}
	else
	{		
		output("You strike up a conversation with her once more, now that she seems less strung up from her work orders. Kiona gives you a deadpan look.");
		if (translateKorgi)
		{
			output("\n\n<i>“Really? Even after all the crap I gave you about my jewels being stolen? Even after asking you to go all that way to get me this lucinite? You just come from that dragon’s lair, and you still want to know about me after all that?”</i>");
			output(" Kiona snorts, breaking her neutral expression with a smirk.");
			output(" <i>“You’re weird. You’re definitely not like other off-worlders. I would have thought you’d kill me after the way I treated you.”</i>");
			output(" The korgonne stifles a laugh when she sees your serious expression. ");
			output("\n\n<i>“You’re funny. I’m starting to like you a little. Fine, I’ll play.”</i> She leans against the counter, nearly letting her assets spill free from their meager confines.");
			output("\n\n<i>“As you probably figured, I sell jewelry. I also craft them into wearable accessories to wear.”</i> Then there’s an uncomfortable silence. Kiona takes the moment to adjust her neck brooch and chest wrappings.");
			output("\n\n<i>“That’s... it?”</i> you ask her, disappointment clear in your voice. To that question, Kiona can barely contain herself anymore. She bursts out laughing, yipping loud enough for the entire hallway to hear.");
			output("\n\n<i>“What did you expect? The life of a korgonne is pretty simple. Boring, too.. Well... until you off-landers showed up anyways. Now life is getting harsher. You’re the first one that doesn’t seem totally selfish... Still, I don’t know if you’re here for an ulterior motive or not, so don’t blame me for being wary.”</i>");
		}
		else
		{
			output("\n\n<i>“Really? Even after givings crap about lost sparkles? Even after askings alien for hard task in gettings get blue sparkle rock from dragon lair? Alien comings back and still askings about Kiona?”</i>");
			output(" Kiona snorts, breaking her neutral expression with a smirk.");
			output(" <i>“Alien weird. Definitely not like others. Thinkings would kill Kiona after way treated alien...”</i>");
			output(" The korgonne stifles a laugh when she sees your serious expression.");
			
			output("\n\n<i>“Alien funny. Startings to like alien a little. Fine, Kiona play.”</i> She leans against the counter, nearly letting her assets spill free from their meager confines.");
			output("\n\n<i>“As alien figure, Kiona am dealings with sparkles. Craft them into pretty sparkles to wear.”</i> Then there’s an uncomfortable silence. Kiona takes the moment to adjust her neck brooch and chest wrappings.");
			output("\n\n<i>“That’s... it?”</i> you ask her, disappointment clear in your voice. To that question, Kiona can barely contain herself anymore. She bursts out laughing, yipping loud enough for the entire hallway to hear.");
			output("\n\n<i>“What alien expect? Korgonne life simple. Boring, too. Well... until aliens show. Now it more trouble... You first one not seemings selfish. Still... Not knowings if here for other reasons or no, no blame Kiona if wary.”</i>");
		}
	}		
	
	processTime(5);
	addDisabledButton(0, "Kiona", "Kiona","You just talked about this!");
	//if just unlocked, show the new buttons
	if (!moreTalk && flags["KIONA_TALK_KIONA"] == 1 && flags["KIONA_TALK_YOU"] == 1)
	{
		addButton(2, "Aliens", kionaTalkAliens, undefined);	
		addButton(3, "Jewelcraft", kionaTalkJewelcraft, undefined);	
		addButton(4, "Hunting", kionaTalkHunting, undefined);	
	}	
}
//talk about you
public function kionaTalkYou():void
{	
	clearOutput();
	showKiona(false, true);
	var firstTime:Boolean = true;
	if (flags["KIONA_TALK_YOU"] == 1) firstTime = false;
	var postWargii:Boolean = false;
	if (flags["WARGII_PROGRESS"] == 3) postWargii = true;
	var translateKorgi:Boolean = korgiTranslate();	
	var moreTalk:Boolean = false;
	if (flags["KIONA_TALK_KIONA"] == 1 && flags["KIONA_TALK_YOU"] == 1) moreTalk = true;
	
	if (!moreTalk) flags["KIONA_TALK_YOU"] = 1;	
	
	if (postWargii)
	{		
		if (translateKorgi)
		{
			output("<i>“You know... before this, I wouldn’t have given a care about what you off-worlders do, especially after what I’ve heard from other hunters, but you... you’re clearly different.”</i> Kiona smirks, giving you a once-over before continuing. <i>“I’m curious to know if you go around world to world nosing into local affairs for a living?”</i>");
			output("\n\nJudging by the disarming smile she is wearing, it’s likely that doesn’t mean what she said in any harm. You take the opportunity to tell Kiona about your quest to find your late father’s probes, and your adventures along the way. Naturally, she struggles to understand many basic concepts of space travel, stopping you frequently to ask a question. Whenever you answer her, she slowly nods her head with a small <i>“Ah, okay”</i> before letting you continue. Her eyes hyper-focus onto you, her attention never wavering the entire time that you talk.");
			output("\n\nWhen you finally finish explaining how a starship works to Kiona, she scratches her head in thought.");
			output("\n\n<i>“Yeesh... space is... big. Complicated. It’s a lot for this korgonne to wrap her head around in one sitting.”</i> Kiona laughs sheepishly <i>“To be honest, being in that many different places with that many different aliens at once is kind of overwhelming... I think I’ll just stick to just getting to know the one in front of me for now.”</i>");
			if (firstTime)
			{
				output("\n\n<i>“By the way, I never got your name. What should I call you?”</i>");
				if (pc.isNice()) output("\n\n<i>“My name is [pc.name].”</i>");
				else if (pc.isMischievous()) output("\n\n<i>“The name’s [pc.name]. [pc.name] Steele.”</i> You put on your best suave impression, which only earns a raised eyebrow in confusion from her.");
				else output("\n\n<i>“[pc.name],”</i> you say curtly.");
				output("\n\n<i>“[pc.name]. I got it. Nice meeting you, [pc.name]!”</i>");
			}
		}
		else
		{
			output("<i>“Alien know... before, Kiona would give no cares what aliens do, special after hearings from hunters, but this alien... this alien not same.”</i> Kiona smirks, giving you a once-over before continuing. <i>“Am curious if alien go around world to world buttings into home things for livings?”</i>");
			output("\n\nJudging by the disarming smile she is wearing, it’s likely that doesn’t mean what she said in any harm. You take the opportunity to tell Kiona about your quest to find your late father’s probes, and your adventures along the way. Naturally, she struggles to understand many basic concepts of space travel, stopping you frequently to ask a question. Whenever you answer her, she slowly nods her head with a small <i>“Ah, okay”</i> before letting you continue. Her eyes hyper-focus onto you, her attention never wavering the entire time that you talk.");
			output("\n\nWhen you finally finish explaining how a starship works to Kiona, she scratches her head in thought.");
			output("\n\n<i>“Yipes... space... big. Much hards. A lot for korgonne to wrap head on in one go.”</i> Kiona laughs sheepishly. <i>“In honest, being in many place with many alien is a too much... Kiona stick to gettings to know alien here for now.”</i>");
			if (firstTime)
			{
				output("\n\n<i>“By way, never gettings call-name. What alien call-name?”</i>");
				if (pc.isNice()) output("\n\n<i>“My name is [pc.name].”</i>");
				else if (pc.isMischievous()) output("\n\n<i>“The name’s [pc.name]. [pc.name] Steele.”</i> You put on your best suave impression, which only earns a raised eyebrow in confusion from her.");
				else output("\n\n<i>“[pc.name],”</i> you say curtly.");
				output("\n\n<i>“[pc.name]. Got it. Nice meetings, [pc.name]!”</i>");
			}
		}
	}
	else
	{
		output("You begrudgingly bring up your initial encounter, asking why she gave you the rough treatment despite being welcome into the hold. Kiona’s ears droop and her eyes avoid yours, looking away in embarrassment.");
		if (translateKorgi)
		{
			output("\n\n<i>“Oh... yeah. I’m sorry. Try not to take it too personally. I was just, um... I wanted you out of my shop and out of my hair. I was angry, a-and that wasn’t cool of me. Again, you don’t seem like a bad off-worlder compared to what I’ve heard from the other hunters here.”</i> Kiona shuffles in place for a few moments before turning to you.");
			output("\n\n<i>“You really did help me out a ton though... You helped me restock my shop, and even went out of your way to get me some lucinite. Hell, even the other korgs here don’t seem to be as brave as you seem to be for going out so far to get this stuff for me. Don’t tell the others I said this though.”</i> The korgonne winks slyly at you.");	
			if (firstTime)
			{
				output("\n\n<i>“By the way, I never got your name. What should I call you?”</i>");
				if (pc.isNice()) output("\n\n<i>“My name is [pc.name].”</i>");
				else if (pc.isMischievous()) output("\n\n<i>“The name’s [pc.name]. [pc.name] Steele.”</i> You put on your best suave impression, which only earns a raised eyebrow in confusion from her.");
				else output("\n\n<i>“[pc.name],”</i> you say curtly.");
				output("\n\n<i>“[pc.name]. I got it. Nice meeting you, [pc.name]!”</i>");
			}			
		}
		else
		{
			output("\n\n<i>“Oh... sorries. No take what Kiona say too personal. Only act in hope of riddings of outsider from shop. Took angry on alien, but it Kiona bad. Alien don’t seem bad like others... at least from hearings from hunters.”</i> Kiona shuffles in place for a few moments before turning to you.");
			output("\n\n<i>“Alien really help lots... Helpings restock stop, and even go out of way to get Kiona blue sparkle rock. Heck, even other korgonne not very brave like alien for getting blue sparkle rocks. No tell others Kiona say this.”</i> The korgonne winks slyly at you.");		
			if (firstTime)
			{
				output("\n\n<i>“By way, never gettings call-name. What alien call-name?”</i>");
				if (pc.isNice()) output("\n\n<i>“My name is [pc.name].”</i>");
				else if (pc.isMischievous()) output("\n\n<i>“The name’s [pc.name]. [pc.name] Steele.”</i> You put on your best suave impression, which only earns a raised eyebrow in confusion from her.");
				else output("\n\n<i>“[pc.name],”</i> you say curtly.");
				output("\n\n<i>“[pc.name]. Got it. Nice meetings, [pc.name]!”</i>");
			}
		}		
	}	
	
	processTime(15);
	addDisabledButton(1, "You", "You","You just talked about this!");
	//if just unlocked, show the new buttons
	if (!moreTalk && flags["KIONA_TALK_KIONA"] == 1 && flags["KIONA_TALK_YOU"] == 1)
	{
		addButton(2, "Aliens", kionaTalkAliens, undefined);	
		addButton(3, "Jewelcraft", kionaTalkJewelcraft, undefined);	
		addButton(4, "Hunting", kionaTalkHunting, undefined);	
	}	
}
//talk about aliens
public function kionaTalkAliens():void
{	
	clearOutput();
	showKiona(false, true);
	var postWargii:Boolean = false;
	if (flags["WARGII_PROGRESS"] == 3) postWargii = true;
	var translateKorgi:Boolean = korgiTranslate();
	var savedKiona:Boolean = false;
	if (flags["WARGII_KIONA_SAVED"] == 1) savedKiona = true;
	var talkedOthers:Boolean = false;
	if (majaTrust() || flags["TUUVA_DICK_TALK"] == 1) talkedOthers = true;
				
	output("Out of curiosity, you ask Kiona to elaborate on what she heard from her fellow korg mates about off-worlders.");
	if (translateKorgi) output("\n\n<i>“Ah... I don’t know... just, things.”</i> The korgonne stammers bringing a paw to her muzzle while looking to the side nervously. <i>“I... I mean, did you see how Tuuva and Maja turned out from their run-ins with you off-worlders and your weird things?”</i>");
	else output("\n\n<i>“Ah... Kiona not know... just, stuffs.”</i> The korgonne stammers bringing a paw to her muzzle while looking to the side nervously. <i>“Kiona mean... Did alien see how Tuuva and Maja turn from meetings aliens and weird things?”</i>");
	
	if (talkedOthers)
	{
		output("\n\nNow that she mentions it, the korgonne in question did have some unexpected ‘effects’ from running into foreign technology.");
		if (translateKorgi)	output("\n\n<i>“You see? Now you can understand why I’m kinda paranoid about your kind. I know they’re dealing with their ‘changes’ but I don’t want to risk that myself. I like my body just the way it is, and I worked hard keeping it this way! I don’t need you off-worlders screwing that up!”</i>");
		else output("\n\n<i>“Alien see? Can understandings why Kiona wary of outsiders. Kiona know they dealings with ‘new parts’ but no want to risk it. Kiona like body way it is, work hard to keep! No needings aliens messing body up.”</i>");
	}
	else
	{
		output("\n\nYou shake your head, eager to know what befell of the korgonne that she mentioned.");
		if (translateKorgi) output("\n\n<i>“Well... if you meet them, you’ll see. I won’t be the one to tell you what happened, but ever since hearing from them, I’m not too keen on having the same thing happen to me. You’ll understand why I’m so wary.”</i>");
		else output("\n\n<i>“Well... alien see if meet them. Kiona won’t be one to tell what happen, but since hearings from them, Kiona no want to have same happen to her. Alien will understand why Kiona so wary.”</i>");
	}
	
	if (postWargii && savedKiona)
	{		
		output("\n\nWith your best effort, you assert to Kiona that you aren’t like the other off-worlders, and do not condone the ones that have had an overall negative impact on the korgonne. You barely have a chance to start before being tackled by the small ball of fluff, nearly knocking you over. She looks up to you and regards you with a pleasant smile on her face.");
		if (translateKorgi)	output("\n\n<i>“I already know you’re one of the good ones, [pc.name]! After saving me during that milodan invasion, I think you’ve more than proved to me that you mean well. I trust you.”</i> Kiona nuzzles into your [pc.chest], sighing in comfort. Winning over her trust definitely has its benefits!");
		else output("\n\n<i>“Kiona know [pc.name] good alien! After savings Kiona during fang-cat raid, [pc.name] more than provings that [pc.name] mean well. Kiona trust [pc.name].”</i> Kiona nuzzles into your [pc.chest], sighing in comfort. Winning over her trust definitely has its benefits!");
	}
	else if (postWargii && !savedKiona)
	{		
		output("\n\nWith your best effort, you assert to Kiona that you aren’t like the other off-worlders, and do not condone the ones that have had an overall negative impact on the korgonne. Throughout appealing your case, you notice that Kiona’s tail wags progressively faster behind her, and her brow furrows in deep thought. She raises a paw to her snout when you finish talking.");
		if (translateKorgi)
		{
			output("\n\n<i>“I think I’m now starting to realize, you were actually the one that helped us repel that milodan attack not long ago. I wish I realized that sooner instead of being stuck in my own worries. I heard about what you did for us, and I think I can trust you.”</i>");
			output("\n\nYou stretch out your arm to shake on it, to which Kiona accepts it, wrapping her warm paw around your [pc.hand].");
			output("\n\n<i>“Thank you again for saving us.”</i>");
		}
		else
		{
			output("\n\n<i>“Thinkings Kiona realize, [pc.name] was one that help beat up fang-cats in Korg’ii Hold attack not long ago. Wishings Kiona realize sooner instead being stuck in own problems. Kiona hear what [pc.name] do for korgonne, and believe can trustings [pc.name].”</i>");
			output("\n\nYou stretch out your arm to shake on it, to which Kiona accepts it, wrapping her warm paw around your [pc.hand].");
			output("\n\n<i>“Many thankings again for saving korgonne.”</i>");
		}
	}
	else
	{
		output("\n\nWith your best effort, you assert to Kiona that you aren’t like the other off-worlders, and do not condone the ones that have had an overall negative impact on the korgonne. Throughout appealing your case, you notice that she has her tail tucked low between her legs, and she repeatedly adjusts her accessories in nervousness. ");
		if (translateKorgi) output("\n\n<i>“Sorry... You seem nice and all, but I still don’t trust you that much yet.”</i>");
		else output("\n\n<i>“Sorries... Alien seem nice, but still no trustings much yet.”</i>");
		output(" she murmurs softly. You figure it might take some time for her to trust you to that level. For now, leave the subject be.");
	}
	
	processTime(3);
	addDisabledButton(2, "Aliens", "Aliens","You just talked about this!");
}
//talk about jewelcraft
public function kionaTalkJewelcraft():void
{	
	clearOutput();
	showKiona(false, true);
	var translateKorgi:Boolean = korgiTranslate();
	
	output("You ask Kiona if there’s anything else she can tell you about her jewelcrafting profession, since she didn’t give you much to go on initially.");
	if (translateKorgi)
	{		
		output("\n\n<i>“Meh, you’re asking me a boring question... Fine, I’ll tell you.”</i> She harrumphs, crossing her arms across her chest, which inadvertently accentuates her cleavage.");
		output("\n\n<i>“I pretty much inherited this shop and this trade from my mother. She basically taught me all I know about how to cut a gem to its finest detail and how to shape and mold metals to a perfect shape. It took me a few years to make my first batch of savicite jewelry that was acceptable enough...”</i> Kiona turns around and waves her arm towards her working forge. Splayed in front of it is an array of outdated tools used to hammer, mold, grind, and shape jewels and metals.");
		output("\n\n<i>“It’s pretty hard stuff considering the equipment I have is ‘primitive’ at best, and I bet you spacers have better tools out there. Hell, I wouldn’t be surprised if you have the stuff automatically made with whatever weird contraption you people have.”</i> She turns back to you with a frown her face. <i>“That said, I’ve done well enough with what I have, but I feel like I’d make a lot better jewelry if I had better equipment to work with...”</i> Kiona laments.");
		output("\n\nYou take a moment to take stock of her inventory. She certainly has a lot of surprisingly high-quality jewelry on display, and a wide variety of them as well! On one display rack are a number of studs, rings, hoops, and other small bits and baubles that shine brilliantly in the dim lighting of the store. In another shelf further away are an assortment of large bracelets, anklets, and necklaces that would rival the quality of even the more well-known jewelcrafters in the galaxy. She’s likely doesn’t realize that she could very well be the best jewelsmith in the whole universe, especially if she gets her paws on some modern equipment.");
		output("\n\nA soft thump brings your attentions back to Kiona, who is showcasing a small box with a number of small bars of varying material.");
		output("\n\n<i>“I can even do piercings myself at this point! It took a bit of help from Nenne to be able to make a numbing agent strong enough for it to be virtually painless, but if you ever need a piece added or removed that you can’t do yourself, I’m your jeweler!”</i> Kiona bleps cutely for emphasis.");
		output("\n\nYou make a mental note to make good on that offer when you need it, though something else niggles at your brain; what was so special about the lucinite that she wanted so badly?");
		output("\n\n<i>“Oh, those? Yeah! I love those blue rocks!”</i> Kiona lights up excitedly, proudly showing off her lucinite brooch. <i>“Basically, I’ve found that they help with calming the mind somehow. It makes for a great trinket for a hunter to carry with them to block out unnecessary thoughts. Only just discovered that myself recently, but ever since I’ve shown the other hunters in the hold what it can do, I’ve been getting more and more orders to make lucinite trinkets. They’re eh... starting to get a bit more popular than I initially realized. Thanks again for replenishing my supply, [pc.name].”</i> She smiles sheepishly.");
		output("\n\nYou tell Kiona that your first experience touching the metallic ore had a profoundly different effect on you than she described for herself. Her brow furrows in confusion as you tell her about how it felt when you picked it up.");
		output("\n\n<i>“Huh. I can’t say that I can explain that one for you.”</i> She shrugs dismissively, which sets off her adorning jewelry to jingle pleasantly. <i>“My guess is, it affects korgonne differently than it does any other race. Case in point, I heard that savicite makes pretty much any other race go crazy with lust... Hell, even milodan use it as a fertility aid like some sort of baby-making idol. Makes me curious how the lucinite and savicite together would react when worn by an off-worlder like you.”</i> Kiona eyes you curiously, giving you the impression that you’re suddenly under a lab microscope.");
		output("\n\nYou wonder about what her opinion on savicite is, since the majority of korgonne you’ve seen around the hold so far prefer to wear that jewel instead.");
		output("\n\n<i>“It’s definitely a pretty green gem for sure,”</i> the jewelcrafter chirps brightly. Her tail grows animated as she talks about the green psionic gem. <i>“Us korgonne are resistant to the apparent effects they have, so it’s not any real issue wearing the stuff for us. I do like to think that it does keep the warmth of the spire close to us always, and to pierce them into our very being is to, in a way, become one with the Great Forge. That’s my take on it anyways! Besides, lucinite is much harder to get, and less abundant. It’s rarity makes it that much more valuable as a whole, and not too many of us has access to get some, let alone use it.”</i>");
	}
	else
	{
		output("\n\n<i>“Guh, alien askings boring question... Fine, Kiona tell.”</i> She harrumphs, crossing her arms across her chest, which inadvertently accentuates her cleavage.");
		output("\n\n<i>“Kiona pretty much inherit shop and craft from mother. Teach all Kiona know about gem cuttings to fine detail and shapings metal to perfect shape. Took Kiona few years to make first savicite batch that was good.”</i> Kiona turns around and waves her arm towards her working forge. Splayed in front of it is an array of outdated tools used to hammer, mold, grind, and shape jewels and metals.");
		output("\n\n<i>“It hard since equipment very old at best, and Kiona bet aliens having better stuffs. Not surprise Kiona betting aliens having sparkles auto make with some weird thingy.”</i> She turns back to you with a frown her face. <i>“That said, Kiona do well with what Kiona havings, but am feeling Kiona would make better sparkles if havings better tools to work.”</i> Kiona laments.");
		output("\n\nYou take a moment to take stock of her inventory. She certainly has a lot of surprisingly high-quality jewelry on display, and a wide variety of them as well! On one display rack are a number of studs, rings, hoops, and other small bits and baubles that shine brilliantly in the dim lighting of the store. In another shelf further away are an assortment of large bracelets, anklets, and necklaces that would rival the quality of even the more well-known jewelcrafters in the galaxy. She’s likely doesn’t realize that she could very well be the best jewelsmith in the whole universe, especially if she gets her paws on some modern equipment.");
		output("\n\nA soft thump brings your attentions back to Kiona, who is showcasing a small box with a number of small bars of varying material.");
		output("\n\n<i>“Kiona do piercings as well! Take help from Nenne in makings numbing potion for no hurtings, but if needings piercings take or give, Kiona alien’s jeweler!”</i> Kiona bleps cutely for emphasis.");
		output("\n\nYou make a mental note to make good on that offer when you need it, though something else niggles at your brain; what was so special about the lucinite that she wanted so badly?");
		output("\n\n<i>“Oh, them? Yes! Kiona love blue rock sparkles!”</i> Kiona lights up excitedly, proudly showing off her lucinite brooch. <i>“Findings that they calm mind somehow. Make for great trinket for hunter to hold for keepings out junk thoughts. Only discover myself recently, but since showings other hunters blue rock, Kiona get more and more orders to make. They eh... start gettings popular, more than Kiona thinkings. Thankings [pc.name] for givings more supply!”</i> She smiles sheepishly.");
		output("\n\nYou tell Kiona that your first experience touching the metallic ore had a profoundly different effect on you than she described for herself. Her brow furrows in confusion as you tell her about how it felt when you picked it up.");
		output("\n\n<i>“Huh. Don’t think can explain that one to [pc.name].”</i> She shrugs dismissively, which sets off her adorning jewelry to jingle pleasantly. <i>“Kiona guessing it affect korgonne different than not korgonne. As point, hearings that green sparkle make other race go crazy horny... Heck, cat-people use for breeding aid like it a pup-giving idol. Makes Kiona curious how blue rock and green sparkle work on alien like [pc.name].”</i> Kiona eyes you curiously, giving you the impression that you’re suddenly under a lab microscope.");
		output("\n\nYou wonder about what her opinion on savicite is, since the majority of korgonne you’ve seen around the hold so far prefer to wear that jewel instead.");
		output("\n\n<i>“It for sure pretty green sparkle,”</i> the jewelcrafter chirps brightly. Her tail grows animated as she talks about the green psionic gem. <i>“Havings no effects, so no issues in wearings for korgonne. Kiona like thinkings it keep warmth of spire close always, and etching into us is help to become one with Great Forge. That Kiona take on it! Beside, blue rock sparkle hard to get. Less of them too. It rarity making is worth lots, and not many korgonne can get, or use it.”</i>");
	}
	
	processTime(5);
	addDisabledButton(3, "Jewelcraft", "Jewelcraft","You just talked about this!");
}
//talk about hunting
public function kionaTalkHunting():void
{	
	clearOutput();
	showKiona(false, true);
	var translateKorgi:Boolean = korgiTranslate();
		
	output("Kiona’s mentioned her efforts to help the hunters of the hold several times throughout your talks. You ask if she has any sort of special connection to them. Kiona’s tail wags increasingly faster at the question, her jewel-laden accessories on it jingling quietly in concert.");
	if (translateKorgi)
	{
		output("\n\n<i>“Oh, yes! In fact, I’m actually a hunter myself as well!”</i> Kiona points a padded thumb towards a corner of the room where a weathered coat and yappi strap lie against the wall, among other hunting equipment. <i>“I haven’t been doing it as long as I have jewelcrafting, but I’d like to think I’m pretty competent at it!”</i>");
		output("\n\n<i>“Oh? Do you hunt anything in particular, or...?”</i> you ask out of curiosity.");
		output("\n\n<i>“Depends. I’m not among the best hunters yet, so I’m mostly stuck doing scouting or patrol, usually with a small party of other korgonne. I don’t usually see action. Kinda boring really.”</i> Kiona pouts, glancing off to the side irritably. <i>“On one hand, it’s a little bit of a relief, but on the other hand, I do want to have more fighting experience and get stronger from it.”</i>");
		output("\n\nThe korgonne pauses for an uncomfortable length of time. Her expression darkens rapidly, and her tail stops wagging. <i>“I did have a close shave once while our scout group was out salvaging though. Narrowly made it out of there with my fur intact, but that isn’t to say I’d never want to face a challenge like that again.”</i>");
		output("\n\nYou ask what happened during her ‘close shave’ while out salvaging. Kiona’s tail stops completely, her ears tucking back into her long hair. She furrows her brow while recalling the incident.");
		output("\n\n<i>“W-well... it happened about a year ago. Our four-korgonne scouting group came across a off-worlder pod of some sort, and we went over to check it out. It was supposed to be simple enough; a few moments to check around if any valuables could be taken for the hold. There was a decent amount of alien tech we could take back for the specialists to look over.”</i> Kiona frowns while twirling a lock of hair around a clawed finger.");
		output("\n\n<i>“Just about as soon as we were about to finish up and leave, a group of filthy milodan showed up, with their eyes on our prize,”</i> she growls, her fur beginning to stand on end. <i>“Let’s just say, we korgonne don’t really get along with milodan at all. It was an even number of us, so... yeah. It quickly turned into a skirmish over the salvage.”</i> Kiona shrugs.");
		output("\n\n<i>“I remember being excited for my first chance to have a real scrap. Usually, we use ambushing techniques and having the element of surprise on our side, so there’s rarely an opportunity that we just fight outright.”</i> The korg-girl wrings her paws together while grimacing. <i>“Oh man... if I knew back then that it’s not all that it’s cracked up to be... especially considering how fresh I was.”</i> She takes a brief moment before resuming her story.");
		output("\n\n<i>“The fight started out well enough. We fought in pairs to split them up; one of us to hold off the opposing pair while the other of us attacks from their blind side. We did what we could to disorient our targets one at a time so that it could maximize our chances of making it through unharmed.”</i> Kiona crosses her arms over her bosom. Her hands subconsciously tug at the ornaments on her shoulders. <i>“Of our pair, I was the one to make the flanking strikes. My partner did well enough holding the other milodans’ attention, and I even held my own fighting from range... at least if only for a little while.”</i> Her teeth grind together as she holds herself tighter.");
		output("\n\nYou gently ask Kiona what happened next. Somberly, she shakes her head.");
		output("\n\n<i>“Well... one of the milodan from the other pair our group was fighting had their back completely turned to me, so I thought I could well... knock him out with a quick whack to the head while my partner had our pair’s attention.”</i> Kiona sighs dejectedly. <i>“When I went for it, I lashed out at him with my yappi strap. The damn guy didn’t even so much as flinch when I nailed him. Before I could get my weapon wound back up, I got blindsided by one of the milodan we were originally fighting.”</i> Kiona smashes a balled fist onto the stone counter, shaking the jewelry on top of it.");
		output("\n\n<i>“I feel stupid making a dumb mistake like that in the first place, not being able to knock that milodan out, and being the first to go down out of all of us. Because of me, my partner didn’t take long to go down himself, and then it was just two of us left against the rest. I was helpless since the one milodan hit me so hard, I was on the verge of passing out”</i> The korg-girl growls under her breath. Considering she’s alive and well, you wonder how she managed to get out of the mess that she got in.");
		output("\n\n<i>“W-well... I don’t remember much beyond that point, but...”</i> Kiona places a pawed hand over her face, concentrating hard. <i>“All I recall was feeling cold, dizzy, disoriented... and honestly scared witless. I heard some loud growling and snarling that... didn’t sound like anything I recognised. I tried looking to see what it was, but I was too weak to lift my head. All I catch were glimpses of a blue-grey blur. Before I passed out, I saw a huge korgonne - definitely not from our scouting group - walk over to me... and such a big paw too. Next thing I remember, I woke up in my bed with Nenne overlooking me.”</i>");
		output("\n\n<i>“Are you okay after all that? That sounded like quite a trial to go through,”</i> you remark. Kiona smiles brightly to your surprise.");
		output("\n\n<i>“Pff, of course! I mean yeah, it was scary, but I believe what doesn’t kill you only makes you stronger! Ever since then, I’ve been training my ass off so that same thing never has to happen again. Those mangy, long-tooth hairballs had better watch out next time.”</i> Kiona pumps a triumphant fist in your direction.");
	}
	else
	{
		output("\n\n<i>“Yes! Actually, Kiona is hunter herself!”</i> Kiona points a padded thumb towards a corner of the room where a weathered coat and yappi strap lie against the wall, among other hunting equipment. <i>“Haven’t done long as gem craft, but thinkings am good at hunting!”</i>");
		output("\n\n<i>“Oh? Do you hunt anything in particular, or...?”</i> you ask out of curiosity.");
		output("\n\n<i>“Depend. Kiona not one of best hunters yet, so stuck scoutings or patrollings, usually with few korgonne. No seeings much action. Is boring, kind of.”</i> Kiona pouts, glancing off to the side irritably. <i>“One hand, is relief. On other, Kiona want fightings more; gettings stronger from it!”</i>");
		output("\n\nThe korgonne pauses for an uncomfortable length of time. Her expression darkens rapidly, and her tail stops wagging. <i>“Did have close call when out scoutings with small band. Was salvagings. Almost not make it with fur still on body, not sayings Kiona not want to face challenge again though.”</i>");
		output("\n\nYou ask what happened during her ‘close shave’ while out salvaging. Kiona’s tail stops completely, her ears tucking back into her long hair. She furrows her brow while recalling the incident.");
		output("\n\n<i>“W-well... It happen one year past. Had four korgonne scout group come to alien pod or something and see what can take. Was suppose to be simple; few moment to check and take things back to hold. Good amount of alien tech to takings back to core wizard.”</i> Kiona frowns while twirling a lock of hair around a clawed finger.");
		output("\n\n<i>“When we finishing up and leavings, group of dirty cat-people show up tryings to take our prize.”</i> she growls, her fur beginning to stand on end. <i>“Let’s say, us korgonne no gettings along with cat-people at all. Was even amount of korgonne, so... yeah. It turn to small fight over alien scraps.”</i> Kiona shrugs.");
		output("\n\n<i>“Kiona remember being excited for first chance at real fight. Usually, use ambush strategy and element of surprise on side, so rare chance korgonne fight face to face.”</i> The korg-girl wrings her paws together while grimacing. <i>“Man... if Kiona knowing back then it not all glory... even with Kiona beings fresh.”</i> She takes a brief moment before resuming her story.");
		output("\n\n<i>“Fight start well enough. Fight in pairs to split cat-people up; one korgonne to hold other pair while other attack blind side. Do what can to confuse enemy one at time so makings higher chance of make through with no hurtings.”</i> Kiona crosses her arms over her bosom. Her hands subconsciously tug at the ornaments on her shoulders. <i>“Of our two, Kiona was one makings side attack. Partner did well holdings off other cat-people attention, and Kiona hold own from far... least if for little bit.”</i> Her teeth grind together as she holds herself tighter.");
		output("\n\nYou gently ask Kiona what happened next. Somberly, she shakes her head.");
		output("\n\n<i>“Well... one of cat-men from other two korgonne group was fighting had back turn to Kiona, so thinkings Kiona could well... make him go sleepy with quick hit to head while partner had our two’s attention. Kiona sighs dejectedly. <i>“When go for it, I whip at him with yappi strap. Dang cat didn’t even move when I got him. Before gettings weapon ready again, Kiona get side-whack by one of cat-men Kiona was fightings to start. Kiona smashes a balled fist onto the stone counter, shaking the jewelry on top of it.");
		output("\n\n<i>“Kiona feel stupid make dumb mistake like that in first place, not able to sleeping milodan, and beings first to fall down of us korgonne. Because of Kiona, partner not take long to fall too, then it was two korgonne against rest. Kiona helpless since cat-man hit Kiona so hard, Kiona close to pass out.”</i> The korg-girl growls under her breath. Considering she’s alive and well, you wonder how she managed to get out of the mess that she got in.");
		output("\n\nW-well... Kiona not remember much after that, but...”</i> Kiona places a pawed hand over her face, concentrating hard. <i>“All Kiona remember was feel cold, dizzy, confuse... and honest very scared. Kiona hearing loud growls and roars that... no sounding like something Kiona hear before. Try see what was, but Kiona too weak to lift head. All catchings was blur of blue-grey. Before go sleep, Kiona see big looking korgonne - certain not from Kiona group - walk over to Kiona... such big paw too. Next thing Kiona remember, wakings up in bed with Nenne watching Kiona.”</i>");
		output("\n\n<i>“Are you okay after all that? That sounded like quite a trial to go through,”</i> you remark. Kiona smiles brightly to your surprise.");
		output("\n\n<i>“Pff, yeah! Was scary, but what doesn’t kill only make strong! Since then, Kiona train butt off so it never happen again. Those stupid, long-teeth hairballs better watch for next time.”</i> Kiona pumps a triumphant fist in your direction.");
	}
	processTime(5);
	addDisabledButton(4, "Hunting", "Hunting","You just talked about this!");
	//if this is first time, show new button
	if (flags["KIONA_TALK_HUNTING"] != 1) addButton(5, "Rescuer", kionaTalkRescuer, undefined);
	
	flags["KIONA_TALK_HUNTING"] = 1;
}
//talk about her rescuer
public function kionaTalkRescuer():void
{	
	clearOutput();
	showKiona(false, true);
	var translateKorgi:Boolean = korgiTranslate();
	var metDreghan:Boolean = kionaMetDreghan();
	
	output("You ask Kiona if she ever got to meet the korgonne that rescued her from the milodan ambush on her scouting group.");
	if (translateKorgi)
	{
		output("\n\n<i>“Mmhmm, yup.”</i> The jeweler nods, though she doesn’t sound all too happy about it. <i>“I met him alright. Every bit as hunky and strong of a korgonne anyone could ever dream of, if kinda... old. His name is Dreghan. Kinda a big ol’ softie... a little too soft.”</i> Kiona frowns and looks away, her expression darkening rapidly. <i>“Let’s just say... we didn’t exactly see eye to eye on our views of off-worlders.”</i>");
		output("\n\nIn a sudden realization, she quickly turns back to you with an apologetic look on her face and waves her hands in front of her frantically. <i>“I mean... with you, I suppose that now I can see where he’s coming from...”</i>");
		output("\n\nKiona sighs dejectedly, twiddling a loose strand of hair in a furred finger. <i>“Maybe I should go over to his den sometime and apologise. The whole argument we had was kind of stupid in hindsight, that and... I really would like to learn more from him. If he’s strong enough to fend off a pack of milodan himself, I’d really love to know his methods!”</i> A glint of excitement flashes across her face as she ponders the eventuality of meeting up with her rescuer again.");
	}
	else
	{
		output("\n\n<i>“Mmhmm, yup.”</i> The jeweler nods, though she doesn’t sound all too happy about it. <i>“Kiona meet alright. All hunky, strong korgonne most dream of, if a little... old. Call-name Dreghan. Kind of big old softie... little too soft.”</i> Kiona frowns and looks away, her expression darkening rapidly. <i>“Let say... we not seeings eye to eye on view of aliens.”</i>");
		output("\n\nIn a sudden realization, she quickly turns back to you with an apologetic look on her face and waves her hands in front of her frantically. <i>“Kiona mean... with alien, supposing now can see where Dreghan come from...”</i>");
		output("\n\nKiona sighs dejectedly, twiddling a loose strand of hair in a furred finger. <i>“Maybe go to Dreghan den and say sorry. Word-fighting was stupid thinkings back then, that and... Kiona really wantings to learn more. If Dreghan strong enough to fight pack of fang-cats by self, Kiona really wantings know methods!”</i> A glint of excitement flashes across her face as she ponders the eventuality of meeting up with her rescuer again.");
	}
	
	if (metDreghan) output("\n\nYou doubt Dreghan would have any qualms with meeting up with Kiona again if your last meeting with him was anything to go by. Maybe you can put in a good word for her if you meet up with him before she does.");
	else output("\n\nFrom the sound of things, she herself seems to have a soft spot for this hulking korgonne. Maybe you can put in a good word for Kiona if you end up meeting him beforehand.");
	
	processTime(3);
	addDisabledButton(5, "Rescuer", "Rescuer","You just talked about this!");
}
//talk about accepting credits
public function kionaTalkCredits():void
{	
	clearOutput();
	showKiona(false, true);
	var translateKorgi:Boolean = korgiTranslate();
	
	flags["KIONA_ACCEPT_CREDITS"] = 1;	
	
	output("You tell Kiona that you’ve received approval from Ula to be able to use your credits in exchange for the goods sold at her shop. She scoffs in response, rolling her eyes and muttering under her breath.");
	
	if (translateKorgi)
	{
		output("\n\n<i>“Yeah, yeah, I heard Ula talking about it only recently... Fine, I’ll do it. These ‘credits’ had better be worth something at least, or I’ll have a serious talk with the elders.”</i> Kiona huffs, visibly sore about having to make transactions with a new and unfamiliar currency.");
		output("\n\n<i>“Now, obviously I don’t have any of these ‘credits’ you off-worlders deal with to start, so if I have none to offer you for selling me a piece I want, then I’ll just credit the amount towards whatever you want to buy from my shop... at least that’s how I understand how something like this works, right?”</i> she asks, her hand scratching behind one of her crooked ears in concentration. You nod in confirmation.");
		output("\n\n<i>“Still much simpler just trading jewels in my opinion...”</i> Kiona rolls her eyes and lays her hands on her hips.");
	}
	else
	{
		output("\n\n<i>“Yeah, yeah. Hearing Ula talkings about it earlier. Fine. ‘Credits’ better be worth something, or have talkings with elders.”</i> Kiona huffs, visibly sore about having to make transactions with a new and unfamiliar currency.");
		output("\n\n<i>“Now, knowing Kiona havings no ‘credit’ aliens deal with for starts, so if Kiona have none to give to alien for selling sparkle Kiona want, then Kiona credit amount to what alien want from shop... least that how Kiona understand how this working, right?”</i> she asks, her hand scratching behind one of her crooked ears in concentration. You nod in confirmation.");
		output("\n\n<i>“Still simpler trading sparkles in Kiona opinion...”</i> Kiona rolls her eyes and lays her hands on her hips.");
	}
	
	//set them to 0 if undefined
	kionaCreditOwed();
	kionaCreditOnhand();
	processTime(3);
	clearMenu();
	addButton(0, "Next", kionaShop, undefined);
}
//shop main menu
public function kionaShop():void
{	
	clearOutput();
	showKiona(false, true);
	var translateKorgi:Boolean = korgiTranslate();
	var firstTime:Boolean = true;
	if (flags["KIONA_TALK_SHOP"] == 1) firstTime = false;
	var piercingsUnlocked:Boolean = kionaPiercingsUnlocked();
	var postWargii:Boolean = false;
	if (flags["WARGII_PROGRESS"] == 3) postWargii = true;
	
	if (firstTime && !postWargii)
	{
		output("When you ask the jewel-clad korgonne about the wares that she has available, she scoffs heatedly, giving you a disdainful look.");
		if (translateKorgi)	output("\n\n<i>“Wouldn’t <b>you</b> like to know? Thanks to you outsiders, I barely even have shit <b>to</b> sell! My last haul of jewels that I had gathered while outside of the hold was stolen, and I <b>know</b> it was one of you stupid off-worlders that took it, because no native creature around here has strange footprints like the ones I saw where I put the gems!”</i> Kiona huffs, her lips curling into a snarl.");
		else output("\n\n<i>“Wouldn’t alien like knowings? Thanks to aliens, Kiona have barely have crap <b>to</b> sell. Last stash of sparkles Kiona gather while outside hold stolen, and <b>knowings</b> it was one of stupid aliens that takings, cause no home creature here have weird feetprints like one Kiona see where I put sparkles.”</i> Kiona huffs, her lips curling into a snarl.");
		
		output("\n\nAfter thinking about it, you conclude that you definitely don’t remember coming across any random jewel piles, especially nearby the hold.");
		if (pc.isNice()) output("\n\n<i>“Er... I think there’s been a bit of a misunderstanding. I can’t speak for any other off-worlder, but personally I haven’t ever seen your jewel pile before. Even if I did find one nearby here, if I knew it was Korg’ii Hold property, I wouldn’t want to get on Ula’s bad side by stealing it.”</i>");
		else if (pc.isMischievous()) output("\n\n<i>“Look, lady. I’m pretty sure that this is a small misunderstanding. I’m not like a certain greedy off-worlder that likely took it. I can’t take what I’ve never seen before. That and if I did find your pile near here, if I knew it was Korg’ii Hold property, it’d be a crime to make the pretty princess mad... and a pretty jeweler on top of that.”</i>");
		else output("\n\n<i>“Hey. Why am I to blame for something someone else did? Some other off-worlder probably took it, not me. I never saw your gem pile at all, for sure. Even if I did and I knew it belonged to the hold, I’m not stupid enough to get myself kicked out as soon as I was let in. Come on, think about it.”</i>");
		
		output("\n\nDespite your best explanation, Kiona doesn’t look in the least bit convinced at all, crossing her arms in defiance.");
		if (translateKorgi) output("\n\n<i>“Either way, I’ve only got some sex toys in stock, but you’re shit out of luck for piercings until I have my supplies replenished... <b>somehow.</b>”</i> Kiona emphasises the last word heavily, glaring daggers at you all the while.");
		else output("\n\n<i>“Anyways, Kiona only have sexing toys for sellings, but crap out of luck with body sparkles until gettings more supply... <b>somehow.</b>”</i> Kiona emphasises the last word heavily, glaring daggers at you all the while.");
			
		output("\n\nYou don’t think that words alone aren’t going to help with Kiona’s enmity towards you. Sighing in defeat, you offer to her a deal: If you can find her missing stash or some replacement jewels that she could use to restock her wares, then she’ll stop accusing you of being a thief in return.");
		if (translateKorgi)output("\n\n<i>“Mmm... that’s a start. If I get back as much as was stolen, I should at least be able to finish a sizable chunk of my orders and have some extra savicite piercings to sell to boot. For now, all you get is what I have left.”</i>");
		else output("\n\n<i>“Mmm... that a start. If get back what was stolen, Kiona can finish good bit of orders and having extra green body sparkles too. For now, all alien get is what having left.”</i>");

		processTime(5);
		clearMenu();
		addButton(0, "Next", kionaShopSexToysSavicite, undefined);			
	}
	else
	{			
		if (piercingsUnlocked || postWargii)
		{
			if (translateKorgi) output("<i>“Yeah? Alright. I have either sex toys over there, or some body piercings here. Take your pick.”</i>");
			else output("<i>“Yeah? Okay. Having toys there or body sparkles here. Which want?”</i>");			
			
			if (flags["KIONA_ACCEPT_CREDITS"] == 1)
			{
				if (flags["KIONA_CREDIT_AMOUNT"] != undefined) output("\n\nSteele’s Store Credit: " + flags["KIONA_CREDIT_AMOUNT"]);
				if (flags["KIONA_CREDIT_ONHAND"] != undefined) output("\nKiona’s Credits On-hand: " + flags["KIONA_CREDIT_ONHAND"]);
			}
	
			processTime(1);
			clearMenu();	
			addButton(0, "Sex Toys (Sav)", kionaShopSexToysSavicite, undefined, "Sex Toys (Savicite)", "Buy sex toys trading savicite.");	
			addButton(1, "Piercings (Sav)", kionaShopPiercingsSavicite, undefined, "Piercings (Savicite)", "Buy piercings trading savicite.");	
			
			if (flags["KIONA_ACCEPT_CREDITS"] == 1)
			{
				addButton(2, "Sex Toys (Cr)", kionaShopSexToysCredits, undefined, "Sex Toys (Credits)", "Buy sex toys using credits.");
				addButton(3, "Piercings (Cr)", kionaShopPiercingsCredits, undefined, "Piercings (Credits)", "Buy piercings using credits.");
			}
			else
			{
				addDisabledButton(2, "Sex Toys (Cr)","Sex Toys (Credits)", "Kiona is not interested in taking credits at the moment.");
				addDisabledButton(3, "Piercings (Cr)","Piercings (Credits)", "Kiona is not interested in taking credits at the moment.");
			}
		}
		else
		{
			if (translateKorgi) output("<i>“Yeah? Alright. I’m still out of piercings y’know, but I still have the toys.”</i>");
			else output("<i>“Yeah? Okay. Still out of body sparkles as alien know, but still have toys.”</i>");	
			
			if (flags["KIONA_ACCEPT_CREDITS"] == 1)
			{
				if (flags["KIONA_CREDIT_AMOUNT"] != undefined) output("\n\nSteele’s Store Credit: " + flags["KIONA_CREDIT_AMOUNT"]);
				if (flags["KIONA_CREDIT_ONHAND"] != undefined) output("\nKiona’s Credits On-hand: " + flags["KIONA_CREDIT_ONHAND"]);
			}
			
			processTime(1);
			clearMenu();	
			addButton(0, "Sex Toys (Sav)", kionaShopSexToysSavicite, undefined, "Sex Toys (Savicite)", "Buy sex toys trading savicite.");
			addDisabledButton(1, "Piercings (Sav)", "Piercings (Savicite)", "Kiona is currently out of stock for these.");	
			if (flags["KIONA_ACCEPT_CREDITS"] == 1)
			{
				addButton(2, "Sex Toys (Cr)", kionaShopSexToysCredits, undefined, "Sex Toys (Credits)", "Buy sex toys using credits.");
				addDisabledButton(3, "Piercings (Cr)", "Piercings (Credits)", "Kiona is currently out of stock for these.");
			}
			else
			{
				addDisabledButton(2, "Sex Toys (Cr)", "Sex Toys (Credits)", "Kiona is not interested in taking credits at the moment.");
				addDisabledButton(3, "Piercings (Cr)", "Piercings (Credits)", "Kiona is not interested in taking credits at the moment.");
			}
		}			
	}
	flags["KIONA_TALK_SHOP"] = 1;
	if (flags["KIONA_ACCEPT_CREDITS"] == 1)
	{
		addButton(4, "Sell", kionaShopSell, undefined,"Sell","Sell items for any credits she has or store credit if she doesn’t have enough.");	
		addButton(5, "Sell Svc", kionaSellSavicite, undefined, "Sell Savicite", "Sell Savicite for store credit. You will get much more than using the sell menu for credits.");	
	}
	if (!firstTime)
	{
		if (korgiiCredits())
		{
			if (flags["KIONA_ACCEPT_CREDITS"] == 1) addDisabledButton(6, "Credits", "Credits","You already talked about this!");
			else addButton(6, "Credits", kionaTalkCredits, undefined);	
		}
		else addDisabledButton(6, "Credits", "Credits", "You’ll need to talk to Ula about this to get this shopkeeper to trade these for her shop.");
		addButton(14, "Back", kionaKioskApproach, true);
	}		
}
//donate menu
public function kionaDonate():void
{	
	clearOutput();
	showKiona(false, true);
	var postWargii:Boolean = false;
	if (flags["WARGII_PROGRESS"] == 3) postWargii = true;
	
	output("What would you like to donate to Kiona?");
	
	processTime(3);
	clearMenu();
	if (pc.hasItemByClass(Savicite, 1)) addButton(0, "Savicite", kionaDonateSavicite, undefined);
	else addDisabledButton(0, "Savicite", "Savicite","You don’t have any to donate!");
	if (flags["KIONA_LUCINITE"] > 0 || postWargii)
	{
		if (pc.hasItemByClass(Lucinite, 1)) addButton(1, "Lucinite", kionaDonateLucinite, undefined);	
		else addDisabledButton(1, "Lucinite", "Lucinite","You don’t have any to donate!");	
	}
	//removed for now until the scenes are written to be able to "craft" the jeweled outfit
	//if (postWargii)
	if (1 < 0)
	{
		if (pc.hasItemByClass(Kirkite, 1)) addButton(2, "Kirkite", kionaDonateKirkite, undefined);	
		else addDisabledButton(2, "Kirkite", "Kirkite","You don’t have any to donate!");	
		if (pc.hasItemByClass(Picardine, 1)) addButton(3, "Picardine", kionaDonatePicardine, undefined);	
		else addDisabledButton(3, "Picardine", "Picardine","You don’t have any to donate!");	
		if (pc.hasItemByClass(Satyrite, 1)) addButton(4, "Satyrite", kionaDonateSatyrite, undefined);	
		else addDisabledButton(4, "Satyrite", "Satyrite","You don’t have any to donate!");	
	}
	addButton(14, "Back", kionaKioskApproach, true);
}
//donate savicite
public function kionaDonateSavicite():void
{	
	clearOutput();
	showKiona(false, true);
	var translateKorgi:Boolean = korgiTranslate();
	var saviciteGiven:int = 0;
	if (flags["KIONA_SAVICITE"] != undefined) saviciteGiven = flags["KIONA_SAVICITE"];
	var firstTime:Boolean = true;
	if (saviciteGiven > 0) firstTime = false;	
	var questStage:int = kionaLuciniteQuestStage();
	
	pc.destroyItemByClass(Savicite);
	
	//quest phase 2+ would mean wargiihold is done so we can skip the progressive text
	if (firstTime && questStage < 2)
	{		
		output("You gingerly poke through your inventory for a moment before pulling out a raw chunk of savicite and place it on the counter in front of Kiona. Her eyebrows raise slightly, though her glowering expression otherwise remains unchanged.");
		output("\n\n<i>“Here. This probably isn’t all from what was stolen from you, but it’s something.”</i>");
		output("\n\nKiona picks up the jewel, turning it over and around. The corners of her mouth crook as she thoroughly inspects the ore. Finally, she places the jewel in a hidden compartment under her stall and nods her head slightly.");
		
		if (translateKorgi) output("\n\n<i>“Yeah... That was a fine piece you brought me. It’s enough to get some orders done.”</i> The korgonne tersely remarks. After a few moments in awkward silence, you ask her just how much was stolen from her.");
		else output("\n\n<i>“Yes... That was good sparkle you bring Kiona. Enough to get few order done.”</i> The korgonne tersely remarks. After a few moments in awkward silence, you ask her just how much was stolen from her.");
				
		if (translateKorgi) output("\n\n<i>“I believe I had a few more pieces that were about that size. Thankfully, I’m really efficient with processing these ores, so I don’t need much of it to make a decent amount of jewelry. I’d say about four more of those should make us even.”</i>");
		else output("\n\n<i>“Kiona believe havings few more sparkles about same size. Thankful Kiona very good with using sparkle rocks so not needings much to make lots of body sparkles. Sayings about four more make even.”</i>");
		
		if (pc.isAss()) output("\n\nResisting the growing urge to claim your innocence and argue with the korgonne again, you decide to simply drop the subject entirely for the time being.");
		
		processTime(3);
		clearMenu();
		addButton(0, "Next", kionaDonate);	
	}
	else
	{
		if (saviciteGiven < 4 && questStage < 2)
		{
			output("You gingerly poke through your inventory for a moment before pulling out a raw chunk of savicite and placing it on the counter in front of Kiona. Her usual scornful expression softens " + (saviciteGiven > 1 ? "even more " : "") + "this time around.");
			output("\n\nKiona picks up the jewel, turning it over and around. The corners of her mouth crook as she thoroughly inspects the ore. Finally, she places the jewel in a hidden compartment under her stall and nods her head in satisfaction.");
			if (translateKorgi) output("\n\n<i>“Hm... good. I can at least say you’re turning out more honorable than I initially figured you to be. Keep it up and I should have a good amount to fully replenish my stock.”</i>");		
			else output("\n\n<i>“Hm... good. At least Kiona can say alien turning more honorable than first look suggest. Keepings up and Kiona have enough to fill entire stock.”</i>");	
			
			processTime(3);
			clearMenu();
			addButton(0, "Next", kionaDonate);	
		}
		else if (saviciteGiven == 4 && questStage < 2)
		{
			output("You gingerly poke through your inventory for a moment before pulling out a raw chunk of savicite and placing it on the counter in front of Kiona. Her eyebrows rise in response; she actually looks quite impressed this time around.");
			output("\n\nKiona picks up the jewel, turning it over and around, her mouth crooking in delight as she thoroughly inspects the ore. Finally, she places the jewel in a hidden compartment under her stall and nods her head in satisfaction.");
			if (translateKorgi) output("\n\n<i>“Well, prove me wrong. You actually returned pretty much what was stolen from me! I should be able to finish a majority of my orders right now, with some extras to boot. You’ll have to come back tomorrow for those piercings to be done. I’m gonna close down the shop for today to get them done and those piercings made. Excuse me.”</i>");	
			else output("\n\n<i>“Well, provings Kiona wrong. Alien actually return stolen sparkles! Should finishings most of orders right now, with extra on top. Alien havings to come tomorrow for body sparkles to finish. Gonna close shop for today, gettings orders done and body sparkles made. Excuse Kiona.”</i>");	
			output("\n\nKiona turns the open/closed sign on the front shelf and trots over towards a hidden room behind a fur curtain. Just as you turn around, you faintly hear a <i>“thank you”</i> from behind. When you whip around to confirm if Kiona said this, all you see is a flick of her jewel-laden tail before it disappears behind the furry sheet.");	
			
			flags["KIONA_CLOSED_DAY"] = days;	
			processTime(3);
			clearMenu();
			addButton(0, "Next", move, "KORGII V24");
		}
		else
		{
			output("You gingerly poke through your inventory for a moment before pulling out a raw chunk of savicite and place it on the counter in front of Kiona. One of her eyebrows rises in confusion.");
			//unique for stage 2 (had to do the quest), stage 3 (auto completed) not included
			if (questStage == 2)
			{
				if (translateKorgi) output("\n\n<i>“Oh... wow, is this for me? I know I was being a pain in the ass before, but now you’re kind of making me feel even worse about it. Well, how about a small token of my own gratitude? I’ll get you a free piercing for your trouble. It’s the least I could do to make things up to you. Really, thank you so much for helping me supply up.”</i>");	
				else output("\n\n<i>“Oh... wow, this for Kiona? Knowings Kiona was pain in butt before, but now alien kind of makings Kiona feel worse. Well... how about small token of gratitude? Kiona givings free body-sparkle for trouble. It least Kiona can do to make up. Really, thankings alien very much for help supply up.”</i>");		
			}
			else
			{
				if (translateKorgi) output("\n\n<i>“Um... I mean, I already have all that I need so far but... I won’t say no to more. Just... I kinda hate feeling like I have to owe anyone anything, so I’ll just give you a free piercing to call us even. Thank you for this, really.”</i>");	
				else output("\n\n<i>“Uh... Already have all Kiona need so far, but... won’t say no to more. Hatings feel like owing anything so Kiona give free body-sparkle to call even. Thankings alien for this, really.”</i>");	
			}
			clearMenu();
			output("\n\n");
			kionaGiveRandomSavicitePiercing(kionaDonate);
					
			processTime(3);
			//addButton(14, "Back", kionaDonate);	
		}
	}
	IncrementFlag("KIONA_SAVICITE");
}
//donate lucinite
public function kionaDonateLucinite():void
{	
	clearOutput();
	showKiona(false, true);
	var translateKorgi:Boolean = korgiTranslate();
	
	output("You gingerly poke through your inventory for a moment before pulling out a raw chunk of lucinite and place it on the counter in front of Kiona. She looks positively gobsmacked when she realizes that you’re giving her another chunk of the rare teal-blue ore.");
	if (translateKorgi) output("\n\n<i>“I... You’re seriously just gonna give this to me? I’m not sure what to say honestly, but you’ve definitely just made my day with this.”</i> Kiona strokes the metallic rock along her cheek, smiling gleefully.  <i>“I... I won’t question how you managed to procure this, but you must be seriously strong to get that much of this. I can’t wait to make more accessories out of this stuff! Thank you so much! Please, take a lucinite piercing in return, I insist!”</i>");
	else output("\n\n<i>“Uh... uhm... Alien seriously givings blue sparkle rock to Kiona. Not knowings what to say in honest, but for sure makings Kiona’s day.”</i> Kiona strokes the metallic rock along her cheek, smiling gleefully. <i>“Won’t question how alien get sparkle rock, but must be super strong to get this much. Kiona can’t wait to make more sparkle rock jewels out of this. Many thankings to alien! Please takings blue sparkle body jewel in return, Kiona insist!”</i>");
	
	pc.destroyItemByClass(Lucinite);
	IncrementFlag("KIONA_LUCINITE");
	clearMenu();
	output("\n\n");
	kionaGiveRandomLucinitePiercing(kionaDonate);
	processTime(3);
	//addButton(14, "Back", kionaDonate);		
}
//donate kirkite
public function kionaDonateKirkite():void
{	
	clearOutput();
	showKiona(false, true);
	var translateKorgi:Boolean = korgiTranslate();
	
	output("You gingerly poke through your inventory for a moment before pulling out a raw chunk of kirkite and place it on the counter in front of Kiona.");
	if (translateKorgi) output("\n\n<i>“I... You’re seriously just gonna give this to me? I’m not sure what to say honestly, but you’ve definitely just made my day with this.”</i>");
	else output("\n\n<i>“Uh... uhm... Alien seriously givings sparkle rock to Kiona. Not knowings what to say in honest, but for sure makings Kiona’s day.”</i>");
	
	pc.destroyItemByClass(Kirkite);
	IncrementFlag("KIONA_KIRKITE");
	processTime(3);
	clearMenu();
	addButton(0, "Next", kionaDonate);	
}
//donate picardine
public function kionaDonatePicardine():void
{	
	clearOutput();
	showKiona(false, true);
	var translateKorgi:Boolean = korgiTranslate();
	
	output("You gingerly poke through your inventory for a moment before pulling out a raw chunk of picardine and place it on the counter in front of Kiona.");
	if (translateKorgi) output("\n\n<i>“I... You’re seriously just gonna give this to me? I’m not sure what to say honestly, but you’ve definitely just made my day with this.”</i>");
	else output("\n\n<i>“Uh... uhm... Alien seriously givings sparkle rock to Kiona. Not knowings what to say in honest, but for sure makings Kiona’s day.”</i>");
	
	pc.destroyItemByClass(Picardine);
	IncrementFlag("KIONA_PICARDINE");
	processTime(3);
	clearMenu();
	addButton(0, "Next", kionaDonate);
}
//donate satyrite
public function kionaDonateSatyrite():void
{	
	clearOutput();
	showKiona(false, true);
	var translateKorgi:Boolean = korgiTranslate();
	
	output("You gingerly poke through your inventory for a moment before pulling out a raw chunk of satyrite and place it on the counter in front of Kiona.");
	if (translateKorgi) output("\n\n<i>“I... You’re seriously just gonna give this to me? I’m not sure what to say honestly, but you’ve definitely just made my day with this.”</i>");
	else output("\n\n<i>“Uh... uhm... Alien seriously givings sparkle rock to Kiona. Not knowings what to say in honest, but for sure makings Kiona’s day.”</i>");
	
	pc.destroyItemByClass(Satyrite);
	IncrementFlag("KIONA_SATYRITE");
	processTime(3);
	clearMenu();
	addButton(0, "Next", kionaDonate);		
}
//give a piece of lucinite for the fetch quest
public function kionaGiveLucinite():void
{	
	clearOutput();
	showKiona(false, true);
	var translateKorgi:Boolean = korgiTranslate();
	
	output("You briefly rummage through your inventory, and place a chunk of lucinite on the shop counter. Kiona’s eyes light up and a gasp escapes her when she realizes what she is looking at. She snatches the ore chunk up and hurries into the back room. A few moments later, she pops back out through the fur sheets with the first smile you’ve seen from her.");
	
	if (translateKorgi)
	{
		output("\n\n<i>“Yes! Yes! This is the stuff! I actually can’t believe you managed to get your hands on this! You... must be very strong in order to get this, to brave the frostwyrm territory. And... this is for me?”</i> the korgonne asks, eyes full of hope. When you nod your head, Kiona yips in glee, holding the ore to her chest.");
		output("\n\n<i>“Thank you... thank you a lot, off-worlder! I can finally finish the rest of orders now! I should get to work on them right away, but if you come back tomorrow, I should have them done by then. Oh, and um...”</i> Kiona’s expression softens to something akin to admiration. If it weren’t for the layer of fur covering her face, you’re sure she’d be blushing! <i>“Sorry for the way I acted before. You actually don’t seem like that bad of an off-worlder.”</i> With that, Kiona turns the sign on the shelf and heads back into the same room she went into previously.");
	}
	else
	{
		output("\n\n<i>“Yes! Yes! This is stuff! Kiona can’t believe alien get hands on blue sparkle! Must be strong to get, to brave wyrm land. This... for me? the korgonne asks, eyes full of hope. When you nod your head, Kiona yips in glee, holding the ore to her chest.");
		output("\n\n<i>“Many thankings, alien! Can finally finish orders from hunters now! Kiona work on them right away! If alien comings back, come next day. Should have things done then...”</i> And... Kiona’s expression softens to something akin to admiration. If it weren’t for the layer of fur covering her face, you’re sure she’d be blushing! <i>“Sorries for way Kiona act before. Alien don’t seem so bad.”</i> With that, Kiona turns the sign on the shelf and heads back into the same room she went into previously.");
	}
	
	pc.destroyItemByClass(Lucinite);
	IncrementFlag("KIONA_LUCINITE");
	flags["KIONA_LUCINITE_QUEST"] = 2;
	flags["KIONA_CLOSED_DAY"] = days;	
	
	processTime(3);
	clearMenu();
	addButton(0, "Next", move,"KORGII V24");
}
//how much "credit" steele has in her shop to use to buy things
public function kionaCreditOwed(arg:Number = 0):Number
{
	if(flags["KIONA_CREDIT_AMOUNT"] == undefined) flags["KIONA_CREDIT_AMOUNT"] = 0;
	if(arg != 0)
	{
		flags["KIONA_CREDIT_AMOUNT"] += arg;
		if(flags["KIONA_CREDIT_AMOUNT"] < 0) flags["KIONA_CREDIT_AMOUNT"] = 0;
	}
	return flags["KIONA_CREDIT_AMOUNT"];
}
//how many actual credits does she have to buy things from steele
public function kionaCreditOnhand(arg:Number = 0):Number
{
	if(flags["KIONA_CREDIT_ONHAND"] == undefined) flags["KIONA_CREDIT_ONHAND"] = 0;
	if(arg != 0)
	{
		flags["KIONA_CREDIT_ONHAND"] += arg;
		if(flags["KIONA_CREDIT_ONHAND"] < 0) flags["KIONA_CREDIT_ONHAND"] = 0;
	}
	return flags["KIONA_CREDIT_ONHAND"];
}
//Savicite
//Sell Savicite adds to a total "credit" score that can be used to buy items
//sell savicite menu
public function kionaSellSavicite():void
{
	clearOutput();
	showKiona(false, true);
	
	output("You can get 10,000 in store credit per piece of savicite.");

	clearMenu();
	//Options to sell savicite here.
	if (pc.hasItemByClass(Savicite)) addButton(0,"Sell 1",kionaGetCreditForSavicite,1,"Sell 1","Sell Kiona one piece of Savicite.");
	else addDisabledButton(0,"Sell 1","Sell 1","You don’t have that much Savicite to sell!");
	if (pc.hasItemByClass(Savicite,2)) addButton(1,"Sell 2",kionaGetCreditForSavicite,2,"Sell 2","Sell Kiona two pieces of Savicite.");
	else addDisabledButton(1,"Sell 2","Sell 2","You don’t have that much Savicite to sell!");
	if (pc.hasItemByClass(Savicite,3)) addButton(2,"Sell 3",kionaGetCreditForSavicite,3,"Sell 3","Sell Kiona three pieces of Savicite.");
	else addDisabledButton(2,"Sell 3","Sell 3","You don’t have that much Savicite to sell!");
	if (pc.hasItemByClass(Savicite,5)) addButton(3,"Sell 5",kionaGetCreditForSavicite,5,"Sell 5","Sell Kiona five pieces of Savicite.");
	else addDisabledButton(3,"Sell 5","Sell 5","You don’t have that much Savicite to sell!");

	if (pc.hasItemByClass(Savicite)) addButton(4,"Sell All",kionaGetCreditForSavicite,-1,"Sell All","Sell Kiona all your Savicite.");
	else addDisabledButton(4,"Sell All","Sell All","You need at least some Savicite to do this!");
	addButton(14, "Back", kionaShop, undefined);
}
//actually sell the savicite
public function kionaGetCreditForSavicite(arg:Number = 1):void
{
	if(arg == -1) arg = pc.numberOfItemByClass(Savicite);
	//Savicite valued at 12k. kiona gives the same value as Tuuva, 10,000 got to stay competitive!
	clearOutput();
	showKiona(false, true);
	if(arg == 1) output("You hand over " + num2Text(arg) + " piece of Savicite.");
	else output("You hand over " + num2Text(arg) + " pieces of Savicite.");
	
	if(flags["KIONA_CREDIT_AMOUNT"] != undefined) output("\n\nSteele’s Store Credit Before: " + flags["KIONA_CREDIT_AMOUNT"]);
	
	kionaCreditOwed(10000*arg);
	output("\n\n" + arg*10000 + " is added to your store credit.");
	pc.destroyItemByClass(Savicite, arg);	
	
	if(flags["KIONA_CREDIT_AMOUNT"] != undefined) output("\n\nSteele’s Store Credit After: " + flags["KIONA_CREDIT_AMOUNT"]);
	
	clearMenu();
	addButton(0,"Next",kionaShop, undefined);
}
//are the piercings unlocked
public function kionaPiercingsUnlocked():Boolean
{
	if (flags["KIONA_SAVICITE"] >= 5) return true;
	
	return false;
}
//buy sex toys with savicite main menu
public function kionaShopSexToysSavicite():void
{	
	clearOutput();
	showKiona(false, true);	
	
	chars["KIONA"].inventory = new Array();
	chars["KIONA"].inventory.push(new SaviciteCockring());
	chars["KIONA"].inventory.push(new DildoSavicite());
	
	clearMenu();
	kionaShopSellForSaviciteBuildMenu();
		
	addButton(14,"Back",kionaShop, undefined);	
}
//buy piercings with savicite main menu
public function kionaShopPiercingsSavicite():void
{	
	clearOutput();
	showKiona(false, true);
	
	chars["KIONA"].inventory = new Array();
	chars["KIONA"].inventory.push(new SaviciteBarPiercing());
	chars["KIONA"].inventory.push(new SaviciteBarPiercings());
	chars["KIONA"].inventory.push(new SaviciteHoopPiercing());
	chars["KIONA"].inventory.push(new SaviciteHoopPiercings());
	chars["KIONA"].inventory.push(new SaviciteRingPiercing());
	chars["KIONA"].inventory.push(new SaviciteRingPiercings());
	chars["KIONA"].inventory.push(new SaviciteStudPiercing());
	chars["KIONA"].inventory.push(new SaviciteStudPiercings());
	
	if (kionaLuciniteQuestStage() >= 2)
	{
		chars["KIONA"].inventory.push(new LuciniteBarPiercing());
		chars["KIONA"].inventory.push(new LuciniteBarPiercings());
		chars["KIONA"].inventory.push(new LuciniteHoopPiercing());
		chars["KIONA"].inventory.push(new LuciniteHoopPiercings());
		chars["KIONA"].inventory.push(new LuciniteRingPiercing());
		chars["KIONA"].inventory.push(new LuciniteRingPiercings());
		chars["KIONA"].inventory.push(new LuciniteStudPiercing());
		chars["KIONA"].inventory.push(new LuciniteStudPiercings());		
	}
	
	clearMenu();
	kionaShopSellForSaviciteBuildMenu();
		
	addButton(14,"Back",kionaShop, undefined);		
}
//converts credit value to savicite trade value
public function kionaShopSellSaviciteValue(price:int=0):int
{
	var sav:int = 0;
	var val:int = 9000;
	
	if (price > 0) sav = Math.ceil(price/val);
	
	return sav;
}
//build the savicite trade menu with whatever is available in the shop
public function kionaShopSellForSaviciteBuildMenu():void
{	
	var btn:int = 0;
	var sav:int = 0;
	
	for (var i:int = 0; i < chars["KIONA"].inventory.length; i++)
	{
		//1 savicite per 10000 or fraction of
		sav = kionaShopSellSaviciteValue(chars["KIONA"].inventory[i].basePrice);
		output(chars["KIONA"].inventory[i].longName + ": " + StringUtil.upperCase(chars["KIONA"].inventory[i].description) + ".");
		output("\nTrade Value: " + sav + " savicite.");
		output("\n\n");
		if (pc.hasItemByClass(Savicite, sav)) addButton(btn, chars["KIONA"].inventory[i].shortName + "(" + sav + ")", kionaShopSellForSavicite, i, chars["KIONA"].inventory[i].longName, chars["KIONA"].inventory[i].tooltip);
		else addDisabledButton(btn, chars["KIONA"].inventory[i].shortName + "(" + sav + ")", chars["KIONA"].inventory[i].longName,"You do not have enough savicite to trade.");
		btn++;
		if (btn == 14) btn++;
	}
}
//actually do the item for savicite trade
public function kionaShopSellForSavicite(item:int=-1):void
{
	clearOutput();
	showKiona(false, true);
	var sav:int = 0;
	
	clearMenu();
	if (item >= 0 && item < chars["KIONA"].inventory.length)
	{		
		sav = kionaShopSellSaviciteValue(chars["KIONA"].inventory[item].basePrice);
		output("Received " + chars["KIONA"].inventory[item].longName + " for " + sav + " savicite.");	
		output("\n\n");
		pc.destroyItemByClass(Savicite, sav);
		itemScreen = kionaShop;
		lootScreen = kionaShop;
		itemCollect([chars["KIONA"].inventory[item]]);
	}
	
	addButton(14,"Next",kionaShop, undefined);	
}
//buy sex toys using store credit and/or credits (there are hooks in items.as to use other functions below)
public function kionaShopSexToysCredits():void
{	
	clearOutput();
	showKiona(false, true);	
	
	chars["KIONA"].inventory = new Array();
	chars["KIONA"].inventory.push(new SaviciteCockring());
	chars["KIONA"].inventory.push(new DildoSavicite());
	
	shopkeep = chars["KIONA"];
	buyItem();
	
}
//buy piercings using store credit and/or credits (there are hooks in items.as to use other functions below)
public function kionaShopPiercingsCredits():void
{	
	clearOutput();
	showKiona(false, true);
	
	if (flags["KIONA_CREDIT_AMOUNT"] != undefined) output("Steele’s Store Credit: " + flags["KIONA_CREDIT_AMOUNT"]);
	if (flags["KIONA_CREDIT_ONHAND"] != undefined) output("\nKiona’s Credits On-hand: " + flags["KIONA_CREDIT_ONHAND"]);
	output("\n\n");
	
	chars["KIONA"].inventory = new Array();
	chars["KIONA"].inventory.push(new SaviciteBarPiercing());
	chars["KIONA"].inventory.push(new SaviciteBarPiercings());
	chars["KIONA"].inventory.push(new SaviciteHoopPiercing());
	chars["KIONA"].inventory.push(new SaviciteHoopPiercings());
	chars["KIONA"].inventory.push(new SaviciteRingPiercing());
	chars["KIONA"].inventory.push(new SaviciteRingPiercings());
	chars["KIONA"].inventory.push(new SaviciteStudPiercing());
	chars["KIONA"].inventory.push(new SaviciteStudPiercings());
	
	if (kionaLuciniteQuestStage() >= 2)
	{
		chars["KIONA"].inventory.push(new LuciniteBarPiercing());
		chars["KIONA"].inventory.push(new LuciniteBarPiercings());
		chars["KIONA"].inventory.push(new LuciniteHoopPiercing());
		chars["KIONA"].inventory.push(new LuciniteHoopPiercings());
		chars["KIONA"].inventory.push(new LuciniteRingPiercing());
		chars["KIONA"].inventory.push(new LuciniteRingPiercings());
		chars["KIONA"].inventory.push(new LuciniteStudPiercing());
		chars["KIONA"].inventory.push(new LuciniteStudPiercings());		
	}
	
	shopkeep = chars["KIONA"];
	buyItem();
	
}

//sell things for store credit and/or credits (there are hooks in items.as to use other functions below)
public function kionaShopSell():void
{	
	clearOutput();
	showKiona(false, true);	
	
	shopkeep = chars["KIONA"];
	sellItem();	
}
//gives a random savicite piercing
public function kionaGiveRandomSavicitePiercing(returnMenu:Function=null):void
{	
	var rn:int;
	
	itemScreen = returnMenu;
	lootScreen = returnMenu;
	
	//10% of set
	if (rand(10) == 0)
	{
		rn = rand(4);
		if (rn==0) itemCollect([new SaviciteBarPiercings()]);
		else if (rn==1) itemCollect([new SaviciteHoopPiercings()]);
		else if (rn==2) itemCollect([new SaviciteRingPiercings()]);
		else itemCollect([new SaviciteStudPiercings()]);
	}
	else
	{		
		rn = rand(4);
		if (rn==0) itemCollect([new SaviciteBarPiercing()]);
		else if (rn==1) itemCollect([new SaviciteHoopPiercing()]);
		else if (rn==2) itemCollect([new SaviciteRingPiercing()]);
		else itemCollect([new SaviciteStudPiercing()]);
	}	
}
//gives a random lucinite piercing
public function kionaGiveRandomLucinitePiercing(returnMenu:Function=null):void
{	
	var rn:int;	
	
	itemScreen = returnMenu;
	lootScreen = returnMenu;
	
	//10% of set
	if (rand(10) == 0)
	{
		rn = rand(4);
		if (rn==0) itemCollect([new LuciniteBarPiercings()]);
		else if (rn==1) itemCollect([new LuciniteHoopPiercings()]);
		else if (rn==2) itemCollect([new LuciniteRingPiercings()]);
		else itemCollect([new LuciniteStudPiercings()]);
	}
	else
	{		
		rn = rand(4);
		if (rn==0) itemCollect([new LuciniteBarPiercing()]);
		else if (rn==1) itemCollect([new LuciniteHoopPiercing()]);
		else if (rn==2) itemCollect([new LuciniteRingPiercing()]);
		else itemCollect([new LuciniteStudPiercing()]);
	}	
}
//pick up an available jeweled outfit for a reduced price
public function kionaPickupJeweledOutfit(pricePerc:int = 0):void
{	
	clearOutput();
	showKiona(false, true);
	var disPrice:int = new JeweledOutfit().basePrice;
	if (pricePerc > 0) disPrice *= (pricePerc / 100);
	else disPrice = 0;
	
	if (pc.inventory.length < pc.inventorySlots())
	{
		if (disPrice == 0) output("Pick up the Jeweled Outfit?");
		else output("Buy the Jeweled Outfit for " + disPrice + "credits?");
		clearMenu();
		addButton(0, "Yes", kionaPickupJeweledOutfitYes, disPrice);
		addButton(1, "No", kionaKioskApproach, true);	
	}
	else
	{
		output("There is no room in your inventory for the Jeweled Outfit.  Come back later when you have room.");
		clearMenu();
		addButton(0, "Next", kionaKioskApproach, true);	
	}
}	
//get the outfit
public function kionaPickupJeweledOutfitYes(disPrice:int = 0):void
{	
	clearOutput();
	showKiona(false, true);
	flags["KIONA_JEWELED_OUTFIT"] = undefined;
	if (disPrice > 0) pc.credits -= disPrice;
	
	itemScreen = kionaKioskApproach;
	lootScreen = kionaKioskApproach;
	itemCollect([new JeweledOutfit()]);
	
	clearMenu();
	addButton(0, "Next", kionaKioskApproach, true);	
}
//this is called in items.as to handle using a combo of store credit, credits and kiona's onhand credits
public function kionaBuyUsingStoreCredit(desc:String = "item", price:int=0):void
{
	var storeCredit:int = kionaCreditOwed();
	var adjustedPrice:int;
		
	if(flags["KIONA_CREDIT_AMOUNT"] != undefined) output("Steele’s Store Credit Before: " + flags["KIONA_CREDIT_AMOUNT"]);
	if(flags["KIONA_CREDIT_ONHAND"] != undefined) output("\nKiona’s Credits On-hand Before: " + flags["KIONA_CREDIT_ONHAND"]);
	
	if (storeCredit > 0)
	{
		if (storeCredit >= price)
		{
			kionaCreditOwed( -price);
			output("\n\nYou purchase " + desc + " for " + num2Text(price) + " of store credit.");
		}
		else
		{
			kionaCreditOwed( -storeCredit);
			adjustedPrice = price - storeCredit;
			pc.credits -= adjustedPrice;
			kionaCreditOnhand(adjustedPrice);
			output("\n\nYou don’t have enough store credit to cover the full price.");
			output("\n\nYou purchase " + desc + " for " + num2Text(storeCredit) + " of store credit and " + num2Text(adjustedPrice) + " credits.");
		}
	}
	else
	{
		output("\n\nYou don’t have any store credit, so you must use your own credits.");
		output("\n\nYou purchase " + desc + " for " + num2Text(price) + " credits.");
		pc.credits -= price;
		kionaCreditOnhand(price);
	}
	
	
	if(flags["KIONA_CREDIT_AMOUNT"] != undefined) output("\n\nSteele’s Store Credit After: " + flags["KIONA_CREDIT_AMOUNT"]);
	if(flags["KIONA_CREDIT_ONHAND"] != undefined) output("\nKiona’s Credits On-hand After: " + flags["KIONA_CREDIT_ONHAND"]);
}
//this is called in items.as to handle using a combo of store credit, credits and kiona's onhand credits
public function kionaSellUsingStoreCredit(desc:String = "item", price:int=0, qty:int = 1):void
{
	var creditOnhand:int = kionaCreditOnhand();
	var adjustedPrice:int;
		
	if(flags["KIONA_CREDIT_AMOUNT"] != undefined) output("Steele’s Store Credit Before: " + flags["KIONA_CREDIT_AMOUNT"]);
	if(flags["KIONA_CREDIT_ONHAND"] != undefined) output("\nKiona’s Credits On-hand Before: " + flags["KIONA_CREDIT_ONHAND"]);
	
	if (creditOnhand >= price)
	{
		pc.credits += price;
		output("\n\nYou sell " + desc + " for " + num2Text(price) + " credits.");
		kionaCreditOnhand( -price);
	}
	else
	{
		if (creditOnhand > 0)
		{
			kionaCreditOnhand( -creditOnhand);			
			pc.credits += creditOnhand;
			adjustedPrice = price - creditOnhand;
			kionaCreditOwed(adjustedPrice);
			output("\n\nKiona doesn’t have enough credits on-hand to cover the full sale.");
			if (qty > 1) output("\n\nYou sell " + num2Text(qty) + " " + desc + " for " + num2Text(adjustedPrice) + " in store credit and " + num2Text(creditOnhand) + " credits.");
			else output("\n\nYou sell " + desc + " for " + num2Text(adjustedPrice) + " in store credit and " + num2Text(creditOnhand) + " credits.");
		}
		else
		{			
			kionaCreditOwed(price);
			output("\n\nKiona doesn’t have any credits on-hand to cover the sale so she gives you store credit.");
			if (qty > 1) output("\n\nYou sell " + num2Text(qty) + " " + desc + " for " + num2Text(price) + " in store credit.");	
			else output("\n\nYou sell " + desc + " for " + num2Text(price) + " in store credit.");			
		}
	}	
	
	if(flags["KIONA_CREDIT_AMOUNT"] != undefined) output("\n\nSteele’s Store Credit After: " + flags["KIONA_CREDIT_AMOUNT"]);
	if(flags["KIONA_CREDIT_ONHAND"] != undefined) output("\nKiona’s Credits On-hand After: " + flags["KIONA_CREDIT_ONHAND"]);
}
//text to display her shop description during wargii
public function kionaWargiiShopDesc():String
{
	var desc:String = "The counters dotting the storefront are completely empty. A forge at the back of the shop is put out, it’s interior still smoking and embers glowing dimly. There are various signs of a fierce struggle here; fur curtains lay in tatters on the ground, and forging equipment is scattered everywhere. An unfortunate milodan ransacker lays unconscious on the stone floor in the middle of the mess.";
	if (flags["WARGII_KIONA_SAVED"] != undefined) desc += "\n\nKiona is resting in a well-hidden spot right now. Best to worry about her shop after this is all over.";
	else desc += "\n\nThe shop’s owner is nowhere to be seen, however...";
	
	return desc;
}
//has steel meet Dreghan (set to always false, future character?)
public function kionaMetDreghan():Boolean
{
	return false;
}
//can steele have sex with kiona, set to false until sex content is created
public function kionaSexOK():Boolean
{
	return false;
}
//has steele has sex with kiona
public function kionaLovers():Boolean
{
	if (flags["KIONA_SEX"] == undefined) return false;
	if (flags["KIONA_SEX"] > 0) return true;
	return false;
}
//future sex menu for when sex content is created
public function kionaSex():void
{	
	clearOutput();
	showKiona(false, true);
	
	processTime(3);
	clearMenu();
	addButton(0, "Next", kionaTalkMenu, undefined);		
}