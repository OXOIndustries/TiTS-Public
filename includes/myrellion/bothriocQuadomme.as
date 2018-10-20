// Bothrioc Quadomme
// by Nonesuch
// https://docs.google.com/document/d/1Z6GmM5NFOb-PbXzbPiSPRU8DnnvKaSwuFlNrg9NuBys

/*

Plans/Ideas

* Rare caves encounter. PC has to realise they’re in a gossamer tunnel before they get completely gummed up. If they fail the dom descends, PC starts off combat incapacitated and has to fight free. If they succeed it might offer some group fun with its harem instead.

* Only uses counter, lust and energy sapping attacks. Go with the languid spider theme, also differentiate it from other encounters.

* Eggslut variants.

* Diplomacy. This is a stretch goal for now. Ara the ambassador needs you to persuade the other dominatrixes to unite with her. Reward? Possibly you can get the bothrioc to fight with the red myr if that’s what the PC is angling for. Otherwise credits? Serious eggsluts obviously can offer to do it for free.

Would prefer there was a certain chance element, e.g. the higher the intelligence of the PC the better the chance they have of persuading the dom to offer support, but it’s not a cut and dry thing. If succeeds the dom is persuaded, get money for it. If not the dom is going to want you to bend over for them first.

Win scenes:

* Standard buttfuck/ride ovipositor

* Humiliate them in front of their own harem. Hard PC only.

* Small dick in spinneret. Might be difficult to properly differentiate this from the CoC version. Could in fact sneakily crib some of that.

* Stretch goal: It’s impressed if you manage to avoid its trap, offers some group fun with its harem. Nice PC only.

*/

import classes.Characters.BothriocQuadomme;

public function showBothriocQuadomme():void
{
	showBust("BOTHRIOC_QUADOMME");
	showName("BOTHRIOC\nQUADOMME");
	author("Nonesuch");
}

// Quadomme encounter check
public function tryEncounterBothriocQuadomme():Boolean
{
	if(pc.level < 7) return false;
	
	var quadommeTrap:Boolean = false;
	switch(currentLocation)
	{
		case "2K7":
			// Fei An Strozo Special
			if(flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_DIPLOMACY && flags["BOTHRIOC_QUEST_QUADOMME_TO_SUMMIT"] >= 3 && flags["MET_FEIAN"] == undefined)
			{
				bothriocQuestFeiAnStrozoIntro();
				flags["DEEP_CAVES_STEP"] = 0;
				generateMap();
				return true;
			}
			break;
		case "2U23":
		case "2S13":
		case "2K27":
		case "2I21":
		case "2M15":
			if(bothriocQuestActive() && flags["BOTHRIOC_QUEST_QUADOMME_TO_SUMMIT"] == 3)
			{
				// 4th quadomme is Fei An Strozo.
			}
			else if(flags["QUADOMME_" + currentLocation + "_AWAY"] == undefined)
			{
				flags["QUADOMME_" + currentLocation + "_AWAY"] = 1;
				flags["QUADOMME_" + currentLocation + "_MET"] = 1;
				quadommeTrap = true;
			}
			break;
	}
	if(quadommeTrap)
	{
		encounterBothriocQuadomme();
		flags["DEEP_CAVES_STEP"] = 0;
		if(!rooms[currentLocation].hasFlag(GLOBAL.SPIDER_WEB)) rooms[currentLocation].addFlag(GLOBAL.SPIDER_WEB);
		generateMap();
		return true;
	}
	return false;
}
public function processBothriocQuadommeEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if(currentLocation != "2U23" && flags["QUADOMME_2U23_AWAY"] != undefined) flags["QUADOMME_2U23_AWAY"] = undefined;
	if(currentLocation != "2S13" && flags["QUADOMME_2S13_AWAY"] != undefined) flags["QUADOMME_2S13_AWAY"] = undefined;
	if(currentLocation != "2K27" && flags["QUADOMME_2K27_AWAY"] != undefined) flags["QUADOMME_2K27_AWAY"] = undefined;
	if(currentLocation != "2I21" && flags["QUADOMME_2I21_AWAY"] != undefined) flags["QUADOMME_2I21_AWAY"] = undefined;
	if(currentLocation != "2M15" && flags["QUADOMME_2M15_AWAY"] != undefined) flags["QUADOMME_2M15_AWAY"] = undefined;
}
public function markersBothriocQuadomme():void
{
	// Generic
	if(flags["QUADOMME_2U23_MET"] != undefined) rooms["2U23"].addFlag(GLOBAL.SPIDER_WEB);
	else rooms["2U23"].removeFlag(GLOBAL.SPIDER_WEB);
	if(flags["QUADOMME_2S13_MET"] != undefined) rooms["2S13"].addFlag(GLOBAL.SPIDER_WEB);
	else rooms["2S13"].removeFlag(GLOBAL.SPIDER_WEB);
	if(flags["QUADOMME_2K27_MET"] != undefined) rooms["2K27"].addFlag(GLOBAL.SPIDER_WEB);
	else rooms["2K27"].removeFlag(GLOBAL.SPIDER_WEB);
	if(flags["QUADOMME_2I21_MET"] != undefined) rooms["2I21"].addFlag(GLOBAL.SPIDER_WEB);
	else rooms["2I21"].removeFlag(GLOBAL.SPIDER_WEB);
	if(flags["QUADOMME_2M15_MET"] != undefined) rooms["2M15"].addFlag(GLOBAL.SPIDER_WEB);
	else rooms["2M15"].removeFlag(GLOBAL.SPIDER_WEB);
	// Fei An Strozo
	if(flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_DIPLOMACY && flags["BOTHRIOC_QUEST_QUADOMME_TO_SUMMIT"] >= 3 && flags["MET_FEIAN"] == undefined) rooms["2K7"].addFlag(GLOBAL.OBJECTIVE);
	else rooms["2K7"].removeFlag(GLOBAL.OBJECTIVE);
	if(flags["MET_FEIAN"] != undefined && flags["FEIAN_LOCATION"] != undefined)
	{
		if(flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_DIPLOMACY || flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_QUADOMME) feiAnAppear();
		else feiAnRemove();
	}
	else
	{
		rooms["2K7"].removeFlag(GLOBAL.SPIDER_WEB);
		rooms["2K7"].addFlag(GLOBAL.HAZARD);
	}
}

// Intro Texts
public function encounterBothriocQuadomme():void
{
	showBothriocQuadomme();
	showName("ENCOUNTER:\nQUADOMME");
	
	var addiction:Number = bothriocAddiction();
	var autoSubmit:Boolean = false;
	if(!CodexManager.hasUnlockedEntry("Bothrioc")) CodexManager.unlockEntry("Bothrioc");
	
	CombatAttacks.applyWeb(pc);
	
	var bMelee:Boolean = (pc.hasMeleeWeapon() && (pc.meleeWeapon.baseDamage.burning.damageValue > 0 || pc.meleeWeapon.baseDamage.corrosive.damageValue > 0));
	var bRanged:Boolean = (pc.hasRangedWeapon() && (pc.rangedWeapon.baseDamage.burning.damageValue > 0 || pc.rangedWeapon.baseDamage.corrosive.damageValue > 0));
	var success:Boolean = ( bMelee || bRanged || (pc.physique() + (rand(60) - 39) > 30) );
	
	// First
	if(flags["BOTHRIOC_QUADOMME_ENCOUNTERED"] == undefined)
	{
		output("\n\nIn the gloom and echoing spaces of Myrellion’s underground, your depth perception sometimes deserts you, making objects and surfaces seem closer or further away than they actually are. It makes you jumpy, intensely aware of how much noise you are generating, the grate and scrape of your progress funneling away into the still tunnels.");
		output("\n\nAs you gaze off into the distance, straining your eyes for any sign of movement, something brushes your face. You swat it aside irritably. It sticks to your hand. Disgusted, you look at it. Gluey gossamer is plastered across your palm, almost completely translucent but – as you find out when you impulsively try to yank it off – as strong as steel wire. You suddenly feel it clinging to you in half-a-dozen places. Your immediate reaction, to wrench your limbs away in fright, only seems to bring them into contact with more of the hanging, ghostly threads. With a sinking, blooming horror, you realize you’ve blundered into some sort of web trap. Strings, weaves and thatches of gossamer glisten across the floor and walls, emerging from a large hole in the ceiling, only noticeable to you now that you’re well and truly coated in it. From up above you hear movement, the busy sound of many feet... Desperately you fight your way backwards, attempting to claw the sticky web off you.");
		
		// Strength check success
		if(success)
		{
			output("\n\nYou wrench yourself clear of the stuff and stumble to safety just as a large shape emerges from the hole up above.");
			output("\n\n<i>“Oh dear,”</i> says the tall, lithe creature with a breathy laugh, dangling upside down from its web. <i>“You’re much too fast for me, farlander! No fun at all.”</i>");
			output("\n\nYou stare up at it, adrenaline jangling your nerves. It’s an alien sight for sure, but you cannot help but feel huge relief at the fact it’s not some sort of massive spider.");
			if(flags["MET_ARAKEI"] != undefined) output(" It’s an eight-limbed bothrioc, boot-legs clad in glistening black chitin and replete with bulging abdomen, similar in almost every respect to the ambassador you met on the surface. This one is looking at you with a considerably more predatory look in its tar-black eyes, though.");
			else if(flags["BOTHRIOC_PIDEMME_ENCOUNTERED"] != undefined) output(" It looks like a bothrioc – except this one has four chitin-clad legs tangled in its webs to match its quartet of arms. It seems bigger than the two legged ones you’ve run into too, particularly its bulging abdomen. Seeing you drinking it in, the androgyne smiles and lazily shifts its hips, displaying it to you so you can see the plump spinnerets on its underside. Its size and air of languid self-confidence all but spell out you’re dealing with some sort of alpha of the species.");
			else
			{
				output(" It is a flatchested, androgynous humanoid – at least the upper part of it is. Tangled in its web are four black, glistening, chitin-clad legs, mirrored by a quartet of arms swinging lazily below it. Its tar-black eyes, brow and hair are contrasted by the ghostly, smooth skin stretched across its torso and featureless groin. Its flat chest and long, nose-less face, defined and drawn with easy self-confidence, vaguely suggest masculinity – but then there’s the bulging, hairless insect abdomen that rests above its soft butt, replete with plump spinnerets and a slick opening at the top. That says femininity to you, of a certain deadly kind. The creature grins widely and stretches languidly, moving its limbs in eerie syncopation, allowing you to drink in every inch of its frame.");
				output("\n\n<i>“We bothrioc are a magnificent people it’s true, so I will forgive your staring,”</i> it says, running its long fingers through its shoulder-length black hair. Its smile turns teasing, sly. <i>“But that’s just the beginning of the beauty that I can reveal to you, alien.”</i>");
			}
			if(addiction < 10)
			{
				output("\n\nIt lolls elegantly downwards, propping its jaw up with one pair of hands as it gazes at you ruminatively, almost like it’s too lazy to haul itself back into its hole.");
				if(pc.RQ() >= 66 || pc.IQ() >= 66) output(" You remain on guard. You remember the sounds of its scurrying – this creature can really move when it wants to.");
				output("\n\n<i>“A virgin explorer of my territory, too fast and strong for my webs. That’s... interesting.”</i> It proffers its other hands to you, smiling softly. <i>“What a fine addition you would make to my harem. Come to me, farlander. Don’t be afraid – I’m not going to imprison you or anything silly like that. Those who devote themselves to me do it entirely of their own free will. Come to me, and I will show you why.”</i>");
			}
			else if(addiction < 50)
			{
				output("\n\nIt lolls elegantly downwards, propping its jaw up with one pair of hands as it gazes at you ruminatively, almost like it’s too lazy to haul itself back into its hole.");
				if(pc.RQ() >= 66 || pc.IQ() >= 66) output(" You remain on guard. You remember the sounds of its scurrying – this being, so sure and secure in its abilities, can really move when it wants to.");
				output(" A hot blush descends on you as you gaze at the big bothrioc – it seems so elegant and confident. You feel a wish to make it move, just so you can watch its flawless, supple limbs in action some more. Your eyes keep being drawn to its abdomen – the fact that it is so big, packed tight with eggs. That shouldn’t turn you on, should it? But it does, a pulse of heat coursing through your [pc.groin] every time you allow yourself to look at it, as if every gaze is a stroke of a warm hand across");
				if(pc.hasVagina()) output(" [pc.eachClit]");
				if(pc.isHerm()) output(" and");
				if(pc.hasCock()) output(" [pc.eachCock]");
				output(".");
				output("\n\n<i>“I can tell you have already made the acquaintance of my race, farlander,”</i> it says, making you jump and refocus on its face. Its grin is wider, knowing. <i>“A sordid little altercation with one of my two-legged brethren, no doubt. They are so rude, aren’t they? Ah, but they aren’t beholden to the talents and sophistications us quadommes have as our birthright.”</i> It opens its other pair of arms to you, a commanding expression on its long face. <i>“Come to me, farlander. You need a firm, experienced hand to lead you along the glorious path you have found down here. It is hard now, yes – but you will soon see that where it ends is true fulfillment.”</i>");
			}
			else if(addiction < 90)
			{
				output("\n\nIt lolls elegantly downwards, propping its jaw up with one pair of hands as it gazes at you ruminatively, almost like it’s too lazy to haul itself back into its hole.");
				if(pc.RQ() >= 66 || pc.IQ() >= 66) output(" You want to remain on your guard - you remember the sounds of its scurrying, how fast it can move when it wants to – but it is so difficult. You don’t want to do anything but relax and bask in the presence of this strong, dominant being.");
				output(" A hot blush descends on you as you gaze at it – like the other bothrioc you have submitted to but bigger, more elegant and confident, concentrated. Your eyes keep being drawn to its insect abdomen – the fact that it is so big, packed tight with eggs. It feels like there’s a vein linking that sight and your loins, and every time you allow yourself to look at it a pulse of heat courses urgently through it into your [pc.groin], making your [pc.lips] open and practically forcing out a groan. Your [pc.lowerBody] feels weak and it is all you can do not to " + (pc.hasKnees() ? "get on your knees" : "debase yourself") + " in front of this creature.");
				output("\n\n<i>“Goodness me, farlander,”</i> it says, making you jump and refocus on its face. Its grin is wider, knowing. <i>“You’ve obviously gotten to know my race quite well and yet this is the first time you’ve been in the presence of a true quadomme? Poor thing. A hungry, succulent babe such as yourself, feeding off only the scraps that my two-legged brethren can provide.”</i> It opens its other pair of arms to you, a commanding expression on its long, beautiful face. <i>“Time to learn under a true master. Come to me, farlander, and I will show you where you truly belong.”</i>");
				output("\n\nIt is all you can do not to immediately obey.");
			}
			else if(bothriocQuestActive())
			{
				bothriocQuestQuadommeAutoSubmitBlurb();
			}
			else
			{
				output("\n\nIt lolls elegantly downwards, propping its jaw up with one pair of hands as it gazes at you ruminatively, almost like it’s too lazy to haul itself back into its hole.");
				if(pc.RQ() >= 66 || pc.IQ() >= 66) output(" You want to remain on your guard - you remember the sounds of its scurrying, how fast it can move when it wants to – but you can’t. You don’t want to do anything but relax and bask in the presence of this strong, dominant being.");
				output(" A hot blush descends on you as you gaze at it – like the other bothrioc you have submitted to but bigger, more elegant and confident, concentrated.");
				output("\n\nYour eyes keep being drawn to its abdomen – the fact that it is so big, packed tight with eggs. It feels like there’s a vein linking that sight and your loins, and every time you allow yourself to look at it a pulse of heat courses urgently through it into your [pc.groin], forcing your [pc.lips] open with a groan of pure lust. Your [pc.lowerBody] feels like it’s turned to jelly, and inexorably you find yourself " + (pc.hasKnees() ? "sinking to your knees" : "sinking the lower half of your body down") + ", debasing yourself before this unspeakably wonderful alpha. Any floating misapprehensions you have about doing this disappear in a tidal wave of bliss once you’ve done it: This is it. This is where you belong. Soft, quietly astonished laughter reaches your ears.");
				output("\n\n<i>“Goodness me, farlander,”</i> the eight-limbed bothrioc says, elegant hand in front of mouth. Its eyes glisten at you, mischievous and knowing. <i>“You’ve obviously gotten to know my race very well indeed, and yet this is the first time you’ve been in the presence of a true quadomme? Poor thing. A wonderful, natural incubator such as yourself, feeding off only the poor scraps that my two-legged brethren can provide.”</i> It opens its other pair of arms to you, a commanding expression on its long face. <i>“Time to learn under a true master. Come to me, farlander, and I will show you where you truly belong.”</i>");
				output("\n\nEuphoria washes over you and you mumble a string of breathless “thank you”s as you stumble " + ((pc.legCount != 1 && pc.hasFeet()) ? "to your feet" : "upwards") + " and into the four arms of your new Master. Saying no doesn’t even occur to you.");
			}
			
			CombatAttacks.removeWeb(pc);
			
			clearMenu();
			if(addiction < 90)
			{
				addButton(0, "Yes", encounterBothriocQuadommeNext, "yes first", "Yes", "Submit to this strange alien dominatrix.");
				addButton(1, "No", encounterBothriocQuadommeNext, "no first", "No", "Step away.");
				if(addiction <= 50) addButton(2, "Fight It", encounterBothriocQuadommeNext, "fight", "Fight It", "Draw your weapon and show this thing who’s the boss around here.");
				
				bothriocQuestQuadommeButton(4, false);
			}
			else if(bothriocQuestActive()) addButton(0, "Next", bothriocQuestQuadommeAutoSubmitNext);
			else addButton(0, "Next", bothriocQuadommePCLoss);
		}
		// Strength Check Fail
		else
		{
			output("\n\nIt’s hopeless, though. The more you struggle the more you get tangled and gummed up. Within moments you’re practically hanging off the ground in it, well and truly stuck. How could you have walked so far into this stuff without realizing? You stare up hopelessly at the large creature emerging directly above you.");
			output("\n\n<i>“Oh my,”</i> murmurs the tall, lithe creature with a breathy laugh, dangling upside down from its web. It plays with the strings in its four hands, making your own limbs move like a puppet. <i>“I’ve caught a true prize this time, haven’t I? Let me take a good look at you, farlander.”</i> It descends almost in a glide, moving into the dim light.");
			output("\n\nThe thing that has caught you is an alien sight for sure, but you cannot help but feel huge relief at the fact it’s not some sort of massive spider.");
			if(flags["MET_ARAKEI"] != undefined) output(" It’s an eight-limbed bothrioc, boot-legs clad in glistening black chitin and replete with bulging abdomen, similar in almost every respect to the ambassador you met on the surface. This one is looking at you with a considerably more predatory look in its tar-black eyes, though.");
			else if(flags["BOTHRIOC_PIDEMME_ENCOUNTERED"] != undefined) output(" It looks like a bothrioc – except this one has four chitin-clad legs tangled in its webs to match its quartet of arms. It seems bigger than the two legged ones you’ve run into too, particularly its bulging abdomen. Seeing you drinking it in, the androgyne smiles and lazily shifts its hips, displaying it to you so you can see the plump spinnerets on its underside. Its size and air of languid self-confidence all but spell out you’re dealing with some sort of alpha of the species.");
			else
			{
				output(" It is a flatchested, androgynous humanoid – at least the upper part of it is. Tangled in its web are four black, glistening, chitin-clad legs, mirrored by a quartet of arms swinging lazily below it. Its tar-black eyes, brow and hair are contrasted by the ghostly, smooth skin stretched across its torso and featureless groin. Its flat chest and long, nose-less face, defined and drawn with easy self-confidence, vaguely suggest masculinity – but then there’s the bulging, hairless insect abdomen that rests above its soft butt, replete with plump spinnerets and a slick opening at the top. That says femininity to you, of a certain deadly kind. The creature grins widely and stretches languidly, moving its limbs in eerie syncopation, allowing you to drink in every inch of its frame.");
				output("\n\n<i>“We bothrioc are a magnificent people it’s true, so I will forgive your staring,”</i> it says, running its long fingers through its shoulder-length black hair. Its smile turns teasing, sly. <i>“But that’s just the beginning of the beauty that I am going to reveal to you, alien.”</i>");
			}
			if(addiction <= 30)
			{
				output("\n\nIt lolls elegantly downwards, propping its jaw up with one pair of hands as it gazes at you hungrily.");
				output("\n\n<i>“I’m sorry for trapping you like this,”</i> it breathes. <i>“But being a top bothrioc means dealing with... certain urges. I get packed so full of eggs that my harem, as willing as they are, cannot cope with them all. So I have to cast my nets out for any juicy farlander ass that might be inadvisably wandering through my territory.”</i> It is descending now, its gleaming legs working in syncopation to lower its tall, supple body towards you. <i>“Don’t struggle, plaything. I am going to make it so good for you, and it will be all the better if you don’t make a silly fuss beforehand.”</i>");
			}
			else if(addiction < 90)
			{
				output("\n\nIt lolls elegantly downwards, propping its jaw up with one pair of hands as it gazes at you with predatory interest. A hot blush descends on you as you return its stare – like the other bothrioc you have submitted to but bigger, more elegant and confident, concentrated. Your eyes keep being drawn to its insect abdomen – the fact that it is so big, packed tight with eggs. It feels like there’s a vein linking that sight and your loins, and every time you allow yourself to look at it a pulse of heat courses urgently through it into your [pc.groin], making your [pc.lips] open and practically forcing out a groan. Your [pc.lowerBody] feels weak and it is all you can do not to let go entirely, support your weight in the bothrioc’s bonds.");
				output("\n\n<i>“Goodness me, farlander,”</i> it says, making you jump and refocus on its face. Its grin is wider, knowing. <i>“You’ve obviously gotten to know my race quite well and yet this is the first time you’ve been in the presence of a true dominatrix? Poor thing. A hungry, succulent babe such as yourself, feeding off only the scraps that my two-legged brethren can provide.”</i> It opens its other pair of arms to you, a commanding expression on its long, beautiful face. <i>“Time to learn under a true master. Just relax, and let me take care of everything.”</i>");
				output("\n\nIt is all you can do not to immediately obey.");
			}
			else if(bothriocQuestActive())
			{
				bothriocQuestQuadommeAutoSubmitBlurb();
			}
			else
			{
				output("\n\nIt lolls elegantly downwards, propping its jaw up with one pair of hands as it gazes at you with predatory interest. A hot blush descends on you as you gaze at it – like the other bothrioc you have submitted to but bigger, more elegant and confident, concentrated. Your eyes keep being drawn to its abdomen – the fact that it is so big, packed tight with eggs. It feels like there’s a vein linking that sight and your loins, and every time you allow yourself to look at it a pulse of heat courses urgently through it into your [pc.groin], forcing your [pc.lips] open with a groan of pure lust. Your [pc.lowerBody] feels like it’s turned to jelly, and inexorably you find yourself relaxing in its bonds, opening yourself up entirely to this unspeakably wonderful alpha. Any floating misapprehensions you have about doing this disappear in a tidal wave of bliss once you’ve done it: This is it. This is where you belong. Soft, quietly astonished laughter reaches your ears.");
				output("\n\n<i>“Goodness me, farlander,”</i> the octopedal bothrioc says, elegant hand in front of mouth. Its eyes glisten at you, mischievous and knowing. <i>“You’ve obviously gotten to know my race very well indeed, and yet this is the first time you’ve been in the presence of a true dominatrix? Poor thing. A wonderful, natural bitch such as yourself, feeding off only the poor scraps that my two-legged brethren can provide.”</i> It opens its other pair of arms to you, a commanding expression on its long face. <i>“Time to learn under a true master. Do exactly what I say – and maybe I’ll give you what you need.”</i>");
				output("\n\nEuphoria washes over you and you mumble a string of breathless “thank you”s as your new Master descends upon you. Struggling doesn’t even occur to you.");
			}
			
			clearMenu();
			if(addiction < 90)
			{
				addButton(0, "Struggle", encounterBothriocQuadommeNext, "struggle first", "Struggle", "");
				addButton(1, "Don’t", encounterBothriocQuadommeNext, "don't first", "Don’t", "");
				
				bothriocQuestQuadommeButton(4, true);
			}
			else if(bothriocQuestActive()) addButton(0, "Next", bothriocQuestQuadommeAutoSubmitNext);
			else addButton(0, "Next", bothriocQuadommePCLoss);
		}
	}
	// Repeat
	else
	{
		output("\n\nIn the gloom and echoing spaces of Myrellion’s underground your depth perception seems to sometimes desert you, causing you to think objects and surfaces are closer or further away than they actually are. It makes you jumpy, intensely aware of how much noise you are generating, the grate and scrape of your progress funneling away into the still tunnels.");
		output("\n\nAs you gaze off into the distance, straining your eyes for any sign of movement, something brushes your face. You swat it aside irritably. It sticks to your hand. Disgusted, you look at it. Gluey gossamer is plastered across your palm, almost completely translucent but – as you find out when you impulsively try to yank it off –as strong as steel wire.");
		if(addiction < 50) output(" Chilly understanding descends on you as you feel the stuff clinging to you in half a dozen places. Strings, weaves and thatches of gossamer glisten across the floor and walls, emerging from a large hole in the ceiling, only discernible to you now that you’re well and truly coated in it. You’ve blundered into a bothrioc’s trap! Desperately you attempt to yank yourself clear as from above you comes the busy skitter and clack of multiple feet...");
		else output(" Hot and cold rushes through you as you feel the stuff clinging to you in half a dozen places. Strings, weaves and thatches of gossamer glisten across the floor and walls, emerging from a large hole in the ceiling, only discernible to you now that you’re well and truly coated in it. You’ve blundered into a bothrioc’s trap! Above you comes the busy skitter and clack of multiple feet. A large part of you shivers with glee at the sound, but you clamp down on that and concentrate on yanking yourself clear, understanding perhaps that if the dominatrix arrives before you are free, you may not be able to make conscious decisions about what happens next.");
		
		// Bad End
		if(flags["BOTHRIOC_QUADOMME_SUMBIT"] >= 2)
		{
			if(bothriocQuestActive())
			{
				bothriocQuestQuadommeAutoSubmit();
			}
			else
			{
				output("\n\nHot, blissful understanding blossoms within you as you feel the stuff clinging to you in half a dozen places. Strings, weaves and thatches of gossamer glisten across the floor and walls, emerging from a large hole in the ceiling, only discernible to you now that you’re well and truly coated in it. You’ve blundered into a bothrioc’s trap! You wait tremulously for the wonderful, elegant being to emerge from the space above.");
				output("\n\nThe tall, flat-chested androgyne lolls elegantly downwards, propping its jaw up with one pair of hands as it gazes at you with laidback interest. A blush descends on you, prickling your [pc.skin] as you run your eyes over the big, elegant and confident alpha that has you transfixed: Concentrated power. Your eyes keep being drawn to its abdomen – the fact that it is so big, packed tight with eggs. It feels like there’s a vein linking that sight and your loins, and every time you allow yourself to look at it a pulse of heat courses urgently through it into your [pc.groin], forcing your [pc.lips] open with a groan of pure lust. Your [pc.legs] feel like they’ve turned to jelly, and inexorably you find yourself relaxing in its bonds, opening yourself up entirely to this unspeakably wonderful alpha. Any floating misapprehensions you have about doing this disappear in a tidal wave of bliss once you’ve done it: This is it. This is where you belong.");
				output("\n\n<i>“Very pleasing,”</i> the quadomme whispers. Its beam furrows into a frown. <i>“In another way, though - rather upsetting.”</i>");
				output("\n\nDiscordant dismay rings in your head. What could you have possibly done to displease the egg-giver? You’d do anything to set it right.");
				output("\n\n<i>“It makes my soul ache, to think of a soft, loving creature such as yourself, wandering around this war-torn land on your own,”</i> it continues, shaking its head. <i>“It’s really only a matter of time before something dreadful happens to you, whilst you’re fumbling around in the dark for something you cannot quite find. No - there’s only one solution, little one. Your search ends here.”</i>");
				output("\n\nMomentary bafflement gives way to surging, astonished hope as the quadomme glides downwards, close enough for it to lay its hands on you.");
				output("\n\n<i>“Because you will obey my every word, won’t you?”</i> Slim fingers touch your crown, sliding " + (pc.hasHair() ? "through" : "over") + " your [pc.hair] and around to your [pc.ear].");
				output("\n\n<i>“Yes, egg-giver,”</i> you groan, closing your eyes and bending your head into those stroking, scratching digits.");
				output("\n\n<i>“You will be my toy, my servant, mother to my children, and you will love every second of it, won’t you?”</i> Another finger slides slowly down your spine, touching the crack of your [pc.ass].");
				output("\n\n<i>“Yes, egg-giver!”</i> you say again. The words are formed automatically. To resist the quadomme’s desires, to expresses anything else, would go utterly against what you have become.");
				output("\n\n<i>“Good.”</i> It withdraws slightly, leaving you craving its touch... particularly on your [pc.groin], which throb with unrequited lust. <i>“Throw away your garments and your weapons. They belong to an old you. A harder, violent, close-minded you. You will no longer need them.”</i>");
				output("\n\nYou do hesitate for a second... you heft your [pc.weapon] and recall your ship, your old friends, your mission... but it is as if you are looking at them from the wrong end of a telescope, and what you see twinges you only slightly. It no longer satisfies you, that old life, and when you consider what you stand to gain, sugar fills your veins");
				if(pc.hasVagina()) output(", [pc.femcum] drips from your [pc.vaginas]");
				if(pc.hasCock()) output(", heat hardens your [pc.cocks]");
				output(", and peaceful joy radiates through your mind. There is no choice here at all. You strip off your [pc.gear], fling your weapons into the dark. Naked there under the tar-black gaze of the quadomme, it is as if you have been reborn.");
				output("\n\n<i>“Wonderful,”</i> the long, spidery creature sussurates, clasping its hands, and you beam back, ecstatic that you’ve pleased your new owner. <i>“Now - let’s take you upstairs and introduce you to your many new sisters.”</i>");
				output("\n\nIt spends some time hovering over you, hogtying you in sticky silk to its heavy abdomen, and then it heaves you upwards, carrying its prey up into the pitch black night of its home.");
				
				processTime(5 + rand(2));
				
				clearMenu();
				addButton(0, "Next", bothriocQuadommeBadEnd);
			}
			
			autoSubmit = true;
		}
		// Auto-Submit
		// Will happen if 100 Obedience
		// If 80-99 50% chance of happening upon getting webbed
		else if(addiction >= 100 || (addiction >= 80 && rand(2) == 0))
		{
			if(bothriocQuestActive())
			{
				bothriocQuestQuadommeAutoSubmit();
			}
			else
			{
				output("\n\nHot, blissful understanding blossoms within you as you feel the stuff clinging to you in half a dozen places. Strings, weaves and thatches of gossamer glisten across the floor and walls, emerging from a large hole in the ceiling, only discernible to you now that you’re well and truly coated in it. You’ve blundered into a bothrioc’s trap! You wait tremulously for the wonderful, elegant being to emerge from the space above.");
				output("\n\nThe tall, flat-chested androgyne lolls elegantly downwards, propping its jaw up with one pair of hands as it gazes at you with laidback interest. A blush descends on you, prickling your [pc.skin] as you run your eyes over the big, elegant and confident alpha that has you transfixed: Concentrated power. Your eyes keep being drawn to its abdomen – the fact that it is so big, packed tight with eggs. It feels like there’s a vein linking that sight and your loins, and every time you allow yourself to look at it a pulse of heat courses urgently through it into your [pc.groin], forcing your [pc.lips] open with a groan of pure lust. Your " + (pc.legCount == 1 ? "[pc.leg] feels like it’s" : "[pc.legs] feel like they’ve") + " turned to jelly, and inexorably you find yourself relaxing in its bonds, opening yourself up entirely to this unspeakably wonderful alpha. Any floating misapprehensions you have about doing this disappear in a tidal wave of bliss once you’ve done it: This is it. This is where you belong.");
				output("\n\n<i>“What a pleasing sight,”</i> the eight-limbed bothrioc says, grin widening. Just this voicing of approval causes joy to glow in your breast. <i>“You have come some distance, haven’t you farlander? Yes, I can tell. And after all that hard learning you’ve achieved true understanding of your natural place in the order of things: An obedient breeder bitch, face down, ass raised. I’m very proud of you.”</i> Its tone turns commanding. <i>“Do exactly what I say, to the letter – and I will give you what you need.”</i>");
				output("\n\nEuphoria washes over you and you mumble a string of breathless “thank you”s as your new Master descends upon you. Struggling doesn’t even occur to you.");
				
				clearMenu();
				addButton(0, "Next", bothriocQuadommePCLoss);
			}
			
			autoSubmit = true;
		}
		// Strength check success
		else if(success)
		{
			output("\n\nYou wrench yourself clear of the stuff and stumble to safety just as a large shape emerges from the darkness up above.");
			output("\n\n<i>“Oh dear,”</i> says the eight-limbed bothrioc with a breathy laugh, dangling upside down from its web. <i>“You’re much too fast for me, farlander! No fun at all.”</i>");
			if(addiction < 10)
			{
				output("\n\nThe tall, lithe androgyne lolls elegantly downwards, propping its jaw up with one pair of hands as it gazes at you ruminatively, almost like it’s too lazy to haul itself back into its hole.");
				if(pc.RQ() >= 66 || pc.IQ() >= 66) output(" You remain on guard. You remember the sounds of its scurrying – this creature can really move when it wants to.");
				output("\n\n<i>“What a strong and vigorous specimen you are,”</i> it decides eventually. It spreads its arms and smiles softly at you. <i>“I’m a big fan of it. Come to me, farlander. Don’t be afraid – I’m not going to imprison you or anything silly like that. Those who devote themselves to me do it entirely of their own free will. Come to me, and I will show you why.”</i>");
			}
			else if(addiction < 50)
			{
				output("\n\nIt lolls elegantly downwards, propping its jaw up with one pair of hands as it gazes at you ruminatively, almost like it’s too lazy to haul itself back into its hole.");
				if(pc.RQ() >= 66 || pc.IQ() >= 66) output(" You remain on guard. You remember the sounds of its scurrying – this being, so sure and secure in its abilities, can really move when it wants to.");
				output(" A hot blush descends on you as you gaze at the big bothrioc – it seems so elegant and confident. You feel a wish to make it move, just so you can watch its flawless, supple limbs in action some more. Your eyes keep being drawn to its abdomen – the fact that it is so big, packed tight with eggs. That shouldn’t turn you on, should it? But it does, a pulse of heat coursing through your [pc.groin] every time you allow yourself to look at it, as if every gaze is a stroke of a warm hand across");
				if(pc.hasVagina()) output(" [pc.eachClit]");
				if(pc.isHerm()) output(" and");
				if(pc.hasCock()) output(" [pc.eachCock]");
				output(".");
				output("\n\n<i>“See something you like?”</i> it says, making you jump and refocus on its face. Its grin is wider, knowing. <i>“You are tantalized as much as you are confused by all these new feelings, aren’t you? Poor thing. But worrying isn’t for one such as you. All you should be concentrating on right now is obedience. From that will stem bliss.”</i> It opens its other pair of arms to you, a commanding expression on its long face. <i>“Come to me, farlander. You need a firm, experienced hand to lead you along the glorious path you have found down here. It is hard now, yes – but you will soon see that where it ends is true fulfillment.”</i>");
			}
			else
			{
				output("\n\nIt lolls elegantly downwards, propping its jaw up with one pair of hands as it gazes at you ruminatively, almost like it’s too lazy to haul itself back into its hole.");
				if(pc.RQ() >= 66 || pc.IQ() >= 66) output(" You want to remain on your guard - you remember the sounds of its scurrying, how fast it can move when it wants to – but it is so difficult. You don’t want to do anything but relax and bask in the presence of this strong, dominant being.");
				output(" A hot blush descends on you as you gaze at it – like the other bothrioc you have submitted to but bigger, more elegant and confident, concentrated. Your eyes keep being drawn to its insect abdomen – the fact that it is so big, packed tight with eggs. It feels like there’s a vein linking that sight and your loins, and every time you allow yourself to look at it a pulse of heat courses urgently through it into your [pc.groin], making your [pc.lips] open and practically forcing out a groan. Your [pc.lowerBody] feels weak and it is all you can do not to " + (pc.hasKnees() ? "get on your knees" : "debase yourself") + " in front of this creature.");
				output("\n\n<i>“So then, farlander,”</i> it says, making you jump and refocus on its face. Its grin is wider, knowing. <i>“You are coming to understand your place in the grand scheme of things. It feels so good, being an obedient, egg-stuffed little slut doesn’t it? And yet still you struggle and rip yourself from my bonds. Like a child who doesn’t want to do his homework, despite the knowledge it imparts.”</i> It opens its other pair of arms to you, a commanding expression on its long, beautiful face. <i>“Your Master demands you set such silliness to one side. Come to me, farlander, and I will show you where you truly belong.”</i>");
				output("\n\nIt is all you can do not to immediately obey.");
			}
			
			CombatAttacks.removeWeb(pc);
			
			clearMenu();
			addButton(0, "Yes", encounterBothriocQuadommeNext, "yes", "Yes", "Submit to this strange alien dominatrix.");
			addButton(1, "No", encounterBothriocQuadommeNext, "no", "No", "Step away.");
			if(addiction <= 50) addButton(2, "Fight It", encounterBothriocQuadommeNext, "fight", "Fight It", "Draw your weapon and show this thing who’s the boss around here.");
			
			bothriocQuestQuadommeButton(4, false);
		}
		// Strength Check Fail
		else
		{
			output("\n\nIt’s hopeless, though. The more you struggle the more you get tangled and gummed up. Within moments you’re practically hanging off the ground in it, well and truly stuck. How could you have walked so far into this stuff without realizing? You stare up hopelessly at the large creature emerging directly above you.");
			if(addiction <= 30)
			{
				output("\n\n<i>“Oh my,”</i> the tall, flat chested, eight-limbed androgyne laughs breathily when it emerges into the light. <i>“I’ve caught a real prize this time, haven’t I?”</i> It plays with the gluey strings in its gleaming black hands, twitching your limbs like a puppet. <i>“I’m sorry for trapping you like this,”</i> it goes on. <i>“But being a top bothrioc means dealing with... certain urges. I get packed so full of eggs that my harem, as willing as they are, cannot cope with them all. So I have to cast my nets out for any juicy farlander ass that might be inadvisably wandering through my territory.”</i> It is descending now, its gleaming legs working in syncopation to lower its tall, supple body towards you. <i>“Don’t struggle, plaything. I am going to make it so good for you... so good that eventually, you’ll come to me of your own free will. And it will be all the better if you don’t make a silly fuss beforehand.”</i>");
			}
			else
			{
				output("\n\n<i>“Oh my,”</i> the tall, flat chested, eight-limbed androgyne laughs breathily when it emerges into the light. <i>“I’ve caught a real prize this time, haven’t I?”</i> A hot blush descends on you as you return the gaze of the big, elegant and confident alpha that has you transfixed: Concentrated power. Your eyes keep being drawn to its insect abdomen – the fact that it is so big, packed tight with eggs. It feels like there’s a vein linking that sight and your loins, and every time you allow yourself to look at it a pulse of heat courses urgently through it into your [pc.groin], making your [pc.lips] open and practically forcing out a groan. Your [pc.legs] feels weak and it is all you can do not to let go entirely, support your weight in the bothrioc’s bonds.");
				output("\n\n<i>“A real prize, indeed,”</i> says the quadomme, grin widening. <i>“You’ve got <i>“obedient slut”</i> practically written all over you, farlander. So let’s not pretend you didn’t fall into my webs on purpose, hmm?”</i> It opens its four arms to you, a commanding expression on its long, beautiful face. <i>“I need to lay some eggs, you need to be stuffed full of eggs. Relax. Obey.”</i>");
			}
			
			clearMenu();
			addButton(0, "Struggle", encounterBothriocQuadommeNext, "struggle", "Struggle", "");
			addButton(1, "Don’t", encounterBothriocQuadommeNext, "don't", "Don’t", "");
			
			bothriocQuestQuadommeButton(4, true);
		}
	}
	processTime(7 + rand(3));
	IncrementFlag("BOTHRIOC_QUADOMME_ENCOUNTERED");
	if(autoSubmit) IncrementFlag("BOTHRIOC_QUADOMME_SUMBIT");
	else if(flags["BOTHRIOC_QUADOMME_SUMBIT"] != undefined) flags["BOTHRIOC_QUADOMME_SUMBIT"] = 0;
}

public function encounterBothriocQuadommeNext(response:String = ""):void
{
	clearOutput();
	showBothriocQuadomme();
	showName("ENCOUNTER:\nQUADOMME");
	
	var addiction:Number = bothriocAddiction();
	
	switch(response)
	{
		case "yes first":
			if(addiction < 50)
			{
				output("There’s no denying the allure of this strange, fascinating creature. And it’s hardly forcing itself upon you; where could be the harm in a bit of slap and tickle? You shrug agreeably and step forward willingly into the bothrioc’s webs.");
				output("\n\n<i>“Good [pc.boyGirl],”</i> the dominatrix says softly, descending from its webs towards you.");
			}
			else
			{
				output("There is no choice to be made here, really. Your new submissive, breeding instincts cry out for you to place yourself in this creature’s power, and once you step forward back into the bothrioc’s reach all anxieties slip away from you and you feel nothing but an eagerness to please.");
				output("\n\n<i>“Good [pc.boyGirl],”</i> the dominatrix says softly, descending from its webs towards you.");
			}
			// {go to player submits}
			clearMenu();
			addButton(0, "Next", bothriocQuadommePCLoss);
			break;
		case "no first":
			if(!pc.isMischievous())
			{
				output("<i>“Tempting, but no thanks,”</i> you reply dryly.");
				if(addiction < 50) output(" You say the words with some difficulty, your instincts resenting what you are doing, but you manage to keep your voice level.");
				else output(" It takes a huge effort to refuse the dominant – your whole being seems to cry out against it, and you can hear your voice shake – but you manage it.");
			}
			else
			{
				output("<i>“As tempting as getting my butt pumped full of spider eggs is, I’m going to say no,”</i> you reply, smiling mirthlessly back.");
				if(addiction < 50) output(" You say the words with some difficulty, but you manage to keep your voice level.");
				else output(" It takes a huge effort to refuse the dominant – your whole being seems to cry out against it, and you can hear your voice shake – but you manage it.");
				output("\n\nThe bothrioc raises an elegant, chitinous eyebrow at you.");
			}
			if(addiction <= 20) output("\n\n<i>“As you wish,”</i> it says. <i>“Peace and true contentment aren’t for everyone, after all. You scurry along then, energetic little morsel. When you grow tired of the endless strife of the surface world, I will always be here.”</i> With a wriggle of its four hips, it disappears back into its hole.");
			else output("\n\n<i>“Hmm,”</i> it says. <i>“It pains me a bit to see a submissive denying themselves, making themselves unhappy in some mistaken pursuit of dignity. On the other hand – it’s quite delicious too. Denying yourself, frustrating yourself, without me having to raise a hand.”</i> It laughs, waving you away. <i>“You toddle along then farlander, flagellate yourself good – every crack of your own proverbial whip pleases me. When you need release, your instincts will tell you where to go. Who knows, I might even give it to you without making you beg...too much.”</i> With a wriggle of its four hips, it disappears back into its hole.");
			output("\n\nAfter you’ve made sure it really has gone, you carefully work your way around the gossamer trap and continue on your way.");
			output("\n\n");
			
			bothriocQuadommeToMainMenu();
			break;
		case "yes":
			if(addiction < 50)
			{
				output("There’s no denying the allure of this strange, fascinating creature. And it’s hardly forcing itself upon you; where could be the harm in a bit of slap and tickle? You shrug agreeably and step forward willingly into the bothrioc’s webs.");
				output("\n\n<i>“Good [pc.boyGirl],”</i> the dominatrix says softly, descending from its webs towards you.");
			}
			else
			{
				output("There is no choice to be made here, really. Your new submissive, breeding instincts cry out for you to place yourself in this creature’s power, and once you step back into the bothrioc’s reach all anxieties slip away from you and you feel nothing but an eagerness to please.");
				output("\n\n<i>“Good bitch,”</i> the quadomme says softly, descending from its webs towards you.");
			}
			// {go to player submits}
			clearMenu();
			addButton(0, "Next", bothriocQuadommePCLoss);
			break;
		case "no":
			if(!pc.isMischievous())
			{
				output("<i>“Tempting, but no thanks,”</i> you reply");
				output(" dryly");
				output(".");
				if(addiction < 50) output(" You say the words with some difficulty, your instincts resenting what you are doing, but you manage to keep your voice level.");
				else output(" It takes a huge effort to refuse the dominant – your whole being seems to cry out against it, and you can hear your voice shake – but you manage it.");
			}
			else
			{
				output("<i>“As tempting as getting my butt pumped full of spider eggs is, I’m going to say no thanks,”</i> you reply, smiling mirthlessly back.");
				if(addiction < 50) output(" You say the words with some difficulty, but you manage to keep your voice level.");
				else output(" It takes a huge effort to refuse the dominant – your whole being seems to cry out against it, and you can hear your voice shake – but you manage it.");
				output("\n\nThe bothrioc raises an elegant, chitinous eyebrow at you.");
			}
			if(addiction <= 20) output("\n\n<i>“As you wish,”</i> it says. <i>“Peace and true contentment aren’t for everyone, after all. You scurry along then, energetic little morsel. When you grow tired of the endless strife of the surface world, I will be waiting.”</i> With a wriggle of its four hips, it disappears back into its hole.");
			else output("\n\n<i>“Hmm,”</i> it says. <i>“It pains me a bit to see a submissive denying themselves, making themselves unhappy in some mistaken pursuit of dignity. On the other hand – it’s quite delicious too. Denying yourself, frustrating yourself, without me having to raise a hand.”</i> It laughs, waving you away. <i>“You toddle along then farlander, flagellate yourself good – every crack of your own proverbial whip pleases me. When you need release, your instincts will tell you where to go. Who knows, I might even give it to you without making you beg... too much.”</i> With a wriggle of its four hips, it disappears back into its hole.");
			output("\n\nAfter you’ve made sure it really has gone, you carefully work your way around the gossamer trap and continue on your way.");
			output("\n\n");
			
			bothriocQuadommeToMainMenu();
			break;
		case "fight":
			output("With a glower, you draw your weapon and advance on the strange, arachnid-like alien purposefully.");
			output("\n\n<i>“How very crude of you,”</i> observes the bothrioc with studied weariness.");
			// {go to fight}
			fightBothriocQuadomme();
			break;
		case "struggle first":
			output("You stare at it in wordless defiance, before beginning to try and pull yourself clear of your translucent bonds.");
			output("\n\n<i>“Oh dear,”</i> the dominatrix sighs. <i>“And I was hoping the sophisticated farlander was going to display more intelligence than your average nyrean.”</i>");
			// {go to fight}
			fightBothriocQuadomme(true);
			break;
		case "don't first":
			output("It’s right; at this point it’s hopeless. You lower your eyes and mumble acquiescence, along with a half-hearted plea to be gentle.");
			output("\n\n<i>“Of course!”</i> a long, smooth finger strokes your chin. <i>“You have to be gentle with your toys, otherwise how will you get to play with them later?”</i>");
			// {go to player submits}
			clearMenu();
			addButton(0, "Next", bothriocQuadommePCLoss);
			break;
		case "struggle":
			output("You stare at it in wordless defiance, before beginning to wrench yourself clear of your translucent bonds.");
			output("\n\n<i>“Oh dear,”</i> the quadomme sighs. <i>“And I was hoping the sophisticated farlander was going to display more intelligence than your average nyrean.”</i>");
			// {go to fight}
			fightBothriocQuadomme(true);
			break;
		case "don't":
			output("It’s right; at this point it’s hopeless. You lower your eyes and mumble acquiescence and a half-hearted plea to be gentle.");
			output("\n\n<i>“Of course!”</i> a long, smooth finger strokes your chin. <i>“You have to be gentle with your toys, otherwise how will you get to play with them later?”</i>");
			// {go to player submits}
			clearMenu();
			addButton(0, "Next", bothriocQuadommePCLoss);
			break;
	}
	
	processTime(2);
}

public function bothriocQuadommeToMainMenu(victory:Boolean = true):void
{
	if(inCombat())
	{
		if(victory) CombatManager.genericVictory();
		else CombatManager.genericLoss();
	}
	else
	{
		setEnemy(null);
		
		clearMenu();
		addButton(0, "Next", bothriocQuadommeToMainMenuNext);
	}
}
public function bothriocQuadommeToMainMenuNext():void
{
	CombatAttacks.removeWeb(pc);
	pc.removeStatusEffect("Fail Quadomme Diplomacy");
	mainGameMenu();
}

// Voluntary Quadomme Maid Training
public function bothriocQuadommeMaidTraining():void
{
	bothriocQuadommePCLoss(true);
}

/*

Combat Texts

Notes
 
* If the PC failed the strength test they start combat constricted.

* The Dominatrix’s webs act as a field modifier; as long as the webs are active there is a 25% chance at the end of every round that the PC becomes constricted. The PC can spend a turn hacking it back so it is no longer active. In turn the Dominatrix can spend a turn reinstating it.

* Aimed at this being a high end encounter for Myrellion. It is very much aimed at being one that the PC needs to shake their booty to win.

*/

public function fightBothriocQuadomme(isStuck:Boolean = false):void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new BothriocQuadomme());
	CombatManager.displayLocation("QUADOMME");
	CombatManager.victoryCondition(CombatManager.ENTIRE_PARTY_DEFEATED);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
	CombatManager.victoryScene(bothriocQuadommePCVictory);
	CombatManager.lossScene(bothriocQuadommePCLoss);
	CombatManager.encounterTextGenerator(function():String {
		var msg:String = "The weirdly beautiful (handsome?) androgyne hangs from a hole in the rock ceiling that is slathered in its translucent webs, incredibly sticky and strong gossamer that hangs ephemerally in the air all around you. If it were standing on the ground it would be about seven feet tall; it is a tall, lithe being that moves its four legs and four arms with an assured, eerie grace. Its limbs are encased in gleaming black chitin that is very reminiscent of latex, an association deepened by the way its legs end in toeless, boot-like feet. The severe tar-black of its limbs, shoulder-length hair and pupil-less eyes contrasts with the ghostly pale skin that stretches across its flat chest, supple bum and featureless groin, an uncompromising chiaroscuro that in the dim light seems flawless, untouchable. The only part of it that does not seem mercilessly well-calculated is the bulging insect abdomen situated above its behind. At least two feet in length, that chitin-encased oval, with its plump spinnerets and wet opening at its tip, speak of a bestial, arachnid lust lurking beneath the sheer, austere veneer of this creature.";
		
		return msg;
	});
	
	if (isStuck)
	{
		CombatAttacks.applyGrapple(pc);
	}
	
	clearMenu();
	addButton(0, "Fight!", CombatManager.beginCombat);
}

// Counter
// Activates if PC attacks with a melee weapon. Moderately high reflex roll
// Shield-piercing kinetic damage
public function quadommeCounter(attacker:Creature, target:Creature):Boolean
{
	var countered:Boolean = (target.hasStatusEffect("Melee Counter"));
	
	if(!countered) output("The bothrioc watches you with deceptive complacency as you jump forward to whack it ");
	else output("Again, you jump forward to whack the dominatrix");
	output(" with your " + attacker.meleeWeapon.longName + " – and then it rears backwards, moving with the swing of your weapon as it thrusts two open-palmed hands at you.");
	
	if(attacker.reflexes() > target.reflexes() && attacker.reflexes() + (rand(60) - 39) > 50)
	{
		output(" With cat-like reflexes you are able to dart beyond its attempted block and drive your strike home. The bothrioc grunts with pain and surprise.");
		output("\n");
		target.createStatusEffect("Melee Hit");
		return false;
	}
	
	output(" You miss the target and your own momentum delivers a heavy, chitin-coated sock to the side of your head. You stagger backwards, dazed and tasting iron.");
	applyDamage(new TypeCollection( { kinetic: 16 }, DamageFlag.BYPASS_SHIELD ), target, attacker, "minimal");
	if(rand(2) == 0 && !attacker.hasStatusEffect("Staggered") && !target.isPlanted())
	{
		CombatAttacks.applyStagger(attacker);
		output("\n<b>You have been staggered!</b>");
	}
	if(!countered)
	{
		output("\n\n<i>“Rude,”</i> says the bothrioc primly.");
		target.createStatusEffect("Melee Counter", 0, 0, 0, 0, false, "Icon_DefUp", "Able to counter melee attacks.", true, 0);
	}
	// v1: turn counter
	// v2: switch for interrupt blurbs, reset on AI turn
	target.setStatusValue("Melee Counter", 1, 0);
	target.setStatusValue("Melee Counter", 2, 1);
	
	return true;
}

// Double Team
// Activates if PC scores a hit with ranged weapon OR uses gas grenade. Increases evasion against ranged weapon and grenades by 50% UNTIL PC does not use either for two turns.
public function quadommeDoubleTeam(attacker:Creature, target:Creature, usedWeapon:Boolean = true):void
{
	output("\n\nThe dominatrix snarls with something more than pain when your " + (usedWeapon ? "shot hits home" : "gas envelopes it") + ".");
	output("\n\n<i>“So you are just like the myr cowards, then?”</i> it snaps. <i>“Choosing to shoot and poison your foe from as far away as possible instead of engaging in honorable combat? Very well. I know how to deal with craven drones such as you.”</i> It tenses all eight of its limbs up and sets hate-filled eyes on your " + (usedWeapon ? attacker.rangedWeapon.longName : "grenade launcher") + ".");
	
	// v1: turn counter
	// v2: switch for interrupt blurbs, reset on AI turn
	target.createStatusEffect("Ranged Evade", 0, 0, 0, 0, false, "Icon_DefUp", "Able to evade ranged attacks.", true, 0);
	target.setStatusValue("Ranged Evade", 2, 1);
}

// Loss Scenes
public function bothriocQuadommePCLoss(isTribute:Boolean = false):void
{
	clearOutput();
	showBothriocQuadomme();
	
	// text for when PC is ‘paying tribute’ during AraQuest in red.
	var addiction:Number = bothriocAddiction();
	
	if(inCombat())
	{
		showName("DEFEAT:\nQUADOMME");
		if(pc.HP() <= 0) output("Each time you stumble, more of the incorrigible bothrioc silk plasters itself onto your form, and the less able you are to tear yourself away from it. Your arms caught in it, you waver, half-heartedly attempt to ward it off... and the next moment the quadomme is upon you, like a great, rapacious shadow.");
		else output("You waver, too horny and disorientated to continue, and as you stumble backwards you feel the incorrigible bothrioc silk plaster itself against your back. At this point it feels like a lover’s caress, and the way it sticks to you, prevents you from moving, makes your lust-saturated mind flare with slutty possibilities. When the quadomme descends upon you like a great, rapacious shadow, you don’t resist.");
		output("\n\n");
	}
	else
	{
		var domme:BothriocQuadomme = new BothriocQuadomme();
		setEnemy(domme);
	}
	
	output("<i>“Now then, sweet treat,”</i> the sexual predator breathes in your ear, <i>“let me have a feel of what exactly it is that’s wandered into my webs, hmm?”</i> Its tone is leisurely and teasing, white to the black of the movements of its many limbs and digits, which are strong, assured and exact. Two of its boot-feet clinch you around the waist whilst the other pair draw your " + (pc.legCount == 1 ? "[pc.leg] into the air, where it" : "[pc.legs] into the air, where they") + " encounter the warm, sticky buds of its spinnerets. Within moments your");
	if(pc.isNaga()) output(" tail is");
	else if(pc.isGoo()) output(" goo is");
	else if(pc.hasLegs()) output(" legs are");
	else output(" lower body is");
	output(" bound and woven in gluey silk as strong as steel wire.");
	output("\n\nYour heart leaps in your chest as the creature cradles your upper body and winches you off the ground, drawing you further towards its burrow, from which all of its silk emanates. You feel more of the drifting substance land on your [pc.skinFurScales] and you hear it being shifted and woven in the quadomme’s hands, spun intuitively out of the air so that it can be applied to you however the bothrioc wishes. A bracelet of the stuff is first applied to one wrist, then the other; more is looped around your elbows and then your waist.");
	if(pc.hairLength >= 10) output(" It even catches your [pc.hair] and wraps a loop around the end, so it is drawn upwards in a long, [pc.hairColor] stream.");
	output(" Only when the spidery androgyne has you dangling by your limbs from the cave ceiling, naked and utterly helpless, does it relax its movements a bit, lay its long, gleaming black fingers on your body, and begin to slowly explore you.");
	output("\n\n");
	
	processTime(5);
	
	var butt:Boolean = (!pc.isPregnant(-1));
	var vList:Array = [];
	var vIdx:int = -1;
	var vIdx2:int = -1;
	var cIdx:int = -1;
	var cIdx2:int = -1;
	
	if(pc.hasVagina())
	{
		if(pc.vaginas.length >= 1 && !pc.isPregnant(0)) vList.push(0);
		if(pc.vaginas.length >= 2 && !pc.isPregnant(1)) vList.push(1);
		if(pc.vaginas.length >= 3 && !pc.isPregnant(2)) vList.push(2);
	}
	if(vList.length > 0) vIdx = vList[0];
	if(vList.length > 1) vIdx2 = vList[(1 + rand(vList.length))];
	if(pc.hasCock())
	{
		cIdx = 0;
		if(pc.cocks.length > 1) cIdx2 = (1 + rand(pc.cocks.length));
	}
	
	clearMenu();
	if(vIdx >= 0 || butt)
	{
		// PC has an unfilled orifice, addiction <51
		if(addiction < 50) addButton(0, "Next", bothriocQuadommePCNeedFillLow, [0, addiction, isTribute, butt, vIdx, vIdx2, cIdx, cIdx2]);
		// PC has an unfilled orifice, addiction >50
		else addButton(0, "Next", bothriocQuadommePCNeedFillHigh, [0, addiction, isTribute, butt, vIdx, vIdx2, cIdx, cIdx2]);
	}
	// All orifices filled
	// If PC is ‘paying tribute’ during AraQuest, auto-select Maid Training. Text for that in red
	else
	{
		addButton(0, "Next", bothriocQuadommePCAllFull, [0, addiction, isTribute, butt, vIdx, vIdx2, cIdx, cIdx2]);
	}
}
public function bothriocQuadommePCNeedFillLow(arg:Array):void
{
	clearOutput();
	showBothriocQuadomme();
	
	var page:int = arg[0];
	var addiction:Number = arg[1];
	var isTribute:Boolean = arg[2];
	var butt:Boolean = arg[3];
	var vIdx:int = arg[4];
	var vIdx2:int = arg[5];
	var cIdx:int = arg[6];
	var cIdx2:int = arg[7];
	var tailCunt:Boolean = false;
	
	switch(page)
	{
		case 0:
			if(cIdx >= 0)
			{
				output("<i>“Oh my,”</i> the quadomme sussurates, its hand encircling your [pc.cock " + cIdx + "]. You tense up in your bonds as it slides its hand up and down your shaft, swiftly becoming erect from that smooth warmth encasing it. <i>“A precious drone, out here all on his own? What type of creature is so careless to allow that? Why, just about anything might pounce upon him, make him their own, never let him go...”</i>");
				if(vIdx >= 0) output(" It clicks its tongue in urbane surprise as another hand goes exploring between your [pc.thighs], long digits finding your [pc.vagina " + vIdx + "], tracing its lips. <i>“Or am I being too hasty, labeling you a drone, farlander? Why, it seems you are equipped to be both drone AND worker. Not queen, of course...”</i> It laughs softly to itself. <i>“That responsibility falls to others.”</i>");
			}
			else if(vIdx >= 0)
			{
				output("<i>“Ah yes, it is as I thought,”</i> the quadomme hums, its hand finding its way between your [pc.thighs]. You tense up in your bonds as it traces the lips of your [pc.vagina " + vIdx + "] slowly, dipping a warm, smooth finger inside to teasingly stroke at your sensitive hole. <i>“A lone worker, out on her own in the Deepest Deep. Frustrated perhaps that nobody in the swarm pays attention to her? Looking for someone to see her potential, without ever realizing it.");
				if(vIdx2 >= 0) output(" <i>“It laughs in soft, delighted surprise as another hands finds your [pc.vagina " + vIdx2 + "], and gets to work slowly fingering that one as well. You huff and spasm as the twin pleasure of it assaults your senses. <i>“And what potential! Don’t worry, my multi-holed new incubator: I shall give you the attention you so clearly deserve.”</i>");
			}
			else
			{
				output("<i>“Curious...”</i> the quadomme sussurates. You tense up in your bonds as it slides its hand up and down your groin. <i>“No sex? How... disappointing.”</i>");
				output("\n\nYour lack of genitals seems to dissuade it from wanting to continue exploring you further.");
				output("\n\nIt laughs softly to itself. <i>“A rare catch, I would say, but maybe I should let this grub go for now.”</i> With that, it unties you from its trap and lets you free, then quickly disappears into the darkness of the tunnels. Perhaps you should return when you have the sexual equipment to entertain it?");
				output("\n\n");
				
				processTime(4);
				
				pc.lust(15);
				
				bothriocQuadommeToMainMenu(false);
				return;
			}
			output("\n\nAs it masturbates you, stoking heat in your groin with masterful curls and swirls of its fingers, the quadomme cups your [pc.chest] with its other pair of hands, inquisitive fingers " + (pc.hasBreasts() ? "sinking deep into the softness there" : "tracing the lines of your flat chest") + ".");
			if(pc.biggestTitSize() >= 4)
			{
				output("\n\n<i>“Mmm,”</i> it sighs with pleasure as it massages your ample boobs, cresting on your [pc.nipples] and");
				if(!pc.hasFuckableNipples()) output(" rubbing them back and forth between finger and thumb");
				else output(" slipping deep into their sensitive insides");
				if(pc.isLactating()) output(" until they are moist and beading [pc.milk] readily onto the sheer blackness of its latex-like chitin");
				output(". <i>“I do so love having these big feeders on my incubators. Bothrioc don’t grow them, you know - not even the most submissive react in the way other creatures do to our oil. Such a shame! So pleasing to the eye, so appropriate for nursing little ones, and so appropriate for...”</i> It squeezes your boobs tightly, all the while it");
				if(vIdx >= 0) output(" dips deep into your [pc.vagina " + vIdx + "]");
				if(cIdx >= 0) output(" assiduously wrings your [pc.cock " + cIdx + "]");
				output(", and you moan as the sensuality of four hands playing with you simultaneously overcomes you");
				if(!pc.isLactating()) output(", making you shiver and sway in your bindings.");
				else output(" and you are driven to a boobgasm, [pc.milk] squirting out of your engorged " + pc.nipplesNoun(pc.biggestTitRow()) + ".");
				output(" <i>“...just so.”</i>");
			}
			else
			{
				output("\n\n<i>“A shame you don’t have those big feeders, such as the gold myr have,”</i> it sighs wistfully, cresting on your [pc.nipples] and");
				if(!pc.hasFuckableNipples()) output(" rubbing them back and forth between finger and thumb");
				else output(" slipping deep into their sensitive insides");
				if(pc.isLactating()) output(" until they are moist and beading [pc.milk] readily onto the sheer blackness of its latex-like chitin");
				output(". You shiver in your bindings, unable to do anything but be tormented by the pleasure of it and listen to the spidery predator’s ruminations. <i>“Never mind.");
				if(pc.biggestTitSize(true) >= 2) output(" Once you have drunk deep of my oil, you will grow them, and you will love their weight and tenderness.");
				output(" There is so much joy ahead of you, farlander...”</i>");
			}
			processTime(4);
			clearMenu();
			addButton(0, "Next", bothriocQuadommePCNeedFillLow, [1, addiction, isTribute, butt, vIdx, vIdx2, cIdx, cIdx2]);
			break;
		case 1:
			output("The quadomme’s hands break off from their exquisite molestations, and it spends a few moments playing with the strands it’s used to fetter you to the ceiling, little twitches that quiver through your hot [pc.skinFurScales], apparently thinking to itself. You are in an agony of expectation, particularly now the monstrous creature has");
			if(cIdx >= 0) output(" got [pc.eachCock] strainingly erect");
			if(cIdx >= 0 && vIdx >= 0) output(" and");
			if(vIdx >= 0) output(" [pc.eachVagina] wet and eager for filling");
			output(". What will it do? Perhaps it’s only interested in teasing you a bit after all...");
			output("\n\n<i>“Yes,”</i> it says assertively. <i>“We’ll turn you around.”</i> As it speaks its skillful hands and stilettoed feet are busy, twisting you around in your bindings so that you are made to face upwards, up at the pale, androgynous face and bare, flat chest of your captor. Your arms dangle upwards, trapped in a hammock of glutinous silk, with the bothrioc at its apex. <i>“So I may see the farlander’s every reaction to my passions.”</i> Chitinous stilettos and boot tips girdle your [pc.thighs], firmly drawing your bound [pc.legs] back, helplessly exposing your [pc.butt]. The quadomme’s huge, teardrop-shaped abdomen bends down; you swallow heavily as you see the wet, purple tip gleam in the dim light. <i>“This is no rough mating, hands and knees in the dirt whilst some two-legged thug quickly lightens their load into you,”</i> the eerily beautiful, matte-haired thing murmurs, stroking your chin. <i>“I’m going to learn much from you, as I breed you, lost little " + pc.mf("drone", "worker") + ". So that when finally you come to me of your own will, and pledge your undying loyalty, I will know exactly how to treat you.”</i>");
			output("\n\nYou shudder as you feel the warm, wet tip of its ovipositor come to rest upon " + (vIdx >= 0 ? "[pc.oneVagina]" : "your [pc.anus]") + ". A great welter of clear lubricant oozes out of it, drooling down the crack of your [pc.butt] and dripping down into the void below - as fat a load as any one creature might fuck into you, but clearly just the barest of arousal from the quadomme, its giant egg factory getting warmed up.");
			if(pc.buttRating() >= 8)
			{
				output(" It murmurs its approval as it sinks two of its stiletto heels into the squashy, ample flesh of your ass, ballooning around its ovi-cock. They don’t get anywhere near the bone.");
				output("\n\n<i>“You’re already well-equipped to be a dedicated incubator,”</i> it says, lust livid on its immaculate face. <i>“Just a little more oil, a few more changes to how you see the world... and I will look forward to waking up to the sight of that rump every single morning.”</i>");
			}
			else if(pc.buttRating() < 4)
			{
				output(" It taps two of its stiletto heels against your small, pert bum teasingly, making you flinch. Its ovi-cock has got those bite-sized cheeks of yours stretched very wide.");
				output("\n\n<i>“Skinny rump,”</i> it sighs. <i>“You are not really built for what’s coming, farlander. Never fear, though... a few more incubations, a few more deep dreams in the oil, and all of that will change.”</i>");
			}
			processTime(3);
			pc.lust(15);
			clearMenu();
			addButton(0, "Next", bothriocQuadommePCNeedFillLow, [2, addiction, isTribute, butt, vIdx, vIdx2, cIdx, cIdx2]);
			break;
		case 2:
			output("The ovipositor has narrowed to a tip, and it’s with that the quadomme goes questing in, the perfect tool to");
			if(vIdx >= 0) output(" slip inside your moistened pussy");
			else output(" open up your asshole");
			output(" and feed the large, bumpy stem inexorably inwards. You can’t stop a moan escaping your [pc.lips] as you feel the oily, hot pressure climb further and further up");
			if(vIdx >= 0) output(" [pc.oneVagina], resting gently at last against your cervix, utterly filling it.");
			else output(" your colon, not stopping until it feels like it’s packing every inch of your rectum.");
			if((vIdx >= 0 && pc.vaginas[vIdx].wetness() > 2) || (butt && pc.ass.wetness() > 2))
			{
				output(" Your " + (vIdx >= 0 ? "cunt" : "back passage") + " juices itself eagerly, " + (vIdx >= 0 ? "[pc.girlCum]" : "lube") + " spurting around the ovipositor cramming into it, making it all the easier for it to enter you.");
				output("\n\n<i>“Oh farlander,”</i> it groans, passion inspiring it to clinch you close to its flat, pale chest, <i>“how willing and perfect an egg-hole you have! You wandered away from another bothrioc’s harem, didn’t you? Their loss. Their loss.”</i>");
			}
			
			if(vIdx >= 0) pc.cuntChange(vIdx, enemy.cockVolume(0));
			else pc.buttChange(enemy.cockVolume(0));
			
			output("\n\nIt has more than enough limbs to hold you still, all four legs pinching into your sides and buttocks, to leave its arms free whilst doing so. A look of deepest gratification spreads over its long face, its abdomen lowers, a great gush of oil warms your insides... and then you feel a dense, oval weight, stretching your " + (vIdx >= 0 ? "pussy lips" : "tail hole") + " wide. It might be painful, in regular circumstances, but you have begun to feel zoned out, relaxed and weirdly peaceful. It’s not as if you can do anything about what’s going on, trussed up as you are. Let the creature do what it may. You’d be lying if you told yourself getting bred like this wasn’t intensely pleasurable. The egg is pressured up the tube mired deep within you, sending delightful tingles up your walls as it advances");
			if(vIdx >= 0) output(", and even it opening up your cervix and depositing itself roundly in your womb is a sensation that makes your pussy quiver and drip with delight, hungry for more.");
			output("\n\n<i>“Ahh,”</i> breathes the quadomme, smiling down at you. <i>“The first of many. All of my harem are stuffed up, you know, so I’m afraid you’re going to have to take quite the load.”</i> Its four hands descend upon your helpless, spread-eagled form as another dense, oval weight pushes itself against your spread " + (vIdx >= 0 ? "pussy lips" : "ass cheeks") + ". <i>“Let’s see what makes farlanders shiver.”</i>");
			processTime(3);
			pc.lust(15);
			clearMenu();
			addButton(0, "Next", bothriocQuadommePCNeedFillLow, [3, addiction, isTribute, butt, vIdx, vIdx2, cIdx, cIdx2]);
			break;
		case 3:
			output("The spidery predator teases and torments you as it pumps one egg after another into you, swelling you with warm, smooth heaviness as it satiates its curiosity for alien flesh.");
			if(pc.hasWings()) output(" Its fingers trail up the sails of your [pc.wings], tender flesh that other beings rarely bother with, making them twitch and flex as its finds tender points along them and ruthlessly strokes at them.");
			if(pc.hasTailGenital())
			{
				tailCunt = pc.hasTailCunt();
				output(" It didn’t even notice your parasitic, prehensile tail until it’s really making you spasm in your bonds, causing the thing to rear around, slapping into your [pc.hip], practically demanding attention. The quadomme laughs with delight as it strokes your [pc.tail]’s shaft, making");
				if(tailCunt) output(" the head spread and drool excitement");
				else output(" the head thicken and swell with excitement");
				output(", and then it hungrily licks");
				if(tailCunt) output(" the thing’s tender insides, sheerest pleasure throbbing right down the cunt tail");
				else output(" the thing’s tender underside, sheerest pleasure throbbing right down the tail cock");
				output(" until it’s forced to orgasm, " + (tailCunt ? "juices" : "cum") + " squirted into the air with powerful pulses like an out-of-control hose.");
			}
			if((vIdx >= 0 && pc.vaginas.length > 1) || (butt && pc.vaginas.length > 0))
			{
				output(" Two fingers are thrust into");
				if(pc.vaginas.length == 1) output(" your");
				else if(pc.vaginas.length == 2) output(" your other");
				else output(" another");
				output(" pussy, flicking at your clit and stirring you all the while pressure pushes against its walls from within, until you are rocking back and forth in your bonds to its touch, lost to the multi-faceted pleasure overwhelming you.");
			}
			output("\n\nIt");
			if(pc.hasNippleCunts() || pc.hasLipples())
			{
				output(" firmly fingers your [pc.nipples], pushing into their wet, soft insides up to the knuckle");
				if(pc.isLactating()) output(" until they are oozing " + (!pc.hasNippleCunts() ? "[pc.milk]" : "[pc.girlCum]") + " around them, frothing with excitement");
				output(".");
			}
			else if(pc.isLactating())
			{
				output(" pulls firmly on your [pc.nipples] until [pc.milk] bubbles and oozes between its long, latex-like fingers, at which point it clamps its wide mouth upon them thirstily, draining first one then the other" + (pc.totalBreasts() <= 2 ? "" : "s") + " of their liquid weight.");
				pc.milked();
			}
			else output(" pulls firmly on your [pc.nipples], tight pain that molds into the pleasure assaulting your genitals until it’s impossible to tell one sensation from the other.");
			output("\n\nYou orgasm brilliantly as a particularly large egg is implanted into your " + (vIdx >= 0 ? "womb" : "gut") + ", the way your limbs are trapped only seeming to make it more intense");
			if(vIdx >= 0) output(", your [pc.oneVagina] clamping up and rippling around the indescribably delicious undulations and stretching of the quadomme’s ovipositor");
			if(cIdx >= 0) output(", [pc.eachCock] swelling up and squirting [pc.cum] up and then back down on yourself from the undulating pressure and the barest of strokes one of its hand’s favors " + (pc.cocks.length == 1 ? "it" : "them") + " with");
			output(". You can’t help but cry out in its face at the magnitude of it, writhing ineffectually against your strong, sticky bonds.");
			output("\n\n<i>“Oh my,”</i> says the quadomme. It exhales, and you whine, closing your eyes as you feel yet another thick oval rub against your thoroughly invaded entrance. <i>“You farlanders certainly have well-developed tonsils, don’t you? Some of my harem are trying to sleep, you know. Here...”</i> You gasp, and are then muffled, as it weaves some web-silk out of the air into a large plaster, and then applies it across your mouth. <i>“There you go. Feel free to scream as much as you want, now.”</i> You stare at the preternaturally placid insect domme hanging above you wild-eyed. <i>“Oh, don’t look at me like that! In fact, yes. You shouldn’t look at me like that.”</i> You thrash piteously, but there’s absolutely nothing you can do to stop it stretching some more sticky web across your [pc.eyes]. The world becomes muffled darkness. There is nothing... except the hot, slippery, heavy weight of its massive egg-cock, thrust deep within you, and the knowledge it barely seems halfway done.");
			output("\n\n<i>“Don’t fret yourself, future toy, ornament and servant. You’re in good hands.”</i> Narrow smoothness caresses your cheek, at the same as something else slides along the line of your back, making you arch it in response. <i>“Hands that are getting to know you better all the time.”</i>");
			processTime(5);
			pc.orgasm();
			clearMenu();
			addButton(0, "Next", bothriocQuadommePCNeedFillLow, [4, addiction, isTribute, butt, vIdx, vIdx2, cIdx, cIdx2]);
			break;
		case 4:
			output("Who knows how long you’re trapped down there, bound, blinded and gagged, writhing helplessly to the sensation of getting swollen out with bothrioc eggs. You cum brilliantly to the incessant, oily pressure again, then again");
			if(pc.hasCock()) output(", your tender [pc.cockNoun] spurting [pc.cum] into the air");
			if(pc.isLactating()) output(", your [pc.nipples] squirting [pc.milk] like a fountain");
			output(".");
			if((pc.hasCock() && pc.cumQ() > 1000) || (pc.hasVagina() && pc.girlCumQ() > 1000) || (pc.canLactate() && pc.milkQ() > 1000))
			{
				output(" The quadomme tsks as it forces yet another gratuitous gout of fluid out of your");
				if(pc.hasCock() && pc.cumQ() > 1000) output(" dick");
				else if(pc.hasVagina() && pc.girlCumQ() > 1000) output(" pussy");
				else output(" breasts");
				output(", the impact of it hitting the ground below reaching your ears a couple of seconds later.");
				output("\n\n<i>“Juicy morsel, aren’t you?”</i> It observes. <i>“I should keep you as a drink dispenser. Thirsty work growing eggs, you know.”</i>");
			}
			// If more than one orifice available:
			if(vIdx >= 0 && (vIdx2 >= 0 || butt))
			{
				output("\n\nAt last you feel it withdrawing, your cervix closing up around the dense load of ova it’s been made to accept, the bumpy texture of its ovipositor dragging along the tenderized wall of your [pc.oneVagina] until it comes free in a small gush of oil down your [pc.thighs]. You exhale raggedly. It’s over! Except... what is it doing now? You emit a muffled moan as you feel its warm, oily tip slide teasingly over your [pc.groin] before finally alighting on your");
				if(vIdx2 >= 0) output(" [pc.vagina " + vIdx2 + "]");
				else output(" [pc.anus]");
				output(".");
				output("\n\n<i>“I’m not some callous brute you know, farlander,”</i> the quadomme says. It huffs, tightening its grip on you as it penetrates you for the second time, its prehensile, warm sliminess stretching open your " + (vIdx2 >= 0 ? "second cunt" : "asshole") + " open and eagerly swelling inside. <i>“I can tell when one of your delightful egg-holes has had enough. And, as I said... ungh!”</i> Sparks shoot through your extremities as another heavy, orange-sized object is thrust past your tender entrance. <i>“...I’ve got an awful lot to give.”</i>");
				output("\n\nYou are given another long breeding, your poor " + (vIdx2 >= 0 ? "[pc.vagina " + vIdx2 + "]" : "[pc.anus]") + " the next to receive the tender ministrations of a big and very horny bothrioc. The eggs push and bump into each other through your inner walls, little trembles that only become more intense the more the quadomme stuffs into you. When you’re forced to orgasm again, it’s like a small earthquake going off inside you, maddening amounts of sensation to cope with as [pc.eachVagina]");
				if(pc.hasCock()) output(" and [pc.eachCock]");
				output(" throb and flex up in almost painful ecstasy. How can anyone possibly cope with this?!");
				
				if(vIdx2 >= 0) pc.cuntChange(vIdx2, enemy.cockVolume(0));
				else pc.buttChange(enemy.cockVolume(0));
				
				output("\n\nBy the time it finishes with a long, satisfied whispering noise, and slowly retracts its feet-long ovipositor from you for a second time, you are beyond feeling relief. You can feel your gut has ballooned out, " + (vIdx2 >= 0 ? "your wombs" : "your womb and ass") + " utterly packed with bothrioc eggs, and you sag heavily in your silk bondage like a dripping, thoroughly fucked piñata.");
				
				pc.loadInCunt(enemy, vIdx);
				if(vIdx2 >= 0) pc.loadInCunt(enemy, vIdx2);
				else pc.loadInAss(enemy);
			}
			else
			{
				output("\n\nThe eggs push and bump into each other, little trembles that only become more intense the more the quadomme crams into you. When you’re forced to orgasm again, it’s like a small earthquake going off inside you.");
				output("\n\n<i>“A shame");
				if(butt && pc.vaginas.length <= 1) output(" you don’t have more holes to fill");
				else output(" all your other holes are already filled");
				output(",”</i> sighs the quadomme, drawing your head back so it’s as if your wet, muffled moans are directed to its unseen face. <i>“");
				if((vIdx >= 0 && pc.vaginalCapacity(vIdx)) >= 5000 || (butt && pc.analCapacity() >= 5000)) output("Still - what an accommodating hole that is! My eggs feel so snug in there. You’ve trained yourself well, farlander.");
				else output("Still - you have to be trained to take this, and more, if you are to belong to me.");
				output("”</i>");
				output("\n\nAt last, long after you lost count of exactly how many of its young it’s implanted inside you, it slowly retracts out of you with a satisfied whispering noise, the bumpy texture of its ovipositor dragging along the tenderized wall of your " + (vIdx >= 0 ? "[pc.oneVagina]" : "[pc.anus]") + " until it comes free in a small gush of oil down your [pc.thighs].");
				
				if(vIdx >= 0) pc.loadInCunt(enemy, vIdx);
				else pc.loadInAss(enemy);
			}
			if(!isTribute)
			{
				output("\n\nLong fingers stroke " + (!pc.hasHair() ? "over" : "through") + " your [pc.hair] tenderly.");
				output("\n\n<i>“Now then, farlander,”</i> the creature sighs, <i>“how shall I reward such pleasant, amorous company as yourself? Perhaps leave you hanging there for a day or so, let you ripen, dreaming deep in the oil. Have some of my servants tease you occasionally with feathers. Get you used to what life will be like, once you’re part of my harem.”</i> It titters to itself, drawing the whispery laugh out in a way that can only be described as malicious. A smooth, calming hand is laid upon your sweaty brow.");
				output("\n\n<i>“But no. I don’t tell lies - we quadommes don’t hold lower beings against their will. When you do join my harem, it shall be of your own free will.”</i> You feel yourself being lowered carefully to the ground, your bonds being unravelled. You flinch slightly at the coolness of the rock beneath your hot [pc.skinFurScales]. The only thing on your mind is deep, deep fatigue - and the warm, heavy weight in your");
				if(vIdx >= 0 && vIdx2 >= 0) output(" wombs");
				else
				{
					if(butt) output(" gut");
					if(butt && vIdx >= 0) output(" and");
					if(vIdx >= 0) output(" womb");
				}
				output(". It hasn’t taken off your gag and blindfold, but you’re so weak you can’t muster the will to tear them off yourself. You feel hard, warm lips press onto your brow.");
				output("\n\n<i>“Until then, farlander...”</i> The last thing you hear before you slump into an exhausted slumber is the slithery sound of an eight-limbed creature winching itself away.");
			}
			else
			{
				output("\n\nLong fingers stroke " + (!pc.hasHair() ? "over" : "through") + " your [pc.hair] tenderly.");
				output("\n\n<i>“That was wonderful, catspaw,”</i> the creature sighs. <i>“What a thoughtful gift Ara Kei sent along to me. You can tell [ara.him] that I shall be along to [ara.his] little tête-à-tête. No other promises, though...”</i> You feel yourself being lowered carefully to the ground, your bonds being unraveled. You flinch slightly at the coolness of the rock beneath your hot [pc.skinFurScales]. The only thing on your mind is deep, deep fatigue - and the warm, heavy weight in your");
				if(vIdx >= 0 && vIdx2 >= 0) output(" wombs");
				else
				{
					if(butt) output(" gut");
					if(butt && vIdx >= 0) output(" and");
					if(vIdx >= 0) output(" womb");
				}
				output(". It hasn’t taken off your gag and blindfold, but you’re so weak you can’t muster the will to tear them off yourself. You feel hard, warm lips press onto your brow.");
				output("\n\n<i>“Until then, farlander...”</i> The last thing you hear before you slump into an exhausted slumber is the slithery sound of an eight-limbed creature winching itself away.");
				
				IncrementFlag("BOTHRIOC_QUEST_QUADOMME_TO_SUMMIT");
			}
			processTime(75 + rand(16));
			pc.orgasm();
			clearMenu();
			addButton(0, "Next", bothriocQuadommePCNeedFillLow, [5, addiction, isTribute, butt, vIdx, vIdx2, cIdx, cIdx2]);
			break;
		case 5:
			showBust("");
			showName("\n...FILLED");
			
			output("You come to with a long groan some time later and clamber to your feet, irritatingly peeling off the mask of spider-silk. You thankfully don’t have to fumble about in the dark too long to find your [pc.gear], but... how to put this... it fits tighter upon you now. You massage your [pc.belly] and make a few careful movements, shivering as you feel smooth, oval weight shift inside you and a small amount of warm, clinging oil escapes your");
			if(butt) output(" [pc.anus]");
			if(butt && vIdx >= 0) output(" and");
			if(vIdx >= 0) output(" [pc.oneVagina]");
			output(". The bothrioc quadomme <i>really</i> pumped you good.");
			output("\n\nWeirdly though, you don’t feel upset or nervous about the prospect of having such a strange creature’s young growing inside you. Instead, a warm calm is infusing you. Whatever will be, will be. This is fine. Nodding and smiling peacefully, you go on your way, the extra weight taken in your stride.");
			
			processTime(50 + rand(11));
			IncrementFlag("BOTHRIOC_QUADOMME_SEXED");
			bothriocQuadommeToMainMenu(false);
			break;
	}
}
public function bothriocQuadommePCNeedFillHigh(arg:Array):void
{
	clearOutput();
	showBothriocQuadomme();
	
	var page:int = arg[0];
	var addiction:Number = arg[1];
	var isTribute:Boolean = arg[2];
	var butt:Boolean = arg[3];
	var vIdx:int = arg[4];
	var vIdx2:int = arg[5];
	var cIdx:int = arg[6];
	var cIdx2:int = arg[7];
	var tailCunt:Boolean = false;
	
	switch(page)
	{
		case 0:
			if(cIdx >= 0)
			{
				output("<i>“Oh my,”</i> the quadomme sussurates, its hand encircling your [pc.cock " + cIdx + "]. You tense up in your bonds as it slides its hand up and down your shaft, swiftly becoming erect from that smooth warmth encasing it. <i>“A precious drone, out here all on his own? What type of creature is so careless to allow that? Why, just about anything might pounce upon him, make him their own, never let him go...”</i>");
				if(vIdx >= 0) output(" It clicks its tongue in urbane surprise as another hand goes exploring between your [pc.thighs], long digits finding your [pc.vagina " + vIdx + "], tracing its lips. <i>“Or am I being too hasty, labeling you a drone, farlander? Why, it seems you are equipped to be both drone AND worker. Not queen, of course...”</i> It laughs softly to itself. <i>“That responsibility falls to others.”</i>");
			}
			else if(vIdx >= 0)
			{
				output("<i>“Ah yes, it is as I thought,”</i> the quadomme hums, its hand finding its way between your [pc.thighs]. You tense up in your bonds as it traces the lips of your [pc.vagina " + vIdx + "] slowly, dipping a warm, smooth finger inside to teasingly stroke at your sensitive hole. <i>“A lone worker, out on her own in the Deepest Deep. Answering a call only she can hear... seeking out a bliss she can find nowhere else.”</i>");
				if(vIdx2 >= 0) output(" It laughs in soft, delighted surprise as another hands finds your [pc.vagina " + vIdx2 + "], and gets to work slowly fingering that one as well. You huff and spasm as the twin pleasure of it assaults your senses. <i>“Haven’t you been busy, preparing yourself for life as a dedicated egg-bearer! Don’t worry, my multi-holed new incubator: I shall give you the attention you so clearly deserve.”</i>");
			}
			else
			{
				output("<i>“Curious...”</i> the quadomme sussurates. You tense up in your bonds as it slides its hand up and down your groin. <i>“No sex? How... disappointing.”</i>");
				output("\n\nYour lack of genitals seems to dissuade it from wanting to continue exploring you further.");
				output("\n\nIt laughs softly to itself. <i>“A rare catch, I would say, but maybe I should let this grub go for now.”</i> With that, it unties you from its trap and lets you free, then quickly disappears into the darkness of the tunnels. Perhaps you should return when you have the sexual equipment to entertain it?");
				output("\n\n");
				
				processTime(4);
				
				pc.lust(15);
				
				bothriocQuadommeToMainMenu(false);
				return;
			}
			output("\n\nAs it masturbates you, stoking heat in your groin with masterful curls and swirls of its fingers, the quadomme cups your [pc.chest] with its other pair of hands, inquisitive fingers " + (pc.hasBreasts() ? "sinking deep into the softness there" : "tracing the lines of your flat chest") + ".");
			if(pc.biggestTitSize() >= 4)
			{
				output("\n\n<i>“Mmm,”</i> it sighs with pleasure as it massages your ample boobs, cresting on your [pc.nipples] and");
				if(!pc.hasFuckableNipples()) output(" rubbing them back and forth between finger and thumb");
				else output(" slipping deep into their sensitive insides");
				if(pc.isLactating()) output(" until they are moist and beading [pc.milk] readily onto the sheer blackness of its latex-like chitin");
				output(". <i>“It is so good to see and feel the effects of the oil upon you, egg-bearer. Bothrioc don’t grow these, you know - not even the most submissive react in the way other creatures do to our oil. Such a shame! So pleasing to the eye, so appropriate for nursing little ones, and so appropriate for...”</i> It squeezes your boobs tightly, all the while it");
				if(vIdx >= 0) output(" dips deep into your [pc.vagina " + vIdx + "]");
				if(cIdx >= 0) output(" assiduously wrings your [pc.cock " + cIdx + "]");
				output(", and you moan as the sensuality of four hands playing with you simultaneously overcomes you");
				if(!pc.isLactating()) output(", making you shiver and sway in your bindings.");
				else output(" and you are driven to a boobgasm, [pc.milk] squirting out of your engorged " + pc.nipplesNoun(pc.biggestTitRow()) + ".");
				output(" <i>“...just so.”</i>");
			}
			else
			{
				output("\n\n<i>“Are you shrinking yourself deliberately? Or does your race react the same way mine does to the oil? A pity, if so.”</i> It sighs wistfully, cresting on your [pc.nipples] and");
				if(!pc.hasFuckableNipples()) output(" rubbing them back and forth between finger and thumb");
				else output(" slipping deep into their sensitive insides");
				if(pc.isLactating()) output(" until they are moist and beading [pc.milk] readily onto the sheer blackness of its latex-like chitin");
				output(". You shiver in your bindings, unable to do anything but be tormented by the pleasure of it and listen to the spidery predator’s ruminations. <i>“You must do better, egg-bearer. You will nurse many children during your service to me, and for that you will need fat, gorgeous breasts. Learn to love their weight and fullness, as you have learned to love the eggs swelling within you.”</i>");
			}
			processTime(4);
			clearMenu();
			addButton(0, "Next", bothriocQuadommePCNeedFillHigh, [1, addiction, isTribute, butt, vIdx, vIdx2, cIdx, cIdx2]);
			break;
		case 1:
			output("The quadomme’s hands break off from their exquisite molestations, and it spends a few moments playing with the strands it’s used to fetter you to the ceiling, little twitches that quiver through your hot [pc.skinFurScales]. The nearness of the egg-giver has got you in an agony of expectation");
			if(vIdx >= 0) output(", [pc.eachVagina] wet and opened");
			output("; your body keens to be stuffed with new life, to nurture it and glory in the peace and sensuality it brings. A single, black finger traces the curve of your back, from the nape of your neck down to the crack of your [pc.ass], and a low whine escapes your [pc.lips], one of total supplication.");
			output("\n\n<i>“Lovely,”</i> says the quadomme, and you practically glow to the approval you hear in its voice. <i>“A beautiful, proud alien broken down into soft, fertile clay, ready to be molded into a perfect incubator. Are you ready, " + pc.mf("drone", "worker") + "?”</i> ");
			output("\n\nIts hands and stilettoed feet are busy as it speaks, tightening the bracelets of gossamer it has strung around your wrists and [pc.feet] so that they practically meet above you, your [pc.chest] forced outwards.");
			output("\n\n<i>“Being an egg-bearer does not mean being simply a mindless breeding bitch, knowing only how to raise your haunches when your owner wishes it,”</i> the quadomme intones, their words vibrating deep into your dissolved core. <i>“You must be exactly what the egg-giver wishes you to be. You must do everything they wish you to do.”</i>");
			output("\n\nYou whine as your back strains, curved acutely in the position the quadomme forced you into; but you can cope with it. You can cope with it because the blessed egg-giver wills it. It’s painful but it’s a good pain, so so good, and you’re getting more used to it with every second. Your ");
			if(cIdx >= 0) output(" dick" + (pc.cocks.length == 1 ? "" : "s"));
			if(cIdx >= 0 && vIdx >= 0) output(" and");
			if(vIdx >= 0) output(" puss" + (pc.vaginas.length == 1 ? "y" : "ies"));
			if(cIdx < 0 && vIdx < 0) output(" groin");
			output(" " + ((pc.cocks.length + pc.vaginas.length) <= 1 ? "is" : "are") + " exposed, absolutely helpless, and you moan ecstatically to the thought. A black, long-fingered hand encloses your throat, tightening... then releasing. Tightening... then releasing.");
			output("\n\n<i>“Already you feel the power our love has, don’t you?”</i> it murmurs in your ear. You feel the warm, wet tip of its ovipositor come to rest upon " + (vIdx >= 0 ? "[pc.oneVagina]" : "your [pc.anus]") + ". A great welter of clear lubricant oozes out of it, drooling down the crack of your [pc.butt] and dripping down into the void below - as fat a load as any one creature might fuck into you, but clearly just the barest of arousal from the quadomme, its giant egg factory getting warmed up. <i>“Soon there shall be no limit to how far your limbs can be stretched. You shall be able to go without breathing for vast stretches of time. There will be no limits to which your imagination won’t go to amuse and enrich me. No limits, egg-bearer... once you have fully submitted.”</i>");
			processTime(3);
			pc.lust(15);
			clearMenu();
			addButton(0, "Next", bothriocQuadommePCNeedFillHigh, [2, addiction, isTribute, butt, vIdx, vIdx2, cIdx, cIdx2]);
			break;
		case 2:
			output("The ovipositor has narrowed to a tip, and it’s with that the quadomme goes questing in, the perfect tool to " + (vIdx >= 0 ? "slip inside your moistened pussy" : "open up your asshole") + " and feed the large, bumpy stem inexorably inwards. You feel the wonderful oily, hot pressure climb further and further up " + (vIdx >= 0 ? "[pc.oneVagina], resting gently at last against your cervix, utterly filling it." : "your colon, not stopping until it feels like it’s packing every inch of your rectum.") + "");
			if((vIdx >= 0 && pc.vaginas[vIdx].wetness() > 2) || (butt && pc.ass.wetness() > 2))
			{
				output(" Your " + (vIdx >= 0 ? "cunt" : "back passage") + " juices itself eagerly, " + (vIdx >= 0 ? "[pc.girlCum]" : "lube") + " spurting around the ovipositor cramming into it, making it all the easier for it to enter you.");
			}
			output("\n\n<i>“Now,”</i> it hisses, lust harshening its mannered voice. <i>“Clench!”</i>");
			output("\n\nImmediately, as if born entirely of your own instincts, your inner muscles clench up around the huge insertion splitting your " + (vIdx >= 0 ? "cunt" : "ass") + " wide open. Your wail combines with the gratified groan of the quadomme, and a great gush of oil warms your inside, followed by a dense, oval weight, pressing against your " + (vIdx >= 0 ? "pussy lips" : "tail hole") + ".");
			output("\n\n<i>“Relax,”</i> it grunts, and you do, once again as if it were commanding your nerve endings directly, and the egg slides delightfully inside, sending shivers of sheer bliss through you as it travels further and further up the tube mired deep inside you.");
			output("\n\n<i>“It displeases me to give an egg-bearer direct orders like this,”</i> the quadomme says coolly, two fingers hooking your nose to pull your head even further back. <i>“It should be baked into you to always tighten yourself up around your owner, so that you are pleasuring and milking their stem for every last egg.”</i> You feel its breath ghosting over your shoulder. <i>“Do you understand, dozy farlander? Or shall I have to punish you?”</i>");
			output("\n\n<i>“No, egg-giver!”</i> you cry immediately, every cell in your body pulsing with the slutty need to please. <i>“Fill every inch of me with your ovi-cock! Train me! I will be the best fuck you’ve ever had!”</i>");
			output("\n\nIt releases your nose, its sharp teeth latch into your shoulder, and then it shoves another egg into you hard, stiletto heels pressed deep into your [pc.ass], stretching your tender entranceway wide. This time you orgasm to it, every spasm of your " + (vIdx >= 0 ? "cunt" : "back passage") + " willing the heavy, grapefruit-sized object deep inside you.");
			if(cIdx >= 0 || vIdx >= 0)
			{
				output(" Y");
				if(cIdx >= 0) output("our [pc.cock " + cIdx + "] sprays [pc.cum] in delirious gouts, practically slapping against your [pc.belly] as the weight rides over your boy buzzer");
				if(cIdx >= 0 && vIdx >= 0) output(", and y");
				if(vIdx >= 0) output("our [pc.vagina " + vIdx + "] drools [pc.femcum] " + (pc.girlCumQ() < 1000 ? "down your thighs" : "by the bucketload") + ", desperately hungry for more");
				output(".");
			}
			output(" The way your limbs are caught up only seems to make the orgasm more intense, trapped inside of you instead of thrashed outwards. Your hands clench up reactively to every brilliant pulse of sensation.");
			output("\n\n<i>“Mmm,”</i> breathes the quadomme, as it withdraws its teeth from your [pc.skin]. <i>“I feel your willingness to be bettered. Very well. I shall continue to breed you. Be warned...”</i> its tone clouds with foreboding lust again. <i>“All of my harem are stuffed up, you know, so you’re going to have to take quite the load.”</i> Its four hands descend upon your helpless, spread-eagled form as another dense, oval weight pushes itself against your spread " + (vIdx >= 0 ? "pussy lips" : "ass cheeks") + ". <i>“Shiver for me, egg-bearer.”</i>");
			processTime(3);
			pc.lust(15);
			clearMenu();
			addButton(0, "Next", bothriocQuadommePCNeedFillHigh, [3, addiction, isTribute, butt, vIdx, vIdx2, cIdx, cIdx2]);
			break;
		case 3:
			output("The spidery predator teases and torments you as it pumps one egg after another into you, swelling you with warm, smooth heaviness as it enjoys your alien flesh.");
			if(pc.hasWings()) output(" Its fingers trail up the sails of your [pc.wings], tender flesh that other beings rarely bother with, making them twitch and flex as its finds tender points along them and ruthlessly strokes at them.");
			if(pc.hasTailGenital())
			{
				tailCunt = pc.hasTailCunt();
				output(" It didn’t even notice your parasitic, prehensile tail until it’s really making you spasm in your bonds, causing the thing to rear around, slapping into your [pc.hip], practically demanding attention. The quadomme laughs with delight as it strokes your [pc.tail]’s shaft, making");
				if(tailCunt) output(" the head spread and drool excitement");
				else output(" the head thicken and swell with excitement");
				output(", and then it hungrily licks");
				if(tailCunt) output(" the thing’s tender insides, sheerest pleasure throbbing right down the cunt tail");
				else output(" the thing’s tender underside, sheerest pleasure throbbing right down the tail cock");
				output(" until it’s forced to orgasm, " + (tailCunt ? "juices" : "cum") + " squirted into the air with powerful pulses like an out-of-control hose.");
			}
			if((vIdx >= 0 && pc.vaginas.length > 1) || (butt && pc.vaginas.length > 0))
			{
				output(" Two fingers are thrust into");
				if(pc.vaginas.length == 1) output(" your");
				else if(pc.vaginas.length == 2) output(" your other");
				else output(" another");
				output(" pussy, flicking at your clit and stirring you all the while pressure pushes against its walls from within, until you are rocking back and forth in your bonds to its touch, lost to the multi-faceted pleasure overwhelming you.");
			}
			output("\n\nIt ");
			if(pc.hasNippleCunts() || pc.hasLipples())
			{
				output(" firmly fingers your [pc.nipples], pushing into their wet, soft insides up to the knuckle");
				if(pc.isLactating()) output(" until they are oozing " + (!pc.hasNippleCunts() ? "[pc.milk]" : "[pc.girlCum]") + " around them, frothing with excitement");
				output(".");
			}
			else if(pc.isLactating())
			{
				output(" pulls firmly on your [pc.nipples] until [pc.milk] bubbles and oozes between its long, latex-like fingers, at which point it clamps its wide mouth upon them thirstily, draining first one then the other" + (pc.totalBreasts() <= 2 ? "" : "s") + " of their liquid weight.");
				pc.milked();
			}
			else output(" pulls firmly on your [pc.nipples], tight pain that molds into the pleasure assaulting your genitals until it’s impossible to tell one sensation from the other.");
			output("\n\nYou orgasm brilliantly as a particularly large egg is implanted into your " + (vIdx >= 0 ? "womb" : "gut") + ", again the way your limbs are trapped only making it more intense");
			if(vIdx >= 0) output(", your [pc.oneVagina] clamping up and rippling around the indescribably delicious undulations and stretching of the quadomme’s ovipositor");
			if(cIdx >= 0) output(", [pc.eachCock] swelling up and squirting [pc.cum] up and then back down on yourself from the undulating pressure and the barest of strokes one of its hand’s favors " + (pc.cocks.length == 1 ? "it" : "them") + " with");
			output(". You can’t help but cry out at the magnitude of it, writhing ineffectually against your strong, sticky bonds.");
			output("\n\n<i>“Oh my,”</i> says the quadomme. It exhales, and you whine, closing your eyes as you feel yet another thick oval rub against your thoroughly invaded entrance. <i>“You farlanders certainly have well-developed tonsils, don’t you? Some of my harem are trying to sleep, you know.”</i> Two chitinous fingers press lightly into the pit of your throat. <i>“No more noise.”</i>");
			output("\n\nYou inhale, and for a wild moment consider screaming, give vent to the intense pleasure you are experiencing... but you can’t. You have been ordered not to by the egg-giver, and your vocal chords may as well have been snipped. The urge subsides, and a surge of endorphins from blissful compliance makes you sag in your bonds. Perhaps, if you do well, it will give you your voice back.");
			output("\n\n<i>“I think I will take your sight away as well,”</i> the quadomme continues in a musing tone, all the while pushing the latest egg into your tenderized tunnel. <i>“Yes, I believe so. Close your eyes. Concentrate on nothing but your soft, fertile body... mmm... and how best to use it to gratify me.”</i> Your eyes snap shut on command. The world becomes muffled darkness. There is nothing... except the hot, slippery, heavy weight of its massive egg-cock, thrust deep within you, and the knowledge it barely seems halfway done.");
			output("\n\n<i>“Don’t fret yourself, future toy, ornament and servant. You’re in good hands.”</i> Narrow smoothness caresses your cheek, at the same as something else slides along the line of your back, making you arch it in response. <i>“Hands that are getting to know you better all the time.”</i>");
			processTime(5);
			pc.orgasm();
			clearMenu();
			addButton(0, "Next", bothriocQuadommePCNeedFillHigh, [4, addiction, isTribute, butt, vIdx, vIdx2, cIdx, cIdx2]);
			break;
		case 4:
			output("Who knows how long you’re trapped down there, blinded and gagged by your own impulses, writhing helplessly to the sensation of getting swollen out with bothrioc eggs. You cum brilliantly to the incessant, oily pressure again, then again");
			if(pc.hasCock()) output(", your tender [pc.cockNoun] spurting [pc.cum] into the air");
			if(pc.isLactating()) output(", your [pc.nipples] squirting [pc.milk] like a fountain");
			output(".");
			if((pc.hasCock() && pc.cumQ() > 1000) || (pc.hasVagina() && pc.girlCumQ() > 1000) || (pc.canLactate() && pc.milkQ() > 1000))
			{
				output(" The quadomme tsks as it forces yet another gratuitous gout of fluid out of your");
				if(pc.hasCock() && pc.cumQ() > 1000) output(" dick");
				else if(pc.hasVagina() && pc.girlCumQ() > 1000) output(" pussy");
				else output(" breasts");
				output(", the impact of it hitting the ground below reaching your ears a couple of seconds later.");
				output("\n\n<i>“Juicy morsel, aren’t you?”</i> It observes. <i>“I think I will keep you as a drink dispenser. Thirsty work growing eggs, you know.”</i>");
			}
			// If more than one orifice available:
			if(vIdx >= 0 && (vIdx2 >= 0 || butt))
			{
				output("\n\nAt last you feel it withdrawing, your cervix closing up around the dense load of ova it’s been made to accept, the bumpy texture of its ovipositor dragging along the tenderized wall of your [pc.oneVagina] until it comes free in a small gush of oil down your [pc.thighs]. You exhale. As thoroughly as you’ve been bred, you can’t help but feel a fug of disappointment that it’s over, that you are no longer being used for your central purpose in life. Except... what is it doing now? You emit a wet moan of glee as you feel its warm, oily tip slide teasingly over your [pc.groin] before finally alighting on your " + (vIdx2 >= 0 ? "[pc.vagina " + vIdx2 + "]" : "[pc.anus]") + ".");
				output("\n\n<i>“Would you like another, egg-bearer?”</i> the quadomme queries. Warm oil drools down your [pc.thighs]. <i>“You have another berth, and I have still young to give. You may speak. If you’re polite...”</i>");
				output("\n\n<i>“Please, egg-giver!”</i> you wail. <i>“Do me again! Do me as many times as you wish!”</i>");
				output("\n\nIt huffs, tightening its grip on you as it penetrates you for the second time, its prehensile, warm sliminess stretching open your " + (vIdx2 >= 0 ? "second cunt" : "asshole") + " open and eagerly swelling inside. You know the protocol now, and you clench up those inner muscles, making it groan with pleasure. Sparks shoot through the nerves of your extremities as another heavy, orange-sized object is thrust past your tender entrance.");
				output("\n\nYou are given another long breeding, your poor " + (vIdx2 >= 0 ? "[pc.vagina " + vIdx2 + "]" : "[pc.anus]") + " the next to receive the tender ministrations of a big and very horny bothrioc. The eggs push and bump into each other through your inner walls, little trembles that only become more intense the more the quadomme stuffs into you. When you’re forced to orgasm again, it’s like a small earthquake going off inside you, maddening amounts of sensation to cope with as [pc.eachVagina]");
				if(pc.hasCock()) output(" and [pc.eachCock]");
				output(" throb and flex up in almost painful ecstasy. How can anyone possibly cope with this?!");
				
				if(vIdx2 >= 0) pc.cuntChange(vIdx2, enemy.cockVolume(0));
				else pc.buttChange(enemy.cockVolume(0));
				
				output("\n\nBy the time it finishes with a long, satisfied whispering noise, and slowly retracts its feet-long ovipositor from you for a second time, you can barely think. Your gut has ballooned out, " + (vIdx2 >= 0 ? "your wombs" : "your womb and ass") + " utterly packed with bothrioc eggs, and you sag heavily in your silk bondage like a dripping, thoroughly fucked piñata.");
				
				pc.loadInCunt(enemy, vIdx);
				if(vIdx2 >= 0) pc.loadInCunt(enemy, vIdx2);
				else pc.loadInAss(enemy);
			}
			else
			{
				output("\n\nThe eggs push and bump into each other, little trembles that only become more intense the more the quadomme crams into you. When you’re forced to orgasm again, it’s like a small earthquake going off inside you.");
				output("\n\n<i>“A shame");
				if(butt && pc.vaginas.length <= 1) output(" you don’t have more holes to fill");
				else output(" all your other holes are already filled");
				output(",”</i> sighs the quadomme, drawing your head back so it’s as if your wet, muffled moans are directed to its unseen face. <i>“");
				if((vIdx >= 0 && pc.vaginalCapacity(vIdx)) >= 5000 || (butt && pc.analCapacity() >= 5000)) output("Still - what an accommodating hole that is! My eggs feel so snug in there. You’ve trained yourself well, farlander.");
				else output("Still - you have to be trained to take this, and more, if you are to belong to me.");
				output("”</i>");
				output("\n\nAt last, long after you lost count of exactly how many of its young it’s implanted inside you, it slowly retracts out of you with a satisfied whispering noise, the bumpy texture of its ovipositor dragging along the tenderized wall of your " + (vIdx >= 0 ? "[pc.oneVagina]" : "[pc.anus]") + " until it comes free in a small gush of oil down your [pc.thighs].");
				
				if(vIdx >= 0) pc.loadInCunt(enemy, vIdx);
				else pc.loadInAss(enemy);
			}
			if(!isTribute)
			{
				output("\n\nLong fingers stroke " + (!pc.hasHair() ? "over" : "through") + " your [pc.hair] tenderly.");
				output("\n\n<i>“Now then, farlander,”</i> the creature sighs, <i>“how shall I reward such pleasant, amorous company as yourself? Perhaps leave you hanging there for a day or so, let you ripen, dreaming deep in the oil. Have some of my servants tease you occasionally with feathers. Get you used to what life will be like, once you’re part of my harem.”</i> It titters to itself, drawing the whispery laugh out in a way that can only be described as malicious. A smooth, calming hand is laid upon your sweaty brow.");
				output("\n\n<i>“But no. If I did that, I may as well induct you into my harem proper, possess you entirely. You aren’t quite ready for that - not yet.”</i> You feel yourself being lowered carefully to the ground, your bonds being unraveled. You flinch slightly at the coolness of the rock beneath your hot [pc.skinFurScales]. Your thoughts have been scattered to the far corners of the galaxy, blown far away by orgasm after orgasm - all that remains is the warm, heavy weight in your");
				if(vIdx >= 0 && vIdx2 >= 0) output(" wombs");
				else
				{
					if(butt) output(" gut");
					if(butt && vIdx >= 0) output(" and");
					if(vIdx >= 0) output(" womb");
				}
				output(", the knowledge of a breeding well done. Your eyes are still shut, your lips are still sealed - you haven’t been given permission to use them again. You feel hard, warm lips press onto your brow.");
				output("\n\n<i>“Travel far, see much, precious egg-giver. Have many stories to tell, when you are by my side. You may have your sight and voice back again... after you’ve had some rest.”</i> The last thing you hear before you slump into an exhausted slumber is the slithery sound of an eight-limbed creature winching itself away.");
			}
			else
			{
				output("\n\nLong fingers stroke " + (!pc.hasHair() ? "over" : "through") + " your [pc.hair] tenderly.");
				output("\n\n<i>“That was wonderful, catspaw,”</i> the creature sighs. <i>“What a thoughtful gift Ara Kei sent along to me. You can tell [ara.him] that I shall be along to [ara.his] little tête-à-tête. No other promises, though...”</i> You feel yourself being lowered carefully to the ground, your bonds being unraveled. You flinch slightly at the coolness of the rock beneath your hot [pc.skinFurScales]. Your thoughts have been scattered to the far corners of the galaxy, blown far away by orgasm after orgasm - all that remains is the warm, heavy weight in your");
				if(vIdx >= 0 && vIdx2 >= 0) output(" wombs");
				else
				{
					if(butt) output(" gut");
					if(butt && vIdx >= 0) output(" and");
					if(vIdx >= 0) output(" womb");
				}
				output(", the knowledge of a breeding well done. Your eyes are still shut, your lips are still sealed - you haven’t been given permission to use them again. You feel hard, warm lips press onto your brow.");
				output("\n\n<i>“Travel far, see much, precious egg-giver. Have many stories to tell, when you are by my side. You may have your sight and voice back again... after you’ve had some rest.”</i> The last thing you hear before you slump into an exhausted slumber is the slithery sound of an eight-limbed creature winching itself away.");
				
				IncrementFlag("BOTHRIOC_QUEST_QUADOMME_TO_SUMMIT");
			}
			processTime(75 + rand(16));
			pc.orgasm();
			clearMenu();
			addButton(0, "Next", bothriocQuadommePCNeedFillHigh, [5, addiction, isTribute, butt, vIdx, vIdx2, cIdx, cIdx2]);
			break;
		case 5:
			showBust("");
			showName("\n...FILLED");
			
			output("You come to with a long groan some time later and clamber to your feet, blinking and massaging your throat. You thankfully don’t have to fumble about in the dark too long to find your [pc.gear], but... how to put this... it fits tighter upon you now. You massage your [pc.belly] and make a few careful movements, shivering as you feel smooth, oval weight shift inside you and a small amount of warm, clinging oil escape your");
			if(butt) output(" [pc.anus]");
			if(butt && vIdx >= 0) output(" and");
			if(vIdx >= 0) output(" [pc.oneVagina]");
			output(". The bothrioc quadomme <i>really</i> pumped you good.");
			output("\n\nYou sigh, baking in the wonderful feeling of peace billowing through you like a sweet, warm breeze. How wonderful it is to be an egg-slut - to know exactly where your place in life is. You happily go on your way, taking the extra weight in your stride.");
			
			processTime(50 + rand(11));
			IncrementFlag("BOTHRIOC_QUADOMME_SEXED");
			bothriocQuadommeToMainMenu(false);
			break;
	}
}
public function bothriocQuadommePCAllFull(arg:Array):void
{
	clearOutput();
	showBothriocQuadomme();
	
	var page:int = arg[0];
	var addiction:Number = arg[1];
	var isTribute:Boolean = arg[2];
	var butt:Boolean = arg[3];
	var vIdx:int = arg[4];
	var vIdx2:int = arg[5];
	var cIdx:int = arg[6];
	var cIdx2:int = arg[7];
	var tailCunt:Boolean = false;
	
	switch(page)
	{
		case 0:
			output("Smooth, narrow palms lay themselves upon your [pc.belly]... and then seem to sound you, one finger tapping against the taut [pc.skin] whilst another hand rubs a circular motion over it. They retract, only for the same four hands to gently pries open your [pc.thighs] and work their expert way across your groin, sliding between the cheeks of your [pc.ass] to stretch open your [pc.anus]");
			if(pc.hasVagina()) output(" and trace the lips of [pc.eachVagina], dipping inside to stir you until [pc.femCum] is moistening them");
			output(". You shiver, but try to remain as quiet as you can as warm, insistent sensation worms its way into your stuffed core.");
			if(!isTribute)
			{
				output("\n\n<i>“So then,”</i> the quadomme says at last, withdrawing its hands to clap them onto your shoulders, making you start. Its voice is stern");
				if(addiction >= 50) output(", and it makes the soft, eager-to-please part of you cringe to hear. You instinctively know you’re in the egg-giver’s bad books");
				output(". <i>“You fall into my webs, flaunting that young, supple, fertile body of yours, and when I pick you up, all ready to get rid of this aching burden of eggs, it turns out you’re already full up with </i>another<i> creature’s spawn. Such wantonness! Such loose morals! What do you have to say for yourself?”</i>");
				if(addiction >= 50) output("\n\n<i>“I’m sorry,”</i> you moan, and you really mean it. Having a dominant take this tone with you is <i>horrible</i>.");
				else
				{
					output("\n\n<i>“Umm...”</i> You don’t really feel you should have to apologize for being gorged with");
					if(pc.hasPregnancyOfChildType(GLOBAL.CHILD_TYPE_LIVE) && (pc.hasPregnancyOfType("EggTrainerCarryTraining") || pc.hasPregnancyOfType("EggTrainerFauxPreg") || pc.hasPregnancyOfType("OvalastingEggPregnancy"))) output(" young and egg training equipment");
					else if(pc.hasPregnancyOfType("EggTrainerCarryTraining") || pc.hasPregnancyOfType("EggTrainerFauxPreg") || pc.hasPregnancyOfType("OvalastingEggPregnancy")) output(" egg training equipment");
					else output(" young");
					output(", just because it means <i>this</i> particular breeder can’t get its rocks off. On the other hand, you <i>are</i> trussed up and helpless in its webs. <i>“... Sorry?”</i>");
				}
			}
			else
			{
				output("\n\n<i>“You agree to pay tribute in order to secure my appearance at your Owner’s summit, and then it turns out that you’re completely full of </i>another<i> creature’s spawn. Such dishonor! Such slyness! What do you have to say for yourself?”</i>");
				output("\n\n<i>“Sorry, but maybe if you hadn’t been so insistent...”</i> you begin.");
			}
			output("\n\n<i>“Not good enough!”</i> You suddenly feel yourself being yanked upwards, [pc.feet] first, your head swinging horribly in the darkness. You find yourself being held almost vertical, supported only by the strong stickiness around your [pc.feet], your wrists");
			if(pc.hasHair()) output(" and your [pc.hair]");
			output(". Sudden pain flares across your [pc.butt] as a chitin-clad palm smacks into it, and you flail in helpless shock.");
			output("\n\n<i>“Say it like you mean it!”</i> the quadomme demands, in ringing, authoritative tones. <i>“You will hang here until you do!”</i>");
			if(addiction >= 60) output("\n\n<i>“I’m sorry!”</i> you wail. You’re spanked again, on the other cheek, the reverberation carrying right through your gravid body. The pain feels <i>good.</i> <i>“I’m such a bad [pc.boyGirl], egg-bearer! Please punish me until I’m not!”</i>");
			else output("\n\n<i>“I’m sorry!”</i> you cry out. You can’t help let a note of resentment creep into your voice, and you immediately regret it. You’re spanked again on the other cheek, harder this time, the reverberation carrying right through your gravid body. <i>“I’m sorry for being pregnant, la- si- Bothrioc Master,”</i> you say, as contritely as you possibly can. <i>“How can I make it up to you?”</i>");
			output("\n\nThis begets no response from the quadomme, except another firm slap against your [pc.butt]. You’re made to dangle there, being systematically spanked, the fleshy, shameful sound echoing away into the caverns, until your butt cheeks feel like they’re glowing.");
			output("\n\n<i>“Now,”</i> it says eventually, its tone no less forbidding. <i>“What do you say?”</i>");
			if(addiction >= 60) output("\n\n<i>“Thank you for disciplining me, egg-bearer!”</i> you reply, the grateful words spilling from your [pc.lips]. Oh, to hear just a single word of approval from the dominant after receiving this punishment... you might just cum on the spot. <i>“I will try my hardest to have a warm, empty hole for you the next time we meet.”</i>");
			else output("\n\n<i>“Th- thank you for disciplining me.”</i> The humiliation burns on your [pc.skinFurScales], but you’ve wholly grasped how counterproductive to be angry about this is, and you’re glad that your voice comes out sounding thoroughly bitchified. <i>“I will do better next time. Please may I go now?”</i>");
			output("\n\n<i>“Hmm...”</i> The bothrioc draws the rumination out in a whispery drone, sliding a finger up and down your spine as it does.");
			
			// 50% lets you go
			if(rand(2) == 0)
			{
				output("\n\n<i>“Oh, very well. You </i>do<i> sound like you’ve learned your lesson, and I have other matters to attend to.”</i> You are gradually lowered back down to the ground, and with a skillful crook of chitinous fingers the sticky silk binding your [pc.legs] and wrists is drawn away. You look up into the quadomme’s forbidding midnight eyes. <i>“Be warned though, wanton farlander. This is no place for a pregnant egg-bearer to be waddling around on their own. Next time I may decide you need a more stringent lesson, if you don’t correct your behavior. Back to the surface with you!”</i>");
				output("\n\nIt retracts itself back into its hole in an eerie dance of limbs, leaving you to rub your sore buttocks and pick up your gear.");
				if(addiction >= 66) output(" You kind of feel like you <i>did</i> deserve a harsher punishment for disappointing the egg-giver. Oh well. They always know best.");
				else if(addiction >= 33) output(" You weirdly feel like you absolutely <i>did</i> deserve to get a good hard spanking there. And you’re definitely not coming down to the Deep Caves again, unless you’re ready to get bred. Wait, what? You shake the strange, alien thoughts away.");
				else output(" The nerve of that thing! Spanking you just because it couldn’t shove a bunch of eggs up you! Humiliation burns on your cheeks as you pull your stuff back on. You resolve not to let such an entitled creature get the jump on you again.");
				output("\n\n");
				processTime(6);
				// End
				bothriocQuadommeToMainMenu(true);
			}
			// 50% maid training tiem
			else
			{
				if(!isTribute) output("\n\n<i>“No, I think a tougher lesson is in order.”</i> Your hanging body is slowly reeled upwards until your face is level with the quadomme’s. Weirdly, for a noseless black-eyed predator, something approaching motherly (fatherly?) concern lines its face. <i>“A " + ((pc.thickness < 30 || pc.tone > 30) ? "lean" : "squishy") + " egg-bearer, just wandering around these parts? You don’t look after yourself, farlander. So I will teach you - a number of things. You’re joining my harem for the day.”</i>");
				else output("\n\n<i>“No. A payment is still due.”</i> Your hanging body is slowly reeled upwards until your face is level with the quadomme’s. Its expression, such as you can tell, is stern. <i>“You’re joining my harem for a day. Serve me well and uncomplainingly, and I shall consider the tribute fairly given.”</i>");
				output("\n\nA day?! You open your mouth, and it immediately raises a stern finger.");
				output("\n\n<i>“Are you going to protest? Because if you are, I’m going to gag you. That isn’t going to be helpful when you’re introducing yourself to your harem-mates.”</i>");
				output("\n\nYou close it.");
				if(addiction < 50) output(" This seems ridiculously out of proportion for the crime of not being able to be an incubator, but right now you can’t see a way out of this situation. Perhaps if you just do what it asks, it’ll get bored and let you go after an hour or so?");
				else output(" You’d be lying if the prospect of becoming the egg-giver’s property for a while didn’t send a shuddering thrill up your spine. An embarrassingly large part of you thinks this is a way better outcome than a quick bout of sex.");
				output("\n\nIt takes a firm grip of you with its four gleaming black stilettos, and climbs with its prize back up into its tunnel; you shiver as you’re swallowed by it, the only light emanating from the ghostly gleam of the spider silk plastered over every inch of the rock. After only a short climb though, you enter a lit, spacious cave. It’s surprisingly well furnished: elegant carpets cover the flat, smooth floor and walls, there’s weird, spindly furniture, and ghostly lights hang from the ceiling by silk filigrees. Other... things... also dangle from the ceiling.");
				output("\n\n<i>“Time-outs,”</i> explains the quadomme, catching where you’re looking. It strokes the line of a hip discernible on one of the mummified, human-sized bundles; it moans softly.");
				
				var numPidemme:int = 2 + rand(5);
				var numGoldMyr:int = 1 + rand(3);
				var numRedMyr:int = 1 + rand(3);
				
				output("\n\nOther haremlings quickly appear, from the numerous tunnels running off this room, eagerly greeting the return of their Owner. They are all shapes, sizes and colors, but they all have several things in common: they’re mostly naked, they’re all slightly swollen, and all have a soft, happy expression on their faces. Altogether, there’s " + num2Text(numPidemme) + " pidemme bothrioc, " + num2Text(numGoldMyr) + " gold myr, and " + num2Text(numRedMyr) + " red myr.");
				output("\n\n<i>“We are being joined today by this egg-bearing farlander,”</i> the quadomme states authoritatively, two hard black hands slapping down on your shoulders. <i>“Whilst [pc.he] recovers [pc.his] strength, you are to treat [pc.him] as one of us. Now - you three are working on the far gallery. You two, continue the ferment harvest. You, little one, are on nursery duty. You two - my boots haven’t been polished in </i>minutes<i>.”</i>");
				output("\n\nIt’s a bustle of activity, like a tiny village with one extremely obvious mayor. You thought that maybe the quadomme would act like a petty tyrant, lounge on a settee being fed whatever the bothrioc equivalent of grapes are, but actually the creature is striding its four legs back and forth across its fiefdom the entire time - overseeing, encouraging, swapping its servants out for other tasks the moment it detects they’re getting bored or tired. It acts with seemingly limitless energy, its stern authority never wavering for a moment.");
				output("\n\nYou want to feel outraged or at least indignant that you’ve been abruptly indentured like this, but it’s hard to hold onto that when all of the other workers are so obviously, blissfully happy and cooperative. They rub your [pc.belly] and ask inquisitive questions about your brood, as well as the ‘farlands’ themselves. The moment you feel hungry or thirsty doing laundry or being on your [pc.knees] polishing a floor, somebody’s pressing into your hand water or the bland-but-satisfying fungus they seem to subsist on. There’s none of the usual backbiting and jockeying for position you’d ordinarily expect in a harem.");
				if(addiction < 20) output(" It’s distinctly cult-like, but the problem with cults is that you kind of forget you’re in one after a while. Even without any of the happy juice these girls and nulls are clearly all on, you’re contentedly pitching in with them after only an hour or so, and completely lose sense of time.");
				if(addiction >= 60) output(" You quickly lose all sense of time, lost in the glow of contentment you all share. The work is easy even when it’s hard, because it’s what the egg-giver wants, and your happiness peaks luminously whenever it hands you a single word of praise or a stroke " + (pc.hasHair() ? "through" : "across") + " your [pc.hair].");
				output("\n\nThere is also a lot of sex. You quickly discover the quadomme is a creature with a scale of appetite that absolutely require a stable of doting concubines roughly this big; every couple of hours it helps itself to one of the pidemme, thrusting its giant, purple ovipositor into the servant’s own insect abdomen and drawing away a drooling load of oil. The procedure seems to be so ecstatic for the pidemme, mouth wide and eyes rolled way back as their Master stands over them holding their hands behind their back, reaching deep into their egg sac, that you " + (addiction < 50 ? "almost" : "quickly") + " begin to wish you had a plump, oily black abdomen yourself. You see just where the quadomme’s deep frustration with you originates from - it desperately needs to offload its eggs somewhere, and with all of its harem already full up, wanderers of the Deep Caves are the only option.");
				if(addiction >= 50) output(" If you didn’t feel bad about being occupied before, you definitely do now. You’ll never be so selfishly pregnant again!");
				else output(" A certain grudging understanding of why it acts like it does dawns. You still don’t feel you should apologize for being preggers, but alright, you can see why it assaults passersby.");
				processTime(8);
				pc.lust(50);
				clearMenu();
				addButton(0, "Next", bothriocQuadommePCAllFull, [1, addiction, isTribute, butt, vIdx, vIdx2, cIdx, cIdx2]);
			}
			break;
		case 1:
			output("The low-level horniness you feel watching these little trysts quickly builds, and when the work breaks organically to form snowballing orgies you only feel an awkwardness about joining in head-first for an instant.");
			if(cIdx >= 0) output(" [pc.EachCock] " + (pc.cocks.length == 1 ? "is an unexpected and eagerly seized-upon gift" : "are unexpected and eagerly seized-upon gifts") + " in this community of dickless drones. One myr rides you energetically, jerking your [pc.cock " + cIdx + "] backwards and forwards in her soft, wet pussy, whilst another sits her own leaking sex down on your face, moaning ecstatically as you tongue her avidly. You orgasm brilliantly, gripping her waist with your [pc.hips] and thrusting a load of [pc.cum] up into the giggly ant slave... and immediately a bothrioc pushes the other myr aside in order to slather your face and mouth with oil, straight from its ovipositor. The warm, coating fat sinks into your [pc.skin] and down your throat, the soft heat inside you expands, and you’re quickly hard again - perfect for another bothrioc to clamber on top of you and thrust their abdomen entrance down onto your [pc.cock " + cIdx + "]. They do so again, and again - every time you groaningly cum there’s a red myr sinking her fangs into you or a bothrioc slathering your [pc.lips] with oil, so you keep getting erect, to the intense gratification of the entire harem and their myriad slick, warm, inviting holes.");
			else
			{
				output(" These drones are all empathetic lesbians really, and they know what they’re doing, even with your relatively alien anatomy. You lean back and wrap your [pc.thigh] around a red myr’s waist");
				if(vIdx >= 0) output(", rhythmically rubbing your [pc.vagina " + vIdx + "] against hers,");
				output(" whilst a pidemme stands over you, gently pushing the tip of their purple ovipositor into your mouth, growing more and more vocally excited as you suckle them until they reward you with a great gush of oil, oozing down your chin. The warm, coating fat sinks into your [pc.skin] and down your throat, the soft heat inside you expands, and you orgasm brilliantly");
				if(vIdx >= 0) output(", smearing [pc.femcum] all over the myr’s slim, neat sex as you wriggle with joy");
				output(". Then you’re between somebody else’s thick thighs");
				if(vIdx >= 0) output(", and somebody else is nibbling teasingly at [pc.eachVagina]");
				output(", and so on and so on, fingers and tongues coaxing you to one spasm of sheer ecstasy after another.");
			}
			output("\n\nThe quadomme stalks elegantly through the ghostly, Bacchanalian display, releasing pent-up haremlings from their ceiling prisons and scooping up other squealing morsels to bind up in silk and stick somewhere. You rest for a little while afterwards, sweat slowly drying on your [pc.skinFurScales], head propped up on a pidemme’s plump rear, watching the trapped, luminescent insects swirling in the globes above... and then with an authoritative clap, the quadomme is directing you to new duties.");
			if(addiction < 50) output(" You are unconsciously following its order well before any kind of self-awareness steals over you. But you feel a strong aversion to complaining or refusing. Why would you ruin the peaceful, sexy rhythm of this extremely well-oiled machine you’ve slotted into? Even if it does involve several hours of looking after bothrioc young, and then a couple more acting as a foot-rest for a pair of gleaming black stilettos.");
			else output(" You follow its order instinctively. You actually allow the thought of refusing or complaining to form, just to imagine what that would be like... and it’s so bitter, so awful, you instinctively shudder, prompting a pidemme to slip a concerned arm around your shoulders. Why would you ever refuse such a sexy, righteous Master? You firmly drown that thought in the soft, wonderful haze, and slip into what your instincts tell you is right like a smooth, well-loved groove.");
			processTime(4 * 56);
			pc.lust(15);
			clearMenu();
			addButton(0, "Next", bothriocQuadommePCAllFull, [2, addiction, isTribute, butt, vIdx, vIdx2, cIdx, cIdx2]);
			break;
		case 2:
			output("After what seems like a timeless, abyssal expanse uncomplainingly acting as a spider alien’s maid, another orgy forms, and this one the quadomme takes a more active hand in. It binds your wrists behind your back, binds your [pc.legs] in even more steely web, and then sits back and watches a pidemme thrust its hot, bumpy egg-cock up your " + (vIdx >= 0 ? "[pc.vagina]" : "[pc.ass]") + " whilst a gold myr dumps her abdominal honey pussy on top of your face. Intense sensation ratchets up your spine from the intrusion opening up your " + (vIdx >= 0 ? "pussy" : "bowels") + " as musky sweetness inundates your taste buds, your desperate licks around the myr’s supple walls only seeming to cause honey to flow even more abundantly from her generous, sticky cunt. The two of them sing high, breathless praises to their owner for allowing them this wonderful, alien treat as they energetically double team you. The quadomme itself watches on with a gratified smirk on its beautiful, androgynous face, firmly thrusting its own enormous ovipositor into the open mouth of another servant knelt behind it.");
			output("\n\nYou’re a sticky, drooling mess - face smeared with honey and [pc.ass] with oil, little after-quakes still trembling through you - when four strong arms firmly grip you by your silken bonds, attach you to the underside of a giant insect abdomen, and slowly truck you back to the cave complex’s entrance. Slim, chitinous fingers touch you, heartfelt, murmured goodbyes reach your [pc.ears]. You’re barely aware of what’s going on.");
			output("\n\n<i>“You make for a fine servant, egg-bearer,”</i> says the quadomme, as the darkness of the tunnel swallows you whole. <i>“It is a shame to let you go... but let you go I must. We quadomme must always act truthfully and honorably, if we are to lay fair claim to our positions. And possessions.”</i>");
			output("\n\nYou blink blearily. What is your glorious owner talking about... ? Oh. Oh yeah. The cold light of reality intrudes, as one with the dim light of the cavern it snatched you from, opening up beneath you. It lays you down carefully on the rock, snipping away its webs as it does.");
			if(!isTribute)
			{
				output("\n\n<i>“I hope you learned plenty, poor, naive farlander,”</i> the tall, black-armored creature says. It pauses for a moment, eyeing you. <i>“My pidemmes seem obedient, don’t they? One of them will abandon me, every two months or so. Their mood changes, and they set out to become dominants themselves. I am always looking for more additions to my harem. I have to.”</i> It sighs whisperingly, and then eerily, elegantly reels itself back into its tunnel. <i>“See you soon, farlander...”</i>");
			}
			else
			{
				output("\n\n<i>“I hope you learned plenty, naive farlander,”</i> the tall, black-armored creature says. It pauses for a moment, eyeing you. <i>“You can tell Ara I shall be at [ara.his] little summit. Also tell [ara.him] not to send such a provoking messenger next time.”</i> It eerily, elegantly reels itself back into its tunnel. <i>“See you soon, farlander...”</i>");
				
				IncrementFlag("BOTHRIOC_QUEST_QUADOMME_TO_SUMMIT");
			}
			output("\n\nYou spend at least a minute sat there, head gyrating slowly, gathering your wits back up. Did it <i>really</i> abduct you for a whole day? Did it <i>really</i> make you work as a servant and sex toy that entire time? And did it <i>really</i> never occur to you to complain or struggle? You should, surely, at the very least feel resentful about all of this. And yet, what you do feel, as you pick yourself back up and put your [pc.gear] back on, is a dragging reluctance to leave. Of a soft, sexy, blissful memory that makes you want to turn your [pc.feet] back towards the quadomme’s lair.");
			output("\n\nYou’ve certainly got a story to tell, if anybody’s willing to believe it.");
			output("\n\n");
			processTime(20 * 57);
			pc.orgasm();
			pc.applyPussyDrenched();
			// +20 Addiction
			bothriocAddiction(20);
			IncrementFlag("BOTHRIOC_QUADOMME_SEXED");
			bothriocQuadommeToMainMenu(false);
			break;
	}
}

// Win Scenes
public function bothriocQuadommePCVictory():void
{
	clearOutput();
	showBothriocQuadomme();
	
	if(inCombat())
	{
		showName("VICTORY:\nQUADOMME");
	}
	else
	{
		var domme:BothriocQuadomme = new BothriocQuadomme();
		setEnemy(domme);
	}
	
	output("The quadomme’s legs twitch at the tapestry of silk above it, attempting to pull the creature to safety... but they are out-of-sync, weak and disorientated, and a moment later the strange piebald creature slumps downwards in its webs, flat chest heaving, fingers trailing at the ground, its taunting silenced. You’ve won!");
	
	if(pc.hasStatusEffect("Fail Quadomme Diplomacy"))
	{
		bothriocQuestQuadommePCVictory();
		return;
	}
	
	if(pc.isNice())
	{
		output("\n\nYou consider the bothrioc’s pale flesh in the low light. You feel no urge to immediately move in and take a spiteful, lusty revenge: that’s not your style. After a moment, the defeated creature recovers itself a bit, coughing and looking up at you.");
		output("\n\n<i>“Aww,”</i> it says with a rueful grin, <i>“you beat me! You’re much tougher than I was expecting, farlander.”</i> It creases its long, elegant face and looks away, actually managing to look slightly awkward. <i>“Listen, I can tell you’re a nice person - somebody I could trust around my possessions. Instead of this tête-à-tête ending on a sour note, perhaps we could go upstairs and have some fun with my harem instead? I’m sure you’d like that.”</i>");
		
		clearMenu();
		addButton(0, "Yes", bothriocQuadommeSexScenes, ["nice orgy", bothriocAddiction(), -1, -1, -1, -1], "Yes", "That sounds pretty nice.");
		addButton(1, "No", bothriocQuadommePCVictoryNext, "no", "No", "Perhaps something else instead.");
		addButton(2, "Let It Go", bothriocQuadommePCVictoryNext, "let go", "Let It Go", "Part ways here.");
	}
	else
	{
		output("\n\nIn the low light, the pale flesh of the defeated quadomme’s face and chest seem to glow slightly. You consider its long body, with its latex booties, round backside and bumpy, spidery abdomen with its wet, purple opening.");
		output("\n\nIs there anything you’d like to do?");
		
		bothriocQuadommeSexMenu();
	}
}
public function bothriocQuadommePCVictoryNext(response:String = ""):void
{
	clearOutput();
	showBothriocQuadomme();
	showName("VICTORY:\nQUADOMME");
	
	switch(response)
	{
		case "no":
			output("<i>“Worth a try, I suppose,”</i> it sighs, two sets of shoulders slumping. <i>“So what are you intending?”</i>");
			
			bothriocQuadommeSexMenu();
			break;
		case "let go":
			output("<i>“You don’t have to try and bribe me to leave you alone,”</i> you reply with a curt shake of your head.");
			if(silly) output(" <i>“Truth be told, I’m just down here farming XP and rocks, so I’m not even reading this.”</i>");
			output("\n\n<i>“Oh.”</i> The quadomme looks flustered, before quickly winding itself back towards its tunnel. <i>“Well. Thank you, farlander. Truly, your chivalry is from another planet...”</i>");
			output("\n\nDamn straight.");
			output("\n\n");
			
			bothriocQuadommeToMainMenu(true);
			break;
		case "leave":
			output("You turn to take your leave.");
			output("\n\n");
			
			bothriocQuadommeToMainMenu(true);
			break;
	}
}

public function bothriocQuadommeSexMenu():void
{
	var addiction:Number = bothriocAddiction();
	
	clearMenu();
	
	// Requires dick less than 6 inches big
	if(!pc.hasCock() || pc.smallestCockLength() > 6) addDisabledButton(0, "Small Dick", "Small Dick", "You don’t have one of those.");
	else addButton(0, "Small Dick", bothriocQuadommeSexScenes, ["small dick", addiction, -1, -1, -1, -1], "Small Dick", "Have some... very specific... fun.");
	
	// Requires penis + hard personality
	if(!pc.hasCock() && !pc.isAss()) addDisabledButton(1, "Humiliate", "Humiliate", "You require a penis and to have a hard personality to do this.");
	else if(!pc.hasCock()) addDisabledButton(1, "Humiliate", "Humiliate", "You require a penis to do this.");
	else if(!pc.isAss()) addDisabledButton(1, "Humiliate", "Humiliate", "Your personality is not hard enough to do this.");
	else addButton(1, "Humiliate", bothriocQuadommeSexScenes, ["humiliate", addiction, -1, -1, -1, -1], "Humiliate", "Give this pompous beast a buttfucking it won’t soon forget.");
	
	// Requires vag
	if(!pc.hasVagina()) addDisabledButton(2, "Ride Ovi", "Ride Ovi", "You need a vagina for this.");
	else addButton(2, "Ride Ovi", bothriocQuadommeSexScenes, ["ride ovi", addiction, -1, -1, -1, -1], "Ride Ovi", "Its ovipositor, your pussy.");
	
	addButton(3, "Leave", bothriocQuadommePCVictoryNext, "leave", "Leave", "");
}
public function bothriocQuadommeSexScenes(arg:Array):void
{
	clearOutput();
	showBothriocQuadomme();
	
	var response:String = arg[0];
	var addiction:Number = arg[1];
	var vIdx:int = arg[2];
	var vIdx2:int = arg[3];
	var cIdx:int = arg[4];
	var cIdx2:int = arg[5];
	var lottaLibido:Boolean = (arg.length > 6 ? arg[6] : false);
	
	switch(response)
	{
		case "small dick":
			cIdx = pc.smallestCockIndex();
			
			output("When you rip off your [pc.gear], [pc.move] forward, " + (!pc.hasVagina() ? "eagerly brandishing your [pc.cock " + cIdx + "]" : "hand brushing over your mound") + ", the quadomme stirs, black eyes wearily trailing downwards to see what’s coming. When it catches sight of your dick, already hotly erect at the prospect of some hot spider loving, a smirk curls its way across its face. Bothrioc have big mouths and no nose. When they smirk, they <i>smirk</i>.");
			output("\n\n<i>“Ooh dear,”</i> it drones, writhing its elegant, sinister body, suspended a few inches off the ground. <i>“It seems the big, brave farlander warrior is now going to claim [pc.his] prize for defeating me in battle. The big, big, <b>big</b> warrior.”</i> It eyes you almost fondly, and then opens all four gleaming black hands to you. <i>“Listen, sweet " + pc.mf("drone", "worker") + ", why don’t you put taking care of that sensitive little something into my hands? Fair’s fair, you beat me, you deserve something. I’ll make it good for you, trust me.”</i>");
			
			processTime(3);
			
			clearMenu();
			addButton(0, "Yes", bothriocQuadommeSexScenes, ["small dick yes", addiction, vIdx, vIdx2, cIdx, cIdx2], "Yes", "That does sound quite nice...");
			addButton(1, "No", bothriocQuadommeSexScenes, ["small dick no", addiction, vIdx, vIdx2, cIdx, cIdx2], "No", "You’re not playing into its hands! Perhaps there’s something exceedingly tight elsewhere on the bothrioc’s body...");
			break;
		case "small dick yes":
			output("You feel flustered by the quadomme’s gentle teasing, a blush rising to your cheeks. It would be good if [pc.cock " + cIdx + "] hadn’t become fiercely erect at the same time, the hotness of humiliation seeming to power into its short shaft. Weren’t you supposed to be in charge here? You won, dammit! Nobody should be taunting you for having such a tiny penis. If only that didn’t feel so good...");
			output("\n\n<i>“It’s ok, little [pc.guy],”</i> says the long, spidery creature soothingly. It swings itself over so it’s hanging over your shoulders, one arm wrapping around your waist, its mouth near your [pc.ear], another hand reaching down, down, down. <i>“You relax and let me take care of everything. You deserve this, don’t you? What a talented fighter you are! Relax, and just listen to my voice...”</i>");
			output("\n\nYou exhale slowly to the sensation of your shoulders being gently rubbed, and that long, reaching hand finally wrapping its hard, smooth, warm digits around your [pc.cock " + cIdx + "]. It rubs you slowly, coaxing more and more pleasure up it - and then you gasp in pain as it jerks it upwards sharply.");
			output("\n\n<i>“Ooh. Sorry, was that too much?”</i> It resumes rubbing you very gently, barely using too beckoning fingers along the underside. <i>“I don’t get much practice with breeding prongs I’m afraid, sweet morsel,”</i> it whispers into your ear. Another finger curls around your chin, traces your [pc.lips]. <i>“I do sometimes catch nyrea, but those warrior women are so rough! And prodigious. Whereas you...”</i> It wraps its fingers around your prick and squeezes, slowly rising its grip up. You take a whistling gasp, arching your back to the intensity of it. <i>“...are so sensitive. So precious. I will learn much from this.”</i>");
			output("\n\nIts thin, skillful fist shakes tenderly, its grip tightening... then softening, tightening... then softening, tidal sensation that causes your helpless arousal to rise, all focused intently into that small, sensitive point on your body. You close your eyes, completely lost in the motion, the quadomme’s voice murmuring in your ear...");
			output("\n\n<i>“Are all of your kind’s drones so tinily hung? Do your queens also have very small breed chambers? Or do they simply put up with the lack of sensation? I can only imagine that it makes you very easy to control.”</i> As it continues to jerk you, it extends another hand and gently circles your [pc.cockHead " + cIdx + "] with one, long finger, a roving point of intense pleasure on your small, bulging tenderness. You moan softly, excitement rising helplessly, and it laughs softly. <i>“See? You’d do anything for that, wouldn’t you? And it’s not as if you’re going to turn any worker’s head with a prong <i>that</i> size. Yes, you will make a fine, obedient addition to a harem, some day...”</i>");
			output("\n\nYou can’t help it. Your fists clutch up as you cum, your [pc.hips] thrusting helplessly to spout [pc.cum] out into the air, your " + (pc.balls > 0 ? "[pc.balls]" : "shaft") + " throbbing with ecstasy, caught in that sumptuous lattice of shifting latex.");
			if(pc.cumQ() >= 500)
			{
				output(" The quadomme coos and then laughs softly in surprise as you flume ropes of [pc.cumVisc] seed up to eye level again and again, your boy clit working overtime to flex out your oversized reserves.");
				output("\n\n<i>“My word,”</i> it says, not slowing its jerking down for a moment, <i>“what an impressive amount of protein! A sensitive, juicy toy like you could easily be used as a snack dispenser for the rest of my harem.”</i>");
			}
			else
			{
				output(" It smirks at the modest amount of [pc.cumVisc] seed that you desperately thrust outwards. In some vague way you were hoping you could impress the large alien at least some way, but you’re quickly down to oozing it over its fingers.");
				output("\n\n<i>“Yes,”</i> it says, not slowing its jerking down for a moment, <i>“you squirt rather than cum really, don’t you? I am no expert of course, but it’s difficult to imagine that knocking any queen up. I’m right, aren’t I? You belong to someone who breeds </i>you<i>, not the other way around.”</i>");
			}
			output("\n\nIt doesn’t stop firmly masturbating you, clamped firmly around you and wrist hard at work, until you are achingly dry, each heaving clench of your [pc.cock " + cIdx + "] producing nothing at all. You slump backwards, heart pounding, supported by the pair of arms wrapped around your shoulders. Another hand soothingly crosses your sweaty brow and strokes your jaw; the other whips away the [pc.cum] adhered to it with a fastidious flick.");
			output("\n\n<i>“You enjoyed your reward, didn’t you, brave warrior?”</i> it coos in your ear. You’re too hazy - and frankly embarrassed - to respond. It pats you on the cheek, and then slowly rises away, trailing its fingers up your body as it reels itself back towards its tunnel. <i>“There will be plenty more like it waiting for you. One day...”</i>");
			output("\n\nIts teasing voice fades away into the darkness. You quickly gather your [pc.gear] and strike off. You try and put out of mind how shamefully pleasurable that was - however the satisfied ache in your groin serves as a steady reminder.");
			output("\n\n");
			
			processTime(15);
			IncrementFlag("BOTHRIOC_QUADOMME_SEXED");
			pc.orgasm();
			
			bothriocQuadommeToMainMenu(true);
			break;
		case "small dick no":
			output("<i>“Oh, very well,”</i> the quadomme sighs wearily. It turns itself around so both its anus, nestled between its back thighs, and the gleaming, purple opening of its insect abdomen are facing your way. <i>“Just let me know when you’re done, alright?”</i>");
			output("\n\nWhere is this spidery snot getting its descended-from-the-heavens attitude from? You kicked its ass, and now it’s putting on airs! You’ll show this insect exactly what ‘It’s what you do with it that counts’ means!");
			output("\n\nThe upside-down quadomme murmurs when you roughly clap your hands on its waist, but it doesn’t sound unduly worried as you finger the warm, black wrinkle between its back thighs, nor the oily, purple opening at the top end of its spider-butt. Those are all tempting options to your [pc.cock " + cIdx + "], eagerly hard and ready to go, but more importantly they are clearly options the tall being <i>wants</i> you to pick. Your hands shift upwards, tracing the smooth, black curve of its abdomen as you think. What would you do if you really wanted to stick it to - ? Ah. Aha.");
			output("\n\nYour fingers alight on a spinneret, one of six plump buds on the creature’s arachnid underside that produces the devilish sticky silk that hangs in ghostly curtains all around. You stroke and pinch at it prospectively, and are immediately rewarded with a shiver and a grunt from the creature.");
			output("\n\n<i>“What are you doing?”</i> it asks fretfully, trying to peer around its bulk. <i>“Leave them alone!”</i>");
			output("\n\nYou quickly move inwards, grasping its abdomen and pulling downwards, shoving the quadomme’s upper body down into the dirt. For all its alienness, the giant abdomen feels great to touch - the surface is hard and smooth as the latex it so closely resembles, but underneath there’s a great deal of warm squishiness that all but cries out for a good squeeze. So that’s what you do, whilst rubbing your [pc.cock " + cIdx + "] over the sensitive little bud you’ve discovered. You groan as delightful sensation nibbles up your small shaft, making it thicken. Even better, you see the action makes the spinneret’s entrance widen, enticed by the friction. Giddy now, you carefully line yourself up with it.");
			output("\n\n<i>“S-stop doing that! Don’t be - so weird! Foul decadence from beyond the stars!”</i> utters the quadomme, scrabbling in the dirt, its long legs flailing weakly above you. For all its alarm, you can’t help notice that it’s keeping its protestations quiet.");
			output("\n\n<i>“Aww, what’s the matter, big brave warrior?”</i> you crow. You thrust inwards, your [pc.cock " + cIdx + "] is submerged in tight, sticky warmth and the creature’s struggles intensify. <i>“You worried your harem will hear us? It’d be terrible if this tiny-cocked " + pc.mf("drone", "worker") + " gave them some ideas, wouldn’t it!”</i>");
			output("\n\nYou hold tight to the quadomme’s bulk and clap your [pc.hips] into its black carapace, thrusting your small cock in and out of its itsy bitsy hole. It’s glutinous in there, but you can easily pull yourself out from it, creating a wonderful feeling of warm drag along the tender hardness that quickly makes heat draw into your groin");
			if(pc.balls > 0) output(", your [pc.balls] tightening up");
			output(". From the way the bothrioc twitches, curses and flails, upside down and helpless in its web, the spinneret is clearly very sensitive - but you get the impression, from the tone of its gasps, that what you’re doing isn’t exactly painful. That impression is affirmed when a trailer of clear fluid making its way down its underside, emitted from the opening at the top, catches your attention.");
			output("\n\n<i>“Are you enjoying this, spider bitch?”</i> you tease. Cock still deep inside the spinneret, you dip your fingers in the pot of warm oil at the top of its abdomen, swirl around the tip of its ovipositor before working it into one of the many other plump little web-spinners you can see on the underside.");
			output("\n\n<i>“Fuck - you! Fuck - you! Fuck - you!”</i> the quadomme grits in response, each word punctuated by an excited clap of your thighs against its black carapace. The spinnerets suddenly dilate and disgorge streamers of sticky silk, including the one you’re fucking. Gluey white warmth is painted across your [pc.chest] and spurts out around your narrow shaft, plastering itself to your groin, and you find yourself well and truly stuck to the bothrioc just as your [pc.cock " + cIdx + "] tenses up and you feel your seed inexorably rise.");
			output("\n\nPulse thudding in your temple, you hammer your [pc.thighs] into that gloriously tight mound, and when you discover no matter how hard you bounce backwards your cock doesn’t come loose you do it even harder. A delighted groan escapes your lips as hot [pc.cumNoun] shoots up your sensitive shaft and infuses the spinneret with [pc.cumVisc] love, your orgasm made giddy and gratuitous by the sheer force you’re able to put into it with shivering thrusts of your hip, utterly stuck to the writhing, cursing bothrioc.");
			output("\n\nIt’s only after about the eighth glorious pump that you feel something give around your flexing prick, and you are able to pull loose. Recovering your breath and looking downwards, you see why - you’ve absolutely <i>ruined</i> that spinneret. The once plump and pert mound now hangs open loosely, drooling [pc.cum] and unspooled silk in equal measure.");
			if(!pc.isAss()) output(" A slight pang that you might have gone too far is swiftly reassured by the knowledge the quadomme absolutely has someone to kiss it better.");
			else output(" You smirk. Oh well. You know for a fact the quadomme has someone to kiss it better.");
			output("\n\n<i>“Whew!”</i> you say out loud, clapping the creature on the pale backside, making it jerk again. <i>“I’m done now. You and the big, brave warrior should do this again, y’know? You </i>do<i> have five more of those things.”</i>");
			output("\n\n<i>“Such sparkling wit I surely would never have experienced if farlanders hadn’t started trampling around my territory,”</i> snaps the quadomme, looking over its shoulder at you with tired loathing. <i>“Feel free to take your taste in humor back to where you came from.”</i>");
			output("\n\nIt sullenly spins itself in back towards its hole whilst you put your [pc.gear] back on, enjoying a glow of smug, throbbing satisfaction.");
			output("\n\n");
			
			processTime(16);
			IncrementFlag("BOTHRIOC_QUADOMME_SEXED");
			pc.orgasm();
			
			bothriocQuadommeToMainMenu(true);
			break;
		case "ride ovi":
			vIdx = pc.findEmptyPregnancySlot(1);
			if(vIdx < 0) vIdx = rand(pc.vaginas.length);
			if(pc.hasCock()) cIdx = rand(pc.cocks.length);
			
			output("Your eyes climb up to the creature’s giant, teardrop-shaped abdomen. Clad in its gleaming carapace, so much like black latex to the eye, it looks nothing so much as a particularly bizarre piece of BDSM gear, inextricably clamped to its owner. Packed tight with sexual urge, it forces the bothrioc’s rapacious instincts on, as much a sexual punishment as a weapon.");
			output("\n\n<i>“Enjoying the view?”</i> it asks irritably, still gently swinging in its nets like a pendulum coming to rest. <i>“I submit, farlander. Unless you’re going to raise your rump for me out of the goodness of your heart, please leave me in peace.”</i>");
			output("\n\nYou silently rip your [pc.gear] off, brushing your fingers over your mound, holding the quadomme’s tar-black eyes steadily.");
			output("\n\n<i>“On the ground, beast,”</i> you order. <i>“And - what did you just say? - raise your rump.”</i>");
			output("\n\nThe spidery creature looks stunned, as if you just slapped it across its sculpted cheeks, but after a moment it obeys. A slight shiver courses through you as you watch its eight chitinous limbs work in concert to turn itself around and disengage its long body from its web. That eerie, insectile motion makes a part of you bleat in fear, orders you to run - but other parts of you thrill that it obeys your order, that all of those gleaming back thighs and arms, that snow-white chest and neck, move according to how you desire.");
			output("\n\nIt looks uncertain as it faces you and bends all four legs, slowly sitting back on its abdomen so that its wet, purple tip does indeed rise, so you step forward to do some encouraging. It gasps slightly as you abruptly sit your [pc.butt] down just south of that tempting, oily nexus and give the miles of gleaming black carapace a brusque slap, one that turns into a questing fondle. The big, nubby pores that are its spinnerets stick slightly to your hands as they move over them, testing the squishy, shifting warmth that lies beneath that harsh, domineering veneer. It’s fun and gross to fondle in equal measure, so you do it some more, grinning as you watch the quadomme’s white, humanoid body shudder slightly in response, that befuddled expression on its face apparently frozen there.");
			output("\n\n<i>“Why are you doing that?”</i> it asks. <i>“That’s not yours to do with as you - wish...”</i> It trails off in a whispery sigh as you bend your hand down between the gap of two legs, stroke a soft, deceptively human-like inner thigh. Something warm and wet seeps into your butt-crack, and you shoot a look over your shoulder. Its abdominal opening is dilated and drooling clear oil freely, the very tip of its purple ovipositor poking out. Relative to the size of its bug butt, that thing must be massive - and bumpy besides.");
			output("\n\nA delighted shiver runs through you at the lusty perversity of it, and you quickly scoot yourself backwards, sighing as smooth, oily bumps sending wonderful little tremors into [pc.eachVagina], until you’re perched upon the summit, its soft, wet lips pressed upon yours, the warm slipperiness of its egg cock pulsing against the entrance of your [pc.vagina " + vIdx + "].");
			output("\n\n<i>“That thing of yours does so belong to me, beast,”</i> you say imperiously. <i>“You want me to beat your ass again to prove it?”</i> You dig your [pc.hips] into those warm, squishy sides, making it tap all four of its stiletto feet on the ground in an agony of ecstasy, and the tip of its ovipositor shoots upwards, sliding into the softness of your cunt, the first bulging bump of its stem stretching you out. You hiss at the delight it sends coursing into your core, your [pc.vagina " + vIdx + "] " + (!pc.isSquirter() ? "moistening" : "drizzling") + " [pc.femcum] in ready response even as the insertion recedes. <i>“You can do that without me making you, can’t you?”</i> you groan, pressing your hands into its abdomen. <i>“Go on...”</i>");
			output("\n\nThe quadomme’s lithe, flat chest rises and falls, rises and falls, as it slowly slots that wonderful, lumpy ovipositor further inwards, drawing itself out only to quest deeper into your passage with its next slow thrust. Its oil drools freely down your [pc.thighs], and a wonderful soft, sensuousness begins to radiate out from your groin, [pc.eachVagina] loosening and moistening in a rosy swelter, making it an easy task to swallow up this thing’s thick egg cock and increasing your eagerness to pack as much of it inside you as possible.");
			
			pc.cuntChange(vIdx, enemy.cockVolume(0));
			
			output("\n\nSphere after sphere disappears inside you, making the");
			if(pc.vaginas[vIdx].type == GLOBAL.TYPE_SIREN) output(" tentacle-lined");
			else if(pc.vaginas[vIdx].hasFlag(GLOBAL.FLAG_NUBBY)) output(" nubby");
			else if(pc.vaginas[vIdx].hasFlag(GLOBAL.FLAG_RIBBED)) output(" ribbed");
			else output(" smooth");
			output(" walls of your [pc.vaginaNoun " + vIdx + "] undulate around the three-inch-thick insertions, and already you’re gasping with incoming orgasm, bouncing your [pc.butt] upon the bothrioc’s abdomen with increasing urgency.");
			output("\n\n<i>“I can’t believe you’re doing this,”</i> gasps the quadomme, thick thighs jerking, black eyes dancing up and down your body. <i>“Prey creatures shouldn’t act like this! It’s - wrong, it’s...”</i> You can hear and see the naked lust, even transmitted in a voice and face as alien as the bothrioc’s. High approaching, you dig your [pc.hips] into the smooth carapace even harder, grab two thick thighs and use them as handles to work that soaked, bulbous member even harder.");
			output("\n\n<i>“Say it,”</i> you grit.");
			output("\n\n<i>“...really hot,”</i> whispers the quadomme, entranced. Your [pc.vagina " + vIdx + "] ripples deliciously around the thick intrusion it’s wrapped around, and gasps of delight escape your [pc.lips] as spasms of pleasure rack your frame");
			if(pc.isSquirter()) output(", [pc.femcum] spurting freely down your [pc.legOrLegs]");
			if(pc.isSquirter() && pc.hasBreasts()) output(" and");
			else if(pc.hasBreasts()) output(",");
			if(pc.hasBreasts()) output(" your [pc.boobs] bouncing around merrily");
			output(".");
			output("\n\nYou come down leisurely, still stirring the well-extended ovipositor within you, murmuring at the little darts of sensation you get as you bend it into your tender walls.");
			output("\n\n<i>“Little m- farlander,”</i> susurrantes your lithe, spidery bottom, arching its back and closing its eyes as you continue to use it. The squishiness in its abdomen shifts beneath you, its tightly packed cargo of eggs that your every movement is tormenting. Yet more oil seeps into your pussy, and you coo as you are bathed in yet more warmth and sexual bliss. It reaches its lower pair of thin, chitin-clad arms out to you pleadingly. <i>“May I be rid of my burden now? You have enjoyed me, have you not? I would dearly like to breed a being as strong and assertive as you...”</i>");
			
			processTime(14);
			pc.orgasm();
			
			// If vag already preg
			if(pc.isPregnant(vIdx))
			{
				output("\n\nYou laugh, and pat your [pc.belly].");
				output("\n\n<i>“Not very observant, are you?”</i> Its long, elegant face falls.");
				output("\n\n<i>“Perhaps your kind naturally have curved stomachs! How am I to know,”</i> it grumbles. You shut it up by taking a firm grip of its proffered wrists and begin to assertively rut it again, commanding it to extend its ovipositor as far as it possibly can this time as your lust begins to rise again.");
				output("\n\nIt does so with a defeated moan, its denied egg-cock stretching you out as it packs every inch of your [pc.vagina " + vIdx + "]. The vast quantities of bothrioc oil your nether-parts have been slathered in have done a wonderful job of relaxing and softening your breeding bay so that you have no problem slipping more and more of that throbbing, bulbous stalk inside of you, and when it presses its supple tip against your cervix you feel no pain. Not that this slut is getting any further, of course.");
				output("\n\nFive minutes of luscious riding, your pleasure ratcheting up tighter and tighter, is all you need to reach yet another glorious high, the relaxed warmth intensifying into a tropical summer that blazes erotic sensation through you. You " + (pc.hasFuckableNipples() ? "finger" : "pinch") + " your [pc.nipples] and brush your ");
				if(pc.hasHair()) output(" [pc.hair] and");
				output(" face as it hits, delighting in the extra sensitivity the oil has burnished you with, [pc.eachVagina] flexing up around the lustrous egg-cock again and again. The quadomme just has to take it, gritting its teeth, writhing its sinuous body and stamping its stilettos in purest frustration.");
				output("\n\nYou part from it with a blissed out sigh, [pc.lips] parting as great quantities of warm, clear lubricant oozes out over of your tender lips and [pc.clit " + vIdx + "]. As much as you’d like to just lie there and enjoy the pheromone-enhanced afterglow, though, it’s probably not a good idea to let this thing gather its strength and get any ideas. Lying next to its bulging abdomen reminds you just how pent up you’ve made it.");
				output("\n\n<i>“You’re a cruel creature, farlander,”</i> it says, gradually getting to its feet and reaching up to its webs, watching you as you briskly wipe yourself down and put your [pc.gear] back on. <i>“A cruel and... fascinating creature.”</i> It grins the fanged, face-splitting grin of a bothrioc at you. <i>“I do hope you’ll come this way again. Who knows how things will work out next time, hmm?”</i>");
				output("\n\n");
				
				processTime(5);
				IncrementFlag("BOTHRIOC_QUADOMME_SEXED");
				
				bothriocQuadommeToMainMenu(true);
			}
			else
			{
				clearMenu();
				addButton(0, "Let It", bothriocQuadommeSexScenes, ["ride ovi let it", addiction, vIdx, vIdx2, cIdx, cIdx2], "Let It", "");
				addButton(1, "Deny It", bothriocQuadommeSexScenes, ["ride ovi deny", addiction, vIdx, vIdx2, cIdx, cIdx2], "Deny It", "");
			}
			break;
		case "ride ovi deny":
			output("You reach out and curl your fingers into the quadomme’s, smiling, teasing it with the possibility for a couple of moments... and then you pull back to grip it tightly by the wrists, jerking its lithe body towards you.");
			output("\n\n<i>“Keep those damned eggs to yourself,”</i> you growl, looking it dead in the eye. <i>“This is about MY pleasure, not yours.”</i>");
			output("\n\n<i>“You are... so cruel...”</i> it moans raggedly. You shut it up by assertively rutting it again, commanding it to extend its ovipositor as far as it possibly can this time as your lust begins to rise.");
			output("\n\nIt does so with a defeated whine, its denied egg-cock stretching you out as it packs every inch of your [pc.vagina " + vIdx + "]. The vast quantities of bothrioc oil your nether-parts have been slathered in have done a wonderful job of relaxing and softening your breeding bay so that you have no problem slipping more and more of that throbbing, bulbous stalk inside of you, and when it presses its supple tip against your cervix you feel no pain. Not that this slut is getting any further, of course.");
			output("\n\nFive minutes of luscious riding, your pleasure ratcheting up tighter and tighter, is all you need to reach yet another glorious high, the relaxed warmth intensifying into a tropical summer that blazes erotic sensation through you. You " + (pc.hasFuckableNipples() ? "finger" : "pinch") + " your [pc.nipples] and brush your");
			if(pc.hasHair()) output(" [pc.hair] and");
			output(" face as it hits, delighting in the extra sensitivity the oil has burnished you with, [pc.eachVagina] flexing up around the lustrous egg-cock again and again. The quadomme just has to take it, gritting its teeth, writhing its sinuous body and stamping its stilettos in purest frustration.");
			output("\n\nYou part from it with a blissed out sigh, [pc.lips] parting as great quantities of warm, clear lubricant oozes out over of your tender lips and [pc.clit " + vIdx + "]. As much as you’d like to just lie there and enjoy the pheromone-enhanced afterglow, though, it’s probably not a good idea to let this thing gather its strength and get any ideas. Lying next to its bulging abdomen reminds you just how pent up you’ve made it.");
			output("\n\n<i>“You’re a cruel creature, farlander,”</i> it says, gradually getting to its feet and reaching up to its webs, watching you as you briskly wipe yourself down and put your [pc.gear] back on. <i>“A cruel and... fascinating creature.”</i> It grins the fanged, face-splitting grin of a bothrioc at you. <i>“I do hope you’ll come this way again. Who knows how things will work out next time, hmm?”</i>");
			output("\n\n");
			
			processTime(5);
			IncrementFlag("BOTHRIOC_QUADOMME_SEXED");
			
			bothriocQuadommeToMainMenu(true);
			break;
		case "ride ovi let it":
			if(addiction >= 50) output("You’ve been teasing the dominant ruthlessly - the proud beasts need that from time to time, in your opinion - but it was always your intention to plump your body out with a fresh, glorious batch of eggs. As soon as it makes its plea you favor it with a big grin, twine your fingers with theirs and urge it on with juicy pumps of your [pc.hips].");
			else output("Oh, well... why not? It looks so piteous and needy when it looks at you that way, and it must be pretty agonizing to be teased with this way when you’re carrying so many eggs. You give it a grin, teasing it a bit longer, that signal your assent by twining your fingers with theirs and urging it on with juicy pumps of your [pc.hips].");
			output("\n\nA glorious, gratified moan escapes its plated lips and it holds you tightly as it reaches deep inside of you, easily opening your cervix and filling every inch of your breeding bay with thick, bulbous ovipositor. Its pressure is such that it begins to ejaculate eggs into you almost immediately, round swelling weight after round swelling weight cramming into you. Your eyes cross and you cum brilliantly, your flexing, " + (!pc.isSquirter() ? "dribbling" : "gushing") + " cunt coaxing it on, practically inhaling the fertilized bothrioc young into your waiting womb. The two of you thrash into each other, insensate with lust, until your [pc.belly] is round and thick with smooth, shifting weight.");
			output("\n\nNerveless, you collapse forward onto the warm, sheer chitin, head resting between two hefty, white-skinned thighs, utterly blissed out on the sensation throbbing through you, stretched out with eggs and softened with oil. Long, spidery digits play with your [pc.hair] and [pc.ears].");
			if(addiction >= 50)
			{
				output("\n\n<i>“What a strange egg-bearer you are,”</i> it says, at the end of a long, gratified sigh. <i>“Forcing yourself upon me and </i>making<i> me breed you?”</i> It tightens its grip on your neck and pulls you closer to its mouth. <i>“I like it a lot. No pidemme I own would think to play with me in such a way. You will be the prize of my harem - once your priorities have been reordered a little bit.”</i> It laughs quietly, and brushes you off it. <i>“You run along now, brave farlander. Let those eggs do their thing... and then come find me again.”</i>");
				output("\n\nYeah. Definitely. You peacefully watch the quadomme climb gracefully back into its tunnel, a balm of satisfaction spreading over your mind when you see by just how much you’ve shrunk its abdomen. Nothing but contentment fills you as you put your [pc.gear] on and carry on your way, one hand absent-mindedly rubbing your bulging gut.");
			}
			else
			{
				output("\n\n<i>“Thank you for that, farlander,”</i> it says, at the end of a long, gratified sigh. <i>“Your ways certainly are strange, but you are a generous creature at heart.”</i> It delicately pulls you a bit further up its body, so that your [pc.ear] is a bit closer to its mouth. You’re too fucked to resist. <i>“That generosity will stand you in good stead, soon enough,”</i> it whispers. <i>“You run along, dream deep in the oil and bear my children, until those harsh edges of yours are all softened down. Then come see me again. All of these spirited little victories of yours shall make the day you become my prize boot-polisher all the sweeter.”</i>");
				output("\n\nYou’d come up with a stinging rejoinder, but you really cannot summon the strength. You watch the quadomme climb gracefully back into its tunnel, before clambering upright with a woozy groan. Perhaps letting it breed you wasn’t such a great idea? But it’s very difficult to hold onto that thought when you’re feeling so content, so out-of-focus. You put your [pc.gear] back on and carrying on your way, peacefully rubbing your bulging gut.");
			}
			output("\n\n");
			
			processTime(8);
			IncrementFlag("BOTHRIOC_QUADOMME_SEXED");
			pc.loadInCunt(enemy, vIdx);
			
			bothriocQuadommeToMainMenu(true);
			break;
		case "nice orgy":
			if(pc.hasVagina())
			{
				vIdx = 0;
				if(pc.vaginas.length > 1) vIdx2 = (1 + rand(pc.vaginas.length - 1));
			}
			if(pc.hasCock())
			{
				cIdx = 0;
				if(pc.cocks.length > 1) cIdx2 = (1 + rand(pc.cocks.length - 1));
			}
			
			output("You break into a big, lusty beam. That sounds like a truly excellent reward for all your recent exertions!");
			output("\n\n<i>“Alright then spider-person, show me your toy box,”</i> you say, stepping forward. <i>“No funny business, though.”</i>");
			output("\n\nThe quadomme reaches down and clasps you with its four smooth, sheer black arms, and after gathering itself a little, works the weave of sticky silk above with its legs to begin reeling the two of you away from the ground. When the total darkness of the tunnel above envelopes you, and you continue to be hoisted ever upward, you have a few moments to feel trepidation - this was a really obvious trap your");
			if(cIdx >= 0) output(" dick");
			else if(vIdx >= 0) output(" pussy");
			else output(" butt");
			output(" has walked you right into, right? - before you emerge into a lit, spacious cave. It’s surprisingly well furnished: elegant carpets cover the flat, smooth floor and walls, there’s weird, spindly furniture, and ghostly lights hang from the ceiling by silk filigrees. Other... things... also dangle from the ceiling.");
			output("\n\n<i>“Time-outs,”</i> explains the quadomme, catching where you’re looking. It strokes the line of a hip discernible on one of the mummified, human-sized bundles; it moans softly.");
			
			var numPidemme:int = 2 + rand(5);
			var numGoldMyr:int = 1 + rand(3);
			var numRedMyr:int = 1 + rand(3);
			
			output("\n\nOther haremlings appear, from the numerous tunnels running off this room, eagerly greeting the return of their owner. They are all shapes, sizes and colors, but they all have several things in common: they’re mostly naked, they’re all slightly swollen, and all have an unfocused, happy expression on their faces. Altogether, there’s " + num2Text(numPidemme) + " pidemme bothrioc, " + num2Text(numGoldMyr) + " gold myr, and " + num2Text(numRedMyr) + " red myr.");
			output("\n\n<i>“Egg-giver! You have returned! Oh, you look so " + (enemy.HP() <= 0 ? "disheveled" : "agitated") + "! Have you been satiated? Who is this?”</i> The quadomme waits, a straight-backed teacher in a classroom, until the excited clamor has died down.");
			output("\n\n<i>“This is a farlander who is visiting our domain,”</i> it says at last. <i>“In [pc.his] culture, [pc.he] is of egg-giving status, a great and virtuous warrior. I saw [pc.his] feats for myself, and was impressed.”</i>");
			output("\n\nAn awestruck <i>“Ooooohhhhhh”</i> echoes around the cavern to this, many admiring, pupil-less eyes turning to you.");
			output("\n\n<i>“[pc.He] is our honored guest,”</i> the quadomme smiles, sliding its fingers into the hair of the two pidemme closest to it. <i>“So you will show [pc.him] the hospitality that [pc.he] is due, won’t you, little ones?”</i>");
			output("\n\nMany cushions wrought and stuffed with dried silk are hurried over, and you are insisted down into the middle of them; a large, snail-like shell filled with something rather like mead is pressed into your hand. A pidemme and a gold myr squeeze into your sides, warm hands trailing down your [pc.thighs], as they ask questions about the ‘farlands’. Two more hands rub your shoulders, making the tension there melt away, as you spin tales of the sights you’ve seen and the things you’ve done. Your dullest bon-mot is met with awe and excited follow-up questions. You sip your mead.");
			if(!pc.isCrotchExposed()) output(" At some point your [pc.lowerGarments] disappear, probably around the time you were answering the gold myr’s question about whether there are aliens with boobs as big as hers by chewing on a sweet, protuberant, delightfully sensitive nipple. It all seems like a natural series of progressions.");
			output("\n\nWhilst your pampering has been going on, the quadomme has matter-of-factly drawn one of the other pidemmes aside, woven its hands behind its back, and then thrust its huge ovipositor into the servant’s own abdominal opening, draining it of its oil with one hefty pump after another. The pidemme is insensate with pleasure from it, mouth hanging open and writhing in its binds. The atmosphere in the quadomme’s mini-fiefdom seems to slip from peaceful industry to intense eroticism as the quadomme itself wills it, which makes sense given the creature’s runaway appetite and its harem’s profound desire to please.");
			
			// If PC meets multiple requirements below randomise it so they may get something different on repeat
			var eventList:Array = [];
			var msg:String = "";
			
			if(cIdx >= 0)
			{
				msg = "";
				msg += "\n\nSeveral of them urge you to go on talking about your adventures as one of the pidemme slips between your thighs and wraps their thin, warm fingers around your [pc.cockNoun " + cIdx + "], quickly tugging you to a full-blown erection before kissing and licking at the [pc.cockHead " + cIdx + "]. It’s ardently but clumsily done - the piebald creature clearly has next to no experience with such an appendage - and for a little while longer you’re able to go on regaling your audience with tales of the Great Beyond as rough warmth is rubbed and tickled into your cock. That stops when one of the myr, impatient that her peer is having all the fun, descends too and fights lip-to-lip for the right to pleasure your [pc.cockNoun " + cIdx + "].";
				if(cIdx2 >= 0) msg += " Fortunately you come equipped for this exact situation, and after a few groaned directions, you’ve got the pidemme’s smooth, armored lips latched onto your [pc.cock " + cIdx + "], the myr’s pulpy, wet counterparts eagerly moving up and down your [pc.cock " + cIdx2 + "].";
				if(pc.cLength(cIdx) >= 36) msg += " Fortunately when it comes to your massive fuck-pole there’s plenty to go around for two petite subs like them. It only takes a few murmured directions for them to be working a thick, bulging side each, their wet mouths smooching and slithering up and down your huge shaft until the thing gleams with worship.";
				if(vIdx >= 0) msg += " You defuse the situation by opening your thighs up a bit more, direct one of them to move further inward. Soon enough you’ve got the pidemme’s smooth, armored lips latched onto your [pc.cock " + cIdx + "], the myr’s pulpy, wet counterparts eagerly pressing into your [pc.vagina " + vIdx + "], sloppily making out with your [pc.clit " + vIdx + "].";
				else msg += " It swaps back and forth between the smoothness of the pidemme’s mouth and the sponginess of the myr’s and it’s all a bit hard to take for one, simple cock; you tighten your grip on the soft, pleasant flesh of the haremlings around you as your ardor ratchets up.";
				msg += "\n\n<i>“Go ahead,”</i> husks the voice of the shoulder-rubber. <i>“Let it all out. Let us taste you, honored warrior.”</i>";
				msg += "\n\nThe pressure building in your " + (pc.balls > 0 ? "[pc.balls]" : "loins") + " under the two dick-suckers’ ministrations are too much to bear any; you cum with a hoarse shout, shooting gobbets of [pc.cum] into the still, sultry air.";
				if(pc.cumQ() > 1000) msg += " They start and cry out in surprise themselves when you spraying their faces with the first of many massive loads, but the will to please quickly takes over, and they go back to coaxing you along with tight squeezes of their fingers and slides of their tongue, swallowing down a fair amount of [pc.cumFlavor] goodness, adoring eyes fixed upon your ebullient face all the while.";
				else msg += " They may not be used to penises, but they clearly are to gushes of sexual fluids, and they skillfully swallow and lick away every drop of semen as you clench it out, adoring eyes fixed upon your ebullient face the entire time.";
				msg += "\n\nThe moment you collapse back into the pile of cushions, groin throbbing, the shoulder-rubber wraps their arms around you and fastens her teeth into your neck. A new surge of lust enters you, energizing your limbs, the red myr venom now coursing in your veins making you crave the soft, naked flesh you’re surrounded with all the more. The haremlings laugh with delight as your [pc.cockNoun " + cIdx + "] bobs back upward as well; darkened, veiny and just as eager for more.";
			}
			else if(vIdx >= 0)
			{
				msg = "";
				msg += "\n\nSeveral of them urge you to go on talking about your adventures as one of the pidemme slips between your thighs and layers kisses upon your inner thighs, before moving into [pc.eachVagina], lasciviously tonguing your folds onto they swell and part, enabling it to move further and further into your tender flesh. It clearly gets a lot of practice with its pussy-bearing peers, because it’s not at it for long before continuing to talk becomes impossible, the shimmering waves of lust emanating from your groin robbing you of cogent words. Lustily you grip the two pressed into you, trailing your [pc.tongue] over their bare, salty flesh, eager to cram as much sensuality into the moment as possible.";
				if(vIdx2 >= 0) msg += " The pidemme between your thighs parts company with your [pc.clit " + vIdx + "] to babble eagerly about just how many delightfully wet breeding holes the farlander owns, and a myr quickly forces her way down there as well, lapping happily at your [pc.vagina " + vIdx2 + "] whilst the pidemme continues a sloppy make-out with your [pc.vagina " + vIdx + "].";
				msg += "\n\nYou cum wonderfully, thrusting [pc.eachVagina] into the curling, slippery joy of the haremling" + (vIdx2 < 0 ? "" : "s") + " mouth" + (vIdx2 < 0 ? "" : "s") + ", smearing " + (vIdx2 < 0 ? "its" : "their") + " face" + (vIdx2 < 0 ? "" : "s") + " with [pc.femcum] with one trembling jolt after another. " + (vIdx2 < 0 ? "It" : "they") + " continue" + (vIdx2 < 0 ? "s" : "") + " to lap at you the entire time, adoring eyes fastened upon your hot, jubilant face. The moment you collapse back into the pile of cushions, the shoulder-rubber wraps their arms around you and fastens her teeth into your neck. A new surge of lust enters you, energizing your limbs, the red myr venom now coursing in your veins making you crave the soft, naked flesh you’re surrounded with all the more.";
				eventList.push(msg);
			}
			if(vIdx >= 0)
			{
				msg = "";
				msg += "\n\n<i>“Here, farlander.”</i> The quadomme strides through the morass, directing its harem with practiced pushes and flicks of its fingers. <i>“Try this one. They are very good at keeping their cool, and they deserve a treat. What do you say?”</i>";
				msg += "\n\n<i>“Thank you, egg-giver...”</i> sighs the pidemme, as the quadomme pushes them down into a kneeling position with a stiletto heel to the back, their round backside and plump black abdomen in the air. You watch, slumped in the cushions whilst your little crowd of supplicants kiss and fondle your neck and [pc.chest], whilst the quadomme teases the chosen pidemme’s purple abdominal tip with knowing strokes of long, black fingers until it is fully dilated and their bright pink ovipositor is reaching outwards, inches of thick, oily, bulbous member craning towards the ceiling.";
				msg += "\n\nYeah... actually that does look like fun. You get up, [pc.move] across and replace the quadomme, sharing a grin with them as you flare your [pc.hips] and slowly sit yourself down on the pidemme’s bumpy, lubricant-slathered egg-dick, your already well-aroused [pc.vagina " + vIdx + "] easily and eagerly enveloping it into its tender embrace. The crouching pidemme moans with joy, heavy amounts of oil oozing out over your labia and [pc.clit " + vIdx + "], and you sigh yourself as a wonderful feeling of tranquility floods through your groin, inner muscles relaxing to allow you to push the hard, bumpy phallus even further upwards, pleasure trembling through you.";
				msg += "\n\n<i>“No eggs,”</i> the quadomme orders sternly, <i>“and hold yourself steady whilst [pc.he] makes use of you. Thaaaat’s it,”</i> it murmurs, pleased, as you sit yourself down fully, [pc.ass] meeting burnished carapace. <i>“Now, let me find some other toys to amuse you with...”</i>";
				msg += "\n\nYou jerk slowly backward and forward on your insectile mount, closing your eyes and biting your [pc.lips] as sumptuous pleasure nibbles right up your fuck tunnel. It’s impossible to tell if you’re really wet or the bothrioc is absolutely gushing oil in response to your movements - it’s just a small cascade of juices streaming down over your [pc.clit " + vIdx + "] and the kneeling, softly moaning pidemme’s carapace. You open your eyes to behold the fine sight of a jiggly, bonny gold myr, smiling coquettishly, the thin black fingers of the quadomme on their shoulders. You share a long, passionate kiss with her, her wonderfully full, honey-plush tits pressing into your [pc.chest], and then she turns around, earnestly proffering the oozing, orange vagina at the tip of her own abdomen.";
				msg += "\n\nStill stirring yourself with the knobbly ovipositor, you grip the warm, plump abdomen and hungrily avail yourself of it, lapping at the gold myr’s entrance until it’s dilated and sopping with honey before shoving your [pc.tongue] deep, making her squeal and tighten around you delightfully. Her high, vocal enjoyment of your oral efforts are soon muffled though, because the quadomme is soon stood over her and matter-of-factly stretching her lips wide with its own, giant ovipositor, whispery sighs of pleasure ghosting through the air.";
				msg += "\n\nThe sugar rush from the honey dancing on your taste buds combines with the pheromone-laden oil you’re busy absorbing to create a soaring sexual buzz, every cell in your body seeming to dilate, and you descend utterly into fucking monster-dom. You cum brilliantly to the reaching, bulky egg-cock pumping into your [pc.vagina " + vIdx + "], all the while eating the gold myr’s box so hard her four hands slap at the quadomme’s hard carapace in spontaneous, agonized joy... and then you’re out, eagerly and drunkenly gripping a red myr to you reaching your [pc.thigh] over her, your sweat-slicked [pc.belly] sliding over her slightly bulging tummy, slapping your oil-slicked pussy into hers. She bites you passionately, another fresh surge of lust enters you, and you are greedily grabbing at the horde of laughing, endlessly generous haremlings you’re surrounded by.";
				eventList.push(msg);
			}
			if(cIdx >= 0)
			{
				msg = "";
				msg += "\n\n<i>“How about this one, farlander?”</i> The quadomme strides coolly through the morass, directing its harem with practiced pushes and curls of its fingers. <i>“They are wonderfully capacious, and deserve a reward.”</i> It pushes the blushing pidemme down into a kneeling position with a stiletto tip to the back, their round backside and plump black abdomen in the air. You watch, slumped in the cushions whilst your little crowd of supplicants kiss and fondle your neck and [pc.chest], whilst the quadomme teases the chosen pidemme’s purple abdominal tip with knowing strokes of long, black fingers until it is fully dilated, drooling oil, its ovipositor housed and spread. The haremling grasps at the polished, stone floor, sighing with joy.";
				msg += "\n\nLust pumping through your veins, you [pc.move] across and grip the smooth, warm abdomen, positioning it so you can immure your [pc.cockHead " + cIdx + "] in the warm, clinging, oily bliss of that brilliantly colored pseudo-pussy. It’s so lubricated it only takes a slow lean forward of your [pc.hips] to slide inwards, and sumptuously glove " + (pc.cLength(cIdx) < 18 ? "the entirety" : "almost half") + " of your [pc.cock " + cIdx + "]. It feels nothing like a cunt - wider, rippling and moving of its own accord, absolutely swamped in oil - but the heavy arousal that pulses right back up your shaft, making you open your lips and groan breathlessly, tells you that your dick cares about that not one bit.";
				msg += "\n\nThe bothrioc quivers and moans softly with pleasure as you draw your bulging meat back along its mottled walls and then shove back fiercely, reaching ever deeper into it. Peaceful arousal simmers through you as you utterly coat your [pc.groin] in splashes of oil, relaxing you more and more and making you want to reach out, slather as much of yourself in sensuality as possible. You reach out and winch another pidemme and a myr into your sides, groping at their soft buttocks and mashing lips with first one, then the other. They respond ardently, hands sliding over your [pc.chest] and " + (pc.hasHair() ? "through" : "over") + " your [pc.hair], smooth, chitinous legs twining with your [pc.legs], impatient for their own filling.";
				msg += "\n\nThe moans of the pidemme you’re ploughing become muffled as the quadomme stands over them and matter-of-factly shoves its own monstrously sized ovipositor into its property’s face, their own whispering sounds of pleasure joining the symphony of lusty coos and squelches. You hilt yourself in the shivering pot of oil";
				if(pc.hasKnot(cIdx)) msg += ", being sure to knot yourself securely with one final, fierce thrust";
				msg += " and then cum explosively, tightening your grip on the two you’re making out with as you pound the bothrioc full of [pc.cum].";
				msg += "\n\nYou allow yourself one huge, gratified exhalation when " + (pc.cumQ() < 500 ? "you’ve squirted your last" : "its hole is absolutely overflowing with [pc.cumVisc] goodness") + "... and then you pull yourself out, trailing oil and semen and take a hold of the red myr properly, making her squeal with exhilaration as you push your hand between her hot, smooth thighs, tracing her juicy snatch. As you tumble into the pile of cushions with her";
				if(cIdx2 >= 0 && rand(2) == 0) msg += " another pair of thin, latex-like hands takes a hold of your [pc.cock " + cIdx2 + "], fully prepared to try and pleasure you";
				else if(pc.balls >= 0 && rand(2) == 0) msg += " a wet pair of lips envelopes your [pc.balls], happily suckling upon them";
				else if(vIdx >= 0 && rand(2) == 0) msg += " a skillful tongue worms its way between your thighs, intent on licking your [pc.vagina " + vIdx + "]";
				else msg += " a skillful tongue worms its way between your asscheeks, intent on pleasuring your [pc.anus]";
				msg += " even whilst you’re lining up your first dripping cock with the myr’s entrance...";
				eventList.push(msg);
			}
			
			if(eventList.length > 0) output(eventList[rand(eventList.length)]);
			
			output("\n\nEventually, after hours of writhing in sweet embrace with soft, giving haremling after haremling, you orgasm hard enough that several of your muscles give out, and you subside into a frazzled doze, head rested on the flat, white chest of a pidemme. You awaken to the stern tones of the quadomme ordering its coterie this way and that, their chitinous feet clacking echoes around the small network of caverns as they hurry this way and that. Two of them wash you with warm, wet cloths, still enthralled by your alien flesh in that unfocused, dreamy way of theirs.");
			output("\n\n<i>“You know, when I invited you upstairs I expected that you would be too tired from voyaging the Deep and battling me to last very long with my harem,”</i> the quadomme says wonderingly, as they carefully winch you back down the entrance tunnel. <i>“What energetic creatures you farlanders are! What fun it is to watch my toys try to satiate you! How interesting it is to see your strange muscles and sinew tighten and twitch!”</i>");
			output("\n\nIt deposits you on the ground, back in the airy gloom of the main network of caves, your gear intact.");
			output("\n\n<i>“Of course, should you come this way again I shall be outdoing myself to catch you and breed you,”</i> the quadomme murmurs in your ear, fingers sliding up your chest as it begins to wind itself back in. <i>“What a prize you shall be. But... losing to such a noble creature, and entertaining them as a boon... this is not a bad thing. Farewell, farlander.”</i>");
			output("\n\nYou stretch your back, feeling pleasantly achy and well-rested. That whole experience was certainly strange, but you feel a glow of happiness that your trust in the bizarre spider-creature paid off so satisfyingly. You definitely feel more predisposed towards being gracious towards strangers now!");
			output("\n\n");
			
			// +3 Hours, Lust reset, +1 Libido if < 50 Libido
			processTime(3 * 56);
			IncrementFlag("BOTHRIOC_QUADOMME_SEXED");
			pc.orgasm();
			if(pc.libido() < 50) pc.libido(1);
			// +1 Nice points
			pc.addNice(1);
			
			bothriocQuadommeToMainMenu(true);
			break;
		case "humiliate":
			if(pc.hasVagina()) vIdx = rand(pc.vaginas.length);
			if(pc.hasCock())
			{
				cIdx = pc.cockThatFits(300);
				if(cIdx < 0) cIdx = pc.smallestCockIndex();
			}
			
			output("You find the smug, louche attitude of this crepuscular wannabe rapist pretty irritating. Mind you, any mofo that has who-knows-how-many slaves slobbering over it every minute of every day is certain to be insufferable. Time to make Myrellion a better place by instilling some much needed humility into it.");
			output("\n\nYour eyes travel up to the snowy curves of its back-legs ass as you rip off your [pc.gear], fully revealed now it’s hanging close to the ground. That, at least, is pleasing to your eye, and a surge of lust enters you at the thought of opening it up and giving it a merciless pounding. It lifts its head, pupil-less eyes blinking, to be confronted by the sight of your hardening [pc.cock " + cIdx + "].");
			output("\n\n<i>“Suck,”</i> you state flatly. The quadomme’s long face creases in distaste.");
			output("\n\n<i>“Really? I’m not exactly experienced when it comes to drone prongs,”</i> it sighs. <i>“Why not toddle back up to Gold territory? I hear they’ll get on their knees for just about anyone who comes from the st-”</i>");
			output("\n\nYou interrupt it with a slap across the face with your semi-erect cock, the expression of stunned shock on the quadomme’s face an invigorating tonic. It’s obvious that no-one <i>ever</i> has treated it this way.");
			output("\n\n<i>“Less whining, more sucking,”</i> you order. <i>“And you’d better lube me up good - it’s going up your ass after this.”</i>");
			output("\n\nA shudder wriggles its way through the bothrioc’s lithe body, but it wraps a hand around your [pc.sheath " + cIdx + "], pulling at it as it opens its mouth and, with a bitter twist of its mouth, licks at the underside with its purple tongue. The shock of your matter-of-fact dominance seems to have intimidated it into compliance - at least for now. You exhale, enjoying the feeling of lust bubbling within you, as its smooth, latex-like hands wrings the bulging flesh of your cock, up and down, and a hot, wet tongue dabs over your [pc.cockHead " + cIdx + "].");
			output("\n\nThe quadomme is quite right, it doesn’t have much experience with dick, and it evidently finds the task you’ve set for it deeply distasteful. Its sharp teeth butt against your sensitive [pc.skin], and it doesn’t do much more than delicately suck at the head. You correct its technique by running your fingers through its silky, black hair and forcing it right down the shaft with a shove of your [pc.hips], groaning as you submerge " + (pc.cockVolume(cIdx) <= 300 ? "the entirety" : "most") + " of your [pc.cockNoun " + cIdx + "] in hot, wet mouth pussy. The quadomme coughs and gags, slapping at you sharply with four flailing hands, but you don’t care. This is an education, and you have neither the time nor inclination for it to be of the soft touch variety.");
			output("\n\nYou tighten your grip on its head and draw out, allowing it to take a sputtering breath... then you force your way in again. In, out, in, out, each time sinking your glorious dick into the wonderful, flexing tightness beyond its teeth until arousal is pulsating right back down it");
			if(pc.balls > 0) output(", your [pc.balls] tightening up with delight");
			output(". After a fair bit of futile flapping, the quadomme accepts it with nothing more than some deeply pissed-off-sounding ‘gark!’s, clutching at your [pc.hips] hard enough to leave marks there as you continue to fuck its mouth.");
			
			if(pc.libido() >= 66)
			{
				output("\n\nYou thrust yourself into the closeness of its throat as far as you can and let orgasm overcome you, jetting [pc.cum] straight into its stomach with a few juicy clenches, before pulling out to ooze some more into its mouth. You admire your [pc.cockNoun " + cIdx + "] as you finally withdraw it entirely from the quadomme’s face, trailing heavy amounts of saliva and cum, spit-polished from [pc.cockHead " + cIdx + "] to [pc.sheath " + cIdx + "].");
				output("\n\n<i>“Happy now?”</i> the bothrioc snaps, once it’s stopped coughing. <i>“You’ve defiled my mouth with your disgusting seed, surely that’s enough for... you.”</i> It trails off as it eyes land upon your dick, still rock-hard, powered by a sexual appetite that in no way is satiated by one-off mouth fuck.");
				lottaLibido = true;
				pc.orgasm();
			}
			else output("\n\nYou wait until you’re on the very cusp of orgasm, the need trembling through you... and then you relax your hands, drawing your [pc.cockNoun " + cIdx + "] out of its mouth, admiring the trails of saliva you bring with it.");
			
			processTime(12);
			pc.lust(30);
			
			clearMenu();
			addButton(0, "Next", bothriocQuadommeSexScenes, ["humiliate next", addiction, vIdx, vIdx2, cIdx, cIdx2, lottaLibido]);
			break;
		case "humiliate next":
			output("Lust energizing you, you [pc.walk] around the formidably-sized arthropodic predator, still dangling from the webs strung around its four stiletto-like feet. It gasps and writhes as you grip it by the long, white waist and pull sharply downwards, bring the big, curvy ass of its hind legs into range of [pc.eachCock], below the strange, black, gleaming abdomen. One of its powerful legs draws back, a half-hearted urge to give you a hard kick no doubt. You give it a firm slap on the buttock - making it squeak and spasm its star-shaped arrangement of legs instead - before clenching them both, peeling them backwards to reveal the black rosebud at its heart. The flesh here is soft and warm, a total contrast to the chiaroscuro severity of the rest of the quadomme’s veneer, and you are further tantalized when you sink first one finger and then another into its anus, feel the heat and tightness within... as well as the way it writhes and shivers around you.");
			output("\n\n<i>“You like that, octoslut?”</i> you smirk, gripping it tightly by the black, latex-like thighs and pressing your [pc.cockHead " + cIdx + "] against that tempting, black target, sighing at the sensation spreading across it.");
			output("\n\n<i>“No, I do not enjoy being buggered by an uncouth, vindictive ape from the stars!”</i> it snarls lowly in response. It’s only just occurred to you that, despite its obvious anger, it’s been keeping its voice low this entire time. What’s that about? <i>“If you’d simply submitted to me and our positions were reversed, I would have shown you unimaginable pleasures. Instead we’re doing this ugly, forced thIIING!”</i> Its voice climbs up about ten decibels, and it instinctively claps several hands over its mouth, as you penetrate it, groaning with sheer bliss as you dig your hot, saliva-");
			if(lottaLibido) output("and-cum-");
			output("slathered cock past its sphincter and slide into those warm, tight depths you’ve been testing.");
			output("\n\n<i>“Are you afraid somebody might hear us?”</i> you tease, once you’ve reached your limit and are drawing your [pc.cock " + cIdx + "] outwards, savoring the wonderful, squeezing drag along your stiffness. You push forward suddenly, laughing as this causes it to kick out again in all directions, swearing as quietly as possibly as it can. <i>“And who might that be? Hey. HEY!”</i>");
			output("\n\nYou direct your shout straight upwards, at the hole in the ceiling from whence the quadomme emerged. It might be a result of stars shooting across your eyes - your pleasure building with every sumptuous push of your [pc.hips], but you’re sure you saw movement up there.");
			output("\n\n<i>“Nooooooo...”</i> moans the quadomme in despair, thin hands grasping at the ground.");
			output("\n\n<i>“What are you doing to Master?”</i> It’s a squeaky, female voice, from a fair distance above. They sound rather shocked.");
			output("\n\n<i>“Fucking them raw,”</i> you reply, loudly and cheerfully. <i>“They got their ass beat by me, you see, so now I’m collecting my reward. And let me tell ya... the pushing’s reeeaaally good.”</i>");
			output("\n\nThat’s no lie. Arousal surges up your length as you spear into the bothrioc’s hot, shivering insides again and again, making you dizzy with arousal. Above you in the darkness, you can hear a minor commotion - hasty, whispered conversations, the scrambling around of many pairs of chitinous limbs. Grinning, you pick up the pace, slapping into their soft, white cushion again with energetic claps.");
			output("\n\n<i>“Poor Master!”</i> you think you hear the first voice wail.");
			output("\n\n<i>“Look at [pc.him] go,”</i> says another, in a slightly more wondering tone. The quadomme curses you again, but this time it comes out weak and dejected.");
			output("\n\n<i>“Aww, don’t feel too bad about me showing you up in front of your incy wincy harem, spiderslut!”</i> You reach down, fold an arm around the creature’s flat chest, nibble amorously on a chitin-shelled ear. <i>“Maybe I’ll give ‘em a few ideas? Maybe they’ll hold you down and peg you, one after the other. Since being a cocksleeve is your true calling, and all...”</i>");
			output("\n\nThe quadomme doesn’t respond at all this time; breath hissing through its sharp teeth, eyes closed, it’s clearly wishing to be absolutely anywhere else at all. " + (lottaLibido ? "A second orgasm" : "Orgasm") + " is only a dozen or so glorious pumps away; you rush into it, furiously beating your [pc.thighs] into the bothrioc’s ghostly, round backside, gripping onto the smooth, chitinous coating of its thick legs for all you are worth, as [pc.eachCock] thickens up and you spew a dense load of [pc.cum] into the hole you’re pounding, followed by another, then another.");
			if(pc.cumQ() > 1000) output(" It’s dripping out around your mired, throbbing member by the time you’re done.");
			if(pc.cumQ() > 5000) output(" You don’t stop until it’s squirting out heavily, drooling down its immaculate, latex-like exoskeleton, its guts utterly packed with a hot, sloshing filling, delivered with all the passion you’ve got to spare.");
			output("\n\nYou rest for a few moments, still between the quadomme’s legs and stuck deep in its thoroughly-creamed ass, letting the post-coital bliss throb through you. The tall, sinuous being doesn’t complain: you have obliterated it.");
			output("\n\n<i>“You leave Master alone!”</i> cries a voice from above. <i>“You’ve had your fun, now go!”</i>");
			output("\n\n<i>“Come and find me when you’re ready for a <b>real</b> [pc.Master],”</i> you return, looking up steadily at the black, gossamer-lined hole. There’s no reply to this - just a lot of shuffling around and hushed, furious conversation. You’re smiling as you draw your [pc.cock " + cIdx + "] outwards, wipe it off on a chitinous thigh, put your [pc.gear] on and set off again, leaving the defeated bothrioc gently swaying in its webs. You should be doing this more often - taking zero shit from the savage beings who try to rape-impregnate you. Really, you’re doing the whole galaxy a favor by hitting back.");
			output("\n\n");
			
			processTime(11);
			IncrementFlag("BOTHRIOC_QUADOMME_SEXED");
			// Lust rest, -1 Nice Points
			pc.orgasm();
			pc.addHard(1);
			
			bothriocQuadommeToMainMenu(true);
			break;
	}
}

// Bad End
// Happens if PC is 100 addiction and auto-submits twice in a row
public function bothriocQuadommeBadEnd():void
{
	if(inCombat())
	{
		userInterface.hideNPCStats();
		userInterface.leftBarDefaults();
	}
	else
	{
		var domme:BothriocQuadomme = new BothriocQuadomme();
		setEnemy(domme);
	}
	
	currentLocation = "GAME OVER";
	generateMap();
	
	clearOutput();
	showBothriocQuadomme();
	showName("QUADOMME’S\nBOTTOM BITCH");
	
	output("It doesn’t take you long to adapt to your new life as a bothrioc quadomme’s bottom bitch. This is partly to do with your harem-mates: a dozen assorted pidemmes and myr who are endlessly kind and generous towards you despite your alienness. This is because you share with them a warm, peaceful, communal sensuousness that pervades everything around you, and you slip into their ranks as if you’d known them forever.");
	output("\n\nThe other factor is the dominant, who has had to introduce dizzy morsels to a life of service before, and it’s not in its nature to ever grow tired of it. They break you in slowly, keeping you close to their gleaming black side at first, bathing in their beatific presence, letting you see how it orders and rewards its servants around the clever system of well-furnished tunnels they reside in.");
	output("\n\nIt also breeds you frequently, drawing oil off the needy, brimming abdomens of its pidemmes in order to bend you over and stuffing your");
	if(pc.hasVagina()) output(" [pc.vaginas] and");
	output(" ass so full of dense, warm ovals that it’s difficult to even think. You spend a lot of those oil-soaked days in the nursery, looking after the wide-eyed spider babies");
	if(pc.hasBreasts() && pc.isLactating()) output(" as well as nursing them with your [pc.milk]-filled [pc.boobs],");
	output(" and you quickly fall in love with the job.");
	output("\n\nOnce you’re well into the rhythm of things in this dreamy, extremely sexual mini-fiefdom, the quadomme introduces you to more esoteric activities, testing your body’s limits with web bondage until it knows exactly how far it has to stretch you to make you gasp, cocooning your groin in silken bondage and then spending a week mercilessly teasing you until you beg it for release. To its delight the eight-limbed creature discovers you have a much wider experience than any of its other servants, and it begins using you as a muse, getting you to fire off ideas as to what to do with its generously-sized harem next. It’s you that gives it the idea of trussing you up blindfolded face-to-face with a gold myr, her leaky boobs squashing into your [pc.chest], hanging you from the ceiling as a curvy chandelier, beneath which it organizes a mass orgy, the orgasmic sounds of it drifting up to you as you share an hours-long kiss.");
	output("\n\nThis is the rest of your life, and you don’t regret it even slightly.");
	
	processTime((36 + rand(24)) * 7 * 24 * 60);
	
	var i:int = 0;
	var vIdx:int = -1;
	for(i = 0; i < 20; i++) { pc.orgasm(); }
	for(i = 0; i < 8; i++)
	{
		if(pc.hasVagina())
		{
			for(vIdx = 0; vIdx < pc.vaginas.length; vIdx++) pc.loadInCunt(enemy, vIdx);
		}
		pc.loadInAss(enemy);
	}
	
	badEnd("THE END");
}

