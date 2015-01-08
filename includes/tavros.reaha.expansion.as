const REAHA_CONFIDENCE_LOW:int = 15;
const REAHA_CONFIDENCE_MID:int = 40;
const REAHA_CONFIDENCE_HIGH:int = 65;
function reahaConfidence(conf:int = 0):int
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

const REAHA_ADDICTION_LOW:int = 15;
const REAHA_ADDICTION_MED:int = 40;
const REAHA_ADDICTION_HIGH:int = 65;
const REAHA_ADDICTION_MAX:int = 100;
function reahaAddiction(addict:int = 0):int
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

function reahaAddicted():Boolean
{
	if (flags["REAHA_ADDICTION_CURED"] == undefined) return true;
	return false;
}

function reahaHeader():void
{
	showName("\nREAHA");
	author("Savin");
	showBust("REAHA");
}

function reahaMoosAboutNewTexas():Boolean
{
	if (flags["REAHA_DONE_NEWTEXAS_SPIEL"] == undefined)
	{
		flags["REAHA_DONE_NEWTEXAS_SPIEL"] = 1;

		clearOutput();

		showName("\nREAHA");
		author("Savin");
		showBust("REAHA");

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

function talkWithFollowerReaha():void
{
	if (flags["REAHA_DONE_NEWTEXAS_FOLLOWUP"] == undefined) reahaFirstTalk();
	else reahaRegularTalk();
}

function reahaFirstTalk():void
{
	clearOutput();
	showName("\nREAHA");
	showBust("REAHA");
	author("Savin");

	flags["REAHA_DONE_NEWTEXAS_FOLLOWUP"] = 1;

	output("\n\n<i>“I get the feeling you’ve been to New Texas before,”</i> you say to her, by way of opening the topic");
	if (9999 == 0) output(", your eyes drawn to her bare, bovine body. She looks, and even acts, like the Treated cows you’ve seen on the surface");
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
	else if (pc.isMischievious()) output(" <i>“What, did you and your parents not get along?”</i>");
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
	if (!reahaFree()) output(" <i>“She immediately regrets her outburst, covering her mouth with a murmured <i>“Sorry, [pc.master].”</i> With a sigh, she continues, more softly now:");
	output(" <i>“I didn’t want the Treatment. I didn’t want to end up a brainless bimbo like my mom, sucking every dick that walked past her. Which I guess is kind of ironic in hindsight, huh? But I... I didn’t want to be this way,");
	if (reahaFree()) output(" [pc.name]");
	else output(" [pc.master]");
	output(". Those bastards at the brothel tricked me, got me addicted to these stupid patches so bad I can barely even think half the time. I might as well have just fucking got Treated, for all the good running away did me.”</i>");
	
	if (pc.isNice()) output("\n\n<i>“Hesitantly, you reach over and plant a reassuring hand on the cow’s bare shoulder. Reaha sighs, letting out a long, chesty breath before looking up and giving you a faint little smile. <i>“I’m sorry,”</i> you tell her, not really knowing what else you can say.");
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

function reahaRegularTalk():void
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

function showReahaTalkMenu(func:Function = null):void
{
	clearMenu();

	if (func != reahaTalkTreatment) addButton(0, "Treatment", reahaTalkTreatment, undefined, "The Treatment", "Ask Reaha about the Treatment that's so popular on her homeworld.");
	else addDisabledButton(0, "Treatment");

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

	if (func != reahaTalkHerLife) addButton(4, "Her Life", reahaTalkHerLife, undefined, "Her Life", "Ask Reaha to tell you a little bit about her life before she became a slave");
	else addDisabledButton(4, "Her Life");
}

function reahaTalkTreatment():void
{
	clearOutput();
	reahaHeader();

	output("<i>“Think you could tell me more about the Treatment?”</i> you ask.");

	if (pc.isTreated())
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
	
	output("\n\n<i>“Nobody does,”</i> Reaha says. <i>“Except the scientists who make it, anyway. Maybe Big T., too. Probably. I don’t know, they keep everything about the Treatment a secret. I could be some horrible alien virus for all I know. What’s important is what it does.”</i>");
	
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

function reahaTalkTreatmentBitterness():void
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

function reahaTalkTreatmentComfort():void
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
	if (reahaFree()) output(" The government -- my own FAMILY -- tried to turn me into a brainless cumslut just because I had the luck to be born with a pair of tits. They’re all complicit, every single one of them, for making slaves out of women, and for what? The U.G.C. lets them get away with it because it’s tradition!");
	else output(" This whole place, it’s some sick bastard’s sex garden, and we’re supposed to lie down -- preferably on our backs -- and just accept it? No. That’s why I ran away, [pc.master]. And why I never wanted to come back.”</i>");
	
	output("\n\nReaha takes a deep breath, looks at you with her big blue eyes, and steps up with her arms wide open. You take the cow-girl up on her offer, pulling her into a tight hug. Her arms clutch around your back, and the quiver in her voice as she speaks again clues you in to just how close to tears she is: <i>“Just... do whatever you came here to do, and let’s leave. Okay? I don’t want to be here a second longer, [pc.master]. This planet makes me sick!”</i>");

	processTime(5);

	showReahaTalkMenu(reahaTalkTreatment);
}

function reahaTalkNewTexas():void
{
	clearOutput();
	reahaHeader();

	output("<i>“So what do think about New Texas,”</i> you ask. <i>“It’s your homeworld, after all.”</i>");
	
	output("\n\nReaha");
	if (9999 == 0) output(" sighs");
	else output(" sighs wistfully, looking out the tiny window of her cabin in the landing barn outside");
	output(". <i>“Aside from the Treatment and all the bullshit that goes along with it, I guess it’s not that bad. New Texas is pretty, at least, and peaceful. Way different than cramped, noisy Tavros... there’s fields everywhere, wide open for you to run and play in whenever you want, as far as the eye can see. New Texas is an agrarian world, mostly farms and stuff except for a few bigger cities near the equator. I grew up around");
	if (9999 == 0) output(" here");
	else output(" Tee’s ranch");
	output(", so that’s mostly what I know. Mom never took us far from the ranch, seeing as she was one of the big dairy girls. Couldn’t go long without a session in the industrial milker, or her tits would swell up like this,”</i> Reaha says, giggling and making a ballooning motion with her arms over her already-impressive chest. ");
	
	output("\n\nShe grins to herself at that, one of the few genuine smiles you’ve seen from the red-maned cow. <i>“New Texas really is... different than the rest of the galaxy. Maybe it’s because of the Treatment, I don’t know, but it was also so peaceful. The people there were also nice to me -- that is, when they weren’t bending Mom or one of my big sisters over something right in front of me,”</i> she says with a visible shudder that leaves her tits quaking. ");

	processTime(10);

	//{one time choice between:
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

function reahaTalkNewTexasEw():void
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

function reahaTalkNewTexasNatural():void
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

function reahaTalkNewTexasManUp():void
{
	clearOutput();
	reahaHeader();

	if (flags["REAHA_TALK_NEWTEXAS_CHOICE"] == undefined)
	{
		flags["REAHA_TALK_NEWTEXAS_CHOICE"] = 2;
		pc.addHard(5);
		reahaConfidence(-10);
	}

	output("<i>“So you saw some unpleasant shit,”</i> you say, scowling at the whiny cow. <i>“Deal with it. The girl I bought out of a cheapo whorehouse doesn’t have a lot of room to judge.”</i> ");
	
	output("\n\nReaha winces. <i>“I guess. I might as well have grown up in the whorehouse, the way Mom treated us. Sometimes I just... I felt like she was </i>training<i> us to be cum-sucking whores, you know?”</i>");
	
	output("\n\n<i>“I guess she did a good job,”</i> you say, reaching down and swatting the soft little cow on the ass -- just hard enough to make her butt jiggle. ");

	processTime(5);

	addNextButton(reahaTalkNewTexasII);
}

function reahaTalkNewTexasII():void
{
	clearOutput();
	reahaHeader();

	if (flags["REAHA_TALK_NEWTEXAS_II"] == undefined)
	{
		flags["REAHA_TALK_NEWTEXAS_II"] = 1;

		output("<i>“So, how come you never told me you had sisters before?”</i>");
		
		output("\n\nReaha shrugs. <i>“Up till recently, I thought you bought me to");
		if (!reahaFree()) output(" suck dick");
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

function reahaTalkAddiction():void
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
	
	output("\n\n<i>“It was that bitch Carver,”</i> Reaha spits. <i>“When I had to... had to go into debt because of my mods, I check-boxed that I was okay with sex. I mean, hey, I just bought all these great mods, and if it helped me pay off my debt faster, I didn’t mind putting them to use. But then the bitch who owned the brothel bought my contract and put me in a pretty pink room, told me to do whatever every man who came through said. ");
	
	output("\n\n<i>“That’s fucked up, right? I mean, I thought that meant that I wouldn’t mind my master wooing me for some gentle loving or something");
	if (reahaConfidence() >= REAHA_CONFIDENCE_HIGH) output(", or at least somebody who would treat me like you do, [pc.name]");
	output(". I never imagined I’d end up getting forced to work in an actual whorehouse. I coulda stayed on New Texas for that shit.”</i> ");
	
	output("\n\nReaha scowls, crossing her arms under her huge rack. <i>“I tried to lawyer up, but Carver just put me in the special BDSM whipping part of her brothel for a week when I had the audacity to try and fucking stop this shit. I guess I kept being rowdy even after that, even bit a couple people when they got... well, anyway, Carver and her mistresses didn’t put up with that. After that, they started putting these stupid patches on me,”</i> Reaha says, prodding");
	if (reahaAddiction() < REAHA_ADDICTION_MED) output(" the");
	else output(" a");
	output(" patch riding high on her inner thigh, surrounded by reddened, sensitive skin. ");
	
	output("\n\n<i>“A couple of patches and I was a drooling, horny mess begging whoever they sent into the room to fuck me. I’d do </i>anything<i> to get off... just to get a little relief. It was awful at first... until I started getting used to it, but then they’d just put </i>more<i> patches on me, and back on the fuck-Reaha-senseless merry-go-round we went until you found me with my ass covered in the stupid things... and also in the air, chained up in a fuck-room so all I could do was wiggle my butt and beg you for a fuck.”</i>");
	
	output("\n\nShe shivers at the thought. <i>“I’m just glad to be out of there.");
	if (flags["REAHA_ADDICTION_HELP"] == undefined) output(" Even if I’m probably going to be addicted to these stupid patches for the rest of forever.”</i>");
	else
	{
		if (reahaAddiction() > REAHA_ADDICTION_MED) output(" Especially with you helping me, now. I’d probably never have gotten up the willpower to pull the patches off on my own.”</i>");
		else output(" Especially with you. I’m almost free of these stupid patches, thanks to you. I owe you one, [pc.name]. And I mean more than a debt,”</i> she says, pressing herself affectionately close to you.");
	}

	processTime(10);

	// [Cure Addiction] [Sorry] [I Like 'Em]
	clearMenu();
	if (flags["REAHA_TALK_ADDICTION_CURE"] == undefined) addButton(0, "Cure", reahaTalkAddictionCure, undefined, "Cure Addiction", "Tell Reaha you'd like to help her out with her problem, if you can.");
	else addButton(0, "Cure", reahaTalkAddictionCure, undefined, "Cure Addiction", "Ask Reaha how she thinks she's doing with her addiction. ");
	addButton(1, "Sorry", reahaTalkAddictionSorry, undefined, "Sorry", "Tell Reaha “too bad” about that whole patch thing.");
	addButton(2, "I Like", reahaTalkAddictionILike, undefined, "I Like Them", "Tell Reaha you like her just the way she is: drooling with lust and covered in patches.");
}

function reahaTalkAddictionSorry():void
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

function reahaTalkAddictionCure():void
{
	clearOutput();
	reahaHeader();

	if (flags["REAHA_TALK_ADDICTION_CURE"] == undefined)
	{
		reahaConfidence(5);
		flags["REAHA_TALK_ADDICTION_CURE"] = 1;

		output("<i>“Is there anything I can do to help?”</i> you ask. ");
		
		output("\n\n <i>“I don’t... I don’t know, [pc.name]. Unless you want to drop me off at at whatever the lust-patch equivalent of an AA meeting is...”</i>");
		
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

function reahaTalkAddictionILike():void
{
	clearOutput();
	reahaHeader();

	reahaConfidence(-5);

	output("<i>“I like ‘em,”</i> you say, poking at a pleasure patch. Her body shivers, and a little trickle of moisture beads out from her big pussy, which you wipe away. ");
	
	output("\n\nShe blushes as your finger nears her crotch. <i>“I... I, uh... you’re not the first person to say that. Most of my johns back at Beth’s like ‘em too. Especially when they could just tease me till I came. But </i>I<i> don’t like them. I ran the fuck away from my homeworld to avoid turning into a cum-hungry whore, but what do I end up as? Ugh. Maybe it was inevitable. Mom always made sure I knew what I was going to be when I grew up...”</i>");

	processTime(4);
	showReahaTalkMenu(reahaTalkAddiction);
}

function reahaTalkGeneMods():void
{
	clearOutput();
	reahaHeader();

	output("<i>“Tell me about these mods of yours,”</i> you ask, looking the busty bovine over from horned head to cute little toe.");
	
	output("\n\nReaha blushes a little as you size her up, and cradles her arms under her bust -- more to heft the milky jugs up for your inspection than to support them.");
	
	output("\n\n<i>“Well, I was born with these horns of mine,”</i> she says after a moment, reaching up to poke one of the little cow-nubs growing from her head. <i>“My family’s been Treated for so long that cow-ness is just part of our DNA, I guess. Everything else is custom designed, though. Especially these,”</i> she says, cupping her chest and giving herself a manual milkshake.");
	
	output("\n\n<i>“It took a lot of work to get my tits the way I wanted them. I was pretty busty on my own, but I didn’t have </i>udders<i> like these, you know? And I really wanted ‘em, so... I bought ‘em. Took a lot of different mods to get my tits just right, and then I had to use a bunch of different ones to get myself lactating a lot. I tried to manually stimulate myself, but all I got was a little trickle after </i>months<i> of work... but a couple doses of Lacta Rush, some Milk Gushers, and some designer mods, and I was lactating like a regular dairy girl back home.”</i>");
	
	output("\n\nShe blushes again as she admits, <i>“Plus I might have bought a few mods for other parts, too. When I got out of the army, I was way too hard looking... I wanted to be a soft little cow, not a big-titted amazon, you know?”</i>");
	
	output("\n\n<i>“And that?”</i> you ask, pointing to the strawberry-tipped tuft at the end of her swishing tail.");
	
	output("\n\n<i>“I dunno. I got talked into it when I got my breast mods. The guy said it would help me keep my balance with all the front weight, but... well, it’s cute at least! I’m just glad I didn’t let him talk me into getting hooves. Yuck!");
	if (pc.hasLegFlag(GLOBAL.HOOVES)) output(" Uh. No offense...");
	output("”</i>");

	processTime(10);

	//[Sounds Expensive] [Why Mods?] [Looks Before Mods?] [Next]
	clearMenu();
	addButton(0, "Expensive", reahaTalkGeneModsExpensive, undefined, "Sounds Expensive", "All those mods must have cost a fortune...");
	addButton(1, "Why Mods?", reahaTalkGeneModsWhy, undefined, "Why Mods?", "Ask Reaha why she felt the need to modify herself.");
	if (flags["REAHA_TALK_GENEMODS_BEFORE"] == undefined) addButton(2, "Before?", reahaTalkGeneModsBefore, undefined, "Looks Before Mods?", "Ask Reaha what she looked like before getting her mods.");
	else addButton(2, "Before?", reahaTalkGeneModsBefore, undefined, "Looks Before Mods?", "You ask Reaha if you can see those pics of her before her modification again.");
}

function reahaTalkGeneModsExpensive():void
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

function reahaTalkGeneModsWhy():void
{
	clearOutput();
	reahaHeader();

	output("<i>“So why did you go in for all those mods, anyway?”</i>");
	
	output("\n\nReaha shrugs, avoiding your eyes. <i>“I dunno... I wanted ‘em, I guess.”</i>");
	
	output("\n\n<i>“Come on, there’s more to it than that,”</i> you say.");
	if (!pc.isNice()) output(" <i>“You don’t go into debt like you did just because.”</i>");
	
	output("\n\n");
	if (reahaAddiction() >= REAHA_ADDICTION_HIGH && reahaConfidence() <= REAHA_CONFIDENCE_LOW) output("Reaha grunts and slaps a fresh pleasure patch onto her butt, hard enough to make herself jiggle. ");
	output("I grew up on New Texas, okay? Imagine being on a planet where everybody’s a big-tittied cow who squirts milk if she thinks too hard. And then you’re just.... not. Guess you could call it self-image issues, but I just didn’t feel </i>pretty<i> without all this,”</i> she says, waving a hand over her bovine body. ");
	
	output("\n\n<i>“Being a big, chesty cow was what I grew up thinking was attractive. So of course I wanted that, too... just without the Treatment to fuck my brain over. I thought I could have the best of both worlds. Fuck me, right?”</i>");
	
	output("\n\nA moment passes before she realizes the irony in full, and sighs. <i>“I guess a lot of people fucked me because of them. That’s not what I wanted, you know? I grew up so completely disgusted with my mother, my sisters... and then what’s the difference anymore? Nothing, is what.”</i>");

	processTime(5);

	clearMenu();
	addButton(0, "Comfort", reahaTalkGeneModsWhyComfort);
	addButton(1, "Rebuke", reahaTalkGeneModsWhyRebuke);
}

function reahaTalkGeneModsWhyComfort():void
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
		if (reahaAddiction() >= REAHA_ADDICTION_MED) output("s");
		output(" on her thigh");
	}
	output(".");
	
	output("\n\nShe sighs. <i>“It is, but... thanks, I guess. I didn’t know what I was getting myself into, but I asked for everything that’s happened to me. I get that.");
	if (reahaConfidence() >= REAHA_CONFIDENCE_MID) output(" But I’m glad I have someone like you to make all of this less awful. I couldn’t have wished for a better [pc.master].");
	output("”</i>");
	
	output("\n\nYou pull Reaha into a hug. One that she gladly accepts. <i>“I’m sorry, [pc.master]. I didn’t mean to be a big downer. I’m probably terrible to talk to, right? C’mon, let’s talk about something else... or maybe I could get you a glass of milk?");
	if (reahaConfidence() >= REAHA_CONFIDENCE_HIGH) output(" Mom used to say it’s always best milked for someone you like!");
	output("”</i>");

	processTime(5);

	showReahaTalkMenu(reahaTalkGeneMods);
}

function reahaTalkGeneModsWhyRebuke():void
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

function reahaTalkGeneModsBefore():void
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
		
		output("\n\n<i>“Oh! Really?”</i> she asks, eyes widening. <i>“Uh, yeah, I guess I have some pics around here...”</i> Reaha adds, leaning over the small holoterminal in her quarters and poking a few hovering hardlight buttons. After a moment, the screen flickers to a 3D picture of several uniformed Terran-Space Coalition troops lined up in front of a heavy hover tank, arms locked over each other’s shoulders. You reach over your cow’s shoulders and flick the zoom, scrolling in on a very busty, soft looking girl on the far right of the company... only to see that she’s got brown hair under her helmet, and a much darker complexion that Reaha. ");
		
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
			output("<i>“Sorry, [pc.name],”</i> Reaha says with a little shrug of her shoulders. <i>“I deleted them after I showed them to you. I decided I didn't need any more reminders of who I was.");
			if (reahaConfidence() >= REAHA_CONFIDENCE_HIGH) output(" I like who I am now... thanks to you.");
			else if reahaConfidence() <= REAHA_CONFIDENCE_LOW) output(" I know I should have asked permission first, but... I just wanted them gone. I want to be me now.");
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

function reahaTalkGeneModsBeforeOld():void
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
		if (reahaAddicted() output(", even if I’m an addict and a one-time whore");
	}
	output(". That’s all.”</i>");

	processTime(3);

	showReahaTalkMenu(reahaTalkGeneMods);
}

function reahaTalkGeneModsBeforeNew():void
{
	clearOutput();
	reahaHeader();

	reahaConfidence(10);

	flags["REAHA_TALK_GENEMODS_BEFORE"] = 2;

	output("<i>“She’s cute,”</i> you say, indicating the girl in the pictures. <i>“But you’re cuter,”</i> you say, patting the span of strawberry-blonde hair between Reaha’s little horns. ");
	
	output("\n\nThe little cow makes a soft, mooing sound and smiles up at you. <i>“Thanks. I think so too,”</i> she says, rubbing her head back up against your palm. <i>“I’m glad all this... all these mods weren’t for nothing. I just wanted to be pretty...”</i>");
	
	output("\n\n");
	if (pc.isNice()) output("<i>“You did a good job, then,”</i> you answer, returning her smile.");
	else if (pc.isMischievious()) output("<i>“You’re the cutest cow in the galaxy,”</i> you tease, rubbing one of her nub horns.");
	else output("<i>“You did alright,”</i> you say, patting her head a little firmer. <i>“Managed to get me to buy you, didn’t you?”</i>");

	processTime(3);

	showReahaTalkMenu(reahaTalkGeneMods);
}

function reahaTalkHerLife():void
{
	clearOutput();
	reahaHeader();

	output("<i>“So, what did you do between leaving New Texas and");
	if (pc.isNice()) output("... well, you know");
	else if (pc.isMischievious()) output(" turning into a cute little cow");
	else output(" getting sold into slavery");
	output("?”</i>");
	
	output("\n\n<i>“This!”</i> Reaha answers, turning on a heel and spanking her great big jiggly butt, right on the big anchor tattoo on her cheek. The inked cheek quivers in response to the gentle smack");
	if (reahaAddiction() >= 50) output(", and Reaha gives a little gasp of pleasure from the touch, as if she’d forgotten how sensitive her pleasure patches make her");
	output(". <i>“I’m only twenty-one, you know. I haven’t really done a whole lot besides the army and then the whole whoring thing.”</i>");
	
	output("\n\n<i>“Well, tell me about it,”</i>");
	
	output("\n\nReaha grins, rubbing her tattoo. <i>“Right before I turned eighteen, I hopped ship off of New Texas. Well, stowed away might be a better term for it. I sort of put myself in a box and hoped for the best. Lucky me, when the captain found me, he wasn’t too upset. I guess he understood why I’d want to get out of there. He took me all the way to Earth, no charge. Not like I could have paid him anyway -- I didn’t really have any money. Which was... sort of a problem when I got to Earth. I didn’t have any skills, and I didn’t know anything about anything other than milk and boobies, so I didn’t really know what I was going to do, until the captain said I ought to think about joining the army. He’d been in the navy, he said, and learned to pilot a ship there. ");
	
	output("\n\n<i>“Plus they’d feed, house, and pay me for a couple of years, too. That wasn’t a bad deal, either,”</i> Reaha says with a wry little chuckle. <i>“So yeah, I signed up not long after I hit Terra on a two-year contract. They put me in the infantry, seeing as I didn’t have any particular aptitudes or skills -- but I’m pretty strong and tough, or I was anyway. I didn’t really do anything special while I was in, just another grunt, you know? I was berthed on the </i>Odyssey<i> while she did a tour of the core, brand new flagship straight out of the docks. Made it up to lance corporal after a litte more more than a year. Honestly, I liked being in the army. I don’t know that I’d call it fun, but it was... it was good,”</i> Reaha says, giving you a little shrug. ");
	
	output("\n\n<i>“Why’d you leave, then?”</i>");
	
	output("\n\nShe grimaces. <i>“They told me I wasn’t allowed to use certain kinds of modifications that I wanted. I had the money for them, at least the first set I wanted to get, but the doctors told me I couldn’t. Things like chest enhancers, some of the ones that got rid of my muscle, made me nice and soft. I understand why, but that doesn’t mean I have to like it. So I didn’t sign back on after my two years were up.");
	
	output("\n\n<i>“It wasn’t long after that that I ended up getting pinched by debt collectors. After having to wait so long, I guess I got kind of wild with my mods. I got addicted to taking them, just kept spending more and more until I was just PERFECT... and several thousand in debt. I guess I spent just under a year working for Beth Carver before you");
	if (reahaConfidence() < REAHA_CONFIDENCE_MID) output(" bought me");
	else if (reahaConfidence() < REAHA_CONFIDENCE_HIGH) output(" got me out of there ");
	else output(" rescued me");
	output(".”</i>");
	
	if (reahaConfidence() > REAHA_CONFIDENCE_LOW) output("\n\nReaha grins and presses herself up close to you. <i>“Thanks for that, by the way. Being with you is a hell of a lot better than sitting in Carver’s rape dungeon with my legs spread all day. I’m a lot happier here, [pc.name]. Thank you.");

	processTime(10);

	showReahaTalkMenu(reahaTalkHerLife);
}