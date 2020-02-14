
/*
Flags Key:

SHADE_ON_UVETO : Tracks Shade's Uveto progress.
	0/undefined - Not even on the planet.
	1 - Will only appear in bar. For Welcome-to-Uveto intro.
	2 - Will appear in bar or house at certain times. For house intro.
	3 - Will appear in bar or house at certain times. For repeats.
TOLD_SHADE_SHES_YER_SIS : Tracks sister knowledge.
	0/undefined - Never known.
	-1 - Steele knows, but keeps it a secret. (Older saves may not pick this up because it wasn't tracked in earlier versions...)
	1 - Steele knows and tells her.
SHADE_IS_YER_SIS : Tracks non-incestuous sister relationship.
	undefined - It is not mutually acknowleged that Shade is Steele's sister and incest is still possible
	-1 - Shade's sister mode is negative.
	0 - Shade's sister mode is ambiguous.
	1 - Shade is definitely in sister mode.
	2 - Shade's sister mode had been acknowledged, but ignored anyway for mutual incest.
*/

public function shadeBustDisplay(nude:Boolean = false):String
{
	if(nude) return "SHADE_NUDE";
	//else if(9999) return "SHADE_JEANS";
	//else if(9999) return "SHADE_SHIRT";
	else if(flags["SHADE_ON_UVETO"] >= 1) return "SHADE_SWEATER";
	return "SHADE";
}
public function astraBustDisplay(nude:Boolean = false):String
{
	if(nude) return "ASTRA_NUDE";
	return "ASTRA";
}
public function amaraBustDisplay(nude:Boolean = false):String
{
	//if(nude) return AMARA_NUDE; // Does not exist (yet?)
	return "AMARA";
}

/* Shade Expansion 1: Ballad of the Ice Queen */
// by Savin

// Shade Settings
// So, Shade's a fairly complex character! She's got a lot of settings/states that have come up already in her adventures, so let's round them all up!

// Alive / Dead. Obviously, DeadShade isn't going to be doing much, though she'll affect Astra a lot.
public function shadeIsDead():Boolean
{
	if(flags["KQ2_SHADE_DEAD"] != undefined) return true;
	return false;
}
public function shadeIsActive():Boolean
{
	if(flags["MET_KARA"] == undefined) return false;
	if(shadeIsDead()) return false;
	if(flags["SHADE_DISABLED"] == 1) return false;
	if(flags["SHADE_IS_HOSTILE"] != undefined) return false;
	if(flags["KQ2_SHADE_UNCONSCIOUS"] != undefined && flags["KQ2_SHADE_UNCONSCIOUS"] > (GetGameTimestamp() + (2 * 24 * 60))) return false;
	if(flags["KQ2_SHADE_AWAY_TIME"] != undefined) return false;
	return true;
}
public function shadeIsHome():Boolean
{
	if(hours < 10 || hours >= 20) return true;
	return false;
}
public function astraIsHome():Boolean
{
	if(9999 == 0) return true;
	return false;
}
// Enemy / Not Friend / Friend / Lover. If Shade was never interacted with in a positive way (ie, you fought her in KaraQuest 1), she's an Enemy. If the player betrayed Shade in KQ2 and didn't make a good case to her afterwards, she's Not Friend. If you've been buddy-buddy with her so far (Helped her out in KQ1 or didn't do KQ2), she'll be your Friend. And of course, if you've fucked before and would otherwise be Friends, she's a Lover.
public function shadeIsFriend():Boolean
{
	if(shadeIsEnemy()) return false;
	if(flags["SHADE_DISABLED"] == 1) return false;
	return true;
}
public function shadeIsLover():Boolean
{
	if(shadeIsFriend() && flags["SEXED_SHADE"] != undefined && flags["SHADE_SEX_DISABLED"] == undefined) return true;
	return false;
}
// Enemy / Not Friend Shade don't want anything to do with you, and won't appear much here. She might show up in Astra's content, though.
public function shadeIsEnemy():Boolean
{
	if(flags["SHADE_DEFEATED_WITH_KARA"] != undefined || flags["LOST_TO_SHADE_WITH_KARA"] != undefined || flags["SHADE_IS_HOSTILE"] != undefined) return true;
	return false;
}
public function shadeIsNotFriend():Boolean
{
	return (!shadeIsFriend());
}
// Siblings / SecretSiblings / NotSiblings. If both Shade and the PC know they're related, they're Siblings. If only the PC knows, they're SecretSiblings. Shade might find out later, though! Of course, if neither knows, they're effectively NotSiblings.
public function shadeIsSiblings():Boolean
{
	return (flags["TOLD_SHADE_SHES_YER_SIS"] == 1 || flags["SHADE_IS_YER_SIS"] != undefined);
}
public function shadeIsSecretSiblings():Boolean
{
	return (flags["TOLD_SHADE_SHES_YER_SIS"] == -1);
}
public function shadeIsNotSiblings():Boolean
{
	return (flags["TOLD_SHADE_SHES_YER_SIS"] == undefined);
}

// Introduction: Letters From Shade
// Get when moving around on Uveto Station, post Shade leaving Myrellion.
public function getLetterFromShade():void
{
	if(shadeIsEnemy()) return;
	
	if(flags["SHADE_ON_UVETO"] == undefined)
	{
		// Limbo failsafe (Nuked Myrellion, Shade is friendly, Shade still in bar, Shade mysteriously survives and arrives on Uveto a day later...)
		if(flags["KQ2_NUKE_EXPLODED"] != undefined && shadeIsFriend() && shadeAtTheBar() && flags["KQ2_SHADE_AWAY_TIME"] == undefined)
		{
			flags["KQ2_SHADE_AWAY_TIME"] = GetGameTimestamp();
		}
		return;
	}
	if(MailManager.isEntryUnlocked("letter_from_shade"))
	{
		// Subject line Hotfix
		if(MailManager.hasSubject("letter_from_shade", null)) MailManager.updateEntry("letter_from_shade");
		return;
	}
	if(shadeAtTheBar() || !shadeIsActive()) return;
	
	if(createSubjectFromShade() != "")
	{
		if(!MailManager.isEntryUnlocked("letter_from_shade")) goMailGet("letter_from_shade");
	}
}
public function createSubjectFromShade():String
{
	var subject:String = "";
	
	// PC is Sibling
	if(shadeIsSiblings())
	{
		// Sibling-Lover
		// Overrides any previous options.
		if(shadeIsLover()) subject = "Meet me.";
		// Not Lover
		else subject = "Welcome to Uveto!";
	}
	// PC is Lover
	else if(shadeIsLover())
	{
		// DID encounter Shade in KQ2
		if(flags["KQ2_SHADE_ENCOUNTERED"] != undefined) subject = "Hi...";
		// Did NOT encounter Shade in KQ2
		else subject = "Welcome to Uveto!";
	}
	// PC is Friend
	else if(shadeIsFriend())
	{
		subject = "Welcome to Uveto!";
	}
	
	return subject;
}
public function createLetterFromShade():String
{
	var msg:String = "";
	// PC is Sibling
	if(shadeIsSiblings())
	{
		// Sibling-Lover
		// Overrides any previous options.
		if(shadeIsLover())
		{
			msg = "Welcome to Uveto... little " + pc.mf("brother", "sister") + ".";
			msg += "\n\nI pulled a favor with a station manager; had a feeling you might show up here sooner or later. Sure enough.";
			msg += "\n\nTakes a lot to panic me, but I think what happened back on Myrellion definitely qualifies. Sorry I bolted, but... well things were a little overwhelming. Still are.";
			// Encountered Shade in KQ2:
			if(flags["KQ2_SHADE_ENCOUNTERED"] != undefined) msg += " First you and Kara... now this... fuck my life. Fuck!";
			msg += "\n\nSo let me cut to the chase. I want to meet you. Talk things over. I think we both deserve that.";
			msg += "\n\nMy house is the first one after the Mead Hall. Wedged between that and the temple in north Irestead. Come by any time... if you want to talk, that is. I’ll understand if you don’t; want to keep our distance. For what it’s worth, I don’t. At least not yet.";
			msg += "\n\nI guess... any way you spin it, now I can sign off:";
			msg += "\n\nWith Love,";
			msg += "\nShade";
			
			if(flags["SHADE_ON_UVETO"] == undefined || flags["SHADE_ON_UVETO"] < 2) flags["SHADE_ON_UVETO"] = 2;
		}
		// Not Lover
		else
		{
			msg = "Welcome to Uveto, little " + pc.mf("brother", "sister") + ".";
			msg += "\n\nGods, that feels weird saying. Always thought I was an only child, but now that I’d done a little extranet research into dad... wow, something tells me we’ve got a pretty expansive family tree. Was he really married to a queen once? Does that mean I’m a princess? :P";
			msg += "\n\nSo anyway, I’m still kinda freaked out. But in a good way! It’s nice to have some family again... especially someone I liked anyway. Since you’re here on our little iceball, maybe we could grab a drink sometime? Help your big sis get in touch with her inner Steele?";
			msg += "\n\nLet me know! I’ll bring my daughter -- your niece! -- Astra around with me. She’ll be thrilled to meet you.";
			msg += "\n\nIs it weird to sign off with “Love you!” or something sappy like that now? Haha, Gods, I have no idea what I’m doing...";
			msg += "\n\nLove you anyway, though,";
			msg += "\nShade";
		}
	}
	// PC is Lover
	else if(shadeIsLover())
	{
		// DID encounter Shade in KQ2
		if(flags["KQ2_SHADE_ENCOUNTERED"] != undefined)
		{
			msg = "Hey kid,";
			msg += "\n\nWelcome to Uveto. I pulled a favor with a station manager; had a feeling you might show up here sooner or later. Sure enough.";
			msg += "\n\nSo... ugh I hate everything about this. Not you. At least I don’t think so. Just this... just this stupid situation. Look, you made your case back on Myrellion. I want to at least talk one more time before I make up my mind.";
			msg += "\n\nCome around the bar down moon-side when you get this. It’s right near the temple, northern Irestead. Can’t miss it.";
			msg += "\n\nSee you there,";
			msg += "\nShade";
		}
		// Did NOT encounter Shade in KQ2
		else
		{
			msg = "Hey kid, welcome to the snowy little iceball I call home. Glad you could find the time off on your big important mission to come by.";
			msg += "\n\nConsider my house... and bed... your home away from home while you’re here. It’s the first little hut between the Mead Hall and the temple, up in northern Irestead. Can’t miss it. Don’t worry, it’s bigger than it looks!";
			msg += "\n\nGive me a re: before you stop by some evening, and I’ll have dinner cooking. Something to warm your bones up before I jump ‘em. ;) Looking forward to seeing you!";
			msg += "\n\nLove,";
			msg += "\nShade";
			
			if(flags["SHADE_ON_UVETO"] == undefined || flags["SHADE_ON_UVETO"] < 2) flags["SHADE_ON_UVETO"] = 2;
		}
	}
	// PC is Friend
	else if(shadeIsFriend())
	{
		msg = "Hey kid, welcome to the snowy little iceball I call home. I saw your ship on the dock register today, and well... figured I’d drop you a line!";
		msg += "\n\nThere’s a Mead Hall moon-side I hang out at, just south of the temple in Irestead. Come by sometime: I’ll buy you a drink, and we can catch up.";
		msg += "\n\nActually, one better: if you don’t mind, I’ll bring my daughter, Astra, along. I might have let slip I met a badass adventurer when I got home, and she’s been dying to meet you. Guess she put two and two together about the Steele name before I did. That or she just latched onto the part where you’re a hot spacer right at her age. :P";
		msg += "\n\nLet me know when you’re in town!";
		msg += "\n-Shade";
	}
	
	return msg;
}

// Introduction: Meeting Shade at the Bar
public function meetingShadeAtUvetoBar(btnSlot:int = 1):void
{
	if(flags["SHADE_ON_UVETO"] == undefined) return;
	if(!MailManager.isEntryViewed("letter_from_shade")) return;
	if(!shadeIsActive()) return;
	// Exception, only for lovers!
	if(flags["SHADE_ON_UVETO"] == 2 && shadeIsLover()) return;
	// Add Shade to the bar after her planetary introduction, assuming she's still cool with the PC. She's here between 10:00 and 20:00 every day.
	else if(flags["SHADE_ON_UVETO"] != 1 && shadeIsHome()) return;
	
	var response:String = "";
	var tooltip:String = "";
	
	 if(flags["SHADE_ON_UVETO"] >= 2)
	{
		//Lover Shade Blurb
		if(shadeIsLover())
		{
			output("\n\nYour");
			// Bro/high-libido:
			if(pc.isBro() || pc.libido() > 66) output(" MILF-tastic");
			output(" kaithrit lover is sitting at a booth in the back of the bar with her pussy-tail wrapped around her lap and a frothy mug nursed in her hand. She’s turned her table into an impromptu office, with a pocket holodisplay and a handful of datapads scattered around amidst packets of pretzels and finished drinks. She seems right at home in the musty little bar, as ever.");
			output("\n\nCatching your eye, Shade leans back in a way that’s both ice-queen-confident and that pushes her ample rack out against her sweater. The only way those meaty mounds could look better is in your hands...");
			if(pc.hasCock()) output(" or around your [pc.cock]!");
			
			tooltip = "Go talk to your lover, Shade.";
		}
		//Sister Shade Blurb
		else if(shadeIsSiblings())
		{
			output("\n\nYour half-sister is sitting at a booth in the back of the bar with her pussy-tail wrapped around her lap and a frothy mug nursed in her hand. She’s turned her table into an impromptu office, with a pocket holodisplay and a handful of datapads scattered around amidst packets of pretzels and finished drinks. She seems right at home in the musty little bar, as ever.");
			if(flags["SHADE_IS_YER_SIS"] == -1) output("\n\nShade avoids looking in your direction, given your request to distance yourself from her.");
			else output("\n\nSeeing you nearby, Shade gives you a familiar smile over the top of the datapad she’s working on.");
			
			tooltip = "Go talk to your sister, Shade.";
		}
		//Friend Shade Blurb
		else if(shadeIsFriend())
		{
			output("\n\nShade Irons is sitting at a booth in the back of the bar with her pussy-tail wrapped around her lap and a frothy mug nursed in her hand. She’s turned her table into an impromptu office, with a pocket holodisplay and a handful of datapads scattered around amidst packets of pretzels and finished drinks. She seems right at home in the musty little bar, as ever. ");
			output("\n\nSeeing you nearby, Shade gives you a familiar nod of the head over the top of the datapad she’s working on.");
			
			tooltip = "Go talk to your friend, Shade.";
		}
		if(tooltip != "")
		{
			if(flags["SHADE_IS_YER_SIS"] == -1) addDisabledButton(btnSlot, "Shade");
			else addButton(btnSlot, "Shade", shadeUvetoBarApproach, true, "Shade", tooltip);
		}
		return;
	}
	// Betrayed Lover
	else if(shadeIsLover() && flags["KQ2_SHADE_ENCOUNTERED"] != undefined)
	{
		output("\n\nShade is sitting at the bar and nursing a dark mug. She looks much the same as before, though at a glance she’s wearing a thick woolen sweater under her long coat, and her tail is wrapped up in a dark blue sock that leaves none of its scales bare. As you enter the bar, Shade glances up and locks eyes with you for a moment. She sighs and waves, summoning you to your jilted lover’s side.");
		
		response = "intro lover";
		tooltip = "Go meet up with Shade.";
	}
	// Friend (Sibling Status Unrevealed/Unknown)
	else if(shadeIsFriend() && !shadeIsSiblings())
	{
		output("\n\nShade is sitting at the bar and nursing a dark mug. She looks much the same as before, though at a glance she’s wearing a thick woolen sweater under her long coat, and her tail is wrapped up in a dark blue sock that leaves none of its tender scales bare.");
		output("\n\nBeside her is a younger woman, about your age, with snow white hair pulled back into a braid beneath a pair of towering red ausar-ears... matching a single, swishing red feline tail that peeks out from her pants. Shade’s companion is wearing snow camouflage armor, a skin-tight bodysuit under some synth-ceramic armor plates and a flowing white cape. A warrior of some kind, no doubt.");
		
		response = "intro friend";
		tooltip = "In which an ignorant Shade tries to play matchmaker between Cool Rich Dude and her daughter.";
	}
	// Siblings (No Incest)
	else if(shadeIsSiblings() && !shadeIsLover())
	{
		output("\n\nShade is sitting at the bar and nursing a dark mug. She looks much the same as before, though at a glance she’s wearing a thick woolen sweater under her long coat, and her tail is wrapped up in a dark blue sock that leaves none of its tender scales bare.");
		output("\n\nBeside her is a younger woman, about your age, with snow white hair pulled back into a braid beneath a pair of towering red ausar-ears... matching a single, swishing red feline tail that peeks out from her pants. Shade’s companion is wearing snow camouflage armor, a skin-tight bodysuit under some synth-ceramic armor plates and a flowing white cape. A warrior of some kind, no doubt.");
		
		response = "intro sibling";
		tooltip = "Go meet up with Shade and... your niece? She did mention bringing her daughter with her in her email, you guess.";
	}
	
	// [Shade]
	if(response != "") addButton(btnSlot, "Shade", approachShadeAtTheBar, response, "Shade", tooltip);
}
public function approachShadeAtTheBar(response:String = "intro"):void
{
	clearOutput();
	author("Savin");
	clearMenu();
	
	switch(response)
	{
		case "intro lover":
			showBust(shadeBustDisplay());
			showName("\nSHADE");
			
			output("Taking a deep breath, you fortify yourself and make your way over to where Shade’s sitting. She glances up from her drink, eyeing you warily until you’re beside her.");
			output("\n\n<i>“Hi,”</i> you say, sitting when she indicates the stool beside her.");
			output("\n\n<i>“Hey,”</i> Shade echoes. You can hear the fatigue in her voice even after a single syllable. For the first time, the huntress looks positively haggard. <i>“Thanks... thanks for meeting me, [pc.name]. And for giving me a little space. My mind’s been racing ever since Myrellion.”</i>");
			output("\n\nFor what it’s worth, you find yourself apologizing once again. This really isn’t what you had intended to happen.");
			output("\n\nShade sighs. <i>“Yeah. Me neither. But the more I think about it, the more I want to... the more I realize I want this - us - to keep going. It’s been too good to let it go without a fight, but I just don’t know if I can trust you anymore, [pc.name]. And I can’t be with someone I can’t trust.”</i>");
			output("\n\nThen what can you do to prove yourself to her?");
			output("\n\nThe huntress looks you up and down a moment, like she’s sizing you up again just like in that bar on Myrellion, before she continues. <i>“First, I want to be honest with you, too, so we don’t leave anything up in the air. You know who I work for, now -- not all the time, but Amara is my daughter’s sire. If she calls me for help, I answer. Period. Nobody in this galaxy’s more important to me than my baby girl, and keeping Amara happy keeps her in Astra’s life. If you can accept that about me, then I can accept... whatever it was you and that cobalt cat were up to. Keep her away from my girl’s sire, and I’ll keep </i>her<i> away from you. We can all let this fade out behind us.”</i>");
			output("\n\nSo no more helping Kara against the Black Void?");
			// if KaraDead:
			if(flags["KQ2_KARA_SACRIFICE"] != undefined)
			{
				output(" Not much of an ask, considering Kara’s dead...");
				output("\n\n<i>“Yeah, but she had friends. Powerful friends. Stay away from them, for our sake. Okay?”</i>");
			}
			
			processTime(5);
			
			// [Promise] [Sorry, Shade...]
			addButton(0, "Promise", approachShadeAtTheBar, "lover promise", "Promise", "Promise Shade that you’ll stop fighting against Amara’s Void. God help you if you break your promise...");
			addButton(1, "Sorry", approachShadeAtTheBar, "lover sorry", "Sorry, Shade...", "As much as you wish this wasn’t how it had to end, you can’t make that promise. You doubt Shade will want to see you after this answer...");
			break;
		case "lover promise":
			showBust(shadeBustDisplay());
			showName("\nSHADE");
			
			output("<i>“Alright. I promise,”</i> you say solemnly.");
			output("\n\nShade releases a heavy breath and smiles, reaching over to take your hand. <i>“I’m glad. Really. I think you and I got off to an unfortunate start, [pc.name], but we’re better than that. If you and I can be honest with each other from here on out, I know we can make this work.”</i>");
			output("\n\nThe huntress’s hand pulls you towards her, yanking you into a tight embrace. You smile and hug her back, feeling the palpable relief spilling off you. Maybe now you can put all of this...");
			output("\n\nBefore you can finish the thought, you feel Shade’s breath hot in your ear. <i>“Cross me on this, though, and I’ll kill you in your sleep.”</i>");
			output("\n\nShe pulls back from you, just enough to lock eyes and show you just how stone cold hers are in that moment, before she smiles and pulls you into a kiss. <i>“Don’t make it come to that.”</i>");
			output("\n\nYou can’t help but shiver, unsure about this mix of danger and warmth the huntress is putting off. But then again, maybe that’s what attracted you to her in the first place. The kiss is long and lustful, giving Shade’s hands time to play down your chest and side, gripping you by the waist. When she pulls back, she rests her forehead against your brow and smiles.");
			output("\n\n<i>“Now that we’ve got that out of the way,”</i> she grins, planting a parting kiss on your cheek, <i>“let’s have a drink to celebrate, hmm?”</i>");
			
			processTime(2);
			
			flags["SHADE_ON_UVETO"] = 2;
			// Record the Promise was made for later.
			flags["SHADE_LOVER_PROMISE"] = 1;
			
			// [Next] to Shade's bar menu 2.0
			addButton(0, "Next", shadeUvetoBarMenu);
			break;
		case "lover sorry":
			showBust(shadeBustDisplay());
			showName("\nSHADE");
			
			output("<i>“Sorry,”</i> you say, withdrawing from your once-lover’s touch. As much as it hurts you, you can’t make that promise to her. There’s no way you can stay out of the Black Void’s way just for her.");
			output("\n\nShe sighs and plants her elbows on the bar, refusing to meet your gaze for a long moment. When she does, Shade’s eyes look more weary than you think you’ve ever seen them - more fitting her true age, and full of sadness.");
			output("\n\n<i>“I understand. Can’t exactly blame you. You know what I’m involved in, after all, and that... well, if you and that kitten");
			// ded Kara:
			if(flags["KQ2_KARA_SACRIFICE"] != undefined) output("’s friends");
			output(" insist on keeping this up, that’s going to make us enemies again eventually. Next time, though, I’m not going to go easy on you. I want you to understand that.”</i>");
			output("\n\nSomething tells you it doesn’t matter either way. You had your chance to fix things with Shade, but you’ve chosen another path. A path that can’t end well for you, or the huntress, or both. Time and blood will tell.");
			output("\n\n<i>“Well, you’ve made your choice,”</i> Shade says, standing. <i>“For both our sakes, I hope we don’t meet again.”</i>");
			output("\n\nShe turns towards the door, but pauses before she leaves. With a slight chuckle, Shade leans down and plants a faint kiss on the top of your head before stuffing her hands in her duster’s pockets and stalking out of the bar.");
			
			processTime(2);
			
			// Remove Shade from the game; set to "Hostile" just as if the PC had fought her in Myrellion's bar. Dump PC into the bar menu.
			flags["SHADE_IS_HOSTILE"] = 1;
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "intro friend":
			showBust(shadeBustDisplay(), astraBustDisplay());
			showName("SHADE &\nASTRA");
			
			output("<i>“Hey, Shade,”</i> you say, waving as you make your way over to the bar.");
			output("\n\nYour bounty huntress friend glances up from her drink, smiles, and pushes out the empty barstool beside her. <i>“[pc.name]! Have a sit, kiddo!”</i>");
			output("\n\nThe woman to her left leans around Shade to greet you with a smile, and you’re suddenly reminded Shade said something about bringing her kid...");
			output("\n\nNow that you can see both at once, there’s no doubt about it: the resemblance is striking. She is a little taller and, if the firm chestplate on her uniform is any indication, even bustier than her mother, but has the same chiseled facial features and cunning cat-eyes as Shade... even if she’s got what look like ausar ears peeking up through her snow-silver hair.");
			output("\n\nStill, she’s older than you expected! Your friend’s daughter must be your age, maybe a few months apart one way or the other. A full grown woman, either way.");
			output("\n\n<i>“Hi,”</i> the younger woman says, giving you a little wave as you take the offered seat. <i>“I’m Astra.”</i>");
			output("\n\n<i>“My daughter,”</i> Shade confirms, putting an arm around the half-breed’s shoulder. Astra’s tail wiggles behind her, and she extends a hand which you shake warmly. <i>“You two are about the same age if I had to guess. Just turned eighteen a bit ago.”</i>");
			output("\n\nAstra huffs and gives her mom a look, but Shade just laughs and hugs her girl closer. <i>“Don’t mind her, she’s just shy. So, Steele! How’ve the stars been treating you? Done with the planet of the bugs, yet?");
			// myr/nyrea:
			if(isMyrellionMorph(pc)) output(" Or... judging by your appearance, have you just gone native?");
			output("”</i>");
			output("\n\n<i>“Oh, mom was telling me about that. Myrellion, right? All those poor people!”</i>");
			output("\n\n");
			if(reclaimedProbeMyrellion()) output("Yeah, you’ve finished your search on Myrellion, though the planet’s far from peaceful regardless of your efforts. Now you’ve got the time to see what the kitties’ snowy world has to offer.");
			else output("No, you’re just... taking a break, for now. Figured you might see what the kitties’ snowy world has to offer.");
			output("\n\n<i>“Hey, I’m only half kitty,”</i> Astra grins, wobbling the big jackal-like ears sitting high on her head. <i>“But welcome to Uveto anyway! Mom was saying you’re some kind of space adventurer - a rusher, right? You’ll fit right in here, if that’s the case.”</i>");
			output("\n\nOh, why so?");
			output("\n\n<i>“Aside from most of our little moon being crawling with creatures just as fearsome as anything in Rush Space?”</i> Shade answers, rapping a knuckle on Astra’s armor. <i>“Uveto’s a pretty good place for we of a martial persuasion. Plenty of eager locals to practice on if you don’t mind putting your maidenhead on the line.”</i>");
			output("\n\n<i>“Mom!”</i> Astra groans, which only makes the older huntress guffaw. Astra’s cheeks redden, and she quickly grabs her drink and takes a long draught to hide it. <i>“W-what I meant was that Uveto has the Stormguard’s biggest temple on it, where we Lancers train.”</i>");
			output("\n\nYou cock an eyebrow. <i>“Lancers?”</i>");
			output("\n\nAstra nods eagerly. <i>“Storm Lancers! The temple trains us in mixed martial arts, jumpjet combat, small arms from handguns to marksman rifles, even swordsmanship and spear fighting. Graduates are some of the most sought-after private security contractors and bodyguards in the galaxy,”</i> she explains proudly.");
			output("\n\nSounds more like a martial academy than a temple, if that’s the case.");
			output("\n\nAstra chuckles. <i>“Well, sure. I mean, there’s faith behind it all, but knowing how to fight is a lot more valuable than a theology degree these days, huh? Besides, there </i>are<i> Stormguard temples that train priests and stuff, but our faith puts fighting skill on a pedestal more than anything.”</i>");
			output("\n\nTurning to Shade, you ask if that’s where she learned her skills, too?");
			output("\n\n<i>“No,”</i> she answers flatly. <i>“I learned the hard way... and I thank Astra’s storm god friend that she doesn’t have to.”</i> ");
			output("\n\nShade gives you a little wink and motions to the bartender for another round. <i>“Besides, every time I step into the arena with her, I’m more and more convinced that in a few months she’s gonna be kicking my ass into the snow with one hand tied behind her back. I guess I gave her some fightin’ genes, but she’s honed ‘em to a razor edge.”</i>");
			output("\n\n<i>“You’re just saying that,”</i> Astra giggles, though her swishing tail can’t hide just how much she appreciates the compliment. <i>“And don’t pretend you don’t believe! I know you wear your pendant everywhere you go.”</i>");
			output("\n\n<i>“Yeah, yeah,”</i> Shade smirks. She runs a thumb along the svelte silver chain around her neck, smiling to herself. <i>“I meant what I said though, pup. Tell you what, maybe [pc.name] here can prove it to you. [pc.HeShe]’s a rough and tumble spacer");
			// if fought Kara:
			if(flags["KARA_DEFEATED_WITH_SHADE"] != undefined) output(", and I can attest to [pc.hisHer] badass-ness");
			output(".”</i>");
			output("\n\nAstra bites her lip and gives you a little smile of her own. <i>“Well, our arena’s open to the public. If you wanna swing by the temple sometime, I’d be happy to go a few rounds with you!”</i>");
			output("\n\n");
			if(pc.isAss() || pc.characterClass == GLOBAL.CLASS_MERCENARY) output("Now that sounds like it could be fun!");
			else output("Spar with Shade’s daughter? Well, that could be fun you suppose.");
			output(" Astra’s smile broadens, and her hybrid tail beats her seat so quickly that you can actually hear the <i>thump-thump</i> pattern.");
			output("\n\n<i>“Speaking of rounds. Hana! Where’s my drinks!?”</i> Shade bellows, loud enough to make her daughter wince. The ausar woman behind the bar scowls and comes over with a new pair of mugs for the Irons girls, and one full of the same frothy lager for you. <i>“There we go! Wouldn’t mind waiting if it wasn’t for the same piss she’s been serving for the last decade.”</i>");
			output("\n\nThe bartender gives an audible “harrumph!” and turns to some other customers, leaving Shade to laugh and slap her knee. Astra whines, burying her face in her hands. <i>“Moooom!”</i>");
			output("\n\nShade just keeps on laughing. <i>“Sorry. I... might have had two or three... or seven... drinks before you got here, [pc.name].”</i> The older huntress hiccups, chuckles, and starts chugging.");
			output("\n\nYou smile and join her, quickly followed by Astra. This promises to be a fun outing...");
			
			processTime(8);
			
			// [Next]
			addButton(0, "Next", approachShadeAtTheBar, "friend next");
			break;
		case "friend next":
			showBust(shadeBustDisplay(), astraBustDisplay());
			showName("SHADE &\nASTRA");
			
			//Pass two hours
			processTime(40 + rand(5));
			pc.imbibeAlcohol(10 + rand(5));
			processTime(40 + rand(5));
			pc.imbibeAlcohol(10 + rand(5));
			processTime(40 + rand(5));
			pc.imbibeAlcohol(10 + rand(5));
			
			output("<b>A few drinks later...</b>");
			
			output("\n\nThe next few hours pass in a tipsy blur, with you recounting some of your more recent adventures. Astra listens intently, eyes wide with wonder. Shade sometimes interjects, comparing your yarn to one of her old war stories, or even to some humorous moment in her more recent years, but seeing her daughter hanging on your every word keeps her from stealing the spotlight.");
			output("\n\nEventually, though, Astra glances at her holoband and grimaces. <i>“");
			if(hours > 17) output("It’s getting late. I should turn in.");
			else output("I’ve got a class to get to");
			output(",”</i> she says apologetically, hopping off her bar seat. <i>“It’s been great to meet you, [pc.name]. Hope you stick around for a while - and think about dropping by the temple some time if you do! We’d love to have you!”</i>");
			output("\n\nShe circles around to give you a fiercely tight hug, giving you a whiff of bourbon and a rosy perfume mixing around her. When she breaks the hug, she flashes you a toothy smile. <i>“See you again soon!”</i>");
			output("\n\nAstra bounces out the door, tail wagging behind her. Shade calls a goodbye after her, then turns back to you with a half-drunken smile. <i>“She’s a real sweetheart, isn’t she? Not like her grizzled old mother at all.”</i>");
			output("\n\n" + (pc.isMischievous() ? "Well, thank God for small miracles." : "Oh, that’s not true!"));
			output("\n\nShade rolls her eyes and plants her chin in her hands. <i>“Eh, I’m just happy Astra’s found her place in the world... somewhere where she’s got friends, people to rely on. The temple’s been good for her.”</i>");
			output("\n\nShe finishes her drink and sighs. <i>“I dunno if you’re planning to stick around Uveto, kiddo, but if you do... heh, like I said, you and Astra are about to same age...”</i>");
			output("\n\nWait, is she... nah. You pass it off as drunken rambling - no way Shade’s thinking about setting you two up.");
			output("\n\nThen again, you did let slip that you’re on the way to being a trillionnaire C.E.O. Between this and the huskar back on the station, maybe you ought to get used to this sort of treatment!");
			output("\n\nShade sighs and rolls her shoulders, not quite looking at you anymore. <i>“I think Astra has a point. I should probably get going... I know you’ve got that crazy quest of yours to go after, anyway.”</i>");
			output("\n\nShe stands up, pounds back the rest of her drink, and cracks the empty mug down hard enough to make you blink. <i>“Of course, if you are sticking around Uveto for a bit... hopefully I’ll see you around. My house is the one just north of the bar, next to the temple, if you ever want to come visit.”</i>");
			output("\n\nYou glance at your Codex and suddenly realize what time it is. Damn, time flies. You tell Shade goodbye, and that maybe you will visit her--and Astra--if time permits. She gives you a farewell clap on the shoulder and shoves her hands into her duster’s pockets, heading for the stairs. You finish your own drink and excuse yourself from your seat, ready to see what else this frozen world has to offer.");
			
			processTime(45);
			
			flags["SHADE_ON_UVETO"] = 2;
			flags["MET_ASTRA"] = 1;
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "intro sibling":
			showBust(shadeBustDisplay(), astraBustDisplay());
			showName("SHADE &\nASTRA");
			
			output("<i>“Hey,”</i> you say, sauntering up behind your half-sister and giving her shoulder an affectionate squeeze.");
			output("\n\n<i>“[pc.name]!”</i> she grins, twisting in her seat to grab you in a hug. She’s as strong as ever, making you squirm before she laughs and lets you go, pulling out one of the bar stools next to her and beckoning you to sit. <i>“Glad you could make it, little " + pc.mf("brother", "sister") + ". Oh, there’s someone I want you to meet...”</i>");
			output("\n\nNow that you can see both at once, there’s no doubt about it: the resemblance is striking. Your niece is a little taller and, if the firm chestplate on her uniform is any indication, even bustier than her mother, but has the same chiseled facial features and cunning cat-eyes as Shade... even if she’s got what look like ausar ears peeking up through her snow-silver hair.");
			output("\n\nStill, she’s older than you expected! Your niece must be your age, maybe a few months apart one way or the other. A full grown woman, either way.");
			output("\n\nShe leans over and waves, giving you a shy smile. <i>“Hey!”</i> Her voice, at least, isn’t like her mother’s at all: higher, more feminine, gentler in tone. More girlish, and less like a husky temptress. <i>“I’m Astra. You’re... wow, when mom said she’d met her " + pc.mf("brother", "sister") + ", I thought you’d be, um... a lot older.”</i>");
			output("\n\nShade huffs, crossing her arms at her daughter. <i>“It’s not like I’m a fossil here, pup. Though from what I’ve gathered, your grandfather might as well have been. Lived more than two hundred years... if the rumors are true, I wouldn’t be surprised if [pc.name] and I have generations of siblings out there.”</i>");
			output("\n\nYou " + (pc.isMischievous() ? "chuckle" : "shrug") + ", taking the seat Shade’s been offering. You admit, your dad was... well, he got around, you know that much. For a long time, too.");
			output("\n\n<i>“So!”</i> Astra interjects, cutting her mother off before the two of you can start talking about your father’s escapades. <i>“Can I call you [pc.name]?”</i>");
			output("\n\nYou nod, reaching past Shade to " + pc.mf("shake Astra’s hand when it’s offered", "give Astra a friendly hug") + ". She giggles and flashes you a brighter smile than before, swishing her tail against the legs of her seat.");
			output("\n\nWhile you’re busy with Astra, Shade calls the matronly ausar behind the bar over and gets drinks for the three of you: tall, frothy mugs of dark beer that are just bitter enough to make even your amazonian relatives grimace when they take their first sips.");
			output("\n\n<i>“Ah! Like I said, I’m glad you came out, kiddo,”</i> Shade laughs, putting an arm around your shoulder. <i>“Welcome to the family.”</i>");
			output("\n\nYou smile. It’s strange, being so close to relatives again. With dad dead and your mother back in the core, you might never have had the chance again for years. Maybe ever. Now, though... now you have a chance to get to know them!");
			
			processTime(8);
			
			// [Next]
			addButton(0, "Next", approachShadeAtTheBar, "sibling next");
			break;
		case "sibling next":
			showBust(shadeBustDisplay(), astraBustDisplay());
			showName("SHADE &\nASTRA");
			
			output("Out of curiosity, you ask Astra between drinks if she lives here with her mom. Her outfit certainly suggests she’s local.");
			output("\n\n<i>“Oh, I’m training at the temple,”</i> she answers, pointing a thumb at the lightning bolt patterns on her armor’s pauldrons. The same as Shade’s almost. <i>“I basically live there.”</i>");
			output("\n\n<i>“Though you’ll always have a room at the house. Which is literally a stone’s throw from the temple door.”</i>");
			output("\n\nAstra rolls her eyes. <i>“You keep saying that, I know. But I <b>like</b> living at the temple with the other novices. It’s like a sorority.”</i>");
			output("\n\n<i>“You could just go to college if that’s what’s important to you,”</i> Shade teases, scratching her fingers through her daughter’s snowy locks.");
			output("\n\nBefore they can carry that on any further, you ask exactly what training Astra’s undergoing at the temple. If her attire’s anything to go by, you’re not sure she’s trying to become a nun.");
			output("\n\n<i>“Not on your life!”</i> she laughs, and raps her knuckles on the hardened breastplate strapped to her chest over her bodysuit. <i>“It’s the </i>Stormguard<i> temple. I’m working to become a Storm Lancer, an elite warrior! There’s our faith behind it, sure, but I’m not trying to be a priestess. When I earn my jump jets, it’ll be easy to get a contract with any PMC on the fringe. Maybe even Nova!”</i>");
			output("\n\nSo it’s a religious combat school, basically?");
			output("\n\nShe nods eagerly, still letting her mother scratch her head. <i>“The Uvetan temple mostly trains Lancers, since there’s so many hostile natives for us to practice on. With stun weapons, of course! Other temples in the galaxy train more priests or scholars, but we’re more of a fighting school.”</i>");
			output("\n\nConsidering her mother’s talents, that seems a good enough fit for her.");
			output("\n\n<i>“You should come by sometime!”</i> Astra grins, wagging her tail a little more quickly. <i>“Our arena’s open to the public - I could show you some of our moves.”</i>");
			output("\n\n" + (pc.characterClass == GLOBAL.CLASS_MERCENARY ? "That’d be something. Maybe when she’s done training, you might be able to set her up with some of your old contacts from your apprenticeship. That’s what family does, right?" : "Maybe you will, at that!"));
			output("\n\nAstra gives you a big thumb’s up and finishes her drink. <i>“Lookin’ forward to it, [pc.name]!”</i>");
			
			processTime(6);
			
			// [Next]
			addButton(0, "Next", approachShadeAtTheBar, "sibling finish");
			break;
		case "sibling finish":
			showBust(shadeBustDisplay(), astraBustDisplay());
			showName("SHADE &\nASTRA");
			
			//Pass 2 hours
			processTime(40 + rand(5));
			pc.imbibeAlcohol(10 + rand(5));
			processTime(40 + rand(5));
			pc.imbibeAlcohol(10 + rand(5));
			processTime(40 + rand(5));
			pc.imbibeAlcohol(10 + rand(5));
			
			output("The next few hours pass in a tipsy blur, with you recounting childhood memories from time spent with your father, and the two Irons girls listening intently. Shade especially hangs on your words, a cheerful smile on her face all the while. Occasionally she’ll pipe up, comparing your early days of training to her own, or making a connection between something her mother had said that now makes sense, knowing who her father is. Even the surname Irons, she laughs, seems like it had been a hint all along--it certainly wasn’t what her mother had been born to.");
			output("\n\nEventually, though, Astra glances at her holoband and grimaces. <i>“");
			if(hours > 17) output("It’s getting late. I should turn in.");
			else output("I’ve got a class to get to");
			output(",”</i> she says apologetically, hopping off her bar seat. <i>“It’s been great to meet you, " + pc.mf("uncle", "aunt") + " [pc.name]. Hope you stick around for a while.”</i>");
			output("\n\nShe circles around and gives you a fiercely tight hug before bouncing off towards the door. Definitely has a grip like her mom, that’s for sure! Shade calls a goodbye after her, then turns back to you with a smile. <i>“She’s a sweetheart. Not like her parents at all... I’m glad.”</i>");
			output("\n\nYou put a hand on her shoulder, but she puts up a hand to stop you from speaking. <i>“Save the platitudes. I’m fine with who I am, I’m just happy Astra’s found her place in the world somewhere where she’s got friends, people to rely on. The temple’s been good for her.”</i>");
			output("\n\nShade sighs and rolls her shoulders, not quite looking at you anymore. <i>“I think Astra has a point. I should probably get going... I know you’ve got that crazy quest of yours to go after, anyway.”</i>");
			output("\n\nShe stands up, pounds back her drink, and cracks the empty mug down hard enough to make you blink. <i>“Of course, if you are sticking around Uveto for a bit... my house is the one just north of here. Next to the temple; can’t miss it. Come by some time. I’ll make dinner, break out some wine, and we can talk some more. This was nice.”</i>");
			output("\n\nYou glance at your Codex and suddenly realize what time it is. Damn, time flies. You tell your half-sister goodbye, and that maybe you will visit her if time permits. She gives you a farewell hug and shoves her hands into her duster’s pockets, heading for the stairs. You finish your own drink and excuse yourself from your seat, ready to see what else this frozen world has to offer.");
			
			processTime(45);
			
			flags["SHADE_ON_UVETO"] = 2;
			flags["MET_ASTRA"] = 1;
			
			// [Next]
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

public function shadeUvetoBarApproach(intro:Boolean = false):void
{
	clearOutput();
	showShade();
	
	if(intro)
	{
		output("You saunter over to Shade’s booth and slide in across from the buxom kaithrit. She smiles as you take your accustomed seat across from her and sets her datapad aside.");
		output("\n\n<i>“Hey, kiddo,”</i> she smiles, steepling her hands under her chin. <i>“");
		if(shadeIsLover()) output("What’s on your mind, sexy?");
		else if(shadeIsSiblings()) output("How’s it going, little " + pc.mf("brother", "sister") + "?");
		else output("How’s things?");
		output(" Up for a couple of drinks?”</i>");
	}
	else
	{
		//Return from any other Shade menu
		output("Shade leans back in her booth, one leg crossed over the other and an arm slung over the back of her seat. As ever, her pose is one of matronly confidence, assured with a smile and the steady heave of her large chest beneath her");
		if(flags["SHADE_ON_UVETO"] != undefined) output(" tan sweater");
		else output(" [shade.armor]");
		output(".");
		//Note Shade Armor in Appearance section.
	}
	
	shadeUvetoBarMenu();
	
	if(flags["SHADE_INSEMINATION_COUNTER"] != undefined && flags["SHADE_INSEMINATION_COUNTER"] >= 20)
	{
		clearMenu();
		addButton(0, "Next", tailCuntOvipositionForShade);
	}
}

public function shadeUvetoBarMenu():void
{
	clearMenu();
	addButton(0, "Talk", talkToShadeAbootStuff, undefined, "Talk", "Chat up Shade.");
	//Must still be unlocked from Incest/Betrayal path
	if(shadeIsLover())
	{
		if(pc.lust() >= 33) addButton(1,"Sex", askShade4SexOnUveto,undefined, "Sex", "Get into some mischief under the covers.");
		else addDisabledButton(1, "Sex", "Sex", "You aren’t aroused enough for that.");
	}
	addButton(2, "Appearance", shadeAppearance,undefined, "Appearance", "Take a good look at the cat-girl bounty hunter.");
	addButton(14, "Leave", mainGameMenu);
}

public function askShade4SexOnUveto():void
{
	clearOutput();
	showShade(true);
	output("Leaning across the table, you ask Shade if she’s up for a little fun.");
	output("\n\nShe eyes you up and down, a slight smile spreading on her lips. <i>“I might be. What do you say we head back to my place, hmm?”</i> ");
	output("\n\n<i>“Lead the way,”</i> you say, standing.");
	output("\n\nShe laughs. <i>“I always do.”</i>");
	output("\n\nYou follow Shade up the stairs out of the bar and back into the blitzing cold. Shade grabs your waist and pulls you tight, snuggling up against you for that extra little bit of body heat to keep you both warm on the short trip between the tavern and the little cottage she calls her own. The moment you’re inside is a blessed relief, a rush of warmth that leaves you trembling with renewed arousal with your lover pressed close enough to hear her heartbeat through her chest.");
	output("\n\nHer long, reptilian tail flicks up when she pulls her tail-sock off, the wet tip caressing your arm as you follow her beneath the ice. Its wandering crown slides down slowly, tickling your [pc.belly] before delving down to your [pc.crotch],");
	if(pc.isCrotchExposed()) output(" openly teasing your bare loins with its pussy-like lips");
	else output(" teasing you through your clothes");
	output(".");

	output("\n\nHer tail’s motions are ceaseless, completely independent of its owner’s confident stride forward. The scaled length of cunt-tail coils around your waist and [pc.leg], playful and alluring, actually managing to pull some of your gear away. Its dexterity is incredible");
	if(pc.hasCuntTail()) output(" - something your own tail-pussy could learn from -");
	output(" as it starts to peel away your [pc.gear]");
	if(!pc.isNude()) output(", working to strip you bare as you stumble forward");
	output(".");

	output("\n\nBefore you know it, your back is pinned to a cold wall with a randy cat-babe’s hands pawing all over you, stripping you out of your gear and fumbling at the bedroom door. When Shade finds the handle, the both of you go tumbling in backwards in a tangle of limbs and clothes. Your back slams onto the mattress, bouncing with the recoil right into Shade’s tits. She laughs, grabbing your head and burying you in cleavage until you manage to find the hem of her sweater and give it a yank over her head. She grins down, bare-breasted and flushed with arousal while you toss the garment aside. Her pants follow after, thrown aside to give you access to her firm, soft ass. Your fingers sink into her, eliciting a throaty moan from the huntress.");
	output("\n\nShade rears up on her knees, straddling your hips and flipping a long mane of snow-silver hair back over her shoulders. Her hands come to rest on either side of your shoulders, her breasts swaying heavily overhead, so close you can--and do--reach out to nip at them. Her hand, in turn, brushes along your crotch and");
	if(pc.hasCock()) output(" seizes your [pc.cock], giving you a playful stroke");
	else if(pc.hasVagina()) output(" teases a pair of fingers through the lips of your sex");
	else output(" squeezes the barren flesh of your groin");
	output(".");
	output("\n\n<i>“Now,”</i> she purrs, grinding her hips in your hands, <i>“let’s get you nice and warmed up...”</i>");
	
	processTime(15);
	moveTo("UVI P30");
	
	//Insert sex menu here.
	shadeSexMenu();
}

// Introduction: Meeting Shade at her House
public function meetingShadeAtHouse(btnSlot:int = 1):void
{
	flags["NAV_DISABLED"] = NAV_EAST_DISABLE;
	
	if(flags["SHADE_ON_UVETO"] == undefined) return;
	if(!MailManager.isEntryViewed("letter_from_shade") && !MailManager.isEntryViewed("shade_xmas_invite")) return;
	// Have to be invited to her house first!
	if(!shadeIsActive() || flags["SHADE_ON_UVETO"] < 2) return;
	// Add [Buzzer] to the outside of Shade's house, starting at 16:00 each night.
	if(flags["SHADE_ON_UVETO"] == 2 && shadeIsLover() && (shadeIsSiblings() || hours >= 16)) { /* Exception, only for lovers! */ }
	else if(!shadeIsHome() && !astraIsHome())
	{
		addDisabledButton(btnSlot, "Buzzer", "Buzzer", "No one is home at the moment!");
		return;
	}
	
	var response:String = "";
	var tooltip:String = "";
	
	if(flags["SHADE_ON_UVETO"] >= 3)
	{
		var currDate:Date = new Date();
		
		if(MailManager.isEntryViewed("shade_xmas_invite") && isChristmas())
		{
			/* EXCEPTION FOR HOLIDAYS! */
			
			//Never done before or first time this year!
			if(flags["SHADE_XMAS"] == undefined || (flags["SHADE_XMAS"] != undefined && flags["SHADE_XMAS"] < currDate.fullYear))
			{
				response = "ho ho ho";
				tooltip = "This is Shade’s house. Time for some holiday cheer!";
			}
		}
		
		//if(flags["SHADE_IS_YER_SIS"] != -1) flags["NAV_DISABLED"] = undefined;
		else if(flags["SHADE_IS_YER_SIS"] == 0)
		{
			response = "lover sibling decision";
			tooltip = "This is Shade’s house. Time to make a decision about where you want the pair of you to go.";
		}
		else if(MailManager.isEntryViewed("shade_bounty_work")) // && !EVENT_HAPPENED
		{
			response = "bounty";
			tooltip = "This is Shade’s house. Time to assist your lover with that bounty.";
		}

		/* 9999 - Repeat events. Nothing planned yet? */
		else
		{
			response = "disabled";
			tooltip = "There is currently nothing you can do at Shade’s residence at this time.";
		}
	}
	// Lover Shade (Sibling Unrevealed)
	else if(shadeIsLover() && !shadeIsSiblings())
	{
		response = "lover friend intro";
		tooltip = "This seems to be Shade’s house. Tap the doorbell and see what your lover has in mind for you!";
	}
	// Lover Shade w/ Incest
	else if(shadeIsLover() && shadeIsSiblings())
	{
		response = "lover sibling intro";
		tooltip = "This seems to be Shade’s house. A grip of dread clenches at your heart as you approach, but you can’t just leave things the way they are now... can you? Shade wanted to speak to you, at the very least.";
	}
	
	// [Buzzer]
	if(response != "")
	{
		if(response == "disabled") addDisabledButton(btnSlot, "Buzzer", "Buzzer", tooltip);
		else addButton(btnSlot, "Buzzer", approachShadeAtHouse, response, "Buzzer", tooltip);
	}
}
public function approachShadeAtHouse(response:String = "intro"):void
{
	clearOutput();
	author("Savin");
	
	switch(response)
	{
		case "bounty":
			helpShadeClaimThatBounty()
			break;
		case "ho ho ho":
			shadeHolidayKnock();
			break;
		case "lover friend intro":
			showBust(shadeBustDisplay());
			showName("\nSHADE");
			
			moveTo("UVI P30");
			removeUvetoCold();
			
			output("You step up to the front door of the tiny little hut bearing your lover’s name and tap the doorbell. An electronic chime echoes from inside, just barely audible over the howl of the frozen winds over the high walls of Irestead. A moment passes in the cold before a small holoscreen next to the door shudders to life, showing you the familiar, smiling face of a certain kaithrit huntress.");
			output("\n\n<i>“Hey!”</i> she grins, angling the camera on her end up towards herself. Unlike the last time you met, Shade’s ditched her heavy blue duster and simply wrapped herself up in a dark tan sweater that hugs her ample curves loosely and a woolen sock stretched around her reptilian tail, sheathing its lurid sex from sight and its jade scales from the chill. For once she almost looks her age: more hot school mom than deadly space huntress, but the way she smiles invitingly at you, the appeal of your feline lover isn’t lost for a moment.");
			output("\n\n<i>“Well, look who it is!”</i> Shade chuckles, reaching up out of the camera’s view to unlock the door. <i>“I was wondering when you were going to show up. Come on in out of the cold -- I was just cranking the oven on.”</i>");
			output("\n\nA latch disengages and a motor slides the door out of the way with a hiss, revealing a short landing before a stairwell circling downwards out of sight. Looks like the hovel topside is nothing more than an entrance to an underground domicile. You step inside, scooting aside several pairs of fur-lined and steel-girded boots underneath a rack of heavy winter coats" + ((!pc.isNude() && pc.hasFeet() && pc.legCount > 1) ? " and take the hint yourself, taking off your shoes before you track snow inside" : ". You quickly wipe your [pc.feet] off on a mat before you track snow inside") + ".");
			output("\n\n<i>“Down here!”</i> Shade’s voice sing-songs from within, and you’re suddenly aware of a lovely, cinnamon scent wafting up from below. That hurries you up, sure enough: you make your way down the spiraling stairs until you’re sure you’re at least a good ten feet under the icy surface. At the bottom, you’re greeted by colorfully patterned cloth curtains hanging from on high, parting easily to reveal the entrance to Shade’s subterranean abode.");
			output("\n\nThe front room is a comfortable sitting room, with a leather couch curving around a glass coffee table and a holoscreen big enough to cover most of the eastern wall. A few datapads are scattered around the table and blankets are piled up on the arms of the couch, just enough to give the room a lived-in feel where it’s otherwise pristine as a showroom. The walls around you are painted a deep, sandy tan, arranged with shimmering holo-pics of distant worlds -- you recognize Rosha, Terra, and Ausaril among them -- with Shade striking cool and confident poses in most. In others, though, she’s alongside a much younger woman. A kaithrit/ausar hybrid, you guess at a glance, with the same silver-white hair as Shade’s, but fiery orange canine ears and a curling, bushy cat’s tail behind her. The further into the room you go, the older the mixed-race woman gets: from about ten years old, you guess, until she’s taller than Shade and even more voluptuous, with generous curves and sleek muscles underneath skin-tight ballistic armor patterned after the snow.");
			output("\n\nShade’s daughter, you guess. Maybe you’ll get the chance to meet her?");
			output("\n\n<i>“Getting lost in there?”</i> your lover teases, peeking her head around the corner from another room. You grin and turn your attentions toward Shade as she steps out, happily letting yourself be swept up into a hug that transitions into a long kiss, and then a grope of your [pc.butt] when her hands start wandering. When Shade steps back, she leaves her hands on your waist, a smile on her lips and her heavy breasts pressing against your chest, letting you feel the heat of her even through her sweater -- and, you note, that she’s not wearing anything under it...");
			output("\n\n<i>“Welcome to Uveto, " + pc.mf("handsome", "beautiful") + ",”</i> she murmurs. <i>“Glad you managed to find time for a lonely old huntress between your grand adventures. Why don’t you make yourself at home? I’ll be busy in the kitchen just a minute longer.”</i>");
			output("\n\nSomehow, after your first meeting with Shade way back on Myrellion, you’d never have imagined her snuggled up to you and cooking dinner. Never would have guessed Shade had a hidden domestic streak!");
			output("\n\nShe snickers when you mention it, giving you a playful swat on the behind before spinning back into the kitchen door. <i>“Don’t push it! It may come as a surprise to you, but I’m quite the homemaker when I’m not out kicking interstellar ass. I can cook this chicken just as easy as I can clean my arc gun blindfolded.”</i>");
			output("\n\nShade gives you a wink and vanishes back into the kitchen, followed shortly by a sizzling sound from her oven. You turn back to the room and stroll around to the couch, idly calling back a query: who’s the girl in all these pictures.");
			output("\n\n<i>“You mean the beautiful red-ears? That’s my daughter, Astra. She’s about your age, now that I think about it -- just turned eighteen a couple months ago.”</i>");
			output("\n\nWait, Shade’s chasing after " + pc.mf("someone", "a girl") + " her daughter’s age?");
			output("\n\nYou hear a snort from the other room. <i>“Get your head out of the gutter, kiddo. Can’t exactly control the way my heart goes... and besides, we’ve got a lot more in common than... that.”</i>");
			output("\n\n<i>“Sorry,”</i> you laugh, glancing around the pictures of Astra on the walls. She is cute, that’s for sure. Glad you found out now, otherwise you might have ended up flirting with her had you ever met. Speaking of which, <i>“Where’s she now?”</i>");
			// KQ2 done, beat Amara w/o seeing Shade:
			if(completedKQ2Good() && flags["KQ2_SHADE_ENCOUNTERED"] == undefined)
			{
				output("\n\n<i>“Uhh... She’s off in the Cielovia system, right now. Her sire got put in the hospital by some punks, apparently, so she’s off visiting for a bit. Should be home tomorrow, she said. I’ll introduce you, if you’re staying.”</i>");
			}
			// KQ2 done, beat Amara, saw Shade:
			else if(completedKQ2Good())
			{
				output("\n\n<i>“Well, her pop’s in the hospital after you got done with her. She’s recovering back in the Cielovia system, and Astra’s off visiting. Should be home tomorrow, I think. I’ll introduce you.”</i>");
				output("\n\nYou grimace at the sneer Shade gives you when she mentions Amara, but otherwise she doesn’t bring up your... accidental altercation back on Myrellion.");
			}
			else
			{
				output("\n\n<i>“I asked if she wanted to be here, but I think she got a little nervous about meeting mom’s new [pc.boyGirl]friend. Lucky her, my ex was in the neighborhood, so they’re spending the day together. She’ll be home tomorrow, I think -- I’ll introduce you, if you’re staying.”</i>");
			}
			output("\n\n<i>“Are they close?”</i> you ask, settling in on the couch. <i>“Astra and her father, I mean?”</i>");
			output("\n\nShade chuckles. <i>“Her </i>sire<i> -- a woman. Or a hermaphrodite, more accurately. Hunky ausar babe; you’d like her. But yeah, they are. Amara’s got a lot of kids, but I think she took to Astra the most of any. Part of why I insist on staying friends with her, even if the... well, I don’t know if I’d have called it romance, but the lust of it... died off years ago. It’s been good for Astra, for sure.”</i>");
			output("\n\nSo Shade and Amara don’t have anything going...?");
			output("\n\n<i>“Heh, well, get us alone and drunk and we might hook up again for a night now and then. Not the jealous type, are you [pc.name]?”</i>");
			output("\n\nAll things considered, it’d be silly if you were. ");
			output("\n\n<i>“Or was that a little note of desire I heard?”</i> Hoping to get yourself sandwiched into a MILFy threesome, huh?");
			output("\n\nShade laughs from the kitchen, and you’re glad for a moment she can’t see your face. Now whose mind is in the gutter!?");
			
			processTime(8);
			
			// [Next]
			clearMenu();
			addButton(0, "Next", approachShadeAtHouse, "lover friend next");
			break;
		case "lover friend next":
			showBust(shadeBustDisplay());
			showName("\nSHADE");
			
			output("She just keeps laughing, and the smell of seared chicken, cinnamon, and some kind of bread just keeps getting richer. You find yourself yawning and putting a hand on your [pc.belly], feeling it rumble under your touch. Getting hungry all of a sudden. While you’re trying to ignore the growling Shade’s preparations are drawing up from your gut, your attention is caught by a mechanical grinding coming from the other of the two doors leading out. ");
			output("\n\nYou glance over in time to see a tall, sleek canine-shaped drone clicking out from the other room, drawn your way by the smell of food or the commotion of its mistress’s laughing. The doggy-bot is colored pitched black and deep gold on its underbelly, made to look like a Doberman with razor-sharp teeth tucked in its maw. Despite the feral look of it, the drone makes a yawning emote and pads over to you, nuzzling its snout against your [pc.leg].");
			output("\n\n<i>“Greetings, [pc.master],”</i> the drone says in a deeply mechanical voice.");
			// if Tamwolf:
			if(pc.hasTamWolf()) output("\n\nTam-wolf perks up at the other Fenris drone’s approach, loping over to sniff at its sister-bot. The two drones poke at each other with their noses for a moment before, seemingly satisfied, they both plant their butts on the ground and wag their tails at you.");
			output("\n\nYou reach down and pat Shade’s drone on the head, earning a happy, mechanical pant from it. While you’re distracted by the robo-dog, Shade finishes cooking with a resounding <i>POP!</i> of a wine-bottle uncorking. The Fenris drone hops away, startled, and you turn on your seat to see your lover sauntering in with a pair of bubbling wine glasses.");
			output("\n\n<i>“Thirsty?”</i> she offers, sashaying over with a flirty swish of her hips and sock-wrapped tail. <i>“Been saving this bottle since a job on the wine-world itself.”</i>");
			output("\n\nYou have no idea what that is, but you can assume it means good liquor! Shade passes you one of the glasses with a promise of plenty more to come -- if you’ll clear a spot for her to lay out the food. You quickly stack up the datapads, grinning when a few of them activate to reveal pages from <i>Gunslinger Monthly</i>, <i>Sensual Interrogation</i>, and <i>Heavy Weight Ballistics</i> -- the latter two showing off more cleavage than firepower, though neither are in short supply on Shade’s reading list it looks like! ");
			output("\n\nYou manage to stifle a chuckle and clear them off to the side, just in time for Shade to return with what looks like a steaming wok gripped between a pair of mittens. Two pairs of chopsticks are sticking out of the top, propped up between what turns out to be a piping plate of sauce-slathered noodles mixed with chicken and plenty of herbal garnish.");
			output("\n\nShade sets the dish out in front of you with a flourish, followed by a plate of steaming bread, cheeses, and salad, then swings herself into a seat across from you and curls her legs up underneath her. The Fenris drone plops its head right in her lap, sniffing at her hands until she shoos it off.");
			output("\n\n<i>“My signature dish,”</i> she explains with a smile. <i>“A kaithrit favorite. Hope you like it.”</i>");
			output("\n\nYour stomach’s grumbling so much that you don’t have much reservation about grabbing a pair of sticks and digging in. Shade’s eyes linger on you a moment, watching your reaction until she too turns her attention to the feast.");
			output("\n\nTurns out she wasn’t kidding about cooking as well as she slings a gun: the food’s damn good, but the company’s better. Shade’s happy to make small talk while you eat, sharing little stories of her adventures or drawing out details of your own. She laughs at your cousin’s failings, shifts her weight around her chest when you tell of her your more lurid encounters, and smiles at the sweeter ones.");
			output("\n\nBefore long, your belly is full and your dinner companion has scooted closer, nuzzling against your shoulder and sipping down the last of the wine you’ve been sharing. Your arm drapes around her shoulder, holding Shade close as much for the warmth of her as for the touch of a lover. With the food settling in your belly and night drifting closer, a faint chill creeps down even into the depths of Shade’s home. A chill that a lover’s warmth alleviates quite nicely, especially when her hands start wandering, playing across your thighs and chest -- and eventually pull you down into a feather-light kiss, teasing her lips around your own.");
			output("\n\n<i>“Like I said in that email,”</i> she purrs, nuzzling deeper into your chest, <i>“dinner’s just a little something to keep your warm before <b>I</b> do. Unless you’re desperate for those cookies cooling off in the kitchen, why don’t we migrate over to the bedroom...”</i>");
			
			processTime(45);
			eatHomeCooking(90);
			pc.changeHP(50);
			
			// [Next]
			clearMenu();
			addButton(0, "Next", approachShadeAtHouse, "lover friend finish", "Next", "Let’s be honest, you knew this was coming the moment you got the invite. Time to let this hot momma treat you right...");
			break;
		case "lover friend finish":
			showBust(shadeBustDisplay(true));
			showName("\nSHADE");
			
			output("Before you know it, your back is pinned to a cold wall with a randy cat-babe’s hands pawing all over you, stripping you out of your gear and fumbling at the bedroom door. When Shade finds the handle, the both of you go tumbling in backwards in a tangle of limbs and clothes. Your back slams onto the mattress, bouncing with the recoil right into Shade’s tits. She laughs, grabbing your head and burying you in cleavage until you manage to find the hem of her sweater and give it a yank over her head. She grins down, bare-breasted and flushed with arousal while you toss the garment aside. Her pants follow after, thrown aside to give you access to her firm, soft ass. Your fingers sink into her, eliciting a throaty moan from the huntress.");
			output("\n\nShade rears up on her knees, straddling your hips and flipping a long mane of snow-silver hair back over her shoulders. Her hands come to rest on either side of your shoulders, her breasts swaying heavily overhead, so close you can -- and do -- reach out to nip at them. Her hand, in turn, brushes along your crotch and");
			if(pc.hasCock()) output(" seizes your [pc.cock], giving you a playful stroke");
			else if(pc.hasVagina()) output(" teases a pair of fingers through the lips of your sex");
			else output(" squeezes the barren flesh of your groin.");
			output("\n\n<i>“Now,”</i> she purrs, grinding her hips in your hands, <i>“let’s get you nice and warmed up...”</i>");
			
			processTime(5);
			pc.lust(15);
			
			flags["SHADE_ON_UVETO"] = 3;
			
			// Insert sex menu here.
			shadeSexMenu();
			removeButton(14);
			break;
		case "lover sibling intro":
			showBust(shadeBustDisplay());
			showName("\nSHADE");
			
			moveTo("UVI P30");
			removeUvetoCold();
			
			output("You approach the Irons residence with a nervous twitch in your step. Somehow you know this isn’t going to be easy -- Shade was positively freaking out the last time you met, and God knows how the time apart has changed her mind. But you steel yourself: you can’t leave things the way they are now. Your lover... and your sister... is waiting for you.");
			output("\n\nTaking a deep breath, you tap the buzzer beside the door. An electronic chime echoes from inside, just barely audible over the howl of the frozen winds over the high walls of Irestead. A moment passes in the cold before a small holoscreen next to the door shudders to life, showing you the familiar face of the kaithrit huntress. Her natural, cool confidence is gone, replaced by a weary, sad look. Still, Shade forces a smile when she sees you on the holo.");
			output("\n\n<i>“Hey... little " + pc.mf("brother", "sister") + ",”</i> she says, angling the camera up to her face. <i>“I’m glad you decided to come talk. Here, I’ll pop the door. Come on down.”</i>");
			output("\n\nThe screen cuts off unceremoniously, following a click from the door. A motor whirs, sliding it out of the way and revealing a small landing inside, leading into a spiralling stairway down. Looks like the hovel topside is nothing more than an entrance to an underground domicile. You step inside, scooting aside several pairs of fur-lined and steel-girded boots underneath a rack of heavy winter coats" + ((!pc.isNude() && pc.hasFeet() && pc.legCount > 1) ? " and take the hint yourself, taking off your shoes before you track snow inside" : ". You quickly wipe your [pc.feet] off on a mat before you track snow inside") + ".");
			output("\n\nWith one last self-steadying breath, you make your way down. The house itself must be a good ten feet underground, you guess, and the stairs dump you out into a small but cozy living room behind a colorful cloth curtain, dominated by a half-circle couch facing a glass table and a holoscreen that dominates the eastern wall. Shade’s sitting on the couch, one arm thrown over the back and her legs folded beneath her. Her dark blue duster is nowhere to be seen, nor her armor and guns -- she’s just wearing a simple tan sweater over her jeans, showing off much less alabaster cleavage than you remember, though her familiar -- and, you remind yourself, familial -- curves are no less apparent.");
			output("\n\nSomehow, even knowing what you do now, you can’t deny the lingering attraction. She’s as beautiful as ever.");
			output("\n\n<i>“Welcome to Uveto,”</i> she says, with just a hint of a smile. <i>“Come on in. Have a seat.”</i>");
			output("\n\nShe pats the couch beside herself, beckoning you in. You do as she says, sinking into the leather at her side. A moment passes, with Shade eying you with sidelong glances, before she sighs and rests a hand on her temple.");
			output("\n\n<i>“So... um... haha,”</i> she starts, biting her lip to stifle an awkward little laugh. <i>“Damn it. I had a whole thing I’ve been thinking since I left Myrellion, and now... now I can’t remember a word of it. Ha. Look, I... I don’t even know what to think about anything now. But I know that probe was right. I took a DNA test, looked up a few of Victor Steele’s more illustrious bastards, and... yeah. Somehow, of all the things I ever imagined my father to be, trillionaire playboy magnate wasn’t one of them. Honestly, the way mom never talked about him, I was sure he’d have been a whore or a -- well, something darker. Never thought well of him, whoever he was. But now that I know, all I can think about is you.”</i>");
			output("\n\nShade sighs and rolls her head back, letting her silvery hair mask her face from you. <i>“I’m sure you have a lot you want to say, too, but I’ve gotta get this off my chest first: I enjoyed what we had. More than I thought I would. Maybe I’m just lonely, or maybe you’re really that good... but I wouldn’t trade a second I’ve spent with you for a lifetime with my " + pc.mf("brother", "sister") + ". But it also feels so wrong now, like I’ve done something horrible without knowing why. Like somehow, my mother is staring down at me with the most disappointed glare.”</i>");
			output("\n\n");
			if(pc.isNice()) output("You tell Shade you’re sorry. That has to be rough.");
			else if(pc.isMischievous()) output("Oh, is that all? Feeling that way is just another day for you.");
			else output("Could be worse.");
			output("\n\nShe chuckles at that. <i>“Thanks. So that’s where I am... confused and feeling shitty and not wanting you any less. Disgusted with me yet?”</i>");
			
			processTime(12);
			
			// [Want Shade] [Want Sister] [Keep Distance] [Don't Know]
			clearMenu();
			addButton(0, "Want Shade", approachShadeAtHouse, "lover sibling shade", "Want Shade", "No matter what revelations you two have had about each other, your desire for Shade remains unabated. You want her, now more than ever...");
			addButton(1, "Want Sister", approachShadeAtHouse, "lover sibling sister", "Want Sister", "If Shade wants your take on things, well... you want your sister more than your lover. Cut this sexual nature of your relationship off, try and put it behind you, and grow a deeper bond as siblings.");
			addButton(2, "Distance", approachShadeAtHouse, "lover sibling distance", "Keep Distance", "No, you and Shade need to keep your distance after what you’ve done. For both your sakes.");
			addButton(3, "Don’t Know", approachShadeAtHouse, "lover sibling dunno", "Don’t Know", "You don’t know what you feel. Not yet, anyway.");
			break;
		case "lover sibling dunno":
			showBust(shadeBustDisplay());
			showName("\nSHADE");
			
			output("<i>“Fair enough,”</i> Shade sighs, reaching over and putting a hand on your shoulder. A friendly gesture, more than a lover’s touch. <i>“I don’t really know how <b>I</b> feel. Can’t expect any different from you. But... for what it’s worth, if you’re not too disgusted with me and my feelings, I’d like to at least keep in touch. Until you’re sure what you want... either as my half-sibling, or... something else.”</i>");
			output("\n\n<i>“Something else?”</i> you echo.");
			output("\n\nShade’s cheeks flush a bit, but she answers steadily. <i>“I mean that you and I </i>are<i> lovers. We can’t erase what we’ve done. What we were to each other first and foremost. I know we can’t ignore what we are now, either, but... that doesn’t mean what we had before has to end. Does it?”</i>");
			output("\n\nYou turn, looking Shade flat in the eye. She wants to keep seeing you as a lover, is that it? To revel in your incestuous union.");
			output("\n\nHer blush keeps strong, but she nods nevertheless. <i>“I... I do. I don’t care if we’re siblings or not. It doesn’t change how I feel about you. Or how much I want you. Understand?”</i>");
			output("\n\nYou nod. She’s made it plenty clear.");
			output("\n\n<i>“So?”</i>");
			
			processTime(2);
			
			//Keep previous options. Replace [Don’t Know] with [Leave]
			addButton(3, "Leave", approachShadeAtHouse, "lover sibling leave", "Leave", "You need some time to think.");
			break;
		case "lover sibling decision":
			showBust(shadeBustDisplay());
			showName("\nSHADE");
			
			moveTo("UVI P30");
			removeUvetoCold();
			
			output("\n\nTaking a deep breath, you tap the buzzer beside the door. An electronic chime echoes from inside, just barely audible over the howl of the frozen winds over the high walls of Irestead. A moment passes in the cold before a small holoscreen next to the door shudders to life, showing you the familiar face of the kaithrit huntress. Her natural, cool confidence is gone, replaced by a weary, sad look. Still, Shade forces a smile when she sees you on the holo.");
			output("\n\n<i>“Hey... little " + pc.mf("brother", "sister") + ",”</i> she says, angling the camera up to her face. <i>“I’m glad you decided to come back. Here, I’ll pop the door. Come on down.”</i>");
			output("\n\nThe screen cuts off unceremoniously, following a click from the door. A motor whirs, sliding it out of the way and revealing a small landing inside, leading into a spiralling stairway down. Looks like the hovel topside is nothing more than an entrance to an underground domicile. You step inside, scooting aside several pairs of fur-lined and steel-girded boots underneath a rack of heavy winter coats" + ((!pc.isNude() && pc.hasFeet() && pc.legCount > 1) ? " and take the hint yourself, taking off your shoes before you track snow inside" : ". You quickly wipe your [pc.feet] off on a mat before you track snow inside") + ".");
			output("\n\nWith one last self-steadying breath, you make your way down. The house itself must be a good ten feet underground, you guess, and the stairs dump you out into a small but cozy living room behind a colorful cloth curtain, dominated by a half-circle couch facing a glass table and a holoscreen that dominates the eastern wall. Shade’s sitting on the couch, one arm thrown over the back and her legs folded beneath her. Her dark blue duster is nowhere to be seen, nor her armor and guns -- she’s just wearing a simple tan sweater over her jeans, showing off much less alabaster cleavage than you remember, though her familiar -- and, you remind yourself, familial -- curves are no less apparent.");
			output("\n\nSomehow, even knowing what you do now, you can’t deny the lingering attraction. She’s as beautiful as ever.");
			output("\n\n<i>“Welcome back,”</i> she says, with just a hint of a smile. <i>“Come on in. Have a seat.”</i>");
			output("\n\nShe pats the couch beside herself, beckoning you in. You do as she says, sinking into the leather at her side. A moment passes, with Shade eying you with sidelong glances, before she sighs and rests a hand on her temple.");
			output("\n\n<i>“So... decided what you want to do yet?”</i>");
			
			processTime(5);
			
			clearMenu();
			addButton(0, "Want Shade", approachShadeAtHouse, "lover sibling shade", "Want Shade", "No matter what revelations you two have had about each other, your desire for Shade remains unabated. You want her, now more than ever...");
			addButton(1, "Want Sister", approachShadeAtHouse, "lover sibling sister", "Want Sister", "If Shade wants your take on things, well... you want your sister more than your lover. Cut this sexual nature of your relationship off, try and put it behind you, and grow a deeper bond as siblings.");
			addButton(2, "Distance", approachShadeAtHouse, "lover sibling distance", "Keep Distance", "No, you and Shade need to keep your distance after what you’ve done. For both your sakes.");
			addButton(3, "Leave", approachShadeAtHouse, "lover sibling leave", "Leave", "You need some time to think.");
			break;
		case "lover sibling leave":
			showBust(shadeBustDisplay());
			showName("\nSHADE");
			
			output("Shade nods when you make your desire clear, tightening her squeeze on your shoulder. <i>“Alright. I understand. Listen, I’ll be at the bar or here at home most days for a while. Taking some time off for myself. If you want to talk...”</i>");
			output("\n\nYou’ll seek her out.");
			output("\n\n<i>“Alright,”</i> Shade murmurs, standing. <i>“I hope I hear from you soon, [pc.name]. I... just, take care. Alright?”</i>");
			output("\n\nYou nod and follow her up, turning to the stairs out. You’ve got a lot to think about...");
			
			processTime(3);
			
			// Set Shade to sibling status. Disable Sex for now.
			flags["SHADE_ON_UVETO"] = 3;
			flags["SHADE_SEX_DISABLED"] = 1;
			flags["SHADE_IS_YER_SIS"] = 0; // 0 for ambiguous sister
			
			// [Next]
			clearMenu();
			addButton(0, "Next", move, rooms[currentLocation].westExit);
			break;
		case "lover sibling distance":
			showBust(shadeBustDisplay());
			showName("\nSHADE");
			
			output("<i>“Ah,”</i> Shade sighs, leaning back into the couch. <i>“I... no, you’re right. I don’t want to push you, kiddo, you deserve better than that. If staying apart is what you need, then I’ll respect that. Even if it hurts.”</i>");
			output("\n\nYou wanted to tell Shade how you felt. You do so, explaining your reasons for staying apart as best you can. She listens, though you’re not sure you’re making more impact than a proselytizer on the extranet. When you’ve finished, she’s quiet for a long moment.");
			output("\n\nShe rests her head back on the seat, running a hand through her silver hair. <i>“For what it’s worth, just know you’ve got a sister out here who loves you. Who’s here for you, if you need it.”</i>");
			output("\n\nThat’s something, you guess, though it doesn’t change the way you feel.");
			output("\n\n<i>“I didn’t expect it to,”</i> she says quietly. <i>“It’s just the truth. If you change your mind, or just want to talk... well, you know where to find me.”</i>");
			output("\n\nYou nod and stand, stepping away from your lover-turned-sister. She sighs, but doesn’t pursue with so much as a glance as you take your leave.");
			
			processTime(3);
			
			// Set Shade to sibling status. Disable Sex for now.
			flags["SHADE_ON_UVETO"] = 3;
			flags["SHADE_SEX_DISABLED"] = 1;
			flags["SHADE_IS_YER_SIS"] = -1; // -1 for distant sister
			
			// [Next]
			clearMenu();
			addButton(0, "Next", move, rooms[currentLocation].westExit);
			break;
		case "lover sibling sister":
			showBust(shadeBustDisplay());
			showName("\nSHADE");
			
			output("<i>“So that’s it?”</i> Shade says, half-shielding a smile from you. <i>“Just wanna ignore what we were... what we’ve done?”</i>");
			output("\n\nYou nod. You’ll never be able to get the knowledge of your carnal past out of your mind, but the fact that you’re related takes absolute precedence in your mind. You can’t just ignore that... keep doing what you’ve been doing.”</i>");
			output("\n\nShade sighs but nods her understanding, squeezing your shoulder. <i>“I... I can understand that, I guess. Probably the best we can do, given the circumstances. I just... heh, I still can’t believe this really happened, you know? Just all of a sudden my lover turns out to be....”</i>");
			output("\n\nShe smirks and shakes her head. <i>“This is just such a mess. But still, I’m glad we can talk like adults about this. I was expecting... I don’t know what I was expecting. A lot of yelling and crying, probably. But if you want to try and put things behind us, start over like real siblings, I can try. For you, little " + pc.mf("brother", "sister") + ".”</i>");
			output("\n\nYou smile reassuringly, saying that you’re sure the two of you can make it work. You’ve always known you had lots of siblings out there, but this is the first time you’ve really gotten to know one... even if it might be more intimately than you’d have liked. ");
			output("\n\n<i>“You can say that again,”</i> Shade laughs, running a hand through her silvery hair. <i>“Well, maybe not </i>more<i> than I’d have liked.”</i>");
			output("\n\nCocking an eyebrow at Shade, you have to ask: if you’d said something else -- that you wanted to keep your incestuous relationship going -- would she have wanted that?");
			output("\n\nFor once, Shade blushes, quickly turning her eye from you. <i>“I’m not saying that. It’s just that... if I had my way of things, I’d have never found out at all. Call me a lonely old hag if you want, but what we had was... it was good. Wrong, I know, but it never felt that way until I knew better. Not for a moment.”</i>");
			output("\n\nSo she’d rather have never known. Could she have forgive you, if you’d kept the secret?");
			output("\n\n<i>“No,”</i> she laughs. <i>“Eh, I don’t know. Don’t take this the wrong way, I’m happy to have a little " + pc.mf("brother", "sister") + " no matter what. To have you still in my life somehow. Maybe I just wish that probe had told me I was related to some stranger on the street, rather than a lover.”</i>");
			output("\n\nYou suppose that’s easy to understand.");
			output("\n\n<i>“So!”</i> Shade says with a sudden smile, sitting up on the edge of her seat. <i>“Let’s take all of that and put it behind us, huh? Just like you wanted? I’m dying to get to know my little " + pc.mf("brother", "sister") + " as, well, that. Why don’t I make us some dinner, and we can talk. If you think you’re up to it, I’d love to hear more about my -- our -- father. Give me a little insight into the man who sired me, hm?”</i>");
			output("\n\nNow that seems like a good idea...");
			
			processTime(7);
			
			// [Next]
			clearMenu();
			addButton(0, "Next", approachShadeAtHouse, "sibling sister next");
			break;
		case "sibling sister next":
			showBust(shadeBustDisplay());
			showName("\nSHADE");
			
			output("<b>A good while passes in quiet companionship...</b>");
			output("\n\nShade slips through a side door into the kitchen after a bit, cheerily talking around the corner as she starts to cook. She asks questions, mostly about your parents: what kind of man your father was, who your mother was and how they’d met. When you explain your rather unique origins, the plans that had been set ahead of you since before your very conception, she gives you what sympathetic encouragement she can: <i>“Better to know you’re wanted, at least.”</i>");
			output("\n\nIs it? Sometimes you’re not entirely sure.");
			output("\n\nWhile you’re talking, sweet smells start wafting out from the kitchen. A sizzling chicken smell, hot bread, and something faintly hinting at cinnamon. Your stomach grumbles all of a sudden, awoken by the delicious scents starting to overtake the subterranean homestead. Somehow, after your first meeting with Shade way back on Myrellion, you’d never have imagined her snuggled up to you and cooking dinner. Never would have guessed Shade had a hidden domestic streak!");
			output("\n\nShe snickers when you mention it, leaning around the corner to stick her tongue out at you. <i>“It may come as a surprise to you, but I’m quite the homemaker when I’m not out kicking interstellar ass. I can cook this chicken just as easy as I can clean my arc gun blindfolded.”</i>");
			output("\n\nShade refuses to let you help in the kitchen, citing something about kaithrit hospitality, so while she’s busy you find yourself wandering around the living room. The walls around you are painted a deep, sandy tan, arranged with shimmering holo-pics of distant worlds -- you recognize Rosha, Terra, and Ausaril among them -- with Shade striking cool and confident poses in most. In others, though, she’s alongside a much younger woman. A kaithrit/ausar hybrid, you guess at a glance, with the same silver-white hair as Shade’s, but fiery orange canine ears and a curling, bushy cat’s tail behind her. The further into the room you go, the older the mixed-race woman gets: from about ten years old, you guess, until she’s taller than Shade and even more voluptuous, with generous curves and sleek muscles underneath skin-tight ballistic armor patterned after the snow.");
			output("\n\nShade’s daughter, you guess?");
			output("\n\n<i>“You mean the beautiful red-ears? You got it: that’s my baby girl, Astra. She’s about your age, now that I think about it -- just turned eighteen a couple months ago.”</i>");
			output("\n\nAny chance of you getting to meet your niece some time? The way she’s kitted up, Astra strikes the appearance of an adventurer like yourself. Considering how you and Shade hit it off, you’d probably get along.");
			output("\n\nSilently, you add that you’re glad you found out now, otherwise you might have ended up flirting with her had you ever met.");
			// KQ2 done, beat Amara w/o seeing Shade:
			if(completedKQ2Good() && flags["KQ2_SHADE_ENCOUNTERED"] == undefined)
			{
				output("\n\n<i>“Uhh... She’s off in the Cielovia system, right now. Her sire got put in the hospital by some punks, apparently, so she’s off visiting for a bit. Should be home tomorrow, she said. I’ll introduce you, if you’re staying.”</i>");
			}
			// KQ2 done, beat Amara, saw Shade:
			else if(completedKQ2Good())
			{
				output("\n\n<i>“Well, her pop’s in the hospital after you got done with her. She’s recovering back in the Cielovia system, and Astra’s off visiting. Should be home tomorrow, I think. I’ll introduce you.”</i>");
				output("\n\nYou grimace at the sneer Shade gives you when she mentions Amara, but otherwise she doesn’t bring up your... accidental altercation back on Myrellion. You guess your sibling revelation has mollified her distrust of you, for now at least.");
			}
			else
			{
				output("\n\n<i>“I didn’t want her around for this. Lucky her, my ex was in the neighborhood, so they’re spending the day together. She’ll be home tomorrow, I think -- I’ll introduce you, if you’re staying.”</i>");
			}
			output("\n\n<i>“Are they close?”</i> you ask, settling in on the couch. <i>“Astra and her father, I mean?”</i>");
			output("\n\nShade chuckles. <i>“Her </i>sire<i> --");
			// Shade wasn’t at KQ2:
			if(flags["KQ2_SHADE_ENCOUNTERED"] == undefined) output(" a woman. Or a hermaphrodite, more accurately. Hunky ausar babe; you’d like her.");
			else output(" Amara’s a woman, remember? I know that gorilla armor of hers isn’t exactly flattering on her figure, but she’s a she. At least above the belt.");
			output("\n\nBut yeah, they are. Amara’s got a lot of kids, but I think she took to Astra the most of any. Part of why I insist on staying friends with her, even if the... well, I don’t know if I’d have called it romance, but the lust of it... died off years ago. It’s been good for Astra, for sure.”</i>");
			output("\n\nSo Shade and Amara don’t have anything going...?");
			output("\n\nShe laughs from the kitchen, and you’re sure you hear her almost choke on something she was tasting. <i>“Uh... no, we don’t. Not unless we’re drunk and lonely, anyway, but that’s just a night’s fun -- nothing serious anymore.”</i>");
			output("\n\n<i>“I’d say something about you being the jealous type, but... I guess it doesn’t matter anymore, does it?”</i> Shade murmurs from the other room. <i>“Agh. Sorry, that was... I don’t want to start that. Yeah, Amara and I are pretty much done. I guess for the moment, that makes me single again. Gonna have to start e-dating again if this keeps up.”</i>");
			output("\n\nYou let the comment pass, fairly sure Shade’s not trying to be nasty... though she’s not making this easy, either. The way she keeps talking, though, you’re not convinced she’s happy with your choice. Could she really have wanted to keep on as lovers, or is this just her way of coping? Guess you’ll have to see.");
			
			// Pass 1 hour
			processTime(64);
			
			// [Next]
			clearMenu();
			addButton(0, "Next", approachShadeAtHouse, "sibling sister finish");
			break;
		case "sibling sister finish":
			showBust(shadeBustDisplay());
			showName("\nSHADE");
			
			output("Shade keeps cooking, and you keep getting hungrier. The conversation turns pleasant again soon enough, at least, and you find yourself laughing as Shade regales you with some of her own adventures: capturing a famous pirate who’d accidentally given herself the New Texan Treatment, or finding herself face to face with a drunken planetary governor who insisted on being her sidekick on a deadly jetbike chase.");
			output("\n\nStill, you find yourself putting a hand on your [pc.belly], feeling it rumble under your touch. While you’re trying to ignore the growling Shade’s preparations are drawing up from your gut, your attention is caught by a mechanical grinding coming from the other of the two doors leading out.");
			output("\n\nYou glance over in time to see a tall, sleek canine-shaped drone clicking out from the other room, drawn your way by the smell of food or the commotion of its mistress’s laughing. The doggy-bot is colored pitched black and deep gold on its underbelly, made to look like a Doberman with razor-sharp teeth tucked in its maw. Despite the feral look of it, the drone makes a yawning emote and pads over to you, nuzzling its snout against your [pc.leg].");
			output("\n\n<i>“Greetings, [pc.master],”</i> the drone says in a deeply mechanical voice.");
			// if Tamwolf:
			if(pc.hasTamWolf()) output("\n\nTam-wolf perks up at the other Fenris drone’s approach, loping over to sniff at its sister-bot. The two drones poke at each other with their noses for a moment before, seemingly satisfied, they both plant their butts on the ground and wag their tails at you.");
			output("\n\nYou reach down and pat Shade’s drone on the head, earning a happy, mechanical pant from it. While you’re distracted by the robo-dog, Shade finishes cooking with a resounding <i>POP!</i> of a wine-bottle uncorking. The Fenris drone hops away, startled, and you turn on your seat to see your sister sauntering in with a pair of bubbling wine glasses.");
			output("\n\n<i>“Thirsty?”</i> she offers, sauntering over with a wiggle of her sock-wrapped tail. <i>“Been saving this bottle since a job on the wine-world itself.”</i>");
			output("\n\nYou have no idea what that is, but you can assume it means good liquor! Shade passes you one of the glasses with a promise of plenty more to come - if you’ll clear a spot for her to lay out the food. <i>“Almost done,”</i> she promises.");
			
			pc.imbibeAlcohol(10 + rand(5));
			
			output("\n\nYou quickly stack up the datapads, grinning when a few of them activate to reveal pages from <i>Gunslinger Monthly</i>, <i>Sensual Interrogation</i>, and <i>Heavy Weight Ballistics</i> -- the latter two showing off more cleavage than firepower, though neither are in short supply on Shade’s reading list it looks like!");
			output("\n\nYou manage to stifle a chuckle and clear them off to the side, just in time for Shade to return with what looks like a steaming wok gripped between a pair of mittens. Two pairs of chopsticks are sticking out of the top, propped up between what turns out to be a piping plate of sauce-slathered noodles mixed with chicken and plenty of herbal garnish.");
			output("\n\nShade sets the dish out in front of you with a flourish, followed by a plate of steaming bread, cheeses, and salad, then swings herself into a seat across from you and curls her legs up underneath her. The Fenris drone plops its head right in her lap, sniffing at her hands until she shoos it off.");
			output("\n\n<i>“My signature dish,”</i> she explains with a smile. <i>“A kaithrit favorite. Hope you like it.”</i>");
			output("\n\nYour stomach’s grumbling so much that you don’t have much reservation about grabbing a pair of sticks and digging in. Shade’s eyes linger on you a moment, watching your reaction until she too turns her attention to the feast.");
			output("\n\nTurns out she wasn’t kidding about cooking as well as she slings a gun: the food’s damn good, but the company’s better. Shade’s happy to make small talk while you eat, letting you talk again this time: before long, your belly is full and your dinner companion has sprawled back out on the couch, sipping at her wineglass while you tell of the first probe you found, and your climactic meeting with [rival.name] and Dane.");
			output("\n\n<i>“Glad to know I have shitty relatives, too,”</i> Shade laughs. <i>“[rival.HeShe] actually shot at you with a gunship? Could have killed you.”</i>");
			output("\n\nLucky you, [rival.heShe]’s either an awful shot, or just wanted to scare you off.");
			if(nyreaDungeonFinished()) output(" Either way, you saw [rival.himHer] get thoroughly humiliated by " + ((flags["FUCKED_TAIVRA"] != undefined && flags["KILLED_TAIVRA"] == undefined) ? "your mated queen" : "a bug-queen") + " on Myrellion. Fair trade, almost.");
			else output(" You’ll get the " + rival.mf("bastard", "bitch") + " back for that some time.");
			output("\n\n<i>“I’m sure,”</i> Shade smirks. <i>“It’s your adventure and all, but still let me know if I can help out sometime. [rival.name] sounds like [rival.heShe] needs a cousin like me to bend ‘em over my knee.”</i>");
			output("\n\nOh, that’d be something to see. Still, you gotta ask: does she really have no interest in the Steele fortune? Apparently the probes activate for her, so she could just as easily do what your cousin has and join the race illicitly.");
			output("\n\n<i>“Oh, I’m sure. As much as unlimited wealth sounds nice, I don’t think I’d be C.E.O. material. Probably get run out by your stockholders before I was finished putting my boots up. If you want to pay an exorbitant price for a chief of security or something when you get in, though, let me know. I’d be happy to sit on my ass at a desk for ya. Or maybe punt Astra over to you for a bit: she’s gonna be looking for a job before long.”</i>");
			output("\n\nWell, that’s one way to keep the family together, you suppose. Either way, you’re happy to hear Shade won’t be your enemy going forward. She chuckles and finishes her glass, setting it aside with a contented smile. <i>“Anyway... it’s getting kind of late. What do you say I pack you up some of those cookies cooling in the kitchen and we call it a night, kiddo? Let an old woman get some sleep after all this.”</i>");
			output("\n\nYou’d hardly call Shade old, but cookies are a decent enough bribe to get you going if she needs her beauty rest. She laughs and swings herself off the couch, giving you a kiss on the top of the head in passing before disappearing into the kitchen. When she returns, there’s a sealed plastic tub of cinnamon cookies in her hands, with some small heater device clipped inside to fight off the blasting chill outside. You take them with thanks and turn towards the stairs.");
			output("\n\n<i>“See you soon, little " + pc.mf("brother", "sister") + ",”</i> Shade says as you go. <i>“Stick around Uveto for a bit and I’ll introduce you to your niece -- just to make sure you know who’s family around here.”</i>");
			output("\n\nShe laughs and gives you a swat on the behind, pushing you towards the stairs. Oh, Shade...");
			
			// Pass another hour. Restore some Health + Energy.
			processTime(60 + rand(16));
			eatHomeCooking(90);
			pc.changeHP(50);
			
			// Set Shade to Sister mode. Disable sex.
			flags["SHADE_ON_UVETO"] = 3;
			flags["SHADE_SEX_DISABLED"] = 1;
			flags["SHADE_IS_YER_SIS"] = 1; // 1 for close sister
			
			// [Next]
			clearMenu();
			addButton(0, "Next", move, rooms[currentLocation].westExit);
			break;
		case "lover sibling shade":
			showBust(shadeBustDisplay(true));
			showName("\nSHADE");
			
			output("<i>“Even after everything...?”</i> Shade murmurs, eying you as you confess your lingering desires. She smiles faintly as you finish, shifting so that a lock of silver hair falls across her face, shielding it from your view. <i>“You still want me, huh?”</i>");
			output("\n\nYou do. No question about it.");
			output("\n\nYou’ve barely gotten the words out before Shade’s hands are on you, pulling you fast against her. For a moment you think she’s going to strangle you, but just as quickly, the thought fades: her lips find yours, pressing against them with a fire you haven’t felt since the first time you and your sister made love. Without thinking, your hands wrap around her wrists, pushing her back against the cold leather of the couch and driving the kiss back until Shade’s moaning around your [pc.lips], and your hands are wandering across her body. Her heavy breasts heave into your grasp under her sweater, revealing stiff nipples that brush your palms through the thick fabric. No bra, nothing to stop you from getting your fill of your lover’s panting chest.");
			output("\n\nYou hold her close, groping and kissing and feeling the burn of arousal ignite within you like never before. You need her desperately, like an addict so deep in withdrawal that you can’t see light anymore. Her shirt comes off with a tear, and then your head is being guided, pushed between the lush mounds. Shade’s back arches, thrusting them out against your cheeks, and her hands lock firmly around your hips to draw you into herself. She slides onto her back, wrapping her strong legs around your waist to pull you down with her, keeping you firmly planted in the loving embrace of her breasts and thighs.");
			output("\n\n<i>“Oh fuck,”</i> Shade moans, and you’re not sure if it’s because one of your hands has just forced its way down her pants, brushing the tips of your fingers through that familiar gulf between her legs. <i>“Are we... are you sure, [pc.name]. I don’t--”</i>");
			output("\n\nIt doesn’t <i>feel</i> wrong, does it? And the way she kissed you just now, you <b>know</b> that Shade feels the same way you do. Fuck family, convention, all of that... you want your lover more than anything.");
			output("\n\nShe gasps as your fingers slip inside, but a moment later, her muscles grip down on you, drawing you in. <i>“Okay. Okay! Fuck, I want it! I want <b>you</b>, [pc.name].”</i>");
			output("\n\nHer fingers brush your chin, turning it up to look her in the eye. <i>“Let’s just pretend we never found that probe, huh? Just you and me, strangers that met in a bar and hit it off... right?”</i>");
			output("\n\nIf that’s what it takes for Shade to live with herself and keep banging you, so be it. You meet her gaze with a kiss, and soon find yourself being pulled towards the bedroom. A naughty shiver of pleasure runs through you as your sister-cum-lover pushes you into the room, throwing you back on her bed and straddling you, tearing away your gear until her hands rest on your bare [pc.chest], and her panties are grinding against your crotch.");
			output("\n\n<i>“Just like old times,”</i> she purrs, pinching a nipple. <i>“Let’s burn out those memories, huh?”</i>");
			
			processTime(5);
			pc.lust(15);
			
			flags["SHADE_ON_UVETO"] = 3;
			flags["SHADE_IS_YER_SIS"] = 2; // 2 for incest sister
			
			// Insert Shade's sex menu.
			shadeSexMenu();
			removeButton(14);
			break;
	}
}
// Inside Shade's House
public function ironsHouseBonus():Boolean
{
	output("9999 - Room Description");
	
	removeUvetoCold(true);
	
	// 9999 - Shade menu?
	
	return false;
}

/* Shade Expansion 2: Punishing a Pirate Lord */

public function getMailBountyWork():void
{
	// Shade must be lover, must have fought Amara KQ2_FOUGHT_AMARA is set????, must have done other Shade scenes
	if(!shadeIsLover() || flags["SHADE_ON_UVETO"] < 3) return;

	if(!MailManager.isEntryUnlocked("shade_bounty_work")) goMailGet("shade_bounty_work");
}

public function createBountyEmailShade():String
{
	var msg:String = "";
	msg = "Hey Kiddo,\n\n";
	msg += "Had a real dangerous bounty fly into Irestead today. Been looking for this one for a long time. We had ourselves a real rough-and-tumble scuffle just now, but I got 'em tied up here at the house. Could you come over and give me a hand? Need someone I can trust.\n\n";
	msg += "Love ya,\n";
	msg += "-Shade";
	return msg;
}

public function helpShadeClaimThatBounty():void
{
	move(rooms[currentLocation].eastExit);
	clearOutput();
	author("Savin");
	showBust(shadeBustDisplay());
	showName("\nSHADE");

	output("You’ve barely made it to Shade’s porch before the door slides open automatically, admitting you entrance to the little above-ground bungalow. You descend quickly, keeping a hand on your [pc.weapon] until you reach the cozy living room at the bottom of the stairs.");
	output("\n\nShade’s there waiting, wearing just her shirt and jeans");
	if(pc.IQ() > 66) output(", not even her shoes or her gunbelt, you notice");
	output(".");

	output("\n\n<i>“Hey, [pc.name]. Glad you made it,”</i> she says, giving you a half-smile that transitions into a rough kiss. <i>“Had a real hard time wrangling this bounty of mine. Need some help finishing the job, though... and I couldn’t think of anyone better. One thing, though: need you to secure your weapons here. Trust me, we’ll all be safer without a [pc.weapon] swinging around in my house.”</i>");

	if(pc.isBimbo()) output("\n\n<i>“Kay!”</i> you answer cheerily, tossing your weapons onto Shade’s couch.");
	else output("\n\nYou quirk an eyebrow at Shade, earning a shrug in answer. <i>“Look, if you </i>need<i> a weapon in here, I’ve fucked up real bad already. Just need your help manhandling my quarry. C’mon, gimme a little credit here.”</i>\n\n<i>“Alright...”</i> you say, disarming.</i>");

	output("\n\n<i>“Thanks,”</i> Shade grins. She tosses your arsenal into a locker on the wall and closes it tight. <i>“Now follow me. Got ‘er tied up just through here...”</i>");

	output("\n\nShade puts a hand on your shoulder and gives you a little push towards her bedroom. Huh. You follow her guidance, stepping into a pitch-black room. She closes the door behind you, and you hear a <b>click</b> of the lock engaging. The lights snap on a second later, bathing Shade’s bedroom in sultry dim glow.");

	output("\n\nAs promised, there's somebody tied up... in the bed. It takes a second for you to recognize her in the mood lighting, especially half-naked and bound by a pair of big, fuzzy pink handcuffs hanging from over the headboard. The first thing you alight on is a wild mane of curly red hair, falling down the figure's pale and freckled shoulders. A tail of the same bright ginger thrashes against the bedsheets between her legs, matching the coat on her forearms and legs. An ausar, with a pair of leaf-green eyes glowering at you from under her bangs, and a lush set of blue-painted lips sucking a geek ball firmly strapped around her face.");

	output("\n\nShe's wearing nothing but a lacy black bra with cups that part around her nipples, and a tight pair of panties that hug an impressive bulge of doggy knot and plump fleshy balls.");

	output("\n\nIt's Amara, the pirate lord.");

	clearMenu();
	addButton(0, "Next", shadeDisplaysHerBounty);
}

public function shadeDisplaysHerBounty():void
{
	clearOutput();
	author("Savin");
	showBust(shadeBustDisplay(), amaraBustDisplay());
	showName("SHADE\n& AMARA");

	output("Before you can fully register what you're seeing, Shade's hand tightens on your shoulder. <i>“Listen, kid. I love ya something fierce, but Amara here's my kid's other parent. Always been good to us... to her... so I'm not gonna let you and me bein' a thing hurt Astra. That means you and Amy here need to work out whatever bad blood you've got. This is your chance to vent all those frustrations. You gonna be a good girl and let [pc.name] work it all out, Amy?”</i>");

	output("\n\nThe only answer you get is a mighty throb from under the Dread Lord's panties. Her crimson cock peeks out from the band, rubbing against her belly.");

	output("\n\n<i>“Do what you gotta do, [pc.name]. Just don't hurt her, and we can call everything even after this. Can't we? I ain't gonna try and make you be friends, but I can't have you two trying to hurt each other again. Understand?”</i>");

	// PC won against Amara:
	if(flags["KQ2_QUEST_FINISHED"] == 1) output("\n\nConsidering what happened to Amara at the end of your last encounter, you'd think you'd be the one tied up. She lost, after all.");

	output("\n\nWith a husky whisper in your [pc.ear], Shade adds, <i>“Just between you and me... the mighty Dread Lord of the Void here is a shameless submissive slut. She likes to pretend she's a scary swingin' dick among the big bad pirates, but I've had nineteen years to find out all her little secrets. She's going to enjoy this as much as you will. Maybe more. So go on... whatever your twisted little libido can dream up.”</i>");

	clearMenu();
	addButton(0, "Take Dick", jumpThatPirateLord, undefined, "Take Dick", "You're not one to pass up a chance to ride a thick, red Ausar knot. Especiallly when it's attached to a smoking hot MILF who's more dangerous than half the foes you've faced so far put together.");
	if(pc.hasCock()) addButton(1, "Give Dick", enterThatPirateLord, undefined, "Give Dick", "You can see a cute muff under the pirate lord's balls, glistening in the mood light. It's hard to pass up a chance to breed a smoking hot MILF who's more dangerous than half the foes you've faced so far put together. Maybe you can give Astra a new sibling...");
	else addDisabledButton(1, "Give Dick", "Give Dick", "You can see a cute muff under the pirate lord's balls, glistening in the mood light. It's hard to pass up a chance to breed a smoking hot MILF who's more dangerous than half the foes you've faced so far put together. Maybe you can give Astra a new sibling... (Requires a cock.)");
	addButton(2, "With Shade", sailWithShade, undefined, "With Shade", "Can't handle the big, bad pirate lord alone? Why not bring in some MILFy backup?");
	addButton(3, "No Thanks", noThanksForThePirateLord, undefined, "No Thanks", "Uh... no thanks. This is getting weird.");
}

public function noThanksForThePirateLord():void
{
	clearOutput();
	author("Savin");

	output("<i>“This is getting a little weird for me, Shade,”</i> you say, squirming out of her grip. This ain’t really your thing.");

	output("\n\nShe scowls, hands on her hips. <i>“Listen, [pc.name], I’m not joking around when I say I can’t have you and Amara at each others’ throats. If you want to stay with me, you two gotta work <b>something</b> out. For Astra’s sake.”</i>");

	output("\n\nShade sighs and sits down on the foot of the bed, looking up at you. <i>“I thought this’d be a nice surprise. Way to bury the hatchet in a way we’d all enjoy... I know all about that legendary Steele libido, and trust me, ours isn’t that far behind. I figured... I don’t know. Clearly <b>wrong</b>, whatever I thought. I just need to make this work <b>somehow</b>.”</i>");

	output("\n\nIt’s an understandable position, even if Amara is a pirate. You might not want to bone down with a Dread Lord, but can you at least understand where Shade’s coming from. Right?");


	clearMenu();
	addButton(0, "Make Peace", makePeaceWithThePirateLord, undefined, "Make Peace", "You'll put aside your grudge with Amara. For Shade and Astra's sake.");
	addButton(1, "No Way", noWayPirateLord, undefined, "No Way", "You aren't going to go soft on pirate scum. Not now, not ever.");
}

public function makePeaceWithThePirateLord():void
{
	clearOutput();
	author("Savin");

	output("You sigh and, after a moment’s hesitation, say that for Shade and Amara’s sake, you’ll let bygones be bygones.");

	output("\n\nShade grins ear to ear and slaps Amara’s thigh. <i>“Hear that, Amy? Looks like [pc.name]’s willing to be a good sport. How about you, hmm?”</i>");

	output("\n\nThere’s a series of wordless grunts from around Amara’s geek ball, and she yanks hard on the fluffy handcuffs. Shade chortles and reaches back to pull the gag out, just in time for Amara to bark out, <i>“That cattle prod fucking <b>hurts</b>, too!”</i>");

	output("\n\nShade’s only response is another laugh. Amara huffs, bites her lip, and turns to you. <i>“You ");
	// PC sold out Kara:
	if(flags["KQ2_BETRAYED_KARA"] == 1 && flags["KQ2_QUEST_FINISHED"] == 2) output("were just duped by that smuggler bitch. I’ve got no bad blood with you, Steele.”</i>");
	// PC beat Amara and Kara lived:
	else if(flags["KQ2_QUEST_FINISHED"] == 1) output("managed to crush my XO and hand me my own ass pretty good. I’d rather have you as an ally... or at least, not as an enemy. If you can let it go, so can I.”</i>");
	// Kara died protecting PC:
	else output("mean that, even after your blue kitty pasted herself on my armor? Damn, that’s kind of cold... but if you’re willing, and it’s what Shade wants, I can overlook a broken leg and broken XO, too.”</i>");

	output("\n\n<i>“That’ll have to do,”</i> Shade says, grabbing the pillow out from under Amara’s head and tossing it over the pirate’s naked crotch. <i>“So, uh, I guess I should untie you, huh Amy?”</i>");

	output("\n\nAnd that’s your cue to leave, looks like. You give Shade a parting kiss on the cheek before slipping out of the room, leaving your lover and hers to their own devices. At least now you won’t have to worry about Amara’s pirates coming after you - though the rest of the Black Void may yet be another question.");


	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

public function noWayPirateLord():void
{
	clearOutput();
	author("Savin");

	output("You shake your head vigorously and step away from Shade and Amara, saying you aren’t going to be letting pirate scum off that easy. Certainly not in exchange for kinky sex.");

	output("\n\nShade sighs long and hard, rubbing her face with her hands. You decide to slip away while you can, before Shade can throw a fit over the answer. She’s going to have to find some way to make this work, not you - she’s the one who decided it would be a good idea to have a kid with a pirate lord.");

	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

public function jumpThatPirateLord():void
{
	clearOutput();
	author("Savin");

	output("Well, for Shade’s sake, you suppose you can plant yourself on that thick red rocket and take advantage of her tied-down paramore.");

	output("\n\n<i>“I knew you had it in you,”</i> Shade chuckles, nipping your [pc.ear]. <i>“Have at her, [pc.name].”</i>");

	output("\n\nYou pull your [pc.gear] off, letting an unabashedly lustful grin spread across your [pc.lips]. Amara, the pirate Dread Lord in all her near-naked glory, stares at you with wide eyes. There’s a little concern there, you’re sure, if not outright fear - but as you bare more and more [pc.skinFurScales], giving your [pc.butt] a little slap, you can see the hunger in there as well. Her crimson futa-cock starts rising off her belly of its own accord, wobbling in the air by the time you approach.");

	output("\n\nBehind you, Shade leans back against the door - and you’re pretty sure you hear a zip-down from her jeans. You wonder, briefly, if Shade likes to watch this sort of thing? You haven’t really asked what gets the MILFy kitty going, come to think of it. Just about everything you do seems to, at least, so for now you’ll just have to make a show of it.");
	// PC is Bimbo/Bro:
	if(pc.isBimbo() || pc.isBro()) output(" Good thing you’ve got the body and the confidence for it!");

	output("\n\nFlashing a quick grin over your shoulder, you crawl up onto the bed on all fours, planting your hands on either side of Amara’s wolven ears and roll your [pc.tongue] up one of her D-cup tits. You flick the nipple hard enough to make Amara wince - and make her dick throb, slapping against your thigh. <i>“Are they sensitive?”</i> you wonder aloud, tracing your hands down to the Dread Lord’s tits. You squeeze the pair of them, letting your fingers sink into the soft, freckled flesh. She’s got big, dark nipples, each stiff enough that you can feel every ridge and pebble as your palms brush over them. You can feel the pirate-bitch gasping, and her back arches off the bed - which only pushes her tits further into your hands.");

	output("\n\nWhile your hands continue to play with Amara’s tits, you subtly shift your [pc.hips] so that your [pc.vagOrAss] is rubbing against her rock-hard pride. The pirate tenses, thrusting her hips up to meet you, but her tapered crown just skids off your thigh, poking you in the [pc.belly]. <i>“Enough of that!”</i> you chastise, sitting straight down on her pelvis. She’s the one wrapped up like a pretty little present for you, after all; you’re going to enjoy her at your own pace. Only when she stops squirming, surrendering to your two-fisted molestation of her chest, do you deign to start moving your hips.");

	output("\n\n<i>“Ohhh,”</i> Shade purrs, <i>“I think you’ve got a hidden dom{me} streak in you! How have you let me take this lead all this time...”</i>");

	output("\n\n<i>“It just seemed natural.”</i> You give her another grin and lift yourself on your [pc.knees], letting Amara’s cock naturally find its way through the cleft of your ass before you come back down. The bound pirate moans as your cheeks squeeze her, but her eyes go wild with desire when you lift again, and her crown manages to rub against the entrance of your [pc.vagOrAss]. You pinch her nipples just before sliding down on that thick puppy-cock, making sure you have this randy bitch’s <b>full</b> attention all the way down.");

	output("\n\nAmara’s dick is thicker than average, but the length’s nothing to write home about - eight inches, about average for an ausar. {Indeed, it reminds you distinctively of Kaede’s as you settle down on it.} The knot’s nice and bulky, at least, and presses up between your thighs when you easily bottom out on its owner’s shaft. She throbs desperately inside you, shaking her hips like she wants to wedge that big bitch-breaker inside you already.");

	output("\n\nNone of that, now. You give the wicked pirate a slap across the cheeks - just a gentle one to remind her of her place. Shade’s earlier suggestion bears out, and you feel Amara’s cock throb powerfully inside you. Warm precum spills out into your [pc.vagOrAss], and a dark flush spreads across the pirate’s cheeks far larger than the one your palm left. A little line of drool meanders down from around her ball gag, accompanying a moan that sounds awfully more like pleasure than pain.");

	output("\n\nSomewhere behind you, Shade snickers, followed by some meaty wet sound from inside her jeans. You grin down at Amara, watching her blush spreading, and ask <i>“Oh, you like that, huh?”</i>");

	output("\n\nShe squirms, trying to look away from you... so you bring a hand back and give her one from the other side. Her red rocket just about takes off, so hard all of a sudden that it feels more like steel than flesh. Her rosey little nipples become stiff points thrusting up from inside her lacey bra, begging you to reach down and pinch them. You do so with gusto, starting to work your hips around her tool while you pull and twist. If the Dread Lord likes it rough, you’re more than happy to give it to her.");

	output("\n\nYou start bouncing your hips, taking the pirate’s thick red pride deep while your hands stay busy torturing her nipples and giving her ever-rougher slaps when Amara tries to squirm or struggle underneath you. Her mascara streams down the sides of her face, accompanied by drool from around her geek ball. What a mess! You sneer and laugh, playing up how much you enjoy her degradation, all the while riding her dick harder and harder.");

	output("\n\nYou tell her that’s she’s such a dirty girl. What an absolute masochist. Who’d have thought the infamous Dread Lord Faell would get so hard from you slapping her around?");

	output("\n\nShame and arousal are both clear on her face, but she can’t hide her arousal. You can <b>feel</b> how close to cumming she is already, the way her dick throbs and leaks inside you. The juicy sounds coming from Shade are getting louder, too - seems like both of your MILFs are enjoying the performance. Better end this on a high note, huh?");

	output("\n\nYou grab the pirate lord’s big, ginger ears and give them a rough pull while you slam yourself down on her knot, moaning as your [pc.vagOrAss] spreads around the thick tie. Amara squirms, bucking her hips to try and thrust it up into you with desperate desire... and this time, you go ahead and let her act out her body’s breed-hungry needs. Your fuckhole accepts her fat bitch-breaker, sending shockwaves of pleasure pounding through your loins.");

	output("\n\nAmara blabbers something through her geek ball, and you feel her cock swelling inside you. Her knot throbs, and you can feel her pounding heart rate through it right until a burst of warmth fills your [pc.vagOrAss]. You gasp, pulling on Amara’s ears and growling her name while she cums, demanding that she thrust herself even deeper inside until you, too, join her in climax. {pc.hasCock|Your [pc.cock] pumps its load all over the pirate lord’s bare, clamped tits, painting them [pc.cumColor] while she packs you with her own creamy load.|Your [pc.vagOrAss] trembles as the pirate lord’s tapered dick packs it with squirt after squirt of white warmth.] Pretty soon those palmable pale balls of hers are clenching under your [pc.butt], tensing over and over again until they’re empty and your belly is stuffed with warm contentment.");

	output("\n\n<i>“Fuck! That was hot,”</i> Shade laughs. A moist hand slaps your ass, and your lover takes a seat beside you, grinning down at her partner. <i>“I’ve never seen you cum so fast, Amy. What happened to my big ol’ fuckbeast, huh?”</i>");

	output("\n\nAmara’s eyes narrow, and she says something into her gag. Shade just snickers and runs her hand from your flanks up Amara’s belly, tweaking a tit before finally cupping her chin. Finally, she reaches down and unbuckles the ball gag, pulling it free... and pulling a six-inch spear of latex out of Amara’s throat attached to the inside of it.");


	clearMenu();
	addButton(0, "Next", finishWithThePirateLord);
}

public function enterThatPirateLord():void
{
	clearOutput();
	author("Savin");

	output("Well, for Shade’s sake, you suppose you can ignore Amara’s misdeeds long enough to fuck her silly. In her tied-down position, it’s the perfect opportunity to take your revenge.");

	output("\n\n<i>“I knew you had it in you,”</i> Shade chuckles, nipping your [pc.ear]. <i>“Have at her, [pc.name].”</i>");

	output("\n\nYou pull your [pc.gear] off, letting an unabashedly lustful grin spread across your [pc.lips]. Amara, the pirate Dread Lord in all her near-naked glory, stares at you with wide eyes. There’s a little concern there, you’re sure, if not outright fear - but as you bare more and more [pc.skinFurScales], starting to stroke your [pc.cock] to hardness, you can see the hunger in there as well. Her crimson futa-cock starts rising off her belly of its own accord, wobbling in the air by the time you approach.");

	output("\n\nBehind you, Shade leans back against the door - and you’re pretty sure you hear a zip-down from her jeans. You wonder, briefly, if Shade likes to watch this sort of thing? You haven’t really asked what gets the MILFy kitty going, come to think of it. Just about everything you do seems to, at least, so for now you’ll just have to make a show of it.");
	// PC is Bimbo/Bro:
	if(pc.isBimbo() || pc.isBro()) output(" Good thing you’ve got the body and the confidence for it!");

	output("\n\nFlashing a quick grin over your shoulder, you crawl up onto the bed on all fours, planting your hands on either side of Amara’s wolven ears and roll your [pc.tongue] up one of her D-cup tits. You flick the nipple hard enough to make Amara wince - and make her dick throb, slapping against your thigh. <i>“Are they sensitive?”</i> you wonder aloud, tracing your hands down to the Dread Lord’s tits. You squeeze the pair of them, letting your fingers sink into the soft, freckled flesh. She’s got big, dark nipples, each stiff enough that you can feel every ridge and pebble as your palms brush over them. You can feel the pirate-bitch gasping, and her back arches off the bed - which only pushes her tits further into your hands.");

	output("\n\nWhile she’s squirming and moaning underneath you, run your fingers down the pirate lord’s toned tummy and her inner thigh, delving between her bound legs to heft those fat pale balls out of the way and brush her pussylips. Amara’s whole body tightens, straining against her shackles while you slide slowly into her and tease her warm, wet slit. It practically sucks you in, caressing your digits in its sultry embrace ‘till you’re buried to the knuckles inside the submissive pirate.");

	output("\n\n<i>“That’s the stuff!”</i> Shade laughs. <i>“Put that bitch in her place.”</i>");

	output("\n\nYou’re starting to wonder if you’ve been brought in after an argument or something. Ah well, no reason not to enjoy yourself anyway. Giving Amara’s tits a parting squeeze and lick, you get on your [pc.knees] between her spread-eagle legs and pin her dick down on her stomach, giving you full view of her red-maned quim. Her knot pulses to the same rhythm as her pussy-lips clenching around your fingers; when you draw them out, they come back covered in shiny fem-slime.");

	output("\n\nShe’s ready for it, alright.");

	output("\n\nGrinning, you use the [pc.cockHead] of your dick to lift up Amara’s balls before nestling it into the gulf of her quim, smearing her juices around the entrance. Taking it nice and slow, you keep on teasing the pirate lord’s pussy and clit ‘till she’s thrashing and moaning and leaking all over her thighs. Only then do you finally push forward, spearing the dread lord in one [pc.knotBallsBase]-deep thrust. Her whole body arches off the bed, tits thrusting to the ceiling with a whorish moan held back by her drool-covered gag.");

	output("\n\nWhile she’s up off the bed, you hook your arms underneath Amara’s arms and use her body as leverage to ram your [pc.hips] down on her again, starting to thrust as hard as you can. In the process, her own veiny red rocket ends up pinned between your bodies, rubbing against your [pc.belly] every time you thrust deep into its owner. Shade moans just as loud as her lover does, knuckles deep in her own clunge. She moans something like <i>“Fuck, that’s hot,”</i> even as you’re starting to pick up speed, plowing into Amara’s juicy puss. The pirate’s ginger tail thrashes against the bed, slapping your [pc.legs] with all its fluffy might");
	// PC has balls:
	if(pc.hasBalls()) output(" - ticking your [pc.balls] as she does so");
	output(".");

	output("\n\nThe big bad pirate lord really does like getting treated like a piece of fuckmeat. How about that?");

	output("\n\nEven as Amara’s squeezing her eyes closed and squirming, you can feel her quim squeeze wildly around your [pc.cock]. Her dick throbs every time you thrust into her, squirting little streams of cream onto the ausar-babe’s toned belly, like you’re pumping it out every time your pride drives into the hole hidden beneath her balls. Pretty soon her little belly button is a lake of the stuff, and it’s slowly oozing down her ribs onto the sheets. She can’t even look you in the eye now, but all that anger and resentment from when you first mounted her has melted away entirely, replaced by shamefast lust. Pretty soon she’s moving her hips with you, trying to get your [pc.cock] as deep as she can every time you thrust it in - and she moans like a whore when you drive her down into the bed, making her ankles strain against their restraints.");

	output("\n\nEven over the groans of the bed and the pirate bitch between you, you can still hear the wet schlicks coming from where Shade’s leaning against the wall, enjoying every second of the show. Her own little moans are a nice contrast to the feral sounds coming from around Amara’s ballgag; you wipe away a little trail of drool spilling down around the ball and grin down at the pirate lord, telling her that she’s being such a good girl. Isn’t this a nice change of pace?");

	output("\n\nAmara thrusts herself up at you, pulling her bindings taut in her frustration. A couple more thrusts deep into her muff settle her down right quick, though. Her body naturally submits to you, refusing its owner’s indignant resistance in favor of slutty squirts and squeezes. She makes a fine cocksleeve, still nice and tight despite her age, and so aggressive in the way she moves. It’s hard to hold yourself back, to keep from just going all out until her quim’s pumped full of your seed... but you want to enjoy this MILFy body as long as you can.");

	output("\n\nOnly when you hear Shade gasping, grinding back against the wall as she gets near to finishing, do you let your rampant lusts fully take control. Your [pc.hips] slam into the pirate lord with all your might, driving your [pc.cock] into her until her own half-hard red root gives a pathetic little throb of defeat and surrenders its creamy load all over Amara’s stomach and tits. Her body arches, then goes limp in your arms, all the fight streaming out of her alongside the wasted seed.");

	output("\n\nThe scent of cum steaming in the air is the last straw; you hilt yourself inside the dread lord’s pussy and let loose a torrent of your own [pc.cum] deep into her womb. Cum floods out from between her lips");
	// PC has knot:
	if(pc.hasKnot()) output(", right until you ram your knot in, making sure no more of your jizz will escape. Maybe you can really give Astra a little sister...");
	else output(", staining her thighs and pooling under Amara’s ass.");

	output("\n\nShade howls with laugher, watching her lover squirm under you, soaked in her cum and filling with yours. <i>“Atta girl! Take it like you deserve. Fuck, that was hot.”</i> A moist hand slaps your ass, and your lover takes a seat beside you, grinning down at her partner. <i>“I’ve never seen you cum so fast, Amy. What happened to my big ol’ fuckbeast, huh?”</i>");

	output("\n\nAmara’s eyes narrow, and she says something into her gag. Shade just snickers and runs her hand from your flanks up Amara’s belly, tweaking a tit before finally cupping her chin. Finally, she reaches down and unbuckles the ball gag, pulling it free... and pulling a six-inch spear of latex out of Amara’s throat attached to the inside of it.");

	clearMenu();
	addButton(0, "Next", finishWithThePirateLord);
}

public function sailWithShade():void
{
	clearOutput();
	author("Savin");
	showBust(shadeBustDisplay(true), amaraBustDisplay());

	output("You can dream up a lot of things you’d love to do to a tied-up hermaphrodite MILF, but every one of them can be improved by adding another chesty momma to the mix. You start to disrobe yourself, sauntering towards the bed, and cast a grin over your shoulder at Shade. <i>“Well? Are you coming or what?”</i>");

	output("\n\n<i>“At least once,”</i> the cat-woman laughs. <i>“What, can’t handle the big, scary pirate lord on your own? Need momma to come and make sure");
	// PC has cock:
	if(pc.hasCock()) output(" you find the right hole... or the wrong one.");
	else output(" she doesn’t knot you too fast?");
	output(" Oh, don’t gimme that look. Fine. I guess I went to all this trouble, I might as well enjoy myself too. Don’t normally get to share Amy like this, so let’s make it count.”</i>");

	output("\n\nA second later and Shade’s pulled her top over her head, bringing those big, beautiful jugs of hers to light. They sway hypnotically, nipples hardening with every breath while she hooks her thumbs into her jeans and slides them down those thick, toned thighs. The green body of her parasitic tail whips around excitedly, lunging toward the naked pillar of red dogmeat swaying between Amara’s legs. Shade hisses at it, circling around till she can sit on the side of the bed, planting her ass so close to Amara’s face that the ginger wolf’s cheek nearly disappears into her paramore’s flank.");

	output("\n\nThe pirate grumbles something through her ball gag, pulling on her restraints hard enough to make the bed creak. <i>“What’s that, babe? Can’t quite hear you...”</i>");

	output("\n\nShade flashes you a devious little grin of her own as she reaches down and tweaks the red ball between Amara’s lips. The gag makes a little hissing noise and then opens up, material sliding into itself and leaving a solid ring in place of itself. Amara sticks her tongue straight out of it and blows a juicy raspberry at Shade, but all that accomplishes is making the kitty laugh. She leans in and thrusts her own tongue back through the ring, making Amara’s eyes go wide - and leaving her cock surging upright, wobbling heavily in the air as you mount the bed behind the MILF-kitty. You run a playful hand up Amara’s veiny red pride, squeezing the knot and teasing your fingers all the way up to her tapered tip. She throbs in your grasp, and you can’t help but grin as a glistening bead of precum starts to form on her crown.");

	output("\n\nWhen Shade breaks the kiss, her lips are sheened from her lover’s tongue. <i>“She’s got a real skilled tongue,”</i> the amazonian kaithrit purrs, stroking Amara’s ginger curls. <i>“And personally, I can’t think of a more fitting way to get even than planting your ass on her face.”</i>");

	output("\n\nNow she’s talking. When Shade crooks her finger, you let her guide you up the ausar hermaphrodite’s curvy body, crawling over big hips, hard cock, and clamped tits until your [pc.knees] and pressed into Amara’s armpits and your crotch is hovering over her chin. Shade gives you a pat on the ass and slips down the side of the bed, mounting it behind you with a grunt of effort. The springs creak wearily beneath the three of you, quaking while you turn yourself around and plant your [pc.butt] squarely onto Amara’s cheeks.");

	output("\n\nThe dread lord squirms, thrashing in her restraints and spewing muffled expletives at you until you press your rump down hard enough to nearly suffocate the bitch. Like some kind of perverted instinct, her tongue thrusts up against your taint, searching out some way to pleasure you.");

	output("\n\n<i>“What a well-trained pet,”</i> you laugh, shifting your hips to give Amara access to your {balls / pussy // ass}. She goes at you hard, wriggling that canid tongue all over every inch.");

	output("\n\n<i>“Yeah, she’s good with that mouth,”</i> Shade chuckles. She’s come to straddle the pirate’s hips, wrapping a hand around the veiny red rocket thrusting up from between Amara’s legs and rubbing it against her silver-maned muff. <i>“You haven’t lived until you’ve spent a night with Amy between your thighs from dusk ‘till dawn. Mmm.”</i>");

	output("\n\nShade sighs, pressing Amara’s tie against her quim. <i>“But you can enjoy that tonight. It’s a safe day, so... I’m gonna help myself to a nice, creamy load. Been a while since you got to rawdog me, huh, Amy? Not that <b>you</b> miss it, trailing your bastards all across the stars. I’m sure there’s a girl or three on every planet eager for you seed, huh?”</i>");

	output("\n\nYou can <b>feel</b> Amara trying to bitch and moan about the way Shade’s teasing her, but it only serves to heighten your pleasure. Her tongue thrashes around, {burying itself in your [pc.vagOrAss]/ slurping on your balls}. That intensity only redoubles when Shade rises up on her knees, slipping Amara’s tapered tip between her lips, and slides down the throbbing pole with a throaty moan. Her tits bounce heavily when her ass slaps into the hermaphrodite’s thighs,");
	// Shade is milky:
	if(shade.isLactating()) output(" beading with over-burdened milk from the impact. The MILF-kitty blushes, wiping herself off... until she sees you staring at those bountiful mammaries.");
	else output(" quaking hypnotically. You just can’t peel your eyes off them...");

	output("\n\nShade bites her lip and pushes her chest out invitingly, a temptation you can’t possibly resist. She takes your cheeks in hand and guides you down to one of her big tits, and you wrap your [pc.lips] around a rosey teat and start to suck and roll your tongue all around its pebbly peak. Shade shivers as you go to work on her, wrapping your arms around the MILF-kitty’s waist and bury yourself in her ample cleavage.");
	// Shade is milky:
	if(shade.isLactating()) output(" Her milk flows freely over your [pc.tongue], sweet and rich. You slowly close your eyes, suckingly gently while Amara tongues you.");
	output(" Shade moans, stroking your [pc.hair] and rolling her hips around Amara’s cock, taking the throbbing knot between her lips with practiced ease.");

	output("\n\nThe pirate gasps and squirms as she ties her lover, which you take as the perfect time to");
	// PC has cock:
	if(pc.hasCock()) output(" push your own [pc.cock] straight into her ring-gag, burying yourself in her throat. She gags, tongue lapping at your crown before you batter the back of her throat. Oh, that’s nice...");
	else output(" push your hips deep down on her, all but forcing the pirate to tongue-fuck your [pc.vagOrAss]. She’s so deep now, and thrashing around so desperately!");
	output("You can barely keep from moaning into Shade’s tit, pushing back onto her lover’s tongue and worshipping those beautiful mammaries of hers.");

	output("\n\n<i>“I feel her getting close,”</i> Shade murmurs, moving her hips a little quicker. <i>“What a shameless sub, my Amara... a-ah! Here she comes.”</i>");

	output("\n\nYou feel the pirate lord jerk against her restraints, thrusting herself up between Shade’s legs. The huntress arches her back, thrusting her tits all over your [pc.face], and lets out a throaty purr as Amara gives her a knot-deep creampie. While she’s shooting off, Amara’s tongue goes absolutely wild,");
	// PC has cock:
	if(pc.hasCock()) output(" and such sucks you with such furor that it’s impossible not to cum with her. You slap yourself down on the pirate’s face, driving your dick deep down her throat, and let yourself go. She’s got no choice but to swallow every drop or drown, and that just makes her throat massage your shaft all the more.");
	else output(" thrusting so deep into your [pc.vagOrAss] that you nearly squeal. Orgasm comes crashing down on you a few moments later, nearly dislodging you from Amara’s face amidst a stream of giggling curses and climactic moans.");
	output(" Shade holds you tight the whole way through, smiling down at you until you and Amara have both spent your loads, leaving each other nice and sticky.");

	output("\n\n<i>“Mmm, that’s good,”</i> Shade purrs, grinding herself down on Amara’s knot. <i>“Feels just as thick and hard as the first night we met... heh. Sorry, kiddo, you definitely don’t want to hear two old women talking dirty.”</i>");

	output("\n\nShe laughs and peels you out of her cleavage. You’re given a kiss and rolled off of Amara, landing beside the lovers as Shade hefts herself off Amara’s knot, leaving her silver-fringed pussy agape and dripping. With an exaggerated stretch, the kitty-MILF leans down, pressing her tits into her lover’s and slipping a thumb into the open ring-gag. <i>“Let’s get this off you, babe.”</i>");

	clearMenu();
	addButton(0, "Next", finishWithThePirateLord);
}

public function finishWithThePirateLord():void
{
	clearOutput();
	author("Savin");

	output("The pirate gasps and coughs, gulping air before thrusting her tongue out at Shade. <i>“Damn it. When you text me saying you’re home alone, I expect it to <b>stay</b> that way. Hmph! And you...”</i>");

	output("\n\nAmara pulls on her restraints, prompting Shade to release them so the pirate lord can sit up and face you. Her clamped and chained nipples somewhat diminish the glower she gives you, as does the red root twitching between her thighs. <i>“<b>You</b> are a good lay. Consider my concerns assuaged, Shade.”</i>");

	output("\n\n<i>“Oh, I’m glad you approve!”</i> Shade says, rolling her eyes. <i>“I’d be so ashamed if my [pc.boyGirl]friend didn’t meet your expectations.”</i>");

	output("\n\nShe leans down, releasing the shackles around Amara’s feet and removing the nipple clamps, finally giving the Dread Lord the opportunity to stand up, rolling her shoulders. She’s a tall slab of meat for an ausar, a bit over six foot, and now that she’s moving you can really get an appreciation for the firm muscle under that alabaster skin. Her hands go to her hips, staring back at you. <i>“");
	// Silly:
	if(silly) output("You mirin’?");
	else output("Yeah, go ahead and look.");
	// PC gave up Kara:
	if(flags["KQ2_BETRAYED_KARA"] == 1 && flags["KQ2_QUEST_FINISHED"] == 2) output(" Starting to believe you made the right choice on the rooftop, huh?");
	// PC beat Amara:
	else if(flags["KQ2_QUEST_FINISHED"] == 1) output(" Trying to find the sexy battle scars you left me? Don’t worry, I get those med-gel’d off. Can’t have my kids asking why I keep coming home covered in laser burns.");
	// Kara died protecting PC:
	else output(" I’m a lot sexier out of the double casts your cobalt kitty-friend put me in.");
	output(" This body of mine’s the best that next-generation gene-cloning can make. As close to perfection as the Void’s geneticists can get... miles ahead of the work that went into making you. No laws holding our scientists back.”</i>");

	output("\n\n<i>“See, you’ve got being designer babies in common,”</i> Shade snickers. <i>“And if you’re going to flex, Amy, do it with those muscles instead of your pedigree. At least we can all enjoy that.”</i>");

	output("\n\nAmara grins and does just that... before breaking pose to grab Shade around the middle and lift her up into a rough kiss. <i>“Seriously though: ask next time. I’d have said yes...”</i>");

	output("\n\n<i>“I know. But you were <b>so much</b> harder when it was a surprise. So, are we all cool now? I don’t need to worry about you two bein’ all awkward and shit if you both end up over for dinner together?”</i>");

	output("\n\n<i>“Normally, I’d collar a fine piece of ass like this, but... I guess I’ll settle for this,”</i> Amara grins.");

	output("\n\nYeah, you guess it’s all cool now. For Shade’s sake, if not for the chance of getting another shot at Amara’s so-called perfect body.");

	output("\n\n<i>“Great!”</i> Shade smiles, clapping her hands. <i>“Now both of you get dressed and fuck off. Astra’s gonna be home any minute and I need a shower.”</i>");

	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

