public const REAHA_CONFIDENCE_LOW:int = 15;
public const REAHA_CONFIDENCE_MED:int = 40;
public const REAHA_CONFIDENCE_HIGH:int = 65;
public function reahaConfidence(conf:int = 0):int
{
	if (flags["REAHA_CONFIDENCE"] == undefined) flags["REAHA_CONFIDENCE"] = 0;
	if (conf != 0)
	{
		flags["REAHA_CONFIDENCE"] += conf;

		if (flags["REAHA_CONFIDENCE"] < 0) flags["REAHA_CONFIDENCE"] = 0;
		else if (flags["REAHA_CONFIDENCE"] > 100) flags["REAHA_CONFIDENCE"] = 100;
	}
	return flags["REAHA_CONFIDENCE"];
}

public const REAHA_ADDICTION_LOW:int = 15;
public const REAHA_ADDICTION_MED:int = 40;
public const REAHA_ADDICTION_HIGH:int = 65;
public const REAHA_ADDICTION_MAX:int = 100;
public function reahaAddiction(addict:int = 0):int
{
	if (flags["REAHA_ADDICTION"] == undefined) flags["REAHA_ADDICTION"] = REAHA_ADDICTION_MAX;
	if (addict != 0)
	{
		flags["REAHA_ADDICTION"] += addict;

		if (flags["REAHA_ADDICTION"] < 0) flags["REAHA_ADDICTION"] = 0;
		else if (flags["REAHA_ADDICTION"] > REAHA_ADDICTION_MAX) flags["REAHA_ADDICTION"] = REAHA_ADDICTION_MAX;
	}
	return flags["REAHA_ADDICTION"];
}

public function reahaAddicted():Boolean
{
	if (!reahaIsCured()) return true;
	return false;
}
public function reahaIsCured():Boolean
{
	return (flags["REAHA_ADDICTION_CURED"] != undefined);
}

public function reahaAddictionTherapyAvailable():Boolean
{
	if (flags["REAHA_DONE_NEWTEXAS_SPIEL"] == undefined) return false;
	if (reahaIsCured()) return false;
	if (flags["REAHA_ADDICTION_THERAPY_LAST_DAY"] == days) return false;
	return true;
}

public function reahaMoosAboutNewTexas():Boolean
{
	if (!reahaIsCrew()) return false;
	
	if (flags["REAHA_DONE_NEWTEXAS_SPIEL"] == undefined)
	{
		flags["REAHA_DONE_NEWTEXAS_SPIEL"] = 1;

		clearOutput();

		showReaha();
		author("Savin");

		output("As you’re fiddling with the boarding ramp controls, you hear Reaha’s bare feet padding up behind you. You turn to face her, and find yourself staring down the strawberry-haired cow, her big blue eyes locked with yours.");
		
		output("\n\n<i>“I never thought I’d be back here,”</i> she says quietly, finally breaking eye contact. She casts her gaze out the nearest viewport, into the oversized barn’s bustling interior. <i>“Nothing’s changed...”</i>");
		
		output("\n\nWith a little shiver, the cow-girl hugs her arms around herself and her oversized, bovine rack.");
		if (reahaFree()) output(" <i>“Just... promise me if you go out there, you’ll be careful, okay? Don’t take anything they offer you, and don’t... don’t listen to their spiel about the Treatment. It’ll ruin you forever.”</i>");
		else output(" <i>“I know it’s not my place to say, but... be careful here. The Treatment the people here will offer you, it’ll ruin you forever.”</i>");
		
		output("\n\nBefore you can formulate a response, Reaha slips off back into her room, clearly distressed. What was that all about?");

		processTime(10);

		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return true;
	}
	return false;
}

public function talkWithFollowerReaha():void
{
	if (flags["REAHA_DONE_NEWTEXAS_FOLLOWUP"] == undefined) reahaFirstTalk();
	else reahaRegularTalk();
}

public function reahaFirstTalk():void
{
	clearOutput();
	showReaha();
	author("Savin");

	flags["REAHA_DONE_NEWTEXAS_FOLLOWUP"] = 1;

	output("<i>“I get the feeling you’ve been to New Texas before,”</i> you say to her, by way of opening the topic");
	if (flags["NEW_TEXAN_CUSTOMS_MET"] != undefined) output(", your eyes drawn to her bare, bovine body. She looks, and even acts, like the Treated cows you’ve seen on the surface");
	output(". Reaha blinks hard, clearly surprised that you’re just trying to talk rather than fuck.");
	
	output("\n\nWhen you pose the question to her, Reaha looks pointedly away from you, biting her lip and drawing circles on the deck with her big toe. When she speaks, her voice is hushed, barely audible. <i>“I was born here, actually,”</i> she finally admits, still not meeting your gaze. <i>“I grew up here on T.’s ranch. New Texan, born and raised.”</i>");
	
	output("\n\nYou could have sworn she had a <i>British</i> accent. ");
	
	output("\n\n<i>“You didn’t seem too happy about going back,”</i> you say, trying to get her to continue.");
	if (pc.isTreated())
	{
		if (pc.mf("m", "f") == "f")
		{
			output(" <i>“New Texas is, like, the best!”</i>");
		}
		else
		{
			output(" <i>“Seems pretty alright to me.”</i>");
		}
	}
	else if (pc.isNice()) output(" <i>“I’d have thought you’d be overjoyed to be home again, after all you’ve been through.”</i>");
	else if (pc.isMischievous()) output(" <i>“What, did you and your parents not get along?”</i>");
	else output(" <i>“Got out of your agrarian shithole as fast as you could, huh?”</i>");
	
	output("\n\nShe sighs. <i>“No, I... seeing home again was nice,");
	if (reahaFree()) output(" [pc.name]");
	else output(" [pc.master]");
	output(". But I went through a lot to escape from");
	if (shipLocation == "500") output(" here");
	else output(" New Texas");
	output(", and I don’t really want to go back.”</i>");
	
	output("\n\nYou cock an eyebrow at her. <i>“Escape?”</i>");
	
	output("\n\n<i>“Escape,”</i> Reaha confirms after a quiet moment. ");
	
	output("\n\n<i>“On New Texas, it’s a government mandate for all citizens to receive the Treatment. It’s been part of our culture since the colony was founded centuries back, so much so that I was actually born with these horns,”</i> she says, rubbing her tiny bovine nubs. <i>“It’s so ingrained into the population that it’s starting to slowly alter our DNA... to cause mutations like mine.”</i>");
	
	output("\n\nShe pauses there. Long enough to make you finally ask, <i>“So why did you have to escape?”</i>");
	
	output("\n\n<i>“Why do you think?”</i> she snaps.");
	if (!reahaFree()) output(" She immediately regrets her outburst, covering her mouth with a murmured <i>“Sorry, [pc.master].”</i> With a sigh, she continues, more softly now:");
	output(" <i>“I didn’t want the Treatment. I didn’t want to end up a brainless bimbo like my mom, sucking every dick that walked past her. Which I guess is kind of ironic in hindsight, huh? But I... I didn’t want to be this way,");
	if (reahaFree()) output(" [pc.name]");
	else output(" [pc.master]");
	output(". Those bastards at the brothel tricked me, got me addicted to these stupid patches so bad I can barely even think half the time. I might as well have just fucking got Treated, for all the good running away did me.”</i>");
	
	if (pc.isNice()) output("\n\nHesitantly, you reach over and plant a reassuring hand on the cow’s bare shoulder. Reaha sighs, letting out a long, chesty breath before looking up and giving you a faint little smile. <i>“I’m sorry,”</i> you tell her, not really knowing what else you can say.");
	else output("\n\n<i>“That sucks, Reaha,”</i> you say.");
	
	output("\n\nReaha shrugs slightly. <i>“It’s not your fault,");
	if (reahaFree()) output(" [pc.name]");
	else output(" [pc.master]");
	output(". I was just </i>stupid<i> and didn’t know what I was doing. Story of my life.”</i> ");
	
	output("\n\nThe cow-girl goes quiet for a while, clearly out of");
	if (pc.isAss()) output(" self-pity");
	else output(" words");
	output(" for the moment.");

	processTime(20);

	//Display Reaha's normal menu
	approachShipBoardReahaWhyDidntSavinCodeThisHeWasntExhaustedYesterday(false);
}

public function reahaRegularTalk():void
{
	clearOutput();
	reahaHeader();

	output("<i>“Hey, Reaha, I’d like to talk to you for a minute,”</i> you say, leaning against the door to her quarters.");
	
	output("\n\nShe smiles. <i>“Of course,");
	if (reahaFree()) output(" [pc.name]. What’s up?”</i>");
	else output(" [pc.master]. Whatever you’d like.”</i>");

	processTime(2);

	showReahaTalkMenu();
}

public function showReahaTalkMenu(func:Function = null):void
{
	clearMenu();

	if (func != reahaTalkTreatment) addButton(0, "Treatment", reahaTalkTreatment, undefined, "The Treatment", "Ask Reaha about the Treatment that’s so popular on her homeworld.");
	else addDisabledButton(0, "Treatment","Treatment","");

	if (func != reahaTalkNewTexas) addButton(1, "New Texas", reahaTalkNewTexas, undefined, "New Texas", "Ask Reaha about her homeworld.");
	else addDisabledButton(1, "New Texas");
	
	if (reahaAddicted())
	{
		if (func != reahaTalkAddiction) addButton(2, "Addiction", reahaTalkAddiction, undefined, "Patch Addiction", "Talk to Reaha about her pleasure-patch addiction.");
		else addDisabledButton(2, "Addiction");
	}
	else
	{
		addDisabledButton(2, "Addiction", "Patch Addiction", "Probably best to let bygones be bygones.");
	}

	if (func != reahaTalkGeneMods) addButton(3, "GeneMods", reahaTalkGeneMods, undefined, "Her Gene Mods", "Ask Reaha about her bovine gene-mods.");
	else addDisabledButton(3, "GeneMods");

	if (func != reahaTalkHerLife) addButton(4, "Her Life", reahaTalkHerLife, undefined, "Her Life", "Ask Reaha to tell you a little bit about her life before she became a slave.");
	else addDisabledButton(4, "Her Life");
	
	if (func == reahaMilkTalk) addDisabledButton(5, "Milk Mods");
	else
	{
		if (flags["REAHA_MILKMODS_UNLOCKED"] == undefined) addDisabledButton(5, "Milk Mods", "Lactation Gene Mods", "You should discuss how Reaha ended up looking like she does first...");
		else addButton(5, "Milk Mods", reahaMilkTalk, undefined, "Lactation Gene Mods", "Ask Reaha if she would be willing to take a few more mods...");
	}
	
	addButton(14, "Back", approachShipBoardReahaWhyDidntSavinCodeThisHeWasntExhaustedYesterday, false);
}

public function reahaTalkTreatment():void
{
	clearOutput();
	reahaHeader();

	output("<i>“Think you could tell me more about the Treatment?”</i> you ask.");

	if (pc.isTreated() && pc.isBimbo())
	{
		output("\n\n<i>“Seems like you already know everything you need to about it");
		if (!reahaFree()) output("... [pc.master]");
		output(".”</i>");
		output("\n\n<i>“Just, like, el- ela... Just, like, tell me, okay? Please?”</i>")
	}
	
	output("\n\n<i>“What’s there to know?”</i> Reaha spits. <i>“It turns you into an air-headed, sex-obsessed bimbo if you’re a woman; into a hulking muscle-head with an animal dick if you’re a dude.”</i>");
	
	if (!reahaFree()) output("\n\n<i>“Calm down,”</i> you command before the easily-upset cow gets too worked up.”</i>");
	else output("\n\n<i>“Take it easy. I’m just curious.”</i>");
	
	output("\n\nShe sighs. <i>“Sorry");
	if (reahaFree()) output(" [pc.name]");
	else output(" [pc.master]");
	if (reahaAddicted()) output(",”</i> she groans, pulling a couple of patches from her little red box and slapping them onto her thigh. She shudders a little as they go to work, her skin flushing.");
	else output(",”</i> she groans, rubbing at her little nub-horns.");
	output(" <i>“Can I start over?”</i>");
	
	output("\n\nYou nod and she starts speaking, more calmly now: <i>“The Treatment was a drug the colonists landed on New Texas with. At least in its earliest form. It was supposed to be a fertility booster to help the settler population grow. Really it just meant women stayed barefoot and pregnant, and the men decided they liked it that way. So they modified the Treatment, made it mandatory for the whole planet’s population: when you hit eighteen years, you’re mandated by law to take the Treatment, and they aren’t afraid about forcing it on you. Nowhere else in the galaxy could they get away with that shit,”</i> she says, scowling at the deck, crossing her arms under her huge, milky bosom. <i>“The Confederacy makes an exception for New Texas, though: say it would cause too much social upheaval if they made the Treatment just... just fucking optional, you know? But every diplomat that comes just ends up getting his dick sucked by every air-headed bimbo on the planet until he okays the Treatment through another five year review.”</i>");
	
	output("\n\nYou can see Reaha’s fingers digging into the sheets on her bed. Slowly, you say, <i>“Do you know how it works?”</i>");
	
	output("\n\n<i>“Nobody does,”</i> Reaha says. <i>“Except the scientists who make it, anyway. Maybe Big T., too. Probably. I don’t know, they keep everything about the Treatment a secret. It could be some horrible alien virus for all I know. What’s important is what it does.”</i>");
	
	output("\n\nYou shrug. <i>“Well, tell me about it.”</i>");
	
	output("\n\nReaha pauses to think a moment, chewing on her lower lip.");
	if (reahaAddicted()) output(" As she does, you can see the growing trickle of lust drooling from between her slightly-spread legs. Looks like her latest patch hit’s finally taking effect.");
	output(" <i>“The Treatment bestializes you. Is that even a word? It fits, though. You get horns, your tits get way bigger, and you start to lactate. They say sex feels amazing -- I think I");
	if (reahaAddicted()) output(" get");
	else output(" got");
	output(" the same effect from the stupid patches, but imagine that all the time. Every orgasm turning your brain into jelly... and you just always want to have sex. There’s no such thing as a libido or a sex drive after you’re Treated: it’s just </i>sex<i>, always. It’s all you can think of half the time. Everything but fucking just seems unimportant. They say Treated women gain the most intense motherly instincts, too, but even that just pales compared to the need to find the next dick to suck.”</i>");
	
	output("\n\nThat sounded bitter.");
	
	processTime(10);

	//3 choices below. Can only make choice once, after which it will forever default to <i>“next”</i> (see: Gianna’s talk mechanics)
	clearMenu();
	if (flags["REAHA_TALK_TREATMENT_CHOICE"] == undefined)
	{
		addButton(0, "Bitterness", reahaTalkTreatmentBitterness);
		addButton(1, "Comfort", reahaTalkTreatmentComfort);
	}
	else
	{
		var f:Array = [reahaTalkTreatmentBitterness, reahaTalkTreatmentComfort];
		addButton(0, "Next", f[flags["REAHA_TALK_TREATMENT_CHOICE"]]);
	}
}

public function reahaTalkTreatmentBitterness():void
{
	if (flags["REAHA_TALK_TREATMENT_CHOICE"] == undefined)
	{
		flags["REAHA_TALK_TREATMENT_CHOICE"] = 0;
		reahaConfidence(-5);
	}

	clearOutput();
	reahaHeader();

	output("<i>“That sounds bitter,”</i> you say, voicing your impression.");
	
	if (reahaFree()) output("\n\nReaha rounds on you, scowling. <i>“Of course I’m bitter! The government -- my own FAMILY -- tried to turn me into a brainless cumslut just because I had the luck to be born with a pair of tits! I fucking hate this place and everyone on it. They’re all complicit, every single one of them, for making slaves out of women. For not standing up to the stupid, insane BULLSHIT of this planet.”</i>");
	else output("\n\nReaha opens her mouth as if to respond, then lets out a long breath. <i>“If I wasn’t your slave, I’d scream until your ears bled. Yeah, I’m bitter. I hate this place, and what they do to women. This whole place, it’s some sick bastard’s sex garden, and we’re supposed to lie down -- preferably on our backs -- and just accept it? No. That’s why I ran away, [pc.master]. And why I never wanted to come back.");

	processTime(5);

	showReahaTalkMenu(reahaTalkTreatment);
}

public function reahaTalkTreatmentComfort():void
{
	if (flags["REAHA_TALK_TREATMENT_CHOICE"] == undefined)
	{
		flags["REAHA_TALK_TREATMENT_CHOICE"] = 1;
		reahaConfidence(5);
	}

	clearOutput();
	reahaHeader();

	output("<i>“You had it rough,”</i> you say, putting a hand on the cow’s shoulder. <i>“I get it.”</i>");
	
	output("\n\n<i>“Yeah,”</i> Reaha sighs, leaning into your gentle touch. <i>“I just... I hate this place,");
	if (reahaFree()) output(" [pc.name]");
	else output(" [pc.master]");
	output(". I </i>hate<i> it, more than I ever could Beth’s place. At least they were honest in the whorehouse... well, not really, but they wore it on their lapels, ‘Oh, we’re evil sex-slavers, bwahahah.’ New Texas, though...");
	if (reahaFree()) output(" The government -- my own FAMILY -- tried to turn me into a brainless cumslut just because I had the luck to be born with a pair of tits. They’re all complicit, every single one of them, for making slaves out of women, and for what? The U.G.C. lets them get away with it because it’s tradition!”</i>");
	else output(" This whole place, it’s some sick bastard’s sex garden, and we’re supposed to lie down -- preferably on our backs -- and just accept it? No. That’s why I ran away, [pc.master]. And why I never wanted to come back.”</i>");
	
	output("\n\nReaha takes a deep breath, looks at you with her big blue eyes, and steps up with her arms wide open. You take the cow-girl up on her offer, pulling her into a tight hug. Her arms clutch around your back, and the quiver in her voice as she speaks again clues you in to just how close to tears she is: <i>“Just...");
	if (shipLocation == "500") output(" do whatever you came here to do, and let’s leave. Okay? I don’t want to be here a second longer, [pc.master]. This planet makes me sick!”</i>");
	else output(" just promise me that you won’t hang around there too much [pc.master]. The place makes me sick!”</i>");

	processTime(5);

	showReahaTalkMenu(reahaTalkTreatment);
}

public function reahaTalkNewTexas():void
{
	clearOutput();
	reahaHeader();

	output("<i>“So what do you think about New Texas,”</i> you ask. <i>“It’s your homeworld, after all.”</i>");
	
	output("\n\nReaha");
	if (shipLocation != "500") output(" sighs");
	else output(" sighs wistfully, looking out the tiny window of her cabin in the landing barn outside");
	output(". <i>“Aside from the Treatment and all the bullshit that goes along with it, I guess it’s not that bad. New Texas is pretty, at least, and peaceful. Way different than cramped, noisy Tavros... there’s fields everywhere, wide open for you to run and play in whenever you want, as far as the eye can see. New Texas is an agrarian world, mostly farms and stuff except for a few bigger cities near the equator. I grew up around");
	if (shipLocation == "500") output(" here");
	else output(" Tee’s ranch");
	output(", so that’s mostly what I know. Mom never took us far from the ranch, seeing as she was one of the big dairy girls. Couldn’t go long without a session in the industrial milker, or her tits would swell up like this,”</i> Reaha says, giggling and making a ballooning motion with her arms over her already-impressive chest. ");
	
	output("\n\nShe grins to herself at that, one of the few genuine smiles you’ve seen from the red-maned cow. <i>“New Texas really is... different than the rest of the galaxy. Maybe it’s because of the Treatment, I don’t know, but it was also so peaceful. The people there were also nice to me -- that is, when they weren’t bending Mom or one of my big sisters over something right in front of me,”</i> she says with a visible shudder that leaves her tits quaking. ");

	processTime(10);

	//one time choice between:
	//[Ew] [That's Natural...] [Man Up]
	clearMenu();

	if (flags["REAHA_TALK_NEWTEXAS_CHOICE"] == undefined)
	{
		addButton(0, "Ew", reahaTalkNewTexasEw);
		addButton(1, "Natural...", reahaTalkNewTexasNatural);
		addButton(2, "Man Up", reahaTalkNewTexasManUp);
	}
	else
	{
		var f:Array = [reahaTalkNewTexasEw, reahaTalkNewTexasNatural, reahaTalkNewTexasManUp];
		addButton(0, "Next", f[flags["REAHA_TALK_NEWTEXAS_CHOICE"]]);
	}
}

public function reahaTalkNewTexasEw():void
{
	clearOutput();
	reahaHeader();

	if (flags["REAHA_TALK_NEWTEXAS_CHOICE"] == undefined)
	{
		flags["REAHA_TALK_NEWTEXAS_CHOICE"] = 0;
		reahaConfidence(10);
		pc.addNice(5);
	}

	output("<i>“That’s awful,”</i> you say after a moment. <i>“I’m sorry you had to see that.”</i>");
	
	output("\n\n<i>“Me too,”</i> Reaha says, flashing you a tiny grin and a wry little chuckle. <i>“I basically felt like I was growing up in a whorehouse sometimes... you know, that’s not far from true, really. Especially since they were just planning to turn me into a cum-sucking whore just like them. I guess you could just call New Texas the biggest, cheapest whorehouse in the galaxy! No wonder so many men want to move");
	if (shipLocation == "500") output(" here");
	else output(" there");
	output("....”</i>");

	processTime(5);

	addNextButton(reahaTalkNewTexasII);
}

public function reahaTalkNewTexasNatural():void
{
	clearOutput();
	reahaHeader();

	if (flags["REAHA_TALK_NEWTEXAS_CHOICE"] == undefined)
	{
		flags["REAHA_TALK_NEWTEXAS_CHOICE"] = 1;
		pc.addMischievous(5);
	}

	output("<i>“I guess that’s just natural");
	if (shipLocation == "500") output(" here");
	else output(" there");
	output(",”</i> you say with a shrug. <i>“");
	if (pc.isTreated() && pc.mf("m", "f") == "f") output("I don’t care who sees me getting drilled either, after all!");
	else if (CodexManager.entryUnlocked("The Treatment")) output("The Treatment makes sex amazing for the cows, after all, and there’s not a lot of compunction about spreading your legs on New Texas, is there?");
	else output("They say the Treatment makes girls pretty slutty, you know. I didn’t think they meant THAT slutty, but still...");
	output("”</i>");
	
	output("\n\n<i>“Ugh,”</i> Reaha groans, hugging her arms around herself. <i>“Don’t remind me. I’ll never forget the first time I saw two of my sisters going down on a bull... they didn’t even bother to close the door, and Mom was right there, just making dinner, listening to the... to the </i>sounds<i>. I might as well have grown up in a whorehouse after that... you know, that’s not far from true, really. Especially since they were just planning to turn me into a cum-sucking whore just like them. I guess you could just call New Texas the biggest, cheapest whorehouse in the galaxy! No wonder so many men want to move");
	if (shipLocation == "500") output(" here");
	else output(" there");
	output("....”</i>");

	processTime(7);

	addNextButton(reahaTalkNewTexasII);
}

public function reahaTalkNewTexasManUp():void
{
	clearOutput();
	reahaHeader();

	if (flags["REAHA_TALK_NEWTEXAS_CHOICE"] == undefined)
	{
		flags["REAHA_TALK_NEWTEXAS_CHOICE"] = 2;
		reahaConfidence(-10);
		pc.addHard(5);
	}

	output("<i>“So you saw some unpleasant shit,”</i> you say, scowling at the whiny cow. <i>“Deal with it. The girl I bought out of a cheapo whorehouse doesn’t have a lot of room to judge.”</i> ");
	
	output("\n\nReaha winces. <i>“I guess. I might as well have grown up in the whorehouse, the way Mom treated us. Sometimes I just... I felt like she was </i>training<i> us to be cum-sucking whores, you know?”</i>");
	
	output("\n\n<i>“I guess she did a good job,”</i> you say, reaching down and swatting the soft little cow on the ass -- just hard enough to make her butt jiggle. ");

	processTime(5);

	addNextButton(reahaTalkNewTexasII);
}

public function reahaTalkNewTexasII():void
{
	clearOutput();
	reahaHeader();

	if (flags["REAHA_TALK_NEWTEXAS_II"] == undefined)
	{
		flags["REAHA_TALK_NEWTEXAS_II"] = 1;

		output("<i>“So, how come you never told me you had sisters before?”</i>");
		
		output("\n\nReaha shrugs. <i>“Up till recently, I thought you bought me to");
		if (reahaFree()) output(" suck dick");
		else output(" be your personal milk maid");
		output(", not talk.");
		if (reahaConfidence() >= 40) output(" I’m glad that’s not the case, [pc.name].");
		output("”</i>");
	}
	else
	{
		output("<i>“Mind telling me about your sisters again?”</i>");

		if (reahaConfidence() < 40) output("\n\n<i>“Whatever you want, [pc.master].”</i>");
		else output("\n\n<i>“Sure, [pc.name].”</i>");
	}

	output("\n\n<i>“My mom was kind of a brood mare,”</i> Reaha says by way of explanation. <i>“She always said that more kids meant she produced more milk, so if one of her bulls knocked her up, all the better. I had five sisters: four older, and one younger. Actually, Mia will probably be turning 18 soon, if she hasn’t already... ugh. My older sisters are all Treated now, big-titted bimbo cows just like Mom wanted. Not really much more to say about them, to be honest. They’re good little milk cows, and apparently they’re giving Mom plenty of grandbabies already. My oldest sister, Sareh, is supposed to be on her way to being a better-producing dairy cow than even Mom was, the last time she wrote me.”</i>");
	
	output("\n\nReaha hesitates a moment before adding, <i>“I don’t want to sound like I hate them or anything. I love my sisters. But they’re not who I wanted to be, you know? Even if that’s where I ended up anyway...”</i>");

	processTime(10);

	showReahaTalkMenu(reahaTalkNewTexas);
}

public function reahaTalkAddiction():void
{
	clearOutput();
	reahaHeader();

	output("<i>“Talk to me about these,”</i> you say, tapping a pink-hued cardboard box full of pleasure patches sitting on Reaha’s desk. You note");
	if (reahaAddiction() >= REAHA_ADDICTION_HIGH) output(" several are");
	else if (reahaAddiction() >= REAHA_ADDICTION_MED) output(" a handful are");
	else output(" a single patch is");
	output(" clinging to her thigh");
	if (reahaAddiction() >= REAHA_ADDICTION_MED) output("s and ass");
	output(". She scratches at");
	if (reahaAddiction() >= REAHA_ADDICTION_MED) output(" one of them");
	else output(" it");
	output(" absently as you speak, shuffling her feet uncomfortably. ");
	
	output("\n\n<i>“What... what do you wanna know?”</i> she asks.");
	
	output("\n\n<i>“Let’s start with how you got on these in the first place.”</i> ");
	
	output("\n\n<i>“It was that bitch Carver,”</i> Reaha spits. <i>“When I had to... had to go into debt because of my mods, I check-boxed that I was okay with sex. I mean, hey, I just bought all these great mods, and if it helped me pay off my debt faster, I didn’t mind putting them to use. But then the bitch who owned the brothel bought my contract and put me in a pretty pink room, told me to do whatever every man who came through said.”</i>");
	
	output("\n\n<i>“That’s fucked up, right? I mean, I thought that meant that I wouldn’t mind my master wooing me for some gentle loving or something");
	if (reahaConfidence() >= REAHA_CONFIDENCE_HIGH) output(", or at least somebody who would treat me like you do, [pc.name]");
	output(". I never imagined I’d end up getting forced to work in an actual whorehouse. I coulda stayed on New Texas for that shit.”</i>");
	
	output("\n\nReaha scowls, crossing her arms under her huge rack. <i>“I tried to lawyer up, but Carver just put me in the special BDSM whipping part of her brothel for a week when I had the audacity to try and fucking stop this shit. I guess I kept being rowdy even after that, even bit a couple people when they got... well, anyway, Carver and her mistresses didn’t put up with that. After that, they started putting these stupid patches on me,”</i> Reaha says, prodding");
	if (reahaAddiction() < REAHA_ADDICTION_MED) output(" the");
	else output(" a");
	output(" patch riding high on her inner thigh, surrounded by reddened, sensitive skin. ");
	
	output("\n\n<i>“A couple of patches and I was a drooling, horny mess begging whoever they sent into the room to fuck me. I’d do </i>anything<i> to get off... just to get a little relief. It was awful at first... until I started getting used to it, but then they’d just put </i>more<i> patches on me, and back on the fuck-Reaha-senseless merry-go-round we went until you found me with my ass covered in the stupid things... and also in the air, chained up in a fuck-room so all I could do was wiggle my butt and beg you for a fuck.”</i>");
	
	output("\n\nShe shivers at the thought. <i>“I’m just glad to be out of there.");
	if (reahaAddicted()) output(" Even if I’m probably going to be addicted to these stupid patches for the rest of forever.”</i>");
	else
	{
		if (reahaAddiction() > REAHA_ADDICTION_MED) output(" Especially with you helping me, now. I’d probably never have gotten up the willpower to pull the patches off on my own.”</i>");
		else output(" Especially with you. I’m almost free of these stupid patches, thanks to you. I owe you one, [pc.name]. And I mean more than a debt,”</i> she says, pressing herself affectionately close to you.");
	}

	processTime(10);

	// [Cure Addiction] [Sorry] [I Like 'Em]
	clearMenu();
	if (flags["REAHA_TALK_ADDICTION_CURE"] == undefined)
	{
		addButton(0, "Cure", reahaTalkAddictionCure, undefined, "Cure Addiction", "Tell Reaha you’d like to help her out with her problem, if you can.");
		addButton(1, "Sorry", reahaTalkAddictionSorry, undefined, "Sorry", "Tell Reaha “too bad” about that whole patch thing.");
		addButton(2, "I Like", reahaTalkAddictionILike, undefined, "I Like Them", "Tell Reaha you like her just the way she is: drooling with lust and covered in patches.");
	}
	else addButton(0, "Cure", reahaTalkAddictionCure, undefined, "Cure Addiction", "Ask Reaha how she thinks she’s doing with her addiction. ");
}

public function reahaTalkAddictionSorry():void
{
	clearOutput();
	reahaHeader();

	if (pc.isNice()) output("You give reassuring pat on the head,");
	else output(" You shrug,");
	output(" telling her you’re sorry about her predicament. ");
	
	output("\n\nShe gives you a slight smile. <i>“Thanks,");
	if (!reahaFree()) output(" [pc.master]");
	else output(" [pc.name]");
	output(".”</i>");

	processTime(2);
	showReahaTalkMenu(reahaTalkAddiction);
}

public function reahaTalkAddictionCure():void
{
	clearOutput();
	reahaHeader();

	if (flags["REAHA_TALK_ADDICTION_CURE"] == undefined)
	{
		reahaConfidence(5);
		flags["REAHA_TALK_ADDICTION_CURE"] = 1;

		output("<i>“Is there anything I can do to help?”</i> you ask. ");
		
		output("\n\n <i>“I don’t... I don’t know, [pc.name]. Unless you want to drop me off at whatever the lust-patch equivalent of an AA meeting is...”</i>");
		
		output("\n\n<i>“Rehab is an option...”</i>");
		
		output("\n\nThe moment you mention it, Reaha shakes her head, strawberry hair flicking wildly from side to side. Instead, she presses herself up against you, her arms and chest squeezing at you. <i>“I don’t... please don’t check me into rehab, [pc.name]. I don’t think I could bear the shame. And I...");
		if (reahaConfidence() >= REAHA_CONFIDENCE_HIGH) output(" I want to stay here with you.");
		else output(" I don’t want to be alone like that. Not again.");
		output("”</i>");
		
		output("\n\nYou’re not sure if you even could force the issue, given her contract. But you could try and help Reaha yourself. You pose the idea to the cow-girl.");
		
		output("\n\nReaha looks up as if surprised, her big blue eyes locking on yours. <i>“Do you... do you mean it, [pc.name]? I’d give anything to get rid of these fucking things.”</i> ");
		
		output("\n\nAs if to punctuate her point, the cow reaches down to her thigh and grabs one of the patches, peeling it off with an audible <i>rip</i>. The skin there is reddened, completely flushed with the sensitizing aphrodisiac. She winces as she pulls the patch away, and you quickly see that it’s with a sudden burst of arousal, not pain: her cunt twitches, moisture trickling from her lips and onto her thighs. Reaha makes a little whining sound and starts clutching at your");
		if (pc.isChestGarbed()) output(" [pc.upperGarment]");
		else output(" [pc.chest]");
		output(", moaning and rubbing her crotch against your [pc.leg]. ");
		
		if (pc.IQ() >= 50) output("\n\nIt looks like the patch just dumped its entire load into her when she tried to peel it off. ");
		else output("\n\n");
		output("This might be more work than you bargained for, but judging by the suddenly eager cow-girl grinding on you, it’ll at least be fun.");

		processTime(10);

		sexWithFollowerReaha(false);
	}
	else
	{
		output("<i>“How are you doing, anyway?”</i> you ask, nodding toward");
		if (reahaAddiction() >= REAHA_ADDICTION_MED) output(" a");
		else output(" the");
		output(" patch on her thigh.");
		
		output("\n\n");
		if (reahaAddiction() >= 90) output("<i>“I dunno, [pc.name],”</i> Reaha says with a little shrug. I still wake up in the night </i>craving<i> patches, just like always. Even if I manage to keep away from them, I just feel... wrong. Angry, afraid, I don’t know how to describe it. But I don’t like it. I don’t like how not having them makes me feel at all...”</i>");
		else if (reahaAddiction() >= 80) output("<i>“I actually pulled a few patches off, [pc.name]. All on my own!”</i> the cow proudly announces, her chest swelling with something other than milk for once. <i>“I still feel really weird without them, but I’m trying to tone it back. Maybe one or two patches less a day, but it’s something!”</i>");
		else if (reahaAddiction() >= 70) output("<i>“I’m making progress, [pc.name]. I still feel kind of... off... all the time, but I’m forcing myself to keep off the patches a little. Rationing them helps, you know, just a certain number a day. It’s hard, but with you here, I think... I think I can do it!”</i>");
		else if (reahaAddiction() >= 60) output("<i>“I think... I think I’m really doing this, [pc.name]!”</i> Reaha says, beaming at you. <i>“I’ve tried to do it before, on my own, but I always just got so scared and felt so weird that I stopped... but now, I’m really using less patches -- a lot less!”</i>");
		else if (reahaAddiction() >= 50) output("<i>“I’m doing it, [pc.name]!”</i> Reaha says confidently, grinning from ear to floppy bovine ear. <i>“I’m starting to feel a little less shit all day, and I’m using almost half as many patches as I used to. I’m really doing it, [pc.name]!”</i>");
		else if (reahaAddiction() >= 40) output("<i>“I actually feel... good, [pc.name],”</i> Reaha says with a confident little grin. <i>“I can’t remember the last time I wasn’t just... horny all the time. Desperately, horribly horny. I’m only using a few patches a day now, and I’m trying to work on these mood swings I’ve been having. I think I’m starting to really get there, [pc.name]!”</i>");
		else if (reahaAddiction() >= 30) output("<i>“I’m doing good, thanks,”</i> Reaha says with a little smile. <i>“I mean... </i>really<i> good. I’m not even ordering more patches now... I’ve got enough to last me, I think, until I kick the habit. I barely use any now, just one or two at a time. And I don’t feel all that weird without them. I’ve even started experimenting with none at all!”</i>");
		else if (reahaAddiction() >= 20) output("<i>“I’m good. Really good!”</i> Reaha says, grinning. <i>“I’m only using a couple of patches </i>a day<i> now. Just one at a time, really. I feel like I have a lot more energy, now -- and not just sexual energy, either. Though that’s still there, don’t worry!”</i> she giggles, giving you a playful nudge.");
		else output("<i>“Great!”</i> Reaha says, beaming. <i>“I think I’m almost through this, [pc.name]. Thanks to you. My skin’s nowhere near as stupidly sensitive, now, and I feel like I can really </i>think<i> properly again! I feel so much better... I even tried putting on a pair of panties the other day! I haven’t been able to wear them since I started on the patches, but now... I might have to do some clothes shopping soon!”</i>");

		processTime(5);
		showReahaTalkMenu(reahaTalkAddiction);
	}
}

public function reahaTalkAddictionILike():void
{
	clearOutput();
	reahaHeader();

	reahaConfidence(-5);

	output("<i>“I like ‘em,”</i> you say, poking at a pleasure patch. Her body shivers, and a little trickle of moisture beads out from her big pussy, which you wipe away. ");
	
	output("\n\nShe blushes as your finger nears her crotch. <i>“I... I, uh... you’re not the first person to say that. Most of my johns back at Beth’s like ‘em too. Especially when they could just tease me till I came. But </i>I<i> don’t like them. I ran the fuck away from my homeworld to avoid turning into a cum-hungry whore, but what do I end up as? Ugh. Maybe it was inevitable. Mom always made sure I knew what I was going to be when I grew up...”</i>");

	processTime(4);
	showReahaTalkMenu(reahaTalkAddiction);
}

public function reahaTalkGeneMods():void
{
	clearOutput();
	reahaHeader();
	
	flags["REAHA_MILKMODS_UNLOCKED"] = 1;

	output("<i>“Tell me about these mods of yours,”</i> you ask, looking the busty bovine over from horned head to cute little toe.");
	
	output("\n\nReaha blushes a little as you size her up, and cradles her arms under her bust -- more to heft the milky jugs up for your inspection than to support them.");
	
	output("\n\n<i>“Well, I was born with these horns of mine,”</i> she says after a moment, reaching up to poke one of the little cow-nubs growing from her head. <i>“My family’s been Treated for so long that cow-ness is just part of our DNA, I guess. Everything else is custom designed, though. Especially these,”</i> she says, cupping her chest and giving herself a manual milkshake.");
	
	output("\n\n<i>“It took a lot of work to get my tits the way I wanted them. I was pretty busty on my own, but I didn’t have </i>udders<i> like these, you know? And I really wanted ‘em, so... I bought ‘em. Took a lot of different mods to get my tits just right, and then I had to use a bunch of different ones to get myself lactating a lot. I tried to manually stimulate myself, but all I got was a little trickle after </i>months<i> of work... but a couple doses of Lacta Rush, some Milk Gushers, and some designer mods, and I was lactating like a regular dairy girl back home.”</i>");
	
	output("\n\nShe blushes again as she admits, <i>“Plus I might have bought a few mods for other parts, too. When I got out of the army, I was way too hard looking... I wanted to be a soft little cow, not a big-titted amazon, you know?”</i>");
	
	output("\n\n<i>“And that?”</i> you ask, pointing to the strawberry-tipped tuft at the end of her swishing tail.");
	
	output("\n\n<i>“I dunno. I got talked into it when I got my breast mods. The guy said it would help me keep my balance with all the front weight, but... well, it’s cute at least! I’m just glad I didn’t let him talk me into getting hooves. Yuck!");
	if (pc.hasLegFlag(GLOBAL.FLAG_HOOVES)) output(" Uh. No offense...");
	output("”</i>");

	processTime(10);

	//[Sounds Expensive] [Why Mods?] [Looks Before Mods?] [Next]
	clearMenu();
	addButton(0, "Expensive", reahaTalkGeneModsExpensive, undefined, "Sounds Expensive", "All those mods must have cost a fortune...");
	addButton(1, "Why Mods?", reahaTalkGeneModsWhy, undefined, "Why Mods?", "Ask Reaha why she felt the need to modify herself.");
	if (flags["REAHA_TALK_GENEMODS_BEFORE"] == undefined) addButton(2, "Before?", reahaTalkGeneModsBefore, undefined, "Looks Before Mods?", "Ask Reaha what she looked like before getting her mods.");
	else addButton(2, "Before?", reahaTalkGeneModsBefore, undefined, "Looks Before Mods?", "You ask Reaha if you can see those pics of her before her modification again.");
}

public function reahaTalkGeneModsExpensive():void
{
	clearOutput();
	reahaHeader();

	output("<i>“All those mods must have cost a fortune, Reaha. How did you-”</i>");
	
	output("\n\nHer lips twist into a pout. <i>“Of course I couldn’t afford it. How do you think I got here?”</i> She sighs, shoulder slumping. ");
	
	output("\n\n<i>“Sorry... but it’s true. I never really had to handle money on New Texas, and bulls would just buy my mom and sisters pretty much whatever they wanted. Me, too, though I usually told ‘em to leave me alone. Plus, Mom spent more time trying to teach me how to catch a bull than how to balance a checkbook, so... I mean, it wasn’t entirely my family’s fault. I know I fucked up. But when I got out of the army, it was the first time I had any actual money -- I’d been completely penniless before. I left New Texas with nothing but the clothes on my back and a lunch box.");
	
	output("\n\n<i>“I didn’t know how to handle money, or credit, or anything. So I got in trouble real quick. These stupid tits landed me in a debtors’ camp, and then the next thing I know, I’m getting sold like a slave.”</i>");

	processTime(5);

	showReahaTalkMenu(reahaTalkGeneMods);
}

public function reahaTalkGeneModsWhy():void
{
	clearOutput();
	reahaHeader();

	output("<i>“So why did you go in for all those mods, anyway?”</i>");
	
	output("\n\nReaha shrugs, avoiding your eyes. <i>“I dunno... I wanted ‘em, I guess.”</i>");
	
	output("\n\n<i>“Come on, there’s more to it than that,”</i> you say.");
	if (!pc.isNice()) output(" <i>“You don’t go into debt like you did just because.”</i>");
	
	output("\n\n");
	if (reahaAddiction() >= REAHA_ADDICTION_HIGH && reahaConfidence() <= REAHA_CONFIDENCE_LOW) output("Reaha grunts and slaps a fresh pleasure patch onto her butt, hard enough to make herself jiggle. ");
	output("<i>“I grew up on New Texas, okay? Imagine being on a planet where everybody’s a big-tittied cow who squirts milk if she thinks too hard. And then you’re just.... not. Guess you could call it self-image issues, but I just didn’t feel </i>pretty<i> without all this,”</i> she says, waving a hand over her bovine body. ");
	
	output("\n\n<i>“Being a big, chesty cow was what I grew up thinking was attractive. So of course I wanted that, too... just without the Treatment to fuck my brain over. I thought I could have the best of both worlds. Fuck me, right?”</i>");
	
	output("\n\nA moment passes before she realizes the irony in full, and sighs. <i>“I guess a lot of people fucked me because of them. That’s not what I wanted, you know? I grew up so completely disgusted with my mother, my sisters... and then what’s the difference anymore? Nothing, is what.”</i>");

	processTime(5);

	clearMenu();
	addButton(0, "Comfort", reahaTalkGeneModsWhyComfort);
	addButton(1, "Rebuke", reahaTalkGeneModsWhyRebuke);
}

public function reahaTalkGeneModsWhyComfort():void
{
	clearOutput();
	reahaHeader();

	if (flags["REAHA_TALK_GENEMODS_WHY"] == undefined)
	{
		flags["REAHA_TALK_GENEMODS_WHY"] = 1;
		reahaConfidence(5);
	}

	output("<i>“This isn’t your fault, Reaha,”</i> you say");
	if (reahaAddicted())
	{
		output(", nodding to the pleasure patch");
		if (reahaAddiction() >= REAHA_ADDICTION_MED) output("es");
		output(" on her thigh");
	}
	output(".");
	
	output("\n\nShe sighs. <i>“It is, but... thanks, I guess. I didn’t know what I was getting myself into, but I asked for everything that’s happened to me. I get that.");
	if (reahaConfidence() >= REAHA_CONFIDENCE_MED) output(" But I’m glad I have someone like you to make all of this less awful. I couldn’t have wished for a better [pc.master].");
	output("”</i>");
	
	output("\n\nYou pull Reaha into a hug. One that she gladly accepts. <i>“I’m sorry, [pc.master]. I didn’t mean to be a big downer. I’m probably terrible to talk to, right? C’mon, let’s talk about something else... or maybe I could get you a glass of milk?");
	if (reahaConfidence() >= REAHA_CONFIDENCE_HIGH) output(" Mom used to say it’s always best milked for someone you like!");
	output("”</i>");

	processTime(5);

	showReahaTalkMenu(reahaTalkGeneMods);
}

public function reahaTalkGeneModsWhyRebuke():void
{
	clearOutput();
	reahaHeader();

	if (flags["REAHA_TALK_GENEMODS_WHY"] == undefined)
	{
		flags["REAHA_TALK_GENEMODS_WHY"] = 2;
		reahaConfidence(-10);
	}

	output("<i>“You’re right, you’re no different than they are,”</i> you say, matter-of-factly. <i>“You don’t have much room to talk about disgust and contempt now, do you?”</i>");
	
	output("\n\nReaha balks. <i>“I-I know that, dammit. Believe me, the irony hasn’t escaped me. But that doesn’t mean I have to like what I’ve become, you know? I’m </i>ashamed<i>, every single day.”</i>");
	
	output("\n\nWith a huff, she rubs at her eyes and turns away. <i>“I don’t feel like talking anymore. Just... just fuck me or milk me or something, already. It’s all I’m good for, right?”</i>");

	processTime(5);

	showReahaTalkMenu(reahaTalkGeneMods);
}

public function reahaTalkGeneModsBefore():void
{
	clearOutput();
	reahaHeader();

	if (flags["REAHA_TALK_GENEMODS_BEFORE"] == undefined)
	{
		flags["REAHA_TALK_GENEMODS_BEFORE"] = 0;
		reahaConfidence(5);

		output("<i>“Hey, do you still have any pictures from... you know, before you got all your mods?”</i>");
		
		output("\n\n<i>“Huh?”</i> Reaha says, blinking. <i>“Yeah, I guess... why?”</i>");
		
		output("\n\nYou chuckle. <i>“I wanna see what you looked like before, that’s why.”</i> ");
		
		output("\n\n<i>“Oh! Really?”</i> she asks, eyes widening. <i>“Uh, yeah, I guess I have some pics around here...”</i> Reaha adds, leaning over the small holoterminal in her quarters and poking a few hovering hardlight buttons. After a moment, the screen flickers to a 3D picture of several uniformed Terran-Space Coalition troops lined up in front of a heavy hover tank, arms locked over each other’s shoulders. You reach over your cow’s shoulders and flick the zoom, scrolling in on a very busty, soft looking girl on the far right of the company... only to see that she’s got brown hair under her helmet, and a much darker complexion than Reaha. ");
		
		output("\n\n<i>“That’s not me. I’m over in the middle. There,”</i> Reaha says, jabbing a finger at a short, athletic trooper who’s reaching way up to put her arms around the soldiers beside her. Her breasts are barely noticable under her uniform, and her curves are nothing to really speak of. She’s almost boyish looking. You’d barely recognize her for Reaha if it weren’t for the smattering of freckles on her cheeks.");
		
		output("\n\nHoly shit. ");
		
		output("\n\nReaha fidgets a bit. <i>“I know... I was kinda ugly. Here, this pic’s a little better.”</i> She swipes her hand across the display, and a new photo appears. This one taken in a bathroom mirror from a wrist-computer. The pre-modded Reaha is standing buck-nude, one arm raised to take the picture, the other covering her more noticable -- but certainly not cow-like -- chest. She’s maybe sporting D-cups, or big Cs, even. She’s a bit shorter than she is now, five foot nothing of athletic, well-toned human woman. She definitely kept in shape, a far cry from the soft, fleshy cow she is now. Her tail’s not grown in yet, but its absence makes room for a pair of cute cow-print panties hugging Reaha’s hips. ");
		
		output("\n\nYou look down from the holoscreen to the flesh-and-blood Reaha beside you. She’s curled up a bit in her chair, tail tucked under herself, and her cheeks are flushed a rosey red.");

		processTime(10);

		//[Like Old Reaha] [Like Cow Reaha] [Next]
		clearMenu();
		addButton(0, "Like Old", reahaTalkGeneModsBeforeOld);
		addButton(1, "Like New", reahaTalkGeneModsBeforeNew);
		// addButton(2, "")
	}
	else
	{
		if (flags["REAHA_TALK_GENEMODS_BEFORE"] == 2)
		{
			output("<i>“Sorry, [pc.name],”</i> Reaha says with a little shrug of her shoulders. <i>“I deleted them after I showed them to you. I decided I didn’t need any more reminders of who I was.");
			if (reahaConfidence() >= REAHA_CONFIDENCE_HIGH) output(" I like who I am now... thanks to you.");
			else if (reahaConfidence() <= REAHA_CONFIDENCE_LOW) output(" I know I should have asked permission first, but... I just wanted them gone. I want to be me now.");
			output("”</i>");

			processTime(2);
		}
		else
		{
			output("\n\n<i>“Sure, [pc.name],”</i> Reaha says, tapping on her holoscreen until the album of pre-mod pictures pops up for your perusal: ");
			
			output("\n\nFirst, the screen flickers to a 3D picture of several uniformed Terran-Space Coalition troops lined up in front of a heavy hover tank, arms locked over each other’s shoulders. You reach over your cow’s shoulders and flick the zoom, scrolling in on a short, athletic trooper who’s reaching way up to put her arms around the soldiers beside her. You’d barely recognize it for Reaha if it weren’t for the smattering of freckles on her cheeks.");
			
			output("\n\nReaha fidgets a bit. <i>“I know... I was kinda ugly. Here, this pic’s a little better.”</i> She swipes her hand across the display, and a new photo appears. This one taken in a bathroom mirror from a wrist-computer. The pre-modded Reaha is standing buck-nude, one arm raised to take the picture, the other covering her ample -- but certainly not cow-like -- chest. She’s maybe sporting D-cups, or big Cs, even. She’s a bit shorter than she is now, five foot nothing of athletic, well-toned human woman. She definitely kept in shape, a far cry from the soft, fleshy cow she is now. Her tail’s not grown in yet, but its absences makes room for a pair of cute cow-print panties hugging Reaha’s hips. ");
			
			output("\n\nYou look down from the holoscreen to the flesh-and-blood Reaha beside you. She’s curled up a bit in her chair, tail tucked under herself, and her cheeks are flushed a rosey red. <i>“Happy?”</i> she asks, quickly minimizing the pics when you nod.");

			processTime(5);
		}

		showReahaTalkMenu(reahaTalkGeneMods);
	}
}

public function reahaTalkGeneModsBeforeOld():void
{
	clearOutput();
	reahaHeader();

	reahaConfidence(-5);

	flags["REAHA_TALK_GENEMODS_BEFORE"] = 1;

	output("<i>“She’s cute,”</i> you say, indicating the girl in the pictures. ");
	
	output("\n\n<i>“If you say so,”</i> Reaha says, fidgeting uncomfortably. <i>“She’s just... not really me.”</i> ");
	
	output("\n\nYou cock an eyebrow at her. <i>“What do you mean?”</i>");
	
	output("\n\nReaha shrugs slightly, withdrawing a bit further. <i>“I didn’t really like her, I mean. She was too tough and wasn’t very pretty. I didn’t like being her... I like being me");
	if (reahaConfidence() <= REAHA_CONFIDENCE_LOW)
	{
		output(", even if I’m a whore");
		if (reahaAddicted()) output(" and an addict");
	}
	if (reahaConfidence() >= REAHA_CONFIDENCE_HIGH)
	{
		if (reahaAddicted()) output(", even if I’m an addict and a one-time whore");
	}
	output(". That’s all.”</i>");

	processTime(3);

	showReahaTalkMenu(reahaTalkGeneMods);
}

public function reahaTalkGeneModsBeforeNew():void
{
	clearOutput();
	reahaHeader();

	reahaConfidence(10);

	flags["REAHA_TALK_GENEMODS_BEFORE"] = 2;

	output("<i>“She’s cute,”</i> you say, indicating the girl in the pictures. <i>“But you’re cuter,”</i> you say, patting the span of strawberry-blonde hair between Reaha’s little horns. ");
	
	output("\n\nThe little cow makes a soft, mooing sound and smiles up at you. <i>“Thanks. I think so too,”</i> she says, rubbing her head back up against your palm. <i>“I’m glad all this... all these mods weren’t for nothing. I just wanted to be pretty...”</i>");
	
	output("\n\n");
	if (pc.isNice()) output("<i>“You did a good job, then,”</i> you answer, returning her smile.");
	else if (pc.isMischievous()) output("<i>“You’re the cutest cow in the galaxy,”</i> you tease, rubbing one of her nub horns.");
	else output("<i>“You did alright,”</i> you say, patting her head a little firmer. <i>“Managed to get me to buy you, didn’t you?”</i>");

	processTime(3);

	showReahaTalkMenu(reahaTalkGeneMods);
}

public function reahaTalkHerLife():void
{
	clearOutput();
	reahaHeader();

	output("<i>“So, what did you do between leaving New Texas and");
	if (pc.isNice()) output("... well, you know");
	else if (pc.isMischievous()) output(" turning into a cute little cow");
	else output(" getting sold into slavery");
	output("?”</i>");
	
	output("\n\n<i>“This!”</i> Reaha answers, turning on a heel and spanking her great big jiggly butt, right on the big anchor tattoo on her cheek. The inked cheek quivers in response to the gentle smack");
	if (reahaAddiction() >= 50) output(", and Reaha gives a little gasp of pleasure from the touch, as if she’d forgotten how sensitive her pleasure patches make her");
	output(". <i>“I’m only twenty-one, you know. I haven’t really done a whole lot besides the army and then the whole whoring thing.”</i>");
	
	output("\n\n<i>“Well, tell me about it,”</i>");
	
	output("\n\nReaha grins, rubbing her tattoo. <i>“Right before I turned eighteen, I hopped ship off of New Texas. Well, stowed away might be a better term for it. I sort of put myself in a box and hoped for the best. Lucky me, when the captain found me, he wasn’t too upset. I guess he understood why I’d want to get out of there. He took me all the way to Earth, no charge. Not like I could have paid him anyway -- I didn’t really have any money. Which was... sort of a problem when I got to Earth. I didn’t have any skills, and I didn’t know anything about anything other than milk and boobies, so I didn’t really know what I was going to do, until the captain said I ought to think about joining the army. He’d been in the navy, he said, and learned to pilot a ship there.”</i>");
	
	output("\n\n<i>“Plus they’d feed, house, and pay me for a couple of years, too. That wasn’t a bad deal, either,”</i> Reaha says with a wry little chuckle. <i>“So yeah, I signed up not long after I hit Terra on a two-year contract. They put me in the infantry, seeing as I didn’t have any particular aptitudes or skills -- but I’m pretty strong and tough, or I was anyway. I didn’t really do anything special while I was in, just another grunt, you know? I was berthed on the </i>Odyssey<i> while she did a tour of the core, brand new flagship straight out of the docks. Made it up to lance corporal after a little more more than a year. Honestly, I liked being in the army. I don’t know that I’d call it fun, but it was... it was good,”</i> Reaha says, giving you a little shrug. ");
	
	output("\n\n<i>“Why’d you leave, then?”</i>");
	
	output("\n\nShe grimaces. <i>“They told me I wasn’t allowed to use certain kinds of modifications that I wanted. I had the money for them, at least the first set I wanted to get, but the doctors told me I couldn’t. Things like chest enhancers, some of the ones that got rid of my muscle, made me nice and soft. I understand why, but that doesn’t mean I have to like it. So I didn’t sign back on after my two years were up.”</i>");
	
	output("\n\n<i>“It wasn’t long after that that I ended up getting pinched by debt collectors. After having to wait so long, I guess I got kind of wild with my mods. I got addicted to taking them, just kept spending more and more until I was just PERFECT... and several thousand in debt. I guess I spent just under a year working for Beth Carver before you");
	if (reahaConfidence() < REAHA_CONFIDENCE_MED) output(" bought me");
	else if (reahaConfidence() < REAHA_CONFIDENCE_HIGH) output(" got me out of there ");
	else output(" rescued me");
	output(".”</i>");
	
	if (reahaConfidence() > REAHA_CONFIDENCE_LOW) output("\n\nReaha grins and presses herself up close to you. <i>“Thanks for that, by the way. Being with you is a hell of a lot better than sitting in Carver’s rape dungeon with my legs spread all day. I’m a lot happier here, [pc.name]. Thank you.");

	processTime(10);

	showReahaTalkMenu(reahaTalkHerLife);
}

public function reahaAddictionTherapy():void
{
	clearOutput();
	reahaHeader();

	flags["REAHA_ADDICTION_THERAPY_LAST_DAY"] = days;

	reahaAddiction(-5);
	reahaConfidence(5);

	output("<i>“Time to work on getting rid of");
	if (reahaAddiction() > REAHA_ADDICTION_LOW) output(" those");
	else output(" that");
	output(",”</i> you say, pointing to the pleasure patch");
	if (reahaAddiction() > REAHA_ADDICTION_LOW) output("es");
	output(" stuck like stickers on Reaha’s thigh.");
	if (reahaConfidence() <= REAHA_CONFIDENCE_LOW) output(" She winces as if threatened, shifting her leg to cover the other, hiding the patches from sight. <i>“I-If you say so...”</i>");
	else if (reahaConfidence() <= REAHA_CONFIDENCE_HIGH) output(" She takes a deep breath to center herself, then gives you a resolute nod. <i>“Alright, [pc.name]. Let’s do this.”</i>");
	else output(" Reaha nods eagerly, her little tail swishing. <i>“My favorite part of the day! Let’s do this, [pc.name].”</i>");
	
	output("\n\nYou put a reassuring hand on Reaha’s shoulder and give her a gentle push towards her bed. She sits back at your command and");
	if (reahaConfidence() <= REAHA_CONFIDENCE_LOW) output(" bites her lip nervously, locking her legs together until you manually reach in and spread them apart, revealing the coating of patches on her inner thighs and the drooling, over-stimulated gash of her sex.");
	else if (reahaConfidence() <= REAHA_CONFIDENCE_HIGH) output(" Reaha slowly spreads her legs apart, letting you see just how many patches she’s wearing -- fewer than you remember, certainly, though her pussy is still rose-red and glistening with moisture, brought on by the chemical stimulation bleeding into her skin.");
	else
	{
		output(" spreads her legs, showing off the");
		if (reahaAddiction() > REAHA_ADDICTION_LOW) output(" handful of patches");
		else output(" lonely patch");
		output(" still sticking to her, as well as her much more... normal looking cunt. To your delight, it’s still nice and aroused... though not, you think, from any chemical interference.");
	}
	output(" Reaha blushes a little");
	if (reahaConfidence() >= REAHA_CONFIDENCE_HIGH) output(" and grins down at you");
	output(" as you stare between her legs.");
	
	output("\n\nYou plant your hands on Reaha’s knees");
	if (reahaConfidence() <= REAHA_CONFIDENCE_LOW) output(" to keep them spread despite her nervousness");
	output(" and lock eyes with her. <i>“You ready?”</i>");
	
	output("\n\n");
	if (reahaConfidence() <= REAHA_CONFIDENCE_LOW) output("Tentatively");
	else output("Eagerly");
	output(", Reaha nods, tapping the");
	if (reahaAddiction() <= REAHA_ADDICTION_LOW) output(" lone patch");
	else output(" the highest patch");
	output(" on her inner thigh. You reach in, fingers teasing up her tender skin until she lets out a little gasp, body making one big, tit-jiggling quake that carries through from bubble butt to heaving bosom. Your fingers find the lip of the target pad, and you ply a single");
	if (pc.armType == GLOBAL.TYPE_HUMAN) output(" nail");
	else if (InCollection(pc.armType, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_FELINE, GLOBAL.TYPE_BADGER, GLOBAL.TYPE_PANDA, GLOBAL.TYPE_LEITHAN)) output(" claw");
	else output(" digit");
	output(" to peel it off. You give it one swift rip, yanking it off to a loud gasp of pain from the cow, and a sudden reddening of the skin where the patch was, soaking up the last remnants of its drugs. Reaha groans, scratching at the place the patch was.");
	if (reahaAddiction() > REAHA_ADDICTION_LOW)
	{
		output(" You repeat the process, yanking off several more patches until she’s squirming under your fingertips, her thighs clearing up quickly.");
		if (reahaAddiction() >= REAHA_ADDICTION_HIGH) output(" You give her a little push onto her back and raise her legs up, just enough to get a view of her big butt and several more patches tacked on there, which you rip off with equal zeal.");
		output(" By the time you’re done, she’s almost entirely devoid of her pleasure patches, clearing up her thick thighs enough for you to give them a friendly rub from knee to crotch without brushing more than a single patch on either side.");
	}
	
	output("\n\n<i>“Feel alright?”</i> you ask, patting");
	if (reahaAddiction() > REAHA_ADDICTION_LOW) output(" a");
	else output(" the");
	output(" red-tinged square of thigh.");
	
	output("\n\n<i>“It tingles,”</i> she admits, a bit sheepishly.");
	if (reahaAddiction() >= REAHA_ADDICTION_HIGH) output(" <i>“I feel... weird. Kind of empty,”</i> Reaha adds, fidgeting. She barely waits a minute before reaching over towards her box of pleasure patches, and you have to swat her hand away from them. She recoils, making a sound somewhere between an alarmed squeal and a moo, before looking bashfully down between her legs.");
	
	output("\n\n<i>“That’s alright,”</i> you say, stroking her thigh. <i>“I’m going to make you feel just as good as with those patches on.”</i>");

	processTime(20);
	pc.changeLust(33);

	if (pc.hasCock()) addNextButton(reahaAddictionTherapyDickwielder);
	else addNextButton(reahaAddictionTherapyNoWingWang);
}

public function reahaAddictionTherapyDickwielder():void
{
	clearOutput();
	reahaHeader();

	output("You give your busty bovine companion a reassuring smile and a gentle push onto her back, planting her on the bed with her legs already nice and spread for you, her cunt glistening with her ever-present excitement. You lean in on it, letting your [pc.tongue] play out across your cow’s thigh, licking up the bare, patch-reddened flesh. She shudders at your lightest touch, moaning when you near the musky, sweet delta of her crotch. You lick up and across the lip of her labia, eliciting a back-arching mewl of pleasure from Reaha as you make your way up to her big, blatant clit. ");
	
	output("\n\n");
	if (reahaAddiction() >= REAHA_ADDICTION_HIGH) output("Reaha’s much, much too sensitive to go straight for the prize, though. You trace your [pc.tongue] around the swell of it, leaving butterfly kisses on the cow-girl’s crotch. The lips of her pussy, though, are open game for your attentions. You nibble at the loose, thick folds on offer, letting your tongue sample the honeypot between them. Reaha gives a little girlish squeal when your tongue probes into her; her legs clench tight around you, gripping you tight as you start to really eat her out.");
	else output("With Reaha’s reliance on patches already down, you feel confident enough to actually go in and tease her clit. She’d have lost her mind on more than a light touch before, but now as you caress the swell of it with your tongue, she just moans and shudders, legs wrapping around you to draw you in further. <i>“Not... not too much,”</i> she groans, her back arching as you lick and kiss on her. Giving her a knowing wink, you plant your lips flush on Reaha’s pleasure-buzzer and give it a gentle, long suckle like you might to one of her milky teats. You slowly make your way down from her clit after that, letting your [pc.tongue] probe between the loose, heavy lips of her pussy and into the sweet honeypot hidden between them.");
	
	output("\n\nReaha shivers at your touch, her wide hips moving to meet your probing [pc.tongue], urging you deeper into her wide, slick channel. Her muscles wring and squeeze on your tongue, searching for a big, thick cock to spread themselves wide on; instead, you lick and caress them, showering her vaginal walls with loving attention.");
	if (reahaAddiction() >= REAHA_ADDICTION_HIGH) output(" As usual");
	else if (reahaAddiction() >= REAHA_ADDICTION_LOW) output(" No matter how much you wean Reaha from her patches");
	else output(" Still, even after you’ve nearly broken her need for patches");
	output(", Reaha’s sensitivity gets the better of her. She gives a little yelping cry as you find a particularly tender place in her pussy, and you’re suddenly flooded by a deluge of fem-cum, splattering across your face. You redouble your efforts as Reaha cums, helping her ride out her orgasm with loving licks and short kisses across her lips. Her hips buck and her whole body quivers, tits shaking and squirting onto her, slathering her chest in [reaha.milkNoun] and her thighs in fem-spunk. ");
	
	output("\n\nYou keep going, slowing down as Reaha’s body starts to calm itself. She’s breathing hard, already a sopping wet mess just from a little oral attention. You slip out from between the cow-girl’s legs, licking up some of the sundry moisture from her curvaceous body as you meander up to lock eyes with her. ");
	
	output("\n\n<i>“Just as good without the patches, huh?”</i> you ask, locking your lips over one of her big, bovine teats and drawing forth a little trickle of milk for yourself. ");
	
	output("\n\n");
	if (reahaAddiction() >= REAHA_ADDICTION_HIGH) output("<i>“I can... I can feel the difference,”</i> Reaha admits, cupping the tit underneath your lips. <i>“Everything’s less... intense, I guess? But you make it feel amazing anyway.”</i>");
	else if (reahaAddiction() > REAHA_ADDICTION_LOW) output("<i>“I can barely feel the difference,”</i> Reaha giggles, smiling down at you. <i>“Some of me knows it would be better with them, but with you... you already make me feel amazing anyway.”</i>");
	else output("<i>“Better!”</i> she grins, wiggling under your wandering fingers. <i>“It’s like... like I can finally feel for myself now. Like I’m not getting everything all muddied up and confused. And I wouldn’t miss a beat of your lovemaking for the world.”</i>");
	
	output("\n\nYou pull yourself off her teat and smile at the compliment.");
	if (reahaConfidence() >= REAHA_CONFIDENCE_HIGH) output(" Reaha, in turn, leans down and plants a quick, affectionate kiss on your [pc.lips].");
	output(" <i>“What do you say about round two?”</i>");
	
	output("\n\nYou crawl up overtop her, looming over Reaha as you crawl into the bed with her. She squirms under you, moisture beading on her big teats. You lean in and give them each one long lick, lapping up the stray droplets of [reaha.milkNoun] -- and making the cow-girl shudder at the sensation of your [pc.tongue] on her. Reaha grins up at you, cradling her arms under her bust as if to put them on display for you. Clearly she likes it when you play with her... ");
	
	output("\n\nYou grab one of her breasts, planting your hand on the soft, jiggly milk-bag and giving it a gentle squeeze. Your fingers all but vanish into it, enveloped by Reaha’s boobflesh -- and a little squirt of [reaha.milkNoun] that trickles into the trenches left by your grasp. The cow-girl lets out a low, throaty moo as you massage her titflesh, switching from one boob to the other, gently squeezing and kneading until Reaha’s crying out her pleasure. That’s better. You shift your grip down, abandoning her ample rack for the soft, spankable swell of her behind and hefting it into the air. With a little effort, you’re able to flip the thickset bovine onto all fours, giving her up-turned rump a little smack for emphasis. She squeals, but ends up wiggling her hips and raising her tail out of the way invitingly. You slip down onto your [pc.knees] behind her, spreading her big, tattooed cheeks to get a good look at her pussy. She’s still nice and drenched, and you easily are able to slide a few fingers into her to the hilt, stirring her up until she’s groaning and your digits are nice and slathered with her excitement. Before you’re done, Reaha’s bucking her hips back on your hand, trying to take you fast and deep.");
	
	output("\n\nBut you’ve got better plans than just a finger-fucking. You pull out before she can get too into it and spend the next few moments slathering up your [pc.cock], coating it with Reaha’s own lube until it glistens. Once you’re satisfied, you let your prick drop into the spread valley between the cow-slut’s cheeks, planting a hand on each of them and digging in. She gives you a lurid little moan, shifting her own hips until you feel the wet, hot hole of her cunt rubbing against your [pc.cockHead]. You don’t hesitate to dive into her, letting your own [pc.hips] carry you into the easily-parting folds of Reaha’s sex, straight down");
	if (pc.biggestCockVolume() <= reaha.vaginalCapacity()) output(" to the hilt");
	else output(" to the very end of her passage, as deep as she can possibly take your massive cock");
	output(" in one long, slow thrust.");
	
	reaha.cuntChange(0, pc.biggestCockVolume(), false, false, false);
	pc.cockChange();
	
	output("\n\nShe moans when you enter her, drawing out into a bellowing <i>“Mooooo!”</i> as you start to fuck her. Knowing Reaha, you don’t bother taking it easy at first, but just start to piston your hips into her silken slit, thrusting hard and fast right from the get-go. You give her a spank right on the anchor tattoo, enjoying the sight of it jiggling in response, and the feeling of her walls contracting hard around your cock. She might be built to take ‘em, but damned if Reaha can’t grip down when she wants to! Another swat makes her squeal and lose track of her arms, flopping down onto the bed with her ass in the air. Even better. One last swat for good measure, hard enough to make her whole ass jiggle, before you get back to the task at hand. Every thrust now brings a cry or groan of pleasure to the cow-girl’s lips, wordless screams of pleasure as you pound her cunt. ");
	
	output("\n\nThat’s what you like to hear! You move faster, hammering into her; every thrust brings a sticky squirt of fem-cum out of her, splattering onto your thighs and [pc.legOrLegs]. Looking over the cow-girl’s shoulders, you see you’re having a similar effect on her <i>other</i> squirters: big, dark wet patches are spreading from her swollen teats as she reflexively lactates, spraying [reaha.milkNoun] onto her sheets. ");
	
	output("\n\n<i>“Good girl,”</i> you tell her, reaching forward and grabbing her tits. She moos as you grab and knead them, giving her udders a loving squeeze until they squirt a nice, thick stream over your fingers. Your praise seems to kick off something inside the busty bovine, though: you’ve barely cleared a half-dozen more thrusts before you feel her pussy contract, gripping vice-tight around you and flooding itself with heat and wetness. Her muscles squeeze and squirm around you, milking you like the skilled whore she is, drawing you into orgasm with her! You give the cow-girl a few more deep thrusts before your last bits of control are wrested from you, and your senses are overwhelmed by the feeling of cum churning in your [pc.balls], ready for release. With one last cry of primal pleasure, you slam yourself");
	if (pc.biggestCockVolume() > reaha.vaginalCapacity()) output(" as deep as Reaha can take you");
	else output(" to hilt into Reaha");
	output(" and bust your nut, [pc.cumNoun] shooting through your stiff prick and into the deepest depths of the cow-girl’s pussy. Your spunk mixes with hers, flooding back out around your [pc.cock] in a wet, murky mix that drools down Reaha’s thighs as you slow your pace. Reaha recovers over a minute or so of groans and mewling whimpers, her whole body quivering with the aftershocks brought on by your rough handling. ");
	
	output("\n\n");
	if (reahaAddiction() < REAHA_ADDICTION_LOW) output("<i>“Who needs patches when I’ve got you?”</i> Reaha purrs, nuzzling against you after you’ve pulled out and given her a few affectionate pats.");
	else output("<i>“I definitely feel better now,”</i> Reaha admits, giving a contented little groan as you pull out of her. <i>“If I can still feel like </i>this<i>... maybe I can make it without the patches.”</i>");

	processTime(60);

	reaha.loadInCunt(pc, 0);

	reaha.orgasm();
	pc.orgasm();
	IncrementFlag("SEXED_REAHA");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function reahaAddictionTherapyNoWingWang():void
{
	clearOutput();
	reahaHeader();

	var hardLight:Boolean = pc.hasHardLightEquipped();

	output("You give your busty bovine companion a reassuring smile as you");
	if (hardLight) output(" reach down and flick the tiny button on the hip of your [pc.lowerUndergarment], letting your hardlight strapon spring to life.");
	else output(" reach over to the leather belt and strapon cock hanging from her bedpost. You shimmey into the strapon belt and tighten it over your [pc.hips], leaving yourself with a floppy, nearly footlong cock dangling from your [pc.crotch].");
	output(" Reaha’s gaze drops to your strapon, and you instantly recognize the growing, hungry look in her eyes. ");
	
	output("\n\nYou reach up and give the cow-girl a little push onto her back, planting her on the bed with her legs already nice and spread for you, her cunt glistening with her ever-present excitement. You lean in on it, letting your [pc.tongue] play out across your cow’s thigh, licking up the bare, patch-reddened flesh. She shudders at your lightest touch, moaning when you near the musky, sweet delta of her crotch. You lick up and across the lip of her labia, eliciting a back-arching mewl of pleasure from Reaha as you make your way up to her big, blatant clit. ");
	
	output("\n\n");
	if (reahaAddiction() > REAHA_ADDICTION_MED) output("Reaha’s much, much too sensitive to go straight for the prize, though. You trace your [pc.tongue] around the swell of it, leaving butterfly kisses on the cow-girl’s crotch. The lips of her pussy, though, are open game for your attentions. You nibble at the loose, thick folds on offer, letting your tongue sample the honeypot between them. Reaha gives a little girlish squeal when your tongue probes into her; her legs clench tight around you, gripping you tight as you start to really eat her out.");
	else output("With Reaha’s reliance on patches already down, you feel confident enough to actually go in and tease her clit. She’d have lost her mind on more than a light touch before, but now as you caress the swell of it with your tongue, she just moans and shudders, legs wrapping around you to draw you in further. <i>“Not... not too much,”</i> she groans, her back arching as you lick and kiss on her. Giving her a knowing wink, you plant your lips flush on Reaha’s pleasure-buzzer and give it a gentle, long suckle like you might to one of her milky teats. You slowly make your way down from her clit after that, letting your [pc.tongue] probe between the loose, heavy lips of her pussy and into the sweet honeypot hidden between them.");
	
	output("\n\nReaha shivers at your touch, her wide hips moving to meet your probing [pc.tongue], urging you deeper into her wide, slick channel. Her muscles wring and squeeze on your tongue, searching for a big, thick cock to spread themselves wide on; instead, you lick and caress them, showering her vaginal walls with loving attention.");
	if (reahaAddiction() > REAHA_ADDICTION_MED) output(" As usual");
	else if (reahaAddiction() > REAHA_ADDICTION_LOW) output(" No matter how much you wean Reaha from her patches");
	else output(" Still, even after you’ve nearly broken her need for patches");
	output(", Reaha’s sensitivity gets the better of her. She gives a little yelping cry as you find a particularly tender place in her pussy, and you’re suddenly flooded by a deluge of fem-cum, splattering across your face. You redouble your efforts as Reaha cums, helping her ride out her orgasm with loving licks and short kisses across her lips. Her hips buck and her whole body quivers, tits shaking and squirting onto her, slathering her chest in [reaha.milkNoun] and her thighs in fem-spunk. ");
	
	output("\n\nYou keep going, slowing down as Reaha’s body starts to calm itself. She’s breathing hard, already a sopping wet mess just from a little oral attention. You slip out from between the cow-girl’s legs, licking up some of the sundry moisture from her curvaceous body as you meander up to lock eyes with her. ");
	
	output("\n\n<i>“Just as good without the patches, huh?”</i> you ask, locking your lips over one of her big, bovine teats and drawing forth a little trickle of milk for yourself. ");
	
	output("\n\n");
	if (reahaAddiction() > REAHA_ADDICTION_MED) output("<i>“I can... I can feel the difference,”</i> Reaha admits, cupping the tit underneath your lips. <i>“Everything’s less... intense, I guess? But you make it feel amazing anyway.”</i>");
	else if (reahaAddiction() > REAHA_ADDICTION_LOW) output("<i>“I can barely feel the difference,”</i> Reaha giggles, smiling down at you. <i>“Some of me knows it would be better with them, but with you... you already make me feel amazing anyway.”</i>");
	else output("<i>“Better!”</i> she grins, wiggling under your wandering fingers. <i>“It’s like... like I can finally feel for myself now. Like I’m not getting everything all muddied up and confused. And I wouldn’t miss a beat of your lovemaking for the world.”</i>");
	
	output("\n\nYou pull yourself off her teat and smile at the compliment.");
	if (reahaConfidence() >= REAHA_CONFIDENCE_HIGH) output(" Reaha, in turn, leans down and plants a quick, affectionate kiss on your [pc.lips].");
	output(" <i>“What do you say about round two?”</i>");
	
	output("\n\nYou shift up onto the bed and plant your arms beside Reaha, looming over her as your [pc.hips] shift slightly, bringing your strapon to bear. She shudders as it brushes her slick thigh, but you feel her legs spread a little wider around you, clearing the way for your");
	if (!hardLight) output(" thick, plastic cock");
	else output(" glowing hardlight schlong");
	output(" to penetrate her. The crown of your strapon brushes the soaked lips of Reaha’s pussy");
	if (hardLight) output(", sending an electric shock of pleasure through the neural feedback of your hardlight");
	else output(", making the cow gasp as her folds are parted ever-so-slightly around the head of the plastic shaft");
	output(". You lean in, pulling yourself in close to the pretty cow and planting a kiss on her cheek. She blushes, moaning lightly as you start to slide your [pc.hips] forward into her cunt. ");
	reaha.cuntChange(0, 200, false, false, false); // 9999, 9999!!!!11
	
	output("\n\nKnowing Reaha, you don’t bother to go gently on her. You quickly slam your strap hilt-deep into her cavernous cunt, wrenching a scream of ecstasy from the cow-girl’s lips. Her back arches, legs clamping around your pistoning hips as you start to pound away at her cunt. The pleasure works its way through her body in the span of half a dozen thrusts, and you’re soon rewarded with a geyser of [reaha.milkNoun] spurting up from her tits. The first squirt catches you square on the face, making you yelp and sputter as the cow coats you in [reaha.milkNoun]. You grab her tits, giving the two fleshy orbs a rough squeeze that redoubles the fountain of [reaha.milkNoun] coming from them, which rains back down on you and Reaha. Before long, you’re both utterly coated in moisture; all you can do is grab one of her teats and try and contain the flow. Reaha takes the other, cupping her other breast up to her mouth and suckling from it. The added sensation of [reaha.milkNoun] trickling through her nipples and lips teasing and caressing them. ");
	
	processTime(60);

	output("\n\nThe stream of [reaha.milkNoun] into your mouth only grows stronger as you fuck her, swelling in intensity every time your strapon slams home into the cow’s welcoming, wet channel. A few more thrusts and you can feel her cumming again; her muscles go wild around your hammering strapon, trying to draw it in, to milk it of cum that simply won’t come.");
	if (hardLight)
	{
		output(" However, the neural feedback from your hardlight cock might just make you cum anyway. Her pussy’s so wet, and squirms around your strapon in the most amazing ways... soon there’s no stopping you, and with a cry of pleasure you find yourself spiraling over the edge, clinging to the cow as your pound her, and yourself, through orgasm.");
		pc.orgasm();
	}
	output(" You slowly start to slow your pace as Reaha recovers, her whole body quivering with the aftershocks brought on by your rough handling. She clings to you, arms and legs, moaning softly as she rides out the end of her orgasm.");
	reaha.orgasm();
	pc.milkInMouth(chars["REAHA"]);
	
	output("\n\n");
	if (reahaAddiction() < REAHA_ADDICTION_LOW) output("<i>“Who needs patches when I’ve got you?”</i> Reaha purrs, nuzzling against you.");
	else output("<i>“I definitely feel better now,”</i> Reaha admits, giving a contented little groan as you pull out of her. <i>“If I can still feel like </i>this<i>... maybe I can make it without the patches.”</i>");

	IncrementFlag("SEXED_REAHA");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function reahaBreastMilkIceCream():void
{
	clearOutput();
	reahaHeader();

	output("You step up to your");
	if (!reaha.isTreated()) output(" soft little");
	else output(" big, strong");
	output(" cow-girl and ask if she’d be up for a frozen treat. ");
	
	output("\n\nShe grins. <i>“Sure! That’d be nice,");
	if (!reahaFree()) output(" [pc.master]");
	else output(" [pc.name]");
	output(",”</i> she says, taking your hand when you offer it and following you off the ship. She follows you on through customs,");
	if (reaha.isTreated()) output(" grinning to herself");
	else output(" blushing");
	output(" as her");
	if (9999 == 0) output(" nude and voluptuous");
	else output(" voluptuous");
	output(" form catches the eye of every bull working in the landing barn. You make a quick pit-stop in customs, checking");
	if (!pc.hasEquippedWeapon()) output(" in with Amma");
	else output(" your weapons and signing in with Amma");
	output(".");
	
	output("\n\nThe cow-girl gives you a playful wink when she sees you with your companion");
	if (flags["REAHA_ICE_CREAM_TIMES"] != undefined) output(".");
	else
	{
		output(", and Ogram laughs, <i>“Ha! Finally gave in and got your own, huh, " + pc.mf("buddy", "beautiful") + "? Can’t say I blame you!”</i>");
	
		output("\n\n<i>“Oggy!”</i> Amma snaps, giving him a look. ");
	
		output("\n\n<i>“Heh. Sorry,”</i> he says with an apologetic shrug.");
		if (!reaha.isTreated()) output(" Reaha fidgets visibly under the sudden attention, especially from Ogram.");
		else
		{
			output("\n\nReaha leans over Og’s desk, towering over the seated bull-man and licking her lips. <i>“Maybe somebody ought to go ahead and </i>get<i> you, huh? You’d make a cute pet.”</i>");
			output("\n\nYou quickly intervene, grabbing Reaha by the tail and yanking her away from Og’s desk before she can try and molest him.");
		}
	}
		
	output("\n\nThe two of you quickly make your way out of the customs office and out into the New Texan main street. From there, it’s a hop and a skip to the Iced Teats shop. You usher Reaha up into the storefront, into the refreshing coolness of the shop.");
	if (flags["REAHA_ICE_CREAM_TIMES"] == undefined) output(" Reaha’s eyes go wide as she sees the girls trapped in glass cases, their teats strapped to suction devices to draw out their milk.");
	
	output("\n\n<i>“Hello, welcome to Iced Teats! My name is " + icedTeatsAlienName() + "! What can I get for you today?”</i> the girl behind the counter chirps happily, indicating the large flavor list behind her. <i>“We have cones, bowls, or frozen feasts, in any combination of flavors you prefer!”</i>");
	
	output("\n\nThat’s nice and all, but you’d rather get a cone of your own favorite flavor. Reaha flavor.");
	
	output("\n\n" + icedTeatsAlienName() + "’s eyes go wide at the suggestion. <i>“That’s... uh, well, I mean...”</i> ");
	
	output("\n\n<i>“What’s the harm? You’ve got a couple free stalls, and I’m willing to pay,”</i> you say, placing a " + (isAprilFools() ? "dogecoin" : "credit chit") + " on the counter. ");
	
	output("\n\n<i>“Well,”</i> " + icedTeatsAlienName() + " says, pursing her lips, <i>“I guess that’ll be alright.”</i> ");
	
	output("\n\nShe pops one of the glass stalls open and turns to Reaha. <i>“Climb on in, miss. The machines will take care of the rest.”</i>");
	
	output("\n\nYour pet bovine gives you a reproachful look as she’s ushered up into the milking machine. Clearly she thought <i>she</i> was going to be getting the treat. Whoops. " + icedTeatsAlienName() + " gives her a little boost up into the stall and closes the door behind her, leaving Reaha to sit herself down inside. A few robotic arms come down from the stall’s ceiling once she’s down, quickly cupping her hefty, [reaha.milkNoun]-laden boobs and affixing a pair of suckers to them.");
	
	output("\n\n<i>“C-c-coooooooold!”</i> Reaha shrieks as the ice cream machine activates, rumbling as it sucks a creamy load of [reaha.milkNoun] from the cow-girl’s tits, passing it through a flash-freezer and into the dispenser. You take a cone " + icedTeatsAlienName() + " offers you and twist the nozzle on the machine, grinning as you’re rewarded with a nice, tall cone of ice cream. The machine pumps Reaha for a few seconds longer than it needs to, making sure to give the cow a nice, full draining before releasing her. The stall pops open as you take the first lick, and Reaha staggers down, cupping her hands around her nipples and shivering. ");
	
	output("\n\nYum. Tastes just like [reaha.milkNoun]!");
	IncrementFlag("REAHA_ICE_CREAM_TIMES");
	flags["REAHA_ICE_CREAM_DAYS"] = days;

	processTime(20);
	pc.credits -= 20;
	pc.milkInMouth(chars["REAHA"]);
	pc.changeLust(5);
	reaha.lust(5);

	//[Share] [Be Greedy]
	clearMenu();
	addButton(0, "Share", reahaBreastMilkIceCreamShare);
	addButton(1, "Greedy", reahaBreastMilkIceCreamGreedy);
}

public function reahaBreastMilkIceCreamGreedy():void
{
	clearOutput();
	reahaHeader();

	output("You thank " + icedTeatsAlienName() + " for the special treat and take Reaha by the hand, leading her back to the ship while you slurp down your delicious, oh-so-sweet ice cream cone. You quickly return to your ship, whereupon");
	if (pc.isNice()) output(" you give Reaha an appreciative pat on the head and thank her for dessert.");
	else if (pc.isMischievous()) output(" you slurp out the graham cracker cone and hang it on one of Reaha’s horns, letting the cow-girl deal with it.");
	else output(" you poke Reaha in the belly hard enough to make her gasp. While her gob’s open, you plant the graham cracker cone between her lips and saunter off.");

	processTime(5);

	addNextButton(mainGameMenu);
}

public function reahaBreastMilkIceCreamShare():void
{
	clearOutput();
	reahaHeader();

	output("<i>“C’mere, Reaha,”</i> you say, waving your shivering cow-girl over. She approaches warily, still rubbing her breasts to warm them back up. You give her a slight smile and extend the cone to her. <i>“Have a taste. It’s good!”</i>");
	
	output("\n\nShe looks between you and " + icedTeatsAlienName() + " before taking the cone and giving it a long lick with her big, flat tongue.");
	
	output("\n\n<i>“Mmm! Hey, that’s not bad!”</i> Reaha giggles, taking another lick. Her previous discontent evaporates as she enjoys her own frozen treat. You have to remind her to share, and after a bit of maneuvering, find yourself licking on one side of the cone as Reaha takes the other, bringing your lips closer and closer together until you’re kissing around the last bites of her sweet [reaha.milkNoun]-flavored ice cream. Reaha makes a little mooing sound as your lips brush hers, and you soon find that she’s more than willing to let you make up for the trick with a little well-timed tongue play, easily melting into your arms as your accidental kiss turns into a full-on makeout session in the ice cream parlor. ");
	
	output("\n\n" + icedTeatsAlienName() + " has to cough to get your attention, saying, <i>“Um, can you, uh, maybe not do that here? Sorry!”</i>");
	
	output("\n\nYou and Reaha both laugh and quickly excuse yourselves back to your ship.");

	processTime(10);

	addNextButton(mainGameMenu);
}

public function tryProcDommyReahaTime(tMinutes:Number):Boolean
{
	if (reahaIsCured()) return false; // Reaha cured.
	if (!reahaIsCrew()) return false;
	if (!InShipInterior()) return false; // Only care about processTime calls onboard the ship
	if (!reahaFree()) return false; // Free only
	if (!pc.hasCock()) return false; // No cock? Fuck off.
	
	// Init flag.
	if (flags["REAHA_LAST_DOMMY_FUCK"] == undefined) flags["REAHA_LAST_DOMMY_FUCK"] = days - 2;
	if (days - flags["REAHA_LAST_DOMMY_FUCK"] <= 0) return false; // Once per day at most.
	
	// 5% chance per hour on ship? -> 0.84% per minute
	var tChance:Number = (tMinutes / 60.0) * 5;
	
	// Vary chances by addiction level
	if (reahaAddiction() >= REAHA_ADDICTION_HIGH) tChance = Math.round(tChance * 1.50);
	else if (reahaAddiction() >= REAHA_ADDICTION_MED) tChance = tChance;
	else if (reahaAddiction() >= REAHA_ADDICTION_LOW) tChance = Math.round(tChance * 0.50);
	else tChance = Math.round(tChance * 0.25);
	
	// Cap to 33% per "event"?
	if (tChance > 33) tChance = 33;
	
	if (rand(100) < tChance)
	{
		flags["REAHA_LAST_DOMMY_FUCK"] = days;
		return true;
	}
	return false;
}

public function reahaDommyFuxTime():void
{
	clearOutput();
	reahaHeader();

	output("With a yawn, you set down your data slate and get up to stretch, mind wandering toward");
	if (hours < 9) output(" breakfast");
	else if (hours < 15) output(" lunch");
	else output(" dinner");
	output(". That sounds like a plan. You slip out of your cabin, making your way down towards what passes for your galley. The food replicator chirps to life as you approach, asking what you’d like to drink. As you flip through the (admittedly basic) menu, you hear a pair of bare feet padding up behind you. Looking over your shoulder, you see the familiar, curvaceous form of Reaha sidling up behind you, tits pressing into your back as she looks at what’s on screen. ");
	
	output("\n\n<i>“Oh, getting thirsty, [pc.name]? How about a little milk instead -- fresh from the tap!”</i>");
	
	output("\n\nAs she says it, Reaha presses herself closer to you, letting you feel just how FULL her tits are, <i>way</i> bigger and jigglier than normal, like a pair of dumbbells on your back. You groan under the sudden weight -- seeing you quaver, Reaha gives you a little push, just enough to have you flop onto the deck, twisting around so your back’s against the replicator. ");
	
	output("\n\n<i>“You don’t need this futzy old thing,”</i> she teases, flipping the humming device off with a flick of her fluffy tail. <i>“After all, what did you buy me for?”</i> ");
	
	output("\n\nGiggling, the cow-girl slips down over you, straddling your [pc.hips] and flipping her strawberry hair back, hands running between her small horns and through her long locks. As she does so, she gives her shoulders a little wiggle, which translates into her massive mammaries swinging like pendulums over you, drawing dangerously close to your mouth.");
	
	output("\n\n<i>“Open wide, "+ pc.mf("master","mistress") + "!”</i> Reaha teases, pushing your head back against the bulkhead in expectation of her encroaching teat.");

	clearMenu();
	addButton(0, "Fuck Off", reahaDommyFuxTimeFuckOff);
	addButton(1, "Wait...", reahaDommyFuxTimeWait);
}

public function reahaDommyFuxTimeFuckOff():void
{
	clearOutput();
	reahaHeader();

	output("<i>“The fuck are you doing!?”</i> you finally manage to say, swatting Reaha’s hand off. <i>“Bad cow!”</i>");
	
	output("\n\n<i>“B-but-”</i>");
	
	output("\n\n<i>“OFF! NOW!”</i> you command, glowering at the lusty bovine as she scrambles off you, meekly hustling away. ");
	
	output("\n\nWell then. You brush yourself off and flip the replicator back on. You’ll have to <i>“punish”</i> Reaha for getting so uppity later. In the meantime, though, what’s on tap...");

	addNextButton(mainGameMenu);
}

public function reahaDommyFuxTimeWait():void
{
	clearOutput();
	reahaHeader();

	output("Your jaw slackens at the sight of the monstrously large cow-tit jiggling so close to your face. Grinning giddily, Reaha forges ahead, pushing the pink tip of her teat straight into your mouth. The tip of your tongue traces across one of her prominent nipples as it encroaches in, making the cow-girl shudder as you take her swollen, needy nipple. Instinctively, your hands wrap around Reaha’s bum, holding the giggling cow steady as she just about crushes you under the sheer weight of milky boobflesh.");
	if (reahaAddiction() > REAHA_ADDICTION_MED) output(" You aren’t surprised to feel an aphrodisiac patch on her hiney, but... <i>ten</i>!?");
	else if (reahaAddiction() > REAHA_ADDICTION_LOW) output(" You aren’t surprised to feel an aphrodisiac patch on her hiney, but... <i>ten</i>!? Looks like Reaha’s having a serious regression.");
	else if (reahaAddiction() > 0) output(" You only feel a few patches on her hind-end, but more than there should be. Somebody’s regressing....");
	
	output("\n\nReaha shudders and groans as your fingers brush her patch-coated flesh, tits quivering over your face. <i>“Mmm, careful, captain... you might make me squirt!”</i> ");
	
	output("\n\nYou hesitate a moment, not sure how to proceed until Reaha whispers huskily, surprisingly assertively, <i>“Make me squirt!”</i> ");
	
	output("\n\n");
	if (reahaAddiction() < REAHA_ADDICTION_HIGH) output("Chewing Reaha out for her excess will have to wait. For now, though... ");
	output("You dig your fingers into that delicious cow ass, tongue swirling around the thick, engorged nipple in your mouth. You’re immediately rewarded with a thick, sticky dampness in your groin as the cow’s cunt contracts and spasms, looking for a dick to milk as it instinctively starts to drool its obscene juices across your lap; her tits join in a moment later, the pleasure spreading through her body so powerfully that her tits start lactating before you can really suckle them, a thin trickle of [reaha.milkNoun] squirting into your waiting mouth and across the deck.");
	
	output("\n\n<i>“More... give me more!”</i> the cow moans, rocking in your grip, grinding her slick pussy across your");
	if (!pc.isNude()) output(" [pc.gear]");
	else
	{
		output(" bare flesh, smearing her slime across the steadily-hardening shaft");
		if (pc.cocks.length > 1) output("s");
		output(" of your [pc.cocks]");
	}
	output(". You oblige, squeezing her ample asscheeks until the supple flesh seems to be pouring through your fingers, hands sinking into the cow’s cushiony backside, which only serves to increase the flow of [reaha.milkNoun] and cunny-drool escaping the lusty bovine. You lean back against the deactivated replicator, content to alternatively massage Reaha’s patch-coated ass and swallow the growing stream of [reaha.milkNoun] pouring into your mouth from her overactive tit, helping it along with a gentle suckle here, a tender nibble there. ");
	
	output("\n\nYour cow’s back arches as she grinds against you, harder and faster with every passing moment until she’s moaning and cumming just from that little stimulation. She barely holds back a scream as her pussy squirts and tits gush their [reaha.milkNoun] load, drenching you with her sexual fluids as she continues to ride your prone form, powerful hips pounding you into the deck until it almost hurts. ");
	
	output("\n\nWhen her orgasm subsides, she’s left panting, gasping for breath, resting her head against yours. You’re both already smeared in a combination of sticky, musky cunt-juice and [reaha.milkNoun], surrounded by a thick aroma of sex and sweet cream. Yet you know Reaha’s never satisfied with just one... ");
	
	output("\n\n<i>“I want you,”</i> she moans, sodden box rubbing against your [pc.cocks]. She plants a kiss on your lips, long and passionate, arms wrapping around your neck to hold you tight. <i>“Please.”</i>");
	
	output("\n\nYou return the kiss, hand moving around her wide hip to the soaked patch between her legs, easily parting the folds of her excited sex. She stifles a moan into your mouth as your hand slips into her, vanishing into the hot, quivering depths of her vag. Reaha returns your advance with equal ardor, leaning back until she’s taking your whole forearm like a great big cock. Her hips start to move, grinding down your arm until it’s half-buried inside her cavernous, bovine cunt, then off again until your thumb’s brushing the over-sensitive bud of her clit; you can tell she nearly cums on the spot at that touch, and her juices start running freely again, trickling down your arm to splatter on your [pc.groin].");
	
	output("\n\nAs she moves, you decide to tend to yourself. The sight of your lusty cow-girl going crazy with her ardor overtop you is too much to hold back on, and your [pc.cocks]");
	if (pc.cocks.length == 1) output(" is");
	else output(" are");
	if (!pc.isNude()) output(" straining against your armor, painfully in need of room to breathe");
	else output(" flopping wildly beneath Reaha’s prodigious bottom");
	output(". With the hand not currently buried deep in cow-pussy, you fish out [pc.oneCock] and give it a much-needed rub-down, slathering it up with the bountiful supply of cow-juice and [reaha.milkNoun] on tap, using Reaha’s own fluids as an impromptu lube. That done, all you need to do is angle your tool upwards into the bouncing mass of cow-butt riding your arm, and it’s soon swallowed up into the expansive mounds of Reaha’s buttcrack, squeezed together as tight as a virgin’s pussy in the throes of her ecstasy.");
	
	reaha.cuntChange(0, pc.biggestCockVolume(), false, false, false);
	pc.cockChange();
	
	output("\n\nReaha gives a gasp of surprise as she feels your warm, wet schlong slip into her crack, grinding up against her ass; that gasp turns into a lascivious grin as she starts to move her hips faster, fist-fucking herself deeper onto your arm until you can feel your knuckles brushing up against the lips of her cervix. That first touch sets her off again, and with an uncontainable scream, Reaha cums again, flooding you a second time with [reaha.milkNoun] and fem-cum. You nearly drown in the sudden rush of her sweet cream, even as your arm is soaked and your [pc.cock] is caught in the vice-like grip of her quaking, bouncing ass as she rides you through her orgasm. ");
	
	output("\n\nEven that’s not enough to satisfy the blissed-out cow, so high on her patches that she can’t even bring herself to pause after cumming, just pulling your drenched fist out of her slit and grabbing the real prize: your [pc.cock]. ");
	
	output("\n\n<i>“I </i>need<i> you,”</i> she whimpers, pumping your shaft as she shifts forward, angling her pussy to hang over your crown, ready to drop down on your rod. You answer her by switching to the other teat, tapping a fresh source of sweet [reaha.milkNoun] even as your hands, still slathered with her cum, pull her down onto your cock. Reaha gives a delighted squeal as your cock plunges into her wide, ready hole, spearing her to the hilt in one easy motion. A second passes, both your bodies frozen in bliss as you revel in the sensation of penetration, feeling the cow’s vaginal muscles react to your sudden intrusion, squirming and squeezing along every inch of your [pc.cock]. The moment passes as you find Reaha’s arms wrapping around your neck, squeezing your head into her prodigious bust as she starts to move her hips, riding the [pc.cock] buried deep inside her. ");
	
	output("\n\nShe moans loudly, voice breaking into a bovine moo as her over-sensitive body quakes with pleasure, her flesh jiggling obscenely with her every " + (silly ? "<i>moo</i>-" : "mo") + "vement as she crests up, and falls back on your rod. Your fingers play up across her tender skin, teasing the base of her tail or the insides of her sodden thighs until she’s bucking and crying out, cumming already! Your breath catches in your throat as her cunny clamps down hard on your [pc.cock], her juices spurting out around the deep-buried member as she rides out her second orgasm, [reaha.hips] only moving faster as her cries of pleasure reach a crescendo. You hold the quivering cow tight as she cums, drenching your [pc.groin] in a sudden flood of juicy excitement. ");
	
	output("\n\nPanting, chest heaving against your face, Reaha only has a few moments to recover before a whine of need escapes her lips as the lust-drug surging through her body reasserts itself. Moaning, Reaha starts shifting her hips, but only slowly, as though she’s too exhausted from her orgasmic exertions to continue fucking you. You grin up at the tuckered-out, needy cow, and gently lower her onto her back, spreading her thick thighs around your [pc.hips]. Reaha moos, biting her lip with anticipation, arms locked around her massive milkers as you adjust yourself onto your [pc.knees], spreading the cow nice and wide before you finally give it to her. Now it’s your turn!");
	
	output("\n\nSo soon after cumming, Reaha’s snatch is a sodden box completely open to your cock, still thick with her own natural lube. You skip the slow stuff and start hammering your hips into the still-recovering cow-girl and immediately tear a cry of pleasure from her trembling lips as you pound your [pc.cock] into her [reaha.cunt]. ");
	
	output("\n\n<i>“Aaaah! Not so rough!”</i> Reaha cries, clutching at her tits as you hammer her squirting, wet cunt. You don’t buy her pleas for a moment, though: Reaha likes it just as hard as you can manage. Between deep thrusts, you reach up and pull the cow’s hands away from her teats, letting you back at those sweet, succulent mounds of boobflesh. [reaha.MilkNoun] drools out around your groping digits, slathering them in her sweet lactic bounty until you draw them back, and up to her mouth. Between lewd gasps and mooing moans, Reaha obediently parts her lips and accepts your [reaha.milkNoun]-coated digits, suckling them as gently as if they were her own heavy-laden nipples. You shudder at the feeling of her big, bovine tongue slurping and lapping on your fingers, cleaning you until you’re sure you’re sparkling. Even then, you leave yourself lodged in Reaha’s mouth, giving her something to busy her mouth on as you fuck her pussy raw. ");
	
	output("\n\nSpurred on by her over-sensitizing lust-drugs, Reaha’s soon cumming again, slathering your [pc.cock] in even more of her seemingly limitless juices. This time, though, you’re close enough to cum with her, feeling that familiar tightness in your [pc.balls] moments before you lose control. You grab the cow-girl’s flanks for support and let loose, jackhammering her quim as hard as you possibly can until a wave of release hits you, and your [pc.cumNoun] floods into Reaha’s cooch. She gives a delighted squeal as you unload into her, biting her lip to stifle her cries of pleasure. You keep thrusting all through it, fucking your seed deep into the cow-slut. She takes it eagerly, wrapping her legs around your hips and drawing you in. ");
	
	output("\n\nWhen you finally finish, you find yourself with your [pc.cock] buried");
	if (pc.biggestCockVolume() <= reaha.vaginalCapacity()) output(" to the hilt");
	else output(" deep");
	output(" in the cow, still throbbing and leaking the last trickles of your orgasm into her sodden box. Her thighs are a mess of fem-cum and your own spooge, mixing into a musky, murky lake that’s formed under her upturned ass. With an exhausted gasp, you let your head sink in between Reaha’s pillowy tits, resting in the valley of her cleavage. ");
	
	output("\n\nYou look up to Reaha, but find the busty bovine’s eyes closed, her mouth ever so slightly agape. She’s snoring softly, her pussy twitching gently around your still-buried member, unconsciously responding to your presence. You slowly pull out of her, admiring your handiwork as a little of your seed trickles out of her well-fucked pussy, before gathering up your [pc.gear] and staggering off, thirst quenched.");

	processTime(30);

	reaha.loadInCunt(pc, 0);
	reaha.orgasm();
	pc.orgasm();
	pc.milkInMouth(chars["REAHA"]);
	pc.milkInMouth(chars["REAHA"]);
	IncrementFlag("SEXED_REAHA");

	addNextButton(mainGameMenu);
}

public function reahaMilkTalk():void
{
	clearOutput();
	reahaHeader();

	output("<i>“So... you mentioned being alright with changing what you lactate,”</i> you say, eyeing the");
	if (9999 == 0) output(" topless");
	output(" cow’s buxom chest, a tiny bead of [reaha.milk] cresting the peaks of her swollen teats. It’s hard not to lick your lips at the thought of the sweet taste. ");
	
	output("\n\nReaha shifts her weight a bit, avoiding your eyes.");
	if (!reahaFree()) output(" <i>“I guess. If that’s what your want, [pc.master]”</i>");
	else
	{
		output(" <i>“Yeah, if you want.");
		if (flags["REAHA_MILK_CHANGED"] != undefined) output(" I’ve already changed it anyway, after all.");
		output(" I got myself into this mess by gene-modding, trying to be the best cow-girl I could be, but... if you’re paying for it, I guess I don’t mind.”</i>");
	}

	output("\n\nGood. Now, what to do about Reaha’s milk...");

	processTime(2);
	
	clearMenu();

	// [Give Honeydew] [Give ChocoLac]
	if (pc.hasItemByClass(Honeydew))
	{
		if (reaha.milkType != GLOBAL.FLUID_TYPE_HONEY) addButton(0, "Honeydew", reahaMilkTalkHoneydew, undefined, "Give Honeydew", "Give Reaha some Honeydew.");
		else addDisabledButton(0, "Honeydew", "Give Honeydew", "Reaha is already producing honey-milk!");
	}
	else addDisabledButton(0, "Honeydew", "Give Honeydew", "You could probably give Reaha some Honeydew if you had any to hand.");

	if (pc.hasItemByClass(Chocolac))
	{
		if (reaha.milkType != GLOBAL.FLUID_TYPE_CHOCOLATE_MILK) addButton(1, "Chocolac", reahaMilkTalkChocolac, undefined, "Give Chocolac", "Give Reaha some Chocolac.");
		else addDisabledButton(0, "Chocolac", "ChocoLac", "Reaha is already producing chocolate-milk!");
	}
	else addDisabledButton(1, "Chocolac", "Give Chocolac", "You could probably give Reaha some Chocolac if you had any to hand.");

	addButton(14, "Back", showReahaTalkMenu);
}

public function reahaMilkTalkHoneydew():void
{
	clearOutput();
	reahaHeader();

	if (flags["REAHA_MILK_CHANGED"] == undefined) flags["REAHA_MILK_CHANGED"] = 0;
	flags["REAHA_MILK_CHANGED"]++;

	reaha.milkType = GLOBAL.FLUID_TYPE_HONEY;

	pc.destroyItemByClass(Honeydew);

	output("You take a golden yellow vial of Honeydew out of your pack and show it to the busty cow. She takes it, looking over the label. <i>“Honey? Isn’t that a little thick for boobs? Well... it’s Xenogen, so I guess it must be safe. I guess you’ll be wanting something sweet for your tea, huh? Alright, let’s see...”</i>");
	
	output("\n\nWith practiced skill, Reaha twists the top of the jar off and dumps the viscous yellow goop out right onto the top of one of her tips. She shudders at the sudden chill, but quickly starts to spread the thick gel across her breasts, rubbing it into the soft skin with slow, circular motions until both her tits are colored yellow, completely coated. ");
	
	output("\n\nSuddenly, Reaha winces as the first pleasurable pangs of change wash over her. <i>“I feel it... welling up inside me...”</i> she groans, cupping her enormous breasts, almost defensively. Her knees buckle, and she gives a startled <i>“Moo!”</i> as she topples back onto the bed, her whole body jiggling from the impact. ");
	
	output("\n\n<i>“Ahhh! It’s coming!”</i> Reaha moans, fingers rushing to her pert teats and starting to squeeze. <i>“D-do you want the first sip,");
	if (!reahaFree()) output(" [pc.master]");
	else output(" [pc.name]");
	output("?”</i>");
	
	output("\n\nYou wouldn’t miss it. You grab one of the cow-girl’s tits, bringing the [reaha.nipple] up to your lips just in time to catch the first beads of her new honey-milk. A thick, creamy drop rolls out of her engorged teat and onto the tip of your tongue. You almost wince at the sheer, overwhelming sweetness of it -- it’s nearly too much to bear. Still, you latch yourself onto Reaha’s breast as the full force of her mutated lactation comes on, following that first trickle with a steady stream of honey into your waiting mouth. Thankfully, the thickness of her honey-milk keeps the volume from overwhelming you, but you still struggle to swallow all of it as you suckle -- Reaha certainly produces quite a bit in those milkers of hers! And they seem <i>bigger</i> now, swollen with her suddenly much thicker lactic bounty. ");
	
	output("\n\nYou wouldn’t have even noticed Reaha’s orgasm if it wasn’t for the low, bovine moo she lets out and the suddenly more forceful rush of honey into your mouth -- you struggle to swallow it all down, and even then, find some spewing down your chin, backing up until you look like you’re drooling it. With a pleasured gasp, Reaha collapses back onto her bed, her tit popping out of your mouth with a wet squelch. ");
	
	output("\n\n<i>“Moo,”</i> she moans quietly. One glance at the blissed-out look on the cow-girl’s face tells you that she’s out of commission for a little while. Wiping a bit of honey from your cheeks");
	if (pc.beardLength > 0) output(", which is no easy task thanks to your [pc.beard] getting stuck with it");
	output(", you leave Reaha to get used to her new lactation.");
	
	pc.milkInMouth(chars["REAHA"]);
	processTime(15);
	addNextButton(mainGameMenu);
}

public function reahaMilkTalkChocolac():void
{
	clearOutput();
	reahaHeader();

	if (flags["REAHA_MILK_CHANGED"] == undefined) flags["REAHA_MILK_CHANGED"] = 0;
	flags["REAHA_MILK_CHANGED"]++;

	reaha.milkType = GLOBAL.FLUID_TYPE_CHOCOLATE_MILK;

	pc.destroyItemByClass(Chocolac);

	output("You take the white-and-brown vial of ChocoLac from your pack and hand it to the busty cow. She takes it, looking over the label. <i>“Oooh! Chocolate milk! I guess it doesn’t hurt to save a step and get it straight from the tap, does it? Alright, let’s see...”</i>");
	
	output("\n\nWith practiced skill, Reaha twists the top of the bottle off and scoops out the ice-cream-like nanomachine cream, rubbing it between her hands before slathering it onto her tits. She shivers at the sudden, cold touch on her sensitive tits, but dutifully fights through it, spreading the rich, thick cream across her teats until they’re well and truly slathered with it, covering every inch of supple boobflesh. ");
	
	output("\n\nSuddenly, Reaha winces as the first pleasurable pangs of change wash over her. <i>“I feel it... welling up inside me...”</i> she groans, cupping her enormous breasts, almost defensively. Her knees buckle, and she gives a startled <i>“Moo!”</i> as she topples back onto the bed, her whole body jiggling from the impact. ");
	
	output("\n\n<i>“Ahhh! It’s coming!”</i> Reaha moans, fingers rushing to her pert teats and starting to squeeze. <i>“D-do you want the first sip,");
	if (!reahaFree()) output(" [pc.master]");
	else output(" [pc.name]");
	output("?”</i>");
	
	output("\n\nYou wouldn’t miss it. You grab one of the cow-girl’s tits, bringing the [reaha.nipple] up to your lips just in time to catch the first spurt of creamy chocolate that spurts from her nipples, straight into your waiting gob. Thick, sweet, and oh-so-rich. Delicious! You wrap your lips around one of her swollen milkers, latching onto the tit as her nanomachine-induced lactation kicks into overdrive. Your mouth is quickly flooded by a surge of sweet chocolate milk, flowing just as fast as you can swallow, keeping your cheeks bloated with the sheer volume of her rich, boobalicious bounty. Even her breasts seem to be getting larger, swelling to accommodate the overactive glands inside them, spurred on by the treatment she’s rubbed into herself.");
	if (silly) output(" Maybe she shouldn’t have used the whole jar?");
	
	output("\n\nYou wouldn’t have even noticed Reaha’s orgasm if it wasn’t for the low, bovine moo she lets out and the suddenly more forceful rush of chocolate milk into your mouth -- you struggle to swallow it all down, and even then, find some spilling down your chin, backing up until you look like you’re drooling it. With a pleasured gasp, Reaha collapses back onto her bed, her tit popping out of your mouth with a wet squelch. ");
	
	output("\n\n<i>“Moo,”</i> she moans quietly. One glance at the blissed-out look on the cow-girl’s face tells you that she’s out of commission for a little while. You flick a bit of chocolate milk from your chin, wiping the rest off on your");
	if (!pc.isNude()) output(" sleeve");
	else output(" arm");
	output(", looking down at the spreading puddle of it on the floor. Delightful. Giving Reaha a pat on the tit, you leave her to get used to her new lactation.");
	
	pc.milkInMouth(chars["REAHA"]);
	processTime(20);
	addNextButton(mainGameMenu);
}

public function reahaBootOffShip():void
{
	clearOutput();
	reahaHeader();
	
	output("<i>“Hey, Reaha,”</i> you say, stepping over towards your bovine slave,");
	if (pc.isNice()) output(" <i>“Look, I need to make room on the ship. Need to leave you here for a while, alright?”</i>");
	else if (pc.isMischievous())
	{
		output(" <i>“Guess what?”</i>");
		output("\n\n<i>“What?”</i> she says, blinking at you.");
		output("\n\n<i>“You’re off the crew! Get out!”</i>");
	}
	else output(" <i>“Pack your bags. You’re not staying here.”</i>");
	
	if (shipLocation == "500")
	{
		output("\n\nReaha stares at you for a second, her big blue eyes growing wide. <i>“Wh-what...”</i> she mumbles. <i>“You can’t leave me here! I don’t belong here, they’ll make me take the Treatment or... or my mother will find me! Pleasepleaseplease don’t leave me, I’ll be a good cow I promise.”</i>");
		
		output("\n\nReaha’s sudden and uncharacteristic passion takes you off guard. She clearly doesn’t want to stay on New Texas...");

		processTime(5);

		//[Nevermind] [Go to Tavros] [New Texas]
		clearMenu();
		addButton(0, "Never Mind", reahaBootOffShipNevermind);
		if (pc.credits >= 50) addButton(1, "Go2Tavros", reahaBootOffShipGo2Tavros, undefined, "Go to Tavros", ("Tell Reaha to go to Tavros Station. " + (!reahaCanGoToNursery() ? "She’ll probably go hang out at Beth’s again, knowing her." : "Since the Nursery’s opened up, you can probably send her there...") + "\n\nCosts 50 Credits."));
		else addDisabledButton(1, "Go2Tavros", "Go to Tavros", "You’d need to afford for Reaha’s transport to Tavros....\n\nCosts 50 Credits.");
		if (9999 == 0) addButton(2, "New Texas", reahaBootOffShipNewTexas, undefined, "Stay on New Texas", "Tell Reaha she’s stuck here on New Texas, damned be the consequences.");
	}
	else
	{
		output("\n\nReaha’s expectant smile fades, but she nods with understanding. <i>“Alright, if that’s what you want. I’ll");
		if (shipLocation == "TAVROS HANGAR") output(" wait for you here on Tavros");
		else output(" catch a cab to Tavros and wait for you");
		output(". Is that okay?”</i>");
		
		output("\n\nYou nod. Sounds perfect. She quickly and silently gathers her scant possessions -- not much more than a Magic Milker and some sex toys");
		if (reahaAddicted()) output(", plus her boxes of pleasure patches");
		output(". She gets out of the ship");
		if (shipLocation != "TAVROS HANGAR") output(" as soon as the taxi arrives");
		else output(" and down onto the garage floor");
		output(", stopping just long enough to say goodbye before she goes.");
		
		output("\n\n(<b>Reaha is no longer on your crew. You can find her again in Tavros Station.</b>)");
		
		processTime(15);
		flags["REAHA_IS_CREW"] = (!reahaCanGoToNursery() ? 2 : 4);
		
		addNextButton(mainGameMenu);
	}
}

public function reahaBootOffShipNevermind():void
{
	clearOutput();
	reahaHeader();

	output("<i>“Never mind, then,”</i> you shrug. <i>“You can stay, for now.”</i>");
	
	output("\n\nReaha sighs with relief and hops up into your arms. <i>“Thankyouthankyou thankyou,”</i> she babbles, squeezing you tight. You almost think she’s on the verge of tears when she says, <i>“I don’t want to leave...”</i> ");
	
	output("\n\nYou pat the distressed cow on the head until she calms down enough to stop hugging you");
	if (pc.isNice()) output(", apologizing for the stress");
	output(". Once she’s calmed, you send Reaha back to her quarters. You suppose you’ll have to clear out your vessel some other way.");

	processTime(5);
	addNextButton(mainGameMenu);
}

public function reahaBootOffShipGo2Tavros():void
{
	clearOutput();
	reahaHeader();

	pc.credits -= 50;

	flags["REAHA_IS_CREW"] = (!reahaCanGoToNursery() ? 2 : 4);

	output("<i>“Alright, alright, I’ll get you a taxi to Tavros,”</i> you say, patting Reaha on the head. <i>“You don’t have to stay on New Texas.”</i>");
	
	output("\n\nReaha gives a sigh of relief, her shoulders slumping heavily. <i>“Thanks... I’d rather stay with you, but anywhere’s better than New Texas.”</i> ");
	
	output("\n\nYou nod your understanding, and pull out your Codex, starting to make the arrangements while Reaha backs up her scant belongings -- not much more than a Magic Milker and some sex toys");
	if (reahaAddicted()) output(", plus her boxes of pleasure patches");
	output(". It isn’t long before you’re able to find a taxi service for her, and send her on her way to Tavros. ");
	
	output("\n\n<i>“I’ll see you soon, I guess,");
	if (reahaFree()) output(" [pc.name]");
	else output(" [pc.master]");
	output(",”</i> Reaha says as she’s getting aboard the taxi");
	if (reahaConfidence() > REAHA_CONFIDENCE_HIGH) output(", stopping just long enough to give you a hug before she goes");
	output(".");
	
	output("\n\n(<b>Reaha is no longer on your crew. You can find her again in Tavros Station.</b>)");

	processTime(15);
	addNextButton(mainGameMenu);
}

public function reahaBootOffShipNewTexas():void
{
	clearOutput();
	reahaHeader();

	flags["REAHA_IS_CREW"] = 3;

	output("<i>“Knock it off, Reaha, you’re staying,”</i> you insist. You can all but see her heart fall, and she lets out a pathetic whimper as you send her to collect her things. You tell her she’ll be fine -- this is her homeworld, after all. Nothing seems to cheer her up, though, and she looks on the verge of tears by the time you send her down the gangplank into the landing barn. ");
	
	output("\n\n<i>“I... I guess I’ll see you again. Probably all stupid and Treated,”</i> Reaha says, avoiding your eyes as she descends. <i>“Bye...”</i>");
	
	output("\n\n(<b>Reaha is no longer on your crew. You can find her again on New Texas.</b>)");
	
	processTime(15);
	addNextButton(mainGameMenu);
}

public function reahaBackAtBeths():void
{
	clearOutput();
	reahaHeader();

	output("<i>“Reaha, what’re you doing here?”</i> you ask, indicating the dark, smoky interior of Beth’s whorehouse. ");
	
	output("\n\n");
	if (reahaConfidence() < REAHA_CONFIDENCE_LOW) output(" The cow-girl fidgets nervously, avoiding your gaze. <i>“Everyone kept looking at me funny everywhere else. Probably because I’m naked and all. Besides, they can’t do anything to me here, right?”</i>");
	else output(" Reaha shrugs lightly. <i>“I got tired of everybody staring at me. And groping. And asking for milk. I’ve been drained dry every day since I came back. It’s like they’ve never seen a cowgirl around here before...");

	processTime(5);

	//[Rejoin Crew] [Leave]
	clearMenu();
	addButton(0, "Rejoin Crew", reahaBackAtBethsRejoin);
	addButton(14, "Leave", mainGameMenu);
}

public function reahaBackAtBethsRejoin():void
{
	clearOutput();
	reahaHeader();

	flags["REAHA_IS_CREW"] = 1;
	output("You roll your eyes and take a seat beside the cow-girl. <i>“Ready to get on out of here?”</i>");
	
	output("\n\n<i>“You mean, back aboard your ship?”</i> she asks, clearly hopeful. You nod, and Reaha immediately hops into your arms, hugging you tight. <i>“Yay! I-I mean, uh, yes master. Ready whenever you want me back...”</i>");
	
	output("\n\nWith a chuckle, you ruffle Reaha’s strawberry hair and tell her to pack her bags. She grabs her one, small satchel from under her seat and says she’ll meet you back aboard ship. You send her off with a playful swat on the rear, making her anchor tattoo jiggle obscenely as she scampers off. ");
	
	output("\n\n(<b>Reaha has rejoined your crew!</b>)");
	
	processTime(15);

	addNextButton(mainGameMenu);
}

